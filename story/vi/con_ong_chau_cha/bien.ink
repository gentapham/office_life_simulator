// ============================================================
// CON ÔNG CHÁU CHA: LONG · biến & hàm riêng (tiền tố long_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR long_o_du = 90              // ☂️ Ô Dù (0..100), bắt đầu 90
VAR long_bai_hat = 0            // 🎵 Bài Hát Bí Mật "Hồng Là Thái Độ" (0..100%)
VAR long_tu_lap = 0             // 💪 Độ Tự Lập (0..100)
VAR long_the_phu = 20000000     // 💳 Thẻ Phụ: hạn mức còn lại (đồng). 12/10 về 0

// ---------- Đếm hành vi ----------
VAR long_so_lan_goi_chu = 0     // ☂️ số lần "Để anh gọi chú anh" (thành tựu Dù To: 15)
VAR long_so_ca_lam_them = 0     // 🛵 số ca làm thêm dưới tên "Rồng"
VAR long_bi_phat_hien_lam_them = false
VAR long_so_nhan_hang = 0       // 🤝 số nhãn hàng trong quận đã chốt
VAR long_so_lan_check_in = 0
VAR long_so_nguoi_thay_the_tu_choi = 0   // 💳 thành tựu Thẻ Bị Từ Chối
VAR long_ngay_khong_nhac_chu = false     // 🌧️ thành tựu Mưa Không Dù

// ---------- Cờ cốt truyện ----------
VAR long_duyet_ke_hoach = false         // đã làm thật minigame Duyệt Kế Hoạch Marketing
VAR long_co_chung_chi = false           // chứng chỉ "Quản Lý Có Tâm"
VAR long_mo_phong_thu_nhat = false      // nhánh "Phòng thu tầng 30" với Nhật
VAR long_ke_nhat_khong_muon_ghe = false // 27/10 nói với Nhật "Ông muốn cái ghế thì lấy đi"
VAR long_nhat_nghe_demo = false         // Nhật đã lên tầng 30 nghe demo
VAR long_mo_nhanh_ai_hat = false        // nhánh "Ai Hát Bài Này?" (Phát biết bài)
VAR long_phat_co_ghi_am = false         // Phát còn giữ 20 giây ghi âm ngày 15/10
VAR long_biet_phat_no = false           // biết Phát đang nợ tiền
VAR long_hua_song_ca_ghi_ten = false    // mở lựa chọn "song ca có ghi tên"
VAR long_ban_cho_ll = false             // bán bài cho LL 27/10
VAR long_tang_bai_nguyen = false        // đã tặng bài cho Siêu Nhân Hồng
VAR long_nguoi_hat = ""                 // "nguyen", "song_ca", "phat", "" (không ai hát)
VAR long_ghi_ten = false                // màn hình Đại Nhạc Hội Siêu Nhân có "Nhạc & lời: Long"
VAR long_bai_phat_hanh = false          // bài hát được phát hành / hát công khai
VAR long_nhan_ghe = false               // nhận ghế Phó Giám đốc
VAR long_tu_choi_ghe = false
VAR long_de_cu_nhat = false             // 30/10 Long đề cử Nhật
VAR long_nhat_de_cu_long = false        // 30/10 Nhật đề cử Long
VAR long_biet_penthouse_ban = false
VAR long_biet_chu_no = false            // biết chú thế chấp biệt thự / đang nợ
VAR long_noi_chuyen_that_voi_chu = false
VAR long_gop_von_chuong = 10000000      // "vốn góp chung" cũ với Chương (Long quên mất)
VAR long_dau_tu_moi = 0                 // tiền mới bỏ vào kèo của Chương
VAR long_the_bi_tu_choi = false
VAR long_nghi_duy = false               // tin mật mờ "Duy giấu gì đó"
VAR long_qua_nguyen = ""                // "dong_ho", "usb_demo", "khac"
VAR long_ghi_am_luu_luc = false         // đã ghi âm tin nhắn của Lưu Lực
VAR long_ban_thu_cuoi_kip = false       // 29/10 mang ổ cứng tới phòng Lĩnh kịp

// ---------- Đồ riêng ----------
VAR long_co_dan = true                  // cây đàn ghi-ta
VAR long_co_phieu_oc = false            // phiếu ăn ốc 2 người (Quán Ốc Đêm)
VAR long_co_phieu_gym = false           // phiếu tập gym 1 tuần (Cơ Bắp Ảo)
VAR long_co_phieu_nail = false          // phiếu làm móng (Lung Linh)
VAR long_co_banh_pia = false

// ============================================================
// HÀM RIÊNG
// ============================================================

=== function long_od(n) ===
~ long_o_du = long_kep(long_o_du + n)

=== function long_bh(n) ===
~ long_bai_hat = long_kep(long_bai_hat + n)

=== function long_tl(n) ===
~ long_tu_lap = long_kep(long_tu_lap + n)

// ☂️ "Để anh gọi chú anh"
=== function long_goi_chu() ===
~ long_so_lan_goi_chu = long_so_lan_goi_chu + 1
~ long_od(5)
~ long_tl(-10)
~ long_ngay_khong_nhac_chu = false

// 💳 Quẹt thẻ phụ. Trả về true nếu thẻ còn đủ hạn mức.
=== function long_quet(n) ===
{ ngay >= 12:
    ~ long_the_phu = 0
}
{ long_the_phu >= n:
    ~ long_the_phu = long_the_phu - n
    ~ long_tl(-3)
    ~ return true
}
~ return false

=== function long_kep(x) ===
{ x > 100:
    ~ return 100
}
{ x < 0:
    ~ return 0
}
~ return x
