// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT
// CHƯƠNG 3: "CUỘC HỌP TRONG BÓNG TỐI" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== truong_phong_1310_doanh_nhan ===
# ngay:13 # gio:09:45 # noi:phong_giam_doc # bat_buoc
~ tp_lich_co_dinh()
_Ngày Doanh nhân Việt Nam. {giam_doc} tự mua hoa tặng mình, cắm đầy phòng. {thanh_ninh} vừa đọc xong bài phát biểu khen sếp dài 15 phút._
_{sales} bước vào, hai tay nâng một tấm bằng mạ vàng: "Doanh nhân của năm – BTT Global trao tặng"._
sales: Anh Thắng! Mr. Kevin Trộn gửi tặng anh nè! No cap, bên đó quý anh lắm!
giam_doc: Ôi… thế này thì… anh treo ngay chính giữa!
_{giam_doc} quay sang bạn, mắt lấp lánh như chờ một câu gì đó._
* [🙇 "Xứng đáng quá anh ạ. Phòng em xin quay một clip ngắn mừng anh."]
    ~ qh("giam_doc", 8)
    ~ tp_ghe(4)
    ~ tp_hop(1)
    thanh_ninh: Anh Nhật nói chuẩn quá anh ơi! *(liếc bạn như liếc đối thủ)*
    ~ qh("thanh_ninh", -5)
* [🤔 "Anh {giam_doc}, BTT Global có địa chỉ ở đâu ạ? Em muốn gửi thư cảm ơn."]
    sales: Ờ… bên đó ở… nước ngoài. Tin chị… à tin em đi anh, deal này chắc kèo!
    ~ qh("sales", -8)
    _{sales} nhìn bạn như nhìn một cái máy in đang kẹt giấy._
    giam_doc: Thôi Nhật, hôm nay vui mà. Anh không ép em hỏi đâu.
* [💐 Lặng lẽ đặt một bó hoa nhỏ lên bàn, không nói gì.]
    ~ tien_cong(-120000)
    ~ qh("giam_doc", 4)
    ~ tp_ghe(2)
    _{giam_doc} nhìn bó hoa giữa rừng hoa tự mua. Bó của bạn là bó duy nhất có người tặng._
- -> END

// ------------------------------------------------------------
=== truong_phong_1410_poster_long ===
# ngay:14 # gio:10:30 # noi:ban_thiet_ke
~ tp_lich_co_dinh()
_{designer} trình 3 bản poster mới. {con_ong_chau_cha} ghé qua, tay cầm ly cà phê kem._
con_ong_chau_cha: Marketing là phòng tui mà, để tui duyệt cho. *(chỉ vào bản xấu nhất)* Cái này nè. Nhìn nó chill.
designer: *(nhìn bạn, mắt cầu cứu)* Anh Nhật…
* [🪑 "Poster là việc của phòng Sản xuất. Cậu duyệt nhạc chưa xong thì đừng duyệt hình."]
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
    con_ong_chau_cha: Nhạc gì? Ông nói như tui có làm nhạc… *(khựng lại)* Thôi, tùy ông.
    ~ qh("con_ong_chau_cha", -8)
    ~ qh("designer", 10)
    _{con_ong_chau_cha} đi ra. Câu "như tui có làm nhạc" cứ lởn vởn trong đầu bạn._
* [🤝 "Mình hỏi luôn Quỳnh xem bản nào chị ấy thích nhất."]
    designer: Bản số 2 ạ. Có góc nghiêng 15 độ, chữ "Hồng" thở được.
    con_ong_chau_cha: Ờ… vậy bản 2. Bà là dân chuyên mà.
    ~ qh("designer", 12)
    ~ qh("con_ong_chau_cha", 3)
    ~ follow(5000)
    _Bản số 2 lên trang, được khen "đỉnh". {designer} không bị sửa lần nào. Kỷ lục._
* [📅 "Ba người họp nhanh 5 phút để thống nhất quy trình duyệt."]
    ~ tp_hop(1)
    _Năm phút thành 50 phút. Kết luận: bản số 1. Không ai chọn bản 1 lúc đầu._
    designer: Sửa nhẹ thôi là sửa cái gì ạ…
    ~ qh("designer", -5)
- -> END

// ------------------------------------------------------------
=== truong_phong_1410_moc_2 ===
# ngay:14 # gio:17:00 # noi:phong_san_xuat
_Mốc 2: 200.000 người theo dõi. Bàn điều phối lịch của {thanh_xin_nghi} trống trơn. Trên ghế có tờ giấy: "Em xin phép về quê phụ gặt lúa ạ."_
{ nguoi_theo_doi >= 200000:
    hong_hot: Qua mốc 2 rồi nha cả nhà! Ối dồi ôi đẹp quá trời!
    ~ tp_ghe(3)
    ~ cang_thang(-5)
- else:
    hong_hot: Chưa tới 200.000… Mà Siêu Nhân Hồng buồn, bỏ đi giúp người cả ngày rồi kìa.
    ~ tp_ghe(-3)
    ~ cang_thang(8)
}
* [📺 Mở ti vi xem tin tối, thấy một thí sinh "Giọng Ca Ước Mơ" giống hệt {thanh_xin_nghi}.]
    _Bộ đồ kim tuyến. Giọng hát cao vút. Không có cây lúa nào._
    * * [🤐 Tắt ti vi.]
        ~ qh("thanh_xin_nghi", 10)
        _Ai cũng cần một chỗ trốn. Chỗ của bạn là phòng họp. Chỗ của {thanh_xin_nghi} là sân khấu._
    * * [📸 Chụp màn hình gửi {hr}.]
        ~ qh("thanh_xin_nghi", -20)
        ~ qh("hr", 5)
        hr: Cảm ơn anh. Em mời Sơn uống trà sáng thứ Sáu nha.
        ~ phat_hien(son_thi_hat)
* [📅 Lên lịch "Họp khẩn: chiến lược nửa sau tháng" cho ngày mai.]
    ~ tp_hop(1)
    _Mai, 15/10. Lịch ghi: "8:00 – họp khẩn". Bạn không biết mai trời sẽ tối thế nào._
- -> END

// ------------------------------------------------------------
=== truong_phong_1510_mat_dien ===
# ngay:15 # gio:08:05 # noi:phong_hop_sang_tao # bat_buoc
_8 giờ 05. "Phụt." Cả tòa nhà tắt điện. Máy chiếu tắt. Máy lạnh tắt. Wifi tắt._
_Từ xa vọng lại tiếng {giam_doc} và {chi_dai} đập cửa thang máy: "Bảo ơi! Mở cửa!"_
it: *(ló đầu vào, cầm đèn pin)* Mất điện cả khu. Không phải lỗi người dùng. Chưa biết khi nào có lại.
thuc_tap_sinh: Dạ em có 5 cục sạc dự phòng ạ! Ai cần cứ lấy ạ!
_Năm cục sạc nằm trên bàn như năm viên ngọc. Cả phòng nhìn bạn: hôm nay còn họp không?_
* [🕯️ "Vẫn họp. Duy, em có nến không?"]
    ~ tp_hop(1)
    ~ tp_giu_hop_nen = true
    thuc_tap_sinh: Dạ có ạ! Nến thơm em mua ở siêu thị mini, mùi… vani ạ.
    _Phòng "Sáng Tạo" có đúng một ngọn nến. Mùi vani. Không slide. Không máy chiếu. Chỉ có những gương mặt._
    -> truong_phong_1510_hop_duoi_nen
* [😴 "Hôm nay nghỉ họp. Ai làm được gì thì làm."]
    ~ tp_ca_phong(8)
    chua_te_deadline: Ủa?! Anh Nhật bị ai nhập vậy?
    _Cả phòng ra pantry. Bạn ngồi lại một mình trong phòng họp tối, nghe tiếng mọi người cười ở xa._
    ~ cang_thang(5)
* [🔋 Lấy một cục sạc, mở laptop: "Họp online qua 4G nhé!"]
    ~ tp_hop(1)
    it: 4G cả khu nghẽn rồi anh.
    _Màn hình hiện "Đang kết nối…" suốt 40 phút. Cuộc họp online đầu tiên không có ai online._
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== truong_phong_1510_hop_duoi_nen ===
# ngay:15 # gio:09:00 # noi:phong_hop_sang_tao # dieu_kien:tp_giu_hop_nen
{ not tp_giu_hop_nen:
    -> END
}
_Ánh nến lắc lư. Không có slide để trốn sau, mọi người bắt đầu nói thật._
bien_kich: Em nói luôn nha anh Nhật. Kịch bản MV em viết lại 6 lần. Lần 6 giống y lần 1. Kịch bản này cần thêm nỗi đau, và anh đã cho nó thêm rồi đó.
designer: Poster em cũng vậy. Bản cuối là bản đầu đổi tên.
_Mọi người cười khẽ. Rồi {chua_te_deadline}, đang ngả ghế, chợt ngồi thẳng dậy._
chua_te_deadline: Ngồi tối vầy tui mới dám nói. Hồi tháng 6 tui làm mất file gốc một dự án. Tới giờ chưa ai biết.
_Im lặng. Ngọn nến kêu lách tách._
chua_te_deadline: Nói thiệt nha anh Nhật. Ngồi tối vầy tui mới dám hỏi. Anh tự dựng được video nào chưa? # hen_gio:8
* [🕯️ "Chưa. Anh chưa dựng được cái nào. Toàn là Lĩnh."]
    ~ tp_noi_that_duoi_nen = true
    ~ tp_lo(30)
    ~ tp_ca_phong(15)
    ~ tp_ghi_cong()
    _Cả phòng im lặng. Không ai cười. {editor} ngẩng lên, ánh nến in hai đốm sáng trong mắt._
    editor: …Em biết anh biết là em biết mà anh.
    thuc_tap_sinh: Dạ… em thấy anh Nhật nói thật vậy là ngầu lắm ạ.
    { tp_tay_nghe >= 10:
        truong_phong: Nhưng anh đang học. Đêm nào cũng học. Phím C là cắt.
        editor: *(gật đầu chậm)* Phím C là cắt.
        ~ qh("editor", 10)
    }
* [💨 Thổi tắt nến: "Vì lý do an toàn cháy nổ, mình hoãn họp nhé."]
    ~ tp_lo(15)
    _Phòng tối hẳn. Trong bóng tối, {chua_te_deadline} bật cười._
    chua_te_deadline: Chill, tui hiểu rồi.
    ~ tp_giu_hop_nen = false
    ~ qh("chua_te_deadline", -3)
* [🔄 "Thế còn cậu, file gốc dự án tháng 6 đâu rồi?"]
    _{chua_te_deadline} im bặt. Hai người nhìn nhau qua ngọn nến. Ai cũng cầm một con dao, không ai muốn rút._
    ~ qh("chua_te_deadline", -10)
    ~ tp_vu_giu_bi_mat = true
    _Từ hôm đó, {chua_te_deadline} không bao giờ nhắc lại câu hỏi này nữa. Bạn cũng không._
* [⏱️ (Không chọn kịp)]
    _Bạn mở miệng. Không có chữ nào đi ra. Ngọn nến tự tắt vì hết sáp._
    ~ tp_lo(10)
    hong_hot: *(từ cửa)* Trời ơi im lặng vậy là trả lời rồi đó!
- _Cuộc họp kéo dài tới 5 giờ chiều. Không ai bảo phải ở lại. Ai cũng ở lại._
{ tp_giu_hop_nen:
    _Lần đầu tiên, biên bản họp của bạn không có mục nào "take note lại"._
}
{ tp_do_lo >= 100:
    -> truong_phong_tudo_lo_bai
}
-> END

// ------------------------------------------------------------
=== truong_phong_1510_pantry_toi ===
# ngay:15 # gio:18:30 # noi:pantry
_Tối. Vẫn mất điện. Pantry tối om, chỉ có ánh đèn pin điện thoại. Có tiếng hát rất khẽ._
_Trong góc, {idol_het_thoi} đang hát "Công Viên" không nhạc. "Ngày xưa có đôi bạn thân bán cá viên chiên…" {editor} giơ điện thoại quay lại, tay không run chút nào._
_Ở góc bên kia, {con_ong_chau_cha} ôm cây đàn cũ lấy từ kho studio, ngân nga một giai điệu bạn chưa nghe bao giờ._
* [👂 Đứng ở cửa nghe hết giai điệu của {con_ong_chau_cha}.]
    _Giai điệu có một chỗ lên rất cao rồi rơi xuống nhẹ như thở dài. Bạn nhớ lại nhạc MV tuần trước. Không giống. Hay hơn._
    ~ qh("con_ong_chau_cha", 5)
    ~ cang_thang(-10)
    con_ong_chau_cha: *(thấy bạn, dừng tay)* Ủa… ông đứng đó lâu chưa?
    truong_phong: Vừa tới thôi.
    _Bạn nói dối. Lần này là một lời nói dối tử tế._
* [📅 "Mọi người về đi, mai còn họp."]
    ~ tp_ca_phong(-3)
    idol_het_thoi: Em biết anh là ai không? Anh đang hát mà.
    _Tiếng hát tắt. Đèn pin tắt. Bạn đứng một mình trong pantry tối, tự hỏi sao mình luôn là người tắt nhạc._
* [🎥 Thì thầm với {editor}: "Clip đó… đừng đăng vội nhé. Để anh Phát quyết."]
    editor: *(gật)* Em quay cho… em thôi anh.
    ~ qh("editor", 5)
    ~ qh("idol_het_thoi", 3)
- -> END

// ------------------------------------------------------------
=== truong_phong_1610_truong_quay ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. Gameshow "Hồng Hay Không Hồng", giải thưởng 10 triệu. Bạn đeo tai nghe, đứng cạnh máy quay số 2, tự xưng "chỉ đạo nội dung"._
_Hàng ghế khách mời: {giam_doc} ngồi giữa. {con_ong_chau_cha} ngồi sẵn bên cạnh từ sáng. Không còn ghế cho bạn._
mc_tivi_hong: Xin chào quý vị và các bạn! Phần thi tiếp theo: "Hit Một Thời"!
_{sieu_nhan_hong} cầm micro. Nhạc "Công Viên" nổi lên._
sieu_nhan_hong: Ngày xưa có đôi bạn thân… bán… khoai chiên… tại công viên…
_Cả trường quay cười ồ. Trong cánh gà, {idol_het_thoi} đứng nắm chặt rèm, môi mấp máy đúng lời._ # hen_gio:6
* [🎤 Ra hiệu cho kỹ thuật đưa micro cho {idol_het_thoi} hát bè từ cánh gà.]
    idol_het_thoi: *(cất giọng)* …cá viên chiên, thích ăn chuối chiên…
    _Hai giọng hòa vào nhau. Khán giả đứng dậy. MC quên luôn kịch bản._
    ~ follow(30000)
    ~ qh("idol_het_thoi", 15)
    ~ qh("sieu_nhan_hong", 5)
    ~ tp_ghe(3)
* [🎬 "Giữ nguyên. Cái sai đó là meme."]
    ~ follow(15000)
    _"Khoai chiên" lên xu hướng trong 20 phút. {idol_het_thoi} rời cánh gà, không nói một lời._
    ~ qh("idol_het_thoi", -5)
* [📅 Bấm tai nghe: "Cắt quảng cáo! Họp nhanh với ê-kíp!"]
    ~ tp_hop(1)
    mc_tivi_hong: Ơ… quý vị chờ chút… đạo diễn bên G yêu cầu… họp ạ.
    _Cả trường quay chờ 7 phút trong im lặng. {giam_doc} nhìn bạn từ hàng ghế khách mời, mặt đỏ dần._
    ~ tp_ghe(-5)
* [⏱️ (Không chọn kịp)]
    _Bài hát trôi qua. Không ai làm gì. Có lẽ thế lại hay._
- ~ follow(80000)
_Phát sóng xong. Giờ là cuộc đua của phòng dựng._
-> END

// ------------------------------------------------------------
=== truong_phong_1610_clip_highlight ===
# ngay:16 # gio:21:05 # noi:phong_dung_phim # bat_buoc
_{editor} ngủ gục trên bàn phím sau 3 đêm thức trắng. Đồng hồ đếm ngược: 2 tiếng để đăng clip highlight. {hong_hot} gọi tới lần thứ 6._
hong_hot: Ét o ét anh Nhật ơi! Clip đâu anh? Bên LL đăng clip chọc mình rồi kìa! # hen_gio:6
* [🛠️ Tự ngồi vào máy dựng.]
    { tp_tay_nghe >= 40 || RANDOM(1, 100) <= 25:
        _Phím C. Kéo. Thả. Chỉnh màu. Nhạc khớp nhịp ở lần thứ ba. Bạn bấm xuất lúc 22:41._
        ~ follow(70000)
        ~ tp_lo(-20)
        ~ tp_tn(15)
        ~ tp_gameshow_xong = true
        ~ tp_huy_hieu_tu_render = true
        ~ tp_ghe(5)
        hong_hot: Ủa… ai dựng vậy? Đẹp nha!
        truong_phong: Anh.
        _Câu trả lời ngắn nhất đời bạn. Và là câu thật nhất._
    - else:
        _Bạn xuất clip. Mọi thứ đều đúng, trừ việc… cả clip bị lộn ngược. Siêu Nhân Hồng đứng bằng đầu suốt 60 giây._
        ~ follow(20000)
        ~ tp_lo(25)
        ~ tp_tn(5)
        ~ tp_gameshow_xong = true
        hong_hot: Ối dồi ôi! Clip lộn ngược mà đang viral kìa! Mà… ai dựng vậy anh?
    }
* [😬 Lay {editor} dậy.]
    editor: *(mắt nhắm)* …Dạ… render… xong là…
    _Clip xong sau 1 tiếng. Đẹp, đúng nhịp, có con cú ở giây thứ 31. {editor} gục xuống lần nữa, lần này là ngủ thật._
    ~ follow(50000)
    ~ tp_gameshow_xong = true
    ~ tp_linh_nghi_om = true
    ~ tp_ghe(3)
    ~ qh("editor", -10)
* [📞 Gọi {chua_te_deadline}: "Cậu xử lý giúp tớ."]
    chua_te_deadline: Còn sớm mà anh.
    _Clip ra lúc 23:58. Kịp ngày, trễ trend._
    ~ follow(25000)
    ~ qh("chua_te_deadline", -3)
* [⏱️ (Không chọn kịp)]
    _{hong_hot} tự cắt clip bằng điện thoại, đăng kèm chữ "Ối dồi ôi". Dưới clip ghi: "Edit by Ngân"._
    ~ follow(30000)
    ~ qh("hong_hot", 5)
    ~ tp_ghe(-3)
- _Nửa đêm. Phòng dựng chỉ còn tiếng quạt máy tính._
{ tp_do_lo >= 100:
    -> truong_phong_tudo_lo_bai
}
-> END

// ------------------------------------------------------------
=== truong_phong_1610_buffet ===
# ngay:16 # gio:12:00 # noi:pantry
~ tp_lich_co_dinh()
_Ngày Lương thực Thế giới. Công ty tổ chức buffet trưa trước khi đi quay. Trà sữa thứ Sáu cũng tới cùng lúc._
_Bạn có thẻ ăn trưa công ty, nhưng hôm nay ai cũng ăn miễn phí. Lần đầu tiên bạn không có đặc quyền gì._
* [🍱 Lấy một đĩa đầy, mang lên phòng dựng cho {editor}.]
    ~ qh("editor", 6)
    editor: Dĩa… à đĩa… dạ cảm ơn anh.
    ~ tp_hieu_nham()
    _{editor} cố nói giọng Bắc cho bạn vui. Không ai bảo, nhưng bạn vui thật._
* [📅 Vừa ăn vừa họp "chuẩn bị gameshow, phiên bản bữa trưa".]
    ~ tp_hop(1)
    ~ an(20)
    sieu_nhan_hong: Ăn đi em! Họp chi mà họp. Ăn no rồi mới có thái độ!
    ~ qh("sieu_nhan_hong", -2)
* [🍜 Ăn cùng bàn với {chi_dai} và {ke_toan}.]
    ~ an(40)
    chi_dai: Ăn đi. Hôm nay chị cấm nhắc chữ "họp" nghe chưa.
    ke_toan: Không có hóa đơn là không có tiền. Mà buffet thì có hóa đơn rồi, ăn đi em.
    ~ qh("chi_dai", 5)
    ~ qh("ke_toan", 5)
    ~ cang_thang(-8)
- ~ an(30)
~ nhan(tra_sua)
-> END

// ------------------------------------------------------------
=== truong_phong_1310_ca_dem ===
# ngay:13 # gio:22:20 # noi:phong_dung_phim
_22 giờ 20. Tòa nhà tắt đèn gần hết. Phòng dựng vẫn sáng một màn hình._
{ tp_mo_ca_dem:
    -> hai_nguoi
- else:
    -> mot_minh
}

= hai_nguoi
editor: *(không quay lại)* Anh tới rồi hả. Bài hôm nay: ghép nhạc khớp nhịp. Nghe tiếng trống, cắt đúng chỗ trống.
* [🥁 Đeo tai nghe, đếm nhịp, cắt.]
    _Một, hai, ba, cắt. Một, hai, ba, cắt. Lần thứ bảy thì khớp. {editor} gõ nhẹ hai cái lên bàn, kiểu vỗ tay của người lười vỗ tay._
    ~ tp_tn(10)
    ~ nghi(-15)
    ~ qh("editor", 4)
* [💬 "Em học dựng ở đâu thế?"]
    editor: Tự học. Ban đêm. Trên mạng. *(ngừng)* Giống anh bây giờ.
    _Bạn không hỏi thêm. Nhưng bạn có cảm giác câu trả lời thật nằm ngay trên màn hình kia, ở góc có con cú._
    ~ tp_tn(4)
    ~ qh("editor", 6)
- -> END

= mot_minh
_Phòng dựng trống. {editor} đã đi mua mì. Máy dựng phụ ở góc đang mở sẵn._
* [🌙 Học lén một bài.]
    -> truong_phong_mg_hoc_lom
* [📝 Soạn slide cho cuộc họp sáng mai.]
    ~ tp_hop(1)
    _Slide 14 trang. Lúc bạn soạn xong thì {editor} đã ăn xong mì, dựng xong 3 phút phim. Hai người cùng thức, mỗi người một kiểu._
- -> END
