// Giao thông: xe máy, ô tô, taxi, xe buýt chạy theo làn, dừng đèn đỏ, giữ khoảng cách, thắng khi người chơi đứng trước đầu xe.
// Người đi bộ qua lại trên vỉa hè; người ngồi quán, người bán hàng đứng yên.
import * as THREE from "three";
import { taoXeMay, taoOto, taoXeBuyt, MAU_XE } from "./xe-3d.js";
import { taoNguoiNgauNhien, taoNguoiLaiXe } from "./nhan-vat-3d.js";

const CHU_KY = [["chinh", "xanh", 16], ["chinh", "vang", 3], ["ngang", "xanh", 13], ["ngang", "vang", 3]];

export class GiaoThong {
  constructor(scene, pho, { dienThoai = false } = {}) {
    this.scene = scene; this.pho = pho;
    const rnd = pho.rnd, chon = a => a[Math.floor(rnd() * a.length)];
    this.nhom = new THREE.Group(); scene.add(this.nhom);
    this.xe = [];
    this.tg = 0; this.pha = 0;
    const he = dienThoai ? 0.5 : 1;
    // tạo xe theo từng làn
    for (const lan of pho.lan) {
      const dai = lan.den - lan.tu;
      const soXeMay = Math.round((lan.truc === "x" ? 16 : 10) * he), soOto = Math.round((lan.truc === "x" ? 5 : 3) * he);
      const ds = [];
      for (let i = 0; i < soXeMay; i++) ds.push("xeMay");
      for (let i = 0; i < soOto; i++) ds.push(rnd() < 0.25 ? "taxi" : "oto");
      if (lan.truc === "x") ds.push("buyt");
      ds.sort(() => rnd() - 0.5);
      ds.forEach((loai, i) => {
        const g = new THREE.Group();
        let dai2 = 1.8, toc = 9 + rnd() * 4, ngang = lan.oto;
        if (loai === "xeMay") {
          const xm = taoXeMay(chon(MAU_XE), rnd() < 0.5 ? "ga" : "so"); g.add(xm);
          const xeOm = rnd() < 0.15;
          const lx = taoNguoiLaiXe(rnd, { aoXeOm: xeOm }); lx.position.set(0, 0.86, -0.18); g.add(lx);
          if (rnd() < 0.35) { const sau = taoNguoiLaiXe(rnd, { sau: true }); sau.position.set(0, 0.9, -0.62); g.add(sau); }
          ngang = lan.xeMay + (rnd() - 0.5) * 1.6; toc = 8 + rnd() * 5; dai2 = 1.7;
        } else if (loai === "buyt") { g.add(taoXeBuyt()); dai2 = 10.8; toc = 7.5; ngang = lan.oto; }
        else { g.add(taoOto(loai === "taxi" ? 0xf2f2f2 : chon(MAU_XE), { taxi: loai === "taxi" })); dai2 = 4.3; toc = 10 + rnd() * 3; }
        const s = lan.tu + (i + rnd() * 0.6) * dai / ds.length;
        const xe = { g, lan, s, ngang, v: toc, vMax: toc, dai: dai2, loai };
        g.rotation.y = lan.truc === "x" ? (lan.huong > 0 ? Math.PI / 2 : -Math.PI / 2) : (lan.huong > 0 ? 0 : Math.PI);
        this.datViTriXe(xe);
        this.nhom.add(g); this.xe.push(xe);
      });
    }
    // người đi bộ
    this.nguoi = [];
    const soNguoi = Math.round(30 * he);
    const loiDi = pho.loiDi;
    for (let i = 0; i < soNguoi; i++) {
      const l = loiDi[i % loiDi.length];
      const nv = taoNguoiNgauNhien(rnd, { them: rnd() < 0.08 ? ["nonLa"] : [] });
      const p = { nv, l, s: l.tu + rnd() * (l.den - l.tu), huong: rnd() < 0.5 ? 1 : -1, toc: 1.0 + rnd() * 0.5, lech: (rnd() - 0.5) * 1.2, cho: 0 };
      this.nhom.add(nv.group); this.nguoi.push(p);
    }
    // người đứng / ngồi một chỗ (quán trà đá, bán hàng, chờ xe buýt)
    this.dungYen = [];
    for (const c of pho.choNguoiDung.slice(0, dienThoai ? 8 : 22)) {
      const nv = taoNguoiNgauNhien(rnd, { them: c.them || [] });
      nv.group.position.set(c.x, c.ngoi ? -0.38 : 0, c.z); nv.group.rotation.y = c.huong;
      this.nhom.add(nv.group); this.dungYen.push(nv);
    }
  }
  // điểm (x, z) có nằm trong thân xe nào không (người chơi không đi xuyên xe)
  chan(px, pz) {
    for (const x of this.xe) {
      const rong = x.loai === "xeMay" ? 0.45 : x.loai === "buyt" ? 1.5 : 1.15;
      const p = x.g.position;
      const doc = x.lan.truc === "x" ? Math.abs(px - p.x) : Math.abs(pz - p.z);
      const ngang = x.lan.truc === "x" ? Math.abs(pz - p.z) : Math.abs(px - p.x);
      if (doc < x.dai / 2 + 0.3 && ngang < rong + 0.3) return true;
    }
    return false;
  }
  datViTriXe(xe) {
    const { lan, g } = xe;
    if (lan.truc === "x") g.position.set(xe.s, 0, xe.ngang); else g.position.set(xe.ngang, 0, xe.s);
  }
  // trạng thái đèn: mỗi nhóm "xanh" | "vang" | "do"
  trangThaiDen() {
    const [nhom, mau] = CHU_KY[this.pha];
    return { chinh: nhom === "chinh" ? mau : "do", ngang: nhom === "ngang" ? mau : "do" };
  }
  capNhat(dt, t, nguoiChoi, hien) {
    this.nhom.visible = hien;
    // đèn giao thông
    this.tg += dt;
    if (this.tg > CHU_KY[this.pha][2]) { this.tg = 0; this.pha = (this.pha + 1) % CHU_KY.length; }
    const tt = this.trangThaiDen();
    for (const k of ["chinh", "ngang"]) for (const m of ["do", "vang", "xanh"]) {
      const vlDen = this.pho.denGT[k][m]; vlDen.color.setHex(tt[k] === m ? vlDen.userData.bat : 0x222222);
    }
    if (!hien) return;
    // xe: sắp theo làn để biết xe phía trước
    const theoLan = new Map();
    for (const x of this.xe) { if (!theoLan.has(x.lan)) theoLan.set(x.lan, []); theoLan.get(x.lan).push(x); }
    for (const [lan, ds] of theoLan) {
      ds.sort((a, b) => (a.s - b.s) * lan.huong);
      for (let i = 0; i < ds.length; i++) {
        const x = ds[i];
        const dau = x.s + lan.huong * x.dai / 2;
        let vMuc = x.vMax;
        // xe phía trước (cùng làn, xét cả làn xe máy và ô tô gần nhau)
        const truoc = ds[i + 1];
        if (truoc && Math.abs(truoc.ngang - x.ngang) < (x.loai === "xeMay" && truoc.loai === "xeMay" ? 1.0 : 2.2)) {
          const kc = (truoc.s - x.s) * lan.huong - (truoc.dai + x.dai) / 2;
          if (kc < 2) vMuc = 0; else if (kc < 8) vMuc = Math.min(vMuc, truoc.v * 0.9 + (kc - 2));
        }
        // đèn đỏ / vàng: dừng trước vạch
        const den = tt[lan.nhom];
        const kcVach = (lan.dung - dau) * lan.huong;
        if (den !== "xanh" && kcVach > -0.5 && kcVach < 14) vMuc = Math.min(vMuc, Math.max(0, (kcVach - 0.4) * 1.2));
        // người chơi đứng trước đầu xe
        if (nguoiChoi.tang === 0) {
          const doc = lan.truc === "x" ? (nguoiChoi.x - dau) * lan.huong : (nguoiChoi.z - dau) * lan.huong;
          const ngang = lan.truc === "x" ? Math.abs(nguoiChoi.z - x.ngang) : Math.abs(nguoiChoi.x - x.ngang);
          if (doc > -0.3 && doc < 7 && ngang < (x.loai === "xeMay" ? 1.0 : 1.6)) vMuc = Math.min(vMuc, Math.max(0, (doc - 1.2) * 1.5));
        }
        x.v += (vMuc - x.v) * Math.min(1, dt * (vMuc < x.v ? 5 : 1.2));
        x.s += x.v * dt * lan.huong;
        if (lan.huong > 0 && x.s > lan.den) x.s = lan.tu; else if (lan.huong < 0 && x.s < lan.tu) x.s = lan.den;
        this.datViTriXe(x);
        x.g.visible = Math.abs(x.g.position.x - nguoiChoi.x) + Math.abs(x.g.position.z - nguoiChoi.z) < 120;
        // xe máy lắc nhẹ khi chạy
        if (x.loai === "xeMay") x.g.rotation.z = Math.sin(t * 2 + x.s) * 0.03 * (x.v / x.vMax);
      }
    }
    // người đi bộ
    for (const p of this.nguoi) {
      const l = p.l;
      let x = l.truc === "x" ? p.s : l.co + p.lech, z = l.truc === "x" ? l.co + p.lech : p.s;
      const gan = nguoiChoi.tang === 0 && Math.hypot(nguoiChoi.x - x, nguoiChoi.z - z) < 1.1;
      const dangDi = !gan && p.cho <= 0;
      if (p.cho > 0) p.cho -= dt;
      if (dangDi) {
        p.s += p.toc * dt * p.huong;
        if (p.s > l.den || p.s < l.tu) { p.huong *= -1; p.s = Math.max(l.tu, Math.min(l.den, p.s)); p.cho = 1 + Math.random() * 3; }
        x = l.truc === "x" ? p.s : l.co + p.lech; z = l.truc === "x" ? l.co + p.lech : p.s;
      }
      p.nv.group.position.set(x, 0, z);
      p.nv.group.visible = Math.abs(x - nguoiChoi.x) + Math.abs(z - nguoiChoi.z) < 70;
      p.nv.group.rotation.y = l.truc === "x" ? (p.huong > 0 ? Math.PI / 2 : -Math.PI / 2) : (p.huong > 0 ? 0 : Math.PI);
      p.nv.hoatDong(t + p.toc * 10, dangDi, p.toc);
    }
    for (const nv of this.dungYen) nv.hoatDong(t, false);
  }
}
