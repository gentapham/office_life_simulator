// Minigame chơi thật: thay cho nút chọn Thắng/Thua.
// choiMinigame({ base, ra, vai, khung, h }) -> Promise<tên cảnh kết quả>
// Mỗi kiểu chơi là một hàm (ctx, nd) gọi ctx.xong(thang, xuatSac, loiNhan) khi kết thúc.

const THANG = /_(thang|thanh_cong|dat)$/;
const THUA = /_(thua|that_bai|truot)$/;
const XUAT_SAC = /_(hoan_hao|nhanh|bat_ngu|qua_nhanh)$/;

// ---------- Tiện ích ----------
const tao = (tag, attrs = {}, ...kids) => {
  const el = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs)) {
    if (k === "class") el.className = v;
    else if (k.startsWith("on")) el.addEventListener(k.slice(2), v);
    else if (k === "html") el.innerHTML = v;
    else if (v !== false && v != null) el.setAttribute(k, v === true ? "" : v);
  }
  for (const kid of kids.flat()) if (kid != null && kid !== false) el.append(kid instanceof Node ? kid : document.createTextNode(String(kid)));
  return el;
};
let H = tao;
const ngau = a => a[Math.floor(Math.random() * a.length)];
const tron = a => { const b = [...a]; for (let i = b.length - 1; i > 0; i--) { const j = Math.floor(Math.random() * (i + 1)); [b[i], b[j]] = [b[j], b[i]]; } return b; };
const khoang = (a, b) => a + Math.random() * (b - a);
const soNgau = (a, b) => Math.floor(khoang(a, b + 1));
const khongDau = s => String(s).normalize("NFD").replace(/[̀-ͯ]/g, "").replace(/đ/g, "d").replace(/Đ/g, "D");
const chuan = s => khongDau(s).toLowerCase().replace(/[^a-z0-9 ]/g, "").replace(/\s+/g, " ").trim();
const so = n => Math.round(n).toLocaleString("vi-VN");
const bamLai = el => { el.classList.remove("nay"); void el.offsetWidth; el.classList.add("nay"); };
const laPhim = (e, ...ma) => ma.includes(e.code) || ma.includes(e.key);

// ---------- Tên minigame ----------
const TEN = {
  xep_xe: "Xếp xe buổi sáng", cong: "Gác cổng", tuan_tra: "Tuần tra nửa đêm", tra_da: "Trà đá bãi xe", do_dai: "Dò đài",
  thu_g: "Viết thư", giu_tuat: "Giữ Tuất", kich_ban_ba_hoi: "Kịch bản ba hồi", cau_hoi_gameshow: "Soạn câu hỏi gameshow",
  phat_bieu: "Bài phát biểu", caption: "Caption thần tốc", brainstorm: "Họp 5 phút", dem_go_may: "Đêm gõ máy",
  gia_vo_lam_viec: "Giả vờ làm việc", so_do: "Sơ đồ sân khấu", bo_dam: "Bộ đàm", ngan_sach: "Cân ngân sách",
  lien_hoan: "Chia đồ liên hoan", bao_cat: "Bao cát", com_nha: "Cơm nhà", tron_tam: "Trốn tắm", tu_lanh: "Rình tủ lạnh",
  nhat_bong: "Nhặt bóng", san_tien: "Săn tiền rơi", truc_cong: "Trực cổng", nguoi_mau: "Người mẫu bốn chân",
  theo_dau: "Lần theo mùi", bang_tien_do: "Bảng tiến độ", doi_file: "Đòi file", dem_than_toc: "Đêm thần tốc",
  xep_lich_quay: "Xếp lịch quay", bao_cao_giao_ban: "Báo cáo giao ban", bida: "Bida chai nước ngọt", check_in: "Check-in sống ảo",
  chot_nhan_hang: "Chốt nhãn hàng", duyet_ke_hoach: "Duyệt kế hoạch", phong_thu: "Phòng thu", lam_them: "Ca làm thêm",
  khoa_quan_ly: "Khóa Quản Lý Có Tâm", bao_cao: "Soát báo cáo", du_doan: "Dự đoán tăng trưởng", ne_chu_no: "Né chủ nợ",
  cua_so_chart: "Canh chart", an_chuc: "Ăn chực", cam_do: "Tiệm cầm đồ", sua_feedback: "Sửa feedback", thumbnail: "Thumbnail 30 giây",
  pha_mau: "Pha màu máy in", may_do: "May đồ mới", alt_tab: "Alt-Tab", deal_ma: "Deal ma", dung_mv: "Dựng MV", dua_render: "Đua render",
  cuu_mau: "Cứu màu", phu_de: "Soát phụ đề", cuu_footage: "Cứu footage", dem_cua_cu: "Đêm của Cú", chong_giay: "Chồng giấy tờ",
  golf: "Golf sân thượng", quan_oc: "Quán ốc đêm", ngan_hang: "Gọi ngân hàng", nhan_22h: "Tin nhắn 22 giờ", gio_vang: "Giờ vàng đăng bài",
  du_trend: "Đu trend", truc_comment: "Trực comment", livestream: "Livestream", duyet_confession: "Duyệt confession", pha_tra: "Pha trà",
  cham_cong: "Canh chấm công", tham_tu: "Thám tử đơn nghỉ", phong_van: "Phỏng vấn", xep_phong: "Xếp phòng", ho_so: "Soát hồ sơ",
  hat_dam_cuoi: "Hát đám cưới", khai_truong: "Hát khai trương", ky_tang: "Ký tặng", livestream_ca_vien: "Livestream cá viên",
  karaoke: "Karaoke 100 điểm", ticket: "Trực ticket", may_in: "Gỡ kẹt máy in", do_day: "Dò dây mạng", mixer: "Bàn mixer",
  danh_den: "Đánh đèn", cuu_file: "Cứu file", mi_ly: "Mì ly và server", san_hoa_don: "Săn hóa đơn", bang_luong: "Bảng lương",
  ba_chu_ky: "Ba chữ ký", cho_mac_ca: "Chợ mặc cả", thue_toi_roi: "Thuế tới rồi", kiem_ke_pantry: "Kiểm kê pantry",
  hai_dien_thoai: "Hai điện thoại", thong_cao: "Viết thông cáo", xep_lich: "Xếp lịch", ep_gia: "Ép giá", chay_show: "Chạy show",
  quan_ly_sac: "Quản lý sạc", ban_tin: "Bản tin thứ Hai", sinh_nhat: "Tổ chức sinh nhật", zalo: "Quản trò group", tra_sua: "Order trà sữa",
  chay_giay: "Chạy giấy tờ", goi_dien: "Gọi điện chào hàng", goi_tai_tro: "Gọi tài trợ", tam_ung: "Xin tạm ứng", song_ao: "Sống ảo",
  poster: "Tạo dáng poster", gameshow: "Gameshow", giup_nguoi: "Giúp người", tiktok: "Nhảy Tóp-tóp", qua_vu: "Quà cho bạn cũ",
  sap_lich: "Sắp lịch sếp", bai_phat_bieu: "Soạn phát biểu", dat_san_golf: "Đặt sân golf", loc_hop_thu: "Lọc hộp thư", mua_qua: "Mua quà",
  cuoc_goi: "Cuộc gọi xin nghỉ", khoe_re: "Phòng khám Khỏe Re", tap_hat: "Tập hát lén", dieu_xe: "Điều xe đoàn", barista: "Barista bất đắc dĩ",
  xep_ghe: "Xếp ghế phòng họp", hat_sang: "Cầm hắt sáng", dem_tien: "Đếm quỹ phạt", tam_tuat: "Tắm cho Tuất", duyet_ban_dung: "Duyệt bản dựng",
  ho_cat: "Hô cắt", bien_ban: "Gõ biên bản", hoc_lom: "Học lỏm", giao_huu: "Giao hữu",
};
const duoiCua = base => base.replace(/^.*?_mg_/, "").replace(/^minigame_?/, "");
export function tenMinigame(base) {
  const d = duoiCua(base);
  return TEN[d] || (d.replace(/_/g, " ").replace(/^./, c => c.toUpperCase()) || "Minigame");
}

// ---------- Bảng ghép: từ khóa -> kiểu chơi + gói nội dung ----------
const BANG = [
  [/_mg_(phu_de|ho_so|san_hoa_don|duyet_ke_hoach|bao_cao_giao_ban)$|(dan_dau_tu|hong_hot)_mg_bao_cao$/, "loi", b =>
    /phu_de/.test(b) ? "phude" : /hoa_don/.test(b) ? "hoadon" : /ho_so/.test(b) ? "hoso" : /ke_hoach/.test(b) ? "kehoach" : "baocao"],
  [/_mg_(caption|gio_vang|nhan_22h|bien_ban|dem_go_may|thu_g|phat_bieu|bai_phat_bieu|thong_cao|ticket)$/, "go", b =>
    /caption|gio_vang/.test(b) ? "caption" : /nhan_22h/.test(b) ? "nhan" : /bien_ban/.test(b) ? "bienban" : /phat_bieu/.test(b) ? "phatbieu"
      : /thong_cao/.test(b) ? "thongcao" : /ticket/.test(b) ? "ticket" : "vietlach"],
  [/livestream_ca_vien|_mg_(hat_dam_cuoi|karaoke|phong_thu|tap_hat|tiktok|du_trend|dung_mv|danh_den|dem_than_toc|khai_truong)$|thanh_xin_nghi_mg_song_ao/, "nhip", b =>
    /livestream/.test(b) ? "live" : /tiktok|du_trend/.test(b) ? "nhay" : /dung_mv|dem_than_toc/.test(b) ? "dung" : /danh_den/.test(b) ? "den" : "hat"],
  [/_mg_(golf|bida|giao_huu)$/, "ngam", b => /bida/.test(b) ? "bida" : /giao_huu/.test(b) ? "bong" : "golf"],
  [/_mg_(tron_tam|ne_chu_no|tuan_tra|chay_show|dieu_xe|chay_giay|tu_lanh)$/, "ne", b =>
    /tron_tam/.test(b) ? "tam" : /chu_no/.test(b) ? "chuno" : /tuan_tra/.test(b) ? "tuantra" : /chay_show|dieu_xe/.test(b) ? "xe" : /tu_lanh/.test(b) ? "tulanh" : "giay"],
  [/_mg_(bao_cat|dua_render|lam_them|tam_tuat|giup_nguoi)$/, "dap", b =>
    /bao_cat/.test(b) ? "dam" : /render/.test(b) ? "render" : /lam_them/.test(b) ? "pha" : /tam_tuat/.test(b) ? "tam" : "day"],
  [/_mg_(san_tien|zalo|cuu_file|alt_tab|ky_tang|cuu_footage|an_chuc)$/, "bat", b =>
    /san_tien/.test(b) ? "tien" : /zalo/.test(b) ? "spam" : /cuu_file/.test(b) ? "file" : /alt_tab/.test(b) ? "sep" : /ky_tang/.test(b) ? "kytang" : /footage/.test(b) ? "footage" : "an"],
  [/_mg_(ngan_sach|du_doan|bang_luong|cho_mac_ca|dem_tien|mua_qua|sinh_nhat|kiem_ke_pantry|lien_hoan|com_nha)$|sales_mg_bao_cao$/, "tinh", b =>
    /ngan_sach|sinh_nhat/.test(b) ? "ngansach" : /du_doan|bao_cao/.test(b) ? "chart" : /bang_luong/.test(b) ? "luong" : /dem_tien/.test(b) ? "demtien"
      : /lien_hoan|kiem_ke/.test(b) ? "chia" : "cho"],
  [/_mg_(xep_lich|xep_lich_quay|sap_lich|bang_tien_do|xep_phong|xep_ghe|xep_xe|so_do|thue_toi_roi|ba_chu_ky|doi_file|dat_san_golf|ban_tin|quan_ly_sac)$/, "xep", b =>
    /thue_toi_roi/.test(b) ? "hoso" : /quan_ly_sac/.test(b) ? "sac" : /ban_tin/.test(b) ? "bantin" : /xep_xe/.test(b) ? "xe" : /xep_phong|xep_ghe|so_do/.test(b) ? "phong" : "lich"],
  [/_mg_(tra_da|tra_sua|barista|nguoi_mau|poster|theo_dau|may_in|do_day|hoc_lom)$/, "nho", b =>
    /tra_da/.test(b) ? "tra" : /tra_sua/.test(b) ? "trasua" : /barista/.test(b) ? "caphe" : /nguoi_mau/.test(b) ? "lenh" : /poster/.test(b) ? "dang"
      : /theo_dau/.test(b) ? "mui" : /may_in/.test(b) ? "mayin" : /do_day/.test(b) ? "day" : "dung"],
  [/_mg_(cham_cong|thumbnail|check_in|nhat_bong|mi_ly|hat_sang|do_dai|giu_tuat|cua_so_chart|cuu_mau|pha_mau|may_do|mixer|chong_giay|ho_cat)$|sales_mg_song_ao/, "canh", b =>
    /cham_cong/.test(b) ? "chamcong" : /thumbnail|check_in|song_ao/.test(b) ? "chup" : /nhat_bong/.test(b) ? "bong" : /mi_ly/.test(b) ? "mily"
      : /hat_sang/.test(b) ? "hatsang" : /do_dai/.test(b) ? "dai" : /giu_tuat/.test(b) ? "xich" : /chart/.test(b) ? "chart"
        : /mau|may_do/.test(b) ? "mau" : /mixer/.test(b) ? "mixer" : /chong_giay/.test(b) ? "giay" : "cat"],
  [/_mg_(truc_comment|duyet_confession|sua_feedback|truc_cong|cong|phong_van|tham_tu|loc_hop_thu|hai_dien_thoai|bo_dam|livestream|cau_hoi_gameshow|gameshow|kich_ban_ba_hoi|duyet_ban_dung|khoa_quan_ly|brainstorm|gia_vo_lam_viec|dem_cua_cu|pha_tra|khoe_re|cuoc_goi|qua_vu)$/, "chon", b =>
    /comment/.test(b) ? "comment" : /confession/.test(b) ? "confession" : /feedback/.test(b) ? "feedback" : /cho_mg_truc_cong/.test(b) ? "congcho"
      : /cong$/.test(b) ? "cong" : /phong_van|tham_tu/.test(b) ? "phongvan" : /hop_thu/.test(b) ? "hopthu" : /dien_thoai|bo_dam/.test(b) ? "dienthoai"
        : /livestream/.test(b) ? "live" : /gameshow/.test(b) ? "gameshow" : /kich_ban/.test(b) ? "kichban" : /ban_dung|dem_cua_cu/.test(b) ? "bandung"
          : /quan_ly|brainstorm|gia_vo/.test(b) ? "quanly" : /pha_tra/.test(b) ? "tra" : /khoe_re|cuoc_goi/.test(b) ? "xinnghi" : "noi"],
  [/_mg_(ep_gia|cam_do|ngan_hang|tam_ung|deal_ma|chot_nhan_hang|goi_dien|goi_tai_tro|quan_oc)$/, "chon", () => "noi"],
];
const TAT_CA = ["go", "canh", "nhip", "chon", "nho", "bat", "ne", "dap", "loi", "tinh", "xep", "ngam"];
function chonKieu(base) {
  for (const [re, kieu, goi] of BANG) if (re.test(base)) return { kieu, goi: goi(base) };
  let bam = 0; for (const c of base) bam = (bam * 31 + c.charCodeAt(0)) >>> 0;
  return { kieu: TAT_CA[bam % TAT_CA.length], goi: "chung" };
}

// =====================================================================
// 1. Gõ chữ: gõ đúng cụm từ trước khi hết giờ (có dấu hay không dấu đều được)
// =====================================================================
const GO = {
  caption: ["slay cả văn phòng", "hồng là chân ái", "ai hiểu không", "đỉnh nóc kịch trần", "gét gô cả nhà", "mặc hồng đi làm", "thái độ là tất cả", "sếp đang nhìn", "lên xu hướng", "hôm nay ăn gì", "đẹp không cần lọc", "deadline là bạn"],
  nhan: ["sáng mai họp sớm", "nộp báo cáo trước chín giờ", "nhớ mặc đồng phục", "không ai được nghỉ", "cảm ơn cả nhà", "đọc xong thả tim", "khách tới lúc mười giờ", "kiểm tra hộp thư", "đừng hỏi lương", "tinh thần đi lên"],
  bienban: ["thống nhất phương án", "cần làm rõ thêm", "đã ghi nhận", "họp tiếp tuần sau", "giao cho thực tập", "hạn chót thứ sáu", "chờ sếp duyệt", "không ai phản đối", "tạm hoãn ngân sách", "cả phòng đồng ý"],
  phatbieu: ["văn hóa công ty", "chúng ta là gia đình", "thay đổi mindset", "truyền lửa", "hồi khởi nghiệp", "cùng nhau bứt phá", "khách hàng là trên hết", "không ngừng học hỏi", "năm nay tăng trưởng", "cảm ơn mọi người"],
  thongcao: ["chân thành xin lỗi", "rút kinh nghiệm sâu sắc", "mong khán giả thông cảm", "thông tin chưa chính xác", "đang làm việc với đối tác", "sẽ phản hồi sớm", "cảm ơn sự quan tâm", "không có ý xúc phạm"],
  ticket: ["khởi động lại máy", "đã cắm điện chưa", "xóa bớt tab đi", "để em qua xem", "máy chạy bình thường", "đổi mật khẩu mới", "cập nhật phần mềm", "đừng bấm vào link lạ", "đã xử lý xong"],
  vietlach: ["một ngày dài", "ấm trà nóng", "máy đánh chữ", "gác mái số bảy", "mưa ngoài hiên", "ánh đèn bàn", "chuyện văn phòng", "trang thứ mười", "người gác cổng", "con chó nhỏ", "giấy kẻ ô"],
  chung: ["làm cho xong", "đúng hạn chót", "nộp báo cáo", "cà phê sáng", "họp năm phút", "chờ sếp duyệt", "giờ nghỉ trưa", "tăng ca tối nay"],
};
function choiGo(ctx, nd) {
  const can = ctx.cham ? 5 : 6, giay = ctx.cham ? 42 : 36;
  const ds = tron(nd); let i = 0, dung = 0;
  const chu = H("div", { class: "mg-go-chu" }), goiY = H("div", { class: "mg-go-goiy" });
  const o = H("input", { class: "mg-go-o", type: "text", autocomplete: "off", autocapitalize: "off", autocorrect: "off", spellcheck: "false", "aria-label": "Gõ cụm từ", enterkeyhint: "next" });
  const dem = H("div", { class: "mg-cham-dem" });
  const hien = () => {
    const c = ds[i % ds.length]; chu.textContent = c; goiY.textContent = "Không dấu: " + khongDau(c);
    dem.replaceChildren(...Array.from({ length: can }, (_, k) => H("i", { class: k < dung ? "co" : "" })));
  };
  o.addEventListener("input", () => {
    const muc = chuan(ds[i % ds.length]), go = chuan(o.value);
    if (go === muc) {
      dung++; i++; o.value = ""; o.classList.remove("sai"); bamLai(chu);
      ctx.dat(`Đã gõ ${dung}/${can}`);
      if (dung >= can) return ctx.xong(true, ctx.conLai() > giay * 0.35, "Gõ kịp hết, ngón tay nhanh hơn deadline.");
      hien();
    } else o.classList.toggle("sai", !muc.startsWith(go));
  });
  ctx.san.append(H("div", { class: "mg-go" }, chu, goiY, o, dem));
  ctx.dat(`Đã gõ 0/${can}`); hien();
  ctx.dongHo(giay, () => ctx.xong(false, false, `Mới gõ được ${dung}/${can}. Chữ chạy nhanh hơn tay.`));
  o.focus();
}

// =====================================================================
// 2. Canh giờ: bấm đúng lúc kim nằm trong vùng xanh
// =====================================================================
const CANH = {
  chamcong: { nut: "Chấm công", vung: "8:00", tieu: "Quẹt thẻ đúng phút" },
  chup: { nut: "Chụp", vung: "Đẹp", tieu: "Bắt đúng khoảnh khắc" },
  bong: { nut: "Nhảy", vung: "Bóng", tieu: "Nhảy lên đớp bóng" },
  mily: { nut: "Mở nắp", vung: "3 phút", tieu: "Mì chín, server lên" },
  hatsang: { nut: "Hắt", vung: "Mặt", tieu: "Hắt sáng trúng mặt" },
  dai: { nut: "Dừng", vung: "Rõ", tieu: "Vặn đúng tần số" },
  xich: { nut: "Giữ", vung: "Vừa", tieu: "Giữ dây vừa tay" },
  chart: { nut: "Mua", vung: "Đáy", tieu: "Mua đúng đáy" },
  mau: { nut: "Chốt màu", vung: "Hồng", tieu: "Chỉnh đúng tông hồng" },
  mixer: { nut: "Chốt", vung: "Xanh", tieu: "Giữ âm lượng vùng xanh" },
  giay: { nut: "Đặt", vung: "Giữa", tieu: "Đặt tờ trình cho thẳng" },
  cat: { nut: "Cắt", vung: "Đạt", tieu: "Hô cắt đúng lúc" },
  chung: { nut: "Bấm", vung: "Đúng", tieu: "Bấm đúng lúc" },
};
function choiCanh(ctx, nd) {
  const luot = 5, can = 3; let lan = 0, trung = 0, vi = 0, huong = 1, toc = 0.5, khoa = false, rong = 0.17, tam = 0.5;
  const vung = H("div", { class: "mg-canh-vung" }, nd.vung), kim = H("div", { class: "mg-canh-kim" });
  const ray = H("div", { class: "mg-canh-ray", onpointerdown: e => { e.preventDefault(); bam(); } }, vung, kim);
  const cham = H("div", { class: "mg-cham-dem to" }, Array.from({ length: luot }, () => H("i")));
  const nut = H("button", { class: "mg-nut-lon", type: "button", onpointerdown: e => { e.preventDefault(); bam(); } }, nd.nut);
  const datVung = () => { tam = khoang(0.18 + rong / 2, 0.82 - rong / 2); vung.style.left = (tam - rong / 2) * 100 + "%"; vung.style.width = rong * 100 + "%"; };
  const bam = () => {
    if (khoa || lan >= luot) return;
    const ok = Math.abs(vi - tam) <= rong / 2 + 0.01; lan++; if (ok) trung++;
    cham.children[lan - 1].className = ok ? "co" : "hong"; ray.classList.add(ok ? "dung" : "sai");
    ctx.dat(`Trúng ${trung}/${can} · còn ${luot - lan} lượt`);
    if (trung >= can) return ctx.xong(true, trung === lan, `Trúng ${trung} trên ${lan} lần. ${nd.tieu}, gọn gàng.`);
    if (lan - trung > luot - can) return ctx.xong(false, false, `Chỉ trúng ${trung}/${can}. Tay nhanh hơn mắt một nhịp.`);
    khoa = true;
    ctx.hen(() => { ray.classList.remove("dung", "sai"); toc += 0.13; rong = Math.max(0.12, rong - 0.012); datVung(); khoa = false; }, 550);
  };
  ctx.phim = e => { if (laPhim(e, "Space", "Enter")) { e.preventDefault(); if (!e.repeat) bam(); } };
  ctx.san.append(H("div", { class: "mg-canh" }, H("p", { class: "mg-tieu" }, nd.tieu), ray, cham, nut, H("p", { class: "mg-meo" }, ctx.cham ? "Chạm nút hoặc chạm thanh" : "Phím Cách hoặc Enter")));
  datVung(); ctx.dat(`Trúng 0/${can} · còn ${luot} lượt`);
  ctx.lap(dt => {
    if (khoa) return; vi += huong * toc * dt;
    if (vi >= 1) { vi = 1; huong = -1; } else if (vi <= 0) { vi = 0; huong = 1; }
    kim.style.left = vi * 100 + "%";
  });
  ctx.dongHo(30, () => ctx.xong(false, false, "Hết giờ mà vẫn chưa canh xong."));
}

// =====================================================================
// 3. Theo nhịp: nốt rơi xuống 4 làn, bấm D F J K hoặc chạm làn
// =====================================================================
const NHIP = {
  hat: { bai: "Công Viên (bản phối đám cưới)", lan: ["Đô", "Rê", "Mi", "Pha"] },
  nhay: { bai: "Nhảy ở chỗ làm khi sếp quay lưng", lan: ["Trái", "Xoay", "Chỉ tay", "Phải"] },
  dung: { bai: "Timeline 3 phút 40", lan: ["Cắt", "Ghép", "Màu", "Xuất"] },
  den: { bai: "Liveshow tổng duyệt", lan: ["Hồng", "Xanh", "Vàng", "Trắng"] },
  live: { bai: "Livestream chốt đơn", lan: ["Hát", "Đọc", "Chốt", "Cảm ơn"] },
  chung: { bai: "Nhịp văn phòng", lan: ["Gõ", "Bấm", "Ký", "Gửi"] },
};
function choiNhip(ctx, nd) {
  const PHIM = [["KeyD", "ArrowLeft"], ["KeyF", "ArrowDown"], ["KeyJ", "ArrowUp"], ["KeyK", "ArrowRight"]];
  const NHAN = ["D", "F", "J", "K"];
  const ROI = 1.7, VACH = 82, CUA = 0.15, dai = 26;
  const not = []; let t0 = 1.2, truoc = -1;
  while (t0 < dai) { let l = soNgau(0, 3); if (l === truoc && Math.random() < 0.6) l = (l + soNgau(1, 3)) % 4; truoc = l; not.push({ t: t0, l, el: null, xong: false }); t0 += ngau([0.5, 0.6, 0.75, 0.75, 0.9, 1.0]); }
  let trung = 0, truot = 0, thua = 0, gio = 0, chuoi = 0;
  const san = H("div", { class: "mg-nhip-san" });
  const lanEl = nd.lan.map((ten, i) => H("div", { class: "mg-nhip-lan", onpointerdown: e => { e.preventDefault(); bam(i); } },
    H("div", { class: "mg-nhip-vach" }), H("div", { class: "mg-nhip-nhan" }, ctx.cham ? ten : [H("kbd", {}, NHAN[i]), " ", ten])));
  san.append(...lanEl);
  const bao = H("div", { class: "mg-nhip-bao" });
  const baoChu = (s, cls) => { bao.textContent = s; bao.className = "mg-nhip-bao " + cls; bamLai(bao); };
  const bam = i => {
    bamLai(lanEl[i]);
    const n = not.find(n => !n.xong && n.l === i && Math.abs(n.t - gio) <= CUA);
    if (n) { n.xong = true; n.el?.remove(); trung++; chuoi++; baoChu(chuoi >= 5 ? `Chuẩn x${chuoi}` : "Chuẩn", "tot"); }
    else { thua++; chuoi = 0; baoChu("Lệch nhịp", "xau"); }
  };
  ctx.phim = e => { const i = PHIM.findIndex(p => p.includes(e.code)); if (i >= 0) { e.preventDefault(); if (!e.repeat) bam(i); } };
  ctx.san.append(H("div", { class: "mg-nhip" }, H("p", { class: "mg-tieu" }, nd.bai), san, bao));
  const ketThuc = () => {
    const ty = trung / (not.length + thua * 0.35);
    const pt = Math.round(ty * 100);
    ty >= 0.6 ? ctx.xong(true, ty >= 0.9, `Chấm ${pt} điểm. Trúng ${trung}/${not.length} nhịp.`) : ctx.xong(false, false, `Chấm ${pt} điểm. Trúng ${trung}/${not.length} nhịp, cần 60.`);
  };
  ctx.dongHo(dai + 1, ketThuc);
  ctx.dat(`Trúng 0/${not.length}`);
  ctx.lap(dt => {
    gio += dt;
    for (const n of not) {
      if (n.xong) continue;
      const truocBao = n.t - gio;
      if (truocBao > ROI) break;
      if (!n.el) { n.el = H("div", { class: "mg-nhip-not" }); lanEl[n.l].append(n.el); }
      n.el.style.top = (1 - truocBao / ROI) * VACH + "%";
      if (truocBao < -CUA) { n.xong = true; n.el.remove(); truot++; chuoi = 0; baoChu("Trượt", "xau"); }
    }
    ctx.dat(`Trúng ${trung}/${not.length}`);
  });
}

// =====================================================================
// 4. Chọn nhanh: mỗi thẻ chọn trái hoặc phải trong vài giây
// =====================================================================
const CHON = {
  comment: { trai: "Xóa", phai: "Thả tim", muc: [
    ["Chị Hồng mặc gì cũng đẹp, mai lên clip nữa nha", true], ["Clip nhạt như nước ốc, unfollow", false], ["Inbox em mua sim số đẹp giá rẻ", false],
    ["Xem tới đoạn con chó rũ lông cười muốn xỉu", true], ["Công ty này toàn diễn, ai tin", false], ["Đi làm mệt mà xem cái này hết mệt", true],
    ["Bấm link nhận quà tri ân 5 triệu", false], ["Mê cái áo hồng quá chỉ chỗ mua với", true], ["Nhìn mặt là biết làm biếng", false],
    ["Ngày nào cũng hóng phòng này", true], ["Chị ơi phần hai đâu rồi", true], ["Kéo follow chéo không bạn ơi", false]] },
  confession: { trai: "Bỏ", phai: "Đăng", muc: [
    ["Gửi bạn áo xanh tầng 1: cảm ơn ly cà phê sáng thứ Hai", true], ["Bóc phốt anh X phòng kế toán, kèm số điện thoại", false],
    ["Ai để quên hộp cơm thịt kho trong tủ lạnh, nó bắt đầu có ý thức rồi", true], ["Sếp ngoại tình, tôi có ảnh, đăng đi admin", false],
    ["Máy in tầng 1 là thực thể sống, ai đồng ý", true], ["Công ty mình sắp phá sản, tin nội bộ, nghe đâu nói đó", false],
    ["Crush bạn thực tập cầm hắt sáng, không dám nói", true], ["Đăng giùm bảng lương cả phòng, tôi chụp lén được", false],
    ["Con chó công ty khôn hơn nửa phòng họp", true], ["Tên thật của người hay ăn chực: là...", false], ["Cảm ơn chị bảo vệ đã giữ xe giùm hôm mưa", true]] },
  feedback: { trai: "Thương lượng", phai: "Sửa ngay", muc: [
    ["Chữ tiêu đề bị che mất một nửa", true], ["Logo to thêm, nhưng nhỏ lại", false], ["Sai số điện thoại hotline", true],
    ["Màu hồng hơi buồn, cho nó vui lên", false], ["Thiếu ngày giờ sự kiện", true], ["Làm sao cho nó sang, nhưng đừng tốn", false],
    ["Ảnh bị vỡ khi in khổ lớn", true], ["Thêm 6 logo nhà tài trợ vào chỗ trống 2 cm", false], ["Tên khách mời bị viết sai dấu", true],
    ["Chị cũng không biết, cứ làm thử 10 bản", false], ["Bản in bị lệch lề trái", true]] },
  cong: { trai: "Chặn lại", phai: "Cho vào", muc: [
    ["Shipper giày mòn, gọi đúng tên người nhận", true], ["Giày mới tinh, túi áo lộ ống kính máy ảnh", false], ["Có tên trong sổ hẹn, tới đúng giờ", true],
    ["Nói là họ hàng giám đốc nhưng không biết tên giám đốc", false], ["Nhân viên mới, cầm giấy nhận việc có dấu đỏ", true],
    ["Người của bên LL, xin vào xem nhà vệ sinh", false], ["Thợ sửa máy in IT gọi xuống xác nhận", true], ["Đeo kính râm, nói tới giao trà sữa cho chính mình", false],
    ["Bác gái mang cơm cho con, con ra tận cổng đón", true], ["Không hẹn, không tên, chỉ nói xin chữ ký Siêu Nhân Hồng", false]] },
  congcho: { trai: "Sủa", phai: "Vẫy đuôi", muc: [
    ["Mùi xăng mới, máy ảnh trong túi, đi rón rén", false], ["Mùi cơm nhà, giọng quen của chị Đại", true], ["Shipper mùi bánh mì, gọi đúng tên người nhận", true],
    ["Người lạ đứng chụp cổng công ty", false], ["Bác bảo vệ đi mua trà đá về", true], ["Người mặc vest, nói giọng giống bên LL", false],
    ["Bạn thực tập, túi áo có mùi xúc xích", true], ["Kẻ lảng vảng đọc trộm biển số xe", false], ["Khách có hẹn, đứng chờ ngoan ngoãn", true], ["Người leo hàng rào phía sau", false]] },
  phongvan: { trai: "Nghi ngờ", phai: "Tin được", muc: [
    ["Em từng làm trợ lý ba năm, có thư giới thiệu", true], ["Em thông thạo năm ngôn ngữ, đều tự học trong một tuần", false],
    ["Em dị ứng lông chó nhẹ, uống thuốc là ổn", true], ["Em chưa trễ hạn lần nào trong đời", false], ["Em không thích màu hồng nhưng làm việc được", true],
    ["Công ty cũ em giải thể do em làm quá giỏi", false], ["Em xin nghỉ hôm qua vì đi khám, có giấy của phòng khám", true],
    ["Giấy khám ghi ngày Chủ nhật, phòng khám đóng cửa Chủ nhật", false], ["Em sẵn sàng tăng ca vào cuối tháng", true], ["Em quen thân giám đốc, anh ấy bảo em cứ tới", false]] },
  hopthu: { trai: "Rác", phai: "Quan trọng", muc: [
    ["Đối tác xác nhận lịch golf sáng thứ Bảy", true], ["Chúc mừng bạn trúng thưởng một chiếc ô tô", false], ["Hợp đồng tài trợ cần ký trước 17 giờ", true],
    ["Khuyến mãi khóa học làm giàu sau 7 ngày", false], ["Phòng kế toán: hồ sơ thuế còn thiếu chữ ký", true], ["Thư dây chuyền: chuyển tiếp cho 10 người", false],
    ["Đài Tivi Hóng mời phỏng vấn tuần sau", true], ["Cập nhật mật khẩu ngay tại đường link này", false], ["Lịch họp hội đồng quản trị tháng 11", true], ["Bán sim số đẹp đuôi 6868", false]] },
  dienthoai: { trai: "Để sau", phai: "Nghe ngay", muc: [
    ["Đài truyền hình hỏi giờ ghi hình chiều nay", true], ["Tổng đài mời vay tiêu dùng", false], ["Mẹ cô dâu hỏi ca sĩ tới chưa", true],
    ["Bạn cũ rủ đầu tư đa cấp", false], ["Giám đốc gọi lần thứ ba", true], ["Khảo sát mức độ hài lòng của mạng di động", false],
    ["Tài xế xe đoàn báo kẹt xe", true], ["Người lạ hỏi số áo của Siêu Nhân Hồng", false], ["Nhãn hàng xác nhận thanh toán", true], ["Quảng cáo bảo hiểm thú cưng", false]] },
  live: { trai: "Lờ đi", phai: "Trả lời", muc: [
    ["Mua 2 hộp có được giảm không anh", true], ["Fake hết, toàn diễn", false], ["Ship về Quận Hóng mất mấy ngày", true],
    ["Lộ mặt đi rồi mua", false], ["Nước tăng lực này uống buổi tối được không", true], ["Ai đó mua giùm tui đi", false], ["Còn size áo hồng XL không", true],
    ["Bán vậy mà cũng bán", false], ["Mã giảm giá nhập ở đâu vậy", true], ["Spam spam spam", false]] },
  gameshow: { trai: "Sai", phai: "Đúng", muc: [
    ["Hồng là màu pha từ đỏ và trắng", true], ["Một tuần có tám ngày làm việc", false], ["Mười nghìn cộng năm nghìn bằng mười lăm nghìn", true],
    ["Cá voi là loài cá", false], ["Nước sôi ở 100 độ C ở mực nước biển", true], ["Con chó có ba chân sau", false], ["Thủ đô của nước ta là Hà Nội", true],
    ["Mặt trời mọc ở hướng Tây", false], ["Một giờ có 60 phút", true], ["Thứ Hai đứng sau Chủ nhật một ngày", true], ["Tháng Hai luôn có 31 ngày", false]] },
  kichban: { trai: "Mượn", phai: "Thật", muc: [
    ["Siêu Nhân Hồng dắt cụ qua đường ở Quận Hóng", true], ["Siêu Nhân Hồng cưỡi ngựa chỉ tay vào bản đồ", false], ["Gỡ diều mắc trên cây cho bọn nhỏ", true],
    ["Một mình đánh bại 50 tên áo đen", false], ["Đẩy xe chết máy dưới mưa", true], ["Bay qua tòa nhà 30 tầng", false], ["Nhặt rác ở Công viên Hồ Cá Mập", true],
    ["Cứu cả thành phố khỏi thiên thạch", false], ["Ngồi ăn bánh chuối chiên với bác bảo vệ", true], ["Nhận huy chương từ tổng thống", false]] },
  bandung: { trai: "Góp ý", phai: "Duyệt", muc: [
    ["Chuyển cảnh khớp nhịp, màu đều", true], ["Mất tiếng ở phút thứ hai", false], ["Phụ đề đúng chính tả, đủ thời lượng", true],
    ["Logo nhà tài trợ bị che", false], ["Cảnh mở đầu ngắn, vào việc nhanh", true], ["Lọt cảnh có người đi ngang khung hình", false], ["Âm lượng nhạc nền vừa phải", true],
    ["Màu da chuyển xanh lá", false], ["Kết bài có lời cảm ơn khán giả", true], ["Video dài 47 phút cho clip 1 phút", false]] },
  quanly: { trai: "Sai", phai: "Đúng", muc: [
    ["Giao việc cần có hạn chót rõ ràng", true], ["Họp càng dài thì càng hiệu quả", false], ["Khen trước đám đông, góp ý riêng", true],
    ["Nhắn việc lúc 22 giờ là thể hiện tâm huyết", false], ["Lắng nghe trước khi quyết định", true], ["Nhân viên giỏi thì không cần nghỉ phép", false],
    ["Ghi biên bản giúp tránh hiểu lầm", true], ["Đổ lỗi giúp tinh thần cả phòng đi lên", false], ["Chia việc theo thế mạnh từng người", true], ["Ký luôn cho lẹ là quản lý tốt", false]] },
  tra: { trai: "Trà gừng", phai: "Trà hoa cúc", muc: [
    ["Mặt đỏ, nắm tay chặt, nói rất nhanh", true], ["Mắt sưng, ôm hộp khăn giấy", false], ["Liên tục nhìn đồng hồ, rung chân", true],
    ["Ho khan, mặc hai lớp áo", false], ["Vừa cãi nhau với ngân hàng xong", true], ["Mặt tái, vừa đi mưa về", false], ["Thở gấp, bấm điện thoại liên tục", true],
    ["Buồn ngủ, ngáp dài sau ca đêm", false], ["Lắp bắp vì sắp lên phát biểu", true], ["Ôm bụng, kêu lạnh tay", false]] },
  xinnghi: { trai: "Lố quá", phai: "Nói được", muc: [
    ["Dạ em sốt nhẹ từ tối qua", true], ["Em bị ngựa vằn đá vào chân", false], ["Em đi khám răng, có giấy hẹn", true],
    ["Nhà em có tận ba đám cưới cùng lúc", false], ["Em đau bụng, sáng nay đi không nổi", true], ["Em bị người ngoài hành tinh giữ lại", false],
    ["Xe em hỏng giữa đường, đang chờ sửa", true], ["Bà ngoại em mất lần thứ tư trong năm", false], ["Em xin nghỉ nửa ngày lo giấy tờ", true], ["Em bị kẹt trong thang máy hai ngày", false]] },
  noi: { trai: "Không nói", phai: "Nói", muc: [
    ["Bên em giao đúng hẹn, trễ một ngày giảm 10%", true], ["Chú em là giám đốc, anh cứ yên tâm", false], ["Em gửi báo giá chi tiết trong chiều nay", true],
    ["Cam kết lên xu hướng trong 24 giờ", false], ["Anh thử gói nhỏ trước, ưng rồi mình làm lớn", true], ["Hứa luôn ca sĩ hạng A tới hát miễn phí", false],
    ["Có hóa đơn đầy đủ cho từng khoản", true], ["Đối thủ bên kia toàn lừa đảo", false], ["Em xin phép ghi lại để báo sếp", true], ["Lãi suất bao nhiêu em cũng chịu", false], ["Mình hẹn lại thứ Năm, em mang mẫu tới", true]] },
  chung: { trai: "Không ổn", phai: "Ổn", muc: [
    ["Nộp báo cáo trước hạn một ngày", true], ["Trả lời sếp bằng sticker ngủ", false], ["Ghi chú lại yêu cầu của khách", true],
    ["Để quên hộp cơm trong tủ lạnh ba tuần", false], ["Hỏi lại khi chưa rõ việc", true], ["Họp 5 phút kéo dài 2 tiếng", false], ["Tắt máy lạnh khi về", true], ["Bấm vào link lạ trong email", false]] },
};
function choiChon(ctx, nd) {
  const tong = 8, can = 6, moiThe = 5.5;
  const ds = tron(nd.muc).slice(0, tong);
  let i = 0, dung = 0, conThe = moiThe, khoa = false;
  const the = H("div", { class: "mg-chon-the" }), vach = H("i");
  const thanh = H("div", { class: "mg-chon-thanh" }, vach);
  const nutT = H("button", { class: "mg-nut-chon trai", type: "button", onclick: () => chon(false) }, ctx.cham ? "" : H("kbd", {}, "←"), nd.trai);
  const nutP = H("button", { class: "mg-nut-chon phai", type: "button", onclick: () => chon(true) }, nd.phai, ctx.cham ? "" : H("kbd", {}, "→"));
  const hien = () => { the.textContent = ds[i][0]; the.className = "mg-chon-the"; bamLai(the); conThe = moiThe; ctx.dat(`Thẻ ${i + 1}/${tong} · đúng ${dung}`); };
  const chon = phai => {
    if (khoa) return; khoa = true;
    const ok = phai === ds[i][1]; if (ok) dung++;
    the.classList.add(ok ? "dung" : "sai");
    ctx.hen(() => {
      i++; khoa = false;
      if (dung >= can && i >= tong) return ctx.xong(true, dung === tong, `Đúng ${dung}/${tong}. Phán quyết gọn, không ai cãi.`);
      if (i - dung > tong - can) return ctx.xong(false, false, `Đúng ${dung}/${tong}, cần ${can}. Lần sau đọc kỹ hơn một nhịp.`);
      if (i >= tong) return ctx.xong(dung >= can, dung === tong, `Đúng ${dung}/${tong}.`);
      hien();
    }, 380);
  };
  ctx.phim = e => {
    if (laPhim(e, "ArrowLeft", "KeyA")) { e.preventDefault(); if (!e.repeat) chon(false); }
    else if (laPhim(e, "ArrowRight", "KeyD")) { e.preventDefault(); if (!e.repeat) chon(true); }
  };
  ctx.san.append(H("div", { class: "mg-chon" }, thanh, the, H("div", { class: "mg-chon-nut" }, nutT, nutP)));
  hien();
  ctx.lap(dt => {
    if (khoa) return; conThe -= dt; vach.style.width = Math.max(0, conThe / moiThe) * 100 + "%";
    if (conThe <= 0) chon(!ds[i][1]);
  });
}

// =====================================================================
// 5. Ghi nhớ: xem chuỗi sáng rồi bấm lại đúng thứ tự
// =====================================================================
const NHO = {
  tra: ["Đặc", "Nhạt", "Nhiều đá", "Thêm đường"], trasua: ["Trân châu", "Ít đường", "Nhiều đá", "Thạch"],
  caphe: ["Cà phê đen", "Sữa đá", "Bạc xỉu", "Cà phê muối"], lenh: ["Ngồi", "Bắt tay", "Nằm", "Xoay vòng"],
  dang: ["Chỉ tay", "Chống hông", "Giơ nắm đấm", "Bắn tim"], mui: ["Cơm tấm", "Thịt kho", "Pate", "Bánh mì"],
  mayin: ["Nắp trên", "Khay giấy", "Hộp mực", "Cửa sau"], day: ["Phòng dựng", "Phòng sếp", "Studio", "Kế toán"],
  dung: ["Cắt", "Ghép", "Chỉnh màu", "Xuất file"], chung: ["Email", "Báo cáo", "Họp", "Cà phê"],
};
function choiNho(ctx, nd) {
  const vong = [3, 4, 5]; let v = 0, choPhep = 1, chuoi = [], buoc = 0, dangXem = true, loi = 0, cho = 0;
  const o = nd.map((ten, i) => H("button", { class: "mg-nho-o m" + i, type: "button", onpointerdown: e => { e.preventDefault(); bam(i); } },
    ctx.cham ? "" : H("kbd", {}, String(i + 1)), H("span", {}, ten)));
  const bao = H("p", { class: "mg-tieu" });
  const sang = (i, ms = 420) => { o[i].classList.add("sang"); ctx.hen(() => o[i].classList.remove("sang"), ms); };
  const choiVong = () => {
    dangXem = true; buoc = 0; chuoi = Array.from({ length: vong[v] }, () => soNgau(0, 3));
    bao.textContent = "Nhìn kỹ thứ tự..."; ctx.dat(`Vòng ${v + 1}/${vong.length}`);
    chuoi.forEach((x, k) => ctx.hen(() => sang(x), 700 + k * 650));
    ctx.hen(() => { dangXem = false; cho = 0; bao.textContent = "Tới lượt bạn: bấm lại đúng thứ tự"; }, 700 + chuoi.length * 650);
  };
  const sai = () => {
    loi++; dangXem = true; ctx.san.firstChild.classList.add("rung"); ctx.hen(() => ctx.san.firstChild?.classList.remove("rung"), 400);
    if (choPhep-- > 0) { bao.textContent = "Sai thứ tự. Thử lại một chuỗi khác."; ctx.hen(choiVong, 1100); }
    else ctx.xong(false, false, `Nhớ được ${v}/${vong.length} vòng. Trí nhớ cần thêm một ly cà phê.`);
  };
  const bam = i => {
    if (dangXem) return; sang(i, 200); cho = 0;
    if (chuoi[buoc] !== i) return sai();
    if (++buoc >= chuoi.length) {
      dangXem = true; v++;
      if (v >= vong.length) return ctx.xong(true, loi === 0, `Nhớ trọn ${vong.length} vòng, không sót món nào.`);
      bao.textContent = "Chuẩn. Chuỗi tiếp theo dài hơn."; ctx.hen(choiVong, 900);
    }
  };
  ctx.phim = e => { const k = ["Digit1", "Digit2", "Digit3", "Digit4"].indexOf(e.code); if (k >= 0) { e.preventDefault(); if (!e.repeat) bam(k); } };
  ctx.san.append(H("div", { class: "mg-nho" }, bao, H("div", { class: "mg-nho-luoi" }, o)));
  ctx.lap(dt => { if (!dangXem && (cho += dt) > 6) sai(); });
  choiVong();
}

// =====================================================================
// 6. Bắt nhanh: bấm thứ cần bắt, tránh thứ không được bấm
// =====================================================================
const BAT = {
  tien: { tot: ["10.000đ", "Đồng xu", "50.000đ", "20.000đ"], xau: ["Vỏ kẹo", "Hóa đơn cũ"], muc: "Ngậm tiền rơi, bỏ qua rác" },
  spam: { tot: ["Bán sim số đẹp", "Link nhận quà", "Vay nhanh 5 phút", "Kéo follow"], xau: ["Thông báo của sếp", "Lịch họp"], muc: "Xóa tin rác, giữ thông báo" },
  file: { tot: ["Mảnh file", "Khối dữ liệu", "Mảnh video"], xau: ["Bad sector"], muc: "Mở ô dữ liệu, tránh ô hỏng" },
  sep: { tot: ["Sếp tới", "Tiếng giày sếp", "Sếp ngó vào"], xau: ["Đồng nghiệp", "Thực tập sinh"], muc: "Sếp tới thì đổi tab, người nhà thì thôi" },
  kytang: { tot: ["Fan cầm ảnh", "Fan cầm đĩa", "Fan nhí"], xau: ["Khách hỏi quầy đổi trả", "Bảo vệ siêu thị"], muc: "Ký cho fan, đừng ký nhầm" },
  footage: { tot: ["Clip nét", "Cảnh đẹp", "Đủ tiếng"], xau: ["Clip mờ", "Mất tiếng"], muc: "Giữ clip tốt, bỏ clip hỏng" },
  an: { tot: ["Bánh không tên", "Trái cây chung", "Kẹo bàn lễ tân"], xau: ["Hộp cơm có tên", "Sữa của kế toán"], muc: "Ăn đồ chung, tránh đồ có tên" },
  chung: { tot: ["Việc gấp", "Email quan trọng", "Khách quen"], xau: ["Việc của người khác"], muc: "Bắt việc của mình" },
};
function choiBat(ctx, nd) {
  const PHIM = ["KeyQ", "KeyW", "KeyE", "KeyA", "KeyS", "KeyD", "KeyZ", "KeyX", "KeyC"];
  const dai = 25, can = 13; let diem = 0, loi = 0, gio = 0, sinh = 0.4;
  const o = PHIM.map((p, i) => H("button", { class: "mg-bat-o", type: "button", onpointerdown: e => { e.preventDefault(); bam(i); } }, ctx.cham ? "" : H("kbd", {}, p.slice(3))));
  const vat = Array(9).fill(null);
  const bam = i => {
    const x = vat[i]; if (!x) return;
    vat[i] = null; x.el.remove();
    if (x.tot) { diem++; o[i].classList.add("trung"); } else { diem = Math.max(0, diem - 1); loi++; o[i].classList.add("hong"); }
    ctx.hen(() => o[i].classList.remove("trung", "hong"), 220);
    ctx.dat(`Điểm ${diem}/${can}`);
  };
  ctx.phim = e => { const k = PHIM.indexOf(e.code); if (k >= 0) { e.preventDefault(); if (!e.repeat) bam(k); } };
  ctx.san.append(H("div", { class: "mg-bat" }, H("p", { class: "mg-tieu" }, nd.muc), H("div", { class: "mg-bat-luoi" }, o)));
  ctx.dat(`Điểm 0/${can}`);
  ctx.lap(dt => {
    gio += dt; sinh -= dt;
    for (let i = 0; i < 9; i++) { const x = vat[i]; if (x && (x.con -= dt) <= 0) { x.el.remove(); vat[i] = null; } }
    if (sinh <= 0) {
      const trong = vat.map((x, i) => x ? -1 : i).filter(i => i >= 0);
      if (trong.length) {
        const i = ngau(trong), tot = Math.random() < 0.72;
        const el = H("span", { class: "mg-bat-vat " + (tot ? "tot" : "xau") }, ngau(tot ? nd.tot : nd.xau));
        o[i].append(el); vat[i] = { tot, el, con: Math.max(0.95, 1.5 - gio * 0.02) };
      }
      sinh = Math.max(0.42, 0.75 - gio * 0.012);
    }
  });
  ctx.dongHo(dai, () => diem >= can ? ctx.xong(true, diem >= can + 6 && loi === 0, `Được ${diem} điểm. Tay nhanh, mắt tinh.`) : ctx.xong(false, false, `Được ${diem}/${can} điểm. Chậm một nhịp là bay mất.`));
}

// =====================================================================
// 7. Né: đổi làn tránh chướng ngại, sống sót tới hết giờ
// =====================================================================
const NE = {
  tam: { ta: "Tuất", vat: ["Chậu nước", "Bác cầm khăn", "Vũng xà phòng"], muc: "Đừng để bị tóm đi tắm" },
  chuno: { ta: "Bạn", vat: ["Chủ nợ", "Chủ nợ", "Người đòi tiền", "Chị chủ trọ"], muc: "64 bước, 8 chủ nợ" },
  tuantra: { ta: "Bác", vat: ["Chuột", "Xô nước", "Dây điện", "Thùng giấy"], muc: "Đèn pin trong tay, đường tối trước mặt" },
  xe: { ta: "Xe đoàn", vat: ["Kẹt xe", "Ổ gà", "Xe buýt", "Đường ngập"], muc: "Luồn lách qua Đại lộ Kẹt Xe" },
  tulanh: { ta: "Tuất", vat: ["Ánh mắt kế toán", "Thư ký đi ngang", "Cửa tủ đóng"], muc: "Lẻn tới tủ lạnh, đừng để ai thấy" },
  giay: { ta: "Bạn", vat: ["Sàn ướt", "Sếp hỏi việc", "Thùng giấy", "Người đi ngược"], muc: "Mang giấy tờ, đừng làm rơi" },
  chung: { ta: "Bạn", vat: ["Việc phát sinh", "Họp đột xuất", "Sếp gọi"], muc: "Né việc phát sinh" },
};
function choiNe(ctx, nd) {
  const dai = 24, mau = 3, CAO = 11;
  let lan = 1, gio = 0, sinh = 0.8, con = mau, khien = 0;
  const vat = [];
  const san = H("div", { class: "mg-ne-san", onpointerdown: e => { e.preventDefault(); const r = san.getBoundingClientRect(); diToi(Math.min(2, Math.floor((e.clientX - r.left) / r.width * 3))); } },
    H("i", { class: "mg-ne-ke k1" }), H("i", { class: "mg-ne-ke k2" }));
  const ta = H("div", { class: "mg-ne-ta" }, nd.ta);
  san.append(ta);
  const tim = H("div", { class: "mg-ne-tim" });
  const veTim = () => tim.replaceChildren(...Array.from({ length: mau }, (_, i) => H("i", { class: i < con ? "co" : "" })));
  const diToi = l => { lan = Math.max(0, Math.min(2, l)); ta.style.left = (lan * 33.333 + 16.667) + "%"; };
  ctx.phim = e => {
    if (laPhim(e, "ArrowLeft", "KeyA")) { e.preventDefault(); diToi(lan - 1); }
    else if (laPhim(e, "ArrowRight", "KeyD")) { e.preventDefault(); diToi(lan + 1); }
  };
  ctx.san.append(H("div", { class: "mg-ne" }, H("div", { class: "mg-ne-dau" }, H("p", { class: "mg-tieu" }, nd.muc), tim), san,
    H("div", { class: "mg-ne-nut" },
      H("button", { class: "mg-nut-chon", type: "button", onpointerdown: e => { e.preventDefault(); e.stopPropagation(); diToi(lan - 1); } }, ctx.cham ? "" : H("kbd", {}, "←"), "Trái"),
      H("button", { class: "mg-nut-chon", type: "button", onpointerdown: e => { e.preventDefault(); e.stopPropagation(); diToi(lan + 1); } }, "Phải", ctx.cham ? "" : H("kbd", {}, "→")))));
  diToi(1); veTim();
  ctx.lap(dt => {
    gio += dt; sinh -= dt; khien = Math.max(0, khien - dt);
    const toc = 55 + gio * 2.2; // phần trăm chiều cao mỗi giây
    if (sinh <= 0) {
      const so = Math.random() < Math.min(0.35, gio * 0.018) ? 2 : 1;
      for (const l of tron([0, 1, 2]).slice(0, so)) {
        const el = H("div", { class: "mg-ne-vat" }, ngau(nd.vat)); el.style.left = (l * 33.333 + 2) + "%"; san.append(el);
        vat.push({ l, y: -CAO, el });
      }
      sinh = Math.max(0.5, 1.0 - gio * 0.02);
    }
    for (let i = vat.length - 1; i >= 0; i--) {
      const v = vat[i]; v.y += toc * dt; v.el.style.top = v.y + "%";
      if (v.l === lan && v.y + CAO > 84 && v.y < 96 && !khien) {
        con--; khien = 0.9; veTim(); v.el.remove(); vat.splice(i, 1); ta.classList.add("trung"); ctx.hen(() => ta.classList.remove("trung"), 500);
        if (con <= 0) return ctx.xong(false, false, `Trụ được ${Math.floor(gio)} giây rồi bị tóm.`);
      } else if (v.y > 104) { v.el.remove(); vat.splice(i, 1); }
    }
    ta.classList.toggle("khien", khien > 0);
    ctx.dat(`Trụ ${Math.floor(gio)}/${dai} giây`);
  });
  ctx.dongHo(dai, () => ctx.xong(true, con === mau, con === mau ? "Không dính một lần nào. Trơn như vũng xà phòng." : `Thoát được, còn ${con}/${mau} mạng.`));
}

// =====================================================================
// 8. Bấm liên tục: đẩy thanh lên đầy trước khi hết giờ
// =====================================================================
const DAP = {
  dam: { nut: "Đấm", muc: "Đấm bao cát tới khi đèn đỏ" }, render: { nut: "Render", muc: "Ép máy render nhanh hơn máy bên kia" },
  pha: { nut: "Lắc bình", muc: "Pha cho kịp hàng khách giờ cao điểm" }, tam: { nut: "Kỳ cọ", muc: "Kỳ sạch trước khi Tuất kịp chạy" },
  day: { nut: "Đẩy", muc: "Đẩy xe chết máy lên dốc" }, chung: { nut: "Bấm", muc: "Dồn sức cho xong việc" },
};
function choiDap(ctx, nd) {
  const dai = 14, moi = 0.028, giam = 0.06; let muc = 0, gio = 0, so = 0;
  const vach = H("i"), so_ = H("b", {}, "0%");
  const nut = H("button", { class: "mg-nut-lon tron", type: "button", onpointerdown: e => { e.preventDefault(); bam(); } }, nd.nut);
  const bam = () => {
    muc = Math.min(1, muc + moi); so++; bamLai(nut);
    if (muc >= 1) { vach.style.width = "100%"; so_.textContent = "100%"; ctx.xong(true, gio < 9, `Đầy thanh sau ${gio.toFixed(1)} giây, ${so} lần bấm.`); }
  };
  ctx.phim = e => { if (laPhim(e, "Space", "Enter")) { e.preventDefault(); if (!e.repeat) bam(); } };
  ctx.san.append(H("div", { class: "mg-dap" }, H("p", { class: "mg-tieu" }, nd.muc), H("div", { class: "mg-dap-thanh" }, vach, so_), nut,
    H("p", { class: "mg-meo" }, ctx.cham ? "Chạm liên tục" : "Bấm phím Cách liên tục")));
  ctx.lap(dt => {
    gio += dt; muc = Math.max(0, muc - giam * dt * (0.6 + muc));
    vach.style.width = muc * 100 + "%"; so_.textContent = Math.floor(muc * 100) + "%";
  });
  ctx.dat("Đẩy thanh lên 100%");
  ctx.dongHo(dai, () => ctx.xong(false, false, `Mới được ${Math.floor(muc * 100)}%. Hụt hơi ở chặng cuối.`));
}

// =====================================================================
// 9. Tìm lỗi: bấm vào các dòng sai
// =====================================================================
const LOI = {
  phude: [["Siêu Nhân Hồng", "Siêu Nhân Hông"], ["màu hồng", "mầu hồng"], ["chuối chiên", "chuối chiêng"], ["xin chào khán giả", "xin chào khán giã"],
    ["cảm ơn mọi người", "cảm ơn mọi ngừoi"], ["hẹn gặp lại", "hẹn gặp lạy"], ["thứ Bảy này", "thứ Bãy này"], ["Quận Hóng", "Quận Hống"],
    ["đi giúp người", "đi giúp ngừơi"], ["công viên", "công viêng"], ["nước tăng lực", "nước tăng lựt"], ["bộ đồ mới", "bộ đồ mớ"], ["tập tiếp nhé", "tập tiếp nhẽ"], ["đúng giờ", "đúng dờ"]],
  hoadon: [["Cà phê: 35.000đ", "Cà phê: 3.500.000đ"], ["Taxi: 120.000đ", "Taxi: -120.000đ"], ["Ngày 12/10/2026", "Ngày 32/10/2026"], ["Bánh mì: 25.000đ", "Bánh mì x 400 ổ"],
    ["In ấn: 80.000đ", "In ấn: 80.000.000đ"], ["Giấy A4: 2 ram", "Giấy A4: 2 tấn"], ["Nước suối: 1 thùng", "Nước suối: 1 thùng (xe hơi)"], ["Mực in: 1 hộp", "Mực in: 1 hộp (tại Paris)"],
    ["Có chữ ký người nhận", "Chữ ký: (để trống)"], ["Trà đá: 10.000đ", "Trà đá: 1 cây vàng"], ["Gửi xe: 5.000đ", "Gửi xe: 5.000 USD"], ["Băng keo: 3 cuộn", "Băng keo: 3 tấn"], ["Bút bi: 1 hộp", "Bút bi: 1 container"], ["Xăng xe: 200.000đ", "Xăng xe: 200 lít/ngày"]],
  hoso: [["Ngày sinh: 12/05/1999", "Ngày sinh: 31/02/1999"], ["Ảnh 3x4: có", "Ảnh 3x4: ảnh mèo"], ["Chiều cao: 1m65", "Chiều cao: 3m65"], ["Số điện thoại: 10 số", "Số điện thoại: 4 số"],
    ["Tốt nghiệp: 2021", "Tốt nghiệp: 2031"], ["Huyết áp: bình thường", "Huyết áp: 0/0"], ["Kinh nghiệm: 2 năm", "Kinh nghiệm: 45 năm, tuổi 23"], ["Quê quán: Phố Cũ", "Quê quán: Sao Hỏa"],
    ["Chữ ký: có", "Chữ ký: hình trái tim"], ["Giới tính: Nữ", "Giới tính: Thứ Hai"], ["Cân nặng: 55kg", "Cân nặng: 5kg"], ["Mắt: 10/10", "Mắt: 15/10"], ["Đóng dấu: đỏ", "Đóng dấu: bút chì"], ["Họ tên: Lê Thị Na", "Họ tên: (bỏ trống)"]],
  kehoach: [["Ngày diễn: 15/10", "Ngày diễn: 15/13"], ["Màu chủ đạo: hồng", "Màu chủ đạo: xám tro"], ["Ngân sách: 120 triệu", "Ngân sách: 120 tỷ"], ["Khách mời: 300 người", "Khách mời: 3 người"],
    ["Sân khấu: 8m x 6m", "Sân khấu: 8km x 6km"], ["Giờ mở cửa: 18:00", "Giờ mở cửa: 25:00"], ["Lối thoát hiểm: 2 cửa", "Lối thoát hiểm: 0 cửa"], ["Âm thanh: 4 loa", "Âm thanh: 0 loa"],
    ["MC: 1 người", "MC: chưa có, tự lo"], ["Bảo vệ: 6 người", "Bảo vệ: Tuất"], ["Địa điểm: Sân Nhà 45", "Địa điểm: chưa biết"], ["Thời lượng: 90 phút", "Thời lượng: 9 tiếng"], ["Đèn: 12 bộ", "Đèn: 12 cây nến"], ["Nước uống: 20 thùng", "Nước uống: 2 chai"]],
  baocao: [["Lượt xem: 12.400", "Lượt xem: -200"], ["Tăng trưởng: 8%", "Tăng trưởng: 800%"], ["Người theo dõi: 5.100", "Người theo dõi: user123 x 1000"], ["Doanh thu tháng 9", "Doanh thu tháng 13"],
    ["Tương tác: 4,2%", "Tương tác: 142%"], ["Bình luận: 320", "Bình luận: 320 (cùng 1 người)"], ["Chia sẻ: 85", "Chia sẻ: 85 (lúc 3 giờ sáng)"], ["Chi phí: 2 triệu", "Chi phí: ô trống"],
    ["Tổng: 38 triệu", "Tổng: 38 triệu (dòng trùng)"], ["Khách mới: 46", "Khách mới: 46.000.000"], ["Tỷ lệ chốt: 12%", "Tỷ lệ chốt: 112%"], ["Ngày: 30/09", "Ngày: 31/09"], ["KPI: đạt 92%", "KPI: đạt -5%"], ["Nguồn: quảng cáo", "Nguồn: không rõ"]],
};
LOI.chung = LOI.hoadon;
function choiLoi(ctx, nd) {
  const vong = 2, moiVong = 3, choSai = 3, giay = 40; let v = 0, tim = 0, sai = 0;
  const luoi = H("div", { class: "mg-loi-luoi" });
  const bao = H("p", { class: "mg-tieu" });
  const choiVong = () => {
    const ds = tron(nd).slice(0, 12), loiI = new Set(tron([...ds.keys()]).slice(0, moiVong)); tim = 0;
    bao.textContent = `Vòng ${v + 1}/${vong}: tìm ${moiVong} dòng sai`;
    luoi.replaceChildren(...ds.map((cap, i) => {
      const laLoi = loiI.has(i);
      const nut = H("button", { class: "mg-loi-o", type: "button", onclick: () => {
        if (nut.disabled) return;
        if (laLoi) { nut.disabled = true; nut.classList.add("dung"); tim++; if (tim >= moiVong) { v++; v >= vong ? ctx.xong(true, sai === 0, `Bắt đủ ${vong * moiVong} lỗi, ${sai} lần bấm nhầm.`) : ctx.hen(choiVong, 600); } }
        else { sai++; bamLai(nut); nut.classList.add("sai"); if (sai >= choSai) ctx.xong(false, false, `Bấm nhầm ${sai} lần vào dòng đúng. Mắt mỏi rồi.`); }
        ctx.dat(`Lỗi tìm được ${v * moiVong + tim}/${vong * moiVong} · nhầm ${sai}/${choSai}`);
      } }, laLoi ? cap[1] : cap[0]);
      return nut;
    }));
  };
  ctx.san.append(H("div", { class: "mg-loi" }, bao, luoi));
  ctx.dat(`Lỗi tìm được 0/${vong * moiVong} · nhầm 0/${choSai}`);
  choiVong();
  ctx.dongHo(giay, () => ctx.xong(false, false, `Hết giờ, mới bắt được ${v * moiVong + tim}/${vong * moiVong} lỗi.`));
}

// =====================================================================
// 10. Tính nhanh: chọn đáp án đúng trong 3 lựa chọn
// =====================================================================
const TINH = {
  ngansach: [
    () => { const a = soNgau(4, 18), b = soNgau(3, 15); return [`Loa ${a} triệu + đèn ${b} triệu`, a + b, " triệu", 2]; },
    () => { const t = soNgau(30, 60), a = soNgau(5, 20); return [`Ngân sách ${t} triệu, đã chi ${a} triệu. Còn lại?`, t - a, " triệu", 3]; },
    () => { const n = soNgau(3, 9), g = soNgau(2, 6); return [`${n} bộ đèn, mỗi bộ ${g} triệu`, n * g, " triệu", g]; },
    () => { const n = soNgau(12, 25), g = ngau([50, 100, 150]); return [`Góp sinh nhật: ${n} người x ${g} nghìn`, n * g, " nghìn", g]; },
  ],
  chart: [
    () => { const a = soNgau(5, 20) * 20, p = ngau([10, 20, 25, 50]); return [`Lượt xem ${a}, tăng ${p}%. Tuần sau?`, a + a * p / 100, "", a * 0.1]; },
    () => { const a = soNgau(20, 60), b = soNgau(5, 25); return [`Mua giá ${a}, bán giá ${a + b}. Lãi mỗi cổ?`, b, " nghìn", 3]; },
    () => { const a = soNgau(2, 9) * 100, b = soNgau(1, 5) * 100; return [`Tháng trước ${a} khách, tháng này thêm ${b}`, a + b, " khách", 100]; },
    () => { const n = soNgau(3, 8), g = soNgau(12, 30); return [`${n} cổ phiếu, giá ${g} nghìn mỗi cổ`, n * g, " nghìn", g > 20 ? 10 : 5]; },
  ],
  luong: [
    () => { const l = soNgau(8, 15), u = soNgau(1, 4); return [`Lương ${l} triệu, đã ứng ${u} triệu. Còn nhận?`, l - u, " triệu", 1]; },
    () => { const n = soNgau(3, 6), l = soNgau(7, 12); return [`${n} người, mỗi người ${l} triệu. Đợt này chuyển?`, n * l, " triệu", l > 9 ? 10 : 5]; },
    () => { const c = soNgau(4, 10), g = ngau([100, 150, 200]); return [`Tăng ca ${c} buổi, mỗi buổi ${g} nghìn`, c * g, " nghìn", g / 2]; },
    () => { const l = soNgau(9, 14), p = ngau([1, 2]); return [`Lương ${l} triệu, phạt đi trễ ${p * 100} nghìn. Còn?`, l * 1000 - p * 100, " nghìn", 100]; },
  ],
  cho: [
    () => { const kg = soNgau(2, 5), g = ngau([80, 120, 150, 180]); return [`${kg} ký tôm, ${g} nghìn một ký`, kg * g, " nghìn", 20]; },
    () => { const a = soNgau(40, 90), b = soNgau(5, 20); return [`Giá ${a} nghìn, mặc cả bớt ${b}`, a - b, " nghìn", 5]; },
    () => { const t = ngau([200, 300, 500]), c = soNgau(6, 18) * 10; return [`Đưa ${t} nghìn, mua hết ${c} nghìn. Thối lại?`, t - c, " nghìn", 10]; },
    () => { const n = soNgau(3, 8), g = ngau([15, 25, 35]); return [`${n} bó rau, ${g} nghìn một bó`, n * g, " nghìn", 10]; },
  ],
  demtien: [
    () => { const a = soNgau(1, 5), b = soNgau(1, 6); return [`${a} tờ 50 nghìn + ${b} tờ 20 nghìn`, a * 50 + b * 20, " nghìn", 10]; },
    () => { const a = soNgau(2, 8), b = soNgau(1, 5); return [`${a} tờ 10 nghìn + ${b} tờ 100 nghìn`, a * 10 + b * 100, " nghìn", 10]; },
    () => { const n = soNgau(5, 14); return [`Phạt đi trễ ${n} lần, 20 nghìn mỗi lần`, n * 20, " nghìn", 20]; },
    () => { const a = soNgau(3, 9), b = soNgau(2, 8); return [`${a} tờ 5 nghìn + ${b} tờ 2 nghìn`, a * 5 + b * 2, " nghìn", 2]; },
  ],
  chia: [
    () => { const n = ngau([4, 5, 6, 8]), k = n * soNgau(2, 5); return [`${k} cái nem chia đều ${n} người`, k / n, " cái", 1]; },
    () => { const c = soNgau(20, 40), a = soNgau(3, 12); return [`Có ${c} hộp sữa, đã mất ${a}. Còn?`, c - a, " hộp", 2]; },
    () => { const b = soNgau(3, 6); return [`${b} cái pizza, mỗi cái 8 miếng`, b * 8, " miếng", 2]; },
    () => { const n = soNgau(18, 23), d = soNgau(2, 6); return [`${n} người, ${d} người ăn chay. Suất mặn?`, n - d, " suất", 1]; },
  ],
};
TINH.chung = TINH.cho;
function choiTinh(ctx, nd) {
  const tong = 8, can = 6; let i = 0, dung = 0, khoa = false;
  const cau = H("div", { class: "mg-tinh-cau" }), dap = H("div", { class: "mg-tinh-dap" });
  let hienTai = null;
  const taoCau = () => {
    const [chu, kq, dv, buoc] = ngau(nd)(); const b = Math.max(1, Math.round(buoc));
    const nhieu = new Set([kq]);
    for (const d of tron([-2, -1, 1, 2])) { if (nhieu.size >= 3) break; const x = kq + d * b; if (x > 0) nhieu.add(x); }
    hienTai = { kq, lc: tron([...nhieu]) };
    cau.textContent = chu; bamLai(cau);
    dap.replaceChildren(...hienTai.lc.map((x, k) => H("button", { class: "mg-tinh-nut", type: "button", onclick: () => chon(k) }, ctx.cham ? "" : H("kbd", {}, String(k + 1)), so(x) + dv)));
    ctx.dat(`Câu ${i + 1}/${tong} · đúng ${dung}`);
  };
  const chon = k => {
    if (khoa || !hienTai.lc[k]) return; khoa = true;
    const ok = hienTai.lc[k] === hienTai.kq; if (ok) dung++;
    dap.children[k].classList.add(ok ? "dung" : "sai");
    if (!ok) dap.children[hienTai.lc.indexOf(hienTai.kq)].classList.add("dung");
    ctx.hen(() => {
      i++; khoa = false;
      if (i - dung > tong - can) return ctx.xong(false, false, `Đúng ${dung}/${tong}. Máy tính bỏ túi đâu rồi.`);
      if (i >= tong) return ctx.xong(true, dung === tong, `Đúng ${dung}/${tong}. Sổ sách khớp từng đồng.`);
      taoCau();
    }, ok ? 350 : 700);
  };
  ctx.phim = e => { const k = ["Digit1", "Digit2", "Digit3"].indexOf(e.code); if (k >= 0) { e.preventDefault(); if (!e.repeat) chon(k); } };
  ctx.san.append(H("div", { class: "mg-tinh" }, cau, dap));
  taoCau();
  ctx.dongHo(45, () => ctx.xong(dung >= can, false, `Hết giờ. Đúng ${dung}/${tong}.`));
}

// =====================================================================
// 11. Xếp thứ tự: bấm theo thứ tự từ nhỏ tới lớn
// =====================================================================
const XEP = {
  lich: { kieu: "gio", huong: "Sớm trước, muộn sau", ten: ["Họp 5 phút", "Quay clip", "Gặp đối tác", "Đánh golf", "Duyệt poster", "Ăn trưa", "Gọi ngân hàng", "Studio", "Xe đoàn tới", "Họp giao ban"] },
  xe: { kieu: "gio", huong: "Xe tới trước xếp trước", ten: ["Xe giám đốc", "Xe kế toán", "Xe hồng", "Xe thực tập", "Xe to nhất", "Xe trưởng phòng", "Xe editor", "Xe shipper"] },
  phong: { kieu: "so", huong: "Số nhỏ trước, số lớn sau", ten: ["Phòng", "Ghế", "Bàn", "Ô", "Vị trí"] },
  hoso: { kieu: "nam", huong: "Năm cũ trước, năm mới sau", ten: ["Hóa đơn", "Bảng lương", "Tờ khai thuế", "Hợp đồng", "Sổ quỹ", "Biên bản"] },
  sac: { kieu: "pin", huong: "Máy yếu pin nhất sạc trước", ten: ["Máy trái", "Máy phải", "Máy bàn", "Máy livestream", "Máy dự phòng", "Máy của sếp"] },
  bantin: { kieu: "ngay", huong: "Tin cũ trước, tin mới sau", ten: ["Sinh nhật", "Họp giao ban", "Mất hộp cơm", "Máy in hỏng", "Khách tới", "Tuất được tắm", "Liveshow"] },
};
XEP.chung = XEP.lich;
const nhanXep = (kieu, x) => kieu === "gio" ? `${String(Math.floor(x / 60)).padStart(2, "0")}:${String(x % 60).padStart(2, "0")}` : kieu === "nam" ? String(x) : kieu === "pin" ? x + "%" : kieu === "ngay" ? `${x}/10` : "Số " + x;
const giaXep = kieu => kieu === "gio" ? soNgau(7 * 4, 21 * 4) * 15 : kieu === "nam" ? soNgau(2016, 2026) : kieu === "pin" ? soNgau(1, 19) * 5 : kieu === "ngay" ? soNgau(1, 31) : soNgau(1, 40);
function choiXep(ctx, nd) {
  const vong = [4, 5, 5], choSai = 3; let v = 0, sai = 0, buoc = 0, thuTu = [];
  const luoi = H("div", { class: "mg-xep-luoi" }), bao = H("p", { class: "mg-tieu" });
  const choiVong = () => {
    const n = vong[v], gia = new Set(); while (gia.size < n) gia.add(giaXep(nd.kieu));
    const ds = tron([...gia]).map(g => ({ g, ten: ngau(nd.ten) }));
    thuTu = [...ds].sort((a, b) => a.g - b.g); buoc = 0;
    bao.textContent = `Vòng ${v + 1}/${vong.length}: ${nd.huong}`;
    luoi.replaceChildren(...ds.map(x => {
      const nut = H("button", { class: "mg-xep-o", type: "button", onclick: () => {
        if (nut.disabled) return;
        if (thuTu[buoc] === x) {
          nut.disabled = true; nut.classList.add("dung"); nut.dataset.thu = ++buoc;
          if (buoc >= thuTu.length) { v++; v >= vong.length ? ctx.xong(true, sai === 0, `Xếp xong ${vong.length} vòng, ${sai} lần nhầm.`) : ctx.hen(choiVong, 550); }
        } else { sai++; bamLai(nut); if (sai >= choSai) ctx.xong(false, false, `Nhầm thứ tự ${sai} lần. Lịch chồng lên nhau đỏ rực.`); }
        ctx.dat(`Nhầm ${sai}/${choSai}`);
      } }, H("b", {}, nhanXep(nd.kieu, x.g)), H("span", {}, x.ten));
      return nut;
    }));
  };
  ctx.san.append(H("div", { class: "mg-xep" }, bao, luoi));
  ctx.dat(`Nhầm 0/${choSai}`);
  choiVong();
  ctx.dongHo(40, () => ctx.xong(false, false, `Hết giờ ở vòng ${v + 1}/${vong.length}.`));
}

// =====================================================================
// 12. Ngắm và lực: golf, bida, sút bóng
// =====================================================================
const NGAM = {
  golf: { nen: "#2f6b3a", vien: "#245a2f", dich: "Lỗ", bong: "#ffffff", muc: "Đưa bóng vào lỗ, đừng để đối tác cười" },
  bida: { nen: "#1d5c4a", vien: "#5a3a22", dich: "Lỗ", bong: "#f4efe6", muc: "Đánh bi vào lỗ, thua mất chai nước ngọt" },
  bong: { nen: "#3b7a3a", vien: "#2d5f2c", dich: "Gôn", bong: "#ffffff", muc: "Sút tung lưới đội Marketing" },
};
NGAM.chung = NGAM.golf;
function choiNgam(ctx, nd) {
  const luot = 4, can = 2; let lan = 0, vao = 0, pha = "goc", goc = 0, gocHuong = 1, luc = 0, lucHuong = 1, bay = null, dich = null;
  const cv = H("canvas", { class: "mg-ngam-cv" });
  const nut = H("button", { class: "mg-nut-lon", type: "button", onpointerdown: e => { e.preventDefault(); bam(); } }, "Chốt hướng");
  const cham = H("div", { class: "mg-cham-dem to" }, Array.from({ length: luot }, () => H("i")));
  const g = cv.getContext("2d");
  const datDich = () => { dich = { a: khoang(-0.38, 0.38), d: khoang(0.5, 0.85) }; };
  const bam = () => {
    if (pha === "goc") { pha = "luc"; luc = 0; lucHuong = 1; nut.textContent = "Chốt lực"; }
    else if (pha === "luc") { pha = "bay"; bay = { t: 0 }; nut.disabled = true; }
  };
  ctx.phim = e => { if (laPhim(e, "Space", "Enter")) { e.preventDefault(); if (!e.repeat) bam(); } };
  ctx.san.append(H("div", { class: "mg-ngam" }, H("p", { class: "mg-tieu" }, nd.muc), cv, H("div", { class: "mg-ngam-chan" }, cham, nut)));
  datDich(); ctx.dat(`Cú ${lan + 1}/${luot} · vào ${vao}/${can}`);
  const ve = () => {
    const r = cv.getBoundingClientRect(), tl = Math.min(2, devicePixelRatio || 1);
    if (cv.width !== Math.round(r.width * tl) || cv.height !== Math.round(r.height * tl)) { cv.width = Math.round(r.width * tl); cv.height = Math.round(r.height * tl); }
    const W = cv.width, Hh = cv.height, ox = W / 2, oy = Hh * 0.9, R = Math.min(Hh * 0.82, W * 0.78);
    g.fillStyle = nd.vien; g.fillRect(0, 0, W, Hh); g.fillStyle = nd.nen; g.fillRect(W * 0.03, Hh * 0.03, W * 0.94, Hh * 0.94);
    const viTri = (a, d) => [ox + Math.sin(a) * d * R, oy - Math.cos(a) * d * R];
    const [dx, dy] = viTri(dich.a, dich.d), rd = 0.11 * R;
    g.fillStyle = "rgba(0,0,0,.55)"; g.beginPath(); g.arc(dx, dy, rd * 0.55, 0, 7); g.fill();
    g.strokeStyle = "rgba(255,255,255,.35)"; g.lineWidth = 2 * tl; g.beginPath(); g.arc(dx, dy, rd, 0, 7); g.stroke();
    g.fillStyle = "#e8702a"; g.font = `700 ${13 * tl}px system-ui, sans-serif`; g.textAlign = "center"; g.fillText(nd.dich, dx, dy - rd - 6 * tl);
    let bx = ox, by = oy;
    if (pha === "bay" || pha === "cho") { const p = Math.min(1, bay.t / 0.9), e = 1 - (1 - p) ** 3;[bx, by] = viTri(goc, luc * e); }
    if (pha === "goc" || pha === "luc") {
      const [ax, ay] = viTri(goc, 0.32);
      g.strokeStyle = "rgba(255,255,255,.85)"; g.lineWidth = 3 * tl; g.setLineDash([8 * tl, 6 * tl]); g.beginPath(); g.moveTo(ox, oy); g.lineTo(ax, ay); g.stroke(); g.setLineDash([]);
    }
    if (pha === "luc") {
      const bw = W * 0.05, bh = Hh * 0.5, bx0 = W * 0.9 - bw, by0 = Hh * 0.2;
      g.fillStyle = "rgba(0,0,0,.4)"; g.fillRect(bx0, by0, bw, bh);
      g.fillStyle = "#e8702a"; g.fillRect(bx0, by0 + bh * (1 - luc), bw, bh * luc);
      g.fillStyle = "rgba(255,255,255,.8)"; g.fillRect(bx0 - 4 * tl, by0 + bh * (1 - dich.d) - tl, bw + 8 * tl, 2 * tl);
    }
    g.fillStyle = nd.bong; g.beginPath(); g.arc(bx, by, 7 * tl, 0, 7); g.fill();
  };
  ctx.lap(dt => {
    if (pha === "goc") { goc += gocHuong * 0.85 * dt; if (Math.abs(goc) > 0.62) { goc = Math.sign(goc) * 0.62; gocHuong *= -1; } }
    else if (pha === "luc") { luc += lucHuong * 0.75 * dt; if (luc >= 1) { luc = 1; lucHuong = -1; } else if (luc <= 0.05) { luc = 0.05; lucHuong = 1; } }
    else if (pha === "bay") {
      bay.t += dt;
      if (bay.t >= 0.9) {
        pha = "cho"; lan++;
        const x1 = Math.sin(goc) * luc, y1 = Math.cos(goc) * luc, x2 = Math.sin(dich.a) * dich.d, y2 = Math.cos(dich.a) * dich.d;
        const ok = Math.hypot(x1 - x2, y1 - y2) <= 0.11; if (ok) vao++;
        cham.children[lan - 1].className = ok ? "co" : "hong";
        ctx.dat(`${ok ? "Vào" : "Trượt"} · vào ${vao}/${can}`);
        if (vao >= can) return ctx.xong(true, vao === lan, `Vào ${vao}/${lan} cú. Đối tác vỗ tay, không biết thật hay giả.`);
        if (lan >= luot || luot - lan < can - vao) return ctx.xong(false, false, `Chỉ vào ${vao}/${luot} cú. Gió hôm nay hơi lạ.`);
        ctx.hen(() => { pha = "goc"; goc = 0; datDich(); nut.disabled = false; nut.textContent = "Chốt hướng"; ctx.dat(`Cú ${lan + 1}/${luot} · vào ${vao}/${can}`); }, 800);
      }
    }
    ve();
  });
  ctx.dongHo(45, () => ctx.xong(vao >= can, false, `Hết giờ. Vào ${vao}/${can} cú.`));
}

// ---------- Danh sách kiểu chơi ----------
const KIEU = {
  go: { chay: choiGo, nd: GO, hd: "Gõ đúng cụm từ hiện ra. Gõ không dấu cũng được." },
  canh: { chay: choiCanh, nd: CANH, hd: "Bấm khi kim nằm trong vùng sáng. Trúng 3 trong 5 lần." },
  nhip: { chay: choiNhip, nd: NHIP, hd: "Bấm đúng làn khi nốt chạm vạch. Trúng 60% là qua." },
  chon: { chay: choiChon, nd: CHON, hd: "Mỗi thẻ chọn một bên trước khi hết giờ. Đúng 6 trong 8 thẻ." },
  nho: { chay: choiNho, nd: NHO, hd: "Xem chuỗi sáng lên rồi bấm lại đúng thứ tự. Qua 3 vòng." },
  bat: { chay: choiBat, nd: BAT, hd: "Bấm thứ màu cam ngay khi hiện ra, tránh thứ màu xám." },
  ne: { chay: choiNe, nd: NE, hd: "Đổi làn để né. Trụ hết giờ với ít nhất một mạng." },
  dap: { chay: choiDap, nd: DAP, hd: "Bấm thật nhanh để đẩy thanh lên đầy trước khi hết giờ." },
  loi: { chay: choiLoi, nd: LOI, hd: "Bấm vào các dòng sai. Nhầm 3 lần là thua." },
  tinh: { chay: choiTinh, nd: TINH, hd: "Tính nhanh, chọn đáp án đúng. Đúng 6 trong 8 câu." },
  xep: { chay: choiXep, nd: XEP, hd: "Bấm các ô theo đúng thứ tự. Nhầm 3 lần là thua." },
  ngam: { chay: choiNgam, nd: NGAM, hd: "Chốt hướng, rồi chốt lực khớp vạch trắng. Vào 2 trong 4 cú." },
};
const PHIM_HD = {
  go: "Bàn phím", canh: "Cách / Enter", nhip: "D F J K", chon: "← →", nho: "1 2 3 4", bat: "Q W E / A S D / Z X C",
  ne: "← →", dap: "Cách", loi: "Chuột", tinh: "1 2 3", xep: "Chuột", ngam: "Cách / Enter",
};

// ---------- Chọn cảnh kết quả ----------
function chonKetQua(ra, thang, xuatSac) {
  const tim = re => ra.find(n => re.test(n));
  if (thang) return (xuatSac && tim(XUAT_SAC)) || tim(THANG) || ra.find(n => !THUA.test(n)) || ra[0];
  return tim(THUA) || ra.find(n => !THANG.test(n) && !XUAT_SAC.test(n)) || ra[ra.length - 1];
}

// =====================================================================
// Khung chung: giới thiệu, đếm ngược, chơi, kết quả
// =====================================================================
export function choiMinigame({ base, ra, vai, khung, h } = {}) {
  H = typeof h === "function" ? h : tao;
  const { kieu, goi } = chonKieu(base || "");
  const K = KIEU[kieu];
  const nd = K.nd[goi] || K.nd.chung;
  const cham = matchMedia("(pointer: coarse)").matches;
  const ten = tenMinigame(base || "");
  try { document.exitPointerLock?.(); } catch { /* bỏ qua */ }

  return new Promise(resolve => {
    let hetHan = [], vongLap = [], raf = 0, dongHo = null, xongRoi = false, daDong = false, tLuc = 0;
    const ctx = { cham, phim: null, vai };

    // Giao diện khung
    const thoiGian = H("span", { class: "mg-gio" });
    const vachGio = H("i");
    const san = H("div", { class: "mg-san" });
    const chan = H("div", { class: "mg-chan", "aria-live": "polite" });
    const boQua = H("button", { class: "mg-bo-qua", type: "button", onclick: () => ketThuc(chonKetQua(ra, false, false)) }, "Bỏ qua");
    const hop = H("div", { class: "mg-hop", role: "dialog", "aria-modal": "true", "aria-label": ten },
      H("div", { class: "mg-dau" },
        H("div", { class: "mg-ten" }, H("small", {}, "Minigame"), H("b", {}, ten), H("p", {}, K.hd)),
        H("div", { class: "mg-dau-phai" }, thoiGian, boQua)),
      H("div", { class: "mg-thanh-gio" }, vachGio), san, chan);
    const goc = H("div", { class: "mg" }, hop);
    const chan_ = e => e.stopPropagation();
    for (const ev of ["pointerdown", "pointermove", "pointerup", "touchstart", "touchmove", "touchend", "mousedown", "mouseup", "mousemove", "wheel", "click", "dblclick", "contextmenu"])
      goc.addEventListener(ev, chan_);

    // Chặn phím tới game 3D, chuyển cho minigame
    const nhanPhim = e => {
      e.stopPropagation();
      if (e.target instanceof HTMLInputElement) return;
      if (e.type === "keydown") ctx.phim?.(e);
      else if (laPhim(e, "Space") && e.target instanceof HTMLButtonElement) e.preventDefault();
    };
    addEventListener("keydown", nhanPhim, true);
    addEventListener("keyup", nhanPhim, true);
    addEventListener("keypress", chan_, true);

    // Vòng lặp khung hình chung
    const chay = t => {
      const that = (t - (tLuc || t)) / 1000, dt = Math.min(0.1, that); tLuc = t;
      if (dongHo) {
        dongHo.con -= Math.min(0.5, that);
        vachGio.style.width = Math.max(0, dongHo.con / dongHo.tong) * 100 + "%";
        thoiGian.textContent = Math.max(0, Math.ceil(dongHo.con)) + " giây";
        if (dongHo.con <= 0) { const f = dongHo.het; dongHo = null; f(); }
      }
      for (const f of [...vongLap]) { if (xongRoi) break; f(dt); }
      raf = requestAnimationFrame(chay);
    };
    raf = requestAnimationFrame(chay);

    ctx.san = san;
    ctx.dat = s => { chan.textContent = s; };
    ctx.hen = (f, ms) => { const id = setTimeout(() => { if (!daDong) f(); }, ms); hetHan.push(id); return id; };
    ctx.lap = f => { vongLap.push(f); };
    ctx.dongHo = (giay, het) => { dongHo = { con: giay, tong: giay, het }; };
    ctx.conLai = () => dongHo ? dongHo.con : 0;
    const dungChoi = () => { vongLap = []; dongHo = null; ctx.phim = null; hetHan.forEach(clearTimeout); hetHan = []; };
    ctx.xong = (thang, xuatSac, loiNhan) => {
      if (xongRoi) return; xongRoi = true; dungChoi();
      setTimeout(() => !daDong && hienKetQua(thang, xuatSac, loiNhan), 450);
    };

    const ketThuc = ten => {
      if (daDong) return; daDong = true; dungChoi();
      cancelAnimationFrame(raf);
      removeEventListener("keydown", nhanPhim, true);
      removeEventListener("keyup", nhanPhim, true);
      removeEventListener("keypress", chan_, true);
      goc.remove();
      resolve(ten);
    };

    const hienKetQua = (thang, xuatSac, loiNhan) => {
      boQua.hidden = true; thoiGian.textContent = ""; vachGio.style.width = "0";
      chan.textContent = "";
      // Chờ một nhịp để cú bấm dồn dập cuối trận không lỡ tay bỏ qua màn kết quả
      const tKq = performance.now();
      const tiep = H("button", { class: "mg-nut-lon", type: "button", onclick: () => { if (performance.now() - tKq > 700) ketThuc(chonKetQua(ra, thang, xuatSac)); } }, "Tiếp tục");
      san.replaceChildren(H("div", { class: "mg-ket " + (thang ? "thang" : "thua") },
        H("small", {}, thang ? (xuatSac ? "Xuất sắc" : "Hoàn thành") : "Chưa đạt"),
        H("b", {}, thang ? "Thành công" : "Thất bại"),
        H("p", {}, loiNhan || (thang ? "Gọn gàng, đúng giờ." : "Lần sau sẽ khác.")), tiep));
      ctx.phim = e => { if (laPhim(e, "Enter", "Space")) { e.preventDefault(); tiep.click(); } };
      tiep.focus({ preventScroll: true });
    };

    const demNguoc = () => {
      let n = 3; const so_ = H("div", { class: "mg-dem" }, "3");
      san.replaceChildren(so_); ctx.phim = null;
      const buoc = () => {
        if (--n <= 0) { san.replaceChildren(); K.chay(ctx, nd); return; }
        so_.textContent = String(n); bamLai(so_); ctx.hen(buoc, 650);
      };
      bamLai(so_); ctx.hen(buoc, 650);
    };

    // Màn giới thiệu
    const batDau = H("button", { class: "mg-nut-lon", type: "button", onclick: () => demNguoc() }, "Bắt đầu");
    san.append(H("div", { class: "mg-gioi-thieu" },
      H("b", {}, ten),
      cham ? null : H("p", { class: "mg-meo" }, "Điều khiển: ", H("kbd", {}, PHIM_HD[kieu])),
      batDau));
    ctx.phim = e => { if (laPhim(e, "Enter", "Space")) { e.preventDefault(); demNguoc(); } };
    ctx.dat("Sẵn sàng thì bấm Bắt đầu");

    (khung || document.body).append(goc);
    batDau.focus({ preventScroll: true });
  });
}

// Dùng cho trang thử: liệt kê kiểu chơi
export const KIEU_CHOI = Object.keys(KIEU);
export { chonKieu as _chonKieu };
