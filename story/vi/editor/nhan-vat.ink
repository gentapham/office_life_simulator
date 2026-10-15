// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== editor_tudo_ran_doc ===
# npc:ran_doc
ran_doc: {editor}! Nói nhỏ thôi nha… ông làm đêm hoài, chắc thấy nhiều chuyện lắm ha? Ai ở lại công ty khuya nhất?
* [😴 "Dạ… em. Với con chó."]
    ran_doc: *(cười)* Ông vui tính ghê. Tui chỉ hỏi vậy thôi chứ không có ý gì đâu.
    ~ qh("ran_doc", 3)
* [🦉 "Anh hỏi để làm gì?"]
    ran_doc: Để… viết bản tin nội bộ. Mục "Người hùng thầm lặng". *(mắt hơi nheo)*
    _Bạn nhìn anh ta lâu hơn một giây. Khung hình này có gì đó lệch tông._
    ~ qh("ran_doc", -3)
* [💬 "Anh {it} ngủ ở phòng server. Bác {bac_bao_ve} trực chòi. Còn lại thì ai cũng về."]
    ran_doc: {it} ngủ ở phòng server… *(ghi vào sổ)* Cảm ơn ông.
    ~ qh("ran_doc", 5)
    ~ qh("it", -3)
+ [😶 Ngáp, quay lại màn hình.]
    -> END
- ran_doc: Mà nè, cái kênh "Cú Đêm Cắt Ghép" á… ông có coi hông? Tui thấy cái tai nghe con cú giống tai nghe ông ghê.
* [🎭 "Tai nghe này bán đầy ngoài chợ mà anh."]
    ran_doc: Ờ ha. Chợ nào bán vậy? Tui mua một cái. *(cười)*
    ~ ed_lo(3)
* {ed_cong_khai_kenh} [🔒 "Là em. Cả công ty biết rồi mà anh."]
    ran_doc: *(khựng lại nửa giây)* À… ờ. Tui chậm tin ghê.
    _Lần đầu tiên bạn thấy {ran_doc} không biết nói gì tiếp._
+ [😴 "Dạ… đợi render xong…"]
    ~ ed_lo(2)
- -> END

// ------------------------------------------------------------
=== editor_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {editor} à! Em lại ngủ ở công ty à? Văn hóa cống hiến! Anh tự hào!
* [😴 "Dạ… em không có nhà… à có, mà em không về."]
    giam_doc: Thế thì tốt quá… à không, thế không tốt. *(nghĩ)* Anh không ép, nhưng em về ngủ đi.
    ~ qh("giam_doc", 3)
* [🎬 "Anh ơi, video tháng này anh xem có ổn hông ạ?"]
    giam_doc: Ổn! {truong_phong} làm giỏi lắm!
    _Bạn gật đầu. Ngáp. Gật đầu tiếp._
    ~ ed_vo(2)
* {ed_dau_cu_chung_minh >= 2} [🔒 "Anh xem lại giúp em, trong mấy video tháng này… có con cú nhỏ. Ở cả 3 video."]
    giam_doc: Con cú? *(mở điện thoại, tua, tua, tua)* … Ơ. Thật. Ở đây cũng có. Ở đây cũng có. *(nhìn bạn)* Là em à?
    editor: Dạ. Là em.
    giam_doc: *(đặt điện thoại xuống, im lặng)* Anh hiểu rồi.
    ~ ed_vo(-15)
    ~ qh("giam_doc", 5)
+ [😶 "Dạ em chào anh."]
    -> END
- giam_doc: À, em giúp anh dựng cái clip golf nhé. Lần này anh đánh trúng bóng rồi.
* [✂️ "Dạ, em dựng. Có cảnh trúng bóng thật hông anh?"]
    giam_doc: Có! Lần thứ 14 thì trúng. Em cắt 13 lần trước đi nhé.
    ~ qh("giam_doc", 5)
    ~ ed_thuc_dem()
* {ed_co_giay_mat_cu} [🔒 Đưa giấy bác sĩ: "Dạ, bác sĩ dặn em làm ban đêm. Tối nay em dựng ạ."]
    giam_doc: *(đọc giấy)* "Mắt cú"? Ha! Bác sĩ này có tâm. Ừ, tối nhé.
    ~ qh("giam_doc", 3)
+ [😴 "Dạ… đợi render xong…"]
    giam_doc: Ừ. Render xong thì làm nhé. Anh không ép.
- -> END

// ------------------------------------------------------------
=== editor_tudo_truong_phong ===
# npc:truong_phong
truong_phong: {editor}. Mình sync nhanh 5 phút nhé. À mà… em ngồi đi. Anh… anh hỏi một câu kỹ thuật thôi.
* [💬 "Dạ, anh hỏi đi."]
    truong_phong: *(nhỏ giọng, nhìn quanh)* Cái phím tắt cắt đoạn… là phím C hay phím X nhỉ?
    editor: Dạ… C ạ.
    truong_phong: Ừ. Anh biết rồi. Anh chỉ… kiểm tra em thôi.
    _Bạn nhớ ra: có một người dùng tên "{truong_phong} Sáng Tạo" hay bình luận dưới video hướng dẫn trên kênh của bạn, toàn hỏi phím tắt. Bạn không nói gì._
    ~ qh("truong_phong", 5)
* [✋ "Anh ơi, tháng này em xin ghi tên trong ô 'Người thực hiện' được hông?"]
    truong_phong: *(khựng lại)* Ừ… mình take note lại nhé. Tuần sau.
    ~ ed_vo(-3)
    ~ ed_can(2)
    ~ qh("truong_phong", -3)
* [😴 Ngủ Gật Chiến Lược ngay trên ghế đối diện.]
    { RANDOM(1, 10) <= 5:
        _Năm phút. Bạn gật đầu đúng ba lần. {truong_phong} hài lòng ra về._
        ~ nghi(5)
    - else:
        truong_phong: {editor}, em thấy thế nào?
        editor: Dạ… render xong là xong.
        truong_phong: *(nghĩ một lúc)* …Hay. Câu này anh mượn cho slide nhé.
    }
+ [😶 "Dạ em đang render."]
    -> END
- truong_phong: Mà… nếu một ngày em không dựng nữa, thì công ty sẽ thế nào nhỉ?
* [✋ "Thì anh sẽ phải tự dựng anh."]
    truong_phong: *(cười gượng)* Ừ… anh đang học. Thật đấy.
    ~ qh("truong_phong", 3)
* [😇 "Em vẫn dựng mà anh. Chỉ cần có tên em là được."]
    truong_phong: *(im lặng)* Ừ. Anh nghe rồi.
    ~ ed_vo(-5)
    ~ qh("truong_phong", 5)
+ [😴 "Dạ…"]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: {editor}! Chị nói em nghe nè: sếp muốn clip mừng sinh nhật công ty có cảnh sếp đẹp nhất. Em lo nha.
* [🎨 "Dạ em Cứu Màu cho sếp sáng da ạ."]
    thanh_ninh: Đúng rồi! Sáng da mà vẫn giữ nét "doanh nhân". Em giỏi quá trời giỏi!
    ~ qh("thanh_ninh", 5)
* [😴 "Dạ… chị gửi tư liệu đi ạ."]
    thanh_ninh: Tư liệu là… em tự tìm đi! Sếp tin em mà.
    ~ cang_thang(5)
+ [😶 Gật đầu.]
    -> END
- thanh_ninh: À mà… *(nhìn quanh, nhỏ giọng)* em dựng giùm chị một video giới thiệu bản thân được hông? Kiểu… để nộp chỗ khác. Không phải công ty mình.
* [🤐 "Dạ được. Em không hỏi chỗ nào."]
    thanh_ninh: *(thở phào)* Em hiểu chuyện ghê. Chị nợ em.
    ~ qh("thanh_ninh", 10)
    ~ ed_thuc_dem()
* [💬 "Chỗ khác là… tòa nhà kính màu xanh lá chuối hả chị?"]
    thanh_ninh: *(mặt tái)* Em… em đừng nói ai nha. Chị chỉ… đi xem thôi.
    ~ qh("thanh_ninh", -5)
    _Màu xanh lá chuối. Bạn đã thấy nó trong một story bị xóa sau 20 giây. Nhiều người trong công ty đang nhìn về cùng một tòa nhà._
+ [😶 "Dạ em bận lắm chị."]
    thanh_ninh: Ờ. *(nụ cười cứng lại)* Không sao.
- -> END

// ------------------------------------------------------------
=== editor_tudo_hong_hot ===
# npc:hong_hot
hong_hot: {editor}! Nghe gì chưa? À mà ông nghe gì được, ông ngủ suốt. Để tui kể!
* [😴 "Dạ… chị kể đi, em nghe bằng một tai."]
    hong_hot: {chua_te_deadline} nhìn cái gối ôm hồng 20 phút! Ối dồi ôi! Tình yêu đó!
    ~ qh("hong_hot", 5)
* [🎬 "Chị gửi em clip livestream hôm qua, em dựng lại cho fanpage."]
    hong_hot: Trời ơi, ông là người duy nhất trả lời tin nhắn tui trước 5 giây! Gửi liền!
    ~ qh("hong_hot", 10)
    ~ follow(3000)
+ [😶 Đeo tai nghe vào.]
    -> END
- hong_hot: Mà nè… ông có thấy kênh "Cú Đêm Cắt Ghép" hông? Tui nghi người làm kênh đó ở gần đây lắm.
* [🎭 "Em không coi Diu-túp. Em chỉ coi thanh render."]
    hong_hot: *(nheo mắt)* Ờ. Thanh render. Ông nói câu đó lần thứ 47 rồi đó.
    ~ ed_lo(3)
* {ed_cong_khai_kenh} [🔒 "Chị muốn em ký tên lên tay hông?"]
    hong_hot: MUỐN! *(chìa tay)* Ký to! Mai tui đi làm không rửa tay!
    ~ qh("hong_hot", 10)
* {not ed_cong_khai_kenh} [🤫 "Nếu em biết chủ kênh là ai… chị giữ bí mật được hông?"]
    hong_hot: *(đứng hình)* … *(thì thầm)* Được. Tui thề. Lần này thề thật. Có {it} làm chứng.
    ~ ed_lo(10)
    ~ qh("hong_hot", 10)
- -> END

// ------------------------------------------------------------
=== editor_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: {editor}. Chill hông? Tui hỏi nhỏ: ông biết mix nhạc hông?
* [🎧 "Dạ biết sơ sơ. Anh có bài gì?"]
    con_ong_chau_cha: Một bài thôi. *(ngập ngừng)* Bài… của bạn tui. Nghệ danh "Rồng". Ông nghe thử nha.
    _Bạn nghe tám giây. Giọng trong tai nghe là giọng của chính người đang đứng trước mặt bạn. Bạn không nói ra._
    ~ qh("con_ong_chau_cha", 10)
* [😴 "Dạ… đợi render xong…"]
    con_ong_chau_cha: Ờ. Chill. Tui chờ. Tui giỏi chờ lắm.
    ~ qh("con_ong_chau_cha", 2)
+ [😶 "Dạ không anh."]
    -> END
- con_ong_chau_cha: Ông đừng nói ai nha. Nhất là chú tui.
* [🤐 "Dạ. Em là cú. Cú không nói."]
    con_ong_chau_cha: *(cười)* Cú không nói. Hay. Tui xin câu đó làm lời bài hát.
    ~ qh("con_ong_chau_cha", 5)
* [💬 "Anh hát hay mà. Sao phải giấu?"]
    con_ong_chau_cha: Tại hát hay mà người ta tưởng nhờ chú tui thì… thà đừng hát.
    _Bạn hiểu cảm giác đó. Làm giỏi mà người khác được tên. Chỉ là theo chiều ngược lại._
    ~ ed_can(2)
+ [😶 Gật đầu.]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: {editor} ơi. Ông ơi. Ông dễ thương nhất công ty. Ông biết hông.
* [🦉 "Ông muốn gì?"]
    chua_te_deadline: Một cái clip ba mươi giây. Nhỏ xíu. Nhờ xíu thôi mà.
    editor: Hạn?
    chua_te_deadline: Hai tiếng nữa. Chill.
    ~ cang_thang(5)
    ~ qh("chua_te_deadline", 3)
* [✋ "Ông nợ tui một bữa từ hồi tháng 9 rồi đó."]
    chua_te_deadline: Ờ ha. *(móc túi)* Đây. Một phiếu cơm tấm. Ông ăn đi, ăn xong rồi dựng.
    ~ an(30)
    ~ qh("chua_te_deadline", 2)
+ [😴 Giả vờ ngủ.]
    -> END
- chua_te_deadline: Mà nè… cái vụ {sieu_nhan_hong} tặng gối ôm hồng á. Ông thấy… là PR hông?
* [🎬 "Em dựng mọi video có ảnh. Ảnh nhìn ông lâu hơn nhìn máy quay."]
    chua_te_deadline: *(im lặng)* … Ông đừng nói kiểu dựng phim vậy. Nghe thật quá.
    ~ qh("chua_te_deadline", 5)
* [😴 "Dạ… em không biết. Em không giỏi mấy cái đó."]
    chua_te_deadline: Ờ. Tui cũng không giỏi. Chill.
* {ed_biet_file_vu} [🔒 "Ông lo file tháng 6 trước đi. Bản sao nằm trong ổ của anh {it}."]
    chua_te_deadline: *(mắt mở to)* Thiệt hả?! Ông… ông là thánh! Thánh cú!
    ~ qh("chua_te_deadline", 15)
- -> END

// ------------------------------------------------------------
=== editor_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh {editor}! Anh cần em làm gì ạ? Pha cà phê đen đá không đường? Soát phụ đề? Canh render?
* [☕ "Cà phê. Cảm ơn anh."]
    thuc_tap_sinh: Dạ em đi liền! *(4 phút sau)* Dạ của anh nè!
    ~ uong(15)
    ~ nghi(20)
    ~ qh("thuc_tap_sinh", 3)
* [🎓 "Ngồi đây. Em dạy anh cắt đúng nhịp."]
    thuc_tap_sinh: *(mở sổ ô ly, viết "Bài 2: Cắt đúng nhịp")* Dạ em sẵn sàng ạ!
    _Anh ấy học nhanh. Nhanh tới mức đáng ngờ. Như một người từng phải học rất nhiều thứ khó hơn._
    ~ qh("thuc_tap_sinh", 10)
+ [😴 "Không cần gì đâu anh."]
    -> END
- thuc_tap_sinh: Dạ anh ơi… em hỏi chút được hông? Sao anh gọi em là "anh" vậy ạ?
* [😇 "Vì anh lớn hơn em ba tuổi."]
    thuc_tap_sinh: Dạ… mà em là thực tập sinh. *(đỏ mặt)* Em ngại quá.
    ~ qh("thuc_tap_sinh", 5)
* [🦉 "Vì anh là người duy nhất ở lại cùng em tới 3 giờ sáng mà không nhờ em làm gì."]
    thuc_tap_sinh: *(im lặng, rồi cười)* Dạ. Em ở lại tiếp ạ.
    ~ qh("thuc_tap_sinh", 10)
    ~ ed_can(2)
+ [😴 Ngáp.]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {editor}. Em đăng ký tăng ca đêm 18 đêm tháng này. Hóa đơn đâu em?
* [😴 "Dạ… tăng ca thì có hóa đơn gì ạ?"]
    ke_toan: Bảng chấm công. Có chữ ký trưởng phòng. *(chậm rãi)* Mà trưởng phòng thì không biết em làm gì ban đêm.
    ~ cang_thang(5)
* [🎬 "Dạ, chị xem log máy dựng. Giờ nào cũng có."]
    ke_toan: *(nhìn log)* … Ba giờ sáng. Bốn giờ sáng. Năm giờ sáng. *(thở ra)* Chị duyệt. Phụ cấp đêm.
    ~ tien_cong(300000)
    ~ qh("ke_toan", 5)
+ [😶 "Dạ em không cần phụ cấp đâu ạ."]
    ke_toan: Không cần thì chị không chi. *(ghi sổ)* Nhưng chị ghi nhận.
    -> END
- ke_toan: Mà em có thu nhập ngoài không? Nhớ khai thuế cá nhân nhé. Tháng này có đoàn kiểm tra.
* [😇 "Dạ có. Em khai đủ."]
    ke_toan: Tốt. *(gần như cười)* Người khai đủ là người chị thương.
    ~ qh("ke_toan", 5)
* [🦉 "Chị biết hả chị?"]
    ke_toan: Chị không biết gì. Chị chỉ biết ai mua cà phê 35 nghìn mỗi ngày mà lương mười ba triệu thì có nguồn khác.
    ~ ed_lo(5)
+ [😶 "Dạ."]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_hr ===
# npc:hr
hr: {editor} rảnh không, lên phòng anh uống trà xíu.
* [😰 "Dạ… em có làm gì sai hả anh?"]
    hr: Không. *(cười)* Anh chỉ muốn lắng nghe em thôi. Em đi trễ… 18 lần tháng này. Mình cùng nhìn lại hành trình nha em.
    ~ cang_thang(10)
* {ed_co_giay_mat_cu} [🔒 Đưa giấy bác sĩ: "Bệnh nhân nên làm việc ban đêm."]
    hr: *(đọc, đọc lại, đóng dấu "đã xem")* … Có giấy của phòng khám. Hợp lệ. Lần này anh bỏ qua.
    ~ ed_co_giay_mat_cu = false
    ~ qh("hr", 2)
+ [😴 "Dạ em đang render."]
    hr: Render xong thì lên nhé. Anh đợi.
    -> END
- hr: Mà {editor} này… em có biết ai trong công ty… hay ở lại ban đêm không? Anh hỏi cho chuyện an ninh thôi.
* [🤐 "Dạ, em chỉ thấy màn hình."]
    hr: Ừ. Màn hình. *(rót trà)* Em uống đi.
    ~ uong(15)
* [💬 "Anh {it} ngủ phòng server. Bác {bac_bao_ve} trực. Em dựng phim. Thế thôi anh."]
    hr: Cảm ơn em. Đúng như anh nghĩ.
    ~ qh("hr", 3)
+ [😶 Uống trà, im lặng.]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_it ===
# npc:it
it: Gì.
* [💻 "Máy dựng của em đơ."]
    it: Đang render hả?
    editor: Dạ.
    it: Vậy đừng tắt đi bật lại. Đợi.
    _Lần đầu tiên có người không khuyên bạn tắt đi bật lại. Bạn cảm động._
    ~ qh("it", 5)
* [🍜 Đặt hai ly mì lên bàn.]
    it: *(gật nhẹ)* Ngồi.
    _Hai người ăn mì trong tiếng quạt server. Không ai nói gì. Đó là cuộc trò chuyện dài nhất trong tháng của cả hai._
    ~ an(25)
    ~ qh("it", 8)
    ~ tien_cong(-30000)
+ [😶 "Không có gì anh."]
    -> END
- it: Log. Ba giờ sáng. Upload 4K.
* [🦉 "Anh giữ giùm em."]
    it: Ừ. Anh giữ nhiều thứ lắm.
    ~ qh("it", 5)
* {not ed_tu_lieu_16_nam} [💬 "Anh ơi… ổ cứng 'KHÔNG ĐƯỢC MỞ'… có gì trong đó vậy?"]
    it: Quá khứ.
    editor: Có cần ai mở hông?
    it: *(im lâu)* Có thể. Khi cần.
    ~ qh("it", 3)
+ [😴 "Dạ."]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen, trong phòng dựng tối om)* Em biết anh là ai không?
* [😴 "Dạ… anh {idol_het_thoi}. Em dựng clip đám cưới của anh tuần trước."]
    idol_het_thoi: À. *(tháo kính)* Cái clip cô dâu khóc. Em dựng hả? Hay lắm. Hay hơn anh hát.
    ~ qh("idol_het_thoi", 10)
* [🎤 "Dạ biết. Bản thu gốc 'Công Viên' năm 2015, giọng anh run ở chữ 'chiên'."]
    idol_het_thoi: *(khựng lại)* Sao em biết? Bản đó… anh tưởng mất rồi.
    ~ qh("idol_het_thoi", 5)
+ [😶 "Dạ… em đang render."]
    -> END
- idol_het_thoi: Em dựng cho anh một video comeback đi. Kiểu… hoành tráng. Có pháo hoa.
* [🎬 "Em dựng. Mà không có pháo hoa. Có anh hát thật thôi."]
    idol_het_thoi: Không pháo hoa? *(nghĩ lâu)* … Ừ. Thử.
    ~ ed_tien_tay()
    ~ follow(5000)
    ~ qh("idol_het_thoi", 5)
* [💬 "Anh có biết ai lo cho anh nhiều nhất công ty hông?"]
    idol_het_thoi: {quan_ly_idol} chứ ai. *(cười)* Thằng đó lo cho anh như lo cho con. Anh biết mà.
    _"Như lo cho con." Bạn nhìn {idol_het_thoi}. Anh ấy không biết. Anh ấy thật sự không biết._
    ~ ed_can(-2)
+ [😴 "Dạ… đợi render xong…"]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: *(hai điện thoại, cả hai đang rung)* {editor}! Khoan, anh nghe máy chút… *(30 giây sau)* Rồi. Em khỏe hông?
* [☕ Đưa ly cà phê: "Dạ em khỏe. Anh uống đi."]
    quan_ly_idol: *(nhận ly)* Ly thứ mấy hôm nay rồi ta… sáu. Ly của em ngon nhất.
    ~ ed_can(2)
    ~ qh("quan_ly_idol", 5)
    ~ tien_cong(-35000)
* [🎁 "Anh ơi, em mới dựng cái clip ngắn cho anh {idol_het_thoi}. Anh coi thử."]
    quan_ly_idol: *(xem, cười)* Trời ơi đẹp quá. Em làm hả? Sao em tốt với nghệ sĩ của anh vậy?
    editor: Dạ… tại em rảnh.
    _Bạn không rảnh. Bạn chưa bao giờ rảnh. Bạn chỉ có ba giờ sáng._
    ~ ed_tien_tay()
    ~ ed_can(3)
    ~ qh("quan_ly_idol", 5)
* {ed_noi_voi_thai} [🔒 "Thuật toán hôm nay vẫn thương anh {idol_het_thoi} hông anh?"]
    quan_ly_idol: *(bật cười)* Thuật toán tên {editor}. Anh biết rồi mà. Cảm ơn thuật toán nha.
    ~ ed_can(5)
    ~ qh("quan_ly_idol", 5)
+ [😶 "Dạ anh nghe máy đi."]
    -> END
- quan_ly_idol: Mà {editor}… em ngủ được mấy tiếng rồi?
* [😴 "Dạ… hai."]
    quan_ly_idol: Hai tiếng?! *(nhìn quầng thâm của bạn, rồi sờ quầng thâm của mình)* Mình giống nhau ghê. Ngủ đi em. Anh không giao gì tối nay.
    ~ ed_can(2)
    ~ nghi(10)
* [💬 "Còn anh?"]
    quan_ly_idol: Anh hả? *(cười mệt)* Anh ngủ trong xe. Ngủ giữa hai cuộc gọi. Quen rồi.
    _Bạn biết. Bạn có clip anh ấy ngủ trong xe. Trong thư mục. Bạn không nói._
    ~ ed_can(2)
* {ed_biet_ll_moi_thai} [🔒 "Anh… có định đi không?"]
    quan_ly_idol: *(nhìn bạn rất lâu)* Em nghe hôm sân thượng hả? *(thở dài)* Anh chưa biết. Anh mà đi thì ai lo cho {idol_het_thoi}.
    quan_ly_idol: Mà… em nữa. Ai mua cà phê cho anh.
    ~ ed_can(5)
- -> END

// ------------------------------------------------------------
=== editor_tudo_bien_kich ===
# npc:bien_kich
bien_kich: {editor}. Em ngồi đây. Chị cần một người im lặng để nghe chị đọc kịch bản.
* [😴 "Dạ, em im lặng giỏi nhất công ty."]
    bien_kich: *(đọc ba trang)* … Sao? Có nhịp hông?
    editor: Dạ. Trang hai chậm nửa giây.
    bien_kich: *(nhìn bạn)* Em nói chuyện như dựng phim. Chị ghi lại câu này nha.
    ~ qh("bien_kich", 5)
* [🎬 "Chị ơi, cảnh mưa trong phim… em dựng chậm lại một chút được hông?"]
    bien_kich: Được. Cảnh đó… *(ngập ngừng)* cảnh đó là của người khác. Em dựng cho đẹp nha.
    ~ qh("bien_kich", 5)
+ [😶 "Dạ em bận."]
    -> END
- bien_kich: Mà… em có muốn chị viết giùm một tin nhắn hông? Chị viết hộ hay lắm. Tỏ tình, xin lỗi, cảm ơn…
* [💌 "Dạ… một tin nhắn cảm ơn. Mà không giống cảm ơn."]
    bien_kich: *(mắt sáng lên)* Ai?
    editor: Dạ… không ai.
    bien_kich: Ừ. "Không ai" thì viết thế này: câu ngắn nhất là câu thật nhất. Em tự viết đi. Chị không viết hộ được cái thật.
    ~ ed_can(5)
* [😶 "Dạ không cần chị."]
    bien_kich: Ừ. Có những tin nhắn tự mình viết mới đúng.
+ [😴 Ngáp.]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_designer ===
# npc:designer
designer: {editor}. File poster đây. Đừng sửa màu. Sửa là chị sửa em.
* [🎨 "Dạ em chỉ Cứu Màu khi màn hình làm hồng thành chả lụa."]
    designer: *(nheo mắt)* … Ờ. Vậy thì được. Hồng chả lụa là kẻ thù chung.
    ~ qh("designer", 5)
* [💬 "Chị ơi, poster này chị làm mà trên slide ghi 'ý tưởng của anh {truong_phong}' đó chị."]
    designer: *(gằn giọng)* Tui biết. Sáu cái poster. Sáu lần.
    editor: Em sáu mươi mốt lần.
    designer: *(nhìn bạn, lần đầu không cau mày)* … Mình lập hội đi.
    ~ qh("designer", 10)
    ~ ed_can(2)
+ [😶 "Dạ."]
    -> END
- designer: Họp đánh giá cuối tháng, nếu chị đứng lên nói, em có đứng lên cùng hông?
* [✋ "Dạ có. Em đứng sau chị."]
    designer: Đứng cạnh. Không phải sau. *(cười nhẹ)* Đứng sau là thói quen xấu của em đó.
    ~ ed_vo(-3)
    ~ ed_can(3)
    ~ qh("designer", 5)
* [😴 "Dạ… em sợ đứng."]
    designer: Ờ. Chị cũng sợ. Nhưng chị sợ bị sửa lần thứ 38 hơn.
+ [😶 "Để em suy nghĩ."]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_sales ===
# npc:sales
sales: {editor}! Tin chị đi! Chị cần một video giới thiệu nhà tài trợ BTT Global. Chủ tịch Mr. Kevin Trộn. Dựng cho xịn vào nha!
* [🎬 "Dạ, chị gửi em footage của Mr. Kevin Trộn."]
    sales: Footage… *(ngập ngừng)* Ổng hơi kín tiếng. Em dựng logo xoay xoay là được.
    _Bạn dựng logo xoay xoay. Ba mươi giây logo một tập đoàn không có thật, xoay rất thật._
    ~ qh("sales", 5)
* [💬 "{sales}. Công ty đó có thật hông?"]
    sales: *(cười to)* Có chứ! No cap! *(nhỏ giọng)* … Có trong lòng chị.
    ~ qh("sales", -3)
+ [😴 "Dạ… đợi render xong…"]
    -> END
- sales: Mà nè, cái clip quảng cáo Sữa Chua Hồng Hào ở Ven Đô… họ gọi chị thật đó. Không ai tin. Em tin hông?
* [😇 "Dạ, em tin. Chị gửi em logo, em dựng thử bản giới thiệu."]
    sales: *(nhìn bạn rất lâu)* Em là người đầu tiên. Cảm ơn nha. Chị… à em… cảm ơn.
    ~ qh("sales", 10)
* [🦉 "Em tin khi em thấy footage."]
    sales: Hợp lý. Dân dựng phim. *(cười)*
+ [😶 Gật đầu.]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {editor}. Ăn cơm chưa? Đừng nói "đợi render xong". Chị hỏi lại: ăn cơm chưa?
* [😴 "Dạ… chưa."]
    chi_dai: *(đặt hộp cơm lên bàn phím)* Ăn. Ăn trước mặt chị.
    ~ an(55)
    ~ qh("chi_dai", 5)
* [🎭 "Dạ em ăn mì ly rồi."]
    chi_dai: Mì ly là đồ ăn hả? *(xách cổ áo bạn)* Xuống căn tin.
    ~ an(55)
    ~ qh("chi_dai", 3)
+ [😶 Ngáp.]
    -> END
- chi_dai: Có đứa nào bắt em làm đêm mà không ghi tên em không? Chỉ mặt chị.
* [😶 "Dạ không ai đâu chị."]
    chi_dai: Ờ. Chị không tin. Nhưng chị tôn trọng.
* [✋ "Dạ… sáu mươi mốt lần. Mà em không muốn chị đánh ai."]
    chi_dai: Chị không đánh. Chị nói chuyện. *(bẻ khớp tay)* Nói chuyện nhẹ nhàng.
    ~ ed_vo(-5)
    ~ qh("chi_dai", 5)
    ~ ed_can(3)
* {ed_so_lan_ngat >= 1} [🔒 "Chị ơi… em sợ ngất lần nữa."]
    chi_dai: *(ngồi xuống cạnh, giọng nhỏ lại)* Thì ngủ. Mai chị nói với {truong_phong}: {editor} nghỉ một ngày. Đứa nào cãi, chị lo.
    ~ ed_ngu_du()
    ~ qh("chi_dai", 10)
- -> END

// ------------------------------------------------------------
=== editor_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {editor}. Em có biết view kênh mình tăng giờ nào nhất không? 3 giờ sáng. Giờ của em. Số liệu không nói dối.
* [💬 "Dạ, anh gửi em bảng số liệu. Em đăng đúng giờ đó."]
    dan_dau_tu: *(gửi một file Excel 47 tab)* Đây. Tab thứ 3. Còn mấy tab kia là… chart coin. Bỏ qua.
    ~ follow(3000)
    ~ qh("dan_dau_tu", 5)
* [🦉 "Anh… biết gì về giờ của em?"]
    dan_dau_tu: Anh biết số. *(nhìn bạn)* Số của một kênh 980 nghìn sub cũng tăng lúc 3 giờ sáng. Trùng hợp nhỉ.
    ~ ed_lo(5)
+ [😶 "Dạ."]
    -> END
- dan_dau_tu: Mà em có tiền nhàn rỗi không? Có một coin mới, đáy rồi, đáy thật rồi.
* [😴 "Dạ… tiền của em đang render."]
    dan_dau_tu: Render tiền? *(nghĩ)* Hay đó. Tên coin mới: RenderCoin.
* [💸 "Em không đầu tư đâu anh. Nhưng em mời anh ly cà phê."]
    dan_dau_tu: *(cầm ly cà phê như cầm cổ phiếu)* Ly này anh giữ. Không bán.
    ~ qh("dan_dau_tu", 5)
    ~ tien_cong(-35000)
+ [😶 Lắc đầu.]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho khụ khụ)* {editor} ơi… tui hơi sốt… mà tui cần ông dựng giùm cái clip. Clip… quê tui gặt lúa.
* [🎬 "Footage gặt lúa đâu anh?"]
    thanh_xin_nghi: *(đưa điện thoại: một cánh đồng, nhưng góc dưới có logo Đài Tivi Hóng)* Ờ… ruộng… có logo. Ông cắt logo giùm tui.
    _Bạn cắt logo. Rồi cắt luôn cái micro trong tay {thanh_xin_nghi} ở khung hình thứ 40. Bạn không hỏi._
    ~ qh("thanh_xin_nghi", 10)
* {biet(son_thi_hat)} [🔒 "Thí sinh số 17 hát hay lắm anh."]
    thanh_xin_nghi: *(hết ho ngay lập tức)* Ông… ông coi hả? *(nhỏ giọng)* Đừng nói {hr}. Năn nỉ.
    editor: Em là cú. Cú không nói.
    ~ qh("thanh_xin_nghi", 15)
+ [😴 "Anh nghỉ đi."]
    -> END
- thanh_xin_nghi: Ông là người duy nhất ở công ty hông bao giờ xin nghỉ mà cũng hông bao giờ có mặt buổi sáng. Ông là thần tượng của tui.
* [😴 "Dạ… em có mặt mà. Chỉ là ban đêm."]
    thanh_xin_nghi: Ban đêm! *(mắt sáng lên)* Lý do mới: "Em xin làm ban đêm như {editor}". Cảm ơn ông!
    ~ qh("thanh_xin_nghi", 5)
    ~ qh("hr", -2)
* [💬 "Anh nên hát nhiều hơn. Thật."]
    thanh_xin_nghi: *(ngẩn ra)* … Ông là người thứ hai nói câu đó. Người thứ nhất là {quan_ly_idol}.
    ~ qh("thanh_xin_nghi", 5)
+ [😶 Gật đầu.]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Ừ. Cháu lại ở lại đêm à? Ngồi đi. Trà đá.
* [🍵 "Dạ con cảm ơn bác."]
    bac_bao_ve: Đêm nào bác cũng thấy đèn phòng cháu sáng tới sáng. Bác đi tuần qua, bác không gõ cửa. Bác biết cháu đang làm.
    ~ uong(25)
    ~ qh("bac_bao_ve", 5)
* [🎥 "Bác ơi, cho con quay bác uống trà một chút. Con muốn có tư liệu cho video 16 năm."]
    bac_bao_ve: Quay bác thì có gì mà xem. *(nhưng vẫn ngồi thẳng lưng lên)*
    ~ qh("bac_bao_ve", 5)
+ [😶 Chào bác.]
    -> END
- bac_bao_ve: Cháu biết không, ngày xưa người ta bảo bác: cái quý nhất trong công ty là con người. Bác thấy cháu là một người quý. Nhưng người quý thì phải ngủ.
* [😴 "Dạ… con sẽ ngủ."]
    bac_bao_ve: Ừ. Hứa với bác thì phải làm. Bác 9 giờ ngủ. Cháu 12 giờ. Được không?
    ~ ed_ngu_du()
    ~ qh("bac_bao_ve", 5)
* [💬 "Người ta là ai vậy bác?"]
    bac_bao_ve: *(rót trà)* Bác không biết gì đâu.
    _Bác nói câu đó như đóng một cánh cổng. Nhẹ, mà chắc._
+ [🦉 "Con là cú mà bác."]
    bac_bao_ve: Cú cũng ngủ. Ngủ ban ngày. Cháu thì ngày không ngủ, đêm không ngủ. Cú gì mà kỳ thế.
- -> END

// ------------------------------------------------------------
=== editor_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: Biến hình! Ủa, em dựng phim nè! Em làm cho anh hồng sang ghê! Hồng không phải màu, Hồng là thái độ!
* [🎨 "Dạ, em Cứu Màu. Hồng của anh mã số FF69B4. Em thuộc lòng."]
    sieu_nhan_hong: Trời! Em thuộc mã màu của anh?! Em là fan anh hả?!
    editor: Dạ… em là người dựng anh.
    ~ qh("sieu_nhan_hong", 10)
* [😴 "Dạ… anh nói nhỏ chút được hông, em mới dậy."]
    sieu_nhan_hong: *(thì thầm)* Biến hình… nhỏ nhỏ…
    ~ qh("sieu_nhan_hong", 5)
+ [😶 Gật đầu chào.]
    -> END
- sieu_nhan_hong: Em ơi, em dựng phim nhiều, em có thấy… anh trông thế nào khi không đội mũ hông?
* [🦉 "Dạ em chưa thấy. Mà em nghĩ anh đội hay không đội thì vẫn là anh."]
    sieu_nhan_hong: *(im lặng một lúc)* … Câu đó ai nói anh cũng tin. Mà em nói thì anh tin nhất. Em dựng mà.
    ~ qh("sieu_nhan_hong", 10)
* [😇 "Dạ. Có lần em thấy bóng anh trong pantry hôm mất điện. Bóng anh dễ thương."]
    sieu_nhan_hong: *(lấy hai tay che mũ)* Trời ơi! Đừng dựng nha! Đừng dựng!
    editor: Dạ. Không dựng. Hứa.
    ~ qh("sieu_nhan_hong", 5)
+ [😴 "Dạ… đợi render xong…"]
    -> END
- -> END

// ------------------------------------------------------------
=== editor_tudo_cho ===
# npc:cho
cho: Gâu? *(ngồi chắn cửa phòng dựng, nhìn bạn)*
* [🌭 Cho {cho} xúc xích.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        ~ qh("cho", 15)
        cho: Gâu gâu! *(vẫy đuôi tít mù, rồi nằm luôn dưới bàn dựng)*
    - else:
        _Bạn không có xúc xích. Chỉ có cà phê đen. {cho} ngửi ly cà phê, hắt xì, bỏ đi._
    }
* [🎥 Mở cho {cho} xem video "Một ngày làm chó công ty".]
    cho: *(nghiêng đầu, nhìn chính mình trên màn hình)* … Gâu! *(sủa vào màn hình lúc thấy bộ đồ hồng)*
    ~ qh("cho", 10)
* [🦉 Ngồi bệt xuống sàn, cạnh {cho}. Hai sinh vật ban đêm.]
    cho: *(nằm xuống, gác đầu lên chân bạn)*
    ~ cang_thang(-10)
    ~ qh("cho", 5)
+ [😶 Xoa đầu, quay lại màn hình.]
    -> END
- -> END
