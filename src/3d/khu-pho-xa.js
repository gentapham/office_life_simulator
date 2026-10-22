// Khu phố xa: lấp kín phần đất trống quanh các trục phố đi được của Quận Hóng bằng nhà ống san sát
// (mặt trước, mặt sau có cửa sổ, cục nóng, ống nước; mái có bồn inox, máy nước nóng mặt trời, ăng-ten, mái tôn,
// vườn trên sân thượng, phơi đồ), hẻm, đường phụ có vỉa hè, cây, cột điện, xe máy dựng; vài công trình làm điểm nhấn
// (trường THCS, công viên có hồ, chùa, nhà thờ, chợ ven kênh, kênh có cầu, công trường có cần trục, chung cư, cao ốc).
// Chỉ để nhìn: người chơi không đi vào được (các khối chắn đã có trong thanh-pho.js).
// Tối ưu: không tạo Mesh cho từng món mà đổ thẳng tam giác vào vài bộ đệm, chia 3x3 ô (lõi phố + 8 ô xung quanh)
// để ô sau lưng camera tự bị loại. Mỗi ô tối đa 3 lượt vẽ: tường có ảnh cửa sổ (sáng đèn ban đêm), khối màu nướng
// vào đỉnh, kính cao ốc. Cả mặt đất là một khối. Đèn xa chỉ là điểm sáng (không đèn thời gian thực).
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";
import { VL_MAU_DINH } from "./gop-khoi.js";
import { veTex, vlDiem, taoDiemSang } from "./chi-tiet-pho.js";
import { cheDoNhe } from "../cai-dat.js";
import { MUC, vatLieuBe, matTienPBR, themChiTiet } from "./vat-lieu.js";
import { memBat, hinhTan, hinhThan, BoCo } from "./hinh-mem.js";

const TANG = 3.3;
// vùng lõi: phố chính, đại lộ, hẻm, quảng trường (người chơi chỉ đi trong vùng này)
export const LOI = { x0: -150, x1: 150, z0: -95, z1: 135 };
const trongLoi = (x, z) => x > LOI.x0 - 2 && x < LOI.x1 + 2 && z > LOI.z0 - 2 && z < LOI.z1 + 2;
const dLoi = (x, z) => Math.hypot(Math.max(LOI.x0 - x, 0, x - LOI.x1), Math.max(LOI.z0 - z, 0, z - LOI.z1));
// lưới đường: đường dọc (chạy theo z) đặt tại các x, đường ngang (theo x) tại các z; 52 là đại lộ, 37 là phố chính
const DOC = [-473, -398, -323, -248, -173, -98, -23, 52, 127, 202, 277, 352, 427, 502];
const NGANG = [-338, -263, -188, -113, -38, 37, 112, 187, 262, 337, 412, 487];
const KENH = -173;
const MIEN = { x0: -470, x1: 500, z0: -336, z1: 470 };
// hai mép của một đường: phố chính, đại lộ, kênh có kích thước riêng; trong lõi là hẻm 4 m, ngoài lõi đường 8 m + vỉa hè
const canhDoc = (x, z) => x === 52 ? [44, 60] : x === KENH ? [-182.5, -163.5] : trongLoi(x, z) ? [x - 2, x + 2] : [x - 6, x + 6];
const canhNgang = (z, x) => z === 37 ? [30, 44.5] : trongLoi(x, z) ? [z - 2, z + 2] : [z - 6, z + 6];
const oCua = (x, z) => (x < LOI.x0 ? 0 : x > LOI.x1 ? 2 : 1) + 3 * (z < LOI.z0 ? 0 : z > LOI.z1 ? 2 : 1);

// ---------- Ảnh ----------
// mặt tường nhà ống: 8 cột x 16 tầng, ô 64 px. Cột 0-3: mặt tiền, cột 4-7: mặt sau. Hàng dưới cùng là tầng trệt.
const MAU_DEN = ["#ffd28a", "#ffd28a", "#ffe2b0", "#e6f0ff", "#a8c8ff"];
const BO_O = (() => {
  let s = 5151; const r = () => (s = (s * 16807) % 2147483647) / 2147483647;
  const chon = a => a[Math.floor(r() * a.length)];
  const L = [];
  for (let c = 0; c < 8; c++) {
    L.push([]);
    for (let k = 0; k < 16; k++) {
      const kieu = k === 0
        ? (c < 4 ? ["cuon_mo", "cua_hang", "cong_sat", "cuon_dong"][c] : ["cua_sau", "so_nho_song", "tuong_ong", "cua_sau"][c - 4])
        : (c < 4 ? chon(["cua_so", "ban_cong", "cua_so_dh", "hai_cua", "ban_cong_phoi", "cua_so", "ban_cong"]) : chon(["so_nho_quat", "so_nho_dh", "tuong_ong", "so_nho_song", "so_nho_dh"]));
      L[c].push({ kieu, sang: r() < (k === 0 ? (c < 4 ? 0.75 : 0.3) : c < 4 ? 0.4 : 0.3), den: chon(MAU_DEN), h: r() });
    }
  }
  return L;
})();
function veO(g, x, y, o, phat) {
  const F = (mau, rx, ry, rw, rh) => { if (!phat) { g.fillStyle = mau; g.fillRect(x + rx, y + ry, rw, rh); } };
  const K = (rx, ry, rw, rh, mau = "#3a4855") => { if (phat) { if (o.sang) { g.fillStyle = o.den; g.fillRect(x + rx, y + ry, rw, rh); } } else { g.fillStyle = mau; g.fillRect(x + rx, y + ry, rw, rh); } };
  const song = (rx, ry, rw, rh, b) => { if (!phat) { g.fillStyle = "#26282d"; for (let i = rx; i <= rx + rw - 1; i += b) g.fillRect(x + i, y + ry, 1.4, rh); } };
  const tron = (cx, cy, r, mau) => { if (!phat) { g.fillStyle = mau; g.beginPath(); g.arc(x + cx, y + cy, r, 0, 7); g.fill(); } };
  const dh = (rx, ry) => { F("#ecedec", rx, ry, 19, 14); tron(rx + 9.5, ry + 7, 5, "#8a8e92"); tron(rx + 9.5, ry + 7, 2, "#5a5e62"); F("rgba(40,40,40,.4)", rx + 3, ry + 14, 1.5, 9); };
  if (!phat) {
    const gr = g.createLinearGradient(0, y, 0, y + 64); gr.addColorStop(0, "rgba(0,0,0,0)"); gr.addColorStop(1, "rgba(70,60,45,.13)");
    g.fillStyle = gr; g.fillRect(x, y, 64, 64);
    F("rgba(0,0,0,.15)", 0, 59, 64, 5); F("rgba(255,255,255,.55)", 0, 57, 64, 2);
  }
  switch (o.kieu) {
    case "cua_so": F("#fbfbf8", 13, 11, 38, 34); K(16, 14, 32, 28); song(18, 14, 30, 28, 5); F("#d6d0c4", 11, 45, 42, 3); break;
    case "hai_cua": for (const dx of [9, 37]) { F("#fbfbf8", dx - 2, 9, 22, 38); K(dx, 12, 18, 32); song(dx + 2, 12, 16, 32, 4); } break;
    case "cua_so_dh": F("#fbfbf8", 6, 11, 32, 34); K(8, 13, 28, 30); song(10, 13, 26, 30, 5); dh(41, 30); break;
    case "ban_cong": case "ban_cong_phoi":
      F("#5a5e63", 4, 3, 56, 46); K(18, 7, 28, 40, "#34424e"); F("#e4e0d8", 2, 46, 60, 6);
      F("#2a2c31", 4, 29, 56, 2); song(4, 29, 56, 17, 4);
      if (o.kieu === "ban_cong_phoi") { F("#555", 6, 9, 52, 1); ["#c0262d", "#f6f6f2", "#2a5aa8", "#e9e04a", "#f5b9cf"].forEach((m, i) => F(m, 8 + i * 10, 10, 7, 12 + (i % 2) * 5)); }
      else { tron(10, 40, 5, "#3d7a34"); tron(17, 41, 4, "#5a9a44"); tron(52, 40, 5, "#4f8a3c"); F("#b5653a", 7, 42, 14, 4); }
      break;
    case "so_nho_quat": F("#fbfbf8", 9, 13, 22, 20); K(11, 15, 18, 16, "#46525c"); F("#9a9ea2", 40, 15, 17, 17); tron(48.5, 23.5, 6.5, "#55595d"); song(43, 18, 12, 11, 3); F("rgba(60,50,40,.28)", 45, 32, 6, 22); break;
    case "so_nho_dh": F("#fbfbf8", 7, 11, 24, 22); K(9, 13, 20, 18, "#46525c"); song(10, 13, 19, 18, 4); dh(35, 27); F("#7d8186", 58, 0, 3, 64); break;
    case "tuong_ong": F("#7d8186", 27, 0, 4, 64); F("#6a6e73", 25, 22, 8, 4); F("#6a6e73", 25, 50, 8, 4); F("rgba(60,50,40,.22)", 34, 6, 5, 40); F("#55595d", 44, 9, 11, 7); song(45, 9, 10, 7, 2); break;
    case "so_nho_song": F("#fbfbf8", 17, 11, 30, 26); K(19, 13, 26, 22, "#46525c"); song(20, 13, 25, 22, 4); F("#7d8186", 4, 0, 3, 64); break;
    case "cuon_mo":
      F("#a6abb0", 4, 6, 56, 22); for (let i = 7; i < 28; i += 3) F("#878c91", 4, i, 56, 1);
      K(4, 28, 56, 36, "#3b3632");
      if (!phat) ["#c0262d", "#2a5aa8", "#e8b830", "#2e8b57", "#f6f6f2", "#e8702a"].forEach((m, i) => F(m, 7 + i * 9, 46 - (i % 3) * 4, 7, 18));
      F("#2a2c31", 2, 2, 60, 4); break;
    case "cua_hang":
      K(4, 8, 56, 56, "#4a443c");
      if (!phat) for (let k = 0; k < 3; k++) { F("#6b4a2f", 6, 22 + k * 13, 52, 2); for (let i = 0; i < 7; i++) F(["#c0262d", "#2a5aa8", "#e8b830", "#2e8b57", "#f26fa6"][(i + k) % 5], 8 + i * 7, 14 + k * 13, 5, 8); }
      F("#2a2c31", 2, 2, 60, 6); break;
    case "cong_sat": F("#46494e", 8, 10, 48, 54); K(12, 12, 40, 9, "#3a4855"); song(10, 22, 46, 42, 4); for (let i = 22; i < 64; i += 10) F("#2a2c31", 8, i, 48, 1.5); break;
    case "cuon_dong": F("#a3a8ad", 4, 8, 56, 56); for (let i = 9; i < 64; i += 3) F("#888d92", 4, i, 56, 1); F("#55595d", 28, 58, 8, 3); K(4, 5, 56, 3, "#2a2c31"); break;
    case "cua_sau": F("#f0ede6", 20, 20, 22, 44); F("#7a5a3a", 22, 22, 18, 42); F("#fbfbf8", 44, 18, 14, 14); K(46, 20, 10, 10, "#46525c"); F("#7d8186", 4, 0, 3, 64); break;
  }
}
const texNha = (phat, tiLe) => veTex("kpx-nha" + phat, 512, 1024, (g, W, H) => {
  g.fillStyle = phat ? "#000" : "#f4f2ec"; g.fillRect(0, 0, W, H);
  for (let c = 0; c < 8; c++) for (let k = 0; k < 16; k++) veO(g, c * 64, H - (k + 1) * 64, BO_O[c][k], phat);
}, { lap: true, tiLe });
// kính cao ốc: ô 32 px = 2 m ngang x 3,5 m một tầng; dải tường (spandrel) trên, kính dưới
const texKinh = (phat, tiLe) => veTex("kpx-kinh" + phat, 512, 512, (g, W, H) => {
  let s = 777; const r = () => (s = (s * 16807) % 2147483647) / 2147483647;
  g.fillStyle = phat ? "#000" : "#d4d7da"; g.fillRect(0, 0, W, H);
  for (let j = 0; j < 16; j++) {
    const tiLeHang = r() < 0.15 ? 0.85 : r() < 0.3 ? 0.05 : 0.3; // có tầng văn phòng còn sáng cả dãy, có tầng tắt hết
    for (let i = 0; i < 16; i++) {
      const x = i * 32, y = j * 32;
      if (phat) { if (r() < tiLeHang) { g.fillStyle = r() < 0.65 ? "#e8f0ff" : "#ffd9a0"; g.fillRect(x + 1, y + 9, 31, 22); } continue; }
      const gr = g.createLinearGradient(0, y + 8, 0, y + 32); gr.addColorStop(0, "#8796a4"); gr.addColorStop(1, "#5d6b79");
      g.fillStyle = gr; g.fillRect(x, y + 8, 32, 24);
      g.fillStyle = "rgba(255,255,255,.10)"; g.fillRect(x + 2, y + 10, 10, 20);
      g.fillStyle = "#e2e5e8"; g.fillRect(x, y, 1, 32); g.fillRect(x + 16, y + 8, 1, 24); g.fillStyle = "#b9bdc1"; g.fillRect(x, y + 7, 32, 1);
    }
  }
}, { lap: true, tiLe });
// mặt đất: hạt bê tông, vết nứt, vệt loang (nhân với màu đỉnh: nhựa, gạch, cỏ...)
const texNen = () => veTex("kpx-nen", 256, 256, (g, W, H) => {
  let s = 31337; const r = () => (s = (s * 16807) % 2147483647) / 2147483647;
  g.fillStyle = "#e9e9e9"; g.fillRect(0, 0, W, H);
  for (let i = 0; i < 26; i++) { const v = 200 + r() * 55; g.fillStyle = `rgba(${v},${v},${v},.5)`; g.beginPath(); g.ellipse(r() * W, r() * H, 8 + r() * 30, 6 + r() * 20, r() * 3, 0, 7); g.fill(); }
  for (let i = 0; i < 4200; i++) { const v = 175 + r() * 80; g.fillStyle = `rgb(${v},${v},${v})`; g.fillRect(r() * W, r() * H, 1 + r() * 1.5, 1 + r() * 1.5); }
  g.strokeStyle = "rgba(90,90,90,.35)"; g.lineWidth = 1;
  for (let i = 0; i < 6; i++) { let x = r() * W, y = r() * H; g.beginPath(); g.moveTo(x, y); for (let k = 0; k < 6; k++) { x += (r() - 0.5) * 30; y += (r() - 0.5) * 30; g.lineTo(x, y); } g.stroke(); }
}, { lap: true });
// bảng chữ (cổng trường, công viên, chùa, rào thi công...)
export const bangChu = (chu, nen, mau, phu = "", w = 1024, h = 256) => veTex("kpx-b" + chu + nen + phu, w, h, (g) => {
  g.fillStyle = nen; g.fillRect(0, 0, w, h); g.strokeStyle = mau; g.lineWidth = h * 0.04; g.strokeRect(h * 0.05, h * 0.05, w - h * 0.1, h * 0.9);
  g.fillStyle = mau; g.textAlign = "center"; g.textBaseline = "middle";
  let co = h * (phu ? 0.42 : 0.52); const font = c => `800 ${c}px 'Be Vietnam Pro', system-ui, sans-serif`;
  g.font = font(co); while (g.measureText(chu).width > w * 0.9 && co > 20) { co -= 4; g.font = font(co); }
  g.fillText(chu, w / 2, phu ? h * 0.4 : h * 0.52, w * 0.92);
  if (phu) { let c2 = h * 0.2; g.font = `700 ${c2}px 'Be Vietnam Pro', system-ui, sans-serif`; while (g.measureText(phu).width > w * 0.9 && c2 > 14) { c2 -= 2; g.font = `700 ${c2}px 'Be Vietnam Pro', system-ui, sans-serif`; } g.fillText(phu, w / 2, h * 0.76, w * 0.92); }
});

// ---------- Bộ đệm tam giác ----------
const _c = new Map();
const C = hex => { let c = _c.get(hex); if (!c) { c = new THREE.Color(hex); _c.set(hex, c); } return c; };
const lech = (hex, k) => new THREE.Color(hex).multiplyScalar(k);
class Bo {
  constructor() { this.p = []; this.n = []; this.c = []; this.u = []; }
  get rong() { return !this.p.length; }
  // tứ giác: A trái dưới, B phải dưới, C phải trên, D trái trên (nhìn từ phía mặt trước)
  tu(A, B, Cc, D, c, uv) {
    const ux = B[0] - A[0], uy = B[1] - A[1], uz = B[2] - A[2], vx = D[0] - A[0], vy = D[1] - A[1], vz = D[2] - A[2];
    let nx = uy * vz - uz * vy, ny = uz * vx - ux * vz, nz = ux * vy - uy * vx; const l = Math.hypot(nx, ny, nz) || 1; nx /= l; ny /= l; nz /= l;
    const [u0, v0, u1, v1] = uv || [0, 0, 0, 0];
    for (const [P, U, V] of [[A, u0, v0], [B, u1, v0], [Cc, u1, v1], [A, u0, v0], [Cc, u1, v1], [D, u0, v1]]) {
      this.p.push(P[0], P[1], P[2]); this.n.push(nx, ny, nz); this.c.push(c.r, c.g, c.b); this.u.push(U, V);
    }
  }
  tg(A, B, Cc, c) {
    const ux = B[0] - A[0], uy = B[1] - A[1], uz = B[2] - A[2], vx = Cc[0] - A[0], vy = Cc[1] - A[1], vz = Cc[2] - A[2];
    let nx = uy * vz - uz * vy, ny = uz * vx - ux * vz, nz = ux * vy - uy * vx; const l = Math.hypot(nx, ny, nz) || 1; nx /= l; ny /= l; nz /= l;
    for (const P of [A, B, Cc]) { this.p.push(P[0], P[1], P[2]); this.n.push(nx, ny, nz); this.c.push(c.r, c.g, c.b); this.u.push(0, 0); }
  }
  hinh() {
    const g = new THREE.BufferGeometry();
    g.setAttribute("position", new THREE.Float32BufferAttribute(this.p, 3)); g.setAttribute("normal", new THREE.Float32BufferAttribute(this.n, 3));
    g.setAttribute("color", new THREE.Float32BufferAttribute(this.c, 3)); g.setAttribute("uv", new THREE.Float32BufferAttribute(this.u, 2));
    g.computeBoundingSphere(); return g;
  }
}
// mặt đứng của hộp thẳng trục (x0<x1, z0<z1)
const matX = (bo, x, z0, z1, y0, y1, dau, c, uv) => dau > 0 ? bo.tu([x, y0, z1], [x, y0, z0], [x, y1, z0], [x, y1, z1], c, uv) : bo.tu([x, y0, z0], [x, y0, z1], [x, y1, z1], [x, y1, z0], c, uv);
const matZ = (bo, z, x0, x1, y0, y1, dau, c, uv) => dau > 0 ? bo.tu([x0, y0, z], [x1, y0, z], [x1, y1, z], [x0, y1, z], c, uv) : bo.tu([x1, y0, z], [x0, y0, z], [x0, y1, z], [x1, y1, z], c, uv);
const matTren = (bo, x0, x1, z0, z1, y, c, uv) => bo.tu([x0, y, z1], [x1, y, z1], [x1, y, z0], [x0, y, z0], c, uv);
function hop(bo, x0, x1, y0, y1, z0, z1, c, day = false) {
  matX(bo, x1, z0, z1, y0, y1, 1, c); matX(bo, x0, z0, z1, y0, y1, -1, c);
  matZ(bo, z1, x0, x1, y0, y1, 1, c); matZ(bo, z0, x0, x1, y0, y1, -1, c);
  matTren(bo, x0, x1, z0, z1, y1, c);
  if (day) bo.tu([x0, y0, z0], [x1, y0, z0], [x1, y0, z1], [x0, y0, z1], c);
}
const hopT = (bo, cx, y0, cz, w, h, d, c) => hop(bo, cx - w / 2, cx + w / 2, y0, y0 + h, cz - d / 2, cz + d / 2, c);
// khối mẫu (hộp, trụ, chóp, cầu) biến đổi bằng ma trận
const MAU_KHOI = {};
{
  const lay = g => { g = g.toNonIndexed(); return { p: g.attributes.position.array, n: g.attributes.normal.array }; };
  MAU_KHOI.hop = lay(new THREE.BoxGeometry(1, 1, 1));
  MAU_KHOI.tru6 = lay(new THREE.CylinderGeometry(1, 1, 1, 6));
  MAU_KHOI.tru8 = lay(new THREE.CylinderGeometry(1, 1, 1, 8));
  MAU_KHOI.tru12 = lay(new THREE.CylinderGeometry(1, 1, 1, 12));
  const chop = new THREE.ConeGeometry(Math.SQRT2, 1, 4, 1); chop.rotateY(Math.PI / 4); MAU_KHOI.chop = lay(chop); // đáy vuông cạnh 2
  MAU_KHOI.non8 = lay(new THREE.ConeGeometry(1, 1, 8, 1));
  MAU_KHOI.cau = lay(new THREE.IcosahedronGeometry(1, 0));
}
const _m = new THREE.Matrix4(), _n = new THREE.Matrix3(), _q = new THREE.Quaternion(), _e = new THREE.Euler(), _v = new THREE.Vector3(), _s = new THREE.Vector3(), _w = new THREE.Vector3();
// doc: [tối ở đáy, sáng ở đỉnh] tô màu theo chiều cao khuôn (tán cây kiểu tranh)
function khoi(bo, ten, x, y, z, sx, sy, sz, c, ry = 0, rx = 0, rz = 0, doc = null) {
  const T = MAU_KHOI[ten] || khuonMem(ten);
  _m.compose(_v.set(x, y, z), _q.setFromEuler(_e.set(rx, ry, rz, "YXZ")), _s.set(sx, sy, sz)); _n.getNormalMatrix(_m);
  const p = T.p, n = T.n;
  for (let i = 0; i < p.length; i += 3) {
    _w.set(p[i], p[i + 1], p[i + 2]).applyMatrix4(_m); bo.p.push(_w.x, _w.y, _w.z);
    _w.set(n[i], n[i + 1], n[i + 2]).applyMatrix3(_n).normalize(); bo.n.push(_w.x, _w.y, _w.z);
    if (doc) { const t = Math.min(1, Math.max(0, (p[i + 1] + 0.85) / 1.7)), k = doc[0] + (doc[1] - doc[0]) * t * t * (3 - 2 * t); bo.c.push(c.r * k, c.g * k, c.b * (k * 0.96)); }
    else bo.c.push(c.r, c.g, c.b);
    bo.u.push(0, 0);
  }
}
// khuôn hình mềm (chỉ dựng khi cần): tan0..5 cục tán chi tiết, tanxa0..2 cục tán ít mặt, than: thân cây thuôn cao 1 (đáy ở 0)
function khuonMem(ten) {
  const lay = g => { g = g.index ? g.toNonIndexed() : g; return { p: g.attributes.position.array, n: g.attributes.normal.array }; };
  if (ten.startsWith("tanxa")) MAU_KHOI[ten] = lay(hinhTan(+ten.slice(5) + 10, 0, 0.1));
  else if (ten.startsWith("tan")) MAU_KHOI[ten] = lay(hinhTan(+ten.slice(3), 1));
  else if (ten === "than") { const g = hinhThan(1, 1, 0.62, 0.06, 5, 2).clone(); g.translate(0, -0.5, 0); MAU_KHOI[ten] = lay(g); }
  else if (ten === "ong") { const g = hinhThan(1, 1, 1, 0, 7, 1).clone(); g.translate(0, -0.5, 0); MAU_KHOI[ten] = lay(g); }
  return MAU_KHOI[ten];
}
const MAU_TAN_XA = { 0x3d7a34: 0x3f7a4c, 0x4f8a3c: 0x5a8c4c, 0x2f6b2a: 0x2f6446, 0x5a8f3e: 0x4f8650, 0x6aa84f: 0x79a85a };
// mái dốc bốn phía (mái ngói trường, chùa): nóc chạy theo cạnh dài
function maiHien(bo, x0, x1, z0, z1, y, h, c, nhoRa = 0.8) {
  x0 -= nhoRa; x1 += nhoRa; z0 -= nhoRa; z1 += nhoRa;
  const dx = x1 - x0, dz = z1 - z0;
  if (dx >= dz) {
    const k = dz / 2, a = [x0 + k, y + h, (z0 + z1) / 2], b = [x1 - k, y + h, (z0 + z1) / 2];
    bo.tu([x0, y, z1], [x1, y, z1], b, a, c); bo.tu([x1, y, z0], [x0, y, z0], a, b, c);
    bo.tg([x0, y, z0], [x0, y, z1], a, c); bo.tg([x1, y, z1], [x1, y, z0], b, c);
  } else {
    const k = dx / 2, a = [(x0 + x1) / 2, y + h, z0 + k], b = [(x0 + x1) / 2, y + h, z1 - k];
    bo.tu([x1, y, z1], [x1, y, z0], a, b, c); bo.tu([x0, y, z0], [x0, y, z1], b, a, c);
    bo.tg([x0, y, z1], [x1, y, z1], b, c); bo.tg([x1, y, z0], [x0, y, z0], a, c);
  }
}
// mái hai mái (nóc theo trục x hoặc z)
function maiDoc(bo, x0, x1, z0, z1, y, h, c, theoX = true, nhoRa = 0.5) {
  if (theoX) {
    const zm = (z0 + z1) / 2; x0 -= nhoRa; x1 += nhoRa; z0 -= nhoRa; z1 += nhoRa;
    bo.tu([x0, y, z1], [x1, y, z1], [x1, y + h, zm], [x0, y + h, zm], c); bo.tu([x1, y, z0], [x0, y, z0], [x0, y + h, zm], [x1, y + h, zm], c);
    bo.tg([x0, y, z0], [x0, y, z1], [x0, y + h, zm], lech(c.getHex(), 0.9)); bo.tg([x1, y, z1], [x1, y, z0], [x1, y + h, zm], lech(c.getHex(), 0.9));
  } else {
    const xm = (x0 + x1) / 2; x0 -= nhoRa; x1 += nhoRa; z0 -= nhoRa; z1 += nhoRa;
    bo.tu([x1, y, z1], [x1, y, z0], [xm, y + h, z0], [xm, y + h, z1], c); bo.tu([x0, y, z0], [x0, y, z1], [xm, y + h, z1], [xm, y + h, z0], c);
    bo.tg([x0, y, z1], [x1, y, z1], [xm, y + h, z1], lech(c.getHex(), 0.9)); bo.tg([x1, y, z0], [x0, y, z0], [xm, y + h, z0], lech(c.getHex(), 0.9));
  }
}

const MAU_NHA = [0xf3d9a4, 0xe9b8a8, 0xbfd9c4, 0xf6efe0, 0xd9e6f2, 0xf4c27a, 0xc9b6dc, 0xf2a7a0, 0xe0d4b8, 0xa8d4d9, 0xf7e27a, 0xd6c3a5, 0xeeeae2, 0xdcdcd4, 0xf0c8a0, 0xb8d0e8];
const MAU_BIEN = [0xc0262d, 0x1f4fa8, 0xffcf3a, 0x2e8b57, 0xf2f2f2, 0xe8702a, 0xf26fa6, 0x1c1c1f];
const MAU_XE = [0xc0262d, 0x1f4fa8, 0x1c1c1f, 0xf2f2f2, 0x8a8d92, 0xe8702a, 0x2e8b57, 0x7b4bb3];

// =====================================================================================================
// ctx: { nhom, can, DEM, vlDat, NHA, dienThoai, KO } — KO: các khu đã có công trình (không xây đè)
export function taoKhuPhoXa(ctx) {
  const { nhom, DEM, vlDat } = ctx;
  const nhe = !!ctx.dienThoai || cheDoNhe();
  const RMAX = nhe ? 215 : 285;           // bán kính dựng nhà tính từ mép vùng đi được (sương mù xa nhất ~260-280 m)
  const RCT = nhe ? 55 : 100;             // trong bán kính này mới có đồ trên mái, xe dựng, ban công
  const RCAY = nhe ? 70 : 170;            // cây, cột điện, vạch kẻ đường
  let seed = 8080;
  const rnd = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
  const chon = a => a[Math.floor(rnd() * a.length)];
  const KO = (ctx.KO || []).slice();
  const dinhKO = (x0, x1, z0, z1) => KO.some(k => x1 > k[0] && x0 < k[1] && z1 > k[2] && z0 < k[3]);

  // bộ đệm theo ô
  const B = { tuong: [], boc: [], kinh: [], led: new Bo(), nen: new Bo() };
  for (let i = 0; i < 9; i++) { B.tuong.push(new Bo()); B.boc.push(new Bo()); B.kinh.push(new Bo()); }
  const bocO = (x, z) => B.boc[oCua(x, z)];
  const den = [];         // điểm đèn xa (sáng ban đêm)
  const nhaDaXay = [];

  // ---------- Mặt đất ----------
  const NEN = { nen: 0x99948a, nhua: 0x47494e, via: 0xb4aa9c, hem: 0xaaa69d, co: 0x6f9a48, dat: 0x8a6e4e, san: 0xcdc5b6, nuoc: 0x3e6c68, gach: 0xb98a6e };
  const nen = (x0, x1, z0, z1, y, mau) => {
    const c = typeof mau === "number" ? C(mau) : mau, s = 1 / 16;
    B.nen.tu([x0, y, z1], [x1, y, z1], [x1, y, z0], [x0, y, z0], c);
    const uv = B.nen.u; uv.splice(uv.length - 12, 12, x0 * s, -z1 * s, x1 * s, -z1 * s, x1 * s, -z0 * s, x0 * s, -z1 * s, x1 * s, -z0 * s, x0 * s, -z0 * s);
  };
  // nền chung: chừa lòng kênh
  const NX0 = -900, NX1 = 900, NZ0 = -365, NZ1 = 900, YN = -0.06;
  nen(NX0, -182.5, NZ0, NZ1, YN, NEN.nen); nen(-163.5, NX1, NZ0, NZ1, YN, NEN.nen);
  // kênh: lòng nước thấp, bờ kè, lối đi ven kênh
  nen(-180, -166, NZ0, NZ1, -1.5, NEN.nuoc);
  for (const [x, d] of [[-180, 1], [-166, -1]]) { const c = C(0x8a8478); matX(B.nen, x, NZ0, NZ1, -1.5, 0, d, c); }
  nen(-182.5, -180, NZ0, NZ1, 0, NEN.san); nen(-166, -163.5, NZ0, NZ1, 0, NEN.san);

  // ---------- Nhà ống ----------
  // huong: mặt tiền nhìn về 'nz' (-z), 'pz' (+z), 'nx' (-x), 'px' (+x). ben: 0 hẻm, 1 đường phụ, 2 phố chính / đại lộ
  function nhaOng(x0, x1, z0, z1, huong, soTang, ben) {
    const cx = (x0 + x1) / 2, cz = (z0 + z1) / 2, o = oCua(cx, cz), T = B.tuong[o], Bb = B.boc[o];
    const d = dLoi(cx, cz), h = soTang * TANG;
    const mau = lech(chon(MAU_NHA), 0.9 + rnd() * 0.12);
    const cot = Math.floor(rnd() * 4), cotSau = 4 + Math.floor(rnd() * 4);
    const uvT = [cot / 8 + 0.003, 0, (cot + 1) / 8 - 0.003, soTang / 16], uvS = [cotSau / 8 + 0.003, 0, (cotSau + 1) / 8 - 0.003, soTang / 16];
    const mauHong = rnd() < 0.35 ? lech(0x9d988e, 0.9 + rnd() * 0.15) : lech(mau.getHex(), 0.86);
    const mauMai = rnd() < 0.15 ? lech(0xa8503a, 0.9 + rnd() * 0.2) : lech(0xaaa59b, 0.8 + rnd() * 0.25);
    // tường
    const tr = { nz: [-1, "z"], pz: [1, "z"], nx: [-1, "x"], px: [1, "x"] }[huong];
    if (tr[1] === "z") {
      matZ(T, tr[0] < 0 ? z0 : z1, x0, x1, 0, h, tr[0], mau, uvT); matZ(T, tr[0] < 0 ? z1 : z0, x0, x1, 0, h, -tr[0], mau, uvS);
      matX(Bb, x1, z0, z1, 0, h, 1, mauHong); matX(Bb, x0, z0, z1, 0, h, -1, mauHong);
    } else {
      matX(T, tr[0] < 0 ? x0 : x1, z0, z1, 0, h, tr[0], mau, uvT); matX(T, tr[0] < 0 ? x1 : x0, z0, z1, 0, h, -tr[0], mau, uvS);
      matZ(Bb, z1, x0, x1, 0, h, 1, mauHong); matZ(Bb, z0, x0, x1, 0, h, -1, mauHong);
    }
    matTren(Bb, x0, x1, z0, z1, h, mauMai);
    nhaDaXay.push({ x0, x1, z0, z1, h });
    // khung toạ độ riêng: a dọc mặt tiền (0..W), b từ mặt tiền vào trong (0..D; âm là ra phía đường)
    const W = tr[1] === "z" ? x1 - x0 : z1 - z0, D = tr[1] === "z" ? z1 - z0 : x1 - x0;
    const L = huong === "nz" ? (a, b) => [x0 + a, z0 + b] : huong === "pz" ? (a, b) => [x1 - a, z1 - b] : huong === "nx" ? (a, b) => [x0 + b, z1 - a] : (a, b) => [x1 - b, z0 + a];
    const goc = huong === "nz" ? Math.PI : huong === "pz" ? 0 : huong === "nx" ? -Math.PI / 2 : Math.PI / 2;
    const hL = (bo, a0, a1, b0, b1, y0, y1, c) => { const [p, q] = L(a0, b0), [r, s] = L(a1, b1); hop(bo, Math.min(p, r), Math.max(p, r), y0, y1, Math.min(q, s), Math.max(q, s), c); };
    const kL = (ten, a, y, b, sa, sy, sb, c, rx = 0, rz = 0) => { const [x, z] = L(a, b); khoi(Bb, ten, x, y, z, sa, sy, sb, c, goc, rx, rz); };
    if (d > RMAX - 40 && rnd() < 0.6) return; // xa quá: chỉ còn khối
    // lan can mái phía trước, bồn nước
    hL(Bb, 0, W, 0, 0.2, h, h + 0.8, lech(mau.getHex(), 0.92));
    if (rnd() < 0.85) {
      const a = W * (0.25 + rnd() * 0.5), b = D * (0.55 + rnd() * 0.3), mb = rnd() < 0.72 ? C(0xd5d9dd) : rnd() < 0.6 ? C(0x2f6fb8) : C(0xf2f2f2);
      hL(Bb, a - 0.55, a + 0.55, b - 0.55, b + 0.55, h, h + 0.5, C(0x8a8d92));
      if (rnd() < 0.3) kL("tru6", a, h + 1.05, b, 0.55, 1.6, 0.55, mb, 0, Math.PI / 2); else kL("tru6", a, h + 1.15, b, 0.55, 1.3, 0.55, mb);
    }
    if (d > RCT) return;
    if (rnd() < 0.45) { const a = rnd() < 0.5 ? 1.5 : W - 1.5; hL(Bb, a - 1.2, a + 1.2, D - 3, D - 0.3, h, h + 2.6, lech(mau.getHex(), 0.88)); hL(Bb, a - 1.4, a + 1.4, D - 3.2, D - 0.1, h + 2.6, h + 2.75, C(0x8a8d92)); }
    if (rnd() < 0.3) {
      const mt = chon([0x5d86a8, 0xa8503a, 0x8a8d92, 0x4e8a6a, 0x6d8fa8]);
      kL("hop", W / 2, h + 2.2, D * 0.35, W - 0.4, 0.06, D * 0.5, C(mt), 0.14);
      for (const a of [0.3, W - 0.3]) for (const b of [D * 0.12]) hL(Bb, a - 0.05, a + 0.05, b - 0.05, b + 0.05, h, h + 2.2, C(0x555555));
    }
    if (rnd() < 0.25) { const a = W * (0.2 + rnd() * 0.6), b = D * 0.3; kL("hop", a, h + 0.75, b, 1.6, 0.06, 1.1, C(0x2a3a6a), -0.6); kL("tru6", a, h + 1.25, b + 0.4, 0.2, 1.6, 0.2, C(0xd5d9dd), 0, Math.PI / 2); }
    if (rnd() < 0.3) { const a = W * (0.15 + rnd() * 0.7), b = D * (0.6 + rnd() * 0.3); hL(Bb, a - 0.03, a + 0.03, b - 0.03, b + 0.03, h, h + 3.2, C(0x555555)); kL("hop", a, h + 2.8, b, 1.0, 0.04, 0.04, C(0x555555)); kL("hop", a, h + 2.4, b, 0.7, 0.04, 0.04, C(0x555555)); }
    if (rnd() < 0.22) {
      for (let i = 0; i < 3; i++) { const a = 0.7 + i * (W - 1.4) / 2, b = 0.8 + rnd() * 0.6; hL(Bb, a - 0.2, a + 0.2, b - 0.2, b + 0.2, h, h + 0.35, C(0xb5653a)); kL("cau", a, h + 0.7, b, 0.4 + rnd() * 0.3, 0.45, 0.4 + rnd() * 0.3, C(chon([0x4f8a3c, 0x3d7a34, 0x6aa84f, 0xd04a8a]))); }
      if (rnd() < 0.5) { hL(Bb, 0.4, W - 0.4, 1.0, 1.0 + D * 0.3, h + 2.2, h + 2.35, C(0x5a8a3c)); for (const a of [0.5, W - 0.5]) hL(Bb, a - 0.04, a + 0.04, 1.2, 1.28, h, h + 2.2, C(0x6b4a2f)); }
    }
    if (rnd() < 0.22) { const b = D * (0.4 + rnd() * 0.3); hL(Bb, 0.3, W - 0.3, b - 0.01, b + 0.01, h + 1.6, h + 1.62, C(0x444444)); for (let i = 0; i < 4; i++) { const a = 0.6 + i * (W - 1.2) / 4; hL(Bb, a, a + 0.45, b - 0.01, b + 0.01, h + 0.95, h + 1.6, C(chon([0xc0262d, 0xf6f6f2, 0x2a5aa8, 0xe9e04a, 0xf5b9cf, 0x2e8b57]))); } }
    // mặt tiền nhìn ra đường: bảng hiệu, mái che, ban công, xe máy dựng
    if (ben >= 1) {
      if (rnd() < (ben === 2 ? 0.9 : 0.55)) hL(Bb, 0.2, W - 0.2, -0.16, 0, 2.95, 3.95, C(chon(MAU_BIEN)));
      if (ben === 2 && rnd() < 0.55) kL("hop", W / 2, 2.75, -0.7, W - 0.3, 0.05, 1.5, C(chon([0xc0262d, 0x1f4fa8, 0x2e8b57, 0xe8702a, 0x7b4bb3])), -0.28);
      if (ben === 2) for (let t = 2; t < soTang; t++) if (rnd() < 0.6) {
        const y = t * TANG; hL(Bb, 0.15, W - 0.15, -0.85, 0, y, y + 0.12, lech(mau.getHex(), 0.88)); hL(Bb, 0.15, W - 0.15, -0.86, -0.8, y + 0.12, y + 1.0, C(0x3a3d44));
      }
      if (rnd() < (ben === 2 ? 0.55 : nhe ? 0 : 0.25)) for (let i = 0, n = 1 + Math.floor(rnd() * 3); i < n; i++) xeMay(L, goc, 0.8 + i * 0.75 + rnd() * 0.2, -1.1 - rnd() * 0.3, Bb);
    }
  }
  // xe máy dựng: thân, yên, hai bánh (đặt vuông góc mặt tiền)
  function xeMay(L, goc, a, b, bo) {
    const [x, z] = L(a, b), c = C(chon(MAU_XE)), s = Math.sin(goc + 0.25), co = Math.cos(goc + 0.25);
    khoi(bo, "hop", x, 0.55, z, 0.32, 0.5, 1.5, c, goc + 0.25);
    khoi(bo, "hop", x - s * 0.15, 0.85, z - co * 0.15, 0.28, 0.1, 0.7, C(0x1c1c1f), goc + 0.25);
    for (const k of [-0.62, 0.62]) khoi(bo, "hop", x + s * k, 0.27, z + co * k, 0.1, 0.54, 0.54, C(0x222222), goc + 0.25);
  }
  const chonTang = (d, ben) => {
    const r = rnd(); let t = r < 0.14 ? 2 : r < 0.42 ? 3 : r < 0.72 ? 4 : r < 0.88 ? 5 : r < 0.97 ? 6 : 7;
    if (ben === 2 && t < 6 && rnd() < 0.5) t++;
    return t;
  };
  // một dãy nhà dọc theo trục (dọc x nếu huong nz/pz, dọc z nếu nx/px), bề sâu [p0, p1]
  function day(a0, a1, p0, p1, huong, ben, { hem = [], thapGan = null } = {}) {
    const doc = huong === "nz" || huong === "pz", pm = (p0 + p1) / 2;
    let a = a0;
    while (a < a1 - 2.5) {
      const d0 = doc ? dLoi(a, pm) : dLoi(pm, a);
      let b = a + (d0 > 150 ? 5 : 3.8) + rnd() * (d0 > 150 ? 4 : 2.8);
      if (a1 - b < 2.5) b = a1;
      const s = a; a = b;
      if (hem.some(([h0, h1]) => b > h0 - 0.2 && s < h1 + 0.2)) continue;
      const [x0, x1, z0, z1] = doc ? [s, b, p0, p1] : [p0, p1, s, b];
      const cx = (x0 + x1) / 2, cz = (z0 + z1) / 2, d = dLoi(cx, cz);
      if (d > RMAX || cx < MIEN.x0 || cx > MIEN.x1 || cz < MIEN.z0 || cz > MIEN.z1) continue;
      if (dinhKO(x0, x1, z0, z1)) continue;
      let t = chonTang(d, ben);
      if (thapGan && thapGan(cx, cz)) t = Math.min(t, 2 + Math.floor(rnd() * 2));
      nhaOng(x0, x1, z0, z1, huong, t, ben);
    }
  }
  // gần công ty: nhà thấp cho sân thượng công ty nhìn được ra xa
  const thapGan = (x, z) => Math.hypot(x, (z - 6) * 1.2) < 58;
  // một ô phố giữa bốn đường: dãy nhà quay ra bốn phía, giữa có hẻm
  function oPho(x0, x1, z0, z1, benX0, benX1, benZ0, benZ1) {
    const Wd = x1 - x0, Dd = z1 - z0;
    if (Wd < 9 || Dd < 9) return;
    let ix0 = x0, ix1 = x1;
    // hẻm giữa ô (song song trục x)
    const hemZ = [];
    let dsDay;
    if (Dd < 32) { const m = z0 + Dd / 2; dsDay = [[z0, m, "nz", benZ0], [m, z1, "pz", benZ1]]; }
    else {
      const soHem = Dd > 72 ? 2 : 1, rong = 3.5, sau = (Dd - soHem * rong) / (soHem * 2 + 2);
      dsDay = []; let z = z0;
      for (let k = 0; k <= soHem; k++) {
        const m = z + sau; dsDay.push([z, m, "nz", k === 0 ? benZ0 : 0]); z = m;
        const m2 = k === soHem ? z1 : z + sau; dsDay.push([z, m2, "pz", k === soHem ? benZ1 : 0]); z = m2;
        if (k < soHem) { hemZ.push([z, z + rong]); z += rong; }
      }
    }
    if (Wd > 40) {
      const sc = 11 + rnd() * 3;
      ix0 = x0 + sc; ix1 = x1 - sc;
      day(z0, z1, x0, ix0, "nx", benX0, { hem: hemZ, thapGan }); day(z0, z1, ix1, x1, "px", benX1, { hem: hemZ, thapGan });
    }
    for (const [p0, p1, h, ben] of dsDay) day(ix0, ix1, p0, p1, h, ben, { thapGan });
    for (const [h0, h1] of hemZ) {
      const cz = (h0 + h1) / 2; if (dLoi((x0 + x1) / 2, cz) > RMAX) continue;
      for (let x = x0; x < x1 - 0.1; x += 6) { const xe = Math.min(x1, x + 6); if (!dinhKO(x, xe, h0, h1)) nen(x, xe, h0, h1, -0.01, NEN.hem); }
    }
  }

  // ---------- Đường phụ, hẻm lớn ----------
  const vach = C(0xeeeadc), vachVang = C(0xe8c547);
  const MEM = memBat("cay");
  let demCay = 0;
  const coXa = new BoCo(80); // cỏ công viên (InstancedMesh theo ô)
  const bam = (a, b) => { const v = Math.sin(a * 12.9898 + b * 78.233) * 43758.5453; return v - Math.floor(v); };
  function cayPho(x, z, s = 1) {
    const bo = bocO(x, z);
    if (MEM) {
      // thân thuôn hơi cong, gốc quét vôi, tán cục tròn tô đậm nhạt; gần thì nhiều mặt, xa thì ít mặt
      const gan = dLoi(x, z) < 30, k = demCay++;
      khoi(bo, "than", x, 1.7 * s, z, 0.13 * s, 3.4 * s, 0.13 * s, C(0x6b4a2f), k * 1.7);
      khoi(bo, "ong", x, 0.4, z, 0.27, 0.8, 0.27, C(0xeeeae0));
      const n = 2 + (rnd() < 0.3 ? 1 : 0);
      let cx = 0, cy = 0, cz = 0, rr = 0;
      for (let i = 0; i < n; i++) {
        const px = x + (rnd() - 0.5) * 1.6 * s, py = (3.8 + rnd() * 1.6) * s, pz = z + (rnd() - 0.5) * 1.6 * s, sx = (1.5 + rnd() * 0.8) * s, sy = (1.2 + rnd() * 0.5) * s, sz = (1.5 + rnd() * 0.8) * s;
        const mau = chon([0x3d7a34, 0x4f8a3c, 0x2f6b2a, 0x5a8f3e]);
        khoi(bo, "tanxa" + ((k + i) % 3), px, py, pz, sx, sy, sz, C(MAU_TAN_XA[mau]), k + i * 2.1, 0, 0, [0.7, 1.12]);
        cx += px; cy += py; cz += pz; rr += Math.min(sx, sz);
      }
      cx /= n; cy /= n; cz /= n; rr /= n;
      if (gan) khoi(bo, "tanxa" + ((k + 1) % 3), cx, cy + rr * 0.3, cz, rr * 0.75, rr * 0.62, rr * 0.75, C(0x5a8c4c), k, 0, 0, [0.78, 1.15]); // cục đỉnh
      return;
    }
    hop(bo, x - 0.15 * s, x + 0.15 * s, 0, 3.4 * s, z - 0.15 * s, z + 0.15 * s, C(0x6b4a2f));
    hop(bo, x - 0.3, x + 0.3, 0, 0.8, z - 0.3, z + 0.3, C(0xf2f2f2));
    const n = nhe ? 1 : 2 + (rnd() < 0.3 ? 1 : 0);
    for (let i = 0; i < n; i++) khoi(bo, "cau", x + (rnd() - 0.5) * 1.6 * s, (3.8 + rnd() * 1.6) * s, z + (rnd() - 0.5) * 1.6 * s, (1.5 + rnd() * 0.8) * s, (1.2 + rnd() * 0.5) * s, (1.5 + rnd() * 0.8) * s, C(chon([0x3d7a34, 0x4f8a3c, 0x2f6b2a, 0x5a8f3e])));
  }
  function cotDien(x, z) { const bo = bocO(x, z); hop(bo, x - 0.13, x + 0.13, 0, 8.6, z - 0.13, z + 0.13, C(0x9a958a)); hop(bo, x - 0.8, x + 0.8, 7.7, 7.82, z - 0.06, z + 0.06, C(0x8a857a)); hop(bo, x - 0.06, x + 0.06, 7.0, 7.12, z - 0.6, z + 0.6, C(0x8a857a)); }
  // đường dọc theo trục: truc 'x' (đường ngang, chạy theo x tại z = v) hoặc 'z'
  function duong(truc, v, s0, s1, coVia, e0 = 0, e1 = 0) {
    const P = (s, t) => truc === "x" ? [s, v + t] : [v + t, s];
    const quad = (sA, sB, tA, tB, y, mau) => { const [a, b] = P(sA, tA), [c2, d2] = P(sB, tB); nen(Math.min(a, c2), Math.max(a, c2), Math.min(b, d2), Math.max(b, d2), y, mau); };
    const mid = (s0 + s1) / 2, [mx, mz] = P(mid, 0);
    if (dLoi(mx, mz) > RMAX + 30) return;
    if (!coVia) { // hẻm trong lõi: bê tông 4 m, cắt khúc chạm công trình
      for (let s = s0; s < s1 - 0.1; s += 4) { const e = Math.min(s1, s + 4); const [a, b] = P(s, -2), [c2, d2] = P(e, 2); if (!dinhKO(Math.min(a, c2), Math.max(a, c2), Math.min(b, d2), Math.max(b, d2))) quad(s, e, -2, 2, -0.01, NEN.hem); }
      return;
    }
    quad(s0 - e0, s1 + e1, -4, 4, 0, NEN.nhua);
    for (const t of [-1, 1]) {
      quad(s0, s1, t * 4, t * 6, 0.14, NEN.via);
      // bó vỉa
      const [a, b] = P(s0, t * 4), [c2, d2] = P(s1, t * 4);
      if (truc === "x") matZ(B.nen, b, Math.min(a, c2), Math.max(a, c2), 0, 0.14, -t, C(0xcfc9bd)); else matX(B.nen, a, Math.min(b, d2), Math.max(b, d2), 0, 0.14, -t, C(0xcfc9bd));
    }
    if (dLoi(mx, mz) > RCAY) return;
    for (let s = s0 + 3; s < s1 - 3; s += 7) { const [a, b] = P(s, 0); const bo = bocO(a, b); if (truc === "x") hop(bo, a - 1.5, a + 1.5, 0.005, 0.03, b - 0.08, b + 0.08, vachVang); else hop(bo, a - 0.08, a + 0.08, 0.005, 0.03, b - 1.5, b + 1.5, vachVang); }
    for (const t of [-1, 1]) for (let s = s0 + 5 + rnd() * 4; s < s1 - 4; s += 13 + rnd() * 5) { const [x, z] = P(s, t * 4.7); if (dLoi(x, z) < RCAY) cayPho(x, z, 0.85 + rnd() * 0.3); }
    for (let s = s0 + 9; s < s1 - 4; s += 28) { const [x, z] = P(s, 5.5); cotDien(x, z); den.push({ x, y: 7.6, z, kc: 1.6, mau: 0xffcf90 }); }
  }
  // bờ kênh, cầu
  function cauQuaKenh(truc, v, rong) {
    // mặt cầu nằm sẵn ở mặt đường (y = 0); thêm dầm dưới, lan can hai bên
    const bo = bocO(KENH, v), c = C(0x9a968c), lc = C(0x5a6a72);
    hop(bo, -181, -165, -1.1, -0.05, v - rong / 2, v + rong / 2, c);
    if (truc !== "chinh") { nen(-182.5, -163.5, v - 4, v + 4, 0, NEN.nhua); nen(-182.5, -163.5, v - 6, v - 4, 0.14, NEN.via); nen(-182.5, -163.5, v + 4, v + 6, 0.14, NEN.via); }
    hop(bo, -181, -165, -1.6, -1.1, v - rong / 2 + 0.6, v - rong / 2 + 1.2, C(0x7a766c)); hop(bo, -181, -165, -1.6, -1.1, v + rong / 2 - 1.2, v + rong / 2 - 0.6, C(0x7a766c));
    for (const t of [-1, 1]) {
      const z = v + t * (rong / 2 - 0.1);
      hop(bo, -181, -165, 0, 0.25, z - 0.15, z + 0.15, c);
      hop(bo, -181, -165, 1.0, 1.1, z - 0.06, z + 0.06, lc);
      for (let x = -181; x <= -165; x += 2) hop(bo, x - 0.06, x + 0.06, 0.25, 1.0, z - 0.04, z + 0.04, lc);
    }
  }

  // ============ Công trình điểm nhấn ============
  const ganKO = (x0, x1, z0, z1) => KO.push([x0, x1, z0, z1]);
  // Cao ốc: tường kính (ảnh cửa sổ sáng đêm), nóc có sân trực thăng / máy móc / vương miện / dải đèn LED
  const DS_THAP = [];
  function thap({ x, z, w, d, h, mau = 0x9fc3e6, mai = "may", led = null, mauMai = 0x6a6e72 }) {
    ganKO(x - w / 2 - 2, x + w / 2 + 2, z - d / 2 - 2, z + d / 2 + 2);
    DS_THAP.push({ x, z, w, d, h, mau, mai, led, mauMai });
  }
  function dungThap({ x, z, w, d, h, mau, mai, led, mauMai }) {
    const o = oCua(x, z), K = B.kinh[o], bo = B.boc[o], c = C(mau);
    const x0 = x - w / 2, x1 = x + w / 2, z0 = z - d / 2, z1 = z + d / 2, lu = Math.floor(rnd() * 16) * 2, lv = Math.floor(rnd() * 16) * 3.5;
    const uvZ = (a, b, y0, y1) => [(a + lu) / 32, (y0 + lv) / 56, (b + lu) / 32, (y1 + lv) / 56];
    const tuongKinh = (X0, X1, Z0, Z1, y0, y1, cc) => {
      matZ(K, Z1, X0, X1, y0, y1, 1, cc, uvZ(X0, X1, y0, y1)); matZ(K, Z0, X0, X1, y0, y1, -1, cc, uvZ(-X1, -X0, y0, y1));
      matX(K, X1, Z0, Z1, y0, y1, 1, cc, uvZ(-Z1, -Z0, y0, y1)); matX(K, X0, Z0, Z1, y0, y1, -1, cc, uvZ(Z0, Z1, y0, y1));
    };
    // chân đế (sảnh) sẫm hơn, thân kính
    hop(bo, x0 - 0.6, x1 + 0.6, 0, 5, z0 - 0.6, z1 + 0.6, lech(mau, 0.55));
    tuongKinh(x0, x1, z0, z1, 5, h, c);
    nen(x0 - 5, x1 + 5, z0 - 5, z1 + 5, -0.025, NEN.san);
    const mm = C(mauMai);
    matTren(bo, x0, x1, z0, z1, h, mm);
    for (const [a0, a1, b0, b1] of [[x0, x1, z0, z0 + 0.3], [x0, x1, z1 - 0.3, z1], [x0, x0 + 0.3, z0, z1], [x1 - 0.3, x1, z0, z1]]) hop(bo, a0, a1, h, h + 1.1, b0, b1, lech(mau, 0.8));
    let dinh = h;
    if (mai === "heli") {
      const r = Math.min(w, d) * 0.36;
      hopT(bo, x, h, z, r * 1.8, 1.2, r * 1.8, C(0x55595e));
      khoi(bo, "tru12", x, h + 1.35, z, r, 0.3, r, C(0x3d4a44));
      const t = r * 0.45, cH = C(0xf2f2f2);
      hopT(bo, x - t * 0.6, h + 1.5, z, t * 0.2, 0.04, t * 1.6, cH); hopT(bo, x + t * 0.6, h + 1.5, z, t * 0.2, 0.04, t * 1.6, cH); hopT(bo, x, h + 1.5, z, t * 1.2, 0.04, t * 0.2, cH);
      dinh = h + 1.6;
    } else if (mai === "vuong") { // vương miện: tầng thu nhỏ + chóp + cột thu lôi
      const w2 = w * 0.7, d2 = d * 0.7;
      tuongKinh(x - w2 / 2, x + w2 / 2, z - d2 / 2, z + d2 / 2, h, h + 7, lech(mau, 1.05));
      khoi(bo, "chop", x, h + 7 + 3, z, w2 / 2, 6, d2 / 2, lech(mau, 0.75));
      hopT(bo, x, h + 13, z, 0.25, 9, 0.25, C(0xbfc4c8)); dinh = h + 22;
    } else { // máy móc: tháp giải nhiệt, phòng kỹ thuật, ăng-ten
      hopT(bo, x - w * 0.18, h, z + d * 0.1, w * 0.4, 3.2, d * 0.45, C(0xb9bdc1));
      khoi(bo, "tru8", x + w * 0.22, h + 1.2, z - d * 0.2, w * 0.12, 2.4, w * 0.12, C(0x9aa0a6));
      khoi(bo, "tru8", x + w * 0.22, h + 1.2, z + d * 0.2, w * 0.12, 2.4, w * 0.12, C(0x9aa0a6));
      hopT(bo, x - w * 0.3, h, z - d * 0.32, 0.2, 10, 0.2, C(0x8a8d92)); dinh = h + 10;
    }
    if (led) for (const [a0, a1, b0, b1] of [[x0 - 0.15, x1 + 0.15, z0 - 0.15, z0], [x0 - 0.15, x1 + 0.15, z1, z1 + 0.15], [x0 - 0.15, x0, z0, z1], [x1, x1 + 0.15, z0, z1]]) hop(B.led, a0, a1, h + 0.45, h + 1.0, b0, b1, C(led));
    den.push({ x: x - (mai === "may" ? w * 0.3 : 0), y: dinh + 0.3, z: z - (mai === "may" ? d * 0.32 : 0), kc: 1.4, mau: 0xff3a30 });
  }
  // Trường THCS Quận Hóng (sau lưng công ty): nhà chữ U vàng, hành lang có lan can, sân, cột cờ, cây bàng, cổng
  function truongHoc() {
    const X0 = -20, X1 = 30, Z0 = -76, Z1 = -22; ganKO(X0, X1, Z0, Z1);
    nen(X0, X1, Z0, Z1, -0.03, NEN.san);
    nen(-2, 16, -52, -36, 0.0, C(0x4f7f9a)); // sân bóng rổ
    const bo = bocO(5, -50), vang = C(0xf2c94c), trang = C(0xf6f2ea), ngoi = C(0xb8562e), toi = C(0x6a4e3a);
    const khu = (x0, x1, z0, z1, soTang, mat) => { // mat: hướng hành lang 'pz' | 'px' | 'nx'
      const h = soTang * 3.6;
      hop(bo, x0, x1, 0, h, z0, z1, vang);
      maiHien(bo, x0, x1, z0, z1, h, 2.6, ngoi, 1.0);
      for (let t = 0; t < soTang; t++) {
        const y = t * 3.6;
        if (mat === "pz") {
          hop(bo, x0, x1, y + 3.4, y + 3.6, z1, z1 + 2.2, trang); if (t > 0) hop(bo, x0, x1, y + 0.0, y + 1.0, z1 + 2.1, z1 + 2.25, trang);
          for (let x = x0 + 2; x < x1 - 1; x += 3.4) { hop(bo, x - 0.7, x + 0.7, y + 0.2, y + 2.6, z1, z1 + 0.06, toi); hop(bo, x + 1.0, x + 1.6, y + 1.2, y + 2.4, z1, z1 + 0.06, C(0x3a4855)); }
          for (let x = x0 + 0.3; x <= x1; x += 4.2) hop(bo, x - 0.2, x + 0.2, y, y + 3.4, z1 + 1.9, z1 + 2.25, trang);
        } else {
          const s = mat === "px" ? 1 : -1, xf = s > 0 ? x1 : x0;
          hop(bo, Math.min(xf, xf + s * 2.2), Math.max(xf, xf + s * 2.2), y + 3.4, y + 3.6, z0, z1, trang);
          if (t > 0) hop(bo, Math.min(xf + s * 2.1, xf + s * 2.25), Math.max(xf + s * 2.1, xf + s * 2.25), y, y + 1.0, z0, z1, trang);
          for (let z = z0 + 2; z < z1 - 1; z += 3.4) { hop(bo, Math.min(xf, xf + s * 0.06), Math.max(xf, xf + s * 0.06), y + 0.2, y + 2.6, z - 0.7, z + 0.7, toi); }
          for (let z = z0 + 0.3; z <= z1; z += 4.2) hop(bo, Math.min(xf + s * 1.9, xf + s * 2.25), Math.max(xf + s * 1.9, xf + s * 2.25), y, y + 3.4, z - 0.2, z + 0.2, trang);
        }
      }
    };
    khu(-18, 28, -74, -64, 3, "pz");
    khu(-18, -9, -64, -36, 2, "px"); khu(19, 28, -64, -36, 2, "nx");
    // cột cờ, bồn hoa
    hopT(bo, 5, 0, -30, 2.4, 0.5, 2.4, C(0xd8d2c4)); hopT(bo, 5, 0.5, -30, 0.14, 11, 0.14, C(0xd8d8d8));
    hopT(bo, 5.95, 9.6, -30, 1.8, 1.2, 0.04, C(0xd8262a));
    for (const [x, z] of [[-12, -30], [24, -30], [-12, -46], [24, -46], [12, -28]]) cayPho(x, z, 1.35);
    // rổ bóng
    for (const z of [-50.5, -37.5]) { hopT(bo, 7, 0, z, 0.15, 3.0, 0.15, C(0x3a3d44)); hopT(bo, 7, 2.9, z + (z < -44 ? 0.3 : -0.3), 1.6, 1.1, 0.06, C(0xf2f2f2)); }
    // tường rào + cổng chính quay về phía công ty
    const rao = C(0xe8dcc0);
    for (const [a0, a1, b0, b1] of [[X0, -2, Z1 - 0.3, Z1], [8, X1, Z1 - 0.3, Z1], [X0, X0 + 0.3, Z0, Z1], [X1 - 0.3, X1, Z0, Z1]]) { hop(bo, a0, a1, 0, 0.9, b0, b1, rao); hop(bo, a0, a1, 0.9, 2.1, b0 + 0.1, b1 - 0.1, C(0x3f6a52)); }
    hop(bo, -2.6, -1.8, 0, 3.6, Z1 - 0.4, Z1 + 0.4, vang); hop(bo, 7.8, 8.6, 0, 3.6, Z1 - 0.4, Z1 + 0.4, vang); hop(bo, -2.6, 8.6, 3.6, 4.0, Z1 - 0.4, Z1 + 0.4, C(0xc0262d));
    bien("TRƯỜNG THCS QUẬN HÓNG", "#1f4fa8", "#ffe14d", "DẠY TỐT - HỌC TỐT - HÓNG VỪA PHẢI", 3, 4.65, Z1 + 0.45, 10, 1.6, 0);
  }
  // Công viên Hóng Mát: cỏ, hồ nước, cầu gỗ, chòi nghỉ, lối dạo, ghế đá, cây
  function congVien() {
    const X0 = -92, X1 = -40, Z0 = -28, Z1 = 14; ganKO(X0, X1, Z0, Z1);
    nen(X0, X1, Z0, Z1, -0.03, NEN.co);
    const bo = bocO(-66, -7), cx = -68, cz = -8, rx = 13, rz = 8;
    // lối dạo vòng quanh
    for (const [a0, a1, b0, b1] of [[X0 + 3, X1 - 3, Z0 + 3, Z0 + 5], [X0 + 3, X1 - 3, Z1 - 5, Z1 - 3], [X0 + 3, X0 + 5, Z0 + 3, Z1 - 3], [X1 - 5, X1 - 3, Z0 + 3, Z1 - 3], [X1 - 14, X1 - 3, cz - 1, cz + 1]]) nen(a0, a1, b0, b1, 0.0, NEN.gach);
    // hồ: quạt tam giác, bờ đá
    const N = 22, nuoc = C(0x4c8a8c), da = C(0xb0a898);
    for (let i = 0; i < N; i++) {
      const a = i / N * Math.PI * 2, b = (i + 1) / N * Math.PI * 2;
      const k1 = 1 + 0.12 * Math.sin(a * 3), k2 = 1 + 0.12 * Math.sin(b * 3);
      const P1 = [cx + Math.cos(a) * rx * k1, 0.02, cz + Math.sin(a) * rz * k1], P2 = [cx + Math.cos(b) * rx * k2, 0.02, cz + Math.sin(b) * rz * k2];
      B.nen.tg([cx, 0.02, cz], P2, P1, nuoc);
      khoi(bo, "hop", (P1[0] + P2[0]) / 2, 0.12, (P1[2] + P2[2]) / 2, Math.hypot(P2[0] - P1[0], P2[2] - P1[2]) + 0.3, 0.3, 0.6, da, -Math.atan2(P2[2] - P1[2], P2[0] - P1[0]));
    }
    // cầu gỗ đỏ qua hồ
    hop(bo, cx - 1.1, cx + 1.1, 0.35, 0.55, cz - rz - 1.5, cz + rz + 1.5, C(0xa8402a));
    for (const s of [-1, 1]) hop(bo, cx + s * 1.05 - 0.05, cx + s * 1.05 + 0.05, 0.55, 1.4, cz - rz - 1.5, cz + rz + 1.5, C(0xc0262d));
    // chòi nghỉ
    const [gx, gz] = [X0 + 10, Z1 - 11];
    for (const [a, b] of [[-1.6, -1.6], [1.6, -1.6], [-1.6, 1.6], [1.6, 1.6]]) hopT(bo, gx + a, 0, gz + b, 0.25, 2.8, 0.25, C(0x7a3a24));
    hopT(bo, gx, 0, gz, 4.2, 0.3, 4.2, C(0xc8bfae));
    khoi(bo, "chop", gx, 3.6, gz, 2.8, 1.6, 2.8, C(0xb8562e));
    // ghế đá, bồn hoa, thùng rác
    for (let i = 0; i < 8; i++) { const x = X0 + 8 + i * 5.5; hopT(bo, x, 0, Z0 + 6.2, 1.6, 0.45, 0.5, C(0xb9b2a3)); }
    for (let i = 0; i < 6; i++) { const x = X0 + 10 + i * 6.5; hopT(bo, x, 0, Z1 - 7, 2.2, 0.35, 1.2, C(0x8a6e4e)); for (let k = 0; k < 3; k++) khoi(bo, "cau", x - 0.6 + k * 0.6, 0.5, Z1 - 7, 0.35, 0.3, 0.35, C(chon([0xd04a8a, 0xe8c547, 0xe0443a, 0xf2f2f2]))); }
    for (let i = 0; i < 26; i++) {
      const x = X0 + 2 + rnd() * (X1 - X0 - 4), z = Z0 + 2 + rnd() * (Z1 - Z0 - 4);
      if (((x - cx) / (rx + 2.5)) ** 2 + ((z - cz) / (rz + 2.5)) ** 2 < 1) continue;
      if (rnd() < 0.3) { hopT(bo, x, 0, z, 0.25, 7, 0.25, C(0x8a7a5a)); for (let k = 0; k < 5; k++) { const g = k / 5 * Math.PI * 2; khoi(bo, "hop", x + Math.cos(g) * 1.2, 6.9, z + Math.sin(g) * 1.2, 2.6, 0.08, 0.6, C(0x4f8a3c), -g, 0, -0.35); } }
      else cayPho(x, z, 1 + rnd() * 0.5);
    }
    // hàng rào sắt, cổng
    for (const [a0, a1, b0, b1] of [[X0, X1, Z0, Z0 + 0.2], [X0, X1, Z1 - 0.2, Z1], [X0, X0 + 0.2, Z0, Z1], [X1 - 0.2, X1, Z0, cz - 3], [X1 - 0.2, X1, cz + 3, Z1]]) { hop(bo, a0, a1, 0, 0.5, b0, b1, C(0xd8d2c4)); hop(bo, a0, a1, 0.5, 1.6, b0 + 0.05, b1 - 0.05, C(0x2f5a3a)); }
    hop(bo, X1 - 0.4, X1 + 0.2, 0, 3.4, cz - 3.4, cz - 2.8, C(0xd8d2c4)); hop(bo, X1 - 0.4, X1 + 0.2, 0, 3.4, cz + 2.8, cz + 3.4, C(0xd8d2c4));
    if (MEM) {
      // bụi cây tròn dọc hàng rào phía trong, cỏ mọc thành đám trên bãi cỏ (tránh hồ, lối dạo)
      const bui = (x, z, k) => { for (let i = 0; i < 2; i++) khoi(bo, "tanxa" + ((k + i) % 3), x + (i - 0.5) * 0.9, 0.55, z + (bam(x, z + i) - 0.5) * 0.4, 0.75 + bam(z, x + i) * 0.3, 0.6, 0.75, C(i ? 0x2f6446 : 0x3f7a4c), k + i, 0, 0, [0.7, 1.12]); };
      let k = 0;
      for (let x = X0 + 2; x < X1 - 2; x += 3.2) { bui(x, Z0 + 1.2, k++); bui(x, Z1 - 1.2, k++); }
      for (let z = Z0 + 4; z < Z1 - 2; z += 3.2) { bui(X0 + 1.2, z, k++); if (Math.abs(z - cz) > 4.5) bui(X1 - 1.2, z, k++); }
      const loi = (x, z) => (z > Z0 + 2.6 && z < Z0 + 5.4) || (z > Z1 - 5.4 && z < Z1 - 2.6) || (x > X0 + 2.6 && x < X0 + 5.4) || (x > X1 - 5.4 && x < X1 - 2.6) || (x > X1 - 14.4 && z > cz - 1.4 && z < cz + 1.4);
      for (let i = 0; i < 140; i++) {
        const x0 = X0 + 2 + bam(i, 1) * (X1 - X0 - 4), z0 = Z0 + 2 + bam(i, 2) * (Z1 - Z0 - 4);
        for (let j = 0; j < 5; j++) {
          const x = x0 + (bam(i, j + 3) - 0.5) * 1.4, z = z0 + (bam(j, i + 7) - 0.5) * 1.4;
          if (((x - cx) / (rx + 1.5)) ** 2 + ((z - cz) / (rz + 1.5)) ** 2 < 1 || loi(x, z)) continue;
          coXa.them(x, -0.03, z, 1.1 + bam(x, z) * 0.6);
        }
      }
    }
    bien("CÔNG VIÊN HÓNG MÁT", "#2e8b57", "#ffffff", "", X1 + 0.25, 3.0, cz, 6, 1.1, Math.PI / 2);
  }
  // Chùa Phố Cũ: chánh điện hai tầng mái, bảo tháp chín tầng, cổng tam quan, tượng, cây bồ đề
  function chua() {
    const X0 = 74, X1 = 98, Z0 = -50, Z1 = -12; ganKO(X0, X1, Z0, Z1);
    nen(X0, X1, Z0, Z1, -0.03, C(0xd2c4a8));
    const bo = bocO(86, -30), vang = C(0xe8c070), mai = C(0xc8502a), kem = C(0xf0e2c0), nau = C(0x7a2a1a);
    hop(bo, 78, 94, 0, 0.8, -46, -33, C(0xc8bfae));
    hop(bo, 79, 93, 0.8, 7, -45, -34, vang);
    for (let x = 80; x <= 92; x += 3) hop(bo, x - 0.3, x + 0.3, 0.8, 7, -33.9, -33.4, C(0xa8402a));
    maiHien(bo, 79, 93, -45, -34, 7, 2.2, mai, 1.6);
    hop(bo, 82, 90, 8.6, 10.6, -42, -37, vang); maiHien(bo, 82, 90, -42, -37, 10.6, 2.0, mai, 1.2);
    hopT(bo, 86, 12.6, -39.5, 6, 0.3, 0.3, C(0xd8a838));
    // bảo tháp
    let y = 0, s = 6.4;
    for (let i = 0; i < 9; i++) { const hh = 2.9 - i * 0.12; hopT(bo, 86, y, -20, s, hh, s, kem); y += hh; khoi(bo, "chop", 86, y + 0.35, -20, s / 2 + 0.6, 0.7, s / 2 + 0.6, nau); y += 0.5; s -= 0.5; }
    khoi(bo, "tru8", 86, y + 1.2, -20, 0.35, 2.4, 0.35, C(0xd8a838)); khoi(bo, "cau", 86, y + 2.6, -20, 0.45, 0.45, 0.45, C(0xd8a838));
    den.push({ x: 86, y: y + 3.2, z: -20, kc: 1.2, mau: 0xffc060 });
    // cổng tam quan quay về hẻm phía bắc chợ
    for (const x of [77, 81, 91, 95]) hopT(bo, x, 0, -12.6, 0.8, 4.4, 0.8, kem);
    hop(bo, 76, 96, 4.4, 4.9, -13.2, -12, kem); maiHien(bo, 80, 92, -13.2, -12, 4.9, 1.4, mai, 0.6); maiHien(bo, 76, 80, -13.2, -12, 4.0, 1.0, mai, 0.4); maiHien(bo, 92, 96, -13.2, -12, 4.0, 1.0, mai, 0.4);
    bien("CHÙA PHỐ CŨ", "#7a1424", "#ffd76a", "", 86, 3.2, -11.95, 5, 0.9, 0);
    // tượng Quan Âm trắng, cây bồ đề
    hopT(bo, 80, 0, -26, 1.6, 1.2, 1.6, C(0xc8bfae)); khoi(bo, "non8", 80, 2.6, -26, 0.55, 2.8, 0.55, C(0xf6f6f2)); khoi(bo, "cau", 80, 4.25, -26, 0.32, 0.38, 0.32, C(0xf6f6f2));
    hopT(bo, 94, 0, -24, 0.7, 5, 0.7, C(0x6b4a2f)); for (let k = 0; k < 5; k++) khoi(bo, "cau", 94 + (rnd() - 0.5) * 4, 6 + rnd() * 2, -24 + (rnd() - 0.5) * 4, 3, 2.2, 3, C(chon([0x3d7a34, 0x4f8a3c])));
    for (const [a0, a1, b0, b1] of [[X0, X1, Z0, Z0 + 0.3], [X0, X0 + 0.3, Z0, Z1], [X1 - 0.3, X1, Z0, Z1]]) hop(bo, a0, a1, 0, 2.2, b0, b1, kem);
  }
  // Nhà thờ Giáo xứ Hóng: mái dốc, tháp chuông nhọn
  function nhaTho() {
    const X0 = -148, X1 = -112, Z0 = 98, Z1 = 134; ganKO(X0, X1, Z0, Z1);
    nen(X0, X1, Z0, Z1, -0.03, NEN.san);
    const bo = bocO(-130, 116), kem = C(0xf2ead8), mai = C(0x8a5a4a);
    hop(bo, -136, -124, 0, 11, 108, 130, kem); maiDoc(bo, -136, -124, 108, 130, 11, 5, mai, false, 0.6);
    for (let z = 111; z < 129; z += 3.6) for (const x of [-136.05, -123.95]) hop(bo, x - 0.05, x + 0.05, 2.5, 8.5, z - 0.6, z + 0.6, C(0x6a7ab0));
    hop(bo, -134, -126, 0, 22, 101, 108, kem);
    for (const y of [8, 14, 19]) hop(bo, -134.3, -125.7, y, y + 0.4, 100.7, 108.3, C(0xd8ccb2));
    hop(bo, -131.5, -128.5, 2, 6.5, 100.9, 101, C(0x5a3a2a)); hop(bo, -131, -129, 15, 18, 100.9, 101, C(0x2a2c31));
    khoi(bo, "chop", -130, 22 + 7, 104.5, 4, 14, 3.5, C(0x5a6a72));
    hopT(bo, -130, 36, 104.5, 0.2, 2.6, 0.2, C(0xd8a838)); hopT(bo, -130, 37.4, 104.5, 1.2, 0.2, 0.2, C(0xd8a838));
    den.push({ x: -130, y: 39, z: 104.5, kc: 1.0, mau: 0xffe0a0 });
    for (const [x, z] of [[-144, 102], [-116, 102], [-144, 128], [-116, 128]]) cayPho(x, z, 1.3);
  }
  // Chợ Ven Kênh: dãy mái tôn hai mái nối nhau, cột thép, sạp hàng, dù che
  function choKenh() {
    const X0 = -236, X1 = -188, Z0 = -16, Z1 = 29.6; ganKO(X0, X1, Z0, Z1);
    nen(X0, X1, Z0, Z1, -0.03, C(0x9a958c));
    const bo = bocO(-212, 6), ton = C(0x6d8fa8), cot = C(0x5a5d63);
    for (let x = X0 + 1; x <= X1 - 1; x += 6) for (let z = Z0 + 2; z <= Z1 - 1; z += 6) hopT(bo, x, 0, z, 0.3, 6.2, 0.3, cot);
    for (let x = X0; x < X1 - 0.1; x += 8) { maiDoc(bo, x, x + 8, Z0 + 1, Z1, 6.2, 2.2, rnd() < 0.3 ? C(0x8a8d92) : ton, false, 0.2); }
    hop(bo, X0, X1, 6.0, 6.2, Z1 - 0.2, Z1, C(0x3a3d44));
    for (let i = 0; i < 40; i++) { const x = X0 + 2 + rnd() * (X1 - X0 - 4), z = Z0 + 3 + rnd() * (Z1 - Z0 - 6); hopT(bo, x, 0, z, 2.2, 0.85, 1.4, C(chon([0x8a6a4a, 0xb9b2a3, 0x6b8aa8]))); for (let k = 0; k < 3; k++) hopT(bo, x - 0.7 + k * 0.7, 0.85, z, 0.5, 0.25, 0.9, C(chon([0x6aa84f, 0xe8702a, 0xe8c547, 0xc0262d, 0xf2f2f2]))); }
    for (let i = 0; i < 6; i++) { const x = X0 + 5 + i * 7.5; hopT(bo, x, 0, Z1 - 1.5, 0.06, 2.3, 0.06, C(0xdddddd)); khoi(bo, "non8", x, 2.5, Z1 - 1.5, 1.6, 0.6, 1.6, C(chon([0xc0262d, 0x2a5aa8, 0xe8702a, 0x2e8b57]))); }
    bien("CHỢ VEN KÊNH", "#c0262d", "#ffe14d", "HÀNG TƯƠI MỖI SÁNG - CÁ TÔM ĐỦ LOẠI", (X0 + X1) / 2, 6.5, Z1 + 0.05, 12, 2, 0);
  }
  // Công trường: khung bê tông dở dang, lưới xanh, rào tôn, cần trục tháp
  function congTruong() {
    const X0 = 102, X1 = 150, Z0 = -95, Z1 = -27; ganKO(X0, X1, Z0, Z1);
    nen(X0, X1, Z0, Z1, -0.03, NEN.dat);
    const bo = bocO(126, -60), bt = C(0xb5b0a6), gach = C(0xb8603a), luoi = C(0x3a7a4a), vang = C(0xe8b820);
    const bx0 = 112, bx1 = 142, bz0 = -82, bz1 = -50, soTang = 13;
    for (let t = 0; t < soTang; t++) {
      const y = t * 3.3;
      if (t > 0) hop(bo, bx0, bx1, y - 0.3, y, bz0, bz1, bt);
      for (let x = bx0 + 0.3; x <= bx1; x += 7.4) for (let z = bz0 + 0.3; z <= bz1; z += 7.9) hop(bo, x - 0.3, x + 0.3, y, y + 3.0, z - 0.3, z + 0.3, bt);
      if (t < 6) { hop(bo, bx0, bx1, y, y + 3.0, bz1 - 0.25, bz1, t < 4 ? gach : luoi); hop(bo, bx0, bx0 + 0.25, y, y + 3.0, bz0, bz1, gach); }
      else if (t < 10) hop(bo, bx1 - 0.25, bx1, y, y + 3.0, bz0, bz1, luoi);
    }
    // cần trục tháp
    const cx = 106, cz = -60, H = 60;
    for (const [a, b] of [[-0.8, -0.8], [0.8, -0.8], [-0.8, 0.8], [0.8, 0.8]]) hopT(bo, cx + a, 0, cz + b, 0.22, H, 0.22, vang);
    for (let y = 2; y < H; y += 2.6) { hopT(bo, cx, y, cz - 0.8, 1.8, 0.14, 0.14, vang); hopT(bo, cx, y, cz + 0.8, 1.8, 0.14, 0.14, vang); hopT(bo, cx - 0.8, y + 1.3, cz, 0.14, 0.14, 1.8, vang); hopT(bo, cx + 0.8, y + 1.3, cz, 0.14, 0.14, 1.8, vang); }
    hopT(bo, cx, H, cz, 2.6, 1.4, 2.6, vang); hopT(bo, cx + 1.6, H - 2.2, cz, 1.6, 1.8, 1.8, C(0xd8dde2));
    hop(bo, cx - 1.6, cx + 46, H + 1.4, H + 2.6, cz - 0.6, cz + 0.6, vang);
    hop(bo, cx - 16, cx - 1.6, H + 1.4, H + 2.4, cz - 0.7, cz + 0.7, vang); hop(bo, cx - 15, cx - 10, H - 0.6, H + 1.4, cz - 1, cz + 1, C(0x8a8d92));
    for (const [a, b] of [[-0.6, -0.6], [0.6, -0.6], [-0.6, 0.6], [0.6, 0.6]]) khoi(bo, "hop", cx + a * 0.5, H + 5.5, cz + b * 0.5, 0.18, 6.4, 0.18, vang, 0, a * 0.12, -b * 0.12);
    khoi(bo, "hop", cx + 20, H + 5.2, cz, Math.hypot(42, 6.5), 0.06, 0.06, C(0x333333), 0, 0, -Math.atan2(6.5, 42));
    khoi(bo, "hop", cx - 8, H + 5.2, cz, Math.hypot(14, 6.5), 0.06, 0.06, C(0x333333), 0, 0, Math.atan2(6.5, 14));
    hopT(bo, cx + 30, H + 0.4, cz, 1.2, 1.0, 1.4, C(0x5a5d63)); hopT(bo, cx + 30, 26, cz, 0.05, H - 25.6, 0.05, C(0x222222)); hopT(bo, cx + 30, 23, cz, 3, 3, 1.2, C(0x8a6a4a));
    den.push({ x: cx, y: H + 9, z: cz, kc: 1.6, mau: 0xff3a30 }, { x: cx + 46, y: H + 2.8, z: cz, kc: 1.4, mau: 0xff3a30 });
    // rào tôn xanh trắng, bảng dự án, lán trại, đống cát, máy xúc
    for (const [a0, a1, b0, b1] of [[X0, X1, Z1 - 0.15, Z1], [X0, X1, Z0, Z0 + 0.15], [X0, X0 + 0.15, Z0, Z1], [X1 - 0.15, X1, Z0, Z1]]) { hop(bo, a0, a1, 0, 2.0, b0, b1, C(0x2a5aa8)); hop(bo, a0, a1, 2.0, 2.5, b0, b1, C(0xf2f2f2)); }
    bien("DỰ ÁN HÓNG RESIDENCE", "#1f4fa8", "#ffffff", "ĐANG THI CÔNG - XIN LỖI VÌ SỰ BẤT TIỆN", 126, 0.4, Z1 + 0.04, 14, 2.0, 0);
    for (let i = 0; i < 3; i++) { hopT(bo, X0 + 6, i * 2.6, -34 - i * 0.1, 6, 2.5, 2.4, C(i % 2 ? 0x2a6ab8 : 0xd8dde2)); }
    for (const [x, z] of [[120, -40], [130, -38], [144, -88]]) khoi(bo, "chop", x, 1.1, z, 3, 2.2, 2.6, C(0xc8a878));
    hopT(bo, 138, 0, -40, 3, 1.4, 5, C(0xe8b820)); hopT(bo, 138, 1.4, -41, 2.4, 1.6, 2.2, C(0xe8b820)); khoi(bo, "hop", 138, 3.0, -36, 0.4, 0.4, 5, C(0xd8a018), 0, 0.5);
  }
  // Chung cư mới (khối kính tông be), thêm vài tháp làm đường chân trời
  function chungCuMoi(x, z, w, d, soTang, mau) { thap({ x, z, w, d, h: soTang * 3.5, mau, mai: rnd() < 0.5 ? "heli" : "may", mauMai: 0x8a8d92 }); }

  // ---------- Biển chữ (Mesh thường, gopKhoi xếp vào atlas chung) ----------
  function bien(chu, nen, mau, phu, x, y, z, w, h, xoay) {
    const m = new THREE.Mesh(new THREE.PlaneGeometry(w, h), new THREE.MeshBasicMaterial({ map: bangChu(chu, nen, mau, phu) }));
    m.position.set(x, y + h / 2, z); m.rotation.y = xoay; nhom.add(m); return m;
  }

  // ---------- Mặt sau nhà ống có sẵn: dán mặt tường có cửa sổ nhỏ, cục nóng, ống nước ----------
  function phuMatSau(NHA) {
    for (const n of NHA) {
      const g = n.g, sau = n.sau, w = n.w, st = g.userData.cuaHang?.soTang || 3;
      if (!sau) continue;
      const hinh = g.children[0], mau = hinh?.material?.color ? hinh.material.color.clone().multiplyScalar(0.95) : C(0xe0d4b8);
      const c = Math.cos(g.rotation.y), s = Math.sin(g.rotation.y);
      const W = (lx, y, lz) => [g.position.x + lx * c + lz * s, y, g.position.z - lx * s + lz * c];
      const z = -sau - 0.05, h = st * TANG, cot = 4 + Math.floor(rnd() * 4);
      const T = B.tuong[oCua(g.position.x, g.position.z)];
      T.tu(W(w - 0.03, 0, z), W(0.03, 0, z), W(0.03, h, z), W(w - 0.03, h, z), mau, [cot / 8 + 0.003, 0, (cot + 1) / 8 - 0.003, st / 16]);
    }
  }

  // ---------- Đầu đường: rào thi công, hàng cọc, biển cấm đi bộ (khối thường để gopKhoi gộp) ----------
  function dauDuong({ x, z, truc, huong, chu, phu }) {
    // truc 'x': phố chính (chạy theo x), mép vỉa hè [30, 32.5] và [41.5, 44.5]; 'z': đại lộ, vỉa hè [44, 47] và [57, 60]
    const H2 = (w, h, d, mau, px, py, pz) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mau === "number" ? vl(mau) : mau); m.position.set(px, py + h / 2, pz); nhom.add(m); return m; };
    const dat = (a, b) => truc === "x" ? [x + huong * a, z + b] : [x + b, z + huong * a]; // a: dọc đường (ra xa), b: ngang
    const doc = truc === "x" ? [[30, 32.5], [41.5, 44.5]] : [[44, 47], [57, 60]], giua = truc === "x" ? 37 : 52;
    const tam = truc === "x" ? z : x;
    const bang = (w, h, d, mau, a, y, b) => { const [px, pz] = dat(a, b - tam); return truc === "x" ? H2(d, h, w, mau, px, y, pz) : H2(w, h, d, mau, px, y, pz); };
    // rào tôn chắn ngang vỉa hè hai bên
    for (const [b0, b1] of doc) {
      bang(b1 - b0, 2.2, 0.1, 0x2a5aa8, 0.4, 0, (b0 + b1) / 2); bang(b1 - b0, 0.3, 0.12, 0xf2f2f2, 0.4, 2.2, (b0 + b1) / 2);
      for (const b of [b0 + 0.1, b1 - 0.1]) bang(0.12, 2.6, 0.12, 0x8a8d92, 0.4, 0, b);
      const tb = new THREE.Mesh(new THREE.PlaneGeometry(b1 - b0 - 0.3, 1.0), new THREE.MeshBasicMaterial({ map: bangChu("ĐANG THI CÔNG", "#f2c21a", "#1c1c1f", "XIN LỖI VÌ SỰ BẤT TIỆN", 512, 192) }));
      const [px, pz] = dat(0.32, (b0 + b1) / 2 - tam); tb.position.set(px, 1.25, pz); tb.rotation.y = truc === "x" ? (huong > 0 ? -Math.PI / 2 : Math.PI / 2) : (huong > 0 ? Math.PI : 0); nhom.add(tb);
      // phía sau rào: vỉa hè đang đào, đống cát, gạch lát xếp chồng
      for (let k = 0; k < 3; k++) { const [qx, qz] = dat(3 + k * 5, (b0 + b1) / 2 - tam); const c = new THREE.Mesh(new THREE.ConeGeometry(1.0, 0.8, 7), vl(0xc8a878)); c.position.set(qx, 0.4, qz); nhom.add(c); }
      bang(1.0, 0.7, 1.0, 0xb98a6e, 5.5, 0, (b0 + b1) / 2);
    }
    // cọc giao thông dọc hai mép lòng đường, cổng chữ: phía trước là cầu/đoạn đường cấm người đi bộ
    for (let k = 0; k < 7; k++) for (const b of truc === "x" ? [32.75, 41.25] : [47.25, 56.75]) {
      const [px, pz] = dat(-0.2 + k * 1.6, b - tam);
      const c = new THREE.Mesh(new THREE.ConeGeometry(0.2, 0.7, 8), vl(0xe8702a)); c.position.set(px, 0.35, pz); nhom.add(c);
      const v = new THREE.Mesh(new THREE.CylinderGeometry(0.12, 0.15, 0.12, 8), vl(0xf2f2f2)); v.position.set(px, 0.45, pz); nhom.add(v);
    }
    // giá long môn bắc ngang đường
    const rong = truc === "x" ? 15 : 17;
    for (const b of [doc[0][0] + 0.4, doc[1][1] - 0.4]) bang(0.3, 6.2, 0.3, 0x8a8d92, 1.2, 0, b);
    bang(rong, 0.3, 0.3, 0x8a8d92, 1.2, 6.0, giua);
    const lm = new THREE.Mesh(new THREE.PlaneGeometry(9, 1.5), new THREE.MeshBasicMaterial({ map: bangChu(chu, "#1f4fa8", "#ffffff", phu) }));
    const [lx, lz] = dat(1.05, giua - tam); lm.position.set(lx, 5.1, lz); lm.rotation.y = truc === "x" ? (huong > 0 ? -Math.PI / 2 : Math.PI / 2) : (huong > 0 ? Math.PI : 0); nhom.add(lm);
    const bb = new THREE.Mesh(new THREE.PlaneGeometry(1.1, 1.1), new THREE.MeshBasicMaterial({ map: veTex("kpx-camdibo", 128, 128, (g) => {
      g.clearRect(0, 0, 128, 128); g.fillStyle = "#c8202a"; g.beginPath(); g.arc(64, 64, 62, 0, 7); g.fill(); g.fillStyle = "#fff"; g.beginPath(); g.arc(64, 64, 48, 0, 7); g.fill();
      g.fillStyle = "#111"; g.beginPath(); g.arc(66, 34, 8, 0, 7); g.fill(); g.lineWidth = 9; g.strokeStyle = "#111"; g.beginPath(); g.moveTo(64, 44); g.lineTo(60, 72); g.lineTo(48, 96); g.moveTo(60, 72); g.lineTo(74, 96); g.moveTo(46, 58); g.lineTo(80, 56); g.stroke();
      g.strokeStyle = "#c8202a"; g.lineWidth = 12; g.beginPath(); g.moveTo(30, 30); g.lineTo(98, 98); g.stroke();
    }), alphaTest: 0.5 }));
    for (const b of [doc[0][0] + 0.4, doc[1][1] - 0.4]) { const [px, pz] = dat(1.0, b - tam); const m = bb.clone(); m.position.set(px, 4.0, pz); m.rotation.y = lm.rotation.y; nhom.add(m); }
  }
  // Cuối Hẻm 69: nhà chắn ngang hẻm, cổng sắt, miếu thờ nhỏ, đèn lồng, giàn hoa giấy
  function cuoiHem() {
    const H2 = (w, h, d, mau, px, py, pz) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mau === "number" ? vl(mau) : mau); m.position.set(px, py + h / 2, pz); nhom.add(m); return m; };
    const z = 82.2;
    H2(4.6, 9.9, 9, 0xf2d8b0, 10, 0, z + 4.7);                    // thân nhà 3 tầng
    H2(4.6, 0.25, 0.9, 0xd8bc94, 10, 3.3, z - 0.25); H2(4.6, 0.25, 0.9, 0xd8bc94, 10, 6.6, z - 0.25); // sàn ban công
    for (const y of [3.55, 6.85]) { H2(4.4, 0.9, 0.05, 0x3a3d44, 10, y, z - 0.65); }
    for (const y of [4.0, 7.3]) { H2(1.6, 2.0, 0.05, 0x46525c, 10, y, z + 0.18); }
    H2(4.8, 0.7, 0.3, 0xe8c070, 10, 9.9, z + 0.25);
    // cổng sắt sơn đỏ hai cánh, trụ cổng
    H2(0.5, 3.0, 0.5, 0xe8dcc0, 8.15, 0, z); H2(0.5, 3.0, 0.5, 0xe8dcc0, 11.85, 0, z);
    H2(3.2, 2.4, 0.08, 0x8a1a14, 10, 0.05, z + 0.05);
    for (let i = 0; i < 9; i++) H2(0.05, 2.3, 0.05, 0x5a1010, 8.6 + i * 0.35, 0.1, z - 0.03);
    H2(3.2, 0.06, 0.06, 0x5a1010, 10, 1.2, z - 0.03); H2(3.6, 0.2, 0.6, 0x8a8d92, 10, 2.9, z - 0.15);
    // miếu thờ thiên trên trụ, nhang đèn
    H2(0.35, 1.2, 0.35, 0xc8bfae, 8.75, 0, z - 0.55);
    H2(0.8, 0.6, 0.55, 0xc0262d, 8.75, 1.2, z - 0.55); H2(0.95, 0.12, 0.7, 0xd8a838, 8.75, 1.8, z - 0.55);
    H2(0.5, 0.35, 0.05, 0xffd76a, 8.75, 1.3, z - 0.84); H2(0.03, 0.25, 0.03, 0xffb030, 8.6, 1.8, z - 0.75); H2(0.03, 0.25, 0.03, 0xffb030, 8.9, 1.8, z - 0.75);
    // đèn lồng đỏ, bảng số nhà
    for (const x of [8.15, 11.85]) { const l = new THREE.Mesh(new THREE.SphereGeometry(0.22, 8, 6), vl(0xd8262a)); l.position.set(x, 3.4, z - 0.3); nhom.add(l); }
    const so = new THREE.Mesh(new THREE.PlaneGeometry(0.6, 0.3), new THREE.MeshBasicMaterial({ map: bangChu("69/99", "#1f4fa8", "#ffffff", "", 256, 128) })); so.position.set(11.85, 2.3, z - 0.27); so.rotation.y = Math.PI; nhom.add(so);
    const ht = new THREE.Mesh(new THREE.PlaneGeometry(1.4, 0.45), new THREE.MeshBasicMaterial({ map: bangChu("HẺM CỤT", "#f2f2f2", "#c0262d", "", 512, 160) })); ht.position.set(8.0, 2.4, z - 4); ht.rotation.y = Math.PI / 2; nhom.add(ht);
    // giàn hoa giấy phủ trên cổng
    for (let i = 0; i < 9; i++) { const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.35 + rnd() * 0.25, 0), vl(i % 3 ? 0xd8357a : 0x4f8a3c)); l.position.set(8.3 + rnd() * 3.4, 3.0 + rnd() * 0.5, z - 0.2 - rnd() * 0.4); nhom.add(l); }
    for (const x of [8.6, 11.4]) { H2(0.4, 0.4, 0.4, 0xb5653a, x, 0, z - 0.7); const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.35, 0), vl(0x4f8a3c)); l.position.set(x, 0.7, z - 0.7); nhom.add(l); }
  }

  // =====================================================================================================
  return {
    thap, LOI,
    // dựng tất cả; trả về { capNhat(mt) }
    dung({ NHA = [], chungCu = [] } = {}) {
      // công trình (đăng ký vùng cấm xây trước khi rải nhà)
      truongHoc(); congVien(); chua(); nhaTho(); choKenh(); congTruong();
      chungCuMoi(130, 112, 22, 16, 13, 0xf0e2c4); chungCuMoi(86, 116, 20, 14, 11, 0xe8eef2); chungCuMoi(-128, 66, 18, 14, 12, 0xf2d8c8);
      chungCuMoi(-58, -72, 22, 14, 14, 0xe8e2d0);
      // tháp làm đường chân trời: ở giữa các ô phố ngoài lõi
      const tc = [
        [-210, -75, 24, 22, 92, "vuong", 0x9fc3e6, 0x7fd3ff], [-285, 150, 22, 22, 74, "may", 0xb8d8d0, null], [-210, 230, 20, 26, 60, "heli", 0xd8dde2, null],
        [170, -150, 26, 22, 118, "vuong", 0x8fb0d8, 0xf26fa6], [240, -75, 20, 20, 66, "heli", 0xc8d8e8, null], [235, 75, 24, 18, 84, "may", 0xd9c3a0, 0xffcf3a],
        [165, 225, 22, 22, 102, "vuong", 0xa8c8e8, 0x7fd3ff], [90, 300, 20, 20, 70, "heli", 0xe8e2d0, null], [-60, 230, 24, 20, 58, "may", 0xd0d8e0, null],
        [-130, -225, 22, 22, 80, "heli", 0x9fb8c8, null], [20, -230, 26, 20, 96, "vuong", 0xb0c8e0, 0x3fe07a], [310, 10, 22, 22, 88, "may", 0xa8b8c8, null],
        [-330, -40, 24, 24, 70, "vuong", 0xc8d0d8, null], [320, 230, 22, 22, 76, "heli", 0xb8c8d8, null], [-330, 300, 20, 20, 64, "may", 0xd8d0c0, null],
        [100, -290, 22, 22, 72, "may", 0xc0c8d0, null],
      ];
      for (const [x, z, w, d, h, mai, mau, led] of tc) thap({ x, z, w, d, h, mau, mai, led: nhe && !led ? null : led });
      // mặt sau nhà ống có sẵn, mái chung cư cũ
      phuMatSau(NHA);
      for (const [x, z, w, d, h] of chungCu) {
        const bo = bocO(x, z);
        for (let i = 0; i < 4; i++) { const a = x - w / 2 + 3 + i * (w - 6) / 3; khoi(bo, "tru6", a, h + 0.9, z + (i % 2 ? 2 : -2), 0.7, 1.6, 0.7, C(i % 3 ? 0xd5d9dd : 0x2f6fb8)); hopT(bo, a, h, z + (i % 2 ? 2 : -2), 1.6, 0.3, 1.6, C(0x8a8d92)); }
        hopT(bo, x + w * 0.3, h, z, 3, 2.8, 3, C(0xd6c9a0)); hopT(bo, x - w * 0.35, h, z, 0.06, 3.5, 0.06, C(0x555555));
        for (let i = 0; i < 3; i++) hopT(bo, x - w * 0.2 + i * 1.2, h + 1.6, z + 3, 0.5, 0.7, 0.02, C(chon([0xc0262d, 0xf6f6f2, 0x2a5aa8, 0xe9e04a])));
      }
      // ô phố theo lưới
      for (let i = 0; i < DOC.length - 1; i++) for (let j = 0; j < NGANG.length - 1; j++) {
        const xa = DOC[i], xb = DOC[i + 1], za = NGANG[j], zb = NGANG[j + 1], cx = (xa + xb) / 2, cz = (za + zb) / 2;
        const x0 = canhDoc(xa, cz)[1], x1 = canhDoc(xb, cz)[0], z0 = canhNgang(za, cx)[1], z1 = canhNgang(zb, cx)[0];
        if (dLoi(Math.max(x0, Math.min(0, x1)), Math.max(z0, Math.min(20, z1))) > RMAX) continue;
        const loai = (v, laDoc) => (laDoc ? v === 52 : v === 37) ? 2 : v === KENH ? 1 : (laDoc ? trongLoi(v, cz) : trongLoi(cx, v)) ? 0 : 1;
        oPho(x0, x1, z0, z1, loai(xa, true), loai(xb, true), loai(za, false), loai(zb, false));
      }
      // đường phụ, hẻm lớn
      for (const v of NGANG) {
        if (v === 37) continue;
        const cat = DOC.map(x => ({ x, c: canhDoc(x, v) }));
        for (let k = 0; k < cat.length - 1; k++) {
          const a = cat[k], b = cat[k + 1], s0 = a.c[1], s1 = b.c[0], m = (s0 + s1) / 2;
          if (v < MIEN.z0 || v > MIEN.z1 + 20) continue;
          const ext = q => (q.x === 52 || q.x === KENH || trongLoi(q.x, v)) ? 0 : 6;
          duong("x", v, s0, s1, !trongLoi(m, v), ext(a), ext(b));
          if (a.x === KENH && !trongLoi(m, v) && dLoi(KENH, v) < RMAX) cauQuaKenh("x", v, 12);
        }
      }
      for (const v of DOC) {
        if (v === 52 || v === KENH) continue;
        const cat = NGANG.map(z => ({ z, c: canhNgang(z, v) }));
        const ext = q => (q.z === 37 || trongLoi(v, q.z)) ? 0 : 6;
        for (let k = 0; k < cat.length - 1; k++) { const a = cat[k], b = cat[k + 1], s0 = a.c[1], s1 = b.c[0], m = (s0 + s1) / 2; duong("z", v, s0, s1, !trongLoi(v, m), ext(a), ext(b)); }
      }
      // phố chính và đại lộ nối dài (mặt đường vẽ ở thanh-pho.js): cây, cột điện, đèn xa
      for (const t of [-1, 1]) for (let x = 156; x < 470; x += 16) {
        const xx = t * x; if (xx > -184 && xx < -162) continue;
        if (dLoi(xx, 37) > RCAY + 60) continue;
        cayPho(xx + 4, 42.0, 1); cayPho(xx + 12, 32.2, 0.9); cotDien(xx, 42.1); cotDien(xx + 8, 31.9);
        den.push({ x: xx, y: 7.5, z: 40.8, kc: 2.2, mau: 0xffe0b0 }, { x: xx + 8, y: 7.5, z: 33.2, kc: 2.2, mau: 0xffe0b0 });
      }
      for (const t of [-1, 1]) for (let s = 101; s < 360; s += 16) {
        const z = t < 0 ? -s : 135 + (s - 95); if (z < MIEN.z0 || z > MIEN.z1) continue;
        cayPho(46.6, z + 6, 1); cayPho(57.4, z + 2, 1); cotDien(46.4, z); cotDien(57.6, z + 8);
        den.push({ x: 47.6, y: 7.5, z, kc: 2.2, mau: 0xffe0b0 }, { x: 56.4, y: 7.5, z: z + 8, kc: 2.2, mau: 0xffe0b0 });
      }
      // vạch kẻ trên cầu kênh, lan can cầu phố chính
      cauQuaKenh("chinh", 37.25, 14.5);
      // cao ốc
      for (const t of DS_THAP) dungThap(t);
      // đầu đường, cuối hẻm
      dauDuong({ x: -150.5, z: 37, truc: "x", huong: -1, chu: "CẦU KÊNH HÓNG ĐANG SỬA", phu: "CẤM NGƯỜI ĐI BỘ - XE ĐI CHẬM" });
      dauDuong({ x: 150.5, z: 37, truc: "x", huong: 1, chu: "THI CÔNG LÁT VỈA HÈ", phu: "NGƯỜI ĐI BỘ VUI LÒNG QUAY LẠI" });
      dauDuong({ x: 52, z: -95.5, truc: "z", huong: -1, chu: "THI CÔNG CỐNG THOÁT NƯỚC", phu: "CẤM NGƯỜI ĐI BỘ - XE ĐI CHẬM" });
      dauDuong({ x: 52, z: 135.5, truc: "z", huong: 1, chu: "THI CÔNG NGẦM HÓA CÁP ĐIỆN", phu: "NGƯỜI ĐI BỘ VUI LÒNG QUAY LẠI" });
      cuoiHem();

      // ---------- Ghép khối ----------
      const nhe2 = nhe ? 0.5 : 1;
      const tNha = texNha(false, nhe2), tNhaDen = texNha(true, nhe2), tKinh = texKinh(false, nhe2), tKinhDen = texKinh(true, nhe2);
      for (const t of [tNha, tKinh]) t.anisotropy = 4;
      // mặt tường: thêm vân vữa (pháp tuyến) lặp ~1,6 m; kính cao ốc bóng hơn (phản chiếu bầu trời khi có môi trường)
      const vlNha = matTienPBR(new THREE.MeshLambertMaterial({ map: tNha, emissiveMap: tNhaDen, emissive: 0x000000, vertexColors: true }), "vua", 24, 33, { n: 0.6 });
      const vlKinh = matTienPBR(new THREE.MeshLambertMaterial({ map: tKinh, emissiveMap: tKinhDen, emissive: 0x000000, vertexColors: true }), null, 0, 0, { roughness: 0.25 });
      if (vlKinh.isMeshStandardMaterial) vlKinh.metalness = 0.3;
      DEM.cuaSo.push(vlNha, vlKinh);
      const vlLed = new THREE.MeshBasicMaterial({ vertexColors: true }); vlLed.userData.dong = true;
      const them = (bo, vlieu, ten) => { if (bo.rong) return null; const m = new THREE.Mesh(bo.hinh(), vlieu); m.userData.rieng = true; m.name = ten; nhom.add(m); return m; };
      for (let i = 0; i < 9; i++) { them(B.tuong[i], vlNha, "kpx-tuong" + i); them(B.boc[i], MUC ? vatLieuBe("tron") : VL_MAU_DINH, "kpx-khoi" + i); them(B.kinh[i], vlKinh, "kpx-kinh" + i); }
      them(B.led, vlLed, "kpx-led");
      // mặt đất: dùng lại vật liệu đất cũ (đổi màu khi mưa) + ảnh hạt bê tông
      vlDat.map = texNen(); vlDat.vertexColors = true; vlDat.color.set(0xffffff); vlDat.needsUpdate = true;
      themChiTiet(vlDat, "be_tong", 8, 8, { n: 0.5 }); // toạ độ ảnh nền: 16 m một đơn vị → vân bê tông 2 m
      const meNen = them(B.nen, vlDat, "kpx-nen"); meNen.receiveShadow = false;
      coXa.dung(nhom);
      const diem = den.length ? taoDiemSang(den, vlDiem()) : null;
      if (diem) { diem.name = "kpx-den"; diem.visible = false; nhom.add(diem); }
      return {
        soNha: nhaDaXay.length,
        capNhat(mt) {
          const t = mt.toi || 0;
          vlLed.color.setScalar(0.3 + 0.7 * t);
          if (diem) { diem.material.uniforms.doSang.value = t; diem.visible = t > 0.02; }
        },
      };
    },
  };
}
