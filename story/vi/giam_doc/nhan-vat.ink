// ============================================================
// GIÁM ĐỐC · NÓI CHUYỆN TỰ DO VỚI 22 NHÂN VẬT
// Game mở cảnh khi người chơi bắt chuyện với NPC.
// Lựa chọn "+" cuối mỗi cảnh là lối ra, dùng lại được.
// ============================================================

// ------------------------------------------------------------
=== giam_doc_tudo_ran_doc ===
# npc:ran_doc
_{ran_doc} đang đứng ở pantry, tay cầm sổ tay, nụ cười rất ngọt._
ran_doc: Dạ em chào sếp! Sếp uống gì em pha nha. Mà sếp có nghe gì chưa…
* [💬 "Nghe gì? Em nói anh nghe."]
    ran_doc: Nói nhỏ thôi nha… em thấy chị {ke_toan} hay ở lại muộn, ôm cuốn sổ tay ghi tay riêng, hông phải sổ công ty. Tui chỉ nói sự thật thôi mà.
    ~ phat_hien(quy_den_thuong)
    ** [🧾 "{ke_toan} giữ sổ cho công ty mười năm rồi. Em đừng nói linh tinh."]
        ran_doc: Dạ dạ, em nói vậy thôi chứ hông có ý gì đâu.
        ~ qh("ke_toan", 5)
        ~ qh("ran_doc", -5)
    ** [📝 "Ừ. Em để ý thêm cho anh."]
        ~ qh("ran_doc", 10)
        ~ qh("ke_toan", -5)
* [🐍 "Anh nghe nói em hay nói chuyện về anh trong một cái group."]
    ran_doc: *(cười không đổi sắc)* Dạ group nào sếp? Em ở group "Hội ăn trưa" thôi à.
    _Nụ cười đó chuẩn tới mức đáng sợ._
    ~ qh("ran_doc", -5)
    ~ gd_nghi_clone = gd_nghi_clone + 5
* [😇 "Em vào công ty được mấy tuần rồi, thấy thế nào?"]
    ran_doc: Dạ vui lắm sếp. Mọi người… thú vị lắm. Nhất là anh Siêu Nhân Hồng.
    _Giọng {ran_doc} hơi lạ ở chữ "nhất là"._
    ~ qh("ran_doc", 5)
+ [👋 "Thôi, em làm việc đi."]
    ran_doc: Dạ sếp!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_truong_phong ===
# npc:truong_phong
_{truong_phong} đứng trước cửa phòng họp "Sáng Tạo", ôm laptop và một xấp slide in màu._
truong_phong: Anh {giam_doc} ơi, anh có 5 phút không ạ? Em muốn sync nhanh về lộ trình phát triển của phòng.
* [⏱️ "Đúng 5 phút. Anh bấm giờ."]
    truong_phong: Vâng ạ! Slide 1 trên 46…
    _Phút thứ 5, bạn đứng dậy. {truong_phong} đang ở slide 3._
    truong_phong: Ơ… vâng, thế mình take note lại, họp tiếp sau nhé anh.
    ~ gd_sua("hop_ngan")
    ~ qh("truong_phong", -3)
* [👑 "{truong_phong} này, cậu muốn ghế Phó Giám đốc lắm à?"]
    truong_phong: Em… em chỉ muốn đóng góp nhiều hơn cho công ty thôi ạ.
    giam_doc: Thế cái teaser tuần trước, ai dựng?
    truong_phong: *(dừng lại hơi lâu)* … Team mình dựng ạ. Team.
    ~ qh("truong_phong", -5)
    ~ qh("editor", 3)
* [🍜 "Trưa nay đi ăn phở với anh. Nói chuyện Hà Nội, không nói chuyện họp."]
    truong_phong: *(ngạc nhiên)* Vâng ạ! Em biết một quán có quẩy, anh ạ.
    ~ qh("truong_phong", 10)
    ~ tien_cong(-120000)
    ~ an(50)
+ [👋 "Thôi, cậu họp tiếp đi."]
    truong_phong: Vâng ạ, em book phòng tới 7 giờ tối rồi.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_thanh_ninh ===
# npc:thanh_ninh
_{thanh_ninh} đứng bật dậy từ bàn trợ lý ngay khi bạn bước ra khỏi phòng kính._
thanh_ninh: Dạ sếp ơi! Hôm nay sếp mặc áo này nhìn chuẩn CEO quá anh ơi!
* [😊 "Thế à. Em đặt hộ anh sân golf chiều nay nhé."]
    thanh_ninh: Dạ em đặt rồi ạ! Em biết sếp kiểu gì cũng muốn đi mà!
    ~ qh("thanh_ninh", 5)
    ~ gd_uy(-2)
* [🔍 "{thanh_ninh}, mật khẩu email của anh em vẫn giữ à?"]
    thanh_ninh: Dạ… dạ em giữ để… để lọc thư rác cho sếp ạ.
    giam_doc: Thư ngân hàng có lọt vào thư rác không em?
    thanh_ninh: *(cười hơi cứng)* Dạ… em không đọc thư ngân hàng đâu sếp ạ.
    ~ gd_no(3)
    ~ qh("thanh_ninh", -5)
* [💬 "Em có đang tìm chỗ làm mới không? Anh hỏi thật."]
    thanh_ninh: Dạ… sao sếp nghĩ vậy ạ? Em… em ở đây là nhờ sếp mà ạ.
    _Cô ấy nhìn xuống cái túi xách. Trên khóa kéo có một sợi chỉ màu xanh lá chuối._
    { biet(ll_moi_thai):
        ~ qh("thanh_ninh", 5)
        thanh_ninh: *(nói rất nhỏ)* … Lương ở đây trễ hoài, sếp ạ.
    }
+ [👋 "Thôi, em làm việc đi."]
    thanh_ninh: Dạ! Sếp đi đứng cẩn thận nha sếp!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_hong_hot ===
# npc:hong_hot
_{hong_hot} đang livestream trước ring light, thấy bạn thì giật mình tắt cái rụp._
hong_hot: Dạ sếp! Em đang… làm content ạ! Sếp có cần gì hông ạ?
* [📈 "Fanpage tuần này lên bao nhiêu rồi?"]
    hong_hot: Dạ {nguoi_theo_doi} người theo dõi rồi sếp! Mà muốn lên nữa thì phải có drama thật, hoặc có tiền chạy quảng cáo.
    ** [💰 "Anh duyệt thêm 20 triệu quảng cáo."]
        ~ gd_tien_cty(-20)
        ~ follow(8000)
        ~ qh("hong_hot", 10)
        hong_hot: Sếp đỉnh! Em chạy liền!
    ** [🙅 "Nội dung hay thì tự lên. Anh không ép, tùy em."]
        ~ gd_tuy_em("hong_hot")
        hong_hot: Dạ… tùy em thì em… đăng thêm meme vậy.
* [🌻 "Em có biết trong công ty có group nào chửi sếp không?"]
    hong_hot: *(đứng hình 2 giây)* … Dạ… group gì ạ sếp? Ối dồi ôi, sếp nghe ai nói vậy?
    ~ gd_nghi_clone = gd_nghi_clone + 10
    ~ qh("hong_hot", -5)
    _Một giờ sau, group anti sếp đổi ảnh đại diện. Mười phút sau lại đổi lại._
* [😂 "Kể anh nghe một tin gì vui đi. Không phải về anh."]
    hong_hot: Nghe gì chưa! {chua_te_deadline} lần đầu nộp việc trước hạn, cả phòng tưởng ảnh bị bệnh!
    ~ qh("hong_hot", 10)
    ~ cang_thang(-5)
+ [👋 "Thôi, em livestream tiếp đi."]
    hong_hot: Dạ! Sếp muốn lên sóng chào khán giả hông sếp? Hông hả? Dạ!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
_{con_ong_chau_cha} đi vào lúc 10 giờ, tay cầm ly cà phê Sống Ảo, tai đeo tai nghe._
con_ong_chau_cha: Ủa chú! Chú tìm con hả? Chill, con mới tới.
* [😠 "Mười giờ. Cháu là phó phòng đấy."]
    con_ong_chau_cha: Dạ… mà con làm từ xa mà chú. Ở quán cà phê có wifi mạnh.
    giam_doc: Làm gì?
    con_ong_chau_cha: … Con làm… mấy thứ.
    ~ qh("con_ong_chau_cha", -5)
    ~ gd_uy(2)
* [🎧 "Cháu đang nghe gì đấy?"]
    con_ong_chau_cha: *(tháo tai nghe, hơi hoảng)* Dạ… nhạc của một người tên Rồng. Hông nổi tiếng đâu chú.
    giam_doc: Cho chú nghe thử.
    _Một giai điệu hồng hồng, vui vui. Lời: "Hồng là thái độ…". Hay. Hay thật._
    ** [💬 "Rồng là ai? Chú muốn mua bài này cho {sieu_nhan_hong}."]
        con_ong_chau_cha: *(im lặng)* … Để con hỏi ảnh. Ảnh ngại lắm.
        ~ qh("con_ong_chau_cha", 10)
    ** [😶 Trả tai nghe, không hỏi gì.]
        _Nó nhìn chú nó rất lâu, như muốn nói gì đó. Rồi thôi._
        ~ qh("con_ong_chau_cha", 5)
* [💰 "Thẻ phụ của cháu, từ tháng này chú khóa. Cháu tự lo nhé."]
    con_ong_chau_cha: Dạ… *(rồi bất ngờ cười)* Ok chú. Con… thấy cũng vui vui.
    ~ qh("con_ong_chau_cha", 5)
    ~ tien_cong(500000)
+ [👋 "Thôi, cháu làm việc đi."]
    con_ong_chau_cha: Để con gọi chú… à chú đây rồi. Dạ con đi!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_chua_te_deadline ===
# npc:chua_te_deadline
_{chua_te_deadline} gác chân lên bàn, đang lướt Tóp-tóp. Trên màn hình máy tính: file kế hoạch Đại Nhạc Hội Siêu Nhân, 0 chữ._
chua_te_deadline: Ủa anh. Chill, còn sớm mà. Kịp hết.
* [⏰ "Còn mấy ngày nữa là Đại Nhạc Hội?"]
    chua_te_deadline: Dạ… nhiều ngày lắm anh. Mà nước tới chân mới nhảy, mà nhảy là phải đẹp.
    giam_doc: Em nhảy đẹp lần nào chưa?
    chua_te_deadline: Lần nào cũng đẹp anh. Chỉ là nhảy hơi trễ.
    ~ qh("chua_te_deadline", 5)
* [💾 "File gốc dự án tháng 6 đâu em?"]
    chua_te_deadline: *(tắt Tóp-tóp)* … Dạ, em… để ở… ÉT O ÉT.
    ~ qh("chua_te_deadline", -5)
    ~ phat_hien(usb_cua_vu)
* [🩷 "{sieu_nhan_hong} tặng em gối ôm hồng à? Cả công ty biết rồi."]
    chua_te_deadline: Trời ơi anh, chiêu PR đó anh. Ảnh làm PR với cả công ty mà.
    giam_doc: Với cả công ty à? Anh chưa nhận được gối nào.
    chua_te_deadline: *(đỏ tai)* … Ok mom.
    ~ qh("chua_te_deadline", 5)
+ [👋 "Làm việc đi em."]
    chua_te_deadline: Dạ, từ ngày mai.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
_{thuc_tap_sinh} đang photo 300 bản kịch bản, mồ hôi đầy trán. Thấy bạn, đứng thẳng như chào cờ._
thuc_tap_sinh: Dạ em chào anh {giam_doc} ạ! Anh cần em làm gì ạ!
* [🏦 "{thuc_tap_sinh}, em có biết gì về ngân hàng không? Anh hỏi chuyện… của một người bạn."]
    thuc_tap_sinh: *(khựng lại rất nhẹ)* Dạ… em có nghe qua một chút ạ. Người bạn của anh nên xin giãn nợ trước hạn 30 ngày, đừng chờ quá hạn ạ. Nhân viên tín dụng sẽ dễ duyệt hơn.
    _Câu trả lời chuẩn như sách. Bạn nhìn {thuc_tap_sinh}. Gương mặt này… hình như đã gặp ở đâu đó, sau một cái bàn có biển tên. Bạn không nhớ ra._
    ~ gd_no(-3)
    ~ qh("thuc_tap_sinh", 5)
* [😊 "Ba mươi tuổi đi thực tập, em không ngại à?"]
    thuc_tap_sinh: Dạ… em ngại chứ ạ. Nhưng em sợ cả đời không được làm thứ mình thích hơn ạ.
    _Bạn nhớ câu mình trả lời Genta năm 2010: "Em sợ, nhưng em sợ nghèo hơn." {thuc_tap_sinh} sợ một thứ khác. Có khi đó là nỗi sợ đúng hơn._
    ~ qh("thuc_tap_sinh", 10)
* [🙅 "Photo thêm 200 bản nữa. Anh không ép, tùy em."]
    ~ gd_tuy_em("thuc_tap_sinh")
    thuc_tap_sinh: Dạ em làm liền ạ!
    _{chi_dai} đi ngang, nhìn bạn. Nhìn rất lâu._
    ~ qh("chi_dai", -5)
+ [👋 "Thôi, em làm tiếp đi."]
    thuc_tap_sinh: Dạ em cảm ơn anh ạ!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_ke_toan ===
# npc:ke_toan
_Phòng kế toán. Mọi thứ đều dán nhãn. {ke_toan} đang soi một tờ hóa đơn bằng kính lúp._
ke_toan: Anh. Anh lên đây là có chuyện tiền. Em nghe.
* [✍️ "Duyệt cho anh 50 triệu chạy chiến dịch."]
    ke_toan: Hóa đơn đâu anh? Kế hoạch đâu anh? Ai ký đề xuất?
    ** [📋 Đưa đủ giấy tờ.]
        ke_toan: Dạ đủ. Em duyệt.
        ~ gd_tien_cty(-50)
        ~ follow(15000)
        ~ qh("ke_toan", 5)
    ** [🙅 "Anh không ép, tùy em."]
        ~ gd_tuy_em("ke_toan")
        ke_toan: Tùy em thì em không duyệt.
* [😮‍💨 "{ke_toan}… em có ngủ được không?"]
    ke_toan: *(bỏ kính lúp xuống)* Từ 1/10 tới giờ em ngủ được tổng cộng chắc bằng một ngày rưỡi anh.
    giam_doc: Anh xin lỗi. Vì trang 47.
    ke_toan: … Anh xin lỗi lần đầu đó anh. Em ghi vô sổ.
    ~ qh("ke_toan", 10)
* {biet(quy_den_thuong)} [🔒 "Anh nghe nói em có một cuốn sổ tay riêng."]
    ke_toan: *(nhìn bạn rất lâu)* Ai nói với anh?
    giam_doc: Anh không hỏi để lấy. Anh hỏi vì anh lo.
    ke_toan: … Đến lúc cần, em sẽ tự nói. Anh để em tự nói.
    ~ qh("ke_toan", 5)
+ [👋 "Thôi, em làm việc đi."]
    ke_toan: Dạ. Anh nhớ nộp hóa đơn tiền xăng tuần trước.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_hr ===
# npc:hr
_{hr} đứng ở cửa phòng HR, cười. Nụ cười của người sắp mời ai đó đi uống trà._
hr: Anh {giam_doc}, anh rảnh không, lên phòng em uống trà xíu.
* [🍵 "Ừ, uống. Trà gì?"]
    hr: Dạ, em có 40 loại xếp theo bảng chữ cái. Hôm nay em pha "Trà Lắng Nghe".
    _Hai người ngồi uống. {hr} không nói gì về danh sách. Lần đầu tiên có người mời bạn uống trà mà không có chuyện gì._
    ~ qh("hr", 10)
    ~ cang_thang(-5)
* [📄 "Danh sách cắt giảm tới đâu rồi?"]
    hr: Dạ… em vẫn đang "nhìn lại hành trình" của từng bạn ạ. Mà anh ơi… em hỏi được không: nếu công ty sập, anh có đi trước không?
    ** [😮‍💨 "Có. Anh đi trước."]
        hr: *(nụ cười tắt, rồi cười lại, lần này thật)* Dạ.
        ~ qh("hr", 15)
    ** [🙅 "Anh là người cuối cùng tắt đèn."]
        hr: Dạ. Em hiểu ạ.
        ~ qh("hr", -5)
* [🙅 "Em đi mời {thanh_xin_nghi} uống trà đi. Anh không ép, tùy em."]
    ~ gd_tuy_em("hr")
    hr: *(cười rộng hơn)* Dạ, em đi liền.
    ~ qh("thanh_xin_nghi", -5)
+ [👋 "Lúc khác nhé."]
    hr: Dạ, cửa phòng em lúc nào cũng mở.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_it ===
# npc:it
_Phòng server. Lạnh, tối, đèn xanh nhấp nháy. {it} đang ăn mì ly, không ngẩng đầu._
it: Restart chưa anh?
* [💻 "Máy anh không lỗi. Anh hỏi chuyện khác."]
    it: *(ngẩng đầu)* … Chuyện gì.
    giam_doc: Log của group Zalo-lô… em có đọc được ai đăng nhập không?
    it: Đọc được. Kể cả mấy tài khoản tên hoa. *(nhìn bạn đúng một giây)* Em không nói ai đâu.
    ~ gd_nghi_clone = gd_nghi_clone + 5
    ~ qh("it", 5)
* [🍜 Đặt lên bàn một ly mì ly mới, vị khác.]
    it: *(nhìn ly mì)* … Vị này hết hàng ở tiện lợi rồi mà.
    giam_doc: Anh đi ba tiệm.
    it: … Cảm ơn anh.
    ~ qh("it", 15)
    ~ tien_cong(-15000)
* [💰 "{dan_dau_tu} nợ em 3 triệu đúng không? Anh trả giúp."]
    it: *(dừng đũa)* Anh biết hả? … Thôi anh. Nợ người nào người đó trả.
    ~ qh("it", 5)
    ~ qh("dan_dau_tu", 3)
+ [👋 "Anh đi đây."]
    it: Đóng cửa giùm em. Lạnh.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_idol_het_thoi ===
# npc:idol_het_thoi
_Phòng chờ studio. {idol_het_thoi} đeo kính đen, ngồi ghế xoay, đang luyện thanh bằng cách hát "a a a" rất to._
idol_het_thoi: Ồ, anh cả! Em biết anh là ai! *(cười, tháo kính)*
* [🎤 "Dạo này đi hát đám cưới có nhiều không?"]
    idol_het_thoi: Dạ… tháng này được 3 đám. Đám nào cũng xin hát "Công Viên". Đám nào cô dâu cũng khóc. Không biết vì cảm động hay vì em hát.
    ~ qh("idol_het_thoi", 5)
* [💸 "Anh nghe nói em đang nợ tiền nhà."]
    idol_het_thoi: *(đeo kính lại)* Ai nói vậy anh? Fan em đông lắm mà.
    giam_doc: Em không cần diễn với anh. Năm 2015 em ngủ ở quán cà phê, anh biết mà.
    idol_het_thoi: *(tháo kính, im lặng)* … 54 triệu anh ạ. Anh đừng nói với {quan_ly_idol}.
    ~ qh("idol_het_thoi", 10)
* [🩷 "Em có ghét {sieu_nhan_hong} không?"]
    idol_het_thoi: Ghét gì anh. Em chỉ sợ. Năm 2015 anh tìm ra em. Năm nay anh tìm ra người khác.
    ** [😇 "Năm nay anh tìm ra người khác. Nhưng anh không bỏ em."]
        idol_het_thoi: … Anh nói thật hả?
        ~ qh("idol_het_thoi", 15)
    ** [😶 Vỗ vai, không nói gì.]
        ~ qh("idol_het_thoi", 3)
+ [👋 "Luyện thanh tiếp đi em."]
    idol_het_thoi: A a a a… Dạ anh!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_quan_ly_idol ===
# npc:quan_ly_idol
_{quan_ly_idol} cầm hai điện thoại, mỗi tai một cái. Mắt thâm. Ly cà phê thứ tư trong ngày._
quan_ly_idol: Khoan, anh nghe máy chút… *(bịt một máy)* Dạ anh {giam_doc}, có gì gấp không anh?
* [☕ "Cậu bỏ máy xuống 5 phút. Uống với tớ ly trà."]
    quan_ly_idol: *(nhìn hai cái điện thoại như nhìn hai đứa con)* … 3 phút được không anh?
    _Ba phút. Không ai nói gì về công việc. {quan_ly_idol} gần như ngủ gật._
    ~ qh("quan_ly_idol", 10)
* [💼 "LL mời cậu đúng không?"]
    quan_ly_idol: *(im lặng)* … Chuyện này để em lo. Anh đừng lo.
    giam_doc: Tớ không lo. Tớ hỏi. Mười hai năm rồi, cậu muốn đi thì nói thẳng với tớ.
    quan_ly_idol: … Em mà đi thì ai lo cho {idol_het_thoi} anh?
    ~ phat_hien(ll_moi_thai)
    ~ qh("quan_ly_idol", 10)
* [🙅 "Tối nay cậu đi lo show đám cưới cho {idol_het_thoi}, rồi về lo livestream. Tớ không ép, tùy cậu."]
    ~ gd_tuy_em("quan_ly_idol")
    quan_ly_idol: Dạ. *(cả hai điện thoại cùng đổ chuông)*
+ [👋 "Thôi cậu nghe máy đi."]
    quan_ly_idol: Dạ… alo, alo!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_bien_kich ===
# npc:bien_kich
_Sân thượng. {bien_kich} ngồi trên ghế nhựa, nhìn mây, tay cầm một cuốn sổ bìa da cũ._
bien_kich: Anh {giam_doc}. Anh có biết một bài phát biểu hay cần gì không? Cần nỗi đau.
* [🎤 "Viết cho anh bài phát biểu Đại Nhạc Hội. Có nỗi đau. Nhưng ngắn."]
    bien_kich: Ngắn thì đau hơn. Em nhận.
    ~ qh("bien_kich", 10)
    ~ gd_sua("ke_chuyen")
* [📖 "Cuốn sổ đấy viết gì thế? Cho anh xem với."]
    bien_kich: *(gấp sổ lại)* Ghi chép thôi anh. Cảm hứng.
    giam_doc: Có anh trong đấy không?
    bien_kich: … Anh là nhân vật phụ. Rất có chiều sâu.
    ~ qh("bien_kich", -3)
* [🎬 "Phim ngắn của em… ý tưởng là của {thuc_tap_sinh} đúng không?"]
    bien_kich: *(khựng lại)* Đây không phải đạo, đây là cảm hứng.
    giam_doc: Thế thì ghi tên người cho cảm hứng vào.
    bien_kich: … Em sẽ nghĩ.
    ~ phat_hien(nguoi_gac_ket)
    ~ qh("bien_kich", -5)
    ~ qh("thuc_tap_sinh", 5)
+ [👋 "Thôi, em tìm cảm hứng tiếp đi."]
    bien_kich: Cảm hứng không tìm được anh ạ. Nó tự tới. Như hóa đơn.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_editor ===
# npc:editor
_Phòng dựng phim. Rèm kéo kín, ba màn hình sáng. {editor} gục mặt trên bàn phím, thanh render chạy 47%._
editor: *(ngáp)* … Đợi render xong anh.
* [🦉 "Kênh Cú Đêm Cắt Ghép là của em à? Anh xem rồi. Hay."]
    editor: *(tỉnh hẳn)* Anh… xem hả? Anh không mua đâu đúng không anh?
    giam_doc: Không mua. Xem thôi.
    editor: … Dạ. *(lần đầu cười)*
    ~ qh("editor", 10)
* [🕐 "Mấy giờ rồi em còn ở đây? Về ngủ đi."]
    editor: Ban đêm em mới tỉnh anh. Ban ngày em là zombie.
    giam_doc: Thế từ mai em làm đêm, ngủ ngày. Anh ký giấy.
    editor: … Thật hả anh? Không ai cho em làm vậy chính thức.
    ~ qh("editor", 15)
* [🎬 "Cái MV này em dựng lại giúp anh, đêm nay xong nhé. Anh không ép, tùy em."]
    ~ gd_tuy_em("editor")
    editor: … Dạ. Render xong là xong.
    ~ follow(5000)
+ [👋 "Thôi, em làm tiếp."]
    editor: *(ngáp)* Dạ.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_designer ===
# npc:designer
_{designer} ngồi trước hai cái laptop. Bạn đi tới, cô ấy gập một cái lại rất nhanh._
designer: Dạ anh. Anh lại muốn sửa gì ạ? Sửa nhẹ thôi là sửa cái gì ạ?
* [🎨 "Anh không sửa gì. Anh chỉ xem. Đẹp."]
    designer: *(nhìn bạn như nhìn người ngoài hành tinh)* … Anh nói lại được không ạ? Em muốn ghi âm làm bằng chứng.
    ~ qh("designer", 15)
* [💻 "Laptop kia em đang làm gì đấy?"]
    designer: Dạ… việc riêng ạ. Vẽ… vẽ cho vui.
    _Trên mép màn hình vừa gập, bạn kịp thấy một vệt màu xanh lá chuối._
    ~ qh("designer", -5)
    ~ phat_hien(quynh_lam_cho_ll)
* [🩷 "Poster này chưa đủ wow. Hồng hơn nữa."]
    designer: Hết cứu.
    ~ qh("designer", -10)
    ~ follow(2000)
+ [👋 "Thôi, em làm tiếp."]
    designer: Dạ. *(mở lại laptop thứ hai khi bạn quay lưng)*
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_sales ===
# npc:sales
_{sales} đang gọi điện, giọng ngọt như mía: "Dạ chị quen hết mà anh, deal này chắc kèo!". Thấy bạn, cúp máy._
sales: Anh {giam_doc}! Tối nay đi nhậu với đối tác hông anh? Em quen hết mà!
* [🍻 "Đi. Quán Ốc Đêm, 7 giờ."]
    sales: Tin em đi anh, tối nay chốt!
    -> giam_doc_mg_quan_oc_mo_dau
* [🧾 "BTT Global… Mr. Kevin Trộn có thật không em?"]
    sales: *(cười lớn)* Anh hỏi gì kỳ vậy anh! No cap!
    giam_doc: Em 26 tuổi. Anh 37. Anh nói dối nhiều năm hơn em đấy.
    sales: *(cười tắt)* … Anh đừng nói với chị… à em {ke_toan}.
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", -5)
* [😊 "Em là người nhỏ nhất công ty. Có mệt không?"]
    sales: Mệt gì anh. Em là chị cả mà. *(rồi giọng nhỏ lại)* … Mệt chút chút anh.
    ~ qh("sales", 10)
+ [👋 "Thôi, em gọi tiếp đi."]
    sales: Dạ! Alo anh ơi, em nè!
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_chi_dai ===
# npc:chi_dai
_Kho sự kiện. {chi_dai} đang vác hai thùng loa cùng lúc. Bạn bất giác đứng thẳng lưng._
chi_dai: Anh. Ăn cơm chưa?
* [😅 "Anh… ăn rồi."]
    chi_dai: Nói dối. Mặt anh xanh như tàu lá. Ngồi xuống, em có hộp cơm dư.
    ~ an(50)
    ~ qh("chi_dai", 10)
    _Cơm sườn. Ngon. Bạn ăn hết, không dám chừa hạt nào._
* [🤝 "Để anh vác giúp một thùng."]
    _Bạn nhấc thùng loa. Không nhấc nổi. {chi_dai} nhấc lại, tay một._
    chi_dai: Anh lo cái khác. Cái nặng để em.
    ~ qh("chi_dai", 5)
    ~ nghi(-5)
* {gd_noi_that_huong} [🔒 "{chi_dai}… cảm ơn em hôm thang máy."]
    chi_dai: Cảm ơn gì. Anh nói thật thì em gánh. Anh nói dối thì em đập. Đơn giản vậy thôi.
    ~ qh("chi_dai", 10)
    ~ cang_thang(-10)
+ [👋 "Thôi, em làm tiếp."]
    chi_dai: Dạ. Anh nhớ ăn trưa.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_dan_dau_tu ===
# npc:dan_dau_tu
_{dan_dau_tu} ngồi ở bàn số liệu, ba màn hình toàn biểu đồ xanh đỏ. Không cái nào là lượt xem của {sieu_nhan_hong}._
dan_dau_tu: Anh! Đáy rồi anh. Đáy thật rồi. Vào là ăn.
* [📊 "Ông mở giúp tôi bảng số liệu fanpage. Cái đấy mới là việc của ông."]
    dan_dau_tu: *(thở dài, mở tab khác)* … Clip thật có tỷ lệ chia sẻ gấp 12 lần clip dựng. Anh muốn lên thì cho {sieu_nhan_hong} đi giúp người nhiều hơn, quay lại thật.
    ~ follow(5000)
    ~ qh("dan_dau_tu", 5)
* [💸 "Ông nợ Bác {bac_bao_ve} 2 triệu. Trả bác đi."]
    dan_dau_tu: Anh… sao anh biết?
    giam_doc: Bác không nói. Tôi thấy ông đi cửa sau.
    dan_dau_tu: … Cuối tháng em trả. Lần này là trả thật.
    ~ qh("dan_dau_tu", -3)
    ~ qh("bac_bao_ve", 5)
* [😮‍💨 "Tôi cũng đang nợ. Nhiều hơn ông."]
    dan_dau_tu: *(quay ghế lại, nhìn bạn)* … Bao nhiêu anh?
    giam_doc: Một cái biệt thự.
    dan_dau_tu: Còn cái nịt hả anh? … Em mời anh ly trà đá.
    ~ qh("dan_dau_tu", 10)
    ~ gd_no(2)
+ [👋 "Làm việc đi."]
    dan_dau_tu: Dạ. Lần này là làm thật.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
_Lạ lùng: {thanh_xin_nghi} đang có mặt ở bàn điều phối. Giọng hơi khàn, như vừa hát cả đêm._
thanh_xin_nghi: Dạ… em chào anh. Em hơi sốt… nhưng em vẫn đi làm ạ.
* [🤒 "Sốt thì về nghỉ đi."]
    thanh_xin_nghi: *(mắt sáng lên)* Dạ thật hả anh! Dạ em cảm ơn anh, bà ngoại em cũng…
    giam_doc: Bà ngoại em làm sao?
    thanh_xin_nghi: … Dạ bà khỏe ạ. Lần này bà khỏe.
    ~ qh("thanh_xin_nghi", 10)
    ~ qh("hr", -3)
* [🎤 "Giọng khàn thế này… em hát karaoke à?"]
    thanh_xin_nghi: Dạ… dạ không ạ. Em… em ho.
    _Trong túi áo {thanh_xin_nghi}, một tấm thẻ "Thí sinh - Giọng Ca Ước Mơ" lòi ra một góc._
    ~ phat_hien(son_thi_hat)
    ** [😶 Giả vờ không thấy.]
        ~ qh("thanh_xin_nghi", 10)
    ** [💬 "Thi đi. Đừng nói với {hr}."]
        thanh_xin_nghi: *(đứng hình, rồi cười rất to)* Anh… anh là sếp tốt nhất em từng xin nghỉ!
        ~ qh("thanh_xin_nghi", 20)
* [📋 "Lịch trình Đại Nhạc Hội em xếp xong chưa?"]
    thanh_xin_nghi: Dạ xong 80% rồi ạ. 20% còn lại em… em xin nghỉ 31/10 được không anh?
    ~ qh("thanh_xin_nghi", -3)
+ [👋 "Thôi, em làm tiếp."]
    thanh_xin_nghi: Dạ… *(ho rất giả)*
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_bac_bao_ve ===
# npc:bac_bao_ve
_Chòi bảo vệ. Ấm trà, cái radio, cái ghế bố. Bác {bac_bao_ve} đang nghe tin thời tiết. {cho} nằm dưới chân._
bac_bao_ve: Cậu {giam_doc}. Ngồi.
~ gd_tra_binh = gd_tra_binh + 1
* [☕ Ngồi uống trà, không nói gì.]
    _Mười phút. Radio báo mai mưa. Bác rót thêm trà hai lần._
    ~ cang_thang(-10)
    ~ uong(20)
    ~ qh("bac_bao_ve", 5)
* [💬 "Bác ơi, hồi 2010… anh Genta tuyển cháu vì sao ạ?"]
    bac_bao_ve: Vì cậu nói thật. "Em sợ nghèo." Người ta thích người nói thật.
    giam_doc: Giờ cháu… không nói thật được nữa bác ạ.
    bac_bao_ve: Thế thì tập lại. Ba mươi bảy tuổi vẫn tập được.
    ~ qh("bac_bao_ve", 10)
* [🍌 "Bác có cần gì không ạ? Cháu mua."]
    bac_bao_ve: Bác chẳng cần gì. Thằng {cho} cần xúc xích.
    { co(xuc_xich):
        ~ mat(xuc_xich)
        ~ qh("cho", 15)
        cho: Gâu! *(vẫy đuôi như cánh quạt)*
    - else:
        ~ tien_cong(-15000)
        ~ qh("cho", 10)
        _Bạn chạy ra tiện lợi mua một cây. {cho} nhai, nhìn bạn đầy biết ơn._
    }
+ [👋 "Cháu lên làm việc đây ạ."]
    bac_bao_ve: Ừ. Đi cẩn thận.
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
_Phòng chờ. {sieu_nhan_hong} đang tạo dáng trước gương, một tay cầm bánh chuối chiên._
sieu_nhan_hong: Sếp! Vì công lý và lượt view! *(tạo dáng)* Sếp ăn bánh hông?
* [🍌 Nhận một miếng bánh chuối chiên.]
    ~ an(15)
    ~ qh("sieu_nhan_hong", 10)
    sieu_nhan_hong: Ngon hông sếp? Hôm ký hợp đồng em cũng ăn y vầy nè, dính tùm lum giấy luôn!
* [📈 "Em có muốn nổi tiếng thật không? Hay chỉ muốn giúp người?"]
    sieu_nhan_hong: *(đứng im, không tạo dáng)* … Nổi tiếng thì giúp được nhiều người hơn. Mà… cũng có người nhớ tên mình.
    giam_doc: Tên thật của em là gì?
    sieu_nhan_hong: *(nói rất nhỏ)* … {sieu_nhan_hong}. Mà sếp đừng gọi trước mặt ai nha.
    ~ qh("sieu_nhan_hong", 15)
* [🎭 "Tháo mũ một lần thôi, anh hứa viral."]
    sieu_nhan_hong: *(lùi lại)* Điều khoản số 1 mà sếp…
    ~ qh("sieu_nhan_hong", -15)
    ~ gd_uy(-3)
+ [👋 "Thôi, em tập tiếp đi."]
    sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ! *(tạo dáng tiễn sếp)*
- -> END

// ------------------------------------------------------------
=== giam_doc_tudo_cho ===
# npc:cho
_{cho} nằm phơi bụng trước chòi bảo vệ. Thấy bạn, mở một mắt._
cho: Gâu.
* [🌭 Đưa xúc xích.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
    - else:
        ~ tien_cong(-15000)
    }
    ~ qh("cho", 15)
    cho: Gâu gâu! *(vẫy đuôi, đứng lên, ngồi xuống, đứng lên)*
* [🐾 Xoa đầu.]
    ~ qh("cho", 5)
    cho: Gâu. *(nhắm mắt lại, hơi hé miệng cười kiểu chó)*
* [👔 "{cho}, mày có biết sếp là ai không?"]
    cho: … *(ngáp, quay mông lại)*
    _Thông điệp rõ ràng._
    ~ gd_uy(-1)
+ [👋 Đi lên làm việc.]
    cho: Gâu. *(nhắm mắt lại)*
- -> END
