// ============================================================
// THỰC TẬP SINH · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// Game mở cảnh khi người chơi bắt chuyện với NPC (thẻ npc:<mã>).
// ============================================================

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Anh {thuc_tap_sinh}! Nói nhỏ thôi nha… anh có biết hồi nhỏ anh Hồng sống ở đâu hông? Tui tò mò thôi, hổng có ý gì đâu.
+ [😇 "Dạ em không biết ạ. Em mới vô nên chưa biết ạ."]
    ran_doc: *(cười)* Anh dễ thương ghê. Ai cũng như anh thì công ty yên bình rồi.
    ~ qh("ran_doc", 3)
    ~ duy_ngo(2)
+ [❓ "Dạ sao anh muốn biết vậy ạ?"]
    ran_doc: À… tui viết bản tin nội bộ. Mục "Góc nhìn đối tác".
    _Bạn gật. Bạn tin. Bạn ghi vào sổ: "Anh {ran_doc} viết mục Góc nhìn đối tác." Mục đó chưa từng có trong bản tin nào._
+ {duy_do_ngo <= 40} [🧮 "Dạ anh hỏi câu này lần thứ 3 rồi đó ạ. Hôm thứ 2, hôm thứ 4, và bây giờ."]
    ran_doc: *(khựng lại nửa giây)* Ủa vậy hả? Tui quên. Tui hay quên lắm.
    _Một người hay quên thì không đếm được ai đi trễ bao nhiêu lần. Mà {ran_doc} đếm được._
    ~ qh("ran_doc", -10)
    ~ duy_ngo(-3)
- ran_doc: Mà nè, cho tui mượn 500 nghìn tới thứ 6 được hông? Tui kẹt chút.
+ [🙇 "Dạ em gửi anh ạ."]
    ~ tien_cong(-500000)
    ~ duy_so_nguoi_muon++
    ~ qh("ran_doc", 5)
    ~ duy_lo(3)
    ran_doc: Anh tốt ghê. Tui sẽ nhớ.
    _Câu "tui sẽ nhớ" của {ran_doc} nghe giống câu đe dọa hơn câu cảm ơn._
+ [😶 "Dạ em cũng đang kẹt ạ."]
    ran_doc: Ờ, vậy thôi.
+ {duy_mo_noi_loan} [😤 "Dạ không ạ. Anh còn chưa trả ai trong phòng hết."]
    ~ duy_so_lan_noi_loan++
    ran_doc: *(cười rất ngọt)* Ủa anh {thuc_tap_sinh} dạo này lạ ghê.
    ~ qh("ran_doc", -10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_giam_doc ===
# npc:giam_doc
{ duy_nhanh_nguoi_gac_ket:
    giam_doc: Anh {thuc_tap_sinh}! Vào đây, vào đây. Ngồi đi. Anh pha trà.
    _Từ hôm 22/10, {giam_doc} gọi một thực tập sinh là "anh Duy". Cả tầng 2 không hiểu vì sao._
- else:
    giam_doc: Thực tập sinh! Vào đây anh nhờ tí. Anh không ép, tùy em.
}
+ [🙇 "Dạ em làm liền ạ!"]
    ~ duy_da()
    ~ duy_day_viec(1)
    giam_doc: In giúp anh bài phát biểu này. 15 trang. Cỡ chữ 20 để anh đọc không cần kính.
    ~ duy_kn(1)
    ~ qh("giam_doc", 3)
+ [❓ "Dạ anh ơi, cái giải 'Doanh nhân của năm' này của BTT Global hả anh? BTT Global ở đâu vậy anh?"]
    giam_doc: Ở… ở nước ngoài! Tập đoàn lớn lắm! {sales} quen chủ tịch đấy!
    _Bạn tra mã số doanh nghiệp in trên giấy khen trong 3 giây. Không tồn tại. Bạn quyết định không nói._
    ~ phat_hien(btt_global_gia)
    ~ duy_lo(3)
+ {duy_kinh_nghiem >= 30} [🏦 "Dạ anh, em thấy anh hay gọi ngân hàng. Anh có cần ai đọc giúp hợp đồng không ạ?"]
    giam_doc: *(nhìn bạn rất lâu)* Em… đọc được hợp đồng ngân hàng à?
    thuc_tap_sinh: Dạ… em đọc chậm thôi ạ.
    giam_doc: Ừ… để anh nghĩ. Để anh nghĩ đã.
    ~ qh("giam_doc", 8)
    ~ duy_lo(8)
- giam_doc: Thực tập sinh 30 tuổi. Anh hỏi thật, em vào đây làm gì? Lương 4 triệu thì ai sống nổi?
+ [😇 "Dạ em thích làm truyền hình từ nhỏ ạ. Xem phim xong em hay viết lại cái kết."]
    giam_doc: Viết lại cái kết… *(cười)* Anh cũng muốn viết lại cái kết của mấy năm nay lắm.
    ~ qh("giam_doc", 5)
    ~ duy_lua_doi(3)
+ [😶 "Dạ em mới vô nên chưa biết ạ."]
    giam_doc: Câu trả lời hay đấy. Anh mượn nhé, mai họp với ngân hàng anh dùng.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_truong_phong ===
# npc:truong_phong
truong_phong: Cậu {thuc_tap_sinh}. À… anh… à, cậu. Tớ cần người ghi biên bản cuộc họp 14 giờ.
_{truong_phong} 28 tuổi, bạn 30. Hai tháng rồi {truong_phong} vẫn chưa chọn được cách xưng hô._
+ [🙇 "Dạ em làm liền ạ! Anh cứ gọi em là em ạ."]
    ~ duy_da()
    ~ duy_day_viec(1)
    truong_phong: *(thở phào)* Được. Em. Tốt. Gọn.
    ~ qh("truong_phong", 5)
    ~ duy_kn(2)
+ [❓ "Dạ cuộc họp này họp về gì ạ, để em chuẩn bị biểu mẫu ạ?"]
    truong_phong: Họp về… *(nhìn lịch)* … cách giảm số cuộc họp.
    thuc_tap_sinh: Dạ… vậy mình có cần họp không ạ?
    _{truong_phong} đứng im 5 giây. Rồi hủy cuộc họp. Lần đầu tiên trong năm._
    ~ qh("truong_phong", 3)
    ~ duy_ngo(-3)
+ {duy_mo_noi_loan} [😤 "Dạ hôm nay em ghi 3 biên bản rồi ạ. Anh nhờ chị {bien_kich} giúp được không ạ?"]
    ~ duy_so_lan_noi_loan++
    truong_phong: *(sững người)* … Cậu từ chối tớ à?
    { RANDOM(1, 10) <= 6:
        truong_phong: Ừ… hợp lý. 3 biên bản là nhiều. Tớ ghi nhận.
        ~ qh("truong_phong", 3)
    - else:
        truong_phong: Tớ sẽ take note chuyện này.
        ~ qh("truong_phong", -8)
    }
- truong_phong: Mà cậu… em… học dựng phim tới đâu rồi?
+ [😇 "Dạ em biết J, K, L, với phím C ạ."]
    truong_phong: *(nhỏ giọng)* Tớ… tớ còn chưa biết phím C. Đừng nói ai nhé.
    ~ qh("truong_phong", 5)
    ~ duy_kn(2)
+ [😶 "Dạ em còn kém lắm ạ."]
    truong_phong: Ừ. Cứ từ từ.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Em {thuc_tap_sinh}. Chị nói em nghe nè, đi pha trà cho anh {giam_doc} giùm chị. Trà sen, 85 độ, đúng 3 phút.
_{thanh_ninh} 28 tuổi. Xưng "chị" với bạn rất tự nhiên. Bạn cũng "dạ" rất tự nhiên._
+ [🙇 "Dạ em làm liền ạ!"]
    ~ duy_da()
    ~ duy_day_viec(1)
    thanh_ninh: Ngoan. Mà nhớ nói là chị pha nha.
    ~ qh("thanh_ninh", 3)
+ [❓ "Dạ 85 độ là đo bằng gì ạ chị?"]
    thanh_ninh: … Bằng cảm giác! Cảm giác của người hiểu sếp! Thôi để chị pha.
    ~ duy_ngo(3)
+ {duy_mo_noi_loan} [😤 "Dạ chị pha thì chị nói chị pha ạ. Em pha thì em nói em pha ạ."]
    ~ duy_so_lan_noi_loan++
    thanh_ninh: *(há miệng)* Em… em nói chuyện với chị kiểu đó hả?
    ~ qh("thanh_ninh", -10)
    ~ qh("chi_dai", 3)
- thanh_ninh: Mà nè, em có thấy ai ra vào tòa nhà kính màu xanh lá chuối hông? Chị hỏi chơi thôi.
+ [😶 "Dạ em không để ý ạ."]
    thanh_ninh: Ừ. Không để ý là tốt.
+ [❓ "Dạ chị hay qua đó hả chị?"]
    thanh_ninh: *(cười hơi nhanh)* Đâu có! Chị đi ngang thôi! Thôi pha trà đi em!
    ~ qh("thanh_ninh", -3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Ê ông thực tập sinh! Nghe gì chưa? Ối dồi ôi, cả công ty đồn ông có cái thẻ gì lấp lánh lắm!
+ [😶 "Dạ thẻ tích điểm siêu thị ạ."]
    hong_hot: Siêu thị nào mà thẻ lấp lánh vậy? Chỉ tui đi!
    { duy_do_lo >= 50:
        _{hong_hot} không tin. Rõ ràng là không tin. Nhưng {hong_hot} cười cho qua, chuyện hiếm có._
    }
+ [🍜 Lấy gói mì gói trong balo ra bẻ ăn sống.]
    hong_hot: Ờ… ông ăn mì sống luôn hả? Thôi, chắc tin đồn xạo.
    ~ duy_lo(-5)
    ~ duy_ngo(3)
+ [❓ "Dạ chị nghe ai nói vậy ạ?"]
    hong_hot: Nguồn tin bảo mật! *(nhìn sang {ran_doc})*
    ~ duy_ngo(-2)
- hong_hot: Mà ông viết caption hay ghê. Tuần này viết giùm tui 5 bài cho page nha. Free nha.
+ [🙇 "Dạ em làm liền ạ!"]
    ~ duy_da()
    ~ duy_day_viec(2)
    ~ follow(8000)
    ~ duy_kn(3)
    hong_hot: Ông là nhất! Ông là nhân viên của tháng! À không, ông là thực tập sinh của tháng!
+ [😇 "Dạ em viết, nhưng chị ghi tên em ở cuối bài được không ạ?"]
    hong_hot: *(khựng)* Ghi tên hả… Ờ được! Ghi "Bài: {thuc_tap_sinh}". Hợp lý mà!
    ~ follow(8000)
    ~ duy_lua_doi(8)
    ~ duy_kn(3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Anh {thuc_tap_sinh}! Chill hông? Cà phê Sống Ảo hông? Anh bao… à mà thẻ anh bị khóa.
+ [👔 "Dạ chill đi anh." (Bắt Chước Anh {con_ong_chau_cha})]
    con_ong_chau_cha: *(cười)* Anh nói giống em y chang. Ủa sao áo anh y chang áo em nữa?
    ~ duy_ngay_mac_giong_long++
    ~ qh("con_ong_chau_cha", 10)
    ~ qh("truong_phong", -5)
    ~ duy_lo(-5)
+ [💳 "Dạ để em mời anh ạ." (cho mượn tiền tiêu)]
    ~ tien_cong(-500000)
    ~ duy_so_nguoi_muon++
    con_ong_chau_cha: Thiệt hả anh? Lần đầu anh được thực tập sinh bao. Chú anh mà biết chắc xỉu.
    ~ qh("con_ong_chau_cha", 8)
    ~ duy_lo(5)
+ [😶 "Dạ em đi photo ạ."]
    con_ong_chau_cha: Ờ. Anh đi photo với anh được hông? Anh chưa photo bao giờ.
    _Bạn dạy {con_ong_chau_cha} photo. {con_ong_chau_cha} vui như được đồ chơi mới._
    ~ qh("con_ong_chau_cha", 5)
- { duy_long_biet:
    -> thuc_tap_sinh_tudo_con_ong_chau_cha_nhanh_1
}
-> END

= thuc_tap_sinh_tudo_con_ong_chau_cha_nhanh_1
con_ong_chau_cha: Mà nè… anh hứa cho anh nghe một bài nhạc. Tối nay qua penthouse đi. Phòng thu. Đừng nói ai.
+ [🎧 "Dạ em qua ạ."]
    _Phòng thu nhỏ, cách âm, 41 bản demo. Bài thứ 41: "Hồng Là Thái Độ". Ký tên: "Rồng". Bạn nghe hết bài, mắt cay._
    thuc_tap_sinh: Anh {con_ong_chau_cha}… bài này hay quá. Anh phải cho người ta nghe.
    con_ong_chau_cha: *(cười, hơi ngượng)* Anh đang nghĩ. Có anh nghe rồi, giờ anh bớt sợ.
    ~ phat_hien(bai_hat_long)
    ~ qh("con_ong_chau_cha", 15)
    ~ duy_lua_doi(10)
+ [😶 "Dạ hôm khác ạ, em sợ làm phiền anh."]
    con_ong_chau_cha: Ờ… ừ. Lúc nào cũng được.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: Anh {thuc_tap_sinh} ơi, em nhờ xíu…
~ duy_day_viec(1)
+ [🙇 "Dạ em làm liền ạ!"]
    ~ duy_da()
    ~ duy_kn(3)
    ~ nghi(-15)
    chua_te_deadline: Anh là nhất. Anh mua giùm em 2 lon Trâu Cày với cái bánh chuối chiên cho anh Hồng nha.
    ~ qh("chua_te_deadline", 3)
+ [❓ "Dạ việc này gấp không ạ, hay để em xếp sau việc anh {truong_phong} giao ạ?"]
    chua_te_deadline: *(khựng)* Ờ… hông gấp. Để em tự làm. Tại em quen miệng nhờ anh á.
    ~ duy_ngo(-2)
    ~ duy_kn(2)
+ {duy_mo_noi_loan} [😤 "Dạ hôm nay em xin phép không ạ. Anh tự làm một việc, em làm hai việc."]
    ~ duy_so_lan_noi_loan++
    { RANDOM(1, 10) <= 6:
        chua_te_deadline: *(nhìn bạn 3 giây)* … Công bằng. Xin lỗi anh.
        ~ qh("chua_te_deadline", 5)
    - else:
        chua_te_deadline: Ờ… ok anh.
        _Chiều đó, {chua_te_deadline} kể với {truong_phong}: "Thực tập sinh dạo này lạ lắm."_
        ~ qh("truong_phong", -5)
    }
    ~ duy_lua_doi(3)
- chua_te_deadline: Mà nè… anh nghĩ mấy món quà hồng trên bàn em là PR hả?
+ [😇 "Dạ, em thấy anh Hồng gói quà lúc 7 giờ sáng, không có camera nào hết ạ."]
    chua_te_deadline: *(im lặng)* … 7 giờ sáng? Anh đi làm lúc 7 giờ hả?
    thuc_tap_sinh: Dạ, em tới sớm nhất ạ.
    _{chua_te_deadline} nhìn ra cửa sổ rất lâu. Lần đầu bạn thấy {chua_te_deadline} không cầm điện thoại._
    ~ qh("chua_te_deadline", 5)
    ~ qh("sieu_nhan_hong", 3)
+ [😶 "Dạ em mới vô nên chưa biết ạ."]
    chua_te_deadline: Ha. Ừ. Em cũng chưa biết.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {thuc_tap_sinh}. Ngồi xuống. Phiếu chi photo tháng này em làm chưa? Không có hóa đơn là không có tiền.
+ [📄 Đưa xấp hóa đơn đã xếp theo ngày, có đánh số, có tổng cộng.]
    ke_toan: *(lật từng tờ, chậm rãi)* … Em xếp hóa đơn như người làm kiểm toán.
    ~ qh("ke_toan", 8)
    ~ duy_lo(5)
    ~ duy_kn(2)
+ [😶 "Dạ em làm liền ạ, em quên ạ."]
    ~ duy_da()
    ke_toan: Không sao. Lần đầu. Chị nhắc lần hai thì không còn là lần đầu nữa.
- { duy_hai_nguoi_biet_so:
    -> thuc_tap_sinh_tudo_ke_toan_nhanh_2
}
ke_toan: Mà em nè, có ai trong công ty mượn tiền em chưa?
+ [😇 "Dạ chưa ạ."]
    ke_toan: Tốt. Ai mượn, em nói chị.
+ {duy_so_nguoi_muon >= 2} [😅 "Dạ… vài người ạ."]
    ke_toan: *(thở dài, mở sổ)* Đọc tên. Chị ghi.
    _{ke_toan} ghi từng cái tên. Cuốn sổ đó đáng sợ hơn mọi giấy nhắc nợ._
    ~ qh("ke_toan", 3)
- -> END

= thuc_tap_sinh_tudo_ke_toan_nhanh_2
ke_toan: *(nói nhỏ, cửa đóng)* Khoản 15/11. Em có tính ra cách nào chưa?
+ [🏦 "Dạ, nếu chiến dịch đạt thưởng 5 tỷ thì trả được. Nếu không thì phải xin giãn nợ ạ."]
    ke_toan: Giãn nợ… ai xin được?
    thuc_tap_sinh: Dạ… người từng duyệt nó ạ.
    _{ke_toan} nhìn bạn. Lần đầu tiên trong 2 tháng, chị cười. Một cái cười nhẹ như vừa tìm ra hóa đơn bị mất._
    ~ qh("ke_toan", 10)
    ~ duy_kn(3)
+ [😶 "Dạ em chưa ạ."]
    ke_toan: Ừ. Hai đứa mình cùng chưa.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_hr ===
# npc:hr
hr: Em {thuc_tap_sinh}. Em rảnh không, lên phòng anh uống trà xíu.
+ [😰 "Dạ… em làm gì sai hả anh?"]
    hr: Anh chỉ muốn lắng nghe em thôi. Em thấy thực tập ở đây sao?
    ~ cang_thang(5)
+ [☕ "Dạ, em thích trà Atiso ạ."]
    hr: Ồ. Em là người đầu tiên chọn trà trước khi anh mời. Ngồi đi.
    ~ qh("hr", 8)
- hr: Mình cùng nhìn lại hành trình nha em. Cuối tháng có họp đánh giá. Em nghĩ mình nên được giữ lại không?
+ [😇 "Dạ em nghĩ em đã học được nhiều. Em mong được ở lại ạ."]
    hr: Ừ. Nói thẳng. Anh thích.
    ~ qh("hr", 5)
+ [😶 "Dạ tùy anh chị đánh giá ạ."]
    hr: "Tùy". Ừ… Ở đây ai cũng "tùy". Em thử một lần nói muốn gì xem.
    ~ duy_ngo(3)
+ [❓ "Dạ anh ơi, danh sách cắt giảm có thật không ạ?"]
    hr: *(nụ cười đứng yên 2 giây)* Em nghe ai nói?
    thuc_tap_sinh: Dạ… mọi người nói ạ.
    hr: Mọi người nói nhiều lắm em. Uống trà đi.
    _Không trả lời. Ở phòng HR, không trả lời là một câu trả lời._
    ~ phat_hien(danh_sach_cat_giam)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_it ===
# npc:it
it: Gì?
+ [🖨️ "Dạ máy in lại kẹt ạ."]
    it: Đá góc trái phía sau. 3 phân dưới logo. Nhẹ thôi.
    ~ duy_kn(2)
    ~ qh("it", 2)
+ [🍜 Đưa ly mì ly nóng.]
    it: … *(nhận, ăn)* Ừ.
    ~ qh("it", 8)
+ [💬 "Dạ anh dạy em thêm phần mềm dựng phim được không ạ?"]
    it: Hỏi {editor}. Mà {editor} ngủ. Ngồi đây. 15 phút.
    ~ duy_kn(5)
    ~ qh("it", 3)
- it: Anh {dan_dau_tu} nợ em bao nhiêu?
+ [😇 "Dạ 500 nghìn ạ."]
    it: Anh 3 triệu. Đừng cho mượn thêm.
    ~ qh("it", 3)
+ {duy_so_nguoi_muon >= 3} [😅 "Dạ… em cho nhiều người mượn lắm ạ."]
    it: *(nhìn bạn)* Log chuyển khoản của em dài hơn log của anh {dan_dau_tu}. Cẩn thận.
    ~ duy_lo(3)
+ {duy_mo_noi_loan} [😤 "Dạ anh hỏi chi ạ? Chuyện tiền của em mà."]
    ~ duy_so_lan_noi_loan++
    it: … Ừ. Đúng. *(quay lại màn hình)*
    _{it} không giận. {it} chỉ ghi nhận. Và từ đó, {it} tôn trọng bạn hơn một chút._
    ~ qh("it", 2)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen, trong nhà)* Em biết anh là ai không?
+ [😇 "Dạ biết ạ. 'Công Viên', 2015. Em nghe mỗi sáng trên đường đi làm, hồi đó ạ."]
    idol_het_thoi: *(gỡ kính ra một nửa)* Hồi đó em đi làm ở đâu?
    thuc_tap_sinh: Dạ… ở một chỗ có máy lạnh lạnh lắm ạ.
    ~ qh("idol_het_thoi", 8)
+ [🎤 Hát: "Ngày xưa có đôi bạn thân…"]
    idol_het_thoi: *(hát tiếp theo phản xạ)* …bán cá viên chiên tại công viên! Hừm. Em hát lạc tông, nhưng có tâm.
    ~ qh("idol_het_thoi", 5)
- idol_het_thoi: Nè… cho anh mượn 2 triệu được hông. Tiền nhà. Đừng nói {quan_ly_idol}.
+ [🙇 "Dạ em gửi anh ạ."]
    ~ tien_cong(-2000000)
    ~ duy_so_nguoi_muon++
    ~ duy_lo(5)
    idol_het_thoi: *(gỡ hẳn kính)* … Cảm ơn em. Anh trả. Anh hứa. Bằng tiền hát đám cưới.
    ~ qh("idol_het_thoi", 10)
+ [🧮 "Dạ anh ơi, anh nợ 3 tháng nhà là 36 triệu. 2 triệu không giải quyết được ạ. Mình lập kế hoạch trả nợ đi anh."]
    idol_het_thoi: *(nhìn bạn, sững người)* … Sao em biết anh nợ bao nhiêu?
    thuc_tap_sinh: Dạ… em đoán theo giá thuê ở Sky Ảo ạ.
    ~ duy_lo(10)
    ~ qh("idol_het_thoi", 3)
    ~ duy_kn(3)
+ [😶 "Dạ em chỉ có 300 nghìn tới cuối tuần ạ."]
    idol_het_thoi: Ừ… thôi. Hồi anh còn nổi, anh bao cả đoàn.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút… *(3 phút)* Rồi. Em, giữ giùm anh cái điện thoại này. Nó reo thì nói "anh {quan_ly_idol} đang bận".
+ [🙇 "Dạ em làm liền ạ!"]
    ~ duy_da()
    ~ duy_day_viec(1)
    _Điện thoại reo 14 lần trong 20 phút. Bạn nói "anh {quan_ly_idol} đang bận" 14 lần, mỗi lần một giọng khác nhau cho đỡ chán._
    ~ qh("quan_ly_idol", 5)
+ [🗓️ "Dạ anh ơi, để em xếp lịch 2 nghệ sĩ vào một bảng cho anh ạ."]
    _10 phút. Một bảng. Lịch {idol_het_thoi} màu xanh, lịch Siêu Nhân Hồng màu hồng. Chỗ trùng tô đỏ._
    quan_ly_idol: *(đặt cả hai điện thoại xuống)* … Em ở đâu ra vậy em?
    ~ qh("quan_ly_idol", 10)
    ~ duy_kn(5)
    ~ duy_lo(5)
- quan_ly_idol: Em… em nghĩ sao về {idol_het_thoi}? Thật lòng.
+ [😇 "Dạ, anh {idol_het_thoi} hát thật ạ. Mấy cái comment thì không thật, nhưng giọng anh ấy thật ạ."]
    quan_ly_idol: *(im lặng)* … Ừ. Giọng thật. Anh biết. Anh biết từ 2015.
    ~ qh("quan_ly_idol", 8)
+ [😶 "Dạ em mới vô nên chưa biết ạ."]
    quan_ly_idol: Ừ. Không biết cũng tốt.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_bien_kich ===
# npc:bien_kich
bien_kich: {thuc_tap_sinh}. Ngồi đây. Tui đang bí. Kể tui nghe chuyện gì đó… có nỗi đau.
{ duy_biet_y_tuong_bi_lay && not duy_doi_chat_oanh:
    _Lần trước bạn kể cho {bien_kich} nghe một chuyện. Chuyện đó giờ có tên khác, và tên tác giả khác._
}
+ {ngay < 12 && not duy_y_tuong_24h} [💬 Kể ý tưởng "24 Giờ Giúp Người".]
    bien_kich: *(mắt sáng lên, ghi ghi chép chép)* Hay. Hay lắm. Ý tưởng tốt. Tui… tui ghi lại để tham khảo thôi.
    ~ duy_oanh_nghe_truoc = true
    ~ qh("bien_kich", 5)
+ [😶 "Dạ em không có chuyện gì ạ."]
    bien_kich: Ai cũng có. Người không kể là người có nhiều nhất.
+ {duy_biet_y_tuong_bi_lay && not duy_doi_chat_oanh} [✍️ "Dạ chị ơi, chuyện 'Người Gác Két' em kể tháng 9, chị còn nhớ không ạ?"]
    bien_kich: *(dừng bút)* … Nhớ.
    thuc_tap_sinh: Dạ, em chỉ muốn chị nhớ là chị nhớ thôi ạ.
    _{bien_kich} nhìn bạn rất lâu. Rồi gập laptop. "Để tui nghĩ."_
    ~ duy_doi_chat_oanh = true
    ~ phat_hien(nguoi_gac_ket)
    ~ qh("bien_kich", -5)
    ~ duy_lua_doi(5)
+ {duy_mo_noi_loan} [😤 "Dạ chị muốn nỗi đau thì chị tự nghĩ ạ. Ý em kể, chị lấy hết rồi."]
    ~ duy_so_lan_noi_loan++
    bien_kich: *(tái mặt)* … Ừ. Đáng.
    ~ qh("bien_kich", -15)
    ~ duy_doi_chat_oanh = true
- { co(so_tay_oanh):
    -> thuc_tap_sinh_tudo_bien_kich_nhanh_3
}
-> END

= thuc_tap_sinh_tudo_bien_kich_nhanh_3
_Trong balo bạn vẫn là cuốn sổ bìa da của {bien_kich}, nhặt trên xe đi Vũng Tàu._
+ [🤝 Trả lại cuốn sổ.]
    ~ mat(so_tay_oanh)
    bien_kich: *(ôm cuốn sổ)* Em… đọc chưa?
    thuc_tap_sinh: Dạ, chương 14 ạ.
    bien_kich: *(nhắm mắt)* Chương 14 tui sẽ viết lại. Có tên em. Tên thật. Ở đúng chỗ.
    ~ qh("bien_kich", 15)
+ [😶 Giữ thêm ít hôm.]
    _Cuốn sổ nằm lại trong balo. Nặng hơn cân nặng của nó._
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_editor ===
# npc:editor
editor: *(ngáp)* Ông… à, anh… à, em kiếm tui hả. Đợi render xong…
+ [☕ Đưa ly đen đá không đường.]
    editor: *(tỉnh 40%)* Nhớ tui uống gì hả. Cảm ơn.
    ~ qh("editor", 8)
+ [🎬 "Dạ anh cho em ngồi xem anh dựng được không ạ?"]
    editor: Ngồi đi. Đừng hỏi. Xem thôi.
    _Bạn xem 30 phút. Trong một khung hình, có một con cú nhỏ đậu trên vai Siêu Nhân Hồng. Bạn không hỏi. Đó là bí mật của {editor}._
    ~ duy_kn(5)
    ~ qh("editor", 5)
- editor: Em làm thực tập mà làm còn nhiều hơn tui. Em hông mệt hả?
+ [😇 "Dạ mệt ạ. Mà em vui ạ."]
    editor: *(nhìn bạn)* Ừ. Tui hiểu. Tui cũng vậy. Làm đêm, mệt, mà vui. Chỉ là hông ai thấy.
    ~ qh("editor", 5)
    ~ duy_lua_doi(3)
+ {duy_mo_noi_loan} [😤 "Dạ mệt ạ. Mai em sẽ từ chối bớt."]
    ~ duy_so_lan_noi_loan++
    editor: Tốt. Tui chưa bao giờ làm được câu đó. Em làm giùm tui.
    ~ qh("editor", 5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_designer ===
# npc:designer
designer: Em {thuc_tap_sinh}! Cho chị xin feedback cụ thể được không? Poster này em thấy sao?
+ [😇 "Dạ bản này đẹp ạ. Mà bản 1 hồi sáng đẹp hơn ạ."]
    designer: *(mở bản 1)* … Đúng. Bản 1. Lúc nào cũng là bản 1. Cảm ơn em.
    ~ qh("designer", 8)
+ [❓ "Dạ sao chị có 2 laptop vậy chị?"]
    designer: *(gập một cái lại)* Một cái để làm, một cái để… backup. Đừng hỏi nữa nha em.
    ~ qh("designer", -3)
+ [🙇 "Dạ chị cần em làm gì không ạ?"]
    ~ duy_da()
    ~ duy_day_viec(1)
    designer: Cắt giùm chị 40 tấm ảnh nền. Em biết cắt nền không?
    thuc_tap_sinh: Dạ… em học liền ạ.
    ~ duy_kn(3)
- designer: Mà em nè, {sales} có nhờ em gì kỳ kỳ hông?
+ [😶 "Dạ không ạ."]
    designer: Ừ. Có thì nói chị.
+ [😇 "Dạ chị {sales} nhờ em đóng vai… à không ạ."]
    designer: *(cười)* Thôi. Hai chị em tụi chị nhờ em nhiều quá. Chị biết.
    ~ qh("designer", 3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_sales ===
# npc:sales
sales: Em {thuc_tap_sinh}! Tin chị đi, chị sắp ký 3 nhà tài trợ! Mà… em cho chị tạm ứng 3 triệu được hông? Tiếp khách. Chị trả liền.
_{sales} 26 tuổi. Nhỏ nhất công ty. Gọi bạn là "em". Bạn "dạ chị"._
+ [🙇 "Dạ em gửi chị ạ."]
    ~ tien_cong(-3000000)
    ~ duy_so_nguoi_muon++
    ~ duy_lo(5)
    sales: Em là nhất! Tin chị đi, em có tương lai!
    ~ qh("sales", 10)
+ [🧮 "Dạ chị ơi, BTT Global không có mã số doanh nghiệp ạ."]
    sales: *(cười đơ 3 giây)* … Em tra hả?
    thuc_tap_sinh: Dạ em tra ạ.
    sales: *(nói nhỏ)* Đừng nói ai. Chị… chị đang tìm nhà tài trợ thật. Thật đó. No cap. Lần này no cap thiệt.
    ~ phat_hien(btt_global_gia)
    ~ duy_lo(8)
    ~ qh("sales", -5)
+ {duy_mo_noi_loan} [😤 "Dạ chị nhỏ hơn em 4 tuổi mà chị mượn em hoài ạ."]
    ~ duy_so_lan_noi_loan++
    sales: *(há miệng)* … Ờ. Đúng. Ờ. Chị xin lỗi… em. À, anh.
    ~ qh("sales", -5)
- sales: Mà nè, nếu chị nói thật một lần, em có tin hông?
+ [😇 "Dạ em tin ạ. Em sẽ gọi điện xác nhận giúp chị ạ."]
    sales: *(im một giây)* … Em dễ thương ghê.
    ~ qh("sales", 5)
+ [😶 "Dạ em mới vô nên chưa biết ạ."]
    sales: Ừ. Ai cũng "mới vô" khi chị nói thật.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {thuc_tap_sinh}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
+ [😇 "Dạ chưa chị ạ."]
    chi_dai: Biết ngay. *(đẩy qua hộp cơm)* Ăn. Mì gói không phải cơm.
    ~ an(40)
    ~ qh("chi_dai", 5)
+ [😅 "Dạ em ăn mì gói rồi chị."]
    chi_dai: Mì gói là đồ ăn khuya. Không phải cơm trưa. Ăn.
    ~ an(30)
    ~ qh("chi_dai", 3)
- chi_dai: Có đứa nào bắt nạt em không? Nói chị.
+ [🛡️ "Dạ… anh {chua_te_deadline} nhờ em hơi nhiều ạ."]
    ~ duy_lan_goi_huong++
    chi_dai: Ừ. Chị biết. Chị đếm rồi. Để chị nói.
    { duy_lan_goi_huong >= 4:
        _{chi_dai} nhìn bạn. "Mà em nè, chị bênh được em, chứ chị không đứng thay em được. Lần sau em tự nói thử."_
    - else:
        ~ qh("chi_dai", 3)
    }
+ [😇 "Dạ không ạ. Em tự lo được ạ."]
    chi_dai: *(nheo mắt)* Ừ. Nói được thì làm được.
    ~ duy_lua_doi(3)
+ {duy_huong_biet} [🤝 "Dạ chị ơi, nếu em về lại chỗ cũ, chị có buồn không?"]
    chi_dai: *(đặt đũa xuống)* Buồn. Nhưng chị buồn hơn nếu em ở đây mà không vui.
    _{chi_dai} nói xong thì cúi xuống ăn tiếp, không nhìn bạn. Tai {chi_dai} hơi đỏ._
    ~ qh("chi_dai", 8)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_dan_dau_tu ===
# npc:dan_dau_tu
{ duy_chuong_coi_la_thay:
    dan_dau_tu: Thầy! Thầy ơi, thầy xem giùm em cái chart này!
    _Một người 37 tuổi gọi một thực tập sinh 30 tuổi là "thầy". Tầng 1 đã quen._
- else:
    dan_dau_tu: {thuc_tap_sinh}! Lại đây xem nè! Đáy rồi! Đáy thật rồi!
}
+ [🧮 Nhìn chart 3 giây: "Dạ đây chưa phải đáy ạ. Đây là… tầng hầm ạ."]
    dan_dau_tu: *(cười khổ)* Tầng hầm… Ừ. Em nói đúng mỗi lần. Anh ghét điều đó.
    ~ duy_lo(5)
    ~ qh("dan_dau_tu", 3)
+ [😶 "Dạ em không biết xem chart ạ."]
    dan_dau_tu: Không biết thì càng tốt! Người không biết toàn trúng!
    ~ duy_ngo(3)
- dan_dau_tu: Mà… em cho anh mượn thêm 1 triệu nha. Lần này là lên thật.
+ [🙇 "Dạ em gửi anh ạ."]
    ~ tien_cong(-1000000)
    { not duy_muon_chuong:
        ~ duy_so_nguoi_muon++
        ~ duy_muon_chuong = true
    }
    ~ duy_lo(3)
    ~ duy_lua_doi(-2)
+ {duy_tin_dung_hem_69} [📄 "Dạ anh trả xong đợt cũ đã ạ. Tuần này anh trả 200 nghìn chưa ạ?"]
    dan_dau_tu: *(lục ví, đưa đúng 200 nghìn)* Rồi! Đúng hạn! Lần đầu trong đời!
    ~ tien_cong(200000)
    ~ qh("dan_dau_tu", 5)
+ [😶 "Dạ em hết tiền rồi ạ."]
    dan_dau_tu: Ờ… Thôi để anh hỏi Bác {bac_bao_ve}.
    _Bác {bac_bao_ve} đã cho {dan_dau_tu} mượn 2 triệu. Bác không bao giờ đòi._
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho khụ khụ)* Dạ anh {thuc_tap_sinh}… em hơi sốt. Anh làm giùm em lịch điều phối hôm nay nha…
~ duy_day_viec(1)
+ [🙇 "Dạ em làm liền ạ!"]
    ~ duy_da()
    ~ duy_kn(3)
    thanh_xin_nghi: Anh là người tốt nhất công ty!
    ~ qh("thanh_xin_nghi", 5)
+ [❓ "Dạ anh sốt mà sao giọng anh trong vậy ạ? Như ca sĩ ạ."]
    thanh_xin_nghi: *(hết ho)* … Anh… nghe ra hả?
    _Bạn gật. {thanh_xin_nghi} nhìn quanh, rồi nói nhỏ: "Đừng nói ai nha. Em đang thi hát."_
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 5)
    ~ duy_ngo(-3)
+ {duy_mo_noi_loan} [😤 "Dạ anh nghỉ thì anh gửi lịch cho anh {chua_te_deadline} ạ. Em kín việc rồi ạ."]
    ~ duy_so_lan_noi_loan++
    thanh_xin_nghi: *(ngưng ho)* Ờ… dạ. Dạ được.
    ~ qh("thanh_xin_nghi", -3)
- thanh_xin_nghi: Mà anh… cho em mượn 500 nghìn tiền xăng đi Đài Tivi Hóng… à, đi khám bệnh.
+ [🙇 "Dạ em gửi anh ạ."]
    ~ tien_cong(-500000)
    ~ duy_so_nguoi_muon++
    thanh_xin_nghi: Em cảm ơn anh! Em trả liền! *(đây là lần thứ 2 {thanh_xin_nghi} nói câu này với bạn)*
    ~ qh("thanh_xin_nghi", 5)
+ [😶 "Dạ em cũng hết rồi ạ."]
    thanh_xin_nghi: Dạ thôi, không sao ạ.
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Ừ… Cháu {thuc_tap_sinh}. Lại tới sớm nhất.
+ [🍵 "Dạ, con pha trà cho bác ạ."]
    bac_bao_ve: *(nhận ly trà)* Ngồi đi. Hôm nay đài báo mưa.
    _Hai người ngồi nghe radio. Bác không nói gì. Bạn cũng không. Đó là kiểu nói chuyện dễ chịu nhất trong ngày._
    ~ qh("bac_bao_ve", 8)
    ~ cang_thang(-5)
+ [🐕 "Dạ con xin dắt {cho} đi dạo một vòng ạ."]
    bac_bao_ve: Ừ. Đừng cho nó lại gần shipper.
    ~ qh("cho", 5)
    ~ qh("bac_bao_ve", 3)
- bac_bao_ve: Cháu biết không. Người tốt thì hay bị nhờ. Bị nhờ nhiều quá thì quên mình là ai.
+ [😇 "Dạ, con nhớ con là ai mà bác."]
    bac_bao_ve: *(nhìn bạn, gật đầu chậm)* Ừ. Thế thì được.
    ~ qh("bac_bao_ve", 5)
    ~ duy_lua_doi(3)
+ [💬 "Dạ bác có bao giờ bị nhờ nhiều quá không bác?"]
    bac_bao_ve: Bác á? *(cười rất nhỏ)* Bác được nhờ giữ một tủ giấy tờ mười mấy năm. Chuyện người ta, bác không biết đâu.
    ~ qh("bac_bao_ve", 3)
+ {duy_so_nguoi_muon >= 3} [😅 "Dạ con… con cho nhiều người mượn tiền quá bác ạ."]
    bac_bao_ve: Ừ. Cho mượn thì đừng mong trả. Mong trả thì đừng cho mượn. Thế cho nhẹ lòng.
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: Biến hình! Thực tập sinh! Em mua bánh chuối chiên chưa?
+ [🍌 "Dạ rồi ạ. Bánh của xe đẩy đầu hẻm, không phải của tiệm ạ."]
    sieu_nhan_hong: *(khựng lại, hạ tay xuống)* … Sao em biết anh thích xe đẩy?
    thuc_tap_sinh: Dạ, em thấy anh ăn bánh tiệm thì cắn một miếng, bánh xe đẩy thì ăn hết ạ.
    ~ qh("sieu_nhan_hong", 10)
+ [🙇 "Dạ em đi mua liền ạ!"]
    ~ duy_da()
    ~ duy_day_viec(1)
    ~ qh("sieu_nhan_hong", 3)
- sieu_nhan_hong: Mà… ờm… em 30 tuổi mà đi thực tập. Em có sợ người ta cười hông?
+ [😇 "Dạ có ạ. Mà em sợ không làm hơn là sợ bị cười ạ."]
    sieu_nhan_hong: *(im lặng rất lâu, rồi tháo một bên găng tay)* … Anh cũng vậy. Mặc bộ đồ này, anh sợ người ta cười. Mà không mặc thì anh sợ hơn.
    ~ qh("sieu_nhan_hong", 10)
    ~ duy_lua_doi(5)
+ [👔 "Dạ chill đi anh."]
    sieu_nhan_hong: *(cười)* Chill! Hồng là thái độ, chill cũng là thái độ!
    ~ qh("sieu_nhan_hong", 5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_tudo_cho ===
# npc:cho
cho: Gâu! *(chạy tới, đứng hai chân, vẫy đuôi như cánh quạt)*
+ {co(xuc_xich)} [🦴 Cho {cho} một cây xúc xích.]
    ~ mat(xuc_xich)
    cho: *(ăn trong 2 giây, nằm ngửa ra cho gãi bụng)* Gâu gâu!
    ~ qh("cho", 12)
+ [🐾 Ngồi xuống xoa đầu.]
    cho: *(dụi đầu vào tay bạn)* Gâu.
    ~ qh("cho", 5)
+ [🍞 Chia nửa ổ bánh mì.]
    { co(banh_mi):
        ~ mat(banh_mi)
    }
    cho: *(ăn, liếm tay bạn)* Gâu!
    ~ qh("cho", 8)
- cho: *(chạy về gầm cầu thang, quay đầu lại nhìn bạn, chờ)*
+ [🔦 Đi theo.]
    _Gầm cầu thang. Kho báu của {cho}: chìa khóa, thỏi son, một cái găng tay hồng, một cái USB không nhãn. {cho} đẩy con gà cao su về phía bạn. Một món quà._
    _Bạn không lấy gì. Bạn xoa đầu nó. Bạn biết thế nào là kho riêng của một người._
    ~ qh("cho", 10)
+ [😶 Ở lại.]
    cho: *(nằm xuống chân bạn)* Gâu.
- -> END
