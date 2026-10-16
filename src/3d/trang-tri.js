// Trang trí công ty G-Entertainment cho sống động và đúng kiểu một công ty nhỏ ở Sài Gòn:
// mặt tiền sơn mới nhiều màu, sân trước có lối đi, cột cờ, nhà xe, hoa giấy trên hàng rào;
// bên trong mỗi phòng một màu tường, thảm, đồ dùng trên bàn, bếp pantry, phòng giám đốc.
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";
import { taoOto } from "./xe-3d.js";

const texCache = new Map();
function tranh(key, w, h, ve) {
  if (texCache.has(key)) return texCache.get(key);
  const c = document.createElement("canvas"); c.width = w; c.height = h; ve(c.getContext("2d"), w, h);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 8; texCache.set(key, t); return t;
}
const chuGiua = (g, chu, w, y, co, mau, dam = 800) => { g.fillStyle = mau; g.textAlign = "center"; g.textBaseline = "middle"; g.font = `${dam} ${co}px 'Be Vietnam Pro', system-ui, sans-serif`; g.fillText(chu, w / 2, y); };

export function trangTriCongTy(scene, hop, CAO, denDem) {
  const y2 = CAO, y3 = CAO * 2;
  const add = (m) => { scene.add(m); return m; };
  // khối trang trí không va chạm
  const K = (w, h, d, c, x, y, z, tang = 0) => hop(w, h, d, c, x, y, z, { can: false, tang });
  // khối có va chạm
  const V = (w, h, d, c, x, y, z, tang = 0) => hop(w, h, d, c, x, y, z, { tang });
  // mặt phẳng dựng đứng (sơn tường, tranh) và nằm ngang (thảm, sàn)
  const dung = (w, h, mat, x, y, z, rotY) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, h), typeof mat === "number" ? new THREE.MeshLambertMaterial({ color: mat }) : mat); m.position.set(x, y, z); m.rotation.y = rotY; return add(m); };
  const nam = (w, d, mat, x, y, z) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, d), typeof mat === "number" ? new THREE.MeshLambertMaterial({ color: mat }) : mat); m.rotation.x = -Math.PI / 2; m.position.set(x, y, z); return add(m); };
  const tru = (r, h, c, x, y, z) => { const m = new THREE.Mesh(new THREE.CylinderGeometry(r, r, h, 10), vl(c)); m.position.set(x, y + h / 2, z); return add(m); };
  const cau = (r, c, x, y, z) => { const m = new THREE.Mesh(new THREE.IcosahedronGeometry(r, 0), vl(c)); m.position.set(x, y, z); return add(m); };
  const vlDen = new THREE.MeshBasicMaterial({ color: 0xf3efe6 }); vlDen.userData.dong = true;

  // ================= MẶT TIỀN SƠN MỚI =================
  const Z = 14.13; // mặt ngoài tường trước
  K(40.4, 0.45, 0.16, 0x4a4f57, 0, 0, Z + 0.08);                       // chân tường đá
  K(40.6, 0.5, 0.3, 0xe8702a, 0, 3.55, Z + 0.15);                       // dải cam thương hiệu giữa hai tầng
  K(40.6, 0.12, 0.34, 0xffffff, 0, 4.05, Z + 0.17);
  K(40.6, 0.5, 0.3, 0x2fa39a, 0, 7.55, Z + 0.15);                       // viền mái xanh ngọc
  // lam che nắng nhiều màu trước dải kính tầng 2 (chừa chỗ biển hiệu và băng rôn)
  const MAU_LAM = [0xf26fa6, 0xffcf3a, 0x2fa39a, 0xe8702a];
  let i = 0;
  for (let x = -19.2; x <= 19.2; x += 1.2) { if ((x > -4.5 && x < 8.5) || (x > 13.4 && x < 16.6)) continue; K(0.12, 2.7, 0.55, MAU_LAM[i++ % 4], x, 4.55, Z + 0.32); }
  // trụ hai bên cửa chính và khung cửa kính trượt
  V(0.5, 2.9, 0.3, 0x2fa39a, -0.25, 0, Z + 0.15); V(0.5, 2.9, 0.3, 0x2fa39a, 4.25, 0, Z + 0.15);
  // băng rôn dọc treo mặt tiền
  dung(1.6, 3.2, new THREE.MeshLambertMaterial({ map: tranh("bangronsnh", 160, 320, (g, w, h) => {
    const gr = g.createLinearGradient(0, 0, 0, h); gr.addColorStop(0, "#f26fa6"); gr.addColorStop(1, "#b8336f"); g.fillStyle = gr; g.fillRect(0, 0, w, h);
    chuGiua(g, "SIÊU", w, 70, 40, "#fff"); chuGiua(g, "NHÂN", w, 120, 40, "#fff"); chuGiua(g, "HỒNG", w, 170, 40, "#fff");
    chuGiua(g, "1 TRIỆU", w, 240, 28, "#ffe14d"); chuGiua(g, "FOLLOW", w, 275, 28, "#ffe14d");
  }) }), 15, 6.0, Z + 0.35, 0);
  K(1.8, 0.06, 0.06, 0x3a3d44, 15, 7.62, Z + 0.35); K(1.8, 0.06, 0.06, 0x3a3d44, 15, 4.38, Z + 0.35);
  // bảng giờ làm việc cạnh cửa, thảm chùi chân
  dung(0.8, 0.5, new THREE.MeshLambertMaterial({ map: tranh("giolam", 200, 125, (g, w, h) => { g.fillStyle = "#1c1c1f"; g.fillRect(0, 0, w, h); chuGiua(g, "GIỜ LÀM VIỆC", w, 34, 22, "#e8702a"); chuGiua(g, "T2 - T6: 8:00 - 17:30", w, 70, 18, "#fff", 600); chuGiua(g, "(OT: tùy deadline)", w, 100, 15, "#aaa", 500); }) }), -2.4, 1.6, Z + 0.02, 0);
  nam(2.4, 1.2, 0x7a1424, 2, 0.008, Z + 0.75);

  // tranh tường hai bên hông
  const tuongDong = tranh("tranhtuongdong", 640, 320, (g, w, h) => {
    const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#ffd166"); gr.addColorStop(0.5, "#f26fa6"); gr.addColorStop(1, "#7b4bb3"); g.fillStyle = gr; g.fillRect(0, 0, w, h);
    for (let k = 0; k < 18; k++) { g.fillStyle = `rgba(255,255,255,${0.08 + (k % 3) * 0.05})`; g.beginPath(); g.arc((k * 97) % w, (k * 53) % h, 20 + (k % 4) * 14, 0, 7); g.fill(); }
    // siêu nhân hồng cách điệu: thân, áo choàng, nắm tay giơ cao
    g.fillStyle = "#7a1d4a"; g.beginPath(); g.moveTo(170, 120); g.lineTo(110, 290); g.lineTo(240, 290); g.closePath(); g.fill();
    g.fillStyle = "#ff8ac0"; g.fillRect(150, 120, 70, 120); g.fillRect(150, 240, 28, 60); g.fillRect(192, 240, 28, 60);
    g.fillRect(205, 60, 22, 70); g.beginPath(); g.arc(216, 55, 16, 0, 7); g.fill();
    g.fillStyle = "#ff8ac0"; g.beginPath(); g.arc(185, 95, 30, 0, 7); g.fill(); g.fillStyle = "#1c1c1f"; g.fillRect(165, 85, 40, 14);
    g.fillStyle = "#fff"; g.save(); g.translate(185, 180); g.rotate(-0.6); g.fillRect(-4, -55, 8, 110); g.restore();
    chuGiua(g, "QUẬN HÓNG", w + 220, 120, 54, "#fff", 900); chuGiua(g, "CÓ SIÊU NHÂN", w + 220, 185, 54, "#fff", 900);
    chuGiua(g, "G-ENTERTAINMENT · TỪ 2010", w + 220, 245, 24, "#fff", 700);
  });
  dung(12, 6, new THREE.MeshLambertMaterial({ map: tuongDong }), 20.14, 3.6, 2, Math.PI / 2);
  const tuongTay = tranh("tranhtuongtay", 512, 256, (g, w, h) => {
    const mau = ["#2fa39a", "#ffcf3a", "#e8702a", "#f26fa6", "#3fa8ff", "#7b4bb3"];
    for (let k = -6; k < 16; k++) { g.fillStyle = mau[(k + 12) % 6]; g.beginPath(); g.moveTo(k * 48, 0); g.lineTo(k * 48 + 48, 0); g.lineTo(k * 48 + 48 + 128, h); g.lineTo(k * 48 + 128, h); g.closePath(); g.fill(); }
    g.fillStyle = "rgba(0,0,0,.25)"; g.fillRect(0, h / 2 - 34, w, 68); chuGiua(g, "VIỆC HÔM NAY · ĐỂ MAI TÍNH", w, h / 2, 30, "#fff", 900);
  });
  dung(12, 5, new THREE.MeshLambertMaterial({ map: tuongTay }), -20.14, 3.4, 2, -Math.PI / 2);
  // cục nóng máy lạnh và ống đồng bên hông
  for (const z of [-10, -6, 6, 10]) { V(0.55, 0.65, 0.95, 0xf2f2f2, 20.45, 0, z); K(0.42, 0.42, 0.02, 0x8a8d92, 20.74, 0.12, z); K(0.05, 3.2, 0.05, 0xd9a24a, 20.18, 0.6, z + 0.3); }
  for (const z of [-10, 6]) { V(0.55, 0.65, 0.95, 0xf2f2f2, -20.45, 0, z); K(0.05, 3.2, 0.05, 0xd9a24a, -20.18, 0.6, z + 0.3); }

  // ================= SÂN TRƯỚC =================
  // lối đi lát đá từ cổng vào cửa
  const da = tranh("lotda", 64, 64, (g) => { g.fillStyle = "#cfc6b4"; g.fillRect(0, 0, 64, 64); g.strokeStyle = "#a89e8a"; g.lineWidth = 3; g.strokeRect(2, 2, 60, 28); g.strokeRect(-30, 34, 60, 28); g.strokeRect(34, 34, 60, 28); }).clone();
  da.wrapS = da.wrapT = THREE.RepeatWrapping; da.repeat.set(2, 8); da.needsUpdate = true;
  nam(4.4, 15.6, new THREE.MeshLambertMaterial({ map: da }), 2, 0.006, 22.1);
  // bồn hoa thấp dọc lối đi (chừa lối rẽ sang nhà xe và chòi bảo vệ)
  for (const [x, z1, z2] of [[-0.55, 15.6, 21], [4.55, 15.6, 20.4]]) {
    V(0.5, 0.35, z2 - z1, 0x9a8f7c, x, 0, (z1 + z2) / 2);
    for (let z = z1 + 0.3; z < z2; z += 0.55) cau(0.26, z % 2 > 1 ? 0x4f8a3c : 0x3d7a34, x, 0.5, z);
    for (let z = z1 + 0.5; z < z2; z += 1.1) cau(0.1, [0xff4fa3, 0xffcf3a, 0xffffff][Math.floor(z) % 3], x + 0.12, 0.72, z);
  }
  // đèn sân vườn hai bên lối đi
  for (const z of [17, 20, 23, 26]) for (const x of [-0.95, 4.95]) { K(0.08, 0.8, 0.08, 0x2a2c31, x, 0, z); const d = new THREE.Mesh(new THREE.BoxGeometry(0.22, 0.22, 0.22), vlDen); d.position.set(x, 0.9, z); add(d); denDem.push(d); }
  // cột cờ công ty
  tru(0.07, 7, 0xd5d9dd, -3.6, 0, 17.5); V(0.8, 0.3, 0.8, 0x9a8f7c, -3.6, 0, 17.5);
  dung(1.5, 1.0, new THREE.MeshLambertMaterial({ side: THREE.DoubleSide, map: tranh("cocongty", 150, 100, (g, w, h) => { g.fillStyle = "#e8702a"; g.fillRect(0, 0, w, h); chuGiua(g, "G", w, 52, 64, "#fff", 900); }) }), -2.82, 6.4, 17.5, 0);
  // nhà xe nhân viên có mái tôn
  for (const x of [9.4, 13.9, 18.4]) for (const z of [22.0, 24.8]) V(0.1, 2.4, 0.1, 0x5a5d63, x, 0, z);
  { const m = new THREE.Mesh(new THREE.BoxGeometry(9.4, 0.06, 3.4), vl(0x2e8b57)); m.position.set(13.9, 2.45, 23.4); m.rotation.x = 0.06; add(m); }
  dung(1.8, 0.4, new THREE.MeshLambertMaterial({ map: tranh("nhaxe", 270, 60, (g, w, h) => { g.fillStyle = "#1f4fa8"; g.fillRect(0, 0, w, h); chuGiua(g, "NHÀ XE NHÂN VIÊN", w, h / 2, 26, "#fff"); }) }), 13.9, 2.2, 24.86, 0);
  // chỗ đỗ xe giám đốc (xe sếp màu đen bóng) có vạch kẻ và biển
  const xeSep = taoOto(0x1c1c1f); xeSep.position.set(11.6, 0, 18.6); xeSep.rotation.y = Math.PI / 2; add(xeSep);
  hop(4.4, 1.2, 1.9, 0x000000, 11.6, 0, 18.6).visible = false; // khối va chạm của xe
  for (const z of [17.4, 19.8]) nam(5.2, 0.1, 0xf2f2f2, 11.6, 0.007, z);
  dung(0.9, 0.45, new THREE.MeshLambertMaterial({ map: tranh("chosep", 180, 90, (g, w, h) => { g.fillStyle = "#ffffff"; g.fillRect(0, 0, w, h); g.strokeStyle = "#c0262d"; g.lineWidth = 6; g.strokeRect(3, 3, w - 6, h - 6); chuGiua(g, "CHỖ ĐỖ XE", w, 32, 22, "#c0262d"); chuGiua(g, "GIÁM ĐỐC", w, 62, 22, "#c0262d"); }) }), 14.7, 1.2, 18.6, -Math.PI / 2);
  K(0.06, 1.0, 0.06, 0x5a5d63, 14.76, 0, 18.6);
  // hoa giấy hồng leo trên hàng rào trước
  for (let x = -23.5; x < 23.5; x += 0.9) {
    if (x > -1 && x < 5) continue;
    cau(0.32 + ((x * 7) % 3) * 0.05, 0x3d7a34, x, 1.55, 29.85);
    if (Math.abs(x * 3) % 2 < 1.3) cau(0.2, [0xe0338a, 0xf26fa6, 0xc71f74][Math.floor(Math.abs(x)) % 3], x + 0.2, 1.72, 30.0);
  }
  // hộp thư, camera an ninh ở cổng
  K(0.06, 1.1, 0.06, 0x3a3d44, -0.9, 0, 30.55); K(0.36, 0.28, 0.24, 0xc0262d, -0.9, 1.1, 30.55); K(0.2, 0.02, 0.02, 0x111111, -0.9, 1.3, 30.68);
  K(0.14, 0.12, 0.26, 0xf2f2f2, -0.3, 2.45, 30.0); K(0.06, 0.06, 0.04, 0x111111, -0.3, 2.48, 30.15);
  // ghế đá dưới gốc cây, thùng rác phân loại
  for (const [x, z] of [[-12.4, 26.2], [17.6, 26.2]]) { V(1.5, 0.12, 0.5, 0xbfb6a4, x, 0.36, z); K(0.25, 0.36, 0.4, 0xa89e8a, x - 0.5, 0, z); K(0.25, 0.36, 0.4, 0xa89e8a, x + 0.5, 0, z); }
  for (const [x, c] of [[21.6, 0x2e8b57], [22.4, 0xe8702a]]) { V(0.5, 0.85, 0.5, c, x, 0, 28.9); K(0.54, 0.06, 0.54, 0x2a2c31, x, 0.85, 28.9); }
  // chậu cây to hai bên cửa chính
  for (const x of [-1.1, 5.1]) { tru(0.32, 0.6, 0x3a3d44, x, 0, 15.0); cau(0.55, 0x3d7a34, x, 1.15, 15.0); cau(0.35, 0x4f8a3c, x, 1.6, 15.0); }

  // ================= BÊN TRONG: MÀU TƯỜNG, SÀN =================
  const son = (w, h, c, x, y, z, rotY) => dung(w, h, c, x, y, z, rotY);
  // tầng 1: tường sau của các phòng (z = -14) mỗi phòng một màu
  son(9.7, 3.8, 0xfff1b8, -15, 1.9, -13.86, 0);   // kế toán: vàng chanh nhạt
  son(7.7, 3.8, 0xc8f0dc, -6, 1.9, -13.86, 0);    // HR: xanh bạc hà
  son(5.7, 3.8, 0x34405a, 1, 1.9, -13.86, 0);     // server: xanh than
  son(7.7, 3.8, 0xe3e6ea, 8, 1.9, -13.86, 0);     // kho: xám nhạt
  son(19.6, 3.8, 0xffe0c7, -19.86, 1.9, 4, Math.PI / 2); // khu làm việc chung: tường đào
  son(10.6, 3.8, 0xdaf2b0, 19.86, 1.9, 4, -Math.PI / 2); // pantry: xanh cốm
  // tầng 2
  son(11.7, 3.8, 0x2f5d50, -14, y2 + 1.9, -13.86, 0);    // giám đốc: xanh rêu đậm
  son(7.7, 3.8, 0xffd9a8, -4, y2 + 1.9, -13.86, 0);      // phó giám đốc: cam nhạt
  son(11.7, 3.8, 0xcfe8f7, 6, y2 + 1.9, -13.87, 0);      // phòng họp: xanh trời
  son(7.7, 3.8, 0xe3d0f5, 16, y2 + 1.9, -13.86, 0);      // phòng nghệ sĩ: tím oải hương
  son(7.7, 3.8, 0x3a3d48, -2, y2 + 1.9, 13.86, Math.PI); // dựng phim: xám tối
  son(11.7, 3.8, 0xfff0a8, 14, y2 + 1.9, 13.86, Math.PI); // sản xuất: vàng
  // sàn: thảm khu làm việc, sàn gỗ pantry và phòng giám đốc, thảm phòng họp
  const go = tranh("sango", 64, 64, (g) => { for (let k = 0; k < 4; k++) { g.fillStyle = ["#c9a27a", "#bf9670", "#d0aa82", "#c49c74"][k]; g.fillRect(0, k * 16, 64, 16); g.fillStyle = "rgba(0,0,0,.12)"; g.fillRect((k * 23) % 64, k * 16, 2, 16); } }).clone();
  go.wrapS = go.wrapT = THREE.RepeatWrapping; go.repeat.set(5, 8); go.needsUpdate = true;
  const tham = tranh("thamvp", 64, 64, (g) => { g.fillStyle = "#7f90a6"; g.fillRect(0, 0, 64, 64); g.fillStyle = "#73849a"; g.fillRect(0, 0, 32, 32); g.fillRect(32, 32, 32, 32); }).clone();
  tham.wrapS = tham.wrapT = THREE.RepeatWrapping; tham.repeat.set(9, 10); tham.needsUpdate = true;
  nam(17.4, 19.4, new THREE.MeshLambertMaterial({ map: tham }), -11, 0.007, 4.1);
  nam(10.6, 15.6, new THREE.MeshLambertMaterial({ map: go }), 14.5, 0.007, 6.1);
  nam(11.6, 9.6, new THREE.MeshLambertMaterial({ map: go }), -14, y2 + 0.007, -9);
  nam(6, 3.6, 0x22305a, -14, y2 + 0.01, -8.4);   // thảm trải dưới bàn giám đốc
  nam(9, 4.4, 0x5b6b8c, 6, y2 + 0.01, -9);       // thảm phòng họp

  // ================= ĐỒ DÙNG TRÊN BÀN LÀM VIỆC =================
  for (let hang = 0; hang < 2; hang++) for (let cot = 0; cot < 5; cot++) {
    const x = -18 + cot * 3, z = 1.5 + hang * 6, k = hang * 5 + cot;
    tru(0.045, 0.1, [0xf6f6f2, 0xe8702a, 0x2a5aa8, 0xf26fa6][k % 4], x - 0.6, 0.78, z + 0.1);   // ly
    K(0.24, 0.04 + (k % 3) * 0.03, 0.32, 0xf6f6f2, x + 0.55, 0.78, z + 0.05);                   // xấp giấy
    if (k % 2) { const kh = K(0.16, 0.12, 0.02, 0x6b4a2f, x - 0.35, 0.78, z - 0.3); kh.rotation.x = -0.3; } // khung ảnh
    tru(0.14, 0.32, 0x8a8d92, x + 0.75, 0, z + 0.35);                                          // thùng rác dưới bàn
    if (k % 3 === 1) K(0.18, 0.01, 0.18, 0xffcf3a, x + 0.5, 0.78, z + 0.32);                     // giấy note vàng
  }
  // bảng nhân viên của tháng, đồng hồ và lịch tường khu làm việc
  dung(1.4, 1.0, new THREE.MeshLambertMaterial({ map: tranh("nvthang", 280, 200, (g, w, h) => { g.fillStyle = "#fff7e0"; g.fillRect(0, 0, w, h); g.strokeStyle = "#d8b45a"; g.lineWidth = 10; g.strokeRect(5, 5, w - 10, h - 10); chuGiua(g, "NHÂN VIÊN CỦA THÁNG", w, 36, 22, "#7a1424"); g.fillStyle = "#cfd8e0"; g.fillRect(w / 2 - 40, 58, 80, 90); chuGiua(g, "?", w, 104, 56, "#7a8a9a"); chuGiua(g, "(đang chờ sếp chọn)", w, 172, 16, "#555", 500); }) }), -19.84, 1.7, -1.5, Math.PI / 2);

  // ================= PANTRY =================
  K(8, 0.7, 0.4, 0xf6f6f2, 14.5, 1.85, 13.62);                      // tủ bếp trên
  for (let k = 0; k < 5; k++) K(0.02, 0.6, 0.02, 0xb8bcc4, 11 + k * 1.6, 1.9, 13.41);
  K(0.6, 0.35, 0.4, 0x2a2c31, 16.8, 0.95, 13.05); K(0.36, 0.22, 0.01, 0x9fc6e8, 16.75, 1.0, 12.84); // lò vi sóng
  K(0.7, 0.03, 0.45, 0xb8bcc4, 13.4, 0.951, 13); tru(0.025, 0.25, 0xc0c4c8, 13.4, 0.95, 13.25);   // bồn rửa
  tru(0.09, 0.22, 0xf6f6f2, 15.4, 0.95, 13.05);                                                 // ấm đun nước
  for (const [x, z] of [[12, 6], [16, 6]]) { tru(0.16, 0.05, 0xf6f6f2, x, 0.75, z); for (let k = 0; k < 4; k++) cau(0.06, [0xff8a3a, 0xffd23a, 0x6ab04c, 0xc0262d][k], x - 0.06 + (k % 2) * 0.12, 0.85, z - 0.05 + Math.floor(k / 2) * 0.1); }
  dung(1.0, 0.6, new THREE.MeshLambertMaterial({ map: tranh("napantry", 200, 120, (g, w, h) => { g.fillStyle = "#ffffff"; g.fillRect(0, 0, w, h); chuGiua(g, "TỦ LẠNH CHUNG", w, 30, 20, "#1f4fa8"); chuGiua(g, "Ghi tên lên hộp cơm", w, 62, 16, "#333", 600); chuGiua(g, "Hộp không tên = của Phát", w, 92, 15, "#c0262d", 600); }) }), 19.2, 1.45, 12.33, Math.PI);

  // ================= PHÒNG GIÁM ĐỐC =================
  V(2.4, 0.45, 0.9, 0x5a3d2a, -18.6, y2, -11.6, 1); K(2.4, 0.4, 0.2, 0x5a3d2a, -18.6, y2 + 0.45, -12.0, 1); // sofa da
  V(1.0, 0.4, 0.6, 0x3a2a1a, -18.6, y2, -10.3, 1);                                              // bàn trà
  { const meo = new THREE.Group(); meo.position.set(-13, y2 + 0.8, -10.3);
    const tm = new THREE.Mesh(new THREE.BoxGeometry(0.16, 0.18, 0.12), vl(0xffd23a)); tm.position.y = 0.09; meo.add(tm);
    const dm = new THREE.Mesh(new THREE.BoxGeometry(0.14, 0.12, 0.12), vl(0xffd23a)); dm.position.y = 0.24; meo.add(dm);
    const ta = new THREE.Mesh(new THREE.BoxGeometry(0.04, 0.14, 0.04), vl(0xffd23a)); ta.position.set(0.07, 0.3, 0); meo.add(ta); meo.userData.tayVay = ta; add(meo); }
  for (const x of [-19.2, -8.8]) { tru(0.3, 0.55, 0x8a5a3a, x, y2, -4.8); cau(0.5, 0x3d7a34, x, y2 + 1.1, -4.8); cau(0.32, 0x4f8a3c, x, y2 + 1.55, -4.8); }

  // ================= SÂN THƯỢNG =================
  tru(0.55, 1.5, 0xd5d9dd, -16, y3 + 0.4, 10); V(1.4, 0.4, 1.4, 0x8a8d92, -16, y3, 10, 2);  // bồn nước inox
  for (let k = 0; k < 3; k++) { const p = new THREE.Mesh(new THREE.BoxGeometry(1.6, 0.05, 1.0), vl(0x1f3a6a)); p.position.set(10 + k * 1.8, y3 + 0.7, 1.5); p.rotation.x = -0.35; add(p); K(0.06, 0.6, 0.06, 0x8a8d92, 10 + k * 1.8, y3, 1.8, 2); } // pin mặt trời
}
