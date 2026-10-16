// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT · nói chuyện tự do với 22 nhân vật
// ============================================================

// ------------------------------------------------------------
=== truong_phong_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Anh {truong_phong}! Nay họp mấy cuộc rồi anh? Em hỏi vậy thôi chứ hông có ý gì đâu.
+ [📅 "Mới 3 thôi. Còn 4 nữa."]
    ran_doc: Trời. Vậy anh có thời gian thở hông?
    truong_phong: Thở trong lúc họp.
    ~ qh("ran_doc", 2)
+ [💬 "Cậu bên Truyền thông nội bộ nhỉ? Bản tin tuần này có nhắc phòng tớ không?"]
    ran_doc: Có chứ anh. "Phòng Sản xuất: vẫn đang họp." Nói nhỏ thôi nha, bên đó viết vậy là khen đó.
    ~ qh("ran_doc", 3)
+ [🧂 "Tớ nghe nói cậu hay hỏi chuyện mọi người lắm."]
    ran_doc: *(cười)* Em làm truyền thông nội bộ mà anh. Hỏi là nghề. Tui chỉ nói sự thật thôi mà.
    ~ qh("ran_doc", -3)
- ran_doc: Mà anh nè… anh với anh {con_ong_chau_cha}, ai lên Phó vậy anh? Em hỏi để… viết bản tin.
+ [🪑 "Tớ."]
    ran_doc: Tự tin dữ. Em ghi lại nha.
    _{ran_doc} ghi gì đó vào cuốn sổ nhỏ. Bạn không thấy chữ._
+ [😶 "Chuyện đó để anh {giam_doc} quyết."]
    ran_doc: Câu trả lời chuẩn sách giáo khoa. Hơi chán, mà an toàn.
    ~ qh("ran_doc", 2)
+ [🍜 "Cậu lấy giúp tớ cái bát đựng giấy note được không?"]
    ran_doc: Cái chén hả anh? *(cười)* Anh cố tình đúng hông?
    ~ tp_hieu_nham()
    ~ qh("ran_doc", 4)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {truong_phong}! Vào đây. Anh đang nghĩ về cái vision của phòng em.
+ [📊 "Dạ, em có slide 12 trang ạ."]
    giam_doc: 12 trang? Anh chỉ cần 1 câu. Nhưng thôi, mở đi. Anh không ép.
    ~ tp_hop(1)
    ~ tp_ghe(2)
+ [😇 "Anh ơi, anh ăn trưa chưa ạ? Hôm nay anh trông mệt."]
    giam_doc: *(khựng lại)* …Chưa. Cả tuần nay anh ăn trưa với ngân hàng. À, với đối tác.
    ~ qh("giam_doc", 6)
+ [🙏 "Dạ thật ra vision đó là của cả phòng ạ. {editor} với {chua_te_deadline} góp nhiều nhất."]
    giam_doc: Ừ. Anh thích người biết nói "của cả phòng". Hiếm lắm.
    ~ tp_ghi_cong()
    ~ qh("giam_doc", 3)
- giam_doc: Mà này… em thấy {con_ong_chau_cha} dạo này thế nào?
+ [🪑 "Cậu ấy đi trễ ạ."]
    giam_doc: Anh biết. Anh hỏi cái khác.
    ~ tp_ghe(-2)
+ {tp_mo_phong_thu} [🔒 "Cậu ấy có một thứ anh nên nghe. Nhưng cậu ấy phải tự kể ạ."]
    giam_doc: *(nhìn bạn rất lâu)* …Em biết cái gì mà anh không biết thế?
    truong_phong: Em chỉ biết là nó hay ạ.
    ~ qh("giam_doc", 4)
    ~ qh("con_ong_chau_cha", 5)
+ [😶 "Dạ em không để ý ạ."]
    giam_doc: Ừ. Ai cũng không để ý nó. Kể cả anh.
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Anh {truong_phong}! Lịch họp của anh đẹp quá trời luôn á. Sếp khen hoài.
+ [😏 "Sếp khen thật hay cậu khen hộ sếp?"]
    thanh_ninh: Dạ… thì… sếp có gật đầu. Gật đầu là khen rồi anh.
    ~ qh("thanh_ninh", -2)
+ [📅 "Cậu xếp giúp tớ 30 phút với sếp chiều nay được không?"]
    thanh_ninh: Chiều nay sếp đi "gặp đối tác chiến lược" rồi anh. *(nói nhỏ hơn)* Ở ngân hàng.
    ~ qh("thanh_ninh", 3)
+ [💬 "Cậu dạo này hay về sớm nhỉ. Chiều thứ Bảy còn thấy cậu ở Ven Đô."]
    thanh_ninh: *(cứng người)* Dạ… em đi làm móng ạ. Ở Ven Đô có tiệm rẻ.
    _Tiệm nail Lung Linh ở Phường Tân Drama. Không phải Ven Đô._
    ~ qh("thanh_ninh", -5)
- thanh_ninh: Mà anh nè, bài phát biểu của anh trong họp đánh giá, để em viết giùm cho. Em viết hay lắm.
+ [✍️ "Thôi, tớ tự viết. Viết 14 bản rồi."]
    thanh_ninh: Mười bốn! Anh nói chuẩn quá anh ơi… à, anh siêng quá anh ơi.
+ [🤝 "Ừ, cảm ơn. Nhưng đừng khen tớ quá 3 câu nhé."]
    thanh_ninh: Ba câu là ít lắm anh! Sếp em quen 15 phút rồi!
    ~ qh("thanh_ninh", 4)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Anh {truong_phong}! Nghe gì chưa? Hôm nay có 3 drama mà anh họp suốt nên hông biết cái nào hết!
+ [💬 "Kể tớ nghe một cái thôi."]
    hong_hot: Ok nè. Có người thấy anh ở phòng dựng lúc 11 giờ đêm! Anh làm gì ở đó vậy?
    + + [😰 "Tớ… kiểm tra tiến độ."]
        hong_hot: Lúc 11 giờ đêm? Đi kiểm tra một mình? Nghi nha!
        ~ tp_lo(3)
    + + [😇 "Tớ học dựng phim. Đừng kể ai nhé."]
        hong_hot: *(che miệng)* Trời đất! Ok, tui giữ… tui cố giữ.
        ~ qh("hong_hot", 5)
        { RANDOM(1, 10) <= 5:
            ~ tp_lo(5)
        }
+ [📅 "Cậu nói nhanh quá. Mình họp 5 phút để cậu kể có thứ tự nhé."]
    hong_hot: Họp với tui hả? Ối dồi ôi, vinh dự quá! Mà để tui livestream nha!
    ~ tp_hop(1)
    ~ follow(2000)
+ [😶 "Tớ không quan tâm drama."]
    hong_hot: Ủa alo? Drama thì quan tâm anh đó nha.
    ~ qh("hong_hot", -3)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Ông {truong_phong}. Nay nhìn ông căng dữ. Chill đi.
+ [🪑 "Cậu thử làm trưởng phòng một ngày xem có chill được không."]
    con_ong_chau_cha: Thôi, tui làm phó phòng một mình còn mệt.
    truong_phong: Phòng cậu có mỗi cậu.
    con_ong_chau_cha: Thì đó. Tui làm sếp của tui, nhân viên của tui. Mệt gấp đôi.
    ~ qh("con_ong_chau_cha", 2)
+ [😇 "Cậu uống cà phê không? Tớ đang đi mua."]
    con_ong_chau_cha: Ủa ông mời tui hả? Lạ nha. Cà phê kem nha. Mà… để tui trả.
    ~ qh("con_ong_chau_cha", 6)
+ [📅 "Chiều nay cậu tham gia họp giao ban phòng tớ nhé. Có phần Marketing."]
    con_ong_chau_cha: Hai tiếng hả? Tui có hẹn 4 giờ.
    truong_phong: Họp 2 giờ.
    con_ong_chau_cha: Vậy 4 giờ tui vẫn đang họp. Đúng hông?
    ~ tp_hop(1)
- con_ong_chau_cha: Mà nè ông. Ông có bao giờ muốn làm cái gì khác hông? Hông phải trưởng phòng.
+ [💬 "Có. Tớ muốn tự dựng một cái video."]
    con_ong_chau_cha: *(nhìn bạn)* Ủa… vậy là ông cũng có một cái phòng khóa hả?
    truong_phong: Phòng gì?
    con_ong_chau_cha: À hông có gì.
    ~ qh("con_ong_chau_cha", 8)
+ [🪑 "Không. Tớ muốn làm Phó Giám đốc."]
    con_ong_chau_cha: Ờ. Thẳng thắn ghê.
    ~ qh("con_ong_chau_cha", -2)
+ {tp_mo_phong_thu} [🔒 "Bản 42 xong chưa?"]
    con_ong_chau_cha: *(cười)* Gần rồi. Có một đoạn tui để trống, chờ ông vẽ mũi tên.
    ~ qh("con_ong_chau_cha", 6)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: *(lướt Tóp-tóp)* Anh {truong_phong} hả. Đừng hỏi tiến độ. 80% rồi.
+ [📊 "Mở file cho anh xem 80% đâu."]
    chua_te_deadline: *(màn hình tắt phụt)* Ủa… hết pin.
    truong_phong: Laptop cắm sạc mà.
    chua_te_deadline: Hết pin… tinh thần.
    ~ qh("chua_te_deadline", -3)
    ~ uy_tin = uy_tin + 1
+ [😮‍💨 "Thôi được. Anh tin cậu. Nhưng 31/10 mà không xong thì…"]
    chua_te_deadline: Thì tui nhảy. Nước tới chân mới nhảy, mà nhảy là phải đẹp.
    ~ qh("chua_te_deadline", 3)
+ [📅 "Mình sync nhanh 5 phút nhé."]
    chua_te_deadline: Anh {truong_phong}, mình sync nhanh 5 phút sau buổi sync này nha.
    _Bạn vui vì có thêm một cuộc họp. Ba giây sau bạn mới hiểu mình bị chọc._
    ~ tp_hop(1)
- chua_te_deadline: Mà anh nè… cái anh Siêu Nhân Hồng tặng tui gối ôm hồng. Anh thấy đó là PR hông?
+ [💬 "Anh nghĩ là không."]
    chua_te_deadline: *(im lặng)* …Vậy là gì?
    ~ qh("chua_te_deadline", 5)
+ [📅 "Cậu cần một cuộc họp với chính mình."]
    chua_te_deadline: Ok mom.
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh {truong_phong}! Em pha cà phê "như mọi khi" cho anh ạ! Mà… "như mọi khi" là gì ạ?
+ [☕ "Đen, ít đường, không đá. Như ở Hà Nội."]
    thuc_tap_sinh: Dạ em ghi nhớ ạ! *(ghi vào sổ, gạch chân ba lần)*
    ~ qh("thuc_tap_sinh", 4)
+ [😅 "Thật ra anh cũng không biết. Anh nói thế cho có vẻ quen."]
    thuc_tap_sinh: Dạ… em cũng hay nói vậy lắm ạ. Em mới vô nên chưa biết ạ.
    _Hai người lớn tuổi nhìn nhau, cùng hiểu một điều không cần nói._
    ~ qh("thuc_tap_sinh", 8)
+ [📅 "Không cần cà phê. Em ngồi họp nhanh với anh 5 phút về kế hoạch thực tập."]
    thuc_tap_sinh: Dạ! Dạ em lấy sổ ạ!
    ~ tp_hop(1)
    ~ qh("thuc_tap_sinh", 2)
- thuc_tap_sinh: Dạ anh {truong_phong}… em hỏi cái này hơi kỳ… hồi anh mới đi làm, anh có sợ hông ạ?
+ [😇 "Có. Năm 22 tuổi, anh mang một cái vali và một quyển sổ. Anh sợ mình thừa."]
    thuc_tap_sinh: Dạ… em 30 tuổi rồi mà vẫn sợ vậy ạ.
    truong_phong: Thế thì mình cùng sợ.
    ~ qh("thuc_tap_sinh", 10)
+ [🪑 "Không. Anh chưa bao giờ sợ."]
    thuc_tap_sinh: Dạ anh ngầu quá ạ!
    _Bạn nói dối. {thuc_tap_sinh} biết. Nhưng {thuc_tap_sinh} lễ phép không nói ra._
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_ke_toan ===
# npc:ke_toan
ke_toan: *(nói chậm)* {truong_phong}. Hóa đơn bánh bông lan tuần trước đâu em?
+ [🧾 Đưa hóa đơn, kẹp sẵn trong sổ kẻ ô.]
    ke_toan: Có hóa đơn. Có chữ ký. Có ngày. *(gật đầu chậm)* Em là người duy nhất trong công ty làm chị yên tâm.
    ~ qh("ke_toan", 8)
+ [😅 "Dạ… em quên lấy ạ."]
    ke_toan: Không có hóa đơn là không có tiền. Em tự trả nhé.
    ~ tien_cong(-200000)
    ~ qh("ke_toan", -2)
+ [📅 "Chị ơi, mình họp nhanh về quy trình hóa đơn nhé?"]
    ke_toan: Không. Chị không họp. Họp không có hóa đơn.
    ~ qh("ke_toan", -1)
- ke_toan: {truong_phong} này… nếu công ty có chuyện, phòng em có bao nhiêu người cần lương nhất?
+ [💬 "{thuc_tap_sinh} ạ. {thuc_tap_sinh} ăn mì gói mỗi trưa."]
    ke_toan: *(ghi vào sổ)* Ừ. Chị ghi rồi. Đừng hỏi chị ghi vào đâu.
    ~ qh("ke_toan", 5)
+ [😟 "Công ty sắp có chuyện ạ?"]
    ke_toan: Chị hỏi giả sử thôi. Ăn cơm đi em.
    _{ke_toan} đi ra. Câu "giả sử" nặng như két sắt._
+ {biet(trang_47)} [🔒 "Chị lo vì trang 47 đúng không ạ?"]
    ke_toan: *(dừng lại rất lâu)* …Em đọc rồi à. Thế thì em hiểu vì sao chị không ngủ được.
    ~ qh("ke_toan", 10)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_hr ===
# npc:hr
hr: Anh {truong_phong}. Anh rảnh không, lên phòng em uống trà xíu.
+ [😰 "Có chuyện gì à anh {hr}?"]
    hr: Không có gì đâu anh. Em chỉ muốn lắng nghe anh thôi. *(mỉm cười)*
    _Nụ cười đó làm bạn kiểm tra lại số cuộc họp tuần này: 19._
    ~ cang_thang(5)
+ [🍵 "Được. Nhưng anh {hr} cho em 5 phút thôi."]
    hr: 5 phút của anh hay 5 phút của em?
    truong_phong: …Của anh.
    hr: Vậy em chuẩn bị trà cho 2 tiếng nha.
    ~ qh("hr", 3)
+ [📅 "Anh {hr} dự cuộc họp của em lúc 3 giờ đi, rồi mình uống trà luôn."]
    hr: Anh biến buổi trà thành cuộc họp. Em ghi nhận kỹ năng này.
    ~ tp_hop(1)
- hr: Nói thật nha anh. Có người phản ánh phòng anh họp nhiều quá. Em chỉ nói vậy thôi.
+ [🙏 "Em biết. Em đang giảm. Từ 7 xuống… 6."]
    hr: Một hành trình bắt đầu bằng một cuộc họp nhỏ hơn. Em thích.
    ~ qh("hr", 4)
+ [🪑 "Ai phản ánh ạ?"]
    hr: *(cười rộng hơn)* Mình cùng nhìn lại câu hỏi đó nha anh.
    ~ cang_thang(3)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_it ===
# npc:it
it: *(ăn mì ly)* Anh {truong_phong}. Máy chiếu hư hả?
+ [😅 "Không. Em… muốn hỏi cách xuất video ra file nhỏ."]
    it: Hỏi {editor}.
    truong_phong: Em không muốn hỏi {editor}.
    it: *(nhìn bạn)* …Ờ. Vô đây. Bấm cái này. Chọn cái này. Xong.
    ~ tp_tn(3)
    ~ qh("it", 5)
+ [📅 "Anh {it}, mai họp có cần anh cắm máy chiếu lúc 7:30 ạ."]
    it: Họp lúc 7:30? Anh tắt đi bật lại thử chưa? Cái lịch đó.
    ~ qh("it", -2)
+ [🍜 Đặt một ly mì ly mới lên bàn.]
    it: *(gật)* Lỗi người dùng được tha một lần.
    ~ tien_cong(-15000)
    ~ qh("it", 6)
- it: Mà… log máy dựng phụ có người đăng nhập lúc 22 giờ mỗi đêm. Tên đăng nhập là "nhat".
+ [🤫 "Anh giữ kín giúp em được không?"]
    it: Em giữ kín chuyện của người ta nhiều lắm rồi. Thêm một cái cũng được.
    ~ qh("it", 5)
    ~ tp_lo(-3)
+ [😇 "Vâng. Em đang học."]
    it: Ờ. Học thì học. Đừng tắt máy ngang. Lỗi người dùng.
    ~ qh("it", 3)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen trong nhà)* {truong_phong}. Em biết anh là ai không?
+ [🎵 "Dạ, anh là người hát 'Công Viên'. Năm 2015 em hát bài đó suốt ký túc xá."]
    idol_het_thoi: *(gỡ kính ra một nửa)* Thật hả? Ký túc xá nào?
    truong_phong: Ký túc xá ở Hà Nội ạ. Cả tầng hát.
    idol_het_thoi: …Cả tầng. *(đeo kính lại, quay đi rất nhanh)*
    ~ qh("idol_het_thoi", 10)
+ [📅 "Dạ, anh là người em cần mời vào cuộc họp nội dung tuần sau."]
    idol_het_thoi: Họp? Hồi anh còn nổi, người ta họp vì anh. Giờ anh phải đi họp.
    ~ tp_hop(1)
    ~ qh("idol_het_thoi", -2)
+ [😶 "Dạ, anh {idol_het_thoi}."]
    idol_het_thoi: Trả lời như trả lời phỏng vấn. Được.
- idol_het_thoi: Mà nè… MV của Siêu Nhân Hồng… nhạc nền ai làm vậy em?
+ [💬 "Nhạc mua thôi anh. Em cũng thấy chưa hay lắm."]
    idol_het_thoi: Ừ. Thiếu cái hồn. Anh nghe là biết.
+ {tp_mo_phong_thu} [🔒 "Bài sau sẽ hay hơn. Có người đang viết."]
    idol_het_thoi: *(nghiêng đầu)* Ai? Người trong công ty hả?
    truong_phong: Người đó tự nói thì hơn ạ.
    ~ qh("idol_het_thoi", 2)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút… *(10 giây sau)* {truong_phong} hả? Nói nhanh nha em, anh còn 2 cuộc nữa.
+ [📅 "Anh cho em lịch của anh {sieu_nhan_hong} tuần sau để em xếp lịch quay ạ."]
    quan_ly_idol: Thứ Hai quay, thứ Ba quay, thứ Tư… để anh hỏi {thanh_xin_nghi}. {thanh_xin_nghi} đâu rồi?
    truong_phong: Anh {thanh_xin_nghi} xin nghỉ ạ.
    quan_ly_idol: *(thở dài)* Chuyện này để anh lo.
    ~ qh("quan_ly_idol", 3)
+ [☕ Đưa một ly cà phê: "Anh uống đi, nói sau."]
    quan_ly_idol: *(nhìn ly cà phê như nhìn phép màu)* Em… em là người đầu tiên trong tuần đưa đồ cho anh thay vì đưa việc.
    ~ qh("quan_ly_idol", 8)
+ [💬 "Anh dạo này mệt không ạ?"]
    quan_ly_idol: Mệt? Anh không có thời gian để mệt. Khoan, anh nghe máy…
- quan_ly_idol: À {truong_phong}. Phòng em có ai dựng mấy video ngắn về anh {idol_het_thoi}, đăng ẩn danh hông? Đẹp lắm. Anh muốn cảm ơn.
+ [🤐 "Em không biết ạ."]
    _Bạn biết. Thư mục "{quan_ly_idol}" trong máy {editor}. Nhưng đó không phải bí mật của bạn._
    ~ qh("editor", 3)
+ [💬 "Anh hỏi {editor} thử xem ạ."]
    quan_ly_idol: {editor}? {editor} dựng phim cho phòng em mà. Cậu ấy đâu có thời gian…
    _{quan_ly_idol} nghe máy tiếp. Câu hỏi bay đi như mọi cuộc gọi nhỡ._
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Anh {truong_phong}. Hôm nay em không có cảm hứng. Cảm hứng của em đi họp rồi, chưa về.
+ [📅 "Thế thì vào họp, có khi gặp lại nó."]
    bien_kich: Một cuộc họp… như một nghĩa địa của những ý tưởng chưa sinh ra.
    ~ tp_hop(1)
    ~ qh("bien_kich", -3)
+ [🌤️ "Em lên sân thượng đi. Hai tiếng. Không ai hỏi."]
    bien_kich: *(nhìn bạn như nhìn một nhân vật mới)* …Anh vừa nói một câu rất ít "anh {truong_phong}".
    ~ qh("bien_kich", 8)
+ [💬 "Em đang viết gì thế? Anh thấy em hay ghi chép lắm."]
    bien_kich: *(gập sổ lại rất nhanh)* Dạ… ghi chép cuộc đời ạ.
    ~ qh("bien_kich", -2)
- bien_kich: Anh có bao giờ thấy mình là một nhân vật phụ trong câu chuyện của người khác hông?
+ [😶 "Có. Trong câu chuyện của {editor}."]
    bien_kich: *(mở to mắt)* …Câu này em xin nha anh.
    ~ qh("bien_kich", 5)
+ [🪑 "Không. Anh là nhân vật chính."]
    bien_kich: Nhân vật chính hay bị viết lại nhiều nhất đó anh.
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_editor ===
# npc:editor
editor: *(ngáp)* Anh {truong_phong}… có việc gì hông anh…
+ [🤝 "Không. Anh mang cơm lên cho em thôi."]
    editor: …Dạ. Em quên ăn 2 bữa rồi.
    ~ qh("editor", 8)
+ [📅 "Em báo cáo tiến độ nhanh 5 phút nhé."]
    editor: Render 47%. Xong.
    _Báo cáo ngắn nhất bạn từng nghe. Nó chứa đủ thông tin._
    ~ tp_hop(1)
+ {tp_mo_ca_dem} [🔒 "Tối nay bài mấy?"]
    editor: Bài chỉnh âm thanh. Khó. Anh mang cà phê nha.
    ~ qh("editor", 5)
    ~ tp_tn(2)
- editor: Anh {truong_phong}… sao dạo này anh hay hỏi em mấy cái nút vậy?
+ [🙏 "Vì anh muốn tự làm một lần. Không lấy công của em nữa."]
    editor: *(nhìn bạn rất lâu)* …Render xong là xong. Học xong mới xong. Em dạy.
    ~ qh("editor", 10)
    ~ tp_lo(-5)
    { not tp_mo_ca_dem && tp_tay_nghe >= 20:
        ~ tp_mo_ca_dem = true
    }
+ [😅 "Tò mò thôi."]
    editor: Dạ.
    _{editor} quay lại màn hình. Ở góc màn hình, file ghi chú "Danh sách" vẫn mở._
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_designer ===
# npc:designer
designer: Anh {truong_phong}, cho xin feedback cụ thể được hông? Đừng nói "hồng hơn".
+ [🎨 "Chữ to hơn 20%. Logo dời góc phải. Màu hồng bớt tím."]
    designer: *(mở to mắt)* Trời ơi… feedback cụ thể! Em ghi lại đóng khung!
    ~ qh("designer", 8)
+ [🤔 "Hồng… thái độ hơn."]
    designer: Sửa nhẹ thôi là sửa cái gì ạ?
    ~ qh("designer", -4)
+ [😇 "Em thấy bản nào đẹp nhất thì chốt bản đó. Anh tin em."]
    designer: Anh… tin em hả? Không sửa lần nào hả?
    ~ qh("designer", 10)
    ~ follow(3000)
- designer: Mà anh nè, sao dạo này anh không sửa logo nữa?
+ [💬 "Vì bản đầu bao giờ cũng thắng."]
    designer: Thấy chưa! Em nói hoài mà!
    ~ qh("designer", 3)
+ [📅 "Anh để dành cho cuộc họp tháng sau."]
    designer: Hết cứu.
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_sales ===
# npc:sales
sales: Anh {truong_phong}! Tin em đi… à, tin chị đi! BTT Global muốn tài trợ thêm một gói video!
+ [📊 "Hợp đồng đâu em? Anh cần có ngày, có số tiền, có chữ ký."]
    sales: Ờ… hợp đồng đang… bay qua từ nước ngoài anh.
    truong_phong: Bằng máy bay nào?
    sales: Sao mà căng!
    ~ qh("sales", -4)
    ~ uy_tin = uy_tin + 2
+ [😄 "Tuyệt vời. Anh xếp lịch quay luôn nhé."]
    sales: *(tái mặt)* Khoan khoan… để em nhậu với bên đó tối nay chốt đã.
    ~ qh("sales", 3)
+ [😶 "Anh nghe rồi."]
    sales: Anh nghe kiểu tin hay kiểu hông tin?
    truong_phong: Kiểu nghe.
- sales: Mà anh nè, Đại Nhạc Hội em sẽ mời ca sĩ nổi tiếng nhất nước tới hát. No cap.
+ [🧱 "Ai? Viết tên lên bảng đi."]
    sales: *(cầm bút, đứng hình 10 giây)* …Tên ca sĩ là bí mật kinh doanh.
    ~ qh("sales", -2)
+ [💬 "Thế em có biết ai mới gọi Sữa Chua Hồng Hào chưa? Thấy bảo họ muốn tài trợ thật."]
    sales: Sữa Chua Hồng Hào? Cái bên Ven Đô đó hả? Ai tin trời.
    _Lần duy nhất có nhà tài trợ thật, người bán hàng giỏi nói phét nhất lại không tin._
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {truong_phong}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
+ [😇 Ngồi xuống.]
    chi_dai: Thằng {thuc_tap_sinh} phòng em làm việc từ 7 giờ sáng tới 9 giờ tối. Em biết hông?
    truong_phong: Em… không biết ạ.
    chi_dai: Ừ. Vì em họp suốt. Đứa nào làm em nó khóc, chỉ mặt chị.
    ~ qh("chi_dai", 3)
    ~ qh("thuc_tap_sinh", 3)
+ [📅 "Dạ chị, em đang dở cuộc họp ạ."]
    chi_dai: Cuộc họp đó có cơm hông?
    truong_phong: Dạ không.
    chi_dai: Vậy ngồi xuống ăn.
    ~ an(25)
    ~ qh("chi_dai", 2)
+ [🙏 "Chị ơi, Đại Nhạc Hội em cần chị lo sân khấu ạ."]
    chi_dai: Chị lo. Em lo đừng họp chị lúc chị đang dựng sân khấu là được.
    ~ qh("chi_dai", 5)
- chi_dai: Mà em với thằng {con_ong_chau_cha} đó, cãi hoài vậy, mệt hông?
+ [😮‍💨 "Mệt ạ."]
    chi_dai: Thì thôi. Nó cũng mệt. Hai đứa mệt giống nhau đó.
    ~ cang_thang(-5)
+ [🪑 "Không ạ. Em quen rồi."]
    chi_dai: Quen mệt là bệnh. Chị biết.
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {truong_phong}! Em có 5 phút hông? À em thích 5 phút mà. Anh có kèo.
+ [💸 "Kèo gì anh?"]
    dan_dau_tu: Coin mới. Lần này là lên thật. Em bỏ 1 triệu, Tết mua xe.
    + + [😅 "Em đi xe buýt ạ."]
        dan_dau_tu: Thì mua xe buýt!
        ~ qh("dan_dau_tu", 2)
    + + [📊 "Anh cho em xem số liệu đã."]
        dan_dau_tu: *(mở chart)* Đây. Thấy đường đỏ hông? Là đáy. Đáy thật.
        _Đường đỏ cắm thẳng xuống. Không thấy đáy đâu._
+ [📈 "Anh ơi, em cần số liệu thật về lượt xem MV. Không phải coin."]
    dan_dau_tu: *(nghiêm túc hẳn lên)* Ừ. Số thật thì anh làm được. Chiều nay có.
    ~ qh("dan_dau_tu", 5)
    ~ follow(3000)
+ [😶 "Em đang bận ạ."]
    dan_dau_tu: Bận là đúng. Người giàu ai cũng bận.
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(giọng yếu ớt)* Anh {truong_phong}… mai em xin nghỉ được hông anh… bà ngoại em…
+ [📋 "Bà ngoại em ốm lần thứ mấy rồi?"]
    thanh_xin_nghi: Dạ… lần thứ… tám ạ. Bà yếu lắm anh.
    truong_phong: Ảnh bà trên Phây-búc của em tuần trước đang múa quạt.
    thanh_xin_nghi: Dạ… bà múa để… tập phục hồi chức năng ạ.
    ~ qh("thanh_xin_nghi", -3)
+ [😇 "Được. Nhưng em làm xong lịch quay tuần sau cho anh trước nhé."]
    thanh_xin_nghi: *(giọng khỏe hẳn)* Dạ được! Em làm liền!
    ~ qh("thanh_xin_nghi", 6)
+ [🎤 "Thứ Năm này có vòng thi 'Giọng Ca Ước Mơ' hả em?"]
    thanh_xin_nghi: *(đứng hình)* …Sao anh biết?
    truong_phong: Anh có ti vi.
    thanh_xin_nghi: Anh… đừng nói anh {hr} nha anh.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 4)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Ừ. {truong_phong} đấy à. Uống chén trà.
+ [🍵 Ngồi xuống, uống trà.]
    bac_bao_ve: Đêm qua cháu về lúc 1 giờ sáng.
    truong_phong: Bác thấy ạ?
    bac_bao_ve: Bác không thấy gì đâu. *(rót thêm trà)* Nhưng mà ngủ đi.
    ~ qh("bac_bao_ve", 5)
    ~ cang_thang(-5)
+ [📅 "Bác ơi, cháu xin đăng ký phòng họp tối thứ Bảy ạ."]
    bac_bao_ve: Thứ Bảy. Thế thì ai ở nhà?
    _Câu hỏi đó lại tới. Bạn vẫn chưa có câu trả lời._
    ~ cang_thang(3)
+ [🐕 Hỏi về {cho}: "Bác nhặt được {cho} ở đâu ạ?"]
    bac_bao_ve: Ở cổng này. Ngày Động vật. Nó đứng đây, không đi đâu. Như bác.
    ~ qh("bac_bao_ve", 6)
    ~ qh("cho", 2)
- bac_bao_ve: Cháu với thằng {giam_doc} cùng là người Bắc. Ở cái đất này lâu, giọng vẫn không đổi nhỉ.
+ [😇 "Cháu giữ giọng cho đỡ nhớ nhà ạ."]
    bac_bao_ve: Ừ. Bác cũng thế.
    ~ qh("bac_bao_ve", 4)
+ [🍜 "Có ạ. Cháu vẫn nói 'cái bát', người ta cứ hỏi 'cái chén hả anh'."]
    bac_bao_ve: *(cười lần đầu)* Thì bảo nó là cái bát. Bát hay chén thì vẫn đựng cơm.
    ~ tp_hieu_nham()
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: {truong_phong} ơi! Biến hình! Nay quay gì em? Hồng không phải màu, Hồng là thái độ!
+ [📋 "Hôm nay anh quay 3 cảnh, nghỉ trưa 45 phút, không bỏ đi giữa chừng được không ạ?"]
    sieu_nhan_hong: Được! Trừ khi có ai cần giúp. Điều khoản 3 mà em.
    truong_phong: Thế nếu không ai cần giúp?
    sieu_nhan_hong: Thì anh đi tìm người cần giúp!
    ~ qh("sieu_nhan_hong", 2)
+ [😇 "Anh ăn bánh chuối chiên chưa ạ? Em để trong phòng chờ rồi."]
    sieu_nhan_hong: Có nhớ điều khoản số 4 luôn! Em dễ thương ghê!
    ~ qh("sieu_nhan_hong", 6)
+ [📅 "Anh ngồi họp kịch bản với phòng em 5 phút nhé."]
    sieu_nhan_hong: Họp hả? Anh mặc đồ này ngồi họp có kỳ hông?
    truong_phong: Không kỳ bằng em mặc sơ mi cài kín cổ ạ.
    sieu_nhan_hong: *(cười to)* Đúng rồi!
    ~ tp_hop(1)
    ~ qh("sieu_nhan_hong", 3)
- sieu_nhan_hong: *(nhỏ giọng hẳn)* {truong_phong} nè… em thấy anh có… nổi được hông? Thiệt á.
+ [💬 "Có. Vì người ta thích anh thật. Em xem số liệu rồi."]
    sieu_nhan_hong: *(im lặng, rồi tạo dáng)* Vậy… gét gô!
    ~ qh("sieu_nhan_hong", 8)
    ~ follow(2000)
+ [📊 "Nếu anh không bỏ đi giữa buổi quay thì chắc chắn."]
    sieu_nhan_hong: Ờ… anh cố. Mà anh hông hứa nha.
- -> END

// ------------------------------------------------------------
=== truong_phong_tudo_cho ===
# npc:cho
cho: Gâu? *(ngửi giày bạn)*
+ [🦴 Đưa một cây xúc xích.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        cho: Gâu gâu! *(vẫy đuôi như cánh quạt)*
        ~ qh("cho", 10)
    - else:
        _Bạn sờ túi. Không có xúc xích. Chỉ có ba cây bút lông bảng trắng._
        cho: …Grừ.
    }
+ [📅 "{cho}, ngồi. Mình họp nhanh 5 phút."]
    cho: *(ngồi xuống)* Gâu.
    _{cho} ngồi im đúng 5 phút, nhìn bạn chăm chú, rồi bỏ đi. Đây là thành viên họp nghiêm túc nhất bạn từng có._
    ~ tp_hop(1)
    ~ qh("cho", 3)
+ [🐾 Ngồi xổm xuống xoa đầu.]
    cho: *(nhắm mắt, dụi đầu vào tay)*
    ~ qh("cho", 5)
    ~ cang_thang(-5)
- _{cho} chạy về gầm cầu thang, tha ra một cây bút lông bảng trắng. Của bạn. Mất từ tuần trước._
+ [😄 "Thì ra là cậu."]
    cho: Gâu! *(tự hào)*
+ [🎁 "Giữ đi. Tặng cậu."]
    _{cho} tha cây bút về lại kho. Giờ trong kho báu của {cho} có một món đồ của bạn._
    ~ qh("cho", 4)
- -> END
