// ============================================================
// BÁC BẢO VỆ: BÌNH · biến & hàm riêng (tiền tố bv_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR bv_bi_mat = 0           // 🤫 Bí Mật Biết Được (không giảm)
VAR bv_long_tin_g = 70      // ✉️ Lòng Tin Của G 0..100
VAR bv_binh_tam = 80        // 🍵 Độ Bình Tâm 0..100
VAR bv_lo = 0               // 🕵️ Độ Lộ Thân Phận 0..100

// ---------- Thư cho G ----------
VAR bv_so_thu = 0               // số thư đã gửi trong tháng (mục tiêu 4)
VAR bv_bo_thu = 0               // số tuần bỏ không gửi
VAR bv_thu_that = 0             // số chuyện thật, cụ thể đã kể
VAR bv_thu_dep = 0              // số chuyện "tô đẹp" đã kể
VAR bv_dong_thu = 0             // số chuyện đã chọn trong lá thư đang viết
VAR bv_ke_ngan_hang = false     // đã kể chuyện thư ngân hàng / thế chấp
VAR bv_ke_trang_47 = false      // đã kể điều khoản hoàn 10 tỷ
VAR bv_ke_tot_thang = false     // đã kể chuyện Thắng cố gắng, thương nhân viên
VAR bv_ke_dem_17 = false        // đã kể chuyện người lạ đêm 17/10
VAR bv_g_khuyen_giay = false    // lời khuyên của G: "đôi giày nói thật hơn cái miệng"
VAR bv_g_khuyen_thang = false   // lời khuyên của G: "nói với Thắng khi nó hỏi"
VAR bv_g_khuyen_tra = false     // lời khuyên của G: "trả phong bì, giữ chén trà"

// ---------- Đếm thói quen ----------
VAR bv_khong_thay = 0           // số lần dùng "Không Thấy Gì"
VAR bv_so_ly_tra = 0            // số ly trà đá đã rót
VAR bv_so_truc_dung = 0         // số lần sổ trực làm bằng chứng
VAR bv_chan_paparazzi = 0

// ---------- Cờ cốt truyện ----------
VAR bv_vua_no = false               // Bình Tâm chạm 0, cảnh "bác nổ" sẽ mở
VAR bv_da_no = false
VAR bv_lo_day = false               // Lộ Thân Phận chạm 100
VAR bv_thang_biet = false           // Thắng đã biết toàn bộ sự thật (G, thư, tủ gỗ)
VAR bv_tuat_o_lai = true            // 17/10 Tuất ở lại với bác
VAR bv_thay_mat_nguyen = false      // 6/10 thấy mặt thật Nguyên
VAR bv_nguoi_dem_17 = ""            // "ran_thu_hai" / "vu" / "bao"
VAR bv_bat_qua_tang_17 = false
VAR bv_biet_ran_thu_hai = false
VAR bv_mo_phong_bi = false          // đã mở phong bì dán kín của G
VAR bv_doc_thu_cong_ty = false      // 20/10 đọc thư trước toàn công ty
VAR bv_ke_thang_rieng = false       // 20/10 kể riêng cho Thắng
VAR bv_mang_giay_to = false         // 22/10 mang bản gốc giấy tờ thành lập tới
VAR bv_nhan_tien_ll = false
VAR bv_ll_tre = false               // phong bì LL tới tay Nguyên trễ 1 ngày
VAR bv_tuat_thay_bien_lai = false   // Tuất tha về biên lai tiệm cầm đồ của Chương
VAR bv_chuong_cat_lo = false
VAR bv_cho_chuong_vay = false
VAR bv_nhay_trend = false
VAR bv_kevin_tron = false
VAR bv_sinh_nhat_nho = false        // có người nhớ sinh nhật 50 tuổi
VAR bv_doc_quyet_dinh = false       // 30/10 đọc quyết định của G
VAR bv_biet_son_hat = false
VAR bv_giu_kho_tuat = false
VAR bv_ghe_khach_moi = false        // 31/10 ngồi hàng ghế khách mời

// ---------- Đồ riêng (không có trong tui_do) ----------
VAR bv_co_che_thai = false      // hộp chè Thái Nguyên G gửi
VAR bv_co_hat_dua = false
VAR bv_co_trai_cam = false
VAR bv_co_banh_mi_op_la = false
VAR bv_co_phong_bi_g = false    // đang giữ phong bì dán kín

// ============================================================
// HÀM RIÊNG
// ============================================================

=== function bv_bm(n) ===
~ bv_bi_mat = bv_bi_mat + n

=== function bv_g(n) ===
~ bv_long_tin_g = gioi_han(bv_long_tin_g + n)

// Bình Tâm: chạm 0 thì bác "nổ" một lần
=== function bv_tam(n) ===
~ bv_binh_tam = gioi_han(bv_binh_tam + n)
{ bv_binh_tam <= 0 && not bv_da_no:
    ~ bv_vua_no = true
}

// Lộ Thân Phận: chạm 100 thì Thắng phát hiện
=== function bv_lo_than(n) ===
~ bv_lo = gioi_han(bv_lo + n)
{ bv_lo >= 100:
    ~ bv_lo_day = true
}

// "Bác không thấy gì đâu."
=== function bv_khong_thay_gi() ===
~ bv_khong_thay = bv_khong_thay + 1

// Rót một ly trà đá (3.000đ, đúng giá quán đầu hẻm)
=== function bv_rot_tra(ma, d) ===
~ bv_so_ly_tra = bv_so_ly_tra + 1
~ tien_cong(3000)
~ qh(ma, d)
~ bv_tam(2)

// Quan hệ trung bình với 20 nhân viên (không tính Tuất, Nguyên và chính bác)
=== function bv_qh_tb() ===
~ temp tong = qh_ran_doc + qh_giam_doc + qh_truong_phong + qh_thanh_ninh + qh_hong_hot + qh_con_ong_chau_cha + qh_chua_te_deadline + qh_thuc_tap_sinh + qh_ke_toan + qh_hr
~ tong = tong + qh_it + qh_idol_het_thoi + qh_quan_ly_idol + qh_bien_kich + qh_editor + qh_designer + qh_sales + qh_chi_dai + qh_dan_dau_tu + qh_thanh_xin_nghi
~ return tong / 20

// Mỗi người đều được cộng chút quan hệ (cả công ty cùng mừng / cùng nghe)
=== function bv_qh_ca_cong_ty(d) ===
~ qh("ran_doc", d)
~ qh("giam_doc", d)
~ qh("truong_phong", d)
~ qh("thanh_ninh", d)
~ qh("hong_hot", d)
~ qh("con_ong_chau_cha", d)
~ qh("chua_te_deadline", d)
~ qh("thuc_tap_sinh", d)
~ qh("ke_toan", d)
~ qh("hr", d)
~ qh("it", d)
~ qh("idol_het_thoi", d)
~ qh("quan_ly_idol", d)
~ qh("bien_kich", d)
~ qh("editor", d)
~ qh("designer", d)
~ qh("sales", d)
~ qh("chi_dai", d)
~ qh("dan_dau_tu", d)
~ qh("thanh_xin_nghi", d)
