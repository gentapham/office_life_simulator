// ============================================================
// THÁNH XIN NGHỈ: SƠN · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Sơn ơi! Tui mua dư ly trà sữa nè, ông uống hông? Mà ông đang xếp lịch gì đó? Cho tui coi ké với.
* [🥤 Nhận ly trà sữa, úp cuốn lịch xuống.]
    ~ nhan(tra_sua)
    ran_doc: Ủa sao úp vậy? Tui coi chút thôi mà.
    thanh_xin_nghi: Lịch nội bộ ông. Anh Thái dặn.
    ~ qh("ran_doc", -2)
* [📅 "Coi đi, có gì đâu." (Mở lịch)]
    ~ son_hieu_biet_lich = true
    ~ qh("ran_doc", 8)
    ran_doc: Ông dễ thương ghê. *(liếc qua rất nhanh, như đang chụp bằng mắt)*
- ran_doc: Mà nè, nói nhỏ thôi nha… ông nghỉ nhiều vậy mà hông bị gì, ông có bí quyết gì hông?
* [🤧 "Bí quyết là… bà ngoại."]
    ran_doc: *(cười)* Bà ngoại ông chắc là người nổi tiếng nhất Ven Đô rồi.
* [😶 "Bí quyết là đừng hỏi người khác bí quyết."]
    ran_doc: Haha. Ông này được. Tui hỏi vậy thôi chứ không có ý gì đâu.
    ~ qh("ran_doc", 3)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_giam_doc ===
# npc:giam_doc
giam_doc: Sơn! Hôm nay em có mặt à? Anh tưởng bà ngoại em lại ốm.
* [😅 "Dạ hôm nay bà khỏe anh."]
    giam_doc: Tốt! Bà khỏe thì công ty khỏe. Anh không ép, nhưng em bảo bà khỏe cả tháng giúp anh nhé.
* [📅 "Dạ, lịch Siêu Nhân Hồng tuần này em xếp xong rồi anh. Không chồng chéo ô nào."]
    giam_doc: Thế à? *(lật xem)* Ừ! Gọn! Mindset điều phối thế này mới được!
    ~ uy_tin = uy_tin + 2
    ~ qh("giam_doc", 3)
- giam_doc: À Sơn. Anh hỏi thật nhé. Ở phòng Nghệ sĩ, em thấy Phát còn hát được không? Anh… vẫn thấy ân hận vì không lo cho nó tới nơi tới chốn.
* [🎤 "Ảnh hát còn hay lắm anh. Tối mất điện ảnh hát cả pantry nghe, không ai đi về."]
    giam_doc: *(im lặng)* …Thế à. Anh không biết.
    ~ qh("giam_doc", 5)
    ~ qh("idol_het_thoi", 3)
* [😶 "Dạ em chỉ lo lịch thôi anh."]
    giam_doc: Ừ. Ừ, đúng rồi.
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_truong_phong ===
# npc:truong_phong
truong_phong: Sơn, cậu có rảnh 5 phút không? Tớ muốn sync về lịch họp tuần sau. Tớ cần 7 cuộc họp, cậu xếp giúp vào lịch của Siêu Nhân Hồng nhé.
* [📅 "7 cuộc? Ổng có 5 ngày thôi ông. Tui xếp 2 cuộc được hông?"]
    truong_phong: 2 cuộc thì… mình họp để bàn xem nên cắt cuộc nào nhé.
    ~ cang_thang(5)
* [😅 "Ông Nhật, tui xếp 7 cuộc rồi ông cho tui nghỉ 1 buổi chiều nha."]
    truong_phong: Nghỉ? Cậu mà nghỉ thì ai xếp lịch họp? Không được, tớ take note.
    ~ son_soi(3)
- truong_phong: À mà… cậu thấy {con_ong_chau_cha} dạo này có hay gặp sếp không? Lịch của nó có gì lạ không?
* [😶 "Lịch ổng chỉ có: cà phê, hồ bơi, cà phê."]
    truong_phong: *(thở phào)* Ừ. Tốt. Ý tớ là… ừ.
    ~ qh("truong_phong", 3)
* [🤝 "Ông Nhật, ổng không muốn ghế phó giám đốc đâu. Tui xếp lịch cho cả công ty, tui biết."]
    truong_phong: Thật á? *(rồi nghi ngờ)* Sao cậu biết?
    thanh_xin_nghi: Ổng xin nghỉ đúng mấy buổi sếp mời họp ban lãnh đạo. Người muốn ghế không ai làm vậy.
    ~ qh("truong_phong", 8)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Sơn ơi, bà ngoại ông sao rồi? Tui thương bà lắm đó, nghe bà ốm hoài.
* [😢 "Bà khỏe rồi bà. Cảm ơn bà hỏi thăm."]
    thanh_ninh: Dạ… à, ông là đồng nghiệp, tui quen miệng "dạ". Hihi.
* [💬 "Bà hỏi thăm bà ngoại tui để báo cáo sếp hả?"]
    thanh_ninh: *(đơ một giây)* Ủa đâu có! Tui… tui hỏi thăm có tâm mà!
    ~ qh("thanh_ninh", -3)
- thanh_ninh: Mà ông nè… lịch tuần sau của sếp, tui cần xếp giờ trống. Có hôm nào sếp không đi theo Siêu Nhân Hồng không?
* [📅 "Chiều thứ 7 tuần này. Sếp đi golf."]
    thanh_ninh: Cảm ơn ông! *(ghi chép rất nhanh, nhìn về phía tòa nhà xanh lá chuối ở xa)*
    ~ qh("thanh_ninh", 5)
* [🤔 "Bà cần giờ trống của sếp làm gì? Đi đâu hả?"]
    thanh_ninh: Đi… đi khám răng! Ai cũng đi khám răng hết á.
    _Bạn biết "khám răng" nghĩa là gì. Bạn là chuyên gia lý do._
    ~ qh("thanh_ninh", 2)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Sơn! Nghe gì chưa? Mà thôi, ông có ở công ty đâu mà nghe. Để tui kể!
* [😅 "Kể đi chị."]
    hong_hot: Ối dồi ôi, anh Vũ với Siêu Nhân Hồng nè, anh Thái đi sảnh LL nè, rồi còn ai đó hát nền livestream hay quá trời mà hông ai biết là ai!
    _Bạn cười. Bạn biết ai._
    ~ qh("hong_hot", 5)
* [🤐 "Thôi chị, chuyện người ta mà."]
    hong_hot: Ủa alo? Ông là người duy nhất trong công ty hông muốn nghe chuyện. Có tật giật mình hả?
    ~ son_soi(2)
- hong_hot: Mà nè, hôm trước tui thấy ông ở Đài Tivi Hóng. Ông đi đâu đó?
* [😶 "Đi theo anh Nguyên chớ đâu."]
    hong_hot: Ờ ha. Mà sao hôm thứ 4 cũng thấy xe ông ở đó? *(nheo mắt)*
    ~ son_soi(5)
    ~ son_tin(-3)
* [🎁 "Chị muốn ăn gì hông? Em bao."]
    hong_hot: Hối lộ! Chấp nhận! Trà sữa full topping!
    ~ tien_cong(-45000)
    ~ qh("hong_hot", 8)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Ê Sơn. Ông nghỉ hoài mà hông ai đuổi, ông chỉ tui đi. Tui muốn nghỉ… nghỉ hẳn, mà chú tui không cho.
* [💬 "Ông muốn nghỉ hẳn? Ông Long mà muốn nghỉ hả?"]
    con_ong_chau_cha: Ừ. Tui muốn làm cái gì đó… tự mình. Mà nói ra ai cũng cười.
    thanh_xin_nghi: Tui không cười. Tui hiểu.
    ~ qh("con_ong_chau_cha", 8)
* [🤧 "Bí quyết: bà ngoại. Ông có bà ngoại hông?"]
    con_ong_chau_cha: Có. Mà bà tui ở Sky Ảo, tầng 29, bà khỏe hơn tui.
- con_ong_chau_cha: À, mà ông… có biết làm nhạc không? Tui có mấy bài… thôi, không có gì.
* [🎤 "Ông làm nhạc hả? Cho tui nghe thử đi."]
    con_ong_chau_cha: *(giật mình)* Ai nói tui làm nhạc? Không có! *(đi nhanh)*
    _Bạn quen nhìn người ta giấu đồ. Ông Long vừa giấu một thứ rất giống của bạn._
* [😶 "Không biết. Tui chỉ biết xếp lịch."]
    con_ong_chau_cha: Ờ. Chill.
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: Sơn! Ông xếp lịch quay cho tui rồi hả? Đừng xếp sớm, tui có làm sớm đâu.
* [📅 "Tui xếp hạn chót sớm hơn 2 ngày. Ông tưởng là hạn thật, ông sẽ làm kịp."]
    chua_te_deadline: *(nheo mắt)* Ông chơi tui hả? *(ngẫm nghĩ)* …Mà hay đó. Đừng nói với tui ngày thật.
    ~ qh("chua_te_deadline", 5)
    ~ uy_tin = uy_tin + 2
* [😴 "Chill. Còn sớm mà ông."]
    chua_te_deadline: Đó! Ông hiểu tui nhất công ty! Hai đứa mình, một đứa xin nghỉ, một đứa xin gia hạn!
- chua_te_deadline: Mà… lịch của ổng, Siêu Nhân Hồng đó… sao lúc nào cũng có giờ trống trùng đúng giờ nghỉ trưa của tui vậy?
* [🤭 "Ổng tự chen vô đó ông. Tui đâu có xếp."]
    chua_te_deadline: *(đỏ mặt, lướt Tóp-tóp nhanh hơn)* Kỳ ghê. PR thôi mà.
* [🤝 "Ông muốn tui đổi giờ hông?"]
    chua_te_deadline: *(ngập ngừng rất lâu)* …Thôi khỏi. Để vậy đi.
    ~ qh("chua_te_deadline", 5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh Sơn! Em chào anh ạ!
thanh_xin_nghi: Dạ em chào anh Duy ạ!
_Hai người "anh" nhau. Cả văn phòng nhìn. Không ai chịu thua._
* [🤝 "Anh Duy, anh dạy em cách đi làm sớm mỗi ngày được hông? Em cần lắm."]
    thuc_tap_sinh: Dạ… bí quyết của em là ngủ lúc 9 giờ tối ạ. Với lại… ngày xưa em quen dậy sớm mở… à, dậy sớm thôi ạ.
    ~ qh("thuc_tap_sinh", 5)
    ~ son_soi(-2)
* [📅 "Anh Duy, em dạy anh xếp lịch. Lỡ em vắng, anh giữ giùm."]
    thuc_tap_sinh: Dạ em học liền ạ! *(mở sổ, viết tiêu đề "Bài 1: Lịch")*
    ~ qh("thuc_tap_sinh", 8)
- thuc_tap_sinh: Dạ anh Sơn… em hỏi chút ạ. Sao anh nghỉ nhiều mà vẫn vui vậy ạ? Em đi làm đủ mà… đôi khi em thấy… em không biết mình đang theo đuổi cái gì.
* [😇 "Em nghỉ để theo đuổi một cái. Anh đi làm đủ để theo đuổi một cái khác. Ai cũng đang theo đuổi gì đó mà."]
    thuc_tap_sinh: Dạ… *(mắt sáng lên)* Anh nói hay quá ạ. Giống thoại phim.
    ~ qh("thuc_tap_sinh", 5)
* [🤧 "Bí mật là bà ngoại, anh Duy."]
    thuc_tap_sinh: Dạ… em cũng nhớ bà ngoại em ạ. *(sụt sịt thật)*
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_ke_toan ===
# npc:ke_toan
ke_toan: Sơn. Tháng này em nghỉ không phép {son_so_lan_nghi - 31} ngày. Mỗi ngày trừ 590.000đ. Em biết chưa?
* [😢 "Dạ em biết chị. Em… tính rồi."]
    ke_toan: Tính rồi mà vẫn nghỉ. Nghĩa là thứ em đi làm ngày nghỉ đáng giá hơn 590.000đ. Chị chỉ mong là nó đáng.
    ~ qh("ke_toan", 5)
* [📄 "Dạ, em có giấy phòng khám nè chị."]
    ke_toan: *(đọc)* Khỏe Re. Ký chủ nhật. Lần thứ 9. Chị thuộc chữ ký bác sĩ này hơn chữ ký sếp rồi.
    ~ son_tin(-3)
- ke_toan: Mà… em nói chị nghe. Chị không báo ai. Em nghỉ để làm gì?
* [🎤 "Em đi hát chị."]
    ke_toan: *(im lặng)* …Có hóa đơn không?
    thanh_xin_nghi: Dạ… có tiền tip.
    ke_toan: Thôi được. Đi hát mà có thu nhập, coi như làm thêm. Chị không trừ tình cảm, chỉ trừ lương.
    ~ qh("ke_toan", 10)
* [😶 "Dạ… bà ngoại."]
    ke_toan: Ừ. Bà ngoại. Không có hóa đơn là không có tiền.
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_hr ===
# npc:hr
hr: Sơn. Em rảnh không, lên phòng anh uống trà xíu.
_Câu đáng sợ nhất công ty. Bạn nổi da gà theo phản xạ._
* [🤧 "Khụ khụ… em… em hơi bận anh…"]
    hr: Ho hay đó. Trà gừng cũng trị được.
    ~ son_soi(3)
* [😇 "Dạ, em lên liền."]
    _Phòng HR. Ấm trà. Không có hồ sơ nào trên bàn. Anh Tuấn chỉ rót trà rồi ngồi nhìn ra cửa sổ._
    hr: Anh mời uống trà thôi. Không có chuyện gì hết. Lâu lâu anh cũng muốn có người ngồi chung.
    ~ son_soi(-5)
    ~ qh("hr", 8)
- hr: Mà Sơn nè, em có hay xem "Giọng Ca Ước Mơ" không?
* [😶 "Dạ… thỉnh thoảng ạ."]
    hr: Có một thí sinh anh thích lắm. Mà thôi, nói ra em cười anh.
    _Bạn không cười. Bạn đang cố không làm rơi ly trà._
* {son_biet_so_604} [🔒 "Dạ… anh có biết ai có số máy đuôi 604 không anh?"]
    _Anh Tuấn sặc trà. Ho thật. Lần đầu tiên bạn thấy anh ấy ho._
    hr: Khụ… em… em hỏi chi vậy?
    thanh_xin_nghi: Dạ hỏi chơi thôi anh. Em… cảm ơn anh.
    ~ qh("hr", 15)
    ~ son_soi(-10)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_it ===
# npc:it
it: Gì? Restart chưa?
* [💬 "Anh Bảo, máy em lâu lâu tự gửi đơn xin nghỉ. Có virus hông anh?"]
    it: *(liếc)* Lỗi người dùng.
    ~ qh("it", 2)
* [🍜 Đặt ly mì lên bàn. "Mì cay. Biếu anh."]
    it: …Cảm ơn. *(ăn liền)*
    ~ tien_cong(-15000)
    ~ qh("it", 8)
- it: Studio tầng 2 giờ nghỉ trưa có tiếng hát. Mic tự ghi âm. Tui nghe hết rồi. Ai đó?
* {son_bi_bao_ghi_am} [🔒 "Anh… giữ file đó giùm em được hông?"]
    it: Giữ rồi. Ổ cứng "KHÔNG ĐƯỢC MỞ" có thêm một file. Ở đó an toàn nhất thế giới.
    ~ qh("it", 10)
* [😅 "Chắc ma đó anh."]
    it: Ma hát đúng tông. Ừ.
* [🎤 "Em đó anh. Đừng nói ai nha."]
    it: Tui ít nói. Không cần dặn.
    ~ qh("it", 5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: Sơn! Lịch tuần này của anh đâu? Đám cưới thứ 7 có phòng chờ riêng không? Em biết anh là ai không?
* [📅 "Dạ biết anh. Thứ 7 hai đám, có phòng chờ… là cái xe của anh Thái."]
    idol_het_thoi: Xe cũng được. Xe có máy lạnh là được.
    ~ qh("idol_het_thoi", 3)
* [😇 "Dạ, em xin cho anh được 1 dĩa trái cây ở đám thứ hai."]
    idol_het_thoi: *(gỡ kính đen)* Thiệt hả? Hồi anh còn nổi, có cả dĩa nho.
    ~ qh("idol_het_thoi", 5)
- idol_het_thoi: Sơn… em có thấy anh còn hát được không? Nói thật. Em nghe anh hát nhiều nhất công ty đó.
* [🎤 "Anh hát còn hay. Hay hơn hồi 2015. Hồi đó anh hát vui, giờ anh hát thật."]
    _{idol_het_thoi} im lặng, nhìn xuống đôi giày sân khấu cũ._
    idol_het_thoi: …Em nói như người trong nghề vậy.
    ~ qh("idol_het_thoi", 10)
* [😶 "Fan anh còn đông mà anh."]
    idol_het_thoi: *(cười gượng)* Ừ… đông. *(liếc điện thoại, một app tên "Like Thật 100%")*
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút… Alo… ừ… Sơn, đợi anh 30 giây… Alo… Rồi. Em nói đi.
* [🤝 "Anh đưa em một cái điện thoại, em nghe giùm."]
    quan_ly_idol: *(đưa ngay, không suy nghĩ)* Cái bên trái là Phát, bên phải là Nguyên. Đừng lộn.
    _Bạn nghe 4 cuộc. Anh Thái uống được ly cà phê còn nóng. Lần đầu trong tuần._
    ~ qh("quan_ly_idol", 8)
* [💬 "Anh Thái, anh ăn trưa chưa?"]
    quan_ly_idol: Ăn rồi. *(bụng kêu)* …Ăn rồi.
    ~ qh("quan_ly_idol", 3)
- quan_ly_idol: Sơn, em mà đi làm đủ 1 tuần thì anh mời em đi ăn ốc. Thiệt.
* [😅 "Anh đừng hứa, em sợ anh tốn tiền ốc."]
    quan_ly_idol: *(cười)* Em có lương tâm ghê.
* {son_thai_biet} [🔒 "Anh Thái, tuần này em đi làm đủ. Nhưng tối thứ 7 anh nhớ mở tivi nha."]
    quan_ly_idol: Anh nhớ. Anh mở to nhất. Anh kéo cả Phát ngồi xem.
    ~ qh("quan_ly_idol", 8)
    ~ son_mo(3)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Sơn. Chị đang viết một nhân vật. Một người hay xin nghỉ, có một bí mật. Em kể chị nghe lý do xin nghỉ hay nhất của em đi. Cho có… chất liệu.
* [🐱 "Dạ, 'con mèo nhà hàng xóm sinh khó'."]
    bien_kich: *(ghi rất nhanh)* Trời ơi. Rất… thơ. Rất đau. Chị xin nha.
    ~ qh("bien_kich", 5)
* [🕵️ "Chị viết về em hả chị? Có ghi tên thật hông?"]
    bien_kich: *(lật sổ che lại)* Không. Hư cấu hoàn toàn. Tên nhân vật là… Sơ… Sương. Sương.
    _Bạn thấy trong sổ: "Sơn (Sương?), hay ho giả"._
    ~ qh("bien_kich", -3)
- bien_kich: Mà em nè, chị hỏi thật. Nếu ai đó lấy chuyện của em viết thành truyện, em có giận không?
* [😇 "Giận chứ chị. Nhưng nếu người ta hỏi trước, em cho."]
    bien_kich: *(im lặng hơi lâu)* …Hỏi trước. Ừ. Hỏi trước.
    _Chị {bien_kich} nhìn về phía bàn của {thuc_tap_sinh}. Rất lâu._
    ~ qh("bien_kich", 3)
* [😶 "Em không có chuyện gì để viết đâu chị."]
    bien_kich: Ai cũng nói vậy. Đây không phải đạo, đây là cảm hứng mà em.
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_editor ===
# npc:editor
editor: *(ngáp)* Anh Sơn… lịch dựng phim tuần này… anh xếp em ban đêm giúp em nha… ban ngày em… zzz…
* [📅 "Ừ. Anh xếp em từ 10 giờ tối tới 4 giờ sáng. Như mọi khi."]
    editor: Anh hiểu em nhất công ty… *(ngủ tiếp)*
    ~ qh("editor", 5)
* [🍵 Đắp cho nó cái áo khoác.]
    ~ qh("editor", 8)
    _{editor} co người trong áo khoác của bạn, lẩm bẩm: "Đợi render xong…"_
- editor: Anh Sơn… cái clip tối mất điện… anh Phát hát… em quay… có tiếng ai hát bè nữa. Anh biết ai không?
* [😶 "Anh không biết. Chắc gió."]
    editor: Gió hát đúng tông… *(mắt hé ra, nhìn bạn)* …em không hỏi nữa.
* [🎤 "Anh đó. Em đừng cắt tiếng anh ra nha."]
    editor: *(mở hẳn mắt)* Không cắt. Đó là phần hay nhất clip.
    ~ qh("editor", 8)
    ~ son_mo(2)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_designer ===
# npc:designer
designer: Sơn, poster Đêm Hồng phải có lịch chạy chương trình. Em cho chị giờ chính xác đi, đừng sửa nữa nha. Chị sửa 14 lần rồi.
* [📅 "Dạ đây chị. Chốt. Không sửa."]
    designer: Hứa?
    thanh_xin_nghi: Dạ… hứa tới khi sếp đổi ý ạ.
    designer: Hết cứu.
    ~ qh("designer", 3)
* [😅 "Dạ để em hỏi lại sếp…"]
    designer: Sửa nhẹ thôi là sửa cái gì ạ? *(gục xuống bàn)*
    ~ qh("designer", -3)
- designer: Mà… chủ nhật tuần trước em có thấy chị ở Ven Đô không? Gần tòa nhà… màu xanh đó?
* [😶 "Dạ không chị. Em không thấy gì đâu."]
    designer: *(thở ra)* Ừ. Cảm ơn em.
    ~ qh("designer", 8)
* [💬 "Dạ có. Chị đi lạc hả chị?"]
    designer: Ừ… lạc. Chị đi lạc. *(vẽ một đường lệch trên bản thiết kế)*
    ~ qh("designer", -3)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_sales ===
# npc:sales
sales: Sơn! Chị cần lịch Siêu Nhân Hồng chiều thứ 5 trống, để gặp Mr. Kevin Trộn ký hợp đồng. Chắc kèo!
* [📅 "Dạ chiều thứ 5 trống. Mà Mr. Kevin tới thật hả em?"]
    sales: Chị nói rồi, tin chị đi. *(nhìn đi chỗ khác)*
* [😅 "Huyền, em nhỏ hơn anh 2 tuổi mà xưng chị."]
    sales: Trong kinh doanh, ai chốt deal người đó là chị. Em chốt deal nhiều hơn anh mà.
    thanh_xin_nghi: Anh chốt được 31 lá đơn xin nghỉ đó.
    sales: *(bật cười)* Ờ… cái đó thì anh là chị.
    ~ qh("sales", 5)
- sales: Mà nè… nếu Mr. Kevin không tới thì anh xếp cho Siêu Nhân Hồng đi giúp người giờ đó luôn nha. Cho có cái quay.
* [🤝 "Được. Anh chừa luôn khung giờ giúp người. Có máy quay."]
    ~ son_khung_gio_giup_nguoi = true
    sales: Đó! Anh hiểu chị. À, em.
    ~ qh("sales", 5)
* [💬 "Huyền, Mr. Kevin có thật không?"]
    sales: *(im lặng 3 giây, lần đầu không có câu "chắc kèo")* …Anh xếp lịch giùm em đi.
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_chi_dai ===
# npc:chi_dai
chi_dai: Sơn! Ăn cơm chưa? Ngồi xuống chị kể cho nghe. Mà khoan, bà ngoại em khỏe chưa?
* [😅 "Dạ khỏe rồi chị."]
    chi_dai: Bà em ốm 7 lần trong năm mà khỏe lại 7 lần. Bà em là siêu nhân thật đó. Hơn thằng mặc đồ hồng.
* [😢 "Dạ… thật ra bà em chưa từng ốm chị."]
    chi_dai: *(nhìn bạn rất lâu)* Chị biết. Cả công ty biết. Chỉ có ông Tuấn còn đếm thôi.
    ~ qh("chi_dai", 5)
- chi_dai: Nghe nè. Đứa nào làm em khóc, chỉ mặt chị. Kể cả ông Tuấn.
* [🤝 "Dạ… chị ơi, nếu em nói em đi làm một việc không phải bà ngoại, chị có bênh em không?"]
    chi_dai: Việc đàng hoàng không?
    thanh_xin_nghi: Dạ đàng hoàng. Mà hơi… lấp lánh.
    chi_dai: Đàng hoàng thì chị bênh. Lấp lánh thì càng bênh.
    ~ qh("chi_dai", 8)
    ~ son_soi(-5)
* [😶 "Dạ em biết rồi chị."]
    chi_dai: Biết rồi thì ăn cơm. *(gắp thêm miếng chả)*
    ~ an(30)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: Sơn! Em ơi. Cái khoản 500 ngàn anh mượn em… lần này là trả thật. Tuần sau. Coin sắp x10.
* [😅 "Dạ anh cứ từ từ. Em chưa cần."]
    dan_dau_tu: Em tốt nhất công ty! Anh ghi em đứng đầu danh sách trả… sau Long, Huyền, Bảo, bác Bình.
    ~ qh("dan_dau_tu", 5)
* [💸 "Anh trả em 100 ngàn trước thôi cũng được anh. Em cần may đồ."]
    dan_dau_tu: *(lục ví, lục túi, lục ví lần nữa)* …50 được không em?
    ~ tien_cong(50000)
    ~ qh("dan_dau_tu", 2)
- dan_dau_tu: Mà em nè, em xếp lịch, em biết hết. Có ngày nào Siêu Nhân Hồng đi giúp người mà có camera không? Anh phân tích rồi, clip giúp người lên gấp 4 lần clip quảng cáo.
* [📅 "Dạ có. Em chừa khung giờ giúp người mỗi ngày."]
    dan_dau_tu: Đó! Số liệu thật! Lần này là lên thật! *(mở một file Excel bám bụi)*
    ~ son_khung_gio_giup_nguoi = true
    ~ follow(5000)
* [😶 "Dạ ổng tự đi, em không biết trước."]
    dan_dau_tu: Tiếc. Đó mới là mỏ vàng.
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Cháu Sơn. Hôm nay đi làm à? Ngồi uống ngụm trà đá đã.
* [🍵 "Dạ con cảm ơn bác."]
    ~ uong(20)
    ~ qh("bac_bao_ve", 5)
    bac_bao_ve: Bác ghi sổ ra vào. Cháu là người có số dòng ít nhất. Mà dòng nào cũng vội.
* [🤧 "Dạ… bác ơi, nếu có ai hỏi con ra cổng lúc mấy giờ…"]
    bac_bao_ve: Bác không thấy gì đâu.
    ~ qh("bac_bao_ve", 3)
    ~ son_soi(-3)
- bac_bao_ve: Cuối tuần bác về nhà vườn ở Ven Đô. Gần nhà cháu. Tối thứ 7 hôm nọ bác đi ngang quán cà phê, nghe ai hát hay lắm.
* [😶 "Dạ… chắc ca sĩ quán ạ."]
    bac_bao_ve: Thế à. *(uống trà)* Ca sĩ quán đội mũ lưỡi trai, đi con xe giống xe cháu.
* [🎤 "Dạ con đó bác."]
    bac_bao_ve: Ừ. Bác biết. Hát hay. Bác không nói ai đâu.
    ~ qh("bac_bao_ve", 10)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: {son_nguyen_mat_danh || son_nguyen_biet:Đặc vụ Kim Tuyến!|Sơn ơi!} Hồng không phải màu, Hồng là thái độ! Hôm nay lịch anh có gì?
* [📅 "Sáng quay, trưa chụp, chiều phỏng vấn. 4 giờ có 15 phút giúp người."]
    sieu_nhan_hong: 15 phút! Slay! Em là người duy nhất xếp lịch cho anh đi giúp người!
    ~ qh("sieu_nhan_hong", 5)
* [😅 "Anh ơi, hôm nay anh làm ơn đừng bỏ đi giữa chừng nha."]
    sieu_nhan_hong: Anh hứa! Trừ khi có ai cần giúp. Mà lúc nào cũng có ai cần giúp hết á. *(tạo dáng xin lỗi)*
- sieu_nhan_hong: *(giọng nhỏ lại, như người khác)* Sơn… em có bao giờ sợ người ta biết mặt thật của mình rồi hết thích mình không?
* [🎤 "Có anh. Ngày nào em cũng sợ."]
    sieu_nhan_hong: *(gõ nhẹ lên cái mũ)* Vậy mình là hội người giấu mặt. Hội có hai người.
    ~ qh("sieu_nhan_hong", 10)
* [😇 "Người thích anh thật thì thích cả cái mặt sau cái mũ."]
    sieu_nhan_hong: …Em nói như người đã thử rồi vậy.
    ~ qh("sieu_nhan_hong", 5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_tudo_cho ===
# npc:cho
cho: Gâu? *(ngửi giày bạn, hắt hơi vì một hạt kim tuyến)*
* [🌭 Đưa {cho} một cây xúc xích.]
    cho: Gâu gâu! *(vẫy đuôi tít mù)*
    ~ qh("cho", 10)
    { co(xuc_xich):
        ~ mat(xuc_xich)
    }
* [🎵 Ngân nga một câu hát cho {cho} nghe.]
    cho: …Ẳng? *(nghiêng đầu, rồi tru theo, lệch tông)*
    _Bạn bật cười. Khán giả trung thành nhất của bạn là một con chó._
    ~ qh("cho", 5)
    ~ son_mo(1)
- cho: Gâu! *(chạy tới gầm cầu thang, quay lại nhìn bạn, như rủ đi theo)*
* [🐾 Đi theo.]
    _Gầm cầu thang. Một đống đồ: chìa khóa, son môi, một chiếc găng tay hồng, một cái USB không nhãn… và một tờ lịch của bạn bị ngậm mất tuần trước._
    ~ qh("cho", 5)
    ~ uy_tin = uy_tin + 1
    _Bạn lấy lại tờ lịch. Để yên mọi thứ khác. Không phải việc của bạn._
* [😶 "Thôi, anh bận rồi Tuất."]
    cho: Grừ… *(nằm xuống, quay lưng)*
- -> END
