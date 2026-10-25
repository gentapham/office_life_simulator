// Màn hình chờ vào game: kiểu màn hình máy tính văn phòng, thẻ nhân viên, thanh tiến độ và danh sách việc đang chuẩn bị.
// Thanh tiến độ, vòng xoay dùng transform để vẫn chạy mượt cả lúc trình duyệt đang bận dựng thế giới.
const BUOC = [
  ["ma", "Mở cửa văn phòng"],
  ["chu", "Treo bảng hiệu, in bảng tên"],
  ["den", "Bật đèn, bật máy lạnh"],
  ["toa_nha", "Xây tòa nhà và khu phố"],
  ["duong_pho", "Đón xe cộ, người đi đường"],
  ["san_khau", "Dựng sân khấu Đại Nhạc Hội"],
  ["dong_nghiep", "Gọi đồng nghiệp đi làm"],
  ["shader", "Pha cà phê"],
  ["vao_ca", "Chấm công vào ca"],
];
const CAU = [
  "Deadline không đáng sợ. Đáng sợ là sếp nhớ deadline.",
  "Cà phê là nhiên liệu, cuộc họp là chướng ngại vật.",
  "Wifi mạnh, máy lạnh mát, sếp đi công tác: ba điều ước của dân văn phòng.",
  "Giờ nghỉ trưa là thiêng liêng.",
  "Một ngày đẹp trời là ngày không ai gọi tên mình trong cuộc họp.",
  "Việc hôm nay cứ để ngày mai tính.",
  "Mục tiêu tháng này: 1.000.000 người theo dõi cho Siêu Nhân Hồng.",
];

export function taoManCho(h, { ten, vai, ngay }) {
  const thanh = h("div", { class: "mc-thanh-chay" });
  const so = h("b", { class: "mc-so" }, "0%");
  const dang = h("span", { class: "mc-dang" }, BUOC[0][1] + "…");
  const ds = BUOC.map(([ma, chu]) => h("li", { "data-ma": ma }, h("i", { "aria-hidden": "true" }), h("span", {}, chu)));
  let k = Math.floor(Math.random() * CAU.length);
  const cau = h("p", { class: "mc-cau" }, CAU[k]);
  const doiCau = setInterval(() => { k = (k + 1) % CAU.length; cau.classList.remove("hien"); void cau.offsetWidth; cau.textContent = CAU[k]; cau.classList.add("hien"); }, 3800);
  const chuCai = (ten || "?").trim().split(/\s+/).pop()[0]?.toUpperCase() || "?";
  const el = h("div", { class: "mc", role: "status", "aria-live": "polite", "aria-label": "Đang vào game" },
    h("div", { class: "mc-may" },
      h("div", { class: "mc-tieude" }, h("span", { class: "mc-cham" }, h("i"), h("i"), h("i")), h("span", {}, "G-ENTERTAINMENT · Hệ thống chấm công")),
      h("div", { class: "mc-than" },
        h("div", { class: "mc-the" },
          h("div", { class: "mc-anh" }, chuCai),
          h("div", { class: "mc-the-chu" }, h("small", {}, "Thẻ nhân viên"), h("strong", {}, ten), h("span", {}, vai), ngay ? h("em", {}, ngay) : null)),
        h("div", { class: "mc-tien" },
          h("div", { class: "mc-dong" }, dang, so),
          h("div", { class: "mc-thanh", role: "progressbar", "aria-valuemin": "0", "aria-valuemax": "100" }, thanh),
          h("ul", { class: "mc-ds" }, ds)),
        cau)));
  document.body.append(el);
  let hienTai = 0;
  const dat = (ma, tiLe) => {
    const i = BUOC.findIndex(b => b[0] === ma);
    hienTai = Math.max(hienTai, Math.min(1, tiLe));
    const pt = Math.round(hienTai * 100);
    thanh.style.transform = `scaleX(${hienTai})`;
    so.textContent = pt + "%"; el.querySelector(".mc-thanh").setAttribute("aria-valuenow", String(pt));
    if (ma === "xong") { ds.forEach(li => li.className = "xong"); dang.textContent = "Sẵn sàng vào ca"; return; }
    if (i < 0) return;
    ds.forEach((li, j) => li.className = j < i ? "xong" : j === i ? "dang" : "");
    dang.textContent = BUOC[i][1] + "…";
  };
  // xong: giữ 100% một nhịp rồi mờ dần
  const dong = (nhanh = false) => new Promise(r => {
    clearInterval(doiCau);
    if (nhanh) { el.remove(); return r(); }
    setTimeout(() => { el.classList.add("tat"); setTimeout(() => { el.remove(); r(); }, 450); }, 350);
  });
  return { el, dat, dong };
}
