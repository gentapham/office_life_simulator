// Phố phường Quận Hóng kiểu Sài Gòn: đường, vỉa hè gạch, nhà ống, chung cư cũ, chợ, cao ốc, cột điện dây chằng chịt,
// cây xanh, quán vỉa hè, trạm xe buýt, băng rôn, biển quảng cáo, Hẻm 69. Trả về làn xe và đường đi bộ cho giao thông.
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";
import { taoXeMay, taoBaGac, MAU_XE } from "./xe-3d.js";
import { dungSanKhau, SK } from "./san-khau.js";

// Bố cục: đường Hóng chạy theo trục x, đại lộ Ước Mơ chạy theo trục z
export const PHO = {
  bacVia: [30, 32.5], duong: [32.5, 41.5], namVia: [41.5, 44.5],
  ngang: [47, 57], taiVia: [44, 47], dongVia: [57, 60],
  gioiHanX: 150, gioiHanZ: [-95, 135],
};

const TEN_QUAN = [
  "CƠM TẤM SƯỜN HÓNG", "PHỞ ƯỚC MƠ", "BÁNH MÌ BỰA", "TRÀ SỮA HÓNG HỚT", "CÀ PHÊ SỐNG ẢO", "TIỆM VÀNG KIM HÓNG",
  "NHÀ THUỐC AN TÂM", "TẠP HÓA CÔ BA", "SỬA XE UY TÍN", "GỘI ĐẦU DƯỠNG SINH", "CẦM ĐỒ CỨU NGUY", "KARAOKE HÁT CHO NHAU NGHE",
  "QUÁN ỐC ĐÊM", "BÚN BÒ CÔ TƯ", "HỦ TIẾU GÕ", "ĐIỆN THOẠI HÓNG MOBILE", "PHOTO IN ẤN 24H", "NAIL LUNG LINH",
  "THỜI TRANG GIÁ RẺ", "NHA KHOA NỤ CƯỜI", "BIDA CƠ BẢN", "QUÁN NHẬU 1-2-3 DÔ", "CHÈ BÀ BẢY", "BÁNH XÈO MIỀN TÂY",
  "GÀ RÁN XỊN", "TIỆM BÁNH NGỌT", "VĂN PHÒNG PHẨM", "ĐIỆN MÁY HÓNG", "KHÁCH SẠN ƯỚC MƠ", "TÍN DỤNG ĐEN ĐỦI",
  "LẨU DÊ 7 MÓN", "SỮA TƯƠI TRÂN CHÂU", "XE ĐIỆN GIÁ GỐC", "SPA ĐẸP LIỀN", "TIỆM SÁCH PHỐ CŨ", "MÌ CAY 7 CẤP ĐỘ",
];
const MAU_BIEN = [["#c0262d", "#ffe14d"], ["#1f4fa8", "#ffffff"], ["#f2f2f2", "#c0262d"], ["#2e8b57", "#ffffff"], ["#ffcf3a", "#c0262d"], ["#1c1c1f", "#ffcf3a"], ["#e8702a", "#ffffff"], ["#f26fa6", "#ffffff"]];
const MAU_NHA = [0xf3d9a4, 0xe9b8a8, 0xbfd9c4, 0xf6efe0, 0xd9e6f2, 0xf4c27a, 0xc9b6dc, 0xf2a7a0, 0xe0d4b8, 0xa8d4d9, 0xf7e27a, 0xd6c3a5];
const MAU_BAT = [["#c0262d", "#f6f6f2"], ["#1f4fa8", "#f6f6f2"], ["#2e8b57", "#f6f6f2"], ["#e8702a", "#f6f6f2"], ["#7b4bb3", "#f6f6f2"]];

const texCache = new Map();
function chuTex(key, w, h, ve) {
  if (texCache.has(key)) return texCache.get(key);
  const c = document.createElement("canvas"); c.width = w; c.height = h;
  ve(c.getContext("2d"), w, h);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 8;
  texCache.set(key, t); return t;
}
function bienHieu(ten, mau) {
  return chuTex("bh" + ten, 1024, 256, (g, w, h) => {
    g.fillStyle = mau[0]; g.fillRect(0, 0, w, h);
    g.strokeStyle = mau[1]; g.lineWidth = 10; g.strokeRect(10, 10, w - 20, h - 20);
    g.fillStyle = mau[1]; g.textAlign = "center"; g.textBaseline = "middle";
    let size = 124; g.font = `800 ${size}px 'Be Vietnam Pro', system-ui, sans-serif`;
    while (g.measureText(ten).width > w - 70 && size > 40) { size -= 4; g.font = `800 ${size}px 'Be Vietnam Pro', system-ui, sans-serif`; }
    g.fillText(ten, w / 2, h / 2 - 18);
    g.font = "700 38px system-ui, sans-serif"; g.fillText("ĐT: 0900 000 " + String(ten.length * 37 % 1000).padStart(3, "0"), w / 2, h - 40);
  });
}
function soc(mau) {
  return chuTex("soc" + mau, 64, 64, (g) => { for (let i = 0; i < 8; i++) { g.fillStyle = mau[i % 2]; g.fillRect(i * 8, 0, 8, 64); } });
}
function gachVia() {
  const t = chuTex("gach", 128, 128, (g) => {
    for (let i = 0; i < 4; i++) for (let j = 0; j < 4; j++) { g.fillStyle = (i + j) % 2 ? "#b86a52" : "#a9a39a"; g.fillRect(i * 32, j * 32, 32, 32); g.strokeStyle = "#7f7a70"; g.strokeRect(i * 32 + 0.5, j * 32 + 0.5, 31, 31); }
  });
  t.wrapS = t.wrapT = THREE.RepeatWrapping; return t;
}
function quangCao(chu, phu, nen, mau) {
  return chuTex("qc" + chu, 512, 256, (g, w, h) => {
    const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, nen[0]); gr.addColorStop(1, nen[1]); g.fillStyle = gr; g.fillRect(0, 0, w, h);
    g.fillStyle = mau; g.textAlign = "center"; g.font = "800 52px 'Baloo 2', system-ui, sans-serif"; g.fillText(chu, w / 2, 110, w - 30);
    g.font = "600 28px 'Be Vietnam Pro', system-ui, sans-serif"; g.fillText(phu, w / 2, 170, w - 30);
  });
}
function cuaSoCaoOc(mau, sang) {
  const t = chuTex("co" + mau + sang, 64, 64, (g) => {
    g.fillStyle = mau; g.fillRect(0, 0, 64, 64);
    for (let i = 0; i < 4; i++) for (let j = 0; j < 4; j++) { g.fillStyle = sang && (i * 7 + j * 3) % 5 === 0 ? "#ffe2a0" : "rgba(20,40,60,.55)"; g.fillRect(i * 16 + 2, j * 16 + 3, 12, 10); }
  });
  t.wrapS = t.wrapT = THREE.RepeatWrapping; return t;
}

export function taoThanhPho(nhom, vat, denDem, { dienThoai = false } = {}) {
  let seed = 20101020;
  const rnd = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
  const chon = a => a[Math.floor(rnd() * a.length)];
  const matUot = [];
  const dong = m => { m.userData.dong = true; return m; };
  const kinhDem = dong(new THREE.MeshLambertMaterial({ color: 0x5d7d96, flatShading: true }));   // kính sáng đèn buổi tối
  const kinhToi = vl(0x34495a);
  const trongQuan = dong(new THREE.MeshLambertMaterial({ color: 0x6a5642, flatShading: true })); // bên trong quán (tối thì sáng)
  const choNguoiDung = [];
  const can = (minX, maxX, minZ, maxZ) => vat[0].push({ minX, maxX, minZ, maxZ });
  const H = (w, h, d, mat, x, y, z, nhomCha = nhom) => {
    const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mat === "number" ? vl(mat) : mat);
    m.position.set(x, y + h / 2, z); nhomCha.add(m); return m;
  };
  const phang = (w, d, mat, x, z, y = 0.01) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, d), mat); m.rotation.x = -Math.PI / 2; m.position.set(x, y, z); nhom.add(m); return m; };

  // ---------- Mặt đường, vỉa hè ----------
  const vlDat = dong(new THREE.MeshLambertMaterial({ color: 0x8f8a80 })); matUot.push(vlDat);
  phang(420, 300, vlDat, 0, 20, -0.03);
  const vlNhua = dong(new THREE.MeshLambertMaterial({ color: 0x3a3c41 })); matUot.push(vlNhua);
  phang(400, 9, vlNhua, 0, 37, 0.0);
  phang(10, 260, vlNhua, 52, 20, 0.002);
  const gach = gachVia();
  const vlVia = new THREE.MeshLambertMaterial({ map: gach }); matUot.push(vlVia);
  const via = (x1, x2, z1, z2) => {
    const m = phang(x2 - x1, z2 - z1, vlVia.clone(), (x1 + x2) / 2, (z1 + z2) / 2, 0.012);
    m.material.map = gach.clone(); m.material.map.needsUpdate = true; m.material.map.repeat.set((x2 - x1) / 2, (z2 - z1) / 2); matUot.push(m.material);
  };
  via(-200, 47, 30, 32.5); via(57, 200, 30, 32.5); via(-200, 44, 41.5, 44.5); via(60, 200, 41.5, 44.5);
  via(44, 47, -120, 32.5); via(57, 60, -120, 32.5); via(44, 47, 41.5, 150); via(57, 60, 41.5, 150);
  // bó vỉa
  const boVia = vl(0xcfc9bd);
  for (const [x1, x2, z] of [[-200, 47, 32.45], [57, 200, 32.45], [-200, 47, 41.55], [57, 200, 41.55]]) H(x2 - x1, 0.12, 0.12, boVia, (x1 + x2) / 2, 0, z);
  for (const [x, z1, z2] of [[46.95, -120, 32.5], [57.05, -120, 32.5], [46.95, 41.5, 150], [57.05, 41.5, 150]]) H(0.12, 0.12, z2 - z1, boVia, x, 0, (z1 + z2) / 2);
  // vạch kẻ đường
  const vach = vl(0xeeeadc), vachVang = vl(0xe8c547);
  for (let x = -195; x < 195; x += 6) if (x < 40 || x > 62) phang(3, 0.18, vach, x, 37, 0.015);
  for (let z = -115; z < 145; z += 6) if (z < 28 || z > 46) phang(0.18, 3, vachVang, 52, z, 0.015);
  for (let i = 0; i < 8; i++) { phang(2.6, 0.5, vach, 45.3, 33.2 + i * 1.1, 0.016); phang(2.6, 0.5, vach, 58.7, 33.2 + i * 1.1, 0.016); phang(0.5, 2.4, vach, 47.6 + i * 1.2, 31.2, 0.016); phang(0.5, 2.4, vach, 47.6 + i * 1.2, 42.8, 0.016); }
  phang(0.3, 4.4, vach, 46.4, 39.3, 0.017); phang(0.3, 4.4, vach, 57.6, 34.7, 0.017); phang(4.4, 0.3, vach, 49.7, 32.2, 0.017); phang(4.4, 0.3, vach, 54.3, 41.8, 0.017);
  for (let x = -180; x < 180; x += 37) phang(0.9, 0.9, vl(0x2a2b2e), x, 34 + (x % 3), 0.014); // nắp cống

  // ---------- Nhà ống ----------
  const TANG = 3.3;
  const nhaOng = (w, soTang, sau, { hem = false } = {}) => {
    const g = new THREE.Group();
    const mau = chon(MAU_NHA), cao = soTang * TANG;
    H(w - 0.06, cao, sau, mau, w / 2, 0, -sau / 2, g);
    // tầng trệt: cửa hàng
    H(0.3, 3, 0.3, toiMau(mau), 0.2, 0, 0.1, g); H(0.3, 3, 0.3, toiMau(mau), w - 0.2, 0, 0.1, g);
    const m1 = new THREE.Mesh(new THREE.PlaneGeometry(w - 0.6, 2.6), trongQuan); m1.position.set(w / 2, 1.3, 0.02); g.add(m1);
    H(w - 0.5, 0.35, 0.18, 0x9aa0a6, w / 2, 2.62, 0.08, g); // cửa cuốn kéo lên
    for (let i = 0; i < 3; i++) H(0.5 + rnd() * 0.6, 0.6 + rnd() * 0.8, 0.4, chon([0xd9c9a8, 0xc0262d, 0x2a5aa8, 0xf2f2f2, 0x7a5a3a]), 0.7 + i * (w - 1.4) / 2.6 + rnd() * 0.3, 0, -0.4, g); // hàng hóa bên trong
    if (!hem || rnd() < 0.5) {
      const bat = new THREE.Mesh(new THREE.BoxGeometry(w - 0.2, 0.05, 1.5), new THREE.MeshLambertMaterial({ map: soc(chon(MAU_BAT)) }));
      bat.position.set(w / 2, 2.85, 0.68); bat.rotation.x = 0.28; g.add(bat);
      const ten = chon(TEN_QUAN), mb = chon(MAU_BIEN);
      const bh = new THREE.Mesh(new THREE.PlaneGeometry(w - 0.3, 1.15), new THREE.MeshBasicMaterial({ map: bienHieu(ten, mb) }));
      bh.position.set(w / 2, 3.68, 0.14); g.add(bh);
    }
    // các tầng trên
    for (let t = 1; t < soTang; t++) {
      const y = t * TANG;
      const banCong = t > 1; // tầng ngay trên bảng hiệu không làm ban công để bảng hiệu lộ rõ
      if (banCong) {
      H(w - 0.3, 0.12, 0.9, toiMau(mau, 0.9), w / 2, y, 0.45, g);                      // sàn ban công
      H(w - 0.3, 0.06, 0.06, 0x3a3d44, w / 2, y + 1.0, 0.86, g);                         // tay vịn
      for (let x = 0.3; x < w - 0.2; x += 0.28) H(0.03, 0.95, 0.03, 0x3a3d44, x, y + 0.08, 0.86, g);
      }
      const k = new THREE.Mesh(new THREE.PlaneGeometry(w * 0.55, 2.1), rnd() < 0.45 ? kinhDem : kinhToi); k.position.set(w / 2, y + 1.2, 0.015); g.add(k);
      H(w * 0.55 + 0.12, 0.08, 0.08, 0xf6f6f2, w / 2, y + 2.28, 0.03, g);
      if (rnd() < 0.55) for (let x = w * 0.24; x < w * 0.78; x += 0.18) H(0.025, 2.1, 0.025, 0x2a2c31, x, y + (banCong ? 0.15 : 0.75), 0.06, g); // khung sắt bảo vệ
      if (rnd() < 0.7) { H(0.75, 0.48, 0.26, 0xf2f2f2, w - 0.6, y + 2.45, 0.14, g); H(0.4, 0.4, 0.02, 0x8a8d92, w - 0.6, y + 2.49, 0.28, g); }   // cục nóng điều hòa
      if (banCong && rnd() < 0.6) for (let i = 0; i < 1 + Math.floor(rnd() * 3); i++) { H(0.26, 0.24, 0.26, 0xb5653a, 0.6 + i * 0.5, y + 0.12, 0.6, g); const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.24, 0), vl(chon([0x4f8a3c, 0x3d7a34, 0x6aa84f]))); l.position.set(0.6 + i * 0.5, y + 0.55, 0.6); g.add(l); }
      if (banCong && rnd() < 0.4) { H(w - 0.6, 0.02, 0.02, 0x555555, w / 2, y + 1.9, 0.75, g); for (let i = 0; i < 4; i++) H(0.35, 0.45 + rnd() * 0.3, 0.02, chon([0xc0262d, 0xf6f6f2, 0x2a5aa8, 0xe9e04a, 0xf5b9cf, 0x2e8b57]), 0.6 + i * (w - 1.2) / 4, y + 1.35, 0.75, g); } // phơi đồ
    }
    // mái: lan can, bồn nước inox, ăng-ten, mái tôn
    H(w - 0.06, 0.6, 0.15, toiMau(mau, 0.92), w / 2, cao, -0.07, g);
    const bon = new THREE.Mesh(new THREE.CylinderGeometry(0.55, 0.55, 1.3, 10), vl(0xd5d9dd)); bon.position.set(w * 0.35, cao + 1.05, -sau + 1.4); g.add(bon);
    H(1.2, 0.4, 1.2, 0x8a8d92, w * 0.35, cao, -sau + 1.4, g);
    if (rnd() < 0.5) { H(0.04, 2.2, 0.04, 0x555555, w * 0.75, cao, -sau + 2, g); H(0.8, 0.04, 0.04, 0x555555, w * 0.75, cao + 1.8, -sau + 2, g); }
    if (rnd() < 0.35) { const mt = new THREE.Mesh(new THREE.BoxGeometry(w - 0.4, 0.06, sau * 0.45), vl(chon([0x6d8fa8, 0xa8503a, 0x8a8d92]))); mt.position.set(w / 2, cao + 1.6, -sau * 0.6); mt.rotation.x = 0.18; g.add(mt); H(0.1, 1.6, 0.1, 0x555555, 0.3, cao, -sau * 0.4, g); H(0.1, 1.6, 0.1, 0x555555, w - 0.3, cao, -sau * 0.4, g); }
    return g;
  };
  const toiMau = (n, k = 0.82) => new THREE.Color(n).multiplyScalar(k).getHex();
  // đặt một dãy nhà: mặt tiền dọc theo một đường, quay về phía đường
  // huong: "nam" (mặt nhìn -z), "bac" (+z), "dong" (+x), "tay" (-x)
  // ranh giới giữa các căn nhà của từng dãy: cột điện, cây, đèn đường dời về đúng ranh để không đứng giữa bảng hiệu
  const RANH = {};
  const veRanh = (dayKey, v) => { const ds = RANH[dayKey] || []; let tot = v, d = 3.2; for (const b of ds) if (Math.abs(b - v) < d) { d = Math.abs(b - v); tot = b; } return tot; };
  const dayNha = (tu, den, coDinh, huong, { sau = 12, tangMin = 2, tangMax = 6, hem = false, bo = [] } = {}) => {
    let a = tu;
    while (a < den - 3) {
      const w = Math.min(den - a, 3.8 + rnd() * 2.6);
      if (bo.some(([b1, b2]) => a + w > b1 && a < b2)) { a += 0.5; continue; }
      const nha = nhaOng(w, tangMin + Math.floor(rnd() * (tangMax - tangMin + 1)), sau, { hem });
      if (huong === "nam") { nha.rotation.y = Math.PI; nha.position.set(a + w, 0, coDinh); can(a, a + w, coDinh, coDinh + sau); }
      else if (huong === "bac") { nha.position.set(a, 0, coDinh); can(a, a + w, coDinh - sau, coDinh); }
      else if (huong === "dong") { nha.rotation.y = Math.PI / 2; nha.position.set(coDinh, 0, a + w); can(coDinh - sau, coDinh, a, a + w); }
      else { nha.rotation.y = -Math.PI / 2; nha.position.set(coDinh, 0, a); can(coDinh, coDinh + sau, a, a + w); }
      nhom.add(nha);
      (RANH[huong + ":" + coDinh] ||= []).push(a, a + w);
      a += w;
    }
  };
  // Dãy nhà hai bên đường Hóng (chừa Hẻm 69 ở x 8..12)
  dayNha(-150, 8, 44.5, "nam", { bo: [] });
  dayNha(12, 44, 44.5, "nam");
  dayNha(60, 150, 44.5, "nam");
  dayNha(-150, -25, 30, "bac");
  dayNha(25, 44, 30, "bac", { sau: 10 });
  dayNha(60, 150, 30, "bac", { bo: [[SK.x1 - 0.6, SK.x2 + 0.6]] }); // chừa quảng trường sân khấu Đại Nhạc Hội
  // Dãy nhà hai bên đại lộ Ước Mơ
  dayNha(-90, 18, 44, "dong", { sau: 10 });
  dayNha(57, 130, 44, "dong", { sau: 10 });
  dayNha(-90, -12, 60, "tay", { sau: 12 });
  dayNha(57, 130, 60, "tay", { sau: 12 });
  // Hẻm 69: nhà nhỏ hai bên, mặt nhìn vào hẻm
  dayNha(57, 82, 8, "dong", { sau: 9, tangMin: 2, tangMax: 4, hem: true });
  dayNha(57, 82, 12, "tay", { sau: 9, tangMin: 2, tangMax: 4, hem: true });
  H(4, 3, 0.4, 0xd6c3a5, 10, 0, 82.2); can(8, 12, 82, 82.6);
  phang(4, 26, vl(0xa9a39a), 10, 69.5, 0.011);
  // cổng hẻm
  H(0.3, 4.2, 0.3, 0xc0262d, 8.2, 0, 45.2); H(0.3, 4.2, 0.3, 0xc0262d, 11.8, 0, 45.2);
  const cong = new THREE.Mesh(new THREE.PlaneGeometry(3.8, 0.9), new THREE.MeshBasicMaterial({ map: bienHieu("KHU PHỐ VĂN HÓA - HẺM 69", ["#c0262d", "#ffe14d"]), side: THREE.DoubleSide }));
  cong.position.set(10, 3.9, 44.98); cong.rotation.y = Math.PI; nhom.add(cong);
  const soHem = new THREE.Mesh(new THREE.PlaneGeometry(0.7, 0.35), new THREE.MeshBasicMaterial({ map: bienHieu("HẺM 69", ["#1f4fa8", "#ffffff"]) }));
  soHem.position.set(8.2, 2.4, 45.03); soHem.rotation.y = Math.PI; nhom.add(soHem);
  for (let z = 50; z < 80; z += 6) { H(0.06, 0.06, 0.06, 0x111111, 10, 0, z); }

  // ---------- Công trình lớn ----------
  // Chợ Phố Cũ (tháp đồng hồ)
  H(24, 7, 26, 0xf2d27a, 74, 0, 5); can(62, 86, -8, 18);
  H(25, 0.6, 27, 0xa8503a, 74, 7, 5);
  // tháp đồng hồ ở góc chợ (không đứng trước bảng tên chợ)
  H(5, 14, 5, 0xf2d27a, 62.8, 0, 15.5); can(60.3, 65.3, 13, 18); H(5.4, 1.2, 5.4, 0xa8503a, 62.8, 14, 15.5);
  const dh = new THREE.Mesh(new THREE.CircleGeometry(1.5, 20), new THREE.MeshBasicMaterial({ map: dongHo() })); dh.position.set(60.27, 11, 15.5); dh.rotation.y = -Math.PI / 2; nhom.add(dh);
  const bc = new THREE.Mesh(new THREE.PlaneGeometry(10, 1.6), new THREE.MeshBasicMaterial({ map: bienHieu("CHỢ PHỐ CŨ", ["#c0262d", "#ffe14d"]) })); bc.position.set(61.98, 5.5, 5); bc.rotation.y = -Math.PI / 2; nhom.add(bc);
  for (let z = -6; z <= 12; z += 4) if (Math.abs(z - 5) > 2) { const c = new THREE.Mesh(new THREE.PlaneGeometry(2.4, 3), trongQuan); c.position.set(61.98, 1.5, z); c.rotation.y = -Math.PI / 2; nhom.add(c); }
  // Chung cư cũ (phơi đồ, chuồng cọp)
  const ccTex = chuTex("chungcu", 128, 128, g => {
    g.fillStyle = "#e6d9b0"; g.fillRect(0, 0, 128, 128);
    for (let i = 0; i < 2; i++) for (let j = 0; j < 2; j++) {
      const x = i * 64, y = j * 64; g.fillStyle = "#3a4250"; g.fillRect(x + 10, y + 12, 44, 34);
      g.strokeStyle = "#555"; g.lineWidth = 2; for (let k = 0; k < 6; k++) { g.beginPath(); g.moveTo(x + 10 + k * 8, y + 8); g.lineTo(x + 10 + k * 8, y + 50); g.stroke(); }
      g.fillStyle = ["#c0262d", "#2a5aa8", "#e9e04a", "#f5b9cf"][(i + j * 2) % 4]; g.fillRect(x + 14, y + 20, 8, 14); g.fillRect(x + 30, y + 20, 8, 12);
      g.fillStyle = "#cfc4a0"; g.fillRect(x, y + 50, 64, 6);
    }
  });
  ccTex.wrapS = ccTex.wrapT = THREE.RepeatWrapping;
  const chungCu = (x, z, w, d, h, xoay = 0) => {
    const t = ccTex.clone(); t.needsUpdate = true; t.repeat.set(w / 6, h / 6);
    const vl1 = new THREE.MeshLambertMaterial({ map: t }), vl2 = vl(0xd6c9a0);
    const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), [vl2, vl2, vl2, vl2, vl1, vl1]); m.position.set(x, h / 2, z); m.rotation.y = xoay; m.userData.rieng = true; nhom.add(m);
    can(x - w / 2, x + w / 2, z - d / 2, z + d / 2);
  };
  chungCu(-60, 72, 30, 14, 18); chungCu(-20, 74, 24, 12, 15); chungCu(-80, -40, 28, 12, 18, Math.PI);
  // Cao ốc kính
  const caoOc = (x, z, w, d, h, mau, ten, mauTen) => {
    const t = cuaSoCaoOc(mau, true).clone(); t.needsUpdate = true; t.repeat.set(w / 4, h / 4);
    const v = new THREE.MeshLambertMaterial({ map: t }), m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), [v, v, vl(0x4a5560), v, v, v]);
    m.position.set(x, h / 2, z); m.userData.rieng = true; nhom.add(m);
    can(x - w / 2, x + w / 2, z - d / 2, z + d / 2);
    if (ten) {
      const b = new THREE.Mesh(new THREE.PlaneGeometry(w * 0.9, w * 0.22), new THREE.MeshBasicMaterial({ map: bienHieu(ten, mauTen), fog: false }));
      b.position.set(x, h - w * 0.15, z + d / 2 + 0.05); nhom.add(b);
      const b2 = b.clone(); b2.rotation.y = Math.PI; b2.position.z = z - d / 2 - 0.05; nhom.add(b2);
    }
  };
  caoOc(25, 100, 16, 16, 62, "#5a86a8", "SKY ẢO", ["#1c1c1f", "#7fd3ff"]);
  caoOc(25, 122, 14, 14, 54, "#5a86a8", "SKY ẢO 2", ["#1c1c1f", "#7fd3ff"]);
  caoOc(-95, 90, 18, 18, 70, "#2a2c31", "LL-ENTERTAINMENT", ["#7a1424", "#ffffff"]);
  caoOc(110, 85, 20, 20, 96, "#6f8fa8", "LANDMARK ƯỚC MƠ", ["#1f4fa8", "#ffffff"]);
  caoOc(-30, -75, 18, 18, 44, "#8a9aa8", "THƯƠNG XÁ HÓNG", ["#e8702a", "#ffffff"]);
  caoOc(90, -60, 16, 16, 38, "#9aa8b0", null);
  caoOc(-130, 8, 18, 18, 34, "#a8b0a0", null);
  caoOc(140, 10, 18, 18, 50, "#5a86a8", null);
  // khối nhà xa làm nền
  for (let i = 0; i < 28; i++) {
    const goc = (i / 28) * Math.PI * 2, kc = 175 + rnd() * 40;
    const x = Math.cos(goc) * kc, z = 20 + Math.sin(goc) * kc, h = 12 + rnd() * 40, w = 14 + rnd() * 12;
    const t = cuaSoCaoOc(chon(["#b9b0a0", "#a8b8c8", "#c8b8a8", "#9fb0a0"]), rnd() < 0.5).clone(); t.needsUpdate = true; t.repeat.set(w / 4, h / 4);
    const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, w), new THREE.MeshLambertMaterial({ map: t })); m.position.set(x, h / 2, z); m.userData.rieng = true; nhom.add(m);
  }
  // biển quảng cáo trên nóc nhà
  const bangQC = (x, z, y, xoay, tex) => {
    const g = new THREE.Group(); g.position.set(x, y, z); g.rotation.y = xoay;
    const m = new THREE.Mesh(new THREE.PlaneGeometry(9, 4.5), new THREE.MeshBasicMaterial({ map: tex })); m.position.y = 3.6; g.add(m);
    for (const s of [-1, 1]) H(0.2, 3.5, 0.2, 0x3a3d44, s * 3.5, 0, -0.2, g);
    H(9.2, 0.2, 0.3, 0x3a3d44, 0, 1.25, -0.15, g);
    nhom.add(g);
  };
  bangQC(-40, 50, 16, Math.PI, quangCao("SIÊU NHÂN HỒNG", "ĐẠI NHẠC HỘI SIÊU NHÂN 31.10", ["#f26fa6", "#7b2a52"], "#ffffff"));
  bangQC(30, 52, 17, Math.PI, quangCao("TRÀ SỮA HÓNG HỚT", "MUA 1 TẶNG 1 - CHỈ HÔM NAY", ["#ffcf3a", "#e8702a"], "#3a1d0a"));
  bangQC(-70, 24, 17, 0, quangCao("LL-ENTERTAINMENT", "NGÔI SAO MỚI - ĐÓN XEM", ["#2a2c31", "#7a1424"], "#ffffff"));
  bangQC(100, 50, 18, Math.PI, quangCao("NHÀ ĐẤT ƯỚC MƠ", "SỔ HỒNG RIÊNG - 0900 000 069", ["#2e8b57", "#1f4fa8"], "#ffffff"));

  // ---------- Vỉa hè: cột điện, dây điện, cây, đèn ----------
  const day = [];
  const cotDien = (x, z) => {
    H(0.28, 9, 0.28, 0x9a958a, x, 0, z); H(1.6, 0.12, 0.12, 0x8a857a, x, 7.8, z); H(1.2, 0.12, 0.12, 0x8a857a, x, 6.9, z);
    if (rnd() < 0.3) { const b = new THREE.Mesh(new THREE.CylinderGeometry(0.3, 0.3, 0.8, 8), vl(0x6d7175)); b.position.set(x + 0.3, 6.2, z); nhom.add(b); }
    can(x - 0.25, x + 0.25, z - 0.25, z + 0.25); thanDung.push([x, z]);
  };
  const noiDay = (a, b) => {
    for (let k = 0; k < 7; k++) {
      const y0 = 6.6 + (k % 4) * 0.45 + (k > 3 ? 0.2 : 0), lech = (k - 3) * 0.12, vong = 0.5 + rnd() * 0.9;
      let truoc = null;
      for (let i = 0; i <= 8; i++) {
        const t = i / 8, x = a[0] + (b[0] - a[0]) * t, z = a[1] + (b[1] - a[1]) * t + lech, y = y0 - Math.sin(t * Math.PI) * vong;
        if (truoc) day.push(...truoc, x, y, z); truoc = [x, y, z];
      }
    }
  };
  // cây xanh trồng sát mép vỉa hè (không đâm qua bạt che nắng), tán nghiêng ra phía lòng đường;
  // ra: hướng ra lòng đường [dx, dz]; tránh đứng trùng chỗ cột điện đã dựng
  const thanDung = [];
  const cayXanh = (x, z, s = 1, ra = [0, 0]) => {
    for (const [px, pz] of thanDung) if (Math.abs(px - x) < 1.1 && Math.abs(pz - z) < 1.1) { if (ra[0]) z += 1.6; else x += 1.6; }
    const t = new THREE.Mesh(new THREE.CylinderGeometry(0.18 * s, 0.26 * s, 7.2 * s, 7), vl(0x6b4a2f)); t.position.set(x, 3.6 * s, z); nhom.add(t);
    const v = new THREE.Mesh(new THREE.CylinderGeometry(0.3 * s, 0.3 * s, 1, 7), vl(0xf2f2f2)); v.position.set(x, 0.5, z); nhom.add(v);
    for (let i = 0; i < 4; i++) {
      const l = new THREE.Mesh(new THREE.IcosahedronGeometry((1.0 + rnd() * 0.5) * s, 0), vl(chon([0x3d7a34, 0x4f8a3c, 0x2f6b2a])));
      const doc = (rnd() - 0.5) * 1.8 * s, ngang = 0.7 + (rnd() - 0.5) * 0.6; // dọc theo hàng / lệch ra đường
      l.position.set(x + (ra[0] ? ra[0] * ngang : doc), (7.2 + rnd() * 1.2) * s, z + (ra[1] ? ra[1] * ngang : doc)); nhom.add(l);
    }
    can(x - 0.3, x + 0.3, z - 0.3, z + 0.3); thanDung.push([x, z]);
  };
  const vlDenDuong = dong(new THREE.MeshBasicMaterial({ color: 0xf3efe6 }));
  const denDuong = (x, z, huong) => {
    H(0.16, 7, 0.16, 0x5a5d63, x, 0, z);
    H(0.1, 0.1, 2.2, 0x5a5d63, x, 6.9, z + huong * 1.1);
    const d = new THREE.Mesh(new THREE.BoxGeometry(0.5, 0.12, 0.8), vlDenDuong); d.position.set(x, 6.8, z + huong * 2.1); nhom.add(d); denDem.push(d);
    thanDung.push([x, z]);
  };
  // dọc đường Hóng
  let truoc = null, truoc2 = null;
  for (let x = -146; x <= 146; x += 16) {
    if (x > 40 && x < 64) { truoc = truoc2 = null; continue; }
    const zb = 32.0, zn = 42.0;
    const trongSK = x > SK.x1 - 1 && x < SK.x2 + 1; // chừa lối vào quảng trường sân khấu
    if (trongSK) truoc = null;
    const xb = veRanh("bac:30", x), xn = veRanh("nam:44.5", x + 8);
    if (Math.abs(x - 2) > 4 && !trongSK) { cotDien(xb, zb); if (truoc) noiDay(truoc, [xb, zb]); truoc = [xb, zb]; }
    cotDien(xn, zn); if (truoc2) noiDay(truoc2, [xn, zn]); truoc2 = [xn, zn];
    if (rnd() < 0.5) noiDay([xn, zn], [xn + (rnd() - 0.5) * 4, 44.5]); // dây kéo vào nhà
    if (Math.abs(x + 4 - 2) > 5 && !(x + 4 > 6 && x + 4 < 14)) cayXanh(veRanh("nam:44.5", x + 4), 41.85, 1, [0, -1]);
    if ((x + 146) % 32 === 0) { if (Math.abs(x - 12) > 5 && !trongSK) denDuong(veRanh("bac:30", x + 2), 32.1, 1); }
    if ((x < -26 || x > 26) && !(x + 12 > SK.x1 - 1 && x + 12 < SK.x2 + 1)) cayXanh(veRanh("bac:30", x + 12), 32.15, 0.9, [0, 1]);
  }
  // dọc đại lộ Ước Mơ
  truoc = truoc2 = null;
  for (let z = -90; z <= 130; z += 16) {
    if (z > 24 && z < 50) { truoc = truoc2 = null; continue; }
    const zd = veRanh("dong:44", z), zt = veRanh("tay:60", z + 8);
    cotDien(46.4, zd); if (truoc) noiDay(truoc, [46.4, zd]); truoc = [46.4, zd];
    cotDien(57.6, zt); if (truoc2) noiDay(truoc2, [57.6, zt]); truoc2 = [57.6, zt];
    cayXanh(46.6, veRanh("dong:44", z + 6), 1, [1, 0]); cayXanh(57.4, veRanh("tay:60", z + 2), 1, [-1, 0]);
  }
  // dây điện trong hẻm
  noiDay([8.2, 46], [11.8, 60]); noiDay([11.8, 46], [8.2, 68]); noiDay([8.2, 60], [11.8, 78]);
  const gd = new THREE.BufferGeometry(); gd.setAttribute("position", new THREE.Float32BufferAttribute(day, 3));
  const dayDien = new THREE.LineSegments(gd, new THREE.LineBasicMaterial({ color: 0x111111 })); dayDien.userData.rieng = true; nhom.add(dayDien);

  // ---------- Đèn giao thông ----------
  const denGT = { chinh: {}, ngang: {} };
  for (const k of ["chinh", "ngang"]) for (const [mau, c] of [["do", 0xff2a2a], ["vang", 0xffc23a], ["xanh", 0x2aff6a]]) denGT[k][mau] = new THREE.MeshBasicMaterial({ color: 0x222222, userData: { bat: c, dong: true } });
  const cotDen = (x, z, xoay, nhomDen) => {
    const g = new THREE.Group(); g.position.set(x, 0, z); g.rotation.y = xoay;
    H(0.18, 3.4, 0.18, 0x2a2c31, 0, 0, 0, g); H(0.45, 1.25, 0.35, 0x1a1a1a, 0, 3.0, 0, g);
    [["do", 4.0], ["vang", 3.62], ["xanh", 3.24]].forEach(([m, y]) => { const d = new THREE.Mesh(new THREE.CircleGeometry(0.14, 12), denGT[nhomDen][m]); d.position.set(0, y, 0.18); g.add(d); });
    nhom.add(g); can(x - 0.2, x + 0.2, z - 0.2, z + 0.2);
  };
  cotDen(45.6, 42.8, -Math.PI / 2, "chinh"); cotDen(58.4, 31.4, Math.PI / 2, "chinh");
  cotDen(45.6, 31.2, Math.PI, "ngang"); cotDen(58.4, 43.0, 0, "ngang");

  // ---------- Đồ vỉa hè: quán, xe dựng, trạm buýt, băng rôn ----------
  const gheNhua = (x, z) => { const c = chon([0xc0262d, 0x2a5aa8, 0x2e8b57]); H(0.32, 0.04, 0.32, c, x, 0.4, z); for (const [a, b] of [[-1, -1], [1, -1], [-1, 1], [1, 1]]) H(0.04, 0.4, 0.04, c, x + a * 0.13, 0, z + b * 0.13); };
  const banThap = (x, z) => { H(0.7, 0.04, 0.5, chon([0x2a5aa8, 0xc0262d, 0xd9c9a8]), x, 0.55, z); H(0.06, 0.55, 0.06, 0x555555, x, 0, z); };
  const quanTraDa = (x, z) => {
    banThap(x, z); for (const [a, b] of [[-0.6, 0], [0.6, 0], [0, 0.55]]) gheNhua(x + a, z + b);
    const binh = new THREE.Mesh(new THREE.CylinderGeometry(0.16, 0.16, 0.4, 8), vl(chon([0xe8702a, 0x2a5aa8]))); binh.position.set(x + 0.2, 0.79, z); nhom.add(binh);
    const du = new THREE.Mesh(new THREE.ConeGeometry(1.5, 0.6, 8, 1, true), vl(chon([0xf26fa6, 0x2e8b57, 0xe8702a, 0x2a5aa8]), { side: THREE.DoubleSide })); du.position.set(x, 2.4, z); nhom.add(du); H(0.05, 2.1, 0.05, 0xdddddd, x, 0, z);
    can(x - 0.8, x + 0.8, z - 0.4, z + 0.8);
    choNguoiDung.push({ x: x - 0.6, z, huong: Math.PI / 2, ngoi: true }, { x: x + 0.6, z, huong: -Math.PI / 2, ngoi: true });
  };
  const xeBanhMi = (x, z, ten = "BÁNH MÌ") => {
    H(1.4, 0.8, 0.7, 0xb08a5a, x, 0.15, z); H(1.4, 0.6, 0.7, 0xcfe7f2, x, 0.95, z); H(1.5, 0.06, 0.8, 0xc0262d, x, 1.55, z);
    const b = new THREE.Mesh(new THREE.PlaneGeometry(1.3, 0.35), new THREE.MeshBasicMaterial({ map: bienHieu(ten, ["#c0262d", "#ffe14d"]) })); b.position.set(x, 1.8, z + 0.36); nhom.add(b);
    for (const s of [-1, 1]) { const bx = new THREE.Mesh(new THREE.CylinderGeometry(0.15, 0.15, 0.06, 8), vl(0x1a1a1a)); bx.rotation.x = Math.PI / 2; bx.position.set(x + s * 0.5, 0.15, z + 0.36); nhom.add(bx); }
    can(x - 0.75, x + 0.75, z - 0.4, z + 0.4);
    choNguoiDung.push({ x, z: z - 0.8, huong: 0, them: rnd() < 0.5 ? ["nonLa"] : [] });
  };
  const xeDung = (x, z, xoay) => { const m = taoXeMay(chon(MAU_XE), rnd() < 0.5 ? "ga" : "so"); m.position.set(x, 0, z); m.rotation.y = xoay; nhom.add(m); if (z < 37) can(x - 0.85, x + 0.85, z - 0.4, z + 0.4); };
  // xe máy dựng trước nhà (dãy nam)
  for (let x = -146; x < 140; x += 3.4) {
    if ((x > 6 && x < 14) || (x > 42 && x < 62)) continue;
    if (rnd() < 0.55) for (let i = 0; i < 1 + Math.floor(rnd() * 3); i++) xeDung(x + i * 0.75, 43.7, Math.PI * 0.5 + 0.3);
  }
  for (let x = -146; x < 140; x += 5) if ((x < -26 || (x > 26 && x < 42) || x > 62) && !(x > SK.x1 - 2 && x < SK.x2 + 2) && rnd() < 0.4) xeDung(x, 30.6, -Math.PI * 0.5 + 0.3);
  for (const [a, b] of [[-146, 6], [14, 42], [62, 140]]) can(a, b, 43.25, 44.2); // hàng xe dựng sát mặt tiền (đi bộ phía ngoài)
  // quán vỉa hè
  for (const x of [-120, -86, -52, -14, 22, 76, 112]) quanTraDa(x, 43.4);
  xeBanhMi(-6, 43.3); xeBanhMi(40, 43.3, "HỦ TIẾU GÕ"); xeBanhMi(13.5, 43.3, "CHÈ BÀ BẢY"); xeBanhMi(66, 31.2, "NƯỚC MÍA"); xeBanhMi(-40, 31.1, "BÁNH MÌ BỰA");
  for (const z of [-40, 0, 64, 100]) quanTraDa(45.4, z);
  // trạm xe buýt
  const tram = (x, z) => {
    H(4, 0.1, 1.6, 0x2e9a4a, x, 2.6, z); H(4, 2.4, 0.08, 0x9fd3f2, x, 0.2, z + 0.75); H(0.08, 2.6, 0.08, 0x3a3d44, x - 1.9, 0, z - 0.7); H(0.08, 2.6, 0.08, 0x3a3d44, x + 1.9, 0, z - 0.7);
    H(3, 0.08, 0.4, 0x8a8d92, x, 0.45, z + 0.4);
    const qc = new THREE.Mesh(new THREE.PlaneGeometry(1.6, 1.6), new THREE.MeshBasicMaterial({ map: quangCao("SIÊU NHÂN HỒNG", "1 TRIỆU FOLLOW?", ["#f26fa6", "#7b2a52"], "#ffffff") })); qc.position.set(x + 0.9, 1.4, z + 0.7); qc.rotation.y = Math.PI; nhom.add(qc);
    const bien = new THREE.Mesh(new THREE.PlaneGeometry(0.8, 0.5), new THREE.MeshBasicMaterial({ map: bienHieu("TRẠM BUÝT 69", ["#2e9a4a", "#ffffff"]), side: THREE.DoubleSide })); bien.position.set(x - 2.3, 2.7, z - 0.6); nhom.add(bien); H(0.06, 2.5, 0.06, 0x3a3d44, x - 2.3, 0, z - 0.6);
    can(x - 2, x + 2, z + 0.65, z + 0.85);
    choNguoiDung.push({ x: x - 0.5, z: z + 0.2, huong: Math.PI, ngoi: true }, { x: x + 0.6, z: z - 0.2, huong: Math.PI });
  };
  tram(-30, 42.6); tram(90, 42.6);
  // ba gác đỗ
  for (const [x, z, r] of [[-100, 30.9, -Math.PI / 2], [120, 43.6, Math.PI / 2]]) { const b = taoBaGac(); b.position.set(x, 0, z); b.rotation.y = r; nhom.add(b); can(x - 1, x + 1, z - 0.8, z + 0.8); }
  // thùng rác
  for (let x = -140; x < 140; x += 24) { const t = new THREE.Mesh(new THREE.CylinderGeometry(0.3, 0.26, 0.9, 8), vl(0x2e8b57)); t.position.set(x + 5, 0.45, 42.1); nhom.add(t); }
  // băng rôn qua đường
  const bangRon = (x, chu, mau) => {
    for (const z of [32.2, 41.8]) H(0.12, 7.4, 0.12, 0x5a5d63, x, 0, z);
    const b = new THREE.Mesh(new THREE.PlaneGeometry(9.6, 1.1), new THREE.MeshBasicMaterial({ map: bienHieu(chu, mau), side: THREE.DoubleSide }));
    b.position.set(x, 6.8, 37); b.rotation.y = Math.PI / 2; nhom.add(b);
  };
  bangRon(-24, "CHÀO MỪNG NGÀY PHỤ NỮ VIỆT NAM 20-10", ["#c0262d", "#ffe14d"]);
  bangRon(veRanh("nam:44.5", 76), "QUẬN HÓNG - SỐNG XANH, SỐNG HÓNG", ["#1f4fa8", "#ffffff"]);

  // ---------- Ranh giới khu vực đi được ----------
  can(-200, -PHO.gioiHanX, 29, 46); can(PHO.gioiHanX, 200, 29, 46);
  // khối kín phía sau các dãy nhà (không cho đi lọt ra sau)
  can(-200, -24.2, -200, 18.5); can(24.2, 44, -200, 20); can(60, SK.x1 - 0.6, -200, 29.9); can(SK.x2 + 0.6, 200, -200, 29.9); can(SK.x1, SK.x2, -200, SK.z1);
  dungSanKhau(nhom, can);
  can(-200, 8, 56.4, 300); can(12, 44, 56.4, 300); can(60, 200, 44.4, 300); can(-24.2, 24.2, -200, -18.2);
  can(43, 61, -200, PHO.gioiHanZ[0]); can(43, 61, PHO.gioiHanZ[1], 300);
  for (const x of [-PHO.gioiHanX, PHO.gioiHanX]) for (let z = 31; z < 44; z += 2.2) { H(1.8, 0.9, 0.3, 0xe8702a, x, 0, z); H(1.8, 0.15, 0.31, 0xf2f2f2, x, 0.5, z); }

  // ---------- Làn xe và lối đi bộ cho giao thông ----------
  const lan = [
    { truc: "x", huong: 1, oto: 39.3, xeMay: 40.5, tu: -190, den: 190, dung: 46.0, nhom: "chinh" },
    { truc: "x", huong: -1, oto: 34.7, xeMay: 33.5, tu: -190, den: 190, dung: 58.0, nhom: "chinh" },
    { truc: "z", huong: 1, oto: 50.6, xeMay: 48.3, tu: -130, den: 160, dung: 31.6, nhom: "ngang" },
    { truc: "z", huong: -1, oto: 53.4, xeMay: 55.7, tu: -130, den: 160, dung: 42.4, nhom: "ngang" },
  ];
  const loiDi = [
    { truc: "x", co: 31.0, tu: -145, den: -1 }, { truc: "x", co: 31.0, tu: 5, den: 44 }, { truc: "x", co: 31.0, tu: 61, den: 145 },
    { truc: "x", co: 42.7, tu: -145, den: 44 }, { truc: "x", co: 42.7, tu: 61, den: 145 },
    { truc: "z", co: 45.6, tu: -90, den: 29 }, { truc: "z", co: 45.6, tu: 46, den: 130 },
    { truc: "z", co: 58.4, tu: -90, den: 29 }, { truc: "z", co: 58.4, tu: 46, den: 130 },
    { truc: "z", co: 10, tu: 47, den: 80 },
  ];
  return { matUot, kinhDem, trongQuan, denGT, lan, loiDi, choNguoiDung, rnd };
}

function bienDoc(chu) {
  return chuTex("doc" + chu, 64, 256, (g) => {
    g.fillStyle = "#c0262d"; g.fillRect(0, 0, 64, 256); g.fillStyle = "#ffe14d"; g.textAlign = "center"; g.font = "800 30px 'Be Vietnam Pro', system-ui";
    const ds = chu.split(" ").join("").split(""); ds.slice(0, 8).forEach((k, i) => g.fillText(k, 32, 34 + i * 30));
  });
}
function dongHo() {
  return chuTex("dongho", 128, 128, (g) => {
    g.fillStyle = "#f6f1e3"; g.beginPath(); g.arc(64, 64, 62, 0, 7); g.fill(); g.strokeStyle = "#3a2a1a"; g.lineWidth = 6; g.stroke();
    g.lineWidth = 4; for (let i = 0; i < 12; i++) { const a = i / 12 * Math.PI * 2; g.beginPath(); g.moveTo(64 + Math.cos(a) * 50, 64 + Math.sin(a) * 50); g.lineTo(64 + Math.cos(a) * 58, 64 + Math.sin(a) * 58); g.stroke(); }
    g.lineWidth = 6; g.beginPath(); g.moveTo(64, 64); g.lineTo(64, 26); g.stroke(); g.beginPath(); g.moveTo(64, 64); g.lineTo(92, 64); g.stroke();
  });
}
