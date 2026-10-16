// ============================================================
// THÁNH NỊNH: NHI · biến & hàm riêng (tiền tố tn_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR tn_diem_ninh = 40          // 🙇 Sếp tin và quý Nhi tới đâu (0..100)
VAR tn_email_mat = 0           // 📧 Số bí mật đọc được từ hộp thư sếp
VAR tn_xanh_la_chuoi = 10      // 🟢 Đã dính vào LL tới đâu (0..100). Có sẵn thư mời phỏng vấn
VAR tn_gian_chi_dai = 60       // 🦁 Hương ghét Nhi tới đâu (0..100)

// ---------- Cuộc thi ngầm "Sếp gọi ai" ----------
VAR tn_sep_goi_nhi = 0
VAR tn_sep_goi_hieu = 0

// ---------- Đếm thành tựu ----------
VAR tn_so_cau_khen = 0         // 🤧 Hắt Hơi Có Tâm (30 câu)
VAR tn_so_email_doc = 0        // 📧 Hộp Thư Không Đáy (30 email)
VAR tn_so_lan_dap_duy = 0
VAR tn_ngay_cam_pantry = 0     // Bị Hương "cấm" ra pantry

// ---------- Cờ cốt truyện ----------
VAR tn_noi_that_1 = false      // Lần đầu nói thật với sếp (2/10)
VAR tn_noi_that_2 = false      // Tự thú với sếp (29/10 hoặc sớm hơn)
VAR tn_hoc_nghe_chi_dai = false   // Nhánh "Học Nghề Chị Đại"
VAR tn_tu_choi_ll = false
VAR tn_hai_mang = false        // Nhánh "Hai Mang" (tai mắt của LL)
VAR tn_bi_lo_hai_mang = false  // Bị Hiếu, Bảo hoặc Ngân phát hiện
VAR tn_nhan_viec_ll = false    // Nhận việc ở LL như nhân viên thật
VAR tn_mang_theo_bi_mat = false   // Đã đem bí mật của Thắng sang LL
VAR tn_don_nghi_viec = false   // Đã nộp đơn nghỉ việc đàng hoàng
VAR tn_email_gui_nham = false  // Email "Em đồng ý về LL ạ" tới tay toàn công ty
VAR tn_khuyen_viet_thu_genta = false
VAR tn_gui_lich_dem_hong = false
VAR tn_bao_truoc_loi_moi = false  // Đánh thức sếp sáng 27/10
VAR tn_chung_phong_chi_dai = false
VAR tn_dong_minh_ke_toan = false
VAR tn_gui_confession_the_chap = false
VAR tn_giu_tien_thoi = false
VAR tn_lo_luong_tre = false    // Đã kể chuyện lương trễ cho người khác
VAR tn_nhan_nham_shipper = false
VAR tn_dung_15_phut = false
VAR tn_chan_hua_tang_luong = false
VAR tn_sep_hoi_y_kien = false  // 23/10: sếp hỏi ý kiến thật
VAR tn_hoan_tac_thanh_cong = false
VAR tn_nhan_lich_ll = false    // Đã nhận lời "cộng tác đặc biệt" với LL
VAR tn_lam_mc = false          // 31/10: làm MC Đại Nhạc Hội (nhánh Lời Thật)

// ---------- Đồ vật riêng ----------
VAR tn_co_ghi_am_luu_luc = false  // Đoạn ghi âm Lưu Lực
VAR tn_co_hoa_sep = false         // Bó hoa sếp tự tặng mình (13/10)
VAR tn_co_son_mau_thu = false     // Thỏi son mẫu thử
VAR tn_co_banh_pia = false        // Hộp bánh pía
VAR tn_co_phieu_buffet = false
VAR tn_co_thu_moi_ll = true       // Thư mời phỏng vấn LL trong ngăn bàn
VAR tn_co_the_ll = false          // Thẻ nhân viên LL

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function tn_ninh(n) ===
~ tn_diem_ninh = gioi_han(tn_diem_ninh + n)

=== function tn_xanh(n) ===
~ tn_xanh_la_chuoi = gioi_han(tn_xanh_la_chuoi + n)

=== function tn_gian(n) ===
~ tn_gian_chi_dai = gioi_han(tn_gian_chi_dai + n)

=== function tn_email(n) ===
~ tn_email_mat = tn_email_mat + n
~ tn_so_email_doc = tn_so_email_doc + n

=== function tn_khen() ===
~ tn_so_cau_khen = tn_so_cau_khen + 1

=== function tn_sep_goi(ai) ===
{ ai == "nhi":
    ~ tn_sep_goi_nhi = tn_sep_goi_nhi + 1
- else:
    ~ tn_sep_goi_hieu = tn_sep_goi_hieu + 1
}

// Đạp Duy: Hương biết trong 1 ngày
=== function tn_dap_duy() ===
~ tn_so_lan_dap_duy = tn_so_lan_dap_duy + 1
~ qh("thuc_tap_sinh", -5)
~ tn_gian(10)
