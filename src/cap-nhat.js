// Cập nhật bản mới: đăng ký service worker (dist/sw.js, tạo bởi tools/tao-sw.mjs), chỉ dùng ở bản build.
// Có bản mới đăng lên: SW mới tự thay SW cũ. Đang ở màn hình chính thì tải lại luôn; đang chơi thì hiện
// một dòng nhỏ "Có bản cập nhật mới — Tải lại" (game tự lưu nên tải lại không mất gì).
export function dangKySW({ coTheTaiLai = () => false } = {}) {
  if (!("serviceWorker" in navigator)) return;
  // trang đang do SW nào điều khiển chưa: lần đầu vào, SW vừa cài nhận trang thì không phải bản mới
  let daCoSW = !!navigator.serviceWorker.controller, daBao = false;
  navigator.serviceWorker.addEventListener("controllerchange", () => {
    if (!daCoSW) { daCoSW = true; return; }
    if (daBao) return;
    daBao = true;
    if (coTheTaiLai()) location.reload(); else hienThongBao();
  });
  const dangKy = () => navigator.serviceWorker.register("./sw.js").then(reg => {
    // chơi lâu không tải lại trang: thỉnh thoảng hỏi xem có bản mới không
    const hoi = () => reg.update().catch(() => {});
    setInterval(hoi, 30 * 60 * 1000);
    document.addEventListener("visibilitychange", () => { if (document.visibilityState === "visible") hoi(); });
  }).catch(() => {});
  if (document.readyState === "complete") dangKy(); else addEventListener("load", dangKy, { once: true });
}

function hienThongBao() {
  if (document.querySelector(".cap-nhat-moi")) return;
  const st = document.createElement("style");
  st.textContent = `.cap-nhat-moi{position:fixed;left:50%;bottom:max(14px,env(safe-area-inset-bottom));transform:translateX(-50%);z-index:2147483000;display:flex;align-items:center;gap:10px;max-width:calc(100vw - 32px);padding:7px 8px 7px 14px;border-radius:999px;background:rgba(24,22,18,.92);color:#f4efe4;font:500 13px/1.3 var(--body,system-ui,sans-serif);box-shadow:0 4px 18px rgba(0,0,0,.3)}
.cap-nhat-moi button{border:0;border-radius:999px;padding:6px 12px;font:600 13px var(--body,system-ui,sans-serif);cursor:pointer;background:var(--accent,#e8702a);color:#fff}
.cap-nhat-moi button.dong{background:transparent;color:#bdb6a4;padding:6px 8px}`;
  const el = document.createElement("div");
  el.className = "cap-nhat-moi"; el.setAttribute("role", "status");
  const chu = document.createElement("span"); chu.textContent = "Có bản cập nhật mới —";
  const tai = document.createElement("button"); tai.textContent = "Tải lại"; tai.onclick = () => location.reload();
  const dong = document.createElement("button"); dong.className = "dong"; dong.textContent = "×"; dong.setAttribute("aria-label", "Để sau"); dong.onclick = () => el.remove();
  el.append(chu, tai, dong);
  document.head.append(st); document.body.append(el);
}
