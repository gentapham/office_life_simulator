// Đồ vật tương tác thêm quanh công ty và ngoài phố:
//   trong công ty: máy in (có lúc kẹt giấy), tủ hồ sơ, ba bảng trắng (vẽ lên được), máy chấm công, bàn thờ Thần Tài,
//   công tắc đèn khu làm việc, máy bán nước tự động (+ thùng rác cạnh máy), bi lắc hành lang tầng 2, ghế lười phòng dựng phim
//   (chợp mắt), golf mini phòng giám đốc, đàn guitar phòng nghệ sĩ, modem phòng server, bảng tin, tivi sảnh (chụp ảnh),
//   chậu cây trước cửa và vườn rau sân thượng (tưới), thảm tập thể dục trên sân thượng;
//   ngoài phố: cây ATM, cô bán vé số, quả cầu trong sân, thùng rác (khi đang cầm ly, lon).
// Mỗi món: điểm đứng bấm E (DO_VAT), khối va chạm đúng cỡ (không chắn cửa, ghế, lối đi), lời kết quả, chỉ số, thời gian chờ
// (DUNG_DO_THEM, main.js đọc), và động tác (HANH_DONG trong hoat-anh-nc.js).
import * as THREE from "three";
import { DO_VAT, CAO_TANG } from "./the-gioi.js";
import { vl, taoNguoiNgauNhien } from "./nhan-vat-3d.js";
import { gopKhoi } from "./gop-khoi.js";
import { taoDo } from "./do-cam-tay.js";
import { am } from "../am-thanh-game.js";
import "./am-thanh-them.js";

const chon = a => a[Math.floor(Math.random() * a.length)];
const PI = Math.PI;

// ---------- chữ vẽ lên ảnh ----------
function anhChu(w, h, ve) {
  const c = document.createElement("canvas"); c.width = w; c.height = h; ve(c.getContext("2d"), w, h);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; return t;
}
const F = (px, w = 800) => `${w} ${px}px 'Be Vietnam Pro', system-ui, sans-serif`;

// ---------- vị trí ----------
const XU_RAC = [-135, -111, -87, -63, -39, -15, 9, 33, 57, 81, 105, 129]; // thùng rác vỉa hè (thanh-pho.js)
const BANG_TRANG = [
  { tang: 0, x: -19.85, z: 6, ry: PI / 2, dung: [-19.1, 6] },     // khu làm việc chung
  { tang: 1, x: 6, z: -13.85, ry: 0, dung: [6, -13.2] },          // phòng họp
  { tang: 1, x: 19.85, z: 8, ry: -PI / 2, dung: [19.2, 8] },      // phòng sản xuất
];
export const DEN_KLV = { x: -2.14, z: 8.4 }; // công tắc đèn khu làm việc (mặt tường x = −2 phía tây)

// đồ vật cũ: điểm nhìn khi dùng (người chơi quay mặt về đó)
export function nhinDoCu(v) {
  const k = v.loai, x = v.x, z = v.z;
  // [x, z, cúi đầu]
  if (k === "uong_nuoc") return v.tang === 1 ? null : x < 0 ? [-3.2, -0.9, -0.42] : [8.4, 10.4, -0.42];
  if (k === "tu_lanh") return [19.2, 12.8, -0.15];
  if (k === "mi_ly" || k === "ca_phe") return [x, 13, -0.32];
  if (k === "trai_cay") return [x, 6, -0.5];
  if (k === "tra_bac_binh") return [-6.9, 24.2, -0.25];
  if (k === "rua_mat") return [12.3, z, -0.45];
  if (["banh_mi", "hu_tieu", "nuoc_mia", "che", "tra_da"].includes(k)) return z > 37 ? [x, z + 1, -0.42] : [x, z - 1, -0.42];
  return null;
}
// động tác cho đồ vật cũ (main.js gắn vào bảng DUNG_DO)
export const HOAT_ANH_DO_CU = {
  uong_nuoc: "uong_nuoc", ca_phe: "ca_phe", tu_lanh: "tu_lanh", mi_ly: "mi_ly", trai_cay: "trai_cay", tra_bac_binh: "tra_bac_binh",
  banh_mi: "banh_mi", hu_tieu: "hu_tieu", nuoc_mia: "nuoc_mia", che: "che", tra_da: "tra_da", rua_mat: "rua_mat", meo: "meo", chim: "chim", ca: "ca",
};
// sau khi mua nước mang đi: cầm ly / lon trên tay tới khi bỏ vào thùng rác
export const RAC_SAU = { nuoc_mia: "ly_mia", tra_da: "ly_nhua", may_ban_nuoc: "lon" };

// ---------- lời kết quả, chỉ số, thời gian chờ của đồ vật mới (main.js gộp vào DUNG_DO) ----------
// hoatAnh: động tác (hoặc hàm chọn động tác); xuLy(ctx): kết quả riêng (ctx.hd: động tác đã chọn, ctx.doi: chỉ số sẽ đổi,
//   ctx.L, ctx.g, ctx.tien(so, lyDo): cộng / trừ tiền); trả về câu thay cho câu ngẫu nhiên trong ket
let ngayTu = -1, nhatTien = false, ngayCham = -1;
export const DUNG_DO_THEM = {
  may_in: { cho: 25, hoatAnh: () => Math.random() < 0.28 ? "may_in_ket" : "may_in", doi: { stress: -1 },
    ket: ["Máy in nhả ra một tờ còn ấm. Không biết ai in, giờ là của bạn.", "In xong. Tờ giấy ghi \"Kế hoạch tăng KPI quý 4\". Bạn lặng lẽ để lại.", "Máy in chạy êm ru. Hôm nay là ngày may mắn."],
    xuLy(c) { if (c.hd === "may_in_ket") { c.doi.stress = 4; return chon(["Kẹt giấy! Đèn đỏ nhấp nháy. Vỗ hai cái, máy im re luôn.", "Máy báo lỗi E-69: \"Hết mực hồng\". Ai in toàn màu hồng vậy trời?", "Kẹt giấy lần thứ ba trong tuần. IT Bảo dặn: \"Tắt đi bật lại\"."]); } } },
  tu_ho_so: { cho: 40, doi: { stress: -1 },
    ket: ["Một gói kẹo gừng hết hạn từ Tết.", "Hồ sơ \"Dự án tuyệt mật\". Bên trong là thực đơn trà sữa.", "Đơn xin nghỉ phép của Sơn, ngày nghỉ ghi: mọi thứ Hai.", "Ảnh team building 2015. Ai cũng còn tóc."],
    xuLy(c) { const ngay = c.L.ngay; if (ngay !== ngayTu) { ngayTu = ngay; nhatTien = false; } if (!nhatTien && Math.random() < 0.25) { nhatTien = true; c.tien(10000, "Nhặt được trong tủ hồ sơ"); return "Lục ra tờ 10.000đ kẹp trong hồ sơ năm 2019. Của rơi, coi như lộc."; } } },
  bang_trang: { cho: 12, doi: { stress: -3 },
    ket: ["Bạn vẽ một biểu đồ đi lên. Không ai hiểu, nhưng ai đi ngang cũng gật gù.", "Vẽ con mèo cạnh chữ DEADLINE. Con mèo đẹp hơn cái deadline.", "Bạn viết: \"Thứ Sáu đi nhậu?\" Lát sau có thêm ba dấu tick.", "Sơ đồ tư duy chằng chịt mũi tên. Chính bạn cũng không hiểu."] },
  cham_cong: { cho: 8, doi: {}, ket: ["Bíp. \"Cảm ơn!\""],
    xuLy(c) {
      const p = c.L.phutGame, hh = String(Math.floor(p / 60)).padStart(2, "0") + ":" + String(p % 60).padStart(2, "0");
      if (ngayCham === c.L.ngay) return chon(["Bíp. \"Bạn đã chấm công rồi.\" Máy nhớ dai hơn sếp.", "Bíp. \"Cảm ơn!\" Chấm lần nữa cho chắc ăn."]);
      ngayCham = c.L.ngay;
      if (Math.random() < 0.2) return "\"Vui lòng thử lại.\" Lau ngón tay vào áo, bấm lại. Bíp. \"Cảm ơn!\" Chấm công lúc " + hh + ".";
      return p <= 8 * 60 + 30 ? `Bíp. \"Cảm ơn!\" Chấm công lúc ${hh}. Đúng giờ, HR Tuấn mà thấy chắc cảm động.` : `Bíp. Chấm công lúc ${hh}. Trễ ${p - 8 * 60 - 30} phút. Máy không nói gì, nhưng máy biết.`;
    } },
  than_tai: { cho: 300, cauCho: "Nhang vẫn đang cháy. Thần Tài cũng cần thời gian xử lý hồ sơ.", doi: { stress: -4 },
    ket: ["Khấn Thần Tài phù hộ lương về đúng hạn.", "Vái ba vái. Lòng nhẹ hẳn, ví vẫn nhẹ như cũ.", "Bạn khấn nhỏ: \"Cho con qua được tháng này.\""] },
  tuoi_cay: { cho: 120, cauCho: "Cây vừa uống no nước rồi. Tưới nữa là úng rễ.", doi: { stress: -2 },
    ket: ["Cây xanh hẳn lên, như đang cảm ơn bạn.", "Tưới xong. Bác Bình mà thấy chắc khen cả tuần.", "Mấy giọt nước đọng trên lá lấp lánh. Đẹp."] },
  tuoi_rau: { cho: 150, hoatAnh: "tuoi_cay", cauCho: "Rau vừa tưới, đất còn ướt.", doi: { stress: -3 },
    ket: ["Tưới rau giúp bác Bình. Mấy trái ớt đỏ chói dưới nắng.", "Rau muống lên xanh mướt. Trưa mai có canh.", "Đám sả thơm lừng. Đứng đây quên luôn deadline."] },
  cong_tac: { cho: 3, doi: {}, ket: [""],
    xuLy(c) { const kq = c.g.hoatAnh.doiDen(); return kq === "tat" ? chon(["Tách. Cả khu làm việc tối om. Có tiếng la oai oái.", "Bạn tắt đèn. Màn hình máy tính sáng rực như vũ trường."]) : "Tách. Đèn sáng trở lại. Coi như chưa có gì xảy ra."; } },
  may_ban_nuoc: { cho: 15, gia: 12000, doi: { khat: 25, nang_luong: 4 },
    ket: ["Lon Hóng Cola lăn xuống cái cạch. Mát lạnh.", "Máy nuốt xu một lúc lâu mới chịu nhả lon. Hú hồn.", "Bật nắp nghe \"tách\", uống một hơi đã đời."],
    xuLy(c) { if (Math.random() < 0.08) { c.doi.khat = 40; return "Lon bị kẹt. Bạn đập nhẹ vô hông máy, rớt xuống... hai lon!"; } } },
  bi_lac: { cho: 20, doi: { stress: -6, nang_luong: -2 },
    ket: ["Bạn thắng 5-3. Đối thủ là... chính bạn.", "Bóng kẹt ở góc. Lắc cả bàn mới ra.", "Ghi bàn bằng thủ môn. Đỉnh cao bi lắc.", "Xoay tay cầm lia lịa. Bóng không đi đâu cả."] },
  ngu_trua: { cho: 240, cauCho: "Vừa ngủ dậy. Ngủ nữa là tối luôn.", doi: { nang_luong: 20, stress: -5 },
    ket: ["Chợp mắt 15 phút. Dậy thấy vết ghế lười in trên má.", "Ngủ ngon tới mức mơ thấy được tăng lương.", "Tỉnh dậy, Lĩnh đang nhìn bạn: \"Ngủ ngon hông? Tui chưa ngủ ba ngày.\""] },
  golf: { cho: 25, doi: { stress: -3 },
    ket: ["Trượt. Gậy của sếp chắc không quen tay bạn.", "Bóng dừng ngay mép lỗ. Gió phòng máy lạnh hơi mạnh."],
    xuLy(c) { if (Math.random() < 0.4) { c.doi.stress = -6; return "Vô lỗ! Ước gì sếp thấy cú này."; } } },
  guitar: { cho: 30, doi: { stress: -5 },
    ket: ["Bạn quạt ba hợp âm quen thuộc. Ở đâu đó, Phát rơm rớm nước mắt.", "Đàn lệch dây. Nghe vẫn êm hơn sếp hát karaoke.", "Gảy được một đoạn \"Phát Công Viên 2015\". Ký ức ùa về."] },
  rut_dien: { cho: 40, doi: { stress: -2 },
    ket: ["Rút ra cắm lại. Wifi nhanh hẳn (chắc vậy).", "Đèn modem xanh trở lại. Bạn chính thức là IT bất đắc dĩ.", "Cả công ty rớt mạng 30 giây. Không ai biết là bạn."] },
  bang_tin: { cho: 10, doi: {},
    ket: ["Bảng tin: \"Lương về trễ 2 ngày\". Bạn đọc lại lần nữa cho chắc.", "Bảng tin: \"CẤM hâm cá trong lò vi sóng\". Có người vẫn hâm.", "Bảng tin: \"Team building Vũng Tàu 17-18/10\". Chưa thấy tên mình.", "Ai đó dán thêm tờ: \"Ai lấy hộp cơm của tui làm ơn trả lại\"."] },
  selfie: { cho: 15, doi: { stress: -2 },
    ket: ["Tách! Selfie với Siêu Nhân Hồng. Được 3 lượt thích: mẹ, dì, và chính bạn.", "Ảnh đẹp. Đăng lên kèm #1TrieuFollow.", "Chụp mười tấm, giữ một tấm, xóa chín tấm."] },
  atm: { cho: 20, doi: { stress: 1 }, ket: [""],
    xuLy(c) { const t = Number(c.L.v("tien")) || 0; if (t >= 1100) c.tien(-1100, "Phí kiểm tra số dư ATM"); return `Số dư: ${(t >= 1100 ? t - 1100 : t).toLocaleString("vi-VN")}đ (đã trừ phí 1.100đ). Cây ATM cũng thấy thương.`; } },
  ve_so: { cho: 45, gia: 10000, cauCho: "Cô bán vé số: \"Mua một tờ thôi con, để hên cho người khác nữa.\"", doi: {}, ket: [""],
    xuLy(c) {
      const r = Math.random();
      if (r < 0.03) { c.tien(200000, "Trúng vé số"); c.doi.stress = -10; return "Dò số... TRÚNG giải khuyến khích 200.000đ! Cô bán vé số mừng còn hơn bạn."; }
      if (r < 0.13) { c.tien(20000, "Trúng vé số"); c.doi.stress = -3; return "Trúng giải an ủi 20.000đ. Huề vốn, còn lời."; }
      c.doi.stress = 1; return chon(["Trật lất. Cô bán vé số cười: \"Mai mua nữa nghen con!\"", "Trật hai số cuối. Gần trúng là cái cảm giác tệ nhất.", "Không trúng. Thôi coi như ủng hộ cô."]);
    } },
  thung_rac: { cho: 1, doi: { stress: -1 }, ket: ["Bỏ rác đúng chỗ. Cô lao công gật gù.", "Rác vào thùng. Quận Hóng sạch thêm một chút.", "Bỏ rác đúng chỗ. Người lịch sự là đây."],
    xuLy(c) { c.g.hoatAnh.boRac(); } },
  da_cau: { cho: 15, doi: { stress: -4, nang_luong: -3 }, ket: [""],
    xuLy(c) { const n = 2 + Math.floor(Math.random() * Math.random() * 25); return n > 15 ? `Tâng được ${n} quả! Bọn nhỏ trong hẻm muốn kết nạp bạn.` : n < 4 ? `Tâng được ${n} quả rồi cầu bay vô bụi. Hơi quê.` : `Tâng được ${n} quả. Không tệ cho dân văn phòng.`; } },
  the_duc: { cho: 180, cauCho: "Vừa tập xong, mồ hôi còn chưa khô.", doi: { nang_luong: 6, stress: -6 },
    ket: ["Một, hai, ba, bốn... Người nhẹ hẳn.", "Tập xong thấy khỏe ra. Vai hết mỏi.", "Gió sân thượng mát rượi. Tập thêm hiệp nữa cũng được."] },
};

for (const [k, d] of Object.entries(DUNG_DO_THEM)) d.hoatAnh ??= k;

// ---------- dựng đồ vật ----------
export class DoVatThem {
  constructor(g) {
    this.g = g;
    const tg = g.theGioi, vat = tg.vat;
    const nhom = new THREE.Group(); nhom.name = "do-vat-them";
    this.nhom = nhom;
    const hop = (w, h, d, mau, x, y, z, { tang = 0, can = false, be, ry = 0, cha = nhom, vatLieu } = {}) => {
      const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vatLieu || vl(mau)); if (be) m.userData.be = be;
      m.position.set(x, tang * CAO_TANG + y + h / 2, z); m.rotation.y = ry; cha.add(m);
      if (can) vat[tang].push({ minX: x - w / 2, maxX: x + w / 2, minZ: z - d / 2, maxZ: z + d / 2, noiThat: true });
      return m;
    };
    const tru = (r1, r2, h, mau, x, y, z, { tang = 0, seg = 12, cha = nhom, be, rx = 0, rz = 0 } = {}) => {
      const m = new THREE.Mesh(new THREE.CylinderGeometry(r1, r2, h, seg), vl(mau)); if (be) m.userData.be = be;
      m.position.set(x, tang * CAO_TANG + y + (rx || rz ? 0 : h / 2), z); m.rotation.set(rx, 0, rz); cha.add(m); return m;
    };
    const tam = (w, h, tex, x, y, z, ry, tang = 0, cha = nhom) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, h), new THREE.MeshBasicMaterial({ map: tex, toneMapped: false })); m.position.set(x, tang * CAO_TANG + y, z); m.rotation.y = ry; cha.add(m); return m; };
    const dong = []; // khối động (không gộp)
    const rieng = o => { o.userData.rieng = true; o.traverse?.(c => { c.userData.rieng = true; }); dong.push(o); return o; };

    // ===== máy bán nước tự động (hành lang tầng 1, sát tường bắc giữa hai cửa) =====
    {
      const X = -8.4, Z = -5.52, R = 0x2a5aa8;
      hop(0.9, 1.85, 0.7, R, X, 0, Z, { can: true, be: "son_bong" });
      hop(0.62, 1.05, 0.02, 0x0e1a2a, X - 0.08, 0.55, Z + 0.355);              // ô kính tối
      for (let hang = 0; hang < 4; hang++) for (let i = 0; i < 4; i++) {          // lon xếp trong tủ kính
        const c = [0xc0262d, 0xe9e04a, 0x2e8b57, 0xf26fa6][(hang + i) % 4];
        tru(0.035, 0.035, 0.12, c, X - 0.32 + i * 0.15, 0.62 + hang * 0.25, Z + 0.3, { seg: 8 });
      }
      hop(0.14, 0.5, 0.02, 0x1c1c1f, X + 0.33, 0.95, Z + 0.355);                  // bảng nút
      for (let i = 0; i < 6; i++) { const b = hop(0.05, 0.03, 0.015, 0xd8d8d8, X + 0.33, 1.32 - i * 0.06, Z + 0.37); b.userData.be = "nhua"; }
      hop(0.05, 0.08, 0.02, 0xc9b26a, X + 0.33, 1.0, Z + 0.37);                   // khe bỏ tiền
      hop(0.5, 0.16, 0.04, 0x0a0a0a, X - 0.08, 0.2, Z + 0.34);                    // khe lấy lon
      tam(0.86, 0.26, anhChu(512, 160, (c, w, h) => {
        c.fillStyle = "#c0262d"; c.fillRect(0, 0, w, h); c.fillStyle = "#fff"; c.textAlign = "center"; c.font = F(78); c.fillText("HÓNG COLA", w / 2, 92);
        c.font = F(30, 600); c.fillText("Uống là hóng, hóng là uống", w / 2, 140);
      }), X, 1.68, Z + 0.356, 0);
      this.lonRoi = rieng(taoDo("lon")); this.lonRoi.position.set(X - 0.08, 0.27, Z + 0.3); nhom.add(this.lonRoi);
      // thùng rác nhỏ cạnh máy
      tru(0.16, 0.13, 0.55, 0x3a3d44, X - 0.72, 0, Z + 0.12, { be: "nhua" }); tru(0.17, 0.17, 0.04, 0x2a2c31, X - 0.72, 0.55, Z + 0.12, { be: "nhua" });
      vat[0].push({ minX: X - 0.9, maxX: X - 0.54, minZ: Z - 0.06, maxZ: Z + 0.3, noiThat: true });
    }
    // ===== bi lắc (hành lang tầng 2, dưới dãy ảnh kỷ niệm) =====
    {
      const X = 10.5, Z = -3.3, T = 1;
      hop(1.2, 0.18, 0.7, 0x2e6b3a, X, 0.72, Z, { tang: T, can: true, be: "go" });
      hop(1.08, 0.02, 0.58, 0x3d9a4a, X, 0.86, Z, { tang: T });                       // mặt sân cỏ
      for (const dx of [-0.54, 0.54]) hop(0.04, 0.2, 0.36, 0xf6f6f2, X + dx, 0.72, Z, { tang: T }); // khung thành
      for (const [dx, dz] of [[-0.52, -0.28], [0.52, -0.28], [-0.52, 0.28], [0.52, 0.28]]) hop(0.08, 0.72, 0.08, 0x5a3d2a, X + dx, 0, Z + dz, { tang: T, be: "go" });
      this.thanhBL = [];
      for (let i = 0; i < 4; i++) { // tay cầm xoay được, cầu thủ đỏ / xanh
        const tg2 = rieng(new THREE.Group()); tg2.position.set(X - 0.39 + i * 0.26, T * CAO_TANG + 0.92, Z); nhom.add(tg2);
        const thanh = new THREE.Mesh(new THREE.CylinderGeometry(0.008, 0.008, 0.95, 6), vl(0xb5b5b5)); thanh.rotation.x = PI / 2; thanh.position.z = 0.12; tg2.add(thanh);
        const tc = new THREE.Mesh(new THREE.CylinderGeometry(0.018, 0.018, 0.1, 8), vl(0x1a1a1a)); tc.rotation.x = PI / 2; tc.position.z = 0.6; tg2.add(tc);
        for (const k of [-0.15, 0, 0.15]) { const ct = new THREE.Mesh(new THREE.BoxGeometry(0.03, 0.09, 0.025), vl(i % 2 ? 0x2a5aa8 : 0xc0262d)); ct.position.set(0, -0.03, k); tg2.add(ct); }
        tg2.traverse(c => { c.userData.rieng = true; });
        this.thanhBL.push(tg2);
      }
      this.bongBL = rieng(new THREE.Mesh(new THREE.SphereGeometry(0.018, 8, 6), vl(0xf6f6f2))); this.bongBL.position.set(X, T * CAO_TANG + 0.895, Z); nhom.add(this.bongBL);
    }
    // ===== đàn guitar trên giá (phòng nghệ sĩ) =====
    {
      const X = 12.62, Z = -11, T = 1;
      for (const s of [-1, 1]) { const ch = hop(0.03, 0.55, 0.03, 0x1a1a1a, X + 0.12, 0, Z + s * 0.14, { tang: T }); ch.rotation.z = 0.25; }
      hop(0.3, 0.04, 0.34, 0x1a1a1a, X + 0.05, 0.12, Z, { tang: T });
      vat[T].push({ minX: X - 0.25, maxX: X + 0.28, minZ: Z - 0.25, maxZ: Z + 0.25, noiThat: true });
      this.danGia = rieng(taoDo("guitar")); this.danGia.visible = true; this.danGia.position.set(X, T * CAO_TANG + 0.2, Z); this.danGia.rotation.set(0, PI / 2, 0.22); nhom.add(this.danGia);
      // nhóm taoDo đặt rieng cho từng khối: hiện cả nhóm
      this.danGia.traverse(c => { c.visible = true; });
    }
    // ===== cây ATM (vỉa hè trước hàng rào công ty) =====
    {
      const X = -12, Z = 30.47;
      hop(0.78, 1.72, 0.52, 0x3a3d44, X, 0, Z, { can: true, be: "kim" });
      hop(0.86, 0.32, 0.6, 0x1f4fa8, X, 1.72, Z, { be: "son_bong" });
      tam(0.8, 0.26, anhChu(400, 128, (c, w, h) => { c.fillStyle = "#1f4fa8"; c.fillRect(0, 0, w, h); c.fillStyle = "#ffe14d"; c.textAlign = "center"; c.font = F(56); c.fillText("HÓNG BANK", w / 2, 62); c.fillStyle = "#fff"; c.font = F(28, 600); c.fillText("ATM 24/7 (thường thôi)", w / 2, 106); }), X, 1.88, Z + 0.305, 0);
      const man = tam(0.34, 0.24, anhChu(256, 180, (c, w, h) => { c.fillStyle = "#123a7a"; c.fillRect(0, 0, w, h); c.fillStyle = "#fff"; c.textAlign = "center"; c.font = F(26, 700); c.fillText("XIN CHÀO QUÝ KHÁCH", w / 2, 50); c.font = F(20, 500); c.fillText("Vui lòng đưa thẻ vào", w / 2, 95); c.fillText("Phí kiểm tra số dư: 1.100đ", w / 2, 135); }), X, 1.32, Z + 0.272, 0);
      man.rotation.x = -0.25;
      hop(0.3, 0.04, 0.16, 0x2a2c31, X, 0.98, Z + 0.32);
      for (let i = 0; i < 12; i++) hop(0.05, 0.015, 0.035, 0xd8d8d8, X - 0.08 + (i % 3) * 0.08, 1.0, Z + 0.27 + Math.floor(i / 3) * 0.035);
      hop(0.12, 0.03, 0.02, 0x0a0a0a, X + 0.25, 1.12, Z + 0.265); hop(0.18, 0.02, 0.02, 0x0a0a0a, X, 0.8, Z + 0.265);
      tg.pho?.vatCanDiBo?.push({ x: X, z: Z, r: 0.6 });
    }
    // ===== modem phòng server (trên ghế đẩu trước tủ rack giữa) =====
    {
      const X = 0.7, Z = -12.45;
      tru(0.16, 0.18, 0.45, 0x3a3d44, X, 0, Z, { be: "kim" });
      hop(0.3, 0.05, 0.2, 0xf6f6f2, X, 0.45, Z, { be: "nhua" });
      for (const s of [-1, 1]) { const a = hop(0.012, 0.16, 0.012, 0x1a1a1a, X + s * 0.11, 0.5, Z - 0.08); a.rotation.z = s * 0.25; }
      vat[0].push({ minX: X - 0.2, maxX: X + 0.2, minZ: Z - 0.2, maxZ: Z + 0.2, noiThat: true });
      this.denModem = [];
      for (let i = 0; i < 4; i++) { const d = rieng(new THREE.Mesh(new THREE.BoxGeometry(0.02, 0.012, 0.004), new THREE.MeshBasicMaterial({ color: 0x3fe07a }))); d.position.set(X - 0.09 + i * 0.06, 0.475, Z + 0.102); nhom.add(d); this.denModem.push(d); }
    }
    // ===== công tắc đèn khu làm việc =====
    { const s = hop(0.02, 0.12, 0.08, 0xf6f6f2, DEN_KLV.x, 1.25, DEN_KLV.z, { be: "nhua" }); s.position.x = DEN_KLV.x; hop(0.012, 0.04, 0.025, 0xd8d8d8, DEN_KLV.x - 0.012, 1.29, DEN_KLV.z); }
    // ===== thảm tập trên sân thượng =====
    { hop(0.7, 0.012, 1.8, 0x7b4bb3, -1.5, 0, 0.6, { tang: 2 }); hop(0.72, 0.014, 0.08, 0x5a3a8a, -1.5, 0, -0.28, { tang: 2 }); }
    // ===== quả cầu trong sân (cạnh ghế đá) =====
    {
      this.cau = rieng(taoDo("qua_cau")); this.cau.traverse(c => { c.visible = true; });
      this.cauNha = new THREE.Vector3(-12.2, 0.02, 23.95); this.cau.scale.setScalar(1.5); this.cau.position.copy(this.cauNha); this.cau.rotation.z = 1.2; nhom.add(this.cau);
    }
    // ===== bảng trắng: lớp vẽ lên được =====
    this.bang = BANG_TRANG.map(b => {
      const cv = document.createElement("canvas"); cv.width = 512; cv.height = 256;
      const tex = new THREE.CanvasTexture(cv); tex.colorSpace = THREE.SRGBColorSpace;
      const m = new THREE.Mesh(new THREE.PlaneGeometry(2.3, 1.1), new THREE.MeshBasicMaterial({ map: tex, transparent: true, depthWrite: false }));
      const nx = Math.sin(b.ry), nz = Math.cos(b.ry);
      m.position.set(b.x + nx * 0.032, b.tang * CAO_TANG + 1.4, b.z + nz * 0.032); m.rotation.y = b.ry; m.renderOrder = 2;
      rieng(m); nhom.add(m);
      return { ...b, cv, tex, m, net: [] };
    });
    // gộp khối tĩnh, giữ khối động riêng
    gopKhoi(nhom, { deQuy: true, vatLieu: true });
    tg.nhom.add(nhom);
    // ===== cô bán vé số (vỉa hè gần cổng) =====
    {
      let s = 7; const rnd = () => (s = (s * 16807) % 2147483647) / 2147483647;
      const nv = taoNguoiNgauNhien(rnd, { nu: true, them: ["nonLa"] });
      nv.group.position.set(8.5, 0, 31.0); nv.group.rotation.y = 0; tg.nhom.add(nv.group); // thêm sau khi gộp khối tĩnh
      // xấp vé số kẹp trên tấm bìa, cầm trước ngực
      const bia = new THREE.Group(); bia.position.set(0, 1.05, 0.26); bia.rotation.x = -0.5;
      bia.add(new THREE.Mesh(new THREE.BoxGeometry(0.34, 0.24, 0.01), vl(0x8a6a3a)));
      for (let i = 0; i < 6; i++) { const v = new THREE.Mesh(new THREE.BoxGeometry(0.05, 0.11, 0.004), vl([0xf5b9cf, 0xf6f6f2, 0xe9e04a][i % 3])); v.position.set(-0.13 + i * 0.052, 0.03, 0.008); bia.add(v); }
      nv.group.add(bia);
      vat[0].push({ minX: 8.2, maxX: 8.8, minZ: 30.7, maxZ: 31.3, noiThat: true });
      tg.pho?.vatCanDiBo?.push({ x: 8.5, z: 31.0, r: 0.5 });
      this.veSo = { nv, boc: { nv, tang: 0, mau: "#c0262d" }, tRao: 4 };
    }

    this.taoDoVat();
  }

  // ---------- điểm bấm E ----------
  taoDoVat() {
    const g = this.g, cho = () => g.vai === "cho";
    for (let i = DO_VAT.length; i--;) if (DO_VAT[i].them) DO_VAT.splice(i, 1);
    const them = o => { o.them = true; if (!o.an) o.an = cho; DO_VAT.push(o); }; // giữ nguyên getter (nhãn đổi theo trạng thái)
    them({ loai: "may_in", tang: 0, x: -3.2, z: 11.8, nhan: "In tài liệu", nhin: [-3.2, 12.6], cui: -0.3 });
    them({ loai: "tu_ho_so", tang: 0, x: -18.75, z: 11.25, nhan: "Lục tủ hồ sơ", nhin: [-19.5, 11.25], cui: -0.35 });
    for (const b of this.bang) them({ loai: "bang_trang", tang: b.tang, x: b.dung[0], z: b.dung[1], nhan: "Vẽ lên bảng trắng", nhin: [b.x, b.z], cui: 0.02, bang: b });
    them({ loai: "cham_cong", tang: 0, x: -0.8, z: 12.05, nhan: "Chấm công vân tay", nhin: [-0.8, 12.8], cui: -0.08 });
    them({ loai: "than_tai", tang: 0, x: -0.72, z: 10.5, nhan: "Thắp nhang khấn Thần Tài", nhin: [-1.5, 10.5], cui: -0.1 });
    them({ loai: "tuoi_cay", tang: 0, x: -1.95, z: 15.0, nhan: "Tưới cây", nhin: [-1.1, 15.0], cui: -0.45 });
    them({ loai: "tuoi_rau", tang: 2, x: 16.7, z: -12.6, nhan: "Tưới rau giúp bác Bình", nhin: [16.7, -13.4], cui: -0.5 });
    const self = this;
    them({ loai: "cong_tac", tang: 0, x: -2.75, z: DEN_KLV.z, get nhan() { return self.g.hoatAnh?.denTat ? "Bật đèn khu làm việc" : "Tắt đèn khu làm việc"; }, nhin: [DEN_KLV.x, DEN_KLV.z], cui: 0 });
    them({ loai: "may_ban_nuoc", tang: 0, x: -8.4, z: -4.62, nhan: "Mua nước Hóng Cola (12.000đ)", nhin: [-8.4, -5.5], cui: -0.1 });
    them({ loai: "bi_lac", tang: 1, x: 10.5, z: -2.38, nhan: "Chơi bi lắc", nhin: [10.5, -3.3], cui: -0.4 });
    them({ loai: "ngu_trua", tang: 1, x: -4.6, z: 6.15, nhan: "Chợp mắt trên ghế lười", nhin: [-4.6, 5], cui: -0.2, ghe: [-4.6, 5.0], huongNgoi: 0 });
    them({ loai: "golf", tang: 1, x: -11.55, z: -6.75, nhan: "Đánh golf mini", nhin: [-10.2, -6.4], cui: -0.45 });
    them({ loai: "guitar", tang: 1, x: 13.3, z: -11, nhan: "Gảy đàn guitar", nhin: [12.6, -11], cui: -0.2 });
    them({ loai: "rut_dien", tang: 0, x: 0.7, z: -11.85, nhan: "Rút modem ra cắm lại", nhin: [0.7, -12.45], cui: -0.45 });
    them({ loai: "bang_tin", tang: 0, x: -12, z: -5.25, nhan: "Đọc bảng tin", nhin: [-12, -5.9], cui: 0.05 });
    them({ loai: "selfie", tang: 0, x: 7.65, z: 7.35, nhan: "Chụp ảnh với Siêu Nhân Hồng", nhin: [7.65, 5.8], cui: 0 });
    them({ loai: "the_duc", tang: 2, x: -1.5, z: 0.6, nhan: "Tập thể dục", nhin: [-1.5, -2], cui: 0 });
    them({ loai: "atm", tang: 0, x: -12, z: 31.28, nhan: "Kiểm tra số dư ATM", nhin: [-12, 30.47], cui: -0.15 });
    them({ loai: "ve_so", tang: 0, x: 8.5, z: 31.85, nhan: "Mua vé số (10.000đ)", nhin: [8.5, 31.0], cui: -0.05, an: () => cho() || !self.veSo.nv.group.visible });
    them({ loai: "da_cau", tang: 0, x: -12.2, z: 24.45, nhan: "Đá cầu", nhin: [-12.2, 23.6], cui: -0.3, an: () => cho() || !!self.cauBay, cauDV: true });
    const coRac = () => cho() || !self.g.hoatAnh?.rac;
    for (const x of XU_RAC) them({ loai: "thung_rac", tang: 0, x, z: 42.85, nhan: "Bỏ rác vào thùng", nhin: [x, 42.1], cui: -0.4, an: coRac });
    them({ loai: "thung_rac", tang: 0, x: 22, z: 28.25, nhan: "Bỏ rác vào thùng", nhin: [22, 28.9], cui: -0.4, an: coRac });
    them({ loai: "thung_rac", tang: 0, x: -9.12, z: -4.85, nhan: "Bỏ rác vào thùng", nhin: [-9.12, -5.4], cui: -0.4, an: coRac });
    this.dvCau = DO_VAT.find(v => v.cauDV);
  }

  // ---------- đang dùng: hoạt cảnh riêng của từng món ----------
  batDau(v, hd) {
    const k = v.loai;
    this.dang = { loai: k, hd, t: 0, v };
    if (k === "guitar") this.danGia.visible = false;
    if (k === "rut_dien") for (const d of this.denModem) d.material.color.setHex(0x3fe07a);
    if (k === "bang_trang") this.veBang(v.bang, 0);
    if (k === "da_cau") { this.cauBay = { t: 0, x: this.g.p.x, z: this.g.p.z, yaw: this.g.yaw }; }
  }
  capNhat(dt, t) {
    const g = this.g, d = this.dang, hd = g.hoatAnh?.hd;
    if (d && (!hd || hd.v !== d.v)) this.ket();
    if (this.dang) {
      const p = Math.min(1, hd.t / hd.dai);
      d.t += dt;
      if (d.loai === "may_ban_nuoc") this.lonRoi.visible = p > 0.36 && p < 0.62;
      if (d.loai === "bi_lac") { for (let i = 0; i < 4; i++) this.thanhBL[i].rotation.z = Math.sin(t * (13 + i * 2) + i) * 1.6; this.bongBL.position.x = 10.5 + Math.sin(t * 3.1) * 0.4; this.bongBL.position.z = -3.3 + Math.sin(t * 4.7) * 0.2; }
      if (d.loai === "rut_dien") { const tat = p > 0.35 && p < 0.72; for (const [i, l] of this.denModem.entries()) l.material.color.setHex(tat ? 0x222222 : p > 0.72 && Math.sin(t * 20 + i) > 0 ? 0xf0a030 : 0x3fe07a); }
      if (d.loai === "bang_trang") this.veBang(d.v.bang, p);
      if (d.loai === "da_cau") this.cauDa(p, hd);
    }
    // quả cầu rơi xuống đất sau khi đá
    if (this.cauRoi) { const r = this.cauRoi; r.t += dt; const k = Math.min(1, r.t / 0.6); this.cau.position.y = THREE.MathUtils.lerp(r.y, 0.02, k * k); this.cau.rotation.z += dt * 6 * (1 - k); if (k >= 1) this.cauRoi = null; }
    // cô bán vé số: đứng trong giờ bán, lâu lâu rao
    const vs = this.veSo, gio = g.bauTroi?.gio ?? 12;
    const ban = gio >= 7 && gio < 19 && g.tang === 0 && !g.oNgoai();
    vs.nv.group.visible = ban;
    if (ban) {
      const kc = Math.hypot(g.p.x - 8.5, g.p.z - 31);
      if (kc < 45) {
        vs.nv.hoatDong(t + 3.1, false);
        const A = vs.nv.A; // hai tay giữ tấm bìa vé số trước ngực
        if (A && !vs.nv.cu) { A.huongTay(A.tayT, -0.15, 1.02, 0.28, 1, true); A.huongTay(A.tayP, 0.15, 1.02, 0.28, 1, true); }
        vs.tRao -= dt;
        if (vs.tRao <= 0 && kc < 18 && !g.khoa) {
          vs.tRao = 18 + Math.random() * 16;
          g.doiSong.noi(vs.boc, chon(["Vé số đây! Kiến thiết Quận Hóng đây!", "Mua giùm cô tờ vé số đi con, hên lắm nè!", "Xổ chiều nay nè! Trúng là đổi đời liền!", "Vé số đây bà con ơi! Còn mấy tờ đẹp lắm!"]), undefined, false);
          am.phat("rao_ve_so", 8.5, 31);
        }
        if (kc < 3.2 && !vs.nv.cu && Math.random() < dt * 0.15) vs.nv.lamCu?.("gat_dau");
      }
    }
  }
  ket() {
    const d = this.dang; if (!d) return;
    this.dang = null;
    if (d.loai === "guitar") this.danGia.visible = true;
    if (d.loai === "may_ban_nuoc") this.lonRoi.visible = false;
    if (d.loai === "bi_lac") for (const r of this.thanhBL) r.rotation.z = 0;
    if (d.loai === "rut_dien") for (const l of this.denModem) l.material.color.setHex(0x3fe07a);
    if (d.loai === "da_cau" && this.cauBay) {
      // cầu rơi xuống trước mặt; điểm bấm E đi theo quả cầu
      const c = this.cau.position; this.cauRoi = { t: 0, y: c.y };
      const x = THREE.MathUtils.clamp(c.x, -22.5, 22.5), z = THREE.MathUtils.clamp(c.z, 16, 28.5);
      c.x = x; c.z = z; this.cauBay = null;
      if (this.dvCau && !this.g.chanTai(x, z + 0.5, 0.32)) { this.dvCau.x = x; this.dvCau.z = z + 0.5; this.dvCau.nhin = [x, z - 0.35]; }
    }
  }
  // quả cầu bay lên rồi rơi xuống mũi giày theo nhịp đá (nhịp 1,5 lần / giây giống cử chỉ đá cầu)
  cauDa(p, hd) {
    const g = this.g, b = this.cauBay; if (!b) return;
    const yaw = g.yaw, fx = -Math.sin(yaw), fz = -Math.cos(yaw), y0 = g.tang * CAO_TANG;
    const n = (hd.t * 1.5) % 1, cao = p < 0.06 ? 0.02 + p / 0.06 * 0.3 : 0.32 + Math.sin(n * PI) * 1.2;
    const c = this.cau.position;
    c.set(g.p.x + fx * 0.42 - Math.cos(yaw) * 0.08, y0 + cao, g.p.z + fz * 0.42 + Math.sin(yaw) * 0.08);
    this.cau.rotation.set(0, 0, n < 0.5 ? 0.15 : PI - 0.15); // lông cầu hướng lên khi bay lên, quay đầu khi rơi
    if (n < 0.06 && !b.daDa) { b.daDa = true; am.phat("da_cau", c.x, c.z); } else if (n > 0.2) b.daDa = false;
  }
  // vẽ dần lên bảng trắng (mỗi lần dùng một hình mới)
  veBang(b, p) {
    const c = b.cv.getContext("2d"), W = b.cv.width, H = b.cv.height;
    if (p === 0) {
      c.clearRect(0, 0, W, H);
      const ds = [], mau = chon(["#1f4fa8", "#c0262d", "#2e8b57", "#1a1a1a"]), kieu = Math.floor(Math.random() * 4);
      if (kieu === 0) { // biểu đồ đi lên
        ds.push({ mau, net: [[60, 220], [60, 40]] }, { mau, net: [[60, 220], [470, 220]] }, { mau: "#c0262d", net: [[70, 200], [150, 170], [230, 185], [320, 110], [420, 60]] }, { chu: "KPI ↑↑↑", x: 300, y: 55, mau });
      } else if (kieu === 1) { // mèo + DEADLINE
        const m = [];
        for (let i = 0; i <= 20; i++) { const a = i / 20 * Math.PI * 2; m.push([150 + Math.cos(a) * 55, 140 + Math.sin(a) * 50]); }
        ds.push({ mau, net: m }, { mau, net: [[110, 102], [118, 62], [135, 95]] }, { mau, net: [[165, 95], [182, 62], [190, 102]] }, { chu: "DEADLINE", x: 360, y: 150, mau: "#c0262d" });
      } else if (kieu === 2) { // thứ Sáu đi nhậu?
        ds.push({ chu: "Thứ 6 đi nhậu?", x: 256, y: 90, mau }, { mau: "#2e8b57", net: [[150, 160], [165, 178], [195, 140]] }, { mau: "#2e8b57", net: [[240, 160], [255, 178], [285, 140]] }, { mau: "#2e8b57", net: [[330, 160], [345, 178], [375, 140]] });
      } else { // sơ đồ tư duy
        const o = (x, y) => { const r = []; for (let i = 0; i <= 14; i++) { const a = i / 14 * Math.PI * 2; r.push([x + Math.cos(a) * 46, y + Math.sin(a) * 26]); } return r; };
        ds.push({ mau, net: o(256, 128) }, { chu: "Ý TƯỞNG", x: 256, y: 136, mau, nho: true }, { mau, net: [[210, 115], [110, 60]] }, { mau, net: [[300, 115], [410, 60]] }, { mau, net: [[256, 154], [256, 220]] }, { chu: "???", x: 90, y: 50, mau: "#c0262d", nho: true }, { chu: "$$$", x: 430, y: 50, mau: "#2e8b57", nho: true }, { chu: "Ngủ", x: 256, y: 240, mau, nho: true });
      }
      b.net = ds; b.daVe = 0;
    }
    const tong = b.net.length, den = Math.min(tong, Math.floor(p * 1.15 * tong + 0.5));
    if (den <= b.daVe) return;
    for (let i = b.daVe; i < den; i++) {
      const n = b.net[i];
      c.strokeStyle = c.fillStyle = n.mau; c.lineWidth = 6; c.lineCap = c.lineJoin = "round";
      if (n.chu) { c.font = `700 ${n.nho ? 26 : 44}px 'Be Vietnam Pro', system-ui, sans-serif`; c.textAlign = "center"; c.fillText(n.chu, n.x, n.y); }
      else { c.beginPath(); n.net.forEach(([x, y], k) => k ? c.lineTo(x, y) : c.moveTo(x, y)); c.stroke(); }
    }
    b.daVe = den; b.tex.needsUpdate = true;
  }
}
