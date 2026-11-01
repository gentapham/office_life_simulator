// Cử chỉ thêm cho nhân vật (người chơi, đồng nghiệp, người đi đường): vẫy tay, khoanh tay, cúi chào, nhún nhảy, ăn mừng,
// lau mồ hôi, run vì lạnh, xem đồng hồ, khóc, giận, ngạc nhiên, nhún vai, thở dài; các động tác dùng đồ vật (bấm nút,
// cúi nhặt, mở tủ, ăn, viết bảng, lục tủ, chắp tay vái, tưới cây, chơi bi lắc, đánh golf, gảy đàn, chụp ảnh, vuốt chó,
// đá cầu, tập thể dục...). nhan-vat-3d.js gọi CU_THEM[loai](A, c, p, t, e) trong mỗi khung hình của cử chỉ:
//   A: các khớp của nhân vật (xem taoNguoi), c: cử chỉ đang làm, p: tiến độ 0..1, t: thời gian, e: độ đậm (vào / ra mượt).
// Nghiêng người, ngồi xổm xoay cả nửa trên quanh hông; mọi thứ bị đổi ngoài phần hoatDong tự đặt lại thì được trả về
// đúng như cũ khi cử chỉ kết thúc (ketThucCuThem).
import * as THREE from "three";

const muot = x => x * x * (3 - 2 * x);
const kep = (x, a, b) => Math.max(a, Math.min(b, x));
const PI = Math.PI;
// đoạn [a, b] của tiến độ p -> 0..1 mượt
export const doan = (p, a, b) => muot(kep((p - a) / (b - a), 0, 1));
// lên rồi xuống trong đoạn [a, b]
const vom = (p, a, b) => { const x = kep((p - a) / (b - a), 0, 1); return Math.sin(x * PI); };
const lerp = (a, b, k) => a + (b - a) * k;

// thời lượng mặc định (giây)
export const THOI_CU_THEM = {
  vay: 2.2, ngon_cai: 1.8, khoanh_tay: 4, chong_nanh: 3.5, cui_chao: 2.2, nhun_nhay: 4.4, an_mung: 2.6,
  lau_mo_hoi: 2.2, run_ray: 3.2, nhin_dong_ho: 2.4, khoc: 3, gian: 2.4, ngac_nhien: 1.8, nhun_vai: 1.6, tho_dai: 2.2,
  bam_nut: 2, cui_lay: 2.2, mo_tu: 3, an: 3.2, viet_bang: 3.6, luc_tu: 3, chap_tay: 4.2, tuoi: 3.2, bi_lac: 4,
  golf: 3.6, guitar: 4.4, selfie: 3.2, doc_bang: 4, vuot: 2.6, da_cau: 4.4, rut_dien: 3, vut_rac: 1.4, nhan_do: 1.6,
  the_duc: 6, ngu_gat: 6, keo_tu: 2.4,
};
// cử chỉ làm được trong lúc đang đi (còn lại: bước đi là thôi)
export const CU_KHI_DI = new Set(["goi_dt", "xem_dt", "vay", "ngon_cai", "lau_mo_hoi", "run_ray", "nhin_dong_ho", "noi", "cuoi", "gat_dau", "lac_dau", "tho_dai", "nhun_vai"]);

const _q = new THREE.Quaternion(), _e = new THREE.Euler(), _qa = new THREE.Quaternion();
const TRUC_X = new THREE.Vector3(1, 0, 0);

// lưu tư thế gốc lúc bắt đầu cử chỉ (các giá trị hoatDong không tự đặt lại mỗi khung hình)
function goc(A, c) {
  if (!c.goc) c.goc = {
    thanRx: A.than.rotation.x, thanRy: A.than.rotation.y, thanRz: A.than.rotation.z, thanZ: A.than.position.z, dauZ: A.dau.position.z,
    tTZ: A.tayT.position.z, tPZ: A.tayP.position.z, chanY: A.chanT.position.y, chanPY: A.chanP.position.y,
    chanTz: A.chanT.rotation.z, chanPz: A.chanP.rotation.z, chanPy: A.chanP.rotation.y, vayY: A.vayDong ? A.vayDong.position.y : 0, ha: 0,
  };
  return c.goc;
}
function traGoc(A, c) {
  const g = c.goc; if (!g) return;
  A.than.rotation.set(g.thanRx, g.thanRy, g.thanRz); A.than.position.z = g.thanZ; A.dau.position.z = g.dauZ;
  A.tayT.position.z = g.tTZ; A.tayP.position.z = g.tPZ; A.chanT.position.y = g.chanY; A.chanP.position.y = g.chanPY;
  A.chanT.rotation.z = g.chanTz; A.chanP.rotation.z = g.chanPz; A.chanP.rotation.y = g.chanPy;
  if (A.vayDong) A.vayDong.position.y = g.vayY;
  c.goc = null;
}
// ngồi xổm / khuỵu gối (k 0..1): đùi đưa ra trước, gối gập, cả người hạ xuống cho bàn chân vẫn chạm đất
function ngoiXom(A, c, k) {
  const g = goc(A, c);
  if (k <= 0.001) { g.ha = 0; return 0; }
  let a, kg, ha;
  if (A.goiT) { a = 1.3 * k; kg = 2.2 * k; ha = 0.9 - (0.44 * Math.cos(a) + 0.46 * Math.cos(a - kg)); }
  else { a = 0.75 * k; kg = 0; ha = 0.9 * (1 - Math.cos(a)) * 0.6; }
  A.chanT.rotation.x = -a; A.chanP.rotation.x = -a;
  A.chanT.rotation.z = 0.08 * k; A.chanP.rotation.z = -0.08 * k; // gối hơi mở ra hai bên
  if (A.goiT) { A.goiT.rotation.x = kg; A.goiP.rotation.x = kg; }
  A.chanT.position.y = g.chanY - ha; A.chanP.position.y = g.chanPY - ha;
  A.than.position.y -= ha; A.dau.position.y -= ha; A.tayT.position.y -= ha; A.tayP.position.y -= ha;
  if (A.vayDong) A.vayDong.position.y = g.vayY - ha;
  g.ha = ha;
  return ha;
}
// nghiêng nửa trên quanh hông (a > 0: cúi về trước). Gọi SAU khi đã đặt tay (tay nghiêng theo thân).
function nghiengThan(A, c, a) {
  const g = goc(A, c);
  if (Math.abs(a) < 1e-4) return;
  const py = A.hongY - g.ha, ca = Math.cos(a), sa = Math.sin(a);
  const xoay = (o, z0) => { const y = o.position.y - py, z = z0; o.position.y = py + y * ca - z * sa; o.position.z = y * sa + z * ca; };
  xoay(A.than, g.thanZ); A.than.rotation.x = g.thanRx + a;
  xoay(A.dau, g.dauZ); A.dau.rotation.x += a;
  _qa.setFromAxisAngle(TRUC_X, a);
  xoay(A.tayT, g.tTZ); A.tayT.quaternion.premultiply(_qa);
  xoay(A.tayP, g.tPZ); A.tayP.quaternion.premultiply(_qa);
}
// nhô vai lên (nhún vai, run)
const nhoVai = (A, d) => { A.tayT.position.y += d; A.tayP.position.y += d; };
// tay về chỗ (x, y, z) trong khung người; y tính từ bàn chân, z ra trước mặt
const tay = (A, ben, x, y, z, k) => A.huongTay(ben > 0 ? A.tayP : A.tayT, x, y, z, k);

// ----- các cử chỉ -----
export const CU_THEM = {
  // ===== biểu cảm =====
  vay(A, c, p, t, e) { // giơ tay phải lên vẫy qua lại
    const v = Math.sin(t * 11);
    tay(A, 1, 0.36 + v * 0.07, A.dauY + 0.24 - Math.abs(v) * 0.03, 0.14, e);
    A.dau.rotation.z += 0.08 * e; A.dau.rotation.x -= 0.05 * e;
  },
  ngon_cai(A, c, p, t, e) { // nắm tay giơ ngón cái trước ngực, gật đầu
    const nhip = vom(p, 0.25, 0.55);
    tay(A, 1, 0.16, 1.22 + nhip * 0.06, 0.38, e);
    A.dau.rotation.x += 0.12 * nhip * e;
    if (A.doiMat && p > 0.2 && p < 0.85) A.doiMat("cuoi");
  },
  khoanh_tay(A, c, p, t, e) { // khoanh tay trước ngực, ngả nhẹ ra sau
    tay(A, -1, 0.11, 1.17, 0.27, e); tay(A, 1, -0.12, 1.21, 0.22, e);
    A.dau.rotation.x -= 0.08 * e; A.dau.rotation.y += Math.sin(t * 0.8) * 0.15 * e;
    nghiengThan(A, c, -0.05 * e);
  },
  chong_nanh(A, c, p, t, e) { // hai tay chống hông
    tay(A, -1, -0.29, 1.0, 0.02, e); tay(A, 1, 0.29, 1.0, 0.02, e);
    A.dau.rotation.y += Math.sin(t * 0.9) * 0.25 * e; A.dau.rotation.x -= 0.06 * e;
  },
  cui_chao(A, c, p, t, e) { // cúi chào: hai tay xuôi trước đùi
    const k = doan(p, 0.1, 0.35) * (1 - doan(p, 0.7, 0.95));
    tay(A, -1, -0.12, 0.88, 0.14, e); tay(A, 1, 0.12, 0.88, 0.14, e);
    nghiengThan(A, c, 0.62 * k);
    A.dau.rotation.x += 0.15 * k;
  },
  nhun_nhay(A, c, p, t, e) { // nhún gối theo nhịp, tay đánh lên xuống so le, đầu lắc lư
    const nhip = t * 7.2, b = Math.abs(Math.sin(nhip));
    ngoiXom(A, c, (0.1 + 0.18 * b) * e);
    tay(A, -1, -0.3, 1.2 + 0.32 * Math.max(0, Math.sin(nhip)), 0.3, e); tay(A, 1, 0.3, 1.2 + 0.32 * Math.max(0, -Math.sin(nhip)), 0.3, e);
    A.dau.rotation.z += Math.sin(nhip) * 0.16 * e; A.dau.rotation.x += 0.08 * b * e;
    A.than.rotation.y = goc(A, c).thanRy + Math.sin(nhip * 0.5) * 0.12 * e; // hông lắc (đặt lại khi xong)
    if (A.doiMat && p > 0.1 && p < 0.9) A.doiMat("cuoi");
  },
  an_mung(A, c, p, t, e) { // hai nắm tay giơ cao, nhún mạnh
    const b = Math.abs(Math.sin(t * 9));
    ngoiXom(A, c, 0.12 * b * e);
    tay(A, -1, -0.32, A.dauY + 0.42 + b * 0.05, 0.08, e); tay(A, 1, 0.32, A.dauY + 0.42 + b * 0.05, 0.08, e);
    A.dau.rotation.x -= 0.2 * e;
    if (A.doiMat && p > 0.1 && p < 0.9) A.doiMat("cuoi");
  },
  lau_mo_hoi(A, c, p, t, e) { // mu bàn tay quệt ngang trán
    const k = doan(p, 0.25, 0.65);
    tay(A, 1, 0.22 - k * 0.3, A.dauY + 0.1, 0.2, e);
    A.dau.rotation.x += 0.12 * e; A.dau.rotation.z -= 0.05 * e;
    if (A.doiMat && p > 0.2 && p < 0.8) A.doiMat("ngap");
  },
  run_ray(A, c, p, t, e) { // ôm người run cầm cập
    const r = Math.sin(t * 43) * 0.008 * e;
    tay(A, -1, 0.13 + r, 1.24, 0.17, e); tay(A, 1, -0.13 - r, 1.27 + r, 0.15, e);
    nhoVai(A, 0.035 * e + r); A.dau.rotation.x += 0.18 * e; A.dau.rotation.y += r * 3;
  },
  nhin_dong_ho(A, c, p, t, e) { // đưa cổ tay trái lên xem giờ
    tay(A, -1, -0.04, 1.24, 0.34, e);
    A.dau.rotation.x += 0.4 * e; A.dau.rotation.y -= 0.18 * e;
  },
  khoc(A, c, p, t, e) { // hai tay ôm mặt, vai rung
    const r = Math.sin(t * 17) * 0.012 * e;
    tay(A, -1, -0.06, A.dauY - 0.02, 0.2, e); tay(A, 1, 0.06, A.dauY - 0.02, 0.2, e);
    nhoVai(A, r); A.dau.rotation.x += (0.32 + r * 2) * e;
    nghiengThan(A, c, 0.1 * e);
  },
  gian(A, c, p, t, e) { // nắm tay siết hai bên, dậm chân, rướn cổ
    const run = Math.sin(t * 30) * 0.01 * e;
    tay(A, -1, -0.32, 0.98 + run, 0.14, e); tay(A, 1, 0.32, 0.98 - run, 0.14, e);
    const dam = vom(p, 0.3, 0.48);
    A.chanP.rotation.x = -0.55 * dam; if (A.goiP) A.goiP.rotation.x = 0.9 * dam;
    A.dau.rotation.x += 0.12 * e; nghiengThan(A, c, 0.1 * e);
    nhoVai(A, 0.02 * e);
  },
  ngac_nhien(A, c, p, t, e) { // giật mình: hai tay giơ lên ngang mặt, ngả ra sau
    tay(A, -1, -0.27, A.dauY - 0.06, 0.24, e); tay(A, 1, 0.27, A.dauY - 0.06, 0.24, e);
    nghiengThan(A, c, -0.12 * e); A.dau.rotation.x -= 0.15 * e;
  },
  nhun_vai(A, c, p, t, e) { // nhún vai, ngửa hai tay
    const k = vom(p, 0.15, 0.75);
    tay(A, -1, -0.34, 1.04, 0.3, e); tay(A, 1, 0.34, 1.04, 0.3, e);
    nhoVai(A, 0.06 * k); A.dau.rotation.z += 0.16 * k;
  },
  tho_dai(A, c, p, t, e) { // vai nhô lên rồi trút xuống, cúi đầu
    const len = vom(p, 0.05, 0.4), xuong = doan(p, 0.4, 0.6);
    nhoVai(A, (0.04 * len - 0.03 * xuong) * e);
    A.dau.rotation.x += (0.28 * xuong - 0.1 * len) * e;
    nghiengThan(A, c, 0.06 * xuong * e);
  },

  // ===== dùng đồ vật =====
  rua_mat(A, c, p, t, e) { // vốc nước dưới vòi rồi áp lên mặt
    const hung = doan(p, 0.05, 0.3) * (1 - doan(p, 0.35, 0.5)), mat = vom(p, 0.4, 0.95);
    ngoiXom(A, c, 0.12 * e);
    tay(A, -1, -0.05, lerp(1.0, A.dauY - 0.04, mat), lerp(0.42, 0.18, mat), e); tay(A, 1, 0.05, lerp(1.0, A.dauY - 0.04, mat), lerp(0.42, 0.18, mat), e);
    nghiengThan(A, c, (0.35 * hung + 0.2 * mat + 0.1) * e); A.dau.rotation.x += 0.2 * hung * e;
  },
  bam_nut(A, c, p, t, e) { // ngón tay bấm nút trước mặt (c.bien.y: độ cao bảng nút)
    const y = c.bien?.y ?? 1.15, z = c.bien?.z ?? 0.42, bam = Math.max(0, Math.sin(t * 13)) * 0.035;
    tay(A, 1, 0.1, y + Math.sin(t * 3.1) * 0.03, z + bam, e);
    tay(A, -1, -0.24, 0.92, 0.1, e * 0.5);
    A.dau.rotation.x += (y < 1.3 ? 0.25 : 0.05) * e;
  },
  cui_lay(A, c, p, t, e) { // khuỵu xuống nhặt đồ (khe máy bán nước, quả cầu dưới đất)
    const k = vom(p, 0.05, 0.9);
    ngoiXom(A, c, 0.75 * k * e);
    const tim = doan(p, 0.15, 0.4) * (1 - doan(p, 0.55, 0.85));
    tay(A, 1, 0.12, 1.0 - 0.6 * tim, 0.3 + 0.18 * tim, e);
    tay(A, -1, -0.2, 0.95, 0.25, e * 0.6);
    nghiengThan(A, c, 0.35 * k * e);
    A.dau.rotation.x += 0.25 * k * e;
  },
  mo_tu(A, c, p, t, e) { // nắm tay nắm cửa tủ, kéo ra; cúi người với vào trong lấy đồ
    const keo = doan(p, 0.1, 0.35), voi = vom(p, 0.4, 0.85);
    tay(A, -1, -0.32 - keo * 0.12, 1.15, 0.42 - keo * 0.22, e);
    tay(A, 1, 0.1, 1.05, 0.25 + voi * 0.3, e);
    nghiengThan(A, c, 0.22 * voi * e);
  },
  an(A, c, p, t, e) { // đưa đồ ăn lên miệng từng miếng
    const nhip = (t * 1.6) % 1, mieng = nhip < 0.35 ? muot(nhip / 0.35) : nhip < 0.55 ? 1 : muot(1 - (nhip - 0.55) / 0.45);
    tay(A, 1, 0.13 - mieng * 0.09, 1.18 + mieng * (A.dauY - 1.3), 0.32 - mieng * 0.1, e);
    tay(A, -1, -0.12, 1.12, 0.3, e * 0.7);
    A.dau.rotation.x += (0.06 - mieng * 0.06 + (nhip > 0.4 && nhip < 0.7 ? Math.sin(t * 25) * 0.025 : 0)) * e;
  },
  viet_bang(A, c, p, t, e) { // viết, vẽ lên bảng trắng trước mặt
    const viet = vom(p, 0.1, 0.9);
    tay(A, 1, 0.12 + Math.sin(t * 3.3) * 0.13 * viet, 1.48 + Math.sin(t * 6.1) * 0.07 * viet, 0.48, e);
    tay(A, -1, -0.28, 1.0, 0.04, e);
    A.dau.rotation.y += Math.sin(t * 3.3) * 0.12 * viet * e; A.dau.rotation.x -= 0.06 * e;
  },
  luc_tu(A, c, p, t, e) { // khom người lục ngăn kéo
    const k = vom(p, 0.05, 0.95);
    ngoiXom(A, c, 0.3 * k * e);
    tay(A, -1, -0.14 + Math.sin(t * 7) * 0.04, 0.95 + Math.sin(t * 9) * 0.03, 0.42, e);
    tay(A, 1, 0.14 + Math.sin(t * 8 + 1) * 0.04, 0.95 + Math.sin(t * 6 + 2) * 0.03, 0.42, e);
    nghiengThan(A, c, 0.3 * k * e); A.dau.rotation.x += 0.2 * e;
  },
  chap_tay(A, c, p, t, e) { // chắp tay cầm nhang, vái ba vái
    const vai = p > 0.25 && p < 0.85 ? Math.max(0, Math.sin((p - 0.25) / 0.6 * 3 * PI)) : 0;
    tay(A, -1, -0.025, 1.32 + vai * 0.08, 0.24, e); tay(A, 1, 0.025, 1.32 + vai * 0.08, 0.24, e);
    nghiengThan(A, c, 0.28 * vai * e); A.dau.rotation.x += 0.12 * vai * e;
  },
  tuoi(A, c, p, t, e) { // cầm bình tưới nghiêng về phía chậu cây
    const nghieng = doan(p, 0.2, 0.35) * (1 - doan(p, 0.8, 0.95));
    tay(A, 1, 0.16, 1.02 + nghieng * 0.06 + Math.sin(t * 2) * 0.02, 0.38, e);
    tay(A, -1, -0.22, 0.95, 0.1, e * 0.5);
    nghiengThan(A, c, 0.12 * e); A.dau.rotation.x += 0.25 * e;
  },
  bi_lac(A, c, p, t, e) { // khom người, hai tay xoay tay cầm bi lắc lia lịa
    ngoiXom(A, c, 0.18 * e);
    const x1 = Math.sin(t * 15) * 0.03, x2 = Math.sin(t * 13 + 1.3) * 0.03;
    tay(A, -1, -0.26, 0.92 + x1, 0.42 + x2, e); tay(A, 1, 0.26, 0.92 + x2, 0.42 - x1, e);
    nghiengThan(A, c, 0.3 * e); A.dau.rotation.x += 0.15 * e; A.dau.rotation.y = Math.sin(t * 2.3) * 0.25 * e;
  },
  golf(A, c, p, t, e) { // cầm gậy hai tay, đung đưa rồi gạt nhẹ
    const vung = p < 0.55 ? Math.sin(t * 2.4) * 0.06 : -0.14 * vom(p, 0.55, 0.75);
    ngoiXom(A, c, 0.12 * e);
    tay(A, -1, -0.04 + vung, 0.9, 0.28, e); tay(A, 1, 0.04 + vung, 0.84, 0.3, e);
    nghiengThan(A, c, 0.38 * e); A.dau.rotation.x += 0.3 * e; A.dau.rotation.y += (p > 0.6 ? -0.4 * doan(p, 0.6, 0.75) : 0) * e;
  },
  guitar(A, c, p, t, e) { // tay trái bấm phím trên cần đàn, tay phải quạt dây
    const quat = Math.sin(t * 11) * 0.05;
    tay(A, -1, -0.42, 1.24 + Math.sin(t * 1.3) * 0.02, 0.26, e);
    tay(A, 1, 0.06, 1.06 + quat, 0.24, e);
    A.dau.rotation.x += 0.22 * e; A.dau.rotation.z += Math.sin(t * 2.6) * 0.08 * e;
  },
  selfie(A, c, p, t, e) { // giơ điện thoại chụp ảnh, tay kia làm dấu V
    tay(A, 1, 0.28, A.dauY + 0.12, 0.5, e); tay(A, -1, -0.2, A.dauY + 0.14, 0.12, e);
    A.dau.rotation.z += 0.18 * e; A.dau.rotation.y += 0.25 * e; A.dau.rotation.x -= 0.1 * e;
    if (A.doiMat && p > 0.15 && p < 0.9) A.doiMat("cuoi");
  },
  doc_bang(A, c, p, t, e) { // chống cằm đọc bảng tin, gật gù
    tay(A, 1, 0.04, A.dauY - 0.15, 0.17, e); tay(A, -1, 0.09, 1.16, 0.22, e);
    A.dau.rotation.x += (-0.08 + Math.sin(t * 1.4) * 0.05) * e; A.dau.rotation.y += Math.sin(t * 0.6) * 0.2 * e;
  },
  vuot(A, c, p, t, e) { // ngồi xổm vuốt đầu con vật
    ngoiXom(A, c, 0.85 * e);
    tay(A, 1, 0.06, 0.62 + Math.max(0, Math.sin(t * 6)) * 0.05, 0.45, e);
    tay(A, -1, -0.22, 0.72, 0.3, e);
    nghiengThan(A, c, 0.3 * e); A.dau.rotation.x += 0.3 * e;
  },
  da_cau(A, c, p, t, e) { // tâng cầu bằng má trong bàn chân phải, hai tay dang giữ thăng bằng
    const nhip = (t * 1.5) % 1, da = nhip < 0.3 ? Math.sin(nhip / 0.3 * PI) : 0;
    const g = goc(A, c);
    A.chanP.rotation.x = -0.75 * da * e; A.chanP.rotation.z = g.chanPz + 0.35 * da * e; A.chanP.rotation.y = g.chanPy - 0.5 * da * e;
    if (A.goiP) A.goiP.rotation.x = 1.2 * da * e;
    if (A.goiT) A.goiT.rotation.x = 0.15 * e;
    tay(A, -1, -0.5, 1.15, 0.12, e); tay(A, 1, 0.45, 1.12 - da * 0.05, 0.1, e);
    A.dau.rotation.x += (0.3 - 0.3 * Math.sin(nhip * PI)) * e;
  },
  rut_dien(A, c, p, t, e) { // cúi xuống rút dây điện rồi cắm lại
    const k = vom(p, 0.05, 0.95), keo = vom(p, 0.3, 0.6);
    ngoiXom(A, c, 0.6 * k * e);
    tay(A, 1, 0.08, 0.95 - 0.25 * k, 0.48 - keo * 0.15, e); tay(A, -1, -0.12, 0.95 - 0.2 * k, 0.4, e * 0.8);
    nghiengThan(A, c, 0.4 * k * e); A.dau.rotation.x += 0.2 * e;
  },
  vut_rac(A, c, p, t, e) { // đưa tay ra thả rác vào thùng
    const ra = vom(p, 0.1, 0.9);
    tay(A, 1, 0.12, 1.15 - ra * 0.12, 0.25 + ra * 0.28, e);
    A.dau.rotation.x += 0.3 * e; nghiengThan(A, c, 0.12 * ra * e);
  },
  nhan_do(A, c, p, t, e) { // chìa tay nhận đồ / đưa tiền rồi thu về trước ngực
    const ra = vom(p, 0.05, 0.75);
    tay(A, 1, 0.14, 1.12 + ra * 0.05, 0.3 + ra * 0.24, e);
    A.dau.rotation.x += 0.1 * e; nghiengThan(A, c, 0.08 * ra * e);
  },
  keo_tu(A, c, p, t, e) { // gạt công tắc / kéo tay cầm ngang vai
    const bam = vom(p, 0.3, 0.55);
    tay(A, 1, 0.16, 1.32 - bam * 0.05, 0.42 + bam * 0.04, e);
    A.dau.rotation.y += 0.1 * e;
  },
  the_duc(A, c, p, t, e) { // tập thể dục: xoay vai, ngồi xổm, vươn hai bên
    if (p < 0.4) { // xoay tay vòng lớn
      const a = t * 5;
      tay(A, -1, -0.5 * Math.abs(Math.cos(a)) - 0.2, A.vaiY + 0.55 * Math.sin(a), 0.1 + 0.25 * Math.cos(a), e);
      tay(A, 1, 0.5 * Math.abs(Math.cos(a)) + 0.2, A.vaiY + 0.55 * Math.sin(a), 0.1 + 0.25 * Math.cos(a), e);
    } else if (p < 0.72) { // ngồi xổm, tay đưa thẳng ra trước
      const k = Math.abs(Math.sin((p - 0.4) / 0.32 * 3 * PI));
      ngoiXom(A, c, 0.75 * k * e);
      tay(A, -1, -0.18, A.vaiY - 0.05, 0.6, e); tay(A, 1, 0.18, A.vaiY - 0.05, 0.6, e);
      nghiengThan(A, c, 0.2 * k * e);
    } else { // vươn người hai bên
      const s = Math.sin((p - 0.72) / 0.28 * 2 * PI);
      tay(A, -1, -0.2 + s * 0.3, A.dauY + 0.5, 0, e); tay(A, 1, 0.2 + s * 0.3, A.dauY + 0.5, 0, e);
      A.than.rotation.z = goc(A, c).thanRz - s * 0.15 * e; A.dau.rotation.z -= s * 0.15 * e;
    }
  },
  ngu_gat(A, c, p, t, e) { // ngả lưng trên ghế lười, tay đan trên bụng, gà gật
    tay(A, -1, 0.05, 1.08, 0.22, e); tay(A, 1, -0.05, 1.06, 0.24, e);
    A.dau.rotation.x += (0.32 + Math.sin(t * 0.9) * 0.05) * e; A.dau.rotation.z += 0.2 * e;
  },
};
// cử chỉ kết thúc (xong, bị thay, bước đi): trả mọi khớp bị đổi về như cũ
export function ketThucCuThem(A, c) { traGoc(A, c); }
