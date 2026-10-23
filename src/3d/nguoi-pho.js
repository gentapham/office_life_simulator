// Người đi đường làm việc thật: cầm ô, mặc áo mưa, nghe điện thoại, chụp ảnh tự sướng, dắt chó, chạy bộ buổi sáng,
// học sinh tan trường, cô lao công quét đường, áo mưa cánh dơi trên xe máy. Đồ dùng chung vật liệu để đỡ tốn lượt vẽ.
import * as THREE from "three";
import { vl, taoNguoi, hinhNguoiNgauNhien, kieuMoi } from "./nhan-vat-3d.js";
import { vongEo, danThan, matThanNv, vongDau, hinhCau, muotHoa, diemDau, taiY } from "./hinh-nguoi.js";

const TAY = 0.645; // chiều dài cánh tay (vai tới lòng bàn tay)
const hop = (w, h, d, mat, x = 0, y = 0, z = 0) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mat === "number" ? vl(mat) : mat); m.position.set(x, y, z); return m; };
const _a = new THREE.Vector3(), _b = new THREE.Vector3(), _len = new THREE.Vector3(0, 1, 0);
// thanh nối hai điểm (cán ô, dây dắt chó, cán chổi)
function thanh(p, q, day, mat) {
  _a.set(...p); _b.set(...q);
  const d = _b.clone().sub(_a), l = d.length();
  const m = new THREE.Mesh(new THREE.BoxGeometry(day, l, day), typeof mat === "number" ? vl(mat) : mat);
  m.position.copy(_a).addScaledVector(d, 0.5); m.quaternion.setFromUnitVectors(_len, d.normalize());
  return m;
}

// Chỉ cánh tay tới một điểm (toạ độ của nhóm nhân vật). Tay ngắn lại khi điểm gần vai (giả khuỷu tay gập).
export function chiTay(tay, x, y, z, { co = true } = {}) {
  const v = new THREE.Vector3(x, y, z).sub(tay.position);
  const l = v.length(); v.divideScalar(l || 1);
  const r = Math.hypot(v.y, v.z);
  tay.userData.coDinh = true;
  tay.rotation.set(Math.atan2(v.z, v.y), 0, Math.atan2(v.x, -r));
  tay.scale.y = co ? THREE.MathUtils.clamp(l / TAY, 0.45, 1) : 1;
}
export function thaTay(tay) { tay.userData.coDinh = false; tay.scale.y = 1; tay.rotation.set(0, 0, 0); }
// điểm bàn tay khi duỗi theo một hướng
const banTay = (tay, hx, hy, hz) => { const n = new THREE.Vector3(hx, hy, hz).normalize().multiplyScalar(TAY); return tay.position.clone().add(n); };

// ---------- Ô (dù) ----------
const MAU_O = [0x1c1c1f, 0x23406f, 0xc0262d, 0xf26fa6, 0x2e8b57, 0x7b4bb3, 0xe9e04a, 0xb8c6d6];
const vlO = MAU_O.map(c => vl(c, { side: THREE.DoubleSide }));
const GEO_NON_O = new THREE.ConeGeometry(0.64, 0.3, 8, 1, true);
const GEO_MU_MUA = new THREE.SphereGeometry(0.255, 10, 6, Math.PI / 2 + 0.95, Math.PI * 2 - 1.9, 0, Math.PI * 0.62);
export function themO(nv, rnd) {
  const g = new THREE.Group(); g.visible = false; nv.group.add(g);
  const tay = nv.tayP, ben = tay.position.x > 0 ? 1 : -1;
  const h = banTay(tay, -0.4 * ben, -0.62, 0.66);
  const dinh = nv.dau.position.y + 0.42;
  const tam = [0.02, dinh, 0.1];
  const can = thanh([h.x, h.y - 0.05, h.z], tam, 0.025, 0x3a3a3a); g.add(can);
  const non = new THREE.Mesh(GEO_NON_O, vlO[Math.floor(rnd() * vlO.length)]);
  non.position.set(tam[0], dinh - 0.04, tam[2]); g.add(non);
  const dinhO = hop(0.03, 0.12, 0.03, 0x3a3a3a, tam[0], dinh + 0.15, tam[2]); g.add(dinhO);
  return {
    g, can, non, dinh: dinhO, // các phần để giao-thong vẽ chung (InstancedMesh)
    cam(bat) {
      g.visible = bat;
      if (bat) chiTay(tay, h.x, h.y, h.z, { co: false }); else thaTay(tay);
    },
  };
}

// ---------- Áo mưa (áo choàng nilon có mũ trùm) ----------
const MAU_AO_MUA = [0x3f7fd0, 0xf27fb0, 0xf2d23a, 0x3fb07a, 0x8a5ad0, 0xe8702a];
const vlAoMua = MAU_AO_MUA.map(c => vl(c, { side: THREE.DoubleSide, transparent: true, opacity: 0.86 }));
// nilon ướt (người kiểu mới): mượt, hơi bóng, hơi trong
const vlNilon = new Map();
const nilon = c => {
  if (!vlNilon.has(c)) vlNilon.set(c, new THREE.MeshPhongMaterial({ color: c, side: THREE.DoubleSide, transparent: true, opacity: 0.84, shininess: 70, specular: 0x4a4a4a }));
  return vlNilon.get(c);
};
const PI = Math.PI;
// Lưới tấm nilon: R hàng (trên xuống) x C cột quanh trục đứng (cột j ứng với góc b = -PI + 2PI j / C; b = 0 phía trước +z,
// b = PI/2 bên phải +x; cột cuối trùng cột đầu). diem(i, j) -> [x, y, z]; bo(i, j): bỏ ô giữa hàng i, i+1 và cột j, j+1
// (khoét chỗ hở mặt của mũ trùm)
function luoiNilon(R, C, diem, bo = null) {
  const pos = [], uv = [], idx = [], W = C + 1;
  for (let i = 0; i < R; i++) for (let j = 0; j <= C; j++) { pos.push(...diem(i, j)); uv.push(j / C, 1 - i / (R - 1)); }
  for (let i = 0; i < R - 1; i++) for (let j = 0; j < C; j++) {
    if (bo && bo(i, j)) continue;
    const a = i * W + j, b = a + 1, c = a + W, d = c + 1;
    idx.push(a, c, b, b, c, d);
  }
  const g = new THREE.BufferGeometry();
  g.setAttribute("position", new THREE.Float32BufferAttribute(pos, 3));
  g.setAttribute("uv", new THREE.Float32BufferAttribute(uv, 2));
  g.setIndex(idx);
  return muotHoa(g);
}
const gocCot = (j, C) => -PI + 2 * PI * j / C;
// trọng số trước / hai bên / sau theo góc b (cộng lại bằng 1, đổi mượt)
const trongSo = b => { const c = Math.cos(b), s = Math.sin(b); return [Math.max(0, c) ** 2, s * s, Math.max(0, -c) ** 2]; };
// vòng nilon [y, bán kính trước, hai bên, sau, tâm z] -> điểm ở góc b
function diemVong([y, rF, rS, rB, zc], b) {
  const [wf, ws, wb] = trongSo(b), r = rF * wf + rS * ws + rB * wb;
  return [Math.sin(b) * r, y, zc + Math.cos(b) * r];
}
// nội suy mượt (Catmull-Rom) giữa các vòng của bảng theo chỉ số u (0 .. số vòng - 1)
function vongTai(bang, u) {
  const n = bang.length - 1, i = Math.min(n - 1, Math.max(0, Math.floor(u))), t = Math.min(1, Math.max(0, u - i));
  const p0 = bang[Math.max(0, i - 1)], p1 = bang[i], p2 = bang[i + 1], p3 = bang[Math.min(n, i + 2)];
  return p1.map((_, k) => 0.5 * (2 * p1[k] + (p2[k] - p0[k]) * t + (2 * p0[k] - 5 * p1[k] + 4 * p2[k] - p3[k]) * t * t + (3 * p1[k] - p0[k] - 3 * p2[k] + p3[k]) * t * t * t));
}
// chỉ số u ứng với độ cao y (bảng xếp từ trên xuống)
function uTaiY(bang, y) {
  let a = 0, b = bang.length - 1;
  if (y <= bang[b][0]) return b;
  for (let k = 0; k < 30; k++) { const m = (a + b) / 2; if (vongTai(bang, m)[0] > y) a = m; else b = m; }
  return (a + b) / 2;
}
// Áo mưa trùm theo bảng vòng: mũ trùm (từ đỉnh tới vòng cổ uCo, mỗi nửa vòng bảng một hàng) có chỗ hở mặt ở phía trước
// (|b| < moB, độ cao trong khoảng mo); dưới cổ là thân áo buông tới gấu, gấu cao thấp theo góc (gau(b) -> y).
function aoTheoBang(bang, uCo, gau, mo, { C = 28, RT = 10, moB = 1.0 } = {}) {
  const RH = Math.round(uCo * 2) + 1, R = RH + RT;
  const uCot = []; for (let j = 0; j <= C; j++) uCot.push(uTaiY(bang, gau(gocCot(j, C))));
  const uHang = (i, j) => i < RH ? i * 0.5 : uCo + (uCot[j] - uCo) * (i - RH + 1) / RT;
  const yHang = []; for (let i = 0; i < RH; i++) yHang.push(vongTai(bang, i * 0.5)[0]);
  const trongMo = y => y >= mo[0] && y <= mo[1];
  return luoiNilon(R, C, (i, j) => diemVong(vongTai(bang, uHang(i, j)), gocCot(j, C)),
    (i, j) => i + 1 < RH && trongMo(yHang[i]) && trongMo(yHang[i + 1]) && Math.abs(gocCot(j + 0.5, C)) < moB);
}

// Mũ trùm của áo mưa đi bộ (gắn vào đầu, toạ độ đầu): rộng hơn đầu một lớp tóc, phồng ở sau đỉnh đầu cho búi / đuôi tóc,
// hở mặt từ trán xuống cằm, mép dưới ôm quanh cằm và gáy (chui vào cổ áo choàng)
let geoMuTrum = null;
function muTrum() {
  if (geoMuTrum) return geoMuTrum;
  const C = 24, R = 12, t1 = 0.8 * PI, tMo = 0.26 * PI; // mép trên chỗ hở ngang chân tóc trên trán
  const off = (b, t) => 0.042 + 0.012 * t / t1 + 0.07 * trongSo(b)[2] * Math.exp(-(((t - 0.22 * PI) / (0.2 * PI)) ** 2)) + 0.02 * trongSo(b)[1] * Math.exp(-(((t - 0.45 * PI) / (0.2 * PI)) ** 2));
  const tHang = i => t1 * i / (R - 1);
  geoMuTrum = luoiNilon(R, C, (i, j) => { const b = gocCot(j, C), t = Math.max(0.02, tHang(i)); return diemDau(t, b, off(b, t)); },
    (i, j) => tHang(i + 1) > tMo && Math.abs(gocCot(j + 0.5, C)) < 1.05);
  return geoMuTrum;
}
// Thân áo choàng đi bộ: tính theo dáng thân từng người (nam / nữ / mập), rộng đủ chứa hai cánh tay (lúc mặc áo mưa
// tay vung nhỏ lại, xem giao-thong.js), học sinh đeo cặp thì phần lưng phồng ra; gấu ngang gối.
const geoChoang = new Map();
function thanChoang(rows, balo) {
  const key = JSON.stringify(rows) + balo;
  if (geoChoang.has(key)) return geoChoang.get(key);
  const tay = taiY(rows, 1.42)[1] + 0.022 + 0.066; // mép ngoài cánh tay (vai + bắp tay to nhất)
  const vong = y => {
    const [, rx, rz, z] = taiY(rows, Math.min(y, 1.5)), xoe = Math.max(0, 1.44 - y), cap = balo ? 0.13 * Math.exp(-(((y - 1.17) / 0.22) ** 2)) : 0;
    if (y > 1.6) return [y, 0.12, 0.14, 0.14, -0.012];
    if (y > 1.53) return [y, 0.15, 0.2, 0.17, -0.01];
    if (y > 1.47) return [y, rz + z + 0.07, Math.max(rx + 0.06, tay - 0.02), rz - z + 0.08 + cap, 0];
    return [y, rz + z + 0.08 + 0.2 * xoe, tay + 0.035 + 0.13 * xoe, rz - z + 0.09 + 0.15 * xoe + cap, 0];
  };
  const bang = [1.63, 1.565, 1.5, 1.44, 1.34, 1.2, 1.04, 0.88, 0.72, 0.58, 0.5].map(vong);
  const g = aoTheoBang(bang, 0, b => { const [wf, ws, wb] = trongSo(b); return 0.58 * wf + 0.57 * ws + 0.55 * wb; }, [9, 9], { C: 24, RT: 12 });
  geoChoang.set(key, g);
  return g;
}
export function themAoMua(nv, rnd, { balo = false } = {}) {
  const mau = MAU_AO_MUA[Math.floor(rnd() * MAU_AO_MUA.length)];
  const g = new THREE.Group(); g.visible = false; nv.group.add(g);
  if (nv.thanHinh) { // người kiểu mới: áo choàng nilon ôm theo dáng người, mũ trùm vừa đầu
    const m = nilon(mau);
    const than = new THREE.Mesh(thanChoang(nv.thanHinh, balo), m); g.add(than);
    const mu = new THREE.Mesh(muTrum(), m); mu.visible = false; nv.dau.add(mu);
    return { g, than, mu, mac(bat) { g.visible = bat; mu.visible = bat; } };
  }
  // người khối hộp (mức "Thấp"): giữ áo nón cụt như cũ
  const m = vlAoMua[MAU_AO_MUA.indexOf(mau)];
  const vai = nv.tayP.position.y, co = vai + 0.14;
  const than = new THREE.Mesh(new THREE.CylinderGeometry(0.2, 0.44, co - 0.5, 10, 1, true), m); than.position.y = (co + 0.5) / 2; than.userData.onCu = true; g.add(than);
  const mu = new THREE.Mesh(GEO_MU_MUA, m);
  mu.position.set(0, 0.02, -0.01); mu.visible = false; nv.dau.add(mu);
  return { g, than, mu, mac(bat) { g.visible = bat; mu.visible = bat; } };
}

// ---------- Điện thoại: áp tai / giơ lên chụp ảnh ----------
const vlDT = vl(0x16171b), vlManHinh = new THREE.MeshBasicMaterial({ color: 0x9fd3ff });
export function themDienThoai(nv) {
  const tai = hop(0.025, 0.14, 0.07, vlDT, 0.175 * Math.sign(nv.tayP.position.x || 1), -0.03, 0.03); tai.visible = false; nv.dau.add(tai);
  const tay = nv.tayP, ben = Math.sign(tay.position.x || 1);
  const chup = new THREE.Group(); chup.visible = false; nv.group.add(chup);
  const h = banTay(tay, -0.25 * ben, 0.62, 0.75);
  chup.add(hop(0.075, 0.14, 0.015, vlDT, 0, 0, 0)); const mh = hop(0.06, 0.11, 0.003, vlManHinh, 0, 0, -0.009); chup.add(mh);
  chup.position.set(h.x, h.y + 0.04, h.z + 0.03); chup.rotation.x = 0.35;
  const dau = nv.dau.position;
  return {
    nghe(bat) { tai.visible = bat; if (bat) chiTay(tay, 0.15 * ben, dau.y - 0.06, 0.06); else thaTay(tay); },
    chup(bat) { chup.visible = bat; if (bat) chiTay(tay, h.x, h.y, h.z, { co: false }); else thaTay(tay); },
  };
}

// ---------- Túi đồ vừa mua (bịch ni lông) ----------
const vlTui = [vl(0xf6f6f2), vl(0xd8302a), vl(0x2a5aa8)];
export function themTui(nv, rnd) {
  const t = new THREE.Group(); t.visible = false;
  t.add(hop(0.16, 0.2, 0.1, vlTui[Math.floor(rnd() * 3)], 0, -0.8, 0.04), hop(0.012, 0.1, 0.012, vlTui[0], 0, -0.66, 0.04));
  nv.tayT.add(t); return t;
}

// ---------- Người dắt chó đi dạo ----------
export function taoNguoiDatCho(rnd) {
  const nv = taoNguoi(null, hinhNguoiNgauNhien(rnd));
  const cho = taoNguoi(null, { cho: true });
  const s = 0.7 + rnd() * 0.2;
  cho.group.scale.setScalar(s); cho.group.position.set(-0.55, 0, 0.95); nv.group.add(cho.group);
  const tay = nv.tayT, ben = Math.sign(tay.position.x || -1);
  const h = banTay(tay, 0.15 * -ben, -0.82, 0.55);
  chiTay(tay, h.x, h.y, h.z, { co: false });
  const vong = [-0.55, 0.55 * s + 0.0, 0.95 + 0.27 * s];
  const giua = [(h.x + vong[0]) / 2, (h.y + vong[1]) / 2 - 0.12, (h.z + vong[2]) / 2];
  nv.group.add(thanh([h.x, h.y - 0.04, h.z], giua, 0.015, 0xc0262d), thanh(giua, vong, 0.015, 0xc0262d));
  return {
    ...nv, cho,
    hoatDong(t, dangDi, toc = 1) { nv.hoatDong(t, dangDi, toc); cho.hoatDong(t * 1.3, dangDi); cho.group.position.y = dangDi ? Math.abs(Math.sin(t * 11)) * 0.03 : 0; },
  };
}

// ---------- Người chạy bộ buổi sáng ----------
export function taoNguoiChayBo(rnd) {
  const nu = rnd() < 0.45;
  const nh = hinhNguoiNgauNhien(rnd, { nu });
  nh.ao = { kieu: "thun", mau: [0xff4fa3, 0x3fe07a, 0xffe14d, 0x3fa8ff, 0xf6f6f2, 0xe8702a][Math.floor(rnd() * 6)] };
  nh.quan = { kieu: "short", mau: [0x1c1c1f, 0x2a2c31, 0x23406f][Math.floor(rnd() * 3)] };
  nh.giay = ["sneaker", rnd() < 0.5 ? 0xf2f2f2 : 0x3fa8ff]; nh.pk = rnd() < 0.4 ? ["taiNgheCo"] : []; nh.beo = false;
  const nv = taoNguoi(null, nh);
  if (nv.thanHinh) vongDau(nv, nh.ao.mau, 0.09, 0.02); else nv.dau.add(hop(0.32, 0.05, 0.32, nh.ao.mau, 0, 0.09, 0)); // băng đô thấm mồ hôi
  nv.group.rotation.order = "YXZ";
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) {
      nv.hoatDong(t, dangDi, toc * 1.55);
      nv.group.rotation.x = dangDi ? 0.1 : 0;
      if (dangDi) { const goc = Math.sin(t * 8 * toc * 1.55); nv.tayT.rotation.x = -goc * 0.9 - 0.5; nv.tayP.rotation.x = goc * 0.9 - 0.5; }
    },
  };
}

// ---------- Học sinh tiểu học tan trường: áo trắng, quần xanh, khăn quàng đỏ, cặp sau lưng ----------
const MAU_CAP = [0xf26fa6, 0x3fa8ff, 0xe8702a, 0x3fe07a, 0x7b4bb3, 0xffe14d];
export function taoHocSinh(rnd) {
  const nu = rnd() < 0.5;
  const nh = hinhNguoiNgauNhien(rnd, { nu });
  nh.ao = { kieu: "somi", mau: 0xf6f6f2, trong: 0xf6f6f2 }; nh.quan = { kieu: "short", mau: 0x23406f };
  nh.giay = ["sneaker", 0xf2f2f2]; nh.pk = []; nh.beo = false; nh.cao = false; nh.nho = false; nh.gay = false;
  const nv = taoNguoi(null, nh);
  const yc = nv.dau.position.y;
  const mauCap = MAU_CAP[Math.floor(rnd() * MAU_CAP.length)];
  if (nv.thanHinh) { // khăn quàng đỏ (tam giác buông trước ngực), cặp tròn cạnh đeo sau lưng
    danThan(nv, 0xd8202a, yc - 0.24, yc - 0.42, (y, f) => [-0.06 * (1 - f) - 0.004, 0.06 * (1 - f) + 0.004], 0.008);
    nv.than.add(hinhCau(0xd8202a, 0.075, 0.02, 0.06, 0, yc - 0.235, 0.0));
    const z = matThanNv(nv, 0, yc - 0.55, -1);
    nv.than.add(hinhCau(mauCap, 0.17, 0.2, 0.085, 0, yc - 0.56, z - 0.07, 10));
    for (const x of [-0.1, 0.1]) nv.than.add(hinhCau(toiMauCap(mauCap), 0.018, 0.17, 0.018, x, yc - 0.45, matThanNv(nv, x, yc - 0.45) + 0.004));
  } else {
  nv.group.add(hop(0.12, 0.16, 0.02, 0xd8202a, 0, yc - 0.33, 0.14));        // khăn quàng đỏ
  nv.group.add(hop(0.32, 0.38, 0.16, mauCap, 0, yc - 0.6, -0.22)); // cặp
  }
  nv.group.scale.setScalar(0.6 + rnd() * 0.06);
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) { nv.hoatDong(t, dangDi, toc * 1.25); if (!dangDi) nv.dau.rotation.y = Math.sin(t * 1.3) * 0.4; },
  };
}

const toiMauCap = c => { const m = new THREE.Color(c); m.multiplyScalar(0.7); return m.getHex(); };
// ---------- Cô lao công quét đường: áo cam phản quang, nón lá, chổi tre, xe rác đẩy tay ----------
export function taoLaoCong(rnd) {
  const nh = hinhNguoiNgauNhien(rnd, { nu: true });
  nh.ao = { kieu: "khoac", mau: 0xe8702a, khoac: 0xe8702a }; nh.quan = { kieu: "tay", mau: 0x2e6b3a };
  nh.giay = ["tay", 0x1c1c1f]; nh.pk = ["nonLa", "khauTrangVai"]; nh.mauKhauTrang = 0x3a4250; nh.beo = false;
  const nv = taoNguoi(null, nh);
  const vai = nv.tayP.position.y;
  for (const y of [vai - 0.18, vai - 0.38]) if (!vongEo(nv, 0xe8e8d8, y, 0.045, 0.012)) nv.group.add(hop(0.47, 0.045, 0.3, 0xe8e8d8, 0, y, 0)); // dải phản quang
  // chổi tre cán dài: nhóm quay quanh tay cầm
  const choi = new THREE.Group(); choi.position.set(0.12, vai - 0.42, 0.42); nv.group.add(choi);
  choi.add(thanh([0, 0, 0], [0.32, -0.95, 0.42], 0.035, 0xc8a86a));
  const bo = new THREE.Mesh(new THREE.ConeGeometry(0.22, 0.45, 6, 1, true), vl(0xa8884a, { side: THREE.DoubleSide })); bo.position.set(0.38, -1.02, 0.5); bo.rotation.set(Math.PI - 0.5, 0, -0.3); bo.scale.z = 0.35; choi.add(bo);
  chiTay(nv.tayP, 0.12, vai - 0.42, 0.42); chiTay(nv.tayT, 0.05, vai - 0.25, 0.32);
  // xe rác đẩy tay đi trước
  const xe = new THREE.Group(); xe.position.set(0.0, 0, 1.25); nv.group.add(xe);
  xe.add(hop(0.62, 0.62, 0.95, 0xe8b830, 0, 0.62, 0), hop(0.64, 0.05, 0.97, 0xc89a20, 0, 0.95, 0), hop(0.56, 0.08, 0.86, 0x3a3a3a, 0, 0.93, 0));
  for (const s of [-1, 1]) { const b = new THREE.Mesh(new THREE.CylinderGeometry(0.26, 0.26, 0.06, 10), vl(0x1a1a1a)); b.rotation.z = Math.PI / 2; b.position.set(s * 0.36, 0.26, -0.1); xe.add(b); }
  xe.add(thanh([-0.25, 0.85, -0.47], [-0.2, 1.0, -0.82], 0.03, 0x5a5a5a), thanh([0.25, 0.85, -0.47], [0.2, 1.0, -0.82], 0.03, 0x5a5a5a), hop(0.44, 0.03, 0.03, 0x5a5a5a, 0, 1.0, -0.82));
  xe.add(hop(0.62, 0.06, 0.02, 0xe8e8d8, 0, 0.7, 0.48));
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) {
      nv.hoatDong(t, dangDi, toc * 0.6);
      choi.rotation.y = Math.sin(t * 2.4) * 0.45; choi.rotation.z = Math.sin(t * 2.4 + 1) * 0.08;
      nv.tayP.rotation.y = choi.rotation.y * 0.5;
      nv.dau.rotation.x = 0.25;
    },
  };
}

// ---------- Áo mưa cánh dơi trùm cả người lái và đầu xe ----------
// Bản cũ (mức "Thấp"): hai nón cụt
const GEO_AO_XE = [new THREE.CylinderGeometry(0.17, 0.52, 0.72, 10, 1, true), new THREE.CylinderGeometry(0.16, 0.44, 0.62, 8, 1, true)];
const vlAoXe = MAU_AO_MUA.map(c => vl(c, { side: THREE.DoubleSide, transparent: true, opacity: 0.88 }));
// Bản mới (toạ độ xe, đầu xe +z): người lái ngồi neo (0; 0,86; −0,18), tâm đầu ~ (0; 1,70; −0,08), vai y 1,41, hai tay
// nắm tay lái ở (±0,27; 1,15; 0,38). Áo mưa cánh dơi: mũ trùm lên mũ bảo hiểm (hở mặt), vạt choàng qua vai và hai cánh
// tay ra tới tay lái (hai bàn tay thò ra ở mép vạt, chỗ gấu khoét lên), vạt trước buông trùm đầu xe tới ngang bánh trước
// (sau đèn pha), hai bên phủ qua đùi, vạt sau phủ xuống yên. Có người ngồi sau: vạt sau người lái ngắn lại, người ngồi
// sau mặc áo thứ hai có mũ trùm riêng, vạt trước chui vào trong áo người lái (như áo mưa đôi), vạt sau phủ yên sau.
// Mỗi bảng: [y, bán kính trước, hai bên, sau, tâm z]
const BANG_LAI = (sauNgan) => [
  [1.965, 0.0, 0.0, 0.0, -0.1], [1.935, 0.11, 0.12, 0.13, -0.1], [1.87, 0.19, 0.21, 0.22, -0.095], [1.78, 0.215, 0.235, 0.245, -0.09],
  [1.67, 0.215, 0.235, 0.245, -0.085], [1.57, 0.2, 0.22, 0.23, -0.09], [1.49, 0.2, 0.26, 0.21, -0.1],
  [1.4, 0.26, 0.335, sauNgan ? 0.2 : 0.22, -0.1], [1.28, 0.42, 0.42, sauNgan ? 0.215 : 0.24, -0.09], [1.16, 0.57, 0.45, sauNgan ? 0.22 : 0.26, -0.07],
  [1.02, 0.66, 0.45, sauNgan ? 0.225 : 0.29, -0.06], [0.86, 0.7, 0.44, 0.33, -0.06], [0.66, 0.72, 0.43, 0.37, -0.06]];
const BANG_SAU = [
  [2.005, 0.0, 0.0, 0.0, -0.545], [1.975, 0.11, 0.12, 0.13, -0.545], [1.91, 0.19, 0.21, 0.22, -0.54], [1.82, 0.215, 0.235, 0.245, -0.535],
  [1.71, 0.215, 0.235, 0.245, -0.53], [1.61, 0.2, 0.22, 0.23, -0.535], [1.53, 0.2, 0.26, 0.21, -0.545],
  [1.44, 0.25, 0.34, 0.23, -0.54], [1.32, 0.31, 0.39, 0.26, -0.53], [1.18, 0.35, 0.41, 0.29, -0.52], [1.02, 0.37, 0.41, 0.31, -0.52], [0.86, 0.37, 0.41, 0.33, -0.52]];
let geoAoXe = null;
function aoXeMoi() {
  if (geoAoXe) return geoAoXe;
  const gauLai = (sau, khoet) => b => {
    const [wf, ws, wb] = trongSo(b);
    const y = 0.7 * wf + 0.74 * ws + sau * wb;
    return y + (khoet - y) * Math.exp(-(((Math.abs(b) - 0.56) / 0.17) ** 2)); // khoét lên chỗ hai bàn tay nắm tay lái
  };
  geoAoXe = {
    lai: aoTheoBang(BANG_LAI(false), 6, gauLai(0.9, 1.13), [1.545, 1.86]),
    laiDoi: aoTheoBang(BANG_LAI(true), 6, gauLai(1.02, 1.13), [1.545, 1.86]),
    sau: aoTheoBang(BANG_SAU, 6, b => { const [wf, ws, wb] = trongSo(b); return 0.97 * wf + 0.8 * ws + 0.93 * wb; }, [1.585, 1.9]),
  };
  return geoAoXe;
}
const MAU_AO_XE_OM = 0x2e9a4a; // xe ôm công nghệ: áo mưa xanh lá như áo khoác
export function aoMuaXeMay(rnd, coSau, { xeOm = false } = {}) {
  const g = new THREE.Group(); g.visible = false;
  const k = Math.floor(rnd() * vlAoXe.length);
  if (kieuMoi()) {
    const m = nilon(xeOm ? MAU_AO_XE_OM : MAU_AO_MUA[k]), geo = aoXeMoi();
    g.add(new THREE.Mesh(coSau ? geo.laiDoi : geo.lai, m));
    if (coSau) g.add(new THREE.Mesh(geo.sau, m));
    return g;
  }
  const m = vlAoXe[k];
  const a = new THREE.Mesh(GEO_AO_XE[0], m); a.position.set(0, 1.2, -0.02); a.scale.z = 1.55; a.rotation.x = 0.12; g.add(a);
  if (coSau) { const b = new THREE.Mesh(GEO_AO_XE[1], m); b.position.set(0, 1.22, -0.62); b.scale.z = 1.3; g.add(b); }
  return g;
}
