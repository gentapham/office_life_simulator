// Sân khấu Đại Nhạc Hội Siêu Nhân: quảng trường mới phía đông bắc (x 90..130, z -22..30), mở ra đường Hóng.
// Phần tĩnh (sàn, khung giàn, loa, rào chắn, cổng chào) dựng chung với phố để gộp khối.
// Phần động (màn LED, đèn quét, khoảng 50 khán giả, Siêu Nhân Hồng trên sân khấu) do lớp SanKhau điều khiển theo ngày giờ.
import * as THREE from "three";
import { vl, taoNguoi, hinhNguoiNgauNhien } from "./nhan-vat-3d.js";
import { tamBang, fanQuyDo, sieuAnhHung } from "./nguoi-bua.js";
import { AmThanhSanKhau } from "./am-thanh.js";

export const SK = { x1: 90.5, x2: 129.5, z1: -22, tam: 110, sauSan: -20, truocSan: -8, caoSan: 1.6, rao: -4 };
// chỗ người chơi đứng xem (giữa đám đông, nhìn về sân khấu)
export const CHO_XEM = { tang: 0, x: 110, z: 9.5, huong: 0 };
// màn LED dọc hai bên sân khấu (phát video Siêu Nhân Hồng, tỉ lệ 9:16)
const MAN_PHU = { x: 17, y: 1.3, z: -9.24, w: 4.2, h: 7.47 };
// màn video treo trên hai bức tường bên quảng trường: đặt giữa các cột cờ, mép dưới cao hơn nhà vệ sinh, xe nước
const MAN_TUONG = { z: [1.5, 8.5, 15.5, 22.5], y: 2.6, w: 3.375, h: 6 };

export function dungSanKhau(nhom, can) {
  // be: loại mặt (vat-lieu.js) — khối gộp vào vật liệu thật chung khi dựng bản đồ
  const H = (w, h, d, mau, x, y, z, be) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mau === "number" ? vl(mau) : mau); m.position.set(x, y + h / 2, z); if (be) m.userData.be = be; nhom.add(m); return m; };
  const { tam, sauSan, truocSan, caoSan } = SK;
  // nền quảng trường lát đá
  const nen = new THREE.Mesh(new THREE.PlaneGeometry(SK.x2 - SK.x1, 30 - SK.z1), vl(0xf2c4d6)); nen.userData.be = "lat_san"; nen.rotation.x = -Math.PI / 2; nen.position.set(tam, 0.008, (30 + SK.z1) / 2); nhom.add(nen);
  for (let z = SK.z1 + 4; z < 30; z += 4) H(SK.x2 - SK.x1, 0.005, 0.08, 0xe39bbb, tam, 0.006, z);
  // tường bao hai bên và phía sau (mặt sau nhà hàng xóm)
  H(0.6, 9, 50, 0xf3b8cf, SK.x1 - 0.3, 0, 4, "vua"); H(0.6, 9, 50, 0xf3b8cf, SK.x2 + 0.3, 0, 4, "vua"); H(SK.x2 - SK.x1 + 1.2, 12, 0.6, 0xeea6c4, tam, 0, SK.z1 - 0.3, "vua");
  // sàn sân khấu
  H(26, caoSan, truocSan - sauSan, 0x9c3466, tam, 0, (sauSan + truocSan) / 2, "go_san");
  H(26.2, 0.12, 0.2, 0xff9fcb, tam, caoSan - 0.06, truocSan + 0.05);                         // viền hồng mép sân khấu
  for (const i of [-6, -3, 3, 6]) H(1.6, 0.6, 0.8, 0x5c1d3d, tam + i * 1.9, caoSan, truocSan - 1.2, "nhua"); // loa kiểm âm
  // cầu thang hai bên
  for (const s of [-1, 1]) for (let i = 0; i < 4; i++) H(1.4, caoSan * (i + 1) / 4, 0.45, 0xc24a82, tam + s * 13.8, 0, truocSan - 0.5 - i * 0.45);
  // khung giàn: 4 cột + dầm ngang
  const gian = (x, z, h) => { for (const [a, b] of [[-0.25, -0.25], [0.25, -0.25], [-0.25, 0.25], [0.25, 0.25]]) H(0.06, h, 0.06, 0xf59cc4, x + a, 0, z + b, "son_bong"); for (let y = 0.6; y < h; y += 1.2) H(0.56, 0.05, 0.56, 0xf59cc4, x, y, z, "son_bong"); };
  for (const x of [tam - 13.5, tam + 13.5]) { gian(x, truocSan + 0.2, 13); gian(x, sauSan - 0.6, 13); }
  H(27.6, 0.55, 0.55, 0xf59cc4, tam, 12.6, truocSan + 0.2, "son_bong"); H(27.6, 0.55, 0.55, 0xf59cc4, tam, 12.6, sauSan - 0.6, "son_bong");
  for (const x of [tam - 13.5, tam + 13.5]) H(0.55, 0.55, truocSan - sauSan + 0.8, 0xf59cc4, x, 12.6, (sauSan + truocSan) / 2 - 0.2, "son_bong");
  // khung màn LED và cột loa treo
  H(21, 10, 0.5, 0x3a0f26, tam, caoSan, sauSan + 0.2);
  for (const s of [-1, 1]) { for (let i = 0; i < 6; i++) H(1.3, 0.75, 1.1, 0x5c1d3d, tam + s * 12.2, 11.5 - i * 0.8, truocSan - 0.4, "nhua"); }
  // tháp loa dưới đất
  for (const s of [-1, 1]) { H(2.2, 3.4, 1.6, 0x5c1d3d, tam + s * 14.8, 0, truocSan + 0.8, "nhua"); for (let i = 0; i < 3; i++) { const c = new THREE.Mesh(new THREE.CircleGeometry(0.42, 14), vl(0x2a0c1d)); c.position.set(tam + s * 14.8, 0.65 + i * 1.05, truocSan + 1.61); nhom.add(c); } }
  // rào chắn trước sân khấu
  for (let x = tam - 12; x <= tam + 12; x += 2) { H(1.95, 1.1, 0.08, 0xf08abb, x, 0, SK.rao, "kim"); H(0.1, 0.05, 0.7, 0xc95d92, x - 0.9, 0, SK.rao + 0.3, "kim"); }
  // bàn điều khiển âm thanh ánh sáng (FOH) giữa khán đài
  const fx = tam + 9, fz = 19; // lệch sang phải để không chắn tầm nhìn
  H(3, 0.25, 2.4, 0xc95d92, fx, 0, fz); H(2.6, 1, 0.9, 0x5c1d3d, fx, 0.25, fz); H(3.2, 0.1, 2.6, 0xd94d8a, fx, 2.6, fz);
  for (const [a, b] of [[-1.5, -1.2], [1.5, -1.2], [-1.5, 1.2], [1.5, 1.2]]) H(0.08, 2.6, 0.08, 0xf59cc4, fx + a, 0, fz + b);
  // cổng chào ra đường Hóng
  for (const x of [tam - 13, tam + 13]) { H(0.9, 7, 0.9, 0xf26fa6, x, 0, 28.6, "son_bong"); H(1.1, 0.4, 1.1, 0xd94d8a, x, 7, 28.6, "son_bong"); }
  H(27, 1.2, 0.5, 0xf26fa6, tam, 6, 28.6, "son_bong");
  const bang = tamBang("ĐẠI NHẠC HỘI SIÊU NHÂN · 31.10 · 19:30", 25, 1.0, { nen: "#f26fa6", mau: "#ffffff", w: 2000, h: 80, co: 52 });
  bang.position.set(tam, 6.6, 28.6); bang.children.forEach(c => { if (c.position.z > 0) c.position.z = 0.27; else if (c.position.z < 0) c.position.z = -0.27; }); nhom.add(bang);
  // cột đèn trang trí và cờ phướn dọc quảng trường
  for (let z = -2; z <= 26; z += 7) for (const x of [SK.x1 + 1.2, SK.x2 - 1.2]) {
    H(0.14, 6, 0.14, 0xd94d8a, x, 0, z);
    const p = tamBang(z % 2 ? "SIÊU NHÂN\nHỒNG" : "31.10", 0.8, 1.8, { nen: z % 2 ? "#f26fa6" : "#d94d8a", mau: "#ffffff", w: 96, h: 216, co: 26 });
    p.position.set(x + (x < tam ? 0.5 : -0.5), 4.6, z); p.rotation.y = Math.PI / 2; nhom.add(p);
  }
  // khung màn video trên tường hai bên
  for (const x of [SK.x1 + 0.05, SK.x2 - 0.05]) for (const z of MAN_TUONG.z) H(0.1, MAN_TUONG.h + 0.24, MAN_TUONG.w + 0.24, 0xff7ab8, x, MAN_TUONG.y - 0.12, z, "son_bong");
  // xe bán nước, xe chè bên hông quảng trường
  H(1.6, 1.1, 0.8, 0xe8508f, SK.x1 + 2.2, 0, 20); H(1.7, 0.08, 0.9, 0xfff0f6, SK.x1 + 2.2, 1.9, 20);
  H(1.6, 1.1, 0.8, 0xf27fb2, SK.x2 - 2.2, 0, 21); H(1.7, 0.08, 0.9, 0xffd1e6, SK.x2 - 2.2, 1.9, 21);

  // ---- chi tiết hậu cần quanh sân khấu ----
  // cột treo màn LED phụ hai bên
  for (const s of [-1, 1]) { H(0.35, 9.5, 0.35, 0xd94d8a, tam + s * MAN_PHU.x, 0, -9.6, "son_bong"); H(4.8, 0.25, 0.4, 0xd94d8a, tam + s * MAN_PHU.x, 9.2, -9.6, "son_bong"); H(MAN_PHU.w + 0.24, MAN_PHU.h + 0.24, 0.1, 0xff7ab8, tam + s * MAN_PHU.x, MAN_PHU.y - 0.12, MAN_PHU.z - 0.06, "son_bong"); }
  // thùng thiết bị (road case) xếp hai bên cánh gà
  for (const [x, z, n] of [[tam - 16.5, -16, 3], [tam + 16.5, -16, 3], [tam - 15.6, -13.4, 2], [tam + 15.6, -13.4, 2]]) for (let k = 0; k < n; k++) { H(1.1, 0.75, 0.75, 0x5c1d3d, x, k * 0.75, z); H(1.12, 0.06, 0.77, 0xf59cc4, x, k * 0.75 + 0.7, z); }
  // dây cáp chạy từ bàn điều khiển tới sân khấu (có máng che)
  H(0.5, 0.08, 26, 0x8a2c5a, tam + 9, 0, 5); H(9.2, 0.08, 0.5, 0x8a2c5a, tam + 4.6, 0, -7.6);
  // máy phát điện và tủ điện
  H(4.2, 2.2, 2.0, 0xf27fb2, SK.x2 - 2.4, 0, 26); H(4.3, 0.3, 2.1, 0x8a2c5a, SK.x2 - 2.4, 2.2, 26); H(0.8, 1.6, 0.5, 0xd94d8a, SK.x2 - 5.2, 0, 27.6);
  // nhà vệ sinh di động
  for (let k = 0; k < 3; k++) { H(1.2, 2.3, 1.2, 0xf27fb2, SK.x1 + 1.2, 0, 9 + k * 1.45); H(0.05, 1.9, 0.8, 0xd94d8a, SK.x1 + 1.82, 0.1, 9 + k * 1.45); H(1.25, 0.08, 1.25, 0xf2f2f2, SK.x1 + 1.2, 2.3, 9 + k * 1.45); }
  // quầy check-in ở cổng
  H(2.4, 1.0, 0.7, 0xf26fa6, tam - 7, 0, 24.5); for (const [a, b] of [[-1.2, -0.6], [1.2, -0.6], [-1.2, 0.8], [1.2, 0.8]]) H(0.06, 2.5, 0.06, 0xf59cc4, tam - 7 + a, 0, 24.5 + b); H(2.8, 0.08, 1.8, 0xffffff, tam - 7, 2.5, 24.6);
  const bangCI = tamBang("CHECK-IN · VÉ MIỄN PHÍ", 2.4, 0.4, { nen: "#d94d8a", mau: "#ffffff", w: 600, h: 100, co: 40 }); bangCI.position.set(tam - 7, 2.25, 25.4); nhom.add(bangCI);
  // hàng rào chia lối vào (chừa lối giữa rộng 14 m tới khu khán giả)
  for (const x of [tam - 7, tam + 7]) for (let z = 13; z < 23; z += 2) { H(0.05, 1.0, 1.9, 0xf08abb, x, 0, z); H(0.5, 0.05, 0.08, 0xc95d92, x, 0, z - 0.9); }
  // bộ đàm, bình chữa cháy, biển an toàn
  for (const z of [-2, 12]) { H(0.25, 0.6, 0.25, 0xc0262d, SK.x2 - 0.6, 0, z); }

  // va chạm
  can(SK.x1 - 0.6, SK.x1, SK.z1, 29.9); can(SK.x2, SK.x2 + 0.6, SK.z1, 29.9);
  can(tam - 13.2, tam + 13.2, sauSan - 1, truocSan);                  // sân khấu (không leo lên)
  can(tam - 13, tam + 13, SK.rao - 0.1, SK.rao + 0.2);                 // rào
  for (const s of [-1, 1]) { can(tam + s * 14.8 - 1.1, tam + s * 14.8 + 1.1, truocSan, truocSan + 1.6); can(tam + s * 13.8 - 0.75, tam + s * 13.8 + 0.75, truocSan - 2, truocSan); }
  can(tam + 7.4, tam + 10.6, 17.7, 20.3);
  for (const x of [tam - 13, tam + 13]) can(x - 0.45, x + 0.45, 28.15, 29.05);
  can(SK.x1, SK.x1 + 3, 19.4, 20.6); can(SK.x2 - 3, SK.x2, 20.4, 21.6);
  for (const s of [-1, 1]) { can(tam + s * MAN_PHU.x - 0.2, tam + s * MAN_PHU.x + 0.2, -9.8, -9.4); can(tam + s * MAN_PHU.x - MAN_PHU.w / 2 - 0.12, tam + s * MAN_PHU.x + MAN_PHU.w / 2 + 0.12, -9.45, MAN_PHU.z + 0.05); can(tam + s * 16.5 - 0.6, tam + s * 16.5 + 0.6, -16.4, -15.6); can(tam + s * 15.6 - 0.6, tam + s * 15.6 + 0.6, -13.8, -13.0); }
  can(SK.x2 - 4.5, SK.x2 - 0.3, 25, 28); can(SK.x1 + 0.6, SK.x1 + 1.8, 8.4, 13.5); can(tam - 8.2, tam - 5.8, 24.1, 24.9);
  for (const x of [tam - 7, tam + 7]) can(x - 0.05, x + 0.05, 12, 22);
}

// ---------- Phần động ----------
const NGAY_DIEN = 31;
const KHAU_HIEU = ["NGUYÊN ƠI\nTHÁO MŨ ĐI!", "HỒNG HÓA\nVIỆT NAM", "1 TRIỆU\nFOLLOW!", "SIÊU NHÂN\nHỒNG", "CHILL NHA\nANH HỒNG", "SỐ 27\nVÔ ĐỊCH", "XIN 1 CHỮ KÝ\nLÊN MŨ"];

export class SanKhau {
  constructor(scene, { dienThoai = false } = {}) {
    this.scene = scene; this.dienThoai = dienThoai;
    this.nhom = new THREE.Group(); scene.add(this.nhom);
    this.ngay = 0; this.gio = 8; this.dien = false;
    // màn LED
    this.canvas = document.createElement("canvas"); this.canvas.width = 512; this.canvas.height = 256;
    this.tex = new THREE.CanvasTexture(this.canvas); this.tex.colorSpace = THREE.SRGBColorSpace;
    const man = new THREE.Mesh(new THREE.PlaneGeometry(20, 9.4), new THREE.MeshBasicMaterial({ map: this.tex, fog: false, toneMapped: false }));
    man.position.set(SK.tam, SK.caoSan + 5.1, SK.sauSan + 0.47); this.nhom.add(man);
    this.trang = 0; this.tgVe = 0; this.ve(0);
    // đèn quét trên giàn (chỉ bật đêm diễn)
    this.den = [];
    const vlDen = new THREE.MeshBasicMaterial({ color: 0xff7ac0, transparent: true, opacity: 0.16, depthWrite: false, blending: THREE.AdditiveBlending, side: THREE.DoubleSide, fog: false });
    for (let i = 0; i < 8; i++) {
      const goc = new THREE.Group(); goc.position.set(SK.tam - 11 + i * (22 / 7), 12.3, SK.truocSan + 0.2);
      const geo = new THREE.ConeGeometry(1.6, 13, 14, 1, true); geo.translate(0, -6.5, 0);
      const c = new THREE.Mesh(geo, i % 2 ? vlDen : vlDen.clone()); if (!(i % 2)) c.material.color.set(0xffb3dd);
      goc.add(c, new THREE.Mesh(new THREE.BoxGeometry(0.4, 0.4, 0.5), vl(0x5c1d3d)));
      this.nhom.add(goc); this.den.push(goc);
    }
    // Siêu Nhân Hồng trên sân khấu
    this.nguyen = taoNguoi("sieu_nhan_hong");
    this.nguyen.group.position.set(SK.tam, SK.caoSan, SK.truocSan - 2.4); this.nhom.add(this.nguyen.group);
    this.micro = new THREE.Mesh(new THREE.CylinderGeometry(0.02, 0.02, 1.5, 6), vl(0x1c1c1f)); this.micro.position.set(SK.tam, SK.caoSan + 0.75, SK.truocSan - 1.8); this.nhom.add(this.micro);
    this.khanGia = null; // dựng khi tới ngày diễn
    // màn LED dọc hai bên: mỗi bên phát lần lượt 5 video Siêu Nhân Hồng
    this.taoManVideo();
    // đèn par trên giàn và dải LED mép sân khấu (đổi màu theo nhạc)
    this.par = [];
    for (let k = 0; k < 12; k++) {
      const g = new THREE.Group(); g.position.set(SK.tam - 12 + k * (24 / 11), 12.15, SK.truocSan + 0.2);
      const v = new THREE.Mesh(new THREE.CylinderGeometry(0.17, 0.2, 0.42, 8), vl(0x5c1d3d)); v.rotation.x = 1.2; g.add(v);
      const kinh = new THREE.Mesh(new THREE.CircleGeometry(0.15, 10), new THREE.MeshBasicMaterial({ color: 0x333333, fog: false })); kinh.position.set(0, -0.08, 0.2); kinh.rotation.x = 1.2 - Math.PI / 2; g.add(kinh);
      this.nhom.add(g); this.par.push(kinh.material);
    }
    this.vlLed = new THREE.MeshBasicMaterial({ color: 0xf26fa6, fog: false });
    const led = new THREE.Mesh(new THREE.BoxGeometry(26.1, 0.08, 0.05), this.vlLed); led.position.set(SK.tam, SK.caoSan - 0.15, SK.truocSan + 0.13); this.nhom.add(led);
    // đội thi công (những ngày trước đêm diễn)
    this.thiCong = new THREE.Group(); this.nhom.add(this.thiCong); this.tho = [];
    for (const [x, z, viec] of [[SK.tam - 13.5, SK.truocSan + 1.2, "thang"], [SK.tam + 6, 2, "day"], [SK.tam + 9, 17.6, "ban"]]) {
      const nh = hinhNguoiNgauNhien(Math.random, { nu: false, them: ["muBaoHiem"] }); nh.mauMu = 0xffcf3a; nh.ao = { kieu: "thun", mau: 0xe8702a }; nh.quan = { kieu: "tuihop", mau: 0x3f4247 };
      const nv = taoNguoi(null, nh); nv.group.position.set(x, viec === "thang" ? 2.2 : 0, z); nv.group.rotation.y = viec === "ban" ? Math.PI : 0;
      if (viec === "thang") { const thang = new THREE.Group(); for (const sx of [-0.25, 0.25]) { const r = new THREE.Mesh(new THREE.BoxGeometry(0.05, 3.2, 0.05), vl(0xb8bcc4)); r.position.set(sx, 1.6, 0); thang.add(r); } for (let k = 0; k < 7; k++) { const b = new THREE.Mesh(new THREE.BoxGeometry(0.5, 0.04, 0.04), vl(0xb8bcc4)); b.position.y = 0.3 + k * 0.42; thang.add(b); } thang.position.set(x, 0, z + 0.25); thang.rotation.x = -0.12; this.thiCong.add(thang); }
      if (viec === "day") { const thung = new THREE.Mesh(new THREE.BoxGeometry(1.1, 0.75, 0.75), vl(0x1c1c1f)); thung.position.set(x, 0.38, z - 0.8); this.thiCong.add(thung); nv.thung = thung; }
      this.thiCong.add(nv.group); this.tho.push({ nv, viec, x, z });
    }
    // âm thanh
    this.amThanh = new AmThanhSanKhau();
    this.anhSang = null; // đèn thật, laser, khói, pháo giấy: dựng khi tới đêm diễn
    this.datTrangThai();
  }
  datNgay(ngay) { if (ngay !== this.ngay) { this.ngay = ngay; this.datTrangThai(); } }
  datGio(gio) { this.gio = gio; this.datTrangThai(); }
  datTrangThai() {
    const dien = this.ngay >= NGAY_DIEN && (this.gio >= 17 || this.gio < 2);
    this.dien = dien;
    if (dien && !this.khanGia) this.taoKhanGia();
    if (this.khanGia) this.khanGia.visible = dien;
    this.nguyen.group.visible = this.micro.visible = dien;
    for (const d of this.den) d.visible = dien;
    if (dien && !this.anhSang) this.taoAnhSang();
    if (this.anhSang) this.anhSang.visible = dien;
    this.thiCong.visible = !dien && this.ngay < NGAY_DIEN;
    this.amThanh.datCheDo(dien ? "dien" : this.ngay >= 25 && this.gio >= 9 && this.gio < 18 ? "thu" : "im");
  }
  // ánh sáng đêm diễn: đèn rọi thật, đèn màu chạy, laser, khói, pháo giấy, khói CO2
  taoAnhSang() {
    const a = new THREE.Group(); this.anhSang = a; this.nhom.add(a);
    const { tam, truocSan, caoSan } = SK;
    this.roi = [];
    for (const s of [-1, 1]) {
      const sp = new THREE.SpotLight(0xffe0ee, 90, 70, 0.33, 0.6, 1.2); sp.position.set(tam + s * 6, 9, 20);
      sp.target.position.set(tam + s * 1.5, caoSan, truocSan - 2.4); a.add(sp, sp.target); this.roi.push(sp);
    }
    this.mau = [0xff4fa3, 0xff8ac8, 0xe0479a].map((c, i) => { const p = new THREE.PointLight(c, 30, 26, 1.5); p.position.set(tam - 8 + i * 8, 8, truocSan - 1); a.add(p); return p; });
    // laser: các tia mảnh quét qua khán đài
    const tia = [];
    for (let k = 0; k < 10; k++) { const goc = -0.9 + k * 0.2; tia.push(0, 0, 0, Math.sin(goc) * 40, -9, Math.cos(goc) * 40); }
    const g = new THREE.BufferGeometry(); g.setAttribute("position", new THREE.Float32BufferAttribute(tia, 3));
    this.laser = [0xff3fa8, 0xff9ad2].map((c, i) => { const l = new THREE.LineSegments(g, new THREE.LineBasicMaterial({ color: c, transparent: true, opacity: 0.85, blending: THREE.AdditiveBlending, depthWrite: false, fog: false })); l.position.set(tam + (i ? 5 : -5), 11.5, SK.sauSan + 0.5); a.add(l); return l; });
    // khói sân khấu: các mảng mờ lơ lửng
    const c = document.createElement("canvas"); c.width = c.height = 128; const x = c.getContext("2d");
    const gr = x.createRadialGradient(64, 64, 4, 64, 64, 62); gr.addColorStop(0, "rgba(255,255,255,.55)"); gr.addColorStop(1, "rgba(255,255,255,0)"); x.fillStyle = gr; x.fillRect(0, 0, 128, 128);
    const tKhoi = new THREE.CanvasTexture(c);
    this.khoi = [];
    for (let k = 0; k < 9; k++) { const m = new THREE.Sprite(new THREE.SpriteMaterial({ map: tKhoi, color: 0xffc8e6, transparent: true, opacity: 0.22, depthWrite: false, fog: false })); m.scale.set(9, 5, 1); m.position.set(tam - 12 + (k % 5) * 6, 2.5 + Math.floor(k / 5) * 2.5, truocSan + 1 + (k % 3) * 3); a.add(m); this.khoi.push(m); }
    // pháo giấy
    const N = 500, pos = new Float32Array(N * 3), mau = new Float32Array(N * 3), bang = [[1, .3, .65], [1, .6, .8], [1, 1, 1], [.95, .2, .55], [1, .82, .9]];
    for (let k = 0; k < N; k++) { const m = bang[k % 5]; mau.set(m, k * 3); pos[k * 3 + 1] = -50; }
    const gp = new THREE.BufferGeometry(); gp.setAttribute("position", new THREE.BufferAttribute(pos, 3)); gp.setAttribute("color", new THREE.BufferAttribute(mau, 3));
    this.phao = new THREE.Points(gp, new THREE.PointsMaterial({ size: 0.16, vertexColors: true, fog: false })); this.phao.frustumCulled = false; a.add(this.phao);
    this.vanToc = new Float32Array(N * 3); this.tPhao = 6;
    // khói CO2 hai góc sân khấu
    this.co2 = [-1, 1].map(s => { const m = new THREE.Mesh(new THREE.ConeGeometry(0.9, 6, 10, 1, true), new THREE.MeshBasicMaterial({ color: 0xffffff, transparent: true, opacity: 0, depthWrite: false, fog: false, side: THREE.DoubleSide })); m.position.set(tam + s * 12, caoSan + 3, truocSan - 0.5); m.rotation.x = Math.PI; a.add(m); return m; });
  }
  banPhao() {
    const p = this.phao.geometry.attributes.position, v = this.vanToc;
    for (let k = 0; k < p.count; k++) {
      const s = k % 2 ? 1 : -1;
      p.setXYZ(k, SK.tam + s * 11, SK.caoSan + 0.5, SK.truocSan - 0.5);
      v[k * 3] = -s * (2 + Math.random() * 6) + (Math.random() - 0.5) * 3; v[k * 3 + 1] = 9 + Math.random() * 7; v[k * 3 + 2] = 2 + Math.random() * 9;
    }
    p.needsUpdate = true; this.tCo2 = 1.2; this.amThanh.reoHo();
  }
  huy() {
    this.amThanh.huy(); clearInterval(this.canhGac);
    for (const m of [...(this.manVideo || []), ...(this.manTuong || [])]) { m.v.pause(); m.v.removeAttribute("src"); m.v.load(); m.tex.dispose(); }
  }
  taoManVideo() {
    // ảnh chờ khi video chưa tải xong
    const c = document.createElement("canvas"); c.width = 288; c.height = 512; const g = c.getContext("2d");
    const nen = g.createLinearGradient(0, 0, 0, 512); nen.addColorStop(0, "#ff7ab8"); nen.addColorStop(1, "#8a1f55"); g.fillStyle = nen; g.fillRect(0, 0, 288, 512);
    g.fillStyle = "#fff"; g.textAlign = "center"; g.font = "900 40px 'Be Vietnam Pro', system-ui, sans-serif"; g.fillText("SIÊU NHÂN", 144, 230); g.fillText("HỒNG", 144, 280);
    const tCho = new THREE.CanvasTexture(c); tCho.colorSpace = THREE.SRGBColorSpace;
    const goc = import.meta.env.BASE_URL || "./";
    const taoMan = (ds, w, h, x, y, z, quay) => {
      const v = document.createElement("video");
      v.playsInline = true; v.preload = "none"; v.muted = true; v.defaultMuted = true; v.volume = 0; v.crossOrigin = "anonymous"; v.loop = ds.length === 1;
      // ảnh video chỉ chép lên card đồ hoạ khi video có khung mới và màn đang nằm trong tầm nhìn (xem capNhatVideo)
      // isVideoTexture: three.js chép thẳng khung video theo kích thước thật của video (Texture thường cấp vùng nhớ 0x0, màn đen);
      // update rỗng: không tự chép mỗi khung hình như VideoTexture
      const tex = new THREE.Texture(v); tex.isVideoTexture = true; tex.update = () => {};
      tex.colorSpace = THREE.SRGBColorSpace; tex.generateMipmaps = false; tex.minFilter = THREE.LinearFilter;
      const vlMan = new THREE.MeshBasicMaterial({ map: tCho, fog: false, toneMapped: false });
      const m = new THREE.Mesh(new THREE.PlaneGeometry(w, h), vlMan);
      m.position.set(x, y + h / 2, z); m.rotation.y = quay; this.nhom.add(m);
      const man = { v, tex, vlMan, ds, so: 0, x, z, chay: false, loi: 0, hong: false, sanSang: false, moi: true, thay: -9, tThay: -1e9, tChep: 0, cachChep: w > 4 ? 30 : 38 };
      // màn được vẽ trong khung này (đã qua lọc tầm nhìn) thì ghi lại số khung
      m.onBeforeRender = () => { man.thay = this.soKhung; man.tThay = performance.now(); };
      // video báo có khung hình mới (trình duyệt không hỗ trợ thì coi như luôn mới)
      if ("requestVideoFrameCallback" in v) { const baoMoi = () => { man.moi = true; v.requestVideoFrameCallback(baoMoi); }; v.requestVideoFrameCallback(baoMoi); }
      else man.coMoi = true;
      const nap = () => { v.src = `${goc}video/sieu-nhan-hong-${ds[man.so]}.mp4`; if (man.chay) this.phat(man); };
      v.addEventListener("playing", () => { man.sanSang = true; if (vlMan.map !== tex) { tex.needsUpdate = true; vlMan.map = tex; vlMan.needsUpdate = true; } });
      v.addEventListener("ended", () => { man.so = (man.so + 1) % ds.length; nap(); });
      // video lỗi thì sang video kế; trình duyệt không phát được cả danh sách thì giữ ảnh chờ
      v.addEventListener("error", () => { if (++man.loi >= ds.length) { man.hong = true; return; } man.so = (man.so + 1) % ds.length; setTimeout(nap, 3000); });
      v.addEventListener("playing", () => { man.loi = 0; });
      man.nap = nap;
      return man;
    };
    // hai màn dọc cạnh sân khấu: video 1 và 6, chiếu lặp, không tiếng
    this.manVideo = [[1], [6]].map((ds, k) => taoMan(ds, MAN_PHU.w, MAN_PHU.h, SK.tam + (k ? 1 : -1) * MAN_PHU.x, MAN_PHU.y, MAN_PHU.z, 0));
    // 4 màn trên mỗi bức tường: trái video 2..5, phải 7..10, mỗi màn lặp một video, không tiếng
    this.manTuong = [];
    for (const [k, x] of [[0, SK.x1 + 0.11], [1, SK.x2 - 0.11]]) MAN_TUONG.z.forEach((z, i) => this.manTuong.push(taoMan([k * 5 + i + 2], MAN_TUONG.w, MAN_TUONG.h, x, MAN_TUONG.y, z, k ? -Math.PI / 2 : Math.PI / 2)));
    // capNhat không được gọi khi người chơi ở tầng khác: tự dừng video
    this.tCapNhat = 0;
    this.canhGac = setInterval(() => { if (performance.now() - this.tCapNhat > 2500) this.dungVideo(); }, 500);
  }
  phat(man) {
    if (man.hong) return;
    if (!man.v.src) {
      // tải lần lượt: tối đa 2 video đang tải cùng lúc để video nào cũng mau có hình
      if (this.soDangTai() >= 2) return;
      man.chay = true; man.nap(); return;
    }
    man.chay = true;
    man.v.play().catch(() => { man.chay = false; man.tThu = performance.now(); });
  }
  soDangTai() { return (this.dsMan || []).filter(m => m.v.src && m.v.readyState < 3 && !m.hong && !m.sanSang).length; }
  dungVideo() { for (const m of [...this.manVideo, ...this.manTuong]) if (m.chay || !m.v.paused) { m.chay = false; m.v.pause(); } }
  // màn chiếu khi người chơi ở khu quảng trường (cả đoạn phố nhìn thấy sân khấu), tắt tiếng; đi xa thì dừng cho nhẹ máy
  capNhatVideo(gan, viTri) {
    this._viTri = viTri;
    this.tCapNhat = performance.now();
    const ds = this.dsMan || (this.dsMan = [...this.manVideo, ...this.manTuong]);
    if (!gan) {
      this.dungVideo(); this.tVao = 0;
      // ở xa vẫn tải trước từng video (không phát) để tới quảng trường là có hình ngay
      if (this.soDangTai() < 2) { const m = ds.find(x => !x.v.src && !x.hong); if (m) { m.v.preload = "auto"; m.nap(); } }
      return;
    }
    const bay = performance.now();
    // màn khuất tầm nhìn quá 3 giây thì tạm dừng giải mã cho nhẹ máy, quay lại nhìn thì chiếu tiếp ngay
    // (lần đầu vào khu quảng trường chưa có màn nào được vẽ: cho chiếu hết trong 3 giây đầu)
    if (!this.tVao) this.tVao = bay;
    // máy yếu: chỉ 2 màn tường gần nhất chiếu, màn khác đứng ở khung hình cuối
    const ganNhat = null; // mọi màn đều chiếu, cả trên điện thoại
    for (const m of ds) {
      // ở khu quảng trường thì mọi màn đều chiếu liên tục (quay đi quay lại vẫn đang chạy), chỉ màn đang nhìn thấy mới chép hình lên card đồ hoạ
      const thay = !ganNhat || !this.manTuong.includes(m) || ganNhat.has(m);
      if (thay && !m.chay && !(m.tThu && bay - m.tThu < 1500)) this.phat(m);
      else if (!thay && m.chay) { m.chay = false; m.v.pause(); }
    }
    // chép ảnh video lên card đồ hoạ: chỉ màn đang nhìn thấy và có khung mới, màn lâu chưa chép được ưu tiên;
    // mỗi khung hình chép tối đa 4 màn (máy yếu 2) — màn nhìn thấy chạy đủ hình như video gốc
    this.soKhung = (this.soKhung || 0) + 1;
    const toiDa = this.dienThoai ? 2 : 4;
    const cho = this._cho || (this._cho = []); cho.length = 0;
    // màn sân khấu tối đa 30 lần/giây, màn tường (video nhỏ 24 hình/giây) tối đa 24 lần/giây
    for (const m of ds) if (m.sanSang && !m.v.paused && m.v.readyState >= 2 && (m.moi || m.coMoi) && this.soKhung - m.thay <= 2 && bay - m.tChep >= m.cachChep) cho.push(m);
    if (cho.length > toiDa) cho.sort((a, b) => a.tChep - b.tChep);
    for (let k = 0; k < Math.min(toiDa, cho.length); k++) { const m = cho[k]; m.tex.needsUpdate = true; m.moi = false; m.tChep = bay; }
  }


  taoKhanGia() {
    let seed = 3110;
    const rnd = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
    this.khanGia = new THREE.Group(); this.nhom.add(this.khanGia);
    this.nguoiXem = [];
    const so = this.dienThoai ? 30 : 50;
    const vlQue = [0xff4fa3, 0xff7ac0, 0xffb3dd].map(c => new THREE.MeshBasicMaterial({ color: c, fog: false }));
    for (let i = 0; i < so; i++) {
      // xếp hàng lộn xộn sau rào, chừa lối giữa cho người chơi đứng
      const hang = Math.floor(i / 10), cot = i % 10;
      let x = SK.tam - 10 + cot * 2.2 + (rnd() - 0.5) * 0.9, z = SK.rao + 1 + hang * 1.6 + (rnd() - 0.5) * 0.6;
      if (Math.abs(x - CHO_XEM.x) < 1.2 && Math.abs(z - CHO_XEM.z) < 1.4) x += 2.4;
      let nv, loai;
      const r = rnd();
      if (r < 0.1) { nv = fanQuyDo(rnd, { coCo: false }); loai = "quy"; }
      else if (r < 0.18) { nv = sieuAnhHung(rnd); loai = "hung"; }
      else {
        nv = taoNguoi(null, hinhNguoiNgauNhien(rnd, { them: rnd() < 0.15 ? ["khauTrangVai"] : [] }));
        if (r < 0.32) {
          loai = "bang";
          const b = tamBang(KHAU_HIEU[Math.floor(rnd() * KHAU_HIEU.length)], 0.7, 0.46, { nen: rnd() < 0.5 ? "#f26fa6" : "#ffffff", mau: rnd() < 0.5 ? "#ffffff" : "#c0262d" });
          b.position.set(0, nv.chieuCao + 0.32, 0.05); nv.group.add(b);
          nv.tayT.userData.coDinh = nv.tayP.userData.coDinh = true; nv.tayT.rotation.set(-2.9, 0, 0.15); nv.tayP.rotation.set(-2.9, 0, -0.15);
        } else {
          loai = "que";
          const que = new THREE.Mesh(new THREE.CylinderGeometry(0.035, 0.03, 0.34, 6), vlQue[Math.floor(rnd() * 3)]);
          que.position.set(0, -0.86, 0.05); nv.tayP.add(que); nv.tayP.userData.coDinh = true;
        }
      }
      nv.group.position.set(x, 0, z); nv.group.rotation.y = Math.PI + (rnd() - 0.5) * 0.4; // quay về sân khấu (−z)
      this.khanGia.add(nv.group);
      this.nguoiXem.push({ nv, loai, pha: rnd() * 6, nhay: 0.6 + rnd() * 0.8 });
    }
    // một cô gái cầm ly chè đứng hàng đầu bên trái, không cầm que phát sáng
    const nh = hinhNguoiNgauNhien(rnd, { nu: true }); nh.toc = ["dai_song", 0x1e1a17]; nh.ao = { kieu: "somi", mau: 0xf6efe0 }; nh.pk = [];
    const mai = taoNguoi(null, nh);
    const ly = new THREE.Group(); ly.add(new THREE.Mesh(new THREE.CylinderGeometry(0.05, 0.04, 0.13, 8), new THREE.MeshLambertMaterial({ color: 0xc89ad8, transparent: true, opacity: 0.85 })), new THREE.Mesh(new THREE.CylinderGeometry(0.006, 0.006, 0.2, 4), vl(0xf26fa6)));
    ly.children[1].position.set(0.02, 0.1, 0); ly.position.set(0, -0.7, 0.06); ly.userData.dung = true; mai.tayP.add(ly); mai.tayP.userData.coDinh = true; mai.tayP.rotation.x = -0.9;
    mai.group.position.set(SK.tam - 9.4, 0, SK.rao + 0.9); mai.group.rotation.y = Math.PI + 0.25; this.khanGia.add(mai.group);
    this.nguoiXem.push({ nv: mai, loai: "mai", pha: 0, nhay: 0.3 });
  }
  ve(t) {
    const g = this.canvas.getContext("2d"), W = 512, Hh = 256;
    const nen = g.createLinearGradient(0, 0, W, Hh);
    if (this.dien) { const k = (Math.sin(t * 1.3) + 1) / 2; nen.addColorStop(0, `rgb(${215 + k * 40},${60 + k * 40},${140 + k * 30})`); nen.addColorStop(1, "#6a1240"); }
    else { nen.addColorStop(0, "#d64a8c"); nen.addColorStop(1, "#5a0f34"); }
    g.fillStyle = nen; g.fillRect(0, 0, W, Hh);
    // vạch nhạc nhảy
    if (this.dien) for (let i = 0; i < 32; i++) { const h = (Math.sin(t * 7 + i * 0.7) + 1.2) * 28; g.fillStyle = i % 2 ? "rgba(255,255,255,.18)" : "rgba(255,122,192,.35)"; g.fillRect(i * 16 + 2, Hh - h, 12, h); }
    g.textAlign = "center"; g.textBaseline = "middle"; g.fillStyle = "#ffffff";
    const trangDien = [["ĐẠI NHẠC HỘI", "SIÊU NHÂN"], ["SIÊU NHÂN HỒNG", "HỒNG HÓA VIỆT NAM"], ["CHUNG KẾT 20:00", "THÍ SINH SỐ 27"], ["CẢM ƠN", "QUẬN HÓNG!"]];
    const conLai = Math.max(0, NGAY_DIEN - (this.ngay || 1));
    const trangCho = [["ĐẠI NHẠC HỘI", "SIÊU NHÂN"], ["31.10 · 19:30", "QUẢNG TRƯỜNG HÓNG"], [conLai ? `CÒN ${conLai} NGÀY` : "TỐI NAY", "VÉ MIỄN PHÍ"]];
    const ds = this.dien ? trangDien : trangCho;
    const [a, b] = ds[this.trang % ds.length];
    g.font = "900 64px 'Be Vietnam Pro', system-ui, sans-serif"; g.fillText(a, W / 2, 98, W - 30);
    g.font = "800 38px 'Be Vietnam Pro', system-ui, sans-serif"; g.fillStyle = "#ffd1e6"; g.fillText(b, W / 2, 166, W - 30);
    this.tex.needsUpdate = true;
  }
  capNhat(dt, t, viTri) {
    const gan = Math.abs(viTri.x - SK.tam) < 90 && viTri.z < 60 && viTri.z > -60;
    this.nhom.visible = gan;
    this.capNhatVideo(gan, viTri);
    if (!gan) { this.amThanh.datAmLuong(0); return; }
    this.tgVe += dt;
    if (this.tgVe > (this.dien ? 0.12 : 0.5)) { this.tgVe = 0; this._dem = (this._dem || 0) + 1; if (this._dem % (this.dien ? 30 : 8) === 0) this.trang++; this.ve(t); }
    // âm thanh: to dần khi lại gần sân khấu, ở trong nhà thì nhỏ hẳn
    const kc = Math.hypot(viTri.x - SK.tam, viTri.z - (SK.truocSan - 4));
    if (this.amThanh.cheDo !== "im") this.amThanh.batDau();
    this.amThanh.datAmLuong(Math.pow(Math.max(0, 1 - kc / 95), 1.6) * (Math.abs(viTri.x) < 21 && viTri.z < 14.5 ? 0.3 : 1));
    if (!this.dien) {
      // thợ làm việc: leo thang chỉnh đèn, khiêng thùng, gõ bàn điều khiển
      for (const th of this.tho) {
        const nv = th.nv;
        if (th.viec === "thang") { nv.tayP.userData.coDinh = true; nv.tayP.rotation.x = -2.7 + Math.sin(t * 3) * 0.2; nv.hoatDong(t, false); }
        else if (th.viec === "day") { const u = (Math.sin(t * 0.35) + 1) / 2; nv.group.position.x = th.x - 4 + u * 8; nv.group.rotation.y = Math.cos(t * 0.35) > 0 ? Math.PI / 2 : -Math.PI / 2; nv.tayT.userData.coDinh = nv.tayP.userData.coDinh = true; nv.tayT.rotation.x = nv.tayP.rotation.x = -1.2; nv.hoatDong(t, true); nv.thung.position.set(nv.group.position.x + Math.sin(nv.group.rotation.y) * 0.6, 0.95, th.z); }
        else { nv.tayT.userData.coDinh = nv.tayP.userData.coDinh = true; nv.tayT.rotation.x = -1.1 + Math.sin(t * 9) * 0.06; nv.tayP.rotation.x = -1.1 + Math.sin(t * 9 + 1) * 0.06; nv.hoatDong(t, false); }
      }
      return;
    }
    // ánh sáng theo nhịp 120 BPM
    const nhip = t * 2, phach = nhip % 1;
    for (const [k, m] of this.par.entries()) m.color.setHSL(0.86 + ((nhip * 0.08 + k / 12) % 1) * 0.1, 1, phach < 0.15 || (k + Math.floor(nhip)) % 3 === 0 ? 0.6 : 0.18);
    this.vlLed.color.setHSL(0.9 + Math.sin(t * 0.6) * 0.04, 1, 0.5 + Math.sin(t * 4) * 0.12);
    for (const [k, p] of this.mau.entries()) { p.position.x = SK.tam - 8 + k * 8 + Math.sin(t * 0.9 + k * 2) * 4; p.intensity = 22 + (phach < 0.12 ? 25 : 0); }
    for (const [k, sp] of this.roi.entries()) sp.target.position.x = this.nguyen.group.position.x + (k ? 0.6 : -0.6); // đèn rọi bám theo Siêu Nhân Hồng
    for (const [k, l] of this.laser.entries()) { l.rotation.y = Math.sin(t * 0.6 + k * Math.PI) * 0.5; l.rotation.x = Math.sin(t * 0.45 + k) * 0.12; l.visible = Math.floor(nhip / 8) % 2 === k; }
    for (const [k, m] of this.khoi.entries()) { m.position.x += Math.sin(t * 0.2 + k) * dt * 0.3; m.material.opacity = 0.16 + Math.sin(t * 0.5 + k) * 0.06; }
    // pháo giấy: bắn mỗi 16 nhịp, rơi xuống theo trọng lực
    this.tPhao -= dt; if (this.tPhao <= 0) { this.tPhao = 8; this.banPhao(); }
    const p = this.phao.geometry.attributes.position, v = this.vanToc;
    for (let k = 0; k < p.count; k++) {
      if (p.getY(k) < -10) continue;
      v[k * 3 + 1] = Math.max(-1.6, v[k * 3 + 1] - 9.8 * dt); v[k * 3] *= 0.985; v[k * 3 + 2] *= 0.985;
      p.setXYZ(k, p.getX(k) + v[k * 3] * dt + Math.sin(t * 3 + k) * dt * 0.4, Math.max(0.02, p.getY(k) + v[k * 3 + 1] * dt), p.getZ(k) + v[k * 3 + 2] * dt);
    }
    p.needsUpdate = true;
    this.tCo2 = Math.max(0, (this.tCo2 || 0) - dt);
    for (const m of this.co2) { m.material.opacity = this.tCo2 > 0 ? 0.55 * (this.tCo2 / 1.2) : 0; m.scale.setScalar(1 + (1.2 - this.tCo2) * 0.4); }
    this.den.forEach((d, i) => { d.rotation.z = Math.sin(t * 0.9 + i) * 0.55; d.rotation.x = 0.25 + Math.sin(t * 0.7 + i * 1.7) * 0.3; });
    this.nguyen.hoatDong(t, false);
    this.nguyen.group.position.x = SK.tam + Math.sin(t * 0.4) * 3;
    this.nguyen.group.rotation.y = Math.sin(t * 0.8) * 0.4;
    for (const k of this.nguoiXem) {
      const nv = k.nv, pha = t * 4 * k.nhay + k.pha;
      nv.hoatDong(t + k.pha, false);
      nv.group.position.y = Math.max(0, Math.sin(pha)) * 0.12 * k.nhay; // nhún nhảy
      if (k.loai === "que") nv.tayP.rotation.set(-2.6 + Math.sin(pha) * 0.35, 0, Math.sin(pha * 0.5) * 0.3);
      else if (k.loai === "quy" || k.loai === "hung") { nv.tayP.userData.coDinh = true; nv.tayP.rotation.x = -2.8 + Math.sin(pha) * 0.3; }
    }
  }
}
