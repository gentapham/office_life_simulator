// ============================================================
// CON ÔNG CHÁU CHA: LONG · nói chuyện tự do với 22 nhân vật
// ============================================================

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Ông {con_ong_chau_cha}! Nay đi làm sớm dữ. Tui hỏi vậy thôi chứ hông có ý gì đâu.
+ [😎 "Chill. Đổi gió."]
    ran_doc: Đổi gió hay đổi… chú? Nói nhỏ thôi nha, nghe đồn chú ông dạo này hông bắt máy ai hết.
    ~ cang_thang(3)
    ~ qh("ran_doc", -2)
+ [💬 "Ông làm truyền thông nội bộ, ông biết hết chuyện công ty hả?"]
    ran_doc: Biết chút chút. Ông muốn biết chuyện gì?
    con_ong_chau_cha: Hông. Tui muốn biết ông thích nghe nhạc gì.
    ran_doc: *(khựng lại)* …Ủa. Chưa ai hỏi tui câu đó.
    ~ qh("ran_doc", 6)
    ~ long_bh(3)
+ [☂️ "Có gì cần thì ông nói, để tui gọi chú tui."]
    ran_doc: Ờ, tui ghi nhớ. *(ghi gì đó vào cuốn sổ nhỏ)*
    ~ long_goi_chu()
- ran_doc: Mà nè, ông với anh {truong_phong}, ai lên Phó vậy? Tui hỏi để… viết bản tin.
+ [🙅 "Ổng đi. Tui hông thích ngồi ghế đó."]
    ran_doc: *(nhướng mày)* Thiệt hả? Vậy mà cả công ty tưởng hai người đang đánh nhau.
    con_ong_chau_cha: Có một người đánh thôi. Tui đứng coi.
    ~ qh("ran_doc", 3)
+ [😎 "Để chú tui quyết."]
    ran_doc: Câu trả lời đúng chất. Tui ghi lại nha.
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {con_ong_chau_cha}. Vào đây. Dạo này cháu thế nào?
+ [😎 "Dạ ổn chú. Chill."]
    giam_doc: Chill. Ừ. Chú cũng muốn chill. *(nhìn ra cửa sổ rất lâu)*
    ~ qh("giam_doc", 2)
+ [💬 "Chú ơi, chú có mệt hông?"]
    giam_doc: *(khựng lại)* …Ai bảo cháu hỏi thế?
    con_ong_chau_cha: Hông ai. Tại cháu thấy chú ít ngủ.
    giam_doc: Ừ. Chú ít ngủ. Mà thôi, cháu lo việc của cháu đi.
    ~ qh("giam_doc", 6)
    ~ long_bh(3)
+ [💳 "Chú ơi, thẻ cháu khi nào dùng lại được?"]
    { ngay >= 12:
        giam_doc: *(không nhìn bạn)* Ngân hàng đang… kiểm tra. Cháu dùng lương trước đi.
        ~ long_tl(3)
    - else:
        giam_doc: Thẻ vẫn dùng được mà. Tiêu ít thôi nhé.
    }
- giam_doc: Mà này. Ghế Phó Giám đốc… cháu có muốn không? Chú không ép, tùy cháu.
+ [🙅 "Dạ hông. Cháu muốn làm cái khác."]
    giam_doc: Cái khác là cái gì?
    con_ong_chau_cha: Cháu… chưa dám nói.
    giam_doc: *(thở dài)* Giống chú hồi 21 tuổi. Cũng không dám nói với anh Genta.
    ~ qh("giam_doc", 5)
    ~ long_od(-3)
+ [👑 "Chú cho thì cháu nhận."]
    giam_doc: Ừ. Chú biết mà.
    ~ long_od(5)
+ {long_bai_hat >= 50} [🔒 "Chú ơi… cháu viết nhạc."]
    giam_doc: *(im lặng rất lâu)* Viết nhạc? Cháu á?
    con_ong_chau_cha: Dạ. Bữa nào cháu cho chú nghe.
    giam_doc: …Ừ. Bữa nào.
    ~ qh("giam_doc", 8)
    ~ long_noi_chuyen_that_voi_chu = true
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_truong_phong ===
# npc:truong_phong
truong_phong: {con_ong_chau_cha}. Họp nhanh 5 phút không?
+ [😎 "5 phút của ông hay 5 phút thiệt?"]
    truong_phong: *(khựng lại)* …5 phút thật.
    con_ong_chau_cha: Ok. Tui bấm giờ.
    _Cuộc họp kéo dài 5 phút 40 giây. {truong_phong} có vẻ tự hào lạ lùng._
    ~ qh("truong_phong", 5)
+ [🙅 "Hông. Tui có hẹn."]
    truong_phong: Hẹn với ai? Cà phê Sống Ảo à?
    ~ qh("truong_phong", -3)
+ [☕ "Đi uống cà phê đi, vừa uống vừa họp. Tui trả."]
    truong_phong: *(ngạc nhiên)* Cậu trả? Bằng thẻ của…
    con_ong_chau_cha: Bằng lương. Thẻ tui về 0 rồi.
    truong_phong: *(im lặng một lúc)* …Thế tớ trả. Lần này thôi.
    ~ qh("truong_phong", 8)
- truong_phong: Mà cậu… dạo này làm gì mà ngáp suốt thế?
+ [🎵 "Thức khuya. Làm… cái này."]
    { long_mo_phong_thu_nhat:
        truong_phong: Bản mấy rồi?
        con_ong_chau_cha: Bốn mươi hai. Có một đoạn tui để trống, chờ ông vẽ mũi tên.
        ~ qh("truong_phong", 6)
        ~ long_bh(3)
    - else:
        truong_phong: Cái gì?
        con_ong_chau_cha: À… hông có gì.
    }
+ [😎 "Đi chơi khuya."]
    truong_phong: Cũng phải.
    _{truong_phong} nói "cũng phải" với giọng của người tin là thế. Bạn hơi buồn._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: {con_ong_chau_cha} ơi! Chú em dặn em nhắc em đi họp đúng giờ nha. Anh {giam_doc} nói chuẩn quá trời luôn!
+ [😎 "Chill đi bà. Tui đi rồi nè."]
    thanh_ninh: Ủa nay em đi sớm thiệt! Để chị… à để tui báo sếp liền!
    ~ qh("thanh_ninh", 2)
+ [💬 "Bà biết lịch chú tui hết đúng hông? Chú hay đi ngân hàng hả?"]
    thanh_ninh: *(cứng người)* Dạ… sếp đi gặp "đối tác chiến lược" ạ. Em hông biết gì hết.
    _Bà ấy nói "dạ" với bạn. Lần đầu. Có gì đó không ổn._
    ~ long_bh(2)
+ [🙃 "Bà khen chú tui một câu thiệt lòng đi, hông nịnh."]
    thanh_ninh: *(nghĩ rất lâu)* …Sếp đi trễ thì tự bỏ 50 nghìn vô quỹ trà sữa. Không ai bắt. Mà sếp cấm em kể.
    _Bạn không biết chuyện đó. Câu thật lòng duy nhất của {thanh_ninh} hóa ra lại hay nhất._
    ~ qh("thanh_ninh", 6)
    ~ qh("giam_doc", 2)
    ~ long_bh(4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Ông {con_ong_chau_cha}! Nghe gì chưa? Có người thấy ông ở Hẻm 69 tối qua! Ông đi đâu vậy?
+ [🤫 "Bà thấy nhầm rồi."]
    hong_hot: Nhầm gì! Đôi sneaker trắng đó cả quận có mình ông!
    ~ qh("hong_hot", -2)
+ [😇 "Đi coi phòng trọ. Đừng đăng nha bà."]
    hong_hot: *(che miệng)* Ối dồi ôi… ông… coi phòng trọ hả? Ok, tui hông đăng. Tui… cố hông đăng.
    ~ qh("hong_hot", 6)
    ~ long_tl(2)
+ [📸 "Đi check-in. Bà like story tui chưa?"]
    hong_hot: Like rồi! Mà ông check-in Hẻm 69 chi vậy? Cái hẻm đó có gì đẹp?
    con_ong_chau_cha: Có tường.
    ~ follow(1000)
- hong_hot: Mà hôm thẻ ông bị từ chối… tui xin lỗi nha. Tui lỡ kể trong group.
+ [😎 "Chill. Chuyện thật mà."]
    hong_hot: *(nhìn bạn)* Ủa… ông khác rồi nha.
    ~ qh("hong_hot", 5)
+ [😶 "Ừ."]
    _Bạn không giận. Bạn chỉ thấy lạ là giờ ai cũng biết bạn hết tiền, mà bạn vẫn ổn._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: *(lướt Tóp-tóp)* Ông {con_ong_chau_cha}. Ngồi đi. Chill với tui.
+ [😎 Ngồi xuống lướt chung.]
    chua_te_deadline: Thấy hông, ông với tui là chill guy. Còn sớm mà.
    ~ qh("chua_te_deadline", 4)
    ~ cang_thang(-5)
+ [🎵 "Ông nghe bài này thử. Nói thiệt nha, hay hông?"]
    _{chua_te_deadline} đeo tai nghe. Ba mươi giây. Tắt Tóp-tóp._
    chua_te_deadline: …Ủa. Ai làm? Bài này lên trend được đó.
    ~ long_bh(6)
    ~ qh("chua_te_deadline", 5)
+ [💬 "Ông với anh {sieu_nhan_hong}… là sao vậy?"]
    chua_te_deadline: *(đỏ tai)* PR thôi. Chắc PR. *(im lặng)* …Mà ông thấy có phải PR hông?
    con_ong_chau_cha: Tui thấy ổng nhìn ông như tui nhìn cây đàn.
    chua_te_deadline: …Câu đó nghe hơi sến mà hơi đúng.
    ~ qh("chua_te_deadline", 6)
    ~ long_bh(3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh {con_ong_chau_cha}! Hôm nay em mặc giống anh hông ạ?
+ [😄 "Giống. Mà đẹp hơn."]
    thuc_tap_sinh: Dạ… dạ anh nói thật ạ?
    ~ qh("thuc_tap_sinh", 6)
+ [🤝 "Anh {thuc_tap_sinh}, đừng mặc giống tui nữa. Mặc giống anh đi."]
    thuc_tap_sinh: Dạ… giống em là sao ạ?
    con_ong_chau_cha: Thì như anh hồi trước. Hồi anh "làm văn phòng".
    thuc_tap_sinh: *(im lặng)* Dạ… hồi trước em mặc vest ạ. Em hông thích lắm.
    ~ qh("thuc_tap_sinh", 8)
    ~ long_bh(3)
+ [😎 "Chill đi anh."]
    thuc_tap_sinh: Dạ chill ạ! *(vẫn đứng nghiêm)*
    ~ qh("thuc_tap_sinh", 3)
- thuc_tap_sinh: Dạ anh {con_ong_chau_cha}… anh có muốn ăn trưa với em hông ạ? Em nấu mì gói, em có thêm trứng.
+ [🍜 "Có. Tui mang thêm xúc xích."]
    _Hai người ngồi pantry ăn mì gói có trứng và xúc xích. Bữa trưa rẻ nhất tháng của bạn. Ngon nhất tháng._
    ~ an(30)
    ~ qh("thuc_tap_sinh", 8)
    ~ long_tl(2)
+ [😅 "Thôi, tui ăn nhà hàng quen rồi."]
    thuc_tap_sinh: Dạ… dạ em hiểu ạ.
    { ngay >= 12:
        _Thẻ về 0 rồi. Bạn không có tiền ăn nhà hàng. Bạn ăn bánh mì một mình ở cầu thang._
        ~ an(15)
    }
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_ke_toan ===
# npc:ke_toan
ke_toan: *(nói chậm)* {con_ong_chau_cha}. Hóa đơn cái máy pha cà phê đâu em?
+ [🧾 "Dạ… em quẹt thẻ chú. Hóa đơn chắc gửi về chú."]
    ke_toan: Thẻ của chú em là tài khoản riêng. Không phải công ty. Chị không ghi được.
    _{ke_toan} nhìn bạn một lúc lâu, như đang cân nhắc có nên kể gì đó._
    ~ qh("ke_toan", -2)
+ [💵 "Em tự trả lại bằng lương được hông chị?"]
    ke_toan: *(khựng lại)* Em… tự trả?
    con_ong_chau_cha: Dạ. Trừ dần mỗi tháng.
    ke_toan: Không cần. Nhưng chị ghi nhận. Em là người đầu tiên trong năm hỏi câu đó.
    ~ qh("ke_toan", 10)
    ~ long_tl(4)
+ [😎 "Chill đi chị."]
    ke_toan: Không có hóa đơn là không có chill.
    ~ qh("ke_toan", -4)
- ke_toan: {con_ong_chau_cha} này… nếu công ty có chuyện, em có chỗ ở không?
+ [😟 "Chị biết chuyện căn nhà hả?"]
    ke_toan: Chị biết nhiều thứ. Chị chỉ hỏi em có chỗ ở không.
    con_ong_chau_cha: Dạ… em đang coi phòng trọ.
    ke_toan: *(gật đầu chậm)* Tốt. Ăn cơm đi em.
    ~ qh("ke_toan", 6)
+ [😶 "Dạ… chắc có."]
    _{ke_toan} gật đầu, đi ra. Câu hỏi ở lại trong phòng lâu hơn người hỏi._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_hr ===
# npc:hr
hr: {con_ong_chau_cha}. Em rảnh không, lên phòng anh uống trà xíu.
+ [😰 "Em bị trễ nhiều quá hả anh?"]
    hr: Em trễ 14 lần trong tháng. Kỷ lục là 15. *(mỉm cười)* Anh chỉ muốn lắng nghe em thôi.
    ~ cang_thang(5)
+ [🍵 "Dạ. Mà anh pha trà gì?"]
    hr: Trà ô long. Em thích không?
    con_ong_chau_cha: Em chưa uống bao giờ. Ở nhà em toàn cà phê kem.
    hr: Vậy mình cùng nhìn lại hành trình vị giác của em nha.
    ~ qh("hr", 5)
+ [☂️ "Để em gọi chú em hỏi có cần lên hông."]
    hr: *(cười rộng hơn)* Em gọi đi. Anh đợi.
    ~ long_goi_chu()
    _Chú không bắt máy. {hr} vẫn mỉm cười. Bạn đi lên phòng trà._
- hr: Em biết không, danh sách năm nay… có nhiều cái tên lắm. *(dừng lại)* Anh chỉ nói vậy thôi.
+ [💬 "Có tên em hông anh?"]
    hr: Tên em… thì có cái ô che rồi.
    con_ong_chau_cha: Nếu ô gãy thì sao?
    hr: *(lần đầu không cười)* Thì em sẽ là người bình thường. Như anh.
    ~ qh("hr", 6)
    ~ long_bh(4)
+ [😶 Uống trà, không hỏi.]
    _Trà đắng. Rồi ngọt hậu. Bạn ghi nhớ vị đó cho một câu hát._
    ~ long_bh(2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_it ===
# npc:it
it: *(ăn mì ly)* {con_ong_chau_cha}. Laptop hư hả?
+ [🎵 "Anh {it}, mic thu âm của em bị rè. Anh coi giùm được hông?"]
    it: Mic? *(nhìn bạn)* Em thu âm gì?
    con_ong_chau_cha: …Đồ chơi.
    it: Ờ. Mang tới. Dây hỏng. Lỗi người dùng.
    _Hôm sau {it} trả lại mic, kèm một cái lọc âm tự chế bằng tất nilon. Âm thanh trong hẳn._
    ~ long_bh(6)
    ~ qh("it", 6)
+ [🛒 "Ủa sao anh hông mua máy mới cho phòng server?"]
    it: Tiền đâu?
    con_ong_chau_cha: …Ờ ha.
    ~ long_tl(2)
+ [🍜 Ngồi xuống ăn mì ly chung.]
    it: *(gật đầu)* Mì vị tôm chua cay ngon nhất. Đừng tin ai nói khác.
    ~ an(20)
    ~ qh("it", 5)
- it: Mà… log thẻ phụ của em. Bị khóa từ tài khoản chính. Không phải lỗi ngân hàng.
+ [😶 "Em biết rồi."]
    it: Ờ. Biết thì tốt.
    ~ long_biet_chu_no = true
+ [💬 "Vậy là lỗi gì anh?"]
    it: Lỗi… người dùng. Người dùng tài khoản chính. *(quay lại màn hình)*
    _Bạn hiểu. Người dùng tài khoản chính là chú._
    ~ long_biet_chu_no = true
    ~ long_bh(3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen)* {con_ong_chau_cha}. Em biết anh là ai không?
+ [🎵 "Biết. Người hát 'Công Viên'. Em thuộc cả đoạn bè."]
    idol_het_thoi: *(gỡ kính ra một nửa)* Đoạn bè? Có ai thuộc đoạn bè đâu.
    con_ong_chau_cha: Em thuộc. Hồi lớp 10 em tập đàn bằng bài đó.
    idol_het_thoi: …Thật hả? *(đeo kính lại, quay đi)*
    ~ qh("idol_het_thoi", 10)
+ [😎 "Biết. Anh {idol_het_thoi}. Anh đeo kính trong nhà làm gì vậy?"]
    idol_het_thoi: Fan anh đông lắm em. Phải giữ hình ảnh.
    con_ong_chau_cha: Trong nhà vệ sinh cũng có fan hả anh?
    idol_het_thoi: …Em hỏi khó vậy.
    ~ qh("idol_het_thoi", -2)
+ [💬 "Anh có muốn hát lại hông? Thiệt á."]
    idol_het_thoi: *(im lặng rất lâu)* Muốn. Mà hát gì? Ai viết cho anh?
    ~ long_bh(4)
    ~ qh("idol_het_thoi", 5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút… *(10 giây sau)* {con_ong_chau_cha} hả. Nói nhanh nha em.
+ [💬 "Anh {quan_ly_idol}, nếu có một bài hát hay cho Siêu Nhân Hồng, ai quyết được?"]
    quan_ly_idol: *(cúp máy kia)* Bài gì? Của ai? Có bản quyền chưa? Có bản thu chưa?
    con_ong_chau_cha: Có. Của… một người quen.
    quan_ly_idol: Đưa anh nghe. Hay thì anh lo. Chuyện này để anh lo.
    ~ qh("quan_ly_idol", 6)
    ~ long_bh(3)
+ [☕ Đưa ly cà phê: "Anh uống đi rồi nói."]
    quan_ly_idol: *(nhìn ly cà phê như nhìn phép màu)* Em… mua cho anh hả? Bằng tiền của em?
    ~ qh("quan_ly_idol", 8)
    ~ tien_cong(-30000)
+ [😎 "Anh chill đi. Hai cái điện thoại nặng lắm."]
    quan_ly_idol: Chill? Anh chill thì ai lo cho {idol_het_thoi}? *(nghe máy tiếp)*
- quan_ly_idol: À {con_ong_chau_cha}. Anh {idol_het_thoi} dạo này hay nhắc em. Em với {idol_het_thoi}… có chuyện gì hông?
+ [🤐 "Dạ hông có gì anh."]
    quan_ly_idol: Ừ. Có gì thì nói anh trước. Đừng ai đăng gì hết.
+ {long_biet_phat_no} [🔒 "Anh {quan_ly_idol}… anh {idol_het_thoi} đang nợ tiền. Anh biết hông?"]
    quan_ly_idol: *(im lặng)* …Anh biết. Tháng 7 anh trả giùm một tháng tiền nhà. Đừng kể {idol_het_thoi}.
    _Bạn nhìn {quan_ly_idol}, người lúc nào cũng cầm hai cái điện thoại, lo cho người khác. Có một câu hát hiện ra._
    ~ qh("quan_ly_idol", 10)
    ~ phat_hien(thai_thuong_phat)
    ~ long_bh(6)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Phó phòng Marketing. Một chức danh không có phòng. Một căn phòng không có người. Thơ quá.
+ [😄 "Chị viết thành thơ luôn đi."]
    bien_kich: Đang viết. *(gập sổ lại rất nhanh)*
    ~ qh("bien_kich", 3)
+ [🎵 "Chị {bien_kich}, chị viết lời bài hát được hông? Hay giúp em sửa vài câu?"]
    bien_kich: *(mắt sáng lên)* Lời bài hát? Đưa em coi. *(đọc)* …Câu này "sau chiếc mũ là một người bình thường". Của anh hả?
    con_ong_chau_cha: Dạ.
    bien_kich: Em không sửa. Em chỉ… ghen tị.
    ~ qh("bien_kich", 8)
    ~ long_bh(5)
+ [💬 "Chị đang viết gì trong cuốn sổ vậy?"]
    bien_kich: Ghi chép cuộc đời. Trong đó có anh đó. Một nhân vật có cái ô to mà không biết trời sắp mưa.
    _Bạn không biết nên cười hay sợ._
    ~ long_bh(3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_editor ===
# npc:editor
editor: *(ngáp)* Ông {con_ong_chau_cha}… có gì hông…
+ [🎵 "Ông {editor}, ông ghép nhạc vào video được hông? Nhạc tui… à, nhạc người quen."]
    editor: Được. Đưa file. Render xong là xong.
    _Hai tiếng sau, {editor} gửi lại một đoạn video 30 giây, cảnh Siêu Nhân Hồng nhặt cam, nhạc nền là bài của bạn. Ở giây thứ 17, có một con cú nhỏ lướt qua._
    ~ long_bh(5)
    ~ qh("editor", 6)
+ [☕ Đặt lon nước tăng lực lên bàn.]
    editor: *(gật)* Ông là người thứ hai tuần này cho tui đồ uống. Người kia là anh {truong_phong}.
    ~ qh("editor", 5)
+ [😎 "Ông thức đêm hoài vậy hông mệt hả?"]
    editor: Ông cũng thức. Mắt ông thâm y chang tui.
    con_ong_chau_cha: …Ờ ha.
    ~ qh("editor", 3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_designer ===
# npc:designer
designer: Anh {con_ong_chau_cha}… anh lại tới duyệt poster hả? *(lùi một bước)*
+ [😅 "Hông. Tui tới xin lỗi vụ chọn bản xấu nhất."]
    designer: *(mở to mắt)* Anh… xin lỗi? Trời ơi, ghi vô lịch sử công ty!
    ~ qh("designer", 10)
+ [🎨 "Chị làm giúp tui cái bìa cho một bài hát được hông? Màu hồng, mà đừng hồng quá."]
    designer: Hồng mà đừng hồng quá… là hồng cỡ nào ạ?
    con_ong_chau_cha: Hồng như… lúc trời sắp sáng.
    designer: *(im lặng)* …Feedback cụ thể nhất em từng nghe. Em làm.
    ~ qh("designer", 8)
    ~ long_bh(3)
+ [🛒 "Laptop chị chậm vậy, sao hông mua cái mới?"]
    designer: Tiền đâu anh? Mà… em có hai laptop rồi.
    _{designer} nói câu đó rồi vội gập cái laptop thứ hai lại. Màn hình lóe lên màu xanh lá chuối._
    ~ qh("designer", -2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_sales ===
# npc:sales
sales: Anh {con_ong_chau_cha}! Tin chị đi… à, tin em đi! Mr. Kevin Trộn muốn gặp chú anh để chốt 2 tỷ!
+ [😎 "Ok, để tui gọi chú tui."]
    ~ long_goi_chu()
    sales: Đó! Thấy chưa! Anh là người có tầm nhìn!
    ~ qh("sales", 5)
+ [📊 "{sales}. Cho tui số điện thoại Mr. Kevin. Tui gọi thử."]
    sales: *(tái mặt)* Ổng… ổng ở nước ngoài. Lệch múi giờ. Gọi giờ này ổng ngủ.
    con_ong_chau_cha: Nước nào?
    sales: Sao mà căng!
    ~ long_tl(3)
    ~ qh("sales", -5)
+ [🤝 "Em ơi, tui chốt được 3 nhãn hàng thiệt trong quận. Muốn đi chung hông?"]
    { long_so_nhan_hang >= 1:
        sales: *(khựng lại)* Thiệt hả? Có hợp đồng hả? Có… tiền thật hả?
        con_ong_chau_cha: Có. Nhỏ thôi. Mà thật.
        sales: …Lần đầu em nghe chữ "thật" mà thấy ghen.
        ~ qh("sales", 6)
    - else:
        sales: Anh chốt được cái nào chưa?
        con_ong_chau_cha: …Chưa.
        sales: Vậy mình giống nhau rồi đó anh.
    }
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {con_ong_chau_cha}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
+ [😇 Ngồi xuống.]
    chi_dai: Thằng {thuc_tap_sinh} mặc giống em cả tháng nay đó. Áo 4 triệu nó mua trả góp. Em biết hông?
    con_ong_chau_cha: *(khựng lại)* …Em hông biết.
    chi_dai: Ừ. Giờ biết rồi. Lần sau nói chuyện giá cả cẩn thận.
    ~ qh("chi_dai", 4)
    ~ long_bh(4)
    ~ long_tl(2)
+ [😎 "Em ăn nhà hàng rồi chị."]
    chi_dai: Nhà hàng gì giờ này? Thẻ em về 0 rồi mà. Ngồi xuống ăn.
    ~ an(30)
    ~ qh("chi_dai", 3)
+ [🎸 "Chị {chi_dai}, chị nghe bài này giùm em. Nói thiệt nha."]
    _{chi_dai} nghe hết. Không nói gì. Rồi vỗ vai bạn một cái rất mạnh._
    chi_dai: Hay. Đứa nào chê, chỉ mặt chị.
    ~ qh("chi_dai", 8)
    ~ long_bh(6)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {con_ong_chau_cha}! Kèo mới! Lần này là lên thật!
+ {tien >= 1000000} [💸 "Kèo gì? Tui bỏ 1 triệu thử."]
    dan_dau_tu: Tuần sau x5! Tầm nhìn!
    ~ tien_cong(-1000000)
    ~ long_dau_tu_moi = long_dau_tu_moi + 1000000
    ~ qh("dan_dau_tu", 4)
+ {tien < 1000000} [💸 "Bao nhiêu anh? Mà tui hông có một triệu đâu."]
    dan_dau_tu: *(sững người)* Em… hông có một triệu? Em á?
    con_ong_chau_cha: Ừ. Tui giờ sống bằng lương.
    dan_dau_tu: …Vậy em giàu hơn anh rồi. Anh sống bằng niềm tin.
    ~ long_tl(2)
    ~ qh("dan_dau_tu", 2)
+ [📊 "Anh {dan_dau_tu}, cho tui số liệu người nghe nhạc trong quận. Số thật."]
    dan_dau_tu: *(nghiêm túc hẳn)* Số thật thì anh giỏi nhất quận. Chiều nay có.
    ~ long_bh(4)
    ~ qh("dan_dau_tu", 5)
+ [💬 "Cái vốn góp chung 10 triệu đó, anh còn nhớ hông?"]
    dan_dau_tu: *(rơi bánh mì)* …Nhớ. Anh nhớ mỗi đêm.
    ~ qh("dan_dau_tu", -2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(giọng yếu ớt)* Ông {con_ong_chau_cha}… mai tui xin nghỉ… bà ngoại tui…
+ [😎 "Ông xin chú tui á, tui đâu có duyệt được."]
    thanh_xin_nghi: Ờ ha. Ông phó phòng một người mà. *(giọng khỏe hẳn)* Thôi tui đi xin anh {hr}.
+ [🎤 "Ông hát hay lắm đó. Tui nghe trên Đài Tivi Hóng rồi."]
    thanh_xin_nghi: *(đứng hình)* …Ông thấy hả? Đừng kể anh {hr} nha!
    con_ong_chau_cha: Hông kể. Mà ông dạy tui lấy hơi được hông? Tui hát hụt hơi đoạn cao.
    thanh_xin_nghi: *(mắt sáng lên)* Ông hát hả? Được! Lấy hơi bằng bụng, hông phải bằng vai!
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 10)
    ~ long_bh(5)
+ [💬 "Bà ngoại ông ốm lần thứ mấy rồi?"]
    thanh_xin_nghi: Lần thứ… tám. Mà ông đừng nói ai nha.
    ~ qh("thanh_xin_nghi", -2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Ừ. {con_ong_chau_cha} đấy à. Uống chén trà.
+ [🍵 Ngồi xuống uống trà.]
    bac_bao_ve: Dạo này cháu đi xe buýt à? Bác thấy cháu đi bộ từ trạm vào.
    con_ong_chau_cha: Dạ. Xe con… bán rồi bác.
    bac_bao_ve: Ừ. Đi bộ cũng tốt. Thấy được nhiều thứ.
    ~ qh("bac_bao_ve", 6)
    ~ long_tl(2)
+ [😎 "Bác ơi, chú tui hồi trẻ thế nào?"]
    bac_bao_ve: *(rót trà, chậm rãi)* 21 tuổi. Gầy. Một cái ba lô. Đi làm sớm nhất, về muộn nhất. *(ngừng)* Giống ai đó dạo này.
    ~ qh("bac_bao_ve", 5)
    ~ long_bh(4)
+ [🐕 "Bác cho con chơi với {cho} chút."]
    bac_bao_ve: Nó không cắn cháu đâu. Cháu không mặc đồ hồng.
    ~ qh("cho", 4)
- bac_bao_ve: Tối qua bác nghe tiếng đàn trên sân thượng. Cháu đấy à?
+ [🤫 "Dạ… bác đừng kể ai."]
    bac_bao_ve: Bác không thấy gì đâu. *(uống trà)* Nhưng bài đấy hay.
    ~ qh("bac_bao_ve", 6)
    ~ long_bh(3)
+ [😶 "Dạ hông phải con."]
    bac_bao_ve: Ừ. Thế thì là con mèo nào đánh đàn hay thế.
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: {con_ong_chau_cha} ơi! Biến hình! Hồng không phải màu, Hồng là thái độ!
+ [🎵 "Anh nói lại câu đó chậm chậm giùm em."]
    sieu_nhan_hong: Hồng… không phải màu… Hồng… là thái độ. Sao vậy em?
    con_ong_chau_cha: Hông có gì. Câu đó có nhịp.
    ~ long_bh(4)
    ~ qh("sieu_nhan_hong", 3)
+ [📸 "Anh đứng đây, em chụp anh 'tình cờ' đi ngang quán."]
    sieu_nhan_hong: Tình cờ hả? *(tạo dáng 7 kiểu)* Tình cờ vậy được chưa?
    ~ follow(4000)
    ~ long_so_lan_check_in = long_so_lan_check_in + 1
    ~ qh("sieu_nhan_hong", 4)
+ [💬 "Anh giàu vậy, sao còn muốn nổi tiếng?"]
    sieu_nhan_hong: *(nhỏ giọng hẳn)* Vì… nhà anh có bàn ăn 12 ghế. Anh ngồi một ghế.
    _Bạn nhớ tới cái bể cá to hơn phòng trọ. Bạn hiểu._
    ~ qh("sieu_nhan_hong", 8)
    ~ long_bh(6)
- sieu_nhan_hong: Mà {con_ong_chau_cha} nè… em có gì muốn làm mà chưa dám làm hông?
+ [🎸 "Có. Hát một bài cho nhiều người nghe."]
    sieu_nhan_hong: Vậy làm đi! Gét gô! Anh đứng dưới cổ vũ!
    ~ qh("sieu_nhan_hong", 6)
+ [😎 "Hông. Tui chill."]
    sieu_nhan_hong: Ờ… *(tạo dáng, nhưng chậm hơn bình thường)*
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_tudo_cho ===
# npc:cho
cho: Gâu? *(ngửi đôi sneaker trắng)*
+ [🦴 Đưa một cây xúc xích.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        cho: Gâu gâu! *(vẫy đuôi như cánh quạt)*
        ~ qh("cho", 10)
    - else:
        _Bạn sờ túi. Không có xúc xích. Năm ngoái bạn sẽ quẹt thẻ mua cả thùng. Năm nay không._
        cho: …Grừ.
    }
+ [🎸 Gảy vài nốt đàn.]
    cho: *(nghiêng đầu, ngồi xuống nghe)* Gâu.
    _{cho} ngồi im nghe hết đoạn. Khán giả đầu tiên không biết bạn là cháu ai._
    ~ qh("cho", 6)
    ~ long_bh(2)
+ [🐾 Ngồi xổm xuống xoa đầu.]
    cho: *(dụi đầu vào tay)*
    ~ qh("cho", 5)
    ~ cang_thang(-5)
- -> END
