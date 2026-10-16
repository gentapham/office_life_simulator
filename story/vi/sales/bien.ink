// ============================================================
// SALES NÓI PHÉT: HUYỀN · biến riêng (tiền tố sl_)
// ============================================================

// ---------- Chỉ số chính (docs/roles/sales.md, mục 2) ----------
VAR sl_kpi_giay = 300          // 📊 KPI Trên Giấy (%)
VAR sl_kpi_that = 0            // 📉 KPI Thật, tính bằng TRIỆU đồng (1 tỷ = 1000)
VAR sl_bong_bong = 20          // 🎈 Bong Bóng Phét 0..100 (bắt đầu 20 sau lời phét ngày 1/10). Chạm 100: bể
VAR sl_tam_ung = 0             // 💳 Sổ Tạm Ứng chưa có hóa đơn (đồng)

// ---------- Nợ & tiền ----------
VAR sl_no_chuong = 5000000     // Chương còn nợ (đồng)
VAR sl_chuong_lam_ngo = false  // Chương làm ngơ minigame Báo Cáo Thứ 6 tới hết tháng
VAR sl_no_thuong = false       // nợ Thương một lần (22/10)

// ---------- Đếm cho thành tựu ----------
VAR sl_tin_chi_di = 0          // số người lớn tuổi hơn bị thuyết phục bằng "Tin chị đi"
VAR sl_hoi_hoa_don = 0         // số lần bị hỏi "Hóa đơn đâu em?"
VAR sl_so_dia_oc = 0           // số dĩa ốc nhận tiền tài trợ
VAR sl_noi_that = 0            // số lần nói thật
VAR sl_mo_noi_that = false     // kỹ năng ẩn Nói Thật (mở sau chương 3)

// ---------- Deal ma BTT Global ----------
VAR sl_btt_dat_ten = false   // đã nói tên BTT Global & Mr. Kevin Trộn (2/10)
VAR sl_btt_cong_bo = false     // công bố BTT Global tài trợ (9/10)
VAR sl_bang_khen_btt = false   // tặng Thắng bằng khen BTT (13/10)
VAR sl_hoa_btt = false         // tự đặt hoa "Mr. Kevin Trộn" (20/10)
VAR sl_tu_nhan_btt_gia = false // tự nhận BTT Global là giả trước 30/10
VAR sl_bi_mat_lo = false       // bí mật của Huyền hoặc Quỳnh đã bị lộ
VAR sl_kevin_dien_vien = ""    // "thuc_tap_sinh" | "dan_dau_tu" | "bac_bao_ve"
VAR sl_kevin_thanh_cong = false
VAR sl_btt_xu_huong = false    // "BTT Global" lên xu hướng sau livestream 23/10
VAR sl_duy_xem_hop_dong = false

// ---------- Deal thật ----------
VAR sl_quan_oc_deal = false    // Quán Ốc Đêm nhận gói tài trợ (7/10)
VAR sl_nail_logo_buc = false   // bán suất "logo trên bục" cho Tiệm Nail Lung Linh (16/10)
VAR sl_tin_cuoc_goi = false    // tin cuộc gọi Sữa Chua Hồng Hào (27/10)
VAR sl_chung_minh_cuoc_goi = false // bật loa ngoài cho cả phòng nghe
VAR sl_ky_sua_chua = false     // ký deal Sữa Chua Hồng Hào
VAR sl_kpi_giay_2810 = 0       // chụp lại KPI Trên Giấy ngày 28/10

// ---------- Lời hứa ----------
VAR sl_hua_ca_si = false       // hứa "ca sĩ nổi tiếng nhất nước" (17/10)
VAR sl_goi_y_phat = false      // gợi ý Phát hát "Công Viên" remix
VAR sl_phat_nhan_loi = false   // Phát nhận lời hát Đại Nhạc Hội Siêu Nhân

// ---------- Đồng minh ----------
VAR sl_quynh_cat_dut_ll = false

// ---------- Đồ vật riêng ----------
VAR sl_co_voucher_nail = false
VAR sl_co_mi_cao_cap = false   // Gói Mì "Cao Cấp" (mì gói trong bát sứ)
VAR sl_so_voucher_oc = 0
VAR sl_co_thung_nuoc_ngot = false

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function sl_phet(n) ===
~ sl_bong_bong = gioi_han(sl_bong_bong + n)

=== function sl_giay(n) ===
~ sl_kpi_giay = sl_kpi_giay + n
{ sl_kpi_giay < 0:
    ~ sl_kpi_giay = 0
}

// n tính bằng triệu đồng
=== function sl_that(n) ===
~ sl_kpi_that = sl_kpi_that + n

=== function sl_ung(n) ===
~ tien_cong(n)
~ sl_tam_ung = sl_tam_ung + n

=== function sl_chuong_tra(n) ===
~ tien_cong(n)
~ sl_no_chuong = sl_no_chuong - n
{ sl_no_chuong < 0:
    ~ sl_no_chuong = 0
}

=== function sl_that_long() ===
~ sl_noi_that = sl_noi_that + 1
~ sl_phet(-5)
