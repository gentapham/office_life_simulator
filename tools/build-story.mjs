// Biên dịch toàn bộ truyện Ink sang JSON để game đọc trong trình duyệt.
// Kết quả: public/story/vi/<mã>.json và public/story/meta.json
//   node tools/build-story.mjs
import fs from "node:fs";
import path from "node:path";
import { createRequire } from "node:module";

const require = createRequire(import.meta.url);
const ink = require("inkjs/dist/ink-full.js");

const SRC = "story/vi";
const OUT = "public/story/vi";
fs.mkdirSync(OUT, { recursive: true });

function compile(file) {
  const root = path.dirname(path.resolve(file));
  const errors = [];
  const opts = new ink.CompilerOptions(
    file, [], false,
    (msg, type) => { if (type === 2) errors.push(msg); },
    { ResolveInkFilename: n => path.resolve(root, n), LoadInkFileContents: f => fs.readFileSync(f, "utf8") }
  );
  const story = new ink.Compiler(fs.readFileSync(file, "utf8"), opts).Compile();
  if (!story || errors.length) throw new Error(`${file}\n${errors.join("\n")}`);
  return story.ToJson();
}

// Tên các biến chung (đồng bộ giữa truyện nhân vật và truyện chung)
const sharedVars = [...fs.readFileSync(path.join(SRC, "chung/bien-chung.ink"), "utf8").matchAll(/^VAR\s+([a-z0-9_]+)/gm)].map(m => m[1]);
const sharedLists = [...fs.readFileSync(path.join(SRC, "chung/bien-chung.ink"), "utf8").matchAll(/^LIST\s+([a-z0-9_]+)/gm)].map(m => m[1]);

const meta = { sharedVars, sharedLists, roles: {} };
const MA_NV = new Set(["ran_doc","giam_doc","truong_phong","thanh_ninh","hong_hot","con_ong_chau_cha","chua_te_deadline","thuc_tap_sinh","ke_toan","hr","it","idol_het_thoi","quan_ly_idol","bien_kich","editor","designer","sales","chi_dai","dan_dau_tu","thanh_xin_nghi","bac_bao_ve","sieu_nhan_hong","cho"]);
const roots = fs.readdirSync(SRC).filter(f => f.endsWith(".ink")).map(f => f.slice(0, -4)).sort();

for (const code of roots) {
  const json = compile(path.join(SRC, code + ".ink"));
  fs.writeFileSync(path.join(OUT, code + ".json"), json);
  const story = new ink.Story(json);
  const prefix = code === "chung" ? "chung_" : code + "_";
  const knots = [];
  for (const name of story.mainContentContainer.namedContent.keys()) {
    if (!name.startsWith(prefix)) continue;
    let tags = [];
    try { tags = (story.TagsForContentAtPath(name) || []).map(t => t.trim()).filter(Boolean); } catch { tags = []; }
    knots.push({ name, tags });
  }
  // người nói đầu tiên của mỗi cảnh (game 3D cho NPC đó đứng ở chỗ diễn ra cảnh, tới gần mới mở thoại)
  // kho chung: chỉ sự kiện bất ngờ (người chơi là ai thì bỏ khỏi danh sách lúc chơi)
  for (const k of knots) {
    if (code === "chung" && !k.tags.includes("ngau_nhien")) continue;
    try {
      const st = new ink.Story(json); st.variablesState["vai"] = code === "chung" ? "ran_doc" : code;
      st.ChoosePathString(k.name);
      const ds = [];
      for (let i = 0; i < 30 && st.canContinue && ds.length < 3; i++) {
        const m = st.Continue().match(/^([a-z_]+):\s/);
        if (m && MA_NV.has(m[1]) && m[1] !== code && !ds.includes(m[1])) ds.push(m[1]);
      }
      if (ds.length) k.noi = ds;
    } catch {}
  }
  // Biến riêng của nhân vật (khai báo trong <mã>/bien.ink)
  let roleVars = [];
  const bien = path.join(SRC, code, "bien.ink");
  if (fs.existsSync(bien)) {
    roleVars = [...fs.readFileSync(bien, "utf8").matchAll(/^VAR[ \t]+([a-z0-9_]+)[ \t]*=[ \t]*(.+?)[ \t]*(?:\/\/[ \t]*(.*))?$/gm)]
      .map(m => ({ name: m[1], init: m[2], note: (m[3] || "").trim() }));
  }
  meta.roles[code] = { knots, roleVars };
  console.log(`✅ ${code}: ${knots.length} cảnh, ${(json.length / 1024).toFixed(0)} KB`);
}

// Tên kết thúc có dấu: lấy các **Tên** in đậm trong tài liệu, so với mã không dấu ở tag ket_thuc
const khongDau = t => t.normalize("NFD").replace(/[\u0300-\u036f]/g, "").replace(/đ/g, "d").replace(/Đ/g, "D")
  .toLowerCase().replace(/[^a-z0-9]+/g, "_").replace(/^_|_$/g, "")
  .replace(/dai_nhac_hoi_sieu_nhan|dai_nhac_hoi/g, "dem_hong"); // tên mới của đêm diễn, mã kết thúc vẫn dùng dem_hong
meta.tenKetThuc = {};
for (const code of Object.keys(meta.roles)) {
  const doc = code === "chung" ? "docs/GDD.md" : `docs/roles/${code.replace(/_/g, "-")}.md`;
  if (!fs.existsSync(doc)) continue;
  const ten = new Map([...fs.readFileSync(doc, "utf8").matchAll(/\*\*([^*]+)\*\*/g)].map(m => [khongDau(m[1]), m[1].trim()]));
  const ids = new Set();
  for (const k of meta.roles[code].knots) {
    const kt = k.name.match(/_kt_(\w+)$/);
    if (kt) ids.add(kt[1]);
    for (const t of k.tags) { const m = t.match(/^ket_thuc(?:_su_nghiep)?:(\w+)/); if (m) ids.add(m[1]); }
  }
  for (const id of ids) {
    let t = ten.get(id);
    if (!t) for (const [k, v] of ten) if (k.length > 3 && (k.includes(id) || id.includes(k))) { t = v; break; }
    if (t) meta.tenKetThuc[id] = t;
  }
}
console.log(`Tên kết thúc tìm được: ${Object.keys(meta.tenKetThuc).length}`);

fs.writeFileSync("public/story/meta.json", JSON.stringify(meta));
fs.copyFileSync("story/ten-nguoi-noi.json", "public/story/ten-nguoi-noi.json");
console.log("Xong: public/story/meta.json");
