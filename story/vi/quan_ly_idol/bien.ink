// ============================================================
// QUẢN LÝ IDOL: THÁI · biến & hàm riêng (tiền tố thai_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR thai_khung_hoang = 0       // Khủng Hoảng Đang Xử Lý, 0..5
VAR thai_pin = 80              // Pin (Thái + 2 điện thoại), 0..100
VAR thai_giau_kin = 100        // Độ Giấu Kín, 0..100
VAR thai_trung_thanh = 60      // Lòng Trung Thành, 0 = sang LL, 100 = ở lại tới cùng

// ---------- Đếm ----------
VAR thai_ganh_ho = 0           // số lần Gánh Hộ
VAR thai_dap_phot = 0          // số phốt đã dập
VAR thai_pin_ve_0 = 0          // số lần Pin về 0
VAR thai_doi_lich_son = 0      // số lần đổi lịch cho Sơn đi thi
VAR thai_nhang = 0             // số lần thắp nhang ở Chùa Phố Cũ
VAR thai_ly_ca_phe = 0         // ly cà phê hôm nay
VAR thai_video_tien_tay = 0    // số video "tiện tay" đã để ý thấy

// ---------- Cờ cốt truyện ----------
VAR thai_tung_chay_may = false       // Khủng Hoảng từng chạm 5
VAR thai_mo_doi_ban_than = false     // mở nhánh "Đôi Bạn Thân"
VAR thai_nguoi_dung_dem = false      // mở nhánh "Người Dựng Đêm"
VAR thai_ky_ll = false               // đã ký với LL
VAR thai_dat_nguyen_di = false       // dắt Nguyên sang LL
VAR thai_mo_dat_nguyen = false       // mở nhánh "Dắt Nguyên Đi" (25/10)
VAR thai_tu_choi_ll = false          // đã từ chối LL dứt khoát
VAR thai_phat_fan_ao = 80000         // fan ảo của Phát (theo Thái biết)
VAR thai_phat_huy_fan_ao = false     // Phát đã hủy gói fan ảo
VAR thai_phat_bi_boc = false         // phốt fan ảo của Phát đã nổ
VAR thai_clip_15_dang = false        // clip Phát hát trong bóng tối đã đăng
VAR thai_phat_gia_han = false        // hợp đồng Phát được gia hạn 30/10
VAR thai_dat_cuoc = false            // đặt cược uy tín giữ Phát
VAR thai_song_ca_ghep = false        // ghép được Phát và Nguyên song ca
VAR thai_to_son = false              // từng tố Sơn với HR
VAR thai_book_gio_vang = false       // book được khung giờ vàng 16/10
VAR thai_tra_tien_nha = false        // tháng 10 lại lén trả tiền nhà cho Phát
VAR thai_vi_tri_dem_hong = "canh_ga" // "canh_ga", "ll", "hang_dau"
VAR thai_noi_that_lua_trai = ""      // "vo_hai", "ll", "mot_nua"

// ---------- Đồ vật riêng ----------
VAR thai_co_sac_du_phong = false     // cục sạc dự phòng: hồi đầy Pin 1 lần
VAR thai_co_gang_tay_moi = false     // găng tay hồng size L mua thay
VAR thai_gang_quynh_nhuom = false    // găng do Quỳnh nhuộm màu "Hồng Thái Độ" (manh mối font Hồng Ngoại)
VAR thai_giu_usb_linh = false        // 30/10 nhận giữ USB con cú của Lĩnh

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function thai_kh(n) ===
~ thai_khung_hoang = thai_khung_hoang + n
{ thai_khung_hoang > 5:
    ~ thai_khung_hoang = 5
}
{ thai_khung_hoang < 0:
    ~ thai_khung_hoang = 0
}
{ thai_khung_hoang >= 5:
    ~ thai_tung_chay_may = true
}

// Pin về 0 chỉ tính một lần mỗi lần sập (đang 0 mà tụt tiếp thì không tính thêm)
=== function thai_p(n) ===
~ temp truoc = thai_pin
~ thai_pin = thai_pin + n
{ thai_pin > 100:
    ~ thai_pin = 100
}
{ thai_pin <= 0:
    ~ thai_pin = 0
    { truoc > 0:
        ~ thai_pin_ve_0 = thai_pin_ve_0 + 1
    }
}

=== function thai_gk(n) ===
~ thai_giau_kin = gioi_han(thai_giau_kin + n)

=== function thai_tt(n) ===
~ thai_trung_thanh = gioi_han(thai_trung_thanh + n)

=== function thai_ca_phe() ===
~ thai_ly_ca_phe = thai_ly_ca_phe + 1
~ thai_p(20)
~ uong(10)
{ thai_ly_ca_phe > 5:
    ~ cang_thang(5)
}

=== function thai_ganh() ===
~ thai_ganh_ho = thai_ganh_ho + 1
~ uy_tin = uy_tin - 15
{ uy_tin < 0:
    ~ uy_tin = 0
}
~ thai_gk(-10)

=== function thai_dap() ===
~ thai_dap_phot = thai_dap_phot + 1
~ thai_kh(-1)
~ thai_p(-20)
