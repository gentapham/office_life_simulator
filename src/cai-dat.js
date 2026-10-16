// Cài đặt của người chơi: âm lượng, chất lượng hình ảnh, độ nhạy chuột. Lưu trên trình duyệt.
const KEY = "owfad_cai_dat_v1";
const MAC_DINH = {
  amTong: 80, amNhac: 70, amHieuUng: 80, amMoiTruong: 70, tatTieng: false,
  chatLuong: "tu_dong", // tu_dong | thap | vua | cao
  doNhay: 1, tamNhin: 70, daoTrucY: false,
};
let hienTai = null;
const nghe = new Set();

export function caiDat() {
  if (!hienTai) {
    let luu = {}; try { luu = JSON.parse(localStorage.getItem(KEY)) || {}; } catch {}
    hienTai = { ...MAC_DINH, ...luu };
  }
  return hienTai;
}
export function datCaiDat(doi) {
  hienTai = { ...caiDat(), ...doi };
  try { localStorage.setItem(KEY, JSON.stringify(hienTai)); } catch {}
  for (const f of nghe) f(hienTai, doi);
}
export function khiDoiCaiDat(f) { nghe.add(f); return () => nghe.delete(f); }

// âm lượng thực (0..1) của một nhóm âm thanh
export function amLuong(nhom) {
  const c = caiDat();
  if (c.tatTieng) return 0;
  return (c.amTong / 100) * ((c[nhom] ?? 100) / 100);
}

// máy yếu: điện thoại ở chế độ tự động, hoặc người chơi chọn "Thấp"
export function cheDoNhe() {
  const c = caiDat();
  if (c.chatLuong === "thap") return true;
  if (c.chatLuong === "tu_dong") return matchMedia("(pointer: coarse)").matches;
  return false;
}
export function tiLeDiemAnh() {
  const c = caiDat(), dt = matchMedia("(pointer: coarse)").matches;
  const tran = c.chatLuong === "thap" ? 1 : c.chatLuong === "vua" ? 1.25 : c.chatLuong === "cao" ? 2 : dt ? 1.5 : 2;
  return Math.min(devicePixelRatio || 1, tran);
}

// Bảng cài đặt (dùng ở màn hình chính và trong game)
export function moCaiDat(h, { khiDong, trongGame = false } = {}) {
  const c = caiDat();
  const thanhTruot = (nhan, khoa, min, max, buoc, hien) => {
    const gt = h("output", {}, hien(c[khoa]));
    const o = h("input", { type: "range", min, max, step: buoc, value: c[khoa], "aria-label": nhan,
      oninput: e => { const v = Number(e.target.value); gt.textContent = hien(v); datCaiDat({ [khoa]: v }); } });
    return h("label", { class: "cd-hang" }, h("span", {}, nhan), o, gt);
  };
  const phanTram = v => `${Math.round(v)}%`;
  const chon = (nhan, khoa, ds) => h("div", { class: "cd-hang cd-chon" }, h("span", {}, nhan),
    h("div", { class: "cd-nhom", role: "radiogroup", "aria-label": nhan }, ds.map(([gt, chu]) => {
      const b = h("button", { type: "button", role: "radio", "aria-checked": String(c[khoa] === gt), class: c[khoa] === gt ? "on" : "",
        onclick: () => { datCaiDat({ [khoa]: gt }); for (const x of b.parentNode.children) { x.classList.toggle("on", x === b); x.setAttribute("aria-checked", String(x === b)); } } }, chu);
      return b;
    })));
  const bat = (nhan, khoa) => h("label", { class: "cd-hang cd-bat" }, h("span", {}, nhan),
    h("input", { type: "checkbox", checked: c[khoa], onchange: e => datCaiDat({ [khoa]: e.target.checked }) }));
  // xuất / nạp bản lưu: mang lượt chơi sang máy khác hoặc trình duyệt khác
  const thongBaoLuu = h("p", { class: "cd-ghi", role: "status" });
  const xuatBanLuu = () => {
    const du = {};
    for (let i = 0; i < localStorage.length; i++) { const k = localStorage.key(i); if (k.startsWith("owfad_")) du[k] = localStorage.getItem(k); }
    const a = document.createElement("a");
    a.href = URL.createObjectURL(new Blob([JSON.stringify({ game: "owfad", ban: 1, du }, null, 1)], { type: "application/json" }));
    const d = new Date(); a.download = `ban-luu-van-phong-${d.getFullYear()}${String(d.getMonth() + 1).padStart(2, "0")}${String(d.getDate()).padStart(2, "0")}.json`;
    a.click(); setTimeout(() => URL.revokeObjectURL(a.href), 2000);
    thongBaoLuu.textContent = `Đã tải ${Object.keys(du).filter(k => k.includes("_luu_")).length} bản lưu về máy.`;
  };
  const chonFile = h("input", { type: "file", accept: ".json,application/json", hidden: true, onchange: async e => {
    const f = e.target.files?.[0]; if (!f) return;
    try {
      const goi = JSON.parse(await f.text());
      const du = goi?.game === "owfad" && goi.du;
      if (!du || typeof du !== "object") throw new Error();
      const khoa = Object.keys(du).filter(k => k.startsWith("owfad_") && typeof du[k] === "string");
      if (!khoa.length) throw new Error();
      for (const k of khoa) localStorage.setItem(k, du[k]);
      thongBaoLuu.textContent = "Đã nạp bản lưu. Đang tải lại…";
      setTimeout(() => location.reload(), 700);
    } catch { thongBaoLuu.textContent = "File không đúng định dạng bản lưu của game."; }
    e.target.value = "";
  } });
  const dong = () => { lop.remove(); removeEventListener("keydown", phim, true); khiDong?.(); };
  const phim = e => { if (e.code === "Escape") { e.preventDefault(); e.stopPropagation(); dong(); } };
  addEventListener("keydown", phim, true);
  const lop = h("div", { class: "cd-lop", onclick: e => { if (e.target === lop) dong(); } },
    h("div", { class: "cd-bang", role: "dialog", "aria-label": "Cài đặt" },
      h("header", {}, h("h2", {}, "Cài đặt"), h("button", { class: "btn ghost", type: "button", onclick: dong }, "Đóng")),
      h("section", {}, h("h3", {}, "Âm thanh"),
        bat("Tắt toàn bộ âm thanh", "tatTieng"),
        thanhTruot("Âm lượng tổng", "amTong", 0, 100, 1, phanTram),
        thanhTruot("Nhạc nền", "amNhac", 0, 100, 1, phanTram),
        thanhTruot("Hiệu ứng", "amHieuUng", 0, 100, 1, phanTram),
        thanhTruot("Môi trường", "amMoiTruong", 0, 100, 1, phanTram)),
      h("section", {}, h("h3", {}, "Hình ảnh"),
        chon("Chất lượng", "chatLuong", [["tu_dong", "Tự động"], ["thap", "Thấp"], ["vua", "Vừa"], ["cao", "Cao"]]),
        thanhTruot("Góc nhìn", "tamNhin", 55, 90, 1, v => `${v}°`),
        trongGame ? h("p", { class: "cd-ghi" }, "Mức chất lượng mới áp dụng đầy đủ khi vào lại game.") : null),
      h("section", {}, h("h3", {}, "Điều khiển"),
        thanhTruot("Độ nhạy chuột, cảm ứng", "doNhay", 0.3, 2.5, 0.05, v => `${Number(v).toFixed(2)}x`),
        bat("Đảo trục dọc", "daoTrucY")),
      trongGame ? null : h("section", {}, h("h3", {}, "Bản lưu"),
        h("div", { class: "cd-luu" },
          h("button", { class: "btn ghost", type: "button", onclick: xuatBanLuu }, "Tải bản lưu về máy"),
          h("button", { class: "btn ghost", type: "button", onclick: () => chonFile.click() }, "Nạp bản lưu từ file"), chonFile),
        thongBaoLuu),
      h("footer", {}, h("button", { class: "btn ghost", type: "button", onclick: () => { datCaiDat({ ...MAC_DINH }); dong(); moCaiDat(h, { khiDong, trongGame }); } }, "Khôi phục mặc định"),
        h("button", { class: "btn primary", type: "button", onclick: dong }, "Xong"))));
  document.body.append(lop);
  lop.querySelector("input, button")?.focus();
  return dong;
}
