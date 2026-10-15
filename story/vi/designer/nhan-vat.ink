// ============================================================
// DESIGNER · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// Game mở các cảnh này khi người chơi bắt chuyện với NPC.
// ============================================================

// ------------------------------------------------------------
=== designer_tudo_npc_ran_doc ===
# npc:ran_doc
ran_doc: Chị {designer}! Nói nhỏ thôi nha… chị thấy anh {sieu_nhan_hong} có gì… lạ lạ hông?
* [💬 "Lạ là sao em?"]
    ran_doc: Kiểu… ảnh tốt quá mức á. Người gì đâu mà tốt quá. Em nói vậy thôi chứ không có ý gì đâu.
    ** [😇 "Tốt thì tốt thôi em. Hiếm mà."]
        ran_doc: *(cười)* Dạ. Hiếm thật.
        ~ qh("ran_doc", 3)
    ** [🎨 "Ảnh tốt mà tạo dáng dở. Đó là điểm lạ duy nhất."]
        ran_doc: Ha ha! Chị nói chuẩn ghê. Em ghi vô bản tin được hông?
        designer: Ghi đi, nhớ ghi nguồn.
        ~ qh("ran_doc", 5)
* [😶 "Chị bận sửa poster. Lần 43."]
    ran_doc: Dạ, chị cứ làm. Mà… file gốc chị vẫn để chỗ cũ hả chị?
    { ds_bat_duoc_ke_doi_file:
        designer: Chỗ cũ, khóa mới. Ba lớp.
        ran_doc: *(cười gượng)* Dạ… cẩn thận vậy là tốt chị.
    - else:
        designer: Ờ. Sao em?
        ran_doc: Dạ hông có gì. Em hỏi vậy thôi.
    }
* {biet(hieu_ech)} [🔒 "Hiếu. Em biết anh {sieu_nhan_hong} từ trước phải hông?"]
    ran_doc: *(mặt đanh lại một giây, rồi cười ngọt)* Chị nói gì kỳ vậy. Em mới vô mà.
    _Một giây đó đủ để bạn biết bạn đoán đúng. Và đủ để {ran_doc} biết bạn biết._
    ~ qh("ran_doc", -5)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_giam_doc ===
# npc:giam_doc
giam_doc: À {designer}! Đang định tìm em. Sân golf mini nhà anh cần một cái biển. Logo riêng. Em làm giúp anh ngoài giờ nhé. Anh không ép.
* [😇 "Dạ, em làm. Anh thích phong cách gì ạ?"]
    giam_doc: Sang, nhưng gần gũi. Hiện đại, nhưng cổ điển. Màu… 7 màu.
    designer: Dạ… em hiểu ý anh rồi.
    ~ qh("giam_doc", 8)
    ~ ds_sua(1)
* [💬 "Dạ anh, làm ngoài giờ thì mình tính phí sao anh?"]
    giam_doc: Phí à? *(cười to)* Em cứ đùa. Công ty là gia đình mà. Người nhà ai tính phí.
    designer: Dạ, nhà em tính tiền điện theo bậc thang đó anh.
    giam_doc: *(ngừng cười)* …Ừ thôi, để anh nhờ người khác.
    ~ ds_toi(3)
    ~ qh("giam_doc", -3)
* {ds_co_huy_hieu_ban_1} [🔒 "Dạ anh, em làm luôn bản đầu tiên, mình khỏi sửa nha anh."]
    giam_doc: Ha ha! Em hiểu anh quá! Đúng, bản đầu bao giờ cũng là bản đẹp nhất.
    _Bạn nhìn Huy Hiệu Bản Đầu Tiên trên bàn, và mỉm cười._
    ~ qh("giam_doc", 5)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_truong_phong ===
# npc:truong_phong
truong_phong: {designer}, mình sync nhanh 5 phút nhé. Anh thấy poster tuần này… ổn. Nhưng chưa có insight.
* [💬 "Dạ insight là gì ạ, anh mô tả cụ thể giúp em được hông?"]
    truong_phong: Insight là… cái mà khi nhìn vào, mình thấy… insight.
    _Bạn gật đầu, ghi vào sổ: "insight = insight"._
    ~ ds_toi(2)
* [🤝 "Anh ơi, em đề xuất: mỗi poster chỉ sửa tối đa 3 lần. Để mình kịp tiến độ."]
    truong_phong: Hay đấy. Thế mình họp một buổi để bàn về việc giảm số lần sửa nhé.
    designer: Họp… để giảm sửa ạ?
    truong_phong: Đúng. Chiều thứ 4, 2 tiếng.
    ~ qh("truong_phong", 5)
    ~ nghi(-5)
* [😶 "Dạ."]
    truong_phong: Tốt. Anh thích thái độ này. Ngắn gọn.
    _Đó là cuộc trò chuyện ngắn nhất từng có với {truong_phong}. Bạn ghi nhớ công thức: "Dạ"._
    ~ qh("truong_phong", 3)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Bà {designer} ơi, làm giùm tui cái poster "Chúc mừng anh {giam_doc} đã… đi làm đúng giờ" nha. Sếp tới 9 giờ 28, sớm hơn mọi khi 2 phút.
* [🎨 "Chữ gì to nhất bà?"]
    thanh_ninh: Chữ "ANH". Rồi tới "{giam_doc}". Mấy chữ khác nhỏ cũng được, anh hông đọc đâu.
    ~ qh("thanh_ninh", 5)
    ~ ds_toi(-2)
* [🧂 "Hay làm luôn poster 'Chúc mừng sếp đã thở' cho tiện?"]
    thanh_ninh: *(nghiêm túc)* Ý hay. Thở có tâm. Bà làm đi, tui trả bằng một tin mật.
    ** [💬 "Tin gì?"]
        thanh_ninh: Sếp đọc group chung lúc 2 giờ sáng. Đừng nhắn bậy giờ đó. Vậy thôi.
        ~ qh("thanh_ninh", 5)
    ** [😶 "Thôi, tui hông cần tin."]
        thanh_ninh: Bà lạ ghê. Ai cũng cần tin.
* {qh_thanh_ninh >= 10} [🔒 "Nhi. Hôm 25 ở sảnh kia… bà ổn hông?"]
    thanh_ninh: *(nụ cười tắt, giọng thật)* …Tui cũng không biết. Còn bà?
    designer: Tui cũng không biết.
    _Hai người đứng im một lúc, như hai người lạc đường cùng nhau._
    ~ qh("thanh_ninh", 10)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_hong_hot ===
# npc:hong_hot
hong_hot: Bà ơi! Nghe gì chưa? Ét o ét! Tui có tin nóng!
* [💬 "Gì nữa bà?"]
    { RANDOM(1, 3):
    - 1: hong_hot: Anh {sieu_nhan_hong} gửi quà hồng cho anh {chua_te_deadline} nữa! Lần thứ 6! Gối ôm hồng!
    - 2: hong_hot: Anh {con_ong_chau_cha} đi ngang tiệm cầm đồ, nhìn vô 5 giây! 5 giây!
    - else: hong_hot: Chị {ke_toan} mua bút bi mới. Có 3 chữ ký duyệt. Kinh dị chưa!
    }
    ~ qh("hong_hot", 3)
* [🤝 "Bà ăn trưa chưa? Đi cơm tấm Cô Năm hông?"]
    hong_hot: Đi! Bà bao hả? Thôi tui bao, hôm qua tui được thưởng livestream!
    ~ an(40)
    ~ qh("hong_hot", 5)
* [🥬 "Ngân. Bà đừng ngó màn hình tui hoài nha. Tui làm ảnh nóng, ngại."]
    hong_hot: Ảnh nóng gì? *(mắt sáng lên)* Ảnh nóng là ảnh gì?!
    designer: Ảnh… món lẩu. Poster lẩu.
    hong_hot: Xì. Tưởng gì.
    ~ ds_lo(-3)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Ê {designer}. Em vẽ bìa album được hông? Của… một người bạn. Tên… Rồng.
* [💬 "Rồng hát thể loại gì anh?"]
    con_ong_chau_cha: *(nghĩ lâu)* Kiểu… buồn mà vui. Hồng mà không sến. Chill.
    designer: Anh mô tả còn rõ hơn sếp em đó.
    con_ong_chau_cha: Thiệt hả? *(cười, lần đầu cười thật)* Ok, để anh hỏi Rồng.
    ~ qh("con_ong_chau_cha", 8)
* [🎨 "Anh cho em nghe thử một bài, em vẽ theo bài."]
    con_ong_chau_cha: *(do dự, đưa một bên tai nghe)* Nghe thôi nha. Đừng kể ai.
    _Một giai điệu nhẹ, lời có câu "Hồng là thái độ". Giọng hát nghe… quen quen._
    ~ phat_hien(bai_hat_long)
    ~ qh("con_ong_chau_cha", 10)
    designer: Rồng hát hay. Nói Rồng đừng giấu nữa.
    con_ong_chau_cha: *(lấy lại tai nghe)* …Để anh nói Rồng.
* [😶 "Anh nhờ chú anh thuê designer ngoài đi."]
    con_ong_chau_cha: *(nhún vai)* Ừ. Ai cũng nói anh câu đó.
    ~ qh("con_ong_chau_cha", -5)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: {designer} ơi. Nhờ xíu thôi. Thumbnail tập 3. Chill, mai mới cần. *(mai là deadline)*
* [😇 "Ok. Nhưng ông bao bạc xỉu."]
    chua_te_deadline: Deal! Ông bao luôn hai ly. Kịp hết mà.
    ~ qh("chua_te_deadline", 5)
    ~ nghi(-10)
    ~ nhan(ca_phe)
* [🧂 "Nhờ tui thì dễ. Ông trả lời anh {sieu_nhan_hong} chưa?"]
    chua_te_deadline: *(đơ 3 giây)* Trả lời gì? Ảnh làm PR mà.
    designer: Ông tin là PR thiệt hả?
    chua_te_deadline: *(nhìn xuống cái gối ôm hồng trên ghế)* …Còn sớm mà. Chill.
    ~ qh("chua_te_deadline", 3)
* [🎨 "Ông tự làm đi. Nước tới chân mới nhảy, mà nhảy là phải đẹp mà."]
    chua_te_deadline: *(ôm ngực)* Dùng câu của tui để đánh tui. Hiểm.
    ~ ds_toi(3)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ chị {designer}! Em pha bạc xỉu ít đá cho chị nè. Em nhớ order cả phòng luôn ạ!
* [😇 "Anh {thuc_tap_sinh} ơi, cảm ơn anh. Mà anh đừng 'dạ chị' nữa, em ngại."]
    thuc_tap_sinh: Dạ… dạ em cố ạ. Dạ… à, ừ… cảm ơn… em? *(đỏ mặt)* Dạ thôi em quen rồi chị ạ.
    ~ qh("thuc_tap_sinh", 8)
    ~ uong(20)
* [🎨 "Anh có khiếu cắt giấy hông? Em cần người cắt standee."]
    thuc_tap_sinh: Dạ có ạ! Hồi trước em… em hay cắt… giấy ạ. Nhiều lắm ạ.
    _Anh cắt một đường thẳng tắp không cần thước. Ai mà cắt giấy nhiều tới vậy?_
    ~ qh("thuc_tap_sinh", 5)
* {biet(duy_tung_lam_ngan_hang)} [🔒 "Anh từng làm ngân hàng phải hông? Cách anh cầm thẻ quen tay lắm."]
    thuc_tap_sinh: *(nhìn quanh, nói nhỏ)* Dạ… chị đừng kể ai nha chị. Em sợ bị hỏi mượn tiền.
    designer: Em hông hỏi mượn. Em hỏi: anh có hạnh phúc hơn hông?
    thuc_tap_sinh: *(cười, mắt ướt)* Dạ có. Nhiều lắm ạ.
    ~ qh("thuc_tap_sinh", 15)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_ke_toan ===
# npc:ke_toan
ke_toan: {designer}. Đề nghị in 500 vé mời giấy mỹ thuật. Giấy thường không được hả em?
* [🎨 "Dạ giấy thường in hồng ra như giấy vệ sinh màu đó chị."]
    ke_toan: *(nhìn lâu)* …Ừ. Chị duyệt. Nhưng hóa đơn đỏ, có mộc, ghi đúng tên công ty.
    ~ qh("ke_toan", 5)
* [😇 "Dạ giấy thường cũng được chị. Em canh màu."]
    ke_toan: Tốt. Em là người đầu tiên tháng này nói "cũng được" với chị.
    ~ qh("ke_toan", 10)
    ~ ds_toi(-3)
* [💬 "Chị ơi, chị ăn cơm chưa? Em có dư hộp cơm sườn."]
    { co(com_tam):
        ~ mat(com_tam)
        ke_toan: *(ngạc nhiên)* Cho chị hả? …Chị cảm ơn. *(cất vào ngăn kéo, cạnh gói bánh quy)*
        ~ qh("ke_toan", 12)
    - else:
        _Bạn mở túi. Không có hộp cơm nào. {ke_toan} nhìn bạn, gật nhẹ: "Ý tốt là được rồi em."_
        ~ qh("ke_toan", 3)
    }
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_hr ===
# npc:hr
hr: {designer} ơi. Em rảnh không, lên phòng anh uống trà xíu.
_Mồ hôi lạnh chảy dọc sống lưng. Laptop thứ hai đang trong balo._
* [😇 "Dạ em lên liền."]
    hr: *(rót trà hoa cúc)* Anh chỉ muốn lắng nghe em thôi. Tháng này em bị sửa bao nhiêu lần?
    designer: Dạ… {ds_so_lan_bi_sua} lần ạ.
    hr: *(ghi chép)* Mình cùng nhìn lại hành trình nha. Anh sẽ đề xuất "giới hạn sửa". Em thấy sao?
    ~ qh("hr", 10)
    ~ cang_thang(-5)
* [🎧 Giả vờ đeo tai nghe, không nghe.]
    hr: *(cười rộng hơn)* Không sao. Anh đợi. Anh giỏi đợi lắm.
    ~ cang_thang(10)
    ~ qh("hr", -5)
* [💬 "Dạ anh ơi, uống trà có phải là… bị đuổi hông anh?"]
    hr: Ha ha. Không phải lúc nào cũng vậy đâu em. Hôm nay chỉ là trà thôi.
    _Chữ "hôm nay" làm bạn mất ngủ đêm đó._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_it ===
# npc:it
it: Máy chậm?
* [😇 "Dạ, mở Photoshop là kêu như máy cày anh ơi."]
    it: Restart chưa?
    designer: Dạ rồi.
    it: *(gõ 4 phím)* Xong. 47 tab trình duyệt. Lỗi người dùng.
    ~ qh("it", 5)
* [🍜 Đưa {it} một ly mì ly.]
    { co(mi_ly):
        ~ mat(mi_ly)
        it: *(nhận, gật đầu)* …Cảm ơn.
        ~ qh("it", 10)
    - else:
        _Bạn không có mì ly. {it} nhìn tay bạn trống trơn, rồi quay về phòng server._
    }
* {ds_do_lo >= 40} [🔒 "Anh {it}… log của em… có gì lạ hông anh?"]
    it: *(nhìn bạn rất lâu)* Có. Wifi công ty, thư mục tên lạ, giờ lạ.
    it: Tôi tìm admin Confession, không tìm designer. Đừng làm ở công ty nữa.
    ~ ds_lo(-10)
    ~ qh("it", 5)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: Em designer! Em biết anh là ai không? Poster đám cưới tuần sau, anh cần mặt anh to hơn mặt cô dâu.
* [🎨 "Dạ anh ơi, đám cưới thì cô dâu là chính đó anh."]
    idol_het_thoi: Hồi anh còn nổi, cô dâu xin chụp với anh đó em.
    designer: Dạ, giờ anh vẫn nổi trong lòng em. Nhưng mặt anh bằng cô dâu thôi nha.
    idol_het_thoi: *(cười)* Em nói chuyện như fan cũ của anh. Thôi được.
    ~ qh("idol_het_thoi", 5)
* [😇 Làm theo ý anh: mặt anh to, mặt cô dâu nhỏ.]
    idol_het_thoi: Đúng chất! Fan anh đông lắm em, họ cần thấy mặt anh.
    ~ qh("idol_het_thoi", 8)
    ~ ds_toi(-5)
* {qh_idol_het_thoi >= 20} [🔒 "Hôm mất điện em nghe anh hát 'Công Viên'. Hay hơn bản thu âm."]
    idol_het_thoi: *(gỡ kính đen, im lặng)* …Em nghe hả. *(nhỏ giọng)* Lâu lắm rồi mới có người nói vậy mà không phải fan 45 tuổi.
    ~ qh("idol_het_thoi", 12)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút. *(nói vào điện thoại 1)* Ừ ừ, để anh lo. *(nói vào điện thoại 2)* Đừng đăng gì hết!
quan_ly_idol: Rồi. {designer}, em làm poster lịch diễn tháng 11 cho {idol_het_thoi} giùm anh được không? Anh trả tiền túi.
* [😇 "Dạ em làm, khỏi trả anh."]
    quan_ly_idol: Không được. Làm thì phải có tiền. *(dúi 200 nghìn)* Đừng nói với {idol_het_thoi} là anh trả.
    ~ tien_cong(200000)
    ~ qh("quan_ly_idol", 8)
* [💬 "Anh lo cho anh {idol_het_thoi} nhiều ghê."]
    quan_ly_idol: *(khựng lại, nhìn sang chỗ khác)* Quản lý thì phải lo. Việc của anh mà.
    _Màn hình khóa điện thoại của {quan_ly_idol} sáng lên một giây: ảnh {idol_het_thoi} cười, năm 2015._
    ~ qh("quan_ly_idol", 3)
* {ds_thu_nhan_voi_thai} [🔒 "Anh {quan_ly_idol}, anh có đi LL hông?"]
    quan_ly_idol: *(thở dài)* 36 triệu, em à. Nhưng nếu anh đi… ai lo cho {idol_het_thoi}.
    quan_ly_idol: Em đã nói thật với anh hôm đó. Anh cũng nói thật: anh ở lại.
    ~ qh("quan_ly_idol", 10)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_bien_kich ===
# npc:bien_kich
bien_kich: {designer}. Poster này thiếu nỗi đau. Bà nhìn đi, màu hồng gì mà vui vậy.
* [🎨 "Hồng vui là đúng brief. Nỗi đau để kịch bản lo."]
    bien_kich: Kịch bản đang lo. Lo lắm. *(nhìn xa xăm)*
    ~ ds_toi(3)
* [🤝 "Vậy bà kể tui nghe nỗi đau đó, tui thêm một vệt tím vào."]
    bien_kich: *(ngạc nhiên)* Bà… hỏi ý tui hả? Năm năm rồi bà mới hỏi.
    bien_kich: Nỗi đau là… người ta đứng trên sân khấu, mà không ai biết tên thật.
    _Bạn thêm một vệt tím mờ dưới chân Siêu Nhân Hồng. Poster bỗng có chiều sâu. Bạn ghét phải công nhận._
    ~ qh("bien_kich", 10)
    ~ ds_toi(3)
* [🐍 "Bà mượn nỗi đau của ai nữa vậy?"]
    bien_kich: Đây không phải đạo. Đây là cảm hứng.
    designer: Ờ. Tui cũng "cảm hứng" lại cái câu đó lâu rồi.
    ~ qh("bien_kich", -8)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_editor ===
# npc:editor
editor: *(ngáp)* …Thumbnail… tập 4… bà làm chưa?
* [😇 "Xong rồi nè. Có chừa chỗ cho ông giấu con cú."]
    editor: *(mắt mở to lần đầu trong ngày)* …Bà biết con cú hả?
    designer: Khung 812. Tui có mắt designer mà.
    editor: *(cười nhẹ)* Đừng kể ai nha.
    ~ qh("editor", 10)
* [💬 "Ông ngủ chưa? Mắt ông như hai cái nút record."]
    editor: Render xong là ngủ. *(Render không bao giờ xong.)*
    ~ qh("editor", 3)
* {qh_editor >= 20} [🔒 "Lĩnh. Thư mục tên 'Thái' trong ổ của ông… là gì vậy?"]
    editor: *(đứng im rất lâu)* …Video dựng tiện tay thôi.
    designer: Tiện tay mà 40 cái.
    editor: *(nhỏ giọng)* …Đừng kể ai. Thật đó.
    ~ phat_hien(linh_thich_thai)
    ~ qh("editor", 5)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_sales ===
# npc:sales
sales: Chị Quỳnh! Tin chị đi, hôm nay em có deal! Thật! À… gần thật!
* [🗂️ "Cần hồ sơ gì nữa đây em?"]
    sales: Một cái slide "đối tác chiến lược", có biểu đồ đi lên như tên lửa. Trục tung bắt đầu từ… con số em muốn.
    designer: Trục tung không bắt đầu từ 0 là lừa đảo đồ họa đó em.
    sales: Là "nghệ thuật trình bày" chị ơi.
    ~ qh("sales", 5)
* [🤝 "Trưa nay ăn gì? Chị bao."]
    sales: Chị bao hả?! *(mắt rưng rưng)* Tủ lạnh em trống 3 ngày rồi chị. Cơm tấm Cô Năm nha!
    ~ an(40)
    ~ tien_cong(-70000)
    ~ qh("sales", 8)
* [😇 "Huyền. Em có bao giờ thử bán hàng bằng sự thật chưa?"]
    sales: *(im lặng)* …Có một lần. Hồi năm nhất. Khách mua, mà em không tin là nhờ sự thật.
    designer: Thử lại đi. Chị vẽ hồ sơ thật cho em, miễn phí.
    ~ qh("sales", 10)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_chi_dai ===
# npc:chi_dai
chi_dai: Ăn cơm chưa {designer}? Mặt em xanh như màu của bên kia đường đó.
* [😇 "Dạ chưa chị."]
    chi_dai: Ngồi xuống. *(mở hộp cơm, chia nửa)* Ăn. Ăn xong rồi sửa gì thì sửa.
    ~ an(40)
    ~ qh("chi_dai", 8)
* [💬 "Chị ơi, sao mấy người ai cũng sợ chị vậy?"]
    chi_dai: Tại họ có tật. Em không có tật thì em không sợ.
    _Bạn nghĩ tới laptop thứ hai. Bạn thấy hơi sợ._
    ~ qh("chi_dai", 3)
* [🤝 "Chị ơi, ai bắt sửa em 40 lần thì chị có chỉ mặt được hông?"]
    chi_dai: *(cười lớn)* Chỉ được. Nhưng người đó ký lương cho chị, nên chị chỉ… nhẹ thôi.
    ~ qh("chi_dai", 5)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {designer}! Em vẽ giùm anh cái logo cho đồng coin mới. Tên "Đáy Coin". Vì đáy rồi, chỉ có lên.
* [🎨 "Dạ logo: một cái giếng, có mũi tên đi lên. Được hông anh?"]
    dan_dau_tu: Đỉnh! Cái giếng! Đáy giếng! Ẩn dụ quá! Anh trả em bằng… 1.000 Đáy Coin.
    designer: Dạ… quy ra tiền là bao nhiêu anh?
    dan_dau_tu: Hiện tại là 0. Nhưng lần này là lên thật.
    ~ qh("dan_dau_tu", 5)
* [💬 "Anh ơi, anh có nợ em không? Em quên mất rồi."]
    dan_dau_tu: Không! Em là người duy nhất anh chưa nợ! Anh giữ em làm… vùng an toàn.
    ~ qh("dan_dau_tu", 3)
* [😶 "Dạ em bận."]
    dan_dau_tu: Ok. Cắt lỗ là thua, nhưng anh hiểu.
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho khụ khụ)* {designer} ơi… tui hơi sốt… mà tui cần nhờ bà một việc.
thanh_xin_nghi: Bà làm giùm tui một tấm ảnh bìa… kim tuyến… cho một người bạn đi thi hát.
* [🎨 "Bạn nào? Bạn tên Sơn hả?"]
    thanh_xin_nghi: *(hết ho ngay lập tức)* …Bà đừng nói ai nha. Bà ngoại tui… à không, tui… đang vô bán kết.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 10)
* [😇 "Ok. Mà ông đi khám đi, ho nghe giả lắm."]
    thanh_xin_nghi: Tui khám 8 lần rồi. Bác sĩ nói "lại là em à".
    ~ qh("thanh_xin_nghi", 5)
* [🧂 "Tui làm cho ông cái giấy nghỉ ốm in hoa văn luôn nha."]
    thanh_xin_nghi: *(mắt sáng rỡ)* Được hả?!
    designer: Đùa thôi. Anh {hr} thấy là ông lên phòng uống trà tới Tết.
    ~ qh("thanh_xin_nghi", 2)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Cháu {designer}. Về muộn thế. Ngồi uống cốc trà đá đã.
* [😇 "Dạ con cảm ơn bác." Ngồi xuống ghế bố.]
    bac_bao_ve: Ừ. *(rót trà)* Dạo này cháu về muộn nhiều. Mắt thâm.
    designer: Dạ, con làm thêm.
    bac_bao_ve: Làm thêm thì được. Làm cho ai thì cháu tự biết. Bác không thấy gì đâu.
    ~ uong(30)
    ~ qh("bac_bao_ve", 8)
* [🎨 "Bác ơi, con vẽ bác một tấm chân dung nha."]
    bac_bao_ve: Vẽ bác làm gì. Già rồi. *(nhưng vẫn ngồi thẳng lưng)*
    _Bạn vẽ bác {bac_bao_ve} với cốc trà đá và cái radio. Bác nhìn lâu, rồi gấp lại cất vào túi áo._
    ~ qh("bac_bao_ve", 10)
    ~ ds_toi(3)
* [💬 "Bác ở đây từ hồi công ty mới mở hả bác?"]
    bac_bao_ve: Từ ngày đầu. Mười sáu năm. Cái chữ G kia, bác thấy người ta treo lên lần đầu đấy.
    _Bác không nói thêm. Bác chỉ nhìn cái logo rất lâu._
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: Chị {designer}! Biến hình! *(tạo dáng)* Chị thấy hôm nay em hồng chưa?
* [🎨 "Hồng vừa đủ. Đủ để thấy mình được thương."]
    sieu_nhan_hong: *(ngừng tạo dáng)* Câu đó… là câu em nói hôm họp mà. Chị nhớ hả?
    designer: Em nhớ. Là câu trả lời hay nhất cho câu hỏi "một chút là bao nhiêu".
    ~ qh("sieu_nhan_hong", 10)
* [🧂 "Anh mà hồng nữa là {cho} cắn luôn cái mũ đó."]
    sieu_nhan_hong: Ha ha! Tuất ghét em lắm. Em chỉ muốn làm bạn với nó thôi mà.
    designer: Anh thôi giả tiếng sủa thì nó mới tin anh.
    sieu_nhan_hong: *(suy nghĩ)* …Thiệt hả? Em thử!
    ~ qh("sieu_nhan_hong", 5)
    ~ qh("cho", 3)
* {ds_lot_mu} [🔒 "Lớp lót mũ êm hông anh?"]
    sieu_nhan_hong: *(nói nhỏ, không tạo dáng)* Êm lắm chị. Lần đầu đội mũ mà không thấy ngộp.
    sieu_nhan_hong: Chị là người đầu tiên lo cho phần bên trong.
    ~ qh("sieu_nhan_hong", 12)
- -> END

// ------------------------------------------------------------
=== designer_tudo_npc_cho ===
# npc:cho
cho: Gâu? *(đánh hơi giày bạn)*
* [🦴 Đưa {cho} cây xúc xích.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        cho: Gâu gâu! *(vẫy đuôi như chong chóng)*
        ~ qh("cho", 10)
    - else:
        _Bạn giả vờ móc túi. Không có gì. {cho} nhìn bạn như nhìn một kẻ lừa đảo._
        ~ qh("cho", -2)
    }
* [📸 Chụp {cho} làm thêm sticker.]
    cho: Grừ… *(quay lưng, nằm xuống, không cho chụp mặt)*
    _Bạn có một tấm ảnh mông {cho}. Bạn đặt tên là "Tuất Không Vui: Bản Từ Chối Hợp Tác"._
    ~ qh("cho", -3)
    ~ follow(1000)
* [🤝 Ngồi xuống, xoa đầu {cho}, không làm gì thêm.]
    cho: *(nằm xuống cạnh chân bạn, thở dài một hơi)*
    _Có lúc, thứ bạn cần nhất chỉ là một sinh vật không biết "sửa nhẹ" là gì._
    ~ qh("cho", 5)
    ~ cang_thang(-10)
- -> END
