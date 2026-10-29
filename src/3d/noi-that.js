// Nội thất chi tiết cho tòa nhà G-Entertainment và sân trước.
// hop(w, h, d, màu, x, yĐáy, z, { tang, can, vatLieu }) do the-gioi.js truyền vào (có xử lý vật cản).
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";
import { Reflector } from "three/addons/objects/Reflector.js";
import { MUC, vlBe } from "./vat-lieu.js";
import { memBat, cucTan, dungChauCay, hinhVat, MAU_TAN } from "./hinh-mem.js";

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
  // tranh, biển dán tường: nhích thêm 2 cm khỏi tường và luôn vẽ đè lên lớp sơn (không bị che khi nhìn xiên dọc hành lang)
  const T = (w, h, tex, x, y, z, rotY = 0, tang = 0) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, h), new THREE.MeshLambertMaterial({ map: tex, polygonOffset: true, polygonOffsetFactor: -2, polygonOffsetUnits: -6 })); m.position.set(x + Math.sin(rotY) * 0.02, y, z + Math.cos(rotY) * 0.02); m.rotation.y = rotY; nhom.add(m); return m; };
  const tru = (r, h, c, x, y, z) => { const m = new THREE.Mesh(new THREE.CylinderGeometry(r, r, h, 10), vl(c)); m.position.set(x, y + h / 2, z); nhom.add(m); return m; };
  const MEM = memBat("cau");
  // cục tròn (lá cây, trái cây, bóng bay): bản mềm là cục méo tô đậm nhạt, bọc trong nhóm để .scale như cũ
  const cau = (r, c, x, y, z) => {
    if (MEM) { const g = new THREE.Group(); g.position.set(x, y, z); g.add(cucTan(r, MAU_TAN[c] || c, 0, 0, 0, { bien: Math.floor(Math.abs(x * 13 + z * 7)), chiTiet: r >= 0.3 ? 1 : 0 })); nhom.add(g); return g; }
    const m = new THREE.Mesh(new THREE.IcosahedronGeometry(r, 0), vl(c)); m.position.set(x, y, z); nhom.add(m); return m;
  };
  const ghe = (x, z, rot, tang = 0, c = 0x3a3d44) => {
    const g = new THREE.Group(); g.position.set(x, tang * CAO, z); g.rotation.y = rot;
    const add = (w, h, d, cc, px, py, pz, be) => { const m = new THREE.Mesh(MEM && Math.min(w, h, d) >= 0.05 ? hinhVat(w, h, d, Math.min(w, h, d) * 0.3) : new THREE.BoxGeometry(w, h, d), be ? vlBe(be, cc) : vl(cc)); m.position.set(px, py + h / 2, pz); g.add(m); };
    add(0.5, 0.06, 0.5, c, 0, 0.45, 0, "vai"); add(0.5, 0.5, 0.06, c, 0, 0.5, -0.22, "vai"); add(0.06, 0.45, 0.06, 0x222222, 0, 0, 0); add(0.45, 0.03, 0.06, 0x222222, 0, 0.02, 0); add(0.06, 0.03, 0.45, 0x222222, 0, 0.02, 0);
    nhom.add(g);
  };
  const tuHoSo = (x, z, rot, tang = 0) => { const g = new THREE.Group(); g.position.set(x, tang * CAO, z); g.rotation.y = rot; const m = new THREE.Mesh(new THREE.BoxGeometry(0.9, 1.3, 0.6), vlBe("kim", 0x9aa0a6)); m.position.y = 0.65; g.add(m); for (let i = 0; i < 3; i++) { const n = new THREE.Mesh(new THREE.BoxGeometry(0.3, 0.04, 0.02), vl(0x3a3d44)); n.position.set(0, 0.3 + i * 0.4, 0.31); g.add(n); } nhom.add(g); };
  const chauCay = (x, z, tang = 0, to = 1) => {
    if (MEM) { // chậu miệng loe có viền, bụi lá tròn tô đậm nhạt (cùng chỗ, cùng cỡ chậu và tán cũ)
      const g = new THREE.Group(); nhom.add(g);
      dungChauCay(g, x, tang * CAO, z, { rTren: 0.22 * to, rDuoi: 0.22 * to * 0.78, cao: 0.45 * to, mauChau: 0xb5653a, rLa: 0.42 * to, yLa: 0.85 * to, mauLa: 0x5a8c4c, hat: Math.abs(x * 0.37 + z * 0.13) % 1 });
      g.add(cucTan(0.3 * to, 0x3f7a4c, x + 0.15, tang * CAO + 1.15 * to, z - 0.1, { bien: 3, chiTiet: 0 }));
      return;
    }
    tru(0.22 * to, 0.45 * to, 0xb5653a, x, tang * CAO, z); cau(0.42 * to, 0x4f8a3c, x, tang * CAO + 0.85 * to, z); cau(0.3 * to, 0x3d7a34, x + 0.15, tang * CAO + 1.15 * to, z - 0.1);
  };
  // bình chữa cháy đứng sát sàn: thân đỏ, nhãn trắng, cổ van, tay bóp, vòi
  const binhCuuHoa = (x, z, tang = 0) => { const y = tang * CAO; tru(0.085, 0.42, 0xc0262d, x, y, z); tru(0.087, 0.12, 0xf2f2f2, x, y + 0.12, z); tru(0.045, 0.05, 0xc0262d, x, y + 0.42, z); tru(0.022, 0.07, 0x2a2c31, x, y + 0.47, z); hop(0.15, 0.015, 0.03, 0x2a2c31, x + 0.04, y + 0.53, z, { can: false }); hop(0.016, 0.34, 0.016, 0x1a1a1a, x + 0.1, y + 0.17, z, { can: false }); };
  const dongHoTuong = (x, y, z, rotY) => T(0.5, 0.5, tranh("dhtuong", 64, 64, g => { g.fillStyle = "#fff"; g.beginPath(); g.arc(32, 32, 30, 0, 7); g.fill(); g.strokeStyle = "#222"; g.lineWidth = 3; g.stroke(); g.beginPath(); g.moveTo(32, 32); g.lineTo(32, 12); g.moveTo(32, 32); g.lineTo(46, 36); g.stroke(); }), x, y, z, rotY);
  const dieuHoa = (x, y, z, rotY) => { const g = new THREE.Group(); g.position.set(x, y, z); g.rotation.y = rotY; const m = new THREE.Mesh(new THREE.BoxGeometry(1.1, 0.32, 0.24), vl(0xf6f6f2)); g.add(m); const k = new THREE.Mesh(new THREE.BoxGeometry(0.9, 0.04, 0.02), vl(0x9aa0a6)); k.position.set(0, -0.1, 0.13); g.add(k); nhom.add(g); };

  // ===== TẦNG 1 =====
  // ---------- Nhà vệ sinh chi tiết ----------
  function nhaVeSinh() {
    const X1 = 12.13, X2 = 19.87, Z1 = -13.87, Z2 = -6.13;
    const gach = (key, nen, vien, lap) => { const t = tranh(key, 64, 64, g => { g.fillStyle = nen; g.fillRect(0, 0, 64, 64); g.fillStyle = vien; g.fillRect(0, 0, 64, 3); g.fillRect(0, 0, 3, 64); }).clone(); t.wrapS = t.wrapT = THREE.RepeatWrapping; t.repeat.set(...lap); t.needsUpdate = true; return t; };
    // sàn gạch men, tường ốp gạch cao 1,6 m
    // máy khá: gạch men thật (vat-lieu.js) — sàn lát chéo, tường ốp gạch 60 cm; máy yếu giữ ảnh vẽ cũ
    const san = new THREE.Mesh(new THREE.PlaneGeometry(X2 - X1, Z2 - Z1), MUC ? vlBe("gach_vs", 0xe4eaee) : new THREE.MeshLambertMaterial({ map: gach("gachsan", "#e9eef1", "#b9c6cf", [13, 13]) }));
    san.rotation.x = -Math.PI / 2; san.position.set((X1 + X2) / 2, 0.012, (Z1 + Z2) / 2); nhom.add(san);
    const op = (w, x, z, rotY) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, 1.6), MUC ? vlBe("gach_men", 0xcfe6f2) : new THREE.MeshLambertMaterial({ map: gach("gachtuong" + w, "#cfe6f2", "#9fc3d6", [w / 0.3, 1.6 / 0.3]) })); m.position.set(x, 0.8, z); m.rotation.y = rotY; nhom.add(m); };
    op(Z2 - Z1, X1 + 0.01, (Z1 + Z2) / 2, Math.PI / 2); op(Z2 - Z1, X2 - 0.01, (Z1 + Z2) / 2, -Math.PI / 2); op(X2 - X1, (X1 + X2) / 2, Z1 + 0.01, 0);
    hop(X2 - X1, 0.06, 0.03, 0x7fa8c9, (X1 + X2) / 2, 1.6, Z1 + 0.02, { can: false }); // nẹp viền gạch
    // ba buồng vệ sinh dọc tường sau
    const TRANG = 0xf6f6f2, VACH = 0x6f9cc0, ZT = -12.15;
    const xs = [14.5, 16.29, 18.08, X2];
    for (const x of xs.slice(0, 3)) hop(0.07, 2.0, ZT - Z1, VACH, x, 0.12, (Z1 + ZT) / 2);
    for (let i = 0; i < 3; i++) {
      const a = xs[i], b = xs[i + 1], giua = (a + b) / 2;
      // vách trước hai bên cửa, thanh ngang trên
      hop(0.42, 2.0, 0.07, VACH, a + 0.21, 0.12, ZT); hop(0.42, 2.0, 0.07, VACH, b - 0.21, 0.12, ZT);
      hop(b - a, 0.08, 0.08, 0x9a9a9a, giua, 2.12, ZT, { can: false });
      // cánh cửa mở hé vào trong, có chốt và biển trống/có người
      const cua = new THREE.Group(); cua.position.set(a + 0.42, 0.12, ZT); cua.rotation.y = -1.15; cua.userData.khongCan = true;
      const la = new THREE.Mesh(new THREE.BoxGeometry(b - a - 0.84, 1.95, 0.05), vl(0x5f8fb6)); la.position.set((b - a - 0.84) / 2, 0.975, 0); cua.add(la);
      const chot = new THREE.Mesh(new THREE.BoxGeometry(0.08, 0.04, 0.06), vl(0xc0c4c8)); chot.position.set(b - a - 0.92, 1.0, 0.04); cua.add(chot);
      const bien = new THREE.Mesh(new THREE.PlaneGeometry(0.18, 0.08), new THREE.MeshBasicMaterial({ map: chu("trong", 90, 40, "#2e8b57", "#ffffff", ["TRỐNG"], 26) })); bien.position.set(b - a - 0.92, 1.1, 0.03); cua.add(bien);
      nhom.add(cua);
      // bồn cầu: chân, bệ, nắp dựng, két nước, nút xả
      hop(0.34, 0.38, 0.46, TRANG, giua, 0, -13.35); hop(0.42, 0.06, 0.54, TRANG, giua, 0.38, -13.33, { can: false });
      hop(0.3, 0.02, 0.36, 0xd4e6ee, giua, 0.441, -13.3, { can: false });
      hop(0.4, 0.46, 0.04, TRANG, giua, 0.44, -13.62, { can: false }); hop(0.46, 0.42, 0.2, TRANG, giua, 0.46, -13.74, { can: false });
      hop(0.08, 0.02, 0.08, 0xc0c4c8, giua, 0.88, -13.74, { can: false });
      // giấy vệ sinh, thùng rác nhỏ
      const cuon = new THREE.Mesh(new THREE.CylinderGeometry(0.06, 0.06, 0.11, 10), vl(0xffffff)); cuon.rotation.z = Math.PI / 2; cuon.position.set(a + 0.13, 0.75, -13.0); nhom.add(cuon);
      tru(0.11, 0.28, 0xb5bcc2, b - 0.2, 0, -13.6);
    }
    // bồn tiểu treo tường phải, có vách ngăn
    for (const [i, z] of [-8.3, -9.3, -10.3].entries()) {
      hop(0.3, 0.62, 0.38, TRANG, X2 - 0.15, 0.45, z); hop(0.16, 0.36, 0.26, 0xdfe9ee, X2 - 0.31, 0.56, z, { can: false });
      hop(0.04, 0.4, 0.04, 0xc0c4c8, X2 - 0.06, 1.07, z, { can: false });
      if (i < 2) hop(0.42, 0.85, 0.05, VACH, X2 - 0.21, 0.4, z - 0.5, { can: false });
    }
    // dãy lavabo tường trái, gương lớn, xà phòng, máy sấy tay
    hop(0.62, 0.85, 3.0, 0x3a3d44, X1 + 0.31, 0, -8.85); hop(0.66, 0.05, 3.04, 0xe9e4da, X1 + 0.33, 0.85, -8.85, { can: false });
    for (const z of [-8.1, -9.6]) {
      hop(0.44, 0.06, 0.5, TRANG, X1 + 0.36, 0.86, z, { can: false }); hop(0.34, 0.02, 0.4, 0x9ab3c4, X1 + 0.38, 0.905, z, { can: false });
      tru(0.025, 0.22, 0xc0c4c8, X1 + 0.1, 0.9, z); hop(0.16, 0.03, 0.03, 0xc0c4c8, X1 + 0.17, 1.1, z, { can: false });
      hop(0.07, 0.16, 0.09, 0xf26fa6, X1 + 0.06, 1.22, z + 0.4, { can: false }); // bình xà phòng
    }
    const guong = new THREE.Mesh(new THREE.PlaneGeometry(2.7, 1.05), new THREE.MeshBasicMaterial({ map: tranh("guongwc", 128, 50, g => { const gr = g.createLinearGradient(0, 0, 128, 50); gr.addColorStop(0, "#dfeef5"); gr.addColorStop(0.5, "#b9d3e0"); gr.addColorStop(1, "#e8f3f8"); g.fillStyle = gr; g.fillRect(0, 0, 128, 50); g.fillStyle = "rgba(255,255,255,.7)"; g.fillRect(18, 4, 6, 42); g.fillRect(28, 4, 3, 42); }) }));
    guong.position.set(X1 + 0.02, 1.75, -8.85); guong.rotation.y = Math.PI / 2; nhom.add(guong);
    // gương thật: soi thấy chính mình (chỉ vẽ phản chiếu khi gương nằm trong khung nhìn)
    const soi = new Reflector(new THREE.PlaneGeometry(2.6, 0.98), { textureWidth: 512, textureHeight: 192, color: 0xb8c4c9, clipBias: 0.003 });
    soi.position.set(X1 + 0.03, 1.75, -8.85); soi.rotation.y = Math.PI / 2; soi.userData.rieng = true; soi.userData.khongCan = true; nhom.add(soi);
    hop(0.02, 1.13, 2.78, 0xc0c4c8, X1 + 0.005, 1.21, -8.85, { can: false }); // khung gương (nằm sau mặt gương)
    hop(0.18, 0.32, 0.3, 0xd9d9d9, X1 + 0.1, 1.05, -6.9, { can: false }); hop(0.06, 0.04, 0.18, 0x3a3d44, X1 + 0.2, 1.05, -6.9, { can: false }); // máy sấy tay
    tru(0.17, 0.45, 0x8a8d92, X1 + 0.3, 0, -10.8); // thùng rác
    // xô lau nhà, biển sàn ướt
    tru(0.2, 0.3, 0x2a5aa8, 13.3, 0, -13.2); hop(0.03, 1.2, 0.03, 0x8a6a3a, 13.4, 0.1, -13.3, { can: false });
    { const b = new THREE.Mesh(new THREE.ConeGeometry(0.22, 0.6, 4), vl(0xffcf3a)); b.position.set(13.5, 0.3, -12.3); nhom.add(b); }
    // biển nhắc nhở (giọng bác Bình)
    T(1.6, 0.5, chu("xanuoc", 400, 125, "#ffffff", "#c0262d", ["XẢ NƯỚC GIÙM CÁI", "Ký tên: Bác Bình"], 46), 17.2, 2.55, Z1 + 0.03, 0);
    // câu đối khung gỗ trên dãy bồn tiểu
    T(2.1, 0.62, tranh("caudoiwc", 840, 248, (g, w, h) => {
      g.fillStyle = "#6b3f1f"; g.fillRect(0, 0, w, h); g.fillStyle = "#fbf3df"; g.fillRect(14, 14, w - 28, h - 28);
      g.strokeStyle = "#c0262d"; g.lineWidth = 4; g.strokeRect(26, 26, w - 52, h - 52);
      g.fillStyle = "#8a1c1c"; g.textAlign = "center"; g.textBaseline = "middle";
      for (const [i, d] of ["Kẻ Dại Nhịn Đái Nơi Công Sở", "Người Khôn Ỉa Hết Cả Một Giờ"].entries()) {
        let c = 58; g.font = `800 ${c}px 'Be Vietnam Pro', system-ui, sans-serif`;
        while (g.measureText(d).width > w - 90 && c > 20) { c -= 2; g.font = `800 ${c}px 'Be Vietnam Pro', system-ui, sans-serif`; }
        g.fillText(d, w / 2, h * (i ? 0.68 : 0.36));
      }
    }), X2, 1.98, -9.3, -Math.PI / 2);
    T(1.4, 0.36, chu("tietkiem", 360, 92, "#1f4fa8", "#ffffff", ["TIẾT KIỆM NƯỚC = TIẾT KIỆM LƯƠNG"], 30), X1 + 0.02, 2.55, -8.85, Math.PI / 2);
  }

  // Sảnh: bàn thờ Thần Tài, khẩu hiệu, cây nước, tivi, ghế chờ
  hop(0.6, 0.9, 1.2, 0x8a1c1c, -1.5, 0, 10.5); hop(0.62, 0.06, 1.25, 0xd8b45a, -1.5, 0.9, 10.5, { can: false });
  hop(0.2, 0.28, 0.16, 0xd8b45a, -1.6, 0.96, 10.2, { can: false }); hop(0.2, 0.3, 0.16, 0xd8b45a, -1.6, 0.96, 10.75, { can: false });
  for (const [dz, c] of [[-0.05, 0xe8702a], [0.1, 0x6aa84f], [0.25, 0xe9e04a]]) cau(0.07, c, -1.4, 1.02, 10.45 + dz);
  tru(0.06, 0.1, 0xc9b26a, -1.4, 0.96, 10.95); { const d = new THREE.Mesh(new THREE.BoxGeometry(0.05, 0.12, 0.05), new THREE.MeshBasicMaterial({ color: 0xff3a2a })); d.position.set(-1.7, 1.1, 10.5); nhom.add(d); }
  T(5.2, 0.7, chu("khauhieu", 1024, 128, "#e8702a", "#ffffff", ["VIỆC HÔM NAY CỨ ĐỂ NGÀY MAI TÍNH"], 64), 2, 3.0, 7.95);
  hop(0.4, 1.2, 0.4, 0xe8e8e8, 8.4, 0, 10.4); tru(0.14, 0.4, 0x7fb8e0, 8.4, 1.2, 10.4); // cây nước (không chắn cửa pantry)
  for (const x of [-0.4, 4.4]) hop(0.02, 0.5, 0.02, 0x8a8d92, x, 3.3, 7.95, { can: false }); // dây treo băng rôn
  T(1.6, 0.9, chu("tvsanh", 320, 180, "#f26fa6", "#ffffff", ["SIÊU NHÂN HỒNG", "1.000.000 FOLLOW"], 44), 7.65, 2.0, 8.044, Math.PI); // tivi treo trên hông giếng thang máy
  for (let i = 0; i < 3; i++) ghe(-0.7 + i * 0.6, 4.2, Math.PI / 2 * 0, 0, 0x5b6b8c);
  T(1.2, 1.6, chu("poster1", 240, 320, "#1c1c1f", "#f26fa6", ["ĐẠI NHẠC HỘI", "SIÊU NHÂN", "31.10"], 46), 8.84, 1.9, 12.5, -Math.PI / 2);
  // đồng hồ trên vách logo: dựng trong chi-tiet-cong-ty.js (kim chạy theo giờ trong game)
  chauCay(-1.2, 1, 0, 1.2); chauCay(8.4, 1.6, 0);
  // Khu làm việc chung: tủ hồ sơ, máy in, cây nước, điều hòa, bảng tiến độ
  for (let i = 0; i < 4; i++) tuHoSo(-19.5, 10.3 + i * 0.95, Math.PI / 2);
  hop(1.1, 0.9, 0.7, 0xd9d9d9, -3.2, 0, 12.6); hop(0.9, 0.2, 0.5, 0x3a3d44, -3.2, 0.9, 12.6, { can: false });
  hop(0.4, 1.2, 0.4, 0xe8e8e8, -3.2, 0, -0.9); tru(0.14, 0.4, 0x7fb8e0, -3.2, 1.2, -0.9);
  dieuHoa(-19.75, 2.9, 4, Math.PI / 2); dieuHoa(-19.75, 2.9, 10, Math.PI / 2);
  T(2.6, 1.4, tranh("tiendo", 520, 280, (g, w, h) => {
    g.fillStyle = "#fafafa"; g.fillRect(0, 0, w, h); g.fillStyle = "#222"; g.font = "800 34px 'Be Vietnam Pro', system-ui"; g.fillText("MỤC TIÊU: 1.000.000 FOLLOW", 24, 50, w - 48);
    g.strokeStyle = "#222"; g.lineWidth = 4; g.strokeRect(24, 90, 470, 50); g.fillStyle = "#f26fa6"; g.fillRect(26, 92, 120, 46);
    g.fillStyle = "#c0262d"; g.font = "600 24px system-ui"; g.fillText("Hạn chót: 31/10 - Đại Nhạc Hội Siêu Nhân", 24, 190, w - 48); g.fillText("Ai làm biếng: trừ lương (đùa thôi)", 24, 230);
  }), -11, 1.6, 13.84, Math.PI);
  T(1, 0.7, chu("lich", 200, 140, "#ffffff", "#c0262d", ["THÁNG 10", "2026"], 42), -19.84, 1.9, 1.5, Math.PI / 2);
  // giá treo mũ bảo hiểm
  hop(0.08, 1.7, 0.08, 0x5a3d2a, -19.4, 0, -1.3);
  for (const [dy, c] of [[1.6, 0xc0262d], [1.4, 0xf6f6f2], [1.2, 0x2a5aa8]]) { const m = new THREE.Mesh(new THREE.SphereGeometry(0.15, 8, 5, 0, 7, 0, 1.6), vl(c)); m.position.set(-19.25, dy, -1.3); nhom.add(m); }
  // Pantry: ghế quanh bàn, lò vi sóng, ấm, mì ly, rổ trái cây, bồn rửa
  for (const [x, z] of [[12, 6], [16, 6]]) { ghe(x - 0.7, z + 0.9, Math.PI, 0, 0xe8702a); ghe(x + 0.7, z + 0.9, Math.PI, 0, 0xe8702a); ghe(x - 0.7, z - 0.9, 0, 0, 0xe8702a); ghe(x + 0.7, z - 0.9, 0, 0, 0xe8702a); cau(0.12, 0xe9e04a, x, 0.85, z); cau(0.1, 0x6aa84f, x + 0.2, 0.85, z + 0.1); }
  hop(0.6, 0.35, 0.4, 0xf2f2f2, 14.5, 0.95, 13.1, { can: false }); hop(0.4, 0.25, 0.02, 0x222222, 14.4, 1.0, 12.89, { can: false });
  tru(0.1, 0.22, 0xb5b5b5, 16, 0.95, 13.1);
  for (let i = 0; i < 5; i++) tru(0.06, 0.1, 0xf6f6f2, 17.5 + (i % 3) * 0.14, 0.95 + Math.floor(i / 3) * 0.1, 13.1); // chồng ly cạnh lò vi sóng
  hop(0.9, 0.05, 0.6, 0x9aa0a6, 11.2, 0.95, 13, { can: false });
  T(0.8, 1.1, chu("menu", 160, 220, "#2a2c31", "#ffe14d", ["MÌ LY", "0đ", "(ăn cắp)"], 34), 19.84, 1.6, 9, -Math.PI / 2);
  // Kế toán: két sắt, giấy tờ, máy tính tiền
  hop(0.8, 1.0, 0.7, 0x2a2c31, -11.2, 0, -13.2); hop(0.12, 0.12, 0.02, 0xc9b26a, -11.2, 0.55, -12.84, { can: false });
  for (let i = 0; i < 3; i++) hop(0.32, 0.12 + i * 0.05, 0.24, 0xf6f6f2, -16.3 + i * 0.38, 0.75, -10.3, { can: false });
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
  for (let i = 0; i < 5; i++) { const b = cau(0.25, 0xe8702a, 4.6 + i * 0.5, 0.19, -7.2); b.scale.y = 0.75; } // chừa chỗ cho cánh cửa mở vào
  for (let i = 0; i < 6; i++) { cau(0.2, 0xf26fa6, 10.6 + (i % 3) * 0.4, 2.3 + (i % 2) * 0.3, -7 - Math.floor(i / 3) * 0.4); }
  hop(0.05, 1.8, 0.05, 0x9a9a9a, 11.3, 0, -9.5); hop(0.05, 1.8, 0.05, 0x9a9a9a, 11.3, 0, -11.5); hop(0.05, 0.05, 2, 0x9a9a9a, 11.3, 1.8, -10.5, { can: false });
  hop(0.4, 1.2, 0.3, 0xf26fa6, 11.3, 0.5, -10.2, { can: false }); hop(0.4, 1.2, 0.3, 0x111111, 11.3, 0.5, -10.9, { can: false });
  hop(0.6, 1.0, 0.5, 0x1a1a1a, 5, 0, -12.6); hop(0.6, 1.0, 0.5, 0x1a1a1a, 5, 0, -11.9);
  // Toilet (phòng x 12..20, z -14..-6, cửa ở x 15..17)
  T(0.6, 0.4, chu("wc", 120, 80, "#1f4fa8", "#ffffff", ["WC"], 48), 16, 2.6, -5.86, 0);
  nhaVeSinh();
  // Hành lang tầng 1: bảng tin, bình cứu hỏa
  T(2.2, 1.2, tranh("bangtin", 440, 240, (g, w, h) => {
    g.fillStyle = "#b08a5a"; g.fillRect(0, 0, w, h);
    [["THÔNG BÁO", "Lương về trễ 2 ngày"], ["TEAM BUILDING", "Vũng Tàu 17-18/10"], ["CẤM", "Hâm cá trong lò vi sóng"]].forEach(([a, b], i) => {
      g.fillStyle = ["#fff7a8", "#ffffff", "#ffd3e0"][i]; g.save(); g.translate(20 + i * 140, 30 + (i % 2) * 20); g.rotate((i - 1) * 0.06); g.fillRect(0, 0, 125, 150);
      g.fillStyle = "#c0262d"; g.font = "800 17px system-ui"; g.fillText(a, 8, 30, 110); g.fillStyle = "#222"; g.font = "15px system-ui"; b.split(" ").reduce((y, wd, k, arr) => { g.fillText(arr.slice(k * 3, k * 3 + 3).join(" "), 8, 60 + k * 22, 110); return y; }, 0); g.restore();
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
  // viền bóng đèn quanh gương trang điểm (gương, bàn trang điểm: the-gioi.js): cột trái, hàng trên, cột phải trên mặt bàn
  for (let i = 0; i < 10; i++) { const b = new THREE.Mesh(new THREE.SphereGeometry(0.05, 6, 4), new THREE.MeshBasicMaterial({ color: 0xfff1c8 })); b.position.set(19.75, y2 + (i < 4 ? 0.9 + i * 0.37 : i < 8 ? 2.05 : 1.05 + (i - 8) * 0.5), i < 4 ? -9.75 : i < 8 ? -9.75 + (i - 4) * 0.5 : -8.25); nhom.add(b); }
  T(1, 1.4, chu("phat2015", 200, 280, "#3a1d5a", "#ffd166", ["PHÁT", "CÔNG VIÊN", "2015"], 40), 12.16, y2 + 1.8, -8, Math.PI / 2);
  hop(0.05, 1.6, 1.6, 0x9a9a9a, 14, y2, -6, { can: false, tang: 1 });
  { const gt = new THREE.Mesh(new THREE.BoxGeometry(0.35, 0.5, 0.1), vl(0xb5653a)); gt.position.set(18.5, y2 + 0.4, -13.5); nhom.add(gt); hop(0.06, 0.6, 0.04, 0x3a2a1a, 18.5, y2 + 0.6, -13.5, { can: false, tang: 1 }); }
  // Hành lang tầng 2: ghế chờ, cây, ảnh kỷ niệm
  for (let i = 0; i < 4; i++) T(0.8, 0.6, chu("anh" + i, 160, 120, ["#f2e6c8", "#d9e6f2", "#ffd3e0", "#e6f2d9"][i], "#333", [["2010", "2015", "2020", "2026"][i], "G-ENT"], 36), 8.2 + i * 2, y2 + 1.8, -3.86, 0);
  ghe(16, 0.5, Math.PI, 1); ghe(16.7, 0.5, Math.PI, 1); chauCay(19, -3, 1); binhCuuHoa(-19.5, -3.5, 1);
  // Studio: đèn softbox, micro boom, trái tim hồng
  for (const x of [-16, -10]) { hop(0.06, 1.6, 0.06, 0x222222, x, y2, 9, { can: false, tang: 1 }); const sb = new THREE.Mesh(new THREE.BoxGeometry(0.8, 0.6, 0.3), new THREE.MeshBasicMaterial({ color: 0xfaf6ee })); sb.position.set(x, y2 + 1.9, 9); sb.lookAt(-13, y2 + 1.5, 12); nhom.add(sb); }
  hop(0.04, 0.04, 2, 0x222222, -14, y2 + 2.6, 11, { can: false, tang: 1 });
  { const tim = new THREE.Mesh(new THREE.SphereGeometry(0.6, 8, 6), vl(0xf26fa6)); tim.scale.set(1.3, 1, 0.4); tim.position.set(-17.5, y2 + 1.4, 13.4); nhom.add(tim); }
  // Dựng phim: rèm tối, loa, bean bag, cốc cà phê
  T(7.5, 3.4, tranh("rem", 16, 16, g => { g.fillStyle = "#1f2a3d"; g.fillRect(0, 0, 16, 16); g.fillStyle = "#18202e"; g.fillRect(0, 0, 4, 16); g.fillRect(8, 0, 4, 16); }), -2, y2 + 1.7, 13.84, Math.PI);
  hop(0.3, 0.5, 0.3, 0x111111, -3.8, y2 + 0.75, 11.4, { can: false, tang: 1 }); hop(0.3, 0.5, 0.3, 0x111111, -0.2, y2 + 0.75, 11.4, { can: false, tang: 1 });
  { const bb = new THREE.Mesh(new THREE.IcosahedronGeometry(0.5, 1), vl(0xe8702a)); bb.scale.y = 0.6; bb.position.set(-4.6, y2 + 0.3, 5); nhom.add(bb); }
  for (let i = 0; i < 4; i++) tru(0.05, 0.12, 0xf6f6f2, -3.4 + i * 0.22, y2 + 0.75, 10.9);
  // Sản xuất: kệ hồ sơ, lịch họp
  for (let i = 0; i < 3; i++) { hop(1.8, 0.04, 0.4, 0x8a6a4a, 18.6, y2 + 0.5 + i * 0.6, 3, { can: false, tang: 1 }); for (let k = 0; k < 6; k++) hop(0.08, 0.45, 0.3, [0xc0262d, 0x2a5aa8, 0xe9e04a, 0x2e8b57][k % 4], 17.9 + k * 0.25, y2 + 0.54 + i * 0.6, 3, { can: false, tang: 1 }); }
  hop(1.8, 1.8, 0.4, 0x6b4a2f, 18.6, y2, 3.05, { tang: 1 }).visible = false;
  T(1.8, 1.1, chu("lichhop", 360, 220, "#ffffff", "#1c1c1f", ["LỊCH HỌP TUẦN NÀY", "Họp - Họp - Họp - Họp"], 34), 12, y2 + 1.8, 13.84, Math.PI);

  // ===== SÂN THƯỢNG =====
  // bồn nước, dây phơi đồ, bàn trà, vườn rau: dựng trong chi-tiet-cong-ty.js
  for (let i = 0; i < 6; i++) chauCay(12 + (i % 3) * 1.4, -12 + Math.floor(i / 3) * 1.4, 2, 0.9);
  { const ch = new THREE.Mesh(new THREE.SphereGeometry(0.6, 10, 6, 0, Math.PI * 2, 0, Math.PI / 2.5), vl(0xe6e6e6, { side: THREE.DoubleSide })); ch.rotation.x = -1.1; ch.position.set(17, y3 + 1.6, 12); nhom.add(ch); hop(0.06, 1.3, 0.06, 0x666666, 17, y3, 12, { tang: 2 }); }

  // ===== SÂN TRƯỚC =====
  // biển tên công ty đứng ngoài hàng rào, mặt nhìn ra phố, hai chân trụ phía sau biển (không che chữ)
  T(2.6, 0.95, chu("biencong", 1040, 380, "#2a2c31", "#e8702a", ["G-ENTERTAINMENT", "Thành lập 20/10/2010"], 110), -2.4, 2.25, 30.86, 0);
  hop(2.75, 1.08, 0.12, 0x1c1c1f, -2.4, 1.71, 30.77, { can: false });
  for (const x of [-3.5, -1.3]) hop(0.14, 1.75, 0.14, 0x8a8d92, x, 0, 30.62, { can: true });
  for (const [x, z] of [[-14, 16], [16, 16], [-20, 27], [20, 27]]) { hop(3, 0.45, 1.2, 0xb5a58a, x, 0, z); for (let i = 0; i < 4; i++) cau(0.3, [0xf26fa6, 0xe9e04a, 0xc0262d, 0xf6f6f2][i], x - 1 + i * 0.65, 0.65, z); }
  // barie cổng đang nâng lên: trụ cam cạnh trụ cổng, thanh chắn xoay quanh đầu trụ, chĩa lên phía trên lối vào
  hop(0.2, 1.05, 0.2, 0xe8702a, 5.0, 0, 29.3);
  { const tb = new THREE.Group(); tb.position.set(5.0, 1.0, 29.3); tb.rotation.z = Math.PI - 1.31; nhom.add(tb);
    const thanh = new THREE.Mesh(new THREE.BoxGeometry(3.6, 0.07, 0.07), vl(0xf2f2f2)); thanh.position.x = 1.8; tb.add(thanh);
    for (let i = 0; i < 4; i++) { const v = new THREE.Mesh(new THREE.BoxGeometry(0.35, 0.075, 0.075), vl(0xc0262d)); v.position.x = 0.6 + i * 0.85; tb.add(v); } }
}
