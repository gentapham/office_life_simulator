// ============================================================
// THÁNH HÓNG: NGÂN · CHƯƠNG 5: "AI LÀ ADMIN?" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== hong_hot_2110_bai_boc_phot ===
# ngay:21 # gio:00:20 # noi:nha_hong_hot # bat_buoc
_0 giờ 20. Máy "NGAN-LAPTOP". Trang Confession nhận một bài lạ._
_"Sếp đang thế chấp nhà ở Ngân hàng Tín Dụng Đen Đủi. Quá hạn lần 3. Biệt thự số 1, Đồi Ngân Hàng. Công ty sắp sập."_
_Quá chi tiết. Ngày quá hạn, số biệt thự, cả tên chi nhánh. Như có người đọc được email của sếp._
~ phat_hien(the_chap_biet_thu)
~ hh_tin(3)
* [📮 Đăng nguyên văn. Sự thật là sự thật.]
    ~ hh_dang_bai_the_chap = true
    ~ hh_lo(20)
    ~ hh_tt(10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
    _6 giờ sáng, bài có 3.000 lượt chia sẻ. 9 giờ 30, sếp ra lệnh truy tìm admin. {hr} bắt đầu mời từng người lên uống trà. {it} được giao kiểm tra log._
* [✂️ Đăng nhưng xóa hết chi tiết: chỉ còn "Nghe nói công ty đang khó khăn".]
    ~ hh_lo(5)
    ~ hh_tt(3)
    _Bài nhạt. Nhưng sáng hôm sau, cùng nội dung đầy đủ xuất hiện trên một trang showbiz lạ, avatar xanh lá chuối. Người gửi không chỉ gửi cho bạn._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
* [🤐 Không đăng. Lưu lại bài và địa chỉ người gửi.]
    ~ hh_giu_no_sep = true
    ~ hh_giu_tin_cap_cao()
    ~ hh_lo(-5)
    _Người gửi dùng email tạo lúc 23:58. Tên: "la.chuoi.2018". Bạn ghi lại. Có ai đó đang muốn mượn tay bạn._
    ~ phat_hien(ran_thu_hai_lo_mat)
- _Mốc 3 là hôm nay: 500.000 người theo dõi. Con số: {nguoi_theo_doi}._
{ nguoi_theo_doi < 500000:
    _Chiều đó tin đồn cắt giảm nhân sự bắt đầu lan. Bạn nghe nó ở pantry trước khi nó tới group._
}
-> END

// ------------------------------------------------------------
=== hong_hot_2110_tra_voi_hr ===
# ngay:21 # gio:14:00 # noi:phong_hr # bat_buoc
_Phòng HR. Ấm trà Ô Long. {hr} mỉm cười, rót trà cho bạn._
hr: Em {hong_hot}. Anh chỉ muốn lắng nghe em thôi. Em có biết ai là admin trang Confession không?
* [😇 "Dạ em đâu biết đâu anh. Em lo fanpage công ty còn hông kịp."]
    { hh_lo_admin < 50:
        hr: Ừ. Anh tin em. Em uống trà đi.
        ~ hh_lo(-5)
    - else:
        hr: *(mỉm cười rộng hơn)* Fanpage. Ừ. Em uống thêm ly nữa đi.
        ~ hh_lo(10)
        _Bạn uống. Trà ngon. Nụ cười của {hr} thì không._
    }
* [🫣 "Em nghi cái tài khoản Hoa Hướng Dương 1989 trong… à, trong một group em biết."]
    hr: *(ghi lại)* Hoa Hướng Dương 1989. Ừ.
    _Ba ngày sau, {hr} được sếp gọi lên dặn: "Thôi, không cần tìm nữa." {hr} ra khỏi phòng sếp với vẻ mặt tò mò lần đầu tiên trong năm._
    ~ hh_lo(-20)
    ~ qh("hr", 3)
* [🙋 "Là em đó anh. Mà bài bóc phốt sếp hông phải em viết. Có người gửi vô."]
    ~ hh_lo_admin = 100
    hr: … Vậy ai gửi?
    ~ hh_nhanh_nguoi_doc_email = true
    _{hr} im lặng. Rồi lần đầu tiên, {hr} cất cuốn sổ đi._
    hr: Chuyện này anh giữ trong phòng này. Em giúp anh tìm người gửi.
    ~ hh_lo_admin = 70
    ~ qh("hr", 10)
* {hh_biet_email_tuan} [🔒 "Anh {hr} uống trà ngon dữ. Hôm trước em thấy anh soạn thư cho chị {ke_toan} trên máy…"]
    _{hr} đặt chén trà xuống rất nhẹ._
    hr: Em về làm việc đi.
    _Cuộc truy tìm admin dừng ngay lập tức._
    ~ hh_lo(-15)
- -> END

// ------------------------------------------------------------
=== hong_hot_2110_phong_server ===
# ngay:21 # gio:18:30 # noi:phong_server
_Phòng server. {it} đang ăn mì ly, quay màn hình log về phía bạn._
it: Sếp giao tìm admin. Log ghi NGAN-LAPTOP. Hai mươi ba lần tháng này.
{ hh_bao_giu_kin:
    it: Lần trước anh giữ rồi. Lần này sếp hỏi trực tiếp.
}
* [🙏 "Anh {it}… anh xóa giùm em được hông? Em hứa ngưng đăng 5 ngày."]
    { qh_it >= 30:
        it: … Đổi tên máy đi. Và ngưng thật.
        ~ hh_lo(-20)
        ~ hh_bao_giu_kin = true
        ~ qh("it", 5)
    - else:
        it: Không.
        ~ hh_lo(10)
    }
* [😇 "Anh nộp tên em đi. Em hông muốn anh khó xử."]
    it: *(dừng ăn mì)* … Không nộp.
    ~ qh("it", 15)
    ~ hh_bao_giu_kin = true
    _{it} gõ một dòng vào báo cáo cho sếp: "Không đủ dữ liệu". Rồi ăn tiếp._
* [🔍 "Anh coi giùm em: bài thế chấp gửi từ đâu?"]
    it: *(gõ)* Máy tên "LL-GUEST". Từng đăng nhập wifi công ty ngày 17/10, lúc cả công ty ở Vũng Tàu.
    ~ hh_tin(3)
    ~ phat_hien(ran_thu_hai_lo_mat)
    ~ qh("it", 5)
- -> END

// ------------------------------------------------------------
=== hong_hot_2210_live_lo_tay ===
# ngay:22 # gio:10:00 # noi:khu_lam_viec_chung # bat_buoc
_Đoàn kiểm tra thuế. Trưởng đoàn là Chú Liêm, 55 tuổi, sợ chó. Bạn được dặn: không đăng gì hết._
_Nhưng sếp cũng dặn: quay một clip "Một ngày làm việc chăm chỉ" để đoàn thấy công ty nghiêm túc. Bạn mở camera. Ngón cái chạm nhầm nút đỏ._
_🔴 LIVE · 120 người xem… 400… 900._
_Máy đang chĩa thẳng vào phòng kế toán kính mờ. Bên trong, giọng {ke_toan} nói với Chú Liêm: "…khoản 5 tỷ là tiền trả trước, có điều khoản trang…"_ # hen_gio:4
* [📵 Tắt live ngay lập tức.]
    ~ hh_so_live_sach = hh_so_live_sach + 1
    _4 giây. 900 người xem thấy một cái cửa kính mờ. Bình luận: "Ủa live gì vậy ad?"_
    ~ cang_thang(10)
* [🔄 Lia máy ra chỗ khác, giả vờ đang live "văn phòng chăm chỉ".]
    _Bạn lia sang {chua_te_deadline} đang mở Excel lần đầu trong đời. {cho} chạy ngang khung hình._
    chu_liem: *(trong phòng)* Con… con chó của ai đây?!
    ~ hh_follow(15000)
    ~ hh_tt(5)
    _Clip "Cán bộ thuế trèo lên ghế vì một con chó vẫy đuôi" được cắt ra và viral. Bạn không đăng, nhưng 900 người đã quay màn hình._
* [⏱️ (Không chọn kịp)]
    ke_toan: *(qua cửa kính)* …trang 47. Thất bại thì hoàn gấp đôi.
    ~ hh_live_nham_hop = true
    ~ scandal()
    ~ hh_follow(-60000)
    _"Trang 47". "Hoàn gấp đôi". 2.100 người xem. Bạn tắt live ở phút thứ 3. "Ối dồi ôi."_
- -> END

// ------------------------------------------------------------
=== hong_hot_2210_chu_liem ===
# ngay:22 # gio:15:30 # noi:pantry
_Chú Liêm ngồi ở pantry, uống trà {thanh_ninh} pha, mắt vẫn canh cửa xem {cho} có quay lại không._
chu_liem: Cháu là người làm mạng xã hội à? Cái trang… Confession gì đó, bên cháu quản lý à?
* [😇 "Dạ hông chú, trang đó ẩn danh, ai cũng gửi được."]
    chu_liem: Ừ. Ẩn danh. *(gõ bút lên sổ)* Chú đọc bài thế chấp rồi.
    _Chú không nói thêm. Nhưng chú ghi gì đó vào sổ._
    ~ hh_lo(3)
* [🐕 "Dạ chú ơi, con chó lại tới kìa chú!"]
    chu_liem: *(nhảy dựng)* Đâu? Đâu?!
    _Không có con chó nào. Chú Liêm quên luôn câu hỏi. Bạn hơi áy náy._
    ~ cang_thang(-3)
- -> END

// ------------------------------------------------------------
=== hong_hot_2310_livestream_sinh_nhat ===
# ngay:23 # gio:19:30 # noi:san_khau_su_kien # bat_buoc
_Sinh nhật {sieu_nhan_hong}, 31 tuổi. Livestream lớn nhất tháng. Bánh kem hồng 3 tầng do {designer} thiết kế._
_Cần một người đóng "Mr. Kevin Trộn" chúc mừng qua video. {sales} đã chọn xong người._
* [🔴 Điều phối buổi live. (Minigame "Livestream")]
    -> hong_hot_mg_livestream
* [🎥 Đứng một góc, quay bằng một điện thoại, không điều phối gì.]
    ~ hh_follow(30000)
    _Không ai đọc bình luận cho {sieu_nhan_hong}. {sieu_nhan_hong} tự đọc. Đọc trúng câu "Có phải anh tạo Hồng Coin để lừa fan không?"_
    sieu_nhan_hong: Ờm… Hồng Coin là gì vậy mọi người? Sao có coin tên anh?
    ~ scandal()
    -> hong_hot_2310_banh_kem

=== hong_hot_2310_banh_kem ===
# ngay:23 # gio:20:15 # noi:san_khau_su_kien # bat_buoc
_Giữa livestream, {sieu_nhan_hong} cầm micro: "Anh {chua_te_deadline}… anh có thể… ờm… em thích anh. Thiệt đó." Bình luận nổ tung: \#{chua_te_deadline}ƠiTrảLờiĐi._
_{chua_te_deadline} đứng sau máy quay, điện thoại rơi xuống đất._
_Rồi {cho} lao ra. Bánh kem đổ úp. Kem hồng dính đầy mũ. Clip đang trên tay bạn._
* [🎬 Giữ cảnh {cho} phá bánh trong clip tổng kết.]
    ~ hh_follow(120000)
    ~ hh_tt(10)
    sieu_nhan_hong: *(lau kem trên mũ, cười gượng)* Thôi… sinh nhật ai mà chẳng có đổ vỡ…
    ~ qh("sieu_nhan_hong", -5)
    ~ hh_tuat_noi_hon_nguyen = true
* [✂️ Cắt cảnh đó.]
    ~ hh_follow(60000)
    ~ qh("sieu_nhan_hong", 10)
    _Clip sạch sẽ, ấm áp. Lời tỏ tình vẫn còn. {chua_te_deadline} xem đi xem lại đúng đoạn đó._
- -> END

// ------------------------------------------------------------
=== hong_hot_2410_thu_ky_hoa_giai ===
# ngay:24 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_"Hội nghị hòa giải" của {chi_dai}. Các cặp: {truong_phong}–{con_ong_chau_cha}, {designer}–{bien_kich}, {sales}–{ke_toan}, {hr}–{thanh_xin_nghi}, {chi_dai}–{thanh_ninh}. Bàn riêng "chủ nợ" cho {dan_dau_tu}._
chi_dai: {hong_hot}. Em làm thư ký ghi biên bản. Không ai tin em ghi mà không kể. Nên chị tin em lần này.
* [🤐 Ghi biên bản đầy đủ, cất vào tủ, đưa {chi_dai} chìa khóa.]
    ~ hh_kin(15)
    ~ qh("chi_dai", 10)
    ~ hh_tin(5)
    _Bạn nghe {thanh_ninh} khóc kể chuyện đi phỏng vấn LL. Bạn nghe {dan_dau_tu} xin lỗi từng chủ nợ. Bạn ghi hết. Bạn không kể ai._
    ~ phat_hien(ran_thu_hai_lo_mat)
    ~ hh_giu_nhi_ll = true
    ~ hh_giu_tin_cap_cao()
* [📸 Chụp biên bản, gửi {designer}: "Bà coi nè, vui lắm."]
    ~ hh_ke_tin()
    ~ hh_kin(-10)
    ~ qh("chi_dai", -15)
    ~ hh_bi_don(3)
    _{chi_dai} biết trong 40 phút. "Không ai tin em ghi mà không kể." Chị nói đúng._
- _Cùng lúc đó, trên mạng: clip {idol_het_thoi} hát "Công Viên" trong pantry tối hôm mất điện bắt đầu viral. Ai đăng? Không phải bạn._
_Và cùng lúc: có người bóc 80.000 tài khoản fan ảo comment "Anh {idol_het_thoi} đỉnh nóc kịch trần"._
* [📮 Đăng confession bóc fan ảo của {idol_het_thoi}.]
    ~ hh_conf_ac_cuoi_thang = true
    ~ hh_lo(10)
    ~ qh("idol_het_thoi", -20)
    ~ qh("quan_ly_idol", -15)
    ~ phat_hien(fan_ao_phat)
* [🎤 Đẩy clip hát trong bóng tối lên fanpage công ty, tag {idol_het_thoi}.]
    ~ hh_follow(20000)
    ~ qh("idol_het_thoi", 10)
    ~ qh("editor", 5)
    _Bình luận: "Giọng thật hay hơn giọng thu âm", "Anh {idol_het_thoi} ơi hát tiếp đi"._
* [🤐 Không đăng gì về {idol_het_thoi}.]
    ~ hh_kin(5)
- -> END

// ------------------------------------------------------------
=== hong_hot_2510_tiem_nail ===
# ngay:25 # gio:15:00 # noi:tiem_nail_lung_linh
_Chủ nhật. Tiệm Nail & Tóc Lung Linh, trung tâm tin đồn thứ hai sau pantry._
chi_nail: Ngồi đây chị kể nghe nè… Sáng nay chị đi ngang Ven Đô, thấy hai bé bên công ty em đứng ở sảnh tòa nhà kính xanh lá chuối. Một bé tóc dài đeo khẩu trang ôm laptop, một bé mặc áo dài hồng.
_Tóc dài, ôm laptop: {designer}. Áo dài hồng: {thanh_ninh}. Cả hai ở LL. Cùng sáng Chủ nhật._
~ hh_tin(3)
* {hh_kin_mieng < 40} [📣 Nhắn group: "Nghe gì chưa? Hai bà bên mình đi LL kìa!"]
    ~ hh_ke_tin()
    ~ hh_bi_don(2)
    ~ qh("designer", -20)
    ~ qh("thanh_ninh", -15)
    _{designer} là bạn thân của bạn. {designer} đọc tin nhắn. Không trả lời._
* [🤐 "Chắc chị nhìn nhầm. Sơn cho em màu đỏ nha chị."]
    ~ hh_kin(10)
    ~ hh_giu_nhi_ll = true
    ~ hh_giu_tin_cap_cao()
    ~ qh("designer", 5)
    chi_nail: Ờ, chắc nhầm. Mà sao em hôm nay ít nói vậy?
* [💬 Nhắn riêng {designer}: "Bà ổn hông?"]
    designer: *(20 phút sau)* … Bà biết rồi hả. Ừ. Tui ổn. Đừng kể ai nha.
    ~ qh("designer", 10)
    ~ hh_kin(5)
- ~ tien_cong(-150000)
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== hong_hot_2610_danh_sach ===
# ngay:26 # gio:09:30 # noi:ban_mang_xa_hoi # bat_buoc
_Họp giao ban. Tin đồn "cắt giảm nếu Siêu Nhân Hồng thất bại" lan khắp công ty. Hôm nay là hạn chót 7 tên._
_Trang Confession nhận một ảnh chụp mờ: một tập hồ sơ màu hồng. Đọc được hai cái tên: {thuc_tap_sinh}, {thanh_xin_nghi}._
~ phat_hien(danh_sach_cat_giam)
* [📮 Đăng. Mọi người có quyền biết.]
    ~ hh_conf_ac_cuoi_thang = true
    ~ hh_lo(15)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
    ~ qh("thuc_tap_sinh", -10)
    _{thuc_tap_sinh} đọc bài ở bàn photo. Anh ấy không nói gì. Anh ấy photo tiếp, chậm hơn._
    _{hr} đi tìm kẻ làm rò rỉ. Người đầu tiên được mời uống trà: bạn._
* [🤐 Không đăng. Xóa ảnh.]
    ~ hh_kin(8)
    ~ hh_lo(-3)
* [🤝 Nhắn riêng {thuc_tap_sinh}: "Anh {thuc_tap_sinh}, tuần này anh làm gì cũng ghi lại nha. Em đăng clip anh làm việc lên fanpage."]
    ~ qh("thuc_tap_sinh", 15)
    ~ hh_follow(5000)
    thuc_tap_sinh: Dạ… chị biết gì hả chị? Dạ thôi, em không hỏi ạ. Em cảm ơn chị.
- -> END

// ------------------------------------------------------------
=== hong_hot_2610_kenh_cu_dem ===
# ngay:26 # gio:16:00 # noi:phong_hop_tang_2
_Chiếu thử nội bộ phim "Người Hùng Không Tên". Biên kịch: {bien_kich}. Ở hàng cuối, {thuc_tap_sinh} mắt đỏ hoe._
_Trong một khung hình mưa, góc trái, có một con cú nhỏ xíu. Dấu hiệu của kênh "Cú Đêm Cắt Ghép"._
{ biet(kenh_cu_dem):
    _Bạn đã biết từ hôm đi khám mắt. Giờ thì bạn chắc chắn._
}
* {hh_kin_mieng < 40} [📣 Thì thầm với người bên cạnh: "Thấy con cú hông? {editor} là Cú Đêm Cắt Ghép đó!"]
    ~ hh_ke_tin()
    ~ phat_hien(kenh_cu_dem)
    _Người bên cạnh là sếp. Sáng hôm sau, sếp gọi {editor} lên: "Kênh của em gần 1 triệu người. Công ty mua lại nhé, 200 triệu. Anh không ép, tùy em."_
    ~ qh("editor", -15)
* [🤐 Không nói gì. Nhắn riêng {editor}: "Con cú dễ thương ghê."]
    editor: *(3 phút sau)* … Chị giữ giùm em nha chị.
    ~ hh_kin(8)
    ~ qh("editor", 10)
* [😶 Nhìn sang {thuc_tap_sinh}. Đưa khăn giấy.]
    thuc_tap_sinh: Dạ… em bị bụi vô mắt ạ.
    ~ qh("thuc_tap_sinh", 5)
    ~ phat_hien(nguoi_gac_ket)
- -> END

// ------------------------------------------------------------
=== hong_hot_2710_tin_7_gio ===
# ngay:27 # gio:07:00 # noi:nha_hong_hot # bat_buoc
_7:00 sáng. Một trang showbiz đăng: "LL-Entertainment mời Siêu Nhân Hồng với giá GẤP BA". Bạn là người đầu tiên trong công ty thấy._
~ phat_hien(ll_moi_nguyen)
_Ba điện thoại. Ba lựa chọn._
* [📞 Gọi sếp.]
    giam_doc: *(ngái ngủ)* Gấp… gấp ba à? *(tỉnh hẳn)* Anh tới chỗ {quan_ly_idol} ngay. {hong_hot}, đừng đăng gì hết.
    ~ qh("giam_doc", 10)
    ~ uy_tin = uy_tin + 5
* [👀 Báo group "Hội Anti Sếp".]
    ~ hh_ke_tin()
    _Group nổ tung. "Công ty toang rồi", "Mình cũng nộp đơn LL luôn đi". Hoa Hướng Dương 1989 không thả haha. Lần đầu tiên._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
* [📮 Đăng lên Confession: "Nếu Siêu Nhân Hồng đi, công ty còn gì?"]
    ~ hh_lo(8)
    ~ hh_tt(5)
    _Bình luận ào ào: "Ở lại đi anh Hồng", "Hồng là của G". Có người cắt bình luận gửi {sieu_nhan_hong}._
    { RANDOM(1, 10) <= 6:
        ~ hh_follow(20000)
    }
* [🎥 Gọi {sieu_nhan_hong}, rủ quay một clip ngắn: "Hồng ở đâu?"]
    sieu_nhan_hong: … Anh chưa biết nữa em. Anh sợ.
    _Bạn không quay. Lần này bạn chỉ nghe._
    ~ qh("sieu_nhan_hong", 10)
- -> END

// ------------------------------------------------------------
=== hong_hot_2710_luu_luc_den ===
# ngay:27 # gio:10:00 # noi:sanh_cong_ty # bat_buoc
_Lưu Lực tới tận nơi. Vest trắng. Đi ngang sảnh, thấy {chi_dai}, ông ta làm rơi cả tập hồ sơ._
_Giấy tung ra sàn: lời mời cho {quan_ly_idol}, {ke_toan}, {dan_dau_tu}, {it}… Bạn đứng cách hai mét, camera đang mở._
* [📸 Chụp lia lịa mọi tờ giấy rơi.]
    ~ hh_tin(5)
    ~ phat_hien(ll_moi_thai)
    _Lời mời {quan_ly_idol}: 36 triệu/tháng. {ke_toan}: Kế toán trưởng, lương gấp đôi. {it}: 26 triệu/tháng._
    _Tờ cuối cùng có tên {bac_bao_ve}: "Bảo vệ LL, lương 15 triệu". Bạn không biết nên cười hay nên giận._
    ~ hh_bi_don(1)
    luu_luc: *(thấy máy quay, mồ hôi chảy qua lớp keo tóc)* Em… em xóa ảnh giùm anh được không?
* [🔴 Bấm live: "Nghe gì chưa? CEO LL tới tận công ty mình!"]
    ~ hh_follow(25000)
    ~ hh_tt(8)
    luu_luc: *(che mặt bằng tập hồ sơ)* Không quay! Không quay!
    _Clip "CEO đối thủ trượt chân ở sảnh G" thành meme. Lưu Lực bị cười cả buổi chiều._
    ~ scandal()
* [🤐 Hạ máy, nhặt giấy giùm, không đọc.]
    ~ hh_kin(10)
    luu_luc: Cảm ơn em. Em… làm ở đây lâu chưa? Bên anh đang cần người làm mạng xã hội.
    _Bạn cười, không trả lời. Bên cạnh, {chi_dai} khoanh tay._
- _Chiều đó trailer phim ngắn ra mắt, đề tên {bien_kich}. Và {sales} nhận một cuộc gọi từ "Sữa Chua Hồng Hào" ở Ven Đô, mời tài trợ 1 tỷ. Không ai tin. Cả {sales}._
-> END
