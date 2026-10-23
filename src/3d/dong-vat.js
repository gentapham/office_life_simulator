// Động vật trong và quanh công ty: mèo đi lang thang (vuốt ve được), bầy bồ câu ngoài sân (lại gần thì bay,
// rắc vụn bánh mì thì sà xuống), bể cá ở sảnh (cá bơi, ngắm được).
import * as THREE from "three";
import { vl, kieuMoi } from "./nhan-vat-3d.js";
import { vlMuot, ong } from "./hinh-nguoi.js";
import { gopNguoi } from "./toi-uu.js";

const hop = (w, h, d, c, x = 0, y = 0, z = 0) => { const m = new THREE.Mesh(new THREE.BoxGeometry(w, h, d), typeof c === "number" ? vl(c) : c); m.position.set(x, y, z); return m; };

// Kiểu mới (mọi mức trừ "Thấp"): khối tròn mượt cùng khung cử động (thân, đầu, đuôi, bốn chân là từng khối riêng)
const elip = (c, rx, ry, rz, x = 0, y = 0, z = 0, seg = 10) => { const m = new THREE.Mesh(new THREE.SphereGeometry(1, seg, Math.round(seg * 0.7)), typeof c === "number" ? vlMuot(c) : c); m.scale.set(rx, ry, rz); m.position.set(x, y, z); return m; };
const ongLen = (r1, r2, L, seg = 7) => { const g = ong(r1, r2, L, seg, [2, 1]).clone(); g.rotateX(Math.PI); return g; }; // ống mọc lên +y từ gốc
function taoMeoMoi(mau, soc) {
  const g = new THREE.Group();
  const than = new THREE.Group(); g.add(than);
  than.add(elip(mau, 0.095, 0.09, 0.21, 0, 0.27, 0));
  // sọc vằn: vòng mỏng ôm quanh thân (co theo tiết diện thân tại chỗ đó), không nhô thành u trên lưng
  if (soc) for (let i = 0; i < 4; i++) { const z = -0.14 + i * 0.09, k = Math.sqrt(1 - (z / 0.21) ** 2); than.add(elip(soc, 0.095 * k + 0.004, 0.09 * k + 0.004, 0.024, 0, 0.27, z, 10)); }
  than.add(elip(mau, 0.06, 0.07, 0.06, 0, 0.32, 0.17, 8)); // ngực
  const dau = new THREE.Group(); dau.position.set(0, 0.38, 0.25); than.add(dau);
  dau.add(elip(mau, 0.085, 0.075, 0.075));
  for (const s of [-1, 1]) {
    const tai = new THREE.Mesh(new THREE.ConeGeometry(0.03, 0.065, 6), vlMuot(mau)); tai.position.set(s * 0.05, 0.075, -0.01); tai.rotation.z = -s * 0.25; dau.add(tai);
    dau.add(elip(0xd8e04a, 0.016, 0.019, 0.008, s * 0.035, 0.015, 0.068, 8), elip(0x111111, 0.005, 0.014, 0.004, s * 0.035, 0.015, 0.074, 6));
  }
  dau.add(elip(0xf5a3b8, 0.012, 0.008, 0.006, 0, -0.012, 0.076, 6), elip(soc ? 0xf2e2c8 : mau, 0.035, 0.022, 0.02, 0, -0.03, 0.062, 8));
  const duoi = new THREE.Mesh(ongLen(0.02, 0.014, 0.3), vlMuot(mau)); duoi.position.set(0, 0.3, -0.2); duoi.rotation.x = -0.6; than.add(duoi);
  const chan = [[-0.055, 0.15], [0.055, 0.15], [-0.055, -0.15], [0.055, -0.15]].map(([x, z]) => { const c = new THREE.Mesh(ong(0.026, 0.02, 0.165, 7, [1, 2]), vlMuot(mau)); c.position.set(x, 0.185, z); g.add(c); return c; });
  return { g, than, dau, duoi, chan };
}
const toiXam = c => { const m = new THREE.Color(c); m.multiplyScalar(0.85); return m.getHex(); };
function taoBoCauMoi(rnd) {
  const g = new THREE.Group();
  const xam = [0x8a8f99, 0x9aa0a8, 0x7a7f88, 0xb8b8b0][Math.floor(rnd() * 4)];
  g.add(elip(xam, 0.065, 0.065, 0.105, 0, 0.1, 0));
  const dau = new THREE.Group(); dau.position.set(0, 0.17, 0.08); g.add(dau);
  dau.add(elip(0x6a7080, 0.038, 0.038, 0.04, 0, 0, 0, 8));
  const mo = new THREE.Mesh(new THREE.ConeGeometry(0.009, 0.035, 5), vlMuot(0xe8a04a)); mo.rotation.x = Math.PI / 2; mo.position.set(0, -0.005, 0.048); dau.add(mo);
  for (const s of [-1, 1]) dau.add(elip(0xe86a2a, 0.006, 0.006, 0.004, s * 0.025, 0.01, 0.028, 6));
  g.add(elip(0x4f7a6a, 0.036, 0.03, 0.03, 0, 0.135, 0.06, 8));
  const canh = [-1, 1].map(s => { const geo = new THREE.SphereGeometry(1, 8, 5); geo.scale(0.035, 0.014, 0.085); geo.translate(s * 0.03, 0, -0.025); const c = new THREE.Mesh(geo, vlMuot(toiXam(xam))); c.position.set(s * 0.04, 0.125, -0.01); g.add(c); return c; });
  for (const x of [-0.025, 0.025]) { const c = new THREE.Mesh(ong(0.006, 0.005, 0.055, 5, 1), vlMuot(0xe07a5a)); c.position.set(x, 0.058, 0); g.add(c); }
  return { g, dau, canh };
}

function taoMeo(mau, soc) {
  if (kieuMoi()) return taoMeoMoi(mau, soc);
  const g = new THREE.Group();
  const than = new THREE.Group(); g.add(than);
  than.add(hop(0.2, 0.18, 0.46, mau, 0, 0.26, 0));
  if (soc) for (let i = 0; i < 4; i++) than.add(hop(0.205, 0.04, 0.05, soc, 0, 0.33, -0.15 + i * 0.1));
  const dau = new THREE.Group(); dau.position.set(0, 0.38, 0.25); than.add(dau);
  dau.add(hop(0.17, 0.15, 0.15, mau));
  for (const s of [-1, 1]) { const tai = new THREE.Mesh(new THREE.ConeGeometry(0.035, 0.07, 4), vl(mau)); tai.position.set(s * 0.055, 0.1, -0.01); dau.add(tai); dau.add(hop(0.03, 0.03, 0.01, 0xd8e04a, s * 0.04, 0.02, 0.076)); }
  dau.add(hop(0.025, 0.02, 0.01, 0xf5a3b8, 0, -0.02, 0.077));
  const duoi = hop(0.035, 0.32, 0.035, mau); duoi.geometry.translate(0, 0.16, 0); duoi.position.set(0, 0.3, -0.23); duoi.rotation.x = -0.6; than.add(duoi);
  const chan = [[-0.07, 0.16], [0.07, 0.16], [-0.07, -0.16], [0.07, -0.16]].map(([x, z]) => { const c = hop(0.05, 0.18, 0.05, mau); c.geometry.translate(0, -0.09, 0); c.position.set(x, 0.18, z); g.add(c); return c; });
  return { g, than, dau, duoi, chan };
}

function taoBoCau(rnd) {
  if (kieuMoi()) return taoBoCauMoi(rnd);
  const g = new THREE.Group();
  const xam = [0x8a8f99, 0x9aa0a8, 0x7a7f88, 0xb8b8b0][Math.floor(rnd() * 4)];
  const than = new THREE.Mesh(new THREE.SphereGeometry(0.08, 8, 6), vl(xam)); than.scale.set(0.8, 0.8, 1.3); than.position.y = 0.1; g.add(than);
  const dau = new THREE.Group(); dau.position.set(0, 0.17, 0.08); g.add(dau);
  dau.add(new THREE.Mesh(new THREE.SphereGeometry(0.04, 6, 5), vl(0x6a7080)));
  const mo = hop(0.015, 0.015, 0.035, 0xe8a04a, 0, -0.005, 0.045); dau.add(mo);
  const co = new THREE.Mesh(new THREE.SphereGeometry(0.035, 6, 4), vl(0x4f7a6a)); co.position.set(0, 0.13, 0.06); g.add(co);
  const canh = [-1, 1].map(s => { const c = hop(0.12, 0.012, 0.13, xam); c.geometry.translate(s * 0.06, 0, 0); c.position.set(s * 0.04, 0.12, -0.01); g.add(c); return c; });
  g.add(hop(0.012, 0.06, 0.012, 0xe07a5a, -0.025, 0.03, 0), hop(0.012, 0.06, 0.012, 0xe07a5a, 0.025, 0.03, 0));
  return { g, dau, canh };
}

export class DongVat {
  constructor(scene, vat, CAO) {
    this.vat = vat; this.CAO = CAO;
    this.nhom = new THREE.Group(); scene.add(this.nhom);
    let seed = 777; this.rnd = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
    // mèo: một con ở sảnh lầu 1, một con ngoài sân
    this.meo = [
      { ten: "Mèo Mướp", tang: 0, vung: [0.2, 8.4, 3.2, 13.4], ...taoMeo(0xd08a3a, 0x9a5a22) },
      { ten: "Mèo Mun", tang: 0, vung: [-19, 19, 15.6, 28.8], ...taoMeo(0x1c1c1f, null) },
    ];
    for (const m of this.meo) { m.x = (m.vung[0] + m.vung[1]) / 2; m.z = (m.vung[2] + m.vung[3]) / 2; m.muc = null; m.nghi = 2; m.ngoi = 0; m.g.position.set(m.x, m.tang * CAO, m.z); this.nhom.add(m.g); }
    // bồ câu: bầy 9 con ngoài sân trước
    this.chim = [];
    for (let i = 0; i < 9; i++) {
      const c = taoBoCau(this.rnd); c.x = -18 + this.rnd() * 6; c.z = 17 + this.rnd() * 10; c.y = 0; c.bay = 0; c.huong = this.rnd() * 6.28; c.mo = this.rnd() * 3;
      c.g.position.set(c.x, 0, c.z); this.nhom.add(c.g); this.chim.push(c);
    }
    this.vungChim = [-19, -11, 15.6, 28.8]; // góc sân trái, tránh chòi bảo vệ
    // bể cá ở sảnh (tủ thấp sát tường, cạnh cửa khu làm việc)
    const be = new THREE.Group(); be.position.set(-1.55, 0, 2.2); this.nhom.add(be);
    be.add(hop(0.5, 0.8, 1.2, 0x5a3d2a, 0, 0.4, 0));
    const kinh = new THREE.Mesh(new THREE.BoxGeometry(0.46, 0.55, 1.12), new THREE.MeshLambertMaterial({ color: 0x7fd3ff, transparent: true, opacity: 0.35, depthWrite: false }));
    kinh.position.y = 1.08; be.add(kinh);
    be.add(hop(0.44, 0.06, 1.1, 0xd9c28a, 0, 0.83, 0));                 // sỏi đáy
    for (const [z, h] of [[-0.35, 0.3], [0.3, 0.22], [0.05, 0.18]]) be.add(hop(0.03, h, 0.03, 0x2e8b57, 0.05, 0.86 + h / 2, z)); // rong
    be.add(hop(0.5, 0.05, 1.2, 0x2a2c31, 0, 1.38, 0));                  // nắp
    this.ca = [0xff8a3a, 0xffd23a, 0xff4f6a, 0x3fa8ff, 0xffffff].map((c, i) => { const f = new THREE.Group(); f.add(hop(0.03, 0.04, 0.08, c)); const vay = hop(0.005, 0.04, 0.03, c, 0, 0, -0.05); f.add(vay); f.userData = { pha: i * 1.3, y: 0.95 + (i % 3) * 0.12, vay }; be.add(f); return f; });
    // mỗi con vật (và cả bể cá) gộp thành một khối xương cứng: mỗi khối nhỏ là một xương, vẫn cử động như cũ
    for (const m of this.meo) gopNguoi({ group: m.g }, { xuongRieng: true });
    for (const c of this.chim) gopNguoi({ group: c.g }, { xuongRieng: true });
    gopNguoi({ group: be }, { xuongRieng: true });
    this.be = be; vat[0].push({ minX: -1.82, maxX: -1.28, minZ: 1.58, maxZ: 2.82 });
    this.vung = 0;
  }
  // điểm (x, z) trên tầng có bị vật cản không
  can(tang, x, z, r = 0.15) { for (const b of this.vat[tang]) if (x > b.minX - r && x < b.maxX + r && z > b.minZ - r && z < b.maxZ + r) return true; return false; }
  // tương tác ở gần người chơi
  timGan(p, tang) {
    let gan = null, dMin = 1.6;
    for (const m of this.meo) { if (m.tang !== tang) continue; const d = Math.hypot(m.g.position.x - p.x, m.g.position.z - p.z); if (d < dMin) { dMin = d; gan = { loai: "meo", nhan: `Vuốt ve ${m.ten.toLowerCase()}`, meo: m }; } }
    if (tang === 0) {
      const d = Math.hypot(-1.0 - p.x, 2.2 - p.z); if (d < 1.4 && d < dMin) { dMin = d; gan = { loai: "ca", nhan: "Ngắm bể cá" }; }
      const coChim = this.chim.some(c => !c.bay && Math.hypot(c.x - p.x, c.z - p.z) < 4);
      if (!gan && coChim) gan = { loai: "chim", nhan: "Rắc vụn bánh mì cho bồ câu" };
    }
    return gan;
  }
  vuot(m) { m.ngoi = 4; m.muc = null; }
  rac(p) { for (const c of this.chim) { c.muc = [p.x + (this.rnd() - 0.5) * 1.6, p.z + (this.rnd() - 0.5) * 1.6]; c.bay = c.bay > 0 ? c.bay : 0.01; c.anVun = 6; } }
  capNhat(dt, t, p, tang) {
    // chỉ cập nhật khi người chơi ở gần (tiết kiệm máy)
    const gan = tang === 0 && p.z > -16 && p.z < 34 && Math.abs(p.x) < 26;
    this.nhom.visible = gan || tang > 0;
    if (!gan) return;
    const rnd = this.rnd;
    // mèo: đi tới một điểm ngẫu nhiên, nghỉ ngồi liếm chân, có ai vuốt thì ngồi yên
    for (const m of this.meo) {
      let di = false;
      if (m.ngoi > 0) m.ngoi -= dt;
      else if (m.nghi > 0) m.nghi -= dt;
      else {
        if (!m.muc) { for (let k = 0; k < 8 && !m.muc; k++) { const x = m.vung[0] + rnd() * (m.vung[1] - m.vung[0]), z = m.vung[2] + rnd() * (m.vung[3] - m.vung[2]); if (!this.can(m.tang, x, z)) m.muc = [x, z]; } }
        if (m.muc) {
          const dx = m.muc[0] - m.x, dz = m.muc[1] - m.z, kc = Math.hypot(dx, dz);
          if (kc < 0.1) { m.muc = null; m.nghi = 3 + rnd() * 6; }
          else {
            const b = Math.min(kc, 0.75 * dt), nx = m.x + dx / kc * b, nz = m.z + dz / kc * b;
            if (this.can(m.tang, nx, nz) || Math.hypot(p.x - nx, p.z - nz) < 0.5) { m.muc = null; m.nghi = 0.5; }
            else { m.x = nx; m.z = nz; m.g.rotation.y = Math.atan2(dx, dz); di = true; }
          }
        }
      }
      m.g.position.set(m.x, m.tang * this.CAO, m.z);
      const goc = di ? Math.sin(t * 10) * 0.5 : 0;
      m.chan[0].rotation.x = m.chan[3].rotation.x = goc; m.chan[1].rotation.x = m.chan[2].rotation.x = -goc;
      // ngồi: hạ phần sau, đuôi quấn
      const ngoi = !di && (m.ngoi > 0 || m.nghi > 1.5);
      m.than.rotation.x = ngoi ? -0.35 : 0; m.than.position.y = ngoi ? -0.04 : 0;
      m.duoi.rotation.set(ngoi ? -1.6 : -0.6 + Math.sin(t * 3) * 0.2, 0, ngoi ? 0.8 : Math.sin(t * 2) * 0.3);
      m.dau.rotation.y = m.ngoi > 0 ? Math.atan2(p.x - m.x, p.z - m.z) - m.g.rotation.y : Math.sin(t * 0.7 + m.x) * 0.3;
    }
    // bồ câu: mổ mổ, đi lạch bạch; người chơi lại gần thì bay lên, đáp chỗ khác
    const [x1, x2, z1, z2] = this.vungChim;
    for (const c of this.chim) {
      const kcNguoi = Math.hypot(p.x - c.x, p.z - c.z);
      if (!c.bay && !c.anVun && kcNguoi < 1.8) { c.bay = 0.01; c.muc = [x1 + rnd() * (x2 - x1), z1 + rnd() * (z2 - z1)]; }
      if (c.bay > 0) {
        c.bay += dt;
        const dx = c.muc[0] - c.x, dz = c.muc[1] - c.z, kc = Math.hypot(dx, dz);
        const b = Math.min(kc, 4.5 * dt); if (kc > 0.01) { c.x += dx / kc * b; c.z += dz / kc * b; c.g.rotation.y = Math.atan2(dx, dz); }
        c.y = kc > 0.05 ? Math.min(2.6, c.y + dt * 3) * Math.min(1, kc / 1.5) : 0; // cất cánh, bay, hạ dần khi gần chỗ đáp
        for (const [i, w] of c.canh.entries()) w.rotation.z = (i ? -1 : 1) * (0.2 + Math.sin(t * 28 + c.mo) * 0.9);
        if (kc < 0.05) { c.bay = 0; c.y = 0; }
      } else {
        for (const [i, w] of c.canh.entries()) w.rotation.z = 0;
        if (c.anVun > 0) c.anVun -= dt;
        // mổ thức ăn và thỉnh thoảng bước vài bước
        c.dau.rotation.x = Math.max(0, Math.sin(t * (c.anVun > 0 ? 9 : 4) + c.mo)) * 0.9;
        if (Math.sin(t * 0.8 + c.mo * 2) > 0.85) { c.x += Math.sin(c.huong) * dt * 0.3; c.z += Math.cos(c.huong) * dt * 0.3; c.g.rotation.y = c.huong; c.x = Math.max(x1, Math.min(x2, c.x)); c.z = Math.max(z1, Math.min(z2, c.z)); }
        else if (rnd() < dt * 0.3) c.huong = rnd() * 6.28;
      }
      c.g.position.set(c.x, c.y, c.z);
    }
    // cá bơi qua lại trong bể
    for (const f of this.ca) { const u = f.userData, a = t * 0.6 + u.pha; f.position.set(Math.sin(a * 1.3) * 0.12, u.y + Math.sin(a * 2) * 0.04, Math.sin(a) * 0.45); f.rotation.y = Math.cos(a) > 0 ? 0 : Math.PI; u.vay.rotation.y = Math.sin(t * 12 + u.pha) * 0.5; }
  }
}
