// Cảnh xỉu và cấp cứu: nhân vật ngã xuống, đồng nghiệp gần đó chạy tới, xe cấp cứu 115 hú còi chạy vào cổng,
// hai nhân viên y tế khiêng cáng vào đưa người chơi ra xe, xe chạy đi. Hết cảnh thì gọi onXong.
import * as THREE from "three";
import { vl, taoNguoi } from "./nhan-vat-3d.js";

const hop = (w, h, d, c, x = 0, y = 0, z = 0) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof c === "number" ? vl(c) : c); m.position.set(x, y, z); return m; };

function taoXeCapCuu() {
  const g = new THREE.Group();
  const trang = 0xf6f6f2;
  g.add(hop(4.4, 2.1, 2.0, trang, -0.4, 1.45, 0));          // thùng xe
  g.add(hop(1.3, 1.5, 1.95, trang, 2.45, 1.15, 0));         // đầu xe
  g.add(hop(0.05, 0.7, 1.7, 0x2a3a4a, 3.1, 1.55, 0));       // kính lái
  g.add(hop(5.8, 0.25, 2.02, 0xc0262d, 0.2, 1.05, 0));      // sọc đỏ
  // chữ thập đỏ và chữ "CẤP CỨU 115" hai bên hông
  const c = document.createElement("canvas"); c.width = 512; c.height = 160; const x = c.getContext("2d");
  x.fillStyle = "#f6f6f2"; x.fillRect(0, 0, 512, 160); x.fillStyle = "#c0262d"; x.fillRect(40, 50, 90, 30); x.fillRect(70, 20, 30, 90);
  x.font = "900 54px 'Be Vietnam Pro', system-ui"; x.textBaseline = "middle"; x.fillText("CẤP CỨU 115", 150, 70, 350);
  x.font = "700 24px 'Be Vietnam Pro', system-ui"; x.fillStyle = "#1f4fa8"; x.fillText("BỆNH VIỆN QUẬN HÓNG", 150, 125, 350);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace;
  for (const s of [-1, 1]) { const p = new THREE.Mesh(new THREE.PlaneGeometry(3.2, 1.0), new THREE.MeshBasicMaterial({ map: t })); p.position.set(-0.4, 1.75, s * 1.01); if (s < 0) p.rotation.y = Math.PI; g.add(p); }
  // bánh xe
  for (const [bx, bz] of [[-1.8, 0.95], [-1.8, -0.95], [2.1, 0.95], [2.1, -0.95]]) { const w = new THREE.Mesh(new THREE.CylinderGeometry(0.42, 0.42, 0.3, 12), vl(0x1a1a1a)); w.rotation.x = Math.PI / 2; w.position.set(bx, 0.42, bz); g.add(w); }
  // đèn ưu tiên đỏ xanh nhấp nháy
  const do_ = new THREE.MeshBasicMaterial({ color: 0xff2a2a }), xanh = new THREE.MeshBasicMaterial({ color: 0x2a6aff });
  const d1 = hop(0.3, 0.18, 0.7, do_, 1.0, 2.6, 0.45), d2 = hop(0.3, 0.18, 0.7, xanh, 1.0, 2.6, -0.45);
  g.add(d1, d2); g.userData.den = [d1, d2];
  return g;
}

function taoYTa(nu) {
  return taoNguoi(null, {
    da: 0xe2b08a, nu, toc: [nu ? "buoi_cao" : "gon", 0x16120f], mat: { mat: "tron", may: "day", mieng: "thang" },
    ao: { kieu: "thun", mau: 0xf6f6f2 }, quan: { kieu: "jogger", mau: 0x1f4fa8 }, giay: ["sneaker", 0xf2f2f2], pk: ["khauTrangVai"], mauKhauTrang: 0x9cc3e6,
  });
}

export class CapCuu {
  // game: Game3D; lyDo: chữ hiện ra; onPha(ten, chu): báo giao diện đổi lớp phủ; onXong(): hết cảnh
  constructor(game, { onPha, onXong }) {
    this.g = game; this.onPha = onPha; this.onXong = onXong;
    this.t = 0; this.pha = "nga";
    const p = game.p; this.P = new THREE.Vector3(p.x, game.tang * 4, p.z); this.tang = game.tang;
    this.ngoaiTroi = this.tang === 0 && !(Math.abs(p.x) < 20.2 && p.z > -14.2 && p.z < 14.2);
    this.nhom = new THREE.Group(); game.scene.add(this.nhom);
    // thân người chơi nằm sóng soài
    const than = game.than.group; this.than = than;
    than.visible = true; than.position.copy(this.P); than.rotation.set(-Math.PI / 2, game.yaw, 0, "YXZ"); than.position.y += 0.18;
    game.tay.group.visible = false;
    // đồng nghiệp ở gần chạy tới vây quanh
    this.dongNghiep = game.npc.filter(n => n.tang === this.tang && n.nv.group.position.distanceTo(this.P) < 18)
      .sort((a, b) => a.nv.group.position.distanceTo(this.P) - b.nv.group.position.distanceTo(this.P)).slice(0, 3)
      .map((n, i) => { const goc = i * 2.1 + 0.6; n.diDao = null; n.nv.ngoi = false; n.nv.vietTay = 0; n.nv.group.position.y = n.tang * 4; return { n, muc: new THREE.Vector3(this.P.x + Math.sin(goc) * 1.1, n.tang * 4, this.P.z + Math.cos(goc) * 1.1) }; });
    // xe cấp cứu và hai nhân viên y tế khiêng cáng
    this.xe = taoXeCapCuu(); this.xe.position.set(-70, 0, 34.7); this.xe.visible = false; this.nhom.add(this.xe);
    this.yta = [taoYTa(false), taoYTa(true)]; for (const y of this.yta) { y.group.visible = false; this.nhom.add(y.group); }
    this.cang = new THREE.Group(); this.cang.add(hop(0.6, 0.08, 2.0, 0xf2f2f2, 0, 0.8, 0), hop(0.62, 0.05, 2.1, 0x8a8d92, 0, 0.74, 0), hop(0.5, 0.06, 0.5, 0x9cc3e6, 0, 0.86, -0.7));
    this.cang.visible = false; this.nhom.add(this.cang);
    this.dangCho = false; // người chơi đã nằm trên cáng chưa
    game.giaoThong.nhom.visible = false; game.giaoThong.anTam = true;
    onPha?.("nga", "");
  }
  // đi thẳng tới điểm với tốc độ v, trả về true khi tới
  diToi(obj, muc, v, dt) {
    const d = new THREE.Vector3(muc.x - obj.position.x, 0, muc.z - obj.position.z), kc = d.length();
    if (kc < 0.08) return true;
    obj.position.x += d.x / kc * Math.min(kc, v * dt); obj.position.z += d.z / kc * Math.min(kc, v * dt);
    obj.rotation.y = Math.atan2(d.x, d.z);
    return false;
  }
  capNhat(dt) {
    const g = this.g, cam = g.camera;
    this.t += dt;
    const t = this.t;
    // đèn xe nhấp nháy
    const [d1, d2] = this.xe.userData.den; const nhay = Math.floor(t * 6) % 2;
    d1.material.color.setHex(nhay ? 0xff2a2a : 0x330808); d2.material.color.setHex(nhay ? 0x0a1640 : 0x2a6aff);
    // đồng nghiệp chạy tới
    for (const { n, muc } of this.dongNghiep) {
      const toi = this.diToi(n.nv.group, muc, 3.2, dt);
      if (toi) n.nv.group.rotation.y = Math.atan2(this.P.x - muc.x, this.P.z - muc.z);
      n.nv.hoatDong(t * 1.4, !toi, 1.4);
    }
    if (this.pha === "nga") {
      // góc nhìn thứ nhất đổ xuống sàn, mờ dần
      const k = Math.min(1, t / 2.2);
      cam.position.set(this.P.x, this.P.y + 1.7 - k * 1.45, this.P.z);
      cam.rotation.set(-0.2 - k * 0.9, g.yaw, k * 1.1, "YXZ");
      g.than.group.visible = false;
      if (t > 2.4) { this.pha = "goi"; this.onPha?.("den", "Đồng nghiệp hoảng hốt gọi cấp cứu 115…"); }
      return;
    }
    if (this.pha === "goi") {
      g.than.group.visible = true;
      if (t > 4.6) { this.pha = "xe_toi"; this.onPha?.("sang", ""); this.xe.visible = true; }
      return;
    }
    // camera đặt ở vỉa hè đối diện cổng, quay theo diễn biến
    const nhin = new THREE.Vector3();
    if (this.pha === "xe_toi") {
      const vx = Math.max(2, 18 - Math.max(0, this.xe.position.x + 20) * 0.7);
      this.xe.position.x = Math.min(4, this.xe.position.x + vx * dt);
      nhin.copy(this.xe.position);
      if (this.xe.position.x >= 4) {
        this.pha = "chay_vao";
        // hai y tá xuống xe với cáng
        this.yta[0].group.position.set(3.2, 0, 33.2); this.yta[1].group.position.set(4.6, 0, 33.2);
        for (const y of this.yta) y.group.visible = true;
        this.cang.visible = true;
        this.duong = [new THREE.Vector3(2, 0, 31.5), new THREE.Vector3(2, 0, 28.5)];
        if (this.ngoaiTroi) this.duong.push(new THREE.Vector3(this.P.x, 0, this.P.z + 1.3)); else this.duong.push(new THREE.Vector3(2, 0, 15.2));
        this.buoc = 0;
      }
    } else if (this.pha === "chay_vao" || this.pha === "chay_ra") {
      const a = this.yta[0].group, b = this.yta[1].group;
      const muc = this.duong[this.buoc];
      const toi = this.diToi(a, muc, 3, dt);
      // người thứ hai đi sau, cáng ở giữa hai người
      const huong = new THREE.Vector3(Math.sin(a.rotation.y), 0, Math.cos(a.rotation.y));
      b.position.set(a.position.x - huong.x * 2.4, 0, a.position.z - huong.z * 2.4); b.rotation.y = a.rotation.y;
      this.cang.position.set((a.position.x + b.position.x) / 2, 0, (a.position.z + b.position.z) / 2); this.cang.rotation.y = a.rotation.y;
      for (const y of this.yta) y.hoatDong(t, !toi, 1.3);
      if (this.dangCho) { g.than.group.position.set(this.cang.position.x, 1.02, this.cang.position.z); g.than.group.rotation.set(-Math.PI / 2, a.rotation.y, 0, "YXZ"); }
      nhin.copy(this.cang.position);
      if (toi) {
        this.buoc++;
        if (this.buoc >= this.duong.length) {
          if (this.pha === "chay_vao") { this.pha = "do_len"; this.tDo = t; if (!this.ngoaiTroi) this.onPha?.("den", "Nhân viên y tế vào trong tòa nhà…"); }
          else { this.pha = "xe_di"; for (const y of this.yta) y.group.visible = false; this.cang.visible = false; g.than.group.visible = false; }
        }
      }
    } else if (this.pha === "do_len") {
      nhin.copy(this.cang.position);
      for (const y of this.yta) y.hoatDong(t, false);
      if (t - this.tDo > 1.6) {
        if (!this.ngoaiTroi) this.onPha?.("sang", "");
        this.dangCho = true; this.pha = "chay_ra";
        this.duong = [new THREE.Vector3(2, 0, 28.5), new THREE.Vector3(2, 0, 31.5), new THREE.Vector3(1.5, 0, 33.4)];
        this.buoc = 0;
      }
    } else if (this.pha === "xe_di") {
      this.tDi = (this.tDi || 0) + dt;
      this.xe.position.x += (2 + this.tDi * 6) * dt;
      nhin.copy(this.xe.position);
      if (this.tDi > 3.2 && !this.daTat) { this.daTat = true; this.onPha?.("den", ""); setTimeout(() => this.onXong?.(), 900); }
    }
    // camera cố định ở vỉa hè bên kia đường, xoay nhìn theo
    cam.position.set(14, 3.2, 39.6); // giữa đường (xe cộ tạm ẩn), không bị cột điện che
    this._nhin = this._nhin ? this._nhin.lerp(nhin.setY(1), Math.min(1, dt * 3)) : nhin.clone().setY(1);
    cam.lookAt(this._nhin);
  }
  huy() { this.nhom.removeFromParent(); this.g.giaoThong.anTam = false; }
}
