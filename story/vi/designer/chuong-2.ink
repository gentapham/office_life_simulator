// ============================================================
// DESIGNER · CHƯƠNG 2: "DỰ ÁN HỒNG NGOẠI" (8/10 – 14/10)
// ============================================================

// ------------------------------------------------------------
=== designer_0810_kham_mat ===
# ngay:8 # gio:13:15 # noi:ban_thiet_ke
_Ngày Thị giác Thế giới. {chi_dai} kéo {editor} ra cửa như kéo một bao gạo biết ngáp._
chi_dai: Đi khám mắt! Mắt em đỏ như đèn giao thông rồi đó {editor}!
editor: *(ngáp)* Em… đang render…
editor: {designer}… canh giùm tui cái thanh render… tới 100 thì bấm lưu… đừng bấm gì khác…
* [🤝 "Đi đi, tui canh cho. Thanh render là thứ duy nhất trong công ty chạy đúng tiến độ."]
    ~ qh("editor", 10)
    _Bạn canh 40 phút. Cái video là clip Tóp-tóp của anh {idol_het_thoi}, dựng đẹp tới lạ. Ở khung hình thứ 812 có một con cú nhỏ xíu. Bạn không hiểu, nhưng thấy dễ thương._
    editor: *(quay về, mắt nhỏ thuốc)* Cảm ơn bà. Đẹp… à không, cảm ơn.
* [😶 "Tui đang bị sửa lần thứ 3, ông nhờ {thuc_tap_sinh} đi."]
    thuc_tap_sinh: Dạ em canh ạ! Mà cái nút lưu là nút nào ạ?
    _Bạn nghe tiếng {editor} hét nhỏ từ tận cầu thang._
    ~ qh("editor", -3)
* [🎨 Canh giùm, tiện chỉnh màu luôn cho đẹp hơn.]
    ~ qh("editor", -5)
    ~ ds_toi(3)
    editor: …Bà chỉnh màu clip tui hả? *(im lặng 5 giây)* …Ờ, đẹp hơn thật. Nhưng lần sau hỏi trước.
- -> END

// ------------------------------------------------------------
=== designer_0810_thu_do_moi ===
# ngay:8 # gio:15:00 # noi:studio
_Studio tầng 2. {sieu_nhan_hong} mặc bộ đồ mới bạn phác tuần trước._
sieu_nhan_hong: *(xoay một vòng)* Biến hình! Ờm… chị {designer} ơi, hồng vầy có đủ hông? Em thấy nó hơi… nhạt thái độ.
* [🎨 "Hồng vầy là sang rồi đó anh. Thêm nữa là thành kẹo bông gòn."]
    ~ ds_toi(10)
    sieu_nhan_hong: Dạ… *(buồn buồn)* chị là chuyên gia mà.
    _Tuần sau, poster đẹp hơn hẳn. Có người gọi tông hồng đó là "hồng có học"._
    ~ follow(10000)
* [🩷 "Vậy mình hồng từ đầu tới chân, hồng tới giày, hồng tới dây kéo luôn!"]
    ~ ds_toi(-10)
    ~ qh("sieu_nhan_hong", 15)
    sieu_nhan_hong: Đúng rồi! Slay! *(tạo dáng 5 kiểu liên tiếp)*
    _Khán giả chia hai phe: "quá đà" và "đỉnh nóc". Cãi nhau dưới bài đăng 400 bình luận._
    ~ follow(5000)
* [🐕 "Anh mặc bộ này ra cổng thử coi {cho} phản ứng sao."]
    _5 phút sau. {cho} lao ra như tên lửa, ngoạm gấu quần. Roẹt._
    cho: GRỪ! GÂU GÂU!
    sieu_nhan_hong: Ối! Ống quần em! Mà… có ai quay hông?
    hong_hot: Có! Lên Tóp-tóp liền!
    ~ follow(5000)
    ~ qh("cho", 3)
    _{sieu_nhan_hong} mất một ống quần. Bạn mất thêm một buổi tối để may lại._
    -> designer_mg_may_do_mo_dau
* {qh_sieu_nhan_hong >= 60} [🔒 "Anh có muốn một bộ… có thể tháo mũ được hông? Chỉ để anh thở thôi."]
    _{sieu_nhan_hong} đứng im rất lâu. Tiếng quạt trần kêu lạch cạch._
    sieu_nhan_hong: *(nói nhỏ, không tạo dáng)* Dạ… chưa phải lúc chị.
    sieu_nhan_hong: Nhưng… chị may giùm em một lớp lót mềm bên trong mũ được hông? Mùa này nóng.
    ~ ds_lot_mu = true
    ~ qh("sieu_nhan_hong", 10)
    _Bạn gật đầu. Lần đầu tiên, có người nhờ bạn thiết kế một thứ không ai thấy._
- -> END

// ------------------------------------------------------------
=== designer_0810_hong_ngoai ===
# ngay:8 # gio:23:00 # noi:can_203 # bat_buoc
_23 giờ. Laptop thứ hai sáng lên. Anh Lá Chuối._
la_chuoi: Job lớn nè em. 3 triệu. Nghệ sĩ mới, tông hồng phối xanh lá chuối. Gấp.
la_chuoi: Bộ nhận diện đầy đủ: logo, bìa hồ sơ, màn hình LED. Tên dự án: Hồng Ngoại.
_Hồng phối xanh lá chuối. Bạn nhíu mày. Ai mà xui dữ vậy, bị phối màu kiểu này._
_3 triệu. Gần bằng tiền thuê căn 203. Lương thì còn 4 ngày nữa mới về, nếu nó về._
* [🥬 "Dạ em nhận. Gửi brief đi anh."]
    ~ ds_nhan_hong_ngoai = true
    ~ ds_job_ll(1000000)
    ~ ds_cam(-10)
    la_chuoi: Cọc trước 1 triệu. Còn 2 triệu khi giao. Hạn chót: 25/10. Đừng hỏi nhiều nha em.
    _"Đừng hỏi nhiều" là câu bạn ghét thứ hai, sau "sửa nhẹ thôi"._
* [💬 "Nghệ sĩ nào vậy anh? Em cần biết để làm đúng gu."]
    la_chuoi: Idol mới, chưa debut. Bí mật. Mà sao em hỏi kỹ vậy? Em nhận hay không?
    ** [🥬 "Dạ nhận."]
        ~ ds_nhan_hong_ngoai = true
        ~ ds_job_ll(1000000)
        ~ ds_cam(-10)
        la_chuoi: Cọc 1 triệu nè. Hạn 25/10.
    ** [🧡 "Dạ thôi, em không làm việc mù."]
        ~ ds_cam(10)
        ~ ds_toi(5)
        la_chuoi: Tiếc ghê. Em suy nghĩ lại thì nhắn anh.
* [🧡 "Tháng này em bận chiến dịch công ty. Em xin phép."]
    ~ ds_cam(15)
    la_chuoi: Chiến dịch Siêu Nhân Hồng hả? *(đang soạn tin… rất lâu)* …Ok em. Cố lên.
    _Ba chấm "đang soạn tin" kéo dài 40 giây. Bạn thấy hơi lạnh gáy, rồi tắt máy._
- -> END

// ------------------------------------------------------------
=== designer_0910_thuc_trang ===
# ngay:9 # gio:05:30 # noi:can_203
_5 giờ 30. Bạn thức trắng làm thumbnail cho MV ra mắt tối nay. Cây lưỡi hổ nhìn bạn đầy thương hại._
_Ngoài trời bắt đầu sáng. Còn 1 việc: chọn ảnh bìa._
* [🎨 Tấm Nguyên đứng ngược sáng, tay giơ lên, không tạo dáng. Đẹp mà buồn.]
    ~ ds_toi(5)
    ~ ds_poster_mv_dep = true
* [🔥 Tấm Nguyên chu môi, chữ "BIẾN HÌNH!!!" vàng viền đỏ.]
    ~ ds_toi(-5)
    ~ ds_giat_tit = ds_giat_tit + 1
* [🤝 Gửi cả hai cho {hong_hot}, để bả chọn.]
    hong_hot: *(5 giờ 32, trả lời liền)* Tấm buồn! Buồn mới viral! Mà sao bà thức giờ này?
    designer: Còn bà?
    hong_hot: Tui hóng drama bên Hàn.
    ~ qh("hong_hot", 5)
    ~ ds_poster_mv_dep = true
- ~ nghi(-30)
~ nhan(ca_phe)
_Bạn pha một ly cà phê, uống hết, rồi pha thêm một ly để nhìn cho đỡ buồn ngủ._
-> END

// ------------------------------------------------------------
=== designer_0910_sieu_nhan_hon ===
# ngay:9 # gio:08:40 # noi:ban_thiet_ke # bat_buoc
_8 giờ 40. {hong_hot} chạy tới, mặt tái mét._
hong_hot: Bà ơi! Poster trên fanpage! Ai đổi rồi! Giờ nó ghi "SIÊU NHÂN HỒN"!
_Bạn mở lên. Chữ "Hồng" mất chữ "g". Font bị đổi sang Comic. Màu hồng lệch sang tím than. Như poster phim ma giá rẻ._
~ follow(-5000)
hong_hot: Tui đăng lúc 6 giờ sáng, file lấy từ thư mục chung. Lúc đó còn đúng mà!
{ ds_chi_thu_muc_cho_hieu:
    ~ ds_thu_pham = "ran_doc"
- else:
    ~ ds_thu_pham = ran_thu_hai
}
* [🔍 Soi Pixel. Mất một tiếng, nhưng phải biết ai.]
    ~ nghi(-10)
    -> soi
* [😮‍💨 Thay lại file đúng rồi thôi. Mệt quá, không truy nữa.]
    _Bạn thay file. 6.000 người đã kịp chụp màn hình "Siêu Nhân Hồn"._
    ~ cang_thang(5)
    -> END

= soi
_Bạn mở lịch sử file. Bản lỗi được lưu lúc 6 giờ 12 sáng._
{ ds_thu_pham == "ran_doc":
    _Máy lưu: "TRUYENTHONG-01", máy ở bàn Truyền thông nội bộ. Bạn nhớ ra hôm 1/10 có người hỏi bạn file gốc để thư mục nào._
- else:
    _Máy lưu là máy chung tầng 1. Nhưng trên bàn phím, bạn ngửi thấy một mùi nước hoa lạ, mùi lá chuối non. Bạn nhớ có người hôm qua xức đúng mùi này: {ten(ran_thu_hai)}._
}
_Hai cái tên lởn vởn trong đầu bạn._
* [🔍 "Là {ran_doc}."]
    { ds_thu_pham == "ran_doc":
        -> dung
    - else:
        -> sai_nguoi
    }
* {ran_thu_hai != "designer"} [🔍 "Là {ten(ran_thu_hai)}."]
    { ds_thu_pham == ran_thu_hai:
        -> dung
    - else:
        -> sai_nguoi
    }
* [😶 Chưa chắc. Ghi vào sổ, theo dõi thêm.]
    ~ cang_thang(3)
    _Bạn ghi hai cái tên vào trang cuối sổ phác thảo, cạnh hình con mèo hồng._
    -> END

= dung
~ ds_bat_duoc_ke_doi_file = true
~ follow(20000)
~ ds_toi(5)
~ uy_tin = uy_tin + 5
_Bạn đặt hai bản file cạnh nhau, khoanh đỏ từng điểm lệch, gửi riêng cho {truong_phong} và {it}. Không ồn ào, không group chung._
it: Log khớp. Đổi mật khẩu thư mục rồi. Lỗi người dùng… cố ý.
_Từ hôm nay, thư mục POSTER HỒNG có khóa. Người kia biết bạn đã biết. Đôi khi biết là đủ._
-> END

= sai_nguoi
~ cang_thang(10)
~ uy_tin = uy_tin - 5
_Bạn nhắn {truong_phong}. {it} kiểm tra log, lắc đầu: "Không phải. Lỗi người… đoán."_
_Người bị bạn nghi oan không biết gì. Người thật sự làm thì biết bạn đang đoán sai. Tệ hơn là không đoán._
-> END

// ------------------------------------------------------------
=== designer_0910_ngay_trung ===
# ngay:9 # gio:12:10 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng: trứng chiên, trứng luộc, trứng ốp la, trứng… sống._
sales: *(chụp story)* Detox trứng nha mọi người. Chị chủ động sống healthy.
designer: Em hết tiền phải hông?
sales: *(nhỏ giọng)* Dạ. Còn 47 nghìn tới ngày 10.
* [🤝 Chia nửa đĩa trứng chiên với {sales}.]
    ~ qh("sales", 8)
    ~ an(20)
    ~ tien_cong(-25000)
    sales: Chị Quỳnh, khi nào em giàu, em mua cho chị cả con gà.
* [🍳 Mua trứng luộc, ăn một mình, nhìn trứng thấy thương bản thân.]
    ~ an(25)
    ~ tien_cong(-15000)
- -> END

// ------------------------------------------------------------
=== designer_0910_ra_mat_mv ===
# ngay:9 # gio:19:00 # noi:phong_hop_sang_tao # bat_buoc
_19 giờ. MV đầu tiên của Siêu Nhân Hồng lên sóng. Cả công ty chen trong phòng họp, ăn bánh mì trứng, nhìn con số nhảy._
{ ds_poster_mv_dep:
    hong_hot: Ảnh bìa đẹp quá trời! Bình luận khen poster còn nhiều hơn khen bài hát nè!
    ~ follow(25000)
    ~ qh("hong_hot", 3)
- else:
    hong_hot: Ảnh bìa… ờm… nổi bật. Rất nổi bật.
    ~ follow(5000)
}
dan_dau_tu: *(nhìn điện thoại)* Ơ… có ai đó vừa tạo đồng coin tên Hồng Coin kìa. Sắp x10 rồi.
giam_doc: Các em thấy chưa? Siêu Nhân Hồng có cả tiền ảo rồi! Thành công rồi!
_{sieu_nhan_hong} ngồi cuối phòng, xem MV của chính mình, tay nắm chặt mép ghế._
* [😇 Đi tới ngồi cạnh: "Anh hồi hộp hả?"]
    ~ qh("sieu_nhan_hong", 8)
    sieu_nhan_hong: Dạ… em sợ người ta coi xong thấy… cũng thường.
    designer: Người thường mà dắt bà cụ qua đường giữa trưa nắng thì hông thường đâu anh.
    sieu_nhan_hong: *(im một lúc)* Chị nói câu đó… em nhớ lâu đó.
* [📱 Làm thêm một thumbnail đẩy MV lên xu hướng.]
    -> designer_mg_thumbnail_mo_dau
* [💸 Hỏi {dan_dau_tu} về Hồng Coin.]
    dan_dau_tu: Em vào 200 nghìn đi. Lần này là lên thật.
    ** [💸 Vào 200 nghìn cho vui.]
        ~ tien_cong(-200000)
        ~ ds_co_hong_coin = true
        dan_dau_tu: Chuẩn! Em có tầm nhìn!
        _Bạn có 200.000đ Hồng Coin. Bạn cũng có cảm giác mình vừa ném 200.000đ xuống Hồ Cá Mập._
    ** [😶 "Thôi anh, em còn tiền nhà."]
        dan_dau_tu: Tiền nhà là chi phí cơ hội đó em.
- -> END

// ------------------------------------------------------------
=== designer_1010_tu_lanh ===
# ngay:10 # gio:11:00 # noi:can_203
_Thứ 7, ngày 10. Ngày nhận lương. App ngân hàng: 0 đồng chưa về. Group Zalo-lô: 214 tin nhắn chưa đọc, toàn chữ "ủa"._
_Tủ lạnh căn 203 chỉ còn một hộp sữa chua và một trái chanh khô._
~ ds_cam(-10)
sales: *(nhắn)* Chị Quỳnh, lương trễ rồi. Tin chị đi, nhận job LL đi. Chị che cho.
sales: Em cũng hết tiền. Nhưng em có… niềm tin.
* [🥬 Mở laptop thứ hai. Anh Lá Chuối có job logo quán nướng.]
    -> designer_mg_alt_tab_mo_dau
* [🍜 Ăn hộp sữa chua. Uống nước chanh khô. Sống kiểu nghệ sĩ.]
    ~ an(10)
    ~ cang_thang(5)
    ~ ds_cam(3)
    _Bạn vẽ một bức tranh tĩnh vật: hộp sữa chua và trái chanh. Đặt tên: "Ngày 10 tháng 10"._
    ~ ds_toi(5)
* [🤝 Rủ {sales} qua căn 203, góp gạo nấu cơm chung.]
    ~ qh("sales", 10)
    ~ an(30)
    sales: Em mang gói mì "cao cấp" qua nha. Đựng trong bát sứ á.
    _Hai đứa ăn mì gói trong bát sứ, dưới ánh nến (vì đèn hư). {sales} chụp story: "Bữa tối cùng đối tác chiến lược."_
- -> END

// ------------------------------------------------------------
=== designer_1110_anh_hoi_nho ===
# ngay:11 # gio:10:00 # noi:can_203
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ._
_Bạn lục được tấm ảnh năm 5 tuổi: cầm bút sáp vẽ con cá voi hồng lên tường nhà hàng xóm._
* [📸 Đăng tấm vẽ bậy lên tường.]
    truong_phong: *(bình luận)* Từ bé đã thích sửa nhà người khác nhỉ.
    hong_hot: *(bình luận)* Hahaha anh {truong_phong} ơi, ai sửa ai chưa biết đâu nha!
    ~ qh("hong_hot", 3)
    ~ cang_thang(-5)
    _Bạn trả lời: "Dạ hồi đó không ai bắt em sửa con cá voi hết." 47 lượt thích. Kỷ lục._
* [🎨 Vẽ lại tấm ảnh bằng tay, đăng bản vẽ.]
    ~ ds_toi(5)
    sieu_nhan_hong: *(bình luận)* Đẹp quá chị ơi! Con cá voi hồng! Hồng là thái độ!
    ~ qh("sieu_nhan_hong", 5)
* [😶 Không đăng. Lướt xem ảnh người khác.]
    _Bạn thấy {sieu_nhan_hong} đăng ảnh xóm cũ, một đám con nít ở một xóm có cây me to. Góc ảnh có một thằng nhỏ đang khóc. Bạn không hiểu sao mình nhìn tấm đó lâu vậy._
- -> END

// ------------------------------------------------------------
=== designer_1210_giao_ban ===
# ngay:12 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2. Lương vẫn chưa về lúc 8 giờ 30. {truong_phong} mở slide số 1: "Tinh thần trách nhiệm"._
truong_phong: Lương là chuyện của ngân hàng. Còn poster là chuyện của mình nhé. Quỳnh, tuần này em ra 12 poster.
* [💬 "Dạ 12 poster, anh cho em xin 12 brief luôn được hông ạ?"]
    truong_phong: Brief thì… mình họp nhanh để ra brief nhé.
    ~ nghi(-10)
    ~ ds_toi(3)
* [🧂 "Dạ lương về thì em ra 12. Chưa về thì em ra 1, phóng to 12 lần."]
    _Cả phòng nín cười. {chua_te_deadline} cười thành tiếng. {truong_phong} đỏ mặt._
    ~ qh("truong_phong", -8)
    ~ qh("chua_te_deadline", 5)
    ~ ds_toi(5)
    ~ cang_thang(-5)
* [😇 "Dạ em làm."]
    ~ qh("truong_phong", 5)
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== designer_1210_luong_ve ===
# ngay:12 # gio:10:45 # noi:ban_thiet_ke # bat_buoc
_10 giờ 45. Điện thoại "ting". Lương về. Cả tầng 1 vang lên một tiếng "Á!" đồng thanh, như vừa ghi bàn._
~ tien_cong(13000000)
~ cang_thang(-10)
_Ở cửa, {con_ong_chau_cha} quẹt thẻ mua trà sữa cho cả phòng. Thẻ bị từ chối. Lần thứ hai. Lần thứ ba._
con_ong_chau_cha: Ủa? Thẻ phụ của chú anh mà. Chắc máy lỗi. Để anh gọi chú anh.
_{thuc_tap_sinh} bước tới, rút thẻ của mình ra thanh toán. Thẻ màu bạc, viền kim cương lấp lánh. Cả phòng đứng hình._
thuc_tap_sinh: Dạ… thẻ… thẻ em lượm được ạ! À không, thẻ em… mượn ạ!
* [🔍 Nhìn kỹ cái thẻ. Hạng kim cương mà lương thực tập 4 triệu?]
    ~ phat_hien(duy_tung_lam_ngan_hang)
    _Bạn để ý tên ngân hàng trên thẻ, và cách {thuc_tap_sinh} cầm nó, rất quen tay. Có chuyện._
    ~ qh("thuc_tap_sinh", 2)
* [😇 "Thôi để em trả phần em." Đưa tiền mặt cho {thuc_tap_sinh}.]
    ~ tien_cong(-35000)
    ~ qh("thuc_tap_sinh", 8)
    thuc_tap_sinh: Dạ không cần đâu chị! Dạ… dạ em cảm ơn chị.
- ~ nhan(tra_sua)
~ uong(20)
-> END

// ------------------------------------------------------------
=== designer_1210_toi_tra_no ===
# ngay:12 # gio:20:00 # noi:can_203
_Tối. Bạn chuyển tiền nhà, tiền điện, tiền nước. Còn lại một con số làm bạn muốn tưới thêm cây cho đỡ buồn._
~ tien_cong(-6500000)
la_chuoi: Em ơi, Hồng Ngoại sao rồi? Bên anh hối. Thêm job banner nhỏ 800 nghìn nè.
{ not ds_nhan_hong_ngoai:
    _Bạn không nhận Hồng Ngoại. Anh Lá Chuối vẫn nhắn như thể bạn đã nhận. Lạ._
}
* {ds_nhan_hong_ngoai} [🥬 Làm tiếp file Hồng Ngoại. Logo xong 70%.]
    ~ ds_cam(-3)
    ~ nghi(-20)
    _Logo Hồng Ngoại: một vệt hồng xoắn trong một chiếc lá chuối. Đẹp, phải thừa nhận. Bạn ghét việc nó đẹp._
* [🥬 Nhận job banner 800 nghìn.]
    -> designer_mg_alt_tab_mo_dau
* [🧡 "Tối nay em nghỉ anh ơi." Tắt laptop thứ hai.]
    ~ ds_cam(5)
    ~ nghi(15)
- -> END

// ------------------------------------------------------------
=== designer_1310_bang_khen ===
# ngay:13 # gio:09:00 # noi:phong_giam_doc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho mình. {thanh_ninh} đọc bài phát biểu khen 15 phút, có cả đoạn so sánh sếp với mặt trời._
thanh_ninh: …và như mặt trời, anh {giam_doc} chưa bao giờ đi làm trễ trong tim mỗi chúng em!
giam_doc: *(lau nước mắt)* Hay quá, em viết hay quá.
_{sales} kéo tay bạn ra hành lang, mặt hừng hực quyết tâm._
sales: Chị Quỳnh. Em không chịu thua. Em cần một cái bằng khen. "Doanh nhân của năm", do BTT Global trao tặng. 30 phút.
* [🗂️ Làm. Viền vàng, con dấu đỏ, chữ ký Kevin Trộn bay bổng.]
    ~ qh("sales", 10)
    ~ ds_toi(-2)
    _25 phút sau, bằng khen được in, đóng khung. {giam_doc} cầm lên, mắt sáng như đèn LED._
    giam_doc: Tập đoàn quốc tế công nhận anh! Treo lên! Treo chỗ dễ thấy nhất!
    _Nó được treo trên tường phòng giám đốc. Ngay cạnh cửa sổ. Ai đi ngang cũng thấy._
    _Bạn có cảm giác vừa ký tên mình vào một quả bom hẹn giờ. Tên file: "QuynhDesign"._
* [💬 "Huyền, cái này treo lên tường sếp đó. Lỡ ai tra BTT thì sao?"]
    sales: Ai rảnh mà tra chị ơi! *(dừng lại)* …Thôi được. Làm đơn giản thôi, không con dấu.
    ~ qh("sales", 3)
    ~ ds_toi(2)
    _Bằng khen không con dấu. {giam_doc} vẫn treo lên, vẫn khen. Ít nhất là không có dấu giả._
* [😇 "Chị không làm cái này được em ơi."]
    ~ qh("sales", -10)
    ~ ds_cam(3)
    sales: *(im lặng 3 giây)* Ờ. Thôi em tự làm bằng Paint.
    _Bằng khen bằng Paint, font Times New Roman, chữ ký vẽ bằng chuột. {giam_doc} vẫn treo. Bạn thấy đau mắt mỗi khi đi ngang._
- -> END

// ------------------------------------------------------------
=== designer_1410_long_duyet_poster ===
# ngay:14 # gio:14:00 # noi:phong_hop_sang_tao # bat_buoc
_Mốc 2: 200.000 người theo dõi. {con_ong_chau_cha} bước vào phòng, kính râm cài trên tóc._
con_ong_chau_cha: Poster đợt này để anh duyệt nha. Marketing là phòng anh mà. Chill thôi.
_Bạn gửi Ba Bản Mồi theo thói quen: hai bản cố tình xấu, một bản bạn muốn._
con_ong_chau_cha: *(chỉ ngay bản xấu nhất, chữ cầu vồng, nền kim tuyến)* Cái này nè. Nhìn nó chill.
{ nguoi_theo_doi >= 200000:
    _Con số trên màn hình: {nguoi_theo_doi}. Vượt mốc 2. Nhưng poster tiếp theo sẽ là bản kim tuyến._
- else:
    _Con số trên màn hình: {nguoi_theo_doi}. Chưa tới mốc 2. {sieu_nhan_hong} đã buồn bỏ đi giúp người cả ngày._
}
* [🎨 Cãi: "Anh {con_ong_chau_cha}, bản đó em làm để… so sánh thôi."]
    con_ong_chau_cha: Ủa vậy hả? Vậy mà anh thấy nó đẹp nhất. Thôi tùy em, anh không ép. *(cười)* Câu của chú anh đó.
    ~ ds_toi(10)
    ~ qh("con_ong_chau_cha", -3)
    ~ follow(10000)
* [🤝 Nhắn {truong_phong}: "Anh ơi, phòng mình bị lấn sân."]
    truong_phong: *(xuất hiện sau 40 giây, thở hổn hển)* Long, poster là việc của phòng Sản xuất. Mình họp nhanh nhé.
    con_ong_chau_cha: Chill đi Nhật. Thì lấy bản của em ấy.
    _{truong_phong} thắng. Lần đầu tiên bạn thấy {truong_phong} cười như vừa được đề bạt._
    ~ qh("truong_phong", 10)
    ~ qh("con_ong_chau_cha", -5)
    ~ follow(10000)
    ~ ds_toi(5)
* [😶 Im lặng. In bản kim tuyến.]
    ~ ds_toi(-15)
    ~ ds_sua(3)
    ~ follow(-5000)
    _Poster kim tuyến lên fanpage. Bình luận: "Admin bị hack hả?"._
- -> END
