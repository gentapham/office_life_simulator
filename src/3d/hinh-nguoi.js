// Nhân vật kiểu mới (chất lượng Vừa / Cao): tỉ lệ người thật, khối tròn mượt ít đa giác (đầu tròn có cằm, cổ, thân thon
// có vai/ngực/eo, cánh tay trên + cẳng tay nối khuỷu, đùi + cẳng chân nối gối, bàn tay, giày), quần áo là các lớp đơn giản
// màu phẳng (áo sơ mi, vest, váy, quần short...), mặt vẽ như cũ. Mức "Thấp" vẫn dùng người khối hộp (nhan-vat-3d.js).
// Cùng khung xương / kích thước / điểm gắn với người cũ: chân ở y = 0, hông 0,9, vai 1,43, tâm đầu 1,73, tay dài 0,645.
// Mọi khối dùng vl(màu, { flatShading: false }): toi-uu.js nướng màu vào đỉnh và gộp thành một khối xương mượt (1 lượt vẽ),
// mặt (ảnh vẽ) thêm 1 lượt; áo có họa tiết thêm 1 lượt mỗi loại vải.
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";
import { gopMuot } from "./toi-uu.js";

const PI = Math.PI;
const vm = c => vl(c, { flatShading: false });
const vm2 = c => vl(c, { flatShading: false, side: THREE.DoubleSide });
const toiMau = (n, k = 0.8) => { const c = new THREE.Color(n); c.multiplyScalar(k); return c.getHex(); };
// vật liệu có ảnh (vải họa tiết) bản mượt
const muotCache = new WeakMap();
export function muotVL(m) {
  if (!m || m.flatShading === false) return m;
  if (!muotCache.has(m)) { const c = m.clone(); c.flatShading = false; muotCache.set(m, c); }
  return muotCache.get(m);
}
const vlAo = (vai, mau) => vai ? muotVL(vai) : vm(mau);

// ---------- Hình học ----------
const cacheHinh = new Map();
const nho = (k, f) => { let g = cacheHinh.get(k); if (!g) cacheHinh.set(k, g = f()); return g; };

// pháp tuyến mượt kể cả ở đường nối (đỉnh trùng vị trí lấy pháp tuyến trung bình)
export function muotHoa(geo) {
  geo.computeVertexNormals();
  const p = geo.attributes.position, n = geo.attributes.normal, nhom = new Map();
  for (let i = 0; i < p.count; i++) {
    const k = Math.round(p.getX(i) * 2e4) + "," + Math.round(p.getY(i) * 2e4) + "," + Math.round(p.getZ(i) * 2e4);
    const e = nhom.get(k); if (e) e.push(i); else nhom.set(k, [i]);
  }
  const v = new THREE.Vector3();
  for (const e of nhom.values()) {
    if (e.length < 2) continue;
    v.set(0, 0, 0); for (const i of e) v.x += n.getX(i), v.y += n.getY(i), v.z += n.getZ(i);
    v.normalize(); for (const i of e) n.setXYZ(i, v.x, v.y, v.z);
  }
  return geo;
}
// lưới R hàng x (C+1) cột (cột cuối trùng cột đầu); f(i, j) -> [x, y, z, u, v]. Hàng từ trên xuống, cột theo chiều +x ở mặt trước.
function luoi(R, C, f, lat = false) {
  const pos = [], uv = [], idx = [];
  for (let i = 0; i < R; i++) for (let j = 0; j <= C; j++) { const [x, y, z, u, w] = f(i, j); pos.push(x, y, z); uv.push(u ?? 0, w ?? 0); }
  const W = C + 1;
  for (let i = 0; i < R - 1; i++) for (let j = 0; j < C; j++) {
    const a = i * W + j, b = a + 1, c = a + W, d = c + 1;
    if (lat) idx.push(a, b, c, b, d, c); else idx.push(a, c, b, b, c, d);
  }
  const g = new THREE.BufferGeometry();
  g.setAttribute("position", new THREE.Float32BufferAttribute(pos, 3));
  g.setAttribute("uv", new THREE.Float32BufferAttribute(uv, 2));
  g.setIndex(idx);
  return muotHoa(g);
}
// ống tiết diện elip qua các hàng [y, rx, rz, z = 0, x = 0] (trên xuống). u quanh thân (mặt trước u = 0,5), v theo chiều cao.
export function loft(rows, seg = 12) {
  const y0 = rows[rows.length - 1][0], y1 = rows[0][0], H = (y1 - y0) || 1;
  return luoi(rows.length, seg, (i, j) => {
    const [y, rx, rz, z = 0, x = 0] = rows[i], a = -PI + 2 * PI * j / seg;
    return [x + Math.sin(a) * rx, y, z + Math.cos(a) * rz, a / PI + 0.5, (y - y0) / H];
  });
}
// ống thon hai đầu tròn dọc trục -y: từ y = 0 (bán kính r1) xuống y = -L (r2); kz: dẹt theo z
export function ong(r1, r2, L, seg = 8, nap = 2, kz = 1, giua = null) {
  return nho(`ong${r1},${r2},${L},${seg},${nap},${kz},${giua}`, () => {
    const rows = [], [nT, nD] = Array.isArray(nap) ? nap : [nap, nap];
    for (let k = nT; k >= 1; k--) { const t = k / nT * PI / 2; rows.push([r1 * Math.sin(t), r1 * Math.cos(t), r1 * Math.cos(t) * kz]); }
    rows.push([0, r1, r1 * kz]);
    if (giua) rows.push([-L * 0.45, giua, giua * kz]);
    rows.push([-L, r2, r2 * kz]);
    for (let k = 1; k <= nD; k++) { const t = k / nD * PI / 2; rows.push([-L - r2 * Math.sin(t), r2 * Math.cos(t), r2 * Math.cos(t) * kz]); }
    return loft(rows, seg);
  });
}
const cauGeo = seg => nho("cau" + seg, () => new THREE.SphereGeometry(1, seg, Math.max(4, Math.round(seg * 0.7))));
// khối elip
function cau(mat, rx, ry, rz, x = 0, y = 0, z = 0, seg = 8) {
  const m = new THREE.Mesh(cauGeo(seg), mat); m.scale.set(rx, ry, rz); m.position.set(x, y, z); return m;
}
const mesh = (geo, mat, x = 0, y = 0, z = 0) => { const m = new THREE.Mesh(geo, mat); m.position.set(x, y, z); return m; };
// vòng xuyến (viền cổ, thắt lưng nhỏ, vành kính)
function vong(mat, R, r, x, y, z, rx = PI / 2, seg = 12, tube = 4, arc = 2 * PI) {
  const m = new THREE.Mesh(nho(`vong${R},${r},${seg},${tube},${arc}`, () => new THREE.TorusGeometry(R, r, tube, seg, arc)), mat);
  m.position.set(x, y, z); m.rotation.x = rx; return m;
}

// ---------- Đầu ----------
// elip rộng 0,284, cao 0,33, sâu 0,3 (vừa khung đầu cũ 0,3 x 0,34 x 0,3), cằm thon
export const DAU = { x: 0.142, y: 0.165, z: 0.15 };
function hinhDau(x, y, z) { // điểm trên mặt cầu đơn vị -> điểm trên đầu
  let X = x * DAU.x, Z = z * DAU.z;
  if (y < 0) { const k = Math.pow(-y, 1.6); X *= 1 - 0.24 * k; Z *= 1 - 0.1 * k; }
  if (y > 0.2 && z < 0) Z *= 1 + 0.06 * y; // sau gáy tròn đầy
  return [X, y * DAU.y, Z];
}
function geoDau(tho) {
  return nho("dau" + tho, () => {
    const g = new THREE.SphereGeometry(1, tho ? 10 : 14, tho ? 7 : 11);
    const p = g.attributes.position, uv = g.attributes.uv;
    for (let i = 0; i < p.count; i++) {
      const [X, Y, Z] = hinhDau(p.getX(i), p.getY(i), p.getZ(i));
      p.setXYZ(i, X, Y, Z);
      // ảnh mặt chiếu thẳng từ phía trước (khung 0,3 x 0,34 như mặt hộp cũ); phía sau lấy mép ảnh (màu da)
      let u = 0.5 + X / 0.3; const v = Math.min(0.99, Math.max(0.01, 0.5 + Y / 0.34));
      if (Z < 0) u = X > 0 ? 0.985 : 0.015;
      uv.setXY(i, Math.min(0.985, Math.max(0.015, u)), v);
    }
    g.deleteAttribute("normal");
    muotHoa(g);
    // tam giác phía sau đầu lấy một điểm màu da cố định: không có tam giác nào nội suy u từ mép phải sang mép trái
    // ảnh mặt (trước đây hiện thành một vệt mắt / miệng mảnh ở gáy). Tam giác phía trước giữ ảnh chiếu thẳng.
    const r = g.toNonIndexed(), ruv = r.attributes.uv, rp = r.attributes.position;
    for (let i = 0; i < rp.count; i += 3) {
      if (Math.min(rp.getZ(i), rp.getZ(i + 1), rp.getZ(i + 2)) >= -1e-4) continue;
      for (let k = 0; k < 3; k++) ruv.setXY(i + k, 0.015, 0.5);
    }
    return r;
  });
}
// z mặt trước của đầu tại (x, y) (toạ độ đầu): để đặt kính, khẩu trang ôm sát mặt
export function matTruocDau(x, y) {
  const Y = Math.max(-0.999, Math.min(0.999, y / DAU.y));
  const k = Y < 0 ? Math.pow(-Y, 1.6) : 0;
  const xs = x / (DAU.x * (1 - 0.24 * k));
  return Math.sqrt(Math.max(0, 1 - xs * xs - Y * Y)) * DAU.z * (1 - 0.1 * k);
}
// thanh tròn nối hai điểm (gọng kính, quai túi...)
const _tv = new THREE.Vector3(), _tl = new THREE.Vector3(0, -1, 0);
function thanhNoi(mat, a, b, r = 0.004, seg = 5) {
  _tv.set(b[0] - a[0], b[1] - a[1], b[2] - a[2]);
  const L = _tv.length(), m = new THREE.Mesh(ong(r, r, L, seg, 1), mat);
  m.position.set(...a); m.quaternion.setFromUnitVectors(_tl, _tv.normalize());
  return m;
}
// điểm trên mặt đầu theo góc quanh trục đứng b (0 = trước, +PI/2 = bên phải +x) và góc từ đỉnh t, đẩy ra ngoài off
export function diemDau(t, b, off) {
  const sx = Math.sin(t) * Math.sin(b), sy = Math.cos(t), sz = Math.sin(t) * Math.cos(b);
  const [X, Y, Z] = hinhDau(sx, sy, sz);
  const nx = X / (DAU.x * DAU.x), ny = Y / (DAU.y * DAU.y), nz = Z / (DAU.z * DAU.z), l = Math.hypot(nx, ny, nz) || 1;
  return [X + nx / l * off, Y + ny / l * off, Z + nz / l * off];
}
// miếng ôm trên mặt đầu (khẩu trang, mặt nạ, băng đô...): b từ b0..b1, chiều cao y0..y1 (toạ độ đầu)
export function vaDau(b0, b1, y0, y1, off, R = 5, C = 10) {
  return nho(`va${b0},${b1},${y0},${y1},${off},${R},${C}`, () => luoi(R, C - 1, (i, j) => {
    const y = y1 + (y0 - y1) * i / (R - 1), b = b0 + (b1 - b0) * j / (C - 1);
    const t = Math.acos(Math.max(-1, Math.min(1, y / DAU.y)));
    const [x, yy, z] = diemDau(t, b, off);
    return [x, yy, z, j / (C - 1), 1 - i / (R - 1)];
  }));
}

// ---------- Mũ siêu nhân ----------
const MU_SN = [1.12, 1.07, 1.1]; // vỏ mũ = đầu phóng to
// miếng ôm trên vỏ mũ: f(i, j, R, C) -> [b (góc quanh trục đứng, 0 = trước), y (toạ độ đầu chưa phóng), độ nổi]
function vaMu(R, C, f) {
  return luoi(R, C - 1, (i, j) => {
    const [b, y, off] = f(i, j, R, C);
    const t = Math.acos(Math.max(-1, Math.min(1, y / DAU.y)));
    const [X, Y, Z] = hinhDau(Math.sin(t) * Math.sin(b), Math.cos(t), Math.sin(t) * Math.cos(b));
    const p = [X * MU_SN[0], Y * MU_SN[1], Z * MU_SN[2]];
    const n = [p[0] / (DAU.x * DAU.x * MU_SN[0] ** 2), p[1] / (DAU.y * DAU.y * MU_SN[1] ** 2), p[2] / (DAU.z * DAU.z * MU_SN[2] ** 2)], l = Math.hypot(...n) || 1;
    return [p[0] + n[0] / l * off, p[1] + n[1] / l * off, p[2] + n[2] / l * off, j / (C - 1), 1 - i / (R - 1)];
  });
}
// kính đen hình trái tim (mũ Pink Ranger): rộng ngang hai mắt, mép trên nhô thành hai thuỳ hai bên (giữa là mỏ hồng
// từ trán cắm xuống), mép dưới cong xuống ở giữa, hai đầu bo tròn ôm tới má; mép chìm vào vỏ mũ nên không lộ cạnh
const KINH_SN = { B: 1.2, tren: e => 0.064 + 0.02 * Math.exp(-(((e - 0.42) / 0.28) ** 2)) - 0.03 * e ** 3, duoi: e => -0.058 + 0.016 * e * e };
function kinhSieuNhan(C, R) {
  return vaMu(R, C, (i, j) => {
    const u = j / (C - 1), b = (2 * u - 1) * KINH_SN.B, e = Math.abs(2 * u - 1), v = i / (R - 1);
    const tren = KINH_SN.tren(e), duoi = KINH_SN.duoi(e);
    const giua = (tren + duoi) / 2, nua = (tren - duoi) / 2 * Math.sqrt(Math.max(0, 1 - e ** 4));
    const noi = Math.min(1, 6 * v * (1 - v)) * Math.min(1, 9 * u * (1 - u));
    return [b, giua + nua * (1 - 2 * v), -0.003 + 0.013 * noi];
  });
}
// điểm trên đường giữa vỏ mũ (góc a từ đỉnh về phía trước), lệch ngang ux, đẩy ra ngoài off
function diemMoMu(a, ux, off) {
  const l = Math.hypot(ux, 1);
  const [X, Y, Z] = hinhDau(ux / l, Math.cos(a) / l, Math.sin(a) / l);
  const p = [X * MU_SN[0], Y * MU_SN[1], Z * MU_SN[2]];
  const n = [p[0] / (DAU.x * DAU.x * MU_SN[0] ** 2), p[1] / (DAU.y * DAU.y * MU_SN[1] ** 2), p[2] / (DAU.z * DAU.z * MU_SN[2] ** 2)], ln = Math.hypot(...n) || 1;
  return [p[0] + n[0] / ln * off, p[1] + n[1] / ln * off, p[2] + n[2] / ln * off];
}
// gờ nổi giữa đỉnh mũ (đầu thằn lằn bay): chạy từ gáy qua đỉnh, xuống trán rồi thành mỏ nhọn cắm vào giữa kính đen
const MO_SN = { a0: -2.0, a1: 1.68, rong: a => a < 0.55 ? 0.1 : a < 1.0 ? 0.1 + 0.16 * (a - 0.55) / 0.45 : 0.26 * Math.max(0, (1.68 - a) / 0.68) ** 0.7,
  noi: a => a < 0.9 ? 0.008 : 0.008 + 0.016 * Math.min(1, (a - 0.9) / 0.25) };
function moSieuNhan(R) {
  return luoi(R, 4, (i, j) => {
    const a = MO_SN.a1 - (MO_SN.a1 - MO_SN.a0) * i / (R - 1), w = (j - 2) / 2;
    const bien = Math.abs(w) > 0.99, off = (bien ? 0.15 : Math.abs(w) > 0.4 ? 0.85 : 1) * MO_SN.noi(a) * (i === R - 1 ? 0.3 : 1);
    return [...diemMoMu(a, w * MO_SN.rong(a), off), j / 4, i / (R - 1)];
  }, true);
}

// ---------- Tóc ----------
// Vỏ tóc ôm đầu: mỗi cột (góc b quanh đầu) là một đường từ đỉnh xuống chân tóc (tran: trán, ben: thái dương, sau: gáy,
// đơn vị PI), dày "day", tóc dài buông thẳng xuống "dai(b)" mét rồi cuộn vào trong (có độ dày, không lộ mặt trong).
const muot = x => x * x * (3 - 2 * x);
const gocLech = (a, b) => Math.atan2(Math.sin(a - b), Math.cos(a - b));
const u = (b, b0, w) => Math.exp(-((gocLech(b, b0) / w) ** 2));
export function voToc({ tran = 0.3, ben = 0.47, sau = 0.64, bat = 0, day = 0.025, V = null, dai = null, song = 0, C = 24, R = 13 }) {
  const cot = [];
  for (let j = 0; j <= C; j++) {
    const b = -PI + 2 * PI * j / C, c = Math.cos(b);
    const wf = Math.max(0, c) ** 2, wb = Math.max(0, -c) ** 2, ws = 1 - wf - wb;
    const tm = (typeof tran === "function" ? tran(b) : tran) * wf + (typeof ben === "function" ? ben(b) : ben) * ws + (typeof sau === "function" ? sau(b) : sau) * wb;
    const t0 = (typeof bat === "function" ? bat(b) : bat) * PI, t1 = tm * PI;
    const pts = [];
    const off = t => day * (V ? V(b, t / PI) : 1);
    if (t0 > 0.01) pts.push(diemDau(t0, b, 0.002));
    for (let k = 0; k <= 12; k++) { const t = t0 + (t1 - t0) * k / 12; pts.push(diemDau(t, b, off(t))); }
    const D = dai ? dai(b) : 0;
    const E = pts[pts.length - 1];
    if (D > 0.005) {
      for (let k = 1; k <= 6; k++) {
        const d = D * k / 6, xoe = 1 + 0.3 * d, lui = -0.14 * d * wb;
        const s = song ? Math.sin(d * 24) * 0.008 * song : 0, l = Math.hypot(E[0], E[2]) || 1;
        pts.push([E[0] * xoe + E[0] / l * s, E[1] - d, E[2] * xoe + lui + E[2] / l * s]);
      }
      const L = pts[pts.length - 1], l = Math.hypot(L[0], L[2]) || 1, vao = off(t1) + 0.012;
      pts.push([L[0] - L[0] / l * vao * 0.5, L[1] - 0.008, L[2] - L[2] / l * vao * 0.5]);
      pts.push([L[0] - L[0] / l * vao, L[1] + 0.012, L[2] - L[2] / l * vao]);
    } else pts.push(diemDau(t1 + 0.02, b, 0.001));
    // lấy mẫu lại đều theo chiều dài
    const dd = [0]; for (let k = 1; k < pts.length; k++) dd.push(dd[k - 1] + Math.hypot(pts[k][0] - pts[k - 1][0], pts[k][1] - pts[k - 1][1], pts[k][2] - pts[k - 1][2]));
    const tong = dd[dd.length - 1] || 1, ra = [];
    for (let i = 0, k = 0; i < R; i++) {
      const s = tong * i / (R - 1);
      while (k < dd.length - 2 && dd[k + 1] < s) k++;
      const f = Math.min(1, Math.max(0, (s - dd[k]) / ((dd[k + 1] - dd[k]) || 1)));
      ra.push([0, 1, 2].map(m => pts[k][m] + (pts[k + 1][m] - pts[k][m]) * f));
    }
    cot.push(ra);
  }
  return luoi(R, C, (i, j) => { const [x, y, z] = cot[j][i]; return [x, y, z, j / C, 1 - i / (R - 1)]; });
}
// một sợi / lọn tóc nằm sát da đầu: chạy ngang qua đỉnh đầu ở độ sâu z0, từ góc a0 tới a1 (0 = đỉnh, âm = bên trái)
function soiToc(z0, a0, a1, off, w, R = 10) {
  return luoi(R, 2, (i, j) => {
    const a = a0 + (a1 - a0) * i / (R - 1), dz = (z0 + (j - 1) * w) / DAU.z, sx = Math.sin(a), sy = Math.cos(a), l = Math.hypot(sx, sy, dz);
    const [X, Y, Z] = hinhDau(sx / l, sy / l, dz / l);
    const nx = X / (DAU.x * DAU.x), ny = Y / (DAU.y * DAU.y), nz = Z / (DAU.z * DAU.z), n = Math.hypot(nx, ny, nz) || 1;
    const o = off * (j === 1 ? 1.5 : 0.5) * (i === 0 || i === R - 1 ? 0.6 : 1);
    return [X + nx / n * o, Y + ny / n * o, Z + nz / n * o, j / 2, i / (R - 1)];
  }, true);
}
// các kiểu tóc (cùng tên với người cũ)
const KIEU_TOC = {
  ngoi: () => ({ tran: 0.29, ben: 0.46, sau: 0.64, day: 0.03, V: (b, t) => 1 + 0.9 * u(b, 0.5, 0.7) * Math.exp(-(((t - 0.2) / 0.14) ** 2)) - 0.5 * u(b, -0.45, 0.12) * (t < 0.3 ? 1 : 0) }),
  cua: () => ({ tran: 0.3, ben: 0.45, sau: 0.6, day: 0.014 }),
  vuot_hoi: () => ({ tran: 0.27, ben: 0.46, sau: 0.66, day: 0.024, V: (b, t) => 0.75 + 0.35 * (1 - Math.cos(b)) / 2 + 0.6 * u(b, 0, 0.8) * Math.exp(-(((t - 0.12) / 0.1) ** 2)) }),
  dai_uon: () => ({ tran: 0.3, ben: 0.52, sau: 0.56, day: 0.032, song: 1.4, dai: b => daiToc(b, 0.17, 0.5) }),
  bob: () => ({ tran: 0.345, ben: 0.55, sau: 0.58, day: 0.034, dai: b => daiToc(b, 0.13, 0.12, 0.42) }),
  bob_lech: () => ({ tran: b => (b < 0 ? 0.36 : 0.33), ben: 0.55, sau: 0.58, day: 0.034, dai: b => daiToc(b, b < 0 ? 0.2 : 0.09, 0.13, 0.42) }),
  undercut: () => ({ tran: 0.3, ben: 0.47, sau: 0.62, day: 0.007 }),
  bu: () => ({ tran: 0.3, ben: 0.47, sau: 0.64, day: 0.034, V: (b, t) => 1 + 0.55 * Math.abs(Math.sin(b * 4.5) * Math.sin(t * 22)) }),
  gon: () => ({ tran: 0.29, ben: 0.46, sau: 0.62, day: 0.02, V: (b, t) => 1 + 0.6 * u(b, 0, 0.7) * Math.exp(-(((t - 0.18) / 0.12) ** 2)) }),
  buoi_cao: () => ({ tran: 0.28, ben: 0.48, sau: 0.6, day: 0.016 }),
  lat: () => ({ tran: 0.3, ben: 0.46, sau: 0.62, day: 0.022, V: (b, t) => 1 + 1.6 * u(b, 0, 0.75) * Math.exp(-(((t - 0.2) / 0.12) ** 2)) }),
  duoi_ngua_dai: () => ({ tran: 0.29, ben: 0.5, sau: 0.6, day: 0.016 }),
  buoc: () => ({ tran: 0.29, ben: 0.48, sau: 0.6, day: 0.018 }),
  mullet: () => ({ tran: 0.3, ben: 0.46, sau: 0.62, day: 0.036, V: (b, t) => 1 + 0.5 * Math.abs(Math.sin(b * 3.5)) * (t < 0.3 ? 1 : 0), dai: b => daiToc(b, 0.03, 0.3, 0.55) }),
  xoan: () => ({ tran: 0.29, ben: 0.47, sau: 0.62, day: 0.045, V: (b, t) => 0.85 + 0.5 * Math.abs(Math.sin(b * 6) * Math.sin(t * 28)) }),
  thang_mai: () => ({ tran: 0.345, ben: 0.54, sau: 0.56, day: 0.03, dai: b => daiToc(b, 0.17, 0.52) }),
  to_qua: () => ({ bat: 0.33, tran: 0.37, ben: 0.5, sau: 0.62, day: 0.03, V: (b, t) => 1 + 0.6 * Math.abs(Math.sin(b * 5)) }),
  dai_song: () => ({ tran: 0.3, ben: 0.52, sau: 0.56, day: 0.032, song: 2.2, dai: b => daiToc(b, 0.18, 0.54) }),
  tem: () => ({ tran: b => 0.31 + 0.05 * u(b, -0.4, 0.5), ben: 0.46, sau: 0.62, day: 0.024, V: (b, t) => 1 + 0.6 * u(b, -0.3, 0.6) * Math.exp(-(((t - 0.25) / 0.12) ** 2)) }),
  thua_lech: () => ({ tran: 0.31, ben: 0.45, sau: 0.6, day: 0.007 }),
  re_giua: () => ({ tran: b => 0.3 + 0.06 * (u(b, 0.45, 0.3) + u(b, -0.45, 0.3)), ben: 0.48, sau: 0.62, day: 0.026, V: (b, t) => 1 - 0.7 * u(b, 0, 0.1) * (t < 0.32 ? 1 : 0) + 0.8 * (u(b, 0.5, 0.35) + u(b, -0.5, 0.35)) * Math.exp(-(((t - 0.3) / 0.1) ** 2)) }),
};
// độ dài tóc buông theo góc: không che mặt, hai bên (ngắn để không đâm vai), sau lưng
function daiToc(b, ben, sau, truoc = 0.36) {
  const a = Math.abs(b) / PI; // 0 trước, 0,5 hai bên, 1 sau
  if (a < truoc) return 0;
  if (a < 0.55) return ben * muot((a - truoc) / (0.55 - truoc));
  return ben + (sau - ben) * muot((a - 0.55) / 0.45);
}
// coMu: đội mũ (mũ len, mũ bảo hiểm, mũ kê-pi): tóc ép sát dưới mũ, bỏ các lọn / búi / tóc dựng đâm xuyên mũ
function taoTocMoi(dau, kieu, mau, mau2, tho, coMu = false) {
  const T = vm(mau), them = m => { dau.add(m); return m; };
  const C = tho ? 12 : 18, R = tho ? 6 : 10;
  const f = KIEU_TOC[kieu] || (() => ({ tran: 0.3, ben: 0.47, sau: 0.62, day: 0.025 }));
  const ep = p => coMu ? { ...p, day: Math.min(p.day, 0.022), V: null, bat: 0 } : p;
  them(mesh(nho(`toc${kieu}${tho}${coMu}`, () => voToc({ ...ep(f()), C, R })), T));
  if (coMu && !["dai_uon", "bob", "bob_lech", "thang_mai", "dai_song", "duoi_ngua_dai", "buoc", "mullet", "xoan"].includes(kieu)) return;
  const s = tho ? 6 : 8;
  switch (kieu) {
    case "ngoi": break; // đường rẽ ngôi đã khắc trên vỏ tóc (V)
    case "dai_uon": if (mau2) { const M = vm(mau2); them(cau(M, 0.035, 0.02, 0.015, 0.1, 0.13, 0.09, s)); them(cau(M, 0.035, 0.02, 0.015, 0.06, 0.15, 0.105, s)); } break;
    case "bob_lech": them(cau(vm(0xf26fa6), 0.02, 0.01, 0.012, 0.11, 0.1, 0.12, s)); break;
    case "undercut": {
      them(mesh(nho("toc_uc_tren" + tho, () => voToc({ tran: 0.28, ben: 0.36, sau: 0.4, day: 0.036, V: (b, t) => 1 + 1.1 * u(b, 0, 0.7) * Math.exp(-(((t - 0.15) / 0.12) ** 2)), C, R })), T));
      dau.children[dau.children.length - 2].material = vm(0x5a5650); // hai bên cạo ngắn màu xám
      break;
    }
    case "bu": if (!coMu) for (let i = 0; i < 7; i++) { // lọn tóc dựng rối: nhỏ, cắm sâu vào vỏ tóc, ngả ra sau
      const x = -0.08 + (i % 4) * 0.053, z = -0.05 + Math.floor(i / 4) * 0.08, y = Math.sqrt(Math.max(0, 1 - (x / DAU.x) ** 2 - (z / DAU.z) ** 2)) * DAU.y + 0.012;
      const c = them(cau(T, 0.026, 0.05, 0.022, x, y, z, s)); c.rotation.set(-0.5 + (i % 3) * 0.25, i, x * 3 + (i % 2 ? 0.25 : -0.25));
    } break;
    case "buoi_cao": them(cau(T, 0.072, 0.065, 0.072, 0, 0.205, -0.075, s)); them(vong(vm(0x8a5a3c), 0.05, 0.012, 0, 0.168, -0.06, PI / 2 + 0.5, 12, 4)); break;
    case "lat": break;
    case "duoi_ngua_dai": case "buoc": {
      const dai = kieu === "buoc" ? 0.26 : 0.46, nhom = new THREE.Group(); nhom.position.set(0, 0.07, -0.16); nhom.rotation.x = 0.35; dau.add(nhom);
      nhom.add(cau(T, 0.04, 0.04, 0.04, 0, 0, -0.01, s));
      const duoi = mesh(ong(0.04, 0.012, dai, tho ? 6 : 8, 2, 0.85, 0.045), T, 0, -0.02, -0.02); nhom.add(duoi);
      nhom.add(vong(vm(0xc0262d), 0.034, 0.012, 0, -0.005, -0.01, PI / 2 + 0.3, 10, 4));
      break;
    }
    case "mullet": {
      const M2 = vm(mau2 || mau);
      if (!coMu) for (let i = 0; i < 5; i++) { // mái dựng: lọn nhỏ nằm nghiêng ra sau, không vểnh như tai
        const x = -0.08 + i * 0.04, y = Math.sqrt(Math.max(0, 1 - (x / DAU.x) ** 2 - 0.2)) * DAU.y + 0.01;
        const c = them(cau(i % 2 ? M2 : T, 0.026, 0.045, 0.03, x, y, 0.04, s)); c.rotation.z = (i - 2) * 0.3; c.rotation.x = -0.9;
      }
      for (const x of [-0.07, 0.08]) them(cau(M2, 0.022, 0.13, 0.02, x, -0.1, -0.19, s)).rotation.x = 0.2;
      break;
    }
    case "xoan": if (mau2) for (const x of [-1, 1]) them(cau(vm(mau2), 0.022, 0.05, 0.07, x * 0.15, 0.04, -0.02, s)); break;
    case "to_qua": for (let i = 0; i < 4; i++) { const c = them(cau(T, 0.022, 0.04, 0.025, (i < 2 ? -1 : 1) * 0.165, 0.06 - (i % 2) * 0.05, 0.04, s)); c.rotation.z = (i < 2 ? 1 : -1) * 0.8; } break;
    case "thua_lech": // tóc vuốt ngang che hói: vài sợi to nằm sát da đầu, từ mái bên trái vắt sang phải
      if (!coMu) for (let i = 0; i < 4; i++) them(mesh(nho(`soiToc${i}${tho}`, () => soiToc(-0.085 + i * 0.05, -1.25, 1.05, 0.012, 0.016)), T));
      break;
  }
}

// ---------- Thân ----------
// hàng [y, rx, rz, z] của thân áo (trên xuống), dáng nam / nữ; co giãn theo độ rộng vai (r) và bụng (béo)
const THAN = {
  nam: [[1.548, 0.052, 0.046, -0.006], [1.532, 0.1, 0.076, -0.01], [1.508, 0.15, 0.094, -0.01], [1.478, 0.183, 0.108, -0.006], [1.442, 0.2, 0.118, -0.002], [1.4, 0.205, 0.122, 0], [1.31, 0.196, 0.126, 0.006], [1.19, 0.182, 0.118, 0.003], [1.07, 0.172, 0.112, 0], [0.98, 0.176, 0.115, 0], [0.9, 0.18, 0.118, 0], [0.86, 0.182, 0.12, 0]],
  nu: [[1.548, 0.05, 0.044, -0.006], [1.532, 0.094, 0.072, -0.01], [1.508, 0.14, 0.088, -0.01], [1.478, 0.17, 0.1, -0.006], [1.442, 0.186, 0.11, -0.002], [1.4, 0.19, 0.118, 0], [1.31, 0.18, 0.136, 0.013], [1.22, 0.164, 0.12, 0.006], [1.09, 0.148, 0.104, 0], [0.99, 0.166, 0.112, 0], [0.9, 0.184, 0.12, 0], [0.86, 0.188, 0.122, 0]],
};
// Siêu Nhân Hồng (người đóng là một anh mập): vai tròn, ngực xệ, bụng to nhô ra trước, hông và mông đầy.
// Bề ngang giữ ~0,42 m để cánh tay (hơi dang) vẫn lọt cửa / hành lang (tổng ~0,62 m); bụng phình chủ yếu ra trước.
const THAN_SN = [[1.55, 0.066, 0.06, -0.006], [1.534, 0.116, 0.09, -0.008], [1.51, 0.152, 0.108, -0.006], [1.48, 0.178, 0.124, -0.002],
  [1.445, 0.194, 0.134, 0.002], [1.4, 0.2, 0.144, 0.008], [1.33, 0.206, 0.16, 0.02], [1.25, 0.214, 0.178, 0.042], [1.16, 0.218, 0.194, 0.064],
  [1.07, 0.223, 0.2, 0.074], [1.0, 0.223, 0.182, 0.056], [0.95, 0.222, 0.158, 0.03], [0.9, 0.228, 0.148, 0.012], [0.86, 0.23, 0.146, 0.01]];
function hangThan(nu, beo, r, sieu = false) {
  if (sieu) return THAN_SN;
  const k = (0.21 * r - 0.005) / (nu ? 0.19 : 0.205), kz = 0.6 + 0.4 * k;
  return THAN[nu ? "nu" : "nam"].map(([y, rx, rz, z]) => {
    if (y > 1.52) return [y, rx, rz, z];
    let RX = rx * k, RZ = rz * kz, Z = z;
    if (beo && y < 1.36) { const b = Math.exp(-(((y - 1.1) / 0.17) ** 2)); RZ += 0.05 * b; Z += 0.035 * b; RX += 0.01 * b; }
    return [y, RX, RZ, Z];
  });
}
// nội suy hàng thân ở độ cao y
export function taiY(rows, y) {
  if (y >= rows[0][0]) return rows[0];
  for (let i = 0; i < rows.length - 1; i++) {
    const a = rows[i], b = rows[i + 1];
    if (y <= a[0] && y >= b[0]) { const f = (a[0] - y) / (a[0] - b[0]); return [y, a[1] + (b[1] - a[1]) * f, a[2] + (b[2] - a[2]) * f, a[3] + (b[3] - a[3]) * f]; }
  }
  return rows[rows.length - 1];
}
// z mặt trước (sau = -1: mặt sau) của thân tại (x, y)
const matThan = (rows, x, y, sau = 1) => { const [, rx, rz, z] = taiY(rows, y); return z + sau * rz * Math.sqrt(Math.max(0, 1 - (x / rx) ** 2)); };
// miếng dán ôm thân (ve áo, cà vạt, túi, yếm...): từ yTren xuống yDuoi, bề ngang theo hàm x(y) -> [trái, phải]
function dan(rows, yTren, yDuoi, xr, off = 0.004, sau = false, R = 5, C = 3) {
  return luoi(R, C, (i, j) => {
    const y = yTren + (yDuoi - yTren) * i / (R - 1), [a, b] = xr(y, i / (R - 1)), x = a + (b - a) * j / C;
    return [x, y, matThan(rows, x, y, sau ? -1 : 1) + (sau ? -off : off), j / C, 1 - i / (R - 1)];
  }, sau);
}
// vòng ôm thân (thắt lưng, gấu áo, đai váy)
function vongThan(rows, y, h, them, seg = 16) {
  const [, rx, rz, z] = taiY(rows, y);
  return loft([[y + h / 2, rx + them * 0.6, rz + them * 0.6, z], [y + h / 2 - 0.004, rx + them, rz + them, z], [y - h / 2 + 0.004, rx + them, rz + them, z], [y - h / 2, rx + them * 0.6, rz + them * 0.6, z]], seg);
}
// miếng ôm thân theo góc quanh thân (a = 0 trước, PI sau, +PI/2 bên +x): f(i, j) -> [y, a]; đẩy ra theo pháp tuyến
// của tiết diện elip (không chỉ theo z như dan) nên ôm được cả hai bên sườn và đỉnh vai mà không đè lên mặt thân
function phuThan(rows, R, C, f, off, lat = false) {
  return luoi(R, C, (i, j) => {
    const [y, a, o = off] = f(i, j), [, rx, rz, z] = taiY(rows, y), s = Math.sin(a), c = Math.cos(a);
    const nx = s / rx, nz = c / rz, l = Math.hypot(nx, nz) || 1;
    return [rx * s + nx / l * o, y, z + rz * c + nz / l * o, j / C, 1 - i / (R - 1)];
  }, lat);
}
// các độ cao cho hàng của miếng ôm thân từ yTren xuống yDuoi: chia đều n khoảng, thêm mọi hàng dáng thân nằm giữa
// (miếng đi qua đúng chỗ gãy của thân, không bị thân đâm xuyên ở giữa hai hàng)
function hangPhu(rows, yTren, yDuoi, n) {
  const ys = []; for (let i = 0; i <= n; i++) ys.push(yTren + (yDuoi - yTren) * i / n);
  for (const [y] of rows) if (y < yTren - 0.004 && y > yDuoi + 0.004 && !ys.some(v => Math.abs(v - y) < 0.004)) ys.push(y);
  return ys.sort((a, b) => b - a);
}
// góc (quanh thân) của điểm có hoành độ x ở độ cao y, mặt trước
const gocThan = (rows, x, y) => Math.asin(Math.max(-1, Math.min(1, x / taiY(rows, y)[1])));
// hình thoi ôm ống tay / chân (trục -y): r(y) bán kính ống, tâm góc th0 (0 = trước +z, PI/2 = bên +x), nửa góc rộng dth,
// từ y0 xuống y1; hinh(v) độ rộng theo chiều cao (mặc định hình thoi đủ, v 0..1)
function thoiOng(r, y0, y1, th0, dth, off, hinh = v => 1 - Math.abs(2 * v - 1), R = 7, C = 4) {
  return luoi(R, C, (i, j) => {
    const v = i / (R - 1), y = y0 + (y1 - y0) * v, th = th0 + dth * hinh(v) * (2 * j / C - 1), rr = r(y) + off;
    return [Math.sin(th) * rr, y, Math.cos(th) * rr, j / C, 1 - v];
  });
}

// ---------- Giày ----------
const geoGiay = seg => nho("giay" + seg, () => {
  const g = new THREE.SphereGeometry(1, seg, Math.round(seg * 0.7)), p = g.attributes.position;
  for (let i = 0; i < p.count; i++) { const y = p.getY(i), z = p.getZ(i); p.setY(i, Math.max(y, -0.55)); if (z > 0) p.setY(i, Math.max(y, -0.55) * (1 - 0.25 * z)); }
  g.deleteAttribute("normal"); return muotHoa(g);
});
// trong khung cẳng chân (gối ở 0, mặt đất ở -0,46)
function taoGiay(k, kieu, mau, da, tho) {
  const s = tho ? 6 : 9, M = vm(mau), G = geoGiay(s);
  const de = (mDe, w, l, y = -0.452, h = 0.012) => k.add(cau(mDe, w, h, l, 0, y, 0.045, s - 2));
  const than = (w, h, l, y, mat = M) => { const m = mesh(G, mat, 0, y, 0.045); m.scale.set(w, h, l); k.add(m); return m; };
  switch (kieu) {
    case "caoGot": than(0.045, 0.045, 0.11, -0.43); de(M, 0.047, 0.11, -0.45, 0.01); k.add(mesh(ong(0.014, 0.01, 0.05, 6, 1), M, 0, -0.41, -0.045)); break;
    case "depLe": de(M, 0.055, 0.135, -0.452, 0.012); than(0.042, 0.032, 0.11, -0.43, vm(da)); k.add(cau(M, 0.046, 0.012, 0.025, 0, -0.418, 0.08, s)); break;
    case "ung": than(0.066, 0.062, 0.14, -0.416); de(vm(0xd9d6d0), 0.068, 0.143, -0.448, 0.014); break; // ủng siêu nhân
    case "sneaker": case "converse": than(0.06, 0.058, 0.135, -0.418); de(vm(0xf6f6f2), 0.064, 0.14, -0.448, 0.016); if (kieu === "converse") k.add(cau(vm(0xf6f6f2), 0.045, 0.025, 0.03, 0, -0.432, 0.165, s)); break;
    case "bupBe": than(0.047, 0.04, 0.12, -0.432); de(vm(toiMau(mau, 0.7)), 0.049, 0.122, -0.452, 0.009); k.add(cau(vm(da), 0.036, 0.02, 0.05, 0, -0.41, 0.03, s)); break;
    default: than(0.056, 0.052, 0.135, -0.42); de(vm(0x0d0b0a), 0.058, 0.137, -0.452, 0.012);
  }
}

// ---------- Cánh tay có khuỷu ----------
// tay (nhóm ở vai) -> bu (triệt co giãn y của tay cũ) -> xoay (mặt phẳng gập) -> vaiTren (cánh tay trên) -> khuyu (cẳng tay + bàn tay).
// Code cũ xoay tay và co tay.scale.y (giả gập khuỷu): ở đây co tay biến thành gập khuỷu thật sao cho bàn tay vẫn ở đúng chỗ.
// userData.khuyu: gập thêm khuỷu (rad) khi tay không co. Đồ gắn vào tay (ly, cờ, que...) tự chuyển sang khung cẳng tay.
export const TAY_A = 0.295, TAY_B = 0.35, TAY = 0.645;
const BU_TAY = 0.34; // lòng bàn tay người khối hộp (-0,68 từ vai) -> khung cẳng tay mới (bàn tay ở -0,305 từ khuỷu)
// Nhóm giữ đồ: gốc ở lòng bàn tay (khung cẳng tay kh). dung: hướng cố định theo thân người (ly, túi luôn đứng thẳng;
// userData.huong: Quaternion nghiêng thêm, vd. nâng ly uống), không thì theo cẳng tay (userData.huong ghi đè nếu có).
// userData.an: thu nhỏ về 0 (cất đồ khi ngồi). Ma trận tính lại mỗi lần cập nhật cây (sau khi tay đã cập nhật).
const _gp = new THREE.Vector3(), _gt = new THREE.Vector3(), _gs = new THREE.Vector3(), _gq = new THREE.Quaternion();
function nhomGiu(g, kh, ben, dung) {
  const n = new THREE.Group(), cam = new THREE.Vector3(-ben * 0.026, -0.318, 0.014);
  n.userData = { huong: null, an: false, dung };
  n.updateMatrixWorld = function () {
    _gp.copy(cam).applyMatrix4(kh.matrixWorld);
    const h = this.userData.huong;
    if (dung || h) { g.matrixWorld.decompose(_gt, _gq, _gs); if (h) _gq.multiply(h); }
    else kh.matrixWorld.decompose(_gt, _gq, _gs);
    if (this.userData.an) _gs.multiplyScalar(1e-4);
    this.matrixWorld.compose(_gp, _gq, _gs);
    for (const c of this.children) c.updateMatrixWorld(true);
  };
  return n;
}
// hộp bo cạnh (cặp, túi): khối cầu ép vuông
function hopBo(w, h, d, r) {
  const geo = new THREE.SphereGeometry(1, 10, 8), p = geo.attributes.position;
  for (let i = 0; i < p.count; i++) {
    const v = [p.getX(i), p.getY(i), p.getZ(i)], k = Math.max(Math.abs(v[0]), Math.abs(v[1]), Math.abs(v[2])) || 1;
    const q = v.map(x => x / k); // điểm trên khối vuông
    p.setXYZ(i, ...[w, h, d].map((L, m) => Math.sign(q[m]) * Math.max(0, Math.abs(q[m]) * L / 2 - r) + v[m] * r));
  }
  geo.deleteAttribute("normal"); return muotHoa(geo);
}
const _q = new THREE.Quaternion(), _v = new THREE.Vector3();
export function giaiTay(tay) {
  const d0 = tay.userData.moi; if (!d0) return;
  const { bu, xoay, tren, kh, ben } = d0;
  // đồ gắn thêm vào tay theo toạ độ người khối hộp (lòng bàn tay ở -0,68 tính từ vai) -> khung cẳng tay (lòng bàn tay
  // ở -0,34 tính từ khuỷu); đồ đánh dấu userData.dung (ly, cốc) -> nhóm giữ đứng thẳng (gốc ở lòng bàn tay)
  if (tay.children.length > 1) for (const c of [...tay.children]) if (c !== bu) {
    tay.remove(c);
    if (c.userData.dung && d0.dung) { c.position.y += 0.68; c.position.z -= 0.05; d0.dung.add(c); }
    else { c.position.y += BU_TAY; kh.add(c); }
  }
  const sy = tay.scale.y || 1;
  bu.scale.y = 1 / sy;
  const s = Math.min(1, Math.max(0.3, sy));
  let th = 0, ph = 0, ps = 0;
  if (s < 0.999) {
    const d = s * TAY, a = TAY_A, b = TAY_B;
    th = Math.acos(Math.max(-1, Math.min(1, (d * d - a * a - b * b) / (2 * a * b))));
    ph = Math.asin(Math.min(1, b * Math.sin(th) / d));
    // khuỷu chĩa xuống dưới, ra ngoài, hơi ra sau (theo thân người)
    _q.copy(tay.quaternion).invert();
    _v.set(ben * 0.35, -1, -0.45).applyQuaternion(_q);
    const k = Math.min(1, th / 0.35);
    ps = Math.atan2(-_v.x, -_v.z) * k;
  } else th = tay.userData.khuyu || 0;
  xoay.rotation.y = ps; tren.rotation.x = ph; kh.rotation.x = -th;
}
function moc(tay) {
  const goc = tay.updateMatrixWorld;
  tay.updateMatrixWorld = function (f) { giaiTay(this); return goc.call(this, f); };
}

// ---------- Dựng người ----------
// trả về các phần cho nhan-vat-3d.js (cùng tên với người khối hộp): g, tayT, tayP, chanT, chanP, goiT, goiP, than, dau,
// dauY, vaiY, vayDong, matMang (mảng vật liệu mặt, đổi biểu cảm ở chỉ số iMat), khT/khP (khung cẳng tay để gắn đồ)
export function dungNguoiMoi(nh, matTruoc, { tho = false } = {}) {
  const g = new THREE.Group();
  const s = nh.cao ? 1.05 : nh.nho ? 0.93 : 1;
  const r = nh.beo ? 1.16 : nh.gay ? 0.9 : nh.nu ? 0.92 : 1;
  const da = nh.da, ao = nh.ao || { kieu: "thun", mau: 0xf6f6f2 }, q = nh.quan || { kieu: "tay", mau: 0x3a4250 }, pk = nh.pk || [];
  const kieuAo = ao.kieu, kieuQ = q.kieu;
  const VDa = vm(da), VAo = vlAo(ao.vai, ao.mau);
  const giay = nh.giay || ["tay", 0x231f1c];
  const seg = tho ? 5 : nh.sieuNhan ? 10 : 8, segT = tho ? 8 : nh.sieuNhan ? 16 : 14, sc = tho ? 5 : 8;
  const sieu = nh.sieuNhan, HONG_SN = 0xf26fa6, TRANG_SN = 0xf6f6f2;
  const rows = hangThan(nh.nu, nh.beo, r, sieu);
  const y0 = 0.9, coY = 1.49;
  const vay = kieuAo === "vay_lien" || kieuAo === "vay_dai";
  const bo = !vay && (ao.soVin || kieuAo === "dong_phuc" || kieuAo === "vest" || kieuAo === "vest_nu" || kieuAo === "yem" || sieu); // sơ vin
  const VQ = kieuQ === "jean" ? muotVL(nh.__jean || null) || vm(q.mau) : kieuQ === "da" ? VDa : vm(q.mau ?? 0x3a4250);
  const vlQuan = nh.__vlQuan || VQ;

  // ----- Chân: đùi (nhóm ở hông) -> gối -> cẳng chân + giày -----
  const goi = [];
  const chan = side => {
    const k = new THREE.Group(); k.position.set(side * (sieu ? 0.12 : 0.1 * r), 0.9, 0);
    const rd = sieu ? 0.112 : (nh.beo ? 0.095 : nh.nu || nh.gay ? 0.078 : 0.085), rg = rd * 0.72;
    const daChan = kieuQ === "da" || kieuQ === "vay_but";
    const mDui = daChan ? VDa : vlQuan;
    if (kieuQ === "short") {
      k.add(mesh(ong(rd * 0.9, rg, 0.44, seg, [1, 2]), VDa));
      k.add(mesh(ong(rd + 0.006, rd * 0.98 + 0.012, 0.25, seg, 1), vlQuan));
    } else k.add(mesh(ong(daChan ? rd * 0.9 : rd, rg, 0.44, seg, [1, 2]), mDui));
    const daGoi = daChan || kieuQ === "short";
    if (q.rach) k.add(mesh(vaGoi(rg), vm(0xd9cfbf), 0, -0.4, 0));
    if (kieuQ === "tuihop") k.add(cau(vm(toiMau(q.mau, 0.85)), 0.022, 0.07, 0.06, side * (rd + 0.005), -0.27, 0, sc));
    const kn = new THREE.Group(); kn.position.y = -0.44; k.add(kn); goi.push(kn);
    const loe = kieuQ === "loe";
    const r2 = daGoi ? 0.042 : loe ? 0.075 : kieuQ === "jogger" ? 0.044 : sieu ? 0.056 : 0.05;
    kn.add(mesh(ong(rg * 0.97, r2, 0.36, seg, [2, 1], 1, sieu ? 0.082 : null), daGoi ? VDa : mDui)); // siêu nhân: bắp chân tròn
    if (kieuQ === "jogger") kn.add(mesh(ong(0.05, 0.05, 0.035, seg, 1), vm(toiMau(q.mau, 0.7)), 0, -0.33, 0));
    if (sieu) {
      // ủng trắng cao tới giữa bắp chân, cổ ủng khoét hình chữ V hồng ở phía trước (nửa dưới hình thoi)
      const UT = 0.088, UD = 0.068, UL = 0.27, Y0 = -0.13;
      kn.add(mesh(ong(UT, UD, UL, seg, 1), vm(TRANG_SN), 0, Y0, 0));
      const rU = y => UT + (UD - UT) * (Y0 - y) / UL;
      kn.add(mesh(nho("snUngV", () => thoiOng(rU, Y0 + 0.002, Y0 - 0.09, 0, 0.42, 0.003, v => 1 - v, 5, 4)), vm(HONG_SN)));
      if (side > 0) { // bao súng trắng đeo bên hông, áp mặt trước - ngoài đùi (đi theo đùi khi bước / ngồi)
        const a = 0.75, rr = rd + (rg - rd) * 0.12 / 0.44 + 0.02;
        const bao = cau(vm(0xeeebe4), 0.042, 0.07, 0.02, Math.sin(a) * rr, -0.125, Math.cos(a) * rr, 8); bao.rotation.y = a; k.add(bao);
        const nap = cau(vm(0xd9d6d0), 0.044, 0.016, 0.02, Math.sin(a) * (rr + 0.004), -0.066, Math.cos(a) * (rr + 0.004), 6); nap.rotation.y = a; k.add(nap);
      }
    }
    taoGiay(kn, giay[0], giay[1], da, tho);
    return k;
  };
  const chanT = chan(-1), chanP = chan(1);
  g.add(chanT, chanP);

  // ----- Thân -----
  const than = new THREE.Group();
  const hemY = bo ? 0.95 : vay ? 0.93 : 0.86;
  const hangAo = rows.filter(h => h[0] >= hemY - 0.001);
  if (hangAo[hangAo.length - 1][0] > hemY + 0.001) hangAo.push(taiY(rows, hemY));
  if (bo) { const l = hangAo[hangAo.length - 1]; hangAo.push([l[0] - 0.02, l[1] * 0.96, l[2] * 0.95, l[3]]); }
  const trongAo = kieuAo === "vay_dai" && ao.khoac ? vm(ao.khoac) : VAo; // váy dài khoác áo len: thân là áo len
  than.add(mesh(loft(hangAo, segT), trongAo));
  // quần / hông (váy: lớp lót cùng màu váy)
  const hong = (yT, them) => { const [, rx, rz, z] = taiY(rows, yT); return [yT, rx + them, rz + them, z]; };
  if (kieuQ === "vay_but") { // váy bút chì: phần hông liền thân, phần dưới đùi tách ra (ngồi thì nằm theo đùi)
    const [, rx8, rz8] = taiY(rows, 0.88);
    than.add(mesh(loft([hong(1.0, 0.007), hong(0.95, 0.01), [0.9, rx8 + 0.012, rz8 + 0.012, 0], [0.86, rx8 * 0.9, rz8 * 0.9, 0], [0.84, 0, 0, 0]], segT), vm(q.mau)));
  } else {
    const mH = vay ? VAo : kieuQ === "da" ? VDa : vlQuan;
    const top = bo ? [hong(1.0, 0.007), hong(0.95, 0.009)] : [hong(0.93, -0.006), hong(0.9, -0.002)];
    const [, rxh, rzh] = taiY(rows, 0.88);
    than.add(mesh(loft([...top, [0.86, rxh + 0.004, rzh + 0.002, 0], [0.82, rxh * 0.95, rzh * 0.85, 0], [0.79, rxh * 0.75, rzh * 0.7, 0], [0.775, rxh * 0.4, rzh * 0.45, 0], [0.77, 0, 0, 0]], segT), mH));
  }
  const truoc = (x, y) => matThan(rows, x, y);
  // cổ
  if (sieu) than.add(mesh(ong(0.068, 0.074, 0.17, seg, 1), vm(TRANG_SN), 0, 1.64, -0.008)); // cổ lọ trắng, cổ to
  else than.add(mesh(ong(0.05, 0.055, 0.17, seg, 1), VDa, 0, 1.64, -0.01));
  const coVien = (mau, h = 0.014) => than.add(vong(vm(mau), 0.062 * (nh.beo ? 1.08 : 1), h, 0, coY + 0.035, -0.006, PI / 2 + 0.12, tho ? 8 : 12, tho ? 3 : 4));
  if (["somi", "dong_phuc", "polo"].includes(kieuAo)) {
    const mauCo = toiMau(ao.mau, 0.93);
    if (!ao.moCo) {
      coVien(mauCo, 0.016);
      for (const sd of [-1, 1]) { const c = cau(vm(mauCo), 0.042, 0.022, 0.01, sd * 0.04, coY - 0.0, truoc(sd * 0.04, coY - 0.0) - 0.005, sc); c.rotation.z = sd * 0.65; c.rotation.x = -0.3; than.add(c); }
    } else {
      for (const sd of [-1, 1]) { const c = cau(vm(toiMau(ao.mau, 0.9)), 0.06, 0.026, 0.01, sd * 0.07, coY - 0.03, truoc(sd * 0.07, coY - 0.03) + 0.0, sc); c.rotation.z = sd * 1.0; c.rotation.x = -0.25; than.add(c); }
      than.add(mesh(dan(rows, coY + 0.02, coY - 0.12, (y, f) => [-0.06 * (1 - f), 0.06 * (1 - f)], 0.003), VDa));
    }
    if (kieuAo !== "polo") {
      than.add(mesh(dan(rows, coY - 0.03, (bo ? 0.95 : hemY + 0.01), () => [-0.008, 0.008], 0.003, false, 4, 1), vm(toiMau(ao.mau, 0.85))));
      if (!tho) for (let i = 0; i < 4; i++) { const y = coY - 0.08 - i * 0.11; than.add(cau(vm(0xf6f6f2), 0.008, 0.008, 0.004, 0, y, truoc(0, y) + 0.005, 6)); }
    } else than.add(mesh(dan(rows, coY - 0.01, coY - 0.15, () => [-0.022, 0.022], 0.003, false, 4, 2), vm(toiMau(ao.mau, 0.8))));
    if (kieuAo === "dong_phuc") {
      for (const sd of [-1, 1]) than.add(mesh(dan(rows, coY - 0.11, coY - 0.2, () => [sd * 0.065 - 0.045, sd * 0.065 + 0.045], 0.004, false, 3, 3), vm(toiMau(ao.mau, 0.85))));
      than.add(cau(vm(0xe8c547), 0.022, 0.026, 0.006, -0.11, coY - 0.07, truoc(-0.11, coY - 0.07) + 0.006, 8));
    }
    if (ao.nhan) for (let i = 0; i < 3; i++) { const yc = 1.22 + i * 0.07, xc = 0.08 - i * 0.07; than.add(mesh(dan(rows, yc + 0.03, yc - 0.03, (y, f) => [xc - 0.055 + f * 0.04, xc - 0.045 + f * 0.04], 0.003, false, 3, 1), vm(toiMau(ao.mau, 0.82)))); }
  }
  if (kieuAo === "vest" || kieuAo === "vest_nu" || kieuAo === "khoac") {
    const kh = kieuAo === "khoac", yV = kh ? 0.9 : coY - 0.3;
    // áo trong lộ hình chữ V (áo khoác: dải thẳng), ve áo hai bên
    const w = (y, f) => kh ? 0.055 : 0.07 * (1 - f) + 0.004;
    than.add(mesh(dan(rows, coY + 0.025, yV, (y, f) => [-w(y, f), w(y, f)], 0.008, false, kh ? 18 : 10, 4), vm(ao.trong ?? 0xf6f6f2))); // nhiều hàng: ôm theo ngực, không bị thân áo đâm xuyên
    if (!kh) for (const sd of [-1, 1]) than.add(mesh(dan(rows, coY + 0.02, yV + 0.05, (y, f) => { const a = w(y, f); return sd < 0 ? [-a - 0.045 * (1 - f * 0.6), -a] : [a, a + 0.045 * (1 - f * 0.6)]; }, 0.01, false, 10, 2), vm(toiMau(ao.mau, 0.75))));
    if (ao.vien) for (const sd of [-1, 1]) than.add(mesh(dan(rows, coY + 0.02, hemY + 0.005, () => sd < 0 ? [-0.075, -0.055] : [0.055, 0.075], 0.009, false, 16, 1), vm(ao.vien)));
    if (!kh && !tho) for (let i = 0; i < 2; i++) { const y = 1.1 - i * 0.09; than.add(cau(vm(0x111111), 0.011, 0.011, 0.005, 0.0, y, truoc(0, y) + 0.006, 6)); }
    if (ao.caVat) {
      than.add(cau(vm(ao.caVat), 0.022, 0.02, 0.012, 0, coY - 0.01, truoc(0, coY - 0.01) + 0.006, 8));
      than.add(mesh(dan(rows, coY - 0.025, coY - 0.29, (y, f) => { const a = f > 0.88 ? 0.03 * (1 - f) / 0.12 + 0.002 : 0.016 + 0.016 * f; return [-a, a]; }, 0.009, false, 7, 2), vm(ao.caVat)));
    }
    if (kh) { than.add(mesh(vongThan(rows, hemY + 0.03, 0.05, 0.008), vm(ao.mau))); than.add(vong(vm(ao.mau), 0.075, 0.025, 0, coY + 0.03, -0.015, PI / 2 + 0.15, 14, 5)); }
    else coVien(ao.trong ?? 0xf6f6f2, 0.012);
  }
  if (kieuAo === "thun" || kieuAo === "len") {
    coVien(toiMau(ao.mau, 0.75), 0.013);
    if (kieuAo === "len") { than.add(mesh(vongThan(rows, hemY + 0.025, 0.05, 0.006), vm(toiMau(ao.mau, 0.85)))); for (let i = -2; i <= 2; i++) than.add(mesh(dan(rows, coY - 0.06, hemY + 0.06, () => [i * 0.07 - 0.005, i * 0.07 + 0.005], 0.002, false, 5, 1), vm(toiMau(ao.mau, 0.9)))); }
    if (ao.bo) than.add(mesh(dan(rows, 1.3, 1.285, () => [-0.17, 0.17], 0.003, false, 2, 6), vm(toiMau(ao.mau, 0.7))));
  }
  if (kieuAo === "hoodie") {
    const M2 = vm(toiMau(ao.mau, 0.86));
    than.add(mesh(dan(rows, 1.13, 0.94, (y, f) => [-0.12 - f * 0.02, 0.12 + f * 0.02], 0.007, false, 4, 4), M2));
    than.add(cau(M2, 0.13, 0.07, 0.07, 0, coY - 0.0, -0.12, sc)); // mũ trùm sau gáy
    than.add(vong(M2, 0.075, 0.024, 0, coY + 0.025, -0.01, PI / 2 + 0.15, 14, 5));
    for (const sd of [-1, 1]) than.add(mesh(dan(rows, coY - 0.02, coY - 0.17, () => [sd * 0.04 - 0.005, sd * 0.04 + 0.005], 0.006, false, 3, 1), vm(0xf6f6f2)));
    than.add(mesh(vongThan(rows, hemY + 0.025, 0.05, 0.006), M2));
  }
  if (kieuAo === "yem") {
    const VY = ao.yem ? muotVL(ao.yem) : vm(0x3f6f9f);
    than.add(mesh(dan(rows, 1.27, 0.97, () => [-0.12, 0.12], 0.006, false, 5, 4), VY));
    for (const sd of [-1, 1]) {
      than.add(mesh(dan(rows, coY + 0.0, 1.26, () => [sd * 0.1 - 0.02, sd * 0.1 + 0.02], 0.007, false, 5, 1), VY));
      than.add(mesh(dan(rows, coY + 0.0, 0.98, () => [sd * 0.09 - 0.02, sd * 0.09 + 0.02], 0.006, true, 6, 1), VY));
      than.add(cau(vm(0xd8b45a), 0.014, 0.014, 0.006, sd * 0.1, 1.255, truoc(sd * 0.1, 1.255) + 0.012, 6));
    }
    coVien(toiMau(ao.mau, 0.8), 0.012);
  }
  if (vay) {
    than.add(mesh(vongThan(rows, 1.0, 0.04, 0.007), vm(toiMau(ao.mau, 0.7)))); // đai eo
    if (kieuAo === "vay_dai" && ao.khoac) { than.add(mesh(dan(rows, coY + 0.02, 1.02, (y, f) => [-0.07 - 0.03 * f, 0.07 + 0.03 * f], 0.004, false, 6, 3), VAo)); coVien(ao.mau, 0.01); }
    else coVien(toiMau(ao.mau, 0.8), 0.011);
  }
  if (bo && !vay && kieuAo !== "yem" && !sieu) {
    than.add(mesh(vongThan(rows, 0.975, 0.035, 0.011), vm(0x231f1c)));
    if (ao.soVin) than.add(cau(vm(0xb8a060), 0.026, 0.017, 0.006, 0, 0.975, truoc(0, 0.975) + 0.014, 6));
  }
  // phụ kiện trên thân
  if (pk.includes("theDeo")) {
    for (const sd of [-1, 1]) than.add(mesh(dan(rows, coY + 0.01, coY - 0.2, (y, f) => [sd * (0.06 - f * 0.03) - 0.006, sd * (0.06 - f * 0.03) + 0.006], 0.006, false, 4, 1), vm(0x2a5aa8)));
    than.add(mesh(dan(rows, coY - 0.19, coY - 0.35, () => [-0.065, 0.065], 0.01, false, 3, 3), vm(0xf6f6f2)));
    than.add(mesh(dan(rows, coY - 0.2, coY - 0.23, () => [-0.05, 0.05], 0.012, false, 2, 2), vm(0xe8702a)));
  }
  if (pk.includes("butTui") || pk.includes("butHong")) { const y = coY - 0.12; than.add(mesh(ong(0.008, 0.008, 0.08, 6, 1), vm(pk.includes("butHong") ? 0xf26fa6 : 0x2a5aa8), -0.12, y + 0.04, truoc(-0.12, y) + 0.008)); }
  if (pk.includes("caVatLong")) {
    than.add(cau(vm(0x2e8b57), 0.022, 0.02, 0.012, 0, coY - 0.05, truoc(0, coY - 0.05) + 0.008, 8));
    than.add(mesh(dan(rows, coY - 0.06, coY - 0.3, (y, f) => { const c = 0.01 + 0.04 * f, a = f > 0.88 ? 0.03 * (1 - f) / 0.12 + 0.003 : 0.018 + 0.014 * f; return [c - a, c + a]; }, 0.009, false, 6, 2), vm(0x2e8b57)));
  }
  const xHong = taiY(rows, 0.95)[1];
  if (pk.includes("boDam")) { than.add(cau(vm(0x1a1a1a), 0.025, 0.065, 0.035, xHong + 0.02, 0.92, 0.03, sc)); than.add(mesh(ong(0.006, 0.006, 0.07, 5, 1), vm(0x1a1a1a), xHong + 0.025, 1.06, 0.03)); }
  if (pk.includes("chumChiaKhoa")) than.add(cau(vm(0xc9b26a), 0.025, 0.035, 0.015, xHong - 0.02, 0.9, 0.09, 8));
  if (pk.includes("dayCap")) { const c = vong(vm(0x2a2c31), 0.15, 0.011, 0.04, coY - 0.03, 0.0, 1.3, 16, 4); c.rotation.z = 0.6; than.add(c); }
  if (pk.includes("taiNgheCo")) { // tai nghe quàng cổ: quai vòng sau gáy, hai chụp tai nằm trên xương quai xanh
    const M = vm(0x1a1a1a), q = vong(M, 0.088, 0.013, 0, coY + 0.045, -0.005, PI / 2 - 0.15, 12, 4, PI); q.rotation.z = PI; than.add(q);
    for (const sd of [-1, 1]) { const c = cau(M, 0.026, 0.04, 0.036, sd * 0.088, coY + 0.02, 0.035, sc); c.rotation.y = sd * 0.5; c.rotation.x = 0.5; than.add(c); }
  }
  if (sieu) {
    // Siêu Nhân Hồng (bộ Pink Ranger): yếm trắng phủ ngực trên, hai vai và lưng trên, mép dưới hình chữ V nhọn xuống
    // giữa ngực; trên yếm là hàng hình thoi hồng (thoi lớn giữa ngực từ cổ áo xuống, thoi nhỏ trước hai vai, thoi giữa lưng);
    // thắt lưng trắng ôm dưới bụng, khoá tròn bạc mặt đỏ viền vàng. Các miếng đẩy ra theo pháp tuyến thân, không đè mặt.
    const T = vm(TRANG_SN), H = vm(HONG_SN), V0 = 1.195, DOC = 0.58; // đỉnh chữ V và độ dốc mép dưới yếm
    const hangY = [1.552, 1.534, 1.51, 1.48, 1.445, 1.4, 1.37, 1.345, 1.32, 1.295, 1.27, 1.25, 1.23, 1.21, V0];
    for (const sau of [false, true]) {
      than.add(mesh(nho("snYem" + sau, () => phuThan(rows, hangY.length, 10, (i, j) => {
        const y = hangY[i], [, rx] = taiY(rows, y), am = Math.asin(Math.min(1, (y - V0) / DOC / rx));
        const a = Math.max(-am, Math.min(am, PI / 2 * (2 * j / 10 - 1))); // cột cố định, cắt theo mép chữ V
        return [y, sau ? PI - a : a];
      }, 0.004, sau)), T));
      // thoi lớn giữa ngực / giữa lưng
      const yT = hangPhu(rows, 1.505, 1.225, 8);
      than.add(mesh(nho("snThoi" + sau, () => phuThan(rows, yT.length, 4, (i, j) => {
        const y = yT[i], v = (1.505 - y) / 0.28, x = 0.105 * (1 - Math.abs(2 * v - 1)) * (2 * j / 4 - 1), a = gocThan(rows, x, y);
        return [y, sau ? PI - a : a];
      }, 0.0075, sau)), H));
    }
    const yV = hangPhu(rows, 1.47, 1.33, 6);
    for (const sd of [-1, 1]) than.add(mesh(nho("snThoiVai" + sd, () => phuThan(rows, yV.length, 4, (i, j) => { // thoi trước vai
      const y = yV[i], v = (1.47 - y) / 0.14, x = sd * 0.162 + 0.045 * (1 - Math.abs(2 * v - 1)) * (2 * j / 4 - 1);
      return [y, gocThan(rows, x, y)];
    }, 0.0075)), H));
    // thắt lưng ôm theo thân (dưới bụng): mép trên áp sát, mép dưới chui vào trong vạt áo
    const yL = [[1.002, 0.004], [0.997, 0.011], [0.975, 0.012], [0.952, 0.013], [0.946, 0.006]];
    than.add(mesh(nho("snLung", () => phuThan(rows, yL.length, 20, (i, j) => [yL[i][0], -PI + 2 * PI * j / 20, yL[i][1]], 0)), T));
    // khoá thắt lưng: đĩa tròn bạc, mặt đỏ, viền vàng, nghiêng theo dốc bụng
    const yK = 0.975, dz = (truoc(0, yK + 0.01) - truoc(0, yK - 0.01)) / 0.02, khoa = new THREE.Group();
    khoa.position.set(0, yK, truoc(0, yK) + 0.014); khoa.rotation.x = Math.atan(dz); than.add(khoa);
    const dia = (r, h, mau, z) => { const m = mesh(nho(`snDia${r}`, () => new THREE.CylinderGeometry(r, r * 0.92, h, 12, 1)), vm(mau), 0, 0, z); m.rotation.x = PI / 2; m.scale.z = 0.86; return m; };
    khoa.add(dia(0.056, 0.014, 0xc9ced8, 0), dia(0.04, 0.008, 0xd8b45a, 0.008), dia(0.03, 0.006, 0xb3202a, 0.012));
  }
  g.add(than);

  // váy liền / váy dài: phần dưới tách riêng để đung đưa theo bước chân (và xoè ra trước khi ngồi)
  let vayDong = null;
  if (kieuQ === "vay_but") {
    vayDong = new THREE.Group(); vayDong.position.y = 0.92; vayDong.userData.ngoi = -1.38;
    const [, rx, rz] = taiY(rows, 0.88);
    vayDong.add(mesh(loft([[0.0, rx + 0.012, rz + 0.012, 0], [-0.18, rx * 0.98, rz * 1.02, 0.005], [-0.37, rx * 0.9, rz * 0.98, 0.005], [-0.42, rx * 0.84, rz * 0.9, 0.005], [-0.43, 0, 0, 0]], segT), vm(q.mau)));
    g.add(vayDong);
  }
  if (vay) {
    vayDong = new THREE.Group(); vayDong.position.y = 0.98;
    const dai = kieuAo === "vay_dai" ? 0.58 : 0.42, [, rx, rz, z] = taiY(rows, 0.98), mo = kieuAo === "vay_dai" ? 0.3 : 0.27, sau = kieuAo === "vay_dai" ? 0.92 : 0.8; // váy dài: gấu sâu hơn để gối không lòi ra khi bước
    vayDong.add(mesh(loft([[0.025, rx + 0.006, rz + 0.006, z], [-0.04, rx + 0.016, rz + 0.016, z], [-dai * 0.5, (rx + mo) / 2 + 0.01, (rz + mo * sau) / 2 + 0.01, 0], [-dai + 0.02, mo, mo * sau, 0], [-dai, mo - 0.01, mo * sau - 0.01, 0], [-dai + 0.015, mo - 0.025, mo * sau - 0.025, 0]], segT), VAo));
    g.add(vayDong);
  }
  if (sieu) { // vạt áo ngắn xoè quanh hông (dưới thắt lưng), viền trắng ở gấu; ngồi thì vạt trước nằm theo đùi
    vayDong = new THREE.Group(); vayDong.position.y = 0.955; vayDong.userData.ngoi = -0.45;
    const [, rx, rz, z] = taiY(rows, 0.955);
    vayDong.add(mesh(loft([[0.012, rx + 0.004, rz + 0.004, z], [-0.016, rx + 0.014, rz + 0.014, z], [-0.06, rx + 0.026, rz + 0.024, z * 0.7], [-0.105, rx + 0.04, rz + 0.036, z * 0.45]], segT), vm(HONG_SN)));
    vayDong.add(mesh(loft([[-0.105, rx + 0.04, rz + 0.036, z * 0.45], [-0.132, rx + 0.05, rz + 0.046, z * 0.35], [-0.138, rx + 0.046, rz + 0.042, z * 0.35], [-0.133, rx + 0.03, rz + 0.026, z * 0.35]], segT), vm(TRANG_SN)));
    g.add(vayDong);
  }

  // ----- Tay -----
  const vaiY = 1.43, vaiX = taiY(rows, 1.42)[1] + 0.022;
  const ngan = kieuAo === "thun" || kieuAo === "polo" || kieuAo === "yem" || kieuAo === "vay_lien";
  const mTay = kieuAo === "vay_dai" ? vm(ao.khoac || ao.mau) : VAo;
  const ra = sieu ? 0.072 : (nh.beo ? 0.066 : nh.nu || nh.gay ? 0.05 : 0.056), rb = ra * (sieu ? 0.8 : 0.8), rc = ra * (sieu ? 0.65 : 0.66);
  const khung = [];
  const tay = side => {
    const t = new THREE.Group(); t.position.set(side * vaiX, vaiY, sieu ? -0.03 : 0); // siêu nhân: vai hơi lùi sau, bụng nhô trước tay
    const bu = new THREE.Group(), xoay = new THREE.Group(), tren = new THREE.Group(), kh = new THREE.Group();
    t.add(bu); bu.add(xoay); xoay.add(tren); kh.position.y = -TAY_A; tren.add(kh);
    // đầu tròn của cánh tay trên / cẳng tay cùng tâm ở vai và khuỷu: gập tới đâu khớp vẫn liền
    // (đỉnh vai hạ thấp một chút cho liền với dốc vai của thân)
    if (sieu) {
      // tay áo hồng; đầu vai bọc trắng (nối với yếm), hình thoi hồng phía ngoài; găng trắng cổ loe tới giữa cẳng tay,
      // trên mu cổ găng một hình thoi hồng
      tren.add(mesh(ong(ra, rb, TAY_A - 0.02, seg, 2), vm(HONG_SN), 0, -0.02, 0));
      const V1 = ra + 0.007, V2 = ra * 0.95 + 0.007, VL = 0.1;
      tren.add(mesh(ong(V1, V2, VL, seg, [2, 1]), vm(TRANG_SN), 0, -0.02, 0));
      tren.add(mesh(nho("snThoiTay" + side, () => thoiOng(y => V1 + (V2 - V1) * (-0.02 - y) / VL, -0.024, -0.118, side * PI / 2, 0.5, 0.003)), vm(HONG_SN)));
      kh.add(mesh(ong(rb * 0.97, rc, 0.24, seg, [2, 1]), vm(HONG_SN)));
      const G1 = rb * 0.97 + (rc - rb * 0.97) * 0.1 / 0.24 + 0.014, G2 = rc + 0.006, GL = 0.162;
      kh.add(mesh(ong(G1, G2, GL, seg, [1, 1]), vm(TRANG_SN), 0, -0.1, 0));
      kh.add(mesh(nho("snThoiGang" + side, () => thoiOng(y => G1 + (G2 - G1) * (-0.1 - y) / GL, -0.12, -0.235, side * PI / 2, 0.55, 0.003)), vm(HONG_SN)));
    } else if (ngan) { tren.add(mesh(ong(ra * 0.92, rb, TAY_A - 0.02, seg, 2), VDa, 0, -0.02, 0)); tren.add(mesh(ong(ra + 0.008, ra + 0.006, 0.13, seg, [2, 1]), mTay, 0, -0.02, 0)); }
    else tren.add(mesh(ong(ra, rb, TAY_A - 0.02, seg, 2), mTay, 0, -0.02, 0));
    if (!sieu) kh.add(mesh(ong(rb * 0.97, rc, 0.24, seg, [2, 1]), ngan ? VDa : mTay));
    if (!ngan && !sieu) kh.add(mesh(ong(rc + 0.006, rc + 0.006, 0.035, seg, [1, 1]), kieuAo === "vest" || kieuAo === "vest_nu" ? vm(ao.trong ?? 0xf6f6f2) : vm(toiMau(ao.mau, 0.8)), 0, -0.21, 0));
    // bàn tay: lòng bàn tay quay vào thân, ngón cái phía trước
    const VB = sieu ? vm(TRANG_SN) : VDa, kb = nh.nu ? 0.88 : sieu ? 1.08 : 1;
    const ban = cau(VB, 0.025 * kb, 0.06 * kb, 0.042 * kb, 0, -0.305, 0.008, sc); ban.rotation.x = -0.15; kh.add(ban);
    const cai = cau(VB, 0.012, 0.03, 0.012, -side * 0.008, -0.29, 0.036, 6); cai.rotation.x = -0.6; cai.rotation.z = side * 0.3; kh.add(cai);
    if (side === -1 && pk.includes("dongHoVang")) kh.add(mesh(ong(rc + 0.008, rc + 0.008, 0.02, seg, 1), vm(0xd8b45a), 0, -0.235, 0));
    if (side === -1 && pk.includes("vongTay")) kh.add(mesh(ong(rc + 0.007, rc + 0.007, 0.016, seg, 1), vm(0xf26fa6), 0, -0.235, 0));
    // đồ cầm tay: nằm trong các "nhóm giữ" có gốc ở lòng bàn tay (xem nhomGiu): ly / bình / túi luôn đứng thẳng,
    // điện thoại / micro / bút / sổ theo cẳng tay. Gộp chung khối xương như mọi phần khác (nhóm giữ là một xương).
    const giu = { tay: nhomGiu(g, kh, side, false), dung: nhomGiu(g, kh, side, true) };
    if (side === 1) {
      giu.dt = nhomGiu(g, kh, side, false); // điện thoại của cử chỉ (gọi điện, xem điện thoại): hướng do nhan-vat-3d.js đặt
      if (pk.includes("dienThoai")) giu.tay.add(mesh(nho("dtCam", () => new THREE.BoxGeometry(0.068, 0.13, 0.012)), vm(0x1a1a1a), 0, 0.01, 0.005));
      if (pk.includes("micro")) { giu.tay.add(mesh(nho("mic", () => new THREE.CylinderGeometry(0.017, 0.012, 0.17, 8)), vm(0x1a1a1a), 0, 0.02, 0)); giu.tay.add(cau(vm(0xb5b5b5), 0.032, 0.032, 0.032, 0, 0.115, 0, 8)); }
      if (pk.includes("tachTra")) { giu.dung.add(mesh(nho("tach", () => new THREE.CylinderGeometry(0.038, 0.03, 0.07, 12)), vm(0xf6f6f2), -side * 0.02, 0.005, 0.012)); const q = vong(vm(0xf6f6f2), 0.02, 0.006, side * 0.025, 0.008, 0.012, 0, 8, 4); q.rotation.y = PI / 2; giu.dung.add(q); }
      if (pk.includes("binhGiuNhiet")) { giu.dung.add(mesh(nho("binh", () => new THREE.CylinderGeometry(0.033, 0.033, 0.21, 12)), vm(0xb7c7d6), 0, 0.04, 0)); giu.dung.add(mesh(nho("napBinh", () => new THREE.CylinderGeometry(0.03, 0.034, 0.035, 12)), vm(0x5a6a7a), 0, 0.16, 0)); }
      if (pk.includes("cocRender")) { giu.dung.add(mesh(nho("cocR", () => new THREE.CylinderGeometry(0.042, 0.033, 0.11, 12)), vm(0xf6f6f2), 0, 0.01, 0.01)); giu.dung.add(mesh(nho("napCoc", () => new THREE.CylinderGeometry(0.04, 0.044, 0.014, 12)), vm(0x3a2a20), 0, 0.072, 0.01)); }
      if (pk.includes("butCamUng")) giu.tay.add(mesh(nho("butCU", () => new THREE.CylinderGeometry(0.006, 0.004, 0.15, 6)), vm(0xf6f6f2), 0, 0.01, 0.01));
    } else {
      // sổ kẹp bên hông, túi xách / cặp da xách tay (để xuống khi ngồi: nhan-vat-3d.js ẩn nhóm giữ tay trái)
      if (pk.includes("soTay") || pk.includes("soDa")) giu.tay.add(mesh(nho("so", () => new THREE.BoxGeometry(0.022, 0.21, 0.155)), vm(pk.includes("soTay") ? 0x2f6b3a : 0x6b4a2f), side * -0.02, 0.07, 0.0));
      if (pk.includes("capDa")) {
        giu.dung.add(mesh(nho("capDa", () => hopBo(0.085, 0.27, 0.36, 0.025)), vm(0x5a3d2a), 0, -0.165, 0));
        const q = vong(vm(0x3a2a1c), 0.035, 0.009, 0, -0.028, 0, 0, 10, 4, PI); q.rotation.y = PI / 2; giu.dung.add(q);
      }
      if (pk.includes("tuiXach")) {
        giu.dung.add(mesh(nho("tuiXach", () => hopBo(0.1, 0.17, 0.24, 0.035)), vm(0xe8e0c8), 0, -0.135, 0));
        const q = vong(vm(0xc8b890), 0.075, 0.008, 0, -0.05, 0, 0, 12, 4, PI); q.rotation.y = PI / 2; q.scale.set(1, 0.7, 1); giu.dung.add(q);
      }
    }
    dsGiu.push(giu);
    moc(t);
    t.userData.moi = { bu, xoay, tren, kh, ben: side, dung: giu.dung };
    khung.push(kh);
    return t;
  };
  const dsGiu = [];
  const tayT = tay(-1), tayP = tay(1);
  g.add(tayT, tayP);
  for (const giu of dsGiu) for (const n of Object.values(giu)) g.add(n); // sau hai tay: khung cẳng tay đã cập nhật trước

  // ----- Đầu -----
  const dauY = coY + 0.24;
  const dau = new THREE.Group(); dau.position.y = dauY;
  let matMang = null;
  if (sieu) {
    // mũ bảo hiểm siêu nhân: vỏ tròn hồng; kính đen cong ôm trọn mặt trước (mép kính chìm vào vỏ mũ, ở giữa hạ xuống
    // thành mỏ nhọn), vệt sáng trên kính, tấm che miệng bạc, sọc trắng nổi chạy dọc giữa đỉnh mũ ra sau gáy
    // (mũ Pink Ranger): vỏ hồng tròn; kính đen hình trái tim; gờ nổi chạy dọc đỉnh mũ từ gáy xuống trán thành mỏ nhọn
    // cắm vào giữa kính (hai mắt nhỏ xanh ngọc trên mỏ); tấm che miệng bạc dưới kính; vệt sáng trên kính
    const HONG = vm(HONG_SN);
    const m = mesh(geoDau(tho), HONG); m.scale.set(...MU_SN); dau.add(m);
    dau.add(mesh(nho("snKinh" + tho, () => kinhSieuNhan(tho ? 14 : 22, tho ? 6 : 8)), vm(0x16181e)));
    if (!tho) dau.add(mesh(nho("snBong", () => vaMu(4, 8, (i, j) => [-0.68 + 0.3 * j / 7, 0.054 - 0.01 * i / 3 - 0.006 * j / 7, 0.0118 + 0.0012 * Math.sin(PI * i / 3) * Math.sin(PI * j / 7)])), vm(0x7d879c)));
    dau.add(mesh(nho("snMieng" + tho, () => vaMu(5, tho ? 8 : 11, (i, j, R, C) => {
      const v = i / (R - 1), u = j / (C - 1), e = Math.abs(2 * u - 1), bo = Math.sqrt(Math.max(0, 1 - e ** 5));
      return [(u - 0.5) * 1.0, -0.08 - 0.068 * v * (0.3 + 0.7 * bo), -0.002 + 0.009 * Math.min(1, 5 * v * (1 - v)) * Math.min(1, 9 * u * (1 - u))];
    })), vm(0xc9ced8)));
    dau.add(mesh(nho("snMo" + tho, () => moSieuNhan(tho ? 10 : 18)), HONG));
    if (!tho) for (const sd of [-1, 1]) { // hai mắt nhỏ trên mỏ
      const p = diemMoMu(1.3, sd * 0.07, MO_SN.noi(1.3) + 0.001), e = cau(vm(0x58b8b0), 0.0045, 0.009, 0.003, ...p, 6);
      e.quaternion.setFromUnitVectors(new THREE.Vector3(0, 0, 1), new THREE.Vector3(...diemMoMu(1.3, sd * 0.07, 0.06)).sub(new THREE.Vector3(...p)).normalize()); dau.add(e);
    }
    dau.add(mesh(vaDau(-PI, PI, -0.19, -0.14, 0.03, 3, 18), vm(0xd94d8a)));           // viền cổ mũ
  } else {
    matMang = [matTruoc];
    const hd = new THREE.Mesh(geoDau(tho), matMang);
    hd.geometry.groups.length || hd.geometry.addGroup(0, hd.geometry.attributes.position.count, 0);
    dau.add(hd);
    for (const sd of [-1, 1]) { const tai = cau(VDa, 0.02, 0.04, 0.028, sd * 0.139, -0.01, -0.008, 6); tai.rotation.z = sd * -0.15; dau.add(tai); }
    const kt = pk.includes("khauTrangCam") || pk.includes("khauTrangVai");
    if (!kt) { const mui = cau(vm(toiMau(da, 0.97)), 0.016, 0.026, 0.018, 0, -0.042, 0.141, 6); mui.rotation.x = 0.4; dau.add(mui); }
    const [kieuToc, mauToc, mauToc2] = nh.toc || ["cua", 0x1a1a1a];
    const coMu = pk.includes("muLen") || pk.includes("muKepi") || pk.includes("muBaoHiem");
    if (!(coMu && tho)) taoTocMoi(dau, kieuToc, mauToc, mauToc2, tho, coMu);
    // kính: hai mắt kính đặt ngay trước mắt (ảnh mặt: mắt ở x ±0,056, y 0,013), nghiêng theo độ cong của mặt,
    // cầu kính trên sống mũi, gọng chạy về tới tai
    const kinh = (mau, ve, { y = 0.015, xa = 0.057, cach = 0.017, rong = 0.045 } = {}) => {
      const M = vm(mau);
      for (const sd of [-1, 1]) {
        const x = sd * xa, z = matTruocDau(x, y) + cach, m = ve(M, sd);
        m.position.set(x, y, z); m.rotation.y = sd * 0.32; dau.add(m);
        const xn = sd * (xa + rong * 0.95), zn = matTruocDau(xn, y + 0.004) + cach * 0.6;
        dau.add(thanhNoi(M, [xn, y + 0.006, zn], [sd * 0.147, y + 0.01, -0.012], 0.0045)); // gọng
      }
      const zc = matTruocDau(0, y) + cach + 0.004;
      dau.add(thanhNoi(M, [-xa + rong * 0.8, y + 0.008, zc - 0.006], [xa - rong * 0.8, y + 0.008, zc - 0.006], 0.004)); // cầu kính
    };
    if (pk.includes("kinhVuong")) kinh(0x1a1a1a, M => { const v = vong(M, 0.045, 0.006, 0, 0, 0, 0, 4, 4); v.rotation.set(0, 0, PI / 4); const g2 = new THREE.Group(); g2.scale.set(1.12, 0.78, 1); g2.add(v); return g2; });
    if (pk.includes("kinhTron")) kinh(0x8a6a3a, M => vong(M, 0.038, 0.006, 0, 0, 0, 0, 12, 4), { rong: 0.038 });
    if (pk.includes("kinhLao")) // kính lão nửa vầng trăng trễ xuống sống mũi
      kinh(0x6b4a2f, M => { const g2 = new THREE.Group(); const v = vong(M, 0.032, 0.005, 0, 0, 0, 0, 10, 4, PI); v.rotation.z = PI; g2.add(v, cau(M, 0.033, 0.0045, 0.0045, 0, 0, 0, 6)); return g2; }, { y: -0.012, xa: 0.054, cach: 0.026, rong: 0.033 });
    if (pk.includes("kinhRam") || pk.includes("kinhRamTo")) {
      const to = pk.includes("kinhRamTo") ? 1.2 : 1;
      kinh(0x070707, M => cau(M, 0.05 * to, 0.032 * to, 0.011, 0, 0, 0, 10), { xa: 0.058 * to, rong: 0.05 * to, cach: 0.016 });
    }
    if (pk.includes("khauTrangCam")) dau.add(mesh(vaDau(-1.3, 1.3, -0.15, -0.02, 0.012), vm(0xa9d3ee)));
    if (pk.includes("khauTrangVai")) dau.add(mesh(vaDau(-1.3, 1.3, -0.155, -0.015, 0.012), vm(nh.mauKhauTrang || 0x3a4250)));
    if (pk.includes("taiNgheChup")) { // đội mũ len thì chụp tai và quai nằm ngoài mũ
      const ra = coMu ? 0.2 : 0.165, M = vm(0x1a1a1a);
      for (const x of [-1, 1]) { dau.add(cau(M, 0.03, 0.055, 0.05, x * (ra - 0.003), -0.005, 0, sc)); dau.add(cau(vm(0x3a3a3a), 0.008, 0.04, 0.036, x * (ra + 0.026), -0.005, 0, sc)); }
      const v = vong(M, ra, 0.013, 0, 0, 0, 0, 16, 5, PI); v.scale.set(1, coMu ? 1.15 : 1.17, 1); dau.add(v);
    }
    if (pk.includes("dienThoaiTai")) dau.add(cau(vm(0x1a1a1a), 0.012, 0.07, 0.035, 0.162, -0.01, 0.01, 8));
    if (pk.includes("bluetooth")) dau.add(cau(vm(0x3fb8e0), 0.012, 0.02, 0.02, 0.152, -0.005, 0.02, 8));
    if (pk.includes("muLen")) {
      const M = vm(0x2d3a55);
      dau.add(mesh(nho("muLen" + tho, () => voToc({ tran: 0.36, ben: 0.47, sau: 0.6, day: 0.042, C: tho ? 16 : 24, R: tho ? 8 : 11 })), M));
      dau.add(mesh(nho("muLenVanh" + tho, () => voToc({ bat: b => 0.36 * Math.max(0, Math.cos(b)) ** 2 + 0.47 * (1 - Math.cos(b) ** 2) + 0.6 * Math.max(0, -Math.cos(b)) ** 2 - 0.07, tran: 0.36, ben: 0.47, sau: 0.6, day: 0.052, C: tho ? 16 : 24, R: 6 })), vm(toiMau(0x2d3a55, 0.8))));
    }
    if (pk.includes("muKepi")) {
      const M = vm(0x23406f);
      dau.add(mesh(nho("kepi", () => loft([[0.235, 0, 0, -0.01], [0.235, 0.15, 0.16, -0.01], [0.225, 0.172, 0.182, -0.01], [0.16, 0.162, 0.17, -0.01], [0.12, 0.158, 0.165, 0], [0.11, 0.155, 0.162, 0]], 18)), M));
      dau.add(mesh(nho("kepiVanh", () => loft([[0.14, 0.162, 0.168, 0], [0.11, 0.162, 0.168, 0]], 18)), vm(0x1a2a48)));
      const l = cau(vm(0x111111), 0.15, 0.012, 0.11, 0, 0.115, 0.135, 12); l.rotation.x = 0.25; dau.add(l);
      dau.add(cau(vm(0xe8c547), 0.025, 0.025, 0.006, 0, 0.18, 0.175, 8));
    }
    if (pk.includes("butCamUng")) { const b = mesh(ong(0.006, 0.005, 0.13, 6, 1), vm(0xf6f6f2), 0.172, 0.045, 0.06); b.rotation.x = PI / 2 + 0.25; dau.add(b); } // bút gài vành tai
    if (pk.includes("nonLa")) { const n = new THREE.Mesh(nho("nonLa", () => new THREE.ConeGeometry(0.34, 0.2, 14, 1, true)), vm2(0xe6d39a)); n.position.y = 0.25; dau.add(n); }
    if (pk.includes("muBaoHiem")) {
      const mau = nh.mauMu || 0xc0262d;
      dau.add(mesh(nho("muBH" + tho, () => voToc({ tran: 0.3, ben: 0.5, sau: 0.6, day: 0.05, C: tho ? 16 : 22, R: tho ? 7 : 10 })), vm(mau)));
      const l = cau(vm(toiMau(mau, 0.7)), 0.14, 0.01, 0.07, 0, 0.115, 0.15, 10); l.rotation.x = 0.3; dau.add(l);
    }
    if (nh.nu) for (const x of [-0.143, 0.143]) dau.add(cau(vm(0xe8c547), 0.009, 0.012, 0.009, x, -0.06, 0.0, 6)); // bông tai
  }
  g.add(dau);
  // gộp sẵn các khối màu trơn của từng khớp (thân, đầu, đùi, cẳng chân, cánh tay, cẳng tay...) thành một khối màu đỉnh:
  // gộp nhân vật về sau (toi-uu.js) nhanh như người khối hộp, chưa gộp xong cũng chỉ ~15 lượt vẽ
  g.traverse(o => { if (!o.isMesh && o.children.some(c => c.isMesh)) gopMuot(o, false); });
  g.scale.setScalar(s);
  return { g, s, tayT, tayP, chanT, chanP, goiT: goi[0], goiP: goi[1], than, dau, dauY, vaiY, vayDong, matMang, iMat: 0, khT: khung[0], khP: khung[1], moi: true, rows, giuT: dsGiu[0], giuP: dsGiu[1] };
}
// miếng rách gối quần jean
const vaGoi = rg => nho("vaGoi" + rg, () => luoi(3, 4, (i, j) => { const a = -0.6 + 1.2 * j / 4, y = 0.03 - i * 0.03; return [Math.sin(a) * (rg + 0.006), y, Math.cos(a) * (rg + 0.006), j / 4, i / 2]; }));

// ---------- Chó (vai "Chó Công Ty"): chó ta lông vàng, tai vểnh, đuôi cong, vòng cổ đỏ có chuông ----------
export function taoChoMoi() {
  const g = new THREE.Group();
  const vang = vm(0xd9a24a), nhat = vm(0xedc98a), toi = vm(0xc48c38), den = vm(0x111111);
  const than = new THREE.Group(); g.add(than);
  than.add(mesh(nho("choThan", () => loft([[0.3, 0, 0, 0.27], [0.3, 0.07, 0.06, 0.31], [0.33, 0.13, 0.11, 0.25], [0.32, 0.15, 0.15, 0.1], [0.32, 0.14, 0.15, -0.1], [0.34, 0.13, 0.12, -0.24], [0.32, 0.07, 0.07, -0.31], [0.3, 0, 0, -0.32]].map(([y, rx, rz, z]) => [y + 0.12, rx, rz, z]), 14)), vang));
  // thân nằm ngang: dựng ống dọc trục z
  than.children[0].geometry = nho("choThanNgang", () => { const h = new THREE.SphereGeometry(1, 14, 10); h.scale(0.15, 0.15, 0.33); return h; });
  than.children[0].position.set(0, 0.44, 0);
  than.add(cau(nhat, 0.12, 0.08, 0.26, 0, 0.36, 0.0, 10));
  const co = cau(vang, 0.085, 0.12, 0.09, 0, 0.56, 0.3, 10); co.rotation.x = 0.59; than.add(co); // cổ nối thân với đầu
  than.add(vong(vm(0xc0262d), 0.093, 0.02, 0, 0.56, 0.3, PI / 2 + 0.6, 14, 5)); // vòng cổ ôm quanh cổ
  than.add(cau(vm(0xe8c547), 0.024, 0.024, 0.024, 0, 0.485, 0.39, 8));
  const dau = new THREE.Group(); dau.position.set(0, 0.64, 0.36); g.add(dau);
  dau.add(cau(vang, 0.13, 0.12, 0.13, 0, 0, 0, 12), cau(nhat, 0.075, 0.065, 0.09, 0, -0.04, 0.12, 10), cau(den, 0.03, 0.022, 0.018, 0, -0.01, 0.21, 8));
  for (const x of [-0.07, 0.07]) {
    const tai = new THREE.Mesh(nho("taiCho", () => new THREE.ConeGeometry(0.045, 0.12, 8)), toi); tai.position.set(x, 0.14, -0.01); tai.rotation.z = -x * 2; dau.add(tai);
    dau.add(cau(den, 0.022, 0.024, 0.012, x * 0.8, 0.035, 0.115, 8), cau(vm(0xffffff), 0.007, 0.007, 0.004, x * 0.8 + 0.006, 0.045, 0.126, 6));
  }
  const chan = [[-0.09, 0.2], [0.09, 0.2], [-0.09, -0.2], [0.09, -0.2]].map(([x, z]) => { const c = new THREE.Group(); c.position.set(x, 0.36, z); c.add(mesh(ong(0.045, 0.035, 0.3, 8, 1), vang), cau(nhat, 0.042, 0.025, 0.055, 0, -0.335, 0.015, 8)); g.add(c); return c; });
  const duoi = new THREE.Group(); duoi.position.set(0, 0.56, -0.3); g.add(duoi);
  duoi.add(vong(vang, 0.07, 0.028, 0, 0.06, -0.03, 0, 12, 6, PI * 1.4)); duoi.children[0].rotation.y = PI / 2;
  return {
    group: g, chieuCao: 0.9,
    hoatDong(t, dangDi) {
      duoi.rotation.z = Math.sin(t * 10) * 0.4;
      const goc = dangDi ? Math.sin(t * 12) * 0.5 : 0;
      chan.forEach((c, i) => c.rotation.x = (i % 2 ? goc : -goc));
      dau.rotation.y = Math.sin(t * 0.7) * 0.25;
    },
  };
}

// ---------- Đôi tay góc nhìn thứ nhất ----------
export function dungTayNhin(ao, da, co, nu, sieu = false) {
  const mot = ben => {
    const t = new THREE.Group();
    const k = new THREE.Group(); k.rotation.x = PI / 2; t.add(k); // trục -y của khối -> hướng -z (ra trước mặt)
    if (sieu) { // Siêu Nhân Hồng: ống tay hồng to, găng trắng cổ loe, hình thoi hồng trên mu cổ găng (phía trên: -z cục bộ)
      k.add(mesh(ong(0.043, 0.037, 0.27, 12, 1), vm(ao), 0, 0.02, 0));
      const G1 = 0.049, G2 = 0.04, GL = 0.095;
      k.add(mesh(ong(G1, G2, GL, 12, [1, 1]), vm(co), 0, -0.19, 0));
      k.add(mesh(nho("snThoiGangNhin", () => thoiOng(y => G1 + (G2 - G1) * (-0.19 - y) / GL, -0.198, -0.276, PI, 0.6, 0.002)), vm(0xf26fa6)));
    } else {
      k.add(mesh(ong(0.036, 0.031, 0.27, 12, 1), vm(ao), 0, 0.02, 0));
      k.add(mesh(ong(0.034, 0.034, 0.03, 12, 1), vm(co), 0, -0.26, 0));
    }
    const VB = vm(da), kb = nu ? 0.9 : sieu ? 1.08 : 1;
    // bàn tay úp xuống (mu bàn tay lên trên), ngón hơi cong
    k.add(cau(VB, 0.038 * kb, 0.055 * kb, 0.021 * kb, 0, -0.33, 0.0, 12));
    const ngon = cau(VB, 0.035 * kb, 0.045 * kb, 0.017 * kb, 0, -0.39, 0.012, 12); ngon.rotation.x = 0.35; k.add(ngon);
    const cai = cau(VB, 0.012, 0.032, 0.012, ben * -0.036, -0.32, 0.012, 8); cai.rotation.z = ben * -0.5; k.add(cai);
    return t;
  };
  return mot;
}

// ---------- Đồ thêm cho người kiểu mới (nguoi-bua.js, nguoi-pho.js) ----------
// nv: kết quả taoNguoi; nv.thanHinh có khi là người kiểu mới (các hàm trả về null với người khối hộp)
export function vongEo(nv, mau, y, h, them = 0.012) { // vòng ôm thân / hông: thắt lưng, quần sịp siêu nhân, dải phản quang
  if (!nv.thanHinh) return null;
  const m = mesh(vongThan(nv.thanHinh, y, h, them, 14), typeof mau === "number" ? vm(mau) : mau); nv.than.add(m); return m;
}
export function danThan(nv, mau, yTren, yDuoi, xr, off = 0.006, sau = false) { // miếng dán ôm ngực / lưng
  if (!nv.thanHinh) return null;
  const m = mesh(dan(nv.thanHinh, yTren, yDuoi, xr, off, sau, 5, 3), typeof mau === "number" ? vm(mau) : mau); nv.than.add(m); return m;
}
export const matThanNv = (nv, x, y, sau = 1) => nv.thanHinh ? matThan(nv.thanHinh, x, y, sau) : null;
export function vongDau(nv, mau, y = 0.09, day = 0.016) { // băng đô, vòng kim cô (ôm quanh đầu, trên tóc)
  const k = Math.sqrt(Math.max(0.1, 1 - (y / DAU.y) ** 2));
  const m = vong(typeof mau === "number" ? vm(mau) : mau, 1, day, 0, y, 0, PI / 2, 16, 4);
  // vòng đơn vị co theo hai trục ngang; trục dọc (z cục bộ) cũng co để băng chỉ dày "day" (trước đây dày gấp ~7 lần)
  const R = DAU.x * k + 0.026;
  m.scale.set(R, DAU.z * k + 0.026, R); m.geometry = nho(`vongDau${day},${R.toFixed(4)}`, () => new THREE.TorusGeometry(1, day / R, 4, 16));
  nv.dau.add(m); return m;
}
export function matNa(nv, mau, y0 = -0.02, y1 = 0.055) { const m = mesh(vaDau(-1.75, 1.75, y0, y1, 0.008, 4, 12), typeof mau === "number" ? vm(mau) : mau); nv.dau.add(m); return m; }
export function vaMat(nv, mau, b0, b1, y0, y1, off = 0.008) { const m = mesh(vaDau(b0, b1, y0, y1, off, 4, 8), typeof mau === "number" ? vm(mau) : mau); nv.dau.add(m); return m; }
export function trumDau(nv, mau) { // mặt nạ trùm kín đầu (người nhện)
  const m = mesh(geoDau(false), typeof mau === "number" ? vm(mau) : mau); m.scale.set(1.08, 1.06, 1.08); nv.dau.add(m); return m;
}
export const hinhCau = (mau, rx, ry, rz, x, y, z, seg = 8) => cau(typeof mau === "number" ? vm(mau) : mau, rx, ry, rz, x, y, z, seg);
export const hinhOng = (mau, r1, r2, L, x = 0, y = 0, z = 0, seg = 8) => mesh(ong(r1, r2, L, seg, 1), typeof mau === "number" ? vm(mau) : mau, x, y, z);
export { vm as vlMuot };
// tấm vải dẹt bo tròn (áo choàng): treo ở mép trên (y = 0), rủ xuống -y
export function tamVai(mau, rong, dai, day = 0.02) {
  return mesh(nho(`tamVai${rong},${dai},${day}`, () => loft([[0.005, rong * 0.42, day * 0.5, 0], [0, rong * 0.45, day, 0], [-dai * 0.5, rong * 0.5, day, -0.01], [-dai, rong * 0.56, day, -0.02], [-dai - 0.005, rong * 0.5, day * 0.5, -0.02]], 12)), typeof mau === "number" ? vm(mau) : mau);
}
