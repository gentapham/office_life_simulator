// Bầu trời và thời tiết: vòm trời theo giờ, mặt trời, mặt trăng, sao, mây trôi, mưa, sét, sương mù, đường ướt.
import * as THREE from "three";
import { gopNguoi } from "./toi-uu.js";

// Các kiểu thời tiết. may: số đám mây, mauMay: độ tối của mây, mua: số hạt mưa, set: có sét
export const THOI_TIET = {
  nang:      { ten: "Nắng", nhiet: 33, may: 10, mauMay: 1, mua: 0, sang: 1, suong: [70, 260] },
  nang_gat:  { ten: "Nắng gắt", nhiet: 36, may: 4, mauMay: 1, mua: 0, sang: 1.08, suong: [80, 280] },
  nhieu_may: { ten: "Nhiều mây", nhiet: 31, may: 30, mauMay: 0.92, mua: 0, sang: 0.9, suong: [60, 240] },
  am_u:      { ten: "Âm u", nhiet: 29, may: 46, mauMay: 0.62, mua: 0, sang: 0.68, suong: [45, 180] },
  mua_phun:  { ten: "Mưa phùn", nhiet: 28, may: 46, mauMay: 0.6, mua: 700, tocMua: 12, sang: 0.64, suong: [35, 150] },
  mua_rao:   { ten: "Mưa rào", nhiet: 27, may: 52, mauMay: 0.45, mua: 2200, tocMua: 26, sang: 0.52, suong: [25, 120] },
  giong:     { ten: "Giông", nhiet: 26, may: 56, mauMay: 0.32, mua: 2600, tocMua: 30, sang: 0.42, set: true, suong: [20, 105] },
  suong_mu:  { ten: "Sương mù", nhiet: 25, may: 24, mauMay: 0.85, mua: 0, sang: 0.8, suong: [6, 55] },
};

// Lịch thời tiết tháng 10 ở Thành Phố Ước Mơ (mùa mưa): [sáng, chiều, tối]
const LICH = {
  1: ["nang", "nhieu_may", "mua_rao"], 2: ["nang", "nang", "nhieu_may"], 3: ["suong_mu", "nang", "mua_rao"],
  4: ["nang", "nang_gat", "nhieu_may"], 5: ["nhieu_may", "mua_rao", "mua_phun"], 6: ["nang", "nhieu_may", "nang"],
  7: ["am_u", "mua_rao", "am_u"], 8: ["nang", "nang", "giong"], 9: ["nang", "nang_gat", "nhieu_may"],
  10: ["nhieu_may", "mua_rao", "mua_phun"], 11: ["nang", "nhieu_may", "nang"], 12: ["am_u", "mua_phun", "nhieu_may"],
  13: ["nang", "nang", "mua_rao"], 14: ["suong_mu", "nhieu_may", "mua_rao"], 15: ["am_u", "giong", "giong"],
  16: ["nang", "nang_gat", "nang"], 17: ["nang", "nang_gat", "nang"], 18: ["nang", "nhieu_may", "nang"],
  19: ["nhieu_may", "mua_rao", "am_u"], 20: ["nang", "nang", "nhieu_may"], 21: ["am_u", "mua_rao", "mua_phun"],
  22: ["nang", "nhieu_may", "giong"], 23: ["nang", "nang", "nang"], 24: ["nhieu_may", "mua_phun", "nhieu_may"],
  25: ["nang", "nang_gat", "mua_rao"], 26: ["suong_mu", "nang", "nhieu_may"], 27: ["am_u", "giong", "mua_rao"],
  28: ["nang", "nhieu_may", "nang"], 29: ["am_u", "mua_rao", "mua_rao"], 30: ["nang", "nhieu_may", "mua_phun"],
  31: ["nang", "mua_phun", "nang"],
};
export function thoiTietLuc(ngay, gio) {
  const l = LICH[ngay] || LICH[1];
  return gio < 12 ? l[0] : gio < 18 ? l[1] : l[2];
}

const mix = (a, b, t) => new THREE.Color(a).lerp(new THREE.Color(b), Math.max(0, Math.min(1, t)));

export class BauTroi {
  constructor(scene, { matUot = [] } = {}) {
    this.scene = scene;
    this.gio = 8; this.loai = "nang"; this.tt = THOI_TIET.nang;
    this.uot = 0; this.matUot = matUot.map(m => ({ m, goc: m.color.clone() }));
    const g = this.nhom = new THREE.Group(); scene.add(g);

    // Vòm trời: màu đỉnh, màu chân trời, quầng sáng quanh mặt trời
    this.dome = new THREE.Mesh(new THREE.SphereGeometry(450, 24, 12), new THREE.ShaderMaterial({
      side: THREE.BackSide, depthWrite: false, fog: false,
      uniforms: { dinh: { value: new THREE.Color(0x4f8fd6) }, chan: { value: new THREE.Color(0xcfe5f5) }, huongMT: { value: new THREE.Vector3(0, 1, 0) }, mauMT: { value: new THREE.Color(0xfff1c8) }, doMT: { value: 1 } },
      vertexShader: "varying vec3 vP; void main(){ vP = normalize(position); gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }",
      fragmentShader: `uniform vec3 dinh; uniform vec3 chan; uniform vec3 huongMT; uniform vec3 mauMT; uniform float doMT; varying vec3 vP;
        void main(){ float h = clamp(vP.y, -0.2, 1.0); vec3 c = mix(chan, dinh, pow(max(h,0.0), 0.55));
        float s = max(dot(vP, huongMT), 0.0); c += mauMT * (pow(s, 48.0) * 0.9 + pow(s, 6.0) * 0.18) * doMT;
        gl_FragColor = vec4(c, 1.0); }`,
    }));
    this.dome.renderOrder = -10; g.add(this.dome);

    // Mặt trời + quầng
    this.matTroi = new THREE.Mesh(new THREE.SphereGeometry(14, 16, 10), new THREE.MeshBasicMaterial({ color: 0xfff4d0, fog: false }));
    this.quang = new THREE.Sprite(new THREE.SpriteMaterial({ map: quangSang(), color: 0xffe6a8, transparent: true, depthWrite: false, fog: false, blending: THREE.AdditiveBlending }));
    this.quang.scale.set(120, 120, 1);
    this.matTrang = new THREE.Mesh(new THREE.SphereGeometry(9, 14, 8), new THREE.MeshBasicMaterial({ color: 0xeef0f6, fog: false }));
    g.add(this.matTroi, this.quang, this.matTrang);

    // Sao
    const sao = new Float32Array(900 * 3);
    for (let i = 0; i < 900; i++) {
      const u = Math.random(), v = Math.random() * 0.9 + 0.08, th = u * Math.PI * 2, ph = Math.acos(v);
      sao.set([Math.cos(th) * Math.sin(ph) * 420, Math.cos(ph) * 420, Math.sin(th) * Math.sin(ph) * 420], i * 3);
    }
    const gs = new THREE.BufferGeometry(); gs.setAttribute("position", new THREE.BufferAttribute(sao, 3));
    this.sao = new THREE.Points(gs, new THREE.PointsMaterial({ color: 0xffffff, size: 1.6, sizeAttenuation: false, transparent: true, fog: false, depthWrite: false }));
    g.add(this.sao);

    // Mây: mỗi đám là nhiều khối đa giác gộp lại
    this.vlMay = new THREE.MeshLambertMaterial({ color: 0xffffff, emissive: 0x777777, flatShading: true, fog: false });
    this.vlMay.userData.dong = true; // màu đổi theo giờ
    this.may = [];
    const nhomMay = new THREE.Group(); g.add(nhomMay);
    for (let i = 0; i < 60; i++) {
      const parts = [];
      const n = 4 + Math.floor(Math.random() * 5);
      for (let j = 0; j < n; j++) {
        const r = 7 + Math.random() * 9;
        const b = new THREE.IcosahedronGeometry(r, 0);
        b.translate((j - n / 2) * r * 0.9 + Math.random() * 4, Math.random() * 4, Math.random() * 10 - 5);
        parts.push(b);
      }
      const geo = mergeDonGian(parts); geo.scale(1, 0.55, 1);
      const m = new THREE.Mesh(geo, this.vlMay);
      const goc = Math.random() * Math.PI * 2, kc = 60 + Math.random() * 260;
      m.position.set(Math.cos(goc) * kc, 85 + Math.random() * 45, Math.sin(goc) * kc);
      m.rotation.y = Math.random() * Math.PI;
      m.userData.toc = 2 + Math.random() * 3;
      nhomMay.add(m); this.may.push(m);
    }
    // cả bầu mây một lượt vẽ: mỗi đám mây là một xương (trôi, ẩn bằng cách thu nhỏ)
    gopNguoi({ group: nhomMay }, { xuongRieng: true, khongCat: true });

    // Mưa: các vạch rơi quanh camera
    const N = 2600;
    this.giotMua = new Float32Array(N * 6);
    for (let i = 0; i < N; i++) this.datGiot(i, true);
    const gm = new THREE.BufferGeometry(); gm.setAttribute("position", new THREE.BufferAttribute(this.giotMua, 3));
    this.mua = new THREE.LineSegments(gm, new THREE.LineBasicMaterial({ color: 0xb8c6d6, transparent: true, opacity: 0.55, depthWrite: false }));
    this.mua.frustumCulled = false; this.mua.visible = false;
    g.add(this.mua);
    this.tamMua = new THREE.Vector3();
    this.choSet = 6; this.chop = 0;
  }
  datGiot(i, ngauNhien) {
    const x = (Math.random() - 0.5) * 44, z = (Math.random() - 0.5) * 44, y = ngauNhien ? Math.random() * 26 : 26;
    this.giotMua.set([x, y, z, x - 0.05, y - 0.55, z], i * 6);
  }

  datThoiTiet(loai) { if (THOI_TIET[loai]) { this.loai = loai; this.tt = THOI_TIET[loai]; } }
  moTa() { return `${this.tt.ten} · ${this.tt.nhiet + (this.gio >= 11 && this.gio < 16 ? 1 : this.gio < 7 || this.gio >= 19 ? -2 : 0)}°C`; }

  // Cập nhật mỗi khung hình. den: ánh sáng của game (hemi, nen, matTroi)
  capNhat(dt, camera, den, trongNha) {
    const h = this.gio, tt = this.tt;
    // vị trí mặt trời theo giờ: mọc 5:45 hướng đông (+x), lặn 18:15 hướng tây (-x)
    const goc = ((h - 5.75) / 12.5) * Math.PI;
    const huong = new THREE.Vector3(Math.cos(goc), Math.sin(goc), -0.35).normalize();
    const cao = huong.y;
    const ngay = THREE.MathUtils.clamp(cao * 3 + 0.2, 0, 1);       // 0 đêm, 1 ngày
    const hoangHon = THREE.MathUtils.clamp(1 - Math.abs(cao) * 4, 0, 1) * (cao > -0.15 ? 1 : 0);
    const u = 1 - tt.sang;                                          // độ u ám
    let dinh = mix(0x0b1028, 0x3f86d8, ngay).lerp(new THREE.Color(0xd4703f), hoangHon * 0.35).lerp(new THREE.Color(0x6d7682), u * 1.1 * ngay + u * 0.4);
    let chan = mix(0x1a2240, 0xcde3f3, ngay).lerp(new THREE.Color(0xf4a46a), hoangHon * 0.75).lerp(new THREE.Color(0x9aa3ab), u * 1.2 * ngay + u * 0.3);
    // sét
    if (tt.set) {
      this.choSet -= dt;
      if (this.choSet < 0) { this.chop = 0.22; this.choSet = 4 + Math.random() * 9; }
    }
    let loe = 0;
    if (this.chop > 0) { this.chop -= dt; loe = (Math.sin(this.chop * 60) > 0 ? 1 : 0.4); }
    if (loe) { dinh = dinh.lerp(new THREE.Color(0xe8ecff), 0.8 * loe); chan = chan.lerp(new THREE.Color(0xffffff), 0.8 * loe); }
    const U = this.dome.material.uniforms;
    U.dinh.value.copy(dinh); U.chan.value.copy(chan); U.huongMT.value.copy(huong);
    U.doMT.value = cao > -0.05 ? (1 - u * 1.3) : 0;
    U.mauMT.value.copy(mix(0xfff1c8, 0xff9a52, hoangHon));
    this.nhom.position.copy(camera.position);
    this.matTroi.position.copy(huong).multiplyScalar(380);
    this.quang.position.copy(this.matTroi.position);
    this.matTroi.visible = this.quang.visible = cao > -0.08 && u < 0.45;
    this.matTroi.material.color.copy(mix(0xfff6dc, 0xff8a3a, hoangHon));
    this.quang.material.opacity = 0.85 * (1 - u * 2);
    this.matTrang.position.copy(huong).multiplyScalar(-370); this.matTrang.position.y = Math.abs(this.matTrang.position.y) + 60;
    this.matTrang.visible = ngay < 0.35 && u < 0.4;
    this.sao.visible = ngay < 0.3; this.sao.material.opacity = (1 - ngay / 0.3) * (1 - u * 1.5);

    // mây
    const soMay = tt.may;
    const sangMay = Math.max(0.12, (0.25 + ngay * 0.75) * tt.mauMay);
    this.vlMay.color.copy(mix(0x1d2236, 0xffffff, sangMay)).lerp(new THREE.Color(0xf6a070), hoangHon * 0.5 * tt.mauMay);
    this.vlMay.emissive.copy(this.vlMay.color).multiplyScalar(0.45 + loe * 0.5);
    this.may.forEach((m, i) => {
      m.scale.setScalar(i < soMay ? 1 : 1e-4); // đã gộp chung một khối: ẩn bằng cách thu nhỏ
      m.position.x += m.userData.toc * dt * (tt.mua ? 2 : 1);
      if (m.position.x > 330) m.position.x = -330;
      m.position.y = tt.mua ? 70 + (i % 5) * 4 : 85 + (i % 7) * 6;
    });

    // ánh sáng
    const s = tt.sang;
    den.hemi.intensity = (0.55 + ngay * 1.15) * s + loe * 1.5;
    den.hemi.color.copy(mix(0x8fa0d0, 0xffffff, ngay));
    den.hemi.groundColor.copy(mix(0x2a2e3a, 0xb8ad96, ngay));
    den.nen.intensity = 0.38 + ngay * 0.2;
    den.matTroi.intensity = Math.max(0, cao) > 0 ? (0.3 + cao * 1.6) * Math.max(0.15, s * s) : 0.12;
    den.matTroi.color.copy(cao > 0 ? mix(0xfff1d6, 0xffa860, hoangHon) : new THREE.Color(0x9fb0ff));
    den.matTroi.position.copy(cao > 0 ? huong : new THREE.Vector3(-huong.x, 0.6, 0.3)).multiplyScalar(60);
    // sương mù / tầm nhìn
    const fog = this.scene.fog;
    fog.color.copy(chan);
    fog.near += (tt.suong[0] - fog.near) * Math.min(1, dt * 2);
    fog.far += (tt.suong[1] - fog.far) * Math.min(1, dt * 2);

    // mưa
    const coMua = tt.mua > 0;
    this.uot += ((coMua ? 1 : 0) - this.uot) * Math.min(1, dt * (coMua ? 0.5 : 0.08));
    for (const { m, goc: c0 } of this.matUot) m.color.copy(c0).multiplyScalar(1 - this.uot * 0.32);
    this.mua.visible = coMua && !trongNha;
    if (this.mua.visible) {
      const so = tt.mua, toc = tt.tocMua || 20;
      this.mua.geometry.setDrawRange(0, so * 2);
      this.mua.position.set(camera.position.x - this.nhom.position.x, -12 + camera.position.y - this.nhom.position.y, camera.position.z - this.nhom.position.z);
      const a = this.giotMua;
      const dai = toc > 20 ? 0.7 : 0.3;
      for (let i = 0; i < so; i++) {
        const k = i * 6;
        a[k + 1] -= toc * dt; a[k + 4] = a[k + 1] - dai;
        if (a[k + 1] < 0) this.datGiot(i, false);
      }
      this.mua.geometry.attributes.position.needsUpdate = true;
      this.mua.material.opacity = toc > 20 ? 0.55 : 0.35;
    }
    return { dem: ngay < 0.45, ngay, loe };
  }
}

function quangSang() {
  const c = document.createElement("canvas"); c.width = c.height = 128;
  const g = c.getContext("2d"); const gr = g.createRadialGradient(64, 64, 0, 64, 64, 64);
  gr.addColorStop(0, "rgba(255,255,255,1)"); gr.addColorStop(0.2, "rgba(255,240,200,.55)"); gr.addColorStop(1, "rgba(255,220,160,0)");
  g.fillStyle = gr; g.fillRect(0, 0, 128, 128);
  return new THREE.CanvasTexture(c);
}
// gộp nhanh các khối mây (cùng thuộc tính)
function mergeDonGian(ds) {
  const arr = ds.map(d => d.index ? d.toNonIndexed() : d);
  let n = 0; for (const d of arr) n += d.attributes.position.count;
  const pos = new Float32Array(n * 3), nor = new Float32Array(n * 3);
  let o = 0;
  for (const d of arr) { pos.set(d.attributes.position.array, o * 3); nor.set(d.attributes.normal.array, o * 3); o += d.attributes.position.count; }
  const g = new THREE.BufferGeometry(); g.setAttribute("position", new THREE.BufferAttribute(pos, 3)); g.setAttribute("normal", new THREE.BufferAttribute(nor, 3));
  return g;
}
