// ============================================================
// THÁNH XIN NGHỈ: SƠN · biến & hàm riêng (tiền tố son_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR son_ngay_phep = -3        // 🗓️ Số ngày phép còn lại (bắt đầu âm 3)
VAR son_do_tin = 50           // 🎭 Mọi người còn tin lý do xin nghỉ tới đâu (0..100)
VAR son_bi_soi = 20           // 👁️ HR Tuấn đang theo dõi tới đâu (0..100)
VAR son_giac_mo = 20          // 🎤 Tiến độ ở "Giọng Ca Ước Mơ" (0..100)

// ---------- Cờ "chạm mốc" (kết thúc dùng) ----------
VAR son_tung_soi_100 = false  // Độ Bị Soi từng chạm 100

// ---------- Đếm lý do & ngày nghỉ ----------
VAR son_lan_ba_ngoai = 7      // 👵 Số lần dùng lý do "bà ngoại ốm" trong năm
VAR son_so_lan_nghi = 31      // Tổng số lần xin nghỉ trong năm
VAR son_nghi_tu_15 = false    // Có nghỉ ngày nào từ 15/10 tới 30/10
VAR son_ngay_di_lam_lien = 0  // 🗓️ Kỳ Tích Văn Phòng
VAR son_goi_hoan_hao = 0      // 🎭 Diễn Viên Gạo Cội
VAR son_so_giay_nghi_om = 0   // 🏥 Khách VIP Khỏe Re
VAR son_the_ly_do_moi = false // Thẻ "Lý Do Mới"
VAR son_gat_lua_tron = false  // 🌾 Gặt Lúa Ở Đài Truyền Hình

// ---------- Cuộc thi "Giọng Ca Ước Mơ" ----------
VAR son_co_do_kim_tuyen = false
VAR son_muon_vest_phat = false
VAR son_vong_2 = false        // Đã đi ghi hình vòng 2 (14/10)
VAR son_vao_chung_ket = false
VAR son_bi_bao_ghi_am = false // Bảo ghi âm lúc tập lén
VAR son_hat_lua_trai = false  // 🦀 Ca Sĩ Lửa Trại
VAR son_hat_do_lua_trai = false
VAR son_song_ca_lua_trai = false
VAR son_di_vung_tau = true
VAR son_khach_moi_bi_mat = false // Tự ghi tên "khách mời bí mật" ngày 20/10

// ---------- Ai biết bí mật ----------
VAR son_nguyen_biet = false   // Nguyên biết Sơn Kim Tuyến (16/10)
VAR son_nguyen_mat_danh = false  // Nguyên gọi "Đặc vụ Kim Tuyến"
VAR son_moi_nguyen_khach_moi = false
VAR son_thai_biet = false     // Thái biết trước 27/10
VAR son_thay_anh_phat = false // Đã thấy ảnh Phát trong ngăn kéo nhà Thái
VAR son_biet_so_604 = false   // 💖 Fan Cứng Bất Đắc Dĩ
VAR son_tu_thu_tuan = false   // Tự thú với HR Tuấn
VAR son_bao_giup = false      // Bảo hứa giúp nối sóng
VAR son_lo_tren_livestream = false

// ---------- Lịch & chiến dịch ----------
VAR son_khung_gio_giup_nguoi = false
VAR son_lich_chong_cheo_tuan_cuoi = false
VAR son_hieu_biet_lich = false
VAR son_tuan_khong_chong = 0

// ---------- Cuối tháng ----------
VAR son_don_nghi_viec_that = false
VAR son_ky_cam_ket = false
VAR son_chon_dem_31 = ""      // "o_lai" / "di_thi" / "nghi_om" / "ca_hai" / "noi_song"
VAR son_thai_chon = ""        // "o_lai" / "di" / "chua_ro"

// ============================================================
// HÀM
// ============================================================
=== function son_gioi_han(x) ===
{ x > 100:
    ~ return 100
}
{ x < 0:
    ~ return 0
}
~ return x

=== function son_soi(n) ===
~ son_bi_soi = son_gioi_han(son_bi_soi + n)
{ son_bi_soi >= 100:
    ~ son_tung_soi_100 = true
}

=== function son_tin(n) ===
~ son_do_tin = son_gioi_han(son_do_tin + n)

=== function son_mo(n) ===
~ son_giac_mo = son_gioi_han(son_giac_mo + n)

// Xin nghỉ một ngày: trừ phép, đếm lần nghỉ, đánh dấu nếu từ 15/10
=== function son_xin_nghi() ===
~ son_ngay_phep = son_ngay_phep - 1
~ son_so_lan_nghi = son_so_lan_nghi + 1
~ son_ngay_di_lam_lien = 0
{ ngay >= 15 && ngay <= 30:
    ~ son_nghi_tu_15 = true
}

// Dùng lá bài "bà ngoại ốm": lần sau yếu hơn
=== function son_ba_ngoai() ===
~ son_lan_ba_ngoai = son_lan_ba_ngoai + 1
{ son_lan_ba_ngoai >= 10:
    ~ son_tin(-15)
- else:
    ~ son_tin(-5)
}

// Một ngày đi làm đủ
=== function son_di_lam() ===
~ son_ngay_di_lam_lien = son_ngay_di_lam_lien + 1
~ son_soi(-2)
