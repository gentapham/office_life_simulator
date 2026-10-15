// ============================================================
// HR: TUẤN · biến & hàm riêng (tiền tố hr_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR hr_danh_sach_den = 0      // 📓 Số tên trong danh sách cắt giảm (0..21)
VAR hr_han_chot = 7           // Số tên Thắng đòi trước 26/10 (có thể giảm còn 6)
VAR hr_do_dang_so = 70        // 😨 Cả công ty sợ Tuấn tới đâu (0..100)
VAR hr_do_lang_nghe = 15      // 🍵 Bao nhiêu người thật sự tin Tuấn (0..100)
VAR hr_do_ro_ri = 0           // 📂 Nguy cơ danh sách bị lộ (0..100)

// ---------- Cờ "chạm mốc" (kết thúc dùng) ----------
VAR hr_tung_so_100 = false        // Độ Đáng Sợ từng chạm 100
VAR hr_tung_ro_ri_100 = false     // Độ Rò Rỉ từng chạm 100 (danh sách lên Confession)
VAR hr_ngay_ro_ri = 0             // Ngày danh sách bị lộ

// ---------- Tập hồ sơ hồng & trang 2 ----------
VAR hr_nghi_trang_2 = false       // Thắng né câu hỏi "có tên anh không" (manh mối)
VAR hr_da_xem_trang_2 = false     // Đã thấy trang 2: "Người cuối cùng: Tuấn"
VAR hr_tu_ghi_ten_minh = false    // Nhánh "Người Tắt Đèn Tự Nguyện"
VAR hr_noi_khong_co_danh_sach = false   // Chối ở hội nghị hòa giải 24/10
VAR hr_tu_thu_danh_sach = false   // Tự nói ra ở hội nghị hòa giải
VAR hr_khoa_tu = false            // Đang khóa tủ hồ sơ
VAR hr_mat_chia_khoa = false      // Tuất tha chìa khóa tủ
VAR hr_hanh_dong_3010 = ""        // "doc" / "xe" / "dua_lai"
VAR hr_them_ten_son = false
VAR hr_them_ten_duy = false

// ---------- Email "Thư mời làm việc" ----------
VAR hr_da_gui_email = false
VAR hr_thuong_dong_y = false      // Thương nhận lời "Phòng Trà Nhân Sự"
VAR hr_tin_don_bo_cong_ty = false

// ---------- Trà & lắng nghe ----------
VAR hr_co_tra_o_long = false      // Vật phẩm: lần sau tự pha đúng
VAR hr_pha_dung_lien_tiep = 0
VAR hr_so_loai_tra = 0            // 🍵 Từ A Tới Z (40 loại)
VAR hr_so_nguoi_tu_len = 0        // Số người TỰ lên phòng HR uống trà
VAR hr_nghe_bong_toi = 0          // 🌑 Người Nghe Trong Bóng Tối (15/10)
VAR hr_so_nguoi_chay = 0          // 😊 Nụ Cười Triệu Đô
VAR hr_tra_lam_lanh = false       // Đã tổ chức "buổi trà làm lành"
VAR hr_biet_ngan_co_trang = false // Biết Ngân có một trang bí mật (không biết trang nào)

// ---------- Sơn & đơn nghỉ ----------
VAR hr_so_lan_bat_son = 0         // 🤒 Bà Ngoại Khỏe Re
VAR hr_lan_ba_ngoai = 7           // Số lần bà ngoại Sơn "ốm" trong năm
VAR hr_thay_bong_kim_tuyen = false
VAR hr_chup_bong_kim_tuyen = false
VAR hr_biet_son_kim_tuyen = false // Biết Sơn chính là Sơn Kim Tuyến
VAR hr_so_lan_vote = 0            // Tuấn bình chọn cho Sơn Kim Tuyến (số máy đuôi 604)
VAR hr_co_hop_banh_que = false

// ---------- Tuyển dụng ----------
VAR hr_bat_gian_diep = false      // 🕵️ Gián Điệp Xanh Lá Chuối
VAR hr_nhan_gian_diep = false     // Lỡ nhận gián điệp LL
VAR hr_tuyen_dung = 0             // 0 chưa chọn, 1 đúng, 2 sai
VAR hr_dang_tin_tuyen_dung = false
VAR hr_kpi_share = false

// ---------- Hiếu ----------
VAR hr_biet_xom_cay_me = false

// ---------- Vũng Tàu ----------
VAR hr_vi_pham_phong = -1         // -1 chưa xếp, 0 hoàn hảo
VAR hr_hai_san = false
VAR hr_noi_that_lua_trai = ""     // "tra" / "11_nguoi" / "that"
VAR hr_clip_tro_choi = false

// ---------- Chấm công ----------
VAR hr_cuoi_may_cham_cong = ""    // "cuoi" / "khau_trang" / "duy"
VAR hr_quy_tra_sua = 0
VAR hr_dung_cong_29 = false

// ---------- Khác ----------
VAR hr_doc_thu_g = false
VAR hr_tim_ke_ro_ri = ""          // ai bị nghi làm rò rỉ
VAR hr_don_kho_tuat = false       // Lỡ dọn kho đồ của Tuất ngày 30/10

// ============================================================
// HÀM
// ============================================================
=== function hr_gioi_han(x, thap, cao) ===
{ x > cao:
    ~ return cao
}
{ x < thap:
    ~ return thap
}
~ return x

=== function hr_so(n) ===
~ hr_do_dang_so = hr_gioi_han(hr_do_dang_so + n, 0, 100)
{ hr_do_dang_so >= 100:
    ~ hr_tung_so_100 = true
}

=== function hr_nghe(n) ===
~ hr_do_lang_nghe = hr_gioi_han(hr_do_lang_nghe + n, 0, 100)

=== function hr_ro_ri(n) ===
~ hr_do_ro_ri = hr_gioi_han(hr_do_ro_ri + n, 0, 100)
{ hr_do_ro_ri >= 100 && not hr_tung_ro_ri_100:
    ~ hr_tung_ro_ri_100 = true
    ~ hr_ngay_ro_ri = ngay
    ~ phat_hien(danh_sach_cat_giam)
    ~ follow(-60000)
    ~ scandal()
}

=== function hr_ds(n) ===
~ hr_danh_sach_den = hr_gioi_han(hr_danh_sach_den + n, 0, 21)

=== function hr_tra() ===
~ hr_so_loai_tra = hr_gioi_han(hr_so_loai_tra + 1, 0, 40)
