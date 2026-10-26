// Nhân vật low-poly: mặt vẽ riêng từng người, 21 kiểu tóc, trang phục tách khối rõ ràng (áo, quần, giày, phụ kiện).
// Ngoại hình theo docs/roles/ngoai-hinh.md. Nhân vật quay mặt về +z, đứng trên y = 0.
import * as THREE from "three";

// Chữ vẽ lên ảnh (bảng hiệu, poster, bảng tên) không bao giờ tràn khỏi khung: nếu không truyền độ rộng tối đa,
// tự tính theo chỗ còn trống trong khung và co chữ lại cho vừa.
if (typeof CanvasRenderingContext2D !== "undefined" && !CanvasRenderingContext2D.prototype.__vuaKhung) {
  const goc = CanvasRenderingContext2D.prototype.fillText;
  CanvasRenderingContext2D.prototype.fillText = function (t, x, y, maxW) {
    if (maxW === undefined) {
      const W = this.canvas.width, m = 6, a = this.textAlign;
      maxW = a === "center" ? 2 * Math.min(x, W - x) - 2 * m : a === "right" || a === "end" ? x - m : W - x - m;
      if (!(maxW > 0) || this.measureText(t).width <= maxW) return goc.call(this, t, x, y);
    }
    return goc.call(this, t, x, y, maxW);
  };
  CanvasRenderingContext2D.prototype.__vuaKhung = true;
}
import { gopKhoi } from "./gop-khoi.js";
import { gopNguoi } from "./toi-uu.js"; // gộp cả người thành một khối xương cứng (ít lượt vẽ)
import { cheDoNhe } from "../cai-dat.js";
import { dungNguoiMoi, taoChoMoi, dungTayNhin, TAY_A, giaiTay, matThanNv } from "./hinh-nguoi.js";
import { gopMuot } from "./toi-uu.js";
// người kiểu mới (khối tròn, tỉ lệ thật) ở mọi mức trừ "Thấp"; "Thấp" giữ nguyên người khối hộp cũ
export const kieuMoi = () => !cheDoNhe();
const MAT_PX = cheDoNhe() ? 128 : 256;

// ---------- Vật liệu dùng chung ----------
const vlCache = new Map();
export function vl(color, opts = {}) {
  const key = color + JSON.stringify(opts);
  if (!vlCache.has(key)) vlCache.set(key, new THREE.MeshLambertMaterial({ color, flatShading: true, ...opts }));
  return vlCache.get(key);
}
const texCache = new Map();
function vlTex(key, ve, lap = [1, 1]) {
  if (!texCache.has(key)) {
    const c = document.createElement("canvas"); c.width = c.height = 128;
    ve(c.getContext("2d"));
    const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.wrapS = t.wrapT = THREE.RepeatWrapping; t.repeat.set(...lap);
    t.magFilter = THREE.NearestFilter; t.anisotropy = 4;
    texCache.set(key, new THREE.MeshLambertMaterial({ map: t, flatShading: true }));
  }
  return texCache.get(key);
}
const hex = n => "#" + n.toString(16).padStart(6, "0");
const toiMau = (n, k = 0.8) => { const c = new THREE.Color(n); c.multiplyScalar(k); return c.getHex(); };

// Họa tiết vải
const VAI = {
  caro: (nen, ke) => vlTex(`caro${nen}${ke}`, g => { g.fillStyle = hex(nen); g.fillRect(0, 0, 128, 128); g.fillStyle = hex(ke) + "aa"; for (let i = 0; i < 128; i += 32) { g.fillRect(i, 0, 8, 128); g.fillRect(0, i, 128, 8); } }, [2, 2]),
  hoa: (nen, mau) => vlTex(`hoa${nen}${mau}`, g => {
    g.fillStyle = hex(nen); g.fillRect(0, 0, 128, 128);
    for (const [x, y, c] of [[24, 24, "#f6d2ff"], [84, 40, "#ffd166"], [44, 88, "#f6d2ff"], [104, 104, "#ffd166"], [8, 112, "#ffffff"]]) {
      g.fillStyle = c; for (let a = 0; a < 5; a++) { g.beginPath(); g.arc(x + Math.cos(a * 1.26) * 7, y + Math.sin(a * 1.26) * 7, 6, 0, 7); g.fill(); }
      g.fillStyle = hex(mau); g.beginPath(); g.arc(x, y, 4, 0, 7); g.fill();
    }
  }, [2, 2]),
  hoaNhi: (nen) => vlTex(`hoanhi${nen}`, g => { g.fillStyle = hex(nen); g.fillRect(0, 0, 128, 128); for (let i = 0; i < 40; i++) { g.fillStyle = ["#ffffff", "#f7e27a", "#f4a6c0"][i % 3]; g.beginPath(); g.arc((i * 37) % 128, (i * 59) % 128, 3, 0, 7); g.fill(); } }, [2, 3]),
  soc: (a, b) => vlTex(`soc${a}${b}`, g => { for (let i = 0; i < 128; i += 16) { g.fillStyle = hex(i % 32 ? b : a); g.fillRect(0, i, 128, 16); } }, [1, 2]),
  code: () => vlTex("code", g => { g.fillStyle = "#16171b"; g.fillRect(0, 0, 128, 128); g.fillStyle = "#3fe07a"; g.font = "bold 18px monospace"; g.fillText("</>", 40, 56); g.font = "11px monospace"; g.fillStyle = "#9fd3f2"; g.fillText("if(bug)", 30, 78); g.fillText("  sleep()", 30, 92); }),
  jean: (mau) => vlTex(`jean${mau}`, g => { g.fillStyle = hex(mau); g.fillRect(0, 0, 128, 128); g.strokeStyle = "rgba(255,255,255,.12)"; for (let i = -128; i < 128; i += 6) { g.beginPath(); g.moveTo(i, 0); g.lineTo(i + 128, 128); g.stroke(); } }, [1, 1]),
};

// ---------- Hình khối ----------
const hop = (w, h, d, mat, x = 0, y = 0, z = 0) => {
  const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mat === "number" ? vl(mat) : mat);
  m.position.set(x, y, z); return m;
};
// khối vuông vát (đáy và đỉnh rộng khác nhau) — dùng cho thân áo, váy
const vat = (wTren, wDuoi, h, d, mat, x = 0, y = 0, z = 0) => {
  const g = new THREE.CylinderGeometry(wTren / Math.SQRT2, wDuoi / Math.SQRT2, h, 4, 1); g.rotateY(Math.PI / 4);
  const m = new THREE.Mesh(g, typeof mat === "number" ? vl(mat) : mat); m.scale.z = d / Math.max(wTren, wDuoi); m.position.set(x, y, z); return m;
};
// gộp các khối tĩnh: màu trơn nướng vào đỉnh, khối có ảnh gộp theo vật liệu
const gop = nhom => gopKhoi(nhom);

// ---------- Bảng ngoại hình ----------
const DA = { sang: 0xf3cfae, vua: 0xe2b08a, ngam: 0xc8916a };
// mat: mat (tron|hep|cuoi|liec|met|lim|to), may (day|manh|nhuong|cau), mieng (cuoi_to|cuoi|thang|nhech|mim|ngap|meu|ho),
//      son, maHong, quang (0..2), nhan (nếp nhăn), rau, mi (lông mi dày)
// toc: kiểu tóc. ao/quan/giay: kiểu + màu. pk: phụ kiện
export { gop as gopNhom };
export const NGOAI_HINH = {
  ran_doc: { da: DA.sang, toc: ["ngoi", 0x1e1a17], mat: { mat: "cuoi", may: "manh", mieng: "cuoi_to" },
    ao: { kieu: "somi", mau: 0xf6f6f2, soVin: true }, quan: { kieu: "tay", mau: 0x6d6f73 }, giay: ["tay", 0x231f1c], pk: ["soTay", "butHong"] },
  giam_doc: { da: DA.vua, beo: true, toc: ["vuot_hoi", 0x16120f], mat: { mat: "hep", may: "day", mieng: "nhech", nhan: 1 },
    ao: { kieu: "vest", mau: 0x22305a, trong: 0xf6f6f2, caVat: 0xc0262d }, quan: { kieu: "tay", mau: 0x22305a }, giay: ["tay", 0x111111], pk: ["dongHoVang"] },
  truong_phong: { da: DA.sang, gay: true, toc: ["cua", 0x16120f], mat: { mat: "tron", may: "thang", mieng: "thang" },
    ao: { kieu: "somi", vai: VAI.caro(0xd8c7a3, 0x8a6a4a), mau: 0xd8c7a3, kinCo: true, soVin: true }, quan: { kieu: "tay", mau: 0xb39d72 }, giay: ["tay", 0x5a3d2a], pk: ["kinhVuong", "butTui"] },
  thanh_ninh: { da: DA.sang, nu: true, nho: true, toc: ["dai_uon", 0x3a2418, 0xf26fa6], mat: { mat: "to", may: "nhuong", mieng: "cuoi", son: 0xe0607e, maHong: true, mi: true },
    ao: { kieu: "vay_lien", mau: 0xf5b9cf }, quan: { kieu: "da" }, giay: ["caoGot", 0xf2f2f2], pk: ["binhGiuNhiet"] },
  hong_hot: { da: DA.vua, nu: true, beo: true, toc: ["bob", 0x7a4a2a], mat: { mat: "liec", may: "nhuong", mieng: "ho", son: 0xc75b6c, mi: true },
    ao: { kieu: "thun", mau: 0xe9e04a, rong: true }, quan: { kieu: "jean", mau: 0x4f6d9a, rach: true }, giay: ["sneaker", 0xf2f2f2], pk: ["dienThoai"] },
  con_ong_chau_cha: { da: DA.sang, cao: true, toc: ["undercut", 0xece6d2], mat: { mat: "hep", may: "day", mieng: "nhech" },
    ao: { kieu: "khoac", mau: 0x111111, trong: 0xf2f2f2, vien: 0xf2f2f2 }, quan: { kieu: "jogger", mau: 0x1c1c1f }, giay: ["sneaker", 0xffffff], pk: ["kinhRam", "taiNgheChup"] },
  chua_te_deadline: { da: DA.sang, toc: ["bu", 0x1c1714], mat: { mat: "met", may: "manh", mieng: "meu", quang: 1 },
    ao: { kieu: "hoodie", mau: 0x8a8d92 }, quan: { kieu: "short", mau: 0x3f4247 }, giay: ["depLe", 0x2a5aa8] },
  thuc_tap_sinh: { da: DA.vua, cao: true, toc: ["gon", 0x16120f], mat: { mat: "tron", may: "day", mieng: "cuoi", nhan: 1 },
    ao: { kieu: "polo", mau: 0x9cc3e6, soVin: true }, quan: { kieu: "tay", mau: 0x23262c }, giay: ["tay", 0x231f1c], pk: ["theDeo", "capDa"] },
  ke_toan: { da: DA.sang, nu: true, toc: ["buoi_cao", 0x16120f], mat: { mat: "hep", may: "cau", mieng: "thang", son: 0xa8505a },
    ao: { kieu: "somi", mau: 0x8a5a3c, kinCo: true, soVin: true }, quan: { kieu: "tay", mau: 0x3d2a1e }, giay: ["tay", 0x231f1c], pk: ["kinhLao"] },
  hr: { da: DA.vua, beo: true, toc: ["lat", 0x2a1c14], mat: { mat: "cuoi", may: "manh", mieng: "cuoi_to" },
    ao: { kieu: "somi", mau: 0xa8e6cf, soVin: true }, quan: { kieu: "tay", mau: 0x3a4250 }, giay: ["tay", 0x231f1c], pk: ["tachTra"] },
  it: { da: DA.sang, gay: true, toc: ["buoc", 0x111111], mat: { mat: "met", may: "manh", mieng: "thang", quang: 1 },
    ao: { kieu: "thun", vai: VAI.code(), mau: 0x16171b }, quan: { kieu: "jogger", mau: 0x2a2c31 }, giay: ["sneaker", 0x2a2c31], pk: ["taiNgheCo", "dayCap"] },
  idol_het_thoi: { da: DA.vua, toc: ["mullet", 0x5a3a1e, 0xd8a85a], mat: { mat: "tron", may: "nhuong", mieng: "cuoi" },
    ao: { kieu: "somi", vai: VAI.hoa(0x6b3fa0, 0xffffff), mau: 0x6b3fa0, moCo: true }, quan: { kieu: "loe", mau: 0x2b2440 }, giay: ["tay", 0xf2f2f2], pk: ["kinhRamTo", "micro"] },
  quan_ly_idol: { da: DA.vua, gay: true, toc: ["xoan", 0x2d2622, 0x9a9690], mat: { mat: "met", may: "cau", mieng: "thang", quang: 2, nhan: 1, rau: true },
    ao: { kieu: "vest", mau: 0x1c1c1f, trong: 0xf6f6f2 }, quan: { kieu: "tay", mau: 0x1c1c1f }, giay: ["tay", 0x111111], pk: ["bluetooth", "dienThoai"] },
  bien_kich: { da: DA.sang, nu: true, toc: ["thang_mai", 0x16120f], mat: { mat: "to", may: "manh", mieng: "mim", son: 0xd77a8a, maHong: true, mi: true },
    ao: { kieu: "vay_dai", vai: VAI.hoaNhi(0x2f6b3a), mau: 0x2f6b3a, khoac: 0xe9dcc4 }, quan: { kieu: "da" }, giay: ["bupBe", 0x6b4a2f], pk: ["kinhTron", "soDa"] },
  editor: { da: DA.sang, gay: true, toc: ["to_qua", 0x1c1714], mat: { mat: "met", may: "manh", mieng: "ngap", quang: 2 },
    ao: { kieu: "hoodie", mau: 0x1f2a3d }, quan: { kieu: "jogger", mau: 0x15161a }, giay: ["sneaker", 0x15161a], pk: ["muLen", "taiNgheChup", "cocRender"] },
  designer: { da: DA.vua, nu: true, cao: true, toc: ["bob_lech", 0x1fb3a5], mat: { mat: "tron", may: "manh", mieng: "cuoi", son: 0xc75b6c, mi: true },
    ao: { kieu: "yem", vai: VAI.soc(0xf6f6f2, 0x23262c), mau: 0xf6f6f2, yem: VAI.jean(0x3f6f9f) }, quan: { kieu: "jean", mau: 0x3f6f9f }, giay: ["converse", 0xc0262d], pk: ["butCamUng"] },
  sales: { da: DA.sang, nu: true, nho: true, toc: ["dai_song", 0x2a1c14], mat: { mat: "to", may: "nhuong", mieng: "cuoi_to", son: 0xe0262f, maHong: true, mi: true },
    ao: { kieu: "vest_nu", mau: 0xd8262f, trong: 0x111111 }, quan: { kieu: "vay_but", mau: 0xd8262f }, giay: ["caoGot", 0x111111], pk: ["dienThoaiTai", "tuiXach"] },
  chi_dai: { da: DA.vua, nu: true, toc: ["duoi_ngua_dai", 0x111111], mat: { mat: "hep", may: "day", mieng: "nhech", son: 0xb0404a, mi: true, maHong: true },
    ao: { kieu: "thun", mau: 0x7d1424, bo: true }, quan: { kieu: "tuihop", mau: 0x4b5130 }, giay: ["sneaker", 0x2a2c31], pk: ["boDam"] },
  dan_dau_tu: { da: DA.vua, toc: ["thua_lech", 0x2d2622], mat: { mat: "tron", may: "cau", mieng: "meu", quang: 1, nhan: 1, rau: true },
    ao: { kieu: "somi", mau: 0xe8e8e2, nhan: true }, quan: { kieu: "tay", mau: 0x3a3d44 }, giay: ["tay", 0x231f1c], pk: ["caVatLong", "dienThoai", "vongTay"] },
  thanh_xin_nghi: { da: DA.sang, toc: ["re_giua", 0x16120f], mat: { mat: "met", may: "cau", mieng: "thang", quang: 1 },
    ao: { kieu: "len", mau: 0xa9d3ee }, quan: { kieu: "tay", mau: 0x3a4250 }, giay: ["tay", 0x231f1c], pk: ["khauTrangCam"] },
  bac_bao_ve: { da: DA.ngam, gay: true, toc: ["cua", 0xa8a49c], mat: { mat: "hep", may: "day", mieng: "mim", nhan: 2 },
    ao: { kieu: "dong_phuc", mau: 0x2a5aa8 }, quan: { kieu: "tay", mau: 0x23406f }, giay: ["depLe", 0x8a7a64], pk: ["muKepi", "chumChiaKhoa"] },
  // Siêu Nhân Hồng: bộ Pink Ranger (đồ liền thân hồng, yếm trắng hình thoi, găng / ủng trắng, mũ kính trái tim) trên dáng
  // anh mập (bụng to, đùi to, tay to). Không có mặt (đội mũ kín), da = màu găng tay.
  sieu_nhan_hong: { sieuNhan: true, beo: true, da: 0xf6f6f2, ao: { kieu: "sieu", mau: 0xf26fa6 }, quan: { kieu: "tay", mau: 0xf26fa6 }, giay: ["ung", 0xf6f6f2], pk: [] },
  cho: { cho: true },
};

// ---------- Khuôn mặt (vẽ lên mặt trước của đầu) ----------
function veMat(nh) {
  const m = nh.mat || {};
  const key = JSON.stringify([nh.da, m, nh.toc?.[1]]);
  if (texCache.has("mat" + key)) return texCache.get("mat" + key);
  const c = document.createElement("canvas"); c.width = c.height = MAT_PX; // máy yếu: ảnh mặt 128 px cho nhẹ bộ nhớ
  const g = c.getContext("2d"); g.scale(MAT_PX / 256, MAT_PX / 256);
  const da = new THREE.Color(nh.da), daToi = "#" + da.clone().multiplyScalar(0.78).getHexString();
  g.fillStyle = hex(nh.da); g.fillRect(0, 0, 256, 256);
  const mauMay = nh.toc ? hex(toiMau(nh.toc[1], nh.toc[1] > 0x909090 ? 0.6 : 1)) : "#2a2018";
  const mY = 118, mx = [80, 176];
  // nếp nhăn, má hồng, râu
  if (m.maHong) { g.fillStyle = "rgba(240,120,140,.35)"; for (const x of mx) { g.beginPath(); g.ellipse(x, 172, 24, 12, 0, 0, 7); g.fill(); } }
  if (m.rau) { g.fillStyle = "rgba(40,30,25,.22)"; for (let i = 0; i < 160; i++) { const x = 70 + ((i * 53) % 116), y = 188 + ((i * 29) % 52); g.fillRect(x, y, 2, 2); } }
  g.strokeStyle = daToi; g.lineCap = "round";
  if (m.nhan) {
    g.lineWidth = 3;
    g.beginPath(); g.moveTo(92, 52); g.lineTo(164, 52); g.stroke();
    if (m.nhan > 1) { g.beginPath(); g.moveTo(98, 66); g.lineTo(158, 66); g.stroke(); g.beginPath(); g.arc(86, 180, 26, -0.3, 0.9); g.stroke(); g.beginPath(); g.arc(170, 180, 26, Math.PI - 0.9, Math.PI + 0.3); g.stroke(); }
  }
  // quầng thâm
  if (m.quang) { g.fillStyle = m.quang > 1 ? "rgba(90,60,110,.45)" : "rgba(110,80,120,.28)"; for (const x of mx) { g.beginPath(); g.ellipse(x, mY + 20, 26, 9, 0, 0, 7); g.fill(); } }
  // mắt
  for (const [i, x] of mx.entries()) {
    const kieu = m.mat || "tron";
    if (kieu === "cuoi") { g.strokeStyle = "#1d1714"; g.lineWidth = 7; g.beginPath(); g.arc(x, mY + 10, 17, Math.PI * 1.15, Math.PI * 1.85); g.stroke(); continue; }
    const ry = kieu === "hep" ? 8 : kieu === "met" ? 9 : kieu === "to" ? 17 : 14, rx = kieu === "to" ? 22 : 20;
    g.fillStyle = "#ffffff"; g.beginPath(); g.ellipse(x, mY, rx, ry, 0, 0, 7); g.fill();
    const lech = kieu === "liec" ? (i ? 9 : 9) : 0;
    g.fillStyle = "#3b2618"; g.beginPath(); g.arc(x + lech, mY + 1, Math.min(ry, 11), 0, 7); g.fill();
    g.fillStyle = "#0d0907"; g.beginPath(); g.arc(x + lech, mY + 1, Math.min(ry, 11) * 0.5, 0, 7); g.fill();
    g.fillStyle = "#ffffff"; g.beginPath(); g.arc(x + lech + 4, mY - 3, 3, 0, 7); g.fill();
    if (kieu === "met") { g.fillStyle = daToi; g.fillRect(x - rx - 2, mY - ry - 2, rx * 2 + 4, ry + 1); }
    g.strokeStyle = "#1d1714"; g.lineWidth = m.mi ? 5 : 3; g.beginPath(); g.ellipse(x, mY, rx, ry, 0, Math.PI * 1.05, Math.PI * 1.95); g.stroke();
    if (m.mi) { g.lineWidth = 3; const ngoai = i ? 1 : -1; g.beginPath(); g.moveTo(x + ngoai * rx * 0.9, mY - ry * 0.5); g.lineTo(x + ngoai * (rx + 8), mY - ry - 4); g.stroke(); }
  }
  // lông mày
  g.strokeStyle = mauMay; g.lineWidth = m.may === "day" ? 10 : m.may === "manh" ? 5 : 7;
  for (const [i, x] of mx.entries()) {
    const s = i ? 1 : -1;
    let y1 = mY - 32, y2 = mY - 32;
    if (m.may === "nhuong") { y1 -= 4; y2 -= 10; } else if (m.may === "cau") { y1 -= 8; y2 += 2; } else if (m.may === "day") { y1 += 2; y2 -= 2; }
    g.beginPath(); g.moveTo(x - s * 20, y1); g.quadraticCurveTo(x, Math.min(y1, y2) - 5, x + s * 22, y2); g.stroke();
  }
  // mũi (bóng nhẹ, khối mũi 3D nằm trên)
  g.fillStyle = daToi; g.beginPath(); g.ellipse(128, 168, 14, 5, 0, 0, 7); g.fill();
  // miệng
  const my = 200, son = m.son ? hex(m.son) : "#8a4a3a";
  g.strokeStyle = son; g.fillStyle = son; g.lineWidth = 6;
  switch (m.mieng) {
    case "cuoi_to": g.fillStyle = "#5a1f1f"; g.beginPath(); g.moveTo(96, my - 6); g.quadraticCurveTo(128, my + 34, 160, my - 6); g.closePath(); g.fill();
      g.fillStyle = "#ffffff"; g.fillRect(104, my - 6, 48, 9); g.strokeStyle = son; g.lineWidth = 4; g.beginPath(); g.moveTo(96, my - 6); g.quadraticCurveTo(128, my + 34, 160, my - 6); g.closePath(); g.stroke(); break;
    case "cuoi": g.beginPath(); g.moveTo(104, my - 4); g.quadraticCurveTo(128, my + 14, 152, my - 4); g.stroke(); break;
    case "nhech": g.beginPath(); g.moveTo(106, my + 2); g.quadraticCurveTo(136, my + 4, 154, my - 8); g.stroke(); break;
    case "mim": g.beginPath(); g.moveTo(112, my); g.quadraticCurveTo(128, my + 6, 144, my); g.stroke(); break;
    case "ngap": g.fillStyle = "#4a1a1a"; g.beginPath(); g.ellipse(128, my + 2, 13, 17, 0, 0, 7); g.fill(); break;
    case "meu": g.beginPath(); g.moveTo(108, my + 6); g.quadraticCurveTo(128, my - 6, 148, my + 6); g.stroke(); break;
    case "ho": g.fillStyle = "#4a1a1a"; g.beginPath(); g.ellipse(128, my, 9, 10, 0, 0, 7); g.fill(); g.strokeStyle = son; g.lineWidth = 4; g.stroke(); break;
    default: g.beginPath(); g.moveTo(108, my); g.lineTo(148, my); g.stroke();
  }
  if (m.son && m.mieng !== "cuoi_to" && m.mieng !== "ngap" && m.mieng !== "ho") { g.fillStyle = son; g.beginPath(); g.ellipse(128, my + 6, 16, 5, 0, 0, 7); g.fill(); }
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4;
  const vlMat = new THREE.MeshLambertMaterial({ map: t });
  texCache.set("mat" + key, vlMat);
  return vlMat;
}

// ---------- Tóc ----------
// đầu: rộng 0.3, cao 0.34, sâu 0.3, tâm (0,0,0) trong nhóm đầu
function taoToc(dau, kieu, mau, mau2) {
  const T = mau, them = (...a) => dau.add(hop(...a));
  const nap = (cao = 0.08, sau = 0.33) => them(0.33, cao, sau, T, 0, 0.17 + cao / 2 - 0.02, -0.005);
  const lung = (xuong = 0.18) => them(0.33, 0.16 + xuong, 0.05, T, 0, 0.11 - xuong / 2, -0.165);
  const ben = (xuong = 0.1) => { them(0.035, 0.12 + xuong, 0.22, T, -0.165, 0.1 - xuong / 2, -0.04); them(0.035, 0.12 + xuong, 0.22, T, 0.165, 0.1 - xuong / 2, -0.04); };
  switch (kieu) {
    case "ngoi": nap(0.09); lung(0.08); ben(0.02); them(0.2, 0.06, 0.06, T, 0.05, 0.18, 0.15); them(0.05, 0.05, 0.3, toiMau(T, 0.6), -0.07, 0.215, 0); break;
    case "cua": nap(0.045); lung(0.04); ben(-0.02); break;
    case "vuot_hoi": them(0.33, 0.07, 0.17, T, 0, 0.19, -0.08); lung(0.05); ben(0.02); them(0.33, 0.04, 0.06, T, 0, 0.19, 0.12); break;
    case "dai_uon":
      nap(0.09); lung(0.42); ben(0.36);
      for (let i = 0; i < 4; i++) for (const s of [-1, 1]) them(0.07, 0.08, 0.08, T, s * (0.18 + (i % 2) * 0.015), -0.05 - i * 0.08, -0.08);
      them(0.3, 0.05, 0.06, T, 0, 0.16, 0.15);
      if (mau2) { them(0.1, 0.07, 0.04, mau2, 0.09, 0.22, 0.02); them(0.1, 0.07, 0.04, mau2, 0.2, 0.22, 0.02); them(0.04, 0.05, 0.05, mau2, 0.145, 0.22, 0.02); }
      break;
    case "bob": nap(0.09); lung(0.2); ben(0.2); them(0.31, 0.07, 0.05, T, 0, 0.14, 0.15); break;
    case "bob_lech": nap(0.09); lung(0.2); them(0.04, 0.32, 0.24, T, -0.17, 0, -0.03); them(0.04, 0.22, 0.24, T, 0.17, 0.05, -0.03); them(0.24, 0.08, 0.05, T, -0.04, 0.13, 0.15); them(0.03, 0.03, 0.06, 0xf26fa6, 0.12, 0.13, 0.16); break;
    case "undercut": them(0.3, 0.13, 0.3, T, 0, 0.235, -0.005); them(0.322, 0.09, 0.27, 0x5a5650, 0, 0.115, -0.03); them(0.26, 0.06, 0.07, T, 0, 0.285, 0.12); break;
    case "bu": nap(0.08); lung(0.12); ben(0.05);
      for (let i = 0; i < 9; i++) { const b = hop(0.08, 0.1, 0.08, T, -0.13 + (i % 5) * 0.065, 0.25 + (i % 2) * 0.03, -0.1 + Math.floor(i / 5) * 0.14); b.rotation.set(i * 0.7, i, i * 0.5); dau.add(b); } break;
    case "gon": nap(0.07); lung(0.06); ben(0.0); them(0.32, 0.05, 0.05, T, 0, 0.18, 0.14); break;
    case "buoi_cao": nap(0.06); lung(0.06); ben(0.02); them(0.15, 0.13, 0.15, T, 0, 0.27, -0.06); them(0.16, 0.03, 0.16, 0x8a5a3c, 0, 0.215, -0.06); break;
    case "lat": nap(0.08); lung(0.06); ben(0.0); { const q = hop(0.3, 0.1, 0.12, T, 0, 0.25, 0.1); q.rotation.x = -0.35; dau.add(q); } break;
    case "duoi_ngua_dai": nap(0.08); lung(0.12); ben(0.08); them(0.3, 0.05, 0.06, T, 0, 0.16, 0.15); them(0.1, 0.1, 0.1, T, 0, 0.12, -0.21); them(0.09, 0.5, 0.08, T, 0, -0.18, -0.24); them(0.1, 0.04, 0.1, 0xc0262d, 0, 0.12, -0.2); break;
    case "buoc": nap(0.07); lung(0.08); ben(0.02); them(0.07, 0.3, 0.07, T, 0, -0.06, -0.21); them(0.08, 0.04, 0.08, 0xc0262d, 0, 0.08, -0.2); break;
    case "mullet": nap(0.1); lung(0.34); ben(0.06);
      for (let i = 0; i < 5; i++) { const b = hop(0.06, 0.1, 0.07, i % 2 ? mau2 : T, -0.12 + i * 0.06, 0.26, 0.04); b.rotation.z = (i - 2) * 0.2; dau.add(b); }
      them(0.05, 0.3, 0.05, mau2, 0.1, -0.03, -0.19); them(0.05, 0.3, 0.05, mau2, -0.08, -0.03, -0.19); break;
    case "xoan":
      for (let i = 0; i < 16; i++) { const b = hop(0.09, 0.09, 0.09, T, -0.14 + (i % 4) * 0.095, 0.2 + ((i * 7) % 3) * 0.015, -0.14 + Math.floor(i / 4) * 0.095); b.rotation.set(i, i * 2, 0); dau.add(b); }
      lung(0.08); them(0.04, 0.12, 0.18, mau2, -0.165, 0.05, -0.03); them(0.04, 0.12, 0.18, mau2, 0.165, 0.05, -0.03); break;
    case "thang_mai": nap(0.08); lung(0.5); ben(0.48); them(0.32, 0.1, 0.05, T, 0, 0.13, 0.15); break;
    case "to_qua": ben(0.04); lung(0.06); for (let i = 0; i < 4; i++) { const b = hop(0.05, 0.08, 0.05, T, i < 2 ? -0.17 : 0.17, 0.08 - (i % 2) * 0.06, 0.06); b.rotation.z = i * 0.6; dau.add(b); } break;
    case "dai_song": nap(0.09); lung(0.06);
      for (let i = 0; i < 6; i++) { const o = (i % 2) * 0.03; them(0.36 + o, 0.08, 0.06, T, 0, 0.06 - i * 0.08, -0.17 - o); for (const s of [-1, 1]) them(0.06, 0.09, 0.16, T, s * (0.18 + o), 0.06 - i * 0.08, -0.06); }
      them(0.16, 0.08, 0.05, T, -0.08, 0.15, 0.15); break;
    case "tem": nap(0.06); lung(0.03); ben(-0.03); { const f = hop(0.22, 0.05, 0.06, T, -0.04, 0.16, 0.14); f.rotation.z = 0.25; dau.add(f); } break;
    case "thua_lech": lung(0.04); ben(0.0); for (let i = 0; i < 4; i++) them(0.33, 0.025, 0.04, T, 0, 0.18, -0.12 + i * 0.07); them(0.12, 0.04, 0.3, T, -0.1, 0.18, 0); break;
    case "re_giua": nap(0.08); lung(0.1); ben(0.06); { const a = hop(0.15, 0.08, 0.05, T, -0.075, 0.14, 0.15); a.rotation.z = 0.35; const b = hop(0.15, 0.08, 0.05, T, 0.075, 0.14, 0.15); b.rotation.z = -0.35; dau.add(a, b); } break;
    default: nap(); lung(); ben();
  }
}

// ---------- Người ----------
// Người khối hộp (mức "Thấp"): giữ nguyên như cũ
function dungNguoiCu(nh, matTruoc) {
  const g = new THREE.Group();
  const s = nh.cao ? 1.05 : nh.nho ? 0.93 : 1;
  const r = nh.beo ? 1.16 : nh.gay ? 0.9 : nh.nu ? 0.92 : 1;
  const da = nh.da, ao = nh.ao, q = nh.quan, pk = nh.pk || [];
  const vlAo = ao.vai || vl(ao.mau);
  const giay = nh.giay || ["tay", 0x231f1c];

  // ----- Chân -----
  const HONG = 0.9;
  const chan = side => {
    const k = new THREE.Group(); k.position.set(side * 0.1 * r, HONG, 0);
    const kieuQ = q.kieu;
    const vlQ = kieuQ === "jean" ? VAI.jean(q.mau) : kieuQ === "da" ? vl(da) : vl(q.mau);
    if (kieuQ === "short") { k.add(hop(0.17 * r, 0.36, 0.19, vl(q.mau), 0, -0.18, 0)); k.add(hop(0.13, 0.44, 0.15, da, 0, -0.6, 0)); }
    else if (kieuQ === "vay_but") { k.add(hop(0.13, 0.82, 0.15, da, 0, -0.41, 0)); }
    else {
      k.add(hop(0.16 * r, 0.42, 0.18, vlQ, 0, -0.21, 0));
      k.add(hop(kieuQ === "loe" ? 0.2 : kieuQ === "jogger" ? 0.14 : 0.155, 0.4, kieuQ === "loe" ? 0.21 : 0.17, vlQ, 0, -0.61, 0));
      if (q.rach) k.add(hop(0.12, 0.07, 0.02, 0xd9cfbf, 0, -0.43, 0.09));
      if (kieuQ === "jogger") k.add(hop(0.15, 0.06, 0.18, toiMau(q.mau, 0.7), 0, -0.78, 0));
      if (kieuQ === "tuihop") k.add(hop(0.05, 0.14, 0.12, toiMau(q.mau, 0.85), side * 0.1, -0.3, 0));
      if (kieuQ === "tay") k.add(hop(0.012, 0.8, 0.012, toiMau(q.mau, 0.8), 0, -0.41, 0.091)); // ly quần
    }
    // giày
    const [kg, mg] = giay;
    if (kg === "caoGot") { k.add(hop(0.12, 0.06, 0.22, mg, 0, -0.83, 0.04)); k.add(hop(0.03, 0.08, 0.03, mg, 0, -0.86, -0.06)); }
    else if (kg === "depLe") { k.add(hop(0.13, 0.03, 0.25, mg, 0, -0.875, 0.04)); k.add(hop(0.13, 0.04, 0.05, mg, 0, -0.85, 0.08)); k.add(hop(0.11, 0.04, 0.18, da, 0, -0.84, 0.04)); }
    else if (kg === "sneaker" || kg === "converse") { k.add(hop(0.17, 0.09, 0.28, mg, 0, -0.84, 0.04)); k.add(hop(0.175, 0.03, 0.29, 0xf6f6f2, 0, -0.875, 0.04)); if (kg === "converse") k.add(hop(0.08, 0.04, 0.02, 0xf6f6f2, 0, -0.82, 0.18)); }
    else if (kg === "bupBe") k.add(hop(0.13, 0.06, 0.24, mg, 0, -0.85, 0.04));
    else { k.add(hop(0.165, 0.08, 0.27, mg, 0, -0.85, 0.04)); k.add(hop(0.168, 0.02, 0.272, 0x0d0b0a, 0, -0.885, 0.04)); }
    return gop(k);
  };
  const chanT = chan(-1), chanP = chan(1);
  g.add(chanT, chanP);

  // ----- Thân -----
  const than = new THREE.Group();
  const W = 0.42 * r, D = (nh.beo ? 0.27 : 0.23), y0 = 0.9, CAO_THAN = 0.52;
  // hông / cạp quần
  if (q.kieu === "vay_but") than.add(vat(0.38 * r, 0.34 * r, 0.42, 0.24, vl(q.mau), 0, 0.72));
  else if (q.kieu !== "da") than.add(hop(0.38 * r, 0.14, D * 0.95, q.kieu === "jean" ? VAI.jean(q.mau) : vl(q.mau), 0, y0 + 0.02, 0));
  const yThan = y0 + 0.07 + CAO_THAN / 2;
  const kieuAo = ao.kieu;
  if (kieuAo === "vay_lien" || kieuAo === "vay_dai") {
    than.add(vat(W * 0.95, W * 0.8, CAO_THAN, D, vlAo, 0, yThan));
    // phần váy dưới tách riêng để đung đưa theo bước chân; váy dài chỉ tới bắp chân cho thấy bước đi
    const dai = kieuAo === "vay_dai" ? 0.58 : 0.42;
    var vay = new THREE.Group(); vay.position.y = y0 + 0.08;
    vay.add(vat(0.36 * r, kieuAo === "vay_dai" ? 0.5 : 0.48, dai, 0.3, vlAo, 0, -dai / 2));
    than.add(hop(W * 0.82, 0.04, D * 0.95, toiMau(ao.mau, 0.7), 0, y0 + 0.08, 0)); // đai eo
    if (ao.khoac) { // áo len mỏng khoác ngoài
      than.add(hop(0.11, CAO_THAN, D + 0.02, ao.khoac, -W / 2 + 0.05, yThan, 0)); than.add(hop(0.11, CAO_THAN, D + 0.02, ao.khoac, W / 2 - 0.05, yThan, 0));
    }
  } else {
    const rong = ao.rong ? 1.12 : 1;
    than.add(vat(W * rong * (nh.nu ? 1 : 1.02), W * rong * (nh.nu ? 0.82 : 0.94), CAO_THAN, D, vlAo, 0, yThan));
    if (nh.beo) than.add(vat(W * 0.7, W * 0.8, 0.3, 0.12, vlAo, 0, y0 + 0.24, D / 2));
  }
  // dáng nữ: ngực, eo thon, hông nở hơn
  if (nh.nu) {
    for (const sd of [-1, 1]) { const n = new THREE.Mesh(new THREE.SphereGeometry(0.075, 8, 6), vlAo); n.scale.set(1, 0.85, 0.75); n.position.set(sd * 0.07, y0 + 0.07 + CAO_THAN * 0.68, D / 2 - 0.01); than.add(n); }
    if (q.kieu !== "da" && q.kieu !== "vay_but") than.add(hop(0.41 * r, 0.12, D, q.kieu === "jean" ? VAI.jean(q.mau) : vl(q.mau), 0, y0 - 0.04, 0));
  }
  const truoc = D / 2 + 0.006;
  const coY = y0 + 0.07 + CAO_THAN;
  // chi tiết từng kiểu áo
  if (["somi", "dong_phuc", "polo"].includes(kieuAo)) {
    const mauCo = ao.vai ? ao.mau : ao.mau;
    if (!ao.moCo) { for (const sd of [-1, 1]) { const c = hop(0.12, 0.05, 0.04, toiMau(mauCo, 0.93), sd * 0.055, coY - 0.02, truoc - 0.01); c.rotation.z = sd * 0.5; than.add(c); } }
    else { for (const sd of [-1, 1]) { const c = hop(0.14, 0.05, 0.04, toiMau(mauCo, 0.9), sd * 0.09, coY - 0.04, truoc - 0.01); c.rotation.z = sd * 0.9; than.add(c); } than.add(hop(0.08, 0.1, 0.01, da, 0, coY - 0.06, truoc)); }
    if (kieuAo !== "polo") { than.add(hop(0.018, CAO_THAN - 0.06, 0.012, toiMau(mauCo, 0.85), 0, yThan - 0.02, truoc)); for (let i = 0; i < 4; i++) than.add(hop(0.02, 0.02, 0.012, 0xf6f6f2, 0, coY - 0.08 - i * 0.11, truoc + 0.004)); }
    else { than.add(hop(0.05, 0.14, 0.012, toiMau(ao.mau, 0.8), 0, coY - 0.08, truoc)); }
    if (ao.soVin || kieuAo === "dong_phuc") than.add(hop(0.38 * r + 0.01, 0.04, D * 0.96 + 0.01, 0x231f1c, 0, y0 + 0.08, 0)); // thắt lưng
    if (ao.soVin) than.add(hop(0.05, 0.035, 0.012, 0xb8a060, 0, y0 + 0.08, D * 0.48 + 0.01));
    if (kieuAo === "dong_phuc") { for (const sd of [-1, 1]) than.add(hop(0.1, 0.09, 0.012, toiMau(ao.mau, 0.85), sd * 0.11, coY - 0.15, truoc)); than.add(hop(0.05, 0.05, 0.014, 0xe8c547, -0.11, coY - 0.08, truoc + 0.004)); }
    if (ao.nhan) for (let i = 0; i < 3; i++) { const n = hop(0.12, 0.008, 0.01, toiMau(ao.mau, 0.82), 0.08 - i * 0.07, yThan - 0.08 + i * 0.07, truoc); n.rotation.z = 0.4; than.add(n); }
  }
  if (kieuAo === "vest" || kieuAo === "vest_nu" || kieuAo === "khoac") {
    // áo trong lộ hình chữ V + hai vạt áo khoác
    than.add(hop(0.12, CAO_THAN * 0.7, 0.012, ao.trong, 0, coY - CAO_THAN * 0.35, truoc - 0.002));
    for (const sd of [-1, 1]) {
      const v = hop(W * 0.42, CAO_THAN, 0.03, vl(ao.mau), sd * W * 0.26, yThan, truoc + 0.008); than.add(v);
      const ve = hop(0.05, 0.22, 0.02, toiMau(ao.mau, kieuAo === "khoac" ? 1 : 0.75), sd * 0.075, coY - 0.11, truoc + 0.026); ve.rotation.z = sd * -0.35; than.add(ve);
      if (ao.vien) than.add(hop(0.025, CAO_THAN, 0.035, ao.vien, sd * W * 0.47, yThan, 0));
    }
    if (kieuAo !== "khoac") for (let i = 0; i < 2; i++) than.add(hop(0.025, 0.025, 0.01, 0x111111, 0.035, y0 + 0.2 + i * 0.1, truoc + 0.024));
    if (ao.caVat) { than.add(hop(0.05, 0.05, 0.02, ao.caVat, 0, coY - 0.03, truoc + 0.004)); than.add(vat(0.05, 0.075, 0.26, 0.015, vl(ao.caVat), 0, coY - 0.19, truoc + 0.004)); }
    if (kieuAo === "khoac") { than.add(hop(W * 0.98, 0.06, D + 0.04, ao.mau, 0, y0 + 0.1, 0)); than.add(hop(0.24, 0.06, 0.08, ao.mau, 0, coY + 0.005, -0.04)); }
  }
  if (kieuAo === "thun" || kieuAo === "len") {
    than.add(hop(0.16, 0.04, 0.02, toiMau(ao.mau, 0.75), 0, coY - 0.02, truoc - 0.005)); // viền cổ
    if (kieuAo === "len") { than.add(hop(W * 0.98, 0.06, D + 0.01, toiMau(ao.mau, 0.85), 0, y0 + 0.1, 0)); for (let i = -2; i <= 2; i++) than.add(hop(0.012, CAO_THAN * 0.8, 0.01, toiMau(ao.mau, 0.9), i * 0.07, yThan, truoc)); }
    if (ao.bo) than.add(hop(W * 0.8, 0.012, 0.01, toiMau(ao.mau, 0.7), 0, yThan + 0.08, truoc));
  }
  if (kieuAo === "hoodie") {
    than.add(hop(0.26, 0.14, 0.03, toiMau(ao.mau, 0.88), 0, y0 + 0.22, truoc + 0.008)); // túi trước
    than.add(hop(0.3, 0.14, 0.12, toiMau(ao.mau, 0.85), 0, coY + 0.02, -0.12)); // mũ trùm sau gáy
    for (const sd of [-1, 1]) than.add(hop(0.012, 0.16, 0.012, 0xf6f6f2, sd * 0.04, coY - 0.1, truoc + 0.006));
    than.add(hop(W * 0.98, 0.05, D + 0.01, toiMau(ao.mau, 0.85), 0, y0 + 0.1, 0));
  }
  if (kieuAo === "yem") {
    than.add(hop(0.24, 0.26, 0.02, ao.yem, 0, y0 + 0.22, truoc + 0.008));
    for (const sd of [-1, 1]) { than.add(hop(0.04, 0.3, 0.02, ao.yem, sd * 0.1, coY - 0.15, truoc + 0.01)); than.add(hop(0.03, 0.03, 0.02, 0xd8b45a, sd * 0.1, y0 + 0.33, truoc + 0.022)); }
  }
  // cổ
  than.add(hop(0.12, 0.08, 0.12, da, 0, coY + 0.03, 0));
  // phụ kiện trên thân
  if (pk.includes("theDeo")) { than.add(hop(0.012, 0.22, 0.012, 0x2a5aa8, -0.05, coY - 0.1, truoc + 0.01)); than.add(hop(0.012, 0.22, 0.012, 0x2a5aa8, 0.05, coY - 0.1, truoc + 0.01)); than.add(hop(0.13, 0.17, 0.012, 0xf6f6f2, 0, coY - 0.27, truoc + 0.016)); than.add(hop(0.1, 0.03, 0.013, 0xe8702a, 0, coY - 0.21, truoc + 0.018)); }
  if (pk.includes("butTui") || pk.includes("butHong")) than.add(hop(0.015, 0.09, 0.015, pk.includes("butHong") ? 0xf26fa6 : 0x2a5aa8, -0.12, coY - 0.12, truoc + 0.008));
  if (pk.includes("caVatLong")) { const t = vat(0.05, 0.07, 0.24, 0.015, vl(0x2e8b57), 0.02, coY - 0.17, truoc + 0.01); t.rotation.z = 0.15; than.add(t); than.add(hop(0.05, 0.045, 0.02, 0x2e8b57, 0, coY - 0.06, truoc + 0.01)); }
  if (pk.includes("boDam")) { than.add(hop(0.07, 0.13, 0.05, 0x1a1a1a, W / 2 + 0.02, y0 + 0.02, 0.03)); than.add(hop(0.012, 0.07, 0.012, 0x1a1a1a, W / 2 + 0.03, y0 + 0.12, 0.03)); }
  if (pk.includes("chumChiaKhoa")) than.add(hop(0.05, 0.07, 0.03, 0xc9b26a, W / 2 - 0.02, y0 + 0.0, 0.08));
  if (pk.includes("dayCap")) { const c = new THREE.Mesh(new THREE.TorusGeometry(0.16, 0.012, 4, 10), vl(0x2a2c31)); c.position.set(0.04, coY - 0.02, 0); c.rotation.set(1.3, 0, 0.6); than.add(c); }
  if (pk.includes("taiNgheCo")) { const c = new THREE.Mesh(new THREE.TorusGeometry(0.1, 0.018, 4, 10, Math.PI), vl(0x1a1a1a)); c.position.set(0, coY + 0.02, 0.03); c.rotation.x = Math.PI / 2 + 0.2; than.add(c); }
  g.add(gop(than));
  const vayDong = typeof vay !== "undefined" && vay ? gop(vay) : null;
  if (vayDong) g.add(vayDong);

  // ----- Tay -----
  const vaiY = y0 + 0.07 + CAO_THAN - 0.06, vaiX = W / 2 + 0.06;
  const ngan = kieuAo === "thun" || kieuAo === "polo" || kieuAo === "yem" || kieuAo === "vay_lien";
  const mauTayAo = kieuAo === "vay_dai" ? (ao.khoac || ao.mau) : null;
  const tay = side => {
    const k = new THREE.Group(); k.position.set(side * vaiX, vaiY, 0);
    const vlTay = mauTayAo ? vl(mauTayAo) : vlAo;
    k.add(hop(0.12, 0.3, 0.12, vlTay, 0, -0.15, 0));
    if (ngan) { k.add(hop(0.125, 0.04, 0.125, toiMau(ao.mau, 0.8), 0, -0.29, 0)); k.add(hop(0.1, 0.27, 0.1, da, 0, -0.44, 0)); }
    else { k.add(hop(0.11, 0.27, 0.11, vlTay, 0, -0.44, 0)); if (kieuAo === "vest" || kieuAo === "vest_nu") k.add(hop(0.105, 0.03, 0.105, ao.trong, 0, -0.585, 0)); else k.add(hop(0.115, 0.03, 0.115, toiMau(ao.mau, 0.8), 0, -0.575, 0)); }
    k.add(hop(0.1, 0.1, 0.07, da, 0, -0.645, 0.005));
    k.add(hop(0.03, 0.06, 0.04, da, side * -0.06, -0.62, 0.02)); // ngón cái
    if (side === -1 && pk.includes("dongHoVang")) k.add(hop(0.115, 0.03, 0.115, 0xd8b45a, 0, -0.56, 0));
    if (side === -1 && pk.includes("vongTay")) k.add(hop(0.115, 0.025, 0.115, 0xf26fa6, 0, -0.56, 0));
    // đồ cầm tay
    const cam = (obj) => { obj.position.y += -0.68; obj.position.z += 0.05; k.add(obj); };
    if (side === 1) {
      if (pk.includes("dienThoai")) cam(hop(0.07, 0.13, 0.015, 0x1a1a1a, 0, 0, 0.02));
      if (pk.includes("micro")) { cam(hop(0.035, 0.16, 0.035, 0x1a1a1a, 0, 0.02, 0.02)); cam(hop(0.06, 0.06, 0.06, 0xb5b5b5, 0, 0.12, 0.02)); }
      if (pk.includes("tachTra")) { cam(hop(0.08, 0.06, 0.08, 0xf6f6f2, 0, 0.0, 0.04)); }
      if (pk.includes("binhGiuNhiet")) cam(hop(0.07, 0.2, 0.07, 0xb7c7d6, 0, 0.0, 0.03));
      if (pk.includes("cocRender")) cam(hop(0.08, 0.1, 0.08, 0xf6f6f2, 0, 0.0, 0.04));
      if (pk.includes("butCamUng")) cam(hop(0.015, 0.14, 0.015, 0xf6f6f2, 0, 0.02, 0.02));
    } else {
      if (pk.includes("soTay")) { const b = hop(0.03, 0.22, 0.16, 0x2f6b3a, side * -0.07, -0.25, 0.02); k.add(b); }
      if (pk.includes("capDa")) cam(hop(0.06, 0.24, 0.32, 0x5a3d2a, 0, -0.08, -0.05));
      if (pk.includes("tuiXach")) cam(hop(0.08, 0.16, 0.22, 0xe8e0c8, 0, -0.06, -0.05));
      if (pk.includes("soDa")) { const b = hop(0.03, 0.2, 0.15, 0x6b4a2f, side * -0.07, -0.25, 0.02); k.add(b); }
    }
    return gop(k);
  };
  const tayT = tay(-1), tayP = tay(1);
  g.add(tayT, tayP);

  // ----- Đầu -----
  const dau = new THREE.Group(); const dauY = coY + 0.07 + 0.17; dau.position.y = dauY;
  const vlDa = vl(da);
  const hopDau = new THREE.Mesh(new THREE.BoxGeometry(0.3, 0.34, 0.3), [vlDa, vlDa, vlDa, vlDa, matTruoc, vlDa]);
  dau.add(hopDau);
  dau.add(hop(0.04, 0.08, 0.06, da, -0.165, 0.0, 0), hop(0.04, 0.08, 0.06, da, 0.165, 0.0, 0)); // tai
  dau.add(hop(0.05, 0.07, 0.045, toiMau(da, 0.95), 0, -0.03, 0.17)); // mũi
  dau.add(hop(0.2, 0.06, 0.04, da, 0, -0.15, 0.12)); // cằm
  const [kieuToc, mauToc, mauToc2] = nh.toc || ["cua", 0x1a1a1a];
  taoToc(dau, kieuToc, mauToc, mauToc2);
  if (pk.includes("kinhVuong")) { for (const x of [-0.07, 0.07]) { dau.add(hop(0.1, 0.07, 0.012, 0x1a1a1a, x, 0.04, 0.158)); dau.add(hop(0.08, 0.05, 0.006, 0xbfe0f2, x, 0.04, 0.165)); } dau.add(hop(0.04, 0.012, 0.012, 0x1a1a1a, 0, 0.05, 0.16)); }
  if (pk.includes("kinhTron")) { for (const x of [-0.07, 0.07]) { const v = new THREE.Mesh(new THREE.TorusGeometry(0.042, 0.008, 4, 10), vl(0x8a6a3a)); v.position.set(x, 0.04, 0.16); dau.add(v); } }
  if (pk.includes("kinhLao")) { for (const x of [-0.06, 0.06]) { dau.add(hop(0.08, 0.012, 0.012, 0x6b4a2f, x, -0.03, 0.172)); dau.add(hop(0.075, 0.03, 0.006, 0xdfeaf0, x, -0.046, 0.17)); } dau.add(hop(0.04, 0.01, 0.01, 0x6b4a2f, 0, -0.03, 0.18)); }
  if (pk.includes("kinhRam") || pk.includes("kinhRamTo")) { const to = pk.includes("kinhRamTo"); dau.add(hop(to ? 0.3 : 0.27, to ? 0.09 : 0.065, 0.02, 0x070707, 0, 0.04, 0.16)); }
  if (pk.includes("khauTrangCam")) { dau.add(hop(0.22, 0.08, 0.03, 0xa9d3ee, 0, -0.15, 0.14)); }
  if (pk.includes("taiNgheChup")) { dau.add(hop(0.05, 0.11, 0.11, 0x1a1a1a, -0.18, 0.0, 0), hop(0.05, 0.11, 0.11, 0x1a1a1a, 0.18, 0.0, 0), hop(0.36, 0.03, 0.05, 0x1a1a1a, 0, 0.21, 0)); }
  if (pk.includes("dienThoaiTai")) dau.add(hop(0.025, 0.14, 0.07, 0x1a1a1a, 0.18, 0.0, 0.01));
  if (pk.includes("bluetooth")) dau.add(hop(0.025, 0.04, 0.04, 0x3fb8e0, 0.185, 0.0, 0.02));
  if (pk.includes("muLen")) { dau.add(hop(0.34, 0.14, 0.34, 0x2d3a55, 0, 0.21, -0.005)); dau.add(hop(0.35, 0.05, 0.35, toiMau(0x2d3a55, 0.8), 0, 0.15, -0.005)); }
  if (pk.includes("muKepi")) { dau.add(hop(0.34, 0.1, 0.34, 0x23406f, 0, 0.22, 0)); dau.add(hop(0.36, 0.03, 0.36, 0x1a2a48, 0, 0.17, 0)); dau.add(hop(0.3, 0.025, 0.12, 0x111111, 0, 0.165, 0.2)); dau.add(hop(0.06, 0.05, 0.01, 0xe8c547, 0, 0.23, 0.172)); }
  if (pk.includes("butCamUng")) { const b = hop(0.012, 0.012, 0.14, 0xf6f6f2, 0.175, 0.07, 0.0); dau.add(b); }
  if (pk.includes("nonLa")) { const n = new THREE.Mesh(new THREE.ConeGeometry(0.34, 0.2, 10, 1, true), vl(0xe6d39a, { side: THREE.DoubleSide })); n.position.y = 0.26; dau.add(n); }
  if (pk.includes("muBaoHiem")) { const m = new THREE.Mesh(new THREE.SphereGeometry(0.2, 8, 5, 0, Math.PI * 2, 0, Math.PI / 2), vl(nh.mauMu || 0xc0262d)); m.position.y = 0.07; m.scale.set(1.05, 1, 1.1); dau.add(m); dau.add(hop(0.3, 0.02, 0.08, toiMau(nh.mauMu || 0xc0262d, 0.7), 0, 0.08, 0.18)); }
  if (nh.nu) for (const x of [-0.17, 0.17]) dau.add(hop(0.03, 0.05, 0.03, 0xe8c547, x, -0.07, 0.01)); // bông tai
  if (pk.includes("khauTrangVai")) dau.add(hop(0.24, 0.12, 0.03, nh.mauKhauTrang || 0x3a4250, 0, -0.1, 0.155));
  g.add(dau);
  // gộp phần đầu tĩnh (giữ mesh mặt riêng vì có nhiều vật liệu)
  gop(dau);

  g.scale.setScalar(s);
  return { g, s, tayT, tayP, chanT, chanP, goiT: null, goiP: null, than, dau, dauY, vaiY, vayDong, matMang: hopDau.material, iMat: 4, khT: tayT, khP: tayP, moi: false };
}

export function taoNguoi(ma, nhRieng = null) {
  const nh = nhRieng || NGOAI_HINH[ma] || NGOAI_HINH.ran_doc;
  const moi = kieuMoi();
  if (nh.cho) return gopNguoi(moi ? taoChoMoi() : taoCho());
  if (nh.nu && nh.mat) nh.mat = { mi: true, maHong: true, son: 0xc75b6c, ...nh.mat }; // nữ: lông mi, má hồng, son
  const sieu = !!nh.sieuNhan; // Siêu Nhân Hồng: đội mũ kín (không vẽ mặt), dáng mập, đứng yên thì tạo dáng
  const matTruoc = sieu ? null : veMat(nh);
  const P = moi ? dungNguoiMoi(nh, matTruoc, { jean: VAI.jean }) : sieu ? dungSieuNhanCu() : dungNguoiCu(nh, matTruoc);
  const { g, s, tayT, tayP, chanT, chanP, goiT, goiP, than, dau, dauY, vaiY, vayDong } = P;
  const pk = nh.pk || [];
  // ----- Cử chỉ: ngáp, vươn vai, gãi đầu, gọi điện, uống, xem điện thoại, cười, gật/lắc đầu, nói -----
  // Cánh tay là một khối cứng xoay quanh vai: muốn đưa bàn tay tới một điểm (tai, miệng, đỉnh đầu) thì xoay tay
  // hướng về điểm đó và co ngắn lại cho vừa (trông như gập khuỷu tay).
  // người kiểu mới: điện thoại / ly nằm trong nhóm giữ ở lòng bàn tay phải (ly luôn đứng thẳng, điện thoại xoay theo
  // cử chỉ: áp má khi gọi, ngửa màn hình về mặt khi xem); co tay là gập khuỷu nên không cần kéo dãn đồ
  const khP = P.khP, keo = y => moi ? 1 : 1 / Math.max(0.3, y);
  const dienThoai = new THREE.Mesh(GEO_DT, vl(0x1a1a1a)); dienThoai.visible = false;
  if (moi) P.giuP.dt.add(dienThoai); else { dienThoai.position.set(0, -0.69, 0.05); khP.add(dienThoai); }
  const coSan = pk.some(x => ["tachTra", "cocRender", "binhGiuNhiet"].includes(x)); // đã cầm sẵn ly
  const coc = new THREE.Mesh(GEO_COC, vl(0xf6f6f2)); coc.visible = false;
  if (moi) { coc.position.set(-0.012, 0.012, 0.012); P.giuP.dung.add(coc); } else { coc.position.set(0, -0.7, 0.06); khP.add(coc); }
  let nghieng = 0; const qUong = new THREE.Quaternion(); // nâng ly uống: ly nghiêng về phía miệng (0..1)
  const matGoc = P.matMang, iMat = P.iMat, matCu = {};
  const doiMat = kieu => {
    if (!matGoc) return; // không có mặt (mũ siêu nhân)
    if (!kieu) { matGoc[iMat] = matTruoc; return; }
    if (!matCu[kieu]) {
      const m = nh.mat || {};
      matCu[kieu] = veMat({ ...nh, mat: kieu === "ngap" ? { ...m, mieng: "ngap", mat: m.mat === "cuoi" ? "cuoi" : "met" } : { ...m, mieng: "cuoi_to", mat: "cuoi" } });
    }
    matGoc[iMat] = matCu[kieu];
  };
  const _v = new THREE.Vector3(), _q = new THREE.Quaternion(), _q0 = new THREE.Quaternion();
  // người mập (Siêu Nhân Hồng): điểm tay với tới nằm trong bụng thì đẩy ra trước mặt bụng (ôm bụng cười, tay đặt đùi...)
  const thanSN = sieu && moi ? { thanHinh: P.rows } : null;
  const huongTay = (tay, x, y, z, k, boQua = false) => {
    if ((tay.userData.coDinh && !boQua) || k <= 0) return;
    if (thanSN && y > 0.9 && y < 1.5 && z > 0) { const m = matThanNv(thanSN, Math.min(Math.abs(x), 0.2), y); if (z < m + 0.05) z = m + 0.05; }
    _v.set(x - tay.position.x, y - tay.position.y, z - tay.position.z);
    const d = _v.length(); _v.divideScalar(d);
    _q.setFromUnitVectors(XUONG, _v);
    if (k < 1) { _q0.copy(tay.quaternion); _q.slerpQuaternions(_q0, _q, k); }
    tay.quaternion.copy(_q);
    const co = Math.min(1, Math.max(0.42, d / 0.66));
    tay.scale.y = 1 + (co - 1) * k;
  };
  const muot = x => x * x * (3 - 2 * x);
  const ketThucCu = () => { o.cu = null; doiMat(null); };
  const apCu = (c, p, t) => {
    const e = p < 0.16 ? muot(p / 0.16) : p > 0.8 ? muot((1 - p) / 0.2) : 1;
    const giua = p > 0.18 && p < 0.82;
    switch (c.loai) {
      case "ngap":
        doiMat(p > 0.12 && p < 0.85 ? "ngap" : null);
        dau.rotation.x -= 0.38 * e;
        if (c.bien) { huongTay(tayT, -0.22, dauY + 0.6, -0.02, e); huongTay(tayP, 0.22, dauY + 0.6, -0.02, e); }
        else huongTay(tayP, 0.03, dauY - 0.1, 0.25, e);
        break;
      case "vuon": {
        const ra = p < 0.5 ? 0 : muot(Math.min(1, (p - 0.5) / 0.2));
        const x = 0.2 + ra * 0.5, y = dauY + 0.62 - ra * 0.55;
        huongTay(tayT, -x, y, -0.02, e); huongTay(tayP, x, y, -0.02, e);
        dau.rotation.x -= 0.22 * e;
        break;
      }
      case "gai_dau":
        huongTay(tayP, 0.1 + Math.sin(t * 24) * 0.025, dauY + 0.19, 0.05, e);
        dau.rotation.z += 0.12 * e; dau.rotation.x += 0.06 * e;
        break;
      case "goi_dt":
        dienThoai.visible ||= e > 0.5; dienThoai.scale.y = keo(tayP.scale.y);
        huongTay(tayP, 0.19, dauY + 0.01, 0.04, e);
        dau.rotation.z -= 0.1 * e; dau.rotation.x += Math.sin(t * 1.7) * 0.05 * e;
        if (!o.ngoi) huongTay(tayT, -0.32, 1.05 + Math.sin(t * 2.2) * 0.08, 0.3 + Math.sin(t * 1.3) * 0.06, e * 0.7);
        break;
      case "uong": {
        if (!coSan) { coc.visible ||= e > 0.3; coc.scale.y = keo(tayP.scale.y); }
        const len = p > 0.3 && p < 0.7 ? 1 : p <= 0.3 ? muot(Math.max(0, (p - 0.1) / 0.2)) : muot(Math.max(0, (0.9 - p) / 0.2));
        nghieng = len;
        huongTay(tayP, 0.12 - len * 0.09, 1.0 + len * (dauY - 1.12), 0.3 - len * 0.06, e);
        dau.rotation.x -= 0.28 * len;
        break;
      }
      case "xem_dt": {
        dienThoai.visible ||= e > 0.4; dienThoai.scale.y = keo(tayP.scale.y);
        const run = Math.sin(t * 9) * 0.008;
        huongTay(tayP, 0.06, dauY - 0.5 + run, 0.32, e); huongTay(tayT, -0.05, dauY - 0.53, 0.3, e);
        dau.rotation.x += 0.38 * e;
        break;
      }
      case "cuoi": {
        doiMat(giua ? "cuoi" : null);
        const rung = Math.sin(t * 17);
        dau.rotation.x += (-0.18 + rung * 0.07) * e;
        than.position.y += Math.abs(rung) * 0.014 * e; dau.position.y += Math.abs(rung) * 0.014 * e;
        huongTay(tayT, -0.1, 1.02, 0.2, e * 0.8);
        break;
      }
      case "gat_dau": dau.rotation.x += Math.sin(p * Math.PI * 4) * 0.2 * e; break;
      case "lac_dau": dau.rotation.y += Math.sin(p * Math.PI * 4) * 0.3 * e; break;
      case "noi":
        huongTay(tayP, 0.24 + Math.sin(t * 3.1) * 0.06, 1.12 + Math.sin(t * 4.3) * 0.07, 0.36, e * 0.9);
        dau.rotation.x += Math.sin(t * 5.3) * 0.035 * e;
        break;
    }
  };

  const o = {
    group: g, chieuCao: (sieu ? 1.95 : dauY + 0.3) * s, tayT, tayP, dau, than, dauY, chanT, chanP, goiT, goiP,
    truocGop: moi ? () => { giaiTay(tayT); giaiTay(tayP); } : undefined,
    thanHinh: moi ? P.rows : undefined, // dáng thân (người kiểu mới) để đồ thêm ôm theo thân
    ngoi: false,     // ngồi ghế gõ máy tính
    vietTay: 0,      // >0: với tay thao tác đồ vật (máy in, cây nước, tủ hồ sơ)
    cu: null,        // cử chỉ đang làm { loai, dai, t0 }
    quayDau: 0,      // quay đầu thêm (nhìn người đang nói chuyện cùng)
    cam: null,       // "coc" | "dt": cầm ly / điện thoại trên tay phải
    lamCu(loai, dai, bien = Math.random() < 0.5) { if (o.cu) ketThucCu(); o.cu = { loai, dai: dai ?? THOI_CU[loai] ?? 2, t0: null, bien }; },
    huyCu() { if (o.cu) ketThucCu(); },
    hoatDong(t, dangDi, toc = 1) {
      // tay cố định (cầm cờ, chỉ tay, áp điện thoại...) giữ nguyên độ co do code gọi đặt
      if (!tayT.userData.coDinh) tayT.scale.y = 1;
      if (!tayP.userData.coDinh) tayP.scale.y = 1;
      dau.rotation.z = 0; nghieng = 0;
      // đồ đang cầm (ly cà phê mang về chỗ, điện thoại); cử chỉ có thể hiện thêm
      coc.visible = o.cam === "coc" && !coSan; dienThoai.visible = o.cam === "dt";
      coc.scale.y = dienThoai.scale.y = 1;
      if (!tayT.userData.coDinh) { tayT.rotation.y = 0; tayT.userData.khuyu = 0; }
      if (!tayP.userData.coDinh) { tayP.rotation.y = 0; tayP.userData.khuyu = 0; }
      let gT = 0, gP = 0; // gập gối (người kiểu mới)
      if (o.ngoi === "nghi") { // ngồi quán / ghế chờ: tay đặt lên đùi, lâu lâu nâng ly uống, nhìn quanh
        chanT.rotation.x = -1.45; chanP.rotation.x = -1.38; gT = 1.52; gP = 1.4;
        const chu = (t + (o.lech ||= Math.random() * 9)) % 9, uong = o.cu || o.khongUong || sieu ? 0 : chu < 1.6 ? Math.sin(chu / 1.6 * Math.PI) : 0; // đội mũ kín: không nâng ly
        if (moi) { // bàn tay đặt trên đùi; uống thì đưa ly lên miệng (gập khuỷu)
          tayT.rotation.set(0, 0, 0); tayP.rotation.set(0, 0, 0);
          const xd = sieu ? 0.16 : 0.115; // đùi to: bàn tay đặt ra phía ngoài đùi, trước bụng
          huongTay(tayT, -xd, 1.03, 0.32, 1, true);
          huongTay(tayP, xd + 0.01 - uong * 0.095, 1.03 + uong * (dauY - 1.13), 0.32 - uong * 0.06, 1, true);
          nghieng = uong; if (!coSan && !o.cu) coc.visible = uong > 0.05 || o.cam === "coc"; // ly trên tay khi nâng lên uống
        } else { tayT.rotation.set(-0.55, 0, 0.12); tayP.rotation.set(-0.6 - uong * 1.5, 0, -0.1 - uong * 0.25); }
        than.position.y = 0; dau.position.y = dauY; tayT.position.y = tayP.position.y = vaiY;
        dau.rotation.set(-uong * 0.25, Math.sin(t * 0.35 + o.lech) * 0.5, 0);
      } else if (o.ngoi) {
        chanT.rotation.x = chanP.rotation.x = -1.42; gT = gP = 1.42;
        const go = o.cu ? 0.012 : 0.05; // đang làm cử chỉ thì ngừng gõ phím
        if (moi) { // cánh tay trên buông gần thân, cẳng tay đưa ra bàn phím
          const kz = sieu ? -0.04 : 0.1; // bụng to: khuỷu tay mở ra hai bên thay vì khép vào thân
          tayT.rotation.set(-0.55 + Math.sin(t * 13) * go, 0, kz); tayP.rotation.set(-0.55 + Math.sin(t * 13 + 1.7) * go, 0, -kz);
          tayT.userData.khuyu = tayP.userData.khuyu = 1.05;
        } else { tayT.rotation.set(-1.12 + Math.sin(t * 13) * go, 0, 0.12); tayP.rotation.set(-1.12 + Math.sin(t * 13 + 1.7) * go, 0, -0.12); }
        than.position.y = 0; dau.position.y = dauY; tayT.position.y = tayP.position.y = vaiY;
        dau.rotation.set(0.12 + Math.sin(t * 0.3) * 0.04, Math.sin(t * 0.4) * 0.15, 0);
      } else if (o.vietTay > 0) {
        chanT.rotation.x = chanP.rotation.x = 0;
        tayP.rotation.set(-1.25 + Math.sin(t * 5) * 0.15, 0, 0); tayT.rotation.set(-0.3, 0, 0);
        if (moi) { tayP.userData.khuyu = 0.35; tayT.userData.khuyu = 0.5; }
        if (sieu) { tayT.rotation.z = -0.1; tayP.rotation.z = 0.06; }
        dau.rotation.set(0.15, 0, 0);
      } else {
        dau.rotation.x = 0;
        if (!tayT.userData.coDinh) tayT.rotation.z = 0;
        if (!tayP.userData.coDinh) tayP.rotation.z = 0;
        const goc = dangDi ? Math.sin(t * 8 * toc) * 0.55 : 0;
        chanT.rotation.x = goc; chanP.rotation.x = -goc;
        if (vayDong) { vayDong.rotation.z = goc * 0.12; vayDong.rotation.x = Math.abs(goc) * (moi ? -0.24 : -0.15); }
        if (!tayT.userData.coDinh) tayT.rotation.x = -goc * 0.8;
        if (!tayP.userData.coDinh) tayP.rotation.x = o.cam ? (moi ? -0.2 + goc * 0.05 : -0.6 + goc * 0.1) : goc * 0.8; // cầm ly thì giữ tay trước ngực
        if (moi) {
          // khuỷu hơi gập, gập thêm khi vung tay ra trước; gối gập khi chân đưa lên bước
          if (!tayT.userData.coDinh) tayT.userData.khuyu = 0.14 + Math.max(0, -tayT.rotation.x) * 0.6;
          if (!tayP.userData.coDinh) tayP.userData.khuyu = o.cam ? 1.3 : 0.14 + Math.max(0, -tayP.rotation.x) * 0.6;
          if (dangDi) { const c = Math.cos(t * 8 * toc); gT = 0.06 + 0.85 * Math.max(0, -c); gP = 0.06 + 0.85 * Math.max(0, c); }
        }
        const nhun = dangDi ? Math.abs(Math.sin(t * 8 * toc)) * 0.025 : Math.sin(t * 1.6) * 0.006;
        than.position.y = nhun; dau.position.y = dauY + nhun; tayT.position.y = tayP.position.y = vaiY + nhun;
        dau.rotation.y = dangDi ? 0 : Math.sin(t * 0.5) * 0.12;
        if (sieu) {
          // tay buông hơi dang ra để không lọt vào bụng / hông
          // (người mập vung tay ít hơn; vung ra trước thì đánh hơi rộng ra ngoài vòng bụng)
          if (!tayT.userData.coDinh) { if (dangDi) tayT.rotation.x *= 0.65; tayT.rotation.z = -0.085 - 0.12 * Math.max(0, -tayT.rotation.x); }
          if (!tayP.userData.coDinh) { if (dangDi && !o.cam) tayP.rotation.x *= 0.65; tayP.rotation.z = 0.085 + 0.12 * Math.max(0, -tayP.rotation.x); }
          if (!dangDi && !o.cam) { // đứng yên thì tạo dáng: tay trái chống hông, tay phải giơ cao vẫy chào
            if (!tayT.userData.coDinh) { tayToi(tayT, -0.3, 1.0, 0.03); tayT.userData.khuyu = 0; }
            if (!tayP.userData.coDinh) { tayP.rotation.set(-2.72 + Math.sin(t * 2) * 0.08, 0, 0.22 + Math.sin(t * 3.4) * 0.12); tayP.userData.khuyu = 0.42 + Math.sin(t * 3.4) * 0.16; }
          }
        }
      }
      dau.rotation.y += o.quayDau;
      if (goiT) { goiT.rotation.x = gT; goiP.rotation.x = gP; }
      if (moi && vayDong && o.ngoi) vayDong.rotation.set(vayDong.userData.ngoi ?? -1.05, 0, 0); // ngồi: váy phủ theo đùi
      const c = o.cu;
      if (c) {
        if (dangDi && c.loai !== "goi_dt" && c.loai !== "xem_dt") ketThucCu();
        else {
          if (c.t0 == null) c.t0 = t;
          const p = (t - c.t0) / c.dai;
          if (p >= 1 || p < 0) ketThucCu(); else apCu(c, p, t);
        }
      }
      if (moi) { // hướng đồ cầm tay: ly đứng thẳng (nghiêng khi uống), điện thoại theo cử chỉ; ngồi thì cất túi / sổ
        P.giuP.dung.userData.huong = nghieng > 0.01 ? qUong.slerpQuaternions(Q0, Q_UONG_MAX, nghieng) : null;
        P.giuP.dt.userData.huong = !dienThoai.visible ? null : o.cu?.loai === "goi_dt" ? Q_GOI : Q_XEM;
        P.giuP.tay.userData.an = dienThoai.visible || coc.visible; // tay phải đang cầm điện thoại / ly của cử chỉ: cất đồ sẵn có
        P.giuP.dung.userData.an = dienThoai.visible;
        P.giuT.dung.userData.an = P.giuT.tay.userData.an = !!o.ngoi;
      }
    },
  };
  return gopNguoi(o);
}
const XUONG = new THREE.Vector3(0, -1, 0), _vt = new THREE.Vector3();
// xoay cánh tay (nhóm ở vai) cho bàn tay tới điểm (x, y, z) trong khung người, co tay (gập khuỷu) nếu điểm gần vai
function tayToi(tay, x, y, z) {
  _vt.set(x - tay.position.x, y - tay.position.y, z - tay.position.z); const d = _vt.length();
  tay.quaternion.setFromUnitVectors(XUONG, _vt.normalize()); tay.scale.y = Math.min(1, d / 0.645);
}
// hướng đồ trong nhóm giữ (khung thân người): điện thoại áp má (mặt máy quay vào má, đầu dưới chúc về miệng),
// điện thoại xem (màn hình ngửa về mặt), ly nghiêng khi uống
const Q0 = new THREE.Quaternion(), Q_UONG_MAX = new THREE.Quaternion().setFromEuler(new THREE.Euler(-1.15, 0, 0));
const Q_GOI = new THREE.Quaternion().setFromEuler(new THREE.Euler(-0.45, Math.PI / 2, 0)), Q_XEM = new THREE.Quaternion().setFromEuler(new THREE.Euler(1.16, 0, 0));
const GEO_DT = new THREE.BoxGeometry(0.07, 0.13, 0.015);
const GEO_COC = new THREE.CylinderGeometry(0.045, 0.038, 0.11, 8);
// thời lượng mặc định của từng cử chỉ (giây)
export const THOI_CU = { ngap: 2.6, vuon: 2.6, gai_dau: 2.2, goi_dt: 8, uong: 3, xem_dt: 5, cuoi: 1.9, gat_dau: 1.2, lac_dau: 1.2, noi: 2.5 };

// ---------- Người đi đường ngẫu nhiên ----------
const NGAU = {
  da: [DA.sang, DA.vua, DA.ngam, 0xeac3a0, 0xd9a07a],
  toc: [["ngoi"], ["cua"], ["gon"], ["re_giua"], ["bob"], ["dai_song"], ["thang_mai"], ["tem"], ["buoc"], ["bu"], ["lat"], ["buoi_cao"]],
  mauToc: [0x16120f, 0x1e1a17, 0x2a1c14, 0x5a3a1e, 0x7a4a2a, 0x9a9690],
  ao: ["thun", "thun", "somi", "polo", "len", "hoodie", "khoac"],
  mauAo: [0xf6f6f2, 0x1c1c1f, 0x2a5aa8, 0xc0262d, 0x2e8b57, 0xe9e04a, 0xf5b9cf, 0x8a8d92, 0x7b4bb3, 0xe8702a, 0x9cc3e6, 0xd8c7a3],
  quan: ["jean", "tay", "short", "jogger", "tuihop"],
  mauQuan: [0x2f3742, 0x4f6d9a, 0x1c1c1f, 0x6d6f73, 0xb39d72, 0x3f4247],
  giay: [["sneaker", 0xf2f2f2], ["depLe", 0x2a5aa8], ["tay", 0x231f1c], ["sneaker", 0x2a2c31], ["depLe", 0xc0262d]],
};
export function hinhNguoiNgauNhien(rnd, { nu = rnd() < 0.5, them = [] } = {}) {
  const chon = a => a[Math.floor(rnd() * a.length)];
  const kieuAo = nu && rnd() < 0.25 ? "vay_lien" : chon(NGAU.ao);
  const tocNu = [["bob"], ["dai_song"], ["thang_mai"], ["buoc"], ["buoi_cao"], ["tem"]];
  const tocNam = [["ngoi"], ["cua"], ["gon"], ["re_giua"], ["bu"], ["lat"]];
  const pk = [...them];
  if (rnd() < 0.3) pk.push("khauTrangVai");
  if (rnd() < 0.12) pk.push("kinhVuong");
  // áo khoác chống nắng của người Sài Gòn
  const chongNang = nu && rnd() < 0.35;
  const mauAo = chon(NGAU.mauAo);
  return {
    da: chon(NGAU.da), nu, beo: rnd() < 0.15, gay: rnd() < 0.2, cao: rnd() < 0.2, nho: nu && rnd() < 0.3,
    toc: [(nu ? chon(tocNu) : chon(tocNam))[0], chon(NGAU.mauToc), 0xf26fa6],
    mat: { mat: chon(["tron", "hep", "met", "to"]), may: chon(["manh", "day", "cau", "nhuong"]), mieng: chon(["thang", "mim", "cuoi", "meu"]), son: nu && rnd() < 0.6 ? chon([0xc75b6c, 0xe0607e, 0xa8505a]) : undefined, mi: nu },
    ao: chongNang ? { kieu: "hoodie", mau: chon([0xf5b9cf, 0x9cc3e6, 0xf6f6f2, 0xe9e04a]) } : { kieu: kieuAo, mau: mauAo, soVin: rnd() < 0.3, trong: 0xf6f6f2, vien: 0xf6f6f2 },
    quan: kieuAo === "vay_lien" ? { kieu: "da" } : { kieu: chon(NGAU.quan), mau: chon(NGAU.mauQuan) },
    giay: chon(NGAU.giay), pk,
    mauMu: chon([0xc0262d, 0xf6f6f2, 0x1c1c1f, 0x2a5aa8, 0xe9e04a, 0xf26fa6, 0x2e8b57]),
    mauKhauTrang: chon([0x3a4250, 0x1c1c1f, 0xf5b9cf, 0x9cc3e6, 0xf6f6f2]),
  };
}
export function taoNguoiNgauNhien(rnd, tuyChon) { return taoNguoi(null, hinhNguoiNgauNhien(rnd, tuyChon)); }

// Người ngồi xe máy (tài xế, người ngồi sau): khối gộp, hai tay cầm lái, đội mũ bảo hiểm
export function taoNguoiLaiXe(rnd, { aoXeOm = false, sau = false } = {}) {
  const nh = hinhNguoiNgauNhien(rnd);
  if (kieuMoi()) return taoNguoiLaiXeMoi(nh, { aoXeOm, sau });
  const ao = aoXeOm ? 0x2e9a4a : (nh.ao.mau ?? 0x2a5aa8), quan = nh.quan.mau ?? 0x2f3742, da = nh.da;
  const g = new THREE.Group();
  g.add(hop(0.36, 0.14, 0.4, quan, 0, 0.0, 0)); // đùi (ngồi)
  for (const s of [-1, 1]) { g.add(hop(0.13, 0.44, 0.14, quan, s * 0.12, -0.22, 0.22)); g.add(hop(0.14, 0.07, 0.22, 0x231f1c, s * 0.12, -0.44, 0.26)); }
  const than = vat(0.4, 0.34, 0.5, 0.22, vl(ao), 0, 0.32, -0.05); than.rotation.x = 0.18; g.add(than);
  if (aoXeOm) g.add(hop(0.3, 0.06, 0.02, 0xf6f6f2, 0, 0.42, 0.07));
  if (!sau) for (const s of [-1, 1]) { const t = hop(0.1, 0.1, 0.48, ao, s * 0.22, 0.46, 0.2); t.rotation.x = 0.35; g.add(t); g.add(hop(0.09, 0.09, 0.08, da, s * 0.24, 0.38, 0.45)); }
  else for (const s of [-1, 1]) g.add(hop(0.1, 0.4, 0.1, ao, s * 0.24, 0.3, 0));
  g.add(hop(0.11, 0.07, 0.11, da, 0, 0.6, -0.02));
  const dau = hop(0.26, 0.28, 0.26, da, 0, 0.76, 0); g.add(dau);
  g.add(hop(0.2, 0.08, 0.02, nh.mauKhauTrang, 0, 0.71, 0.135));
  g.add(hop(0.18, 0.05, 0.02, 0x111111, 0, 0.8, 0.135)); // mắt (nhìn từ xa)
  const mu = new THREE.Mesh(new THREE.SphereGeometry(0.18, 8, 5, 0, Math.PI * 2, 0, Math.PI / 2), vl(aoXeOm ? 0x2e9a4a : nh.mauMu)); mu.position.y = 0.84; mu.scale.set(1.05, 1, 1.12); g.add(mu);
  return gop(g);
}

// Mặt người lái xe: chung một tấm ảnh (8 x 4 ô, mỗi ô một gương mặt theo màu da / giới / miệng). Đầu người lái gộp
// chung khối với xe (gopKhoi), nên mặt phải là vật liệu một ảnh dùng chung: cả xe chỉ thêm đúng một lượt vẽ cho mặt.
// (Trước đây đầu dùng mảng vật liệu nên bị gopKhoi bỏ qua rồi mất theo nhóm cha: người lái không có mặt, chỉ còn khẩu
// trang, tai và mũ lơ lửng.)
const LX = { cot: 8, hang: 4, px: 256, dem: 8 };
let lxAnh = null;
function oMatLaiXe(nh) {
  if (!lxAnh) {
    const c = document.createElement("canvas"); c.width = LX.cot * LX.px; c.height = LX.hang * LX.px;
    const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4;
    lxAnh = { c, g: c.getContext("2d"), t, vl: new THREE.MeshLambertMaterial({ map: t }), o: new Map(), geo: new Map() };
  }
  const m = nh.mat || {}, key = [nh.da, !!nh.nu, nh.pk?.includes("khauTrangVai") ? "" : m.mieng].join(); // đeo khẩu trang: miệng nào cũng được
  let i = lxAnh.o.get(key);
  if (i == null) {
    if (lxAnh.o.size < LX.cot * LX.hang) {
      i = lxAnh.o.size; lxAnh.o.set(key, i);
      const x = (i % LX.cot) * LX.px, y = Math.floor(i / LX.cot) * LX.px, g = lxAnh.g;
      g.fillStyle = hex(nh.da); g.fillRect(x, y, LX.px, LX.px); // viền đệm màu da: lọc mipmap không lem sang ô bên cạnh
      g.drawImage(veMat(nh).map.image, x + LX.dem, y + LX.dem, LX.px - 2 * LX.dem, LX.px - 2 * LX.dem);
      lxAnh.t.needsUpdate = true;
    } else { // hết ô: mặt có sẵn cùng màu da, cùng giới
      const dau = [nh.da, !!nh.nu].join() + ",";
      for (const [k, j] of lxAnh.o) if (k.startsWith(dau)) { i = j; break; }
      i ??= 0;
    }
  }
  return i;
}
// khối đầu dùng ô mặt thứ i trong ảnh chung (toạ độ ảnh dồn vào ô)
function geoDauO(geo, i) {
  const k = geo.uuid + ":" + i;
  if (!lxAnh.geo.has(k)) {
    const g = geo.clone(), uv = g.attributes.uv, W = LX.cot * LX.px, H = LX.hang * LX.px, s = LX.px - 2 * LX.dem;
    const x0 = (i % LX.cot) * LX.px + LX.dem, y0 = Math.floor(i / LX.cot) * LX.px + LX.dem;
    for (let j = 0; j < uv.count; j++) uv.setXY(j, (x0 + uv.getX(j) * s) / W, 1 - (y0 + (1 - uv.getY(j)) * s) / H);
    g.clearGroups(); lxAnh.geo.set(k, g);
  }
  return lxAnh.geo.get(k);
}
// Kiểu mới: người thật ngồi trên yên (gốc nhóm ở mặt yên như người cũ), hai tay nắm tay lái, đội mũ bảo hiểm, đeo khẩu trang.
// Dựng bản ít đa giác (nhìn từ xa, cả phố vài chục chiếc), tư thế cố định rồi giao-thong.js gộp chung với xe.
function taoNguoiLaiXeMoi(nh, { aoXeOm, sau }) {
  // phần lớn người chạy xe ở Sài Gòn đeo khẩu trang (che từ sống mũi tới cằm); số còn lại để lộ miệng
  const khauTrang = nh.pk.includes("khauTrangVai") || (nh.mat?.mieng !== "cuoi" && nh.mat?.mieng !== "mim");
  nh.pk = khauTrang ? ["muBaoHiem", "khauTrangVai"] : ["muBaoHiem"]; if (aoXeOm) { nh.mauMu = 0x2e9a4a; nh.ao = { kieu: "khoac", mau: 0x2e9a4a, trong: 0xf6f6f2 }; }
  if (nh.ao.kieu === "vay_lien" || nh.ao.kieu === "vay_dai") { nh.ao = { kieu: "hoodie", mau: nh.ao.mau }; nh.quan = { kieu: "jean", mau: 0x4f6d9a }; }
  if (nh.quan.kieu === "da" || nh.quan.kieu === "vay_but") nh.quan = { kieu: "jean", mau: 0x4f6d9a };
  if (nh.nu && nh.mat) nh.mat = { mi: true, maHong: true, son: 0xc75b6c, ...nh.mat };
  const P = dungNguoiMoi(nh, veMat(nh), { tho: true, jean: VAI.jean });
  const { g, tayT, tayP, chanT, chanP, goiT, goiP, than, dau } = P;
  const hd = dau.children.find(c => c.material === P.matMang);
  if (hd) { hd.geometry = geoDauO(hd.geometry, oMatLaiXe(nh)); hd.material = lxAnh.vl; }
  g.scale.setScalar(1); g.position.y = -0.88;
  chanT.rotation.x = chanP.rotation.x = -1.3; goiT.rotation.x = goiP.rotation.x = 1.15;
  chanT.rotation.z = 0.08; chanP.rotation.z = -0.08;
  // ngả người ra trước quanh hông (y 0,9): thân, đầu, vai cùng dịch theo (trước đây thân xoay quanh gót chân nên
  // trượt ra trước, cổ lộ ra một khúc)
  const ng = 0.12, sn = Math.sin(ng), cs = Math.cos(ng);
  than.rotation.x = ng; than.position.set(0, 0.9 * (1 - cs), -0.9 * sn);
  dau.position.z += (dau.position.y - 0.9) * sn; dau.position.y = 0.9 + (dau.position.y - 0.9) * cs; dau.rotation.x = -0.1;
  for (const t of [tayT, tayP]) { t.position.z += (t.position.y - 0.9) * sn; t.position.y = 0.9 + (t.position.y - 0.9) * cs; }
  if (!sau) for (const [tay, ben] of [[tayT, -1], [tayP, 1]]) { // tay lái: (±0,27, 1,17, 0,56) trong khung người
    const v = new THREE.Vector3(ben * 0.27 - tay.position.x, 1.17 - tay.position.y, 0.56 - tay.position.z), d = v.length();
    tay.quaternion.setFromUnitVectors(XUONG, v.normalize()); tay.scale.y = Math.min(1, d / 0.645);
  } else for (const [tay, ben] of [[tayT, -1], [tayP, 1]]) { tay.rotation.set(-0.5, 0, ben * -0.15); tay.userData.khuyu = 0.6; }
  for (const t of [tayT, tayP]) giaiTay(t);
  const nhom = new THREE.Group(); nhom.add(g);
  return nhom;
}

// Siêu Nhân Hồng mức "Thấp" (khối hộp): dáng mập (bụng tròn nhô trước, đùi to), yếm trắng có hình thoi hồng, thắt lưng
// trắng khoá tròn, vạt áo ngắn viền trắng, găng / ủng trắng có hình thoi hồng, mũ hồng kính đen mỏ hồng, che miệng bạc.
// Trả về các phần như dungNguoiCu để taoNguoi gắn cử chỉ, ngồi, cầm đồ như mọi người.
function dungSieuNhanCu() {
  const g = new THREE.Group();
  const HONG = 0xf26fa6, TRANG = 0xf6f6f2, BAC = 0xc9ced8;
  const thoi = (s, mau, x, y, z, truc = "z") => { const m = hop(truc === "x" ? 0.01 : s, s, truc === "x" ? s : 0.01, mau, x, y, z); m.rotation[truc] = Math.PI / 4; return m; };
  const tru = (r, h, mau, x, y, z) => { const m = new THREE.Mesh(new THREE.CylinderGeometry(r, r, h, 8), vl(mau)); m.rotation.x = Math.PI / 2; m.position.set(x, y, z); return m; };
  const chan = side => {
    const k = new THREE.Group(); k.position.set(side * 0.115, 0.9, 0);
    k.add(hop(0.2, 0.44, 0.21, HONG, 0, -0.22, 0), hop(0.17, 0.2, 0.18, HONG, 0, -0.54, 0));
    k.add(hop(0.18, 0.28, 0.19, TRANG, 0, -0.73, 0), hop(0.18, 0.08, 0.28, TRANG, 0, -0.85, 0.04), hop(0.182, 0.02, 0.282, 0xd9d6d0, 0, -0.885, 0.04));
    k.add(thoi(0.09, HONG, 0, -0.59, 0.096)); // chữ V hồng ở cổ ủng
    if (side > 0) k.add(hop(0.05, 0.13, 0.08, 0xeeebe4, 0.105, -0.13, 0.05)); // bao súng
    return gop(k);
  };
  const chanT = chan(-1), chanP = chan(1); g.add(chanT, chanP);
  const than = new THREE.Group();
  than.add(hop(0.43, 0.14, 0.29, HONG, 0, 0.92, 0), vat(0.44, 0.44, 0.52, 0.3, vl(HONG), 0, 1.23));
  than.add(hop(0.42, 0.3, 0.12, HONG, 0, 1.1, 0.15), hop(0.34, 0.2, 0.06, HONG, 0, 1.1, 0.22), hop(0.46, 0.22, 0.26, HONG, 0, 1.1, 0)); // bụng to
  than.add(hop(0.45, 0.16, 0.31, TRANG, 0, 1.42, 0), thoi(0.2, TRANG, 0, 1.34, 0.152));                       // yếm trắng, đáy chữ V
  than.add(thoi(0.15, HONG, 0, 1.37, 0.158), thoi(0.15, HONG, 0, 1.37, -0.158));                                 // thoi giữa ngực / lưng
  for (const sd of [-1, 1]) than.add(thoi(0.08, HONG, sd * 0.165, 1.42, 0.157));                                // thoi trước vai
  than.add(hop(0.14, 0.08, 0.14, TRANG, 0, 1.53, 0));                                                            // cổ lọ trắng
  than.add(hop(0.45, 0.05, 0.32, TRANG, 0, 0.945, 0), tru(0.045, 0.02, BAC, 0, 0.945, 0.165), tru(0.028, 0.02, 0xb3202a, 0, 0.945, 0.17)); // thắt lưng, khoá
  g.add(gop(than));
  const vay = new THREE.Group(); vay.position.y = 0.92;                                                         // vạt áo ngắn
  vay.add(vat(0.45, 0.52, 0.11, 0.33, vl(HONG), 0, -0.055), vat(0.52, 0.53, 0.03, 0.34, vl(TRANG), 0, -0.125));
  const vayDong = gop(vay); g.add(vayDong);
  const tay = side => {
    const k = new THREE.Group(); k.position.set(side * 0.28, 1.43, 0);
    k.add(hop(0.14, 0.3, 0.14, HONG, 0, -0.15, 0), hop(0.15, 0.1, 0.15, TRANG, 0, -0.05, 0), thoi(0.07, HONG, side * 0.076, -0.05, 0, "x"));
    k.add(hop(0.125, 0.14, 0.125, HONG, 0, -0.36, 0), hop(0.135, 0.17, 0.135, TRANG, 0, -0.52, 0), thoi(0.07, HONG, side * 0.069, -0.52, 0, "x"));
    k.add(hop(0.11, 0.11, 0.08, TRANG, 0, -0.655, 0.005), hop(0.03, 0.06, 0.04, TRANG, side * -0.065, -0.63, 0.02));
    return gop(k);
  };
  const tayT = tay(-1), tayP = tay(1); g.add(tayT, tayP);
  const dau = new THREE.Group(); const dauY = 1.74; dau.position.y = dauY;
  dau.add(hop(0.34, 0.36, 0.34, HONG), hop(0.28, 0.1, 0.02, 0x16181e, 0, 0.015, 0.171));                      // vỏ mũ, kính
  for (const sd of [-1, 1]) dau.add(hop(0.1, 0.05, 0.02, 0x16181e, sd * 0.08, 0.07, 0.171));                  // thuỳ kính hai bên
  dau.add(hop(0.045, 0.13, 0.03, HONG, 0, 0.065, 0.178), hop(0.045, 0.03, 0.35, HONG, 0, 0.18, 0));          // mỏ, gờ đỉnh mũ
  dau.add(hop(0.2, 0.065, 0.02, BAC, 0, -0.085, 0.171), hop(0.36, 0.05, 0.36, 0xd94d8a, 0, -0.17, 0));        // che miệng, viền cổ
  g.add(dau); gop(dau);
  return { g, s: 1, tayT, tayP, chanT, chanP, goiT: null, goiP: null, than, dau, dauY, vaiY: 1.43, vayDong, matMang: null, iMat: 0, khT: tayT, khP: tayP, moi: false };
}

// Chó ta lông vàng, tai vểnh, đuôi cuộn, vòng cổ đỏ có chuông
function taoCho() {
  const g = new THREE.Group();
  const vang = 0xd9a24a, nhat = 0xedc98a;
  const than = new THREE.Group();
  than.add(hop(0.32, 0.28, 0.62, vang, 0, 0.42, 0), hop(0.26, 0.1, 0.5, nhat, 0, 0.3, 0));
  than.add(hop(0.3, 0.06, 0.08, 0xc0262d, 0, 0.55, 0.26)); than.add(hop(0.05, 0.05, 0.05, 0xe8c547, 0, 0.5, 0.31));
  g.add(gop(than));
  const dau = new THREE.Group(); dau.position.set(0, 0.62, 0.36); g.add(dau);
  dau.add(hop(0.26, 0.24, 0.26, vang), hop(0.15, 0.11, 0.15, nhat, 0, -0.05, 0.17), hop(0.06, 0.045, 0.03, 0x111111, 0, -0.02, 0.25));
  const tai = x => { const m = new THREE.Mesh(new THREE.ConeGeometry(0.06, 0.13, 4), vl(0xc48c38)); m.position.set(x, 0.17, -0.02); return m; };
  dau.add(tai(-0.08), tai(0.08));
  for (const x of [-0.06, 0.06]) { dau.add(hop(0.045, 0.045, 0.02, 0x111111, x, 0.04, 0.13)); dau.add(hop(0.015, 0.015, 0.01, 0xffffff, x + 0.01, 0.05, 0.142)); }
  const chan = [[-0.1, 0.2], [0.1, 0.2], [-0.1, -0.2], [0.1, -0.2]].map(([x, z]) => { const c = new THREE.Group(); c.position.set(x, 0.3, z); c.add(hop(0.08, 0.3, 0.08, vang, 0, -0.15, 0), hop(0.09, 0.04, 0.1, nhat, 0, -0.29, 0.01)); g.add(c); return c; });
  const duoi = new THREE.Mesh(new THREE.TorusGeometry(0.08, 0.03, 4, 8), vl(vang)); duoi.position.set(0, 0.62, -0.32); duoi.rotation.y = Math.PI / 2; g.add(duoi);
  return {
    group: g, chieuCao: 0.9,
    hoatDong(t, dangDi) {
      duoi.rotation.x = Math.sin(t * 10) * 0.4;
      const goc = dangDi ? Math.sin(t * 12) * 0.5 : 0;
      chan.forEach((c, i) => c.rotation.x = (i % 2 ? goc : -goc));
      dau.rotation.y = Math.sin(t * 0.7) * 0.25;
    },
  };
}

// Bảng tên lơ lửng trên đầu
export function taoBangTen(ten, phu = "") {
  // khung tự dài ra theo chữ (tên và tên vai), không bao giờ tràn
  const cv = document.createElement("canvas"); cv.width = 512; cv.height = 128;
  let tex = new THREE.CanvasTexture(cv); tex.colorSpace = THREE.SRGBColorSpace;
  const sp = new THREE.Sprite(new THREE.SpriteMaterial({ map: tex, transparent: true, depthWrite: false }));
  sp.scale.set(1.6, 0.4, 1);
  sp.renderOrder = 10;
  const F1 = "700 46px 'Be Vietnam Pro', system-ui, sans-serif", F2 = "500 30px 'Be Vietnam Pro', system-ui, sans-serif";
  const ve = (t, p) => {
    let c = cv.getContext("2d");
    c.font = F1; let w = c.measureText(t).width;
    if (p) { c.font = F2; w = Math.max(w, c.measureText(p).width); }
    const rong = Math.ceil(Math.max(200, w + 56));
    if (cv.width !== rong) { cv.width = rong; tex.dispose(); tex = new THREE.CanvasTexture(cv); tex.colorSpace = THREE.SRGBColorSpace; sp.material.map = tex; sp.material.needsUpdate = true; c = cv.getContext("2d"); }
    sp.scale.set(0.4 * rong / 128, 0.4, 1);
    c.clearRect(0, 0, rong, 128); c.textAlign = "center";
    c.fillStyle = "rgba(20,18,14,.78)"; c.beginPath(); c.roundRect(2, p ? 4 : 24, rong - 4, p ? 120 : 80, 22); c.fill();
    c.font = F1; c.fillStyle = "#fff"; c.fillText(t, rong / 2, p ? 56 : 80);
    if (p) { c.font = F2; c.fillStyle = "#f0a46e"; c.fillText(p, rong / 2, 102); }
    tex.needsUpdate = true;
  };
  ve(ten, phu);
  document.fonts?.ready?.then(() => ve(sp.userData.ten, sp.userData.phu));
  sp.userData = { ten, phu };
  sp.doiTen = (t, p = sp.userData.phu) => { sp.userData = { ten: t, phu: p }; ve(t, p); };
  return sp;
}

// Đôi tay góc nhìn thứ nhất (gắn vào camera): tay áo đúng trang phục của vai
export function taoDoiTay(ma) {
  const nh = NGOAI_HINH[ma] || NGOAI_HINH.ran_doc;
  let ao, da, co;
  if (nh.sieuNhan) { ao = 0xf26fa6; da = 0xf6f6f2; co = 0xf6f6f2; }
  else if (nh.cho) { ao = 0xd9a24a; da = 0xedc98a; co = 0xd9a24a; }
  else {
    da = nh.da;
    const k = nh.ao.kieu;
    const ngan = k === "thun" || k === "polo" || k === "yem" || k === "vay_lien";
    ao = ngan ? nh.da : (k === "vay_dai" ? (nh.ao.khoac || nh.ao.mau) : nh.ao.mau);
    co = ngan ? nh.da : (k === "vest" || k === "vest_nu" ? nh.ao.trong : toiMau(ao, 0.8));
  }
  const g = new THREE.Group();
  const moiTay = kieuMoi() ? dungTayNhin(ao, da, co, nh.nu, !!nh.sieuNhan) : null;
  const mot = (ben) => {
    if (moiTay) { // kiểu mới: cẳng tay tròn, bàn tay có ngón cái, gộp một khối mượt
      const t = moiTay(ben);
      t.position.set(0.2 * ben, -0.26, -0.16); t.rotation.set(0.08, -0.12 * ben, 0);
      g.add(gopMuot(t)); return t;
    }
    const t = new THREE.Group();
    t.add(hop(0.065, 0.065, 0.28, ao, 0, 0, -0.14));
    t.add(hop(0.068, 0.068, 0.025, co, 0, 0, -0.285));
    t.add(hop(0.075, 0.045, 0.1, da, 0, 0.004, -0.34));
    t.add(hop(0.022, 0.03, 0.05, da, ben * -0.035, 0.024, -0.31));
    for (let i = 0; i < 3; i++) t.add(hop(0.016, 0.02, 0.04, toiMau(da, 0.92), ben * (0.025 - i * 0.02), -0.012, -0.4));
    t.position.set(0.2 * ben, -0.26, -0.16);
    t.rotation.set(0.08, -0.12 * ben, 0);
    g.add(gop(t));
    return g.children[g.children.length - 1];
  };
  const trai = mot(-1), phai = mot(1);
  let voi = 0, go = 0;
  return {
    group: g,
    voiRa(v) { voi = v; },
    datGo(v) { go = v ? 1 : 0; }, // ngồi bàn làm việc: hai tay đặt lên bàn phím gõ
    hoatDong(t, dangDi, dt = 0.016) {
      this._go = (this._go ?? 0) + (go - (this._go ?? 0)) * Math.min(1, dt * 6);
      const k = this._go;
      if (k > 0.01) {
        for (const [tay, ben, lech] of [[trai, -1, 0], [phai, 1, 1.9]]) {
          const nhan = Math.max(0, Math.sin(t * 15 + lech)) * 0.012 + Math.max(0, Math.sin(t * 23 + lech * 2)) * 0.006;
          tay.position.set(ben * (0.2 - 0.06 * k), -0.26 + 0.06 * k + nhan * k, -0.16 - 0.16 * k);
          tay.rotation.set(0.08 - 0.42 * k, -0.12 * ben * (1 - k) + 0.1 * ben * k, 0);
        }
        return;
      } else { trai.rotation.set(0.08, 0.12, 0); phai.rotation.set(0.08, -0.12, 0); trai.position.x = -0.2; phai.position.x = 0.2; }
      const nhip = dangDi ? 9 : 1.6, bien = dangDi ? 0.025 : 0.006;
      trai.position.y = -0.26 + Math.sin(t * nhip) * bien + voi * 0.08;
      phai.position.y = -0.26 + Math.sin(t * nhip + Math.PI) * bien + voi * 0.1;
      trai.position.z = -0.16 - voi * 0.08 + (dangDi ? Math.cos(t * nhip) * 0.03 : 0);
      phai.position.z = -0.16 - voi * 0.14 + (dangDi ? Math.cos(t * nhip + Math.PI) * 0.03 : 0);
      phai.rotation.x = 0.08 + voi * 0.35 + (voi > 0.5 ? Math.sin(t * 6) * 0.06 : 0);
    },
  };
}

// kiểm thử tự động: dựng người mẫu từ trang (chup.cjs)
if (typeof window !== "undefined") window.__nhanVat = { taoNguoi, NGOAI_HINH };
