// ============================================================
// CHÚA TỂ DEADLINE: VŨ · biến riêng (tiền tố vu_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR vu_nuoc_toi_chan = 30      // 🌊 Độ Nước Tới Chân 0..100 (≥80: Thần Tốc, 100: Nước Tới Cổ)
VAR vu_gio_luot = 0            // 📱 Giờ lướt Tóp-tóp trong ngày (game reset mỗi sáng)
VAR vu_tong_gio_luot = 0       // Tổng giờ lướt cả tháng
VAR vu_chuoi_ngay_it_luot = 0  // Số ngày liền lướt không quá 1 tiếng (kết thúc bí mật cần 7)
VAR vu_lo_file = 0             // 💾 Độ Lộ File Gốc 0..100
VAR vu_tin_that_long = 0       // 🩷 Độ Tin Thật Lòng 0..100
VAR vu_tin_bi_khoa = false     // Đã nói "Kịch bản này ai viết vậy?" ngày 23/10: khóa Độ Tin Thật Lòng

// ---------- File gốc dự án tháng 6 ----------
VAR vu_co_file = false         // Đã tìm lại được file gốc (USB của Tuất hoặc ổ cứng của Bảo)
VAR vu_file_tu_bao = false     // Tìm lại nhờ ổ cứng "KHÔNG ĐƯỢC MỞ" của Bảo
VAR vu_file_truoc_2010 = false // Tìm lại trước ngày 20/10 (clip 16 năm lên sóng đúng ngày)
VAR vu_manh_moi_tuat = false   // Tuất ngửi ly cà phê sữa đá (4/10)
VAR vu_manh_moi_binh = false   // Bác Bình nói "bác không thấy gì đâu" hơi lâu
VAR vu_linh_giu_bi_mat = false // Đã thú nhận với Lĩnh
VAR vu_thu_nhan_bao = false    // Đã thú nhận với Bảo đêm 21/10
VAR vu_bi_phat_thue = false    // Đoàn thuế phạt vì thiếu bằng chứng nghiệm thu

// ---------- Tiến độ chiến dịch ----------
VAR vu_moc_truot = 0           // Số mốc chiến dịch bị trượt
VAR vu_mv_dung_ngay = false    // MV ra đúng 9/10
VAR vu_kich_ban_gameshow = false // Kịch bản gameshow nộp kịp 9:00 ngày 16/10
VAR vu_ho_so_phuong = false    // Hồ sơ xin phép biểu diễn nộp kịp 8:00 ngày 19/10
VAR vu_cue_sheet = 0           // Số cue đã viết cho Đại Nhạc Hội Siêu Nhân (đủ: 47)
VAR vu_dem_than_toc_2910 = false // Đêm Thần Tốc cuối cùng (29/10) hoàn thành
VAR vu_so_dem_than_toc = 0     // Số lần làm Đêm Thần Tốc
VAR vu_xong_som = false        // Xong toàn bộ việc chiến dịch trước 24/10
VAR vu_bang_tien_do_that = false // Đã làm lại bảng tiến độ tử tế

// ---------- Kỹ năng & thói quen ----------
VAR vu_so_lan_nho_xiu = 0      // Tổng số lần "Nhờ Xíu"
VAR vu_nho_duy = 0             // Số lần nhờ riêng {thuc_tap_sinh}
VAR vu_so_lan_ne_nhat = 0      // Số cuộc họp đã né
VAR vu_trich_slogan = 0        // Số lần trích slogan công ty để thoát tội
VAR vu_bao_cao_80 = 0          // Số lần "Báo Cáo 80%"

// ---------- Tuyến tình cảm với Siêu Nhân Hồng ----------
VAR vu_qua_hong = 0            // Số món quà hồng đã nhận
VAR vu_co_but_hong = false     // Cây bút highlight hồng đầu tiên Nguyên tặng
VAR vu_hen_dem_hong = false    // Mở nhánh "Hẹn Đại Nhạc Hội Siêu Nhân" (23/10)
VAR vu_tra_loi_2710 = ""       // "o_lai" / "da_xem" / "hen_31"
VAR vu_da_tra_loi_nguyen = false // Đã trả lời Nguyên trước 23:59 ngày 31/10
VAR vu_cuu_banh_kem = false    // Lao ra cứu bánh kem 23/10

// ---------- Khác ----------
VAR vu_no_chuong = 0           // Tiền Chương "ghi nợ" sau các ván bida
VAR vu_muon_duy = false        // Đã mượn tiền {thuc_tap_sinh} lúc lương trễ
VAR vu_duoc_de_bat = false     // 30/10: được đọc tên Trưởng nhóm Dự án
VAR vu_cue_chuan = false       // 31/10: chốt pháo giấy đúng cue 47
VAR vu_usb_ra_bai_rac = false  // 30/10: USB đi theo xe rác ra bãi Ven Đô
VAR vu_thay_mai = false        // Đã thấy {sieu_nhan_hong} ở quán chè Bà Bảy với Mai

// ============================================================
// HÀM RIÊNG
// ============================================================
// Độ Nước Tới Chân luôn nằm trong 0..100
=== function vu_nuoc(n) ===
~ vu_nuoc_toi_chan = gioi_han(vu_nuoc_toi_chan + n)

// Cue sheet Đại Nhạc Hội: 0..47
=== function vu_cue(n) ===
~ vu_cue_sheet = vu_cue_sheet + n
{ vu_cue_sheet > 47:
    ~ vu_cue_sheet = 47
}

// Độ Tin Thật Lòng luôn nằm trong 0..100
=== function vu_tin(n) ===
~ vu_tin_that_long = gioi_han(vu_tin_that_long + n)
