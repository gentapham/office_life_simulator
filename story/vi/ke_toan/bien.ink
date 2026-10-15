// ============================================================
// KẾ TOÁN: THƯƠNG · biến riêng (tiền tố kt_)
// Quỹ Công Ty và Quỹ Đen tính bằng TRIỆU đồng.
// Tiền túi của Thương dùng biến chung `tien`.
// ============================================================

// ---------- Chỉ số chính ----------
VAR kt_quy_cong_ty = 2000      // 💰 triệu đồng, sau khi trả nợ ngày 1/10
VAR kt_quy_den = 250           // 🗄️ triệu đồng, mục tiêu 297
VAR kt_mat_ngu = 30            // 😵 0..100
VAR kt_do_keo = 60             // 🧾 0..100
VAR kt_dau_vet = 0             // số dấu vết quỹ đen người khác có (đủ 3 là lộ)
VAR kt_lan_ngat = 0            // số lần Độ Mất Ngủ chạm 100
VAR kt_dang_nam_vien = false   // đang nằm Phòng khám Khỏe Re 2 ngày
VAR kt_hoa_don_dau_em = 0      // đếm câu "Hóa đơn đâu em?"
VAR kt_so_hoa_don_gia = 0      // số hóa đơn giả của Huyền bắt được

// ---------- Quỹ đen ----------
VAR kt_quy_den_lo = false      // quỹ đen đã bị lộ
VAR kt_tu_khai = false         // tự khai chủ động (với Thắng hoặc chú Liêm)
VAR kt_lo_boi_nguoi_khac = false
VAR kt_quy_den_nop = false     // đã nộp lại vào sổ chung
VAR kt_huong_biet_quy_den = false
VAR kt_phong_bi_1010 = false   // 10/10 bỏ phong bì trả lương sớm

// ---------- Trang 47 / 47b ----------
VAR kt_keo_tay_ao = false      // 1/10 kéo tay áo Thắng lần nữa
VAR kt_thang_doc_47 = false    // Thắng đã tự đọc trang 47
VAR kt_trang_47_tu_lanh = false // dán "trang 47 chữ cỡ 20" lên tủ lạnh
VAR kt_ke_huong = 0            // 15/10: 0 không kể, 1 kể chuyện quỹ đen, 2 kể trang 47
VAR kt_ran_doc_nghe_47 = false // Hiếu nghe lén chuyện trang 47 ở pantry 15/10
VAR kt_manh_moi_47b = false
VAR kt_mo_nhanh_47b = false
VAR kt_ky_thang_47b = false
VAR kt_nhan_chung_47b = ""     // "chi_dai" / "bac_bao_ve"
VAR kt_47b_hieu_luc = false
VAR kt_pha_chien_dich = false  // đã cố tình chặn / duyệt chi để phá chiến dịch

// ---------- Chiến dịch & công việc ----------
VAR kt_tam_ung_huyen = 0       // 0 từ chối, 5 hoặc 50 (triệu)
VAR kt_bat_bai_huyen = false   // 🔒 đã "Đọc Chữ Cỡ 6" hồ sơ của Huyền
VAR kt_duyet_qc = false
VAR kt_duyet_gameshow = false
VAR kt_hong_0_dong = false
VAR kt_qua_thue = false
VAR kt_bi_phat_thue = false
VAR kt_ll_email = 0            // 1 hỏi hóa đơn, 2 để đó, 3 chuyển cho Thắng
VAR kt_co_but_bi = false       // hộp bút bi (minigame Ba Chữ Ký)
VAR kt_chu_ky = 0              // số chữ ký đã săn được cho đơn bút bi
VAR kt_ngan_sach_vung_tau = 60

// ============================================================
// HÀM RIÊNG
// ============================================================
// Độ Mất Ngủ: chạm 100 thì ngất, nằm viện 2 ngày, đếm lần ngất.
=== function kt_ngu(n) ===
~ kt_mat_ngu = kt_mat_ngu + n
{ kt_mat_ngu >= 100:
    ~ kt_lan_ngat = kt_lan_ngat + 1
    ~ kt_dang_nam_vien = true
    ~ kt_mat_ngu = 70
}
{ kt_mat_ngu < 0:
    ~ kt_mat_ngu = 0
}

=== function kt_keo(n) ===
~ kt_do_keo = gioi_han(kt_do_keo + n)

=== function kt_quy(n) ===
~ kt_quy_cong_ty = kt_quy_cong_ty + n

=== function kt_cat_ket(n) ===
~ kt_quy_den = kt_quy_den + n

=== function kt_them_dau_vet(n) ===
{ kt_tu_khai:
    ~ return
}
~ kt_dau_vet = kt_dau_vet + n
{ kt_dau_vet >= 3 && not kt_quy_den_lo:
    ~ kt_quy_den_lo = true
    ~ kt_lo_boi_nguoi_khac = true
    ~ phat_hien(quy_den_thuong)
}

=== function kt_hoa_don() ===
~ kt_hoa_don_dau_em = kt_hoa_don_dau_em + 1
~ kt_keo(3)
