// Sinh tồn trong bản 3D: đói, khát, năng lượng tụt dần theo thời gian; cảnh báo nhiều mức; đi chậm khi kiệt;
// về 0 thì xỉu (gọi cảnh cấp cứu). Kèm việc vặt mỗi ngày: đồng nghiệp nhờ mua đồ ăn uống.

const CHI_SO = [
  { k: "no", ten: "No", toc: 1 / 13, canh: [
    [30, "Bụng bắt đầu réo. Kiếm gì ăn đi: tủ lạnh pantry, xe bánh mì ngoài đường."],
    [15, "Đói lả, tay run, đi không nổi. Ăn ngay kẻo xỉu!"],
    [5, "SẮP XỈU VÌ ĐÓI! Ăn ngay lập tức!"]] },
  { k: "khat", ten: "Nước", toc: 1 / 9, canh: [
    [30, "Khát nước rồi. Cây nước ở sảnh và khu làm việc, hoặc trà đá ngoài đường."],
    [15, "Khát khô cổ, đầu choáng váng. Uống nước ngay!"],
    [5, "SẮP XỈU VÌ KHÁT! Uống nước ngay lập tức!"]] },
  { k: "nang_luong", ten: "Năng lượng", toc: 1 / 20, canh: [
    [30, "Mệt rồi. Rửa mặt hoặc pha một ly cà phê ở pantry."],
    [15, "Mắt díp lại, bước đi loạng choạng. Nạp năng lượng ngay!"],
    [5, "SẮP GỤC VÌ KIỆT SỨC! Rửa mặt, uống cà phê ngay!"]] },
];
const STRESS_CANH = [[70, "Stress cao. Vuốt mèo, ngắm cá hay đi vệ sinh cho nhẹ đầu."], [90, "Stress sắp nổ tung! Nghỉ ngơi một chút đi."]];

// món có thể nhờ mua (mã khớp với loại đồ vật bán món đó)
export const MON_VIEC_VAT = [
  { loai: "banh_mi", mon: "ổ bánh mì" }, { loai: "nuoc_mia", mon: "ly nước mía" }, { loai: "tra_da", mon: "ly trà đá" },
  { loai: "ca_phe", mon: "ly cà phê" }, { loai: "che", mon: "ly chè Bà Bảy" }, { loai: "hu_tieu", mon: "tô hủ tiếu gõ" },
];

export function taoSinhTon(dep) {
  // dep: { g, L, h, thongBao, dangChoi(), xiu(lyDo), tenCua(ma), dsDongNghiep() }
  const { h, L } = dep;
  const v = k => Number(L.v(k)) || 0;
  const thanh = {}, dong = {};
  const el = h("div", { class: "g3d-sinhton" },
    ...[...CHI_SO.map(c => [c.k, c.ten]), ["stress", "Stress"]].map(([k, ten]) => {
      thanh[k] = h("i");
      dong[k] = h("div", { class: "st-dong" }, h("span", {}, ten), h("div", { class: "st-thanh" + (k === "stress" ? " xau" : "") }, thanh[k]));
      return dong[k];
    }),
  );
  const vi = h("div", { class: "st-vi" });
  const viecEl = h("div", { class: "st-viec", hidden: true });
  el.append(vi, viecEl);
  const vien = h("div", { class: "g3d-canhbao" }); // viền đỏ quanh màn hình khi nguy hiểm
  const acc = { no: 0, khat: 0, nang_luong: 0 };
  const mucDaBao = { no: 101, khat: 101, nang_luong: 101, stress: 0 };
  let lanNhacCuoi = 0, daXiu = false, viec = null;

  const veLai = () => {
    for (const k of ["no", "khat", "nang_luong", "stress"]) {
      const x = Math.max(0, Math.min(100, v(k)));
      thanh[k].style.width = x + "%";
      const nguy = k === "stress" ? x >= 90 : x <= 5, xau = k === "stress" ? x >= 70 : x <= 15, vua = k === "stress" ? x >= 50 : x <= 30;
      dong[k].className = "st-dong" + (nguy ? " nguy" : xau ? " xau" : vua ? " vua" : "");
    }
    vi.textContent = "Ví: " + v("tien").toLocaleString("vi-VN") + "đ";
    if (viec && !viec.xong) { viecEl.hidden = false; viecEl.textContent = viec.daCo ? `Mang ${viec.mon} tới cho ${dep.tenCua(viec.ma)}` : `Việc vặt: ${dep.tenCua(viec.ma)} nhờ mua ${viec.mon}`; }
    else viecEl.hidden = true;
  };

  const tick = () => {
    veLai();
    if (daXiu || !dep.dangChoi()) return;
    const g = dep.g;
    for (const c of CHI_SO) {
      acc[c.k] += c.toc * (c.k === "nang_luong" && g.dangChay ? 2.4 : 1);
      if (acc[c.k] >= 1) { const n = Math.floor(acc[c.k]); acc[c.k] -= n; L.set(c.k, Math.max(0, v(c.k) - n)); }
    }
    // cảnh báo: báo khi vừa tụt qua mỗi mức, và nhắc lại định kỳ khi đã ở mức nặng
    const bayGio = Date.now();
    let nangNhat = 0;
    for (const c of CHI_SO) {
      const x = v(c.k);
      for (let i = c.canh.length - 1; i >= 0; i--) {
        const [muc, chu] = c.canh[i];
        if (x <= muc) {
          nangNhat = Math.max(nangNhat, i + 1);
          if (mucDaBao[c.k] > muc) { mucDaBao[c.k] = muc; dep.thongBao(chu); lanNhacCuoi = bayGio; }
          else if (i >= 1 && bayGio - lanNhacCuoi > (i === 2 ? 7000 : 18000)) { dep.thongBao(chu); lanNhacCuoi = bayGio; }
          break;
        }
      }
      if (mucDaBao[c.k] <= 100 && x > mucDaBao[c.k] + 8) mucDaBao[c.k] = 101; // đã ăn uống lại thì báo lại từ đầu khi tụt
    }
    const st = v("stress");
    for (let i = STRESS_CANH.length - 1; i >= 0; i--) { const [muc, chu] = STRESS_CANH[i]; if (st >= muc) { if (mucDaBao.stress < muc) { mucDaBao.stress = muc; dep.thongBao(chu); } break; } }
    if (st < 60) mucDaBao.stress = 0;
    // hiệu ứng lên người chơi
    const no = v("no"), kh = v("khat"), nl = v("nang_luong");
    g.hsToc = Math.min(no < 15 ? 0.72 : 1, kh < 15 ? 0.72 : 1, nl < 15 ? 0.62 : nl < 30 ? 0.86 : 1);
    g.camChay = no < 20 || kh < 20 || nl < 20;
    vien.className = "g3d-canhbao" + (nangNhat >= 3 ? " nguy" : nangNhat >= 2 ? " xau" : nangNhat >= 1 ? " vua" : "");
    g.canvas.style.filter = nangNhat >= 3 ? "blur(1.2px) saturate(.5)" : nangNhat >= 2 ? "saturate(.75)" : "";
    // xỉu
    const lyDo = no <= 0 ? "đói" : kh <= 0 ? "khát" : nl <= 0 ? "kiệt sức" : null;
    if (lyDo) { daXiu = true; g.canvas.style.filter = ""; vien.className = "g3d-canhbao"; dep.xiu(lyDo); }
  };
  const timer = setInterval(tick, 1000);
  veLai();

  return {
    el, vien, veLai,
    huy() { clearInterval(timer); },
    // mỗi cảnh truyện trôi qua cũng tốn sức
    quaCanh() { L.set("khat", Math.max(0, v("khat") - 3)); L.set("no", Math.max(0, v("no") - 2)); L.set("nang_luong", Math.max(0, v("nang_luong") - 2)); veLai(); },
    // ngày mới: một đồng nghiệp nhờ mua đồ
    ngayMoi(rnd = Math.random) {
      const ds = dep.dsDongNghiep();
      const m = MON_VIEC_VAT[Math.floor(rnd() * MON_VIEC_VAT.length)];
      viec = ds.length ? { ma: ds[Math.floor(rnd() * ds.length)], ...m, daCo: false, xong: false, gia: 0 } : null;
      if (viec) dep.thongBao(`${dep.tenCua(viec.ma)} nhắn: "Tiện đường mua giùm ${viec.mon} nha, mình gửi lại tiền."`);
      veLai();
    },
    // vừa mua / làm được một món: nếu đúng món được nhờ thì cầm theo
    daMua(loai, gia) {
      if (viec && !viec.daCo && !viec.xong && viec.loai === loai) { viec.daCo = true; viec.gia = gia; dep.thongBao(`Mua thêm ${viec.mon} cho ${dep.tenCua(viec.ma)}. Mang tới cho ${dep.tenCua(viec.ma)} nhé.`); }
      veLai();
    },
    // nói chuyện với đồng nghiệp: giao món nếu đúng người
    giao(ma) {
      if (!viec || !viec.daCo || viec.xong || viec.ma !== ma) return false;
      viec.xong = true;
      L.set("tien", v("tien") + viec.gia);
      try { L.story.EvaluateFunction("qh", [ma, 6]); } catch { L.set("qh_" + ma, Math.min(100, v("qh_" + ma) + 6)); }
      dep.thongBao(`${dep.tenCua(ma)}: "Cảm ơn nha! Gửi lại tiền nè." (+${viec.gia.toLocaleString("vi-VN")}đ, quan hệ tăng)`);
      veLai();
      return true;
    },
  };
}
