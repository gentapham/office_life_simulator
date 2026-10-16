// Tối ưu lượt vẽ (draw call) cho máy yếu / điện thoại:
// - gopNguoi: mỗi nhân vật (vốn ~12 khối: hai chân, thân, hai tay, đầu 6 mặt...) gộp thành MỘT khối có xương cứng
//   (SkinnedMesh, mỗi đỉnh bám đúng một "xương" là nhóm chân/tay/đầu cũ) nên vẫn cử động y như trước mà chỉ tốn 2-3 lượt vẽ.
//   Gộp trễ một khung hình để đồ gắn thêm sau khi tạo (nón, mặt nạ, băng đô...) cũng được gộp chung.
// - BoLap: đồ lặp lại nhiều lần (ô, áo mưa, ly trà đá...) vẽ bằng InstancedMesh: cả phố chung một lượt vẽ.
//   Khối gốc vẫn nằm nguyên chỗ cũ (code cũ vẫn bật/tắt, xoay nó như thường) nhưng không tự vẽ nữa.
// - caiToiUu: móc vào scene.onBeforeRender (sau khi ma trận đã cập nhật) để gộp nhân vật, cập nhật đồ lặp, tắt gương ở xa.
import * as THREE from "three";
import { mergeGeometries } from "three/addons/utils/BufferGeometryUtils.js";
import { VL_MAU_DINH, VL_MAU_DINH_2MAT } from "./gop-khoi.js";

// ---------- Nhân vật: gộp thành một khối xương cứng ----------
const hangDoi = [];
// gọi khi tạo xong nhân vật ({ group, ... }); trả lại chính nó
export function gopNguoi(o) { if (o?.group) hangDoi.push(o); return o; }
export function xuLyHangDoi(toiDa = 16) {
  for (let i = 0; i < toiDa && hangDoi.length; i++) { try { gopNguoiNgay(hangDoi.shift()); } catch (e) { console.warn("gopNguoi", e); } }
}

const nuongDuoc = m => !m.map && !m.userData.dong && !m.transparent && !m.vertexColors && (m.isMeshLambertMaterial || m.isMeshBasicMaterial);
const daNuong = m => m.vertexColors && !m.map && !m.transparent && (m.isMeshLambertMaterial || m.isMeshBasicMaterial);
const khongGop = m => !m || m.transparent || m.isShaderMaterial;
const _m = new THREE.Matrix4(), TRANG = { r: 1, g: 1, b: 1 };

// cắt một đoạn đỉnh [dau, dau+so) của khối không chỉ mục
function catDoan(g, dau, so) {
  const r = new THREE.BufferGeometry();
  for (const [k, a] of Object.entries(g.attributes)) r.setAttribute(k, new THREE.BufferAttribute(a.array.slice(dau * a.itemSize, (dau + so) * a.itemSize), a.itemSize));
  return r;
}
function chuan(g, mau, xuong) {
  for (const k of Object.keys(g.attributes)) if (!["position", "normal", "uv", "color"].includes(k)) g.deleteAttribute(k);
  const n = g.attributes.position.count;
  if (!g.attributes.normal) g.computeVertexNormals();
  if (!g.attributes.uv) g.setAttribute("uv", new THREE.BufferAttribute(new Float32Array(n * 2), 2));
  if (mau || !g.attributes.color) {
    const c = new Float32Array(n * 3), col = mau || { r: 1, g: 1, b: 1 };
    for (let i = 0; i < n; i++) { c[i * 3] = col.r; c[i * 3 + 1] = col.g; c[i * 3 + 2] = col.b; }
    g.setAttribute("color", new THREE.BufferAttribute(c, 3));
  }
  const si = new Uint16Array(n * 4), sw = new Float32Array(n * 4);
  for (let i = 0; i < n; i++) { si[i * 4] = xuong; sw[i * 4] = 1; }
  g.setAttribute("skinIndex", new THREE.Uint16BufferAttribute(si, 4));
  g.setAttribute("skinWeight", new THREE.BufferAttribute(sw, 4));
  g.groups = []; g.morphAttributes = {};
  return g;
}

function gopNguoiNgay(o) {
  const goc = o.group;
  if (!goc || goc.userData.daGopNguoi) return;
  goc.userData.daGopNguoi = true;
  goc.updateWorldMatrix(true, true);
  const nghich = goc.matrixWorld.clone().invert();
  const xuong = [], soXuong = new Map(), bo = [];
  const xo = new Map(); // vật liệu -> các mảnh; với khối nhiều vật liệu: mảng vật liệu -> (chỉ số -> các mảnh)
  const vao = (vl, g) => { if (!xo.has(vl)) xo.set(vl, []); xo.get(vl).push(g); };
  const vaoMang = (mang, i, g) => { if (!xo.has(mang)) xo.set(mang, new Map()); const l = xo.get(mang); if (!l.has(i)) l.set(i, []); l.get(i).push(g); };
  const duyet = cha => {
    for (const c of cha.children) {
      if (!c.visible) continue; // đồ đang ẩn (ô, điện thoại, ly...): để riêng, code cũ còn bật/tắt
      if (c.isMesh && !c.isSkinnedMesh && !c.isInstancedMesh && !c.children.length && !c.userData.rieng && c.renderOrder === 0 && c.layers.mask === 1 && c.geometry?.attributes.position) {
        const ms = Array.isArray(c.material) ? c.material : [c.material];
        if (!ms.some(khongGop)) {
          const b = c.parent;
          if (!soXuong.has(b)) { soXuong.set(b, xuong.length); xuong.push(b); }
          const ix = soXuong.get(b);
          const g0 = (c.geometry.index ? c.geometry.toNonIndexed() : c.geometry.clone()).applyMatrix4(_m.multiplyMatrices(nghich, c.matrixWorld));
          const nhom = Array.isArray(c.material) ? (g0.groups.length ? g0.groups : [{ start: 0, count: g0.attributes.position.count, materialIndex: 0 }]) : [null];
          for (const gr of nhom) {
            const m = gr ? c.material[gr.materialIndex] : c.material; if (!m) continue;
            const g = gr ? catDoan(g0, gr.start, Math.min(gr.count, g0.attributes.position.count - gr.start)) : g0;
            const vc = m.side === THREE.DoubleSide ? VL_MAU_DINH_2MAT : VL_MAU_DINH;
            if (daNuong(m) && g.attributes.color) vao(vc, chuan(g, null, ix));
            else if (nuongDuoc(m)) vao(vc, chuan(g, m.color, ix));
            else if (gr) vaoMang(c.material, gr.materialIndex, chuan(g, TRANG, ix));
            else vao(m, chuan(g, TRANG, ix));
          }
          bo.push(c);
          continue;
        }
      }
      if (!c.isSprite) duyet(c);
    }
  };
  duyet(goc);
  if (!bo.length) return;
  const dsHinh = [], vls = [];
  for (const [khoa, e] of xo) {
    if (e instanceof Map) { // khối nhiều vật liệu (mặt người đổi biểu cảm): lấy vật liệu tại chỗ mỗi lần vẽ
      for (const [i, ds] of e) {
        const ix = vls.length; vls.push(null); Object.defineProperty(vls, ix, { get: () => khoa[i], enumerable: true, configurable: true });
        dsHinh.push(mergeGeometries(ds));
      }
    } else { vls.push(khoa); dsHinh.push(mergeGeometries(e)); }
  }
  if (dsHinh.some(g => !g)) { console.warn("gopNguoi: không gộp được"); return; }
  const hinh = mergeGeometries(dsHinh, true);
  if (!hinh) return;
  for (const c of bo) c.parent.remove(c);
  const me = new THREE.SkinnedMesh(hinh, vls.length === 1 ? vls[0] : vls);
  goc.add(me); me.updateMatrixWorld(true);
  me.bind(new THREE.Skeleton(xuong));
  hinh.computeBoundingSphere();
  me.boundingSphere = hinh.boundingSphere.clone(); me.boundingSphere.radius += 0.6; // tay chân vung ra khi cử động
  me.userData.nguoiGop = true;
  o.khoiGop = me;
}

// ---------- Đồ lặp lại: một InstancedMesh cho cả phố ----------
export class BoLap {
  // hinh: khối mẫu; vl: vật liệu (màu trắng, màu từng cái lấy theo vật liệu của khối gốc); cha: nhóm chứa
  constructor(hinh, vl, cha) { this.hinh = hinh; this.vl = vl; this.cha = cha; this.ds = []; this.im = null; }
  // khối gốc giữ nguyên chỗ cũ nhưng không tự vẽ; phu: ma trận phụ (vd. co giãn chiều cao cán ô)
  them(mesh, phu = null) {
    if (!mesh) return;
    mesh.layers.disableAll();
    this.ds.push({ mesh, phu, mau: mesh.material?.color ? mesh.material.color.clone() : new THREE.Color(1, 1, 1) });
  }
  capNhat() {
    if (!this.ds.length) return;
    if (!this.im) {
      this.im = new THREE.InstancedMesh(this.hinh, this.vl, this.ds.length);
      this.im.frustumCulled = false; this.im.instanceMatrix.setUsage(THREE.DynamicDrawUsage); this.im.count = 0;
      this.cha.add(this.im); this.cha.updateMatrixWorld();
    }
    if (!this.cha.visible) return;
    const nghich = this._ng ||= new THREE.Matrix4(); nghich.copy(this.im.matrixWorld).invert();
    const dongNhat = this.im.matrixWorld.equals(_I);
    let n = 0;
    for (const d of this.ds) {
      let p = d.mesh, hien = true;
      for (; p.parent; p = p.parent) if (!p.visible) { hien = false; break; }
      if (!hien || !p.visible || !p.isScene) continue;
      _m.copy(d.mesh.matrixWorld); if (d.phu) _m.multiply(d.phu);
      if (!dongNhat) _m.premultiply(nghich);
      this.im.setMatrixAt(n, _m); this.im.setColorAt(n, d.mau); n++;
    }
    this.im.count = n;
    if (n) { this.im.instanceMatrix.needsUpdate = true; if (this.im.instanceColor) this.im.instanceColor.needsUpdate = true; }
  }
}
const _I = new THREE.Matrix4();

// ---------- Móc vào vòng vẽ ----------
export function caiToiUu(game) {
  const { scene, camera } = game;
  const guong = []; scene.traverse(o => { if (o.isReflector) guong.push(o); });
  const _p = new THREE.Vector3(), _g = new THREE.Vector3();
  const truoc = scene.onBeforeRender;
  scene.onBeforeRender = function (r, s, cam, rt) {
    truoc?.call(this, r, s, cam, rt);
    if (cam !== camera) return; // lượt vẽ phụ (phản chiếu gương)
    xuLyHangDoi(16);
    // gương thật vẽ lại cả cảnh: chỉ bật khi đứng gần (không thì tấm kính vẽ sẵn phía sau hiện ra)
    cam.getWorldPosition(_p);
    for (const gu of guong) { gu.getWorldPosition(_g); gu.visible = _p.distanceToSquared(_g) < 64 && Math.abs(_p.y - _g.y) < 2.5; }
    game.giaoThong?.capNhatLap?.();
  };
}
