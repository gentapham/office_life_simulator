// Bản đồ 3D: tòa nhà G-Entertainment (tầng 1, tầng 2, sân thượng), sân trước, chòi bảo vệ, cổng, phố xung quanh.
// Tầng: 0 = tầng 1 và sân (y = 0), 1 = tầng 2 (y = 4), 2 = sân thượng (y = 8).
import * as THREE from "three";
import { gopKhoi } from "./gop-khoi.js";
import { MUC, vlBe, vlRieng, uvTheGioiKhoi } from "./vat-lieu.js";
import { vl } from "./nhan-vat-3d.js";
import { taoThanhPho } from "./thanh-pho.js";
import { memBat, dungCay, dungChauCay, BoCo, hinhHopVL, hinhVat, hinhTru } from "./hinh-mem.js";
import { themNoiThat } from "./noi-that.js";
import { trangTriCongTy } from "./trang-tri.js";
import { themChiTietCongTy, manHinhPhang } from "./chi-tiet-cong-ty.js";
import { taoXeMay } from "./xe-3d.js";
export { THANG_MAY, capNhatChiTiet, capNhatCua, capNhatCuaSo } from "./chi-tiet-cong-ty.js";

export const CAO_TANG = 4;
const TUONG_CAO = 3.82, DAY = 0.25; // tường cao chạm trần (không hở khe nhìn thấy trời)

// Các khu để đặt cảnh truyện. x, z là tâm khu; ten hiện trên màn hình
export const KHU = {
  cong:        { ten: "Cổng công ty", tang: 0, x: 2, z: 27 },
  choi_bao_ve: { ten: "Chòi bảo vệ", tang: 0, x: -4.6, z: 26.2 },
  ra_ngoai:    { ten: "Ra ngoài (cổng)", tang: 0, x: 2, z: 28.2 },
  sanh:        { ten: "Sảnh lễ tân", tang: 0, x: 2, z: 11 },
  khu_lam_viec:{ ten: "Khu làm việc chung", tang: 0, x: -11, z: 6 },
  pantry:      { ten: "Pantry", tang: 0, x: 14, z: 6 },
  ke_toan:     { ten: "Phòng kế toán", tang: 0, x: -15, z: -8.2 },
  hr:          { ten: "Phòng HR", tang: 0, x: -6, z: -8.2 },
  server:      { ten: "Phòng server", tang: 0, x: 1, z: -10 },
  kho_su_kien: { ten: "Kho sự kiện", tang: 0, x: 8, z: -8 },
  toilet:      { ten: "Toilet", tang: 0, x: 16, z: -9 },
  gam_cau_thang:{ ten: "Gầm cầu thang", tang: 0, x: 4.4, z: -1.2 },
  hanh_lang_1: { ten: "Hành lang tầng 1", tang: 0, x: 0, z: -4 },
  giam_doc:    { ten: "Phòng giám đốc", tang: 1, x: -14, z: -8 },
  pho_giam_doc:{ ten: "Phòng phó giám đốc", tang: 1, x: -4, z: -8 },
  phong_hop:   { ten: "Phòng họp tầng 2", tang: 1, x: 6, z: -6 },
  nghe_si:     { ten: "Phòng nghệ sĩ", tang: 1, x: 17, z: -6.5 },
  hanh_lang_2: { ten: "Hành lang tầng 2", tang: 1, x: -6, z: -1 },
  studio:      { ten: "Studio tầng 2", tang: 1, x: -13, z: 8 },
  dung_phim:   { ten: "Phòng dựng phim", tang: 1, x: -2, z: 7 },
  san_xuat:    { ten: "Phòng sản xuất", tang: 1, x: 14, z: 7 },
  san_thuong:  { ten: "Sân thượng", tang: 2, x: 0, z: 0 },
  san_khau:    { ten: "Sân khấu Đại Nhạc Hội", tang: 0, x: 110, z: 9.5, ngoai: true },
};

// Đồ vật bấm E để dùng (đi vệ sinh, rửa mặt, uống nước...)
export const DO_VAT = [
  { loai: "wc", tang: 0, x: 15.4, z: -11.7, nhan: "Vào buồng vệ sinh" },
  { loai: "wc", tang: 0, x: 17.2, z: -11.7, nhan: "Vào buồng vệ sinh" },
  { loai: "wc", tang: 0, x: 19.0, z: -11.7, nhan: "Vào buồng vệ sinh" },
  { loai: "tieu", tang: 0, x: 19.1, z: -9.0, nhan: "Dùng bồn tiểu" },
  { loai: "rua_mat", tang: 0, x: 13.1, z: -8.1, nhan: "Rửa mặt" },
  { loai: "rua_mat", tang: 0, x: 13.1, z: -9.6, nhan: "Rửa mặt" },
  { loai: "uong_nuoc", tang: 0, x: -3.2, z: -0.3, nhan: "Uống nước" },
  // ăn uống trong công ty
  { loai: "tu_lanh", tang: 0, x: 19.2, z: 11.6, nhan: "Lấy hộp cơm trong tủ lạnh" },
  { loai: "mi_ly", tang: 0, x: 16.8, z: 11.9, nhan: "Hâm mì ly bằng lò vi sóng" },
  { loai: "ca_phe", tang: 0, x: 12.0, z: 11.9, nhan: "Pha cà phê" },
  { loai: "trai_cay", tang: 0, x: 12.0, z: 7.0, nhan: "Ăn trái cây" },
  { loai: "trai_cay", tang: 0, x: 16.0, z: 7.0, nhan: "Ăn trái cây" },
  { loai: "tra_bac_binh", tang: 0, x: -6.9, z: 25.4, nhan: "Xin bác Bình ly trà" },
  // mua ngoài phố (trừ tiền thật trong ví)
  { loai: "banh_mi", tang: 0, x: -6, z: 42.4, nhan: "Mua bánh mì (20.000đ)" },
  { loai: "banh_mi", tang: 0, x: -40, z: 32.1, nhan: "Mua Bánh Mì Bựa (25.000đ)", gia: 25000 },
  { loai: "hu_tieu", tang: 0, x: 40, z: 42.4, nhan: "Ăn hủ tiếu gõ (35.000đ)" },
  { loai: "nuoc_mia", tang: 0, x: 66, z: 32.1, nhan: "Mua nước mía (15.000đ)" },
  { loai: "che", tang: 0, x: 13.5, z: 42.4, nhan: "Ăn chè Bà Bảy (20.000đ)" },
  ...[-120, -86, -52, -14, 22, 76, 112].map(x => ({ loai: "tra_da", tang: 0, x, z: 42.3, nhan: "Uống trà đá (5.000đ)" })),
  { loai: "uong_nuoc", tang: 0, x: 7.8, z: 10.4, nhan: "Uống nước" },
  { loai: "uong_nuoc", tang: 1, x: 18.75, z: 1.2, nhan: "Uống nước" },
];

// Điểm chuyển tầng (bấm tương tác để đi)
export const DIEM_DAU_NGAY = { tang: 0, x: 2, z: 27.5, huong: 0 };

// Khu mặc định của từng vai (cảnh không ghi địa điểm thì diễn ở đây)
export const KHU_CUA_VAI = {
  ke_toan: "ke_toan", hr: "hr", it: "server", chi_dai: "kho_su_kien", bac_bao_ve: "choi_bao_ve", cho: "choi_bao_ve",
  giam_doc: "giam_doc", thanh_ninh: "hanh_lang_2", truong_phong: "san_xuat", editor: "dung_phim",
  idol_het_thoi: "nghe_si", quan_ly_idol: "nghe_si", sieu_nhan_hong: "studio",
};

export const CAU_THANG = [
  { id: "len_2", tang: 0, x: 6.5, z: 3, toi: { tang: 1, x: 5, z: 6.5, huong: 0 }, nhan: "Lên tầng 2" },
  { id: "xuong_1", tang: 1, x: 5, z: 4.4, toi: { tang: 0, x: 4.2, z: 4.2, huong: Math.PI }, nhan: "Xuống tầng 1" },
  { id: "len_st", tang: 1, x: 5, z: 12.6, toi: { tang: 2, x: 5, z: 9, huong: 0 }, nhan: "Lên sân thượng" },
  { id: "xuong_st", tang: 2, x: 5, z: 11.2, toi: { tang: 1, x: 5, z: 10.4, huong: 0 }, nhan: "Xuống tầng 2" },
];

// Chỗ đứng / bàn làm việc của từng nhân vật (bàn khu làm việc chung đánh số 0..9)
const BAN_CHUNG = [];
for (let hang = 0; hang < 2; hang++) for (let cot = 0; cot < 5; cot++) BAN_CHUNG.push({ x: -18 + cot * 3, z: 1.5 + hang * 6 });
// chủ của từng bàn (màn hình và đồ trên bàn theo người này)
const CHU_BAN = ["ran_doc", "hong_hot", "chua_te_deadline", "thuc_tap_sinh", "bien_kich", "designer", "sales", "dan_dau_tu", "thanh_xin_nghi", "con_ong_chau_cha"];
const NGOI = b => ({ x: b.x, z: b.z + 0.95, huong: Math.PI, ngoi: true, ban: b });
export const CHO_NGOI = {
  ran_doc: { tang: 0, ...NGOI(BAN_CHUNG[0]) }, hong_hot: { tang: 0, ...NGOI(BAN_CHUNG[1]) }, chua_te_deadline: { tang: 0, ...NGOI(BAN_CHUNG[2]) },
  thuc_tap_sinh: { tang: 0, ...NGOI(BAN_CHUNG[3]) }, bien_kich: { tang: 0, ...NGOI(BAN_CHUNG[4]) }, designer: { tang: 0, ...NGOI(BAN_CHUNG[5]) },
  sales: { tang: 0, ...NGOI(BAN_CHUNG[6]) }, dan_dau_tu: { tang: 0, ...NGOI(BAN_CHUNG[7]) }, thanh_xin_nghi: { tang: 0, ...NGOI(BAN_CHUNG[8]) },
  con_ong_chau_cha: { tang: 0, ...NGOI(BAN_CHUNG[9]) },
  // ngoi: true = ngồi ghế gõ máy; nghi: true = ngồi chơi (tay để trên đùi, lâu lâu nâng ly); yNgoi: hạ thân bao nhiêu (mặt đệm 0,51 m → −0,36)
  ke_toan: { tang: 0, x: -15, z: -11.4, ngoi: true }, hr: { tang: 0, x: -6, z: -11.5, ngoi: true },
  it: { tang: 0, x: 2.8, z: -7.95, huong: 0, ngoi: true },                      // bàn laptop phòng server, quay mặt ra cửa
  chi_dai: { tang: 0, x: 8, z: -10.3, ngoi: true },                             // bàn điều phối trong kho sự kiện, nhìn ra cửa
  bac_bao_ve: { tang: 0, x: -6.9, z: 23.98, huong: 0.25, ngoi: true, nghi: true, yNgoi: -0.42 }, // ghế nhựa dưới cửa sổ chòi, bàn trà trước mặt, nhìn ra cổng
  cho: { tang: 0, x: -3.6, z: 25.4, huong: 0.9 },
  giam_doc: { tang: 1, x: -14.7, z: -11.75, huong: 0, ngoi: true },             // ghế da sau bàn giám đốc, nhìn ra cửa phòng
  thanh_ninh: { tang: 1, x: -10.8, z: 0.36, huong: Math.PI, ngoi: true },       // bàn trợ lý ngoài hành lang, nhìn thẳng cửa phòng sếp
  truong_phong: { tang: 1, x: 14, z: 9.55, huong: 0, ngoi: true },
  editor: { tang: 1, x: -2, z: 10.15, huong: 0, ngoi: true },
  idol_het_thoi: { tang: 1, x: 18.9, z: -8.95, huong: Math.PI / 2, ngoi: true, nghi: true }, // ghế đạo diễn trước gương trang điểm
  quan_ly_idol: { tang: 1, x: 16.7, z: -12.68, huong: 0, ngoi: true, nghi: true },          // sofa tím phòng nghệ sĩ, hai cái điện thoại
  sieu_nhan_hong: { tang: 1, x: -13, z: 10.6, huong: Math.PI, ngoi: true, nghi: true },      // ghế bành hồng trước máy quay, phông hồng sau lưng
};
// ghế ngồi được nhưng không của ai (người chơi ngồi thử được)
export const GHE_LE = [
  { tang: 1, x: -4.4, z: -11.65, huong: 0, y: -0.36, loai: "pho_gd" }, // ghế phó giám đốc: ghế trống mà ai cũng nhắm tới
];

// Tag "noi" của cảnh -> khu trong bản đồ. Địa điểm ngoài công ty đi qua cổng.
export function khuCuaNoi(noi) {
  if (!noi || noi === true) return null;
  const n = String(noi);
  const co = re => re.test(n);
  if (co(/san_khau_dem_hong|san_khau_dai_nhac|quang_truong_hong|canh_ga_dem_hong|hau_truong_dem_hong|hien_truong/)) return "san_khau";
  if (co(/toa_nha_ban_dem/)) return "sanh";
  if (co(/phong_pho_phong/)) return "khu_lam_viec";
  if (co(/san_thuong/)) return "san_thuong";
  if (co(/pho_giam_doc/)) return "pho_giam_doc";
  if (co(/giam_doc|ban_tro_ly/)) return "giam_doc";
  if (co(/phong_hop/)) return "phong_hop";
  if (co(/nghe_si|phong_cho/)) return "nghe_si";
  if (co(/studio/)) return "studio";
  if (co(/dung_phim|phong_dung/)) return "dung_phim";
  if (co(/san_xuat/)) return "san_xuat";
  if (co(/hanh_lang_tang_2|cau_thang_tang_2|tang_2/)) return "hanh_lang_2";
  if (co(/ke_toan/)) return "ke_toan";
  if (co(/phong_hr|^hr$/)) return "hr";
  if (co(/server|tu_mang/)) return "server";
  if (co(/kho_su_kien/)) return "kho_su_kien";
  if (co(/toilet/)) return "toilet";
  if (co(/pantry|can_tin/)) return "pantry";
  if (co(/gam_cau_thang|cau_thang/)) return "gam_cau_thang";
  if (co(/choi_bao_ve|chot_bao_ve|chong_bao_ve|sau_choi/)) return "choi_bao_ve";
  if (co(/cong_cong_ty|bai_xe|san_cong_ty|duong_truoc_cong_ty|cong_sau|may_cham_cong_ngoai/)) return "cong";
  if (co(/sanh|le_tan|thang_may|may_cham_cong|tang_tret|tang_1|van_phong_tang_1|may_in/)) return "sanh";
  if (co(/^ban_|khu_lam_viec|van_phong|ban_lam_viec|dien_thoai/)) return "khu_lam_viec";
  if (co(/hanh_lang/)) return "hanh_lang_1";
  return "ra_ngoai";
}

export function taoTheGioi(sceneGoc, { dienThoai = false } = {}) {
  // mọi khối tĩnh vào một nhóm, cuối cùng gộp theo vật liệu để giảm lượt vẽ
  const scene = new THREE.Group(); sceneGoc.add(scene);
  const MEM = memBat();
  const vat = { 0: [], 1: [], 2: [] };    // vật cản theo tầng: {minX,maxX,minZ,maxZ}
  const denDem = [];                       // đèn bật buổi tối
  const nhapNhay = [];                     // đèn LED nhấp nháy
  const Y = t => t * CAO_TANG;

  // be: loại mặt (vat-lieu.js) — tường sơn, gạch men, gỗ...
  // đồ đạc (gỗ, vải, da, nhựa, sơn bóng, kim loại) vát cạnh mềm; tường, sàn, kính giữ hộp vuông (ghép mí không hở)
  const hop = (w, h, d, color, x, y, z, { tang = 0, can = true, vatLieu, be } = {}) => {
    const vlm = vatLieu || vl(color);
    const m = new THREE.Mesh(MEM && (!be || BE_VAT.has(be)) && memBat("hop") && Math.min(w, h, d) >= 0.12 ? hinhHopVL(w, h, d, vlm) : new THREE.BoxGeometry(w, h, d), vlm);
    if (be) m.userData.be = be;
    m.position.set(x, y + h / 2, z);
    scene.add(m);
    if (can) vat[tang].push({ minX: x - w / 2, maxX: x + w / 2, minZ: z - d / 2, maxZ: z + d / 2 });
    return m;
  };

  // Tường thẳng có khe cửa. doors: [[tu, den], ...] theo trục chạy của tường
  const tuong = (x1, z1, x2, z2, tang, doors = [], color = 0xe9e3d6, cao = TUONG_CAO, be = "son") => {
    const ngang = z1 === z2;
    const a = ngang ? Math.min(x1, x2) : Math.min(z1, z2), b = ngang ? Math.max(x1, x2) : Math.max(z1, z2);
    const doan = []; let dau = a;
    for (const [d1, d2] of [...doors].sort((p, q) => p[0] - q[0])) { if (d1 > dau) doan.push([dau, d1]); dau = d2; }
    if (dau < b) doan.push([dau, b]);
    const y = Y(tang);
    for (const [p, q] of doan) {
      const dai = q - p, giua = (p + q) / 2;
      if (ngang) hop(dai, cao, DAY, color, giua, y, z1, { tang, be }); else hop(DAY, cao, dai, color, x1, y, giua, { tang, be });
      if (cao > 2) vat[tang][vat[tang].length - 1].tuong = true; // camera góc nhìn thứ ba chỉ né tường
    }
    if (cao > 2.5) for (const [d1, d2] of doors) { // phần tường trên khung cửa (hàng rào thấp thì không có)
      const dai = d2 - d1, giua = (d1 + d2) / 2;
      if (ngang) hop(dai, cao - 2.4, DAY, color, giua, y + 2.4, z1, { tang, can: false, be }); else hop(DAY, cao - 2.4, dai, color, x1, y + 2.4, giua, { tang, can: false, be });
    }
  };

  // ---------- Phố phường xung quanh ----------
  const pho = taoThanhPho(scene, vat, denDem, { dienThoai });
  // sân công ty
  const san = new THREE.Mesh(new THREE.PlaneGeometry(48, 48), dong(vlRieng("lat_san", 0xc9c3b6))); san.rotation.x = -Math.PI / 2; san.position.set(0, -0.005, 6); scene.add(san);
  uvTheGioiKhoi(san, "lat_san");
  pho.matUot.push(san.material);
  const coSan = new BoCo(); // búi cỏ trong sân (gốc cây, chân hàng rào)
  const cay = (x, z, s = 1) => {
    if (MEM && memBat("cay")) {
      // cây sân: thân ngắn hơi cong, tán ba cục tròn (gọn trong hộp tán cũ)
      const h = (x * 0.13 + z * 0.07) % 1, a = h * 6.28;
      dungCay(scene, { goc: [x, z], cao: 1.4 * s, rGoc: 0.16 * s, rNgon: 0.11 * s, hat: h, them: false, tan: [
        { x: x + Math.cos(a) * 0.08 * s, y: 1.98 * s, z: z + Math.sin(a) * 0.08 * s, r: 0.72 * s, mau: 0x55894a },
        { x: x + Math.cos(a + 2.2) * 0.3 * s, y: 1.78 * s, z: z + Math.sin(a + 2.2) * 0.3 * s, r: 0.5 * s, mau: 0x3f7a4c },
        { x: x + Math.cos(a + 4.3) * 0.3 * s, y: 2.12 * s, z: z + Math.sin(a + 4.3) * 0.3 * s, r: 0.46 * s, mau: 0x5f9450 },
      ] });
      coSan.vong(x, z, 0.2, 0.42, 8, 0, 0.9, 2);
    } else {
    const t = new THREE.Mesh(new THREE.CylinderGeometry(0.12 * s, 0.16 * s, 1.4 * s, 5), vl(0x6b4a2f)); t.position.set(x, 0.7 * s, z); scene.add(t);
    const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.9 * s, 0), vl(0x4f8a3c)); l.position.set(x, 1.9 * s, z); scene.add(l);
    }
    vat[0].push({ minX: x - 0.3, maxX: x + 0.3, minZ: z - 0.3, maxZ: z + 0.3 });
  };
  [[-18, 18], [-14, 26], [16, 18], [20, 26], [-22, 22], [-22, -16], [22, -16], [-22, 4], [22, 4]].forEach(([x, z]) => cay(x, z, 1.1));

  // ---------- Hàng rào sân trước + cổng ----------
  const hangRao = (x1, z1, x2, z2, doors = []) => tuong(x1, z1, x2, z2, 0, doors, 0xd2cbbb, 1.4, "vua");
  if (MEM) { // cỏ mọc sát chân hàng rào phía trong sân (sát tường, người không đứng tới)
    coSan.doan(-23.84, -17.5, -23.84, 29.5, 0.5, 0.03, 0, 0.72, 3); coSan.doan(23.84, -17.5, 23.84, 29.5, 0.5, 0.03, 0, 0.72, 4);
    coSan.doan(-23.5, -17.84, 23.5, -17.84, 0.5, 0.03, 0, 0.72, 5); coSan.doan(-23.5, 29.84, -0.8, 29.84, 0.5, 0.03, 0, 0.72, 6); coSan.doan(4.8, 29.84, 23.5, 29.84, 0.5, 0.03, 0, 0.72, 7);
  }
  hangRao(-24, -18, -24, 30); hangRao(24, -18, 24, 30); hangRao(-24, -18, 24, -18);
  hangRao(-24, 30, 24, 30, [[0, 4]]);
  hop(4, 1.6, 0.2, 0x3c3f46, 6.1, 0, 29.65, { be: "kim" }); // cánh cổng đã kéo sang một bên: đi bộ ra phố được
  hop(0.6, 2.4, 0.6, 0xb9b2a3, -0.3, 0, 30, { be: "vua" }); hop(0.6, 2.4, 0.6, 0xb9b2a3, 4.3, 0, 30, { be: "vua" });
  // Chòi bảo vệ
  hop(4, 2.6, 3.2, 0x5f87b8, -8, 0, 22, { be: "vua" });
  hop(4.4, 0.25, 3.6, 0x2f3c52, -8, 2.6, 22, { can: false, be: "ton" });
  hop(2.2, 0.9, 0.06, 0x9fd3f2, -8, 1.1, 20.38, { can: false, be: "kinh" });
  hop(2.2, 0.9, 0.06, 0x9fd3f2, -8, 1.1, 23.62, { can: false, be: "kinh" }); // cửa sổ nhìn ra cổng
  // chỗ ngồi của bác bảo vệ: ghế nhựa tựa lưng sát chòi, bàn trà trước mặt, nhìn ra cổng
  hop(1, 0.75, 0.6, 0x7a5a3a, -6.9, 0, 24.6, { be: "go" }); // bàn trà
  gheNhuaTua(scene, CHO_NGOI.bac_bao_ve, vat[0]);
  const amTra = new THREE.Mesh(new THREE.SphereGeometry(0.12, 6, 4), vl(0xece6da)); amTra.position.set(-6.9, 0.85, 24.6); scene.add(amTra);
  // Bãi xe máy
  for (let i = 0; i < 6; i++) xeMay(scene, 10 + i * 1.6, 23 + (i % 2) * 0.3, vat);

  // ---------- Tòa nhà ----------
  const ngoai = 0xfdf7ec, trong = 0xf6f1e8; // sơn mới: kem sáng bên ngoài, trắng ngà bên trong
  for (const t of [0, 1]) {
    const y = Y(t);
    const san = hop(40, 0.2, 28, t === 0 ? 0xcfc6b4 : 0xd8cfbd, 0, y - 0.2, 0, { can: false, be: "gach_men" });
    san.position.y = y - 0.1;
    // tường ngoài
    tuong(-20, -14, 20, -14, t, [], ngoai);
    tuong(-20, -14, -20, 14, t, [], ngoai);
    tuong(20, -14, 20, 14, t, [], ngoai);
    tuong(-20, 14, 20, 14, t, t === 0 ? [[0, 4]] : [], ngoai);
    // cửa sổ có khung, kính đổi màu theo giờ: dựng trong chi-tiet-cong-ty.js
  }
  // trần tầng 2 / sàn sân thượng
  hop(40, 0.2, 28, 0xbdb3a1, 0, Y(2) - 0.2, 0, { tang: 2, can: false, be: "lat_san" });
  // lan can sân thượng
  tuong(-20, -14, 20, -14, 2, [], 0xd9d2c4, 1.1, "vua"); tuong(-20, 14, 20, 14, 2, [], 0xd9d2c4, 1.1, "vua");
  tuong(-20, -14, -20, 14, 2, [], 0xd9d2c4, 1.1, "vua"); tuong(20, -14, 20, 14, 2, [], 0xd9d2c4, 1.1, "vua");
  // biển hiệu mặt tiền
  // hộp đèn biển hiệu: đặt cao sát viền mái, nhô hẳn ra khỏi tường để không chạm khung cửa sổ, lam che nắng
  hop(13.3, 2.2, 0.3, 0x9c3f10, 2, 5.3, 14.3, { can: false, be: "son_bong" });
  const bien = new THREE.Mesh(new THREE.PlaneGeometry(13, 2), new THREE.MeshBasicMaterial({ map: taoBienHieu(), toneMapped: false }));
  bien.position.set(2, 6.4, 14.47); scene.add(bien);
  // mái che cửa chính
  hop(6, 0.2, 2.4, 0xe8702a, 2, 2.9, 15.3, { can: false, be: "son_bong" });

  // ---- Tầng 1 ----
  tuong(-20, -6, 20, -6, 0, [[-16, -14], [-7, -5], [0, 2], [7, 9], [15, 17]], trong);
  for (const x of [-10, -2, 4, 12]) tuong(x, -14, x, -6, 0, [], trong);
  tuong(-2, -2, -2, 14, 0, [[3, 8]], trong);
  tuong(9, -2, 9, 14, 0, [[3, 8]], trong);
  // Sảnh lễ tân
  hop(4, 1.1, 1, 0xe8702a, 2, 0, 8.5, { be: "son_bong" });
  hop(4.2, 0.08, 1.2, 0xf6f1e8, 2, 1.1, 8.5, { can: false, be: "gach_men" });
  // vách logo sau quầy lễ tân (trước đây logo và đồng hồ treo lơ lửng giữa không trung)
  hop(4.2, TUONG_CAO, 0.2, 0x2fa39a, 2, 0, -1.97); logoG(scene, 2, 2.2, -1.85);
  hop(4.3, 0.12, 0.26, 0xe8702a, 2, 0.95, -1.97, { can: false });
  hop(3, 0.5, 1, 0x5b6b8c, 6.5, 0, 12, { be: "vai" }); hop(3, 0.6, 0.25, 0x5b6b8c, 6.5, 0.5, 12.5, { can: false, be: "vai" }); // sofa
  hop(1.2, 0.4, 0.6, 0x8a6a4a, 6.5, 0, 10.8, { be: "go" });
  hop(0.6, 1.4, 0.5, 0x3a3d44, -0.8, 0, 12.8, { be: "nhua" }); // máy chấm công
  chauCay(scene, -1.2, 13, vat[0]); chauCay(scene, 8.2, 13, vat[0]);
  // Cầu thang (góc sảnh)
  for (let i = 0; i < 7; i++) hop(2.4, 0.3 + i * 0.5, 0.6, i % 2 ? 0xd9b48a : 0xcfa87c, 6.5, 0, 2.1 - i * 0.6, { can: i > 1, be: "go" });
  // Khu làm việc chung
  BAN_CHUNG.forEach((b, i) => banLamViec(scene, b.x, b.z, vat[0], denDem, CHU_BAN[i]));
  bangTrang(scene, -19.85, 1.4, 6, Math.PI / 2);
  // Pantry
  hop(8, 0.95, 1, 0xd9d2c4, 14.5, 0, 13, { be: "be_tong" }); hop(1, 2, 0.9, 0xe8e8e8, 19.2, 0, 12.8, { be: "son_bong" }); // quầy + tủ lạnh
  hop(1.2, 0.5, 0.6, 0x3a3d44, 12, 0.95, 13, { can: false, be: "kim" }); // máy pha cà phê
  for (const [x, z] of [[12, 6], [16, 6]]) { hop(2, 0.75, 1.2, 0xb08a5a, x, 0, z, { be: "go" }); }
  chauCay(scene, 19, 0, vat[0]);
  // Phòng kế toán
  hop(3, 0.75, 1.2, 0x8a6a4a, -15, 0, -10.5, { be: "go" }); hop(0.5, 2.2, 3, 0x6b5a48, -19.4, 0, -10, { be: "go" }); manHinh(scene, -14.7, 0.75, -10.2, Math.PI, denDem, "ke_toan"); // màn hình quay về phía người ngồi
  // HR
  hop(2.6, 0.75, 1.2, 0x9ab0a0, -6, 0, -10.5, { be: "go" }); manHinh(scene, -6.3, 0.75, -10.2, Math.PI, denDem, "hr"); chauCay(scene, -3, -13, vat[0]);
  // Server
  for (let i = 0; i < 3; i++) { hop(0.9, 2.2, 1, 0x1d1f24, -0.6 + i * 1.3, 0, -13.2, { be: "kim" }); for (let j = 0; j < 4; j++) { const led = new THREE.Mesh(new THREE.BoxGeometry(0.06, 0.06, 0.02), new THREE.MeshBasicMaterial({ color: j % 2 ? 0x3fe07a : 0x3fb8e0 })); led.position.set(-0.85 + i * 1.3 + j * 0.15, 1.6 - (j % 2) * 0.4, -12.69); scene.add(led); nhapNhay.push(led); } }
  // Kho sự kiện
  for (let i = 0; i < 3; i++) { hop(2.6, 0.06, 0.8, 0x8a7a64, 8, 0.6 + i * 0.7, -13.4, { can: false, be: "kim" }); hop(0.6, 0.5, 0.5, [0xe8702a, 0xf26fa6, 0x5b6b8c][i], 7.2 + i * 0.7, 0.66 + i * 0.7, -13.4, { can: false }); }
  hop(2.6, 2.2, 0.1, 0x8a7a64, 8, 0, -13.85, { be: "kim" });
  // bàn điều phối sự kiện của Chị Đại: giữa kho, quay mặt ra cửa
  banDon(scene, 8, -9.45, 1.6, 0.8, 0x7a5a3a, 0, vat[0]); manHinh(scene, 8.15, 0.76, -9.3, Math.PI, denDem, "chart2");
  hop(0.46, 0.022, 0.15, 0x2a2a2a, 8, 0.76, -9.68, { can: false }); hop(0.06, 0.022, 0.1, 0x2a2a2a, 8.36, 0.76, -9.68, { can: false }); // bàn phím, chuột
  gheXoay(scene, CHO_NGOI.chi_dai, vat[0], { mau: 0x7d1424 });
  // IT: ghế xoay trước bàn laptop (bàn dựng trong noi-that.js)
  gheXoay(scene, CHO_NGOI.it, vat[0], { mau: 0x2a2c31, tayVin: false });
  // Toilet: dựng chi tiết trong noi-that.js (buồng, bồn cầu, bồn tiểu, lavabo, gương)

  // ---- Tầng 2 ----
  tuong(-20, -4, 20, -4, 1, [[-15, -13], [-5, -3], [5, 7], [15, 17]], trong);
  for (const x of [-8, 0, 12]) tuong(x, -14, x, -4, 1, [], trong);
  tuong(-20, 2, 20, 2, 1, [[-14, -12], [-3, -1], [2.5, 7.5], [13, 15]], trong);
  for (const x of [-6, 2, 8]) tuong(x, 2, x, 14, 1, [], trong);
  const y2 = Y(1);
  // Giám đốc: bàn gỗ lớn, ghế da lưng cao sau bàn, nhìn ra cửa phòng
  hop(3.2, 0.8, 1.4, 0x5a3d2a, -14, y2, -10.6, { tang: 1, be: "go" });
  // sàn gỗ phòng phó giám đốc (phòng giám đốc lát gỗ trong trang-tri.js)
  hop(7.6, 0.006, 9.6, 0xa87a50, -4, y2, -9, { tang: 1, can: false, be: "go_san" });
  gheGiamDoc(scene, CHO_NGOI.giam_doc, vat[1], 0x241a16);
  hop(4, 2.4, 0.5, 0x6b4a2f, -14, y2, -13.6, { tang: 1, be: "go" }); logoG(scene, -14, y2 + 3.1, -13.8);
  hop(2.4, 0.5, 1, 0x22305a, -18, y2, -6.5, { tang: 1, be: "da" });
  // Phó giám đốc (ghế trống mà ai cũng nhắm tới)
  hop(2.4, 0.75, 1.2, 0x8a6a4a, -4, y2, -10.6, { tang: 1, be: "go" });
  gheGiamDoc(scene, GHE_LE[0], vat[1], 0xd8642a);
  // Phòng họp
  hop(7, 0.75, 2.2, 0xd6cbb6, 6, y2, -9, { tang: 1, be: "go" });
  for (let i = 0; i < 4; i++) for (const z of [-10.6, -7.4]) hop(0.6, 0.5, 0.6, 0x3a3d44, 3.6 + i * 1.6, y2, z, { tang: 1, be: "vai" });
  bangTrang(scene, 6, y2 + 1.4, -13.85, 0);
  // Phòng nghệ sĩ
  // sofa tím có tựa lưng, tay vịn (chỗ quản lý ngồi gọi điện)
  hop(2.8, 0.38, 1, 0x7b4bb3, 16, y2, -12.8, { tang: 1, be: "vai" }); hop(2.5, 0.12, 0.8, 0x8d5fc4, 16, y2 + 0.38, -12.7, { tang: 1, can: false, be: "vai" });
  hop(2.8, 0.5, 0.22, 0x6a3fa0, 16, y2 + 0.38, -13.19, { tang: 1, can: false, be: "vai" });
  for (const dx of [-1.29, 1.29]) hop(0.22, 0.3, 1, 0x6a3fa0, 16 + dx, y2 + 0.38, -12.8, { tang: 1, can: false, be: "vai" });
  // bàn trang điểm sát tường, gương (viền bóng đèn dựng trong noi-that.js), ghế đạo diễn của Phát
  hop(0.46, 0.75, 1.3, 0xf2e6c8, 19.64, y2, -8.95, { tang: 1, be: "go" }); hop(0.03, 1.12, 1.36, 0xc9dbe6, 19.86, y2 + 0.84, -9.0, { tang: 1, can: false, be: "kinh" });
  gheDaoDien(scene, CHO_NGOI.idol_het_thoi, vat[1]);
  // Hành lang tầng 2: bàn trợ lý
  hop(2.2, 0.75, 0.9, 0xf5b9cf, -10.8, y2, -0.6, { tang: 1, be: "son_bong" }); manHinh(scene, -10.6, y2 + 0.75, -0.82, 0, denDem, "mac_dinh");
  hop(0.46, 0.022, 0.15, 0xf6f6f2, -10.75, y2 + 0.75, -0.36, { tang: 1, can: false }); hop(0.06, 0.022, 0.1, 0xf26fa6, -11.12, y2 + 0.75, -0.36, { tang: 1, can: false }); // bàn phím trắng, chuột hồng
  gheXoay(scene, CHO_NGOI.thanh_ninh, vat[1], { mau: 0xf26fa6 });
  // Studio
  const phong = new THREE.Mesh(new THREE.PlaneGeometry(10, 3.4), vl(0xf7a8c8)); phong.position.set(-13, y2 + 1.7, 13.8); phong.rotation.y = Math.PI; scene.add(phong);
  const vong = new THREE.Mesh(new THREE.TorusGeometry(0.45, 0.06, 6, 16), new THREE.MeshBasicMaterial({ color: 0xfff5e0 })); vong.position.set(-10.5, y2 + 1.7, 11); scene.add(vong);
  hop(0.12, 1.5, 0.12, 0x222222, -10.5, y2, 11, { tang: 1 }); hop(0.4, 0.3, 0.5, 0x111111, -13, y2 + 1.3, 6, { tang: 1, can: false }); hop(0.1, 1.3, 0.1, 0x222222, -13, y2, 6, { tang: 1 });
  gheBanh(scene, CHO_NGOI.sieu_nhan_hong, vat[1], 0xf26fa6);
  // Dựng phim
  hop(3.4, 0.75, 1.2, 0x2a2c31, -2, y2, 11.2, { tang: 1, be: "go" }); for (const dx of [-1, 0, 1]) manHinh(scene, -2 + dx, y2 + 0.75, 11.45, Math.PI, denDem, ["edit_mau", "edit_timeline", "edit_render"][dx + 1]);
  gheXoay(scene, CHO_NGOI.editor, vat[1], { mau: 0x1c1c1f, vien: 0xe8702a, lungCao: 0.82, tuaDau: true }); // ghế gaming của cú đêm
  // Sản xuất
  hop(3, 0.75, 1.2, 0xd8c7a3, 14, y2, 10.6, { tang: 1, be: "go" }); manHinh(scene, 14, y2 + 0.75, 10.85, Math.PI, denDem, "truong_phong"); gheXoay(scene, CHO_NGOI.truong_phong, vat[1], { mau: 0x5b6b8c }); bangTrang(scene, 19.85, y2 + 1.4, 8, -Math.PI / 2);
  // Chiếu nghỉ: cầu thang xuống và lên sân thượng
  for (let i = 0; i < 4; i++) hop(2.4, 0.2 + i * 0.25, 0.5, i % 2 ? 0xd9b48a : 0xcfa87c, 5, y2, 3.2 + i * 0.5, { tang: 1, can: false, be: "go" });
  for (let i = 0; i < 6; i++) hop(2, 0.3 + i * 0.55, 0.5, i % 2 ? 0xd9b48a : 0xcfa87c, 5, y2, 13.6 - i * 0.05, { tang: 1, can: false, be: "go" });
  hop(2.6, 0.3, 0.3, 0xbfb6a4, 5, y2, 13.75, { tang: 1 });
  // Sân thượng
  const y3 = Y(2);
  hop(3, 2.6, 2.4, 0xd9d2c4, 5, y3, 12.4, { tang: 2, be: "vua" }); // buồng cầu thang
  hop(1.4, 1.2, 1.4, 0x9aa3ab, -12, y3, -8, { tang: 2, be: "kim" }); hop(1.4, 1.2, 1.4, 0x9aa3ab, -9, y3, -8, { tang: 2, be: "kim" }); // cục nóng điều hòa
  for (let i = 0; i < 4; i++) { const d = new THREE.Mesh(new THREE.SphereGeometry(0.15, 6, 4), VL_DEN_TRAN); d.position.set(-6 + i * 4, y3 + 2.2, 4); scene.add(d); denDem.push(d); }
  hop(0.06, 2.2, 0.06, 0x555555, -6, y3, 4, { tang: 2, can: false }); hop(0.06, 2.2, 0.06, 0x555555, 6, y3, 4, { tang: 2, can: false });
  hop(12, 0.015, 0.015, 0x333333, 0, y3 + 2.18, 4, { tang: 2, can: false }); // dây treo bóng đèn giữa hai cột

  // Đèn trần (bật buổi tối)
  for (const t of [0, 1]) for (let x = -15; x <= 15; x += 10) for (const z of [-9, 6]) {
    const d = new THREE.Mesh(new THREE.BoxGeometry(1.4, 0.06, 0.4), VL_DEN_TRAN);
    d.position.set(x, Y(t) + TUONG_CAO - 0.05, z); scene.add(d); denDem.push(d);
  }
  const truocNoiThat = scene.children.length;
  themNoiThat(scene, hop, CAO_TANG, denDem);
  trangTriCongTy(scene, hop, CAO_TANG, denDem);
  themChiTietCongTy(scene, hop, vat, { banChung: BAN_CHUNG.map((b, i) => ({ ...b, chu: CHU_BAN[i] })) });
  // đồ nội thất dựng rời (tủ, ghế, cây, máy in...) cũng có khối va chạm theo đúng kích thước của nó
  const hopBao = new THREE.Box3(), kt = new THREE.Vector3();
  for (const o of scene.children.slice(truocNoiThat)) {
    if (o.isLight || o.isSprite || o.userData.khongCan) continue;
    hopBao.setFromObject(o); if (hopBao.isEmpty()) continue;
    hopBao.getSize(kt);
    const tang = Math.max(0, Math.min(2, Math.floor((hopBao.min.y + 0.05) / CAO_TANG)));
    const day = hopBao.min.y - tang * CAO_TANG;
    if (day > 0.6 || kt.y < 0.35) continue;          // đồ treo cao, đồ nhỏ trên bàn, thảm
    if (Math.min(kt.x, kt.z) < 0.06) continue;        // tranh, bảng dán tường
    if (kt.x > 12 || kt.z > 12) continue;              // sàn, mảng lớn đã có va chạm riêng
    vat[tang].push({ minX: hopBao.min.x, maxX: hopBao.max.x, minZ: hopBao.min.z, maxZ: hopBao.max.z, noiThat: true });
  }
  for (const l of nhapNhay) l.userData.rieng = true;
  coSan.dung(scene);
  gopKhoi(scene, { deQuy: true, vatLieu: true, o: 40 });
  return { vat, denDem, nhapNhay, pho, nhom: scene };
}

const dong = m => { m.userData.dong = true; return m; };
const BE_VAT = new Set(["go", "vai", "da", "nhua", "son_bong", "kim"]);
const VL_DEN_TRAN = new THREE.MeshBasicMaterial({ color: 0xfff6dd }); VL_DEN_TRAN.userData.dong = true;


// ---------- Đồ vật nhỏ ----------
function banLamViec(scene, x, z, vat, denDem, chu) {
  const add = (w, h, d, c, px, py, pz) => { const m = new THREE.Mesh(hinhHopNoi(w, h, d), vl(c)); m.position.set(px, py + h / 2, pz); scene.add(m); return m; };
  add(2, 0.06, 1, 0xd9cdb5, x, 0.72, z).userData.be = "go";
  add(0.08, 0.72, 0.9, 0x8a8478, x - 0.95, 0, z).userData.be = "kim"; add(0.08, 0.72, 0.9, 0x8a8478, x + 0.95, 0, z).userData.be = "kim";
  add(0.55, 0.06, 0.55, 0x3a3d44, x, 0.45, z + 0.9).userData.be = "vai"; add(0.55, 0.6, 0.08, 0x3a3d44, x, 0.5, z + 1.15).userData.be = "vai"; add(0.08, 0.45, 0.08, 0x222222, x, 0, z + 0.9).userData.be = "kim";
  manHinh(scene, x, 0.78, z - 0.25, 0, denDem, chu);
  add(0.5, 0.03, 0.18, 0x2a2a2a, x, 0.78, z + 0.15);
  vat.push({ minX: x - 1, maxX: x + 1, minZ: z - 0.5, maxZ: z + 0.5 });
}
// ---------- Bàn, ghế ngồi được ----------
// Mọi ghế quay theo cho.huong (người ngồi nhìn về +z cục bộ), mặt đệm cao 0,51 m để khớp dáng ngồi (thân hạ 0,36 m).
// Khối va chạm nhỏ cỡ chân ghế: người chơi không đi xuyên ghế, lưới tìm đường của đồng nghiệp cũng tránh.
function nhomGhe(scene, cho, vatTang, r = 0.27) {
  const g = new THREE.Group(); g.position.set(cho.x, cho.tang * CAO_TANG, cho.z); g.rotation.y = cho.huong ?? 0; scene.add(g);
  vatTang.push({ minX: cho.x - r, maxX: cho.x + r, minZ: cho.z - r, maxZ: cho.z + r, ghe: true });
  const add = (geo, m, x, y, z, rx = 0, ry = 0, rz = 0, cha = g) => { const o = new THREE.Mesh(geo, m); o.position.set(x, y, z); o.rotation.set(rx, ry, rz); cha.add(o); return o; };
  const hop = (w, h, d, m, x, y, z, rx = 0, cha = g) => add(hinhHopNoi(w, h, d), m, x, y + h / 2, z, rx, 0, 0, cha); // y: đáy khối (đệm, lưng bo tròn)
  const tru = (r1, r2, h, m, x, y, z, rx = 0, rz = 0, seg = 8, cha = g) => // y: tâm trụ
    add(new THREE.CylinderGeometry(r1, r2, h, seg), m, x, y, z, rx, 0, rz, cha);
  return { g, add, hop, tru };
}
// hộp nội thất: đệm, lưng ghế bo mềm hơn hộp thường (khối nhỏ vẫn vát nhẹ); máy yếu: hộp thường
function hinhHopNoi(w, h, d) {
  if (!memBat("hop")) return new THREE.BoxGeometry(w, h, d);
  const m = Math.min(w, h, d);
  return m < 0.02 ? new THREE.BoxGeometry(w, h, d) : hinhVat(w, h, d, Math.min(m * 0.32, 0.05));
}
const VL_KIM = () => vlBe("crom", 0xa9aeb4), VL_NHUA_DEN = () => vlBe("nhua", 0x1c1c1f);
// da bóng nhẹ (ghế giám đốc): vật liệu riêng theo màu, dùng chung giữa các ghế cùng màu
const VL_DA = new Map();
function vlDa(mau) {
  if (!VL_DA.has(mau)) VL_DA.set(mau, MUC ? vlBe("da", mau) : new THREE.MeshPhongMaterial({ color: mau, specular: 0x3a3430, shininess: 38, flatShading: true }));
  return VL_DA.get(mau);
}
// chân sao 5 cánh có bánh xe, trụ hơi, mâm ghế (dùng cho ghế xoay và ghế giám đốc)
function chanSao(G, rCanh = 0.3, kim = true) {
  const M = kim ? VL_KIM() : VL_NHUA_DEN();
  for (let i = 0; i < 5; i++) {
    const a = i * Math.PI * 2 / 5 + Math.PI / 5; // không có cánh chĩa thẳng ra trước (chân người ngồi)
    G.add(new THREE.BoxGeometry(0.05, 0.035, rCanh), M, Math.sin(a) * rCanh / 2, 0.085, Math.cos(a) * rCanh / 2, 0, a, 0);
    G.tru(0.012, 0.012, 0.05, M, Math.sin(a) * (rCanh - 0.01), 0.065, Math.cos(a) * (rCanh - 0.01), 0, 0, 6);
    G.add(new THREE.CylinderGeometry(0.032, 0.032, 0.035, 8), VL_NHUA_DEN(), Math.sin(a) * (rCanh - 0.01), 0.032, Math.cos(a) * (rCanh - 0.01), 0, a, Math.PI / 2);
  }
  G.tru(0.06, 0.07, 0.05, M, 0, 0.09, 0, 0, 0, 10);
  G.tru(0.03, 0.03, 0.26, VL_NHUA_DEN(), 0, 0.22, 0, 0, 0, 8);   // trụ hơi
  G.tru(0.038, 0.038, 0.1, M, 0, 0.3, 0, 0, 0, 8);
  G.hop(0.24, 0.04, 0.24, VL_NHUA_DEN(), 0, 0.36, 0);            // mâm ghế
}
// Ghế xoay văn phòng: đệm vải, lưng lưới hơi ngả, tay vịn; tùy chọn viền màu và gối đầu (ghế gaming)
function gheXoay(scene, cho, vatTang, { mau = 0x3a3d44, vien = null, lungCao = 0.58, tayVin = true, tuaDau = false } = {}) {
  const G = nhomGhe(scene, cho, vatTang), V = vlBe("vai", mau), D = VL_NHUA_DEN();
  chanSao(G, 0.3, false);
  G.hop(0.5, 0.08, 0.48, V, 0, 0.43, 0.01);          // đệm ngồi: mặt trên 0,51
  G.hop(0.46, 0.03, 0.08, V, 0, 0.465, 0.235, 0.3);  // mép trước bo xuống
  // cần nối lưng + tấm lưng ngả 8°
  G.hop(0.06, 0.24, 0.04, D, 0, 0.4, -0.26);
  const lung = new THREE.Group(); lung.position.set(0, 0.56, -0.27); lung.rotation.x = -0.14; G.g.add(lung);
  G.hop(0.46, lungCao, 0.06, V, 0, 0, 0, 0, lung);
  G.hop(0.4, 0.12, 0.03, vien != null ? vl(vien) : V, 0, 0.08, 0.035, 0, lung); // gối đỡ thắt lưng
  if (vien != null) for (const s of [-1, 1]) G.hop(0.05, lungCao, 0.08, vl(vien), s * 0.235, 0, 0.005, 0, lung);
  if (tuaDau) { G.hop(0.32, 0.16, 0.08, V, 0, lungCao - 0.02, 0.0, 0, lung); G.hop(0.26, 0.08, 0.03, vien != null ? vl(vien) : V, 0, lungCao + 0.02, 0.04, 0, lung); }
  if (tayVin) for (const s of [-1, 1]) {
    G.hop(0.035, 0.2, 0.04, D, s * 0.25, 0.44, -0.04);
    G.hop(0.06, 0.03, 0.26, D, s * 0.25, 0.64, 0.0);
  }
  return G.g;
}
// Ghế giám đốc: da bọc dày, lưng cao có gối đầu, may chần ngang, tay vịn bọc da trên khung kim loại, chân sao mạ crôm
function gheGiamDoc(scene, cho, vatTang, mau) {
  const G = nhomGhe(scene, cho, vatTang, 0.3), DA = vlDa(mau), CHI = vl(new THREE.Color(mau).multiplyScalar(0.6).getHex()), K = VL_KIM();
  chanSao(G, 0.34, true);
  G.hop(0.58, 0.13, 0.54, DA, 0, 0.38, 0.01);                  // đệm ngồi dày, mặt trên 0,51
  G.tru(0.065, 0.065, 0.56, DA, 0, 0.445, 0.26, 0, Math.PI / 2, 10); // mép trước cuộn tròn
  for (const dz of [-0.1, 0.08]) G.hop(0.5, 0.006, 0.012, CHI, 0, 0.511, dz);
  G.hop(0.08, 0.25, 0.05, K, 0, 0.42, -0.29);                  // khung nối lưng
  const lung = new THREE.Group(); lung.position.set(0, 0.55, -0.3); lung.rotation.x = -0.16; G.g.add(lung);
  G.hop(0.58, 0.72, 0.13, DA, 0, 0, 0, 0, lung);
  for (const s of [-1, 1]) G.hop(0.07, 0.68, 0.17, DA, s * 0.27, 0.02, 0.02, 0, lung); // hai bên lưng ôm người
  for (let i = 0; i < 4; i++) G.hop(0.44, 0.012, 0.012, CHI, 0, 0.14 + i * 0.15, 0.068, 0, lung); // đường chần
  G.hop(0.44, 0.2, 0.14, DA, 0, 0.74, 0.01, 0, lung);         // gối đầu
  G.hop(0.36, 0.012, 0.012, CHI, 0, 0.83, 0.083, 0, lung);
  for (const s of [-1, 1]) {
    G.hop(0.04, 0.18, 0.05, K, s * 0.31, 0.45, 0.1); G.hop(0.04, 0.05, 0.3, K, s * 0.31, 0.6, -0.04);
    G.hop(0.08, 0.05, 0.36, DA, s * 0.31, 0.64, -0.02);       // tay vịn bọc da
  }
  return G.g;
}
// Ghế đạo diễn (phòng nghệ sĩ): khung gỗ chân chéo, mặt và lưng vải bố, tên in sau lưng
function gheDaoDien(scene, cho, vatTang) {
  const G = nhomGhe(scene, cho, vatTang), GO = vlBe("go", 0x8a5a32), VAI = vlBe("vai", 0x3a1d5a), VAN = vl(0xd8b45a);
  for (const s of [-1, 1]) {
    for (const r of [-1, 1]) G.hop(0.035, 0.6, 0.035, GO, s * 0.26, -0.03, 0, r * 0.62);   // chân chéo
    G.hop(0.04, 0.04, 0.48, GO, s * 0.26, 0.01, 0); G.hop(0.04, 0.04, 0.5, GO, s * 0.26, 0.47, 0);
    G.hop(0.06, 0.04, 0.46, GO, s * 0.26, 0.7, 0.01);                                       // tay vịn
    G.hop(0.035, 0.7, 0.035, GO, s * 0.26, 0.45, -0.23);                                    // trụ lưng
  }
  G.hop(0.5, 0.025, 0.44, VAI, 0, 0.485, 0);                                                 // mặt vải: trên 0,51
  G.hop(0.52, 0.24, 0.02, VAI, 0, 0.9, -0.235); G.hop(0.36, 0.05, 0.005, VAN, 0, 0.92, -0.247); // lưng vải, chữ vàng
  return G.g;
}
// Ghế bành bọc nỉ (studio): khối đệm dày, lưng cong ba mảng, tay vịn tròn
function gheBanh(scene, cho, vatTang, mau) {
  const G = nhomGhe(scene, cho, vatTang, 0.36), V = vlBe("vai", mau), DAM = vlBe("vai", new THREE.Color(mau).multiplyScalar(0.78).getHex());
  for (const [x, z] of [[-0.28, -0.26], [0.28, -0.26], [-0.28, 0.26], [0.28, 0.26]]) G.tru(0.025, 0.018, 0.12, vl(0xd8b45a), x, 0.06, z, 0, 0, 6);
  G.hop(0.74, 0.29, 0.66, DAM, 0, 0.12, 0);
  G.hop(0.54, 0.1, 0.56, V, 0, 0.41, 0.04);                                                   // nệm ngồi: trên 0,51
  G.hop(0.62, 0.55, 0.16, DAM, 0, 0.41, -0.27, -0.12);                                        // lưng
  for (const s of [-1, 1]) { G.tru(0.07, 0.07, 0.6, V, s * 0.31, 0.6, 0.03, Math.PI / 2, 0, 10); G.hop(0.12, 0.19, 0.6, DAM, s * 0.31, 0.41, 0.03); }
  G.hop(0.5, 0.36, 0.1, V, 0, 0.5, -0.15, -0.12);                                            // gối tựa
  return G.g;
}
// Ghế nhựa đỏ có tựa lưng (bác bảo vệ): mặt 0,45 m, chân loe
function gheNhuaTua(scene, cho, vatTang) {
  const G = nhomGhe(scene, cho, vatTang, 0.25), N = vlBe("nhua", 0xc0262d);
  for (const [x, z] of [[-0.19, -0.18], [0.19, -0.18], [-0.19, 0.18], [0.19, 0.18]]) G.hop(0.045, 0.42, 0.045, N, x, 0, z, z > 0 ? 0.08 : -0.08);
  G.hop(0.44, 0.035, 0.42, N, 0, 0.41, 0);
  G.hop(0.42, 0.36, 0.03, N, 0, 0.48, -0.22, -0.12); G.hop(0.3, 0.05, 0.035, vl(0x9a1c22), 0, 0.72, -0.25, -0.12);
  return G.g;
}
// bàn làm việc đơn: mặt gỗ, hai hộc chân, tấm che chân phía trước (người ngồi phía -z cục bộ khi quay = 0)
function banDon(scene, x, z, w, d, mau, tang, vatTang) {
  const y = tang * CAO_TANG;
  const add = (bw, bh, bd, c, px, py, pz) => { const m = new THREE.Mesh(hinhHopNoi(bw, bh, bd), vlBe(c === 0xc9ccd0 ? "crom" : "go", c)); m.position.set(px, y + py + bh / 2, pz); scene.add(m); };
  add(w, 0.04, d, mau, x, 0.72, z);
  add(0.04, 0.72, d - 0.04, 0x6b5a48, x - w / 2 + 0.03, 0, z); add(0.4, 0.72, d - 0.04, 0x6b5a48, x + w / 2 - 0.22, 0, z);
  add(w - 0.06, 0.4, 0.03, 0x6b5a48, x, 0.3, z + d / 2 - 0.05);
  for (let i = 0; i < 3; i++) add(0.12, 0.02, 0.02, 0xc9ccd0, x + w / 2 - 0.22, 0.12 + i * 0.22, z - d / 2 + 0.005);
  vatTang.push({ minX: x - w / 2, maxX: x + w / 2, minZ: z - d / 2, maxZ: z + d / 2 });
}
// màn hình máy tính: nội dung theo việc của chủ bàn (ảnh ghép chung, không chịu ánh sáng nên luôn sáng)
function manHinh(scene, x, y, z, rotY, denDem, noiDung = "mac_dinh") {
  const g = new THREE.Group(); g.position.set(x, y, z); g.rotation.y = rotY;
  const M = memBat("nho");
  // màn hình viền mỏng bo góc, lưng hơi dày ở giữa, chân trụ tròn đế bầu dục (máy yếu: hộp cũ)
  const v = new THREE.Mesh(M ? hinhVat(0.7, 0.42, 0.04, 0.014) : new THREE.BoxGeometry(0.7, 0.42, 0.04), vlBe("nhua", 0x1a1b1f)); v.position.y = 0.35; g.add(v);
  if (M) { const l = new THREE.Mesh(hinhVat(0.4, 0.24, 0.03, 0.012), vlBe("nhua", 0x24252a)); l.position.set(0, 0.34, -0.03); g.add(l); }
  const mh = manHinhPhang(0.64, 0.36, noiDung); mh.position.set(0, 0.35, 0.025); g.add(mh);
  const c = new THREE.Mesh(M ? hinhTru(0.026, 0.022, 0.15, 8) : new THREE.BoxGeometry(0.06, 0.15, 0.06), vl(0x1a1b1f)); c.position.set(0, 0.07, M ? -0.03 : -0.01); g.add(c);
  const de = new THREE.Mesh(M ? hinhTru(0.11, 0.12, 0.015, 12) : new THREE.BoxGeometry(0.24, 0.015, 0.17), vl(0x1a1b1f)); de.position.set(0, 0.0075, -0.01); if (M) de.scale.set(1, 1, 0.7); g.add(de);
  scene.add(g);
}
function chauCay(scene, x, z, vat) {
  if (memBat("cau")) {
    dungChauCay(scene, x, 0, z, { rTren: 0.25, rDuoi: 0.2, cao: 0.45, mauChau: 0xb5653a, rLa: 0.45, yLa: 0.85, mauLa: 0x4f8650, hat: (x * 0.31 + z * 0.17) % 1 });
    vat.push({ minX: x - 0.3, maxX: x + 0.3, minZ: z - 0.3, maxZ: z + 0.3 });
    return;
  }
  const c = new THREE.Mesh(new THREE.CylinderGeometry(0.25, 0.2, 0.45, 6), vl(0xb5653a)); c.position.set(x, 0.22, z); scene.add(c);
  const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.45, 0), vl(0x4f8a3c)); l.position.set(x, 0.85, z); scene.add(l);
  vat.push({ minX: x - 0.3, maxX: x + 0.3, minZ: z - 0.3, maxZ: z + 0.3 });
}
function bangTrang(scene, x, y, z, rotY) {
  const m = new THREE.Mesh(new THREE.BoxGeometry(2.4, 1.2, 0.05), vlBe("son_bong", 0xfafafa)); m.position.set(x, y, z); m.rotation.y = rotY; scene.add(m);
}
function xeMay(scene, x, z, vat) {
  if (memBat("xe")) { // xe máy thật (cùng mẫu với ngoài phố), thu nhỏ chút cho gọn trong khối va chạm cũ
    const m = taoXeMay([0xc0262d, 0x2a5aa8, 0x222222, 0xe8e8e8][Math.floor(Math.abs(x * 7) % 4)], Math.floor(x * 3) % 2 ? "ga" : "so");
    m.position.set(x, 0, z); m.scale.setScalar(0.82); scene.add(m);
    vat[0].push({ minX: x - 0.25, maxX: x + 0.25, minZ: z - 0.8, maxZ: z + 0.8 });
    return;
  }
  const mau = [0xc0262d, 0x2a5aa8, 0x222222, 0xe8e8e8][Math.floor(Math.abs(x * 7) % 4)];
  const add = (w, h, d, c, py, pz = 0, be = null) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), be ? vlBe(be, c) : vl(c)); m.position.set(x, py, z + pz); scene.add(m); };
  add(0.3, 0.35, 1.4, mau, 0.55, 0, "son_xe"); add(0.32, 0.12, 0.6, 0x1a1a1a, 0.8, -0.2, "da");
  for (const pz of [-0.55, 0.55]) { const b = new THREE.Mesh(new THREE.CylinderGeometry(0.28, 0.28, 0.1, 8), vlBe("cao_su", 0x1a1a1a)); b.rotation.z = Math.PI / 2; b.position.set(x, 0.28, z + pz); scene.add(b); }
  vat[0].push({ minX: x - 0.25, maxX: x + 0.25, minZ: z - 0.8, maxZ: z + 0.8 });
}
function logoG(scene, x, y, z) {
  const c = document.createElement("canvas"); c.width = c.height = 256;
  const g = c.getContext("2d");
  const mau = ["#e74c3c", "#e8702a", "#f1c40f", "#2ecc71", "#3498db", "#3f51b5", "#9b59b6"];
  mau.forEach((m, i) => { g.strokeStyle = m; g.lineWidth = 14; g.beginPath(); g.arc(128, 128, 100 - i * 12, 0.25 * Math.PI, 1.95 * Math.PI); g.stroke(); });
  g.fillStyle = "#e8702a"; g.fillRect(128, 120, 100, 16);
  const tex = new THREE.CanvasTexture(c); tex.colorSpace = THREE.SRGBColorSpace;
  const m = new THREE.Mesh(new THREE.PlaneGeometry(1.4, 1.4), new THREE.MeshBasicMaterial({ map: tex, transparent: true }));
  m.position.set(x, y, z); scene.add(m);
}
function taoBienHieu() {
  // 13 x 2 m: nền cam chuyển màu, viền trắng, logo cầu vồng bên trái, chữ trắng có bóng đổ
  const W = 2048, H = 316;
  const c = document.createElement("canvas"); c.width = W; c.height = H;
  const g = c.getContext("2d");
  const nen = g.createLinearGradient(0, 0, 0, H); nen.addColorStop(0, "#ff8a3d"); nen.addColorStop(1, "#d9561a");
  g.fillStyle = nen; g.fillRect(0, 0, W, H);
  g.strokeStyle = "#fff"; g.lineWidth = 12; g.beginPath(); g.roundRect(18, 18, W - 36, H - 36, 26); g.stroke();
  // logo G cầu vồng
  const mau = ["#e74c3c", "#ffb03a", "#f1c40f", "#2ecc71", "#3498db", "#9b59b6"];
  const lx = 190, ly = H / 2;
  g.fillStyle = "#fff"; g.beginPath(); g.arc(lx, ly, 112, 0, Math.PI * 2); g.fill();
  mau.forEach((m, i) => { g.strokeStyle = m; g.lineWidth = 13; g.beginPath(); g.arc(lx, ly, 92 - i * 13, 0.25 * Math.PI, 1.95 * Math.PI); g.stroke(); });
  g.fillStyle = "#e8702a"; g.fillRect(lx, ly - 8, 92, 16);
  // chữ
  g.font = "800 176px 'Baloo 2', system-ui, sans-serif"; g.textAlign = "center"; g.textBaseline = "middle";
  const cx = (lx + 130 + W - 40) / 2, wMax = W - lx - 220;
  g.fillStyle = "rgba(90,30,0,.45)"; g.fillText("G-ENTERTAINMENT", cx + 7, H / 2 + 14, wMax);
  g.fillStyle = "#fff"; g.fillText("G-ENTERTAINMENT", cx, H / 2 + 6, wMax);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4; return t;
}
function taoVanCuaSo() {
  const c = document.createElement("canvas"); c.width = c.height = 64;
  const g = c.getContext("2d"); g.fillStyle = "#fff"; g.fillRect(0, 0, 64, 64);
  g.fillStyle = "#7fa9c4"; for (let i = 0; i < 2; i++) for (let j = 0; j < 2; j++) g.fillRect(6 + i * 32, 6 + j * 32, 20, 22);
  const t = new THREE.CanvasTexture(c); t.wrapS = t.wrapT = THREE.RepeatWrapping; t.repeat.set(3, 5); t.colorSpace = THREE.SRGBColorSpace; return t;
}
