// ============================================================
// CHƯƠNG 2: "HỒNG HÓA VIỆT NAM" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== sieu_nhan_hong_0510_hoa_nha_giao ===
# ngay:5 # gio:09:30 # noi:tang_1
_Ngày Nhà giáo Thế giới. {thuc_tap_sinh} phát hoa cho "thầy cô" khắp phòng. Tới bạn, cậu ta ngập ngừng._
thuc_tap_sinh: Dạ… anh không phải nhân viên… mà anh dạy em một điều ạ: mặc gì cũng được, miễn tự tin. Em tặng anh ạ.
* [🦸 "Cảm ơn em! Hồng là thái độ, hoa là… cũng là thái độ!"]
    ~ qh("thuc_tap_sinh", 5)
    ~ follow(1000)
* [🙂 Nhận hoa bằng hai tay, cúi đầu.]
    thuc_tap_sinh: *(bối rối)* Dạ… anh cúi chi vậy anh…
    ~ qh("thuc_tap_sinh", 10)
- _Bạn cầm bông hoa đi ngang bàn {chua_te_deadline}. Cậu ta đang ngủ, mặt úp lên bàn phím, màn hình đầy chữ "jjjjjjjjj"._
* [🎁 Cắm bông hoa vào ly bút trên bàn cậu ta, không đánh thức.]
    ~ snh_tim(4)
    _Chiều, cậu ta thức dậy, nhìn bông hoa, nhìn quanh. Không biết ai. Nhưng không vứt._
* [🎁 Gọi {hong_hot} quay lại cảnh mình tặng hoa cho người đang ngủ.]
    ~ snh_qua_truoc_camera = true
    ~ follow(2000)
    hong_hot: Ối dồi ôi, siêu nhân tặng hoa cho chúa tể deadline đang ngủ! Đám cá tươi!
    chua_te_deadline: *(tỉnh dậy, chói đèn)* …Hả? Quay gì vậy? À, PR hả anh. Ok ok.
    ~ snh_tim(-2)
* [😶 Giữ bông hoa cho mình.]
    _Bạn đem bông hoa về nhà, cắm vào cái ly giữa bàn 12 ghế. Nhà có thêm một thứ còn sống._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0610_chup_poster ===
# ngay:6 # gio:09:30 # noi:studio_tang_2 # bat_buoc
_Buổi chụp poster đầu tiên. {designer} cầm bản phác, 10 kiểu dáng, mỗi kiểu 3 giây. {cho} nằm canh ở cửa studio, mắt không rời bộ đồ hồng._
designer: Anh ơi, mình làm 10 kiểu nha. Đúng hình là được, sai là sửa. Mà em ghét sửa lắm.
quan_ly_idol: *(điện thoại kẹp vai)* Chụp nhanh nhé. 11 giờ anh có lịch khác cho em.
* [🦸 Khởi động: xoay cổ, xoay tay, hô "Biến hình!" ba lần.]
    designer: *(bịt tai)* Một lần là đủ rồi anh…
    ~ follow(1000)
* [💬 "Em cho anh xin feedback cụ thể trước được hông? Anh sợ làm em sửa."]
    designer: *(sững người)* Anh… là người đầu tiên hỏi câu đó. Ok: cằm hơi nâng, tay không quá vai, đừng cười quá tám cái răng.
    ~ qh("designer", 10)
* [🐕 Nháy mắt với {cho} ở cửa: "Lát em lên hình chung với anh nha!"]
    ~ snh_choc_tuat()
    cho: GRỪ… *(đứng dậy, đi vòng vòng ngoài cửa như đang tính kế)*
- _{designer} giơ bản phác đầu tiên. Đèn flash nổ._
-> sieu_nhan_hong_mg_poster

// ------------------------------------------------------------
=== sieu_nhan_hong_0610_ba_cu ===
# ngay:6 # gio:10:30 # noi:duong_truoc_cong_ty # bat_buoc
_10 giờ 30. Đang chụp dở. Qua cửa sổ studio, bạn thấy dưới Đường Hóng, gần đầu Hẻm 69, một chiếc xe chè kẹt bánh trong ổ gà. Một bà cụ tóc bạc đang cố đẩy. Xe cộ bóp còi inh ỏi._
_Bạn biết chiếc xe đó. Bóng đèn vàng treo trên cành me. Sáu cái ghế nhựa thấp xếp chồng bên hông. Xe chè của Bà Bảy._
designer: Anh ơi, còn 7 kiểu nữa!
* [🆘 "Khoan! Ngoài kia có người cần giúp! Điều khoản số 3!" *(chạy biến)*]
    ~ snh_bo_chup_giup_ba_cu = true
    ~ snh_giup_nguoi()
    ~ qh("designer", -5)
    _Bạn chạy xuống, nguyên bộ đồ hồng, quỳ giữa nắng, nhấc bánh xe ra khỏi ổ gà. Nồi chè đậu trắng sóng sánh mà không đổ giọt nào._
    -> sieu_nhan_hong_0610_xe_che
* [📸 Nhờ {hong_hot} quay, rồi mới chạy xuống.]
    ~ snh_giup_nguoi()
    hong_hot: Ok ok! Em quay rồi! Anh chạy đi!
    ~ snh_bo_chup_giup_ba_cu = true
    _Bạn đẩy xe ra khỏi ổ gà. Clip rõ nét, góc đẹp. Nhưng lúc xem lại, bạn thấy mình… tạo dáng ở giây thứ 12._
    ~ snh_no(2)
    -> sieu_nhan_hong_0610_xe_che
* [😶 Làm tiếp buổi chụp. Có người khác giúp rồi.]
    _Bạn nhìn xuống. Một anh shipper đã dừng xe, đẩy giùm. Một cô gái buộc tóc bằng sợi thun chạy từ trong hẻm ra, đỡ lấy bà cụ. Bạn chụp tiếp kiểu thứ 4. Mắt cứ nhìn ra cửa sổ._
    ~ snh_no(5)
    ~ qh("designer", 5)
    -> END

= sieu_nhan_hong_0610_xe_che
ba_bay: Con đeo cái mũ chi cho nóng vậy con? Mà thôi, đẹp. Cảm ơn con nha.
_Từ trong hẻm, một cô gái buộc tóc bằng sợi thun chạy ra, tay còn cầm cái vá. Mai. Cô đỡ bà Bảy, rồi quay sang cảm ơn bộ đồ hồng._
mai: Cảm ơn anh siêu nhân nha. Bà em cứ đòi tự đẩy, nói hoài hông nghe.
* ["Dạ… ờm… hông có chi. Bà đi chậm thôi nha bà."]
    _Bạn nói bằng giọng thật. Quên mất là phải nói giọng siêu nhân._
    _Mai khựng lại. Nhìn cái mũ hồng. Nhìn đôi dép lê bạn quên chưa thay ra giày. Nghiêng đầu._
    mai: Khoan. Cái giọng này… "Dạ ờm"… Anh ăn chè khuya đó hả?
    ~ snh_mai_nhan_ra = true
    ~ snh_gan_mai(2)
    * * [Đưa ngón tay lên trước cái mũ: "Suỵt."]
        mai: *(bật cười, lấy tay che miệng)* Trời đất. Vậy mà tuần nào cũng thối anh 2 nghìn.
        _Mai không la lên. Không giơ điện thoại. Chỉ múc cho bạn một ly chè đậu trắng, cắm một cái ống hút thật dài._
    * * ["Hông phải đâu. Anh là… Siêu Nhân Hồng!" *(tạo dáng)*]
        mai: Dạ, Siêu Nhân Hồng. *(gật đầu rất nghiêm túc)* Siêu Nhân Hồng ăn chè gì?
        _Câu đó. Ngay cả khi bạn đang đội mũ._
        ~ snh_gan_mai(1)
    - - _Bạn luồn ống hút qua khe mũ, ăn chè giữa vỉa hè. Bà Bảy cười móm mém. Ở trên lầu, {designer} gõ cửa kính, chỉ đồng hồ._
* [🦸 "Vì công lý và lượt view!" *(tạo dáng, giọng siêu nhân)*]
    ~ follow(1000)
    mai: *(cười lịch sự)* Dạ. Cảm ơn anh.
    _Mai đỡ bà vào hẻm. Bạn đứng nhìn theo. Lần đầu tiên bạn thấy cái giọng siêu nhân của mình nghe hơi… lạc lõng._
- -> END

// ------------------------------------------------------------
// Lần chính Tuất đi lạc (sổ tay sự thật mục 9): Tuất đuổi theo bộ đồ hồng rồi lạc, Nguyên bế về.
=== sieu_nhan_hong_0610_tuat_lac ===
# ngay:6 # gio:11:30 # noi:cong_cong_ty # bat_buoc
_11 giờ 30. Chụp xong kiểu thứ 10. Bạn xuống cổng thì thấy Bác {bac_bao_ve} đứng giữa đường, tay che nắng, gọi khắp phố._
bac_bao_ve: {cho} ơi! {cho}! *(quay sang bạn)* Nó chạy theo cái bộ đồ hồng của cậu từ lúc mười rưỡi. Bác tưởng nó về rồi. Chưa về.
_Bạn chạy dọc Đường Hóng. Qua đầu Hẻm 69, Mai đứng ở xe chè chỉ tay về phía chợ: "Con chó vàng chạy hướng kia đó anh!"_
_Qua ba ngã tư. Qua cái chợ. Rồi bạn thấy {cho}: ngồi co ro giữa ngã tư, tai cụp, run run, mũi hít về đủ mọi hướng mà không hướng nào đúng._
cho: …Ẳng.
* [🙂 Ngồi xổm xuống, tháo áo choàng hồng quấn quanh {cho}, bế về.]
    ~ snh_cong_tuat_ve = true
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 10)
    _Ba ngã tư. Không gọi xe. Không ai quay. {cho} gầm gừ suốt quãng đường đầu, rồi im, rồi gục mõm lên vai bạn._
* [Chạy vào tiệm tạp hóa đầu chợ, mua một bịch xúc xích, dỗ {cho} trước.]
    ~ nhan(xuc_xich)
    ~ snh_cat_xe(-30000)
    ~ snh_cho_xuc_xich()
    ~ snh_cong_tuat_ve = true
    ~ qh("cho", 10)
    ~ qh("bac_bao_ve", 10)
    _{cho} ăn một cây, vẫn gầm gừ, nhưng để bạn bế. Bịch xúc xích còn lại nằm trong túi áo choàng. Bạn có cảm giác sẽ còn cần tới nó._
* [🦸 Gọi điện cho bác {bac_bao_ve}, đứng canh {cho} tới khi bác tới.]
    ~ qh("cho", 3)
    ~ qh("bac_bao_ve", 5)
    _Bạn đứng canh, giơ tay chặn xe cho {cho} khỏi chạy ra đường. Mười lăm phút sau bác đạp xe tới. {cho} nhảy vào giỏ xe, không thèm nhìn bạn._
- _Về tới cổng, bác đỡ lấy {cho}, nhìn bạn rất lâu._
bac_bao_ve: Cảm ơn cậu. Nó lạc thì bác không biết tìm đâu.
{ not co(xuc_xich):
    _Bác lục ngăn bàn, dúi vào tay bạn một bịch xúc xích còn nguyên._
    bac_bao_ve: Cậu cầm lấy. Lần sau gặp nó thì đưa một cây. Ăn của ai thì nó nhớ người ấy.
    ~ nhan(xuc_xich)
}
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0610_clip_lan ===
# ngay:6 # gio:20:30 # noi:nha_nguyen
{ not snh_bo_chup_giup_ba_cu:
    _Tối. Clip một anh shipper đẩy xe chè giùm bà cụ ở đầu Hẻm 69 đang lan trên Tóp-tóp. Bạn xem đi xem lại. Lẽ ra người đó là bạn._
    ~ snh_no(2)
    -> END
}
_Tối. Clip bạn đẩy xe chè của Bà Bảy ra khỏi ổ gà, rồi ăn chè bằng ống hút luồn qua mũ, đang lan trên Tóp-tóp. 50.000 lượt xem… 200.000…_
_Tin nhắn từ {dan_dau_tu}: "Anh ơi, em nhìn chart rồi. Clip này đăng lại 21:07, kèm nhạc buồn, là x4. Lần này là lên thật."_
* [🤝 "Em làm đi. Mà đừng cắt mặt bà cụ, bà không thích."]
    dan_dau_tu: Dạ! Có người giao việc thật cho em! Em làm liền!
    ~ follow(40000)
    ~ qh("dan_dau_tu", 10)
    _Clip vượt 1 triệu lượt xem trong đêm. Gấp 12 lần cái MV còn chưa ra mắt. Người ta không thích Siêu Nhân Hồng tạo dáng. Người ta thích Siêu Nhân Hồng quỳ xuống giữa nắng, rồi ngồi ăn chè trên ghế nhựa thấp._
* [🙂 "Thôi em. Cứ để vậy. Anh hông muốn câu view từ bà cụ."]
    dan_dau_tu: Dạ… anh tốt quá. Mà phí quá anh ơi.
    ~ snh_no(-3)
    ~ snh_tim(2)
    _Sáng hôm sau, {chua_te_deadline} nhắn bạn lần đầu tiên: "Clip đó thiệt hả anh? Hay dàn dựng?"_
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0710_moc_50k ===
# ngay:7 # gio:17:00 # noi:tang_1 # bat_buoc
_Mốc 1: 50.000 người theo dõi._
{ nguoi_theo_doi >= 50000:
    _Màn hình hiện {nguoi_theo_doi}. Cả tầng 1 vỗ tay. {giam_doc} rót cho từng người một chút nước ngọt._
    giam_doc: Đấy! Mindset đúng thì số tự lên!
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
- else:
    _Màn hình hiện {nguoi_theo_doi}. Không đạt. {giam_doc} đỏ mặt, gọi cả công ty lên họp khẩn "truyền lửa" 3 tiếng._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
    _Ai cũng liếc bạn. Không ai trách. Nhưng ai cũng liếc._
    ~ cang_thang(10)
}
* [🦸 Đứng lên bàn, tạo dáng: "Mốc sau mình gấp đôi! Gét gô!"]
    ~ follow(1000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
    _Cái bàn hơi lung lay. Không ai cười. Rồi {hong_hot} cười. Rồi cả phòng cười. Được._
* [🙂 Đi xuống pantry, mua nước cho từng người.]
    ~ snh_cat_xe(-200000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    chi_dai: Em biết điều. Mà lần sau đừng mua nước ngọt, mua nước suối. Tụi nó béo hết rồi.
    ~ qh("chi_dai", 5)
* [😶 Đứng nhìn con số.]
    _Bạn nhìn con số rất lâu. Ở nhà, không ai đếm bạn. Ở đây, cả công ty đếm._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0810_tap_nhay ===
# ngay:8 # gio:14:00 # noi:san_thuong
_Ngày Thị giác Thế giới. {editor} bị lôi đi khám mắt. Còn bạn bị {hong_hot} lôi lên sân thượng tập nhảy trend Tóp-tóp._
hong_hot: Anh ơi, trend này đang hot! Nhịp 1-2-3-xoay-chỉ tay. Mặc bộ đồ đó nhảy khó gấp đôi đó nha. Em quay đây!
* [🙂 "Cho anh tập không mũ một lần trước được hông? Em quay lưng đi."]
    hong_hot: *(quay lưng thật)* Ok ok. Tui không nhìn. Thề. Mà tui nghe tiếng anh thở dốc á nha.
    ~ snh_thao_mu(false)
    _Không mũ, bạn nhảy đúng nhịp ngay lần đầu. Gió sân thượng mát rượi. Rồi bạn đội mũ lại, và mọi thứ khó gấp đôi._
    ~ qh("hong_hot", 5)
* [🦸 "Không cần tập! Siêu nhân sinh ra để nhảy!"]
    hong_hot: Tự tin dữ ha! Ối dồi ôi, quay liền!
* [💬 "Hôm nay {editor} đi khám mắt rồi hả? Ai dựng clip này?"]
    hong_hot: Tui tự dựng. Dở thì kệ. {editor} mà thấy chắc ổng xỉu, khỏi cần khám mắt luôn.
    ~ qh("hong_hot", 3)
- hong_hot: Rồi! Nhạc lên!
-> sieu_nhan_hong_mg_tiktok

// ------------------------------------------------------------
=== sieu_nhan_hong_0910_ra_mat_mv ===
# ngay:9 # gio:20:00 # noi:studio_tang_2 # bat_buoc
_20 giờ. MV "Hồng Hóa Việt Nam" lên kênh Tóp-tóp và Diu-túp của công ty. Ngày Trứng Thế giới, căn tin chỉ bán trứng, nên tiệc ra mắt ở studio có… trứng ốp la hình trái tim._
_Nhạc lên. Bộ đồ hồng lướt giữa phố, khói màu, pháo giấy. Bạn đứng xem chính mình trên màn hình lớn._
giam_doc: Đấy! Đấy là vision!
idol_het_thoi: *(ngồi hàng cuối, kính đen)* Hát nhép. Thời anh toàn hát live.
* [🦸 Đi bắt tay từng người: "Cảm ơn cả nhà! Hồng không phải màu, Hồng là thái độ!"]
    ~ follow(1000)
    _Tới {ran_doc}, bạn giơ tay đập tay. Cậu ta để tay bạn lơ lửng 2 giây rồi mới đập. Chắc cậu ta ngại._
    ~ snh_hieu(3)
* [🙂 Đi tới hàng cuối, ngồi cạnh {idol_het_thoi}: "Anh hát live hay hơn em nhiều. Em biết mà."]
    idol_het_thoi: *(gỡ kính, nhìn bạn)* …Em nói thật hả?
    idol_het_thoi: Em biết anh là ai không?
    _Bạn gật đầu. "Công Viên". Năm 2015. Ai mà không biết._
    ~ qh("idol_het_thoi", 15)
* [🎁 Tìm {chua_te_deadline}: "Cảm ơn em đã chạy tiến độ MV kịp!" kèm một hộp bánh hồng.]
    chua_te_deadline: Kịp đâu anh, em làm trong 1 đêm. Mà kịp thiệt. *(nhận bánh)* Chiêu này… dễ thương đó.
    ~ snh_tim(4)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0910_livestream_dau ===
# ngay:9 # gio:20:40 # noi:studio_tang_2 # bat_buoc
_Sau MV là livestream bán hàng đầu tiên. {sales} bày lên bàn: nước tăng lực "Hồng Hào", bàn chải "Răng Hồng"._
sales: Anh ơi, hoa hồng 10% nha. Tin chị đi, đêm nay chốt nghìn đơn!
it: *(đeo tai nghe)* Mạng ổn. Đừng ai mở Tóp-tóp.
_Bình luận đã bắt đầu chạy trước cả khi lên sóng: "Lộ mặt đi anh ơi", "Tháo mũ đi", "Mặt thật đâu?"._
* [💬 Hỏi nhỏ {sales}: "Nước tăng lực Hồng Hào… uống vô có hồng hào thật hông em?"]
    sales: Tin chị đi! *(ngừng)* …Thì cũng có màu hồng mà anh.
    ~ qh("sales", 3)
* [🙂 Nhờ {it}: "Anh lọc giùm em mấy bình luận đòi lộ mặt được hông?"]
    it: Được. Lọc từ khóa "mặt". *(gõ)* Giờ người ta sẽ viết "m.ặ.t".
    ~ snh_mat(-3)
    ~ qh("it", 5)
* [🦸 Tạo dáng chờ lên sóng.]
    ~ follow(1000)
- it: Lên sóng. 3… 2… 1.
-> sieu_nhan_hong_mg_livestream

// ------------------------------------------------------------
=== sieu_nhan_hong_0910_hong_coin ===
# ngay:9 # gio:23:30 # noi:nha_nguyen
_Gần nửa đêm. Điện thoại rung liên tục. Có ai đó vừa tạo một đồng coin tên "Hồng Coin", ký hiệu HONG. Mang tên bạn._
_{dan_dau_tu} nhắn: "Anh ơi! Có phải anh tạo hông? Nếu phải thì anh chỉ em, em all-in!"_
* [🙂 "Hông phải anh. Em đừng bỏ tiền vô nha."]
    dan_dau_tu: Dạ… dạ em bỏ ít thôi. Một ít. Một ít xíu.
    ~ qh("dan_dau_tu", 5)
    _Ít xíu của {dan_dau_tu} là bao nhiêu, bạn không dám hỏi._
* [🦸 Đăng bài: "Hồng không bán coin! Hồng chỉ bán… thái độ!"]
    ~ follow(2000)
    _Bài đăng được 5.000 lượt thích. Coin vẫn tăng. Người ta nghĩ bạn đang úp mở._
* [😶 Tắt điện thoại.]
    _Bạn tắt điện thoại. Đồng coin mang tên bạn vẫn chạy, không cần bạn._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1010_luong_tre ===
# ngay:10 # gio:11:00 # noi:pantry # bat_buoc
_Thứ 7, ngày 10. Ngày nhận lương. Lương chưa về. Bạn ghé công ty lấy đồ, nghe tiếng ai đó nói nhỏ ở pantry._
thuc_tap_sinh: *(nói điện thoại)* Dạ… dạ cho em mượn tạm 100 nghìn ăn cơm tới thứ 2 được không ạ… dạ không sao, em hỏi người khác…
_Group Zalo-lô công ty: 87 tin nhắn trong 1 tiếng. "Lương đâu?", "Ét o ét", "Còn 37 nghìn"._
* [💸 Chuyển tiền trả lương hộ cả công ty bằng Két Vé Số.]
    ~ snh_tra_luong_ho = true
    ~ snh_ket(30)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 15
    ke_toan: *(gọi điện, giọng run)* Anh… anh vừa chuyển cho công ty một khoản… anh lấy tiền đâu ra nhiều vậy anh?
    _Bạn cười, nói "tiền tiết kiệm". {ke_toan} im lặng rất lâu. Rồi ghi vào sổ._
    ~ qh("ke_toan", 5)
* [🥖 Đặt bánh mì cho cả công ty bằng Ví Cát-xê.]
    ~ snh_cat_xe(-600000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ qh("thuc_tap_sinh", 10)
    thuc_tap_sinh: *(cầm ổ bánh mì)* Dạ… cảm ơn anh. Ổ bánh mì này em nhớ cả đời ạ.
    _Cô Bảy bánh mì đầu Hẻm 69 bán hết sạch trong một buổi sáng, lần đầu tiên trong năm._
* [🤝 Đưa riêng cho {thuc_tap_sinh} 200 nghìn, không nói ai.]
    ~ snh_cat_xe(-200000)
    ~ qh("thuc_tap_sinh", 15)
    thuc_tap_sinh: Dạ… em trả anh thứ 2 ạ. Em… em hứa.
    _Bạn không biết {thuc_tap_sinh} có một cái thẻ kim cương. {thuc_tap_sinh} cũng không biết bạn có cả một két sắt. Hai người giàu giả làm nghèo, đưa nhau 200 nghìn._
* [😶 Không làm gì.]
    _Bạn lặng lẽ đi ra. Tiền thì có. Nhưng dùng nó thì người ta sẽ hỏi. Bạn sợ câu hỏi đó hơn sợ thấy người khác đói._
    ~ snh_no(3)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1010_sinh_nhat_bac_binh ===
# ngay:10 # gio:16:30 # noi:choi_bao_ve # dieu_kien:qh_bac_bao_ve>=10
_Chòi bảo vệ. Bác {bac_bao_ve} ngồi một mình, trước mặt là ly trà và một tờ lịch cũ. Ngày 10/10 khoanh bút đỏ. Bên cạnh có chữ "G": "Chúc mừng 50 tuổi"._
* [🙂 Tháo mũ, ngồi xuống: "Bác ơi, hôm nay sinh nhật bác hả?"]
    ~ snh_thao_mu(false)
    bac_bao_ve: *(nhìn gương mặt bạn rất lâu)* …Thế à. Cậu biết à. Mặt cậu hiền hơn cái mũ đấy.
    bac_bao_ve: Đừng nói với ai. Bác không thích ồn.
    ~ qh("bac_bao_ve", 20)
    _Hai người ngồi uống trà. Bác không hỏi gì về cái mũ. Bạn không hỏi gì về chữ "G"._
* [🦸 Hát "Happy Birthday" thật to, tạo dáng.]
    bac_bao_ve: Thôi thôi! *(xua tay, đỏ mặt)* Cậu làm cả phố nhìn.
    cho: GÂU GÂU!
    ~ qh("bac_bao_ve", 5)
    ~ qh("cho", -3)
* {co(xuc_xich)} [🦴 Tặng bác… và {cho} một cây xúc xích.]
    ~ snh_cho_xuc_xich()
    bac_bao_ve: Cậu tặng sinh nhật bác mà đưa xúc xích cho con chó à? *(cười lần đầu tiên)*
    ~ qh("bac_bao_ve", 10)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1110_anh_cay_me ===
# ngay:11 # gio:20:00 # noi:nha_nguyen # bat_buoc
_Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {thuc_tap_sinh} đăng ảnh đeo cà vạt từ năm 6 tuổi. {chi_dai} đăng ảnh cầm chổi, mặt rất ngầu._
_Bạn lục hộp ảnh cũ. Tìm được một tấm: xóm Cây Me, một đám con nít trước cây me to. Đứa cao nhất là bạn, quàng khăn đỏ làm áo choàng._
_Góc ảnh có một thằng nhóc gầy nhom, mặt lấm lem, đang khóc. Bạn nhìn thằng nhóc đó rất lâu. Bạn không nhớ tên nó._
* [📤 Đăng: "Hồi nhỏ Hồng ở một cái xóm có cây me to lắm nè!"]
    ~ snh_dang_anh_cay_me = true
    ~ snh_no(10)
    ~ follow(2000)
    ~ snh_hieu(10)
    _10 phút sau, có một bình luận: "Thằng nhỏ góc ảnh khóc vì ai vậy anh?". Nick không có ảnh đại diện._
    * * [🙂 Trả lời: "Vì anh. Anh đang tìm nó để xin lỗi."]
        ~ snh_no(-5)
        ~ snh_hieu(-10)
        _Không ai trả lời nữa. Nhưng bình luận của bạn có 1 lượt xem từ nick đó. Xem rồi, không thích, không xóa._
    * * [😶 Ẩn bình luận. Gỡ bài.]
        ~ snh_no(5)
        _Bạn gỡ bài. Câu hỏi thì không gỡ được. Nó nằm trong đầu bạn tới sáng._
* [🙂 Không đăng. Cất tấm ảnh vào ví.]
    ~ snh_no(3)
    _Bạn để tấm ảnh trong ví, ngay sau tấm vé số đã cắt góc năm 2019. Hai thứ bạn không bao giờ kể cho ai._
* [🦸 Đăng ảnh khác: ảnh bộ đồ hồng đầu tiên, năm 2019.]
    ~ follow(1000)
    hong_hot: *(bình luận)* Ủa anh mặc đồ này từ 2019 hả? Tiền đâu mua đồ xịn vậy anh?
    ~ snh_tien(3)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1210_luong_ve ===
# ngay:12 # gio:09:15 # noi:sanh_tang_tret # bat_buoc
_Thứ 2. Lương về trễ 2 ngày. Ở quầy lễ tân, {con_ong_chau_cha} đang nhìn máy quẹt thẻ: "TỪ CHỐI GIAO DỊCH". Lần thứ ba._
con_ong_chau_cha: Ủa? Thẻ phụ của chú anh mà. Để anh gọi chú anh.
_Cùng lúc, {thuc_tap_sinh} làm rơi một cái thẻ đen viền kim cương xuống sàn. {hong_hot} hét "Ủa alo?"._
* [💸 Rút thẻ của mình ra: "Để anh trả cho."]
    ~ snh_ket(6)
    con_ong_chau_cha: Ủa, thẻ anh màu gì vậy? Chưa thấy loại này bao giờ.
    hong_hot: Ối dồi ôi, thẻ siêu nhân! Anh giàu cỡ nào vậy?
    _Hai cái thẻ lạ trong cùng một buổi sáng. Cả sảnh bắt đầu thì thầm._
* [🤝 Lấy chân che cái thẻ kim cương, đẩy về phía {thuc_tap_sinh}.]
    thuc_tap_sinh: *(thì thầm)* Cảm ơn anh… em nợ anh lần nữa.
    ~ qh("thuc_tap_sinh", 10)
    ~ phat_hien(duy_tung_lam_ngan_hang)
    _Bạn hiểu cảm giác đó. Có tiền mà không muốn ai biết._
* [🦸 Tạo dáng giữa sảnh để mọi người nhìn sang chỗ khác.]
    ~ follow(1000)
    hong_hot: Ủa siêu nhân tạo dáng gì giờ này? *(quay qua bạn, quên luôn cái thẻ)*
    ~ qh("thuc_tap_sinh", 5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1210_qua_cho_vu ===
# ngay:12 # gio:14:30 # noi:ban_lam_viec
_{chua_te_deadline} đang ngồi lướt Tóp-tóp. Trên bàn: ly mì ly nguội, bông hoa hôm trước vẫn cắm trong ly bút._
_Bạn mang theo một món quà hồng. Câu hỏi là: đưa lúc nào, đưa ở đâu, và có ai đang cầm điện thoại không._
* [💬 Hỏi {hong_hot}: "Em ơi, {chua_te_deadline} thích gì vậy?"]
    hong_hot: Ổng hả? Thích ngủ. Thích mì ly. Thích nói "còn sớm mà". Ối dồi ôi, anh định tặng gì? Kể tui nghe!
    ~ qh("hong_hot", 3)
* [🙂 Đứng xa quan sát 5 phút.]
    _Cậu ta ngáp 3 lần, gãi đầu 2 lần, mở mì ly rồi để nguội. Lịch trên màn hình: deadline thứ 6. Hôm nay mới thứ 2. Còn sớm thật._
    ~ snh_tim(2)
* [🦸 Tạo dáng thật lố để cậu ta để ý.]
    chua_te_deadline: *(liếc lên)* Gì đó anh? Quay content hả?
    ~ snh_tim(-1)
- -> sieu_nhan_hong_mg_qua_vu
