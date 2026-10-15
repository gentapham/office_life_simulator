// ============================================================
// CHƯƠNG 3: "NGÀY MẤT ĐIỆN" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== ran_doc_1310_doanh_nhan ===
# ngay:13 # gio:09:40 # noi:phong_giam_doc
_Ngày Doanh nhân Việt Nam. {giam_doc} ôm một bó hoa thật to bước vào phòng. Tấm thiệp ghi: "Gửi {giam_doc}, từ {giam_doc}."_
_Trên tường phòng giám đốc vừa treo thêm một tấm bằng mạ vàng: "DOANH NHÂN CỦA NĂM, trao bởi BTT Global"._
sales: Tin chị đi anh, Mr. Kevin Trộn đích thân ký đó. Bên đó quý anh lắm.
thanh_ninh: *(cầm 6 trang giấy)* Dạ em xin phép đọc bài phát biểu chúc mừng anh, em viết hết đêm qua. "Anh {giam_doc}, người thuyền trưởng…"
_15 phút sau, {thanh_ninh} vẫn đang ở trang 3. {giam_doc} gật gù, mắt ươn ướt._
giam_doc: {ran_doc}, em làm truyền thông nội bộ, em đưa cái này lên bản tin nhé. Anh không ép.
* [🧂 Đăng lên group công ty, chú thích: "Sếp tự tặng hoa cho mình, một tình yêu bản thân đáng học hỏi."]
    ~ rd_them_mam(8, 8)
    _Ai cũng thả "haha". {giam_doc} thả "tim". Sếp không hiểu, hoặc giả vờ không hiểu._
    ~ qh("giam_doc", -3)
* [🐍 Lén chụp tấm bằng, phóng to: con dấu BTT Global là hình… cái bánh tráng.]
    ~ rd_tin_mat()
    ~ phat_hien(btt_global_gia)
    _Không có mã số thuế. Không có địa chỉ. Chỉ có cái bánh tráng. Bạn liếc {sales}. {sales} liếc lại, cười rất tươi._
    sales: Em nhìn gì vậy? Ngưỡng mộ hả? Chị dạy em làm sales nha.
* [😇 Viết một bài tử tế: "Cảm ơn sếp đã giữ công ty qua 16 năm."]
    ~ qh("giam_doc", 10)
    ~ uy_tin = uy_tin + 5
    ~ rd_tin(3)
    giam_doc: Em này… được. Em hiểu văn hóa doanh nghiệp.
    thanh_ninh: *(liếc bạn sắc lẹm)* Anh nói chuẩn quá anh ơi. Mà bài của em dài hơn.
    ~ qh("thanh_ninh", -5)
- -> END

// ------------------------------------------------------------
=== ran_doc_1410_moc_200k ===
# ngay:14 # gio:17:00 # noi:tang_1 # bat_buoc
_Mốc 2: 200.000 người theo dõi. Ngày Hội Nông dân. {thanh_xin_nghi} xin nghỉ "về quê phụ gặt lúa"._
{ nguoi_theo_doi >= 200000:
    _Con số trên màn hình: {nguoi_theo_doi}. Đạt mốc. {sieu_nhan_hong} nhảy một vòng giữa tầng 1, va vào cây nước._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
- else:
    _Con số trên màn hình: {nguoi_theo_doi}. Không đạt. {sieu_nhan_hong} đứng nhìn rất lâu, rồi lặng lẽ đi ra cổng, không tạo dáng._
    bac_bao_ve: Cậu ấy đi giúp người cả ngày rồi. Lần này không ai quay.
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
    _Bạn nên vui. Bạn đã muốn điều này. Sao lại thấy như vừa nuốt phải cục đá?_
    ~ rd_han(-3)
}
_Tivi ở pantry đang chiếu cuộc thi "Giọng Ca Ước Mơ", vòng 2. Một thí sinh áo kim tuyến hát rất hay. Gương mặt quen quen._
hong_hot: Ủa… ủa alo? Đó là {thanh_xin_nghi} mà?! Gặt lúa kiểu gì mà gặt trên Đài Tivi Hóng?
* [🐍 Quay màn hình, gửi riêng cho {hr}.]
    ~ rd_tung_tin(10, 5)
    hr: *(trả lời ngay)* Cảm ơn em đã đồng hành cùng phòng nhân sự. Anh sẽ mời {thanh_xin_nghi} uống trà.
    ~ qh("thanh_xin_nghi", -15)
    ~ qh("hr", 5)
    ~ phat_hien(son_thi_hat)
* [🤝 Bịt miệng {hong_hot}: "Bà im giùm, để ổng thi cho xong."]
    hong_hot: Ủa sao ông bênh ổng? À mà… ổng hát hay thiệt. Thôi tui im. Im được 2 ngày thôi nha.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 10)
    ~ rd_tin(5)
* [💬 Bấm bình chọn cho {thanh_xin_nghi}.]
    _Bạn bình chọn. Một phiếu. Không ai biết. Thỉnh thoảng làm việc tốt mà không ai biết cũng… lạ lạ._
    ~ phat_hien(son_thi_hat)
    ~ rd_tin_mat()
- -> END

// ------------------------------------------------------------
=== ran_doc_1510_thang_may ===
# ngay:15 # gio:08:05 # noi:sanh_tang_tret # bat_buoc
_8:05. Cúp điện cả khu. Thang máy đứng giữa tầng trệt và tầng 1. Bên trong có tiếng hai người._
giam_doc: *(vọng ra)* Bình tĩnh! Bình tĩnh nhé! Anh là giám đốc, anh rất bình tĩnh!
chi_dai: *(vọng ra)* Anh đứng xa em ra. Anh đạp chân em ba lần rồi.
bac_bao_ve: Thang máy này mười năm nay vẫn thế. Bác có chìa khóa cứu hộ. Đợi bác tí.
* [😇 Chạy đi lấy đèn pin, rọi giúp bác {bac_bao_ve}.]
    ~ qh("bac_bao_ve", 5)
    ~ qh("chi_dai", 5)
    ~ rd_tin(3)
    _Cửa mở. {giam_doc} bước ra, mồ hôi như tắm. {chi_dai} bước ra, tóc không rối một sợi._
* [📸 Ghi âm. Sếp đang nói chuyện thật lòng trong thang máy.]
    giam_doc: *(vọng ra)* {chi_dai} này… nếu công ty có chuyện gì… em lo cho mấy đứa nhỏ giúp anh nhé.
    chi_dai: *(vọng ra)* Có chuyện gì là chuyện gì? Anh nói rõ ra coi.
    giam_doc: *(vọng ra)* …Thôi. Không có gì.
    ~ rd_tin_mat()
    ~ rd_nghi(3)
    _Một đoạn ghi âm 42 giây. Sếp sợ. Sếp đang giấu chuyện gì đó lớn._
* [🐍 Nói to cho cả sảnh nghe: "Trời ơi, sếp với chị Đại kẹt chung thang máy, đám cá tươi tới nơi rồi!"]
    ~ rd_tung_tin(8, 8)
    chi_dai: *(vọng ra)* ĐỨA NÀO VỪA NÓI ĐÓ?!
    _Cả sảnh im phăng phắc. Bạn đã kịp lùi ra sau {thuc_tap_sinh}._
    ~ qh("chi_dai", -10)
- -> END

// ------------------------------------------------------------
=== ran_doc_1510_hop_thap_nen ===
# ngay:15 # gio:10:00 # noi:phong_hop_sang_tao
_Mất điện mà {truong_phong} vẫn họp. Phòng "Sáng Tạo" thắp 6 cây nến thơm mùi vani. {thuc_tap_sinh} mang tới 5 cục sạc dự phòng, loại đắt tiền._
thuc_tap_sinh: Dạ em có sạc dự phòng, ai cần cứ lấy ạ. Em… có dư.
truong_phong: Tốt. Mất điện không có nghĩa là mất họp. Mình sync nhanh nhé.
truong_phong: Cái clip hậu trường MV tuần trước anh dựng mất cả đêm đấy, mọi người thấy ổn chứ?
_{editor} ngồi góc phòng, ngáp. Bạn biết ai dựng clip đó. Bạn đã thấy file trong phòng dựng._
* [🐍 "Anh {truong_phong} ơi, laptop anh còn pin nè, anh dựng thử cho tụi em xem cách cắt cảnh đó được hông?"]
    truong_phong: Ơ… bây giờ á? Cái này… phần mềm hơi nặng, laptop tớ… à anh…
    editor: *(nói nhỏ)* Cái nút cắt là phím C á anh.
    _Cả phòng nhìn {truong_phong}. {truong_phong} nhìn cây nến. Cây nến tắt._
    ~ rd_tung_tin(12, 8)
    ~ rd_loai_nhat = true
    ~ qh("truong_phong", -15)
    ~ qh("editor", 5)
    _Tin đồn "Trưởng phòng không biết dựng phim" chạy hết công ty trước giờ trưa. Ghế Phó Giám đốc lung lay một chân._
* [🤝 "Clip đó {editor} làm đẹp lắm, em xem rồi."]
    editor: *(giật mình, nhìn bạn)* …Cảm ơn.
    truong_phong: Ừ, {editor} cũng… phụ một chút.
    ~ qh("editor", 15)
    ~ rd_tin(5)
* [😶 Thổi nến cho đỡ nóng.]
    truong_phong: Ơ ai thổi nến đấy? Họp tiếp! Họp trong bóng tối cũng là họp!
- -> END

// ------------------------------------------------------------
=== ran_doc_1510_pantry_trang_47 ===
# ngay:15 # gio:15:00 # noi:pantry # bat_buoc
_Pantry tối om, chỉ có ánh đèn điện thoại. Bạn ngồi trong góc sau tủ lạnh, ăn bánh. Không ai thấy bạn._
_{ke_toan} và {chi_dai} bước vào, nói rất nhỏ._
ke_toan: {chi_dai}. Bà đọc giùm tui cái này. Trang 47. Chữ cỡ 6.
chi_dai: *(nheo mắt dưới đèn pin)* "…nếu không đạt mục tiêu… bên B hoàn trả gấp đôi…" Gấp đôi là sao?
ke_toan: 10 tỷ. Quỹ còn 2 tỷ. Ổng ký mà không đọc. Siêu Nhân Hồng mà không tới một triệu người theo dõi là công ty sập. Sập hết. Ai cũng mất việc.
chi_dai: Trời đất…
_Bạn nín thở. Chỉ cần Siêu Nhân Hồng thất bại là cả công ty sập. Kể cả bạn._
~ phat_hien(trang_47)
~ rd_tin_mat()
~ rd_tin_mat()
* [🐍 Lén nhắn group "Hội Anti Sếp": "Hợp đồng có điều khoản hoàn tiền gấp đôi. Sếp ký mà không đọc."]
    ~ rd_tung_trang_47 = true
    ~ rd_tung_tin(25, 15)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 15
    _Đèn điện thoại của {chi_dai} sáng lên vì tin nhắn group. Rồi của {ke_toan}. Hai người nhìn nhau._
    ke_toan: Ai… ai vừa ở đây?
    _Bạn không thở. Bạn là cái tủ lạnh. Bạn là cái tủ lạnh._
    ~ rd_nghi(10)
    ~ rd_han(5)
* [😶 Giữ im lặng. Thông tin này để dành.]
    ~ rd_tin(5)
    _Bạn biết một điều mà chỉ 2 người khác biết. Phá Siêu Nhân Hồng là phá cả công ty. Bạn cần nghĩ lại. Hoặc không._
* [😇 Bước ra khỏi chỗ trốn: "Chị ơi… em nghe hết rồi. Em không nói ai đâu."]
    ke_toan: *(giật bắn)* Em… em ngồi đó từ bao giờ?
    chi_dai: Nghe rồi thì giữ mồm. Giữ được thì chị tin em.
    ~ qh("ke_toan", 10)
    ~ qh("chi_dai", 10)
    ~ rd_tin(10)
    ~ rd_nghi(-5)
    ~ rd_han(-5)
- -> END

// ------------------------------------------------------------
=== ran_doc_1510_pantry_toi ===
# ngay:15 # gio:19:30 # noi:pantry
_Vẫn mất điện. Gần tối, pantry chỉ còn vài người. Trong bóng tối, có ai đó đang hát rất khẽ._
idol_het_thoi: *(hát)* Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên…
_Giọng hát mộc, không nhạc, không kính đen. Hay tới nổi da gà. Ở góc, ánh đèn đỏ nhỏ xíu của một cái máy quay. Là {editor} đang quay lén._
_Ở bàn bên kia, hai cái bóng ngồi sát nhau. Một cái bóng không đội mũ. Giọng nói nhỏ, rụt rè, khác hẳn giọng hô "Biến hình!"._
sieu_nhan_hong: *(rất nhỏ)* Dạ… ờm… Vũ nè. Mấy món quà… hông phải PR đâu.
chua_te_deadline: …Đèn có lại thì nói lại câu đó coi.
* [📸 Bật đèn flash điện thoại chụp mặt {sieu_nhan_hong}.]
    _Bạn giơ điện thoại lên. Ngón tay đặt trên nút chụp._
    _Rồi {cho} sủa ầm từ dưới cầu thang. {sieu_nhan_hong} đội mũ lại trong nửa giây._
    ~ rd_nghi(8)
    ~ rd_pha(5000)
    _Tấm ảnh chỉ có một vệt hồng mờ. Bạn chậm hơn một con chó._
* [😶 Đứng im trong bóng tối, nghe.]
    ~ rd_han(-8)
    ~ rd_tin_mat()
    _Cái giọng đó. Không phải giọng của đại ca xóm Cây Me. Là giọng của một người sợ bị nhìn thấy._
* [🤝 Bước ra hát bè theo {idol_het_thoi}: "…thích ăn chuối chiên…"]
    idol_het_thoi: *(dừng lại, rồi cười)* Em biết bài này hả? Em biết anh là ai không?
    _Ở bàn bên, cái bóng không đội mũ cũng khe khẽ hát theo. Sai lời. Giọng run run như con nít._
    ~ rd_han(-3)
    ~ qh("idol_het_thoi", 15)
    ~ phat_hien(kenh_cu_dem)
    _{editor} quay được cả bạn. Trong video sau này, bạn là cái bóng hát bè lạc tông nhất._
- -> END

// ------------------------------------------------------------
=== ran_doc_1610_kich_ban_gameshow ===
# ngay:16 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Sáng ngày gameshow "Hồng Hay Không Hồng". {bien_kich} để quên xấp thẻ câu hỏi trên bàn. Đài Tivi Hóng sẽ lấy lúc 9 giờ._
_Thẻ cuối cùng: "Siêu Nhân Hồng ơi, anh có dám tháo mũ không?"_
* [🧨 Thay bằng thẻ mới: "Hồi nhỏ anh từng bắt nạt ai chưa?"]
    ~ rd_doi_kich_ban_gameshow = true
    ~ rd_nghi(8)
    _Bạn viết nắn nót, bắt chước chữ {bien_kich}. Câu hỏi này sẽ lên sóng truyền hình. Để xem hắn trả lời sao._
* [🧨 Thêm vào phần "Hit Một Thời" một tờ lời bài "Công Viên" bị sửa: "khoai chiên".]
    ~ rd_pha(10000)
    ~ rd_nghi(5)
    _Không ai đọc lại tờ lời bài hát. Trước giờ không ai đọc gì cả._
* [😇 Đem xấp thẻ trả lại cho {bien_kich}.]
    bien_kich: Ôi, đây là đứa con tinh thần của tôi. Cảm ơn em.
    ~ qh("bien_kich", 10)
    ~ rd_giup(3000)
- -> END

// ------------------------------------------------------------
=== ran_doc_1610_gameshow ===
# ngay:16 # gio:20:00 # noi:pantry # bat_buoc
_Ngày Lương thực Thế giới: buffet ở công ty. Cả công ty vừa ăn vừa xem gameshow trực tiếp trên tivi pantry._
~ an(100)
mc_tivi_hong: Phần thi "Hit Một Thời"! Siêu Nhân Hồng sẽ hát lại bài hit 2015, "Công Viên"!
sieu_nhan_hong: *(trên tivi, hát)* Ngày xưa có đôi bạn thân… bán… khoai chiên tại công viên!
_Cả trường quay cười ồ. Từ cánh gà, một giọng hát bè cất lên, sửa lại cho đúng. Giọng {idol_het_thoi}._
idol_het_thoi: *(ngồi cạnh bạn ở pantry, kính đen)* Nó hát sai lời bài của anh. Trên sóng truyền hình. Em biết anh là ai không?
~ follow(80000)
mc_tivi_hong: Và câu hỏi cuối cùng, trị giá 10 triệu đồng…
{ rd_doi_kich_ban_gameshow:
    mc_tivi_hong: *(đọc thẻ, ngập ngừng)* "Hồi nhỏ anh từng bắt nạt ai chưa?" Ủa câu này ai viết vậy?
    _Trên màn hình, {sieu_nhan_hong} đứng im rất lâu. Trường quay im lặng theo._
    sieu_nhan_hong: *(trên tivi)* …Có. Anh từng nhốt một đứa nhỏ trong nhà kho. Anh xin lỗi. Nếu em đang xem… anh xin lỗi.
    _Trường quay vỗ tay như sấm. Hashtag "XinLỗiNhàKho" lên xu hướng trong 20 phút._
    ~ follow(50000)
    ~ rd_han(-10)
    ~ rd_biet_chuoc_loi = true
    _Bạn định làm hắn bẽ mặt. Hắn lại xin lỗi. Trên sóng truyền hình. Mà không biết bạn đang ngồi xem._
- else:
    mc_tivi_hong: Anh có dám tháo mũ ngay tại đây không?
    sieu_nhan_hong: *(tạo dáng trên tivi)* Hồng không phải màu, Hồng là thái độ! Mà thái độ của anh là… để dành!
    ~ follow(20000)
}
hong_hot: Ối dồi ôi! Tối nay trang mình nổ thông báo luôn!
* [🐍 Nhắn group Anti Sếp: "Hát sai lời bài hit của chính công ty mình, nhục quá."]
    ~ rd_tung_tin(8, 3)
    idol_het_thoi: *(liếc điện thoại của bạn, gật gù)* Em nói đúng. Nhục.
    ~ qh("idol_het_thoi", 10)
* [🤝 Đăng lên bản tin nội bộ: "Cảm ơn anh {idol_het_thoi} hát bè cứu cả trường quay!"]
    ~ qh("idol_het_thoi", 20)
    ~ rd_giup(5000)
    idol_het_thoi: *(tháo kính đen ra)* …Em viết lại câu đó cho anh xem lần nữa được không?
* [😶 Ăn thêm đĩa thứ ba.]
    ~ an(10)
    _Buffet miễn phí. Kẻ thù lên sóng. Hai chuyện đó cùng lúc thì ăn trước đã._
- -> END
