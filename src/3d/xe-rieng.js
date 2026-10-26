// Xe máy riêng của người chơi: dựng ở nhà xe nhân viên trước công ty, bấm E để lên / xuống.
// Lái: W ga, S thắng (dừng rồi thì lùi chậm), Shift chạy nhanh hơn; xe quay theo hướng nhìn (chuột / kéo màn hình),
// A D bẻ lái thêm. Va chạm như đi bộ nhưng thân xe lớn hơn; chạy tới cửa công ty thì tự dựng xe ngoài cửa đi bộ vào.
// Góc nhìn 1: thấy đầu xe, tay lái, hai tay nắm tay lái; góc nhìn 3: người chơi ngồi trên xe (dáng ngồi lái).
// Ban đêm bật đèn pha (cùng hệ đèn rẻ của xe ngoài phố), tiếng máy theo tốc độ.
import * as THREE from "three";
import { taoXeMayRieng } from "./xe-3d.js";
import { chiTay, thaTay } from "./nguoi-pho.js";
import { am } from "../am-thanh-game.js";

const NHA_XE = { x: 8.35, z: 23.3, huong: 0 }; // chỗ dựng trong nhà xe nhân viên, đầu xe quay ra cổng
const MAT_LAI = 1.45;      // tầm mắt khi ngồi trên xe
const R_XE = 0.4;          // bán kính va chạm thân xe (xét ở giữa, đầu và đuôi xe)
const DAU = 0.62;          // tâm đầu / đuôi xe cách giữa xe
const gocGiua = (a, b) => Math.atan2(Math.sin(b - a), Math.cos(b - a));
const kep = (v, a, b) => Math.max(a, Math.min(b, v));

export class XeRieng {
  constructor(game) {
    this.g = game;
    this.goc = new THREE.Group();   // vị trí, hướng xe
    this.nghieng = new THREE.Group(); this.goc.add(this.nghieng); // nghiêng khi ôm cua, chống chân khi dựng
    const { group, banh } = taoXeMayRieng(0xc0262d, "ga");
    this.nghieng.add(group); this.banh = banh;
    game.scene.add(this.goc);
    this.dangLai = false; this.v = 0; this.huong = 0; this.lean = 0; this.rung = 0;
    // mục đèn cho giao-thong.js (vẽ chung đèn pha, đèn hậu với xe ngoài phố)
    this.den = { g: this.goc, loai: "xeMay", led: true, bat: false, thang: 0 };
    game.giaoThong.xeRieng = this.den;
    this.veNhaXe();
  }
  get x() { return this.goc.position.x; }
  get z() { return this.goc.position.z; }
  datCho(x, z, huong) { this.goc.position.set(x, 0, z); this.huong = huong; this.goc.rotation.y = huong; this.dung(); }
  dung() { this.nghieng.rotation.set(0, 0, 0.09); this.nghieng.position.y = 0; } // dựng chống nghiêng
  veNhaXe() { if (this.dangLai) return; this.datCho(NHA_XE.x, NHA_XE.z, NHA_XE.huong); }
  // đầu (k = 1) / giữa (0) / đuôi (−1) xe ở vị trí (x, z), hướng h
  diem(x, z, h, k) { return [x + Math.sin(h) * DAU * k, z + Math.cos(h) * DAU * k]; }
  // xe đang dựng chắn chỗ (x, z) với bán kính r (người đi bộ không đi xuyên)
  chan(x, z, r) {
    if (this.dangLai || !this.goc.visible) return false;
    for (const k of [-1, 0, 1]) { const [a, b] = this.diem(this.x, this.z, this.huong, k); if (Math.hypot(a - x, b - z) < 0.3 + r) return true; }
    return false;
  }
  coTheLen() {
    const g = this.g;
    return !this.dangLai && this.goc.visible && g.tang === 0 && !g.oNgoai() && g.vai !== "cho" && Math.hypot(g.p.x - this.x, g.p.z - this.z) < 1.8;
  }

  // ---------- Lên / xuống xe ----------
  len() {
    const g = this.g; if (this.dangLai) return;
    if (g.ngoiDat) g.ngoiDat = null;
    this.dangLai = true; this.v = 0; this.lean = 0;
    g.p.set(this.x, 0, this.z);
    g.yaw = this.huong + Math.PI; g.pitch = -0.12;
    this.nghieng.rotation.set(0, 0, 0);
    // thân người chơi ngồi lên yên; đôi tay góc nhìn 1 đặt lên tay lái
    const than = g.than;
    this.nghieng.add(than.group); than.group.position.set(0, -0.02, -0.2); than.group.rotation.set(0, 0, 0);
    than.ngoi = "nghi"; than.khongUong = true;
    this.nghieng.add(g.tay.group); g.tay.group.position.set(0, MAT_LAI + 0.02, -0.16); g.tay.group.rotation.set(-0.12, Math.PI, 0, "YXZ");
    this.den.bat = true;
    am.phat("de_xe"); am.phat("ghe", this.x, this.z);
    g.capNhatGoc();
  }
  // xuống xe, dựng xe tại chỗ; nga: xe đổ (tai nạn) và người chơi giữ nguyên chỗ
  xuong({ nga = false, tuDong = false } = {}) {
    const g = this.g; if (!this.dangLai) return;
    this.dangLai = false; this.v = 0; this.den.bat = false; this.den.thang = 0;
    am.dongCo(null);
    const than = g.than;
    g.scene.add(than.group); than.group.rotation.set(0, this.huong, 0);
    than.ngoi = false; than.khongUong = false;
    if (than.tayT) { thaTay(than.tayT); thaTay(than.tayP); }
    if (than.chanT) { than.chanT.rotation.z = 0; than.chanP.rotation.z = 0; }
    g.camera.add(g.tay.group); g.tay.group.position.set(0, 0, 0); g.tay.group.rotation.set(0, 0, 0);
    if (nga) { this.nghieng.rotation.set(0, 0, 1.35); this.nghieng.position.y = 0.06; g.capNhatGoc(); return; }
    this.dung();
    // bước xuống bên trái xe (hoặc bên phải, phía sau, phía trước nếu vướng)
    const h = this.huong, trai = h + Math.PI / 2;
    const thu = [[Math.sin(trai) * 0.72, Math.cos(trai) * 0.72], [-Math.sin(trai) * 0.72, -Math.cos(trai) * 0.72], [-Math.sin(h) * 1.35, -Math.cos(h) * 1.35], [Math.sin(h) * 1.35, Math.cos(h) * 1.35]];
    for (const [dx, dz] of thu) {
      const x = this.x + dx, z = this.z + dz;
      if (!g.chanTai(x, z, 0.32, { boXeRieng: true })) { g.p.x = x; g.p.z = z; break; }
    }
    if (tuDong) g.onThongBao?.("Dựng xe ngoài cửa rồi đi bộ vào.");
    am.phat("ghe", this.x, this.z);
    g.capNhatGoc();
  }

  // ---------- Lái ----------
  // f: ga (+) / thắng, lùi (−); s: bẻ lái; nhanh: Shift. Trả về true nếu xe đang chạy.
  lai(dt, f, s, nhanh) {
    const g = this.g;
    const vMax = nhanh ? 12 : 8.5;
    if (f > 0.1) this.v += (this.v < -0.1 ? 7 : (this.v > vMax ? -2.5 : 3.6 * f)) * dt;
    else if (f < -0.1) this.v -= (this.v > 0.2 ? 7.5 : this.v > -1.8 ? 1.4 : 0) * dt;
    else this.v -= Math.sign(this.v) * Math.min(Math.abs(this.v), 1.6 * dt);
    this.v = kep(this.v, -1.8, 12.5);
    this.den.thang += ((f < -0.1 && this.v > 0.2 ? 1 : 0) - this.den.thang) * Math.min(1, dt * 8);
    // A / D: bẻ lái (camera xoay theo), xe quay dần về hướng nhìn; đứng yên thì chỉ xoay chậm (chống chân đẩy xe)
    const av = Math.abs(this.v);
    if (Math.abs(s) > 0.1) g.yaw -= s * (0.7 + Math.min(1, av / 4) * 0.9) * dt;
    const muc = g.yaw + Math.PI, lech = gocGiua(this.huong, muc), toiDa = (0.6 + 1.6 * Math.min(1, av / 3)) * dt;
    const quay = kep(lech, -toiDa, toiDa);
    this.huong += quay * (this.v < -0.1 ? 0.6 : 1);
    this.lean += (kep(-(quay / Math.max(dt, 1e-3)) * this.v * 0.05, -0.38, 0.38) - this.lean) * Math.min(1, dt * 5);
    if (av < 0.01) return false;
    const h = this.huong, d = this.v * dt;
    const nx = this.x + Math.sin(h) * d, nz = this.z + Math.cos(h) * d;
    // tới cửa công ty, cầu thang: dựng xe ngoài cửa đi bộ vào
    if (nz < 15.3 && nz > 11 && nx > -0.8 && nx < 4.8 && g.tang === 0) { this.v = 0; this.xuong({ tuDong: true }); return false; }
    const vc = this.vuong(nx, nz, h, d);
    if (!vc) { this.goc.position.x = nx; this.goc.position.z = nz; }
    else if (vc.xe && vc.xe.loai !== "xeMay" && vc.xe.v > 2.5 && !g.khoa && g.t >= g._anToan) { g.biTong(vc.xe); return false; } // lao vào ô tô đang chạy
    else {
      if (vc.nguoi) g.troChuyenPho.suytTong(vc.nguoi, nx, nz);
      // trượt dọc tường / rào
      const dx = nx - this.x, dz = nz - this.z;
      if (!vc.nguoi && !this.vuong(this.x + dx, this.z, h, d)) this.goc.position.x += dx * 0.6;
      else if (!vc.nguoi && !this.vuong(this.x, this.z + dz, h, d)) this.goc.position.z += dz * 0.6;
      else { if (av > 3.5) { am.phat("va_nhe", nx, nz); this.rung = 0.25; } this.v = 0; }
      if (!vc.nguoi) this.v *= 0.85;
    }
    g.p.set(this.x, 0, this.z);
    return true;
  }
  // xe ở (x, z) hướng h có vướng gì không: null | { vat } | { xe } | { nguoi }
  vuong(x, z, h, d) {
    const g = this.g;
    for (const k of [0, d >= 0 ? 1 : -1]) {
      const [a, b] = this.diem(x, z, h, k), [a0, b0] = this.diem(this.x, this.z, this.huong, k);
      const c = g.chanTai(a, b, R_XE, { boXeRieng: true, tu: [a0, b0] });
      if (c) return c;
    }
    return null;
  }

  // ---------- Mỗi khung hình ----------
  capNhat(dt, t) {
    const g = this.g;
    this.goc.visible = g.tang === 0 && !g.oNgoai();
    if (!this.dangLai) { if (this.goc.visible) this.goc.rotation.y = this.huong; return; }
    this.goc.rotation.y = this.huong;
    this.nghieng.rotation.z = this.lean;
    for (const b of this.banh) b.rotation.x += this.v * dt / 0.28;
    const muc = Math.min(1, Math.abs(this.v) / 12);
    am.dongCo(g.khoa ? 0 : muc);
    if (this.rung > 0) this.rung -= dt;
    void t;
  }
  // camera góc nhìn 1 khi ngồi trên xe (rung nhẹ theo máy)
  datCamera(cam, t) {
    const g = this.g, h = this.huong, rung = Math.sin(t * 47) * 0.003 * (0.4 + Math.abs(this.v) / 12) + (this.rung > 0 ? Math.sin(t * 60) * 0.03 : 0);
    // đầu người lái nghiêng theo xe quanh điểm tiếp đất
    const lx = Math.sin(this.lean) * MAT_LAI;
    cam.position.set(this.x - Math.sin(h) * 0.08 + Math.cos(h) * -lx, MAT_LAI * Math.cos(this.lean) + rung, this.z - Math.cos(h) * 0.08 + Math.sin(h) * lx);
    cam.rotation.set(g.pitch, g.yaw, this.lean * 0.6, "YXZ");
  }
  // dáng ngồi lái (gọi sau than.hoatDong): chân đặt lên sàn xe, hai tay nắm tay lái
  tuThe() {
    const than = this.g.than; if (!than.chanT) return;
    if (than.goiT) { than.chanT.rotation.x = than.chanP.rotation.x = -1.25; than.goiT.rotation.x = than.goiP.rotation.x = 1.2; than.chanT.rotation.z = 0.1; than.chanP.rotation.z = -0.1; }
    else { than.chanT.rotation.x = than.chanP.rotation.x = -1.0; than.chanT.rotation.z = 0.32; than.chanP.rotation.z = -0.32; } // người khối hộp: chân không gập, dạng ra hai bên sàn
    if (than.tayT) { chiTay(than.tayT, -0.29, 1.12, 0.6); chiTay(than.tayP, 0.29, 1.12, 0.6); }
    if (than.dau) than.dau.rotation.set(-0.05, 0, 0);
  }
}
