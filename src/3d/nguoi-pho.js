// Người đi đường làm việc thật: cầm ô, mặc áo mưa, nghe điện thoại, chụp ảnh tự sướng, dắt chó, chạy bộ buổi sáng,
// học sinh tan trường, cô lao công quét đường, áo mưa cánh dơi trên xe máy. Đồ dùng chung vật liệu để đỡ tốn lượt vẽ.
import * as THREE from "three";
import { vl, taoNguoi, hinhNguoiNgauNhien } from "./nhan-vat-3d.js";

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
export function themAoMua(nv, rnd) {
  const m = vlAoMua[Math.floor(rnd() * vlAoMua.length)];
  const vai = nv.tayP.position.y, co = vai + 0.14;
  const g = new THREE.Group(); g.visible = false; nv.group.add(g);
  const than = new THREE.Mesh(new THREE.CylinderGeometry(0.2, 0.44, co - 0.5, 10, 1, true), m); than.position.y = (co + 0.5) / 2; g.add(than);
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
  nv.dau.add(hop(0.32, 0.05, 0.32, nh.ao.mau, 0, 0.09, 0)); // băng đô thấm mồ hôi
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
  nv.group.add(hop(0.12, 0.16, 0.02, 0xd8202a, 0, yc - 0.33, 0.14));        // khăn quàng đỏ
  nv.group.add(hop(0.32, 0.38, 0.16, MAU_CAP[Math.floor(rnd() * MAU_CAP.length)], 0, yc - 0.6, -0.22)); // cặp
  nv.group.scale.setScalar(0.6 + rnd() * 0.06);
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) { nv.hoatDong(t, dangDi, toc * 1.25); if (!dangDi) nv.dau.rotation.y = Math.sin(t * 1.3) * 0.4; },
  };
}

// ---------- Cô lao công quét đường: áo cam phản quang, nón lá, chổi tre, xe rác đẩy tay ----------
export function taoLaoCong(rnd) {
  const nh = hinhNguoiNgauNhien(rnd, { nu: true });
  nh.ao = { kieu: "khoac", mau: 0xe8702a, khoac: 0xe8702a }; nh.quan = { kieu: "tay", mau: 0x2e6b3a };
  nh.giay = ["tay", 0x1c1c1f]; nh.pk = ["nonLa", "khauTrangVai"]; nh.mauKhauTrang = 0x3a4250; nh.beo = false;
  const nv = taoNguoi(null, nh);
  const vai = nv.tayP.position.y;
  for (const y of [vai - 0.18, vai - 0.38]) nv.group.add(hop(0.47, 0.045, 0.3, 0xe8e8d8, 0, y, 0)); // dải phản quang
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
const GEO_AO_XE = [new THREE.CylinderGeometry(0.17, 0.52, 0.72, 10, 1, true), new THREE.CylinderGeometry(0.16, 0.44, 0.62, 8, 1, true)];
const vlAoXe = MAU_AO_MUA.map(c => vl(c, { side: THREE.DoubleSide, transparent: true, opacity: 0.88 }));
export function aoMuaXeMay(rnd, coSau) {
  const g = new THREE.Group(); g.visible = false;
  const m = vlAoXe[Math.floor(rnd() * vlAoXe.length)];
  const a = new THREE.Mesh(GEO_AO_XE[0], m); a.position.set(0, 1.2, -0.02); a.scale.z = 1.55; a.rotation.x = 0.12; g.add(a);
  if (coSau) { const b = new THREE.Mesh(GEO_AO_XE[1], m); b.position.set(0, 1.22, -0.62); b.scale.z = 1.3; g.add(b); }
  return g;
}
