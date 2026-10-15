// ============================================================
// GIÁM ĐỐC: THẮNG · biến riêng (tiền tố gd_)
// Tiền công ty (Ngân Sách) tính bằng TRIỆU đồng.
// Tiền túi của Thắng dùng biến chung `tien` (ví khởi đầu 850.000đ, game đặt).
// ============================================================

// ---------- Chỉ số chính ----------
VAR gd_ngan_sach = 2000        // 💼 triệu đồng, sau khi trả nợ ngày 1/10
VAR gd_uy_quyen = 50           // 👑 0..100
VAR gd_lo_no = 20              // 🏚️ Nguy Cơ Lộ Nợ 0..100
VAR gd_hua_leo = 0             // 🤥 số lời hứa chưa giữ
VAR gd_so_lan_tuy_em = 0       // đếm câu "Anh không ép, tùy em"
VAR gd_nhan_vien_bo_di = 0     // số người đã nộp đơn sang LL (Hứa Lèo ≥ 5)

// ---------- Chương 1: Vali tiền ----------
VAR gd_ky_khong_doc = false
VAR gd_doc_trang_47 = false
VAR gd_bene_tuat = false       // 4/10 bênh chó của Bác Bình
VAR gd_tra_binh = 0            // số buổi tối uống trà với Bác Bình

// ---------- Chương 2: Hoa Hướng Dương 1989 ----------
VAR gd_dung_clone = false      // đã đăng nhập tài khoản clone
VAR gd_nghi_clone = 0          // Độ nghi "bông hoa" trong group 0..100
VAR gd_danh_sach_den = 0       // số người bị ghi vào Danh sách đen
VAR gd_da_tra_thu = false      // đã trả thù ai đó trong group
VAR gd_sua_minh = 0            // số điều bị chê mà sếp đã sửa (cần ≥ 5)
VAR gd_sua_nhan_22h = false
VAR gd_sua_hop_ngan = false
VAR gd_sua_luong_dung_han = false
VAR gd_sua_tieng_anh = false
VAR gd_sua_tra_sua = false
VAR gd_sua_ke_chuyen = false
VAR gd_duyet_qc_mv = false
VAR gd_cam_dong_ho = false
VAR gd_dong_ho_bi_thay = false

// ---------- Chương 3: Tối om ----------
VAR gd_noi_that_huong = false  // nói thật chuyện nợ với Hương trong thang máy
VAR gd_mua_gameshow = false
VAR gd_tim_nguyen_1410 = false

// ---------- Chương 4: Sếp đi biển ----------
VAR gd_xe_45_cho = false
VAR gd_noi_that_lua_trai = false
VAR gd_doc_thu_g = false
VAR gd_cat_thu_g = false       // nhờ bác cất thư, hết tháng mới đọc
VAR gd_hua_tang_luong_20 = false
VAR gd_giu_loi_20 = false
VAR gd_clip_vung_tau = false   // clip say hứa tăng lương ở Vũng Tàu
VAR gd_qua_20_10 = ""          // "giong_nhau" / "khac_nhau" / "khong_mua"

// ---------- Chương 5: Thuế, bánh kem và gấp ba ----------
VAR gd_tham_nha_binh = false   // đã ghé nhà vườn Ven Đô, thấy tủ gỗ
VAR gd_nguoi_giu_chia_khoa = false
VAR gd_viet_thu_hoi_am = false // đã gửi thư thú nhận trước 25/10
VAR gd_tu_thu = false
VAR gd_nguoi_tiep_thue = ""    // "ke_toan" / "thanh_ninh" / "giam_doc"
VAR gd_qua_thue = false
VAR gd_noi_that_nguyen = false // 27/10 nói thật với Nguyên
VAR gd_ll_moi_thang = false    // đã nhận email gấp ba đêm 26/10

// ---------- Chương 6: Ngày phán xét ----------
VAR gd_hoi_truc_tiep = 0       // 29/10 số người sếp xuống hỏi trực tiếp
VAR gd_cong_khai_hoa = false   // tự công khai "Hoa Hướng Dương 1989"
VAR gd_pho_giam_doc = ""       // mã người được chọn làm Phó Giám đốc

// ---------- Vật phẩm riêng ----------
VAR gd_co_ao_golf = false
VAR gd_co_lich_ngan_hang = false
VAR gd_so_lan_thua_golf = 0

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function gd_uy(n) ===
~ gd_uy_quyen = gioi_han(gd_uy_quyen + n)

=== function gd_no(n) ===
~ gd_lo_no = gioi_han(gd_lo_no + n)

=== function gd_tien_cty(n) ===
~ gd_ngan_sach = gd_ngan_sach + n

=== function gd_hua() ===
~ gd_hua_leo = gd_hua_leo + 1

=== function gd_giu_loi() ===
{ gd_hua_leo > 0:
    ~ gd_hua_leo = gd_hua_leo - 1
}
~ gd_uy(10)

=== function gd_tuy_em(ma) ===
~ gd_so_lan_tuy_em = gd_so_lan_tuy_em + 1
~ qh(ma, -5)

=== function gd_sua(loai) ===
{ loai:
- "nhan_22h":
    { not gd_sua_nhan_22h:
        ~ gd_sua_nhan_22h = true
        ~ gd_sua_minh = gd_sua_minh + 1
    }
- "hop_ngan":
    { not gd_sua_hop_ngan:
        ~ gd_sua_hop_ngan = true
        ~ gd_sua_minh = gd_sua_minh + 1
    }
- "luong_dung_han":
    { not gd_sua_luong_dung_han:
        ~ gd_sua_luong_dung_han = true
        ~ gd_sua_minh = gd_sua_minh + 1
    }
- "tieng_anh":
    { not gd_sua_tieng_anh:
        ~ gd_sua_tieng_anh = true
        ~ gd_sua_minh = gd_sua_minh + 1
    }
- "tra_sua":
    { not gd_sua_tra_sua:
        ~ gd_sua_tra_sua = true
        ~ gd_sua_minh = gd_sua_minh + 1
    }
- "ke_chuyen":
    { not gd_sua_ke_chuyen:
        ~ gd_sua_ke_chuyen = true
        ~ gd_sua_minh = gd_sua_minh + 1
    }
}
