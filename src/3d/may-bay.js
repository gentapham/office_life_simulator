// Máy bay hãng G-Airplane thỉnh thoảng bay ngang trên cao: một khối gộp duy nhất (thân, cánh, đuôi, chữ hãng),
// đèn hàng không nhấp nháy ban đêm. Mỗi 1,5 – 4 phút một chuyến, bay qua gần đầu người chơi rồi khuất vào sương.
import * as THREE from "three";
import { mergeGeometries } from "three/addons/utils/BufferGeometryUtils.js";

function veChu() {
  const c = document.createElement("canvas"); c.width = 512; c.height = 64;
  const g = c.getContext("2d");
  g.fillStyle = "#ffffff"; g.fillRect(0, 0, 512, 64);
  g.fillStyle = "#e8702a"; g.fillRect(0, 44, 512, 10);
  g.fillStyle = "#1f2a44"; g.font = "800 38px 'Be Vietnam Pro', system-ui, sans-serif"; g.textAlign = "center"; g.textBaseline = "middle";
  g.fillText("G - AIRPLANE", 256, 24);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; return t;
}

// khối có màu đỉnh (để gộp chung một vật liệu)
function toMau(geo, mau) {
  const g = geo.index ? geo.toNonIndexed() : geo, n = g.attributes.position.count, c = new Float32Array(n * 3), m = new THREE.Color(mau);
  for (let i = 0; i < n; i++) { c[i * 3] = m.r; c[i * 3 + 1] = m.g; c[i * 3 + 2] = m.b; }
  g.setAttribute("color", new THREE.BufferAttribute(c, 3)); g.deleteAttribute("uv"); return g;
}
const dat = (geo, x, y, z, rx = 0, ry = 0, rz = 0) => geo.applyMatrix4(new THREE.Matrix4().compose(new THREE.Vector3(x, y, z), new THREE.Quaternion().setFromEuler(new THREE.Euler(rx, ry, rz)), new THREE.Vector3(1, 1, 1)));

function taoMayBay() {
  // máy bay dài ~36 m, sải cánh ~34 m, mũi hướng +z
  const TRANG = 0xf4f4f2, CAM = 0xe8702a, XAM = 0x9aa0a8, TOI = 0x2a2f3a;
  const ds = [];
  const than = new THREE.CylinderGeometry(2, 2, 26, 14, 1); dat(than, 0, 0, 0, Math.PI / 2); ds.push(toMau(than, TRANG));
  const mui = new THREE.SphereGeometry(2, 14, 8, 0, Math.PI * 2, 0, Math.PI / 2); mui.scale(1, 1, 2.2); dat(mui, 0, 0, 13, Math.PI / 2); ds.push(toMau(mui, TRANG));
  const kinh = new THREE.BoxGeometry(2.4, 0.5, 1.2); dat(kinh, 0, 0.9, 15.4, -0.5); ds.push(toMau(kinh, TOI));
  const duoi = new THREE.CylinderGeometry(2, 0.6, 9, 14, 1); dat(duoi, 0, 0.6, -17.5, Math.PI / 2 + Math.PI, 0, 0); ds.push(toMau(duoi, TRANG));
  // cánh chính: hai tấm xiên về sau
  for (const s of [-1, 1]) {
    const c = new THREE.BoxGeometry(15, 0.45, 4.2); dat(c, s * 9, -0.8, 0.5, 0, s * 0.42, s * -0.05); ds.push(toMau(c, TRANG));
    const vien = new THREE.BoxGeometry(15, 0.47, 0.5); dat(vien, s * 9, -0.79, -1.4, 0, s * 0.42, s * -0.05); ds.push(toMau(vien, CAM));
    const dc = new THREE.CylinderGeometry(1.05, 1.05, 4, 12, 1, true); dat(dc, s * 6.2, -2.1, 2.2, Math.PI / 2); ds.push(toMau(dc, XAM));
    const ngang = new THREE.BoxGeometry(5.5, 0.3, 2.2); dat(ngang, s * 3.4, 0.9, -19, 0, s * 0.4, 0); ds.push(toMau(ngang, TRANG));
  }
  // đuôi đứng màu cam có chữ G
  const dung = new THREE.BoxGeometry(0.4, 7, 4.2); dat(dung, 0, 4.4, -18.6, -0.45); ds.push(toMau(dung, CAM));
  const g = new THREE.Group();
  g.add(new THREE.Mesh(mergeGeometries(ds), new THREE.MeshLambertMaterial({ vertexColors: true })));
  // chữ hãng hai bên thân
  const tex = veChu();
  for (const s of [-1, 1]) {
    const p = new THREE.Mesh(new THREE.PlaneGeometry(16, 2), new THREE.MeshLambertMaterial({ map: tex }));
    p.position.set(s * 2.02, 0.5, 1); p.rotation.y = s * Math.PI / 2; g.add(p);
  }
  // đèn hàng không: đỏ cánh trái, xanh cánh phải, trắng chớp ở đuôi
  const den = [[0xff2a2a, -15.5, -0.8, -2.5], [0x2aff6a, 15.5, -0.8, -2.5], [0xffffff, 0, 8, -20]].map(([c, x, y, z]) => {
    const m = new THREE.Mesh(new THREE.SphereGeometry(1.3, 8, 6), new THREE.MeshBasicMaterial({ color: c, fog: false, toneMapped: false })); m.position.set(x, y, z); g.add(m); return m;
  });
  return { g, den };
}

export class MayBay {
  constructor(scene) {
    const { g, den } = taoMayBay();
    this.g = g; this.den = den; g.visible = false; scene.add(g);
    this.cho = 40 + Math.random() * 60; // chuyến đầu sau 40 – 100 giây
    this.v = 75; this.t = 0;
    this._a = new THREE.Vector3(); this._huong = new THREE.Vector3();
  }
  bay(camera) {
    // bay theo một đường thẳng cắt ngang gần đầu người chơi, độ cao 130 – 170 m, hướng ngẫu nhiên
    const goc = Math.random() * Math.PI * 2, lech = (Math.random() - 0.5) * 120, cao = 130 + Math.random() * 40;
    const h = this._huong.set(Math.sin(goc), 0, Math.cos(goc));
    const ngang = new THREE.Vector3(h.z, 0, -h.x);
    this._a.set(camera.position.x, cao, camera.position.z).addScaledVector(ngang, lech).addScaledVector(h, -650);
    this.g.position.copy(this._a); this.g.rotation.set(0, goc, 0);
    this.quang = 1300; this.t = 0; this.g.visible = true;
  }
  capNhat(dt, camera, gio, mua) {
    if (!this.g.visible) {
      this.cho -= dt;
      if (this.cho <= 0) { if (!mua) this.bay(camera); this.cho = 90 + Math.random() * 150; }
      return;
    }
    this.t += dt;
    this.g.position.addScaledVector(this._huong, this.v * dt);
    if (this.t * this.v > this.quang) { this.g.visible = false; return; }
    // đèn: ban đêm nhấp nháy rõ, ban ngày gần như tắt
    const dem = gio < 6 || gio >= 18;
    const nhay = Math.floor(this.t * 1.2) % 2 === 0;
    this.den[0].visible = this.den[1].visible = dem || nhay;
    this.den[2].visible = (this.t % 1.4) < 0.12;
  }
}
