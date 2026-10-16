// ============================================================
// HR: TUẤN · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== hr_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Anh {hr}! Em mới viết bản tin nội bộ tuần này nè. Có mục "Gương mặt nhân sự", em định viết về anh. Anh kể em nghe chút được hông?
+ [😊 "Viết về anh hả? Ghi: thích trà, ghét đi trễ."]
    ran_doc: Dạ… em ghi thêm "nụ cười ấm áp" nha anh. *(cười rất ngọt)*
    ~ qh("ran_doc", 3)
+ [💬 "Em hỏi kỹ quá ha. Hôm trước em cũng hỏi anh phòng HR có máy hủy giấy hông."]
    ran_doc: Dạ tại em thích gọn gàng á anh. *(không chớp mắt)*
    ~ hr_ro_ri(-3)
- ran_doc: Mà anh nè, nói nhỏ thôi nha… nghe nói anh đang giữ một tập hồ sơ màu hồng hả?
+ [😶 "Cả công ty này cái gì cũng màu hồng mà em."]
    ran_doc: Dạ đúng ha. Em hỏi vậy thôi chứ không có ý gì đâu.
+ {hr_biet_xom_cay_me} [🔒 "Em hỏi chuyện của anh, còn chuyện xóm Cây Me của em thì sao?"]
    _{ran_doc} cứng người. Nụ cười rơi xuống nửa giây, rồi được dán lại._
    ran_doc: Dạ… chuyện cũ thôi anh. Ai cũng có cái nhà kho của mình mà.
    hr: Ừ. Có gì muốn kể thì phòng anh có trà. Không ghi sổ.
    ~ qh("ran_doc", 5)
    ~ hr_nghe(3)
+ [📓 "Em đi làm 1 tháng mà biết nhiều chuyện ghê. Lên phòng anh uống trà xíu không?"]
    ~ hr_so(3)
    ran_doc: Dạ thôi anh, em… đang bận viết bản tin. *(đi nhanh)*
- -> END

// ------------------------------------------------------------
=== hr_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {hr} đấy à. Vào đây. Anh đang nghĩ cái mindset của công ty mình phải thay đổi. Phải "gia đình" hơn nữa.
+ [🍵 "Dạ, gia đình thì phải uống trà chung. Anh uống trà sen hông?"]
    giam_doc: Ừ, rót đi. Hồi 2010 anh với {bac_bao_ve} uống trà đá ở căn phòng 20 mét vuông. Giờ uống trà sen trong phòng kính. Mà sao anh thấy không ngon bằng.
    ~ qh("giam_doc", 5)
    ~ hr_tra()
+ [💬 "Gia đình thì không ai có danh sách cắt giảm đâu anh."]
    giam_doc: *(khựng lại)* Em… nói nhỏ thôi. Gia đình nào cũng có lúc khó khăn.
    ~ qh("giam_doc", -3)
    ~ hr_nghe(2)
- giam_doc: À, mà {hr} này. Anh hỏi thật nhé. Anh em có ghét anh không?
+ [😇 "Không ghét anh. Họ sợ mất việc. Anh mà tăng lương thì hết sợ liền."]
    giam_doc: Haha! Em nói chuyện giống {chi_dai} thế. Thôi, ra ngoài đi.
    ~ qh("giam_doc", 3)
+ [😊 Cười Nụ Cười Nhân Sự: "Dạ, ai cũng thương anh hết."]
    giam_doc: *(rùng mình)* Em cười thế thì anh biết là có người ghét anh rồi.
    ~ hr_so(2)
+ {qh_giam_doc >= 40} [🔒 "Anh có đang giấu chuyện gì với cả công ty không anh?"]
    giam_doc: *(nhìn ra cửa kính, về phía Đồi Ngân Hàng)* Ai mà chẳng giấu, em. Em cũng giấu một tập hồ sơ hồng còn gì.
    ~ hr_nghi_trang_2 = true
- -> END

// ------------------------------------------------------------
=== hr_tudo_truong_phong ===
# npc:truong_phong
truong_phong: Anh {hr}, em xin anh 5 phút. Em muốn họp với anh về… việc tổ chức họp đánh giá nhân sự theo quý.
+ [💬 "5 phút thật hay 5 phút kiểu anh {truong_phong}?"]
    truong_phong: 5 phút thật mà anh. *(mở laptop, slide số 1 trên 34)*
    ~ cang_thang(5)
+ [🍵 "Họp ở phòng HR đi, có trà."]
    truong_phong: Ơ… ở phòng HR ạ? *(nuốt nước bọt)* Thôi, mình họp ở phòng "Sáng Tạo" cho nó… sáng tạo.
    ~ hr_so(2)
- truong_phong: Mà anh {hr}, nói thật với anh nhé, ghế phó giám đốc ấy, anh có biết sếp nghiêng về ai không? Em hay {con_ong_chau_cha}?
+ [😶 "HR không bàn chuyện đề bạt khi chưa có quyết định."]
    truong_phong: Vâng. Em take note. *(ghi thật)*
+ [🤝 "Nói thật nha, {con_ong_chau_cha} không muốn cái ghế đó đâu. Anh lo phần anh thôi."]
    truong_phong: Thật á? Sao anh biết?
    hr: HR nhìn người ta đi làm lúc 10 giờ là biết người ta muốn gì.
    ~ qh("truong_phong", 8)
+ [🗣️ "Mình cùng nhìn lại hành trình của em nha. Em lên trưởng phòng vì là người cuối cùng còn lại."]
    truong_phong: *(mặt xám lại)* Vâng. Cảm ơn anh. Rất… thẳng thắn.
    ~ qh("truong_phong", -8)
- -> END

// ------------------------------------------------------------
=== hr_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Anh {hr} ơi, hôm nay anh mặc áo đẹp quá à. Áo này mà đi họp với sếp là sếp duyệt hết luôn đó anh!
+ [😊 "Cảm ơn em. Áo anh mặc từ 2019."]
    thanh_ninh: Dạ… áo 2019 mà như mới, chứng tỏ anh giữ gìn có tâm quá anh ơi!
+ [💬 "Em khen anh, chắc là cần gì phải hông?"]
    thanh_ninh: *(cười gượng)* Dạ… dạ em chỉ hỏi chút thôi. Nếu nhân viên muốn… xin nghỉ không lương 1 ngày đi… phỏng vấn… à không, đi khám… thì cần giấy gì anh?
    ~ hr_nghe(2)
- thanh_ninh: Mà anh ơi, sếp có nói gì về em không anh? Kiểu… sếp còn tin em không?
+ [🍵 "Sếp tin em nhất công ty. Vì vậy em càng phải cẩn thận với những lời mời màu xanh lá chuối."]
    _{thanh_ninh} tái mặt, rồi cúi đầu._
    thanh_ninh: Dạ… em hiểu rồi anh.
    ~ qh("thanh_ninh", 8)
+ [📓 "Sếp không nói gì. Nhưng email của em hay gửi lúc 5 giờ chiều, em kiểm tra người nhận kỹ nha."]
    thanh_ninh: Dạ… em kiểm tra kỹ lắm anh. Anh nói chuẩn quá anh ơi!
    ~ qh("thanh_ninh", 3)
- -> END

// ------------------------------------------------------------
=== hr_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Anh {hr}! Nghe gì chưa? Mà thôi, anh là HR, anh nghe hết rồi. Kể em nghe với!
+ [😊 "Anh không kể đâu. Nhưng em kể thì anh nghe."]
    hong_hot: Ối dồi ôi, HR mà hóng ngược hả? Được! Vụ đầu tiên: anh {chua_te_deadline} với Siêu Nhân Hồng đó…
    ~ qh("hong_hot", 5)
    ~ hr_nghe(2)
+ [📓 "{hong_hot}, giờ làm mà em ngồi pantry 2 tiếng rồi đó."]
    hong_hot: Ủa alo? Em đang làm việc mà! Em đang theo dõi phản ứng khán giả… ở pantry!
    ~ hr_so(3)
    ~ qh("hong_hot", -3)
- hong_hot: Mà nói thiệt, có phải anh có cái danh sách đó hông? Cả group bàn tán quá trời.
+ [😶 "Group nào? Anh không ở trong group nào hết."]
    hong_hot: *(nheo mắt)* Ờ… anh không ở. Nhưng có người gửi anh coi, đúng hông?
    ~ hr_ro_ri(3)
+ {hr_biet_ngan_co_trang} [🔒 "{hong_hot}, chuyện em làm admin một trang, anh không hỏi trang nào. Em cũng đừng hỏi danh sách nào nha."]
    _{hong_hot} im bặt. Lần đầu tiên trong năm._
    hong_hot: …Ờ. Deal. Anh giữ của em, em giữ của anh.
    ~ hr_ro_ri(-15)
    ~ qh("hong_hot", 10)
+ [🍵 "Em uống trà hông? Không có gì đâu, uống thôi."]
    hong_hot: HR mời uống trà mà "không có gì đâu". Câu đáng sợ nhất năm! *(nhưng vẫn uống)*
    ~ hr_tra()
    ~ hr_so(-2)
- -> END

// ------------------------------------------------------------
=== hr_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Ê anh {hr}. Chấm công cho em 8 giờ nha. Em tới 10 giờ mà tại kẹt xe… trong hồ bơi Sky Ảo.
+ [📓 "Chấm 10 giờ. Đi trễ quá 5 phút, 50.000 vào quỹ trà sữa."]
    con_ong_chau_cha: Chill đi anh. Em đóng luôn 500 ngàn, đóng trước cả tháng.
    ~ hr_quy_tra_sua = hr_quy_tra_sua + 500000
    _Quỹ trà sữa thứ 6 chưa bao giờ giàu như vậy._
+ [😊 "Để anh gọi chú em."]
    con_ong_chau_cha: *(giật mình)* Ủa, câu đó là của em mà! Thôi, 10 giờ thì 10 giờ.
    ~ qh("con_ong_chau_cha", 3)
- con_ong_chau_cha: Mà anh… nói thiệt nha. Nếu em muốn tự đi làm ở chỗ khác, không có chú, thì hồ sơ em… có gì không anh?
+ [🤝 "Có. Hồ sơ em có 3 năm phó phòng mà không ai biết em làm gì. Em muốn đi thì phải làm gì đó cho người ta thấy trước."]
    con_ong_chau_cha: *(im lặng)* …Ờ. Em có làm. Mà chưa ai nghe.
    ~ qh("con_ong_chau_cha", 8)
    ~ hr_nghe(3)
+ [💬 "Ủa em tính bỏ chú hả?"]
    con_ong_chau_cha: Không, không. Em hỏi chơi. Đừng nói với chú nha anh.
- -> END

// ------------------------------------------------------------
=== hr_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: *(lướt Tóp-tóp)* Ủa anh {hr}. Còn sớm mà. Chill. Deadline còn 10 ngày.
+ [📓 "Deadline còn 1 ngày em. Hôm nay 29."]
    chua_te_deadline: …ÉT O ÉT! AI CỨU TUI VỚI!
    ~ cang_thang(-3)
+ [🍵 "Uống trà bạc hà hông? Tỉnh táo để lướt tiếp."]
    chua_te_deadline: Anh hiểu em quá. *(cầm ly)*
    ~ hr_tra()
    ~ qh("chua_te_deadline", 3)
- chua_te_deadline: Mà anh… cái vụ ổng nhắn em mỗi tối bằng sticker hồng… anh thấy có phải PR hông?
+ [😇 "PR không ai nhắn lúc 2 giờ sáng hỏi em ăn cơm chưa đâu {chua_te_deadline}."]
    chua_te_deadline: *(đỏ mặt, úp điện thoại)* Anh… anh đọc tin nhắn em hả?
    hr: Không. Anh đoán. Làm HR 7 năm, đoán trúng 9 phần.
    ~ qh("chua_te_deadline", 8)
+ [🗣️ "Chuyện tình cảm nơi công sở, phòng nhân sự khuyến khích minh bạch nha em."]
    chua_te_deadline: Ok mom. *(quay lại lướt Tóp-tóp)*
    ~ hr_so(2)
- -> END

// ------------------------------------------------------------
=== hr_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ em chào anh {hr} ạ! Anh cần em photo gì không ạ? Pha cà phê? Xếp ghế? Em làm liền ạ!
+ [😇 "Không cần gì hết. Em ngồi xuống nghỉ 5 phút đi {thuc_tap_sinh}."]
    thuc_tap_sinh: Dạ… nghỉ ạ? *(ngồi xuống, lưng vẫn thẳng như đang phỏng vấn)* Dạ em nghỉ rồi ạ.
    ~ qh("thuc_tap_sinh", 5)
    ~ hr_nghe(2)
+ [📋 "Photo giùm anh 21 bản hợp đồng lao động."]
    thuc_tap_sinh: Dạ em làm liền ạ! *(chạy đi)*
    _5 phút sau em nó quay lại, đã photo, đóng ghim, sắp theo bảng chữ cái, kèm mục lục. Như người từng làm ngân hàng._
    ~ uy_tin = uy_tin + 2
- thuc_tap_sinh: Dạ anh ơi… em hỏi chút được không ạ. Hết thực tập… em có được giữ lại không ạ?
+ [🤝 "Anh không hứa được. Nhưng anh hứa tên em không nằm trong cái gì màu hồng cả."]
    thuc_tap_sinh: Dạ… em không hiểu lắm, nhưng em cảm ơn anh ạ!
    { hr_them_ten_duy:
        ~ hr_ds(-1)
        ~ hr_them_ten_duy = false
    }
    ~ qh("thuc_tap_sinh", 8)
+ [😶 "Mình cùng nhìn lại hành trình thực tập của em vào 30/10 nha."]
    thuc_tap_sinh: Dạ… *(mặt tái dần)* dạ em cố gắng ạ.
    ~ hr_so(3)
- -> END

// ------------------------------------------------------------
=== hr_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {hr}. Đề xuất mua trà cho phòng HR tháng này của ông: 1.200.000đ. Hóa đơn đâu?
+ [📄 "Đây. 3 tờ, đủ chữ ký."]
    ke_toan: *(đọc kỹ từng dòng)* Ừ. Duyệt 600.000. Ông uống trà ít lại.
    ~ tien_cong(-100000)
    ~ qh("ke_toan", 3)
+ [😊 "Trà là để giữ chân nhân sự mà bà."]
    ke_toan: Chân nhân sự giữ bằng lương, không giữ bằng trà. Không có hóa đơn là không có tiền.
- ke_toan: Mà… dạo này ông có ngủ được hông? Mắt ông thâm hơn ông {quan_ly_idol} rồi đó.
+ [🍵 "Không. Tui có một tập hồ sơ, đêm nào cũng nằm trên bụng tui."]
    ke_toan: *(im lặng)* Tui cũng có một tờ giấy. Trang 47. Đêm nào cũng nằm trên bụng tui.
    hr: Vậy mình là hội mất ngủ.
    ke_toan: Hội có hai người thì không cần thủ quỹ.
    ~ qh("ke_toan", 8)
    ~ hr_nghe(3)
+ [😶 "Tui ổn."]
    ke_toan: Ông nói "ổn" giống tui nói "không có tiền". Ai cũng biết là sai.
+ {hr_da_gui_email} [🔒 "Bà đọc email tui gửi chưa?"]
    ke_toan: Đọc rồi. Đọc 4 lần. Ông đừng hỏi nữa, để tui tính.
    ~ qh("ke_toan", 5)
- -> END

// ------------------------------------------------------------
=== hr_tudo_it ===
# npc:it
it: *(không quay lại)* Máy hư thì restart. Wifi hư thì chờ. Hỏi chuyện người thì về phòng anh.
+ [🍵 Đặt một ly trà lên bàn, cạnh ly mì. "Không hỏi gì. Mang trà thôi."]
    it: …Cảm ơn. *(uống)* Trà gì?
    hr: Ô long. Cho người thức đêm.
    it: Đúng bài.
    ~ qh("it", 5)
    ~ hr_tra()
+ [💬 "Anh {it}, phòng HR có bị ai truy cập lạ không?"]
    it: Có. Hôm mất điện, một máy lạ bắt wifi hành lang. Không tên. Có mùi… à, wifi không có mùi.
    ~ hr_ro_ri(-5)
- it: Anh {hr}. Tủ hồ sơ của anh khóa từ. Mất điện là mở. Muốn tui gắn thêm ổ khóa cơ không?
+ [🗝️ "Có. Gắn giùm tui."]
    it: Ok. Chìa đây. Đừng để chó tha.
    ~ hr_khoa_tu = true
    ~ hr_ro_ri(-20)
    ~ qh("it", 3)
+ [😶 "Thôi, tui mang theo người được rồi."]
    it: Tùy. Lỗi người dùng thì đừng gọi tui.
- -> END

// ------------------------------------------------------------
=== hr_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen trong nhà)* {hr}. Phòng chờ của tui hôm nay không có trái cây. Em… à ông biết tui là ai không?
+ [😊 "Biết chứ. Người hát 'Công Viên'. Cả nước thuộc."]
    idol_het_thoi: *(gỡ kính ra lau, giấu vẻ vui)* Hồi tui còn nổi, phòng chờ có cả dĩa nho.
    ~ qh("idol_het_thoi", 5)
+ [📓 "Ông {idol_het_thoi}, phòng chờ là của Siêu Nhân Hồng. Hợp đồng ghi rõ."]
    idol_het_thoi: Tui biết. Tui chỉ… muốn có chỗ ngồi thôi.
    ~ qh("idol_het_thoi", -3)
- idol_het_thoi: Hợp đồng tui hết hạn 31/10. Ông là HR. Ông biết người ta tính gì với tui hông?
+ [🤝 "Chưa ai tính gì. Nhưng nếu tui được đề xuất, tui đề xuất gia hạn."]
    idol_het_thoi: Thiệt hả? Vì sao?
    hr: Vì tối mất điện, ông hát cho cả pantry nghe mà không đòi phòng chờ.
    ~ qh("idol_het_thoi", 10)
+ [😶 "Chuyện hợp đồng thì ông hỏi anh {quan_ly_idol}."]
    idol_het_thoi: {quan_ly_idol} lúc nào cũng nói "để anh lo". Tui sợ ổng lo quá rồi ngã quỵ.
    ~ qh("idol_het_thoi", 2)
- -> END

// ------------------------------------------------------------
=== hr_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút… *(2 điện thoại)* Alo… ừ… alo… Rồi, {hr}, em cần gì?
+ [🍵 "Em cần anh ngồi xuống 3 phút. Uống trà. Tắt máy."]
    quan_ly_idol: Tắt máy? *(nhìn hai cái điện thoại như nhìn hai đứa con)* …Một cái thôi được không?
    hr: Được.
    ~ qh("quan_ly_idol", 5)
    ~ hr_nghe(3)
+ [📋 "Em cần lịch của {idol_het_thoi} và Siêu Nhân Hồng tuần sau, để lo bảo hiểm sự kiện."]
    quan_ly_idol: Hỏi {thanh_xin_nghi}. Nếu {thanh_xin_nghi} có ở công ty. *(cười mệt)*
    ~ uy_tin = uy_tin + 1
- quan_ly_idol: {hr}, em làm HR. Anh hỏi em, giả sử có người mời anh đi chỗ khác, lương gấp đôi, thì người ở lại có trách anh không?
+ [💬 "Người ở lại là ai anh? Có phải người hát 'Công Viên' không?"]
    _{quan_ly_idol} đặt cả hai điện thoại xuống bàn. Lần đầu bạn thấy anh ấy không cầm máy._
    quan_ly_idol: …Em đừng nói lung tung.
    ~ qh("quan_ly_idol", 5)
+ [🤝 "Người ở lại sẽ không trách. Họ sẽ nhớ."]
    quan_ly_idol: Nhớ còn khổ hơn trách em ạ.
    ~ hr_nghe(3)
- -> END

// ------------------------------------------------------------
=== hr_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Anh {hr}. Em đang viết một nhân vật HR. Một người cười mà không ai dám cười lại. Em hỏi anh vài câu được không, cho có… chất liệu?
+ [😊 "Hỏi đi em. Anh cười cho em xem tại chỗ."]
    bien_kich: *(ghi chép rất nhanh)* Hay quá. Rất… đau. Rất văn học.
    ~ qh("bien_kich", 5)
+ [🕵️ "Nhân vật đó có tên không em?"]
    bien_kich: Dạ… *(lật sổ che lại)* …tên khác ạ. Hoàn toàn hư cấu.
    _Bạn liếc thấy dòng chữ trong sổ: "{hr} cười, {thuc_tap_sinh} chạy". Hư cấu quá._
- bien_kich: Anh có nghĩ người ta có quyền lấy chuyện người khác để viết không anh?
+ [🤝 "Có, nếu người ta xin phép. Như phim của em, em có xin phép {thuc_tap_sinh} chưa?"]
    _{bien_kich} đứng hình. Cây bút dừng giữa chữ._
    bien_kich: Anh… sao anh biết đó là ý của {thuc_tap_sinh}?
    hr: Hôm họp 2/10, anh đứng sát tường. HR đứng sát tường nghe được nhiều lắm.
    ~ qh("bien_kich", -5)
    ~ hr_nghe(3)
+ [😶 "Văn chương thì anh không rành, em ơi."]
    bien_kich: Dạ. Đây không phải đạo, đây là cảm hứng mà.
- -> END

// ------------------------------------------------------------
=== hr_tudo_editor ===
# npc:editor
editor: *(ngáp)* Anh {hr}… em chưa chấm công buổi sáng… tại em làm đêm… đợi render xong…
+ [😇 "Anh biết. Bác {bac_bao_ve} ghi em về lúc 3 giờ sáng. Anh tính công đêm cho em."]
    editor: *(mắt mở to lần đầu tiên trong ngày)* Thật ạ? Chưa ai… tính công đêm cho em…
    ~ qh("editor", 10)
    ~ hr_nghe(3)
+ [📓 "Nội quy là 8 giờ, em ạ."]
    editor: Dạ… *(gục xuống bàn)* 8 giờ sáng là 3 giờ khuya của em ạ…
    ~ hr_so(3)
- editor: Anh {hr}… nếu một người thích một người, mà người đó thích người khác… thì HR có quy định gì không ạ?
+ [🍵 "Không có quy định. Chỉ có trà hoa cúc, cho người khó ngủ."]
    editor: *(ôm ly trà)* Cảm ơn anh. Em… thôi, em đi render.
    ~ hr_tra()
    ~ qh("editor", 5)
+ [💬 "Người đó cầm hai cái điện thoại hả em?"]
    _{editor} đỏ mặt tới mang tai, rồi ngáp để che._
    editor: Em… em không biết anh nói gì ạ… *(trốn vào phòng dựng)*
- -> END

// ------------------------------------------------------------
=== hr_tudo_designer ===
# npc:designer
designer: Anh {hr}, poster tuyển dụng của anh, sếp bảo em sửa lần thứ 12. Anh cho xin feedback cụ thể được không ạ?
+ [😇 "Anh thấy bản đầu đẹp nhất. Em gửi lại bản đầu đi."]
    designer: *(mắt sáng lên)* Anh là người đầu tiên chọn bản đầu mà không phải sau 37 lần sửa!
    ~ qh("designer", 10)
+ [😊 "Sửa nhẹ thôi em. Thêm chút hồng."]
    designer: Sửa nhẹ thôi là sửa cái gì ạ? *(hết cứu)*
    ~ qh("designer", -5)
- designer: Mà anh… nếu nhân viên làm thêm ngoài giờ, cho… chỗ khác, có vi phạm gì không anh?
+ [📋 "Nếu không dính tới đối thủ, không lấy dữ liệu công ty thì không."]
    designer: *(im lặng hơi lâu)* …Dạ. Em hỏi giùm bạn em.
    ~ hr_nghe(2)
+ [🕵️ "Chỗ khác màu xanh lá chuối hả em?"]
    designer: *(làm rơi cây bút cảm ứng)* D… dạ hông anh!
    ~ hr_so(3)
    ~ qh("designer", -5)
- -> END

// ------------------------------------------------------------
=== hr_tudo_sales ===
# npc:sales
sales: Anh {hr}! Chị cần tạm ứng 20 triệu tiếp khách Mr. Kevin Trộn. Anh ký giùm chị cái giấy đề xuất nha. Chắc kèo!
+ [💬 "Em nhỏ hơn anh 4 tuổi mà xưng chị hả {sales}?"]
    sales: Trong kinh doanh, ai chốt deal người đó là chị. Tin chị đi!
    ~ qh("sales", 2)
+ [📋 "Tạm ứng thì qua bà {ke_toan}. HR chỉ ký nghỉ phép."]
    sales: {ke_toan} thì đòi hóa đơn. Mr. Kevin không xuất hóa đơn, ảnh… là tập đoàn đa quốc gia.
- sales: Mà anh ơi, nếu… giả sử nhà tài trợ của chị không tới thì chị có bị vô cái danh sách gì đó hông?
+ [🤝 "Em nói thật với anh trước. Nói thật thì anh tìm cách. Nói phét thì anh không cứu được."]
    _{sales} im lặng. Lần đầu tiên không có câu "chắc kèo"._
    sales: …Để chị suy nghĩ. À, để em suy nghĩ.
    ~ qh("sales", 8)
    ~ hr_nghe(3)
+ [😶 "Danh sách nào em?"]
    sales: Ờ… không có gì. Deal này chắc 100%.
- -> END

// ------------------------------------------------------------
=== hr_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {hr}. Ăn cơm chưa? Đi ăn cơm tấm. Ông ngồi phòng HR một mình hoài, người ta tưởng ông là ma.
+ [😇 "Đi. Tui bao."]
    chi_dai: Ông bao thì tui ăn hai dĩa. Thêm chả.
    ~ tien_cong(-70000)
    ~ an(50)
    ~ qh("chi_dai", 5)
+ [😊 Cười.]
    chi_dai: Ông cười nữa là tui đấm à nha. *(nhưng cũng cười theo)*
- chi_dai: Mà nghe nè. Thằng {thuc_tap_sinh}, nhỏ {hong_hot}, thằng {thanh_xin_nghi}… đứa nào ông động vô, ông bước qua xác tui trước.
+ [🤝 "Tui biết. Bà giữ tụi nhỏ, tui giữ cái danh sách cho nó trống."]
    chi_dai: *(nhìn bạn rất lâu)* Ông nói "trống" là phải trống. Tui nhớ đó.
    ~ qh("chi_dai", 8)
    ~ hr_nghe(3)
+ [🗣️ "Mình cùng nhìn lại hành trình của từng bạn nha bà."]
    chi_dai: Hành trình cái đầu ông. *(đẩy vai bạn, hơi mạnh)*
    ~ hr_so(-5)
    _Cả quán cơm tấm thấy HR bị đẩy. Ai cũng thấy HR… cũng là người._
- -> END

// ------------------------------------------------------------
=== hr_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {hr}! Em có 2 triệu không? Cho anh mượn. Đây là đáy, đáy thật rồi, x3 trong tuần.
+ [😶 "Em không có, anh ạ."]
    dan_dau_tu: Ừ, không sao. Anh hỏi bác {bac_bao_ve}. À, bác {bac_bao_ve} anh nợ rồi.
+ [💰 Cho mượn 500.000. "Anh ghi giùm em vào sổ nợ."]
    ~ tien_cong(-500000)
    ~ qh("dan_dau_tu", 8)
    dan_dau_tu: Em tốt nhất công ty! Anh ghi ngay. *(ghi, dưới 9 cái tên khác)*
- dan_dau_tu: Mà {hr}, anh hỏi thật nhé. Người nợ nhiều có bị vào danh sách cắt giảm không?
+ [🤝 "Không. Nhưng anh dùng con mắt phân tích số liệu thật, cho Siêu Nhân Hồng, thì chắc chắn không."]
    dan_dau_tu: Số liệu thật à? *(mở một file Excel cũ bám bụi)* Ừ… anh có một cái bộ lọc… lần ra được fan ảo đấy.
    ~ qh("dan_dau_tu", 5)
    ~ follow(5000)
+ [📓 "Nợ đồng nghiệp là không đẹp, anh ơi."]
    dan_dau_tu: Anh biết. Lần này là trả thật.
    ~ hr_so(2)
- -> END

// ------------------------------------------------------------
=== hr_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(thấy bạn, ho ngay lập tức)* Khụ khụ. Dạ em chào anh {hr}.
+ [💬 "Em ho trước khi anh hỏi luôn hả {thanh_xin_nghi}?"]
    thanh_xin_nghi: Dạ… phản xạ có điều kiện ạ.
    ~ qh("thanh_xin_nghi", 3)
+ [🍵 "Trà gừng nè. Trị ho. Ho thật hay ho giả đều trị được."]
    thanh_xin_nghi: *(cầm ly, cười gượng)* Dạ… anh chu đáo quá.
    ~ hr_tra()
    ~ uong(10)
- thanh_xin_nghi: Anh {hr}… em hỏi thiệt. Hồ sơ của em, anh định làm gì?
+ [📓 "Hồ sơ em dày 3 cm. Anh định để nó dày thêm, hay mỏng đi, tùy em."]
    thanh_xin_nghi: Dạ… em hiểu.
    ~ hr_so(3)
+ [😇 "Anh chưa quyết. Nhưng anh muốn biết, mấy ngày em nghỉ, em đi đâu. Không phải để ghi sổ."]
    thanh_xin_nghi: *(nhìn bạn rất lâu)* …Một ngày nào đó em kể anh nghe. Hứa.
    ~ qh("thanh_xin_nghi", 8)
    ~ hr_nghe(3)
+ {hr_biet_son_kim_tuyen} [🔒 Ngân nga một câu hát của {thanh_xin_nghi} Kim Tuyến.]
    _{thanh_xin_nghi} đứng hình. Rồi bất giác hát tiếp câu sau. Đúng tông._
    thanh_xin_nghi: …Anh!
    hr: Anh không nói ai đâu. Hát tiếp đi em, hay lắm.
    ~ qh("thanh_xin_nghi", 15)
- -> END

// ------------------------------------------------------------
=== hr_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Cháu {hr}. Ngồi đi. Trà đá hay trà nóng?
+ [🍵 "Trà đá bác. Hôm nay con muốn uống trà người khác pha."]
    bac_bao_ve: Ừ. *(rót)* Bác pha trà đá 16 năm. Chưa ai khen. Cũng chưa ai chê.
    ~ qh("bac_bao_ve", 5)
    ~ uong(20)
+ [💬 "Bác ơi, hôm qua ai về muộn nhất vậy bác?"]
    bac_bao_ve: Bác không thấy gì đâu.
    _Rồi bác nói thêm, rất nhỏ: "Thằng {editor}. Như mọi hôm."_
- bac_bao_ve: Cháu dạo này mặt nặng như cái cổng sắt. Có chuyện gì không nói được à?
+ [😢 "Dạ. Con phải chọn người đi, người ở. Con không chọn được."]
    bac_bao_ve: Bác chỉ biết mở cổng, đóng cổng. Nhưng bác biết một điều: ai đi qua cổng này, bác đều nhớ mặt. Cháu cũng thế. Thế là đủ.
    ~ qh("bac_bao_ve", 8)
    ~ cang_thang(-10)
+ [😶 "Dạ không có gì bác."]
    bac_bao_ve: Thế à. *(uống trà, không hỏi thêm)*
- -> END

// ------------------------------------------------------------
=== hr_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: {hr} ơi! Hồng không phải màu, Hồng là thái độ! *(tạo dáng)* Em cười lên cái coi! Anh nghe nói em cười đáng sợ lắm, anh không tin!
+ [😊 Cười. Hết cỡ.]
    sieu_nhan_hong: *(lùi lại một bước)* …Ờ. Ờ, ừ. Cũng… có thái độ. *(tạo dáng lại cho đỡ quê)*
    ~ hr_so(2)
+ [😇 "Anh có muốn uống trà hông? Không phải trà kỷ luật đâu."]
    sieu_nhan_hong: Trà hả? Có màu hồng hông?
    hr: Trà hoa hồng. Có luôn.
    sieu_nhan_hong: Slay!
    ~ qh("sieu_nhan_hong", 5)
    ~ hr_tra()
- sieu_nhan_hong: Mà {hr}… *(giọng nhỏ lại, như người khác)* nếu một người làm sai với một đứa nhỏ hồi xưa, giờ muốn xin lỗi mà không nhớ đứa đó là ai… thì làm sao?
+ {hr_biet_xom_cay_me} [🔒 "Có khi đứa đó đang ở rất gần anh. Gần lắm."]
    _{sieu_nhan_hong} im lặng rất lâu. Chiếc mũ hồng hơi cúi xuống._
    sieu_nhan_hong: …Cảm ơn em. Anh sẽ để ý.
    ~ qh("sieu_nhan_hong", 8)
+ [🤝 "Thì cứ tốt với mọi đứa nhỏ anh gặp. Tới lúc nào đó, sẽ trúng."]
    sieu_nhan_hong: *(gật đầu)* Anh đang làm vậy nè. Mỗi ngày.
    ~ qh("sieu_nhan_hong", 5)
+ [😶 "Cái đó anh hỏi phòng tâm lý, em là phòng nhân sự."]
    sieu_nhan_hong: À… ờ. Anh xin lỗi. *(tạo dáng, nhưng hơi xìu)*
- -> END

// ------------------------------------------------------------
=== hr_tudo_cho ===
# npc:cho
cho: Gâu? *(ngửi giày bạn, ngửi ly trà, ngửi tập hồ sơ trong tay bạn)*
+ [🌭 Cho {cho} một cây xúc xích.]
    cho: Gâu gâu! *(vẫy đuôi tới mức cả thân lắc theo)*
    ~ qh("cho", 10)
    { co(xuc_xich):
        ~ mat(xuc_xich)
    }
+ [😊 Cười với {cho}.]
    cho: …Gâu. *(nghiêng đầu, không hiểu, cũng không sợ)*
    _Sinh vật duy nhất ở {cong_ty} không sợ nụ cười của bạn. Vì nó không biết nụ cười HR nghĩa là gì._
    ~ qh("cho", 3)
- _{cho} ngậm lấy góc tập hồ sơ hồng, giật nhẹ, nhìn bạn, đuôi vẫy._
+ [🗝️ Giữ chặt. "Không, cái này không phải đồ chơi."]
    cho: Grừ… *(buông ra, giận dỗi)*
    ~ qh("cho", -3)
+ [🤝 Để nó kéo một chút rồi đổi bằng con gà cao su.]
    cho: Ẳng! *(vui sướng, ngậm gà chạy mất)*
    ~ qh("cho", 5)
    _Bạn nhìn theo. Có khi để {cho} tha tập hồ sơ này đi luôn, mọi chuyện lại dễ hơn._
- -> END
