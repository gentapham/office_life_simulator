// ============================================================
// CHÚA TỂ DEADLINE · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// Game mở cảnh khi người chơi bắt chuyện với NPC (thẻ npc:<mã>).
// ============================================================

// ------------------------------------------------------------
=== chua_te_deadline_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Ủa ông producer! Nói nhỏ thôi nha… dạo này ông với anh Hồng là sao vậy? Sáng nào tui cũng thấy quà hồng trên bàn ông.
* [😎 "Content couple. Bên truyền thông lo, tui phối hợp."]
    ran_doc: *(cười rất ngọt)* À, PR hả. Tui cũng nghĩ vậy. Người như ảnh mà thích ai thật thì lạ lắm.
    ~ vu_tin_that_long = vu_tin_that_long - 3
* [😶 "Chuyện của tui, ông hóng làm gì?"]
    ran_doc: Tui chỉ quan tâm thôi mà. Tui nói vậy thôi chứ hổng có ý gì đâu.
    ~ qh("ran_doc", -3)
* [💬 "Ông quen ảnh từ trước hả? Sao ông hay nhìn tay ảnh vậy?"]
    ran_doc: *(khựng nửa giây)* Đâu có. Ông tưởng tượng. Chắc ông thức khuya quá.
    ~ qh("ran_doc", -5)
- ran_doc: Mà nè, ông cho tui xin cái bảng tiến độ Đêm Hồng được hông? Để tui viết bản tin nội bộ cho chuẩn.
* [📋 Gửi luôn, có gì đâu.]
    ran_doc: Cảm ơn ông nha! Ông dễ thương ghê.
    _Bạn không biết rằng từ giờ, {ran_doc} biết chính xác giờ nào Siêu Nhân Hồng ở đâu._
    ~ qh("ran_doc", 8)
    ~ follow(-3000)
* [🙈 "Bảng đó có một thanh thôi à. 31/10: làm hết."]
    ran_doc: *(cười)* Ông này vui ghê. Thôi để tui hỏi chị {hong_hot}.
* [🤝 "Bản tin thì tui gửi bản tóm tắt. Bảng chi tiết thì chỉ đoàn quay giữ."]
    ran_doc: Ờ… Cũng được. Ông kỹ ghê ta.
    ~ uy_tin = uy_tin + 2
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {chua_te_deadline}! Vào đây. Ngồi đi. Anh hỏi thật, chiến dịch đến đâu rồi? Anh không ép, tùy em trả lời.
* [😇 Báo cáo đúng con số người theo dõi hiện tại.]
    giam_doc: {nguoi_theo_doi}. Ừ… ừ. Anh cảm ơn em đã nói thẳng. Ít ai nói thẳng với anh.
    ~ qh("giam_doc", 5)
* [📊 "Dạ, đang đúng kế hoạch anh. Chill."]
    giam_doc: "Chill". Anh không hiểu chữ đấy, nhưng anh thích cái giọng của em khi nói nó.
    ~ qh("giam_doc", 2)
* [🙏 "Dạ, nếu có thêm ngân sách cho quảng cáo Tóp-tóp thì…"]
    giam_doc: Ngân sách… em hỏi chị {ke_toan} nhé. Anh… anh đang hơi bận chuyện ngân hàng.
    _{giam_doc} nhìn ra cửa sổ, về phía Đồi Ngân Hàng, lâu hơn bình thường._
- giam_doc: À, cái clip 16 năm, cảnh dự án tháng 6 ấy. Em nhớ nhé. Đấy là dự án cuối cùng mà anh còn tự hào.
* {vu_co_file} [💾 "Dạ, có rồi anh. Cảnh drone hoàng hôn luôn."]
    giam_doc: Tốt! Tốt lắm! Anh biết là anh không giao nhầm người!
    ~ qh("giam_doc", 8)
* {not vu_co_file} [🧯 "Dạ… em đang lo anh."]
    giam_doc: Ừ. Anh tin em.
    ~ vu_lo_file = vu_lo_file + 5
* {not vu_co_file} [💬 "Anh ơi, hồi tháng 6 anh có giữ bản nào không anh?"]
    giam_doc: Anh á? Anh giữ… cái cúp golf. Ơ, sao em hỏi thế? Không phải em giữ à?
    ~ vu_lo_file = vu_lo_file + 10
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_truong_phong ===
# npc:truong_phong
truong_phong: {chua_te_deadline}. Cậu có 5 phút không? Tớ muốn sync nhanh về tác phong.
* [🙈 "Dạ em đang dở cuộc gọi đối tác…" (né)]
    ~ vu_so_lan_ne_nhat++
    truong_phong: Đối tác nào? … Cậu đang cầm điều khiển máy lạnh đấy.
    ~ qh("truong_phong", -3)
* [😇 "Dạ có. Mà anh cho em 5 phút thật nha anh."]
    truong_phong: Thật. 5 phút. Tớ bấm giờ.
    _Đúng 5 phút. {truong_phong} bấm giờ thật. Cả hai cùng ngạc nhiên._
    ~ qh("truong_phong", 8)
* [💬 "Anh ơi, sao anh thích họp vậy?"]
    truong_phong: *(im lặng)* Vì họp thì tớ biết mọi người đang làm gì. Không biết thì tớ… lo.
    _Câu trả lời thật nhất bạn từng nghe từ {truong_phong}._
    ~ qh("truong_phong", 5)
- truong_phong: Tớ hỏi thật nhé. Làm sao cậu để tới đêm cuối mà vẫn ra được sản phẩm?
* [😎 "Nước tới chân mới nhảy, mà nhảy là phải đẹp."]
    truong_phong: Tớ ghét câu đó. Tớ ghét nó vì nó đúng.
* [😇 "Thật ra 29 ngày em lướt là 29 ngày em nghĩ. Đêm cuối chỉ là gõ ra thôi."]
    truong_phong: … Cậu nói thế thì tớ không phản bác được. Tớ ghi lại nhé.
    ~ qh("truong_phong", 5)
    ~ uy_tin = uy_tin + 2
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Ông {chua_te_deadline}, chị… à, tui hỏi chút. Chiều nay anh {giam_doc} có lịch gì với chiến dịch hông? Để tui sắp lịch golf.
* [📋 Đưa lịch quay chiều nay.]
    thanh_ninh: Cảm ơn ông nha! Lịch đẹp ghê. Anh {giam_doc} mà thấy chắc khen "đỉnh nóc kịch trần".
    ~ qh("thanh_ninh", 5)
* [💬 "Hôm nay sếp tâm trạng sao bà? Tui định xin thêm ngân sách."]
    thanh_ninh: *(nói nhỏ)* Sáng nay ngân hàng gọi 3 cuộc. Ông xin thì xin sau 15 giờ, lúc đó sếp vừa đánh golf xong.
    _Thông tin vàng. {thanh_ninh} cái gì cũng biết, chỉ là không ai hỏi đúng._
    ~ qh("thanh_ninh", 3)
* [😶 "Bà hỏi anh {truong_phong} á, tui chỉ cầm bảng thôi."]
    thanh_ninh: Ờ… Ông giỏi đùn ghê.
- thanh_ninh: Mà nè, dạo này tui hay thấy xe màu xanh lá chuối đậu đối diện công ty. Ông thấy hông?
* [😶 "Xanh lá chuối thì kệ nó."]
    thanh_ninh: *(cười hơi nhanh)* Ờ, kệ ha.
* [💬 "Bà để ý kỹ ghê. Bà quen ai bên đó hả?"]
    thanh_ninh: Đâu có! Tui… tui hay để ý màu sắc thôi! Thôi tui đi pha trà cho sếp!
    ~ qh("thanh_ninh", -3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Ê ê ông! Nghe gì chưa? Fan đang ship ông với anh Hồng dữ lắm á! Tên ship là "Hồng Chill"!
* [😎 "Thì đúng kịch bản bên bà mà. Đẩy đi."]
    hong_hot: Ông tin tui đi, tui hông có viết kịch bản nào hết! Mà thôi… content ngon thì đẩy.
    ~ follow(5000)
    ~ vu_tin_that_long = vu_tin_that_long - 3
* [😶 "Đừng đăng gì về tui nha bà."]
    hong_hot: Ủa sao vậy? Mắc cỡ hả? Ối dồi ôi!
    ~ vu_tin_that_long = vu_tin_that_long + 2
* [💬 "Bà nói thật đi, bà có bày vụ quà hồng hông?"]
    hong_hot: Thề có laptop của tui! Hông! Ảnh tự mua, tự gói, tự đặt lên bàn ông lúc 7 giờ sáng. Tui thấy tận mắt!
    _Lần đầu tiên có người thề bằng laptop với bạn. Với {hong_hot}, đó là lời thề nặng nhất._
    ~ vu_tin_that_long = vu_tin_that_long + 8
- hong_hot: Mà ông lên lịch đăng bài tuần này cho tui chưa? Tui đăng theo cảm hứng hoài thấy kỳ.
* [📋 Gửi lịch đăng bài chi tiết.]
    hong_hot: Ủa có lịch thiệt hả? Ông bị ai nhập vậy?
    ~ follow(5000)
    ~ qh("hong_hot", 5)
* [🌊 "Đăng theo cảm hứng đi, cảm hứng là thứ tui tin."]
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 3
    hong_hot: Ông đúng là chúa tể. Chúa tể của sự chill.
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Ê {chua_te_deadline}. Chill hông? Cà phê Sống Ảo hông? Anh bao. À… nếu thẻ anh còn chạy.
* [☕ "Đi. Mà tui trả, thẻ ông đang hên xui."]
    ~ tien_cong(-60000)
    ~ uong(20)
    con_ong_chau_cha: *(cười)* Ông là người đầu tiên trả tiền cà phê cho anh. Lạ thiệt.
    ~ qh("con_ong_chau_cha", 8)
* [😶 "Tui đang chạy việc."]
    con_ong_chau_cha: Ờ. Ông có việc để chạy. Sướng ghê.
* [💬 "Ông nghe nhạc gì hay hông? Tui cần nhạc cho Đêm Hồng."]
    con_ong_chau_cha: *(khựng lại)* … Nhạc hả. Anh biết một người tên "Rồng", viết nhạc hồng hay lắm. Mà người đó… nhút nhát.
    ~ qh("con_ong_chau_cha", 5)
- con_ong_chau_cha: Mà nè, nếu một ngày ông không phải làm gì cho ai, ông sẽ làm gì?
* [😎 "Ngủ 19 tiếng."]
    con_ong_chau_cha: Haha. Chill.
* [😇 "Chắc vẫn làm show thôi. Mà làm show của mình."]
    con_ong_chau_cha: … Show của mình. Ừ. Nghe hay ghê.
    ~ qh("con_ong_chau_cha", 5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh {chua_te_deadline}! Anh cần em làm gì không ạ? Em rảnh ạ!
* [🙏 "Anh photo giùm em 300 trang kịch bản nha."]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    thuc_tap_sinh: Dạ em làm liền ạ! Dạ… 300 trang này ai đọc vậy anh?
    _Câu hỏi đó làm bạn khựng lại. Không ai đọc. Bạn chỉ thấy nó dày thì yên tâm._
    ~ qh("thuc_tap_sinh", -5)
* [😇 "Hông có gì. Anh ngồi nghỉ đi, sáng giờ anh chạy 4 tầng rồi."]
    thuc_tap_sinh: Dạ… dạ thôi em đứng được ạ. *(nhưng vẫn ngồi xuống, thở ra một hơi dài)*
    ~ qh("thuc_tap_sinh", 8)
* [💬 "Anh {thuc_tap_sinh}, trước khi vô đây anh làm gì vậy?"]
    thuc_tap_sinh: Dạ… em làm… bảo vệ ngân hàng ạ.
    _Một bảo vệ ngân hàng biết đọc bảng cân đối kế toán và cầm ly cà phê như cầm ly rượu vang. Ừ._
    ~ qh("thuc_tap_sinh", 2)
- thuc_tap_sinh: Dạ anh ơi, em hỏi xíu. Làm producer thì cần học gì đầu tiên ạ?
* [😎 "Học cách nói 'chill, kịp hết'."]
    thuc_tap_sinh: *(ghi vào sổ)* Dạ… "chill, kịp hết". Dạ em ghi rồi ạ.
* [😇 "Học cách nhìn bảng tiến độ mà biết ai đang mệt."]
    thuc_tap_sinh: *(ngẩng lên)* … Dạ, câu này hay quá anh. Hồi trước em… à, dạ em ghi lại ạ.
    ~ qh("thuc_tap_sinh", 5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {chua_te_deadline}. Ngồi xuống. Biên bản nghiệm thu dự án tháng 6 em để đâu? Chị cần cho hồ sơ quyết toán.
* {vu_co_file} [💾 "Dạ có đủ chị. File gốc, biên bản, hình ảnh. Em gửi liền."]
    ke_toan: *(thở ra)* Tốt. Đây là câu dễ nghe nhất chị nghe trong tuần.
    ~ qh("ke_toan", 8)
* {not vu_co_file} [🧯 "Dạ để em tìm, nó nằm đâu đó trong ổ."]
    ke_toan: "Đâu đó" không phải là địa chỉ lưu trữ, em.
    ~ vu_lo_file = vu_lo_file + 10
* {not vu_co_file} [😇 "Chị ơi… em nói chị nghe chuyện này, chị đừng la."]
    ke_toan: *(nghe xong, nhắm mắt)* … Được. Chị không la. Nhưng em phải tìm ra trước ngày 22. Đoàn thuế tới ngày 22.
    _Bạn không biết sao {ke_toan} biết trước ngày đoàn thuế tới. {ke_toan} cái gì cũng biết trước._
    ~ vu_lo_file = vu_lo_file + 5
    ~ qh("ke_toan", 5)
- ke_toan: Còn nữa. Tiền phạt đi trễ tháng này của em đủ mua trà sữa cho cả phòng 2 tuần. Chị cảm ơn em.
* [😅 "Dạ em là nhà tài trợ kim cương mà chị."]
    ke_toan: Không có hóa đơn là không có danh hiệu. Mai đi đúng giờ.
* [😇 "Dạ, mai em đi đúng giờ."]
    ke_toan: Chị ghi câu này 47 lần rồi. Lần thứ 48. Chị vẫn ghi.
    ~ qh("ke_toan", 2)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_hr ===
# npc:hr
hr: Em {chua_te_deadline}. Em rảnh không, lên phòng anh uống trà xíu.
* [😰 "Dạ… em làm gì sai hả anh?"]
    hr: *(cười)* Anh có nói gì đâu em. Anh chỉ muốn lắng nghe em thôi.
    _Phòng HR có 40 loại trà, sắp theo bảng chữ cái. Bạn được mời trà "Atiso". Bạn không dám hỏi vì sao bắt đầu bằng chữ A._
    ~ cang_thang(5)
* [🐢 "Anh ơi, việc hôm nay cứ để ngày mai tính. Mai em lên uống."]
    ~ vu_trich_slogan++
    hr: Ừ. Mai. 8 giờ. Đúng 8 giờ nha em.
    ~ qh("hr", -3)
* [☕ "Dạ, em lên liền. Em thích trà."]
    hr: *(hơi bất ngờ)* Ồ. Ít ai nói câu đó với anh.
    ~ qh("hr", 8)
- hr: Mình cùng nhìn lại hành trình tháng này nha em. Em đi trễ nhiều, nhưng chưa ai than em làm hỏng việc. Em thấy sao?
* [😇 "Dạ em thấy em nên đi sớm hơn. Thật."]
    hr: Anh ghi nhận. Anh thích những câu ngắn và thật.
    ~ qh("hr", 5)
* [😎 "Dạ, kết quả mới là thứ quan trọng anh."]
    hr: Ừ. Nhưng cuối tháng mình có họp đánh giá. Ở đó, kết quả với giờ chấm công ngồi chung một bàn.
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_it ===
# npc:it
it: Gì?
* [🍜 Đưa ly mì ly. "Ăn chung hông anh?"]
    { co(mi_ly):
        ~ mat(mi_ly)
    }
    it: … Ừ. *(nhận ly mì, ăn)*
    _Hai người ăn mì trong phòng server. Quạt máy kêu rì rì. Thân với {it} chỉ cần im lặng đúng lúc._
    ~ qh("it", 10)
* [💻 "Máy em chậm quá anh."]
    it: Restart chưa?
    _Bạn restart. Máy nhanh lên thật. Bạn hơi quê._
    ~ qh("it", 2)
* [💬 "Anh ở công ty lâu nhất trong mấy người kỹ thuật hả anh?"]
    it: Từ 2016. Người cuối cùng còn lại sau 2018. Còn gì nữa?
    ~ qh("it", 5)
- it: Em hay xóa file trên máy chủ cho "nhẹ ổ" lắm. Đừng làm vậy.
* [😅 "Dạ… em biết rồi anh. Em biết rõ lắm rồi."]
    it: *(nhìn bạn một giây)* Ừ.
    ~ qh("it", 3)
* {vu_thu_nhan_bao && not vu_co_file} [💬 "Anh nghĩ ra gì chưa anh, vụ file tháng 6?"]
    { qh_it >= 30:
        it: … Ổ cứng. Ở nhà anh. Ghi "KHÔNG ĐƯỢC MỞ". Mai anh mang.
        ~ vu_co_file = true
        ~ vu_file_tu_bao = true
        ~ vu_lo_file = 0
        ~ phat_hien(usb_cua_vu)
        { ngay < 20:
            ~ vu_file_truoc_2010 = true
        }
    - else:
        it: Chưa. Đang nghĩ.
    }
* [😶 Gật đầu, đi ra.]
    it: Ừ.
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen, trong nhà)* Em biết anh là ai không?
* [😇 "Dạ biết anh. 'Công Viên', 2015. Em thuộc lời từ hồi lớp 9."]
    idol_het_thoi: *(gỡ kính ra một nửa)* Lớp 9 hả… Ừ. Hồi đó anh còn nổi.
    ~ qh("idol_het_thoi", 8)
* [😎 "Dạ biết. Anh là người đeo kính đen trong nhà."]
    idol_het_thoi: Hừ. Producer bây giờ hỗn quá.
    ~ qh("idol_het_thoi", -3)
* [🎤 Hát: "Ngày xưa có đôi bạn thân…"]
    idol_het_thoi: *(hát tiếp theo phản xạ)* …bán cá viên chiên tại công viên! *(rồi ngưng, ho)* Hừm. Hát đúng tông đó.
    ~ qh("idol_het_thoi", 5)
- idol_het_thoi: Đêm Hồng… có tiết mục nào cho anh hông?
* [📋 "Có anh. Cue 23. Anh với anh Hồng song ca 'Công Viên'."]
    idol_het_thoi: Song ca với… nó hả? *(im lâu)* Cue 23. Anh nhớ rồi.
    ~ vu_cue_sheet = vu_cue_sheet + 1
    ~ qh("idol_het_thoi", 10)
* [😶 "Để em hỏi anh {quan_ly_idol}."]
    idol_het_thoi: Ừ. {quan_ly_idol} lo hết cho anh. Lúc nào cũng vậy.
    _Câu đó nói ra nhẹ tênh. Người nói không biết nó nặng cỡ nào._
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút… *(5 phút sau)* Rồi. Em cần gì? Nhanh nha, anh còn 2 cuộc nữa.
* [🗓️ "Lịch của anh Hồng tuần này, anh gửi em bản cuối nha."]
    quan_ly_idol: Bản cuối là bản sẽ đổi 3 lần nữa. Gửi em liền.
    ~ qh("quan_ly_idol", 3)
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 3
* [💬 "Anh ơi, mấy món quà hồng… anh bày hả anh?"]
    quan_ly_idol: *(đặt cả hai điện thoại xuống, chuyện hiếm có)* Em nghĩ anh rảnh tới mức đi gói nơ hả? Anh không bày. Nó tự làm. Sáng nào cũng tự làm.
    ~ vu_tin_that_long = vu_tin_that_long + 10
    ~ qh("quan_ly_idol", 3)
* [🤝 "Anh ngủ chút đi anh, mắt anh thâm quá."]
    quan_ly_idol: Ngủ hả. *(cười)* Anh nhớ cái chữ đó. Hồi 2015 anh có dùng.
    ~ qh("quan_ly_idol", 5)
- quan_ly_idol: Chuyện này để anh lo. Em lo cue sheet cho đàng hoàng. Đêm Hồng mà hỏng là cả anh, cả Nguyên, cả {idol_het_thoi}…
_{quan_ly_idol} ngưng nửa câu. Điện thoại lại reo._
* [😇 "Dạ. Cue sheet em lo."]
    ~ qh("quan_ly_idol", 3)
* [💬 "…cả anh {idol_het_thoi} gì anh?"]
    quan_ly_idol: Không có gì. Anh nghe máy.
    _Bạn thấy tay {quan_ly_idol} siết điện thoại hơi chặt. Bạn không hỏi nữa._
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_bien_kich ===
# npc:bien_kich
bien_kich: {chua_te_deadline}. Tui đang bí. Kịch bản livestream sinh nhật cần thêm nỗi đau.
* [😎 "Sinh nhật thì cần bánh kem, hông cần nỗi đau."]
    bien_kich: Bánh kem bị đổ. Đó là nỗi đau. Cảm ơn ông.
    _Bạn vừa vô tình viết trước một sự kiện có thật. Không ai biết._
    ~ qh("bien_kich", 3)
* [🙏 "Bà viết giùm tui luôn phần lời dẫn Đêm Hồng nha."]
    ~ vu_so_lan_nho_xiu++
    bien_kich: Được. Nhưng tui ghi tên tui.
    ~ vu_cue_sheet = vu_cue_sheet + 3
* [💬 "Bà lấy ý tưởng phim ngắn ở đâu vậy? Hay ghê."]
    bien_kich: *(chớp mắt hơi nhanh)* Đây không phải đạo, đây là cảm hứng. Ý tui là… nó tự tới.
    ~ qh("bien_kich", -3)
- bien_kich: Mà nè. Ông với Siêu Nhân Hồng… tui viết vô tiểu thuyết được hông? Đổi tên.
* [😶 "Bà viết gì cũng được, miễn đừng nộp trễ."]
    bien_kich: Câu này từ miệng ông nghe lạ ghê.
* [😤 "Đừng. Chuyện đó chưa phải chuyện."]
    bien_kich: "Chưa phải chuyện". Hay. Tui ghi lại câu này.
    ~ vu_tin_that_long = vu_tin_that_long + 3
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_editor ===
# npc:editor
editor: *(ngáp)* Ông kiếm tui hả. Đợi render xong…
* [☕ Đưa ly cà phê đen đá không đường.]
    editor: *(tỉnh liền 40%)* Ông nhớ tui uống gì hả? … Cảm ơn.
    ~ qh("editor", 8)
* [🙏 "Ông dựng giùm tui cái teaser 15 giây nha. Nhỏ xíu."]
    ~ vu_so_lan_nho_xiu++
    editor: "Nhỏ xíu" của ông là 3 đêm của tui.
    ~ qh("editor", -5)
    ~ follow(5000)
* [😶 Ngồi xuống ghế bên cạnh, xem {editor} dựng.]
    _Bạn xem {editor} dựng 20 phút. Trong một khung hình, có con cú nhỏ đậu trên vai Siêu Nhân Hồng. Bạn không nói gì. Đó là bí mật của {editor}._
    ~ qh("editor", 5)
- editor: Ông biết hông, ông với tui giống nhau. Toàn làm ban đêm. Có điều tui làm đêm vì thích. Còn ông làm đêm vì… ban ngày lướt.
* [😅 "Tui lướt là nghiên cứu thị trường."]
    editor: Ờ. Nghiên cứu mèo.
* [😇 "Lần sau tui làm ban ngày, ông ngủ ban đêm. Đổi ca."]
    editor: … Ông nói vậy làm tui hơi xúc động. Đừng nói vậy nữa.
    ~ qh("editor", 5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_designer ===
# npc:designer
designer: Ông tới đòi file hả? Poster sửa lần thứ 17. Cho xin feedback cụ thể được hông?
* [😇 "Bản 1 đẹp nhất. Thật."]
    designer: *(nhìn bạn)* Ông là người thứ 2 trong lịch sử nói câu đó. Người thứ 1 là chính tui.
    ~ qh("designer", 8)
* [🙏 "Hồng hơn chút. Mà cũng đừng hồng quá."]
    designer: Hết cứu.
    ~ qh("designer", -5)
* [💬 "Bà làm 2 laptop chi vậy?"]
    designer: *(gập một cái lại)* Một cái để làm, một cái để… ờm, render. Hỏi gì nhiều vậy.
    ~ qh("designer", -3)
- designer: Đêm Hồng backdrop cao 6 mét. Tui cần chốt trước 25. Ông chốt được hông?
* [📋 "Chốt. Ngày 24 tui ký duyệt, ai sửa nữa thì qua tui."]
    designer: Ông nói vậy là ông gánh nha. Tui chụp màn hình rồi đó.
    ~ qh("designer", 8)
    ~ vu_cue_sheet = vu_cue_sheet + 1
* [🌊 "Chốt ngày 30 đi, còn sớm mà."]
    designer: Ông muốn tui chết hả?
    ~ qh("designer", -5)
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 3
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_sales ===
# npc:sales
sales: Em {chua_te_deadline}! Tin chị đi, Đêm Hồng chị kéo được 3 nhà tài trợ. Chắc kèo!
_{sales} nhỏ hơn bạn 2 tuổi. Nhưng "em" thì vẫn là em._
* [💬 "Tên nhà tài trợ là gì vậy Huyền… à, chị?"]
    sales: BTT Global! Chủ tịch là Mr. Kevin Trộn. Chị nhậu với ổng rồi. No cap.
    _Bạn tra Mr. Kevin Trộn. Không có kết quả. Không có cả ảnh. Như một hồn ma của ngành bánh tráng._
    ~ phat_hien(btt_global_gia)
* [📋 "Ghi vào bảng: tài trợ, {sales} lo, hạn 25/10."]
    sales: Ủa… hạn hả? *(cười hơi gượng)* Ừ, hạn thì hạn. Tin chị đi.
    ~ qh("sales", -2)
* [😎 "Ok, tin chị." (không tin)]
    sales: Thấy chưa! Em này biết điều!
    ~ qh("sales", 5)
- sales: Mà em nè, nếu… nếu có một ngày chị nói thật, em có tin chị hông?
* [😇 "Nếu chị nói thật thì em sẽ gọi điện xác nhận. Vậy là tin rồi đó."]
    sales: *(im một giây)* … Hay. Câu đó hay.
    ~ qh("sales", 8)
* [😅 "Chị mà nói thật thì trời mưa."]
    sales: Ờ. Mấy người ai cũng nói vậy.
    ~ qh("sales", -3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {chua_te_deadline}. Ăn cơm chưa? Ngồi xuống.
* [😇 "Dạ chưa chị."]
    chi_dai: Biết ngay. *(đẩy qua nửa hộp cơm)* Ăn đi. Đứa nào ăn mì ly 3 bữa một ngày là đứa đó sắp có chuyện.
    ~ an(30)
    ~ qh("chi_dai", 5)
* [😎 "Dạ em ăn mì ly rồi chị."]
    chi_dai: Mì ly không phải cơm. Ngồi xuống.
    ~ an(20)
- chi_dai: Đêm Hồng sân khấu chị dựng. Còn cue sheet là của em. Em gửi chị bản nháp trước ngày 28, chị cần biết lúc nào kéo dây, lúc nào bắn pháo.
* [📋 "Dạ, em hứa. Ngày 27 chị có."]
    chi_dai: Hứa với chị thì nhớ. Chị không phải {truong_phong}, chị không họp. Chị tới tận nhà.
    ~ qh("chi_dai", 5)
    ~ uy_tin = uy_tin + 2
* [🌊 "Dạ ngày 31 chị có bản đầy đủ luôn."]
    chi_dai: Ngày 31 thì chị dựng sân khấu bằng niềm tin hả em? 28. Không bàn.
    ~ qh("chi_dai", -3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_chi_dai_hoi_chuyen ===
# npc:chi_dai # dieu_kien:vu_nho_duy_qua_5_lan
{ vu_nho_duy <= 5:
    -> chua_te_deadline_tudo_chi_dai
}
_{chi_dai} đứng chặn ngay cầu thang, tay khoanh trước ngực._
chi_dai: {chua_te_deadline}. Chị đếm rồi. Tháng này em nhờ {thuc_tap_sinh} {vu_nho_duy} lần. Nó 30 tuổi, lương 4 triệu, chạy 4 tầng một ngày.
* [😇 "Dạ em sai. Từ giờ em tự làm."]
    chi_dai: Ừ. Nói được thì làm được. Chị theo dõi.
    ~ qh("chi_dai", 5)
    ~ qh("thuc_tap_sinh", 5)
* [😅 "Dạ tại ảnh nhiệt tình quá chị…"]
    chi_dai: Nó nhiệt tình là chuyện của nó. Em lợi dụng là chuyện của em. Đứa nào làm nó khóc, chỉ mặt chị.
    ~ qh("chi_dai", -10)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {chua_te_deadline}! Lại đây coi nè. Chart này đẹp chưa? Cây nến xanh dài như bảng tiến độ của em hồi đầu tháng.
* [😅 "Anh ơi, cây nến của em là một thanh hồng mà."]
    dan_dau_tu: Hồng hay xanh gì cũng lên! Lần này là lên thật!
* [💬 "Anh xem số liệu của Siêu Nhân Hồng giùm em, giờ nào đăng bài là tốt nhất?"]
    dan_dau_tu: *(nghiêm mặt, chuyện hiếm có)* 21 giờ 07. Không phải 21 giờ. 21 giờ 07, lúc người ta lướt xong tin tức, chưa ngủ.
    _Lần đầu tiên bạn thấy {dan_dau_tu} phân tích số liệu thật. Và nó đúng._
    ~ follow(8000)
    ~ qh("dan_dau_tu", 5)
* [😶 "Anh trả nợ anh {it} chưa?"]
    dan_dau_tu: Suỵt! Nói nhỏ! *(nhìn quanh)* Anh trả… tuần sau. Tuần sau là chắc.
    ~ qh("dan_dau_tu", -3)
- dan_dau_tu: Tối nay bida hông?
* [🎱 "Đánh."]
    -> chua_te_deadline_mg_bida_mo_dau
* [😴 "Hôm nay thôi anh."]
    dan_dau_tu: Ờ. Người ngủ sớm hông bao giờ giàu.
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho khụ khụ rất đúng nhịp)* Dạ anh… em hơi sốt…
* [😏 "Sốt gì mà hát nhỏ nhỏ trong toilet hay vậy ông?"]
    thanh_xin_nghi: *(hết ho ngay lập tức)* Anh… nghe hả?
    _Bạn gật. {thanh_xin_nghi} nhìn bạn như nhìn người cầm chìa khóa nhà mình._
    ~ qh("thanh_xin_nghi", 3)
* [😇 "Ông về nghỉ đi. Lịch tuần này tui lo."]
    thanh_xin_nghi: Dạ em cảm ơn anh! Anh là người tốt nhất công ty!
    ~ qh("thanh_xin_nghi", 8)
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 5
* [📋 "Ông nghỉ thì để lại lịch điều phối cho tui, đầy đủ nha."]
    thanh_xin_nghi: Dạ… dạ có liền. *(gửi một file sạch đẹp tới bất ngờ)*
    ~ qh("thanh_xin_nghi", 3)
- thanh_xin_nghi: Anh ơi… nếu một ngày em xin nghỉ vì một việc… thật sự quan trọng, anh có tin hông?
* [😇 "Tin. Mà ông nói trước một ngày nha."]
    thanh_xin_nghi: Dạ. *(cười, lần này không ho)*
    ~ qh("thanh_xin_nghi", 5)
* [😎 "Bà ngoại ông khỏe chưa?"]
    thanh_xin_nghi: Dạ… bà khỏe. Bà khỏe lắm. Bà còn đi tập dưỡng sinh.
    _Lần đầu {thanh_xin_nghi} nói thật về bà ngoại._
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Ừ… Cháu {chua_te_deadline}. Lại đi trễ à.
* [😅 "Dạ, 200 mét mà bác. Gần quá nên chủ quan."]
    bac_bao_ve: Gần thì chủ quan. Xa thì đi sớm. Người ta thế cả.
    ~ qh("bac_bao_ve", 3)
* [🍵 Ngồi xuống ghế bố, rót cho bác ly trà đá.]
    bac_bao_ve: *(nhận ly trà)* … Ngồi đi. Hôm nay nắng.
    _Hai người ngồi nghe radio. Bản tin thời tiết. Không ai nói gì. Bác gật đầu nhẹ khi bạn đứng dậy._
    ~ qh("bac_bao_ve", 8)
    ~ cang_thang(-5)
* [💬 "Bác ơi, tháng 9 bác có thấy ai nhặt được cái USB ở bãi xe không bác?"]
    bac_bao_ve: *(uống một ngụm trà, nhìn ra cổng, rất lâu)* … Bác không thấy gì đâu.
    _Câu đó hơi lâu. Lâu hơn bình thường._
    ~ vu_manh_moi_binh = true
- bac_bao_ve: Cháu biết không, ngày xưa công ty có 20 mét vuông. Có người ngồi làm tới sáng, sáng ra lại cười như không. Giống cháu.
* [💬 "Ai vậy bác?"]
    bac_bao_ve: Người cũ. *(cười rất nhỏ)* Chuyện người ta, bác không biết đâu.
    ~ qh("bac_bao_ve", 3)
* [😇 "Dạ, chắc người đó cũng thích slogan công ty."]
    bac_bao_ve: Slogan đấy là ông ấy nói đùa. Thằng {giam_doc} tưởng thật nên in lên. *(lắc đầu, cười)*
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
{ vu_tin_bi_khoa:
    sieu_nhan_hong: *(tạo dáng, nhưng không nhìn bạn)* Chào producer! Hồng là thái độ!
    _Nguyên nói xong là đi. Từ hôm livestream, Nguyên chào bạn y như chào máy quay._
    -> END
}
sieu_nhan_hong: {chua_te_deadline}! Biến hình! Em ăn gì chưa? Anh có bánh chuối chiên nè!
* [🍌 "Ăn rồi anh. Mà còn bánh thì em ăn thêm."]
    ~ an(15)
    sieu_nhan_hong: *(đưa cả bịch)* Ăn hết đi! Anh ăn rồi! *(chưa ăn)*
    ~ vu_tin_that_long = vu_tin_that_long + 3
* [😎 "Anh tạo dáng nhiều vậy hông mỏi hả?"]
    sieu_nhan_hong: Mỏi. *(hạ tay xuống, nói nhỏ)* Mỏi lắm. Mà hông tạo dáng thì anh hông biết đứng sao.
    ~ vu_tin_that_long = vu_tin_that_long + 5
* [📱 "Anh đứng yên, em quay một clip ngắn đăng page."]
    sieu_nhan_hong: Vì công lý và lượt view! *(tạo dáng)*
    ~ follow(3000)
    ~ vu_tin_that_long = vu_tin_that_long - 2
- sieu_nhan_hong: Mà… ờm. Em thích màu gì vậy? Ngoài màu hồng?
* [😇 "Màu cam. Màu áo công ty. Mặc 5 năm quen rồi."]
    sieu_nhan_hong: Cam… Ừ. Cam với hồng đứng gần nhau cũng đẹp mà, đúng hông?
    ~ vu_tin_that_long = vu_tin_that_long + 5
* [😎 "Màu của nút 'Gửi' lúc 7 giờ 59."]
    sieu_nhan_hong: *(cười, không tạo dáng)* Màu đó là màu gì?
    _Bạn cũng không biết. Hai người cùng cười._
    ~ vu_tin_that_long = vu_tin_that_long + 4
* [📋 "Anh hỏi để làm content hả?"]
    sieu_nhan_hong: … Ờ. Ờ, đúng rồi. Content.
    ~ vu_tin_that_long = vu_tin_that_long - 3
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_tudo_cho ===
# npc:cho
cho: Gâu! *(ngửi ly cà phê sữa trên tay bạn, đuôi vẫy như cánh quạt)*
* [☕ Cho {cho} ngửi kỹ.]
    cho: *(hít hít, rồi chạy về phía gầm cầu thang, quay đầu lại nhìn bạn)* Gâu!
    _Như muốn bạn đi theo. Bạn nghĩ: "Chắc nó đòi ăn."_
    ~ vu_manh_moi_tuat = true
    ~ qh("cho", 3)
* {co(xuc_xich)} [🦴 Cho một cây xúc xích.]
    ~ mat(xuc_xich)
    cho: *(ăn trong 2 giây, rồi nằm ngửa ra cho gãi bụng)* Gâu gâu!
    ~ qh("cho", 12)
* [🐾 Xoa đầu.]
    cho: *(dụi đầu vào tay bạn)* Gâu.
    ~ qh("cho", 5)
- cho: *(nghe thấy tiếng "Biến hình!" từ xa, dựng lông)* Grừ…
* [🤝 Ngồi xuống chắn trước {cho}.]
    _{cho} nép sau lưng bạn, vẫn gầm gừ, nhưng không lao đi. Siêu Nhân Hồng đi ngang, vẫy tay với cả hai._
    ~ qh("cho", 5)
* [😶 Để mặc.]
    cho: GÂU GÂU GÂU! *(lao đi)*
- -> END
