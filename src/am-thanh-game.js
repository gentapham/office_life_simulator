// Âm thanh toàn game, tự tạo bằng Web Audio (không dùng file âm thanh):
// nhạc nền theo giờ, tiếng phố, văn phòng, thời tiết, bước chân, tiếng đồ vật, động vật, giao diện.
// Ba nhóm âm lượng theo màn Cài đặt: nhạc nền, hiệu ứng, môi trường.
import { amLuong, khiDoiCaiDat } from "./cai-dat.js";

const hz = m => 440 * Math.pow(2, (m - 69) / 12);
const ngauNhien = (a, b) => a + Math.random() * (b - a);
const chon = a => a[Math.floor(Math.random() * a.length)];
const kep = (v, a, b) => Math.max(a, Math.min(b, v));

// ---------- Nhạc nền: mỗi kiểu một nhịp, vòng hợp âm, nhạc cụ ----------
const KIEU_NHAC = {
  menu:  { bpm: 80, hop: [[53, 57, 60, 64], [52, 55, 59, 62], [50, 53, 57, 60], [48, 52, 55, 59]], cu: "ep", trong: "lofi", giai: 0.45 },
  sang:  { bpm: 100, hop: [[48, 52, 55], [55, 59, 62], [57, 60, 64], [53, 57, 60]], cu: "marimba", trong: "nhe", giai: 0.25 },
  trua:  { bpm: 90, hop: [[50, 53, 57, 60], [55, 59, 62], [48, 52, 55, 59], [57, 60, 64]], cu: "pluck", trong: "nhe", giai: 0.3 },
  chieu: { bpm: 76, hop: [[57, 60, 64, 67], [53, 57, 60, 64], [48, 52, 55, 59], [55, 59, 62, 65]], cu: "ep", trong: "lofi", giai: 0.35 },
  dem:   { bpm: 62, hop: [[45, 52, 55, 60], [41, 48, 52, 57], [43, 50, 55, 59], [40, 47, 52, 55]], cu: "piano", trong: null, giai: 0.3 },
  hoi_hop: { bpm: 112, hop: [[57, 60, 64], [57, 60, 64], [53, 57, 60], [52, 56, 59]], cu: "pluck", trong: "nhe", giai: 0.2 },
};
const NGU_CUNG = [0, 2, 4, 7, 9];

// ---------- Bề mặt dưới chân ----------
const BE_MAT = {
  gach: { loc: 2600, q: 1.2, dai: 0.07, to: 0.5, than: 120 },
  tham: { loc: 700, q: 0.7, dai: 0.09, to: 0.35, than: 90 },
  go:   { loc: 1400, q: 1.5, dai: 0.1, to: 0.55, than: 140 },
  nhua: { loc: 1900, q: 0.6, dai: 0.08, to: 0.45, than: 100 },
  da:   { loc: 2200, q: 0.9, dai: 0.075, to: 0.5, than: 110 },
  cat:  { loc: 1100, q: 0.4, dai: 0.14, to: 0.4, than: 70 },
};

class AmThanhGame {
  constructor() {
    this.ctx = null; this.kieuNhac = "im"; this.buoc = 0; this.tiep = 0; this.lop = {};
    this.henGio = {}; this.tBuoc = 0; this.mucTim = 0; this.tTim = 0; this.coiBat = false;
    this.nghe = { x: 0, z: 0, yaw: 0, tang: 0 };
    this.chopCu = 0; this.chimBay = new WeakSet(); this.nhacGiam = 1;
  }

  // Trình duyệt chỉ cho phát tiếng sau khi người chơi đã bấm hoặc chạm
  mo() {
    if (this.ctx) { if (this.ctx.state === "suspended") this.ctx.resume(); return true; }
    if (navigator.userActivation && !navigator.userActivation.hasBeenActive) return false;
    try { this.ctx = new (window.AudioContext || window.webkitAudioContext)(); } catch { return false; }
    const c = this.ctx;
    const nen = c.createDynamicsCompressor(); nen.threshold.value = -14; nen.ratio.value = 4; nen.connect(c.destination);
    this.ra = c.createGain(); this.ra.connect(nen);
    // tiếng vang dùng chung (nhạc, tiếng trong phòng)
    this.vang = c.createConvolver(); this.vang.buffer = this.taoVang(2.2); const vangRa = c.createGain(); vangRa.gain.value = 0.5; this.vang.connect(vangRa); vangRa.connect(this.ra);
    this.bus = {};
    for (const n of ["amNhac", "amHieuUng", "amMoiTruong"]) { const g = c.createGain(); g.connect(this.ra); this.bus[n] = g; }
    this.nhacTong = c.createGain(); this.nhacTong.gain.value = 0; this.nhacTong.connect(this.bus.amNhac);
    const guiVang = c.createGain(); guiVang.gain.value = 0.35; this.nhacTong.connect(guiVang); guiVang.connect(this.vang);
    this.apAmLuong();
    khiDoiCaiDat(() => this.apAmLuong());
    // nhiễu dùng chung
    const n = c.sampleRate * 2;
    const trang = c.createBuffer(1, n, c.sampleRate), hong = c.createBuffer(1, n, c.sampleRate), nau = c.createBuffer(1, n, c.sampleRate);
    const a = trang.getChannelData(0), b = hong.getChannelData(0), d = nau.getChannelData(0);
    let b0 = 0, b1 = 0, b2 = 0, cuoi = 0;
    for (let i = 0; i < n; i++) {
      const w = Math.random() * 2 - 1; a[i] = w;
      b0 = 0.99765 * b0 + w * 0.099; b1 = 0.963 * b1 + w * 0.2965; b2 = 0.57 * b2 + w * 1.0526; b[i] = (b0 + b1 + b2 + w * 0.1848) * 0.2;
      cuoi = (cuoi + 0.02 * w) / 1.02; d[i] = cuoi * 3.5;
    }
    this.nhieu = { trang, hong, nau };
    this.taoLopNen();
    this.tiep = c.currentTime + 0.1;
    this.hen = setInterval(() => this.lichNhac(), 25);
    this.apNhac();
    return true;
  }
  apAmLuong() {
    if (!this.ctx) return;
    for (const [n, g] of Object.entries(this.bus)) g.gain.setTargetAtTime(amLuong(n), this.ctx.currentTime, 0.1);
  }
  taoVang(giay) {
    const c = this.ctx, n = Math.floor(c.sampleRate * giay), b = c.createBuffer(2, n, c.sampleRate);
    for (let k = 0; k < 2; k++) { const d = b.getChannelData(k); for (let i = 0; i < n; i++) d[i] = (Math.random() * 2 - 1) * Math.pow(1 - i / n, 3); }
    return b;
  }

  // ---------- Khối dựng âm ----------
  // điểm phát trong không gian: to nhỏ theo khoảng cách, trái phải theo hướng nhìn
  diem(x, z, nhom = "amHieuUng", xa = 30, to = 1) {
    const c = this.ctx, g = c.createGain(), p = c.createStereoPanner();
    let v = to, pan = 0;
    if (x != null) {
      const dx = x - this.nghe.x, dz = z - this.nghe.z, d = Math.hypot(dx, dz);
      v = to * Math.pow(kep(1 - d / xa, 0, 1), 1.5);
      // hướng nhìn là (-sin yaw, -cos yaw); bên phải là (cos yaw, -sin yaw)
      const phai = dx * Math.cos(this.nghe.yaw) - dz * Math.sin(this.nghe.yaw);
      pan = d > 0.5 ? kep(phai / d, -1, 1) * 0.8 : 0;
    }
    g.gain.value = v; p.pan.value = pan;
    g.connect(p); p.connect(this.bus[nhom]);
    return v > 0.002 ? g : null;
  }
  osc(t, kieu, f, ra, dai) { const o = this.ctx.createOscillator(); o.type = kieu; o.frequency.setValueAtTime(f, t); o.connect(ra); o.start(t); o.stop(t + dai + 0.05); return o; }
  bao(t, to, len, giu, tat, ra) { // đường bao âm lượng
    const g = this.ctx.createGain(); g.gain.setValueAtTime(0.0001, t);
    g.gain.exponentialRampToValueAtTime(Math.max(0.0002, to), t + len);
    if (giu) g.gain.setValueAtTime(Math.max(0.0002, to), t + len + giu);
    g.gain.exponentialRampToValueAtTime(0.0001, t + len + giu + tat);
    g.connect(ra); return g;
  }
  loc(kieu, f, q = 1, ra) { const l = this.ctx.createBiquadFilter(); l.type = kieu; l.frequency.value = f; l.Q.value = q; l.connect(ra); return l; }
  phatNhieu(t, loai, dai, ra, batDau = Math.random()) { const s = this.ctx.createBufferSource(); s.buffer = this.nhieu[loai]; s.connect(ra); s.start(t, batDau, dai + 0.05); return s; }

  // ---------- Lớp âm nền chạy liên tục ----------
  taoLopNen() {
    const c = this.ctx;
    const lop = (ten, loai, cauHinh, nhom = "amMoiTruong") => {
      const g = c.createGain(); g.gain.value = 0; g.connect(this.bus[nhom]);
      let vao = g; const locs = [];
      for (const [k, f, q] of cauHinh.slice().reverse()) { const l = this.loc(k, f, q, vao); locs.unshift(l); vao = l; }
      const s = c.createBufferSource(); s.buffer = this.nhieu[loai]; s.loop = true; s.connect(vao); s.start(0, Math.random() * 1.5);
      this.lop[ten] = { g, locs };
    };
    lop("pho", "nau", [["lowpass", 380, 0.5]]);                       // ù ù xe cộ
    lop("lop_xe", "hong", [["bandpass", 1100, 0.6]]);                  // tiếng lốp xe rít đường
    lop("dieu_hoa", "hong", [["lowpass", 420, 0.6]]);                  // máy lạnh
    lop("ri_rao", "trang", [["bandpass", 520, 1.4], ["peaking", 1400, 2]]); // tiếng người nói chuyện lao xao
    lop("mua", "trang", [["highpass", 700, 0.5], ["lowpass", 7000, 0.5]]);
    lop("gio", "hong", [["bandpass", 500, 0.8]]);
    lop("bien", "nau", [["lowpass", 900, 0.5]]);                        // sóng biển (Vũng Tàu)
    // tiếng ù nhỏ của máy lạnh
    const o = c.createOscillator(); o.frequency.value = 100; const og = c.createGain(); og.gain.value = 0; o.connect(og); og.connect(this.bus.amMoiTruong); o.start();
    this.lop.dieu_hoa_u = { g: og, locs: [] };
  }
  datLop(ten, v, tau = 0.6) { const l = this.lop[ten]; if (l) l.g.gain.setTargetAtTime(v, this.ctx.currentTime, tau); }

  // ---------- Nhạc nền ----------
  nhac(kieu) {
    if (kieu === this.kieuNhac) return;
    this.kieuNhac = kieu; this.apNhac();
  }
  apNhac() {
    if (!this.ctx) return;
    const t = this.ctx.currentTime, k = this.kieuNhac;
    this.nhacTong.gain.cancelScheduledValues(t);
    this.nhacTong.gain.setTargetAtTime(k === "im" ? 0 : (k === "menu" ? 0.55 : 0.32) * this.nhacGiam, t, 0.8);
  }
  // giảm nhạc nền (gần sân khấu đang diễn, đang xỉu…)
  giamNhac(v) {
    if (Math.abs(v - this.nhacGiam) < 0.02 || !this.ctx) return;
    this.nhacGiam = v;
    this.apNhac();
  }
  lichNhac() {
    const c = this.ctx; if (!c) return;
    const kieu = KIEU_NHAC[this.kieuNhac] || KIEU_NHAC[this.kieuCu];
    if (!kieu) { this.tiep = c.currentTime + 0.05; return; }
    if (KIEU_NHAC[this.kieuNhac]) this.kieuCu = this.kieuNhac;
    const nhip = 60 / kieu.bpm / 4;
    while (this.tiep < c.currentTime + 0.15) {
      const t = this.tiep, b = this.buoc % 16, o = Math.floor(this.buoc / 16) % kieu.hop.length, ha = kieu.hop[o];
      this.nhipNhac(t, b, ha, kieu, nhip);
      this.tiep += nhip * (b % 2 === 0 && kieu.trong === "lofi" ? 1.12 : b % 2 ? 0.88 : 1); // nhịp lơi kiểu lofi
      this.buoc++;
    }
  }
  nhipNhac(t, b, ha, k, nhip) {
    const ra = this.nhacTong;
    // trống
    if (k.trong === "lofi") {
      if (b === 0 || b === 10) this.trongKick(t, 0.5, ra);
      if (b === 4 || b === 12) this.nhieuNgan(t, "bandpass", 1800, 0.16, 0.12, ra);
      if (b % 2 === 0) this.nhieuNgan(t, "highpass", 8000, 0.035, 0.03, ra);
      if (Math.random() < 0.08) this.nhieuNgan(t + Math.random() * nhip, "highpass", 3000, 0.01, 0.025, ra); // tiếng lạo xạo đĩa than
    } else if (k.trong === "nhe") {
      if (b === 0 || b === 8) this.trongKick(t, 0.38, ra);
      if (b === 4 || b === 12) this.nhieuNgan(t, "bandpass", 3200, 0.03, 0.08, ra);
      this.nhieuNgan(t, "highpass", 9000, 0.02, b % 4 === 2 ? 0.03 : 0.015, ra);
    }
    // bass
    if (b === 0 || (b === 8 && k.bpm > 70)) this.nhacCu("bass", t, hz(ha[0] - 12), nhip * 7, 0.22, ra);
    // hợp âm
    if (k.cu === "ep" || k.cu === "piano") {
      if (b === 0) for (const n of ha) this.nhacCu(k.cu, t + Math.random() * 0.02, hz(n), nhip * 14, 0.07, ra);
      if (b === 8 && k.cu === "ep") for (const n of ha.slice(1)) this.nhacCu("ep", t, hz(n), nhip * 6, 0.04, ra);
    } else if (k.cu === "marimba") {
      if (b % 2 === 0) this.nhacCu("marimba", t, hz(ha[(b / 2) % ha.length] + 12), 0.4, 0.1, ra);
    } else if (k.cu === "pluck") {
      if ([0, 3, 6, 8, 11, 14].includes(b)) this.nhacCu("pluck", t, hz(ha[[0, 1, 2, 1, 2, 0][[0, 3, 6, 8, 11, 14].indexOf(b)] % ha.length] + 12), 0.45, 0.09, ra);
    }
    // giai điệu ngũ cung lang thang
    if ([2, 6, 10, 13].includes(b) && Math.random() < k.giai) {
      const goc = ha[0] + 24, n = goc + NGU_CUNG[Math.floor(Math.random() * 5)] + (Math.random() < 0.3 ? 12 : 0);
      this.nhacCu("chuong", t, hz(n), nhip * 3, 0.05, ra);
    }
  }
  nhacCu(loai, t, f, dai, to, ra) {
    const c = this.ctx;
    if (loai === "bass") { const g = this.bao(t, to, 0.01, dai * 0.5, dai * 0.5, this.loc("lowpass", 400, 0.7, ra)); this.osc(t, "triangle", f, g, dai); this.osc(t, "sine", f, g, dai); return; }
    if (loai === "ep") { const g = this.bao(t, to, 0.012, 0.05, dai, this.loc("lowpass", 2200, 0.5, ra)); this.osc(t, "sine", f, g, dai); const o2 = this.osc(t, "triangle", f * 2.001, g, dai * 0.5); o2.detune.value = 4; return; }
    if (loai === "piano") { const g = this.bao(t, to * 1.2, 0.006, 0, dai, this.loc("lowpass", 2600, 0.5, ra)); this.osc(t, "triangle", f, g, dai); this.osc(t, "sine", f * 2, g, dai * 0.4); return; }
    if (loai === "marimba") { const g = this.bao(t, to, 0.004, 0, dai, ra); this.osc(t, "sine", f, g, dai); const g2 = this.bao(t, to * 0.25, 0.002, 0, 0.08, ra); this.osc(t, "sine", f * 4, g2, 0.1); return; }
    if (loai === "pluck") { const l = c.createBiquadFilter(); l.type = "lowpass"; l.frequency.setValueAtTime(3000, t); l.frequency.exponentialRampToValueAtTime(500, t + dai); l.connect(ra); const g = this.bao(t, to, 0.004, 0, dai, l); this.osc(t, "triangle", f, g, dai); return; }
    if (loai === "chuong") { const g = this.bao(t, to, 0.005, 0, dai + 0.6, ra); this.osc(t, "sine", f, g, dai + 0.6); const g2 = this.bao(t, to * 0.3, 0.003, 0, 0.5, ra); this.osc(t, "sine", f * 2.76, g2, 0.5); }
  }
  trongKick(t, to, ra) { const o = this.ctx.createOscillator(), g = this.bao(t, to, 0.003, 0, 0.3, ra); o.frequency.setValueAtTime(120, t); o.frequency.exponentialRampToValueAtTime(45, t + 0.15); o.connect(g); o.start(t); o.stop(t + 0.35); }
  nhieuNgan(t, kieu, f, dai, to, ra) { const g = this.bao(t, to, 0.002, 0, dai, ra); this.phatNhieu(t, "trang", dai, this.loc(kieu, f, 0.8, g)); }

  // ---------- Bước chân ----------
  buocChan(beMat, chay = false, x, z) {
    if (!this.ctx) return;
    const b = BE_MAT[beMat] || BE_MAT.gach, t = this.ctx.currentTime;
    const ra = this.diem(x, z, "amHieuUng", 25, (chay ? 1.25 : 1) * b.to * ngauNhien(0.8, 1.1)); if (!ra) return;
    const g = this.bao(t, 0.5, 0.003, 0, b.dai * (chay ? 0.8 : 1), ra);
    this.phatNhieu(t, beMat === "cat" ? "hong" : "trang", b.dai + 0.05, this.loc("bandpass", b.loc * ngauNhien(0.85, 1.15), b.q, g));
    const g2 = this.bao(t, 0.35, 0.002, 0, 0.08, ra);
    const o = this.ctx.createOscillator(); o.frequency.setValueAtTime(b.than * 1.6, t); o.frequency.exponentialRampToValueAtTime(b.than, t + 0.05); o.connect(g2); o.start(t); o.stop(t + 0.1);
  }
  cauThang(lenXuong = 1) { if (!this.ctx) return; for (let i = 0; i < 8; i++) setTimeout(() => this.buocChan("go"), i * 170 + (lenXuong > 0 ? 0 : 20)); }

  // ---------- Tiếng hiệu ứng một lần ----------
  phat(ten, x, z) {
    if (!this.mo()) return;
    const f = this.HIEU_UNG[ten]; if (f) f.call(this, this.ctx.currentTime, x, z);
  }
  HIEU_UNG = {
    click(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.25); const g = this.bao(t, 0.6, 0.001, 0, 0.03, ra); this.osc(t, "sine", 1700, g, 0.04); },
    ting(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.18); const g = this.bao(t, 0.6, 0.004, 0, 0.35, ra); this.osc(t, "sine", 1568, g, 0.4); const g2 = this.bao(t + 0.09, 0.5, 0.004, 0, 0.5, ra); this.osc(t + 0.09, "sine", 2093, g2, 0.55); },
    rung(t) {
      const ra = this.diem(null, null, "amHieuUng", 1, 0.5);
      for (const d of [0, 0.32, 1.1, 1.42]) { const g = this.bao(t + d, 0.5, 0.01, 0.2, 0.03, this.loc("lowpass", 380, 1, ra)); this.osc(t + d, "square", 155, g, 0.25); }
    },
    xa_nuoc(t, x, z) {
      const ra = this.diem(x, z, "amHieuUng", 18, 0.9); if (!ra) return;
      const l = this.ctx.createBiquadFilter(); l.type = "lowpass"; l.Q.value = 0.8; l.frequency.setValueAtTime(300, t); l.frequency.linearRampToValueAtTime(2200, t + 0.6); l.frequency.linearRampToValueAtTime(500, t + 3);
      const g = this.bao(t, 0.8, 0.25, 1.2, 1.6, ra); l.connect(g); this.phatNhieu(t, "hong", 3.2, l);
      for (let i = 0; i < 8; i++) { const tt = t + 1.4 + i * 0.18 + Math.random() * 0.1, gg = this.bao(tt, 0.12, 0.01, 0, 0.12, ra); const o = this.osc(tt, "sine", 200, gg, 0.15); o.frequency.exponentialRampToValueAtTime(500, tt + 0.12); }
    },
    voi_nuoc(t, x, z) {
      const ra = this.diem(x, z, "amHieuUng", 15, 0.6); if (!ra) return;
      const g = this.bao(t, 0.5, 0.05, 1.8, 0.3, ra); const l = this.loc("bandpass", 2600, 1.5, g);
      const am = this.ctx.createGain(); am.connect(l); this.phatNhieu(t, "trang", 2.3, am);
      for (let i = 0; i < 20; i++) am.gain.setValueAtTime(ngauNhien(0.5, 1), t + i * 0.1);
    },
    ong_nuoc(t, x, z) { // cây nước nóng lạnh: ọc ọc
      const ra = this.diem(x, z, "amHieuUng", 15, 0.7); if (!ra) return;
      for (let i = 0; i < 5; i++) { const tt = t + 0.3 + i * ngauNhien(0.18, 0.3), g = this.bao(tt, 0.4, 0.01, 0, 0.1, ra); const o = this.osc(tt, "sine", ngauNhien(160, 220), g, 0.12); o.frequency.exponentialRampToValueAtTime(ngauNhien(380, 520), tt + 0.1); }
      const g = this.bao(t, 0.15, 0.05, 1.2, 0.2, ra); this.phatNhieu(t, "trang", 1.5, this.loc("bandpass", 3000, 2, g));
    },
    tu_lanh(t, x, z) {
      const ra = this.diem(x, z, "amHieuUng", 15, 0.8); if (!ra) return;
      const g = this.bao(t, 0.6, 0.002, 0, 0.05, ra); this.phatNhieu(t, "trang", 0.06, this.loc("bandpass", 1200, 1, g));
      const g2 = this.bao(t + 0.05, 0.12, 0.2, 1.4, 0.3, this.loc("lowpass", 300, 0.7, ra)); this.osc(t, "sawtooth", 60, g2, 2); this.osc(t, "sine", 120, g2, 2);
      const g3 = this.bao(t + 2, 0.9, 0.002, 0, 0.15, ra); const o = this.osc(t + 2, "sine", 110, g3, 0.2); o.frequency.exponentialRampToValueAtTime(50, t + 2.15);
    },
    lo_vi_song(t, x, z) {
      const ra = this.diem(x, z, "amHieuUng", 15, 0.8); if (!ra) return;
      const g = this.bao(t, 0.18, 0.1, 2, 0.1, this.loc("lowpass", 350, 0.8, ra)); this.osc(t, "sawtooth", 100, g, 2.3);
      for (let i = 0; i < 3; i++) { const g2 = this.bao(t + 2.3 + i * 0.28, 0.35, 0.003, 0.1, 0.02, ra); this.osc(t + 2.3 + i * 0.28, "square", 2050, g2, 0.14); }
    },
    may_ca_phe(t, x, z) {
      const ra = this.diem(x, z, "amHieuUng", 15, 0.8); if (!ra) return;
      const g = this.bao(t, 0.25, 0.05, 1.1, 0.1, this.loc("lowpass", 1800, 0.7, ra)); this.osc(t, "sawtooth", 165, g, 1.3);
      const g1 = this.bao(t, 0.3, 0.05, 1.1, 0.1, ra); this.phatNhieu(t, "trang", 1.3, this.loc("bandpass", 2200, 1, g1));
      const g2 = this.bao(t + 1.4, 0.25, 0.3, 1, 0.6, ra); this.phatNhieu(t + 1.4, "trang", 2, this.loc("highpass", 4000, 0.7, g2));
    },
    an(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 10, 0.7); if (!ra) return; for (let i = 0; i < 6; i++) { const tt = t + 0.15 + i * ngauNhien(0.22, 0.34), g = this.bao(tt, 0.5, 0.002, 0, 0.06, ra); this.phatNhieu(tt, "trang", 0.08, this.loc("bandpass", ngauNhien(2500, 4200), 1.2, g)); } },
    uong(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 10, 0.6); if (!ra) return; for (let i = 0; i < 3; i++) { const tt = t + 0.2 + i * 0.45, g = this.bao(tt, 0.3, 0.04, 0.1, 0.15, ra); const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 3; l.frequency.setValueAtTime(500, tt); l.frequency.exponentialRampToValueAtTime(1100, tt + 0.25); l.connect(g); this.phatNhieu(tt, "trang", 0.3, l); } },
    tien(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.3); for (const [d, f] of [[0, 1320], [0.08, 1760], [0.16, 2640]]) { const g = this.bao(t + d, 0.4, 0.002, 0, 0.25, ra); this.osc(t + d, "sine", f, g, 0.3); } },
    meo(t, x, z) {
      const ra = this.diem(x, z, "amHieuUng", 18, 0.6); if (!ra) return;
      const f0 = ngauNhien(480, 600), g = this.bao(t, 0.45, 0.05, 0.25, 0.3, ra);
      const f1 = this.loc("bandpass", 950, 4, g), f2 = this.loc("bandpass", 1900, 5, g);
      const o = this.ctx.createOscillator(); o.type = "sawtooth"; o.frequency.setValueAtTime(f0, t); o.frequency.linearRampToValueAtTime(f0 * 1.45, t + 0.22); o.frequency.linearRampToValueAtTime(f0 * 0.85, t + 0.6);
      o.connect(f1); o.connect(f2); o.start(t); o.stop(t + 0.65);
      f1.frequency.setValueAtTime(700, t); f1.frequency.linearRampToValueAtTime(1100, t + 0.25); f1.frequency.linearRampToValueAtTime(800, t + 0.6);
    },
    meo_ron(t, x, z) { // rừ rừ
      const ra = this.diem(x, z, "amHieuUng", 8, 0.6); if (!ra) return;
      const g = this.bao(t, 0.5, 0.2, 1.4, 0.4, ra), am = this.ctx.createGain(); am.connect(this.loc("lowpass", 220, 1, g));
      const lfo = this.ctx.createOscillator(); lfo.frequency.value = 26; const lg = this.ctx.createGain(); lg.gain.value = 0.5; lfo.connect(lg); lg.connect(am.gain); am.gain.value = 0.5; lfo.start(t); lfo.stop(t + 2.1);
      this.phatNhieu(t, "nau", 2, am);
    },
    chim_gu(t, x, z) { // gù gù
      const ra = this.diem(x, z, "amMoiTruong", 16, 0.5); if (!ra) return;
      for (const d of [0, 0.75]) {
        const g = this.bao(t + d, 0.35, 0.06, 0.25, 0.25, this.loc("lowpass", 900, 1, ra));
        const o = this.osc(t + d, "sine", 330, g, 0.6); o.frequency.setValueAtTime(330, t + d); o.frequency.linearRampToValueAtTime(380, t + d + 0.15); o.frequency.linearRampToValueAtTime(290, t + d + 0.55);
        const lfo = this.ctx.createOscillator(); lfo.frequency.value = 22; const lg = this.ctx.createGain(); lg.gain.value = 25; lfo.connect(lg); lg.connect(o.frequency); lfo.start(t + d); lfo.stop(t + d + 0.6);
      }
    },
    chim_vo(t, x, z) { // vỗ cánh bay lên
      const ra = this.diem(x, z, "amMoiTruong", 18, 0.7); if (!ra) return;
      for (let i = 0; i < 9; i++) { const tt = t + i * 0.075, g = this.bao(tt, 0.4 * (1 - i / 12), 0.004, 0, 0.05, ra); this.phatNhieu(tt, "trang", 0.06, this.loc("bandpass", 1100, 0.9, g)); }
    },
    bong_bong(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 8, 0.5); if (!ra) return; for (let i = 0; i < 4; i++) { const tt = t + i * ngauNhien(0.12, 0.25), g = this.bao(tt, 0.3, 0.005, 0, 0.06, ra); const o = this.osc(tt, "sine", ngauNhien(500, 800), g, 0.08); o.frequency.exponentialRampToValueAtTime(ngauNhien(1200, 1800), tt + 0.06); } },
    chuyen_canh(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.22); const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 1.2; l.frequency.setValueAtTime(400, t); l.frequency.exponentialRampToValueAtTime(2400, t + 0.45); l.connect(this.bao(t, 0.5, 0.2, 0, 0.35, ra)); this.phatNhieu(t, "trang", 0.6, l); },
    chuong_dt(t, x, z) { // điện thoại bàn reo
      const ra = this.diem(x, z, "amMoiTruong", 22, 0.35); if (!ra) return;
      for (const d of [0, 0.5, 2, 2.5]) { const g = this.bao(t + d, 0.4, 0.01, 0.35, 0.03, ra), am = this.ctx.createGain(); am.connect(g); this.osc(t + d, "sine", 440, am, 0.4); this.osc(t + d, "sine", 480, am, 0.4); const lfo = this.ctx.createOscillator(); lfo.type = "square"; lfo.frequency.value = 20; const lg = this.ctx.createGain(); lg.gain.value = 0.5; lfo.connect(lg); lg.connect(am.gain); lfo.start(t + d); lfo.stop(t + d + 0.4); }
    },
    may_in(t, x, z) {
      const ra = this.diem(x, z, "amMoiTruong", 18, 0.5); if (!ra) return;
      for (let i = 0; i < 6; i++) { const tt = t + i * 0.42, g = this.bao(tt, 0.35, 0.03, 0.22, 0.08, this.loc("bandpass", 850, 0.7, ra)); this.phatNhieu(tt, "trang", 0.35, g); this.osc(tt, "sawtooth", 95, g, 0.33); }
    },
    go_phim(t, x, z) {
      const ra = this.diem(x, z, "amMoiTruong", 9, 0.35); if (!ra) return;
      const n = 2 + Math.floor(Math.random() * 5);
      for (let i = 0; i < n; i++) { const tt = t + i * ngauNhien(0.07, 0.16), g = this.bao(tt, ngauNhien(0.25, 0.5), 0.001, 0, 0.025, ra); this.phatNhieu(tt, "trang", 0.03, this.loc("highpass", ngauNhien(2500, 4000), 1, g)); }
    },
    ho_so(t, x, z) { const ra = this.diem(x, z, "amMoiTruong", 15, 0.5); if (!ra) return; const g = this.bao(t, 0.4, 0.05, 0.3, 0.1, ra); this.phatNhieu(t, "hong", 0.5, this.loc("bandpass", 600, 1.5, g)); const g2 = this.bao(t + 0.5, 0.7, 0.002, 0, 0.1, ra); this.osc(t + 0.5, "sine", 90, g2, 0.12); },
    coi(t, x, z) { // còi xe
      const ra = this.diem(x, z, "amMoiTruong", 70, 0.5); if (!ra) return;
      const kieu = Math.random(), lan = kieu < 0.4 ? [0] : kieu < 0.8 ? [0, 0.22] : [0, 0.16, 0.32];
      const f = chon([[420, 520], [380, 470], [520, 650], [300, 360]]), dai = ngauNhien(0.12, 0.4);
      for (const d of lan) { const g = this.bao(t + d, 0.4, 0.01, dai, 0.04, this.loc("lowpass", 1800, 0.8, ra)); this.osc(t + d, "square", f[0], g, dai + 0.05); this.osc(t + d, "square", f[1], g, dai + 0.05); }
    },
    xe_may(t, x, z) { // xe máy chạy ngang
      const ra = this.diem(x, z, "amMoiTruong", 45, 0.4); if (!ra) return;
      const g = this.bao(t, 0.5, 0.9, 0.2, 1.1, this.loc("lowpass", 700, 0.8, ra));
      const o = this.osc(t, "sawtooth", 72, g, 2.3); o.frequency.setValueAtTime(70, t); o.frequency.linearRampToValueAtTime(96, t + 1); o.frequency.linearRampToValueAtTime(64, t + 2.2);
      const g2 = this.bao(t, 0.15, 0.9, 0.2, 1.1, ra); this.phatNhieu(t, "trang", 2.3, this.loc("bandpass", 1500, 0.8, g2));
    },
    go_hu_tieu(t, x, z) { // lóc cóc
      const ra = this.diem(x, z, "amMoiTruong", 30, 0.6); if (!ra) return;
      for (const d of [0, 0.16, 0.6, 0.76, 0.92]) { const g = this.bao(t + d, 0.6, 0.001, 0, 0.05, ra); this.osc(t + d, "sine", 880, g, 0.06); this.phatNhieu(t + d, "trang", 0.04, this.loc("bandpass", 1900, 4, g)); }
    },
    rao(t, x, z) { // tiếng rao: giọng người đơn giản bằng bộ lọc formant
      const ra = this.diem(x, z, "amMoiTruong", 30, 0.35); if (!ra) return;
      const cau = chon([[[247, 0.3], [262, 0.3], [220, 0.55]], [[294, 0.25], [262, 0.25], [247, 0.25], [196, 0.6]], [[220, 0.4], [247, 0.7]]]);
      let d = 0;
      for (const [f, dai] of cau) {
        const g = this.bao(t + d, 0.5, 0.04, dai * 0.6, dai * 0.35, ra);
        const f1 = this.loc("bandpass", chon([750, 600, 500]), 6, g), f2 = this.loc("bandpass", chon([1200, 1700, 1000]), 7, g);
        const o = this.osc(t + d, "sawtooth", f, f1, dai); o.connect(f2); o.frequency.linearRampToValueAtTime(f * 0.94, t + d + dai);
        d += dai + 0.04;
      }
    },
    de(t, x, z) { // dế kêu
      const ra = this.diem(x, z, "amMoiTruong", 20, 0.12); if (!ra) return;
      const g = this.bao(t, 0.4, 0.01, 0.2, 0.05, ra), am = this.ctx.createGain(); am.connect(g); am.gain.value = 0.5;
      this.osc(t, "sine", ngauNhien(4300, 5200), am, 0.3);
      const lfo = this.ctx.createOscillator(); lfo.type = "square"; lfo.frequency.value = ngauNhien(28, 40); const lg = this.ctx.createGain(); lg.gain.value = 0.5; lfo.connect(lg); lg.connect(am.gain); lfo.start(t); lfo.stop(t + 0.3);
    },
    tac_ke(t, x, z) { // "tắc kè" về đêm
      const ra = this.diem(x, z, "amMoiTruong", 25, 0.3); if (!ra) return;
      const n = 3 + Math.floor(Math.random() * 3);
      for (let i = 0; i < n; i++) {
        const tt = t + i * 0.75;
        const g1 = this.bao(tt, 0.5, 0.005, 0.03, 0.05, this.loc("bandpass", 900, 3, ra)); this.osc(tt, "sawtooth", 210, g1, 0.1);
        const g2 = this.bao(tt + 0.16, 0.45, 0.02, 0.12, 0.12, this.loc("bandpass", 700, 3, ra)); const o = this.osc(tt + 0.16, "sawtooth", 170, g2, 0.3); o.frequency.linearRampToValueAtTime(150, tt + 0.42);
      }
    },
    sam(t, x, z, gan = Math.random() < 0.3) { // sấm
      const ra = this.diem(null, null, "amMoiTruong", 1, 0.9);
      const l = this.ctx.createBiquadFilter(); l.type = "lowpass"; l.frequency.setValueAtTime(gan ? 1600 : 500, t); l.frequency.exponentialRampToValueAtTime(90, t + 4); l.connect(this.bao(t, gan ? 1 : 0.6, gan ? 0.02 : 0.4, 0.6, 3.5, ra));
      this.phatNhieu(t, "nau", 5, l);
      if (gan) { const g = this.bao(t, 0.5, 0.002, 0, 0.3, ra); this.phatNhieu(t, "trang", 0.3, this.loc("highpass", 1500, 0.7, g)); }
    },
    nga(t) { const ra = this.diem(null, null, "amHieuUng", 1, 1); const g = this.bao(t, 1, 0.002, 0, 0.4, ra); const o = this.osc(t, "sine", 90, g, 0.45); o.frequency.exponentialRampToValueAtTime(38, t + 0.35); const g2 = this.bao(t, 0.4, 0.002, 0, 0.15, ra); this.phatNhieu(t, "nau", 0.2, this.loc("lowpass", 600, 1, g2)); },
    thang(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.3); [72, 76, 79, 84].forEach((n, i) => { const g = this.bao(t + i * 0.09, 0.5, 0.004, 0.05, 0.3, ra); this.osc(t + i * 0.09, "triangle", hz(n), g, 0.45); }); },
    thua(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.3); [67, 66, 65, 60].forEach((n, i) => { const g = this.bao(t + i * 0.16, 0.5, 0.004, 0.08, 0.3, ra); this.osc(t + i * 0.16, "triangle", hz(n), g, 0.5); }); },
    dung(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.25); const g = this.bao(t, 0.5, 0.002, 0, 0.12, ra); this.osc(t, "square", hz(84), g, 0.14); },
    sai(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.22); const g = this.bao(t, 0.5, 0.002, 0.05, 0.12, this.loc("lowpass", 900, 1, ra)); this.osc(t, "sawtooth", 140, g, 0.2); },
    // ---- đồ vật trong nhà ----
    cua_mo(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 14, 0.5); if (!ra) return; const g = this.bao(t, 0.5, 0.01, 0.05, 0.1, ra); this.phatNhieu(t, "trang", 0.2, this.loc("bandpass", 1600, 3, g)); const g2 = this.bao(t + 0.05, 0.25, 0.08, 0.3, 0.2, ra); const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 6; l.frequency.setValueAtTime(380, t); l.frequency.linearRampToValueAtTime(520, t + 0.5); l.connect(g2); this.phatNhieu(t, "trang", 0.7, l); },
    cua_dong(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 16, 0.7); if (!ra) return; const g = this.bao(t, 0.9, 0.002, 0, 0.18, ra); const o = this.osc(t, "sine", 120, g, 0.2); o.frequency.exponentialRampToValueAtTime(55, t + 0.15); this.phatNhieu(t, "nau", 0.15, this.loc("lowpass", 900, 1, this.bao(t, 0.5, 0.002, 0, 0.1, ra))); },
    ghe(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 10, 0.5); if (!ra) return; const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 2; l.frequency.setValueAtTime(900, t); l.frequency.linearRampToValueAtTime(600, t + 0.35); l.connect(this.bao(t, 0.4, 0.03, 0.2, 0.1, ra)); this.phatNhieu(t, "trang", 0.4, l); const g = this.bao(t + 0.38, 0.5, 0.003, 0, 0.12, ra); this.osc(t + 0.38, "sine", 85, g, 0.15); },
    dat_ly(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 10, 0.5); if (!ra) return; for (const [f, v] of [[2300, 0.5], [3700, 0.25]]) { const g = this.bao(t, v, 0.001, 0, 0.18, ra); this.osc(t, "sine", f, g, 0.2); } },
    thang_may(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 20, 0.4); if (!ra) return; for (const [d, f] of [[0, 1047], [0.25, 784]]) { const g = this.bao(t + d, 0.5, 0.004, 0.05, 0.6, ra); this.osc(t + d, "sine", f, g, 0.7); } },
    // ---- tiếng người theo cảm xúc (giọng tạo bằng bộ lọc formant) ----
    tho_dai(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.22); const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 1.5; l.frequency.setValueAtTime(1300, t); l.frequency.linearRampToValueAtTime(700, t + 0.9); l.connect(this.bao(t, 0.5, 0.15, 0.3, 0.5, ra)); this.phatNhieu(t, "hong", 1.1, l); },
    cuoi(t, x, z, cao = 1) { const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 15, 0.18); if (!ra) return; for (let i = 0; i < 4; i++) { const tt = t + i * 0.13, g = this.bao(tt, 0.5, 0.01, 0.04, 0.05, ra); const f1 = this.loc("bandpass", 800, 5, g), f2 = this.loc("bandpass", 1300, 6, g); const o = this.osc(tt, "sawtooth", (210 - i * 8) * cao, f1, 0.12); o.connect(f2); } },
    u_hu(t, x, z, cao = 1) { const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 15, 0.16); if (!ra) return; const g = this.bao(t, 0.5, 0.03, 0.1, 0.12, ra); const f1 = this.loc("bandpass", 500, 5, g); const o = this.osc(t, "sawtooth", 160 * cao, f1, 0.3); o.frequency.linearRampToValueAtTime(190 * cao, t + 0.25); },
    hoi(t, x, z, cao = 1) { const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 15, 0.16); if (!ra) return; const g = this.bao(t, 0.5, 0.02, 0.12, 0.1, ra); const f1 = this.loc("bandpass", 700, 5, g), f2 = this.loc("bandpass", 1150, 6, g); const o = this.osc(t, "sawtooth", 170 * cao, f1, 0.3); o.connect(f2); o.frequency.linearRampToValueAtTime(260 * cao, t + 0.25); },
    ngap(t, x, z) { const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 12, 0.2); if (!ra) return; const g = this.bao(t, 0.5, 0.25, 0.4, 0.4, ra); const f1 = this.loc("bandpass", 650, 4, g); const o = this.osc(t, "sawtooth", 210, f1, 1.1); o.frequency.linearRampToValueAtTime(140, t + 1); f1.frequency.linearRampToValueAtTime(420, t + 1); },
    // ---- tai nạn, xe máy ----
    thang_gap(t, x, z) { // tiếng lốp rít khi thắng gấp
      const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 60, 0.55); if (!ra) return;
      const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 9; l.frequency.setValueAtTime(3100, t); l.frequency.linearRampToValueAtTime(2500, t + 0.9);
      l.connect(this.bao(t, 0.9, 0.03, 0.55, 0.35, ra)); this.phatNhieu(t, "trang", 1.0, l);
      const g = this.bao(t, 0.12, 0.05, 0.5, 0.3, this.loc("bandpass", 1800, 6, ra)); const o = this.osc(t, "sawtooth", 1750, g, 0.9); o.frequency.linearRampToValueAtTime(1500, t + 0.85);
    },
    va_cham(t) { // cú va mạnh: tiếng uỵch trầm + tiếng kim loại
      const ra = this.diem(null, null, "amHieuUng", 1, 1);
      const g = this.bao(t, 1, 0.002, 0.02, 0.45, ra); const o = this.osc(t, "sine", 85, g, 0.5); o.frequency.exponentialRampToValueAtTime(32, t + 0.4);
      const g2 = this.bao(t, 0.7, 0.001, 0, 0.22, ra); this.phatNhieu(t, "nau", 0.3, this.loc("lowpass", 1200, 0.8, g2));
      const g3 = this.bao(t, 0.25, 0.001, 0, 0.35, ra); this.phatNhieu(t, "trang", 0.4, this.loc("bandpass", 2400, 3, g3));
    },
    tong(t, x, z) { this.HIEU_UNG.thang_gap.call(this, t, x, z); this.HIEU_UNG.va_cham.call(this, t + 0.42); },
    va_nhe(t, x, z) { const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 12, 0.6); if (!ra) return; const g = this.bao(t, 0.7, 0.002, 0, 0.18, ra); const o = this.osc(t, "sine", 120, g, 0.2); o.frequency.exponentialRampToValueAtTime(50, t + 0.15); const g2 = this.bao(t, 0.3, 0.001, 0, 0.12, ra); this.phatNhieu(t, "trang", 0.15, this.loc("bandpass", 1500, 2, g2)); },
    de_xe(t) { // đề máy xe tay ga
      const ra = this.diem(null, null, "amHieuUng", 1, 0.35);
      const g = this.bao(t, 0.5, 0.02, 0.35, 0.1, this.loc("lowpass", 900, 0.8, ra)); const o = this.osc(t, "sawtooth", 55, g, 0.5); o.frequency.linearRampToValueAtTime(80, t + 0.4);
    },
    nhay(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.18); const g = this.bao(t, 0.4, 0.002, 0, 0.08, ra); this.phatNhieu(t, "trang", 0.1, this.loc("bandpass", 1400, 1, g)); },
    dem_nguoc(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.25); const g = this.bao(t, 0.5, 0.002, 0.05, 0.1, ra); this.osc(t, "sine", 880, g, 0.18); },
  };

  // Tiếng "bíp bíp" khi một câu thoại hiện ra, cao độ riêng theo người nói
  blip(ten = "") {
    if (!this.ctx) return;
    let s = 0; for (const ch of ten) s = (s * 31 + ch.charCodeAt(0)) >>> 0;
    const goc = 64 + (s % 12), t = this.ctx.currentTime, ra = this.diem(null, null, "amHieuUng", 1, 0.07);
    for (let i = 0; i < 3; i++) { const g = this.bao(t + i * 0.055, 0.5, 0.002, 0.015, 0.02, this.loc("lowpass", 2400, 0.7, ra)); this.osc(t + i * 0.055, "square", hz(goc + NGU_CUNG[(s >>> i) % 5]), g, 0.05); }
  }

  // ---------- Còi xe cấp cứu, nhịp tim ----------
  coiCapCuu(bat) {
    if (!this.mo()) return;
    if (bat && !this.coiNut) {
      const c = this.ctx, g = c.createGain(); g.gain.value = 0; const p = c.createStereoPanner(); g.connect(p); p.connect(this.bus.amHieuUng);
      const o = c.createOscillator(); o.type = "square"; const l = this.loc("lowpass", 2400, 0.8, g); o.connect(l);
      const t = c.currentTime;
      for (let i = 0; i < 160; i++) o.frequency.setValueAtTime(i % 2 ? 770 : 960, t + i * 0.45);
      o.start(t); o.stop(t + 72);
      this.coiNut = { g, p, o };
    } else if (!bat && this.coiNut) { const n = this.coiNut; n.g.gain.setTargetAtTime(0, this.ctx.currentTime, 0.4); setTimeout(() => { try { n.o.stop(); } catch {} }, 1500); this.coiNut = null; }
  }
  datCoi(x, z) {
    const n = this.coiNut; if (!n) return;
    const dx = x - this.nghe.x, dz = z - this.nghe.z, d = Math.hypot(dx, dz);
    n.g.gain.setTargetAtTime(0.28 * Math.pow(kep(1 - d / 120, 0.05, 1), 1.3), this.ctx.currentTime, 0.1);
    const phai = dx * Math.cos(this.nghe.yaw) - dz * Math.sin(this.nghe.yaw);
    n.p.pan.setTargetAtTime(d > 0.5 ? kep(phai / d, -1, 1) * 0.7 : 0, this.ctx.currentTime, 0.1);
  }
  tim(muc) { this.mucTim = muc; }

  // ---------- Tiếng máy xe máy của người chơi: muc 0..1 (ga), null: tắt máy ----------
  dongCo(muc) {
    if (!this.ctx) return;
    const c = this.ctx, t = c.currentTime;
    if (muc == null) {
      const n = this.dc; if (!n) return; this.dc = null;
      n.g.gain.setTargetAtTime(0, t, 0.15); setTimeout(() => { try { n.o1.stop(); n.o2.stop(); n.lfo.stop(); } catch {} }, 900);
      return;
    }
    if (!this.dc) {
      const g = c.createGain(); g.gain.value = 0; g.connect(this.bus.amHieuUng);
      const l = this.loc("lowpass", 600, 0.9, g);
      const am = c.createGain(); am.gain.value = 0.6; am.connect(l);
      const o1 = c.createOscillator(); o1.type = "sawtooth"; o1.connect(am);
      const o2 = c.createOscillator(); o2.type = "square"; const g2 = c.createGain(); g2.gain.value = 0.35; o2.connect(g2); g2.connect(am);
      const lfo = c.createOscillator(); lfo.type = "sine"; const lg = c.createGain(); lg.gain.value = 0.35; lfo.connect(lg); lg.connect(am.gain); // tiếng "phành phạch" của máy một xi-lanh
      o1.start(); o2.start(); lfo.start();
      this.dc = { g, l, o1, o2, lfo };
    }
    const n = this.dc, f = 34 + muc * 72;
    n.o1.frequency.setTargetAtTime(f, t, 0.12); n.o2.frequency.setTargetAtTime(f * 0.5, t, 0.12); n.lfo.frequency.setTargetAtTime(f * 0.5, t, 0.12);
    n.l.frequency.setTargetAtTime(420 + muc * 1500, t, 0.15);
    n.g.gain.setTargetAtTime(0.05 + muc * 0.08, t, 0.15);
  }

  // ---------- Cập nhật theo trạng thái game, gọi mỗi khung hình ----------
  capNhatGame(g, dt) {
    if (!this.ctx) { if (!this.mo()) return; }
    const p = g.p, gio = g.bauTroi.gio, tt = g.bauTroi.tt;
    this.nghe.x = p.x; this.nghe.z = p.z; this.nghe.yaw = g.yaw; this.nghe.tang = g.tang;
    const ngoaiCanh = g.viTriNgoai?.(); // đang ở một địa điểm ngoài công ty
    const trong = ngoaiCanh ? !!ngoaiCanh.trongNha : g.trongNha();
    const dem = gio >= 19 || gio < 5.5;
    const sanKhau = g.tang === 0 && p.x > 86 && p.x < 135;
    const lamViec = gio >= 7.8 && gio < 18;

    // nhạc nền theo giờ
    this.nhac(gio < 11.5 && gio >= 5 ? "sang" : gio < 17 && gio >= 5 ? "trua" : gio < 20 && gio >= 5 ? "chieu" : "dem");
    const sk = g.sanKhau?.amThanh;
    this.giamNhac(g.capCuu ? 0 : sk && sk.cheDo !== "im" ? kep(1 - (sk.amLuong || 0) * 2.5, 0, 1) : 1);

    // phố: xa đường thì nhỏ, trong nhà thì nghe bị bịt
    const kcDuong = Math.max(0, Math.min(Math.abs(p.z - 37) - 5, Math.abs(p.x - 52) - 5.4));
    const gioCaoDiem = (gio > 7 && gio < 9) || (gio > 16.8 && gio < 19) ? 1.3 : gio < 5.5 || gio > 23 ? 0.25 : 1;
    let pho = ngoaiCanh ? (ngoaiCanh.pho ?? 0) : kep(1 - kcDuong / 45, 0.05, 1) * gioCaoDiem;
    if (trong) pho *= g.tang === 0 ? 0.25 : 0.15;
    if (sanKhau) pho *= 0.3;
    this.datLop("pho", 0.55 * pho); this.datLop("lop_xe", 0.05 * pho * (tt.mua ? 2 : 1));
    // văn phòng: máy lạnh và tiếng nói chuyện
    const vp = !ngoaiCanh && trong;
    this.datLop("dieu_hoa", vp ? 0.09 : ngoaiCanh?.trongNha ? 0.05 : 0); this.datLop("dieu_hoa_u", vp ? 0.012 : 0);
    let gan = 0;
    if (!ngoaiCanh) for (const n of g.npc) if (n.nv.group.visible && n.tang === g.tang && Math.hypot(n.nv.group.position.x - p.x, n.nv.group.position.z - p.z) < 9) gan++;
    const riRao = (vp ? Math.min(1, gan / 6) : 0) + (ngoaiCanh?.dongNguoi ?? 0);
    this.datLop("ri_rao", 0.05 * riRao * (0.7 + 0.3 * Math.sin(g.t * 0.9) * Math.sin(g.t * 2.3)), 0.3);
    // mưa, gió, biển
    const mua = (tt.mua || 0) / 2600;
    this.datLop("mua", (trong ? 0.12 : 0.5) * mua);
    if (this.lop.mua) this.lop.mua.locs[1].frequency.setTargetAtTime(trong ? 1600 : 7000, this.ctx.currentTime, 0.5);
    const gioThoi = trong ? 0 : (g.tang === 2 ? 0.35 : 0.08) + (tt.set ? 0.25 : 0) + mua * 0.1 + (ngoaiCanh?.gio ?? 0);
    this.datLop("gio", gioThoi * (0.7 + 0.3 * Math.sin(g.t * 0.4)), 1.2);
    if (this.lop.gio) this.lop.gio.locs[0].frequency.setTargetAtTime(380 + 260 * Math.sin(g.t * 0.27), this.ctx.currentTime, 1);
    this.datLop("bien", (ngoaiCanh?.bien ?? 0) * (0.25 + 0.2 * Math.sin(g.t * 0.6)), 0.8);

    // sấm theo tia chớp
    const chop = g.bauTroi.chop || 0;
    if (chop > 0 && this.chopCu <= 0) { const tre = ngauNhien(0.4, 2.2); setTimeout(() => this.phat("sam"), tre * 1000); }
    this.chopCu = chop;

    // bước chân
    if (g.dangDi && !g.khoa) {
      this.tBuoc -= dt * (g.hsToc ?? 1);
      if (this.tBuoc <= 0) { this.tBuoc = g.dangChay ? 0.31 : 0.47; this.buocChan(this.beMat(g, ngoaiCanh), g.dangChay); }
    } else this.tBuoc = 0.08;

    // tiếng lẻ tẻ ngẫu nhiên quanh người chơi
    const lan = (ten, tb, f) => { this.henGio[ten] = (this.henGio[ten] ?? ngauNhien(0, tb)) - dt; if (this.henGio[ten] <= 0) { this.henGio[ten] = ngauNhien(tb * 0.5, tb * 1.5); f(); } };
    if (!sanKhau && pho > 0.15 && !dem) lan("coi", 7 / pho, () => this.phat("coi", p.x + ngauNhien(-30, 30), ngoaiCanh ? p.z + ngauNhien(-20, 20) : 37));
    if (!sanKhau && pho > 0.2) lan("xe_may", 5 / pho, () => this.phat("xe_may", p.x + ngauNhien(-15, 15), ngoaiCanh ? p.z + 8 : 37));
    if (!ngoaiCanh && !dem) {
      if (Math.hypot(p.x - 40, p.z - 42.4) < 32) lan("hu_tieu", 9, () => this.phat("go_hu_tieu", 40, 43));
      const xe = [[-6, 42.6], [13.5, 43.3], [66, 32.4], [-40, 32.4]].filter(([x, z]) => Math.hypot(p.x - x, p.z - z) < 28);
      if (xe.length) lan("rao", 16, () => { const [x, z] = chon(xe); this.phat("rao", x, z); });
    }
    if (vp && lamViec) {
      // gõ phím của người đang ngồi máy gần đó
      for (const n of g.npc) {
        if (!n.nv.ngoi || !n.nv.group.visible || n.tang !== g.tang) continue;
        const q = n.nv.group.position; if (Math.hypot(q.x - p.x, q.z - p.z) > 9) continue;
        if (Math.random() < dt * 0.6) this.phat("go_phim", q.x, q.z);
      }
      lan("chuong_dt", 55, () => { const ds = g.npc.filter(n => n.nv.group.visible && n.tang === g.tang); const n = ds.length && chon(ds); if (n) this.phat("chuong_dt", n.nv.group.position.x, n.nv.group.position.z); });
      // đồng nghiệp đang lấy nước, in tài liệu, mở tủ hồ sơ
      for (const n of g.npc) {
        const dd = n.diDao; if (!dd || !(dd.cho > 0) || dd._am) continue;
        dd._am = true; const d = dd.d; this.phat(d.z < 1 ? "ong_nuoc" : d.x > -4 ? "may_in" : "ho_so", d.x, d.z);
      }
    }
    // bồ câu
    for (const c of g.dongVat?.chim || []) {
      if (c.bay > 0 && !this.chimBay.has(c)) { this.chimBay.add(c); if (Math.random() < 0.5) this.phat("chim_vo", c.x, c.z); }
      else if (!(c.bay > 0)) this.chimBay.delete(c);
    }
    if (!ngoaiCanh && g.tang === 0 && !dem && Math.hypot(p.x + 15, p.z - 22) < 16) lan("chim_gu", 6, () => this.phat("chim_gu", -15 + ngauNhien(-4, 4), 22 + ngauNhien(-5, 5)));
    // ban đêm: dế, tắc kè
    if (dem && !trong) lan("de", 0.7, () => this.phat("de", p.x + ngauNhien(-12, 12), p.z + ngauNhien(-12, 12)));
    if (dem && !ngoaiCanh) lan("tac_ke", 70, () => this.phat("tac_ke", p.x + ngauNhien(-10, 10), p.z + ngauNhien(-10, 10)));

    // nhịp tim khi cơ thể sắp kiệt
    if (this.mucTim > 0.01) {
      this.tTim -= dt;
      if (this.tTim <= 0) {
        this.tTim = 60 / (72 + 55 * this.mucTim);
        const t = this.ctx.currentTime, ra = this.diem(null, null, "amHieuUng", 1, 0.35 + 0.5 * this.mucTim);
        for (const [d, f, v] of [[0, 58, 1], [0.17, 50, 0.7]]) { const gg = this.bao(t + d, v, 0.008, 0, 0.13, this.loc("lowpass", 160, 1, ra)); this.osc(t + d, "sine", f, gg, 0.16); }
      }
    }
  }
  beMat(g, ngoaiCanh) {
    if (ngoaiCanh?.beMat) return ngoaiCanh.beMat;
    const p = g.p;
    if (g.tang === 2) return "da";
    if (g.tang === 1) return Math.abs(p.x - 5) < 1.4 && p.z > 3 && p.z < 13 ? "go" : "tham";
    if (p.x > 12 && p.x < 20.5 && p.z > -13 && p.z < -6) return "gach"; // nhà vệ sinh
    if (g.trongNha()) return p.x < -3 && p.z > -1 && p.z < 13 ? "tham" : "gach";
    if (p.z > 31.5 && p.z < 42.5 && Math.abs(p.z - 37) < 4.9) return "nhua";
    if (p.x > 86) return "da";
    return "da";
  }
  huyGame() {
    if (!this.ctx) return;
    for (const k of Object.keys(this.lop)) this.datLop(k, 0, 0.2);
    this.coiCapCuu(false); this.mucTim = 0; this.dongCo(null);
  }
}

export const am = new AmThanhGame();
window.__am = am; // để kiểm thử tự động
// bấm hoặc chạm lần đầu: mở âm thanh; nút bấm có tiếng "tách"
addEventListener("pointerdown", e => { am.mo(); if (e.target.closest?.("button, .the-vai, .choice, [role=button]")) am.phat("click"); }, true);
addEventListener("keydown", () => am.mo(), true);
