// ============================================================
// THÁNH HÓNG: NGÂN · CHƯƠNG 6: "KHÔNG WIFI THÌ HÓNG BẰNG GÌ" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== hong_hot_2810_moc_4 ===
# ngay:28 # gio:08:10 # noi:ban_mang_xa_hoi # bat_buoc
_Mốc 4: 800.000 người theo dõi. Con số: {nguoi_theo_doi}. Bạn thức trắng đêm qua lên bài._
_8:10. Fanpage công ty tự dưng đăng một video lạ: một giọng run run, tỏ tình với "anh quản lý". Video của {editor}, xuất nhầm lên trang. Đã 50.000 lượt xem. Bạn là admin, bạn gỡ được._
* [🗑️ Gỡ ngay.]
    ~ qh("editor", 15)
    ~ hh_follow(-5000)
    _Bạn gỡ trong 40 giây. 50.000 người đã xem. Nhưng 50.000 người quên nhanh hơn 500.000 người._
    editor: *(nhắn)* Chị… cảm ơn chị.
* [💬 Nhắn {editor} trước: "Em muốn chị gỡ hay để?"]
    editor: *(5 phút sau)* … Để đi chị. Lỡ rồi. Em mệt giấu rồi.
    ~ qh("editor", 10)
    ~ hh_follow(30000)
    ~ phat_hien(linh_thich_thai)
    _Bình luận: "Anh quản lý trả lời đi!", "Dễ thương quá". Ở phòng nghệ sĩ, {quan_ly_idol} đang cầm hai điện thoại, cả hai đều mở video đó._
* [🔥 Để nguyên, ghim lên đầu trang. Lượt xem đang lên.]
    ~ hh_follow(45000)
    ~ qh("editor", -20)
    ~ hh_conf_ac_cuoi_thang = true
    _{editor} không tới công ty buổi chiều. Cũng không trả lời tin nhắn của ai._
- _Chiều, bộ lọc của {dan_dau_tu} lần ra: 80.000 tài khoản fan ảo của {idol_het_thoi}, mua từ "Like Thật 100%"._
dan_dau_tu: {hong_hot}, số liệu không nói dối. Đăng không em?
* [🤐 "Anh gửi riêng anh {quan_ly_idol} thôi. Đừng đăng."]
    ~ hh_kin(8)
    ~ qh("quan_ly_idol", 10)
    ~ qh("dan_dau_tu", 3)
* [📮 Đăng lên Confession.]
    ~ hh_conf_ac_cuoi_thang = true
    ~ hh_lo(10)
    ~ qh("idol_het_thoi", -20)
    ~ scandal()
- -> END

// ------------------------------------------------------------
=== hong_hot_2810_tin_don_ve_ngan ===
# ngay:28 # gio:21:00 # noi:nha_hong_hot
_Group Zalo-lô công ty. Một tin nhắn lạ, không biết ai gửi đầu tiên:_
{ hh_tin_don_ve_ngan >= 5:
    _"Nghe gì chưa? {hong_hot} bán tin công ty cho LL. Mỗi tin một ly trà sữa."_
    ~ hh_bi_don(10)
- else:
    _"Nghe gì chưa? {hong_hot} thức trắng mấy đêm cho fanpage, mắt như gấu trúc."_
}
_Lần đầu tiên, tin nóng nhất công ty có tên bạn trong đó._
* [📣 Nhắn group đính chính, gửi 14 tin liền.]
    ~ hh_bi_don(3)
    _Mỗi tin đính chính làm thêm 3 người tò mò. Đính chính là cách lan tin tốt nhất. Bạn biết rõ điều đó, vì bạn đã dùng nó cả trăm lần._
* [🤐 Không trả lời. Đi ngủ.]
    ~ hh_kin(5)
    ~ nghi(20)
    { hh_tin_don_ve_ngan >= 10:
        _Sáng mai, người ta vẫn kể. Nhưng không ai kể với bạn._
    }
* [🧱 Áp tai vào tường phòng 3.]
    _Bên kia vách, {ran_doc} đang nói điện thoại: "…ừ, {hong_hot} đó. Tui nghe từ…" rồi im bặt, như biết bạn đang nghe._
    ~ hh_tin(1)
    ~ hh_bi_don(2)
- -> END

// ------------------------------------------------------------
=== hong_hot_2910_wifi_sap ===
# ngay:29 # gio:09:00 # noi:khu_lam_viec_chung # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. Cả công ty đứng hình. Video của {editor} kẹt ở 99%. Chòi bảo vệ thành tổng đài nhắn tin bằng giấy._
_Cả công ty đi tìm {it}. Không ai biết {it} ở đâu. Trừ bạn: phòng server._
_Bạn có 4G. 30GB. Ba cục pin dự phòng._
chua_te_deadline: {hong_hot} ơi! Ét o ét! Không có wifi tui hông gửi file cho phòng dựng được! Phát 4G cho tui đi, tui đội ơn bà!
* [📶 "Ok, tui đặt mật khẩu 'nghegichua'. Ai cần thì vô."]
    ~ hh_phat_wifi_ca_cty = true
    _Cả công ty dùng 4G của bạn. Chiến dịch không đứng hình. Pin cạn lúc 16:00._
    ~ qh("chua_te_deadline", 10)
    ~ qh("chi_dai", 10)
    ~ qh("giam_doc", 10)
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("editor", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
    ~ nghi(-20)
* [🎬 "Chỉ phát cho phòng dựng thôi. Còn lại chờ anh {it}."]
    ~ hh_follow(20000)
    ~ qh("chua_te_deadline", 8)
    ~ qh("editor", 8)
    _Những người khác ngồi buôn chuyện ở pantry. Bạn ngồi gần đó._
    ~ hh_tin(2)
    ~ hh_follow(-30000)
* {qh_it >= 50} [🔒 "Tui biết anh {it} đang trốn ở đâu. Đi theo tui."]
    _Bạn dẫn {chua_te_deadline} tới phòng server. {it} đang ăn mì ly giữa đống dây._
    it: Lần sau đừng dẫn ai tới nữa.
    _Wifi về sớm 2 tiếng._
    ~ qh("it", -3)
    ~ qh("chua_te_deadline", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [📱 Giữ 4G cho riêng mình "lướt cho đỡ buồn".]
    ~ hh_follow(-80000)
    ~ cang_thang(-10)
    ~ qh("chua_te_deadline", -10)
    _Fanpage đứng hình cả ngày. Bạn lướt Tóp-tóp. Ai đi ngang cũng thấy màn hình bạn sáng. Không ai nói gì. Ai cũng nhớ._
    ~ hh_bi_don(5)
- -> END

// ------------------------------------------------------------
=== hong_hot_2910_email_nhi ===
# ngay:29 # gio:17:02 # noi:khu_lam_viec_chung # bat_buoc
_17:02. Wifi có lại. Hộp thư công ty "ting" một cái. 21 người nhận cùng lúc._
_Người gửi: {thanh_ninh}. Tiêu đề: "Em đồng ý về LL ạ"._
_Ngón tay bạn chụp màn hình trong 0,5 giây. Như phản xạ. Giờ ảnh nằm trong máy bạn._
* {hh_kin_mieng < 40} [📣 Gửi ảnh vào group "Hội Anti Sếp": "ÉT O ÉT, BIẾN CĂNG!"]
    ~ hh_ke_tin()
    ~ hh_kin(-10)
    ~ qh("thanh_ninh", -25)
    ~ hh_conf_ac_cuoi_thang = true
    _Group nổ tung. 300 tin nhắn trong 10 phút. {thanh_ninh} ngồi ở bàn trợ lý, nhìn màn hình, không nhúc nhích._
* [🗑️ Xóa ảnh chụp màn hình.]
    ~ hh_kin(10)
    ~ qh("thanh_ninh", 5)
    { not hh_giu_nhi_ll:
        ~ hh_giu_nhi_ll = true
        ~ hh_giu_tin_cap_cao()
    }
    _Ảnh đã xóa. Nhưng 20 người khác vẫn còn email. Ít nhất trong máy bạn không có._
* [💬 Nhắn riêng {thanh_ninh}: "Bà… gọi sếp liền đi. Trước khi sếp đọc."]
    ~ qh("thanh_ninh", 15)
    ~ hh_kin(5)
    thanh_ninh: *(1 phút sau)* … Cảm ơn bà. Tui gọi rồi.
- -> END

// ------------------------------------------------------------
=== hong_hot_3010_don_kho ===
# ngay:30 # gio:08:10 # noi:gam_cau_thang
_Trước buổi họp đánh giá, {hr} cho dọn kho. {thuc_tap_sinh} đang lôi đồ ra từ gầm cầu thang: một chiếc găng tay hồng, một con gà cao su, một cái USB không nhãn có mùi cà phê sữa đá._
cho: GRỪ! *(đứng chắn trước kho báu, lông dựng)*
* [🎥 Quay {cho} bảo vệ kho báu, caption "Chó công ty chống dọn kho".]
    ~ hh_follow(15000)
    ~ hh_tuat_noi_hon_nguyen = true
    _Clip lên xu hướng trong 2 tiếng. {hr} thấy mình trong clip, mỉm cười, rồi cho dừng dọn góc đó._
    ~ qh("cho", 5)
* [💬 "Anh {thuc_tap_sinh}, cái USB đó… có mùi cà phê sữa đá. Của ông {chua_te_deadline} đó!"]
    ~ phat_hien(usb_cua_vu)
    _{chua_te_deadline} lao từ tầng 1 xuống, ôm cái USB: "ÉT O ÉT, NÓ ĐÂY RỒI!"_
    ~ qh("chua_te_deadline", 15)
    ~ hh_follow(50000)
- -> END

// ------------------------------------------------------------
=== hong_hot_3010_hop_danh_gia ===
# ngay:30 # gio:15:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Sếp đứng đầu bàn. Màn hình lớn chiếu số liệu fanpage. Con số: {nguoi_theo_doi}._
_Điện thoại bạn trên bàn, camera ngửa lên trần. Ngón tay bạn đặt hờ cạnh nút đỏ, thói quen của một người live mỗi ngày._
giam_doc: Trước khi đánh giá, anh nói thật một chuyện. Công ty mình… nếu mai không đạt thì phải hoàn mười tỷ. Trang 47. Anh ký mà không đọc.
_Cả phòng lặng như tờ. Chấm đỏ trên điện thoại của bạn…_ # hen_gio:3
* [👀 Liếc xuống: chấm đỏ đang tắt. An toàn.]
    ~ hh_so_live_sach = hh_so_live_sach + 1
    _Bạn úp điện thoại xuống bàn. Lần này, tin này là của cả phòng. Không ai cần bạn kể._
* [⏱️ (Không chọn kịp)]
    { RANDOM(1, 10) <= 3:
        _Chấm đỏ đang sáng. Nó đã sáng từ 3 phút trước, khi bạn đặt điện thoại xuống. 12.000 người đang xem sếp nói: "…mười tỷ…"._
        ~ hh_live_nham_hop = true
        ~ scandal()
        ~ hh_follow(-100000)
    - else:
        _Chấm đỏ tắt. Tim bạn thì không._
    }
- { hh_lo_admin >= 70:
    _Rồi màn hình lớn chuyển slide. Không phải số liệu. Là ảnh chụp trang quản trị Confession. Góc trên ghi tên tài khoản: "{hong_hot} Nghe Gì Chưa"._
    hr: *(mỉm cười)* Mình cùng nhìn lại hành trình nha em.
    ~ hh_lo_admin = 100
    -> END
}
{ nguoi_theo_doi >= 800000 && hh_dong_gop >= 300000:
    giam_doc: Fanpage là của {hong_hot}. Anh đề bạt {hong_hot} làm trưởng nhóm mạng xã hội. Có hai người mới dưới quyền.
    ~ hh_nhan_vien_moi = true
    _Bạn nhìn quanh. {designer} vỗ tay to nhất. {it} gật đầu đúng một lần._
- else:
    giam_doc: {hong_hot}. Fanpage vất vả. Anh ghi nhận.
    _"Ghi nhận". Câu của {hr}. Bạn biết nó nghĩa là "chưa"._
}
* {hh_biet_hoa_la_sep} [🔒 🌻 Nói nhỏ với sếp sau họp: "Anh ơi, Hoa Hướng Dương 1989 đọc group cũng lâu rồi ha anh."]
    giam_doc: *(khựng lại, rồi cười thật)* … Em biết từ bao giờ?
    hong_hot: Từ hôm bó hoa. Em hông kể ai.
    giam_doc: Ừ. Cảm ơn em đã… không kể.
    ~ qh("giam_doc", 15)
    ~ hh_kin(10)
* [😶 Đứng dậy về chỗ.]
- -> END

// ------------------------------------------------------------
=== hong_hot_3110_chuan_bi ===
# ngay:31 # gio:16:00 # noi:san_khau_dem_hong # bat_buoc
_Đại Nhạc Hội Siêu Nhân. 16 giờ. Hậu trường. {chi_dai} điều phối bằng bộ đàm. Hai máy phát điện, vì cái thứ nhất sẽ hỏng._
_Sếp vừa bước ra trong bộ "Ông Kẹ Ngân Hàng" do {designer} chọn: vest, cà vạt in hình tờ tiền, dán đầy giấy báo nợ giả. Sếp tưởng là "concept tài chính"._
giam_doc: {hong_hot}, chụp cho anh vài kiểu đăng fanpage nhé!
* [📸 Chụp, đăng, caption "Sếp tụi em hóa trang có tâm nhất quận".]
    ~ hh_follow(10000)
    _Bình luận: "Concept này thật quá ad ơi", "Sếp dũng cảm ghê". Sếp đọc, rất vui. Không ai giải thích._
* [🤐 Chụp, không đăng. Gửi riêng cho sếp.]
    giam_doc: Ơ, sao không đăng? … *(đọc kỹ một tờ giấy dán trên áo)* … À. Ừ. Thôi, em giữ cho anh.
    ~ qh("giam_doc", 8)
    ~ hh_kin(5)
- _Ở góc phòng chờ, {sieu_nhan_hong} ngồi một mình, hai tay ôm cái mũ trong lòng._
sieu_nhan_hong: {hong_hot}… nếu tối nay anh… tháo mũ ra… em có quay hông?
* [😇 "Anh tháo thì em quay. Anh không tháo thì em cũng quay. Đó là quyết định của anh."]
    sieu_nhan_hong: … Ờm. Cảm ơn em.
    ~ qh("sieu_nhan_hong", 10)
* [🔥 "Tháo đi anh! Tháo là lên xu hướng liền!"]
    sieu_nhan_hong: *(siết cái mũ chặt hơn)* … Để anh nghĩ.
    ~ qh("sieu_nhan_hong", -5)
* {hh_tat_live_lua_trai} [🔒 "Hôm lửa trại em tắt live. Tối nay em vẫn sẽ làm vậy nếu anh cần."]
    sieu_nhan_hong: *(ngẩng lên)* … Là em tắt hả? Anh tưởng mạng lag.
    _{sieu_nhan_hong} cười. Lần đầu tiên bạn thấy nụ cười đó mà không có cái mũ che._
    ~ qh("sieu_nhan_hong", 20)
- -> END

// ------------------------------------------------------------
=== hong_hot_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_Đại Nhạc Hội Siêu Nhân. Sân khấu Phường Tân Drama. Mở màn: phim ngắn "Người Hùng Không Tên", rồi video "16 năm" của {editor}._
_Sếp hóa trang "Ông Kẹ Ngân Hàng". Bạn đứng giữa khán đài, ba điện thoại trên tay. Một cái live, một cái đếm, một cái để đọc tin nhắn._
_Con số: {nguoi_theo_doi}. Phần bạn góp: {hh_dong_gop}._
_20:00, cùng tối đó, chung kết trực tiếp "Giọng Ca Ước Mơ" trên Đài Tivi Hóng. {thanh_xin_nghi} đứng hát trên một sân khấu khác._
* [🔴 Live đêm diễn, tay không rời màn hình.]
    ~ hh_follow(30000)
    ~ hh_so_live_sach = hh_so_live_sach + 1
* [📺 Mở thêm tab Đài Tivi Hóng, live song song "Hai sân khấu, một công ty".]
    ~ hh_follow(40000)
    ~ qh("thanh_xin_nghi", 10)
    _Bình luận: "Công ty gì mà nhân viên nào cũng đi diễn vậy?"_
* [📵 Úp ba điện thoại xuống. Xem bằng mắt.]
    ~ cang_thang(-20)
    _Lần đầu tiên trong năm, bạn xem một thứ gì đó mà không quay lại._
- -> hong_hot_3010_danh_gia
