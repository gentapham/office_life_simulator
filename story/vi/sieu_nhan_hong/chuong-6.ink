// ============================================================
// CHƯƠNG 6: "ĐẠI NHẠC HỘI SIÊU NHÂN" (28/10 – 31/10)
// Kết thúc sự nghiệp (6 cái) nằm ở nội dung chung. Ở đây chỉ đặt
// nguoi_theo_doi, so_scandal, nguyen_theo_ll, nguyen_thao_mu_dem_hong.
// ============================================================

// ------------------------------------------------------------
=== sieu_nhan_hong_2810_moc_800k ===
# ngay:28 # gio:09:00 # noi:tang_1 # bat_buoc
{ snh_mua_fan_ao:
    { RANDOM(1, 10) <= 6:
        ~ snh_bi_boc_fan_ao = true
        ~ follow(-300000)
        ~ scandal()
        _Sáng nay, bộ lọc dữ liệu của {dan_dau_tu} chạy xong. 100.000 tài khoản theo dõi bạn mua cùng một ngày, từ dịch vụ "Like Thật 100%"._
        _Bài bóc phốt lên top xu hướng trước 8 giờ. Bình luận: "Siêu nhân hay siêu ảo?". 300.000 người bấm bỏ theo dõi._
        dan_dau_tu: Anh ơi… số liệu là sự thật. Em xin lỗi.
    }
}
_Mốc 4: 800.000 người theo dõi._
{ nguoi_theo_doi >= 800000:
    _Màn hình hiện {nguoi_theo_doi}. Đạt. Cả tầng 1 hét lên. Bạn nhấc bổng {thuc_tap_sinh} lên, quên mất cậu ta nặng 70 ký._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
- else:
    _Màn hình hiện {nguoi_theo_doi}. Không đạt. Trang LL-Entertainment đăng một tấm ảnh bóng lưng màu hồng, chú thích: "Sắp về nhà mới?"_
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
}
_Cũng sáng nay, bộ lọc của {dan_dau_tu} lần ra 80.000 fan ảo của {idol_het_thoi}. Phốt lan nhanh. {idol_het_thoi} ngồi một mình trong phòng chờ, kính đen._
* [🙂 Vào phòng chờ, ngồi xuống cạnh {idol_het_thoi}.]
    idol_het_thoi: Em vô đây cười anh hả? Em biết anh là ai không?
    _Bạn tháo mũ. {idol_het_thoi} khựng lại, nhìn mặt bạn rất lâu._
    ~ snh_thao_mu(false)
    sieu_nhan_hong: Biết. Anh là người hát "Công Viên". Còn em là người ngày nào cũng sợ bị người ta biết mặt thật.
    idol_het_thoi: *(gỡ kính)* …Ừ. Hai đứa mình giống nhau ghê.
    ~ qh("idol_het_thoi", 20)
* [🦸 Đăng bài: "Ai cũng từng muốn được vỗ tay. Mình đừng ném đá anh {idol_het_thoi} nữa."]
    ~ follow(10000)
    ~ qh("idol_het_thoi", 10)
    ~ qh("quan_ly_idol", 10)
* [😶 Không xen vào.]
    _Bạn có đủ phốt của riêng mình rồi._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2810_video_linh ===
# ngay:28 # gio:14:10 # noi:phong_dung_phim
_Fanpage công ty vừa đăng nhầm một video tỏ tình: 3 phút, toàn cảnh {quan_ly_idol} làm việc. Của {editor}. Gỡ sau 6 phút._
_Bạn gõ cửa phòng dựng. Tối om. {editor} ngồi dưới sàn, ôm gối._
~ phat_hien(linh_thich_thai)
editor: Anh vô cười tui hả? Anh cũng tỏ tình trên livestream mà.
* [🙂 Ngồi xuống sàn cạnh {editor}: "Ít ra em dựng đẹp. Anh thì nói vấp."]
    editor: *(cười, nước mắt vẫn chảy)* Anh dở thiệt. Mà… anh dám.
    ~ qh("editor", 15)
    _Hai người ngồi trong phòng dựng tối om. Một người thích người ta qua màn hình. Một người thích người ta qua mũ bảo hiểm hồng._
* [🦸 "Thả tim cho video của em nè! Hồng là thái độ!"]
    editor: *(nhìn bạn)* Video gỡ rồi anh.
    ~ qh("editor", 3)
* [💬 "Em có muốn anh nói chuyện với {quan_ly_idol} hông?"]
    editor: Đừng! *(rồi nhỏ giọng)* Ảnh… ảnh thích người khác. Tui biết lâu rồi.
    ~ qh("editor", 10)
    ~ phat_hien(thai_thuong_phat)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2910_wifi_sap ===
# ngay:29 # gio:08:40 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. Cả công ty truy đuổi {it}. Video "16 năm" của {editor} kẹt ở 99%._
_Bên tủ mạng sau cầu thang, {it} giơ lên một sợi dây mạng bị cắn đứt. Dấu răng chó._
it: Chó cắn. Nó đi tìm cái gì đó sau tủ mạng.
{ snh_giau_ga_cao_su && not snh_tra_ga_cao_su:
    _Sau tủ mạng là con gà cao su màu vàng bạn giấu từ ngày 4/10. {cho} đã tìm nó suốt 25 ngày._
    * [🙂 Lấy con gà ra, ngồi xổm, đưa cho {cho}.]
        ~ snh_tra_ga_cao_su = true
        ~ qh("cho", 15)
        cho: …Gâu. *(ngậm con gà, nhìn bạn rất lâu, rồi đi về chòi)*
        _Nó không sủa. Nó không vẫy đuôi. Nhưng nó cũng không cắn mũ._
        -> sieu_nhan_hong_2910_wifi_sap_tiep
    * [😶 Im lặng. Không ai biết đó là lỗi của bạn.]
        ~ snh_no(3)
        -> sieu_nhan_hong_2910_wifi_sap_tiep
}
-> sieu_nhan_hong_2910_wifi_sap_tiep

= sieu_nhan_hong_2910_wifi_sap_tiep
_Không mạng, không livestream được. {quan_ly_idol} gọi bằng điện thoại bàn: "Hôm nay em tự do. Đừng gây chuyện."_
* [🆘 Đi giúp người cả ngày ngoài đường. Không camera.]
    -> sieu_nhan_hong_mg_giup_nguoi
* [🙂 Ở lại chòi bảo vệ, giúp bác {bac_bao_ve} chạy giấy nhắn tin.]
    bac_bao_ve: Cậu chạy giấy giúp bác à? Ừ. Tờ này lên tầng 2. Đừng đọc.
    ~ qh("bac_bao_ve", 10)
    ~ qh("chi_dai", 5)
    _Cả ngày bạn chạy lên chạy xuống cầu thang bộ trong bộ đồ hồng. Tối về, chân run. Không ai biết tên bạn, nhưng ai cũng nhận được giấy nhắn đúng giờ._
* [📶 Xin {hong_hot} mật khẩu wifi điện thoại để đăng bài.]
    hong_hot: "nghegichua". Anh đăng gì thì đăng nhẹ thôi, cả tầng đang xài chung.
    ~ follow(3000)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2910_tuat_lac ===
# ngay:29 # gio:17:30 # noi:cong_vien_ho_ca_map # ngau_nhien # dieu_kien:qh_cho>=20
_Chạng vạng. Bác {bac_bao_ve} đứng ở cổng, gọi khắp phố: "{cho} ơi! {cho}!". Không mạng, không ai đăng tin tìm chó được._
bac_bao_ve: Nó chạy theo cái xe shipper từ trưa. Chưa về. Nó chưa bao giờ đi lâu thế.
_Bạn tìm thấy {cho} ở Công viên Hồ Cá Mập, nằm co dưới gầm ghế đá, một chân sau bị thương, run rẩy._
cho: …Ẳng.
* [🙂 Tháo mũ, cởi áo choàng hồng quấn quanh {cho}, cõng về.]
    ~ snh_cong_tuat_ve = true
    ~ qh("cho", 25)
    ~ qh("bac_bao_ve", 20)
    _2 km. Không ai quay. {cho} nằm trên lưng bạn, thở phì phò vào gáy. Nó không cắn. Nó chỉ dụi mõm vào vai._
    bac_bao_ve: *(chạy ra cổng, đỡ lấy {cho})* …Thế à. Cảm ơn cậu. Cảm ơn cậu thật.
    ~ snh_thao_mu(false)
* [🦸 Gọi xe ôm chở về.]
    ~ qh("cho", 10)
    ~ qh("bac_bao_ve", 10)
    _{cho} nằm giữa bạn và bác xe ôm, gầm gừ suốt đường. Nhưng về tới nơi an toàn._
* {co(xuc_xich)} [🦴 Dỗ {cho} bằng cây xúc xích trước đã.]
    ~ mat(xuc_xich)
    ~ snh_cho_xuc_xich()
    _{cho} ăn, rồi để bạn bế lên. Bạn đi bộ về, ôm nó như ôm một cái bánh kem 3 tầng sắp đổ._
    ~ snh_cong_tuat_ve = true
    ~ qh("cho", 20)
    ~ qh("bac_bao_ve", 15)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2910_tra_da ===
# ngay:29 # gio:18:30 # noi:quan_tra_da_dau_hem # bat_buoc
_Quán trà đá đầu Hẻm 69. Áo thun xám, không mũ, tay dính dầu nhớt sau một ngày đẩy xe. Không ai nhận ra bạn._
_Ở bàn trong góc, {ran_doc} ngồi một mình, ly trà đá 3 nghìn._
* [🙂 Ngồi xuống ghế đối diện: "Dạ… ờm… cho anh một ly trà đá."]
    -> sieu_nhan_hong_2910_tra_da_ngoi
* [😶 Đi ngang qua, không dừng.]
    _Bạn đi qua. {ran_doc} ngẩng lên đúng lúc đó. Hai người nhìn nhau 1 giây. Bạn đi tiếp._
    ~ snh_no(3)
    -> END

= sieu_nhan_hong_2910_tra_da_ngoi
ran_doc: *(nhìn bàn tay có sẹo)* …Không có mũ, anh nhìn khác ghê.
sieu_nhan_hong: Hôm nay hông có mạng. Anh đi đẩy xe cả ngày. Hông ai quay. Mà vui.
{ snh_mo_nhanh_hieu_ech:
    * [🙂 "{ran_doc}. Anh xin lỗi. Lần này hông có ai nghe hết. Chỉ có em."]
        ~ snh_xin_loi_hieu_kin = true
        ~ snh_no(-15)
        ~ snh_hieu(-20)
        ran_doc: *(rất lâu)* Anh biết hông, bên đống lửa anh xin lỗi trước cả công ty. Em tưởng anh diễn.
        ran_doc: Giờ hông có ai. Anh vẫn nói. …Ừ. Em nghe rồi.
        _Ông Ba trà đá rót thêm hai ly. Bác {bac_bao_ve} đánh cờ ở bàn bên, làm như không nghe thấy gì._
        -> END
    * [🙂 "Anh hông xin em tha. Anh chỉ xin em đừng phá mấy đứa trong công ty. Tụi nó hông có lỗi gì."]
        ~ snh_hieu(-10)
        ran_doc: *(cứng người)* Anh biết hả?
        sieu_nhan_hong: Anh đoán. Đoán đúng hả?
        _{ran_doc} không trả lời. Nhưng cậu ta không đứng dậy bỏ đi._
        -> END
- else:
    * [🙂 "Em ở hẻm này hả? Hồi nhỏ xóm anh cũng có quán trà đá như vầy. Có cây me to lắm."]
        ~ snh_no(5)
        ~ snh_hieu(-5)
        ran_doc: *(đặt ly xuống)* …Xóm Cây Me.
        _Cậu ta nói cái tên đó như nói tên một vết thương. Bạn nhìn cậu ta. Cái mặt. Đôi mắt. Có cái gì đó…_
        { snh_no_xom_cu >= 50:
            sieu_nhan_hong: {ran_doc}… {ran_doc} Ếch. Là em hả?
            ~ snh_mo_nhanh_hieu_ech = true
            ~ phat_hien(hieu_ech)
            ran_doc: Hai mươi năm. Giờ mới nhớ.
            sieu_nhan_hong: Anh xin lỗi. Không có camera. Không có ai. Anh xin lỗi.
            ~ snh_xin_loi_hieu_kin = true
            ~ snh_no(-10)
            ~ snh_hieu(-15)
        }
        -> END
    * [🦸 "Em có biết Siêu Nhân Hồng hông? Là anh đó!" *(cười)*]
        ran_doc: Biết. Cả nước biết. *(uống hết ly trà, đứng dậy)*
        ~ snh_hieu(3)
        -> END
}

// ------------------------------------------------------------
=== sieu_nhan_hong_3010_don_kho ===
# ngay:30 # gio:08:00 # noi:gam_cau_thang
_Trước họp đánh giá, {hr} cho dọn kho. Hai anh dọn vệ sinh cầm bao rác đi về phía gầm cầu thang. Kho của {cho}._
cho: GRỪ… GÂU GÂU! *(đứng chắn trước kho, chân sau còn băng)*
* [🙂 Đứng chắn cạnh {cho}: "Anh {hr} ơi, kho này để lại đi. Có đồ của anh trong đó. Một cái găng tay hồng."]
    hr: Ồ… đồ của đối tác ạ. Vậy mình để lại nha anh.
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 5)
    _{cho} nhìn bạn. Rồi nhìn vào kho, chỗ chiếc găng tay hồng nằm từ ngày 4/10. Nó không đưa lại cho bạn. Chưa._
* [🐕 "Dọn đi! Lấy lại găng tay cho anh!"]
    ~ snh_choc_tuat()
    _Bao rác đầy dần. Chìa khóa, thỏi son, điện thoại cũ. Chiếc găng tay hồng bị lôi ra, bẩn và rách một ngón. {cho} đứng nhìn, không sủa nữa._
* [😶 Đi lên họp.]
    _Bạn đi lên. Sau lưng có tiếng bao rác sột soạt, và một tiếng "ẳng" rất nhỏ._
    ~ qh("cho", -5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_3010_hop_danh_gia ===
# ngay:30 # gio:10:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. Bạn không phải nhân viên, nhưng được mời dự với tư cách đối tác. {hr} cầm một tập hồ sơ màu hồng. Ai cũng nhìn tập hồ sơ đó._
giam_doc: Hôm nay anh công bố ghế Phó Giám đốc, tăng lương, gia hạn hợp đồng của {idol_het_thoi}, và… những thay đổi về nhân sự.
{ snh_hen_ll_30:
    _Mọi người nhìn bạn. Hạn bạn hứa với Lưu Lực là hôm nay. Điện thoại có một tin nhắn xanh lá chuối: "Anh quyết chưa?"_
    * [😤 Nhắn lại: "Anh ở lại."]
        ~ snh_tu_choi_ll = true
        ~ nguyen_theo_ll = false
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
        _Bạn đặt điện thoại úp xuống bàn. {quan_ly_idol} thở ra một hơi rất dài._
        -> sieu_nhan_hong_3010_hop_danh_gia_tiep
    * [✍️ Nhắn lại: "Anh ký."]
        ~ nguyen_theo_ll = true
        _Bạn đặt điện thoại xuống. Không ai trong phòng biết. Ngày mai thì cả nước sẽ biết._
        -> sieu_nhan_hong_3010_hop_danh_gia_tiep
}
-> sieu_nhan_hong_3010_hop_danh_gia_tiep

= sieu_nhan_hong_3010_hop_danh_gia_tiep
hr: Về danh sách cắt giảm nếu chiến dịch thất bại… phòng nhân sự xin đọc một vài tên. *(mở tập hồ sơ, tay hơi run)* {thuc_tap_sinh}. {thanh_xin_nghi}…
_Cả phòng lạnh đi. {thuc_tap_sinh} cúi đầu. Ghế của {thanh_xin_nghi} trống, như mọi khi._
~ phat_hien(danh_sach_cat_giam)
* [🙂 Đứng dậy: "Em xin cho {thuc_tap_sinh}. Cậu ấy là người hùng thật của phim mở màn tối mai."]
    ~ snh_xin_cho = "thuc_tap_sinh"
    ~ qh("thuc_tap_sinh", 20)
    giam_doc: *(nhìn {thuc_tap_sinh} rất lâu)* Người hùng… của phim? Ừ. Anh… anh xem lại.
    thuc_tap_sinh: *(ngẩng lên, mắt đỏ)* Anh…
* [🙂 Đứng dậy: "Em xin cho {thanh_xin_nghi}. Tối mai cậu ấy có chung kết trên Đài Tivi Hóng. Cả công ty nên tự hào."]
    ~ snh_xin_cho = "thanh_xin_nghi"
    ~ qh("thanh_xin_nghi", 20)
    ~ phat_hien(son_thi_hat)
    hr: *(gấp tập hồ sơ)* Vậy… lý do "về quê gặt lúa" là thi hát hả anh?
    _Cả phòng bật cười. Lần đầu tiên trong tuần. {hr} cũng cười, lần này là cười thật._
* [🦸 "Không ai bị cắt hết! Mình sẽ tới một triệu! Hồng là thái độ!"]
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
    giam_doc: Đấy! Đấy là mindset!
    _Không ai được xin cho. Nhưng không ai bị đọc tên thêm._
* [😶 Ngồi im. Mình không phải nhân viên.]
    _{hr} đọc tiếp. Bạn nhìn xuống tay mình. Hợp đồng cho bạn quyền bỏ ngang buổi quay để đi giúp người. Hợp đồng không nói gì về việc giúp người ngồi cạnh._
- { snh_xin_cho != "":
    _Lúc ra khỏi phòng họp, {ran_doc} đi ngang qua bạn, dừng nửa giây: "Anh xin cho người ta… cũng được đó." Rồi đi tiếp._
    ~ snh_hieu(-5)
}
_Cuối buổi, {idol_het_thoi} được gia hạn hợp đồng thêm một năm. {quan_ly_idol} quay đi, lấy tay dụi mắt, nói là bụi._
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_3110_hau_truong ===
# ngay:31 # gio:18:30 # noi:canh_ga_dem_hong # bat_buoc
_Đại Nhạc Hội Siêu Nhân. Cả công ty hóa trang. {giam_doc} là "Ông Kẹ Ngân Hàng". {cho} đeo cánh dơi. {thanh_xin_nghi} biến mất, 20:00 có chung kết "Giọng Ca Ước Mơ". Riêng bạn thì ngày nào cũng như hóa trang._
_Cánh gà. 1 tiếng nữa lên sân khấu. Bạn ngồi trên thùng loa, mũ đặt trên đùi._
{ nguyen_theo_ll:
    _Điện thoại rung: Lưu Lực. "Tối nay diễn xong, sáng mai họp báo bên tôi." Bạn tắt máy._
}
* [💬 Tìm {chua_te_deadline}.]
    _Cậu ta đang chạy tiến độ thật. Lần đầu tiên bạn thấy cậu ta chạy. Thấy bạn, cậu ta dừng lại 3 giây._
    chua_te_deadline: Anh. Lát nữa… dù anh làm gì trên đó, em ở dưới cánh gà bên trái.
    ~ snh_tim(5)
* [💬 Tìm {ran_doc}.]
    { snh_mo_nhanh_hieu_ech:
        ran_doc: *(đứng gần tủ điện, cầm bộ đàm)* Anh lo diễn đi. Ở đây có em giữ.
        ~ snh_hieu(-5)
    - else:
        ran_doc: *(đứng gần tủ điện, cầm bộ đàm)* Anh cần gì hả?
        _Cậu ta đứng cạnh cái cầu dao đỏ. Bạn không biết vì sao thấy hơi lạnh gáy._
    }
* {qh_cho >= 50} [🐕 Ngồi xuống cạnh {cho}.]
    cho: *(nhìn cái mũ trên đùi bạn, rồi nhìn bạn)* …
    _Nó không gầm gừ. Nó nằm xuống, gác cằm lên chân bạn. Cánh dơi lệch một bên._
    ~ qh("cho", 5)
* [🍌 Ăn đĩa bánh chuối chiên trong phòng chờ. Điều khoản số 4.]
    ~ an(20)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_3110_dem_hong ===
# ngay:31 # gio:21:30 # noi:san_khau_dem_hong # bat_buoc
_Phim ngắn "Người Hùng Không Tên" mở màn. Rồi video "16 năm" của {editor}. Rồi đèn tắt. Rồi một luồng sáng hồng chiếu xuống giữa sân khấu._
_Bạn bước ra. Cả nghìn người hét. Màn hình lớn sau lưng chạy con số: {nguoi_theo_doi}._
~ follow(100000)
{ tinh_than_cong_ty >= 60:
    ~ follow(100000)
}
_Bài hát cuối cùng. Câu hỏi cuối cùng: tháo mũ hay không. Trước ai. Và vì ai._
* [🦸 Không tháo. Tạo dáng giữa pháo hoa: "Hồng không phải màu, Hồng là thái độ!"]
    ~ follow(20000)
    _Pháo hoa nổ. Cả khán đài hô theo. Siêu Nhân Hồng là của họ. Nguyễn {sieu_nhan_hong} vẫn là của riêng bạn._
* [🙂 Tháo mũ. Trước tất cả mọi người.]
    ~ nguyen_thao_mu_dem_hong = true
    ~ snh_thao_mu_dem_hong_truoc = "khan_gia"
    ~ snh_thao_mu(false)
    { nguoi_theo_doi >= 800000:
        ~ follow(200000)
    - else:
        ~ follow(50000)
    }
    _Cả khán đài im lặng. Một gương mặt bình thường, tóc bết, mắt đỏ. Rồi một người vỗ tay. Rồi một nghìn người._
    sieu_nhan_hong: Dạ… ờm… em tên là Nguyễn {sieu_nhan_hong}. Em hông có gì đặc biệt. Cảm ơn mọi người đã thích Siêu Nhân Hồng.
* {snh_mo_nhanh_hieu_ech} [🙂 Mời {ran_doc} lên sân khấu. Tháo mũ. Xin lỗi trước cả nghìn người.]
    ~ nguyen_thao_mu_dem_hong = true
    ~ snh_thao_mu_dem_hong_truoc = "hieu"
    ~ snh_thao_mu(false)
    ~ follow(150000)
    ~ snh_no(-15)
    ~ snh_hieu(-15)
    sieu_nhan_hong: Hai mươi năm trước, anh nhốt em này trong nhà kho. Anh gọi em là {ran_doc} Ếch. Anh xin lỗi. Trước mặt mọi người.
    { snh_han_cua_hieu < 40:
        ran_doc: *(cầm micro)* Tui chỉ nói sự thật thôi mà… Tui tha cho ông rồi.
    - else:
        _{ran_doc} đứng im trên sân khấu rất lâu. Không nói gì. Rồi gật đầu một cái, đi xuống._
    }
* [💗 Quỳ xuống giữa sân khấu, đưa hoa hồng cho {chua_te_deadline}.]
    ~ snh_to_tinh_camera = true
    { snh_tim_hong < 60:
        ~ snh_to_tinh_pr = true
    }
    ~ follow(80000)
    _Cả khán đài hét. {chua_te_deadline} bị đẩy ra giữa sân khấu, tay vẫn cầm bộ đàm._
* {snh_thao_mu_truoc_vu >= 1} [🙂 Đi vào cánh gà bên trái. Tháo mũ. Chỉ trước một người.]
    ~ snh_thao_mu_dem_hong_truoc = "vu"
    ~ snh_thao_mu(true)
    _Sân khấu vẫn chạy nhạc. Khán giả chỉ thấy một vệt hồng đi vào cánh gà. Ở đó, {chua_te_deadline} đang đứng, bộ đàm trên tay._
    chua_te_deadline: Anh… sao anh vô đây? Còn một bài nữa mà.
    sieu_nhan_hong: Còn sớm mà. Chill. Kịp hết.
    _Lần đầu tiên, {chua_te_deadline} không có câu nào để đáp lại._
    ~ snh_tim(15)
- -> END
