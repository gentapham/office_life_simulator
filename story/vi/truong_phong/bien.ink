// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT · biến & hàm riêng (tiền tố tp_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR tp_so_cuoc_hop = 0        // 📅 Số Cuộc Họp: chỉ tăng, không bao giờ giảm
VAR tp_ghe_pho = 40           // 🪑 Điểm Ghế Phó (0..100)
VAR tp_do_lo = 10             // 🎞️ Độ Lộ (0..100). Đạt 100 là lộ bài
VAR tp_tay_nghe = 0           // 🛠️ Tay Nghề Thật (0..100), không bao giờ giảm

// ---------- Đếm theo ngày (để tính "quá 3 cuộc họp một ngày") ----------
VAR tp_ngay_dem_hop = 0
VAR tp_hop_hom_nay = 0
VAR tp_so_ngay_hop_qua_tai = 0

// ---------- Đếm hành vi ----------
VAR tp_so_lan_ghi_cong = 0    // 🙏 số lần Ghi Công cho người làm thật
VAR tp_so_lan_nhan_cong = 0   // 🎭 số lần Nhận Công
VAR tp_so_hieu_nham = 0       // 🍜 số lần hiểu nhầm Bắc – Nam
VAR tp_so_bai_hoc_dem = 0     // 🌙 số bài học lén dựng phim đã xong
VAR tp_so_lan_take_note = 0   // 📝 số vấn đề bị đẩy sang "cuộc họp sau"
VAR tp_so_lan_cai_long = 0    // số lần cãi nhau với Long trước mặt người khác

// ---------- Cờ cốt truyện ----------
VAR tp_mv_dung_han = false            // MV ra mắt đúng 9/10
VAR tp_mv_tre = false
VAR tp_gameshow_xong = false          // clip highlight gameshow 16/10 đã đăng
VAR tp_mo_phong_thu = false           // nhánh "Phòng thu tầng 30"
VAR tp_mo_ca_dem = false              // nhánh "Ca đêm hai người" với Lĩnh
VAR tp_giup_long_trinh_bay = false    // đã giúp Long trình bày bài hát với Thắng
VAR tp_biet_long_khong_muon_ghe = false
VAR tp_biet_linh_la_cu_dem = false    // biết kênh "Cú Đêm Cắt Ghép" là của Lĩnh
VAR tp_noi_that_duoi_nen = false      // 15/10 nói thật trong ánh nến
VAR tp_giu_hop_nen = false            // giữ cuộc họp tới hết buổi mất điện
VAR tp_hop_ve_giam_hop = false        // 🏆 Họp Về Họp
VAR tp_hop_5_phut_that = false        // 🏆 5 Phút Thật
VAR tp_lich_trong = false             // 🏆 Lịch Trống (29/10)
VAR tp_huy_hieu_tu_render = false     // 🏆 Tự Tay Render
VAR tp_kiet_suc = false               // Stress đầy giữa một cuộc họp
VAR tp_de_cu_long = false             // 30/10 Nhật đề cử Long
VAR tp_long_de_cu_tp = false          // 30/10 Long đề cử Nhật
VAR tp_pho_giam_doc = ""              // "tp", "long", "ca_hai", "trong"
VAR tp_linh_nghi_om = false           // Lĩnh nghỉ ốm (sau khi bị lay dậy 16/10)
VAR tp_so_video_toptop = 0            // chuỗi "Một ngày của Siêu Nhân Hồng" (tối đa 5)
VAR tp_vu_giu_bi_mat = false          // Nhật và Vũ giữ bí mật của nhau
VAR tp_qua_20_10 = ""                 // quà 20/10 cho Oánh và Quỳnh
VAR tp_ban_nhap_so = 14               // số lần sửa đơn xin đề bạt
VAR tp_dao_dien_dem_hong_ok = false
VAR tp_cat_kip_banh_kem = false
VAR tp_quay_ba_cu = false              // 6/10 đuổi theo quay cảnh giúp bà cụ

// ---------- Đồ riêng ----------
VAR tp_co_bang_trang_gap = true       // bảng trắng gấp gọn mang đi Vũng Tàu
VAR tp_co_banh_bong_lan = false
VAR tp_co_banh_quy = false
VAR tp_co_so_ke_o = true

// ============================================================
// HÀM RIÊNG
// ============================================================

// Triệu tập n cuộc họp. Quá 3 cuộc một ngày: nội dung ra chậm, cả phòng stress.
=== function tp_hop(n) ===
{ tp_ngay_dem_hop != ngay:
    ~ tp_ngay_dem_hop = ngay
    ~ tp_hop_hom_nay = 0
}
~ tp_so_cuoc_hop = tp_so_cuoc_hop + n
~ tp_hop_hom_nay = tp_hop_hom_nay + n
{ tp_hop_hom_nay > 3 && tp_hop_hom_nay - n <= 3:
    ~ follow(-5000)
    ~ tp_so_ngay_hop_qua_tai = tp_so_ngay_hop_qua_tai + 1
}
~ an(-3 * n)
~ uong(-3 * n)
{ stress >= 100:
    ~ tp_kiet_suc = true
}

// Lịch họp cố định mỗi ngày làm việc (giao ban, sync, rà soát…): 3 cuộc, không tính vào "quá tải"
=== function tp_lich_co_dinh() ===
~ tp_so_cuoc_hop = tp_so_cuoc_hop + 3

=== function tp_ghe(n) ===
~ tp_ghe_pho = tp_kep(tp_ghe_pho + n)

=== function tp_lo(n) ===
~ tp_do_lo = tp_kep(tp_do_lo + n)

=== function tp_tn(n) ===
{ n > 0:
    ~ tp_tay_nghe = tp_kep(tp_tay_nghe + n)
}

=== function tp_ghi_cong() ===
~ tp_so_lan_ghi_cong = tp_so_lan_ghi_cong + 1

=== function tp_nhan_cong() ===
~ tp_so_lan_nhan_cong = tp_so_lan_nhan_cong + 1
~ tp_lo(10)

=== function tp_hieu_nham() ===
~ tp_so_hieu_nham = tp_so_hieu_nham + 1

// Cả phòng Sản xuất (Vũ, Oánh, Lĩnh, Quỳnh, Duy)
=== function tp_ca_phong(d) ===
~ qh("chua_te_deadline", d)
~ qh("bien_kich", d)
~ qh("editor", d)
~ qh("designer", d)
~ qh("thuc_tap_sinh", d)

=== function tp_kep(x) ===
{ x > 100:
    ~ return 100
}
{ x < 0:
    ~ return 0
}
~ return x
