// Bản đọc thử: chơi toàn bộ thoại Ink theo từng ngày của tháng 10/2026.
import { Story } from "inkjs/dist/ink-es6.js";
import { NHAN_VAT, THEO_MA, thuCuaNgay, ngayDayDu, SU_KIEN_NGAY } from "./nhan-vat.js";
import { taoSinhTon } from "./sinh-ton.js";
import { moCaiDat } from "./cai-dat.js";
import { am } from "./am-thanh-game.js";
import { taoDienThoai, ghiNhan, ghiMonPho, ghiKetThuc, veBoSuuTap } from "./dien-thoai.js";
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
// "08:30-17:00" -> [510, 1020]; "15:10" -> khoảng 1 tiếng quanh giờ đó
const khoangGio = g => {
  const m = String(g ?? "").match(/(\d{1,2}):(\d{2})(?:\s*-\s*(\d{1,2}):(\d{2}))?/); if (!m) return null;
  const a = +m[1] * 60 + +m[2];
  return m[3] ? [a, +m[3] * 60 + +m[4]] : [a - 20, a + 60];
};
const hhmm = p => `${String(Math.floor(p / 60) % 24).padStart(2, "0")}:${String(Math.floor(p % 60)).padStart(2, "0")}`;
const prettyNoi = s => s ? (DIA_DIEM[s] || s.replace(/_/g, " ").replace(/^./, c => c.toUpperCase())) : "";
// Mỗi vai một bản lưu riêng: chơi vai khác không mất lượt đang dở
const LUU_KEY = ma => "owfad_luu_v2_" + ma;
const saveLoad = ma => { try { return JSON.parse(localStorage.getItem(LUU_KEY(ma)) || "null"); } catch { return null; } };
const dsBanLuu = () => NHAN_VAT.map(n => saveLoad(n.ma)).filter(Boolean).sort((a, b) => (b.luc || 0) - (a.luc || 0));
// chuyển bản lưu cũ (một bản chung) sang bản lưu theo vai
try {
  const cu = JSON.parse(localStorage.getItem(SAVE_KEY) || "null");
  if (cu?.ma && !localStorage.getItem(LUU_KEY(cu.ma))) localStorage.setItem(LUU_KEY(cu.ma), JSON.stringify(cu));
  localStorage.removeItem(SAVE_KEY);
} catch {}
// Tên đồng nghiệp do người chơi đặt (dùng chung cho mọi vai). Tên Nguyên của Siêu Nhân Hồng cố định.
const TEN_KEY = "owfad_ten_v1";
const TEN_CO_DINH = "sieu_nhan_hong";
const tenDaDat = () => { try { return JSON.parse(localStorage.getItem(TEN_KEY)) || {}; } catch { return {}; } };
const luuTen = t => { try { localStorage.setItem(TEN_KEY, JSON.stringify(t)); } catch {} };
const tenCua = ma => ma === TEN_CO_DINH ? THEO_MA[ma].ten : (tenDaDat()[ma] || THEO_MA[ma].ten);
function apDungTen(story) {
  for (const n of NHAN_VAT) if (n.ma !== TEN_CO_DINH) { try { story.variablesState[n.ma] = tenCua(n.ma); } catch {} }
}
const saveWrite = (v, ma = v?.ma || L?.ma) => { if (!ma) return; try { v ? localStorage.setItem(LUU_KEY(ma), JSON.stringify({ ...v, luc: Date.now() })) : localStorage.removeItem(LUU_KEY(ma)); } catch {} };

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
  am.nhac("menu");
  const dsLuu = dsBanLuu().filter(x => THEO_MA[x.ma]);
  app.replaceChildren(
    h("div", { class: "wrap trang-chon" },
      dauTrang(),
      h("section", { class: "gioi-thieu" },
        h("h1", {}, "Chọn vai của bạn"),
        h("p", {}, "G-Entertainment, tháng 10/2026. Cả công ty có 31 ngày để đưa Siêu Nhân Hồng lên 1 triệu người theo dõi trước Đại Nhạc Hội Siêu Nhân."),
        h("div", { class: "nhan-nho" }, h("span", { class: "nhan-16" }, "16+"), h("span", {}, "23 vai"), h("span", {}, "6 kết thúc mỗi vai"), h("span", {}, "Tự lưu trên trình duyệt"))),
      dsLuu.length ? h("section", { class: "ds-choi-do" },
        h("h2", {}, "Đang chơi dở"),
        h("div", { class: "ds-choi-do-luoi" }, dsLuu.map(sv => {
          const nv = THEO_MA[sv.ma];
          return h("div", { class: "choi-do", style: `--mau:${nv.mau}` },
            anhVai(nv, "nho"),
            h("div", { class: "choi-do-tt" }, h("b", {}, nv.vai), h("span", {}, ngayDayDu(sv.ngay)), h("small", {}, `${so(sv.theoDoi || 0)} người theo dõi`)),
            h("div", { class: "choi-do-nut" },
              h("button", { class: "btn primary", onclick: () => openRole(sv.ma, { tiepTuc: true }) }, "Chơi tiếp"),
              h("button", { class: "btn ghost", onclick: e => xacNhanXoa(e.currentTarget, () => { saveWrite(null, sv.ma); renderHome(); }) }, "Xóa")));
        }))) : null,
      h("div", { class: "luoi-vai" },
        NHAN_VAT.map(n => h("button", { class: "the-vai", style: `--mau:${n.mau}`, onclick: () => renderDatTen(n.ma) },
          anhVai(n),
          dsLuu.some(x => x.ma === n.ma) ? h("span", { class: "the-vai-luu" }, `Đang chơi · ${dsLuu.find(x => x.ma === n.ma).ngay}/10`) : null,
          h("div", { class: "the-vai-tt" }, h("b", {}, n.vai), h("small", {}, n.chuc), h("p", {}, n.cau))))),
    ),
  );
  napChanDung();
  window.scrollTo(0, 0);
}
// Bộ sưu tập kết thúc và thành tựu (màn hình chính)
async function moBoSuuTap() {
  await loadMeta();
  const dong = () => { lop.remove(); removeEventListener("keydown", phim, true); };
  const phim = e => { if (e.code === "Escape") { e.preventDefault(); dong(); } };
  const lop = h("div", { class: "cd-lop", onclick: e => { if (e.target === lop) dong(); } },
    h("div", { class: "cd-bang bst-bang", role: "dialog", "aria-label": "Bộ sưu tập" },
      h("header", {}, h("h2", {}, "Bộ sưu tập"), h("button", { class: "btn ghost", type: "button", onclick: dong }, "Đóng")),
      veBoSuuTap(h, { META, NHAN_VAT })));
  addEventListener("keydown", phim, true);
  document.body.append(lop);
}
// bấm lần đầu đổi chữ thành "Bấm lần nữa để xóa", bấm lần hai mới xóa
function xacNhanXoa(nut, xoa) {
  if (nut.dataset.hoi) { xoa(); return; }
  nut.dataset.hoi = "1"; const cu = nut.textContent; nut.textContent = "Bấm lần nữa để xóa";
  setTimeout(() => { if (nut.isConnected) { delete nut.dataset.hoi; nut.textContent = cu; } }, 3000);
}

// Đầu trang: logo + tên game
function dauTrang(...phai) {
  return h("header", { class: "dau-trang" },
    h("div", { class: "logo", html: logoSVG(40) + '<div class="logo-chu"><small>Office Worker For A Day</small><b>Giả Lập Một Ngày Làm Nhân Viên Văn Phòng</b></div>' }),
    h("div", { class: "top-actions" }, phai, h("button", { class: "btn ghost", onclick: moBoSuuTap }, "Bộ sưu tập"), h("button", { class: "btn ghost", onclick: () => moCaiDat(h) }, "Cài đặt")));
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
          saveLoad(ma) ? h("div", { class: "dat-ten-luu" },
            h("span", {}, `Bạn đang chơi dở vai này (${ngayDayDu(saveLoad(ma).ngay)}). Bắt đầu mới sẽ thay bản lưu cũ.`),
            h("button", { class: "btn primary", type: "button", onclick: () => openRole(ma, { tiepTuc: true }) }, "Chơi tiếp bản lưu")) : null,
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
    this.phutGame = 8 * 60;  // đồng hồ trong game (phút tính từ 0:00)
    this.nnHomNay = [];      // sự kiện bất ngờ có thể xảy ra hôm nay
    this.lichSuTheoDoi = {}; // ngày -> người theo dõi buổi sáng (biểu đồ trong điện thoại)
    this.tinDaDoc = [];      // tin nhắn đã đọc
    this.dauNgay = null;     // chỉ số lúc sáng, để tổng kết cuối ngày
    this.giaoDich = [];      // giao dịch ví (ứng dụng MôMô)
  }
  // chụp nhanh các chỉ số để so sánh cuối ngày
  chupChiSo() {
    const o = { tien: 0, nguoi_theo_doi: 0, uy_tin: 0, stress: 0, tinh_than_cong_ty: 0, so_canh: this.played.size };
    for (const k of Object.keys(o)) if (k !== "so_canh") o[k] = Number(this.v(k)) || 0;
    for (const n of NHAN_VAT) o["qh_" + n.ma] = Number(this.v("qh_" + n.ma)) || 0;
    return o;
  }
  toSave() {
    return { ma: this.ma, theoDoi: Number(this.v("nguoi_theo_doi")) || 0, ngay: this.ngay, queue: this.queue, qi: this.qi, played: [...this.played], npcDone: [...this.npcDone], phutGame: this.phutGame, nnHomNay: this.nnHomNay, lichSuTheoDoi: this.lichSuTheoDoi, tinDaDoc: this.tinDaDoc, dauNgay: this.dauNgay, giaoDich: this.giaoDich, state: this.story.state.ToJson() };
  }
  fromSave(s) {
    this.ngay = s.ngay; this.queue = s.queue; this.qi = s.qi;
    this.played = new Set(s.played); this.npcDone = new Set(s.npcDone || []);
    this.phutGame = s.phutGame ?? 8 * 60; this.nnHomNay = s.nnHomNay || [];
    this.lichSuTheoDoi = s.lichSuTheoDoi || {}; this.tinDaDoc = s.tinDaDoc || []; this.dauNgay = s.dauNgay || null; this.giaoDich = s.giaoDich || [];
    this.story.state.LoadJson(s.state);
  }
  ghiGiaoDich(ten, so) {
    const p = this.phutGame ?? 480;
    this.giaoDich.push({ ten, so, ngay: this.ngay, gio: `${String(Math.floor(p / 60)).padStart(2, "0")}:${String(p % 60).padStart(2, "0")}` });
    if (this.giaoDich.length > 40) this.giaoDich.shift();
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
      .filter(k => tag(k.tags, "dieu_kien") !== "sau_dem_hong")
      .sort((a, b) => gioSo(tag(a.tags, "gio")) - gioSo(tag(b.tags, "gio")))
      .map(k => k.name);
  }
  // điều kiện của cảnh xét ngay lúc sắp diễn (lựa chọn trước đó trong cùng ngày cũng tính)
  boQuaCanhKhongDu() {
    while (this.qi < this.queue.length) {
      const k = this.knots.find(x => x.name === this.queue[this.qi]);
      const dk = tag(k?.tags, "dieu_kien");
      if (dk == null || danhGiaDieuKien(dk, this.story) === true) return;
      this.qi++;
    }
  }
  npcKnots() { return this.knots.filter(k => tag(k.tags, "npc") != null); }
  // Sự kiện bất ngờ trong ngày: lấy từ kho chung và của riêng vai, đúng ngày, đúng vai, chưa gặp
  chonNgauNhien(ngay) {
    const hop = k => {
      const tg = k.tags || [];
      if (!tg.includes("ngau_nhien")) return false;
      if (this.played.has(k.name) || /_mg_|minigame/.test(k.name)) return false;
      if (tg.some(t => t.startsWith("vai_khong:") && t.slice(10).trim() === this.ma)) return false;
      const n = tag(tg, "ngay"); if (n != null && n !== true && +n !== ngay) return false;
      const tu = +tag(tg, "ngay_tu") || 1, den = +tag(tg, "ngay_den") || 31;
      if (ngay < tu || ngay > den || ngay >= 31) return false;
      const dk = tag(tg, "dieu_kien"); if (dk != null && danhGiaDieuKien(dk, this.story) !== true) return false;
      if (this.locNoi && !this.locNoi(tag(tg, "noi"))) return false;
      return !!khoangGio(tag(tg, "gio"));
    };
    const rieng = this.knots.filter(hop);
    const chung = (META.roles.chung?.knots || []).filter(hop);
    const tron = a => a.map(x => [Math.random(), x]).sort((p, q) => p[0] - q[0]).map(x => x[1]);
    const ds = [...rieng, ...tron(chung)];
    const chon = [], dienThoai = [];
    for (const k of ds) {
      const laDT = tag(k.tags, "noi") === "dien_thoai";
      if (laDT) { if (dienThoai.length < 1) dienThoai.push(k.name); }
      else if (chon.length < 4) chon.push(k.name);
    }
    return [...chon, ...dienThoai];
  }

  // Việc của game mỗi sáng: lương, người theo dõi tự nhiên, sự kiện cố định
  batDauNgay(ngay) {
    this.ngay = ngay;
    this.set("ngay", ngay);
    const ghiChu = [];
    if (ngay > 1) {
      const tt = Number(this.v("tinh_than_cong_ty")) || 50;
      const tang = tt >= 70 ? 24000 : tt <= 30 ? 8000 : 16000;
      const npc = 1000 + Math.round(Math.random() * 6000);
      this.set("nguoi_theo_doi", (Number(this.v("nguoi_theo_doi")) || 0) + tang + npc);
    }
    const coDinh = { 6: 30000, 9: 40000, 16: 80000, 23: 60000 }[ngay];
    if (coDinh) { this.set("nguoi_theo_doi", (Number(this.v("nguoi_theo_doi")) || 0) + coDinh); ghiChu.push(`Sự kiện cố định: +${so(coDinh)} người theo dõi`); }
    const luong = THEO_MA[this.ma]?.luong || 0;
    if (ngay === 12 && luong) { this.set("tien", (Number(this.v("tien")) || 0) + luong); this.ghiGiaoDich("Lương tháng 10", luong); ghiChu.push(`Lương tháng về (trễ 2 ngày): +${vnd(luong)}`); }
    // qua đêm: bản đọc thử chưa có ăn uống nên coi như tự ăn tối, chỉ số chỉ tụt nhẹ, không xuống dưới 50
    if (ngay > 1) {
      // qua một đêm: ngủ dậy đói và khát hơn (không tụt dưới 35 để sáng nào cũng kịp ăn uống), năng lượng đầy lại
      this.set("no", Math.max(35, (Number(this.v("no")) || 0) - 15));
      this.set("khat", Math.max(35, (Number(this.v("khat")) || 0) - 20));
      this.set("nang_luong", 100);
      this.set("stress", Math.max(0, (Number(this.v("stress")) || 0) - 10));
    }
    this.queue = this.canhTrongNgay(ngay);
    this.qi = 0;
    this.phutGame = 8 * 60;
    this.nnHomNay = this.chonNgauNhien(ngay);
    this.lichSuTheoDoi[ngay] = Number(this.v("nguoi_theo_doi")) || 0;
    this.dauNgay = this.chupChiSo();
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
function tatG3D() { DT?.dong(); DT = null; UI.dienThoai = null; SINH_TON?.huy(); SINH_TON = null; if (G) { G.huy(); G = null; } CHE_DO = "chu"; UI.capNhatTheoDoi = null; document.body.classList.remove("g3d-on"); }

async function openRole(ma, opts = {}) {
  tatG3D();
  app.replaceChildren(h("div", { class: "wrap" }, h("p", {}, "Đang tải truyện…")));
  await loadMeta();
  const json = await loadStoryJson(ma);
  L = new LuotChoi(ma, json);
  const save = saveLoad(ma);
  if (opts.tiepTuc && save && save.ma === ma) L.fromSave(save);
  else { saveWrite(null); L.batDauNgay(1); }
  render3D();
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
  UI.capNhatTheoDoi?.();
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
    choices.forEach((c, i) => UI.choices.append(h("button", { class: "choice", onclick: () => pick(i) }, c.text.replace(/\*\(([^)]*)\)\*/g, "($1)"))));
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
  L.boQuaCanhKhongDu();
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
  if (CHE_DO !== "3d") updateDayline(gio && gio !== true ? gio : null, noi && noi !== true ? noi : null); // bản 3D: đồng hồ tự chạy
  L.played.add(name);
  try {
    L.story.ChoosePathString(name);
  } catch (e) { addSys(`(Không mở được cảnh ${name})`); done(new Set()); return; }
  runStory(L.story, L.ma, visited => { visited.add(name); done(visited); }); // cảnh một dòng kết thúc ngay nên phải tự ghi tên
}

function afterScene(visited = new Set()) {
  // Cảnh có thể dẫn vào minigame: cho người chơi tự chọn kết quả
  const mg = timMinigame(visited);
  saveWrite(L.toSave());
  if (mg && CHE_DO === "3d") {
    // minigame thật: chơi xong mới biết thắng hay thua, rồi diễn cảnh kết quả
    UI.choices.replaceChildren();
    import("./minigame.js").then(({ choiMinigame }) => choiMinigame({ base: mg.base, ra: mg.ra, vai: L.ma, khung: app.querySelector(".g3d"), h }))
      .then(kq => {
        if (kq && !/_(thua|that_bai|truot)$/.test(kq)) moThanhTuu([...ghiNhan("mg_thang"), ...(/_(hoan_hao|nhanh|bat_ngu|qua_nhanh)$/.test(kq) ? ghiNhan("mg_xuat_sac") : [])]);
        if (kq && L.knots.some(k => k.name === kq)) playKnot(kq, v => afterScene(v)); else nextScene();
      });
    return;
  }
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
        moThanhTuu(ghiKetThuc(L.ma, L.v("ket_thuc_nhan_vat"), META));
        if (Number(L.v("nguoi_theo_doi")) >= MUC_TIEU) moThanhTuu(ghiNhan("mot_trieu", 1, { dat: true }));
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
  const { Game3D, KHU, khuCuaNoi, KHU_CUA_VAI, DIEM_DAU_NGAY, CHO_XEM, CHO_NGOI: CHO_NGOI_3D, thoiTietLuc, diaDiemCuaNoi, DIEM_PHO } = G3D_MOD;
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
  // tiến độ mục tiêu 1 triệu người theo dõi của Siêu Nhân Hồng
  const tdSo = h("b", {}), tdThanh = h("i", {}), tdCon = h("span", {});
  const theoDoiEl = h("div", { class: "g3d-theodoi", title: "Mục tiêu của cả công ty" },
    h("div", { class: "g3d-theodoi-dau" }, h("span", {}, "Siêu Nhân Hồng"), tdCon), tdSo, h("div", { class: "g3d-theodoi-thanh" }, tdThanh));
  let tdCu = null;
  UI.capNhatTheoDoi = () => {
    const v = Math.max(0, Number(L.v("nguoi_theo_doi")) || 0);
    if (v === tdCu) return;
    if (tdCu != null && v > tdCu) { theoDoiEl.classList.add("tang"); setTimeout(() => theoDoiEl.classList.remove("tang"), 1500); }
    tdCu = v;
    tdSo.replaceChildren(so(v), h("small", {}, ` / ${so(MUC_TIEU)}`));
    tdThanh.style.width = Math.min(100, v / MUC_TIEU * 100) + "%";
    const ngayCon = Math.max(0, 31 - L.ngay);
    tdCon.textContent = v >= MUC_TIEU ? "Đã đạt mục tiêu" : ngayCon ? `Còn ${ngayCon} ngày` : "Đêm diễn";
  };
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
    [phim("H"), "Xem lại hội thoại"], [phim("Tab"), "Bảng chỉ số"], [phim("P"), "Điện thoại"], [phim("M"), "Bản đồ"], [phim("Esc"), "Tạm dừng, mở bảng này"],
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
      h("footer", {}, nutVao, h("button", { class: "btn ghost", onclick: () => moCaiDat(h, { trongGame: true }) }, "Cài đặt"), h("button", { class: "btn ghost", onclick: () => { saveWrite(L.toSave()); renderHome(); } }, "Thoát ra màn hình chính"))));
  let daVao = false;
  const moHuongDan = () => { tamNgung.hidden = false; g?.moKhoaChuot(); };

  app.replaceChildren(h("div", { class: "g3d" },
    khung,
    h("div", { class: "g3d-hud-trai" }, h("div", { class: "g3d-the-ngay" }, UI.dayline, ttEl), theoDoiEl),
    mucTieu,
    h("div", { class: "g3d-hud-phai" }, btnGoc,
      h("button", { class: "g3d-btn", onclick: bangChiSo }, "Chỉ số"),
      h("button", { class: "g3d-btn", onclick: () => { hdTieuDe.textContent = "Hướng dẫn"; nutVao.textContent = "Tiếp tục"; moHuongDan(); } }, "Hướng dẫn"),
      h("button", { class: "g3d-btn", onclick: () => DT?.mo() }, "Điện thoại"),
      h("button", { class: "g3d-btn", onclick: () => { g.moKhoaChuot(); moCaiDat(h, { trongGame: true }); } }, "Cài đặt"),
      h("button", { class: "g3d-btn", onclick: () => { saveWrite(L.toSave()); renderHome(); } }, "Thoát")),
    h("div", { class: "g3d-tam" }),
    goiY, bamTiep, toast, kt.el, lichSu, keChiSo, tamNgung, man,
  ));

  // trạm xe buýt số 69: đứng trước trạm bấm E để đón xe (thêm một lần vào danh sách đồ vật tương tác)
  const TRAM_BUYT = [
    { ten: "Trạm Phố Hóng Tây", x: -30, z: 41.9, huong: 0 },
    { ten: "Trạm Đại lộ Kẹt Xe", x: 45.4, z: -12, huong: -Math.PI / 2 },
    { ten: "Trạm Quảng trường Hồng", x: 90, z: 41.9, huong: 0 },
  ];
  if (!G3D_MOD.DO_VAT.some(v => v.loai === "xe_buyt")) for (const t of TRAM_BUYT) G3D_MOD.DO_VAT.push({ loai: "xe_buyt", tang: 0, x: t.x, z: t.z, nhan: "Đón xe buýt số 69 (7.000đ)" });
  G = new Game3D(khung, { vai: L.ma, tenCua: ma => L.v(ma) || THEO_MA[ma]?.ten || ma, tenVai: ma => THEO_MA[ma]?.vai || "" });
  const g = G;
  window.__g3d = g; window.__L = L; window.__tiep = () => nextScene3D(); // để kiểm thử tự động
  // ----- sinh tồn: đói, khát, năng lượng tụt theo thời gian, cảnh báo, xỉu -----
  sinhTon = SINH_TON = taoSinhTon({
    g, L, h, thongBao: x => thongBao3D(x),
    dangChoi: () => !g.khoa && tamNgung.hidden && !g.capCuu,
    xiu: lyDo => batXiu(lyDo),
    tenCua: ma => L.v(ma) || THEO_MA[ma]?.ten || ma,
    dsDongNghiep: () => Object.keys(CHO_NGOI_3D).filter(m => m !== L.ma && m !== "cho"),
  });
  app.querySelector(".g3d-hud-trai").append(sinhTon.el); app.querySelector(".g3d").append(sinhTon.vien);
  const CHAN_DOAN = { "đói": "hạ đường huyết do nhịn ăn quá lâu", "khát": "mất nước nặng", "kiệt sức": "suy nhược cơ thể do làm việc quá sức" };
  const batXiu = lyDo => {
    dongHoiThoai(); datMucTieuHUD(""); saveWrite(null); DT?.dong(); moThanhTuu(ghiNhan("xiu"));
    const lop = h("div", { class: "g3d-xiu" }); app.querySelector(".g3d").append(lop);
    app.querySelector(".g3d").classList.add("cap-cuu"); // ẩn bảng thông tin trong lúc chiếu cảnh
    thongBao3D(`Bạn gục xuống vì ${lyDo}…`);
    g.xiu({
      onPha: (pha, chu) => { lop.className = "g3d-xiu " + pha; lop.textContent = chu; },
      onXong: () => {
        const gio = String(L.v("gio") ?? 9).padStart(2, "0") + ":" + String(L.v("phut") ?? 0).padStart(2, "0");
        const n = THEO_MA[L.ma];
        lop.className = "g3d-xiu ket"; lop.replaceChildren(h("div", { class: "g3d-xiu-the" },
          h("small", {}, "Lượt chơi kết thúc"),
          h("h2", {}, `Bạn đã xỉu vì ${lyDo}`),
          h("p", {}, `${n.vai} ${L.v(L.ma) || n.ten} được xe cấp cứu 115 đưa vào Bệnh viện Quận Hóng lúc ${gio}, ${ngayDayDu(L.ngay)}. Bác sĩ chẩn đoán: ${CHAN_DOAN[lyDo]}.`),
          h("p", { class: "nho" }, "Lời dặn của bác sĩ: ăn uống đúng giờ, khát thì uống, mệt thì nghỉ. Deadline không đáng để nằm viện."),
          h("div", { class: "g3d-xiu-nut" },
            h("button", { class: "btn primary", onclick: () => openRole(L.ma) }, "Chơi lại vai này"),
            h("button", { class: "btn ghost", onclick: renderHome }, "Chọn vai khác"))));
      },
    });
  };
  const tam = app.querySelector(".g3d-tam");
  g.onDoiGoc = goc => { btnGoc.textContent = goc === "1" ? "Góc nhìn 1" : "Góc nhìn 3"; tam.hidden = goc !== "1"; };
  g.onDoiGoc(g.goc);
  g.onThoiTiet = moTa => { ttEl.textContent = moTa; };
  // ----- đồng hồ trong game: 1 giây ngoài đời = 1 phút trong game, dừng khi đang thoại hay tạm dừng -----
  let gioTT = -1;
  const hienGio = () => {
    const p = L.phutGame, gio = Math.floor(p / 60), phut = p % 60;
    g.datGio(gio, phut);
    if (gio !== gioTT) { gioTT = gio; g.datThoiTiet(thoiTietLuc(L.ngay, gio)); }
    L.set("gio", gio); L.set("phut", phut);
    updateDayline(hhmm(p), null);
  };
  const datGioTT = (gio, phut = 0) => { L.phutGame = gio * 60 + phut; g.datNgay(L.ngay); gioTT = -1; hienGio(); };
  // đồng hồ không chạy quá giờ của cảnh kế tiếp (cảnh chờ người chơi tới)
  const tranGio = () => {
    for (let i = L.qi; i < L.queue.length; i++) {
      const gs = gioSo(tag(L.knots.find(x => x.name === L.queue[i])?.tags, "gio"));
      if (gs < 9999) return gs - 1;
    }
    return L.qi < L.queue.length ? 17 * 60 : 23 * 60 + 30;
  };
  const toiGioCanh = gio => { const m = String(gio || "").match(/(\d{1,2}):(\d{2})/); if (m && +m[1] * 60 + +m[2] > L.phutGame) datGioTT(+m[1], +m[2]); };
  const henDH = setInterval(() => {
    if (G !== g) { clearInterval(henDH); return; }
    if (g.khoa || !tamNgung.hidden || g.capCuu) return;
    if (L.phutGame < tranGio()) { L.phutGame++; hienGio(); }
    const yeu = Math.min(...["no", "khat", "nang_luong"].map(k => Number(L.v(k)) || 0));
    am.tim(yeu < 15 ? (15 - yeu) / 15 : 0); // tim đập nhanh khi sắp xỉu
    kiemTraNgauNhien();
  }, 1000);

  // ----- sự kiện bất ngờ: tới đúng nơi, đúng khung giờ thì xảy ra; tin nhắn điện thoại thì báo trên màn hình -----
  L.locNoi = noi => noi === "dien_thoai" || (() => { const khu = khuCuaNoi(noi); return !!khu && khu !== "ra_ngoai" && !KHU[khu]?.ngoai; })();
  if (L.qi === 0 && L.phutGame === 8 * 60) L.nnHomNay = L.chonNgauNhien(L.ngay);
  let dangNgauNhien = false, CHUNG_ST = null;
  const timKnotNN = ten => L.knots.find(x => x.name === ten) || META.roles.chung?.knots.find(x => x.name === ten);
  const nguoiGuiTin = t => { const m = timKnotNN(t)?.noi?.find(x => x !== L.ma); return m ? `Tin nhắn từ ${L.v(m) || THEO_MA[m]?.ten || m}` : "Tin nhắn Zola"; };
  const nutTin = h("button", { class: "g3d-tinnhan", hidden: true, onclick: () => { const t = nutTin.dataset.ten; if (t) { nutTin.hidden = true; choiNgauNhien(t, nguoiGuiTin(t)); } } }, h("i", {}), "Tin nhắn mới");
  app.querySelector(".g3d").append(nutTin);
  const kiemTraNgauNhien = () => {
    if (g.khoa || dangNgauNhien) return;
    // không chen ngang: đang có hội thoại, đang chuyển cảnh, hay sắp tới chỗ mở cảnh chính
    if (!app.querySelector(".g3d-thoai")?.hidden || man.classList.contains("on")) return;
    const mt = g.khoangCachMucTieu(); if (mt && mt.tang === g.tang && mt.d < 4) return;
    let tin = null;
    for (const ten of L.nnHomNay) {
      const k = timKnotNN(ten); if (!k) continue;
      const kg = khoangGio(tag(k.tags, "gio")); if (!kg || L.phutGame < kg[0] || L.phutGame > kg[1]) continue;
      const noi = tag(k.tags, "noi");
      if (noi === "dien_thoai") { tin = ten; continue; }
      const kv = KHU[khuCuaNoi(noi)];
      if (!kv || kv.ngoai || g.tang !== kv.tang || Math.hypot(g.p.x - kv.x, g.p.z - kv.z) > 4) continue;
      choiNgauNhien(ten, kv.ten); return;
    }
    if (tin && nutTin.hidden) { nutTin.dataset.ten = tin; nutTin.hidden = false; thongBao3D("Điện thoại rung: có tin nhắn mới."); am.phat("rung"); }
  };
  const choiNgauNhien = async (ten, tieuDe) => {
    dangNgauNhien = true;
    L.nnHomNay = L.nnHomNay.filter(x => x !== ten); L.played.add(ten);
    if (tieuDe.startsWith("Tin nhắn")) { L.tinDaDoc.push({ ten: tieuDe, ngay: L.ngay }); moThanhTuu(ghiNhan("tin_nhan")); }
    else moThanhTuu(ghiNhan("su_kien"));
    const k = timKnotNN(ten), laChung = !L.knots.includes(k);
    let st = L.story;
    if (laChung) {
      CHUNG_ST ||= new Story(await loadStoryJson("chung"));
      st = CHUNG_ST; apDungTen(st); dongBo(L.story, st); st.variablesState["vai"] = L.ma;
    }
    const nguoi = tag(k?.tags, "noi") === "dien_thoai" ? null : (k?.noi || []).find(m => m !== L.ma && m in CHO_NGOI_3D && g.mucTieu?.k?.nguoi?.ma !== m);
    const daGoi = nguoi && g.goiNguoiToi(nguoi);
    moHoiThoai(tieuDe);
    try { st.ChoosePathString(ten); } catch { dangNgauNhien = false; dongHoiThoai(); return; }
    runStory(st, L.ma, () => {
      if (laChung) dongBo(st, L.story);
      updateSide(); sinhTon?.veLai(); saveWrite(L.toSave());
      UI.choices.replaceChildren(h("button", { class: "choice", onclick: () => {
        dongHoiThoai(); dangNgauNhien = false;
        const n = daGoi && g.npc.find(x => x.ma === nguoi); if (n) { n.daDoi = false; g.veCho(n); }
      } }, "Xong"));
    });
  };
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
  // dùng đồ vật: đi vệ sinh, rửa mặt, uống nước (chuyển cảnh ngắn, chỉ số thay đổi)
  const DUNG_DO = {
    wc: { chu: "Đi vệ sinh", ket: ["Nhẹ cả người.", "Xả nước rồi nha. Bác Bình dặn.", "Ngồi lướt điện thoại hơi lâu. Ai đó gõ cửa."], doi: { stress: -8, nang_luong: 2 } },
    tieu: { chu: "Đi vệ sinh", ket: ["Nhẹ cả người.", "Vách ngăn hơi thấp. Không ai nhìn ai."], doi: { stress: -5 } },
    rua_mat: { chu: "Rửa mặt", ket: ["Nước mát. Tỉnh hẳn.", "Nhìn vào gương: mặt mình hôm nay trông như deadline.", "Rửa mặt xong thấy đời cũng không đến nỗi."], doi: { nang_luong: 15, stress: -3 } },
    meo: { chu: "", ket: ["Meo~. Nó cọ đầu vào tay bạn.", "Nó nằm ngửa ra cho gãi bụng. Một cái bẫy: bạn bị cào nhẹ.", "Nó nhìn bạn một lúc, rồi quay đi như sếp nhìn đề xuất tăng lương.", "Rừ rừ rừ. Stress bay đi đâu mất."], doi: { stress: -4 } },
    ca: { chu: "", ket: ["Con cá vàng bơi một vòng rồi quên luôn bạn là ai. Ghen tị ghê.", "Nhìn cá bơi, tự nhiên thấy deadline cũng chỉ là nước.", "Con cá đỏ đớp đớp như đang họp."], doi: { stress: -3 } },
    chim: { chu: "", ket: ["Cả bầy bồ câu sà xuống. Bạn thấy mình như người nổi tiếng.", "Một con bồ câu giành vụn bánh mì với con khác. Giống hệt chuyện tranh ghế phó giám đốc.", "Bồ câu mổ lia lịa. Bác Bình nhìn từ chòi bảo vệ, lắc đầu: \"Lát cháu quét sân nhé.\""], doi: { stress: -2 } },
    uong_nuoc: { chu: "Uống nước", ket: ["Một ly nước lọc mát lạnh.", "Cây nước kêu ọc ọc như đồng nghiệp lúc 4 giờ chiều."], doi: { khat: 30 } },
    // ăn uống trong công ty (miễn phí)
    tu_lanh: { chu: "Mở tủ lạnh", ket: ["Hộp cơm mang từ nhà. Cơm trắng, trứng chiên, chút dưa leo. Đủ sống.", "Bạn lấy nhầm một hộp không tên. Hóa ra là của Phát. Ăn rồi mới biết.", "Cơm nguội nhưng no. Người trưởng thành không đòi hỏi."], doi: { no: 35 } },
    mi_ly: { chu: "Hâm mì ly", ket: ["Mì ly của công ty, 0đ (ăn cắp). Nóng hổi.", "Lò vi sóng kêu tít tít. Cả pantry thơm mùi mì tôm.", "Ai đó hâm cá trước đó. Mì của bạn giờ cũng hơi mùi cá."], doi: { no: 25, khat: -5 } },
    ca_phe: { chu: "Pha cà phê", ket: ["Cà phê đen đá. Tim đập nhanh hơn deadline.", "Máy pha cà phê rên rỉ như đồng nghiệp sáng thứ 2.", "Một ly cà phê, mở mắt được thêm hai tiếng."], doi: { nang_luong: 22, khat: 5 } },
    trai_cay: { chu: "", ket: ["Một trái chuối. Tiết kiệm, bổ dưỡng.", "Miếng dưa hấu ngọt lịm. Ai mua vậy ta?"], doi: { no: 10, khat: 6 } },
    tra_bac_binh: { chu: "", ket: ["Bác Bình rót cho ly trà nóng: \"Uống đi cháu, trà Thái đấy.\"", "Bác Bình: \"Làm thì làm, ăn uống phải đúng giờ, cháu ạ.\""], doi: { khat: 20, stress: -3 } },
    // mua ngoài phố
    banh_mi: { chu: "Mua bánh mì", gia: 20000, ket: ["Bánh mì thịt nóng giòn, thêm pa-tê. Chân ái.", "Cô bán bánh mì hỏi: \"Cay hông con?\" Bạn gật. Cay thật."], doi: { no: 40 } },
    hu_tieu: { chu: "Ăn hủ tiếu gõ", gia: 35000, ket: ["Tô hủ tiếu gõ nóng hổi, nước lèo ngọt thanh.", "Tiếng gõ lóc cóc, bạn ăn hết sạch tô."], doi: { no: 45, khat: 10 } },
    nuoc_mia: { chu: "Mua nước mía", gia: 15000, ket: ["Ly nước mía tắc mát rượi giữa trưa nắng.", "Ngọt tới tận não. Hết khát hẳn."], doi: { khat: 40, no: 5 } },
    che: { chu: "Ăn chè Bà Bảy", gia: 20000, ket: ["Chè khoai môn nước cốt dừa. Bà Bảy cho thêm một vá.", "Bà Bảy hỏi: \"Con ăn chè gì?\" Câu hỏi dễ nhất trong ngày."], doi: { no: 20, khat: 15, stress: -3 } },
    tra_da: { chu: "", gia: 5000, ket: ["Ly trà đá vỉa hè. Năm nghìn mà mát cả người.", "Ngồi xuống ghế nhựa, uống trà đá, nghe mấy chú bàn chuyện thế giới."], doi: { khat: 30, stress: -2 } },
  };
  const TEN_CHI_SO = { stress: "Stress", nang_luong: "Năng lượng", khat: "Nước", no: "No" };
  let soCaPhe = 0;
  // thời gian chờ giữa hai lần dùng cùng một thứ (giây), như ngoài đời
  const CHO_DUNG = { meo: 25, ca: 20, chim: 30, wc: 60, tieu: 60, rua_mat: 30, uong_nuoc: 8, tu_lanh: 90, mi_ly: 90, ca_phe: 20, trai_cay: 30, tra_bac_binh: 45, banh_mi: 30, hu_tieu: 45, nuoc_mia: 20, che: 30, tra_da: 15 };
  const CAU_CHO = { meo: "Mèo vừa được vuốt rồi, nó đang ngúng nguẩy. Để nó yên một lát.", ca: "Cá vẫn bơi vậy thôi. Lát quay lại ngắm tiếp.", chim: "Bồ câu đang no, chưa thèm vụn bánh mì nữa.", wc: "Vừa đi vệ sinh xong rồi.", tieu: "Vừa đi vệ sinh xong rồi.", rua_mat: "Mặt còn ướt nhẹp, rửa nữa thì tróc da.", tra_bac_binh: "Bác Bình: \"Từ từ cháu, ấm trà đang pha lại.\"" };
  const lanDung = new Map();
  // đi xe buýt: chọn trạm xuống, chờ xe, ngồi trên xe một lúc rồi xuống trạm
  const GIA_BUYT = 7000;
  const diXeBuyt = v => {
    const gio = L.phutGame / 60;
    if (gio < 5 || gio >= 22) { thongBao3D("Xe buýt số 69 nghỉ từ 22:00 tới 5:00 sáng. Gọi xe ôm trong điện thoại nhé."); return; }
    const tien = Number(L.v("tien")) || 0;
    if (tien < GIA_BUYT) { thongBao3D(`Không đủ tiền vé. Ví còn ${vnd(tien)}.`); return; }
    const di = TRAM_BUYT.filter(t => Math.hypot(t.x - v.x, t.z - v.z) > 5);
    moHoiThoai("Trạm xe buýt số 69");
    UI.choices.replaceChildren(
      ...di.map(t => h("button", { class: "choice", onclick: () => {
        dongHoiThoai(); thongBao3D("Đang chờ xe buýt số 69…");
        setTimeout(() => {
          L.set("tien", (Number(L.v("tien")) || 0) - GIA_BUYT); L.ghiGiaoDich(`Vé xe buýt số 69 tới ${t.ten}`, -GIA_BUYT); am.phat("tien");
          chuyenCanh("Lên xe buýt số 69", () => {
            g.denNgoai("xe_buyt", "Xe buýt số 69", []);
            thongBao3D(`Xe buýt đang chạy tới ${t.ten}. Tìm chỗ ngồi đi.`); sinhTon?.veLai(); updateSide();
            setTimeout(() => {
              if (G !== g || !g.oNgoai()) return;
              chuyenCanh(`Xuống ${t.ten}`, () => {
                g.traNpcVeCho(); g.datViTri({ tang: 0, x: t.x, z: t.z + (t.huong === 0 ? -0.8 : 0), huong: t.huong }); // xuống xe, quay mặt ra đường
                L.phutGame = Math.min(L.phutGame + 12, Math.max(L.phutGame, tranGio())); hienGio();
              });
            }, 15000);
          });
        }, 3500);
      } }, `Đi tới ${t.ten} (${vnd(GIA_BUYT)})`)),
      h("button", { class: "choice", onclick: () => dongHoiThoai() }, "Thôi, không đi"));
  };
  g.onDoVat = v => {
    if (v.loai === "xe_buyt") return diXeBuyt(v);
    const d = DUNG_DO[v.loai]; if (!d) return;
    const khoa = v.loai + ":" + (v.meo?.ten || `${Math.round(v.x ?? 0)},${Math.round(v.z ?? 0)}`);
    const conCho = (CHO_DUNG[v.loai] || 10) * 1000 - (Date.now() - (lanDung.get(khoa) || 0));
    if (conCho > 0) { thongBao3D(CAU_CHO[v.loai] || `Vừa ${(d.chu || "dùng").toLowerCase()} xong. Đợi khoảng ${Math.ceil(conCho / 1000)} giây nữa.`); return; }
    // no quá thì không ăn nổi, không khát thì không uống
    const tang = Object.entries(d.doi).filter(([k, x]) => (k === "no" || k === "khat") && x > 0);
    if (tang.length && tang.every(([k]) => (Number(L.v(k)) || 0) >= 95)) { thongBao3D(tang[0][0] === "no" ? "No căng bụng rồi, ăn nữa là bể bụng." : "Không khát nữa. Uống thêm chỉ chạy WC."); return; }
    const gia = v.gia ?? d.gia ?? 0, tien = Number(L.v("tien")) || 0;
    if (gia > tien) { thongBao3D(`Không đủ tiền. Ví còn ${tien.toLocaleString("vi-VN")}đ.`); return; }
    lanDung.set(khoa, Date.now());
    const AM_DO = { wc: "xa_nuoc", tieu: "xa_nuoc", rua_mat: "voi_nuoc", uong_nuoc: "ong_nuoc", tu_lanh: "tu_lanh", mi_ly: "lo_vi_song", ca_phe: "may_ca_phe", trai_cay: "an", tra_bac_binh: "uong", banh_mi: "an", hu_tieu: "an", nuoc_mia: "uong", che: "an", tra_da: "uong", meo: Math.random() < 0.5 ? "meo" : "meo_ron", chim: "chim_gu", ca: "bong_bong" };
    const vx = v.meo?.x ?? v.x ?? g.p.x, vz = v.meo?.z ?? v.z ?? g.p.z;
    if (AM_DO[v.loai]) am.phat(AM_DO[v.loai], vx, vz);
    if (gia) am.phat("tien");
    const DEM_DO = { meo: "meo", chim: "chim", ca_phe: "ca_phe", wc: "wc", tieu: "wc" };
    if (DEM_DO[v.loai]) moThanhTuu(ghiNhan(DEM_DO[v.loai]));
    if (["banh_mi", "hu_tieu", "nuoc_mia", "che", "tra_da"].includes(v.loai)) moThanhTuu(ghiMonPho(v.loai));
    const lam = cb => d.chu ? chuyenCanh(d.chu + "…", cb) : cb(); // vuốt mèo, ngắm cá, trà đá: làm ngay
    lam(() => {
      const doi = { ...d.doi };
      if (v.loai === "ca_phe" && ++soCaPhe > 3) { doi.stress = (doi.stress || 0) + 5; thongBao3D("Ly cà phê thứ " + soCaPhe + " trong ngày. Tim bắt đầu đập loạn."); }
      for (const [k, x] of Object.entries(doi)) L.set(k, Math.max(0, Math.min(100, (Number(L.v(k)) || 0) + x)));
      if (gia) { L.set("tien", tien - gia); L.ghiGiaoDich(d.chu || "Mua đồ ăn uống", -gia); }
      thongBao3D(d.ket[Math.floor(Math.random() * d.ket.length)]);
      const chiSo = [...Object.entries(doi).map(([k, x]) => `${TEN_CHI_SO[k]} ${x > 0 ? "+" : ""}${x}`), ...(gia ? [`-${gia.toLocaleString("vi-VN")}đ`] : [])].join(" · ");
      setTimeout(() => thongBao3D(chiSo), 400);
      sinhTon?.daMua(v.loai, gia);
      updateSide(); sinhTon?.veLai();
    });
  };
  // ngồi làm việc ở bàn mình: mệt dần, đủ 2 phút làm xong một đầu việc (uy tín tăng, stress nhích lên)
  let giayLam = 0;
  g.onLamViec = giay => {
    giayLam += giay;
    L.set("nang_luong", Math.max(0, (Number(L.v("nang_luong")) || 0) - giay * 0.05));
    if (giayLam >= 120) {
      giayLam -= 120;
      L.set("uy_tin", (Number(L.v("uy_tin")) || 0) + 1); L.set("stress", Math.min(100, (Number(L.v("stress")) || 0) + 2));
      thongBao3D("Xong một đầu việc. Uy tín +1, Stress +2"); updateSide(); sinhTon?.veLai();
    }
  };
  g.onCong = () => { if (L.qi >= L.queue.length) hoiDiNgu(); else thongBao3D("Hôm nay vẫn còn việc ở công ty."); };

  // ----- hội thoại -----
  moHoiThoai = ten => { kt.mo(ten); bamTiep.hidden = true; if (daVao) tamNgung.hidden = true; lichSu.hidden = true; g.datKhoa(true); app.querySelector(".g3d")?.classList.add("dang-thoai"); };
  dongHoiThoai = () => {
    kt.dong(); clearInterval(timerHandle); g.datKhoa(false); app.querySelector(".g3d")?.classList.remove("dang-thoai");
    if (!g.dienThoai && daVao && document.pointerLockElement !== g.canvas) bamTiep.hidden = false;
  };
  // thông báo: câu đang hiện thì không lặp lại (chỉ gia hạn), tối đa 3 dòng cùng lúc
  thongBao3D = text => {
    const cu = [...toast.children].find(x => x.textContent === text && !x.classList.contains("het"));
    const henGio = el => { clearTimeout(el._t1); clearTimeout(el._t2); el._t1 = setTimeout(() => el.classList.add("het"), 2600); el._t2 = setTimeout(() => el.remove(), 3200); };
    if (cu) { henGio(cu); return; }
    const el = h("div", {}, text); toast.append(el); henGio(el); am.phat("ting");
    const conHien = [...toast.children].filter(x => !x.classList.contains("het"));
    for (const x of conHien.slice(0, Math.max(0, conHien.length - 3))) { x.classList.add("het"); setTimeout(() => x.remove(), 400); }
  };
  const datMucTieuHUD = (chu, phu) => { mtChu.textContent = chu; mtPhu.textContent = phu || ""; mucTieu.hidden = !chu; };
  const chuyenCanh = (chu, xong) => {
    man.textContent = chu; man.classList.add("on"); am.phat("chuyen_canh");
    setTimeout(() => { xong?.(); setTimeout(() => man.classList.remove("on"), 350); }, 450);
  };
  const khuMacDinh = () => KHU_CUA_VAI[L.ma] || "khu_lam_viec";
  const huongDanTang = (k) => k.tang === g.tang ? "" : k.tang === 0 ? "Xuống tầng 1 bằng cầu thang" : k.tang === 1 ? (g.tang === 0 ? "Lên tầng 2 bằng cầu thang ở sảnh" : "Xuống tầng 2") : "Lên sân thượng từ tầng 2";

  nextScene3D = () => {
    saveWrite(L.toSave());
    L.boQuaCanhKhongDu();
    if (L.qi < L.queue.length) {
      const name = L.queue[L.qi];
      const k = L.knots.find(x => x.name === name);
      const noi = tag(k?.tags, "noi"), gio = tag(k?.tags, "gio");
      // địa điểm ngoài công ty có bối cảnh 3D riêng, hoặc một góc phố có sẵn trong thành phố
      const idNgoai = diaDiemCuaNoi(noi), diemPho = !idNgoai && noi && DIEM_PHO[noi];
      const khu = idNgoai || diemPho ? "ra_ngoai" : (khuCuaNoi(noi) || khuMacDinh());
      const kv = KHU[khu];
      // đang ở sân khấu hay ở ngoài mà cảnh tiếp theo ở công ty: đưa về cổng
      if (!kv.ngoai && khu !== "ra_ngoai" && g.tang === 0 && (g.p.x > 80 || g.oNgoai())) { g.traNpcVeCho(); g.datViTri(DIEM_DAU_NGAY); }
      dongHoiThoai();
      const tenNoi = khu === "ra_ngoai" ? prettyNoi(noi) : kv.ten;
      datMucTieuHUD(tenNoi, khu === "ra_ngoai" ? "Ra cổng công ty để đi" : (huongDanTang(kv) || (gio && gio !== true ? `Lúc ${gio}` : "")));
      if (kv.ngoai) { // sân khấu Đại Nhạc Hội: ra cổng rồi tới thẳng khán đài
        const toi = () => { datMucTieuHUD(""); L.qi++; toiGioCanh(gio); chuyenCanh(kv.ten, () => { g.datViTri(CHO_XEM); moHoiThoai(kv.ten); playKnot(name, v => afterScene(v)); }); };
        if (g.p.x > 80) toi(); else g.datMucTieu("ra_ngoai", toi);
        return;
      }
      if (idNgoai || diemPho) {
        const dsNguoi = (k?.noi || []).filter(m => m !== L.ma && m in CHO_NGOI_3D);
        const toi = () => {
          datMucTieuHUD(""); L.qi++; toiGioCanh(gio); sinhTon?.quaCanh();
          chuyenCanh(tenNoi, () => {
            if (idNgoai) g.denNgoai(noi, tenNoi, dsNguoi);
            else { g.traNpcVeCho(); g.xoaMucTieu(); g.datViTri({ tang: 0, ...diemPho }); if (dsNguoi[0]) g.goiNguoiToi(dsNguoi[0]); }
            moHoiThoai(tenNoi); playKnot(name, v => afterScene(v));
          });
        };
        if (g.oNgoai() || g.p.x > 80) toi(); else g.datMucTieu("ra_ngoai", toi);
        return;
      }
      const nguoi = (k?.noi || []).find(m => m !== L.ma && m in CHO_NGOI_3D) || null;
      if (nguoi) datMucTieuHUD(`${tenNoi}: gặp ${L.v(nguoi) || THEO_MA[nguoi]?.ten || ""}`, huongDanTang(kv) || "Tới gần để nói chuyện");
      g.datMucTieu(khu, () => {
        datMucTieuHUD("");
        L.qi++; toiGioCanh(gio);
        sinhTon?.quaCanh();
        const mo = () => { moHoiThoai(tenNoi); playKnot(name, v => afterScene(v)); };
        if (khu === "ra_ngoai") chuyenCanh(tenNoi, mo); else mo();
      }, { nguoi: khu === "ra_ngoai" ? null : nguoi });
      return;
    }
    dayEnd3D();
  };
  dayEnd3D = () => {
    saveWrite(L.toSave());
    if (L.ngay >= 31) {
      // 19:30 Đại Nhạc Hội: ra cổng, tới khán đài đứng giữa đám đông rồi mới bắt đầu
      dongHoiThoai(); datGioTT(19, 30); updateDayline("19:30", "san_khau_dem_hong");
      const vao = () => { datMucTieuHUD(""); chuyenCanh("Sân khấu Đại Nhạc Hội", () => { g.datViTri(CHO_XEM); moHoiThoai("Đại Nhạc Hội Siêu Nhân"); finale(); }); };
      if (g.p.x > 80 || g.oNgoai()) vao(); else { datMucTieuHUD("Đại Nhạc Hội Siêu Nhân sắp bắt đầu", "Ra cổng để tới sân khấu"); g.datMucTieu("ra_ngoai", vao); }
      return;
    }
    dongHoiThoai();
    if (L.phutGame < 17 * 60 + 30) datGioTT(17, 30);
    if (g.oNgoai()) { hoiDiNgu(); return; } // đang ở ngoài: về thẳng nhà
    datMucTieuHUD("Hết giờ làm. Ra cổng để về nhà", "Có thể nói chuyện với đồng nghiệp trước khi về");
    g.datMucTieu("ra_ngoai", hoiDiNgu);
  };
  const hoiDiNgu = () => {
    g.xoaMucTieu(); datMucTieuHUD("");
    moHoiThoai(g.oNgoai() ? "Hết một ngày" : "Cổng công ty");
    UI.choices.replaceChildren(
      h("button", { class: "choice", onclick: () => { UI.choices.replaceChildren(); tongKetNgay(() => {
        chuyenCanh(`Sáng ${ngayDayDu(L.ngay + 1)}`, () => {
          const ghiChu = L.batDauNgay(L.ngay + 1);
          g.traNpcVeCho(); g.datViTri(DIEM_DAU_NGAY); datGioTT(8, 0); g.xepLichNgay(); nutTin.hidden = true;
          ghiChu.forEach(x => thongBao3D(x));
          soCaPhe = 0; sinhTon?.ngayMoi();
          nextScene3D();
        });
      }); } }, `Về nhà ngủ, sang ${ngayDayDu(L.ngay + 1)}`),
      h("button", { class: "choice", onclick: () => {
        dongHoiThoai();
        const o = () => { datMucTieuHUD("Ra cổng để về nhà"); g.datMucTieu("ra_ngoai", hoiDiNgu, { phaiRoiKhoi: true }); };
        if (g.oNgoai()) chuyenCanh("Quay lại công ty", () => { g.traNpcVeCho(); g.datViTri(DIEM_DAU_NGAY); o(); }); else o();
      } }, g.oNgoai() ? "Quay lại công ty" : "Ở lại thêm"),
    );
  };
  const noiChuyen3D = ma => {
    if (sinhTon?.giao(ma)) return; // đang cầm món đồng nghiệp nhờ mua
    const k = L.npcKnots().find(x => tag(x.tags, "npc") === ma && !L.npcDone.has(x.name));
    const ten = L.v(ma) || THEO_MA[ma]?.ten || ma;
    if (!k) { thongBao3D(`${ten}: "${g.cauBan(ma)}"`); return; }
    L.npcDone.add(k.name);
    moHoiThoai(`Nói chuyện với ${ten}`);
    playKnot(k.name, () => UI.choices.replaceChildren(h("button", { class: "choice", onclick: () => { saveWrite(L.toSave()); dongHoiThoai(); } }, "Xong")));
  };

  // ----- tổng kết cuối ngày -----
  let dangSangNgay = false; // chặn bấm liên tục làm nhảy nhiều ngày
  const tongKetNgay = tiep => {
    if (dangSangNgay || app.querySelector(".tk-lop")) return;
    const dau = L.dauNgay || L.chupChiSo(), nay = L.chupChiSo();
    const lech = (k, dv = "") => { const d = nay[k] - dau[k]; return (d > 0 ? "+" : d < 0 ? "−" : "") + (dv === "đ" ? vnd(Math.abs(d)) : so(Math.abs(d))); };
    const qh = NHAN_VAT.filter(n => n.ma !== L.ma).map(n => [n, nay["qh_" + n.ma] - dau["qh_" + n.ma]]).filter(([, d]) => d).sort((a, b) => Math.abs(b[1]) - Math.abs(a[1])).slice(0, 5);
    const dong_ = (nhan, gt, xau) => h("div", { class: "tk-dong" + (xau ? " xau" : "") }, h("span", {}, nhan), h("b", {}, gt));
    const lop = h("div", { class: "tk-lop" }, h("div", { class: "tk" },
      h("small", {}, "Tổng kết ngày"), h("h2", {}, ngayDayDu(L.ngay)),
      h("div", { class: "tk-nhom" },
        dong_("Tiền trong ví", `${vnd(nay.tien)} (${lech("tien", "đ")})`, nay.tien < dau.tien),
        dong_("Người theo dõi Siêu Nhân Hồng", `${so(nay.nguoi_theo_doi)} (${lech("nguoi_theo_doi")})`, nay.nguoi_theo_doi < dau.nguoi_theo_doi),
        dong_("Uy tín", `${so(nay.uy_tin)} (${lech("uy_tin")})`, nay.uy_tin < dau.uy_tin),
        dong_("Stress", `${so(nay.stress)} (${lech("stress")})`, nay.stress > dau.stress),
        dong_("Tinh thần công ty", `${so(nay.tinh_than_cong_ty)} (${lech("tinh_than_cong_ty")})`, nay.tinh_than_cong_ty < dau.tinh_than_cong_ty),
        dong_("Cảnh đã trải qua hôm nay", so(nay.so_canh - dau.so_canh))),
      qh.length ? h("div", { class: "tk-nhom" }, h("small", {}, "Quan hệ thay đổi"),
        qh.map(([n, d]) => dong_(L.v(n.ma) || n.ten, (d > 0 ? "+" : "−") + Math.abs(d), d < 0))) : null,
      h("p", { class: "tk-con" }, L.ngay < 31 ? `Còn ${31 - L.ngay} ngày tới Đại Nhạc Hội Siêu Nhân.` : ""),
      h("button", { class: "btn primary", onclick: () => { if (dangSangNgay) return; dangSangNgay = true; lop.remove(); tiep(); setTimeout(() => { dangSangNgay = false; }, 1500); } }, "Đi ngủ")));
    app.querySelector(".g3d").append(lop); lop.querySelector("button").focus();
    if (Number(L.v("nguoi_theo_doi")) >= MUC_TIEU) moThanhTuu(ghiNhan("mot_trieu", 1, { dat: true }));
  };

  // ----- điện thoại -----
  const TEN_DIEM = { duong: "Đường Hóng Chính", dai_lo_ket_xe: "Đại lộ Kẹt Xe", cho_pho_cu: "Chợ Phố Cũ", pho_tan_drama: "Phố Tán Drama", cong_vien: "Công viên Quận Hóng", dau_hem: "Đầu hẻm 69", san_bong_mini: "Sân bóng mini", chua_pho_cu: "Chùa Phố Cũ", tram_xe_buyt: "Trạm xe buýt" };
  const diemXeOm = () => {
    const ds = [{ ten: "Công ty G-Entertainment", x: DIEM_DAU_NGAY.x, z: DIEM_DAU_NGAY.z, huong: 0, mau: "#e8702a" },
      ...Object.entries(TEN_DIEM).filter(([k]) => DIEM_PHO[k]).map(([k, ten]) => ({ ten, ...DIEM_PHO[k] }))];
    for (const d of ds) {
      // xuống xe quay mặt ra đường (không úp mặt vào cửa nhà người ta)
      const duongX = Math.abs(d.x - 52) < 12 && Math.abs(d.z - 37) > 6, tx = duongX ? 52 : d.x, tz = duongX ? d.z : 37;
      if (Math.hypot(tx - d.x, tz - d.z) > 0.5) d.huong = Math.atan2(-(tx - d.x), -(tz - d.z));
      const kc = g.oNgoai() ? 300 : Math.hypot(d.x - g.p.x, d.z - g.p.z);
      d.oDay = !g.oNgoai() && g.tang === 0 && kc < 8;
      d.gia = Math.min(40000, 12000 + Math.round(kc / 10) * 1000); d.phut = Math.ceil(kc / 40) + 4;
    }
    return ds;
  };
  const diXeOm = d => {
    const tien = Number(L.v("tien")) || 0; if (d.gia > tien) return;
    L.set("tien", tien - d.gia); L.ghiGiaoDich(`Xe Ôm Hóng: ${d.ten}`, -d.gia); am.phat("tien"); moThanhTuu(ghiNhan("xe_om"));
    chuyenCanh(`Xe ôm chở bạn tới ${d.ten}`, () => {
      g.traNpcVeCho(); g.datViTri({ tang: 0, x: d.x, z: d.z, huong: d.huong ?? 0 });
      L.phutGame = Math.min(L.phutGame + d.phut, Math.max(L.phutGame, tranGio())); hienGio();
      thongBao3D(`Đã tới ${d.ten}. Trả ${vnd(d.gia)}.`); sinhTon?.veLai(); updateSide();
    });
  };
  DT = taoDienThoai({
    h, L, g, META, NHAN_VAT, THEO_MA, MUC_TIEU, so, vnd, ngayDayDu, SU_KIEN_NGAY,
    tenCua: ma => L.v(ma) || THEO_MA[ma]?.ten || ma,
    khung: () => app.querySelector(".g3d"),
    tinCho: () => nutTin.hidden ? null : nguoiGuiTin(nutTin.dataset.ten),
    moTin: () => nutTin.click(),
    diemXeOm, diXeOm, viecVat: () => sinhTon?.viecToi(),
    thongBao: x => thongBao3D(x),
    // dự báo thời tiết theo buổi (lấy đúng lịch thời tiết của game)
    thoiTiet: ngay => [["Sáng", 9, 0], ["Chiều", 14, 1], ["Tối", 20, -2]].map(([buoi, gio, d]) => { const t = G3D_MOD.THOI_TIET[thoiTietLuc(ngay, gio)]; return { buoi, ten: t.ten, nhiet: t.nhiet + d }; }),
    muaHang: (ten, gia) => {
      const tien = Number(L.v("tien")) || 0; if (gia > tien) return false;
      L.set("tien", tien - gia); L.ghiGiaoDich(`Sốp-pi: ${ten}`, -gia);
      L.set("stress", Math.max(0, (Number(L.v("stress")) || 0) - 2));
      am.phat("tien"); thongBao3D(`Đặt hàng thành công: ${ten}. Giao sau 3 đến 5 ngày. Stress −2`); updateSide(); sinhTon?.veLai();
      return true;
    },
    ghiChu: () => {
      const n = THEO_MA[L.ma], vv = sinhTon?.viecToi();
      return [
        ["Việc tiếp theo", mtChu.textContent ? `${mtChu.textContent}${mtPhu.textContent ? ". " + mtPhu.textContent : ""}` : "Không có việc gấp. Đi dạo, ăn uống, nói chuyện với đồng nghiệp."],
        ...(vv ? [["Việc vặt", [...(app.querySelector(".st-viec")?.children || [])].map(x => x.textContent).join(". ")]] : []),
        ["Mục tiêu công ty", `Đưa Siêu Nhân Hồng lên ${so(MUC_TIEU)} người theo dõi trước Đại Nhạc Hội 31/10.`],
        ["Về tôi", `${n.vai} · ${n.chuc}. "${n.cau}"`],
        ["Nhắc nhở", "Đói thì ăn, khát thì uống, mệt thì nghỉ. Xỉu là hết tháng."],
      ];
    },
    moCaiDat: () => moCaiDat(h, { trongGame: true }),
    dangThoai: () => !app.querySelector(".g3d-thoai")?.hidden || !!g.capCuu,
  });
  UI.dienThoai = DT;

  // bắt đầu
  const henTD = setInterval(() => { if (G !== g) clearInterval(henTD); else UI.capNhatTheoDoi?.(); }, 1000);
  g.datViTri(DIEM_DAU_NGAY); datGioTT(Math.floor(L.phutGame / 60), L.phutGame % 60);
  setTimeout(() => g.xepLichNgay(), 0);
  if (!L.queue.length && L.qi === 0 && L.ngay === 1 && !L.played.size) L.batDauNgay(1);
  setTimeout(() => sinhTon?.ngayMoi(), 2500);
  thongBao3D(`${ngayDayDu(L.ngay)}${SU_KIEN_NGAY[L.ngay] ? " · " + SU_KIEN_NGAY[L.ngay] : ""}`);
  nextScene3D();
}
let sinhTon = null, SINH_TON = null;
// thành tựu vừa mở: báo trên màn hình
function moThanhTuu(ds) { for (const t of ds || []) { thongBao3D(`Thành tựu mới: ${t.ten}`); am.phat("thang"); } }
let DT = null; // điện thoại trong game
let moHoiThoai = () => {}, dongHoiThoai = () => {}, thongBao3D = () => {}, nextScene3D = () => {}, dayEnd3D = () => {};
// Phím tắt bản 3D: Space/Enter đọc tiếp, 1-9 chọn, H lịch sử, Tab chỉ số
addEventListener("keydown", e => {
  if (CHE_DO !== "3d" || e.target.closest?.("input, textarea")) return;
  if (e.repeat && e.code !== "Tab") return; // giữ phím không tua thoại hay chọn liên tục
  if (e.code === "Tab") { e.preventDefault(); UI.bangChiSo?.(); return; }
  if (e.code === "KeyH" && G?.khoa) { e.preventDefault(); UI.lichSu?.(); return; }
  if ((e.code === "KeyP" || e.code === "KeyM") && G && !G.khoa && !G.capCuu) { e.preventDefault(); UI.dienThoai?.mo(e.code === "KeyM" ? "ban_do" : "chinh"); return; }
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
    if (!c.narr) {
      am.blip(c.ten);
      // tiếng cảm xúc theo lời thoại: cười, thở dài, ngáp, ừ hử, câu hỏi
      const t = (c.html || "").replace(/<[^>]+>/g, "").toLowerCase();
      let cao = 1; for (const ch of c.ten || "") cao = (cao * 31 + ch.charCodeAt(0)) % 997; cao = 0.85 + (cao % 40) / 100;
      const cx = /cười|haha|hihi|hehe|khà khà/.test(t) ? "cuoi" : /thở dài|thở hắt|haizz|hây da/.test(t) ? "tho_dai" : /ngáp/.test(t) ? "ngap"
        : /^(ừ|ờ|ừm|à|dạ|ok|vâng)\b/.test(t) ? "u_hu" : /\?\s*$/.test(t) && Math.random() < 0.5 ? "hoi" : null;
      if (cx) setTimeout(() => am.HIEU_UNG[cx] && am.mo() && am.HIEU_UNG[cx].call(am, am.ctx.currentTime, null, null, cao), 120);
    }
    ten.hidden = !!c.narr; ten.textContent = c.me ? `${c.ten} (bạn)` : c.ten;
    ten.style.setProperty("--mau", c.me ? "#e8702a" : mauTen(c.ten || ""));
    chu.className = "g3d-chu" + (c.narr ? " narr" : "") + (c.me ? " me" : "");
    chu.innerHTML = c.html; phu.textContent = c.phu ? "Phụ đề: " + c.phu : ""; phu.hidden = !c.phu;
    chu.classList.remove("vao"); void chu.offsetWidth; chu.classList.add("vao");
  };
  const tiep = () => { if (hang.length) hien(hang.shift()); capNhat(); };
  const boQua = () => { if (hang.length) { hien(hang[hang.length - 1]); hang = []; } capNhat(); };
  new MutationObserver(ds => {
    let vuaChon = false;
    for (const d of ds) for (const n of d.addedNodes) { if (n.matches?.(".chosen")) { vuaChon = true; hang = []; continue; } const c = doc(n); if (c) hang.push(c); }
    // vừa chọn đáp án: hiện ngay câu tiếp theo, không phải bấm thêm
    if ((!coCau || vuaChon) && hang.length) hien(hang.shift());
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

renderHome();
