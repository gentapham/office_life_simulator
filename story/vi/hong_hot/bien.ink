// ============================================================
// THÁNH HÓNG: NGÂN · biến & hàm riêng (tiền tố hh_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR hh_kho_tin = 0            // 📦 Kho Tin Mật
VAR hh_kin_mieng = 20         // 🤐 Độ Kín Miệng (0..100)
VAR hh_lo_admin = 10          // 🕶️ Độ Lộ Admin (0..100). 100 = lộ
VAR hh_tuong_tac = 0          // 📱 Tương Tác Fanpage (0..100)
VAR hh_dong_gop = 0           // Người theo dõi Ngân góp cho Siêu Nhân Hồng

// ---------- Đếm ----------
VAR hh_chuoi_gio_vang = 0     // Số ngày liên tiếp đăng bài giờ vàng
VAR hh_so_tin_cap_cao_giu = 0 // Số tin cấp cao giữ kín được
VAR hh_tin_don_ve_ngan = 0    // Số người đã nghe tin đồn về chính Ngân
VAR hh_so_live_sach = 0       // 🔴 Live Không Nhầm (10 lần)
VAR hh_pin_doi_tin = 0        // 🔋 Ông Trùm Pin Dự Phòng (6 tin ngày 15/10)

// ---------- Tin cấp cao đang giữ kín ----------
VAR hh_giu_trang_47 = false
VAR hh_giu_no_sep = false
VAR hh_giu_hieu_ech = false
VAR hh_giu_nhi_ll = false

// ---------- Cờ cốt truyện ----------
VAR hh_go_tuong = false              // Mở hành động "gõ tường" với Hiếu
VAR hh_moi_hieu_vao_group = false
VAR hh_mo_nhanh_hoa_huong_duong = false
VAR hh_biet_hoa_la_sep = false       // 🌻 Đã biết Hoa Hướng Dương 1989 là ai
VAR hh_tuat_noi_hon_nguyen = false
VAR hh_dang_bai_luong_tre = false
VAR hh_bao_giu_kin = false           // Bảo giữ kín bí mật admin cho Ngân
VAR hh_dang_bai_the_chap = false     // Đăng bài bóc phốt 21/10
VAR hh_conf_ac_cuoi_thang = false    // Đăng confession làm tổn thương đồng nghiệp trong 10 ngày cuối
VAR hh_live_nham_hop = false         // Livestream nhầm cuộc họp có chữ "nợ" / "trang 47"
VAR hh_lo_mat_nguyen = false         // Giữ góc máy lúc Nguyên tháo mũ 17/10
VAR hh_tat_live_lua_trai = false
VAR hh_phat_wifi_ca_cty = false
VAR hh_nhanh_nguoi_doc_email = false // Nhánh "Người đọc email sếp" (thú nhận với Tuấn)
VAR hh_biet_email_tuan = false       // Tin "email chưa gửi của Tuấn"
VAR hh_nhan_vien_moi = false         // Được hứa đề bạt trưởng nhóm
VAR hh_co_so_oanh = false            // Nhặt được sổ ghi chép của Oánh trên xe

// ============================================================
// HÀM RIÊNG
// ============================================================
// Người theo dõi do Ngân góp (tính cả phần đóng góp riêng)
=== function hh_follow(n) ===
~ follow(n)
~ hh_dong_gop = hh_dong_gop + n

=== function hh_kin(n) ===
~ hh_kin_mieng = gioi_han(hh_kin_mieng + n)

=== function hh_lo(n) ===
~ hh_lo_admin = gioi_han(hh_lo_admin + n)

=== function hh_tin(n) ===
~ hh_kho_tin = hh_kho_tin + n

=== function hh_tt(n) ===
~ hh_tuong_tac = gioi_han(hh_tuong_tac + n)

// "Nghe Gì Chưa?": kể một tin mật cho người khác
=== function hh_ke_tin() ===
~ hh_kin(-5)

// Tin đồn về chính Ngân lan thêm n người
=== function hh_bi_don(n) ===
~ hh_tin_don_ve_ngan = hh_tin_don_ve_ngan + n

// Giữ kín một tin cấp cao
=== function hh_giu_tin_cap_cao() ===
~ hh_so_tin_cap_cao_giu = hh_so_tin_cap_cao_giu + 1
~ hh_kin(10)
