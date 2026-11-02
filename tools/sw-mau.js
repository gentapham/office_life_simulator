// Service worker của game (viết tay, không dùng thư viện). Mẫu này được tools/tao-sw.mjs chép ra dist/sw.js
// sau khi build, thay PHIEN_BAN (mã băm của bản build) và DS_TAI_SAN (các file có mã băm trong assets/).
// Mỗi lần đăng bản mới nội dung khác thì sw.js khác -> trình duyệt cài SW mới -> trang báo "Có bản cập nhật mới".
//  - Trang (index.html): lấy mạng trước, mất mạng mới dùng bản đã lưu -> online là luôn có bản mới nhất.
//  - assets/*-[hash].js/.css: lấy trong bộ nhớ trước (tên đã có mã băm nên không bao giờ đổi nội dung).
//  - File thường trong public (truyện json, ảnh, icon): dùng bản đã lưu ngay, cập nhật ngầm; bộ nhớ này
//    gắn với PHIEN_BAN nên bản mới đăng lên thì lần đầu luôn lấy từ mạng.
//  - Video, âm thanh, yêu cầu Range: không đụng tới, để trình duyệt tự xử lý.
// Bản lưu game nằm trong localStorage, SW không chạm tới.
const PHIEN_BAN = "__PHIEN_BAN__";
const DS_TAI_SAN = __DS_TAI_SAN__;
const DS_NHO = ["./", "./favicon.svg", "./icon-180.png", "./story/meta.json", "./story/ten-nguoi-noi.json"];

const TIEN_TO = "owfad-";
const BO_BAN = TIEN_TO + "ban-" + PHIEN_BAN;   // trang + file public của bản này
const BO_TAI_SAN = TIEN_TO + "tai-san";        // file có mã băm, dùng chung giữa các bản
const KHOA_DS_CU = "./__ds-tai-san-truoc.json"; // danh sách tài sản của bản trước (trang cũ còn mở vẫn tải được chunk)
const goc = new URL("./", self.location).href;
const tuyetDoi = p => new URL(p, goc).href;
const TAI_SAN = new Set(DS_TAI_SAN.map(tuyetDoi));
const TRANG = tuyetDoi("./");

self.addEventListener("install", e => {
  e.waitUntil((async () => {
    const ts = await caches.open(BO_TAI_SAN);
    // tài sản đã có từ bản trước (cùng mã băm) thì giữ, chỉ tải cái mới
    await Promise.all([...TAI_SAN].map(async u => {
      if (await ts.match(u)) return;
      const r = await fetch(u);
      if (!r.ok) throw new Error("Không tải được " + u);
      await ts.put(u, r);
    }));
    const bb = await caches.open(BO_BAN);
    await Promise.all(DS_NHO.map(async p => {
      try { const r = await fetch(tuyetDoi(p), { cache: "no-cache" }); if (r.ok) await bb.put(tuyetDoi(p), r); } catch {}
    }));
    await self.skipWaiting();
  })());
});

self.addEventListener("activate", e => {
  e.waitUntil((async () => {
    for (const ten of await caches.keys()) if (ten.startsWith(TIEN_TO) && ten !== BO_BAN && ten !== BO_TAI_SAN) await caches.delete(ten);
    // dọn tài sản cũ: giữ của bản này và bản ngay trước (trang đang mở bằng bản trước vẫn tải được minigame...)
    const ts = await caches.open(BO_TAI_SAN);
    let truoc = [];
    try { truoc = await (await ts.match(KHOA_DS_CU))?.json() || []; } catch {}
    const giu = new Set([...TAI_SAN, ...truoc]);
    for (const req of await ts.keys()) if (req.url !== tuyetDoi(KHOA_DS_CU) && !giu.has(req.url)) await ts.delete(req);
    await ts.put(tuyetDoi(KHOA_DS_CU), new Response(JSON.stringify([...TAI_SAN]), { headers: { "content-type": "application/json" } }));
    await self.clients.claim();
  })());
});

const laMedia = (req, url) => req.headers.has("range") || req.destination === "video" || req.destination === "audio"
  || /\/video\//.test(url.pathname) || /\.(mp4|webm|mp3|m4a|ogg|wav)$/i.test(url.pathname);

self.addEventListener("fetch", e => {
  const req = e.request;
  if (req.method !== "GET") return;
  const url = new URL(req.url);
  if (url.origin !== self.location.origin || !req.url.startsWith(goc)) return; // phông Google...: để trình duyệt lo
  if (laMedia(req, url)) return; // video tua bằng Range: không chặn
  if (url.pathname.endsWith("/sw.js")) return;
  if (req.mode === "navigate") { e.respondWith(trangMoi(req)); return; }
  if (TAI_SAN.has(url.href) || /\/assets\/[^/]+-[\w-]{8,}\.(js|css|woff2?|png|jpe?g|svg|webp)$/.test(url.pathname)) { e.respondWith(taiSan(req)); return; }
  e.respondWith(cuTruocMoiSau(req, e));
});

// trang: mạng trước (hỏi lại máy chủ, không dùng bộ nhớ HTTP cũ); mạng chậm quá 6 giây hoặc mất mạng thì dùng bản đã lưu
async function trangMoi(req) {
  const bb = await caches.open(BO_BAN);
  const mang = fetch(req.url, { cache: "no-cache", credentials: "same-origin" }).then(r => {
    if (r.ok && r.type === "basic") bb.put(TRANG, r.clone());
    return r;
  });
  const luu = await bb.match(TRANG) || await caches.match(TRANG, { ignoreSearch: true });
  if (!luu) return mang;
  return Promise.race([mang.catch(() => luu), new Promise(res => setTimeout(() => res(luu), 6000))]);
}

async function taiSan(req) {
  const ts = await caches.open(BO_TAI_SAN);
  const co = await ts.match(req.url);
  if (co) return co;
  const r = await fetch(req);
  if (r.ok && r.type === "basic") ts.put(req.url, r.clone());
  return r;
}

// stale-while-revalidate trong bộ nhớ của bản này (bản mới -> bộ nhớ mới -> lấy mạng)
async function cuTruocMoiSau(req, e) {
  const bb = await caches.open(BO_BAN);
  const khoa = req.url.split("#")[0];
  const co = await bb.match(khoa);
  const mang = fetch(khoa, { cache: "no-cache", credentials: "same-origin" }).then(async r => {
    if (r.ok && r.type === "basic") await bb.put(khoa, r.clone());
    return r;
  });
  if (co) { e.waitUntil(mang.catch(() => {})); return co; }
  return mang;
}
