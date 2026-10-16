// ============================================================
// THỰC TẬP SINH: DUY · biến riêng (tiền tố duy_)
// ============================================================

// Ghi chú: 💳 Quẹt Thẻ Kim Cương trả bằng tiền tiết kiệm thời ngân hàng,
// KHÔNG trừ vào ví `tien` (lương thực tập). Chỉ tăng Độ Lộ Thân Phận.

// ---------- Chỉ số riêng ----------
VAR duy_do_ngo = 70            // 😶 Độ Ngơ 0..100
VAR duy_kinh_nghiem = 0        // 📚 Kinh Nghiệm 0..100 (cần ≥ 60 để có cơ hội được giữ lại)
VAR duy_do_lo = 0              // 🏦 Độ Lộ Thân Phận 0..100 (100: "Cây ATM Biết Đi")
VAR duy_lua = 80               // 🔥 Lửa Đam Mê 0..100 (0: viết đơn nghỉ ngay trong đêm)

// ---------- Kỹ năng & đếm ----------
VAR duy_bi_day_viec = 0        // Số việc bị đẩy (≥ 15: mở khóa Nổi Loạn)
VAR duy_mo_noi_loan = false    // Đã mở khóa 😤 Nổi Loạn
VAR duy_so_lan_noi_loan = 0    // Số lần dùng Nổi Loạn
VAR duy_lan_goi_huong = 0      // Số lần dùng 🛡️ Gọi Chị Hương
VAR duy_so_lan_da = 0          // Số lần "Dạ em làm liền ạ"
VAR duy_so_nguoi_muon = 0      // Số người đã cho mượn tiền
VAR duy_muon_chuong = false    // Đã tính {dan_dau_tu} vào số người mượn
VAR duy_ngay_mac_giong_long = 0 // Số ngày mặc giống Long
VAR duy_an_do_thua = 0         // Số lần ăn đồ thừa sau họp
VAR duy_co_the_may_in = false  // Vật phẩm "Bạn Của Máy In"

// ---------- Cờ cốt truyện ----------
VAR duy_biet_y_tuong_bi_lay = false // Đã thấy "Người Gác Két" trên máy Oánh
VAR duy_doi_chat_oanh = false  // Đã đối chất với {bien_kich} về "Người Gác Két"
VAR duy_huong_biet = false     // {chi_dai} biết Duy từng làm ngân hàng
VAR duy_long_biet = false      // {con_ong_chau_cha} biết chuyện Duy
VAR duy_thay_chu_ky = false    // 22/10: thấy chữ ký của chính mình trên giấy thế chấp
VAR duy_hai_nguoi_biet_so = false // Nhánh "Hai Người Biết Sổ" với {ke_toan}
VAR duy_nhanh_nguoi_gac_ket = false // Nhánh bí mật "Người Gác Két" với {giam_doc}
VAR duy_nhan_loi_ngan_hang = false  // Nhận lời sếp cũ ngày 25/10
VAR duy_tu_choi_ngan_hang = false   // Từ chối lời sếp cũ ngày 25/10
VAR duy_tin_dung_hem_69 = false     // Chương ký giấy vay, trả đúng hạn
VAR duy_chuong_coi_la_thay = false  // Đoán trúng Hồng Coin sập
VAR duy_poster_loi = false     // Đã gửi giùm file poster lỗi của Hiếu
VAR duy_pha_am_muu_hieu = false // Phát hiện poster lỗi
VAR duy_y_tuong_24h = false    // Ý tưởng "24 Giờ Giúp Người" được duyệt
VAR duy_oanh_nghe_truoc = false // Oánh nghe lỏm ý tưởng trước cuộc họp
VAR duy_the_hong = false       // Kéo được tài trợ "Thẻ Hồng" từ ngân hàng cũ
VAR duy_giu_lai = false        // 30/10: được giữ lại làm nhân viên chính thức
VAR duy_ve_ngan_hang = false   // Lửa Đam Mê về 0, đã viết đơn nghỉ
VAR duy_toa_sang_2910 = false  // 29/10 điều phối công việc bằng giấy thành công
VAR duy_bi_lo_het = false      // Độ Lộ Thân Phận chạm 100: cả công ty biết
VAR duy_doc_danh_sach = false  // 26/10 đọc to danh sách 47 việc bị đẩy trước cả phòng
VAR duy_bat_gap_rong = false   // 28/10 nhận ra "Rồng" ở Sống Ảo là {con_ong_chau_cha}

// ============================================================
// HÀM TIỆN ÍCH RIÊNG CỦA DUY
// ============================================================

// Bị đẩy thêm n việc. Đủ 15 lần thì mở khóa 😤 Nổi Loạn.
=== function duy_day_viec(n) ===
~ duy_bi_day_viec = duy_bi_day_viec + n
{ duy_bi_day_viec >= 15:
    ~ duy_mo_noi_loan = true
}

// Đổi Độ Lộ Thân Phận. Chạm 100: cả công ty biết.
=== function duy_lo(n) ===
~ duy_do_lo = gioi_han(duy_do_lo + n)
{ duy_do_lo >= 100:
    ~ duy_bi_lo_het = true
    ~ phat_hien(duy_tung_lam_ngan_hang)
}

// Đổi Lửa Đam Mê. Về 0: Duy viết đơn nghỉ ngay trong đêm.
=== function duy_lua_doi(n) ===
~ duy_lua = gioi_han(duy_lua + n)
{ duy_lua <= 0:
    ~ duy_ve_ngan_hang = true
}

// Đổi Kinh Nghiệm và Độ Ngơ (giữ trong 0..100).
=== function duy_kn(n) ===
~ duy_kinh_nghiem = gioi_han(duy_kinh_nghiem + n)

=== function duy_ngo(n) ===
~ duy_do_ngo = gioi_han(duy_do_ngo + n)

// "Dạ em làm liền ạ!" (đếm cho thành tựu Dạ Một Trăm Lần)
=== function duy_da() ===
~ duy_so_lan_da = duy_so_lan_da + 1
