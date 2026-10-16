// Chi tiết bên trong tòa nhà G-Entertainment cho giống ngoài đời:
// cửa sổ có khung (kính đổi màu theo giờ), cửa đi tự mở khi có người tới gần, cửa kính trượt ở sảnh, thang máy,
// màn hình máy tính hiện đúng việc của chủ bàn, đồ trên bàn theo tính cách, đồ treo tường (tranh, bảng tin,
// PCCC, lối thoát hiểm, ổ cắm, công tắc, máy lạnh, đồng hồ chạy theo giờ trong game, camera, len chân tường, khung cửa),
// pantry đầy đủ đồ, sân thượng của bác Bình.
// Khối tĩnh được thêm vào nhóm mà gopKhoi gộp lại; chữ và hình vẽ dồn vào hai tấm ảnh ghép (atlas) để ít lượt vẽ.
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";
import { am } from "../am-thanh-game.js";
import { mergeGeometries } from "three/addons/utils/BufferGeometryUtils.js";
import { cheDoNhe } from "../cai-dat.js";

const CAO = 4, TC = 3.82, NUA = 0.125;
const FONT = "'Be Vietnam Pro', system-ui, sans-serif";

// ================= ẢNH GHÉP (ATLAS) =================
class Atlas {
  // máy yếu: ảnh ghép vẽ ở nửa độ phân giải (toạ độ xếp chỗ vẫn tính theo kích thước gốc) cho đỡ tốn bộ nhớ
  constructor(w, h, tiLe = cheDoNhe() ? 0.5 : 1) {
    this.w = w; this.h = h; this.s = tiLe;
    this.c = document.createElement("canvas"); this.c.width = Math.round(w * tiLe); this.c.height = Math.round(h * tiLe);
    this.g = this.c.getContext("2d"); this.g.scale(tiLe, tiLe); this.ke = []; this.day = 0; this.vung = new Map();
  }
  // xếp theo kệ: chọn kệ có chiều cao vừa nhất còn chỗ, không có thì mở kệ mới
  lay(ten, w, h, ve) {
    if (this.vung.has(ten)) return this.vung.get(ten);
    const P = 4, W = this.w, H = this.h, e = 0.5 / this.s;
    let ke = null;
    for (const k of this.ke) if (k.h >= h && k.x + w <= W && (!ke || k.h < ke.h)) ke = k;
    if (!ke) { if (this.day + h > H) { console.warn("Ảnh ghép đầy, bỏ:", ten); return this.vung.values().next().value; } ke = { y: this.day, h, x: 0 }; this.ke.push(ke); this.day += h + P; }
    const x = ke.x, y = ke.y; ke.x += w + P;
    const g = this.g; g.save(); g.translate(x, y); g.beginPath(); g.rect(0, 0, w, h); g.clip(); ve(g, w, h); g.restore();
    const uv = { u0: (x + e) / W, u1: (x + w - e) / W, v0: 1 - (y + h - e) / H, v1: 1 - (y + e) / H };
    this.vung.set(ten, uv); return uv;
  }
}
// chữ một dòng tự co cho vừa (luôn truyền độ rộng tối đa vì canvas ảnh ghép rất rộng)
function chu(g, s, x, y, maxW, co, mau = "#222", dam = 700, canh = "left", font = FONT) {
  g.fillStyle = mau; g.textAlign = canh; g.textBaseline = "middle";
  let c = co; g.font = `${dam} ${c}px ${font}`;
  while (g.measureText(s).width > maxW && c > 6) { c -= 1; g.font = `${dam} ${c}px ${font}`; }
  g.fillText(s, x, y, maxW);
}
// đoạn văn tự xuống dòng, trả về y dòng kế tiếp
function doan(g, s, x, y, maxW, co, mau = "#222", dam = 500, dong = co * 1.25) {
  g.fillStyle = mau; g.textAlign = "left"; g.textBaseline = "top"; g.font = `${dam} ${co}px ${FONT}`;
  let hang = "";
  for (const t of s.split(" ")) {
    const thu = hang ? hang + " " + t : t;
    if (g.measureText(thu).width > maxW && hang) { g.fillText(hang, x, y, maxW); hang = t; y += dong; } else hang = thu;
  }
  if (hang) { g.fillText(hang, x, y, maxW); y += dong; }
  return y;
}
const R = (g, x, y, w, h, c) => { g.fillStyle = c; g.fillRect(x, y, w, h); };
const RR = (g, x, y, w, h, r, c) => { g.fillStyle = c; g.beginPath(); g.roundRect(x, y, w, h, r); g.fill(); };
const tron = (g, x, y, r, c) => { g.fillStyle = c; g.beginPath(); g.arc(x, y, r, 0, Math.PI * 2); g.fill(); };
const ngauNhien = s => () => (s = (s * 16807) % 2147483647) / 2147483647;

// ---------- Nội dung màn hình (256 x 144) ----------
const thanhCuaSo = (g, w, ten, mau = "#2b2f38", chuMau = "#fff") => { R(g, 0, 0, w, 16, mau); chu(g, ten, 6, 8, w - 50, 10, chuMau, 600); for (let i = 0; i < 3; i++) tron(g, w - 10 - i * 11, 8, 3.5, ["#ff5f57", "#febc2e", "#28c840"][i]); };
const MAN = {
  mac_dinh: (g, w, h) => { const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#2fa39a"); gr.addColorStop(1, "#22305a"); g.fillStyle = gr; g.fillRect(0, 0, w, h); chu(g, "G-ENTERTAINMENT", w / 2, h / 2, w - 30, 22, "#fff", 800, "center"); R(g, 0, h - 14, w, 14, "rgba(0,0,0,.45)"); },
  // Rắn Độc: nhóm chat nội bộ
  ran_doc: (g, w, h) => {
    R(g, 0, 0, w, h, "#e9eef5"); R(g, 0, 0, w, 20, "#0a68ff"); chu(g, "Zola · Hội Bà Tám G-Ent (23)", 8, 10, w - 16, 11, "#fff", 700);
    R(g, 0, 20, 62, h - 20, "#fff");
    ["#f26fa6", "#e8702a", "#2fa39a", "#7b4bb3", "#d8c93a"].forEach((c, i) => { tron(g, 12, 32 + i * 22, 7, c); R(g, 23, 28 + i * 22, 32, 4, "#c9d2de"); R(g, 23, 35 + i * 22, 22, 3, "#e0e6ee"); });
    const tin = [["Ai biết vụ phòng giám đốc chưa?", 0], ["Tin nóng: lương về trễ 2 ngày", 1], ["Nghe nói sắp có biến lớn...", 0], ["Đừng nói ai nha, xóa liền", 1]];
    tin.forEach(([s, ta], i) => { const x = ta ? 100 : 68; RR(g, x, 26 + i * 27, 150, 21, 6, ta ? "#d4e6ff" : "#fff"); chu(g, s, x + 6, 36.5 + i * 27, 138, 10, "#1c2533", 500); });
    chu(g, "Đã xem: 22 người", w - 8, h - 6, 100, 8, "#7a8494", 500, "right");
  },
  // Thánh Hóng: mạng xã hội
  hong_hot: (g, w, h) => {
    R(g, 0, 0, w, h, "#eef0f4"); R(g, 0, 0, w, 20, "#3b5ba8"); chu(g, "Phây-búc", 8, 10, 80, 13, "#fff", 800); RR(g, 90, 4, 120, 12, 6, "#2f4a8a"); chu(g, "Tìm kiếm chuyện người khác", 96, 10, 110, 8, "#c8d2ea", 500);
    RR(g, 40, 26, 176, 112, 6, "#fff"); tron(g, 54, 40, 8, "#d8c93a"); chu(g, "Ngân đã chia sẻ 47 bài viết", 66, 37, 140, 10, "#1c2533", 700); chu(g, "2 phút trước", 66, 47, 80, 8, "#8a93a3", 500);
    const gr = g.createLinearGradient(48, 56, 208, 112); gr.addColorStop(0, "#f26fa6"); gr.addColorStop(1, "#ffd166"); g.fillStyle = gr; g.fillRect(48, 56, 160, 58);
    chu(g, "BIẾN CĂNG Ở QUẬN HÓNG", 128, 85, 150, 14, "#fff", 800, "center");
    chu(g, "1,2K thích · 384 bình luận · 97 chia sẻ", 48, 126, 160, 8, "#5a6475", 600);
  },
  // Chúa Tể Deadline: bảng tiến độ
  chua_te_deadline: (g, w, h) => {
    R(g, 0, 0, w, h, "#fff"); thanhCuaSo(g, w, "Tiến độ dự án - ĐẠI NHẠC HỘI 31/10");
    const viec = [["MV Siêu Nhân Hồng", "HÔM QUA", 0.9], ["Poster sân khấu", "TRỄ 3 NGÀY", 0.6], ["Kịch bản MC", "TRỄ 5 NGÀY", 0.3], ["Thuê âm thanh", "CHƯA AI LÀM", 0.05], ["Họp chốt", "ĐANG HỌP", 1]];
    viec.forEach(([t, tt, p], i) => { const y = 22 + i * 23; R(g, 0, y + 18, w, 1, "#e3e6ea"); chu(g, t, 6, y + 9, 90, 10, "#222", 600); R(g, 100, y + 4, 90, 10, "#f0f1f3"); R(g, 100, y + 4, 90 * p, 10, p > 0.8 ? "#e8702a" : "#c0262d"); chu(g, tt, w - 4, y + 9, 60, 8, "#c0262d", 800, "right"); });
    R(g, 0, h - 14, w, 14, "#c0262d"); chu(g, "CÒN 15 NGÀY · TRỄ 47 VIỆC", w / 2, h - 7, w - 10, 9, "#fff", 800, "center");
  },
  // Thực Tập Sinh: video học Excel
  thuc_tap_sinh: (g, w, h) => {
    R(g, 0, 0, w, h, "#0f0f0f"); R(g, 0, 0, w, 16, "#202020"); RR(g, 6, 4, 18, 9, 2, "#ff2a2a"); chu(g, "Diu-túp", 28, 8, 60, 10, "#fff", 800);
    const gr = g.createLinearGradient(0, 16, 0, 112); gr.addColorStop(0, "#1f6f43"); gr.addColorStop(1, "#14482c"); g.fillStyle = gr; g.fillRect(10, 20, 236, 90);
    for (let r = 0; r < 5; r++) for (let c = 0; c < 6; c++) { g.strokeStyle = "rgba(255,255,255,.35)"; g.strokeRect(20 + c * 36, 30 + r * 14, 36, 14); }
    tron(g, 128, 66, 14, "rgba(0,0,0,.6)"); g.fillStyle = "#fff"; g.beginPath(); g.moveTo(123, 58); g.lineTo(123, 74); g.lineTo(136, 66); g.fill();
    R(g, 10, 110, 236, 3, "#555"); R(g, 10, 110, 70, 3, "#ff2a2a");
    chu(g, "Học Excel trong 5 phút (cho người 30 tuổi)", 10, 124, 236, 10, "#fff", 700); chu(g, "12 Tr lượt xem · Đang xem lần thứ 9", 10, 137, 236, 8, "#aaa", 500);
  },
  // Biên Kịch: soạn kịch bản
  bien_kich: (g, w, h) => {
    R(g, 0, 0, w, h, "#d9dde3"); thanhCuaSo(g, w, "Kich_ban_MV_ban_nhap_17.doc", "#2a5aa8");
    R(g, 40, 20, 176, 124, "#fff");
    chu(g, "KỊCH BẢN MV - BẢN NHÁP 17", 128, 30, 160, 10, "#111", 800, "center");
    let y = 40; y = doan(g, "CẢNH 1. SÂN THƯỢNG - ĐÊM", 50, y, 156, 8, "#111", 700);
    y = doan(g, "Gió thổi. Siêu Nhân Hồng nhìn xa xăm.", 50, y + 2, 156, 8, "#333");
    y = doan(g, "SIÊU NHÂN HỒNG: Một triệu người theo dõi... hay một người hiểu mình?", 58, y + 2, 148, 8, "#333", 600);
    y = doan(g, "(Ghi chú của sếp: thêm cảnh quảng cáo trà sữa vào đây)", 50, y + 2, 156, 8, "#c0262d", 500);
    g.fillStyle = "#111"; g.fillRect(50, y + 3, 1, 9);
  },
  // Designer: phần mềm thiết kế
  designer: (g, w, h) => {
    R(g, 0, 0, w, h, "#2b2b2f"); R(g, 0, 0, w, 14, "#1d1d20"); chu(g, "Logo_final_FINAL_v9_sua_lan_cuoi.png", 6, 7, 200, 8, "#ddd", 500);
    R(g, 0, 14, 20, h - 14, "#1d1d20"); for (let i = 0; i < 7; i++) RR(g, 4, 19 + i * 16, 12, 12, 2, i === 2 ? "#3fa8ff" : "#444");
    R(g, 196, 14, 60, h - 14, "#1d1d20"); ["Lớp 1", "Logo to", "Logo nhỏ", "Nền"].forEach((s, i) => { R(g, 199, 20 + i * 16, 54, 13, i === 1 ? "#3a4a66" : "#2b2b2f"); chu(g, s, 203, 26.5 + i * 16, 48, 8, "#ccc", 500); });
    for (let i = 0; i < 6; i++) R(g, 200 + (i % 3) * 18, 92 + Math.floor(i / 3) * 18, 14, 14, ["#e74c3c", "#e8702a", "#f1c40f", "#2ecc71", "#3498db", "#9b59b6"][i]);
    R(g, 32, 24, 152, 108, "#f4f4f4");
    ["#e74c3c", "#e8702a", "#f1c40f", "#2ecc71", "#3498db", "#9b59b6"].forEach((c, i) => { g.strokeStyle = c; g.lineWidth = 6; g.beginPath(); g.arc(108, 72, 38 - i * 6, 0.3, 5.9); g.stroke(); });
    g.strokeStyle = "#3fa8ff"; g.lineWidth = 1; g.setLineDash([3, 2]); g.strokeRect(64, 30, 88, 84); g.setLineDash([]);
    chu(g, "TO HƠN NHƯNG NHỎ LẠI?", 108, 124, 140, 8, "#c0262d", 800, "center");
  },
  // Sales: phần mềm khách hàng
  sales: (g, w, h) => {
    R(g, 0, 0, w, h, "#f6f7f9"); R(g, 0, 0, w, 20, "#d8262f"); chu(g, "CRM Nói Là Làm · Khách hàng tiềm năng", 8, 10, w - 16, 10, "#fff", 700);
    const kh = [["Cty Bánh Tráng Trộn", "Không nghe máy"], ["Shop Trà Sữa Mây", "Hẹn tuần sau"], ["Đại lý Nón Bảo Hiểm", "Đã chặn số"], ["Chị Tư Bán Ốc", "CHỐT RỒI (chắc vậy)"]];
    kh.forEach(([a, b], i) => { const y = 24 + i * 19; R(g, 6, y, 244, 17, i % 2 ? "#fff" : "#eef0f4"); chu(g, a, 10, y + 8.5, 120, 9, "#222", 600); chu(g, b, 246, y + 8.5, 110, 9, i === 3 ? "#2e8b57" : "#c0262d", 700, "right"); });
    chu(g, "KPI THÁNG 10", 10, 110, 80, 9, "#222", 800); R(g, 90, 104, 150, 12, "#e3e6ea"); R(g, 90, 104, 150, 12, "#2e8b57"); chu(g, "300%", 165, 110, 60, 9, "#fff", 800, "center");
    chu(g, "(trên giấy)", 246, 130, 100, 9, "#8a93a3", 600, "right");
  },
  // Dân Đầu Tư: biểu đồ nến
  dan_dau_tu: (g, w, h) => {
    R(g, 0, 0, w, h, "#11151c"); chu(g, "VN-INDÉCH  1.012,4  -4,7%", 6, 9, 170, 10, "#ff4d4d", 800); chu(g, "TÀI KHOẢN: -38%", w - 6, 9, 90, 9, "#ff4d4d", 800, "right");
    g.strokeStyle = "#232a36"; for (let i = 0; i < 5; i++) { g.beginPath(); g.moveTo(0, 26 + i * 24); g.lineTo(w, 26 + i * 24); g.stroke(); }
    const rnd = ngauNhien(77); let y = 40;
    for (let i = 0; i < 26; i++) { const len = (rnd() - 0.35) * 14, x = 6 + i * 9.6, y2 = y + len; const xanh = len < 0; g.fillStyle = xanh ? "#2ecc71" : "#ff4d4d"; g.fillRect(x + 3, Math.min(y, y2) - 5, 1, Math.abs(len) + 10); g.fillRect(x, Math.min(y, y2), 7, Math.max(2, Math.abs(len))); y = Math.min(124, y2); }
    chu(g, "Gồng thêm chút nữa là về bờ", w - 6, h - 8, 160, 9, "#ffd166", 600, "right");
  },
  // Thánh Xin Nghỉ: lướt video ngắn
  thanh_xin_nghi: (g, w, h) => {
    R(g, 0, 0, w, h, "#000"); const gr = g.createLinearGradient(0, 0, 0, h); gr.addColorStop(0, "#ff5fa2"); gr.addColorStop(1, "#5b2a86"); g.fillStyle = gr; g.fillRect(88, 0, 80, h);
    tron(g, 128, 56, 18, "#ffe0c2"); R(g, 112, 74, 32, 40, "#2fa39a"); R(g, 118, 50, 6, 3, "#222"); R(g, 132, 50, 6, 3, "#222");
    chu(g, "@meoluoibieng", 92, 122, 70, 8, "#fff", 700); chu(g, "Cách xin nghỉ mà sếp còn cảm ơn", 92, 134, 74, 7, "#fff", 500);
    ["98K", "4K", "12K"].forEach((s, i) => { tron(g, 160, 64 + i * 22, 6, "#fff"); chu(g, s, 160, 75 + i * 22, 30, 7, "#fff", 700, "center"); });
    chu(g, "Tóp-tóp", 8, 12, 70, 13, "#fff", 800); chu(g, "Đang xem: video thứ 214", 8, h - 10, 78, 8, "#888", 500);
    chu(g, "Dành cho bạn", w - 8, 12, 80, 9, "#fff", 700, "right");
  },
  // Con Ông Cháu Cha: trang cá nhân
  con_ong_chau_cha: (g, w, h) => {
    R(g, 0, 0, w, h, "#eef0f4"); R(g, 0, 0, w, 16, "#3b5ba8"); chu(g, "Phây-búc", 6, 8, 60, 10, "#fff", 800);
    const gr = g.createLinearGradient(0, 16, w, 60); gr.addColorStop(0, "#1c1c1f"); gr.addColorStop(1, "#d8b45a"); g.fillStyle = gr; g.fillRect(0, 16, w, 44);
    tron(g, 40, 62, 18, "#fff"); tron(g, 40, 62, 15, "#3a3a3f"); R(g, 32, 56, 16, 4, "#111");
    chu(g, "Long Lê (Phó phòng Marketing)", 64, 70, 186, 11, "#1c2533", 800);
    RR(g, 10, 86, 236, 52, 5, "#fff"); chu(g, "Check-in tại Sky Ảo Lounge cùng 2 người khác", 16, 96, 224, 9, "#1c2533", 600);
    chu(g, "\"Thành công không đến từ may mắn. Cảm ơn chú.\"", 16, 112, 224, 9, "#333", 500); chu(g, "2,3K thích · 12 bình luận (đều là nhân viên)", 16, 128, 224, 8, "#5a6475", 500);
  },
  // Kế toán: bảng lương
  ke_toan: (g, w, h) => {
    R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 16, "#1f7a45"); chu(g, "Bang_luong_T10_MAT.xlsx", 6, 8, 180, 9, "#fff", 700);
    R(g, 0, 16, w, 12, "#eef3ef"); ["", "A", "B", "C", "D"].forEach((s, i) => chu(g, s, 30 + i * 48, 22, 40, 8, "#555", 600, "center"));
    const dong = [["Họ tên", "Lương", "Phạt", "Thực nhận"], ["Duy", "4.000.000", "150.000", "3.850.000"], ["Sơn", "13.000.000", "2.600.000", "10.400.000"], ["Long", "25.000.000", "0", "25.000.000"], ["Ngân", "13.000.000", "500.000", "12.500.000"], ["Tổng", "...", "...", "chờ sếp ký"]];
    dong.forEach((d, r) => { const y = 28 + r * 16; R(g, 0, y + 15, w, 1, "#d6dbd7"); chu(g, String(r + 1), 8, y + 8, 14, 8, "#888", 500, "center"); d.forEach((s, c) => { chu(g, s, 24 + c * 58, y + 8, 54, 8, r === 0 ? "#1f7a45" : r === 5 ? "#c0262d" : "#222", r === 0 || r === 5 ? 800 : 500); }); });
    for (let c = 0; c < 5; c++) R(g, 20 + c * 58, 16, 1, h - 16, "#d6dbd7");
    R(g, 20, 44, 58, 16, "rgba(31,122,69,.18)"); g.strokeStyle = "#1f7a45"; g.lineWidth = 2; g.strokeRect(20, 44, 58, 16);
  },
  // HR: biểu mẫu
  hr: (g, w, h) => {
    R(g, 0, 0, w, h, "#e7ecef"); thanhCuaSo(g, w, "Hệ thống Nhân sự - Hồ sơ nghỉ phép", "#2fa39a");
    R(g, 20, 22, 216, 118, "#fff"); chu(g, "ĐƠN XIN NGHỈ PHÉP · Mẫu 07", 128, 32, 200, 10, "#111", 800, "center");
    [["Họ tên:", "Sơn"], ["Lý do:", "Bà ngoại ốm (lần 14)"], ["Số ngày:", "3"], ["Người duyệt:", "Sếp (đang đi đánh golf)"]].forEach(([a, b], i) => { chu(g, a, 30, 50 + i * 16, 60, 9, "#555", 600); R(g, 92, 56 + i * 16, 130, 1, "#ccc"); chu(g, b, 94, 50 + i * 16, 128, 9, "#1f4fa8", 600); });
    g.save(); g.translate(176, 120); g.rotate(-0.25); g.strokeStyle = "#c0262d"; g.lineWidth = 3; g.strokeRect(-36, -11, 72, 22); chu(g, "TỪ CHỐI", 0, 0, 66, 13, "#c0262d", 800, "center"); g.restore();
  },
  // Editor: phần mềm dựng phim (3 màn hình)
  edit_timeline: (g, w, h) => {
    R(g, 0, 0, w, h, "#1e1f24"); R(g, 4, 4, 120, 68, "#000"); const gr = g.createLinearGradient(4, 4, 124, 72); gr.addColorStop(0, "#f26fa6"); gr.addColorStop(1, "#22305a"); g.fillStyle = gr; g.fillRect(8, 8, 112, 60);
    tron(g, 64, 34, 10, "#ff8ac0"); R(g, 58, 44, 12, 20, "#ff8ac0"); R(g, 130, 4, 122, 68, "#26272d"); ["MV_Hong_cut12.mp4", "B-roll_san_thuong", "Nhac_nen_v3.wav", "Logo_mo_dau"].forEach((s, i) => chu(g, s, 134, 12 + i * 14, 116, 8, "#bbb", 500));
    R(g, 0, 78, w, 1, "#444"); for (let i = 0; i < 4; i++) { R(g, 0, 84 + i * 14, 30, 12, "#2b2c33"); chu(g, ["V2", "V1", "A1", "A2"][i], 15, 90 + i * 14, 24, 8, "#ccc", 600, "center"); }
    const rnd = ngauNhien(31); for (let i = 0; i < 4; i++) { let x = 32; while (x < w) { const l = 14 + rnd() * 40; R(g, x, 85 + i * 14, l - 2, 10, ["#7b4bb3", "#3fa8ff", "#2ecc71", "#2fa39a"][i]); x += l; } }
    R(g, 150, 80, 1.5, 60, "#ff3b3b");
  },
  edit_render: (g, w, h) => {
    R(g, 0, 0, w, h, "#1e1f24"); thanhCuaSo(g, w, "Xuất video - MV_Sieu_Nhan_Hong_FINAL", "#2b2c33");
    chu(g, "Đang render...", 20, 40, 200, 13, "#fff", 700); R(g, 20, 56, 216, 14, "#333"); R(g, 20, 56, 210, 14, "#3fa8ff"); chu(g, "97%", 128, 63, 40, 9, "#fff", 800, "center");
    chu(g, "Thời gian còn lại: 9 giờ 47 phút", 20, 84, 216, 10, "#ccc", 500); chu(g, "Đừng tắt máy. Đừng rút điện. Đừng thở mạnh.", 20, 102, 216, 9, "#ffd166", 600);
    chu(g, "Đã thử 6 lần · Lần trước mất điện ở 99%", 20, 122, 216, 8, "#888", 500);
  },
  edit_mau: (g, w, h) => {
    R(g, 0, 0, w, h, "#16171b"); R(g, 4, 4, 160, 90, "#000"); const gr = g.createLinearGradient(4, 4, 164, 94); gr.addColorStop(0, "#ffd166"); gr.addColorStop(0.5, "#f26fa6"); gr.addColorStop(1, "#7b4bb3"); g.fillStyle = gr; g.fillRect(6, 6, 156, 86);
    chu(g, "CÔNG VIÊN · 2015 (BẢN PHỐI LẠI)", 84, 84, 150, 8, "#fff", 700, "center");
    for (let i = 0; i < 3; i++) { R(g, 170, 6 + i * 30, 80, 26, "#222"); g.strokeStyle = ["#ff4d4d", "#2ecc71", "#3fa8ff"][i]; g.beginPath(); for (let x = 0; x < 80; x += 4) g.lineTo(170 + x, 30 + i * 30 - Math.abs(Math.sin(x * 0.11 + i)) * 20); g.stroke(); }
    for (let i = 0; i < 3; i++) { tron(g, 40 + i * 70, 118, 18, "#2a2b30"); tron(g, 40 + i * 70 + (i - 1) * 4, 116, 3, "#fff"); }
  },
  // Trưởng Phòng Họp: lịch tuần kín cuộc họp
  truong_phong: (g, w, h) => {
    R(g, 0, 0, w, h, "#fff"); thanhCuaSo(g, w, "Lịch tuần này - Trưởng phòng Sản xuất", "#b39d72");
    ["T2", "T3", "T4", "T5", "T6"].forEach((s, i) => { chu(g, s, 30 + i * 48, 24, 40, 9, "#555", 700, "center"); R(g, 8 + i * 48, 30, 1, h - 30, "#e3e6ea"); });
    const rnd = ngauNhien(5);
    for (let d = 0; d < 5; d++) for (let k = 0; k < 4; k++) { const y = 32 + k * 27; RR(g, 10 + d * 48, y, 44, 24, 3, ["#3fa8ff", "#e8702a", "#7b4bb3", "#2fa39a"][(d + k) % 4]); chu(g, ["Họp", "Họp tiếp", "Họp về họp", "Họp chốt"][Math.floor(rnd() * 4)], 32 + d * 48, y + 12, 40, 8, "#fff", 700, "center"); }
  },
  // IT: cửa sổ dòng lệnh
  it: (g, w, h) => {
    R(g, 0, 0, w, h, "#0c0f0c"); R(g, 0, 0, w, 14, "#2a2d2a"); chu(g, "bao@server-tang1: ~", 6, 7, 160, 8, "#ccc", 500);
    const dong = ["$ ping wifi-cong-ty", "Request timed out.", "$ sudo tat-di-bat-lai --tat-ca", "Đang khởi động lại 14 thiết bị...", "[OK] Máy in tầng 1", "[LỖI] Máy in tầng 1 (lại)", "$ cat ly_do_sap.txt", "Do ai đó cắm nồi cơm vào ổ server", "$ _"];
    dong.forEach((s, i) => chu(g, s, 6, 22 + i * 14, w - 12, 9, s.startsWith("$") ? "#3fe07a" : s.includes("LỖI") ? "#ff5f57" : "#9fd3f2", 500, "left", "monospace"));
  },
  // Giám đốc: chơi bài
  giam_doc: (g, w, h) => {
    R(g, 0, 0, w, h, "#1f6f3a"); R(g, 0, 0, w, 14, "#e8e8e8"); chu(g, "Xếp Bài Cổ Điển · Báo cáo doanh thu (đang thu nhỏ)", 6, 7, w - 12, 8, "#222", 500);
    for (let i = 0; i < 7; i++) { for (let k = 0; k <= i % 4; k++) { RR(g, 10 + i * 34, 40 + k * 12, 28, 38, 3, k === i % 4 ? "#fff" : "#2a5aa8"); if (k === i % 4) chu(g, ["A", "7", "K", "3", "Q", "10", "J"][i], 15 + i * 34, 48 + k * 12, 20, 10, i % 2 ? "#c0262d" : "#111", 800); } }
    for (let i = 0; i < 4; i++) RR(g, 140 + i * 28, 18, 24, 18, 3, "rgba(255,255,255,.2)");
    chu(g, "Điểm: 12.450 · Thời gian: 2:47:12", 8, h - 8, 200, 8, "#cfe8d6", 600);
  },
  pho_giam_doc: (g, w, h) => { R(g, 0, 0, w, h, "#050608"); chu(g, "ĐANG TRỐNG", 150, 60, 110, 14, "#3fa8ff", 800, "center"); chu(g, "Ai ngồi được thì ngồi", 150, 80, 110, 8, "#2a5aa8", 500, "center"); },
  le_tan: (g, w, h) => {
    R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 18, "#e8702a"); chu(g, "SỔ KHÁCH RA VÀO · G-ENTERTAINMENT", 8, 9, w - 16, 10, "#fff", 800);
    [["Giờ", "Khách", "Gặp ai"], ["08:12", "Shipper trà sữa", "Ngân"], ["09:30", "Đối tác (không hẹn)", "Sếp"], ["10:05", "Thợ sửa máy in", "Bảo"], ["11:40", "Shipper trà sữa", "Ngân"], ["14:00", "Người lạ đội nón", "???"]].forEach((d, r) => {
      const y = 22 + r * 20; R(g, 6, y + 18, 244, 1, "#e3e6ea"); d.forEach((s, c) => chu(g, s, 10 + [0, 46, 170][c], y + 10, [40, 120, 76][c], 9, r ? "#222" : "#e8702a", r ? 500 : 800));
    });
  },
  hop_slide: (g, w, h) => {
    R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, 10, h, "#e8702a"); chu(g, "KẾ HOẠCH ĐẠI NHẠC HỘI 31/10", 22, 22, 220, 16, "#22305a", 800);
    ["1. Họp", "2. Họp tiếp để thống nhất cuộc họp 1", "3. Chốt phương án (chưa chốt)", "4. Ngân sách: hỏi lại chị Thương", "5. Siêu Nhân Hồng: 1 triệu người theo dõi"].forEach((s, i) => chu(g, s, 24, 48 + i * 18, 222, 10, "#333", 600));
    chu(g, "Trang 1/87", w - 8, h - 8, 60, 8, "#999", 500, "right");
  },
  laptop_it: (g, w, h) => MAN.it(g, w, h),
  chart2: (g, w, h) => {
    R(g, 0, 0, w, h, "#0d1117"); chu(g, "Nhóm Kín: Phím Hàng Đổi Đời (VIP)", 8, 10, 240, 10, "#ffd166", 800);
    g.strokeStyle = "#2ecc71"; g.lineWidth = 2; g.beginPath(); const rnd = ngauNhien(11); let y = 110; for (let x = 8; x < 248; x += 8) { y = Math.max(28, y - rnd() * 7); g.lineTo(x, y); } g.stroke();
    chu(g, "Mã HONG: lên 300% (trên giấy)", 8, 126, 240, 9, "#2ecc71", 700); chu(g, "Phí VIP: 5 triệu/tháng", 8, 138, 240, 8, "#888", 500);
  },
  dt_chat: (g, w, h) => { R(g, 0, 0, w, h, "#e9eef5"); R(g, 0, 0, w, 16, "#0a68ff"); for (let i = 0; i < 5; i++) RR(g, i % 2 ? 22 : 6, 22 + i * 20, 36, 14, 4, i % 2 ? "#d4e6ff" : "#fff"); },
  dt_feed: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 14, "#3b5ba8"); const gr = g.createLinearGradient(0, 20, 0, 70); gr.addColorStop(0, "#f26fa6"); gr.addColorStop(1, "#ffd166"); g.fillStyle = gr; g.fillRect(4, 22, 56, 44); for (let i = 0; i < 3; i++) R(g, 4, 74 + i * 9, 50 - i * 10, 5, "#c9d2de"); },
};
const KICH_MAN = { dt_chat: [64, 128], dt_feed: [64, 128], hop_slide: [384, 216] };

// ---------- Hình vẽ treo tường, bảng tin, nhãn (ảnh có ánh sáng) ----------
const ghim = (g, x, y, c = "#c0262d") => { tron(g, x, y, 4, c); tron(g, x - 1, y - 1, 1.5, "rgba(255,255,255,.7)"); };
const giayGhim = (g, x, y, w, h, nen, tieuDe, noiDung, xoay = 0) => {
  g.save(); g.translate(x + w / 2, y + h / 2); g.rotate(xoay); g.translate(-w / 2, -h / 2);
  R(g, 2, 3, w, h, "rgba(0,0,0,.25)"); R(g, 0, 0, w, h, nen);
  chu(g, tieuDe, 8, 16, w - 16, 15, "#c0262d", 800); doan(g, noiDung, 8, 30, w - 16, 12, "#222", 600, 15);
  ghim(g, w / 2, 6); g.restore();
};
const banGo = (g, w, h) => { R(g, 0, 0, w, h, "#b98c5c"); const rnd = ngauNhien(3); for (let i = 0; i < 400; i++) { g.fillStyle = `rgba(${rnd() > 0.5 ? "90,60,30" : "230,200,160"},.18)`; g.fillRect(rnd() * w, rnd() * h, 2, 2); } };
const BIEN = {
  bang_tin_1: (g, w, h) => { banGo(g, w, h);
    giayGhim(g, 10, 10, 150, 140, "#fff7a8", "THÔNG BÁO", "Lương tháng 10 sẽ về khi KPI về. KPI đang trên đường. - Phòng Kế toán", -0.04);
    giayGhim(g, 176, 14, 150, 140, "#ffffff", "CẤM", "Hâm cá khô, mắm tôm trong lò vi sóng. Lần thứ 3 rồi nha!", 0.03);
    giayGhim(g, 342, 8, 160, 140, "#ffd3e0", "TÌM ĐỒ THẤT LẠC", "Hộp cơm xanh ghi \"CỦA TUẤN - ĐỪNG ĂN\". Ăn rồi thì trả hộp.", -0.02);
    giayGhim(g, 14, 166, 150, 140, "#d9f0ff", "WIFI", "Tên: G-Ent_NhanVien. Mật khẩu: deadlinelahomqua", 0.02);
    giayGhim(g, 180, 170, 150, 136, "#e6f2d9", "KÊNH DIU-TÚP", "Chưa đăng ký kênh công ty = chưa yêu công ty. - HR", -0.03);
    giayGhim(g, 346, 166, 156, 140, "#fff", "NHẮC NHỞ", "Kho sự kiện có camera. Ai \"họp riêng\" trong đó, bác Bình xem hết rồi.", 0.04);
  },
  bang_tin_2: (g, w, h) => { banGo(g, w, h);
    giayGhim(g, 10, 10, 150, 140, "#ffffff", "LỊCH HỌP", "Thứ 2: họp. Thứ 3: họp về cuộc họp thứ 2. Thứ 4 tới thứ 6: họp tiếp.", 0.03);
    giayGhim(g, 176, 8, 150, 142, "#ffd3e0", "TUYỂN GẤP", "Người yêu cho anh Vũ. Yêu cầu: chịu được tin nhắn lúc 2 giờ sáng.", -0.03);
    giayGhim(g, 342, 12, 160, 136, "#fff7a8", "CẤM", "Quay Tóp-tóp trong toilet. Lần này nói thật đó.", 0.02);
    giayGhim(g, 14, 168, 150, 136, "#e6f2d9", "SINH NHẬT T10", "20/10: công ty tròn 16 tuổi. 23/10: Siêu Nhân Hồng. Góp quỹ ở chị Hương.", -0.02);
    giayGhim(g, 180, 166, 150, 140, "#d9f0ff", "QUỸ TRÀ SỮA", "Chưa đóng 50 nghìn: Duy, Duy, Duy và Duy.", 0.04);
    giayGhim(g, 346, 168, 156, 136, "#ffffff", "PHÂY-BÚC", "Đăng ảnh công ty phải gắn thẻ trang chính. Không gắn = không thưởng.", -0.03);
  },
  bang_tin_phong: (g, w, h) => { banGo(g, w, h);
    giayGhim(g, 8, 8, 120, 112, "#fff7a8", "MƯỢN SẠC", "Ai mượn sạc ở bàn số 3 trả giùm. Pin còn 2%.", -0.03);
    giayGhim(g, 136, 10, 120, 110, "#ffffff", "THỨ 6", "Mặc áo đồng phục cam. Không mặc = mời cả phòng trà sữa.", 0.03);
    giayGhim(g, 8, 128, 120, 112, "#ffd3e0", "IM LẶNG", "Nghe điện thoại riêng xin ra hành lang. Nhất là chuyện tình cảm.", 0.02);
    giayGhim(g, 136, 130, 120, 110, "#d9f0ff", "TRỰC NHẬT", "Ai về sau cùng tắt máy lạnh. Lần trước chạy 3 ngày.", -0.02);
  },
  noi_quy_pccc: (g, w, h) => {
    R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 46, "#c0262d"); chu(g, "NỘI QUY", w / 2, 16, w - 20, 18, "#fff", 800, "center"); chu(g, "PHÒNG CHÁY CHỮA CHÁY", w / 2, 36, w - 20, 13, "#fff", 800, "center");
    let y = 54; ["1. Cấm dùng lửa, hút thuốc ở nơi cấm lửa.", "2. Không câu móc, sử dụng điện tùy tiện. Hết giờ làm việc phải tắt đèn, quạt, máy lạnh.", "3. Không để hàng hóa, vật tư sát bóng đèn, dây điện.", "4. Phương tiện chữa cháy để nơi dễ thấy, dễ lấy, không ai được lấy sử dụng vào việc khác.", "5. Không để vật cản trên lối đi, cầu thang, lối thoát nạn.", "6. Ai vi phạm sẽ bị xử lý theo quy định."].forEach(s => { y = doan(g, s, 12, y, w - 24, 12, "#222", 600, 14.5) + 3; });
  },
  tieu_lenh: (g, w, h) => {
    R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 46, "#c0262d"); chu(g, "TIÊU LỆNH", w / 2, 16, w - 20, 18, "#fff", 800, "center"); chu(g, "CHỮA CHÁY", w / 2, 36, w - 20, 13, "#fff", 800, "center");
    let y = 58; ["Khi có cháy phải:", "1. Hô hoán to để mọi người biết.", "2. Cắt điện nơi xảy ra cháy.", "3. Dùng bình chữa cháy, vòi nước để dập lửa.", "4. Gọi điện báo cứu hỏa: 114"].forEach((s, i) => { y = doan(g, s, 14, y, w - 28, i ? 14 : 15, i ? "#222" : "#c0262d", 700, 17) + 6; });
    R(g, 14, h - 60, w - 28, 44, "#c0262d"); chu(g, "114", w / 2, h - 38, 100, 30, "#fff", 800, "center");
  },
  tu_voi: (g, w, h) => { R(g, 0, 0, w, h, "#c0262d"); R(g, 14, 14, w - 28, h - 70, "rgba(255,255,255,.18)"); g.strokeStyle = "#fff"; g.lineWidth = 3; g.strokeRect(14, 14, w - 28, h - 70); tron(g, w / 2, h / 2 - 22, 34, "#8a1414"); tron(g, w / 2, h / 2 - 22, 12, "#c0262d"); chu(g, "VÒI CHỮA CHÁY", w / 2, h - 40, w - 20, 18, "#fff", 800, "center"); chu(g, "PCCC", w / 2, h - 16, 80, 14, "#ffd166", 800, "center"); },
  nut_bao_chay: (g, w, h) => { R(g, 0, 0, w, h, "#c0262d"); R(g, 8, 8, w - 16, h - 16, "#fff"); tron(g, w / 2, h / 2, 14, "#c0262d"); chu(g, "NHẤN", w / 2, h - 14, w - 20, 9, "#c0262d", 800, "center"); chu(g, "BÁO CHÁY", w / 2, 16, w - 20, 9, "#c0262d", 800, "center"); },
  nhan_binh: (g, w, h) => { R(g, 0, 0, w, h, "#c0262d"); chu(g, "BÌNH CHỮA CHÁY", w / 2, h / 2, w - 12, 18, "#fff", 800, "center"); },
  // tranh treo tường
  phong_canh: (g, w, h) => { const gr = g.createLinearGradient(0, 0, 0, h); gr.addColorStop(0, "#f7d9a6"); gr.addColorStop(1, "#a9d6e5"); g.fillStyle = gr; g.fillRect(0, 0, w, h); tron(g, w * 0.7, h * 0.3, 18, "#fff3c4");
    [[0.1, 0.55, "#5e7d6a"], [0.35, 0.45, "#4a6b5a"], [0.6, 0.5, "#6f8f7a"], [0.85, 0.42, "#3f5c4d"]].forEach(([x, t, c]) => { g.fillStyle = c; g.beginPath(); g.moveTo(w * x - 50, h * 0.78); g.quadraticCurveTo(w * x - 10, h * t - 20, w * x, h * t); g.quadraticCurveTo(w * x + 14, h * t - 10, w * x + 52, h * 0.78); g.fill(); });
    R(g, 0, h * 0.76, w, h * 0.24, "#6fa8c0"); g.fillStyle = "#3a2a1a"; g.beginPath(); g.moveTo(w * 0.3, h * 0.85); g.lineTo(w * 0.42, h * 0.85); g.lineTo(w * 0.4, h * 0.88); g.lineTo(w * 0.32, h * 0.88); g.fill(); R(g, w * 0.36, h * 0.75, 2, 18, "#3a2a1a"); },
  pho_dem: (g, w, h) => { R(g, 0, 0, w, h, "#1c1a33"); for (let i = 0; i < 6; i++) { R(g, i * 44, h * 0.35 + (i % 2) * 14, 40, h, ["#e6b85c", "#d9a24a", "#c98a3a"][i % 3]); R(g, i * 44, h * 0.32 + (i % 2) * 14, 42, 8, "#5a2a1a"); }
    for (let i = 0; i < 9; i++) { const x = 16 + i * 28, y = 30 + (i % 3) * 10; R(g, x, 0, 1, y, "#333"); tron(g, x, y + 8, 9, ["#ff4d4d", "#ffd166", "#ff8a3a"][i % 3]); } R(g, 0, h - 20, w, 20, "#2a2540"); },
  dong_lua: (g, w, h) => { R(g, 0, 0, w, h * 0.45, "#bfe3f2"); for (let i = 0; i < 8; i++) R(g, 0, h * 0.45 + i * h * 0.07, w, h * 0.07, i % 2 ? "#9cc95a" : "#8abb48"); g.fillStyle = "#f2e2a6"; g.beginPath(); g.moveTo(w * 0.62, h * 0.5); g.lineTo(w * 0.72, h * 0.58); g.lineTo(w * 0.52, h * 0.58); g.fill(); R(g, w * 0.6, h * 0.58, 8, 26, "#3a5a8a"); },
  truu_tuong: (g, w, h) => { R(g, 0, 0, w, h, "#f4efe6"); tron(g, w * 0.35, h * 0.4, w * 0.22, "#e8702a"); R(g, w * 0.45, h * 0.3, w * 0.4, h * 0.45, "#2fa39a"); g.fillStyle = "#22305a"; g.beginPath(); g.moveTo(w * 0.1, h * 0.9); g.lineTo(w * 0.5, h * 0.6); g.lineTo(w * 0.9, h * 0.9); g.fill(); R(g, w * 0.7, h * 0.1, 10, h * 0.5, "#ffcf3a"); },
  hoa_sen: (g, w, h) => { R(g, 0, 0, w, h, "#e9f2ea"); for (let i = 0; i < 3; i++) { const x = w * (0.25 + i * 0.25), y = h * (0.45 + (i % 2) * 0.1); R(g, x - 1, y, 2, h, "#3d7a34"); for (let k = -2; k <= 2; k++) { g.fillStyle = k % 2 ? "#f5a3c0" : "#f27aa5"; g.beginPath(); g.ellipse(x + k * 6, y - 10, 7, 18, k * 0.35, 0, 7); g.fill(); } } for (let i = 0; i < 4; i++) { g.fillStyle = "#4f8a3c"; g.beginPath(); g.ellipse(w * (0.15 + i * 0.25), h * 0.85, 30, 9, 0, 0, 7); g.fill(); } },
  team: (g, w, h) => { const gr = g.createLinearGradient(0, 0, 0, h); gr.addColorStop(0, "#9fd3f2"); gr.addColorStop(0.6, "#fbe3b0"); gr.addColorStop(1, "#e8c98a"); g.fillStyle = gr; g.fillRect(0, 0, w, h); R(g, 0, h * 0.55, w, h * 0.1, "#5fb0d8");
    const ao = ["#e8702a", "#e8702a", "#2fa39a", "#e8702a", "#f26fa6", "#e8702a", "#e8702a"]; ao.forEach((c, i) => { const x = 22 + i * 32; tron(g, x, h * 0.55, 9, "#e2b08a"); R(g, x - 10, h * 0.55 + 9, 20, 30, c); });
    R(g, 0, h - 26, w, 26, "rgba(0,0,0,.45)"); chu(g, "TEAM BUILDING VŨNG TÀU 2025", w / 2, h - 13, w - 16, 14, "#fff", 800, "center"); },
  ca_chep: (g, w, h) => { R(g, 0, 0, w, h, "#e6ecef"); for (let i = 0; i < 9; i++) { const x = 20 + (i * 53) % (w - 30), y = 20 + ((i * 37) % (h - 40)); g.fillStyle = i % 3 ? "#e8702a" : "#f2f2f2"; g.beginPath(); g.ellipse(x, y, 16, 6, i * 0.7, 0, 7); g.fill(); g.fillStyle = "#c0262d"; g.beginPath(); g.ellipse(x + Math.cos(i * 0.7) * 6, y + Math.sin(i * 0.7) * 6, 5, 3, i * 0.7, 0, 7); g.fill(); } chu(g, "CỬU NGƯ QUẦN HỘI", w - 10, h - 12, 140, 12, "#7a1424", 800, "right"); },
  chu_nhan: (g, w, h) => { R(g, 0, 0, w, h, "#f2e6c8"); R(g, 0, 0, w, 10, "#7a1424"); R(g, 0, h - 10, w, 10, "#7a1424"); chu(g, "NHẪN", w / 2, h * 0.45, w - 16, 52, "#1c1c1f", 800, "center", "serif"); chu(g, "Một điều nhịn, chín điều lành", w / 2, h * 0.78, w - 16, 11, "#7a1424", 600, "center", "serif"); },
  van_hoa: (g, w, h) => { R(g, 0, 0, w, h, "#22305a"); chu(g, "VĂN HÓA CÔNG TY", w / 2, 26, w - 20, 22, "#ffcf3a", 800, "center"); let y = 54; ["Điều 1: Sếp luôn đúng.", "Điều 2: Nếu sếp sai, xem lại điều 1.", "Điều 3: Deadline là hôm qua.", "Điều 4: Công ty là gia đình (của sếp)."].forEach(s => { y = doan(g, s, 18, y, w - 36, 15, "#fff", 600, 19) + 6; }); },
  lich_dien: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 34, "#7b4bb3"); chu(g, "LỊCH DIỄN THÁNG 10 - PHÁT", w / 2, 17, w - 16, 15, "#fff", 800, "center"); let y = 42; [["01-10", "(trống)"], ["11-20", "(trống)"], ["21-30", "Hát đám cưới bà con"], ["31/10", "Đại Nhạc Hội - hát lót"]].forEach(([a, b]) => { chu(g, a, 14, y + 10, 60, 13, "#7b4bb3", 800); chu(g, b, 80, y + 10, w - 94, 13, "#333", 600); R(g, 10, y + 24, w - 20, 1, "#ddd"); y += 30; }); },
  hoa_don: (g, w, h) => { R(g, 0, 0, w, h, "#fff7d6"); chu(g, "HÓA ĐƠN ĐÂU?", w / 2, 30, w - 16, 24, "#c0262d", 800, "center"); let y = 56; ["Không hóa đơn", "= không thanh toán.", "Hóa đơn viết tay", "= không thanh toán.", "Hóa đơn của sếp", "= để chị xem."].forEach((s, i) => { chu(g, s, w / 2, y, w - 20, i % 2 ? 13 : 14, i % 2 ? "#333" : "#1f7a45", i % 2 ? 500 : 800, "center"); y += i % 2 ? 26 : 18; }); },
  quy_trinh_nghi: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 30, "#2fa39a"); chu(g, "QUY TRÌNH NGHỈ PHÉP", w / 2, 15, w - 16, 15, "#fff", 800, "center"); ["1. Viết đơn", "2. Chờ", "3. Chờ tiếp", "4. Bị từ chối", "5. Quay lại bước 1"].forEach((s, i) => { RR(g, 14, 38 + i * 24, w - 28, 19, 4, i === 3 ? "#ffd3d3" : "#e2f7ec"); chu(g, s, 22, 47.5 + i * 24, w - 44, 12, "#222", 700); }); },
  tat_bat: (g, w, h) => { R(g, 0, 0, w, h, "#16171b"); chu(g, "ĐÃ THỬ TẮT ĐI", w / 2, 34, w - 20, 24, "#3fe07a", 800, "center"); chu(g, "BẬT LẠI CHƯA?", w / 2, 66, w - 20, 24, "#3fe07a", 800, "center"); chu(g, "Chưa thử thì đừng gọi IT. - Bảo", w / 2, 100, w - 20, 11, "#9fd3f2", 500, "center"); },
  khong_rut: (g, w, h) => { R(g, 0, 0, w, h, "#ffcf3a"); g.strokeStyle = "#111"; g.lineWidth = 6; g.strokeRect(3, 3, w - 6, h - 6); chu(g, "KHÔNG RÚT ĐIỆN", w / 2, h * 0.38, w - 16, 18, "#111", 800, "center"); chu(g, "Đang chạy web công ty", w / 2, h * 0.72, w - 16, 11, "#111", 600, "center"); },
  muon_do: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 28, "#7d1424"); chu(g, "MƯỢN ĐỒ PHẢI GHI SỔ", w / 2, 14, w - 16, 14, "#fff", 800, "center"); let y = 36; y = doan(g, "Lấy đồ diễn mà không ghi sổ, chị biết hết. Bộ Siêu Nhân Hồng chỉ có 2 bộ, hư là đền.", 12, y, w - 24, 12, "#222", 600, 15); chu(g, "- Chị Hương", w - 12, h - 14, 120, 12, "#7d1424", 800, "right"); },
  thung_1: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); chu(g, "ĐỒ TẾT 2025", w / 2, h / 2, w - 10, 16, "#c0262d", 800, "center"); },
  thung_2: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); chu(g, "HALLOWEEN", w / 2, h / 2, w - 10, 16, "#e8702a", 800, "center"); },
  thung_3: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); chu(g, "ĐẠI NHẠC HỘI", w / 2, h / 2, w - 10, 16, "#f26fa6", 800, "center"); },
  // pantry
  rua_ly: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); g.strokeStyle = "#2a5aa8"; g.lineWidth = 6; g.strokeRect(3, 3, w - 6, h - 6); chu(g, "RỬA LY SAU KHI DÙNG", w / 2, h * 0.36, w - 20, 20, "#2a5aa8", 800, "center"); chu(g, "Mẹ bạn không làm việc ở đây.", w / 2, h * 0.7, w - 20, 13, "#c0262d", 600, "center"); },
  noi_quy_pantry: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 30, "#2e8b57"); chu(g, "NỘI QUY PANTRY", w / 2, 15, w - 16, 15, "#fff", 800, "center"); let y = 38; ["1. Rửa ly sau khi dùng.", "2. Không hâm cá, mắm trong lò vi sóng.", "3. Hộp cơm phải ghi tên.", "4. Ăn trái cây chừa người khác.", "5. Phân loại rác đúng thùng."].forEach(s => { y = doan(g, s, 12, y, w - 24, 12, "#222", 600, 15) + 3; }); },
  phan_loai: (g, w, h) => { R(g, 0, 0, w, h, "#2e8b57"); chu(g, "PHÂN LOẠI RÁC TẠI NGUỒN", w / 2, h / 2, w - 16, 18, "#fff", 800, "center"); },
  rac_huu_co: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 8, "#2e8b57"); chu(g, "RÁC HỮU CƠ", w / 2, h * 0.45, w - 10, 14, "#2e8b57", 800, "center"); chu(g, "Thức ăn thừa, vỏ trái cây", w / 2, h * 0.78, w - 10, 9, "#333", 500, "center"); },
  rac_tai_che: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 8, "#2a5aa8"); chu(g, "RÁC TÁI CHẾ", w / 2, h * 0.45, w - 10, 14, "#2a5aa8", 800, "center"); chu(g, "Chai nhựa, lon, giấy", w / 2, h * 0.78, w - 10, 9, "#333", 500, "center"); },
  rac_khac: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 8, "#555"); chu(g, "RÁC KHÁC", w / 2, h * 0.45, w - 10, 14, "#444", 800, "center"); chu(g, "Ly mì, túi ni lông", w / 2, h * 0.78, w - 10, 9, "#333", 500, "center"); },
  truc_nhat: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 28, "#e8702a"); chu(g, "LỊCH TRỰC NHẬT PANTRY", w / 2, 14, w - 16, 14, "#fff", 800, "center"); [["Thứ 2", "Duy"], ["Thứ 3", "Duy"], ["Thứ 4", "Duy (thực tập)"], ["Thứ 5", "Duy"], ["Thứ 6", "Ai thấy bẩn thì rửa"]].forEach(([a, b], i) => { const y = 34 + i * 22; R(g, 8, y + 20, w - 16, 1, "#ddd"); chu(g, a, 14, y + 10, 60, 12, "#e8702a", 800); chu(g, b, 80, y + 10, w - 92, 12, "#222", 600); }); },
  tu_lanh_1: (g, w, h) => { R(g, 0, 0, w, h, "#fff7a8"); chu(g, "SỮA CỦA NGÂN", w / 2, h * 0.35, w - 8, 11, "#c0262d", 800, "center"); chu(g, "ĐỪNG UỐNG!!!", w / 2, h * 0.68, w - 8, 11, "#222", 800, "center"); },
  tu_lanh_2: (g, w, h) => { R(g, 0, 0, w, h, "#d9f0ff"); chu(g, "Hộp cơm T5", w / 2, h * 0.35, w - 8, 10, "#1f4fa8", 800, "center"); chu(g, "- Tuấn HR", w / 2, h * 0.68, w - 8, 10, "#222", 600, "center"); },
  an_vat: (g, w, h) => { R(g, 0, 0, w, h, "#e8702a"); chu(g, "ĐỒ ĂN VẶT", w / 2, h * 0.36, w - 12, 15, "#fff", 800, "center"); chu(g, "Ăn nhớ bỏ tiền vô hộp", w / 2, h * 0.74, w - 12, 10, "#fff", 600, "center"); },
  // bàn làm việc
  in_chart: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); chu(g, "BÁO CÁO DANH MỤC", 8, 10, w - 16, 9, "#222", 800); g.strokeStyle = "#c0262d"; g.lineWidth = 2; g.beginPath(); const rnd = ngauNhien(19); let y = 30; for (let x = 8; x < w - 8; x += 6) { y = Math.min(h - 14, y + (rnd() - 0.3) * 8); g.lineTo(x, y); } g.stroke(); chu(g, "-38%", w - 8, h - 8, 50, 10, "#c0262d", 800, "right"); },
  don_nghi: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); chu(g, "ĐƠN XIN NGHỈ PHÉP", w / 2, 12, w - 10, 10, "#111", 800, "center"); chu(g, "(lần thứ 14)", w / 2, 24, w - 10, 8, "#c0262d", 600, "center"); let y = 34; y = doan(g, "Kính gửi anh Thắng, em xin nghỉ thứ 6 vì bà ngoại em bị ốm (lại).", 8, y, w - 16, 8, "#333", 500, 10); for (let i = 0; i < 3; i++) R(g, 8, y + 4 + i * 10, w - 16, 1, "#bbb"); chu(g, "Ký tên: Sơn", w - 8, h - 8, 60, 8, "#1f4fa8", 600, "right"); },
  kich_ban: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); chu(g, "KỊCH BẢN", w / 2, h * 0.3, w - 10, 14, "#111", 800, "center"); chu(g, "MV Siêu Nhân Hồng", w / 2, h * 0.5, w - 10, 9, "#333", 600, "center"); chu(g, "Bản nháp 17 - đừng sửa", w / 2, h * 0.75, w - 10, 8, "#c0262d", 600, "center"); },
  so_ghi: (g, w, h) => { R(g, 0, 0, w, h, "#fbfaf4"); R(g, w / 2 - 1, 0, 2, h, "#ccc"); for (let i = 0; i < 9; i++) { R(g, 4, 14 + i * 9, w / 2 - 8, 1, "#cfe0ef"); R(g, w / 2 + 4, 14 + i * 9, w / 2 - 8, 1, "#cfe0ef"); } chu(g, "Ngày 1: Hỏi chỗ", 6, 9, w / 2 - 10, 7, "#1f4fa8", 600); chu(g, "để máy in.", 6, 18, w / 2 - 10, 7, "#1f4fa8", 600); chu(g, "Ngày 2: Học Excel", w / 2 + 6, 9, w / 2 - 10, 7, "#1f4fa8", 600); chu(g, "(vẫn chưa hiểu)", w / 2 + 6, 18, w / 2 - 10, 7, "#c0262d", 600); },
  the_tts: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); R(g, 0, 0, w, 18, "#6f9fd0"); chu(g, "G-ENT", w / 2, 9, w - 6, 10, "#fff", 800, "center"); R(g, w / 2 - 14, 24, 28, 32, "#cfd8e0"); chu(g, "THỰC TẬP", w / 2, 66, w - 6, 9, "#111", 800, "center"); chu(g, "Duy · 30 tuổi", w / 2, 78, w - 6, 7, "#555", 600, "center"); },
  ten_le_tan: (g, w, h) => { R(g, 0, 0, w, h, "#22305a"); chu(g, "LỄ TÂN · RECEPTION", w / 2, h / 2, w - 10, 16, "#fff", 800, "center"); },
  ten_hr: (g, w, h) => { R(g, 0, 0, w, h, "#2fa39a"); chu(g, "TRƯỞNG BAN HẠNH PHÚC", w / 2, h / 2, w - 10, 14, "#fff", 800, "center"); },
  ten_gd: (g, w, h) => { R(g, 0, 0, w, h, "#1c1c1f"); g.strokeStyle = "#d8b45a"; g.lineWidth = 3; g.strokeRect(3, 3, w - 6, h - 6); chu(g, "GIÁM ĐỐC", w / 2, h / 2, w - 16, 18, "#d8b45a", 800, "center"); },
  qr: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); const rnd = ngauNhien(9); for (let y = 0; y < 12; y++) for (let x = 0; x < 12; x++) if (rnd() > 0.5) R(g, 8 + x * 6, 8 + y * 6, 6, 6, "#111"); for (const [x, y] of [[8, 8], [56, 8], [8, 56]]) { g.strokeStyle = "#111"; g.lineWidth = 4; g.strokeRect(x + 2, y + 2, 14, 14); } chu(g, "Quét mã nộp phạt đi trễ", w / 2, h - 12, w - 8, 9, "#c0262d", 700, "center"); },
  tap_chi_1: (g, w, h) => { const gr = g.createLinearGradient(0, 0, w, h); gr.addColorStop(0, "#f26fa6"); gr.addColorStop(1, "#7b4bb3"); g.fillStyle = gr; g.fillRect(0, 0, w, h); chu(g, "SAO HÓNG", w / 2, 16, w - 8, 14, "#fff", 800, "center"); chu(g, "Siêu Nhân Hồng: \"Tôi chỉ là người bình thường\"", w / 2, h - 14, w - 8, 7, "#fff", 600, "center"); },
  tap_chi_2: (g, w, h) => { R(g, 0, 0, w, h, "#22305a"); chu(g, "DOANH NHÂN", w / 2, 16, w - 8, 13, "#ffcf3a", 800, "center"); chu(g, "Bí quyết họp 8 tiếng mỗi ngày", w / 2, h - 14, w - 8, 7, "#fff", 600, "center"); },
  // sân thượng
  vuon_rau: (g, w, h) => { R(g, 0, 0, w, h, "#f2f2ee"); g.strokeStyle = "#2e8b57"; g.lineWidth = 6; g.strokeRect(3, 3, w - 6, h - 6); chu(g, "VƯỜN RAU BÁC BÌNH", w / 2, h * 0.36, w - 20, 20, "#2e8b57", 800, "center"); chu(g, "Hái là biết tay! (Ớt thì xin được)", w / 2, h * 0.72, w - 20, 12, "#c0262d", 700, "center"); },
  cam_hut: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); tron(g, 40, h / 2, 26, "#c0262d"); tron(g, 40, h / 2, 20, "#fff"); R(g, 24, h / 2 - 3, 32, 6, "#333"); g.save(); g.translate(40, h / 2); g.rotate(0.78); R(g, -24, -3, 48, 6, "#c0262d"); g.restore(); chu(g, "CẤM HÚT THUỐC", 72, h * 0.4, w - 80, 15, "#c0262d", 800); chu(g, "(ai dán cái này vậy?)", 72, h * 0.72, w - 80, 9, "#555", 500); },
  phong_may: (g, w, h) => { R(g, 0, 0, w, h, "#ffcf3a"); chu(g, "PHÒNG MÁY THANG MÁY", w / 2, h * 0.38, w - 12, 13, "#111", 800, "center"); chu(g, "Không phận sự miễn vào", w / 2, h * 0.72, w - 12, 10, "#111", 600, "center"); },
  thang_may_bien: (g, w, h) => { R(g, 0, 0, w, h, "#fff"); g.strokeStyle = "#c0262d"; g.lineWidth = 4; g.strokeRect(2, 2, w - 4, h - 4); chu(g, "KHI CÓ CHÁY", w / 2, h * 0.3, w - 16, 14, "#c0262d", 800, "center"); chu(g, "KHÔNG SỬ DỤNG THANG MÁY", w / 2, h * 0.55, w - 16, 12, "#c0262d", 800, "center"); chu(g, "Tải trọng 450 kg · 6 người", w / 2, h * 0.8, w - 16, 9, "#333", 600, "center"); },
  uu_tien: (g, w, h) => { R(g, 0, 0, w, h, "#fff7d6"); chu(g, "ƯU TIÊN SẾP VÀ KHÁCH", w / 2, h * 0.38, w - 12, 12, "#7a1424", 800, "center"); chu(g, "Nhân viên đi thang bộ cho khỏe", w / 2, h * 0.72, w - 12, 9, "#333", 600, "center"); },
  cau_thang_2: (g, w, h) => { R(g, 0, 0, w, h, "#2e8b57"); chu(g, "XUỐNG TẦNG 1", w / 2, h * 0.32, w - 12, 18, "#fff", 800, "center"); chu(g, "LÊN SÂN THƯỢNG · THANG MÁY", w / 2, h * 0.72, w - 12, 12, "#fff", 700, "center"); },
  loi_xuong: (g, w, h) => { R(g, 0, 0, w, h, "#2e8b57"); chu(g, "LỐI XUỐNG TẦNG 2", w / 2, h / 2, w - 12, 15, "#fff", 800, "center"); },
  render_poster: (g, w, h) => { R(g, 0, 0, w, h, "#1f2a3d"); tron(g, w / 2, h * 0.35, 30, "#ffd166"); chu(g, "RENDER XONG", w / 2, h * 0.68, w - 12, 18, "#fff", 800, "center"); chu(g, "THÌ TRỜI CŨNG SÁNG", w / 2, h * 0.84, w - 12, 13, "#ffd166", 700, "center"); },
  mat_dong_ho: (g, w, h) => { tron(g, w / 2, h / 2, w / 2 - 1, "#fdfcf8"); g.strokeStyle = "#222"; for (let i = 0; i < 12; i++) { const a = i * Math.PI / 6, r1 = w / 2 - 5, r2 = i % 3 ? w / 2 - 10 : w / 2 - 15; g.lineWidth = i % 3 ? 2 : 4; g.beginPath(); g.moveTo(w / 2 + Math.sin(a) * r1, h / 2 - Math.cos(a) * r1); g.lineTo(w / 2 + Math.sin(a) * r2, h / 2 - Math.cos(a) * r2); g.stroke(); } chu(g, "G-ENT", w / 2, h * 0.68, 50, 9, "#e8702a", 800, "center"); },
  sticky: null, // vẽ riêng theo nội dung
};
// giấy nhớ dán màn hình
function vungGiayNho(chuNho, mau) {
  return layBien("gn_" + chuNho + mau, 64, 64, (g, w, h) => {
    R(g, 0, 0, w, h, mau); R(g, 0, 0, w, 10, "rgba(0,0,0,.08)");
    const tu = chuNho.split(" "), k = Math.ceil(tu.length / 2);
    const dong = chuNho.length > 8 && tu.length > 1 ? [tu.slice(0, k).join(" "), tu.slice(k).join(" ")] : [chuNho];
    dong.forEach((s, i) => chu(g, s, w / 2, h / 2 + 4 + (i - (dong.length - 1) / 2) * 16, w - 8, 15, "#1c1c1f", 800, "center"));
  });
}

// ---------- Vật liệu dùng chung ----------
let AT_BIEN, AT_MAN, TEX_BIEN, TEX_MAN, VL_BIEN, VL_MAN, VL_KINH_TRONG, VL_KINH_NGOAI, VL_KINH_MO, VL_KIM, VL_KINH_CUA, VL_CANH, VL_TRON_ROOF;
function khoiTao() {
  if (AT_BIEN) return;
  AT_BIEN = new Atlas(2048, 1640); AT_MAN = new Atlas(1040, 1420); // màn hình 256x144 xếp đủ 4 ô một hàng
  const tex = c => { const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; return t; };
  TEX_BIEN = tex(AT_BIEN.c); TEX_MAN = tex(AT_MAN.c);
  // chữ, tranh, màn hình luôn thắng lớp sơn / khung phía sau khi nhìn xiên
  const bu = { polygonOffset: true, polygonOffsetFactor: -2, polygonOffsetUnits: -6 };
  VL_BIEN = new THREE.MeshLambertMaterial({ map: TEX_BIEN, ...bu });
  VL_MAN = new THREE.MeshBasicMaterial({ map: TEX_MAN, ...bu });
  // kính cửa sổ: nhìn từ trong thấy trời và phố đối diện, màu đổi theo giờ (capNhatCuaSo)
  VL_KINH_TRONG = new THREE.MeshBasicMaterial({ map: TEX_MAN, color: 0xffffff }); VL_KINH_TRONG.userData.dong = true;
  VL_KINH_NGOAI = new THREE.MeshLambertMaterial({ color: 0x86b4cc, emissive: 0x0f2a38 }); VL_KINH_NGOAI.userData.dong = true;
  VL_KINH_MO = new THREE.MeshBasicMaterial({ color: 0xe2eaee }); VL_KINH_MO.userData.dong = true;
  VL_KIM = new THREE.MeshBasicMaterial({ color: 0x1c1c1f });
  VL_KINH_CUA = new THREE.MeshLambertMaterial({ color: 0xbfe3f2, transparent: true, opacity: 0.32, depthWrite: false });
  VL_CANH = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true });
}
const layBien = (ten, w, h, ve) => AT_BIEN.lay(ten, w, h, ve || BIEN[ten]);
const layMan = (ten) => { const [w, h] = KICH_MAN[ten] || [256, 144]; return AT_MAN.lay(ten, w, h, MAN[ten] || MAN.mac_dinh); };

// ================= HÌNH KHỐI =================
let S = null; // lần dựng hiện tại: { nhom, vat, cua, dongHo, ... }
const them = (m) => { m.userData.khongCan = true; S.nhom.add(m); return m; };
const tangCua = y => Math.max(0, Math.min(2, Math.floor((y + 0.05) / CAO)));
// khối hộp: đáy ở y. can: thêm vật cản (chỉ dùng cho khối không xoay)
function K(w, h, d, mau, x, y, z, { can = false, rx = 0, ry = 0, rz = 0, vatLieu } = {}) {
  const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vatLieu || vl(mau));
  m.position.set(x, y + h / 2, z); m.rotation.set(rx, ry, rz); them(m);
  if (can) S.vat[tangCua(y)].push({ minX: x - w / 2, maxX: x + w / 2, minZ: z - d / 2, maxZ: z + d / 2 });
  return m;
}
// trụ tròn: đáy ở y
function TR(r, h, mau, x, y, z, { rTren = r, seg = 10, rx = 0, rz = 0, ry = 0, vatLieu } = {}) {
  const m = new THREE.Mesh(new THREE.CylinderGeometry(rTren, r, h, seg), vatLieu || vl(mau));
  if (rx || rz) { m.position.set(x, y, z); m.rotation.set(rx, ry, rz); } else { m.position.set(x, y + h / 2, z); m.rotation.y = ry; }
  return them(m);
}
const CAU = (r, mau, x, y, z, s = [1, 1, 1], chiTiet = 0) => { const m = new THREE.Mesh(new THREE.IcosahedronGeometry(r, chiTiet), vl(mau)); m.position.set(x, y, z); m.scale.set(...s); return them(m); };
function hinhPhang(w, h, uv) {
  const g = new THREE.PlaneGeometry(w, h); const a = g.attributes.uv;
  for (let i = 0; i < a.count; i++) a.setXY(i, uv.u0 + a.getX(i) * (uv.u1 - uv.u0), uv.v0 + a.getY(i) * (uv.v1 - uv.v0));
  return g;
}
function P(w, h, uv, vatLieu, x, y, z, { ry = 0, rx = 0, rz = 0 } = {}) {
  const m = new THREE.Mesh(hinhPhang(w, h, uv), vatLieu); m.position.set(x, y, z); m.rotation.set(rx, ry, rz, "YXZ"); return them(m);
}
// tờ giấy / nhãn nằm phẳng trên mặt bàn (y là mặt bàn)
const giayNam = (w, d, uv, x, y, z, xoay = 0, vatLieu = VL_BIEN) => P(w, d, uv, vatLieu, x, y + 0.002, z, { rx: -Math.PI / 2, ry: xoay });

// Mặt tường: truc "z" = tường chạy dọc trục x tại z = c; "x" = tường chạy dọc trục z tại x = c.
// huong: phía mặt tường nhìn ra (+1/-1). u: tọa độ dọc tường; y: độ cao tính từ sàn tầng; d: khoảng nhô ra khỏi mặt tường.
function mat(truc, c, huong, tang, nua = NUA) {
  // đồ treo tường bắt đầu cách mặt tường 1,8 cm (trước lớp sơn và các mảng màu phòng); khối hộp kéo lùi vào trong tường để không hở khe
  const f = c + huong * nua, y0 = tang * CAO, B = 0.018;
  const rot = truc === "z" ? (huong > 0 ? 0 : Math.PI) : (huong > 0 ? Math.PI / 2 : -Math.PI / 2);
  const pt = (u, d) => truc === "z" ? [u, f + huong * (B + d)] : [f + huong * (B + d), u];
  return {
    truc, huong, tang, y0, rot, pt,
    // hướng "bên phải" (trong thế giới) của người đứng nhìn vào mặt tường
    phai: truc === "z" ? [huong > 0 ? 1 : -1, 0] : [0, huong > 0 ? -1 : 1],
    hop(u, y, w, h, d, mau, o) { const [x, z] = pt(u, (d - B - 0.02) / 2), dd = d + B + 0.02; return truc === "z" ? K(w, h, dd, mau, x, y0 + y, z, o) : K(dd, h, w, mau, x, y0 + y, z, o); },
    phang(u, y, w, h, uv, vatLieu = VL_BIEN, d = 0.012, rz = 0) { const [x, z] = pt(u, d); return P(w, h, uv, vatLieu, x, y0 + y, z, { ry: rot, rz }); },
    tru(u, y, r, dai, mau, d) { const [x, z] = pt(u, d); return TR(r, dai, mau, x, y0 + y, z, truc === "z" ? { rx: Math.PI / 2 } : { rz: Math.PI / 2 }); },
  };
}

// ================= ĐỒ TREO TƯỜNG =================
function tranhKhung(M, u, y, w, h, ten, mauKhung = 0x3a2a1a) { M.hop(u, y - h / 2 - 0.04, w + 0.08, h + 0.08, 0.03, mauKhung); M.phang(u, y, w, h, layBien(ten, Math.round(w * 180), Math.round(h * 180)), VL_BIEN, 0.032); }
function bangGhim(M, u, y, w, h, ten, px = 512) { M.hop(u, y - h / 2 - 0.05, w + 0.1, h + 0.1, 0.025, 0x6b4a2f); M.phang(u, y, w, h, layBien(ten, px, Math.round(px * h / w)), VL_BIEN, 0.027); }
function bangIn(M, u, y, w, h, ten, px = 256, vien = 0x8a8d92) { M.hop(u, y - h / 2 - 0.02, w + 0.04, h + 0.04, 0.012, vien); M.phang(u, y, w, h, layBien(ten, px, Math.round(px * h / w)), VL_BIEN, 0.014); }
function oCam(M, u, y = 0.3) { M.hop(u, y - 0.045, 0.09, 0.09, 0.012, 0xf4f2ee); for (const k of [-1, 1]) M.hop(u + k * 0.018, y - 0.012, 0.012, 0.024, 0.016, 0x4a4a4a); }
function congTac(M, u, y = 1.3) { M.hop(u, y - 0.06, 0.085, 0.12, 0.012, 0xf4f2ee); M.hop(u - 0.017, y - 0.025, 0.026, 0.05, 0.02, 0xe2e0da); M.hop(u + 0.017, y - 0.025, 0.026, 0.05, 0.02, 0xe2e0da); }
function mayLanh(M, u, y = 2.75) {
  M.hop(u, y, 0.92, 0.3, 0.22, 0xf7f7f4); M.hop(u, y + 0.03, 0.84, 0.04, 0.228, 0x9aa0a6); // thân, khe gió
  M.hop(u, y + 0.2, 0.8, 0.012, 0.226, 0xe4e4e0); M.hop(u + 0.36, y + 0.12, 0.025, 0.02, 0.226, 0x3fb8e0); // đường viền, đèn báo
  M.hop(u - 0.52, y + 0.05, 0.08, 0.06, 0.06, 0xf2f2ee); M.hop(u - 0.52, y + 0.11, 0.08, TC - y - 0.11, 0.06, 0xf2f2ee); // ống gen đi lên trần
}
function dongHo(M, u, y, r = 0.17) {
  M.tru(u, y, r + 0.025, 0.04, 0x2a2c31, 0.02);
  M.phang(u, y, r * 2, r * 2, layBien("mat_dong_ho", 96, 96), VL_BIEN, 0.041);
  const [x, z] = M.pt(u, 0.045), [x2, z2] = M.pt(u, 0.05);
  S.dongHo.push({ p: new THREE.Vector3(x, M.y0 + y, z), p2: new THREE.Vector3(x2, M.y0 + y, z2), rot: M.rot, r });
}
const MUI_TEN = { "": "", trai: "trai", phai: "phai" };
function vungThoat(kieu) {
  return AT_MAN.lay("thoat_" + kieu, 256, 92, (g, w, h) => {
    R(g, 0, 0, w, h, "#16903f"); g.strokeStyle = "#fff"; g.lineWidth = 3; g.strokeRect(4, 4, w - 8, h - 8);
    // người chạy về phía cửa (quay theo mũi tên)
    const trai = kieu === "trai", ix = trai ? w - 40 : 40, s = trai ? -1 : 1;
    g.fillStyle = "#fff"; tron(g, ix + 6 * s, 22, 8);
    g.save(); g.translate(ix, 44); g.rotate(0.35 * s); g.fillRect(-5, -14, 10, 26); g.restore();
    g.lineWidth = 6; g.lineCap = "round"; g.beginPath(); g.moveTo(ix, 56); g.lineTo(ix - 14 * s, 78); g.moveTo(ix, 56); g.lineTo(ix + 12 * s, 68); g.lineTo(ix + 22 * s, 80);
    g.moveTo(ix + 2 * s, 36); g.lineTo(ix + 18 * s, 46); g.moveTo(ix - 2 * s, 36); g.lineTo(ix - 16 * s, 30); g.stroke();
    const x0 = trai ? (kieu ? 52 : 12) : 74, x1 = trai ? w - 74 : (kieu ? w - 52 : w - 12), cx = (x0 + x1) / 2;
    chu(g, "LỐI THOÁT HIỂM", cx, 34, x1 - x0, 22, "#fff", 800, "center"); chu(g, "EXIT", cx, 64, x1 - x0, 20, "#fff", 800, "center");
    if (kieu) { const ax = trai ? 30 : w - 30, d = trai ? -1 : 1; g.beginPath(); g.moveTo(ax - 18 * d, h / 2 - 7); g.lineTo(ax, h / 2 - 7); g.lineTo(ax, h / 2 - 18); g.lineTo(ax + 18 * d, h / 2); g.lineTo(ax, h / 2 + 18); g.lineTo(ax, h / 2 + 7); g.lineTo(ax - 18 * d, h / 2 + 7); g.fill(); }
  });
}
// biển lối thoát hiểm phát sáng; huongDi: hướng đi trong thế giới [dx, dz] (bỏ trống = không có mũi tên)
function thoatHiem(M, u, y, huongDi) {
  let kieu = "";
  if (huongDi) kieu = huongDi[0] * M.phai[0] + huongDi[1] * M.phai[1] > 0 ? "phai" : "trai";
  M.hop(u, y - 0.11, 0.54, 0.22, 0.05, 0xf4f4f0);
  M.phang(u, y, 0.5, 0.18, vungThoat(MUI_TEN[kieu]), VL_MAN, 0.052);
}
function binhChuaChay(x, y0, z, mau = 0xc0262d) {
  TR(0.085, 0.42, mau, x, y0, z); TR(0.087, 0.12, 0xf2f2f2, x, y0 + 0.12, z, { seg: 10 });
  TR(0.06, 0.05, mau, x, y0 + 0.42, z, { rTren: 0.035 }); TR(0.022, 0.07, 0x2a2c31, x, y0 + 0.47, z);
  K(0.15, 0.015, 0.03, 0x2a2c31, x + 0.04, y0 + 0.53, z); K(0.016, 0.34, 0.016, 0x1a1a1a, x + 0.1, y0 + 0.17, z); K(0.03, 0.06, 0.03, 0x1a1a1a, x + 0.1, y0 + 0.5, z);
}
// kệ đặt hai bình chữa cháy sát tường + biển chỉ dẫn
function keBinh(M, u) {
  const [x, z] = M.pt(u, 0.22);
  K(0.5, 0.04, 0.3, 0xa0262d, x, M.y0, z, M.truc === "z" ? {} : { ry: Math.PI / 2 });
  for (const k of [-1, 1]) { const [bx, bz] = M.pt(u + k * 0.12, 0.2); binhChuaChay(bx, M.y0 + 0.04, bz); }
  M.hop(u, 0.04, 0.5, 0.5, 0.02, 0xa0262d);
  M.phang(u, 1.0, 0.44, 0.13, layBien("nhan_binh", 220, 64), VL_BIEN, 0.012);
  hop0(M.truc === "z" ? 0.5 : 0.32, M.truc === "z" ? 0.32 : 0.5, x, z, M.tang);
}
function camera(x, y, z, huong) { // camera an ninh gắn sát góc trần
  K(0.08, 0.08, 0.08, 0xeeeeee, x, y - 0.04, z);
  const g = new THREE.Group(); g.position.set(x, y - 0.12, z); g.rotation.set(0, huong, 0, "YXZ");
  const than = new THREE.Mesh(new THREE.BoxGeometry(0.09, 0.08, 0.22), vl(0xf2f2f2)); than.position.set(0, 0, 0.08); than.rotation.x = 0.35; g.add(than);
  const ong = new THREE.Mesh(new THREE.BoxGeometry(0.06, 0.05, 0.02), vl(0x111111)); ong.position.set(0, -0.04, 0.19); ong.rotation.x = 0.35; g.add(ong);
  const chan = new THREE.Mesh(new THREE.BoxGeometry(0.03, 0.1, 0.03), vl(0xdddddd)); chan.position.set(0, 0.04, 0); g.add(chan);
  them(g);
}
function huongVe(x, z, tx, tz) { return Math.atan2(tx - x, tz - z); }

// ================= CỬA SỔ =================
const CUA_SO = [
  // truc, c, phía trong, a, b, y1, y2, tầng, tùy chọn
  ["z", 14, -1, -18.6, -16.6, 1.0, 2.6, 0, { rem: 0.35 }], ["z", 14, -1, -15.6, -13.6, 1.0, 2.6, 0], ["z", 14, -1, -8.6, -6.6, 1.0, 2.6, 0, { rem: 0.55 }], ["z", 14, -1, -5.6, -3.9, 1.0, 2.6, 0],
  ["z", 14, -1, 5.0, 8.4, 1.0, 2.6, 0], ["z", 14, -1, 12.75, 14.1, 1.12, 1.76, 0],
  ["x", -20, 1, 10.7, 13.3, 1.6, 2.6, 0], ["x", -20, 1, -5.7, -4.2, 1.0, 2.6, 0], ["x", -20, 1, -13.4, -11.9, 1.0, 2.6, 0],
  ["x", 20, -1, 10.55, 12.2, 1.0, 2.6, 0], ["x", 20, -1, -5.5, -4.2, 1.0, 2.6, 0], ["x", 20, -1, -7.9, -6.7, 1.9, 2.6, 0, { mo: true }],
  ["z", -14, 1, -17.6, -15.6, 1.0, 2.6, 0, { rem: 0.3 }], ["z", -14, 1, -14.2, -12.4, 1.0, 2.6, 0], ["z", -14, 1, -7, -5, 1.0, 2.6, 0],
  // tầng 2: studio và phòng dựng phim có phông / rèm che kín bên trong nên chỉ thấy kính từ ngoài
  ["z", 14, -1, -19, -17, 1.0, 2.6, 1, { trong: false }], ["z", 14, -1, -16, -14, 1.0, 2.6, 1, { trong: false }], ["z", 14, -1, -12, -10, 1.0, 2.6, 1, { trong: false }], ["z", 14, -1, -9, -7, 1.0, 2.6, 1, { trong: false }],
  ["z", 14, -1, -5.2, -3.4, 1.0, 2.6, 1, { trong: false }], ["z", 14, -1, -1.2, 0.8, 1.0, 2.6, 1, { trong: false }],
  ["z", 14, -1, 8.8, 10.6, 1.0, 2.6, 1], ["z", 14, -1, 13.6, 15.4, 1.0, 2.6, 1], ["z", 14, -1, 17.4, 19.2, 1.0, 2.6, 1, { rem: 0.4 }],
  ["x", -20, 1, -13.6, -12.3, 1.0, 2.6, 1], ["x", -20, 1, -7.5, -5.6, 1.0, 2.6, 1, { rem: 0.3 }],
  ["x", 20, -1, -13.4, -11.8, 1.0, 2.6, 1], ["x", 20, -1, 10.2, 13.2, 1.0, 2.6, 1],
  ["z", -14, 1, -19.4, -17.4, 1.0, 2.6, 1], ["z", -14, 1, -11.4, -9.4, 1.0, 2.6, 1], ["z", -14, 1, -5, -3, 1.0, 2.6, 1, { rem: 0.5 }],
  ["z", -14, 1, 1.0, 3.4, 1.0, 2.6, 1], ["z", -14, 1, 8.6, 11.0, 1.0, 2.6, 1], ["z", -14, 1, 14.8, 17.2, 1.0, 2.6, 1],
];
let vungTroi = null;
function veTroi(g, w, h) {
  const gr = g.createLinearGradient(0, 0, 0, h); gr.addColorStop(0, "#7fb6e6"); gr.addColorStop(0.62, "#d6eaf6"); gr.addColorStop(1, "#eef5f8"); g.fillStyle = gr; g.fillRect(0, 0, w, h);
  const rnd = ngauNhien(21);
  for (let i = 0; i < 9; i++) { const x = rnd() * w, y = 14 + rnd() * 50; for (let k = 0; k < 4; k++) tron(g, x + k * 14, y + (k % 2) * 4, 10 + rnd() * 6, "rgba(255,255,255,.85)"); }
  let x = 0;
  while (x < w) { const bw = 26 + rnd() * 44, bh = 40 + rnd() * 90; const c = ["#a9b8c6", "#9fb0bf", "#b7c3cf", "#c4b8a6", "#b0a69a"][Math.floor(rnd() * 5)]; R(g, x, h - bh, bw - 3, bh, c);
    for (let yy = h - bh + 6; yy < h - 8; yy += 10) for (let xx = x + 4; xx < x + bw - 8; xx += 8) if (rnd() > 0.3) R(g, xx, yy, 4, 5, "rgba(255,255,255,.45)");
    x += bw; }
  for (let i = 0; i < 12; i++) { tron(g, rnd() * w, h - 4, 10 + rnd() * 8, "#5f8f52"); }
}
function cuaSo([truc, c, ht, a, b, y1, y2, tang, o = {}]) {
  const w = b - a, h = y2 - y1, u = (a + b) / 2;
  for (const ben of [ht, -ht]) {
    const trong = ben === ht;
    if ((trong && o.trong === false) || (!trong && o.ngoai === false)) continue;
    const M = mat(truc, c, ben, tang);
    if (o.mo) M.phang(u, (y1 + y2) / 2, w, h, { u0: 0, u1: 0, v0: 0, v1: 0 }, VL_KINH_MO, 0.008);
    else if (trong) {
      // mỗi cửa sổ thấy một đoạn phố khác nhau
      const r = Math.min(1, w / 4), lech = (Math.abs(Math.sin(a * 12.9898 + c * 78.233)) * 43758.5453) % 1 * (1 - r);
      const uv = { u0: vungTroi.u0 + (vungTroi.u1 - vungTroi.u0) * lech, u1: vungTroi.u0 + (vungTroi.u1 - vungTroi.u0) * (lech + r), v0: vungTroi.v0, v1: vungTroi.v1 };
      M.phang(u, (y1 + y2) / 2, w, h, uv, VL_KINH_TRONG, 0.008);
    } else M.phang(u, (y1 + y2) / 2, w, h, { u0: 0, u1: 0, v0: 0, v1: 0 }, VL_KINH_NGOAI, 0.008);
    const mk = trong ? 0xf2f2ee : 0x4a4f57, T = 0.06, D = 0.05;
    M.hop(u, y2, w + 2 * T, T, D, mk); M.hop(u, y1 - T, w + 2 * T, T, D, mk);
    M.hop(a - T / 2, y1, T, h, D, mk); M.hop(b + T / 2, y1, T, h, D, mk);
    const n = Math.max(1, Math.round(w / 1.0));
    for (let i = 1; i < n; i++) M.hop(a + w * i / n, y1, 0.045, h, D * 0.8, mk);
    if (h > 1.2) M.hop(u, y2 - 0.42, w, 0.04, D * 0.8, mk);
    M.hop(u, y1 - T - 0.04, w + 2 * T + 0.1, 0.04, trong ? 0.15 : 0.1, trong ? 0xd9d2c2 : 0x9a958a);
    if (trong && o.rem) { // rèm cuốn kéo xuống một phần
      M.hop(u, y2 + T, w + 0.1, 0.09, 0.09, 0xe8e2d0);
      const [x, z] = M.pt(u, 0.072), ngang = truc === "z";
      K(ngang ? w + 0.02 : 0.006, h * o.rem, ngang ? 0.006 : w + 0.02, 0xe9e1cc, x, M.y0 + y2 + T - h * o.rem, z);
      K(ngang ? w + 0.04 : 0.025, 0.025, ngang ? 0.025 : w + 0.04, 0xcfc6ae, x, M.y0 + y2 + T - h * o.rem - 0.025, z);
    }
  }
}

// ================= KHUNG CỬA, LEN CHÂN TƯỜNG =================
const LO_CUA = [
  // truc, c, a, b, tầng, phía phòng (±1; 0 = lối thông không có cánh)
  ["z", -6, -16, -14, 0, -1], ["z", -6, -7, -5, 0, -1], ["z", -6, 0, 2, 0, -1], ["z", -6, 7, 9, 0, -1], ["z", -6, 15, 17, 0, -1],
  ["x", -2, 3, 8, 0, 0], ["x", 9, 3, 8, 0, 0],
  ["z", -4, -15, -13, 1, -1], ["z", -4, -5, -3, 1, -1], ["z", -4, 5, 7, 1, -1], ["z", -4, 15, 17, 1, -1],
  ["z", 2, -14, -12, 1, 1], ["z", 2, -3, -1, 1, 1], ["z", 2, 2.5, 7.5, 1, 0], ["z", 2, 13, 15, 1, 1],
];
function khungCua([truc, c, a, b, tang], mau = 0x7a5a3a, sau = 0.29) {
  const y0 = tang * CAO, bx = (w, h, d, x, y, z) => truc === "z" ? K(w, h, d, mau, x, y, z) : K(d, h, w, mau, z, y, x);
  bx(0.11, 2.44, sau, a - 0.015, y0, c); bx(0.11, 2.44, sau, b + 0.015, y0, c); bx(b - a + 0.25, 0.09, sau, (a + b) / 2, y0 + 2.38, c);
}
function lenChan(truc, c, huong, tu, den, cua, tang, mau = 0x6b5a48) {
  const M = mat(truc, c, huong, tang);
  let d0 = tu; const doanTuong = [];
  for (const [a, b] of [...cua].sort((p, q) => p[0] - q[0])) { if (a > d0) doanTuong.push([d0, a]); d0 = Math.max(d0, b); }
  if (d0 < den) doanTuong.push([d0, den]);
  for (const [a, b] of doanTuong) if (b - a > 0.05) M.hop((a + b) / 2, 0, b - a, 0.09, 0.018, mau);
}

// ================= CỬA ĐI TỰ MỞ =================
const LA_W = 0.955, LA_H = 2.34;
function hinhCanhCua() {
  const ds = [];
  const box = (w, h, d, x, y, z, mau) => { const g = new THREE.BoxGeometry(w, h, d); g.translate(x, y, z); const c = new THREE.Color(mau), n = g.attributes.position.count, a = new Float32Array(n * 3); for (let i = 0; i < n; i++) c.toArray(a, i * 3); g.setAttribute("color", new THREE.BufferAttribute(a, 3)); ds.push(g); };
  box(LA_W, LA_H, 0.045, LA_W / 2, LA_H / 2 + 0.02, 0, 0xc49a6c);              // cánh gỗ
  box(0.16, 0.9, 0.05, LA_W - 0.26, 1.45, 0, 0x9fc6d8);                     // ô kính nhìn xuyên
  box(LA_W - 0.04, 0.16, 0.05, LA_W / 2, 0.11, 0, 0xb5b9bf);                // tấm chống đá chân cửa
  for (const s of [-1, 1]) { box(0.05, 0.05, 0.05, LA_W - 0.09, 1.0, s * 0.045, 0xc9ccd0); box(0.16, 0.025, 0.025, LA_W - 0.16, 1.0, s * 0.075, 0xc9ccd0); } // tay nắm gạt hai bên
  box(0.03, 0.06, 0.05, 0.02, 0.4, 0, 0x8a8d92); box(0.03, 0.06, 0.05, 0.02, 2.0, 0, 0x8a8d92); // bản lề
  return mergeGeometries(ds);
}
function taoCua() {
  const ds = LO_CUA.filter(l => l[5]);
  const im = new THREE.InstancedMesh(hinhCanhCua(), VL_CANH, ds.length * 2);
  im.frustumCulled = false; im.userData.khongCan = true;
  S.cua = ds.map(([truc, c, a, b, tang, s], i) => ({ x: (a + b) / 2, z: c, a, b, c, tang, s, k: 0, muc: 0, cho: 0, i: i * 2 }));
  S.cuaMesh = im; S.nhom.add(im);
  for (const d of S.cua) datCanh(d);
  im.instanceMatrix.needsUpdate = true;
}
const _m = new THREE.Matrix4(), _q = new THREE.Quaternion(), _v = new THREE.Vector3(), _e = new THREE.Euler(), _s1 = new THREE.Vector3(1, 1, 1);
function datCanh(d) {
  const t = d.k * d.k * (3 - 2 * d.k), goc = t * Math.PI / 2 * 0.94, y = d.tang * CAO;
  // cánh trái: bản lề ở mép a, mở về phía phòng
  _q.setFromEuler(_e.set(0, -d.s * goc, 0)); _m.compose(_v.set(d.a + 0.045, y, d.c), _q, _s1); S.cuaMesh.setMatrixAt(d.i, _m);
  _q.setFromEuler(_e.set(0, Math.PI + d.s * goc, 0)); _m.compose(_v.set(d.b - 0.045, y, d.c), _q, _s1); S.cuaMesh.setMatrixAt(d.i + 1, _m);
}
// cửa kính trượt tự động ở sảnh (lùa vào trong tường)
function taoCuaKinh() {
  S.cuaKinh = { k: 0, muc: 0, cho: 0, canh: [] };
  for (const s of [-1, 1]) {
    const g = new THREE.Group(); g.userData.khongCan = true;
    const kinh = new THREE.Mesh(new THREE.BoxGeometry(1.94, 2.3, 0.012), VL_KINH_CUA); kinh.position.set(0, 1.19, 0); kinh.userData.rieng = true; g.add(kinh);
    for (const [w, h, x, y] of [[1.98, 0.06, 0, 0.03], [1.98, 0.06, 0, 2.35], [0.05, 2.38, -0.965, 1.19], [0.05, 2.38, 0.965, 1.19]]) { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, 0.04), vl(0x3a3d44)); m.position.set(x, y, 0); m.userData.rieng = true; g.add(m); }
    const tay = new THREE.Mesh(new THREE.BoxGeometry(0.03, 0.6, 0.07), vl(0xc9ccd0)); tay.position.set(-s * 0.9, 1.1, 0); tay.userData.rieng = true; g.add(tay);
    S.nhom.add(g); S.cuaKinh.canh.push({ g, s });
  }
  datCuaKinh();
}
function datCuaKinh() { const ck = S.cuaKinh, t = ck.k * ck.k * (3 - 2 * ck.k); for (const { g, s } of ck.canh) g.position.set(2 + s * (1.0 + t * 1.92), 0, 14); }

// ================= THANG MÁY =================
// điểm bấm thang máy, cùng dạng với CAU_THANG để game3d.js nối vào
export const THANG_MAY = [
  { id: "tm_len", tang: 0, x: 5.75, z: 9.1, toi: { tang: 1, x: 5.55, z: 9.1, huong: Math.PI / 2 }, nhan: "Đi thang máy lên tầng 2", thangMay: true },
  { id: "tm_xuong", tang: 1, x: 5.75, z: 9.1, toi: { tang: 0, x: 5.55, z: 9.1, huong: Math.PI / 2 }, nhan: "Đi thang máy xuống tầng 1", thangMay: true },
];
function thangMay() {
  const X0 = 6.4, Z1 = 8.1, Z2 = 10.1, ZC = 9.1;
  for (const tang of [0, 1]) {
    const y = tang * CAO, X1 = tang === 0 ? 8.875 : 7.875;
    // giếng thang: ốp đá xám, viền inox
    K(X1 - X0, TC, Z2 - Z1, 0x8f8a80, (X0 + X1) / 2, y, (Z1 + Z2) / 2, { can: true });
    const M = mat("x", X0 + NUA, -1, tang); // mặt trước nhìn ra hướng -x
    M.hop(ZC, 0, 1.2, 2.32, 0.03, 0xb9bcc1);                 // khung inox quanh cửa
    for (const k of [-1, 1]) M.hop(ZC + k * 0.255, 0.02, 0.5, 2.12, 0.045, 0xd3d6da); // hai cánh cửa đóng
    M.hop(ZC, 0.02, 0.012, 2.12, 0.05, 0x5a5d63);              // khe giữa hai cánh
    M.hop(ZC, 0, 1.2, 0.02, 0.06, 0x9a9da2);                  // ray dưới chân cửa
    M.hop(ZC, 2.36, 0.46, 0.18, 0.03, 0x1c1c1f);               // bảng báo tầng
    M.phang(ZC, 2.45, 0.42, 0.14, AT_MAN.lay("tm_" + tang, 128, 44, (g, w, h) => { R(g, 0, 0, w, h, "#120404"); chu(g, tang ? "2" : "1", 40, h / 2 + 2, 40, 34, "#ff3b2a", 800, "center", "monospace"); g.fillStyle = "#ff3b2a"; g.beginPath(); if (tang) { g.moveTo(80, 12); g.lineTo(104, 12); g.lineTo(92, 32); } else { g.moveTo(80, 32); g.lineTo(104, 32); g.lineTo(92, 12); } g.fill(); }), VL_MAN, 0.032);
    M.hop(ZC + 0.8, 0.95, 0.12, 0.3, 0.02, 0xb9bcc1);        // hộp nút gọi
    M.phang(ZC + 0.8, 1.1, 0.1, 0.26, AT_MAN.lay("tm_nut" + tang, 40, 104, (g, w, h) => { R(g, 0, 0, w, h, "#c9ccd0"); tron(g, w / 2, tang ? 72 : 32, 14, "#ffd166"); tron(g, w / 2, tang ? 72 : 32, 10, "#fff2b8"); g.fillStyle = "#7a5a10"; g.beginPath(); if (tang) { g.moveTo(w / 2 - 6, 68); g.lineTo(w / 2 + 6, 68); g.lineTo(w / 2, 78); } else { g.moveTo(w / 2 - 6, 36); g.lineTo(w / 2 + 6, 36); g.lineTo(w / 2, 26); } g.fill(); tron(g, w / 2, tang ? 32 : 72, 10, "#9a9da2"); }), VL_MAN, 0.022);
    bangIn(M, ZC - 0.8, 1.45, 0.3, 0.17, "thang_may_bien", 192, 0xb9bcc1);
    bangIn(M, ZC - 0.8, 1.15, 0.3, 0.12, "uu_tien", 192, 0xb9bcc1);
    // len chân và viền trần cho giếng thang
    M.hop((Z1 + Z2) / 2, 0, Z2 - Z1, 0.1, 0.012, 0x5a5048);
  }
  // tivi treo trên mặt hông giếng thang (nhìn về ghế chờ ở sảnh)
  K(1.72, 1.0, 0.05, 0x111111, 7.65, 1.5, Z1 - 0.025);
  // phòng máy trên sân thượng
  K(2.5, 2.2, 2.0, 0xd9d2c4, 7.65, 2 * CAO, 9.1, { can: true }); K(2.7, 0.12, 2.2, 0xbdb3a1, 7.65, 2 * CAO + 2.2, 9.1);
  const MM = mat("x", 6.4 + NUA, -1, 2); MM.hop(9.1, 0, 0.8, 1.9, 0.04, 0x6b7380); MM.hop(9.35, 0.95, 0.04, 0.12, 0.07, 0xc9ccd0);
  bangIn(MM, 9.1, 1.7, 0.5, 0.18, "phong_may", 200, 0x6b7380);
  K(0.5, 0.35, 0.03, 0x9aa0a6, 7.65, 2 * CAO + 1.4, 8.085); // lưới thông gió
}

// ================= MÀN HÌNH (dùng chung với the-gioi.js) =================
// Mặt phẳng màn hình hiện nội dung theo khóa (chủ bàn). Vật liệu không chịu ánh sáng nên luôn sáng như màn hình thật.
export function manHinhPhang(w, h, khoa = "mac_dinh") { khoiTao(); return new THREE.Mesh(hinhPhang(w, h, layMan(khoa)), VL_MAN); }

// ================= ĐỒ TRÊN BÀN =================
const Y_BAN = 0.78;
function ly(x, y, z, mau, ry = 0) { TR(0.042, 0.1, mau, x, y, z); const [dx, dz] = [Math.cos(ry) * 0.05, -Math.sin(ry) * 0.05]; K(0.02, 0.06, 0.012, mau, x + dx, y + 0.02, z + dz, { ry }); TR(0.036, 0.004, 0x5a3a1a, x, y + 0.092, z); }
function lyGiay(x, y, z, nam = false) {
  if (!nam) { TR(0.03, 0.11, 0xf2efe6, x, y, z, { rTren: 0.04 }); TR(0.041, 0.012, 0xffffff, x, y + 0.11, z); return; }
  TR(0.03, 0.11, 0xf2efe6, x, y + 0.04, z, { rTren: 0.04, rz: Math.PI / 2 }); // đổ nằm
  K(0.16, 0.002, 0.11, 0x5a3a1a, x + 0.12, y, z + 0.01); // vũng cà phê
}
function chongGiay(x, y, z, w, d, cao, ry = 0) { const n = Math.max(1, Math.round(cao / 0.03)); for (let i = 0; i < n; i++) K(w, cao / n - 0.002, d, i % 4 === 3 ? 0xe9e4d6 : 0xf8f7f2, x + Math.sin(i * 7) * 0.008, y + i * cao / n, z + Math.cos(i * 5) * 0.008, { ry: ry + Math.sin(i * 3) * 0.04 }); }
function dienThoai(x, y, z, ry, mau, khoa) { K(0.075, 0.009, 0.15, mau, x, y, z, { ry }); P(0.066, 0.13, layMan(khoa), VL_MAN, x, y + 0.0105, z, { rx: -Math.PI / 2, ry }); }
function chauNho(x, y, z, la = 0x4f8a3c, chau = 0xf2f2ee, cao = 0.12) { TR(0.06, 0.09, chau, x, y, z, { rTren: 0.07 }); CAU(0.08, la, x, y + 0.09 + cao * 0.5, z, [1, cao / 0.12, 1]); }
function luoiHo(x, y, z) { TR(0.06, 0.1, 0x3a3d44, x, y, z, { rTren: 0.07 }); for (let i = 0; i < 6; i++) { const a = i * 1.05; K(0.035, 0.24 + (i % 3) * 0.05, 0.008, i % 2 ? 0x2f6b3a : 0x5b8a3a, x + Math.cos(a) * 0.025, y + 0.09, z + Math.sin(a) * 0.025, { ry: a, rz: Math.cos(a) * 0.12, rx: Math.sin(a) * 0.12 }); } }
function xuongRong(x, y, z) { TR(0.05, 0.07, 0xc9763a, x, y, z, { rTren: 0.06 }); TR(0.03, 0.14, 0x3d8a4a, x, y + 0.07, z, { seg: 8 }); TR(0.015, 0.06, 0x3d8a4a, x + 0.035, y + 0.12, z, { seg: 6 }); K(0.03, 0.012, 0.012, 0x3d8a4a, x + 0.02, y + 0.12, z); }
function senDa(x, y, z) { TR(0.05, 0.06, 0xf2f2ee, x, y, z, { rTren: 0.055 }); for (let i = 0; i < 6; i++) { const a = i * 1.05; CAU(0.035, 0x7fb08a, x + Math.cos(a) * 0.03, y + 0.07, z + Math.sin(a) * 0.03, [1, 0.5, 1]); } CAU(0.03, 0x9fd0a8, x, y + 0.085, z, [1, 0.7, 1]); }
function giayVo(x, y, z) { CAU(0.033, 0xf6f4ee, x, y + 0.03, z, [1, 0.85, 1.1]); }
function hopKhanGiay(x, y, z, ry = 0, mau = 0x6fb0d8) { K(0.22, 0.09, 0.12, mau, x, y, z, { ry }); K(0.07, 0.05, 0.05, 0xffffff, x, y + 0.09, z, { ry, rz: 0.3 }); }

function giayNhoManHinh(x, z, ds) { // dán quanh viền màn hình bàn chung (màn hình ở z - 0.25, mép trước z - 0.23)
  const cho = [[0.31, 1.27, 0.12], [-0.31, 1.27, -0.1], [0.31, 0.99, 0.06], [-0.31, 0.98, -0.12], [0.2, 1.33, -0.05]];
  ds.forEach(([s, mau], i) => { const [dx, y, rz] = cho[i]; P(0.075, 0.075, vungGiayNho(s, mau), VL_BIEN, x + dx, y, z - 0.25 + 0.0275 + i * 0.0005, { rz }); });
}
// đồ cá nhân theo chủ bàn (bàn ở x, z; người ngồi phía +z, màn hình phía -z)
const DO_BAN = {
  ran_doc(x, z) { const y = Y_BAN;
    ly(x - 0.62, y, z + 0.18, 0x2f6b3a); K(0.16, 0.02, 0.22, 0xf26fa6, x - 0.75, y, z - 0.16, { ry: 0.2 }); TR(0.006, 0.15, 0xf26fa6, x - 0.74, y + 0.026, z - 0.15, { rx: Math.PI / 2, ry: 0.3 });
    dienThoai(x + 0.74, y, z + 0.2, -0.3, 0x1c1c1f, "dt_chat"); luoiHo(x + 0.8, y, z - 0.3);
    giayNhoManHinh(x, z, [["TIN NÓNG", "#fff27a"], ["ĐỪNG NÓI AI", "#ffb3c7"]]); },
  hong_hot(x, z) { const y = Y_BAN;
    // giá đỡ điện thoại + điện thoại dựng đứng đang phát trực tiếp
    K(0.09, 0.012, 0.08, 0x2a2c31, x - 0.62, y, z - 0.12); K(0.012, 0.1, 0.06, 0x2a2c31, x - 0.62, y, z - 0.15, { ry: Math.PI / 2, rx: 0.3 });
    K(0.075, 0.15, 0.009, 0xf26fa6, x - 0.62, y + 0.012, z - 0.12, { rx: -0.25 }); P(0.066, 0.13, layMan("dt_feed"), VL_MAN, x - 0.62, y + 0.088, z - 0.11, { rx: -0.25 });
    dienThoai(x + 0.72, y, z + 0.2, 0.4, 0xd8c93a, "dt_chat");
    TR(0.045, 0.14, 0xc9a77a, x - 0.8, y, z + 0.18, { rTren: 0.05 }); TR(0.006, 0.2, 0x1c1c1f, x - 0.79, y + 0.06, z + 0.18); TR(0.05, 0.015, 0xeeeeee, x - 0.8, y + 0.14, z + 0.18);
    K(0.14, 0.05, 0.2, 0xe8702a, x + 0.78, y, z - 0.26, { ry: 0.5 }); K(0.12, 0.052, 0.06, 0xffcf3a, x + 0.78, y, z - 0.26, { ry: 0.5 });
    giayNhoManHinh(x, z, [["HÓNG", "#ffb3c7"], ["LIVE 8H", "#fff27a"]]); },
  chua_te_deadline(x, z) { const y = Y_BAN;
    lyGiay(x - 0.55, y, z + 0.15); lyGiay(x - 0.7, y, z - 0.05); lyGiay(x - 0.86, y, z + 0.2, true);
    chongGiay(x + 0.68, y, z - 0.12, 0.24, 0.32, 0.34, 0.05); chongGiay(x + 0.74, y, z + 0.2, 0.22, 0.18, 0.12, -0.2);
    K(0.1, 0.09, 0.05, 0xc0262d, x - 0.82, y, z - 0.35); for (const k of [-1, 1]) CAU(0.025, 0xd5d9dd, x - 0.82 + k * 0.04, y + 0.1, z - 0.35); P(0.06, 0.06, layBien("mat_dong_ho", 96, 96), VL_BIEN, x - 0.82, y + 0.045, z - 0.324);
    giayNhoManHinh(x, z, [["GẤP!!", "#ff8a8a"], ["HÔM QUA", "#fff27a"], ["DEADLINE", "#ffb36b"], ["ĐỪNG HỎI", "#b8f0a8"], ["31/10", "#fff27a"]]); },
  thuc_tap_sinh(x, z) { const y = Y_BAN;
    K(0.34, 0.012, 0.24, 0x2a5aa8, x - 0.62, y, z + 0.12, { ry: 0.08 }); giayNam(0.33, 0.23, layBien("so_ghi", 160, 112), x - 0.62, y + 0.012, z + 0.12, 0.08);
    TR(0.005, 0.14, 0x1f4fa8, x - 0.48, y + 0.02, z + 0.06, { rx: Math.PI / 2, ry: 0.6 });
    TR(0.035, 0.22, 0x9fd3f2, x - 0.86, y, z - 0.3); TR(0.025, 0.03, 0x2a5aa8, x - 0.86, y + 0.22, z - 0.3);
    K(0.06, 0.003, 0.09, 0xffffff, x + 0.62, y, z + 0.24, { ry: 0.3 }); giayNam(0.058, 0.088, layBien("the_tts", 64, 96), x + 0.62, y + 0.003, z + 0.24, 0.3); K(0.012, 0.004, 0.3, 0x6f9fd0, x + 0.66, y, z + 0.06, { ry: 0.5 });
    K(0.085, 0.003, 0.054, 0x1c1c1f, x + 0.78, y, z + 0.26, { ry: -0.2 }); K(0.02, 0.004, 0.015, 0xd8b45a, x + 0.76, y, z + 0.26, { ry: -0.2 });
    xuongRong(x + 0.8, y, z - 0.32);
    giayNhoManHinh(x, z, [["HỌC HỎI", "#b8f0a8"], ["ĐỪNG NGỦ", "#fff27a"]]); },
  bien_kich(x, z) { const y = Y_BAN;
    K(0.23, 0.06, 0.31, 0x1c1c1f, x - 0.66, y, z + 0.02, { ry: -0.1 }); K(0.21, 0.065, 0.29, 0xf8f7f2, x - 0.65, y, z + 0.02, { ry: -0.1 }); giayNam(0.2, 0.28, layBien("kich_ban", 100, 140), x - 0.65, y + 0.065, z + 0.02, -0.1);
    giayVo(x + 0.62, y, z + 0.22); giayVo(x + 0.78, y, z + 0.04); giayVo(x + 0.52, y, z - 0.34); giayVo(x - 0.5, y, z - 0.42);
    giayVo(x + 0.92, 0, z + 0.62); giayVo(x + 0.55, 0, z + 0.7); giayVo(x + 1.15, 0, z + 0.3);
    ly(x + 0.8, y, z - 0.3, 0xf6f6f2); TR(0.035, 0.1, 0x6b4a2f, x - 0.86, y, z - 0.32); for (let i = 0; i < 3; i++) TR(0.005, 0.15, [0xffcf3a, 0xc0262d, 0x2a5aa8][i], x - 0.86 + (i - 1) * 0.012, y + 0.04, z - 0.32);
    giayNhoManHinh(x, z, [["CẢNH 7??", "#fff27a"], ["CỦA AI?", "#ffb3c7"]]); },
  designer(x, z) { const y = Y_BAN;
    K(0.32, 0.012, 0.22, 0x1c1c1f, x + 0.7, y, z + 0.1, { ry: -0.12 }); K(0.24, 0.002, 0.15, 0x3a3d48, x + 0.71, y + 0.012, z + 0.1, { ry: -0.12 }); TR(0.006, 0.16, 0x2a2c31, x + 0.6, y + 0.02, z + 0.24, { rx: Math.PI / 2, ry: 0.9 });
    for (let i = 0; i < 6; i++) K(0.04, 0.004, 0.18, [0xe74c3c, 0xe8702a, 0xf1c40f, 0x2ecc71, 0x3498db, 0x9b59b6][i], x - 0.65 + Math.sin(i * 0.25 - 0.6) * 0.09, y + i * 0.004, z + 0.15 - Math.cos(i * 0.25 - 0.6) * 0.09 + 0.09, { ry: i * 0.25 - 0.6 });
    K(0.06, 0.07, 0.05, 0x1fb3a5, x - 0.82, y, z - 0.3); K(0.11, 0.1, 0.1, 0xf6f6f2, x - 0.82, y + 0.07, z - 0.3); for (const k of [-1, 1]) K(0.015, 0.025, 0.004, 0x1c1c1f, x - 0.82 + k * 0.025, y + 0.12, z - 0.249); K(0.12, 0.02, 0.11, 0xf26fa6, x - 0.82, y + 0.17, z - 0.3);
    senDa(x + 0.86, y, z - 0.33);
    giayNhoManHinh(x, z, [["LOGO TO HƠN", "#b8f0a8"], ["NHỎ LẠI", "#ffb3c7"], ["V9 FINAL", "#fff27a"]]); },
  sales(x, z) { const y = Y_BAN;
    K(0.18, 0.05, 0.2, 0x2a2c31, x - 0.62, y, z + 0.05, { ry: 0.15 }); K(0.2, 0.035, 0.05, 0x1c1c1f, x - 0.62, y + 0.05, z - 0.01, { ry: 0.15 }); P(0.1, 0.1, layMan("dt_chat"), VL_MAN, x - 0.6, y + 0.052, z + 0.08, { rx: -Math.PI / 2, ry: 0.15 });
    K(0.09, 0.03, 0.06, 0x8a8d92, x + 0.62, y, z + 0.25); K(0.085, 0.045, 0.006, 0xffffff, x + 0.62, y + 0.02, z + 0.25);
    K(0.07, 0.04, 0.07, 0x1c1c1f, x - 0.84, y, z - 0.3); TR(0.035, 0.08, 0xd8b45a, x - 0.84, y + 0.04, z - 0.3, { rTren: 0.045 }); TR(0.008, 0.03, 0xd8b45a, x - 0.84, y + 0.12, z - 0.3); K(0.07, 0.02, 0.02, 0xd8b45a, x - 0.84, y + 0.15, z - 0.3);
    K(0.23, 0.025, 0.31, 0x2a5aa8, x + 0.76, y, z - 0.15, { ry: -0.1 }); K(0.22, 0.02, 0.3, 0xf8f7f2, x + 0.76, y + 0.025, z - 0.15, { ry: -0.08 });
    giayNhoManHinh(x, z, [["KPI 300%", "#b8f0a8"], ["GỌI LẠI", "#fff27a"]]); },
  dan_dau_tu(x, z) { const y = Y_BAN;
    const lap = new THREE.Group(); lap.position.set(x + 0.7, y, z - 0.05); lap.rotation.y = -0.6;
    const de = new THREE.Mesh(new THREE.BoxGeometry(0.32, 0.015, 0.22), vl(0x8a8d92)); de.position.y = 0.0075; lap.add(de);
    const nap = new THREE.Group(); nap.position.set(0, 0.015, -0.11); nap.rotation.x = -0.22; lap.add(nap);
    const n1 = new THREE.Mesh(new THREE.BoxGeometry(0.32, 0.21, 0.01), vl(0x8a8d92)); n1.position.set(0, 0.105, 0); nap.add(n1);
    const mh = new THREE.Mesh(hinhPhang(0.29, 0.17, layMan("chart2")), VL_MAN); mh.position.set(0, 0.11, 0.0055); nap.add(mh);
    them(lap);
    giayNam(0.21, 0.15, layBien("in_chart", 140, 100), x - 0.66, y, z + 0.1, 0.25); giayNam(0.21, 0.15, layBien("in_chart", 140, 100), x - 0.62, y + 0.002, z + 0.16, -0.15);
    K(0.12, 0.06, 0.05, 0xd8b45a, x - 0.84, y + 0.03, z - 0.3); K(0.06, 0.05, 0.05, 0xd8b45a, x - 0.77, y + 0.06, z - 0.3); for (const k of [-1, 1]) K(0.04, 0.012, 0.012, 0xd8b45a, x - 0.75, y + 0.12, z - 0.3 + k * 0.03, { ry: k * 0.4 }); for (const dx of [-0.05, 0.05]) for (const dz of [-0.02, 0.02]) K(0.014, 0.03, 0.014, 0xd8b45a, x - 0.84 + dx, y, z - 0.3 + dz);
    ly(x - 0.86, y, z + 0.08, 0x3f8a4f);
    giayNhoManHinh(x, z, [["CẮT LỖ?", "#ff8a8a"], ["GỒNG", "#b8f0a8"]]); },
  thanh_xin_nghi(x, z) { const y = Y_BAN;
    giayNam(0.15, 0.21, layBien("don_nghi", 100, 140), x - 0.62, y, z + 0.13, 0.12); giayNam(0.15, 0.21, layBien("don_nghi", 100, 140), x - 0.58, y + 0.002, z + 0.1, -0.2);
    hopKhanGiay(x - 0.82, y, z - 0.28, 0.2);
    K(0.12, 0.05, 0.08, 0xffffff, x + 0.7, y, z - 0.18, { ry: 0.3 }); K(0.04, 0.052, 0.012, 0xc0262d, x + 0.7, y, z - 0.18, { ry: 0.3 }); K(0.012, 0.052, 0.04, 0xc0262d, x + 0.7, y, z - 0.18, { ry: 0.3 });
    for (let i = 0; i < 2; i++) K(0.1, 0.006, 0.06, 0xc9ccd0, x + 0.64 + i * 0.03, y + i * 0.006, z + 0.2, { ry: i * 0.4 });
    TR(0.005, 0.12, 0xf6f6f2, x + 0.84, y + 0.006, z + 0.12, { rx: Math.PI / 2, ry: 0.5 }); TR(0.006, 0.02, 0xc0262d, x + 0.81, y + 0.006, z + 0.17, { rx: Math.PI / 2, ry: 0.5 });
    ly(x + 0.85, y, z - 0.38, 0xd8a24a); K(0.14, 0.004, 0.09, 0x9fd3f2, x + 0.48, y, z - 0.42, { ry: 0.2 });
    giayNhoManHinh(x, z, [["BÀ NGOẠI ỐM", "#9fd3f2"], ["NGHỈ T6?", "#fff27a"]]); },
  con_ong_chau_cha(x, z) { const y = Y_BAN;
    K(0.06, 0.012, 0.06, 0xd8b45a, x - 0.7, y, z - 0.25); K(0.012, 0.12, 0.012, 0xd8b45a, x - 0.7, y, z - 0.25);
    TR(0.11, 0.012, 0xd8b45a, x - 0.7, y + 0.2, z - 0.25, { rx: Math.PI / 2 + 0.15 }); TR(0.095, 0.004, 0xe6f0f5, x - 0.7, y + 0.2, z - 0.243, { rx: Math.PI / 2 + 0.15, seg: 16 });
    for (let i = 0; i < 2; i++) { TR(0.012, 0.06, 0x1c1c1f, x + 0.58 + i * 0.04, y, z + 0.22); TR(0.009, 0.02, i ? 0xb3164a : 0xe0335a, x + 0.58 + i * 0.04, y + 0.06, z + 0.22); }
    TR(0.04, 0.014, 0xd8b45a, x + 0.75, y, z + 0.22, { seg: 14 });
    K(0.05, 0.08, 0.03, 0xf5b9cf, x + 0.84, y, z - 0.05); TR(0.014, 0.025, 0xd8b45a, x + 0.84, y + 0.08, z - 0.05);
    K(0.04, 0.012, 0.07, 0x1c1c1f, x + 0.62, y, z - 0.12, { ry: 0.6 }); TR(0.018, 0.004, 0xc9ccd0, x + 0.6, y, z - 0.07, { seg: 10 });
    for (const k of [-1, 1]) K(0.05, 0.008, 0.035, 0x111111, x + 0.78 + k * 0.03, y, z - 0.32, { ry: 0.2 }); K(0.13, 0.006, 0.006, 0xd8b45a, x + 0.78, y + 0.008, z - 0.34, { ry: 0.2 });
    dienThoai(x - 0.86, y, z + 0.15, 0.2, 0xd8b45a, "dt_feed");
    giayNhoManHinh(x, z, [["GỌI CHÚ", "#ffd3a8"]]); },
};
function doDungChung(x, z) { // chuột, lót chuột, ổ cắm kéo dài dưới chân bàn
  K(0.22, 0.004, 0.18, 0x22305a, x + 0.4, Y_BAN, z + 0.15); K(0.06, 0.025, 0.1, 0x2a2a2a, x + 0.4, Y_BAN + 0.004, z + 0.15);
  K(0.3, 0.04, 0.06, 0xf4f2ee, x - 0.4, 0, z - 0.32); K(0.6, 0.012, 0.012, 0x1c1c1f, x - 0.1, 0, z - 0.36);
  K(0.012, Y_BAN, 0.012, 0x1c1c1f, x + 0.12, 0, z - 0.42);
}

// ================= DỰNG TOÀN BỘ =================
// nhom: nhóm được gộp khối; hop: hàm dựng khối của the-gioi.js; vat: vật cản theo tầng; banChung: [{x, z, chu}]
export function themChiTietCongTy(nhom, hop, vat, { banChung = [] } = {}) {
  khoiTao();
  S = { nhom, vat, dongHo: [], cua: [], cuaMesh: null, cuaKinh: null, gioCu: -1 };
  vungTroi = AT_MAN.lay("troi", 512, 192, veTroi);
  const y2 = CAO, y3 = 2 * CAO;

  // ---------- cửa sổ, khung cửa, len chân tường ----------
  for (const c of CUA_SO) cuaSo(c);
  for (const l of LO_CUA) khungCua(l);
  khungCua(["z", 14, 0, 4, 0], 0x3a3d44, 0.31); // khung nhôm cửa chính
  const D0 = [[-16, -14], [-7, -5], [0, 2], [7, 9], [15, 17]], D1A = [[-15, -13], [-5, -3], [5, 7], [15, 17]], D1B = [[-14, -12], [-3, -1], [2.5, 7.5], [13, 15]];
  lenChan("z", -6, 1, -19.875, 19.875, D0, 0); lenChan("z", -6, -1, -19.875, 19.875, D0, 0);
  for (const x of [-10, -2, 4, 12]) for (const h of [-1, 1]) lenChan("x", x, h, -13.875, -6.125, [], 0);
  for (const x of [-2, 9]) for (const h of [-1, 1]) lenChan("x", x, h, -2, 13.875, [[3, 8]], 0);
  lenChan("z", -14, 1, -19.875, 19.875, [], 0); lenChan("z", 14, -1, -19.875, 19.875, [[0, 4]], 0);
  lenChan("x", -20, 1, -13.875, 13.875, [], 0); lenChan("x", 20, -1, -13.875, 13.875, [], 0);
  lenChan("z", -4, 1, -19.875, 19.875, D1A, 1); lenChan("z", -4, -1, -19.875, 19.875, D1A, 1);
  lenChan("z", 2, 1, -19.875, 19.875, D1B, 1); lenChan("z", 2, -1, -19.875, 19.875, D1B, 1);
  for (const x of [-8, 0, 12]) for (const h of [-1, 1]) lenChan("x", x, h, -13.875, -4.125, [], 1);
  for (const x of [-6, 2, 8]) for (const h of [-1, 1]) lenChan("x", x, h, 2.125, 13.875, [], 1);
  lenChan("z", -14, 1, -19.875, 19.875, [], 1); lenChan("z", 14, -1, -19.875, 19.875, [], 1);
  lenChan("x", -20, 1, -13.875, 13.875, [], 1); lenChan("x", 20, -1, -13.875, 13.875, [], 1);
  // công tắc đèn bên trong phòng, cạnh mép cửa
  for (const [truc, c, a, b, tang, s] of LO_CUA) if (s) congTac(mat(truc, c, s, tang), b + 0.27);

  // ---------- cửa đi, cửa kính sảnh, thang máy ----------
  taoCua(); taoCuaKinh(); thangMay();

  // ================= TẦNG 1 =================
  // --- Hành lang tầng 1 (mặt tường z = -6 nhìn ra hành lang) ---
  const HL1 = mat("z", -6, 1, 0);
  tranhKhung(HL1, -18, 1.75, 1.2, 0.8, "phong_canh");
  tranhKhung(HL1, -8.6, 1.7, 0.8, 1.0, "truu_tuong", 0xd8b45a);
  tranhKhung(HL1, -2.5, 1.65, 1.0, 0.7, "pho_dem");
  thoatHiem(HL1, -2.5, 2.7, [1, 0]);
  bangGhim(HL1, 4.5, 1.62, 1.8, 1.06, "bang_tin_1");
  dongHo(HL1, 4.5, 2.62);
  bangIn(HL1, 10.0, 1.75, 0.72, 1.0, "noi_quy_pccc", 256); bangIn(HL1, 10.95, 1.75, 0.72, 1.0, "tieu_lenh", 256);
  keBinh(HL1, 10.48);
  HL1.hop(12.1, 1.34, 0.13, 0.13, 0.05, 0xc0262d); HL1.phang(12.1, 1.405, 0.11, 0.11, layBien("nut_bao_chay", 80, 80), VL_BIEN, 0.052);
  HL1.tru(12.1, 2.2, 0.1, 0.07, 0xc0262d, 0.035); HL1.tru(12.1, 2.2, 0.03, 0.08, 0x8a1414, 0.04);
  thoatHiem(HL1, 13.6, 2.7, [-1, 0]);
  HL1.hop(18.5, 0.7, 0.7, 1.0, 0.2, 0xc0262d); HL1.phang(18.5, 1.2, 0.64, 0.94, layBien("tu_voi", 160, 236), VL_BIEN, 0.202);
  oCam(HL1, -10); oCam(HL1, 6); oCam(HL1, 14.5);
  camera(19.7, TC, -5.7, huongVe(19.7, -5.7, 0, -3)); camera(-19.7, TC, -5.7, huongVe(-19.7, -5.7, 0, -3));

  // --- Phòng kế toán ---
  const KT_T = mat("z", -6, -1, 0), KT_P = mat("x", -10, -1, 0), KT_S = mat("z", -14, 1, 0);
  dongHo(KT_T, -18, 2.7); mayLanh(KT_P, -10, 2.75);
  bangIn(KT_P, -12.4, 1.7, 0.62, 0.82, "hoa_don", 192, 0x1f7a45);
  oCam(KT_S, -15.2); oCam(KT_S, -12.0); oCam(mat("x", -20, 1, 0), -7.2);
  { const y = 0.75;
    K(0.5, 0.025, 0.17, 0x2a2a2a, -14.7, y, -10.85); K(0.06, 0.025, 0.1, 0x2a2a2a, -14.28, y, -10.85);
    K(0.1, 0.018, 0.16, 0x2a2c31, -15.35, y, -10.85, { ry: 0.1 }); K(0.07, 0.004, 0.03, 0x9fbf8a, -15.35, y + 0.018, -10.91, { ry: 0.1 });
    TR(0.022, 0.07, 0x7a1424, -13.85, y, -10.62); TR(0.03, 0.02, 0x1c1c1f, -13.85, y + 0.07, -10.62); K(0.1, 0.02, 0.07, 0x1c1c1f, -13.72, y, -10.8);
    K(0.32, 0.02, 0.16, 0x6b4a2f, -16.0, y, -10.78); for (let r = 0; r < 4; r++) { K(0.3, 0.006, 0.006, 0x3a2a1a, -16.0, y + 0.02, -10.84 + r * 0.04); for (let k = 0; k < 3; k++) K(0.03, 0.016, 0.02, 0xc0262d, -16.08 + k * 0.035 + (r % 2) * 0.05, y + 0.015, -10.84 + r * 0.04); }
    TR(0.04, 0.008, 0x1c1c1f, -16.38, y, -10.8); TR(0.003, 0.12, 0xc9ccd0, -16.38, y, -10.8); for (let i = 0; i < 5; i++) K(0.07, 0.002, 0.09, 0xf8f7f2, -16.38, y + 0.01 + i * 0.012, -10.8, { ry: i * 0.5 });
    chauNho(-13.75, y, -10.05, 0x2f7a3a, 0x8a5a3a, 0.16); ly(-13.72, y, -10.4, 0xf6f6f2); }
  camera(-19.7, TC, -13.7, huongVe(-19.7, -13.7, -15, -10));

  // --- Phòng nhân sự ---
  const HR_T = mat("z", -6, -1, 0), HR_P = mat("x", -2, -1, 0), HR_Tr = mat("x", -10, 1, 0), HR_S = mat("z", -14, 1, 0);
  dongHo(HR_T, -8.4, 2.7); mayLanh(HR_P, -9.2, 2.75);
  tranhKhung(HR_Tr, -12.6, 1.8, 0.55, 1.1, "chu_nhan", 0x7a1424);
  bangIn(HR_P, -11.8, 2.0, 0.62, 0.6, "quy_trinh_nghi", 220, 0x2fa39a);
  oCam(HR_S, -6.2); oCam(HR_Tr, -7.4);
  { const y = 0.75;
    K(0.5, 0.025, 0.17, 0x2a2a2a, -6.3, y, -10.85); K(0.06, 0.025, 0.1, 0x2a2a2a, -5.88, y, -10.85);
    K(0.3, 0.075, 0.02, 0x1c1c1f, -6.0, y, -9.96); P(0.29, 0.07, layBien("ten_hr", 260, 64), VL_BIEN, -6.0, y + 0.038, -9.948);
    hopKhanGiay(-7.05, y, -10.15, 0.1, 0x9fd8c0);
    chongGiay(-4.95, y, -10.82, 0.22, 0.3, 0.08, 0.1);
    TR(0.022, 0.07, 0x2fa39a, -4.88, y, -10.28); }

  // --- Phòng server ---
  const SV_P = mat("x", 4, -1, 0), SV_Tr = mat("x", -2, 1, 0);
  bangIn(SV_P, -9.2, 1.7, 0.8, 0.45, "tat_bat", 256, 0x111111);
  mayLanh(SV_Tr, -9.6, 2.75);
  K(0.5, 1.8, 0.36, 0xf2f2ee, 3.45, 0, -13.5); K(0.4, 0.5, 0.37, 0xc9ccd0, 3.45, 1.1, -13.5); K(0.44, 0.04, 0.37, 0x3fb8e0, 3.45, 1.66, -13.5); // máy lạnh tủ đứng
  P(0.4, 0.2, layBien("khong_rut", 200, 100), VL_BIEN, 0.7, 0.55, -12.69);
  binhChuaChay(-1.6, 0, -13.5, 0x1c1c1f);
  { const lap = new THREE.Group(); lap.position.set(2.7, 0.73, -7.2); lap.rotation.y = Math.PI; // nắp laptop trên bàn IT (màn quay về ghế của Bảo phía trong phòng)
    const nap = new THREE.Group(); nap.position.set(0, 0, -0.175); nap.rotation.x = -0.25; lap.add(nap);
    const n1 = new THREE.Mesh(new THREE.BoxGeometry(0.5, 0.32, 0.012), vl(0x222222)); n1.position.y = 0.16; nap.add(n1);
    const mh = new THREE.Mesh(hinhPhang(0.46, 0.28, layMan("laptop_it")), VL_MAN); mh.position.set(0, 0.165, 0.007); nap.add(mh); them(lap); }
  camera(-1.75, TC, -6.4, huongVe(-1.75, -6.4, 1, -12));

  // --- Kho sự kiện ---
  const KHO_P = mat("x", 12, -1, 0);
  bangIn(KHO_P, -8.2, 1.75, 0.7, 0.62, "muon_do", 220, 0x7d1424);
  K(0.02, 0.3, 0.2, 0x6b4a2f, 11.865, 1.0, -9.0); K(0.005, 0.26, 0.18, 0xf8f7f2, 11.853, 1.01, -9.0); hop0(1.4, 1.0, 10.55, -13.2, 0);
  [["thung_1", 0], ["thung_2", 0.42], ["thung_3", 0.84]].forEach(([t, y], i) => { K(0.62, 0.42, 0.5, 0xc4a06a, 10.2 + (i % 2) * 0.06, y, -13.45); P(0.4, 0.14, layBien(t, 160, 56), VL_BIEN, 10.2 + (i % 2) * 0.06, y + 0.21, -13.195); });
  K(0.6, 0.4, 0.45, 0xb8935f, 10.95, 0, -12.8);

  // --- Toilet: nước xịt phòng ---
  K(0.1, 0.18, 0.08, 0xf2f2ee, 19.82, 2.0, -11.0); TR(0.025, 0.12, 0xf26fa6, 19.82, 2.03, -11.0);

  // --- Sảnh ---
  const SANH_T = mat("z", 14, -1, 0), SANH_Tr = mat("x", -2, 1, 0), LOGO = mat("z", -1.97, 1, 0, 0.1);
  thoatHiem(SANH_T, 2, 2.82);
  dongHo(LOGO, 2, 3.2, 0.2);
  mayLanh(SANH_Tr, 12.6, 2.8);
  oCam(SANH_T, 4.8, 0.3);
  camera(8.65, TC, 13.65, huongVe(8.65, 13.65, 2, 8)); camera(-1.65, TC, 13.65, huongVe(-1.65, 13.65, 2, 8));
  // lễ tân: bàn làm việc thấp phía sau quầy, ghế, máy tính, đồ trên quầy
  hop(3.6, 0.74, 0.6, 0xe9e2d4, 2, 0, 7.65);
  { const m = manHinhPhang(0.5, 0.29, "le_tan"); m.position.set(1.4, 0.74 + 0.33, 7.73); m.rotation.y = Math.PI; them(m);
    K(0.56, 0.35, 0.03, 0x1a1b1f, 1.4, 0.74 + 0.15, 7.76); K(0.05, 0.15, 0.05, 0x1a1b1f, 1.4, 0.74, 7.8); K(0.2, 0.012, 0.15, 0x1a1b1f, 1.4, 0.74, 7.8);
    K(0.44, 0.02, 0.15, 0x2a2a2a, 1.4, 0.74, 7.5); K(0.05, 0.02, 0.09, 0x2a2a2a, 1.75, 0.74, 7.5);
    K(0.2, 0.06, 0.16, 0x2a2c31, 2.6, 0.74, 7.55); K(0.21, 0.035, 0.05, 0x1c1c1f, 2.6, 0.8, 7.62);
    ly(3.2, 0.74, 7.55, 0xe8702a); }
  { const g = new THREE.Group(); g.position.set(2, 0, 6.85); hop0(0.5, 0.5, 2, 6.85, 0);
    const add = (w, h, d, c, x, y, z) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vl(c)); m.position.set(x, y + h / 2, z); g.add(m); };
    add(0.5, 0.07, 0.5, 0x22305a, 0, 0.44, 0); add(0.5, 0.55, 0.07, 0x22305a, 0, 0.55, -0.22); add(0.06, 0.44, 0.06, 0x222222, 0, 0, 0); add(0.5, 0.03, 0.06, 0x222222, 0, 0.02, 0); add(0.06, 0.03, 0.5, 0x222222, 0, 0.02, 0);
    S.nhom.add(g); }
  { const y = 1.18;
    TR(0.05, 0.015, 0xc9ccd0, 0.9, y, 8.7); CAU(0.04, 0xd8b45a, 0.9, y + 0.03, 8.7, [1, 0.8, 1]);
    K(0.36, 0.015, 0.25, 0x7a1424, 2.6, y, 8.66, { ry: 0.05 }); K(0.34, 0.017, 0.23, 0xf8f7f2, 2.6, y, 8.66, { ry: 0.05 }); TR(0.005, 0.14, 0x1c1c1f, 2.85, y + 0.02, 8.72, { rx: Math.PI / 2, ry: 0.4 });
    TR(0.1, 0.06, 0xf2f2ee, 3.45, y, 8.7, { rTren: 0.13 }); for (let i = 0; i < 6; i++) CAU(0.025, [0xc0262d, 0xffcf3a, 0x2fa39a][i % 3], 3.45 + Math.cos(i) * 0.06, y + 0.06, 8.7 + Math.sin(i) * 0.06);
    K(0.12, 0.015, 0.08, 0x1c1c1f, 0.35, y, 8.72); K(0.1, 0.14, 0.012, 0x1c1c1f, 0.35, y, 8.72, { rx: -0.2 }); P(0.09, 0.12, layBien("qr", 88, 118), VL_BIEN, 0.35, y + 0.072, 8.739, { rx: -0.2 });
    P(0.8, 0.2, layBien("ten_le_tan", 320, 80), VL_BIEN, 2, 0.75, 9.006); }
  // bàn trà sofa: tạp chí, khay kẹo
  P(0.2, 0.28, layBien("tap_chi_1", 100, 140), VL_BIEN, 6.25, 0.402, 10.8, { rx: -Math.PI / 2, ry: 0.3 }); P(0.2, 0.28, layBien("tap_chi_2", 100, 140), VL_BIEN, 6.45, 0.405, 10.75, { rx: -Math.PI / 2, ry: -0.2 });
  hopKhanGiay(6.85, 0.4, 10.8, 0.1, 0xf2f2ee);
  K(5.2, 0.7, 0.012, 0xc85a1e, 2, 2.65, 7.95); // mặt sau băng rôn khẩu hiệu (trước đây nhìn từ sau thấy mỗi hai sợi dây)

  // --- Khu làm việc chung ---
  const KLV_P = mat("x", -2, -1, 0), KLV_Tr = mat("x", -20, 1, 0);
  dongHo(KLV_P, 0.5, 2.75); bangGhim(KLV_P, 10.6, 1.72, 1.3, 1.2, "bang_tin_phong", 264);
  congTac(KLV_P, 2.66);
  oCam(KLV_P, -1.0); oCam(KLV_P, 12.2); oCam(KLV_Tr, 3.0); oCam(KLV_Tr, 8.6);
  camera(-19.7, TC, 13.7, huongVe(-19.7, 13.7, -10, 5));
  for (const b of banChung) { doDungChung(b.x, b.z); DO_BAN[b.chu]?.(b.x, b.z); }

  // --- Pantry ---
  const PT_Tr = mat("x", 9, 1, 0), PT_P = mat("x", 20, -1, 0);
  mayLanh(PT_P, 6.3, 2.8); dongHo(PT_Tr, 12.2, 2.62);
  bangIn(PT_Tr, 12.2, 1.6, 0.8, 0.7, "truc_nhat", 256, 0xe8702a);
  bangIn(PT_Tr, 9.55, 1.32, 1.2, 0.26, "phan_loai", 320, 0x2e8b57);
  bangIn(PT_Tr, 9.55, 1.75, 0.7, 0.5, "noi_quy_pantry", 256, 0x2e8b57);
  [["rac_huu_co", 0x2e8b57], ["rac_tai_che", 0x2a5aa8], ["rac_khac", 0x6b6f76]].forEach(([t, c], i) => {
    const z = 9.0 + i * 0.5; K(0.4, 0.62, 0.42, c, 9.45, 0, z); K(0.42, 0.05, 0.44, 0x2a2c31, 9.45, 0.62, z); P(0.3, 0.2, layBien(t, 150, 100), VL_BIEN, 9.656, 0.4, z, { ry: Math.PI / 2 }); });
  hop0(0.42, 1.44, 9.45, 9.5, 0);
  oCam(PT_Tr, 11.0); oCam(PT_P, 1.6);
  P(0.6, 0.38, layBien("rua_ly", 256, 160), VL_BIEN, 15.0, 2.2, 13.408, { ry: Math.PI });
  // cây treo ly, hũ đường, hũ cà phê
  TR(0.1, 0.02, 0x6b4a2f, 18.2, 0.95, 13.1); TR(0.012, 0.42, 0x6b4a2f, 18.2, 0.95, 13.1);
  for (let i = 0; i < 4; i++) { const a = i * Math.PI / 2 + 0.4, x = 18.2 + Math.cos(a) * 0.1, z = 13.1 + Math.sin(a) * 0.1; K(0.1, 0.01, 0.01, 0x6b4a2f, 18.2 + Math.cos(a) * 0.05, 1.27 - (i % 2) * 0.08, 13.1 + Math.sin(a) * 0.05, { ry: -a }); TR(0.04, 0.09, [0xf6f6f2, 0xe8702a, 0x2a5aa8, 0xf26fa6][i], x, 1.12 - (i % 2) * 0.08, z); }
  for (const [x, c, n] of [[12.72, 0xf6f6f2, 0xe8e4da], [12.86, 0x6b4a2f, 0x3a2a1a]]) { TR(0.05, 0.12, 0xdfeaf0, x, 0.95, 13.25); TR(0.044, 0.08, n, x, 0.955, 13.25); TR(0.052, 0.025, c, x, 1.07, 13.25); }
  // tủ lạnh: tay nắm, nam châm, giấy nhắn
  K(0.03, 0.6, 0.04, 0xc9ccd0, 18.82, 0.45, 12.33);
  P(0.14, 0.14, layBien("tu_lanh_1", 72, 72), VL_BIEN, 19.25, 0.85, 12.344, { ry: Math.PI, rz: 0.06 }); P(0.14, 0.14, layBien("tu_lanh_2", 72, 72), VL_BIEN, 19.5, 0.68, 12.343, { ry: Math.PI, rz: -0.08 });
  for (const [x, y, c] of [[19.25, 0.93, 0xc0262d], [19.5, 0.76, 0x2a5aa8], [19.0, 1.88, 0xffcf3a], [19.4, 1.86, 0x2e8b57], [18.95, 1.0, 0xf26fa6]]) K(0.035, 0.035, 0.014, c, x, y - 0.0175, 12.343);
  // bàn ăn: hộp khăn giấy, bình nước, ly
  for (const tx of [12, 16]) { hopKhanGiay(tx + 0.7, 0.75, 5.62, 0.2, 0xe8702a); TR(0.07, 0.24, 0xbfe0f0, tx - 0.72, 0.75, 6.3); TR(0.05, 0.03, 0x2a5aa8, tx - 0.72, 0.99, 6.3); for (const dx of [-0.5, -0.92]) TR(0.035, 0.09, 0xe6f2f8, tx + dx, 0.75, 6.05 + (dx < -0.6 ? 0.08 : 0)); }
  // kệ đồ ăn vặt
  { const x = 19.62, z = 3.6;
    K(0.36, 1.5, 0.04, 0x8a6a4a, x, 0, z - 0.7); K(0.36, 1.5, 0.04, 0x8a6a4a, x, 0, z + 0.7); for (const y of [0.05, 0.5, 0.95, 1.4]) K(0.36, 0.03, 1.36, 0xa07a50, x, y, z);
    K(0.02, 1.45, 1.36, 0x8a6a4a, x + 0.17, 0.05, z); hop0(0.4, 1.44, x, z, 0);
    for (let i = 0; i < 6; i++) TR(0.05, 0.1, [0xc0262d, 0xe8702a, 0xffcf3a][i % 3], x, 0.08, z - 0.5 + i * 0.2, { rTren: 0.06 });
    for (let i = 0; i < 4; i++) K(0.24, 0.32, 0.08, [0x2fa39a, 0xf26fa6, 0xffcf3a, 0x2a5aa8][i], x, 0.53, z - 0.45 + i * 0.3, { ry: Math.PI / 2 + (i % 2 ? 0.1 : -0.1) });
    for (let i = 0; i < 3; i++) TR(0.1, 0.14, [0xc0262d, 0x2a5aa8, 0xd8b45a][i], x, 0.98, z - 0.4 + i * 0.4, { seg: 12 });
    K(0.2, 0.14, 0.14, 0xd8b45a, x, 1.43, z + 0.4); K(0.08, 0.005, 0.01, 0x1c1c1f, x - 0.1, 1.57, z + 0.4);
    P(0.6, 0.18, layBien("an_vat", 200, 60), VL_BIEN, x - 0.205, 1.62, z, { ry: -Math.PI / 2 }); K(0.04, 0.22, 0.62, 0x8a6a4a, x - 0.18, 1.51, z); }

  // ================= TẦNG 2 =================
  const HL2B = mat("z", -4, 1, 1), HL2N = mat("z", 2, -1, 1);
  tranhKhung(HL2B, -17.5, 1.75, 1.0, 0.75, "hoa_sen");
  bangGhim(HL2B, -9, 1.62, 1.8, 1.06, "bang_tin_2");
  thoatHiem(HL2B, -6.2, 2.75, [1, 0]);
  tranhKhung(HL2B, 1, 1.7, 1.1, 0.8, "van_hoa", 0xd8b45a); dongHo(HL2B, 1, 2.62);
  thoatHiem(HL2B, 18.4, 2.75, [-1, 0]);
  oCam(HL2B, -11); oCam(HL2B, 3.5);
  tranhKhung(HL2N, -17, 1.75, 1.2, 0.8, "dong_lua");
  tranhKhung(HL2N, -7.5, 1.7, 1.2, 0.85, "team");
  thoatHiem(HL2N, -4.0, 2.75, [1, 0]);
  thoatHiem(HL2N, 5, 2.62); // trên lối vào cầu thang
  bangIn(HL2N, 10.55, 1.75, 0.72, 1.0, "noi_quy_pccc", 256); bangIn(HL2N, 9.6, 1.75, 0.72, 1.0, "tieu_lenh", 256);
  keBinh(HL2N, 10.08);
  HL2N.hop(11.7, 1.34, 0.13, 0.13, 0.05, 0xc0262d); HL2N.phang(11.7, 1.405, 0.11, 0.11, layBien("nut_bao_chay", 80, 80), VL_BIEN, 0.052);
  HL2N.tru(11.7, 2.2, 0.1, 0.07, 0xc0262d, 0.035);
  HL2N.hop(17.5, 0.7, 0.7, 1.0, 0.2, 0xc0262d); HL2N.phang(17.5, 1.2, 0.64, 0.94, layBien("tu_voi", 160, 236), VL_BIEN, 0.202);
  // biển "ĐANG QUAY" phát sáng cạnh cửa studio
  HL2N.hop(-11.4, 2.5, 0.42, 0.16, 0.05, 0x1c1c1f); HL2N.phang(-11.4, 2.58, 0.38, 0.12, AT_MAN.lay("dang_quay", 160, 52, (g, w, h) => { R(g, 0, 0, w, h, "#d01c1c"); chu(g, "ĐANG QUAY", w / 2, h / 2, w - 12, 26, "#fff", 800, "center"); }), VL_MAN, 0.052);
  oCam(HL2N, -10); oCam(HL2N, 0.5);
  // cây nước tầng 2
  { const x = 19.45, z = 1.45; K(0.4, 1.0, 0.4, 0xf2f2ee, x, y2, z); K(0.3, 0.12, 0.05, 0x3a3d44, x - 0.2, y2 + 0.72, z); TR(0.14, 0.42, 0x7fb8e0, x, y2 + 1.0, z); for (const dz of [-0.07, 0.07]) K(0.04, 0.05, 0.03, dz < 0 ? 0x2a5aa8 : 0xc0262d, x - 0.215, y2 + 0.78, z + dz); hop0(0.4, 0.4, x, z, 1); }
  camera(-19.7, y2 + TC, -3.7, huongVe(-19.7, -3.7, 0, -1)); camera(19.7, y2 + TC, 1.7, huongVe(19.7, 1.7, 0, -1));

  // --- Phòng giám đốc ---
  const GD_P = mat("x", -8, -1, 1), GD_T = mat("z", -4, -1, 1);
  mayLanh(GD_P, -11, 2.8); dongHo(GD_P, -13.2, 2.4, 0.22);
  tranhKhung(GD_P, -6.4, 1.8, 1.2, 0.8, "ca_chep", 0xd8b45a);
  oCam(GD_T, -17); oCam(GD_P, -9.4);
  { const y = y2 + 0.8;
    const m = manHinhPhang(0.64, 0.36, "giam_doc"); m.position.set(-14.7, y + 0.35, -10.38); m.rotation.y = Math.PI; them(m);
    K(0.7, 0.42, 0.04, 0x1a1b1f, -14.7, y + 0.14, -10.35); K(0.06, 0.15, 0.06, 0x1a1b1f, -14.7, y, -10.33); K(0.24, 0.015, 0.18, 0x1a1b1f, -14.7, y, -10.33);
    K(0.5, 0.025, 0.17, 0x2a2a2a, -14.7, y, -10.95); K(0.06, 0.025, 0.1, 0x2a2a2a, -14.28, y, -10.95);
    K(0.5, 0.11, 0.03, 0x1c1c1f, -14.0, y, -9.96, { rx: 0.15 }); P(0.48, 0.1, layBien("ten_gd", 240, 50), VL_BIEN, -14.0, y + 0.058, -9.937, { rx: 0.15 });
    K(0.3, 0.06, 0.2, 0x5a2a1a, -15.3, y, -10.4); TR(0.012, 0.13, 0x6b3a1a, -15.3, y + 0.065, -10.4, { rz: Math.PI / 2 });
    TR(0.04, 0.12, 0x1c1c1f, -12.75, y, -10.85); for (let i = 0; i < 3; i++) TR(0.005, 0.16, [0xd8b45a, 0x1c1c1f, 0xc0262d][i], -12.75 + (i - 1) * 0.012, y + 0.04, -10.85);
    ly(-13.4, y, -10.95, 0xf6f6f2); K(0.075, 0.009, 0.15, 0x1c1c1f, -15.4, y, -10.95, { ry: 0.3 }); }

  // --- Phó giám đốc ---
  const PG_Tr = mat("x", -8, 1, 1), PG_P = mat("x", 0, -1, 1);
  mayLanh(PG_Tr, -9, 2.8); tranhKhung(PG_P, -9, 1.8, 1.2, 0.8, "phong_canh", 0x3a2a1a);
  { const y = y2 + 0.75, m = manHinhPhang(0.64, 0.36, "pho_giam_doc"); m.position.set(-4.4, y + 0.35, -10.38); m.rotation.y = Math.PI; them(m);
    K(0.7, 0.42, 0.04, 0x1a1b1f, -4.4, y + 0.14, -10.35); K(0.06, 0.15, 0.06, 0x1a1b1f, -4.4, y, -10.33); K(0.24, 0.015, 0.18, 0x1a1b1f, -4.4, y, -10.33);
    K(0.5, 0.025, 0.17, 0x2a2a2a, -4.4, y, -10.95); chongGiay(-3.3, y, -10.7, 0.22, 0.3, 0.05); }

  // --- Phòng họp ---
  const HOP_Tr = mat("x", 0, 1, 1), HOP_T = mat("z", -4, -1, 1);
  mayLanh(HOP_T, 9.6, 2.8); dongHo(HOP_Tr, -9, 2.7);
  { const m = manHinhPhang(2.04, 1.15, "hop_slide"); m.position.set(11.755, y2 + 1.65, -9); m.rotation.y = -Math.PI / 2; them(m); }
  TR(0.1, 0.03, 0x1c1c1f, 7.4, y2 + 0.75, -9.2, { seg: 6 }); TR(0.03, 0.01, 0x3fe07a, 7.4, y2 + 0.78, -9.2);
  for (let i = 0; i < 4; i++) for (const z of [-9.85, -8.15]) K(0.21, 0.004, 0.29, 0xf8f7f2, 3.6 + i * 1.6, y2 + 0.75, z + (z < -9 ? 0.1 : -0.1), { ry: (i - 1.5) * 0.08 });
  oCam(HOP_Tr, -6.2); oCam(HOP_T, 2.5);

  // --- Phòng nghệ sĩ ---
  const NS_Tr = mat("x", 12, 1, 1), NS_T = mat("z", -4, -1, 1);
  mayLanh(NS_Tr, -11.5, 2.8);
  bangIn(NS_T, 13.6, 1.7, 0.8, 0.85, "lich_dien", 240, 0x7b4bb3);

  // --- Studio, dựng phim, sản xuất, buồng cầu thang ---
  mayLanh(mat("x", -6, -1, 1), 4.6, 2.9);
  mayLanh(mat("x", 2, -1, 1), 5.2, 2.9); tranhKhung(mat("x", -6, 1, 1), 8, 1.9, 0.8, 1.0, "render_poster", 0x111111);
  { const y = y2 + 0.75; K(0.5, 0.025, 0.17, 0x2a2a2a, -2, y, 10.72); K(0.06, 0.025, 0.1, 0x2a2a2a, -1.55, y, 10.72);
    TR(0.09, 0.03, 0x1c1c1f, -0.95, y, 10.85, { rz: Math.PI / 2 }); TR(0.09, 0.03, 0x1c1c1f, -0.75, y, 10.85, { rz: Math.PI / 2 }); K(0.2, 0.02, 0.02, 0x1c1c1f, -0.85, y + 0.09, 10.85); }
  const SX_Tr = mat("x", 8, 1, 1);
  mayLanh(SX_Tr, 6, 2.8); dongHo(SX_Tr, 11, 2.7);
  { const y = y2 + 0.75; K(0.5, 0.025, 0.17, 0x2a2a2a, 14, y, 10.3); K(0.06, 0.025, 0.1, 0x2a2a2a, 14.42, y, 10.3);
    chongGiay(13.1, y, 10.35, 0.22, 0.3, 0.1, 0.1); lyGiay(15.1, y, 10.3); lyGiay(15.25, y, 10.45);
    K(0.2, 0.12, 0.08, 0xf2f2ee, 15.2, y, 10.85, { rx: 0.2 }); }
  const CT = mat("x", 2, 1, 1);
  bangIn(CT, 4.1, 2.2, 1.0, 0.3, "cau_thang_2", 300, 0x2e8b57);

  // ================= SÂN THƯỢNG =================
  sanThuong(y3);

  // ---------- kim đồng hồ: hai lượt vẽ cho mọi đồng hồ ----------
  const kim = (dai, rong) => { const g = new THREE.BoxGeometry(rong, dai, 0.006); g.translate(0, dai / 2 - 0.02, 0); return g; };
  const n = S.dongHo.length;
  S.kimGio = new THREE.InstancedMesh(kim(0.1, 0.022), VL_KIM, n); S.kimPhut = new THREE.InstancedMesh(kim(0.14, 0.014), VL_KIM, n);
  for (const im of [S.kimGio, S.kimPhut]) { im.frustumCulled = false; im.userData.khongCan = true; nhom.add(im); }
  capNhatCuaSo(8);

  TEX_BIEN.needsUpdate = true; TEX_MAN.needsUpdate = true;
}

function sanThuong(y3) {
  // sàn gạch tàu chống nóng
  const t = new THREE.CanvasTexture((() => { const c = document.createElement("canvas"); c.width = c.height = 64; const g = c.getContext("2d"); R(g, 0, 0, 64, 64, "#9a5a3c"); const rnd = ngauNhien(13); for (let i = 0; i < 2; i++) for (let k = 0; k < 2; k++) R(g, i * 32 + 1, k * 32 + 1, 30, 30, ["#b0684a", "#a8603f", "#b8724f", "#a35c40"][(i + k * 2) % 4]); for (let i = 0; i < 60; i++) R(g, rnd() * 64, rnd() * 64, 2, 2, "rgba(0,0,0,.08)"); return c; })());
  t.colorSpace = THREE.SRGBColorSpace; t.wrapS = t.wrapT = THREE.RepeatWrapping; t.repeat.set(66, 46);
  { const m = new THREE.Mesh(new THREE.PlaneGeometry(39.75, 27.75), new THREE.MeshLambertMaterial({ map: t })); m.rotation.x = -Math.PI / 2; m.position.set(0, y3 + 0.006, 0); them(m); }
  // gờ lan can, ống thoát nước, vệt rêu
  for (const [w, d, x, z] of [[40.3, 0.36, 0, -14], [40.3, 0.36, 0, 14], [0.36, 28, -20, 0], [0.36, 28, 20, 0]]) K(w, 0.06, d, 0xc8c0b0, x, y3 + 1.1, z);
  for (const [x, z] of [[-19.6, -13.6], [19.6, -13.6], [-19.6, 13.6], [19.6, 13.6]]) { K(0.3, 0.012, 0.3, 0x3a3d44, x, y3, z); for (let i = 0; i < 4; i++) K(0.26, 0.014, 0.02, 0x1c1c1f, x, y3, z - 0.1 + i * 0.065); K(0.25, 0.04, 0.12, 0x7a7f86, x, y3 + 0.02, z + Math.sign(z) * 0.1); }
  for (const [x, z, ry, w] of [[-12, -13.86, 0, 3], [8, 13.86, Math.PI, 2.4], [-19.86, 2, Math.PI / 2, 4], [19.86, -6, -Math.PI / 2, 2.6]]) P(w, 0.12, { u0: 0, u1: 0, v0: 0, v1: 0 }, vl(0xa9a690), x, y3 + 0.07, z, { ry }); // vệt ố chân lan can

  // bồn nước inox trên chân sắt, có thang leo và ống
  const BX = -14.6, BZ = 10.5;
  for (const dx of [-1.85, 1.85]) for (const dz of [-0.75, 0.75]) K(0.08, 1.0, 0.08, 0x4a4f57, BX + dx, y3, BZ + dz);
  for (const dz of [-0.75, 0.75]) K(3.8, 0.06, 0.06, 0x4a4f57, BX, y3 + 0.45, BZ + dz);
  K(3.9, 0.08, 1.7, 0x5a5f67, BX, y3 + 1.0, BZ);
  hop0(3.9, 1.7, BX, BZ, 2);
  for (const dx of [-0.95, 0.95]) {
    TR(0.66, 1.55, 0xd5d9dd, BX + dx, y3 + 1.08, BZ, { seg: 16 }); TR(0.67, 0.04, 0xb8bcc2, BX + dx, y3 + 1.45, BZ, { seg: 16 }); TR(0.67, 0.04, 0xb8bcc2, BX + dx, y3 + 2.15, BZ, { seg: 16 });
    TR(0.66, 0.16, 0xe2e5e8, BX + dx, y3 + 2.63, BZ, { rTren: 0.24, seg: 16 }); TR(0.2, 0.06, 0xc9ccd0, BX + dx, y3 + 2.79, BZ, { seg: 12 });
    TR(0.04, 1.08, 0x9aa0a6, BX + dx + 0.45, y3, BZ - 0.62);
  }
  K(0.06, 0.06, 1.9, 0x9aa0a6, BX - 0.5, y3 + 0.1, BZ - 1.5); K(2.5, 0.06, 0.06, 0x9aa0a6, BX + 0.75, y3 + 0.1, BZ - 2.45); K(0.08, 0.16, 0.08, 0x9aa0a6, BX + 2.0, y3, BZ - 2.45); K(0.08, 0.16, 0.08, 0x9aa0a6, BX - 0.5, y3, BZ - 0.55);
  for (const dz of [-0.2, 0.2]) K(0.04, 2.7, 0.04, 0x8a8d92, BX + 2.0, y3, BZ + dz); for (let i = 1; i < 9; i++) K(0.04, 0.03, 0.4, 0x8a8d92, BX + 2.0, y3 + i * 0.3, BZ);

  // dây phơi đồ: hai cột chữ T, hai sợi dây, quần áo của bác Bình và đồ diễn
  const DX1 = -9.4, DX2 = -1.2, DZ = -5.6;
  for (const x of [DX1, DX2]) { TR(0.13, 0.08, 0x8a8d92, x, y3, DZ); K(0.05, 1.95, 0.05, 0x8a8d92, x, y3, DZ); K(0.05, 0.05, 1.3, 0x8a8d92, x, y3 + 1.9, DZ); }
  for (const dz of [-0.55, 0.55]) K(DX2 - DX1, 0.012, 0.012, 0x666666, (DX1 + DX2) / 2, y3 + 1.92, DZ + dz);
  const do_ = [["ao", 0x2a5aa8], ["quan", 0x3a3d44], ["khan", 0xf26fa6], ["ao", 0xe8702a], ["sieu_nhan", 0xff7ab6], ["khan", 0xffffff], ["ao", 0xf6f6f2], ["quan", 0x6d6f73], ["vo", 0x1c1c1f], ["ao", 0x2fa39a]];
  do_.forEach(([loai, c], i) => {
    const x = DX1 + 0.6 + (i % 5) * 1.55, z = DZ + (i < 5 ? -0.55 : 0.55), y = y3 + 1.92;
    K(0.03, 0.04, 0.02, 0xffcf3a, x - 0.12, y - 0.03, z); K(0.03, 0.04, 0.02, 0xffcf3a, x + 0.12, y - 0.03, z);
    if (loai === "ao") { K(0.44, 0.55, 0.02, c, x, y - 0.58, z); K(0.16, 0.24, 0.02, c, x - 0.28, y - 0.27, z, { rz: -0.5 }); K(0.16, 0.24, 0.02, c, x + 0.28, y - 0.27, z, { rz: 0.5 }); K(0.1, 0.04, 0.022, 0xffffff, x, y - 0.06, z); }
    else if (loai === "quan") { K(0.38, 0.12, 0.02, c, x, y - 0.13, z); K(0.17, 0.62, 0.02, c, x - 0.1, y - 0.74, z); K(0.17, 0.62, 0.02, c, x + 0.1, y - 0.74, z); }
    else if (loai === "khan") K(0.5, 0.75, 0.015, c, x, y - 0.76, z);
    else if (loai === "vo") { K(0.07, 0.25, 0.02, c, x - 0.08, y - 0.26, z); K(0.07, 0.25, 0.02, c, x + 0.08, y - 0.26, z); }
    else { K(0.46, 0.6, 0.02, c, x, y - 0.66, z); K(0.15, 0.3, 0.02, c, x - 0.29, y - 0.3, z, { rz: -0.45 }); K(0.15, 0.3, 0.02, c, x + 0.29, y - 0.3, z, { rz: 0.45 }); K(0.2, 0.32, 0.022, 0xffffff, x, y - 0.5, z); K(0.12, 0.12, 0.024, 0xff3a8a, x, y - 0.45, z); }
  });
  { const c = 0x8a8d92, x = -6, z = -3.6; for (const dz of [-0.35, 0.35]) K(0.03, 1.1, 0.03, c, x - 0.6, y3, z + dz, { rz: 0.2 }); for (const dz of [-0.35, 0.35]) K(0.03, 1.1, 0.03, c, x + 0.6, y3, z + dz, { rz: -0.2 }); for (const dz of [-0.2, 0, 0.2]) K(1.3, 0.02, 0.02, c, x, y3 + 1.05, z + dz); K(0.55, 0.012, 0.6, 0xc0262d, x - 0.2, y3 + 1.07, z); K(0.4, 0.3, 0.012, 0xe8702a, x + 0.3, y3 + 0.78, z + 0.2); }

  // mái tôn che khu uống trà, bàn nhựa, ghế nhựa, bộ ấm chén
  const MX = -2, MZ = 7.2;
  for (const [dx, dz, h] of [[-2.3, -2.0, 2.55], [2.3, -2.0, 2.55], [-2.3, 2.0, 2.3], [2.3, 2.0, 2.3]]) K(0.07, h, 0.07, 0x5a5f67, MX + dx, y3, MZ + dz);
  { const g = new THREE.PlaneGeometry(5.2, 4.6, 52, 1); const p = g.attributes.position; for (let i = 0; i < p.count; i++) p.setZ(i, Math.abs(Math.sin(p.getX(i) * Math.PI / 0.2)) * 0.035); g.computeVertexNormals();
    const m = new THREE.Mesh(g, vl(0x5d8fb8, { side: THREE.DoubleSide })); m.rotation.set(-Math.PI / 2 + 0.055, 0, 0); m.position.set(MX, y3 + 2.45, MZ); them(m); }
  K(5.2, 0.06, 0.06, 0x5a5f67, MX, y3 + 2.52, MZ - 2.0); K(5.2, 0.06, 0.06, 0x5a5f67, MX, y3 + 2.27, MZ + 2.0);
  { const tx = MX + 0.2, tz = MZ; K(0.9, 0.04, 0.6, 0x2a8fd0, tx, y3 + 0.5, tz); for (const dx of [-0.38, 0.38]) for (const dz of [-0.24, 0.24]) K(0.04, 0.5, 0.04, 0x2a8fd0, tx + dx, y3, tz + dz, { rx: dz * 0.15 });
    TR(0.08, 0.1, 0xf2efe6, tx - 0.15, y3 + 0.54, tz); CAU(0.05, 0xf2efe6, tx - 0.15, y3 + 0.67, tz, [1, 0.6, 1]); K(0.08, 0.025, 0.025, 0xf2efe6, tx - 0.02, y3 + 0.6, tz, { rz: 0.4 });
    K(0.28, 0.012, 0.2, 0xc9763a, tx + 0.2, y3 + 0.54, tz); for (let i = 0; i < 4; i++) TR(0.025, 0.04, 0xf2efe6, tx + 0.12 + (i % 2) * 0.12, y3 + 0.552, tz - 0.05 + Math.floor(i / 2) * 0.1);
    TR(0.09, 0.015, 0xf6f6f2, tx + 0.05, y3 + 0.54, tz + 0.2); for (let i = 0; i < 9; i++) K(0.012, 0.006, 0.02, 0x2a2a2a, tx + 0.02 + (i % 3) * 0.025, y3 + 0.556, tz + 0.18 + Math.floor(i / 3) * 0.02, { ry: i });
    hop0(0.9, 0.6, tx, tz, 2);
    for (const [dx, dz, c] of [[-0.85, -0.25, 0xc0262d], [-0.85, 0.35, 0xc0262d], [1.0, 0.0, 0x2a8fd0], [0.2, 0.75, 0xc0262d]]) { TR(0.15, 0.42, c, tx + dx, y3, tz + dz, { rTren: 0.13, seg: 12 }); TR(0.16, 0.03, c, tx + dx, y3 + 0.42, tz + dz, { seg: 12 }); hop0(0.3, 0.3, tx + dx, tz + dz, 2); }
    // ghế nhựa có tựa lưng
    for (const [dx, dz, ry] of [[0.3, -0.85, 0], [-0.55, -0.9, 0.3]]) { const g = new THREE.Group(); g.position.set(tx + dx, y3, tz + dz); g.rotation.y = ry;
      const a = (w, h, d, x, y, z, rx = 0) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vl(0x2a8fd0)); m.position.set(x, y, z); m.rotation.x = rx; g.add(m); };
      a(0.44, 0.04, 0.42, 0, 0.42, 0); a(0.44, 0.42, 0.04, 0, 0.66, -0.22, -0.12); for (const sx of [-0.19, 0.19]) for (const sz of [-0.18, 0.18]) a(0.04, 0.42, 0.04, sx, 0.21, sz); them(g); hop0(0.45, 0.45, tx + dx, tz + dz, 2); } }

  // ăng-ten tivi trên mái buồng cầu thang
  { const x = 4.0, z = 12.0, y = y3 + 2.6; K(0.05, 2.1, 0.05, 0x9aa0a6, x, y, z); K(0.05, 0.05, 1.5, 0x9aa0a6, x, y + 1.9, z); for (let i = 0; i < 6; i++) K(0.7 - i * 0.07, 0.02, 0.02, 0x9aa0a6, x, y + 1.9, z - 0.65 + i * 0.26); K(0.02, 0.02, 0.6, 0x1c1c1f, x + 0.1, y + 0.02, z + 0.3); for (const dz of [-0.6, 0.6]) K(0.02, 1.4, 0.02, 0x8a8d92, x, y, z + dz, { rx: -dz * 0.5 }); }

  // góc hút thuốc bí mật sau buồng cầu thang
  { const x = 7.5, z = 13.1;
    TR(0.15, 0.36, 0x2a8fd0, x, y3, z, { rTren: 0.13, seg: 12 }); hop0(0.3, 0.3, x, z, 2); TR(0.16, 0.03, 0x2a8fd0, x, y3 + 0.36, z, { seg: 12 });
    TR(0.05, 0.1, 0xc9ccd0, x + 0.45, y3, z + 0.3); for (let i = 0; i < 4; i++) TR(0.006, 0.04, 0xf2efe6, x + 0.43 + (i % 2) * 0.03, y3 + 0.08, z + 0.29 + Math.floor(i / 2) * 0.03, { rz: 0.4 * (i - 1.5) });
    const rnd = ngauNhien(41); for (let i = 0; i < 9; i++) { TR(0.006, 0.03, rnd() > 0.4 ? 0xf2efe6 : 0xd8a24a, x - 0.4 + rnd() * 1.0, y3 + 0.006, z - 0.4 + rnd() * 0.6, { rx: Math.PI / 2, ry: rnd() * 6 }); }
    K(0.025, 0.07, 0.012, 0xc0262d, x + 0.52, y3, z + 0.18); TR(0.03, 0.25, 0x9fd3f2, x - 0.45, y3, z + 0.35);
    bangIn(mat("x", 6.5, 1, 2, 0), 12.6, 1.55, 0.6, 0.24, "cam_hut", 240, 0xc0262d); }
  bangIn(mat("z", 11.2, -1, 2, 0), 5, 2.15, 0.9, 0.22, "loi_xuong", 256, 0x2e8b57);

  // vườn cây của bác Bình: kệ bonsai, thùng xốp trồng rau, ớt, sả, bình tưới
  K(3.2, 0.06, 0.45, 0x6b4a2f, 9.6, y3 + 0.5, -13.4); for (const dx of [-1.5, 0, 1.5]) K(0.06, 0.5, 0.4, 0x5a3d2a, 9.6 + dx, y3, -13.4);
  hop0(3.2, 0.45, 9.6, -13.4, 2);
  for (let i = 0; i < 3; i++) { const x = 8.5 + i * 1.1, y = y3 + 0.56; K(0.5, 0.1, 0.3, [0x5a3d2a, 0x3a5a7a, 0x8a3a2a][i], x, y, -13.4);
    K(0.05, 0.3, 0.05, 0x6b4a2f, x - 0.05, y + 0.1, -13.4, { rz: 0.4 }); K(0.04, 0.25, 0.04, 0x6b4a2f, x + 0.05, y + 0.3, -13.4, { rz: -0.6 });
    CAU(0.17, 0x2f6b3a, x - 0.15, y + 0.42, -13.4, [1.4, 0.45, 1]); CAU(0.14, 0x3d7a34, x + 0.18, y + 0.52, -13.38, [1.4, 0.45, 1]); CAU(0.11, 0x2f6b3a, x + 0.02, y + 0.66, -13.42, [1.3, 0.45, 1]); }
  bangIn(mat("z", -14, 1, 2, NUA), 13.3, 0.72, 1.2, 0.32, "vuon_rau", 300, 0x2e8b57);
  for (let i = 0; i < 5; i++) { const x = 15.0 + i * 0.85, z = -13.4;
    K(0.7, 0.4, 0.42, 0xf6f6f2, x, y3, z); K(0.66, 0.02, 0.38, 0x4a3a2a, x, y3 + 0.38, z);
    if (i === 1 || i === 3) { for (let k = 0; k < 3; k++) { const cx = x - 0.2 + k * 0.2; TR(0.012, 0.25, 0x3d7a34, cx, y3 + 0.4, z); CAU(0.1, 0x4f8a3c, cx, y3 + 0.68, z, [1, 0.8, 1]); for (let r = 0; r < 4; r++) K(0.02, 0.06, 0.02, 0xd81c1c, cx + Math.cos(r * 1.6) * 0.08, y3 + 0.56 + (r % 2) * 0.08, z + Math.sin(r * 1.6) * 0.08, { rz: 0.3 }); } }
    else if (i === 2) { for (let k = 0; k < 9; k++) K(0.02, 0.5 + (k % 3) * 0.08, 0.008, 0x8ab84a, x - 0.25 + (k % 5) * 0.12, y3 + 0.4, z - 0.08 + Math.floor(k / 5) * 0.14, { rz: (k % 3 - 1) * 0.2 }); }
    else for (let k = 0; k < 6; k++) CAU(0.09, k % 2 ? 0x5fa043 : 0x3d7a34, x - 0.22 + (k % 3) * 0.22, y3 + 0.48, z - 0.08 + Math.floor(k / 3) * 0.16, [1, 0.6, 1]);
  }
  hop0(4.3, 0.45, 16.7, -13.4, 2);
  { const x = 12.2, z = -12.6; TR(0.13, 0.28, 0x2e8b57, x, y3, z, { rTren: 0.11 }); K(0.04, 0.04, 0.35, 0x2e8b57, x, y3 + 0.2, z + 0.25, { rx: -0.6 }); K(0.2, 0.03, 0.03, 0x2e8b57, x, y3 + 0.33, z - 0.05);
    for (let i = 0; i < 3; i++) TR(0.3 - i * 0.04, 0.03, 0x2a8a3a, 11.2, y3 + i * 0.03, -12.7, { seg: 14 }); }

  // ghế văn phòng hỏng nằm lăn lóc cạnh cục nóng máy lạnh
  { const g = new THREE.Group(); g.position.set(-10.6, y3 + 0.3, -9.6); g.rotation.set(0, 0.6, Math.PI / 2 - 0.15);
    const a = (w, h, d, c, x, y, z, rz = 0) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vl(c)); m.position.set(x, y, z); m.rotation.z = rz; g.add(m); };
    a(0.5, 0.06, 0.5, 0x3a3d44, 0, 0.27, 0); a(0.5, 0.55, 0.06, 0x3a3d44, 0, 0.56, -0.24); a(0.06, 0.3, 0.06, 0x222222, 0, 0.1, 0); for (let i = 0; i < 4; i++) { const r = i * Math.PI / 2; const m = new THREE.Mesh(new THREE.BoxGeometry(0.3, 0.03, 0.04), vl(0x222222)); m.position.set(Math.cos(r) * 0.15, -0.04, Math.sin(r) * 0.15); m.rotation.y = -r; g.add(m); }
    them(g); K(0.6, 0.02, 0.4, 0x3a3d44, -10.0, y3, -10.4, { ry: 0.4 }); CAU(0.05, 0x111111, -9.7, y3 + 0.04, -9.3); }
  hop0(0.9, 0.9, -10.6, -9.6, 2);
}
// vật cản thêm tay (khối không xoay)
function hop0(w, d, x, z, tang) { S.vat[tang].push({ minX: x - w / 2, maxX: x + w / 2, minZ: z - d / 2, maxZ: z + d / 2 }); }

// ================= CẬP NHẬT MỖI KHUNG HÌNH =================
const MAU_TROI = [[0, 0x1a2238], [5.2, 0x1a2238], [6.0, 0xd8a890], [7.0, 0xffffff], [16.6, 0xffffff], [17.6, 0xffd2a0], [18.4, 0x8a7398], [19.2, 0x2a3350], [24, 0x1a2238]];
const _c1 = new THREE.Color(), _c2 = new THREE.Color();
function mauTheoGio(bang, gio) {
  for (let i = 0; i < bang.length - 1; i++) { const [g1, m1] = bang[i], [g2, m2] = bang[i + 1]; if (gio >= g1 && gio <= g2) return _c1.set(m1).lerp(_c2.set(m2), (gio - g1) / Math.max(0.001, g2 - g1)); }
  return _c1.set(bang[0][1]);
}
// Kính cửa sổ và kim đồng hồ theo giờ trong game (giờ dạng số thập phân)
export function capNhatCuaSo(gio) {
  if (!S || Math.abs(gio - S.gioCu) < 0.004) return;
  S.gioCu = gio; gio = ((gio % 24) + 24) % 24;
  VL_KINH_TRONG.color.copy(mauTheoGio(MAU_TROI, gio));
  const dem = gio < 5.8 || gio > 18.3, sang = dem ? 0 : Math.min(1, Math.min(gio - 5.8, 18.3 - gio) / 1.2);
  VL_KINH_NGOAI.emissive.set(0x6a5228).lerp(_c2.set(0x0f2a38), sang); // tối: đèn trong nhà hắt ra kính
  VL_KINH_MO.color.set(0x4a5260).lerp(_c2.set(0xe2eaee), sang);
  const h = gio % 12, m = (gio * 60) % 60;
  S.dongHo.forEach((d, i) => {
    _q.setFromEuler(_e.set(0, d.rot, -(h / 12) * Math.PI * 2, "YXZ")); _m.compose(d.p, _q, _v.set(d.r / 0.17, d.r / 0.17, 1)); S.kimGio.setMatrixAt(i, _m);
    _q.setFromEuler(_e.set(0, d.rot, -(m / 60) * Math.PI * 2, "YXZ")); _m.compose(d.p2, _q, _v.set(d.r / 0.17, d.r / 0.17, 1)); S.kimPhut.setMatrixAt(i, _m);
  });
  S.kimGio.instanceMatrix.needsUpdate = true; S.kimPhut.instanceMatrix.needsUpdate = true;
}
// Cửa đi tự mở khi người chơi hoặc đồng nghiệp tới gần (~1,6 m), không có vật cản để không ai bị kẹt.
// dsNpc: mảng phần tử { x, z, tang } hoặc đối tượng npc của game3d ({ tang, nv: { group } })
const GAN = 1.6, XA = 1.95;
function coNguoi(x, z, tang, p, tangNC, dsNpc, r) {
  if (p && tangNC === tang && Math.hypot(p.x - x, p.z - z) < r) return true;
  if (dsNpc) for (const n of dsNpc) {
    if (n.tang !== tang) continue;
    const g = n.nv?.group; if (g && !g.visible) continue;
    const q = g ? g.position : n;
    if (Math.hypot(q.x - x, q.z - z) < r) return true;
  }
  return false;
}
export function capNhatCua(dt, p, tang, dsNpc) {
  if (!S || !S.cuaMesh) return;
  let doi = false;
  for (const d of S.cua) {
    const gan = coNguoi(d.x, d.z, d.tang, p, tang, dsNpc, d.muc ? XA : GAN);
    if (gan) { if (!d.muc && d.k < 0.05 && tang === d.tang) am.phat("cua_mo", d.x, d.z); d.muc = 1; d.cho = 0.7; }
    else if (d.muc && (d.cho -= dt) <= 0) d.muc = 0;
    const k0 = d.k;
    d.k = d.muc ? Math.min(1, d.k + dt * 2.6) : Math.max(0, d.k - dt * 1.3);
    if (d.k !== k0) { datCanh(d); doi = true; if (d.k === 0 && tang === d.tang) am.phat("cua_dong", d.x, d.z); }
  }
  if (doi) S.cuaMesh.instanceMatrix.needsUpdate = true;
  const ck = S.cuaKinh;
  if (ck) {
    const gan = coNguoi(2, 14, 0, p, tang, dsNpc, ck.muc ? 2.6 : 2.2);
    if (gan) { if (!ck.muc && ck.k < 0.05 && tang === 0) am.phat("cua_mo", 2, 14); ck.muc = 1; ck.cho = 0.8; }
    else if (ck.muc && (ck.cho -= dt) <= 0) ck.muc = 0;
    const k0 = ck.k; ck.k = ck.muc ? Math.min(1, ck.k + dt * 1.8) : Math.max(0, ck.k - dt * 1.0);
    if (ck.k !== k0) datCuaKinh();
  }
}
// tiện: gọi một lần mỗi khung hình
export function capNhatChiTiet(dt, gio, p, tang, dsNpc) { capNhatCuaSo(gio); capNhatCua(dt, p, tang, dsNpc); }
// cho công cụ kiểm thử tự động (giống window.__g3d)
if (typeof window !== "undefined") window.__chiTiet = { capNhatChiTiet, capNhatCua, capNhatCuaSo, THANG_MAY };
