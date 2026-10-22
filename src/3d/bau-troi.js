// Bầu trời và thời tiết: vòm trời theo giờ, mặt trời, mặt trăng, sao, mây trôi, mưa, sét, sương mù, đường ướt.
// Hai kiểu vẽ: mức Thấp giữ nguyên kiểu cũ (mây khối đa giác, ánh sáng cũ); mức Vừa / Cao vẽ kiểu tranh (xem to-mau.js):
// vòm trời chuyển màu như tô màu nước, mây tích (cumulus) to mềm vẽ bằng tấm phẳng luôn quay về camera (cả bầu mây một
// lượt vẽ, trôi trong shader), mù ấm phía chân trời, nắng vàng ấm / bóng xanh tím mát, đêm xanh lam kiểu tranh.
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
// pha màu không cấp phát: tron(c, màu hex hoặc Color, t) kéo c về màu đó; datTron(c, a, b, t) = a pha b
const _ma = new THREE.Color(), _mb = new THREE.Color();
const laMau = (c, x) => (x.isColor ? c.copy(x) : c.setHex(x));
function tron(c, x, t) { if (t > 0) c.lerp(laMau(_ma, x), Math.min(1, t)); return c; }
function datTron(c, a, b, t) { laMau(c, a); return tron(c, laMau(_mb, b), Math.max(0, t)); }
// tầm nhìn kiểu tranh [gần, xa]: mù bắt đầu sớm và tăng đều tới chân trời
const SUONG_TRANH = {
  nang: [12, 250], nang_gat: [16, 270], nhieu_may: [10, 220], am_u: [6, 170],
  mua_phun: [4, 140], mua_rao: [3, 110], giong: [2, 95], suong_mu: [1, 50],
};

export class BauTroi {
  // muc: 0 kiểu cũ (máy yếu), 1-2 kiểu tranh
  constructor(scene, { matUot = [], muc = 0 } = {}) {
    this.scene = scene; this.muc = muc;
    this.gio = 8; this.loai = "nang"; this.tt = THOI_TIET.nang;
    this.uot = 0; this.matUot = matUot.map(m => ({ m, goc: m.color.clone() }));
    const g = this.nhom = new THREE.Group(); scene.add(g);
    if (muc > 0) { this.taoTranh(); this.taoMua(); return; }

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

    this.taoMua();
  }
  // Mưa: các vạch rơi quanh camera
  taoMua() {
    const g = this.nhom;
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
    const a = this.giotMua, k = i * 6;
    a[k] = x; a[k + 1] = y; a[k + 2] = z; a[k + 3] = x - 0.05; a[k + 4] = y - 0.55; a[k + 5] = z;
  }

  // ---------- Kiểu tranh ----------
  taoTranh() {
    const g = this.nhom;
    const C = h => new THREE.Color(h);
    // màu tạm (không cấp phát mỗi khung hình)
    this._c = { dinh: C(0), chan: C(0), am: C(0), sang: C(0), toi: C(0), t: C(0), v: new THREE.Vector3(), huong: new THREE.Vector3() };
    this._kq = { dem: false, ngay: 1, loe: 0 };
    // Vòm trời: chuyển màu đỉnh -> chân trời, dải ấm sát chân trời (đậm hơn phía mặt trời), quầng nắng mềm, vệt cọ rất nhẹ
    this.dome = new THREE.Mesh(new THREE.SphereGeometry(450, 32, 16), new THREE.ShaderMaterial({
      side: THREE.BackSide, depthWrite: false, fog: false,
      uniforms: { dinh: { value: C(0x4b93dd) }, chan: { value: C(0xd3e6ef) }, am: { value: C(0xf2e4c8) }, huongMT: { value: new THREE.Vector3(0, 1, 0) }, mauMT: { value: C(0xfff1c8) }, doMT: { value: 1 } },
      vertexShader: "varying vec3 vP; void main(){ vP = position; gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0); }",
      fragmentShader: /* glsl */`uniform vec3 dinh; uniform vec3 chan; uniform vec3 am; uniform vec3 huongMT; uniform vec3 mauMT; uniform float doMT; varying vec3 vP;
        float h3(vec3 p){ p = fract(p * 0.3183099 + 0.1); p *= 17.0; return fract(p.x * p.y * p.z * (p.x + p.y + p.z)); }
        float n3(vec3 x){ vec3 i = floor(x), f = fract(x); f = f * f * (3.0 - 2.0 * f);
          return mix(mix(mix(h3(i), h3(i + vec3(1,0,0)), f.x), mix(h3(i + vec3(0,1,0)), h3(i + vec3(1,1,0)), f.x), f.y),
                     mix(mix(h3(i + vec3(0,0,1)), h3(i + vec3(1,0,1)), f.x), mix(h3(i + vec3(0,1,1)), h3(i + vec3(1,1,1)), f.x), f.y), f.z); }
        void main(){
          vec3 d = normalize(vP); float h = d.y;
          vec3 c = mix(chan, dinh, pow(smoothstep(-0.04, 0.62, h), 0.8));
          vec2 dx = normalize(d.xz + 1e-5), sx = normalize(huongMT.xz + 1e-5);
          float phiaMT = max(dot(dx, sx), 0.0);
          float dai = 1.0 - smoothstep(0.0, 0.2, abs(h - 0.02));
          c = mix(c, am, dai * (0.22 + 0.4 * phiaMT * phiaMT));
          float s = max(dot(d, huongMT), 0.0);
          c += mauMT * (pow(s, 28.0) * 0.45 + pow(s, 5.0) * 0.1) * doMT;
          c *= 1.0 + (n3(d * 7.0) + n3(d * 15.0) * 0.5 - 0.75) * 0.035;
          gl_FragColor = vec4(c, 1.0);
          #include <tonemapping_fragment>
          #include <colorspace_fragment>
        }`,
    }));
    this.dome.renderOrder = -10; g.add(this.dome);

    // Mặt trời: đĩa kem mềm + quầng; mặt trăng
    this.matTroi = new THREE.Mesh(new THREE.SphereGeometry(13, 16, 10), new THREE.MeshBasicMaterial({ color: 0xfff6e0, fog: false }));
    this.quang = new THREE.Sprite(new THREE.SpriteMaterial({ map: quangSang(), color: 0xffe6b0, transparent: true, depthWrite: false, fog: false, blending: THREE.AdditiveBlending }));
    this.quang.scale.set(150, 150, 1);
    this.matTrang = new THREE.Mesh(new THREE.SphereGeometry(10, 16, 10), new THREE.MeshBasicMaterial({ color: 0xf4f1e2, fog: false }));
    this.quangTrang = new THREE.Sprite(new THREE.SpriteMaterial({ map: this.quang.material.map, color: 0x8fa2d8, transparent: true, opacity: 0.5, depthWrite: false, fog: false, blending: THREE.AdditiveBlending }));
    this.quangTrang.scale.set(90, 90, 1);
    this.matTroi.renderOrder = this.quang.renderOrder = this.matTrang.renderOrder = this.quangTrang.renderOrder = -9;
    g.add(this.matTroi, this.quang, this.matTrang, this.quangTrang);

    // Sao
    const sao = new Float32Array(700 * 3);
    for (let i = 0; i < 700; i++) {
      const u = Math.random(), v = Math.random() * 0.88 + 0.1, th = u * Math.PI * 2, ph = Math.acos(v);
      sao[i * 3] = Math.cos(th) * Math.sin(ph) * 420; sao[i * 3 + 1] = Math.cos(ph) * 420; sao[i * 3 + 2] = Math.sin(th) * Math.sin(ph) * 420;
    }
    const gs = new THREE.BufferGeometry(); gs.setAttribute("position", new THREE.BufferAttribute(sao, 3));
    this.sao = new THREE.Points(gs, new THREE.PointsMaterial({ color: 0xfff6dc, size: 1.7, sizeAttenuation: false, transparent: true, fog: false, depthWrite: false }));
    this.sao.renderOrder = -9;
    g.add(this.sao);

    // Mây tích kiểu tranh: mỗi đám một tấm phẳng (ảnh ghép 4 kiểu mây vẽ bằng code), quay về camera, trôi trong shader
    const N = 40, rnd = ngauNhien(20261022);
    const ds = [];
    for (let i = 0; i < N; i++) {
      const kc = 230 + rnd() * 150, to = 0.75 + rnd() * 0.6;
      ds.push({ i, goc: i * 2.39996 + rnd() * 0.4, kc, cao: 22 + rnd() * 62 + (i % 3) * 8, rong: (120 + rnd() * 120) * to * kc / 300, kieu: i % 4 });
    }
    ds.sort((a, b) => b.kc - a.kc); // xa vẽ trước
    const pos = [], uv = [], may = [], kieu = [], so = [], idx = [];
    ds.forEach((d, n) => {
      const ku = (d.kieu % 2) * 0.5, kv = Math.floor(d.kieu / 2) * 0.5;
      for (const [x, y] of [[-0.5, 0], [0.5, 0], [0.5, 1], [-0.5, 1]]) {
        pos.push(x, y, 0); uv.push(x + 0.5, y); may.push(d.goc, d.kc, d.cao, d.rong); kieu.push(ku, kv); so.push(d.i);
      }
      idx.push(n * 4, n * 4 + 1, n * 4 + 2, n * 4, n * 4 + 2, n * 4 + 3);
    });
    const gm = new THREE.BufferGeometry();
    gm.setAttribute("position", new THREE.Float32BufferAttribute(pos, 3));
    gm.setAttribute("uv", new THREE.Float32BufferAttribute(uv, 2));
    gm.setAttribute("aMay", new THREE.Float32BufferAttribute(may, 4));
    gm.setAttribute("aKieu", new THREE.Float32BufferAttribute(kieu, 2));
    gm.setAttribute("aSo", new THREE.Float32BufferAttribute(so, 1));
    gm.setIndex(idx);
    this.vlMay = new THREE.ShaderMaterial({
      transparent: true, depthWrite: false, fog: false,
      uniforms: { map: { value: anhMay() }, uT: { value: 0 }, soMay: { value: 10 }, kMay: { value: 1 }, hMay: { value: 0 },
        mSang: { value: C(0xffe8c2) }, mToi: { value: C(0xd5dff0) }, doMo: { value: 1 } },
      vertexShader: /* glsl */`attribute vec4 aMay; attribute vec2 aKieu; attribute float aSo;
        uniform float uT; uniform float soMay; uniform float kMay; uniform float hMay; varying vec2 vUv;
        void main(){
          if (aSo >= soMay) { gl_Position = vec4(2.0, 2.0, 2.0, 1.0); return; }
          float goc = aMay.x + uT / aMay.y;
          vec3 r = vec3(-sin(goc), 0.0, cos(goc));
          float w = aMay.w * kMay;
          vec3 p = vec3(cos(goc) * aMay.y, aMay.z * mix(1.0, 0.55, hMay) + 4.0, sin(goc) * aMay.y) + r * position.x * w + vec3(0.0, position.y * w * 0.5, 0.0);
          vUv = aKieu + uv * 0.5;
          gl_Position = projectionMatrix * modelViewMatrix * vec4(p, 1.0);
        }`,
      fragmentShader: /* glsl */`uniform sampler2D map; uniform vec3 mSang; uniform vec3 mToi; uniform float doMo; varying vec2 vUv;
        void main(){
          vec4 t = texture2D(map, vUv);
          float a = smoothstep(0.1, 0.6, t.a) * doMo;
          if (a < 0.004) discard;
          gl_FragColor = vec4(mix(mToi, mSang, t.r), a);
          #include <tonemapping_fragment>
          #include <colorspace_fragment>
        }`,
    });
    this.bauMay = new THREE.Mesh(gm, this.vlMay);
    this.bauMay.frustumCulled = false; this.bauMay.renderOrder = -8;
    g.add(this.bauMay);
    this.tMay = 0; this.choSet = 6; this.chop = 0;
  }

  capNhatTranh(dt, camera, den, trongNha) {
    const h = this.gio, tt = this.tt, c = this._c, T = THREE.MathUtils;
    const goc = ((h - 5.75) / 12.5) * Math.PI;
    const huong = c.huong.set(Math.cos(goc), Math.sin(goc), -0.35).normalize();
    const cao = huong.y;
    const ngay = T.clamp(cao * 3 + 0.2, 0, 1);
    const hoangHon = T.clamp(1 - Math.abs(cao) * 3.2, 0, 1) * (cao > -0.15 ? 1 : 0);
    const u = 1 - tt.sang; // độ u ám (0 nắng .. ~0,6 giông)
    const xam = T.clamp(u * 1.9, 0, 1); // mức phủ mây xám
    // sét
    if (tt.set) { this.choSet -= dt; if (this.choSet < 0) { this.chop = 0.22; this.choSet = 4 + Math.random() * 9; } }
    let loe = 0;
    if (this.chop > 0) { this.chop -= dt; loe = (Math.sin(this.chop * 60) > 0 ? 1 : 0.4); }

    // màu trời: đêm -> ngày, hoàng hôn, u ám
    datTron(c.dinh, 0x16204a, 0x4b93dd, ngay); tron(c.dinh, 0x6f78bd, hoangHon * 0.45); tron(c.dinh, ngay > 0.5 ? 0x8e99a6 : 0x1e2533, xam * (0.4 + 0.5 * ngay));
    datTron(c.chan, 0x34457a, 0xd3e6ef, ngay); tron(c.chan, 0xf2b48c, hoangHon * 0.7); tron(c.chan, ngay > 0.5 ? 0xbfc5ca : 0x2c3446, xam * (0.45 + 0.45 * ngay));
    datTron(c.am, 0x404c7c, 0xf3e2c4, ngay); tron(c.am, 0xffaa6c, hoangHon * 0.8); tron(c.am, c.chan, xam * 0.85);
    if (loe) { tron(c.dinh, 0xe8ecff, 0.8 * loe); tron(c.chan, 0xffffff, 0.8 * loe); tron(c.am, 0xffffff, 0.8 * loe); }
    const U = this.dome.material.uniforms;
    U.dinh.value.copy(c.dinh); U.chan.value.copy(c.chan); U.am.value.copy(c.am); U.huongMT.value.copy(huong);
    U.doMT.value = cao > -0.05 ? T.clamp(1 - u * 1.6, 0, 1) : 0;
    datTron(U.mauMT.value, 0xfff1c8, 0xff9a52, hoangHon);
    this.nhom.position.copy(camera.position);
    this.matTroi.position.copy(huong).multiplyScalar(380);
    this.quang.position.copy(this.matTroi.position);
    this.matTroi.visible = this.quang.visible = cao > -0.08 && u < 0.4;
    datTron(this.matTroi.material.color, 0xfff7e4, 0xffa05a, hoangHon);
    this.quang.material.opacity = 0.7 * T.clamp(1 - u * 2.5, 0, 1);
    this.matTrang.position.copy(huong).multiplyScalar(-370); this.matTrang.position.y = Math.abs(this.matTrang.position.y) + 60;
    this.quangTrang.position.copy(this.matTrang.position);
    this.matTrang.visible = this.quangTrang.visible = ngay < 0.35 && u < 0.4;
    this.sao.visible = ngay < 0.3 && u < 0.5; this.sao.material.opacity = (1 - ngay / 0.3) * (1 - u * 1.8);

    // mây: số đám theo thời tiết, mưa thì mây hạ thấp, to, xám
    const M = this.vlMay.uniforms;
    this.tMay += dt * (tt.mua ? 7 : 3.5);
    M.uT.value = this.tMay;
    M.soMay.value = Math.min(40, Math.round(7 + tt.may * 0.62));
    M.kMay.value = 1 + xam * 0.55; M.hMay.value = xam;
    const sangMay = Math.max(0.1, tt.mauMay);
    datTron(M.mSang.value, 0x4e5b88, 0xffe8c2, ngay); tron(M.mSang.value, 0xffb48a, hoangHon * 0.7);
    datTron(M.mToi.value, 0x252d52, 0xcfdcee, ngay); tron(M.mToi.value, 0x9d93b6, hoangHon * 0.6);
    tron(M.mSang.value, ngay > 0.5 ? 0xd6d9de : 0x30374a, xam * 0.8); tron(M.mToi.value, ngay > 0.5 ? 0x8f97a3 : 0x1b2030, xam * 0.85);
    M.mSang.value.multiplyScalar(0.55 + 0.45 * sangMay); M.mToi.value.multiplyScalar(0.5 + 0.5 * sangMay);
    if (loe) { tron(M.mSang.value, 0xffffff, 0.6 * loe); tron(M.mToi.value, 0xdfe4ff, 0.5 * loe); }
    M.doMo.value = 1;

    // ánh sáng (màu tuyến tính, cường độ π: một mặt trắng đón đủ nắng + trời ≈ màu gốc của nó)
    const s = tt.sang, P = Math.PI;
    // nắng: vàng ấm, hoàng hôn cam; đêm: trăng xanh nhạt
    const nang = cao > 0 ? T.clamp(cao * 6, 0, 1) * T.clamp((s - 0.45) / 0.5, 0, 1) : 0;
    if (cao > 0) { den.matTroi.color.setRGB(0.6, 0.52, 0.35); tron(den.matTroi.color, c.t.setRGB(0.6, 0.33, 0.14), hoangHon); den.matTroi.color.multiplyScalar(nang); }
    else den.matTroi.color.setRGB(0.07, 0.09, 0.16).multiplyScalar(1 - u);
    den.matTroi.intensity = P;
    if (cao > 0) den.matTroi.position.copy(huong).multiplyScalar(60);
    else den.matTroi.position.set(-huong.x, 0.6, 0.3).normalize().multiplyScalar(60);
    // trời: xanh tím mát (đây là màu của bóng); u ám thì xám trung tính và sáng hơn vì không còn nắng
    den.hemi.color.setRGB(0.15, 0.19, 0.33); tron(den.hemi.color, c.t.setRGB(0.5, 0.55, 0.7), ngay); tron(den.hemi.color, c.t.setRGB(0.55, 0.47, 0.6), hoangHon * 0.5);
    tron(den.hemi.color, c.t.setRGB(0.8, 0.82, 0.86).multiplyScalar(0.25 + 0.75 * ngay), xam * 0.9);
    den.hemi.color.multiplyScalar(xam > 0 ? 1 - u * 0.55 : 1);
    den.hemi.groundColor.setRGB(0.08, 0.08, 0.11); tron(den.hemi.groundColor, c.t.setRGB(0.6, 0.54, 0.45), ngay); tron(den.hemi.groundColor, c.t.setRGB(0.55, 0.42, 0.36), hoangHon * 0.5);
    tron(den.hemi.groundColor, c.t.setRGB(0.55, 0.55, 0.56).multiplyScalar(0.25 + 0.75 * ngay), xam * 0.8);
    den.hemi.groundColor.multiplyScalar(xam > 0 ? 1 - u * 0.55 : 1);
    // trong nhà: ánh đèn trần ấm thay cho trời xanh (bóng nắng cũng tắt dần, xem game3d.js)
    this._trong = (this._trong ?? 0) + ((trongNha ? 1 : 0) - (this._trong ?? 0)) * Math.min(1, dt * 3);
    if (this._trong > 0.001) {
      tron(den.hemi.color, c.t.setRGB(0.74, 0.7, 0.62), this._trong * 0.85);
      tron(den.hemi.groundColor, c.t.setRGB(0.56, 0.5, 0.43), this._trong * 0.85);
    }
    den.hemi.intensity = P * (1 + loe * 1.2);
    den.nen.color.setRGB(0.035, 0.035, 0.045); den.nen.intensity = P;
    this._nang = nang; // cho bóng đổ: không nắng thì bóng nhạt

    // sương mù: màu chân trời pha chút ấm, tầm nhìn theo thời tiết
    const fog = this.scene.fog, sg = SUONG_TRANH[this.loai] || tt.suong;
    fog.color.copy(c.chan).lerp(c.am, 0.3);
    fog.near += (sg[0] - fog.near) * Math.min(1, dt * 2);
    fog.far += (sg[1] - fog.far) * Math.min(1, dt * 2);

    this.capNhatMua(dt, camera, trongNha);
    const kq = this._kq; kq.dem = ngay < 0.45; kq.ngay = ngay; kq.loe = loe;
    return kq;
  }

  datThoiTiet(loai) { if (THOI_TIET[loai]) { this.loai = loai; this.tt = THOI_TIET[loai]; } }
  moTa() { return `${this.tt.ten} · ${this.tt.nhiet + (this.gio >= 11 && this.gio < 16 ? 1 : this.gio < 7 || this.gio >= 19 ? -2 : 0)}°C`; }

  // Cập nhật mỗi khung hình. den: ánh sáng của game (hemi, nen, matTroi)
  capNhat(dt, camera, den, trongNha) {
    if (this.muc > 0) return this.capNhatTranh(dt, camera, den, trongNha);
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

    this.capNhatMua(dt, camera, trongNha);
    return { dem: ngay < 0.45, ngay, loe };
  }
  capNhatMua(dt, camera, trongNha) {
    const tt = this.tt;
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
  }
}

function ngauNhien(seed) { let s = seed >>> 0 || 1; return () => (s = Math.imul(s ^ (s >>> 15), 2246822519) + 0x9e3779b9 >>> 0, (s >>> 8) / 16777216); }
// Ảnh ghép 4 kiểu mây tích (2 x 2 ô 512 x 256): kênh đỏ = độ sáng (đỉnh mỗi cụm sáng kem, chân cụm tối xanh),
// kênh alpha = độ dày. Mỗi đám là các cụm tròn chồng nhau trên một đáy phẳng, tô từng cụm theo hướng nắng rồi làm mềm.
function anhMay() {
  const W = 1024, H = 512, TW = 512, TH = 256, rnd = ngauNhien(7);
  const A = new Float32Array(W * H), L = new Float32Array(W * H);
  const lx = -0.32, ly = -0.95;
  for (let v = 0; v < 4; v++) {
    const ox = (v % 2) * TW, oy = Math.floor(v / 2) * TH, day = TH * 0.8, cum = [];
    // lớp sau: vài cụm cao ở giữa; lớp trước: một hàng cụm trên đáy, giữa to hai đầu nhỏ
    const nSau = 2 + (v % 2) * 2;
    for (let i = 0; i < nSau; i++) { const r = TH * (0.16 + rnd() * 0.08); cum.push([TW * (0.32 + rnd() * 0.36), day - TH * (0.36 + rnd() * 0.12) - r * 0.2, r]); }
    const n = 6 + v;
    for (let i = 0; i < n; i++) {
      const k = i / (n - 1), chuong = Math.sin(Math.PI * k), r = TH * (0.09 + 0.17 * chuong * (0.75 + rnd() * 0.5));
      cum.push([TW * (0.1 + 0.8 * k) + (rnd() - 0.5) * TW * 0.04, day - r * (0.45 + rnd() * 0.25) - chuong * TH * 0.08, r]);
    }
    for (let y = 0; y < TH; y++) for (let x = 0; x < TW; x++) {
      let a = 0, l = 0;
      for (const [cx, cy, r] of cum) {
        const dx = (x - cx) / r, dy = (y - cy) / r, d2 = dx * dx + dy * dy;
        if (d2 > 1) continue;
        a = 1; l = 0.6 + 0.55 * (dx * lx + dy * ly) * Math.sqrt(1 - d2 * 0.5);
      }
      if (!a) continue;
      a *= Math.min(1, Math.max(0, (day + 2 - y) / 10)); // đáy phẳng, mép mềm
      l *= 0.62 + 0.38 * Math.min(1, Math.max(0, (day - y) / (TH * 0.45)));
      const p = (oy + y) * W + ox + x; A[p] = a; L[p] = Math.min(1, Math.max(0, l));
    }
  }
  const mo = (src, r) => { // làm mờ hộp hai chiều, 2 lượt
    const t = new Float32Array(W * H);
    for (let lan = 0; lan < 2; lan++) {
      for (let y = 0; y < H; y++) { let sum = 0; for (let x = -r; x <= r; x++) sum += src[y * W + Math.min(W - 1, Math.max(0, x))];
        for (let x = 0; x < W; x++) { t[y * W + x] = sum / (2 * r + 1); sum += src[y * W + Math.min(W - 1, x + r + 1)] - src[y * W + Math.max(0, x - r)]; } }
      for (let x = 0; x < W; x++) { let sum = 0; for (let y = -r; y <= r; y++) sum += t[Math.min(H - 1, Math.max(0, y)) * W + x];
        for (let y = 0; y < H; y++) { src[y * W + x] = sum / (2 * r + 1); sum += t[Math.min(H - 1, y + r + 1) * W + x] - t[Math.max(0, y - r) * W + x]; } }
    }
  };
  // độ sáng chỉ làm mờ trong lòng mây (ngoài mây lấy theo alpha để mép không tối)
  for (let i = 0; i < W * H; i++) L[i] *= A[i];
  const A2 = A.slice(); mo(L, 7); mo(A2, 7); mo(A, 3);
  const d = new Uint8Array(W * H * 4);
  for (let y = 0; y < H; y++) for (let x = 0; x < W; x++) {
    const i = y * W + x, o = ((H - 1 - y) * W + x) * 4, l = A2[i] > 0.001 ? L[i] / A2[i] : 0.6;
    d[o] = d[o + 1] = d[o + 2] = Math.round(Math.min(1, Math.max(0, l)) * 255); d[o + 3] = Math.round(A[i] * 255);
  }
  const t = new THREE.DataTexture(d, W, H, THREE.RGBAFormat);
  t.magFilter = THREE.LinearFilter; t.minFilter = THREE.LinearMipmapLinearFilter; t.generateMipmaps = true; t.needsUpdate = true;
  return t;
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
