// Giao thông: xe máy, ô tô, taxi, xe buýt chạy theo làn, dừng đèn đỏ, giữ khoảng cách, thắng khi người chơi đứng trước đầu xe.
// Ban đêm bật đèn pha (chùm sáng trên mặt đường, quầng đèn), đèn hậu sáng hơn khi thắng; khuya đèn vàng nhấp nháy, xe thưa.
// Người đi bộ qua lại trên vỉa hè, né cột điện, gốc cây, xe đẩy; ghé xe hàng mua đồ, nghe điện thoại, chụp ảnh,
// dắt chó, chạy bộ sáng sớm, học sinh tan trường, lao công quét đường tối; mưa thì cầm ô, mặc áo mưa, người thưa bớt.
import * as THREE from "three";
import { taoXeMay, taoOto, taoXeBuyt, MAU_XE, DEN_XE } from "./xe-3d.js";
import { taoNguoiNgauNhien, taoNguoiLaiXe } from "./nhan-vat-3d.js";
import { taoNguoiBua, fanQuyDo, tuongBac, phuKienXeMay } from "./nguoi-bua.js";
import { themO, themAoMua, themDienThoai, themTui, taoNguoiDatCho, taoNguoiChayBo, taoHocSinh, taoLaoCong, aoMuaXeMay } from "./nguoi-pho.js";
import { vlCong, vlDiem, ganDiem, ganSuong, texChum, texTron, trongGio } from "./chi-tiet-pho.js";

const duoiDuong = (x, z) => (z > 32.5 && z < 41.5) || (x > 47 && x < 57 && z > -130 && z < 160);
const CHU_KY = [["chinh", "xanh", 16], ["chinh", "vang", 3], ["ngang", "xanh", 13], ["ngang", "vang", 3]];
const MAU_SO = { xanh: "#3aff6a", vang: "#ffc23a", do: "#ff3a2a" };
const kep = (v, a, b) => Math.max(a, Math.min(b, v));

// độ sáng ban ngày theo giờ (giống cách bầu trời tính vị trí mặt trời)
function doNgay(h) {
  const goc = ((h - 5.75) / 12.5) * Math.PI;
  return kep(Math.sin(goc) / 1.0595 * 3 + 0.2, 0, 1);
}

export class GiaoThong {
  constructor(scene, pho, { dienThoai = false } = {}) {
    this.scene = scene; this.pho = pho;
    const rnd = pho.rnd, chon = a => a[Math.floor(rnd() * a.length)];
    let seed2 = 9091; const rnd2 = () => (seed2 = (seed2 * 16807) % 2147483647) / 2147483647;
    this.nhom = new THREE.Group(); scene.add(this.nhom);
    this.xe = [];
    this.tg = 0; this.pha = 0;
    this._mt = null;
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
        let dai2 = 1.8, toc = 9 + rnd() * 4, ngang = lan.oto, ao = null;
        if (loai === "xeMay") {
          const xm = taoXeMay(chon(MAU_XE), rnd() < 0.5 ? "ga" : "so"); g.add(xm);
          const xeOm = rnd() < 0.15;
          const lx = taoNguoiLaiXe(rnd, { aoXeOm: xeOm }); lx.position.set(0, 0.86, -0.18); g.add(lx);
          const coSau = rnd() < 0.35;
          if (coSau) { const sau = taoNguoiLaiXe(rnd, { sau: true }); sau.position.set(0, 0.9, -0.62); g.add(sau); }
          if (!xeOm && rnd() < 0.12) { const pk = phuKienXeMay(rnd); g.add(pk); g.userData.pk = pk; } // áo choàng siêu nhân / cờ Quỷ Đỏ
          if (rnd2() < 0.9) { ao = aoMuaXeMay(rnd2, coSau); g.add(ao); }
          ngang = lan.xeMay + (rnd() - 0.5) * 0.9; // không chạy sát mép vỉa hè
        } else if (loai === "buyt") { g.add(taoXeBuyt()); dai2 = 10.8; toc = 7.5; ngang = lan.oto; }
        else { g.add(taoOto(loai === "taxi" ? 0xf2f2f2 : chon(MAU_XE), { taxi: loai === "taxi" })); dai2 = 4.3; toc = 10 + rnd() * 3; }
        const s = lan.tu + (i + rnd() * 0.6) * dai / ds.length;
        const xe = { g, lan, s, ngang, v: toc, vMax: toc, dai: dai2, loai, ao, hat: rnd2(), bat: true, led: rnd2() < 0.45, thang: 0 };
        g.rotation.y = lan.truc === "x" ? (lan.huong > 0 ? Math.PI / 2 : -Math.PI / 2) : (lan.huong > 0 ? 0 : Math.PI);
        this.datViTriXe(xe);
        this.nhom.add(g); this.xe.push(xe);
      });
    }
    // người đi bộ: khoảng một phần ba là dân "độc lạ" (siêu anh hùng tự phong, hội Quỷ Đỏ đi thành nhóm...)
    this.nguoi = [];
    const soNguoi = Math.round(30 * he);
    const loiDi = pho.loiDi;
    // vật cản trên từng lối đi (cột điện, gốc cây, xe hàng, bàn ghế quán cóc...) để người đi bộ né
    for (const l of loiDi) {
      l.bien ||= [-0.6, 0.6]; l.vc = []; l.xeHang = [];
      for (const o of pho.vatCanDiBo || []) {
        const s = l.truc === "x" ? o.x : o.z, lat = (l.truc === "x" ? o.z : o.x) - l.co;
        if (Math.abs(lat) < 1.7 && s > l.tu - 2 && s < l.den + 2) l.vc.push({ s, lat, r: o.r });
      }
      for (const d of pho.diemMua || []) {
        const s = l.truc === "x" ? d.x : d.z, lat = (l.truc === "x" ? d.z : d.x) - l.co;
        if (Math.abs(lat) < 1.2 && s > l.tu && s < l.den) l.xeHang.push({ s, lat, x: d.x, z: d.z });
      }
    }
    const them = (nv, l, s, huong, toc, lech, tuyChon = {}) => {
      const p = { nv, l, s, huong, toc, lech: kep(lech, l.bien[0], l.bien[1]), cho: 0, loai: "bua", gio: [[7, 21.5]], chiuMua: false, hen: 6 + rnd2() * 20, tt: null, an: false, muon: true, ...tuyChon };
      p.lechHt = p.lech;
      this.nhom.add(nv.group); this.nguoi.push(p); return p;
    };
    // người thường: có ô hoặc áo mưa, có người hay nghe điện thoại, có người thích chụp ảnh
    const nguoiThuong = (l, s, huong, toc, lech) => {
      const nv = taoNguoiNgauNhien(rnd, { them: rnd() < 0.08 ? ["nonLa"] : [] });
      const r = rnd2();
      const p = them(nv, l, s, huong, toc, lech, { loai: r < 0.16 ? "goi" : r < 0.26 ? "chup" : "thuong", gio: rnd2() < 0.25 ? [[5, 25.5]] : [[5.5, 22.5]] });
      const rm = rnd2();
      if (rm < 0.45) p.o = themO(nv, rnd2); else if (rm < 0.7) p.aoMua = themAoMua(nv, rnd2);
      p.chiuMua = !!(p.o || p.aoMua);
      if (p.loai !== "thuong") p.dt = themDienThoai(nv);
      p.tui = themTui(nv, rnd2);
      return p;
    };
    for (let i = 0; this.nguoi.length < soNguoi; i++) {
      const l = loiDi[i % loiDi.length];
      const s = l.tu + rnd() * (l.den - l.tu), huong = rnd() < 0.5 ? 1 : -1, toc = 1.0 + rnd() * 0.5, lech = (rnd() - 0.5) * 1.2;
      const r = rnd();
      if (r < 0.08 && this.nguoi.length + 3 <= soNguoi) {
        // nhóm cổ động viên Quỷ Đỏ đi cùng nhau
        for (let k = 0; k < 3; k++) them(fanQuyDo(rnd, { coCo: k === 0 }), l, Math.max(l.tu, Math.min(l.den, s - huong * k * 1.1)), huong, 1.15, (k - 1) * 0.55, { gio: [[8, 23]] });
      } else if (r < 0.36) them(taoNguoiBua(rnd).nv, l, s, huong, toc * 0.9, lech);
      else nguoiThuong(l, s, huong, toc, lech);
    }
    // người chạy bộ sáng sớm (5:30 - 7:30) trên vỉa hè đường Hóng
    for (let i = 0; i < Math.round(3 * he + 0.4); i++) {
      const l = loiDi[i % 5];
      them(taoNguoiChayBo(rnd2), l, l.tu + rnd2() * (l.den - l.tu), rnd2() < 0.5 ? 1 : -1, 2.3 + rnd2() * 0.5, (rnd2() - 0.5) * 0.6, { loai: "chay", gio: [[5.5, 7.5]] });
    }
    // dắt chó đi dạo sáng sớm và chiều tối
    for (let i = 0; i < Math.max(1, Math.round(2 * he)); i++) {
      const l = loiDi[[3, 9][i % 2]];
      them(taoNguoiDatCho(rnd2), l, l.tu + rnd2() * (l.den - l.tu), 1, 0.75, 0, { loai: "cho", gio: [[5.5, 8.5], [17, 20.5]] });
    }
    // học sinh tan trường đi thành nhóm (16:30 - 17:30), có phụ huynh đi kèm; mưa thì mặc áo mưa
    for (const [li, so, s0] of [[3, 4, -60], [1, 3, 30]].slice(0, dienThoai ? 1 : 2)) {
      const l = loiDi[li];
      for (let k = 0; k < so; k++) {
        const p = them(taoHocSinh(rnd2), l, s0 - k * 0.9, 1, 1.0, ((k % 2) - 0.5) * 0.7, { loai: "hs", gio: [[16.5, 17.6]], chiuMua: true });
        p.aoMua = themAoMua(p.nv, rnd2);
      }
      const ph = nguoiThuong(l, s0 - so * 0.9 - 0.6, 1, 1.0, 0); ph.gio = [[16.5, 17.6]]; ph.loai = "thuong";
    }
    // lao công quét đường dọc mép đường (tối và sáng sớm)
    const lQuet = { truc: "x", co: 41.2, tu: -140, den: 38, bien: [0, 0], vc: [], xeHang: [] };
    this.laoCong = them(taoLaoCong(rnd2), lQuet, -60, 1, 0.3, 0, { loai: "quet", gio: [[18.5, 22], [4.5, 6.2]] });
    for (const p of this.nguoi) { p.lech = kep(p.lech, p.l.bien[0], p.l.bien[1]); p.lechHt = p.lech; }

    // người đứng / ngồi một chỗ (quán trà đá, bán hàng, chờ xe buýt, cà phê cóc, ngồi trước nhà trong hẻm)
    this.dungYen = [];
    const ngoiCho = (c, coLy) => {
      const nv = taoNguoiNgauNhien(rnd, { them: c.them || [] });
      nv.group.position.set(c.x, c.ngoi ? -0.42 : 0, c.z); nv.group.rotation.y = c.huong;
      if (c.ngoi && "ngoi" in nv) {
        nv.ngoi = "nghi"; // ngồi thật trên ghế nhựa: co chân, tay để lên đùi
        if (coLy) { const ly = new THREE.Mesh(new THREE.CylinderGeometry(0.045, 0.04, 0.12, 8), new THREE.MeshLambertMaterial({ color: c.loai === "caPhe" ? 0x5a3a22 : 0xc89a5a, transparent: true, opacity: 0.85 })); ly.position.set(0, -0.7, 0.07); nv.tayP.add(ly); }
      }
      // dungYen vẫn là danh sách nhân vật (game3d đọc nv.group); giờ giấc, chỗ ngồi gắn thêm vào _cho
      nv._cho = { gio: c.gio || [[0, 24]], x: c.x, z: c.z, an: false, chiuMua: !!c.mai };
      this.nhom.add(nv.group); this.dungYen.push(nv);
    };
    for (const c of pho.choNguoiDung.slice(0, dienThoai ? 8 : 22)) ngoiCho({ ...c, mai: true }, rnd() < 0.7);
    for (const c of (pho.choNgoi || []).filter((_, i) => !dienThoai || i % 2 === 0)) ngoiCho(c, c.loai === "caPhe" || rnd2() < 0.4);
    // tượng người bạc đứng biểu diễn trên vỉa hè
    for (const [x, z, h] of [[-62, 31.1, 0], [86, 43.0, Math.PI]]) { const t = tuongBac(); t.group.position.x = x; t.group.position.z = z; t.group.rotation.y = h; t._cho = { gio: [[8, 20]], x, z, an: false }; this.nhom.add(t.group); this.dungYen.push(t); }
    // nhóm tụ tập tán gẫu: đứng quay vào nhau, người nói khua tay, người nghe gật gù, lâu lâu cười
    this.nhomNoi = [];
    for (const c of (pho.nhomNoi || []).slice(0, dienThoai ? 2 : 4)) {
      const so = dienThoai ? 2 : 3, ds = [];
      for (let k = 0; k < so; k++) {
        const a = (k / so) * Math.PI * 2 + rnd2(), x = c.x + Math.sin(a) * 0.58, z = c.z + Math.cos(a) * 0.58;
        const nv = taoNguoiNgauNhien(rnd2); nv.group.position.set(x, 0, z); nv.group.rotation.y = Math.atan2(c.x - x, c.z - z);
        this.nhom.add(nv.group); ds.push(nv);
      }
      this.nhomNoi.push({ ds, gio: c.gio, x: c.x, z: c.z, an: false, nguoiNoi: 0, doi: 0 });
    }

    // ---------- Đèn xe ban đêm: chùm pha trên mặt đường + quầng đèn (mỗi loại một lượt vẽ) ----------
    const N = this.xe.length;
    this.chum = { pos: new Float32Array(N * 2 * 6 * 3), uv: new Float32Array(N * 2 * 6 * 2), mau: new Float32Array(N * 2 * 6 * 3) };
    const gc = new THREE.BufferGeometry();
    gc.setAttribute("position", new THREE.BufferAttribute(this.chum.pos, 3).setUsage(THREE.DynamicDrawUsage));
    gc.setAttribute("uv", new THREE.BufferAttribute(this.chum.uv, 2).setUsage(THREE.DynamicDrawUsage));
    gc.setAttribute("mauDinh", new THREE.BufferAttribute(this.chum.mau, 3).setUsage(THREE.DynamicDrawUsage));
    this.vlChum = vlCong(texChum()); this.vlDoSau = vlCong(texTron());
    // pha (texChum) và vệt đỏ sau xe (texTron) dùng hai khối riêng
    this.meChum = ganSuong(new THREE.Mesh(gc, this.vlChum)); this.meChum.frustumCulled = false; this.meChum.renderOrder = 2;
    const gs = gc.clone(); this.sau = { pos: gs.attributes.position.array, uv: gs.attributes.uv.array, mau: gs.attributes.mauDinh.array, geo: gs };
    for (const k of ["position", "uv", "mauDinh"]) gs.attributes[k].setUsage(THREE.DynamicDrawUsage);
    this.meSau = ganSuong(new THREE.Mesh(gs, this.vlDoSau)); this.meSau.frustumCulled = false; this.meSau.renderOrder = 2;
    const M = N * 3 + 2;
    const gp = new THREE.BufferGeometry();
    gp.setAttribute("position", new THREE.BufferAttribute(new Float32Array(M * 3), 3).setUsage(THREE.DynamicDrawUsage));
    gp.setAttribute("kc", new THREE.BufferAttribute(new Float32Array(M), 1).setUsage(THREE.DynamicDrawUsage));
    gp.setAttribute("mauDinh", new THREE.BufferAttribute(new Float32Array(M * 3), 3).setUsage(THREE.DynamicDrawUsage));
    this.diemXe = ganDiem(new THREE.Points(gp, vlDiem())); this.diemXe.frustumCulled = false; this.diemXe.renderOrder = 3;
    this.nhom.add(this.meChum, this.meSau, this.diemXe);
    // quầng đèn giao thông (màu theo pha)
    const vt = pho.denGT.viTri || [];
    const gt = new THREE.BufferGeometry();
    gt.setAttribute("position", new THREE.Float32BufferAttribute(vt.flatMap(d => [d.x, d.y, d.z]), 3));
    gt.setAttribute("kc", new THREE.BufferAttribute(new Float32Array(vt.length), 1));
    gt.setAttribute("mauDinh", new THREE.Float32BufferAttribute(vt.flatMap(d => new THREE.Color(pho.denGT[d.nhom][d.mau].userData.bat).toArray()), 3));
    this.diemGT = ganDiem(new THREE.Points(gt, vlDiem())); this.diemGT.renderOrder = 3; this.nhom.add(this.diemGT);
    this._kt = 0;
  }

  // game3d gọi mỗi khung hình: { gio, ngay, mua, uot, sang } lấy từ bầu trời
  datMoiTruong(mt) { this._mt = mt; }
  moiTruong() {
    let m = this._mt;
    if (!m) { const b = globalThis.__g3d?.bauTroi; m = b ? { gio: b.gio, mua: b.tt.mua, uot: b.uot, sang: b.tt.sang } : { gio: 12, mua: 0, uot: 0, sang: 1 }; }
    const gio = ((m.gio % 24) + 24) % 24, ngay = m.ngay ?? doNgay(gio);
    const toi = kep((0.62 - ngay) / 0.42, 0, 1), u = 1 - (m.sang ?? 1), mua = (m.mua || 0) / 2600;
    return {
      gio, ngay, toi, u, uot: m.uot || 0, mua, coMua: mua > 0.05, muaTo: mua > 0.6,
      denDuong: toi > 0.06 ? Math.min(1, toi * 1.5) : 0,
      denXe: Math.max(toi, mua > 0.05 ? 0.7 : 0, u > 0.45 ? 0.45 : 0),
    };
  }

  // điểm (x, z) có nằm trong thân xe nào không (người chơi không đi xuyên xe)
  chan(px, pz) {
    for (const x of this.xe) {
      if (!x.bat) continue;
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
  // trạng thái đèn: mỗi nhóm "xanh" | "vang" | "do"; khuya (23h - 5h) đèn vàng nhấp nháy
  trangThaiDen() {
    if (this.nhay) return { chinh: "nhay", ngang: "nhay" };
    const [nhom, mau] = CHU_KY[this.pha];
    return { chinh: nhom === "chinh" ? mau : "do", ngang: nhom === "ngang" ? mau : "do" };
  }
  // số giây còn lại của màu đèn hiện tại theo từng hướng
  conLai(k) {
    let con = CHU_KY[this.pha][2] - this.tg;
    if (CHU_KY[this.pha][0] === k) return con;
    for (let j = (this.pha + 1) % 4; !(CHU_KY[j][0] === k && CHU_KY[j][1] === "xanh"); j = (j + 1) % 4) con += CHU_KY[j][2];
    return con;
  }
  veDemNguoc(tt) {
    for (const k of ["chinh", "ngang"]) {
      const d = this.pho.denGT.dem?.[k]; if (!d) continue;
      const so = this.nhay ? "" : String(Math.max(1, Math.ceil(this.conLai(k)))).padStart(2, "0"), mau = MAU_SO[tt[k]] || "#ffc23a";
      const key = so + mau; if (d.so === key) continue; d.so = key;
      const g = d.c.getContext("2d"); g.fillStyle = "#0b0b0c"; g.fillRect(0, 0, 128, 64);
      g.fillStyle = "rgba(255,255,255,.05)"; g.font = "700 54px ui-monospace, monospace"; g.textAlign = "center"; g.textBaseline = "middle"; g.fillText("88", 64, 35);
      g.fillStyle = mau; g.shadowColor = mau; g.shadowBlur = 10; g.fillText(so, 64, 35); g.shadowBlur = 0;
      d.t.needsUpdate = true;
    }
  }

  capNhat(dt, t, nguoiChoi, hien) {
    this.nhom.visible = hien && !this.anTam; // ẩn tạm trong cảnh cấp cứu
    const mt = this.moiTruong();
    this.pho.DEM?.capNhat(mt); this.pho.chiTiet?.capNhat(mt);
    // đèn giao thông
    this.nhay = mt.gio >= 23 || mt.gio < 5;
    this.tg += dt;
    if (this.tg > CHU_KY[this.pha][2]) { this.tg = 0; this.pha = (this.pha + 1) % CHU_KY.length; }
    const tt = this.trangThaiDen();
    const chop = Math.floor(t * 1.4) % 2 === 0;
    for (const k of ["chinh", "ngang"]) for (const m of ["do", "vang", "xanh"]) {
      const vlDen = this.pho.denGT[k][m]; const bat = tt[k] === m || (tt[k] === "nhay" && m === "vang" && chop);
      vlDen.color.setHex(bat ? vlDen.userData.bat : 0x222222);
    }
    this.veDemNguoc(tt);
    if (!hien) return;
    const kc = this.diemGT.geometry.attributes.kc;
    (this.pho.denGT.viTri || []).forEach((d, i) => { kc.array[i] = (tt[d.nhom] === d.mau || (tt[d.nhom] === "nhay" && d.mau === "vang" && chop)) ? 0.75 : 0; });
    kc.needsUpdate = true; this.diemGT.material.uniforms.doSang.value = 0.35 + mt.toi * 0.65;
    // mật độ xe theo giờ: khuya thưa, mưa to bớt xe máy; xe buýt nghỉ đêm
    const h = mt.gio;
    const matDo = trongGio(h, [[6, 22]]) ? 1 : trongGio(h, [[22, 23]]) ? 0.7 : trongGio(h, [[5, 6]]) ? 0.55 : 0.28;
    this._kt -= dt; const kiemTra = this._kt <= 0; if (kiemTra) this._kt = 0.5;
    if (kiemTra) for (const x of this.xe) {
      const muon = x.loai === "buyt" ? trongGio(h, [[5, 22]]) : x.hat < matDo * (x.loai === "xeMay" && mt.muaTo ? 0.75 : 1);
      if (muon !== x.bat && Math.abs(x.g.position.x - nguoiChoi.x) + Math.abs(x.g.position.z - nguoiChoi.z) > 70) x.bat = muon;
      if (x.ao && x.ao.visible !== mt.coMua) x.ao.visible = mt.coMua;
    }
    // xe: sắp theo làn để biết xe phía trước
    const theoLan = new Map();
    for (const x of this.xe) { if (!theoLan.has(x.lan)) theoLan.set(x.lan, []); if (x.bat) theoLan.get(x.lan).push(x); }
    // xe đang ở trong giao lộ (để nhường nhau khi đèn vàng nhấp nháy)
    const trongNgaTu = { chinh: false, ngang: false };
    if (this.nhay) for (const x of this.xe) if (x.bat) { const p = x.g.position; if (p.x > 45.5 && p.x < 58.5 && p.z > 31 && p.z < 43) trongNgaTu[x.lan.nhom] = true; }
    const hsMua = mt.coMua ? 0.85 : 1;
    for (const x of this.xe) if (!x.bat) {
      // xe đang "nghỉ" vẫn trôi theo làn (ẩn), để lúc bật lại phân bố tự nhiên
      x.s += x.vMax * dt * x.lan.huong;
      if (x.lan.huong > 0 && x.s > x.lan.den) x.s = x.lan.tu; else if (x.lan.huong < 0 && x.s < x.lan.tu) x.s = x.lan.den;
      this.datViTriXe(x); x.g.visible = false;
    }
    for (const [lan, ds] of theoLan) {
      ds.sort((a, b) => (a.s - b.s) * lan.huong);
      for (let i = 0; i < ds.length; i++) {
        const x = ds[i];
        const dau = x.s + lan.huong * x.dai / 2;
        let vMuc = x.vMax * hsMua;
        // xe phía trước (cùng làn, xét cả làn xe máy và ô tô gần nhau)
        const truoc = ds[i + 1];
        if (truoc && Math.abs(truoc.ngang - x.ngang) < (x.loai === "xeMay" && truoc.loai === "xeMay" ? 1.0 : 2.2)) {
          const kc = (truoc.s - x.s) * lan.huong - (truoc.dai + x.dai) / 2;
          if (kc < 2) vMuc = 0; else if (kc < 8) vMuc = Math.min(vMuc, truoc.v * 0.9 + (kc - 2));
        }
        // đèn đỏ / vàng: dừng trước vạch; vàng nhấp nháy: chạy chậm, nhường xe đang trong giao lộ
        const den = tt[lan.nhom];
        const kcVach = (lan.dung - dau) * lan.huong;
        if (den === "nhay") {
          if (kcVach > -0.5 && kcVach < 14) vMuc = Math.min(vMuc, x.vMax * 0.5);
          const khac = lan.nhom === "chinh" ? "ngang" : "chinh";
          if (trongNgaTu[khac] && kcVach > -0.5 && kcVach < 6) vMuc = Math.min(vMuc, Math.max(0, (kcVach - 0.4) * 1.2));
        } else if (den !== "xanh" && kcVach > -0.5 && kcVach < 14) vMuc = Math.min(vMuc, Math.max(0, (kcVach - 0.4) * 1.2));
        // người chơi đứng trước đầu xe
        // chỉ nhường khi người chơi đang ở dưới lòng đường (đứng trên vỉa hè thì xe vẫn chạy)
        if (nguoiChoi.tang === 0 && duoiDuong(nguoiChoi.x, nguoiChoi.z)) {
          const doc = lan.truc === "x" ? (nguoiChoi.x - dau) * lan.huong : (nguoiChoi.z - dau) * lan.huong;
          const ngang = lan.truc === "x" ? Math.abs(nguoiChoi.z - x.ngang) : Math.abs(nguoiChoi.x - x.ngang);
          if (doc > -0.3 && doc < 7 && ngang < (x.loai === "xeMay" ? 1.0 : 1.6)) vMuc = Math.min(vMuc, Math.max(0, (doc - 1.2) * 1.5));
        }
        const vCu = x.v;
        x.v += (vMuc - x.v) * Math.min(1, dt * (vMuc < x.v ? 5 : 1.2));
        x.thang += ((x.v < vCu - 0.02 || x.v < 0.4 ? 1 : 0) - x.thang) * Math.min(1, dt * 8); // đèn thắng
        x.s += x.v * dt * lan.huong;
        if (lan.huong > 0 && x.s > lan.den) x.s = lan.tu; else if (lan.huong < 0 && x.s < lan.tu) x.s = lan.den;
        this.datViTriXe(x);
        x.g.visible = Math.abs(x.g.position.x - nguoiChoi.x) + Math.abs(x.g.position.z - nguoiChoi.z) < 120;
        // xe máy lắc nhẹ khi chạy
        if (x.loai === "xeMay") x.g.rotation.z = Math.sin(t * 2 + x.s) * 0.03 * (x.v / x.vMax);
        const pk = x.g.userData.pk;
        if (pk?.userData.choang && x.g.visible) pk.userData.choang.rotation.x = 0.4 + 0.75 * (x.v / x.vMax) + Math.sin(t * 14 + x.s) * 0.08;
      }
    }
    this.capNhatDenXe(mt);
    this.capNhatNguoi(dt, t, nguoiChoi, mt, kiemTra);
  }

  // ---------- Đèn xe ----------
  capNhatDenXe(mt) {
    const f = mt.denXe;
    this.meChum.visible = this.meSau.visible = this.diemXe.visible = f > 0.01;
    if (f <= 0.01) return;
    this.vlChum.uniforms.doSang.value = 0.55 * f + mt.uot * 0.15 * f; this.vlDoSau.uniforms.doSang.value = 0.5 * f;
    this.diemXe.material.uniforms.doSang.value = 0.5 + 0.5 * f;
    const C = this.chum, S = this.sau;
    const pa = this.diemXe.geometry.attributes.position.array, ka = this.diemXe.geometry.attributes.kc.array, ma = this.diemXe.geometry.attributes.mauDinh.array;
    let q = 0, qs = 0, n = 0;
    const quad = (A, x, z, s, c, lx0, lx1, lz0, lz1, y, cr, cg, cb, k) => {
      // tứ giác nằm ngang trong hệ toạ độ của xe (lx trái-phải, lz trước-sau)
      const P = (lx, lz) => [x + lx * c + lz * s, z - lx * s + lz * c];
      const ds = [[lx0, lz0, 0, 0], [lx1, lz0, 1, 0], [lx1, lz1, 1, 1], [lx0, lz0, 0, 0], [lx1, lz1, 1, 1], [lx0, lz1, 0, 1]];
      for (const [a, b, u, v] of ds) { const [px, pz] = P(a, b); A.pos.set([px, y, pz], k * 3); A.uv.set([u, v], k * 2); A.mau.set([cr, cg, cb], k * 3); k++; }
      return k;
    };
    const diem = (x, z, s, c, l, kc, r, g, b) => { pa[n * 3] = x + l[0] * c + l[2] * s; pa[n * 3 + 1] = l[1]; pa[n * 3 + 2] = z - l[0] * s + l[2] * c; ka[n] = kc; ma[n * 3] = r; ma[n * 3 + 1] = g; ma[n * 3 + 2] = b; n++; };
    for (const x of this.xe) {
      if (!x.bat || !x.g.visible) continue;
      const p = x.g.position, goc = x.g.rotation.y, s = Math.sin(goc), c = Math.cos(goc);
      const loai = x.loai === "xeMay" ? "xeMay" : x.loai === "buyt" ? "buyt" : "oto";
      const L = DEN_XE[loai];
      const [r, g, b] = x.led ? [0.85, 0.92, 1.0] : [1.0, 0.9, 0.7];
      // chùm pha trên mặt đường
      if (loai === "xeMay") q = quad(C, p.x, p.z, s, c, -1.5, 1.5, 0.6, 7.6, 0.045, r, g, b, q);
      else if (loai === "oto") q = quad(C, p.x, p.z, s, c, -2.3, 2.3, 1.9, 12.5, 0.045, r, g, b, q);
      else q = quad(C, p.x, p.z, s, c, -2.6, 2.6, 5.1, 16.5, 0.045, r, g, b, q);
      // vệt đỏ đèn hậu hắt xuống đường (thắng thì đỏ hơn)
      const th = 0.45 + x.thang * 0.75, dai = loai === "buyt" ? 5.4 : loai === "oto" ? 2.2 : 0.8, rong = loai === "xeMay" ? 0.9 : 1.6;
      qs = quad(S, p.x, p.z, s, c, -rong, rong, -dai - 1.8, -dai + 0.6, 0.044, th, 0.06 * th, 0.04 * th, qs);
      // quầng đèn
      for (const l of L.truoc) diem(p.x, p.z, s, c, [l[0], l[1], l[2] + 0.06], loai === "xeMay" ? 0.75 : 0.95, r, g, b);
      for (const l of L.sau) diem(p.x, p.z, s, c, [l[0], l[1], l[2] - 0.06], 0.42 + x.thang * 0.35, 1.0, 0.12, 0.08);
      if (L.bien) diem(p.x, p.z, s, c, L.bien, 0.8, 1.0, 0.7, 0.2);
      else if (x.loai === "taxi") diem(p.x, p.z, s, c, [0, 1.74, -0.2], 0.55, 0.9, 0.95, 1.0);
    }
    for (let i = n; i < ka.length; i++) ka[i] = 0;
    for (const k of ["position", "kc", "mauDinh"]) this.diemXe.geometry.attributes[k].needsUpdate = true;
    this.meChum.geometry.setDrawRange(0, q); this.meSau.geometry.setDrawRange(0, qs);
    for (const k of ["position", "uv", "mauDinh"]) { this.meChum.geometry.attributes[k].needsUpdate = true; S.geo.attributes[k].needsUpdate = true; }
  }

  // ---------- Người đi bộ, người ngồi, nhóm tán gẫu ----------
  capNhatNguoi(dt, t, nguoiChoi, mt, kiemTra) {
    const h = mt.gio;
    const xa = (x, z) => Math.abs(x - nguoiChoi.x) + Math.abs(z - nguoiChoi.z);
    for (const p of this.nguoi) {
      const l = p.l;
      let x = l.truc === "x" ? p.s : l.co + p.lechHt, z = l.truc === "x" ? l.co + p.lechHt : p.s;
      // giờ giấc, mưa: ai không có ô / áo mưa thì về nhà khi mưa to; đổi trạng thái lúc ở xa người chơi
      if (kiemTra) {
        p.muon = trongGio(h, p.gio) && (!mt.muaTo || p.chiuMua);
        if (p.an === p.muon && (xa(x, z) > 26 || !trongGio(h, p.gio))) p.an = !p.muon;
        // mưa: bung ô / mặc áo mưa
        const che = mt.coMua && !p.an;
        if (che !== !!p.dangChe) {
          if (che && p.tt) this.xongViec(p);
          p.dangChe = che; p.o?.cam(che); p.aoMua?.mac(che);
        }
      }
      if (p.an) { p.nv.group.visible = false; continue; }
      const gan = nguoiChoi.tang === 0 && Math.hypot(nguoiChoi.x - x, nguoiChoi.z - z) < 1.1;
      // việc riêng: nghe điện thoại, chụp ảnh, ghé xe hàng mua đồ, dừng cho chó đánh hơi
      p.hen -= dt;
      if (!p.tt && p.hen <= 0 && !(p.o && p.dangChe)) {
        if (p.loai === "goi") { p.tt = { loai: "goi", tg: 9 + Math.random() * 14, dung: Math.random() < 0.35 }; p.dt.nghe(true); }
        else if (p.loai === "chup") { p.tt = { loai: "chup", tg: 4 + Math.random() * 3, xoay: (Math.random() - 0.5) * 2.4 }; p.dt.chup(true); }
        else if (p.loai === "cho") p.tt = { loai: "hit", tg: 2.5 + Math.random() * 2.5 };
        else p.hen = 5;
      }
      if (!p.tt && !p.dangChe && (p.loai === "thuong" || p.loai === "goi") && (p.henMua || 0) <= 0) {
        for (const c of l.xeHang) {
          const ds = (c.s - p.s) * p.huong;
          if (ds > 0.95 && ds < 1.3) { p.henMua = 25; if (Math.random() < 0.45) { p.tt = { loai: "mua", tg: 4.6, c, sDung: p.s }; } break; }
        }
      }
      if (p.henMua > 0) p.henMua -= dt;
      if (p.tuiTg > 0 && (p.tuiTg -= dt) <= 0) p.tui.visible = false;
      let tocDi = p.toc * (mt.coMua && !p.chiuMua ? 1.35 : 1), dung = false;
      if (p.tt) {
        const v = p.tt; v.tg -= dt;
        if (v.loai === "goi") { tocDi *= 0.6; dung = v.dung; }
        else if (v.loai === "chup" || v.loai === "hit") dung = true;
        else if (v.loai === "mua") { dung = true; p.nv.vietTay = v.tg > 2.0 ? 1 : 0; }
        if (v.tg <= 0) this.xongViec(p);
      }
      const dangDi = !gan && p.cho <= 0 && !dung;
      if (p.cho > 0) p.cho -= dt;
      if (dangDi) {
        p.s += tocDi * dt * p.huong;
        if (p.s > l.den || p.s < l.tu) { p.huong *= -1; p.s = Math.max(l.tu, Math.min(l.den, p.s)); p.cho = 1 + Math.random() * 3; }
      }
      // né vật cản phía trước: lách sang bên còn chỗ, qua rồi trở lại hàng
      let muc = p.tt?.loai === "mua" ? kep(p.tt.c.lat * 0.6, l.bien[0], l.bien[1]) : p.lech;
      for (const o of l.vc) {
        const ds = (o.s - p.s) * p.huong; if (ds < -0.7 || ds > 1.9) continue;
        const dl = p.lechHt - o.lat, can = o.r + 0.3;
        if (Math.abs(dl) < can) { const ben = dl >= 0 ? 1 : -1; let m = o.lat + ben * can; if (m > l.bien[1] || m < l.bien[0]) m = o.lat - ben * can; muc = m; }
      }
      p.lechHt += (kep(muc, l.bien[0] - 0.25, l.bien[1] + 0.25) - p.lechHt) * Math.min(1, dt * 3.2);
      x = l.truc === "x" ? p.s : l.co + p.lechHt; z = l.truc === "x" ? l.co + p.lechHt : p.s;
      p.nv.group.position.set(x, 0, z);
      p.nv.group.visible = xa(x, z) < 70;
      let goc = l.truc === "x" ? (p.huong > 0 ? Math.PI / 2 : -Math.PI / 2) : (p.huong > 0 ? 0 : Math.PI);
      if (p.tt?.loai === "mua") goc = Math.atan2(p.tt.c.x - x, p.tt.c.z - z);
      else if (p.tt?.loai === "chup") goc += p.tt.xoay;
      p.nv.group.rotation.y = goc;
      if (p.nv.group.visible) {
        p.nv.hoatDong(t + p.toc * 10, dangDi, tocDi);
        if (p.tt?.loai === "chup") p.nv.dau.rotation.set(-0.12, 0, 0.12);
        if (p.tt?.loai === "goi") p.nv.dau.rotation.z = 0.12;
      }
    }
    // người ngồi, đứng một chỗ
    for (const nv of this.dungYen) {
      const d = nv._cho;
      if (kiemTra) {
        const muon = trongGio(h, d.gio) && (!mt.muaTo || d.chiuMua);
        if (d.an === muon && (xa(d.x, d.z) > 26 || !trongGio(h, d.gio))) d.an = !muon;
        nv.group.visible = !d.an && xa(d.x, d.z) < 80;
      }
      if (nv.group.visible) nv.hoatDong(t, false);
    }
    // nhóm tán gẫu
    for (const n of this.nhomNoi) {
      if (kiemTra) {
        const muon = trongGio(h, n.gio) && !mt.coMua;
        if (n.an === muon && (xa(n.x, n.z) > 26 || !trongGio(h, n.gio))) n.an = !muon;
        for (const nv of n.ds) nv.group.visible = !n.an && xa(n.x, n.z) < 70;
      }
      if (n.an || !n.ds[0].group.visible) continue;
      if ((n.doi -= dt) <= 0) { n.nguoiNoi = (n.nguoiNoi + 1 + Math.floor(Math.random() * (n.ds.length - 1))) % n.ds.length; n.doi = 2.5 + Math.random() * 4; n.cuoi = Math.random() < 0.3 ? 1.2 : 0; }
      if (n.cuoi > 0) n.cuoi -= dt;
      n.ds.forEach((nv, k) => {
        nv.hoatDong(t + k * 2, false);
        if (k === n.nguoiNoi) {
          nv.tayP.userData.coDinh = true; nv.tayP.rotation.set(-0.55 - Math.sin(t * 3.1 + k) * 0.35, 0, -0.15 + Math.sin(t * 2.3) * 0.15);
          nv.tayT.userData.coDinh = true; nv.tayT.rotation.set(-0.3 - Math.max(0, Math.sin(t * 2.2)) * 0.4, 0, 0.1);
          nv.dau.rotation.x = Math.sin(t * 5) * 0.05;
        } else {
          nv.tayP.userData.coDinh = nv.tayT.userData.coDinh = false;
          nv.dau.rotation.x = n.cuoi > 0 ? -0.28 : Math.max(0, Math.sin(t * 1.7 + k * 2)) * 0.12; // gật gù, ngửa cổ cười
        }
      });
    }
  }
  xongViec(p) {
    const v = p.tt; p.tt = null;
    if (!v) return;
    if (v.loai === "goi") { p.dt.nghe(false); p.hen = 18 + Math.random() * 25; }
    else if (v.loai === "chup") { p.dt.chup(false); p.hen = 25 + Math.random() * 30; }
    else if (v.loai === "hit") p.hen = 9 + Math.random() * 10;
    else if (v.loai === "mua") { p.nv.vietTay = 0; if (v.tg <= 0) { p.tui.visible = true; p.tuiTg = 45; } }
    if (p.o && p.dangChe) p.o.cam(true);
  }
}
