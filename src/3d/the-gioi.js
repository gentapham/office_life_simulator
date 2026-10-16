// Bản đồ 3D: tòa nhà G-Entertainment (tầng 1, tầng 2, sân thượng), sân trước, chòi bảo vệ, cổng, phố xung quanh.
// Tầng: 0 = tầng 1 và sân (y = 0), 1 = tầng 2 (y = 4), 2 = sân thượng (y = 8).
import * as THREE from "three";
import { gopKhoi } from "./gop-khoi.js";
import { vl } from "./nhan-vat-3d.js";
import { taoThanhPho } from "./thanh-pho.js";
import { themNoiThat } from "./noi-that.js";
import { trangTriCongTy } from "./trang-tri.js";

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
  { loai: "uong_nuoc", tang: 0, x: 7.8, z: 10.4, nhan: "Uống nước" },
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
const NGOI = b => ({ x: b.x, z: b.z + 0.95, huong: Math.PI, ngoi: true, ban: b });
export const CHO_NGOI = {
  ran_doc: { tang: 0, ...NGOI(BAN_CHUNG[0]) }, hong_hot: { tang: 0, ...NGOI(BAN_CHUNG[1]) }, chua_te_deadline: { tang: 0, ...NGOI(BAN_CHUNG[2]) },
  thuc_tap_sinh: { tang: 0, ...NGOI(BAN_CHUNG[3]) }, bien_kich: { tang: 0, ...NGOI(BAN_CHUNG[4]) }, designer: { tang: 0, ...NGOI(BAN_CHUNG[5]) },
  sales: { tang: 0, ...NGOI(BAN_CHUNG[6]) }, dan_dau_tu: { tang: 0, ...NGOI(BAN_CHUNG[7]) }, thanh_xin_nghi: { tang: 0, ...NGOI(BAN_CHUNG[8]) },
  con_ong_chau_cha: { tang: 0, ...NGOI(BAN_CHUNG[9]) },
  ke_toan: { tang: 0, x: -15, z: -11.4, ngoi: true }, hr: { tang: 0, x: -6, z: -11.5, ngoi: true }, it: { tang: 0, x: 1, z: -11.8 },
  chi_dai: { tang: 0, x: 8, z: -9 }, bac_bao_ve: { tang: 0, x: -5.4, z: 24.6, huong: 0.5 }, cho: { tang: 0, x: -3.6, z: 25.4, huong: 0.9 },
  giam_doc: { tang: 1, x: -12.2, z: -11.8 }, thanh_ninh: { tang: 1, x: -12, z: -1.6 }, truong_phong: { tang: 1, x: 14, z: 9.5 },
  editor: { tang: 1, x: -2, z: 10.2 }, idol_het_thoi: { tang: 1, x: 15, z: -8 }, quan_ly_idol: { tang: 1, x: 17.5, z: -10.5 },
  sieu_nhan_hong: { tang: 1, x: -13, z: 9.5 },
};

// Tag "noi" của cảnh -> khu trong bản đồ. Địa điểm ngoài công ty đi qua cổng.
export function khuCuaNoi(noi) {
  if (!noi || noi === true) return null;
  const n = String(noi);
  const co = re => re.test(n);
  if (co(/san_khau_dem_hong|san_khau_dai_nhac|quang_truong_hong/)) return "san_khau";
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
  const vat = { 0: [], 1: [], 2: [] };    // vật cản theo tầng: {minX,maxX,minZ,maxZ}
  const denDem = [];                       // đèn bật buổi tối
  const nhapNhay = [];                     // đèn LED nhấp nháy
  const Y = t => t * CAO_TANG;

  const hop = (w, h, d, color, x, y, z, { tang = 0, can = true, vatLieu } = {}) => {
    const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vatLieu || vl(color));
    m.position.set(x, y + h / 2, z);
    scene.add(m);
    if (can) vat[tang].push({ minX: x - w / 2, maxX: x + w / 2, minZ: z - d / 2, maxZ: z + d / 2 });
    return m;
  };

  // Tường thẳng có khe cửa. doors: [[tu, den], ...] theo trục chạy của tường
  const tuong = (x1, z1, x2, z2, tang, doors = [], color = 0xe9e3d6, cao = TUONG_CAO) => {
    const ngang = z1 === z2;
    const a = ngang ? Math.min(x1, x2) : Math.min(z1, z2), b = ngang ? Math.max(x1, x2) : Math.max(z1, z2);
    const doan = []; let dau = a;
    for (const [d1, d2] of [...doors].sort((p, q) => p[0] - q[0])) { if (d1 > dau) doan.push([dau, d1]); dau = d2; }
    if (dau < b) doan.push([dau, b]);
    const y = Y(tang);
    for (const [p, q] of doan) {
      const dai = q - p, giua = (p + q) / 2;
      if (ngang) hop(dai, cao, DAY, color, giua, y, z1, { tang }); else hop(DAY, cao, dai, color, x1, y, giua, { tang });
      if (cao > 2) vat[tang][vat[tang].length - 1].tuong = true; // camera góc nhìn thứ ba chỉ né tường
    }
    if (cao > 2.5) for (const [d1, d2] of doors) { // phần tường trên khung cửa (hàng rào thấp thì không có)
      const dai = d2 - d1, giua = (d1 + d2) / 2;
      if (ngang) hop(dai, cao - 2.4, DAY, color, giua, y + 2.4, z1, { tang, can: false }); else hop(DAY, cao - 2.4, dai, color, x1, y + 2.4, giua, { tang, can: false });
    }
  };

  // ---------- Phố phường xung quanh ----------
  const pho = taoThanhPho(scene, vat, denDem, { dienThoai });
  // sân công ty
  const san = new THREE.Mesh(new THREE.PlaneGeometry(48, 48), dong(new THREE.MeshLambertMaterial({ color: 0xc9c3b6 }))); san.rotation.x = -Math.PI / 2; san.position.set(0, -0.005, 6); scene.add(san);
  pho.matUot.push(san.material);
  const cay = (x, z, s = 1) => {
    const t = new THREE.Mesh(new THREE.CylinderGeometry(0.12 * s, 0.16 * s, 1.4 * s, 5), vl(0x6b4a2f)); t.position.set(x, 0.7 * s, z); scene.add(t);
    const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.9 * s, 0), vl(0x4f8a3c)); l.position.set(x, 1.9 * s, z); scene.add(l);
    vat[0].push({ minX: x - 0.3, maxX: x + 0.3, minZ: z - 0.3, maxZ: z + 0.3 });
  };
  [[-18, 18], [-14, 26], [16, 18], [20, 26], [-22, 22], [-22, -16], [22, -16], [-22, 4], [22, 4]].forEach(([x, z]) => cay(x, z, 1.1));

  // ---------- Hàng rào sân trước + cổng ----------
  const hangRao = (x1, z1, x2, z2, doors = []) => tuong(x1, z1, x2, z2, 0, doors, 0xd2cbbb, 1.4);
  hangRao(-24, -18, -24, 30); hangRao(24, -18, 24, 30); hangRao(-24, -18, 24, -18);
  hangRao(-24, 30, 24, 30, [[0, 4]]);
  hop(4, 1.6, 0.2, 0x3c3f46, 6.1, 0, 29.65); // cánh cổng đã kéo sang một bên: đi bộ ra phố được
  hop(0.6, 2.4, 0.6, 0xb9b2a3, -0.3, 0, 30); hop(0.6, 2.4, 0.6, 0xb9b2a3, 4.3, 0, 30);
  // Chòi bảo vệ
  hop(4, 2.6, 3.2, 0x5f87b8, -8, 0, 22);
  hop(4.4, 0.25, 3.6, 0x2f3c52, -8, 2.6, 22, { can: false });
  hop(2.2, 0.9, 0.06, 0x9fd3f2, -8, 1.1, 20.38, { can: false });
  hop(2.2, 0.9, 0.06, 0x9fd3f2, -8, 1.1, 23.62, { can: false }); // cửa sổ nhìn ra cổng
  // chỗ ngồi của bác bảo vệ: trước chòi, nhìn ra cổng
  hop(1, 0.75, 0.6, 0x7a5a3a, -6.9, 0, 24.6); // bàn trà
  const amTra = new THREE.Mesh(new THREE.SphereGeometry(0.12, 6, 4), vl(0xece6da)); amTra.position.set(-6.9, 0.85, 24.6); scene.add(amTra);
  // Bãi xe máy
  for (let i = 0; i < 6; i++) xeMay(scene, 10 + i * 1.6, 23 + (i % 2) * 0.3, vat);

  // ---------- Tòa nhà ----------
  const ngoai = 0xfdf7ec, trong = 0xf6f1e8; // sơn mới: kem sáng bên ngoài, trắng ngà bên trong
  for (const t of [0, 1]) {
    const y = Y(t);
    const san = hop(40, 0.2, 28, t === 0 ? 0xcfc6b4 : 0xd8cfbd, 0, y - 0.2, 0, { can: false });
    san.position.y = y - 0.1;
    // tường ngoài
    tuong(-20, -14, 20, -14, t, [], ngoai);
    tuong(-20, -14, -20, 14, t, [], ngoai);
    tuong(20, -14, 20, 14, t, [], ngoai);
    tuong(-20, 14, 20, 14, t, t === 0 ? [[0, 4]] : [], ngoai);
    // dải cửa kính
    for (const [x1, x2] of t === 0 ? [[-19, -1], [5, 19]] : [[-19, 19]]) {
      const kinh = new THREE.Mesh(new THREE.PlaneGeometry(x2 - x1, 1.3), new THREE.MeshLambertMaterial({ color: 0x9fd0ec, emissive: 0x16323f }));
      kinh.position.set((x1 + x2) / 2, y + 1.9, 14.14); scene.add(kinh);
      const k2 = kinh.clone(); k2.rotation.y = Math.PI; k2.position.z = 13.86; scene.add(k2);
    }
  }
  // trần tầng 2 / sàn sân thượng
  hop(40, 0.2, 28, 0xbdb3a1, 0, Y(2) - 0.2, 0, { tang: 2, can: false });
  // lan can sân thượng
  tuong(-20, -14, 20, -14, 2, [], 0xd9d2c4, 1.1); tuong(-20, 14, 20, 14, 2, [], 0xd9d2c4, 1.1);
  tuong(-20, -14, -20, 14, 2, [], 0xd9d2c4, 1.1); tuong(20, -14, 20, 14, 2, [], 0xd9d2c4, 1.1);
  // biển hiệu mặt tiền
  const bien = new THREE.Mesh(new THREE.PlaneGeometry(12, 2), new THREE.MeshBasicMaterial({ map: taoBienHieu(), transparent: true }));
  bien.position.set(2, 5.2, 14.2); scene.add(bien);
  // mái che cửa chính
  hop(6, 0.2, 2.4, 0xe8702a, 2, 2.9, 15.3, { can: false });

  // ---- Tầng 1 ----
  tuong(-20, -6, 20, -6, 0, [[-16, -14], [-7, -5], [0, 2], [7, 9], [15, 17]], trong);
  for (const x of [-10, -2, 4, 12]) tuong(x, -14, x, -6, 0, [], trong);
  tuong(-2, -2, -2, 14, 0, [[3, 8]], trong);
  tuong(9, -2, 9, 14, 0, [[3, 8]], trong);
  // Sảnh lễ tân
  hop(4, 1.1, 1, 0xe8702a, 2, 0, 8.5);
  hop(4.2, 0.08, 1.2, 0xf6f1e8, 2, 1.1, 8.5, { can: false });
  // vách logo sau quầy lễ tân (trước đây logo và đồng hồ treo lơ lửng giữa không trung)
  hop(4.2, TUONG_CAO, 0.2, 0x2fa39a, 2, 0, -1.97); logoG(scene, 2, 2.2, -1.85);
  hop(4.3, 0.12, 0.26, 0xe8702a, 2, 0.95, -1.97, { can: false });
  hop(3, 0.5, 1, 0x5b6b8c, 6.5, 0, 12); hop(3, 0.6, 0.25, 0x5b6b8c, 6.5, 0.5, 12.5, { can: false }); // sofa
  hop(1.2, 0.4, 0.6, 0x8a6a4a, 6.5, 0, 10.8);
  hop(0.6, 1.4, 0.5, 0x3a3d44, -0.8, 0, 12.8); // máy chấm công
  chauCay(scene, -1.2, 13, vat[0]); chauCay(scene, 8.2, 13, vat[0]);
  // Cầu thang (góc sảnh)
  for (let i = 0; i < 7; i++) hop(2.4, 0.3 + i * 0.5, 0.6, 0xbfb6a4, 6.5, 0, 2.1 - i * 0.6, { can: i > 1 });
  // Khu làm việc chung
  BAN_CHUNG.forEach((b, i) => banLamViec(scene, b.x, b.z, vat[0], denDem, i % 3 === 0));
  bangTrang(scene, -19.85, 1.4, 6, Math.PI / 2);
  // Pantry
  hop(8, 0.95, 1, 0xd9d2c4, 14.5, 0, 13); hop(1, 2, 0.9, 0xe8e8e8, 19.2, 0, 12.8); // quầy + tủ lạnh
  hop(1.2, 0.5, 0.6, 0x3a3d44, 12, 0.95, 13, { can: false }); // máy pha cà phê
  for (const [x, z] of [[12, 6], [16, 6]]) { hop(2, 0.75, 1.2, 0xb08a5a, x, 0, z); }
  chauCay(scene, 19, 0, vat[0]);
  // Phòng kế toán
  hop(3, 0.75, 1.2, 0x8a6a4a, -15, 0, -10.5); hop(0.5, 2.2, 3, 0x6b5a48, -19.4, 0, -10); manHinh(scene, -15, 0.75, -10.6, 0, denDem);
  // HR
  hop(2.6, 0.75, 1.2, 0x9ab0a0, -6, 0, -10.5); manHinh(scene, -6, 0.75, -10.6, 0, denDem); chauCay(scene, -3, -13, vat[0]);
  // Server
  for (let i = 0; i < 3; i++) { hop(0.9, 2.2, 1, 0x1d1f24, -0.6 + i * 1.3, 0, -13.2); for (let j = 0; j < 4; j++) { const led = new THREE.Mesh(new THREE.BoxGeometry(0.06, 0.06, 0.02), new THREE.MeshBasicMaterial({ color: j % 2 ? 0x3fe07a : 0x3fb8e0 })); led.position.set(-0.85 + i * 1.3 + j * 0.15, 1.6 - (j % 2) * 0.4, -12.69); scene.add(led); nhapNhay.push(led); } }
  // Kho sự kiện
  for (let i = 0; i < 3; i++) { hop(2.6, 0.06, 0.8, 0x8a7a64, 8, 0.6 + i * 0.7, -13.4, { can: false }); hop(0.6, 0.5, 0.5, [0xe8702a, 0xf26fa6, 0x5b6b8c][i], 7.2 + i * 0.7, 0.66 + i * 0.7, -13.4, { can: false }); }
  hop(2.6, 2.2, 0.1, 0x8a7a64, 8, 0, -13.85);
  // Toilet: dựng chi tiết trong noi-that.js (buồng, bồn cầu, bồn tiểu, lavabo, gương)

  // ---- Tầng 2 ----
  tuong(-20, -4, 20, -4, 1, [[-15, -13], [-5, -3], [5, 7], [15, 17]], trong);
  for (const x of [-8, 0, 12]) tuong(x, -14, x, -4, 1, [], trong);
  tuong(-20, 2, 20, 2, 1, [[-14, -12], [-3, -1], [2.5, 7.5], [13, 15]], trong);
  for (const x of [-6, 2, 8]) tuong(x, 2, x, 14, 1, [], trong);
  const y2 = Y(1);
  // Giám đốc
  hop(3.2, 0.8, 1.4, 0x5a3d2a, -14, y2, -10.6, { tang: 1 }); hop(0.8, 1.3, 0.8, 0x1d1f24, -14, y2, -12.2, { tang: 1 });
  hop(4, 2.4, 0.5, 0x6b4a2f, -14, y2, -13.6, { tang: 1 }); logoG(scene, -14, y2 + 3.1, -13.8);
  hop(2.4, 0.5, 1, 0x22305a, -18, y2, -6.5, { tang: 1 });
  // Phó giám đốc (ghế trống mà ai cũng nhắm tới)
  hop(2.4, 0.75, 1.2, 0x8a6a4a, -4, y2, -10.6, { tang: 1 }); hop(0.8, 1.3, 0.8, 0xe8702a, -4, y2, -12, { tang: 1 });
  // Phòng họp
  hop(7, 0.75, 2.2, 0xd6cbb6, 6, y2, -9, { tang: 1 });
  for (let i = 0; i < 4; i++) for (const z of [-10.6, -7.4]) hop(0.6, 0.5, 0.6, 0x3a3d44, 3.6 + i * 1.6, y2, z, { tang: 1 });
  bangTrang(scene, 6, y2 + 1.4, -13.85, 0);
  // Phòng nghệ sĩ
  hop(2.8, 0.5, 1, 0x7b4bb3, 16, y2, -12.8, { tang: 1 }); hop(1.4, 2, 0.1, 0xf2e6c8, 19.8, y2 + 0.3, -9, { tang: 1, can: false });
  // Hành lang tầng 2: bàn trợ lý
  hop(2.2, 0.75, 0.9, 0xf5b9cf, -12, y2, -0.6, { tang: 1 });
  // Studio
  const phong = new THREE.Mesh(new THREE.PlaneGeometry(10, 3.4), vl(0xf7a8c8)); phong.position.set(-13, y2 + 1.7, 13.8); phong.rotation.y = Math.PI; scene.add(phong);
  const vong = new THREE.Mesh(new THREE.TorusGeometry(0.45, 0.06, 6, 16), new THREE.MeshBasicMaterial({ color: 0xfff5e0 })); vong.position.set(-10.5, y2 + 1.7, 11); scene.add(vong);
  hop(0.12, 1.5, 0.12, 0x222222, -10.5, y2, 11, { tang: 1 }); hop(0.4, 0.3, 0.5, 0x111111, -13, y2 + 1.3, 6, { tang: 1, can: false }); hop(0.1, 1.3, 0.1, 0x222222, -13, y2, 6, { tang: 1 });
  // Dựng phim
  hop(3.4, 0.75, 1.2, 0x2a2c31, -2, y2, 11.2, { tang: 1 }); for (const dx of [-1, 0, 1]) manHinh(scene, -2 + dx, y2 + 0.75, 11.4, 0, denDem);
  // Sản xuất
  hop(3, 0.75, 1.2, 0xd8c7a3, 14, y2, 10.6, { tang: 1 }); manHinh(scene, 14, y2 + 0.75, 10.8, 0, denDem); bangTrang(scene, 19.85, y2 + 1.4, 8, -Math.PI / 2);
  // Chiếu nghỉ: cầu thang xuống và lên sân thượng
  for (let i = 0; i < 4; i++) hop(2.4, 0.2 + i * 0.25, 0.5, 0xbfb6a4, 5, y2, 3.2 + i * 0.5, { tang: 1, can: false });
  for (let i = 0; i < 6; i++) hop(2, 0.3 + i * 0.55, 0.5, 0xbfb6a4, 5, y2, 13.6 - i * 0.05, { tang: 1, can: false });
  hop(2.6, 0.3, 0.3, 0xbfb6a4, 5, y2, 13.75, { tang: 1 });
  // Sân thượng
  const y3 = Y(2);
  hop(3, 2.6, 2.4, 0xd9d2c4, 5, y3, 12.4, { tang: 2 }); // buồng cầu thang
  hop(1.4, 1.2, 1.4, 0x9aa3ab, -12, y3, -8, { tang: 2 }); hop(1.4, 1.2, 1.4, 0x9aa3ab, -9, y3, -8, { tang: 2 }); // cục nóng điều hòa
  for (let i = 0; i < 4; i++) { const d = new THREE.Mesh(new THREE.SphereGeometry(0.15, 6, 4), VL_DEN_TRAN); d.position.set(-6 + i * 4, y3 + 2.2, 4); scene.add(d); denDem.push(d); }
  hop(0.06, 2.2, 0.06, 0x555555, -6, y3, 4, { tang: 2, can: false }); hop(0.06, 2.2, 0.06, 0x555555, 6, y3, 4, { tang: 2, can: false });

  // Đèn trần (bật buổi tối)
  for (const t of [0, 1]) for (let x = -15; x <= 15; x += 10) for (const z of [-9, 6]) {
    const d = new THREE.Mesh(new THREE.BoxGeometry(1.4, 0.06, 0.4), VL_DEN_TRAN);
    d.position.set(x, Y(t) + TUONG_CAO - 0.05, z); scene.add(d); denDem.push(d);
  }
  const truocNoiThat = scene.children.length;
  themNoiThat(scene, hop, CAO_TANG, denDem);
  trangTriCongTy(scene, hop, CAO_TANG, denDem);
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
  gopKhoi(scene, { deQuy: true });
  return { vat, denDem, nhapNhay, pho };
}

const dong = m => { m.userData.dong = true; return m; };
const VL_DEN_TRAN = new THREE.MeshBasicMaterial({ color: 0xfff6dd }); VL_DEN_TRAN.userData.dong = true;


// ---------- Đồ vật nhỏ ----------
function banLamViec(scene, x, z, vat, denDem, coCay) {
  const add = (w, h, d, c, px, py, pz) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vl(c)); m.position.set(px, py + h / 2, pz); scene.add(m); return m; };
  add(2, 0.06, 1, 0xd9cdb5, x, 0.72, z);
  add(0.08, 0.72, 0.9, 0x8a8478, x - 0.95, 0, z); add(0.08, 0.72, 0.9, 0x8a8478, x + 0.95, 0, z);
  add(0.55, 0.06, 0.55, 0x3a3d44, x, 0.45, z + 0.9); add(0.55, 0.6, 0.08, 0x3a3d44, x, 0.5, z + 1.15); add(0.08, 0.45, 0.08, 0x222222, x, 0, z + 0.9);
  manHinh(scene, x, 0.78, z - 0.25, 0, denDem);
  add(0.5, 0.03, 0.18, 0x2a2a2a, x, 0.78, z + 0.15);
  if (coCay) { const c = new THREE.Mesh(new THREE.IcosahedronGeometry(0.16, 0), vl(0x5a9a48)); c.position.set(x + 0.75, 0.95, z - 0.3); scene.add(c); }
  vat.push({ minX: x - 1, maxX: x + 1, minZ: z - 0.5, maxZ: z + 0.5 });
}
function manHinh(scene, x, y, z, rotY, denDem) {
  const g = new THREE.Group(); g.position.set(x, y, z); g.rotation.y = rotY;
  const v = new THREE.Mesh(new THREE.BoxGeometry(0.7, 0.42, 0.04), vl(0x1a1b1f)); v.position.y = 0.35; g.add(v);
  const mh = new THREE.Mesh(new THREE.PlaneGeometry(0.64, 0.36), new THREE.MeshBasicMaterial({ color: 0x9fc6e8 })); mh.position.set(0, 0.35, 0.025); g.add(mh);
  const c = new THREE.Mesh(new THREE.BoxGeometry(0.06, 0.15, 0.06), vl(0x1a1b1f)); c.position.y = 0.07; g.add(c);
  scene.add(g);
}
function chauCay(scene, x, z, vat) {
  const c = new THREE.Mesh(new THREE.CylinderGeometry(0.25, 0.2, 0.45, 6), vl(0xb5653a)); c.position.set(x, 0.22, z); scene.add(c);
  const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.45, 0), vl(0x4f8a3c)); l.position.set(x, 0.85, z); scene.add(l);
  vat.push({ minX: x - 0.3, maxX: x + 0.3, minZ: z - 0.3, maxZ: z + 0.3 });
}
function bangTrang(scene, x, y, z, rotY) {
  const m = new THREE.Mesh(new THREE.BoxGeometry(2.4, 1.2, 0.05), vl(0xfafafa)); m.position.set(x, y, z); m.rotation.y = rotY; scene.add(m);
}
function xeMay(scene, x, z, vat) {
  const mau = [0xc0262d, 0x2a5aa8, 0x222222, 0xe8e8e8][Math.floor(Math.abs(x * 7) % 4)];
  const add = (w, h, d, c, py, pz = 0) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vl(c)); m.position.set(x, py, z + pz); scene.add(m); };
  add(0.3, 0.35, 1.4, mau, 0.55); add(0.32, 0.12, 0.6, 0x1a1a1a, 0.8, -0.2);
  for (const pz of [-0.55, 0.55]) { const b = new THREE.Mesh(new THREE.CylinderGeometry(0.28, 0.28, 0.1, 8), vl(0x1a1a1a)); b.rotation.z = Math.PI / 2; b.position.set(x, 0.28, z + pz); scene.add(b); }
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
  const c = document.createElement("canvas"); c.width = 1024; c.height = 170;
  const g = c.getContext("2d");
  g.fillStyle = "#e8702a"; g.beginPath(); g.roundRect(0, 0, 1024, 170, 30); g.fill();
  g.fillStyle = "#fff"; g.font = "800 92px 'Baloo 2', system-ui, sans-serif"; g.textAlign = "center"; g.fillText("G-ENTERTAINMENT", 512, 116, 980);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; return t;
}
function taoVanCuaSo() {
  const c = document.createElement("canvas"); c.width = c.height = 64;
  const g = c.getContext("2d"); g.fillStyle = "#fff"; g.fillRect(0, 0, 64, 64);
  g.fillStyle = "#7fa9c4"; for (let i = 0; i < 2; i++) for (let j = 0; j < 2; j++) g.fillRect(6 + i * 32, 6 + j * 32, 20, 22);
  const t = new THREE.CanvasTexture(c); t.wrapS = t.wrapT = THREE.RepeatWrapping; t.repeat.set(3, 5); t.colorSpace = THREE.SRGBColorSpace; return t;
}
