// ============================================================
// IDOL HẾT THỜI · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== idol_het_thoi_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Anh {idol_het_thoi}! Em nghe nói nhỏ thôi nha… Nguyên được giao luôn phòng thu tầng 2 vào thứ 6. Giờ của anh đó. Em nói vậy thôi chứ không có ý gì đâu.
+ [😤 "Thiệt hả? Để anh lên giành lại."]
    ran_doc: Dạ anh cứ từ từ… mà em nghe nói vậy thôi nha.
    ~ qh("ran_doc", 5)
    ~ cang_thang(8)
    ~ phat_tt(3)
+ [💬 "Sao em kể anh nghe chuyện này?"]
    ran_doc: *(cười ngọt)* Tại em thương anh. Anh là ca sĩ thiệt mà, đúng hông?
    _Câu "đúng hông" nghe như một cái móc câu._
    ~ qh("ran_doc", 2)
+ [🕶️ "Phòng thu là của nghệ sĩ. Ai hát hay thì ở."]
    ran_doc: *(khựng lại nửa giây)* Dạ… anh nói chuẩn quá.
    ~ qh("ran_doc", -3)
    ~ phat_tt(-2)
- ran_doc: À mà anh, hồi nhỏ anh ở xóm nào vậy? Em hỏi vậy thôi.
+ [📖 "Anh ở quê. Lên thành phố học, hát quán cà phê."]
    ran_doc: Vậy là anh tự đi lên hả. Em cũng vậy.
    _Lần đầu tiên {ran_doc} nói một câu không có "nói nhỏ thôi nha"._
    ~ qh("ran_doc", 8)
+ [🕶️ "Anh ở trên sân khấu."]
    ran_doc: Dạ. Đỉnh ghê.
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {idol_het_thoi} à. Vào đây. Anh vừa đọc cái báo cáo lượt xem. Kênh em tháng này… ừ thì… có tinh thần đấy.
+ [🕶️ "Fan em tăng đều mà anh."]
    giam_doc: *(nhìn bạn qua cặp kính)* Ừ. Tăng đều. Đều như máy.
    _Anh {giam_doc} biết. Anh luôn biết._
    ~ phat_tt(3)
+ [📖 "Anh còn nhớ lần đầu anh nghe em hát hông?"]
    giam_doc: Nhớ chứ. Quán cà phê đầu ngõ, ly bạc xỉu, em lệch tông câu thứ ba. Anh về không ngủ được.
    ~ qh("giam_doc", 8)
    ~ phat_tt(-5)
    ~ phat_mo_quan_ca_phe = true
+ [💬 "Anh có mệt hông anh? Nhìn anh dạo này mệt quá."]
    giam_doc: *(khựng lại)* Mệt à? Không. Mindset của anh là… *(thở dài)* Ừ, mệt.
    ~ qh("giam_doc", 10)
- giam_doc: Thôi, em ra đi. Nhớ là anh không ép, tùy em… nhưng cố lên.
+ [😇 "Dạ. Em cố."]
    ~ qh("giam_doc", 3)
+ [🎤 Hát một câu "Công Viên" trước khi ra.]
    _Anh {giam_doc} không ngẩng lên, nhưng cây bút trên tay gõ theo nhịp._
    ~ qh("giam_doc", 5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_truong_phong ===
# npc:truong_phong
truong_phong: Anh {idol_het_thoi} ơi, mình sync nhanh 5 phút nhé. Về việc anh xuất hiện trong khung hình các buổi quay của Nguyên.
+ [🕶️ "Anh xuất hiện là có lý do nghệ thuật."]
    truong_phong: Cái lý do nghệ thuật ấy mình take note lại, họp tiếp sau nhé.
    ~ phat_tt(3)
    ~ qh("truong_phong", -3)
+ [😇 "Ừ, anh xin lỗi. Lần sau anh đứng ngoài."]
    truong_phong: Ơ… thế thì nhanh thật. Cuộc họp ngắn nhất của tớ tháng này đấy.
    ~ qh("truong_phong", 8)
    ~ phat_tt(-3)
- truong_phong: À mà… anh có biết dùng phần mềm dựng nhạc không? Hỏi thế thôi, không có gì đâu.
+ [💬 "Hông. Mà anh biết người biết. {editor}."]
    truong_phong: *(ho)* Ừ, {editor}… {editor} giỏi. Mình biết mà.
    ~ qh("truong_phong", 2)
+ [😶 "Hông. Anh chỉ biết hát."]
    truong_phong: Thế thì mình giống nhau. Tớ chỉ biết họp.
    ~ qh("truong_phong", 5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Anh {idol_het_thoi}! Anh đeo kính đen trong nhà nhìn sang quá anh ơi! Như ngôi sao thiệt luôn!
+ [🕶️ "Thì anh là ngôi sao mà."]
    thanh_ninh: Dạ anh nói chuẩn quá anh ơi! *(rồi quay sang tiếp tục gõ email, không nhìn bạn nữa)*
    ~ phat_tt(5)
+ [💬 "Em khen anh để làm gì vậy {thanh_ninh}?"]
    thanh_ninh: *(cười tươi hơn)* Dạ… tại anh là người của anh {giam_doc} quý nhất mà!
    _Ánh mắt {thanh_ninh} lướt qua màn hình. Một email có logo xanh lá chuối, đóng lại rất nhanh._
    ~ qh("thanh_ninh", 2)
- thanh_ninh: À anh ơi, lịch anh {giam_doc} tuần này kín rồi, anh muốn gặp thì nhắn em nha.
+ [😇 "Ừ, cảm ơn em."]
    ~ qh("thanh_ninh", 3)
+ [😤 "Anh gặp anh {giam_doc} mười một năm nay hông cần lịch."]
    thanh_ninh: Dạ… dạ em biết ạ.
    ~ qh("thanh_ninh", -5)
    ~ phat_tt(3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Anh {idol_het_thoi}! Nghe gì chưa? Có người thấy anh ngồi ghế đá công viên ôm đàn một mình đó! Anh luyện thanh hay anh thất tình vậy?
+ [🕶️ "Luyện thanh. Ngôi sao cũng cần không khí."]
    hong_hot: Ủa nghe chill ghê. Để em đăng story "Anh {idol_het_thoi} chill ở công viên" nha!
    ~ qh("hong_hot", 3)
    ~ phat_tt(3)
+ [😇 "Hát thôi. Hát cho người thật nghe."]
    hong_hot: *(dừng gõ điện thoại)* … Nghe hơi cảm động à nha. Em hông đăng đâu. Lần này thôi.
    ~ qh("hong_hot", 8)
    ~ phat_tt(-3)
- hong_hot: Mà nè, anh có tin gì hông? Tin gì cũng được. Em đổi cho anh một tin.
+ [🤫 "Hông có. Anh giữ miệng."]
    hong_hot: Chán anh ghê! Thôi em kể không công: hôm qua anh {quan_ly_idol} ngủ gục trong xe, ôm hai cái điện thoại như ôm gối.
    ~ qh("hong_hot", 2)
+ [🧂 "Có. Máy pha cà phê tầng 1 là do anh làm hư."]
    hong_hot: TRỜI ĐẤT! Chuyện lớn! *(chạy đi)*
    ~ qh("hong_hot", 5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Anh {idol_het_thoi}. Chill hông? Em mới mua máy pha cà phê cho phòng Marketing. Anh uống thử.
+ [☕ Uống thử: "Ngon. Mà sao em không mua cho tầng 1 luôn?"]
    con_ong_chau_cha: Ủa sao không mua cái mới luôn? À… tại tầng 1 không phải phòng em.
    _Rồi {con_ong_chau_cha} im một lúc. "Hay em mua thiệt ha."_
    ~ qh("con_ong_chau_cha", 5)
    ~ uong(15)
+ [🕶️ "Anh chỉ uống cà phê ở quán cà phê đầu ngõ năm 2015."]
    con_ong_chau_cha: Quán đó đóng cửa rồi anh. Giờ là tiệm trà sữa.
    ~ phat_tt(3)
- con_ong_chau_cha: Mà anh {idol_het_thoi}… anh viết "Công Viên" mất bao lâu?
+ [📖 "Một đêm. Rồi mười một năm hông viết được bài nào nữa."]
    con_ong_chau_cha: *(nhìn bạn rất lâu)* Em hiểu cảm giác đó. Theo kiểu ngược lại.
    ~ qh("con_ong_chau_cha", 10)
    ~ phat_tt(-5)
+ [🕶️ "Thiên tài thì không đếm thời gian."]
    con_ong_chau_cha: Chill ghê.
    ~ qh("con_ong_chau_cha", 2)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: Anh {idol_het_thoi}. Anh tới 11 giờ mà hông bị phạt. Bí kíp gì chỉ em với.
+ [🕶️ "Bí kíp là nổi tiếng trước đã."]
    chua_te_deadline: Ok mom. Vậy em thua từ vòng gửi xe.
    ~ qh("chua_te_deadline", 3)
+ [😇 "Bí kíp là hông có giờ làm. Mà cũng hông có lương làm thêm."]
    chua_te_deadline: Ờ ha. Vậy thôi em chịu phạt.
    ~ qh("chua_te_deadline", 5)
- chua_te_deadline: Mà anh nè… cái ông Nguyên tặng em gối ôm hồng. Anh nghĩ ổng PR hay ổng thiệt?
+ [💬 "Anh nghĩ người ta tặng gối thì hông phải PR. PR thì tặng cái gì chụp hình đẹp."]
    chua_te_deadline: *(ngừng lướt Tóp-tóp)* …Chill. Để em nghĩ. Mai em nghĩ.
    ~ qh("chua_te_deadline", 8)
+ [🕶️ "PR. Showbiz cái gì cũng PR."]
    chua_te_deadline: Ừ. Em cũng nghĩ vậy. *(nhưng tay vẫn cầm điện thoại có hình nền màu hồng)*
    ~ qh("chua_te_deadline", 2)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh {idol_het_thoi}! Anh cần em pha cà phê, xếp ghế hay cầm micro giùm hông ạ?
+ [🤝 "Hông cần gì hết. Ngồi xuống nghỉ đi {thuc_tap_sinh}, ông đi từ 7 giờ sáng rồi."]
    thuc_tap_sinh: Dạ… dạ em nghỉ được hả anh? *(ngồi xuống, ngủ gục sau 40 giây)*
    ~ qh("thuc_tap_sinh", 10)
    ~ phat_tt(-3)
+ [🕶️ "Cầm micro giùm anh. Ngôi sao không tự cầm micro."]
    thuc_tap_sinh: Dạ! *(cầm micro bằng hai tay như cầm cúp)*
    ~ qh("thuc_tap_sinh", 2)
    ~ phat_tt(3)
- thuc_tap_sinh: Anh {idol_het_thoi}… em hỏi ngu nha. Hồi anh mới đi hát, anh có sợ hông?
+ [📖 "Sợ. Giờ vẫn sợ. Sợ người ta quên."]
    thuc_tap_sinh: Dạ… em bỏ ngân… à, em bỏ nghề cũ để vô đây, em cũng sợ lắm ạ.
    _"Ngân…" gì? {thuc_tap_sinh} ho một tiếng, đổi chủ đề rất nhanh._
    ~ qh("thuc_tap_sinh", 10)
    ~ phat_tt(-5)
+ [🕶️ "Ngôi sao không biết sợ."]
    thuc_tap_sinh: Dạ, em ghi lại ạ.
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {idol_het_thoi}. Cát-xê đám cưới tuần rồi. Hóa đơn đâu em?
+ [🕶️ "Cát-xê ngôi sao không có hóa đơn, bà ơi."]
    ke_toan: *(nói chậm, rõ)* Không có hóa đơn là không có tiền. Ngôi sao cũng vậy.
    ~ qh("ke_toan", -5)
    ~ phat_tt(3)
+ [😇 "Lần sau tui xin mẹ cô dâu xuất hóa đơn. Mà bả có xuất hông thì tui hông chắc."]
    ke_toan: Ừ. Có ý thức là được. Tui ghi nhận.
    ~ qh("ke_toan", 5)
- ke_toan: Mà nè. Tháng này lương về trễ, ông có cần ứng hông?
+ [💸 "Có. Cho tui ứng 2 triệu."]
    ke_toan: Ký đây, đây, với đây. Ba chữ ký. Ứng tiền lương của chính mình mà ba chữ ký đó.
    ~ tien_cong(2000000)
    ~ qh("ke_toan", 2)
+ [😶 "Thôi bà. Tui tự lo."]
    ke_toan: *(nhìn bạn một lúc)* Ừ. Mà nếu kẹt quá thì nói tui. Tui hông hỏi hóa đơn lần đó.
    ~ qh("ke_toan", 8)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_hr ===
# npc:hr
hr: Anh {idol_het_thoi}, anh rảnh không, lên phòng anh uống trà xíu.
+ [😰 "Ủa có chuyện gì hả ông?"]
    hr: *(mỉm cười)* Không có gì đâu. Anh chỉ muốn lắng nghe em thôi. Mình cùng nhìn lại hành trình mười một năm nha.
    _Bạn uống ba ly trà ô long. {hr} hỏi về "kế hoạch phát triển bản thân sau 31/10". Bạn đổ mồ hôi._
    ~ cang_thang(10)
    ~ qh("hr", 3)
+ [🕶️ "Ngôi sao không uống trà với HR."]
    hr: *(vẫn mỉm cười)* Dạ. Anh ghi nhận.
    _{hr} ghi gì đó vào cuốn sổ đen. Cuốn sổ mỏng hơn tuần trước một trang._
    ~ qh("hr", -5)
    ~ phat_tt(3)
- hr: À anh {idol_het_thoi}, ông có thấy {thanh_xin_nghi} hôm nay đâu không?
+ [🤝 "Thấy. Nó đi khảo sát địa điểm quay cho Nguyên."]
    hr: *(nhìn bạn rất lâu)* Thế à.
    ~ qh("thanh_xin_nghi", 5)
    ~ qh("hr", -2)
+ [😶 "Hông để ý."]
    hr: Dạ.
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_it ===
# npc:it
it: Anh. Mic phòng thu hư. Lỗi người dùng.
+ [🕶️ "Mic hư là lỗi mic. Anh hát chuẩn mà."]
    it: Anh hát vô mic lúc đang cầm ly trà sữa. Trà sữa vô mic.
    ~ qh("it", -2)
    ~ phat_tt(2)
+ [😇 "Ừ, lỗi anh. Sửa giùm anh nha, anh mua mì ly cho."]
    it: *(gật)* Hai ly. Vị tôm chua cay.
    ~ qh("it", 8)
    ~ tien_cong(-20000)
- it: …Năm 2016. Anh hát hội chợ. Em kéo dây loa. Mưa. Điện giật.
+ [📖 "Anh nhớ rồi. Em nhảy lên, khán giả tưởng múa phụ họa."]
    it: *(khóe miệng nhếch lên, gần như cười)* Ừ.
    ~ qh("it", 10)
+ [💬 "Sao em ở lại công ty lâu vậy?"]
    it: Không ai sửa wifi.
    _Câu trả lời của {it} lúc nào cũng có một nửa không nói ra._
    ~ qh("it", 3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: *(một tay cầm hai điện thoại, tay kia ly cà phê)* {idol_het_thoi}, khoan, anh nghe máy chút… Ừ, ừ. Rồi. Em nói đi, sao đó?
+ [💬 "Anh uống ly thứ mấy rồi?"]
    quan_ly_idol: *(nhìn ly)* Ly thứ… tư. Hay năm. Em đếm giùm anh đi.
    idol_het_thoi: Năm. Thôi đưa em.
    _Bạn cầm ly cà phê của anh đi. Anh nhìn theo, không phản đối._
    ~ qh("quan_ly_idol", 8)
+ [🕶️ "Chiều nay có show gì cho em hông anh?"]
    quan_ly_idol: Khai trương tiệm nail 5 giờ. Đừng đeo kính trong tiệm nha, tối lắm, em vấp.
    ~ qh("quan_ly_idol", 2)
+ [🎤 Ngân nga "Công Viên" thay vì trả lời.]
    _Anh {quan_ly_idol} đứng im. Hai cái điện thoại cùng reo. Anh không nghe máy nào cho tới hết câu._
    ~ qh("quan_ly_idol", 10)
- quan_ly_idol: Mà em ăn gì chưa? Anh có ổ bánh mì nè, chia đôi.
+ [🥖 "Ăn rồi." Rồi vẫn cầm nửa ổ bánh mì.]
    ~ an(20)
    ~ qh("quan_ly_idol", 5)
+ {phat_biet_chuoichien89} [🔒 "Tối nay ChuoiChien89 đăng gì vậy anh?"]
    quan_ly_idol: *(đỏ tai)* Đăng là… "Anh {idol_het_thoi} hôm nay vẫn ăn bánh mì." Em đừng có chọc.
    ~ qh("quan_ly_idol", 12)
    ~ phat_tt(-3)
+ [😶 "Anh ăn đi. Anh ốm nhom à."]
    quan_ly_idol: *(cười)* Ừ. Anh ăn.
    ~ qh("quan_ly_idol", 6)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Anh {idol_het_thoi}. Kịch bản đời anh cần thêm nỗi đau. Một ca sĩ một bài, mười một năm… Anh cho em mượn đời anh làm chất liệu nhé?
+ [🕶️ "Đời anh không phải bi kịch. Là sử thi."]
    bien_kich: *(ghi vào sổ bìa da)* "Nhân vật tự nhận đời mình là sử thi." Hay. Cảm ơn anh.
    ~ phat_tt(3)
    ~ qh("bien_kich", 3)
+ [💬 "Em viết về anh thì ghi tên ai?"]
    bien_kich: *(dừng bút)* Đây không phải đạo, đây là cảm hứng.
    _{bien_kich} nói câu đó nhanh như đã tập rất nhiều lần._
    ~ qh("bien_kich", -3)
- bien_kich: Mà anh có nỗi đau nào lớn nhất không?
+ [📖 "Sợ bị quên."]
    bien_kich: *(gập sổ lại)* Cái này em không ghi. Cái này của anh.
    ~ qh("bien_kich", 10)
    ~ phat_tt(-5)
+ [🕶️ "Nỗi đau lớn nhất là chưa có ai viết phim về anh."]
    bien_kich: Đợi tiểu thuyết của em nhé. *(rồi lỡ miệng, ho một tiếng)* À… bài báo của em.
    ~ qh("bien_kich", 2)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_editor ===
# npc:editor
editor: *(ngáp)* Dạ… anh {idol_het_thoi}. Em đang render. Anh cần gì hông anh?
+ [💬 "Mấy video 'tiện tay' trên kênh anh tuần nào cũng có. Em biết ai làm hông?"]
    editor: *(ngừng tay)* Dạ… thuật toán Diu-túp đó anh. Anh {quan_ly_idol} nói vậy.
    _{editor} trả lời không nhìn bạn. Và vành tai đỏ lên._
    ~ qh("editor", 3)
+ [😇 "Em ngủ chút đi. Render tự chạy mà."]
    editor: Dạ… render xong là xong. Xong em ngủ.
    ~ qh("editor", 5)
- editor: Anh {idol_het_thoi}… anh có biết anh {quan_ly_idol} thích uống cà phê kiểu gì hông?
+ [📖 "Đen đá ít đường. Mà ly thứ năm thì ảnh uống sữa cho đỡ xót ruột."]
    editor: *(ghi vào ghi chú điện thoại)* Dạ… cảm ơn anh.
    _Bạn biết chuyện đó mà không biết vì sao mình biết._
    ~ qh("editor", 10)
+ [🕶️ "Hỏi chi vậy? Em mua cho ảnh hả?"]
    editor: *(cúi gằm)* Dạ hông… em hỏi vậy thôi.
    ~ qh("editor", 2)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_designer ===
# npc:designer
designer: Anh {idol_het_thoi}. Poster đám cưới của anh, mẹ cô dâu muốn sửa chữ "Phát" to hơn chữ "Cô dâu". Sửa nhẹ thôi là sửa cái gì ạ?
+ [😇 "Sửa ngược lại đi. Tên cô dâu to nhất. Hôm đó là ngày của người ta."]
    designer: *(nhìn bạn ngạc nhiên)* Lần đầu có người nhờ em sửa cho ĐÚNG đó anh.
    ~ qh("designer", 10)
    ~ phat_tt(-5)
+ [🕶️ "Ừ, chữ {idol_het_thoi} to hơn. Fan anh cần thấy."]
    designer: *(thở dài)* Dạ. Lần sửa thứ 9.
    ~ qh("designer", -5)
    ~ phat_tt(3)
- designer: Mà anh nè… màu tím của anh với màu hồng của Nguyên đứng chung poster thì hợp lắm. Em nói vậy thôi.
+ [🎨 "Thiệt hả? Em vẽ thử anh coi."]
    designer: Dạ để em vẽ… à, khi nào em rảnh. *(liếc cái laptop thứ hai đang mở)*
    ~ qh("designer", 5)
+ [😤 "Tím với hồng là hai phe."]
    designer: Hết cứu.
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_sales ===
# npc:sales
sales: Anh {idol_het_thoi}! Tin chị đi, chị book cho anh show 50 triệu bên BTT Global. Chắc kèo! Anh ký trước giấy cam kết giùm chị.
+ [🕶️ "50 triệu là giá năm 2015 rồi em. Giờ phải 80."]
    sales: Ok 80! Chị quen hết mà!
    _Không ai trong hai người tin số nào._
    ~ qh("sales", 5)
    ~ phat_tt(3)
+ [💬 "Show ở đâu, ngày nào, ai là đầu mối?"]
    sales: *(cười tươi, nhìn đi chỗ khác)* Để tối nay chị nhậu với bên đó rồi báo anh.
    ~ qh("sales", -3)
- sales: Mà anh nè… Đại Nhạc Hội chị lỡ hứa mời "ca sĩ nổi tiếng nhất nước". Anh có quen ai hông?
+ [🎤 "Có. Em đang nói chuyện với người đó."]
    sales: *(nhìn bạn hai giây)* … Được! Chị chốt anh! Tin chị đi!
    ~ qh("sales", 8)
    ~ phat_tt(3)
+ [😇 "Hông quen. Mà nếu cần, anh hát 'Công Viên' bản remix cứu em."]
    sales: Anh… anh nói thiệt hả? Lần đầu có người chịu gánh lời chị hứa.
    ~ qh("sales", 12)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {idol_het_thoi}. Ăn cơm chưa? Ngồi xuống đây. Đeo kính đen trong nhà là sao? Đau mắt hả?
+ [🕶️ "Phong cách đó bà."]
    chi_dai: Phong cách vấp cầu thang hả? Hôm qua tui thấy rồi đó.
    ~ phat_tt(2)
+ [😇 Tháo kính ra, ngồi xuống.]
    chi_dai: Đó. Mặt mũi sáng sủa vậy mà che. Ăn đi.
    _{chi_dai} xới cho bạn một chén cơm đầy, gắp thêm miếng sườn._
    ~ an(30)
    ~ qh("chi_dai", 10)
    ~ phat_tt(-5)
- chi_dai: Thằng Nguyên nó hát bài ông sai lời hoài. Ông có giận hông?
+ [😤 "Giận chứ. Bài của tui mà."]
    chi_dai: Giận thì dạy nó. Đứng đó giận thì bài cũng không đúng lời được.
    ~ qh("chi_dai", 3)
+ [📖 "Giận. Mà nghe nó hát, tui thấy bài mình còn có người hát."]
    chi_dai: *(vỗ vai bạn mạnh tới mức đau)* Vậy mới là ca sĩ.
    ~ qh("chi_dai", 10)
    ~ phat_tt(-5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {idol_het_thoi}! Kèo thơm: coin mới, tên là "Cá Viên Coin". Nghe là thấy hợp ông rồi. Lần này là lên thật.
+ [💸 "Bao nhiêu một suất?"]
    dan_dau_tu: Một triệu. Tuần sau x5. Đây là đáy, đáy thật rồi.
    ++ [Đưa 1 triệu.]
        ~ tien_cong(-1000000)
        dan_dau_tu: Ông sẽ cảm ơn tui! *(và bạn không bao giờ thấy lại 1 triệu đó)*
    ++ [Rút tay lại.]
        dan_dau_tu: Hối hận đó nha.
+ [😶 "Anh trả em 500 nghìn trước đi rồi tính."]
    dan_dau_tu: *(ho)* À… ờ… lên thật thì trả gấp ba.
    ~ qh("dan_dau_tu", -2)
- dan_dau_tu: Mà nè, tui coi số liệu: kênh ông có cụm tài khoản like y chang giờ, y chang câu. Ông biết hông?
+ [🤫 "Hông biết. Chắc fan tổ chức."]
    dan_dau_tu: *(nhìn bạn, gật gù)* Ừ. Fan tổ chức kỷ luật ghê.
    ~ phat_tt(3)
+ [😇 "Biết. Đừng nói ai nha anh."]
    dan_dau_tu: Tui cũng có cái phải giấu. Mình huề.
    ~ qh("dan_dau_tu", 8)
    ~ phat_tt(-3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho nhẹ)* Anh {idol_het_thoi}… em hơi sốt. Chiều nay đám cưới quận 3, em đổi lịch anh qua 6 giờ nha.
+ [😇 "Ừ, đổi đi. Em về nghỉ."]
    thanh_xin_nghi: Dạ em cảm ơn anh! *(bước đi nhanh, nhanh không giống người sốt)*
    ~ qh("thanh_xin_nghi", 8)
+ [🕶️ "Ngôi sao không đổi lịch vì người khác sốt."]
    thanh_xin_nghi: Dạ… *(ho mạnh hơn)* … dạ.
    ~ qh("thanh_xin_nghi", -5)
    ~ phat_tt(3)
- thanh_xin_nghi: Anh {idol_het_thoi}… em hỏi chút. Bộ vest kim tuyến năm 2015 anh còn giữ hông anh?
+ [🤝 "Còn. Em cần mượn hả?"]
    thanh_xin_nghi: Dạ… cho em mượn một tuần. Đi… đám cưới bà con.
    { biet(son_thi_hat):
        idol_het_thoi: Đám cưới bà con ở Đài Tivi Hóng hả?
        thanh_xin_nghi: *(đứng hình)* Anh… anh đừng nói ai nha anh.
    }
    ~ qh("thanh_xin_nghi", 12)
+ [🕶️ "Đồ diễn của anh là bảo vật quốc gia."]
    thanh_xin_nghi: Dạ… em hỏi vậy thôi.
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: {idol_het_thoi} à. Ngồi uống chén trà đá. Hôm nay đi làm sớm thế, mới 10 giờ 50.
+ [😇 "Dạ, con ngồi chút."]
    _Bác rót trà. Radio phát một bài hát cũ. Hai người ngồi im._
    bac_bao_ve: Năm 2015 cháu đứng ở cổng này ký tặng cả buổi chiều. Bác nhớ.
    ~ qh("bac_bao_ve", 8)
    ~ uong(15)
+ [🕶️ "Con có show bác ơi, con đi liền."]
    bac_bao_ve: Ừ. Đi cẩn thận.
- bac_bao_ve: Cháu có biết vì sao người ta thôi nhớ một bài hát không?
+ [💬 "Tại có bài mới hay hơn hả bác?"]
    bac_bao_ve: Không. Tại người hát thôi hát cho người ta. Chỉ hát cho mình.
    _Bác nói xong, uống một ngụm trà, như chưa nói gì._
    ~ qh("bac_bao_ve", 5)
    ~ phat_tt(-5)
+ [😶 Lắc đầu.]
    bac_bao_ve: Bác cũng không biết. Bác chỉ trông xe thôi.
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: *(tạo dáng)* Anh {idol_het_thoi}! Hồng không phải màu, Hồng là thái độ! Anh dạy em cách cầm micro cho ngầu đi anh!
+ {phat_tinh_tuong <= 60} [🎤 "Cách miệng một nắm tay. Đừng nhìn xuống đất. Nhìn người hàng cuối."]
    sieu_nhan_hong: *(cầm thử)* Vầy hả anh? Ủa nhìn hàng cuối thì người hàng đầu buồn hông?
    idol_het_thoi: Hàng đầu đã thương em rồi. Hàng cuối mới cần em nhìn.
    ~ qh("sieu_nhan_hong", 12)
    ~ phat_day_nguyen = true
    ~ follow(5000)
+ [🕶️ "Ngầu là bẩm sinh. Không dạy được."]
    sieu_nhan_hong: Dạ… vậy chắc em hông có rồi. *(cười, hơi buồn)*
    ~ qh("sieu_nhan_hong", -3)
    ~ phat_tt(3)
+ [🍌 "Em hát lại câu 'thích ăn…' coi."]
    sieu_nhan_hong: Thích ăn… CHUỐI chiên! Đúng hông anh?
    ~ phat_sua_loi_nguyen = phat_sua_loi_nguyen + 1
    ~ qh("sieu_nhan_hong", 5)
- sieu_nhan_hong: Anh {idol_het_thoi}… hồi anh nổi, anh có sợ người ta biết anh là ai hông?
+ [📖 "Hồi đó anh sợ người ta biết anh không giỏi như họ tưởng. Giờ anh sợ người ta không biết anh luôn."]
    sieu_nhan_hong: *(im lặng, rồi nói nhỏ)* Em cũng sợ cái đầu. Sợ tháo mũ ra là hết.
    ~ qh("sieu_nhan_hong", 10)
    ~ phat_tt(-5)
+ [🕶️ "Ai cũng biết anh là ai."]
    sieu_nhan_hong: Dạ. Em ganh với anh ghê.
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_tudo_cho ===
# npc:cho
_{cho} nằm trước chòi bảo vệ, ngẩng đầu nhìn bạn. Rồi nhìn túi áo bạn. Rồi nhìn bạn._
cho: Gâu.
+ {co(xuc_xich)} [🌭 Đưa {cho} một cây xúc xích.]
    ~ mat(xuc_xich)
    cho: Gâu gâu! *(vẫy đuôi tới mức cả mông lắc theo)*
    ~ qh("cho", 15)
+ {co(ca_vien_chien)} [🍢 Đưa {cho} một xiên cá viên chiên.]
    ~ mat(ca_vien_chien)
    cho: *(ngửi, ăn, nhìn bạn như vừa phát hiện bài hát hay nhất đời)* Gâu!
    ~ qh("cho", 12)
+ [🎤 Hát cho {cho} nghe "Công Viên".]
    cho: Ẳng… *(tru theo ở nốt cao, tru đúng tông hơn bạn)*
    ~ qh("cho", 5)
    ~ cang_thang(-5)
+ [🕶️ Đi ngang, không nhìn.]
    cho: Grừ… *(nhưng không sủa, vì bạn không mặc đồ hồng)*
- _Phía xa, một chiếc xe màu hồng đỗ lại. Lông {cho} dựng đứng._
+ [🐾 Ngồi xuống cạnh {cho}: "Tao biết. Tao cũng vậy."]
    cho: Gâu. *(tựa đầu vào đầu gối bạn)*
    ~ qh("cho", 10)
+ [😇 "Thôi, đừng sủa. Nó cũng không có ác ý đâu."]
    cho: Grừ… *(nằm xuống, nhưng tai vẫn dựng)*
    ~ qh("cho", 2)
- -> END
