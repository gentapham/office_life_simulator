// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT
// CHƯƠNG 2: "BẢN DỰNG CỦA AI?" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== truong_phong_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
~ tp_lich_co_dinh()
_Họp giao ban đầu tuần. Theo lịch: 30 phút. Theo kinh nghiệm: 2 tiếng._
~ tp_hop(1)
_{thuc_tap_sinh} bước vào, ôm một bó hoa to hơn cả người. Hôm nay là Ngày Nhà giáo Thế giới._
thuc_tap_sinh: Dạ em kính tặng thầy Nhật ạ! Cảm ơn thầy đã dạy em… dạ… cách họp ạ!
_Một thực tập sinh lớn hơn bạn 2 tuổi vừa gọi bạn là "thầy". Cả phòng nín cười._
* [😇 Nhận hoa: "Cảm ơn Duy. Nhưng gọi anh thôi… à, gọi tên thôi cũng được."]
    thuc_tap_sinh: Dạ… dạ thầy… dạ anh… dạ Nhật ạ.
    ~ qh("thuc_tap_sinh", 8)
    _Ba cách gọi trong một câu. Không ai thắng._
* [📅 "Cảm ơn em. Mình đưa mục 'tặng hoa' vào biên bản họp luôn nhé."]
    ~ tp_hop(1)
    ~ qh("thuc_tap_sinh", 3)
    chua_te_deadline: *(thì thầm)* Ổng biên bản luôn cái bó hoa…
    ~ qh("chua_te_deadline", -2)
* [🤭 "Thế em có mang hoa cho anh Lĩnh không? Anh ấy mới là người dạy anh… à, dạy cả phòng."]
    _{editor} đang ngủ gật bỗng mở một mắt._
    thuc_tap_sinh: Dạ có ạ! Em để trên bàn dựng của anh Lĩnh rồi ạ!
    ~ qh("editor", 5)
    ~ tp_lo(2)
- _Cuối bàn, {con_ong_chau_cha} ngồi họp đủ 2 tiếng. Lần đầu tiên. Trước mặt là cuốn sách "Khóa Quản Lý Có Tâm" do {giam_doc} giao._
con_ong_chau_cha: *(lẩm bẩm)* "Nhân viên xin tăng lương, em nói gì?"… Trời đất.
* [🪑 "Cậu đọc to lên cho cả phòng học cùng đi."]
    con_ong_chau_cha: Ông muốn nghe hả? "Đáp án đúng: Anh không ép, tùy em."
    _Cả phòng cười rần. {con_ong_chau_cha} cũng cười. Bạn hơi tiếc vì cuộc chế giễu biến thành tiết mục hài._
    ~ qh("con_ong_chau_cha", -3)
    ~ tp_ca_phong(2)
* [🤝 "Câu đó đáp án thật là: hỏi xem em ấy cần gì."]
    con_ong_chau_cha: *(nhìn bạn)* Ủa… ông nói nghe được đó.
    ~ qh("con_ong_chau_cha", 6)
* [😶 Kệ cậu ta.]
    ~ cang_thang(2)
- -> END

// ------------------------------------------------------------
=== truong_phong_0610_chup_poster ===
# ngay:6 # gio:09:30 # noi:studio_tang_2 # bat_buoc
~ tp_lich_co_dinh()
_Buổi chụp poster đầu tiên. Đèn studio sáng trưng. {sieu_nhan_hong} tạo dáng thứ 47._
designer: Anh Nhật, cho em xin feedback cụ thể được hông? "Hồng hơn nữa" là hồng cỡ nào ạ?
_Đúng lúc đó, điện thoại của {sieu_nhan_hong} reo. Ngoài cửa sổ, một bà cụ đánh rơi cả giỏ cam giữa đường._
sieu_nhan_hong: Biến hình! Điều khoản số 3 nha mọi người! Anh đi chút về liền!
_{sieu_nhan_hong} lao ra cửa, áo choàng hồng bay phấp phới._ # hen_gio:6
* [🏃 Đuổi theo, vác theo máy quay.]
    ~ nghi(-15)
    _Bạn chạy hai dãy phố, thở như cái quạt hỏng. Máy quay thì vẫn chạy._
    sieu_nhan_hong: Ủa em theo anh chi vậy? À quay hả! Quay đi, quay đẹp nha!
    ~ follow(10000)
    ~ qh("sieu_nhan_hong", 8)
    ~ tp_quay_ba_cu = true
    _Bạn có đoạn phim {sieu_nhan_hong} nhặt từng quả cam, bóc một quả cho bà cụ ăn._
* [☕ "Cả đoàn nghỉ 30 phút. Duy, mua nước cho mọi người."]
    ~ tp_ca_phong(5)
    ~ qh("designer", 3)
    _Cả đoàn ngồi bệt xuống sàn studio. {designer} lần đầu tiên trong tuần được uống nước mà không ai hỏi "xong chưa"._
    ~ cang_thang(-5)
* [📅 "Trong lúc chờ, mình họp nhanh 5 phút về tình huống phát sinh nhé."]
    ~ tp_hop(1)
    ~ tp_ca_phong(-3)
    _Cuộc họp về "tình huống phát sinh" kéo dài tới khi {sieu_nhan_hong} quay lại. Rồi kéo dài thêm 20 phút._
* [⏱️ (Không chọn kịp)]
    _Bạn đứng giữa studio, tay cầm tờ kịch bản, miệng mở mà không nói được gì._
    designer: Anh Nhật… anh ổn hông?
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== truong_phong_0610_clip_ba_cu ===
# ngay:6 # gio:16:30 # noi:phong_san_xuat
_Chiều. Một clip quay bằng điện thoại của người qua đường đang lan khắp Tóp-tóp: Siêu Nhân Hồng nhặt cam cho bà cụ._
~ follow(30000)
hong_hot: Ét o ét! Clip bà cụ lên xu hướng rồi anh Nhật! Lượt xem đang nhảy như chạy KPI!
dan_dau_tu: *(ló đầu qua vách ngăn)* Số liệu cho thấy: đăng thêm góc quay khác trong 3 tiếng tới thì lượt xem nhân ba. Không phải coin đâu, lần này là số thật.
* [📈 "Lĩnh, dựng ngay bản 60 giây từ máy quay của anh. Đăng trước 19 giờ."]
    { tp_quay_ba_cu:
        editor: *(ngáp)* Có góc quay của anh hả… ok, 40 phút.
        ~ follow(90000)
        ~ qh("dan_dau_tu", 8)
        _Bản dựng 60 giây có cảnh bà cụ cười móm mém. Lượt xem gấp 12 lần MV nhà làm. Bạn không biết nên vui hay nên lo._
    - else:
        editor: Anh đâu có quay góc nào đâu anh…
        ~ follow(10000)
        _Không có tư liệu, chỉ đăng lại clip người qua đường. Vẫn tăng, nhưng ít._
    }
* [📅 "Chiều mai mình họp đánh giá hiệu ứng clip rồi tính."]
    ~ tp_so_lan_take_note = tp_so_lan_take_note + 1
    dan_dau_tu: Mai là nguội rồi em ơi. Trend nó như coin, sáng có chiều mất.
    ~ qh("dan_dau_tu", -5)
* [🎨 "Quỳnh làm ngay một cái thumbnail hồng, chữ to: 'Người Hùng Đi Nhặt Cam'."]
    designer: Dạ! Lần này em làm luôn, khỏi sửa nha anh.
    ~ follow(20000)
    ~ qh("designer", 5)
    ~ tp_so_video_toptop = tp_so_video_toptop + 1
- -> END

// ------------------------------------------------------------
=== truong_phong_0710_moc_1 ===
# ngay:7 # gio:17:00 # noi:phong_giam_doc
~ tp_lich_co_dinh()
_Mốc 1 của chiến dịch: 50.000 người theo dõi. {giam_doc} gọi bạn lên phòng._
{ nguoi_theo_doi >= 50000:
    giam_doc: Qua mốc rồi! Nhật, anh thấy phòng em chạy tốt đấy. Cứ giữ cái energy này.
    ~ tp_ghe(3)
    _Trên bàn {giam_doc} có một tấm ảnh {giam_doc} chụp với ai đó mặc vest, mặt bị che bởi lọ hoa._
- else:
    giam_doc: Chưa tới 50.000. Anh không ép, nhưng tối nay cả công ty ở lại để anh truyền lửa 3 tiếng.
    _Cuộc họp truyền lửa của {giam_doc} không tính vào số cuộc họp của bạn. Nhưng nó tính vào thời gian sống của bạn._
    ~ cang_thang(15)
    ~ nghi(-20)
}
giam_doc: Mà này. Ghế Phó Giám đốc, anh chưa quyết đâu. Long nó cũng… có tiềm năng.
* [🪑 "Dạ, em sẽ cho anh thấy bằng kết quả ạ."]
    giam_doc: Tốt. Anh thích người nói ít làm nhiều. *(ngừng)* Mà em nói cũng hơi nhiều đấy.
    ~ tp_ghe(2)
* [🐍 "Long tuần này đi trễ 3 lần rồi anh ạ."]
    giam_doc: Anh biết. Anh là chú nó mà. *(thở dài)* Thôi, em về đi.
    ~ tp_ghe(-3)
    ~ qh("giam_doc", -3)
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
* [😶 "Dạ."]
    _Bạn bước ra. Ngoài hành lang, {con_ong_chau_cha} đang ngồi bấm điện thoại, có vẻ như đang đợi đến lượt mình._
- -> END

// ------------------------------------------------------------
=== truong_phong_0810_linh_di_kham_mat ===
# ngay:8 # gio:10:00 # noi:phong_dung_phim
~ tp_lich_co_dinh()
_Ngày Thị giác Thế giới. {hr} bắt {editor} đi khám mắt. Phòng dựng trống không. Còn đúng một ngày nữa là ra MV._
_Trên màn hình, timeline MV đang mở. Bản dựng còn thiếu cảnh cuối. Con trỏ nhấp nháy._
* [🛠️ Ngồi vào ghế của Lĩnh, thử kéo một đoạn clip.]
    { tp_tay_nghe >= 5:
        _Bạn nhớ phím C. Bạn cắt được một đoạn. Bạn kéo nó vào đúng chỗ. Tim đập như vừa ghi bàn._
        ~ tp_tn(5)
    - else:
        _Bạn kéo đoạn clip. Cả timeline trượt sang phải. Bạn bấm Ctrl+Z 14 lần. Mọi thứ trở lại như cũ, kể cả nhịp tim._
        ~ tp_tn(2)
        ~ cang_thang(8)
    }
* [📞 Gọi {chua_te_deadline}: "Cậu là điều phối, cậu lo vụ này."]
    chua_te_deadline: Còn sớm mà anh. Mai mới ra mà. Chill.
    ~ qh("chua_te_deadline", -3)
    ~ cang_thang(5)
* [🤝 Mua một hộp thuốc nhỏ mắt và mì ly, đặt sẵn lên bàn Lĩnh.]
    ~ tien_cong(-45000)
    ~ qh("editor", 8)
    _Chiều, {editor} về, thấy hộp thuốc và ly mì. Không nói gì. Nhưng bạn nghe tiếng bàn phím gõ nhanh hơn thường lệ._
- -> END

// ------------------------------------------------------------
=== truong_phong_0810_hoc_dem ===
# ngay:8 # gio:22:30 # noi:phong_dung_phim
_22 giờ 30. Văn phòng tối, chỉ còn đèn hành lang. Bạn lén mở máy dựng phụ, đeo tai nghe, bật video hướng dẫn "Bài 1: Cắt và ghép"._
_Giọng người hướng dẫn ngái ngủ: "Mấy bạn nhớ nha, render xong là xong."_
* [🌙 Học tới hết bài.]
    -> truong_phong_mg_hoc_lom
* [🔍 Tò mò bấm vào trang chủ kênh "Cú Đêm Cắt Ghép".]
    _Avatar con cú đeo tai nghe. Video mới nhất đăng lúc 3 giờ sáng. Phần giới thiệu: "Dựng phim ban đêm, ngủ ban ngày."_
    _Ban ngày ngủ, ban đêm dựng. Bạn quen một người như thế. Bạn lắc đầu: không thể nào._
    ~ tp_tn(2)
* [😴 Gập máy, về ngủ.]
    ~ nghi(10)
- _Dưới sân, đèn chòi bảo vệ vẫn sáng. Bác {bac_bao_ve} ngẩng lên nhìn đúng ô cửa sổ tầng 2. Rồi cúi xuống uống trà._
-> END

// ------------------------------------------------------------
=== truong_phong_0910_credits ===
# ngay:9 # gio:06:30 # noi:phong_dung_phim # bat_buoc
~ tp_lich_co_dinh()
_6 giờ 30 sáng ngày ra MV. {editor} ngồi đó từ hôm qua, mắt đỏ như đèn ghi hình._
editor: *(ngáp)* Anh Nhật… file credits đây. Anh duyệt rồi em… render. Render xong là xong.
_Màn hình cuối của MV: "Sản xuất: Nhật". Không có tên ai khác._
* [🎭 "Ổn rồi em. Cứ thế mà xuất."]
    ~ tp_nhan_cong()
    ~ tp_ghe(5)
    ~ tp_mv_dung_han = true
    editor: …Dạ.
    _{editor} gật đầu, không nói gì thêm. Bạn không thấy {editor} mở một file ghi chú tên "Danh sách" và gõ thêm một dòng._
* [🙏 "Thêm dòng 'Dựng phim: Lĩnh' to bằng dòng của anh nhé."]
    ~ tp_ghi_cong()
    ~ tp_lo(-15)
    ~ qh("editor", 20)
    ~ tp_mv_dung_han = true
    editor: …Dạ. Lần đầu tiên luôn á anh.
* [📝 "Cái này mình take note lại, họp tiếp sau nhé."]
    ~ tp_so_lan_take_note = tp_so_lan_take_note + 1
    ~ tp_hop(1)
    ~ follow(-10000)
    _MV ra mắt trễ 3 tiếng. {editor} ngủ gục luôn trên bàn phím, mặt in hình chữ J, K, L._
    ~ qh("editor", -8)
    ~ tp_mv_dung_han = true
* {tp_tay_nghe >= 20} [🔒 "Em dạy anh cách thêm chữ vào cuối video được không? Anh tự làm."]
    _{editor} nhìn bạn rất lâu. Rồi kéo cái ghế bên cạnh ra._
    editor: Ngồi đi anh. Bấm chữ T. Gõ vô. Kéo ra sau cùng.
    _Bạn gõ: "Sản xuất: Nhật. Dựng phim: Lĩnh." Hai dòng. Bạn tự gõ._
    ~ tp_tn(10)
    ~ tp_ghi_cong()
    ~ tp_lo(-10)
    ~ qh("editor", 25)
    ~ tp_mo_ca_dem = true
    ~ tp_mv_dung_han = true
- -> END

// ------------------------------------------------------------
=== truong_phong_0910_ra_mat_mv ===
# ngay:9 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Cả công ty tập trung xem MV đầu tiên của Siêu Nhân Hồng trên máy chiếu. Căn tin hôm nay chỉ bán trứng (Ngày Trứng Thế giới), nên ai cũng cầm một quả trứng luộc._
{ qh_editor < -30:
    _Nhưng MV chưa xong. {editor} gửi tin nhắn: "Máy treo. Mai."_
    ~ tp_mv_dung_han = false
    ~ tp_mv_tre = true
    ~ follow(30000)
    giam_doc: Ơ? Thế là sao Nhật?
    ~ tp_ghe(-8)
    _MV ra mắt trễ một ngày. Không ai hỏi vì sao máy treo đúng sáng nay._
- else:
    ~ follow(60000)
    ~ tp_ghe(5)
    _MV chạy. Hồng, sáng, nhịp nhanh. Ở giây 2:47, có một con cú nhỏ lướt qua một khung hình. Không ai thấy._
    giam_doc: Đỉnh! Ai làm cái này?
}
_Mọi ánh mắt nhìn về phía bạn._
* [🎭 "Phòng em làm ạ. Em dựng mất 3 đêm."]
    ~ tp_nhan_cong()
    ~ tp_ghe(5)
    _Ở hàng ghế cuối, {editor} lặng lẽ bóc vỏ quả trứng, rất chậm._
    ~ qh("editor", -10)
    { RANDOM(1, 10) <= 3:
        thuc_tap_sinh: Dạ… sao file ghi người dựng là anh Lĩnh mà mình nói là anh Nhật ạ?
        _Cả phòng im phăng phắc. {hong_hot} gõ điện thoại nhanh như máy khâu._
        ~ tp_lo(15)
    }
* [🙏 "Phòng em làm. Người dựng là Lĩnh. Vũ chạy tiến độ. Quỳnh làm hình. Oánh viết lời dẫn."]
    ~ tp_ghi_cong()
    ~ tp_ghe(-5)
    ~ tp_lo(-15)
    ~ tp_ca_phong(10)
    giam_doc: Thế còn em?
    truong_phong: Em… họp ạ.
    _Cả phòng cười. Lần này không phải cười chế giễu._
* [🧱 Lên bảng trắng vẽ "Quy trình sản xuất MV 12 bước".]
    ~ tp_hop(1)
    giam_doc: Ừ… anh không hiểu lắm, nhưng nhìn chuyên nghiệp đấy.
    ~ tp_ghe(2)
- -> END

// ------------------------------------------------------------
=== truong_phong_0910_hong_coin ===
# ngay:9 # gio:22:40 # noi:can_501_pho_moi
_Đêm. Group "Hội ăn trưa" sáng đèn. {dan_dau_tu} gửi một ảnh chụp màn hình: "$HONG – Hồng Coin vừa ra đời. Fan nào đó tạo. Lần này là lên thật!"_
dan_dau_tu: Ai vô hông? Đồng đầu tiên mang tên idol công ty mình đó!
* [📅 "Mai họp nhanh về rủi ro truyền thông của coin này."]
    ~ tp_hop(1)
    dan_dau_tu: Họp chi em, coin đâu có đợi họp.
    _Nhưng bạn đã ghi vào lịch. Lịch của bạn chưa bao giờ biết từ chối._
* [💸 Bỏ 500.000đ vào thử.]
    ~ tien_cong(-500000)
    dan_dau_tu: Đó! Có tầm nhìn! Ghế Phó là phải vầy!
    ~ qh("dan_dau_tu", 10)
    _Bạn không biết mình vừa mua cái gì. Nhưng {dan_dau_tu} gửi một biểu tượng tên lửa._
* [😶 Đã xem, không trả lời.]
    ~ nghi(5)
- -> END

// ------------------------------------------------------------
=== truong_phong_1010_chuyen_ha_noi ===
# ngay:10 # gio:15:00 # noi:chot_bao_ve
_Thứ Bảy, Ngày Giải phóng Thủ đô. Lương chưa về. Bạn ghé công ty lấy tài liệu, thấy {giam_doc} đang ngồi uống trà trong chòi bảo vệ._
giam_doc: Nhật! Vào đây. Ba thằng miền Bắc ngồi kể chuyện Hà Nội cho vui.
bac_bao_ve: Ngồi đi. Trà mới pha.
_Radio đang phát một bài hát về mùa thu Hà Nội. Ngoài kia, Thành Phố Ước Mơ nắng chang chang._
* [😇 "Hồi bé cháu hay ăn kem Tràng Tiền, đứng ăn ngay vỉa hè cho mát."]
    giam_doc: Anh cũng thế! Ăn xong lau tay vào quần, về bị mắng.
    ~ qh("giam_doc", 8)
    ~ tp_ghe(5)
    giam_doc: Hồi ấy anh mới 21 tuổi, anh Genta…
    _{giam_doc} dừng lại. Bác {bac_bao_ve} rót thêm trà, không hỏi gì. Bạn cũng không hỏi._
* [📊 "Nhân tiện anh ở đây, em báo cáo nhanh tiến độ tuần sau ạ."]
    ~ tp_hop(1)
    giam_doc: Thứ Bảy mà em. *(thở dài)* Thôi, nói đi.
    ~ qh("giam_doc", -3)
    _Bác {bac_bao_ve} quay radio to lên một nấc._
* [🍵 Ngồi im nghe hai người kể, thỉnh thoảng gật đầu.]
    ~ cang_thang(-10)
    ~ qh("bac_bao_ve", 5)
    ~ tp_ghe(2)
    _Hôm đó bạn không nói gì về công việc. Lạ là bạn không thấy mình thừa._
- _Lúc về, bạn thấy trên bàn trong chòi có một tấm thiệp cũ, chữ viết tay: "Mừng sinh nhật Bình, 10/10. G."_
* [🎂 "Hôm nay là sinh nhật bác ạ?"]
    bac_bao_ve: *(cất tấm thiệp đi)* Ừ… Già rồi, sinh nhật gì. Đừng kể ai nhé.
    ~ qh("bac_bao_ve", 15)
    _Bạn chạy ra tiệm, mua một hộp bánh bông lan. Bác ăn một miếng, rồi cất phần còn lại cho {cho}._
    ~ tien_cong(-60000)
* [😶 Coi như không thấy.]
    _Ở cái công ty này, ai cũng có một thứ cất trong ngăn bàn._
- -> END

// ------------------------------------------------------------
=== truong_phong_1110_anh_hoi_nho ===
# ngay:11 # gio:20:00 # noi:can_501_pho_moi
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Group công ty rủ nhau đăng ảnh hồi nhỏ. {designer} đăng ảnh 5 tuổi vẽ bậy lên tường._
* [💬 Bình luận: "Từ bé đã thích sửa nhà người khác nhỉ."]
    designer: Anh Nhật!!! Sửa nhẹ thôi là sửa cái gì ạ!
    _Bình luận được 14 lượt "haha". {designer} giận nửa ngày, rồi thả lại một tim._
    ~ qh("designer", 3)
* [📸 Đăng ảnh mình năm 7 tuổi, mặc áo sơ mi cài kín cổ, đang chủ trì "cuộc họp" với gấu bông.]
    hong_hot: Ối dồi ôi! Họp từ trong trứng luôn!
    ~ tp_ca_phong(3)
    ~ qh("hong_hot", 5)
    _Ảnh được ghim lên đầu group. {giam_doc} thả tim. Lần đầu tiên bạn nổi tiếng vì một cái gì đó không phải biên bản._
* [😶 Chỉ thả tim ảnh của mọi người.]
    _Bạn lướt qua ảnh một đứa nhỏ mặc áo hồng trong xóm Cây Me, đứng cạnh một đứa khác đang khóc. Không biết ai đăng._
- -> END

// ------------------------------------------------------------
=== truong_phong_1210_hop_luong_tre ===
# ngay:12 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
~ tp_lich_co_dinh()
_Thứ Hai. Lương vẫn chưa về. Group Zalo-lô sôi như nồi lẩu. Bạn quyết định: phải họp._
~ tp_hop(1)
truong_phong: Hôm nay mình họp về việc lương về trễ.
chua_te_deadline: Ủa anh biết lương ở đâu hả?
truong_phong: …Không.
bien_kich: Vậy mình họp để cùng không biết hả anh. Nghe như một bài thơ buồn.
* [📞 Gọi {ke_toan} vào họp cùng.]
    ke_toan: *(đứng ở cửa, nói rất chậm)* Ngân hàng đang… "kiểm tra giao dịch lớn". Chiều nay về. Hết.
    _{ke_toan} đi ra. Cuộc họp mất 4 phút. Bạn nhìn đồng hồ, choáng váng._
    ~ tp_hop_5_phut_that = true
    ~ qh("ke_toan", 3)
    ~ tp_ca_phong(5)
* [🧱 Vẽ sơ đồ "Dòng chảy của tiền lương" lên bảng trắng.]
    ~ tp_hop(1)
    _Sơ đồ có 6 mũi tên, mũi tên cuối chỉ vào một dấu hỏi to. Mọi người gật đầu, không ai hiểu, ai cũng đói hơn._
    ~ tp_ca_phong(-5)
* [🍞 "Thôi giải tán, anh mời cả phòng ăn sáng."]
    ~ tien_cong(-150000)
    ~ tp_ca_phong(8)
    thuc_tap_sinh: Dạ… anh Nhật đỉnh nóc kịch trần ạ!
    _Cuộc họp ngắn nhất tháng. Bánh mì ngon nhất tháng._
- -> END

// ------------------------------------------------------------
=== truong_phong_1210_luong_ve ===
# ngay:12 # gio:15:30 # noi:phong_san_xuat
_15 giờ 30. Điện thoại cả phòng rung cùng lúc. Lương về._
~ tien_cong(25000000)
_25.000.000đ. Bạn nhìn số tiền, rồi nhìn cái lịch họp tuần này: 23 cuộc._
designer: *(thở ra như vừa nộp xong file)* Về rồi… Em tưởng phải đi bán thận.
* [🍰 Đặt bánh bông lan cho cả phòng.]
    ~ tien_cong(-200000)
    ~ tp_ca_phong(3)
    ~ tp_co_banh_bong_lan = true
    _Mỗi người một miếng. {editor} để phần của mình trên bàn, sáng mai mới ăn._
* [📅 "Lương về rồi, mình tranh thủ họp bù tiến độ."]
    ~ tp_hop(1)
    ~ tp_ca_phong(-5)
    chua_te_deadline: *(nói với {designer})* Lương về mà không được vui 5 phút luôn hả bà.
* [💰 Lặng lẽ chuyển 500.000đ cho {thuc_tap_sinh}: "Ứng trước tiền đi lại tuần này."]
    ~ tien_cong(-500000)
    ~ qh("thuc_tap_sinh", 10)
    thuc_tap_sinh: *(nhắn lại)* Dạ… em cảm ơn anh ạ. Dạ em… dạ không cần đâu ạ, nhưng em cảm ơn ạ.
    _Bạn không biết {thuc_tap_sinh} có một cái thẻ đen dưới gối. Bạn chỉ thấy một người lớn hơn mình ăn mì gói mỗi trưa._
- -> END

// ------------------------------------------------------------
=== truong_phong_1210_the_bi_tu_choi ===
# ngay:12 # gio:21:30 # noi:can_501_pho_moi
_Tối. {hong_hot} nhắn riêng cho bạn, kèm 3 biểu tượng mặt hoảng hốt._
hong_hot: Nghe gì chưa anh Nhật? Thẻ của Long bị từ chối ở quán Sống Ảo! Trước mặt tui, Hiếu với Duy luôn!
hong_hot: Mà ghê nữa, Duy giành trả, lỡ rút ra cái thẻ kim cương rồi cất cái vèo!
* [🐍 "Thế à. Mai cậu kể to lên ở pantry nhé."]
    ~ qh("hong_hot", 5)
    ~ qh("con_ong_chau_cha", -10)
    hong_hot: Khỏi kể, cả group Anti Sếp biết hết rồi anh.
    _Bạn thấy vui được 5 giây. Rồi thấy hơi kỳ._
    ~ cang_thang(3)
* [😶 "Chuyện riêng người ta, cậu đừng lan nữa."]
    hong_hot: Ủa anh Nhật bênh Long hả? Lạ nha!
    ~ qh("con_ong_chau_cha", 5)
    ~ qh("hong_hot", -3)
* [💬 "Thẻ gì của Duy? Kim cương là sao?"]
    hong_hot: Hông biết! Mà thẻ đó tui thấy mấy ông giám đốc ngân hàng xài á!
    _Bạn ghi vào sổ: "Duy – thẻ – ?". Rồi gạch đi. Chuyện của người ta._
- _Bạn nằm nghĩ: cháu sếp mà cũng bị từ chối thẻ. Cái ô của {con_ong_chau_cha} có khi không to như bạn tưởng._
-> END
