// Chơi thử tự động một vai từ 1/10 tới hết 31/10 (giống luồng của game), đếm kết thúc đạt được.
//   node tools/thu-ket-thuc.mjs <mã vai> [số lượt=300] [--bien ten1,ten2]
// Mỗi lượt chọn ngẫu nhiên, một phần lượt "nghiêng" về lựa chọn đầu hoặc cuối để chạm các ngưỡng cao/thấp.
// In: số lần mỗi kết thúc nhân vật, kết thúc sự nghiệp, và khoảng giá trị của các biến riêng của vai.
import fs from "node:fs";
import path from "node:path";
import { createRequire } from "node:module";
const require = createRequire(import.meta.url);
const ink = require("inkjs/dist/ink-full.js");
const { Story } = ink;
// biên dịch thẳng từ file .ink (không đụng public/, nhiều người chạy cùng lúc vẫn an toàn)
function bienDich(file) {
  const root = path.dirname(path.resolve(file)), loiBD = [];
  const opts = new ink.CompilerOptions(file, [], false, (msg, type) => { if (type === 2) loiBD.push(msg); },
    { ResolveInkFilename: n => path.resolve(root, n), LoadInkFileContents: f => fs.readFileSync(f, "utf8") });
  const st = new ink.Compiler(fs.readFileSync(file, "utf8"), opts).Compile();
  if (!st || loiBD.length) { console.error(loiBD.join("\n")); process.exit(1); }
  return st.ToJson();
}

const [ma, soLuotArg, ...rest] = process.argv.slice(2);
if (!ma) { console.error("Cách dùng: node tools/thu-ket-thuc.mjs <mã vai> [số lượt]"); process.exit(1); }
const SO_LUOT = parseInt(soLuotArg || "300", 10);
const bienXem = (rest[rest.indexOf("--bien") + 1] || "").split(",").filter(Boolean);
const jsonVai = bienDich(`story/vi/${ma}.ink`);
const jsonChung = bienDich("story/vi/chung.ink");
const bc = fs.readFileSync("story/vi/chung/bien-chung.ink", "utf8");
const sharedVars = [...bc.matchAll(/^VAR\s+([a-z0-9_]+)/gm)].map(m => m[1]);
const knots = [];
{ const st = new Story(jsonVai);
  for (const name of st.mainContentContainer.namedContent.keys()) {
    if (!name.startsWith(ma + "_")) continue;
    let tags = []; try { tags = (st.TagsForContentAtPath(name) || []).map(t => t.trim()).filter(Boolean); } catch {}
    knots.push({ name, tags });
  } }
const fBien = `story/vi/${ma}/bien.ink`;
const roleVars = fs.existsSync(fBien) ? [...fs.readFileSync(fBien, "utf8").matchAll(/^VAR[ \t]+([a-z0-9_]+)/gm)].map(m => m[1]) : [];

const tag = (tags, key) => { const t = (tags || []).find(t => t === key || t.startsWith(key + ":")); return t == null ? null : (t.includes(":") ? t.slice(key.length + 1).trim() : true); };
const gioSo = g => { if (!g) return 9999; const m = String(g).match(/(\d{1,2}):(\d{2})/); return m ? (+m[1]) * 60 + (+m[2]) : 9999; };
function dieuKien(expr, story) {
  const e = String(expr).trim();
  if (!/^[a-z0-9_ <>=!&|()]+$/i.test(e)) return null;
  const js = e.replace(/[a-z_][a-z0-9_]*/gi, w => w === "and" ? "&&" : w === "or" ? "||" : w === "not" ? "!" : (w === "true" || w === "false") ? w : `__v(${JSON.stringify(w)})`);
  try { return !!Function("__v", `return (${js});`)(w => story.variablesState[w]); } catch { return null; }
}
function canhTrongNgay(ngay, story) {
  return knots.filter(k => tag(k.tags, "ngay") == String(ngay))
    .filter(k => k.name !== `${ma}_3010_danh_gia` && !/_mg_|_kt_|minigame/.test(k.name))
    .filter(k => !["npc", "ngau_nhien", "minigame", "ket_qua", "ket_thuc", "danh_gia", "danh_gia_ket_thuc", "mot_thang_sau"].some(t => tag(k.tags, t) != null))
    .filter(k => { const dk = tag(k.tags, "dieu_kien"); if (dk == null) return true; if (dk === "sau_dem_hong") return false; return dieuKien(dk, story) === true; })
    .sort((a, b) => gioSo(tag(a.tags, "gio")) - gioSo(tag(b.tags, "gio"))).map(k => k.name);
}
const dongBo = (tu, den) => { for (const n of sharedVars) { try { const v = tu.variablesState[n]; if (v !== undefined && typeof v !== "object") den.variablesState[n] = v; } catch {} } };

const loi = new Map();
function chay(story, ten, chon) {
  const visited = new Set();
  try { story.ChoosePathString(ten); } catch (e) { loi.set(ten, String(e.message || e)); return visited; }
  for (let buoc = 0; buoc < 400; buoc++) {
    while (story.canContinue) {
      try { story.Continue(); } catch (e) { loi.set(ten, String(e.message || e)); return visited; }
      const p = story.state.currentPathString; if (p) visited.add(p.split(".")[0]);
    }
    const c = story.currentChoices; if (!c.length) break;
    story.ChooseChoiceIndex(chon(c.length));
  }
  return visited;
}
function minigame(visited) {
  const names = knots.map(k => k.name);
  for (const k of visited) {
    if (!/_mg_|minigame/.test(k) || /_(thang|thanh_cong|dat|thua|that_bai|truot)$/.test(k)) continue;
    const base = k.replace(/_(mo_dau|mo)$/, "");
    const ra = names.filter(n => n.startsWith(base + "_") && n !== k && !/_(mo_dau|mo)$/.test(n));
    if (ra.length) return ra;
  }
  return null;
}

const dem = {}, demSN = {}, khoang = {};
const bienVai = [...roleVars, ...bienXem, "nguoi_theo_doi"];
for (let l = 0; l < SO_LUOT; l++) {
  const kieu = l % 4; // 0,1 ngẫu nhiên · 2 nghiêng lựa chọn đầu · 3 nghiêng lựa chọn cuối
  const chon = n => kieu === 2 && Math.random() < 0.7 ? 0 : kieu === 3 && Math.random() < 0.7 ? n - 1 : Math.floor(Math.random() * n);
  const s = new Story(jsonVai); s.variablesState["vai"] = ma;
  for (let ngay = 1; ngay <= 31; ngay++) {
    s.variablesState["ngay"] = ngay;
    if (ngay > 1) {
      const tt = Number(s.variablesState["tinh_than_cong_ty"]) || 50;
      s.variablesState["nguoi_theo_doi"] += (tt >= 70 ? 20000 : tt <= 30 ? 5000 : 12000) + 5000 + Math.round(Math.random() * 10000);
    }
    const cd = { 6: 30000, 9: 40000, 16: 80000, 23: 60000 }[ngay]; if (cd) s.variablesState["nguoi_theo_doi"] += cd;
    for (const ten of canhTrongNgay(ngay, s)) {
      const k = knots.find(x => x.name === ten); const m = String(tag(k.tags, "gio") || "").match(/(\d{1,2}):(\d{2})/);
      if (m) { s.variablesState["gio"] = +m[1]; s.variablesState["phut"] = +m[2]; }
      const v = chay(s, ten, chon);
      const mg = minigame(v); if (mg && Math.random() < 0.8) chay(s, mg[Math.floor(Math.random() * mg.length)], chon);
    }
    if (ngay < 31) for (const k of knots.filter(k => tag(k.tags, "npc") != null)) if (Math.random() < 0.08) chay(s, k.name, chon);
  }
  const c = new Story(jsonChung); dongBo(s, c); c.variablesState["vai"] = ma;
  chay(c, "chung_3110_dem_hong", chon); dongBo(c, s);
  chay(s, `${ma}_3010_danh_gia`, chon); dongBo(s, c);
  chay(c, "chung_3110_ket_thuc_su_nghiep", chon);
  const kt = s.variablesState["ket_thuc_nhan_vat"] || "(trống)", sn = c.variablesState["ket_thuc_su_nghiep"] || "(trống)";
  dem[kt] = (dem[kt] || 0) + 1; demSN[sn] = (demSN[sn] || 0) + 1;
  for (const b of bienVai) { let v; try { v = s.variablesState[b]; } catch {} if (typeof v !== "number") continue; const r = khoang[b] ||= [v, v, 0]; r[0] = Math.min(r[0], v); r[1] = Math.max(r[1], v); r[2] += v; }
}
// các kết thúc khai báo trong truyện (thẻ ket_thuc:<mã> trên cảnh kết thúc)
const khaiBao = [...new Set(knots.map(k => tag(k.tags, "ket_thuc")).filter(x => x && x !== true))];
console.log(`Vai ${ma}: ${SO_LUOT} lượt`);
console.log("Kết thúc nhân vật:");
for (const id of new Set([...khaiBao.map(x => x.startsWith("ket_thuc_") ? x : x), ...Object.keys(dem)])) console.log(`  ${String(dem[id] || 0).padStart(5)}  ${id}`);
console.log("Kết thúc sự nghiệp:"); for (const [k, v] of Object.entries(demSN)) console.log(`  ${String(v).padStart(5)}  ${k}`);
console.log("Biến (nhỏ nhất / lớn nhất / trung bình):");
for (const [b, [a, z, t]] of Object.entries(khoang)) console.log(`  ${b}: ${a} / ${z} / ${Math.round(t / SO_LUOT)}`);
if (loi.size) { console.log("Lỗi khi chạy:"); for (const [k, e] of loi) console.log(`  ${k}: ${e.slice(0, 200)}`); }
