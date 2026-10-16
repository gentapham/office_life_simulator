// ============================================================
// IT: BẢO · CHƯƠNG 2: "LƯƠNG VỀ, MẠNG RỚT" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== it_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_tang_2 # bat_buoc
_Họp giao ban đầu tuần. Ngày Nhà giáo Thế giới. {thuc_tap_sinh} ôm một bó hoa to hơn người, đi tặng từng "thầy cô" trong phòng._
thuc_tap_sinh: Dạ anh {it}, em tặng anh! Anh là thầy dạy em "rút ra, đếm 10, cắm vô" ạ!
_Bạn cầm bông hoa. Đây là bông hoa đầu tiên bạn nhận ở công ty này trong 10 năm._
* [😇 "Cảm ơn. Đếm tới 10 nha."]
    thuc_tap_sinh: Dạ! Em đếm tới 10 rồi mới cắm ạ. Em thuộc rồi ạ!
    ~ qh("thuc_tap_sinh", 10)
    ~ cang_thang(-10)
* [🤝 "Học thêm bài hai: xóa bớt tab."]
    _Bạn chỉ {thuc_tap_sinh} cách đóng 60 tab trình duyệt. Máy {thuc_tap_sinh} nhanh như mới._
    thuc_tap_sinh: Trời ơi anh là thầy thật ạ! Em đi dạy lại anh {chua_te_deadline}!
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
    ~ it_cam_on()
    ~ qh("thuc_tap_sinh", 15)
- truong_phong: Rồi, mình vào việc. Họp nhanh 5 phút nhé. Cậu {it} báo cáo tình hình mạng tuần qua.
* [📜 "Ổn định 60%. Router cần thay."]
    truong_phong: 60% là đạt chưa? Mình take note lại, họp riêng sau nhé.
    _"Họp riêng sau" là cách {truong_phong} nói "không bao giờ"._
    ~ uy_tin = uy_tin + 2
* [😶 "Ổn."]
    truong_phong: Tốt. Cậu là người duy nhất báo cáo dưới 3 giây. Mình ghi nhận.
    ~ qh("truong_phong", 3)
- -> END

// ------------------------------------------------------------
=== it_0510_laptop_giam_doc ===
# ngay:5 # gio:15:30 # noi:phong_giam_doc
_{giam_doc} gọi: "Máy anh chậm quá em ơi." Bạn lên. Trình duyệt đang mở 87 tab, trong đó có 11 tab là cùng một trang sân golf._
giam_doc: Em làm cho nó nhanh giúp anh. Mà nhanh lên nhé, 4 giờ anh gọi cho ngân hàng.
_Trong lúc dọn máy, bạn thấy góc trình duyệt có hai tài khoản Phây-búc đang đăng nhập cùng lúc. Một là "{giam_doc} Nguyễn". Cái còn lại có ảnh đại diện là bông hoa hướng dương._
* [📜 Mở log đăng nhập, xem tài khoản thứ hai là ai.]
    _Tên: "Hoa Hướng Dương 1989". Tham gia group "Hội Anti Sếp" từ tháng 6. Hoạt động gần nhất: đọc bài của {hong_hot}, 23:12 tối qua._
    _1989. Năm sinh của {giam_doc}._
    ~ it_biet_clone = true
    ~ phat_hien(clone_thang)
    ~ it_truy_cap(10)
    ~ it_lt(-5)
    _Bạn đóng tab lại thật nhẹ, như đóng nắp một cái hộp có rắn._
* [🔄 Chỉ đóng bớt tab, không đụng vào tài khoản nào.]
    _Bạn đóng 80 tab, giữ lại 7 cái sân golf vì không dám. Máy chạy nhanh như gió._
    giam_doc: Ơ hay. Em làm gì mà nhanh thế? Em giỏi đấy.
    ~ it_lt(3)
    ~ qh("giam_doc", 5)
    ~ it_cam_on()
* [💬 "Anh đăng nhập hai tài khoản à?"]
    giam_doc: *(khựng lại 2 giây)* À… cái đấy là tài khoản… marketing. Em cứ để đấy.
    _Bạn để đấy. Nhưng bạn nhớ cái hoa hướng dương._
    ~ qh("giam_doc", -3)
    ~ it_truy_cap(3)
- -> END

// ------------------------------------------------------------
=== it_0610_buoi_chup_poster ===
# ngay:6 # gio:10:00 # noi:studio # bat_buoc
_Buổi chụp poster đầu tiên. Bạn treo đèn, kéo dây, chỉnh màu. Đèn hồng, đèn hồng nữa, đèn hồng thêm._
designer: Anh {it}, cho em hồng ấm hơn chút. Hồng này hồng lạnh quá, hồng như cái bill tiền điện.
sieu_nhan_hong: Biến hình! Vì công lý và lượt view!
_10:30. Đang chụp tấm thứ 12 thì {sieu_nhan_hong} nhìn ra cửa sổ: ngoài Đường Hóng, gần đầu Hẻm 69, xe chè của Bà Bảy sụp bánh xuống ổ gà._
sieu_nhan_hong: Khoan! Khoan! Có người cần giúp! Hợp đồng điều 3 nha mọi người!
_{sieu_nhan_hong} chạy mất. Cả studio đứng hình. Camera quay test của bạn vẫn đang chạy, chĩa ra cửa sổ._
* [🎥 Để camera chạy tiếp, quay trọn cảnh đẩy xe chè.]
    _Bạn xoay camera, zoom vào. Một bộ đồ hồng đẩy xe chè lên khỏi ổ gà, rồi ngồi xuống ghế nhựa, ăn ly chè bằng ống hút luồn qua mũ. Cô gái phụ bán chè nhìn anh rất lâu._
    _Bạn gửi file cho {hong_hot}. {hong_hot} đăng lúc 11:00._
    hong_hot: Anh {it} ơi! Clip này bay rồi! Bay cao hơn cái MV đang làm nữa!
    ~ qh("hong_hot", 10)
    ~ qh("sieu_nhan_hong", 5)
* [💡 Tắt đèn, tiết kiệm điện trong lúc chờ.]
    _Bạn tắt đèn. Studio tối om. Ai đó ngoài đường quay được clip bằng điện thoại, mờ mờ, nhưng vẫn lên mạng._
    designer: Ủa sao tắt đèn? Em đang chỉnh màu mà!
    ~ qh("designer", -3)
* [😶 Ngồi xuống ăn mì ly.]
    _Bạn ăn mì. Lúc {sieu_nhan_hong} quay lại thì mì vừa hết. Thời gian rất khớp._
    ~ an(25)
- _Buổi chụp xong lúc 6 giờ chiều. {designer} nói poster "chưa đủ wow". Bạn đồng ý: đèn hồng không thể đủ wow bằng một xe chè._
-> END

// ------------------------------------------------------------
=== it_0710_tang_follow_bang_code ===
# ngay:7 # gio:16:00 # noi:phong_giam_doc # bat_buoc
_Mốc 1: 50.000 người theo dõi. {giam_doc} gọi bạn lên, đóng cửa, kéo rèm._
{ nguoi_theo_doi >= 50000:
    giam_doc: Mình qua mốc 1 rồi. Nhưng anh muốn nhanh hơn nữa. Em là IT. Có cách nào tăng follow bằng code không?
- else:
    giam_doc: Mình chưa đạt mốc 1. Anh sắp phải "truyền lửa" cả công ty 3 tiếng. Em là IT. Có cách nào tăng follow bằng code không?
}
* [😇 "Không có. Có cũng không làm."]
    giam_doc: Em cứng thế. Thôi được. Anh tôn trọng. Anh không ép, tùy em.
    _{giam_doc} nhìn bạn lâu hơn bình thường. Có thể là tôn trọng. Có thể là đang nhớ tên bạn để sau này._
    ~ it_lt(5)
    ~ qh("giam_doc", -2)
* [🐍 "Có. Nhưng anh hỏi {idol_het_thoi}. Ảnh biết lâu rồi."]
    giam_doc: {idol_het_thoi}? Nó biết gì?
    it: Dịch vụ "Like Thật 100%".
    _{giam_doc} ngồi im. Hồi 2015, chính {giam_doc} lăng xê {idol_het_thoi} bằng người thật._
    giam_doc: Thôi… chuyện của nó, để anh hỏi sau.
    ~ phat_hien(fan_ao_phat)
    ~ qh("idol_het_thoi", -10)
    ~ it_lt(-3)
* [📊 "Code không tăng follow. Mạng ổn mới tăng."]
    it: Livestream không rớt. Upload đúng giờ.
    giam_doc: Ừ… Thế là em đang xin tiền router đấy à?
    it: Dạ.
    giam_doc: Anh thích cái thẳng thắn. Đưa đây anh ký thêm. Thế là 2 chữ ký rồi nhỉ?
    _Bạn không nhắc rằng tờ giấy đó đã mất. Bạn chỉ in tờ mới._
    ~ qh("giam_doc", 5)
    ~ it_on(5)
- -> END

// ------------------------------------------------------------
=== it_0810_kham_mat ===
# ngay:8 # gio:13:30 # noi:phong_dung_phim
_Ngày Thị giác Thế giới. {editor} bị {chi_dai} lôi đi khám mắt. Trước khi đi, {editor} ôm lấy cánh tay bạn._
editor: *(ngáp)* Anh {it}… máy em đang render MV. Còn 4 tiếng nữa. Đừng để ai tắt. Đừng để ai… restart.
_{editor} đi rồi. Mười phút sau, {truong_phong} bước vào phòng dựng, nhìn cái màn hình đang chạy thanh tiến trình._
truong_phong: Máy này chạy gì mà quạt kêu to thế? Tắt đi bật lại cho nhẹ máy, cậu {it}.
* [🛡️ Đứng chắn trước máy.]
    it: Không được. Render.
    truong_phong: Render là cái gì ấy nhỉ? À… à, mình biết. Ừ. Thôi để đấy.
    _{truong_phong} rút lui. Bạn biết {truong_phong} không biết render là gì. Bạn cũng biết {truong_phong} sẽ nhận công cái MV này._
    ~ qh("editor", 15)
    ~ it_on(3)
* [🔄 "Dạ anh." Rồi restart.]
    _Thanh tiến trình biến mất. Màn hình đen. Đâu đó trong phòng khám mắt, {editor} chợt rùng mình._
    ~ qh("editor", -30)
    ~ qh("truong_phong", 5)
    ~ it_do_toi(10)
    ~ it_so_lan_restart = it_so_lan_restart + 1
* [💬 "Anh họp với ổng đi. Em canh máy."]
    truong_phong: Họp với ai? Với cái máy à? Ừ, ý hay đấy, cậu ghi lại giúp mình.
    _{truong_phong} ngồi xuống cạnh cái máy, mở sổ, "họp" với thanh tiến trình suốt 40 phút. Máy vẫn chạy._
    ~ qh("editor", 10)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== it_0910_can_tin_trung ===
# ngay:9 # gio:12:00 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng: trứng chiên, trứng luộc, trứng hấp, trứng ốp-la hình trái tim (hồng, do phẩm màu)._
hong_hot: Anh {it}, tối nay 20:00 ra mắt MV đó nha. Mạng mà rớt là tui khóc ngay trên livestream cho anh coi.
_Bạn nhìn quả trứng. Quả trứng nhìn lại bạn. Cả hai đều mong tối nay không vỡ._
* [🥚 Mua trứng luộc, ăn nhanh, về canh server.]
    ~ an(30)
    ~ tien_cong(-15000)
    ~ it_on(5)
    _Bạn ăn trong 3 phút, rồi về phòng server kiểm tra từng cổng mạng như kiểm tra mạch của bệnh nhân._
* [🤝 "Tối nay mọi người đừng xem Tóp-tóp."]
    hong_hot: Anh nói vậy khác gì kêu cá đừng bơi! Mà thôi, để tui nhắn group giùm anh.
    _Group Zola: "Tối nay 18:00 tới 20:00 ai coi Tóp-tóp bằng wifi công ty, IT biết hết đó nha (IT nói)." 21 người đã xem. 3 người thả tim._
    ~ qh("hong_hot", 5)
    ~ it_on(10)
    ~ an(30)
    ~ tien_cong(-15000)
- -> END

// ------------------------------------------------------------
=== it_0910_dua_upload ===
# ngay:9 # gio:18:00 # noi:phong_dung_phim # bat_buoc
_18:00. {editor} vừa xuất xong file MV: 40GB. Phải lên mạng trước 20:00. Thanh tiến trình nói "còn 3 tiếng 40 phút"._
editor: *(mắt đỏ)* Anh {it}… em làm hết phần em rồi. Phần còn lại là của anh với cái router.
_Bạn mở bảng băng thông. Cả công ty đang dùng: {chua_te_deadline} xem Tóp-tóp, {dan_dau_tu} mở 6 cái chart, {con_ong_chau_cha} đăng story 4K._
* [🐢 Bóp băng thông của cả công ty, dồn hết cho upload.]
    _Bạn kéo thanh trượt. Tóp-tóp của {chua_te_deadline} đứng hình. Chart của {dan_dau_tu} đứng ở một cây nến đỏ. Story của {con_ong_chau_cha} xoay vòng._
    chua_te_deadline: Ủa wifi sao vậy anh? Tui đang coi clip con mèo mà!
    dan_dau_tu: {it}! Chart anh đứng rồi! Đứng ngay đáy!
    _Thanh upload bắt đầu chạy nhanh: còn 1 tiếng 30 phút._
    ~ it_do_toi(10)
    ~ qh("chua_te_deadline", -5)
    ~ qh("dan_dau_tu", -5)
    ~ qh("editor", 10)
    ~ it_on(5)
* [🔌 Cắm dây trực tiếp từ máy {editor} vào modem tầng trệt.]
    _Bạn kéo một sợi dây 30 mét từ tầng 2 xuống tầng trệt, đi qua cầu thang, băng qua ổ của {cho}._
    cho: Gâu? *(ngửi sợi dây, rồi nằm đè lên nó)*
    bac_bao_ve: Để bác giữ con chó cho. Cháu cứ làm đi.
    ~ qh("bac_bao_ve", 5)
    ~ it_on(10)
    ~ nghi(-15)
* [😶 Ngồi chờ, cầu nguyện.]
    _Bạn nhìn thanh tiến trình. Nó nhìn lại bạn. Nó chạy chậm hơn khi bị nhìn._
    ~ cang_thang(15)
    ~ it_on(-5)
- _19:58. Thanh tiến trình: 100%. Bạn thở ra. {editor} ngủ gục trên bàn phím._
-> END

// ------------------------------------------------------------
=== it_0910_cong_chieu ===
# ngay:9 # gio:20:00 # noi:studio # bat_buoc
_20:00. Công chiếu MV "Hồng Hóa Việt Nam" kèm livestream. {sieu_nhan_hong} vẫy tay trước camera. 2.000 người đang xem. 5.000. 8.000._
_Đèn trên router chớp đỏ. Một lần. Hai lần._
hong_hot: Anh {it}! Hình đang giật! Mặt Siêu Nhân Hồng đứng hình giữa lúc đang há miệng! # hen_gio:5
* [🔄 Khởi động lại router.]
    { it_on_dinh >= 60:
        _Router tắt, bật lại trong 40 giây. Livestream rớt 40 giây, rồi trở lại. Người xem vẫn còn đó._
        ~ follow(15000)
        ~ it_so_lan_restart = it_so_lan_restart + 1
    - else:
        _Router tắt. Router không bật lại. Livestream kết thúc với khung hình {sieu_nhan_hong} há miệng._
        ~ follow(-30000)
        ~ it_do_toi(15)
        ~ it_su_co_am_thanh = true
        { RANDOM(1, 10) <= 3:
            _Rồi khung hình đó thành meme "Siêu Nhân Hồng đứng hình". Tóp-tóp tràn ngập._
            ~ follow(10000)
        }
    }
* [📱 Phát 4G từ điện thoại của bạn cho máy livestream.]
    _Bạn bật điểm phát sóng. Livestream chạy tiếp, mượt. Gói 4G của bạn chết lúc 20:47, nhưng đã đủ._
    ~ follow(25000)
    ~ qh("hong_hot", 10)
    ~ tien_cong(-100000)
    hong_hot: Anh {it} cứu cả buổi luôn! Cảm ơn anh nha!
    ~ it_cam_on()
* [⏱️ (Không chọn kịp)]
    _Livestream đứng hình 2 phút. Bình luận tràn: "Lag quá", "Siêu Nhân Hồng bị đóng băng hả?"._
    ~ follow(-15000)
    ~ it_do_toi(10)
- _23 giờ. Bạn còn ngồi trong phòng server thì thấy một tin trên mạng: ai đó vừa tạo ra một đồng coin tên "Hồng Coin", hình chiếc mũ hồng._
_Bạn có linh cảm xấu, giống linh cảm khi nghe tiếng quạt server kêu lạ._
-> END

// ------------------------------------------------------------
=== it_1010_luong_chua_ve ===
# ngay:10 # gio:10:00 # noi:phong_server
_Thứ 7, ngày 10. Lẽ ra là ngày lương. Group Zola: 147 tin nhắn, toàn là "lương về chưa?"._
_Bạn đang ở công ty canh server. Trong lúc dọn dữ liệu nhân sự cũ, bạn thấy hồ sơ năm 2010 của Bác {bac_bao_ve}: "Ngày sinh: 10/10/1976"._
_Hôm nay. Tròn 50 tuổi. Không ai biết._
* [🎂 Ra tiệm mua một cái bánh bông lan nhỏ, cắm một cây nến.]
    ~ tien_cong(-60000)
    ~ it_biet_sinh_nhat_binh = true
    _Bạn mang bánh ra chòi bảo vệ. {bac_bao_ve} đang nghe radio, nhìn cái bánh rất lâu._
    bac_bao_ve: Sao… sao cháu biết?
    it: Dữ liệu nhân sự.
    bac_bao_ve: Mười sáu năm rồi. Chỉ có một người nhớ ngày này thôi. Giờ thì hai người.
    _Bác thổi nến. {cho} ăn mất một nửa cái bánh. Không ai giận._
    ~ qh("bac_bao_ve", 20)
    ~ qh("cho", 5)
* [💬 Nhắn group: "Hôm nay sinh nhật Bác {bac_bao_ve}."]
    _Group im lặng 3 phút. Rồi 18 người gửi sticker bánh kem. {hong_hot} gửi 6 cái. Không ai hỏi lương nữa._
    bac_bao_ve: *(gọi điện)* Cháu… cháu bày vẽ làm gì. Thôi, bác cảm ơn.
    ~ it_biet_sinh_nhat_binh = true
    ~ qh("bac_bao_ve", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [😶 Đóng hồ sơ lại.]
    _Chuyện riêng của người ta. Bạn đóng hồ sơ, tiếp tục dọn dữ liệu. Nhưng cả ngày bạn cứ nghĩ tới cái số 50._
    ~ it_lt(2)
- -> END

// ------------------------------------------------------------
=== it_1010_confession ===
# ngay:10 # gio:23:10 # noi:phong_server
_23:04. Trang "Confession G-Entertainment" đăng bài: "Lương về trễ, sếp đi đánh golf. Ai còn tiền đổ xăng thì giơ tay."_
_Theo thói quen nghề nghiệp, bạn liếc log wifi. Máy đăng bài: "NGAN-LAPTOP", 23:04, wifi {cong_ty}._
_{hong_hot} lại ngủ ở công ty livestream khuya. Và lại quên dùng 4G._
* [🤐 Đóng log. Không thấy gì hết.]
    ~ it_lt(3)
    _Bạn với {hong_hot} có một thỏa thuận không lời: {hong_hot} không kể chuyện bạn ngủ ở công ty, bạn không kể chuyện cái laptop._
* [💬 Nhắn cho {hong_hot}: "Lần sau xài 4G."]
    hong_hot: ??? Anh nói gì tui hông hiểu…
    hong_hot: …
    hong_hot: Ok anh. Cảm ơn anh. Anh là két sắt biết đi.
    ~ qh("hong_hot", 15)
    ~ it_cam_on()
- ~ phat_hien(admin_confession)
-> END

// ------------------------------------------------------------
=== it_1110_truy_admin ===
# ngay:11 # gio:09:30 # noi:phong_giam_doc # bat_buoc
_Chủ nhật. {giam_doc} gọi bạn lên công ty. Ảnh hồi nhỏ của cả công ty đang tràn group (Ngày Quốc tế Trẻ em gái), nhưng {giam_doc} không quan tâm._
giam_doc: {it} này. Cái trang Confession nói anh đi đánh golf lúc lương chưa về. Em check log xem ai đăng cho anh nhé. Việc nhỏ thôi.
_Bạn biết câu trả lời: "NGAN-LAPTOP, 23:04"._
* [😇 "Đăng bằng 4G anh. Không truy được."]
    ~ it_giu_bi_mat_ngan = true
    ~ it_lt(5)
    { RANDOM(1, 10) <= 3:
        _Ba ngày sau, {giam_doc} nhờ {thanh_ninh} hỏi "anh họ làm IT". Anh họ nói: "Đăng giờ đó thường là wifi công ty"._
        giam_doc: Em nói 4G mà nhỉ? Anh không trách, nhưng anh nhớ đấy.
        ~ it_do_toi(20)
        ~ qh("giam_doc", -10)
    - else:
        giam_doc: Thế à. Thôi được. Anh cũng không chấp mấy đứa trẻ con.
    }
    { qh_hong_hot >= 20:
        _Tối đó {hong_hot} gửi cho bạn một ly trà sữa, kèm tờ giấy: "Em biết hết rồi. Em nợ anh."_
        ~ qh("hong_hot", 20)
    }
* [📜 "Máy của {hong_hot} anh."]
    ~ it_nop_ten_ngan = true
    giam_doc: {hong_hot} à? Ừ. Em làm tốt lắm. Từ nay có gì anh nhờ em check log nhé.
    _Thứ 2, {hong_hot} được mời đi "uống trà". {hong_hot} đi ngang bàn bạn, không nhìn._
    ~ qh("hong_hot", -60)
    ~ qh("giam_doc", 15)
    ~ it_truy_cap(10)
    ~ it_lt(-10)
* {it_biet_clone} [🔒 "Anh muốn biết admin thì em cũng muốn hỏi: tài khoản 'Hoa Hướng Dương 1989' là của ai vậy anh?"]
    _{giam_doc} đứng hình 3 giây. Tay cầm gậy golf hơi run._
    giam_doc: Thôi… chuyện này mình bỏ qua nhé. Em về nghỉ đi. Hôm nay chủ nhật mà.
    ~ it_nhanh_hai_tai_khoan = true
    ~ it_giu_bi_mat_ngan = true
    ~ qh("giam_doc", -10)
    ~ it_lt(3)
    _Từ hôm đó, {giam_doc} không bao giờ nhờ bạn truy ai nữa._
- -> END

// ------------------------------------------------------------
=== it_1210_luong_ve ===
# ngay:12 # gio:10:00 # noi:phong_server # bat_buoc
_Thứ 2, 12/10. Lương về trễ 2 ngày. Điện thoại "ting". Cả công ty đồng loạt thở ra một hơi, nghe như tiếng quạt server._
_Bạn nhìn số dư, rồi nhìn tờ đề xuất router 12.000.000đ dán trên tường, đã ngả vàng._
* [💾 Chuyển 5 triệu vào "quỹ router".]
    ~ tien_cong(-5000000)
    ~ it_tiet_kiem = it_tiet_kiem + 5000000
    _Quỹ router tăng. Bạn cảm thấy mình như một con sóc giấu hạt dẻ cho mùa đông kỹ thuật._
    ~ cang_thang(-5)
* [🛒 Tự bỏ tiền mua router mới luôn. Chờ ba chữ ký tới bao giờ?]
    ~ tien_cong(-6000000)
    ~ it_tiet_kiem = it_tiet_kiem - 6000000
    ~ it_mua_router_rieng = true
    ~ it_on(30)
    _Chiều đó shipper Tèo giao một cái hộp to. {cho} sủa ầm ĩ. Bạn lắp router mới, gỡ cái cũ quấn băng keo ra, đặt nó lên kệ như đặt một chiến binh về hưu._
    hong_hot: Ủa wifi gì mà nhanh dữ vậy? Anh {it} làm phép hả?
    ke_toan: Router mới hả? Hóa đơn đâu? Không có hóa đơn là công ty không hoàn tiền đâu nha.
    it: Tiền em.
    ke_toan: …Vậy thì… ờ… tui ghi nhận.
* [😶 Để nguyên. Mua một thùng mì ly mới.]
    ~ tien_cong(-200000)
    ~ an(20)
    _Một thùng 24 ly. Đủ cho 8 ngày, nếu không có ai mượn._
- -> it_1210_doi_no

= it_1210_doi_no
_Trên đường xuống pantry, bạn gặp {dan_dau_tu} ở cầu thang. {dan_dau_tu} đứng hình như con nai thấy đèn pha._
dan_dau_tu: {it}! Ờ… em khỏe hông? Anh định… tìm em đó.
* [💬 "Restart cái ví chưa anh?"]
    dan_dau_tu: Anh trả! Anh trả liền! Đây, anh chuyển cho em… 0,003 Hồng Coin. Đang lên đó em!
    _Điện thoại bạn nhận được 0,003 $HONG. Trị giá hiện tại: 41 đồng._
    ~ qh("dan_dau_tu", -3)
    ~ tien_cong(41)
* [🤝 "Trả 500 nghìn trước đi anh."]
    dan_dau_tu: *(nghĩ rất lâu)* …Ờ. Được. Anh trả 500. Em là người đầu tiên anh trả trong năm nay đó.
    ~ tien_cong(500000)
    ~ qh("dan_dau_tu", 5)
* [😶 Gật đầu, đi tiếp.]
    dan_dau_tu: *(nói với theo)* Lần này là lên thật, em tin anh!
    ~ qh("dan_dau_tu", 3)
- -> END

// ------------------------------------------------------------
=== it_1210_the_phu_long ===
# ngay:12 # gio:12:30 # noi:quan_ca_phe_song_ao
_12:30. {con_ong_chau_cha} gọi bạn ra quán cà phê Sống Ảo gấp. Cùng bàn có {hong_hot}, {ran_doc} và {thuc_tap_sinh}, ai cũng đang cầm ly mà chưa ai trả tiền._
con_ong_chau_cha: Anh {it}! Máy quẹt thẻ ở đây hư rồi. Quẹt thẻ em nó cứ báo "từ chối". Anh sửa giùm em đi.
_Bạn nhìn màn hình máy quẹt. Nó không hư. Nó chỉ nói thật._
* [😇 "Máy không hư. Thẻ bị khóa."]
    con_ong_chau_cha: Ủa sao khóa được? Thẻ này chú em làm cho em mà… Để em gọi chú em.
    _{con_ong_chau_cha} gọi. Chú không nghe máy. Lần đầu tiên bạn thấy {con_ong_chau_cha} im lặng._
    it: Ly này anh trả.
    con_ong_chau_cha: …Cảm ơn anh. Thật đó.
    ~ tien_cong(-55000)
    ~ qh("con_ong_chau_cha", 15)
    ~ it_cam_on()
* [🔄 "Tắt máy quẹt đi bật lại thử."]
    _Máy quẹt khởi động lại, rồi báo "từ chối" lần nữa, to hơn._
    con_ong_chau_cha: Thấy chưa, hư thiệt mà!
    _Chị thu ngân nhìn hai người như nhìn hai đứa trẻ._
    ~ qh("con_ong_chau_cha", 3)
- -> END
