// Sân khấu Đại Nhạc Hội Siêu Nhân: quảng trường mới phía đông bắc (x 90..130, z -22..30), mở ra đường Hóng.
// Phần tĩnh (sàn, khung giàn, loa, rào chắn, cổng chào) dựng chung với phố để gộp khối.
// Phần động (màn LED, đèn quét, khoảng 50 khán giả, Siêu Nhân Hồng trên sân khấu) do lớp SanKhau điều khiển theo ngày giờ.
import * as THREE from "three";
import { vl, taoNguoi, hinhNguoiNgauNhien } from "./nhan-vat-3d.js";
import { tamBang, fanQuyDo, sieuAnhHung } from "./nguoi-bua.js";

export const SK = { x1: 90.5, x2: 129.5, z1: -22, tam: 110, sauSan: -20, truocSan: -8, caoSan: 1.6, rao: -4 };
// chỗ người chơi đứng xem (giữa đám đông, nhìn về sân khấu)
export const CHO_XEM = { tang: 0, x: 110, z: 9.5, huong: 0 };

export function dungSanKhau(nhom, can) {
  const H = (w, h, d, mau, x, y, z) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mau === "number" ? vl(mau) : mau); m.position.set(x, y + h / 2, z); nhom.add(m); return m; };
  const { tam, sauSan, truocSan, caoSan } = SK;
  // nền quảng trường lát đá
  const nen = new THREE.Mesh(new THREE.PlaneGeometry(SK.x2 - SK.x1, 30 - SK.z1), vl(0xb9b2a4)); nen.rotation.x = -Math.PI / 2; nen.position.set(tam, 0.008, (30 + SK.z1) / 2); nhom.add(nen);
  for (let z = SK.z1 + 4; z < 30; z += 4) H(SK.x2 - SK.x1, 0.005, 0.08, 0xa49d8f, tam, 0.006, z);
  // tường bao hai bên và phía sau (mặt sau nhà hàng xóm)
  H(0.6, 9, 50, 0xd6cbb6, SK.x1 - 0.3, 0, 4); H(0.6, 9, 50, 0xd6cbb6, SK.x2 + 0.3, 0, 4); H(SK.x2 - SK.x1 + 1.2, 12, 0.6, 0xcfc4ad, tam, 0, SK.z1 - 0.3);
  // sàn sân khấu
  H(26, caoSan, truocSan - sauSan, 0x1c1c1f, tam, 0, (sauSan + truocSan) / 2);
  H(26.2, 0.12, 0.2, 0xf26fa6, tam, caoSan - 0.06, truocSan + 0.05);                         // viền hồng mép sân khấu
  for (const i of [-6, -3, 3, 6]) H(1.6, 0.6, 0.8, 0x2a2c31, tam + i * 1.9, caoSan, truocSan - 1.2); // loa kiểm âm
  // cầu thang hai bên
  for (const s of [-1, 1]) for (let i = 0; i < 4; i++) H(1.4, caoSan * (i + 1) / 4, 0.45, 0x2a2c31, tam + s * 13.8, 0, truocSan - 0.5 - i * 0.45);
  // khung giàn: 4 cột + dầm ngang
  const gian = (x, z, h) => { for (const [a, b] of [[-0.25, -0.25], [0.25, -0.25], [-0.25, 0.25], [0.25, 0.25]]) H(0.06, h, 0.06, 0xb8bcc4, x + a, 0, z + b); for (let y = 0.6; y < h; y += 1.2) H(0.56, 0.05, 0.56, 0xb8bcc4, x, y, z); };
  for (const x of [tam - 13.5, tam + 13.5]) { gian(x, truocSan + 0.2, 13); gian(x, sauSan - 0.6, 13); }
  H(27.6, 0.55, 0.55, 0xb8bcc4, tam, 12.6, truocSan + 0.2); H(27.6, 0.55, 0.55, 0xb8bcc4, tam, 12.6, sauSan - 0.6);
  for (const x of [tam - 13.5, tam + 13.5]) H(0.55, 0.55, truocSan - sauSan + 0.8, 0xb8bcc4, x, 12.6, (sauSan + truocSan) / 2 - 0.2);
  // khung màn LED và cột loa treo
  H(21, 10, 0.5, 0x111114, tam, caoSan, sauSan + 0.2);
  for (const s of [-1, 1]) { for (let i = 0; i < 6; i++) H(1.3, 0.75, 1.1, 0x1c1c1f, tam + s * 12.2, 11.5 - i * 0.8, truocSan - 0.4); }
  // tháp loa dưới đất
  for (const s of [-1, 1]) { H(2.2, 3.4, 1.6, 0x1c1c1f, tam + s * 14.8, 0, truocSan + 0.8); for (let i = 0; i < 3; i++) { const c = new THREE.Mesh(new THREE.CircleGeometry(0.42, 14), vl(0x3a3d44)); c.position.set(tam + s * 14.8, 0.65 + i * 1.05, truocSan + 1.61); nhom.add(c); } }
  // rào chắn trước sân khấu
  for (let x = tam - 12; x <= tam + 12; x += 2) { H(1.95, 1.1, 0.08, 0x9aa0a6, x, 0, SK.rao); H(0.1, 0.05, 0.7, 0x6d7175, x - 0.9, 0, SK.rao + 0.3); }
  // bàn điều khiển âm thanh ánh sáng (FOH) giữa khán đài
  const fx = tam + 9, fz = 19; // lệch sang phải để không chắn tầm nhìn
  H(3, 0.25, 2.4, 0x6d7175, fx, 0, fz); H(2.6, 1, 0.9, 0x2a2c31, fx, 0.25, fz); H(3.2, 0.1, 2.6, 0x2a2c31, fx, 2.6, fz);
  for (const [a, b] of [[-1.5, -1.2], [1.5, -1.2], [-1.5, 1.2], [1.5, 1.2]]) H(0.08, 2.6, 0.08, 0x8a8d92, fx + a, 0, fz + b);
  // cổng chào ra đường Hóng
  for (const x of [tam - 13, tam + 13]) { H(0.9, 7, 0.9, 0xf26fa6, x, 0, 28.6); H(1.1, 0.4, 1.1, 0xd94d8a, x, 7, 28.6); }
  H(27, 1.2, 0.5, 0xf26fa6, tam, 6, 28.6);
  const bang = tamBang("ĐẠI NHẠC HỘI SIÊU NHÂN · 31.10 · 19:30", 25, 1.0, { nen: "#f26fa6", mau: "#ffffff", w: 1024, h: 48, co: 34 });
  bang.position.set(tam, 6.6, 28.6); bang.children.forEach(c => { if (c.position.z > 0) c.position.z = 0.27; else if (c.position.z < 0) c.position.z = -0.27; }); nhom.add(bang);
  // cột đèn trang trí và cờ phướn dọc quảng trường
  for (let z = -2; z <= 26; z += 7) for (const x of [SK.x1 + 1.2, SK.x2 - 1.2]) {
    H(0.14, 6, 0.14, 0x5a5d63, x, 0, z);
    const p = tamBang(z % 2 ? "SIÊU NHÂN\nHỒNG" : "31.10", 0.8, 1.8, { nen: z % 2 ? "#f26fa6" : "#7b2a52", mau: "#ffffff", w: 96, h: 216, co: 26 });
    p.position.set(x + (x < tam ? 0.5 : -0.5), 4.6, z); p.rotation.y = Math.PI / 2; nhom.add(p);
  }
  // xe bán nước, xe chè bên hông quảng trường
  H(1.6, 1.1, 0.8, 0xc0262d, SK.x1 + 2.2, 0, 20); H(1.7, 0.08, 0.9, 0xf6f6f2, SK.x1 + 2.2, 1.9, 20);
  H(1.6, 1.1, 0.8, 0x2e8b57, SK.x2 - 2.2, 0, 21); H(1.7, 0.08, 0.9, 0xffe14d, SK.x2 - 2.2, 1.9, 21);

  // va chạm
  can(SK.x1 - 0.6, SK.x1, SK.z1, 29.9); can(SK.x2, SK.x2 + 0.6, SK.z1, 29.9);
  can(tam - 13.2, tam + 13.2, sauSan - 1, truocSan);                  // sân khấu (không leo lên)
  can(tam - 13, tam + 13, SK.rao - 0.1, SK.rao + 0.2);                 // rào
  for (const s of [-1, 1]) { can(tam + s * 14.8 - 1.1, tam + s * 14.8 + 1.1, truocSan, truocSan + 1.6); can(tam + s * 13.8 - 0.75, tam + s * 13.8 + 0.75, truocSan - 2, truocSan); }
  can(tam + 7.4, tam + 10.6, 17.7, 20.3);
  for (const x of [tam - 13, tam + 13]) can(x - 0.45, x + 0.45, 28.15, 29.05);
  can(SK.x1, SK.x1 + 3, 19.4, 20.6); can(SK.x2 - 3, SK.x2, 20.4, 21.6);
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
    const man = new THREE.Mesh(new THREE.PlaneGeometry(20, 9.4), new THREE.MeshBasicMaterial({ map: this.tex, fog: false }));
    man.position.set(SK.tam, SK.caoSan + 5.1, SK.sauSan + 0.47); this.nhom.add(man);
    this.trang = 0; this.tgVe = 0; this.ve(0);
    // đèn quét trên giàn (chỉ bật đêm diễn)
    this.den = [];
    const vlDen = new THREE.MeshBasicMaterial({ color: 0xff7ac0, transparent: true, opacity: 0.16, depthWrite: false, blending: THREE.AdditiveBlending, side: THREE.DoubleSide, fog: false });
    for (let i = 0; i < 8; i++) {
      const goc = new THREE.Group(); goc.position.set(SK.tam - 11 + i * (22 / 7), 12.3, SK.truocSan + 0.2);
      const geo = new THREE.ConeGeometry(1.6, 13, 14, 1, true); geo.translate(0, -6.5, 0);
      const c = new THREE.Mesh(geo, i % 2 ? vlDen : vlDen.clone()); if (!(i % 2)) c.material.color.set(0x7fd3ff);
      goc.add(c, new THREE.Mesh(new THREE.BoxGeometry(0.4, 0.4, 0.5), vl(0x1c1c1f)));
      this.nhom.add(goc); this.den.push(goc);
    }
    // Siêu Nhân Hồng trên sân khấu
    this.nguyen = taoNguoi("sieu_nhan_hong");
    this.nguyen.group.position.set(SK.tam, SK.caoSan, SK.truocSan - 2.4); this.nhom.add(this.nguyen.group);
    this.micro = new THREE.Mesh(new THREE.CylinderGeometry(0.02, 0.02, 1.5, 6), vl(0x1c1c1f)); this.micro.position.set(SK.tam, SK.caoSan + 0.75, SK.truocSan - 1.8); this.nhom.add(this.micro);
    this.khanGia = null; // dựng khi tới ngày diễn
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
  }
  taoKhanGia() {
    let seed = 3110;
    const rnd = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
    this.khanGia = new THREE.Group(); this.nhom.add(this.khanGia);
    this.nguoiXem = [];
    const so = this.dienThoai ? 30 : 50;
    const vlQue = [0xff4fa3, 0xff7ac0, 0x7fd3ff].map(c => new THREE.MeshBasicMaterial({ color: c, fog: false }));
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
    ly.children[1].position.set(0.02, 0.1, 0); ly.position.set(0, -0.7, 0.06); mai.tayP.add(ly); mai.tayP.userData.coDinh = true; mai.tayP.rotation.x = -0.9;
    mai.group.position.set(SK.tam - 9.4, 0, SK.rao + 0.9); mai.group.rotation.y = Math.PI + 0.25; this.khanGia.add(mai.group);
    this.nguoiXem.push({ nv: mai, loai: "mai", pha: 0, nhay: 0.3 });
  }
  ve(t) {
    const g = this.canvas.getContext("2d"), W = 512, Hh = 256;
    const nen = g.createLinearGradient(0, 0, W, Hh);
    if (this.dien) { const k = (Math.sin(t * 1.3) + 1) / 2; nen.addColorStop(0, `rgb(${150 + k * 90},40,${110 + k * 40})`); nen.addColorStop(1, "#2a0a2a"); }
    else { nen.addColorStop(0, "#3a1030"); nen.addColorStop(1, "#120812"); }
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
    if (!gan) return;
    this.tgVe += dt;
    if (this.tgVe > (this.dien ? 0.12 : 0.5)) { this.tgVe = 0; this._dem = (this._dem || 0) + 1; if (this._dem % (this.dien ? 30 : 8) === 0) this.trang++; this.ve(t); }
    if (!this.dien) return;
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
