// Mẫu xe low-poly: xe máy số, xe tay ga, ô tô, taxi, xe buýt, xe ba gác. Đầu xe hướng về +z, đáy ở y = 0.
import * as THREE from "three";
import { vl, gopNhom } from "./nhan-vat-3d.js";

const hop = (g, w, h, d, c, x, y, z) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof c === "number" ? vl(c) : c); m.position.set(x, y, z); g.add(m); return m; };
const banh = (g, r, rong, x, y, z) => { const m = new THREE.Mesh(new THREE.CylinderGeometry(r, r, rong, 10), vl(0x161616)); m.rotation.z = Math.PI / 2; m.position.set(x, y, z); g.add(m); const v = new THREE.Mesh(new THREE.CylinderGeometry(r * 0.5, r * 0.5, rong + 0.01, 8), vl(0x9a9a9a)); v.rotation.z = Math.PI / 2; v.position.set(x, y, z); g.add(v); };
const den = c => new THREE.MeshBasicMaterial({ color: c });
const DEN_TRUOC = den(0xfff3c4), DEN_SAU = den(0xd02020);

export const MAU_XE = [0xc0262d, 0x1c1c1f, 0xf2f2f2, 0x2a5aa8, 0x8a8d92, 0xe8702a, 0x2e8b57, 0x6b3fa0, 0xd9c9a8, 0x7a1424];

// Xe máy: kieu "so" (xe số) hoặc "ga" (tay ga)
export function taoXeMay(mau, kieu = "so") {
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
  const g = new THREE.Group();
  banh(g, 0.3, 0.1, 0, 0.3, 1.2); banh(g, 0.3, 0.1, -0.6, 0.3, -0.5); banh(g, 0.3, 0.1, 0.6, 0.3, -0.5);
  hop(g, 1.4, 0.08, 1.6, mau, 0, 0.62, -0.4); for (const s of [-1, 1]) hop(g, 0.05, 0.35, 1.6, mau, s * 0.7, 0.8, -0.4);
  hop(g, 0.3, 0.1, 0.6, 0x1a1a1a, 0, 0.85, 0.75); hop(g, 0.12, 0.6, 0.12, 0x5a5a5a, 0, 0.6, 1.2); hop(g, 0.6, 0.04, 0.04, 0x1a1a1a, 0, 1.0, 1.15);
  for (let i = 0; i < 4; i++) hop(g, 0.5, 0.4, 0.5, [0xb08a5a, 0xd9c9a8][i % 2], -0.3 + (i % 2) * 0.6, 0.86, -0.75 + Math.floor(i / 2) * 0.6);
  return gopNhom(g);
}
