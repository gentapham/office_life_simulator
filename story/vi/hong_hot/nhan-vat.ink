// ============================================================
// THÁNH HÓNG: NGÂN · HỘI THOẠI TỰ DO VỚI TỪNG NHÂN VẬT
// Luật miệng: Kín Miệng thấp thì lựa chọn "kể lại" hiện đầu tiên.
// ============================================================

// ------------------------------------------------------------
=== hong_hot_tudo_ran_doc ===
# npc:ran_doc
ran_doc: *(cười hiền)* Bà ơi, hôm nay có gì mới hông? Tui mới vô, chưa biết ai với ai hết.
+ {hh_kin_mieng < 40} [📣 "Nghe gì chưa? Hôm qua…" *(kể một mạch 20 phút)*]
    ~ hh_ke_tin()
    ~ qh("ran_doc", 8)
    ran_doc: Trời, bà biết nhiều ghê. Kể tiếp đi.
    _{ran_doc} không ghi chép gì trước mặt bạn. Nhưng tối nay, bên kia vách, tiếng bút bi sẽ sột soạt rất lâu._
+ [🤐 "Hôm nay yên ắng lắm. Ông kể tui nghe đi."]
    ran_doc: Tui hả? Tui có gì đâu mà kể. *(cười)*
    ~ hh_kin(3)
    _Người hỏi nhiều mà không bao giờ kể. Bạn bắt đầu thấy lạ._
+ [💬 "Ông viết gì trong cuốn sổ mỗi tối vậy?"]
    ran_doc: *(khựng 1 giây)* … Viết bản tin nội bộ. Công việc mà.
    ~ hh_tin(1)
- ran_doc: Mà bà… có thấy Siêu Nhân Hồng có vết sẹo trên mu bàn tay trái hông?
+ [👀 "Có! Sao ông biết? Ông quen ổng hả?"]
    ran_doc: Đâu có. Tui… đoán vậy thôi.
    ~ hh_tin(1)
    _Không ai đoán trúng một vết sẹo. Bạn ghi vào ghi chú: "{ran_doc} biết vết sẹo của {sieu_nhan_hong}??"_
+ {biet(hieu_ech)} [🔒 "Xóm Cây Me, nhà kho có lỗ thông gió hình con cá. Tui thấy trong ảnh hồi nhỏ rồi."]
    _{ran_doc} im lặng rất lâu. Nụ cười tắt hẳn._
    ran_doc: … Bà đừng kể ai. Tui xin.
    ~ hh_giu_hieu_ech = true
    ~ hh_giu_tin_cap_cao()
    ~ qh("ran_doc", 10)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {hong_hot} à. Fanpage hôm nay bao nhiêu rồi em?
+ [📊 Báo số thật.]
    giam_doc: Ừ. Thế à. *(thở dài)* Cố lên em nhé. Anh không ép, tùy em.
    ~ uy_tin = uy_tin + 2
+ [🧂 Cộng thêm một chút cho sếp vui.]
    giam_doc: Ồ! Tốt quá! Thế thì tối nay anh nhắn group khen cả đội!
    ~ qh("giam_doc", 3)
    ~ hh_lo(2)
- giam_doc: Mà này… em có biết mấy cái group… ờ… nhóm chat riêng của nhân viên không? Anh hỏi cho vui thôi.
+ [😇 "Dạ em hông biết anh. Em chỉ biết group công ty."]
    giam_doc: Ừ. Thế thôi.
    _Sếp nói "thế thôi" mà ngón tay gõ gõ lên điện thoại, như đang nhớ cái gì đó lúc 22:01._
+ {hh_biet_hoa_la_sep} [🔒 🌻 "Dạ có anh. Có một bạn tên Hoa Hướng Dương, hiền lắm, chỉ thả haha thôi."]
    giam_doc: *(ho sặc)* … Ừ. Hiền nhỉ.
    _Sếp đỏ tai. Bạn cố nhịn cười. Cả hai đều biết. Không ai nói ra._
    ~ qh("giam_doc", 8)
+ [🧂 "Dạ có, nhiều lắm anh. Mà toàn chuyện ăn uống thôi."]
    giam_doc: Ăn uống à… Ừ. Thế thì tốt.
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_truong_phong ===
# npc:truong_phong
truong_phong: {hong_hot}, mình họp nhanh 5 phút về chiến lược nội dung nhé. 15 slide thôi.
+ [🙋 "Dạ 5 phút thiệt hả anh?"]
    truong_phong: Đương nhiên. Mình sync thật nhanh.
    _1 tiếng 40 phút sau, slide số 6._
    ~ nghi(-10)
    ~ qh("truong_phong", 3)
+ [📱 "Anh ơi em đang live, họp sau nha anh!"]
    truong_phong: À. Thế thì… mình take note lại, họp sau nhé.
    ~ qh("truong_phong", -2)
- truong_phong: À mà… cái trang Confession gì đó… có ai nói xấu anh không em?
+ {hh_kin_mieng < 40} [📣 "Có! Bài 'Trưởng phòng gọi họp 6 giờ sáng' được 900 like đó anh!"]
    ~ hh_ke_tin()
    ~ hh_lo(5)
    truong_phong: 900? Thế mình phải họp về chuyện này.
+ [😇 "Dạ em hông đọc trang đó anh."]
    truong_phong: Ừ. Anh cũng không đọc. *(đã đọc 14 lần)*
    ~ hh_lo(-2)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Bà {hong_hot}. Bà đừng đăng ảnh sếp nhắm mắt nữa nha. Sếp hỏi tui ai chụp.
+ [😅 "Ok ok, lần sau tui đăng ảnh sếp mở mắt. Mà sếp mở mắt hiếm lắm á."]
    thanh_ninh: *(nén cười)* Bà đó. Thôi.
    ~ qh("thanh_ninh", 3)
+ [🧂 "Tui đâu có chụp. {ran_doc} chụp đó."]
    thanh_ninh: … Ờ. {ran_doc}. Ghi nhận.
    ~ qh("ran_doc", -5)
    ~ qh("thanh_ninh", 2)
- thanh_ninh: *(hạ giọng)* Mà bà… hôm bữa ở pantry, cái điện thoại "LL" đó… bà kể ai chưa?
+ [🤐 "Chưa. Tui hông kể. Thiệt."]
    ~ hh_kin(5)
    ~ qh("thanh_ninh", 8)
    thanh_ninh: Cảm ơn bà. Tui nợ bà một lần.
+ {hh_kin_mieng < 40} [📣 "Ờ… tui kể có một người. À, hai."]
    thanh_ninh: *(nhắm mắt)* Hai người ở công ty này là cả công ty.
    ~ qh("thanh_ninh", -10)
    ~ hh_ke_tin()
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: {hong_hot}, đăng giùm anh story quán cà phê này lên fanpage công ty được hông? Quán bạn anh mới mở. Chill lắm.
+ [📱 "Có tiền quảng cáo hông anh?"]
    con_ong_chau_cha: Ủa sao không lấy luôn cái quán? Mà thôi, anh trả 500 nghìn.
    ~ tien_cong(500000)
    ~ hh_tt(-2)
+ [🙅 "Fanpage công ty mà anh, chỉ đăng Siêu Nhân Hồng thôi."]
    con_ong_chau_cha: Ờ… ok. Chú anh nói vậy hả?
    ~ qh("con_ong_chau_cha", -2)
    ~ uy_tin = uy_tin + 2
- con_ong_chau_cha: Mà… em có nghe tiếng nhạc gì từ penthouse anh không? Mấy đứa hàng xóm nói nghe tiếng hát ban đêm.
+ [👀 "Anh hát hả? Anh hát cho em nghe đi!"]
    con_ong_chau_cha: Đâu! Anh… mở nhạc thôi. *(đỏ tai)*
    ~ hh_tin(1)
+ [🤐 "Em hông nghe gì hết anh."]
    con_ong_chau_cha: Tốt. Ừ. Tốt.
    ~ hh_kin(3)
    ~ qh("con_ong_chau_cha", 3)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: {hong_hot}. Bên bà lên kịch bản couple tui với Siêu Nhân Hồng hả? Ok, tui phối hợp. Ghi vào bảng tiến độ: "Content couple, để {hong_hot} lo".
+ [😅 "Kịch bản gì? Tui đâu có viết kịch bản đó!"]
    chua_te_deadline: *(ngưng lướt Tóp-tóp)* … Vậy quà màu hồng mỗi sáng là của ai lên kế hoạch?
    hong_hot: Của… ổng. Tự ổng.
    _{chua_te_deadline} nhìn cái gối cổ hồng trên bàn rất lâu._
    ~ qh("chua_te_deadline", 3)
    ~ qh("sieu_nhan_hong", 5)
+ [🧂 "Ừ, kịch bản đó. Phối hợp tốt nha. Đẩy tương tác."]
    chua_te_deadline: Chill. Kịp hết.
    ~ hh_tt(3)
    ~ qh("sieu_nhan_hong", -3)
- chua_te_deadline: Mà nè, bà có thấy cái USB không nhãn nào hông? Mùi cà phê sữa đá. Hỏi cho vui thôi.
+ [👀 "USB gì? Có gì trong đó? Kể đi!"]
    chua_te_deadline: Hông có gì. Hông có gì hết. Còn sớm mà.
    ~ hh_tin(1)
+ [🐕 "Ông hỏi con {cho} thử. Nó gom đồ có mùi dưới gầm cầu thang."]
    chua_te_deadline: *(đứng bật dậy)* …Gầm cầu thang?
    ~ qh("chua_te_deadline", 5)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ chị {hong_hot}, chị cần em cầm ring light giùm không ạ?
+ [🤝 "Có! Đứng đó, nghiêng 45 độ. Giỏi lắm anh {thuc_tap_sinh}."]
    thuc_tap_sinh: Dạ em cầm chắc lắm ạ! Hồi trước em cầm… ờ… cầm hồ sơ nặng hơn nhiều ạ.
    ~ qh("thuc_tap_sinh", 5)
+ [🎥 "Anh đứng vô khung hình luôn đi, khán giả thích anh lắm."]
    thuc_tap_sinh: Dạ… em lên hình hả chị? *(chỉnh cổ áo, rất nghiêm túc)*
    ~ hh_follow(3000)
    ~ qh("thuc_tap_sinh", 3)
- thuc_tap_sinh: Dạ chị ơi… chị có biết anh {bien_kich}… à chị {bien_kich}… đang viết phim gì không ạ? Em có kể chị ấy một ý tưởng hồi tháng 9.
+ [💬 "Ý tưởng gì anh? Kể em nghe."]
    thuc_tap_sinh: Dạ… về một người gác két, bỏ việc, trời mưa, có người mặc đồ hồng đẩy xe giùm ạ. Chuyện thật của… một người quen em ạ.
    ~ phat_hien(nguoi_gac_ket)
    ~ hh_tin(2)
+ [🤐 "Em hông biết. Mà anh hỏi thẳng bả đi."]
    thuc_tap_sinh: Dạ… em ngại ạ.
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {hong_hot}. Hóa đơn tiền quảng cáo Tóp-tóp đâu em?
+ [🧾 Đưa hóa đơn, đầy đủ.]
    ke_toan: *(kiểm)* Đủ. Hiếm.
    ~ qh("ke_toan", 5)
+ [😅 "Chị ơi Tóp-tóp hông xuất hóa đơn đỏ…"]
    ke_toan: Không có hóa đơn là không có tiền.
    ~ tien_cong(-100000)
- ke_toan: *(nhìn thẳng)* Hôm mất điện, em ngồi gần chị. Em nghe được gì không?
+ {hh_giu_trang_47} [🔒 "Có. Em nghe hết. Em hông kể ai, chị."]
    _{ke_toan} im lặng. Rồi gật đầu đúng một lần, rất chậm._
    ke_toan: Giữ thêm 15 ngày nữa nha em.
    ~ qh("ke_toan", 15)
    ~ hh_kin(5)
+ [😇 "Dạ em lo sạc pin cho mọi người, hông nghe gì hết chị."]
    ke_toan: Ừ. Tốt.
+ {hh_kin_mieng < 40} [📣 "Dạ… có nghe chữ 'mười tỷ'… mà em mới kể cho… ờ…"]
    ke_toan: *(mặt lạnh)* Cho ai?
    ~ qh("ke_toan", -15)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_hr ===
# npc:hr
hr: Em {hong_hot}. Em rảnh không, lên phòng anh uống trà xíu.
_Phòng HR. Kệ trà 40 loại. Laptop của {hr} để mở, màn hình quay ra cửa._
+ [👀 Liếc màn hình laptop trong lúc {hr} rót trà.]
    _Một email nháp, tiêu đề "Thư mời làm việc", người nhận: {ke_toan}. Dòng đầu: "Chị {ke_toan}, nếu một ngày mình mở quán 'Phòng Trà Nhân Sự'…"_
    ~ hh_biet_email_tuan = true
    ~ hh_tin(2)
    _{hr} quay lại. Bạn nhìn ly trà như chưa từng nhìn thứ gì khác._
+ [😇 Ngồi ngay ngắn, nhìn thẳng {hr}.]
    hr: Anh chỉ muốn lắng nghe em thôi. Gần đây em có mệt không?
    _Câu hỏi đó, lạ thay, nghe như thật._
    ~ qh("hr", 3)
- hr: Em làm mạng xã hội. Em có biết… ai hay đăng bài ẩn danh không?
+ [🫣 "Dạ em hông biết anh. Chắc mấy bạn tầng 1."]
    hr: Tầng 1. Ừ. Em uống trà đi.
    ~ hh_lo(2)
+ {hh_kin_mieng < 40} [📣 "Anh ơi nghe gì chưa, nghe nói admin là người làm mạng xã hội đó!"]
    hr: *(nhìn bạn, mỉm cười)* Em làm mạng xã hội mà.
    _Bạn vừa tự khai._
    ~ hh_lo(15)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_it ===
# npc:it
it: Gì.
+ [🍜 Đặt ly mì tôm chua cay lên bàn.]
    it: … Ngồi.
    ~ qh("it", 8)
    _Hai người ăn mì trong phòng server. Không ai nói câu nào. Quạt công nghiệp quay. Ngon._
    ~ an(25)
+ [👀 "Anh ơi, nghe gì chưa…"]
    it: Không.
    _{it} đeo tai nghe vào. Không có nhạc._
- it: Bà. Đổi tên máy đi. "NGAN-LAPTOP" ai cũng đọc được.
+ [😇 "Dạ. Đổi thành gì anh?"]
    it: "May-in-tang-1". Không ai nghi máy in.
    ~ hh_lo(-8)
    ~ qh("it", 5)
+ [😅 "Sticker đó mạ vàng, em tiếc lắm anh."]
    it: Lỗi người dùng.
- { qh_it >= 40 && not hh_mo_nhanh_hoa_huong_duong:
    -> hoa
}
-> END
= hoa
_{it} quay lại màn hình. Bạn nhớ ra một chuyện._
+ [🔒 "Anh {it}, coi giùm em tài khoản Hoa Hướng Dương 1989 đăng nhập từ máy nào."]
    it: Lỗi người dùng.
    _1 phút sau. {it} không quay lại, chỉ nói vọng qua vai._
    it: Máy phòng tầng 2. Vách kính.
    ~ hh_mo_nhanh_hoa_huong_duong = true
    ~ phat_hien(clone_thang)
    ~ hh_tin(3)
    _Bạn đứng yên giữa phòng server. Quạt công nghiệp thổi tung tóc bạn. Bạn không thấy lạnh, chỉ thấy… ối dồi ôi._
+ [😶 Thôi. Không hỏi.]
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen trong nhà)* Em biết anh là ai không?
+ [😇 "Dạ anh {idol_het_thoi}, 'Công Viên' 2015. Em hát thuộc lòng."]
    idol_het_thoi: *(gỡ kính ra một chút)* Thật hả? Hát thử anh nghe.
    _Bạn hát sai một câu. {idol_het_thoi} sửa. Lần đầu tiên trong tuần, anh ấy cười thật._
    ~ qh("idol_het_thoi", 8)
+ [🧂 "Dạ anh là người có 80 nghìn fan comment giống hệt nhau á anh."]
    idol_het_thoi: *(tái mặt)* … Em nói gì?
    ~ qh("idol_het_thoi", -15)
    ~ hh_tin(1)
- idol_het_thoi: Fanpage em đăng anh một bài đi. Fan anh đông lắm em.
+ [📱 "Ok anh, mai em đăng clip anh hát mộc, hông chỉnh."]
    ~ hh_follow(3000)
    ~ qh("idol_het_thoi", 5)
+ [🙅 "Fanpage chỉ đăng Siêu Nhân Hồng thôi anh."]
    idol_het_thoi: Ừ. Ai cũng chỉ đăng Siêu Nhân Hồng.
    ~ qh("idol_het_thoi", -5)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Khoan, anh nghe máy chút. *(hai điện thoại cùng reo)* … {hong_hot}. Chuyện này để anh lo, đừng ai đăng gì hết!
+ [😇 "Dạ em chưa đăng gì mà anh."]
    quan_ly_idol: Anh biết. Anh nói trước cho chắc. *(cười mệt)*
    ~ qh("quan_ly_idol", 3)
+ [👀 "Chuyện gì vậy anh? Kể em nghe, em hứa hông đăng."]
    quan_ly_idol: Câu "hứa không đăng" của em có giá trị bằng chữ ký của anh {giam_doc}.
    ~ qh("quan_ly_idol", -2)
- quan_ly_idol: Mà… cái fan club "Hội Cá Viên Chiên" của {idol_het_thoi} á. Em đừng đăng gì về admin "ChuoiChien89" nha.
+ [💬 "Sao anh biết tên admin đó vậy anh?"]
    _{quan_ly_idol} mở miệng, rồi đóng lại. Rồi nghe máy, dù máy không reo._
    ~ phat_hien(thai_thuong_phat)
    ~ hh_tin(2)
+ [🤐 "Dạ. Em hông đăng."]
    ~ hh_kin(5)
    ~ qh("quan_ly_idol", 5)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_bien_kich ===
# npc:bien_kich
bien_kich: {hong_hot}. Viết caption giùm bà nè: "Hồng là một nỗi đau đã được tô son". Thấy sao?
+ [😅 "Hơi buồn bà ơi. Fan muốn vui."]
    bien_kich: Kịch bản nào cũng cần thêm nỗi đau.
    ~ qh("bien_kich", 2)
+ [📱 "Hay! Đăng liền!"]
    ~ hh_follow(2000)
    ~ qh("bien_kich", 5)
    _Bình luận: "Ad đang buồn hả?", "Hồng tô son hả?"._
- bien_kich: *(lục túi)* Mà bà có thấy cuốn sổ bìa da của tui đâu hông?
+ {co(so_tay_oanh)} [🔒 Đưa cuốn sổ: "Rơi trên xe Vũng Tàu. Tui… có đọc vài trang."]
    ~ mat(so_tay_oanh)
    bien_kich: *(trắng bệch)* … Đọc trang nào?
    hong_hot: Trang có tên tui. "Nói nhiều tới mức có ngày sẽ nói ra chính mình".
    bien_kich: … Tui sẽ đổi tên nhân vật. Cảm ơn bà đã trả.
    ~ qh("bien_kich", 10)
    ~ hh_kin(5)
+ [😶 "Hông thấy bà ơi."]
    bien_kich: Thôi chết…
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_editor ===
# npc:editor
editor: *(ngáp)* Chị… video Siêu Nhân Hồng đợi render xong…
+ [☕ Đưa ly cà phê đen.]
    editor: *(mắt sáng lên)* Chị là thiên thần.
    ~ qh("editor", 5)
+ [🧂 "Render nhanh nha, chị đăng giờ vàng đó."]
    editor: Dạ… render nhanh là render xấu chị ơi.
- editor: Chị… chị thấy anh {quan_ly_idol} dạo này có mệt không?
+ [👀 "Ờ, ổng mệt. Mà sao em hỏi? Hả? Hả?"]
    editor: *(tai đỏ)* Hông… hông có gì.
    ~ phat_hien(linh_thich_thai)
    ~ hh_tin(2)
+ [🤐 "Mệt. Em mang cho ổng ly cà phê đen, ly thứ tư thì thêm sữa."]
    editor: Sao chị biết… *(rồi im)* Dạ. Cảm ơn chị.
    ~ qh("editor", 8)
    ~ hh_kin(3)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_designer ===
# npc:designer
designer: Bà! Sếp nói poster "chưa đủ wow". Lần sửa thứ 21. Tui sắp bỏ nghề đi bán chè.
+ [🤗 "Bỏ nghề thì tui làm khách quen. Mà sếp lần nào cũng chọn bản 1, nộp lại bản 1 đi."]
    designer: … Hết cứu. Mà đúng.
    ~ qh("designer", 5)
+ [👀 "Kể tui nghe sếp nói gì nữa! Tui đăng group!"]
    designer: Đăng đi, tui đỡ tức.
    ~ hh_ke_tin()
    ~ qh("designer", 2)
- designer: *(nhỏ giọng)* Mà… bà có thấy màn hình laptop thứ hai của tui hông? Hôm mất điện á.
+ {hh_kin_mieng < 40} [📣 "Có! File 'Hồng Ngoại' màu xanh lá chuối đúng hông?"]
    designer: *(gập máy cái rầm)* Bà… đừng nói lớn.
    ~ qh("designer", -10)
    ~ phat_hien(quynh_lam_cho_ll)
+ [🤐 "Tui hông thấy gì hết. Bạn thân mà."]
    designer: Bạn thân. *(đưa bạn nửa ly trà sữa)*
    ~ qh("designer", 10)
    ~ hh_kin(5)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_sales ===
# npc:sales
sales: Chị {hong_hot}! Đăng giùm em bài "G-Entertainment ký kết BTT Global" nha. Tin chị đi, deal này chắc kèo!
+ [🔍 "Hợp đồng đâu em? Có logo thật hông?"]
    sales: *(cười rạng rỡ)* Đang in chị ơi. Logo là cái bánh tráng xoay xoay.
    ~ phat_hien(btt_global_gia)
    ~ hh_tin(1)
+ [📱 "Ok, mà ghi 'sắp ký' thôi nha."]
    ~ hh_lo(1)
    ~ qh("sales", 5)
    _Bài "sắp ký" được 400 like. Mr. Kevin Trộn vẫn chưa xuất hiện._
- sales: Mà chị {hong_hot}, nếu có người hỏi BTT ở đâu, chị nói Singapore giùm em nha.
+ [🤐 "Ừ. Singapore."]
    ~ hh_kin(3)
    ~ qh("sales", 5)
+ {hh_kin_mieng < 40} [📣 "Em ơi, cả công ty biết là hông có BTT rồi đó."]
    sales: *(nụ cười đứng hình)* … Ai biết?
    ~ qh("sales", -10)
    ~ hh_ke_tin()
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {hong_hot}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
+ [🍚 Ngồi xuống ăn.]
    ~ an(40)
    ~ qh("chi_dai", 5)
    chi_dai: Mấy đứa làm mạng xã hội gầy hết. Ăn đi.
+ [👀 "Chị kể gì chị? Chuyện chị đổ tô ốc hả?"]
    chi_dai: *(nhướng mày)* Ai kể em?
    hong_hot: Dạ… cả quận ạ.
    chi_dai: Ờ. Cả quận biết, mà không ai biết tại sao.
    ~ hh_tin(1)
- chi_dai: Em hay hóng. Chị không cấm. Nhưng hóng thì hóng để hiểu người ta, đừng hóng để kể.
+ [😇 "Dạ. Em nhớ câu đó."]
    ~ hh_kin(8)
    ~ qh("chi_dai", 5)
+ [😅 "Hóng mà hông kể thì… khó thở lắm chị."]
    chi_dai: Thì tập thở.
    ~ hh_kin(3)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: {hong_hot}! Khung giờ tối nay: 19:47. Tin anh. Số liệu không nói dối. Coin thì có.
+ [📊 Nghe theo, đăng 19:47.]
    ~ hh_follow(5000)
    ~ qh("dan_dau_tu", 5)
+ [😅 "Hôm trước anh nói 19:47 coin x10 mà."]
    dan_dau_tu: Đó là coin. Đây là số liệu. Hai cái khác nhau. Một cái có tâm.
- dan_dau_tu: Mà em cho anh mượn 500 nghìn tới thứ 6 được không? Lần này là lên thật.
+ [💸 Cho mượn.]
    ~ tien_cong(-500000)
    ~ qh("dan_dau_tu", 10)
    dan_dau_tu: Em vào sổ chủ nợ hạng VIP!
+ [🙅 "Em hết tiền anh. Lương 13 triệu à."]
    dan_dau_tu: Hiểu. Hiểu. Thị trường khó khăn.
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(ho có nhịp)* {hong_hot} ơi… nếu anh {hr} hỏi, nói tui đi khám bệnh nha…
+ [👀 "Khám bệnh hay khám… sân khấu?"]
    thanh_xin_nghi: *(giật mình)* Bà nói gì vậy!
    ~ hh_tin(1)
+ [🤐 "Ok. Khám bệnh."]
    ~ hh_kin(3)
    ~ qh("thanh_xin_nghi", 5)
- thanh_xin_nghi: *(hạ giọng, giọng trong veo lạ thường)* {hong_hot}… nếu lỡ… bà thấy tui ở đâu đó… bà giữ giùm nha.
+ {biet(son_thi_hat)} [🔒 "Thí sinh số 27 hát hay lắm. Tui bình chọn rồi."]
    thanh_xin_nghi: *(mắt sáng rỡ)* Thiệt hả? Bà… bà là người đầu tiên trong công ty nói vậy.
    ~ qh("thanh_xin_nghi", 15)
    ~ hh_kin(5)
+ [😶 "Tui hông thấy gì. Tui chỉ thấy fanpage."]
    thanh_xin_nghi: Tốt. Tốt quá.
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Cháu {hong_hot}. Lại quay phim à?
+ [📵 Cất điện thoại: "Dạ hông bác. Con xuống uống trà."]
    bac_bao_ve: Ừ. Ngồi đi.
    ~ qh("bac_bao_ve", 8)
    ~ uong(25)
+ [🎥 "Dạ bác cho con quay {cho} một chút nha bác!"]
    bac_bao_ve: Quay nó thì được. Đừng quay bác.
    ~ hh_follow(3000)
    ~ qh("cho", 3)
- bac_bao_ve: Cháu biết nhiều chuyện nhỉ.
+ [😅 "Dạ con hóng thôi bác. Bác chắc còn biết nhiều hơn con."]
    bac_bao_ve: Bác không thấy gì đâu.
    _Bác nói câu đó như người đóng một cánh tủ. Một cánh tủ gỗ cũ, có khóa._
+ [💬 "Bác ơi… sao bác biết mà hông bao giờ kể?"]
    bac_bao_ve: Vì có những chuyện, người kể đầu tiên phải là người trong cuộc. Mình kể trước là mình lấy mất của họ.
    ~ hh_kin(10)
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: {hong_hot} ơi! Hôm nay quay gì? Biến hình rồi nè! *(tạo dáng)*
+ [🎵 "Đu trend Tóp-tóp! Nhạc lên!"]
    -> hong_hot_mg_du_trend
+ [💬 "Hôm nay hông quay. Anh ngồi chơi với em chút."]
    sieu_nhan_hong: Hông quay hả? *(hạ tay, giọng nhỏ lại)* … Dạ… ờm… vậy cũng được.
    _Không có camera, {sieu_nhan_hong} nói nhỏ, hay "dạ… ờm…". Một người khác hẳn._
    ~ qh("sieu_nhan_hong", 8)
- sieu_nhan_hong: {hong_hot}… anh hỏi thiệt. Nếu khán giả thấy mặt anh rồi… họ còn thích anh hông?
+ [😇 "Họ thích anh vì anh đẩy xe giùm bà cụ, hông phải vì cái mũ."]
    sieu_nhan_hong: … Thiệt hông?
    ~ qh("sieu_nhan_hong", 10)
+ [🧂 "Thấy mặt là viral liền anh! Một triệu trong một đêm!"]
    sieu_nhan_hong: *(im)* … Ờm. Chắc vậy.
    ~ qh("sieu_nhan_hong", -5)
- -> END

// ------------------------------------------------------------
=== hong_hot_tudo_cho ===
# npc:cho
cho: Gâu? *(nhìn ba cái điện thoại của bạn, nghiêng đầu)*
+ {co(xuc_xich)} [🔒 🌭 Đưa xúc xích.]
    ~ mat(xuc_xich)
    ~ qh("cho", 15)
    cho: Gâu gâu! *(vẫy đuôi như cánh quạt)*
+ [🎥 "{cho} ơi, NGỒI! BẮT TAY!" *(quay clip)*]
    cho: … *(nằm xuống, quay lưng)*
    ~ hh_follow(2000)
    _Clip "Chó công ty không thèm hợp tác" vẫn được 30.000 lượt xem._
+ [🤗 Ngồi xuống xoa đầu, không quay.]
    ~ qh("cho", 8)
    cho: Gâu. *(gác cằm lên đùi bạn)*
- -> END
