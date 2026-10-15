// ============================================================
// SALES · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// Game mở các cảnh này khi người chơi bắt chuyện với NPC.
// ============================================================

// ------------------------------------------------------------
=== sales_tudo_npc_ran_doc ===
# npc:ran_doc
ran_doc: Chị {sales}! Nói nhỏ thôi nha… BTT Global là tập đoàn bên nào vậy chị? Em muốn viết bài tin nội bộ.
* [🗣️ "Tập đoàn đa quốc gia. Trụ sở Singapore. Chủ tịch Kevin Trộn. Em viết đi, đẹp lắm."]
    ran_doc: *(ghi chép, cười ngọt)* Dạ hay quá. Em tra mã số thuế để ghi cho đầy đủ nha chị.
    _Bạn cảm thấy có một con rắn nhỏ trườn qua sống lưng._
    ~ sl_phet(5)
* [😇 "Em đừng viết. Chuyện chưa chắc thì đừng in thành chữ."]
    ran_doc: *(khựng lại)* Dạ… chị nói chuyện lạ ghê. Em tưởng chị thích được lên bản tin.
    sales: Thích. Nhưng lên vì cái thật thì vui hơn.
    ~ qh("ran_doc", 3)
    ~ sl_that_long()
* [💬 "Em hỏi nhiều quá ha. Em muốn bán gì cho chị?"]
    ran_doc: *(cười)* Em chỉ nói sự thật thôi mà chị. À không, em chỉ hỏi thôi.
    _Dân sales nhận ra dân sales. Bạn biết thằng nhỏ này đang bán một thứ gì đó. Chưa biết là gì._
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_giam_doc ===
# npc:giam_doc
giam_doc: {sales}! Tối nay đi Quán Ốc Đêm với anh không? Gặp đối tác. Anh không ép, tùy em.
* [🍻 "Dạ đi sếp! Tin chị đi, tối nay chốt deal!"]
    giam_doc: Ha ha, anh thích tinh thần này! Mà em… gọi anh là "chị" à?
    sales: Dạ, quen miệng sếp.
    ~ qh("giam_doc", 5)
    ~ an(30)
    ~ nghi(-15)
* [💬 "Sếp ơi, đối tác nào vậy sếp? Em chuẩn bị hồ sơ thật."]
    giam_doc: Hồ sơ… thật à? *(gãi đầu)* Thật ra là anh với mấy ông bạn đánh golf. Ăn ốc thôi.
    ~ qh("giam_doc", 3)
* {sl_tu_nhan_btt_gia} [🔒 "Sếp ơi, em nói thật rồi đó. Còn sếp, sếp định nói thật với anh Genta khi nào?"]
    giam_doc: *(im lặng rất lâu, nhìn ra cửa sổ)* …Khi nào anh đủ can đảm như em.
    ~ qh("giam_doc", 10)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_truong_phong ===
# npc:truong_phong
truong_phong: {sales}, mình sync nhanh 5 phút nhé. Phòng Sản xuất cần biết nhà tài trợ muốn xuất hiện ở đâu trong MV.
* [🗣️ "Anh cho logo BTT xuất hiện 15 giây ở điệp khúc nha anh."]
    truong_phong: 15 giây à? Thế mình họp để chốt vị trí. Chiều thứ 3, 2 tiếng nhé.
    ~ sl_phet(3)
    ~ nghi(-10)
* [🤝 "Dạ, Quán Ốc Đêm muốn ảnh ăn ốc 5 giây. Vậy thôi anh."]
    truong_phong: 5 giây ăn ốc… *(ghi chép)* Rõ ràng. Cụ thể. Anh thích. Không cần họp.
    _{truong_phong} vừa nói "không cần họp". Bạn chụp màn hình lại trong đầu._
    ~ qh("truong_phong", 8)
* [📞 Điện Thoại Giả: "Dạ em xin phép, đối tác gọi!"]
    truong_phong: Ừ, thế mình take note, họp sau.
    ~ sl_phet(2)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: {sales} nè. Chị nói em nghe nè: muốn sếp thương thì phải khen đúng lúc. Như chị nè.
_{thanh_ninh} lớn hơn bạn 2 tuổi. Và là người duy nhất trong công ty dám "chị nói em nghe" với bạn._
* [💁 "Tin chị đi, em khen sếp giỏi hơn chị."]
    thanh_ninh: *(nheo mắt)* Ủa, em xưng "chị" với chị hả? Hai đứa mình là đối thủ rồi đó.
    ~ qh("thanh_ninh", -5)
* [💬 "Chị dạy em đi. Em đang cần sếp thương."]
    thanh_ninh: Bí quyết là: sếp hắt hơi, khen "hắt hơi có tâm". Sếp im lặng, khen "im lặng có chiều sâu".
    sales: Còn sếp nói phét?
    thanh_ninh: *(cười)* Khen "tầm nhìn". Em biết rõ mà.
    ~ qh("thanh_ninh", 5)
* [😇 "Chị {thanh_ninh}, chị khen sếp nhiều vậy, có ai khen chị chưa?"]
    thanh_ninh: *(nụ cười khựng lại)* …Ngày 8/3 thì có. Mấy ngày khác thì… không.
    _Lần đầu tiên bạn thấy {thanh_ninh} không biết nói gì._
    ~ qh("thanh_ninh", 10)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_hong_hot ===
# npc:hong_hot
hong_hot: {sales} ơi! Nghe gì chưa? Ét o ét! Bà có nhà tài trợ mới chưa? Kể đi kể đi!
* [🗣️ "Có! Tập đoàn sữa đậu nành Nhật Bản!"]
    hong_hot: Ối dồi ôi! Đăng liền!
    ~ sl_phet(8)
    _Bạn vừa nói xong thì nhận ra: trên đời này không có tập đoàn sữa đậu nành Nhật Bản nào đang gọi bạn cả._
    { sl_bong_bong >= 100:
        -> sales_tudo_bong_bong_be
    }
* [🤝 "Chưa có gì mới. Thiệt."]
    hong_hot: Ủa? {sales} mà nói "chưa có gì"? *(sờ trán bạn)* Bà bệnh hả?
    ~ sl_that_long()
* [💬 "Bà kể trước đi. Bà nghe gì?"]
    hong_hot: Anh {sieu_nhan_hong} tặng anh {chua_te_deadline} cái gối ôm hồng thứ 6! Mà nghe nói có người thấy anh {chua_te_deadline} ôm nó ngủ!
    ~ qh("hong_hot", 5)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Ê {sales}. Chill không? Đi Sống Ảo cà phê với anh không? Anh bao. À… để anh xem thẻ còn quẹt được không.
* [💁 "Tin chị đi, anh nên tài trợ Đêm Hồng."]
    con_ong_chau_cha: Bằng gì em? Tiền của chú anh hả? *(cười)* Thôi, anh không muốn xài tiền của chú nữa.
    ~ qh("con_ong_chau_cha", 3)
* [😇 "Để em bao. Hôm nay em có hoa hồng."]
    con_ong_chau_cha: Em bao anh? *(ngạc nhiên thật sự)* Chưa ai bao anh bao giờ.
    ~ tien_cong(-90000)
    ~ qh("con_ong_chau_cha", 10)
* {qh_con_ong_chau_cha >= 15} [🔒 "Anh {con_ong_chau_cha}. Mấy bài hát của anh đó. Cho em nghe một bài đi."]
    con_ong_chau_cha: *(đưa một bên tai nghe, do dự)* Nghe thôi nha. Đừng kể ai.
    _Một giai điệu nhẹ, lời có câu "Hồng là thái độ". Bạn nghe hết, rồi nghe lại._
    ~ phat_hien(bai_hat_long)
    sales: Cái này mà bán, em bán được giá thật. Không cần phét.
    con_ong_chau_cha: *(nhìn bạn rất lâu)* …Em nói thật hả?
    ~ qh("con_ong_chau_cha", 10)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: {sales}. Nhà tài trợ của bà muốn xuất hiện trong clip nào? Nói sớm đi. *(lướt Tóp-tóp)* Mà thôi, còn sớm mà. Chill.
* [💁 "Tin chị đi, ông làm sớm thì ông thành huyền thoại."]
    chua_te_deadline: Tui làm trễ cũng là huyền thoại rồi. *(vẫn lướt)*
* [🧂 "Anh {sieu_nhan_hong} hỏi ông có rảnh tối nay hông."]
    chua_te_deadline: *(đánh rơi điện thoại)* …Hỏi chi?
    sales: Ủa, ông quan tâm hả?
    chua_te_deadline: Không. Hỏi vậy thôi. *(nhặt điện thoại, tai đỏ)*
    ~ qh("chua_te_deadline", 3)
* [🤝 "Ông cho tui danh sách clip tuần tới, tui chào hàng trước."]
    chua_te_deadline: *(lần đầu ngẩng lên)* Bà… làm việc có kế hoạch hả? Ok, tui gửi. Ét o ét, tui cũng phải có kế hoạch rồi.
    ~ qh("chua_te_deadline", 8)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ chị {sales} ơi! Chị dạy em nói chuyện tự tin đi ạ!
* [💁 "Tin chị đi, nhìn thẳng mắt người ta, nói chậm, cười trước khi nói giá."]
    thuc_tap_sinh: Dạ! *(nhìn thẳng mắt bạn, nói chậm)* Dạ chị… em… tự tin ạ.
    _Anh ấy nhìn thẳng mắt bạn, nói chậm, và bạn bỗng có cảm giác mình đang bị duyệt hồ sơ vay._
    ~ qh("thuc_tap_sinh", 5)
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
* [😇 "Anh {thuc_tap_sinh} ơi, anh lớn hơn em, đừng 'dạ chị' nữa."]
    thuc_tap_sinh: Dạ… dạ em quen rồi ạ. Thực tập thì phải đúng phép ạ.
    ~ qh("thuc_tap_sinh", 5)
* {biet(duy_tung_lam_ngan_hang)} [🔒 "Anh ơi. Một hợp đồng tài trợ tốt thì phải có gì?"]
    thuc_tap_sinh: *(giọng đổi hẳn, thẳng lưng)* Ba thứ: điều khoản thanh toán rõ ràng, điều kiện chấm dứt, và không có chữ "tùy tình hình".
    thuc_tap_sinh: *(chợt nhớ ra, cúi đầu)* Dạ… em đọc trên mạng ạ.
    ~ qh("thuc_tap_sinh", 10)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_ke_toan ===
# npc:ke_toan
ke_toan: {sales}. Lại tạm ứng hả em?
~ sl_hoi_hoa_don = sl_hoi_hoa_don + 1
* [🧾 "Dạ… em xin 1 triệu đi tiếp khách."]
    -> sales_mg_tam_ung_mo_dau
* [🧾 Đưa ra xấp hóa đơn quán ốc, trong đó có tờ ghi "10 dĩa ốc, đã trả bằng quảng cáo".]
    { sl_quan_oc_deal:
        ke_toan: *(nhìn rất lâu)* Cái này chị không hạch toán được. Nhưng ít ra là thật.
        ~ sl_ung(500000)
        ~ qh("ke_toan", 5)
    - else:
        ke_toan: Hóa đơn quán ốc… mà toàn ghi "tiếp khách". Khách nào em?
        ~ qh("ke_toan", -3)
    }
* [🤝 "Dạ… thật ra em hết tiền ăn. Lương trễ, em hông dám nói."]
    ~ sl_that_long()
    ke_toan: *(im lặng, rút trong túi riêng 300 nghìn)* Cái này không phải tạm ứng. Đừng kể ai.
    ~ tien_cong(300000)
    ~ qh("ke_toan", 20)
* [💁 "Tin chị đi, khách này là chắc kèo!"]
    ke_toan: Chị nào? Em mấy tuổi?
    _{ke_toan} mở ngăn kéo, đặt lên bàn một gói bánh quy. "Ăn đi rồi đi làm."_
    ~ an(10)
    ~ qh("ke_toan", -5)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_hr ===
# npc:hr
hr: {sales} ơi. Em rảnh không, lên phòng anh uống trà xíu.
* [💁 "Dạ anh {hr}, tin chị đi, em đang chạy deal, uống trà sau nha."]
    hr: *(cười rộng hơn)* Deal gì em? Anh chỉ muốn lắng nghe em thôi.
    _{hr} rót sẵn hai ly trà. Ly của bạn đã nguội. Ông ấy đã đợi lâu rồi._
    ~ cang_thang(10)
* [😇 "Dạ em lên."]
    hr: *(rót trà)* Tháng này em đi trễ 4 lần. Nhưng anh thấy em làm tới 10 giờ đêm 3 lần. Mình cùng nhìn lại hành trình nha.
    _Không có gì xảy ra. Chỉ là trà. Lần này._
    ~ qh("hr", 8)
* [🗂️ "Anh ơi, team building năm sau em xin tài trợ cho, đỡ ngân sách."]
    hr: *(mắt sáng)* Thật không em? Năm nay chị {ke_toan} cắt anh từ 120 còn 60.
    sales: Thật. Lần này thật.
    ~ qh("hr", 10)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_it ===
# npc:it
it: Gì?
* [💁 "Anh {it}, tin chị đi, anh nên chuyển wifi công ty sang gói xịn, em có đối tác."]
    it: Đối tác nào? Mã số thuế?
    sales: …
    it: Restart đi.
    ~ sl_phet(2)
* [🍜 Đưa {it} một ly mì ly.]
    { co(mi_ly):
        ~ mat(mi_ly)
        it: *(nhận, gật)* …Cảm ơn.
        ~ qh("it", 10)
    - else:
        _Bạn không có mì ly. {it} nhìn tay bạn, rồi đóng cửa phòng server._
    }
* [💬 "Anh {it}, anh {dan_dau_tu} nợ anh bao nhiêu?"]
    it: 3 triệu. Cô 5 triệu. *(nhìn bạn)* Hội chủ nợ.
    sales: Mình lập group đi anh.
    it: Có rồi. 7 người. Cô chưa được mời vì cô hay đăng story.
    ~ qh("it", 5)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: Em sales! Em biết anh là ai không? Show đám cưới tuần sau, em chào giá giúp anh được không? Đừng dưới 5 triệu.
* [💁 "Tin chị đi, em chào 8 triệu, có fan đi kèm."]
    idol_het_thoi: Fan… đi kèm? *(nhìn quanh)* Em nói nhỏ thôi.
    ~ qh("idol_het_thoi", 3)
* [🤝 "Dạ em chào 4 triệu, kèm một bài 'Công Viên' miễn phí cho cô dâu. Thật, dễ bán hơn."]
    idol_het_thoi: 4 triệu? Hồi anh còn nổi… *(dừng lại)* …Thôi được. Bán được là tốt.
    _Show được chốt trong 20 phút. Cô dâu khóc khi nghe "Công Viên". {idol_het_thoi} gửi bạn hoa hồng 400 nghìn._
    ~ tien_cong(400000)
    ~ sl_that(1)
    ~ qh("idol_het_thoi", 10)
* [🎤 "Anh còn muốn hát trên sân khấu lớn hông?"]
    idol_het_thoi: *(gỡ kính đen)* Em hỏi thật hả? …Muốn. Ngày nào cũng muốn.
    ~ sl_goi_y_phat = true
    ~ qh("idol_het_thoi", 8)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút. *(điện thoại 1)* Ừ ừ. *(điện thoại 2)* Đừng đăng gì hết! *(quay lại)* {sales}, có chuyện gì?
* [💁 "Anh {quan_ly_idol}, tin chị đi, em có nhà tài trợ cho anh {idol_het_thoi}."]
    quan_ly_idol: *(nhìn bạn)* Nhà tài trợ thật hay nhà tài trợ… của em?
    ~ sl_phet(2)
* [🤝 "Anh cần ai bán show đám cưới cho anh {idol_het_thoi}, em làm giùm. Không lấy phí."]
    quan_ly_idol: *(đặt cả hai điện thoại xuống)* Thật à? *(im lặng)* Cảm ơn em. Đừng nói với {idol_het_thoi} là anh nhờ.
    ~ qh("quan_ly_idol", 10)
* [💬 "Anh có mệt hông anh? Hai điện thoại, hai nghệ sĩ."]
    quan_ly_idol: Mệt. Mà quen rồi. *(cười)* Quản lý thì phải lo. Việc của anh mà.
    _Màn hình khóa điện thoại của ông sáng lên một giây: ảnh {idol_het_thoi} cười, năm 2015._
    ~ qh("quan_ly_idol", 3)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_bien_kich ===
# npc:bien_kich
bien_kich: {sales}. Tui đang viết một nhân vật: cô gái nói phét để sống. Cho tui phỏng vấn bà 5 phút.
* [🗣️ "Được. Tui kể bà nghe chuyện tui ký 10 tỷ với tập đoàn Ả Rập."]
    bien_kich: *(ghi chép say mê)* Tuyệt. Có nỗi đau không?
    sales: Có. Nỗi đau là không có thật.
    bien_kich: *(dừng bút)* …Câu này tui mượn nha.
    ~ qh("bien_kich", 5)
* [😇 "Nhân vật đó có kết có hậu hông bà?"]
    bien_kich: Tùy. Nếu cô ấy nói thật một lần thì… có thể.
    _Bạn nhìn {bien_kich}. {bien_kich} nhìn bạn. Hai người đều biết đó không còn là chuyện tiểu thuyết._
    ~ qh("bien_kich", 8)
* [🧂 "Bà mượn ý tưởng của ai thì nhớ trả nha. Kiểu {dan_dau_tu} trả nợ."]
    bien_kich: *(mặt đanh lại)* Đây không phải đạo. Đây là cảm hứng.
    ~ qh("bien_kich", -5)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_editor ===
# npc:editor
editor: *(ngáp)* …Clip nhà tài trợ… em cần mấy giây?
* [💁 "Tin chị đi anh {editor}, 30 giây là đủ viral!"]
    editor: …30 giây là 4 tiếng dựng. Ngáp.
    ~ qh("editor", -2)
* [🤝 "5 giây thôi anh. Quán ốc. Em mua cà phê đen không đường cho anh."]
    editor: *(nhận ly)* …Em biết anh uống gì hả. Ok. 5 giây. Render xong là xong.
    ~ qh("editor", 8)
    ~ tien_cong(-25000)
* [💬 "Anh {editor}, sao clip nào anh dựng cũng có con cú vậy?"]
    editor: *(mắt mở to lần đầu trong ngày)* …Em thấy hả?
    sales: Dân sales nhìn chi tiết để tìm điểm bán.
    editor: *(cười nhẹ)* Đừng kể ai.
    ~ qh("editor", 5)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_designer ===
# npc:designer
designer: {sales}. Lại cần hồ sơ hả em? Nói trước: chị không vẽ trụ sở 40 tầng nữa đâu.
* [🗂️ "Chị ơi, slide báo cáo thứ 6. Trục tung bắt đầu từ… con số em muốn."]
    designer: Trục tung không bắt đầu từ 0 là lừa đảo đồ họa đó em.
    sales: Là "nghệ thuật trình bày" chị ơi.
    designer: *(thở dài, mở laptop)* Lần cuối.
    ~ qh("designer", 3)
    ~ sl_giay(20)
* [🤝 "Trưa nay em bao chị cơm tấm. Tiền thật, hoa hồng thật."]
    designer: Hoa hồng thật? *(nhìn bạn)* Chị tự hào về em đó.
    ~ an(40)
    ~ tien_cong(-70000)
    ~ qh("designer", 10)
* [😇 "Chị {designer}. Nếu một ngày mình nghỉ, mở studio chung, chị chịu hông?"]
    designer: *(im lặng)* Chị vẽ, em bán?
    sales: Em bán thật. Không phét.
    designer: Thì chị chịu. Nhưng biển hiệu chị làm, khách không được sửa.
    ~ qh("designer", 12)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_chi_dai ===
# npc:chi_dai
chi_dai: {sales}. Ăn cơm chưa? Mặt em trắng hơn phấn em đánh nữa.
* [💁 "Dạ em ăn rồi chị, tiệc với đối tác."]
    chi_dai: *(nhìn bạn)* Đối tác nào mà em run tay vậy? Ngồi xuống. *(mở hộp cơm)* Ăn.
    ~ an(40)
    ~ qh("chi_dai", 5)
* [😇 "Dạ chưa chị. Tủ lạnh em trống."]
    ~ sl_that_long()
    chi_dai: Tối nay về nhà chị. Phố Cũ, số 45. Chị nấu canh chua. Đứa nào làm em đói, chỉ mặt chị.
    ~ an(30)
    ~ qh("chi_dai", 12)
* [💬 "Chị {chi_dai}, sao chị không sợ ai hết vậy?"]
    chi_dai: Tại chị không nợ ai lời nói dối nào. Không nợ thì không sợ.
    _Câu đó trúng thẳng vào giữa ngực bạn._
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {sales}! Anh biết em định nói gì. Nhưng nghe anh nè: đáy rồi, đáy thật rồi. Tuần sau anh trả em gấp đôi.
* [📈 "Anh {dan_dau_tu}, tháng 6 anh cũng nói đáy. Tháng này là đáy của đáy hả?"]
    dan_dau_tu: Đáy có nhiều tầng em ạ. *(chuyển 200 nghìn)* Cho có.
    ~ sl_chuong_tra(200000)
* [💁 "Tin chị đi, anh trả em hôm nay thì mai anh giàu, vì vũ trụ thưởng người sòng phẳng."]
    { RANDOM(1, 10) <= 5:
        dan_dau_tu: *(mắt sáng)* Vũ trụ… thưởng… *(chuyển 1 triệu)*
        ~ sl_chuong_tra(1000000)
        ~ sl_phet(5)
    - else:
        dan_dau_tu: Vũ trụ đang trong giai đoạn điều chỉnh em ạ.
    }
* [🗂️ "Thôi, anh trả nợ bằng việc khác. Thứ 6 này anh đừng soi báo cáo của em."]
    ~ sl_chuong_lam_ngo = true
    dan_dau_tu: Deal. Anh mù một bên mắt tới hết tháng.
* {ngay > 21 && sl_kevin_dien_vien == ""} [🔒 "Hay anh đóng vai chủ tịch Kevin Trộn một buổi, em xóa nợ 1 triệu."]
    ~ sl_kevin_dien_vien = "dan_dau_tu"
    ~ sl_no_chuong = sl_no_chuong - 1000000
    dan_dau_tu: Deal! Anh sinh ra để làm chủ tịch. Chỉ là thị trường chưa nhận ra.
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho khụ khụ)* {sales}… tui hơi sốt… bà nói với anh {hr} giùm tui là tui nghỉ nha.
* [💁 "Tin chị đi, ông nói 'bà ngoại' lần thứ 8 là anh {hr} gửi hoa viếng luôn đó."]
    thanh_xin_nghi: *(hết ho)* …Bà nói có lý. Lần này tui nói "dì út".
* [🤝 "Ông đi thi hát phải hông? Tui thấy ông trên Đài Tivi Hóng."]
    thanh_xin_nghi: *(tái mặt)* Bà… đừng nói ai nha. Tui vô bán kết rồi.
    ~ phat_hien(son_thi_hat)
    sales: Ông hát hay thì tui bán vé cho ông. Thật.
    thanh_xin_nghi: *(mắt sáng rỡ)* Thiệt hả?
    ~ qh("thanh_xin_nghi", 12)
* [😶 "Ông tự nói đi."]
    thanh_xin_nghi: *(ho to hơn)* Bà ác quá…
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Cháu {sales}. Về muộn thế. Ngồi uống cốc trà đá đã.
* [💁 "Bác ơi, tin con đi, mai mốt con giàu con mua bác cái chòi mới."]
    bac_bao_ve: *(cười)* Chòi này được rồi. Cháu giàu thì trả bác tiền ông {dan_dau_tu} nợ hộ là được.
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    ~ qh("bac_bao_ve", 3)
* [😇 Ngồi xuống ghế bố: "Dạ con cảm ơn bác."]
    bac_bao_ve: Ừ. *(rót trà)* Dạo này cháu cười nhiều mà mắt không cười.
    sales: Dạ… bác thấy hả bác?
    bac_bao_ve: Bác không thấy gì đâu. *(đẩy cốc trà sang)* Uống đi.
    ~ uong(30)
    ~ qh("bac_bao_ve", 8)
* [💬 "Bác ơi, bác ở đây lâu nhất, bác có tin con không?"]
    bac_bao_ve: Bác tin việc người ta làm. Lời người ta nói thì… bác nghe thôi.
    _Bác nói chậm, nhưng câu đó đi rất nhanh vào lòng bạn._
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: Chị {sales}! Biến hình! *(tạo dáng)* Hôm nay em ăn thử món của nhà tài trợ nào hả chị?
_{sieu_nhan_hong} 31 tuổi, gọi bạn là "chị". Bạn thích chuyện đó hơn bạn dám nhận._
* [💁 "Tin chị đi, hôm nay anh ăn ốc len xào dừa, ngon nhất quận!"]
    sieu_nhan_hong: Gét gô! Vì công lý và… ốc len!
    ~ qh("sieu_nhan_hong", 5)
    ~ follow(2000)
* [😇 "Anh ơi, hôm đầu tiên em nói em dụ anh về. Em xin lỗi. Anh tự tới mà."]
    sieu_nhan_hong: *(ngừng tạo dáng, nói nhỏ)* Dạ… em biết. Mà em không giận đâu. Nghe chị kể, em thấy mình… được ai đó muốn.
    ~ qh("sieu_nhan_hong", 12)
    ~ sl_that_long()
* [💬 "Anh có muốn ăn tối với ai hông? Bàn 12 ghế mà ăn một mình buồn lắm."]
    sieu_nhan_hong: *(khựng lại)* Sao… sao chị biết nhà em có bàn 12 ghế?
    sales: Em đoán. Người giàu mà đi giúp người cả ngày thì về nhà chắc buồn.
    sieu_nhan_hong: *(im lặng lâu)* …Chị đoán giỏi ghê.
    ~ qh("sieu_nhan_hong", 8)
- -> END

// ------------------------------------------------------------
=== sales_tudo_npc_cho ===
# npc:cho
cho: Gâu? *(đánh hơi túi xách bạn)*
* [🦴 Đưa {cho} cây xúc xích.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        cho: Gâu gâu! *(vẫy đuôi như chong chóng)*
        ~ qh("cho", 10)
    - else:
        _Túi xách "hàng hiệu" chỉ có son và danh thiếp. {cho} nhìn bạn như nhìn một hợp đồng không có tiền._
        ~ qh("cho", -2)
    }
* [💁 "Tuất ơi, tin chị đi, chị làm em thành gương mặt đại diện cho tiệm thú cưng."]
    cho: *(nghiêng đầu)* …Gâu?
    _{cho} chỉ hiểu chữ "ĂN". Câu của bạn không có chữ "ĂN"._
* [🤝 Ngồi xuống bậc thềm, xoa đầu {cho}.]
    cho: *(nằm xuống cạnh giày cao gót của bạn, thở dài)*
    _Một sinh vật không cần bạn hứa gì. Bạn xoa đầu nó tới khi chân tê._
    ~ qh("cho", 5)
    ~ cang_thang(-10)
- -> END
