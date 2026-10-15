// ============================================================
// IT: BẢO · biến riêng (tiền tố it_)
// Xem thiết kế: docs/roles/it.md
// ============================================================

// ---------- Bốn chỉ số chính (0..100) ----------
VAR it_quyen_truy_cap = 40     // 🔑 Quyền Truy Cập
VAR it_on_dinh = 60            // 📶 Độ Ổn Định Mạng
VAR it_luong_tam = 70          // ⚖️ Lương Tâm
VAR it_bi_do_toi = 10          // 🎯 Bị Đổ Tội (đạt 100 là "Lỗi Người Dùng")

// ---------- Tiền & đếm ----------
VAR it_tiet_kiem = 6000000     // "Quỹ router": tiền Bảo tự để dành phòng khi công ty không bao giờ mua router
VAR it_so_ticket = 0           // số ticket hỗ trợ đã giải đúng
VAR it_so_nguoi_tu_restart = 0 // số đồng nghiệp đã được dạy tự tắt đi bật lại
VAR it_so_cam_on = 0           // số lần có người nói "cảm ơn anh Bảo"
VAR it_so_lan_restart = 0      // số sự cố giải bằng tắt đi bật lại
VAR it_doc_trom = 0            // số lần đọc tin nhắn riêng
VAR it_so_lan_ket_giay = 0     // số lần gỡ kẹt giấy không rách

// ---------- Cờ cốt truyện ----------
VAR it_biet_o_cung = false          // đã tìm hiểu ổ cứng "KHÔNG ĐƯỢC MỞ" ở phòng trọ
VAR it_lay_ga_cao_su = false        // đã lấy con gà cao su của Tuất ra khỏi tủ mạng
VAR it_biet_clone = false           // đã đọc log máy giám đốc, thấy "Hoa Hướng Dương 1989"
VAR it_nhanh_hai_tai_khoan = false  // mở nhánh "Hai Tài Khoản"
VAR it_giu_bi_mat_ngan = false      // giữ bí mật admin Confession cho Ngân
VAR it_nop_ten_ngan = false         // khai tên Ngân cho sếp
VAR it_doc_trom_sau_15 = false      // có đọc trộm tin nhắn riêng sau 15/10
VAR it_bi_phat_hien_doc_trom = false
VAR it_nguoi_to = ""                // ai tố Bảo đọc trộm
VAR it_nhanh_nguoi_gui_thu = false  // mở nhánh "Người Gửi Thư"
VAR it_nhanh_ban_thu_moc = false    // mở nhánh "Bản Thu Mộc"
VAR it_ban_thu_cho = ""             // đưa bản thu mộc "Công Viên" cho ai
VAR it_cuu_file_vu = false
VAR it_ve_som_vung_tau = false
VAR it_gui_log_ll = false           // đã gửi log lịch trình Nguyên cho LL
VAR it_ghi_am_ll = false
VAR it_tu_choi_ll = false
VAR it_thu_pham_29 = ""             // "cho" hoặc mã nhân vật con rắn thứ hai
VAR it_tim_ra_thu_pham = false
VAR it_dem_hong_san_sang = false    // tổng duyệt 30/10 ổn, cầu dao được canh
VAR it_su_co_am_thanh = false       // có sự cố âm thanh ánh sáng ở các show lớn
VAR it_mua_router_rieng = false
VAR it_biet_sinh_nhat_binh = false
VAR it_tai_nghe_hong = false        // có tai nghe in-ear màu hồng cho Nguyên
VAR it_bao_ve_kho_tuat = false
VAR it_livestream_23_on = false

// ---------- Đồ riêng ----------
VAR it_co_que_phat_sang = 0
VAR it_co_banh_quy = 0
VAR it_co_pizza = 0
VAR it_co_dia_lac = false
VAR it_co_o_cung = false            // đã mang ổ cứng "KHÔNG ĐƯỢC MỞ" lên công ty

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function it_do_toi(n) ===
~ it_bi_do_toi = gioi_han(it_bi_do_toi + n)

=== function it_on(n) ===
~ it_on_dinh = gioi_han(it_on_dinh + n)

=== function it_lt(n) ===
~ it_luong_tam = gioi_han(it_luong_tam + n)

=== function it_truy_cap(n) ===
~ it_quyen_truy_cap = gioi_han(it_quyen_truy_cap + n)

=== function it_cam_on() ===
~ it_so_cam_on = it_so_cam_on + 1

// Đọc tin nhắn riêng của người khác: Lương Tâm −5
=== function it_doc_tin_rieng() ===
~ it_doc_trom = it_doc_trom + 1
~ it_lt(-5)
{ ngay > 15:
    ~ it_doc_trom_sau_15 = true
}

// Chiến dịch đang "trên đà" thành công (dùng lúc đánh giá 30/10)
=== function it_chien_dich_on() ===
~ return nguoi_theo_doi >= 850000 and not nguyen_theo_ll
