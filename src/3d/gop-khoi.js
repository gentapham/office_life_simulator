// Gộp khối để giảm số lần vẽ: mọi khối màu trơn được "nướng" màu vào đỉnh rồi gộp chung một vật liệu;
// khối có ảnh (mặt, biển hiệu, họa tiết) gộp theo từng vật liệu. Vật liệu đánh dấu userData.dong (đổi màu lúc chạy) giữ riêng.
import * as THREE from "three";
import { mergeGeometries } from "three/addons/utils/BufferGeometryUtils.js";

export const VL_MAU_DINH = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true });
const VL_MAU_DINH_2MAT = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true, side: THREE.DoubleSide });

const nuongDuoc = m => !m.map && !m.userData.dong && !m.transparent && !m.vertexColors && (m.isMeshLambertMaterial || m.isMeshBasicMaterial);

function chuanBi(o, matTran, mau) {
  const g = (o.geometry.index ? o.geometry.toNonIndexed() : o.geometry.clone()).applyMatrix4(matTran);
  for (const k of Object.keys(g.attributes)) if (!["position", "normal", "uv"].includes(k)) g.deleteAttribute(k);
  if (!g.attributes.normal) g.computeVertexNormals();
  if (!g.attributes.uv) g.setAttribute("uv", new THREE.Float32BufferAttribute(new Float32Array(g.attributes.position.count * 2), 2));
  const n = g.attributes.position.count, c = new Float32Array(n * 3);
  const col = mau || new THREE.Color(1, 1, 1);
  for (let i = 0; i < n; i++) { c[i * 3] = col.r; c[i * 3 + 1] = col.g; c[i * 3 + 2] = col.b; }
  g.setAttribute("color", new THREE.BufferAttribute(c, 3));
  g.groups = [];
  return g;
}

// deQuy: gộp cả khối nằm trong nhóm con (dùng cho bản đồ); không thì chỉ gộp con trực tiếp (dùng cho tay, chân nhân vật)
export function gopKhoi(nhom, { deQuy = false } = {}) {
  nhom.updateMatrixWorld(true);
  const nghich = new THREE.Matrix4().copy(nhom.matrixWorld).invert();
  const nuong = [], nuong2 = [], theoVL = new Map(), bo = [];
  const xet = o => {
    if (!o.isMesh || o.userData.rieng || o.isInstancedMesh || Array.isArray(o.material)) return;
    let an = false; for (let p = o; p && p !== nhom; p = p.parent) if (!p.visible) an = true;
    bo.push(o);
    if (an) return;
    const tran = new THREE.Matrix4().multiplyMatrices(nghich, o.matrixWorld);
    const m = o.material;
    if (nuongDuoc(m)) (m.side === THREE.DoubleSide ? nuong2 : nuong).push(chuanBi(o, tran, m.color));
    else {
      const g = chuanBi(o, tran, null); g.deleteAttribute("color");
      if (!theoVL.has(m)) theoVL.set(m, []); theoVL.get(m).push(g);
    }
  };
  if (deQuy) nhom.traverse(o => { if (o !== nhom) xet(o); });
  else for (const o of [...nhom.children]) if (!o.children.length) xet(o);
  for (const o of bo) o.parent?.remove(o);
  if (nuong.length) nhom.add(new THREE.Mesh(mergeGeometries(nuong), VL_MAU_DINH));
  if (nuong2.length) nhom.add(new THREE.Mesh(mergeGeometries(nuong2), VL_MAU_DINH_2MAT));
  for (const [m, ds] of theoVL) nhom.add(new THREE.Mesh(mergeGeometries(ds), m));
  return nhom;
}
