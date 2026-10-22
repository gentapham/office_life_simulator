// Gộp khối để giảm số lần vẽ: mọi khối màu trơn được "nướng" màu vào đỉnh rồi gộp chung một vật liệu;
// khối có ảnh (mặt, biển hiệu, họa tiết) gộp theo từng vật liệu. Vật liệu đánh dấu userData.dong (đổi màu lúc chạy) giữ riêng.
// Khi gộp cả bản đồ (deQuy), các ảnh tĩnh nhỏ (biển hiệu, bạt, bảng tên...) còn được xếp chung vào vài tấm ảnh lớn
// (atlas) để cả trăm biển hiệu chỉ tốn vài lượt vẽ; máy yếu thì atlas vẽ ở nửa độ phân giải cho nhẹ bộ nhớ.
import * as THREE from "three";
import { mergeGeometries } from "three/addons/utils/BufferGeometryUtils.js";
import { cheDoNhe } from "../cai-dat.js";
import { MUC, vatLieuBe, mauDinhBe, ganUvBe } from "./vat-lieu.js";

export const VL_MAU_DINH = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true });
export const VL_MAU_DINH_2MAT = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true, side: THREE.DoubleSide });

const nuongDuoc = m => !m.map && !m.userData.dong && !m.transparent && !m.vertexColors && (m.isMeshLambertMaterial || m.isMeshBasicMaterial);

function chuanBi(o, matTran, mau, giuMau = false) {
  const g = (o.geometry.index ? o.geometry.toNonIndexed() : o.geometry.clone()).applyMatrix4(matTran);
  for (const k of Object.keys(g.attributes)) if (!["position", "normal", "uv", ...(giuMau ? ["color"] : [])].includes(k)) g.deleteAttribute(k);
  for (const k of Object.keys(g.morphAttributes)) delete g.morphAttributes[k];
  if (giuMau) { if (!g.attributes.uv) g.setAttribute("uv", new THREE.Float32BufferAttribute(new Float32Array(g.attributes.position.count * 2), 2)); g.groups = []; return g; }
  if (!g.attributes.normal) g.computeVertexNormals();
  if (!g.attributes.uv) g.setAttribute("uv", new THREE.Float32BufferAttribute(new Float32Array(g.attributes.position.count * 2), 2));
  const n = g.attributes.position.count, c = new Float32Array(n * 3);
  const col = mau || new THREE.Color(1, 1, 1);
  for (let i = 0; i < n; i++) { c[i * 3] = col.r; c[i * 3 + 1] = col.g; c[i * 3 + 2] = col.b; }
  g.setAttribute("color", new THREE.BufferAttribute(c, 3));
  g.groups = [];
  return g;
}

// Khối nhiều vật liệu (nhà hộp: bốn mặt tường + mái): gom các mặt cùng vật liệu thành một nhóm để mỗi vật liệu chỉ một lượt vẽ
export function gonNhomVatLieu(m) {
  const mats = m.material, geo = m.geometry;
  if (!Array.isArray(mats) || geo.groups.length < 2) return;
  const dau = new Map();
  for (const gr of geo.groups) { const v = mats[gr.materialIndex]; if (v && !dau.has(v)) dau.set(v, gr.materialIndex); }
  if (dau.size >= geo.groups.length) return;
  const g2 = geo.clone(), n = g2.index ? g2.index.count : g2.attributes.position.count;
  const nguon = g2.index ? g2.index.array : null, moi = [], nhom = [];
  for (const [v, mi] of dau) {
    const s = moi.length;
    for (const gr of geo.groups) if (mats[gr.materialIndex] === v) for (let i = gr.start, het = Math.min(n, gr.start + gr.count); i < het; i++) moi.push(nguon ? nguon[i] : i);
    nhom.push([s, moi.length - s, mi]);
  }
  g2.setIndex(moi); g2.clearGroups(); for (const [s, c, mi] of nhom) g2.addGroup(s, c, mi);
  m.geometry = g2;
}

// ---------- Atlas cho ảnh tĩnh ----------
const KHAC_ANH = ["emissiveMap", "alphaMap", "lightMap", "aoMap", "envMap", "specularMap", "bumpMap", "normalMap", "displacementMap"];
function atlasDuoc(m) {
  if (!(m.isMeshBasicMaterial || m.isMeshLambertMaterial) || m.userData.dong || m.vertexColors || m.transparent) return false;
  if (KHAC_ANH.some(k => m[k])) return false;
  if (m.isMeshLambertMaterial && (m.emissive.r || m.emissive.g || m.emissive.b)) return false;
  const t = m.map;
  if (!t || !t.isTexture || t.isVideoTexture || t.isDataTexture || t.isCompressedTexture || t.userData.dong) return false;
  const im = t.image;
  if (!im || !(typeof HTMLCanvasElement !== "undefined" && im instanceof HTMLCanvasElement)) return false;
  if (im.width < 2 || im.height < 2 || im.width > 1024 || im.height > 1024) return false;
  if (t.wrapS !== THREE.ClampToEdgeWrapping || t.wrapT !== THREE.ClampToEdgeWrapping) return false;
  if (t.repeat.x !== 1 || t.repeat.y !== 1 || t.offset.x || t.offset.y || t.rotation || !t.matrixAutoUpdate) return false;
  return true;
}
const khoaTrang = t => [t.colorSpace, t.magFilter, t.minFilter].join("|");
const khoaVL = (m, t) => [m.type, m.side, m.fog, m.toneMapped, m.alphaTest, m.depthWrite, m.depthTest, m.polygonOffset, m.polygonOffsetFactor, m.polygonOffsetUnits,
  m.flatShading, m.blending, m.colorWrite, m.premultipliedAlpha, m.visible, m.opacity, khoaTrang(t)].join("|");
function uvTrongKhung(g) {
  const a = g.attributes.uv.array;
  for (let i = 0; i < a.length; i++) if (a[i] < -0.002 || a[i] > 1.002) return false;
  return true;
}
const RONG = 2048, DEM = 4;
// xếp các ảnh vào trang atlas theo từng kệ (cao trước, thấp sau); trả về vị trí từng ảnh
function xepAtlas(dsAnh, tiLe) {
  const theoTrang = new Map(), viTri = new Map();
  for (const t of dsAnh) { const k = khoaTrang(t); if (!theoTrang.has(k)) theoTrang.set(k, []); theoTrang.get(k).push(t); }
  for (const ds of theoTrang.values()) {
    // ảnh rộng đúng nửa trang (biển hiệu 1024 px) thu lại vài px cho vừa hai ảnh một hàng kể cả viền đệm
    const kt = t => {
      const w = t.image.width * tiLe, h = t.image.height * tiLe, nua = RONG / 2 - DEM * 2;
      const k = w > nua && w <= RONG / 2 + 1 ? nua / w : 1;
      return [Math.max(2, Math.round(w * k)), Math.max(2, Math.round(h * k))];
    };
    ds.sort((a, b) => kt(b)[1] - kt(a)[1] || kt(b)[0] - kt(a)[0]);
    const trang = []; let cur = null, x = 0, y = 0, cao = 0;
    const moi = () => { cur = { ds: [], cao: 0 }; trang.push(cur); x = 0; y = 0; cao = 0; };
    moi();
    for (const t of ds) {
      const [w, h] = kt(t), W = w + DEM * 2, H = h + DEM * 2;
      if (x + W > RONG) { y += cao; x = 0; cao = 0; }
      if (y + H > RONG) moi();
      cur.ds.push({ t, x: x + DEM, y: y + DEM, w, h }); x += W; cao = Math.max(cao, H); cur.cao = Math.max(cur.cao, y + H);
    }
    for (const tr of trang) {
      if (!tr.ds.length) continue;
      const c = document.createElement("canvas"); c.width = RONG; c.height = Math.max(4, Math.ceil(tr.cao / 4) * 4);
      const g = c.getContext("2d"); g.imageSmoothingEnabled = true; g.imageSmoothingQuality = "high";
      for (const { t, x, y, w, h } of tr.ds) {
        const im = t.image, iw = im.width, ih = im.height;
        g.drawImage(im, x, y, w, h);
        // kéo dài mép ảnh ra viền đệm để lọc mipmap không lem màu ảnh bên cạnh
        g.drawImage(im, 0, 0, 1, ih, x - DEM, y, DEM, h); g.drawImage(im, iw - 1, 0, 1, ih, x + w, y, DEM, h);
        g.drawImage(im, 0, 0, iw, 1, x, y - DEM, w, DEM); g.drawImage(im, 0, ih - 1, iw, 1, x, y + h, w, DEM);
        g.drawImage(im, 0, 0, 1, 1, x - DEM, y - DEM, DEM, DEM); g.drawImage(im, iw - 1, 0, 1, 1, x + w, y - DEM, DEM, DEM);
        g.drawImage(im, 0, ih - 1, 1, 1, x - DEM, y + h, DEM, DEM); g.drawImage(im, iw - 1, ih - 1, 1, 1, x + w, y + h, DEM, DEM);
      }
      const t0 = tr.ds[0].t, tex = new THREE.CanvasTexture(c);
      tex.colorSpace = t0.colorSpace; tex.magFilter = t0.magFilter; tex.minFilter = t0.minFilter;
      tex.anisotropy = Math.max(...tr.ds.map(e => e.t.anisotropy || 1));
      for (const e of tr.ds) viTri.set(e.t, { ...e, tex, W: c.width, H: c.height });
    }
  }
  return viTri;
}

// deQuy: gộp cả khối nằm trong nhóm con (dùng cho bản đồ); không thì chỉ gộp con trực tiếp (dùng cho tay, chân nhân vật)
// atlas: (mặc định bật khi deQuy) xếp ảnh tĩnh nhỏ vào atlas chung
// vatLieu: khối màu trơn chưa gắn loại mặt cũng chuyển sang vật liệu PBR "tron" (nhà cửa, phố; không dùng cho nhân vật).
// Khối gắn loại mặt (userData.be của khối hoặc vật liệu, xem vat-lieu.js) luôn gộp vào vật liệu chung của loại mặt đó,
// trừ ở máy yếu (MUC = 0): khi đó mọi thứ nướng màu như cũ.
export function gopKhoi(nhom, { deQuy = false, atlas = deQuy, vatLieu = false } = {}) {
  nhom.updateMatrixWorld(true);
  const nghich = new THREE.Matrix4().copy(nhom.matrixWorld).invert();
  const nuong = [], nuong2 = [], theoVL = new Map(), bo = [], choAtlas = [];
  const xet = o => {
    if (deQuy && o.isMesh && Array.isArray(o.material)) gonNhomVatLieu(o);
    if (!o.isMesh || o.userData.rieng || o.isInstancedMesh || o.isSkinnedMesh || Array.isArray(o.material)) return;
    let an = false; for (let p = o; p && p !== nhom; p = p.parent) if (!p.visible) an = true;
    bo.push(o);
    if (an) return;
    const tran = new THREE.Matrix4().multiplyMatrices(nghich, o.matrixWorld);
    const m = o.material;
    const veBe = (vl, g) => { if (!theoVL.has(vl)) theoVL.set(vl, []); theoVL.get(vl).push(g); };
    // khối đã gộp vào vật liệu loại mặt từ trước: giữ màu và toạ độ ảnh, gộp tiếp
    if (m.userData.beThuVien && o.geometry.attributes.color) { veBe(m, chuanBi(o, tran, null, true)); return; }
    // khối không ảnh gắn loại mặt (kể cả vật liệu Basic như đèn xe), hoặc khối Lambert trơn khi bật vatLieu
    const ten = MUC ? (o.userData.be || m.userData.be || (vatLieu && m.isMeshLambertMaterial ? "tron" : null)) : null;
    // khối đã gộp từ trước (màu nằm sẵn trong đỉnh): giữ nguyên màu, gộp tiếp
    if (m.vertexColors && !m.map && !m.transparent && o.geometry.attributes.color) {
      if (ten && m === VL_MAU_DINH || ten && m === VL_MAU_DINH_2MAT) veBe(vatLieuBe(ten, m.side === THREE.DoubleSide), ganUvBe(chuanBi(o, tran, null, true), ten));
      else (m.side === THREE.DoubleSide ? nuong2 : nuong).push(chuanBi(o, tran, null, true));
    }
    else if (ten && nuongDuoc(m)) veBe(vatLieuBe(ten, m.side === THREE.DoubleSide), ganUvBe(chuanBi(o, tran, mauDinhBe(ten, m.color)), ten));
    else if (nuongDuoc(m)) (m.side === THREE.DoubleSide ? nuong2 : nuong).push(chuanBi(o, tran, m.color));
    else if (atlas && atlasDuoc(m)) {
      const g = chuanBi(o, tran, m.color);
      if (uvTrongKhung(g)) { choAtlas.push({ g, m }); return; }
      g.deleteAttribute("color");
      if (!theoVL.has(m)) theoVL.set(m, []); theoVL.get(m).push(g);
    } else {
      const g = chuanBi(o, tran, null); g.deleteAttribute("color");
      if (!theoVL.has(m)) theoVL.set(m, []); theoVL.get(m).push(g);
    }
  };
  if (deQuy) nhom.traverse(o => { if (o !== nhom) xet(o); });
  else for (const o of [...nhom.children]) if (!o.children.length) xet(o);
  for (const o of bo) o.parent?.remove(o);
  // đã có vật liệu bảng (kim loại, nhựa, sơn bóng...) trong lần gộp này: khối màu trơn còn lại vào luôn ô "tron"
  // của nó (vd. người ngồi trên xe máy) để không tốn thêm một lượt vẽ
  if (MUC) for (const [ds, hai] of [[nuong, false], [nuong2, true]]) {
    const vb = vatLieuBe("tron", hai);
    if (!ds.length || !theoVL.has(vb)) continue;
    for (const g of ds) theoVL.get(vb).push(ganUvBe(g, "tron"));
    ds.length = 0;
  }
  if (nuong.length) nhom.add(new THREE.Mesh(mergeGeometries(nuong), VL_MAU_DINH));
  if (nuong2.length) nhom.add(new THREE.Mesh(mergeGeometries(nuong2), VL_MAU_DINH_2MAT));
  for (const [m, ds] of theoVL) nhom.add(new THREE.Mesh(mergeGeometries(ds), m));
  if (choAtlas.length) {
    const viTri = xepAtlas([...new Set(choAtlas.map(c => c.m.map))], cheDoNhe() ? 0.5 : 1);
    const theoKhoa = new Map();
    for (const { g, m } of choAtlas) {
      const t = m.map, v = viTri.get(t), uv = g.attributes.uv.array;
      for (let i = 0; i < uv.length; i += 2) {
        const u = uv[i], w = uv[i + 1], hang = t.flipY ? 1 - w : w;
        uv[i] = (v.x + u * v.w) / v.W; uv[i + 1] = 1 - (v.y + hang * v.h) / v.H;
      }
      const k = khoaVL(m, t) + "|" + v.tex.uuid;
      if (!theoKhoa.has(k)) theoKhoa.set(k, { m, tex: v.tex, ds: [] });
      theoKhoa.get(k).ds.push(g);
    }
    for (const { m, tex, ds } of theoKhoa.values()) {
      const vl = m.clone(); vl.map = tex; vl.color.set(0xffffff); vl.vertexColors = true; vl.userData = {};
      nhom.add(new THREE.Mesh(mergeGeometries(ds), vl));
    }
  }
  return nhom;
}
