// Người đi đường "độc lạ" của Quận Hóng: siêu anh hùng tự phong, hội cổ động viên Quỷ Đỏ, chú cởi trần xách lồng chim,
// khủng long bơm hơi, cô tập thể dục mang loa, shipper ôm tháp thùng, Tôn Ngộ Không cosplay, ông già Noel tháng 10,
// người cầm bảng troll, tượng người bạc. Toàn bộ là nhân vật nhại, không dùng logo hay tên thật.
import * as THREE from "three";
import { vl, taoNguoi, hinhNguoiNgauNhien, gopNhom, kieuMoi } from "./nhan-vat-3d.js";
import { vongEo, danThan, matThanNv, vongDau, matNa, vaMat, trumDau, hinhCau, hinhOng, tamVai, vlMuot, matTruocDau } from "./hinh-nguoi.js";

const hop = (w, h, d, mat, x = 0, y = 0, z = 0) => {
  const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof mat === "number" ? vl(mat) : mat);
  m.position.set(x, y, z); return m;
};
const cau = (r, mat, x, y, z, sx = 1, sy = 1, sz = 1) => {
  const m = new THREE.Mesh(new THREE.SphereGeometry(r, 10, 8), typeof mat === "number" ? vl(mat) : mat);
  m.position.set(x, y, z); m.scale.set(sx, sy, sz); return m;
};
const cauGoc = cau;
const non = (r, h, mat, x, y, z) => { const m = new THREE.Mesh(new THREE.ConeGeometry(r, h, 8), typeof mat === "number" ? vl(mat) : mat); m.position.set(x, y, z); return m; };

// chữ trên tấm bảng (cache theo nội dung)
const texCache = new Map();
export function bangChu(chu, { nen = "#ffffff", mau = "#c0262d", w = 256, h = 160, co = 44 } = {}) {
  const key = `${chu}|${nen}|${mau}|${w}|${h}`;
  if (texCache.has(key)) return texCache.get(key);
  const c = document.createElement("canvas"); c.width = w; c.height = h;
  const g = c.getContext("2d");
  g.fillStyle = nen; g.fillRect(0, 0, w, h);
  g.strokeStyle = mau; g.lineWidth = 6; g.strokeRect(5, 5, w - 10, h - 10);
  g.fillStyle = mau; g.textAlign = "center"; g.textBaseline = "middle";
  const dong = chu.split("\n");
  let size = co; g.font = `800 ${size}px 'Be Vietnam Pro', system-ui, sans-serif`;
  while (size > 14 && dong.some(d => g.measureText(d).width > w - 24)) { size -= 2; g.font = `800 ${size}px 'Be Vietnam Pro', system-ui, sans-serif`; }
  dong.forEach((d, i) => g.fillText(d, w / 2, h / 2 + (i - (dong.length - 1) / 2) * size * 1.1));
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 4;
  texCache.set(key, t); return t;
}
// tấm bảng hai mặt, mặt nào nhìn cũng đọc được
export function tamBang(chu, w, h, tuyChon) {
  const g = new THREE.Group();
  const v = new THREE.MeshLambertMaterial({ map: bangChu(chu, tuyChon) });
  const a = new THREE.Mesh(new THREE.PlaneGeometry(w, h), v); a.position.z = 0.006;
  const b = new THREE.Mesh(new THREE.PlaneGeometry(w, h), v); b.rotation.y = Math.PI; b.position.z = -0.006;
  g.add(a, b, hop(w + 0.04, h + 0.04, 0.01, 0xd9d4c8));
  return g;
}

// gắn đồ vào bàn tay (toạ độ trong khung cánh tay: bàn tay ở y = -0.68)
const vaoTay = (tay, obj, y = -0.68) => { obj.position.y += y; obj.position.z += 0.05; tay.add(obj); tay.userData.coDinh = true; return obj; };
const giuTay = (tay, gocX, gocZ = 0) => { tay.userData.coDinh = true; tay.rotation.set(gocX, 0, gocZ); };

// áo choàng: tấm vải sau lưng, đung đưa theo bước đi
function aoChoang(nv, mau, dai = 0.85) {
  if (nv.thanHinh) { // người kiểu mới: tấm vải bo tròn, cổ áo choàng ôm vai
    const c = tamVai(mau, 0.46, dai); c.position.set(0, 1.47, matThanNv(nv, 0, 1.4, -1) - 0.03); nv.group.add(c);
    nv.group.add(hinhCau(mau, 0.17, 0.035, 0.07, 0, 1.47, -0.06));
    return c;
  }
  const geo = new THREE.BoxGeometry(0.5, dai, 0.02); geo.translate(0, -dai / 2, 0);
  const c = new THREE.Mesh(geo, vl(mau)); c.position.set(0, 1.45, -0.16); nv.group.add(c);
  nv.group.add(hop(0.46, 0.05, 0.08, mau, 0, 1.45, -0.1));
  return c;
}

// ---------- Các kiểu nhân vật ----------
const HUNG = [
  { ten: "hong_man", ao: 0x2a5aa8, quan: 0x2a5aa8, sip: 0xc0262d, choang: 0xc0262d, chu: "H", mauChu: "#ffe14d", nenChu: "#c0262d" },
  { ten: "doi_quan", ao: 0x4a4d55, quan: 0x4a4d55, sip: 0x1c1c1f, choang: 0x1c1c1f, chu: "D", mauChu: "#1c1c1f", nenChu: "#ffe14d", tai: true },
  { ten: "bung_bia", ao: 0x2e8b57, quan: 0x2e8b57, sip: 0xe9e04a, choang: 0xe8702a, chu: "B", mauChu: "#ffffff", nenChu: "#e8702a", beo: true },
  { ten: "nhen_hem", ao: 0xc0262d, quan: 0x1f4fa8, sip: 0xc0262d, choang: null, chu: "N", mauChu: "#1c1c1f", nenChu: "#ffffff", matNa: 0xc0262d },
  { ten: "sam_set", ao: 0xe9e04a, quan: 0x1c1c1f, sip: 0x1c1c1f, choang: 0x7b4bb3, chu: "S", mauChu: "#7b4bb3", nenChu: "#ffe14d" },
];
function sieuAnhHung(rnd) {
  const k = HUNG[Math.floor(rnd() * HUNG.length)];
  const nh = hinhNguoiNgauNhien(rnd, { nu: rnd() < 0.3 });
  nh.ao = { kieu: "thun", mau: k.ao }; nh.quan = { kieu: "jogger", mau: k.quan }; nh.giay = ["sneaker", k.sip];
  if (k.beo) { nh.beo = true; nh.gay = false; }
  nh.pk = [];
  const nv = taoNguoi(null, nh);
  const g = nv.group;
  const huy = new THREE.Mesh(new THREE.CircleGeometry(0.1, 16), new THREE.MeshLambertMaterial({ map: bangChu(k.chu, { nen: k.nenChu, mau: k.mauChu, w: 64, h: 64, co: 48 }) }));
  if (nv.thanHinh) { // người kiểu mới: quần sịp, thắt lưng ôm hông; huy hiệu áp ngực; mặt nạ ôm mặt
    vongEo(nv, k.sip, 0.89, 0.15, 0.016); vongEo(nv, 0xe8c547, 0.985, 0.045, 0.02);
    huy.position.set(0, 1.27, matThanNv(nv, 0, 1.27) + 0.01); g.add(huy);
    // mắt trắng trên mặt nạ (đặt sát mặt nạ theo độ cong của mặt; mặt nạ đen che mắt cũng có lỗ mắt trắng)
    const mat = (x, y, day, nghieng) => { const m = hinhCau(0xf6f6f2, 0.032, 0.022, 0.008, x, y, day); m.rotation.set(0, Math.sign(x) * 0.36, Math.sign(x) * nghieng); nv.dau.add(m); };
    if (k.matNa) { trumDau(nv, k.matNa); for (const x of [-0.06, 0.06]) mat(x, 0.025, matTruocDau(x, 0.025) * 1.08 + 0.004, -0.4); }
    else { matNa(nv, 0x1c1c1f); for (const x of [-0.056, 0.056]) mat(x, 0.016, matTruocDau(x, 0.016) + 0.008, -0.15); }
    if (k.tai) { nv.dau.add(non(0.035, 0.11, 0x1c1c1f, -0.085, 0.2, 0)); nv.dau.add(non(0.035, 0.11, 0x1c1c1f, 0.085, 0.2, 0)); }
  } else {
  g.add(hop(k.beo ? 0.5 : 0.42, 0.16, k.beo ? 0.32 : 0.26, k.sip, 0, 0.9, 0));            // quần sịp mặc ngoài
  g.add(hop(k.beo ? 0.5 : 0.43, 0.05, k.beo ? 0.32 : 0.26, 0xe8c547, 0, 0.99, 0));        // thắt lưng
  huy.position.set(0, 1.27, k.beo ? 0.15 : 0.125); g.add(huy);
  nv.dau.add(hop(0.31, 0.075, 0.02, k.matNa || 0x1c1c1f, 0, 0.04, 0.155));                // mặt nạ che mắt
  if (k.matNa) nv.dau.add(hop(0.31, 0.34, 0.31, k.matNa, 0, 0.0, 0)); // trùm kín đầu
  if (k.tai) { nv.dau.add(non(0.04, 0.12, 0x1c1c1f, -0.1, 0.24, 0)); nv.dau.add(non(0.04, 0.12, 0x1c1c1f, 0.1, 0.24, 0)); }
  }
  const choang = k.choang ? aoChoang(nv, k.choang) : null;
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) {
      nv.hoatDong(t, dangDi, toc);
      if (choang) choang.rotation.x = dangDi ? 0.35 + Math.sin(t * 9) * 0.08 : 0.05;
      // đứng yên: chống nạnh nhìn xa xăm
      if (!dangDi) { nv.tayT.rotation.z = 0.5; nv.tayP.rotation.z = -0.5; } else { nv.tayT.rotation.z = 0; nv.tayP.rotation.z = 0; }
    },
  };
}

const KHAU_HIEU_QUY = ["QUỶ ĐỎ\nVÔ ĐỊCH", "GLORY\nQUẬN HÓNG", "QUỶ ĐỎ\nKHÔNG\nBAO GIỜ\nĐI MỘT MÌNH"];
export function fanQuyDo(rnd, { coCo = rnd() < 0.5 } = {}) {
  const nh = hinhNguoiNgauNhien(rnd);
  nh.ao = { kieu: "thun", mau: 0xd71920, vien: 0xf6f6f2 }; nh.pk = [];
  if (rnd() < 0.5) nh.quan = { kieu: "short", mau: 0xf6f6f2 };
  const nv = taoNguoi(null, nh);
  const g = nv.group;
  // số áo sau lưng
  const so = new THREE.Mesh(new THREE.PlaneGeometry(0.22, 0.24), new THREE.MeshLambertMaterial({ map: bangChu(String([7, 10, 69, 99, 18][Math.floor(rnd() * 5)]), { nen: "#d71920", mau: "#ffffff", w: 64, h: 64, co: 46 }) }));
  so.position.set(0, 1.25, -0.126); so.rotation.y = Math.PI; g.add(so);
  if (nv.thanHinh) { // người kiểu mới: số áp lưng, khăn quàng ôm cổ, sừng nhỏ, cờ vẽ trên má
    so.position.z = matThanNv(nv, 0, 1.25, -1) - 0.008;
    const kh = hinhCau(0xf6f6f2, 0.1, 0.03, 0.085, 0, 1.5, -0.005); nv.than.add(kh);
    danThan(nv, 0xd71920, 1.46, 1.2, (y, f) => [0.05 + f * 0.01, 0.1 + f * 0.01], 0.008);
    for (const s of [-1, 1]) { const n = non(0.03, 0.11, 0xd71920, s * 0.08, 0.2, 0.04); n.rotation.z = -s * 0.35; nv.dau.add(n); }
    vaMat(nv, 0xd71920, -0.62, -0.38, -0.075, -0.035, 0.004);
  } else {
  // khăn quàng đỏ trắng
  g.add(hop(0.32, 0.08, 0.28, 0xf6f6f2, 0, 1.47, 0)); g.add(hop(0.07, 0.3, 0.03, 0xd71920, 0.08, 1.3, 0.13));
  // sừng quỷ
  for (const s of [-1, 1]) { const n = non(0.035, 0.14, 0xd71920, s * 0.1, 0.24, 0.04); n.rotation.z = -s * 0.35; nv.dau.add(n); }
  // mặt vẽ cờ
  nv.dau.add(hop(0.06, 0.05, 0.005, 0xd71920, -0.08, -0.06, 0.153));
  }
  if (coCo) {
    const co = new THREE.Group();
    co.add(hop(0.025, 1.3, 0.025, 0x8a6a3a, 0, -0.55, 0));
    const vai = tamBang(KHAU_HIEU_QUY[Math.floor(rnd() * KHAU_HIEU_QUY.length)], 0.7, 0.46, { nen: "#d71920", mau: "#ffe14d" });
    vai.position.set(0.36, -1.0, 0); vai.rotation.x = Math.PI; co.add(vai);
    vaoTay(nv.tayP, co, -0.62); giuTay(nv.tayP, -2.7);
  }
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) {
      nv.hoatDong(t, dangDi, toc);
      if (coCo) nv.tayP.rotation.x = -2.7 + Math.sin(t * 5) * 0.25; // phất cờ
      else if (!dangDi) { nv.tayP.userData.coDinh = true; nv.tayP.rotation.x = -2.8 + Math.sin(t * 6) * 0.3; } // hô "Glory!"
    },
  };
}

function chuLongChim(rnd) {
  const nh = hinhNguoiNgauNhien(rnd, { nu: false });
  nh.ao = { kieu: "thun", mau: nh.da }; nh.beo = true; nh.gay = false; nh.quan = { kieu: "short", mau: 0x2a5aa8 }; nh.giay = ["depLe", 0x2a5aa8]; nh.pk = [];
  nh.toc = ["gon", 0x9a9690];
  const nv = taoNguoi(null, nh);
  const l = new THREE.Group();
  const khung = new THREE.Mesh(new THREE.CylinderGeometry(0.16, 0.16, 0.34, 10, 1, true), new THREE.MeshLambertMaterial({ color: 0xc8a060, wireframe: true }));
  khung.position.y = -0.2; l.add(khung);
  l.add(non(0.18, 0.12, 0xa8803a, 0, -0.0, 0), hop(0.34, 0.02, 0.34, 0xa8803a, 0, -0.37, 0), cau(0.05, 0xe9e04a, 0, -0.22, 0));
  l.add(hop(0.015, 0.1, 0.015, 0x6b4a2f, 0, 0.08, 0));
  vaoTay(nv.tayP, l, -0.6); giuTay(nv.tayP, -0.5);
  return nv;
}

function khungLong(rnd) {
  const g = new THREE.Group();
  const xanh = [0x6ab04c, 0x8fd16a, 0xf26fa6, 0x6ac1e8][Math.floor(rnd() * 4)];
  const moi = kieuMoi();
  const vlT = moi ? vlMuot(xanh) : new THREE.MeshLambertMaterial({ color: xanh, flatShading: true });
  const cau = (r, mat, x, y, z, sx = 1, sy = 1, sz = 1) => { const m = cauGoc(r, typeof mat === "number" && moi ? vlMuot(mat) : mat, x, y, z, sx, sy, sz); return m; };
  const than = new THREE.Group(); g.add(than);
  than.add(cau(0.42, vlT, 0, 1.15, 0, 1, 1.25, 1));                 // thân phồng
  than.add(cau(0.3, 0xf3e6b0, 0, 1.08, 0.2, 0.8, 1.1, 0.6));       // bụng
  const co = cau(0.18, vlT, 0, 1.75, 0.18, 1, 1.4, 1); than.add(co);
  const dau = new THREE.Group(); dau.position.set(0, 2.05, 0.3); than.add(dau);
  dau.add(cau(0.26, vlT, 0, 0, 0.05, 1, 0.85, 1.3), moi ? cau(0.1, 0xf6f6f2, 0, -0.1, 0.3, 1.4, 0.3, 0.6) : hop(0.3, 0.06, 0.12, 0xf6f6f2, 0, -0.1, 0.33));
  for (const s of [-1, 1]) { dau.add(cau(0.06, 0xf6f6f2, s * 0.12, 0.12, 0.22)); dau.add(cau(0.03, 0x111111, s * 0.12, 0.13, 0.27)); }
  for (let i = 0; i < 5; i++) than.add(non(0.07, 0.16, 0xe8702a, 0, 1.6 - i * 0.22 + 0.5, -0.32 + i * 0.03));
  const duoi = non(0.2, 0.9, vlT, 0, 0.75, -0.55); duoi.rotation.x = -1.2; than.add(duoi);
  for (const s of [-1, 1]) { const t = moi ? cau(0.05, vlT, s * 0.3, 1.4, 0.28, 0.9, 2, 0.9) : hop(0.08, 0.2, 0.08, vlT, s * 0.3, 1.4, 0.28); t.rotation.x = -0.8; than.add(t); }
  // chân người mặc quần jean thò ra dưới bộ đồ
  let chanT, chanP;
  if (moi) { // chân người mặc jean thò ra, giày thể thao trắng (khối tròn)
    [chanT, chanP] = [-0.11, 0.11].map(x => { const c = new THREE.Group(); c.position.set(x, 0.66, 0); c.add(hinhOng(0x4f6d9a, 0.075, 0.06, 0.58), hinhCau(0xf2f2f2, 0.065, 0.045, 0.13, 0, -0.62, 0.04)); g.add(c); return c; });
  } else {
  chanT = hop(0.14, 0.62, 0.16, 0x4f6d9a, -0.11, 0.31, 0); chanP = hop(0.14, 0.62, 0.16, 0x4f6d9a, 0.11, 0.31, 0);
  chanT.geometry.translate(0, 0.31, 0); chanP.geometry.translate(0, 0.31, 0); chanT.position.y = chanP.position.y = 0;
  g.add(chanT, chanP, hop(0.16, 0.08, 0.26, 0xf2f2f2, -0.11, 0.04, 0.04), hop(0.16, 0.08, 0.26, 0xf2f2f2, 0.11, 0.04, 0.04));
  }
  return {
    group: g, chieuCao: 2.3,
    hoatDong(t, dangDi, toc = 1) {
      const goc = dangDi ? Math.sin(t * 8 * toc) * 0.45 : 0;
      chanT.rotation.x = goc; chanP.rotation.x = -goc;
      than.rotation.z = Math.sin(t * (dangDi ? 8 : 1.5)) * (dangDi ? 0.09 : 0.03);   // lắc lư phồng phồng
      than.position.y = dangDi ? Math.abs(Math.sin(t * 8)) * 0.06 : 0;
      dau.rotation.x = Math.sin(t * 3) * 0.15;
    },
  };
}

function coTheDuc(rnd) {
  const nh = hinhNguoiNgauNhien(rnd, { nu: true });
  nh.ao = { kieu: "thun", mau: [0xff4fa3, 0x3fe07a, 0xffe14d][Math.floor(rnd() * 3)] }; nh.quan = { kieu: "jogger", mau: 0x1c1c1f }; nh.giay = ["sneaker", 0xf2f2f2];
  nh.pk = ["khauTrangVai"]; nh.mauKhauTrang = 0xf5b9cf; nh.toc = ["buoi_cao", 0x16120f];
  const nv = taoNguoi(null, nh);
  if (nv.thanHinh) { vongDau(nv, 0xf6f6f2, 0.1, 0.022); const l = hinhCau(0xf6f6f2, 0.13, 0.01, 0.09, 0, 0.085, 0.17); l.rotation.x = 0.2; nv.dau.add(l); }
  else nv.dau.add(hop(0.36, 0.04, 0.36, 0xf6f6f2, 0, 0.12, 0), hop(0.34, 0.02, 0.16, 0xf6f6f2, 0, 0.1, 0.22)); // mũ lưỡi trai không đỉnh
  const loa = new THREE.Group(); loa.add(hop(0.22, 0.32, 0.16, 0x1c1c1f), cau(0.06, 0x555555, 0, 0.06, 0.08, 1, 1, 0.3), cau(0.04, 0x555555, 0, -0.08, 0.08, 1, 1, 0.3), hop(0.12, 0.03, 0.03, 0x3fe07a, 0, 0.12, 0.08));
  vaoTay(nv.tayT, loa, -0.82); giuTay(nv.tayT, 0);
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) {
      nv.hoatDong(t, dangDi, toc);
      if (!dangDi) { // tập dang tay
        nv.tayP.userData.coDinh = true; nv.tayP.rotation.set(0, 0, -1.2 - Math.sin(t * 4) * 0.9);
        nv.than.position.y = Math.abs(Math.sin(t * 4)) * 0.05;
      } else { nv.tayP.userData.coDinh = false; nv.tayP.rotation.z = 0; }
    },
  };
}

function shipperThap(rnd) {
  const nh = hinhNguoiNgauNhien(rnd, { nu: false });
  nh.ao = { kieu: "polo", mau: 0xe8702a }; nh.pk = ["muBaoHiem"]; nh.mauMu = 0xe8702a;
  const nv = taoNguoi(null, nh);
  const thap = new THREE.Group();
  const so = 5 + Math.floor(rnd() * 3);
  for (let i = 0; i < so; i++) { const b = hop(0.42 - (i % 2) * 0.06, 0.24, 0.32, i % 3 ? 0xc89a5a : 0xd9b27a, (rnd() - 0.5) * 0.08, 1.12 + i * 0.25, 0.32); b.rotation.y = (rnd() - 0.5) * 0.3; thap.add(b); }
  nv.group.add(gopNhom(thap));
  giuTay(nv.tayT, -1.25); giuTay(nv.tayP, -1.25);
  return {
    ...nv,
    hoatDong(t, dangDi, toc = 1) { nv.hoatDong(t, dangDi, toc * 0.8); thap.rotation.z = Math.sin(t * 3) * 0.04; }, // tháp chao đảo
  };
}

function ngoKhong(rnd) {
  const nh = hinhNguoiNgauNhien(rnd, { nu: false });
  nh.ao = { kieu: "thun", mau: 0xe8b830 }; nh.quan = { kieu: "loe", mau: 0xc0262d }; nh.giay = ["tay", 0x1c1c1f]; nh.pk = [];
  const nv = taoNguoi(null, nh);
  if (nv.thanHinh) { vongDau(nv, 0xe8c547, 0.11, 0.016); vaMat(nv, 0xb8865a, -1.0, 1.0, -0.15, -0.05, 0.005); vongEo(nv, 0x7a1424, 0.98, 0.07, 0.016); }
  else {
  nv.dau.add(hop(0.33, 0.04, 0.33, 0xe8c547, 0, 0.12, 0));                    // vòng kim cô
  nv.dau.add(hop(0.3, 0.06, 0.02, 0xb8865a, 0, -0.1, 0.155));                // mặt khỉ
  nv.group.add(hop(0.44, 0.08, 0.27, 0x7a1424, 0, 0.98, 0));                 // đai lưng
  }
  const gay = new THREE.Group(); gay.add(hop(0.035, 1.7, 0.035, 0xc0262d), hop(0.045, 0.12, 0.045, 0xe8c547, 0, 0.82, 0), hop(0.045, 0.12, 0.045, 0xe8c547, 0, -0.82, 0));
  gay.rotation.z = Math.PI / 2 - 0.3;
  vaoTay(nv.tayP, gay, -0.66); giuTay(nv.tayP, -0.3);
  return nv;
}

function ongNoel(rnd) {
  const nh = hinhNguoiNgauNhien(rnd, { nu: false });
  nh.ao = { kieu: "khoac", mau: 0xc0262d, khoac: 0xc0262d }; nh.quan = { kieu: "tay", mau: 0xc0262d }; nh.giay = ["tay", 0x1c1c1f]; nh.beo = true; nh.gay = false; nh.pk = [];
  nh.toc = ["gon", 0xf2f2f2];
  const nv = taoNguoi(null, nh);
  if (nv.thanHinh) { // râu trắng ôm cằm, mũ đỏ viền trắng, thắt lưng đen ôm bụng
    vaMat(nv, 0xf6f6f2, -1.3, 1.3, -0.2, -0.06, 0.016); nv.dau.add(hinhCau(0xf6f6f2, 0.065, 0.02, 0.025, 0, -0.065, 0.15));
    const mu = non(0.16, 0.3, 0xc0262d, 0, 0.27, -0.03); mu.rotation.x = -0.45; nv.dau.add(mu, hinhCau(0xf6f6f2, 0.045, 0.045, 0.045, 0, 0.38, -0.13)); vongDau(nv, 0xf6f6f2, 0.13, 0.03);
    vongEo(nv, 0x1c1c1f, 0.98, 0.06, 0.018); nv.group.add(cau(0.3, 0x8a6a3a, 0, 1.35, -0.38, 1, 1.1, 0.8));
  } else {
  nv.dau.add(hop(0.26, 0.16, 0.06, 0xf6f6f2, 0, -0.15, 0.14), hop(0.14, 0.04, 0.03, 0xf6f6f2, 0, -0.04, 0.165)); // râu
  const mu = non(0.18, 0.32, 0xc0262d, 0, 0.32, -0.02); mu.rotation.x = -0.4; nv.dau.add(mu, hop(0.36, 0.06, 0.36, 0xf6f6f2, 0, 0.17, 0), cau(0.05, 0xf6f6f2, 0, 0.45, -0.12));
  nv.group.add(hop(0.5, 0.06, 0.32, 0x1c1c1f, 0, 0.98, 0), cau(0.3, 0x8a6a3a, 0, 1.35, -0.32, 1, 1.1, 0.8)); // thắt lưng, bao quà
  }
  return nv;
}

const BANG_TROLL = ["ÔM MIỄN PHÍ\n(trừ thứ 2)", "CẦN NGƯỜI YÊU\nBIẾT NẤU CƠM", "1 TRIỆU FOLLOW\nCHO SIÊU NHÂN HỒNG", "ĐI LÀM VỀ\nĐỪNG HỎI", "BÁN NHÀ\nGIÁ TÌNH CẢM", "TÔI ĐANG\nTRỐN SẾP", "SALE 99%\n(của nỗi buồn)"];
function nguoiCamBang(rnd) {
  const nv = taoNguoi(null, hinhNguoiNgauNhien(rnd));
  const b = tamBang(BANG_TROLL[Math.floor(rnd() * BANG_TROLL.length)], 0.66, 0.44, { nen: "#ffffff", mau: ["#c0262d", "#1f4fa8", "#2e8b57"][Math.floor(rnd() * 3)] });
  b.position.set(0, nv.chieuCao + 0.32, 0.05); nv.group.add(b);
  nv.group.add(hop(0.02, 0.4, 0.02, 0x8a6a3a, -0.24, nv.chieuCao + 0.0, 0.05), hop(0.02, 0.4, 0.02, 0x8a6a3a, 0.24, nv.chieuCao + 0.0, 0.05));
  giuTay(nv.tayT, -2.9, 0.15); giuTay(nv.tayP, -2.9, -0.15);
  return nv;
}

function beBongBay(rnd) {
  const nv = taoNguoi(null, hinhNguoiNgauNhien(rnd));
  nv.group.scale.setScalar(0.62);
  const chum = new THREE.Group();
  const mau = [0xff4fa3, 0xffe14d, 0x3fa8ff, 0x3fe07a, 0xe8702a];
  for (let i = 0; i < 4; i++) { const x = (i - 1.5) * 0.18, y = 1.6 + (i % 2) * 0.22; chum.add(cau(0.16, mau[(i + Math.floor(rnd() * 5)) % 5], x, y, 0, 1, 1.2, 1)); chum.add(hop(0.006, y - 0.1, 0.006, 0xdddddd, x / 2, (y - 0.1) / 2, 0)); }
  vaoTay(nv.tayP, chum, -0.68); giuTay(nv.tayP, -0.9);
  chum.rotation.x = 0.9; // giữ chùm bóng thẳng đứng khi tay giơ ra trước
  return { ...nv, hoatDong(t, dangDi, toc = 1) { nv.hoatDong(t, dangDi, toc * 1.3); chum.rotation.z = Math.sin(t * 2) * 0.12; } };
}

function tuongBac() {
  const bac = 0xb8bcc4;
  const nh = { da: bac, ao: { kieu: "khoac", mau: bac, khoac: bac }, quan: { kieu: "tay", mau: bac }, giay: ["tay", bac], toc: ["re_giua", bac], mat: { mat: "lim", may: "manh", mieng: "thang" }, pk: [] };
  const nv = taoNguoi(null, nh);
  if (nv.thanHinh) { nv.dau.add(hinhCau(bac, 0.2, 0.014, 0.2, 0, 0.165, 0, 14), hinhOng(bac, 0.12, 0.13, 0.12, 0, 0.29, 0, 12)); }
  else nv.dau.add(hop(0.36, 0.05, 0.36, bac, 0, 0.18, 0), hop(0.22, 0.14, 0.22, bac, 0, 0.27, 0)); // mũ phớt bạc
  const de = hop(0.6, 0.4, 0.6, 0x8a8d92, 0, -0.2, 0); nv.group.add(de); nv.group.position.y = 0.4;
  nv.group.add(hop(0.26, 0.18, 0.2, 0x6b4a2f, 0.42, -0.31, 0.3)); // hộp xin tiền
  giuTay(nv.tayP, -1.6, -0.1); giuTay(nv.tayT, 0, 0.3);
  let lan = 0;
  return {
    ...nv,
    // đứng im như tượng, thỉnh thoảng chớp... đổi tư thế
    hoatDong(t) { const k = Math.floor(t / 7); if (k !== lan) { lan = k; nv.tayP.rotation.x = k % 2 ? -1.6 : -2.9; nv.dau.rotation.y = k % 3 ? 0 : 0.6; } },
  };
}

// chọn một kiểu "độc lạ" ngẫu nhiên cho người đi bộ
const KIEU = [
  [sieuAnhHung, 5], [fanQuyDo, 5], [chuLongChim, 2], [khungLong, 2], [coTheDuc, 2], [shipperThap, 2], [ngoKhong, 1.5], [ongNoel, 1], [nguoiCamBang, 2.5], [beBongBay, 1.5],
];
const TONG = KIEU.reduce((a, [, w]) => a + w, 0);
export function taoNguoiBua(rnd) {
  let r = rnd() * TONG;
  for (const [f, w] of KIEU) { if ((r -= w) <= 0) return { nv: f(rnd), kieu: f.name }; }
  return { nv: sieuAnhHung(rnd), kieu: "sieuAnhHung" };
}
export { tuongBac, sieuAnhHung };

// Phụ kiện cho người lái xe máy: áo choàng bay phấp phới, hoặc cờ Quỷ Đỏ cắm sau xe
export function phuKienXeMay(rnd) {
  const g = new THREE.Group();
  if (rnd() < 0.6) {
    const mau = [0xc0262d, 0x7b4bb3, 0xe8702a, 0x1c1c1f][Math.floor(rnd() * 4)];
    const geo = new THREE.BoxGeometry(0.5, 0.75, 0.02); geo.translate(0, -0.35, 0);
    const c = new THREE.Mesh(geo, vl(mau)); c.position.set(0, 1.55, -0.32); c.rotation.x = 1.15; g.add(c);
    g.userData.choang = c;
  } else {
    g.add(hop(0.025, 1.6, 0.025, 0x8a6a3a, 0.2, 1.55, -0.95));
    const co = tamBang("QUỶ ĐỎ", 0.7, 0.45, { nen: "#d71920", mau: "#ffe14d" }); co.position.set(0.2, 2.1, -1.32); co.rotation.y = Math.PI / 2; g.add(co);
    g.userData.co = co;
  }
  return g;
}
