// Âm thanh sân khấu tự tạo bằng Web Audio (không cần file nhạc):
// đêm diễn: trống, bass, giai điệu theo vòng hợp âm Am - F - C - G, kèm tiếng khán giả hò reo;
// những ngày trước: thử loa (vài tiếng trống, bass lẻ tẻ).
export class AmThanhSanKhau {
  constructor() { this.ctx = null; this.cheDo = "im"; this.amLuong = 0; this.buoc = 0; this.reo = 0; }
  batDau() {
    if (this.ctx) return true;
    // trình duyệt chỉ cho phát tiếng sau khi người chơi đã bấm/chạm
    if (navigator.userActivation && !navigator.userActivation.hasBeenActive) return false;
    try { this.ctx = new (window.AudioContext || window.webkitAudioContext)(); } catch { return false; }
    const c = this.ctx;
    this.tong = c.createGain(); this.tong.gain.value = 0;
    const nen = c.createDynamicsCompressor(); this.tong.connect(nen); nen.connect(c.destination);
    // nhiễu trắng dùng chung cho trống snare, hi-hat, tiếng đám đông
    const buf = c.createBuffer(1, c.sampleRate * 2, c.sampleRate), d = buf.getChannelData(0);
    for (let i = 0; i < d.length; i++) d[i] = Math.random() * 2 - 1;
    this.nhieu = buf;
    // tiếng đám đông: nhiễu lọc dải, to nhỏ theo sóng chậm
    const dd = c.createBufferSource(); dd.buffer = buf; dd.loop = true;
    const loc = c.createBiquadFilter(); loc.type = "bandpass"; loc.frequency.value = 900; loc.Q.value = 0.6;
    this.amDam = c.createGain(); this.amDam.gain.value = 0;
    dd.connect(loc); loc.connect(this.amDam); this.amDam.connect(this.tong); dd.start();
    this.tiep = c.currentTime + 0.1;
    this.hen = setInterval(() => this.lich(), 25);
    return true;
  }
  datCheDo(cheDo) { this.cheDo = cheDo; }
  // âm lượng 0..1 theo khoảng cách tới sân khấu
  datAmLuong(v) { this.amLuong = v; if (this.ctx) this.tong.gain.setTargetAtTime(v * (this.cheDo === "im" ? 0 : 0.55), this.ctx.currentTime, 0.3); }
  reoHo() { this.reo = 1; }
  // ---- nhạc cụ ----
  kick(t, to = 1) { const c = this.ctx, o = c.createOscillator(), g = c.createGain(); o.frequency.setValueAtTime(140, t); o.frequency.exponentialRampToValueAtTime(42, t + 0.18); g.gain.setValueAtTime(0.9 * to, t); g.gain.exponentialRampToValueAtTime(0.001, t + 0.32); o.connect(g); g.connect(this.tong); o.start(t); o.stop(t + 0.35); }
  nhieuNgan(t, loai, f, dai, to) { const c = this.ctx, s = c.createBufferSource(), l = c.createBiquadFilter(), g = c.createGain(); s.buffer = this.nhieu; l.type = loai; l.frequency.value = f; g.gain.setValueAtTime(to, t); g.gain.exponentialRampToValueAtTime(0.001, t + dai); s.connect(l); l.connect(g); g.connect(this.tong); s.start(t, Math.random()); s.stop(t + dai + 0.02); }
  not(t, tanSo, dai, kieu, to, loc = 2400) { const c = this.ctx, o = c.createOscillator(), l = c.createBiquadFilter(), g = c.createGain(); o.type = kieu; o.frequency.value = tanSo; l.type = "lowpass"; l.frequency.value = loc; g.gain.setValueAtTime(0.0001, t); g.gain.exponentialRampToValueAtTime(to, t + 0.01); g.gain.exponentialRampToValueAtTime(0.0001, t + dai); o.connect(l); l.connect(g); g.connect(this.tong); o.start(t); o.stop(t + dai + 0.05); }
  lich() {
    const c = this.ctx; if (!c) return;
    const nhip = 60 / 120 / 4; // nốt móc kép ở 120 BPM
    const HOP_AM = [[57, 60, 64], [53, 57, 60], [48, 52, 55], [55, 59, 62]]; // Am F C G (số MIDI)
    const hz = m => 440 * Math.pow(2, (m - 69) / 12);
    while (this.tiep < c.currentTime + 0.12) {
      const t = this.tiep, b = this.buoc % 16, o = Math.floor(this.buoc / 16) % 4, ha = HOP_AM[o];
      if (this.cheDo === "dien") {
        if (b % 4 === 0) this.kick(t);
        if (b === 4 || b === 12) this.nhieuNgan(t, "bandpass", 1800, 0.18, 0.5);
        if (b % 2 === 0) this.nhieuNgan(t, "highpass", 7000, 0.05, 0.18);
        if (b % 4 === 2) this.not(t, hz(ha[0] - 24), nhip * 2, "sawtooth", 0.35, 600);           // bass
        if ([0, 3, 6, 8, 11, 14].includes(b)) this.not(t, hz(ha[[0, 1, 2, 1, 2, 0][[0, 3, 6, 8, 11, 14].indexOf(b)]] + 12), nhip * 1.6, "square", 0.08, 3000); // giai điệu
        if (b === 0) for (const n of ha) this.not(t, hz(n), nhip * 15, "triangle", 0.05, 1800); // pad hợp âm
      } else if (this.cheDo === "thu") {
        // thử loa: vài tiếng trống, bass lẻ tẻ
        if (this.buoc % 32 === 0 || this.buoc % 32 === 4) this.kick(t, 0.7);
        if (this.buoc % 64 === 16) this.not(t, hz(45), 0.6, "sawtooth", 0.3, 500);
      }
      this.tiep += nhip; this.buoc++;
    }
    // tiếng đám đông: đêm diễn mới có, hò reo thì to lên rồi lắng dần
    const muc = this.cheDo === "dien" ? 0.12 + this.reo * 0.5 : 0;
    this.amDam.gain.setTargetAtTime(muc, c.currentTime, 0.4);
    this.reo *= 0.995;
  }
  huy() { clearInterval(this.hen); try { this.ctx?.close(); } catch {} this.ctx = null; }
}
