// Thư viện vật liệu "giống thật" cho nhà cửa, đường phố, nội thất: mỗi loại mặt (tường sơn, gạch, gạch men, gỗ, nhựa đường...)
// là MỘT vật liệu PBR dùng chung (ảnh màu + pháp tuyến + độ nhám, nguồn CC0 Poly Haven, xem public/tex/NGUON.md).
// Màu từng khối vẫn nướng vào đỉnh (vertexColors) như cũ: ảnh "chi tiết" xám nhân với màu đỉnh, nên khối cùng loại mặt
// gộp chung một lượt vẽ dù khác màu. Toạ độ ảnh tính theo mét thật lúc gộp (chiếu hộp theo pháp tuyến mặt) để viên gạch,
// tấm ván đúng cỡ ở mọi nơi. Các mặt không ảnh (kim loại, crôm, kính, cao su, nhựa, sơn trơn) dùng chung một vật liệu:
// độ nhám / độ kim loại lấy từ một ảnh bảng 8 ô, toạ độ ảnh của đỉnh chọn ô.
// Mức chất lượng: Thấp (máy yếu) = giữ nguyên kiểu cũ (Lambert, không ảnh); Vừa = ảnh 512, không ảnh độ nhám; Cao = ảnh 1k đủ bộ.
// Ảnh tải ngầm: game chạy ngay với màu trơn, ảnh về tới đâu vật liệu cập nhật tới đó.
import * as THREE from "three";
import { caiDat, cheDoNhe } from "../cai-dat.js";

// 0: không dùng (máy yếu), 1: ảnh 512, 2: ảnh 1k. Kiểm thử so sánh: localStorage owfad_vat_lieu = "tat" để tắt hẳn.
const TAT = (() => { try { return localStorage.getItem("owfad_vat_lieu") === "tat"; } catch { return false; } })();
export const MUC = TAT || cheDoNhe() ? 0 : caiDat().chatLuong === "vua" ? 1 : 2;

// m: số mét một lần lặp ảnh; xam: ảnh xám chi tiết (màu do đỉnh), không thì ảnh màu thật (ref: màu đối chiếu để
// khối sáng / tối hơn chỉnh độ sáng); nham: hệ số nhân ảnh độ nhám; n: độ mạnh pháp tuyến
const BE = {
  son:        { m: 2.4, xam: true, nham: 1, n: 0.5 },   // tường sơn nước trong nhà
  vua:        { m: 1.6, xam: true, nham: 1, n: 0.8 },   // tường vữa ngoài trời
  gach:       { m: 1.0, ref: 0x8a5040, nham: 1, n: 1 },  // gạch thẻ đỏ
  gach_men:   { m: 1.2, xam: true, nham: 1, n: 0.7 },   // gạch men 60x60
  gach_vs:    { m: 1.6, xam: true, nham: 1, n: 0.7 },   // gạch nhà vệ sinh (lát chéo)
  go_san:     { m: 1.7, xam: true, nham: 1, n: 0.6 },   // sàn gỗ
  nhua_duong: { m: 4.0, xam: true, nham: 1, n: 0.9 },   // nhựa đường
  be_tong:    { m: 2.5, xam: true, nham: 1, n: 0.6 },   // bê tông trơn
  lat_san:    { m: 1.8, xam: true, nham: 1, n: 0.8 },   // sân lát tấm bê tông
  gach_via:   { m: 1.6, ref: 0xffffff, nham: 1, n: 0.8 }, // gạch lát vỉa hè đỏ-trắng (ảnh thủ tục)
  ngoi:       { m: 2.0, ref: 0xa8503a, nham: 1, n: 1 },  // ngói đất nung
  ton:        { m: 1.1, xam: true, nham: 0.8, n: 1 },   // mái tôn sóng
  vai:        { m: 0.5, xam: true, nham: 1, n: 0.6 },   // vải bọc ghế, sofa
  da:         { m: 0.6, xam: true, nham: 0.75, n: 0.6 }, // da bọc
  go:         { m: 1.2, xam: true, nham: 0.85, n: 0.4 }, // gỗ nội thất
  tham:       { m: 0.6, xam: true, nham: 1, n: 0.7 },   // thảm
};
// bảng độ nhám / kim loại: ô 0 là mặc định (khối chưa gắn loại mặt)
const BANG = ["tron", "son_bong", "nhua", "kim", "crom", "cao_su", "kinh", "son_xe"];
const BANG_SO = { tron: [0.78, 0], son_bong: [0.4, 0], nhua: [0.5, 0], kim: [0.38, 0.85], crom: [0.16, 1], cao_su: [0.92, 0], kinh: [0.06, 0.1], son_xe: [0.3, 0.15] };
export const LOAI_MAT = [...Object.keys(BE), ...BANG];
const SAN = new Set(["gach_men", "gach_vs", "go_san", "nhua_duong", "be_tong", "lat_san", "gach_via", "tham"]);
const laBang = ten => BANG_SO[ten] != null;
const HE_XAM = 1 / 0.8; // ảnh xám có trung bình tuyến tính 0,8: nhân lại để trung bình đúng màu đỉnh

// ---------- Ảnh ----------
const GOC = `${import.meta.env.BASE_URL || "./"}tex/${MUC === 1 ? "512/" : ""}`;
const loader = new THREE.TextureLoader();
const anh = new Map();      // ten -> { c, n, r } (Texture, có thể chưa tải xong)
const choAnh = new Map();   // ten -> [hàm gọi lại khi có thêm ảnh]
const khiCoAnh = (ten, f) => { (choAnh.get(ten) || choAnh.set(ten, []).get(ten)).push(f); f(); };
function taiAnh(ten) {
  if (anh.has(ten)) return anh.get(ten);
  const def = BE[ten], bo = {};
  anh.set(ten, bo);
  const lay = (duoi, mau, xong) => {
    const t = loader.load(GOC + ten + duoi, () => { xong(t); }, undefined, () => {});
    t.wrapS = t.wrapT = THREE.RepeatWrapping; t.anisotropy = 8;
    if (mau) t.colorSpace = THREE.SRGBColorSpace;
    return t;
  };
  const gan = () => { for (const f of choAnh.get(ten) || []) f(); };
  lay("_c.jpg", true, t => { bo.c = t; gan(); });
  lay("_n.jpg", false, t => { bo.n = t; gan(); });
  if (MUC === 2) lay("_r.jpg", false, t => { bo.r = t; gan(); });
  return bo;
}
// ảnh xám (trung bình 0,8) nhân hệ số trong shader để màu trung bình đúng màu đỉnh / màu vật liệu.
// Không đổi m.color vì bầu trời chép lại màu gốc mỗi khung hình (mặt đường ướt khi mưa).
function heSoXam(m) {
  if (m.userData.heXam) return m.userData.heXam;
  const u = m.userData.heXam = { value: 1 };
  m.onBeforeCompile = sh => {
    sh.uniforms.heXam = u;
    sh.fragmentShader = "uniform float heXam;\n" + sh.fragmentShader.replace("#include <map_fragment>", "#include <map_fragment>\n\tdiffuseColor.rgb *= heXam;");
  };
  return u;
}
function apAnh(m, def, bo) {
  let doi = false;
  if (bo.c && m.map !== bo.c) { m.map = bo.c; heSoXam(m).value = def.xam ? HE_XAM : 1; doi = true; }
  if (bo.n && m.normalMap !== bo.n) { m.normalMap = bo.n; m.normalScale.set(def.n, def.n); doi = true; }
  if (bo.r && m.roughnessMap !== bo.r) { m.roughnessMap = bo.r; m.roughness = def.nham; doi = true; }
  if (doi) m.needsUpdate = true;
}

let _bang = null;
function anhBang() {
  if (_bang) return _bang;
  const d = new Uint8Array(BANG.length * 4);
  BANG.forEach((t, i) => { const [r, k] = BANG_SO[t]; d[i * 4] = 255; d[i * 4 + 1] = Math.round(r * 255); d[i * 4 + 2] = Math.round(k * 255); d[i * 4 + 3] = 255; });
  _bang = new THREE.DataTexture(d, BANG.length, 1, THREE.RGBAFormat);
  _bang.magFilter = _bang.minFilter = THREE.NearestFilter; _bang.generateMipmaps = false; _bang.needsUpdate = true;
  return _bang;
}

// ---------- Vật liệu dùng chung ----------
const chung = new Map();
// vật liệu dùng chung của một loại mặt (haiMat: hai mặt). Ô bảng (kim, kính...) dùng chung một vật liệu.
// them: thuộc tính thêm (vd. polygonOffset cho lớp sơn dán lên tường) — mỗi bộ thuộc tính là một vật liệu riêng
export function vatLieuBe(ten, haiMat = false, them = null) {
  if (!BE[ten] && !laBang(ten)) ten = "tron"; // nhãn lạ: dùng mặt trơn
  const khoa = (laBang(ten) ? "#bang" : ten) + (haiMat ? "|2" : "") + (them ? JSON.stringify(them) : "");
  let m = chung.get(khoa);
  if (m) return m;
  if (laBang(ten)) {
    const b = anhBang();
    m = new THREE.MeshStandardMaterial({ vertexColors: true, flatShading: true, roughness: 1, metalness: 1, roughnessMap: b, metalnessMap: b });
    m.userData.beThuVien = "#bang";
  } else {
    const def = BE[ten];
    m = new THREE.MeshStandardMaterial({ vertexColors: true, flatShading: true, roughness: def.nham, metalness: 0 });
    m.userData.beThuVien = ten; heSoXam(m);
    const bo = taiAnh(ten);
    khiCoAnh(ten, () => apAnh(m, def, bo));
  }
  if (haiMat) m.side = THREE.DoubleSide;
  if (them) Object.assign(m, them);
  chung.set(khoa, m);
  return m;
}
// vật liệu riêng (không gộp, màu đổi lúc chạy: mặt đường ướt khi mưa) nhưng dùng chung ảnh của loại mặt
export function vlRieng(ten, color, opts = {}) {
  if (!MUC) return new THREE.MeshLambertMaterial({ color, ...opts });
  const def = BE[ten];
  const m = new THREE.MeshStandardMaterial({ color, roughness: def.nham, metalness: 0, ...opts });
  const bo = taiAnh(ten);
  m.userData.beRieng = ten; heSoXam(m);
  khiCoAnh(ten, () => apAnh(m, def, bo));
  return m;
}

// vật liệu Lambert gắn nhãn loại mặt: khối dùng nó được gopKhoi xếp vào vật liệu chung của loại mặt đó
// (máy yếu: nướng màu như cũ). Dùng chung theo (loại mặt, màu).
const nhan = new Map();
export function vlBe(ten, color, opts = {}) {
  const khoa = ten + "|" + color + JSON.stringify(opts);
  let m = nhan.get(khoa);
  if (!m) { m = new THREE.MeshLambertMaterial({ color, flatShading: true, ...opts }); m.userData.be = ten; nhan.set(khoa, m); }
  return m;
}
// gắn loại mặt cho khối (hoặc mọi khối con trong nhóm); trả lại chính nó
export function be(o, ten) {
  if (!o) return o;
  if (o.isMesh) o.userData.be = ten;
  else o.traverse?.(c => { if (c.isMesh && !c.userData.be) c.userData.be = ten; });
  return o;
}

const _c = new THREE.Color();
// màu đỉnh cho khối thuộc loại mặt: ảnh màu thật thì chỉ lấy độ sáng tương đối so với màu đối chiếu
export function mauDinhBe(ten, mau) {
  const def = BE[ten];
  if (!def || def.xam || !mau) return mau;
  const lum = c => c.r * 0.2126 + c.g * 0.7152 + c.b * 0.0722;
  const k = Math.min(1.3, Math.max(0.55, lum(mau) / lum(_c.set(def.ref))));
  return new THREE.Color(k, k, k);
}

// Toạ độ ảnh theo mét: chiếu hộp theo pháp tuyến từng tam giác (khối không chỉ mục) hoặc từng đỉnh (có chỉ mục).
// Ô bảng: mọi đỉnh trỏ vào tâm ô của loại mặt.
export function ganUvBe(g, ten) {
  if (!BE[ten] && !laBang(ten)) ten = "tron";
  const pos = g.attributes.position, n = pos.count;
  let uv = g.attributes.uv;
  if (!uv || uv.count !== n || uv.itemSize !== 2) { uv = new THREE.Float32BufferAttribute(new Float32Array(n * 2), 2); g.setAttribute("uv", uv); }
  const a = uv.array;
  if (laBang(ten)) {
    const u = (BANG.indexOf(ten) + 0.5) / BANG.length;
    for (let i = 0; i < n; i++) { a[i * 2] = u; a[i * 2 + 1] = 0.5; }
    uv.needsUpdate = true; return g;
  }
  const k = 1 / (BE[ten]?.m || 2), p = pos.array, san = SAN.has(ten);
  const dat = (i, nx, ny, nz) => {
    const x = p[i * 3], y = p[i * 3 + 1], z = p[i * 3 + 2], ax = Math.abs(nx), ay = Math.abs(ny), az = Math.abs(nz);
    // mặt dưới của tấm sàn là trần tầng dưới: không lát gạch lên trần, lấy một điểm giữa viên (gần như màu trơn)
    if (san && ny < 0 && ay >= ax && ay >= az) { a[i * 2] = 0.27; a[i * 2 + 1] = 0.27; }
    else if (ay >= ax && ay >= az) { a[i * 2] = x * k; a[i * 2 + 1] = (ny > 0 ? -z : z) * k; }
    else if (ax >= az) { a[i * 2] = (nx > 0 ? -z : z) * k; a[i * 2 + 1] = y * k; }
    else { a[i * 2] = (nz > 0 ? x : -x) * k; a[i * 2 + 1] = y * k; }
  };
  if (!g.index) {
    for (let t = 0; t + 2 < n; t += 3) {
      const i0 = t * 3, i1 = i0 + 3, i2 = i0 + 6;
      const ux = p[i1] - p[i0], uy = p[i1 + 1] - p[i0 + 1], uz = p[i1 + 2] - p[i0 + 2];
      const vx = p[i2] - p[i0], vy = p[i2 + 1] - p[i0 + 1], vz = p[i2 + 2] - p[i0 + 2];
      const nx = uy * vz - uz * vy, ny = uz * vx - ux * vz, nz = ux * vy - uy * vx;
      dat(t, nx, ny, nz); dat(t + 1, nx, ny, nz); dat(t + 2, nx, ny, nz);
    }
  } else {
    const nm = g.attributes.normal?.array;
    for (let i = 0; i < n; i++) dat(i, nm ? nm[i * 3] : 0, nm ? nm[i * 3 + 1] : 1, nm ? nm[i * 3 + 2] : 0);
  }
  uv.needsUpdate = true;
  return g;
}
// gắn toạ độ ảnh theo mét cho một khối đã đặt vị trí (dùng cho khối không gộp: mặt đường, vỉa hè)
export function uvTheGioiKhoi(mesh, ten) {
  mesh.updateWorldMatrix(true, false);
  const g = mesh.geometry.clone().applyMatrix4(mesh.matrixWorld);
  ganUvBe(g, ten);
  mesh.geometry.setAttribute("uv", g.attributes.uv);
  return mesh;
}

// Vật liệu có ảnh riêng (mặt tiền vẽ sẵn cửa sổ, ảnh nền đất): đổi sang PBR, giữ ảnh màu / ảnh phát sáng ban đêm,
// thêm ảnh pháp tuyến (và độ nhám nếu nham) của một loại mặt, lặp lapX x lapY lần trên một đơn vị toạ độ ảnh.
// Máy yếu: trả lại vật liệu cũ.
export function matTienPBR(goc, ten, lapX, lapY, { nham = false, n = null, roughness = 0.88 } = {}) {
  if (!MUC) return goc;
  const m = new THREE.MeshStandardMaterial({ map: goc.map, emissiveMap: goc.emissiveMap || null, emissive: goc.emissive ? goc.emissive.clone() : 0, color: goc.color.clone(),
    vertexColors: goc.vertexColors, side: goc.side, transparent: goc.transparent, roughness, metalness: 0 });
  m.userData = { ...goc.userData };
  if (ten) themChiTiet(m, ten, lapX, lapY, { nham, n });
  return m;
}
export function themChiTiet(m, ten, lapX, lapY, { nham = false, n = null } = {}) {
  if (!MUC || !m.isMeshStandardMaterial) return m;
  const def = BE[ten], bo = taiAnh(ten);
  khiCoAnh(ten, () => {
    let doi = false;
    if (bo.n && !m.normalMap) { const t = bo.n.clone(); t.repeat.set(lapX, lapY); m.normalMap = t; const k = n ?? def.n; m.normalScale.set(k, k); doi = true; }
    if (nham && bo.r && !m.roughnessMap) { const t = bo.r.clone(); t.repeat.set(lapX, lapY); m.roughnessMap = t; m.roughness = 1; doi = true; }
    if (doi) m.needsUpdate = true;
  });
  return m;
}
// biến thể của một vật liệu thư viện với thuộc tính thêm (vd. { fog: false } cho địa điểm trong nhà)
export function bienTheVL(m, them) {
  const t = m?.userData?.beThuVien;
  if (!t) return m;
  return vatLieuBe(t === "#bang" ? "tron" : t, m.side === THREE.DoubleSide, them);
}
