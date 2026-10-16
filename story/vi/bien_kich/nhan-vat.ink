// ============================================================
// BIÊN KỊCH: OÁNH · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// Lựa chọn 🔒 "xin chữ ký" chỉ hiện khi bản thảo đã đủ dày (≥ 30 trang).
// ============================================================

// ------------------------------------------------------------
=== bien_kich_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Chị {bien_kich}! Nói nhỏ thôi nha… chị đang viết gì về công ty phải hông? Tui thấy chị ghi chép hoài.
+ [🎭 "Tui viết về một nhân viên mới, ngoài mặt thân thiện, bên trong là cái máy gây chiến."]
    ran_doc: *(cười, mà mắt không cười)* Nhân vật hay ghê. Chắc hư cấu ha.
    ~ bk_cam(5)
    ~ qh("ran_doc", -5)
+ [😇 "Viết linh tinh thôi em. Em mới vô, có gì cần thì hỏi chị."]
    ran_doc: Chị tốt ghê. Tui ghi nhớ nha.
    ~ qh("ran_doc", 5)
+ {bk_nguoi_nhat_so == "ran_doc"} [🔒 "Cuốn sổ của chị, em giữ một đêm. Em có chụp trang nào hông?"]
    ran_doc: Tui chỉ nói sự thật thôi mà: tui chưa đọc. *(ngừng)* Chụp với đọc là hai chuyện khác nhau, chị ha.
    ~ bk_lo(5)
    ~ qh("ran_doc", -10)
+ [😶 Gật đầu, đi tiếp.]
    -> END
- ran_doc: Mà nè, chị có biết ai trong công ty có chuyện gì hay hông? Tui hỏi vậy thôi.
+ [🐍 "Có. Nhưng chuyện hay thì tui giữ để viết, hông để kể."]
    ran_doc: Chị keo ghê. Mà tui thích người keo. Dễ đoán.
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Em ký cho chị dùng tên em trong tiểu thuyết nha?"]
    ran_doc: Được thôi. *(ký nhanh, chữ ký rất đẹp)* Nhớ viết tui là người tốt nha chị.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Hông biết gì hết em."]
    ~ bk_that(1)
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {bien_kich} à! Đúng lúc quá. Anh đang cần một câu slogan cho tháng này. Ngắn, có "gia đình", có "mindset". Anh không ép.
+ [🎤 "Gia đình là mindset. Mindset là gia đình."]
    giam_doc: *(mắt sáng rực)* Vòng tròn! Rất triết lý! Anh in lên áo đồng phục luôn!
    ~ qh("giam_doc", 10)
    ~ bk_cam(-5)
+ [💡 "Anh ơi, hay mình dùng câu 'Việc hôm nay cứ để ngày mai tính' như cũ, nghe thật hơn."]
    giam_doc: Câu ấy của người sáng lập đấy. Anh cũng không hiểu sao ngày xưa ông ấy đùa mà anh lại in thật.
    giam_doc: …Có lẽ vì anh muốn giữ một cái gì đó của ông ấy.
    ~ bk_that(5)
    ~ qh("giam_doc", 3)
+ {bk_bai_phat_bieu_tot >= 1} [🔒 "Anh ơi, bài phát biểu vừa rồi, anh trả nhuận bút cho em được hông?"]
    giam_doc: Nhuận bút à? *(móc ví)* Thôi được. Văn hóa trả tiền cho người viết là văn hóa tốt.
    ~ tien_cong(200000)
    ~ qh("giam_doc", -2)
+ [😶 "Dạ để em suy nghĩ thêm ạ."]
    -> END
- giam_doc: Mà nghe nói em đang viết sách à? Có anh trong đó không?
+ [😇 "Có anh. Anh là nhân vật quan trọng nhất."]
    giam_doc: Thế à! *(chỉnh cà vạt)* Viết anh đẹp trai nhé. Mà… đừng viết chuyện ngân hàng.
    ~ qh("giam_doc", 5)
    ~ bk_lo(5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 Đưa tờ giấy đồng ý: "Anh ký cho em dùng tên anh nha."]
    giam_doc: *(ký luôn, không đọc)* Ký! Anh tin em.
    _Ký mà không đọc. Đúng nhân vật. Bạn không biết nên vui hay lo._
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Dạ em viết chơi thôi anh."]
    ~ bk_lo(-2)
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_truong_phong ===
# npc:truong_phong
truong_phong: {bien_kich}, rảnh không? Mình sync nhanh 5 phút về tiến độ phim nhé.
+ [⏱️ "Anh ơi, 5 phút thật nha. Em bấm giờ."]
    truong_phong: Ừ, 5 phút thật. *(17 phút sau)* …và thế là mình take note lại nhé.
    ~ cang_thang(5)
    ~ qh("truong_phong", 3)
+ [🎭 "Anh có muốn đóng một vai nhỏ trong phim hông? Vai người chỉ đường."]
    truong_phong: Thế à? *(cố giấu nụ cười)* Ừ… nếu phim cần thì anh hy sinh.
    ~ qh("truong_phong", 10)
+ [💬 "Anh ơi, sao anh họp nhiều vậy? Thật lòng á."]
    truong_phong: *(im một lúc)* Vì họp thì ai cũng thấy anh đang làm việc. Còn làm thật thì… anh không giỏi bằng các em.
    _Câu thật nhất {truong_phong} từng nói. Bạn không ghi. Bạn chỉ nhớ._
    ~ bk_that(5)
    ~ qh("truong_phong", 5)
+ [😶 "Dạ em bận viết, chiều nha anh."]
    -> END
- truong_phong: Thế em note lại biên bản giúp anh nhé.
+ [😩 "Dạ…" (Nhận thêm việc.)]
    ~ cang_thang(10)
    ~ qh("truong_phong", 3)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Em note. Mà anh ký giúp em tờ này: đồng ý cho em viết anh vào tiểu thuyết."]
    truong_phong: Tiểu thuyết à? *(ký)* Viết anh chăm chỉ nhé. Đừng viết chuyện họp.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [🙅 "Anh nhờ {thuc_tap_sinh} đi, ảnh note đẹp hơn em."]
    truong_phong: Ừ… cũng đúng.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Chị {bien_kich} ơi, chị nói em nghe nè. Tuần này sếp cần thêm bài phát biểu. Chị viết hay hơn em, mình chia nha?
+ [🤝 "Chia. Mà lần này ghi tên hai đứa."]
    thanh_ninh: Ghi tên hả? *(ngập ngừng)* Dạ… được ạ. Lần đầu em được ghi tên chung với người viết thật.
    ~ qh("thanh_ninh", 10)
    ~ bk_that(3)
+ [🐍 "Cây tre gãy mà vẫn cười, bà nhớ hông? Lần này bà tự trồng tre đi."]
    thanh_ninh: *(nụ cười cứng lại)* Chị nhớ dai ghê.
    ~ qh("thanh_ninh", -10)
    ~ bk_cam(5)
+ [💬 "Mà bà làm trợ lý vậy hông mệt hả? Ngày nào cũng 'anh nói chuẩn quá'."]
    thanh_ninh: Mệt chứ. *(nhìn quanh)* Mà nói thật, em đang tính… à thôi. Chị đừng viết câu này vô sách nha.
    ~ bk_cam(10)
    ~ qh("thanh_ninh", 5)
+ [😶 "Để chị coi lịch đã."]
    -> END
- thanh_ninh: Mà chị ơi, sếp có hỏi em là chị viết gì về ảnh hông.
+ [😇 "Nói với sếp là chị viết ảnh đẹp trai."]
    thanh_ninh: Dạ! Câu đó em nói được, khỏi cần nịnh thêm.
    ~ qh("thanh_ninh", 3)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Bà ký cho tui dùng tên bà trong sách hông?"]
    thanh_ninh: Ký… nhưng chị đổi giùm em cái nghề. Đừng ghi là trợ lý. Ghi là… cố vấn chiến lược.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Nói là chị chưa viết gì."]
    ~ bk_lo(-2)
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Bà! Nghe gì chưa? Tui có tin này nóng hổi, mà bà phải đổi một tin cho tui mới được!
+ [👂 "Kể đi. Tui ghi… à không, tui nghe."]
    hong_hot: *(nghiêng sát tai)* {chua_te_deadline} hôm qua ngồi nhìn cái gối ôm hồng 20 phút. Hai mươi phút! Tui đếm!
    ~ bk_cam(10)
    ~ bk_lo(3)
    ~ qh("hong_hot", 5)
+ [🎭 Đổi tin: "{designer} sợ con gián, nhưng nói là sợ màu nâu."]
    hong_hot: Ối dồi ôi! Tin này đắt! *(gõ điện thoại)*
    ~ qh("hong_hot", 10)
    ~ qh("designer", -5)
+ [😇 "Thôi bà ơi, hôm nay tui ăn chay tin đồn."]
    hong_hot: Ăn chay? Bà bị gì vậy? Đi khám đi.
    ~ bk_that(2)
+ [😶 Giả vờ nghe điện thoại.]
    -> END
- hong_hot: Mà nè, cuốn sổ bìa da của bà… bà viết gì trong đó mà ôm khư khư vậy?
+ [😶 "Danh sách đi chợ."]
    hong_hot: Danh sách đi chợ dày 200 trang? Bà nuôi voi hả?
    ~ bk_lo(3)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Tiểu thuyết. Có bà trong đó. Bà ký cho tui để tên thật nha."]
    hong_hot: TUI LÀ NHÂN VẬT?! Ký! Ký ba lần cũng được! Viết tui xinh nha!
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
    ~ qh("hong_hot", 5)
+ [🎭 "Bí mật quốc gia."]
    hong_hot: Bí mật thì sớm muộn gì cũng tới tai tui. Tui chờ.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Ủa {bien_kich}. Chill hông? Tui mới mở cà phê Sống Ảo, ngồi một mình chán quá.
+ [☕ Ngồi xuống uống chung.]
    con_ong_chau_cha: Bà viết hay ha. Tui đọc mấy cái caption bà viết… có vần, có nhịp. Như lời bài hát.
    ~ qh("con_ong_chau_cha", 5)
    ~ uong(20)
+ [💬 "Ông ít khi tới công ty mà sao nhìn ông mệt vậy?"]
    con_ong_chau_cha: Tại… ban đêm tui làm một chuyện. Một chuyện chú tui hông biết. *(cười)* Thôi, chill.
    ~ bk_cam(5)
+ [😶 "Tui bận, lần sau nha."]
    -> END
- con_ong_chau_cha: Mà nè… bà có bao giờ viết lời bài hát hông? Ví dụ… bài về màu hồng chẳng hạn.
+ [💡 "Tui viết thử câu đầu: 'Hồng là thái độ, không phải lớp áo'."]
    con_ong_chau_cha: *(khựng lại, nhìn bạn rất lâu)* …Câu đó. Bà đừng đưa ai. Cho tui mượn được hông?
    bien_kich: Đây không phải đạo. Là tặng.
    ~ qh("con_ong_chau_cha", 15)
    ~ bk_that(5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Đổi lại, ông ký cho tui dùng tên ông trong tiểu thuyết."]
    con_ong_chau_cha: Được. Mà đừng viết tui là "cháu giám đốc". Viết tui là… một người đang tập tự lập.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Tui chỉ viết văn xuôi thôi."]
    con_ong_chau_cha: Ờ. Tiếc ghê.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: *(đang lướt Tóp-tóp)* {bien_kich}. Còn sớm mà. Chill. Có gì hông?
+ [⏰ "Kịch bản MV đó, ông nói hạn thứ 5. Hôm nay thứ 5."]
    chua_te_deadline: Ét o ét. Ủa thứ 5 thiệt hả? Tui tưởng thứ 2.
    ~ qh("chua_te_deadline", -3)
    ~ cang_thang(5)
+ [💬 "Ông thấy {sieu_nhan_hong} tặng gối ôm hồng là PR hay là thiệt?"]
    chua_te_deadline: PR mà. *(lướt tiếp)* …PR thì sao tặng cả gối ôm. Ai PR bằng gối ôm.
    chua_te_deadline: Thôi, bà đừng viết câu đó vô đâu nha.
    ~ bk_cam(10)
    ~ bk_lo(3)
+ [😶 "Không có gì. Ông lướt tiếp đi."]
    -> END
- chua_te_deadline: Mà nè, bà có cái câu nào hay hay cho tui đăng story hông? Kiểu chill mà sâu.
+ [💡 "'Nước tới chân mới nhảy, mà nhảy là phải đẹp.'"]
    chua_te_deadline: Ủa câu của tui mà?
    bien_kich: Ờ. Tui trả lại.
    ~ qh("chua_te_deadline", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Ký cho tui để tên ông trong sách, tui viết ông thành người làm xong việc sớm."]
    chua_te_deadline: Hư cấu dữ vậy? Ký. Hư cấu thì tui chịu.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Hết câu rồi."]
    chua_te_deadline: Ok mom.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ chị {bien_kich}! Chị cần em pha cà phê, photo, hay cầm hắt sáng ạ?
+ [😇 "Không cần gì hết. Ngồi xuống đây, anh kể chị nghe một chuyện thật của anh."]
    thuc_tap_sinh: Dạ? Chuyện thật… dạ em kể chuyện cái máy photo nha. Nó kẹt giấy 14 lần một tuần ạ.
    ~ qh("thuc_tap_sinh", 5)
    ~ bk_that(3)
+ [📎 "Anh kể chị nghe thêm về 'Người Gác Két' đi. Đoạn anh nhân viên bỏ việc á."]
    thuc_tap_sinh: Dạ! *(mắt sáng lên)* Đoạn đó em tính để ảnh ôm cái thùng giấy, đứng dưới mưa…
    ~ bk_muon(10)
    ~ qh("thuc_tap_sinh", 3)
    _Bạn ghi lại. Lại ghi lại. Đầu trang ghi tên anh ấy, dù sau này chưa chắc ở đó._
+ {bk_ghi_cong_duy} [🔒 "Phim sau mình viết chung từ đầu nha. Ý tưởng của anh, chữ của chị."]
    thuc_tap_sinh: Dạ… dạ em có ý tưởng này nữa nè: "24 Giờ Giúp Người"! Em kể chị nghe nha!
    ~ qh("thuc_tap_sinh", 10)
    ~ bk_that(5)
+ [😶 "Thôi, anh làm việc đi."]
    -> END
- thuc_tap_sinh: Dạ mà chị ơi, sao chị hay gọi em là "anh" vậy? Em là thực tập sinh mà.
+ [😇 "Vì anh lớn hơn chị. Thực tập là chức, còn tuổi là tuổi."]
    thuc_tap_sinh: Dạ… em ngại quá. Mà… em vui ạ.
    ~ qh("thuc_tap_sinh", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Anh ký cho chị viết anh vào tiểu thuyết nha?"]
    thuc_tap_sinh: Dạ em ký ạ! Mà… em có được đọc trước hông ạ?
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [🎭 "Để luyện cho anh quen. Mai mốt anh làm sếp."]
    thuc_tap_sinh: Dạ? Dạ thôi chị ơi!
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_ke_toan ===
# npc:ke_toan
ke_toan: {bien_kich}. Em đề xuất mua cái máy đánh chữ cho công ty à? Hóa đơn đâu em?
+ [😇 "Dạ không, máy của em, em mang từ nhà. Không tốn đồng nào."]
    ke_toan: Tốt. Đồ không tốn tiền là đồ chị thương nhất.
    ~ qh("ke_toan", 5)
+ [💬 "Chị ơi, quỹ trà sữa thứ 6 tháng này còn hông chị?"]
    ke_toan: Còn. {chua_te_deadline} đi trễ một mình nuôi cả quỹ. *(gần như cười)* Đừng nói ai.
    ~ bk_biet_quy_tra_sua = true
    ~ qh("ke_toan", 3)
+ [🎭 "Chị {ke_toan} nói chậm mà nghe sợ hơn người hét."]
    ke_toan: *(chậm rãi)* Vì chị không cần hét. Chị có sổ.
    ~ bk_cam(10)
+ [😶 "Dạ không có gì ạ."]
    -> END
- ke_toan: Mà nghe nói em viết sách. Đừng viết về sổ sách công ty. Đó không phải tiểu thuyết, đó là bằng chứng.
+ [🖋️ "Dạ, em đổi tên chị rồi."]
    ke_toan: Đổi tên mà vẫn ghi "Không có hóa đơn là không có tiền" thì ai cũng biết là chị.
    ~ bk_lo(-3)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Chị ký cho em dùng tên thật được hông chị?"]
    ke_toan: *(đọc kỹ tờ giấy hai lần, cả mặt sau)* Được. Có chữ ký, có ngày tháng. Hợp lệ.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Dạ."]
    -> END
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_hr ===
# npc:hr
hr: {bien_kich} rảnh không, lên phòng anh uống trà xíu.
+ [☕ "Dạ… trà gì anh?"]
    hr: Trà hoa cúc. Uống cho nhẹ lòng. *(cười)* Anh chỉ muốn lắng nghe em thôi.
    ~ cang_thang(5)
    ~ uong(20)
+ [🎭 "Anh mời em uống trà là em có chuyện hả? Hay em là nhân vật mới trong danh sách?"]
    hr: *(nụ cười khựng nửa giây)* Danh sách gì? Anh có danh sách nào đâu.
    _Nửa giây đó, bạn biết có một cái danh sách._
    ~ bk_cam(10)
    ~ qh("hr", -5)
+ [😶 "Dạ em đang bận deadline."]
    -> END
- hr: Mà {bien_kich} này, anh có đọc mấy cái caption em viết. Em có nghĩ tới chuyện viết… thư cho người khác không? Thư thật lòng ấy.
+ [💬 "Anh muốn gửi thư cho ai hả?"]
    hr: Không. Không có ai. *(rót thêm trà)* Chỉ là… có những cái email mình soạn mãi mà không dám bấm gửi.
    ~ bk_cam(5)
    ~ qh("hr", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Anh ký cho em viết anh vào sách. Em viết anh hiền hơn ngoài đời."]
    hr: Hiền hơn ngoài đời? *(cười thật lần đầu)* Ký.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 Uống hết trà, cảm ơn, đi về.]
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_it ===
# npc:it
it: Gì.
+ [💻 "Máy em đơ."]
    it: Tắt đi bật lại chưa?
    bien_kich: Rồi.
    it: Tắt đi bật lại lần nữa.
    _Lần này nó chạy. Bạn không hiểu vì sao. {it} cũng không giải thích._
    ~ qh("it", 3)
+ [📖 "Anh ơi, có cách nào khóa file bản thảo của em, không ai mở được hông?"]
    it: Có. *(gõ ba phím)* Xong. Mật khẩu là tên con mèo.
    bien_kich: Sao anh biết tên con mèo?
    it: Mật khẩu cũ của em là tên con mèo.
    ~ bk_lo(-10)
    ~ qh("it", 5)
+ [😶 "Không có gì anh."]
    -> END
- it: …Còn gì nữa.
+ [🍜 Đặt ly mì lên bàn: "Mì ly. Cảm ơn anh."]
    it: *(gật nhẹ)* Ừ.
    ~ qh("it", 5)
    ~ tien_cong(-15000)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Anh ký cho em để tên anh trong tiểu thuyết."]
    it: *(ký)* Viết ít thoại thôi.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Hết rồi anh."]
    -> END
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: *(kính đen, trong nhà)* Em biết anh là ai không?
+ [😇 "Dạ biết. Anh hát 'Công Viên'. Hồi lớp 10 em chép lời vào vở."]
    idol_het_thoi: *(hạ kính xuống một chút)* Thật à? Chép cả đoạn chuối chiên?
    bien_kich: Cả đoạn chuối chiên.
    ~ qh("idol_het_thoi", 10)
+ [🎭 "Dạ, anh là một nhân vật đang chờ chương thứ hai."]
    idol_het_thoi: *(im lặng)* …Câu đó hay. Hơi đau. Mà hay.
    ~ qh("idol_het_thoi", 5)
    ~ bk_cam(5)
+ [😶 Cười, chào, đi tiếp.]
    -> END
- idol_het_thoi: Em viết lời được không? Anh cần một bài mới. Mà phải hay như "Công Viên".
+ [💡 "Em viết thử. Bài về một người hết thời mà vẫn hát mỗi đêm."]
    idol_het_thoi: *(gỡ kính hẳn ra)* Viết đi. Anh hát.
    ~ qh("idol_het_thoi", 10)
    ~ bk_that(5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Đổi lại, anh ký cho em viết anh vào tiểu thuyết."]
    idol_het_thoi: Ký. Mà nhớ ghi là "ngôi sao". Không có "hết thời".
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [📎 "Em mượn đại giai điệu cũ rồi đổi lời được hông anh?"]
    idol_het_thoi: Mượn? Em biết anh là ai không?
    ~ qh("idol_het_thoi", -5)
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: *(tay trái một điện thoại, tay phải một điện thoại)* Khoan, anh nghe máy chút… {bien_kich} hả? Nhanh nha em.
+ [✒️ "Anh cần em viết gì hông? Thư xin lỗi, thông cáo, caption?"]
    quan_ly_idol: Em là thiên thần. Anh cần ba cái thông cáo cho ba cái khủng hoảng chưa xảy ra.
    ~ qh("quan_ly_idol", 10)
    ~ cang_thang(5)
+ [☕ Đưa ly cà phê: "Anh uống đi, mắt anh thâm hơn mực tàu rồi."]
    quan_ly_idol: *(nhận ly)* Cảm ơn em. Hôm nay ly thứ sáu. Ly này ngon nhất.
    ~ qh("quan_ly_idol", 5)
    ~ tien_cong(-35000)
+ [😶 "Thôi anh nghe máy đi."]
    -> END
- quan_ly_idol: À mà {bien_kich}… em hay ngồi quan sát người ta. Em thấy… anh có lộ liễu không?
+ [😇 "Lộ chuyện gì anh?"]
    quan_ly_idol: Không. Không có gì. Đừng ai đăng gì hết. *(cười mệt)*
    ~ qh("quan_ly_idol", 3)
+ {biet(thai_thuong_phat)} [🔒 "Một giây thôi anh. Chỉ người nhìn kỹ mới thấy."]
    quan_ly_idol: *(đặt cả hai điện thoại xuống bàn)* …Em đừng viết chuyện này. Xin em.
    bien_kich: Em không viết. Có những trang không phải để viết.
    ~ qh("quan_ly_idol", 15)
    ~ bk_that(5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Anh ký cho em để tên anh trong sách. Em hứa viết anh là người tốt nhất công ty."]
    quan_ly_idol: Ký. Mà đừng viết anh có thời gian ngủ. Không ai tin đâu.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Dạ không có gì đâu anh."]
    quan_ly_idol: Ừ. *(điện thoại lại reo)* Khoan, anh nghe máy chút…
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_editor ===
# npc:editor
editor: *(ngáp)* Dạ chị {bien_kich}… đợi render xong…
+ [🎬 "Bản dựng phim ngắn sao rồi em?"]
    editor: Dạ… còn 47%. *(ngáp)* Cảnh mưa đẹp. Ai viết cảnh mưa vậy chị?
    { bk_ghi_cong_duy:
        bien_kich: Ý tưởng của {thuc_tap_sinh}. Chị viết theo.
        editor: *(gật đầu, lần đầu tiên tỉnh hẳn)* Vậy cuối phim ghi đủ hai tên nha chị. Em biết cảm giác không có tên.
        ~ qh("editor", 10)
    - else:
        bien_kich: Chị viết.
        editor: Dạ. *(nhìn bạn hơi lâu)* Render xong là xong.
    }
+ [☕ "Chị mua cà phê đen đá không đường nè."]
    editor: *(mắt sáng lên đúng một độ)* Chị là người thứ hai biết em uống gì.
    ~ qh("editor", 10)
    ~ tien_cong(-30000)
+ [😶 "Thôi em ngủ tiếp đi."]
    -> END
- editor: Chị ơi… chị viết được tin nhắn kiểu… cảm ơn ai đó mà nghe không giống cảm ơn hông?
+ [💬 "Em muốn cảm ơn ai?"]
    editor: Dạ… không ai hết. *(kéo mũ len xuống che mắt)* Em hỏi chơi.
    ~ bk_cam(5)
+ [✒️ "Viết thật thôi em. Câu ngắn nhất là câu thật nhất."]
    editor: Dạ… câu ngắn nhất. *(lẩm bẩm)* Em ghi nhớ.
    ~ qh("editor", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Em ký cho chị viết em vào sách nha. Chị viết em là người dựng giỏi nhất."]
    editor: Dạ… ghi đúng tên em nha chị. Lần này thôi.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Thôi em làm tiếp đi."]
    editor: Dạ… render xong là xong.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_designer ===
# npc:designer
designer: Gì? Bà tới "tham khảo" cái gì nữa?
+ [🎭 "Tham khảo cách bà cau mày. Đẹp như poster phim kinh dị."]
    designer: *(cau mày thêm)* Đây. Lấy luôn đi, khỏi tham khảo.
    ~ qh("designer", -5)
    ~ bk_cam(10)
+ [😇 "Tới khen poster tuần này của bà. Thiệt. Không kèm 'nhưng'."]
    designer: Không có "nhưng"? *(nhìn quanh)* Bà bị ai bắt cóc thay người hả?
    ~ qh("designer", 10)
+ [🙇 "Cái slogan tiệm nail 2021 là ý bà. Tui chưa bao giờ nói ra."]
    designer: *(đứng hình)* …Năm năm. Bà nói cái gì mà lâu vậy.
    ~ bk_ghi_cong("designer")
+ [😶 Quay lưng đi. Hôm nay hông cãi.]
    -> END
- designer: Mà phim của bà… cần poster hông? Tui làm. Không phải vì bà. Vì phim.
+ [🤝 "Cần. Bà vẽ trước, tui sửa kịch bản theo."]
    designer: Bà sửa theo tui? Lần đầu. Tui ghi lại ngày này.
    ~ qh("designer", 10)
    { qh_designer >= 50:
        ~ bk_quynh_hoa_binh = true
    }
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Bà ký cho tui để tên bà trong tiểu thuyết, rồi vẽ luôn bìa."]
    designer: Bìa trong ghi tên tui to. Không thì không ký.
    bien_kich: To. Hứa.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [🎭 "Không cần. Phim tui tự đẹp."]
    designer: Ờ. Tự đẹp. Để coi.
    ~ qh("designer", -3)
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_sales ===
# npc:sales
sales: Chị {bien_kich}… à em… à chị ơi! Tin chị đi, chị có deal cho em nè! Viết giùm chị cái thư mời tài trợ gửi BTT Global!
+ [🎭 "Thư mời gửi một tập đoàn không tồn tại hả? Được, tui viết như tiểu thuyết giả tưởng."]
    sales: *(cười gượng)* Không tồn tại gì đâu… chị quen hết mà. Mr. Kevin Trộn là bạn chị.
    ~ qh("sales", -3)
    ~ bk_cam(10)
+ [💡 "Viết thư cho nhà tài trợ thật đi. Tui giúp em tìm."]
    sales: Thật? *(im một lúc)* Thật… thì khó hơn em tưởng. Mà… được. Thử.
    ~ qh("sales", 10)
    ~ bk_that(3)
+ [😶 "Bận rồi {sales} ơi."]
    -> END
- sales: Mà chị nói thật nha, ai động tới {designer} là động tới chị. Chị đừng cãi {designer} nữa.
+ [😇 "Tui với {designer} cãi vì thương nhau thôi."]
    sales: Thương mà cãi năm năm? Chị hiểu. Chị với khách hàng cũng vậy.
    ~ qh("sales", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Em ký cho chị để tên em trong sách hông? Viết em là sales giỏi nhất."]
    sales: Ký! No cap! Mà viết KPI của em 300% nha.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [🎭 "Em nhỏ nhất công ty mà nói như sếp tổng ghê."]
    sales: Tuổi là con số. Deal mới là đời.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {bien_kich}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
+ [🍚 "Dạ chưa. Chị kể đi."]
    chi_dai: Hồi trẻ chị… à thôi, chuyện đó em viết vô sách là chị kiện. *(cười)* Ăn đi. Gầy như cây bút.
    ~ an(40)
    ~ qh("chi_dai", 5)
+ [💬 "Chị ơi, chị có thấy ai bắt nạt anh {thuc_tap_sinh} hông?"]
    chi_dai: *(đặt đũa xuống)* Có đứa nào? Chỉ mặt chị.
    { bk_y_tuong_muon >= 30 && not bk_ghi_cong_duy:
        _Bạn định chỉ ai đó. Rồi nhận ra, người lấy của {thuc_tap_sinh} nhiều nhất tháng này… đang ngồi trước mặt {chi_dai}._
        ~ cang_thang(10)
    - else:
        bien_kich: Dạ không ai. Em hỏi vậy thôi.
    }
+ [😶 "Dạ em ăn rồi ạ."]
    -> END
- chi_dai: Mà nghe đồn em viết sách có tên thật cả công ty?
+ [😇 "Dạ có. Em định xin phép từng người."]
    chi_dai: Thế là đúng. Viết người ta thì phải hỏi người ta. Như đánh người ta thì phải báo trước.
    ~ qh("chi_dai", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Chị ký giùm em tờ đồng ý."]
    chi_dai: *(ký, nét chữ như dao)* Viết sai một chữ chị tìm tới nhà.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Dạ đâu có chị."]
    chi_dai: Ừ. Chị tin. Tạm.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_dan_dau_tu ===
# npc:dan_dau_tu
dan_dau_tu: *(che màn hình)* {bien_kich}! Em đừng nhìn. Chart đang đẹp, nhìn là nó xuống.
+ [💸 "Anh ơi, 500 nghìn tiền ăn trưa…"]
    dan_dau_tu: Sắp! Sắp x10 rồi em! Lúc đó anh trả em năm triệu!
    ~ qh("dan_dau_tu", -3)
+ [💬 "Anh kể em nghe cái lần anh mất sạch đi. Em viết, không đòi nợ nữa."]
    dan_dau_tu: *(im lâu)* Năm 2021. Anh mất căn hộ. Hôm đó anh vẫn đi làm, vẫn nói "đáy rồi". Không ai biết.
    _Bạn không ghi. Có những câu nghe xong là nhớ._
    ~ bk_cam(10)
    ~ qh("dan_dau_tu", 10)
+ [😶 "Thôi anh xem chart đi."]
    -> END
- dan_dau_tu: Mà em viết sách hả? Viết anh giàu nha. Viết trước thì nó thành thật.
+ [😇 "Em viết anh trả hết nợ."]
    dan_dau_tu: Đó mới gọi là tiểu thuyết giả tưởng.
    ~ qh("dan_dau_tu", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Anh ký cho em để tên thật nha."]
    dan_dau_tu: Ký. Chữ ký anh sau này có giá đó.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [🎭 "Viết anh là cây nến đỏ."]
    dan_dau_tu: Nến đỏ là đáy. Đáy là cơ hội. Cảm ơn em.
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(giọng yếu ớt)* {bien_kich} ơi… tui hơi sốt… bà viết giùm tui cái lý do xin nghỉ mai được hông? Lý do mới. Bà ngoại ốm 7 lần rồi.
+ [✒️ "Lý do: 'Em đi cứu một con mèo bị kẹt trên cây ở Ven Đô'."]
    thanh_xin_nghi: *(mắt sáng lên, hết sốt ngay)* Hay! Có cảm xúc! Có động vật! {hr} hông nỡ từ chối!
    ~ qh("thanh_xin_nghi", 10)
    ~ qh("hr", -3)
+ [🎭 "Viết thật đi: 'Em đi thi hát'. Thật là lý do mới nhất."]
    thanh_xin_nghi: *(ho sặc)* Bà… bà biết hả?
    bien_kich: Đoán thôi. Ông sốt mà giọng vẫn vang.
    ~ phat_hien(son_thi_hat)
    ~ bk_cam(10)
+ [😶 "Tự viết đi {thanh_xin_nghi}."]
    -> END
- thanh_xin_nghi: Mà bà đừng viết tui vô sách nha. Viết thì đổi tên. Đổi luôn cả bà ngoại.
+ [🖋️ "Đổi rồi. Ông tên 'Sang', bà ngoại ông tên 'Bà Nội'."]
    thanh_xin_nghi: Ờ… vậy cũng được. Lạ mà được.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Hay ông ký cho tui dùng tên thật? Tui viết ông thành ca sĩ."]
    thanh_xin_nghi: *(ngập ngừng, rồi ký)* Ca sĩ thì… được. Ghi là "giọng ca ước mơ".
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 "Chưa biết nữa."]
    ~ bk_lo(2)
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_bac_bao_ve ===
# npc:bac_bao_ve
bac_bao_ve: Ừ. Cháu ngồi đi. Uống trà đá không?
+ [🍵 "Dạ con uống. Bác kể chuyện ngày xưa cho con nghe đi bác."]
    bac_bao_ve: Ngày xưa à… Ngày xưa cổng này không có cổng. Chỉ có cái cửa gỗ. Bác ngồi đây, đọc báo, đợi người ta đi làm về.
    ~ uong(25)
    ~ qh("bac_bao_ve", 5)
    ~ bk_cam(5)
+ [💬 "Bác thấy hết mọi chuyện mà không kể ai, bác hông thấy nặng hả?"]
    bac_bao_ve: Bác không thấy gì đâu.
    _Bác {bac_bao_ve} nói câu đó như đóng một cánh cổng. Nhẹ, mà chắc._
    ~ bk_that(3)
+ [😶 Chào bác, đi tiếp.]
    -> END
- bac_bao_ve: Cháu viết nhiều. Bác thấy cháu ghi chép suốt. Viết thì viết, nhưng đừng viết người ta lúc người ta chưa sẵn sàng, cháu ạ.
+ [😇 "Dạ. Con sẽ hỏi trước."]
    bac_bao_ve: Ừ. Hỏi trước thì người ta mới tin mình.
    ~ qh("bac_bao_ve", 5)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Bác ký cho con dùng tên bác trong sách nha. Con viết bác là người giữ cửa."]
    bac_bao_ve: *(cầm bút rất lâu, rồi ký)* Giữ cửa thì được. Còn giữ gì khác thì cháu đừng viết.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [😶 Gật đầu, uống nốt ly trà.]
    -> END
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: Biến hình! Ủa, em biên kịch nè! Hồng không phải màu, Hồng là thái độ!
+ [🎬 "Anh ơi, cho em hỏi: nếu phim về anh, anh muốn cảnh cuối là gì?"]
    sieu_nhan_hong: Cảnh cuối hả? *(ngồi xuống)* Ờm… cảnh có ai đó nhớ tên thật của anh.
    _Anh ấy nói nhỏ tới mức bạn phải nghiêng người mới nghe. Nhỏ như người không mặc đồ siêu nhân._
    ~ bk_that(10)
    ~ qh("sieu_nhan_hong", 5)
+ [🍌 Đưa cái bánh chuối chiên: "Phòng chờ hết rồi, em mua ngoài."]
    sieu_nhan_hong: Trời! Em tốt quá! *(ăn qua khe mũ)* Ngon! Ngon hơn ở phòng chờ!
    ~ qh("sieu_nhan_hong", 10)
    ~ tien_cong(-15000)
+ {bk_thay_nguyen_day_xe} [🔒 "Anh hay đẩy xe giùm người ta. Có ai từng quay lại cảm ơn anh hông?"]
    sieu_nhan_hong: Hông. Mà cũng hông sao. Anh đi nhanh lắm. *(cười)* Đội mũ thì ai nhận ra.
    ~ bk_that(5)
    ~ bk_cam(10)
+ [😶 "Dạ không có gì ạ."]
    -> END
- sieu_nhan_hong: Mà em ơi… em có viết anh vô sách hông? {hong_hot} nói em viết cả công ty.
+ [😇 "Có. Em viết anh là người hùng."]
    sieu_nhan_hong: Người hùng… hay người ngố? *(nhỏ giọng)* Anh biết anh ngố mà.
    bien_kich: Người hùng ngố. Là loại người hùng hiếm nhất.
    ~ qh("sieu_nhan_hong", 10)
+ {bk_trang_tieu_thuyet >= 30} [🔒 "Anh ký cho em viết anh vào sách nha. Em không viết chuyện cái mũ."]
    sieu_nhan_hong: Ký! *(ký bằng bút hồng, kèm hình trái tim)* Mà em không viết chuyện cái mũ thiệt nha.
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    ~ bk_lo(-3)
+ [🎭 "Bí mật nghề nghiệp."]
    sieu_nhan_hong: Ờ! Anh cũng có bí mật nghề nghiệp! *(chỉ vào mũ)*
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_cho ===
# npc:cho
cho: Gâu? *(ngửi túi vải của bạn, rất kỹ)*
+ [🌭 Cho {cho} xúc xích.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        ~ qh("cho", 15)
        cho: Gâu! Gâu gâu! *(vẫy đuôi tít mù)*
    - else:
        _Túi bạn không có xúc xích. Chỉ có cuốn sổ. {cho} ngửi cuốn sổ, rồi nhìn bạn đầy thất vọng._
        cho: …Hừ.
    }
+ [🐈 "Mày còn nhớ Bí hông? Bữa đó mày lùi một bước đó."]
    cho: Grừ… *(quay mặt đi, như người bị nhắc lại chuyện cũ)*
    ~ bk_cam(5)
+ [✍️ Ngồi xuống cạnh {cho}, viết. Chó không đọc được chữ, nên là độc giả an toàn nhất.]
    cho: *(nằm xuống, gác đầu lên giày bạn)*
    ~ cang_thang(-10)
    ~ bk_trang(2)
    ~ qh("cho", 5)
+ [😶 Xoa đầu rồi đi.]
    -> END
- -> END

// ============================================================
// CẢNH TỰ DO KHÁC
// ============================================================

// ------------------------------------------------------------
=== bien_kich_tudo_vuot_meo ===
# noi:gac_mai_so_7
_Bí nằm trên bậu cửa sổ, đuôi vắt xuống như một dấu phẩy._
+ [🐈 Vuốt mèo Bí.]
    ~ bk_vuot_meo = bk_vuot_meo + 1
    ~ cang_thang(-5)
    ~ bk_cam(3)
    { bk_vuot_meo >= 30:
        _Bí kêu "rừ rừ" dài nhất từ trước tới giờ. Ba mươi lần. Bí không phải là bí. Bí là cảm hứng có lông._
    - else:
        _Bí rừ rừ. Thế giới đơn giản lại được một chút._
    }
+ [😶 Để Bí ngủ.]
    _Bí không cần bạn. Đó là điều dễ thương nhất ở mèo._
- -> END

// ------------------------------------------------------------
=== bien_kich_tudo_ban_thao_bi_lo ===
# ngau_nhien # dieu_kien:bk_do_lo>=100 # bat_buoc
~ bk_so_bi_lo_da_xem = true
_Điện thoại bạn rung liên tục. Group Zola công ty: 47 tin nhắn mới trong 3 phút._
_Ai đó vừa gửi ảnh chụp một trang sổ bìa da. Chữ bút máy mực hồng. Tên thật của từng người._
hong_hot: *(trong group)* Ủa… cái này… là văn của ai vậy mấy bà?
dan_dau_tu: *(trong group)* "Lúc nào cũng sắp giàu". Ai viết vậy. Viết đúng mà.
chi_dai: *(trong group)* {bien_kich}. Lên sân thượng. Ngay.
_Bạn nhìn màn hình. Cuốn tiểu thuyết chưa xong đã có độc giả. Toàn là nhân vật._
+ [🙇 Nhắn vào group: "Là của tui. Tui xin lỗi. Tui sẽ xin phép từng người."]
    ~ bk_that(5)
    ~ qh("chi_dai", 5)
    _Không ai trả lời. Rồi {thuc_tap_sinh} thả một trái tim. Chỉ một._
+ [😶 Tắt điện thoại.]
    ~ cang_thang(20)
    ~ bk_cam(-20)
- -> END
