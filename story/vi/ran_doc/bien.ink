// Chỉ số và cờ riêng của Rắn Độc (tiền tố rd_)
VAR rd_do_doc = 0
VAR rd_nghi_ngo = 0
VAR rd_tin_tuong = 50
VAR rd_moi_han = 100
VAR rd_so_tin_mat = 0
VAR rd_da_vao_hoi_anti_sep = false
VAR rd_mo_nhanh_hieu_ech = false

// ---------- Đếm hành động ----------
VAR rd_so_tin_don = 0              // số lần tung tin (thêm mắm, nhả độc, đổ dầu)
VAR rd_so_lan_them_mam = 0         // thành tựu "Mặn Mòi"
VAR rd_ngay_tung_tin_cuoi = 0      // ngày gần nhất tung tin (kết thúc bí mật cần < 24)
VAR rd_so_lan_giup = 0             // số lần giúp chiến dịch Siêu Nhân Hồng thật lòng
VAR rd_so_lan_pha = 0              // số lần phá ngầm chiến dịch
VAR rd_so_lan_dung_tuat = 0        // thành tựu "Đồng Phạm Bốn Chân"

// ---------- Cờ cốt truyện ----------
VAR rd_dong_minh_tuat = false      // 4/10: có đồng minh bốn chân
VAR rd_tai_mat_duy = false         // Duy làm "tai mắt"
VAR rd_thay_anh_cay_me = false     // 11/10: thấy ảnh xóm Cây Me
VAR rd_biet_clone = false          // biết danh tính clone "Hoa Hướng Dương 1989"
VAR rd_to_clone = false            // đã tố cáo clone trong group
VAR rd_doi_file_mv = false         // 8/10: đổi file MV ở phòng dựng
VAR rd_co_clip_ba_cu = false       // 6/10: tự quay clip Nguyên giúp bà cụ
VAR rd_dua_clip_cho_chuong = false // 6/10: đưa clip cho Chương đẩy đúng cách
VAR rd_tung_trang_47 = false       // tung chuyện trang 47 ra ngoài
VAR rd_doi_kich_ban_gameshow = false
VAR rd_biet_chuoc_loi = false      // biết Nguyên đi giúp người để chuộc lỗi
VAR rd_loai_nhat = false           // đã loại Nhật khỏi cuộc đua Phó Giám đốc
VAR rd_loai_long = false           // đã loại Long khỏi cuộc đua Phó Giám đốc
VAR rd_manh_moi_ran_hai = 0        // số manh mối về con rắn thứ hai
VAR rd_biet_ran_hai = false        // đã biết con rắn thứ hai là ai (trước 27/10)
VAR rd_lat_mat_ran_hai = false     // đã lật mặt con rắn thứ hai
VAR rd_bao_ll_lich_dien = false    // đã báo LL lịch Đại Nhạc Hội Siêu Nhân
VAR rd_day_nguyen_sang_ll = false  // 27/10: đẩy Nguyên sang LL
VAR rd_giu_nguyen_lai = false      // 27/10: giữ Nguyên lại
VAR rd_nguyen_xin_loi = false      // Nguyên đã xin lỗi trực tiếp
VAR rd_giu_cau_dao = false         // 31/10: đứng sau cánh gà giữ cầu dao
VAR rd_cat_dien_dem_hong = false   // 31/10: đã sập cầu dao

// ---------- Minigame ----------
VAR rd_mg_ban_tin_cay = false      // bản tin tuần này chọn tin cay
VAR rd_mg_ghim_nham = false        // quản trò Zalo-lô: lỡ tay ghim nhầm
VAR rd_so_ban_tin = 0              // số bản tin đã ra

// ============================================================
// HÀM RIÊNG CỦA RẮN ĐỘC
// ============================================================

// Tung một tin (độc, nghi): ghi nhận để tính kết thúc
=== function rd_tung_tin(doc, nghi_ngo_them) ===
~ rd_do_doc = gioi_han(rd_do_doc + doc)
~ rd_nghi_ngo = gioi_han(rd_nghi_ngo + nghi_ngo_them)
~ rd_so_tin_don = rd_so_tin_don + 1
~ rd_ngay_tung_tin_cuoi = ngay

// Thêm mắm: tin thật phóng đại
=== function rd_them_mam(doc, nghi_ngo_them) ===
~ rd_so_lan_them_mam = rd_so_lan_them_mam + 1
~ rd_tung_tin(doc, nghi_ngo_them)

// Thu được một tin mật
=== function rd_tin_mat() ===
~ rd_so_tin_mat = rd_so_tin_mat + 1

// Đổi độ nghi ngờ (giới hạn 0..100)
=== function rd_nghi(n) ===
~ rd_nghi_ngo = gioi_han(rd_nghi_ngo + n)

// Đổi mối hận (giới hạn 0..100)
=== function rd_han(n) ===
~ rd_moi_han = gioi_han(rd_moi_han + n)

// Đổi độ tin tưởng (giới hạn 0..100)
=== function rd_tin(n) ===
~ rd_tin_tuong = gioi_han(rd_tin_tuong + n)

// Giúp chiến dịch thật lòng
=== function rd_giup(n) ===
~ rd_so_lan_giup = rd_so_lan_giup + 1
~ follow(n)

// Phá ngầm chiến dịch
=== function rd_pha(n) ===
~ rd_so_lan_pha = rd_so_lan_pha + 1
~ rd_do_doc = gioi_han(rd_do_doc + 10)
~ follow(0 - n)
