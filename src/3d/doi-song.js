// Đời sống của đồng nghiệp: bong bóng thoại trên đầu, tán gẫu với nhau, cử chỉ lặt vặt (ngáp, vươn vai, gọi điện...),
// và các chuyến đi lại trong công ty (toilet, pantry pha cà phê / hâm cơm, máy in, cây nước, sang bàn đồng nghiệp,
// phòng họp, ghế chờ, sân thượng). Đường đi tìm trên lưới dựng từ chính các khối va chạm của từng tầng nên không xuyên
// tường hay đồ đạc. Nhân vật đang do truyện điều khiển (daDoi) thì không đụng tới.
import { heSoDoc } from "../cai-dat.js";
import * as THREE from "three";
import { CHO_NGOI, CAO_TANG, GHE_LE } from "./the-gioi.js";
import { am } from "../am-thanh-game.js";
import { THEO_MA } from "../nhan-vat.js";
import { chonLoi, chonHoiThoai, cauAlo, cauGheCuaTui, cauChoQua } from "../loi-noi-nho.js";

const chon = a => a[Math.floor(Math.random() * a.length)];
const ngau = (a, b) => a + Math.random() * (b - a);
const gocGiua = (a, b) => Math.atan2(Math.sin(b - a), Math.cos(b - a));
const kep = (x, a, b) => Math.max(a, Math.min(b, x));
const PI = Math.PI;

// ---------- Bong bóng thoại ----------
const BB_W = 640, BB_H = 256, BB_RONG = 2.0;
class BongBong {
  constructor(scene) {
    this.cv = document.createElement("canvas"); this.cv.width = BB_W; this.cv.height = BB_H;
    this.tex = new THREE.CanvasTexture(this.cv); this.tex.colorSpace = THREE.SRGBColorSpace;
    this.sp = new THREE.Sprite(new THREE.SpriteMaterial({ map: this.tex, transparent: true, depthWrite: false, opacity: 0 }));
    this.sp.center.set(0.5, 0); this.sp.renderOrder = 12; this.sp.visible = false; this.sp.frustumCulled = false;
    scene.add(this.sp);
    this.n = null; this.t = 0; this.dai = 0;
  }
  ve(chu, mau) {
    const c = this.cv.getContext("2d");
    c.clearRect(0, 0, BB_W, BB_H);
    const hanhDong = chu.startsWith("(");  // tả hành động (chó vẫy đuôi...): chữ nghiêng, màu nhạt
    c.font = `${hanhDong ? "italic 500" : "600"} 31px 'Be Vietnam Pro', system-ui, sans-serif`;
    const dong = []; let d = "";
    for (const w of chu.split(" ")) { const thu = d ? d + " " + w : w; if (d && c.measureText(thu).width > 548) { dong.push(d); d = w; } else d = thu; }
    if (d) dong.push(d);
    if (dong.length > 4) { dong.length = 4; dong[3] += "…"; }
    const LH = 38, rong = Math.min(BB_W - 10, Math.max(120, ...dong.map(x => c.measureText(x).width)) + 46);
    const cao = dong.length * LH + 24, y1 = BB_H - 26, y0 = y1 - cao, x0 = (BB_W - rong) / 2;
    c.fillStyle = "rgba(255,255,255,.96)"; c.strokeStyle = mau; c.lineWidth = 5; c.lineJoin = "round";
    c.beginPath(); c.roundRect(x0, y0, rong, cao, 24); c.fill(); c.stroke();
    c.beginPath(); c.moveTo(BB_W / 2 - 17, y1 - 2); c.lineTo(BB_W / 2 - 2, BB_H - 4); c.lineTo(BB_W / 2 + 15, y1 - 2); c.fill(); c.stroke();
    c.fillRect(BB_W / 2 - 14, y1 - 6, 27, 7); // xóa viền giữa thân bong bóng và đuôi
    c.fillStyle = hanhDong ? "#5d5852" : "#1d1a17"; c.textAlign = "center"; c.textBaseline = "middle";
    dong.forEach((x, i) => c.fillText(x, BB_W / 2, y0 + 12 + LH * (i + 0.5)));
    this.tex.needsUpdate = true;
  }
  hien(n, chu, dai) {
    this.ve(chu, n.mau || THEO_MA[n.ma]?.mau || "#e8702a"); // người đi đường: màu viền riêng (n.mau)
    this.n = n; this.t = 0; this.dai = dai; this.sp.visible = true; this.sp.material.opacity = 0;
  }
  tat() { this.n = null; this.sp.visible = false; }
  capNhat(dt, g) {
    const n = this.n; if (!n) return;
    if (g.khoa || n.daDoi || !n.nv.group.visible || n.tang !== g.tang) { this.tat(); return; }
    this.t += dt;
    const vao = Math.min(1, this.t / 0.22), ra = this.t > this.dai ? 1 - (this.t - this.dai) / 0.45 : 1;
    if (ra <= 0) { this.tat(); return; }
    const q = n.nv.group.position;
    this.sp.position.set(q.x, q.y + n.nv.chieuCao + 0.66, q.z);
    // giữ cỡ chữ gần như không đổi trên màn hình: xa thì phóng to, gần thì thu nhỏ
    const kc = this.sp.position.distanceTo(g.camera.position);
    const k = kep(kc / 3.6, 0.5, 2.6) * (0.86 + 0.14 * vao);
    this.sp.scale.set(BB_RONG * k, BB_RONG * BB_H / BB_W * k, 1);
    this.sp.material.opacity = Math.min(vao, ra);
  }
}

// ---------- Ghế ngồi được (cho người chơi và cho đồng nghiệp đi nghỉ) ----------
// y: hạ thân xuống bao nhiêu khi ngồi; loai: ban (bàn có máy tính), pantry, hop (phòng họp), sofa, cho (ghế chờ), tra_da...
export function taoDsGhe(choNgoiPho = []) {
  const ds = [];
  const them = (tang, x, z, huong, y, loai, chu = null, them_ = null) => ds.push({ tang, x, z, huong, y, loai, chu, id: ds.length, ...them_ });
  // chỗ ngồi riêng của từng người (bàn làm việc, ghế giám đốc, sofa phòng nghệ sĩ, ghế trực của bác bảo vệ...)
  for (const [ma, c] of Object.entries(CHO_NGOI)) if (c.ngoi) them(c.tang, c.x, c.z, c.huong ?? 0, c.yNgoi ?? -0.36, "ban", ma, c.nghi ? { nghi: true } : null);
  for (const c of GHE_LE) them(c.tang, c.x, c.z, c.huong, c.y, c.loai, null, { nghi: !!c.nghi });
  for (const [x, z] of [[12, 6], [16, 6]]) for (const dx of [-0.7, 0.7]) { them(0, x + dx, z + 0.9, PI, -0.36, "pantry"); them(0, x + dx, z - 0.9, 0, -0.36, "pantry"); }
  them(0, -7.4, -9.5, PI, -0.36, "khach"); them(0, -4.6, -9.5, PI, -0.36, "khach");     // ghế khách phòng HR
  for (let i = 0; i < 3; i++) them(0, -0.7 + i * 0.6, 4.2, 0, -0.36, "cho");            // ghế chờ sảnh
  for (const x of [5.7, 6.5, 7.3]) them(0, x, 11.85, PI, -0.4, "sofa");                  // sofa sảnh
  for (let i = 0; i < 4; i++) { them(1, 3.6 + i * 1.6, -10.6, 0, -0.37, "hop"); them(1, 3.6 + i * 1.6, -7.4, PI, -0.37, "hop"); }
  them(1, 16, 0.5, PI, -0.36, "cho"); them(1, 16.7, 0.5, PI, -0.36, "cho");              // ghế chờ hành lang tầng 2
  for (const [x, z] of [[-2, 6], [-1, 6.6], [-3, 6.6]]) them(2, x, z, PI, -0.36, "san_thuong");
  // ghế nhựa quán trà đá vỉa hè
  const P = { pho: true, nghi: true };
  for (const x of [-120, -86, -52, -14, 22, 76, 112]) { them(0, x - 0.6, 43.4, PI / 2, -0.43, "tra_da", null, P); them(0, x + 0.6, 43.4, -PI / 2, -0.43, "tra_da", null, P); them(0, x, 43.95, PI, -0.43, "tra_da", null, P); }
  for (const z of [-40, 0, 64, 100]) { them(0, 44.8, z, PI / 2, -0.43, "tra_da", null, P); them(0, 46, z, -PI / 2, -0.43, "tra_da", null, P); them(0, 45.4, z + 0.55, PI, -0.43, "tra_da", null, P); }
  // ghế nhựa thấp quán cà phê cóc, ghế nhựa trước nhà trong hẻm (thanh-pho.js dựng, ghi vào pho.choNgoi)
  // cà phê cóc nằm sau dãy bàn thấp có rào va chạm nên tầm với (tam) xa hơn
  for (const c of choNgoiPho) them(0, c.x, c.z, c.huong, -0.42, c.loai === "caPhe" ? "ca_phe_coc" : "ghe_hem", null, { ...P, tam: c.loai === "caPhe" ? 1.95 : 1.35 });
  return ds;
}

// ---------- Điểm đến trong công ty ----------
const WC = [15.39, 17.18, 18.97];                     // ba buồng vệ sinh (đứng trước cửa ở z −11.45)
const CAU = {                                         // đi cầu thang giữa các tầng: tới điểm "di", hiện ra ở "toi"
  "0>1": { di: [6.5, 3.7], toi: { tang: 1, x: 5, z: 6.4 } },
  "1>0": { di: [5, 4.9], toi: { tang: 0, x: 4.2, z: 4.4 } },
  "1>2": { di: [5, 12.2], toi: { tang: 2, x: 5, z: 9.8 } },
  "2>1": { di: [5, 10.4], toi: { tang: 1, x: 5, z: 10.9 } },
};
// đồng nghiệp hay ghé bàn ai
const HAY_GHE = {
  thanh_ninh: ["giam_doc"], truong_phong: ["giam_doc", "con_ong_chau_cha", "chua_te_deadline"], quan_ly_idol: ["idol_het_thoi"], editor: ["quan_ly_idol", "idol_het_thoi"],
  idol_het_thoi: ["quan_ly_idol"], sieu_nhan_hong: ["chua_te_deadline", "idol_het_thoi"], hong_hot: ["ran_doc", "chua_te_deadline", "it"], ran_doc: ["hong_hot"],
  chi_dai: ["thuc_tap_sinh", "thanh_ninh"], hr: ["ke_toan", "thanh_xin_nghi"], thuc_tap_sinh: ["chua_te_deadline", "bien_kich"], dan_dau_tu: ["sales", "thanh_xin_nghi"],
  sales: ["designer", "ke_toan", "dan_dau_tu"], designer: ["sales", "bien_kich"], con_ong_chau_cha: ["thanh_xin_nghi", "truong_phong"], it: ["hong_hot", "truong_phong"],
  bien_kich: ["designer", "thuc_tap_sinh"], thanh_xin_nghi: ["hr", "dan_dau_tu"], giam_doc: ["truong_phong", "thanh_ninh"], chua_te_deadline: ["thuc_tap_sinh"],
  bac_bao_ve: ["cho"], ke_toan: ["hr"],
};
// tầm hoạt động của từng tầng (lưới tìm đường)
const KHUNG = { 0: [-23.6, 23.6, -17.6, 29.6], 1: [-19.8, 19.8, -13.8, 13.8], 2: [-19.8, 19.8, -13.8, 13.8] };
const O = 0.35, BK = 0.3; // cỡ ô lưới, bán kính người khi tránh vật cản

export class DoiSong {
  constructor(game) {
    this.g = game;
    this.bong = [new BongBong(game.scene), new BongBong(game.scene)];
    this.hoi = [];       // các cuộc tán gẫu đang diễn ra
    this.hen = [];       // việc hẹn giờ nhỏ (đặt ly xuống, nhấc máy...)
    this.luoi = {};
    this.ghe = taoDsGhe(game.theGioi.pho?.choNgoi || []);
    this.tChuyen = 3; this.tKiem = 1; this.tCu = 1; this.tHoi = 6; this.tBarkSau = 0;
  }

  // ---------- Vòng lặp ----------
  capNhat(dt) {
    const g = this.g;
    if (g.khoa || g.capCuu) { this.dungHet(); for (const b of this.bong) b.capNhat(dt, g); return; }
    this.capNhatHen(dt);
    this.capNhatChuyen(dt);
    this.capNhatHoi(dt);
    this.kiemBark(dt);
    this.kiemCu(dt);
    this.kiemHoi(dt);
    this.xoayMuot(dt);
    for (const b of this.bong) b.capNhat(dt, g);
  }
  henGio(giay, f) { this.hen.push({ t: giay, f }); }
  capNhatHen(dt) {
    if (!this.hen.length) return;
    for (const h of this.hen) h.t -= dt;
    const xong = this.hen.filter(h => h.t <= 0); this.hen = this.hen.filter(h => h.t > 0);
    for (const h of xong) h.f();
  }
  // mở hội thoại / cấp cứu: dừng mọi cuộc tán gẫu, tắt bong bóng
  dungHet() {
    if (this.hoi.length) for (const h of [...this.hoi]) this.ketThucHoi(h);
    for (const b of this.bong) if (b.n) b.tat();
    this.hen.length = 0;
  }
  // nhân vật bị đưa về chỗ / bị truyện gọi đi: bỏ cử chỉ, tán gẫu, bong bóng
  huyNpc(n) {
    n.nv.huyCu?.(); n.nv.quayDau = 0; n.quayMuc = 0; delete n.huongMuc; n.nv.cam = null;
    for (const h of [...this.hoi]) if (h.a === n || h.b === n) this.ketThucHoi(h, n);
    for (const b of this.bong) if (b.n === n) b.tat();
  }
  trongHoi(n) { return this.hoi.some(h => h.a === n || h.b === n); }
  dangDiBo(n) { const b = n.diDao?.buoc[n.diDao.i]; return !!b && (b.loai === "di" || b.loai === "tang" || b.loai === "an"); }
  xoayMuot(dt) {
    const k = Math.min(1, dt * 6);
    for (const n of this.g.npc) {
      if (n.huongMuc != null) {
        const r = n.nv.group.rotation, d = gocGiua(r.y, n.huongMuc);
        if (Math.abs(d) < 0.01) { r.y = n.huongMuc; delete n.huongMuc; } else r.y += d * k;
      }
      if (n.nv.quayDau !== (n.quayMuc ?? 0)) { const d = (n.quayMuc ?? 0) - n.nv.quayDau; n.nv.quayDau = Math.abs(d) < 0.005 ? (n.quayMuc ?? 0) : n.nv.quayDau + d * k; }
    }
  }
  ngu() { const g = this.g; return { gio: g.bauTroi.gio, ngay: g.ngay ?? 1, mua: (g.bauTroi.tt?.mua || 0) > 0, vai: g.vai, tenCua: g.tenCua }; }

  // ---------- Bong bóng ----------
  // uuTien: lời của tán gẫu / câu đáp người chơi được lấy chỗ của bong bóng lẩm bẩm cũ nhất
  noi(n, chu, dai, uuTien = false) {
    if (!chu || this.g.khoa) return null;
    dai ??= kep(2 + chu.length * 0.08, 3, 8) * heSoDoc(); // đủ lâu để đọc, chỉnh theo Tốc độ đọc
    let b = this.bong.find(x => x.n === n) || this.bong.find(x => !x.n);
    if (!b && uuTien) b = [...this.bong].sort((x, y) => y.t / y.dai - x.t / x.dai)[0];
    if (!b) return null;
    b.hien(n, chu, dai);
    return b;
  }
  kiemBark(dt) {
    this.tKiem -= dt; if (this.tKiem > 0) return; this.tKiem = 0.6;
    const g = this.g;
    for (const n of g.npc) if ((n._kc ?? 99) > 8) n.daGap = false;
    if (g.t < this.tBarkSau || !this.bong.some(b => !b.n) || this.hoi.some(h => h.coChu)) return;
    let ng = null;
    for (const n of g.npc) {
      if (n.daDoi || !n.nv.group.visible || n.tang !== g.tang || (n._kc ?? 99) > 5 || (n.tBark ?? 0) > g.t) continue;
      if (this.trongHoi(n) || this.bong.some(b => b.n === n)) continue;
      const q = n.nv.group.position; if (!g.dangThay(n.tang, q.x, q.z)) continue;
      if (!ng || n._kc < ng._kc) ng = n;
    }
    if (!ng) return;
    const moi = !ng.daGap; ng.daGap = true;
    if (Math.random() > (moi ? 0.75 : 0.22)) return;
    let chu, cu = null;
    if (ng.ngu) { if (ng.ma !== "cho") return; chu = "(ngủ say) Khò... khò..."; }
    else { const r = chonLoi(ng.ma, { ...this.ngu(), gan: ng._kc < 2.4 }); if (!r) return; [chu, cu] = r; }
    if (!this.noi(ng, chu)) return;
    if (cu && ng.nv.lamCu && !this.dangDiBo(ng) && !ng.nv.cu) this.lamCu(ng, cu);
    ng.tBark = g.t + ngau(35, 60); this.tBarkSau = g.t + ngau(4, 8);
  }

  // ---------- Cử chỉ ----------
  kiemCu(dt) {
    this.tCu -= dt; if (this.tCu > 0) return; this.tCu = 1;
    const g = this.g, gio = g.bauTroi.gio;
    for (const n of g.npc) {
      const nv = n.nv;
      if (!nv.lamCu || nv.cu || n.daDoi || n.ngu || !nv.group.visible || n.tang !== g.tang || (n._kc ?? 99) > 16) continue;
      if (this.trongHoi(n) || this.dangDiBo(n) || n.tuanTra || Math.random() > 1 / 14) continue;
      this.lamCu(n, this.chonCu(n, gio));
    }
  }
  chonCu(n, gio) {
    const w = { ngap: 0.6, vuon: 0.5, gai_dau: 1, goi_dt: 0.55, uong: 1, xem_dt: 1.5, cuoi: 0.25 };
    if (gio >= 13 && gio < 15.5) { w.ngap *= 4; w.vuon *= 1.5; }
    else if (gio >= 15.5 && gio < 18) { w.vuon *= 4; w.ngap *= 1.5; }
    else if (gio >= 18 || gio < 7) { w.ngap *= 2.5; w.vuon *= 2; }
    else if (gio < 10.5) { w.uong *= 2.5; w.ngap *= 0.5; }
    for (const [k, v] of Object.entries(RIENG[n.ma] || {})) w[k] *= v;
    if (n.nv.ngoi === "nghi") { w.uong *= 3; w.vuon *= 0.3; }
    if (n.tt === "pho") { w.vuon = w.goi_dt = 0; }
    let tong = 0; for (const v of Object.values(w)) tong += v;
    let r = Math.random() * tong; for (const [k, v] of Object.entries(w)) if ((r -= v) <= 0) return k;
    return "xem_dt";
  }
  lamCu(n, loai, dai) {
    if (!n.nv.lamCu || !loai) return;
    n.nv.lamCu(loai, dai);
    const g = this.g, q = n.nv.group.position;
    if (n.tang !== g.tang || (n._kc ?? 99) > 14) return;
    if (loai === "ngap") am.phat("ngap", q.x, q.z);
    else if (loai === "cuoi") am.phat("cuoi", q.x, q.z);
    else if (loai === "vuon" && n.nv.ngoi) am.phat("ghe", q.x, q.z);
    else if (loai === "goi_dt") { am.phat("chuong_dt", q.x, q.z); if (n._kc < 6 && Math.random() < 0.6) this.henGio(1.1, () => { if (n.nv.cu?.loai === "goi_dt") this.noi(n, cauAlo(n.ma)); }); }
    else if (loai === "uong" && n.nv.ngoi) this.henGio(2.8, () => am.phat("dat_ly", q.x, q.z));
  }

  // ---------- Tán gẫu ----------
  ranhNoi(n) {
    const g = this.g;
    return !n.daDoi && !n.ngu && n.nv.group.visible && !n.tuanTra && !this.trongHoi(n) && !this.dangDiBo(n) && (n.tHoiSau ?? 0) < g.t && (n.tt === "ban" || n.tt === "pho");
  }
  kiemHoi(dt) {
    this.tHoi -= dt; if (this.tHoi > 0) return; this.tHoi = ngau(9, 18);
    const g = this.g;
    if (this.hoi.some(h => h.coChu) || Math.random() > 0.55) return;
    const ds = g.npc.filter(n => n.tang === g.tang && (n._kc ?? 99) < 13 && this.ranhNoi(n));
    const cap = [];
    for (let i = 0; i < ds.length; i++) for (let j = i + 1; j < ds.length; j++) {
      const a = ds[i].nv.group.position, b = ds[j].nv.group.position;
      if (Math.hypot(a.x - b.x, a.z - b.z) < 3.7) cap.push([ds[i], ds[j]]);
    }
    if (!cap.length) return;
    const [a, b] = chon(cap);
    this.batDauHoi(a, b);
  }
  batDauHoi(a, b, buoc = false) {
    let dong = chonHoiThoai(a.ma, b.ma, this.ngu());
    if (!dong) { if (!buoc) return null; dong = [{ ai: a.ma, nghe: b.ma, chu: "" }, { ai: b.ma, nghe: a.ma, chu: "" }, { ai: a.ma, nghe: b.ma, chu: "" }]; }
    const h = { a, b, dong, i: -1, t: 0.4 };
    for (const [p, o] of [[a, b], [b, a]]) {
      const P = p.nv.group.position, Q = o.nv.group.position, huong = Math.atan2(Q.x - P.x, Q.z - P.z);
      p.huongGoc = p.huongMuc ?? p.nv.group.rotation.y;
      if (p.nv.ngoi) { // đang ngồi: xoay ghế một chút, quay đầu phần còn lại
        const d = gocGiua(p.huongGoc, huong), than = kep(d, -0.75, 0.75);
        p.huongMuc = p.huongGoc + than; p.quayMuc = kep(d - than, -0.7, 0.7);
      } else { p.huongMuc = huong; p.quayMuc = 0; }
    }
    this.hoi.push(h);
    return h;
  }
  ketThucHoi(h, boQua = null) { // boQua: người đang bị đưa đi chỗ khác, không xoay về
    this.hoi = this.hoi.filter(x => x !== h);
    for (const p of [h.a, h.b]) {
      p.quayMuc = 0; p.tHoiSau = this.g.t + ngau(35, 80);
      if (p !== boQua && !p.daDoi && !this.dangDiBo(p) && p.huongGoc != null) p.huongMuc = p.huongGoc;
      for (const b of this.bong) if (b.n === p && b.t < b.dai) b.dai = Math.min(b.dai, b.t + 0.6);
    }
  }
  ketThucHoiCua(n) { for (const h of [...this.hoi]) if (h.a === n || h.b === n) this.ketThucHoi(h); }
  capNhatHoi(dt) {
    const g = this.g;
    for (const h of [...this.hoi]) {
      const { a, b } = h, A = a.nv.group.position, B = b.nv.group.position;
      if (a.daDoi || b.daDoi || !a.nv.group.visible || !b.nv.group.visible || a.tang !== b.tang || Math.hypot(A.x - B.x, A.z - B.z) > 4.6) { this.ketThucHoi(h); continue; }
      h.t -= dt; if (h.t > 0) continue;
      h.i++;
      if (h.i >= h.dong.length) { this.ketThucHoi(h); continue; }
      const l = h.dong[h.i], S = l.ai === a.ma ? a : b, N = S === a ? b : a;
      const dai = (l.chu ? kep(2 + l.chu.length * 0.08, 3, 8) : ngau(2.5, 4)) * heSoDoc(); // đủ lâu để đọc
      h.t = dai + 0.3;
      h.coChu = false;
      if (l.chu && S.tang === g.tang && (S._kc ?? 99) < 13) h.coChu = !!this.noi(S, l.chu, dai, true);
      if (S.nv.lamCu) { if (l.cu) this.lamCu(S, l.cu); else S.nv.lamCu("noi", dai * 0.9); }
      this.henGio(Math.min(dai * 0.65, dai - 0.6), () => {
        if (!this.hoi.includes(h) || !N.nv.lamCu) return;
        const cu = l.cuNghe || (Math.random() < 0.35 ? "gat_dau" : null);
        if (cu) this.lamCu(N, cu);
      });
    }
  }

  // ---------- Lưới tìm đường ----------
  luoiTang(tang) {
    if (this.luoi[tang]) return this.luoi[tang];
    const [x0, x1, z0, z1] = KHUNG[tang], nx = Math.ceil((x1 - x0) / O), nz = Math.ceil((z1 - z0) / O);
    const chan = new Uint8Array(nx * nz);
    const danh = (a, b, c, d) => {
      const i0 = Math.max(0, Math.floor((a - BK - x0) / O)), i1 = Math.min(nx - 1, Math.floor((b + BK - x0) / O));
      const j0 = Math.max(0, Math.floor((c - BK - z0) / O)), j1 = Math.min(nz - 1, Math.floor((d + BK - z0) / O));
      for (let j = j0; j <= j1; j++) { const cz = z0 + (j + 0.5) * O; if (cz <= c - BK || cz >= d + BK) continue;
        for (let i = i0; i <= i1; i++) { const cx = x0 + (i + 0.5) * O; if (cx > a - BK && cx < b + BK) chan[j * nx + i] = 1; } }
    };
    for (const b of this.g.theGioi.vat[tang] || []) if (b.maxX > x0 && b.minX < x1 && b.maxZ > z0 && b.minZ < z1) danh(b.minX, b.maxX, b.minZ, b.maxZ);
    // ghế ngồi riêng (ghế bàn chung không có khối va chạm): vẫn tránh đi xuyên qua
    for (const c of [...Object.values(CHO_NGOI), ...GHE_LE]) if ((c.ngoi || c.loai) && c.tang === tang) danh(c.x - 0.26, c.x + 0.26, c.z - 0.26, c.z + 0.26);
    return (this.luoi[tang] = { x0, z0, nx, nz, chan });
  }
  o(L, x, z) { const i = Math.floor((x - L.x0) / O), j = Math.floor((z - L.z0) / O); return i < 0 || j < 0 || i >= L.nx || j >= L.nz ? -1 : j * L.nx + i; }
  tam(L, k) { return [L.x0 + ((k % L.nx) + 0.5) * O, L.z0 + (Math.floor(k / L.nx) + 0.5) * O]; }
  trong(L, x, z, tranh) {
    const k = this.o(L, x, z); if (k < 0 || L.chan[k]) return false;
    return !tranh || Math.hypot(x - tranh[0], z - tranh[1]) > 0.95;
  }
  gan(L, x, z, tranh) { // ô trống gần nhất
    const k0 = this.o(L, x, z); if (k0 < 0) return -1;
    const i0 = k0 % L.nx, j0 = Math.floor(k0 / L.nx);
    for (let r = 0; r <= 7; r++) {
      let tot = -1, dTot = Infinity;
      for (let j = j0 - r; j <= j0 + r; j++) for (let i = i0 - r; i <= i0 + r; i++) {
        if (Math.max(Math.abs(i - i0), Math.abs(j - j0)) !== r || i < 0 || j < 0 || i >= L.nx || j >= L.nz) continue;
        const k = j * L.nx + i, [cx, cz] = this.tam(L, k);
        if (!this.trong(L, cx, cz, tranh)) continue;
        const d = Math.hypot(cx - x, cz - z); if (d < dTot) { dTot = d; tot = k; }
      }
      if (tot >= 0) return tot;
    }
    return -1;
  }
  thay(L, a, b, tranh) { // đường thẳng a→b không vướng
    const d = Math.hypot(b[0] - a[0], b[1] - a[1]), n = Math.ceil(d / 0.12);
    for (let i = 1; i < n; i++) { const t = i / n; if (!this.trong(L, a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t, tranh)) return false; }
    return true;
  }
  // tìm đường trên tầng: trả về dãy điểm [x, z] (không gồm điểm xuất phát), hoặc null
  timDuong(tang, tu, toi, tranh = null) {
    const L = this.luoiTang(tang);
    const s = this.gan(L, tu[0], tu[1], tranh), e = this.gan(L, toi[0], toi[1], tranh);
    if (s < 0 || e < 0) return null;
    const N = L.nx * L.nz, gS = new Float32Array(N).fill(Infinity), tu_ = new Int32Array(N).fill(-1), dong = new Uint8Array(N);
    const heap = [], day = (f, k) => { heap.push([f, k]); let i = heap.length - 1; while (i > 0) { const p = (i - 1) >> 1; if (heap[p][0] <= heap[i][0]) break; [heap[p], heap[i]] = [heap[i], heap[p]]; i = p; } };
    const lay = () => { const top = heap[0], cuoi = heap.pop(); if (heap.length) { heap[0] = cuoi; let i = 0; for (;;) { const l = 2 * i + 1, r = l + 1; let m = i; if (l < heap.length && heap[l][0] < heap[m][0]) m = l; if (r < heap.length && heap[r][0] < heap[m][0]) m = r; if (m === i) break; [heap[m], heap[i]] = [heap[i], heap[m]]; i = m; } } return top; };
    const ei = e % L.nx, ej = Math.floor(e / L.nx), h = k => { const di = Math.abs(k % L.nx - ei), dj = Math.abs(Math.floor(k / L.nx) - ej); return Math.max(di, dj) + 0.414 * Math.min(di, dj); };
    const tuDo = k => { if (L.chan[k]) return false; if (!tranh) return true; const [cx, cz] = this.tam(L, k); return Math.hypot(cx - tranh[0], cz - tranh[1]) > 0.95; };
    gS[s] = 0; day(h(s), s);
    let lap = 0;
    while (heap.length && lap++ < 40000) {
      const [, k] = lay(); if (dong[k]) continue; dong[k] = 1;
      if (k === e) break;
      const i = k % L.nx, j = Math.floor(k / L.nx);
      for (let dj = -1; dj <= 1; dj++) for (let di = -1; di <= 1; di++) {
        if (!di && !dj) continue;
        const ni = i + di, nj = j + dj; if (ni < 0 || nj < 0 || ni >= L.nx || nj >= L.nz) continue;
        const nk = nj * L.nx + ni; if (dong[nk] || !tuDo(nk)) continue;
        if (di && dj && (!tuDo(j * L.nx + ni) || !tuDo(nj * L.nx + i))) continue; // không cắt góc
        const ng = gS[k] + (di && dj ? 1.414 : 1);
        if (ng < gS[nk]) { gS[nk] = ng; tu_[nk] = k; day(ng + h(nk), nk); }
      }
    }
    if (!dong[e]) return null;
    const o = []; for (let k = e; k >= 0; k = tu_[k]) { o.push(this.tam(L, k)); if (k === s) break; }
    o.reverse();
    // kéo thẳng: bỏ các điểm giữa khi nhìn thẳng thấy được điểm xa hơn
    const gon = [o[0]];
    for (let i = 0; i < o.length - 1;) {
      let j = o.length - 1; while (j > i + 1 && !this.thay(L, o[i], o[j], tranh)) j--;
      gon.push(o[j]); i = j;
    }
    // đoạn đầu: từ chỗ đang đứng (có thể là ghế) ra ô trống; đoạn cuối: từ ô trống vào đúng điểm đến
    const dau = [tu[0], tu[1]];
    if (gon.length > 1 && this.thay(L, dau, gon[1], tranh)) gon.shift();
    const ra = [...gon, [toi[0], toi[1]]];
    if (ra.length > 2 && this.thay(L, ra[ra.length - 3], ra[ra.length - 1], tranh)) ra.splice(ra.length - 2, 1);
    return ra;
  }

  // ---------- Đi lại ----------
  oNha(n) { const q = n.nv.group.position; return n.tang === n.cho.tang && Math.hypot(q.x - n.cho.x, q.z - n.cho.z) < 0.3; }
  ranhDi(n) {
    return n.tt === "ban" && !n.daDoi && !n.diDao && !n.ngu && !n.tuanTra && n.nv.group.visible && this.oNha(n) && !this.trongHoi(n) && (n.tChuyenSau ?? 0) < this.g.t;
  }
  capNhatChuyen(dt) {
    this.tChuyen -= dt;
    if (this.tChuyen <= 0) { this.tChuyen = ngau(4, 9); this.chonChuyen(); this.timNguoiLac(); }
    for (const n of this.g.npc) if (n.diDao && !n.daDoi) this.buocChuyen(n, dt);
  }
  chonChuyen() {
    const g = this.g;
    if (g.npc.filter(n => n.diDao).length >= 5) return;
    const ranh = g.npc.filter(n => this.ranhDi(n)); if (!ranh.length) return;
    const w = ranh.map(n => (n.tang === g.tang && (n._kc ?? 99) < 25 ? 3 : 1));
    let r = Math.random() * w.reduce((a, b) => a + b, 0), n = ranh[0];
    for (let i = 0; i < ranh.length; i++) if ((r -= w[i]) <= 0) { n = ranh[i]; break; }
    const buoc = this.lapChuyen(n);
    if (!buoc) { n.tChuyenSau = g.t + 20; return; }
    n.diDao = { buoc, i: 0, _am: true };
    n.nv.huyCu?.();
  }
  // người đứng không đúng chỗ mà chẳng có việc gì (sau cấp cứu, sau cảnh truyện...): đi về chỗ
  timNguoiLac() {
    const g = this.g;
    for (const n of g.npc) {
      if (n.tt !== "ban" || n.diDao || n.daDoi || !n.nv.group.visible || this.trongHoi(n) || this.oNha(n)) continue;
      const q = n.nv.group.position;
      if (n.tang === n.cho.tang) { n.nv.ngoi = false; q.y = n.tang * CAO_TANG; n.diDao = { buoc: [{ loai: "di", x: n.cho.x, z: n.cho.z }, { loai: "ve" }], i: 0, _am: true }; }
      else if (!g.dangThay(n.tang, q.x, q.z) && !g.dangThay(n.cho.tang, n.cho.x, n.cho.z)) g.veCho(n);
    }
  }
  gheTrong(gh) {
    const g = this.g;
    if (g.ngoiGhe === gh) return false;
    for (const n of g.npc) {
      if (n.diDao?.ghe === gh || n.diDao?.buoc.some(b => b.ghe === gh)) return false;
      if (n.nv.group.visible && n.tang === gh.tang && Math.hypot(n.nv.group.position.x - gh.x, n.nv.group.position.z - gh.z) < 0.5) return false;
    }
    return true;
  }
  // dựng một chuyến đi cho người n: danh sách bước
  lapChuyen(n) {
    const g = this.g, gio = g.bauTroi.gio, ma = n.ma, nha = n.cho.tang;
    const ds = []; let tangNay = nha;
    const toi = (tang, x, z, huong) => {
      while (tangNay !== tang) { const k = `${tangNay}>${tangNay + (tang > tangNay ? 1 : -1)}`, c = CAU[k]; ds.push({ loai: "di", x: c.di[0], z: c.di[1] }, { loai: "tang", ...c.toi }); tangNay = c.toi.tang; }
      ds.push({ loai: "di", x, z, huong });
    };
    const ve = () => { toi(nha, n.cho.x, n.cho.z); ds.push({ loai: "ve" }); return ds; };
    const ngoiGhe = (loai, giay, cu) => {
      const gh = this.ghe.filter(x => x.loai === loai && this.gheTrong(x)); if (!gh.length) return false;
      const c = chon(gh); toi(c.tang, c.x, c.z); ds.push({ loai: "ngoi", ghe: c, giay, cu }); return true;
    };
    if (ma === "cho") { // chó đi loanh quanh sân, ngửi ngửi
      const [x, z] = chon([[-1.5, 22.5], [2.5, 21], [-6.5, 19.5], [0.5, 26], [-10.5, 25.5], [6, 25]]);
      toi(0, x, z, ngau(-PI, PI)); ds.push({ loai: "lam", giay: ngau(4, 9) }); return ve();
    }
    if (ma === "bac_bao_ve") {
      if (Math.random() < 0.6) { toi(0, 1.6, 27.4, 0); ds.push({ loai: "lam", giay: ngau(6, 12), cu: "uong" }); }
      else { toi(0, 0.5, 18.5, PI); ds.push({ loai: "lam", giay: ngau(5, 9) }); }
      return ve();
    }
    const T = [];
    const them = (w, f) => { if (w > 0) T.push([w, f]); };
    const trua = gio >= 11.7 && gio < 13.3, sang = gio < 10.5, chieu = gio >= 14 && gio < 16.5;
    const muaToi = (g.bauTroi.tt?.mua || 0) > 0 || gio >= 18.5;
    them(nha === 0 ? 1.1 : 0.7, () => { // toilet: vào buồng, lát sau ra rửa tay
      const dung = new Set(g.npc.map(m => m.diDao?.buoc.find(b => b.wc != null)?.wc).filter(x => x != null));
      const con = WC.map((_, i) => i).filter(i => !dung.has(i)); if (!con.length) return false;
      const i = chon(con); toi(0, WC[i], -11.45, PI); ds.push({ loai: "lam", giay: 0.5 }, { loai: "an", giay: ngau(14, 32), wc: i });
      toi(0, 13.2, chon([-8.1, -9.6]), -PI / 2); ds.push({ loai: "lam", giay: ngau(3, 5), tay: 1, am: "voi_nuoc" });
      return true;
    });
    them(sang ? 2.2 : chieu ? 1.6 : 0.6, () => { // pha cà phê, có khi ngồi pantry uống luôn
      toi(0, 12.0, 12.05, 0); ds.push({ loai: "lam", giay: ngau(5, 8), tay: 1, am: "may_ca_phe", cam: "coc" });
      if (Math.random() < 0.5) ngoiGhe("pantry", ngau(25, 50), "uong");
      return true;
    });
    them(trua && n.tt === "ban" ? 3 : 0, () => { // hâm cơm hộp rồi ngồi ăn
      toi(0, 19.2, 11.55, 0); ds.push({ loai: "lam", giay: 3, tay: 1, am: "tu_lanh" });
      toi(0, 14.5, 12.05, 0); ds.push({ loai: "lam", giay: ngau(9, 13), tay: 0.5, am: "lo_vi_song" });
      if (!ngoiGhe("pantry", ngau(45, 80))) ngoiGhe("sofa", ngau(40, 70));
      return true;
    });
    them(0.4, () => { toi(0, 19.2, 11.55, 0); ds.push({ loai: "lam", giay: ngau(3, 6), tay: 1, am: "tu_lanh" }); return true; });
    them(nha === 0 ? 1 : 0.2, () => { // uống nước
      const [x, z, h] = chon([[-3.2, -0.25, PI], [7.75, 10.4, PI / 2]]);
      toi(0, x, z, h); ds.push({ loai: "lam", giay: ngau(4, 7), tay: 1, am: "ong_nuoc" }); return true;
    });
    them(n.cho.ban ? 1 : nha === 0 ? 0.4 : 0, () => { toi(0, -3.2, 11.85, 0); ds.push({ loai: "lam", giay: ngau(5, 9), tay: 1, am: "may_in" }); return true; });
    them(n.cho.ban ? 0.6 : 0, () => { toi(0, -18.6, chon([10.7, 11.6, 12.6]), -PI / 2); ds.push({ loai: "lam", giay: ngau(4, 8), tay: 1, am: "ho_so" }); return true; });
    them(0.3, () => ngoiGhe(nha === 0 ? "sofa" : "cho", ngau(20, 40), "xem_dt"));
    them(nha === 1 ? 0.9 : 0.15, () => ngoiGhe("hop", ngau(30, 60), "xem_dt"));
    them(nha === 1 ? 0.4 : 0, () => ngoiGhe("cho", ngau(20, 40), "xem_dt"));
    them(muaToi ? 0 : nha === 1 ? 0.35 : 0.12, () => ngoiGhe("san_thuong", ngau(40, 80), "vuon"));
    // sang bàn đồng nghiệp tán gẫu
    const ban = (HAY_GHE[ma] || []).map(m => g.npc.find(x => x.ma === m)).filter(m => m && this.coTheTham(m) && (m.tang === nha || Math.random() < 0.5));
    const lan = g.npc.filter(m => m !== n && m.ma !== "cho" && this.coTheTham(m) && m.tang === nha && Math.hypot(m.cho.x - n.cho.x, m.cho.z - n.cho.z) < 14);
    them(ban.length ? 2.2 : lan.length ? 1 : 0, () => {
      const m = ban.length && Math.random() < 0.75 ? chon(ban) : lan.length ? chon(lan) : null; if (!m) return false;
      const d = this.choDungCanh(m); if (!d) return false;
      toi(m.tang, d[0], d[1], Math.atan2(m.cho.x - d[0], m.cho.z - d[1])); ds.push({ loai: "tham", m });
      return true;
    });
    if (!T.length) return null;
    for (let lan2 = 0; lan2 < 3; lan2++) {
      let r = Math.random() * T.reduce((a, b) => a + b[0], 0), f = T[0][1];
      for (const [w, ff] of T) if ((r -= w) <= 0) { f = ff; break; }
      ds.length = 0; tangNay = nha;
      if (f()) return ve();
    }
    return null;
  }
  coTheTham(m) { return m.tt === "ban" && !m.diDao && !m.daDoi && !m.ngu && m.nv.group.visible && this.oNha(m) && !this.trongHoi(m) && m.ma !== this.g.vai; }
  // chỗ đứng cạnh bàn một người (cách 0,8 – 1,1 m, không vướng đồ)
  choDungCanh(m) {
    const L = this.luoiTang(m.tang), c = m.cho;
    // người ngồi: đứng cạnh hông hoặc chếch sau lưng (mẫu tính cho ghế quay về −z, xoay theo hướng ghế)
    const h = (c.huong ?? 0) - PI, ch = Math.cos(h), sh = Math.sin(h);
    const thu = c.ngoi ? [[0.85, 0.15], [-0.85, 0.15], [0.6, 0.85], [-0.6, 0.85]].map(([x, z]) => [x * ch + z * sh, -x * sh + z * ch]) : [];
    for (let i = 0; i < 8; i++) { const a = (c.huong ?? 0) + i * PI / 4; thu.push([Math.sin(a) * 1.05, Math.cos(a) * 1.05]); }
    for (const [dx, dz] of thu) if (this.trong(L, c.x + dx, c.z + dz) && this.thay(L, [c.x + dx, c.z + dz], [c.x + dx * 0.4, c.z + dz * 0.4])) return [c.x + dx, c.z + dz];
    for (const [dx, dz] of thu) if (this.trong(L, c.x + dx, c.z + dz)) return [c.x + dx, c.z + dz];
    return null;
  }
  // không tìm được đường: chờ lúc người chơi không nhìn rồi về chỗ
  huyChuyen(n) { n.tChuyenSau = this.g.t + 30; n.nv.vietTay = 0; n.diDao = { buoc: [{ loai: "doi" }], i: 0, _am: true }; }
  tiep(n) { const dd = n.diDao; dd.i++; if (dd.i >= dd.buoc.length) this.g.veCho(n); }
  buocChuyen(n, dt) {
    const g = this.g, dd = n.diDao, b = dd.buoc[dd.i], nv = n.nv, q = nv.group.position;
    if (!b) { g.veCho(n); return; }
    const gan = n.tang === g.tang && (n._kc ?? 99) < 16;
    switch (b.loai) {
      case "di": {
        if (!b.duong) {
          nv.ngoi = false; nv.vietTay = 0; q.y = n.tang * CAO_TANG;
          b.duong = this.timDuong(n.tang, [q.x, q.z], [b.x, b.z], b.tranh);
          if (!b.duong) { if (b.tranh) { b.tranh = null; return; } this.huyChuyen(n); return; }
          b.j = 0; b.ket = 0;
        }
        const [tx, tz] = b.duong[b.j];
        const dx = tx - q.x, dz = tz - q.z, kc = Math.hypot(dx, dz);
        if (kc < 0.05) {
          b.j++;
          if (b.j >= b.duong.length) { if (b.huong != null) n.huongMuc = b.huong; this.tiep(n); }
          return;
        }
        // nhường đường người chơi; kẹt lâu thì xin qua rồi tìm đường vòng
        if (g.tang === n.tang && !g.khoa) {
          const px = g.p.x - q.x, pz = g.p.z - q.z, kp = Math.hypot(px, pz);
          if (kp < 0.95 && (px * dx + pz * dz) > 0) {
            b.ket += dt;
            if (b.ket > 1.6 && !b.daXin) { b.daXin = true; if (kp < 2) this.noi(n, cauChoQua(n.ma)); }
            const cuoi = dd.buoc[dd.i + 1]?.loai === "ve" && b.j >= b.duong.length - 2;
            if (b.ket > 3.5 && cuoi && g.ngoiGhe?.chu === n.ma) { this.tiep(n); return; }
            if (b.ket > 3.5) { b.duong = null; b.tranh = [g.p.x, g.p.z]; }
            return;
          }
        }
        b.ket = 0;
        const toc = (n.ma === "cho" ? 1.6 : 1.15) * dt, buoc = Math.min(kc, toc);
        q.x += dx / kc * buoc; q.z += dz / kc * buoc;
        const r = nv.group.rotation; r.y += gocGiua(r.y, Math.atan2(dx, dz)) * Math.min(1, dt * 10);
        delete n.huongMuc;
        n.dangDi = true;
        return;
      }
      case "lam": {
        if (b.t == null) {
          b.t = b.giay; nv.vietTay = b.tay ?? 0;
          if (b.am && gan) am.phat(b.am, q.x, q.z);
          if (b.cu) this.henGio(ngau(0.5, Math.max(0.6, b.giay - 3)), () => { if (n.diDao === dd && !nv.cu) this.lamCu(n, b.cu); });
        }
        b.t -= dt;
        if (b.t <= 0) { nv.vietTay = 0; if (b.cam) nv.cam = b.cam; this.tiep(n); }
        return;
      }
      case "ngoi": {
        if (b.t == null) {
          const gh = b.ghe;
          if (g.ngoiGhe === gh || g.npc.some(m => m !== n && m.nv.group.visible && m.tang === gh.tang && Math.hypot(m.nv.group.position.x - gh.x, m.nv.group.position.z - gh.z) < 0.45)) { this.tiep(n); return; }
          b.t = b.giay; dd.ghe = gh;
          nv.ngoi = "nghi"; nv.vietTay = 0; q.set(gh.x, gh.tang * CAO_TANG + gh.y, gh.z); nv.group.rotation.y = gh.huong; delete n.huongMuc;
          if (gan) am.phat("ghe", gh.x, gh.z);
          b.tCu = ngau(3, 8);
        }
        b.t -= dt; b.tCu -= dt;
        if (b.cu && b.tCu <= 0 && !nv.cu && !this.trongHoi(n)) { b.tCu = ngau(9, 18); this.lamCu(n, b.cu); }
        if (b.t <= 0 && !this.trongHoi(n)) {
          nv.ngoi = false; q.y = n.tang * CAO_TANG; dd.ghe = null; nv.cam = null;
          if (gan) am.phat("ghe", q.x, q.z);
          this.tiep(n);
        }
        return;
      }
      case "an": { // vào buồng vệ sinh, đóng cửa
        if (b.t == null) { b.t = b.giay; nv.group.visible = false; if (gan) am.phat("cua_dong", q.x, q.z); }
        b.t -= dt;
        if (b.t <= 0) { nv.group.visible = true; if (n.tang === g.tang && Math.hypot(g.p.x - q.x, g.p.z - q.z) < 16) { am.phat("xa_nuoc", q.x, q.z - 1.2); this.henGio(0.8, () => am.phat("cua_mo", q.x, q.z)); } this.tiep(n); }
        return;
      }
      case "tang": { // lên / xuống cầu thang: khuất tầm nhìn thì đổi tầng
        b.cho = (b.cho ?? 0) + dt;
        const thay = g.dangThay(n.tang, q.x, q.z) || g.dangThay(b.tang, b.x, b.z);
        if (b.an == null) { if (thay && b.cho < 7) return; b.an = 1.6; nv.group.visible = false; return; }
        b.an -= dt; if (b.an > 0) return;
        n.tang = b.tang; q.set(b.x, b.tang * CAO_TANG, b.z); nv.group.visible = true;
        this.tiep(n);
        return;
      }
      case "tham": { // đứng cạnh bàn đồng nghiệp nói chuyện
        if (b.t == null) {
          b.t = 26;
          const m = b.m;
          b.h = m.tt === "ban" && !m.daDoi && !m.diDao && m.nv.group.visible && !this.trongHoi(m) && this.oNha(m) ? this.batDauHoi(n, m, true) : null;
          if (!b.h) { this.tiep(n); return; }
        }
        b.t -= dt;
        if (b.t <= 0 || !this.hoi.includes(b.h)) { if (this.hoi.includes(b.h)) this.ketThucHoi(b.h); this.tiep(n); }
        return;
      }
      case "ve": { // về tới chỗ: nếu người chơi đang ngồi ghế mình thì đứng chờ bên cạnh
        if (g.ngoiGhe?.chu === n.ma) {
          b.cho = (b.cho ?? 0) - dt;
          if (b.cho <= 0) {
            b.cho = 6;
            if (!b.daNoi && n.tang === g.tang && (n._kc ?? 99) < 5) { b.daNoi = true; this.noi(n, cauGheCuaTui(n.ma), undefined, true); }
            n.huongMuc = Math.atan2(g.p.x - q.x, g.p.z - q.z);
          }
          return;
        }
        g.veCho(n); n.tChuyenSau = g.t + ngau(35, 90);
        return;
      }
      case "doi": {
        if (!g.dangThay(n.tang, q.x, q.z) && !g.dangThay(n.cho.tang, n.cho.x, n.cho.z)) g.veCho(n);
        return;
      }
      default: this.tiep(n);
    }
  }
  huy() { for (const b of this.bong) { b.sp.parent?.remove(b.sp); b.tex.dispose(); b.sp.material.dispose(); } }
}

// cử chỉ hay làm của từng người (hệ số nhân)
const RIENG = {
  quan_ly_idol: { goi_dt: 6 }, sales: { goi_dt: 4 }, hong_hot: { xem_dt: 3, cuoi: 4 }, dan_dau_tu: { xem_dt: 3, gai_dau: 2 },
  editor: { ngap: 3, uong: 2 }, thanh_xin_nghi: { goi_dt: 2, ngap: 2 }, chua_te_deadline: { ngap: 2, vuon: 2 }, designer: { gai_dau: 2.5 },
  thuc_tap_sinh: { gai_dau: 2.5 }, idol_het_thoi: { xem_dt: 2.5 }, con_ong_chau_cha: { xem_dt: 2, goi_dt: 2.5 }, bac_bao_ve: { uong: 3, ngap: 1.5, xem_dt: 0.2 },
  giam_doc: { goi_dt: 2.5 }, hr: { uong: 3 }, ke_toan: { gai_dau: 1.5 }, it: { gai_dau: 2 }, truong_phong: { xem_dt: 1.5 }, bien_kich: { gai_dau: 2 },
};
