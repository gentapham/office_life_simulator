// Chi tiết phố phường Quận Hóng: đèn đêm (vũng sáng dưới cột đèn, quầng đèn), cửa cuốn đóng/mở theo giờ, khe sáng,
// cửa sổ sáng ngẫu nhiên, số nhà, đồng hồ điện, chậu cây, bàn thờ ông địa, hộp thư, phơi đồ, xe đẩy trong hẻm,
// nắp cống, vá đường, vạch qua đường, biển báo, sơn bó vỉa, lá rụng, vũng nước sau mưa, cà phê cóc, xe ôm chờ khách.
// Không dùng đèn thời gian thực: mọi thứ là mảng dán (decal) cộng sáng gộp chung, mỗi loại một lượt vẽ.
import * as THREE from "three";
import { mergeGeometries } from "three/addons/utils/BufferGeometryUtils.js";
import { vl, taoNguoiLaiXe } from "./nhan-vat-3d.js";
import { taoXeMay, MAU_XE } from "./xe-3d.js";

// ---------- Ảnh vẽ bằng canvas ----------
const texCache = new Map();
export function veTex(key, w, h, ve, { lap = false, srgb = true } = {}) {
  if (texCache.has(key)) return texCache.get(key);
  const c = document.createElement("canvas"); c.width = w; c.height = h;
  ve(c.getContext("2d"), w, h);
  const t = new THREE.CanvasTexture(c); if (srgb) t.colorSpace = THREE.SRGBColorSpace;
  if (lap) t.wrapS = t.wrapT = THREE.RepeatWrapping;
  texCache.set(key, t); return t;
}
// vầng tròn sáng mờ dần ra mép (vũng đèn, quầng đèn)
export const texTron = () => veTex("tron", 128, 128, (g) => {
  const gr = g.createRadialGradient(64, 64, 0, 64, 64, 64);
  gr.addColorStop(0, "#fff"); gr.addColorStop(0.18, "rgba(255,255,255,.82)"); gr.addColorStop(0.5, "rgba(255,255,255,.32)"); gr.addColorStop(0.8, "rgba(255,255,255,.08)"); gr.addColorStop(1, "rgba(255,255,255,0)");
  g.fillStyle = "#000"; g.fillRect(0, 0, 128, 128); g.fillStyle = gr; g.fillRect(0, 0, 128, 128);
}, { srgb: false });
// quầng đèn có tâm nhỏ chói
const texQuang = () => veTex("quang", 64, 64, (g) => {
  const gr = g.createRadialGradient(32, 32, 0, 32, 32, 32);
  gr.addColorStop(0, "#fff"); gr.addColorStop(0.12, "rgba(255,255,255,.9)"); gr.addColorStop(0.3, "rgba(255,255,255,.3)"); gr.addColorStop(1, "rgba(255,255,255,0)");
  g.fillStyle = "#000"; g.fillRect(0, 0, 64, 64); g.fillStyle = gr; g.fillRect(0, 0, 64, 64);
}, { srgb: false });
// chùm đèn pha chiếu xuống đường: hẹp ở đầu xe (v = 0), toả rộng và nhạt dần về phía trước
export const texChum = () => veTex("chum", 64, 128, (g, w, h) => {
  const d = g.createImageData(w, h);
  for (let y = 0; y < h; y++) for (let x = 0; x < w; x++) {
    const v = 1 - y / (h - 1), u = (x / (w - 1)) * 2 - 1;     // y canvas ngược với v
    const rong = 0.22 + 0.78 * v, ngang = Math.max(0, 1 - Math.abs(u) / rong);
    const a = Math.pow(ngang, 1.4) * Math.pow(1 - v, 1.1) * Math.min(1, v * 9);
    const k = (y * w + x) * 4; d.data[k] = d.data[k + 1] = d.data[k + 2] = Math.round(a * 255); d.data[k + 3] = 255;
  }
  g.putImageData(d, 0, 0);
}, { srgb: false });
// vệt sáng hắt ra từ cửa: sáng sát tường (v = 0), mờ dần ra ngoài, hai mép nhạt
const texHat = () => veTex("hat", 64, 64, (g, w, h) => {
  const d = g.createImageData(w, h);
  for (let y = 0; y < h; y++) for (let x = 0; x < w; x++) {
    const v = 1 - y / (h - 1), u = Math.abs((x / (w - 1)) * 2 - 1);
    const a = Math.pow(1 - v, 1.8) * Math.min(1, (1 - u) * 3.5);
    const k = (y * w + x) * 4; d.data[k] = d.data[k + 1] = d.data[k + 2] = Math.round(a * 255); d.data[k + 3] = 255;
  }
  g.putImageData(d, 0, 0);
}, { srgb: false });
// cột sáng hình nón dưới đèn (thấy rõ khi mưa, sương): đậm ở trên, nhạt dần xuống đất
const texNon = () => veTex("non", 8, 64, (g, w, h) => {
  const gr = g.createLinearGradient(0, h, 0, 0); gr.addColorStop(0, "rgba(255,255,255,.75)"); gr.addColorStop(0.75, "rgba(255,255,255,.12)"); gr.addColorStop(1, "rgba(255,255,255,0)");
  g.fillStyle = "#000"; g.fillRect(0, 0, w, h); g.fillStyle = gr; g.fillRect(0, 0, w, h);
}, { srgb: false });
// vũng nước: 4 hình loang khác nhau (2x2), trắng = có nước
const texVung = () => veTex("vung", 256, 256, (g) => {
  g.fillStyle = "#000"; g.fillRect(0, 0, 256, 256);
  let s = 77; const r = () => (s = (s * 16807) % 2147483647) / 2147483647;
  g.filter = "blur(3px)";
  for (let k = 0; k < 4; k++) {
    const ox = (k % 2) * 128 + 64, oy = Math.floor(k / 2) * 128 + 64;
    g.fillStyle = "#fff";
    for (let i = 0; i < 7; i++) { g.beginPath(); g.ellipse(ox + (r() - 0.5) * 50, oy + (r() - 0.5) * 34, 14 + r() * 22, 9 + r() * 14, r() * 3, 0, 7); g.fill(); }
  }
  g.filter = "none";
}, { srgb: false });
// lá rụng: 4 chiếc lá (vàng, nâu, xanh úa, cam)
const texLa = () => veTex("la", 128, 128, (g) => {
  g.clearRect(0, 0, 128, 128);
  [["#d8a83a", "#8a6a2a"], ["#8a5a2a", "#5a3a1a"], ["#9aa84a", "#5a6a2a"], ["#d8783a", "#8a4a1a"]].forEach(([m, gan], k) => {
    const ox = (k % 2) * 64 + 32, oy = Math.floor(k / 2) * 64 + 32;
    g.save(); g.translate(ox, oy); g.rotate(k * 0.7);
    g.fillStyle = m; g.beginPath(); g.moveTo(0, -26); g.quadraticCurveTo(18, -6, 0, 26); g.quadraticCurveTo(-18, -6, 0, -26); g.fill();
    g.strokeStyle = gan; g.lineWidth = 2; g.beginPath(); g.moveTo(0, -24); g.lineTo(0, 28); g.stroke(); g.restore();
  });
});
// nắp cống tròn (trái) và song chắn rác vuông (phải)
const texCong = () => veTex("cong", 128, 64, (g) => {
  g.clearRect(0, 0, 128, 64);
  g.fillStyle = "#3b3c3e"; g.beginPath(); g.arc(32, 32, 30, 0, 7); g.fill();
  g.strokeStyle = "#232426"; g.lineWidth = 3; g.beginPath(); g.arc(32, 32, 30, 0, 7); g.stroke(); g.beginPath(); g.arc(32, 32, 20, 0, 7); g.stroke();
  g.lineWidth = 2; for (let i = -16; i <= 16; i += 6) { g.beginPath(); g.moveTo(32 + i, 14); g.lineTo(32 + i, 50); g.stroke(); }
  g.fillStyle = "#2a2b2d"; g.fillRect(66, 4, 58, 56); g.fillStyle = "#101112"; for (let i = 0; i < 8; i++) g.fillRect(70 + i * 7, 8, 4, 48);
});
// cửa cuốn đóng: tôn sóng ngang, tay nắm, khoá, vài vết bẩn
const texCuaCuon = () => veTex("cuacuon", 128, 128, (g) => {
  g.fillStyle = "#9da3a8"; g.fillRect(0, 0, 128, 128);
  for (let y = 0; y < 128; y += 6) { g.fillStyle = "#b9bec2"; g.fillRect(0, y, 128, 2); g.fillStyle = "#7d8287"; g.fillRect(0, y + 4, 128, 1); }
  g.fillStyle = "rgba(60,50,40,.18)"; g.fillRect(0, 110, 128, 18);
  g.fillStyle = "#55595d"; g.fillRect(40, 116, 48, 5); g.fillStyle = "#2a2c2e"; g.fillRect(60, 118, 8, 6);
}, { lap: true });
// sọc sơn bó vỉa: đỏ trắng
const texSocDo = () => veTex("socdo", 64, 8, (g) => { g.fillStyle = "#c8302c"; g.fillRect(0, 0, 32, 8); g.fillStyle = "#eeeae0"; g.fillRect(32, 0, 32, 8); }, { lap: true });
const texSocVang = () => veTex("socvang", 64, 8, (g) => { g.fillStyle = "#e0b83a"; g.fillRect(0, 0, 32, 8); g.fillStyle = "#2a2b2d"; g.fillRect(32, 0, 32, 8); }, { lap: true });

// Biển báo giao thông (bảng 4x2): 0 cấm đỗ, 1 cấm dừng đỗ, 2 tốc độ 40, 3 người đi bộ cắt ngang, 4 trẻ em, 5 đi chậm, 6 cấm quay đầu, 7 biển phụ giờ
const texBienBao = () => veTex("bienbao", 512, 256, (g) => {
  g.clearRect(0, 0, 512, 256);
  const o = k => [(k % 4) * 128 + 64, Math.floor(k / 4) * 128 + 64];
  const tron = (k, nen) => { const [x, y] = o(k); g.fillStyle = "#c8202a"; g.beginPath(); g.arc(x, y, 60, 0, 7); g.fill(); g.fillStyle = nen; g.beginPath(); g.arc(x, y, 47, 0, 7); g.fill(); return [x, y]; };
  const gach = (x, y, goc) => { g.save(); g.translate(x, y); g.rotate(goc); g.fillStyle = "#c8202a"; g.fillRect(-50, -6, 100, 12); g.restore(); };
  let [x, y] = tron(0, "#1f4fa8"); gach(x, y, Math.PI / 4);
  [x, y] = tron(1, "#1f4fa8"); gach(x, y, Math.PI / 4); gach(x, y, -Math.PI / 4);
  [x, y] = tron(2, "#ffffff"); g.fillStyle = "#111"; g.font = "800 54px system-ui, sans-serif"; g.textAlign = "center"; g.textBaseline = "middle"; g.fillText("40", x, y + 3);
  [x, y] = o(3); g.fillStyle = "#1f4fa8"; g.fillRect(x - 58, y - 58, 116, 116); g.fillStyle = "#fff"; g.beginPath(); g.moveTo(x, y - 46); g.lineTo(x + 48, y + 40); g.lineTo(x - 48, y + 40); g.fill();
  g.fillStyle = "#111"; for (let i = 0; i < 4; i++) g.fillRect(x - 30 + i * 16, y + 28, 9, 8);
  g.beginPath(); g.arc(x + 2, y - 14, 6, 0, 7); g.fill(); g.lineWidth = 5; g.strokeStyle = "#111"; g.beginPath(); g.moveTo(x + 2, y - 8); g.lineTo(x - 2, y + 10); g.lineTo(x - 10, y + 24); g.moveTo(x - 2, y + 10); g.lineTo(x + 8, y + 24); g.moveTo(x - 10, y); g.lineTo(x + 12, y - 2); g.stroke();
  const tamGiac = (k) => { const [x, y] = o(k); g.fillStyle = "#c8202a"; g.beginPath(); g.moveTo(x, y - 58); g.lineTo(x + 60, y + 48); g.lineTo(x - 60, y + 48); g.fill(); g.fillStyle = "#f2c21a"; g.beginPath(); g.moveTo(x, y - 40); g.lineTo(x + 45, y + 38); g.lineTo(x - 45, y + 38); g.fill(); return [x, y]; };
  [x, y] = tamGiac(4); g.fillStyle = "#111"; g.strokeStyle = "#111"; g.lineWidth = 4;
  for (const [dx, cao] of [[-12, 1], [12, 0.8]]) { g.beginPath(); g.arc(x + dx, y - 6 - 8 * cao, 5, 0, 7); g.fill(); g.beginPath(); g.moveTo(x + dx, y - 2); g.lineTo(x + dx, y + 16); g.lineTo(x + dx - 6, y + 30); g.moveTo(x + dx, y + 16); g.lineTo(x + dx + 6, y + 30); g.stroke(); }
  [x, y] = tamGiac(5); g.fillStyle = "#111"; g.font = "800 21px system-ui, sans-serif"; g.textAlign = "center"; g.fillText("ĐI", x, y + 8); g.fillText("CHẬM", x, y + 30);
  [x, y] = tron(6, "#ffffff"); g.strokeStyle = "#111"; g.lineWidth = 8; g.beginPath(); g.moveTo(x + 14, y + 30); g.lineTo(x + 14, y - 8); g.arc(x, y - 8, 14, 0, Math.PI, true); g.lineTo(x - 14, y + 18); g.stroke();
  g.fillStyle = "#111"; g.beginPath(); g.moveTo(x - 26, y + 14); g.lineTo(x - 2, y + 14); g.lineTo(x - 14, y + 32); g.fill(); gach(x, y, Math.PI / 4);
  [x, y] = o(7); g.fillStyle = "#ffffff"; g.fillRect(x - 60, y - 22, 120, 44); g.strokeStyle = "#111"; g.lineWidth = 3; g.strokeRect(x - 58, y - 20, 116, 40);
  g.fillStyle = "#111"; g.font = "700 22px system-ui, sans-serif"; g.textAlign = "center"; g.textBaseline = "middle"; g.fillText("6h - 22h", x, y + 1);
});
const uvBienBao = (k, phu = false) => { const u0 = (k % 4) / 4, v1 = 1 - Math.floor(k / 4) / 2; return phu ? [u0 + 0.01, v1 - 0.5 * 0.67, u0 + 0.24, v1 - 0.5 * 0.33] : [u0, v1 - 0.5, u0 + 0.25, v1]; };

// chữ trên bảng nhỏ (xe đẩy, quán cóc, xe ôm)
const bangNho = (chu, nen = "#c0262d", mau = "#ffe14d") => veTex("bn" + chu + nen, 256, 96, (g, w, h) => {
  g.fillStyle = nen; g.fillRect(0, 0, w, h); g.strokeStyle = mau; g.lineWidth = 5; g.strokeRect(5, 5, w - 10, h - 10);
  g.fillStyle = mau; g.textAlign = "center"; g.textBaseline = "middle"; g.font = "800 46px 'Be Vietnam Pro', system-ui, sans-serif"; g.fillText(chu, w / 2, h / 2 + 2);
});

// ---------- Vật liệu phát sáng (không chịu ánh sáng, cộng màu) ----------
const VS_DAN = `attribute vec3 mauDinh; varying vec2 vUv; varying vec3 vMau; varying float vSau;
  void main(){ vUv = uv; vMau = mauDinh; vec4 mv = modelViewMatrix * vec4(position, 1.0); vSau = -mv.z; gl_Position = projectionMatrix * mv; }`;
const FS_DAN = `uniform sampler2D map; uniform vec3 mau; uniform float doSang; uniform vec2 suong; varying vec2 vUv; varying vec3 vMau; varying float vSau;
  void main(){ float a = texture2D(map, vUv).r; float f = 1.0 - smoothstep(suong.x, suong.y, vSau); gl_FragColor = vec4(mau * vMau * a * doSang * f, 1.0); }`;
const capSuong = (u) => (r, scene) => { const f = scene.fog; if (f) u.suong.value.set(Math.min(f.near, 60), Math.max(f.far, 40) * 1.15); };
// mảng dán cộng sáng (vũng đèn, chùm pha, khe sáng)
export function vlCong(map, mau = 0xffffff) {
  return new THREE.ShaderMaterial({
    uniforms: { map: { value: map }, mau: { value: new THREE.Color(mau) }, doSang: { value: 0 }, suong: { value: new THREE.Vector2(60, 200) } },
    vertexShader: VS_DAN, fragmentShader: FS_DAN,
    transparent: true, depthWrite: false, blending: THREE.AdditiveBlending, side: THREE.DoubleSide,
    polygonOffset: true, polygonOffsetFactor: -2, polygonOffsetUnits: -4,
  });
}
// điểm sáng (quầng đèn): kích thước theo mét, nhỏ lại theo khoảng cách
export function vlDiem(map = texQuang()) {
  return new THREE.ShaderMaterial({
    uniforms: { map: { value: map }, doSang: { value: 0 }, tiLe: { value: 600 }, suong: { value: new THREE.Vector2(60, 200) } },
    vertexShader: `attribute float kc; attribute vec3 mauDinh; uniform float tiLe; uniform vec2 suong; varying vec3 vMau; varying float vF;
      void main(){ vec4 mv = modelViewMatrix * vec4(position, 1.0); gl_Position = projectionMatrix * mv; float d = max(-mv.z, 0.2);
        gl_PointSize = clamp(kc * tiLe / d, 0.0, 200.0); vMau = mauDinh; vF = (1.0 - smoothstep(suong.x, suong.y, d)) * step(0.001, kc); }`,
    fragmentShader: `uniform sampler2D map; uniform float doSang; varying vec3 vMau; varying float vF;
      void main(){ float a = texture2D(map, gl_PointCoord).r; gl_FragColor = vec4(vMau * a * doSang * vF, 1.0); }`,
    transparent: true, depthWrite: false, blending: THREE.AdditiveBlending,
  });
}
const _v2 = new THREE.Vector2();
// gắn cập nhật tỉ lệ điểm và tầm sương trước khi vẽ
export function ganDiem(points) {
  const u = points.material.uniforms, s = capSuong(u);
  points.onBeforeRender = (r, scene, cam) => { s(r, scene); u.tiLe.value = r.getDrawingBufferSize(_v2).y / (2 * Math.tan(THREE.MathUtils.degToRad(cam.fov) / 2)); };
  return points;
}
export function ganSuong(mesh) { mesh.onBeforeRender = capSuong(mesh.material.uniforms); return mesh; }

// Bộ gom tứ giác thành một khối duy nhất (một lượt vẽ)
export class BoQuad {
  constructor() { this.p = []; this.uv = []; this.m = []; this.n = []; }
  // a (u0,v0) b (u1,v0) c (u1,v1) d (u0,v1)
  them(a, b, c, d, [u0, v0, u1, v1] = [0, 0, 1, 1], mau = [1, 1, 1]) {
    const e1 = [d[0] - a[0], d[1] - a[1], d[2] - a[2]], e2 = [b[0] - a[0], b[1] - a[1], b[2] - a[2]];
    let n = [e1[1] * e2[2] - e1[2] * e2[1], e1[2] * e2[0] - e1[0] * e2[2], e1[0] * e2[1] - e1[1] * e2[0]];
    const l = Math.hypot(...n) || 1; n = n.map(v => v / l);
    for (const [P, U, V] of [[a, u0, v0], [b, u1, v0], [c, u1, v1], [a, u0, v0], [c, u1, v1], [d, u0, v1]]) { this.p.push(P[0], P[1], P[2]); this.uv.push(U, V); this.m.push(...mau); this.n.push(...n); }
  }
  // tứ giác nằm trên mặt đất, tâm (x, z), xoay quanh trục đứng (v hướng theo +z cục bộ)
  nen(x, z, w, d, goc = 0, y = 0.03, uv, mau) {
    const c = Math.cos(goc), s = Math.sin(goc);
    const P = (lx, lz) => [x + lx * c + lz * s, y, z - lx * s + lz * c];
    this.them(P(-w / 2, -d / 2), P(w / 2, -d / 2), P(w / 2, d / 2), P(-w / 2, d / 2), uv, mau);
  }
  get rong() { return this.p.length === 0; }
  hinh() {
    const g = new THREE.BufferGeometry();
    g.setAttribute("position", new THREE.Float32BufferAttribute(this.p, 3)); g.setAttribute("normal", new THREE.Float32BufferAttribute(this.n, 3));
    g.setAttribute("uv", new THREE.Float32BufferAttribute(this.uv, 2)); g.setAttribute("mauDinh", new THREE.Float32BufferAttribute(this.m, 3));
    g.computeBoundingSphere(); return g;
  }
  luoi(mat, thuTu = 0) { const m = new THREE.Mesh(this.hinh(), mat); m.userData.rieng = true; m.renderOrder = thuTu; if (mat.uniforms?.suong) ganSuong(m); return m; }
}
export function taoDiemSang(ds, mat = vlDiem()) {
  const g = new THREE.BufferGeometry();
  g.setAttribute("position", new THREE.Float32BufferAttribute(ds.flatMap(d => [d.x, d.y, d.z]), 3));
  g.setAttribute("kc", new THREE.Float32BufferAttribute(ds.map(d => d.kc), 1));
  g.setAttribute("mauDinh", new THREE.Float32BufferAttribute(ds.flatMap(d => { const c = new THREE.Color(d.mau); return [c.r, c.g, c.b]; }), 3));
  const p = new THREE.Points(g, mat); p.userData.rieng = true; p.renderOrder = 3; return ganDiem(p);
}

// ---------- Giờ giấc ----------
const trongKhung = (h, a, b) => (a <= b ? h >= a && h < b : h >= a || h < b);
export const trongGio = (h, khung) => khung.some(([a, b]) => trongKhung(h, a % 24, b % 24));
// giờ mở cửa theo nhóm quán
export const GIO_MO = {
  A: [[7.5, 21]],             // tiệm thường: đóng sớm
  B: [[6, 22.5]],             // quán ăn, nhà thuốc, trà sữa
  C: [[6, 26.5]],             // quán nhậu, ốc, karaoke, bida: tới 2 giờ rưỡi sáng
  D: [[0, 24]],               // cửa hàng 24 giờ
  nha: [[6, 22]],             // nhà ở trong hẻm: mở cửa ban ngày
};
const MO_KHUYA = /ỐC ĐÊM|KARAOKE|NHẬU|LẨU DÊ|BIDA|KHÁCH SẠN|HỦ TIẾU|MÌ CAY|GÀ RÁN/;
const MO_TOI = /NHÀ THUỐC|TRÀ SỮA|CHÈ|BÁNH MÌ|CÀ PHÊ|PHỞ|CƠM TẤM|BÚN BÒ|SỮA TƯƠI|BÁNH XÈO|TIỆM BÁNH|ĐIỆN THOẠI|TẠP HÓA|GỘI ĐẦU|SPA|NAIL/;
export function nhomQuan(ten) { if (!ten) return "nha"; if (/24H/.test(ten)) return "D"; if (MO_KHUYA.test(ten)) return "C"; if (MO_TOI.test(ten)) return "B"; return "A"; }

// ---------- Vật liệu đêm dùng chung (tạo trước khi dựng nhà) ----------
export function taoVatLieuDem() {
  const dong = m => { m.userData.dong = true; return m; };
  // kính cửa sổ nhà ống: ba nhóm sáng đèn theo giờ khác nhau (vàng ấm, trắng đèn tuýp, vàng nhạt)
  const kinh = [0x9a7a3a, 0x8a9aa8, 0xa88a4a].map(() => dong(new THREE.MeshLambertMaterial({ color: 0x5d7d96, flatShading: true })));
  const MAU_KINH = [new THREE.Color(0x9a7a3a), new THREE.Color(0x8fa2b4), new THREE.Color(0xb08c48)];
  const GIO_KINH = [[[18, 23.5], [5.2, 6.3]], [[18.4, 25.2]], [[19, 22.2], [4.6, 6]]];
  // trong cửa hàng 24 giờ: đèn trắng sáng
  const trongSang = dong(new THREE.MeshLambertMaterial({ color: 0xdfe6ea, flatShading: true }));
  const NHOM = ["A", "B", "C", "D", "nha"];
  const cuaCuon = {}, toiBien = {}, khe = {}, hatRa = {};
  const tc = texCuaCuon();
  for (const k of NHOM) {
    cuaCuon[k] = new THREE.MeshLambertMaterial({ map: tc });
    toiBien[k] = new THREE.MeshBasicMaterial({ color: 0x000000, transparent: true, opacity: 0.62, depthWrite: false });
    khe[k] = vlCong(texHat(), 0xffc87a);     // ánh đèn lọt qua khe cửa cuốn
    hatRa[k] = vlCong(texHat(), 0xffd69a);   // ánh đèn trong quán hắt ra vỉa hè
  }
  // cửa sổ chung cư, cao ốc: bản đồ phát sáng ngẫu nhiên
  const cuaSo = [];
  const st = { kinh: [-1, -1, -1], quan: {}, cuaSo: -1 };
  return {
    kinh, trongSang, cuaCuon, toiBien, khe, hatRa, cuaSo,
    chonKinh: (r) => kinh[Math.floor(r * 3) % 3],
    capNhat(mt) {
      const { gio: h, toi } = mt;
      // cửa sổ nhà ống
      kinh.forEach((m, i) => {
        const f = trongGio(h, GIO_KINH[i]) ? toi : 0;
        if (Math.abs(f - st.kinh[i]) > 0.02) { st.kinh[i] = f; m.emissive.copy(MAU_KINH[i]).multiplyScalar(f); }
      });
      trongSang.emissive.setScalar(0.75 * toi);
      // cửa cuốn, khe sáng, bảng hiệu tắt đèn
      for (const k of NHOM) {
        const mo = trongGio(h, GIO_MO[k]);
        const thuc = k === "nha" ? trongGio(h, [[17, 23.6], [5, 6]]) : k === "A" || k === "B" ? trongGio(h, [[GIO_MO[k][0][1], 23.6], [5.2, 6]]) : false; // còn người thức sau khi đóng cửa
        cuaCuon[k].visible = !mo;
        toiBien[k].visible = !mo && toi > 0.3;
        khe[k].uniforms.doSang.value = !mo && thuc ? toi * 0.9 : 0; khe[k].visible = khe[k].uniforms.doSang.value > 0.01;
        hatRa[k].uniforms.doSang.value = mo ? toi * (k === "D" ? 0.95 : 0.6) : 0; hatRa[k].visible = hatRa[k].uniforms.doSang.value > 0.01;
      }
      // chung cư, cao ốc: khuya bớt đèn
      const fc = toi * (trongGio(h, [[18, 23]]) ? 1 : trongGio(h, [[23, 1]]) ? 0.6 : trongGio(h, [[4.5, 6.5]]) ? 0.5 : 0.3);
      if (Math.abs(fc - st.cuaSo) > 0.02) { st.cuaSo = fc; for (const m of cuaSo) m.emissive.setScalar(fc); }
    },
  };
}
// bản đồ phát sáng cho cửa sổ cao ốc (ô 16 px, 16x16 cửa) và chung cư (ô 64 px có 2x2 cửa)
export function texDenCaoOc(hat) {
  return veTex("dco" + hat, 256, 256, (g) => {
    let s = hat; const r = () => (s = (s * 16807) % 2147483647) / 2147483647;
    g.fillStyle = "#000"; g.fillRect(0, 0, 256, 256);
    for (let i = 0; i < 16; i++) for (let j = 0; j < 16; j++) if (r() < 0.38) { g.fillStyle = r() < 0.6 ? "#ffd890" : "#cfe2f2"; g.fillRect(i * 16 + 2, j * 16 + 3, 12, 10); }
  }, { lap: true });
}
export function texDenChungCu(hat) {
  return veTex("dcc" + hat, 512, 512, (g) => {
    let s = hat; const r = () => (s = (s * 16807) % 2147483647) / 2147483647;
    g.fillStyle = "#000"; g.fillRect(0, 0, 512, 512);
    for (let i = 0; i < 8; i++) for (let j = 0; j < 8; j++) if (r() < 0.42) {
      const x = i * 64, y = j * 64;
      g.fillStyle = r() < 0.55 ? "#ffcf80" : "#d6e6f2"; g.fillRect(x + 10, y + 12, 44, 34);
      g.fillStyle = "rgba(0,0,0,.6)"; for (let k = 0; k < 6; k++) g.fillRect(x + 10 + k * 8, y + 12, 2, 34); // song sắt chuồng cọp
      g.fillRect(x + 14, y + 20, 8, 14); g.fillRect(x + 30, y + 20, 8, 12); // quần áo phơi che bớt
    }
  }, { lap: true });
}

// ---------- Dựng chi tiết phố ----------
// ctx: { nhom, can, NHA, DEN, CAY, thanDung, matUot, denDem, vlDenDuong, veRanh, DEM, choNgoi, vatCan, boXe, dienThoai }
export function dungChiTietPho(ctx) {
  const { nhom, can, NHA, DEN, CAY, thanDung, matUot, denDem, vlDenDuong, veRanh, DEM, dienThoai } = ctx;
  let seed = 69069;
  const rnd = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
  const chon = a => a[Math.floor(rnd() * a.length)];
  const H = (w, h, d, mat, x, y, z, cha = nhom) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mat === "number" ? vl(mat) : mat); m.position.set(x, y + h / 2, z); cha.add(m); return m; };
  const mp = (w, h, mat, x, y, z, cha, ry = 0) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, h), mat); m.position.set(x, y, z); m.rotation.y = ry; cha.add(m); return m; };
  const gan = (x, z, r) => thanDung.some(([px, pz]) => Math.abs(px - x) < r && Math.abs(pz - z) < r);
  const capNhatDs = [];

  // ===== 1. Đèn đường: vũng sáng, quầng, cột sáng =====
  // đèn tường trong hẻm (bóng tròn có chụp), đặt ở ranh giữa hai căn, trên mái hiên
  for (const [z, x] of [[60.5, 8.05], [69, 11.95], [77, 8.05]]) {
    const s = x < 10 ? 1 : -1, zz = veRanh(x < 10 ? "dong:8" : "tay:12", z);
    H(0.4, 0.06, 0.06, 0x3a3d44, x + s * 0.2, 3.3, zz); const b = new THREE.Mesh(new THREE.SphereGeometry(0.09, 8, 6), vlDenDuong); b.position.set(x + s * 0.4, 3.22, zz); nhom.add(b); denDem.push(b);
    H(0.26, 0.05, 0.26, 0x3a3d44, x + s * 0.4, 3.3, zz);
    DEN.push({ x: x + s * 0.4, y: 3.2, z: zz, mau: 0xffd890, r: 3.6, loai: "hem" });
  }
  const vungDen = new BoQuad(), nonDen = [];
  const quangDen = [];
  for (const d of DEN) {
    const r = d.r || 6.5;
    vungDen.nen(d.x, d.z, r * 2, r * 2, 0, 0.04, [0, 0, 1, 1], new THREE.Color(d.mau).toArray());
    quangDen.push({ x: d.x, y: d.y - 0.12, z: d.z, kc: d.loai === "hem" ? 1.1 : 2.4, mau: d.mau });
    if (d.loai !== "hem") {
      const g = new THREE.CylinderGeometry(0.25, r * 0.55, d.y - 0.1, 12, 1, true); g.translate(d.x, (d.y - 0.1) / 2, d.z);
      const c = new THREE.Color(d.mau), m = new Float32Array(g.attributes.position.count * 3); for (let i = 0; i < m.length; i += 3) c.toArray(m, i);
      g.setAttribute("mauDinh", new THREE.BufferAttribute(m, 3)); g.deleteAttribute("normal"); nonDen.push(g);
    }
  }
  const vlVung = vlCong(texTron()), vlQuang = vlDiem(), vlNon = vlCong(texNon());
  nhom.add(vungDen.luoi(vlVung, 2));
  nhom.add(taoDiemSang(quangDen, vlQuang));
  const meNon = new THREE.Mesh(mergeGeometries(nonDen), vlNon); meNon.userData.rieng = true; meNon.renderOrder = 4; ganSuong(meNon); nhom.add(meNon);

  // ===== 2. Mặt tiền: số nhà, đồng hồ điện, chậu cây, bàn thờ ông địa, hộp thư, cửa cuốn, khe sáng =====
  const khe = {}, hat = {};
  for (const k of Object.keys(DEM.cuaCuon)) { khe[k] = new BoQuad(); hat[k] = new BoQuad(); }
  const theo = (g, x, y, z) => new THREE.Vector3(x, y, z).applyMatrix4(g.matrixWorld).toArray();
  // số nhà: gom số rồi vẽ một bảng chung
  const soNha = [];
  const demDay = {};
  for (const n of NHA) {
    const key = n.huong + n.coDinh;
    demDay[key] = (demDay[key] || 0) + 1;
    const so = n.hem ? `69/${demDay[key] * 2 - (n.huong === "dong" ? 1 : 0)}` : String(demDay[key] * 2 - (n.huong === "nam" || n.huong === "dong" ? 1 : 0) + (n.huong === "dong" || n.huong === "tay" ? 200 : 0));
    soNha.push(so);
  }
  const dsSo = [...new Set(soNha)], cot = 16, hang = Math.ceil(dsSo.length / cot);
  const texSo = veTex("sonha" + dsSo.length, cot * 64, hang * 48, (g) => {
    dsSo.forEach((s, i) => {
      const x = (i % cot) * 64, y = Math.floor(i / cot) * 48;
      g.fillStyle = "#1f4fa8"; g.fillRect(x + 1, y + 1, 62, 46); g.strokeStyle = "#ffffff"; g.lineWidth = 3; g.strokeRect(x + 5, y + 5, 54, 38);
      g.fillStyle = "#ffffff"; g.textAlign = "center"; g.textBaseline = "middle"; g.font = `800 ${s.length > 4 ? 19 : 24}px system-ui, sans-serif`; g.fillText(s, x + 32, y + 25, 50);
    });
  });
  const vlSo = new THREE.MeshLambertMaterial({ map: texSo });
  const denTho = new THREE.MeshBasicMaterial({ color: 0xff3a2a }); denTho.userData.dong = true; // đèn đỏ bàn thờ (giữ sáng)
  const choCayDi = [];
  NHA.forEach((n, idx) => {
    const { g, w } = n;
    g.updateMatrixWorld(true);
    // số nhà trên trụ trái
    const i = dsSo.indexOf(soNha[idx]);
    const pg = new THREE.PlaneGeometry(0.26, 0.19), uv = pg.attributes.uv;
    const u0 = (i % cot) / cot, v0 = 1 - (Math.floor(i / cot) + 1) / hang, du = 1 / cot, dv = 1 / hang;
    for (let k = 0; k < 4; k++) uv.setXY(k, u0 + uv.getX(k) * du, v0 + uv.getY(k) * dv);
    const so = new THREE.Mesh(pg, vlSo); so.position.set(0.2, 2.35, 0.258); g.add(so);
    // đồng hồ điện trên trụ phải
    if (rnd() < 0.55) { H(0.2, 0.28, 0.1, 0x9aa0a6, w - 0.2, 1.95, 0.3, g); H(0.12, 0.07, 0.01, 0x1c2a2a, w - 0.2, 2.1, 0.355, g); H(0.03, 0.4, 0.03, 0x1a1a1a, w - 0.2, 2.23, 0.28, g); }
    // hộp thư (nhà trong hẻm, nhà không bảng hiệu)
    if ((n.hem || !n.coBien) && rnd() < 0.45) { H(0.24, 0.3, 0.1, chon([0x2a5aa8, 0xc0262d, 0x2e8b57]), 0.2, 1.15, 0.3, g); H(0.16, 0.02, 0.01, 0x111111, 0.2, 1.38, 0.352, g); }
    // bàn thờ ông địa dưới đất, góc cửa (quán có bảng hiệu)
    if (n.coBien && rnd() < 0.7) {
      const x = w - 0.68;
      H(0.38, 0.32, 0.26, 0xb0201a, x, 0, 0.18, g); H(0.32, 0.24, 0.02, 0x6a120e, x, 0.04, 0.06, g);
      H(0.44, 0.05, 0.32, 0xd8a83a, x, 0.32, 0.18, g); H(0.06, 0.12, 0.06, 0xd8c08a, x, 0.04, 0.2, g);
      const tr = new THREE.Mesh(new THREE.IcosahedronGeometry(0.035, 0), vl(0xe8702a)); tr.position.set(x + 0.1, 0.07, 0.24); g.add(tr);
      for (const dx of [-0.13, 0.13]) { const b = new THREE.Mesh(new THREE.SphereGeometry(0.025, 6, 4), denTho); b.position.set(x + dx, 0.27, 0.28); g.add(b); }
      for (let k = 0; k < 3; k++) H(0.008, 0.18, 0.008, 0xc0262d, x - 0.02 + k * 0.02, 0.06, 0.26, g);
    }
    // bàn thờ thiên nhỏ trên trụ
    if (rnd() < 0.22) { H(0.26, 0.04, 0.2, 0xb0201a, w - 0.2, 1.5, 0.35, g); H(0.07, 0.07, 0.07, 0xd8c08a, w - 0.2, 1.54, 0.37, g); H(0.3, 0.03, 0.24, 0xd8a83a, w - 0.2, 1.85, 0.35, g); H(0.02, 0.3, 0.02, 0xb0201a, w - 0.31, 1.54, 0.43, g); H(0.02, 0.3, 0.02, 0xb0201a, w - 0.09, 1.54, 0.43, g); }
    // chậu cây trước cửa
    if (rnd() < (n.hem ? 0.75 : 0.25)) {
      const so2 = 1 + Math.floor(rnd() * (n.hem ? 3 : 2));
      for (let k = 0; k < so2; k++) {
        const x = 0.5 + k * 0.42, cao = rnd() < 0.3;
        const ch = new THREE.Mesh(new THREE.CylinderGeometry(0.15, 0.11, 0.28, 8), vl(chon([0xb5653a, 0x2a5aa8, 0xe9e1cf, 0x8a4a2a]))); ch.position.set(x, 0.14, 0.42); g.add(ch);
        if (cao) { const c = new THREE.Mesh(new THREE.ConeGeometry(0.2, 0.9, 6), vl(0x3d7a34)); c.position.set(x, 0.72, 0.42); g.add(c); }
        else { const l = new THREE.Mesh(new THREE.IcosahedronGeometry(0.22, 0), vl(chon([0x4f8a3c, 0x3d7a34, 0x6aa84f]))); l.position.set(x, 0.42, 0.42); g.add(l); if (rnd() < 0.4) { const hoa = new THREE.Mesh(new THREE.IcosahedronGeometry(0.07, 0), vl(chon([0xf26fa6, 0xffe14d, 0xc0262d]))); hoa.position.set(x + 0.08, 0.58, 0.48); g.add(hoa); } }
      }
    }
    // bậc thềm nhà trong hẻm
    if (n.hem) H(w - 0.5, 0.1, 0.32, 0x9a958a, w / 2, 0, 0.16, g);
    // cửa cuốn kéo xuống khi đóng cửa, khe sáng lọt ra, bảng hiệu tắt đèn
    const k = n.nhomQuan;
    mp(w - 0.6, 2.6, DEM.cuaCuon[k], w / 2, 1.3, 0.05, g);
    if (n.coBien) mp(w - 0.3, 1.15, DEM.toiBien[k], w / 2, 3.68, 0.16, g);
    if (rnd() < 0.65) {
      khe[k].them(theo(g, 0.32, 0.005, 0.07), theo(g, w - 0.32, 0.005, 0.07), theo(g, w - 0.32, 0.05, 0.07), theo(g, 0.32, 0.05, 0.07), [0, 0, 1, 0.02]);
      khe[k].them(theo(g, 0.3, 0.035, 0.07), theo(g, w - 0.3, 0.035, 0.07), theo(g, w - 0.3, 0.035, 1.1), theo(g, 0.3, 0.035, 1.1), [0, 0, 1, 1]);
    }
    hat[k].them(theo(g, -0.4, 0.038, 0.06), theo(g, w + 0.4, 0.038, 0.06), theo(g, w + 0.4, 0.038, 3.2), theo(g, -0.4, 0.038, 3.2), [0, 0, 1, 1]);
    if (k === "D") { // cửa hàng 24 giờ: đèn tuýp trắng dưới mái hiên
      const t = H(w - 0.8, 0.05, 0.05, DEM.trongSang, w / 2, 2.55, 0.2, g);
      t.material = DEM.trongSang;
    }
  });
  for (const k of Object.keys(khe)) { if (!khe[k].rong) nhom.add(khe[k].luoi(DEM.khe[k], 2)); if (!hat[k].rong) nhom.add(hat[k].luoi(DEM.hatRa[k], 2)); }

  // ===== 3. Hẻm 69: phơi đồ, xe dựng, xe đẩy, rãnh nước, người ngồi trước nhà =====
  const vach = vl(0xeeeadc);
  // rãnh thoát nước giữa hẻm và nắp song chắn
  const vlCong2 = new THREE.MeshLambertMaterial({ map: texCong(), transparent: false, alphaTest: 0.5 }); matUot.push(vlCong2);
  const cong = new BoQuad();
  for (let z = 58; z < 81; z += 7.5) cong.nen(10, z, 0.55, 0.55, 0, 0.018, [0.5, 0, 1, 1]);
  const dayDo = [], dsSao = [];
  // dây phơi đồ ngang hẻm ở ranh giữa hai căn (thấp hơn mái hiên, cao hơn đầu người)
  for (const z of [61, 67.5, 74]) {
    const zz = veRanh("dong:8", z);
    const y = 2.5;
    dsSao.push([8.05, y, zz, 11.95, y, zz]);
    for (let x = 8.6; x < 11.5; x += 0.42) if (rnd() < 0.7) {
      const ao = rnd() < 0.5;
      H(ao ? 0.36 : 0.22, ao ? 0.42 : 0.55, 0.02, chon([0xc0262d, 0xf6f6f2, 0x2a5aa8, 0xe9e04a, 0xf5b9cf, 0x2e8b57, 0x8a8d92, 0x7b4bb3]), x, y - (ao ? 0.42 : 0.55), zz);
    }
  }
  const gd = new THREE.BufferGeometry(); gd.setAttribute("position", new THREE.Float32BufferAttribute(dsSao.flat(), 3));
  const ld = new THREE.LineSegments(gd, new THREE.LineBasicMaterial({ color: 0x333333 })); ld.userData.rieng = true; nhom.add(ld);
  // xe máy dựng sát nhà trong hẻm
  for (const [x, z, r] of [[8.75, 59.2, 0.15], [11.25, 63.5, Math.PI - 0.1], [8.75, 70.5, -0.1], [11.25, 77.6, Math.PI + 0.12], [8.75, 78.6, 0.1]]) {
    const m = taoXeMay(chon(MAU_XE), rnd() < 0.5 ? "ga" : "so"); m.position.set(x, 0, z); m.rotation.y = r; nhom.add(m);
    can(x - 0.3, x + 0.3, z - 0.8, z + 0.8); ctx.vatCan.push({ x, z, r: 0.5 });
  }
  // xe đẩy bán hàng trong hẻm và ngoài phố
  const xeDay = (x, z, goc, ten) => {
    const g = new THREE.Group(); g.position.set(x, 0, z); g.rotation.y = goc; nhom.add(g);
    H(1.2, 0.08, 0.6, 0x8a8d92, 0, 0.62, 0, g); H(1.2, 0.55, 0.6, 0xcfe7f2, 0, 0.7, 0, g); H(1.24, 0.05, 0.64, 0x2a5aa8, 0, 1.25, 0, g);
    H(1.1, 0.35, 0.5, 0xb08a5a, 0, 0.27, 0, g);
    for (const s of [-1, 1]) { const b = new THREE.Mesh(new THREE.CylinderGeometry(0.2, 0.2, 0.05, 10), vl(0x1a1a1a)); b.rotation.x = Math.PI / 2; b.position.set(s * 0.4, 0.2, 0.33); g.add(b); }
    H(0.04, 0.04, 0.5, 0x5a5a5a, 0.72, 0.85, 0, g);
    mp(1.0, 0.36, new THREE.MeshBasicMaterial({ map: bangNho(ten, "#c0262d", "#ffe14d") }), 0, 1.5, 0.31, g); H(0.04, 0.3, 0.04, 0x5a5a5a, -0.5, 1.28, 0.28, g); H(0.04, 0.3, 0.04, 0x5a5a5a, 0.5, 1.28, 0.28, g);
    for (let i = 0; i < 4; i++) H(0.18, 0.1, 0.18, chon([0xf2d27a, 0xe8b860, 0xf6f6f2]), -0.4 + i * 0.26, 0.75, 0, g);
    const c = Math.abs(Math.cos(goc)), s2 = Math.abs(Math.sin(goc));
    const hx = 0.65 * c + 0.35 * s2, hz = 0.65 * s2 + 0.35 * c;
    can(x - hx, x + hx, z - hz, z + hz); ctx.vatCan.push({ x, z, r: 0.75 });
  };
  xeDay(11.3, 72, -Math.PI / 2, "XÔI GÀ");
  xeDay(-96.5, 43.55, Math.PI, "BÁNH CĂN");

  // ===== 4. Mặt đường: nắp cống, vá đường, vạch qua đường, sơn bó vỉa, biển báo =====
  for (let x = -176; x < 176; x += 23 + Math.floor(rnd() * 9)) if (x < 40 || x > 64) cong.nen(x, rnd() < 0.5 ? 35.4 : 38.6, 0.85, 0.85, rnd() * 3, 0.017, [0, 0, 0.5, 1]);
  for (let z = -110; z < 150; z += 27 + Math.floor(rnd() * 8)) if (z < 28 || z > 46) cong.nen(rnd() < 0.5 ? 49.6 : 54.4, z, 0.85, 0.85, rnd() * 3, 0.017, [0, 0, 0.5, 1]);
  // song chắn rác sát lề
  for (let x = -170; x < 170; x += 18) if (x < 40 || x > 64) { cong.nen(x + 3, 32.75, 0.7, 0.4, 0, 0.018, [0.5, 0, 1, 1]); cong.nen(x + 11, 41.25, 0.7, 0.4, 0, 0.018, [0.5, 0, 1, 1]); }
  nhom.add(cong.luoi(vlCong2));
  // vá đường: mảng nhựa mới đậm màu, mảng cũ nhạt màu, mép loang
  const vlVa = [new THREE.MeshLambertMaterial({ color: 0x2c2e32, alphaMap: texVung(), alphaTest: 0.35 }), new THREE.MeshLambertMaterial({ color: 0x4a4b4e, alphaMap: texVung(), alphaTest: 0.35 })];
  for (const m of vlVa) { m.userData.dong = true; matUot.push(m); m.polygonOffset = true; m.polygonOffsetFactor = -1; m.polygonOffsetUnits = -2; }
  const va = [new BoQuad(), new BoQuad()];
  const uvLoang = () => { const k = Math.floor(rnd() * 4); return [(k % 2) * 0.5, Math.floor(k / 2) * 0.5, (k % 2) * 0.5 + 0.5, Math.floor(k / 2) * 0.5 + 0.5]; };
  for (let i = 0; i < 26; i++) {
    const tren = rnd() < 0.7, x = tren ? -170 + rnd() * 340 : 47.6 + rnd() * 8.8, z = tren ? 33 + rnd() * 8 : -110 + rnd() * 250;
    if (tren && x > 40 && x < 64) continue;
    va[i % 2].nen(x, z, 1.2 + rnd() * 2.2, 0.9 + rnd() * 1.6, rnd() * 3, 0.006, uvLoang());
  }
  va.forEach((b, i) => nhom.add(b.luoi(vlVa[i], 0)));
  // vạch qua đường giữa phố (trước cổng công ty, trạm buýt, chợ)
  const phang = (w, d, mat, x, z, y) => { const m = new THREE.Mesh(new THREE.PlaneGeometry(w, d), mat); m.rotation.x = -Math.PI / 2; m.position.set(x, y, z); nhom.add(m); };
  const vachQua = [];
  for (const x of [4, -30, 90]) { for (let i = 0; i < 8; i++) phang(2.6, 0.5, vach, x, 33.15 + i * 1.1, 0.016); vachQua.push({ truc: "x", x, z1: 32.5, z2: 41.5 }); }
  for (const z of [-2, 70]) { for (let i = 0; i < 8; i++) phang(0.5, 2.6, vach, 47.7 + i * 1.23, z, 0.016); vachQua.push({ truc: "z", z, x1: 47, x2: 57 }); }
  // sơn bó vỉa đỏ trắng gần ngã tư, vàng đen ở trạm buýt
  const vlSon = [new THREE.MeshLambertMaterial({ map: texSocDo() }), new THREE.MeshLambertMaterial({ map: texSocVang() })];
  vlSon.forEach(m => matUot.push(m));
  const son = (x1, x2, z1, z2, loai) => {
    const dx = x2 - x1, dz = z2 - z1, dai = Math.max(dx, dz);
    const g = new THREE.BoxGeometry(dx || 0.14, 0.14, dz || 0.14), uv = g.attributes.uv;
    for (let k = 0; k < uv.count; k++) uv.setX(k, uv.getX(k) * dai);
    const m = new THREE.Mesh(g, vlSon[loai]); m.position.set((x1 + x2) / 2, 0.065, (z1 + z2) / 2); nhom.add(m);
  };
  for (const [a, b] of [[32, 44.9], [59.1, 72]]) { son(a, b, 32.45, 32.45, 0); son(a, b, 41.55, 41.55, 0); }
  for (const [a, b] of [[18, 30.4], [43.6, 56]]) { son(46.95, 46.95, a, b, 0); son(57.05, 57.05, a, b, 0); }
  for (const x of [-30, 90]) son(x - 6, x + 6, 41.55, 41.55, 1);
  // biển báo giao thông trên cột sắt sơn trắng đỏ, đặt ở ranh giữa hai căn để không che bảng hiệu
  const vlBien = new THREE.MeshLambertMaterial({ map: texBienBao(), alphaTest: 0.5 });
  const bien = (x, z, goc, loai, phu = false) => {
    let xx = x, zz = z;
    for (let k = 0; k < 6 && gan(xx, zz, 0.9); k++) { if (Math.abs(Math.sin(goc)) > 0.5) zz += 1.0; else xx += 1.0; }
    const g = new THREE.Group(); g.position.set(xx, 0, zz); g.rotation.y = goc; nhom.add(g);
    H(0.07, 2.75, 0.07, 0xd8d8d8, 0, 0, -0.04, g); for (let y = 0.3; y < 2.0; y += 0.5) H(0.075, 0.25, 0.075, 0xc8202a, 0, y, -0.04, g);
    const tam = new THREE.PlaneGeometry(0.62, 0.62), uv = tam.attributes.uv, [u0, v0, u1, v1] = uvBienBao(loai);
    for (let k = 0; k < 4; k++) uv.setXY(k, uv.getX(k) ? u1 : u0, uv.getY(k) ? v1 : v0);
    const m = new THREE.Mesh(tam, vlBien); m.position.set(0, 2.42, 0); g.add(m);
    const sau = new THREE.Mesh(new THREE.CircleGeometry(loai === 3 ? 0.4 : 0.3, loai === 3 ? 4 : loai === 4 || loai === 5 ? 3 : 16), vl(0x9a9da2)); // mặt sau
    sau.rotation.y = Math.PI; if (loai === 3) sau.rotation.z = Math.PI / 4; if (loai === 4 || loai === 5) { sau.rotation.z = Math.PI / 2 * 3; sau.position.y = -0.04; }
    sau.position.add(new THREE.Vector3(0, 2.42, -0.012)); g.add(sau);
    if (phu) { const p = new THREE.PlaneGeometry(0.5, 0.17), uvp = p.attributes.uv, [a0, b0, a1, b1] = uvBienBao(7, true); for (let k = 0; k < 4; k++) uvp.setXY(k, uvp.getX(k) ? a1 : a0, uvp.getY(k) ? b1 : b0); const mm = new THREE.Mesh(p, vlBien); mm.position.set(0, 2.0, 0); g.add(mm); H(0.5, 0.17, 0.01, 0x9a9da2, 0, 1.915, -0.012, g); }
    can(xx - 0.08, xx + 0.08, zz - 0.08, zz + 0.08); thanDung.push([xx, zz]); ctx.vatCan.push({ x: xx, z: zz, r: 0.25 });
  };
  bien(veRanh("bac:30", -60), 32.2, 0, 0, true); bien(veRanh("nam:44.5", -118), 41.85, -Math.PI / 2, 2); bien(veRanh("bac:30", 128), 32.2, Math.PI / 2, 2);
  bien(veRanh("nam:44.5", 6.3), 41.85, Math.PI, 3); bien(veRanh("bac:30", 1.4), 32.2, 0, 3);
  bien(veRanh("nam:44.5", -33.6), 41.85, Math.PI, 3); bien(veRanh("nam:44.5", 86), 41.85, Math.PI, 3);
  bien(46.6, veRanh("dong:44", 12), Math.PI, 5); bien(57.4, veRanh("tay:60", -14), 0, 1);
  bien(46.6, veRanh("dong:44", 22), Math.PI, 6); bien(veRanh("nam:44.5", 18), 41.85, -Math.PI / 2, 4);

  // ===== 5. Lá rụng dưới tán cây =====
  const vlLa = new THREE.MeshLambertMaterial({ map: texLa(), alphaTest: 0.5, side: THREE.DoubleSide });
  const la = new BoQuad();
  for (const c of CAY) for (let i = 0; i < (dienThoai ? 4 : 9); i++) {
    const r = 0.5 + rnd() * 1.9, a = rnd() * 6.3, k = Math.floor(rnd() * 4), s = 0.14 + rnd() * 0.08;
    la.nen(c.x + Math.cos(a) * r, c.z + Math.sin(a) * r, s, s, rnd() * 6.3, 0.022 + rnd() * 0.004, [(k % 2) * 0.5, Math.floor(k / 2) * 0.5, (k % 2) * 0.5 + 0.5, Math.floor(k / 2) * 0.5 + 0.5]);
  }
  nhom.add(la.luoi(vlLa));

  // ===== 6. Vũng nước sau mưa: phản chiếu màu trời, đọng ở mép đường, ổ gà, vỉa hè trũng, giữa hẻm =====
  const vung = new BoQuad();
  const themVung = (x, z, w, d, goc) => vung.nen(x, z, w, d, goc, 0.026, uvLoang());
  for (let x = -170; x < 170; x += 9 + rnd() * 14) if (x < 40 || x > 64) { themVung(x, rnd() < 0.5 ? 33.1 : 40.9, 1.4 + rnd() * 2.4, 0.7 + rnd() * 0.6, (rnd() - 0.5) * 0.3); }
  for (let z = -105; z < 145; z += 14 + rnd() * 14) if (z < 28 || z > 46) themVung(rnd() < 0.5 ? 47.6 : 56.4, z, 0.7 + rnd() * 0.5, 1.4 + rnd() * 2, (rnd() - 0.5) * 0.3);
  for (let i = 0; i < 10; i++) themVung(-150 + rnd() * 300, 37 + (rnd() - 0.5) * 6, 0.8 + rnd() * 1.4, 0.6 + rnd(), rnd() * 3);
  for (let i = 0; i < 6; i++) themVung(-140 + rnd() * 280, rnd() < 0.5 ? 31.6 : 42.4, 0.9 + rnd(), 0.5 + rnd() * 0.4, rnd() * 3);
  for (const z of [59, 64.5, 71, 76.5, 80]) themVung(10 + (rnd() - 0.5) * 1.2, z, 0.9 + rnd() * 0.8, 1.2 + rnd(), rnd() * 3);
  const vlVung2 = new THREE.MeshBasicMaterial({ color: 0x8a9aa8, alphaMap: texVung(), transparent: true, opacity: 0, depthWrite: false, polygonOffset: true, polygonOffsetFactor: -1, polygonOffsetUnits: -3 });
  const meVung = vung.luoi(vlVung2, 1);
  const _c = new THREE.Color(), NEN_VUNG = new THREE.Color(0x24272c);
  meVung.onBeforeRender = (r, scene) => { if (scene.fog) vlVung2.color.copy(_c.copy(scene.fog.color).lerp(NEN_VUNG, 0.4)); };
  nhom.add(meVung);
  capNhatDs.push(mt => { vlVung2.opacity = Math.min(0.82, mt.uot * 0.95); vlVung2.visible = mt.uot > 0.04; });

  // ===== 7. Cà phê cóc: ghế nhựa thấp xếp hàng sát tường, ngồi nhìn ra đường =====
  const gheNhua = (x, z, mau = chon([0xc0262d, 0x2a5aa8, 0x2e8b57])) => { H(0.32, 0.04, 0.32, mau, x, 0.4, z); for (const [a, b] of [[-1, -1], [1, -1], [-1, 1], [1, 1]]) H(0.04, 0.4, 0.04, mau, x + a * 0.13, 0, z + b * 0.13); };
  const banNho = (x, z) => { H(0.42, 0.03, 0.42, chon([0x2a5aa8, 0xc0262d, 0xd9c9a8]), x, 0.42, z); for (const [a, b] of [[-1, -1], [1, -1], [-1, 1], [1, 1]]) H(0.035, 0.42, 0.035, 0x5a5a5a, x + a * 0.17, 0, z + b * 0.17); const ly = new THREE.Mesh(new THREE.CylinderGeometry(0.04, 0.035, 0.11, 8), vl(0x7a4a2a)); ly.position.set(x + 0.08, 0.5, z); nhom.add(ly); };
  const caPheCoc = (x1, x2, tuong, truc, ra, gio) => {
    // truc "x": hàng ghế chạy dọc trục x, ra = hướng ra đường theo z (+1/-1); "z": dọc trục z, ra theo x
    const huong = truc === "x" ? (ra > 0 ? 0 : Math.PI) : (ra > 0 ? Math.PI / 2 : -Math.PI / 2);
    let i = 0;
    for (let a = x1; a <= x2; a += 0.75, i++) {
      const [x, z] = truc === "x" ? [a, tuong + ra * 0.45] : [tuong + ra * 0.45, a];
      gheNhua(x, z);
      ctx.choNgoi.push({ x, z, huong, ngoi: true, gio, loai: "caPhe" });
      if (i % 2 === 0) { const [bx, bz] = truc === "x" ? [a + 0.37, tuong + ra * 1.0] : [tuong + ra * 1.0, a + 0.37]; banNho(bx, bz); }
    }
    // thùng đá, bảng "CÀ PHÊ"
    const [tx, tz] = truc === "x" ? [x2 + 0.7, tuong + ra * 0.4] : [tuong + ra * 0.4, x2 + 0.7];
    H(0.55, 0.45, 0.4, 0xd02a2a, tx, 0, tz); H(0.57, 0.06, 0.42, 0xf2f2f2, tx, 0.45, tz);
    const b = new THREE.Mesh(new THREE.PlaneGeometry(0.62, 0.24), new THREE.MeshBasicMaterial({ map: bangNho("CÀ PHÊ", "#3a2416", "#f6e2b0"), side: THREE.DoubleSide }));
    b.position.set(tx, 0.85, tz); b.rotation.y = truc === "x" ? 0 : Math.PI / 2; nhom.add(b); H(0.03, 0.62, 0.03, 0x5a5a5a, tx, 0.45, tz);
    const cx = truc === "x" ? (x1 + x2) / 2 : tuong + ra * 0.7, cz = truc === "x" ? tuong + ra * 0.7 : (x1 + x2) / 2;
    if (truc === "x") can(x1 - 0.3, x2 + 1.0, Math.min(tuong, tuong + ra * 1.25), Math.max(tuong, tuong + ra * 1.25)); else can(Math.min(tuong, tuong + ra * 1.25), Math.max(tuong, tuong + ra * 1.25), x1 - 0.3, x2 + 1.0);
    for (let a = x1; a <= x2 + 0.7; a += 0.8) ctx.vatCan.push(truc === "x" ? { x: a, z: tuong + ra * 0.8, r: 0.55 } : { x: tuong + ra * 0.8, z: a, r: 0.55 });
    void cx; void cz;
  };
  caPheCoc(-79.4, -76.4, 44.5, "x", -1, [[6, 10.5], [15.5, 22]]);
  caPheCoc(84.2, 87.2, 60, "z", -1, [[6.5, 11], [14.5, 21.5]]);
  caPheCoc(33.6, 36.6, 30, "x", 1, [[6, 9.5], [16, 22.5]]);

  // ===== 8. Xe ôm chờ khách: ngồi vắt vẻo trên yên xe dựng sát lề =====
  const xeOm = (x, z, goc, congNghe = false) => {
    const g = new THREE.Group(); g.position.set(x, 0, z); g.rotation.y = goc; nhom.add(g);
    g.add(taoXeMay(congNghe ? 0x2a2c31 : chon([0xc0262d, 0x1c1c1f, 0x2a5aa8]), "so"));
    const lx = taoNguoiLaiXe(rnd, { aoXeOm: congNghe }); lx.position.set(0, 0.86, -0.18); g.add(lx);
    if (!congNghe) { const b = new THREE.Mesh(new THREE.PlaneGeometry(0.44, 0.17), new THREE.MeshBasicMaterial({ map: bangNho("XE ÔM", "#f2d23a", "#1c1c1f"), side: THREE.DoubleSide })); b.position.set(0, 0.86, 0.55); g.add(b); }
    can(x - 0.45, x + 0.45, z - 0.45, z + 0.45); ctx.vatCan.push({ x, z, r: 0.7 });
  };
  xeOm(7.05, 43.45, Math.PI + 0.35); xeOm(-26.4, 43.4, Math.PI - 0.3); xeOm(61.3, 43.5, Math.PI + 0.25, true);

  // ===== 9. Nhóm người tụ tập tán gẫu (vị trí đứng; người do giao thông dựng) =====
  ctx.nhomNoi.push({ x: 10, z: 66.2, gio: [[7, 11], [16, 21.5]] }, { x: -72.5, z: 42.75, gio: [[7.5, 21]] }, { x: 45.7, z: -58, gio: [[8, 20]] }, { x: 108, z: 31.25, gio: [[16, 22]] });
  for (const c of ctx.nhomNoi) ctx.vatCan.push({ x: c.x, z: c.z, r: 0.9 });
  // người ngồi ghế nhựa trước nhà trong hẻm (chiều tối hóng mát, sáng sớm uống trà)
  for (const [x, z, h] of [[8.62, 62.6, Math.PI / 2], [11.38, 69.2, -Math.PI / 2], [8.62, 75.4, Math.PI / 2], [11.38, 60.1, -Math.PI / 2]]) {
    const zz = veRanh(x < 10 ? "dong:8" : "tay:12", z) + 0.55;
    gheNhua(x, zz); ctx.choNgoi.push({ x, z: zz, huong: h, ngoi: true, gio: [[5.5, 8.5], [16.5, 21.5]], loai: "hem" });
  }

  return {
    vachQua,
    capNhat(mt) {
      vlVung.uniforms.doSang.value = mt.denDuong * 0.85;
      vlQuang.uniforms.doSang.value = mt.denDuong;
      vlNon.uniforms.doSang.value = mt.denDuong * (0.05 + mt.mua * 0.1 + mt.u * 0.04);
      vlVung.visible = vlQuang.visible = vlNon.visible = mt.denDuong > 0.01;
      denTho.color.setHex(mt.toi > 0.3 ? 0xff4a30 : 0xc8302a);
      for (const f of capNhatDs) f(mt);
    },
  };
}
