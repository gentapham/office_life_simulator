// ============================================================
// THÁNH NỊNH: NHI · CHƯƠNG 2: "HỘP THƯ CỦA SẾP" (5/10 – 13/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_ninh_0510_hop_thu_sang ===
# ngay:5 # gio:07:50 # noi:ban_tro_ly # bat_buoc
_Thứ 2. Trước giờ sếp tới, bạn mở hộp thư của sếp. Mật khẩu sếp đưa ba năm trước: "{giam_doc}@family2010". Chưa đổi lần nào._
_Tuần trước: 3 email từ Ngân hàng Tín Dụng Đen Đủi. Sáng nay đã có 2._
* [📧 Mở minigame "Lọc Hộp Thư".]
    -> thanh_ninh_mg_loc_hop_thu
* [😶 Chỉ đánh dấu "đã đọc" mấy email quảng cáo, không đụng tới ngân hàng.]
    _Bạn để nguyên hai email ngân hàng. Tiêu đề in đậm, nằm chình ình đầu hộp thư._
    _9 giờ 30, sếp mở máy. Bạn thấy qua vách kính: sếp đọc, ngả ra ghế, nhìn trần nhà 4 phút._
    ~ tn_ninh(-3)
    ~ tn_email(2)
    -> END

// ------------------------------------------------------------
=== thanh_ninh_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_tang_2
_Họp giao ban đầu tuần. {truong_phong} chủ trì. "Họp nhanh 5 phút thôi." Đồng hồ chỉ 8:30. Bạn biết sẽ kéo tới 10:30._
_Ngày Nhà giáo Thế giới. {thuc_tap_sinh} đi vòng quanh bàn, tặng mỗi người một bông hoa: "Dạ em cảm ơn thầy cô đã dạy em ạ."_
thuc_tap_sinh: Dạ chị {thanh_ninh}, hoa của chị ạ. Chị dạy em pha trà đúng 85 độ ạ.
* [🙇 Nhận hoa, rồi đem cắm luôn lên bàn sếp: "Hoa này em gửi anh {giam_doc}, người thầy lớn nhất của cả công ty."]
    ~ tn_ninh(5)
    ~ tn_khen()
    ~ qh("thuc_tap_sinh", -3)
    giam_doc: Ơ… thằng {thuc_tap_sinh} nó tặng em mà?
    thuc_tap_sinh: Dạ… dạ không sao đâu ạ.
    ~ tn_gian(5)
* [😇 "Cảm ơn {thuc_tap_sinh}. Bông này chị giữ."]
    ~ qh("thuc_tap_sinh", 8)
    ~ tn_gian(-3)
    _Bạn cắm bông hoa vào ly nước trên bàn mình. Lần đầu có ai cảm ơn bạn vì một việc bạn đã làm._
* [👇 "Ừa. Mà {thuc_tap_sinh}, cuộc họp này em ghi biên bản giùm chị nha."]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ em ghi liền ạ!
- truong_phong: Rồi, mình sync nhanh nhé. Mục tiêu tuần này là… ờ… mình take note lại, sau đó họp tiếp nhé.
_10 giờ 32. Kết thúc cuộc họp 5 phút._
~ nghi(-10)
-> END

// ------------------------------------------------------------
=== thanh_ninh_0510_gac_cong ===
# ngay:5 # gio:14:00 # noi:ban_tro_ly
_Bàn trợ lý ngoài vách kính phòng giám đốc. Bạn là cánh cửa. Không ai gặp được sếp nếu không qua bạn._
thanh_xin_nghi: *(giọng yếu ớt)* {thanh_ninh} ơi… cho tui gặp sếp xíu. Tui xin nghỉ thứ 4 tuần sau. Bà ngoại tui…
* [🚪 "Sếp đang bận lắm ông. Để đơn đây, chiều tui trình."]
    _Bạn đặt đơn của {thanh_xin_nghi} dưới cùng chồng giấy. Dưới 14 tờ khác._
    ~ qh("thanh_xin_nghi", -5)
    thanh_xin_nghi: Ờ… vậy để tui hỏi Bác {bac_bao_ve} coi sếp xuống lúc mấy giờ.
* [🤝 "Vô đi, sếp đang vui. Mà nói ngắn thôi nha."]
    ~ qh("thanh_xin_nghi", 8)
    _Năm phút sau {thanh_xin_nghi} đi ra, mặt tươi rói. Sếp duyệt._
    giam_doc: {thanh_ninh}, lần sau ai xin nghỉ thì em lọc giúp anh nhé.
    ~ tn_ninh(-1)
* [💬 "Bà ngoại ông bệnh lần thứ mấy rồi?"]
    thanh_xin_nghi: Lần… thứ tám. Mà lần này bệnh thiệt.
    _Ông ấy nói câu đó bằng giọng của một người đang tập hát._
    ~ qh("thanh_xin_nghi", -2)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_0610_thu_qua_han ===
# ngay:6 # gio:07:55 # noi:ban_tro_ly # bat_buoc
_Hộp thư của sếp. Email mới: "Ngân hàng Tín Dụng Đen Đủi: THÔNG BÁO QUÁ HẠN LẦN 3 – Tài sản thế chấp: Biệt thự số 1, Đồi Ngân Hàng"._
_Bạn đọc hai lần. Rồi lần thứ ba, chậm hơn._
~ phat_hien(the_chap_biet_thu)
* [🗂️ Kéo vào thư mục "Ngân hàng", ẩn khỏi màn hình chính.]
    ~ tn_email(1)
    _Sếp yên tâm thêm một ngày. Bạn thì không._
* [📸 Chụp màn hình lại, "để phòng thân".]
    ~ tn_email(1)
    ~ tn_xanh(5)
    _Ảnh lưu vào thư mục "Hóa đơn tiệm nail". Không ai mở thư mục đó._
* [🍵 Pha cho sếp ly trà đặc hơn mọi ngày, đặt lên bàn, không nói gì.]
    ~ qh("giam_doc", 10)
    _9 giờ 30. Sếp nhìn ly trà, nhìn bạn. Không ai nhắc tới email này._
    giam_doc: Đặc thế em.
    _Rồi sếp uống hết._
* {tn_gian_chi_dai < 40} [🔒 Chuyển tiếp cho {ke_toan} với một dòng: "Chị biết rồi đúng hông?"]
    ~ tn_email(3)
    ~ tn_dong_minh_ke_toan = true
    ~ qh("ke_toan", 15)
    _Mười phút sau, {ke_toan} gọi bạn xuống phòng kế toán, đóng cửa._
    ke_toan: Em biết từ hồi nào?
    _Hai người nói chuyện 20 phút. Khi ra khỏi phòng, bạn có một đồng minh giữ bí mật._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_0610_clip_ba_cu ===
# ngay:6 # gio:10:40 # noi:studio_tang_2
_Buổi chụp poster đầu tiên. Đang chụp dở, {sieu_nhan_hong} nhìn qua cửa sổ, thấy một bà cụ bị giật túi ở đầu đường._
sieu_nhan_hong: Biến hình! Vì công lý và lượt view!
_Và chạy mất. Điều khoản số 3: được bỏ ngang buổi quay để đi giúp người, không bị trừ tiền._
giam_doc: *(mặt đỏ)* Ơ thế là thế nào? Thuê studio cả buổi đấy! {thanh_ninh}! Gọi bên quản lý nghệ sĩ lên đây!
_{hong_hot} vẫy bạn, chìa điện thoại: một đoạn clip người qua đường quay, {sieu_nhan_hong} đỡ bà cụ, trả lại túi, cúi chào._
* [🙇 "Dạ anh nói chuẩn quá, mất tiền studio! Em gọi anh {quan_ly_idol} lên liền."]
    ~ tn_ninh(2)
    ~ qh("quan_ly_idol", -5)
    _{quan_ly_idol} lên, bị sếp mắng 15 phút. Clip của bà cụ nằm im trong điện thoại {hong_hot}._
    ~ follow(30000)
* [🍵 Đưa sếp ly trà, rồi chìa clip: "Anh coi cái này đi anh. Người ta tự quay, mình chưa tốn đồng nào."]
    { tn_diem_ninh >= 45:
        giam_doc: *(xem, im lặng)* … Ừ. Đẩy cái này lên đi. {it} {hong_hot} với {dan_dau_tu} tính giờ đăng.
        ~ follow(80000)
        ~ tn_ninh(5)
        ~ qh("hong_hot", 10)
        _Tối đó clip lên xu hướng. Lượt xem gấp mười hai lần MV sau này._
    - else:
        giam_doc: Em đừng bênh. Không có kỷ luật thì…
        _Sếp vẫn mắng. Nhưng lúc bạn ra ngoài, sếp lén xem lại clip lần nữa._
        ~ follow(40000)
    }
* [😶 Nhắn {hong_hot}: "Đăng liền đi bà, tui lo sếp."]
    ~ qh("hong_hot", 8)
    ~ follow(50000)
    hong_hot: Ok, đẩy liền!
    _Bạn đứng trước cửa phòng sếp, nói chuyện golf suốt 20 phút để sếp không mở điện thoại._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_0710_moc_1 ===
# ngay:7 # gio:17:00 # noi:phong_giam_doc # bat_buoc
_Mốc 1: 50.000 người theo dõi. Con số hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi >= 50000:
    -> dat
- else:
    -> truot
}
= dat
giam_doc: Đạt rồi! Đạt rồi {thanh_ninh} ơi! Chuẩn bị bài cho anh phát biểu tối nay trong group nhé!
* [🙇 "Dạ để em viết! 'Thành công hôm nay là nhờ tầm nhìn của anh'…"]
    ~ tn_ninh(3)
    ~ tn_khen()
    giam_doc: Hơi lộ. Thêm "và của cả đội" vào.
* [😇 "Dạ, viết cảm ơn cả đội nha anh. Ai làm gì em ghi đủ."]
    ~ tn_ninh(1)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
    giam_doc: Ừ… được đấy. Em liệt kê cho anh.
- -> END
= truot
giam_doc: Họp khẩn! Gọi hết mọi người lên. Anh truyền lửa ba tiếng!
_Ba tiếng. Tới 20 giờ._
* [🍵 Pha trà theo mood trước khi họp.]
    -> thanh_ninh_mg_pha_tra
* [🙇 "Dạ anh truyền lửa đi anh, em đứng cạnh cầm micro."]
    ~ tn_ninh(4)
    ~ cang_thang(10)
    ~ tn_gian(5)
    _Bạn đứng cạnh sếp ba tiếng, gật đầu 412 lần. {chi_dai} đếm._
    -> END
* [💬 "Anh ơi, mọi người mệt rồi. Họp 30 phút thôi được hông anh?"]
    ~ tn_ninh(-4)
    ~ tn_gian(-5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    giam_doc: … 45 phút.
    _Lần đầu tiên trong lịch sử, sếp mặc cả với nhân viên mà nhân viên thắng._
    -> END

// ------------------------------------------------------------
=== thanh_ninh_0810_lich_sep ===
# ngay:8 # gio:08:00 # noi:ban_tro_ly
_Ngày Thị giác Thế giới. {editor} được bắt đi khám mắt. Sếp thì muốn bạn xếp lịch tuần này cho "đẹp"._
giam_doc: Thứ 6 MV ra mắt, anh phải có mặt. Còn sáng thứ 6 anh có hẹn… ờ… đối tác chiến lược. Em xếp khéo nhé.
* [📅 Mở minigame "Sắp Lịch Sếp".]
    -> thanh_ninh_mg_sap_lich
* [👇 Đẩy {editor} đi khám buổi trưa, để sếp mượn phòng dựng họp riêng.]
    ~ qh("editor", -5)
    editor: *(ngáp)* Trưa… là giờ em ngủ mà chị…
    ~ tn_ninh(2)
    -> END

// ------------------------------------------------------------
=== thanh_ninh_0810_tin_nhan_ll ===
# ngay:8 # gio:21:40 # noi:nha_thanh_ninh
_Tin nhắn từ số lạ: "Chào em {thanh_ninh}, chị bên tuyển dụng LL. Em xác nhận lịch phỏng vấn giúp chị nhé. Chủ nhật 25/10, 9:00."_
_Một tin nữa: "À, nghe nói em làm trợ lý cho anh {giam_doc} bên G hả? Giỏi ghê."_
* [🟢 "Dạ em xác nhận ạ. Dạ đúng rồi chị, em lo hết lịch của anh {giam_doc}."]
    ~ tn_xanh(10)
    _"Tuyệt vời! Hẹn em nha 💚". Trái tim màu xanh lá chuối._
* [😶 "Dạ em xác nhận ạ." Không trả lời câu thứ hai.]
    ~ tn_xanh(3)
    _"Ok em 💚". Họ không hỏi thêm. Nhưng cũng không quên._
* [🙅 Để tin nhắn ở trạng thái "đã xem".]
    ~ tn_xanh(-3)
    _Sáng hôm sau, có thêm 2 tin nhắn nhắc lại. Lịch sự, kiên nhẫn, xanh lá chuối._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_0910_nha_dau_tu_sanh ===
# ngay:9 # gio:09:10 # noi:quay_le_tan # bat_buoc
_Một người đàn ông mặc vest, ôm hộp gỗ, đứng ở quầy lễ tân. {cho} sủa ầm từ chòi bảo vệ._
shipper_teo: Ờ… cho hỏi anh {giam_doc} có đây hông? Đồ gửi từ nước ngoài nè, ra lấy giùm em!
_Vest. Hộp gỗ. "Từ nước ngoài". Bạn nghĩ tới đúng một người: anh Genta._
* [🙇 "Dạ anh ngồi sofa nha anh! Anh dùng trà sen hay trà gừng ạ? Chuyến bay của anh mệt hông anh?"]
    _Bạn pha trà. Bạn mời ngồi. Bạn khen cà vạt. Bạn kể về tầm nhìn của sếp. Mười phút._
    shipper_teo: Dạ… chị ơi chị ký nhận giùm em, em còn ba chục đơn. Em mặc vest vì mới đi đám cưới về.
    _Cả sảnh cười. Hộp gỗ là bộ gậy golf sếp đặt online._
    ~ tn_nhan_nham_shipper = true
    ~ cang_thang(10)
    hong_hot: *(chụp lia lịa)* Ối dồi ôi, content!
    ~ qh("hong_hot", 3)
* [👇 "{thuc_tap_sinh}! Xuống ký nhận giùm chị."]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ em xuống liền ạ!
    _{thuc_tap_sinh} nhìn phiếu giao hàng 2 giây: "Dạ đây là shipper ạ, gậy golf ạ."_
    _Một người làm ngân hàng chục năm nhận ra hàng giả rất nhanh. Cả hàng giả là nhà đầu tư._
* [🧐 "Anh cho em xem phiếu giao hàng."]
    shipper_teo: Đây chị. Gậy golf, ship COD, anh {giam_doc} trả trước rồi.
    ~ tn_ninh(5)
    giam_doc: *(trên lầu nói vọng xuống)* Gậy golf của anh à? {thanh_ninh} làm việc chuẩn chỉ!
    ~ tn_sep_goi("nhi")
- cho: GÂU GÂU GÂU! *({cho} ghét shipper)*
shipper_teo: Con chó này lần nào cũng vậy!
-> END

// ------------------------------------------------------------
=== thanh_ninh_0910_duyet_quang_cao ===
# ngay:9 # gio:14:30 # noi:phong_giam_doc # bat_buoc
_MV đầu tiên của {sieu_nhan_hong} ra mắt tối nay. {hong_hot} cần ngân sách chạy quảng cáo. Tờ trình nằm trên bàn bạn từ sáng._
_Cùng giờ đó, LL tung MV của nghệ sĩ bên họ. Cuộc chiến giờ vàng._
giam_doc: *(bước vào, thở dài, ngồi phịch xuống)* {thanh_ninh} ơi, pha cho anh ấm trà.
* [🍵 Đọc mặt sếp, pha trà, rồi kẹp tờ trình dưới khay.]
    { tn_diem_ninh >= 50:
        giam_doc: *(uống một ngụm)* Trà này… ừ. Tờ gì đấy?
        _"Quảng cáo MV, 200 triệu, anh ơi đây là cơ hội vàng, anh mà ký là có tầm nhìn."_
        giam_doc: Anh không ép, tùy em… mà thôi, ký.
        ~ follow(40000)
        ~ tn_ninh(3)
        ~ qh("hong_hot", 10)
        _Lời khuyên lúc pha trà của bạn nặng hơn cả slide của {truong_phong}._
    - else:
        giam_doc: Để mai anh xem. Hôm nay anh mệt.
        _Mai là thứ 7. MV ra tối nay._
        ~ follow(5000)
    }
* [🙇 "Anh ơi, LL họ ra MV cùng giờ. Anh mà để họ thắng là họ cười anh đó."]
    giam_doc: Cười anh à? *(ký liền, không đọc)*
    ~ follow(40000)
    ~ tn_ninh(2)
    _Sếp ký vì sợ bị cười. Bạn ghi nhớ: đây là nút bấm nhanh nhất._
* [😶 Để tờ trình tới mai.]
    ~ follow(5000)
    hong_hot: *(nhắn)* Bà ơi tờ trình đâu??? MV lên mà hông có quảng cáo là chết chìm đó!
    ~ qh("hong_hot", -10)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_0910_toi_mv ===
# ngay:9 # gio:20:00 # noi:khu_lam_viec_chung
_20 giờ. Cả phòng truyền thông ngồi canh màn hình. MV lên sóng. Hôm nay là Ngày Trứng Thế giới, cả ngày căn tin chỉ bán trứng, nên trên bàn ai cũng có một hộp trứng luộc._
~ follow(40000)
giam_doc: *(gọi video)* Bao nhiêu rồi em? Bao nhiêu view rồi?
* [🙇 Báo con số, cộng thêm một câu "Nhờ anh duyệt kịp đó anh!"]
    ~ tn_ninh(2)
    ~ tn_khen()
* [🤝 "Dạ nhờ {hong_hot} với {chua_te_deadline} canh tới giờ chót đó anh."]
    ~ qh("hong_hot", 5)
    ~ qh("chua_te_deadline", 5)
    ~ tn_gian(-2)
    giam_doc: Ừ, nhắn khen chúng nó giúp anh.
- _Lúc 23 giờ, có ai đó tạo ra một đồng coin tên "Hồng Coin". {dan_dau_tu} là người mua đầu tiên._
~ an(15)
-> END

// ------------------------------------------------------------
=== thanh_ninh_1010_luong_chua_ve ===
# ngay:10 # gio:09:00 # noi:nha_thanh_ninh
_Thứ 7, ngày 10. Ngày lương. Ứng dụng ngân hàng: không có gì._
_Hộp thư của sếp, 8:47: "Ngân hàng Tín Dụng Đen Đủi: Lệnh chuyển lương của Quý công ty đang được tạm giữ để kiểm tra giao dịch lớn."_
_Bạn biết vì sao. Vì cái biệt thự trên đồi._
_Group Zalo-lô công ty bắt đầu sôi. Tin nhắn riêng nhảy liên tục: "{thanh_ninh} ơi lương sao chưa về?"_
* [😶 Trả lời ai cũng một câu: "Thứ 7 ngân hàng nghỉ mà, thứ 2 về nha."]
    _Câu trả lời đúng một nửa. Nửa còn lại nằm trong thư mục "Ngân hàng"._
    ~ tn_email(1)
* [🙇 Nhắn sếp: "Anh ơi, mọi người hỏi lương. Em nói vậy nha anh: thứ 7 ngân hàng nghỉ."]
    ~ tn_ninh(5)
    giam_doc: Ừ. Cảm ơn em. Hôm nay là ngày Giải phóng Thủ đô, anh kể em nghe chuyện Hà Nội nhé…
    _Sếp gửi 11 tin nhắn thoại về phố cổ. Bạn nghe hết. Sếp cần ai đó nghe._
    ~ qh("giam_doc", 5)
* [🧂 Nhắn riêng {hong_hot}: "Bà, nói nhỏ nè, ngân hàng giữ lương đó."]
    ~ tn_lo_luong_tre = true
    ~ qh("hong_hot", 5)
    hong_hot: HẢ? Giữ lương? Vì sao? Kể tiếp!
    _Bạn đã lỡ. Trong 2 tiếng, cả group "Hội Anti Sếp" biết._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1010_cho_bac_binh ===
# ngay:10 # gio:17:30 # noi:choi_bao_ve # ngau_nhien
_Bạn ghé công ty lấy tập hồ sơ sếp để quên. Chòi bảo vệ có một chiếc bánh bông lan nhỏ cắm đúng một cây nến._
bac_bao_ve: Ơ, cháu đấy à. *(ngượng, lấy cái ly úp lên bánh)*
* [💬 "Bác… sinh nhật bác hả bác?"]
    bac_bao_ve: Ừ… năm mươi rồi. Đừng nói ai nhé. Cả công ty không ai biết đâu.
    _Có một tấm thiệp viết tay đặt cạnh bánh, ký một chữ "G". Bác nhanh tay cất đi._
    ~ qh("bac_bao_ve", 15)
    _Bạn hát nhỏ bài chúc mừng sinh nhật. {cho} hú theo._
* [🙇 "Bác ơi, sếp em có gửi gì cho bác hông? Để em nhắc sếp."]
    bac_bao_ve: Không cần đâu cháu. Có người nhớ rồi.
    ~ qh("bac_bao_ve", 3)
* [😶 Lấy hồ sơ, gật đầu chào, đi ra.]
    bac_bao_ve: Ừ. Về cẩn thận.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1110_anh_hoi_nho ===
# ngay:11 # gio:20:30 # noi:nha_thanh_ninh
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Fanpage phát động trend "ảnh hồi nhỏ". Cả công ty đăng._
_{sieu_nhan_hong} đăng ảnh một xóm có cây me. Trong góc ảnh có một thằng nhóc đang khóc. {ran_doc} đăng ảnh rồi xóa sau 3 phút._
_Đến lượt bạn. Album hồi nhỏ: bé {thanh_ninh} đứng cuối lớp, vỗ tay cho bạn được khen._
* [🙇 Đăng ảnh hồi nhỏ, tag sếp: "Từ nhỏ đã biết ngưỡng mộ người giỏi 👏"]
    ~ tn_ninh(3)
    giam_doc: *(bình luận)* Dễ thương quá! Anh hồi nhỏ thì toàn được vỗ tay thôi haha.
    ~ tn_sep_goi("nhi")
* [😇 Đăng ảnh, chú thích thật: "Hồi nhỏ em toàn vỗ tay cho người khác."]
    ~ tn_gian(-3)
    _Bình luận đầu tiên là của {chi_dai}: một biểu tượng cảm xúc thương thương. Bạn nhìn nó rất lâu._
    ~ qh("chi_dai", 5)
* [😶 Không đăng gì, chỉ thả tim ảnh của sếp hồi nhỏ.]
    _Ảnh sếp hồi nhỏ: một cậu bé ở Hà Nội, cầm cờ, cười toe. Bạn là người thả tim thứ nhất. {ran_doc} thứ hai. Cách nhau 4 giây._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1210_luong_tre ===
# ngay:12 # gio:08:00 # noi:khu_lam_viec_chung # bat_buoc
_Thứ 2. Lương về trễ 2 ngày, sáng nay mới về. Cả phòng nhìn bạn. Bạn là người gần sếp nhất, tức là người phải biết._
hong_hot: {thanh_ninh}, nói thiệt đi, sao lương trễ vậy? Bà biết mà!
sales: Tin chị đi, chị nghe nói ngân hàng bên đó đổi hệ thống.
dan_dau_tu: Hay công ty đem tiền lương đi đầu tư? Mua đáy hả?
* [😶 "Ngân hàng kiểm tra giao dịch lớn thôi. Về rồi đó, mọi người check đi."]
    ~ tn_ninh(3)
    _Bạn nói đúng câu trong email. Không thiếu chữ nào, không thêm chữ nào._
    hong_hot: *(nheo mắt)* Giao dịch lớn gì?
    _Bạn quay đi pha trà._
* [🧂 Kéo {hong_hot} ra góc: "Nói nhỏ nghe nè, đừng kể ai…"]
    ~ tn_lo_luong_tre = true
    ~ qh("hong_hot", 5)
    ~ tn_ninh(-5)
    _Trưa đó, Confession G-Entertainment đăng bài: "Lương về trễ, sếp đi đánh golf". Bạn biết nguồn tin từ đâu._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
* [🙇 "Mọi người ơi, sếp ứng tiền túi để lương về sớm nhất có thể đó! Sếp có tâm lắm!"]
    ~ tn_khen()
    ~ tn_ninh(4)
    ~ tn_gian(8)
    chi_dai: Ứng tiền túi? Ừ. Chị sẽ hỏi trực tiếp ổng.
    _Bạn vừa nói một câu sếp chưa bao giờ nói. Bây giờ {chi_dai} sẽ đi hỏi._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1210_the_long ===
# ngay:12 # gio:21:15 # noi:nha_thanh_ninh
_Điện thoại reo. {con_ong_chau_cha}._
con_ong_chau_cha: {thanh_ninh} ơi, thẻ phụ của anh bị từ chối ở quán ốc. Trước mặt cả bàn luôn. Chú anh có biết hông?
_Hộp thư của sếp có một email đã đọc lúc 19:00: "Thẻ phụ liên kết tài khoản cá nhân đã bị tạm khóa do số dư không đủ"._
* [🙇 "Dạ chắc lỗi hệ thống anh {con_ong_chau_cha} ơi. Để mai em báo sếp liền."]
    ~ qh("con_ong_chau_cha", 5)
    con_ong_chau_cha: Ờ… lỗi hệ thống. Chắc vậy. Chill.
    _Giọng {con_ong_chau_cha} không chill chút nào._
* [😇 "Anh {con_ong_chau_cha}… anh hỏi thẳng chú anh đi anh. Em hông nói thay được."]
    ~ qh("con_ong_chau_cha", 3)
    con_ong_chau_cha: … Ừ. Cảm ơn {thanh_ninh}. Lần đầu có người nói vậy với anh.
    ~ tn_gian(-2)
* [📧 Đọc thêm email cũ của sếp, xem thẻ đó gắn với tài khoản nào.]
    ~ tn_email(2)
    _Tài khoản cá nhân của sếp: 4.200.000đ. Một giám đốc, ba tháng không nhận lương, còn bốn triệu hai._
    ~ cang_thang(8)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1210_soan_bai ===
# ngay:12 # gio:16:30 # noi:ban_tro_ly
_Mai là Ngày Doanh nhân. Bạn phải đọc bài phát biểu khen sếp đúng 15 phút. Bản nháp hiện tại: 6 phút 40 giây._
bien_kich: *(đi ngang)* Đang viết hả? Cần thêm nỗi đau. Với ẩn dụ con thuyền.
* [💬 "Bà cho tui mượn bài năm ngoái bà viết cho sếp nha."]
    bien_kich: Đây không phải đạo, đây là cảm hứng. Lấy đi.
    _Bạn chép nửa bài. Một nửa bài khen sếp ngày mai là của {bien_kich}._
    ~ qh("bien_kich", 3)
* [✍️ Tự viết, thêm 23 chữ "tâm".]
    _"Có tâm, có tầm, tận tâm, tâm huyết, tâm lý, tâm giao…" Bạn đếm lại. Bài dài thêm 4 phút._
    ~ tn_ninh(2)
* [😇 Viết thêm một đoạn ngắn về những đêm sếp ngồi lại một mình tính sổ.]
    _Bạn biết những đêm đó vì bạn cũng ở lại. Bạn viết ba dòng, rồi xóa, rồi viết lại._
    ~ qh("giam_doc", 5)
    ~ tn_gian(-2)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1310_bo_hoa ===
# ngay:13 # gio:08:30 # noi:phong_giam_doc
_Ngày Doanh nhân Việt Nam. Sếp tự mua một bó hoa hồng to cho chính mình. Thẻ ghi: "Gửi Doanh nhân {giam_doc}, từ {giam_doc}"._
_{sales} vừa trao cho sếp giải "Doanh nhân của năm" của BTT Global. Cúp nhựa mạ vàng. Sếp treo nó ngay giữa tường._
sales: Mr. Kevin Trộn gửi lời chúc mừng anh nha. No cap.
giam_doc: {thanh_ninh}! Chụp ảnh! Anh, bó hoa, cái cúp!
* [🙇 "Anh xứng đáng quá anh ơi! Doanh nhân có tâm nhất Quận Hóng!"]
    ~ tn_ninh(3)
    ~ tn_khen()
* [💬 Hỏi nhỏ {sales}: "Mr. Kevin Trộn có số điện thoại hông em? Để chị gửi thư cảm ơn."]
    sales: *(cười tươi, mắt đơ)* Ổng… ổng đang ở Singapore chị ơi. Tin em đi, để em chuyển lời cho.
    ~ qh("sales", -5)
    ~ phat_hien(btt_global_gia)
    _Nụ cười đó y chang nụ cười của bạn mỗi khi khen sếp._
* [😶 Chụp ảnh, không nói gì.]
    giam_doc: {thanh_ninh} hôm nay ít nói thế. Để dành cho bài phát biểu à? Haha!
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1310_phat_bieu ===
# ngay:13 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp "Sáng Tạo". Cả công ty ngồi kín. Bạn cầm bài phát biểu. Ở cuối phòng, {chi_dai} khoanh tay, cầm bút và một tờ giấy trắng._
giam_doc: Hôm nay… anh không cần ai khen đâu. Nhưng {thanh_ninh} đã chuẩn bị rồi thì… anh không ép, tùy em.
* [✍️ Bắt đầu đọc. (Minigame "Viết Bài Phát Biểu")]
    -> thanh_ninh_mg_bai_phat_bieu
* [😇 "Dạ hôm nay em xin đọc ngắn thôi ạ, 3 phút."]
    _Bạn bỏ 12 trang giữa. Đọc mở đầu, đọc đoạn ba dòng về những đêm sếp ngồi một mình, rồi cảm ơn._
    _Phòng im lặng. Rồi {chi_dai} là người vỗ tay đầu tiên._
    ~ tn_gian(-10)
    ~ tn_ninh(-3)
    ~ qh("giam_doc", 8)
    giam_doc: *(hắng giọng, nhìn ra cửa sổ)* Ừ… ngắn mà… được.
    -> END

// ------------------------------------------------------------
=== thanh_ninh_1310_sau_phat_bieu ===
# ngay:13 # gio:11:30 # noi:hanh_lang_tang_2
_Hành lang tầng 2. {chi_dai} chặn bạn lại, chìa tờ giấy. Trên đó chỉ có một hàng gạch: 23 vạch._
chi_dai: Hai mươi ba lần chữ "tâm". Em định xây chùa hả {thanh_ninh}?
* [🙇 "Dạ chị đếm kỹ quá chị ơi, chị đúng là có tâm…"]
    ~ tn_gian(10)
    chi_dai: Hai mươi bốn.
    _{chi_dai} gạch thêm một vạch, bỏ đi._
* [😇 "Em biết chị ghét em. Mà em hông biết làm gì khác."]
    ~ tn_gian(-8)
    chi_dai: *(dừng lại)* … Học. Cái gì cũng học được, trừ nịnh. Nịnh thì em học đủ rồi.
* [🗡️ "Chị hông thích thì đừng nghe. Đâu ai ép chị."]
    ~ tn_gian(3)
    chi_dai: Ờ. Gan đó. Chị ghi nhận.
    ~ qh("chi_dai", 2)
- -> END
