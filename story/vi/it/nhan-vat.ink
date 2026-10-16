// ============================================================
// IT: BẢO · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== it_tudo_ran_doc ===
# npc:ran_doc
_{ran_doc}, nhân viên mới, ghé phòng server với một ly trà sữa. Không ai mang trà sữa tới phòng server mà không cần gì._
ran_doc: Anh {it} ơi, em mới vô nên muốn làm quen. Nghe nói anh biết hết mọi chuyện trong công ty hả?
+ [😶 "Biết mạng. Không biết chuyện."]
    ran_doc: Ha ha, anh khiêm tốn quá. Mà… anh có xem được ai hay đăng nhập lúc khuya không? Em tò mò thôi, không có ý gì đâu.
    ++ [😇 "Không. Log là của công ty."]
        ran_doc: Dạ… em hiểu. Tui nói vậy thôi chứ không có ý gì đâu.
        ~ it_lt(3)
        ~ qh("ran_doc", -3)
    ++ [🐍 "Muốn biết gì? Đổi bằng gì?"]
        ran_doc: *(mắt sáng lên)* Em có tin mật nè. Nghe nói {sieu_nhan_hong} hồi nhỏ ở xóm Cây Me…
        _Bạn nhận ra mình vừa mở một cánh cửa không nên mở._
        ~ it_lt(-5)
        ~ qh("ran_doc", 10)
+ [💬 "Trà sữa này để làm gì?"]
    ran_doc: *(cười)* Anh thẳng ghê. Em chỉ muốn có một người bạn ở tầng 2 thôi mà.
    ~ an(5)
    ~ uong(30)
    ~ qh("ran_doc", 5)
- -> END

// ------------------------------------------------------------
=== it_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {it}! Vào đây anh hỏi. Cái app sân golf trên điện thoại anh nó cứ đòi cập nhật. Em làm cho nó thôi đòi nhé.
+ [🔄 "Cập nhật đi anh. Đừng tắt."]
    giam_doc: Cập nhật mất 5 phút cơ à? Thôi được, anh nghe em. Lần này thôi đấy.
    ~ qh("giam_doc", 3)
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
+ [🔕 Tắt thông báo cập nhật.]
    giam_doc: Ơ, hết đòi rồi. Em giỏi. Giỏi hơn cái thằng cài app.
    ~ qh("giam_doc", 5)
- giam_doc: Còn gì nữa không? Anh đang bận, nhưng anh lắng nghe nhân viên.
+ {it_tiet_kiem < 12000000 and not it_mua_router_rieng} [💬 "Tờ router. Còn thiếu 2 chữ ký."]
    giam_doc: Lại router à. Em kiên trì nhỉ. Được, anh nhắc {ke_toan}. Anh không ép, tùy {ke_toan}.
    ~ it_truy_cap(2)
+ {it_biet_clone} [🔒 "Hoa hướng dương dạo này nở đẹp ha anh."]
    giam_doc: *(ho sặc)* Em… em nói gì anh không hiểu. Thôi em ra đi. Ra đi.
    ~ qh("giam_doc", -5)
    ~ it_truy_cap(5)
+ [😶 "Hết rồi anh."]
    giam_doc: Tốt. Nhân viên ít việc là sếp vui.
- -> END

// ------------------------------------------------------------
=== it_tudo_truong_phong ===
# npc:truong_phong
truong_phong: Cậu {it}, mình sync nhanh 5 phút nhé. Phòng họp "Sáng Tạo" cần một cái màn hình to hơn. Họp mà màn hình nhỏ thì ý tưởng cũng nhỏ.
+ [💬 "Họp ít lại thì khỏi cần màn hình."]
    truong_phong: Ơ… cái này… mình take note lại. Họp riêng để bàn về việc họp ít lại nhé.
    ~ qh("truong_phong", -3)
    ~ cang_thang(-5)
+ [🤝 "Em chỉ anh nối laptop vô TV."]
    _Bạn chỉ {truong_phong} cách cắm dây, cách bấm phím chuyển màn hình. {truong_phong} ghi vào sổ, kẻ bảng, đánh số._
    truong_phong: Hay thật. Thế này mình tự làm được, khỏi đợi cậu. Cảm ơn cậu nhé.
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
    ~ it_cam_on()
    ~ qh("truong_phong", 5)
- truong_phong: À, mà cậu có biết… làm sao để mở cái phần mềm dựng phim không? Hỏi cho biết thôi.
+ [😶 "Hỏi {editor}."]
    truong_phong: Ừ… ừ. Thôi, không cần. Mình chỉ hỏi cho biết.
+ [🐍 "Anh chưa mở bao giờ hả?"]
    truong_phong: Mở rồi chứ! Mở… nhiều lần. Thôi mình đi họp đây.
    ~ qh("truong_phong", -5)
- -> END

// ------------------------------------------------------------
=== it_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Anh {it} ơi, mật khẩu email của anh {giam_doc} bị khóa rồi. Anh mở lại giùm em nha. Anh {giam_doc} cần gấp lắm.
_Bạn biết: {thanh_ninh} là người giữ mật khẩu email của {giam_doc}. Và đã giữ rất lâu._
+ [😇 "Anh {giam_doc} gọi anh thì anh mở."]
    thanh_ninh: Dạ… dạ thôi để em nhờ ảnh gọi. Anh làm việc chuẩn quá anh ơi.
    ~ it_lt(3)
    ~ qh("thanh_ninh", -3)
+ [🔑 Mở lại luôn.]
    thanh_ninh: Ôi anh đỉnh quá! Anh nói chuẩn… à anh chưa nói gì. Mà vẫn chuẩn!
    ~ qh("thanh_ninh", 10)
    ~ it_truy_cap(3)
- _Trong lúc mở khóa, bạn thấy hộp thư đi của máy {thanh_ninh} có một email gửi tới tên miền màu xanh lá chuối._
+ [😶 Coi như không thấy.]
    ~ it_lt(2)
+ [💬 "Mà… đừng gửi mail công ty qua bên kia."]
    thanh_ninh: *(tái mặt)* Dạ? Dạ em… em gửi hồ sơ cho… bạn em thôi ạ.
    _Từ hôm đó {thanh_ninh} chào bạn to hơn hẳn mỗi sáng._
    ~ qh("thanh_ninh", -5)
+ [💬 "Tờ đề xuất router hồi năm ngoái, em còn giữ không?"]
    thanh_ninh: Dạ… tờ nào ạ? À! Tờ đó… em… em kẹp vô sổ của anh {giam_doc}. Rồi sổ đó… mất ạ.
    it: In tờ mới rồi. Em xin chữ ký giùm anh.
    thanh_ninh: Dạ em xin liền! Lần này em giữ như giữ vàng!
    ~ qh("thanh_ninh", 5)
- -> END

// ------------------------------------------------------------
=== it_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Anh {it}! Nghe gì chưa? À mà anh thì nghe gì cũng không kể. Thôi để tui kể. Nghe nói phòng kế toán mới mua cái bình nước có… hóa đơn đỏ!
+ [😶 "Ừ."]
    hong_hot: "Ừ" là sao? Anh phải "Hả? Thiệt hả?" chứ! Trời ơi nói chuyện với anh như nói chuyện với router.
    ~ qh("hong_hot", 2)
+ [💬 "Hả? Thiệt hả?"]
    hong_hot: THIỆT! Đó, phải vậy chứ! Anh tiến bộ rồi nha!
    ~ qh("hong_hot", 8)
    ~ cang_thang(-5)
- hong_hot: *(nói nhỏ)* Mà anh… vụ cái laptop đó… anh vẫn giữ giùm tui hả?
+ {it_giu_bi_mat_ngan or not it_nop_ten_ngan} [🤐 "Laptop nào? Không biết."]
    hong_hot: *(cười tít)* Két sắt biết đi! Tui thương anh nhất công ty!
    ~ qh("hong_hot", 10)
    ~ it_giu_bi_mat_ngan = true
+ {it_nop_ten_ngan} [😶 Nhìn xuống bàn phím.]
    hong_hot: *(im lặng)* Ờ. Thôi. Tui hiểu rồi.
    ~ qh("hong_hot", -5)
+ [💬 "Đăng khuya thì xài 4G."]
    hong_hot: Dạ thưa thầy! Em nhớ rồi ạ!
    ~ qh("hong_hot", 5)
- -> END

// ------------------------------------------------------------
=== it_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Anh {it}, chill hông? Em hỏi xíu: soundcard loại nào thu giọng đẹp nhất vậy anh? Không phải cho em nha, cho… một người bạn.
_Bạn nhớ log tải lên của máy {con_ong_chau_cha}: một loạt file "Rong_demo_37", "Rong_demo_38"… tới 41._
+ [💬 "Bạn tên Rồng hả?"]
    con_ong_chau_cha: *(đơ người)* Sao… sao anh biết? Anh đừng nói với chú em nha. Em năn nỉ.
    ~ phat_hien(bai_hat_long)
    ++ [🤐 "Không nói ai."]
        con_ong_chau_cha: Anh là người thứ nhất biết đó. Cảm ơn anh. Thiệt.
        ~ qh("con_ong_chau_cha", 20)
        ~ it_cam_on()
    ++ [🤝 "Muốn thu thì phòng studio tối nay trống."]
        con_ong_chau_cha: Thiệt hả anh? Em… em tới liền! Em mang bánh!
        ~ qh("con_ong_chau_cha", 25)
        ~ it_cam_on()
+ [🔌 Chỉ loại soundcard tốt, giá vừa phải.]
    con_ong_chau_cha: Ủa sao không mua loại mắc nhất luôn? À… ừ. Dạo này em cũng phải tiết kiệm.
    ~ qh("con_ong_chau_cha", 8)
- -> END

// ------------------------------------------------------------
=== it_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: Anh {it} ơi, sao Tóp-tóp ở bàn tui lag vậy? Anh bóp băng thông tui hả?
+ [🐢 "Ừ. Làm việc đi."]
    chua_te_deadline: Ok mom. Mà deadline còn 3 ngày lận, sớm mà anh. Chill.
    ~ qh("chua_te_deadline", -3)
    ~ uy_tin = uy_tin + 2
+ [😶 "Router cũ."]
    chua_te_deadline: Hèn chi. Thôi để tui qua quán bida coi, wifi dưới đó mạnh hơn.
- chua_te_deadline: À mà… anh có thấy dạo này ai gửi đồ hồng tới bàn tui hông? Gối hồng, ly hồng, bút hồng. Chắc chiêu PR hả anh?
+ [💬 "Không phải PR đâu."]
    chua_te_deadline: *(cười trừ)* Anh giỡn hoài. Ai mà… thích tui thiệt chứ.
    _Lần đầu tiên bạn thấy {chua_te_deadline} không chill lắm._
    ~ qh("chua_te_deadline", 5)
+ [😶 Nhún vai.]
    chua_te_deadline: Thấy chưa, ai cũng nghĩ là PR hết.
- -> END

// ------------------------------------------------------------
=== it_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh {it}! Hôm nay anh dạy em thêm bài gì không ạ? Em học xong "rút ra, đếm 10, cắm vô" rồi ạ!
+ [🤝 "Bài ba: xóa bộ nhớ đệm trình duyệt."]
    thuc_tap_sinh: Dạ! *(ghi vào sổ, gạch chân 3 lần)* Em đi dạy lại cả phòng sản xuất ạ!
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
    ~ it_cam_on()
    ~ qh("thuc_tap_sinh", 10)
+ [🍜 "Bài hôm nay: pha mì ly đúng 3 phút."]
    thuc_tap_sinh: Dạ cái này em giỏi ạ! Em ăn mì gói ở pantry mỗi ngày ạ!
    _Hai người ngồi pha mì, canh đồng hồ như canh tên lửa. Mì ngon._
    ~ an(25)
    ~ qh("thuc_tap_sinh", 8)
- thuc_tap_sinh: Dạ anh, em hỏi… anh làm ở đây 10 năm, anh có bao giờ muốn đổi nghề không ạ?
+ [😇 "Có. Lười viết CV."]
    thuc_tap_sinh: *(cười)* Dạ em thì viết CV giỏi lắm ạ. Mà em lại muốn ở đây.
    ~ qh("thuc_tap_sinh", 5)
+ [💬 "Còn em? Đổi từ nghề gì?"]
    thuc_tap_sinh: Dạ… em làm… ờ… việc liên quan tới… con số ạ. Thôi em đi photo đây ạ!
    ~ qh("thuc_tap_sinh", 2)
- -> END

// ------------------------------------------------------------
=== it_tudo_ke_toan ===
# npc:ke_toan
ke_toan: Ông {it}. Đề xuất router 12 triệu. Ông biết tui cần gì rồi đó.
+ [📄 "Ba chữ ký. Tui có hai."]
    ke_toan: Hai thì chưa phải ba. Mà chữ ký thứ hai… *(nheo mắt)* …là của {thanh_ninh} ký thay sếp hả?
    it: Của sếp. Ký hai lần.
    ke_toan: Một người ký hai lần thì vẫn là một. Đi xin thêm.
    ~ cang_thang(5)
+ [💬 "Router chết thì livestream chết. Livestream chết thì… trang 47."]
    ke_toan: *(khựng lại)* …Ông nói nhỏ thôi. Để tui coi lại. Tui không hứa. Nhưng tui coi lại.
    ~ qh("ke_toan", 5)
    { biet(trang_47):
        ~ qh("ke_toan", 5)
    }
- ke_toan: Mà nè, máy in phòng tui lại in mờ. Lần này tui không bật tiết kiệm mực. Thề.
+ [🖨️ Lên kiểm tra.]
    _Chế độ tiết kiệm mực đang bật. Bạn tắt. {ke_toan} nhìn đi chỗ khác._
    ke_toan: …Chắc ai bật đó. Cảm ơn ông.
    ~ it_cam_on()
    ~ qh("ke_toan", 5)
+ [🤝 Chỉ cho {ke_toan} cách tự tắt chế độ đó.]
    ke_toan: Bấm 3 cái là xong hả? Vậy mà mấy năm nay tui gọi ông. Ghi sổ.
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
    ~ qh("ke_toan", 5)
- -> END

// ------------------------------------------------------------
=== it_tudo_hr ===
# npc:hr
hr: Anh {it} rảnh không, lên phòng em uống trà xíu. Em chỉ muốn lắng nghe anh thôi.
_Bạn biết: được {hr} mời uống trà là sắp có chuyện._
hr: Tháng này em thấy có máy tải 40GB phim trong giờ làm. Anh biết máy nào hông anh?
+ [😶 "Máy studio. Phim MV."]
    hr: Ồ. Vậy là phim công việc. Em ghi nhận.
    _Thật ra có 38GB là phim bộ của {chua_te_deadline}. Bạn để chuyện đó cho router lo._
    ~ qh("chua_te_deadline", 5)
+ [📜 "Máy {chua_te_deadline}."]
    hr: Em cảm ơn anh. Em sẽ mời {chua_te_deadline} lên uống trà. Trà khác loại.
    ~ qh("hr", 5)
    ~ qh("chua_te_deadline", -10)
    ~ it_lt(-3)
- hr: À, anh {it}. Máy em có cái email nháp để lâu rồi, nó có tự mất không anh?
+ [💬 "Không. Nháp thì nằm đó hoài."]
    hr: *(nhìn ly trà)* Vậy hả. Nằm hoài… Ừ. Cảm ơn anh.
    ~ qh("hr", 5)
+ [🐍 "Gửi đi thì hết lo mất."]
    hr: *(cười, nhưng lần này cười thật)* Anh nói chuyện như HR vậy đó. Để em suy nghĩ.
    ~ qh("hr", 8)
- -> END

// ------------------------------------------------------------
=== it_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: Em! Cái micro không dây hôm qua nó rè. Em biết anh là ai không? Anh mà hát với micro rè là fan anh buồn đó.
+ [🎤 "Đưa micro. Thay pin."]
    _Bạn mở nắp micro: pin của năm 2019. Bạn thay pin mới. {idol_het_thoi} thử: "A lô, Công Viên". Trong veo._
    idol_het_thoi: Trời. Nghe như hồi anh còn nổi.
    ~ qh("idol_het_thoi", 8)
    ~ it_cam_on()
+ [💬 "Fan anh có bao nhiêu người thật?"]
    idol_het_thoi: *(kính đen trượt xuống mũi)* Em… em hỏi gì kỳ vậy. Đông lắm. Đông… vừa đủ.
    ~ qh("idol_het_thoi", -5)
- idol_het_thoi: Mà nè… hồi trước có một thằng nhỏ kéo dây loa cho anh ở hội chợ, bị điện giật. Em biết nó hông?
+ [😇 "Em đó."]
    idol_het_thoi: HẢ? Trời đất ơi! Thôi chết, anh xin lỗi! Mười năm rồi anh mới xin lỗi!
    ~ qh("idol_het_thoi", 15)
+ [😶 "Không biết."]
    idol_het_thoi: Ừ. Chắc nó nghỉ rồi. Ai cũng nghỉ hết.
- -> END

// ------------------------------------------------------------
=== it_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: {it}, cho anh mượn sạc. Khoan, anh nghe máy chút… Ừ… Ừ… Không đăng gì hết! … Rồi, sạc.
+ [🔌 Đưa sạc.]
    quan_ly_idol: Cảm ơn em. Không có em chắc anh sống bằng 1% pin.
    ~ qh("quan_ly_idol", 5)
    ~ it_cam_on()
+ [🤝 "Anh xài cục sạc này, khỏi trả."]
    quan_ly_idol: Thật hả? Ừ… em tốt ghê.
    ~ tien_cong(-120000)
    ~ qh("quan_ly_idol", 12)
- _Lúc cắm sạc, màn hình điện thoại thứ hai của {quan_ly_idol} sáng lên: đang đăng nhập admin fan club "Hội Cá Viên Chiên", tên "ChuoiChien89"._
+ [😶 Quay mặt đi.]
    ~ it_lt(3)
+ [💬 "Hội Cá Viên Chiên đông không anh?"]
    quan_ly_idol: *(úp điện thoại xuống)* Hội… gì? Anh không biết. Anh đi đây. Đừng ai đăng gì hết!
    ~ phat_hien(thai_thuong_phat)
    ~ qh("quan_ly_idol", -3)
- -> END

// ------------------------------------------------------------
=== it_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Anh {it}… em lỡ xóa một file. Một file rất quan trọng. Như một mảnh linh hồn bị xé ra khỏi thân xác.
+ [💾 "Tên file?"]
    bien_kich: Ờ… "Công Ty Là Gia Đình, chương 12". Là… kịch bản. Kịch bản phim.
    _Bạn khôi phục được. Trong file có tên thật của cả công ty, kể cả tên bạn: "IT, người đàn ông sống với cái quạt."_
    ++ [🤐 Đưa file, không nói gì.]
        bien_kich: Anh… anh đọc chưa?
        it: Không.
        bien_kich: *(thở phào)* Anh là nhân vật dễ thương nhất trong… kịch bản đó.
        ~ qh("bien_kich", 15)
        ~ it_lt(3)
    ++ [💬 "Đổi tên thật đi."]
        bien_kich: *(đỏ mặt)* Đây không phải đạo, đây là… cảm hứng từ người thật. Ừ. Em đổi.
        ~ qh("bien_kich", 5)
+ [🔄 "Thùng rác máy tính chưa?"]
    bien_kich: Thùng rác? Máy tính có thùng rác hả anh? … À đây rồi. Ôi trời. Cảm ơn anh!
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
    ~ it_cam_on()
    ~ qh("bien_kich", 5)
- -> END

// ------------------------------------------------------------
=== it_tudo_editor ===
# npc:editor
editor: *(ngáp)* Anh {it}… 3 giờ sáng nay mạng chậm quá. Em upload… một video… của em. Không phải của công ty.
_Bạn biết video đó lên kênh nào. "Cú Đêm Cắt Ghép", 980.000 người đăng ký. Upload mỗi đêm lúc 3 giờ._
+ [🐢 "Từ 2 tới 4 giờ sáng, băng thông là của em."]
    editor: Thật hả anh? Anh… anh là người tốt nhất cái công ty này.
    ~ qh("editor", 15)
    ~ it_cam_on()
+ [💬 "Kênh có con cú, anh biết."]
    editor: *(tỉnh ngủ hẳn)* Anh… anh đừng nói ai nha anh. Nhất là… anh {truong_phong}.
    ~ phat_hien(kenh_cu_dem)
    ~ qh("editor", 5)
- editor: Anh có muốn coi… video em dựng cho… một người không? Chưa gửi. Chắc không bao giờ gửi.
+ [😇 "Coi. Rồi quên."]
    _Video 2 phút. Toàn cảnh {quan_ly_idol}. Bạn coi xong, gật đầu, rồi coi như chưa từng coi._
    editor: Cảm ơn anh. Có người coi rồi, em thấy nhẹ.
    ~ phat_hien(linh_thich_thai)
    ~ qh("editor", 10)
+ [😶 "Không. Chuyện riêng."]
    editor: Ừ… vậy cũng được. Anh đúng là IT.
    ~ it_lt(2)
- -> END

// ------------------------------------------------------------
=== it_tudo_designer ===
# npc:designer
designer: Anh {it}, laptop thứ hai của em không vô được mạng công ty. Anh cho nó vô với. Nó là laptop… cá nhân.
_Laptop thứ hai đang mở một file thiết kế. Góc dưới có cái logo nhỏ màu xanh lá chuối._
+ [🔑 Cho vô mạng khách, tách riêng.]
    designer: Mạng khách cũng được. Cảm ơn anh. Anh tinh tế ghê.
    ~ qh("designer", 8)
    ~ it_on(2)
+ [💬 "Logo xanh lá chuối ở góc kìa."]
    designer: *(gập máy cái rụp)* Đó là… màu tham khảo. Sửa nhẹ thôi mà anh. À không, ý em là… anh đừng nói ai.
    ++ [🤐 "Không nói. Nhưng xóa logo trước khi gửi."]
        designer: …Em cảm ơn anh. Thật. Suýt nữa em toang.
        ~ qh("designer", 15)
        ~ phat_hien(quynh_lam_cho_ll)
    ++ [😶 Gật đầu, rồi đi.]
        ~ phat_hien(quynh_lam_cho_ll)
        ~ qh("designer", -3)
- -> END

// ------------------------------------------------------------
=== it_tudo_sales ===
# npc:sales
sales: Anh {it}! Em cần anh tạo giùm em một địa chỉ email đuôi "@bttglobal". Gấp. Tin em đi, chuyện nhỏ.
+ [😇 "Không. Đó là giả mạo."]
    sales: Giả gì mà giả! Đó là… đại diện! Thôi được, sao mà căng. Em tự làm.
    ~ it_lt(5)
    ~ qh("sales", -5)
+ [🐍 "Mr. Kevin Trộn không có email hả?"]
    sales: *(cười rất tươi)* Anh Kevin bận lắm, ảnh nhờ em. No cap.
    it: Không.
    sales: Anh khó tính vậy. Mà anh đừng kể ai nha. Em mời anh trà sữa cả tháng.
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", 3)
+ [🔧 Làm luôn.]
    _Bạn tạo email. Ba ngày sau, "Mr. Kevin Trộn" gửi email cho {giam_doc} cảm ơn "anh {giam_doc}" bằng tiếng Anh sai ngữ pháp._
    ~ it_lt(-10)
    ~ qh("sales", 15)
    ~ phat_hien(btt_global_gia)
- -> END

// ------------------------------------------------------------
=== it_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {it}. Ăn cơm chưa?
+ [🍜 "Mì ly rồi."]
    chi_dai: Mì ly không phải cơm. Chiều nay về nhà chị ăn. Không có hỏi ý.
    ~ an(50)
    ~ qh("chi_dai", 10)
    ~ cang_thang(-10)
+ [😶 "Chưa."]
    chi_dai: Chị biết mà. *(đặt một hộp cơm lên bàn)* Ăn đi. Ăn hết.
    ~ an(55)
    ~ qh("chi_dai", 8)
- chi_dai: Bộ đàm của chị lại rè. Mà nghe nè, Đại Nhạc Hội mà có đứa nào đụng cầu dao, em gọi chị. Chị xử.
+ [🤝 "Dạ. Em giữ cầu dao. Chị giữ người."]
    chi_dai: Đó. Hiểu chuyện. Chị thích.
    ~ qh("chi_dai", 5)
    ~ it_on(3)
+ [💬 "Chị ơi, em được cảm ơn mấy lần rồi?"]
    chi_dai: *(nhìn bạn một lúc)* Chị không đếm. Nhưng cảm ơn em. Lần này tính một lần.
    ~ it_cam_on()
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== it_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {it}! Mạng bàn anh chậm. Chart load chậm là mua hụt đáy đó em!
+ [💬 "Restart cái ví chưa anh?"]
    dan_dau_tu: *(cười méo xệch)* Em nói câu này lần thứ 7 rồi đó. Anh nhớ mà. Ba triệu. Anh nhớ.
    ~ qh("dan_dau_tu", -2)
+ [🐢 Bóp băng thông chart của {dan_dau_tu}.]
    dan_dau_tu: Đứng rồi! Chart đứng rồi! … Ủa mà… không thấy chart, anh làm báo cáo nhanh hơn hẳn.
    ~ qh("dan_dau_tu", 3)
    ~ it_do_toi(3)
- dan_dau_tu: Nói thật đi, em có bao giờ… nghĩ anh không trả không?
+ [😇 "Không. Anh trả từ từ."]
    dan_dau_tu: *(im lặng lâu)* Ừ. Từ từ. Từ từ thì được.
    ~ qh("dan_dau_tu", 10)
+ [😶 "Có."]
    dan_dau_tu: Ừ… anh cũng nghĩ vậy. Anh cũng nghĩ vậy về chính anh.
    ~ qh("dan_dau_tu", 3)
- -> END

// ------------------------------------------------------------
=== it_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(gọi điện, giọng yếu ớt)* Anh {it}… em hơi sốt… Anh mở giùm em máy tính bàn em, để nó sáng cả ngày, cho anh {hr} thấy em… làm từ xa.
+ [😇 "Không. Bịp HR là bịp anh."]
    thanh_xin_nghi: *(giọng khỏe lại ngay)* Ờ thôi, em hiểu. Anh ngay thẳng quá trời.
    ~ it_lt(3)
    ~ qh("thanh_xin_nghi", -3)
+ [🔑 Mở máy, để màn hình chạy hình nền.]
    thanh_xin_nghi: Anh cứu em một mạng! Bà ngoại em cũng cảm ơn anh!
    ~ it_lt(-5)
    ~ qh("thanh_xin_nghi", 10)
    ~ it_do_toi(3)
- { biet(son_thi_hat):
    _Tiếng nhạc nền phía sau cuộc gọi nghe rất giống trường quay Đài Tivi Hóng._
    + [💬 "Thí sinh số 27 hát hay đó."]
        thanh_xin_nghi: *(im lặng 3 giây)* …Anh coi hả. Anh… đừng nói ai nha. Em sợ người ta cười.
        ~ qh("thanh_xin_nghi", 10)
        -> END
    + [😶 Cúp máy.]
        -> END
}
-> END

// ------------------------------------------------------------
=== it_tudo_bac_bao_ve ===
# npc:bac_bao_ve # noi:choi_bao_ve
_Chòi bảo vệ, tối. Radio phát cải lương nhỏ nhỏ. {cho} ngủ dưới ghế bố._
bac_bao_ve: *(rót trà)* {it} à. Hôm nay cháu lại ngủ ở công ty à?
+ [🍜 "Dạ, server nó không chịu ngủ thì con cũng không ngủ."]
    bac_bao_ve: Ừ… cái máy nó cũng như người. Có lúc phải cho nó nghỉ.
    ~ cang_thang(-10)
    ~ qh("bac_bao_ve", 3)
+ [🍺 Mở 2 lon bia, đưa bác một lon: "Bác uống với con một lon rồi bác đi ngủ."]
    ~ tien_cong(-40000)
    ~ uong(10)
    ~ cang_thang(-10)
    ~ qh("bac_bao_ve", 10)
    ~ it_co_dia_lac = true
    ~ an(15)
    bac_bao_ve: Ừ, một lon thôi đấy. Ăn lạc đi cháu, bác rang chiều nay.
    { qh_bac_bao_ve >= 60:
        bac_bao_ve: Hồi 2010, cái công ty này chỉ có một cái máy tính. Bác với… một người nữa khiêng lên tầng. Nặng như khiêng tủ lạnh.
    }
+ {qh_bac_bao_ve >= 80 and not it_nhanh_nguoi_gui_thu} [🔒 "Bác ơi, mấy cái thư tay bác nhận… con thấy đóng dấu bưu điện nước ngoài."]
    _Bác {bac_bao_ve} im lặng rất lâu. Radio vẫn hát. {cho} mở một mắt nhìn hai người._
    bac_bao_ve: Bác không thấy gì đâu. Mà cháu cũng không thấy gì nhé.
    it: Dạ. Con không thấy gì.
    ~ it_nhanh_nguoi_gui_thu = true
    ~ phat_hien(binh_tai_mat_g)
    ~ it_lt(10)
    ~ qh("bac_bao_ve", 5)
- bac_bao_ve: Thôi, 9 giờ rồi. Bác đi ngủ. Cháu cũng ngủ đi. Đừng ngủ trên ghế xếp nữa, gãy lưng.
-> END

// ------------------------------------------------------------
=== it_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: Biến hình! Ông {it}! Tui có ý này: mình làm cái router màu hồng đi! Sơn hồng, đèn hồng, wifi tên "Hồng Không Phải Màu"!
+ [😐 "Router không quan tâm màu."]
    sieu_nhan_hong: Nhưng người ta quan tâm! Nhìn router hồng là người ta vui, vui thì mạng… nhanh hơn? Không hả? Ờ.
    ~ qh("sieu_nhan_hong", 2)
+ [💬 "Mua router mới thì sơn hồng."]
    sieu_nhan_hong: Deal! Tui góp tiền sơn! Mà… ông cần router mới hả? Sao không ai nói tui?
    it: Ba chữ ký.
    sieu_nhan_hong: Chữ ký gì mà khó vậy? Để tui nói anh {giam_doc}!
    ~ qh("sieu_nhan_hong", 8)
    ~ it_truy_cap(2)
- sieu_nhan_hong: Mà nè, con gà cao su của {cho}… tui giấu sau tủ mạng á. Ông đừng nói nó nha. Giỡn thôi mà.
+ {not it_lay_ga_cao_su} [💬 "Lấy ra đi. Nó cắn dây đó."]
    sieu_nhan_hong: Thiệt hả? Ờ… vậy để mai tui lấy. Tui hứa. *(nói vậy, rồi quên)*
    ~ qh("sieu_nhan_hong", 3)
+ [😶 "Đừng chọc chó nữa."]
    sieu_nhan_hong: *(tháo mũ ra một chút, giọng nhỏ hẳn)* Ờ… tui biết. Tui chỉ… muốn nó để ý tui thôi. Ai cũng để ý bộ đồ, không ai để ý tui.
    ~ qh("sieu_nhan_hong", 10)
+ [🐾 Cười.]
    sieu_nhan_hong: Ông cười kìa! Lần đầu tui thấy ông cười! Hồng là thái độ!
    ~ qh("sieu_nhan_hong", 5)
- -> END

// ------------------------------------------------------------
=== it_tudo_cho ===
# npc:cho
_{cho} chui vào phòng server, đánh hơi từng sợi dây trên sàn như kiểm tra hàng._
cho: Gâu? *(nhìn sợi dây mạng, rồi nhìn bạn)*
+ [🦴 "KHÔNG. Dây không phải đồ ăn."]
    cho: Ẳng… *(nằm xuống, cằm gác lên chân bạn, giả vờ ngoan)*
    ~ qh("cho", 3)
    ~ it_on(2)
+ {co(xuc_xich)} [🌭 Đưa {cho} cây xúc xích.]
    ~ mat(xuc_xich)
    cho: Gâu gâu! *(ăn trong 2 giây, rồi vẫy đuôi như cánh quạt công nghiệp)*
    ~ qh("cho", 15)
+ [🐾 Gãi tai.]
    cho: *(nhắm mắt, đầu nghiêng 45 độ)*
    ~ qh("cho", 8)
    ~ cang_thang(-10)
- _{cho} ngửi cái thùng mì ly, rồi ngửi cái quạt công nghiệp, rồi chọn nằm ngủ ngay cạnh router, nơi ấm nhất phòng._
+ [😶 Để {cho} ngủ đó.]
    _Phòng server có thêm một tiếng ngáy. Bạn thấy đỡ cô đơn._
    ~ cang_thang(-5)
+ [🔌 Dời router lên cao.]
    cho: Grừ… *(dời theo, nằm ngay dưới chân kệ)*
    ~ it_on(3)
- -> END
