// Chỉ số và cờ riêng của Siêu Nhân Hồng (tiền tố snh_)

// ---------- 4 chỉ số riêng ----------
VAR snh_lo_mat = 0          // 🎭 Độ Lộ Mặt (0..100). Đầy 100: mặt thật bị lộ
VAR snh_lo_tien = 10        // 💸 Độ Lộ Tiền (0..100). Đầy 100: kết thúc "Cây ATM Hồng"
VAR snh_tim_hong = 10       // 💗 Tim Hồng: Vũ quý Nguyên tới đâu (0..100). Vũ chỉ coi Nguyên là bạn, mọi cử chỉ vẫn là PR
VAR snh_no_xom_cu = 70      // 🩹 Món Nợ Xóm Cũ (0..100)

// ---------- Hai cái ví ----------
VAR snh_vi_cat_xe = 0       // 👛 Ví Cát-xê (đồng). Két Vé Số thì gần như vô hạn, chỉ tính Độ Lộ Tiền
VAR snh_so_lan_dung_ket = 0

// ---------- Mũ & Vũ ----------
VAR snh_dang_mac_do = true
VAR snh_so_lan_thao_mu = 0          // tổng số lần tháo mũ trước một ai đó
VAR snh_thao_mu_truoc_vu = 0        // số lần tháo mũ trước mặt Vũ
VAR snh_qua_truoc_camera = false    // đã từng tặng quà cho Vũ trước camera
VAR snh_to_tinh_camera = false      // đã từng tỏ tình trước camera / sân khấu
VAR snh_to_tinh_pr = false          // tỏ tình trước camera khi Tim Hồng < 60
VAR snh_tin_nhan_vu_sinh_nhat = false
VAR snh_nguoi_duy_nhat_biet = false // nhánh "Người duy nhất biết" (đưa USB cho Vũ)
VAR snh_da_lo_mat = false           // mặt thật đã bị lộ ngoài ý muốn

// ---------- Xóm Cây Me ----------
VAR snh_nghe_ten_quen = false       // 1/10: "Hiếu… tên này nghe quen"
VAR snh_dang_anh_cay_me = false     // 11/10: đăng ảnh xóm Cây Me
VAR snh_mo_nhanh_hieu_ech = false   // đã nhận ra Hiếu
VAR snh_xin_loi_hieu_kin = false    // đã xin lỗi Hiếu khi không có camera
VAR snh_han_cua_hieu = 100          // Mối Hận của Hiếu (Nguyên không thấy, nhưng game tính)

// ---------- Tuất ----------
VAR snh_ngay_choc_tuat_cuoi = 0     // ngày gần nhất chọc Tuất
VAR snh_chuoi_khong_choc = 0        // chuỗi ngày không chọc Tuất dài nhất (đã khép lại)
VAR snh_so_lan_choc_tuat = 0
VAR snh_so_xuc_xich_tuat = 0        // số lần cho Tuất xúc xích
VAR snh_cong_tuat_ve = false        // sự kiện ẩn: cõng Tuất về khi Tuất bị lạc
VAR snh_giau_ga_cao_su = false      // 4/10: giấu con gà cao su của Tuất
VAR snh_tra_ga_cao_su = false

// ---------- Chiến dịch & LL ----------
VAR snh_follow_tu_meme = 0          // số người theo dõi đến từ clip hài
VAR snh_mua_fan_ao = false
VAR snh_bi_boc_fan_ao = false
VAR snh_khai_ve_so = false
VAR snh_biet_trang_47 = false       // Thương đã kể về điều khoản hoàn tiền
VAR snh_tu_choi_ll = false
VAR snh_hen_ll_30 = false           // "cho anh suy nghĩ tới 30/10"
VAR snh_so_lan_giup_nguoi = 0
VAR snh_bo_chup_giup_ba_cu = false
VAR snh_tra_luong_ho = false
VAR snh_thuong_gameshow = false     // 16/10: giành được 10 triệu tiền thưởng
VAR snh_xin_cho = ""                // 30/10: người Nguyên đứng ra xin cho
VAR snh_thao_mu_dem_hong_truoc = "" // 31/10: tháo mũ trước ai ("vu", "hieu", "khan_gia")

// ---------- Mai (quán Chè Bà Bảy, đầu Hẻm 69) ----------
VAR snh_mai = 0                     // Mai nhìn thấy Nguyễn Nguyên tới đâu (0..10). Không phải Siêu Nhân Hồng, là Nguyên
VAR snh_mai_nhan_ra = false         // 6/10: Mai nhận ra giọng anh khách ăn chè khuya trong bộ đồ hồng
VAR snh_vu_noi_pr = false           // 23/10: Vũ trả lời màn tỏ tình bằng "Ý tưởng PR hay đó anh"
VAR snh_quy_vu_san_khau = false     // 31/10: định quỳ tặng hoa Vũ trên sân khấu

// ---------- Minigame ----------
VAR snh_mg_qua_co_camera = false   // Quà Cho Vũ: lần này có camera gần đó
VAR snh_mg_qua_luc_ban = false     // Quà Cho Vũ: tặng lúc Vũ đang "nước tới chân"
VAR snh_mg_qua_dat_tien = false    // Quà Cho Vũ: món quà quá đắt

// ============================================================
// HÀM RIÊNG CỦA SIÊU NHÂN HỒNG
// ============================================================

=== function snh_mat(n) ===
~ snh_lo_mat = gioi_han(snh_lo_mat + n)

=== function snh_tien(n) ===
~ snh_lo_tien = gioi_han(snh_lo_tien + n)

=== function snh_tim(n) ===
~ snh_tim_hong = gioi_han(snh_tim_hong + n)

=== function snh_no(n) ===
~ snh_no_xom_cu = gioi_han(snh_no_xom_cu + n)

=== function snh_hieu(n) ===
~ snh_han_cua_hieu = gioi_han(snh_han_cua_hieu + n)

// Tiền làm ra: vào Ví Cát-xê
=== function snh_cat_xe(n) ===
~ snh_vi_cat_xe = snh_vi_cat_xe + n
~ tien_cong(n)

// Dùng Két Vé Số: mỗi lần làm Độ Lộ Tiền tăng
=== function snh_ket(lo) ===
~ snh_so_lan_dung_ket = snh_so_lan_dung_ket + 1
~ snh_tien(lo)

// Tháo mũ trước một người (co_vu = true nếu người đó là Vũ)
=== function snh_thao_mu(co_vu) ===
~ snh_so_lan_thao_mu = snh_so_lan_thao_mu + 1
~ snh_mat(10)
{ co_vu:
    ~ snh_thao_mu_truoc_vu = snh_thao_mu_truoc_vu + 1
}

// Clip hài lên mạng: tính riêng phần người theo dõi đến từ meme
=== function snh_meme(n) ===
~ follow(n)
~ snh_follow_tu_meme = snh_follow_tu_meme + n
~ scandal()

// Đi giúp người
=== function snh_giup_nguoi() ===
~ snh_so_lan_giup_nguoi = snh_so_lan_giup_nguoi + 1
~ snh_no(-2)

// Chọc Tuất: khép chuỗi ngày không chọc
=== function snh_choc_tuat() ===
~ temp chuoi = ngay - snh_ngay_choc_tuat_cuoi - 1
{ chuoi > snh_chuoi_khong_choc:
    ~ snh_chuoi_khong_choc = chuoi
}
~ snh_ngay_choc_tuat_cuoi = ngay
~ snh_so_lan_choc_tuat = snh_so_lan_choc_tuat + 1
~ qh("cho", -15)

// Chuỗi không chọc Tuất dài nhất, tính tới hôm nay
=== function snh_chuoi_hien_tai() ===
~ temp hien = ngay - snh_ngay_choc_tuat_cuoi
{ hien > snh_chuoi_khong_choc:
    ~ return hien
}
~ return snh_chuoi_khong_choc

// Thêm một bước gần Mai
=== function snh_gan_mai(n) ===
~ snh_mai = snh_mai + n
{ snh_mai > 10:
    ~ snh_mai = 10
}

// Cho Tuất xúc xích
=== function snh_cho_xuc_xich() ===
~ snh_so_xuc_xich_tuat = snh_so_xuc_xich_tuat + 1
~ qh("cho", 3)
