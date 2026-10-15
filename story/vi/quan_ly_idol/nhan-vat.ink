// ============================================================
// QUẢN LÝ IDOL · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Anh Thái! Nói nhỏ thôi nha… em hỏi lịch quay tuần sau của anh Nguyên được hông? Em làm bản tin nội bộ, cần đăng cho mọi người biết mà.
* [🛡️ "Lịch Nguyên không đăng nội bộ. Ai cần thì hỏi anh."]
    ran_doc: *(cười ngọt)* Dạ, em hiểu. Anh kỹ ghê.
    _Bạn đã làm khủng hoảng mười hai năm. Bạn biết nụ cười kiểu này._
    ~ qh("ran_doc", -3)
    ~ uy_tin = uy_tin + 2
* [📅 "Ừ, đây nè. Đừng gửi ra ngoài nha."]
    ran_doc: Dạ em hứa! Em chỉ nói sự thật thôi mà.
    { RANDOM(1, 10) <= 5:
        _Hai ngày sau, một paparazzi ống kính dài đứng sẵn ở đúng địa điểm quay. Bạn nhìn lịch, rồi nhìn danh sách người đã hỏi._
        ~ follow(-30000)
        ~ thai_kh(1)
    }
- ran_doc: Mà anh Thái nè… anh lo cho anh Phát nhiều quá. Người ta nói đó. Em nói vậy thôi chứ không có ý gì đâu.
* [😶 "Người ta nói gì thì kệ người ta."]
    ran_doc: Dạ. *(ghi gì đó vào điện thoại)*
    ~ thai_gk(-3)
* [📱 "Lo cho nghệ sĩ là nghề của anh. Em lo cho bản tin đi."]
    ran_doc: Dạ dạ.
    ~ thai_gk(3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_giam_doc ===
# npc:giam_doc
giam_doc: Thái à. Ngồi đi. Cậu dạo này gầy quá. Ăn uống thế nào?
* [📱 "Em ổn anh. Khoan, em nghe máy chút."]
    giam_doc: *(nhìn bạn nghe máy 4 phút)* … Đấy. Đấy là "ổn" của cậu đấy.
    ~ qh("giam_doc", 2)
* [😶 "Ăn bánh mì. Ngày hai ổ."]
    giam_doc: Thế thì không được. Tối nay đi ăn với anh. Anh không ép, tùy cậu. Mà phải đi.
    ~ qh("giam_doc", 8)
    ~ an(30)
- giam_doc: Thái này. LL nó gọi cậu à?
* [😇 "Dạ. Em chưa trả lời."]
    giam_doc: *(im lâu)* Năm 2018 cậu ở lại. Anh chưa bao giờ hỏi vì sao.
    quan_ly_idol: Anh đừng hỏi.
    giam_doc: Ừ. Anh không hỏi.
    ~ qh("giam_doc", 5)
    ~ thai_tt(5)
* [🛡️ "Không anh. Ai gọi đâu."]
    giam_doc: Thế à. *(gật đầu, không tin)*
    ~ thai_tt(-3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_truong_phong ===
# npc:truong_phong
truong_phong: Anh Thái, mình sync nhanh 5 phút nhé. Lịch Nguyên tuần sau đụng ba buổi họp của tớ.
* [🗓️ "Đổi họp. Nguyên không đổi được."]
    truong_phong: Ơ… họp cũng quan trọng mà anh. Thôi được, mình take note, dời họp.
    ~ qh("truong_phong", -3)
    ~ uy_tin = uy_tin + 2
* [🤝 "Anh gửi lịch, cậu chọn giờ trống. Họp 5 phút thật nha."]
    truong_phong: 5 phút thật à? Tớ… chưa họp 5 phút thật bao giờ. Thử xem.
    ~ qh("truong_phong", 5)
- truong_phong: Mà anh Thái… cái video highlight gameshow hôm nọ, tớ dựng đấy. Anh thấy thế nào?
* [💬 "Đẹp. Lĩnh dựng hay lắm."]
    truong_phong: *(ho)* À… ừ… Lĩnh… Lĩnh có phụ.
    ~ qh("truong_phong", -2)
    ~ qh("editor", 3)
* [😶 "Đẹp. Cảm ơn cậu."]
    truong_phong: Ừ! Cảm ơn anh!
    ~ qh("truong_phong", 3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Anh Thái! Anh cầm hai điện thoại mà vẫn bình tĩnh, chuyên nghiệp quá anh ơi!
* [📱 "Cảm ơn em. Có gì em cần hả?"]
    thanh_ninh: Dạ… em hỏi chút: lịch anh Nguyên tối thứ 7 với LL… à không, với đối tác, có trùng gì hông anh?
    _"Với LL… à không". Bạn đã nghe rõ._
    ~ qh("thanh_ninh", -2)
* [😶 Gật đầu, đi tiếp.]
    thanh_ninh: *(nói theo)* Anh Thái đi nhanh như gió anh ơi!
- thanh_ninh: À anh, anh {giam_doc} hỏi anh có rảnh đánh golf chủ nhật hông?
* [😇 "Chủ nhật anh đám cưới. Cảm ơn em."]
    thanh_ninh: Dạ, em báo anh {giam_doc}. Anh chăm chỉ quá anh ơi!
    ~ qh("thanh_ninh", 3)
* [💬 "Nhi. Em đi phỏng vấn ở đâu thì đi, mà đừng đem lịch nghệ sĩ của anh theo nha."]
    thanh_ninh: *(mặt cứng lại, rồi cười)* Anh nói gì em hông hiểu ạ.
    ~ qh("thanh_ninh", -5)
    ~ uy_tin = uy_tin + 2
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Anh Thái! Nghe gì chưa? Có người thấy anh Phát ngồi ghế đá công viên ôm đàn một mình đó!
* [🛡️ "Chuyện này để anh lo, đừng ai đăng gì hết!"]
    hong_hot: Em có đăng đâu! Em chỉ kể! *(kể cho 4 người khác trong 10 phút)*
    ~ thai_kh(1)
* [💬 "Ừ. Ổng hát cho người thật nghe. Em kể vậy thì kể đúng nha."]
    hong_hot: Ủa… nghe cảm động à nha. Ok, em kể đúng.
    ~ qh("hong_hot", 5)
- hong_hot: Mà anh Thái, có phốt gì cần gỡ hông? Em quen admin hết á. Gỡ nhanh mà… hơi lan một xíu.
* [🙏 "Có. Bài 'ông chú giật micro'. Gỡ giùm anh."]
    hong_hot: Gét gô!
    { RANDOM(1, 10) <= 6:
        _Bài được gỡ. Thêm một bài "tại sao bài ông chú giật micro bị gỡ?" được đăng._
        ~ thai_dap()
        ~ thai_kh(1)
    - else:
        _Bài được gỡ sạch. {hong_hot} giỏi thật, khi muốn._
        ~ thai_dap()
    }
* [😶 "Thôi em. Để nó tự chìm."]
    hong_hot: Anh chill ghê. Lần đầu thấy anh chill.
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Anh Thái. Chill hông anh? Sao lúc nào anh cũng chạy vậy?
* [📱 "Anh không chạy thì ai chạy em."]
    con_ong_chau_cha: Ủa sao không thuê thêm người? Để em gọi chú em.
    quan_ly_idol: Chú em không có tiền thuê.
    con_ong_chau_cha: *(khựng lại)* … Ờ. Em… em biết rồi.
    ~ qh("con_ong_chau_cha", 3)
* [☕ "Ngồi uống ly cà phê với em năm phút."]
    _{con_ong_chau_cha} pha cà phê bằng máy mới ở phòng Marketing. Ngon. Năm phút thành mười lăm phút._
    ~ thai_ca_phe()
    ~ qh("con_ong_chau_cha", 8)
- con_ong_chau_cha: Anh Thái… nếu có một bài hát hay, mà người viết không dám đứng tên, anh làm sao?
* [💬 "Anh sẽ hỏi người viết sợ cái gì. Thường là sợ bị so với người khác."]
    con_ong_chau_cha: *(im lâu)* Dạ. Em… hỏi giùm bạn em.
    ~ qh("con_ong_chau_cha", 10)
* [📞 "Đưa anh nghe thử. Hay thì anh tìm ca sĩ."]
    con_ong_chau_cha: Dạ… để em hỏi "bạn em".
    ~ qh("con_ong_chau_cha", 5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: Anh Thái. Chill. Kịch bản gameshow còn sớm mà.
* [📅 "Còn 2 ngày. Anh cần tối mai."]
    chua_te_deadline: Tối mai… ok mom. Nước tới chân mới nhảy, mà nhảy là phải đẹp.
    ~ qh("chua_te_deadline", 2)
* [😤 "Em chill thì anh không chill được."]
    chua_te_deadline: *(ngẩng lên khỏi Tóp-tóp)* … Ờ. Xin lỗi anh. Em làm tối nay.
    ~ qh("chua_te_deadline", 3)
    ~ uy_tin = uy_tin + 2
- chua_te_deadline: Mà anh Thái… cái vụ Nguyên tặng em gối ôm hồng, hoa hồng, bút hồng… là anh dàn dựng PR hả?
* [😇 "Không. Anh không dàn dựng gì hết. Đó là Nguyên."]
    chua_te_deadline: *(im lâu)* … Vậy hả.
    _{chua_te_deadline} cất điện thoại. Lần đầu bạn thấy {chua_te_deadline} cất điện thoại giữa giờ làm._
    ~ qh("chua_te_deadline", 8)
    ~ qh("sieu_nhan_hong", 3)
* [📱 "Chuyện đó em hỏi Nguyên."]
    chua_te_deadline: Ok mom.
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh Thái! Anh cần em sạc điện thoại, pha cà phê, hay nghe máy giùm hông ạ?
* [🔋 "Sạc giùm anh máy trái. Cảm ơn Duy."]
    thuc_tap_sinh: Dạ! *(cắm sạc bằng một cục sạc dự phòng xịn nhất bạn từng thấy)*
    ~ thai_p(15)
    ~ qh("thuc_tap_sinh", 5)
* [😇 "Không cần gì. Em nghỉ chút đi."]
    thuc_tap_sinh: Dạ… nghỉ là sao ạ? *(thật sự không hiểu)*
    ~ qh("thuc_tap_sinh", 8)
- thuc_tap_sinh: Anh Thái… em hỏi ngu nha. Mười hai năm làm một chỗ… anh có hối hận hông?
* [📖 "Có ngày có. Mà sáng ra thấy người mình lo còn hát được là hết hối hận."]
    thuc_tap_sinh: *(gật đầu chậm)* Dạ… em bỏ việc cũ để vô đây. Lương cũ cao gấp mười. Em chưa hối hận ngày nào.
    _"Gấp mười". {thuc_tap_sinh} nói xong thì giật mình, ho một tiếng._
    ~ qh("thuc_tap_sinh", 10)
    ~ thai_gk(-2)
* [📱 "Không có thời gian để hối hận." Rồi nghe máy.]
    thuc_tap_sinh: Dạ. Em ghi lại ạ.
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_ke_toan ===
# npc:ke_toan
ke_toan: Thái. Cát-xê đám cưới của Phát. Hóa đơn đâu anh?
* [😶 "Mẹ cô dâu không xuất hóa đơn, em ơi."]
    ke_toan: Không có hóa đơn là không có tiền. Mà tháng sau có đoàn thuế đó anh. Anh nhớ.
    ~ qh("ke_toan", 2)
* [🤝 "Anh làm bảng kê, có chữ ký từng chủ tiệc. Được hông em?"]
    ke_toan: *(mắt sáng lên)* Được. Bảng kê có chữ ký là được. Anh là người đầu tiên ở đây nói câu đó.
    ~ qh("ke_toan", 10)
    ~ uy_tin = uy_tin + 3
- ke_toan: Mà anh Thái… anh có biết đọc hợp đồng kỹ hông?
* [💬 "Biết. Mười hai năm đọc hợp đồng nghệ sĩ. Có chuyện gì?"]
    ke_toan: *(nhìn quanh, nói rất nhỏ)* Không có gì. Tui hỏi vậy thôi. Có một trang… thôi, không có gì.
    _{ke_toan} đi. Bạn thấy {ke_toan} cầm một xấp hợp đồng hồng, ngón tay kẹp đúng một trang._
    ~ qh("ke_toan", 5)
* [📱 "Không, em. Anh đọc tin nhắn còn không kịp."]
    ke_toan: Ừ. Thôi.
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_hr ===
# npc:hr
hr: Anh Thái, anh rảnh không, lên phòng em uống trà xíu.
* [☕ "Đi. Mà anh uống cà phê."]
    hr: *(mỉm cười)* Phòng em chỉ có trà. 40 loại.
    _Bạn uống trà ô long. {hr} hỏi về {thanh_xin_nghi}: "Anh có biết Sơn đi đâu mỗi tối thứ 7 không?"_
    ** [🛡️ "Đi đám cưới với Phát. Anh giao."]
        hr: Thế à. Phát hát đám cưới tối thứ 7 ở Đài Tivi Hóng à anh?
        quan_ly_idol: Ừ. Đám cưới truyền hình.
        hr: *(ghi vào sổ, mỉm cười)* Dạ.
        ~ thai_doi_lich_son = thai_doi_lich_son + 1
        ~ qh("thanh_xin_nghi", 5)
    ** [😶 "Anh không biết."]
        hr: Dạ.
* [📱 "Anh đang có ba cuộc gọi chờ. Để sau nha Tuấn."]
    hr: Dạ. Em ghi nhận.
    ~ qh("hr", -3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_it ===
# npc:it
it: Anh. Điện thoại. Sạc.
_{it} chìa tay. Ngày nào {it} cũng sạc điện thoại cho bạn trong phòng server, như một nghi lễ._
* [🔋 Đưa cả hai máy.]
    it: *(cắm sạc)* Pin anh chai rồi. Máy trái còn 61% dung lượng gốc.
    quan_ly_idol: Giống anh.
    it: …Ừ.
    ~ thai_p(20)
    ~ qh("it", 5)
* [🔋 Đưa máy phải, giữ máy trái.]
    it: Máy trái là máy của ai?
    quan_ly_idol: Của Phát.
    it: *(gật đầu như hiểu hết)* Ừ.
    ~ thai_p(10)
- it: Anh. Lịch của Nguyên có người tải từ ngoài công ty. Tuần rồi. Hai lần.
* [💬 "Từ máy nào?"]
    it: Không nói được. Quyền riêng tư.
    _{it} không nói được. Nhưng {it} xoay màn hình về phía bạn một giây, rồi xoay lại._
    ~ qh("it", 5)
    ~ thai_kh(-1)
* [😶 "Đổi mật khẩu giùm anh."]
    it: Đổi rồi. Từ hôm qua.
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(đeo kính đen trong nhà)* Anh. Chiều nay có show gì hông?
* [📞 "Khai trương tiệm nail 5 giờ. Đừng đeo kính trong tiệm, em vấp."]
    idol_het_thoi: Em hông vấp. *(vấp ngay bậc cửa phòng Nghệ sĩ)*
    ~ qh("idol_het_thoi", 3)
* [☕ "Không có show. Ngồi uống cà phê với anh."]
    idol_het_thoi: *(gỡ kính, ngồi xuống)* Anh rảnh hả? Lạ ghê.
    _Bạn không rảnh. Bạn tắt cả hai máy._
    ~ qh("idol_het_thoi", 8)
    ~ thai_gk(-5)
* [🎤 "Hát cho anh nghe câu thứ ba đi. Hồi 2015 em lệch tông câu đó."]
    idol_het_thoi: *(cười)* Anh còn nhớ hả? *(hát, cố tình lệch tông)*
    _Bạn cười. Hai điện thoại cùng reo. Bạn để cả hai reo tới hết câu._
    ~ qh("idol_het_thoi", 10)
    ~ thai_gk(-5)
- idol_het_thoi: Anh ăn gì chưa? Em có ổ bánh mì nè, chia đôi.
* [🥖 Nhận nửa ổ bánh mì.]
    ~ an(20)
    ~ qh("idol_het_thoi", 5)
* [📱 "Ăn rồi." (Chưa ăn.)]
    idol_het_thoi: Xạo. Anh ốm nhom.
    _Phát để nửa ổ bánh mì lên bàn bạn rồi đi. Bạn ăn lúc 4 giờ chiều._
    ~ an(20)
    ~ thai_gk(3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Anh Thái. Em đang viết một nhân vật: người đàn ông cầm hai điện thoại, nhưng không máy nào gọi cho chính anh ta. Anh thấy có nỗi đau không?
* [😶 "Nghe quen quen."]
    bien_kich: *(ghi vào sổ bìa da)* "Nhân vật nói: nghe quen quen." Hay.
    ~ qh("bien_kich", 3)
    ~ thai_gk(-3)
* [💬 "Oánh. Em viết về ai thì xin phép người đó."]
    bien_kich: Đây không phải đạo, đây là cảm hứng.
    quan_ly_idol: Cảm hứng cũng phải xin phép.
    bien_kich: *(gập sổ)* … Dạ.
    ~ qh("bien_kich", -3)
    ~ uy_tin = uy_tin + 2
- bien_kich: Mà anh… nhân vật đó có yêu ai không?
* [🛡️ "Anh ta yêu công việc."]
    bien_kich: Nhạt. Em không tin.
    ~ thai_gk(5)
* [😶 Nghe máy. Không trả lời.]
    bien_kich: *(viết thêm một dòng)* "Nhân vật né câu hỏi bằng cách nghe máy." Càng hay.
    ~ thai_gk(-2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_editor ===
# npc:editor
editor: *(ngáp)* Dạ… anh Thái. Em đang render. Anh cần gì hông anh?
* [📱 "Dựng giùm anh cái teaser cho Nguyên. Gấp. Mai."]
    editor: Dạ… em dựng liền.
    _Đêm đó đèn phòng {editor} sáng tới 4 giờ. Sáng ra, teaser đẹp hơn bạn tưởng. Và kênh của Phát có thêm một video "tiện tay"._
    ~ thai_video_tien_tay = thai_video_tien_tay + 1
    ~ uy_tin = uy_tin + 2
* [😊 "Không cần gì. Em ăn chưa? Anh có ổ bánh mì nè."]
    editor: *(nhìn ổ bánh mì như nhìn một món quà)* Dạ… em ăn.
    ~ qh("editor", 10)
    ~ an(-10)
* [☕ Đặt một ly cà phê sữa lên bàn {editor}.]
    editor: Ủa… sao anh biết em uống cà phê sữa?
    quan_ly_idol: Anh làm quản lý mà. Anh biết hết.
    _Bạn không biết hết. Bạn chỉ thấy cái ly rỗng trên bàn {editor} mỗi sáng. {editor} thì đỏ mặt tới tai._
    ~ qh("editor", 12)
- editor: Anh Thái… anh ngủ được mấy tiếng một đêm vậy anh?
* [😶 "Bốn. Có hôm ba."]
    editor: Giống em. *(rồi nói nhỏ hơn)* Mà em thức là tại em thích. Anh thức là tại anh lo cho người khác.
    ~ qh("editor", 5)
* [💬 "Còn em? Thức tới 3 giờ sáng hoài, mắt em đỏ như thỏ."]
    editor: *(cười)* Anh để ý hả?
    ~ qh("editor", 8)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_designer ===
# npc:designer
designer: Anh Thái. Poster đám cưới anh Phát, mẹ cô dâu muốn chữ "Phát" to hơn chữ "Cô dâu". Sửa nhẹ thôi là sửa cái gì ạ?
* [😇 "Để tên cô dâu to nhất. Anh nói với bà mẹ."]
    designer: *(thở phào)* Anh là quản lý duy nhất ở đây chịu nói với khách.
    ~ qh("designer", 10)
* [📱 "Sửa theo khách đi em. Khách trả tiền."]
    designer: Dạ. Lần sửa thứ 9.
    ~ qh("designer", -3)
- designer: Mà anh nè… màu hồng của Nguyên với màu tím của anh Phát đứng chung poster thì hợp lắm. Em vẽ thử hông?
* [🎨 "Vẽ đi. Anh trả tiền túi."]
    designer: Hông lấy tiền. Em vẽ vì em thích.
    _Ba ngày sau, một poster "Công Viên Hồng" xuất hiện trên bàn bạn. Đẹp tới mức bạn cất vào ngăn bàn, không dám cho ai thấy trước._
    ~ qh("designer", 8)
* [😶 "Để sau Đêm Hồng."]
    designer: Dạ. Sau Đêm Hồng thì… chưa biết em còn ở đây hông.
    _{designer} nói câu đó rất nhỏ, rồi quay về cái laptop thứ hai._
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_sales ===
# npc:sales
sales: Anh Thái! Tin chị đi, chị có nhà tài trợ cho Đêm Hồng: Răng Hồng! Bàn chải màu hồng! Chắc kèo!
* [💬 "Gửi anh số điện thoại người phụ trách."]
    sales: *(cười rất tươi)* Dạ để chị hỏi lại số.
    ~ qh("sales", -3)
* [😇 "Ừ. Mà nếu không chắc, em nói anh sớm nha. Anh lo phương án B."]
    sales: *(khựng lại)* … Dạ. Em… nói anh sớm.
    _Lần đầu {sales} xưng "em" với bạn._
    ~ qh("sales", 8)
- sales: Mà anh ơi… nếu có một nhà tài trợ thật gọi em, mà không ai tin, thì sao anh?
* [🤝 "Thì đưa anh số. Anh tin."]
    sales: Thiệt hả anh? Sữa Chua Hồng Hào ở Ven Đô! Họ gọi thiệt mà!
    _Bạn ghi lại số. Không biết sao, bạn tin._
    ~ qh("sales", 12)
* [📱 "Em nói phét nhiều quá rồi, Huyền."]
    sales: *(cười, mà mắt không cười)* Dạ. Em biết.
    ~ qh("sales", -5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_chi_dai ===
# npc:chi_dai
chi_dai: Thái. Ăn cơm chưa? Ngồi xuống. Mắt ông thâm như gấu trúc.
* [📱 "Chưa. Khoan, tui nghe máy chút."]
    chi_dai: *(giật cả hai điện thoại, bỏ vô ngăn kéo)* Ăn. Xong rồi nghe.
    _Bạn ăn hết chén cơm trong 3 phút. Lần đầu ăn mà không nghe máy._
    ~ an(40)
    ~ qh("chi_dai", 8)
    ~ thai_p(10)
* [😇 "Chưa. Bà xới cho tui chén cơm."]
    chi_dai: Vậy mới ngoan.
    ~ an(40)
    ~ qh("chi_dai", 5)
- chi_dai: Ông lo cho thằng Phát mười mấy năm. Có ai lo cho ông hông?
* [😶 "Có bà đó."]
    chi_dai: *(cười, vỗ vai)* Ông khéo miệng hơn tui tưởng.
    ~ qh("chi_dai", 5)
* [🛡️ "Tui lo được cho tui."]
    chi_dai: Xạo. Đứa nào làm ông mệt, chỉ mặt tui.
    _Bạn suýt chỉ vào gương._
    ~ qh("chi_dai", 3)
    ~ thai_gk(-2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: Thái! Bằng tuổi nhau, tui nói thiệt: ông có tiền nhàn rỗi hông? Kèo này x10. Lần này là lên thật.
* [💸 "Tui có 9 triệu. Mà tháng trước tui trả tiền nhà cho người ta rồi."]
    dan_dau_tu: Ủa trả tiền nhà cho ai? *(rồi nhìn mặt bạn, tự hiểu, im)*
    ~ qh("dan_dau_tu", 3)
    ~ thai_gk(-3)
* [😶 "Ông trả Phát 500 nghìn trước đi."]
    dan_dau_tu: *(ho)* À… tuần sau. Lên thật là trả gấp ba.
- dan_dau_tu: Mà nè, tui coi số: lượt theo dõi của Nguyên tăng mạnh nhất lúc Nguyên đi giúp người thật. Không phải lúc quay MV.
* [📊 "Gửi tui bảng số. Tui đưa anh {giam_doc} coi."]
    dan_dau_tu: *(mắt sáng)* Lần đầu có người muốn coi số thật của tui!
    ~ qh("dan_dau_tu", 10)
    ~ follow(5000)
* [📱 "Biết rồi. Điều khoản số 3 đó."]
    dan_dau_tu: Ờ ha.
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho nhẹ)* Anh Thái… em hơi sốt. Chiều nay em xin…
* [🗓️ "Đi đi. Anh đổi lịch. Hát cho hay."]
    thanh_xin_nghi: *(đứng hình)* Anh… nói "hát" hả?
    quan_ly_idol: Anh nói "hát" hả? Anh nói "nghỉ" mà.
    _{thanh_xin_nghi} nhìn bạn, bạn nhìn {thanh_xin_nghi}. Hai người bạn thân, hai người giấu chuyện, cùng cười._
    ~ thai_doi_lich_son = thai_doi_lich_son + 1
    ~ qh("thanh_xin_nghi", 10)
* [😤 "Sơn. Hôm nay Nguyên quay ba buổi. Em ở lại."]
    thanh_xin_nghi: *(thở dài)* Dạ. *(rồi ho thật)*
    ~ qh("thanh_xin_nghi", -3)
    ~ uy_tin = uy_tin + 2
- thanh_xin_nghi: Anh Thái. 1 giờ sáng nay em gọi máy thứ ba của anh mà anh hông nghe.
* [📱 "Anh ngủ quên. Lần đầu trong năm."]
    thanh_xin_nghi: Trời. Vậy thì tốt. Em hông gọi lại nữa.
    ~ qh("thanh_xin_nghi", 3)
* [💬 "Có chuyện gì hả?"]
    thanh_xin_nghi: Dạ… hông có gì. Em chỉ muốn nói em đang sợ một chuyện. Mà em chưa nói được.
    quan_ly_idol: Khi nào nói được thì gọi máy thứ ba. Anh nghe.
    ~ qh("thanh_xin_nghi", 8)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Cậu Thái. Ngồi uống chén trà đá. Cậu đi qua đi lại cổng này hai mươi lần một ngày rồi đấy.
* [😇 "Dạ, em ngồi chút."]
    _Bác rót trà. Radio phát bài hát cũ. Bạn tắt một máy. Rồi tắt luôn máy kia._
    bac_bao_ve: Năm 2015 cậu cũng đi qua cổng này hai mươi lần một ngày. Đi theo thằng Phát.
    ~ qh("bac_bao_ve", 8)
    ~ uong(15)
    ~ thai_p(10)
* [📱 "Dạ em có việc, bác ơi."]
    bac_bao_ve: Ừ. Đi đi.
- bac_bao_ve: Bác hỏi cậu một câu. Người ta ở lại một chỗ mười hai năm, là vì chỗ đó, hay vì người ở chỗ đó?
* [😶 Im lặng. Uống trà.]
    bac_bao_ve: *(gật đầu)* Ừ. Bác cũng thế. Mười sáu năm rồi.
    _Bác nói về ai thì bác không nói. Bác uống trà, như chưa nói gì._
    ~ qh("bac_bao_ve", 5)
* [💬 "Vì người, bác ạ."]
    bac_bao_ve: Bác không thấy gì đâu. Bác chỉ trông xe thôi.
    ~ qh("bac_bao_ve", 5)
    ~ thai_gk(-3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: *(tạo dáng)* Anh Thái! Hồng không phải màu, Hồng là thái độ! Chiều nay em đi giúp người được hông anh?
* [🗓️ "Được. Nhưng nhắn anh địa điểm, anh cho người đi theo quay."]
    sieu_nhan_hong: Dạ! Mà đừng quay mặt em nha anh!
    ~ follow(10000)
    ~ qh("sieu_nhan_hong", 3)
* [😤 "Chiều nay quay quảng cáo. Ở lại."]
    sieu_nhan_hong: *(xụ vai)* Dạ… điều khoản số 3 mà anh…
    _Hai tiếng sau, Nguyên biến mất. Điều khoản số 3._
    ~ thai_kh(1)
- sieu_nhan_hong: Anh Thái… anh Phát ghét em lắm hả anh?
* [💬 "Không. Phát sợ. Sợ bị quên. Em giúp Phát đừng bị quên, Phát sẽ thương em."]
    sieu_nhan_hong: *(im lâu)* Em hiểu. Em cũng sợ cái đó.
    ~ qh("sieu_nhan_hong", 10)
    ~ qh("idol_het_thoi", 3)
* [📱 "Chuyện đó để anh lo."]
    sieu_nhan_hong: Dạ.
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_tudo_cho ===
# npc:cho
_{cho} nằm trước chòi bảo vệ. Nhìn bạn. Nhìn túi áo bạn, nơi lúc nào cũng có hai cái điện thoại rung._
cho: Gâu.
* {co(xuc_xich)} [🌭 Đưa {cho} một cây xúc xích.]
    ~ mat(xuc_xich)
    cho: Gâu gâu! *(vẫy đuôi)*
    ~ qh("cho", 15)
* [🐾 Ngồi xuống xoa đầu nó.]
    cho: *(ngửi tay bạn, mùi cà phê, hắt hơi)* Ẳng!
    ~ qh("cho", 5)
* [🧤 "Tuất. Cái găng tay hồng. Trả tao đi."]
    cho: Grừ…
    bac_bao_ve: *(từ chòi)* Nó lấy cái gì thì nó không trả đâu.
- _Điện thoại trong túi bạn rung. {cho} gầm gừ với cái túi áo._
* [📵 Tắt máy. "Ừ, tao cũng ghét nó."]
    cho: Gâu. *(nằm xuống cạnh chân bạn)*
    ~ qh("cho", 8)
    ~ cang_thang(-5)
* [📱 Nghe máy.]
    cho: *(quay lưng đi)*
- -> END
