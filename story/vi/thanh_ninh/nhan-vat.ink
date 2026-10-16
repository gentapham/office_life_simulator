// ============================================================
// THÁNH NỊNH: NHI · HỘI THOẠI TỰ DO VỚI TỪNG NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== thanh_ninh_tudo_ran_doc ===
# npc:ran_doc
ran_doc: *(cười ngọt)* Chị {thanh_ninh}! Em mới mua bánh flan, chị ăn một cái nha. Mà sếp hôm nay vui hông chị?
+ [🙇 "Vui. Mà sếp vui là nhờ chị pha trà đúng 85 độ nha em."]
    ran_doc: Dạ chị giỏi ghê! 85 độ… *(ghi gì đó vào sổ)*
    _Bạn vừa tặng đối thủ một bí kíp. Miễn phí._
    ~ qh("ran_doc", 3)
+ [🐍 "Sếp vui hay buồn là chuyện của chị. Em lo bản tin nội bộ đi."]
    ran_doc: Dạ… em chỉ hỏi thăm thôi mà chị.
    ~ qh("ran_doc", -8)
    ~ tn_gian(3)
+ [💬 "Sao em quan tâm sếp dữ vậy? Em muốn gì?"]
    ran_doc: Em muốn… công ty mình thành công thôi chị. *(nụ cười không đổi, mắt thì có)*
    ~ qh("ran_doc", 2)
- ran_doc: À chị ơi, tối qua chị có thấy Siêu Nhân Hồng tháo găng tay hông? Tay ổng có vết sẹo hông chị?
+ [😶 "Chị bận lọc email sếp, đâu có rảnh nhìn tay người ta."]
    ran_doc: Dạ. *(cười)* Chị lọc email sếp hả? Chị giỏi thiệt.
    _Bạn vừa nói hớ. Bạn biết. {ran_doc} cũng biết._
+ [💬 "Có. Tay trái. Sao em hỏi?"]
    ran_doc: Dạ hông có gì. Em… tò mò thôi.
    ~ qh("ran_doc", 5)
    _Cái nụ cười lần này cứng hơn. Như có ai vừa giẫm lên vết thương cũ._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_giam_doc ===
# npc:giam_doc
_Sếp bước vào phòng. Bạn đọc mặt sếp: lông mày hơi chùng, cà vạt hơi lệch, điện thoại úp xuống bàn._
giam_doc: {thanh_ninh} à. Hôm nay anh thấy… ờ, anh không ép, tùy em… em thấy anh có già đi không?
+ [🙇 "Dạ anh trẻ hơn hôm qua đó anh! Cà vạt này trẻ ra năm tuổi!"]
    ~ tn_ninh(3)
    ~ tn_khen()
    giam_doc: Haha, em chỉ được cái nói khéo.
+ [😐 "Dạ… anh ngủ ít. Tối qua anh nhắn group lúc 22:00 rồi 1 giờ sáng còn online."]
    giam_doc: … Em để ý cả cái đấy à.
    ~ qh("giam_doc", 5)
    ~ tn_ninh(-1)
+ [🍵 Đặt ly trà sen xuống: "Anh uống đi rồi hãy hỏi em."]
    giam_doc: *(uống)* Ừ. Thế mới đúng là {thanh_ninh}.
    ~ qh("giam_doc", 3)
- giam_doc: Mà này… em thấy {ran_doc} thế nào? Anh định giao nó viết bài phát biểu thứ 2.
+ [🙇 "Dạ ẻm giỏi lắm anh. Mà bài thứ 2 anh vẫn để em viết nha, em quen giọng anh rồi."]
    ~ tn_ninh(4)
    ~ tn_sep_goi("nhi")
    giam_doc: Ừ, thôi em viết.
+ [🐍 "Dạ ẻm giỏi, giỏi lắm, giỏi tới mức em hơi lo anh ạ."]
    giam_doc: Lo gì? *(nhíu mày)*
    ~ qh("ran_doc", -5)
    ~ tn_ninh(1)
+ [😇 "Anh giao đi anh. Hai người viết thì bài hay hơn."]
    giam_doc: Ơ… em không ghen à? Hay đấy.
    ~ tn_gian(-3)
    ~ tn_sep_goi("hieu")
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_truong_phong ===
# npc:truong_phong
truong_phong: {thanh_ninh}, lịch sếp chiều nay trống không? Mình cần họp nhanh 5 phút về KPI họp.
+ [🚪 "Dạ chiều nay sếp kín rồi anh. Thứ 6 tuần sau nha anh."]
    truong_phong: Thứ 6 tuần sau? Thế thì mình họp để bàn xem họp lúc nào nhé.
    ~ qh("truong_phong", -3)
+ [🤝 "Dạ 3 giờ có 15 phút trống, anh lên liền đi."]
    truong_phong: 15 phút à? Ok, mình sync thật nhanh.
    ~ qh("truong_phong", 5)
    _3 giờ, {truong_phong} vào phòng sếp. 5 giờ 40 mới ra._
+ [💬 "Họp về KPI của họp hả anh? Chỉ số đó tính sao anh?"]
    truong_phong: Đơn giản. Số cuộc họp chia số quyết định. Tháng này là 47 chia 1.
    ~ qh("truong_phong", 2)
- truong_phong: À, nghe nói sếp đang cân nhắc ghế Phó Giám đốc. Sếp có nhắc tên ai không em?
+ [🙇 "Dạ sếp có nhắc anh đó anh, nhắc… à, nhắc mấy lần."]
    truong_phong: *(sáng mắt)* Thật à? Mấy lần?
    _Bạn nói dối. Sếp nhắc tên {truong_phong} đúng một lần: "{truong_phong} họp lâu thế."_
    ~ qh("truong_phong", 8)
+ [😶 "Dạ em hông được phép nói anh."]
    truong_phong: Hiểu. Hiểu. Take note.
+ [💬 "Anh với anh {con_ong_chau_cha}, anh nghĩ ai hợp hơn?"]
    truong_phong: Tất nhiên là… *(dừng lại)* … mình họp riêng về câu hỏi này sau nhé.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_hong_hot ===
# npc:hong_hot
hong_hot: {thanh_ninh} ơi! Nghe gì chưa? Mà thôi, bà ngồi gần sếp, bà nghe trước tui rồi. Kể đi!
+ [🧂 "Nói nhỏ nè: sếp mới đặt bộ gậy golf mới."]
    hong_hot: Gậy golf? Trời, chán. Có gì cay hơn hông?
    ~ qh("hong_hot", 2)
+ [😶 "Tui hông nghe gì hết. Thiệt."]
    hong_hot: Xạo! Bà đọc email sếp mà! Ai cũng biết!
    _"Ai cũng biết." Bạn tưởng đó là bí mật._
+ [💬 "Bà kể trước đi, rồi tui kể."]
    hong_hot: Ok! Hôm qua tui thấy {designer} sơn móng màu xanh lá chuối. Giống bà hôm trước á!
    _Bạn giấu tay vào túi áo._
    ~ qh("hong_hot", 4)
- hong_hot: Mà nè, cái group "Hội Anti Sếp" á, bà có muốn vô hông? Mỗi tối 200 tin nhắn, vui lắm.
+ [🙇 "Tui mà vô group chửi sếp hả? Bà điên hả?"]
    hong_hot: Ờ ha, quên, bà là fan cứng.
+ [🐍 "Vô. Mà đừng nói tui là ai."]
    hong_hot: Ok! Tên bà trong group là gì? {thanh_ninh} Nịnh hả? Haha!
    ~ qh("hong_hot", 5)
    _Group có một thành viên tên "Hoa Hướng Dương 1989", lúc nào cũng thả haha. Đăng nhập lúc 22:01. Một phút sau khi sếp nhắn group công ty. Bạn nhìn con số đó rất lâu._
    ~ phat_hien(clone_thang)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: {thanh_ninh} ơi, chú anh có trong phòng hông? Anh cần ký cái đề xuất tăng ngân sách cà phê.
+ [🙇 "Dạ anh {con_ong_chau_cha} vô liền đi anh! Sếp đang chờ anh đó!"]
    ~ qh("con_ong_chau_cha", 5)
    _Sếp không chờ ai cả. Sếp đang gọi cho ngân hàng._
    con_ong_chau_cha: *(mở cửa, đóng lại ngay)* Ờ… chú đang nói chuyện gì căng lắm.
+ [🚪 "Dạ sếp bận, để đề xuất đây nha anh."]
    con_ong_chau_cha: Ok, chill. Để anh gọi chú anh. *(gọi điện cho người ngồi cách 3 mét)*
    ~ qh("con_ong_chau_cha", -2)
+ [💬 "Ngân sách cà phê bao nhiêu vậy anh?"]
    con_ong_chau_cha: 30 triệu. Ủa sao không mua máy mới luôn?
    _Máy pha cà phê hỏng từ ngày 1/10. Bạn biết vì sao không ai sửa._
- con_ong_chau_cha: Mà {thanh_ninh}… em thấy anh có hợp làm Phó Giám đốc hông? Nói thiệt.
+ [🙇 "Dạ anh hợp nhất công ty luôn!"]
    con_ong_chau_cha: *(thở dài)* Ai cũng nói vậy hết.
    ~ qh("con_ong_chau_cha", 1)
+ [😐 "Dạ… em thấy anh hông thích ghế đó."]
    con_ong_chau_cha: … Sao em biết?
    _{con_ong_chau_cha} nhìn bạn như nhìn người đầu tiên đọc được mình._
    ~ qh("con_ong_chau_cha", 10)
    ~ tn_noi_that_1 = true
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: *(lướt Tóp-tóp)* {thanh_ninh}, nếu sếp hỏi tiến độ MV thì nói là 80% nha.
+ [💬 "Thiệt là bao nhiêu?"]
    chua_te_deadline: Thiệt là… 8%. Còn sớm mà, chill.
    ~ qh("chua_te_deadline", 2)
+ [🙇 "Ok, tui nói 90% luôn cho sếp vui."]
    chua_te_deadline: Bà là thiên thần.
    ~ qh("chua_te_deadline", 5)
    ~ tn_ninh(-1)
+ [👇 "Ông tự lên nói. Tui hông nói dối thay ông được."]
    chua_te_deadline: Ok mom.
    ~ qh("chua_te_deadline", -3)
- chua_te_deadline: Mà nè, sáng nào bàn tui cũng có quà màu hồng. Bên truyền thông lên kịch bản couple hả? Bà biết hông?
+ [😇 "Ông ơi… lỡ ổng thích ông thiệt thì sao?"]
    chua_te_deadline: *(ngưng lướt 3 giây)* … Hông đâu. PR mà.
    _Nhưng ông ấy không lướt tiếp._
    ~ qh("chua_te_deadline", 3)
    ~ qh("sieu_nhan_hong", 3)
+ [🧂 "Ờ, kịch bản đó. Cứ phối hợp đi."]
    chua_te_deadline: Ok. Content couple, để {hong_hot} lo.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ chị {thanh_ninh}, chị cần em làm gì không ạ? Em mới photo xong cho phòng kế toán ạ.
+ [👇 "Ừa, photo thêm cho chị 200 tờ lịch Đại Nhạc Hội nha."]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ em làm liền ạ!
    _Ba mươi tuổi. "Dạ em làm liền ạ." Không một chút chần chừ. Bạn không biết nên ngưỡng mộ hay áy náy._
+ [🤝 "Hông, {thuc_tap_sinh} ngồi nghỉ đi. Uống ly trà sen nè."]
    ~ qh("thuc_tap_sinh", 8)
    ~ tn_gian(-3)
    thuc_tap_sinh: Dạ… dạ em cảm ơn chị ạ. Trà ngon quá chị.
+ [💬 "{thuc_tap_sinh}, hồi trước {thuc_tap_sinh} làm gì vậy?"]
    thuc_tap_sinh: Dạ em… làm văn phòng thôi ạ. Văn phòng… có két sắt ạ.
    ~ qh("thuc_tap_sinh", 2)
- thuc_tap_sinh: Dạ chị ơi, chị có thấy anh {giam_doc} dạo này mệt không ạ? Em thấy anh ấy ký giấy mà tay run.
+ [🙇 "Sếp mệt vì lo cho cả công ty đó {thuc_tap_sinh}."]
    thuc_tap_sinh: Dạ… em hiểu ạ. Người lo nợ hay run tay như vậy ạ.
    _"Người lo nợ". Anh ấy nói câu đó như một người từng ngồi bên kia bàn._
    ~ tn_email(1)
+ [😇 "Ừ. Mệt lắm. {thuc_tap_sinh} để ý giùm chị nha."]
    thuc_tap_sinh: Dạ em để ý ạ!
    ~ qh("thuc_tap_sinh", 5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {thanh_ninh}. Hóa đơn tiền trà sen tháng này đâu em?
+ [🙇 "Dạ chị nhắc chuẩn quá chị ơi! Em gửi liền ạ."]
    ke_toan: Đừng khen chị. Gửi hóa đơn.
    ~ qh("ke_toan", 2)
+ [😶 Đưa xấp hóa đơn đã kẹp sẵn, đánh số từng tờ.]
    ke_toan: *(lật, gật)* … Được. Em là người duy nhất trong công ty kẹp hóa đơn đúng thứ tự.
    ~ qh("ke_toan", 6)
    ~ uy_tin = uy_tin + 2
+ [💬 "Chị ơi, trà sen để sếp đỡ căng mà chị. Tính vô chi phí tinh thần được hông?"]
    ke_toan: Không có hóa đơn là không có tiền. Không có mục "tinh thần".
- ke_toan: *(hạ giọng)* Em đọc email sếp. Em có thấy email nào… về trang 47 không?
+ [😇 "Dạ có. Hoàn gấp đôi. Em biết rồi chị."]
    ke_toan: *(nhắm mắt)* Vậy là có hai người không ngủ được.
    ~ phat_hien(trang_47)
    ~ tn_dong_minh_ke_toan = true
    ~ qh("ke_toan", 10)
+ [🙇 "Dạ em hông thấy gì đâu chị."]
    ke_toan: Ừ. Tốt. Đừng thấy.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_hr ===
# npc:hr
hr: {thanh_ninh} à, em rảnh không, lên phòng anh uống trà xíu.
_Câu nói đáng sợ nhất công ty. Nhưng đây là trà Ô Long, loại sếp thích._
+ [🙇 "Dạ anh pha trà khéo quá anh ơi, em học hỏi!"]
    hr: Anh chỉ muốn lắng nghe em thôi. Gần đây em có… đi đâu xa không? Ven Đô chẳng hạn?
    _Ven Đô. Nơi có tòa nhà kính xanh lá chuối._
+ [🚪 "Dạ em bận lịch sếp, để bữa khác nha anh."]
    hr: Ừ. Anh không ép. *(nụ cười như con dao bọc nhung)*
    ~ qh("hr", -3)
+ [💬 "Anh mời em uống trà là có chuyện gì hả anh?"]
    hr: Không có gì đâu em. Chỉ là sếp nói em làm việc… rất tận tâm. Anh muốn biết em có mệt không.
    ~ qh("hr", 3)
- hr: À, sếp có nhờ em gửi anh cái gì không? Một tập hồ sơ hồng chẳng hạn?
+ [😶 "Dạ em hông biết tập nào anh."]
    hr: Ừ. Tốt. *(nụ cười giãn ra một chút)*
+ [💬 "Tập hồ sơ hồng đó có tên em hông anh?"]
    hr: *(rót thêm trà)* Em uống thêm đi. Trà nguội mất ngon.
    _Không trả lời là một câu trả lời._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_it ===
# npc:it
it: Gì.
+ [🙇 "Anh {it} ơi máy sếp chậm quá, anh coi giùm em với. Anh giỏi nhất công ty mà."]
    it: Restart chưa?
    _Bạn restart. Máy chạy nhanh. Lời khen không có tác dụng gì với {it}._
+ [😇 "Em mang mì ly lên nè. Vị tôm chua cay."]
    it: … Ngồi.
    ~ qh("it", 8)
    _Hai người ăn mì trong phòng server, không nói câu nào. Ăn ngon._
    ~ an(25)
+ [💬 "Anh coi log đăng nhập email sếp giùm em được hông?"]
    it: Không.
    ~ qh("it", -3)
- it: Hộp thư sếp. Em đăng nhập từ 2 máy. Máy công ty. Và một máy tên "NHI-IPHONE".
+ [😶 "Dạ… sếp cho phép mà anh."]
    it: Ừ. Bật xác thực hai lớp đi.
    ~ qh("it", 2)
+ [😇 "Dạ. Em sẽ đăng xuất trên điện thoại."]
    it: Tốt.
    ~ qh("it", 5)
    ~ tn_xanh(-3)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen trong nhà)* Em biết anh là ai không?
+ [🙇 "Dạ anh {idol_het_thoi}, giọng ca vàng 'Công Viên', năm 2015 cả nước hát!"]
    idol_het_thoi: *(cười thật lòng lần đầu trong tuần)* Đúng! Đúng rồi em!
    ~ qh("idol_het_thoi", 8)
    ~ tn_khen()
+ [😶 "Dạ biết anh. Anh muốn gặp sếp hả?"]
    idol_het_thoi: Anh muốn gặp… anh cả. Anh cả của anh. Anh {giam_doc}.
    ~ qh("idol_het_thoi", 2)
- idol_het_thoi: Hợp đồng anh hết hạn 31/10. Em ngồi gần anh {giam_doc}… anh ấy có nói gì về anh không?
+ [🙇 "Dạ sếp nói anh là người đầu tiên sếp phát hiện, sếp quý anh lắm."]
    idol_het_thoi: *(gỡ kính ra một chút)* Thật hả em?
    _Một nửa sự thật. Nửa còn lại là sếp chưa nhắc gì tới hợp đồng._
    ~ qh("idol_het_thoi", 5)
+ [😐 "Dạ chưa anh. Anh lên nói với sếp đi anh, đừng đợi."]
    idol_het_thoi: … Em nói như {quan_ly_idol} vậy.
    ~ qh("idol_het_thoi", 3)
    ~ qh("quan_ly_idol", 3)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút. *(2 điện thoại cùng reo)* … {thanh_ninh}, xếp cho anh 15 phút gặp sếp chiều nay.
+ [🚪 "Dạ sếp kín lịch rồi anh, sáng mai 8 giờ được hông anh?"]
    quan_ly_idol: 8 giờ? Sếp tới 9 rưỡi mà em.
    _Bạn đã lộ: lịch sếp có lúc trống hơn bạn nói._
    ~ qh("quan_ly_idol", -3)
+ [🤝 "Dạ 4 giờ chiều nha anh, em giữ chỗ."]
    quan_ly_idol: Cảm ơn em. Chuyện này để anh lo, đừng ai đăng gì hết.
    ~ qh("quan_ly_idol", 6)
- quan_ly_idol: À {thanh_ninh}… nghe nói em hay qua bên Ven Đô hả? Anh có lần thấy xe em ở gần tòa nhà kính.
+ [😶 "Dạ em đi làm móng ở đó anh."]
    quan_ly_idol: Ừ. Anh cũng… đi làm móng ở đó. *(cười mệt mỏi)*
    _Hai người hiểu nhau không cần nói thêm._
    ~ phat_hien(ll_moi_thai)
+ [🙇 "Dạ hông anh, chắc anh nhìn nhầm."]
    quan_ly_idol: Chắc vậy. Anh hay nhìn nhầm lắm.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_bien_kich ===
# npc:bien_kich
bien_kich: {thanh_ninh}. Bài phát biểu của sếp lần trước có câu "ngọn hải đăng trên biển nợ". Ai viết?
+ [🙇 "Dạ em viết đó bà. Hay hông?"]
    bien_kich: Hay. Hơi lộ. "Biển nợ" á?
    _Bạn đỏ mặt. Bạn chép nhầm từ ghi chú cá nhân._
+ [😇 "Tui mượn của bà đó. Bài năm ngoái."]
    bien_kich: *(mỉm cười)* Đây không phải đạo, đây là cảm hứng. Tui hiểu mà.
    ~ qh("bien_kich", 5)
- bien_kich: Mà nè… tui đang viết một cuốn tiểu thuyết về công ty. Có nhân vật trợ lý. Bà muốn nhân vật đó kết thúc thế nào?
+ [🙇 "Thành Phó Giám đốc!"]
    bien_kich: Nhảm. Cần thêm nỗi đau.
+ [😢 "Được một người rủ ăn cơm mà hông cần khen ai."]
    bien_kich: *(dừng bút)* … Hay. Cái đó hay thật.
    ~ qh("bien_kich", 8)
    _Bạn vừa đưa cho người khác một câu thật. Hy vọng họ ghi công._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_editor ===
# npc:editor
editor: *(ngáp)* Chị {thanh_ninh}… sếp muốn sửa video lần thứ mấy rồi chị…
+ [🙇 "Lần cuối thôi em, sếp nói vậy."]
    editor: Lần cuối lần thứ 6. Đợi render xong…
    ~ qh("editor", -2)
+ [🤝 "Chị nói sếp video em đẹp rồi. Em đi ngủ đi."]
    editor: Thiệt hả chị? *(mắt sáng lên như vừa được render xong)*
    ~ qh("editor", 8)
    ~ tn_ninh(-1)
- editor: Chị… chị làm trợ lý lâu, chị có biết anh {quan_ly_idol} thích uống gì hông?
+ [💬 "Cà phê đen, không đường. Ly thứ tư trong ngày thì thêm sữa. Sao vậy em?"]
    editor: Hông… hông có gì. *(tai đỏ)*
    _Bạn giữ lịch của mọi người. Lịch trái tim thì không cần ai giữ, mà vẫn lộ._
    ~ qh("editor", 5)
+ [😶 "Chị chỉ nhớ đồ uống của sếp thôi em."]
    editor: Dạ…
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_designer ===
# npc:designer
designer: {thanh_ninh}, sếp nói poster "chưa đủ wow". Wow là bao nhiêu? Bà ngồi gần sếp, cho tui feedback cụ thể được không?
+ [🙇 "Sếp thích to, đỏ, có mặt sếp."]
    designer: Có mặt sếp trên poster Siêu Nhân Hồng?
    _Bạn gật. Bạn nói thật. Đó mới là vấn đề._
+ [😇 "Sếp chọn bản đầu tiên. Lần nào cũng vậy. Bà nộp lại bản 1 đi."]
    designer: *(nhìn bạn rất lâu)* … Bà là người đầu tiên nói thật về chuyện đó.
    ~ qh("designer", 10)
- designer: Mà… hôm Chủ nhật đó… bà không thấy tui ở đâu hết, đúng hông?
+ [😶 "Tui đi chợ Phố Cũ. Không thấy ai hết."]
    designer: Tui cũng vậy. Chợ Phố Cũ. Đông ghê.
    ~ qh("designer", 8)
    ~ phat_hien(quynh_lam_cho_ll)
+ [💬 "Bà làm job gì cho bên đó vậy?"]
    designer: Dự án "Hồng Ngoại". Nói là làm cho idol mới. Bà hỏi chi vậy?
    _"Hồng Ngoại". Bạn nhớ tên đó trong một email lạc vào hộp thư sếp._
    ~ phat_hien(quynh_lam_cho_ll)
    ~ qh("designer", -3)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_sales ===
# npc:sales
sales: Chị {thanh_ninh}! Chị xếp em 30 phút gặp sếp nha. Deal này chắc kèo, tin chị đi!
+ [🙇 "Dạ em giỏi quá, chị xếp liền."]
    sales: Chị {thanh_ninh} là nhất! Hôm nào em dẫn chị đi nhậu với Mr. Kevin Trộn!
    ~ qh("sales", 5)
+ [💬 "Deal với ai em? Có hợp đồng chưa?"]
    sales: Hợp đồng… đang in. Tin chị đi.
    _{sales} nhỏ hơn bạn hai tuổi, xưng "chị" với bạn rất tự nhiên. Bạn không dám cãi._
    ~ qh("sales", -2)
- sales: Mà chị {thanh_ninh}, chị khen sếp hay vậy, chị dạy em vài chiêu đi. Em nói phét giỏi mà khen dở lắm.
+ [😇 "Khen thì phải có một chút thật. Một chút thôi, mà phải thật."]
    sales: *(ghi lại)* Một chút thật… ok. Khó đó.
    ~ qh("sales", 6)
+ [🙇 "Chiêu một: anh nói chuẩn quá anh ơi."]
    sales: Anh nói chuẩn quá anh ơi! Anh nói chuẩn quá anh ơi! Được hông chị?
    _Nghe y như bạn. Bạn hơi rùng mình._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_chi_dai ===
# npc:chi_dai
{ tn_gian_chi_dai >= 70:
    chi_dai: *(không ngẩng lên)* Gì.
- else:
    { tn_gian_chi_dai <= 30:
        chi_dai: Ê {thanh_ninh}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
    - else:
        chi_dai: {thanh_ninh}. Có việc gì?
    }
}
+ [🙇 "Dạ chị hôm nay đẹp quá chị ơi!"]
    { tn_gian_chi_dai >= 60:
        chi_dai: Ờ. Em khen ổng xong rồi qua khen chị hả. Tiết kiệm lời đi.
        ~ tn_gian(10)
    - else:
        chi_dai: *(cười khẩy)* Bớt đi em.
        ~ tn_gian(3)
    }
+ [🤝 "Chị cần em phụ gì cho Đại Nhạc Hội hông chị?"]
    chi_dai: Có. Đếm ghế. 1.200 cái. Đếm sai thì đếm lại.
    ~ tn_gian(-5)
    ~ uy_tin = uy_tin + 2
    ~ nghi(-10)
+ [💬 "Chị ghét em thiệt hả chị?"]
    chi_dai: Chị ghét kiểu nịnh trên đạp dưới. Em mà bỏ được nửa sau thì chị bớt ghét nửa.
    ~ tn_gian(-3)
- { tn_so_lan_dap_duy >= 3:
    chi_dai: À. Thằng {thuc_tap_sinh} kể với chị, tuần này em sai nó {tn_so_lan_dap_duy} lần. Chị nhớ đó.
    ~ tn_gian(5)
}
-> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {thanh_ninh}, sếp có nói gì về thị trường không? Nghe nói sếp đang bán tài sản hả?
+ [😶 "Em không biết anh ơi."]
    dan_dau_tu: Không biết là có. Ok, short.
    ~ qh("dan_dau_tu", 1)
+ [🧂 "Sếp nói Hồng Coin sắp x10 đó anh."]
    dan_dau_tu: Thật hả? Lần này là lên thật!
    _Bạn vừa đùa. {dan_dau_tu} vừa all-in. Bạn ước gì mình chưa nói._
    ~ qh("dan_dau_tu", 5)
    ~ cang_thang(5)
- dan_dau_tu: Mà em cho anh mượn 500 nghìn tới thứ 6 được không? Anh trả lãi bằng coin.
+ [🤝 "Đây anh. Mà trả bằng tiền thật nha."]
    ~ tien_cong(-500000)
    ~ qh("dan_dau_tu", 10)
    dan_dau_tu: Chắc chắn! Em là cổ đông chiến lược của anh!
+ [🙅 "Dạ em hết tiền rồi anh."]
    dan_dau_tu: Hiểu. Hiểu. Thị trường khó khăn.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho khụ khụ rất có nhịp)* {thanh_ninh} ơi… mai tui xin nghỉ… bà ngoại…
+ [🚪 "Bà ngoại ông bệnh lần này là lần thứ mấy rồi?"]
    thanh_xin_nghi: Thứ… chín. Mà lần này nặng.
    ~ qh("thanh_xin_nghi", -2)
+ [🤝 "Ok, tui trình sếp lúc sếp đang vui."]
    thanh_xin_nghi: {thanh_ninh} là người tốt nhất tầng 2!
    ~ qh("thanh_xin_nghi", 6)
- thanh_xin_nghi: *(hạ giọng, giọng tự nhiên trong veo)* Mà {thanh_ninh}… lỡ bà thấy tui ở đâu đó trên tivi… bà giữ giùm tui nha.
+ {biet(son_thi_hat)} [🔒 "Thí sinh số 17 hát hay lắm. Tui bình chọn rồi."]
    thanh_xin_nghi: *(đỏ mặt)* Thiệt hả? Cảm ơn bà! Đừng nói anh {hr} nha!
    ~ qh("thanh_xin_nghi", 12)
+ [😶 "Tui coi tivi ít lắm."]
    thanh_xin_nghi: Tốt. Tốt quá.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Cháu {thanh_ninh}. Lại xuống lấy thư cho anh {giam_doc} à?
+ [🙇 "Dạ bác, có thư nào cho sếp con hông bác?"]
    bac_bao_ve: Có hai thư ngân hàng. Bác đưa tận tay anh ấy.
    _Bác không bao giờ đưa thư ngân hàng cho bạn. Ba năm rồi._
+ [😇 "Dạ con xuống uống trà với bác thôi."]
    bac_bao_ve: Ừ. Ngồi đi. *(rót trà đá)*
    ~ qh("bac_bao_ve", 6)
    ~ uong(25)
- bac_bao_ve: Cháu làm trợ lý ba năm rồi nhỉ. Có mệt không?
+ [🙇 "Dạ hông mệt bác, sếp tốt lắm."]
    bac_bao_ve: Thế à.
    _"Thế à" của bác nặng như một cuốn sổ._
+ [😢 "Dạ mệt bác. Con sợ bị đuổi."]
    bac_bao_ve: Người ta không đuổi người ở lại lúc khó đâu cháu. Người ta chỉ quên cảm ơn thôi.
    ~ qh("bac_bao_ve", 8)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: {thanh_ninh} ơi! Hồng không phải màu, Hồng là thái độ! *(tạo dáng)*
+ [🙇 "Dạ anh tạo dáng slay quá anh!"]
    sieu_nhan_hong: Thiệt hả? Hehe! Mà… anh hỏi thiệt, anh có giả trân hông?
    ~ qh("sieu_nhan_hong", 4)
+ [💬 "Anh ơi, anh có cần em xếp lịch gì hông anh?"]
    sieu_nhan_hong: Có! Em xếp cho anh 5 phút mỗi ngày ngồi gần anh {chua_te_deadline} được hông?
    _Bạn cười. Đó là cái lịch dễ thương nhất bạn từng được nhờ._
    ~ qh("sieu_nhan_hong", 5)
- sieu_nhan_hong: *(nhỏ giọng)* {thanh_ninh} viết bài cho sếp hay lắm. Hồi nào em viết cho anh vài câu nha. Anh cầm micro là run.
+ [😇 "Anh cứ nói điều anh thật sự nghĩ. Em sửa chính tả thôi."]
    sieu_nhan_hong: Điều anh thật sự nghĩ… *(im)* … Khó hơn đánh nhau với chó.
    ~ qh("sieu_nhan_hong", 8)
+ [🙇 "Dạ để em viết, em viết khen anh hết lời luôn."]
    sieu_nhan_hong: Ờm… vậy cũng được.
    ~ qh("sieu_nhan_hong", 2)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_tudo_cho ===
# npc:cho
cho: Gâu? *(nhìn ly trà sen trong tay bạn)*
+ [🙇 Cúi xuống: "{cho} đẹp trai quá! Lông bóng mượt, có tâm ghê!"]
    cho: … *(nghiêng đầu, không hiểu, nhưng thấy lạ)*
    ~ tn_khen()
+ {co(xuc_xich)} [🔒 🌭 Đưa xúc xích.]
    ~ mat(xuc_xich)
    ~ qh("cho", 15)
    cho: Gâu gâu! *(vẫy đuôi như cánh quạt)*
+ [😶 Đi qua.]
    cho: Grừ… *(ngửi gấu quần bạn, nhăn mũi)*
    { tn_xanh_la_chuoi >= 50:
        _{cho} hắt hơi. Ống quần bạn còn vương mùi nước hoa ở sảnh một tòa nhà kính._
        cho: GRỪ! *(sủa về phía Ven Đô)*
    }
- -> END
