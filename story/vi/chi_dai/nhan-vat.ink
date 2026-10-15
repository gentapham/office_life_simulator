// ============================================================
// CHỊ ĐẠI: HƯƠNG · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// Mỗi cảnh có thể mở lại nhiều lần; lựa chọn cuối (+) luôn còn.
// ============================================================

// ------------------------------------------------------------
=== chi_dai_tudo_ran_doc ===
# npc:ran_doc
_{ran_doc} đang ngồi ở pantry, lướt group Zalo-lô, cười một mình. Thấy bạn, nụ cười đổi sang chế độ "nhân viên gương mẫu"._
ran_doc: Dạ chị {chi_dai}! Chị uống gì hông, em pha cho chị!
* [💬 "Dạo này em đi khắp các phòng dữ ha. Hỏi han ai cũng kỹ."]
    ran_doc: Dạ, em làm truyền thông nội bộ mà chị. Phải biết mọi người mới viết bản tin được.
    chi_dai: Ờ. Biết mọi người thì tốt. Kể mọi người nghe thì… tùy chuyện.
    ~ qh("ran_doc", -2)
* {cd_de_y_ran_doc} [🕵️ "Xóm Cây Me. Em với Siêu Nhân Hồng. Kể chị nghe đi."]
    ran_doc: *(cái muỗng khựng giữa ly)* Dạ… em hông biết chị nói gì.
    chi_dai: Hông biết thì thôi. Nhưng em nhớ: ở đây đứa nào làm người khác khóc, cũng phải gặp chị. Kể cả em.
    ~ cd_uy(3)
* [🍚 "Ăn cơm chưa? Chủ nhật về nhà chị, chị nấu canh chua."]
    ran_doc: *(ngạc nhiên thật)* Dạ… em? Dạ… em đi được ạ.
    ~ qh("ran_doc", 8)
+ [😶 "Thôi, chị uống trà đá rồi."]
- ran_doc: Mà chị nè, chị có nghe gì về vụ… à thôi, chắc chị hông quan tâm.
* [🗣️ "Chuyện gì nói nửa chừng là chị quan tâm nhất."]
    ran_doc: Dạ hông có gì đâu chị. Tui… em nói vậy thôi chứ hông có ý gì đâu.
    _Câu "hông có ý gì đâu" đó, bạn đã nghe {ran_doc} nói với 5 người khác trong tuần này._
* [🤝 "Em mới vô, có ai làm khó thì nói chị."]
    ran_doc: Dạ… cảm ơn chị. Lâu rồi mới có người nói câu đó với em.
    _Một giây thôi, mặt {ran_doc} trông như đứa nhỏ trong tấm ảnh xóm Cây Me._
    ~ qh("ran_doc", 5)
+ [😶 Gật đầu, đi ra.]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_giam_doc ===
# npc:giam_doc
_Phòng giám đốc. Bạn vừa gõ cửa, {giam_doc} đã đứng bật dậy, kéo ghế, gọi vọng ra: "{thanh_ninh} ơi, trà!"_
giam_doc: Ơ {chi_dai}! Em ngồi đi. Có việc gì "urgent" à em?
* [📋 "Đêm Hồng cần thêm 2 bảo vệ, 1 xe cứu thương trực. Sếp ký."]
    giam_doc: Xe cứu thương à? Có cần thiết không em? Mình "optimize" được không?
    chi_dai: Cả nghìn người, sếp. Ngất một người mà hông có xe là lên báo.
    giam_doc: …Ký. Anh ký.
    ~ cd_td(2)
* [💬 "Hông có gì. Em lên coi sếp ăn trưa chưa."]
    giam_doc: *(bối rối)* Ơ… chưa. Anh định ăn… à mà thôi, anh không đói.
    chi_dai: Dưới cơm tấm Cô Năm còn sườn. Em mua cho sếp một hộp.
    ~ qh("giam_doc", 5)
* [🔥 "Sếp nhắn group lúc 23 giờ tối qua. Lần thứ mấy rồi?"]
    giam_doc: Anh… anh nhắn "không bắt buộc trả lời" mà em.
    chi_dai: Nhắn lúc 23 giờ thì ai ngủ được mà hông trả lời.
    ~ qh("giam_doc", -3)
    ~ cd_uy(2)
+ [😶 "Dạ hông có gì, em đi nhầm phòng."]
- giam_doc: Mà {chi_dai} này… anh hỏi thật nhé. Mọi người… có nói gì anh không?
* [😇 "Có. Nói sếp hay hứa. Mà cũng nói sếp hông bao giờ bỏ ai."]
    giam_doc: *(cười gượng)* Ừ. Hai câu ấy đều đúng.
    ~ qh("giam_doc", 5)
* [🦁 "Sếp muốn biết thì vô group Hội Anti Sếp mà đọc."]
    giam_doc: *(ho sặc)* Anh… anh làm gì có tài khoản nào trong đấy!
    _Mặt {giam_doc} đỏ như cái tên "Hoa Hướng Dương 1989"._
    ~ cd_uy(3)
+ [😶 "Sếp làm việc đi. Em xuống kho."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_truong_phong ===
# npc:truong_phong
_Phòng họp "Sáng Tạo". {truong_phong} đang đứng một mình trước bảng trắng, vẽ sơ đồ "quy trình đặt cơm trưa"._
truong_phong: À chị {chi_dai}. Chị có 5 phút không? Mình sync nhanh về Đêm Hồng nhé.
* [🦁 "5 phút thật. Chị bấm giờ."]
    _Bạn bấm giờ trên điện thoại. {truong_phong} nói nhanh như MC. Phút thứ 4 giây 58, anh thở dốc: "…Xong ạ."_
    chi_dai: Thấy chưa. Làm được mà.
    ~ qh("truong_phong", 5)
* [💬 "Chị cần 3 người bên em hôm 31. {editor}, {designer}, {thuc_tap_sinh}. Cho mượn được hông?"]
    truong_phong: Được ạ. Nhưng mình nên có một buổi họp bàn giao trước.
    chi_dai: Bàn giao xong rồi. Chị vừa nói đó.
    ~ cd_td(2)
* [🧂 "Nghe nói em sắp lên Phó Giám đốc hả?"]
    truong_phong: *(đứng thẳng lên)* Dạ… chưa có gì chính thức ạ. Nhưng em có chuẩn bị đơn. Sửa 14 lần rồi.
    ~ qh("truong_phong", 3)
+ [😶 "Chị bận. Em họp với cái bảng trắng đi."]
- truong_phong: Chị ơi… em hỏi thật. Chị thấy {con_ong_chau_cha} có muốn cái ghế đó không ạ?
* [😇 "Nó hông muốn. Nó muốn làm nhạc. Em ngồi họp ít thôi là nhìn ra."]
    truong_phong: *(ngẩn ra)* Làm nhạc ạ? Em… em không biết.
    ~ qh("truong_phong", 5)
* [🦁 "Muốn hay không, em làm tốt việc của em là được."]
    truong_phong: Vâng. Em sẽ "take note" ạ.
+ [😶 Nhún vai.]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_thanh_ninh ===
# npc:thanh_ninh
_Bàn trợ lý. {thanh_ninh} đang soạn bài phát biểu cho sếp. Thấy bạn, tay gõ phím chậm lại._
thanh_ninh: Dạ… chị {chi_dai}. Chị cần gặp anh {giam_doc} hả chị? Anh đang bận ạ.
* [🦁 "Chị hông hỏi em. Chị gõ cửa."]
    _Bạn gõ cửa. {giam_doc} nói "Vào đi em!" ngay lập tức. {thanh_ninh} nhìn theo, môi mím chặt._
    ~ qh("thanh_ninh", -5)
    ~ cd_uy(2)
* [💬 "Em viết bài phát biểu gì mà dài vậy?"]
    thanh_ninh: Dạ… bài "Cảm ơn anh vì đã là anh" ạ. 8 trang ạ.
    chi_dai: …Em có mệt hông?
    thanh_ninh: *(ngẩng lên, ngạc nhiên)* Dạ?
    ~ qh("thanh_ninh", 3)
* {cd_hoa_voi_nhi} [🤝 "Trưa nay ăn cơm tấm với chị hông?"]
    thanh_ninh: *(cười, lần này hông phải cười nịnh)* Dạ có ạ. Em xin thêm chả ạ.
    ~ qh("thanh_ninh", 8)
+ [😶 Đi ngang qua, không nói gì.]
- thanh_ninh: Chị ơi… em biết chị ghét em. Em chỉ muốn hỏi… làm sao để người ta nể mình mà không cần nịnh ạ?
* [🦁 "Nói thật. Làm thật. Bị ghét thì chịu. Chị bị ghét 8 năm rồi."]
    thanh_ninh: Dạ… em sợ bị ghét lắm.
    chi_dai: Ai cũng sợ. Chị cũng sợ. Mà sợ thì vẫn làm.
    ~ qh("thanh_ninh", 10)
* [🔥 "Bắt đầu bằng việc đừng khen sếp hắt hơi có tâm."]
    thanh_ninh: *(đỏ mặt)* Dạ… cái đó em lỡ miệng ạ.
    ~ qh("thanh_ninh", -3)
    ~ cd_uy(2)
+ [😶 "Hỏi người khác đi."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_hong_hot ===
# npc:hong_hot
_Bàn mạng xã hội. Ring light sáng chói. {hong_hot} đang livestream bán… không, đang livestream "tám chuyện cuối ngày". Thấy bạn, tắt máy cái rụp._
hong_hot: Ối dồi ôi chị Đại! Nghe gì chưa chị?
* [🗣️ "Chưa. Và chị hông muốn nghe."]
    hong_hot: Ủa alo? Chuyện hay lắm mà chị! Thôi để em kể chị {ke_toan}…
    chi_dai: Kể ai thì kể, đừng kể sai.
    ~ qh("hong_hot", -2)
* [📋 "Đêm Hồng. Em lên lịch đăng bài đếm ngược 10 ngày. Mỗi ngày một ảnh hậu trường."]
    hong_hot: Ok chị! Ảnh hậu trường nào có {cho} là triệu view!
    ~ cd_td(2)
    ~ follow(3000)
* [💬 "Nghe gì? Kể nhanh. Một câu."]
    hong_hot: Anh {quan_ly_idol} đi tòa nhà xanh lá chuối! Một câu!
    chi_dai: …Ờ. Giữ câu đó lại. Đừng đăng.
    ~ qh("hong_hot", 3)
+ [😶 Đi ngang, giơ tay chào.]
- hong_hot: Mà chị ơi, trang Confession đó… chị có nghĩ ai làm admin hông?
* [🕵️ Nhìn thẳng {hong_hot} 3 giây: "Có. Chị nghĩ người đó nên cẩn thận."]
    hong_hot: *(nuốt nước bọt)* Dạ… chắc người đó cẩn thận rồi chị.
    ~ cd_uy(2)
* [😇 "Ai làm cũng được. Đừng đăng chuyện làm người ta mất việc."]
    hong_hot: *(im lặng một lúc)* Dạ. Em… em sẽ nói với người đó.
    ~ qh("hong_hot", 5)
+ [😶 "Chị hông quan tâm."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
_{con_ong_chau_cha} đang ngồi ở sảnh, đeo tai nghe to bự, gõ gõ ngón tay theo nhịp. Ly cà phê 85 nghìn bên cạnh._
con_ong_chau_cha: Ồ chị {chi_dai}. Chill hông chị? Em mời chị ly cà phê nha.
* [📋 "Chị cần mượn xe bán tải của em chở loa đêm 28."]
    con_ong_chau_cha: Ủa sao không thuê xe luôn chị?
    chi_dai: Vì ngân sách hết rồi em.
    con_ong_chau_cha: *(ngẫm nghĩ)* À… ờ. Ok chị. Em lái luôn cho. Lần đầu em chở loa.
    ~ cd_td(3)
    ~ qh("con_ong_chau_cha", 5)
* [💬 "Đang nghe gì mà gõ nhịp dữ vậy?"]
    con_ong_chau_cha: *(tháo tai nghe vội)* Dạ… nhạc linh tinh thôi chị. Nhạc… của người khác.
    _Màn hình điện thoại vừa kịp tắt. Bạn thấy chữ "Hồng Là Thái Độ - demo 41"._
    ~ qh("con_ong_chau_cha", 2)
* [🦁 "85 nghìn một ly cà phê. Lương thằng {thuc_tap_sinh} một ngày là 180 nghìn đó em."]
    con_ong_chau_cha: Ủa… vậy hả chị? *(nhìn ly cà phê rất lâu)*
    ~ qh("con_ong_chau_cha", -2)
    ~ cd_uy(2)
+ [😶 "Thôi, chị uống trà đá."]
- con_ong_chau_cha: Chị nè… nếu em không làm cháu chú em nữa, chị nghĩ em làm được gì?
* [😇 "Làm cái em đang nghe trong tai nghe đó."]
    con_ong_chau_cha: *(sững người)* …Chị nghe lén hả?
    chi_dai: Chị đâu cần nghe. Nhìn ngón tay em gõ là biết.
    ~ qh("con_ong_chau_cha", 10)
* [🦁 "Thì đi làm như mọi người. Bắt đầu bằng việc tới đúng 8 giờ."]
    con_ong_chau_cha: 8 giờ sáng hả chị? Có… có 8 giờ sáng hả?
    ~ qh("con_ong_chau_cha", 3)
+ [😶 Nhún vai.]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_chua_te_deadline ===
# npc:chua_te_deadline
_{chua_te_deadline} nằm ngả trên ghế, lướt Tóp-tóp, chân gác lên thùng giấy ghi "GẤP". Thấy bạn, chân hạ xuống… nửa chừng._
chua_te_deadline: Chill chị ơi. Còn sớm mà.
* [🗣️ "Sớm là còn 3 ngày. Kịch bản Đêm Hồng đâu?"]
    chua_te_deadline: Nước tới chân mới nhảy, mà nhảy là phải đẹp.
    chi_dai: Nước tới cổ rồi đó em.
    chua_te_deadline: *(ngồi thẳng dậy)* …Tối nay em nhảy.
    ~ cd_td(2)
* [🛡️ "Em đẩy thêm việc nào cho {thuc_tap_sinh} nữa, chị đẩy em ra cổng."]
    chua_te_deadline: Ok mom… à dạ, em hiểu ạ.
    ~ qh("chua_te_deadline", -3)
    ~ cd_uy(3)
* [💬 "Còn chuyện {sieu_nhan_hong}? Em tính sao?"]
    chua_te_deadline: Chuyện gì chị? PR mà. Ổng tặng gối ôm hồng, tặng bánh, tỏ tình trên live… PR hết mà.
    chi_dai: PR mà ngồi chờ em ngủ dậy ở hành lang lúc mất điện hả?
    chua_te_deadline: *(im lặng, lướt điện thoại chậm lại)*
    ~ qh("chua_te_deadline", 3)
+ [😶 Lắc đầu, đi tiếp.]
- chua_te_deadline: Chị… em hỏi. Lỡ mình làm mất một thứ quan trọng của công ty, mình nên nói hay nên giấu?
* [😇 "Nói. Càng sớm càng đỡ. Giấu thì tới ngày nó lòi ra là mất luôn người."]
    chua_te_deadline: *(gật chậm)* …Để em nghĩ. Chill. Em nghĩ đã.
    ~ qh("chua_te_deadline", 5)
* [🕵️ "Thứ gì? USB hả?"]
    chua_te_deadline: *(giật mình)* Ủa sao chị biết… à không, ví dụ thôi chị!
    ~ phat_hien(usb_cua_vu)
+ [😶 "Chuyện của em. Em lớn rồi."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
_{thuc_tap_sinh} đang photo một xấp tài liệu cao bằng đầu gối. Máy in kẹt giấy. Cậu đang nói chuyện với nó rất lễ phép._
thuc_tap_sinh: Dạ máy ơi, em xin máy chạy thêm 20 tờ nữa thôi ạ… Dạ chị {chi_dai}! Em chào chị ạ!
* [🤝 Mở nắp máy, rút tờ giấy kẹt ra, đập nhẹ hông máy một cái.]
    _Máy in chạy lại. {thuc_tap_sinh} nhìn bạn như nhìn phù thủy._
    thuc_tap_sinh: Dạ chị dạy em đập chỗ nào được hông ạ?
    chi_dai: Hông. Đập là kỹ năng riêng của chị.
    ~ qh("thuc_tap_sinh", 5)
* [🍚 "Ăn trưa chưa? Lại mì gói nữa hả?"]
    thuc_tap_sinh: Dạ… mì gói vị mới ạ. Tôm chua cay ạ.
    chi_dai: Đưa đây. Ăn cơm với chị.
    ~ qh("thuc_tap_sinh", 8)
    ~ an(30)
    ~ tien_cong(-35000)
* [💬 "Ai bắt em photo nhiều vậy?"]
    thuc_tap_sinh: Dạ… anh {truong_phong} cần tài liệu họp ạ. 23 bộ ạ. Mỗi bộ 40 trang ạ.
    chi_dai: Họp gì mà 40 trang?
    thuc_tap_sinh: Dạ họp về… tiết kiệm giấy ạ.
    ~ cd_nk(3)
+ [😶 Xoa đầu, đi tiếp.]
- thuc_tap_sinh: Chị ơi… em 30 tuổi rồi. Chị nghĩ em có làm được nghề này hông ạ?
* [😇 "Được. Em là đứa duy nhất ở đây làm việc mà hông than. Cái đó học hông ra."]
    thuc_tap_sinh: *(mắt đỏ lên)* Dạ… em cảm ơn chị ạ. Em sẽ cố ạ.
    ~ qh("thuc_tap_sinh", 10)
    ~ cd_bao_ke(de_thuc_tap_sinh)
* [🦁 "Được. Nhưng tập nói 'không' trước đã. Nói với chị thử coi."]
    thuc_tap_sinh: Dạ… không ạ.
    chi_dai: To lên.
    thuc_tap_sinh: KHÔNG Ạ!
    _Cả tầng 1 quay lại nhìn. {thuc_tap_sinh} đỏ mặt, nhưng cười._
    ~ cd_duy_biet_tu_choi = true
    ~ qh("thuc_tap_sinh", 6)
+ [😶 "Hỏi chị câu khác đi."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_ke_toan ===
# npc:ke_toan
_Phòng kế toán. Mọi thứ dán nhãn. Cái bút bi dán nhãn "BÚT - KẾ TOÁN - KHÔNG MƯỢN". {ke_toan} ngẩng lên khỏi xấp hóa đơn._
ke_toan: Bà lên chi? Xin tiền thì về. Uống trà thì ngồi.
* [🍵 "Uống trà."]
    _{ke_toan} rót. Hai người ngồi im 10 phút, nghe tiếng máy tính kêu rè rè. Đó là kiểu nghỉ ngơi của hai bà già 30 tuổi._
    ~ qh("ke_toan", 5)
    ~ cd_nk(-10)
* [💸 "Xin tiền. 15 triệu thuê máy phát điện dự phòng."]
    ke_toan: Hóa đơn đâu?
    chi_dai: Chưa thuê thì lấy đâu ra hóa đơn?
    ke_toan: Thì đi lấy báo giá. Ba báo giá. Có dấu đỏ.
    _Bạn đi lấy ba báo giá. {ke_toan} duyệt 12 triệu. Như mọi khi._
    ~ cd_td(2)
* [🧂 "Bà nghe vụ {sales} xin tạm ứng 20 triệu tiếp khách chưa?"]
    ke_toan: Nghe. Tui đóng cửa ngăn kéo lại rồi. Hai lớp.
    ~ qh("ke_toan", 3)
+ [😶 Gõ cửa rồi đi. Bà ấy đang bận.]
- ke_toan: Mà bà nè. Tui hỏi thiệt. Nếu công ty sập, bà tính làm gì?
* [🦁 "Hông sập. Mà sập thì tui dựng lại. Tui dựng sân khấu 8 năm rồi."]
    ke_toan: *(cười khẽ)* Bà lúc nào cũng nói vậy.
    chi_dai: Và lần nào cũng làm được.
    ~ qh("ke_toan", 5)
* [🤝 "Thì tui với bà mở quán ốc. Bà giữ tiền, tui giữ khách."]
    ke_toan: Quán ốc mà chủ quán từng úp ốc lên đầu khách, ai dám vô?
    chi_dai: Người có tật mới sợ.
    ~ qh("ke_toan", 8)
+ [😶 "Hông biết. Hông dám nghĩ."]
    ke_toan: Ừ. Tui cũng vậy.
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_hr ===
# npc:hr
_Phòng HR. Kệ trà 40 loại sắp theo bảng chữ cái. {hr} đang pha một ấm "Bạch Trà Ân Cần"._
hr: Em {chi_dai}. Lâu rồi em không tự lên đây. Thường là anh mời em, em không lên.
* [🍵 "Hôm nay tui tự lên. Rót tui một ly. Loại nào hông có chữ 'lắng nghe'."]
    hr: *(cười)* Vậy thì trà đá thôi em. Loại duy nhất không có tên.
    ~ qh("hr", 5)
* [💬 "Ông mời ai uống trà tuần này?"]
    hr: Anh không nói được. Bí mật nhân sự.
    chi_dai: Ông không nói thì tui đứng ngoài cửa phòng ông cả tuần.
    hr: …Hai người. Đi trễ thôi. Không có gì lớn.
    ~ cd_uy(2)
* [🦁 "Danh sách đó. Ông tính sao?"]
    hr: *(dừng tay rót trà)* Em… nói nhỏ thôi.
    { cd_doi_chat_tuan:
        hr: Anh vẫn để trống. Như đã hứa với em.
        ~ qh("hr", 5)
    - else:
        hr: Danh sách gì em? Anh không hiểu.
        ~ cd_nk(5)
    }
+ [😶 "Tui đi nhầm phòng."]
- hr: Em {chi_dai}. Anh hỏi thật nhé. Em có nghĩ có ngày em làm nghề khác không?
* [😇 "Có. Mở quán. Mà tui sẽ thuê ông làm… người pha trà."]
    hr: *(mắt sáng lên một giây)* Quán trà à? Anh… cũng từng nghĩ vậy.
    ~ qh("hr", 8)
* [🦁 "Không. Tui chết ở cánh gà."]
    hr: Đừng nói vậy. Anh không muốn làm thủ tục đó cho em.
+ [😶 "Ông hỏi nhiều quá."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_it ===
# npc:it
_Phòng server. Lạnh như tủ đông. {it} ngồi giữa 3 màn hình, ăn mì ly, không quay lại._
it: Restart chưa?
* [📋 "Chưa hỏi gì mà. Đêm Hồng: 4 micro không dây, 2 dự phòng. Ông lo được hông?"]
    it: Được. 6 cái. Pin dự phòng 12 cục.
    chi_dai: Cần nhiều vậy hả?
    it: Đêm Halloween. Ma ám micro.
    ~ cd_td(3)
    ~ qh("it", 3)
* [🍜 Đặt lên bàn một ly mì mới, vị khác.]
    it: *(nhìn ly mì 3 giây)* …Cảm ơn.
    _Với {it}, đó là một bài phát biểu dài._
    ~ qh("it", 6)
* [🕵️ "Ông đọc log hết công ty mà. Có ai lạ hông?"]
    it: Có. Không nói.
    chi_dai: Liên quan Đêm Hồng hông?
    it: *(ngừng gõ)* Có thể.
    ~ cd_uy(1)
+ [😶 Đóng cửa lại cho ổng giữ lạnh.]
- it: Bà. Hỏi. Bộ đàm của bà xài 8 năm. Muốn đổi không?
* [😇 "Không. Nó quen tay rồi."]
    it: Ừ. Vậy thay pin. *(đưa ra cục pin mới, đã sạc đầy)*
    ~ qh("it", 5)
* [🤝 "Đổi. Mà đổi loại nào hông bắt sóng taxi."]
    it: Không có loại đó. Taxi là định mệnh.
    ~ qh("it", 3)
+ [😶 "Để sau."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_idol_het_thoi ===
# npc:idol_het_thoi
_Phòng chờ studio. {idol_het_thoi} ngồi trước gương, đeo kính đen trong nhà, chỉnh tóc theo kiểu 2015._
idol_het_thoi: {chi_dai}. Em biết anh là ai không?
* [🦁 "Biết. Ông là đứa 30 tuổi đeo kính đen trong nhà."]
    idol_het_thoi: *(tháo kính ra, rồi đeo lại)* Hồi anh còn nổi, không ai dám nói vậy.
    chi_dai: Hồi ông còn nổi, tui đã nói vậy rồi.
    ~ cd_uy(2)
* [📋 "Đêm Hồng có một tiết mục cho ông. 'Công Viên', bản mới. Nhận hông?"]
    idol_het_thoi: *(ngồi thẳng lưng)* Tiết mục… cho anh? Sân khấu chính hả?
    chi_dai: Sân khấu chính. Trước {sieu_nhan_hong}. Đừng làm tui mất mặt.
    ~ qh("idol_het_thoi", 10)
    ~ cd_td(3)
* [💬 "Fan ông còn bao nhiêu? Nói thật."]
    idol_het_thoi: Đông lắm em… *(nhìn điện thoại)* …à, một người. Chị ấy 45 tuổi. Đám cưới nào cũng tới.
    ~ qh("idol_het_thoi", 3)
+ [😶 Đi ra.]
- idol_het_thoi: {chi_dai}… em nghĩ cái thằng mặc đồ hồng đó… có thay được anh không?
* [😇 "Không ai thay được ai. Bữa mất điện, ông hát hay hơn MV của nó."]
    idol_het_thoi: *(im lặng rất lâu)* …Thật hả?
    chi_dai: Tui không nói phét. Nghề tui là đứng cánh gà, nghe hết.
    ~ qh("idol_het_thoi", 10)
* [🔥 "Ông lo hát đi. Lo người khác thay mình thì giọng khàn."]
    idol_het_thoi: Anh không lo… anh chỉ hỏi vậy thôi.
+ [😶 Nhún vai.]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_quan_ly_idol ===
# npc:quan_ly_idol
_{quan_ly_idol} đứng ở cầu thang, mỗi tay một điện thoại, cả hai đều đang rung. Mắt thâm tới cằm._
quan_ly_idol: Khoan, anh nghe máy chút… Ừ… ừ… Chuyện này để anh lo, đừng ai đăng gì hết! *(cúp)* {chi_dai}. Em cần gì?
* [📋 "Lịch {sieu_nhan_hong} tuần cuối. Em cần biết giờ nào cậu ấy có mặt để tập."]
    quan_ly_idol: *(đưa luôn cái điện thoại thứ hai)* Đây. Lịch đây. Em chụp lại. Anh không nhớ nổi nữa.
    ~ cd_td(2)
    ~ qh("quan_ly_idol", 3)
* [☕ Dúi vào tay anh ly cà phê sữa đá: "Uống đi. Anh sắp gục rồi."]
    quan_ly_idol: *(uống một hơi hết nửa ly)* Cảm ơn em. Hôm nay em là người đầu tiên đưa đồ cho anh thay vì đòi đồ của anh.
    ~ qh("quan_ly_idol", 8)
* [🕵️ "Nghe nói anh đi tòa nhà xanh lá chuối."]
    quan_ly_idol: *(cả hai điện thoại cùng ngừng rung, như cũng đang nghe)* …Ai nói em?
    chi_dai: Cả quận. Anh đi hay ở?
    quan_ly_idol: Anh… chưa biết. Đi thì bỏ một người lại.
    ~ phat_hien(ll_moi_thai)
+ [😶 "Thôi anh nghe máy đi."]
- quan_ly_idol: {chi_dai} này. Nếu một ngày anh đi… em để ý {idol_het_thoi} giùm anh nhé.
* [🤝 "Em để ý. Mà anh đừng đi."]
    quan_ly_idol: *(cười mệt)* Em nói như ra lệnh.
    chi_dai: Thì là ra lệnh.
    ~ qh("quan_ly_idol", 8)
* [💬 "Sao anh lo cho ổng dữ vậy?"]
    quan_ly_idol: *(điện thoại rung)* Khoan, anh nghe máy chút…
    _Anh đi mất. Câu hỏi bị bỏ lại ở cầu thang. Nhưng bạn thấy tai anh đỏ._
    ~ phat_hien(thai_thuong_phat)
+ [😶 Gật đầu.]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_bien_kich ===
# npc:bien_kich
_Sân thượng. {bien_kich} ngồi bên lan can, ôm sổ, nhìn trời "tìm cảm hứng"._
bien_kich: Chị {chi_dai}… chị có biết kịch bản này cần thêm gì không? Cần thêm nỗi đau.
* [📋 "Kịch bản MC Đêm Hồng. Em viết xong chưa? Chị cần thứ 5."]
    bien_kich: Đang… chín dần ạ.
    chi_dai: Chín dần thì thứ 5 phải chín hẳn.
    ~ cd_td(2)
* [💬 "Cái sổ đó. Có tên chị trong đó hông?"]
    bien_kich: *(ôm sổ chặt hơn)* Đây không phải đạo, đây là cảm hứng!
    chi_dai: Chị chưa nói em đạo. Chị hỏi có tên chị hông.
    bien_kich: …Có. Chương 7. Chị là nhân vật được yêu thích nhất.
    ~ qh("bien_kich", 3)
* [🦁 "Ý tưởng 'Người Gác Két' của {thuc_tap_sinh}. Em nhớ ghi tên nó."]
    bien_kich: *(tái mặt)* Chị… biết hả?
    chi_dai: Chị biết nhiều thứ. Chị chỉ chờ người ta tự làm đúng.
    ~ qh("bien_kich", -3)
    ~ cd_uy(3)
+ [😶 Để em ấy tìm cảm hứng.]
- bien_kich: Chị… nếu một người viết về đồng nghiệp bằng tên thật, mà viết vì thương, thì có tội hông chị?
* [😇 "Không tội. Nhưng phải hỏi người ta trước. {ke_toan} thì càng phải hỏi."]
    bien_kich: *(gật chậm)* Dạ… em sẽ hỏi.
    ~ qh("bien_kich", 8)
* [🧂 "Tội. Mà nếu chị đẹp trong đó thì chị tha."]
    bien_kich: *(cười)* Chị đẹp nhất chương 7 luôn chị.
    ~ qh("bien_kich", 5)
+ [😶 "Hỏi luật sư đi em."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_editor ===
# npc:editor
_Phòng dựng phim. Tối như hang. {editor} quay lại, mắt đỏ như hai cái đèn hậu._
editor: *(ngáp)* Chị… đợi render xong…
* [🍚 Đặt lên bàn hộp cơm: "Ăn. Render tự chạy, cơm không tự vào bụng."]
    editor: *(nhìn hộp cơm, như lần đầu thấy cơm)* …Dạ.
    ~ qh("editor", 8)
    ~ tien_cong(-35000)
* [📋 "Video '16 năm' cho Đêm Hồng. Em tới đâu rồi?"]
    editor: 70%. Thiếu file gốc dự án tháng 6. Anh {chua_te_deadline} nói "chill, có mà". Mà không thấy đâu.
    chi_dai: Để chị hỏi nó.
    ~ cd_td(1)
* [💬 "Con cú nhỏ trong mấy video của em. Ký tên hả?"]
    editor: *(khựng lại)* Chị… thấy hả? Không ai thấy hết á.
    chi_dai: Chị đứng cánh gà 8 năm. Chị thấy hết những cái không ai thấy.
    ~ qh("editor", 6)
    ~ phat_hien(kenh_cu_dem)
+ [😶 Đóng cửa lại, để tối cho em ấy làm.]
- editor: Chị ơi… thích một người mà người ta thích người khác, thì làm sao chị?
* [😇 "Thì vẫn thích. Thích đâu có cần người ta trả lời."]
    editor: *(nhìn màn hình, nơi đang dừng ở một khung hình {quan_ly_idol} cười)* …Dạ.
    ~ qh("editor", 10)
    ~ phat_hien(linh_thich_thai)
* [🦁 "Thì ngủ. Thức đêm thích người ta thì người ta cũng hông biết."]
    editor: *(cười khẽ)* Chị nói đúng mà khó nghe ghê.
    ~ qh("editor", 5)
+ [😶 "Chị hông rành chuyện đó."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_designer ===
# npc:designer
_Bàn thiết kế. {designer} có 2 cái laptop. Cái thứ hai đóng lại cái "tách" khi bạn đi tới._
designer: Chị {chi_dai}. Chị cần poster hả? Sửa nhẹ thôi là sửa cái gì ạ?
* [📋 "Banner Đêm Hồng. 12 mét. Chữ to, màu hồng, nhìn từ cuối bãi phải thấy."]
    designer: Ok chị. Feedback cụ thể vậy là em thương chị nhất công ty.
    ~ cd_td(3)
    ~ qh("designer", 5)
* [🕵️ Nhìn cái laptop thứ hai: "Máy đó làm cho ai vậy em?"]
    designer: *(cười gượng)* Dạ… việc riêng ạ. Freelance.
    chi_dai: Ờ. Freelance thì được. Miễn là đừng làm cho người ta đâm mình.
    _{designer} cúi xuống. Không trả lời._
    ~ qh("designer", -2)
* [😇 "Em có muốn nghỉ chiều nay hông? Mặt em như bị sửa lần thứ 38."]
    designer: *(bật cười)* Lần thứ 38 thật đó chị.
    ~ qh("designer", 6)
+ [😶 Đi ngang.]
- designer: Chị ơi… nếu em lỡ làm một việc mà giờ em thấy không đúng, chị có giận em hông?
* [🤝 "Giận. Nhưng giận xong vẫn đứng trước em. Nói đi."]
    designer: *(im lặng)* …Để em nghĩ đã chị. Em… em chưa dám.
    ~ qh("designer", 5)
    ~ cd_bao_ke(de_designer)
* [🦁 "Thấy không đúng thì dừng. Dừng sớm thì đỡ."]
    designer: Dạ… em biết rồi.
    ~ qh("designer", 3)
+ [😶 "Tùy việc."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_sales ===
# npc:sales
_{sales} đang gọi điện, giọng tự tin như CEO tập đoàn: "Dạ anh, deal này chắc kèo! Tin em đi!" Cúp máy. Quay sang bạn._
sales: Chị {chi_dai}! Tin chị đi, Đêm Hồng em kéo được 3 nhà tài trợ!
* [🦁 "Em 26 tuổi. Chị 30. 'Tin chị đi' là câu của chị."]
    sales: *(khựng)* Dạ… tin em đi ạ.
    chi_dai: Ờ. Vậy mới đúng.
    ~ cd_uy(2)
* [💬 "Ba nhà tài trợ. Tên gì? Số điện thoại?"]
    sales: Dạ… một là BTT Global, hai là Răng Hồng, ba là… đang đàm phán ạ.
    chi_dai: Ba cái tên đó, chị gọi được cái nào?
    sales: *(im lặng)*
    ~ qh("sales", -2)
* [🤝 "Em đi gặp nhà tài trợ, cần người đi cùng hông? Chị rảnh tối thứ 5."]
    sales: *(ngạc nhiên)* Chị… đi với em hả? Dạ… dạ để em sắp xếp ạ.
    ~ qh("sales", 6)
+ [😶 "Ừ. Chị tin."]
    sales: *(cười rạng rỡ)* Thấy chưa!
- sales: Chị ơi… nếu một ngày em nói thật, chị có tin hông?
* [😇 "Tin. Em nói thật thì mặt em khác. Chị phân biệt được."]
    sales: *(sờ mặt)* Khác sao chị?
    chi_dai: Bớt cười.
    ~ qh("sales", 8)
* [🧂 "Tùy em nói thật về cái gì."]
    sales: Dạ… em hiểu rồi ạ.
+ [😶 "Thử đi rồi biết."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_dan_dau_tu ===
# npc:dan_dau_tu
_Bàn số liệu. Hai màn hình. Một màn hình số liệu Siêu Nhân Hồng. Một màn hình chart đỏ lòm. {dan_dau_tu} chuyển sang màn hình số liệu rất nhanh khi thấy bạn._
dan_dau_tu: {chi_dai}! Số liệu đẹp lắm em. Đẹp gần bằng chart của anh lúc lên.
* [📋 "Giờ nào đăng bài thì nhiều người coi nhất? Em cần cho đêm 31."]
    dan_dau_tu: *(mắt sáng lên, giọng khác hẳn)* 20 giờ 15. Thứ bảy. Có chữ "Halloween" và có con chó. Tỉ lệ tương tác tăng 340%.
    chi_dai: Vậy là anh giỏi thật.
    dan_dau_tu: Anh giỏi số liệu. Không giỏi coin.
    ~ follow(5000)
    ~ qh("dan_dau_tu", 6)
* [🧂 "Anh nợ bác {bac_bao_ve} 2 triệu. Bác 50 tuổi. Anh trả chưa?"]
    dan_dau_tu: Anh… anh sắp trả. Lần này là lên thật.
    chi_dai: Lên hay xuống, trả bác trước.
    ~ cd_uy(2)
    ~ qh("dan_dau_tu", -2)
* [🤝 "Anh ăn gì chưa? Lại bánh mì lén hả?"]
    dan_dau_tu: *(giấu ổ bánh mì dưới bàn)* Anh… ăn rồi.
    chi_dai: Ra cơm tấm với em. Em bao. Không phải cho vay.
    ~ qh("dan_dau_tu", 8)
    ~ tien_cong(-40000)
+ [😶 Đi qua.]
- dan_dau_tu: {chi_dai}… em có bao giờ nghĩ người như anh thoát nghèo được không?
* [😇 "Được. Ngày anh dùng cái đầu đó cho số liệu thay vì cho coin."]
    dan_dau_tu: *(nhìn hai màn hình rất lâu)* …Ừ.
    ~ qh("dan_dau_tu", 8)
* [🦁 "Được. Bắt đầu bằng việc xóa app coin. Em đứng đây coi anh xóa."]
    dan_dau_tu: Ngay bây giờ á?
    chi_dai: Ngay bây giờ.
    _{dan_dau_tu} xóa. Tay run. Rồi thở ra như vừa đặt xuống một bao gạo._
    ~ qh("dan_dau_tu", 5)
    ~ cd_bao_ke(de_dan_dau_tu)
+ [😶 "Hông biết."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
_Hiếm hoi: {thanh_xin_nghi} có mặt ở công ty. Đang ngồi bàn điều phối, khẽ ngân nga một giai điệu, rất hay._
thanh_xin_nghi: *(giật mình)* Dạ chị {chi_dai}! Em… em đang ho ạ. Viêm họng ạ.
* [🧂 "Viêm họng mà ngân nốt cao vậy hả em?"]
    thanh_xin_nghi: Dạ… viêm… viêm kiểu nốt cao ạ.
    chi_dai: Ờ. Bệnh hiếm.
    ~ qh("thanh_xin_nghi", 2)
* [📋 "Lịch trình {sieu_nhan_hong} tuần này. Em làm chưa?"]
    thanh_xin_nghi: *(đưa tờ giấy)* Dạ rồi ạ! Em làm từ tối qua ạ!
    _Lịch trình gọn gàng, chi tiết, có màu. Khi {thanh_xin_nghi} có mặt, cậu làm tốt hơn ai hết._
    ~ cd_td(2)
    ~ qh("thanh_xin_nghi", 3)
* [🛡️ "Mai em xin nghỉ nữa hả? Lý do gì?"]
    thanh_xin_nghi: Dạ… bà ngoại em… *(nhìn bạn)* …à không, mai em đi làm ạ.
    ~ cd_uy(2)
+ [😶 Để em ấy "ho".]
- thanh_xin_nghi: Chị ơi… nếu một người có hai việc, một việc mình thương, một việc nuôi mình, chị chọn cái nào?
* [😇 "Chọn cả hai. Tới lúc phải bỏ một thì bỏ cái hông thương."]
    thanh_xin_nghi: *(cười rất tươi)* Chị nói y như bà ngoại em.
    chi_dai: Bà ngoại em khỏe chưa?
    thanh_xin_nghi: Dạ… khỏe re ạ.
    ~ qh("thanh_xin_nghi", 10)
    ~ cd_bao_ke(de_thanh_xin_nghi)
* [🦁 "Chọn cái nào thì cũng nói thật với {hr}. Đừng xài bà ngoại nữa."]
    thanh_xin_nghi: Dạ… em sợ ảnh lắm chị.
    chi_dai: Có chị đứng cạnh.
    ~ qh("thanh_xin_nghi", 5)
+ [😶 "Tùy em."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_bac_bao_ve ===
# npc:bac_bao_ve
_Chòi bảo vệ. Ấm trà. Radio rè rè kênh thời sự. {cho} nằm dưới chân. Bác {bac_bao_ve} ngẩng lên._
bac_bao_ve: Cháu {chi_dai}. Ngồi đi. Trà đá nhé.
* [🍵 Ngồi ghế nhựa. Uống. Không nói gì.]
    _Mười phút. Radio đọc giá vàng. {cho} ngáy. Bạn thấy vai mình nhẹ đi một nửa._
    ~ cd_nk(-15)
    ~ qh("bac_bao_ve", 3)
    ~ uong(30)
* [💬 "Bác ơi, hôm nay có ai lạ ra vào hông bác?"]
    bac_bao_ve: Có. Một cậu áo nhiều túi, máy ảnh ống dài. Đứng ở cổng 3 tiếng. Bác mời trà, cậu ấy không uống.
    chi_dai: Paparazzi.
    bac_bao_ve: Thế à. Bác không biết. Bác chỉ thấy thôi.
    ~ cd_td(1)
* [🐕 Ngồi xuống chơi với {cho} một lúc.]
    cho: Gâu! *(lật ngửa bụng)*
    bac_bao_ve: Nó chỉ lật bụng với cháu với bác thôi đấy.
    ~ qh("cho", 5)
    ~ cd_nk(-5)
+ [😶 Chào bác, đi lên.]
- bac_bao_ve: Cháu này. Bác hỏi thật. Cháu gánh nhiều thế, có ai gánh giúp cháu không?
* [🦁 "Con gánh được, bác."]
    bac_bao_ve: Ừ. Gánh được thì gánh. Nhưng thỉnh thoảng đặt xuống uống trà nhé.
    ~ qh("bac_bao_ve", 5)
* [😇 "Có {ke_toan}. Có bác. Đủ rồi."]
    bac_bao_ve: *(rót thêm trà)* Ừ. Thế là đủ.
    ~ qh("bac_bao_ve", 8)
    ~ cd_met(-5)
+ [😶 Không trả lời. Uống tiếp.]
    bac_bao_ve: Thế à.
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
_Phòng chờ. Đĩa bánh chuối chiên. {sieu_nhan_hong} đang tập tạo dáng trước gương: "Biến hình!"_
sieu_nhan_hong: A! Chị Đại! Tui tập tư thế mới nè. Coi được hông?
* [📋 "Đêm Hồng, ông đi lối bên trái. Bên phải là lối của {cho}. Nhớ chưa?"]
    sieu_nhan_hong: Bên trái… bên trái… {cho} bên phải. Nhớ rồi! Mà tui đi ngang chọc nó một xíu được hông?
    chi_dai: Hông.
    sieu_nhan_hong: Một xíu thôi…
    chi_dai: Hông.
    ~ cd_td(2)
* [🦁 "Tư thế đẹp. Mà ông đứng thẳng lưng lên. Siêu nhân mà gù."]
    sieu_nhan_hong: *(đứng thẳng)* Vậy hả? Hồng là thái độ!
    chi_dai: Thái độ thì đứng thẳng.
    ~ qh("sieu_nhan_hong", 5)
* [💬 "Ông ăn bánh chuối chiên hoài hông ngán hả?"]
    sieu_nhan_hong: Hông bao giờ. Hồi nhỏ ở xóm tui, có bà bán bánh chuối chiên đầu hẻm. Ngày nào cũng mua. Giờ bà mất rồi.
    ~ qh("sieu_nhan_hong", 5)
+ [😶 Giơ ngón cái, đi ra.]
- sieu_nhan_hong: Chị Đại… tui hỏi nha. Nếu người ta biết tui chỉ là một người bình thường, người ta còn thích tui hông?
* [😇 "Chị là người bình thường. Có người thích chị đó thôi."]
    sieu_nhan_hong: *(nghiêng đầu)* Ai thích chị?
    chi_dai: {cho}.
    sieu_nhan_hong: *(cười phá lên)* Vậy là đủ rồi!
    ~ qh("sieu_nhan_hong", 10)
* [🦁 "Người ta thích ông vì ông đẩy xe cho bà cụ. Hông phải vì cái mũ."]
    sieu_nhan_hong: *(sờ chiếc mũ)* …Thật hả chị?
    ~ qh("sieu_nhan_hong", 8)
+ [😶 "Hỏi khán giả đi."]
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_cho ===
# npc:cho
_Gầm cầu thang. {cho} nằm gác cằm lên một cái thùng carton, canh kho báu. Thấy bạn, đuôi đập lộp độp._
cho: Gâu!
* [🍖 Đưa một cây xúc xích.]
    cho: *(ăn trong 1,2 giây)* Gâu gâu!
    ~ qh("cho", 8)
    { co(xuc_xich):
        ~ mat(xuc_xich)
    }
* [🐕 "{cho}. Ngồi. Bắt tay."]
    _{cho} ngồi. Đưa chân. Nhìn bạn chờ đợi phần thưởng như một nhân viên chờ lương ngày 10._
    ~ qh("cho", 4)
    ~ cd_uy(1)
* [🕵️ Ngó vào cái thùng carton.]
    cho: Grừ…
    _Một chiếc găng tay hồng, một cái chìa khóa, một thỏi son. Bạn rút tay lại. Kho của ai người nấy giữ._
+ [😶 Xoa đầu, đi qua.]
- cho: *(gối đầu lên giày bạn)* …Gâu.
* [😇 Ngồi xuống cạnh {cho} một lúc.]
    _Năm phút. Gầm cầu thang mát rượi. Tiếng bước chân trên đầu. Ai cũng vội. Chỉ hai đứa ở dưới này là không._
    ~ cd_nk(-10)
    ~ qh("cho", 5)
* [📻 Bộ đàm gọi. Phải đi.]
    cho: *(nhìn theo)* Ẳng.
+ [😶 Rút chân ra nhẹ nhàng.]
- -> END
