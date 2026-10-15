// ============================================================
// CHỊ ĐẠI: HƯƠNG · biến & hàm riêng (tiền tố cd_)
// ============================================================

// ---------- Chỉ số riêng ----------
VAR cd_uy_luc = 50          // 🦁 Uy Lực 0..100
VAR cd_no_khi = 20          // 🔥 Nộ Khí 0..100 (100 = nổ)
VAR cd_dan_em = 0           // 🛡️ Đàn Em 0..6 (tính từ danh sách cd_ds_em)
VAR cd_tien_do = 10         // 📋 Tiến Độ Đêm Hồng 0..100 (%)

// ---------- Đàn em (tối đa 6) ----------
LIST cd_ds_em = de_thuc_tap_sinh, de_ran_doc, de_thanh_xin_nghi, de_thanh_ninh, de_editor, de_ke_toan, de_idol_het_thoi, de_bien_kich, de_it, de_designer, de_hong_hot, de_chua_te_deadline, de_sales, de_quan_ly_idol, de_dan_dau_tu, de_con_ong_chau_cha

// ---------- Theo dõi cho kết thúc ----------
VAR cd_dang_quay = false        // đang có máy quay / livestream
VAR cd_no_tren_song = false     // đã nổ Nộ Khí trước máy quay
VAR cd_vua_no = false           // vừa chạm 100, cảnh "bùng nổ" sẽ mở
VAR cd_so_lan_no = 0
VAR cd_so_lan_kiet_suc = 0      // số lần Stress đầy
VAR cd_so_lan_dap_ban = 0
VAR cd_so_nguoi_an_com = 0      // số người đã về Nhà số 45 ăn cơm
VAR cd_so_lan_quat = 0

// ---------- Cờ cốt truyện ----------
VAR cd_de_y_ran_doc = false         // để ý cái bắt tay của Hiếu
VAR cd_tuy_em_khong_tien = false    // hiểu "tùy em" = không có tiền
VAR cd_tam_tuat = false             // đã tắm cho Tuất 4/10
VAR cd_chup_ba_cu = false           // 6/10 cho cả đoàn quay cảnh giúp bà cụ
VAR cd_ve_dung_gio_710 = false
VAR cd_tim_thay_anh_cu = false      // ảnh cũ thời "chị đại" ở Quán Ốc Đêm
VAR cd_hoi_bac_binh = false         // đã hỏi Bác Bình về tấm ảnh
VAR cd_gop_tien_duy = false
VAR cd_dap_ban_luong = false
VAR cd_luong_ve_som = false
VAR cd_thang_that_long = false      // nhánh "Thắng thật lòng"
VAR cd_bao_ke_duy_vu = false        // đã xử vụ Vũ đẩy việc cho Duy
VAR cd_duy_biet_tu_choi = false
VAR cd_thay_nhi_o_ll = false        // từng thấy Nhi ở tòa nhà xanh lá chuối
VAR cd_co_thop_nhi = false
VAR cd_tuat_o_canh_ga = false       // 16/10 giữ Tuất ở cánh gà
VAR cd_gameshow_on = false
VAR cd_doc_danh_sach = false        // đã đọc danh sách cắt giảm
VAR cd_xe_danh_sach = false
VAR cd_doi_chat_tuan = false
VAR cd_hoi_thang_danh_sach = false
VAR cd_ke_vu_oc = ""                // "that" / "giam" / "bac_binh"
VAR cd_khuyen_doc_thu = ""          // "doc" / "giu" / "thang"
VAR cd_luong_20 = false             // Thắng hứa tăng lương 20% ở karaoke
VAR cd_chan_doan_thue = false
VAR cd_kevin_tron = ""              // ai đóng Mr. Kevin Trộn
VAR cd_livestream_on = false
VAR cd_mat_that_tren_song = false
VAR cd_hoa_giai_ok = false          // hội nghị 24/10 không ai bỏ về
VAR cd_hoa_voi_nhi = false
VAR cd_moi_nhi_an_com = false
VAR cd_nhan_ra_ll = false           // Mẫu 6 lựa chọn 3
VAR cd_ep_ll_rut = false            // ép LL rút lời mời với Nguyên
VAR cd_giu_thop_ll = false
VAR cd_ll_hoan_1_ngay = false
VAR cd_tin_sua_chua = false         // tin cú điện thoại của Sữa Chua Hồng Hào
VAR cd_muon_den_nguoi_quen = false
VAR cd_khong_cat_den = true
VAR cd_bo_dam_2910 = false          // điều phối bằng bộ đàm 29/10
VAR cd_giu_kho_tuat = false
VAR cd_khong_ai_bi_duoi = false
VAR cd_paparazzi_bi_duoi = false
VAR cd_bao_cat_lan = 0
VAR cd_khach_com = "thuc_tap_sinh"   // người được mời "Cơm Nhà Chị Hương"

// ---------- Đồ riêng (không có trong tui_do) ----------
VAR cd_co_com_ga = false        // hộp cơm gà xối mỡ
VAR cd_co_banh_pia = false      // hộp bánh pía Thương lén đưa
VAR cd_co_dua = false           // trái dừa tươi hàng xóm cho
VAR cd_co_hop_com = false       // Hộp Cơm Mang Về
VAR cd_co_bo_dam = true         // bộ đàm luôn đeo bên hông

// ============================================================
// HÀM RIÊNG
// ============================================================

// Uy Lực
=== function cd_uy(n) ===
~ cd_uy_luc = gioi_han(cd_uy_luc + n)

// Nộ Khí: chạm 100 là nổ. Đang có máy quay thì ghi nhận "nổ trên sóng".
=== function cd_nk(n) ===
~ cd_no_khi = gioi_han(cd_no_khi + n)
{ cd_no_khi >= 100:
    ~ cd_vua_no = true
    ~ cd_so_lan_no = cd_so_lan_no + 1
    { cd_dang_quay:
        ~ cd_no_tren_song = true
    }
}

// Tiến Độ Đêm Hồng
=== function cd_td(n) ===
~ cd_tien_do = gioi_han(cd_tien_do + n)

// Stress của Hương: đầy 100 thì tính một lần "kiệt sức", rồi hạ về 70
=== function cd_met(n) ===
~ cang_thang(n)
{ stress >= 100:
    ~ cd_so_lan_kiet_suc = cd_so_lan_kiet_suc + 1
    ~ stress = 70
}

// Nhận một người vào danh sách Đàn Em (tối đa 6)
=== function cd_bao_ke(em) ===
{ cd_ds_em ? em:
    ~ return false
}
{ LIST_COUNT(cd_ds_em) >= 6:
    ~ return false
}
~ cd_ds_em += em
~ cd_dan_em = LIST_COUNT(cd_ds_em)
~ return true

// Mất một đàn em (bị đuổi, phản bội, bảo kê thất bại)
=== function cd_mat_em(em) ===
~ cd_ds_em -= em
~ cd_dan_em = LIST_COUNT(cd_ds_em)

=== function cd_la_em(em) ===
~ return cd_ds_em ? em

// Rủ về Nhà số 45 ăn cơm: tốn 100.000đ tiền chợ mỗi người
=== function cd_moi_an_com(ma, d) ===
~ tien_cong(-100000)
~ cd_so_nguoi_an_com = cd_so_nguoi_an_com + 1
~ qh(ma, d)
~ cd_nk(-10)

// Đập bàn phòng giám đốc
=== function cd_dap_ban() ===
~ cd_so_lan_dap_ban = cd_so_lan_dap_ban + 1
