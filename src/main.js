// Bản đọc thử: chơi toàn bộ thoại Ink theo từng ngày của tháng 10/2026.
import { Story } from "inkjs/dist/ink-es6.js";
import { NHAN_VAT, THEO_MA, thuCuaNgay, SU_KIEN_NGAY } from "./nhan-vat.js";
import { DIA_DIEM } from "./dia-diem.js";

const app = document.getElementById("app");
const SAVE_KEY = "owfad_doc_thu_v1";
const MUC_TIEU = 1000000;

let META = null;          // public/story/meta.json
let TEN_PHU = null;       // public/story/ten-nguoi-noi.json
const JSON_CACHE = {};    // mã -> json truyện đã tải

// ---------- Tiện ích ----------
// Giao diện không dùng emoji: lọc hết emoji trong chữ hiển thị (kể cả trong thoại Ink)
const boEmoji = s => String(s).replace(/[\p{Extended_Pictographic}\u{FE0F}\u{200D}\u{20E3}\u{1F3FB}-\u{1F3FF}]/gu, "").replace(/ {2,}/g, " ").replace(/^\s+/, "");
const esc = s => String(s).replace(/[&<>"]/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
const h = (tag, attrs = {}, ...kids) => {
  const el = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs)) {
    if (k === "class") el.className = v;
    else if (k.startsWith("on")) el.addEventListener(k.slice(2), v);
    else if (k === "html") el.innerHTML = v;
    else if (v !== false && v != null) el.setAttribute(k, v === true ? "" : v);
  }
  for (const kid of kids.flat()) if (kid != null && kid !== false) el.append(kid instanceof Node ? kid : document.createTextNode(boEmoji(kid)));
  return el;
};
const vnd = n => (Math.round(Number(n) || 0)).toLocaleString("vi-VN") + "đ";
const so = n => (Math.round(Number(n) || 0)).toLocaleString("vi-VN");
const tag = (tags, key) => { const t = (tags || []).find(t => t === key || t.startsWith(key + ":")); return t == null ? null : (t.includes(":") ? t.slice(key.length + 1).trim() : true); };
const gioSo = g => { if (!g) return 9999; const m = String(g).match(/(\d{1,2}):(\d{2})/); return m ? (+m[1]) * 60 + (+m[2]) : 9999; };
const prettyNoi = s => s ? (DIA_DIEM[s] || s.replace(/_/g, " ").replace(/^./, c => c.toUpperCase())) : "";
const saveLoad = () => { try { return JSON.parse(localStorage.getItem(SAVE_KEY) || "null"); } catch { return null; } };
const saveWrite = v => { try { v ? localStorage.setItem(SAVE_KEY, JSON.stringify(v)) : localStorage.removeItem(SAVE_KEY); } catch {} };

async function loadMeta() {
  if (META) return;
  const [m, t] = await Promise.all([fetch("./story/meta.json").then(r => r.json()), fetch("./story/ten-nguoi-noi.json").then(r => r.json())]);
  META = m; TEN_PHU = t;
}
async function loadStoryJson(ma) {
  if (!JSON_CACHE[ma]) JSON_CACHE[ma] = await fetch(`./story/vi/${ma}.json`).then(r => r.text());
  return JSON_CACHE[ma];
}

// Tên người nói
function tenNguoiNoi(code, story) {
  if (THEO_MA[code]) {
    let v; try { v = story.variablesState[code]; } catch {}
    return { ten: v || THEO_MA[code].ten, icon: THEO_MA[code].icon };
  }
  const alias = TEN_PHU.bi_danh[code] || code;
  const n = TEN_PHU.nguoi_noi[alias];
  if (n) return { ten: n.vi, icon: "💬" };
  return null;
}

// Đánh giá điều kiện đơn giản trong thẻ dieu_kien (vd "ch_len_xe_vung_tau and not ch_lac_vung_tau", "bk_do_lo>=100")
function danhGiaDieuKien(expr, story) {
  if (!expr || expr === true) return false;
  const e = String(expr).trim();
  if (!/^[a-z0-9_ <>=!&|()]+$/i.test(e)) return null;
  const words = e.match(/[a-z_][a-z0-9_]*/gi) || [];
  const js = e.replace(/[a-z_][a-z0-9_]*/gi, w => {
    if (w === "and") return "&&"; if (w === "or") return "||"; if (w === "not") return "!";
    if (w === "true" || w === "false") return w;
    return `__v(${JSON.stringify(w)})`;
  });
  for (const w of words) {
    if (["and", "or", "not", "true", "false"].includes(w)) continue;
    let v; try { v = story.variablesState[w]; } catch { v = undefined; }
    if (v === undefined || v === null || typeof v === "object") return null;
  }
  try {
    // eslint-disable-next-line no-new-func
    return !!Function("__v", `return (${js});`)(w => story.variablesState[w]);
  } catch { return null; }
}

// ============================================================
// MÀN HÌNH CHÍNH: CHỌN NHÂN VẬT
// ============================================================
function renderHome() {
  const save = saveLoad();
  app.replaceChildren(
    h("div", { class: "wrap" },
      h("header", { class: "top" },
        h("div", { class: "brand" }, h("small", {}, "Office Worker For A Day"), h("b", {}, "Giả Lập Một Ngày Làm Nhân Viên Văn Phòng")),
      ),
      h("section", { class: "hero" },
        h("h1", {}, "Chọn một người để đi làm ở G-Entertainment"),
        h("p", {}, "Mục tiêu chung của cả công ty: đưa Siêu Nhân Hồng lên 1 triệu người theo dõi trước Đêm Hồng Halloween."),
        h("span", { class: "note16" }, h("b", {}, "16+"), "Có nhậu, đánh ghen, nợ nần và ngôn ngữ văn phòng."),
      ),
      save ? h("div", { class: "resume" },
        h("span", {}, `Đang chơi dở: ${THEO_MA[save.ma] ? THEO_MA[save.ma].vai + " (" + THEO_MA[save.ma].ten + ")" : save.ma}, ngày ${save.ngay}/10.`),
        h("span", { class: "top-actions" },
          h("button", { class: "btn primary", onclick: () => openRole(save.ma, { tiepTuc: true }) }, "Chơi tiếp"),
          h("button", { class: "btn ghost", onclick: () => { saveWrite(null); renderHome(); } }, "Xóa bản lưu"),
        )) : null,
      h("div", { class: "grid" },
        NHAN_VAT.map(n => h("button", { class: "card", onclick: () => openRole(n.ma) },
          h("span", { class: "rl" }, n.vai), h("span", { class: "nm" }, n.ten), h("span", { class: "jb" }, n.chuc))),
        h("button", { class: "card special", onclick: () => openChung() },
          h("span", { class: "rl" }, "Nội dung chung"), h("span", { class: "nm" }, "Sự kiện, tin đồn"), h("span", { class: "jb" }, "Mở đầu, nói vu vơ, Đêm Hồng")),
      ),
    ),
  );
  window.scrollTo(0, 0);
}

// ============================================================
// MỘT LƯỢT CHƠI CỦA NHÂN VẬT
// ============================================================
class LuotChoi {
  constructor(ma, json) {
    this.ma = ma;
    this.json = json;
    this.story = new Story(json);
    this.story.variablesState["vai"] = ma;
    this.knots = META.roles[ma].knots;
    this.roleVars = META.roles[ma].roleVars;
    this.ngay = 1;
    this.queue = [];
    this.qi = 0;
    this.played = new Set();
    this.npcDone = new Set();
    this.dichTiengNguoi = true;
  }
  toSave() {
    return { ma: this.ma, ngay: this.ngay, queue: this.queue, qi: this.qi, played: [...this.played], npcDone: [...this.npcDone], state: this.story.state.ToJson() };
  }
  fromSave(s) {
    this.ngay = s.ngay; this.queue = s.queue; this.qi = s.qi;
    this.played = new Set(s.played); this.npcDone = new Set(s.npcDone || []);
    this.story.state.LoadJson(s.state);
  }
  v(name) { try { return this.story.variablesState[name]; } catch { return undefined; } }
  set(name, val) { try { this.story.variablesState[name] = val; } catch {} }

  // Cảnh chính của một ngày
  canhTrongNgay(ngay) {
    const evalName = `${this.ma}_3010_danh_gia`;
    return this.knots
      .filter(k => tag(k.tags, "ngay") == String(ngay))
      .filter(k => k.name !== evalName && !/_mg_|_kt_|minigame/.test(k.name))
      .filter(k => !["npc", "ngau_nhien", "minigame", "ket_qua", "ket_thuc", "danh_gia", "danh_gia_ket_thuc", "mot_thang_sau"].some(t => tag(k.tags, t) != null))
      .filter(k => {
        const dk = tag(k.tags, "dieu_kien");
        if (dk == null) return true;
        if (dk === "sau_dem_hong") return false;
        return danhGiaDieuKien(dk, this.story) === true;
      })
      .sort((a, b) => gioSo(tag(a.tags, "gio")) - gioSo(tag(b.tags, "gio")))
      .map(k => k.name);
  }
  npcKnots() { return this.knots.filter(k => tag(k.tags, "npc") != null); }

  // Việc của game mỗi sáng: lương, người theo dõi tự nhiên, sự kiện cố định
  batDauNgay(ngay) {
    this.ngay = ngay;
    this.set("ngay", ngay);
    const ghiChu = [];
    if (ngay > 1) {
      const tt = Number(this.v("tinh_than_cong_ty")) || 50;
      const tang = tt >= 70 ? 20000 : tt <= 30 ? 5000 : 12000;
      const npc = 5000 + Math.round(Math.random() * 10000);
      this.set("nguoi_theo_doi", (Number(this.v("nguoi_theo_doi")) || 0) + tang + npc);
    }
    const coDinh = { 9: 40000, 16: 80000, 23: 60000 }[ngay];
    if (coDinh) { this.set("nguoi_theo_doi", (Number(this.v("nguoi_theo_doi")) || 0) + coDinh); ghiChu.push(`Sự kiện cố định: +${so(coDinh)} người theo dõi`); }
    const luong = THEO_MA[this.ma]?.luong || 0;
    if (ngay === 12 && luong) { this.set("tien", (Number(this.v("tien")) || 0) + luong); ghiChu.push(`Lương tháng về (trễ 2 ngày): +${vnd(luong)}`); }
    // qua đêm: bản đọc thử chưa có ăn uống nên coi như tự ăn tối, chỉ số chỉ tụt nhẹ, không xuống dưới 50
    if (ngay > 1) {
      this.set("no", Math.max(50, (Number(this.v("no")) || 0) - 20));
      this.set("khat", Math.max(50, (Number(this.v("khat")) || 0) - 25));
      this.set("nang_luong", 100);
    }
    this.queue = this.canhTrongNgay(ngay);
    this.qi = 0;
    return ghiChu;
  }
}

// ---------- Giao diện màn chơi ----------
let L = null;           // lượt chơi hiện tại
let UI = {};            // các phần tử đang hiển thị
let timerHandle = null;

async function openRole(ma, opts = {}) {
  app.replaceChildren(h("div", { class: "wrap" }, h("p", {}, "Đang tải truyện…")));
  await loadMeta();
  const json = await loadStoryJson(ma);
  L = new LuotChoi(ma, json);
  const save = saveLoad();
  if (opts.tiepTuc && save && save.ma === ma) L.fromSave(save);
  renderRole(opts.tiepTuc && save && save.ma === ma ? "choi" : "gioi_thieu");
}

function renderRole(tab) {
  const n = THEO_MA[L.ma];
  const tabs = [["choi", "Chơi cả tháng"], ["duyet", "Duyệt từng cảnh"]];
  const body = h("div", {});
  app.replaceChildren(
    h("div", { class: "wrap" },
      h("header", { class: "top" },
        h("div", { class: "role-head" }, h("div", {}, h("h2", {}, `${n.vai}: ${n.ten}`), h("p", {}, n.chuc))),
        h("div", { class: "top-actions" },
          h("div", { class: "tabs", role: "tablist" }, tabs.map(([id, label]) =>
            h("button", { class: "btn", role: "tab", "aria-selected": String(tab === id || (tab === "gioi_thieu" && id === "choi")), onclick: () => renderRole(id) }, label))),
          h("button", { class: "btn ghost", onclick: renderHome }, "← Đổi nhân vật"),
        ),
      ),
      body,
    ),
  );
  if (tab === "duyet") renderBrowser(body);
  else if (tab === "gioi_thieu") renderIntro(body);
  else renderPlay(body);
  window.scrollTo(0, 0);
}

function renderIntro(body) {
  const n = THEO_MA[L.ma];
  const chinh = L.knots.filter(k => tag(k.tags, "ngay") != null).length;
  body.append(h("section", { class: "stage" },
    h("div", { class: "dayline" }, h("b", {}, "Bắt đầu"), h("span", {}, "Thứ 5, 1/10/2026")),
    h("div", { class: "log" },
      h("p", { class: "narr" }, `Bạn sẽ sống 31 ngày trong vai ${n.vai} ${n.ten}. Mỗi ngày có các cảnh chính theo giờ. Hết cảnh trong ngày, bạn có thể nói chuyện thêm với đồng nghiệp rồi đi ngủ.`),
      h("p", { class: "narr" }, `Nhân vật này có ${L.knots.length} cảnh (${chinh} cảnh gắn ngày).`),
      h("p", { class: "narr" }, "Tối 31/10 là Đêm Hồng: hiện kết thúc của nhân vật, rồi kết thúc sự nghiệp của Siêu Nhân Hồng."),
    ),
    h("div", { class: "choices" },
      h("button", { class: "choice", onclick: () => { saveWrite(null); const g = L.batDauNgay(1); renderRole("choi"); g.forEach(x => addSys(x)); nextScene(); } }, "▶ Bắt đầu ngày 1/10"),
    ),
  ));
}

function renderPlay(body) {
  UI.dayline = h("div", { class: "dayline" });
  UI.log = h("div", { class: "log", "aria-live": "polite" });
  UI.choices = h("div", { class: "choices" });
  UI.side = h("aside", { class: "side" });
  body.append(h("div", { class: "layout" }, h("section", { class: "stage" }, UI.dayline, UI.log, UI.choices), UI.side));
  updateDayline();
  updateSide();
  if (L.qi === 0 && L.queue.length === 0 && L.ngay === 1 && !L.played.size) { const g = L.batDauNgay(1); g.forEach(x => addSys(x)); }
  nextScene();
}

function updateDayline(gio, noi) {
  if (!UI.dayline) return;
  const ev = SU_KIEN_NGAY[L.ngay];
  UI.dayline.replaceChildren(
    h("b", {}, `${thuCuaNgay(L.ngay)}, ${L.ngay}/10${gio ? " · " + gio : ""}`),
    h("span", {}, [noi ? prettyNoi(noi) : null, ev].filter(Boolean).join(" · ")),
  );
}

function updateSide() {
  if (!UI.side) return;
  const st = L.story;
  const v = n => Number(L.v(n)) || 0;
  const bar = (label, val, max = 100, cls = "") => h("div", { class: "stat" }, h("span", {}, label), h("span", {}, so(val)), h("div", { class: "bar " + cls }, h("i", { style: `width:${Math.max(0, Math.min(100, val / max * 100))}%` })));
  const theoDoi = v("nguoi_theo_doi");
  // chỉ hiện chỉ số có chú thích (biến nội bộ không chú thích thì ẩn); chú thích bỏ phần giải thích sau dấu ":" hoặc "("
  const roleNum = L.roleVars.filter(x => /^-?\d+$/.test(x.init) && x.note && !/^-/.test(x.note)).slice(0, 10)
    .map(x => ({ ...x, nhan: boEmoji(x.note).split(/[:(.]/)[0].trim().replace(/^./, c => c.toUpperCase()) }));
  const qh = NHAN_VAT.filter(n => n.ma !== L.ma).map(n => [n, v("qh_" + n.ma)]).filter(([, x]) => x !== 0).sort((a, b) => Math.abs(b[1]) - Math.abs(a[1])).slice(0, 8);
  UI.side.replaceChildren(...[
    h("div", { class: "panel" }, h("h3", {}, "Siêu Nhân Hồng"),
      bar(`Người theo dõi (mục tiêu ${so(MUC_TIEU)})`, theoDoi, MUC_TIEU, "pink"),
      h("div", { class: "kv" }, h("span", {}, "Tinh thần công ty"), h("span", {}, so(v("tinh_than_cong_ty"))), h("span", {}, "Scandal"), h("span", {}, so(v("so_scandal"))))),
    h("div", { class: "panel" }, h("h3", {}, "Bản thân"),
      h("div", { class: "kv" }, h("span", {}, "Tiền"), h("span", {}, vnd(v("tien"))), h("span", {}, "Uy tín"), h("span", {}, so(v("uy_tin")))),
      bar("No", v("no")), bar("Khát", v("khat")), bar("Năng lượng", v("nang_luong")), bar("Stress", v("stress"), 100, "bad")),
    roleNum.length ? h("div", { class: "panel" }, h("h3", {}, "Chỉ số riêng"),
      h("div", { class: "kv" }, roleNum.flatMap(x => [h("span", { title: x.note }, x.nhan || x.name), h("span", {}, String(L.v(x.name)))]))) : null,
    qh.length ? h("div", { class: "panel" }, h("h3", {}, "Quan hệ"),
      h("div", { class: "kv" }, qh.flatMap(([n, x]) => [h("span", {}, `${L.v(n.ma) || n.ten}`), h("span", { style: `color:var(${x > 0 ? "--good" : "--bad"})` }, (x > 0 ? "+" : "") + x)]))) : null,
    h("div", { class: "panel" },
      h("label", { class: "hint" }, h("input", { type: "checkbox", checked: L.dichTiengNguoi, onchange: e => { L.dichTiengNguoi = e.target.checked; } }), " Hiện phụ đề (dịch tiếng người, khi chơi Tuất)"),
      h("button", { class: "btn ghost", onclick: () => { saveWrite(null); openRole(L.ma); } }, "Chơi lại từ đầu")),
  ].filter(Boolean));
}

function scrollLog() { UI.log.scrollTop = UI.log.scrollHeight; }
function addSys(text) { UI.log.append(h("div", { class: "scene-tag" }, text)); scrollLog(); }

function renderLine(text, tags, story, playerCode) {
  const t = text.trim();
  if (!t) return;
  const phuDe = tag(tags, "phu_de");
  if (/^_.*_$/.test(t)) {
    UI.log.append(h("p", { class: "narr" }, t.slice(1, -1)));
  } else {
    const m = t.match(/^([a-z][a-z0-9_]*):\s?(.*)$/);
    const who = m ? tenNguoiNoi(m[1], story) : null;
    if (m && who) {
      const say = esc(boEmoji(m[2])).replace(/\*\(([^)]*)\)\*/g, '<span class="act">($1)</span>');
      const el = h("div", { class: "line" + (m[1] === playerCode ? " me" : "") },
        h("span", { class: "who" }, who.ten),
        h("div", { class: "say", html: say }));
      if (phuDe && phuDe !== true && L?.dichTiengNguoi !== false) el.append(h("div", { class: "sub" }, "Phụ đề: " + phuDe));
      UI.log.append(el);
    } else {
      const el = h("p", { class: "narr", html: esc(t).replace(/\*\(([^)]*)\)\*/g, "($1)") });
      el.style.fontStyle = "normal";
      if (phuDe && phuDe !== true && L?.dichTiengNguoi !== false) el.append(h("div", { class: "sub" }, "Phụ đề: " + phuDe));
      UI.log.append(el);
    }
  }
}

// Chạy truyện tới khi gặp lựa chọn hoặc hết cảnh
function runStory(story, playerCode, onEnd) {
  clearInterval(timerHandle);
  UI.choices.replaceChildren();
  let henGio = null;
  const visited = new Set();
  const step = () => {
    while (story.canContinue) {
      const text = story.Continue();
      const tags = (story.currentTags || []).map(x => x.trim());
      const p = story.state.currentPathString; if (p) visited.add(p.split(".")[0]);
      const hg = tag(tags, "hen_gio"); if (hg) henGio = parseInt(hg, 10) || 5;
      renderLine(text, tags, story, playerCode);
    }
    updateSide && L && story === L.story && updateSide();
    scrollLog();
    const choices = story.currentChoices;
    if (!choices.length) { onEnd(visited); return; }
    UI.choices.replaceChildren();
    if (henGio) {
      const total = henGio; let left = total;
      const bar = h("i", { style: "width:100%" });
      UI.choices.append(h("div", { class: "timer", "aria-label": `Còn ${left} giây` }, bar));
      timerHandle = setInterval(() => {
        left -= 0.2; bar.style.width = Math.max(0, left / total * 100) + "%";
        if (left <= 0) {
          clearInterval(timerHandle);
          const idx = choices.findIndex(c => c.text.trim().startsWith("⏱️"));
          pick(idx >= 0 ? idx : choices.length - 1);
        }
      }, 200);
      henGio = null;
    }
    choices.forEach((c, i) => UI.choices.append(h("button", { class: "choice", onclick: () => pick(i) }, c.text)));
  };
  const pick = i => {
    clearInterval(timerHandle);
    const c = story.currentChoices[i];
    UI.log.append(h("div", { class: "chosen" }, "→ " + c.text.replace(/^\[|\]$/g, "")));
    story.ChooseChoiceIndex(i);
    step();
  };
  step();
}

// Minigame: tìm các cảnh thắng/thua cùng gốc với cảnh mở đầu vừa đi qua
function timMinigame(visited) {
  const names = new Set(L.knots.map(k => k.name));
  for (const k of visited) {
    if (!/_mg_|minigame/.test(k)) continue;
    if (/_(thang|thanh_cong|dat|thua|that_bai|truot)$/.test(k)) continue;
    const base = k.replace(/_(mo_dau|mo)$/, "");
    const ra = [...names].filter(n => n.startsWith(base + "_") && n !== k && !/_(mo_dau|mo)$/.test(n));
    if (ra.length) return { base, ra };
  }
  return null;
}

function nextScene() {
  saveWrite(L.toSave());
  if (L.qi < L.queue.length) {
    const name = L.queue[L.qi++];
    playKnot(name, () => afterScene());
    return;
  }
  dayEnd();
}

function playKnot(name, done) {
  const k = L.knots.find(x => x.name === name);
  const gio = tag(k?.tags, "gio"); const noi = tag(k?.tags, "noi");
  if (gio && gio !== true) { const m = String(gio).match(/(\d{1,2}):(\d{2})/); if (m) { L.set("gio", +m[1]); L.set("phut", +m[2]); } }
  updateDayline(gio && gio !== true ? gio : null, noi && noi !== true ? noi : null);
  L.played.add(name);
  try {
    L.story.ChoosePathString(name);
  } catch (e) { addSys(`(Không mở được cảnh ${name})`); done(new Set()); return; }
  runStory(L.story, L.ma, visited => done(visited));
}

function afterScene(visited = new Set()) {
  // Cảnh có thể dẫn vào minigame: cho người chơi tự chọn kết quả
  const mg = timMinigame(visited);
  saveWrite(L.toSave());
  if (mg) {
    UI.choices.replaceChildren(
      h("p", { class: "hint" }, "Chọn kết quả minigame:"),
      mg.ra.map(n => h("button", { class: "choice", onclick: () => playKnot(n, v => afterScene(v)) },
        (/_(thua|that_bai|truot)$/.test(n) ? "Thua: " : "Thắng: ") + n.slice(mg.base.length + 1).replace(/_/g, " "))),
      h("button", { class: "choice", onclick: () => nextScene() }, "Bỏ qua minigame"),
    );
    return;
  }
  UI.choices.replaceChildren(h("button", { class: "choice", onclick: () => nextScene() }, "Tiếp tục ▸"));
}

function dayEnd() {
  if (L.ngay >= 31) { finale(); return; }
  const npcs = L.npcKnots().filter(k => !L.npcDone.has(k.name));
  UI.choices.replaceChildren(
    h("p", { class: "hint" }, `Hết các cảnh chính của ngày ${L.ngay}/10.`),
    npcs.length ? h("details", {},
      h("summary", {}, "Nói chuyện thêm với đồng nghiệp"),
      h("div", { class: "klist" }, npcs.map(k => {
        const ma = tag(k.tags, "npc"); const n = THEO_MA[ma];
        return h("button", { class: "btn", onclick: () => { L.npcDone.add(k.name); addSys(`Nói chuyện với ${L.v(ma) || n?.ten || ma}`); playKnot(k.name, v => { afterScene(v); UI.choices.replaceChildren(h("button", { class: "choice", onclick: dayEnd }, "Xong ▸")); }); } },
          `${L.v(ma) || n?.ten || ma}`);
      }))) : null,
    h("button", { class: "choice", onclick: () => { const g = L.batDauNgay(L.ngay + 1); addSys(`Đi ngủ. Sáng ${thuCuaNgay(L.ngay)}, ${L.ngay}/10`); g.forEach(x => addSys(x)); updateSide(); nextScene(); } }, `Đi ngủ, sang ngày ${L.ngay + 1}/10 ▸`),
  );
}

// ---------- Đêm Hồng & kết thúc ----------
function dongBo(tu, den) {
  for (const name of META.sharedVars) {
    try { const val = tu.variablesState[name]; if (val !== undefined && typeof val !== "object") den.variablesState[name] = val; } catch {}
  }
}

async function finale() {
  UI.choices.replaceChildren(h("p", { class: "hint" }, "Đang dựng sân khấu Đêm Hồng…"));
  const chung = new Story(await loadStoryJson("chung"));
  dongBo(L.story, chung);
  chung.variablesState["vai"] = L.ma;
  addSys("🎃 19:30 · Sân khấu Đêm Hồng");
  updateDayline("19:30", "san_khau_dem_hong");
  chung.ChoosePathString("chung_3110_dem_hong");
  runStory(chung, L.ma, () => {
    dongBo(chung, L.story);
    UI.choices.replaceChildren(h("button", { class: "choice", onclick: () => {
      addSys("Kết thúc của bạn");
      L.story.ChoosePathString(`${L.ma}_3010_danh_gia`);
      runStory(L.story, L.ma, () => {
        dongBo(L.story, chung);
        UI.choices.replaceChildren(h("button", { class: "choice", onclick: () => {
          addSys("Kết thúc sự nghiệp của Siêu Nhân Hồng");
          chung.ChoosePathString("chung_3110_ket_thuc_su_nghiep");
          runStory(chung, L.ma, () => {
            UI.choices.replaceChildren(h("button", { class: "choice", onclick: () => {
              addSys("🗓️ Một tháng sau…");
              chung.ChoosePathString("chung_3110_mot_thang_sau");
              runStory(chung, L.ma, () => showSummary(chung));
            } }, "Một tháng sau… ▸"));
          });
        } }, "Kết thúc của Siêu Nhân Hồng ▸"));
      });
    } }, "Xem kết thúc của bạn ▸"));
  });
}

// mã kết thúc (không dấu) -> tên có dấu lấy từ tài liệu lúc build
function tenKetThuc(id) {
  if (!id) return "(chưa xác định)";
  const k = String(id).replace(/^ket_thuc_/, "");
  return META.tenKetThuc?.[k] || prettyNoi(k);
}

function showSummary(chung) {
  saveWrite(null);
  const kt = tenKetThuc(L.v("ket_thuc_nhan_vat"));
  const sn = tenKetThuc(chung.variablesState["ket_thuc_su_nghiep"]);
  UI.choices.replaceChildren(
    h("div", { class: "ending" },
      h("h3", {}, "Hết tháng 10"),
      h("p", {}, `Kết thúc của bạn: ${kt}`),
      h("p", {}, `Kết thúc sự nghiệp Siêu Nhân Hồng: ${sn}`),
      h("p", {}, `Người theo dõi cuối cùng: ${so(chung.variablesState["nguoi_theo_doi"])}`),
    ),
    h("button", { class: "choice", onclick: () => openRole(L.ma) }, "Chơi lại nhân vật này"),
    h("button", { class: "choice", onclick: renderHome }, "Chọn nhân vật khác"),
  );
}

// ============================================================
// DUYỆT TỪNG CẢNH
// ============================================================
function renderBrowser(body, ma = L.ma, knots = META.roles[ma].knots) {
  const groups = { "Theo ngày": {}, "Nói chuyện với đồng nghiệp": [], "Minigame": [], "Kết thúc": [], "Khác": [] };
  for (const k of knots) {
    if (tag(k.tags, "npc") != null) groups["Nói chuyện với đồng nghiệp"].push(k);
    else if (/_mg_|minigame/.test(k.name) || tag(k.tags, "minigame") != null) groups["Minigame"].push(k);
    else if (/_kt_|_3010_danh_gia|ket_thuc/.test(k.name) || tag(k.tags, "ket_thuc") != null) groups["Kết thúc"].push(k);
    else if (tag(k.tags, "ngay") != null && tag(k.tags, "ngau_nhien") == null) {
      const d = tag(k.tags, "ngay"); (groups["Theo ngày"][d] ||= []).push(k);
    } else groups["Khác"].push(k);
  }
  const viewer = h("section", { class: "stage" });
  const play = k => {
    UI.dayline = h("div", { class: "dayline" });
    UI.log = h("div", { class: "log" });
    UI.choices = h("div", { class: "choices" });
    viewer.replaceChildren(UI.dayline, UI.log, UI.choices);
    const story = new Story(JSON_CACHE[ma]);
    const d = parseInt(tag(k.tags, "ngay"), 10);
    if (d) story.variablesState["ngay"] = d;
    story.variablesState["vai"] = ma === "chung" ? "ran_doc" : ma;
    UI.dayline.replaceChildren(h("b", {}, k.name), h("span", {}, k.tags.join(" · ")));
    try {
      if (/^chung_td_/.test(k.name)) {
        const ai = NHAN_VAT[Math.floor(Math.random() * 22)].ma;
        story.ChoosePathString(k.name, true, [ai, 1 + Math.floor(Math.random() * 3)]);
      } else story.ChoosePathString(k.name);
    } catch (e) { UI.log.append(h("p", { class: "narr" }, "Không mở được cảnh này: " + e.message)); return; }
    runStory(story, ma === "chung" ? "ran_doc" : ma, () => UI.choices.replaceChildren(
      h("p", { class: "hint" }, "Hết cảnh."),
      h("button", { class: "choice", onclick: () => play(k) }, "Chơi lại cảnh này")));
    viewer.scrollIntoView({ behavior: "smooth", block: "start" });
  };
  const nhan = k => { const kt = k.name.match(/_kt_(\w+)$/); if (kt) return tenKetThuc(kt[1]);
    const td = k.name.match(/_tudo_(\w+)$/); const nv = td && THEO_MA[td[1]];
    return nv ? `Nói chuyện: ${nv.ten} (${nv.vai})` : null; };
  const list = arr => h("div", { class: "klist" }, arr.map(k => h("button", { class: "btn", onclick: () => play(k) }, nhan(k) || k.name.replace(/^[a-z]+(_[a-z]+)*?_(?=\d{4}|tudo|mg|kt|nn|td|nc|mo|0110|3110|3010)/, "").replace(/_/g, " ") || k.name)));
  const days = Object.keys(groups["Theo ngày"]).sort((a, b) => a - b);
  body.append(h("div", { class: "browser" },
    h("p", { class: "hint" }, "Bấm một cảnh để đọc riêng (mỗi cảnh chạy với chỉ số mặc định, không ảnh hưởng lượt chơi chính)."),
    days.length ? h("details", { open: true }, h("summary", {}, `Theo ngày (${days.length} ngày)`),
      days.map(d => h("div", {}, h("p", { class: "hint" }, `${thuCuaNgay(+d)}, ${d}/10${SU_KIEN_NGAY[d] ? " · " + SU_KIEN_NGAY[d] : ""}`), list(groups["Theo ngày"][d])))) : null,
    ["Nói chuyện với đồng nghiệp", "Minigame", "Kết thúc", "Khác"].filter(g => groups[g].length).map(g =>
      h("details", {}, h("summary", {}, `${g} (${groups[g].length})`), list(groups[g]))),
    viewer,
  ));
}

async function openChung() {
  app.replaceChildren(h("div", { class: "wrap" }, h("p", {}, "Đang tải…")));
  await loadMeta();
  await loadStoryJson("chung");
  const knots = META.roles.chung.knots;
  const body = h("div", {});
  const nhom = { "Mở đầu & hướng dẫn": k => /mo_dau|0110_huong_dan/.test(k), "Sự kiện ngẫu nhiên": k => /_nn_/.test(k), "Tin đồn": k => /_td_/.test(k), "Nói vu vơ": k => /_nc_/.test(k), "Đêm Hồng & kết thúc": k => /3110|_kt_/.test(k) };
  app.replaceChildren(h("div", { class: "wrap" },
    h("header", { class: "top" },
      h("div", { class: "role-head" }, h("div", {}, h("h2", {}, "Nội dung chung"), h("p", {}, "Dùng cho mọi nhân vật. Đọc với vai mặc định là Hiếu."))),
      h("button", { class: "btn ghost", onclick: renderHome }, "← Đổi nhân vật")),
    body));
  const viewer = h("section", { class: "stage" });
  const play = k => {
    UI.dayline = h("div", { class: "dayline" }); UI.log = h("div", { class: "log" }); UI.choices = h("div", { class: "choices" });
    viewer.replaceChildren(UI.dayline, UI.log, UI.choices);
    const story = new Story(JSON_CACHE.chung);
    story.variablesState["vai"] = "ran_doc";
    const d = parseInt(tag(k.tags, "ngay") || tag(k.tags, "ngay_tu"), 10); if (d) story.variablesState["ngay"] = d;
    UI.dayline.replaceChildren(h("b", {}, k.name), h("span", {}, k.tags.join(" · ")));
    try {
      if (/^chung_td_/.test(k.name)) story.ChoosePathString(k.name, true, [NHAN_VAT[Math.floor(Math.random() * 22)].ma, 1 + Math.floor(Math.random() * 3)]);
      else story.ChoosePathString(k.name);
    } catch (e) { UI.log.append(h("p", { class: "narr" }, "Cảnh này cần tham số, không mở riêng được.")); return; }
    runStory(story, "ran_doc", () => UI.choices.replaceChildren(h("p", { class: "hint" }, "Hết cảnh."), h("button", { class: "choice", onclick: () => play(k) }, "Chơi lại (kết quả ngẫu nhiên có thể khác)")));
    viewer.scrollIntoView({ behavior: "smooth", block: "start" });
  };
  body.append(h("div", { class: "browser" },
    Object.entries(nhom).map(([ten, f]) => {
      const arr = knots.filter(k => f(k.name));
      return h("details", {}, h("summary", {}, `${ten} (${arr.length})`),
        h("div", { class: "klist" }, arr.map(k => h("button", { class: "btn", onclick: () => play(k) }, k.name.replace(/^chung_(nn|td|nc|kt|0110_huong_dan|3110)_?/, "").replace(/_/g, " ") || k.name))));
    }),
    viewer));
}

renderHome();
