// Tiếng hiệu ứng cho các đồ vật, động tác mới (tạo bằng bộ dao động / nhiễu như các tiếng có sẵn trong am-thanh-game.js):
// bíp nút bấm, kẹt giấy, đập máy, ngăn kéo, bút lông, máy chấm công, chuông, tưới nước, công tắc, xu rơi, lon rơi, mở lon,
// bi lắc, ngáy, golf, gảy đàn, chụp ảnh, thẻ ATM, máy ATM đếm tiền, giấy sột soạt, bỏ rác, đá cầu, vù vù, nhạc nhún nhảy,
// reo hò, bấm điện thoại.
import { am } from "../am-thanh-game.js";

const r = (a, b) => a + Math.random() * (b - a);
const hz = n => 440 * Math.pow(2, (n - 69) / 12);
// nốt ngắn (sine / square...) tại thời điểm tt
function not(self, ra, tt, f, dai, to, kieu = "sine") { const g = self.bao(tt, to, 0.003, 0, dai, ra); self.osc(tt, kieu, f, g, dai + 0.02); }
// tiếng gõ / va (nhiễu lọc dải)
function go(self, ra, tt, f, dai, to, q = 1.5, nhieu = "trang") { const g = self.bao(tt, to, 0.002, 0, dai, ra); self.phatNhieu(tt, nhieu, dai + 0.03, self.loc("bandpass", f, q, g)); }

const THEM = {
  bip(t, x, z) { const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 12, 0.35); if (!ra) return; not(this, ra, t, 1975, 0.08, 0.5, "square"); },
  ket_giay(t, x, z) { // kẹt giấy: rè rè rồi bíp báo lỗi
    const ra = this.diem(x, z, "amHieuUng", 16, 0.6); if (!ra) return;
    const g = this.bao(t, 0.4, 0.02, 0.5, 0.05, this.loc("bandpass", 700, 2, ra)); this.osc(t, "sawtooth", 62, g, 0.6); this.phatNhieu(t, "trang", 0.6, this.loc("bandpass", 1400, 1, this.bao(t, 0.25, 0.02, 0.5, 0.05, ra)));
    for (let i = 0; i < 3; i++) not(this, ra, t + 0.75 + i * 0.22, 880, 0.12, 0.5, "square");
  },
  dap_may(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 16, 0.8); if (!ra) return; const g = this.bao(t, 0.9, 0.002, 0, 0.16, ra); const o = this.osc(t, "sine", 140, g, 0.18); o.frequency.exponentialRampToValueAtTime(60, t + 0.12); go(this, ra, t, 900, 0.1, 0.6, 1); },
  ngan_keo(t, x, z) { // ngăn kéo kim loại kéo ra
    const ra = this.diem(x, z, "amHieuUng", 14, 0.6); if (!ra) return;
    const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 3; l.frequency.setValueAtTime(1200, t); l.frequency.linearRampToValueAtTime(1800, t + 0.35); l.connect(this.bao(t, 0.35, 0.03, 0.25, 0.08, ra));
    this.phatNhieu(t, "trang", 0.4, l); go(this, ra, t + 0.38, 600, 0.08, 0.6, 2, "hong");
  },
  but_long(t, x, z) { // bút lông kít kít trên bảng
    const ra = this.diem(x, z, "amHieuUng", 10, 0.35); if (!ra) return;
    for (let i = 0; i < 6; i++) { const tt = t + i * r(0.18, 0.3), g = this.bao(tt, 0.25, 0.02, 0.08, 0.05, ra); const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 8; l.frequency.setValueAtTime(r(2600, 3400), tt); l.frequency.linearRampToValueAtTime(r(3600, 4400), tt + 0.12); l.connect(g); this.phatNhieu(tt, "trang", 0.16, l); }
  },
  cham_cong(t, x, z) { // máy chấm công vân tay: bíp + "tít tít" xác nhận
    const ra = this.diem(x, z, "amHieuUng", 12, 0.4); if (!ra) return;
    not(this, ra, t, 1568, 0.1, 0.5); not(this, ra, t + 0.15, 2093, 0.18, 0.5);
  },
  chuong(t, x, z) { // chuông đồng nhỏ trên bàn thờ
    const ra = this.diem(x, z, "amHieuUng", 18, 0.35); if (!ra) return;
    for (const [f, v, d] of [[1046, 0.5, 2.2], [2737, 0.18, 1.2], [1568, 0.12, 1.6]]) not(this, ra, t, f, d, v);
  },
  tuoi_nuoc(t, x, z) { // nước chảy từ vòi sen bình tưới xuống lá
    const ra = this.diem(x, z, "amHieuUng", 12, 0.5); if (!ra) return;
    const g = this.bao(t, 0.4, 0.3, 1.2, 0.5, ra); const am2 = this.ctx.createGain(); am2.connect(this.loc("bandpass", 3200, 0.9, g));
    this.phatNhieu(t, "trang", 2.1, am2); for (let i = 0; i < 18; i++) am2.gain.setValueAtTime(r(0.55, 1), t + i * 0.11);
  },
  cong_tac(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 12, 0.5); if (!ra) return; go(this, ra, t, 2400, 0.03, 0.7, 3); go(this, ra, t + 0.012, 900, 0.03, 0.4, 2); },
  xu(t, x, z) { // đồng xu rơi vào máy
    const ra = this.diem(x, z, "amHieuUng", 12, 0.5); if (!ra) return;
    for (let i = 0; i < 4; i++) { const tt = t + i * (0.09 - i * 0.015); not(this, ra, tt, 3800 + i * 300, 0.06, 0.35 - i * 0.06); }
  },
  lon_roi(t, x, z) { // lon nước lăn rơi xuống khay: lục cục, cạch
    const ra = this.diem(x, z, "amHieuUng", 14, 0.7); if (!ra) return;
    for (let i = 0; i < 4; i++) go(this, ra, t + i * 0.12, r(500, 900), 0.06, 0.5, 2);
    const g = this.bao(t + 0.55, 0.8, 0.002, 0, 0.2, ra); const o = this.osc(t + 0.55, "sine", 210, g, 0.22); o.frequency.exponentialRampToValueAtTime(120, t + 0.7); go(this, ra, t + 0.55, 1500, 0.12, 0.5, 4);
  },
  mo_lon(t, x, z) { // tách! xèèè
    const ra = this.diem(x, z, "amHieuUng", 10, 0.6); if (!ra) return;
    go(this, ra, t, 3000, 0.02, 0.8, 2); const g = this.bao(t + 0.02, 0.45, 0.01, 0.15, 0.5, ra); this.phatNhieu(t + 0.02, "trang", 0.7, this.loc("highpass", 5000, 0.7, g));
  },
  bi_lac(t, x, z) { // bi lắc: lạch cạch, bóng nảy
    const ra = this.diem(x, z, "amHieuUng", 14, 0.55); if (!ra) return;
    for (let i = 0; i < 7; i++) go(this, ra, t + i * r(0.07, 0.16), r(900, 1600), 0.04, r(0.35, 0.7), 3);
  },
  ngay(t, x, z) { // ngáy khò khò
    const ra = this.diem(x, z, "amHieuUng", 10, 0.3); if (!ra) return;
    const g = this.bao(t, 0.5, 0.5, 0.2, 0.6, this.loc("lowpass", 500, 1, ra)); const o = this.osc(t, "sawtooth", 70, g, 1.3);
    const lfo = this.ctx.createOscillator(); lfo.frequency.value = 38; const lg = this.ctx.createGain(); lg.gain.value = 18; lfo.connect(lg); lg.connect(o.frequency); lfo.start(t); lfo.stop(t + 1.3);
  },
  golf(t, x, z) { // cạch nhẹ, bóng lăn, rơi lỗ (nếu trúng)
    const ra = this.diem(x, z, "amHieuUng", 12, 0.6); if (!ra) return;
    go(this, ra, t, 2600, 0.03, 0.8, 4); const g = this.bao(t + 0.05, 0.12, 0.05, 0.6, 0.3, ra); this.phatNhieu(t + 0.05, "hong", 1, this.loc("bandpass", 500, 1, g));
    if (Math.random() < 0.5) { go(this, ra, t + 1.0, 700, 0.06, 0.7, 3); go(this, ra, t + 1.1, 500, 0.06, 0.5, 3); }
  },
  guitar(t, x, z) { // quạt một hợp âm (Am / C / G ngẫu nhiên): các dây vang lệch nhau chút ít
    const ra = this.diem(x, z, "amHieuUng", 18, 0.4); if (!ra) return;
    const hop = [[45, 52, 57, 60, 64], [48, 52, 55, 60, 64], [43, 47, 50, 55, 59, 67]][Math.floor(Math.random() * 3)];
    for (let lan = 0; lan < 3; lan++) hop.forEach((n, i) => {
      const tt = t + lan * 0.42 + i * 0.012, l = this.ctx.createBiquadFilter(); l.type = "lowpass"; l.frequency.setValueAtTime(3200, tt); l.frequency.exponentialRampToValueAtTime(700, tt + 0.6); l.connect(ra);
      const g = this.bao(tt, 0.16, 0.003, 0, 0.9, l); this.osc(tt, "triangle", hz(n), g, 0.95); this.osc(tt, "sawtooth", hz(n) * 1.001, this.bao(tt, 0.03, 0.002, 0, 0.3, l), 0.35);
    });
  },
  chup(t) { // tách (màn trập)
    const ra = this.diem(null, null, "amHieuUng", 1, 0.35);
    go(this, ra, t, 3500, 0.025, 0.8, 1.5); go(this, ra, t + 0.07, 2200, 0.04, 0.6, 1.5);
  },
  the_vao(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 10, 0.5); if (!ra) return; const g = this.bao(t, 0.3, 0.02, 0.25, 0.05, this.loc("lowpass", 900, 1, ra)); this.osc(t, "sawtooth", 90, g, 0.35); go(this, ra, t + 0.32, 1200, 0.03, 0.5, 3); },
  atm(t, x, z) { // máy đếm tiền rè rè + bíp
    const ra = this.diem(x, z, "amHieuUng", 12, 0.5); if (!ra) return;
    const g = this.bao(t, 0.3, 0.05, 0.9, 0.1, this.loc("bandpass", 1100, 1.2, ra)); this.osc(t, "sawtooth", 140, g, 1.1);
    for (let i = 0; i < 10; i++) go(this, ra, t + 0.1 + i * 0.08, 2600, 0.02, 0.3, 4);
    not(this, ra, t + 1.15, 1568, 0.1, 0.4, "square");
  },
  giay(t, x, z) { const ra = this.diem(x ?? null, z ?? null, "amHieuUng", 8, 0.3); if (!ra) return; for (let i = 0; i < 3; i++) go(this, ra, t + i * 0.09, r(2500, 4500), 0.07, 0.4, 0.8); },
  bo_rac(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 10, 0.6); if (!ra) return; go(this, ra, t, 500, 0.12, 0.7, 1, "hong"); go(this, ra, t + 0.05, 1800, 0.06, 0.4, 2); },
  da_cau(t, x, z) { const ra = this.diem(x, z, "amHieuUng", 12, 0.5); if (!ra) return; go(this, ra, t, 1300, 0.04, 0.8, 2.5); const g = this.bao(t, 0.5, 0.002, 0, 0.06, ra); this.osc(t, "sine", 260, g, 0.07); },
  vu_vu(t) { // tiếng gió khi vung tay
    const ra = this.diem(null, null, "amHieuUng", 1, 0.12);
    const l = this.ctx.createBiquadFilter(); l.type = "bandpass"; l.Q.value = 1.2; l.frequency.setValueAtTime(500, t); l.frequency.exponentialRampToValueAtTime(1600, t + 0.3); l.frequency.exponentialRampToValueAtTime(500, t + 0.6); l.connect(this.bao(t, 0.5, 0.2, 0, 0.4, ra));
    this.phatNhieu(t, "hong", 0.7, l);
  },
  nhac_nhay(t) { // vài nhịp nhạc vui khi nhún nhảy
    const ra = this.diem(null, null, "amHieuUng", 1, 0.25), nhip = 60 / 128 / 2, giai = [72, 76, 79, 76, 74, 77, 81, 77, 72, 76, 79, 84, 79, 76, 72, 67];
    for (let i = 0; i < 16; i++) {
      const tt = t + i * nhip;
      if (i % 4 === 0) this.trongKick(tt, 0.5, ra);
      if (i % 4 === 2) this.nhieuNgan(tt, "bandpass", 1800, 0.08, 0.15, ra);
      this.nhieuNgan(tt, "highpass", 8000, 0.02, 0.04, ra);
      not(this, ra, tt, hz(giai[i]), nhip * 0.8, 0.12, "square");
      if (i % 8 === 0) not(this, ra, tt, hz(giai[i] - 24), nhip * 3.5, 0.18, "triangle");
    }
  },
  an_mung(t) { // "Yeah!" cả đám: nhiễu lọc formant + kèn nhỏ
    const ra = this.diem(null, null, "amHieuUng", 1, 0.25);
    const g = this.bao(t, 0.5, 0.05, 0.3, 0.4, ra), f1 = this.loc("bandpass", 750, 5, g), f2 = this.loc("bandpass", 1250, 6, g);
    const o = this.osc(t, "sawtooth", 230, f1, 0.8); o.connect(f2); o.frequency.linearRampToValueAtTime(300, t + 0.25); o.frequency.linearRampToValueAtTime(260, t + 0.7);
    [72, 76, 79, 84].forEach((n, i) => not(this, ra, t + 0.15 + i * 0.08, hz(n), 0.25, 0.12, "triangle"));
  },
  bam_dt(t) { const ra = this.diem(null, null, "amHieuUng", 1, 0.08); for (let i = 0; i < 3; i++) go(this, ra, t + i * r(0.12, 0.25), 4200, 0.015, 0.5, 4); },
  rao_ve_so(t, x, z) { // tiếng rao (giọng formant giống tiếng rao có sẵn, cao hơn)
    const ra = this.diem(x, z, "amMoiTruong", 26, 0.35); if (!ra) return;
    let d = 0;
    for (const [f, dai] of [[294, 0.22], [330, 0.22], [262, 0.3], [294, 0.5]]) {
      const g = this.bao(t + d, 0.5, 0.04, dai * 0.6, dai * 0.35, ra), f1 = this.loc("bandpass", 650, 6, g), f2 = this.loc("bandpass", 1500, 7, g);
      const o = this.osc(t + d, "sawtooth", f, f1, dai); o.connect(f2); d += dai + 0.05;
    }
  },
};
Object.assign(am.HIEU_UNG, THEM);
