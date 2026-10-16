// ============================================================
// IDOL HẾT THỜI: PHÁT · biến & hàm riêng (tiền tố phat_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR phat_noi_tieng = 35        // Độ Nổi Tiếng (đang tụt), 0..100, tự giảm 1 mỗi ngày
VAR phat_no = 54000000         // Tiền Nợ (đồng)
VAR phat_fan_ao = 80000        // Fan Ảo "Like Thật 100%"
VAR phat_tinh_tuong = 90       // Độ Tinh Tướng, 0..100

// ---------- Đếm ----------
VAR phat_so_show = 0           // số đám cưới + khai trương đã hát
VAR phat_doc_nham_ten = 0      // số lần đọc nhầm tên cô dâu chú rể
VAR phat_gianh_spotlight = 0   // tổng số lần giành spotlight của Nguyên
VAR phat_gianh_sau_16 = 0      // số lần giành spotlight sau 16/10
VAR phat_pha_chien_dich = 0    // số lần phá chiến dịch Siêu Nhân Hồng thành công
VAR phat_sua_loi_nguyen = 0    // số lần sửa lời "Công Viên" cho Nguyên
VAR phat_ngay_deo_kinh = 0     // số ngày đeo kính đen trong văn phòng

// ---------- Cờ cốt truyện ----------
VAR phat_mo_quan_ca_phe = false      // đã mở hội thoại "Quán cà phê năm 2015"
VAR phat_mua_view_mv = false         // 9/10 mua 50.000 view ảo
VAR phat_cam_cup = false             // đã cầm cúp "Ca khúc của năm 2015"
VAR phat_chuoc_cup = false           // đã chuộc lại cúp
VAR phat_clip_15_quay = false        // Lĩnh đã quay cảnh hát trong bóng tối 15/10
VAR phat_clip_15_dang = false        // clip 15/10 đã được đăng
VAR phat_giong_trong_bong_toi = false // mở nhánh "Giọng Trong Bóng Tối"
VAR phat_lat_phot = false            // dùng clip 15/10 để lật phốt fan ảo
VAR phat_huy_fan_ao = false          // tự hủy gói "Like Thật 100%"
VAR phat_bi_boc_phot = false         // đã bị bóc phốt fan ảo
VAR phat_fan_ao_khi_boc = 0          // số fan ảo lúc bị bóc phốt
VAR phat_hat_be_16 = false           // hát bè từ cánh gà 16/10
VAR phat_song_ca = false             // nhận lời song ca "Công Viên Hồng"
VAR phat_nguoi_remix = ""            // "long", "linh", "bao" hoặc ""
VAR phat_song_ca_dem_hong = false    // đã song ca trên sân khấu Đại Nhạc Hội Siêu Nhân
VAR phat_biet_chuoichien89 = false   // biết admin "ChuoiChien89" là Thái
VAR phat_thay_anh = false            // thấy tấm ảnh trong ngăn kéo nhà Thái
VAR phat_xin_thai_o_lai = false      // đã nói "anh đừng đi" với Thái
VAR phat_thai_o_lai = false          // Thái từ chối LL (chốt ngày 27/10)
VAR phat_gia_han = false             // hợp đồng được gia hạn 30/10
VAR phat_karaoke_100 = false         // được 100 điểm "Công Viên"
VAR phat_bai_moi = false             // đã viết xong bài mới
VAR phat_vai_dem_hong = "khan_gia"   // "mo_man", "song_ca", "pha_dam", "khan_gia"
VAR phat_vo_giong = false            // từng vỡ giọng trong phòng thu
VAR phat_lay_dia_banh = false        // 1/10 lấy cả đĩa bánh chuối chiên
VAR phat_tung_anh_lo_cam = false     // tung ảnh Nguyên "lộ cằm"
VAR phat_day_nguyen = false          // đã dạy Nguyên đứng sân khấu

// ---------- Đồ vật riêng ----------
VAR phat_co_keo_ngam = false         // hộp kẹo ngậm thông cổ: lần hát sau không vỡ giọng
VAR phat_co_ghi_am_long = false      // 20 giây ghi âm "Hồng Là Thái Độ"
VAR phat_co_phieu_oc = false         // phiếu 1 dĩa ốc ở Quán Ốc Đêm
VAR phat_co_cup = true               // cúp "Ca khúc của năm 2015" đang ở nhà

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function phat_nt(n) ===
~ phat_noi_tieng = gioi_han(phat_noi_tieng + n)

=== function phat_tt(n) ===
~ phat_tinh_tuong = gioi_han(phat_tinh_tuong + n)

=== function phat_tra_no(n) ===
~ phat_no = phat_no - n
{ phat_no < 0:
    ~ phat_no = 0
}

=== function phat_them_no(n) ===
~ phat_no = phat_no + n

=== function phat_mua_fan(so, gia) ===
~ phat_fan_ao = phat_fan_ao + so
~ phat_no = phat_no + gia

=== function phat_gianh() ===
~ phat_gianh_spotlight = phat_gianh_spotlight + 1
{ ngay > 16:
    ~ phat_gianh_sau_16 = phat_gianh_sau_16 + 1
}
