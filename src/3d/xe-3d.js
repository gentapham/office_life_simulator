// Mẫu xe low-poly: xe máy số, xe tay ga, ô tô, taxi, xe buýt, xe ba gác. Đầu xe hướng về +z, đáy ở y = 0.
import * as THREE from "three";
import { gopNhom } from "./nhan-vat-3d.js";
import { vlBe } from "./vat-lieu.js";
import { memBat, hinhVat, hinhLop, hinhMam, hinhOng, hinhTru } from "./hinh-mem.js";

// loại mặt theo màu (vat-lieu.js): sơn xe bóng, nhựa đen, lốp cao su, kim loại, crôm, kính; cả xe vẫn gộp một lượt vẽ
const BE_XE = { 0x1a1a1a: "nhua", 0x2a2a2a: "nhua", 0x161616: "cao_su", 0x5a5a5a: "kim", 0x9a9a9a: "crom", 0xb5b5b5: "crom", 0x24303c: "kinh", 0x1f2a33: "kinh", 0xb08a5a: "go", 0xd9c9a8: "go" };
const vx = c => vlBe(BE_XE[c] || "son_xe", c);
const hop = (g, w, h, d, c, x, y, z) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof c === "number" ? vx(c) : c); m.position.set(x, y, z); g.add(m); return m; };
const banh = (g, r, rong, x, y, z) => { const m = new THREE.Mesh(new THREE.CylinderGeometry(r, r, rong, 10), vx(0x161616)); m.rotation.z = Math.PI / 2; m.position.set(x, y, z); g.add(m); const v = new THREE.Mesh(new THREE.CylinderGeometry(r * 0.5, r * 0.5, rong + 0.01, 8), vx(0x9a9a9a)); v.rotation.z = Math.PI / 2; v.position.set(x, y, z); g.add(v); };
const den = c => { const m = new THREE.MeshBasicMaterial({ color: c }); m.userData.be = "son_bong"; return m; }; // đèn: gộp chung khối xe (như trước, có đổ sáng)
const DEN_TRUOC = den(0xfff3c4), DEN_SAU = den(0xd02020);

// vị trí đèn trước, đèn sau của từng loại xe (toạ độ của xe, đầu xe hướng +z) cho quầng sáng ban đêm
export const DEN_XE = {
  xeMay: { truoc: [[0, 1.0, 0.74]], sau: [[0, 0.82, -0.82]] },
  oto: { truoc: [[-0.62, 0.82, 2.14], [0.62, 0.82, 2.14]], sau: [[-0.62, 0.86, -2.14], [0.62, 0.86, -2.14]] },
  buyt: { truoc: [[-0.9, 0.95, 5.34], [0.9, 0.95, 5.34]], sau: [[-0.95, 1.0, -5.34], [0.95, 1.0, -5.34]], bien: [0, 2.95, 5.34] },
};
export const MAU_XE = [0xc0262d, 0x1c1c1f, 0xf2f2f2, 0x2a5aa8, 0x8a8d92, 0xe8702a, 0x2e8b57, 0x6b3fa0, 0xd9c9a8, 0x7a1424];

// ---------- Bản mềm (mọi mức trừ "Thấp"): thân bo tròn vát cạnh, bánh có lốp bo và mâm, gương có cần, tay lái ống ----------
// (localStorage owfad_hinh_mem chứa "xe": dùng lại mẫu hộp cũ để so sánh)
// mọi khối nằm trong hộp bao của khối cũ tương ứng: người lái (neo y 0,86, z −0,18) vẫn ngồi đúng yên
const vm = (g, geo, c, x, y, z, rx = 0, ry = 0, rz = 0) => { const m = new THREE.Mesh(geo, typeof c === "number" ? vx(c) : c); m.position.set(x, y, z); m.rotation.set(rx, ry, rz); g.add(m); return m; };
const hv = (g, w, h, d, r, c, x, y, z, tren = null, rx = 0) => vm(g, hinhVat(w, h, d, r, tren), c, x, y, z, rx);
// bánh: lốp cao su bo tròn + mâm; trục theo x
function banhMem(g, r, rong, x, y, z, mauMam = 0x9a9a9a, seg = 9) {
  vm(g, hinhLop(r, rong, seg), 0x161616, x, y, z);
  vm(g, hinhMam(r * 0.6, rong * 0.86, seg > 9 ? 8 : 6), mauMam, x, y, z);
}
// hộp thường (chi tiết nhỏ không cần vát)
const hb = (g, w, h, d, c, x, y, z, rx = 0) => vm(g, new THREE.BoxGeometry(w, h, d), c, x, y, z, rx);
// ống tròn qua các điểm (tay lái, cần gương, ống xả)
const ong = (g, diem, r, c, seg = 5, doan = 6) => vm(g, hinhOng(diem, r, seg, doan), c, 0, 0, 0);
// đèn tròn nhìn theo +z (hoặc -z)
const denTron = (g, r, d, m, x, y, z) => vm(g, hinhTru(r, r, d, 8), m, x, y, z, Math.PI / 2);

function xeMayMem(mau, kieu) {
  const g = new THREE.Group();
  banhMem(g, 0.28, 0.1, 0, 0.28, 0.62); banhMem(g, 0.28, 0.12, 0, 0.28, -0.62);
  if (kieu === "ga") {
    hv(g, 0.36, 0.42, 1.05, 0.13, mau, 0, 0.55, -0.1, [0.86, 0.94, 0.02]);    // thân bầu tròn
    hv(g, 0.34, 0.08, 0.7, 0.035, 0x1a1a1a, 0, 0.8, -0.25);                   // yên (mặt trên 0,84)
    hv(g, 0.32, 0.6, 0.2, 0.08, mau, 0, 0.75, 0.5, [0.8, 0.75, -0.04]);       // ốp đầu ngả về sau
    hb(g, 0.4, 0.06, 0.4, 0x2a2a2a, 0, 0.42, 0.25);                           // sàn để chân
    hb(g, 0.14, 0.05, 0.36, mau, 0, 0.6, 0.62, -0.25);                        // chắn bùn trước
  } else {
    hb(g, 0.14, 0.14, 1.0, mau, 0, 0.62, 0);                                  // khung
    hv(g, 0.3, 0.26, 0.42, 0.1, mau, 0, 0.72, -0.05, [0.82, 0.86, 0.02]);    // bình xăng / ốp yếm
    hv(g, 0.3, 0.09, 0.62, 0.04, 0x1a1a1a, 0, 0.86, -0.38);                   // yên (mặt trên 0,905)
    hv(g, 0.26, 0.22, 0.3, 0.06, 0x5a5a5a, 0, 0.42, -0.05);                   // máy
    ong(g, [[0.12, 0.34, -0.12], [0.16, 0.33, -0.3], [0.16, 0.36, -0.74]], 0.026, 0xb5b5b5, 5, 2); // ống xả
    hb(g, 0.13, 0.05, 0.42, mau, 0, 0.6, 0.66, -0.2);                         // chắn bùn trước
  }
  for (const s of [-1, 1]) vm(g, hinhTru(0.022, 0.022, 0.6, 5, true), 0x5a5a5a, s * 0.07, 0.72, 0.62); // phuộc trước hai bên bánh
  // tay lái ống cong nhẹ về phía người lái, tay nắm cao su
  ong(g, [[-0.31, 1.06, 0.46], [-0.16, 1.05, 0.5], [0.16, 1.05, 0.5], [0.31, 1.06, 0.46]], 0.018, 0x1a1a1a, 4, 3);
  hv(g, 0.16, 0.12, 0.08, 0.04, mau, 0, 1.0, 0.62);                           // đầu đèn
  denTron(g, 0.045, 0.02, DEN_TRUOC, 0, 1.0, 0.665);
  hb(g, 0.12, 0.05, 0.03, DEN_SAU, 0, 0.82, -0.75);
  for (const s of [-1, 1]) {                                                   // gương: cần mảnh + mặt gương bầu dục
    vm(g, hinhTru(0.007, 0.007, 0.14, 3, true), 0x1a1a1a, s * 0.215, 1.11, 0.49, 0, 0, -s * 0.5);
    const m = vm(g, hinhTru(0.04, 0.04, 0.02, 6), 0x9a9a9a, s * 0.24, 1.18, 0.48, Math.PI / 2); m.scale.set(1, 1, 0.75);
  }
  return gopNhom(g);
}
function otoMem(mau, taxi) {
  const g = new THREE.Group();
  for (const [x, z] of [[-0.78, 1.2], [0.78, 1.2], [-0.78, -1.25], [0.78, -1.25]]) banhMem(g, 0.33, 0.22, x, 0.33, z, 0xb5b5b5, 14);
  hv(g, 1.7, 0.62, 4.1, 0.2, mau, 0, 0.68, 0, [0.97, 0.97, 0]);                        // thân bo tròn
  // cabin thuôn lên trên, dải kính bao quanh nhô nhẹ khỏi cabin (kính trước, sau nghiêng)
  const tren = [0.84, 0.7, -0.06];
  hv(g, 1.5, 0.5, 2.1, 0.12, mau, 0, 1.24, -0.3, tren);
  const k0 = 0.12, k1 = 0.8, w0 = 1.5 * (1 - 0.16 * k0) + 0.03, w1 = 1.5 * (1 - 0.16 * k1) + 0.03, d0 = 2.1 * (1 - 0.3 * k0) + 0.03, d1 = 2.1 * (1 - 0.3 * k1) + 0.03;
  hv(g, w0, 0.5 * (k1 - k0), d0, 0.05, 0x24303c, 0, 0.99 + 0.5 * (k0 + k1) / 2, -0.3 - 0.06 * k0, [w1 / w0, d1 / d0, -0.06 * (k1 - k0)]);
  hv(g, 1.72, 0.14, 0.1, 0.05, 0x2a2a2a, 0, 0.5, 2.06); hv(g, 1.72, 0.14, 0.1, 0.05, 0x2a2a2a, 0, 0.5, -2.06);
  for (const s of [-1, 1]) {
    hv(g, 0.3, 0.12, 0.04, 0.03, DEN_TRUOC, s * 0.62, 0.82, 2.06); hv(g, 0.3, 0.12, 0.04, 0.03, DEN_SAU, s * 0.62, 0.86, -2.06);
    hv(g, 0.1, 0.07, 0.14, 0.025, mau, s * 0.79, 1.06, 0.62);                          // gương chiếu hậu
  }
  if (taxi) { hv(g, 0.5, 0.18, 0.25, 0.05, 0xf2f2f2, 0, 1.62, -0.2); hv(g, 1.72, 0.08, 4.12, 0.03, 0x2e8b57, 0, 0.7, 0); }
  return gopNhom(g);
}
function xeBuytMem() {
  const g = new THREE.Group();
  for (const [x, z] of [[-1.1, 3.3], [1.1, 3.3], [-1.1, -3.2], [1.1, -3.2]]) banhMem(g, 0.48, 0.3, x, 0.48, z, 0xd8d8d8, 14);
  hv(g, 2.5, 2.6, 10.5, 0.28, 0x2e9a4a, 0, 1.85, 0);
  hv(g, 2.52, 0.9, 9.6, 0.12, 0x1f2a33, 0, 2.3, -0.2); // dải kính
  hv(g, 2.3, 1.1, 0.06, 0.02, 0x1f2a33, 0, 2.3, 5.26);
  hv(g, 2.54, 0.4, 10.52, 0.15, 0xf2f2f2, 0, 1.2, 0);
  hv(g, 1.2, 0.35, 0.05, 0.015, den(0xffc23a), 0, 2.95, 5.27);
  for (const s of [-1, 1]) denTron(g, 0.11, 0.05, DEN_TRUOC, s * 0.9, 0.95, 5.27);
  hv(g, 2.2, 0.2, 0.05, 0.02, DEN_SAU, 0, 1.0, -5.27);
  return gopNhom(g);
}
function baGacMem(mau) {
  const g = new THREE.Group();
  banhMem(g, 0.3, 0.1, 0, 0.3, 1.2); banhMem(g, 0.3, 0.1, -0.6, 0.3, -0.5); banhMem(g, 0.3, 0.1, 0.6, 0.3, -0.5);
  hv(g, 1.4, 0.08, 1.6, 0.03, mau, 0, 0.62, -0.4); for (const s of [-1, 1]) hv(g, 0.05, 0.35, 1.6, 0.018, mau, s * 0.7, 0.8, -0.4);
  hv(g, 0.3, 0.1, 0.6, 0.04, 0x1a1a1a, 0, 0.85, 0.75); vm(g, hinhTru(0.04, 0.04, 0.6, 6), 0x5a5a5a, 0, 0.6, 1.2);
  ong(g, [[-0.3, 1.01, 1.12], [-0.15, 1.0, 1.15], [0.15, 1.0, 1.15], [0.3, 1.01, 1.12]], 0.018, 0x1a1a1a);
  for (let i = 0; i < 4; i++) hv(g, 0.5, 0.4, 0.5, 0.06, [0xb08a5a, 0xd9c9a8][i % 2], -0.3 + (i % 2) * 0.6, 0.86, -0.75 + Math.floor(i / 2) * 0.6);
  return gopNhom(g);
}

// Xe máy: kieu "so" (xe số) hoặc "ga" (tay ga)
export function taoXeMay(mau, kieu = "so") {
  if (memBat("xe")) return xeMayMem(mau, kieu);
  const g = new THREE.Group();
  banh(g, 0.28, 0.1, 0, 0.28, 0.62); banh(g, 0.28, 0.12, 0, 0.28, -0.62);
  if (kieu === "ga") {
    hop(g, 0.36, 0.42, 1.05, mau, 0, 0.55, -0.1);               // thân
    hop(g, 0.34, 0.08, 0.7, 0x1a1a1a, 0, 0.8, -0.25);           // yên
    hop(g, 0.32, 0.6, 0.2, mau, 0, 0.75, 0.5);                  // ốp đầu
    hop(g, 0.4, 0.06, 0.4, 0x2a2a2a, 0, 0.42, 0.25);            // sàn để chân
  } else {
    hop(g, 0.14, 0.14, 1.0, mau, 0, 0.62, 0);                   // khung
    hop(g, 0.3, 0.26, 0.42, mau, 0, 0.72, -0.05);               // bình xăng
    hop(g, 0.3, 0.09, 0.62, 0x1a1a1a, 0, 0.86, -0.38);          // yên
    hop(g, 0.26, 0.22, 0.3, 0x5a5a5a, 0, 0.42, -0.05);          // máy
    hop(g, 0.05, 0.05, 0.6, 0xb5b5b5, 0.16, 0.36, -0.45);       // ống xả
  }
  hop(g, 0.06, 0.6, 0.06, 0x5a5a5a, 0, 0.72, 0.62);             // phuộc trước
  hop(g, 0.62, 0.04, 0.04, 0x1a1a1a, 0, 1.05, 0.5);             // tay lái
  hop(g, 0.16, 0.12, 0.08, mau, 0, 1.0, 0.62);                  // đầu đèn
  hop(g, 0.1, 0.08, 0.02, DEN_TRUOC, 0, 1.0, 0.665);
  hop(g, 0.12, 0.05, 0.03, DEN_SAU, 0, 0.82, -0.75);
  for (const s of [-1, 1]) hop(g, 0.08, 0.02, 0.06, 0x9a9a9a, s * 0.24, 1.18, 0.48); // gương
  return gopNhom(g);
}

// Ô tô 4 chỗ (taxi có hộp đèn trên nóc và sọc)
export function taoOto(mau, { taxi = false } = {}) {
  if (memBat("xe")) return otoMem(mau, taxi);
  const g = new THREE.Group();
  for (const [x, z] of [[-0.78, 1.2], [0.78, 1.2], [-0.78, -1.25], [0.78, -1.25]]) banh(g, 0.33, 0.22, x, 0.33, z);
  hop(g, 1.7, 0.62, 4.1, mau, 0, 0.68, 0);
  hop(g, 1.5, 0.5, 2.1, mau, 0, 1.24, -0.3);
  hop(g, 1.52, 0.4, 2.0, 0x24303c, 0, 1.24, -0.3); // kính
  hop(g, 1.56, 0.06, 2.12, mau, 0, 1.5, -0.3);
  hop(g, 1.72, 0.14, 0.1, 0x2a2a2a, 0, 0.5, 2.06); hop(g, 1.72, 0.14, 0.1, 0x2a2a2a, 0, 0.5, -2.06);
  for (const s of [-1, 1]) { hop(g, 0.3, 0.12, 0.04, DEN_TRUOC, s * 0.62, 0.82, 2.06); hop(g, 0.3, 0.12, 0.04, DEN_SAU, s * 0.62, 0.86, -2.06); }
  if (taxi) { hop(g, 0.5, 0.18, 0.25, 0xf2f2f2, 0, 1.62, -0.2); hop(g, 1.72, 0.08, 4.12, 0x2e8b57, 0, 0.7, 0); }
  return gopNhom(g);
}

// Xe buýt (xanh lá, số tuyến 69)
export function taoXeBuyt() {
  if (memBat("xe")) return xeBuytMem();
  const g = new THREE.Group();
  for (const [x, z] of [[-1.1, 3.3], [1.1, 3.3], [-1.1, -3.2], [1.1, -3.2]]) banh(g, 0.48, 0.3, x, 0.48, z);
  hop(g, 2.5, 2.6, 10.5, 0x2e9a4a, 0, 1.85, 0);
  hop(g, 2.52, 0.9, 9.6, 0x1f2a33, 0, 2.3, -0.2); // dải kính
  hop(g, 2.4, 1.1, 0.06, 0x1f2a33, 0, 2.3, 5.26);
  hop(g, 2.54, 0.4, 10.52, 0xf2f2f2, 0, 1.2, 0);
  hop(g, 1.2, 0.35, 0.05, den(0xffc23a), 0, 2.95, 5.27);
  for (const s of [-1, 1]) hop(g, 0.35, 0.2, 0.05, DEN_TRUOC, s * 0.9, 0.95, 5.27);
  hop(g, 2.5, 0.2, 0.05, DEN_SAU, 0, 1.0, -5.27);
  return gopNhom(g);
}

// Xe ba gác chở hàng (đỗ hoặc chạy chậm)
export function taoBaGac(mau = 0x2a5aa8) {
  if (memBat("xe")) return baGacMem(mau);
  const g = new THREE.Group();
  banh(g, 0.3, 0.1, 0, 0.3, 1.2); banh(g, 0.3, 0.1, -0.6, 0.3, -0.5); banh(g, 0.3, 0.1, 0.6, 0.3, -0.5);
  hop(g, 1.4, 0.08, 1.6, mau, 0, 0.62, -0.4); for (const s of [-1, 1]) hop(g, 0.05, 0.35, 1.6, mau, s * 0.7, 0.8, -0.4);
  hop(g, 0.3, 0.1, 0.6, 0x1a1a1a, 0, 0.85, 0.75); hop(g, 0.12, 0.6, 0.12, 0x5a5a5a, 0, 0.6, 1.2); hop(g, 0.6, 0.04, 0.04, 0x1a1a1a, 0, 1.0, 1.15);
  for (let i = 0; i < 4; i++) hop(g, 0.5, 0.4, 0.5, [0xb08a5a, 0xd9c9a8][i % 2], -0.3 + (i % 2) * 0.6, 0.86, -0.75 + Math.floor(i / 2) * 0.6);
  return gopNhom(g);
}
