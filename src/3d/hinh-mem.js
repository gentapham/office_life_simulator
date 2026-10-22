// Hình mềm: bộ khối dựng kiểu tranh vẽ tay (vát cạnh, tròn trịa, hơi méo cho có hồn) thay cho hộp vuông vức.
// Mọi khối mới đều nằm GỌN trong hộp bao của khối cũ mà nó thay (không đổi va chạm, không đâm xuyên đồ bên cạnh).
// Máy yếu (cheDoNhe, mức "Thấp"): các hàm trả lại đúng hình cũ (BoxGeometry, Icosahedron...) để giữ nguyên chi phí.
// Hình dùng chung theo kích thước (bộ nhớ đệm), gopKhoi gộp lại thành ít lượt vẽ như trước.
import * as THREE from "three";
import { ConvexHull } from "three/addons/math/ConvexHull.js";
import { mergeGeometries, mergeVertices } from "three/addons/utils/BufferGeometryUtils.js";
import { cheDoNhe } from "../cai-dat.js";
import { VL_MAU_DINH, VL_MAU_DINH_2MAT } from "./gop-khoi.js";

// bật hình mềm (mọi mức trừ "Thấp"); đọc một lần lúc dựng bản đồ
// Kiểm thử so sánh: localStorage owfad_hinh_mem = "tat" để dựng hình cũ ở mọi mức (hoặc "xe,cay,hop..." tắt từng nhóm).
let _mem = null, _tat = null;
const docTat = () => { try { return (localStorage.getItem("owfad_hinh_mem") || "").split(","); } catch { return []; } };
export const memBat = (nhom = null) => {
  _mem ??= !cheDoNhe() && !docTat().includes("tat");
  if (!_mem || !nhom) return _mem;
  _tat ??= new Set(docTat());
  return !_tat.has(nhom);
};

const lam = (v, k = 1000) => Math.round(v * k);

// ---------- Hộp vát cạnh ----------
// khuôn: 24 đỉnh (mỗi góc 3 đỉnh lùi vào theo hai trục), bao lồi cho ra 6 mặt + 12 dải vát + 8 tam giác góc = 44 tam giác
let KHUON_VAT = null;
function khuonVat() {
  if (KHUON_VAT) return KHUON_VAT;
  const dinh = []; // [sx, sy, sz, truc lồi ra]
  for (const sx of [-1, 1]) for (const sy of [-1, 1]) for (const sz of [-1, 1]) for (const t of [0, 1, 2]) dinh.push([sx, sy, sz, t]);
  const diem = (d, X, Y, Z, r) => new THREE.Vector3(d[0] * (d[3] === 0 ? X : X - r), d[1] * (d[3] === 1 ? Y : Y - r), d[2] * (d[3] === 2 ? Z : Z - r));
  const pts = dinh.map(d => diem(d, 1, 1.3, 1.7, 0.31));
  const hull = new ConvexHull().setFromPoints(pts);
  const tg = [];
  const tim = p => pts.findIndex(q => q.distanceToSquared(p) < 1e-8);
  for (const f of hull.faces) {
    const vong = []; let e = f.edge;
    do { vong.push(tim(e.head().point)); e = e.next; } while (e !== f.edge);
    for (let i = 1; i < vong.length - 1; i++) tg.push(vong[0], vong[i], vong[i + 1]);
  }
  KHUON_VAT = { dinh, tg, diem };
  return KHUON_VAT;
}
const cacheVat = new Map();
// hộp w x h x d tâm ở gốc, vát cạnh r; tren: [kx, kz, dz] thu nhỏ mặt trên (cabin xe, kính chắn gió)
export function hinhVat(w, h, d, r, tren = null) {
  r = Math.min(r, w / 2 - 1e-4, h / 2 - 1e-4, d / 2 - 1e-4);
  if (r <= 0.002) return new THREE.BoxGeometry(w, h, d);
  const key = [lam(w), lam(h), lam(d), lam(r), tren ? tren.map(v => lam(v)).join(",") : ""].join("|");
  let g = cacheVat.get(key);
  if (g) return g;
  const K = khuonVat(), X = w / 2, Y = h / 2, Z = d / 2;
  const P = K.dinh.map(dd => {
    const p = K.diem(dd, X, Y, Z, r);
    if (tren && p.y > 0) { const k = (p.y + Y) / h; p.x *= 1 + (tren[0] - 1) * k; p.z = p.z * (1 + (tren[1] - 1) * k) + (tren[2] || 0) * k; }
    return p;
  });
  const pos = new Float32Array(K.tg.length * 3), nor = new Float32Array(K.tg.length * 3);
  const a = new THREE.Vector3(), b = new THREE.Vector3(), n = new THREE.Vector3();
  for (let i = 0; i < K.tg.length; i += 3) {
    const p0 = P[K.tg[i]], p1 = P[K.tg[i + 1]], p2 = P[K.tg[i + 2]];
    n.crossVectors(a.subVectors(p1, p0), b.subVectors(p2, p0)).normalize();
    [p0, p1, p2].forEach((p, j) => { pos.set([p.x, p.y, p.z], (i + j) * 3); nor.set([n.x, n.y, n.z], (i + j) * 3); });
  }
  g = new THREE.BufferGeometry();
  g.setAttribute("position", new THREE.BufferAttribute(pos, 3)); g.setAttribute("normal", new THREE.BufferAttribute(nor, 3));
  g.setAttribute("uv", new THREE.BufferAttribute(new Float32Array(K.tg.length * 2), 2));
  cacheVat.set(key, g);
  return g;
}
// bán kính vát tự động: cạnh nhỏ nhất quyết định (khối mỏng như tấm ván, dây, song sắt giữ nguyên hộp)
export function banKinhVat(w, h, d) {
  const m = Math.min(w, h, d);
  if (m < 0.1 || Math.max(w, h, d) < 0.35) return 0;
  return m < 0.6 ? m * 0.18 : Math.min(0.14, 0.06 + m * 0.03);
}
// hình hộp cho các hàm dựng: máy yếu là BoxGeometry như cũ; còn lại vát cạnh (vẫn trong đúng hộp bao)
export function hinhHop(w, h, d, r = null) {
  if (!memBat()) return new THREE.BoxGeometry(w, h, d);
  const rr = r ?? banKinhVat(w, h, d);
  return rr > 0 ? hinhVat(w, h, d, rr) : new THREE.BoxGeometry(w, h, d);
}
// chỉ vát khối lớn (khối nhà, cột, kiện hàng): dùng cho phố nơi có hàng nghìn khối nhỏ
export function hinhHopLon(w, h, d, m = null) {
  if (coAnh(m) || !memBat() || Math.min(w, h, d) < 0.25 || Math.max(w, h, d) < 2.5) return new THREE.BoxGeometry(w, h, d);
  return hinhVat(w, h, d, banKinhVat(w, h, d));
}
// vật liệu có ảnh cần toạ độ ảnh của hộp: giữ hộp thường
export const coAnh = m => !!(m && (Array.isArray(m) || m.map));
export function hinhHopVL(w, h, d, m, r = null) { return coAnh(m) ? new THREE.BoxGeometry(w, h, d) : hinhHop(w, h, d, r); }

// ---------- Nhiễu nhẹ cho khối méo ----------
const hash3 = (x, y, z, s) => { const v = Math.sin(x * 127.1 + y * 311.7 + z * 74.7 + s * 19.19) * 43758.5453; return v - Math.floor(v); };
// nhiễu mượt trên mặt cầu đơn vị (vài sóng sin chồng nhau, đủ cho méo tay)
const nhieu = (x, y, z, s) => {
  const a = hash3(1, 2, 3, s) * 6.28, b = hash3(4, 5, 6, s) * 6.28, c = hash3(7, 8, 9, s) * 6.28;
  return 0.5 * Math.sin(x * 2.1 + y * 1.3 + a) * Math.cos(z * 1.7 - y * 0.6 + b) + 0.35 * Math.sin(x * 3.7 - z * 2.9 + c) + 0.15 * Math.sin(y * 5.1 + x * 4.3 + a + b);
};

// ---------- Khối tán lá (cục tròn méo) ----------
// bán kính đỉnh lớn nhất = 0,85 (đúng hộp bao của IcosahedronGeometry(1, 0) cũ) để thay thế không phình ra
const cacheTan = new Map();
export function hinhTan(bien = 0, chiTiet = 1, me = 0.13) {
  const key = bien + "|" + chiTiet + "|" + me;
  let g = cacheTan.get(key);
  if (g) return g;
  g = mergeVertices(new THREE.IcosahedronGeometry(1, chiTiet).deleteAttribute("uv").deleteAttribute("normal"));
  const p = g.attributes.position, v = new THREE.Vector3();
  let max = 0;
  for (let i = 0; i < p.count; i++) {
    v.fromBufferAttribute(p, i).normalize();
    const k = 1 + me * nhieu(v.x, v.y, v.z, bien + 1) - (v.y < -0.4 ? (-0.4 - v.y) * 0.35 : 0); // đáy hơi bằng
    v.multiplyScalar(k); p.setXYZ(i, v.x, v.y, v.z);
    max = Math.max(max, Math.abs(v.x), Math.abs(v.y), Math.abs(v.z));
  }
  g.scale(0.85 / max, 0.85 / max, 0.85 / max);
  g = g.toNonIndexed(); g.computeVertexNormals();
  cacheTan.set(key, g);
  return g;
}
// tô màu đỉnh: đáy tối, đỉnh sáng ngả vàng (kiểu tô màu tán cây trong tranh)
const _c1 = new THREE.Color(), _c2 = new THREE.Color(), _hsl = {};
export function toMauDoc(g, mau, { toi = 0.68, sang = 1.12, am = 0.03, y0 = null, y1 = null } = {}) {
  g = g.clone();
  const p = g.attributes.position, n = p.count, c = new Float32Array(n * 3);
  if (y0 == null || y1 == null) { g.computeBoundingBox(); y0 = g.boundingBox.min.y; y1 = g.boundingBox.max.y; }
  const base = new THREE.Color(mau);
  for (let i = 0; i < n; i++) {
    const t = Math.min(1, Math.max(0, (p.getY(i) - y0) / (y1 - y0 || 1)));
    _c1.copy(base); _c1.getHSL(_hsl);
    _c1.setHSL(_hsl.h - am * t, _hsl.s, _hsl.l);
    _c1.multiplyScalar(toi + (sang - toi) * t * t * (3 - 2 * t));
    c[i * 3] = _c1.r; c[i * 3 + 1] = _c1.g; c[i * 3 + 2] = _c1.b;
  }
  g.setAttribute("color", new THREE.BufferAttribute(c, 3));
  return g;
}
const cacheTanMau = new Map();
// mesh cục tán lá: tâm (x, y, z), bán kính r (cùng nghĩa với IcosahedronGeometry(r, 0) cũ), dẹt theo sy
export function cucTan(r, mau, x, y, z, { bien = 0, sy = 1, sx = 1, sz = 1, chiTiet = 1, ry = 0 } = {}) {
  const key = bien % 6 + "|" + mau + "|" + chiTiet;
  let g = cacheTanMau.get(key);
  if (!g) { g = toMauDoc(chiTiet ? hinhTan(bien % 6, chiTiet) : hinhTan(bien % 6 + 10, 0, 0.1), mau); cacheTanMau.set(key, g); }
  const m = new THREE.Mesh(g, VL_MAU_DINH);
  m.position.set(x, y, z); m.scale.set(r * sx, r * sy, r * sz); m.rotation.y = ry;
  return m;
}

// màu tán cây kiểu tranh: xanh lá ngả lam, dịu mắt (máy yếu giữ màu cũ)
export const MAU_TAN = { 0x3d7a34: 0x3f7a4c, 0x4f8a3c: 0x5a8c4c, 0x2f6b2a: 0x2f6446, 0x6aa84f: 0x79a85a, 0x5a8f3e: 0x4f8650 };

// ---------- Thân cây thuôn, hơi cong ----------
const cacheThan = new Map();
// thân cao h (gốc ở y = 0, ngọn ở y = h), gốc r0, ngọn r1, cong lệch 'cong' (m) về phía +x ở ngọn; gốc loe nhẹ
export function hinhThan(h, r0, r1, cong = 0, seg = 6, doan = 4) {
  const key = [lam(h, 100), lam(r0), lam(r1), lam(cong, 100), seg, doan].join("|");
  let g = cacheThan.get(key);
  if (g) return g;
  g = new THREE.CylinderGeometry(r1, r0, h, seg, doan, true);
  const p = g.attributes.position;
  for (let i = 0; i < p.count; i++) {
    const y = p.getY(i) + h / 2, t = y / h;
    const loe = 1 + Math.max(0, 0.18 - t) * 2.2; // gốc loe
    const x = p.getX(i) * loe, z = p.getZ(i) * loe;
    p.setXYZ(i, x + cong * t * t, y, z + cong * 0.35 * Math.sin(t * Math.PI));
  }
  g = g.toNonIndexed(); g.computeVertexNormals();
  cacheThan.set(key, g);
  return g;
}

// ---------- Cây ----------
// dựng cây vào nhóm cha: thân thuôn cong + nhánh + nhiều cục tán (giữ nguyên vị trí, cỡ các cục tán cũ, thêm vài cục nhỏ ở giữa)
// tan: [{ x, y, z, r, mau }] toạ độ thế giới (trong cha); goc: [x, z] gốc cây; cao: chiều cao thân cũ; rGoc: bán kính gốc cũ
export function dungCay(cha, { goc, cao, rGoc, rNgon, tan, mauThan = 0x6b4a2f, vlThan = null, them = true, hat = 0 }) {
  const [x0, z0] = goc;
  // thân hơi nghiêng về phía tán
  let cx = 0, cz = 0, cy = 0, rTB = 0;
  for (const t of tan) { cx += t.x; cz += t.z; cy += t.y; rTB += t.r; }
  cx /= tan.length; cz /= tan.length; cy /= tan.length; rTB /= tan.length;
  const lx = cx - x0, lz = cz - z0, l = Math.hypot(lx, lz), cong = Math.min(l * 0.6, cao * 0.08);
  const than = new THREE.Mesh(hinhThan(cao, rGoc, rNgon, cong, 6, 3), vlThan || vlMau(mauThan));
  const gocXoay = l > 1e-3 ? Math.atan2(-lz, lx) : hat * 6.28, cg = Math.cos(gocXoay), sg = Math.sin(gocXoay);
  than.position.set(x0, 0, z0); than.rotation.y = gocXoay;
  cha.add(than);
  // tâm thân (đã uốn) ở độ cao y: cùng công thức uốn trong hinhThan, xoay theo hướng thân
  const tamThan = y => { const t = y / cao, bx = cong * t * t, bz = cong * 0.35 * Math.sin(t * Math.PI); return [x0 + bx * cg + bz * sg, z0 - bx * sg + bz * cg]; };
  // hai nhánh mọc từ thân vươn vào tán
  if (them) for (let i = 0; i < 2; i++) {
    const yb = cao * (0.72 + i * 0.1), [bx, bz] = tamThan(yb);
    const t = tan[i % tan.length], dx = t.x - bx, dz = t.z - bz;
    const dai = Math.hypot(dx, t.y - yb, dz) * 0.8;
    if (dai < 0.3) continue;
    const nh = new THREE.Mesh(hinhThan(dai, rNgon * 0.9, rNgon * 0.45, 0, 5, 1), vlThan || vlMau(mauThan));
    const huong = new THREE.Vector3(dx, t.y - yb, dz).normalize();
    nh.quaternion.setFromUnitVectors(new THREE.Vector3(0, 1, 0), huong);
    nh.position.set(bx, yb, bz); // khuôn thân có gốc ở y = 0: đặt ở điểm mọc nhánh
    cha.add(nh);
  }
  let b = Math.floor(hat * 997);
  for (const t of tan) cha.add(cucTan(t.r, t.mau, t.x, t.y, t.z, { bien: b++, sy: t.sy ?? 0.86, ry: b * 1.3 }));
  if (them && tan.length >= 2) {
    // cục nhỏ lấp khe giữa tán và một cục trên đỉnh (nằm trong vùng tán cũ)
    const m0 = tan[0].mau;
    cha.add(cucTan(rTB * 0.78, m0, cx, cy + rTB * 0.35, cz, { bien: b++, sy: 0.85, chiTiet: 0 }));
    cha.add(cucTan(rTB * 0.62, tan[tan.length - 1].mau, cx, cy - rTB * 0.3, cz, { bien: b++, sy: 0.8, chiTiet: 0 }));
  }
}
const vlMauCache = new Map();
// vật liệu Lambert thường theo màu (như vl() của nhân vật) — để gopKhoi nướng màu
export function vlMau(mau) {
  if (!vlMauCache.has(mau)) vlMauCache.set(mau, new THREE.MeshLambertMaterial({ color: mau, flatShading: true }));
  return vlMauCache.get(mau);
}

// bụi cây tròn: vài cục tán thấp sát đất trong ô w x d (tâm x, z), cao tối đa h
export function dungBui(cha, x, z, w, d, h, mau, hat = 0) {
  const n = Math.max(2, Math.min(5, Math.round((w * d) / 0.35)));
  for (let i = 0; i < n; i++) {
    const a = hash3(i, hat, 1, 3), b = hash3(i, hat, 2, 5), s = 0.75 + 0.25 * hash3(i, hat, 3, 7);
    const r = Math.min(w, d) * 0.5 * s / 0.85, rr = Math.min(r, h / (0.85 * 2 * 0.9));
    const px = x + (a - 0.5) * Math.max(0, w - rr * 1.7), pz = z + (b - 0.5) * Math.max(0, d - rr * 1.7);
    cha.add(cucTan(rr, mau, px, rr * 0.85 * 0.9, pz, { bien: Math.floor(hat * 31) + i, sy: 0.9, ry: a * 6 }));
  }
}

// ---------- Chậu cây ----------
// chậu tròn miệng loe có viền bo (trong hộp bao trụ cũ: rTren, rDuoi, cao), tâm đáy (x, y, z)
const cacheChau = new Map();
export function hinhChau(rTren, rDuoi, cao, seg = 8) {
  const key = [lam(rTren), lam(rDuoi), lam(cao), seg].join("|");
  let g = cacheChau.get(key);
  if (g) return g;
  const v = 0.12 * cao, p = [
    new THREE.Vector2(rDuoi * 0.9, 0), new THREE.Vector2(rDuoi, cao * 0.08),
    new THREE.Vector2(rTren * 0.9, cao - v), new THREE.Vector2(rTren, cao - v * 0.45),
    new THREE.Vector2(rTren * 0.9, cao), new THREE.Vector2(0.001, cao - v * 0.6),
  ];
  g = new THREE.LatheGeometry(p, seg).toNonIndexed(); g.computeVertexNormals();
  cacheChau.set(key, g);
  return g;
}
// chậu + đất + bụi lá tròn: chiếm đúng chỗ của chậu trụ (rTren, rDuoi, cao) và cục lá Icosahedron(rLa) cũ ở độ cao yLa
export function dungChauCay(cha, x, y, z, { rTren, rDuoi, cao, mauChau, rLa, yLa, mauLa, hat = 0, vlChau = null }) {
  const c = new THREE.Mesh(hinhChau(rTren, rDuoi, cao), vlChau || vlMau(mauChau)); c.position.set(x, y, z); cha.add(c);
  const b = Math.floor(hat * 50);
  cha.add(cucTan(rLa * 0.8, mauLa, x, y + yLa - rLa * 0.08, z, { bien: b, sy: 0.92 }));
  for (let i = 0; i < 3; i++) {
    const a = i * 2.1 + hat * 6;
    cha.add(cucTan(rLa * 0.5, mauLa, x + Math.cos(a) * rLa * 0.42, y + yLa + rLa * (0.05 + 0.12 * (i % 2)), z + Math.sin(a) * rLa * 0.42, { bien: b + i + 1, sy: 0.9, chiTiet: 0 }));
  }
}

// ghế đẩu nhựa kiểu quán vỉa hè: mặt vuông bo góc, viền váy dưới mặt, bốn chân hơi choãi (gọn trong hộp ghế cũ 0,32 x 0,44 x 0,32)
export function gheDauNhua(cha, vlm, x, z, cao = 0.44) {
  const m = new THREE.Mesh(hinhVat(0.32, 0.045, 0.32, 0.03), vlm); m.position.set(x, cao - 0.0225, z); cha.add(m);
  const v = new THREE.Mesh(new THREE.BoxGeometry(0.29, 0.06, 0.29), vlm); v.position.set(x, cao - 0.075, z); cha.add(v);
  for (const [a, b] of [[-1, -1], [1, -1], [-1, 1], [1, 1]]) {
    const l = new THREE.Mesh(new THREE.BoxGeometry(0.045, cao - 0.06, 0.045), vlm);
    l.position.set(x + a * 0.122, (cao - 0.06) / 2, z + b * 0.122); l.rotation.set(-b * 0.07, 0, a * 0.07); cha.add(l);
  }
}
// ---------- Cỏ: búi cỏ thả theo InstancedMesh (một lượt vẽ cho cả loạt) ----------
let HINH_CO = null;
function hinhCo() {
  if (HINH_CO) return HINH_CO;
  const pos = [], col = [], nor = [];
  const goc = new THREE.Color(0x4f7a38), ngon = new THREE.Color(0xa9c76a);
  const la = 7;
  for (let i = 0; i < la; i++) {
    const a = i / la * Math.PI * 2 + hash3(i, 1, 1, 1) * 0.6, r = 0.03 + hash3(i, 2, 2, 2) * 0.05;
    const cao = 0.16 + hash3(i, 3, 3, 3) * 0.16, ng = 0.05 + hash3(i, 4, 4, 4) * 0.08, w = 0.022;
    const bx = Math.cos(a) * r, bz = Math.sin(a) * r, tx = Math.cos(a) * (r + ng), tz = Math.sin(a) * (r + ng);
    const px = -Math.sin(a) * w, pz = Math.cos(a) * w;
    pos.push(bx - px, 0, bz - pz, bx + px, 0, bz + pz, tx, cao, tz);
    col.push(goc.r, goc.g, goc.b, goc.r, goc.g, goc.b, ngon.r, ngon.g, ngon.b);
    for (let k = 0; k < 3; k++) nor.push(0, 1, 0); // pháp tuyến hướng trời: cỏ sáng đều như tô màu
  }
  const g = new THREE.BufferGeometry();
  g.setAttribute("position", new THREE.Float32BufferAttribute(pos, 3)); g.setAttribute("normal", new THREE.Float32BufferAttribute(nor, 3));
  g.setAttribute("color", new THREE.Float32BufferAttribute(col, 3));
  HINH_CO = g; return g;
}
const VL_CO = new THREE.MeshLambertMaterial({ vertexColors: true, side: THREE.DoubleSide });
VL_CO.userData.be = "co";
// bộ gom búi cỏ: them(x, y, z, cỡ); dung(cha) tạo InstancedMesh chia theo ô lưới (để ô sau camera bị loại)
export class BoCo {
  constructor(o = 160) { this.ds = []; this.o = o; }
  them(x, y, z, s = 1, mau = null) { this.ds.push([x, y, z, s, mau]); }
  // rải n búi quanh (x, z) trong bán kính r (vành khuyên r0..r)
  vong(x, z, r0, r, n, y = 0, s = 1, hat = 0) {
    for (let i = 0; i < n; i++) {
      const a = (i / n + hash3(x, z, i, hat) * 0.3) * Math.PI * 2, d = r0 + (r - r0) * hash3(z, x, i, hat + 1);
      this.them(x + Math.cos(a) * d, y, z + Math.sin(a) * d, s * (0.7 + 0.5 * hash3(i, x, z, hat + 2)));
    }
  }
  // rải dọc đoạn thẳng (a -> b), lệch ngang tối đa lech
  doan(ax, az, bx, bz, buoc, lech = 0.1, y = 0, s = 1, hat = 0) {
    const L = Math.hypot(bx - ax, bz - az), n = Math.max(1, Math.floor(L / buoc));
    const nx = -(bz - az) / (L || 1), nz = (bx - ax) / (L || 1);
    for (let i = 0; i <= n; i++) {
      const t = (i + hash3(ax, bz, i, hat) * 0.8) / (n + 0.8), l = (hash3(bx, az, i, hat + 3) - 0.5) * 2 * lech;
      this.them(ax + (bx - ax) * t + nx * l, y, az + (bz - az) * t + nz * l, s * (0.7 + 0.6 * hash3(i, ax, bx, hat + 5)));
    }
  }
  dung(cha) {
    if (!this.ds.length || !memBat("co")) return [];
    const o = this.o, nhom = new Map();
    for (const d of this.ds) { const k = Math.floor(d[0] / o) + "," + Math.floor(d[2] / o); if (!nhom.has(k)) nhom.set(k, []); nhom.get(k).push(d); }
    const ra = [], m4 = new THREE.Matrix4(), q = new THREE.Quaternion(), v = new THREE.Vector3(), s = new THREE.Vector3(), e = new THREE.Euler(), c = new THREE.Color();
    for (const ds of nhom.values()) {
      const im = new THREE.InstancedMesh(hinhCo(), VL_CO, ds.length);
      ds.forEach(([x, y, z, k, mau], i) => {
        e.set((hash3(x, z, 1, 9) - 0.5) * 0.25, hash3(x, z, 2, 9) * 6.28, (hash3(x, z, 3, 9) - 0.5) * 0.25);
        m4.compose(v.set(x, y, z), q.setFromEuler(e), s.set(k, k * (0.8 + 0.4 * hash3(z, x, 4, 9)), k));
        im.setMatrixAt(i, m4);
        if (mau != null) c.set(mau); else c.setRGB(0.85 + hash3(x, z, 5, 9) * 0.3, 0.88 + hash3(x, z, 6, 9) * 0.22, 0.75 + hash3(x, z, 7, 9) * 0.3);
        im.setColorAt(i, c);
      });
      im.computeBoundingSphere(); im.userData.rieng = true; im.receiveShadow = true;
      cha.add(im); ra.push(im);
    }
    this.ds = [];
    return ra;
  }
}

// ---------- Bánh xe: lốp bo tròn, mâm, ốp moay-ơ ----------
// trục bánh theo x (như CylinderGeometry xoay rotation.z = PI/2 cũ); bán kính r, bề rộng rong
const cacheBanh = new Map();
export function hinhLop(r, rong, seg = 9) {
  const key = lam(r) + "|" + lam(rong) + "|" + seg;
  let g = cacheBanh.get(key);
  if (g) return g;
  const t = Math.min(rong * 0.5, r * 0.22), rIn = r * 0.62, pts = [];
  // mặt cắt lốp: từ mép mâm phía -x vòng ra ngoài bo tròn tới mép mâm phía +x
  pts.push(new THREE.Vector2(rIn, -rong / 2 + t * 0.2));
  { const a = Math.PI * 0.75; pts.push(new THREE.Vector2(r - t + Math.sin(a) * t, -rong / 2 + t + Math.cos(a) * t)); }
  { const a = Math.PI * 0.25; pts.push(new THREE.Vector2(r - t + Math.sin(a) * t, rong / 2 - t + Math.cos(a) * t)); }
  pts.push(new THREE.Vector2(rIn, rong / 2 - t * 0.2));
  // Lathe quay quanh y: đổi (bán kính, y) -> trục bánh theo y rồi xoay về x
  g = new THREE.LatheGeometry(pts.map(p => new THREE.Vector2(p.x, p.y)), seg);
  g.rotateZ(Math.PI / 2);
  g = g.toNonIndexed(); g.computeVertexNormals();
  cacheBanh.set(key, g);
  return g;
}
export function hinhMam(r, rong, seg = 10) {
  const key = "m" + lam(r) + "|" + lam(rong) + "|" + seg;
  let g = cacheBanh.get(key);
  if (g) return g;
  g = new THREE.CylinderGeometry(r, r, rong, seg, 1); g.rotateZ(Math.PI / 2);
  cacheBanh.set(key, g);
  return g;
}

// ---------- Ống cong (cần đèn, tay lái, khung) ----------
export function hinhOng(diem, r, seg = 6, doan = 10) {
  const c = new THREE.CatmullRomCurve3(diem.map(p => new THREE.Vector3(...p)));
  const g = new THREE.TubeGeometry(c, doan, r, seg, false);
  return g;
}

// ---------- Trụ tròn mềm (thân xe, đèn tròn) ----------
export function hinhTru(r0, r1, h, seg = 10, mo = false) { return new THREE.CylinderGeometry(r1, r0, h, seg, 1, mo); }

// gộp các hình (đã đặt vị trí) giữ màu đỉnh
export function gopHinh(ds) { return mergeGeometries(ds.map(g => (g.index ? g.toNonIndexed() : g))); }
export { VL_MAU_DINH, VL_MAU_DINH_2MAT };
