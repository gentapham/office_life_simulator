// Hoạt ảnh của người chơi và phản ứng của những người xung quanh:
// - động tác khi dùng đồ vật (đôi tay góc nhìn 1 + cả người góc nhìn 3 + đồ cầm tay + âm thanh), khóa bước chân trong lúc làm
// - đứng yên lâu: vươn vai, xem điện thoại, xem đồng hồ, gãi đầu; mệt thì ngáp; nóng / stress thì lau mồ hôi; mưa thì run
// - dáng đi theo sức (mệt: cúi đầu, bước chậm, tay buông; stress: đi gấp), bước chân khi xoay người tại chỗ,
//   tăng tốc / dừng lại mượt, ngồi xuống / đứng dậy khỏi ghế có chuyển động, mọi khớp đổi tư thế không giật
// - vòng biểu cảm (phím G / nút "Biểu cảm" trên điện thoại): vẫy tay, cười, khoanh tay, nhún nhảy, cúi chào, chống nạnh,
//   giơ ngón cái, ăn mừng; đồng nghiệp / người đi đường gần đó đáp lại
// - đồng nghiệp ở gần quay đầu nhìn, gật đầu / vẫy chào; người đang nói trong hội thoại làm cử chỉ theo câu thoại
import * as THREE from "three";
import { taoDo, LA_DUNG } from "./do-cam-tay.js";
import { am } from "../am-thanh-game.js";
import { doan, ketThucCuThem } from "./hoat-anh.js";

const muot = x => x * x * (3 - 2 * x);
const kep = (x, a, b) => Math.max(a, Math.min(b, x));
const vom = (p, a, b) => { const x = kep((p - a) / (b - a), 0, 1); return Math.sin(x * Math.PI); };
const gocGiua = (a, b) => Math.atan2(Math.sin(b - a), Math.cos(b - a));
const chon = a => a[Math.floor(Math.random() * a.length)];
const lerp = (a, b, k) => a + (b - a) * k;
const PI = Math.PI;
const L_TAY = 0.33; // lòng bàn tay cách gốc cẳng tay (khung đôi tay góc nhìn 1)

// ======================= ĐỘNG TÁC ĐÔI TAY GÓC NHÌN 1 =======================
// X.tay(ben, x, y, z, rx, ry, rz): lòng bàn tay tới (x, y, z) trong khung camera (x phải, y lên, z ra sau),
//   cẳng tay ngóc lên rx, xoay vào trong ry, lật lòng bàn tay rz. ben: -1 trái, 1 phải.
// X.do(ben, ten, o): cầm đồ (o.cam: đặt theo khung nhìn với góc o.rx/ry/rz; không thì theo bàn tay; o.x/y/z: lệch)
// X.cam(dy, ngua, nghieng, toi): hạ tầm mắt, ngửa / cúi đầu, nghiêng đầu, chồm tới
const tayNguc = (X, ben = 1, nang = 0) => X.tay(ben, lerp(0.13, 0.06, nang) * ben, lerp(-0.2, -0.1, nang), lerp(-0.4, -0.23, nang), lerp(0.35, 1.1, nang), 0.35 * ben, -1.3 * ben);
const tayBam = (X, x = 0.07, y = -0.06, z = -0.5, t = 0, nhanh = 13) => X.tay(1, x, y, z + Math.max(0, Math.sin(t * nhanh)) * 0.04, 0.3, 0.12, -0.35);
const tayNghi = (X, ben) => X.tay(ben, 0.26 * ben, -0.36, -0.44, 0.1, -0.1 * ben, 0);
// uống: nâng ly lên miệng (nang 0..1), ly nghiêng theo
// (ly nghiêng tới ~110°: miệng ly kề môi, đáy ly hếch lên phía trước)
// Ly đưa lên miệng nằm ngay dưới tầm mắt (miệng thấp hơn mắt ~9 cm, gần mặt): lúc uống chỉ thấy đáy ly nhô lên ở mép dưới
// khung nhìn như ngoài đời, không che giữa màn hình (trước đây ly dừng ngang tầm mắt, cách 23 cm nên to chiếm giữa màn hình).
const uongLy = (X, ten, nang) => {
  X.tay(1, lerp(0.13, 0.04, nang), lerp(-0.2, -0.152, nang), lerp(-0.4, -0.19, nang), lerp(0.35, 1.15, nang), 0.35, -1.3);
  X.do(1, ten, { cam: true, rx: nang * 1.75, x: -0.045 + nang * 0.01, y: 0.01 + nang * 0.012 }); X.cam(0, 0.22 * nang);
};
// ăn: đưa miếng lên miệng theo nhịp
const anMieng = (X, ten, t, camTay = false) => {
  const n = (t * 1.6) % 1, m = n < 0.35 ? muot(n / 0.35) : n < 0.55 ? 1 : muot(1 - (n - 0.55) / 0.45);
  X.tay(1, lerp(0.12, 0.04, m), lerp(-0.2, -0.1, m), lerp(-0.42, -0.24, m), lerp(0.3, 0.9, m), 0.4, -1.2);
  if (camTay) X.do(1, ten, { x: -0.03, y: -0.02, z: 0.02, rx: 0, ry: -0.9, rz: 1.3 });
  else X.do(1, ten, { cam: true, rx: 0.5 * m, x: -0.05 });
  X.cam(0, 0.06 * m - 0.05, 0);
  return m;
};
// nhận đồ từ người bán / lấy đồ trên bàn: chìa tay ra rồi thu về
const nhan = (X, p, a, b, tenTruoc, tenSau) => {
  const ra = vom(p, a, b);
  X.tay(1, lerp(0.13, 0.08, ra), lerp(-0.2, -0.1, ra), lerp(-0.4, -0.62, ra), lerp(0.35, 0.25, ra), 0.3, lerp(-1.3, -2.6, ra));
  const ten = p < (a + b) / 2 ? tenTruoc : tenSau;
  if (ten) X.do(1, ten, LA_DUNG(ten) ? { cam: true, x: -0.045 } : { x: 0, y: 0.02, z: 0, rx: 0, ry: 0, rz: 0 });
};

export const HANH_DONG = {
  // ---------- ăn uống (đồ cũ) ----------
  uong_nuoc: { giay: 3.4, ket: 0.78, than: [["bam_nut", 0, 0.32, { y: 1.05, z: 0.36 }], ["uong", 0.34, 1]], doThan: [["ly_nhua", 0.34, 1]],
    am: [[0.05, "ong_nuoc"], [0.6, "uong"]],
    tay(X) { const p = X.p; if (p < 0.34) { X.tay(1, 0.06, -0.14, -0.46, 0.2, 0.25, -1.2); X.do(1, "ly", { cam: true, x: -0.045 }); X.tay(-1, -0.05, -0.02, -0.52, 0.5, -0.1, 0.4); X.cam(0, -0.22 * X.e); } else uongLy(X, "ly", vom(p, 0.4, 0.98)); } },
  ca_phe: { giay: 4.2, ket: 0.8, than: [["bam_nut", 0, 0.3, { y: 1.25 }], ["uong", 0.55, 1]], doThan: [["ly", 0.5, 1]], am: [[0.08, "bip"], [0.15, "may_ca_phe"], [0.7, "uong"]],
    tay(X) { const p = X.p; if (p < 0.3) tayBam(X, 0.05, -0.02, -0.52, X.t); else if (p < 0.5) { tayNghi(X, 1); X.cam(0, -0.08); } else { uongLy(X, "ly", vom(p, 0.62, 0.98)); } } },
  tu_lanh: { giay: 5, ket: 0.85, than: [["mo_tu", 0, 0.48], ["an", 0.5, 1]], doThan: [["hop_com", 0.35, 1, "dung"]], am: [[0.02, "tu_lanh"], [0.62, "an"]],
    tay(X) {
      const p = X.p;
      if (p < 0.48) { const k = doan(p, 0.05, 0.3); X.tay(-1, lerp(-0.12, -0.36, k), -0.04, lerp(-0.55, -0.32, k), 0.3, -0.3, 1.3); const v = vom(p, 0.25, 0.48); X.tay(1, 0.1, -0.12, lerp(-0.4, -0.66, v), 0.2, 0.2, -1.2); if (p > 0.38) X.do(1, "hop_com", { cam: true, x: -0.06 }); X.cam(-0.06 * v, -0.1); }
      else { X.tay(-1, -0.1, -0.24, -0.38, 0.3, -0.3, 1.2); X.do(-1, "hop_com", { cam: true, x: 0.07, y: 0.02 }); anMieng(X, null, X.t); }
    } },
  mi_ly: { giay: 5, ket: 0.85, than: [["bam_nut", 0, 0.25, { y: 1.15 }], ["an", 0.55, 1]], doThan: [["coc_mi", 0.5, 1, "dung"]], am: [[0.05, "bip"], [0.1, "lo_vi_song"], [0.7, "an"]],
    tay(X) { const p = X.p; if (p < 0.25) tayBam(X, 0.08, -0.08, -0.5, X.t); else if (p < 0.5) { tayNghi(X, 1); X.cam(0, -0.05); } else { X.tay(-1, -0.08, -0.22, -0.38, 0.3, -0.3, 1.2); X.do(-1, "coc_mi", { cam: true, x: 0.07, y: 0.02 }); anMieng(X, null, X.t); } } },
  trai_cay: { giay: 3, ket: 0.7, than: [["nhan_do", 0, 0.3], ["an", 0.32, 1]], doThan: [["chuoi", 0.2, 1, "tay"]], am: [[0.45, "an"]],
    tay(X) { const p = X.p; if (p < 0.3) nhan(X, p, 0, 0.3, null, "chuoi"); else anMieng(X, "chuoi", X.t, true); } },
  tra_bac_binh: { giay: 3.4, ket: 0.75, than: [["nhan_do", 0, 0.3], ["uong", 0.32, 1]], doThan: [["ly", 0.2, 1]], am: [[0.5, "uong"]],
    tay(X) { const p = X.p; if (p < 0.32) nhan(X, p, 0, 0.32, null, "ly"); else uongLy(X, "ly", vom(p, 0.36, 0.98)); } },
  banh_mi: { giay: 3.8, ket: 0.7, than: [["nhan_do", 0, 0.3], ["an", 0.32, 1]], doThan: [["tien", 0, 0.15, "tay"], ["banh_mi", 0.15, 1, "tay"]], am: [[0.45, "an"]],
    tay(X) { const p = X.p; if (p < 0.32) nhan(X, p, 0, 0.32, "tien", "banh_mi"); else anMieng(X, "banh_mi", X.t, true); } },
  hu_tieu: { giay: 4, ket: 0.75, than: [["nhan_do", 0, 0.3], ["an", 0.32, 1]], doThan: [["tien", 0, 0.15, "tay"], ["to", 0.15, 1, "dung"]], am: [[0.45, "an"]],
    tay(X) { const p = X.p; if (p < 0.32) nhan(X, p, 0, 0.32, "tien", "to"); else { X.tay(-1, -0.06, -0.24, -0.4, 0.3, -0.3, 1.25); X.do(-1, "to", { cam: true, x: 0.08, y: 0.03 }); anMieng(X, null, X.t); } } },
  che: { giay: 3.6, ket: 0.75, than: [["nhan_do", 0, 0.3], ["an", 0.32, 1]], doThan: [["tien", 0, 0.15, "tay"], ["to", 0.15, 1, "dung"]], am: [[0.45, "an"]],
    tay(X) { const p = X.p; if (p < 0.32) nhan(X, p, 0, 0.32, "tien", "to"); else { X.tay(-1, -0.06, -0.24, -0.4, 0.3, -0.3, 1.25); X.do(-1, "to", { cam: true, x: 0.08, y: 0.03 }); anMieng(X, null, X.t); } } },
  nuoc_mia: { giay: 3.4, ket: 0.75, than: [["nhan_do", 0, 0.3], ["uong", 0.32, 1]], doThan: [["tien", 0, 0.15, "tay"], ["ly_mia", 0.15, 1]], am: [[0.5, "uong"]],
    tay(X) { const p = X.p; if (p < 0.32) nhan(X, p, 0, 0.32, "tien", "ly_mia"); else uongLy(X, "ly_mia", vom(p, 0.36, 0.98)); } },
  tra_da: { giay: 3, ket: 0.75, than: [["nhan_do", 0, 0.28], ["uong", 0.3, 1]], doThan: [["ly_nhua", 0.15, 1]], am: [[0.45, "uong"]],
    tay(X) { const p = X.p; if (p < 0.3) nhan(X, p, 0, 0.3, null, "ly_nhua"); else uongLy(X, "ly_nhua", vom(p, 0.34, 0.98)); } },
  rua_mat: { giay: 2.8, ket: 0.7, than: [["rua_mat", 0, 1]], am: [[0.05, "voi_nuoc"]],
    tay(X) {
      const p = X.p, hung = doan(p, 0.05, 0.3) * (1 - doan(p, 0.35, 0.5)), mat = vom(p, 0.4, 0.95);
      for (const b of [-1, 1]) X.tay(b, lerp(0.07, 0.05, mat) * b, lerp(-0.3, -0.06, mat) + hung * 0.0, lerp(-0.45, -0.16, mat), lerp(0.2, 1.2, mat), 0.5 * b, -1.5 * b);
      X.cam(-0.05 * hung, -0.35 * hung + 0.05 * mat);
    } },
  meo: { giay: 2.4, khoaNhe: true, than: [["vuot", 0, 1]], tay(X) { X.tay(1, 0.04, -0.28 + Math.max(0, Math.sin(X.t * 6)) * 0.03, -0.5, -0.1, 0.1, 0); X.cam(-0.55, -0.45); } },
  chim: { giay: 2, khoaNhe: true, than: [["vut_rac", 0, 1]], tay(X) { const n = (X.t * 2.2) % 1; X.tay(1, 0.12, lerp(-0.18, -0.24, n), lerp(-0.42, -0.58, n), lerp(0.4, -0.1, n), 0.2, -2.6); X.cam(0, -0.2); } },
  ca: { giay: 2.6, khoaNhe: true, than: [["doc_bang", 0, 1]], tay(X) { X.cam(-0.12, -0.12, 0, 0.12); } },

  // ---------- đồ vật mới ----------
  may_in: { giay: 4.2, ket: 0.9, than: [["bam_nut", 0, 0.3, { y: 1.0 }], ["nhan_do", 0.62, 1]], doThan: [["giay", 0.75, 1, "tay"]], am: [[0.06, "bip"], [0.25, "may_in"]],
    tay(X) { const p = X.p; if (p < 0.3) tayBam(X, 0.08, -0.16, -0.5, X.t); else if (p < 0.62) { tayNghi(X, 1); X.cam(0, -0.15); } else { const v = vom(p, 0.62, 0.95); X.tay(1, 0.08, lerp(-0.2, -0.22, v), lerp(-0.42, -0.58, v), 0.1, 0.2, lerp(-1.2, -2.8, v)); if (p > 0.76) X.do(1, "giay", { x: 0.02, y: 0.02, z: -0.08 }); X.cam(0, -0.3); } } },
  may_in_ket: { giay: 4.6, ket: 0.92, than: [["bam_nut", 0, 0.28, { y: 1.0 }], ["gian", 0.45, 0.8], ["bam_nut", 0.8, 1, { y: 1.0, z: 0.36 }]], am: [[0.06, "bip"], [0.22, "ket_giay"], [0.55, "dap_may"], [0.66, "dap_may"]],
    tay(X) { const p = X.p; if (p < 0.4) tayBam(X, 0.08, -0.16, -0.5, X.t); else if (p < 0.8) { const d = Math.abs(Math.sin(X.t * 7)); X.tay(1, 0.05, lerp(-0.02, -0.2, d), -0.5, 0.2, 0.1, -0.2); X.cam(0, -0.25, Math.sin(X.t * 30) * 0.004); } else tayBam(X, 0.03, -0.2, -0.46, X.t, 8); } },
  tu_ho_so: { giay: 3.2, ket: 0.85, than: [["luc_tu", 0, 1]], am: [[0.05, "ngan_keo"], [0.75, "ngan_keo"]],
    tay(X) { const k = vom(X.p, 0.02, 0.98); for (const b of [-1, 1]) X.tay(b, 0.13 * b + Math.sin(X.t * 7 + b) * 0.03, -0.3 + Math.sin(X.t * 9 + b * 2) * 0.02, -0.52, 0.0, 0.2 * b, 0); X.cam(-0.35 * k, -0.4 * k); } },
  bang_trang: { giay: 4, ket: 0.9, than: [["viet_bang", 0, 1]], doThan: [["but", 0.05, 0.95, "tay"]], am: [[0.15, "but_long"], [0.5, "but_long"]],
    tay(X) { const v = vom(X.p, 0.08, 0.95); X.tay(1, 0.13 + Math.sin(X.t * 3.3) * 0.12 * v, -0.02 + Math.sin(X.t * 6.1) * 0.06 * v, -0.55, 0.45, 0.1, -0.6); X.do(1, "but", { x: -0.01, y: 0.0, z: -0.03, rx: -1.2, ry: 0, rz: 0 }); X.cam(0, 0.05); } },
  cham_cong: { giay: 1.8, ket: 0.7, than: [["bam_nut", 0, 1, { y: 1.3, z: 0.38 }]], am: [[0.4, "cham_cong"]],
    tay(X) { const k = vom(X.p, 0.05, 0.9); X.tay(1, 0.05, -0.02, lerp(-0.42, -0.56, k), 0.35, 0.1, -0.2); } },
  than_tai: { giay: 4.4, ket: 0.9, than: [["chap_tay", 0, 1]], doThan: [["nhang", 0.05, 0.95, "tay"]], am: [[0.1, "chuong"], [0.9, "chuong"]],
    tay(X) {
      const p = X.p, vai = p > 0.25 && p < 0.85 ? Math.max(0, Math.sin((p - 0.25) / 0.6 * 3 * PI)) : 0;
      for (const b of [-1, 1]) X.tay(b, 0.025 * b, lerp(-0.16, -0.22, vai), -0.36, 1.0, 0.7 * b, -1.45 * b);
      X.do(1, "nhang", { cam: true, x: -0.02, y: 0.02, rx: -0.15 });
      X.cam(-0.04 * vai, -0.28 * vai);
    } },
  tuoi_cay: { giay: 3.4, ket: 0.8, than: [["tuoi", 0, 1]], doThan: [["binh_tuoi", 0.02, 0.98, "tay"]], am: [[0.25, "tuoi_nuoc"]],
    tay(X) { const ng = doan(X.p, 0.2, 0.35) * (1 - doan(X.p, 0.8, 0.95)); X.tay(1, 0.1, -0.2, -0.48, 0.15, 0.25, -1.3); X.do(1, "binh_tuoi", { cam: true, x: -0.07, y: -0.02, rx: ng * 0.7, ry: -PI / 2 }); X.cam(0, -0.35); } },
  cong_tac: { giay: 1.3, ket: 0.45, than: [["keo_tu", 0, 1]], am: [[0.4, "cong_tac"]],
    tay(X) { const b = vom(X.p, 0.25, 0.55); X.tay(1, 0.05, lerp(0.0, -0.04, b), lerp(-0.5, -0.56, b), 0.5, 0.15, -0.4); } },
  may_ban_nuoc: { giay: 4.6, ket: 0.88, than: [["bam_nut", 0, 0.33, { y: 1.2 }], ["cui_lay", 0.38, 0.8], ["uong", 0.82, 1]], doThan: [["lon", 0.6, 1]], am: [[0.05, "xu"], [0.2, "bip"], [0.36, "lon_roi"], [0.82, "mo_lon"]],
    tay(X) {
      const p = X.p;
      if (p < 0.33) tayBam(X, 0.06, -0.04, -0.5, X.t, 10);
      else if (p < 0.8) { const k = vom(p, 0.36, 0.8); X.tay(1, 0.06, lerp(-0.2, -0.24, k), lerp(-0.42, -0.6, k), 0.0, 0.2, -1.3); if (p > 0.6) X.do(1, "lon", { cam: true, x: -0.045 }); X.cam(-0.7 * k, -0.45 * k); }
      else { uongLy(X, "lon", vom(p, 0.84, 1.1) * 0.6); X.tay(-1, -0.02, -0.08, -0.32, 0.8, -0.4, 0.8); }
    } },
  bi_lac: { giay: 4.2, ket: 0.9, than: [["bi_lac", 0, 1]], am: [[0.1, "bi_lac"], [0.45, "bi_lac"], [0.8, "bi_lac"]],
    tay(X) { for (const b of [-1, 1]) X.tay(b, 0.25 * b + Math.sin(X.t * 15 + b) * 0.02, -0.25 + Math.sin(X.t * 13 + b * 1.3) * 0.025, -0.74, -0.25, -0.1 * b, (1.4 + Math.sin(X.t * 17 + b) * 0.6) * b); X.cam(-0.15, -0.5, Math.sin(X.t * 2.3) * 0.03); } },
  ngu_trua: { giay: 8, ket: 0.9, nam: true, than: [["ngu_gat", 0, 1]], am: [[0.35, "ngay"], [0.6, "ngay"]],
    tay(X) { for (const b of [-1, 1]) X.tay(b, 0.12 * b, -0.42, -0.36, 0.1, 0.3 * b, -0.6 * b); const k = doan(X.p, 0.0, 0.18) * (1 - doan(X.p, 0.9, 1)); X.cam(-1.05 * k, 0.75 * k, 0.18 * k, -0.25 * k); } },
  golf: { giay: 3.8, ket: 0.85, than: [["golf", 0, 1]], doThan: [["gay_golf", 0.02, 0.98, "tay"]], am: [[0.62, "golf"]],
    tay(X) { const p = X.p, vung = p < 0.55 ? Math.sin(X.t * 2.4) * 0.05 : -0.12 * vom(p, 0.55, 0.75); for (const b of [-1, 1]) X.tay(b, 0.02 * b + vung, -0.34 + (b > 0 ? -0.03 : 0), -0.4, -0.5, 0.6 * b, -1.4 * b); X.do(1, "gay_golf", { cam: true, x: -0.03, y: 0.06, rx: 0.2, rz: -vung * 2 }); X.cam(-0.1, -0.75); } },
  guitar: { giay: 4.6, ket: 0.9, than: [["guitar", 0, 1]], doThan: [["guitar", 0.03, 0.97, "than"]], am: [[0.1, "guitar"], [0.42, "guitar"], [0.72, "guitar"]],
    tay(X) { X.tay(-1, -0.3, -0.18, -0.42, 0.5, -0.9, 1.2); X.tay(1, 0.06, -0.33 + Math.sin(X.t * 11) * 0.03, -0.36, 0.1, 0.5, -1.3); X.do(-1, "guitar", { cam: true, x: 0.24, y: -0.18, z: 0.0, rx: 0, ry: 0, rz: 1.25 }); X.cam(0, -0.55); } },
  rut_dien: { giay: 3.2, ket: 0.85, than: [["rut_dien", 0, 1]], am: [[0.35, "cong_tac"], [0.7, "cong_tac"], [0.8, "bip"]],
    tay(X) { const k = vom(X.p, 0.05, 0.95), keo = vom(X.p, 0.3, 0.6); X.tay(1, 0.06, -0.22, lerp(-0.55, -0.42, keo), 0.0, 0.1, -1.4); X.cam(-0.6 * k, -0.55 * k); } },
  bang_tin: { giay: 4, ket: 0.85, than: [["doc_bang", 0, 1]], tay(X) { X.cam(0, 0.05 + Math.sin(X.t * 1.4) * 0.03, 0, 0.05); } },
  selfie: { giay: 3.4, ket: 0.7, than: [["selfie", 0, 1]], doThan: [["dien_thoai", 0.05, 0.95, "tay"]], am: [[0.62, "chup"]],
    tay(X) { X.tay(1, 0.06, 0.02, -0.4, 1.15, 0.2, -PI); X.do(1, "dien_thoai", { cam: true, x: -0.02, y: 0.03, rx: -0.1 }); X.tay(-1, -0.2, -0.12, -0.42, 1.2, -0.2, 0.9); X.cam(0, 0, 0.12); X.flash(0.62); } },
  atm: { giay: 4.6, ket: 0.88, than: [["bam_nut", 0, 1, { y: 1.12 }]], doThan: [["the", 0.0, 0.2, "tay"], ["the", 0.82, 1, "tay"]], am: [[0.18, "the_vao"], [0.3, "bip"], [0.38, "bip"], [0.46, "bip"], [0.54, "bip"], [0.7, "atm"]],
    tay(X) { const p = X.p; if (p < 0.2 || p > 0.82) { nhan(X, p < 0.2 ? p : 1 - (p - 0.82), 0, 0.2, "the", "the"); } else tayBam(X, 0.04, -0.14, -0.48, X.t, 11); X.cam(0, -0.25); } },
  ve_so: { giay: 3, ket: 0.75, than: [["nhan_do", 0, 0.45], ["nhin_dong_ho", 0.5, 1]], doThan: [["tien", 0, 0.2, "tay"], ["ve_so", 0.2, 1, "tay"]], am: [[0.6, "giay"]],
    tay(X) { const p = X.p; if (p < 0.45) nhan(X, p, 0, 0.45, "tien", "ve_so"); else { X.tay(1, 0.05, -0.1, -0.3, 0.9, 0.3, -PI); X.do(1, "ve_so", { cam: true, x: -0.03, y: 0.06, rx: -1.25 }); X.cam(0, -0.1); } } },
  thung_rac: { giay: 1.5, ket: 0.6, than: [["vut_rac", 0, 1]], am: [[0.55, "bo_rac"]],
    tay(X) { const ra = vom(X.p, 0.05, 0.95); X.tay(1, 0.08, lerp(-0.2, -0.24, ra), lerp(-0.4, -0.62, ra), lerp(0.35, -0.2, ra), 0.25, -1.3); if (X.p < 0.55 && X.rac) X.do(1, X.rac, LA_DUNG(X.rac) ? { cam: true, x: -0.045 } : {}); X.cam(0, -0.35); } },
  da_cau: { giay: 4.6, ket: 0.9, than: [["da_cau", 0, 1]],
    tay(X) { for (const b of [-1, 1]) X.tay(b, 0.36 * b, -0.3, -0.36, 0.0, -0.5 * b, 0.3 * b); const n = (X.t * 1.5) % 1; X.cam(0, -0.55 + 0.35 * Math.sin(n * PI), 0); } },
  the_duc: { giay: 6, ket: 0.9, than: [["the_duc", 0, 1]], am: [[0.02, "vu_vu"], [0.45, "vu_vu"]],
    tay(X) {
      const p = X.p;
      if (p < 0.4) { const a = X.t * 5; for (const b of [-1, 1]) X.tay(b, (0.25 + 0.15 * Math.cos(a)) * b, -0.1 + 0.35 * Math.sin(a), -0.45, 0.6 + 0.6 * Math.sin(a), 0, 0); }
      else if (p < 0.72) { const k = Math.abs(Math.sin((p - 0.4) / 0.32 * 3 * PI)); for (const b of [-1, 1]) X.tay(b, 0.15 * b, -0.12, -0.5, 0.1, 0.1 * b, 0); X.cam(-0.55 * k, -0.08 * k); }
      else { const s = Math.sin((p - 0.72) / 0.28 * 2 * PI); X.cam(0, 0.1, -0.2 * s); }
    } },
  vuot_cho: { giay: 2.6, khoaNhe: true, than: [["vuot", 0, 1]], tay(X) { X.tay(1, 0.04, -0.28 + Math.max(0, Math.sin(X.t * 6)) * 0.03, -0.5, -0.1, 0.1, 0); X.cam(-0.6, -0.5); } },
  // ---------- biểu cảm (vòng biểu cảm) ----------
  vay: { giay: 2.2, bieuCam: true, than: [["vay", 0, 1]], tay(X) { const v = Math.sin(X.t * 11); X.tay(1, 0.2 + v * 0.06, -0.02, -0.46, 1.25, -0.2 + v * 0.25, 0.1); } },
  cuoi: { giay: 1.9, bieuCam: true, than: [["cuoi", 0, 1]], am: [[0.05, "cuoi"]], tay(X) { X.cam(0, 0.06 + Math.abs(Math.sin(X.t * 17)) * 0.03); } },
  khoanh_tay: { giay: 4, bieuCam: true, than: [["khoanh_tay", 0, 1]], tay(X) { X.tay(-1, 0.1, -0.33, -0.3, 0.2, 1.2, 0.3); X.tay(1, -0.1, -0.31, -0.32, 0.2, -1.2, -0.3); X.cam(0, 0.06); } },
  nhun_nhay: { giay: 4.4, bieuCam: true, than: [["nhun_nhay", 0, 1]], am: [[0.0, "nhac_nhay"]], tay(X) { const n = X.t * 7.2; X.tay(-1, -0.2, -0.22 + 0.12 * Math.max(0, Math.sin(n)), -0.44, 0.8, 0, 0.6); X.tay(1, 0.2, -0.22 + 0.12 * Math.max(0, -Math.sin(n)), -0.44, 0.8, 0, -0.6); X.cam(-0.05 * Math.abs(Math.sin(n)), 0, Math.sin(n) * 0.04); } },
  cui_chao: { giay: 2.2, bieuCam: true, than: [["cui_chao", 0, 1]], tay(X) { const k = doan(X.p, 0.1, 0.35) * (1 - doan(X.p, 0.7, 0.95)); X.cam(-0.25 * k, -0.6 * k, 0, 0.12 * k); } },
  chong_nanh: { giay: 3.5, bieuCam: true, than: [["chong_nanh", 0, 1]], tay(X) { for (const b of [-1, 1]) X.tay(b, 0.4 * b, -0.42, -0.2, -0.3, -0.6 * b, 0.6 * b); X.cam(0, 0.04, Math.sin(X.t * 0.9) * 0.02); } },
  ngon_cai: { giay: 1.8, bieuCam: true, than: [["ngon_cai", 0, 1]], tay(X) { const n = vom(X.p, 0.25, 0.55); X.tay(1, 0.1, -0.1 + n * 0.03, -0.44, 0.8, 0.3, -1.45); } },
  an_mung: { giay: 2.6, bieuCam: true, than: [["an_mung", 0, 1]], am: [[0.05, "an_mung"]], tay(X) { const b = Math.abs(Math.sin(X.t * 9)); for (const s of [-1, 1]) X.tay(s, 0.24 * s, 0.12 + b * 0.04, -0.42, 1.45, -0.1 * s, 0.2 * s); X.cam(-0.04 * b, 0.12); } },
  // ---------- đứng không: xem điện thoại, đồng hồ, lau mồ hôi, run, ngáp, vươn vai ----------
  xem_dt: { giay: 5, rieng: true, than: [["xem_dt", 0, 1]], am: [[0.2, "bam_dt"], [0.55, "bam_dt"]], tay(X) { X.tay(1, 0.06, -0.12, -0.32, 1.05, 0.3, -PI); X.do(1, "dien_thoai", { cam: true, x: -0.02, y: 0.06, rx: -0.35 }); X.tay(-1, -0.05, -0.2, -0.34, 0.9, -0.5, 1.4); X.cam(0, -0.12); } },
  nhin_dong_ho: { giay: 2.4, rieng: true, than: [["nhin_dong_ho", 0, 1]], tay(X) { X.tay(-1, -0.04, -0.1, -0.3, 1.0, -1.1, 1.2); X.do(-1, "dong_ho", { x: 0, y: 0.0, z: 0.08, rx: 0, ry: 0, rz: 0 }); X.cam(0, -0.18); } },
  lau_mo_hoi: { giay: 2.2, rieng: true, than: [["lau_mo_hoi", 0, 1]], tay(X) { const k = doan(X.p, 0.25, 0.7); X.tay(1, lerp(0.22, -0.1, k), 0.13, -0.13, 1.45, 1.3, -0.3); X.cam(0, -0.06); } },
  run_ray: { giay: 3.2, rieng: true, than: [["run_ray", 0, 1]], tay(X) { const r = Math.sin(X.t * 43) * 0.004; for (const b of [-1, 1]) X.tay(b, 0.1 * b + r, -0.3, -0.24, 0.6, 1.0 * b, -0.6 * b); X.cam(r * 2, -0.12, r * 3); } },
  ngap: { giay: 2.6, rieng: true, than: [["ngap", 0, 1]], am: [[0.15, "ngap"]], tay(X) { const k = vom(X.p, 0.1, 0.9); X.tay(1, lerp(0.15, 0.02, k), lerp(-0.2, -0.13, k), lerp(-0.4, -0.16, k), lerp(0.4, 1.3, k), 0.6, -1.5); X.cam(0, 0.12 * k); } },
  vuon: { giay: 2.6, rieng: true, than: [["vuon", 0, 1]], am: [[0.3, "vu_vu"]], tay(X) { const len = vom(X.p, 0.05, 0.95); for (const b of [-1, 1]) X.tay(b, 0.18 * b, lerp(-0.25, 0.28, len), -0.35, lerp(0.3, 1.5, len), 0, 0); X.cam(0, 0.18 * len); } },
  gai_dau: { giay: 2.2, rieng: true, than: [["gai_dau", 0, 1]], tay(X) { X.tay(1, 0.16 + Math.sin(X.t * 24) * 0.01, 0.1, -0.1, 1.5, 0.9, -1.2); X.cam(0, -0.04, 0.04); } },
  nhap_ly: { giay: 3, rieng: true, ngoi: true, than: [["uong", 0, 1]], am: [[0.45, "uong"]], tay(X) { uongLy(X, "ly", vom(X.p, 0.15, 0.85)); } },
};
// tên hiện trên vòng biểu cảm
export const BIEU_CAM = [["vay", "Vẫy tay"], ["cuoi", "Cười"], ["khoanh_tay", "Khoanh tay"], ["nhun_nhay", "Nhún nhảy"], ["cui_chao", "Cúi chào"], ["chong_nanh", "Chống nạnh"], ["ngon_cai", "Giơ ngón cái"], ["an_mung", "Ăn mừng"]];
// lời đáp của đồng nghiệp khi thấy người chơi làm biểu cảm (Bắc: Thắng, Nhật, Bình; còn lại giọng Nam)
const BAC = new Set(["giam_doc", "truong_phong", "bac_bao_ve"]);
const DAP = {
  vay: { cu: "vay", nam: ["Hế lô!", "Chào nha!", "Ê, chào!", "Vẫy gì vậy, tui đây nè."], bac: ["Chào cậu!", "Ừ, chào.", "Chào cháu!"] },
  cuoi: { cu: "cuoi", nam: ["Cười gì vậy? Kể nghe với!", "Hehe, vui lây.", "Có gì vui hả?"], bac: ["Cười gì mà vui thế?", "Có chuyện gì vui à?"] },
  khoanh_tay: { cu: "nhun_vai", nam: ["Sao mặt căng vậy?", "Ủa, giận ai hả?", "Khoanh tay chi dữ vậy…"], bac: ["Làm gì mà căng thẳng thế?", "Có chuyện gì à?"] },
  nhun_nhay: { cu: "cuoi", nam: ["Nhảy gì vậy trời!", "Quẩy lên!", "Đi Đại Nhạc Hội sớm vậy?"], bac: ["Nhảy nhót gì giờ này?", "Trẻ trâu quá!"] },
  cui_chao: { cu: "gat_dau", nam: ["Dạ, chào!", "Ủa, lễ phép dữ vậy?", "Chào chào."], bac: ["Ừ, chào cháu.", "Lễ phép quá nhỉ!"] },
  chong_nanh: { cu: "ngac_nhien", nam: ["Ơ, tui làm gì sai hả?", "Gì căng vậy má?", "Chống nạnh chi, sợ quá."], bac: ["Gì mà căng thế?", "Định mắng ai đấy?"] },
  ngon_cai: { cu: "ngon_cai", nam: ["Ngon lành!", "Đỉnh nha!", "Ok luôn!"], bac: ["Tốt lắm!", "Được đấy!"] },
  an_mung: { cu: "an_mung", nam: ["Có gì vui vậy? Chia vui với!", "Trúng số hả?", "Yeah!"], bac: ["Có tin gì vui thế?", "Được thưởng à?"] },
};
// người đi đường đáp lại (giọng Nam)
const DAP_PHO = { vay: ["Chào nha!", "Ủa, quen hả ta?"], cuoi: ["Cười gì vậy cưng?"], nhun_nhay: ["Nhảy đẹp đó!", "Trời, giữa đường mà quẩy."], cui_chao: ["Dạ, chào con."], ngon_cai: ["Ok!"], an_mung: ["Gì vui vậy?"], chong_nanh: ["Gì đó?"], khoanh_tay: ["Ủa, sao vậy?"] };

const _v = new THREE.Vector3(), _e = new THREE.Euler(), _q = new THREE.Quaternion(), _q2 = new THREE.Quaternion();

export class HoatAnhNC {
  constructor(g) {
    this.g = g;
    this.hd = null;        // động tác đang làm { loai, def, t, dai, v, onKet, daKet, amI, phan }
    this.camO = { dy: 0, ngua: 0, nghieng: 0, toi: 0 };
    this.tThan = 0;        // đồng hồ riêng của thân (bước đi theo nhịp: chạy / mệt / stress)
    this.tRanh = 0; this.henRanh = 9 + Math.random() * 6;
    this.chuyen = null;    // chuyển vị ngồi xuống / đứng dậy
    this.xoay = null;      // xoay người tại chỗ (góc nhìn 3)
    this.rac = null;       // đang cầm rác (ly, vỏ...) chờ bỏ vào thùng
    this.vongMo = false;
    this.tChao = 0;
    this.denTat = null;    // { het } đèn khu làm việc đang tắt
    // đôi tay góc nhìn 1: nhóm giữ đồ ở lòng bàn tay, đồ cầm theo tên
    const T = g.tay;
    this.fp = { [-1]: { tay: T.trai, giu: new THREE.Group(), do: {}, w: 0 }, [1]: { tay: T.phai, giu: new THREE.Group(), do: {}, w: 0 } };
    for (const b of [-1, 1]) { const f = this.fp[b]; f.giu.position.set(0, 0, -L_TAY); f.tay.add(f.giu); f.muc = { p: new THREE.Vector3(), r: new THREE.Euler(), co: false }; }
    T.sau = (t, dt) => this.sauTay(t, dt);
    this.doThan = {};      // đồ cầm (góc nhìn 3) theo tên
    this.X = this.taoX();
    // màn che mắt (ngủ trưa), đèn flash (chụp ảnh)
    this.manMat = document.createElement("div"); this.manMat.className = "g3d-mat"; g.khung.append(this.manMat);
    this.flash = document.createElement("div"); this.flash.className = "g3d-flash"; g.khung.append(this.flash);
    this.taoVong();
  }

  // ======================= ĐỘNG TÁC DÙNG ĐỒ =======================
  coThe() { return this.g.vai !== "cho" && !!this.g.than.lamCu; }
  // loai: khóa trong HANH_DONG; v: đồ vật (để quay mặt về phía nó); onKet: gọi lúc có kết quả (ăn xong, in xong...)
  // trả về false nếu không làm được (vai chó, đang lái xe): nơi gọi tự xử lý tiếp
  lam(loai, v, onKet, nhin = v?.nhin) {
    const def = HANH_DONG[loai];
    if (!def || !this.coThe() || this.g.xeRieng?.dangLai || this.g.capCuu) return false;
    if (this.hd) this.xong(true);
    if (!def.ngoi && this.g.ngoiGhe && !def.rieng) this.g.dungDay();
    if (!def.ngoi) this.g.boNgoiDat?.(true);
    const g = this.g;
    this.hd = { loai, def, t: 0, dai: def.giay, v, onKet, daKet: false, amI: 0, phanI: 0, yaw0: g.yaw, pitch0: g.pitch };
    // quay mặt về phía đồ vật
    const n = nhin;
    if (n) { const dx = n[0] - g.p.x, dz = n[1] - g.p.z; if (dx * dx + dz * dz > 0.01) { this.hd.yawMuc = Math.atan2(-dx, -dz); this.hd.pitchMuc = n[2] ?? v?.cui ?? -0.12; } }
    this.hd.nhin = n;
    if (v?.them) g.doVatThem?.batDau(v, loai);
    this.tRanh = 0;
    return true;
  }
  khoaDi() { return !!this.hd && !this.hd.def.bieuCam && !this.hd.def.rieng; }
  dangLam() { return !!this.hd; }
  xong(huy = false) {
    const hd = this.hd; if (!hd) return;
    this.hd = null;
    for (const b of [-1, 1]) for (const k in this.fp[b].do) this.fp[b].do[k].visible = false;
    for (const k in this.doThan) this.doThan[k].visible = false;
    if (this.g.than.cu && hd.def.than?.some(([l]) => l === this.g.than.cu.loai)) this.g.than.huyCu?.();
    if (hd.def.nam) this.ketThucNam();
    if (!hd.daKet) { hd.daKet = true; hd.onKet?.(); } // bị ngắt giữa chừng vẫn tính kết quả (đã trả tiền, đã uống)
  }
  // biểu cảm từ vòng biểu cảm
  bieuCam(loai) {
    const g = this.g;
    if (g.vai === "cho") { g.onThongBao?.("Gâu! (vẫy đuôi rối rít)"); return; }
    if (g.khoa || g.capCuu || g.xeRieng?.dangLai) return;
    if (g.ngoiGhe && !["vay", "cuoi", "ngon_cai", "khoanh_tay"].includes(loai)) g.dungDay();
    if (g.ngoiDat) g.boNgoiDat(true);
    this.lam(loai, null, null);
    setTimeout(() => this.dapLai(loai), 650);
  }
  // đồng nghiệp / người đi đường gần nhất đáp lại biểu cảm
  dapLai(loai) {
    const g = this.g; if (g.khoa || g.capCuu) return;
    const d = DAP[loai]; if (!d) return;
    let gan = null, dMin = 7;
    for (const n of g.npc) {
      if (n.tang !== g.tang || !n.nv.group.visible || n.daDoi || n.ngu || n.ma === "cho" || (n._kc ?? 99) >= dMin) continue;
      const q = n.nv.group.position; if (!g.dangThay(n.tang, q.x, q.z)) continue;
      gan = n; dMin = n._kc;
    }
    if (gan) {
      const nv = gan.nv, q = nv.group.position;
      if (!nv.ngoi && !g.doiSong.dangDiBo(gan)) gan.huongMuc = Math.atan2(g.p.x - q.x, g.p.z - q.z);
      if (nv.lamCu) g.doiSong.lamCu(gan, d.cu === "an_mung" && nv.ngoi ? "cuoi" : d.cu);
      g.doiSong.noi(gan, chon(BAC.has(gan.ma) ? d.bac : d.nam), undefined, true);
      return;
    }
    if (g.tang === 0 && !g.oNgoai()) {
      const m = g.troChuyenPho.timGan(g.p.x, g.p.z, 5);
      if (m && m.nv?.lamCu && m.loai !== "xe_om") {
        m.nv.lamCu(d.cu === "an_mung" || d.cu === "ngac_nhien" ? "cuoi" : d.cu);
        g.doiSong.noi(g.troChuyenPho.bocCua(m.nv), chon(DAP_PHO[loai] || ["Hả?"]), undefined, true);
      }
    }
  }

  // ======================= MỖI KHUNG HÌNH =======================
  // trước khi thân cử động: đồng hồ của thân chạy nhanh / chậm theo dáng đi
  nhipThan(dt) {
    const g = this.g, L = window.__L;
    let toc = 1;
    if (g.dangDi) {
      if (g.dangChay) toc = 1.45;
      const nl = this.chiSo("nang_luong"), st = this.chiSo("stress");
      if (nl < 25) toc *= 0.86; else if (st > 70) toc *= 1.12;
      void L;
    }
    this.tThan += dt * toc;
    return this.tThan;
  }
  chiSo(k) { const L = window.__L; const v = L?.v?.(k); return v == null ? 50 : Number(v) || 0; }

  // sau khi thân đã cử động (góc nhìn 3) và camera đã đặt: động tác, dáng đi, xoay tại chỗ, chuyển vị, làm mượt
  sauThan(dt) {
    const g = this.g, T = g.than;
    const hd = this.hd;
    if (hd) this.capNhatHd(dt);
    else this.kiemRanh(dt);
    // đang mở điện thoại trong game: tay cầm điện thoại (góc nhìn 3)
    if ((this._tDT = (this._tDT || 0) - dt) <= 0) {
      this._tDT = 0.4;
      const mo = !!document.querySelector(".dt-lop");
      if (mo && !T.cam && T.lamCu) { T.cam = "dt"; this._camDT = true; } else if (!mo && this._camDT) { if (T.cam === "dt") T.cam = null; this._camDT = false; }
    }
    if (g.capCuu || !T.tayT || g.xeRieng?.dangLai) { for (const k in this.doThan) this.doThan[k].visible = false; return; }
    const ba = g.goc === "3";
    if (ba && !g.ngoiGhe && !g.ngoiDat && !g.nhay) {
      this.dangDi(dt);
      this.xoayTaiCho(dt);
    }
    if (this.chuyen) this.capNhatChuyen(dt);
    if (hd?.def.nam) this.tuTheNam(dt);
    this.doCamThan();
    if (ba) this.lamMuot(T, dt);
    this.datCamera(dt);
  }
  capNhatHd(dt) {
    const g = this.g, hd = this.hd, def = hd.def;
    hd.t += dt;
    const p = Math.min(1, hd.t / hd.dai);
    // quay về phía đồ vật trong 0,35 giây đầu
    if (hd.yawMuc != null && hd.t < 0.5) {
      const k = Math.min(1, dt * 9);
      g.yaw += gocGiua(g.yaw, hd.yawMuc) * k; g.pitch += (hd.pitchMuc - g.pitch) * k;
      if (g.goc === "3" && !g.ngoiGhe) { const r = g.than.group.rotation; r.y += gocGiua(r.y, hd.yawMuc + PI) * k; g.huongThan = r.y; }
    }
    // cử chỉ cả người theo từng đoạn
    const ds = def.than || [];
    while (hd.phanI < ds.length && p >= ds[hd.phanI][1]) {
      const [loai, a, b, bien] = ds[hd.phanI++];
      if (g.than.lamCu && !(g.ngoiGhe && !def.ngoi && !def.bieuCam && !def.rieng)) g.than.lamCu(loai, (b - a) * hd.dai, bien ?? false);
    }
    // âm thanh
    const dsAm = def.am || [];
    while (hd.amI < dsAm.length && p >= dsAm[hd.amI][0]) { const ten = dsAm[hd.amI++][1]; am.phat(ten, hd.nhin?.[0] ?? g.p.x, hd.nhin?.[1] ?? g.p.z); }
    if (!hd.daKet && def.ket != null && p >= def.ket) { hd.daKet = true; hd.onKet?.(); }
    // biểu cảm, đứng chơi: bước đi là thôi
    if ((def.bieuCam || def.rieng) && g.dangDi && !["vay", "ngon_cai", "xem_dt", "nhin_dong_ho", "lau_mo_hoi", "run_ray", "gai_dau"].includes(hd.loai)) { this.xong(true); return; }
    if (def.rieng && !def.ngoi && g.ngoiGhe) { this.xong(true); return; }
    if (hd.t >= hd.dai) this.xong();
  }
  // ----- đôi tay góc nhìn 1 -----
  taoX() {
    const self = this;
    const X = {
      p: 0, t: 0, e: 0, rac: null,
      tay(ben, x, y, z, rx = 0.3, ry = 0, rz = 0) { const m = self.fp[ben].muc; m.p.set(x, y, z); m.r.set(rx, ry, rz); m.co = true; },
      do(ben, ten, o = {}) { if (ten) self.fp[ben].canDo = { ten, o }; },
      cam(dy = 0, ngua = 0, nghieng = 0, toi = 0) { const c = self.camO; c.dy += dy * X.e; c.ngua += ngua * X.e; c.nghieng += nghieng * X.e; c.toi += toi * X.e; },
      an() {},
      flash(luc) { if (!self.hd || self.hd.daFlash || X.p < luc) return; self.hd.daFlash = true; self.flash.classList.remove("on"); void self.flash.offsetWidth; self.flash.classList.add("on"); },
    };
    return X;
  }
  sauTay(t, dt) {
    const hd = this.hd, X = this.X;
    for (const b of [-1, 1]) { this.fp[b].muc.co = false; this.fp[b].canDo = null; }
    const c = this.camO; c.dy = c.ngua = c.nghieng = c.toi = 0;
    let e = 0;
    if (hd && hd.def.tay && this.g.goc === "1") {
      const p = Math.min(1, hd.t / hd.dai);
      e = muot(Math.min(1, hd.t / 0.22)) * muot(Math.min(1, (hd.dai - hd.t) / 0.3));
      X.p = p; X.t = t; X.e = e; X.rac = this.rac?.ten || null;
      hd.def.tay(X);
    } else if (this.rac && this.g.goc === "1" && !this.g.lamViec) { // đang cầm rác: ly / vỏ trên tay phải
      X.e = 1; tayNguc(X, 1, 0); X.do(1, this.rac.ten, LA_DUNG(this.rac.ten) ? { cam: true, x: -0.045 } : {});
      e = 1;
    }
    for (const b of [-1, 1]) {
      const f = this.fp[b], tay = f.tay;
      const muc = f.muc.co ? e : 0;
      f.w += (muc - f.w) * Math.min(1, dt * 14);
      if (f.w > 0.002 && (f.muc.co || f.w > 0.002)) {
        if (f.muc.co) { f.luuP = f.luuP || new THREE.Vector3(); f.luuR = f.luuR || new THREE.Euler(); f.luuP.copy(f.muc.p); f.luuR.copy(f.muc.r); }
        if (f.luuP) {
          // gốc cẳng tay = lòng bàn tay - (cẳng tay xoay theo góc) * L_TAY
          _e.copy(f.luuR); _v.set(0, 0, -L_TAY).applyEuler(_e);
          const w = f.w;
          tay.position.x = lerp(tay.position.x, f.luuP.x - _v.x, w);
          tay.position.y = lerp(tay.position.y, f.luuP.y - _v.y, w);
          tay.position.z = lerp(tay.position.z, f.luuP.z - _v.z, w);
          tay.rotation.set(lerp(tay.rotation.x, f.luuR.x, w), lerp(tay.rotation.y, f.luuR.y, w), lerp(tay.rotation.z, f.luuR.z, w));
        }
      }
      // đồ cầm
      const cd = f.canDo;
      for (const k in f.do) if (!cd || k !== cd.ten) f.do[k].visible = false;
      if (cd) {
        let d = f.do[cd.ten]; if (!d) { d = taoDo(cd.ten); if (!d) continue; f.do[cd.ten] = d; f.giu.add(d); }
        d.visible = true;
        const o = cd.o;
        if (o.cam) { // theo khung nhìn: nghịch đảo xoay của cẳng tay rồi xoay theo góc muốn
          tay.updateMatrix();
          _q.copy(tay.quaternion).invert();
          _e.set(o.rx || 0, o.ry || 0, o.rz || 0); _q2.setFromEuler(_e);
          d.quaternion.copy(_q).multiply(_q2);
          _v.set(o.x || 0, o.y || 0, o.z || 0).applyQuaternion(_q);
          d.position.copy(_v);
        } else { d.position.set(o.x || 0, o.y || 0, o.z || 0); d.rotation.set(o.rx || 0, o.ry || 0, o.rz || 0); }
      }
    }
  }
  datCamera(dt) {
    const g = this.g, c = this.camO;
    if (g.goc !== "1" || g.xeRieng?.dangLai || g.capCuu) return;
    if (!c.dy && !c.ngua && !c.nghieng && !c.toi) return;
    const cam = g.camera;
    cam.position.y += c.dy;
    cam.position.x -= Math.sin(g.yaw) * c.toi; cam.position.z -= Math.cos(g.yaw) * c.toi;
    cam.rotation.x += c.ngua; cam.rotation.z += c.nghieng;
  }
  // ----- đồ cầm (góc nhìn 3) -----
  doCamThan() {
    const g = this.g, T = g.than, hd = this.hd;
    if (!T.giuDo) return;
    let can = null, noi = null;
    if (hd && hd.def.doThan && g.goc === "3") {
      const p = Math.min(1, hd.t / hd.dai);
      for (const [ten, a, b, kieu] of hd.def.doThan) if (p >= a && p <= b) { can = ten; noi = kieu || (LA_DUNG(ten) ? "dung" : "tay"); }
    }
    if (!hd && this.rac && g.goc === "3" && !g.ngoiGhe) { can = this.rac.ten; noi = LA_DUNG(can) ? "dung" : "tay"; }
    for (const k in this.doThan) if (k !== can) this.doThan[k].visible = false;
    if (!can) return;
    let d = this.doThan[can];
    if (!d) {
      d = taoDo(can); if (!d) return; this.doThan[can] = d;
      const cha = noi === "than" ? T.than : noi === "dung" ? T.giuDo.dung : T.giuDo.tay;
      cha.add(d);
      if (noi === "than") { d.position.set(-0.06, 1.05, 0.2); d.rotation.set(0.2, 0, 1.15); d.scale.setScalar(1.0); }
    }
    d.visible = true;
    if (T.giuDo.cu && noi !== "than") { // người khối hộp: đồ gắn vào cả cánh tay (co giãn theo tay): giữ đứng thẳng, đúng cỡ
      const tayP = T.tayP; d.scale.set(1, 1 / Math.max(0.3, tayP.scale.y), 1);
      if (noi === "dung") d.quaternion.copy(tayP.quaternion).invert();
    }
  }

  // ----- dáng đi theo sức, xoay người tại chỗ -----
  dangDi(dt) {
    const g = this.g, T = g.than;
    if (!g.dangDi || T.cu) return;
    const nl = this.chiSo("nang_luong"), st = this.chiSo("stress"), doi = Math.min(this.chiSo("no"), this.chiSo("khat"));
    if (nl < 25 || doi < 15) { // mệt lả: cúi đầu, tay buông thõng ít vung
      T.dau.rotation.x += 0.2;
      for (const t of [T.tayT, T.tayP]) if (!t.userData.coDinh) { t.rotation.x *= 0.5; t.updateMatrix(); }
    } else if (st > 70) { // stress: đi gấp, vung tay mạnh, nhìn thẳng
      for (const t of [T.tayT, T.tayP]) if (!t.userData.coDinh) t.rotation.x *= 1.2;
      T.dau.rotation.x -= 0.05;
    }
  }
  xoayTaiCho(dt) {
    const g = this.g, T = g.than;
    if (g.dangDi || this.hd || T.cu) { this.xoay = null; return; }
    const r = T.group.rotation, muc = g.yaw + PI, d = gocGiua(r.y, muc);
    // camera quay ngang sang một bên (không phải vòng ra trước mặt để ngắm nhân vật) một lúc: bước chân xoay người theo
    if (!this.xoay) {
      const lech = Math.abs(d);
      this._tLech = lech > 1.6 && lech < 2.5 ? (this._tLech || 0) + dt : 0;
      if (this._tLech > 0.6) { this.xoay = { ph: 0 }; this._tLech = 0; }
      return;
    }
    const buoc = Math.sign(d) * Math.min(Math.abs(d), dt * 3.6);
    r.y += buoc; g.huongThan = r.y;
    const x = this.xoay; x.ph += dt * 11;
    const s = Math.sin(x.ph);
    T.chanT.rotation.x = s * 0.28; T.chanP.rotation.x = -s * 0.28;
    if (T.goiT) { T.goiT.rotation.x = Math.max(0, -s) * 0.55; T.goiP.rotation.x = Math.max(0, s) * 0.55; }
    if (Math.abs(d) < 0.12) this.xoay = null;
  }
  // ----- ngồi xuống / đứng dậy: thân trượt từ chỗ cũ tới chỗ mới thay vì nhảy cóc -----
  batChuyen(x0, z0, y0, ngoi) {
    const g = this.g;
    this.chuyen = { t: 0, dai: ngoi ? 0.5 : 0.42, x0, z0, y0, ngoi, yaw0: g.than.group.rotation.y };
  }
  capNhatChuyen(dt) {
    const c = this.chuyen, g = this.g, T = g.than;
    c.t += dt;
    const k = muot(Math.min(1, c.t / c.dai)), lai = 1 - k;
    const gp = T.group.position;
    const yDich = gp.y;
    gp.x += (c.x0 - g.p.x) * lai; gp.z += (c.z0 - g.p.z) * lai;
    // ngồi: hạ dần xuống mặt ghế (thêm khom về trước giữa chừng); đứng: nhổm dần lên
    gp.y = c.y0 + (yDich - c.y0) * k;
    if (!c.ngoi) T.group.rotation.y = c.yaw0 + gocGiua(c.yaw0, T.group.rotation.y) * k;
    if (g.goc === "1") { g.camera.position.x += (c.x0 - g.p.x) * lai; g.camera.position.z += (c.z0 - g.p.z) * lai; }
    if (c.t >= c.dai) this.chuyen = null;
  }
  // ----- ngủ trưa trên ghế lười: ngả người, tay đan trên bụng; màn hình tối dần -----
  tuTheNam(dt) {
    const g = this.g, T = g.than, hd = this.hd, v = hd.v;
    const p = Math.min(1, hd.t / hd.dai), k = doan(p, 0, 0.12) * (1 - doan(p, 0.9, 1));
    const toi = doan(p, 0.18, 0.32) * (1 - doan(p, 0.75, 0.88));
    this.manMat.style.opacity = (toi * (g.goc === "1" ? 0.94 : 0.3)).toFixed(3); // góc nhìn 1: nhắm mắt; góc nhìn 3: chỉ tối đi
    if (g.goc !== "3" || !T.A) return;
    const A = T.A, c = (this._cNam ||= { loai: "nam" });
    const bx = v?.ghe?.[0] ?? g.p.x, bz = v?.ghe?.[1] ?? g.p.z, by = g.tang * 4 + 0.05;
    const gp = T.group.position;
    gp.x = lerp(g.p.x, bx, k); gp.z = lerp(g.p.z, bz, k); gp.y = lerp(gp.y, by, k);
    T.group.rotation.y = lerp(T.group.rotation.y, v?.huongNgoi ?? 0, k);
    // ngồi bệt trên ghế lười: đùi gập, gối hơi co; nửa trên ngả ra sau
    if (!c.goc) c.goc = { thanRx: A.than.rotation.x, thanRy: A.than.rotation.y, thanRz: A.than.rotation.z, thanZ: A.than.position.z, dauZ: A.dau.position.z, tTZ: A.tayT.position.z, tPZ: A.tayP.position.z, chanY: A.chanT.position.y, chanPY: A.chanP.position.y, chanTz: A.chanT.rotation.z, chanPz: A.chanP.rotation.z, chanPy: A.chanP.rotation.y, vayY: A.vayDong ? A.vayDong.position.y : 0, ha: 0 };
    const a = 1.45 * k, kg = A.goiT ? 0.7 * k : 0;
    A.chanT.rotation.x = A.chanP.rotation.x = -a; A.chanT.rotation.z = 0.12 * k; A.chanP.rotation.z = -0.12 * k;
    if (A.goiT) A.goiT.rotation.x = A.goiP.rotation.x = kg;
    const ha = 0.62 * k; c.goc.ha = ha;
    A.chanT.position.y = c.goc.chanY - ha; A.chanP.position.y = c.goc.chanPY - ha;
    for (const o of [A.than, A.dau, A.tayT, A.tayP]) o.position.y -= ha;
    // ngả ra sau quanh hông
    const py = A.hongY - ha, b = -0.75 * k, cb = Math.cos(b), sb = Math.sin(b);
    const xoay = (o, z0) => { const y = o.position.y - py; o.position.y = py + y * cb - z0 * sb; o.position.z = y * sb + z0 * cb; };
    xoay(A.than, c.goc.thanZ); A.than.rotation.x = c.goc.thanRx + b;
    xoay(A.dau, c.goc.dauZ); A.dau.rotation.x += b;
    _q.setFromAxisAngle(_v.set(1, 0, 0), b);
    xoay(A.tayT, c.goc.tTZ); A.tayT.quaternion.premultiply(_q);
    xoay(A.tayP, c.goc.tPZ); A.tayP.quaternion.premultiply(_q);
  }
  ketThucNam() {
    const T = this.g.than; this.manMat.style.opacity = "0";
    if (this._cNam?.goc && T.A) ketThucCuThem(T.A, this._cNam);
    this._cNam = null;
  }

  // ----- làm mượt mọi khớp (không giật khi đổi tư thế) -----
  lamMuot(nv, dt) {
    const s = nv._muot || (nv._muot = { q: [new THREE.Quaternion(), new THREE.Quaternion()], sc: [1, 1], kh: [0, 0], ch: [0, 0, 0, 0], d: [0, 0, 0], ok: false });
    const tays = [nv.tayT, nv.tayP], chans = [nv.chanT, nv.chanP, nv.goiT, nv.goiP];
    if (!s.ok || dt > 0.25) {
      for (let i = 0; i < 2; i++) { s.q[i].copy(tays[i].quaternion); s.sc[i] = tays[i].scale.y; s.kh[i] = tays[i].userData.khuyu || 0; }
      for (let i = 0; i < 4; i++) s.ch[i] = chans[i] ? chans[i].rotation.x : 0;
      s.d[0] = nv.dau.rotation.x; s.d[1] = nv.dau.rotation.y; s.d[2] = nv.dau.rotation.z; s.ok = true; return;
    }
    const k = 1 - Math.exp(-dt * 20);
    for (let i = 0; i < 2; i++) {
      const t = tays[i];
      s.q[i].slerp(t.quaternion, k); t.quaternion.copy(s.q[i]);
      s.sc[i] += (t.scale.y - s.sc[i]) * k; t.scale.y = s.sc[i];
      s.kh[i] += ((t.userData.khuyu || 0) - s.kh[i]) * k; t.userData.khuyu = s.kh[i];
    }
    for (let i = 0; i < 4; i++) { const c = chans[i]; if (!c) continue; s.ch[i] += (c.rotation.x - s.ch[i]) * k; c.rotation.x = s.ch[i]; }
    const d = nv.dau.rotation;
    s.d[0] += (d.x - s.d[0]) * k; s.d[1] += (d.y - s.d[1]) * k; s.d[2] += (d.z - s.d[2]) * k;
    d.set(s.d[0], s.d[1], s.d[2]);
  }
  boMuot(nv) { if (nv?._muot) nv._muot.ok = false; }

  // ----- đứng không lâu: cử chỉ vặt theo tình trạng -----
  kiemRanh(dt) {
    const g = this.g;
    if (g.khoa || g.capCuu || g.dangDi || g.nhay || g.ngoiDat || g.xeRieng?.dangLai || g.vai === "cho" || this.vongMo) { this.tRanh = 0; return; }
    // làm việc ở bàn: lâu lâu nhấp ngụm cà phê
    if (g.ngoiGhe) {
      if (!g.lamViec) { this.tRanh = 0; return; }
      this.tRanh += dt;
      if (this.tRanh > (this._henLV ||= 22 + Math.random() * 14)) { this.tRanh = 0; this._henLV = 0; this.lam("nhap_ly", null, null); }
      return;
    }
    this.tRanh += dt;
    if (this.tRanh < this.henRanh) return;
    this.tRanh = 0; this.henRanh = 10 + Math.random() * 10;
    const nl = this.chiSo("nang_luong"), st = this.chiSo("stress");
    const bt = g.bauTroi, gio = bt?.gio ?? 12, mua = (bt?.tt?.mua || 0) > 0.3, ngoaiTroi = !g.trongNha?.();
    const w = { xem_dt: 2, nhin_dong_ho: 1, vuon: 1, gai_dau: 0.8 };
    if (nl < 30) { w.ngap = 4; w.vuon += 1; }
    if (st > 60 || (ngoaiTroi && gio >= 11 && gio < 15.5 && !mua)) w.lau_mo_hoi = 3;
    if (mua && ngoaiTroi) w.run_ray = 5;
    let tong = 0; for (const k in w) tong += w[k];
    let r = Math.random() * tong, loai = "xem_dt";
    for (const k in w) if ((r -= w[k]) <= 0) { loai = k; break; }
    this.lam(loai, null, null);
  }

  // ======================= ĐỒNG NGHIỆP: NHÌN, CHÀO; LÀM MƯỢT =======================
  capNhatNpc(dt) {
    const g = this.g;
    this.tChao -= dt;
    for (const n of g.npc) {
      const nv = n.nv;
      if (!nv.group.visible || n.tang !== g.tang) { if (nv._muot) nv._muot.ok = false; continue; }
      if ((n._kc ?? 99) < 14 && nv.tayT && !n.ngu) this.lamMuot(nv, dt);
      if (n.ma === "cho" || n.daDoi || n.ngu) continue;
      // nhìn theo người chơi khi đứng / ngồi gần (không đang tán gẫu)
      const gan = (n._kc ?? 99) < 3.4 && !g.doiSong.trongHoi(n) && !g.doiSong.dangDiBo(n) && !g.khoa;
      if (gan) {
        const q = nv.group.position;
        const a = gocGiua(nv.group.rotation.y, Math.atan2(g.p.x - q.x, g.p.z - q.z));
        n.quayMuc = Math.abs(a) < 1.9 ? kep(a, -0.95, 0.95) : 0; n._nhin = true;
        if (!n._chao && this.tChao <= 0 && !nv.cu && Math.abs(a) < 1.2 && !g.ngoiGhe && Math.random() < 0.012) {
          n._chao = true; this.tChao = 7;
          g.doiSong.lamCu(n, nv.ngoi === true ? "gat_dau" : Math.random() < 0.5 ? "vay" : "gat_dau");
        }
      } else if (n._nhin) { n.quayMuc = 0; n._nhin = false; }
      if ((n._kc ?? 99) > 7) n._chao = false;
    }
  }

  // ======================= HỘI THOẠI: NGƯỜI NÓI LÀM CỬ CHỈ THEO CÂU =======================
  cauThoai(ten, laToi, chu) {
    const g = this.g; if (!g || g.capCuu) return;
    const t = String(chu || "").toLowerCase();
    let cu = /cười|haha|hihi|hehe|khà khà/.test(t) ? "cuoi" : /khóc|hu hu|huhu|nức nở|mếu/.test(t) ? "khoc"
      : /thở dài|thở hắt|haizz|hây da|chán quá|mệt quá/.test(t) ? "tho_dai" : /ngáp/.test(t) ? "ngap"
      : /tức|giận|bực|điên tiết|cút|im đi|đồ \w+!|!!/.test(t) ? "gian" : /trời ơi|trời đất|hả\?|cái gì\?|thật hả|thiệt hả|hả!/.test(t) ? "ngac_nhien"
      : /^(ừ|ờ|ừm|dạ|vâng|đúng|ok|được)\b/.test(t) ? "gat_dau" : /^(không|hông|thôi|chịu|đâu có)\b/.test(t) ? "lac_dau"
      : /chào|xin chào|hế lô/.test(t) ? "vay" : /\?\s*$/.test(t) ? (Math.random() < 0.45 ? "nhun_vai" : "noi") : "noi";
    if (laToi) {
      if (g.goc === "3" && g.than.lamCu && g.vai !== "cho") g.than.lamCu(cu === "vay" && g.ngoiGhe ? "noi" : cu);
      return;
    }
    const n = g.npc.find(x => x.nv.group.visible && x.tang === g.tang && g.tenCua(x.ma) === ten && (x._kc ?? 99) < 12);
    if (!n || !n.nv.lamCu || n.ma === "cho") return;
    if (n.nv.ngoi && (cu === "gian" || cu === "vay")) cu = cu === "gian" ? "lac_dau" : "noi";
    n.nv.lamCu(cu);
  }

  // ======================= RÁC TRÊN TAY =======================
  camRac(ten) { this.rac = { ten, het: this.g.t + 240 }; }
  boRac() { this.rac = null; }
  capNhatRac() { if (this.rac && this.g.t > this.rac.het) this.rac = null; }

  // ======================= VÒNG BIỂU CẢM =======================
  taoVong() {
    const g = this.g;
    const el = document.createElement("div"); el.className = "g3d-bieucam"; el.hidden = true;
    const vong = document.createElement("div"); vong.className = "bc-vong"; el.append(vong);
    this.nutVong = BIEU_CAM.map(([loai, ten], i) => {
      const b = document.createElement("button"); b.type = "button"; b.className = "bc-nut";
      const a = -90 + i * 45; b.style.setProperty("--a", a + "deg");
      b.innerHTML = `<kbd>${i + 1}</kbd><span>${ten}</span>`;
      b.addEventListener("click", e => { e.stopPropagation(); this.chonVong(i); });
      b.addEventListener("pointerenter", () => this.toVong(i));
      vong.append(b); return b;
    });
    const giua = document.createElement("div"); giua.className = "bc-giua"; giua.textContent = "Biểu cảm"; vong.append(giua);
    el.addEventListener("click", () => this.dongVong());
    g.khung.append(el); this.vongEl = el;
    this._phim = e => {
      if (!this.vongMo) return;
      const so = /^Digit([1-8])$/.exec(e.code)?.[1];
      if (so) { e.preventDefault(); e.stopPropagation(); this.chonVong(+so - 1); }
      else if (e.code === "Escape") { e.preventDefault(); this.dongVong(); }
    };
    this._bam = e => { if (this.vongMo && document.pointerLockElement && e.button === 0) { e.preventDefault(); e.stopPropagation(); if (this.chonI >= 0) this.chonVong(this.chonI); else this.dongVong(); } };
    addEventListener("keydown", this._phim, true); document.addEventListener("mousedown", this._bam, true);
  }
  moVong() {
    const g = this.g;
    if (this.vongMo || g.khoa || g.capCuu || g.onChoPhep?.() === false) return;
    this.vongMo = true; this.vongEl.hidden = false; this.chonI = -1; this._dx = 0; this._dy = 0; this._tMo = performance.now();
    for (const b of this.nutVong) b.classList.remove("chon");
    g.phim = {}; if (g.stick) g.stick.x = g.stick.y = 0;
  }
  dongVong() { this.vongMo = false; this.vongEl.hidden = true; }
  toVong(i) { this.chonI = i; this.nutVong.forEach((b, k) => b.classList.toggle("chon", k === i)); }
  chonVong(i) { const loai = BIEU_CAM[i]?.[0]; this.dongVong(); if (loai) this.bieuCam(loai); }
  // giữ G: rê chuột chọn, thả G là làm; bấm nhanh G: vòng mở sẵn, chọn bằng chuột / số / bấm lại G để đóng
  phimG(xuong) {
    if (xuong) { if (this.vongMo) { if (performance.now() - this._tMo > 300) this.dongVong(); return; } this.moVong(); return; }
    if (!this.vongMo) return;
    if (this.chonI >= 0 && performance.now() - this._tMo > 220) this.chonVong(this.chonI);
  }
  chuotVong(dx, dy) {
    this._dx = kep(this._dx + dx, -120, 120); this._dy = kep(this._dy + dy, -120, 120);
    if (Math.hypot(this._dx, this._dy) < 28) return;
    const a = Math.atan2(this._dy, this._dx) * 180 / PI; // 0 = phải, -90 = trên
    const i = ((Math.round((a + 90) / 45) % 8) + 8) % 8;
    if (i !== this.chonI) this.toVong(i);
  }

  // ======================= ĐÈN KHU LÀM VIỆC =======================
  doiDen() {
    const g = this.g;
    if (this.denTat) { this.denTat = null; return "bat"; }
    this.denTat = { het: g.t + 28, daNoi: false };
    return "tat";
  }
  // độ sáng trong nhà ở chỗ người chơi (1: bình thường)
  doSang(trong) {
    const d = this.denTat, g = this.g; if (!d) return 1;
    if (g.t > d.het) {
      this.denTat = null;
      const n = g.npc.find(x => x.tang === 0 && x.nv.group.visible && !x.daDoi && (x._kc ?? 99) < 16 && x.nv.group.position.x < -2 && x.nv.group.position.z > -2);
      if (n) { g.doiSong.noi(n, BAC.has(n.ma) ? "Ai tắt đèn thế? Bật lại đây." : "Ai tắt đèn vậy trời? Bật lại nè.", undefined, true); g.doiSong.lamCu(n, "lac_dau"); }
      am.phat("cong_tac", -2.6, 8.4);
      return 1;
    }
    if (!d.daNoi && g.t > d.het - 24) {
      d.daNoi = true;
      const n = g.npc.find(x => x.tang === 0 && x.nv.group.visible && !x.daDoi && (x._kc ?? 99) < 14 && x.nv.group.position.x < -2 && x.nv.group.position.z > -2);
      if (n) { g.doiSong.noi(n, BAC.has(n.ma) ? "Ơ, mất điện à?" : chon(["Ủa, cúp điện hả?", "Ai tắt đèn vậy? Tối thui!", "Ê, đang làm mà!"]), undefined, true); g.doiSong.lamCu(n, "ngac_nhien"); }
    }
    return trong && g.tang === 0 && g.p.x < -2 && g.p.z > -2.2 ? 0.45 : 1;
  }

  huy() {
    removeEventListener("keydown", this._phim, true); document.removeEventListener("mousedown", this._bam, true);
    if (this.g.tay) this.g.tay.sau = null;
  }
}
