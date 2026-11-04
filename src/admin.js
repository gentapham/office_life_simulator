// Bảng thử nghiệm cho admin: nhảy tới ngày bất kỳ, chỉnh chỉ số, tới thẳng đêm Đại Nhạc Hội để xem cái kết.
// Mở: máy tính bấm phím ` (dấu huyền, cạnh số 1) rồi nhập mã; điện thoại chạm 7 lần liên tiếp vào ô ngày giờ rồi nhập mã.
// Nhập đúng một lần thì lần sau mở thẳng. Chỉ lưu dấu băm SHA-256 của mã trong mã nguồn.
const BAM = "ae1bae987f39db1b981c94274e6db932af3b03fd7dff71098755e78d29c98e8c";

async function bam(chuoi) {
  const b = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(chuoi.trim().toLowerCase()));
  return [...new Uint8Array(b)].map(x => x.toString(16).padStart(2, "0")).join("");
}

export function ganAdmin(h, api) {
  let mo = null, daMo = false;
  const hoiMa = () => {
    if (mo) return;
    if (daMo) { moBang(); return; }
    api.moKhoaChuot?.();
    const s = prompt("Mã admin");
    if (!s) return;
    bam(s).then(x => { if (x === BAM) { daMo = true; moBang(); } else api.thongBao("Sai mã."); });
  };
  const phim = e => {
    if (e.code !== "Backquote" || e.repeat || e.target.closest?.("input, textarea")) return;
    e.preventDefault(); hoiMa();
  };
  addEventListener("keydown", phim, true);
  // điện thoại: chạm 7 lần liên tiếp vào ô ngày giờ
  let cham = 0, tCham = 0;
  const oNgay = document.querySelector(".g3d-the-ngay");
  const chamNgay = () => { const t = performance.now(); cham = t - tCham < 600 ? cham + 1 : 1; tCham = t; if (cham >= 7) { cham = 0; hoiMa(); } };
  oNgay?.addEventListener("click", chamNgay);

  function moBang() {
    mo?.remove();
    api.moKhoaChuot?.();
    const so = h("input", { type: "number", min: "1", max: "31", value: String(Math.min(31, api.L().ngay + 1)), class: "ad-so" });
    const nut = (chu, f) => h("button", { class: "btn ghost", type: "button", onclick: () => { f(); } }, chu);
    const dong = () => { mo?.remove(); mo = null; };
    const lamRoiDong = f => () => { dong(); f(); };
    mo = h("div", { class: "ad-lop", onclick: e => { if (e.target === mo) dong(); } },
      h("div", { class: "ad-bang", role: "dialog", "aria-label": "Admin" },
        h("header", {}, h("b", {}, "Bảng admin"), h("small", {}, `Đang ở ngày ${api.L().ngay}`), nut("Đóng", dong)),
        h("section", {}, h("h4", {}, "Nhảy ngày"),
          h("div", { class: "ad-hang" }, so, nut("Tới ngày này", lamRoiDong(() => api.denNgay(Math.max(1, Math.min(31, Number(so.value) || 1)))))),
          h("div", { class: "ad-hang" }, nut("Ngày mai", lamRoiDong(() => api.denNgay(Math.min(31, api.L().ngay + 1)))), nut("Ngày 30", lamRoiDong(() => api.denNgay(30))), nut("Sáng ngày 31", lamRoiDong(() => api.denNgay(31))))),
        h("section", {}, h("h4", {}, "Xem kết thúc"),
          h("div", { class: "ad-hang" }, nut("Tới đêm Đại Nhạc Hội ngay", lamRoiDong(() => api.denDaiNhacHoi())))),
        h("section", {}, h("h4", {}, "Người theo dõi Siêu Nhân Hồng"),
          h("div", { class: "ad-hang" }, ...[0, 300000, 700000, 1000000, 1500000].map(v => nut(v.toLocaleString("vi-VN"), () => { api.datChiSo({ nguoi_theo_doi: v }); api.thongBao(`Người theo dõi: ${v.toLocaleString("vi-VN")}`); })))),
        h("section", {}, h("h4", {}, "Chỉ số"),
          h("div", { class: "ad-hang" },
            nut("Đầy no, nước, sức", () => { api.datChiSo({ no: 100, khat: 100, nang_luong: 100, stress: 0 }); api.thongBao("Đã hồi đầy chỉ số."); }),
            nut("+5 triệu tiền", () => { api.datChiSo({ tien: (Number(api.L().v("tien")) || 0) + 5000000 }); api.thongBao("+5.000.000đ"); }),
            nut("Uy tín +20", () => { api.datChiSo({ uy_tin: (Number(api.L().v("uy_tin")) || 0) + 20 }); api.thongBao("Uy tín +20"); }),
            nut("Uy tín −20", () => { api.datChiSo({ uy_tin: (Number(api.L().v("uy_tin")) || 0) - 20 }); api.thongBao("Uy tín −20"); })))));
    document.body.append(mo);
  }
  return () => { removeEventListener("keydown", phim, true); oNgay?.removeEventListener("click", chamNgay); mo?.remove(); };
}
