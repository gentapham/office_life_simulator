// Bản đọc thử: chơi toàn bộ thoại Ink theo từng ngày của tháng 10/2026.
import { Story } from "inkjs/dist/ink-es6.js";
import { NHAN_VAT, THEO_MA, thuCuaNgay, ngayDayDu, SU_KIEN_NGAY } from "./nhan-vat.js";
import { DIA_DIEM } from "./dia-diem.js";
import { logoSVG } from "./logo.js";

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
// Tên đồng nghiệp do người chơi đặt (dùng chung cho mọi vai). Tên Nguyên của Siêu Nhân Hồng cố định.
const TEN_KEY = "owfad_ten_v1";
const TEN_CO_DINH = "sieu_nhan_hong";
const tenDaDat = () => { try { return JSON.parse(localStorage.getItem(TEN_KEY)) || {}; } catch { return {}; } };
const luuTen = t => { try { localStorage.setItem(TEN_KEY, JSON.stringify(t)); } catch {} };
const tenCua = ma => ma === TEN_CO_DINH ? THEO_MA[ma].ten : (tenDaDat()[ma] || THEO_MA[ma].ten);
function apDungTen(story) {
  for (const n of NHAN_VAT) if (n.ma !== TEN_CO_DINH) { try { story.variablesState[n.ma] = tenCua(n.ma); } catch {} }
}
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
  tatG3D();
  const save = saveLoad();
  const nvSave = save && THEO_MA[save.ma];
  app.replaceChildren(
    h("div", { class: "wrap trang-chon" },
      dauTrang(),
      h("section", { class: "gioi-thieu" },
        h("h1", {}, "Chọn vai của bạn"),
        h("p", {}, "G-Entertainment, tháng 10/2026. Cả công ty có 31 ngày để đưa Siêu Nhân Hồng lên 1 triệu người theo dõi trước Đại Nhạc Hội Siêu Nhân."),
        h("div", { class: "nhan-nho" }, h("span", { class: "nhan-16" }, "16+"), h("span", {}, "23 vai"), h("span", {}, "6 kết thúc mỗi vai"), h("span", {}, "Tự lưu trên trình duyệt"))),
      nvSave ? h("div", { class: "choi-do", style: `--mau:${nvSave.mau}` },
        anhVai(nvSave, "nho"),
        h("div", { class: "choi-do-tt" }, h("small", {}, "Đang chơi dở"), h("b", {}, nvSave.vai), h("span", {}, ngayDayDu(save.ngay))),
        h("div", { class: "choi-do-nut" },
          h("button", { class: "btn primary", onclick: () => openRole(save.ma, { tiepTuc: true }) }, "Chơi tiếp"),
          h("button", { class: "btn ghost", onclick: () => { saveWrite(null); renderHome(); } }, "Xóa bản lưu"))) : null,
      h("div", { class: "luoi-vai" },
        NHAN_VAT.map(n => h("button", { class: "the-vai", style: `--mau:${n.mau}`, onclick: () => renderDatTen(n.ma) },
          anhVai(n),
          h("div", { class: "the-vai-tt" }, h("b", {}, n.vai), h("small", {}, n.chuc), h("p", {}, n.cau)))),
        h("button", { class: "the-vai the-chung", onclick: () => openChung() },
          h("div", { class: "anh-vai" }, h("span", { class: "anh-vai-chu" }, "+")),
          h("div", { class: "the-vai-tt" }, h("b", {}, "Nội dung chung"), h("small", {}, "Sự kiện, tin đồn, Đại Nhạc Hội Siêu Nhân"), h("p", {}, "Đọc các cảnh dùng chung cho mọi vai.")))),
    ),
  );
  napChanDung();
  window.scrollTo(0, 0);
}

// Đầu trang: logo + tên game
function dauTrang(...phai) {
  return h("header", { class: "dau-trang" },
    h("div", { class: "logo", html: logoSVG(40) + '<div class="logo-chu"><small>Office Worker For A Day</small><b>Giả Lập Một Ngày Làm Nhân Viên Văn Phòng</b></div>' }),
    phai.length ? h("div", { class: "top-actions" }, phai) : null);
}

// Ảnh chân dung 3D của vai (chụp từ mô hình trong game); khi chưa có thì hiện chữ viết tắt
let CHAN_DUNG = null;
function anhVai(n, co = "") {
  const ky = n.vai.split(" ").map(w => w[0]).join("").slice(0, 2).toUpperCase();
  const img = h("img", { alt: "", "data-ma": n.ma, loading: "lazy", decoding: "async" });
  if (CHAN_DUNG?.[n.ma]) img.src = CHAN_DUNG[n.ma]; else img.hidden = true;
  return h("div", { class: "anh-vai " + co }, h("span", { class: "anh-vai-chu" }, ky), img);
}
async function napChanDung() {
  if (!CHAN_DUNG) {
    try { CHAN_DUNG = JSON.parse(sessionStorage.getItem("owfad_chan_dung_v3")); } catch {}
    if (!CHAN_DUNG) {
      try {
        const { chupChanDung } = await import("./3d/chan-dung.js");
        CHAN_DUNG = chupChanDung(NHAN_VAT.map(n => n.ma));
        try { sessionStorage.setItem("owfad_chan_dung_v3", JSON.stringify(CHAN_DUNG)); } catch {}
      } catch { return; }
    }
  }
  for (const img of document.querySelectorAll("img[data-ma]")) { const u = CHAN_DUNG[img.dataset.ma]; if (u && !img.src) { img.src = u; img.hidden = false; } }
}

// ============================================================
// ĐẶT TÊN ĐỒNG NGHIỆP (trước khi bắt đầu một vai)
// ============================================================
function renderDatTen(ma) {
  const vaiChon = THEO_MA[ma];
  const daDat = tenDaDat();
  const loi = h("p", { class: "form-error", role: "alert" });
  const o = {}, goiY = {};
  // vai của người chơi lên đầu, Siêu Nhân Hồng (tên cố định) xuống cuối
  const thuTu = [vaiChon, ...NHAN_VAT.filter(n => n.ma !== ma && n.ma !== TEN_CO_DINH), ...(ma === TEN_CO_DINH ? [] : [THEO_MA[TEN_CO_DINH]])];
  const capNhatGoiY = n => {
    const khac = o[n.ma].value.trim() !== n.ten;
    goiY[n.ma].textContent = n.ma === TEN_CO_DINH ? "Tên cố định" : khac ? `Mặc định: ${n.ten}` : "";
  };
  const hang = thuTu.map(n => {
    const coDinh = n.ma === TEN_CO_DINH;
    o[n.ma] = h("input", { type: "text", id: "ten_" + n.ma, maxlength: 20, autocomplete: "off", spellcheck: "false",
      value: coDinh ? n.ten : (daDat[n.ma] || n.ten), placeholder: n.ten, disabled: coDinh,
      oninput: () => { capNhatGoiY(n); o[n.ma].removeAttribute("aria-invalid"); loi.textContent = ""; } });
    goiY[n.ma] = h("span", { class: "name-hint" });
    capNhatGoiY(n);
    return h("label", { class: "hang-ten" + (n.ma === ma ? " me" : "") + (coDinh ? " locked" : ""), for: "ten_" + n.ma, style: `--mau:${n.mau}` },
      anhVai(n, "tron"),
      h("span", { class: "hang-ten-vai" }, h("b", {}, n.vai, n.ma === ma ? h("em", {}, "Bạn") : null), h("small", {}, n.chuc)),
      h("span", { class: "hang-ten-o" }, o[n.ma], goiY[n.ma]));
  });
  const kiemTra = () => {
    const ten = {}, gap = new Map();
    for (const n of thuTu) {
      const v = o[n.ma].value.trim().replace(/\s+/g, " ");
      if (!v) return [null, n, `Chưa nhập tên cho ${n.vai}.`];
      if (!/^[\p{L}\d][\p{L}\d .'-]*$/u.test(v)) return [null, n, `Tên của ${n.vai} chỉ dùng chữ, số, khoảng trắng, dấu chấm, gạch nối.`];
      const k = v.toLocaleLowerCase("vi");
      if (gap.has(k)) return [null, n, `${n.vai} trùng tên với ${gap.get(k).vai}. Mỗi người cần một tên riêng.`];
      gap.set(k, n); ten[n.ma] = v;
    }
    return [ten];
  };
  const batDau = macDinh => {
    if (macDinh) { luuTen({}); return openRole(ma); }
    const [ten, n, thongBao] = kiemTra();
    if (!ten) { loi.textContent = thongBao; o[n.ma].setAttribute("aria-invalid", "true"); o[n.ma].focus(); return; }
    const luu = {};
    for (const x of NHAN_VAT) if (x.ma !== TEN_CO_DINH && ten[x.ma] !== x.ten) luu[x.ma] = ten[x.ma];
    luuTen(luu);
    openRole(ma);
  };
  app.replaceChildren(
    h("div", { class: "wrap trang-chon" },
      dauTrang(h("button", { class: "btn ghost", onclick: renderHome }, "← Chọn vai khác")),
      h("form", { class: "dat-ten", novalidate: true, onsubmit: e => { e.preventDefault(); batDau(false); } },
        h("aside", { class: "dat-ten-ben", style: `--mau:${vaiChon.mau}` },
          anhVai(vaiChon, "to"),
          h("div", { class: "dat-ten-vai" }, h("small", {}, "Vai của bạn"), h("h2", {}, vaiChon.vai), h("p", { class: "chuc" }, vaiChon.chuc), h("p", { class: "cau" }, `"${vaiChon.cau}"`)),
          h("p", { class: "dat-ten-mo" }, "Giữ tên mặc định hoặc đặt lại tên cho cả công ty. Tên được lưu cho các lần chơi sau."),
          h("div", { class: "dat-ten-nut" },
            h("button", { class: "btn primary", type: "submit" }, "Bắt đầu với tên đã đặt"),
            h("button", { class: "btn", type: "button", onclick: () => batDau(true) }, "Dùng tên mặc định"),
            h("button", { class: "btn ghost", type: "button", onclick: () => { for (const n of NHAN_VAT) { o[n.ma].value = n.ten; capNhatGoiY(n); o[n.ma].removeAttribute("aria-invalid"); } loi.textContent = ""; } }, "Khôi phục tên mặc định")),
          loi),
        h("section", { class: "dat-ten-ds" }, h("h3", {}, "Đặt tên nhân vật"), h("div", { class: "ds-ten" }, hang))),
    ),
  );
  napChanDung();
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
    apDungTen(this.story);
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
    const coDinh = { 6: 30000, 9: 40000, 16: 80000, 23: 60000 }[ngay];
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
let CHE_DO = "chu";      // "chu" | "3d"
let G = null;            // Game3D đang chạy
let G3D_MOD = null;      // module 3D (tải khi cần)
function tatG3D() { if (G) { G.huy(); G = null; } CHE_DO = "chu"; document.body.classList.remove("g3d-on"); }

async function openRole(ma, opts = {}) {
  tatG3D();
  app.replaceChildren(h("div", { class: "wrap" }, h("p", {}, "Đang tải truyện…")));
  await loadMeta();
  const json = await loadStoryJson(ma);
  L = new LuotChoi(ma, json);
  const save = saveLoad();
  if (opts.tiepTuc && save && save.ma === ma) L.fromSave(save);
  renderRole(opts.tiepTuc && save && save.ma === ma ? "3d" : "gioi_thieu");
}

function renderRole(tab) {
  tatG3D();
  if (tab === "3d") { render3D(); return; }
  const n = THEO_MA[L.ma];
  const tabs = [["3d", "Chơi 3D"], ["choi", "Chơi dạng chữ"], ["duyet", "Duyệt từng cảnh"]];
  const body = h("div", {});
  app.replaceChildren(
    h("div", { class: "wrap" },
      h("header", { class: "top" },
        h("div", { class: "role-head" }, h("div", {}, h("h2", {}, `${n.vai}: ${L.v(L.ma) || n.ten}`), h("p", {}, n.chuc))),
        h("div", { class: "top-actions" },
          h("div", { class: "tabs", role: "tablist" }, tabs.map(([id, label]) =>
            h("button", { class: "btn", role: "tab", "aria-selected": String(tab === id || (tab === "gioi_thieu" && id === "3d")), onclick: () => renderRole(id) }, label))),
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
    h("div", { class: "dayline" }, h("b", {}, "Bắt đầu"), h("span", {}, ngayDayDu(1))),
    h("div", { class: "log" },
      h("p", { class: "narr" }, `Bạn sẽ sống 31 ngày trong vai ${n.vai} ${L.v(L.ma) || n.ten}. Mỗi ngày có các cảnh chính theo giờ. Hết cảnh trong ngày, bạn có thể nói chuyện thêm với đồng nghiệp rồi đi ngủ.`),
      h("p", { class: "narr" }, `Nhân vật này có ${L.knots.length} cảnh (${chinh} cảnh gắn ngày).`),
      h("p", { class: "narr" }, "Tối 31/10 là Đại Nhạc Hội Siêu Nhân: hiện kết thúc của nhân vật, rồi kết thúc sự nghiệp của Siêu Nhân Hồng."),
    ),
    h("div", { class: "choices" },
      h("button", { class: "choice", onclick: () => { saveWrite(null); L.batDauNgay(1); render3D(); } }, `Bắt đầu ${ngayDayDu(1)}`),
      h("button", { class: "choice", onclick: () => { saveWrite(null); const g = L.batDauNgay(1); renderRole("choi"); g.forEach(x => addSys(x)); nextScene(); } }, "Chơi dạng chữ"),
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
    h("b", {}, `${ngayDayDu(L.ngay)}${gio ? " · " + gio : ""}`),
    h("span", {}, [noi ? prettyNoi(noi) : null, ev].filter(Boolean).join(" · ")),
  );
}

// chú thích chỉ số viết tên mặc định: thay bằng tên người chơi đã đặt
function doiTenMacDinh(chu) {
  for (const n of NHAN_VAT) if (n.ma !== TEN_CO_DINH) {
    const moi = L.v(n.ma);
    if (moi && moi !== n.ten) chu = chu.replace(new RegExp(`(?<![\\p{L}])${n.ten}(?![\\p{L}])`, "gu"), moi);
  }
  return chu;
}

function updateSide() {
  if (!UI.side) return;
  const st = L.story;
  const v = n => Number(L.v(n)) || 0;
  const bar = (label, val, max = 100, cls = "") => h("div", { class: "stat" }, h("span", {}, label), h("span", {}, so(val)), h("div", { class: "bar " + cls }, h("i", { style: `width:${Math.max(0, Math.min(100, val / max * 100))}%` })));
  const theoDoi = v("nguoi_theo_doi");
  // chỉ hiện chỉ số có chú thích (biến nội bộ không chú thích thì ẩn); chú thích bỏ phần giải thích sau dấu ":" hoặc "("
  const roleNum = L.roleVars.filter(x => /^-?\d+$/.test(x.init) && x.note && !/^-/.test(x.note)).slice(0, 10)
    .map(x => ({ ...x, nhan: doiTenMacDinh(boEmoji(x.note).split(/[:(.]/)[0].trim().replace(/^./, c => c.toUpperCase())) }));
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
function addSys(text) { UI.log.append(h("div", { class: "scene-tag" }, text)); scrollLog(); if (CHE_DO === "3d") thongBao3D(text); }

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
      const chay = () => { timerHandle = setInterval(() => {
        left -= 0.2; bar.style.width = Math.max(0, left / total * 100) + "%";
        if (left <= 0) {
          clearInterval(timerHandle);
          const idx = choices.findIndex(c => c.text.trim().startsWith("⏱️"));
          pick(idx >= 0 ? idx : choices.length - 1);
        }
      }, 200); };
      // bản 3D: chỉ bắt đầu đếm khi người chơi đã đọc hết câu thoại và thấy lựa chọn
      if (CHE_DO === "3d" && UI.khiHienLuaChon) UI.khiHienLuaChon(chay); else chay();
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
  if (CHE_DO === "3d") return nextScene3D();
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
  if (CHE_DO === "3d") return dayEnd3D();
  if (L.ngay >= 31) { finale(); return; }
  const npcs = L.npcKnots().filter(k => !L.npcDone.has(k.name));
  UI.choices.replaceChildren(
    h("p", { class: "hint" }, `Hết các cảnh chính của ${ngayDayDu(L.ngay)}.`),
    npcs.length ? h("details", {},
      h("summary", {}, "Nói chuyện thêm với đồng nghiệp"),
      h("div", { class: "klist" }, npcs.map(k => {
        const ma = tag(k.tags, "npc"); const n = THEO_MA[ma];
        return h("button", { class: "btn", onclick: () => { L.npcDone.add(k.name); addSys(`Nói chuyện với ${L.v(ma) || n?.ten || ma}`); playKnot(k.name, v => { afterScene(v); UI.choices.replaceChildren(h("button", { class: "choice", onclick: dayEnd }, "Xong ▸")); }); } },
          `${L.v(ma) || n?.ten || ma}`);
      }))) : null,
    h("button", { class: "choice", onclick: () => { const g = L.batDauNgay(L.ngay + 1); addSys(`Đi ngủ. Sáng ${ngayDayDu(L.ngay)}`); g.forEach(x => addSys(x)); updateSide(); nextScene(); } }, `Đi ngủ, sang ${ngayDayDu(L.ngay + 1)} ▸`),
  );
}

// ---------- Đại Nhạc Hội Siêu Nhân & kết thúc ----------
function dongBo(tu, den) {
  for (const name of META.sharedVars) {
    try { const val = tu.variablesState[name]; if (val !== undefined && typeof val !== "object") den.variablesState[name] = val; } catch {}
  }
}

async function finale() {
  UI.choices.replaceChildren(h("p", { class: "hint" }, "Đang dựng sân khấu Đại Nhạc Hội Siêu Nhân…"));
  const chung = new Story(await loadStoryJson("chung"));
  dongBo(L.story, chung);
  chung.variablesState["vai"] = L.ma;
  addSys("19:30 · Sân khấu Đại Nhạc Hội Siêu Nhân");
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
              addSys("Một tháng sau…");
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
// CHƠI 3D
// ============================================================
async function render3D() {
  CHE_DO = "3d";
  document.body.classList.add("g3d-on");
  app.replaceChildren(h("div", { class: "g3d" }, h("p", { class: "g3d-loading" }, "Đang dựng văn phòng…")));
  G3D_MOD ||= { ...(await import("./3d/game3d.js")), ...(await import("./3d/the-gioi.js")), ...(await import("./3d/bau-troi.js")) };
  if (CHE_DO !== "3d") return;
  const { Game3D, KHU, khuCuaNoi, KHU_CUA_VAI, DIEM_DAU_NGAY, thoiTietLuc } = G3D_MOD;
  const n = THEO_MA[L.ma];

  const khung = h("div", { class: "g3d-khung" });
  UI.dayline = h("div", { class: "g3d-ngay" });
  const ttEl = h("div", { class: "g3d-tt" });
  UI.log = h("div", { class: "g3d-log", "aria-live": "off" });
  UI.choices = h("div", { class: "g3d-choices" });
  UI.side = h("aside", { class: "side" });

  // ----- khung thoại: mỗi lần một câu, bấm hoặc Space để đọc tiếp -----
  const kt = taoKhungThoai(UI.log, UI.choices);
  const lichSu = h("div", { class: "g3d-lichsu", hidden: true },
    h("div", { class: "g3d-ke-dau" }, h("b", {}, "Lịch sử hội thoại"), h("button", { class: "g3d-btn", onclick: () => { lichSu.hidden = true; } }, "Đóng")), UI.log);
  kt.onLichSu = () => { lichSu.hidden = !lichSu.hidden; if (!lichSu.hidden) UI.log.scrollTop = UI.log.scrollHeight; };
  const keChiSo = h("div", { class: "g3d-drawer", hidden: true }, h("div", { class: "g3d-ke-dau" }, h("b", {}, "Chỉ số"), h("button", { class: "g3d-btn", onclick: () => { keChiSo.hidden = true; } }, "Đóng")), UI.side);
  const bangChiSo = () => { updateSide(); keChiSo.hidden = !keChiSo.hidden; };

  const mtChu = h("b", {}), mtPhu = h("small", {}), mtMui = h("i", { class: "g3d-mui" });
  const mucTieu = h("div", { class: "g3d-muctieu", hidden: true }, mtMui, h("div", {}, h("span", { class: "g3d-nhan" }, "Tiếp theo"), mtChu, mtPhu));
  const goiY = h("button", { class: "g3d-goiy" + (matchMedia("(pointer: coarse)").matches ? " cham" : ""), hidden: true, onclick: () => G?.tuongTac() });
  const btnGoc = h("button", { class: "g3d-btn", onclick: () => G?.doiGoc() }, "Góc nhìn 1");
  const toast = h("div", { class: "g3d-toast", "aria-live": "polite" });
  const man = h("div", { class: "g3d-man" });
  // máy tính: sau hội thoại chuột đang thả tự do, nhắc bấm vào màn hình để điều khiển tiếp (không bật bảng tạm dừng)
  const bamTiep = h("button", { class: "g3d-bamtiep", hidden: true, onclick: () => G?.canvas.requestPointerLock?.() }, "Bấm vào màn hình để đi tiếp");

  // ----- bảng hướng dẫn phím tắt (hiện khi vào game, khi tạm dừng) -----
  const dienThoai = matchMedia("(pointer: coarse)").matches;
  const phim = (...k) => h("span", { class: "g3d-phim" }, k.map(x => h("kbd", {}, x)));
  const dongPhim = dienThoai ? [
    [h("span", { class: "g3d-phim" }, h("kbd", {}, "Cần gạt trái")), "Di chuyển"],
    [h("span", { class: "g3d-phim" }, h("kbd", {}, "Kéo nửa phải")), "Nhìn quanh"],
    [h("span", { class: "g3d-phim" }, h("kbd", { class: "cam" }, "Nút cam")), "Nói chuyện, tương tác"],
    [h("span", { class: "g3d-phim" }, h("kbd", {}, "Chạm khung thoại")), "Đọc câu tiếp theo"],
  ] : [
    [phim("W", "A", "S", "D"), "Di chuyển"], [phim("Shift"), "Chạy"], [phim("Chuột"), "Nhìn quanh"],
    [phim("E"), "Nói chuyện, tương tác"], [phim("V"), "Đổi góc nhìn thứ nhất / thứ ba"],
    [phim("Space", "Enter"), "Đọc câu thoại tiếp theo"], [phim("1", "–", "9"), "Chọn câu trả lời"],
    [phim("H"), "Xem lại hội thoại"], [phim("Tab"), "Bảng chỉ số"], [phim("Esc"), "Tạm dừng, mở bảng này"],
  ];
  const nutVao = h("button", { class: "btn primary", onclick: () => { if (dienThoai || G?.khoa) { tamNgung.hidden = true; daVao = true; } else G?.canvas.requestPointerLock?.(); } }, "Vào văn phòng");
  const hdTieuDe = h("small", {}, "Hướng dẫn");
  const tamNgung = h("div", { class: "g3d-pause" },
    h("div", { class: "g3d-hd" },
      h("header", {}, hdTieuDe, h("h2", {}, `${n.vai}: ${L.v(L.ma) || n.ten}`), h("p", {}, `${ngayDayDu(L.ngay)}${SU_KIEN_NGAY[L.ngay] ? " · " + SU_KIEN_NGAY[L.ngay] : ""}`)),
      h("div", { class: "g3d-hd-cot" },
        h("section", {}, h("h3", {}, "Phím tắt"), h("dl", {}, dongPhim.flatMap(([k, mo]) => [h("dt", {}, k), h("dd", {}, mo)]))),
        h("section", {}, h("h3", {}, "Cách chơi"), h("ol", {},
          h("li", {}, "Đi tới vòng sáng màu cam để mở cảnh tiếp theo. Mũi tên trên cùng chỉ hướng đi."),
          h("li", {}, "Đứng cạnh đồng nghiệp để nói chuyện riêng."),
          h("li", {}, "Cảnh ở ngoài công ty: ra cổng để đi tới đó."),
          h("li", {}, "Hết việc trong ngày, ra cổng để về nhà ngủ. Game tự lưu."))),
      ),
      h("footer", {}, nutVao)));
  let daVao = false;
  const moHuongDan = () => { tamNgung.hidden = false; g?.moKhoaChuot(); };

  app.replaceChildren(h("div", { class: "g3d" },
    khung,
    h("div", { class: "g3d-hud-trai" }, h("div", { class: "g3d-the-ngay" }, UI.dayline, ttEl)),
    mucTieu,
    h("div", { class: "g3d-hud-phai" }, btnGoc,
      h("button", { class: "g3d-btn", onclick: bangChiSo }, "Chỉ số"),
      h("button", { class: "g3d-btn", onclick: () => { hdTieuDe.textContent = "Hướng dẫn"; nutVao.textContent = "Tiếp tục"; moHuongDan(); } }, "Hướng dẫn"),
      h("button", { class: "g3d-btn", onclick: () => renderRole("choi") }, "Dạng chữ"),
      h("button", { class: "g3d-btn", onclick: renderHome }, "Thoát")),
    h("div", { class: "g3d-tam" }),
    goiY, bamTiep, toast, kt.el, lichSu, keChiSo, tamNgung, man,
  ));

  G = new Game3D(khung, { vai: L.ma, tenCua: ma => L.v(ma) || THEO_MA[ma]?.ten || ma, tenVai: ma => THEO_MA[ma]?.vai || "" });
  const g = G;
  window.__g3d = g; // để kiểm thử tự động
  const tam = app.querySelector(".g3d-tam");
  g.onDoiGoc = goc => { btnGoc.textContent = goc === "1" ? "Góc nhìn 1" : "Góc nhìn 3"; tam.hidden = goc !== "1"; };
  g.onDoiGoc(g.goc);
  g.onThoiTiet = moTa => { ttEl.textContent = moTa; };
  const datGioTT = (gio, phut = 0) => { g.datGio(gio, phut); g.datThoiTiet(thoiTietLuc(L.ngay, gio)); };
  g.onKhoaChuot = khoa => {
    if (khoa) { tamNgung.hidden = true; bamTiep.hidden = true; daVao = true; return; }
    if (!g.khoa && daVao) { hdTieuDe.textContent = "Tạm dừng"; nutVao.textContent = "Tiếp tục"; tamNgung.hidden = false; }
  };
  UI.bangChiSo = bangChiSo; UI.lichSu = kt.onLichSu;
  g.onGoiY = gy => {
    const chu = gy ? gy.nhan : "";
    if (goiY.dataset.chu !== chu) { goiY.dataset.chu = chu; goiY.replaceChildren(...(g.dienThoai ? [] : [h("kbd", {}, "E")]), chu); }
    goiY.hidden = !gy;
  };
  g.onKhung = () => {
    const m = g.khoangCachMucTieu();
    if (!m) return;
    if (m.tang !== g.tang) { mtMui.style.transform = ""; mtMui.classList.add("tang"); return; }
    mtMui.classList.remove("tang");
    mtMui.style.transform = `rotate(${(-(m.huong - g.yaw - Math.PI)) * 180 / Math.PI}deg)`;
  };
  g.onNoiChuyen = ma => noiChuyen3D(ma);
  g.onCauThang = (c, di) => chuyenCanh(c.nhan, di);
  g.onCong = () => { if (L.qi >= L.queue.length) hoiDiNgu(); else thongBao3D("Hôm nay vẫn còn việc ở công ty."); };

  // ----- hội thoại -----
  moHoiThoai = ten => { kt.mo(ten); bamTiep.hidden = true; if (daVao) tamNgung.hidden = true; lichSu.hidden = true; g.datKhoa(true); app.querySelector(".g3d")?.classList.add("dang-thoai"); };
  dongHoiThoai = () => {
    kt.dong(); clearInterval(timerHandle); g.datKhoa(false); app.querySelector(".g3d")?.classList.remove("dang-thoai");
    if (!g.dienThoai && daVao && document.pointerLockElement !== g.canvas) bamTiep.hidden = false;
  };
  thongBao3D = text => {
    const el = h("div", {}, text); toast.append(el);
    setTimeout(() => el.classList.add("het"), 2600); setTimeout(() => el.remove(), 3200);
  };
  const datMucTieuHUD = (chu, phu) => { mtChu.textContent = chu; mtPhu.textContent = phu || ""; mucTieu.hidden = !chu; };
  const chuyenCanh = (chu, xong) => {
    man.textContent = chu; man.classList.add("on");
    setTimeout(() => { xong?.(); setTimeout(() => man.classList.remove("on"), 350); }, 450);
  };
  const khuMacDinh = () => KHU_CUA_VAI[L.ma] || "khu_lam_viec";
  const huongDanTang = (k) => k.tang === g.tang ? "" : k.tang === 0 ? "Xuống tầng 1 bằng cầu thang" : k.tang === 1 ? (g.tang === 0 ? "Lên tầng 2 bằng cầu thang ở sảnh" : "Xuống tầng 2") : "Lên sân thượng từ tầng 2";

  nextScene3D = () => {
    saveWrite(L.toSave());
    if (L.qi < L.queue.length) {
      const name = L.queue[L.qi];
      const k = L.knots.find(x => x.name === name);
      const noi = tag(k?.tags, "noi"), gio = tag(k?.tags, "gio");
      const khu = khuCuaNoi(noi) || khuMacDinh();
      const kv = KHU[khu];
      const m = String(gio || "").match(/(\d{1,2}):(\d{2})/);
      if (m) datGioTT(+m[1], +m[2]);
      updateDayline(gio && gio !== true ? gio : null, null);
      dongHoiThoai();
      const tenNoi = khu === "ra_ngoai" ? prettyNoi(noi) : kv.ten;
      datMucTieuHUD(tenNoi, khu === "ra_ngoai" ? "Ra cổng công ty để đi" : (huongDanTang(kv) || (gio && gio !== true ? `Lúc ${gio}` : "")));
      g.datMucTieu(khu, () => {
        datMucTieuHUD("");
        L.qi++;
        const mo = () => { moHoiThoai(tenNoi); playKnot(name, v => afterScene(v)); };
        if (khu === "ra_ngoai") chuyenCanh(tenNoi, mo); else mo();
      });
      return;
    }
    dayEnd3D();
  };
  dayEnd3D = () => {
    saveWrite(L.toSave());
    if (L.ngay >= 31) { moHoiThoai("Đại Nhạc Hội Siêu Nhân"); finale(); return; }
    dongHoiThoai();
    datGioTT(18, 30);
    updateDayline("18:30", null);
    datMucTieuHUD("Hết giờ làm. Ra cổng để về nhà", "Có thể nói chuyện với đồng nghiệp trước khi về");
    g.datMucTieu("ra_ngoai", hoiDiNgu);
  };
  const hoiDiNgu = () => {
    g.xoaMucTieu(); datMucTieuHUD("");
    moHoiThoai("Cổng công ty");
    UI.choices.replaceChildren(
      h("button", { class: "choice", onclick: () => {
        chuyenCanh(`Sáng ${ngayDayDu(L.ngay + 1)}`, () => {
          const ghiChu = L.batDauNgay(L.ngay + 1);
          g.datViTri(DIEM_DAU_NGAY); datGioTT(8, 0);
          ghiChu.forEach(x => thongBao3D(x));
          nextScene3D();
        });
      } }, `Về nhà ngủ, sang ${ngayDayDu(L.ngay + 1)}`),
      h("button", { class: "choice", onclick: () => { dongHoiThoai(); datMucTieuHUD("Ra cổng để về nhà"); g.datMucTieu("ra_ngoai", hoiDiNgu, { phaiRoiKhoi: true }); } }, "Ở lại thêm"),
    );
  };
  const noiChuyen3D = ma => {
    const k = L.npcKnots().find(x => tag(x.tags, "npc") === ma && !L.npcDone.has(x.name));
    const ten = L.v(ma) || THEO_MA[ma]?.ten || ma;
    if (!k) { thongBao3D(`${ten}: "${CAU_BAN[Math.floor(Math.random() * CAU_BAN.length)]}"`); return; }
    L.npcDone.add(k.name);
    moHoiThoai(`Nói chuyện với ${ten}`);
    playKnot(k.name, () => UI.choices.replaceChildren(h("button", { class: "choice", onclick: () => { saveWrite(L.toSave()); dongHoiThoai(); } }, "Xong")));
  };

  // bắt đầu
  g.datViTri(DIEM_DAU_NGAY); datGioTT(8, 0);
  if (!L.queue.length && L.qi === 0 && L.ngay === 1 && !L.played.size) L.batDauNgay(1);
  updateDayline();
  thongBao3D(`${ngayDayDu(L.ngay)}${SU_KIEN_NGAY[L.ngay] ? " · " + SU_KIEN_NGAY[L.ngay] : ""}`);
  nextScene3D();
}
let moHoiThoai = () => {}, dongHoiThoai = () => {}, thongBao3D = () => {}, nextScene3D = () => {}, dayEnd3D = () => {};
// Phím tắt bản 3D: Space/Enter đọc tiếp, 1-9 chọn, H lịch sử, Tab chỉ số
addEventListener("keydown", e => {
  if (CHE_DO !== "3d" || e.target.closest?.("input, textarea")) return;
  if (e.code === "Tab") { e.preventDefault(); UI.bangChiSo?.(); return; }
  if (e.code === "KeyH" && G?.khoa) { e.preventDefault(); UI.lichSu?.(); return; }
  if (!G?.khoa || e.target.closest?.("button")) return;
  if ((e.code === "Space" || e.code === "Enter") && UI.khungThoai?.conCho()) { e.preventDefault(); UI.khungThoai.tiep(); return; }
  const nut = [...(UI.choices?.querySelectorAll(".choice") || [])];
  if (!nut.length || UI.khungThoai?.conCho()) return;
  const so = /^Digit([1-9])$/.exec(e.code)?.[1];
  if (so && nut[+so - 1]) { e.preventDefault(); nut[+so - 1].click(); }
  else if ((e.code === "Enter" || e.code === "Space") && nut.length === 1) { e.preventDefault(); nut[0].click(); }
});

// Khung thoại 3D: lấy từng dòng runStory ghi vào log (log giữ làm lịch sử), hiện lần lượt từng câu
function taoKhungThoai(log, luaChon) {
  const ten = h("span", { class: "g3d-ten" }), noi = h("span", { class: "g3d-noi" });
  const chu = h("div", { class: "g3d-chu" }), phu = h("div", { class: "g3d-phude" });
  const tiepEl = h("span", { class: "g3d-tiep", "aria-hidden": "true" });
  const nutBoQua = h("button", { class: "g3d-nho", onclick: e => { e.stopPropagation(); boQua(); } }, "Bỏ qua");
  const nutLS = h("button", { class: "g3d-nho", onclick: e => { e.stopPropagation(); kt.onLichSu?.(); } }, "Lịch sử");
  const the = h("div", { class: "g3d-the", role: "button", tabindex: "0", "aria-label": "Câu thoại. Bấm để đọc tiếp", onclick: () => tiep() },
    h("div", { class: "g3d-the-dau" }, ten, noi, h("span", { class: "g3d-the-nut" }, nutLS, nutBoQua)), chu, phu, tiepEl);
  const el = h("section", { class: "g3d-thoai", hidden: true, role: "dialog", "aria-label": "Hội thoại" }, the, luaChon);
  let hang = [], choCb = null, coCau = false;
  const MAU = ["#f0a46e", "#7fc8ff", "#9be38b", "#f7a6c8", "#ffd166", "#c9a8ff", "#8fe0d2", "#ff9c8a"];
  const mauTen = t => { let s = 0; for (const c of t) s = (s * 31 + c.charCodeAt(0)) >>> 0; return MAU[s % MAU.length]; };
  const doc = n => {
    if (n.matches?.(".line")) return { ten: n.querySelector(".who")?.textContent || "", html: n.querySelector(".say")?.innerHTML || "", me: n.classList.contains("me"), phu: n.querySelector(".sub")?.textContent || "" };
    if (n.matches?.("p.narr")) { const c = n.cloneNode(true); const s = c.querySelector(".sub"); s?.remove(); return { narr: true, html: c.innerHTML, phu: s?.textContent || "" }; }
    return null;
  };
  const capNhat = () => {
    tiepEl.hidden = !hang.length; nutBoQua.hidden = hang.length < 2;
    el.classList.toggle("cho-doc", hang.length > 0);
    if (!hang.length && choCb) { const cb = choCb; choCb = null; cb(); }
  };
  const hien = c => {
    coCau = true; the.hidden = false;
    ten.hidden = !!c.narr; ten.textContent = c.me ? `${c.ten} (bạn)` : c.ten;
    ten.style.setProperty("--mau", c.me ? "#e8702a" : mauTen(c.ten || ""));
    chu.className = "g3d-chu" + (c.narr ? " narr" : "") + (c.me ? " me" : "");
    chu.innerHTML = c.html; phu.textContent = c.phu ? "Phụ đề: " + c.phu : ""; phu.hidden = !c.phu;
    chu.classList.remove("vao"); void chu.offsetWidth; chu.classList.add("vao");
  };
  const tiep = () => { if (hang.length) hien(hang.shift()); capNhat(); };
  const boQua = () => { if (hang.length) { hien(hang[hang.length - 1]); hang = []; } capNhat(); };
  new MutationObserver(ds => {
    for (const d of ds) for (const n of d.addedNodes) { const c = doc(n); if (c) hang.push(c); }
    if (!coCau && hang.length) hien(hang.shift());
    capNhat();
  }).observe(log, { childList: true });
  const kt = {
    el,
    conCho: () => hang.length > 0,
    tiep,
    mo(tieuDe) { hang = []; choCb = null; coCau = false; noi.textContent = tieuDe || ""; chu.innerHTML = ""; ten.hidden = true; phu.hidden = true; the.hidden = true; log.replaceChildren(); el.hidden = false; capNhat(); },
    dong() { el.hidden = true; hang = []; choCb = null; },
  };
  UI.khungThoai = kt;
  UI.khiHienLuaChon = cb => setTimeout(() => { if (hang.length) choCb = cb; else cb(); }, 0);
  return kt;
}
const CAU_BAN = ["Đang bận, lát nói nha.", "Deadline tới cổ rồi, mai nói.", "Ủa, có gì hông?", "Đi ngang thôi hả? Ok.", "Để em xong cái này đã."];

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
    apDungTen(story);
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
      days.map(d => h("div", {}, h("p", { class: "hint" }, `${ngayDayDu(+d)}${SU_KIEN_NGAY[d] ? " · " + SU_KIEN_NGAY[d] : ""}`), list(groups["Theo ngày"][d])))) : null,
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
  const nhom = { "Mở đầu & hướng dẫn": k => /mo_dau|0110_huong_dan/.test(k), "Sự kiện ngẫu nhiên": k => /_nn_/.test(k), "Tin đồn": k => /_td_/.test(k), "Nói vu vơ": k => /_nc_/.test(k), "Đại Nhạc Hội Siêu Nhân & kết thúc": k => /3110|_kt_/.test(k) };
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
    apDungTen(story);
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
