// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · biến riêng (tiền tố ddt_)
// Xem thiết kế: docs/roles/dan-dau-tu.md
// LƯU Ý: chuyện đầu tư là trò cười. Mọi lệnh "mua" đều thua.
// ============================================================

// ---------- Bốn chỉ số chính ----------
VAR ddt_tai_khoan = 3000000    // 📉 Tài Khoản Đầu Tư (đồng)
VAR ddt_so_no = 22000000       // 📒 Sổ Nợ (tổng, tự tính lại)
VAR ddt_niem_tin = 90          // 🙏 Niềm Tin Lên Thật (0..100)
VAR ddt_do_chuan = 50          // 📊 Độ Chuẩn Số Liệu (0..100)

// ---------- Sổ nợ chi tiết (tổng ban đầu 22.000.000đ, đúng sổ tay sự thật) ----------
VAR ddt_no_long = 10000000     // {con_ong_chau_cha}: "vốn góp chung"
VAR ddt_no_huyen = 5000000     // {sales}
VAR ddt_no_bao = 3000000       // {it}
VAR ddt_no_binh = 2000000      // {bac_bao_ve}
VAR ddt_no_son = 500000        // {thanh_xin_nghi}
VAR ddt_no_duy = 500000        // {thuc_tap_sinh}
VAR ddt_no_oanh = 500000       // {bien_kich}
VAR ddt_no_phat = 500000       // {idol_het_thoi}
VAR ddt_no_nha_hang = 0        // hóa đơn hải sản Vũng Tàu 17/10 (ký nợ)

// ---------- Hồng Coin ----------
VAR ddt_hong = 0               // phần tài khoản đang nằm trong $HONG
VAR ddt_mua_hong = false
VAR ddt_ban_hong_17 = false
VAR ddt_mua_sau_18 = false
VAR ddt_canh_bao_coin = false  // cảnh báo cả công ty đêm 9/10
VAR ddt_nguyen_quang_ba_coin = false

// ---------- Đếm ----------
VAR ddt_so_chu_no_tra_xong = 0
VAR ddt_so_lan_day = 0         // số lần nói "đây là đáy"
VAR ddt_so_lan_chua = 0        // số lần đi chùa cầu coin
VAR ddt_so_lan_tat_app = 0     // số lần tắt app chart thành công
VAR ddt_du_doan_dung = 0       // số mốc dự đoán sai số dưới 5%
VAR ddt_man_hinh_trai = 0      // số lần nhìn số liệu công ty
VAR ddt_man_hinh_phai = 0      // số lần nhìn chart
VAR ddt_so_lan_an_chuc = 0
VAR ddt_ne_trong_ngay = 0

// ---------- Cờ cốt truyện ----------
VAR ddt_tra_binh_dau_tien = false
VAR ddt_dung_tien_ll = false
VAR ddt_mo_cat_lo = false      // đã mở kỹ năng Cắt Lỗ
VAR ddt_xoa_app = false
VAR ddt_thay_clip_ba_cu = false
VAR ddt_bieu_do_tay = false    // vẽ biểu đồ bằng tay ngày mất điện
VAR ddt_phan_tich_cao = false
VAR ddt_thuyet_phuc_21 = false
VAR ddt_nhanh_trang_47 = false
VAR ddt_ban_so_lieu_ll = false
VAR ddt_gui_so_lieu_gia = false
VAR ddt_bao_ll = false
VAR ddt_bo_ban_chu_no = false
VAR ddt_ban_chu_no_ok = false
VAR ddt_chu_no_hop_mat = false
VAR ddt_noi_fan_ao = false
VAR ddt_hoi_rieng_huyen = false
VAR ddt_vay_long_20 = false
VAR ddt_hua_binh = false       // đã hứa trả Bác Bình ngày mất điện
VAR ddt_bi_ll_lo = false       // LL phát hiện số liệu giả

// ---------- Đồ riêng ----------
VAR ddt_co_dong_ho = true      // đồng hồ (có thể đem cầm)
VAR ddt_co_laptop_cu = true
VAR ddt_co_banh_chuoi = 0
VAR ddt_co_to_nhac_no_7 = false

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function ddt_nt(n) ===
~ ddt_niem_tin = gioi_han(ddt_niem_tin + n)

=== function ddt_dc(n) ===
~ ddt_do_chuan = gioi_han(ddt_do_chuan + n)

// Nhìn chart: Niềm Tin +5, Năng lượng −10, màn hình phải sáng thêm
=== function ddt_soi_chart() ===
~ ddt_nt(5)
~ nghi(-10)
~ ddt_man_hinh_phai = ddt_man_hinh_phai + 1

// Làm số liệu thật: màn hình trái
=== function ddt_lam_that(n) ===
~ ddt_dc(n)
~ ddt_man_hinh_trai = ddt_man_hinh_trai + 1

=== function ddt_noi_day() ===
~ ddt_so_lan_day = ddt_so_lan_day + 1

// --- Sổ nợ ---
=== function ddt_no_cua(ai) ===
{ ai:
- "con_ong_chau_cha": ~ return ddt_no_long
- "sales": ~ return ddt_no_huyen
- "it": ~ return ddt_no_bao
- "bac_bao_ve": ~ return ddt_no_binh
- "thanh_xin_nghi": ~ return ddt_no_son
- "thuc_tap_sinh": ~ return ddt_no_duy
- "bien_kich": ~ return ddt_no_oanh
- "idol_het_thoi": ~ return ddt_no_phat
- "nha_hang": ~ return ddt_no_nha_hang
}
~ return 0

=== function ddt_dat_no(ai, v) ===
{ ai:
- "con_ong_chau_cha": ~ ddt_no_long = v
- "sales": ~ ddt_no_huyen = v
- "it": ~ ddt_no_bao = v
- "bac_bao_ve": ~ ddt_no_binh = v
- "thanh_xin_nghi": ~ ddt_no_son = v
- "thuc_tap_sinh": ~ ddt_no_duy = v
- "bien_kich": ~ ddt_no_oanh = v
- "idol_het_thoi": ~ ddt_no_phat = v
- "nha_hang": ~ ddt_no_nha_hang = v
}

=== function ddt_tinh_tong() ===
~ ddt_so_no = ddt_no_long + ddt_no_huyen + ddt_no_bao + ddt_no_binh + ddt_no_son + ddt_no_duy + ddt_no_oanh + ddt_no_phat + ddt_no_nha_hang
{ ddt_so_no > 40000000:
    ~ ddt_chu_no_hop_mat = true
}

// Giảm nợ của một người (không đụng tới tiền). Trả về số đã giảm.
=== function ddt_giam_no(ai, n) ===
~ temp truoc = ddt_no_cua(ai)
~ temp sau = truoc - n
{ sau < 0:
    ~ sau = 0
}
~ ddt_dat_no(ai, sau)
{ truoc > 0 and sau == 0 and ai != "nha_hang":
    { ai == "bac_bao_ve" and ddt_so_chu_no_tra_xong == 0:
        ~ ddt_tra_binh_dau_tien = true
    }
    ~ ddt_so_chu_no_tra_xong = ddt_so_chu_no_tra_xong + 1
}
~ ddt_tinh_tong()
~ return truoc - sau

// Trả nợ bằng tiền mặt
=== function ddt_tra(ai, n) ===
~ temp da_tra = ddt_giam_no(ai, n)
~ tien_cong(-da_tra)

// Trừ nợ bằng công sức (làm báo cáo thuê, giúp việc)
=== function ddt_xoa(ai, n) ===
~ ddt_giam_no(ai, n)

// Vay thêm
=== function ddt_vay(ai, n) ===
~ ddt_dat_no(ai, ddt_no_cua(ai) + n)
~ ddt_tinh_tong()

// Số chủ nợ đã ghét Chương (quan hệ ≤ −50)
=== function ddt_dem_chu_no_ghet() ===
~ temp dem = 0
{ qh_sales <= -50:
    ~ dem = dem + 1
}
{ qh_it <= -50:
    ~ dem = dem + 1
}
{ qh_bac_bao_ve <= -50:
    ~ dem = dem + 1
}
{ qh_con_ong_chau_cha <= -50:
    ~ dem = dem + 1
}
{ qh_thanh_xin_nghi <= -50:
    ~ dem = dem + 1
}
{ qh_thuc_tap_sinh <= -50:
    ~ dem = dem + 1
}
{ qh_bien_kich <= -50:
    ~ dem = dem + 1
}
{ qh_idol_het_thoi <= -50:
    ~ dem = dem + 1
}
~ return dem

// Đổi quan hệ với cả 8 chủ nợ cùng lúc
=== function ddt_qh_chu_no(n) ===
~ qh("sales", n)
~ qh("it", n)
~ qh("bac_bao_ve", n)
~ qh("con_ong_chau_cha", n)
~ qh("thanh_xin_nghi", n)
~ qh("thuc_tap_sinh", n)
~ qh("bien_kich", n)
~ qh("idol_het_thoi", n)

// Chiến dịch cứu được công ty (đọc kết quả chung chốt sau Đại Nhạc Hội Siêu Nhân)
=== function ddt_chien_dich_on() ===
~ return chung_cong_ty_song
