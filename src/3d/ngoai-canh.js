// Ngoại cảnh: dựng thật các địa điểm ngoài công ty (trước đây chỉ là màn chuyển cảnh tối).
// Mỗi địa điểm là một "túi" riêng đặt rất xa thành phố (z ≤ −400), có tường / phông nền / đồi bao kín
// nên không bao giờ nhìn thấy phố và không đi ra ngoài được. Tất cả nằm ở tầng 0 (y = 0).
// Khối tĩnh của từng địa điểm gộp theo vật liệu (gopKhoi): ~5–9 lượt vẽ mỗi nơi; chữ, bảng hiệu, tranh vẽ
// dồn chung một tấm ảnh (atlas) cho mỗi nơi. Chỉ địa điểm người chơi đang đứng gần mới hiện và chạy hoạt cảnh.
// Quy ước hướng: vao.huong là yaw của người chơi (nhìn theo (−sin, −cos)); cho[i].huong là rotation.y của NPC
// (mặt nhìn theo (sin, cos)) — giống KHU / CHO_NGOI trong the-gioi.js.
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";
import { gopKhoi, VL_MAU_DINH } from "./gop-khoi.js";
import { taoXeMay, MAU_XE } from "./xe-3d.js";

const FONT = "'Be Vietnam Pro', system-ui, sans-serif";
const FONT_TRON = "'Baloo 2', 'Be Vietnam Pro', system-ui, sans-serif";
const MAU_NHA = [0xf3d9a4, 0xe9b8a8, 0xbfd9c4, 0xf6efe0, 0xd9e6f2, 0xf4c27a, 0xc9b6dc, 0xf2a7a0, 0xe0d4b8, 0xa8d4d9, 0xf7e27a, 0xd6c3a5];

// ---------------------------------------------------------------------------------------------
// Vị trí từng túi ngoại cảnh (tâm hệ tọa độ riêng của địa điểm)
const GOC = {
  quan_oc: [-480, -400], dai_tivi: [-360, -400], karaoke: [-240, -400], ca_phe: [-120, -400], tiem: [0, -400],
  phong_tro: [120, -400], ll_tower: [240, -400], xe_khach: [360, -400], nha_vuon: [480, -400],
  sky_ao: [0, -780], vung_tau: [-480, -820],
};
const TRONG_NHA = { dai_tivi: 1, karaoke: 1, ca_phe: 1, tiem: 1, ll_tower: 1, xe_khach: 1, sky_ao: 1 };

// Khai báo theo tọa độ cục bộ; NOI_NGOAI bên dưới đổi ra tọa độ thế giới.
// cho: 6 chỗ cho NPC (ngoi: ngồi ghế cao ~0,45 m). huong bỏ trống = tự quay mặt về phía tâm.
const DINH = {
  quan_oc: { ten: "Quán Ốc Đêm", tam: [1, 0.4], vao: [1, 5.6], cho: [[-1.2, -2.85, 1], [-0.42, -2.2, 1], [3.2, -2.85, 1], [2.42, -2.2, 1], [4.75, 1.7, 1], [-2.6, -3.95]] },
  dai_tivi: { ten: "Đài Tivi Hóng", tam: [0, -1.4], vao: [0, 5.4], cho: [[-0.9, -5.85, 1, 0], [0.9, -5.85, 1, 0], [-6.1, -0.6, 1], [-3.1, 2.4], [6.6, 1.2, 1], [2.6, -3.1]] },
  karaoke: { ten: "Karaoke Hát Cho Nhau Nghe", tam: [0, -0.5], vao: [2.7, -1.9], cho: [[-1.1, 2.45, 1, Math.PI], [0, 2.45, 1, Math.PI], [1.1, 2.45, 1, Math.PI], [-2.9, 0.9, 1, Math.PI / 2], [2.9, 0.9, 1, -Math.PI / 2], [-2.9, -0.3, 1, Math.PI / 2]] },
  ca_phe: { ten: "Cà Phê Sống Ảo", tam: [0, 0.6], vao: [0, 3.4], cho: [[-5.3, 3.4, 1], [-3.4, 3.4, 1], [5.4, -1.6], [-2.6, -1.9, 1], [2.2, -2.0, 1], [-4.6, -0.2]] },
  tiem: { ten: "Tiệm", tam: [0, 0.2], vao: [0, 3.2], cho: [[0, -3.25, 0, 0], [4.45, -1.45, 1, -Math.PI / 2], [4.45, -0.75, 1, -Math.PI / 2], [4.45, -0.05, 1, -Math.PI / 2], [-3.2, 0.9], [-1.6, -1.4]] },
  phong_tro: { ten: "Hẻm 69", tam: [0, 0.3], vao: [0, 6.8], cho: [[-0.95, -2.7, 1], [-0.95, -4.5, 1], [2.3, 0.3], [-0.6, 2.6], [0.7, -1.9], [3.6, -1.2]] },
  ll_tower: { ten: "Tòa nhà LL Entertainment", tam: [0, -1.2], vao: [0, 6.4], cho: [[-0.7, -6.0, 0, 0], [0.7, -6.0, 0, 0], [7.1, 4.5, 1], [8.3, 4.5, 1], [-8.7, -2.4], [-3.0, 0.9]] },
  xe_khach: { ten: "Xe khách", tam: [0, -2.3], vao: [0, -4.1], cho: [[-0.6, -1.35, 1, Math.PI], [-1.04, -1.35, 1, Math.PI], [0.6, -0.45, 1, Math.PI], [1.04, -0.45, 1, Math.PI], [-0.6, 0.45, 1, Math.PI], [0.9, -3.2, 0, 0]] },
  nha_vuon: { ten: "Nhà vườn ven đô", tam: [0, -0.4], vao: [0, 11.0], cho: [[-2.2, -4.2, 1, 0], [2.2, -4.2, 1, 0], [5.6, -1.4, 1], [6.8, -1.4, 1], [-4.2, 1.6], [3.2, 2.4]] },
  sky_ao: { ten: "Căn hộ Sky Ảo", tam: [3, 3.0], vao: [-6.7, 3.8], cho: [[1.9, -0.3, 1, 0], [3.1, -0.3, 1, 0], [4.3, -0.3, 1, 0], [7.0, 1.6, 1, -Math.PI / 2], [-3.0, 1.6], [6.2, 4.6]] },
  vung_tau: { ten: "Bãi biển Vũng Tàu", tam: [0, 1.6], vao: [0, 8.6], cho: [[-3.2, -0.6, 1], [-1.9, -0.6, 1], [2.6, -0.4, 1], [3.9, -0.4, 1], [-1.2, 3.6], [1.4, 3.7]] },
};

const yawNhin = (tu, toi) => Math.atan2(tu[0] - toi[0], tu[1] - toi[1]);
export const NOI_NGOAI = {};
for (const [id, d] of Object.entries(DINH)) {
  const [X, Z] = GOC[id];
  NOI_NGOAI[id] = {
    ten: d.ten, tang: 0, ngoai: true, trongNha: !!TRONG_NHA[id],
    tam: { x: X + d.tam[0], z: Z + d.tam[1] },
    vao: { x: X + d.vao[0], z: Z + d.vao[1], huong: yawNhin(d.vao, d.tam) },
    cho: d.cho.map(([x, z, ngoi, h]) => ({ x: X + x, z: Z + z, huong: h ?? Math.atan2(d.tam[0] - x, d.tam[1] - z), ...(ngoi ? { ngoi: true } : {}) })),
  };
}

// ---------------------------------------------------------------------------------------------
// Tag "noi" của cảnh -> id địa điểm (null: phố có sẵn trong thành phố, hoặc chưa có cảnh dựng)
const PHO_CO_SAN = /^(duong|dai_lo_ket_xe|cho_pho_cu|pho_tan_drama|cong_vien.*|dau_duong|dau_hem|san_bong_mini|atm|chua_pho_cu|tram_xe_buyt)$/;
export function diaDiemCuaNoi(noi) {
  if (!noi || noi === true) return null;
  const n = String(noi);
  const co = re => re.test(n);
  if (PHO_CO_SAN.test(n)) return null;
  if (co(/xe_khach|xe_buyt|xe_di_vung_tau|xe_vung_tau|vung_tau_xe|xe_ve_thanh_pho/)) return "xe_khach";
  if (co(/karaoke/)) return "karaoke";
  if (co(/dai_tivi|studio_0905|studio_pho_moi|lop_thanh_nhac/)) return "dai_tivi";
  if (co(/song_ao|quan_ca_phe|^cafe|ca_phe$/)) return "ca_phe";
  if (co(/vung_tau/)) return "vung_tau";
  if (co(/sky_ao|biet_thu|^can_1808|^can_1203|can_ho_604|can_501|ho_boi/)) return "sky_ao";
  if (co(/toa_ll|ll_entertainment|sanh_ll|trung_tam_thuong_mai|ngan_hang/)) return "ll_tower";
  if (co(/hem_69|phong_tro|^can_203|^can_701|gac_mai|^nha_so_|gac_lung|phong_gac|nha_hong_hot|nha_thanh_ninh|nha_nguyen|^nha$/)) return "phong_tro";
  if (co(/quan_oc|com_tam|tra_da|che_ba_bay|quan_hong|xe_day_com|quan_bida|nha_hang_gan_cong_ty|quan_nhau/)) return "quan_oc";
  if (co(/nha_vuon|ven_do/)) return "nha_vuon";
  if (co(/phong_kham|tiem_|cua_hang|sieu_thi|quan_net|^gym|rap_phim|uy_ban|tiec|hieu_sach/)) return "tiem";
  return null;
}

// Bảng hiệu cho "tiệm" theo tag (màu nền, màu chữ, dòng phụ)
const BIEN_TIEM = [
  [/phong_kham/, "PHÒNG KHÁM KHỎE RẺ", "#ffffff", "#1f7a4a", "KHÁM TỔNG QUÁT · XÉT NGHIỆM NHANH · 7H – 20H"],
  [/cam_do/, "CẦM ĐỒ CỨU NGUY", "#c0262d", "#ffe14d", "NHẬN CẦM XE · ĐIỆN THOẠI · LAPTOP · LÃI THỎA THUẬN"],
  [/nail/, "NAIL LUNG LINH", "#f26fa6", "#ffffff", "SƠN GEL · ĐẮP BỘT · VẼ MÓNG NGHỆ THUẬT"],
  [/photo/, "PHOTO IN ẤN 24H", "#1f4fa8", "#ffffff", "PHOTO · IN MÀU · ÉP PLASTIC · ĐÓNG CUỐN"],
  [/tien_loi/, "HÓNG MART 24/7", "#2e8b57", "#ffffff", "MỞ CỬA SUỐT ĐÊM · CÓ BÁNH BAO NÓNG"],
  [/sieu_thi/, "SIÊU THỊ MINI HÓNG MART", "#2e8b57", "#ffffff", "HÀNG TIÊU DÙNG · THỰC PHẨM TƯƠI · GIÁ BÌNH ỔN"],
  [/quan_net/, "NET CỎ GÕ PHÍM", "#1c1c1f", "#3fe07a", "MÁY MẠNH · MẠNG KHỎE · 8.000Đ/GIỜ"],
  [/gym/, "GYM CƠ BẮP HÓNG", "#1c1c1f", "#ffcf3a", "TẬP THỬ MIỄN PHÍ 3 NGÀY"],
  [/rap_phim/, "RẠP PHIM ƯỚC MƠ", "#7a1424", "#ffe14d", "QUẦY VÉ · BẮP RANG · NƯỚC NGỌT"],
  [/uy_ban/, "ỦY BAN NHÂN DÂN PHƯỜNG HÓNG", "#c0262d", "#ffe14d", "BỘ PHẬN MỘT CỬA · TIẾP CÔNG DÂN"],
  [/khai_truong/, "KHAI TRƯƠNG HỒNG PHÁT", "#c0262d", "#ffe14d", "GIẢM 20% TOÀN BỘ SẢN PHẨM TUẦN ĐẦU"],
  [/tiec/, "NHÀ HÀNG TIỆC CƯỚI HỶ PHÚC", "#b8860b", "#ffffff", "ĐẶT TIỆC · CƯỚI HỎI · SINH NHẬT"],
  [/hieu_sach/, "TIỆM SÁCH PHỐ CŨ", "#5a3d2a", "#f6efe0", "SÁCH CŨ · SÁCH MỚI · CÓ GÓC ĐỌC MIỄN PHÍ"],
];
export function bienTiemCuaNoi(noi, ten) {
  const n = String(noi || "");
  for (const [re, chu, nen, mau, phu] of BIEN_TIEM) if (re.test(n)) return { chu, nen, mau, phu };
  return { chu: (ten || n.replace(/_/g, " ")).toUpperCase(), nen: "#1f4fa8", mau: "#ffffff", phu: "XIN CHÀO QUÝ KHÁCH" };
}

// Điểm đứng ngoài phố có sẵn (tầng 0) cho các cảnh diễn ngay trong thành phố. huong: yaw người chơi.
export const DIEM_PHO = {
  duong: { x: -58, z: 42.6, huong: 0 },
  dai_lo_ket_xe: { x: 45.4, z: -12, huong: -Math.PI / 2 },
  cho_pho_cu: { x: 58.7, z: 1.5, huong: -Math.PI / 2 },
  pho_tan_drama: { x: -34, z: 31.3, huong: Math.PI },
  cong_vien: { x: 104, z: 22, huong: 0 },
  cong_vien_ho_ca_map: { x: 116, z: 22, huong: 0 },
  dau_duong: { x: 4.5, z: 31.3, huong: Math.PI },
  dau_hem: { x: 10, z: 47.5, huong: Math.PI },
  san_bong_mini: { x: 116, z: 14, huong: 0 },
  atm: { x: -12, z: 31.3, huong: Math.PI },
  chua_pho_cu: { x: 58.7, z: 9.5, huong: -Math.PI / 2 },
  tram_xe_buyt: { x: -30, z: 41.9, huong: 0 },
};

// Có đang ở trong nhà của một ngoại cảnh không (để ẩn mưa)
export function trongNhaNgoai(x, z) {
  for (const id in TRONG_NHA) {
    const [X, Z] = GOC[id];
    const dx = x - X, dz = z - Z;
    if (id === "sky_ao" ? dx > -9 && dx < 8 && Math.abs(dz) < 8 : Math.abs(dx) < 16 && Math.abs(dz) < 12) return true;
  }
  return false;
}

// ---------------------------------------------------------------------------------------------
// Vẽ chữ: tự co cho vừa toiDa (luôn truyền độ rộng tối đa để không phụ thuộc bản vá fillText toàn cục)
function chu(g, s, x, y, co, mau, { dam = 800, font = FONT, canh = "center", toiDa = 4000, bong = 0, mauBong, vien } = {}) {
  let c = co; const f = () => { g.font = `${dam} ${c}px ${font}`; };
  f(); while (g.measureText(s).width > toiDa && c > 6) { c -= 1; f(); }
  g.textAlign = canh; g.textBaseline = "middle";
  if (vien) { g.lineJoin = "round"; g.lineWidth = vien[0]; g.strokeStyle = vien[1]; g.strokeText(s, x, y, toiDa); }
  if (bong) { g.shadowColor = mauBong || mau; g.shadowBlur = bong; g.fillStyle = mau; g.fillText(s, x, y, toiDa); }
  g.fillStyle = mau; g.fillText(s, x, y, toiDa); g.shadowBlur = 0;
}
// Bảng chữ: nền + các dòng [chữ, cỡ (phần của chiều cao), y (phần), màu, độ đậm]
const veBien = (nen, dong, { vien, font = FONT, bong = 0, tron = 0 } = {}) => (g, w, h) => {
  if (typeof nen === "function") nen(g, w, h);
  else { g.fillStyle = nen; if (tron) { g.beginPath(); g.roundRect(0, 0, w, h, tron); g.fill(); } else g.fillRect(0, 0, w, h); }
  if (vien) { const l = Math.max(3, h * 0.045); g.strokeStyle = vien; g.lineWidth = l; g.strokeRect(l * 1.5, l * 1.5, w - l * 3, h - l * 3); }
  for (const [s, co, y, mau = "#fff", dam = 800, f] of dong) chu(g, s, w / 2, h * y, h * co, mau, { dam, font: f || font, toiDa: w * 0.9, bong });
};
const gradDoc = (...m) => (g, w, h) => { const gr = g.createLinearGradient(0, 0, 0, h); m.forEach((c, i) => gr.addColorStop(i / (m.length - 1), c)); g.fillStyle = gr; g.fillRect(0, 0, w, h); };
const gradNgang = (...m) => (g, w, h) => { const gr = g.createLinearGradient(0, 0, w, 0); m.forEach((c, i) => gr.addColorStop(i / (m.length - 1), c)); g.fillStyle = gr; g.fillRect(0, 0, w, h); };

// Tấm ảnh chung (atlas) của một địa điểm: cấp từng vùng, cuối cùng cắt gọn và đổi UV các mặt phẳng dùng nó
class Atlas {
  constructor(k) { this.k = k; this.W = 1024; this.c = document.createElement("canvas"); this.c.width = 1024 * k; this.c.height = 4096 * k; this.g = this.c.getContext("2d"); this.x = 0; this.y = 0; this.hang = 0; this.dk = []; }
  vung(w, h, ve) {
    const P = 6; w = Math.min(w, this.W - 2 * P);
    if (this.x + w + 2 * P > this.W) { this.x = 0; this.y += this.hang; this.hang = 0; }
    if (this.y + h + 2 * P > 4096) { console.warn("ngoai-canh: atlas đầy"); this.y = 0; }
    const r = { x: this.x + P, y: this.y + P, w, h };
    this.x += w + 2 * P; this.hang = Math.max(this.hang, h + 2 * P);
    const g = this.g, k = this.k;
    g.save(); g.setTransform(k, 0, 0, k, r.x * k, r.y * k); g.beginPath(); g.rect(0, 0, w, h); g.clip(); ve(g, w, h); g.restore();
    // kéo mép ra phần đệm để mipmap không lem viền tối
    const X = r.x * k, Y = r.y * k, Wd = w * k, Hd = h * k, p = P * k;
    g.drawImage(this.c, X, Y, Wd, 1, X, Y - p, Wd, p); g.drawImage(this.c, X, Y + Hd - 1, Wd, 1, X, Y + Hd, Wd, p);
    g.drawImage(this.c, X, Y - p, 1, Hd + 2 * p, X - p, Y - p, p, Hd + 2 * p); g.drawImage(this.c, X + Wd - 1, Y - p, 1, Hd + 2 * p, X + Wd, Y - p, p, Hd + 2 * p);
    return r;
  }
  dung(geo, r) { this.dk.push([geo, r]); return geo; }
  xong(...vatLieu) {
    if (!this.dk.length) { this.c = null; return; }
    const Hp = Math.max(4, Math.ceil((this.y + this.hang) * this.k));
    const c2 = document.createElement("canvas"); c2.width = this.c.width; c2.height = Hp;
    c2.getContext("2d").drawImage(this.c, 0, 0, c2.width, Hp, 0, 0, c2.width, Hp);
    this.c = null;
    const tex = new THREE.CanvasTexture(c2); tex.colorSpace = THREE.SRGBColorSpace; tex.anisotropy = 4;
    const W = this.W, H = Hp / this.k;
    for (const [geo, r] of this.dk) {
      const uv = geo.attributes.uv;
      for (let i = 0; i < uv.count; i++) uv.setXY(i, (r.x + uv.getX(i) * r.w) / W, 1 - (r.y + (1 - uv.getY(i)) * r.h) / H);
    }
    for (const m of vatLieu) { m.map = tex; m.needsUpdate = true; }
    this.tex = tex;
  }
}

let _tron = null; // chấm tròn mờ (hơi nước, khói, vũng sáng)
function texTron() {
  if (_tron) return _tron;
  const c = document.createElement("canvas"); c.width = c.height = 64; const g = c.getContext("2d");
  const gr = g.createRadialGradient(32, 32, 0, 32, 32, 32); gr.addColorStop(0, "rgba(255,255,255,1)"); gr.addColorStop(0.45, "rgba(255,255,255,.45)"); gr.addColorStop(1, "rgba(255,255,255,0)");
  g.fillStyle = gr; g.fillRect(0, 0, 64, 64); _tron = new THREE.CanvasTexture(c); return _tron;
}

const VL_NEN_TRONG = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true, fog: false });
const VL_NEN_TRONG_2 = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true, fog: false, side: THREE.DoubleSide });
const VL_DINH = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true });
const VL_DINH_2 = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true, side: THREE.DoubleSide });
const vbCache = new Map();
const vb = c => { if (!vbCache.has(c)) vbCache.set(c, new THREE.MeshBasicMaterial({ color: c })); return vbCache.get(c); };
const toi = (n, k = 0.8) => new THREE.Color(n).multiplyScalar(k).getHex();
const lechMau = (n, a) => { const c = new THREE.Color(n); c.offsetHSL(0, 0, a); return c.getHex(); };

// lưới ô màu (gạch lát, ván sàn, gạch thẻ) trong mặt phẳng XY, nhìn về +z; mauFn(i, j) trả màu hoặc null
function luoiGeo(w, h, nx, ny, mauFn, khe = 0, lechHang = 0) {
  const pos = [], col = [], nor = [], c = new THREE.Color();
  const cw = w / nx, ch = h / ny;
  for (let j = 0; j < ny; j++) for (let i = 0; i < nx + (lechHang ? 1 : 0); i++) {
    const m = mauFn(i, j); if (m == null) continue; c.set(m);
    let x0 = -w / 2 + i * cw + khe / 2 - (lechHang && j % 2 ? cw * lechHang : 0), x1 = x0 + cw - khe;
    x0 = Math.max(x0, -w / 2); x1 = Math.min(x1, w / 2); if (x1 <= x0) continue;
    const y0 = -h / 2 + j * ch + khe / 2, y1 = y0 + ch - khe;
    pos.push(x0, y0, 0, x1, y0, 0, x1, y1, 0, x0, y0, 0, x1, y1, 0, x0, y1, 0);
    for (let q = 0; q < 6; q++) { col.push(c.r, c.g, c.b); nor.push(0, 0, 1); }
  }
  const g = new THREE.BufferGeometry();
  g.setAttribute("position", new THREE.Float32BufferAttribute(pos, 3)); g.setAttribute("normal", new THREE.Float32BufferAttribute(nor, 3)); g.setAttribute("color", new THREE.Float32BufferAttribute(col, 3));
  return g;
}
// nón (dù, chao đèn) sọc hai màu
function nonSoc(r, h, seg, c1, c2) {
  const g = new THREE.ConeGeometry(r, h, seg, 1, true).toNonIndexed();
  const n = g.attributes.position.count, col = new Float32Array(n * 3), a = new THREE.Color(c1), b = new THREE.Color(c2);
  for (let i = 0; i < n; i++) { const t = Math.floor(i / 3); const m = Math.floor(t / 2) % 2 ? a : b; col.set([m.r, m.g, m.b], i * 3); }
  g.setAttribute("color", new THREE.BufferAttribute(col, 3)); return g;
}

// ---------------------------------------------------------------------------------------------
// Bộ đồ nghề dựng một địa điểm (tọa độ cục bộ; va chạm đổi ra tọa độ thế giới)
function taoBo(id, vat, dienThoai) {
  const [X0, Z0] = GOC[id], trong = !!TRONG_NHA[id], fog = !trong;
  const nhom = new THREE.Group(); nhom.name = "ngoai-canh:" + id; nhom.position.set(X0, 0, Z0);
  const dongNhom = new THREE.Group(); nhom.add(dongNhom);
  const A = new Atlas(dienThoai ? 0.5 : 1);
  const vlA = new THREE.MeshLambertMaterial({ fog });
  const vlAS = new THREE.MeshBasicMaterial({ fog, transparent: true, alphaTest: 0.02 });
  const kinh = new THREE.MeshLambertMaterial({ color: 0xcfe9f5, transparent: true, opacity: 0.2, depthWrite: false, side: THREE.DoubleSide, fog });
  const canDs = [], capNhat = [], day = [], vungCache = new Map();
  let s = 1 + [...id].reduce((a, c) => a * 31 + c.charCodeAt(0), 7) % 2147483646;
  const rnd = () => (s = (s * 16807) % 2147483647) / 2147483647;
  const vatLieu = (mau, o) => typeof mau === "number" ? (o.sang ? vb(mau) : o.hai ? vl(mau, { side: THREE.DoubleSide }) : vl(mau)) : mau;
  const dat = (m, x, y, z, o) => {
    m.position.set(x, y, z); if (o.ry) m.rotation.y = o.ry; if (o.rx) m.rotation.x = o.rx; if (o.rz) m.rotation.z = o.rz;
    if (o.sang) m.userData.sang = true; (o.cha || nhom).add(m); return m;
  };
  const k = {
    id, nhom, dongNhom, A, rnd, kinh, dienThoai, trong, fog, capNhat,
    chon: a => a[Math.floor(rnd() * a.length)],
    can(x1, x2, z1, z2, tuong = false) { const b = { minX: X0 + x1, maxX: X0 + x2, minZ: Z0 + z1, maxZ: Z0 + z2 }; if (tuong) b.tuong = true; vat.push(b); canDs.push(b); },
    canHop(cx, cz, w, d, ry = 0, tuong = false) { const c = Math.abs(Math.cos(ry)), sn = Math.abs(Math.sin(ry)); const hw = (c * w + sn * d) / 2, hd = (sn * w + c * d) / 2; k.can(cx - hw, cx + hw, cz - hd, cz + hd, tuong); },
    // hộp: (x, z) tâm đáy, y là cao độ đáy
    H(w, h, d, mau, x, y, z, o = {}) { const m = dat(new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vatLieu(mau, o)), x, y + h / 2, z, o); if (o.can) k.canHop(x, z, w, d, o.ry || 0, o.tuong); return m; },
    // trụ: y là cao độ đáy
    T(r1, r2, h, mau, x, y, z, o = {}) { const m = dat(new THREE.Mesh(new THREE.CylinderGeometry(r1, r2, h, o.seg ?? 8, 1, !!o.mo), vatLieu(mau, o)), x, y + h / 2, z, o); if (o.can) k.canHop(x, z, 2 * Math.max(r1, r2), 2 * Math.max(r1, r2)); return m; },
    // khối đa diện tròn (tán cây, đá, trái cây): y là tâm
    C(r, mau, x, y, z, o = {}) { const m = dat(new THREE.Mesh(new THREE.IcosahedronGeometry(r, o.ct ?? 0), vatLieu(mau, o)), x, y, z, o); if (o.sy) m.scale.set(o.sx ?? 1, o.sy, o.sz ?? 1); return m; },
    // mặt phẳng màu: y là tâm; o.nam = nằm ngang
    P(w, h, mau, x, y, z, o = {}) { const m = dat(new THREE.Mesh(new THREE.PlaneGeometry(w, h), vatLieu(mau, o)), x, y, z, o); if (o.nam) m.rotation.x = -Math.PI / 2; return m; },
    vung(w, h, ve) { return A.vung(w, h, ve); },
    vungChung(key, w, h, ve) { if (!vungCache.has(key)) vungCache.set(key, A.vung(w, h, ve)); return vungCache.get(key); },
    // mặt phẳng dùng một vùng của atlas: y là tâm
    V(r, w, h, x, y, z, o = {}) {
      const m = dat(new THREE.Mesh(A.dung(new THREE.PlaneGeometry(w, h), r), o.sang ? vlAS : vlA), x, y, z, { ...o, sang: false });
      if (o.nam) m.rotation.x = -Math.PI / 2; return m;
    },
    // hộp phủ ảnh atlas mọi mặt: y là đáy
    HA(r, w, h, d, x, y, z, o = {}) { return dat(new THREE.Mesh(A.dung(new THREE.BoxGeometry(w, h, d), r), o.sang ? vlAS : vlA), x, y + h / 2, z, { ...o, sang: false }); },
    nhomCon(x, z, ry = 0, y = 0, cha = nhom) {
      const g = new THREE.Group(); g.position.set(x, y, z); g.rotation.y = ry; cha.add(g);
      g.can = (lx, lz, w, d) => { const c = Math.cos(ry), sn = Math.sin(ry); k.canHop(x + lx * c + lz * sn, z - lx * sn + lz * c, w, d, ry); };
      return g;
    },
    // sàn lát ô (x1..x2, z1..z2), mau(i, j) hoặc [màu1, màu2] bàn cờ; khe: ron gạch
    san(x1, z1, x2, z2, { o = 0.6, oz, mau = [0xdddddd, 0xcccccc], khe = 0, mauKhe = 0x777777, bien = 0.03, y = 0.004, lech = 0 } = {}) {
      const nx = Math.max(1, Math.round((x2 - x1) / o)), nz = Math.max(1, Math.round((z2 - z1) / (oz ?? o)));
      const fn = typeof mau === "function" ? mau : (i, j) => mau[(i + j) % mau.length];
      const cw = (x2 - x1) / nx, cz = (z2 - z1) / nz;
      const geo = luoiGeo(x2 - x1, z2 - z1, nx, nz, (i, j) => { const m = fn(i, j, x1 + (i + 0.5) * cw, z2 - (j + 0.5) * cz); return m == null ? null : bien ? lechMau(m, (rnd() - 0.5) * bien) : m; }, khe, lech);
      const m = new THREE.Mesh(geo, VL_DINH); m.rotation.x = -Math.PI / 2; m.position.set((x1 + x2) / 2, y, (z1 + z2) / 2); nhom.add(m);
      if (khe) k.P(x2 - x1, z2 - z1, mauKhe, (x1 + x2) / 2, y - 0.002, (z1 + z2) / 2, { nam: true });
      return m;
    },
    // mảng ô dựng đứng (gạch thẻ, ốp tường): tâm (x, y, z), nhìn về hướng ry
    luoi(w, h, nx, ny, fn, x, y, z, ry = 0, { khe = 0, lech = 0, bien = 0.04, cha } = {}) {
      const geo = luoiGeo(w, h, nx, ny, (i, j) => { const m = fn(i, j); return m == null ? null : bien ? lechMau(m, (rnd() - 0.5) * bien) : m; }, khe, lech);
      return dat(new THREE.Mesh(geo, VL_DINH), x, y, z, { ry, cha });
    },
    day(pts) { for (let i = 1; i < pts.length; i++) day.push(...pts[i - 1], ...pts[i]); },
    vong(a, b, vongXuong, n = 8) { const p = []; for (let i = 0; i <= n; i++) { const t = i / n; p.push([a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t - Math.sin(t * Math.PI) * vongXuong, a[2] + (b[2] - a[2]) * t]); } return p; },
    dong(o) { dongNhom.add(o); return o; },
    moi(fn) { capNhat.push(fn); },
  };

  // ---------- Đồ nội thất dùng chung (mặt trước = +z cục bộ) ----------
  const { H, T, C } = k;
  k.ghe = (x, z, ry, mau = 0x6b4a2f, o = {}) => {
    const g = k.nhomCon(x, z, ry), c = { cha: g }, cao = o.cao ?? 0.46, chan = o.chan ?? 0x2a2a2a;
    H(0.46, 0.07, 0.46, mau, 0, cao - 0.07, 0, c); H(0.46, o.lung ?? 0.5, 0.05, o.mauLung ?? mau, 0, cao, -0.21, c);
    for (const [a, b] of [[-0.2, -0.2], [0.2, -0.2], [-0.2, 0.2], [0.2, 0.2]]) H(0.035, cao - 0.07, 0.035, chan, a, 0, b, c);
    if (o.can !== false) g.can(0, 0, 0.46, 0.46); return g;
  };
  k.gheNhua = (x, z, mau, o = {}) => { // ghế nhựa đẩu (mặt ngồi cao 0,42 m)
    const cao = o.cao ?? 0.42;
    T(0.17, 0.2, 0.05, mau, x, cao - 0.05, z, { seg: 10 }); T(0.19, 0.24, cao - 0.05, mau, x, 0, z, { seg: 10, mo: true, hai: true });
  };
  k.ban = (x, z, w, d, h, mat, chan, o = {}) => {
    const g = k.nhomCon(x, z, o.ry || 0), c = { cha: g };
    if (o.tron) { T(w / 2, w / 2, 0.04, mat, 0, h - 0.04, 0, { cha: g, seg: 16 }); T(0.04, 0.04, h - 0.04, chan, 0, 0, 0, c); T(0.22, 0.25, 0.03, chan, 0, 0, 0, c); }
    else { H(w, 0.04, d, mat, 0, h - 0.04, 0, c); for (const [a, b] of [[-1, -1], [1, -1], [-1, 1], [1, 1]]) H(0.045, h - 0.04, 0.045, chan, a * (w / 2 - 0.06), 0, b * (d / 2 - 0.06), c); }
    if (o.can !== false) g.can(0, 0, w, o.tron ? w : d); return g;
  };
  k.sofa = (x, z, w, ry, mau, o = {}) => {
    const g = k.nhomCon(x, z, ry), c = { cha: g }, sau = o.sau ?? 0.86, dem = toi(mau, 1.08);
    H(w, 0.3, sau, toi(mau, 0.85), 0, 0.04, 0, c); H(w - 0.04, 0.12, sau - 0.22, dem, 0, 0.34, 0.08, c); // khung + đệm ngồi
    const n = Math.max(1, Math.round(w / 0.75)); for (let i = 0; i < n; i++) H(w / n - 0.04, 0.42, 0.18, dem, -w / 2 + (i + 0.5) * w / n, 0.4, -sau / 2 + 0.14, { cha: g, rx: -0.12 });
    H(w, 0.5, 0.12, mau, 0, 0.34, -sau / 2 + 0.06, c);
    if (o.tay !== false) for (const sx of [-1, 1]) H(0.16, 0.62, sau, mau, sx * (w / 2 + 0.08), 0, 0, c);
    for (const sx of [-1, 1]) for (const sz of [-1, 1]) H(0.05, 0.05, 0.05, 0x222222, sx * (w / 2 - 0.05), 0, sz * (sau / 2 - 0.05), c);
    if (o.can !== false) g.can(0, 0, w + (o.tay !== false ? 0.32 : 0), sau); return g;
  };
  k.cay = (x, z, s = 1, o = {}) => {
    const chau = o.chau ?? 0xb5653a;
    T(0.22 * s, 0.17 * s, 0.42 * s, chau, x, 0, z, { seg: 8 }); T(0.2 * s, 0.2 * s, 0.02, 0x4a3524, x, 0.41 * s, z);
    const la = o.la ?? [0x4f8a3c, 0x3d7a34, 0x5f9a48];
    if (o.kieu === "la_to") { // lá to kiểu trầu bà Nam Mỹ
      T(0.025, 0.03, 0.9 * s, 0x3d6a2a, x, 0.4 * s, z, { seg: 4 });
      for (let i = 0; i < 7; i++) { const a = i * 2.4, r = 0.3 * s; H(0.36 * s, 0.02, 0.24 * s, la[i % la.length], x + Math.cos(a) * r, (0.75 + (i % 3) * 0.25) * s, z + Math.sin(a) * r, { ry: -a, rz: 0.4, hai: true }); }
    } else {
      C(0.38 * s, la[0], x, 0.85 * s, z, { ct: 0 }); C(0.28 * s, la[1], x + 0.14 * s, 1.15 * s, z - 0.08 * s); C(0.25 * s, la[2 % la.length], x - 0.14 * s, 1.05 * s, z + 0.1 * s);
    }
    if (o.can !== false) k.canHop(x, z, 0.5 * s, 0.5 * s);
  };
  k.denTha = (x, z, yTran, dai = 0.8, mauChao = 0x1c1c1f, o = {}) => {
    H(0.012, dai, 0.012, 0x111111, x, yTran - dai, z);
    const r = o.r ?? 0.17;
    const m = new THREE.Mesh(new THREE.ConeGeometry(r, r * 1.1, 10, 1, true), vl(mauChao, { side: THREE.DoubleSide })); m.position.set(x, yTran - dai - r * 0.5, z); nhom.add(m);
    C(r * 0.42, o.mauDen ?? 0xffe6a8, x, yTran - dai - r * 0.95, z, { sang: true, ct: 1 });
  };
  k.denOng = (x, y, z, ry = 0, dai = 1.2) => { H(dai + 0.06, 0.05, 0.14, 0xe8e8e8, x, y - 0.05, z, { ry }); H(dai, 0.04, 0.05, 0xfdfbf2, x, y - 0.085, z, { ry, sang: true }); };
  k.dieuHoa = (x, y, z, ry = 0) => { const g = k.nhomCon(x, z, ry, y); H(1.0, 0.3, 0.22, 0xf6f6f2, 0, 0, 0, { cha: g }); H(0.9, 0.03, 0.02, 0xbcbcbc, 0, 0.05, 0.115, { cha: g }); H(0.06, 0.03, 0.01, 0x3fe07a, 0.38, 0.2, 0.115, { cha: g, sang: true }); };
  k.quatTran = (x, z, yTran) => { H(0.03, 0.4, 0.03, 0x555555, x, yTran - 0.4, z); T(0.1, 0.1, 0.1, 0xe8e8e8, x, yTran - 0.5, z); for (let i = 0; i < 3; i++) H(0.62, 0.012, 0.12, 0xd9d2c4, x + Math.cos(i * 2.094) * 0.34, yTran - 0.47, z - Math.sin(i * 2.094) * 0.34, { ry: i * 2.094 }); };
  k.dongHo = (x, y, z, ry = 0) => { const r = k.vungChung("dongho", 96, 96, (g) => { g.fillStyle = "#fff"; g.beginPath(); g.arc(48, 48, 44, 0, 7); g.fill(); g.strokeStyle = "#222"; g.lineWidth = 5; g.stroke(); g.lineWidth = 3; for (let i = 0; i < 12; i++) { const a = i * Math.PI / 6; g.beginPath(); g.moveTo(48 + Math.cos(a) * 34, 48 + Math.sin(a) * 34); g.lineTo(48 + Math.cos(a) * 40, 48 + Math.sin(a) * 40); g.stroke(); } g.lineWidth = 4; g.beginPath(); g.moveTo(48, 48); g.lineTo(48, 22); g.moveTo(48, 48); g.lineTo(66, 56); g.stroke(); }); k.V(r, 0.42, 0.42, x, y, z, { ry }); };
  // phòng kín: tường dày 0,2 m nằm ngoài hình chữ nhật; cua: {bac:[[a,b]], nam, tay, dong} theo trục chạy của tường
  k.phong = (x1, z1, x2, z2, cao, { mau = 0xe9e3d6, tran = 0xf2efe8, cua = {}, bo = [], d = 0.2, caoCua = 2.2 } = {}) => {
    const mauT = huong => typeof mau === "object" ? mau[huong] : mau;
    const doan = (a, b, gap) => { const ds = []; let dau = a; for (const [p, q] of [...gap].sort((u, v) => u[0] - v[0])) { if (p > dau) ds.push([dau, p]); dau = q; } if (dau < b) ds.push([dau, b]); return ds; };
    const ngang = (z, huong) => {
      if (bo.includes(huong)) return; const g = cua[huong] || [];
      for (const [p, q] of doan(x1 - d, x2 + d, g)) H(q - p, cao, d, mauT(huong), (p + q) / 2, 0, z, { can: true, tuong: true });
      for (const [p, q] of g) H(q - p, cao - caoCua, d, mauT(huong), (p + q) / 2, caoCua, z);
    };
    const doc = (x, huong) => {
      if (bo.includes(huong)) return; const g = cua[huong] || [];
      for (const [p, q] of doan(z1, z2, g)) H(d, cao, q - p, mauT(huong), x, 0, (p + q) / 2, { can: true, tuong: true });
      for (const [p, q] of g) H(d, cao - caoCua, q - p, mauT(huong), x, caoCua, (p + q) / 2);
    };
    ngang(z1 - d / 2, "bac"); ngang(z2 + d / 2, "nam"); doc(x1 - d / 2, "tay"); doc(x2 + d / 2, "dong");
    if (tran !== false) H(x2 - x1 + 2 * d, 0.15, z2 - z1 + 2 * d, tran, (x1 + x2) / 2, cao, (z1 + z2) / 2);
  };
  // nhà phố làm phông (mặt tiền ở z = 0 cục bộ, nhìn về +z, chiếm x 0..w)
  k.nhaPho = (x, z, ry, w, soTang, o = {}) => {
    const g = k.nhomCon(x, z, ry), c = { cha: g }, mau = o.mau ?? k.chon(MAU_NHA), TG = 3.3, cao = soTang * TG, sau = o.sau ?? 6;
    H(w - 0.04, cao, sau, mau, w / 2, 0, -sau / 2, c); if (o.can !== false) g.can(w / 2, -sau / 2, w, sau);
    H(0.26, 3.05, 0.26, toi(mau), 0.15, 0, 0.1, c); H(0.26, 3.05, 0.26, toi(mau), w - 0.15, 0, 0.1, c);
    const cuon = k.vungChung("cuacuon", 128, 128, (gg, W, Hh) => { for (let i = 0; i < 32; i++) { gg.fillStyle = i % 2 ? "#9aa0a6" : "#b9bec4"; gg.fillRect(0, i * 4, W, 4); } gg.fillStyle = "#6d7175"; gg.fillRect(0, Hh - 8, W, 8); });
    const xep = k.vungChung("cuaxep", 128, 128, (gg, W, Hh) => { gg.fillStyle = "#2a2c31"; gg.fillRect(0, 0, W, Hh); gg.fillStyle = "#4a6a5a"; for (let i = 0; i < 16; i++) gg.fillRect(i * 8 + 2, 0, 3, Hh); gg.strokeStyle = "#5a7a6a"; gg.lineWidth = 2; for (let i = 0; i < 8; i++) { gg.beginPath(); gg.moveTo(i * 16, 20); gg.lineTo(i * 16 + 8, 34); gg.lineTo(i * 16 + 16, 20); gg.stroke(); gg.beginPath(); gg.moveTo(i * 16, 96); gg.lineTo(i * 16 + 8, 110); gg.lineTo(i * 16 + 16, 96); gg.stroke(); } });
    const kieu = o.cua ?? (k.rnd() < 0.6 ? "cuon" : "xep");
    if (kieu === "mo") { k.P(w - 0.5, 2.7, o.mauTrong ?? 0x4a3a2a, w / 2, 1.35, 0.01, { ...c, sang: !!o.sangTrong }); }
    else k.V(kieu === "cuon" ? cuon : xep, w - 0.5, 2.7, w / 2, 1.35, 0.02, c);
    if (o.ten) {
      const [nen, mauChu] = o.mauBien ?? ["#c0262d", "#ffe14d"];
      const r = k.vung(512, 104, veBien(nen, [[o.ten, 0.5, 0.42, mauChu], [o.phu ?? "ĐT: 0900 000 " + String(o.ten.length * 37 % 1000).padStart(3, "0"), 0.17, 0.82, mauChu, 600]], { vien: mauChu }));
      k.V(r, w - 0.3, 0.9, w / 2, 3.55, 0.08, { ...c, sang: !!o.denBien });
      H(w - 0.2, 0.08, 0.16, 0x3a3d44, w / 2, 3.04, 0.06, c);
    }
    const sang = k.vungChung("cuasosang", 64, 96, (gg, W, Hh) => { gg.fillStyle = "#ffe0a0"; gg.fillRect(0, 0, W, Hh); gg.fillStyle = "#f2b8a0"; gg.fillRect(0, 0, 18, Hh); gg.fillRect(W - 18, 0, 18, Hh); gg.fillStyle = "#6d5a3a"; gg.fillRect(W / 2 - 1, 0, 2, Hh); gg.fillRect(0, 0, W, 3); });
    const toiK = k.vungChung("cuasotoi", 64, 96, (gg, W, Hh) => { gg.fillStyle = "#33414d"; gg.fillRect(0, 0, W, Hh); gg.fillStyle = "#4b5d6b"; gg.fillRect(4, 4, W / 2 - 6, Hh - 8); gg.fillStyle = "#3d4d59"; gg.fillRect(W / 2 + 2, 4, W / 2 - 6, Hh - 8); });
    for (let t = 1; t < soTang; t++) {
      const y = t * TG, banCong = t > 1 || !o.ten, ww = Math.min(w * 0.6, 2.6);
      const lit = k.rnd() < (o.tiLeSang ?? 0.45);
      k.V(lit ? sang : toiK, ww, 1.9, w / 2, y + 1.25, 0.02, { ...c, sang: lit });
      H(ww + 0.14, 0.08, 0.1, 0xf6f6f2, w / 2, y + 2.2, 0.04, c);
      if (banCong) {
        H(w - 0.3, 0.12, 0.85, toi(mau, 0.9), w / 2, y, 0.42, c); H(w - 0.3, 0.05, 0.05, 0x3a3d44, w / 2, y + 1.0, 0.83, c);
        for (let xx = 0.3; xx < w - 0.2; xx += 0.3) H(0.025, 0.9, 0.025, 0x3a3d44, xx, y + 0.1, 0.83, c);
        if (k.rnd() < 0.5) { H(w - 0.6, 0.02, 0.02, 0x555555, w / 2, y + 1.95, 0.7, c); for (let i = 0; i < 3; i++) H(0.36, 0.5, 0.02, k.chon([0xc0262d, 0xf6f6f2, 0x2a5aa8, 0xe9e04a, 0xf5b9cf]), 0.7 + i * (w - 1.4) / 3, y + 1.4, 0.7, c); }
        if (k.rnd() < 0.5) for (let i = 0; i < 2; i++) { H(0.24, 0.22, 0.24, 0xb5653a, 0.5 + i * 0.45, y + 0.12, 0.6, c); C(0.22, 0x4f8a3c, 0.5 + i * 0.45, y + 0.5, 0.6, c); }
      }
      if (k.rnd() < 0.7) { H(0.75, 0.48, 0.26, 0xf2f2f2, w - 0.6, y + 2.4, 0.15, c); T(0.17, 0.17, 0.02, 0x8a8d92, w - 0.6, y + 2.64, 0.29, { ...c, rx: Math.PI / 2 }); }
    }
    H(w - 0.04, 0.5, 0.14, toi(mau, 0.9), w / 2, cao, -0.07, c);
    if (k.rnd() < 0.6) { T(0.5, 0.5, 1.2, 0xd5d9dd, w * 0.35, cao + 0.4, -1.4, { ...c, seg: 10 }); H(1.1, 0.4, 1.1, 0x8a8d92, w * 0.35, cao, -1.4, c); }
    return g;
  };
  // vũng sáng mờ trên nền (ánh đèn hắt xuống)
  const vlVung = new THREE.MeshBasicMaterial({ map: texTron(), color: 0xffc87a, transparent: true, opacity: 0.22, depthWrite: false, blending: THREE.AdditiveBlending, fog });
  k.vungSang = (x, z, r, y = 0.02) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(r * 2, r * 2), vlVung); m.rotation.x = -Math.PI / 2; m.position.set(x, y, z); nhom.add(m); };
  k.xeMay = (x, z, ry, o = {}) => { const m = taoXeMay(o.mau ?? k.chon(MAU_XE), o.kieu ?? (k.rnd() < 0.5 ? "ga" : "so")); m.position.set(x, 0, z); m.rotation.y = ry; nhom.add(m); if (o.can !== false) k.canHop(x, z, 0.4, 1.5, ry); return m; };

  // ---------- Hoàn tất: gộp khối, gắn vật liệu ----------
  k.xong = () => {
    A.xong(vlA, vlAS);
    nhom.updateMatrixWorld(true);
    const sang = new THREE.Group(); nhom.add(sang);
    const ds = []; nhom.traverse(o => { if (o.isMesh && o.userData.sang) ds.push(o); });
    for (const m of ds) sang.attach(m);
    if (ds.length) {
      gopKhoi(sang, { deQuy: true });
      for (const m of sang.children) { if (m.isMesh && m.material.vertexColors) m.material = new THREE.MeshBasicMaterial({ vertexColors: true, fog, side: m.material.side }); m.userData.rieng = true; }
    }
    dongNhom.traverse(o => { o.userData.rieng = true; });
    if (day.length) {
      const gd = new THREE.BufferGeometry(); gd.setAttribute("position", new THREE.Float32BufferAttribute(day, 3));
      const l = new THREE.LineSegments(gd, new THREE.LineBasicMaterial({ color: 0x15161a, fog })); l.userData.rieng = true; nhom.add(l);
    }
    gopKhoi(nhom, { deQuy: true });
    for (const m of nhom.children) if (m.isMesh && !m.userData.rieng) {
      if (m.material === VL_MAU_DINH && trong) m.material = VL_NEN_TRONG;
      else if (m.material.vertexColors && !m.material.map && m.material.side === THREE.DoubleSide && trong) m.material = VL_NEN_TRONG_2;
    }
    return { id, nhom, canDs, capNhat, tam: NOI_NGOAI[id].tam };
  };
  return k;
}

// =============================================================================================
// 1. QUÁN ỐC ĐÊM — vỉa hè một con phố nhỏ, ghế nhựa, bàn inox thấp, nồi hấp nghi ngút, dây đèn bóng tròn
function dungQuanOc(k) {
  const { H, T, C, V, P } = k;
  // vỉa hè gạch, bó vỉa, lòng đường, vỉa hè bên kia
  k.san(-13, -5, 13, 0, { o: 0.4, mau: [0xa8574a, 0x9c958a], khe: 0.025, mauKhe: 0x5f5950, bien: 0.07 });
  H(26.4, 0.16, 0.22, 0xc9c3b6, 0, -0.14, 0.1);
  P(26.4, 7.2, 0x34363b, 0, -0.12, 3.8, { nam: true });
  k.san(-13, 7.4, 13, 9.3, { o: 0.4, mau: [0x9c958a, 0xa8a196], khe: 0.025, mauKhe: 0x5f5950, bien: 0.06 });
  H(26.4, 0.16, 0.22, 0xc9c3b6, 0, -0.14, 7.3);
  for (let x = -11; x <= 11; x += 4) H(2, 0.01, 0.14, 0xe8e4d6, x, -0.115, 3.8);
  T(0.36, 0.36, 0.012, 0x222326, 4.6, -0.12, 2.6, { seg: 12 }); T(0.36, 0.36, 0.012, 0x222326, -7, -0.12, 5.2, { seg: 12 });
  for (const [x, z, w] of [[-3, 1.4, 1.2], [7.5, 5.6, 1.6], [-9.5, 3.4, 0.9]]) k.C(w / 2, 0x45484f, x, -0.118, z, { sy: 0.01, sz: 0.6, ct: 1 }); // vũng nước
  // hai đầu phố: tường hồi nhà (tây) và hàng rào công trình (đông)
  H(0.4, 14, 22, 0xd8c8a8, -13.4, -0.2, 2, { can: true, tuong: true });
  const qc = k.vung(512, 384, veBien(gradDoc("#ffcf3a", "#e8702a"), [["BIA HÓNG", 0.2, 0.3, "#7a1424"], ["MÁT LẠNH", 0.12, 0.52, "#ffffff"], ["TỪNG GIỌT", 0.12, 0.68, "#ffffff"], ["SẢN XUẤT TẠI QUẬN HÓNG", 0.05, 0.88, "#3a1d0a", 700]]));
  V(qc, 4.4, 3.3, -13.19, 4.6, 1.5, { ry: Math.PI / 2 });
  H(0.12, 3.2, 3.4, 0x3a3d44, -13.18, 0, 5.6); // cửa cuốn hông nhà
  const raoCT = k.vung(512, 160, (g, w, h) => { for (let i = 0; i < 16; i++) { g.fillStyle = i % 2 ? "#1f4fa8" : "#f2f2f2"; g.fillRect(i * w / 16, 0, w / 16, h); } g.fillStyle = "rgba(255,255,255,.92)"; g.fillRect(0, h * 0.3, w, h * 0.42); chu(g, "CÔNG TRÌNH ĐANG THI CÔNG – XIN LỖI VÌ SỰ BẤT TIỆN", w / 2, h * 0.51, h * 0.17, "#c0262d", { toiDa: w * 0.94 }); });
  for (let z = -4.8; z < 9.2; z += 2.3) V(raoCT, 2.3, 2.5, 12.9, 1.25, Math.min(z + 1.15, 8.1), { ry: -Math.PI / 2, hai: true });
  H(0.1, 2.5, 14.2, 0xd9d9d9, 13.0, 0, 2.2, { can: true, tuong: true });
  H(14, 26, 30, 0xb9b0a0, 21, -0.2, 2); H(30, 22, 4, 0xc8b8a8, 0, -0.2, 14.5); H(30, 22, 4, 0xc8b8a8, 0, -0.2, -15.5);
  // mặt tiền dãy bắc: hai nhà bên trái, QUÁN ỐC giữa, hai nhà bên phải
  k.nhaPho(-13, -5, 0, 4.6, 4, { ten: "TẠP HÓA CÔ BA", mauBien: ["#2e8b57", "#ffffff"], cua: "cuon", sau: 8 });
  k.nhaPho(-8.4, -5, 0, 4.4, 3, { ten: "GỘI ĐẦU DƯỠNG SINH", mauBien: ["#f26fa6", "#ffffff"], cua: "mo", mauTrong: 0xffd9e8, sangTrong: true, denBien: true, sau: 8 });
  k.nhaPho(4, -5, 0, 4.3, 5, { ten: "NHÀ THUỐC AN TÂM", mauBien: ["#ffffff", "#1f7a4a"], cua: "mo", mauTrong: 0xeaf6ee, sangTrong: true, denBien: true, sau: 8 });
  k.nhaPho(8.3, -5, 0, 4.7, 3, { ten: "SỬA XE UY TÍN", mauBien: ["#1f4fa8", "#ffffff"], cua: "cuon", sau: 8 });
  H(0.5, 0.5, 0.06, 0x2fbf5a, 6.15, 3.9, -4.85, { sang: true }); H(0.16, 0.5, 0.07, 0xffffff, 6.15, 3.9, -4.84, { sang: true }); H(0.5, 0.16, 0.07, 0xffffff, 6.15, 4.07, -4.84, { sang: true }); // chữ thập nhà thuốc
  // ---- Quán ốc: gian trong (x −4..4, z −10.4..−5)
  const Q = 0xe9dcc0;
  H(0.3, 3.1, 5.6, Q, -4.05, 0, -7.7, { can: true, tuong: true }); H(0.3, 3.1, 5.6, Q, 4.05, 0, -7.7, { can: true, tuong: true });
  H(8.4, 3.1, 0.3, Q, 0, 0, -10.55, { can: true, tuong: true });
  H(8.4, 0.2, 5.8, 0xd8ccb0, 0, 3.0, -7.7); H(8.4, 10, 6.0, 0xf0d9a8, 0, 3.2, -8.0);
  k.luoi(7.8, 1.4, 26, 7, (i, j) => (i + j) % 2 ? 0x9fc6d9 : 0xd8e8ef, 0, 0.75, -10.39, 0, { khe: 0.01 }); // gạch men ốp tường
  k.san(-3.9, -10.4, 3.9, -5.05, { o: 0.4, mau: [0xb9473a, 0xd9cfc0], khe: 0.015, mauKhe: 0x8a8070 });
  for (const x of [-2.6, 0, 2.6]) k.denOng(x, 3.0, -7.6, 0, 1.2);
  // ban công + tầng trên của quán
  for (let t = 2; t < 4; t++) { const y = t * 3.3; H(7.6, 0.12, 0.85, 0xd9c8a0, 0, y, -4.6); H(7.6, 0.05, 0.05, 0x3a3d44, 0, y + 1, -4.2); for (let x = -3.7; x < 3.8; x += 0.3) H(0.025, 0.9, 0.025, 0x3a3d44, x, y + 0.1, -4.2); P(3, 1.9, t === 2 ? 0xffd890 : 0x3a4855, -1.2, y + 1.3, -4.98, { sang: t === 2 }); H(0.75, 0.48, 0.26, 0xf2f2f2, 2.6, y + 2.3, -4.85); }
  // biển hiệu chính QUÁN ỐC ĐÊM (đèn hộp)
  const bien = k.vung(1024, 200, (g, w, h) => {
    g.fillStyle = "#b31b1b"; g.fillRect(0, 0, w, h); g.strokeStyle = "#ffe14d"; g.lineWidth = 10; g.strokeRect(12, 12, w - 24, h - 24);
    chu(g, "QUÁN ỐC ĐÊM", w / 2, h * 0.42, 104, "#ffe14d", { font: FONT_TRON, toiDa: w * 0.84, bong: 14, mauBong: "#ff9a3a" });
    chu(g, "ỐC HƯƠNG · SÒ ĐIỆP · NGHÊU HẤP SẢ · MỞ CỬA 17H – 2H SÁNG", w / 2, h * 0.8, 30, "#ffffff", { dam: 700, toiDa: w * 0.88 });
  });
  V(bien, 8.2, 1.6, 0, 4.05, -4.86, { sang: true });
  H(8.4, 1.8, 0.12, 0x2a2c31, 0, 3.15, -4.98);
  // bạt che nắng sọc đỏ trắng
  const bat = k.vungChung("batdo", 128, 64, (g, w, h) => { for (let i = 0; i < 8; i++) { g.fillStyle = i % 2 ? "#f6f6f2" : "#c0262d"; g.fillRect(i * w / 8, 0, w / 8, h); } });
  const batM = k.HA(bat, 8.2, 0.04, 3.4, 0, 2.62, -3.3, { rx: 0.2 });
  for (const x of [-4, 4]) H(0.05, 2.35, 0.05, 0x8a8d92, x, 0, -1.65);
  // bếp hấp ốc ở mặt tiền: quầy inox, ba bếp gas, ba nồi lớn
  H(2.8, 0.82, 0.75, 0xc9ccd1, -2.6, 0, -4.6, { can: true }); H(2.9, 0.04, 0.8, 0xe3e5e8, -2.6, 0.82, -4.6);
  for (const [i, x] of [-3.5, -2.6, -1.7].entries()) { T(0.2, 0.22, 0.08, 0x2a2c31, x, 0.86, -4.6); T(0.27, 0.25, 0.42, i === 1 ? 0xb5b8bd : 0x9aa0a6, x, 0.94, -4.6, { seg: 12 }); T(0.29, 0.29, 0.04, 0xd5d9dd, x, 1.36, -4.6, { seg: 12 }); T(0.03, 0.03, 0.06, 0x2a2c31, x, 1.4, -4.6); }
  H(0.4, 0.55, 0.3, 0x2e6ac8, -3.9, 0, -4.15); // bình gas
  // tủ kính hải sản tươi + mẹt ốc
  H(2.6, 0.75, 0.62, 0xc9ccd1, 2.4, 0, -4.55, { can: true }); H(2.6, 0.5, 0.62, k.kinh, 2.4, 0.75, -4.55); H(2.6, 0.04, 0.62, 0xd5d9dd, 2.4, 1.25, -4.55);
  for (let i = 0; i < 5; i++) { const x = 1.4 + i * 0.5; H(0.42, 0.06, 0.45, 0xe8e8e8, x, 0.76, -4.55); for (let j = 0; j < 4; j++) C(0.05, [0x8a6a4a, 0x5a4a3a, 0xe8c8a0, 0x2a2c31, 0xd9a07a][i], x - 0.12 + (j % 2) * 0.22, 0.85, -4.65 + Math.floor(j / 2) * 0.2); }
  for (let i = 0; i < 4; i++) { T(0.26, 0.22, 0.12, 0xb08a5a, -0.6 + i * 0.36, 0, -5.4 + (i % 2) * 0.3, { seg: 10 }); C(0.17, [0x6a5a4a, 0x2a2c31, 0xc8a080, 0x8a7a5a][i], -0.6 + i * 0.36, 0.14, -5.4 + (i % 2) * 0.3, { sy: 0.4 }); } // thau ốc sống
  // bảng thực đơn trên giá
  const menu = k.vung(320, 420, (g, w, h) => {
    g.fillStyle = "#1f2a24"; g.fillRect(0, 0, w, h); g.strokeStyle = "#c8a060"; g.lineWidth = 10; g.strokeRect(5, 5, w - 10, h - 10);
    chu(g, "THỰC ĐƠN", w / 2, 44, 40, "#ffe14d", { font: FONT_TRON, toiDa: w - 40 });
    [["Ốc hương xào bơ", "89K"], ["Sò điệp nướng mỡ hành", "79K"], ["Nghêu hấp sả", "59K"], ["Ốc len xào dừa", "69K"], ["Sò huyết rang me", "79K"], ["Càng ghẹ rang muối", "99K"], ["Bia Hóng (lon)", "20K"]]
      .forEach(([a, b], i) => { chu(g, a, 22, 100 + i * 44, 22, "#f6efe0", { canh: "left", dam: 600, toiDa: w - 110 }); chu(g, b, w - 22, 100 + i * 44, 22, "#ffcf3a", { canh: "right", toiDa: 80 }); });
  });
  const gia = k.nhomCon(-5.0, -4.3, 0.35); V(menu, 0.75, 0.98, 0, 1.05, 0.02, { cha: gia }); H(0.8, 1.04, 0.03, 0x6b4a2f, 0, 0.53, 0, { cha: gia }); H(0.04, 0.9, 0.04, 0x6b4a2f, 0, 0, -0.3, { cha: gia, rx: -0.3 }); gia.can(0, -0.1, 0.8, 0.4);
  // hộp đèn đứng "ỐC" trên vỉa hè
  const hopDen = k.vung(128, 320, veBien("#ffe14d", [["ỐC", 0.26, 0.32, "#b31b1b", 800, FONT_TRON], ["NGON", 0.13, 0.62, "#b31b1b"], ["RẺ", 0.13, 0.8, "#b31b1b"]]));
  const hd = k.nhomCon(4.5, -0.9, -0.3); k.HA(hopDen, 0.5, 1.25, 0.32, 0, 0, 0, { cha: hd, sang: true }); hd.can(0, 0, 0.5, 0.32);
  // trong quán: tủ bia, bàn thờ thần tài, hai bàn
  H(1.2, 1.9, 0.7, 0xc0262d, 3.2, 0, -9.95, { can: true }); H(1.0, 1.4, 0.02, 0x9fd3f2, 3.2, 0.3, -9.59, { sang: true });
  for (let i = 0; i < 3; i++) for (let j = 0; j < 5; j++) T(0.04, 0.04, 0.18, 0x2e8b57, 2.85 + j * 0.17, 0.42 + i * 0.42, -9.62);
  const tuBia = k.vung(256, 64, veBien("#c0262d", [["BIA HÓNG", 0.62, 0.5, "#ffe14d"]])); V(tuBia, 1.1, 0.28, 3.2, 1.75, -9.58, { sang: true });
  H(0.9, 0.7, 0.5, 0xb31b1b, -3.4, 0, -10.1, { can: true }); C(0.1, 0xffcf3a, -3.55, 0.82, -10.1, { sang: true }); C(0.08, 0xffcf3a, -3.25, 0.8, -10.1, { sang: true });
  H(0.08, 0.2, 0.08, 0xd94d4d, -3.15, 0.7, -9.95, { sang: true }); H(0.08, 0.2, 0.08, 0xd94d4d, -3.65, 0.7, -9.95, { sang: true });
  const banInox = (x, z, mau = 0xc9ccd1, ghe = 0xc0262d) => {
    k.ban(x, z, 0.9, 0.6, 0.55, mau, 0x9aa0a6);
    for (const [a, b] of [[-0.78, 0], [0.78, 0], [0, -0.62], [0, 0.62]]) k.gheNhua(x + a, z + b, ghe);
    // đồ ăn trên bàn: dĩa ốc, chén nước chấm, lon bia, hộp giấy, vỏ ốc rơi
    T(0.15, 0.13, 0.03, 0xf6f6f2, x - 0.18, 0.55, z, { seg: 10 }); for (let i = 0; i < 5; i++) C(0.035, 0x6a4a2a, x - 0.24 + (i % 3) * 0.06, 0.6, z - 0.04 + Math.floor(i / 3) * 0.07);
    T(0.13, 0.11, 0.03, 0xf6f6f2, x + 0.2, 0.55, z + 0.08, { seg: 10 }); for (let i = 0; i < 4; i++) C(0.04, 0xd9a07a, x + 0.16 + (i % 2) * 0.08, 0.6, z + 0.05 + Math.floor(i / 2) * 0.06);
    T(0.04, 0.04, 0.03, 0xf6f6f2, x + 0.05, 0.55, z - 0.2, { seg: 8 }); T(0.033, 0.033, 0.12, 0x2e8b57, x + 0.32, 0.55, z - 0.15, { seg: 8 }); T(0.033, 0.033, 0.12, 0x2e8b57, x - 0.36, 0.55, z + 0.18, { seg: 8 });
    H(0.12, 0.07, 0.08, 0xf2f2f2, x + 0.36, 0.55, z + 0.2);
    for (let i = 0; i < 4; i++) C(0.03, 0x8a7a6a, x - 0.5 + k.rnd(), 0.02, z + 0.45 + k.rnd() * 0.3, { sy: 0.5 });
  };
  const BAN = [[-8.6, -2.4, 0x2a5aa8], [-5.4, -2.2, 0xc0262d], [-1.2, -2.2, 0xc0262d], [3.2, -2.2, 0x2a5aa8], [7.0, -2.4, 0xc0262d], [10.3, -2.6, 0x2a5aa8], [-6.6, 1.7, 0x2a5aa8], [5.55, 1.7, 0xc0262d], [-2.2, -7.2, 0xc0262d], [1.8, -7.4, 0x2a5aa8]];
  for (const [x, z, m] of BAN) banInox(x, z, 0xc9ccd1, m);
  // thùng đá xốp, két bia chồng
  H(0.7, 0.45, 0.45, 0xf6f6f2, -4.6, 0, -3.4, { can: true }); H(0.72, 0.05, 0.47, 0xe6e6e6, -4.6, 0.45, -3.4);
  for (let i = 0; i < 3; i++) H(0.42, 0.28, 0.32, 0xffcf3a, 0.6, i * 0.28, -3.9, { can: i === 0 }); H(0.42, 0.28, 0.32, 0xffcf3a, 1.05, 0, -3.9, { can: true });
  // cây xanh vỉa hè + cột điện + đèn đường
  T(0.17, 0.22, 6.5, 0x6b4a2f, 8.7, 0, -0.7, { can: true }); T(0.24, 0.24, 1, 0xf2f2f2, 8.7, 0, -0.7);
  for (let i = 0; i < 4; i++) C(1.2 + k.rnd() * 0.4, [0x2f6b2a, 0x3d7a34, 0x4f8a3c][i % 3], 8.7 + (k.rnd() - 0.5) * 2, 6.8 + k.rnd() * 1.2, -0.7 + (k.rnd() - 0.2) * 1.8);
  T(0.13, 0.16, 8.5, 0x9a958a, -11.8, 0, -0.4, { can: true }); H(1.6, 0.1, 0.1, 0x8a857a, -11.8, 7.6, -0.4); T(0.28, 0.28, 0.75, 0x6d7175, -11.5, 6.0, -0.4);
  T(0.08, 0.1, 7.0, 0x5a5d63, 11.6, 0, 0.35, { can: true }); H(0.08, 0.08, 1.8, 0x5a5d63, 11.6, 6.9, 1.2); H(0.45, 0.1, 0.7, 0xffc76a, 11.6, 6.78, 2.0, { sang: true });
  k.vungSang(11.6, 2.4, 3.2, -0.1);
  const cot = [-11.8, 7.9, -0.4];
  for (const [x, z] of [[-13, -4.9], [-4, -4.9], [4, -4.9], [13, -4.9], [12.9, 9.2], [-13, 9.2]]) k.day(k.vong(cot, [x, 6.2 + k.rnd(), z], 0.6));
  for (let i = 0; i < 4; i++) k.day(k.vong([-11.8, 7.1 + i * 0.25, -0.4], [12.9, 6.8 + i * 0.2, -0.2], 0.9, 12));
  // dây đèn bóng tròn từ mép bạt ra cột tre ở mép đường
  for (const x of [-10.6, -6.8, -3.2, 0.6, 4.4, 9.6]) { T(0.035, 0.04, 2.7, 0x8a7a4a, x, 0, -0.15); }
  const bong = (a, b, n) => { const p = k.vong(a, b, 0.28, n); k.day(p); for (let i = 1; i < p.length - 1; i++) C(0.045, 0xffd27a, p[i][0], p[i][1] - 0.06, p[i][2], { sang: true, ct: 1 }); };
  const dinh = [[-10.6, 2.68, -0.15], [-6.8, 2.68, -0.15], [-3.2, 2.68, -0.15], [0.6, 2.68, -0.15], [4.4, 2.68, -0.15], [9.6, 2.68, -0.15]];
  for (let i = 1; i < dinh.length; i++) bong(dinh[i - 1], dinh[i], 7);
  for (const [a, b] of [[0, [-12.4, 3.0, -4.95]], [0, [-8.6, 3.0, -4.95]], [1, [-5.2, 3.0, -4.95]], [4, [5.4, 3.0, -4.95]], [5, [8.4, 3.0, -4.95]], [5, [12.4, 3.0, -4.95]]]) bong(dinh[a], b, 6);
  bong([-4.05, 2.3, -1.62], [4.05, 2.3, -1.62], 9);
  for (const [x, z] of [[-8.6, -2.4], [-5.4, -2.2], [-1.2, -2.2], [3.2, -2.2], [7, -2.4], [-6.6, 1.7], [5.55, 1.7]]) k.vungSang(x, z, 1.7);
  k.vungSang(0, -7.5, 3.2, 0.01);
  // xe máy dựng dọc mép đường và bên kia đường
  for (const [x, z, r] of [[-12.2, 0.9, 1.9], [-11.4, 1.0, 1.9], [11.2, 0.9, -1.2], [-9.6, 7.9, -0.4], [-8.8, 7.9, -0.4], [-1.8, 7.9, -0.4], [3.4, 7.9, -0.4], [4.2, 7.9, -0.4], [9.8, 7.9, -0.4]]) k.xeMay(x, z, r);
  k.can(-13, 13, 8.4, 9.4); // không lên vỉa hè bên kia (đầy xe dựng)
  // dãy nhà bên kia đường (nhìn về −z)
  k.nhaPho(-5.2, 9.3, Math.PI, 7.8, 4, { ten: "PHỞ ƯỚC MƠ", mauBien: ["#f2f2f2", "#c0262d"], cua: "cuon" });
  k.nhaPho(2.6, 9.3, Math.PI, 7.8, 3, { ten: "BIDA CƠ BẢN", mauBien: ["#1c1c1f", "#3fe07a"], cua: "mo", mauTrong: 0x2a4a3a, sangTrong: true, denBien: true });
  k.nhaPho(13, 9.3, Math.PI, 10.4, 5, { ten: "KARAOKE HÁT CHO NHAU NGHE", mauBien: ["#7b2a52", "#ffe14d"], cua: "mo", mauTrong: 0x7a3a6a, sangTrong: true, denBien: true });
  // hơi nước bốc lên từ ba nồi (Points cộng sáng, 1 lượt vẽ)
  const N = k.dienThoai ? 12 : 24, pos = new Float32Array(N * 3), col = new Float32Array(N * 3), tuoi = new Float32Array(N);
  for (let i = 0; i < N; i++) tuoi[i] = Math.random();
  const gp = new THREE.BufferGeometry(); gp.setAttribute("position", new THREE.BufferAttribute(pos, 3)); gp.setAttribute("color", new THREE.BufferAttribute(col, 3));
  const hoi = new THREE.Points(gp, new THREE.PointsMaterial({ size: 0.55, map: texTron(), vertexColors: true, transparent: true, depthWrite: false, blending: THREE.AdditiveBlending, fog: k.fog }));
  hoi.frustumCulled = false; k.dong(hoi);
  const NOI = [-3.5, -2.6, -1.7];
  k.moi((dt, t) => {
    for (let i = 0; i < N; i++) {
      tuoi[i] += dt * 0.45; if (tuoi[i] > 1) tuoi[i] -= 1;
      const a = tuoi[i], x0 = NOI[i % 3];
      pos.set([x0 + Math.sin(t * 1.3 + i) * 0.12 * a + a * 0.25, 1.42 + a * 1.5, -4.6 + Math.cos(t + i * 2) * 0.1 * a], i * 3);
      const v = Math.sin(a * Math.PI) * 0.32; col.set([v, v, v], i * 3);
    }
    gp.attributes.position.needsUpdate = gp.attributes.color.needsUpdate = true;
  });
  void batM;
}

// =============================================================================================
// 2. ĐÀI TIVI HÓNG — trường quay: màn LED, bàn dẫn, máy quay, giàn đèn, phòng điều khiển kính
function dungDaiTivi(k) {
  const { H, T, C, V, P } = k;
  const X1 = -10, X2 = 10, Z1 = -8, Z2 = 7, CAO = 6;
  k.phong(X1, Z1, X2, Z2, CAO, { mau: 0x2a2c31, tran: 0x16171a, cua: { nam: [[-1, 1]], dong: [[-3, 3]] }, caoCua: 2.4 });
  // cửa ra vào đóng (phía nam) và khoang cửa
  H(2, 2.4, 0.08, 0x3a3d44, 0, 0, Z2 + 0.25, { can: true, tuong: true });
  k.san(X1, Z1, X2, Z2, { o: 2, mau: [0x4a4c51, 0x46484d], bien: 0.03 });
  // tấm tiêu âm trên tường
  for (let x = X1 + 1; x < X2 - 1; x += 1.6) for (const y of [2.6, 4.1]) { if (Math.abs(x) > 1.5 || y > 3) H(1.4, 1.3, 0.08, 0x34363b, x, y, Z2 - 0.04); }
  for (let z = Z1 + 1.2; z < Z2 - 1; z += 1.6) for (const y of [2.6, 4.1]) H(0.08, 1.3, 1.4, 0x34363b, X1 + 0.04, y, z);
  // sàn sân khấu nâng nhẹ + màn LED
  H(13, 0.1, 4.8, 0x1c1c1f, 0, 0, -5.6); H(13.04, 0.1, 0.06, 0x7fd3ff, 0, 0.0, -3.2, { sang: true });
  const led = k.vung(1024, 400, (g, w, h) => {
    const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#0b1e5a"); gr.addColorStop(0.55, "#2a3fb8"); gr.addColorStop(1, "#e2468f"); g.fillStyle = gr; g.fillRect(0, 0, w, h);
    g.strokeStyle = "rgba(255,255,255,.09)"; g.lineWidth = 2; for (let i = 0; i < 18; i++) { g.beginPath(); g.arc(w * 0.78, h * 0.4, 30 + i * 26, 0, 7); g.stroke(); }
    g.fillStyle = "rgba(0,0,0,.25)"; for (let x = 0; x < w; x += 8) g.fillRect(x, 0, 1, h); for (let y = 0; y < h; y += 8) g.fillRect(0, y, w, 1);
    chu(g, "ĐÀI TIVI HÓNG", w * 0.44, h * 0.4, 104, "#ffffff", { font: FONT_TRON, toiDa: w * 0.78, bong: 18, mauBong: "#7fd3ff" });
    chu(g, "TIN NÓNG · HÓNG NHANH · NÓI THẲNG", w * 0.44, h * 0.62, 34, "#ffe14d", { dam: 700, toiDa: w * 0.78 });
    g.fillStyle = "#e2468f"; g.fillRect(0, h * 0.84, w, h * 0.16); chu(g, "TRỰC TIẾP  ·  BẢN TIN HÓNG 24/7  ·  ĐỪNG ĐỔI KÊNH", w / 2, h * 0.92, 30, "#ffffff", { toiDa: w * 0.95 });
  });
  V(led, 12, 4.7, 0, 3.05, Z1 + 0.21, { sang: true });
  H(12.4, 5.1, 0.2, 0x111114, 0, 0.6, Z1 + 0.08);
  // bàn dẫn chương trình cong (ghép 5 khúc)
  const R = 3.6, tamZ = -8.6;
  for (let i = -2; i <= 2; i++) {
    const a = i * 0.2, x = Math.sin(a) * R, z = tamZ + Math.cos(a) * R;
    H(0.76, 0.92, 0.5, 0xf2f2f2, x, 0.1, z, { ry: a }); H(0.78, 0.05, 0.75, 0x1c1c1f, x - Math.sin(a) * 0.08, 1.02, z - Math.cos(a) * 0.12, { ry: a });
    H(0.68, 0.08, 0.02, 0x7fd3ff, x + Math.sin(a) * 0.26, 0.5, z + Math.cos(a) * 0.26, { ry: a, sang: true });
  }
  k.can(-1.9, 1.9, -5.55, -4.7);
  const logoBan = k.vung(256, 128, veBien("#e2468f", [["HÓNG TV", 0.5, 0.52, "#ffffff", 800, FONT_TRON]], { tron: 18 }));
  V(logoBan, 0.9, 0.45, 0, 0.62, -4.73, { sang: true });
  for (const x of [-0.9, 0.9]) { k.ghe(x, -5.85, 0, 0x1c1c1f, { cao: 0.5, lung: 0.7, chan: 0x8a8d92 }); T(0.14, 0.14, 0.02, 0x9fd3f2, x * 0.7, 1.07, -5.0, { sang: true, seg: 6 }); }
  H(0.36, 0.02, 0.26, 0x2a2c31, -0.5, 1.07, -5.15); H(0.36, 0.22, 0.02, 0x2a2c31, -0.5, 1.08, -5.3, { rx: 0.3 }); H(0.2, 0.01, 0.28, 0xf6f6f2, 0.55, 1.075, -5.05); T(0.04, 0.035, 0.1, 0xe8702a, 1.2, 1.07, -5.0);
  // góc phỏng vấn
  P(3.2, 3.2, 0x6b3fa0, -6.4, 0.012, -0.3, { nam: true });
  k.ghe(-6.1, -0.6, 2.4, 0xe8702a, { cao: 0.46, lung: 0.55 }); k.ghe(-7.4, 0.6, -0.9, 0xe8702a, { cao: 0.46, lung: 0.55 });
  k.ban(-6.9, 0.0, 0.6, 0.6, 0.45, 0xf2f2f2, 0xf2f2f2, { tron: true }); T(0.04, 0.035, 0.1, 0xffffff, -6.8, 0.45, 0.05);
  const hongChuyen = k.vung(256, 512, veBien(gradDoc("#7b2a52", "#e2468f"), [["HÓNG", 0.11, 0.3, "#ffffff", 800, FONT_TRON], ["CHUYỆN", 0.11, 0.44, "#ffe14d", 800, FONT_TRON], ["TALKSHOW", 0.05, 0.6, "#ffffff", 700], ["THỨ SÁU · 20:00", 0.045, 0.85, "#ffffff", 600]]));
  V(hongChuyen, 1.6, 3.2, X1 + 0.1, 2.2, -0.3, { ry: Math.PI / 2 });
  k.cay(-8.9, -2.0, 1.4, { kieu: "la_to" });
  // ba máy quay trên chân
  const mayQuay = (x, z, ry) => {
    const g = k.nhomCon(x, z, ry), c = { cha: g };
    for (let i = 0; i < 3; i++) { const a = i * 2.094; H(0.05, 1.25, 0.05, 0x2a2c31, Math.sin(a) * 0.32, 0, Math.cos(a) * 0.32, { cha: g, rx: Math.cos(a) * 0.25, rz: -Math.sin(a) * 0.25 }); }
    T(0.05, 0.05, 0.3, 0x2a2c31, 0, 1.15, 0, c); H(0.32, 0.36, 0.62, 0x1c1c1f, 0, 1.42, 0.02, c); T(0.11, 0.13, 0.32, 0x111111, 0, 1.6, -0.38, { cha: g, rx: Math.PI / 2 });
    H(0.36, 0.26, 0.04, 0x2a2c31, 0, 1.47, -0.58, c); H(0.3, 0.2, 0.01, 0x9fd3f2, 0, 1.5, 0.33, { cha: g, sang: true });
    H(0.05, 0.05, 0.05, 0xff2a2a, 0.12, 1.79, -0.2, { cha: g, sang: true }); H(0.5, 0.03, 0.03, 0x555555, 0, 1.38, 0.45, c);
    g.can(0, 0, 0.8, 0.8);
  };
  mayQuay(-3.1, 1.6, -0.44); mayQuay(1.3, 3.0, 0.2); mayQuay(3.6, 1.4, 0.5);
  // giàn đèn trên trần
  for (const z of [-5.5, -2, 1.5]) H(18, 0.12, 0.12, 0x8a8d92, 0, 4.9, z);
  for (const x of [-8, 0, 8]) H(0.12, 0.12, 9, 0x8a8d92, x, 4.9, -2);
  for (const [x, z, rx] of [[-5, -2, 0.7], [-2, -2, 0.7], [2, -2, 0.7], [5, -2, 0.7], [-6, 1.5, 0.9], [-1, 1.5, 0.9], [1, 1.5, 0.9], [6, 1.5, 0.9], [-4, -5.5, -0.4], [4, -5.5, -0.4]]) {
    const g = k.nhomCon(x, z, 0, 4.55); T(0.16, 0.13, 0.36, 0x1c1c1f, 0, 0, 0, { cha: g, rx }); C(0.12, 0xfff3d0, 0, 0.18 - Math.sin(rx) * 0.0, -Math.sin(rx) * 0.19, { cha: g, sang: true, sy: 0.4 });
    H(0.03, 0.3, 0.03, 0x555555, 0, 0.24, 0, { cha: g });
  }
  // softbox hai bên bàn dẫn
  for (const x of [-4.8, 4.8]) { T(0.03, 0.03, 1.9, 0x2a2c31, x, 0, -3.6, { can: true }); H(0.8, 0.8, 0.08, 0xfffaf0, x, 1.8, -3.6, { ry: x < 0 ? -0.6 : 0.6, sang: true }); }
  // boom mic
  T(0.03, 0.03, 2.2, 0x2a2c31, 2.4, 0, -3.3, { can: true }); H(2.0, 0.03, 0.03, 0x2a2c31, 1.5, 2.2, -3.6, { ry: 0.3 }); T(0.05, 0.05, 0.3, 0x555555, 0.6, 2.05, -3.9, { rz: Math.PI / 2 });
  // màn hình kiểm tra trên xe đẩy
  const monitor = k.vung(256, 160, (g, w, h) => { const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#2a3fb8"); gr.addColorStop(1, "#e2468f"); g.fillStyle = gr; g.fillRect(0, 0, w, h); g.fillStyle = "#f2f2f2"; g.fillRect(w * 0.3, h * 0.55, w * 0.4, h * 0.25); g.fillStyle = "#e2a07a"; g.beginPath(); g.arc(w * 0.4, h * 0.45, 12, 0, 7); g.arc(w * 0.6, h * 0.45, 12, 0, 7); g.fill(); g.fillStyle = "#c0262d"; g.fillRect(6, 6, 52, 20); chu(g, "REC", 32, 16, 14, "#fff", { toiDa: 46 }); });
  for (const [x, z, r] of [[-7.5, 3.6, 0.6], [7.2, -1.2, -0.9]]) { const g = k.nhomCon(x, z, r); H(0.6, 0.9, 0.5, 0x2a2c31, 0, 0, 0, { cha: g }); H(0.8, 0.5, 0.06, 0x111111, 0, 1.0, 0, { cha: g }); V(monitor, 0.74, 0.44, 0, 1.25, 0.035, { cha: g, sang: true }); g.can(0, 0, 0.7, 0.6); }
  // hàng ghế khách mời / khán giả nhỏ
  for (const [x, z] of [[6.6, 1.2], [7.4, 1.2], [8.2, 1.2], [6.6, 2.4], [7.4, 2.4], [8.2, 2.4]]) k.ghe(x, z, -Math.PI / 2 - 0.4, 0x2a5aa8, { lung: 0.45, can: false });
  k.can(6.3, 8.5, 0.9, 2.7);
  // ghế đạo diễn
  const daoDien = k.vung(256, 80, veBien("#1c1c1f", [["ĐẠO DIỄN", 0.55, 0.52, "#ffe14d"]]));
  const gd = k.nhomCon(4.8, 4.2, Math.PI - 0.5); for (const sx of [-1, 1]) for (const sz of [-1, 1]) H(0.04, 0.95, 0.04, 0x6b4a2f, sx * 0.24, 0, sz * 0.2, { cha: gd, rz: sx * 0.08 }); H(0.5, 0.04, 0.42, 0x1c1c1f, 0, 0.75, 0, { cha: gd }); V(daoDien, 0.5, 0.18, 0, 1.25, -0.19, { cha: gd, ry: Math.PI }); H(0.5, 0.2, 0.02, 0x1c1c1f, 0, 1.15, -0.2, { cha: gd }); gd.can(0, 0, 0.55, 0.5);
  // bàn trang điểm cạnh cửa: gương viền bóng đèn
  H(1.8, 0.78, 0.5, 0xf2f2f2, -8.2, 0, 6.6, { can: true }); H(1.4, 0.9, 0.03, 0xb8d4e0, -8.2, 1.2, 6.82); for (let i = 0; i < 6; i++) C(0.04, 0xfff3d0, -8.85 + i * 0.26, 2.15, 6.8, { sang: true }); for (let j = 0; j < 3; j++) { C(0.04, 0xfff3d0, -8.95, 1.3 + j * 0.3, 6.8, { sang: true }); C(0.04, 0xfff3d0, -7.45, 1.3 + j * 0.3, 6.8, { sang: true }); }
  k.ghe(-8.2, 5.9, Math.PI, 0xf26fa6, { can: false });
  // giá treo trang phục
  H(1.6, 0.04, 0.04, 0x8a8d92, -5.4, 1.75, 6.5); for (const x of [-6.2, -4.6]) H(0.04, 1.75, 0.04, 0x8a8d92, x, 0, 6.5);
  for (let i = 0; i < 6; i++) H(0.36, 0.9, 0.08, [0xf26fa6, 0x2a5aa8, 0xffcf3a, 0x1c1c1f, 0xc0262d, 0xf6f6f2][i], -6.0 + i * 0.25, 0.8, 6.5, { ry: 0.2 });
  k.can(-6.3, -4.5, 6.3, 6.8);
  // biển ĐANG GHI HÌNH trên cửa
  const ghiHinh = k.vung(320, 80, veBien("#300", [["● ĐANG GHI HÌNH", 0.55, 0.52, "#ff3a3a"]]));
  const ghM = V(ghiHinh, 1.4, 0.35, 0, 2.75, Z2 - 0.02, { ry: Math.PI, sang: true });
  // phòng điều khiển sau kính (tường đông)
  H(0.2, 1.15, 6, 0x2a2c31, X2 + 0.1, 0, 0, { can: true, tuong: true }); H(0.06, 1.25, 6, k.kinh, X2 + 0.1, 1.15, 0); H(0.22, 0.06, 6, 0x111111, X2 + 0.1, 1.12, 0);
  H(4, 0.15, 7, 0x1c1c1f, 12.2, 0, 0); H(0.2, 6, 7, 0x2a2c31, 14.3, 0, 0); H(4.3, 6, 0.2, 0x2a2c31, 12.2, 0, -3.5); H(4.3, 6, 0.2, 0x2a2c31, 12.2, 0, 3.5); H(4.3, 0.15, 7, 0x16171a, 12.2, 3.2, 0);
  H(1.0, 0.85, 5.6, 0x3a3c40, 11.0, 0, 0); for (let i = 0; i < 12; i++) H(0.05, 0.03, 0.08, [0xff3a3a, 0x3fe07a, 0xffcf3a][i % 3], 11.0, 0.86, -2.5 + i * 0.45, { sang: true });
  const manTuong = k.vung(512, 192, (g, w, h) => { g.fillStyle = "#111"; g.fillRect(0, 0, w, h); for (let i = 0; i < 4; i++) for (let j = 0; j < 2; j++) { const gr = g.createLinearGradient(0, 0, 128, 96); gr.addColorStop(0, ["#2a3fb8", "#e2468f", "#2e8b57", "#e8702a"][(i + j) % 4]); gr.addColorStop(1, "#111"); g.fillStyle = gr; g.fillRect(i * 128 + 4, j * 96 + 4, 120, 88); } chu(g, "PGM", 40, 20, 16, "#ff3a3a", { toiDa: 60 }); });
  V(manTuong, 5.6, 2.1, 14.18, 2.0, 0, { ry: -Math.PI / 2, sang: true });
  // dây cáp lăn trên sàn + dấu băng keo vị trí
  for (const [x, z, w, r] of [[-1.6, 1.0, 5.2, 0.4], [1.8, 2.2, 3.6, -0.7], [3.6, -1.0, 4, 1.4]]) H(w, 0.02, 0.05, 0x111111, x, 0.005, z, { ry: r });
  for (const [x, z] of [[0, -1.4], [-2.2, -2.6], [2.4, -2.6]]) { H(0.4, 0.006, 0.05, 0xffcf3a, x, 0.006, z, { ry: 0.785 }); H(0.4, 0.006, 0.05, 0xffcf3a, x, 0.006, z, { ry: -0.785 }); }
  // đèn ON-AIR nhấp nháy, đèn tally máy quay
  k.moi((dt, t) => { ghM.visible = Math.sin(t * 3) > -0.6; });
}

// =============================================================================================
// 3. KARAOKE — phòng VIP: sofa chữ U, TV lớn, đèn disco, quả cầu gương, dải LED đổi màu
function dungKaraoke(k) {
  const { H, T, C, V } = k;
  const X1 = -3.5, X2 = 3.5, Z1 = -3, Z2 = 3, CAO = 2.8;
  const tuongK = k.vung(512, 200, (g, w, h) => { g.fillStyle = "#2a1640"; g.fillRect(0, 0, w, h); for (let i = 0; i < 90; i++) { g.fillStyle = ["#ffe14d", "#f26fa6", "#7fd3ff", "#ffffff"][i % 4]; const x = (i * 97) % w, y = (i * 53) % h, r = 1 + (i % 3); g.beginPath(); g.arc(x, y, r, 0, 7); g.fill(); } g.strokeStyle = "rgba(255,255,255,.08)"; g.lineWidth = 3; for (let x = -h; x < w; x += 40) { g.beginPath(); g.moveTo(x, h); g.lineTo(x + h, 0); g.stroke(); } });
  k.phong(X1, Z1, X2, Z2, CAO, { mau: 0x241433, tran: 0x15101e, cua: { dong: [[-2.85, -1.95]] }, caoCua: 2.15 });
  for (const [w, x, z, ry] of [[7, 0, Z2 - 0.01, Math.PI], [6, X1 + 0.01, 0, Math.PI / 2], [6, X2 - 0.01, 0, -Math.PI / 2]]) V(tuongK, w, CAO, x, CAO / 2, z, { ry });
  // cánh cửa (đóng) có ô kính tròn + biển phòng
  H(0.06, 2.15, 0.9, 0x3a2050, X2 + 0.02, 0, -2.4, { can: true, tuong: true }); T(0.13, 0.13, 0.07, 0x9fd3f2, X2 - 0.02, 1.45, -2.4, { rz: Math.PI / 2, seg: 12 });
  const vip = k.vung(256, 96, veBien("#ffcf3a", [["PHÒNG VIP 07", 0.42, 0.5, "#3a1d0a"]], { tron: 14 }));
  V(vip, 0.7, 0.26, X2 - 0.03, 2.35, -2.4, { ry: -Math.PI / 2 });
  k.san(X1, Z1, X2, Z2, { o: 0.5, mau: [0x1c1c22, 0x23232a], bien: 0.02 });
  // TV + kệ + loa
  const tv = k.vung(640, 360, (g, w, h) => {
    const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#0c2a5a"); gr.addColorStop(1, "#5a1a6a"); g.fillStyle = gr; g.fillRect(0, 0, w, h);
    g.fillStyle = "rgba(255,255,255,.07)"; for (let i = 0; i < 6; i++) { g.beginPath(); g.arc(w * (0.2 + i * 0.15), h * 0.3, 40 + i * 6, 0, 7); g.fill(); }
    chu(g, "TÌNH ĐƠN PHƯƠNG ONLINE", w / 2, 36, 26, "#ffe14d", { toiDa: w * 0.9 });
    chu(g, "Em đi qua đời anh như cơn mưa ngang phố", w / 2, h * 0.62, 30, "#ffffff", { dam: 700, toiDa: w * 0.92, vien: [6, "#1c1c1f"] });
    g.save(); g.beginPath(); g.rect(0, 0, w * 0.55, h); g.clip(); chu(g, "Em đi qua đời anh như cơn mưa ngang phố", w / 2, h * 0.62, 30, "#7fd3ff", { dam: 700, toiDa: w * 0.92, vien: [6, "#1c1c1f"] }); g.restore();
    chu(g, "Để lại tim anh ướt cả một mùa thu...", w / 2, h * 0.78, 28, "#ffffff", { dam: 700, toiDa: w * 0.92, vien: [6, "#1c1c1f"] });
    chu(g, "HÁT CHO NHAU NGHE", w - 14, h - 18, 16, "#f26fa6", { canh: "right", toiDa: 220 });
  });
  H(2.1, 1.2, 0.08, 0x111111, 0, 1.05, Z1 + 0.06); V(tv, 1.98, 1.1, 0, 1.65, Z1 + 0.115, { sang: true });
  H(2.6, 0.55, 0.45, 0x1c1c1f, 0, 0, Z1 + 0.25, { can: true }); H(0.42, 0.08, 0.32, 0x2a2c31, -0.6, 0.55, Z1 + 0.25); H(0.06, 0.03, 0.01, 0x3fe07a, -0.5, 0.58, Z1 + 0.09, { sang: true });
  for (const x of [-1.6, 1.6]) { H(0.42, 1.05, 0.38, 0x111114, x, 0, Z1 + 0.25, { can: true }); for (const y of [0.3, 0.75]) T(0.13, 0.13, 0.02, 0x2a2c31, x, y, Z1 + 0.45, { rx: Math.PI / 2, seg: 12 }); }
  // sofa chữ U
  const DO = 0x8a1f4a;
  k.sofa(0, 2.55, 6.6, Math.PI, DO, { tay: false, sau: 0.8 });
  k.sofa(-3.05, 0.35, 3.6, Math.PI / 2, DO, { tay: false, sau: 0.8 });
  k.sofa(3.05, 0.9, 2.5, -Math.PI / 2, DO, { tay: false, sau: 0.8 });
  // bàn kính dài + đồ trên bàn
  H(2.6, 0.04, 0.85, k.kinh, 0, 0.42, 1.0); H(2.5, 0.04, 0.8, 0x2a2c31, 0, 0.08, 1.0); for (const sx of [-1, 1]) H(0.06, 0.4, 0.7, 0x8a8d92, sx * 1.15, 0.04, 1.0);
  k.can(-1.3, 1.3, 0.57, 1.43);
  T(0.24, 0.2, 0.04, 0xf6f6f2, -0.6, 0.46, 1.0, { seg: 12 }); for (let i = 0; i < 4; i++) H(0.13, 0.05, 0.08, 0xe8384a, -0.7 + (i % 2) * 0.15, 0.5, 0.95 + Math.floor(i / 2) * 0.1, { ry: i });
  for (let i = 0; i < 6; i++) T(0.035, 0.035, 0.13, i % 2 ? 0x2e8b57 : 0xffcf3a, 0.2 + (i % 3) * 0.14, 0.46, 0.85 + Math.floor(i / 3) * 0.24, { seg: 8 });
  T(0.13, 0.11, 0.2, 0xc9ccd1, 0.85, 0.46, 1.05, { seg: 10 }); C(0.05, 0xdff3ff, 0.85, 0.66, 1.05);
  for (const [x, r] of [[-0.15, 0.3], [0.05, -0.2]]) { const g = k.nhomCon(x, 1.25, r, 0.46); T(0.022, 0.016, 0.22, 0x1c1c1f, 0, 0, 0, { cha: g, rz: Math.PI / 2 }); C(0.035, 0x8a8d92, 0.13, 0.02, 0, { cha: g }); }
  H(0.22, 0.03, 0.3, 0xf26fa6, 1.05, 0.46, 0.75, { ry: 0.3 }); H(0.08, 0.02, 0.17, 0x2a2c31, -1.0, 0.46, 0.75, { ry: -0.4 });
  // máy lạnh
  k.dieuHoa(0, 2.3, Z2 - 0.13, Math.PI);
  // dải LED quanh trần (đổi màu)
  const vlLed = new THREE.MeshBasicMaterial({ color: 0xf26fa6, fog: false });
  const led = new THREE.Group(); k.dong(led);
  for (const [w, d, x, z] of [[7, 0.05, 0, Z1 + 0.03], [7, 0.05, 0, Z2 - 0.03], [0.05, 6, X1 + 0.03, 0], [0.05, 6, X2 - 0.03, 0]]) { const m = new THREE.Mesh(new THREE.BoxGeometry(w, 0.05, d), vlLed); m.position.set(x, CAO - 0.08, z); led.add(m); }
  // quả cầu gương xoay + chùm sáng màu quét
  const qc = new THREE.Mesh(new THREE.IcosahedronGeometry(0.2, 1), new THREE.MeshLambertMaterial({ color: 0xd8dde3, emissive: 0x3a3d44, flatShading: true, fog: false }));
  qc.position.set(0, CAO - 0.42, 0.4); k.dong(qc); k.H(0.01, 0.22, 0.01, 0x888888, 0, CAO - 0.22, 0.4);
  const chum = new THREE.Group(); chum.position.set(0, CAO - 0.1, 0.4); k.dong(chum);
  const mauChum = [0xff3ab0, 0x3ad0ff, 0xffe14d, 0x7a3aff];
  for (let i = 0; i < 4; i++) {
    const geo = new THREE.ConeGeometry(0.55, 2.6, 12, 1, true); geo.translate(0, -1.3, 0);
    const m = new THREE.Mesh(geo, new THREE.MeshBasicMaterial({ color: mauChum[i], transparent: true, opacity: 0.13, depthWrite: false, blending: THREE.AdditiveBlending, side: THREE.DoubleSide, fog: false }));
    const goc = new THREE.Group(); goc.rotation.y = i * Math.PI / 2; m.rotation.x = 0.55; goc.add(m); chum.add(goc);
  }
  // chấm sáng trên sàn
  const vlCham = new THREE.MeshBasicMaterial({ map: texTron(), color: 0xffffff, transparent: true, opacity: 0.5, depthWrite: false, blending: THREE.AdditiveBlending, vertexColors: false, fog: false });
  const cham = [];
  for (let i = 0; i < (k.dienThoai ? 4 : 8); i++) { const m = new THREE.Mesh(new THREE.PlaneGeometry(0.5, 0.5), vlCham.clone()); m.material.color.set(mauChum[i % 4]); m.rotation.x = -Math.PI / 2; m.position.y = 0.012; k.dong(m); cham.push(m); }
  const mau = new THREE.Color();
  k.moi((dt, t) => {
    mau.setHSL((t * 0.08) % 1, 0.85, 0.55); vlLed.color.copy(mau);
    qc.rotation.y = t * 0.8; chum.rotation.y = t * 0.6;
    cham.forEach((m, i) => { const a = t * (0.5 + i * 0.07) + i * 1.7; m.position.x = Math.sin(a) * 2.6; m.position.z = 0.2 + Math.cos(a * 1.3) * 2.2; });
  });
}

// =============================================================================================
// 4. CÀ PHÊ SỐNG ẢO — tường gạch, neon hồng, xích đu, cây treo, quầy pha chế, góc check-in
function dungCaPhe(k) {
  const { H, T, C, V, P } = k;
  const X1 = -7, X2 = 7, Z1 = -5, Z2 = 5, CAO = 3.4;
  k.phong(X1, Z1, X2, Z2, CAO, { mau: { bac: 0xb8644a, nam: 0x2a2c31, tay: 0xf3e9dc, dong: 0xf3e9dc }, tran: 0x2a2c31, bo: ["nam"] });
  // mặt kính phía trước + cửa
  for (const [a, b] of [[-7.2, -1.0], [1.0, 7.2]]) { H(b - a, 0.5, 0.2, 0x2a2c31, (a + b) / 2, 0, Z2 + 0.1, { can: true, tuong: true }); H(b - a, CAO - 0.5, 0.04, k.kinh, (a + b) / 2, 0.5, Z2 + 0.1); k.can(a, b, Z2, Z2 + 0.2, true); }
  H(2.0, 0.6, 0.2, 0x2a2c31, 0, 2.8, Z2 + 0.1); for (let x = -7; x <= 7; x += 2) H(0.06, CAO, 0.08, 0x1c1c1f, x, 0, Z2 + 0.1);
  H(0.9, 2.2, 0.04, k.kinh, -0.5, 0, Z2 + 0.1); H(0.04, 0.5, 0.04, 0xc8a060, -0.1, 0.9, Z2 + 0.05); k.can(-1, 0, Z2, Z2 + 0.2);
  H(0.9, 2.2, 0.04, k.kinh, 0.5, 0, Z2 + 0.1); k.can(0, 1, Z2, Z2 + 0.2);
  // phố bên ngoài (tranh vẽ, phần trên trong suốt để thấy trời thật)
  const pho = k.vung(1024, 300, (g, w, h) => {
    const ds = [["#f3d9a4", "BÁNH MÌ BỰA"], ["#bfd9c4", "TRÀ SỮA HÓNG HỚT"], ["#e9b8a8", "TIỆM VÀNG KIM HÓNG"], ["#d9e6f2", "SPA ĐẸP LIỀN"], ["#f4c27a", "MÌ CAY 7 CẤP ĐỘ"]];
    ds.forEach(([m, ten], i) => { const x = i * w / 5, top = 40 + (i % 3) * 30; g.fillStyle = m; g.fillRect(x, top, w / 5 - 4, h - top); g.fillStyle = "#3a4855"; for (let r = 0; r < 3; r++) g.fillRect(x + 30, top + 20 + r * 50, w / 5 - 64, 30); g.fillStyle = ["#c0262d", "#2e8b57", "#ffcf3a", "#f26fa6", "#e8702a"][i]; g.fillRect(x + 6, h - 130, w / 5 - 16, 34); chu(g, ten, x + w / 10 - 4, h - 113, 20, "#fff", { toiDa: w / 5 - 24 }); g.fillStyle = "#8a8d92"; g.fillRect(x + 10, h - 92, w / 5 - 24, 70); });
    g.fillStyle = "#a9a39a"; g.fillRect(0, h - 22, w, 22);
  });
  V(pho, 18, 5.3, 0, 2.4, Z2 + 3.2, { ry: Math.PI });
  P(18, 3.2, 0x3a3c41, 0, -0.02, Z2 + 1.6, { nam: true }); H(18, 6, 0.3, 0x2a2c31, 0, 0, Z2 + 3.5);
  // sàn gỗ
  k.san(X1, Z1, X2, Z2, { o: 1.2, oz: 0.18, mau: (i, j) => [0xc8955c, 0xbb8a52, 0xd29f66, 0xb98450][(i * 3 + j * 7) % 4], lech: 0.5, khe: 0.008, mauKhe: 0x6b4a2f });
  // tường gạch trần + neon SỐNG ẢO CAFÉ
  k.luoi(14, CAO, 56, 48, (i, j) => [0xb8644a, 0xa85a42, 0xc06e52, 0x9e533c][(i * 7 + j * 3) % 4], 0, CAO / 2, Z1 + 0.01, 0, { khe: 0.012, lech: 0.5, bien: 0.06 });
  P(14, CAO, 0xd9d2c4, 0, CAO / 2, Z1 + 0.005);
  const neon = k.vung(900, 300, (g, w, h) => {
    g.clearRect(0, 0, w, h);
    chu(g, "SỐNG ẢO", w / 2, h * 0.38, 120, "#ff7ac8", { font: FONT_TRON, toiDa: w * 0.9, bong: 26, mauBong: "#ff2aa8" });
    chu(g, "CAFÉ", w / 2, h * 0.78, 80, "#8ff0ff", { font: FONT_TRON, toiDa: w * 0.6, bong: 22, mauBong: "#2ad0ff" });
  });
  V(neon, 4.2, 1.4, -0.6, 2.35, Z1 + 0.04, { sang: true });
  // quầy pha chế (phía đông), thực đơn bảng đen
  const QX = 4.9;
  const gachBong = k.vung(128, 128, (g, w, h) => { g.fillStyle = "#f3e9dc"; g.fillRect(0, 0, w, h); g.fillStyle = "#2a6a8a"; for (let i = 0; i < 2; i++) for (let j = 0; j < 2; j++) { const x = i * 64 + 32, y = j * 64 + 32; g.beginPath(); for (let a = 0; a < 8; a++) { const r = a % 2 ? 12 : 28; g.lineTo(x + Math.cos(a * Math.PI / 4) * r, y + Math.sin(a * Math.PI / 4) * r); } g.fill(); g.fillStyle = "#e8702a"; g.beginPath(); g.arc(x, y, 7, 0, 7); g.fill(); g.fillStyle = "#2a6a8a"; } });
  for (let z = -3.75; z < 0.6; z += 0.5) V(gachBong, 0.5, 1.0, QX - 0.41, 0.5, z, { ry: -Math.PI / 2 });
  H(0.8, 1.02, 4.5, 0x6b4a2f, QX, 0, -1.5, { can: true }); H(0.95, 0.06, 4.6, 0xd9cfc0, QX - 0.05, 1.02, -1.5);
  H(0.55, 0.45, 0.45, 0xc0262d, QX + 0.05, 1.08, -3.2); H(0.5, 0.05, 0.4, 0x8a8d92, QX + 0.05, 1.53, -3.2); for (const dz of [-0.12, 0.12]) T(0.03, 0.03, 0.12, 0x2a2c31, QX - 0.15, 1.2, -3.2 + dz);
  T(0.08, 0.1, 0.38, 0x2a2c31, QX + 0.1, 1.08, -2.5); C(0.08, 0x6b4a2f, QX + 0.1, 1.5, -2.5, { sy: 1.4 });
  H(0.7, 0.4, 0.9, k.kinh, QX - 0.05, 1.08, -1.2); H(0.7, 0.02, 0.9, 0xe8e8e8, QX - 0.05, 1.08, -1.2);
  for (let i = 0; i < 6; i++) T(0.07, 0.07, 0.08, [0xf2c4a0, 0x6b3a2a, 0xf6e6c8, 0x7fbf6a][i % 4], QX - 0.18 + (i % 2) * 0.25, 1.1 + Math.floor(i / 4) * 0.2, -1.5 + (i % 3) * 0.3, { seg: 10 });
  H(0.3, 0.22, 0.25, 0x1c1c1f, QX - 0.1, 1.08, 0.2, { ry: -0.4 }); H(0.26, 0.18, 0.02, 0x9fd3f2, QX - 0.21, 1.2, 0.18, { ry: -Math.PI / 2 - 0.4, sang: true });
  for (let i = 0; i < 8; i++) T(0.045, 0.035, 0.11, 0xf6f6f2, QX + 0.2, 1.08 + Math.floor(i / 4) * 0.11, -0.2 + (i % 4) * 0.1, { seg: 8 });
  H(0.5, 2.0, 4.6, 0x8a6a4a, X2 - 0.25, 0, -2.6); for (const y of [0.7, 1.2, 1.7]) H(0.4, 0.04, 4.4, 0xc8955c, X2 - 0.25, y, -2.6);
  for (let i = 0; i < 18; i++) T(0.06, 0.06, 0.2, [0x7a3a2a, 0xf2e6c8, 0x2e8b57, 0xe8702a, 0x1c1c1f][i % 5], X2 - 0.3, 0.74 + Math.floor(i / 6) * 0.5, -4.6 + (i % 6) * 0.75, { seg: 8 });
  const menu = k.vung(512, 280, (g, w, h) => {
    g.fillStyle = "#1e2420"; g.fillRect(0, 0, w, h); g.strokeStyle = "#c8955c"; g.lineWidth = 10; g.strokeRect(5, 5, w - 10, h - 10);
    chu(g, "MENU", w / 2, 34, 34, "#ffe9c8", { font: FONT_TRON, toiDa: 200 });
    [["Cà phê muối", "35K"], ["Bạc xỉu", "30K"], ["Trà đào cam sả", "40K"], ["Matcha latte", "45K"], ["Sinh tố bơ", "45K"], ["Cà phê trứng", "40K"]].forEach(([a, b], i) => {
      const x = i < 3 ? 24 : w / 2 + 12, y = 84 + (i % 3) * 60; chu(g, a, x, y, 26, "#f6efe0", { canh: "left", dam: 600, toiDa: w / 2 - 110 }); chu(g, b, x + w / 2 - 44, y, 26, "#ffcf3a", { canh: "right", toiDa: 70 });
    });
  });
  V(menu, 2.4, 1.3, X2 - 0.52, 2.75, -2.0, { ry: -Math.PI / 2 }); // phía trên kệ, trước tường
  // đèn thả bóng Edison trên quầy và bàn
  for (const z of [-3.2, -1.5, 0.2]) k.denTha(QX - 0.1, z, CAO, 0.9, 0x2a2c31);
  for (const [x, z] of [[-2.6, -1.9], [2.2, -2.0], [-0.2, -3.3]]) k.denTha(x, z, CAO, 1.0, 0xc8955c, { r: 0.22 });
  // bàn tròn + ghế mây
  const MAY = 0xc9a26a;
  for (const [x, z] of [[-2.6, -2.6], [2.2, -2.6]]) { k.ban(x, z, 0.75, 0.75, 0.74, 0xf2f2f2, 0x2a2c31, { tron: true }); k.ghe(x, z + 0.7, Math.PI, MAY, { lung: 0.55, can: false }); k.ghe(x - 0.7, z, Math.PI / 2, MAY, { lung: 0.55, can: false }); T(0.045, 0.035, 0.12, 0x6b3a2a, x + 0.1, 0.74, z); T(0.045, 0.035, 0.14, 0xf2c4a0, x - 0.12, 0.74, z + 0.1); k.can(x - 0.95, x + 0.4, z - 0.4, z + 0.95); }
  for (const [x, z] of [[-0.6, -3.7], [-2.9, 1.4], [2.9, 1.2]]) { k.ban(x, z, 0.65, 0.65, 0.74, 0xc8955c, 0x2a2c31); k.ghe(x - 0.62, z, Math.PI / 2, 0xe8702a, { lung: 0.45, can: false }); k.ghe(x + 0.62, z, -Math.PI / 2, 0x2a6a8a, { lung: 0.45, can: false }); T(0.045, 0.035, 0.12, 0xf6f6f2, x, 0.74, z); k.can(x - 0.9, x + 0.9, z - 0.35, z + 0.35); }
  // bàn dài với ghế đẩu cao gần kính
  H(2.6, 0.05, 0.5, 0xc8955c, 1.9, 1.02, 4.35); for (const x of [0.8, 3.0]) H(0.05, 1.02, 0.4, 0x2a2c31, x, 0, 4.35); k.can(0.6, 3.2, 4.1, 4.6);
  for (const x of [1.2, 1.9, 2.6]) { T(0.17, 0.17, 0.05, MAY, x, 0.7, 3.8); T(0.02, 0.02, 0.7, 0x2a2c31, x, 0, 3.8); }
  // xích đu treo trần (khu kính trước)
  for (const x of [-5.3, -3.4]) {
    for (const sx of [-0.3, 0.3]) for (const sz of [-0.2, 0.2]) H(0.015, CAO - 0.45, 0.015, 0xd9c9a8, x + sx, 0.45, 3.4 + sz);
    H(0.72, 0.06, 0.5, 0xc8955c, x, 0.42, 3.4); H(0.6, 0.06, 0.4, 0xf2e6d8, x, 0.48, 3.4); C(0.14, 0xf26fa6, x - 0.2, 0.62, 3.25, { sy: 0.6 });
    k.can(x - 0.4, x + 0.4, 3.12, 3.68);
  }
  // góc check-in: tranh cánh thiên thần + vòng hoa + trái tim neon + đèn vòng
  const canh = k.vung(512, 420, (g, w, h) => {
    g.fillStyle = "#fbe3ec"; g.fillRect(0, 0, w, h);
    for (const s of [-1, 1]) for (let i = 0; i < 6; i++) { g.fillStyle = i % 2 ? "#ffffff" : "#f6d2e2"; g.beginPath(); g.ellipse(w / 2 + s * (70 + i * 26), h * 0.42 + i * 14, 60 - i * 5, 130 - i * 12, s * (0.5 + i * 0.12), 0, 7); g.fill(); g.strokeStyle = "#d9a5bd"; g.lineWidth = 2; g.stroke(); }
    chu(g, "#songao", w / 2, h * 0.9, 34, "#c0267a", { font: FONT_TRON, toiDa: w * 0.8 });
  });
  V(canh, 2.4, 2.0, X1 + 0.02, 1.5, -0.2, { ry: Math.PI / 2 });
  for (let i = 0; i < 18; i++) { const a = Math.PI * i / 17; C(0.11, [0xf26fa6, 0xffffff, 0xffb3d1][i % 3], X1 + 0.12, 1.3 + Math.sin(a) * 1.25, -0.2 + Math.cos(a) * 1.35); }
  const tim = k.vung(256, 220, (g, w, h) => { g.clearRect(0, 0, w, h); g.shadowColor = "#ff2a6a"; g.shadowBlur = 18; g.strokeStyle = "#ff8ab8"; g.lineWidth = 12; g.beginPath(); g.moveTo(w / 2, h * 0.86); g.bezierCurveTo(-w * 0.1, h * 0.4, w * 0.25, -h * 0.1, w / 2, h * 0.3); g.bezierCurveTo(w * 0.75, -h * 0.1, w * 1.1, h * 0.4, w / 2, h * 0.86); g.stroke(); g.stroke(); g.shadowBlur = 0; });
  V(tim, 0.8, 0.7, X1 + 0.05, 2.85, -0.2, { ry: Math.PI / 2, sang: true });
  const vongDen = new THREE.Mesh(new THREE.TorusGeometry(0.32, 0.035, 6, 20), vb(0xfffaf0)); vongDen.position.set(-4.6, 1.55, -0.9); vongDen.rotation.y = -1.2; vongDen.userData.sang = true; k.nhom.add(vongDen);
  for (let i = 0; i < 3; i++) H(0.025, 1.4, 0.025, 0x2a2c31, -4.6 + Math.cos(i * 2.1) * 0.22, 0, -0.9 + Math.sin(i * 2.1) * 0.22, { rx: Math.sin(i * 2.1) * 0.15, rz: -Math.cos(i * 2.1) * 0.15 }); k.can(-4.85, -4.35, -1.15, -0.65);
  // ghế lười
  for (const [x, z, m] of [[-5.8, -3.4, 0xffcf3a], [-4.8, -4.1, 0x7fbfbf]]) { C(0.42, m, x, 0.28, z, { ct: 1, sy: 0.65 }); k.can(x - 0.35, x + 0.35, z - 0.35, z + 0.35); }
  // kệ sách, cây treo, cây chậu
  H(0.32, 2.2, 1.6, 0x8a6a4a, X1 + 0.16, 0, -3.8, { can: true }); for (const y of [0.5, 1.0, 1.5, 2.0]) for (let i = 0; i < 6; i++) H(0.22, 0.28 + (i % 3) * 0.04, 0.08, k.chon([0xc0262d, 0x2a5aa8, 0xf2e6c8, 0x2e8b57, 0xe8702a, 0x1c1c1f]), X1 + 0.18, y, -4.4 + i * 0.22);
  for (const [x, z] of [[-6.2, 4.3], [6.2, 4.3], [-2.4, 4.3]]) k.cay(x, z, 1.3, { kieu: "la_to" });
  k.cay(6.3, 1.4, 1.1);
  for (const [x, z] of [[-6.2, 2.2], [-2.4, 4.3], [2.9, 3.0], [-6.2, -2.0], [3.6, -4.4]]) {
    H(0.01, 0.6, 0.01, 0xd9c9a8, x, CAO - 0.6, z); T(0.16, 0.12, 0.18, 0xf2f2f2, x, CAO - 0.78, z, { seg: 8 });
    for (let i = 0; i < 7; i++) C(0.07, i % 2 ? 0x4f8a3c : 0x6aa84f, x + Math.cos(i * 1.7) * 0.14, CAO - 0.8 - (i % 4) * 0.18, z + Math.sin(i * 1.7) * 0.14);
  }
  // dây đèn đom đóm zic-zắc trên trần
  for (let i = 0; i < 4; i++) { const p = k.vong([-6.8, CAO - 0.05, -4.6 + i * 2.4], [6.6, CAO - 0.05, -3.4 + i * 2.4], 0.35, 14); k.day(p); for (let j = 1; j < p.length - 1; j++) C(0.03, 0xffe6a8, p[j][0], p[j][1] - 0.03, p[j][2], { sang: true }); }
}

// =============================================================================================
// 5. TIỆM — phòng khám / tiệm cầm đồ / tạp hóa... dùng chung, bảng hiệu đổi theo tag
function dungTiem(k, bienTiem) {
  const { H, T, C, V, P } = k;
  const X1 = -5, X2 = 5, Z1 = -4, Z2 = 4, CAO = 3.2;
  k.phong(X1, Z1, X2, Z2, CAO, { mau: 0xeef0ea, tran: 0xf6f6f2, bo: ["nam"] });
  for (const [a, b] of [[-5.2, -0.9], [0.9, 5.2]]) { H(b - a, 0.45, 0.2, 0x8a8d92, (a + b) / 2, 0, Z2 + 0.1, { can: true, tuong: true }); H(b - a, 2.35, 0.04, k.kinh, (a + b) / 2, 0.45, Z2 + 0.1); }
  H(10.4, 0.4, 0.2, 0x8a8d92, 0, 2.8, Z2 + 0.1); for (const x of [-5, -3, -0.9, 0.9, 3, 5]) H(0.07, 2.8, 0.08, 0xb8bcc4, x, 0, Z2 + 0.1);
  H(1.7, 2.3, 0.04, k.kinh, 0, 0, Z2 + 0.14); H(0.04, 0.6, 0.04, 0xb8bcc4, -0.1, 0.9, Z2 + 0.08); H(0.04, 0.6, 0.04, 0xb8bcc4, 0.1, 0.9, Z2 + 0.08); k.can(-0.9, 0.9, Z2, Z2 + 0.2);
  const pho = k.vung(1024, 260, (g, w, h) => { g.fillStyle = "#a9a39a"; g.fillRect(0, h - 40, w, 40); g.fillStyle = "#3a3c41"; g.fillRect(0, h - 70, w, 30); [["#d9e6f2", 60], ["#f4c27a", 20], ["#c9b6dc", 70], ["#e0d4b8", 30], ["#a8d4d9", 50]].forEach(([m, t], i) => { const x = i * w / 5; g.fillStyle = m; g.fillRect(x, t, w / 5 - 4, h - 70 - t); g.fillStyle = "#3a4855"; g.fillRect(x + 24, t + 24, w / 5 - 52, 40); g.fillStyle = "#9aa0a6"; g.fillRect(x + 12, h - 150, w / 5 - 28, 80); }); });
  V(pho, 16, 4.1, 0, 2.0, Z2 + 3.5, { ry: Math.PI }); P(16, 3.5, 0x8f8a80, 0, -0.02, Z2 + 1.75, { nam: true }); H(16, 6, 0.3, 0x2a2c31, 0, 0, Z2 + 3.8);
  k.san(X1, Z1, X2, Z2, { o: 0.6, mau: [0xf2f2ee, 0xeaeae4], khe: 0.012, mauKhe: 0xb9b9b0 });
  H(10, 0.12, 0.02, 0x9aa0a6, 0, 0, Z1 + 0.01); H(0.02, 0.12, 8, 0x9aa0a6, X1 + 0.01, 0, 0); H(0.02, 0.12, 8, 0x9aa0a6, X2 - 0.01, 0, 0);
  for (const z of [-2.2, 0.4, 2.8]) for (const x of [-2.4, 2.4]) k.denOng(x, CAO, z, 0, 1.2);
  // bảng hiệu đổi chữ (ảnh riêng để vẽ lại theo tag)
  const cv = document.createElement("canvas"); cv.width = k.dienThoai ? 512 : 1024; cv.height = cv.width / 4;
  const tex = new THREE.CanvasTexture(cv); tex.colorSpace = THREE.SRGBColorSpace; tex.anisotropy = 4;
  const vlBien = new THREE.MeshBasicMaterial({ map: tex, fog: false });
  const veTen = ({ chu: ten, nen, mau, phu }) => {
    const g = cv.getContext("2d"), s = cv.width / 1024; g.setTransform(s, 0, 0, s, 0, 0);
    g.fillStyle = nen; g.fillRect(0, 0, 1024, 256); g.strokeStyle = mau; g.lineWidth = 10; g.strokeRect(14, 14, 996, 228);
    chu(g, ten, 512, 110, 108, mau, { toiDa: 940, font: FONT });
    chu(g, phu, 512, 200, 32, mau, { dam: 600, toiDa: 900 });
    tex.needsUpdate = true;
  };
  veTen(bienTiem);
  const bienM = new THREE.Mesh(new THREE.PlaneGeometry(5.6, 1.4), vlBien); bienM.position.set(0, 2.35, Z1 + 0.085); k.nhom.add(bienM);
  H(5.8, 1.6, 0.06, 0x2a2c31, 0, 1.55, Z1 + 0.03);
  // quầy + tủ kính
  H(4.6, 1.0, 0.65, 0xf2f2f2, 0, 0, -2.55, { can: true }); H(4.7, 0.05, 0.72, 0x8a8d92, 0, 1.0, -2.55); H(4.4, 0.6, 0.02, 0x2a5aa8, 0, 0.25, -2.21);
  H(2.0, 0.3, 0.6, k.kinh, -1.1, 1.05, -2.55); for (let i = 0; i < 6; i++) H(0.16, 0.08, 0.12, [0xffcf3a, 0xc0c4ca, 0xf26fa6][i % 3], -1.8 + i * 0.28, 1.06, -2.55);
  H(0.42, 0.12, 0.34, 0x2a2c31, 1.3, 1.05, -2.6); H(0.32, 0.22, 0.03, 0x1c1c1f, 1.3, 1.17, -2.76, { rx: -0.3 }); H(0.28, 0.17, 0.01, 0x9fd3f2, 1.3, 1.2, -2.74, { rx: -0.3, sang: true });
  C(0.06, 0xd9b04a, 0.6, 1.1, -2.4, { sy: 0.6 }); H(0.24, 0.02, 0.32, 0xf6f6f2, 1.85, 1.05, -2.45, { ry: 0.2 });
  // kệ hàng phía sau quầy và tường tây
  const keHang = (x, z, ry, dai, cao = 2.1) => {
    const g = k.nhomCon(x, z, ry), c = { cha: g };
    H(dai, cao, 0.04, 0xd9d2c4, 0, 0, -0.2, c); for (const sx of [-1, 1]) H(0.04, cao, 0.42, 0xb8bcc4, sx * dai / 2, 0, 0, c);
    for (let y = 0.15; y < cao; y += 0.5) { H(dai, 0.03, 0.42, 0xe8e8e8, 0, y, 0, c); let xx = -dai / 2 + 0.1; while (xx < dai / 2 - 0.2) { const w = 0.12 + k.rnd() * 0.14, h = 0.16 + k.rnd() * 0.24; if (k.rnd() < 0.85) H(w, h, 0.18 + k.rnd() * 0.1, k.chon([0xc0262d, 0xffcf3a, 0x2a5aa8, 0x2e8b57, 0xf2f2f2, 0xe8702a, 0xf26fa6, 0x7b4bb3]), xx + w / 2, y + 0.03, 0.02, c); xx += w + 0.03; } }
    g.can(0, 0, dai, 0.46); return g;
  };
  keHang(-2.0, -3.7, 0, 2.6, 1.5); keHang(2.0, -3.7, 0, 2.6, 1.5);
  keHang(-4.7, -1.0, Math.PI / 2, 2.8); keHang(-4.7, 2.2, Math.PI / 2, 2.4);
  // ghế chờ dãy 4 chỗ (tường đông), cây nước, TV, bảng gọi số
  const gc = k.nhomCon(4.5, -0.4, -Math.PI / 2);
  H(3.0, 0.05, 0.45, 0x8a8d92, 0, 0.4, 0, { cha: gc }); for (const xx of [-1.2, 1.2]) H(0.05, 0.4, 0.4, 0x5a5d63, xx, 0, 0, { cha: gc });
  for (let i = 0; i < 4; i++) { H(0.48, 0.05, 0.42, 0x2a8a7a, -1.05 + i * 0.7, 0.42, 0.02, { cha: gc }); H(0.48, 0.42, 0.04, 0x2a8a7a, -1.05 + i * 0.7, 0.5, -0.2, { cha: gc, rx: -0.12 }); }
  gc.can(0, 0, 3.0, 0.5);
  H(0.34, 1.0, 0.34, 0xf2f2f2, 4.6, 0, 2.2, { can: true }); T(0.13, 0.13, 0.45, 0x9fd3f2, 4.6, 1.0, 2.2, { seg: 10 }); H(0.06, 0.04, 0.03, 0xc0262d, 4.5, 0.75, 2.4, { sang: true });
  const tv = k.vung(320, 180, (g, w, h) => { const gr = g.createLinearGradient(0, 0, 0, h); gr.addColorStop(0, "#1f4fa8"); gr.addColorStop(1, "#0b1e5a"); g.fillStyle = gr; g.fillRect(0, 0, w, h); chu(g, "ĐÀI TIVI HÓNG", w / 2, h * 0.4, 30, "#ffffff", { font: FONT_TRON, toiDa: w * 0.8 }); g.fillStyle = "#e2468f"; g.fillRect(0, h * 0.78, w, h * 0.22); chu(g, "TIN NÓNG: GIÁ VÀNG LẠI HÓNG", w / 2, h * 0.89, 16, "#fff", { toiDa: w * 0.92 }); });
  H(0.06, 0.62, 1.05, 0x111111, X2 - 0.04, 1.85, -0.4); V(tv, 0.98, 0.55, X2 - 0.08, 2.16, -0.4, { ry: -Math.PI / 2, sang: true });
  const so = k.vung(256, 96, (g, w, h) => { g.fillStyle = "#111"; g.fillRect(0, 0, w, h); chu(g, "MỜI SỐ 069", w / 2, h / 2, 40, "#ff3a3a", { toiDa: w * 0.9, bong: 8 }); });
  V(so, 0.8, 0.3, X2 - 0.04, 2.7, 1.3, { ry: -Math.PI / 2, sang: true });
  const qc = k.vung(256, 360, veBien(gradDoc("#ffcf3a", "#e8702a"), [["KHUYẾN MÃI", 0.075, 0.18, "#7a1424"], ["GIẢM", 0.1, 0.42, "#ffffff"], ["20%", 0.2, 0.62, "#ffffff", 800, FONT_TRON], ["CHO KHÁCH QUEN", 0.05, 0.86, "#7a1424", 700]]));
  V(qc, 0.8, 1.12, X2 - 0.02, 1.4, 2.95, { ry: -Math.PI / 2 });
  k.dongHo(3.9, 2.5, Z1 + 0.02, 0); k.dieuHoa(-4.1, 2.6, Z1 + 0.13, 0);
  // bàn thờ thần tài góc tiệm, cây phát tài
  H(0.5, 0.45, 0.4, 0xb31b1b, -4.6, 0, 3.6, { can: true }); C(0.07, 0xffcf3a, -4.7, 0.52, 3.6, { sang: true }); C(0.06, 0xffcf3a, -4.5, 0.5, 3.6, { sang: true });
  k.cay(3.4, 3.4, 1.2, { la: [0x4f8a3c, 0x6aa84f, 0x3d7a34] });
  H(1.2, 0.02, 0.8, 0x7a1424, 0, 0, 3.4); // thảm chùi chân
  return { datBien: b => veTen(b) };
}

// =============================================================================================
// 6. HẺM 69 + PHÒNG TRỌ — con hẻm 3 m, nhà ống hai bên, dây điện chằng chịt; phòng trọ nhỏ mở cửa ra hẻm
function dungPhongTro(k) {
  const { H, T, C, V, P } = k;
  // nền xi măng hẻm + rãnh nước
  k.san(-1.5, -14, 1.5, 14, { o: 1, mau: [0x9c978e, 0x948f86, 0xa29d94], bien: 0.06 });
  H(0.2, 0.01, 28, 0x5a5650, 0.9, 0.003, 0);
  for (const [x, z, w] of [[-0.3, 4.2, 0.9], [0.4, -6.5, 0.7]]) C(w / 2, 0x7d838b, x, 0.006, z, { sy: 0.01, sz: 0.6, ct: 1 });
  // nhà hai bên (tây: mặt nhìn +x; đông: mặt nhìn −x), chừa phòng trọ ở phía đông z −2.2..2.4
  let z = -14;
  for (const [w, n, ten] of [[4.4, 3, "SỐ 7"], [4.0, 2, "SỐ 9"], [4.6, 4, "SỐ 11"], [3.8, 3, "SỐ 13"], [4.2, 2, "SỐ 15"], [4.4, 3, "SỐ 17"], [2.6, 3, "SỐ 19"]]) {
    k.nhaPho(-1.5, z + w, Math.PI / 2, w, n, { sau: 6, cua: k.rnd() < 0.5 ? "xep" : "cuon" });
    const so = k.vung(128, 64, veBien("#1f4fa8", [[ten, 0.5, 0.52, "#ffffff"]], { tron: 8 })); V(so, 0.36, 0.18, -1.48, 2.6, z + 0.6, { ry: Math.PI / 2 });
    z += w;
  }
  z = -14;
  for (const [w, n, ten] of [[4.2, 3, "SỐ 18"], [3.8, 4, "SỐ 20"], [3.8, 2, "SỐ 22"]]) { k.nhaPho(1.5, z, -Math.PI / 2, w, n, { sau: 6 }); const so = k.vung(128, 64, veBien("#1f4fa8", [[ten, 0.5, 0.52, "#ffffff"]], { tron: 8 })); V(so, 0.36, 0.18, 1.48, 2.6, z + w - 0.6, { ry: -Math.PI / 2 }); z += w; }
  z = 2.6;
  for (const [w, n, ten] of [[3.8, 3, "SỐ 45"], [4.0, 2, "SỐ 47"], [3.6, 4, "SỐ 49"]]) { k.nhaPho(1.5, z, -Math.PI / 2, w, n, { sau: 6 }); const so = k.vung(128, 64, veBien("#1f4fa8", [[ten, 0.5, 0.52, "#ffffff"]], { tron: 8 })); V(so, 0.36, 0.18, 1.48, 2.6, z + w - 0.6, { ry: -Math.PI / 2 }); z += w; }
  // ---- Phòng trọ (x 1.5..5, z −2.2..2.6), cửa ra hẻm
  const RX1 = 1.6, RX2 = 5.0, RZ1 = -2.2, RZ2 = 2.6, RC = 2.9, XANH = 0xbfd9c4;
  H(0.2, RC, 1.3, 0xd9c8a0, RX1 - 0.1, 0, RZ1 + 0.65, { can: true, tuong: true }); H(0.2, RC, 2.2, 0xd9c8a0, RX1 - 0.1, 0, RZ2 - 1.1, { can: true, tuong: true });
  H(0.2, RC - 2.15, 1.3, 0xd9c8a0, RX1 - 0.1, 2.15, RZ1 + 1.95);
  H(0.2, RC, RZ2 - RZ1 + 0.4, XANH, RX2 + 0.1, 0, (RZ1 + RZ2) / 2, { can: true, tuong: true });
  H(RX2 - RX1 + 0.4, RC, 0.2, XANH, (RX1 + RX2) / 2, 0, RZ1 - 0.1, { can: true, tuong: true }); H(RX2 - RX1 + 0.4, RC, 0.2, XANH, (RX1 + RX2) / 2, 0, RZ2 + 0.1, { can: true, tuong: true });
  H(RX2 - RX1 + 0.4, 0.15, RZ2 - RZ1 + 0.4, 0xe6e1d4, (RX1 + RX2) / 2, RC, (RZ1 + RZ2) / 2);
  H(6, 9, 6, 0xd9c8a0, 4.6, RC, 0.2); // các tầng trên của dãy trọ
  for (let t = 1; t < 3; t++) { P(1.4, 1.3, t === 1 ? 0xffe0a0 : 0x3a4855, 1.58, t * 3.1 + 1.4, 0.4, { ry: -Math.PI / 2, sang: t === 1 }); H(0.7, 0.45, 0.25, 0xf2f2f2, 1.45, t * 3.1 + 2.3, -1.2); }
  // cửa sắt xếp kéo sang bên, cửa sổ song sắt nhìn ra hẻm
  for (let i = 0; i < 6; i++) H(0.03, 2.1, 0.03, 0x4a6a5a, RX1 - 0.18, 0, RZ1 + 1.32 + i * 0.05);
  const cuaSo = k.vung(128, 96, (g, w, h) => { g.fillStyle = "#3a4855"; g.fillRect(0, 0, w, h); g.fillStyle = "#e6c88a"; g.fillRect(6, 6, w - 12, h - 12); g.fillStyle = "#2a2c31"; for (let i = 1; i < 7; i++) g.fillRect(i * w / 7 - 2, 0, 4, h); });
  V(cuaSo, 1.0, 0.75, RX1 - 0.21, 1.45, 1.4, { ry: -Math.PI / 2, sang: true }); V(cuaSo, 1.0, 0.75, RX1 + 0.01, 1.45, 1.4, { ry: Math.PI / 2 });
  // biển cho thuê
  const thue = k.vung(320, 120, veBien("#ffffff", [["PHÒNG TRỌ", 0.3, 0.32, "#c0262d"], ["CÒN 1 PHÒNG · 0900 000 069", 0.15, 0.72, "#1c1c1f", 700]], { vien: "#c0262d" }));
  V(thue, 0.9, 0.34, RX1 - 0.21, 2.45, -1.5, { ry: -Math.PI / 2 });
  // nội thất phòng trọ
  k.san(RX1, RZ1, RX2, RZ2, { o: 0.4, mau: [0xe8d9c0, 0xdccbb0], khe: 0.01, mauKhe: 0xa89878 });
  k.denOng(3.3, RC, 0.2, Math.PI / 2, 1.2);
  // nệm trên sàn + gối + chăn
  H(1.6, 0.18, 2.0, 0xf2f2f2, 4.1, 0, 1.4, { can: true }); H(1.62, 0.04, 1.3, 0x7fa8d9, 4.1, 0.18, 1.0); H(0.55, 0.12, 0.35, 0xf6d2e2, 3.75, 0.18, 2.15); H(0.55, 0.12, 0.35, 0xf6d2e2, 4.45, 0.18, 2.15);
  // quạt đứng (cánh quay)
  T(0.17, 0.2, 0.04, 0xf2f2f2, 2.2, 0, 2.15); T(0.025, 0.025, 1.0, 0xe8e8e8, 2.2, 0.04, 2.15); H(0.14, 0.14, 0.2, 0xe8e8e8, 2.2, 1.03, 2.1);
  const long = new THREE.Mesh(new THREE.TorusGeometry(0.24, 0.012, 4, 18), vl(0x9fd3f2)); long.position.set(2.2, 1.12, 1.96); long.rotation.y = 0; k.nhom.add(long);
  const canhQuat = new THREE.Group(); canhQuat.position.set(2.2, 1.12, 1.98); k.dong(canhQuat);
  for (let i = 0; i < 3; i++) { const b = new THREE.Mesh(new THREE.BoxGeometry(0.08, 0.2, 0.01), vl(0x7fbfe8)); b.position.set(Math.cos(i * 2.094) * 0.11, Math.sin(i * 2.094) * 0.11, 0); b.rotation.z = i * 2.094 - Math.PI / 2; canhQuat.add(b); }
  canhQuat.rotation.y = 0; canhQuat.lookAt(2.2 + 0.4, 1.12, 1.98 - 1); // hướng vào giữa phòng
  k.can(2.0, 2.4, 1.95, 2.35);
  k.moi((dt) => { canhQuat.rotateZ(dt * 18); });
  // giá phơi đồ có quần áo
  H(1.4, 0.03, 0.03, 0xb8bcc4, 3.6, 1.55, -1.8); for (const x of [2.9, 4.3]) H(0.03, 1.55, 0.03, 0xb8bcc4, x, 0, -1.8);
  for (let i = 0; i < 6; i++) H(0.34, 0.6 + (i % 2) * 0.2, 0.06, [0xf6f6f2, 0x2a5aa8, 0xc0262d, 0x1c1c1f, 0xffcf3a, 0x7fbf8a][i], 3.0 + i * 0.22, 0.85 - (i % 2) * 0.2, -1.8, { ry: 0.3 });
  k.can(2.85, 4.35, -2.0, -1.6);
  // tủ vải, bàn xếp thấp + laptop, mì ly, nồi cơm, bình nước
  H(0.85, 1.6, 0.45, 0x8aa0c0, 4.65, 0, -0.6, { can: true }); H(0.02, 1.4, 0.01, 0xd9d9d9, 4.22, 0.1, -0.6);
  H(0.8, 0.03, 0.5, 0xc8955c, 2.6, 0.32, -0.2); for (const [a, b] of [[-0.35, -0.2], [0.35, -0.2], [-0.35, 0.2], [0.35, 0.2]]) H(0.03, 0.32, 0.03, 0x6b4a2f, 2.6 + a, 0, -0.2 + b); k.can(2.2, 3.0, -0.45, 0.05);
  H(0.34, 0.02, 0.24, 0x2a2c31, 2.5, 0.35, -0.2); H(0.34, 0.22, 0.02, 0x2a2c31, 2.5, 0.37, -0.31, { rx: -0.25 }); H(0.3, 0.18, 0.01, 0x9fd3f2, 2.5, 0.39, -0.3, { rx: -0.25, sang: true });
  for (const dx of [0.22, 0.34]) T(0.05, 0.04, 0.1, 0xf6f6f2, 2.6 + dx, 0.35, -0.1, { seg: 8 });
  T(0.15, 0.15, 0.25, 0xf2f2f2, 1.95, 0, -1.5, { seg: 10 }); T(0.13, 0.13, 0.48, 0x9fd3f2, 1.95, 0, -0.9, { seg: 10 });
  for (let i = 0; i < 3; i++) H(0.12, 0.05, 0.26, [0xc0262d, 0x1c1c1f, 0xf2f2f2][i], 1.85 + i * 0.16, 0, 0.75);
  const lich = k.vung(160, 220, veBien("#ffffff", [["THÁNG 10", 0.1, 0.12, "#c0262d"], ["20", 0.42, 0.48, "#c0262d", 800, FONT_TRON], ["THỨ BA", 0.08, 0.78, "#1c1c1f"], ["Âm lịch 19/9", 0.06, 0.9, "#555555", 600]]));
  V(lich, 0.32, 0.44, RX2 - 0.01, 1.7, 0.3, { ry: -Math.PI / 2 });
  const poster = k.vung(220, 300, veBien(gradDoc("#f26fa6", "#7b2a52"), [["SIÊU NHÂN", 0.1, 0.2, "#ffffff", 800, FONT_TRON], ["HỒNG", 0.16, 0.36, "#ffe14d", 800, FONT_TRON], ["ĐẠI NHẠC HỘI", 0.07, 0.75, "#ffffff"], ["31.10", 0.09, 0.87, "#ffffff"]]));
  V(poster, 0.55, 0.75, 3.3, 1.75, RZ2 - 0.01, { ry: Math.PI });
  H(0.35, 0.5, 0.02, 0xcfe3ee, 2.4, 1.35, RZ1 + 0.01); // gương
  // gác lửng phía sau
  H(1.5, 0.08, RZ2 - RZ1, 0x8a6a4a, RX2 - 0.75, 2.05, (RZ1 + RZ2) / 2); H(0.6, 0.35, 0.45, 0xc0262d, 4.5, 2.13, -1.4); H(0.7, 0.3, 0.5, 0xb08a5a, 4.4, 2.13, 0.2);
  for (let i = 0; i < 5; i++) H(0.04, 0.03, 0.4, 0x8a6a4a, 3.3 + i * 0.06, 0.35 + i * 0.4, -0.05); for (const dz of [-0.2, 0.2]) H(0.04, 2.1, 0.04, 0x8a6a4a, 3.45, 0, -0.05 + dz, { rz: -0.15 }); k.can(3.2, 3.7, -0.3, 0.2);
  // đồ trong hẻm: xe máy, ghế nhựa bàn trà hàng xóm, miếu ông địa, xe bánh mì, chậu chuối, thùng rác
  for (const [x, zz, r] of [[-1.05, -9.5, 0], [-1.05, -8.6, 0.1], [-1.05, 5.4, -0.1], [-1.05, 6.3, 0], [1.05, -6.0, Math.PI], [1.05, 7.5, Math.PI + 0.1]]) k.xeMay(x, zz, r);
  k.ban(-0.95, -3.6, 0.55, 0.55, 0.45, 0x2a5aa8, 0x555555);
  k.gheNhua(-0.95, -2.7, 0xc0262d); k.gheNhua(-0.95, -4.5, 0x2a5aa8); T(0.06, 0.06, 0.16, 0xe8702a, -0.95, 0.45, -3.6, { seg: 8 });
  H(0.42, 0.42, 0.3, 0xb31b1b, -1.28, 0, 9.2); C(0.06, 0xffcf3a, -1.28, 0.5, 9.25, { sang: true }); // miếu ông địa
  const xeBM = k.nhomCon(-0.9, 11.4, Math.PI / 2); H(1.2, 0.75, 0.6, 0xb08a5a, 0, 0.15, 0, { cha: xeBM }); H(1.2, 0.5, 0.6, k.kinh, 0, 0.9, 0, { cha: xeBM }); H(1.3, 0.05, 0.7, 0xc0262d, 0, 1.4, 0, { cha: xeBM }); xeBM.can(0, 0, 1.3, 0.7);
  const bm = k.vung(256, 64, veBien("#c0262d", [["BÁNH MÌ CÔ BẢY", 0.55, 0.52, "#ffe14d"]])); V(bm, 1.1, 0.28, -0.59, 1.6, 11.4, { ry: Math.PI / 2 });
  T(0.22, 0.2, 0.4, 0x6b6b6b, 1.2, 0, 4.0, { can: true }); for (let i = 0; i < 5; i++) H(0.5, 0.02, 0.18, 0x5f9a48, 1.2 + Math.cos(i * 1.26) * 0.25, 0.9 + i * 0.08, 4.0 + Math.sin(i * 1.26) * 0.25, { ry: -i * 1.26, rz: 0.5, hai: true }); T(0.04, 0.05, 0.9, 0x7a8a4a, 1.2, 0.4, 4.0);
  T(0.25, 0.22, 0.7, 0x2e8b57, 1.2, 0, -10.2, { can: true }); H(0.6, 0.35, 0.4, 0x1c1c1f, 1.1, 0, -11.0); C(0.25, 0x1c1c1f, 1.25, 0.25, -10.7);
  C(0.15, 0xd9c9a8, -1.3, 2.3, 2.2, { sy: 1.3 }); H(0.01, 0.3, 0.01, 0x555555, -1.3, 2.45, 2.2); // lồng chim
  // dây điện chằng chịt
  for (let i = 0; i < 8; i++) { const za = -13 + i * 3.6, zb = za + 2 + k.rnd() * 3; k.day(k.vong([-1.5, 4.6 + k.rnd() * 1.5, za], [1.5, 4.3 + k.rnd() * 1.5, zb], 0.4 + k.rnd() * 0.4)); }
  for (let i = 0; i < 5; i++) k.day(k.vong([-1.3 + i * 0.05, 5.2 + i * 0.12, -14], [-1.3 + i * 0.05, 5.0 + i * 0.12, 13], 0.9, 16));
  for (const zz of [-8, 0.5, 8]) { H(0.3, 0.12, 0.12, 0xe8e8e8, -1.42, 3.2, zz); H(0.08, 0.06, 0.3, 0xfff3d0, -1.3, 3.12, zz, { sang: true }); k.vungSang(-0.6, zz, 1.6); }
  // đầu hẻm: tường nhà chắn (bắc) và cổng "HẺM 69" nhìn ra phố (nam)
  H(4, 9, 0.4, 0xe0d4b8, 0, 0, -14.2, { can: true, tuong: true });
  for (const x of [-1.45, 1.45]) H(0.25, 4.0, 0.25, 0xc0262d, x, 0, 13.6, { can: true });
  const congHem = k.vung(512, 100, veBien("#c0262d", [["KHU PHỐ VĂN HÓA – HẺM 69", 0.46, 0.52, "#ffe14d"]], { vien: "#ffe14d" }));
  V(congHem, 3.0, 0.6, 0, 3.75, 13.6, { hai: true }); V(congHem, 3.0, 0.6, 0, 3.75, 13.62, { ry: Math.PI });
  const phoLon = k.vung(1024, 320, (g, w, h) => {
    g.fillStyle = "#3a3c41"; g.fillRect(0, h * 0.62, w, h * 0.38); g.fillStyle = "#eeeadc"; for (let x = 0; x < w; x += 120) g.fillRect(x, h * 0.8, 60, 6);
    [["#f3d9a4", "CƠM TẤM SƯỜN HÓNG", "#c0262d"], ["#d9e6f2", "ĐIỆN THOẠI HÓNG MOBILE", "#1f4fa8"], ["#f2a7a0", "LẨU DÊ 7 MÓN", "#2e8b57"]].forEach(([m, ten, b], i) => {
      const x = i * w / 3; g.fillStyle = m; g.fillRect(x, 10, w / 3 - 6, h * 0.62 - 10); g.fillStyle = b; g.fillRect(x + 16, h * 0.3, w / 3 - 38, 40); chu(g, ten, x + w / 6 - 3, h * 0.3 + 20, 24, "#fff", { toiDa: w / 3 - 50 });
      g.fillStyle = "#3a4855"; g.fillRect(x + 50, 30, w / 3 - 110, 46); g.fillStyle = "#9aa0a6"; g.fillRect(x + 16, h * 0.45, w / 3 - 38, h * 0.17);
    });
    for (let i = 0; i < 5; i++) { const x = 80 + i * 200; g.fillStyle = ["#c0262d", "#1c1c1f", "#2a5aa8", "#f2f2f2", "#e8702a"][i]; g.fillRect(x, h * 0.72, 70, 26); g.fillStyle = "#111"; g.beginPath(); g.arc(x + 8, h * 0.82, 10, 0, 7); g.arc(x + 62, h * 0.82, 10, 0, 7); g.fill(); }
  });
  V(phoLon, 7, 2.2, 0, 1.1, 16.4, { ry: Math.PI }); H(9, 12, 0.3, 0xc8b8a8, 0, 2.2, 16.6); H(9, 2.2, 0.3, 0xc8b8a8, 0, 0, 16.7);
  P(4, 3, 0x3a3c41, 0, -0.01, 15, { nam: true }); k.can(-2, 2, 14.0, 14.4);
  H(5, 12, 1.5, 0xd9c8a0, -3.2, 0, 14.8); H(5, 12, 1.5, 0xd9c8a0, 3.2, 0, 14.8);
}

// =============================================================================================
// 7. SẢNH LL ENTERTAINMENT — sàn đá bóng, quầy lễ tân cong, tường lam gỗ, thang máy, cổng an ninh, phòng họp kính
function dungLL(k) {
  const { H, T, C, V, P } = k;
  const X1 = -12, X2 = 12, Z1 = -9, Z2 = 8, CAO = 7;
  k.phong(X1, Z1, X2, Z2, CAO, { mau: 0xe8e4dc, tran: 0xf6f4ef, bo: ["nam"] });
  // mặt dựng kính trước + cửa xoay
  for (const [a, b] of [[-12.2, -1.6], [1.6, 12.2]]) { H(b - a, 0.15, 0.2, 0x1c1c1f, (a + b) / 2, 0, Z2 + 0.1); H(b - a, CAO, 0.04, k.kinh, (a + b) / 2, 0, Z2 + 0.1); k.can(a, b, Z2, Z2 + 0.25, true); }
  for (let x = -12; x <= 12; x += 2.4) H(0.08, CAO, 0.16, 0x2a2c31, x, 0, Z2 + 0.1); for (const y of [2.6, 4.8]) H(24.4, 0.1, 0.16, 0x2a2c31, 0, y, Z2 + 0.1);
  T(1.55, 1.55, 2.6, k.kinh, 0, 0, Z2 + 0.4, { seg: 16, mo: true }); H(3.4, 0.25, 1.8, 0x2a2c31, 0, 2.6, Z2 + 0.4); for (let i = 0; i < 4; i++) H(1.5, 2.5, 0.04, k.kinh, Math.cos(i * Math.PI / 2 + 0.4) * 0.75, 0, Z2 + 0.4 + Math.sin(i * Math.PI / 2 + 0.4) * 0.75, { ry: -(i * Math.PI / 2 + 0.4) });
  k.can(-1.6, 1.6, Z2 - 0.1, Z2 + 2);
  // quảng trường bên ngoài (tranh) + nền
  const qt = k.vung(1024, 360, (g, w, h) => {
    g.fillStyle = "#cfc8bc"; g.fillRect(0, h * 0.7, w, h * 0.3); g.strokeStyle = "#b8b0a2"; for (let x = 0; x < w; x += 40) { g.beginPath(); g.moveTo(x, h * 0.7); g.lineTo(x - 80, h); g.stroke(); }
    for (let i = 0; i < 6; i++) { const x = 60 + i * 180; g.fillStyle = "#6b4a2f"; g.fillRect(x - 5, h * 0.42, 10, h * 0.3); g.fillStyle = "#3d7a34"; g.beginPath(); g.arc(x, h * 0.38, 46, 0, 7); g.fill(); g.fillStyle = "#4f8a3c"; g.beginPath(); g.arc(x + 22, h * 0.32, 32, 0, 7); g.fill(); }
    for (let i = 0; i < 4; i++) { const x = 140 + i * 240; g.fillStyle = ["#1c1c1f", "#f2f2f2", "#2e8b57", "#c0262d"][i]; g.fillRect(x, h * 0.62, 120, 34); g.fillStyle = "#24303c"; g.fillRect(x + 22, h * 0.56, 70, 24); }
  });
  V(qt, 30, 10.5, 0, 4.5, Z2 + 6, { ry: Math.PI });
  P(30, 6, 0xcfc8bc, 0, -0.01, Z2 + 3, { nam: true }); H(32, 14, 0.3, 0x8a9aa8, 0, 9.2, Z2 + 6.2); H(0.3, 20, 7, 0x2a2c31, -13, 0, Z2 + 3); H(0.3, 20, 7, 0x2a2c31, 13, 0, Z2 + 3); H(30, 0.3, 7, 0x2a2c31, 0, CAO, Z2 + 3);
  // sàn đá bóng: viền đen, ô trắng/xám
  k.san(X1, Z1, X2, Z2, { o: 1.2, mau: (i, j) => (i === 0 || j === 0 || i === 19 || j === 13) ? 0x1c1c1f : (i + j) % 2 ? 0xf2f0ec : 0xdedad2, khe: 0.01, mauKhe: 0x9a968e, bien: 0.015 });
  // vách lam gỗ sau quầy + logo phát sáng
  for (let x = -6.8; x <= 6.8; x += 0.28) H(0.12, CAO - 0.4, 0.16, 0x8a5a3a, x, 0, Z1 + 0.15);
  H(14, CAO - 0.4, 0.05, 0x2a1c14, 0, 0, Z1 + 0.04);
  const logo = k.vung(800, 300, (g, w, h) => {
    g.clearRect(0, 0, w, h);
    g.fillStyle = "#7a1424"; g.beginPath(); g.roundRect(w * 0.08, h * 0.08, h * 0.84, h * 0.84, 30); g.fill();
    chu(g, "LL", w * 0.08 + h * 0.42, h * 0.53, h * 0.5, "#ffffff", { font: FONT_TRON, toiDa: h * 0.75 });
    chu(g, "LL ENTERTAINMENT", w * 0.66, h * 0.42, 74, "#ffffff", { toiDa: w * 0.55 });
    chu(g, "NGÔI SAO MỚI · ÂM NHẠC · GIẢI TRÍ", w * 0.66, h * 0.7, 30, "#f2c4a0", { dam: 600, toiDa: w * 0.55 });
  });
  V(logo, 8.8, 3.3, 0, 4.6, Z1 + 0.27, { sang: true });
  // ba đồng hồ múi giờ
  [["HÀ NỘI", -3], ["ƯỚC MƠ", -1.2], ["VŨNG TÀU", 0.6]].forEach(([ten, x]) => { k.dongHo(x + 4.2, 2.6, Z1 + 0.25, 0); const t = k.vung(160, 40, veBien("#2a1c14", [[ten, 0.6, 0.5, "#f2c4a0", 700]])); V(t, 0.6, 0.15, x + 4.2, 2.25, Z1 + 0.25); });
  // quầy lễ tân cong
  const R = 3.4, cz = -8.6;
  for (let i = -3; i <= 3; i++) { const a = i * 0.16, x = Math.sin(a) * R, z = cz + Math.cos(a) * R; H(0.56, 1.1, 0.55, 0xf6f4ef, x, 0, z, { ry: a }); H(0.6, 0.06, 0.8, 0x1c1c1f, x - Math.sin(a) * 0.1, 1.1, z - Math.cos(a) * 0.1, { ry: a }); H(0.56, 0.05, 0.02, 0xc8a060, x + Math.sin(a) * 0.28, 0.25, z + Math.cos(a) * 0.28, { ry: a, sang: true }); }
  k.can(-1.8, 1.8, -5.55, -4.9); k.can(-1.8, -1.2, -6.4, -5.5); k.can(1.2, 1.8, -6.4, -5.5);
  const logoQ = k.vung(400, 80, veBien("#7a1424", [["LL ENTERTAINMENT", 0.5, 0.52, "#ffffff"]], { tron: 10 }));
  V(logoQ, 1.6, 0.32, 0, 0.7, -4.87, { sang: true });
  for (const x of [-1.0, 1.0]) { H(0.5, 0.3, 0.02, 0x1c1c1f, x, 1.16, -5.5, { rx: -0.2 }); H(0.46, 0.26, 0.01, 0x9fd3f2, x, 1.18, -5.49, { rx: -0.2, sang: true }); }
  C(0.12, 0xf26fa6, -1.5, 1.3, -5.2); T(0.07, 0.06, 0.18, 0xf6f6f2, -1.5, 1.16, -5.2);
  // thang máy (tường tây)
  for (const z of [-6, -3, 0]) {
    H(0.1, 2.6, 1.8, 0x2a2c31, X1 + 0.05, 0, z); H(0.06, 2.4, 0.78, 0xc0c4ca, X1 + 0.1, 0, z - 0.4); H(0.06, 2.4, 0.78, 0xc8ccd2, X1 + 0.1, 0, z + 0.4);
    H(0.04, 0.2, 0.5, 0x111111, X1 + 0.1, 2.7, z); const lt = k.vung(96, 40, veBien("#111", [["▲ 27", 0.7, 0.52, "#ff7a3a"]])); V(lt, 0.4, 0.16, X1 + 0.13, 2.8, z, { ry: Math.PI / 2, sang: true });
    H(0.05, 0.25, 0.12, 0xc0c4ca, X1 + 0.1, 1.05, z + 1.1); C(0.025, 0xffe14d, X1 + 0.14, 1.2, z + 1.1, { sang: true });
  }
  // cổng an ninh (chừa một lối mở)
  for (const z of [-6.5, -5.2, -3.9, -2.6]) { H(0.24, 1.0, 1.0, 0xc0c4ca, -7.4, 0, z, { can: true }); H(0.25, 0.03, 0.9, 0x3fe07a, -7.4, 1.0, z, { sang: true }); }
  for (const z of [-5.85, -4.55, -3.25]) { H(0.02, 0.7, 0.36, k.kinh, -7.4, 0.35, z - 0.2); H(0.02, 0.7, 0.36, k.kinh, -7.4, 0.35, z + 0.2); k.can(-7.42, -7.38, z - 0.4, z + 0.4); }
  // phòng họp kính (góc đông bắc)
  H(0.06, 3.2, 7, k.kinh, 6, 0, -5.5); H(4.6, 3.2, 0.06, k.kinh, 9.7, 0, -2.0); H(0.1, 0.1, 7, 0x2a2c31, 6, 3.2, -5.5); H(6, 0.1, 0.1, 0x2a2c31, 9, 3.2, -2.0); H(6, 3.8, 0.1, 0xe8e4dc, 9, 3.2, -2.0); H(0.1, 3.8, 7, 0xe8e4dc, 6, 3.2, -5.5);
  k.can(5.95, 6.05, -9, -2.0, true); k.can(7.4, 12, -2.05, -1.95, true);
  const mo = k.vung(256, 40, (g, w, h) => { g.fillStyle = "rgba(255,255,255,.75)"; g.fillRect(0, 0, w, h); g.fillStyle = "#7a1424"; for (let x = 8; x < w; x += 22) { g.beginPath(); g.arc(x, h / 2, 5, 0, 7); g.fill(); } });
  V(mo, 7, 0.28, 6.04, 1.45, -5.5, { ry: Math.PI / 2 }); V(mo, 4.6, 0.28, 9.7, 1.45, -1.96);
  k.ban(9.0, -5.6, 3.0, 1.2, 0.75, 0xf6f4ef, 0x2a2c31);
  for (const x of [8.0, 9.0, 10.0]) { k.ghe(x, -6.5, 0, 0x1c1c1f, { can: false }); k.ghe(x, -4.7, Math.PI, 0x1c1c1f, { can: false }); }
  const tvH = k.vung(320, 180, veBien(gradNgang("#7a1424", "#2a1c14"), [["KẾ HOẠCH RA MẮT", 0.13, 0.35, "#ffffff"], ["NGÔI SAO MỚI · Q4", 0.1, 0.6, "#f2c4a0", 700]]));
  H(2.0, 1.15, 0.06, 0x111111, 9.0, 1.1, Z1 + 0.05); V(tvH, 1.9, 1.05, 9.0, 1.68, Z1 + 0.09, { sang: true });
  // sảnh chờ: sofa da đen, bàn trà, tạp chí
  k.sofa(7.7, 4.6, 2.6, Math.PI, 0x1c1c1f); k.sofa(10.6, 3.0, 1.8, -Math.PI / 2, 0x1c1c1f);
  k.ban(7.7, 3.2, 1.4, 0.7, 0.42, 0x8a5a3a, 0x2a2c31); for (let i = 0; i < 3; i++) H(0.22, 0.015, 0.3, [0xf26fa6, 0xf6f6f2, 0x7a1424][i], 7.3 + i * 0.3, 0.42 + i * 0.015, 3.2, { ry: i * 0.3 });
  P(4, 3.2, 0x5a4a3a, 8.6, 0.012, 3.6, { nam: true });
  T(0.03, 0.03, 1.7, 0x2a2c31, 11.3, 0, 5.4); T(0.2, 0.26, 0.32, 0xf6f0e0, 11.3, 1.6, 5.4, { mo: true, hai: true, seg: 10 });
  // màn LED quảng bá nghệ sĩ (tường tây phía trước)
  const ledNS = k.vung(640, 400, (g, w, h) => {
    const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#1c1c1f"); gr.addColorStop(1, "#7a1424"); g.fillStyle = gr; g.fillRect(0, 0, w, h);
    for (let i = 0; i < 3; i++) { const x = w * (0.25 + i * 0.25); g.fillStyle = "rgba(255,255,255,.14)"; g.beginPath(); g.arc(x, h * 0.42, 50, 0, 7); g.fill(); g.fillRect(x - 60, h * 0.55, 120, h * 0.3); }
    chu(g, "NGÔI SAO MỚI", w / 2, h * 0.16, 54, "#ffffff", { font: FONT_TRON, toiDa: w * 0.9, bong: 12, mauBong: "#f2c4a0" });
    chu(g, "THỬ GIỌNG MÙA 3 · ĐĂNG KÝ TẠI QUẦY LỄ TÂN", w / 2, h * 0.92, 24, "#f2c4a0", { dam: 700, toiDa: w * 0.92 });
  });
  H(0.12, 3.3, 5.2, 0x111111, X1 + 0.06, 0.9, 3.8); V(ledNS, 5.0, 3.1, X1 + 0.13, 2.55, 3.8, { ry: Math.PI / 2, sang: true });
  // tủ cúp
  H(0.5, 2.0, 2.0, 0x2a1c14, X2 - 0.25, 0, 0.6, { can: true }); H(0.02, 1.6, 1.8, k.kinh, X2 - 0.51, 0.3, 0.6); for (const y of [0.7, 1.3]) for (let i = 0; i < 3; i++) { T(0.06, 0.03, 0.25, 0xd9b04a, X2 - 0.3, y, 0.0 + i * 0.6, { seg: 8 }); C(0.08, 0xd9b04a, X2 - 0.3, y + 0.32, 0.0 + i * 0.6); }
  // bàn bảo vệ cạnh cửa
  H(1.4, 1.0, 0.6, 0x2a2c31, -8.6, 0, 6.2, { can: true }); k.ghe(-8.6, 6.9, Math.PI, 0x1c1c1f, { can: false });
  const bv = k.vung(220, 60, veBien("#1c1c1f", [["BẢO VỆ", 0.55, 0.52, "#ffffff"]])); V(bv, 0.8, 0.22, -8.6, 0.7, 5.89, { ry: Math.PI });
  // cột tròn, đèn chùm vòng, chậu cây lớn
  for (const [x, z] of [[-4.2, 2.6], [4.2, 2.6]]) T(0.42, 0.42, CAO, 0xf6f4ef, x, 0, z, { can: true, seg: 14 });
  for (const [r, y] of [[2.4, 5.6], [1.7, 5.2], [1.0, 4.8]]) { const v = new THREE.Mesh(new THREE.TorusGeometry(r, 0.05, 6, 40), vb(0xfff3d0)); v.rotation.x = Math.PI / 2; v.position.set(0, y, 1.2); v.userData.sang = true; k.nhom.add(v); H(0.01, CAO - y, 0.01, 0x8a8d92, r, y, 1.2); H(0.01, CAO - y, 0.01, 0x8a8d92, -r, y, 1.2); }
  for (const [x, z] of [[-10.8, 7.0], [10.8, 7.0], [-6.6, -7.9], [5.2, -1.4]]) k.cay(x, z, 1.8, { chau: 0x2a2c31, kieu: "la_to" });
  for (let x = -9; x <= 9; x += 3) for (const z of [-4, 1, 6]) H(1.2, 0.03, 0.6, 0xfffaf0, x, CAO - 0.04, z, { sang: true });
}

// =============================================================================================
// 8. XE KHÁCH — trong xe giường ngồi: hàng ghế, rèm, giá hành lý; ngoài cửa sổ cảnh chạy lùi
function dungXeKhach(k) {
  const { H, T, C, V, P } = k;
  const W = 1.3, Z1 = -6, Z2 = 6, CAO = 2.3;
  const THAN = 0xe8e4dc, GHE = 0x2a3f6a;
  // sàn, trần cong, vách
  k.san(-W, Z1, W, Z2, { o: 0.4, mau: [0x3a3c40, 0x34363a], bien: 0.02 });
  H(0.7, 0.012, 11, 0x7a1424, 0, 0.004, 0.4);
  H(2 * W + 0.2, 0.12, 12.2, 0xf2efe8, 0, CAO, 0); H(0.5, 0.1, 12, 0xd9d4c8, -W + 0.2, CAO - 0.15, 0, { rz: -0.4 }); H(0.5, 0.1, 12, 0xd9d4c8, W - 0.2, CAO - 0.15, 0, { rz: 0.4 });
  for (const s of [-1, 1]) {
    H(0.1, 0.85, 12, THAN, s * (W + 0.05), 0, 0, { can: true, tuong: true }); H(0.1, CAO - 1.9, 12, THAN, s * (W + 0.05), 1.9, 0);
    H(0.04, 1.05, 12, k.kinh, s * (W + 0.07), 0.85, 0); k.can(s > 0 ? W : -W - 0.1, s > 0 ? W + 0.1 : -W, -6, 6, true);
    for (let z = -5.4; z <= 6; z += 1.8) { H(0.12, 1.05, 0.12, 0x9aa0a6, s * (W + 0.02), 0.85, z); H(0.06, 0.95, 0.22, 0x4a5a7a, s * (W - 0.05), 0.9, z + 0.18); }
    H(0.4, 0.06, 10, 0xd9d4c8, s * (W - 0.2), 1.95, 0.8); H(0.02, 0.12, 10, 0xb8bcc4, s * (W - 0.4), 1.89, 0.8); // giá hành lý
    for (let z = -3.5; z < 5.6; z += 0.9) { T(0.04, 0.04, 0.02, 0xfff3d0, s * (W - 0.35), 1.92, z, { sang: true, seg: 8 }); }
    for (let i = 0; i < 5; i++) H(0.3, 0.18, 0.45, k.chon([0x1c1c1f, 0xc0262d, 0x2a5aa8, 0xb08a5a, 0x2e8b57]), s * (W - 0.2), 2.01, -3 + i * 1.9 + k.rnd() * 0.5);
  }
  H(2.6, CAO, 0.1, THAN, 0, 0, Z2 + 0.05, { can: true, tuong: true }); H(1.6, 0.8, 0.04, k.kinh, 0, 1.2, Z2 + 0.02);
  H(0.02, 0.06, 11, 0xfffaf0, 0, CAO - 0.03, 0.4, { sang: true });
  // hàng ghế 2+2 (lối đi giữa 0,76 m)
  const ghe = (x, z) => {
    const g = k.nhomCon(x, z, Math.PI), c = { cha: g };
    H(0.44, 0.13, 0.46, GHE, 0, 0.32, 0, c); H(0.44, 0.78, 0.12, GHE, 0, 0.42, -0.24, { cha: g, rx: 0.12 }); H(0.42, 0.28, 0.13, 0xf2f2f2, 0, 1.0, -0.3, { cha: g, rx: 0.12 });
    H(0.36, 0.08, 0.36, 0x1c1c1f, 0, 0.0, 0, c); H(0.05, 0.3, 0.05, 0x5a5d63, 0, 0.05, 0, c); H(0.04, 0.05, 0.4, 0x5a5d63, x > 0 ? -0.24 : 0.24, 0.55, 0.0, c);
  };
  for (let i = 0; i < 8; i++) for (const x of [-1.04, -0.6, 0.6, 1.04]) ghe(x, -1.35 + i * 0.9);
  k.can(-W, -0.38, -1.65, 5.7); k.can(0.38, W, -1.65, 5.7);
  for (let i = 0; i < 5; i++) ghe(-1.0 + i * 0.5, 5.65);
  k.can(-W, W, 5.4, 6);
  // đầu xe: ghế lái, vô lăng, táp-lô, kính chắn gió, bậc cửa
  H(2.6, 0.95, 0.9, 0x2a2c31, 0, 0, -5.6, { can: true }); H(2.6, 0.05, 0.6, 0x1c1c1f, 0, 0.95, -5.55);
  for (const [x, m] of [[-0.8, 0x3fe07a], [-0.6, 0xffcf3a], [-0.4, 0x7fd3ff]]) T(0.06, 0.06, 0.01, m, x, 0.98, -5.4, { sang: true, seg: 10 });
  const vl0 = new THREE.Mesh(new THREE.TorusGeometry(0.22, 0.025, 6, 16), vl(0x1c1c1f)); vl0.position.set(-0.7, 1.15, -5.0); vl0.rotation.x = -1.0; k.nhom.add(vl0);
  T(0.03, 0.03, 0.5, 0x1c1c1f, -0.7, 0.8, -5.15, { rx: 0.5 });
  const gl = k.nhomCon(-0.7, -4.55, Math.PI); H(0.5, 0.12, 0.5, 0x1c1c1f, 0, 0.38, 0, { cha: gl }); H(0.5, 0.8, 0.12, 0x1c1c1f, 0, 0.45, -0.25, { cha: gl, rx: 0.1 }); gl.can(0, 0, 0.55, 0.55);
  H(2.6, 1.3, 0.05, k.kinh, 0, 1.0, -6.05, { rx: 0.12 }); H(2.7, 0.15, 0.12, 0x2a2c31, 0, 2.25, -6.0); H(0.12, 1.4, 0.12, 0x2a2c31, -1.3, 0.95, -6.0); H(0.12, 1.4, 0.12, 0x2a2c31, 1.3, 0.95, -6.0);
  H(0.6, 0.2, 0.6, 0x5a5d63, 0.9, -0.2, -4.9); k.can(0.55, W, -5.2, -4.3);
  H(0.04, 1.6, 0.04, 0xc0c4ca, 0.45, 0, -4.3); // tay vịn
  const tvXe = k.vung(512, 180, (g, w, h) => { const gr = g.createLinearGradient(0, 0, w, 0); gr.addColorStop(0, "#0b1e5a"); gr.addColorStop(1, "#1f7a8a"); g.fillStyle = gr; g.fillRect(0, 0, w, h); chu(g, "NHÀ XE HÓNG TRAVEL", w / 2, 34, 30, "#ffe14d", { toiDa: w * 0.9 }); chu(g, "THÀNH PHỐ ƯỚC MƠ → VŨNG TÀU", w / 2, 92, 34, "#ffffff", { toiDa: w * 0.92 }); chu(g, "125 KM · VUI LÒNG THẮT DÂY AN TOÀN", w / 2, 145, 22, "#bfe9ff", { dam: 600, toiDa: w * 0.92 }); });
  H(0.9, 0.36, 0.06, 0x111111, 0, 1.72, -4.9); V(tvXe, 0.84, 0.3, 0, 1.9, -4.86, { sang: true });
  const bienCam = k.vung(320, 60, veBien("#c0262d", [["KHÔNG HÚT THUỐC TRÊN XE", 0.45, 0.52, "#ffffff"]])); V(bienCam, 0.7, 0.13, 0, 2.18, Z2 - 0.01, { ry: Math.PI });
  // cảnh bên ngoài: đường phía trước + hai dải cảnh chạy lùi (phần trên trong suốt để thấy trời thật)
  const cv = document.createElement("canvas"); cv.width = k.dienThoai ? 1024 : 2048; cv.height = cv.width / 8;
  const g = cv.getContext("2d"), S = cv.width / 2048; g.scale(S, S);
  const Wc = 2048, Hc = 256;
  g.clearRect(0, 0, Wc, Hc);
  g.fillStyle = "#6a9a4a"; g.fillRect(0, Hc * 0.62, Wc, Hc * 0.38);
  for (let x = 0; x < Wc; x += 22) { g.fillStyle = x % 44 ? "#7fae55" : "#5f8f42"; g.fillRect(x, Hc * 0.66, 18, Hc * 0.34); }
  g.fillStyle = "#8aa0b0"; for (let i = 0; i < 6; i++) { const x = i * 360 + 40; g.beginPath(); g.moveTo(x, Hc * 0.62); g.lineTo(x + 140, Hc * 0.42); g.lineTo(x + 300, Hc * 0.62); g.fill(); }
  for (let i = 0; i < 14; i++) { const x = i * 150 + (i % 3) * 30; if (i % 4 === 1) { g.fillStyle = ["#f3d9a4", "#e9b8a8", "#d9e6f2"][i % 3]; g.fillRect(x, Hc * 0.44, 90, Hc * 0.22); g.fillStyle = "#a8503a"; g.beginPath(); g.moveTo(x - 10, Hc * 0.45); g.lineTo(x + 45, Hc * 0.33); g.lineTo(x + 100, Hc * 0.45); g.fill(); } else { g.fillStyle = "#6b4a2f"; g.fillRect(x + 36, Hc * 0.36, 8, Hc * 0.3); g.fillStyle = i % 2 ? "#3d7a34" : "#2f6b2a"; g.beginPath(); g.arc(x + 40, Hc * 0.34, 34, 0, 7); g.fill(); } }
  for (let i = 0; i < 10; i++) { g.fillStyle = "#9a958a"; g.fillRect(i * 205 + 100, Hc * 0.2, 7, Hc * 0.48); g.fillRect(i * 205 + 84, Hc * 0.24, 40, 4); }
  g.strokeStyle = "#222"; g.lineWidth = 1.5; for (const y of [0.25, 0.28]) { g.beginPath(); for (let i = 0; i <= 10; i++) { const x = i * 205 + 103; if (i) g.quadraticCurveTo(x - 102, Hc * (y + 0.06), x, Hc * y); else g.moveTo(x, Hc * y); } g.stroke(); }
  g.fillStyle = "#c0262d"; g.fillRect(1300, Hc * 0.3, 160, 60); chu(g, "VŨNG TÀU 45 KM", 1380, Hc * 0.3 + 30, 22, "#ffffff", { toiDa: 150 });
  g.fillStyle = "#a9a39a"; g.fillRect(0, Hc * 0.86, Wc, Hc * 0.14);
  // làm nhòe theo chiều chạy
  const c2 = document.createElement("canvas"); c2.width = cv.width; c2.height = cv.height; const g2 = c2.getContext("2d"); g2.filter = `blur(${2 * S}px)`; g2.drawImage(cv, 0, 0); g2.filter = "none";
  const texCanh = new THREE.CanvasTexture(c2); texCanh.colorSpace = THREE.SRGBColorSpace; texCanh.wrapS = THREE.RepeatWrapping; texCanh.repeat.set(2, 1);
  const vlCanh = new THREE.MeshBasicMaterial({ map: texCanh, transparent: true, alphaTest: 0.05, fog: false, side: THREE.DoubleSide });
  texCanh.repeat.set(3, 1);
  for (const s of [-1, 1]) { const m = new THREE.Mesh(new THREE.PlaneGeometry(90, 7.5), vlCanh); m.position.set(s * 5.2, 1.7, -25); m.rotation.y = -s * Math.PI / 2; k.dong(m); }
  const cvD = document.createElement("canvas"); cvD.width = 128; cvD.height = 256; const gd = cvD.getContext("2d");
  gd.fillStyle = "#3a3c41"; gd.fillRect(0, 0, 128, 256); gd.fillStyle = "#e8e4d6"; gd.fillRect(60, 0, 8, 128); gd.fillStyle = "#d9cfa0"; gd.fillRect(4, 0, 4, 256); gd.fillRect(120, 0, 4, 256);
  const texDuong = new THREE.CanvasTexture(cvD); texDuong.colorSpace = THREE.SRGBColorSpace; texDuong.wrapT = THREE.RepeatWrapping; texDuong.repeat.set(1, 10);
  const duong = new THREE.Mesh(new THREE.PlaneGeometry(9, 80), new THREE.MeshBasicMaterial({ map: texDuong, fog: false })); duong.rotation.x = -Math.PI / 2; duong.position.set(0, -1.2, -46); k.dong(duong);
  const co = new THREE.Mesh(new THREE.PlaneGeometry(14, 90), new THREE.MeshBasicMaterial({ color: 0x6a9a4a, fog: false })); co.rotation.x = -Math.PI / 2; co.position.set(0, -1.25, -40); k.dong(co);
  k.moi((dt) => { texCanh.offset.x -= dt * 0.012; texDuong.offset.y += dt * 2.2; });
}

// =============================================================================================
// 9. NHÀ VƯỜN VEN ĐÔ — sân đất, nhà mái ngói, hiên, võng, chõng tre, ao cá, cây trái, hàng tre bao quanh
function dungNhaVuon(k) {
  const { H, T, C, V, P } = k;
  // sân đất, lối gạch, cỏ
  k.san(-16, -13, 16, 15, { o: 1, mau: (i, j) => [0x8a9a4a, 0x7f9a45, 0x94a050][(i * 5 + j * 3) % 3], bien: 0.05, y: 0 });
  P(110, 110, 0x6f8a42, 0, -0.03, 1, { nam: true });
  k.san(-7, -5, 7, 7, { o: 0.5, mau: [0xb89a6a, 0xae9060], bien: 0.06, y: 0.006 });
  k.san(-0.8, 7, 0.8, 15, { o: 0.4, mau: [0xa8503a, 0x9c4a36], khe: 0.02, mauKhe: 0x6a5a4a, y: 0.008 });
  // nhà: tường vôi vàng, hiên cột gỗ, mái ngói đỏ hai mái
  const VANG = 0xf2d27a, TC = 4.0;
  // vỏ nhà (cửa giữa mở, vào được gian thờ)
  k.phong(-7, -12.5, 7, -5.5, TC, { mau: VANG, tran: false, cua: { nam: [[-1, 1]] }, caoCua: 2.6 });
  k.san(-7, -12.5, 7, -5.5, { o: 0.5, mau: [0xb8553a, 0xa84a32], khe: 0.015, mauKhe: 0x7a3a2a, y: 0.01 });
  H(14.4, 0.12, 7.4, 0x8a5a3a, 0, 3.3, -9); // trần gỗ (la phông)
  // hiên lát gạch tàu thấp
  H(14.4, 0.08, 2.6, 0xa8503a, 0, 0, -4.2); k.san(-7.2, -5.5, 7.2, -2.9, { o: 0.4, mau: [0xb8553a, 0xa84a32], khe: 0.015, mauKhe: 0x7a3a2a, y: 0.085 });
  for (const x of [-6.8, -3.4, 3.4, 6.8]) { T(0.13, 0.15, 3.32, 0x6b4a2f, x, 0.08, -3.1, { can: true }); T(0.22, 0.22, 0.2, 0x8a8d92, x, 0.08, -3.1); }
  const ngoi = k.vung(256, 128, (g, w, h) => { for (let j = 0; j < 8; j++) for (let i = 0; i < 16; i++) { g.fillStyle = (i + j) % 3 ? "#b0473a" : "#a03e32"; g.fillRect(i * 16 + (j % 2) * 8, j * 16, 15, 14); g.fillStyle = "rgba(0,0,0,.18)"; g.fillRect(i * 16 + (j % 2) * 8, j * 16 + 12, 15, 3); } });
  // mái chính hai mái: nóc ở y 6.8, mép mái chìa ra 0,4 m
  const goc = Math.atan2(2.8, 3.5), dai = 3.9 / Math.cos(goc);
  for (const s of [1, -1]) k.HA(ngoi, 15.6, 0.14, dai, 0, 6.8 - 1.95 * Math.tan(goc) - 0.07, -9 + s * 1.95, { rx: s * goc });
  H(15.8, 0.22, 0.34, 0x8a3a2e, 0, 6.72, -9);
  // hồi nhà (tam giác)
  for (const x of [-7.1, 7.1]) { const sh = new THREE.Shape([new THREE.Vector2(-3.6, 0), new THREE.Vector2(3.6, 0), new THREE.Vector2(0, 2.85)]); const m = new THREE.Mesh(new THREE.ShapeGeometry(sh), vl(VANG, { side: THREE.DoubleSide })); m.position.set(x, TC, -9); m.rotation.y = Math.PI / 2; k.nhom.add(m); }
  // mái hiên: từ dưới mép mái chính (z −5.5, y 3.95) dốc xuống trước (z −2.6, y 3.42)
  const ghien = Math.atan2(0.53, 2.9), dh = 3.0 / Math.cos(ghien);
  const hien = k.HA(ngoi, 14.8, 0.08, dh, 0, 3.64, -4.05, { rx: ghien });
  H(14.6, 0.16, 0.16, 0x6b4a2f, 0, 3.24, -3.1);
  // cửa gỗ ba gian: hai gian bên đóng, gian giữa mở hai cánh vào trong
  for (const x of [-4.2, 4.2]) { H(2.0, 2.6, 0.06, 0x8a5a3a, x, 0.08, -5.27); for (let i = 0; i < 4; i++) H(0.04, 2.4, 0.02, 0x6b3a2a, x - 0.75 + i * 0.5, 0.18, -5.23); }
  H(0.95, 2.5, 0.05, 0x8a5a3a, -1.3, 0.05, -6.0, { ry: 1.35 }); H(0.95, 2.5, 0.05, 0x8a5a3a, 1.3, 0.05, -6.0, { ry: -1.35 });
  const lien = k.vung(512, 72, veBien("#b31b1b", [["PHÚC LỘC THỌ", 0.6, 0.52, "#ffcf3a", 800]])); V(lien, 1.9, 0.27, 0, 2.95, -5.28);
  // gian thờ bên trong
  H(2.2, 1.0, 0.6, 0x5a2a1a, 0, 0, -12.1, { can: true }); H(2.4, 0.06, 0.7, 0x6b3a2a, 0, 1.0, -12.1);
  C(0.08, 0xffb84d, -0.7, 1.15, -12.1, { sang: true }); C(0.08, 0xffb84d, 0.7, 1.15, -12.1, { sang: true }); T(0.1, 0.12, 0.14, 0xd9b04a, 0, 1.06, -12.1); for (let i = 0; i < 3; i++) H(0.008, 0.3, 0.008, 0xc0262d, -0.04 + i * 0.04, 1.2, -12.1);
  H(0.5, 0.65, 0.04, 0x2a2c31, -0.45, 1.6, -12.42); H(0.5, 0.65, 0.04, 0x2a2c31, 0.45, 1.6, -12.42); H(0.42, 0.56, 0.01, 0xd9c8a8, -0.45, 1.65, -12.39); H(0.42, 0.56, 0.01, 0xd9c8a8, 0.45, 1.65, -12.39);
  H(1.2, 0.5, 0.04, 0xb31b1b, 0, 2.4, -12.45); C(0.06, 0xff3a3a, 0, 2.95, -12.35, { sang: true });
  k.ban(0, -9.6, 1.4, 0.8, 0.75, 0x6b3a2a, 0x5a2a1a); k.ghe(-1.0, -9.6, Math.PI / 2, 0x6b3a2a, { can: false }); k.ghe(1.0, -9.6, -Math.PI / 2, 0x6b3a2a, { can: false });
  H(2.0, 0.5, 1.6, 0x8a5a3a, -5.4, 0, -11.3, { can: true }); H(1.9, 0.04, 1.5, 0xd9c48a, -5.4, 0.5, -11.3); // bộ phản gỗ
  H(1.0, 1.9, 0.5, 0x6b3a2a, 5.6, 0, -12.1, { can: true }); H(0.04, 1.6, 0.4, 0x8a5a3a, 6.1, 0.15, -12.1);
  // hiên: bàn ghế gỗ, ấm trà, chậu kiểng
  k.ban(0, -3.7, 1.2, 0.7, 0.7, 0x8a5a3a, 0x6b3a2a); C(0.09, 0xf2f2f2, 0, 0.78, -3.7); for (let i = 0; i < 3; i++) T(0.035, 0.03, 0.06, 0xf2f2f2, -0.25 + i * 0.25, 0.7, -3.55);
  for (const x of [-2.2, 2.2]) k.ghe(x, -4.2, 0, 0x8a5a3a, { chan: 0x6b3a2a, lung: 0.55 });
  for (const x of [-5.6, 5.2]) { T(0.3, 0.22, 0.45, 0x2a6a8a, x, 0.08, -3.6, { can: true }); C(0.35, 0x4f8a3c, x, 0.85, -3.6); C(0.12, 0xf26fa6, x + 0.2, 1.1, -3.5); }
  // cây xoài lớn + chõng tre
  const cay = (x, z, s, mauLa = [0x3d7a34, 0x2f6b2a, 0x4f8a3c]) => { T(0.22 * s, 0.32 * s, 3.2 * s, 0x6b4a2f, x, 0, z, { can: true }); for (let i = 0; i < 6; i++) C((1.2 + k.rnd() * 0.6) * s, mauLa[i % 3], x + (k.rnd() - 0.5) * 2.4 * s, (3.4 + k.rnd() * 1.4) * s, z + (k.rnd() - 0.5) * 2.4 * s); };
  cay(6.4, -0.2, 1.3);
  const chong = k.nhomCon(6.2, -1.6, 0); for (let i = 0; i < 9; i++) H(2.0, 0.04, 0.12, i % 2 ? 0xd9c48a : 0xc8b07a, 0, 0.42, -0.5 + i * 0.125, { cha: chong }); for (const sx of [-0.92, 0.92]) H(0.06, 0.06, 1.12, 0xb89a5a, sx, 0.36, 0, { cha: chong }); for (const [a, b] of [[-0.9, -0.5], [0.9, -0.5], [-0.9, 0.5], [0.9, 0.5]]) T(0.035, 0.035, 0.42, 0xb89a5a, a, 0, b, { cha: chong }); chong.can(0, 0, 2.0, 1.1);
  T(0.1, 0.09, 0.1, 0x6b3a2a, 5.8, 0.46, -1.6); for (let i = 0; i < 3; i++) T(0.03, 0.025, 0.05, 0xf2f2f2, 6.2 + i * 0.12, 0.46, -1.45);
  // võng giữa hai cây
  cay(10.2, 3.2, 0.9); cay(13.0, 5.4, 0.9);
  const a = [10.2, 1.5, 3.2], b = [13.0, 1.5, 5.4]; const p = k.vong(a, b, 0.75, 8);
  k.day(p);
  for (let i = 1; i < p.length - 1; i++) { const q = p[i], n = p[i + 1]; H(0.62, 0.02, Math.hypot(n[0] - q[0], n[2] - q[2]) + 0.05, i % 2 ? 0x2a7ac0 : 0xe8702a, (q[0] + n[0]) / 2, (q[1] + n[1]) / 2 - 0.05, (q[2] + n[2]) / 2, { ry: Math.atan2(n[0] - q[0], n[2] - q[2]), rx: -Math.atan2(n[1] - q[1], Math.hypot(n[0] - q[0], n[2] - q[2])) }); }
  k.can(10.8, 12.4, 3.6, 5.0);
  // ao cá + lá sen
  for (const [w, d, x, z] of [[6.4, 0.2, -9, 3.9], [6.4, 0.2, -9, 10.1], [0.2, 6.4, -12.1, 7], [0.2, 6.4, -5.9, 7]]) H(w, 0.22, d, 0x8a8d92, x, 0, z); P(6, 6, 0x3a7a7a, -9, 0.1, 7, { nam: true }); for (let i = 0; i < 7; i++) { T(0.3, 0.3, 0.01, 0x4f8a3c, -10.5 + (i % 3) * 1.4, 0.11, 5.5 + Math.floor(i / 3) * 1.6, { seg: 10 }); if (i % 3 === 0) C(0.08, 0xf6b3c8, -10.4 + (i % 3) * 1.4, 0.22, 5.6 + Math.floor(i / 3) * 1.6); }
  k.can(-12.2, -5.8, 3.8, 10.2);
  // giếng, lu nước, chuồng gà, đống rơm, xe đạp, luống rau
  T(0.6, 0.6, 0.75, 0x9a968e, -4.6, 0, 3.4, { can: true, seg: 12 }); T(0.48, 0.48, 0.76, 0x223a3a, -4.6, 0.0, 3.4, { seg: 12 }); for (const dx of [-0.55, 0.55]) H(0.08, 1.6, 0.08, 0x6b4a2f, -4.6 + dx, 0, 3.4); H(1.2, 0.08, 0.08, 0x6b4a2f, -4.6, 1.55, 3.4);
  for (const [x, z] of [[-7.5, -4.4], [-8.2, -4.0], [-7.6, -3.6]]) { T(0.3, 0.26, 0.75, 0x6b3a2a, x, 0, z, { seg: 10 }); C(0.32, 0x5a2f22, x, 0.62, z, { sy: 0.35 }); } k.can(-8.6, -7.1, -4.8, -3.2);
  H(1.8, 1.0, 1.2, 0xb89a5a, 10.5, 0, -6.5, { can: true }); for (let i = 0; i < 7; i++) H(0.03, 1.0, 0.03, 0x6b4a2f, 9.65 + i * 0.28, 0, -5.88); H(2.0, 0.08, 1.4, 0xa8503a, 10.5, 1.0, -6.5, { rx: 0.1 });
  for (const [x, z, m] of [[9.2, -4.8, 0xf2f2f2], [8.8, -4.2, 0xb8553a], [11.2, -4.6, 0xe8c56a]]) { C(0.13, m, x, 0.22, z, { sy: 0.9 }); C(0.06, m, x + 0.1, 0.38, z); H(0.04, 0.04, 0.03, 0xc0262d, x + 0.12, 0.45, z); }
  C(1.0, 0xd9c48a, 12.6, 0.7, -2.2, { ct: 1, sy: 0.9 }); C(0.6, 0xe0cc92, 12.6, 1.5, -2.2, { ct: 1 }); k.can(11.7, 13.5, -3.1, -1.3);
  const xd = k.nhomCon(-6.0, -1.0, 0.6); for (const zz of [-0.5, 0.5]) { const r = new THREE.Mesh(new THREE.TorusGeometry(0.32, 0.025, 4, 14), vl(0x1c1c1f)); r.position.set(0, 0.34, zz); r.rotation.y = Math.PI / 2; xd.add(r); } H(0.04, 0.04, 1.0, 0x2a5aa8, 0, 0.55, 0, { cha: xd }); H(0.05, 0.5, 0.05, 0x2a5aa8, 0, 0.3, -0.25, { cha: xd }); H(0.2, 0.05, 0.12, 0x1c1c1f, 0, 0.82, -0.25, { cha: xd }); H(0.5, 0.03, 0.03, 0x8a8d92, 0, 0.9, 0.45, { cha: xd }); xd.can(0, 0, 0.3, 1.2);
  for (let r = 0; r < 4; r++) { H(4.0, 0.15, 0.6, 0x6b4a2f, -9.5, 0, -1.0 + r * 1.0); for (let i = 0; i < 9; i++) C(0.16, r % 2 ? 0x5f9a48 : 0x7fbf55, -11.3 + i * 0.45, 0.25, -1.0 + r * 1.0); } k.can(-11.5, -7.5, -1.4, 2.4);
  // chuối, dừa
  const chuoi = (x, z) => { T(0.12, 0.16, 2.2, 0x8a9a5a, x, 0, z, { can: true }); for (let i = 0; i < 6; i++) H(1.4, 0.02, 0.4, i % 2 ? 0x5f9a48 : 0x4f8a3c, x + Math.cos(i * 1.05) * 0.6, 2.2 + (i % 2) * 0.2, z + Math.sin(i * 1.05) * 0.6, { ry: -i * 1.05, rz: 0.45, hai: true }); };
  for (const [x, z] of [[-13.5, -6], [-12.5, -9.5], [13.4, 9.0], [-13.2, 12.0], [14, -9.5]]) chuoi(x, z);
  const dua = (x, z, h) => { for (let i = 0; i < 5; i++) T(0.17 - i * 0.015, 0.19 - i * 0.015, h / 5, 0x8a7a5a, x + i * 0.12, i * h / 5, z, { rz: -0.07 }); for (let i = 0; i < 7; i++) { const a = i * 0.9; H(2.4, 0.02, 0.35, 0x3d7a34, x + 0.6 + Math.cos(a) * 1.0, h + 0.05 - 0.3, z + Math.sin(a) * 1.0, { ry: -a, rz: -0.5, hai: true }); } k.canHop(x, z, 0.4, 0.4); };
  dua(-14, 2, 7.5); dua(14.2, 1.0, 8.2); dua(-3.0, 13.5, 6.8);
  // hàng rào tre + bờ tre cao bao quanh (che hết phía xa)
  for (const [x1, z1, x2, z2] of [[-16, -13, 16, -13], [-16, 15, -1.6, 15], [1.6, 15, 16, 15], [-16, -13, -16, 15], [16, -13, 16, 15]]) {
    const dai = Math.hypot(x2 - x1, z2 - z1), n = Math.round(dai / 0.18);
    for (let i = 0; i < n; i += 1) H(0.06, 1.1 + (i % 3) * 0.08, 0.06, i % 2 ? 0xc8b07a : 0xb89a5a, x1 + (x2 - x1) * i / n, 0, z1 + (z2 - z1) * i / n);
    k.can(Math.min(x1, x2) - 0.1, Math.max(x1, x2) + 0.1, Math.min(z1, z2) - 0.1, Math.max(z1, z2) + 0.1, true);
  }
  for (let i = 0; i < (k.dienThoai ? 40 : 70); i++) {
    const t = i / (k.dienThoai ? 40 : 70), goc = t * Math.PI * 2, rx = 21 + k.rnd() * 3, rz = 19 + k.rnd() * 3;
    const x = Math.cos(goc) * rx, z = 1 + Math.sin(goc) * rz, h = 9 + k.rnd() * 6;
    T(0.08, 0.1, h, 0x9aa04a, x, 0, z, { seg: 5 }); C(2.4 + k.rnd() * 1.5, k.chon([0x4f8a3c, 0x5f9a48, 0x3d7a34]), x, h - 1.5, z, { sy: 1.6 });
  }
  for (let i = 0; i < 28; i++) { const goc = i / 28 * Math.PI * 2, x = Math.cos(goc) * 31, z = 1 + Math.sin(goc) * 29; T(0.4, 0.6, 8, 0x5a3f2a, x, 0, z, { seg: 5 }); C(6 + k.rnd() * 2, k.chon([0x3d6a2e, 0x4a7a38, 0x355f28]), x, 10 + k.rnd() * 3, z, { ct: 1, sy: 1.1 }); }
  // cổng: trụ gạch + giàn hoa giấy, đường đất ra ngoài bị bờ tre chắn
  for (const x of [-1.8, 1.8]) H(0.5, 2.2, 0.5, 0xd9c8a0, x, 0, 15, { can: true });
  for (let i = 0; i <= 10; i++) { const a = Math.PI * i / 10; C(0.28, i % 2 ? 0xf26fa6 : 0xd94d8a, Math.cos(a) * 1.8, 2.2 + Math.sin(a) * 0.9, 15); C(0.2, 0x4f8a3c, Math.cos(a) * 1.8, 2.0 + Math.sin(a) * 0.9, 15.15); }
  k.san(-1.5, 15.2, 1.5, 24, { o: 1, mau: [0xb89a6a, 0xa88a5a], y: 0.002 }); k.can(-1.8, 1.8, 15.0, 15.4);
  void hien;
}

// =============================================================================================
// 10. SKY ẢO — căn hộ tầng cao: tường kính, phông cao ốc thành phố bên dưới, bếp đảo, sofa, hồ bơi vô cực
function dungSkyAo(k) {
  const { H, T, C, V, P } = k;
  const X1 = -8, X2 = 8, Z1 = -7, Z2 = 6, CAO = 3.3;
  k.phong(X1, Z1, X2, Z2, CAO, { mau: { tay: 0xefe9df, nam: 0xefe9df }, tran: 0xf8f6f2, bo: ["bac", "dong"], cua: { tay: [[3.2, 4.4]] } });
  H(1.2, 2.2, 0.06, 0x6b4a2f, X1 - 0.1, 0, 3.8, { ry: Math.PI / 2 }); k.can(X1 - 0.3, X1, 3.2, 4.4, true);
  // tường kính phía bắc và đông (khung mảnh), cửa trượt ra hồ bơi
  H(16.4, 0.1, 0.2, 0x2a2c31, 0, 0, Z1 - 0.1); H(16.4, 0.1, 0.2, 0x2a2c31, 0, CAO - 0.1, Z1 - 0.1); H(16.4, CAO, 0.04, k.kinh, 0, 0, Z1 - 0.1); k.can(X1 - 0.2, X2 + 0.2, Z1 - 0.25, Z1, true);
  for (let x = X1; x <= X2; x += 2) H(0.06, CAO, 0.1, 0x2a2c31, x, 0, Z1 - 0.1);
  for (const [a, b] of [[Z1, 0.9], [3.1, Z2]]) { H(0.04, CAO, b - a, k.kinh, X2 + 0.1, 0, (a + b) / 2); k.can(X2, X2 + 0.2, a, b, true); }
  for (let z = Z1; z <= Z2; z += 2.2) H(0.1, CAO, 0.06, 0x2a2c31, X2 + 0.1, 0, z); H(0.2, 0.1, 13, 0x2a2c31, X2 + 0.1, CAO - 0.1, -0.5);
  H(0.04, CAO, 2.2, k.kinh, X2 + 0.18, 0, 1.6 + 1.4); // cánh trượt mở
  H(16.8, 30, 13.8, 0xd9d2c4, 0, CAO + 0.15, -0.5); for (let y = CAO + 0.15; y < 30; y += 3.3) H(16.9, 0.25, 13.9, 0xc0b8aa, 0, y, -0.5); // các tầng phía trên
  H(26, 60, 14.2, 0xd9d2c4, 4.6, -60.4, -0.5); for (let y = -3.3; y > -60; y -= 3.3) H(26.1, 0.25, 14.3, 0xc0b8aa, 4.6, y, -0.5); // thân tòa nhà bên dưới
  // sàn đá cẩm thạch khổ lớn
  k.san(X1, Z1, X2, Z2, { o: 1.0, mau: [0xf2efe9, 0xe9e4dc], khe: 0.008, mauKhe: 0xc8c2b8, bien: 0.02 });
  // rèm hai đầu tường kính
  for (const x of [X1 + 0.3, X2 - 0.3]) for (let i = 0; i < 5; i++) H(0.12, CAO - 0.1, 0.14, 0xe6dccb, x + (i - 2) * 0.1, 0, Z1 + 0.1 + (i % 2) * 0.05);
  // đèn hắt trần
  for (const [w, d, x, z] of [[14, 0.06, 0, Z1 + 0.5], [14, 0.06, 0, Z2 - 0.5], [0.06, 11.6, X1 + 0.5, -0.5], [0.06, 11.6, X2 - 0.5, -0.5]]) H(w, 0.04, d, 0xfff3d8, x, CAO - 0.05, z, { sang: true });
  // bếp: tủ dưới, tủ trên, tủ lạnh, đảo bếp + 3 ghế quầy, đèn thả
  H(6.2, 0.9, 0.62, 0xf6f4ef, -4.8, 0, Z2 - 0.31, { can: true }); H(6.3, 0.05, 0.66, 0x2a2c31, -4.8, 0.9, Z2 - 0.33); H(6.2, 0.75, 0.38, 0x8a6a4a, -4.8, 1.75, Z2 - 0.19); for (let x = -7.6; x < -1.8; x += 0.62) { H(0.015, 0.73, 0.01, 0x5a4a3a, x, 1.76, Z2 - 0.38); H(0.015, 0.8, 0.01, 0xc8c2b8, x, 0.05, Z2 - 0.62); }
  H(6.2, 0.6, 0.02, 0xd9d2c4, -4.8, 0.95, Z2 - 0.01); T(0.2, 0.2, 0.02, 0x2a2c31, -6.4, 0.95, Z2 - 0.32); T(0.2, 0.2, 0.02, 0x2a2c31, -5.9, 0.95, Z2 - 0.32); H(0.6, 0.02, 0.4, 0xc0c4ca, -3.6, 0.93, Z2 - 0.33); T(0.02, 0.02, 0.35, 0xc0c4ca, -3.6, 0.95, Z2 - 0.5);
  H(0.9, 2.2, 0.7, 0xc0c4ca, -1.2, 0, Z2 - 0.35, { can: true }); H(0.02, 1.2, 0.02, 0x8a8d92, -0.8, 0.8, Z2 - 0.71);
  H(3.0, 0.92, 0.95, 0xf6f4ef, -4.1, 0, 3.05, { can: true }); H(3.1, 0.06, 1.05, 0x2a2c31, -4.1, 0.92, 3.05);
  T(0.18, 0.12, 0.06, 0xf2f2f2, -4.6, 0.98, 3.1, { seg: 12 }); for (let i = 0; i < 4; i++) C(0.06, [0xffcf3a, 0xc0262d, 0x7fbf55, 0xe8702a][i], -4.65 + (i % 2) * 0.1, 1.05, 3.05 + Math.floor(i / 2) * 0.08);
  for (const x of [-5.1, -4.1, -3.1]) { T(0.17, 0.17, 0.05, 0x2a2c31, x, 0.72, 2.25, { seg: 10 }); T(0.025, 0.025, 0.72, 0xc0c4ca, x, 0, 2.25); T(0.15, 0.15, 0.02, 0xc0c4ca, x, 0.25, 2.25, { seg: 10 }); }
  for (const x of [-5.1, -4.1, -3.1]) k.denTha(x, 3.05, CAO, 1.1, 0xc8a060, { r: 0.15 });
  // bàn ăn 6 ghế cạnh kính
  k.ban(-4.4, -4.4, 2.2, 1.0, 0.76, 0x6b4a2f, 0x2a2c31);
  for (const x of [-5.1, -4.4, -3.7]) { k.ghe(x, -5.15, 0, 0xe6dccb, { can: false }); k.ghe(x, -3.65, Math.PI, 0xe6dccb, { can: false }); }
  k.can(-5.6, -3.2, -5.45, -3.35);
  T(0.1, 0.08, 0.3, 0xf2f2f2, -4.4, 0.76, -4.4, { seg: 8 }); C(0.12, 0xf6b3c8, -4.4, 1.12, -4.4);
  k.denTha(-4.4, -4.4, CAO, 1.3, 0x2a2c31, { r: 0.3 });
  // phòng khách: sofa chữ L xám, bàn trà đá, thảm, kệ TV + TV lớn, ghế bành
  P(5.2, 3.6, 0xd9d0c0, 3.1, 0.01, 1.0, { nam: true });
  k.sofa(3.1, -0.4, 3.6, 0, 0x8a8d92, { sau: 0.95 }); k.sofa(0.85, 0.9, 1.6, Math.PI / 2, 0x8a8d92, { sau: 0.95 });
  H(1.4, 0.38, 0.8, 0xf2efe9, 3.1, 0, 1.15, { can: true }); H(0.3, 0.03, 0.22, 0xf26fa6, 2.8, 0.38, 1.1, { ry: 0.3 }); C(0.1, 0x7fbf55, 3.5, 0.48, 1.2);
  k.ghe(7.0, 1.6, -Math.PI / 2, 0xc8a060, { cao: 0.44, lung: 0.55 });
  H(3.6, 0.45, 0.45, 0x6b4a2f, 3.1, 0, Z2 - 0.23, { can: true });
  H(5.0, CAO, 0.08, 0xc8b8a0, 3.1, 0, Z2 - 0.04);
  const tv = k.vung(512, 288, (g, w, h) => { const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#0b1e3a"); gr.addColorStop(1, "#3a6a8a"); g.fillStyle = gr; g.fillRect(0, 0, w, h); g.fillStyle = "rgba(255,255,255,.12)"; g.beginPath(); g.arc(w * 0.7, h * 0.4, 70, 0, 7); g.fill(); chu(g, "SKY ẢO HOME", w / 2, h * 0.5, 40, "#ffffff", { toiDa: w * 0.8 }); });
  H(2.4, 1.38, 0.05, 0x111111, 3.1, 1.15, Z2 - 0.1); V(tv, 2.3, 1.3, 3.1, 1.84, Z2 - 0.14, { sang: true });
  // đàn piano cạnh kính
  const pi = k.nhomCon(4.8, -4.8, 0.5); H(1.5, 0.3, 1.9, 0x111114, 0, 0.7, 0, { cha: pi }); H(1.5, 0.05, 0.3, 0xf6f6f2, 0, 0.92, 1.0, { cha: pi }); for (const [a, b] of [[-0.6, 0.8], [0.6, 0.8], [0, -0.8]]) H(0.1, 0.7, 0.1, 0x111114, a, 0, b, { cha: pi }); H(1.4, 0.05, 1.7, 0x111114, 0, 1.4, -0.2, { cha: pi, rx: -0.5 }); H(0.7, 0.45, 0.35, 0x111114, 0, 0, 1.55, { cha: pi }); pi.can(0, 0.2, 1.5, 2.4);
  // cây, kệ sách, tranh
  k.cay(-0.5, -6.3, 1.7, { kieu: "la_to", chau: 0xf2f2f2 }); k.cay(7.3, -6.2, 1.5, { chau: 0x2a2c31 }); k.cay(0.6, 5.4, 1.3, { kieu: "la_to", chau: 0xf2f2f2 });
  H(0.35, 2.4, 2.6, 0x6b4a2f, X1 + 0.18, 0, -1.2, { can: true }); for (const y of [0.5, 1.05, 1.6, 2.15]) for (let i = 0; i < 7; i++) H(0.24, 0.3, 0.07, k.chon([0x7a1424, 0xf2e6c8, 0x2a3f6a, 0x1c1c1f, 0xc8a060]), X1 + 0.2, y, -2.3 + i * 0.33);
  const tranh = k.vung(300, 200, (g, w, h) => { g.fillStyle = "#f2efe9"; g.fillRect(0, 0, w, h); g.fillStyle = "#d94d4d"; g.beginPath(); g.arc(w * 0.35, h * 0.5, 50, 0, 7); g.fill(); g.fillStyle = "#2a3f6a"; g.fillRect(w * 0.5, h * 0.2, 90, 120); g.fillStyle = "#e8c56a"; g.fillRect(w * 0.2, h * 0.75, 180, 14); g.strokeStyle = "#1c1c1f"; g.lineWidth = 8; g.strokeRect(4, 4, w - 8, h - 8); });
  V(tranh, 1.8, 1.2, X1 + 0.02, 1.8, 1.6, { ry: Math.PI / 2 });
  // ---- Hồ bơi vô cực trên ban công (không mái)
  const trongHo = (x, z) => x > 10.2 && x < 16.2 && z > -5.4 && z < 0.6;
  k.san(X2 + 0.2, Z1, 17.2, Z2, { o: 0.15, oz: 0.5, mau: (i, j, x, z) => trongHo(x, z) ? null : [0xb88a5a, 0xa87a4a, 0xc0905e][(i + j * 2) % 3], y: 0.004 });
  H(6, 1.2, 6, 0x6cc4dc, 13.2, -1.3, -2.4); for (const [w, d, x, z] of [[6.3, 0.15, 13.2, -5.475], [6.3, 0.15, 13.2, 0.675], [0.15, 6.3, 10.125, -2.4], [0.15, 6.3, 16.275, -2.4]]) H(w, 0.05, d, 0xf2f2f2, x, 0, z);
  const nuoc = new THREE.Mesh(new THREE.PlaneGeometry(6, 6, 10, 10), new THREE.MeshLambertMaterial({ color: 0x3fb6d8, emissive: 0x0a3a4a, transparent: true, opacity: 0.88, flatShading: true }));
  nuoc.rotation.x = -Math.PI / 2; nuoc.position.set(13.2, -0.06, -2.4); k.dong(nuoc);
  k.can(10.2, 16.4, -5.4, 0.6);
  for (let i = 0; i < 2; i++) { const g = k.nhomCon(11.2 + i * 2.4, 3.8, Math.PI); H(0.7, 0.3, 1.9, 0xf2f2f2, 0, 0, 0, { cha: g }); H(0.68, 0.08, 1.2, 0xf6f6f2, 0, 0.3, 0.3, { cha: g }); H(0.68, 0.08, 0.7, 0xf6f6f2, 0, 0.42, -0.6, { cha: g, rx: -0.5 }); H(0.66, 0.06, 0.4, 0x3fb6d8, 0, 0.6, -0.75, { cha: g, rx: -0.5 }); g.can(0, 0, 0.7, 1.9); }
  T(0.04, 0.04, 2.2, 0xc0c4ca, 12.4, 0, 5.0); const du = new THREE.Mesh(nonSoc(1.3, 0.45, 8, 0xf6f6f2, 0x2a3f6a), VL_DINH_2); du.position.set(12.4, 2.3, 5.0); k.nhom.add(du);
  for (const [x, z] of [[9.0, 5.4], [16.4, 5.4], [16.4, -6.4]]) k.cay(x, z, 1.4, { chau: 0x2a2c31 });
  // lan can kính quanh ban công
  H(0.04, 1.1, 13.2, k.kinh, 17.2, 0, -0.5); H(0.06, 0.05, 13.2, 0xc0c4ca, 17.2, 1.1, -0.5); k.can(17.0, 17.6, Z1 - 0.3, Z2 + 0.3, true);
  for (const z of [Z1 - 0.15, Z2 + 0.15]) { H(9.0, 1.1, 0.04, k.kinh, 12.6, 0, z); H(9.0, 0.05, 0.06, 0xc0c4ca, 12.6, 1.1, z); k.can(X2, 17.4, z - 0.15, z + 0.15, true); }

  // ---- Phông thành phố: khối cao ốc bên dưới (một vật liệu, ô cửa lặp)
  const cv = document.createElement("canvas"); cv.width = cv.height = 64; const g = cv.getContext("2d"); g.fillStyle = "#6b7a88"; g.fillRect(0, 0, 64, 64);
  for (let i = 0; i < 4; i++) for (let j = 0; j < 4; j++) { g.fillStyle = (i * 5 + j * 3) % 7 === 0 ? "#ffe2a0" : "#2c3a48"; g.fillRect(i * 16 + 2, j * 16 + 3, 12, 10); }
  const cvE = document.createElement("canvas"); cvE.width = cvE.height = 64; const ge = cvE.getContext("2d"); ge.fillStyle = "#000"; ge.fillRect(0, 0, 64, 64);
  for (let i = 0; i < 4; i++) for (let j = 0; j < 4; j++) if ((i * 5 + j * 3) % 7 === 0) { ge.fillStyle = "#ffd890"; ge.fillRect(i * 16 + 2, j * 16 + 3, 12, 10); }
  const tCO = new THREE.CanvasTexture(cv), tCE = new THREE.CanvasTexture(cvE); for (const t of [tCO, tCE]) { t.wrapS = t.wrapT = THREE.RepeatWrapping; t.colorSpace = THREE.SRGBColorSpace; t.magFilter = THREE.NearestFilter; }
  const vlCO = new THREE.MeshLambertMaterial({ map: tCO, emissiveMap: tCE, emissive: 0xffffff, emissiveIntensity: 0.35 });
  const n = k.dienThoai ? 60 : 110, SAN = -120;
  for (let i = 0; i < n; i++) {
    const goc = (i / n) * Math.PI * 2 + (k.rnd() - 0.5) * 0.05;
    const r = 50 + k.rnd() * 130, x = 3 + Math.cos(goc) * r, z = -0.5 + Math.sin(goc) * r;
    const w = 8 + k.rnd() * 14, d = 8 + k.rnd() * 14, top = 1.7 - r * Math.tan(0.015 + k.rnd() * 0.2) + (k.rnd() < 0.15 ? 12 + k.rnd() * 25 : 0), h = top - SAN;
    const geo = new THREE.BoxGeometry(w, h, d); const uv = geo.attributes.uv;
    for (let f = 0; f < 6; f++) { const su = f < 2 ? d : w, sv = f === 2 || f === 3 ? d : h; for (let q = 0; q < 4; q++) { const id = f * 4 + q; uv.setXY(id, uv.getX(id) * su / 5, uv.getY(id) * sv / 4.5); } }
    const m = new THREE.Mesh(geo, vlCO); m.position.set(x, SAN + h / 2, z); m.rotation.y = k.rnd() * 0.5; k.nhom.add(m);
    if (k.rnd() < 0.25) H(w * 0.7, 0.6, d * 0.7, 0x3a3d44, x, top, z);
  }
  P(900, 900, 0x4a5a4a, 0, SAN, 0, { nam: true });
  const song = new THREE.Mesh(new THREE.PlaneGeometry(40, 600), vl(0x5f7f95)); song.rotation.set(-Math.PI / 2, 0, 0.7); song.position.set(60, SAN + 0.2, -120); k.nhom.add(song);
  // mặt nước hồ bơi gợn nhẹ
  const pos = nuoc.geometry.attributes.position, y0 = Float32Array.from({ length: pos.count }, (_, i) => pos.getZ(i));
  k.moi((dt, t) => { for (let i = 0; i < pos.count; i++) pos.setZ(i, y0[i] + Math.sin(t * 1.8 + pos.getX(i) * 2.1 + pos.getY(i) * 1.3) * 0.025); pos.needsUpdate = true; });
}

// =============================================================================================
// 11. BÃI BIỂN VŨNG TÀU — cát, biển gợn sóng, dừa, dù, ghế bố, chòi cứu hộ, quán hải sản, khách sạn BIỂN XANH
function dungVungTau(k) {
  const { H, T, C, V, P } = k;
  // cát (lưới màu), dốc cát xuống dưới nước, vệt cát ướt
  k.san(-24, -4, 24, 10, { o: 0.8, mau: (i, j, x, z) => z < -2.4 ? 0xc8b48a : [0xe8d6a8, 0xe2cfa0, 0xecdcb0][Math.floor(k.rnd() * 3)], bien: 0.03, y: 0.01 });
  const doc = new THREE.Mesh(new THREE.PlaneGeometry(48, 14), vl(0xb8a47a)); doc.rotation.x = -Math.PI / 2 - 0.09; doc.position.set(0, -0.62, -10.9); k.nhom.add(doc);
  // biển: lưới gợn sóng (cập nhật mỗi khung khi đứng gần) + dải bọt
  const segX = k.dienThoai ? 40 : 64, segZ = k.dienThoai ? 24 : 40;
  const bien = new THREE.Mesh(new THREE.PlaneGeometry(300, 240, segX, segZ), new THREE.MeshLambertMaterial({ color: 0x2c8fb2, emissive: 0x06283a, flatShading: true }));
  bien.rotation.x = -Math.PI / 2; bien.position.set(0, -0.04, -123.6); k.dong(bien);
  const pos = bien.geometry.attributes.position, goc = Float32Array.from(pos.array);
  const bot = new THREE.Mesh(new THREE.PlaneGeometry(48, 1.4), new THREE.MeshBasicMaterial({ color: 0xffffff, transparent: true, opacity: 0.5, depthWrite: false, fog: true }));
  bot.rotation.x = -Math.PI / 2; bot.position.set(0, 0.03, -4.1); k.dong(bot);
  k.can(-24, 24, -9, -4.7);
  // mũi đá + đồi hai bên (che hết phía xa)
  for (const s of [-1, 1]) {
    for (let i = 0; i < 9; i++) { const z = 16 - i * 6.5, r = 7 + k.rnd() * 5 + (i < 5 ? 3 : 0); C(r, k.chon([0x4f7a3c, 0x5a8a44, 0x3d6a34]), s * (24 + r * 0.5), r * 0.55, z, { ct: 1, sy: 0.9 }); }
    for (let i = 0; i < 10; i++) C(1 + k.rnd() * 2.2, k.chon([0x8a8478, 0x6d6a64, 0x9a958a]), s * (20 + k.rnd() * 3), 0.3, -4 - i * 3.2, { ct: 0 });
    k.can(s > 0 ? 19.5 : -40, s > 0 ? 40 : -19.5, -9, 16, true);
  }
  C(22, 0x4a7a3a, -48, 6, -70, { ct: 1, sy: 0.7 }); C(16, 0x5a8a44, 46, 3, -80, { ct: 1, sy: 0.6 });
  // tượng đài trên núi nhỏ phía xa (mô phỏng chung chung, không phải công trình thật)
  T(0.6, 1.0, 9, 0xf2f2f2, -44, 14, -66); C(1.2, 0xf2f2f2, -44, 24, -66);
  // tàu cá, thúng chai
  const tau = k.nhomCon(-14, -46, 0.4); H(2.0, 1.0, 7, 0x2a5aa8, 0, -0.3, 0, { cha: tau }); H(2.1, 0.2, 7.1, 0xc0262d, 0, 0.6, 0, { cha: tau }); H(1.4, 1.3, 2.2, 0xf2f2f2, 0, 0.8, -1.2, { cha: tau }); H(0.1, 3.5, 0.1, 0x6b4a2f, 0, 0.8, 1.5, { cha: tau });
  k.dong(tau);
  for (const [x, z] of [[-9, -2.6], [-7.6, -3.2], [12.5, -2.8]]) { const m = new THREE.Mesh(new THREE.SphereGeometry(0.9, 10, 5, 0, Math.PI * 2, Math.PI / 2, Math.PI / 2), vl(0x6b5a3a, { side: THREE.DoubleSide })); m.position.set(x, 0.55, z); k.nhom.add(m); k.can(x - 0.9, x + 0.9, z - 0.9, z + 0.9); }
  // dù sọc + ghế bố + bàn nhỏ (dừa tươi)
  const MAU_DU = [[0xc0262d, 0xf6f6f2], [0x2a5aa8, 0xf6f6f2], [0xffcf3a, 0xe8702a], [0x2e8b57, 0xf6f6f2], [0xf26fa6, 0xf6f6f2]];
  const dongGhe = [[-10, 0], [-6.5, 0], [-2.6, -0.2], [3.2, 0], [7.2, 0], [10.8, 0.2], [-8.4, 4.4], [-4.6, 4.4], [5.0, 4.2], [9.0, 4.4]];
  dongGhe.forEach(([x, z], i) => {
    const [c1, c2] = MAU_DU[i % MAU_DU.length];
    T(0.035, 0.035, 2.4, 0xd9d4c8, x, 0, z); const du = new THREE.Mesh(nonSoc(1.45, 0.55, 10, c1, c2), VL_DINH_2); du.position.set(x, 2.35, z); k.nhom.add(du);
    for (const dx of [-0.65, 0.65]) {
      const g = k.nhomCon(x + dx, z - 0.6, Math.PI); H(0.62, 0.05, 1.7, 0x2a5aa8, 0, 0.3, 0.1, { cha: g }); H(0.6, 0.05, 0.7, 0x2a5aa8, 0, 0.42, -0.85, { cha: g, rx: -0.6 });
      for (const [a, b] of [[-0.28, 0.8], [0.28, 0.8], [-0.28, -0.6], [0.28, -0.6]]) H(0.04, 0.3, 0.04, 0xd9d4c8, a, 0, b, { cha: g });
      g.can(0, 0, 0.66, 1.8);
    }
    T(0.2, 0.2, 0.03, 0xf2f2f2, x, 0.5, z - 0.3, { seg: 10 }); T(0.03, 0.03, 0.5, 0xf2f2f2, x, 0, z - 0.3); C(0.1, 0x7fbf55, x + 0.05, 0.6, z - 0.3);
    if (i % 3 === 0) P(0.8, 1.6, k.chon([0xf26fa6, 0x7fd3ff, 0xffcf3a]), x + 1.6, 0.02, z + 0.6, { nam: true });
  });
  // chòi cứu hộ
  const ch = k.nhomCon(14.5, 2.0, -0.3); for (const [a, b] of [[-0.8, -0.8], [0.8, -0.8], [-0.8, 0.8], [0.8, 0.8]]) H(0.12, 2.4, 0.12, 0xf2f2f2, a, 0, b, { cha: ch }); H(2.0, 0.12, 2.0, 0xf2f2f2, 0, 2.4, 0, { cha: ch }); H(2.0, 0.8, 0.06, 0xc0262d, 0, 2.5, 1.0, { cha: ch }); H(2.2, 0.1, 2.2, 0xc0262d, 0, 3.8, 0, { cha: ch }); for (const [a, b] of [[-1, -1], [1, -1], [-1, 1], [1, 1]]) H(0.06, 1.3, 0.06, 0xf2f2f2, a, 2.5, b, { cha: ch }); for (let i = 0; i < 6; i++) H(0.8, 0.05, 0.12, 0xf2f2f2, 0, 0.3 + i * 0.4, 1.1 + i * 0.12, { cha: ch }); ch.can(0, 0, 1.9, 1.9);
  const cuuHo = k.vung(256, 64, veBien("#c0262d", [["CỨU HỘ", 0.6, 0.52, "#ffffff"]])); V(cuuHo, 1.6, 0.4, 0, 2.9, 1.04, { cha: ch });
  T(0.03, 0.03, 3.2, 0xd9d4c8, 13.0, 0, -3.0); H(0.7, 0.45, 0.02, 0xc0262d, 13.37, 2.7, -3.0, { hai: true });
  // lưới bóng chuyền, lâu đài cát
  for (const x of [-15.5, -11]) T(0.05, 0.05, 2.4, 0xf2f2f2, x, 0, 7.2, { can: true }); H(4.5, 0.8, 0.02, 0xf2f2f2, -13.25, 1.6, 7.2, { hai: true });
  C(0.5, 0xd9c08a, 1.2, 0.2, -2.6, { ct: 1, sy: 0.6 }); for (let i = 0; i < 4; i++) T(0.14, 0.18, 0.4, 0xd9c08a, 1.2 + Math.cos(i * 1.57) * 0.45, 0, -2.6 + Math.sin(i * 1.57) * 0.45, { seg: 6 });
  // bếp lửa trại (lửa chỉ đốt khi cảnh lửa trại)
  for (let i = 0; i < 8; i++) C(0.18, 0x6d6a64, 6.2 + Math.cos(i * 0.785) * 0.7, 0.08, -2.6 + Math.sin(i * 0.785) * 0.7, { sy: 0.6 });
  for (let i = 0; i < 4; i++) T(0.06, 0.07, 1.0, 0x5a3a24, 6.2, 0.12, -2.6, { rz: Math.PI / 2, ry: i * 0.8 });
  k.can(5.5, 6.9, -3.3, -1.9);
  for (const [x, z, r] of [[5.0, -1.6, 0.6], [7.4, -1.7, -0.6]]) T(0.18, 0.18, 1.5, 0x8a5a3a, x, 0.18, z, { rz: Math.PI / 2, ry: r });
  const lua = new THREE.Group(); lua.position.set(6.2, 0.15, -2.6); k.dong(lua); lua.visible = false;
  const vlLua = [0xffcf3a, 0xff7a1a, 0xff3a1a].map(c => new THREE.MeshBasicMaterial({ color: c, transparent: true, opacity: 0.85, depthWrite: false, blending: THREE.AdditiveBlending }));
  const ngon = [];
  for (let i = 0; i < 7; i++) { const m = new THREE.Mesh(new THREE.ConeGeometry(0.16 + (i % 3) * 0.05, 0.7 + (i % 3) * 0.25, 6), vlLua[i % 3]); m.position.set(Math.cos(i * 0.9) * 0.18 * (i % 2), 0.4, Math.sin(i * 0.9) * 0.18 * (i % 2)); lua.add(m); ngon.push(m); }
  const anhLua = new THREE.Mesh(new THREE.PlaneGeometry(5, 5), new THREE.MeshBasicMaterial({ map: texTron(), color: 0xff8a3a, transparent: true, opacity: 0.35, depthWrite: false, blending: THREE.AdditiveBlending })); anhLua.rotation.x = -Math.PI / 2; anhLua.position.y = -0.12; lua.add(anhLua);
  // bờ kè + đường đi dạo, hàng dừa, đèn, quầy hải sản
  H(48, 0.55, 0.4, 0xb8b0a0, 0, 0, 10.2, { can: true, tuong: true });
  k.san(-24, 10.4, 24, 15, { o: 0.6, mau: [0xc9c3b6, 0xb9b2a4, 0xd2ccbe], khe: 0.02, mauKhe: 0x8a8478, y: 0.0 });
  const dua = (x, z, h, ng = 0.12) => {
    for (let i = 0; i < 6; i++) T(0.2 - i * 0.015, 0.22 - i * 0.015, h / 6, 0x8a7a5a, x + i * i * ng * 0.05, i * h / 6, z, { rz: -ng * i * 0.3 });
    const tx = x + 25 * ng * 0.05, ty = h;
    for (let i = 0; i < 8; i++) { const a = i * 0.785; H(2.6, 0.02, 0.38, i % 2 ? 0x3d7a34 : 0x4f8a3c, tx + Math.cos(a) * 1.1, ty - 0.35, z + Math.sin(a) * 1.1, { ry: -a, rz: -0.55, hai: true }); }
    for (let i = 0; i < 3; i++) C(0.16, 0x6b8a3a, tx + Math.cos(i * 2.1) * 0.25, ty - 0.2, z + Math.sin(i * 2.1) * 0.25);
    k.canHop(x, z, 0.45, 0.45);
  };
  for (const x of [-18, -12, -1.5, 5.5, 12.5, 18]) dua(x, 11.2, 6.5 + k.rnd() * 2, 0.08 + k.rnd() * 0.12);
  dua(-16.5, 3.0, 7.2, 0.25); dua(16.8, 5.4, 6.8, -0.2);
  for (const x of [-9, 9]) { T(0.07, 0.09, 4.2, 0x2a2c31, x, 0, 13.6, { can: true }); C(0.22, 0xfff3d0, x, 4.3, 13.6, { sang: true, ct: 1 }); }
  // lều hải sản
  const leu = (x, ten) => {
    for (const [a, b] of [[-1.5, -1], [1.5, -1], [-1.5, 1], [1.5, 1]]) H(0.06, 2.5, 0.06, 0xd9d4c8, x + a, 0, 13.3 + b);
    const m = new THREE.Mesh(new THREE.ConeGeometry(2.4, 0.9, 4, 1), vl(0xf6f6f2)); m.rotation.y = Math.PI / 4; m.position.set(x, 2.95, 13.3); k.nhom.add(m);
    H(2.8, 0.9, 0.7, 0x2a5aa8, x, 0, 12.7, { can: true }); for (let i = 0; i < 6; i++) { H(0.4, 0.08, 0.5, 0xc0c4ca, x - 1.1 + i * 0.44, 0.9, 12.7); C(0.08, [0xe8702a, 0xc0262d, 0x8a6a4a, 0xd9a07a, 0x5a4a3a, 0xf2c4a0][i], x - 1.1 + i * 0.44, 1.0, 12.7); }
    const b = k.vung(400, 90, veBien("#c0262d", [[ten, 0.46, 0.4, "#ffe14d"], ["TƯƠI SỐNG · NƯỚNG TẠI CHỖ", 0.2, 0.8, "#ffffff", 700]])); V(b, 2.8, 0.62, x, 2.2, 12.28, { ry: Math.PI }); H(2.9, 0.7, 0.04, 0xd9d4c8, x, 1.89, 12.31);
  };
  leu(-14, "HẢI SẢN BÀ TƯ"); leu(-6, "ỐC NƯỚNG MỠ HÀNH"); leu(14, "CUA GHẸ VŨNG TÀU");
  // khách sạn BIỂN XANH: mặt tiền cao, ban công kính, sảnh, biển hiệu sáng
  const KS = 0xf2f6f8;
  H(44, 26, 14, KS, 0, 0, 23.5, { can: true, tuong: true });
  for (let t = 1; t < 8; t++) for (let i = 0; i < 10; i++) {
    const x = -18 + i * 4, y = t * 3.1; if (Math.abs(x) < 4 && t < 2) continue;
    P(3.0, 2.2, (t * 3 + i) % 5 === 0 ? 0xffe2a0 : 0x3a5a72, x, y + 1.3, 16.49, { ry: Math.PI, sang: (t * 3 + i) % 5 === 0 });
    H(3.4, 0.12, 1.0, 0xe2e8ec, x, y, 16.0); H(3.4, 0.9, 0.04, k.kinh, x, y + 0.12, 15.5); H(3.4, 0.05, 0.06, 0xc0c4ca, x, y + 1.02, 15.5);
  }
  H(10, 3.0, 0.1, k.kinh, 0, 0, 16.4); for (let x = -5; x <= 5; x += 2) H(0.1, 3.0, 0.14, 0x2a2c31, x, 0, 16.4);
  P(9.8, 2.9, 0xffe8c0, 0, 1.45, 16.48, { ry: Math.PI, sang: true });
  H(12, 0.3, 4, 0x2a6a8a, 0, 3.0, 15.0); for (const x of [-5.6, 5.6]) T(0.12, 0.12, 3.0, 0xf2f2f2, x, 0, 13.4, { can: true });
  for (const x of [-16, -13, -10, -7, 7, 10, 13, 16]) H(2.4, 0.6, 0.5, 0x4f8a3c, x, 0, 16.1);
  const ks = k.vung(1024, 220, (g, w, h) => { g.clearRect(0, 0, w, h); chu(g, "KHÁCH SẠN BIỂN XANH", w / 2, h * 0.42, 104, "#7fd3ff", { toiDa: w * 0.96, bong: 18, mauBong: "#2a8aff" }); chu(g, "★ ★ ★  ·  VIEW BIỂN TRỌN VẸN", w / 2, h * 0.82, 36, "#ffffff", { dam: 700, toiDa: w * 0.8 }); });
  V(ks, 22, 4.7, 0, 24.2, 16.1, { ry: Math.PI, sang: true });
  H(23, 5, 0.3, 0x1c2a3a, 0, 21.7, 16.3);
  const sanh = k.vung(400, 80, veBien("#2a6a8a", [["SẢNH LỄ TÂN · RECEPTION", 0.42, 0.52, "#ffffff"]])); V(sanh, 5, 0.3, 0, 3.15, 12.98, { ry: Math.PI });
  // dãy nhà thấp hai bên khách sạn che kín phía sau
  for (const s of [-1, 1]) H(4, 18, 30, 0xe9dcc0, s * 23, 0, 25);
  k.can(-24, 24, 15, 16.4);
  // sóng
  k.moi((dt, t) => {
    const a = pos.array;
    for (let i = 0; i < pos.count; i++) {
      const x = goc[i * 3], y = goc[i * 3 + 1]; // y cục bộ: −120 là mép bờ
      const bien0 = Math.min(1, 0.25 + (y + 120) / 60);
      a[i * 3 + 2] = (Math.sin(t * 1.4 + y * 0.35 + x * 0.05) * 0.13 + Math.sin(t * 0.9 - x * 0.21 + y * 0.12) * 0.09) * bien0;
    }
    pos.needsUpdate = true;
    const s = Math.sin(t * 0.9); bot.position.z = -4.35 + s * 0.35; bot.material.opacity = 0.32 + 0.22 * Math.max(0, s);
    tau.position.y = Math.sin(t * 1.1) * 0.12; tau.rotation.z = Math.sin(t * 0.8) * 0.04;
    if (lua.visible) ngon.forEach((m, i) => { const f = 0.75 + Math.abs(Math.sin(t * (7 + i) + i)) * 0.45; m.scale.set(1, f, 1); m.position.y = 0.3 + f * 0.15; });
  });
  return { datLua: on => { lua.visible = on; } };
}

// =============================================================================================
// Dựng toàn bộ. Đẩy khối va chạm vào vat[0] (cùng dạng the-gioi.js). Trả về { capNhat, huy, chuanBi, ds }.
export function dungNgoaiCanh(scene, vat, { dienThoai = false } = {}) {
  const goc = new THREE.Group(); goc.name = "ngoai-canh"; scene.add(goc);
  const ds = [];
  let tiem = null, vungTau = null;
  const dung = (id, fn) => {
    const k = taoBo(id, vat[0], dienThoai);
    const ra = fn(k);
    const kq = k.xong(); goc.add(kq.nhom); ds.push(kq);
    return ra;
  };
  dung("quan_oc", dungQuanOc);
  dung("dai_tivi", dungDaiTivi);
  dung("karaoke", dungKaraoke);
  dung("ca_phe", dungCaPhe);
  tiem = dung("tiem", k => dungTiem(k, bienTiemCuaNoi("phong_kham_khoe_re")));
  dung("phong_tro", dungPhongTro);
  dung("ll_tower", dungLL);
  dung("xe_khach", dungXeKhach);
  dung("nha_vuon", dungNhaVuon);
  dung("sky_ao", dungSkyAo);
  vungTau = dung("vung_tau", dungVungTau);
  for (const d of ds) d.nhom.visible = false;
  const BAN_KINH_HIEN = { vung_tau: 140, sky_ao: 180 };
  let dangO = null;
  return {
    ds,
    // gọi mỗi khung hình: chỉ hiện + chạy hoạt cảnh địa điểm người chơi đang ở gần
    capNhat(dt, t, p) {
      dangO = null;
      for (const d of ds) {
        const r = BAN_KINH_HIEN[d.id] ?? 70;
        const gan = !!p && Math.abs(p.x - d.tam.x) < r && Math.abs(p.z - d.tam.z) < r;
        d.nhom.visible = gan;
        if (gan) { dangO = d.id; for (const f of d.capNhat) f(dt, t); }
      }
      return dangO;
    },
    // chuẩn bị địa điểm cho cảnh: bảng hiệu tiệm theo tag, lửa trại ở biển...
    chuanBi(noi, ten) {
      const id = diaDiemCuaNoi(noi);
      if (id === "tiem") tiem.datBien(bienTiemCuaNoi(noi, ten));
      if (id === "vung_tau") vungTau.datLua(/lua_trai/.test(String(noi)));
      return id ? NOI_NGOAI[id] : null;
    },
    dangO: () => dangO,
    huy() {
      const bo = new Set(ds.flatMap(d => d.canDs));
      vat[0].splice(0, vat[0].length, ...vat[0].filter(b => !bo.has(b)));
      const chung = new Set([VL_MAU_DINH, VL_NEN_TRONG, VL_NEN_TRONG_2, VL_DINH, VL_DINH_2, ...vbCache.values()]);
      goc.traverse(o => {
        if (o.geometry) o.geometry.dispose();
        const m = o.material; if (!m || Array.isArray(m) || chung.has(m) || m.vertexColors === false && !m.map && !m.transparent) return; // vật liệu vl() dùng chung với phố
        if (m.map && m.map !== _tron) m.map.dispose(); m.emissiveMap?.dispose(); m.dispose();
      });
      scene.remove(goc);
    },
  };
}
