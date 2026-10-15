// ============================================================
// IDOL HẾT THỜI · CHƯƠNG 3: "CÚP ĐIỆN, CÒN GIỌNG" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== idol_het_thoi_1310_doanh_nhan ===
# ngay:13 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho chính mình, bó to nhất tiệm. {thanh_ninh} đứng đọc bài phát biểu khen sếp, đồng hồ bấm giờ đã sang phút thứ 13._
thanh_ninh: …và anh {giam_doc} không chỉ là một doanh nhân, anh là một ngọn hải đăng, anh nói chuẩn quá anh ơi…
_{sales} bước lên, trao cho {giam_doc} một tấm bằng khung vàng: "Doanh nhân của năm, do Tập đoàn BTT Global bình chọn"._
sales: Mr. Kevin Trộn gửi lời chúc anh. Tin chị đi, giải này hiếm lắm.
giam_doc: *(xúc động)* Cảm ơn em. Anh sẽ treo ngay sau lưng ghế. À, {idol_het_thoi}! Hát một bài mừng đi em. Bài gì cũng được. Bài kia ấy.
_"Bài kia" là "Công Viên". Mười một năm rồi, với anh {giam_doc}, bài nào của bạn cũng là "bài kia"._
* [🎤 Hát "Công Viên", đổi lời: "Ngày xưa có anh {giam_doc} thân… bán cá viên chiên…"]
    _{giam_doc} cười to nhất phòng. {thanh_ninh} vỗ tay theo nhịp, hơi lệch. {chi_dai} cũng nhếch mép._
    ~ qh("giam_doc", 10)
    ~ qh("thanh_ninh", 3)
    ~ phat_tt(-3)
    ~ phat_nt(1)
* [🕶️ "Em hát bản 2015 nguyên gốc. Có solo guitar ba phút."]
    _Ba phút solo guitar. {thanh_ninh} cố khen "solo có tâm quá anh ơi" ở giây thứ 90. {giam_doc} nhìn đồng hồ hai lần._
    ~ phat_tt(5)
    ~ qh("giam_doc", 2)
* [💬 Nhìn tấm bằng: "Anh ơi, BTT Global có văn phòng ở đâu vậy anh?"]
    sales: *(cười rất tươi)* Ở nước ngoài anh. Bên đó chi nhánh nhiều lắm.
    giam_doc: Thôi {idol_het_thoi}, ngày vui. Hát đi em.
    _{designer} đứng ở cửa nhìn bạn một cái rất lâu._
    ~ qh("sales", -5)
    ~ qh("designer", -3)
    ~ phat_tt(-2)
- _Tấm bằng được treo ngay chỗ trước đây là tấm ảnh {giam_doc} chụp với bạn năm 2015. Tấm ảnh được chuyển xuống bàn, nằm úp._
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1310_karaoke ===
# ngay:13 # gio:20:30 # noi:karaoke
_Karaoke Hát Cho Nhau Nghe, phòng VIP 3 (VIP vì có một bóng đèn nháy). {dan_dau_tu}, {chua_te_deadline} và {it} rủ bạn đi "giải tỏa"._
dan_dau_tu: Kèo nè: ông {idol_het_thoi} hát "Công Viên", máy chấm trên 90 thì tụi tui bao. Dưới 90 thì ông bao.
chua_te_deadline: Chill, máy này chưa cho ai quá 80 hết. Bài gốc cũng vậy.
it: Máy chấm theo âm lượng. Không theo cao độ.
_{it} nói câu đó rồi nhìn bạn, như vừa đưa bạn chìa khóa._
* [🎤 Hát thiệt, đúng như bản 2015.]
    { RANDOM(1, 10) <= 2:
        _Màn hình nhấp nháy: 100 ĐIỂM. Cả phòng im lặng. Rồi {dan_dau_tu} đứng dậy vỗ tay như vừa thấy coin x10._
        ~ phat_karaoke_100 = true
        ~ phat_tt(20)
        ~ phat_nt(3)
    - else:
        _Màn hình: 78 điểm. Lời bình của máy: "Bạn có tiềm năng!"_
        chua_te_deadline: 78. Y chang năm ngoái.
        ~ cang_thang(5)
    }
* [📢 Hát thật to, theo mẹo của {it}.]
    _Bạn hét điệp khúc. Kính cửa rung. Màn hình: 96 điểm. {dan_dau_tu} cắn môi, móc ví._
    dan_dau_tu: Gian lận… mà thôi, kèo là kèo. Đồ nhậu tui bao.
    ~ qh("it", 5)
    ~ phat_tt(5)
    ~ an(20)
* [🤝 "Thôi để {it} hát. Cả năm chưa nghe {it} hát lần nào."]
    it: …Ừ.
    _{it} hát một bài nhạc rock cũ. Hát hay bất ngờ. Máy chấm 61 điểm vì {it} hát nhỏ quá._
    ~ qh("it", 12)
    ~ phat_tt(-5)
- ~ cang_thang(-15)
~ uong(20)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1410_tui_cua_son ===
# ngay:14 # gio:11:30 # noi:studio
_Ngày Hội Nông dân. {thanh_xin_nghi} xin nghỉ "về quê phụ gặt lúa". {hr} đứng ở cửa phòng Nghệ sĩ, ghi gì đó vào sổ._
{ nguoi_theo_doi < 200000:
    _Mốc 2: 200.000 người theo dõi. Không đạt. {sieu_nhan_hong} buồn, bỏ đi giúp người cả ngày. Cả công ty lặng như tờ._
- else:
    _Mốc 2: 200.000 người theo dõi. Đạt. {sieu_nhan_hong} tặng cả công ty mỗi người một bịch chuối chiên. Bạn nhận một bịch, cầm lâu._
}
_Trong studio, bạn tìm thấy một cái túi vải bỏ quên dưới ghế. Túi của {thanh_xin_nghi}. Miệng túi lòi ra một góc vải kim tuyến lấp lánh._
_Bạn kéo ra. Bộ vest kim tuyến tím. Kèm một tấm thẻ đeo: "GIỌNG CA ƯỚC MƠ, VÒNG 2, THÍ SINH SỐ 27"._
_Hôm nay {thanh_xin_nghi} "gặt lúa". Chắc là gặt ở Đài Tivi Hóng._
~ phat_hien(son_thi_hat)
* [🤝 Cất lại vào túi, nhét thêm hộp kẹo ngậm thông cổ của mình vào.]
    { phat_co_keo_ngam:
        ~ phat_co_keo_ngam = false
    }
    _Bạn để lại một tờ giấy: "Hát nốt cao thì đừng gồng. Anh {idol_het_thoi}." Rồi bạn đem túi ra Đài Tivi Hóng giùm, gửi ở quầy lễ tân._
    ~ qh("thanh_xin_nghi", 20)
    ~ phat_tt(-8)
    ~ nghi(-10)
* [🐍 Đem túi qua phòng {hr}.]
    hr: *(mỉm cười)* Cảm ơn anh {idol_het_thoi} nhé. Anh rảnh không, lát lên phòng anh uống trà xíu.
    _Bạn không biết vì sao bạn làm vậy. Có lẽ vì trên tấm thẻ ghi "Vòng 2". Bạn chưa bao giờ đi thi vòng nào._
    ~ qh("hr", 5)
    ~ qh("thanh_xin_nghi", -30)
    ~ qh("quan_ly_idol", -10)
    ~ cang_thang(5)
* [😶 Để nguyên chỗ cũ. Nhắn {thanh_xin_nghi}: "Túi em quên ở studio nè."]
    thanh_xin_nghi: *(trả lời sau 1 giây)* ANH ĐỪNG MỞ RA NHA ANH. Em xin anh. Bà ngoại em… ờ… cảm ơn anh.
    ~ qh("thanh_xin_nghi", 8)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1510_cup_dien ===
# ngay:15 # gio:11:05 # noi:tang_1 # bat_buoc
_Ngày Thanh niên Việt Nam. Mất điện cả ngày. Bạn tới lúc 11 giờ, như mọi ngày, và lần đầu tiên không ai để ý bạn tới trễ: không có máy chấm công._
thuc_tap_sinh: Dạ anh! Hồi 8 giờ 5 phút anh {giam_doc} với chị {chi_dai} kẹt thang máy gần hai tiếng ạ. Chị {chi_dai} đạp cửa. Anh {giam_doc} thì… im lặng suốt ạ.
_{thuc_tap_sinh} đang phát sạc dự phòng cho cả phòng. Năm cục. Không ai hỏi vì sao một thực tập sinh 30 tuổi có năm cục sạc xịn vậy._
thuc_tap_sinh: Em là thanh niên mà, Ngày Thanh niên em phải gương mẫu ạ.
_Studio tầng 2 tối thui. Không micro, không loa, không đèn. Lần đầu tiên trong mười một năm, phòng tập của bạn chỉ còn là một căn phòng._
* [🕶️ Vẫn đeo kính đen, đi lên cầu thang tối.]
    _Bạn vấp bậc thứ 7. Không ai thấy. Bạn đứng dậy, chỉnh kính._
    ~ phat_tt(3)
    ~ nghi(-5)
* [🤝 Nhận một cục sạc của {thuc_tap_sinh}, đem lên cho anh {quan_ly_idol}.]
    _Anh {quan_ly_idol} ngồi ở bậc thang, hai điện thoại, một cái 12%, một cái 9%. Thấy cục sạc, anh nhìn bạn như nhìn ân nhân._
    quan_ly_idol: {idol_het_thoi}… em cứu anh rồi đó. Ủa, sao em biết anh hết pin?
    _Vì anh lúc nào cũng hết pin. Bạn không nói._
    ~ qh("quan_ly_idol", 10)
    ~ qh("thuc_tap_sinh", 3)
* [💬 Ngó vô phòng họp "Sáng Tạo": {truong_phong} đang họp thắp nến.]
    truong_phong: Anh {idol_het_thoi} vào đây! Mình sync nhanh 5 phút. Chủ đề: làm thế nào để họp khi không có điện.
    _Ba cây nến. Năm người. Ai cũng nói thật hơn mọi ngày, có lẽ vì không ai thấy mặt ai._
    ~ qh("truong_phong", 5)
    ~ phat_tt(-2)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1510_nghe_long ===
# ngay:15 # gio:14:40 # noi:hanh_lang_tang_1
_Hành lang tối. Từ góc pantry vọng ra tiếng đàn guitar cũ, cây đàn trong kho studio. Ai đó đang ngân nga. Giai điệu lạ. Hay. Hay tới mức bạn đứng lại._
_"…Hồng không phải màu… Hồng là thái độ…"_
_Ánh điện thoại hắt lên mặt người đang hát: {con_ong_chau_cha}. Cháu giám đốc. Người lúc nào cũng nói "để anh gọi chú anh"._
* [📱 Lén bật ghi âm. 20 giây.]
    _Bạn ghi được 20 giây. Điệp khúc. Đủ để nhớ, đủ để hát lại._
    ~ phat_co_ghi_am_long = true
    ~ phat_hien(bai_hat_long)
    ~ cang_thang(5)
* [💬 Bước ra: "Bài này của ai vậy em?"]
    con_ong_chau_cha: *(giật mình, đặt đàn xuống)* Ủa anh {idol_het_thoi}… À… bài trên mạng. Em nghe đâu đó thôi.
    _Không có bài nào trên mạng như vậy. Bạn biết. {con_ong_chau_cha} biết bạn biết._
    ~ phat_hien(bai_hat_long)
    ~ qh("con_ong_chau_cha", 5)
* [😶 Đứng nghe hết, rồi đi, không để ai thấy.]
    _Bạn đi về phía cầu thang. Câu "Hồng là thái độ" cứ lặp lại trong đầu. Lâu lắm rồi không có bài nào lặp lại trong đầu bạn, trừ bài của chính bạn._
    ~ phat_tt(-2)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1510_hat_trong_bong_toi ===
# ngay:15 # gio:18:10 # noi:pantry # bat_buoc
_6 giờ chiều. Vẫn chưa có điện. Không ai về, vì ngoài đường mưa, và vì trong pantry có ấm nước sôi bằng bếp ga mini của {chi_dai}._
_Cả công ty ngồi bệt dưới sàn. Ánh sáng duy nhất là vài màn hình điện thoại. Ở góc xa nhất có ai đó đã tháo mũ, ngồi rất gần {chua_te_deadline}. Trong tối, bạn không nhận ra là ai._
hong_hot: Chán quá. Có ai hát gì đi.
_Im lặng. Rồi {chi_dai} nói, không quay đầu:_
chi_dai: {idol_het_thoi}. Hát đi.
_Không micro. Không loa. Không đèn sân khấu. Không ai thấy mặt bạn._
* [🎤 Tháo kính đen. Hát "Công Viên", thật nhỏ, như hồi ở quán cà phê.]
    _"Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên…"_
    _Câu thứ hai, {thuc_tap_sinh} hát theo. Câu thứ ba, {hong_hot}. Tới điệp khúc thì cả pantry hát, lệch tông, sai lời, nhưng ai cũng hát. Lần đầu tiên thật lòng._
    _Bên cạnh bạn, một màn hình điện thoại sáng lên. {editor} đang quay. Lặng lẽ._
    ~ phat_clip_15_quay = true
    ~ phat_tt(-15)
    ~ phat_nt(5)
    ~ qh("editor", 5)
    ~ qh("chi_dai", 5)
    ~ qh("hong_hot", 5)
    ~ cang_thang(-20)
* [🕶️ "Hồi anh còn nổi, anh hát ở sân vận động. Để anh kể mấy em nghe trước."]
    _Bạn kể năm phút. Rồi hát. Nhưng cả phòng đã quen với bóng tối, đã bắt đầu ngáp. Vài người hát theo. Vài người ngủ._
    _{editor} giơ điện thoại lên. Quay được nửa bài thì điện thoại {editor} còn 1% pin._
    ~ phat_clip_15_quay = true
    ~ phat_tt(5)
    ~ phat_nt(1)
* [😶 "Thôi, không có micro anh hông hát."]
    chi_dai: Ờ. Vậy thôi.
    _Im lặng. Rồi {con_ong_chau_cha} ôm đàn, gảy một hợp âm. Không phải bài của bạn._
    ~ phat_tt(5)
    ~ qh("chi_dai", -5)
    ~ cang_thang(10)
- _Ngoài trời vẫn mưa._
{ phat_clip_15_quay:
    _Hát xong, không ai vỗ tay. Cả phòng chỉ ngồi im. Rồi ai đó trong bóng tối nói nhỏ: "Hay quá." Giọng của anh {quan_ly_idol}, từ góc xa nhất._
    _Bạn quay về phía đó. Tối quá. Bạn không thấy mặt anh._
}
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1610_buffet ===
# ngay:16 # gio:11:40 # noi:tang_1
_Ngày Lương thực Thế giới. Liên hoan buffet ở công ty. Điện đã có lại. {thuc_tap_sinh} trả lại sạc cho ai thì không ai nhớ._
_Chiều nay Siêu Nhân Hồng đi gameshow "Hồng Hay Không Hồng" ở Đài Tivi Hóng. Anh {quan_ly_idol} đưa bạn một tấm thẻ: "KHÁCH MỜI PHỤ"._
quan_ly_idol: Em đi với anh nha. Có phần "Hit Một Thời". Anh chưa biết đài định làm gì, nhưng em có mặt là tốt.
* [🕶️ "Khách mời phụ? Em biết anh là ai… à, anh biết em là ai mà."]
    quan_ly_idol: *(cười)* Biết. Biết lâu rồi. Vì vậy mới kêu em đi.
    ~ phat_tt(3)
    ~ qh("quan_ly_idol", 3)
* [😇 "Dạ. Em đi. Mà anh ăn gì chưa? Lấy cho anh dĩa cơm chiên nha."]
    _Bạn lấy hai dĩa. Anh {quan_ly_idol} ăn được ba muỗng thì điện thoại reo. Bạn cầm dĩa đứng đợi anh nghe xong. Mười phút. Cơm nguội. Anh vẫn ăn hết._
    ~ qh("quan_ly_idol", 8)
    ~ phat_tt(-3)
- ~ an(50)
~ uong(15)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1610_canh_ga ===
# ngay:16 # gio:20:15 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng, trường quay số 2. Phần thi "Hit Một Thời". MC vest bóng hô to: "Xin mời Siêu Nhân Hồng thể hiện một bản hit năm 2015!"_
_Nhạc dạo vang lên. Là bài của bạn._
_Bạn đứng trong cánh gà, nghe bài của mình qua giọng người khác. {sieu_nhan_hong} hát được nửa bài thì vấp: "…thích ăn… khoai chiên!"_
_Khán giả cười ồ._
quan_ly_idol: *(nói nhỏ, tay vẫn cầm hai điện thoại)* {idol_het_thoi}, đừng làm gì nha em. Đài đang quay trực tiếp. Chuyện này để anh lo. # hen_gio:5
* [😤 Bước ra sân khấu, giật micro: "CHUỐI chiên!"]
    ~ phat_gianh()
    { RANDOM(1, 10) <= 5:
        _Khán giả vỡ òa. "CHUỐI CHIÊN! CHUỐI CHIÊN!" Bạn hát hết điệp khúc. Đạo diễn đài đứng sau máy quay, mặt trắng bệch._
        ~ phat_nt(10)
        ~ follow(-15000)
        ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
        _Hôm sau đài gửi văn bản: cấm {idol_het_thoi} xuất hiện trên sóng 1 năm._
    - else:
        _Hai anh bảo vệ đài lôi bạn ra. Micro rơi xuống sàn, kêu "bụp". Clip "Ông chú giật micro" lên Tóp-tóp sau 7 phút._
        ~ phat_nt(-3)
        ~ scandal()
        ~ follow(-10000)
        ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
        ~ qh("quan_ly_idol", -10)
    }
    ~ phat_sua_loi_nguyen = phat_sua_loi_nguyen + 1
    ~ qh("sieu_nhan_hong", -15)
* [🎶 Hát bè từ cánh gà. Đúng lời, đúng tông.]
    _Giọng bạn vang ra từ bóng tối cánh gà: "…thích ăn CHUỐI chiên…" {sieu_nhan_hong} nghe thấy. Quay về phía cánh gà. Đưa tay ra mời._
    _Bạn bước ra. Không kính đen. Hai người hát nốt bài. Song ca bất đắc dĩ. Khán giả đứng dậy._
    ~ phat_hat_be_16 = true
    ~ phat_sua_loi_nguyen = phat_sua_loi_nguyen + 1
    ~ follow(20000)
    ~ phat_nt(8)
    ~ qh("sieu_nhan_hong", 20)
    ~ qh("quan_ly_idol", 10)
    ~ phat_tt(-10)
* [🚪 Quay lưng đi ra bãi xe.]
    _Bãi xe đài truyền hình. Gió. Tiếng khán giả vọng ra qua cửa sắt._
    _Năm phút sau anh {quan_ly_idol} chạy ra, thở hổn hển, đưa bạn ly cà phê sữa đá._
    quan_ly_idol: Bài đó vẫn là của em. Ai hát thì nó cũng là của em.
    ~ phat_nt(-3)
    ~ qh("quan_ly_idol", 10)
    ~ phat_tt(-5)
* [⏱️ (Không chọn kịp)]
    _Bạn đứng chết trân. Camera đài lia trúng cánh gà: một người đeo kính đen, đứng bất động trong bóng tối._
    _Cư dân mạng: "Ai đây?" "Ông chú cánh gà." "Nhìn quen quen mà hông nhớ."_
    ~ phat_nt(-2)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1610_sau_show ===
# ngay:16 # gio:23:10 # noi:can_1808
_Về nhà. Gameshow đã phát sóng xong. Tóp-tóp chỉ toàn clip "khoai chiên"._
{ phat_hat_be_16:
    _Clip "Công Viên" song ca ở cánh gà có 1,2 triệu lượt xem sau 3 tiếng. Bình luận được thích nhiều nhất: "Ủa ông anh đeo kính hồi đó hát bài này nè, lâu lắm mới thấy."_
    _Người thật. Không phải hoa sen._
- else:
    _Bạn lướt bình luận. Ai cũng nói về "khoai chiên". Không ai nói về bạn._
}
_Tin nhắn từ {editor}, 23:14: "Dạ anh {idol_het_thoi}, em dựng highlight gameshow. Em để cảnh nào mở đầu ạ?"_
* [😇 "Cảnh Nguyên hát sai lời. Vui, dễ lan."]
    editor: Dạ. *(một lúc sau)* Anh {idol_het_thoi}… anh tốt ghê.
    ~ follow(10000)
    ~ qh("editor", 5)
    ~ qh("sieu_nhan_hong", 5)
* {phat_hat_be_16} [🎶 "Cảnh hai đứa song ca. Cho người ta thấy bài này còn sống."]
    editor: Dạ em cũng nghĩ vậy. Anh {quan_ly_idol} chắc vui lắm.
    _"Anh {quan_ly_idol} chắc vui lắm." Bạn đọc câu đó hai lần mà không hiểu sao {editor} lại nhắc tới anh {quan_ly_idol}._
    ~ follow(15000)
    ~ phat_nt(3)
    ~ qh("editor", 8)
* [🕶️ "Cảnh nào có anh đông nhất."]
    editor: Dạ… dạ để em coi lại footage.
    _Footage có bạn đúng 4 giây._
    ~ phat_tt(5)
- -> END
