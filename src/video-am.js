// Video có tiếng cho ứng dụng trong điện thoại (Tóp-tóp, Diu-túp).
// Màn chiếu ngoài quảng trường vẫn dùng bản tắt tiếng trong public/video; bản có tiếng nằm ở public/video/am,
// chỉ tải khi mở clip. Âm lượng theo "Âm lượng tổng" và "Tắt toàn bộ âm thanh" trong Cài đặt.
// Khi video trong máy đang kêu: nhạc nền, tiếng môi trường, hiệu ứng của game nhỏ lại; dừng / đóng thì trả lại.
import "./video-am.css";
import { am } from "./am-thanh-game.js";
import { amLuong, caiDat, khiDoiCaiDat } from "./cai-dat.js";

const goc = import.meta.env.BASE_URL || "./";
export const videoCoTieng = so => `${goc}video/am/sieu-nhan-hong-${so}.mp4`;

// lựa chọn bật / tắt tiếng của người chơi, dùng chung cho mọi clip trong lượt chơi (mặc định có tiếng)
let muonTieng = true;
export const muonCoTieng = () => muonTieng;
export const tatTiengGame = () => !!caiDat().tatTieng;

const HE_SO_GIAM = 0.15;
const dangGan = new Set();
let nguonPhu = () => null; // AudioContext khác cần tạm ngưng (nhạc sân khấu)
let daNgungPhu = null;
export function datNguonPhu(f) { nguonPhu = f || (() => null); }

const dangKeu = v => v.isConnected && !v.paused && !v.ended && !v.muted && v.volume > 0.01;
export const coVideoDangKeu = () => [...dangGan].some(dangKeu);

function apGiam() {
  const keu = coVideoDangKeu();
  if (am.ctx && am.ra) am.ra.gain.setTargetAtTime(keu ? HE_SO_GIAM : 1, am.ctx.currentTime, keu ? 0.12 : 0.35);
  try {
    if (keu && !daNgungPhu) { const c = nguonPhu(); if (c && c.state === "running") { c.suspend(); daNgungPhu = c; } }
    else if (!keu && daNgungPhu) { daNgungPhu.resume(); daNgungPhu = null; }
  } catch { daNgungPhu = null; }
  document.documentElement.toggleAttribute("data-video-keu", keu); // để kiểm thử
}

// gắn một thẻ video có tiếng: âm lượng theo Cài đặt, game nhỏ tiếng lại khi video kêu. Trả về hàm gỡ.
export function ganTiengVideo(v, khiDoi) {
  const apAmLuong = () => {
    try { v.volume = Math.max(0, Math.min(1, amLuong("amVideo"))); } catch {}
    if (tatTiengGame()) v.muted = true;
    khiDoi?.(); apGiam();
  };
  const boNghe = khiDoiCaiDat(apAmLuong);
  dangGan.add(v);
  const ev = ["play", "playing", "pause", "volumechange", "ended", "emptied"];
  for (const e of ev) v.addEventListener(e, apGiam);
  apAmLuong();
  return () => { boNghe(); dangGan.delete(v); for (const e of ev) v.removeEventListener(e, apGiam); apGiam(); };
}

// bật / tắt tiếng theo nút loa; trả về false nếu game đang tắt toàn bộ âm thanh (không bật được)
export function doiTieng(v) {
  if (v.muted && tatTiengGame()) return false;
  v.muted = !v.muted; muonTieng = !v.muted;
  return true;
}

// phát clip: có tiếng nếu người chơi muốn và game không tắt tiếng; trình duyệt chặn thì phát không tiếng
export function phat(v, khiTatTieng) {
  v.preload = "auto";
  v.muted = !muonTieng || tatTiengGame();
  return v.play().catch(e => {
    if (v.muted || e?.name !== "NotAllowedError") return;
    v.muted = true; khiTatTieng?.();
    return v.play().catch(() => {});
  });
}
