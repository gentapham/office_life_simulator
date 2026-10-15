// ============================================================
// BIÊN KỊCH: OÁNH · biến riêng (tiền tố bk_)
// ============================================================

// ---------- 4 chỉ số chính ----------
VAR bk_y_tuong_that = 20      // 💡 Ý Tưởng Thật
VAR bk_y_tuong_muon = 0       // 📎 Ý Tưởng "Mượn"
VAR bk_do_lo = 10             // 📖 Độ Lộ Bản Thảo (0..100)
VAR bk_cam_hung = 50          // 🌧️ Cảm Hứng (0..100)

// ---------- Tiểu thuyết "Công Ty Là Gia Đình" ----------
VAR bk_trang_tieu_thuyet = 0  // số trang đã gõ (≥ 200 là xong)
VAR bk_chu_ky_dong_y = 0      // số đồng nghiệp đã ký đồng ý (hoặc đã được đổi tên)
VAR bk_da_doi_ten = false     // đã đổi hết tên thật trong bản thảo
VAR bk_do_lo_tung_100 = false // Độ Lộ từng chạm 100
VAR bk_so_bi_lo_da_xem = false
VAR bk_nguoi_nhat_so = ""     // "thuc_tap_sinh" / "hong_hot" / "ran_doc" / "" (tự lấy lại)
VAR bk_ban_cho_ll = false
VAR bk_tu_choi_ll = false
VAR bk_truy_tim_ll = false

// ---------- Phim ngắn "Người Hùng Không Tên" ----------
VAR bk_mo_nhanh_nguoi_hung = false
VAR bk_ghi_chu_y_tuong_duy = false   // trang sổ ghi "Ý tưởng của Duy (2/10)"
VAR bk_noi_cau_cu = false            // từng chê ý tưởng của Duy là "cũ"
VAR bk_dong_tac_gia_som = false      // xin viết chung với Duy từ 2/10
VAR bk_ghi_cong_duy = false          // đã Ghi Công cho Duy
VAR bk_so_lan_ghi_cong = 0
VAR bk_tham_khao_sau_15 = false      // còn "tham khảo" sau 15/10
VAR bk_tien_do_phim = 0              // 0..100
VAR bk_kich_ban_phim_xong = false    // xong trước 26/10
VAR bk_thay_nguyen_day_xe = false    // từng thấy Nguyên đẩy xe giúp người
VAR bk_hai_cay_so = false            // nhánh "Hai Cây Số Dưới Mưa"
VAR bk_ai_biet_chuyen = false        // Ngân / Hiếu / Quỳnh / con rắn thứ hai biết chuyện ý tưởng
VAR bk_ke_that_lua_trai = false
VAR bk_credit = ""                   // "oanh" / "duy" / "ca_hai" / "trong"
VAR bk_phim_thanh_cong = false

// ---------- Công việc trong tháng ----------
VAR bk_kich_ban_mv_sao = 0           // 0..3
VAR bk_cau_hoi_gameshow = ""         // "vua" / "de" / "kho"
VAR bk_bi_trao_cau_hoi = false
VAR bk_ke_hoach_tuat = false         // kịch bản livestream có phương án "Tuất phá bánh"
VAR bk_thu_luong = ""                // "y_sep" / "that" / "tra_sua"
VAR bk_biet_quy_tra_sua = false
VAR bk_bai_phat_bieu_tot = 0         // số bài phát biểu khán giả không ngáp quá nửa
VAR bk_kich_ban_thanh_tra = false
VAR bk_vuot_meo = 0
VAR bk_so_hop_song_sot = 0
VAR bk_go_may_29 = false
VAR bk_co_ca_phe_muoi = false
VAR bk_co_ve_gameshow = false
VAR bk_quynh_hoa_binh = false
VAR bk_hong_coin = false           // lỡ mua Hồng Coin ngày 9/10
VAR bk_ghi_cong_co_nam = false

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function bk_lo(n) ===
~ bk_do_lo = bk_do_lo + n
{ bk_do_lo < 0:
    ~ bk_do_lo = 0
}
{ bk_do_lo >= 100:
    ~ bk_do_lo = 100
    ~ bk_do_lo_tung_100 = true
}

=== function bk_cam(n) ===
~ bk_cam_hung = gioi_han(bk_cam_hung + n)

=== function bk_that(n) ===
~ bk_y_tuong_that = gioi_han(bk_y_tuong_that + n)

=== function bk_muon(n) ===
~ bk_y_tuong_muon = gioi_han(bk_y_tuong_muon + n)
{ n > 0 && ngay > 15:
    ~ bk_tham_khao_sau_15 = true
}

=== function bk_ghi_cong(ma) ===
~ bk_so_lan_ghi_cong = bk_so_lan_ghi_cong + 1
~ bk_muon(-20)
~ qh(ma, 20)

=== function bk_trang(n) ===
~ bk_trang_tieu_thuyet = bk_trang_tieu_thuyet + n

=== function bk_phim(n) ===
~ bk_tien_do_phim = gioi_han(bk_tien_do_phim + n)
