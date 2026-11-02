// Cửa tủ lạnh và cửa lò vi sóng ở pantry: khối riêng có bản lề (vỏ tủ, vỏ lò vẫn là khối tĩnh gộp chung trong the-gioi.js,
// trang-tri.js; chỉ cánh cửa tách ra). Cửa xoay quanh trục bản lề thật, mở ra khi người chơi (hoặc đồng nghiệp) dùng,
// đóng lại sau đó. Mở tủ lạnh thì đèn trong tủ sáng; lò vi sóng chạy thì đèn vàng trong lò sáng, đĩa xoay.
import * as THREE from "three";
import { vl } from "./nhan-vat-3d.js";

const doan = (p, a, b) => Math.min(1, Math.max(0, (p - a) / (b - a)));
const muot = x => x * x * (3 - 2 * x);

// tủ lạnh: vỏ x 18,7..19,7, z 12,35..13,25, cao 2 m; lòng tủ x 18,76..19,64, y 0,08..1,92, z 12,41..13,19
const TL = { x: 19.7, z: 12.38, rong: 1.0, cao: 2.0, day: 0.06, mo: -1.66 }; // bản lề mép phải (nhìn từ phòng), cửa mở ra phía phòng
// lò vi sóng: vỏ x 16,5..17,1, y 0,95..1,3, z 12,85..13,25; bảng điều khiển x 16,5..16,66 (bên phải khi đứng trước lò),
// lòng lò x 16,66..17,07, y 0,98..1,27; cửa bản lề mép trái (x 17,1), mở ra phía người đứng
const LVS = { x: 17.1, y: 0.953, z: 12.835, rong: 0.44, cao: 0.345, day: 0.03, mo: -1.62 };

function giayNhan(chu1, chu2, nen, mau1) {
  const c = document.createElement("canvas"); c.width = c.height = 72;
  const g = c.getContext("2d");
  g.fillStyle = nen; g.fillRect(0, 0, 72, 72);
  g.textAlign = "center"; g.textBaseline = "middle";
  g.font = "800 11px 'Be Vietnam Pro', system-ui, sans-serif"; g.fillStyle = mau1; g.fillText(chu1, 36, 25, 64);
  g.font = "700 10px 'Be Vietnam Pro', system-ui, sans-serif"; g.fillStyle = "#222"; g.fillText(chu2, 36, 49, 64);
  const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; return t;
}

export class CuaTuBep {
  constructor(game) {
    this.g = game;
    const nhom = this.nhom = new THREE.Group(); nhom.name = "cua-tu-bep";
    game.scene.add(nhom);
    const hop = (cha, w, h, d, m, x, y, z) => { const k = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof m === "number" ? vl(m) : m); k.position.set(x, y, z); cha.add(k); return k; };
    const tru = (cha, r, h, m, x, y, z, seg = 10) => { const k = new THREE.Mesh(new THREE.CylinderGeometry(r, r, h, seg), typeof m === "number" ? vl(m) : m); k.position.set(x, y, z); cha.add(k); return k; };

    // ---------- Tủ lạnh ----------
    // lòng tủ: lớp lót trắng tự sáng (đèn trong tủ) — tối khi cửa đóng, sáng lên khi mở
    this.vlLong = new THREE.MeshBasicMaterial({ color: 0x55585c });
    const L = new THREE.Group(); nhom.add(L);
    hop(L, 0.87, 1.83, 0.01, this.vlLong, 19.2, 1.0, 13.185);      // vách sau
    hop(L, 0.01, 1.83, 0.77, this.vlLong, 18.765, 1.0, 12.8);      // vách trái
    hop(L, 0.01, 1.83, 0.77, this.vlLong, 19.635, 1.0, 12.8);      // vách phải
    hop(L, 0.87, 0.01, 0.77, this.vlLong, 19.2, 1.915, 12.8);      // trần
    hop(L, 0.87, 0.01, 0.77, this.vlLong, 19.2, 0.085, 12.8);      // đáy
    const kinhKe = new THREE.MeshLambertMaterial({ color: 0xdff1f8, transparent: true, opacity: 0.55 });
    for (const y of [0.5, 0.95, 1.4]) hop(L, 0.86, 0.012, 0.64, kinhKe, 19.2, y, 12.86); // kệ kính (chừa chỗ cho kệ trên cửa)
    hop(L, 0.86, 0.2, 0.6, new THREE.MeshLambertMaterial({ color: 0xe6f2f6, transparent: true, opacity: 0.6 }), 19.2, 0.19, 12.88); // hộc rau
    hop(L, 0.12, 0.03, 0.05, new THREE.MeshBasicMaterial({ color: 0xfffbe8 }), 19.2, 1.895, 12.75); // bóng đèn trần tủ
    // đồ trong tủ: hộp cơm có tên, hộp sữa, chai nước, trứng, trái cây
    hop(L, 0.22, 0.08, 0.16, 0x2a5aa8, 18.98, 0.546, 12.9); hop(L, 0.22, 0.03, 0.16, 0xc0262d, 18.98, 0.601, 12.9);
    hop(L, 0.2, 0.07, 0.15, 0xf6f6f2, 19.38, 0.541, 12.95); hop(L, 0.2, 0.025, 0.15, 0x2e8b57, 19.38, 0.59, 12.95);
    hop(L, 0.09, 0.22, 0.07, 0xf6f6f2, 19.0, 1.066, 12.95); hop(L, 0.09, 0.05, 0.071, 0x2a6ac0, 19.0, 1.05, 12.95);
    for (let i = 0; i < 3; i++) tru(L, 0.035, 0.24, 0xbfe3f0, 19.28 + i * 0.09, 1.076, 13.0, 8);
    hop(L, 0.24, 0.04, 0.12, 0xd9c9a8, 19.3, 1.42, 12.8);
    for (let i = 0; i < 6; i++) { const t = new THREE.Mesh(new THREE.SphereGeometry(0.022, 6, 4), vl(0xf3e2c4)); t.scale.y = 1.25; t.position.set(19.21 + (i % 3) * 0.07, 1.463, 12.77 + Math.floor(i / 3) * 0.06); L.add(t); }
    for (const [x, z, c] of [[18.95, 12.82, 0xff8a3a], [19.03, 12.9, 0xc0262d], [18.93, 12.95, 0x6ab04c]]) { const t = new THREE.Mesh(new THREE.SphereGeometry(0.045, 8, 6), vl(c)); t.position.set(x, 1.456, z); L.add(t); }
    // quầng sáng tràn ra trước tủ khi mở
    this.vlQuang = new THREE.MeshBasicMaterial({ color: 0xeaf6ff, transparent: true, opacity: 0, depthWrite: false, blending: THREE.AdditiveBlending });
    const quang = new THREE.Mesh(new THREE.PlaneGeometry(0.86, 1.82), this.vlQuang); quang.position.set(19.2, 1.0, 12.405); quang.rotation.y = Math.PI; L.add(quang);

    // cánh cửa tủ lạnh: nhóm đặt ở trục bản lề, khối cửa nằm về phía −x
    const cua = this.cuaTL = new THREE.Group(); cua.position.set(TL.x, 0, TL.z); nhom.add(cua);
    const vCua = vl(0xe8e8e8);
    hop(cua, TL.rong, TL.cao - 0.01, TL.day, vCua, -TL.rong / 2, TL.cao / 2, 0);
    hop(cua, TL.rong - 0.06, TL.cao - 0.07, 0.008, 0xd5d8da, -TL.rong / 2, TL.cao / 2, TL.day / 2 + 0.004); // ron cao su mặt trong
    hop(cua, 0.03, 0.6, 0.04, 0xc9ccd0, -0.88, 0.75, -0.05);        // tay nắm (mép không bản lề)
    hop(cua, 0.03, 0.03, 0.04, 0xc9ccd0, -0.88, 0.47, -0.035); hop(cua, 0.03, 0.03, 0.04, 0xc9ccd0, -0.88, 1.03, -0.035);
    // giấy nhắn + nam châm (mặt ngoài)
    const vlGiay = (a, b, n, m) => new THREE.MeshLambertMaterial({ map: giayNhan(a, b, n, m) });
    const giay = (m, x, y, rz) => { const p = new THREE.Mesh(new THREE.PlaneGeometry(0.14, 0.14), m); p.position.set(x, y, -TL.day / 2 - 0.004); p.rotation.set(0, Math.PI, rz); cua.add(p); };
    giay(vlGiay("SỮA CỦA NGÂN", "ĐỪNG UỐNG!!!", "#fff7a8", "#c0262d"), -0.45, 0.85, 0.06);
    giay(vlGiay("Hộp cơm T5", "- Tuấn HR", "#d9f0ff", "#1f4fa8"), -0.2, 0.68, -0.08);
    { // bảng "TỦ LẠNH CHUNG"
      const c = document.createElement("canvas"); c.width = 200; c.height = 120; const g = c.getContext("2d");
      g.fillStyle = "#ffffff"; g.fillRect(0, 0, 200, 120); g.textAlign = "center"; g.textBaseline = "middle";
      const dong = (chu, y, co, mau, dam = 800) => { g.font = `${dam} ${co}px 'Be Vietnam Pro', system-ui, sans-serif`; g.fillStyle = mau; g.fillText(chu, 100, y, 188); };
      dong("TỦ LẠNH CHUNG", 30, 20, "#1f4fa8"); dong("Ghi tên lên hộp cơm", 62, 16, "#333", 600); dong("Hộp không tên = của Phát", 92, 15, "#c0262d", 600);
      const t = new THREE.CanvasTexture(c); t.colorSpace = THREE.SRGBColorSpace; t.anisotropy = 8;
      const p = new THREE.Mesh(new THREE.PlaneGeometry(0.9, 0.54), new THREE.MeshLambertMaterial({ map: t })); p.position.set(-0.5, 1.45, -TL.day / 2 - 0.003); p.rotation.y = Math.PI; cua.add(p);
    }
    for (const [x, y, c] of [[-0.45, 0.93, 0xc0262d], [-0.2, 0.76, 0x2a5aa8], [-0.7, 1.88, 0xffcf3a], [-0.3, 1.86, 0x2e8b57], [-0.75, 1.0, 0xf26fa6]]) hop(cua, 0.035, 0.035, 0.014, c, x, y, -TL.day / 2 - 0.007);
    // kệ trên mặt trong cửa (đi theo cửa khi mở): ba khay, chai nước mắm, chai tương ớt, hộp sữa
    for (const y of [0.45, 0.95, 1.45]) { hop(cua, 0.78, 0.012, 0.08, 0xf0f4f6, -0.5, y, TL.day / 2 + 0.045); hop(cua, 0.78, 0.07, 0.008, new THREE.MeshLambertMaterial({ color: 0xdff1f8, transparent: true, opacity: 0.6 }), -0.5, y + 0.035, TL.day / 2 + 0.085); }
    tru(cua, 0.03, 0.2, 0x8a4a1a, -0.3, 1.056, TL.day / 2 + 0.045, 8); tru(cua, 0.028, 0.17, 0xc0262d, -0.4, 1.041, TL.day / 2 + 0.045, 8);
    hop(cua, 0.07, 0.18, 0.06, 0xf6f6f2, -0.65, 0.546, TL.day / 2 + 0.045); tru(cua, 0.03, 0.22, 0x3fa7d8, -0.75, 0.566, TL.day / 2 + 0.045, 8);

    // ---------- Lò vi sóng ----------
    const lo = new THREE.Group(); nhom.add(lo);
    this.vlLo = new THREE.MeshBasicMaterial({ color: 0x3a3a36 });
    hop(lo, 0.41, 0.29, 0.005, this.vlLo, 16.865, 1.125, 13.217); hop(lo, 0.41, 0.005, 0.37, this.vlLo, 16.865, 1.267, 13.035);
    hop(lo, 0.41, 0.005, 0.37, this.vlLo, 16.865, 0.983, 13.035); hop(lo, 0.005, 0.29, 0.37, this.vlLo, 16.663, 1.125, 13.035); hop(lo, 0.005, 0.29, 0.37, this.vlLo, 17.067, 1.125, 13.035);
    const dia = this.dia = new THREE.Group(); dia.position.set(16.865, 0.99, 13.035); lo.add(dia);
    tru(dia, 0.14, 0.008, new THREE.MeshLambertMaterial({ color: 0xe6f2f6, transparent: true, opacity: 0.7 }), 0, 0, 0, 16);
    hop(dia, 0.2, 0.004, 0.01, 0xcfd6da, 0, 0.006, 0); // vạch trên đĩa để thấy đĩa quay
    // ly mì trong lò (đặt vào rồi lấy ra)
    const ly = this.lyMi = new THREE.Group(); ly.position.y = 0.004; dia.add(ly); ly.visible = false;
    ly.add(new THREE.Mesh(new THREE.CylinderGeometry(0.045, 0.034, 0.1, 10), vl(0xf6f6f2))); ly.children[0].position.y = 0.05;
    const dai = new THREE.Mesh(new THREE.CylinderGeometry(0.0435, 0.039, 0.03, 10), vl(0xc0262d)); dai.position.y = 0.05; ly.add(dai);
    // màn hình số trên bảng điều khiển: sáng xanh khi lò chạy
    this.vlSo = new THREE.MeshBasicMaterial({ color: 0x1c2420 });
    hop(lo, 0.1, 0.035, 0.004, this.vlSo, 16.58, 1.215, 12.848);
    // cánh cửa lò: nhóm đặt ở trục bản lề, khối cửa nằm về phía −x
    const cl = this.cuaLo = new THREE.Group(); cl.position.set(LVS.x, LVS.y, LVS.z); nhom.add(cl);
    const vien = vl(0x2a2c31);
    hop(cl, LVS.rong, 0.05, LVS.day, vien, -LVS.rong / 2, 0.025, 0); hop(cl, LVS.rong, 0.05, LVS.day, vien, -LVS.rong / 2, LVS.cao - 0.025, 0);
    hop(cl, 0.05, LVS.cao - 0.1, LVS.day, vien, -0.025, LVS.cao / 2, 0); hop(cl, 0.08, LVS.cao - 0.1, LVS.day, vien, -(LVS.rong - 0.04), LVS.cao / 2, 0);
    this.vlKinhLo = new THREE.MeshLambertMaterial({ color: 0x1a262c, transparent: true, opacity: 0.72 });
    hop(cl, LVS.rong - 0.13, LVS.cao - 0.1, 0.008, this.vlKinhLo, -(LVS.rong - 0.03) / 2, LVS.cao / 2, 0);
    hop(cl, 0.02, 0.18, 0.025, 0xb8bcc4, -(LVS.rong - 0.04), LVS.cao / 2, -LVS.day / 2 - 0.012); // tay kéo (mép không bản lề)

    // nhóm cửa động: không bị gộp tĩnh
    nhom.traverse(o => { if (o.isMesh) o.userData.rieng = true; });
    this.gocTL = 0; this.gocLo = 0; this.sangTL = 0; this.sangLo = 0;
  }

  // độ mở cửa tủ lạnh (0..1) theo động tác của người chơi hoặc đồng nghiệp đang lấy đồ trong tủ
  moTuLanh() {
    const g = this.g, hd = g.hoatAnh?.hd;
    let mo = 0;
    if (hd?.loai === "tu_lanh" && g.tang === 0) { const p = Math.min(1, hd.t / hd.dai); mo = muot(doan(p, 0.02, 0.16)) * (1 - muot(doan(p, 0.44, 0.58))); }
    for (const n of g.npc) {
      const dd = n.diDao, b = dd?.buoc?.[dd.i];
      if (n.tang !== 0 || b?.loai !== "lam" || b.am !== "tu_lanh" || b.t == null) continue;
      const q = 1 - b.t / b.giay; mo = Math.max(mo, muot(doan(q, 0, 0.22)) * (1 - muot(doan(q, 0.72, 0.95))));
    }
    return mo;
  }
  // lò vi sóng khi hâm mì: mở cửa, đặt ly, đóng, chạy, bíp, mở cửa lấy ly, đóng
  lo() {
    const hd = this.g.hoatAnh?.hd;
    if (hd?.loai !== "mi_ly" || this.g.tang !== 0) return { mo: 0, chay: 0, ly: false };
    const p = Math.min(1, hd.t / hd.dai);
    const mo = Math.max(muot(doan(p, 0.02, 0.09)) * (1 - muot(doan(p, 0.15, 0.22))), muot(doan(p, 0.43, 0.49)) * (1 - muot(doan(p, 0.54, 0.62))));
    return { mo, chay: p > 0.23 && p < 0.43 ? 1 : 0, ly: p > 0.11 && p < 0.5 };
  }
  capNhat(dt) {
    if (this.g.tang !== 0 && this.gocTL === 0 && this.gocLo === 0) return;
    const k = Math.min(1, dt * 12);
    const mTL = this.moTuLanh();
    this.gocTL += (mTL * TL.mo - this.gocTL) * k; if (Math.abs(this.gocTL) < 1e-4) this.gocTL = 0;
    this.cuaTL.rotation.y = this.gocTL;
    // đèn trong tủ: bật theo độ mở cửa
    const s = Math.min(1, Math.abs(this.gocTL) / 0.25);
    if (Math.abs(s - this.sangTL) > 0.01) { this.sangTL = s; this.vlLong.color.setRGB(0.33 + 0.62 * s, 0.34 + 0.63 * s, 0.36 + 0.64 * s); this.vlQuang.opacity = 0.1 * s; }
    const L = this.lo();
    this.gocLo += (L.mo * LVS.mo - this.gocLo) * k; if (Math.abs(this.gocLo) < 1e-4) this.gocLo = 0;
    this.cuaLo.rotation.y = this.gocLo;
    this.lyMi.visible = L.ly;
    if (L.chay) this.dia.rotation.y += dt * 1.6;
    const sl = Math.max(L.chay, Math.min(1, Math.abs(this.gocLo) / 0.3));
    if (Math.abs(sl - this.sangLo) > 0.01) {
      this.sangLo = sl;
      this.vlLo.color.setRGB(0.23 + 0.77 * sl, 0.23 + 0.71 * sl, 0.21 + 0.53 * sl);
      this.vlKinhLo.color.setRGB(0.1 + 0.35 * L.chay, 0.15 + 0.3 * L.chay, 0.17 + 0.12 * L.chay);
    }
    this.vlSo.color.setHex(L.chay ? 0x3fe07a : 0x1c2420);
  }
  huy() { this.nhom.removeFromParent(); this.nhom.traverse(o => { if (o.isMesh) { o.geometry.dispose(); if (o.material.map) o.material.map.dispose(); } }); }
}
