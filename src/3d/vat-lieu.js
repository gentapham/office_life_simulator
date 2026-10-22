// Thư viện vật liệu cho nhà cửa, đường phố, nội thất theo kiểu tranh vẽ: mỗi loại mặt (tường sơn, gạch, gạch men, gỗ,
// nhựa đường...) là MỘT vật liệu Lambert dùng chung, màu phẳng (màu từng khối nướng vào đỉnh như cũ) nhân với một ảnh
// "nét cọ" vẽ bằng code rất nhạt: vệt loang của lớp sơn, mạch vữa / ron gạch, ván sàn, sóng tôn... chỉ đủ gợi chất liệu,
// không có ảnh chụp, không pháp tuyến, không phản xạ. Ánh sáng 3 nấc mềm và bóng ngả lạnh do to-mau.js lo cho mọi vật liệu.
// Khối cùng loại mặt gộp chung một lượt vẽ dù khác màu. Toạ độ ảnh tính theo mét thật lúc gộp (chiếu hộp theo pháp tuyến)
// để viên gạch, tấm ván đúng cỡ ở mọi nơi. Các mặt không ảnh (kim loại, crôm, kính, cao su, nhựa, sơn trơn) dùng chung
// một vật liệu màu đỉnh.
// Mức chất lượng: Thấp (máy yếu) = giữ nguyên kiểu cũ (Lambert, không ảnh, nướng màu); Vừa / Cao = thư viện này.
import * as THREE from "three";
import { caiDat, cheDoNhe } from "../cai-dat.js";

// 0: không dùng (máy yếu), 1: Vừa, 2: Cao. Kiểm thử so sánh: localStorage owfad_vat_lieu = "tat" để tắt hẳn.
const TAT = (() => { try { return localStorage.getItem("owfad_vat_lieu") === "tat"; } catch { return false; } })();
export const MUC = TAT || cheDoNhe() ? 0 : caiDat().chatLuong === "vua" ? 1 : 2;

// m: số mét một lần lặp ảnh; ve: kiểu nét vẽ (xem veAnh); mau: ảnh có màu riêng (màu đỉnh / màu vật liệu để trắng);
// diu: [màu, t] kéo màu vật liệu riêng (vlRieng) về một tông dịu của tranh
const BE = {
  son:        { m: 2.4, ve: "son" },      // tường sơn nước trong nhà
  vua:        { m: 1.6, ve: "vua" },      // tường vữa ngoài trời
  gach:       { m: 1.0, ve: "gach" },     // gạch thẻ
  gach_men:   { m: 1.2, ve: "men" },      // gạch men 60x60
  gach_vs:    { m: 1.6, ve: "cheo" },     // gạch nhà vệ sinh (lát chéo)
  go_san:     { m: 1.7, ve: "van" },      // sàn gỗ
  nhua_duong: { m: 4.0, ve: "duong", diu: [0xa4aab2, 0.74] }, // nhựa đường: xám xanh nhạt như tranh
  be_tong:    { m: 2.5, ve: "loang" },    // bê tông trơn
  lat_san:    { m: 1.8, ve: "tam" },      // sân lát tấm bê tông
  gach_via:   { m: 1.6, ve: "via", mau: true }, // gạch lát vỉa hè đỏ-trắng
  ngoi:       { m: 2.0, ve: "ngoi" },     // ngói đất nung
  ton:        { m: 1.1, ve: "ton" },      // mái tôn sóng
  vai:        { m: 0.5, ve: "min" },      // vải bọc ghế, sofa
  da:         { m: 0.6, ve: "min" },      // da bọc
  go:         { m: 1.2, ve: "tho" },      // gỗ nội thất
  tham:       { m: 0.6, ve: "min" },      // thảm
};
// các mặt trơn (không ảnh) dùng chung một vật liệu; toạ độ ảnh vẫn chọn "ô" như trước để dữ liệu cũ không đổi
const BANG = ["tron", "son_bong", "nhua", "kim", "crom", "cao_su", "kinh", "son_xe"];
export const LOAI_MAT = [...Object.keys(BE), ...BANG];
const SAN = new Set(["gach_men", "gach_vs", "go_san", "nhua_duong", "be_tong", "lat_san", "gach_via", "tham"]);
const laBang = ten => BANG.includes(ten);

// ---------- Ảnh nét cọ (vẽ bằng code, liền mép khi lặp) ----------
const KT = 256;
function ngauNhien(seed) { let s = seed >>> 0 || 1; return () => (s = Math.imul(s ^ (s >>> 15), 2246822519) + 0x9e3779b9 >>> 0, (s >>> 8) / 16777216); }
// nhiễu giá trị tuần hoàn: lưới n x n, nội suy mượt, lặp khít ở mép
function nhieu(n, rnd) {
  const g = new Float32Array(n * n); for (let i = 0; i < g.length; i++) g[i] = rnd() * 2 - 1;
  const s = t => t * t * (3 - 2 * t);
  return (x, y) => {
    const fx = x * n, fy = y * n, x0 = Math.floor(fx), y0 = Math.floor(fy), tx = s(fx - x0), ty = s(fy - y0);
    const a = (i, j) => g[((j % n + n) % n) * n + ((i % n + n) % n)];
    const p = a(x0, y0) + (a(x0 + 1, y0) - a(x0, y0)) * tx, q = a(x0, y0 + 1) + (a(x0 + 1, y0 + 1) - a(x0, y0 + 1)) * tx;
    return p + (q - p) * ty;
  };
}
const fr = v => v - Math.floor(v);
// mạch (ron) giữa các ô: 1 ở giữa mạch, 0 trong ô; w: nửa bề rộng mạch theo phần ô
const mach = (v, w) => { const d = Math.min(fr(v), 1 - fr(v)); return d < w ? 1 - d / w : 0; };
const hash2 = (i, j, k = 0) => fr(Math.sin(i * 127.1 + j * 311.7 + k * 74.7) * 43758.5453);

// trả về hàm (x, y) -> [hệ số sáng tuyến tính] hoặc [r, g, b] (ảnh màu)
function kieuVe(ve, rnd) {
  const loang = nhieu(4, rnd), loang2 = nhieu(8, rnd), min = nhieu(32, rnd), soi = nhieu(64, rnd);
  const coVet = (x, y, k) => 1 + k * (loang(x, y) * 0.65 + loang2(x, y) * 0.35);
  switch (ve) {
    case "son": return (x, y) => coVet(x, y, 0.035);
    case "vua": return (x, y) => coVet(x, y, 0.05) + min(x, y) * 0.018;
    case "loang": return (x, y) => coVet(x, y, 0.05) + min(x, y) * 0.012;
    case "min": return (x, y) => coVet(x, y, 0.02) + soi(x, y) * 0.025;
    case "duong": return (x, y) => coVet(x, y, 0.04) + soi(x, y) * 0.022 + (soi(y * 2.3, x * 2.3) > 0.82 ? 0.05 : 0);
    case "gach": return (x, y) => { // 12 hàng gạch, 4 viên một hàng, so le
      const h = Math.floor(y * 12), u = x * 4 + (h % 2) * 0.5;
      return coVet(x, y, 0.03) + (hash2(Math.floor(u) % 4, h) - 0.5) * 0.07 + Math.max(mach(y * 12, 0.09), mach(u, 0.025)) * 0.07;
    };
    case "men": return (x, y) => coVet(x, y, 0.025) - Math.max(mach(x * 2, 0.008), mach(y * 2, 0.008)) * 0.07;
    case "cheo": return (x, y) => { const u = (x + y) * 2, v = (x - y) * 2; return coVet(x, y, 0.025) - Math.max(mach(u, 0.012), mach(v, 0.012)) * 0.06; };
    case "tam": return (x, y) => coVet(x, y, 0.04) + min(x, y) * 0.012 - Math.max(mach(x * 3, 0.012), mach(y * 3, 0.012)) * 0.08;
    case "van": return (x, y) => { // 8 tấm ván dọc theo y, nối so le
      const c = Math.floor(x * 8), noi = hash2(c, 3), v = y * 2 + noi;
      return 1 + (hash2(c, Math.floor(v)) - 0.5) * 0.08 + soi(x * 0.25, y * 2) * 0.012 + min(x * 4, y * 0.25) * 0.025
        - Math.max(mach(x * 8, 0.04), mach(v, 0.004)) * 0.07;
    };
    case "tho": return (x, y) => coVet(x, y, 0.02) + min(x * 4, y * 0.2) * 0.035;
    case "ngoi": return (x, y) => { // 8 hàng ngói, mỗi hàng tối dần về mép dưới
      const h = y * 8, t = fr(h), c = x * 6 + (Math.floor(h) % 2) * 0.5;
      return coVet(x, y, 0.03) + (hash2(Math.floor(c) % 6, Math.floor(h)) - 0.5) * 0.05 - t * t * 0.07 - mach(c, 0.03) * 0.04;
    };
    case "ton": return (x, y) => coVet(x, y, 0.03) + Math.sin(x * Math.PI * 2 * 12) * 0.045;
    case "via": { // ô cờ đỏ-kem 40 cm (mỗi ô 4 viên nhỏ), màu dịu
      const do_ = [0.62, 0.32, 0.25], kem = [0.83, 0.77, 0.68];
      return (x, y) => {
        const o = (Math.floor(x * 4) + Math.floor(y * 4)) % 2 ? do_ : kem;
        const k = coVet(x, y, 0.03) - Math.max(mach(x * 4, 0.02), mach(y * 4, 0.02)) * 0.1 - Math.max(mach(x * 8, 0.012), mach(y * 8, 0.012)) * 0.04;
        return [o[0] * k, o[1] * k, o[2] * k];
      };
    }
    default: return () => 1;
  }
}
const l2s = v => { v = Math.max(0, Math.min(1, v)); return v <= 0.0031308 ? v * 12.92 : 1.055 * Math.pow(v, 1 / 2.4) - 0.055; };
// vẽ ảnh; trả về { tex, tb } (tb: trung bình tuyến tính, để nhân bù trong shader cho màu trung bình đúng màu đỉnh)
function veAnh(ten) {
  const def = BE[ten], f = kieuVe(def.ve, ngauNhien(ten.length * 7919 + ten.charCodeAt(0) * 131));
  const c = document.createElement("canvas"); c.width = c.height = KT;
  const g = c.getContext("2d"), im = g.createImageData(KT, KT), d = im.data;
  const vals = new Float32Array(KT * KT * 3);
  let max = 0;
  for (let j = 0; j < KT; j++) for (let i = 0; i < KT; i++) {
    const v = f((i + 0.5) / KT, (j + 0.5) / KT), k = (j * KT + i) * 3;
    if (Array.isArray(v)) { vals[k] = v[0]; vals[k + 1] = v[1]; vals[k + 2] = v[2]; } else vals[k] = vals[k + 1] = vals[k + 2] = v;
    max = Math.max(max, vals[k], vals[k + 1], vals[k + 2]);
  }
  const chia = def.mau ? 1 : max; // ảnh xám: đưa đỉnh sáng nhất về 1
  let tong = 0;
  for (let p = 0; p < KT * KT; p++) for (let q = 0; q < 3; q++) {
    const v = vals[p * 3 + q] / chia; tong += v;
    d[p * 4 + q] = Math.round(l2s(v) * 255);
  }
  for (let p = 0; p < KT * KT; p++) d[p * 4 + 3] = 255;
  g.putImageData(im, 0, 0);
  const tex = new THREE.CanvasTexture(c);
  tex.colorSpace = THREE.SRGBColorSpace; tex.wrapS = tex.wrapT = THREE.RepeatWrapping; tex.anisotropy = 4;
  return { tex, tb: tong / (KT * KT * 3) };
}
const anh = new Map();
function layAnh(ten) { if (!anh.has(ten)) anh.set(ten, veAnh(ten)); return anh.get(ten); }

// nhân bù trung bình ảnh xám trong shader (không đổi m.color vì bầu trời chép lại màu gốc mỗi khung hình khi mưa)
function heSoXam(m, he) {
  const u = m.userData.heXam = { value: he };
  m.onBeforeCompile = sh => {
    sh.uniforms.heXam = u;
    sh.fragmentShader = "uniform float heXam;\n" + sh.fragmentShader.replace("#include <map_fragment>", "#include <map_fragment>\n\tdiffuseColor.rgb *= heXam;");
  };
  return u;
}
function ganAnh(m, ten) {
  const def = BE[ten], { tex, tb } = layAnh(ten);
  m.map = tex; heSoXam(m, def.mau ? 1 : 1 / tb);
  return m;
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
  m = new THREE.MeshLambertMaterial({ vertexColors: true, flatShading: true });
  if (laBang(ten)) m.userData.beThuVien = "#bang";
  else { m.userData.beThuVien = ten; ganAnh(m, ten); }
  if (haiMat) m.side = THREE.DoubleSide;
  if (them) Object.assign(m, them);
  chung.set(khoa, m);
  return m;
}
// vật liệu riêng (không gộp, màu đổi lúc chạy: mặt đường ướt khi mưa) nhưng dùng chung ảnh của loại mặt
export function vlRieng(ten, color, opts = {}) {
  if (!MUC) return new THREE.MeshLambertMaterial({ color, ...opts });
  const def = BE[ten];
  const m = new THREE.MeshLambertMaterial({ color, ...opts });
  if (def?.diu) m.color.lerp(new THREE.Color(def.diu[0]), def.diu[1]);
  m.userData.beRieng = ten;
  if (def) ganAnh(m, ten);
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

// màu đỉnh cho khối thuộc loại mặt: ảnh nét cọ là ảnh xám nên giữ nguyên màu của khối (vỉa hè: ảnh có màu riêng)
export function mauDinhBe(ten, mau) {
  if (!mau || !BE[ten]?.mau) return mau;
  return new THREE.Color(1, 1, 1);
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

// Vật liệu có ảnh riêng (mặt tiền vẽ sẵn cửa sổ, ảnh nền đất): kiểu tranh giữ nguyên ảnh vẽ tay của nó, không thêm
// ảnh pháp tuyến / độ nhám nữa. Giữ hai hàm để các file dựng cảnh gọi như cũ.
export function matTienPBR(goc) { return goc; }
export function themChiTiet(m) { return m; }
// biến thể của một vật liệu thư viện với thuộc tính thêm (vd. { fog: false } cho địa điểm trong nhà)
export function bienTheVL(m, them) {
  const t = m?.userData?.beThuVien;
  if (!t) return m;
  return vatLieuBe(t === "#bang" ? "tron" : t, m.side === THREE.DoubleSide, them);
}
