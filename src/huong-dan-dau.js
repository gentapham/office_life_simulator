// Hướng dẫn lần đầu chơi: vài bong bóng nhỏ có mũi tên chỉ vào nút thật, hiện đúng lúc trong ngày 1 của ván đầu tiên.
// Không chặn thao tác hay hội thoại (tự ẩn khi đang thoại, mở điện thoại, tạm dừng...). Bỏ qua được; xong hoặc bỏ qua thì
// không hiện lại (ghi trên trình duyệt). Xem lại được từ bảng Hướng dẫn / Tạm dừng.
import "./huong-dan-dau.css";

const KHOA = "owfad_huong_dan_v1";
export const daXongHuongDan = () => { try { return localStorage.getItem(KHOA) === "xong"; } catch { return true; } };
const ghiXong = () => { try { localStorage.setItem(KHOA, "xong"); } catch {} };

const hien = el => !!el && el.isConnected && el.getClientRects().length > 0 && getComputedStyle(el).visibility !== "hidden" && !el.closest("[hidden]");
const $ = s => document.querySelector(s);

export function taoHuongDan(dep) {
  // dep: { h, L, g, khung(), coTheHien() }
  const { h } = dep;
  const cham = () => !!dep.g.dienThoai || matchMedia("(pointer: coarse)").matches; // điều khiển cảm ứng
  const menuGon = () => hien($(".g3d-menu-nut")); // màn hình hẹp: các nút gom trong nút menu
  const nutDT = () => [...document.querySelectorAll(".g3d-hud-phai .g3d-btn")].find(b => b.textContent.trim() === "Điện thoại");
  const k = (...x) => x.map(c => h("kbd", {}, c));
  const dangThoai = () => !!$(".g3d.dang-thoai");
  const BUOC = [
    { id: "di", tg: 22,
      chu: () => cham()
        ? ["Đặt ngón tay ở nửa trái màn hình rồi kéo để đi. Vuốt nửa phải để nhìn quanh."]
        : [...k("W", "A", "S", "D"), " để đi, rê chuột để nhìn quanh, giữ ", ...k("Shift"), " để chạy."],
      batDau: s => { s.p0 = { x: dep.g.p.x, z: dep.g.p.z }; },
      xong: s => s.tg > 3 && Math.hypot(dep.g.p.x - s.p0.x, dep.g.p.z - s.p0.z) > 4 },
    { id: "muc_tieu", tg: 18, choToiDa: 90, dich: () => ".g3d-muctieu", khi: () => hien($(".g3d-muctieu")),
      chu: () => ["Việc tiếp theo ở đây. Đi theo mũi tên tới vòng sáng màu cam, hoặc bấm ", h("b", {}, "Đi nhanh"), ...(cham() ? ["."] : [" (", ...k("F"), ")."])],
      xong: s => s.thoaiMoi },
    { id: "noi", tg: 14, choToiDa: 150, dich: () => ".g3d-goiy", khi: () => hien($(".g3d-goiy")),
      chu: () => cham()
        ? ["Đứng gần người hay đồ vật thì chạm nút cam này để nói chuyện, ăn uống, dùng đồ."]
        : ["Đứng gần người hay đồ vật thì bấm ", ...k("E"), " để nói chuyện, ăn uống, dùng đồ."],
      xong: s => s.thoaiMoi },
    { id: "chi_so", tg: 15, choToiDa: 60, dich: () => ".g3d-sinhton",
      chu: () => ["No, Nước, Sức tụt dần, Stress tăng dần. Đói khát thì ăn uống ở pantry tầng 1 hay xe bánh mì ngoài cổng. Về 0 là xỉu.",
        ...(cham() ? [" Chạm bảng này để xem ví và việc vặt."] : [" Bấm ", ...k("Tab"), " xem bảng chỉ số."])] },
    { id: "dien_thoai", tg: 15, choToiDa: 60,
      dich: () => menuGon() ? ($(".g3d-hud-phai.mo") ? nutDT() : ".g3d-menu-nut") : nutDT(),
      chu: () => menuGon()
        ? ["Điện thoại nằm trong menu: tin nhắn Zola, bản đồ, gọi xe ôm, Tóp-tóp."]
        : ["Bấm ", ...k("P"), " mở điện thoại: tin nhắn Zola, bản đồ (", ...k("M"), "), gọi xe ôm, Tóp-tóp."],
      xong: () => !!$(".dt-lop") },
    { id: "dong_tac", tg: 14, choToiDa: 60, dich: () => cham() ? ".g3d-nut-tay.bieu" : null,
      chu: () => cham()
        ? ["Mấy nút này để nhảy, ngồi xuống và làm biểu cảm: vẫy tay, cười, cúi chào."]
        : [...k("Ctrl"), " hoặc ", ...k("C"), " để ngồi, ", ...k("Space"), " để nhảy, ", ...k("G"), " để vẫy tay, cười, cúi chào."] },
    { id: "ve_nha", tg: 14, dich: () => ".g3d-muctieu", khi: () => hien($(".g3d-muctieu")) && /về nhà/i.test($(".g3d-muctieu")?.textContent || ""),
      chu: () => ["Hết việc thì ra cổng về nhà ngủ để sang ngày mới. Game tự lưu."] },
  ];

  let i = -1, s = {}, hen = null, bong = null, dich = null, henSau = 0, ngay0 = 0;
  const go = () => { bong?.remove(); dich?.remove(); bong = dich = null; };
  const tat = () => { clearInterval(hen); hen = null; go(); delete document.documentElement.dataset.huongDan; };
  const ketThuc = () => { ghiXong(); tat(); i = -1; };
  const sangBuoc = () => {
    i++; s = { tg: 0, cho: 0, vang: 0, ranh: !dangThoai() }; go();
    if (i >= BUOC.length) { ketThuc(); return; }
    BUOC[i].batDau?.(s);
    document.documentElement.dataset.huongDan = BUOC[i].id; // bước đang chạy (để kiểm thử)
    henSau = performance.now() + (i ? 2000 : 1500);
  };
  const veBong = b => {
    const nutBam = (cls, chu, f) => h("button", { type: "button", class: cls, onclick: e => { e.stopPropagation(); e.currentTarget.blur(); f(); } }, chu);
    bong = h("div", { class: "hd-bong an", role: "status", "aria-live": "polite", "data-buoc": b.id },
      h("p", {}, b.chu().flat(Infinity).map(x => typeof x === "string" ? document.createTextNode(x) : x)), // giữ khoảng trắng quanh phím
      h("div", { class: "hd-chan" }, h("small", {}, `${i + 1}/${BUOC.length}`),
        nutBam("hd-bo", "Bỏ qua hướng dẫn", ketThuc),
        nutBam("hd-tiep", i === BUOC.length - 1 ? "Xong" : "Tiếp", sangBuoc)),
      h("i", { class: "hd-mui" }));
    dich = h("div", { class: "hd-dich", hidden: true });
    dep.khung().append(dich, bong);
  };
  const datViTri = el => {
    const khung = dep.khung().getBoundingClientRect();
    const W = khung.width, H = khung.height, bw = bong.offsetWidth, bh = bong.offsetHeight;
    let x, y, kieu;
    if (el) {
      const r0 = el.getBoundingClientRect(), r = { left: r0.left - khung.left, top: r0.top - khung.top, width: r0.width, height: r0.height };
      r.right = r.left + r.width; r.bottom = r.top + r.height;
      const cx = r.left + r.width / 2;
      kieu = r.top + r.height / 2 < H / 2 ? "duoi" : "tren";
      x = Math.max(10, Math.min(W - bw - 10, cx - bw / 2));
      y = kieu === "duoi" ? r.bottom + 14 : r.top - bh - 14;
      y = Math.max(8, Math.min(H - bh - 8, y));
      bong.querySelector(".hd-mui").style.left = Math.max(12, Math.min(bw - 26, cx - x - 9)) + "px";
      Object.assign(dich.style, { left: r.left - 4 + "px", top: r.top - 4 + "px", width: r.width + 8 + "px", height: r.height + 8 + "px" });
      dich.hidden = false;
    } else {
      kieu = "giua"; x = (W - bw) / 2; y = H * (cham() ? 0.42 : 0.58); dich.hidden = true;
    }
    bong.className = "hd-bong " + kieu;
    bong.style.left = Math.round(x) + "px"; bong.style.top = Math.round(y) + "px";
  };
  const an = () => { if (bong) bong.classList.add("an"); if (dich) dich.hidden = true; };
  const NHIP = 0.25;
  const nhip = () => {
    if (i < 0) return;
    if (dep.conChay && !dep.conChay()) { tat(); i = -1; return; } // đã thoát ván chơi
    if (dep.L.ngay !== ngay0) { ketThuc(); return; } // sang ngày mới: coi như đã xem
    const b = BUOC[i];
    // hội thoại mới mở sau khi bước này bắt đầu (bước "đi tới vòng cam", "nói chuyện" coi như đã làm)
    if (!dangThoai()) s.ranh = true; else if (s.ranh) s.thoaiMoi = true;
    if (b.xong?.(s)) { sangBuoc(); return; }
    const choSan = performance.now() >= henSau && dep.coTheHien() && (!b.khi || b.khi());
    const t = choSan && b.dich?.(), el = typeof t === "string" ? $(t) : t || null;
    if (!choSan || (t && !hien(el))) {
      // đang thoại, mở bảng: ẩn ngay; nút cần chỉ chỉ chớp tắt (đi ngang qua người khác): đợi chừng 1 giây mới ẩn
      if (!dep.coTheHien() || performance.now() < henSau || ++s.vang > 4 || !bong || !s.viTri) an();
      else if (s.viTri) { datViTri(s.viTri.isConnected ? s.viTri : null); }
      // chờ mãi không tới lúc (không gặp nút cần chỉ): bỏ qua bước này
      if (b.choToiDa && dep.coTheHien() && (s.cho += NHIP) > b.choToiDa) sangBuoc();
      return;
    }
    if (!bong) veBong(b);
    s.vang = 0; s.viTri = el;
    datViTri(el);
    if ((s.tg += NHIP) >= b.tg) sangBuoc();
  };
  return {
    // xemLai: người chơi chủ động xem lại (từ bảng Hướng dẫn), chạy dù không phải ngày 1
    batDau(xemLai = false) {
      if (!xemLai && daXongHuongDan()) return;
      tat(); i = -1; ngay0 = dep.L.ngay;
      sangBuoc(); hen = setInterval(nhip, NHIP * 1000);
    },
    dangChay: () => i >= 0,
    huy: tat,
  };
}
