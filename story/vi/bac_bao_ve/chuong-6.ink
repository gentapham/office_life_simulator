// ============================================================
// BÁC BẢO VỆ: BÌNH · CHƯƠNG 6: "CUỘC HỌP CỔ ĐÔNG Ở CỔNG" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== bac_bao_ve_2810_video_linh ===
# ngay:28 # gio:16:30 # noi:choi_bao_ve # bat_buoc
_Mốc 4. {nguoi_theo_doi} người theo dõi. Bác không xem số. Bác xem người._
_4 giờ 30. {quan_ly_idol} đi xuống cổng, hai điện thoại trên tay, cả hai đều tắt. Lần đầu bác thấy anh tắt điện thoại._
_Fanpage công ty vừa lỡ đăng một video 2 phút: toàn cảnh {quan_ly_idol} ngủ gật trên xe, cười với {idol_het_thoi}, cầm hai điện thoại chạy giữa trời mưa. Cuối video: "Anh Thái ơi, em thích anh lâu rồi." Góc khung hình có một con cú nhỏ._
quan_ly_idol: Bác… cho con ngồi đây năm phút. Ở trên đấy con không thở được.
* [🍵 Rót trà. Đặt lên bàn. Không hỏi.]
    _Anh uống. Năm phút thành ba mươi phút. Anh kể: thằng nhỏ {editor} dựng video ấy. Anh không biết. Ba năm nay anh không biết._
    quan_ly_idol: Con thích người khác, bác ạ. Con không biết làm sao cho thằng nhỏ đỡ buồn.
    bac_bao_ve: Thì cứ nói thật. Tử tế mà nói thật thì người ta buồn ít hơn.
    ~ bv_rot_tra("quan_ly_idol", 10)
    ~ phat_hien(linh_thich_thai)
    ~ phat_hien(thai_thuong_phat)
* [💬 "Cháu có đi bên kia không? 36 triệu ấy."]
    quan_ly_idol: *(nhìn bác)* Bác biết cả chuyện ấy à?
    bac_bao_ve: Bác ở cổng. Phong bì nào cũng đi qua đây.
    quan_ly_idol: Con… không đi. Đi thì bỏ lại một người. Con không bỏ được.
    ~ qh("quan_ly_idol", 8)
- _Điện thoại thứ ba của anh rung: tin {dan_dau_tu} vừa chạy bộ lọc số liệu. 80.000 tài khoản fan ảo đều trỏ về một người: {idol_het_thoi}._
quan_ly_idol: *(đứng dậy, bật lại cả hai điện thoại)* Chuyện này để con lo… hai chuyện một ngày, bác ạ.
~ phat_hien(fan_ao_phat)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2810_phat_o_cong ===
# ngay:28 # gio:21:00 # noi:cong_cong_ty
_9 giờ tối. Đúng giờ bác đi ngủ. {idol_het_thoi} đứng ở cổng, không kính đen, tóc bết, áo nhàu. Không vào. Không đi._
idol_het_thoi: Bác… con thuê fan ảo. 80.000 cái. 18 triệu. Giờ cả mạng biết rồi. Con hết thật rồi bác.
* [🍵 Mở cổng. "Vào đây. Bác pha trà."]
    _{idol_het_thoi} ngồi xuống ghế nhựa. Cầm ly trà bằng hai tay. Run._
    bac_bao_ve: Năm 2015 bác nghe cháu hát cả ngày trên radio. Không ai thuê bác nghe.
    idol_het_thoi: *(ngẩng lên)* …Thật hả bác?
    bac_bao_ve: Thật. Hôm mất điện cháu hát, bác đứng ở cửa nghe hết. Cũng không ai thuê.
    ~ qh("idol_het_thoi", 15)
    ~ bv_rot_tra("idol_het_thoi", 5)
* [😐 "Ừ. Sai thì nhận. Mai lên nói với anh {giam_doc} trước khi người ta nói."]
    idol_het_thoi: *(im lặng rất lâu)* …Dạ. Mai con nói.
    ~ qh("idol_het_thoi", 5)
- _10 giờ 30. Bác ngủ trễ một tiếng rưỡi. Mai Bình Tâm sẽ kém đi một chút. Đáng._
~ bv_tam(-5)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2910_day_mang ===
# ngay:29 # gio:08:15 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả tòa nhà. Zalo-lô chết. {it} bị cả công ty đuổi từ tầng 2 xuống tầng trệt._
it: *(thở hồng hộc, đứng trước tủ mạng tầng 1)* Dây cáp đứt. Bác. Ai vào đây sớm nhất?
_Bác mở sổ trực. Sáng nay cổng mở 6 giờ 30._
{ RANDOM(1, 10) <= 6:
    -> tuat_can
- else:
    -> bi_cat
}

= tuat_can
_Dưới chân tủ mạng: lông chó. Dấu răng trên vỏ cáp. Và {cho} đang nằm bẹp dưới gầm cầu thang, giả vờ ngủ, miệng còn dính sợi nhựa._
_{cho} đã đi tìm con gà cao su. Bị giấu sau tủ mạng từ 4/10._
* {bac_bao_ve_0410_sau_giu_tuat} [🔒 Thò tay ra sau tủ mạng, lôi con gà cao su ra.]
    _Con gà cao su phủ bụi. {cho} nhảy dậy, ngậm lấy, nằm xuống ôm nó như ôm người thân thất lạc. Không cắn dây nào nữa._
    it: Bác biết nó ở đó?
    bac_bao_ve: Bác ghi sổ từ hôm 4.
    ~ bv_so_truc_dung = bv_so_truc_dung + 1
    ~ qh("cho", 15)
    ~ qh("it", 5)
* [🐕 "Tuất. Ra đây." Dắt về chòi.]
    cho: *(cúi đầu)* …Ẳng.
    ~ qh("cho", -2)
- -> tong_dai

= bi_cat
_Vết cắt thẳng, gọn, như kéo. Không phải răng chó. Bác lật sổ trực: "6 giờ 50. Một người vào sớm. Đi cổng sau."_
{ bv_biet_ran_thu_hai:
    _Tên trong sổ trùng với cái tên bác đã biết từ đêm 17. {ten(ran_thu_hai)}._
}
* [📒 Đưa sổ cho {it} xem. Im lặng.]
    it: *(đọc, nhìn bác)* …Cháu giữ. Bác giữ.
    ~ bv_so_truc_dung = bv_so_truc_dung + 1
    ~ bv_bm(2)
* [🙈 "Bác không thấy gì đâu. Cháu sửa đi đã."]
    ~ bv_khong_thay_gi()
- -> tong_dai

= tong_dai
_Wifi chưa có. Cả công ty không nhắn tin được cho nhau. {chi_dai} đứng giữa tầng 1, bộ đàm trên tay, tuyên bố: "Mọi tin nhắn đi qua chòi bảo vệ. Viết giấy."_
_Chòi bảo vệ chính thức thành tổng đài._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2910_tong_dai_giay ===
# ngay:29 # gio:11:00 # noi:choi_bao_ve # bat_buoc
_11 giờ. Bàn trong chòi đầy giấy. Giấy note vàng, giấy kẻ ô, giấy xé từ sổ. Người ta viết, gấp lại, ghi tên người nhận, đưa bác. Bác chuyển._
_Ai nhắn gì cho ai, bác biết hết._
_"Gửi {ke_toan}: Bà ơi tui đói. {chi_dai}." — "Gửi {truong_phong}: Họp 5 phút không anh? {thanh_ninh}." — "Gửi {quan_ly_idol}: Em xin lỗi về cái video. {editor}."_
_Rồi một tờ gấp tư, chữ nghiêng, mực hồng: "Gửi {chua_te_deadline}. Tối qua anh nhắn em mà em chưa trả lời. Không sao. Anh chờ được. {sieu_nhan_hong}."_
* [📮 Chuyển đúng từng tờ, đúng người. Không đọc thêm lần nào.]
    _Bác đi lên đi xuống 3 tầng, 46 lần. Chân mỏi rã. Nhưng không một tờ nào lạc._
    ~ bv_tam(-5)
    ~ bv_qh_ca_cong_ty(2)
    ~ tien_cong(100000)
* [🤫 Tờ mực hồng: tự tay đưa cho {chua_te_deadline}, đứng đợi cậu ta đọc xong.]
    _{chua_te_deadline} đọc. Đọc lại. Rồi xé một tờ giấy kẻ ô, viết một dòng, đưa bác: "Bác chuyển giùm con."_
    _Bác không đọc. Bác chỉ thấy, lúc nhận tờ trả lời, {sieu_nhan_hong} đứng trong chòi cười một mình rất lâu, rồi giấu mặt vào chiếc mũ._
    ~ qh("sieu_nhan_hong", 8)
    ~ qh("chua_te_deadline", 5)
    ~ bv_bm(2)
* [🐕 Giao một nửa cho {cho} tha đi.]
    _{cho} tha đúng 6 tờ. Tha nhầm 4 tờ. 2 tờ bị ăn. Tờ của {thanh_ninh} gửi {truong_phong} nằm trong kho dưới gầm cầu thang tới tận tháng sau._
    ~ qh("cho", 5)
    ~ follow(5000)
- _{hong_hot} chạy xuống, giơ điện thoại: "Bác ơi con phát wifi điện thoại rồi! Mật khẩu 'nghegichua'! Mà bác cứ làm tổng đài tiếp đi, vui quá!"_
~ bv_so_ly_tra = bv_so_ly_tra + 8
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2910_email_nhi ===
# ngay:29 # gio:17:10 # noi:cong_cong_ty
_5 giờ 10 chiều. Wifi vừa có lại được mười phút. Từ cửa tòa nhà, {thanh_ninh} chạy ra, mắt đỏ, túi xách ôm trước ngực._
_Bác vừa nghe tầng 1 xôn xao: một email "Em đồng ý về LL ạ" vừa gửi nhầm vào hộp thư "G-Entertainment - Toàn công ty"._
* [🍵 Gọi lại: "Cháu Nhi. Ngồi xuống đây đã. Đi đâu mà vội."]
    _{thanh_ninh} khựng lại. Rồi ngồi xuống cái ghế nhựa, ôm mặt khóc. Không phải khóc nịnh. Khóc như một đứa trẻ._
    thanh_ninh: Bác… con gửi nhầm. Con chưa quyết mà. Con… con chỉ muốn có chỗ người ta không bỏ con lại.
    bac_bao_ve: Ở đây cũng chưa ai bỏ cháu. Cháu chạy trước thôi.
    ~ qh("thanh_ninh", 15)
    ~ bv_rot_tra("thanh_ninh", 5)
* [🙈 Mở cổng cho cô đi. Bác không thấy gì đâu.]
    _{thanh_ninh} chạy ra đường, vẫy taxi. Chiếc taxi chạy về hướng Ven Đô._
    ~ bv_khong_thay_gi()
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_3010_thu_sang ===
# ngay:30 # gio:07:00 # noi:choi_bao_ve # bat_buoc
_Họp đánh giá cuối tháng. 7 giờ sáng. Bác đứng ở hộp thư._
{ bv_so_thu >= 4:
    _Hồi âm thứ tư. Ngắn nhất từ trước tới nay._
    _"Bình. Bốn lá thư. Tôi đọc mỗi lá ba lần. Tháng này tôi biết hết rồi."_
    _"Nếu tới ngày 30 mà con số chưa đủ, anh mở phong bì. Đọc to. Đọc xong thì xuống cổng rót trà. G."_
    ~ bv_g(5)
- else:
    _Hộp thư trống. Tuần đó bác không gửi. G không biết gì để mà trả lời._
    ~ bv_tam(-5)
}
{ bv_co_phong_bi_g && not bv_mo_phong_bi:
    -> co_mo_khong
}
-> END

= co_mo_khong
_Phong bì dán kín vẫn nằm trong túi áo trong. "Chỉ mở khi công ty sắp sập." Hôm nay là ngày họp đánh giá. Con số: {nguoi_theo_doi}._
* {nguoi_theo_doi < 1000000 || nguyen_theo_ll} [✉️ Mở phong bì.]
    _Bác bóc phong bì bằng con dao rọc giấy. Từng chút một. Bên trong là quyết định của G về tương lai công ty, viết tay, ký tên, ghi ngày từ tháng 9._
    _Bác đọc một lần. Gấp lại. Hai tay đặt trên đầu gối. Mười phút._
    ~ bv_mo_phong_bi = true
    ~ bv_tam(-20)
* [🤫 Chưa. Chưa tới lúc. Công ty chưa sập.]
    _Bác cài nút túi áo. Giữ là được. Đọc khi tới lúc._
    ~ bv_tam(5)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_3010_don_kho ===
# ngay:30 # gio:07:45 # noi:gam_cau_thang
_7 giờ 45. {hr} cho dọn kho trước họp đánh giá. Hai anh lao công đang khiêng một thùng carton từ gầm cầu thang ra: kho báu của {cho}._
_Chìa khóa, son môi, điện thoại cũ, chiếc găng tay hồng, một chiếc giày lẻ, một mẩu giấy nhắn tin bị gặm dở._
cho: *(đứng chắn trước thùng, run run)* Grừ…
* [🚪 "Để xuống. Đồ của chó công ty là đồ của bảo vệ. Bác ký nhận."]
    _Hai anh lao công đặt thùng xuống. Không ai cãi một ông bảo vệ 50 tuổi đang cầm sổ trực._
    _{cho} kéo cái thùng về gầm cầu thang, nằm đè lên, nhìn bác như nhìn anh hùng._
    ~ bv_giu_kho_tuat = true
    ~ qh("cho", 15)
* [💬 Lục thùng trả từng món về chủ.]
    _Son môi trả {hong_hot}. Chìa khóa trả {con_ong_chau_cha}. Găng tay hồng, bác cất riêng: "Để mai trả cậu Nguyên"._
    _{cho} nhìn kho báu của mình vơi đi từng món. Buồn. Nhưng không cắn ai._
    ~ nhan(gang_tay_hong)
    ~ bv_giu_kho_tuat = true
    ~ bv_qh_ca_cong_ty(1)
    ~ qh("cho", -5)
* [😶 Kệ. Hôm nay còn chuyện lớn hơn.]
    _Thùng đồ của {cho} ra xe rác. {cho} chạy theo xe tới đầu hẻm, rồi đứng lại. Rất lâu._
    ~ qh("cho", -20)
    ~ bv_tam(-10)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_3010_hop_danh_gia ===
# ngay:30 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. Cả công ty. Bác ở cổng, như mọi năm. Mười sáu năm, bác chưa bao giờ dự một cuộc họp._
{ bv_lo_day && not bv_thang_biet:
    -> bac_bao_ve_tudo_noi_chuyen_choi
}
{ bv_mo_phong_bi && bv_long_tin_g >= 80 && bv_binh_tam >= 50:
    -> duoc_moi
}
{ bv_mo_phong_bi:
    -> giu_thu
}
-> o_cong

= duoc_moi
_9 giờ 10. {giam_doc} tự đi xuống cổng. Không gọi qua bộ đàm. Không nhờ ai. Anh đứng trước chòi, cúi đầu._
giam_doc: Bác Bình. Em mời bác lên phòng họp. Em nghĩ… bác có thứ cần đọc cho mọi người nghe.
_Bác đứng dậy. Chỉnh lại áo đồng phục. Đeo kính lão. Phong bì trong túi áo trong._
_Lần đầu tiên trong 16 năm, bác ngồi trong một cuộc họp của {cong_ty}. Không ngồi. Đứng. Ở cuối phòng._
* [✉️ Đọc. Chậm rãi. Từng chữ.]
    -> doc
* [🍵 "Anh {giam_doc} đọc đi. Bác chỉ là người giữ thư."]
    giam_doc: *(lắc đầu)* Anh ấy dặn bác đọc. Em biết. Bác đọc đi ạ.
    -> doc

= doc
_Cả phòng họp im phăng phắc. Giọng Bắc chậm rãi:_
bac_bao_ve: "Gửi các cháu ở G. Đây là quyết định của tôi, Genta, người lập ra công ty này."
bac_bao_ve: "Công ty giữ lại. Thắng làm giám đốc thêm một năm. Không đứa nào bị đuổi vì cái lỗi ký không đọc của Thắng."
bac_bao_ve: "Điều kiện duy nhất: không nhắn tin cho nhân viên sau 22 giờ. Ai thấy Thắng nhắn, báo bác Bình."
_Cả phòng bật cười. Rồi đứng dậy. Rồi vỗ tay. {giam_doc} vừa cười vừa khóc. {hr} lặng lẽ gấp tập hồ sơ màu hồng lại, không mở ra nữa._
_Bác gấp thư. Nói đúng một câu:_
bac_bao_ve: Bác đọc xong rồi.
_Rồi bác đi xuống cổng. Rót trà. Đeo lại cái thẻ "Bảo vệ"._
~ bv_doc_quyet_dinh = true
~ tinh_than_cong_ty = tinh_than_cong_ty + 20
~ bv_qh_ca_cong_ty(10)
~ qh("giam_doc", 15)
-> END

= giu_thu
_Phong bì đã mở nằm trong túi áo. Bác biết bên trong viết gì. Nhưng không ai mời bác lên. Và bác không tự đi lên._
_Qua cửa sổ tầng 2, bác thấy {hr} đứng dậy, cầm tập hồ sơ màu hồng. Bác thấy {chi_dai} đứng dậy trước khi {hr} đọc tới cái tên thứ hai._
* [🚪 Đi lên tầng 2. Đứng ở cửa phòng họp. Không nói. Chỉ đứng.]
    _Cả phòng quay ra nhìn ông bảo vệ đứng ở cửa. {hr} nhìn bác. Gấp tập hồ sơ lại. "Tạm hoãn tới sau Đêm Hồng."_
    ~ bv_lo_than(10)
    ~ bv_qh_ca_cong_ty(3)
* [🍵 Ở lại cổng. Giữ lời: người giữ thư thì không tự mở miệng.]
    ~ bv_tam(5)
- -> END

= o_cong
_Qua cửa sổ tầng 2, bác thấy {hr} đứng dậy, cầm tập hồ sơ màu hồng. Bác thấy {chi_dai} đứng dậy trước khi {hr} đọc tới cái tên thứ hai._
_Rồi thấy {thuc_tap_sinh} đi ra sau lưng {chi_dai}. Rồi {thanh_xin_nghi}. Rồi vài người nữa._
* [🚪 Đi lên. Đứng sau cùng hàng người ấy.]
    _Bác đứng sau cùng. Không ai bảo. Không ai ngạc nhiên. {hr} nhìn hàng người, nhìn bác ở cuối hàng, rồi gấp tập hồ sơ lại._
    ~ bv_qh_ca_cong_ty(5)
    ~ bv_lo_than(5)
* [🍵 Pha một ấm trà lớn. Lát nữa ai xuống cũng có trà.]
    _11 giờ, họp xong. Hai mươi người đi xuống cổng. Ai cũng cầm một ly trà. Không ai kể với bác chuyện gì xảy ra. Bác không cần nghe._
    ~ bv_so_ly_tra = bv_so_ly_tra + 20
    ~ bv_qh_ca_cong_ty(2)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_3110_cong_san_khau ===
# ngay:31 # gio:18:30 # noi:san_khau_dem_hong # bat_buoc
_31/10. Đêm Hồng Halloween. 6 giờ 30 chiều. Bác đứng ở cổng Sân khấu Đêm Hồng. Không phải cổng công ty, nhưng cổng nào thì cũng là cổng._
_{giam_doc} tới, hóa trang "Ông Kẹ Ngân Hàng": vest đen, mặt nạ, tay cầm một cuốn sổ nợ giả. Không ai cười, vì không ai chắc anh đang đùa._
_Anh tháo mặt nạ, đưa bác một tấm thẻ đeo cổ: "KHÁCH MỜI ĐẶC BIỆT – HÀNG GHẾ ĐẦU"._
giam_doc: Bác ngồi hàng đầu nhé. Năm nay em muốn bác xem, không phải gác.
* [🪑 Đeo thẻ. Ngồi hàng ghế đầu. Lần đầu tiên.]
    _Bác ngồi ghế đầu. Thẻ đeo cổ. Không quen. Tay cứ sờ lên ngực tìm cái bộ đàm không có ở đó. {cho} nằm dưới chân ghế._
    ~ bv_ghe_khach_moi = true
    ~ qh("giam_doc", 5)
* [🚪 "Bác đứng cổng quen rồi. Thẻ này anh để cho người khác."]
    giam_doc: *(cười)* Em biết bác sẽ nói thế. Thôi, bác đeo thẻ mà đứng cổng vậy.
    _Bác đeo thẻ "Khách mời đặc biệt", đứng ở cổng, soát vé. Cả nghìn khán giả đi qua, ai cũng nhìn cái thẻ._
    ~ bv_tam(5)
- _7 giờ 50. {thanh_xin_nghi} chạy ngang cổng, ôm túi nilon đựng bộ đồ kim tuyến: "Con đi đây bác! Chung kết 8 giờ!"_
* [😊 "Hát cho tử tế."]
    thanh_xin_nghi: Dạ! *(chạy được ba bước, quay lại cúi chào, rồi chạy tiếp)*
    ~ qh("thanh_xin_nghi", 8)
* [📻 Mở radio, dò sẵn đài Tivi Hóng.]
    ~ bv_tam(3)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_3110_dem_hong ===
# ngay:31 # gio:20:10 # noi:san_khau_dem_hong # bat_buoc
_19:30 mở màn: phim ngắn "Người Hùng Không Tên". Rồi video "16 năm" của {editor}: căn phòng 20 mét vuông, cái bàn thùng mì, một ông bảo vệ tóc còn đen. Cả nghìn người im lặng._
_20:10. {sieu_nhan_hong} chuẩn bị bước ra. Ở cổng sau, một gã áo khoác nhiều túi, máy ảnh ống dài, đang lách qua hàng rào._
{ bv_ghe_khach_moi:
    _Bác đang ngồi hàng ghế đầu. Bác thấy gã. Không ai khác thấy._
}
* [🚪 Đứng dậy. Đi ra cổng sau. Chặn.]
    _Bác đứng chắn. Gã giơ máy ảnh: "Một tấm thôi chú, một tấm!". Bác nhìn giày gã: đế mòn một bên. Người đứng chờ lâu. Bác cũng là người đứng chờ lâu._
    bac_bao_ve: Cháu đứng đây với bác. Xem cũng được. Chụp thì không.
    _Gã nhìn bác. Hạ máy ảnh. Đứng xem cạnh bác tới hết đêm._
    ~ bv_chan_paparazzi = bv_chan_paparazzi + 1
    ~ follow(10000)
* [🐕 Huýt sáo một tiếng.]
    _{cho} lao ra như tên bắn. Gã paparazzi bị rượt chạy ba vòng quanh cái cột điện quấn đèn hồng, rồi ra cổng. Khán giả tưởng là tiết mục, vỗ tay._
    ~ bv_chan_paparazzi = bv_chan_paparazzi + 1
    ~ follow(15000)
    ~ qh("cho", 5)
* [🙈 Bác không thấy gì đâu. Hôm nay bác là khách.]
    _Gã lách vào được tận cánh gà. Tiếng màn trập máy ảnh liên tục._
    ~ bv_khong_thay_gi()
- _20:20. {sieu_nhan_hong} bước ra sân khấu. Hát. Múa. Rồi giữa bài, đứng im. Hai tay đặt lên chiếc mũ hồng. Nhìn xuống hàng ghế đầu. Nhìn bác._
* [😊 Gật đầu. Một cái thôi.]
    _{sieu_nhan_hong} tháo mũ. Một anh chàng bình thường. Mũi hơi to. Mắt hiền. Vết sẹo nhỏ trên mu bàn tay trái. Cả nghìn người im ba giây. Rồi đứng dậy vỗ tay. Rồi hét tên. Tên thật._
    ~ nguyen_thao_mu_dem_hong = true
    ~ qh("sieu_nhan_hong", 10)
* [🙈 Nhìn xuống. Chuyện của cậu ấy, cậu ấy quyết.]
    _{sieu_nhan_hong} đứng đó rất lâu. Rồi hạ tay xuống, cười, hát tiếp. Có những thứ để dành cho người ta tự quyết._
- _22:00. Bài cuối. Pháo giấy hồng. Bác về lại cổng, như mọi đêm. {cho} nằm dưới chân. Radio để kênh Đài Tivi Hóng: "…và quán quân Giọng Ca Ước Mơ năm nay là…"_
-> bac_bao_ve_3010_danh_gia

// ------------------------------------------------------------
// CẢNH TỰ DO (game mở khi đủ điều kiện)
// ------------------------------------------------------------
=== bac_bao_ve_tudo_noi_chuyen_choi ===
# dieu_kien:bv_lo_day
_Chòi bảo vệ. {giam_doc} đứng ở cửa. Trên tay anh: tấm ảnh căn phòng 20 mét vuông, bản sao giấy tờ thành lập, và một phong bì cũ ký "G" mà {cho} tha ra từ đâu đó._
giam_doc: Bác Bình. Em hỏi bác một câu thôi. Mười năm nay… bác viết thư cho anh Genta về em, đúng không?
~ bv_lo_day = false
* [🍵 "Đúng. Ngồi xuống. Bác kể hết."]
    _Bác kể. Từ năm 2016. Từng lá thư. Từng chuyện. Cả chuyện ngân hàng. Cả chuyện anh ngồi tới 11 giờ đêm._
    _{giam_doc} ngồi im rất lâu. Rồi hỏi: "Anh ấy… có giận em không?"_
    bac_bao_ve: Ông ấy bảo: "Nó cứ làm cho tử tế."
    ~ bv_thang_biet = true
    ~ phat_hien(binh_tai_mat_g)
    { bv_ke_tot_thang:
        ~ qh("giam_doc", 15)
    - else:
        ~ qh("giam_doc", -10)
    }
* [😶 "Bác chỉ là bảo vệ. Bác không biết anh nói gì."]
    giam_doc: *(đặt tấm ảnh xuống bàn, rất chậm)* Vâng. Bác chỉ là bảo vệ.
    _Anh đi lên. Không chào. Từ hôm đó anh đi cổng sau._
    ~ qh("giam_doc", -30)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_bung_no ===
# dieu_kien:bv_binh_tam_0
_Độ Bình Tâm: 0. Ấm trà nguội từ trưa. Radio hết pin. Tiếng còi xe. Tiếng cãi nhau trên tầng 2 vọng xuống._
_Bác đứng dậy. Đi ra giữa sân. Và lần đầu tiên trong 16 năm, bác nói. To. Giọng Bắc vang khắp tòa nhà._
bac_bao_ve: Mười sáu năm bác đứng ở cái cổng này! Ai đi trễ, ai về sớm, ai đi với ai, ai cầm phong bì xanh lá chuối, bác thấy hết!
bac_bao_ve: Bác không nói vì bác nghĩ các cháu tự biết! Các cháu không biết thì bác nói!
_Cả công ty đổ ra cửa sổ. {giam_doc} đứng ở ban công tầng 2, mặt trắng bệch._
~ bv_vua_no = false
~ bv_da_no = true
* [📢 Nói hết. Không chừa ai.]
    _Năm phút. Ai nợ ai, ai đi phỏng vấn ở đâu, ai ngủ lại phòng giám đốc, ai cắt dây mạng. Rồi bác im. Cả sân im._
    ~ bv_lo_than(30)
    ~ bv_qh_ca_cong_ty(-5)
    ~ scandal()
* [🍵 Nói tới câu thứ ba thì dừng. Ngồi xuống. Thở.]
    _Bác ngồi xuống bậc thềm. Tay run. {cho} chạy tới, gác cằm lên đùi bác. Cả công ty đứng nhìn, không ai dám lại gần. Rồi {chi_dai} đi xuống, mang theo một ly trà đá._
    ~ bv_lo_than(10)
    ~ qh("chi_dai", 5)
- ~ bv_binh_tam = 40
-> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_nhay_trend ===
# dieu_kien:qh_sieu_nhan_hong_50
{ qh_sieu_nhan_hong < 50:
    -> END
}
_Giờ nghỉ trưa. {sieu_nhan_hong} chạy ra cổng, theo sau là {hong_hot} cầm điện thoại._
sieu_nhan_hong: Bác ơi bác! Nhảy trend "Hồng là thái độ" với con đi bác! Có ba động tác thôi! Bác nhảy là triệu view!
* [💃 "Ừ. Ba động tác thôi đấy."]
    _Động tác một: chống nạnh. Động tác hai: chỉ tay lên trời. Động tác ba: tạo dáng. Bác làm đúng nhịp, mặt không cảm xúc, như đang làm thể dục buổi sáng._
    _Clip "Bác bảo vệ 50 tuổi nhảy đẹp hơn idol" lên mạng lúc 12:30. Tới tối, cả Thành Phố Ước Mơ biết mặt bác._
    ~ bv_nhay_trend = true
    ~ follow(60000)
    ~ bv_lo_than(10)
    ~ qh("sieu_nhan_hong", 10)
    ~ qh("hong_hot", 8)
* [😊 "Bác già rồi. Cháu nhảy, bác đứng xem."]
    _{sieu_nhan_hong} nhảy. Bác đứng sau, uống trà. Clip vẫn lên, có bác uống trà ở góc khung hình. Người ta bình luận: "Ông chú phía sau chill nhất"._
    ~ follow(15000)
    ~ bv_lo_than(3)
- -> END
