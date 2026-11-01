// Đồ cầm tay khi tương tác (ly giấy, ly trà đá, lon nước, bánh mì, hộp cơm, mì ly, tô, giấy in, bút lông, bình tưới,
// nhang, điện thoại, gậy golf, thẻ ATM, vé số, tờ tiền, đồng hồ đeo tay, đàn guitar...). Khối và vật liệu dùng chung,
// mỗi món là một nhóm nhỏ dựng một lần, ẩn / hiện khi cần. Gốc nhóm ở lòng bàn tay, trục y hướng lên.
import * as THREE from "three";

const GEO = new Map(), VL = new Map();
const geo = (k, f) => { let g = GEO.get(k); if (!g) { g = f(); GEO.set(k, g); } return g; };
const vl = (mau, sang = false) => {
  const k = mau + (sang ? "s" : "");
  let m = VL.get(k);
  if (!m) { m = sang ? new THREE.MeshBasicMaterial({ color: mau }) : new THREE.MeshLambertMaterial({ color: mau }); VL.set(k, m); }
  return m;
};
const tru = (r1, r2, h, seg = 10) => geo(`t${r1},${r2},${h},${seg}`, () => new THREE.CylinderGeometry(r1, r2, h, seg));
const hop = (w, h, d) => geo(`h${w},${h},${d}`, () => new THREE.BoxGeometry(w, h, d));
const cau = (r, s1 = 10, s2 = 8) => geo(`c${r},${s1},${s2}`, () => new THREE.SphereGeometry(r, s1, s2));
const m = (g, v, x = 0, y = 0, z = 0, rx = 0, ry = 0, rz = 0) => { const o = new THREE.Mesh(g, v); o.position.set(x, y, z); o.rotation.set(rx, ry, rz); o.userData.rieng = true; return o; };

const DUNG = {
  // ly giấy cà phê có đai cầm màu nâu
  ly: () => [m(tru(0.034, 0.027, 0.095), vl(0xf6f3ea)), m(tru(0.0345, 0.031, 0.035), vl(0x8a5a3a), 0, 0.005), m(tru(0.036, 0.036, 0.01), vl(0xe9e3d6), 0, 0.05)],
  // ly nhựa trà đá / nước mía: nước màu, đá trắng, ống hút
  ly_nhua: () => [m(tru(0.038, 0.029, 0.12), vl(0xc98a3a)), m(tru(0.036, 0.036, 0.012), vl(0xe8efe6), 0, 0.055), m(tru(0.005, 0.005, 0.17, 6), vl(0xe23a5a), 0.012, 0.09, 0, 0, 0, -0.18)],
  ly_mia: () => [m(tru(0.038, 0.029, 0.12), vl(0xd9d38a)), m(tru(0.036, 0.036, 0.012), vl(0xeef2e6), 0, 0.055), m(tru(0.005, 0.005, 0.17, 6), vl(0x2e8b57), 0.012, 0.09, 0, 0, 0, -0.18)],
  // lon nước ngọt
  lon: () => [m(tru(0.031, 0.031, 0.11, 12), vl(0xc0262d)), m(tru(0.029, 0.031, 0.008, 12), vl(0xc9ced8), 0, 0.058), m(tru(0.032, 0.032, 0.02, 12), vl(0xf6f6f2), 0, 0.0)],
  // tô hủ tiếu, chén chè (cầm ngang ngực)
  to: () => [m(tru(0.075, 0.045, 0.06, 14), vl(0xf6f6f2)), m(tru(0.068, 0.068, 0.006, 14), vl(0xd9a05a), 0, 0.026), m(hop(0.006, 0.006, 0.2), vl(0x8a6a3a), 0.02, 0.05, 0, 0.4, 0.3, 0)],
  coc_mi: () => [m(tru(0.046, 0.036, 0.09, 14), vl(0xf6f6f2)), m(tru(0.0465, 0.04, 0.025, 14), vl(0xc0262d), 0, 0.02), m(tru(0.044, 0.044, 0.005, 14), vl(0xe8c547), 0, 0.046), m(hop(0.008, 0.12, 0.004), vl(0xf6f6f2), 0.015, 0.08, 0, 0, 0, 0.2)],
  hop_com: () => [m(hop(0.17, 0.05, 0.12), vl(0xf6f6f2)), m(hop(0.172, 0.012, 0.122), vl(0x2e8b57), 0, 0.03)],
  // trái chuối / bánh mì: cầm theo cẳng tay (nhóm "tay")
};
const THEO_TAY = {
  banh_mi: () => { const a = m(cau(0.04), vl(0xd9a05a)); a.scale.set(0.75, 0.75, 2.6); const b = m(hop(0.07, 0.07, 0.1), vl(0xf2ead2), 0, 0, -0.06); return [a, b]; },
  chuoi: () => { const a = m(cau(0.03), vl(0xf2d24a)); a.scale.set(0.8, 0.8, 3.4); a.rotation.y = 0.3; return [a, m(tru(0.008, 0.008, 0.03, 6), vl(0x6b4a2f), 0.03, 0, 0.09, PI2, 0, 0)]; },
  giay: () => [m(hop(0.15, 0.003, 0.21), vl(0xfbfaf4)), m(hop(0.1, 0.004, 0.006), vl(0x8a8d92), 0, 0.001, -0.05), m(hop(0.12, 0.004, 0.006), vl(0x8a8d92), 0, 0.001, -0.03)],
  but: () => [m(tru(0.009, 0.009, 0.12, 8), vl(0x1f4fa8)), m(tru(0.009, 0.006, 0.025, 8), vl(0x1a1a1a), 0, 0.07)],
  binh_tuoi: () => [m(tru(0.06, 0.065, 0.13, 12), vl(0x2e8b57)), m(tru(0.009, 0.013, 0.2, 6), vl(0x2e8b57), 0, 0.03, 0.1, 1.0, 0, 0), m(tru(0.022, 0.012, 0.03, 8), vl(0x2a7a4a), 0, 0.1, 0.18, 1.0, 0, 0), m(hop(0.015, 0.015, 0.13), vl(0x2a7a4a), 0, 0.09, -0.04)],
  nhang: () => { const r = []; for (let i = 0; i < 3; i++) { r.push(m(tru(0.0025, 0.0025, 0.26, 4), vl(0xb03a2a), (i - 1) * 0.008, 0.09, 0)); r.push(m(tru(0.003, 0.003, 0.012, 4), vl(0xff8a3a, true), (i - 1) * 0.008, 0.226, 0)); } return r; },
  dien_thoai: () => [m(hop(0.07, 0.14, 0.009), vl(0x1a1a1a)), m(hop(0.062, 0.128, 0.002), vl(0x7fc8ff, true), 0, 0, 0.005), m(cau(0.006), vl(0x333333), -0.02, 0.055, -0.006)],
  the: () => [m(hop(0.054, 0.002, 0.085), vl(0x1f4fa8)), m(hop(0.012, 0.003, 0.012), vl(0xd8b45a), 0.012, 0.0, -0.02)],
  ve_so: () => [m(hop(0.06, 0.002, 0.13), vl(0xf5b9cf)), m(hop(0.05, 0.003, 0.02), vl(0xc0262d), 0, 0, -0.045)],
  tien: () => [m(hop(0.07, 0.002, 0.14), vl(0x6aa84f)), m(hop(0.03, 0.003, 0.03), vl(0xd9e6c8), 0, 0, 0.02)],
  gay_golf: () => [m(tru(0.007, 0.006, 0.82, 6), vl(0xb5b5b5), 0, -0.36, 0), m(hop(0.09, 0.03, 0.025), vl(0x2a2c31), 0.03, -0.77, 0), m(tru(0.012, 0.012, 0.16, 6), vl(0x1a1a1a), 0, 0.02, 0)],
  dong_ho: () => [m(geo("dhVong", () => new THREE.TorusGeometry(0.038, 0.008, 6, 14)), vl(0x2a2c31), 0, 0, 0, PI2, 0, 0), m(tru(0.018, 0.018, 0.01, 12), vl(0xd8d8d8), 0, 0.04, 0), m(tru(0.014, 0.014, 0.012, 12), vl(0x1a2a48, true), 0, 0.042, 0)],
  hop_mi: () => [m(hop(0.12, 0.03, 0.09), vl(0xe8c547)), m(hop(0.122, 0.006, 0.05), vl(0xc0262d), 0, 0.017, 0)],
  qua_cau: () => [m(tru(0.012, 0.012, 0.025, 8), vl(0xd8b45a)), ...[0, 1, 2, 3].map(i => m(hop(0.02, 0.07, 0.003), vl([0xc0262d, 0x2a5aa8, 0xe9e04a, 0x2e8b57][i]), Math.cos(i * 1.57) * 0.012, 0.045, Math.sin(i * 1.57) * 0.012, Math.sin(i * 1.57) * 0.2, 0, -Math.cos(i * 1.57) * 0.2))],
  // đàn guitar: thân gỗ, lỗ thoát âm, cần đàn (cầm ngang bụng: nhóm gắn vào thân người)
  guitar: () => {
    const g1 = m(cau(0.16, 14, 10), vl(0xb5653a)); g1.scale.set(1, 1.25, 0.32);
    const g2 = m(cau(0.13, 14, 10), vl(0xb5653a), 0, 0.2, 0); g2.scale.set(1, 1, 0.32);
    return [g1, g2, m(tru(0.045, 0.045, 0.012, 14), vl(0x2a1a10), 0, 0.12, 0.05, PI2, 0, 0), m(hop(0.05, 0.5, 0.025), vl(0x3a2a1a), 0, 0.55, 0.02), m(hop(0.07, 0.11, 0.03), vl(0x2a1a10), 0, 0.84, 0.02), m(hop(0.07, 0.015, 0.02), vl(0x2a1a10), 0, -0.07, 0.055)];
  },
};
const PI2 = Math.PI / 2;
// danh sách món: theo cẳng tay (THEO_TAY) hay luôn đứng thẳng (DUNG)
export const LA_DUNG = n => n in DUNG;
export function taoDo(ten) {
  const f = DUNG[ten] || THEO_TAY[ten]; if (!f) return null;
  const g = new THREE.Group(); g.name = "do:" + ten;
  for (const o of f()) g.add(o);
  g.visible = false; g.userData.rieng = true;
  return g;
}
