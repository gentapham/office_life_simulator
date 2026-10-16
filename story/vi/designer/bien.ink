// ============================================================
// DESIGNER: QUỲNH · biến riêng (tiền tố ds_)
// ============================================================

// ---------- Chỉ số chính (docs/roles/designer.md, mục 2) ----------
VAR ds_so_lan_bi_sua = 37      // ✏️ Số Lần Bị Sửa (kỷ lục logo năm xưa). Chạm 100: sự kiện "Hết Cứu"
VAR ds_cai_toi = 60            // 🎨 Cái Tôi Nghệ Thuật 0..100
VAR ds_do_lo = 0               // 🥬 Độ Lộ Lá Chuối 0..100. Chạm 100: lộ ngay
VAR ds_mau_cam = 50            // 🧡 Máu Cam (trung thành với công ty) 0..100

// ---------- Tiền & job Lá Chuối ----------
VAR ds_tien_freelance = 0      // tổng tiền job LL đã nhận (đồng)
VAR ds_so_job_ll = 0
VAR ds_nhan_hong_ngoai = false // nhận job "Dự án Hồng Ngoại" ngày 8/10
VAR ds_giao_hong_ngoai = false // đã giao file Hồng Ngoại cho LL (25/10)
VAR ds_giau_chu_g = false      // giấu chữ G 7 màu vào file Hồng Ngoại (27/10)
VAR ds_thay_bia_ho_so = false  // đã thấy bìa hồ sơ LL trên tay Thái (27/10)
VAR ds_thu_nhan_voi_thai = false
VAR ds_cat_dut_ll = false      // hủy hợp tác với Anh Lá Chuối
VAR ds_nhan_fulltime_ll = false
VAR ds_huyen_canh_cua = false  // Huyền canh cửa cho làm job LL (tuần 1)

// ---------- Kỹ năng & thành tích ----------
VAR ds_ban_1_thanh_cong = 0    // số lần "Gửi Lại Bản 1" qua mặt sếp
VAR ds_tai_nghe_lien_tiep = 0  // "Đeo Tai Nghe" 2 lần liên tiếp thì bị họp về thái độ
VAR ds_giat_tit = 0            // thumbnail giật tít quá đà (3 lần: -10.000 người theo dõi)
VAR ds_het_cuu = false         // đã qua sự kiện "Hết Cứu"

// ---------- Đồ vật riêng ----------
VAR ds_co_huy_hieu_ban_1 = false   // Huy Hiệu Bản Đầu Tiên
VAR ds_co_cuon_decal_hong = false  // Cuộn Decal Hồng
VAR ds_co_cuon_vai_hong = false    // Cuộn Vải Hồng (hóa trang 31/10)
VAR ds_co_ban_ve_tay = false       // Bản vẽ tay phông gameshow (15/10)

// ---------- Cờ cốt truyện ----------
VAR ds_chi_thu_muc_cho_hieu = false // 1/10 chỉ cho Hiếu chỗ để file gốc
VAR ds_bat_duoc_ke_doi_file = false // Soi Pixel ra thủ phạm vụ "Siêu Nhân Hồn"
VAR ds_thu_pham = ""                // "ran_doc" hoặc mã con rắn thứ hai
VAR ds_co_sticker_tuat = false      // bộ sticker "Tuất Không Vui"
VAR ds_sticker_viral = false
VAR ds_chay_theo_ba_cu = false      // 6/10 chạy theo chụp ảnh thật
VAR ds_lot_mu = false               // nhánh "Lớp lót bên trong mũ"
VAR ds_poster_mv_dep = false
VAR ds_oanh_gian = false
VAR ds_huyen_deal_that = false      // giúp Huyền chốt deal thật Sữa Chua Hồng Hào
VAR ds_backdrop_xong = false        // backdrop Đại Nhạc Hội Siêu Nhân hoàn thành đẹp
VAR ds_gianh_lai_cong = false       // lên tiếng ở buổi đánh giá 30/10
VAR ds_noi_that_lua_trai = false
VAR ds_co_hong_coin = false        // mua 200.000đ Hồng Coin ngày 9/10
VAR ds_nhuom_gang_thai = false     // 4/10 nhuộm găng "Hồng Thái Độ" cho Thái (manh mối font Hồng Ngoại)
VAR ds_dua_usb_tuat = false        // 30/10 đưa USB không nhãn trong kho của Tuất cho Vũ

// ============================================================
// HÀM RIÊNG
// ============================================================
=== function ds_sua(n) ===
~ ds_so_lan_bi_sua = ds_so_lan_bi_sua + n
{ ds_so_lan_bi_sua < 0:
    ~ ds_so_lan_bi_sua = 0
}

=== function ds_toi(n) ===
~ ds_cai_toi = gioi_han(ds_cai_toi + n)

=== function ds_lo(n) ===
~ ds_do_lo = gioi_han(ds_do_lo + n)

=== function ds_cam(n) ===
~ ds_mau_cam = gioi_han(ds_mau_cam + n)

// Nhận tiền job Lá Chuối
=== function ds_job_ll(so_tien) ===
~ tien_cong(so_tien)
~ ds_tien_freelance = ds_tien_freelance + so_tien
~ ds_so_job_ll = ds_so_job_ll + 1
