// Nhân vật low-poly: người, Siêu Nhân Hồng, chó Tuất, đôi tay góc nhìn thứ nhất, bảng tên trên đầu.
// Ngoại hình theo docs/roles/ngoai-hinh.md (màu áo, kiểu tóc, phụ kiện chính).
import * as THREE from "three";

const DA = { sang: 0xf1c7a1, vua: 0xe0ac84, ngam: 0xc68e66 };

// kieuToc: ngan | dai | buoi | bob | troc | ngoi | xoan | mullet | undercut | buc | tem | bu
// phuKien: kinh | kinhRam | mu | muLen | muKepi | caVat | taiNghe | khauTrang
export const NGOAI_HINH = {
  ran_doc:          { da: DA.sang, ao: 0xf4f4f0, quan: 0x6d6f73, toc: 0x1e1a17, kieuToc: "ngoi", phuKien: [] },
  giam_doc:         { da: DA.vua,  ao: 0x22305a, quan: 0x22305a, toc: 0x16120f, kieuToc: "ngan", phuKien: ["caVat"], beo: true },
  truong_phong:     { da: DA.sang, ao: 0xd8c7a3, quan: 0xb39d72, toc: 0x16120f, kieuToc: "ngan", phuKien: ["kinh"], gay: true },
  thanh_ninh:       { da: DA.sang, ao: 0xf5b9cf, quan: 0xf5b9cf, toc: 0x2a1c14, kieuToc: "dai", phuKien: [], vay: true, nho: true },
  hong_hot:         { da: DA.vua,  ao: 0xe9e04a, quan: 0x4f6d9a, toc: 0x6b4429, kieuToc: "bob", phuKien: [] },
  con_ong_chau_cha: { da: DA.sang, ao: 0x111111, quan: 0xf2f2f2, toc: 0xe8e4d6, kieuToc: "undercut", phuKien: ["kinhRam", "taiNghe"], cao: true },
  chua_te_deadline: { da: DA.sang, ao: 0x8a8d92, quan: 0x5b5e63, toc: 0x1c1714, kieuToc: "bu", phuKien: [] },
  thuc_tap_sinh:    { da: DA.vua,  ao: 0x9cc3e6, quan: 0x2f3742, toc: 0x16120f, kieuToc: "ngoi", phuKien: [], cao: true },
  ke_toan:          { da: DA.sang, ao: 0x8a5a3c, quan: 0x3d2a1e, toc: 0x16120f, kieuToc: "buoi", phuKien: ["kinh"] },
  hr:               { da: DA.vua,  ao: 0xa8e6cf, quan: 0x3a4250, toc: 0x2a1c14, kieuToc: "ngoi", phuKien: [], beo: true },
  it:               { da: DA.sang, ao: 0x15161a, quan: 0x2a2c31, toc: 0x111111, kieuToc: "buc", phuKien: ["taiNghe"], gay: true },
  idol_het_thoi:    { da: DA.vua,  ao: 0x7b4bb3, quan: 0x2b2440, toc: 0x8a6a3a, kieuToc: "mullet", phuKien: ["kinhRam"] },
  quan_ly_idol:     { da: DA.vua,  ao: 0x1c1c1f, quan: 0x1c1c1f, toc: 0x55504a, kieuToc: "xoan", phuKien: ["taiNghe"], gay: true },
  bien_kich:        { da: DA.sang, ao: 0x2f6b3a, quan: 0x2f6b3a, toc: 0x16120f, kieuToc: "dai", phuKien: ["kinh"], vay: true },
  editor:           { da: DA.sang, ao: 0x1f2a3d, quan: 0x15161a, toc: 0x1c1714, kieuToc: "troc", phuKien: ["muLen", "taiNghe"], gay: true },
  designer:         { da: DA.vua,  ao: 0x2cb5a8, quan: 0x3f5f8f, toc: 0x1fb3a5, kieuToc: "bob", phuKien: [], cao: true },
  sales:            { da: DA.sang, ao: 0xd8262f, quan: 0xd8262f, toc: 0x2a1c14, kieuToc: "dai", phuKien: [], vay: true, nho: true },
  chi_dai:          { da: DA.ngam, ao: 0x7d1424, quan: 0x4b5130, toc: 0x111111, kieuToc: "tem", phuKien: [] },
  dan_dau_tu:       { da: DA.vua,  ao: 0xe8e8e2, quan: 0x3a3d44, toc: 0x2d2622, kieuToc: "ngoi", phuKien: ["caVat"] },
  thanh_xin_nghi:   { da: DA.sang, ao: 0xa9d3ee, quan: 0x3a4250, toc: 0x16120f, kieuToc: "ngoi", phuKien: ["khauTrang"] },
  bac_bao_ve:       { da: DA.ngam, ao: 0x2a5aa8, quan: 0x23406f, toc: 0x9a9690, kieuToc: "ngan", phuKien: ["muKepi"], gay: true },
  sieu_nhan_hong:   { sieuNhan: true },
  cho:              { cho: true },
};

const vlCache = new Map();
export function vl(color, opts = {}) {
  const key = color + JSON.stringify(opts);
  if (!vlCache.has(key)) vlCache.set(key, new THREE.MeshLambertMaterial({ color, flatShading: true, ...opts }));
  return vlCache.get(key);
}
const hop = (w, h, d, color, x = 0, y = 0, z = 0) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), vl(color)); m.position.set(x, y, z); return m; };

// Một chi có khớp ở đầu (để đung đưa khi đi)
function chi(w, h, d, color, x, y, z, mau2 = null) {
  const khop = new THREE.Group(); khop.position.set(x, y, z);
  const m = hop(w, h, d, color, 0, -h / 2, 0); khop.add(m);
  if (mau2 != null) khop.add(hop(w * 0.85, 0.12, d * 0.85, mau2, 0, -h - 0.04, 0));
  return khop;
}

function taoToc(g, nh, dauY) {
  const t = nh.toc, k = nh.kieuToc;
  const nap = (r = 0.19) => { const m = new THREE.Mesh(new THREE.SphereGeometry(r, 7, 4, 0, Math.PI * 2, 0, Math.PI / 2), vl(t)); m.position.y = dauY + 0.02; return m; };
  if (k === "troc") return;
  if (k === "undercut") { const m = hop(0.3, 0.1, 0.32, t, 0, dauY + 0.18, -0.01); g.add(m); return; }
  if (k === "bu") { const m = new THREE.Mesh(new THREE.IcosahedronGeometry(0.22, 0), vl(t)); m.position.set(0, dauY + 0.08, -0.02); m.scale.set(1, 0.75, 1); g.add(m); return; }
  if (k === "xoan") { const m = new THREE.Mesh(new THREE.DodecahedronGeometry(0.21, 0), vl(t)); m.position.set(0, dauY + 0.06, -0.02); m.scale.set(1, 0.7, 1); g.add(m); return; }
  g.add(nap());
  if (k === "dai") g.add(hop(0.32, 0.42, 0.1, t, 0, dauY - 0.14, -0.14));
  if (k === "bob") g.add(hop(0.36, 0.22, 0.3, t, 0, dauY - 0.04, -0.04));
  if (k === "mullet") g.add(hop(0.26, 0.26, 0.08, t, 0, dauY - 0.12, -0.15));
  if (k === "buoi") { const b = new THREE.Mesh(new THREE.SphereGeometry(0.09, 6, 4), vl(t)); b.position.set(0, dauY + 0.2, -0.08); g.add(b); }
  if (k === "buc") g.add(hop(0.07, 0.22, 0.07, t, 0, dauY - 0.08, -0.18));
  if (k === "tem") g.add(hop(0.33, 0.06, 0.33, t, 0, dauY + 0.13, 0));
}

// Người: mặt hướng về +z. Trả về đối tượng có hàm hoatDong(t, dangDi)
export function taoNguoi(ma) {
  const nh = NGOAI_HINH[ma] || NGOAI_HINH.ran_doc;
  if (nh.cho) return taoCho();
  const g = new THREE.Group();
  const sieuNhan = !!nh.sieuNhan;
  const ao = sieuNhan ? 0xf26fa6 : nh.ao, quan = sieuNhan ? 0xf26fa6 : nh.quan, da = sieuNhan ? 0xffffff : nh.da;
  const s = nh.cao ? 1.06 : nh.nho ? 0.92 : 1;
  const rong = nh.beo ? 1.18 : nh.gay ? 0.88 : 1;

  const chanY = 0.82;
  const giay = sieuNhan ? 0xffffff : 0x2a2622;
  const chanT = chi(0.17 * rong, 0.78, 0.19, nh.vay ? da : quan, -0.11 * rong, chanY, 0, giay);
  const chanP = chi(0.17 * rong, 0.78, 0.19, nh.vay ? da : quan, 0.11 * rong, chanY, 0, giay);
  g.add(chanT, chanP);
  if (nh.vay) { const v = new THREE.Mesh(new THREE.CylinderGeometry(0.22 * rong, 0.3 * rong, 0.42, 7), vl(quan)); v.position.y = 0.66; g.add(v); }

  const than = new THREE.Mesh(new THREE.CylinderGeometry(0.23 * rong, 0.25 * rong, 0.62, 7), vl(ao));
  than.position.y = 1.13; g.add(than);
  if (sieuNhan) { // đường kẻ trắng chéo ngực + áo choàng ngắn
    const ke = hop(0.06, 0.62, 0.02, 0xffffff, 0, 1.15, 0.245); ke.rotation.z = 0.6; g.add(ke);
    const choang = hop(0.46, 0.55, 0.04, 0xd94d8a, 0, 1.12, -0.26); choang.rotation.x = 0.12; g.add(choang);
  }
  if (nh.phuKien?.includes("caVat")) g.add(hop(0.06, 0.34, 0.03, ma === "giam_doc" ? 0xc0262d : 0x5b6b8c, 0, 1.22, 0.245));

  const vaiY = 1.4, vaiX = 0.3 * rong;
  const tayMau = sieuNhan ? 0xffffff : da;
  const tayT = chi(0.12, 0.6, 0.12, ao, -vaiX, vaiY, 0, tayMau);
  const tayP = chi(0.12, 0.6, 0.12, ao, vaiX, vaiY, 0, tayMau);
  g.add(tayT, tayP);

  const dauY = 1.62;
  const dau = new THREE.Mesh(new THREE.IcosahedronGeometry(0.17, 1), vl(sieuNhan ? 0xf26fa6 : da));
  dau.position.y = dauY; g.add(dau);
  if (sieuNhan) {
    g.add(hop(0.26, 0.1, 0.06, 0x111111, 0, dauY + 0.02, 0.14)); // kính đen mũ bảo hiểm
  } else {
    g.add(hop(0.035, 0.035, 0.02, 0x1a1a1a, -0.06, dauY + 0.02, 0.16), hop(0.035, 0.035, 0.02, 0x1a1a1a, 0.06, dauY + 0.02, 0.16));
    taoToc(g, nh, dauY);
    const pk = nh.phuKien || [];
    if (pk.includes("kinh")) g.add(hop(0.24, 0.05, 0.02, 0x222222, 0, dauY + 0.02, 0.17));
    if (pk.includes("kinhRam")) g.add(hop(0.26, 0.07, 0.03, 0x050505, 0, dauY + 0.02, 0.17));
    if (pk.includes("khauTrang")) g.add(hop(0.2, 0.07, 0.03, 0xf4c2d6, 0, dauY - 0.12, 0.13));
    if (pk.includes("taiNghe")) { g.add(hop(0.05, 0.1, 0.1, 0x1a1a1a, -0.18, dauY, 0), hop(0.05, 0.1, 0.1, 0x1a1a1a, 0.18, dauY, 0)); }
    if (pk.includes("muLen")) { const m = new THREE.Mesh(new THREE.SphereGeometry(0.19, 7, 4, 0, Math.PI * 2, 0, Math.PI / 2), vl(0x2d3a55)); m.position.y = dauY + 0.04; m.scale.y = 1.25; g.add(m); }
    if (pk.includes("muKepi")) { g.add(hop(0.36, 0.1, 0.36, 0x23406f, 0, dauY + 0.17, 0)); g.add(hop(0.3, 0.03, 0.14, 0x111111, 0, dauY + 0.12, 0.18)); }
  }
  g.scale.setScalar(s);

  return {
    group: g, chieuCao: 1.85 * s,
    hoatDong(t, dangDi, toc = 1) {
      const goc = dangDi ? Math.sin(t * 8 * toc) * 0.55 : 0;
      chanT.rotation.x = goc; chanP.rotation.x = -goc;
      tayT.rotation.x = -goc * 0.8; tayP.rotation.x = goc * 0.8;
      than.position.y = 1.13 + (dangDi ? Math.abs(Math.sin(t * 8 * toc)) * 0.03 : Math.sin(t * 1.6) * 0.008);
    },
  };
}

// Chó ta lông vàng, tai vểnh, đuôi cuộn, vòng cổ đỏ
function taoCho() {
  const g = new THREE.Group();
  const vang = 0xd9a24a;
  g.add(hop(0.32, 0.28, 0.62, vang, 0, 0.42, 0));
  const dau = new THREE.Group(); dau.position.set(0, 0.62, 0.36); g.add(dau);
  dau.add(hop(0.26, 0.24, 0.26, vang), hop(0.14, 0.1, 0.14, 0xe7bf7a, 0, -0.05, 0.17), hop(0.05, 0.04, 0.03, 0x111111, 0, -0.02, 0.25));
  const tai = x => { const m = new THREE.Mesh(new THREE.ConeGeometry(0.06, 0.13, 4), vl(0xc48c38)); m.position.set(x, 0.17, -0.02); return m; };
  dau.add(tai(-0.08), tai(0.08), hop(0.03, 0.03, 0.02, 0x111111, -0.06, 0.04, 0.13), hop(0.03, 0.03, 0.02, 0x111111, 0.06, 0.04, 0.13));
  g.add(hop(0.3, 0.06, 0.08, 0xc0262d, 0, 0.55, 0.26));
  const chan = [[-0.1, 0.2], [0.1, 0.2], [-0.1, -0.2], [0.1, -0.2]].map(([x, z]) => { const c = chi(0.08, 0.3, 0.08, vang, x, 0.3, z); g.add(c); return c; });
  const duoi = new THREE.Mesh(new THREE.TorusGeometry(0.08, 0.03, 4, 8), vl(vang)); duoi.position.set(0, 0.62, -0.32); duoi.rotation.y = Math.PI / 2; g.add(duoi);
  return {
    group: g, chieuCao: 0.9,
    hoatDong(t, dangDi) {
      duoi.rotation.x = Math.sin(t * 10) * 0.4;
      const goc = dangDi ? Math.sin(t * 12) * 0.5 : 0;
      chan.forEach((c, i) => c.rotation.x = (i % 2 ? goc : -goc));
      dau.rotation.y = Math.sin(t * 0.7) * 0.25;
    },
  };
}

// Bảng tên lơ lửng trên đầu
export function taoBangTen(ten, phu = "") {
  const cv = document.createElement("canvas"); cv.width = 512; cv.height = 128;
  const tex = new THREE.CanvasTexture(cv); tex.colorSpace = THREE.SRGBColorSpace;
  const sp = new THREE.Sprite(new THREE.SpriteMaterial({ map: tex, transparent: true, depthWrite: false }));
  sp.scale.set(1.6, 0.4, 1);
  sp.renderOrder = 10;
  const ve = (t, p) => {
    const c = cv.getContext("2d"); c.clearRect(0, 0, 512, 128);
    c.font = "700 46px 'Be Vietnam Pro', system-ui, sans-serif"; c.textAlign = "center";
    const w = Math.min(500, Math.max(c.measureText(t).width, p ? 200 : 0) + 48);
    c.fillStyle = "rgba(20,18,14,.78)"; c.beginPath(); c.roundRect(256 - w / 2, p ? 4 : 24, w, p ? 120 : 80, 22); c.fill();
    c.fillStyle = "#fff"; c.fillText(t, 256, p ? 56 : 80);
    if (p) { c.font = "500 30px 'Be Vietnam Pro', system-ui, sans-serif"; c.fillStyle = "#f0a46e"; c.fillText(p, 256, 102); }
    tex.needsUpdate = true;
  };
  ve(ten, phu);
  document.fonts?.ready?.then(() => ve(sp.userData.ten, sp.userData.phu));
  sp.userData = { ten, phu };
  sp.doiTen = (t, p = sp.userData.phu) => { sp.userData = { ten: t, phu: p }; ve(t, p); };
  return sp;
}

// Đôi tay góc nhìn thứ nhất (gắn vào camera)
export function taoDoiTay(ma) {
  const nh = NGOAI_HINH[ma] || NGOAI_HINH.ran_doc;
  const ao = nh.sieuNhan ? 0xf26fa6 : nh.cho ? 0xd9a24a : nh.ao;
  const da = nh.sieuNhan ? 0xffffff : nh.cho ? 0xd9a24a : nh.da;
  const g = new THREE.Group();
  const mot = (ben) => {
    const t = new THREE.Group();
    const ong = hop(0.065, 0.065, 0.3, ao, 0, 0, -0.15);
    const ban = hop(0.075, 0.045, 0.1, da, 0, 0.004, -0.34);
    const ngon = hop(0.022, 0.03, 0.05, da, ben * -0.035, 0.024, -0.31);
    t.add(ong, ban, ngon);
    t.position.set(0.2 * ben, -0.26, -0.16);
    t.rotation.set(0.08, -0.12 * ben, 0);
    g.add(t);
    return t;
  };
  const trai = mot(-1), phai = mot(1);
  let voi = 0; // 0..1: đưa tay ra phía trước khi tương tác / nói chuyện
  return {
    group: g,
    voiRa(v) { voi = v; },
    hoatDong(t, dangDi, dt) {
      const nhip = dangDi ? 9 : 1.6, bien = dangDi ? 0.025 : 0.006;
      trai.position.y = -0.26 + Math.sin(t * nhip) * bien + voi * 0.08;
      phai.position.y = -0.26 + Math.sin(t * nhip + Math.PI) * bien + voi * 0.1;
      trai.position.z = -0.16 - voi * 0.08 + (dangDi ? Math.cos(t * nhip) * 0.03 : 0);
      phai.position.z = -0.16 - voi * 0.14 + (dangDi ? Math.cos(t * nhip + Math.PI) * 0.03 : 0);
      phai.rotation.x = 0.08 + voi * 0.35 + (voi > 0.5 ? Math.sin(t * 6) * 0.06 : 0);
    },
  };
}
