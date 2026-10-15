// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · biến riêng (tiền tố ed_)
// ============================================================

// ---------- 4 chỉ số chính ----------
VAR ed_dem_thuc = 0            // 🌙 Số Đêm Thức Trắng (liên tiếp). Chạm 7 là ngất
VAR ed_tong_dem_thuc = 0       // tổng số đêm thức trong tháng
VAR ed_so_lan_ngat = 0         // số lần chạm 7 (2 lần = kết thúc "Ngất Ở Bàn Dựng")
VAR ed_vua_ngat = false        // cờ để game mở cảnh ngất
VAR ed_sub = 980000            // 📺 Sub kênh "Cú Đêm Cắt Ghép"
VAR ed_can_dam = 10            // 💌 Độ Can Đảm (0..100)
VAR ed_cong_bi_nhan_vo = 60    // 🏷️ Công Bị Nhận Vơ (0..100)

// ---------- Kênh riêng ----------
VAR ed_lo_danh_tinh = 0        // người khác đoán ra chủ kênh tới đâu (0..100)
VAR ed_bi_phat_hien = false    // 26/10: đã bị phát hiện là chủ kênh
VAR ed_cong_khai_kenh = false  // tự công khai mình là "Cú Đêm Cắt Ghép"
VAR ed_keu_goi_follow = false  // kêu gọi người xem kênh follow Siêu Nhân Hồng
VAR ed_ban_kenh = false        // bán kênh cho công ty

// ---------- Thái & thư mục "Thái" ----------
VAR ed_video_tien_tay = 0      // số video tiện tay cho nghệ sĩ của Thái
VAR ed_clip_phat_toi = ""      // "gui_thai" / "giu" / "dang_kenh" / "nguyen_ban"
VAR ed_nguoi_dung_dem = false  // nhánh "Người Dựng Đêm": Thái biết có người nhìn thấy mình
VAR ed_noi_voi_thai = false    // đã nói với Thái mình là người dựng video tiện tay
VAR ed_biet_ll_moi_thai = false
VAR ed_dung_video_thai = false // 27/10: đã dựng thư mục "Thái" thành video hoàn chỉnh
VAR ed_video_xuat_nham = false // 28/10: xuất nhầm lên hàng chờ fanpage
VAR ed_video_len_fanpage = false
VAR ed_huy_video = false
VAR ed_chep_usb = false
VAR ed_dua_usb_thai = false

// ---------- Công việc ----------
VAR ed_mv_dung_phach = false
VAR ed_mv_kip = false
VAR ed_co_giay_mat_cu = false  // giấy "nên làm việc ban đêm" của bác sĩ
VAR ed_deo_kinh = false
VAR ed_render_15_cuu = false   // bản render 15/10 được cứu
VAR ed_highlight = ""          // "nguyen_sai_loi" / "phat_hat_be" / "ca_hai"
VAR ed_highlight_kip = false
VAR ed_tu_lieu_16_nam = false  // có tư liệu cũ từ ổ cứng của Bảo
VAR ed_biet_file_vu = false
VAR ed_dau_cu_chung_minh = 0   // số sản phẩm chứng minh được nhờ con cú
VAR ed_cu_bi_xoa = false
VAR ed_dinh_cong = false
VAR ed_o_nguoi_thuc_hien = ""  // "editor" / "truong_phong" / "ca_hai"
VAR ed_video_tong_ket = false  // dựng xong video tổng kết Đêm Hồng
VAR ed_phieu_com = 0           // phiếu cơm tấm Vũ trả
VAR ed_loi_99 = 0
VAR ed_loi_phu_de = 0
VAR ed_slowmo_banh = false

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function ed_thuc_dem() ===
~ ed_dem_thuc = ed_dem_thuc + 1
~ ed_tong_dem_thuc = ed_tong_dem_thuc + 1
~ nghi(-20)
~ cang_thang(5)
{ ed_dem_thuc >= 7:
    ~ ed_so_lan_ngat = ed_so_lan_ngat + 1
    ~ ed_vua_ngat = true
    ~ ed_dem_thuc = 0
}

=== function ed_ngu_du() ===
~ ed_dem_thuc = 0
~ nghi(50)
~ cang_thang(-10)

=== function ed_can(n) ===
~ ed_can_dam = gioi_han(ed_can_dam + n)

=== function ed_vo(n) ===
~ ed_cong_bi_nhan_vo = gioi_han(ed_cong_bi_nhan_vo + n)

=== function ed_lo(n) ===
~ ed_lo_danh_tinh = gioi_han(ed_lo_danh_tinh + n)

=== function ed_sub_cong(n) ===
~ ed_sub = ed_sub + n
{ ed_sub < 0:
    ~ ed_sub = 0
}

=== function ed_tien_tay() ===
~ ed_video_tien_tay = ed_video_tien_tay + 1
~ ed_thuc_dem()
