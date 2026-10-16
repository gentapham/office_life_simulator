// ============================================================
// BIẾN CHUNG: dùng cho mọi file truyện tiếng Việt
// Game sẽ ghi đè các giá trị này lúc chạy (tên người chơi đặt,
// ngày giờ, nhân vật đang chơi...). Giá trị ở đây là mặc định.
// ============================================================

// ---------- Nhân vật người chơi đang điều khiển ----------
VAR vai = "ran_doc"

// ---------- Tên hiển thị (người chơi đổi được) ----------
VAR ran_doc = "Hiếu"
VAR giam_doc = "Thắng"
VAR truong_phong = "Nhật"
VAR thanh_ninh = "Nhi"
VAR hong_hot = "Ngân"
VAR con_ong_chau_cha = "Long"
VAR chua_te_deadline = "Vũ"
VAR thuc_tap_sinh = "Duy"
VAR ke_toan = "Thương"
VAR hr = "Tuấn"
VAR it = "Bảo"
VAR idol_het_thoi = "Phát"
VAR quan_ly_idol = "Thái"
VAR bien_kich = "Oánh"
VAR editor = "Lĩnh"
VAR designer = "Quỳnh"
VAR sales = "Huyền"
VAR chi_dai = "Hương"
VAR dan_dau_tu = "Chương"
VAR thanh_xin_nghi = "Sơn"
VAR bac_bao_ve = "Bình"
VAR sieu_nhan_hong = "Nguyên"
VAR cho = "Tuất"
VAR cong_ty = "G-Entertainment"

// ---------- Thời gian (game cập nhật) ----------
VAR ngay = 1          // 1..31 (tháng 10/2026)
VAR gio = 8           // 0..23
VAR phut = 0

// ---------- Chỉ số sinh tồn của người chơi ----------
VAR no = 80
VAR khat = 80
VAR nang_luong = 100
VAR stress = 10       // càng cao càng tệ
VAR tien = 500000     // đồng
VAR uy_tin = 50       // uy tín công việc 0..100
VAR danh_tieng = 50   // người khác nói gì sau lưng 0..100

// ---------- Chiến dịch Siêu Nhân Hồng ----------
VAR nguoi_theo_doi = 5000
VAR tinh_than_cong_ty = 50   // 0..100
VAR so_scandal = 0
VAR nguyen_theo_ll = false   // Nguyên nhận lời LL ngày 27/10
VAR nguyen_thao_mu_dem_hong = false

// ---------- Con rắn thứ hai (game chọn ngẫu nhiên) ----------
VAR ran_thu_hai = "thanh_ninh"

// ---------- Kết thúc ----------
VAR ket_thuc_nhan_vat = ""
VAR ket_thuc_su_nghiep = ""

// ---------- Biến cho Đại Nhạc Hội Siêu Nhân & kết thúc sự nghiệp ----------
// Nguyên đã vào top 10 xu hướng (game đặt khi đạt, ví dụ Tiến Độ Đại Nhạc Hội Siêu Nhân ≥ 80%)
VAR chung_top_10_xu_huong = false
// Có scandal lớn bị bóc sau ngày 28/10 (vụ fan ảo, email Nhi, Hồng Coin...)
VAR chung_scandal_lon_sau_2810 = false
// Số lần Siêu Nhân Hồng thành meme trong tháng (té khi nhảy, bị Tuất đuổi trên sóng...)
VAR chung_so_meme = 0
// Long công khai là tác giả, "Hồng Là Thái Độ" được hát ở Đại Nhạc Hội Siêu Nhân
VAR chung_hat_hong_la_thai_do = false
// Phim "Người Hùng Không Tên" ghi đúng tên Duy ở dòng ý tưởng
VAR chung_phim_ghi_ten_duy = false
// Video "16 năm" của Lĩnh chiếu được (false nếu kẹt 99% mà không ai cứu)
VAR chung_video_16_nam = true
// Tiến độ Đại Nhạc Hội Siêu Nhân của Hương, 0..100
VAR chung_tien_do_dem_hong = 70
// File nhân vật đã tự hỏi chuyện tháo mũ rồi thì đặt true để Đại Nhạc Hội Siêu Nhân chung không hỏi lại
VAR chung_da_chon_thao_mu = false
// Công ty còn sống sau Đại Nhạc Hội Siêu Nhân (do chung_3110_ket_thuc_su_nghiep tính)
VAR chung_cong_ty_song = false

// ---------- Quan hệ giữa người chơi và từng nhân vật (-100..100) ----------
VAR qh_ran_doc = 0
VAR qh_giam_doc = 0
VAR qh_truong_phong = 0
VAR qh_thanh_ninh = 0
VAR qh_hong_hot = 0
VAR qh_con_ong_chau_cha = 0
VAR qh_chua_te_deadline = 0
VAR qh_thuc_tap_sinh = 0
VAR qh_ke_toan = 0
VAR qh_hr = 0
VAR qh_it = 0
VAR qh_idol_het_thoi = 0
VAR qh_quan_ly_idol = 0
VAR qh_bien_kich = 0
VAR qh_editor = 0
VAR qh_designer = 0
VAR qh_sales = 0
VAR qh_chi_dai = 0
VAR qh_dan_dau_tu = 0
VAR qh_thanh_xin_nghi = 0
VAR qh_bac_bao_ve = 0
VAR qh_sieu_nhan_hong = 0
VAR qh_cho = 0

// ---------- Túi đồ ----------
LIST tui_do = xuc_xich, banh_mi, com_tam, mi_goi, mi_ly, chuoi_chien, ca_vien_chien, tra_sua, ca_phe, nuoc_suoi, nuoc_tang_luc, bia, banh_kem, hoa_hong, gau_bong, do_choi_cho, phu_kien_hong, thuoc_dau_dau, ao_mua, ve_xem_phim, giay_nghi_om, usb_khong_nhan, gang_tay_hong, thu_g, so_tay_oanh, ga_cao_su

// ---------- Bí mật chung đã biết (xem docs/so-tay-su-that.md) ----------
LIST bi_mat = trang_47, trang_47b, clone_thang, admin_confession, the_chap_biet_thu, quy_den_thuong, usb_cua_vu, hieu_ech, ve_so_nguyen, bai_hat_long, fan_ao_phat, danh_sach_cat_giam, ll_moi_thai, ll_moi_nguyen, quynh_lam_cho_ll, nguoi_gac_ket, duy_tung_lam_ngan_hang, kenh_cu_dem, thai_thuong_phat, linh_thich_thai, son_thi_hat, binh_tai_mat_g, ran_thu_hai_lo_mat, btt_global_gia

// ============================================================
// HÀM TIỆN ÍCH
// ============================================================

// --- Chiến dịch ---
=== function follow(n) ===
~ nguoi_theo_doi = nguoi_theo_doi + n
{ nguoi_theo_doi < 0:
    ~ nguoi_theo_doi = 0
}

=== function scandal() ===
~ so_scandal = so_scandal + 1

// --- Tiền & chỉ số ---
=== function tien_cong(n) ===
~ tien = tien + n

=== function an(n) ===
~ no = gioi_han(no + n)

=== function uong(n) ===
~ khat = gioi_han(khat + n)

=== function nghi(n) ===
~ nang_luong = gioi_han(nang_luong + n)

=== function cang_thang(n) ===
~ stress = gioi_han(stress + n)

=== function gioi_han(x) ===
{ x > 100:
    ~ return 100
}
{ x < 0:
    ~ return 0
}
~ return x

// --- Túi đồ ---
=== function co(mon) ===
~ return tui_do ? mon

=== function nhan(mon) ===
~ tui_do += mon

=== function mat(mon) ===
~ tui_do -= mon

// --- Bí mật ---
=== function biet(bm) ===
~ return bi_mat ? bm

=== function phat_hien(bm) ===
~ bi_mat += bm

// --- Kết thúc ---
=== function chot_ket_thuc(id) ===
~ ket_thuc_nhan_vat = id

// --- Quan hệ ---
=== function qh(ma, d) ===
{ ma:
- "ran_doc": ~ qh_ran_doc = gioi_han_qh(qh_ran_doc + d)
- "giam_doc": ~ qh_giam_doc = gioi_han_qh(qh_giam_doc + d)
- "truong_phong": ~ qh_truong_phong = gioi_han_qh(qh_truong_phong + d)
- "thanh_ninh": ~ qh_thanh_ninh = gioi_han_qh(qh_thanh_ninh + d)
- "hong_hot": ~ qh_hong_hot = gioi_han_qh(qh_hong_hot + d)
- "con_ong_chau_cha": ~ qh_con_ong_chau_cha = gioi_han_qh(qh_con_ong_chau_cha + d)
- "chua_te_deadline": ~ qh_chua_te_deadline = gioi_han_qh(qh_chua_te_deadline + d)
- "thuc_tap_sinh": ~ qh_thuc_tap_sinh = gioi_han_qh(qh_thuc_tap_sinh + d)
- "ke_toan": ~ qh_ke_toan = gioi_han_qh(qh_ke_toan + d)
- "hr": ~ qh_hr = gioi_han_qh(qh_hr + d)
- "it": ~ qh_it = gioi_han_qh(qh_it + d)
- "idol_het_thoi": ~ qh_idol_het_thoi = gioi_han_qh(qh_idol_het_thoi + d)
- "quan_ly_idol": ~ qh_quan_ly_idol = gioi_han_qh(qh_quan_ly_idol + d)
- "bien_kich": ~ qh_bien_kich = gioi_han_qh(qh_bien_kich + d)
- "editor": ~ qh_editor = gioi_han_qh(qh_editor + d)
- "designer": ~ qh_designer = gioi_han_qh(qh_designer + d)
- "sales": ~ qh_sales = gioi_han_qh(qh_sales + d)
- "chi_dai": ~ qh_chi_dai = gioi_han_qh(qh_chi_dai + d)
- "dan_dau_tu": ~ qh_dan_dau_tu = gioi_han_qh(qh_dan_dau_tu + d)
- "thanh_xin_nghi": ~ qh_thanh_xin_nghi = gioi_han_qh(qh_thanh_xin_nghi + d)
- "bac_bao_ve": ~ qh_bac_bao_ve = gioi_han_qh(qh_bac_bao_ve + d)
- "sieu_nhan_hong": ~ qh_sieu_nhan_hong = gioi_han_qh(qh_sieu_nhan_hong + d)
- "cho": ~ qh_cho = gioi_han_qh(qh_cho + d)
}

=== function gioi_han_qh(x) ===
{ x > 100:
    ~ return 100
}
{ x < -100:
    ~ return -100
}
~ return x

// --- Giới tính & xưng hô ---
=== function gioi_tinh(ma) ===
{ ma:
- "thanh_ninh": ~ return "nu"
- "hong_hot": ~ return "nu"
- "ke_toan": ~ return "nu"
- "bien_kich": ~ return "nu"
- "designer": ~ return "nu"
- "sales": ~ return "nu"
- "chi_dai": ~ return "nu"
- "cho": ~ return "cho"
- else: ~ return "nam"
}

// anh / chị (dùng cho người lớn tuổi hơn, hoặc gọi lịch sự)
=== function anh_chi_cua(ma) ===
{ gioi_tinh(ma) == "nu":
    ~ return "chị"
}
~ return "anh"

// ông / bà (bạn bè ngang tuổi gọi nhau, giọng Nam)
=== function ong_ba_cua(ma) ===
{ gioi_tinh(ma) == "nu":
    ~ return "bà"
}
~ return "ông"

// ổng / bả (ngôi thứ ba, giọng Nam)
=== function ong_ay_cua(ma) ===
{ gioi_tinh(ma) == "nu":
    ~ return "bả"
}
~ return "ổng"

// Tiện cho người chơi
=== function anh_chi() ===
~ return anh_chi_cua(vai)

=== function ong_ba() ===
~ return ong_ba_cua(vai)

// Tên của bất kỳ mã nhân vật nào
=== function ten(ma) ===
{ ma:
- "ran_doc": ~ return ran_doc
- "giam_doc": ~ return giam_doc
- "truong_phong": ~ return truong_phong
- "thanh_ninh": ~ return thanh_ninh
- "hong_hot": ~ return hong_hot
- "con_ong_chau_cha": ~ return con_ong_chau_cha
- "chua_te_deadline": ~ return chua_te_deadline
- "thuc_tap_sinh": ~ return thuc_tap_sinh
- "ke_toan": ~ return ke_toan
- "hr": ~ return hr
- "it": ~ return it
- "idol_het_thoi": ~ return idol_het_thoi
- "quan_ly_idol": ~ return quan_ly_idol
- "bien_kich": ~ return bien_kich
- "editor": ~ return editor
- "designer": ~ return designer
- "sales": ~ return sales
- "chi_dai": ~ return chi_dai
- "dan_dau_tu": ~ return dan_dau_tu
- "thanh_xin_nghi": ~ return thanh_xin_nghi
- "bac_bao_ve": ~ return bac_bao_ve
- "sieu_nhan_hong": ~ return sieu_nhan_hong
- "cho": ~ return cho
}
~ return ma

// ---------- Kết thúc sự nghiệp của Nguyên (dùng chung mọi vai) ----------
// Game có thể gọi để biết trước kết thúc sẽ là gì
=== function chung_tinh_ket_thuc_su_nghiep() ===
~ temp top10 = chung_top_10_xu_huong || (nguoi_theo_doi >= 1000000 && not chung_scandal_lon_sau_2810)
{ nguyen_theo_ll:
    ~ return "bi_cuop_mat"
}
{ nguoi_theo_doi >= 1000000 && top10:
    ~ return "sieu_sao_hang_a"
}
{ nguoi_theo_doi >= 800000 && nguyen_thao_mu_dem_hong:
    ~ return "thao_mu"
}
{ nguoi_theo_doi >= 600000 && so_scandal + chung_so_meme >= 3:
    ~ return "meme_quoc_dan"
}
{ chung_scandal_lon_sau_2810 && nguoi_theo_doi < 800000:
    ~ return "bi_tay_chay"
}
~ return "chim_nghim"

// Chốt kết thúc sự nghiệp và số phận công ty (gọi cuối đêm diễn)
=== function chung_chot_ket_thuc_su_nghiep() ===
~ ket_thuc_su_nghiep = chung_tinh_ket_thuc_su_nghiep()
~ chung_cong_ty_song = ket_thuc_su_nghiep == "sieu_sao_hang_a" || ket_thuc_su_nghiep == "thao_mu" || ket_thuc_su_nghiep == "meme_quoc_dan"

