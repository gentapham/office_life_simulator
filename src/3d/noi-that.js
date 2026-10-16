// Nội thất chi tiết cho tòa nhà G-Entertainment và sân trước.
// hop(w, h, d, màu, x, yĐáy, z, { tang, can, vatLieu }) do the-gioi.js truyền vào (có xử lý vật cản).
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";

const texCache = new Map();
function tranh(key, w, h, ve) {
  if (texCache.has(key)) return texCache.get(key);
  const c = document.createElement("canvas"); c.width = w; c.height = h; ve(c.getContext("2d"), w, h);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 8; texCache.set(key, t); return t;
}
const chu = (key, w, h, nen, mau, dong, co = 40) => tranh(key, w, h, (g) => {
  g.fillStyle = nen; g.fillRect(0, 0, w, h); g.fillStyle = mau; g.textAlign = "center"; g.textBaseline = "middle";
  dong.forEach((d, i) => {
    let c = i ? co * 0.6 : co;
    const f = () => `${i ? 600 : 800} ${c}px 'Be Vietnam Pro', system-ui, sans-serif`;
    g.font = f(); while (g.measureText(d).width > w * 0.92 && c > 10) { c -= 2; g.font = f(); } // chữ tự co cho vừa khung
    g.fillText(d, w / 2, h * (i + 1) / (dong.length + 1));
  });
});

export function themNoiThat(nhom, hop, CAO, denDem) {
  const y2 = CAO, y3 = CAO * 2;
  const T = (w, h, tex, x, y, z, rotY = 0, tang = 0) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, h), new THREE.MeshLambertMaterial({ map: tex })); m.position.set(x, y, z); m.rotation.y = rotY; nhom.add(m); return m; };
  const tru = (r, h, c, x, y, z) => { const m = new THREE.Mesh(new THREE.CylinderGeometry(r, r, h, 10), vl(c)); m.position.set(x, y + h / 2, z); nhom.add(m); return m; };
  const cau = (r, c, x, y, z) => { const m = new THREE.Mesh(new THREE.IcosahedronGeometry(r, 0), vl(c)); m.position.set(x, y, z); nhom.add(m); return m; };
  const ghe = (x, z, rot, tang = 0, c = 0x3a3d44) => {
    const g = new THREE.Group(); g.position.set(x, tang * CAO, z); g.rotation.y = rot;
    const add = (w, h, d, cc, px, py, pz) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vl(cc)); m.position.set(px, py + h / 2, pz); g.add(m); };
    add(0.5, 0.06, 0.5, c, 0, 0.45, 0); add(0.5, 0.5, 0.06, c, 0, 0.5, -0.22); add(0.06, 0.45, 0.06, 0x222222, 0, 0, 0); add(0.45, 0.03, 0.06, 0x222222, 0, 0.02, 0); add(0.06, 0.03, 0.45, 0x222222, 0, 0.02, 0);
    nhom.add(g);
  };
  const tuHoSo = (x, z, rot, tang = 0) => { const g = new THREE.Group(); g.position.set(x, tang * CAO, z); g.rotation.y = rot; const m = new THREE.Mesh(new THREE.BoxGeometry(0.9, 1.3, 0.6), vl(0x9aa0a6)); m.position.y = 0.65; g.add(m); for (let i = 0; i < 3; i++) { const n = new THREE.Mesh(new THREE.BoxGeometry(0.3, 0.04, 0.02), vl(0x3a3d44)); n.position.set(0, 0.3 + i * 0.4, 0.31); g.add(n); } nhom.add(g); };
  const chauCay = (x, z, tang = 0, to = 1) => { tru(0.22 * to, 0.45 * to, 0xb5653a, x, tang * CAO, z); cau(0.42 * to, 0x4f8a3c, x, tang * CAO + 0.85 * to, z); cau(0.3 * to, 0x3d7a34, x + 0.15, tang * CAO + 1.15 * to, z - 0.1); };
  const binhCuuHoa = (x, z, tang = 0) => { tru(0.1, 0.5, 0xc0262d, x, tang * CAO + 0.05, z); };
  const dongHoTuong = (x, y, z, rotY) => T(0.5, 0.5, tranh("dhtuong", 64, 64, g => { g.fillStyle = "#fff"; g.beginPath(); g.arc(32, 32, 30, 0, 7); g.fill(); g.strokeStyle = "#222"; g.lineWidth = 3; g.stroke(); g.beginPath(); g.moveTo(32, 32); g.lineTo(32, 12); g.moveTo(32, 32); g.lineTo(46, 36); g.stroke(); }), x, y, z, rotY);
  const dieuHoa = (x, y, z, rotY) => { const g = new THREE.Group(); g.position.set(x, y, z); g.rotation.y = rotY; const m = new THREE.Mesh(new THREE.BoxGeometry(1.1, 0.32, 0.24), vl(0xf6f6f2)); g.add(m); const k = new THREE.Mesh(new THREE.BoxGeometry(0.9, 0.04, 0.02), vl(0x9aa0a6)); k.position.set(0, -0.1, 0.13); g.add(k); nhom.add(g); };

  // ===== TẦNG 1 =====
  // Sảnh: bàn thờ Thần Tài, khẩu hiệu, cây nước, tivi, ghế chờ
  hop(0.6, 0.9, 1.2, 0x8a1c1c, -1.5, 0, 10.5); hop(0.62, 0.06, 1.25, 0xd8b45a, -1.5, 0.9, 10.5, { can: false });
  hop(0.2, 0.28, 0.16, 0xd8b45a, -1.6, 0.96, 10.2, { can: false }); hop(0.2, 0.3, 0.16, 0xd8b45a, -1.6, 0.96, 10.75, { can: false });
  for (const [dz, c] of [[-0.05, 0xe8702a], [0.1, 0x6aa84f], [0.25, 0xe9e04a]]) cau(0.07, c, -1.4, 1.02, 10.45 + dz);
  tru(0.06, 0.1, 0xc9b26a, -1.4, 0.96, 10.95); { const d = new THREE.Mesh(new THREE.BoxGeometry(0.05, 0.12, 0.05), new THREE.MeshBasicMaterial({ color: 0xff3a2a })); d.position.set(-1.7, 1.1, 10.5); nhom.add(d); }
  T(5.2, 0.7, chu("khauhieu", 1024, 128, "#e8702a", "#ffffff", ["VIỆC HÔM NAY CỨ ĐỂ NGÀY MAI TÍNH"], 64), 2, 3.0, 7.95);
  hop(0.4, 1.2, 0.4, 0xe8e8e8, 8.4, 0, 4); tru(0.14, 0.4, 0x7fb8e0, 8.4, 1.2, 4);
  T(1.6, 0.9, chu("tvsanh", 320, 180, "#f26fa6", "#ffffff", ["SIÊU NHÂN HỒNG", "1.000.000 FOLLOW"], 44), 8.84, 2.0, 9, -Math.PI / 2);
  for (let i = 0; i < 3; i++) ghe(-0.7 + i * 0.6, 4.2, Math.PI / 2 * 0, 0, 0x5b6b8c);
  T(1.2, 1.6, chu("poster1", 240, 320, "#1c1c1f", "#f26fa6", ["ĐẠI NHẠC HỘI", "SIÊU NHÂN", "31.10"], 46), 8.84, 1.9, 12.5, -Math.PI / 2);
  dongHoTuong(2, 3.2, -1.95, 0);
  chauCay(-1.2, 1, 0, 1.2); chauCay(8.4, 7.6, 0);
  // Khu làm việc chung: tủ hồ sơ, máy in, cây nước, điều hòa, bảng tiến độ
  for (let i = 0; i < 4; i++) tuHoSo(-19.5, 10.3 + i * 0.95, Math.PI / 2);
  hop(1.1, 0.9, 0.7, 0xd9d9d9, -3.2, 0, 12.6); hop(0.9, 0.2, 0.5, 0x3a3d44, -3.2, 0.9, 12.6, { can: false });
  hop(0.4, 1.2, 0.4, 0xe8e8e8, -3.2, 0, -0.9); tru(0.14, 0.4, 0x7fb8e0, -3.2, 1.2, -0.9);
  dieuHoa(-19.75, 2.9, 4, Math.PI / 2); dieuHoa(-19.75, 2.9, 10, Math.PI / 2);
  T(2.6, 1.4, tranh("tiendo", 520, 280, (g, w, h) => {
    g.fillStyle = "#fafafa"; g.fillRect(0, 0, w, h); g.fillStyle = "#222"; g.font = "800 34px 'Be Vietnam Pro', system-ui"; g.fillText("MỤC TIÊU: 1.000.000 FOLLOW", 24, 50);
    g.strokeStyle = "#222"; g.lineWidth = 4; g.strokeRect(24, 90, 470, 50); g.fillStyle = "#f26fa6"; g.fillRect(26, 92, 120, 46);
    g.fillStyle = "#c0262d"; g.font = "600 24px system-ui"; g.fillText("Hạn chót: 31/10 - Đại Nhạc Hội Siêu Nhân", 24, 190); g.fillText("Ai làm biếng: trừ lương (đùa thôi)", 24, 230);
  }), -11, 1.6, 13.84, Math.PI);
  T(1, 0.7, chu("lich", 200, 140, "#ffffff", "#c0262d", ["THÁNG 10", "2026"], 42), -19.84, 1.9, 1.5, Math.PI / 2);
  for (let i = 0; i < 4; i++) { tru(0.17, 0.4, 0x2e8b57, -16.5 + i * 3, 0, 4.5); }
  // giá treo mũ bảo hiểm
  hop(0.08, 1.7, 0.08, 0x5a3d2a, -19.4, 0, -1.3);
  for (const [dy, c] of [[1.6, 0xc0262d], [1.4, 0xf6f6f2], [1.2, 0x2a5aa8]]) { const m = new THREE.Mesh(new THREE.SphereGeometry(0.15, 8, 5, 0, 7, 0, 1.6), vl(c)); m.position.set(-19.25, dy, -1.3); nhom.add(m); }
  // Pantry: ghế quanh bàn, lò vi sóng, ấm, mì ly, rổ trái cây, bồn rửa
  for (const [x, z] of [[12, 6], [16, 6]]) { ghe(x - 0.7, z + 0.9, Math.PI, 0, 0xe8702a); ghe(x + 0.7, z + 0.9, Math.PI, 0, 0xe8702a); ghe(x - 0.7, z - 0.9, 0, 0, 0xe8702a); ghe(x + 0.7, z - 0.9, 0, 0, 0xe8702a); cau(0.12, 0xe9e04a, x, 0.85, z); cau(0.1, 0x6aa84f, x + 0.2, 0.85, z + 0.1); }
  hop(0.6, 0.35, 0.4, 0xf2f2f2, 14.5, 0.95, 13.1, { can: false }); hop(0.4, 0.25, 0.02, 0x222222, 14.4, 1.0, 12.89, { can: false });
  tru(0.1, 0.22, 0xb5b5b5, 16, 0.95, 13.1);
  for (let i = 0; i < 5; i++) tru(0.06, 0.1, 0xf6f6f2, 17 + (i % 3) * 0.14, 0.95 + Math.floor(i / 3) * 0.1, 13.1);
  hop(0.9, 0.05, 0.6, 0x9aa0a6, 11.2, 0.95, 13, { can: false });
  T(0.8, 1.1, chu("menu", 160, 220, "#2a2c31", "#ffe14d", ["MÌ LY", "0đ", "(ăn cắp)"], 34), 19.84, 1.6, 9, -Math.PI / 2);
  // Kế toán: két sắt, giấy tờ, máy tính tiền
  hop(0.8, 1.0, 0.7, 0x2a2c31, -11.2, 0, -13.2); hop(0.12, 0.12, 0.02, 0xc9b26a, -11.2, 0.55, -12.84, { can: false });
  for (let i = 0; i < 3; i++) hop(0.32, 0.12 + i * 0.05, 0.24, 0xf6f6f2, -16 + i * 0.4, 0.75, -10.3, { can: false });
  ghe(-15, -11.4, 0); tuHoSo(-12.5, -6.6, Math.PI);
  // HR: ghế khách, ấm trà, tủ hồ sơ, tranh động lực
  ghe(-7.4, -9.5, Math.PI, 0, 0x6aa89a); ghe(-4.6, -9.5, Math.PI, 0, 0x6aa89a); ghe(-6, -11.5, 0);
  tru(0.09, 0.14, 0xf6f6f2, -5.4, 0.75, -10.4); tru(0.04, 0.06, 0xf6f6f2, -5.1, 0.75, -10.3);
  tuHoSo(-2.6, -12.5, -Math.PI / 2);
  T(1.2, 0.8, chu("hr", 240, 160, "#a8e6cf", "#1c1c1f", ["CÔNG TY LÀ", "GIA ĐÌNH"], 40), -9.84, 1.8, -10, Math.PI / 2);
  // Server: quạt, bàn nhỏ, mì ly, dây cáp
  hop(0.9, 0.7, 0.6, 0x8a6a4a, 3, 0, -7.2); tru(0.06, 0.1, 0xf6f6f2, 3, 0.7, -7.2); hop(0.5, 0.03, 0.35, 0x222222, 2.7, 0.7, -7.2, { can: false });
  tru(0.04, 1.1, 0x3a3d44, -1.3, 0, -7.4); { const q = new THREE.Mesh(new THREE.CylinderGeometry(0.3, 0.3, 0.08, 12), vl(0x9fd3f2)); q.rotation.x = Math.PI / 2; q.position.set(-1.3, 1.2, -7.4); nhom.add(q); }
  for (let i = 0; i < 4; i++) hop(0.03, 0.03, 3, [0x2a5aa8, 0xc0262d, 0xe9e04a, 0x2e8b57][i], -1 + i * 0.4, 0.01, -10.5, { can: false });
  // Kho sự kiện: bí ngô Halloween, bóng bay hồng, giá đồ diễn, loa, bộ đồ Siêu Nhân Hồng dự phòng
  for (let i = 0; i < 5; i++) { const b = cau(0.25, 0xe8702a, 5 + i * 0.55, 0.25, -7.2); b.scale.y = 0.75; }
  for (let i = 0; i < 6; i++) { cau(0.2, 0xf26fa6, 10.6 + (i % 3) * 0.4, 2.3 + (i % 2) * 0.3, -7 - Math.floor(i / 3) * 0.4); }
  hop(0.05, 1.8, 0.05, 0x9a9a9a, 11.3, 0, -9.5); hop(0.05, 1.8, 0.05, 0x9a9a9a, 11.3, 0, -11.5); hop(0.05, 0.05, 2, 0x9a9a9a, 11.3, 1.8, -10.5, { can: false });
  hop(0.4, 1.2, 0.3, 0xf26fa6, 11.3, 0.5, -10.2, { can: false }); hop(0.4, 1.2, 0.3, 0x111111, 11.3, 0.5, -10.9, { can: false });
  hop(0.6, 1.0, 0.5, 0x1a1a1a, 5, 0, -12.6); hop(0.6, 1.0, 0.5, 0x1a1a1a, 5, 0, -11.9);
  // Toilet: gương, máy sấy tay, biển WC
  T(3, 0.9, tranh("guong", 32, 32, g => { g.fillStyle = "#cfe3ee"; g.fillRect(0, 0, 32, 32); g.fillStyle = "#fff"; g.fillRect(4, 4, 6, 24); }), 16, 1.7, -6.32, Math.PI);
  T(0.6, 0.4, chu("wc", 120, 80, "#1f4fa8", "#ffffff", ["WC"], 48), 16, 2.6, -5.86, 0);
  // Hành lang tầng 1: bảng tin, bình cứu hỏa
  T(2.2, 1.2, tranh("bangtin", 440, 240, (g, w, h) => {
    g.fillStyle = "#b08a5a"; g.fillRect(0, 0, w, h);
    [["THÔNG BÁO", "Lương về trễ 2 ngày"], ["TEAM BUILDING", "Vũng Tàu 17-18/10"], ["CẤM", "Hâm cá trong lò vi sóng"]].forEach(([a, b], i) => {
      g.fillStyle = ["#fff7a8", "#ffffff", "#ffd3e0"][i]; g.save(); g.translate(20 + i * 140, 30 + (i % 2) * 20); g.rotate((i - 1) * 0.06); g.fillRect(0, 0, 125, 150);
      g.fillStyle = "#c0262d"; g.font = "800 17px system-ui"; g.fillText(a, 8, 30); g.fillStyle = "#222"; g.font = "15px system-ui"; b.split(" ").reduce((y, wd, k, arr) => { g.fillText(arr.slice(k * 3, k * 3 + 3).join(" "), 8, 60 + k * 22); return y; }, 0); g.restore();
    });
  }), -12, 1.7, -5.86, 0);
  binhCuuHoa(-19.5, -5.5); binhCuuHoa(19.5, -2.5);

  // ===== TẦNG 2 =====
  // Giám đốc: cúp, tranh ngựa, golf mini, bàn trà, bonsai
  for (let i = 0; i < 4; i++) hop(0.18, 0.35, 0.18, 0xd8b45a, -15.5 + i * 0.9, y2 + 1.6, -13.45, { can: false, tang: 1 });
  T(2.2, 1.2, tranh("ngua", 440, 240, (g, w, h) => { g.fillStyle = "#f2e6c8"; g.fillRect(0, 0, w, h); g.fillStyle = "#5a3d2a"; for (let i = 0; i < 8; i++) { g.save(); g.translate(40 + i * 50, 140 - (i % 3) * 15); g.fillRect(0, 0, 40, 18); g.fillRect(30, -18, 10, 20); g.fillRect(4, 16, 4, 22); g.fillRect(30, 16, 4, 22); g.restore(); } g.fillStyle = "#c0262d"; g.font = "800 28px serif"; g.fillText("MÃ ĐÁO THÀNH CÔNG", 90, 40); }), -19.84, y2 + 1.9, -9, Math.PI / 2);
  hop(1.6, 0.02, 0.6, 0x2e8b57, -10.5, y2, -6.4, { can: false, tang: 1 }); hop(0.03, 0.8, 0.03, 0xb5b5b5, -10.2, y2, -6.4, { can: false, tang: 1 });
  hop(1.2, 0.45, 0.7, 0x5a3d2a, -17.6, y2, -8.2, { tang: 1 }); tru(0.08, 0.12, 0xf6f6f2, -17.4, y2 + 0.45, -8.2);
  chauCay(-9, -13, 1, 1.1);
  // Phó giám đốc: biển "ghế trống"
  T(0.8, 0.3, chu("ghetrong", 240, 90, "#ffffff", "#c0262d", ["GHẾ TRỐNG"], 46), -4, y2 + 0.95, -9.98, 0);
  chauCay(-1, -13, 1);
  // Phòng họp: tivi, chai nước, laptop
  hop(2.2, 1.3, 0.08, 0x111111, 11.8, y2 + 1, -9, { can: false, tang: 1 }).rotation.y = Math.PI / 2;
  for (let i = 0; i < 6; i++) tru(0.04, 0.2, 0x7fb8e0, 3.4 + i * 1.1, y2 + 0.75, -8.6 + (i % 2) * -0.8);
  hop(0.4, 0.02, 0.3, 0x2a2c31, 6, y2 + 0.75, -8.8, { can: false, tang: 1 });
  chauCay(1, -13, 1);
  // Phòng nghệ sĩ: gương có bóng đèn, giá đồ diễn, đàn guitar, poster Phát 2015
  for (let i = 0; i < 8; i++) { const b = new THREE.Mesh(new THREE.SphereGeometry(0.05, 6, 4), new THREE.MeshBasicMaterial({ color: 0xfff1c8 })); b.position.set(19.75, y2 + 0.4 + (i < 4 ? i * 0.5 : 2.0), -9.75 + (i < 4 ? 0 : (i - 4) * 0.5)); nhom.add(b); }
  T(1, 1.4, chu("phat2015", 200, 280, "#3a1d5a", "#ffd166", ["PHÁT", "CÔNG VIÊN", "2015"], 40), 12.16, y2 + 1.8, -8, Math.PI / 2);
  hop(0.05, 1.6, 1.6, 0x9a9a9a, 14, y2, -6, { can: false, tang: 1 });
  { const gt = new THREE.Mesh(new THREE.BoxGeometry(0.35, 0.5, 0.1), vl(0xb5653a)); gt.position.set(18.5, y2 + 0.4, -13.5); nhom.add(gt); hop(0.06, 0.6, 0.04, 0x3a2a1a, 18.5, y2 + 0.6, -13.5, { can: false, tang: 1 }); }
  // Hành lang tầng 2: ghế chờ, cây, ảnh kỷ niệm
  for (let i = 0; i < 4; i++) T(0.8, 0.6, chu("anh" + i, 160, 120, ["#f2e6c8", "#d9e6f2", "#ffd3e0", "#e6f2d9"][i], "#333", [["2010", "2015", "2020", "2026"][i], "G-ENT"], 36), 8 + i * 2.5, y2 + 1.8, -3.86, 0);
  ghe(16, 0.5, Math.PI, 1); ghe(16.7, 0.5, Math.PI, 1); chauCay(19, -3, 1); binhCuuHoa(-19.5, -3.5, 1);
  // Studio: đèn softbox, micro boom, trái tim hồng
  for (const x of [-16, -10]) { hop(0.06, 1.6, 0.06, 0x222222, x, y2, 9, { can: false, tang: 1 }); const sb = new THREE.Mesh(new THREE.BoxGeometry(0.8, 0.6, 0.3), new THREE.MeshBasicMaterial({ color: 0xfaf6ee })); sb.position.set(x, y2 + 1.9, 9); sb.lookAt(-13, y2 + 1.5, 12); nhom.add(sb); }
  hop(0.04, 0.04, 2, 0x222222, -14, y2 + 2.6, 11, { can: false, tang: 1 });
  { const tim = new THREE.Mesh(new THREE.SphereGeometry(0.6, 8, 6), vl(0xf26fa6)); tim.scale.set(1.3, 1, 0.4); tim.position.set(-17.5, y2 + 1.4, 13.4); nhom.add(tim); }
  // Dựng phim: rèm tối, loa, bean bag, cốc cà phê
  T(7.5, 3.4, tranh("rem", 16, 16, g => { g.fillStyle = "#1f2a3d"; g.fillRect(0, 0, 16, 16); g.fillStyle = "#18202e"; g.fillRect(0, 0, 4, 16); g.fillRect(8, 0, 4, 16); }), -2, y2 + 1.7, 13.84, Math.PI);
  hop(0.3, 0.5, 0.3, 0x111111, -3.8, y2 + 0.75, 11.4, { can: false, tang: 1 }); hop(0.3, 0.5, 0.3, 0x111111, -0.2, y2 + 0.75, 11.4, { can: false, tang: 1 });
  { const bb = new THREE.Mesh(new THREE.IcosahedronGeometry(0.5, 1), vl(0xe8702a)); bb.scale.y = 0.6; bb.position.set(-4.6, y2 + 0.3, 5); nhom.add(bb); }
  for (let i = 0; i < 4; i++) tru(0.05, 0.12, 0xf6f6f2, -3 + i * 0.3, y2 + 0.75, 10.9);
  // Sản xuất: kệ hồ sơ, lịch họp
  for (let i = 0; i < 3; i++) { hop(1.8, 0.04, 0.4, 0x8a6a4a, 18.6, y2 + 0.5 + i * 0.6, 3, { can: false, tang: 1 }); for (let k = 0; k < 6; k++) hop(0.08, 0.45, 0.3, [0xc0262d, 0x2a5aa8, 0xe9e04a, 0x2e8b57][k % 4], 17.9 + k * 0.25, y2 + 0.54 + i * 0.6, 3, { can: false, tang: 1 }); }
  hop(1.8, 1.8, 0.4, 0x6b4a2f, 18.6, y2, 3.05, { tang: 1 }).visible = false;
  T(1.8, 1.1, chu("lichhop", 360, 220, "#ffffff", "#1c1c1f", ["LỊCH HỌP TUẦN NÀY", "Họp - Họp - Họp - Họp"], 34), 12, y2 + 1.8, 13.84, Math.PI);

  // ===== SÂN THƯỢNG =====
  for (const x of [-15, -11]) { tru(0.7, 1.6, 0xd5d9dd, x, y3 + 0.6, 10); hop(1.6, 0.6, 1.6, 0x8a8d92, x, y3, 10, { tang: 2 }); }
  hop(10, 0.03, 0.03, 0x666666, -4, y3 + 1.8, -6, { can: false, tang: 2 });
  for (let i = 0; i < 9; i++) hop(0.5, 0.6 + (i % 3) * 0.15, 0.02, [0xc0262d, 0xf6f6f2, 0x2a5aa8, 0xe9e04a, 0xf5b9cf, 0x2e8b57][i % 6], -8.5 + i * 1.05, y3 + 1.15, -6, { can: false, tang: 2 });
  for (const x of [-9, -3]) hop(0.05, 1.8, 0.05, 0x666666, x, y3, -6, { tang: 2 });
  for (let i = 0; i < 6; i++) chauCay(12 + (i % 3) * 1.4, -12 + Math.floor(i / 3) * 1.4, 2, 0.9);
  for (const [x, z] of [[-2, 6], [-1, 6.6], [-3, 6.6]]) { ghe(x, z, Math.PI, 2, 0xc0262d); }
  { const ch = new THREE.Mesh(new THREE.SphereGeometry(0.6, 10, 6, 0, Math.PI * 2, 0, Math.PI / 2.5), vl(0xe6e6e6, { side: THREE.DoubleSide })); ch.rotation.x = -1.1; ch.position.set(17, y3 + 1.6, 12); nhom.add(ch); hop(0.06, 1.3, 0.06, 0x666666, 17, y3, 12, { tang: 2 }); }

  // ===== SÂN TRƯỚC =====
  // biển tên công ty đứng ngoài hàng rào, mặt nhìn ra phố, hai chân trụ phía sau biển (không che chữ)
  T(2.6, 0.95, chu("biencong", 1040, 380, "#2a2c31", "#e8702a", ["G-ENTERTAINMENT", "Thành lập 20/10/2010"], 110), -2.4, 2.25, 30.86, 0);
  hop(2.75, 1.08, 0.12, 0x1c1c1f, -2.4, 1.71, 30.77, { can: false });
  for (const x of [-3.5, -1.3]) hop(0.14, 1.75, 0.14, 0x8a8d92, x, 0, 30.62, { can: true });
  for (const [x, z] of [[-14, 16], [16, 16], [-20, 27], [20, 27]]) { hop(3, 0.45, 1.2, 0xb5a58a, x, 0, z); for (let i = 0; i < 4; i++) cau(0.3, [0xf26fa6, 0xe9e04a, 0xc0262d, 0xf6f6f2][i], x - 1 + i * 0.65, 0.65, z); }
  hop(0.12, 1.1, 0.12, 0xe8702a, 5.5, 0, 29.3); { const tb = new THREE.Mesh(new THREE.BoxGeometry(0.08, 0.08, 3.6), vl(0xf2f2f2)); tb.position.set(5.5, 1.2, 27.7); tb.rotation.x = -1.2; nhom.add(tb); }
}
