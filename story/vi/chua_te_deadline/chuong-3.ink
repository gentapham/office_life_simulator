// ============================================================
// CHÚA TỂ DEADLINE · CHƯƠNG 3: "CÚP ĐIỆN, CÚP LUÔN DEADLINE" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== chua_te_deadline_1310_ngay_doanh_nhan ===
# ngay:13 # gio:09:45 # noi:sanh_tang_tret # bat_buoc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho chính mình. {thanh_ninh} đọc bài phát biểu khen sếp 15 phút. Trên tường phòng giám đốc treo giải "Doanh nhân của năm" do BTT Global trao, viền vàng, chữ hơi lem._
giam_doc: Cảm ơn em. Mà {chua_te_deadline} đâu? À. Anh nhắc lại nhé, clip 16 năm công ty ấy. Anh muốn mở đầu bằng cảnh drone dự án tháng 6, cái cảnh bay qua cầu lúc hoàng hôn ấy. Đẹp lắm.
_Cảnh drone. Hoàng hôn. Nó nằm trong cái USB. Cái USB nằm… ở đâu đó trên đời._
* [🧯 "Dạ anh, em đang cho {editor} chỉnh màu lại cảnh đó."]
    ~ vu_lo_file = vu_lo_file + 10
    editor: *(từ xa, không ngẩng đầu)* Hửm?
    giam_doc: Tốt! Thái độ thế là tốt!
* [⏳ "Dạ file nặng quá anh, máy chủ đang đồng bộ. Tuần sau em gửi."]
    { RANDOM(1, 10) <= 4:
        ke_toan: *(đi ngang)* Máy chủ đồng bộ hả? Anh {it} nói tuần này máy chủ bị cúp điện bảo trì mà.
        ~ vu_lo_file = vu_lo_file + 15
        ~ uy_tin = uy_tin - 10
    - else:
        giam_doc: Ừ, ừ. Công nghệ thì anh tin em.
        ~ vu_lo_file = vu_lo_file + 5
    }
* [💬 "Anh ơi, nếu mình mở đầu bằng cảnh mới của Siêu Nhân Hồng thì sao anh?"]
    giam_doc: Không! Clip 16 năm là phải có quá khứ. Có cội nguồn. Em check lại cái mindset giúp anh.
    ~ vu_lo_file = vu_lo_file + 8
    ~ qh("giam_doc", -3)
- thanh_ninh: *(vỗ tay)* Anh nói chuẩn quá anh ơi! Cội nguồn! Chuẩn từng chữ!
-> END

// ------------------------------------------------------------
=== chua_te_deadline_1410_son_nghi ===
# ngay:14 # gio:08:40 # noi:ban_lam_viec # bat_buoc
_Ngày Hội Nông dân. 8 giờ 40, Zalo-lô của bạn hiện tin nhắn từ {thanh_xin_nghi}._
thanh_xin_nghi: Anh ơi em xin phép nghỉ hôm nay ạ. Em về quê phụ gặt lúa. Lúa nhà em chín đúng hôm nay ạ, lúa hông chờ người ạ.
_Tuần gameshow. Người điều phối lịch nghệ sĩ đi gặt lúa. Lúa ở Ven Đô. Ven Đô cũng là nơi có Đài Tivi Hóng. Bạn không nghĩ tới chi tiết đó._
* [😇 "Ờ ông đi đi, gặt cho đẹp."]
    thanh_xin_nghi: Dạ em cảm ơn anh! *(gửi kèm sticker cây lúa đeo micro)*
    ~ qh("thanh_xin_nghi", 8)
    _Lịch nghệ sĩ cả tuần giờ nằm trên vai bạn._
    -> chua_te_deadline_mg_xep_lich_quay_mo_dau
* [🙏 "Ông đi gặt thì gửi lịch cho anh {thuc_tap_sinh} làm giùm nha."]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    thuc_tap_sinh: Dạ em làm liền ạ! Dạ… điều phối lịch là sao ạ?
    ~ qh("thuc_tap_sinh", -5)
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 5
* [💬 "Lúa nào chín tháng 10 vậy ông? Gửi tui tấm hình ruộng coi."]
    thanh_xin_nghi: *(gửi một tấm ảnh ruộng lúa… có watermark của một trang ảnh miễn phí)*
    _Bạn nhìn cái watermark. Bạn quyết định không hỏi thêm. Ai rồi cũng có deadline riêng._
    ~ qh("thanh_xin_nghi", 3)
- -> chua_te_deadline_1410_moc_2

= chua_te_deadline_1410_moc_2
_17 giờ. Mốc 2: 200.000 người theo dõi._
{ nguoi_theo_doi >= 200000 && vu_nuoc_toi_chan < 100:
    hong_hot: {nguoi_theo_doi}! Qua mốc 2 rồi nha mấy bà!
    sieu_nhan_hong: Vì công lý và lượt view! *(đặt lên bàn bạn một cái gối cổ màu hồng)* Cho producer ngủ trưa.
    ~ vu_qua_hong++
- else:
    ~ vu_moc_truot++
    hong_hot: Trượt mốc 2 rồi… {nguoi_theo_doi} thôi.
    _Siêu Nhân Hồng không nói gì. Chiều đó Nguyên bỏ đi giúp người tới tối mịt, không đặt quà lên bàn ai._
    ~ follow(5000)
}
-> END

// ------------------------------------------------------------
=== chua_te_deadline_1510_mat_dien_sang ===
# ngay:15 # gio:08:05 # noi:sanh_tang_tret # bat_buoc
_8 giờ 05. Bạn vừa bước vào sảnh, hiếm hoi đúng giờ, thì "phụt". Cả tòa nhà tối om._
_Từ thang máy vọng ra tiếng đập cửa và hai giọng nói. Một giọng Bắc. Một giọng rất gắt._
giam_doc: *(trong thang máy)* Bình tĩnh! Bình tĩnh! Anh không ép, tùy em, nhưng em đừng đấm cửa nữa!
chi_dai: *(trong thang máy)* Anh ngồi xuống đi anh {giam_doc}! Đứng sát em vậy em ngộp!
_Mất điện cả ngày. Kịch bản gameshow phải nộp Đài Tivi Hóng trước 9 giờ sáng mai. Laptop của bạn: 12% pin._
* [🧯 Chạy đi tìm {bac_bao_ve} mở cửa thang máy.]
    bac_bao_ve: Ừ… Bác biết rồi. Bác có chìa. Năm nào cái thang này cũng nhốt một người. Năm nay nhốt hai.
    _Cửa mở. {giam_doc} bước ra, tóc rối, cà vạt lệch. {chi_dai} bước ra như vừa thắng một trận._
    giam_doc: {chua_te_deadline}! Em… em có tố chất xử lý khủng hoảng đấy!
    ~ qh("giam_doc", 8)
    ~ qh("chi_dai", 5)
    ~ qh("bac_bao_ve", 3)
* [🔋 Chạy lên tầng 1 cắm sạc trước khi UPS hết.]
    _Bạn giành được ổ cắm UPS cuối cùng. Laptop lên được 31%. Ngoài kia hai người vẫn kẹt._
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 5
* [📱 Quay clip "sếp kẹt thang máy" gửi {hong_hot}.]
    hong_hot: Ối dồi ôi! Mà khoan… Đăng cái này là tui bị đuổi đó ông. Tui để trong máy làm kỷ niệm.
    ~ vu_gio_luot = vu_gio_luot + 1
    ~ qh("hong_hot", 3)
- _Ở phòng họp "Sáng Tạo", {truong_phong} thắp nến. Một cuộc họp dưới ánh nến. Không ai biết đó là lãng mạn hay đáng sợ._
truong_phong: Không có điện thì mình họp bằng tinh thần. Mọi người ngồi xuống.
* [🙈 Lẻn ra pantry trước khi bị điểm danh.]
    ~ vu_so_lan_ne_nhat++
    _Bạn né được cuộc họp thứ {vu_so_lan_ne_nhat} của tháng._
* [🕯️ Ngồi họp, nhân tiện ké ánh nến gõ kịch bản.]
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 5
    truong_phong: Tốt. Cậu đang ghi biên bản đấy à? Hiếm thấy đấy.
    ~ qh("truong_phong", 3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1510_pin_3_phan_tram ===
# ngay:15 # gio:18:40 # noi:pantry # bat_buoc
_Pantry tối om, chỉ có ánh đèn điện thoại. Cả công ty ngồi bệt kể chuyện. {thuc_tap_sinh} vừa lấy ra 5 cục sạc dự phòng hàng xịn, chia cho mọi người. Không ai hiểu một thực tập sinh lương 4 triệu lấy đâu ra._
_Laptop của bạn: 3%. Kịch bản gameshow còn đúng 2 vòng câu hỏi. Từ cầu thang có tiếng giày quen thuộc…_
truong_phong: {chua_te_deadline}! Kịch bản gameshow đâu? Mai 9 giờ là nộp đài rồi đấy! # hen_gio:5
* [🧯 "Anh {thuc_tap_sinh} ơi, cục sạc!"]
    thuc_tap_sinh: Dạ đây ạ! *(cục sạc thứ 3 trong 5 cục, vỏ nhôm, có khắc tên hãng mà bạn chỉ thấy trong quảng cáo sân bay)*
    _Kịch bản được cứu. Bạn gõ tiếp. {hong_hot} nheo mắt nhìn cục sạc: "Ủa sao nó có nhiều sạc xịn vậy?"_
    ~ vu_kich_ban_gameshow = true
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 15
    ~ qh("thuc_tap_sinh", 5)
* [📊 "Xong 80% rồi anh, còn khâu đọc lại."]
    ~ vu_bao_cao_80++
    truong_phong: Cho tớ xem.
    _Bạn xoay laptop lại. Màn hình tắt phụt._
    { RANDOM(1, 10) <= 5:
        truong_phong: … Ờ, tớ thấy loáng thoáng có chữ. Tốt. Tớ tin cậu lần này.
        _Bạn có thêm một đêm. Bạn mượn sạc, viết nốt lúc 23 giờ._
        ~ vu_kich_ban_gameshow = true
    - else:
        truong_phong: Màn hình đen mà cậu bảo 80%. Uy tín cậu cũng đen theo đấy.
        ~ uy_tin = uy_tin - 20
        ~ qh("truong_phong", -10)
        _Đêm đó bạn viết lại 2 vòng bằng điện thoại, gửi lúc 8 giờ 58._
        ~ vu_kich_ban_gameshow = true
    }
* [✍️ Xé một tờ giấy, viết tay 2 vòng còn lại.]
    _Lần đầu viết tay sau 6 năm. Chữ xấu tới mức chính bạn đọc lại cũng phải đoán._
    ~ vu_kich_ban_gameshow = true
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
    truong_phong: *(soi tờ giấy dưới ánh nến)* Đây là chữ hay là bản đồ?
    _Mai trên sóng, {sieu_nhan_hong} sẽ đọc nhầm 3 câu. Và cả nước sẽ cười._
    ~ follow(20000)
* [⏱️ (Không chọn kịp)]
    _Laptop tắt. Mất trắng 2 vòng câu hỏi. File tự lưu lần cuối lúc… 14 giờ._
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 30
    ~ cang_thang(20)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1510_trong_bong_toi ===
# ngay:15 # gio:20:10 # noi:pantry # bat_buoc
_Pantry còn mỗi vài người. Bạn ngồi góc, gõ phím dưới ánh đèn điện thoại. Bên cạnh có người ngồi xuống, thở dài một tiếng rất nhỏ._
_Một anh chàng không đội mũ. Tóc bết mồ hôi. Áo thun trơn. Ôm một cái mũ hồng trong lòng._
sieu_nhan_hong: Ờm… em… sao chưa về?
_Bạn mất 5 phút mới nhận ra giọng đó. Nhỏ nhỏ. Không có "Biến hình!"._
* [😮 "Ủa… anh {sieu_nhan_hong} hả? Không có mũ nghe giọng anh lạ ghê."]
    sieu_nhan_hong: Dạ… ờm… ừ. Lạ lắm hả?
    ~ vu_tin_that_long = vu_tin_that_long + 5
* [😎 "Mất điện thì deadline cũng mất điện mà anh. Chill."]
    sieu_nhan_hong: *(cười, lần đầu cười không tạo dáng)* Em nói câu đó y như lần đầu anh gặp em.
    ~ vu_tin_that_long = vu_tin_that_long + 8
* [📱 Rọi đèn điện thoại vào mặt người ta.]
    sieu_nhan_hong: Á! *(lấy mũ che mặt)* Đừng… đừng chụp nha em.
    _Bạn tắt đèn liền. Trong bóng tối, cả hai im một lúc._
    ~ vu_tin_that_long = vu_tin_that_long + 2
- _Hai người ngồi cạnh nhau. Ngoài cửa sổ, cả Quận Hóng cũng tối. Chỉ có đèn xe chạy qua._
sieu_nhan_hong: Em biết hông… anh mặc bộ đồ đó là vì… mặc vào thì anh dám nói chuyện với người lạ. Tháo ra thì anh… như vầy nè.
sieu_nhan_hong: Mấy món quà hồng… ờm… hông phải PR đâu.
{ vu_tin_that_long >= 40:
    _Bạn im lặng rất lâu. Đèn điện thoại tắt. Bạn không bật lại._
- else:
    _Bạn nghĩ ngay tới {quan_ly_idol}. Chắc anh {quan_ly_idol} dặn nói vậy. Kịch bản couple tới tập mấy rồi ta?_
}
* {vu_tin_that_long >= 40} [🩷 "…Đèn có lại thì anh nói lại câu đó coi."]
    sieu_nhan_hong: *(nhỏ xíu)* … Ừ.
    ~ vu_tin_that_long = vu_tin_that_long + 20
    ~ qh("sieu_nhan_hong", 10)
* [😅 "Anh {quan_ly_idol} dặn anh nói vậy đúng hông?"]
    sieu_nhan_hong: … *(cười nhẹ)* Ờ. Chắc vậy.
    ~ vu_tin_that_long = vu_tin_that_long + 3
* [🤝 Đưa nửa ổ bánh mì đang ăn dở.]
    sieu_nhan_hong: *(nhận bằng hai tay, như nhận một thứ rất quý)* Cảm ơn em.
    _Nguyên ăn chậm rãi. Không nói thêm câu nào. Nhưng không khí trong pantry ấm lên một chút, dù không có điện._
    ~ vu_tin_that_long = vu_tin_that_long + 12
    ~ qh("sieu_nhan_hong", 8)
* {vu_lo_file >= 20 && not vu_co_file} [🔒 "Anh biết hông, em đang giấu một chuyện…"]
    sieu_nhan_hong: Chuyện gì? Em kể đi. Tối thui vầy, kể gì cũng được.
    _Bạn kể chuyện cái USB. Kể xong mới thấy nhẹ cả người. Nguyên nghe, không cười, không hỏi tại sao._
    ~ vu_tin_that_long = vu_tin_that_long + 15
- -> chua_te_deadline_1510_linh_thi_tham

= chua_te_deadline_1510_linh_thi_tham
_Từ góc bên kia pantry, có tiếng ngáp quen thuộc. Rồi giọng {editor}, nói rất nhỏ:_
editor: Thứ 3 tuần sau sếp đòi clip 16 năm rồi đó. Ông tính sao?
{ vu_co_file:
    _Bạn sờ túi áo. Cái USB vẫn ở đó. Lần này nó ở đó thật._
    editor: À, có rồi hả. Vậy thôi. *(ngáp, rồi ngủ)*
    -> END
}
* {not vu_linh_giu_bi_mat} [😇 Thú nhận với {editor}.]
    editor: *(im lặng)* … Tui đoán vậy từ bữa rồi. Tui hông nói ai. Mà ông phải tìm cho ra, tui hông dựng được clip bằng không khí.
    ~ vu_lo_file = vu_lo_file - 30
    ~ vu_linh_giu_bi_mat = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("editor", 10)
* [🧯 "Tui tính rồi. Ông ngủ đi."]
    editor: *(ngáp)* Ông "tính rồi" giống y như cách ông "chill" á.
    ~ vu_lo_file = vu_lo_file + 10
* {vu_linh_giu_bi_mat} [🤝 "Ông nhớ hồi tháng 6 máy chủ có sao lưu tự động hông?"]
    editor: Sao lưu… Hình như hồi đó anh {it} có cắm cái ổ gì đó vào máy chủ… Ông hỏi ổng thử.
    _Một manh mối mới. Bạn ghi vào điện thoại: "Hỏi anh {it}: ổ sao lưu?"_
    ~ qh("editor", 3)
    ~ qh("it", 2)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1610_nop_kich_ban ===
# ngay:16 # gio:08:50 # noi:dai_tivi_hong # bat_buoc
_8 giờ 50, sảnh Đài Tivi Hóng. Chị biên tập viên của đài đứng chờ, tay gõ gõ lên đồng hồ._
{ vu_kich_ban_gameshow:
    _Bạn đưa tập kịch bản. Chị biên tập lật từng trang, gật đầu. 8 giờ 52. Sớm 8 phút. Kỷ lục cá nhân._
    ~ follow(80000)
    ~ uy_tin = uy_tin + 10
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 10
    -> chua_te_deadline_1610_hang_ghe_dau
- else:
    _Bạn đưa tập kịch bản. Thiếu 2 vòng. Chị biên tập nhìn bạn như nhìn một trận mưa không báo trước._
    _"Thiếu thì để nghệ sĩ tự do phát huy," chị nói. Trong giới truyền hình, câu đó có nghĩa là "chúc may mắn"._
    ~ uy_tin = uy_tin - 10
    -> chua_te_deadline_1610_hang_ghe_dau
}

= chua_te_deadline_1610_hang_ghe_dau
_Hậu trường. {sieu_nhan_hong} đã mặc đồ, đội mũ, đang khởi động bằng cách tạo dáng liên tục. Thấy bạn, Siêu Nhân Hồng chạy lại._
sieu_nhan_hong: {chua_te_deadline}! Em ngồi hàng ghế khán giả đầu tiên được hông? Để anh có… động lực!
quan_ly_idol: Khoan, anh nghe máy chút… Ủa, producer phải ở hậu trường mà Nguyên!
_Bạn nghĩ: "Kịch bản couple tới tập 2 rồi."_
* [🎧 "Em ở hậu trường, đeo tai nghe. Anh cứ nhìn về cánh gà là thấy em."]
    sieu_nhan_hong: Cánh gà… Ừ! Anh sẽ nhìn cánh gà! *(tạo dáng hơi bị lố)*
    ~ vu_tin_that_long = vu_tin_that_long + 5
* [🪑 Ra ngồi hàng ghế đầu thật.]
    _Bạn ngồi hàng ghế đầu, giữa hai cô chú khán giả cầm bảng "Hồng Là Thái Độ". Cả buổi, Siêu Nhân Hồng nhìn xuống đúng chỗ bạn 14 lần. Bạn đếm._
    ~ vu_tin_that_long = vu_tin_that_long + 10
    ~ follow(10000)
    ~ qh("quan_ly_idol", -3)
* [📱 "Anh nhìn camera số 2 nha, góc đó đẹp."]
    sieu_nhan_hong: À… camera số 2. Ừ. *(gật đầu, tạo dáng, nhưng vai hơi xuống)*
    ~ vu_tin_that_long = vu_tin_that_long - 3
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1610_hit_mot_thoi ===
# ngay:16 # gio:19:40 # noi:dai_tivi_hong # bat_buoc
_Gameshow "Hồng Hay Không Hồng". Phần "Hit Một Thời": thí sinh phải hát lại một bản hit cũ._
_{sieu_nhan_hong} cầm micro. Bài được chọn: "Công Viên". Nhạc dạo vang lên._
sieu_nhan_hong: *(hát)* Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên… thích ăn… KHOAI CHIÊN!
_Cả trường quay im phăng phắc. Khoai chiên. Không phải chuối chiên. Ở cánh gà, {idol_het_thoi} đứng chết trân, tay nắm chặt._
{ not vu_kich_ban_gameshow:
    _Không có kịch bản dự phòng. Cả trường quay nhìn về phía bạn, người đeo tai nghe đạo diễn._
}
_Trong tai nghe, MC hỏi: "Producer ơi, cắt hay để?"_ # hen_gio:5
* [🎤 "Đưa micro cho anh {idol_het_thoi} ở cánh gà! Hát bè!"]
    _{idol_het_thoi} bước ra, gỡ kính đen, hát câu đúng: "…thích ăn chuối chiên!". Hai giọng hòa vào nhau. Khán giả đứng dậy hát theo._
    ~ follow(50000)
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 8)
* [😎 "Để. Sai là content."]
    { RANDOM(1, 10) <= 6:
        _"Khoai chiên" lên xu hướng trong 20 phút. Cả nước tranh cãi: đôi bạn thân thích ăn gì?_
        ~ follow(50000)
        ~ scandal()
    - else:
        _Fan "Công Viên" nổi giận: "Hát sai lời bài hát tuổi thơ của tôi". Bình luận chê gấp ba bình luận khen._
        ~ follow(-30000)
    }
* [✂️ "Cắt! Vào quảng cáo!"]
    _Vào quảng cáo. Nhà tài trợ quảng cáo là… không ai. Màn hình chiếu logo đài 30 giây liền._
    ~ follow(5000)
* [⏱️ (Không chọn kịp)]
    _Không ai ra lệnh. Siêu Nhân Hồng hát tiếp, sai thêm 2 câu. "Công viên" thành "công viền"._
    ~ follow(-10000)
    ~ scandal()
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1610_buffet_toi ===
# ngay:16 # gio:21:30 # noi:pantry
_Ngày Lương thực Thế giới. Về tới công ty, buffet liên hoan đã bày sẵn. Trà sữa thứ 6 cũng tới cùng lúc. Một ngày dài, một bụng đói._
_Trên bàn bạn, món quà hồng hôm nay: một hộp bánh chuối chiên còn nóng. Mẩu giấy: "Cảm ơn producer đã cứu anh hôm nay."_
~ vu_qua_hong++
~ nhan(chuoi_chien)
chi_dai: {chua_te_deadline}, ăn đi rồi đi về. Mai 6 giờ sáng là lên xe đi Vũng Tàu đó. Đứa nào trễ xe chị bỏ lại.
* [🍽️ Ăn hết mình, rồi về ngủ sớm.]
    ~ an(60)
    ~ uong(30)
    ~ nghi(20)
    chi_dai: Ngoan. Lần đầu chị thấy em về sớm.
    ~ qh("chi_dai", 5)
* [💻 Ăn vội, ngồi nghĩ hồ sơ xin phép biểu diễn Đại Nhạc Hội (hạn 8:00 thứ 2).]
    ~ an(40)
    _Hồ sơ xin phép biểu diễn: 14 trang, 3 con dấu, 1 bản vẽ sân khấu. Hạn: 8 giờ sáng 19/10. Bạn mở file mới. Gõ tiêu đề. Đóng file. "Lên xe làm."_
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 5
* [🎱 Xuống bida ăn mừng gameshow.]
    ~ an(30)
    ~ nghi(-15)
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 10
    _Bạn về phòng lúc 2 giờ sáng. Báo thức 5 giờ 30. Bạn nhìn báo thức, báo thức không nhìn lại._
- -> END
