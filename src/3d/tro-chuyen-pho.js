// Bắt chuyện với người ngoài phố: người đi bộ, người ngồi quán trà đá / cà phê cóc, người bán hàng, người chờ xe buýt,
// nhóm tán gẫu, chú xe ôm. Bấm E: người đó dừng lại quay sang (người ngồi thì quay đầu), nói một câu (bong bóng trên đầu),
// làm cử chỉ theo tâm trạng, vài giây sau đi tiếp. Bắt chuyện liền nhiều lần thì bực dần.
// Xe máy của người chơi lấn lên vỉa hè suýt tông: người đi bộ nhảy né sang bên, cằn nhằn.
import * as THREE from "three";
import { am } from "../am-thanh-game.js";
import { heSoDoc } from "../cai-dat.js";
import { cauNguoiPho, cauSuytTong } from "../loi-nguoi-pho.js";
import { chiTay, thaTay } from "./nguoi-pho.js";

const MAU = "#2e9a8a"; // viền bong bóng của người đi đường
const KIEU_DI = { thuong: "thuong", goi: "thuong", chup: "thuong", chay: "chay", cho: "cho", hs: "hs", quet: "quet", bua: "thuong" };
const TEN = {
  sieu_anh_hung: "siêu anh hùng", quy_do: "fan Quỷ Đỏ", long_chim: "chú xách lồng chim", khung_long: "khủng long", the_duc: "cô tập thể dục",
  shipper: "anh shipper", ngo_khong: "Tôn Ngộ Không", noel: "ông già Noel", cam_bang: "người cầm bảng", bong_bay: "em bé", chay: "người chạy bộ",
  cho: "người dắt chó", hs: "bé học sinh", quet: "cô lao công", ban_hang: "người bán hàng", xe_om: "chú xe ôm", xe_om_cn: "anh xe ôm",
  tra_da: "khách trà đá", ca_phe: "khách cà phê", hem: "người trong hẻm", cho_buyt: "người chờ xe buýt", tuong_bac: "tượng người bạc", tam: "nhóm tán gẫu",
};
const gocGiua = (a, b) => Math.atan2(Math.sin(b - a), Math.cos(b - a));
const kep = (v, a, b) => Math.max(a, Math.min(b, v));

export class TroChuyenPho {
  constructor(game) {
    this.g = game; this.gt = game.giaoThong;
    this.boc = new WeakMap(); // nhân vật -> vỏ cho bong bóng { nv, tang, mau }
    this.lan = new Map();     // người -> { n, t } số lần bị bắt chuyện liền
    this.viec = [];           // việc chờ trả lại tư thế cũ { het, f }
    // chú xe ôm ngồi chờ khách (khối tĩnh trong thành phố)
    this.xeOm = (game.theGioi.pho?.chiTiet?.xeOm || []).map(o => ({
      kieu: o.congNghe ? "xe_om_cn" : "xe_om", x: o.x, z: o.z,
      nv: { group: { position: new THREE.Vector3(o.x, 0, o.z), visible: true }, chieuCao: 1.75 },
    }));
    this._muc = { loai: "", p: null, nv: null, kieu: "", d: 0 };
  }
  bocCua(nv) { let b = this.boc.get(nv); if (!b) { b = { nv, tang: 0, mau: MAU }; this.boc.set(nv, b); } return b; }

  // người ngoài phố gần nhất trong tầm r; trả về { loai, p | nv, kieu, d } (dùng lại một đối tượng) hoặc null
  timGan(px, pz, r) {
    const gt = this.gt; if (!gt?.nhom.visible) return null;
    let tot = null, dMin = r;
    const xet = (loai, p, nv, kieu, x, z) => {
      const d = Math.hypot(x - px, z - pz); if (d >= dMin) return;
      dMin = d; tot = this._muc; tot.loai = loai; tot.p = p; tot.nv = nv; tot.kieu = kieu; tot.d = d;
    };
    for (const p of gt.nguoi) {
      if (p.an || p.khoaNgoai || !p.nv.group.visible) continue;
      const q = p.nv.group.position;
      xet("di", p, p.nv, p.kieu || (p.tt?.loai === "goi" ? "goi" : p.tt?.loai === "chup" ? "chup" : KIEU_DI[p.loai] || "thuong"), q.x, q.z);
    }
    for (const nv of gt.dungYen) {
      if (!nv.group.visible || nv._cho?.an) continue;
      const q = nv.group.position; xet("dung", null, nv, nv._cho?.kieu || "dung", q.x, q.z);
    }
    for (const n of gt.nhomNoi) {
      if (n.an) continue;
      for (const nv of n.ds) { if (!nv.group.visible) continue; const q = nv.group.position; xet("nhom", null, nv, "tam", q.x, q.z); }
    }
    for (const o of this.xeOm) xet("xe_om", null, o.nv, o.kieu, o.x, o.z);
    return tot;
  }
  nhan(muc) { return `Bắt chuyện với ${TEN[muc.kieu] || "người đi đường"}`; }

  // người chơi bấm E: trả về câu nói
  noi(muc) {
    const g = this.g, nv = muc.nv, khoa = muc.p || nv, q = nv.group.position;
    const ls = this.lan.get(khoa) || { n: 0, t: -99 };
    if (g.t - ls.t > 90) ls.n = 0;
    ls.n++; ls.t = g.t; this.lan.set(khoa, ls);
    if (this.lan.size > 60) for (const [k, v] of this.lan) if (g.t - v.t > 90) this.lan.delete(k);
    const { chu, tamTrang } = cauNguoiPho(muc.kieu, { gio: g.bauTroi.gio, mua: (g.bauTroi.tt?.mua || 0) > 0, vai: g.vai, lan: ls.n, laiXe: !!g.xeRieng?.dangLai, mon: nv._cho?.mon });
    const dai = kep(2 + chu.length * 0.08, 3, 8) * heSoDoc();
    const ra = Math.atan2(g.p.x - q.x, g.p.z - q.z); // hướng nhìn về người chơi
    this.quaySang(muc, ra, dai + 0.8, tamTrang === "ngai" && ls.n < 5);
    this.cuChi(nv, tamTrang, dai);
    const b = g.doiSong.noi(this.bocCua(nv), chu, dai, true);
    if (!b) g.onThongBao?.(`"${chu}"`);
    return chu;
  }
  // dừng lại, quay mặt về phía người chơi (người ngồi chỉ quay đầu); ngai: quay đi chỗ khác
  quaySang(muc, ra, giay, ne = false) {
    const nv = muc.nv, g = this.g;
    if (muc.loai === "di") {
      const p = muc.p;
      if (p.tt) this.gt.xongViec(p);
      p.noi = { t: giay, goc: ne ? ra + Math.PI * 0.6 : ra };
      return;
    }
    if (muc.loai === "xe_om" || muc.kieu === "tuong_bac") return;
    if (muc.loai === "dung" && nv._cho?.ngoi) { // ngồi ghế: quay đầu
      const goc = gocGiua(nv.group.rotation.y, ne ? ra + 1.6 : ra);
      nv.quayDau = kep(goc, -1.0, 1.0);
      this.hen(giay, () => { nv.quayDau = 0; });
      return;
    }
    const goc0 = muc.loai === "nhom" ? nv._huong0 ?? nv.group.rotation.y : nv._cho?.huong ?? nv.group.rotation.y;
    nv.group.rotation.y = ne ? ra + Math.PI * 0.6 : ra;
    this.hen(giay, () => { nv.group.rotation.y = goc0; });
    void g;
  }
  cuChi(nv, tt, dai) {
    const q = nv.group.position, cu = (l, d) => nv.lamCu?.(l, d);
    switch (tt) {
      case "vui": cu("cuoi"); am.phat("cuoi", q.x, q.z); break;
      case "buon": cu("lac_dau", 1.6); am.phat("u_hu", q.x, q.z); break;
      case "buc": cu("noi", Math.min(dai, 3)); am.phat("u_hu", q.x, q.z); this.chi(nv, 0.12, 1.32, 0.75, 1.4); break;
      case "ngai": cu("gai_dau"); am.phat("hoi", q.x, q.z); break;
      case "hoi": cu("noi", Math.min(dai, 3)); am.phat("hoi", q.x, q.z); this.chi(nv, 0.7, 1.25, 0.35, 1.6); break;
      case "moi": if ("vietTay" in nv) { nv.vietTay = 1; this.hen(1.6, () => { nv.vietTay = 0; }); } am.phat("hoi", q.x, q.z); break;
      case "triet_ly": cu("gat_dau", 1.6); break;
      case "tam": cu("noi", Math.min(dai, 3)); am.phat("hoi", q.x, q.z); break;
    }
  }
  // chỉ tay (toạ độ khung nhân vật) một lúc rồi buông; tay đang cầm ô, cờ, điện thoại thì thôi
  chi(nv, x, y, z, giay) {
    const tay = nv.tayP; if (!tay || tay.userData.coDinh || nv.ngoi) return;
    chiTay(tay, x, y, z);
    this.hen(giay, () => thaTay(tay));
  }
  hen(giay, f) { this.viec.push({ het: this.g.t + giay, f }); }
  capNhat() {
    if (!this.viec.length) return;
    const t = this.g.t;
    for (let i = this.viec.length - 1; i >= 0; i--) if (this.viec[i].het <= t) { const v = this.viec[i]; this.viec.splice(i, 1); v.f(); }
  }
  // xe của người chơi lấn vào người đi bộ / người đứng: né, cằn nhằn (mỗi người lâu lâu mới kêu một lần)
  suytTong(muc, xeX, xeZ) {
    const g = this.g, nv = muc.nv, khoa = muc.p || nv;
    if ((khoa._kenLuc ?? -99) > g.t - 4) return;
    khoa._kenLuc = g.t;
    const q = nv.group.position, ra = Math.atan2(xeX - q.x, xeZ - q.z);
    if (muc.loai === "di") {
      const p = muc.p, l = p.l;
      const lat = l.truc === "x" ? xeZ - (l.co + p.lechHt) : xeX - (l.co + p.lechHt);
      p.lech = kep(p.lechHt - Math.sign(lat || 1) * 0.9, l.bien[0] - 0.2, l.bien[1] + 0.2); p.ne = 0.45;
      if (p.tt) this.gt.xongViec(p);
      p.noi = { t: 2.6, goc: ra };
    } else if (muc.loai === "dung" && nv._cho?.ngoi) { nv.quayDau = kep(gocGiua(nv.group.rotation.y, ra), -1, 1); this.hen(2.6, () => { nv.quayDau = 0; }); }
    const chu = cauSuytTong(), dai = kep(2 + chu.length * 0.08, 3, 6) * heSoDoc();
    this.cuChi(nv, "buc", dai);
    g.doiSong.noi(this.bocCua(nv), chu, dai, true);
  }
  // dọn: trả mọi người về tư thế cũ (dịch chuyển đi nơi khác, cấp cứu)
  traHet() { for (const v of this.viec.splice(0)) v.f(); }
}
