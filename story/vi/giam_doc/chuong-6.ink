// ============================================================
// GIÁM ĐỐC · CHƯƠNG 6: "NGÀY PHÁN XÉT CỦA SẾP" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== giam_doc_2810_moc_4 ===
# ngay:28 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Mốc 4: 800.000 người theo dõi. Số hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 800000:
    _Trượt. Lưu Lực đăng một bài trên Phây-búc: "Có những đối tác xứng đáng với sân khấu lớn hơn."_
    ~ gd_uy(-5)
    ~ cang_thang(10)
- else:
    _Đạt. Bạn không mời bánh mì. Bạn đi xuống tầng 1, bắt tay từng người. Tay ai cũng lạnh vì máy lạnh, nhưng ai cũng cười._
    ~ gd_uy(5)
}
_10:20. Fanpage công ty tự đăng một video lạ: hai tiếng dựng tay, toàn cảnh {quan_ly_idol} cười, {quan_ly_idol} ngủ gật, {quan_ly_idol} cầm hai điện thoại. Cuối video có dòng chữ: "Em thích anh. — Cú."_
_Cùng lúc, {dan_dau_tu} gõ cửa: bộ lọc số liệu của ông lần ra 80.000 tài khoản ảo đang theo dõi… {idol_het_thoi}._
* [🗑️ "Gỡ video ngay. Chuyện riêng của nhân viên không lên fanpage."]
    ~ qh("editor", 10)
    _{editor} nhắn cho bạn đúng một chữ: "Dạ." Rồi thêm: "Cảm ơn anh."_
    _Video đã có 40.000 lượt xem. Không gỡ được khỏi trí nhớ ai._
    ~ follow(10000)
* [📈 "Để nguyên. Đang viral."]
    ~ follow(50000)
    ~ scandal()
    ~ qh("editor", -20)
    ~ qh("quan_ly_idol", -10)
    _{editor} không đến công ty buổi chiều. Lần đầu tiên trong 4 năm._
* [🎤 "Vụ fan ảo của {idol_het_thoi}, gọi nó lên đây. Anh nói chuyện riêng trước khi ai đăng gì."]
    idol_het_thoi: *(không đeo kính)* Anh… em nợ 18 triệu tiền thuê fan. Em sợ hết người nghe.
    giam_doc: Năm 2015 anh cũng sợ. Mình thuê người vỗ tay ở buổi diễn đầu. Em không biết đâu.
    idol_het_thoi: … Thật hả anh?
    ~ qh("idol_het_thoi", 20)
    ~ phat_hien(fan_ao_phat)
- -> END

// ------------------------------------------------------------
=== giam_doc_2910_wifi_sap ===
# ngay:29 # gio:08:30 # noi:phong_giam_doc # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả tòa nhà. 4G trong phòng kính chỉ có một vạch, chập chờn._
_Bạn không đọc được group "Hội Anti Sếp". Không nhắn được group công ty. Video của {editor} kẹt ở 99%._
it: *(chạy qua cửa, cả công ty đuổi theo sau)* Em đang sửa! Em đang sửa! Đừng ai hỏi em restart chưa!
_Không ai biết vì sao sập. Mỗi người đoán một kiểu. {hong_hot} đoán ba kiểu._
* [🔌 "Bảo, em cần gì? Anh đi mua ngay."]
    it: … Lần đầu có sếp hỏi em cần gì. Một cuộn dây với một ly cà phê sữa đá.
    ~ tien_cong(-235000)
    ~ qh("it", 15)
    ~ gd_uy(5)
* [😡 "Tại sao lại sập đúng hôm nay?!"]
    it: Lỗi phần cứng anh. Không phải lỗi người dùng. Lần này.
    ~ qh("it", -10)
    ~ cang_thang(10)
* [📱 Phát wifi từ điện thoại {hong_hot}. Mật khẩu "nghegichua".]
    hong_hot: Sếp xài wifi em thì sếp phải nghe em kể chuyện nha!
    ~ qh("hong_hot", 10)
    _Bạn nghe 4 chuyện. Một chuyện về chính bạn. Bạn không cãi._
- -> END

// ------------------------------------------------------------
=== giam_doc_2910_xuong_tang_1 ===
# ngay:29 # gio:10:30 # noi:tang_1 # bat_buoc
_Không wifi. Không group. Lần đầu tiên sau 10 năm, bạn phải đi xuống tầng 1, hỏi trực tiếp từng người xem họ đang làm gì._
_Tầng 1 im lặng khi bạn bước vào. Hai mươi cái đầu ngẩng lên cùng lúc._
* [🚶 Đi từng bàn. Hỏi. Nghe. Không phát biểu.]
    ~ gd_hoi_truc_tiep = gd_hoi_truc_tiep + 5
    ~ gd_sua("nhan_22h")
    ~ gd_uy(10)
    designer: Dạ… em đang làm poster Đêm Hồng. Lần này anh đừng sửa được không ạ?
    giam_doc: Anh không sửa. Em làm theo ý em.
    thuc_tap_sinh: Dạ em đang xếp ghế cho Đêm Hồng, 400 cái ạ! Anh ơi, em… em xin được ở lại sau thực tập.
    chua_te_deadline: Em đang làm. Thật đó anh. Lần đầu tiên em làm sớm.
    _Mỗi bàn mất hai phút. Hai mươi bàn, bốn mươi phút. Bằng một cuộc họp giao ban ngắn nhất lịch sử._
    ~ qh("designer", 5)
    ~ qh("thuc_tap_sinh", 5)
    ~ qh("chua_te_deadline", 5)
* [📋 Gọi {truong_phong} báo cáo tổng hợp.]
    truong_phong: Vâng ạ, em sync nhanh 5 phút nhé anh.
    _Bốn mươi phút sau, {truong_phong} vẫn đang sync._
    ~ gd_hoi_truc_tiep = gd_hoi_truc_tiep + 1
* [☕ Xuống pantry, pha cà phê cho cả tầng. Không hỏi gì.]
    _Máy cà phê hôm nay chạy. Bạn pha 20 ly. Không ai hiểu chuyện gì đang xảy ra, nhưng ai cũng uống._
    ~ gd_hoi_truc_tiep = gd_hoi_truc_tiep + 2
    ~ gd_uy(5)
    ~ uong(10)
- -> END

// ------------------------------------------------------------
=== giam_doc_2910_tong_dai_giay ===
# ngay:29 # gio:15:00 # noi:choi_bao_ve
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác Bình ngồi giữa núi giấy note, {cho} chạy đưa thư lên các tầng. {chi_dai} điều phối bằng bộ đàm._
bac_bao_ve: Cậu Thắng có giấy này. Không ký tên.
_Tờ giấy note màu vàng: "Sếp ơi, mai họp đánh giá, sếp có giữ lời tăng lương không? — Một người trong group."_
* {gd_hua_tang_luong_20} [✍️ Viết trả lời: "Anh giữ. Mai anh nói."]
    ~ gd_uy(5)
    _Bác Bình cầm tờ giấy, đọc, gật đầu, đưa cho {cho}. {cho} chạy đi, tờ giấy phấp phới._
* {gd_hua_tang_luong_20} [✍️ Viết trả lời: "Anh không biết nữa. Anh xin lỗi."]
    ~ gd_uy(-5)
    _Bác Bình cầm tờ giấy, đọc, không nói gì. Rồi đưa cho {cho}._
* [✍️ Viết trả lời: "Mai anh nói thật hết."]
    ~ gd_uy(3)
    bac_bao_ve: Nói thật hết thì nói từ hôm nay cũng được.
* [☕ Không trả lời. Ngồi uống trà với bác.]
    ~ gd_tra_binh = gd_tra_binh + 1
    ~ qh("bac_bao_ve", 5)
    { gd_tra_binh >= 10:
        bac_bao_ve: Mười buổi rồi đấy. Cậu là nhân viên số 1 của bác.
        giam_doc: Cháu là nhân viên số 1 của công ty mà bác.
        bac_bao_ve: Không. Của bác.
    }
- -> END

// ------------------------------------------------------------
=== giam_doc_3010_cong_khai_hoa ===
# ngay:30 # gio:07:30 # noi:biet_thu # dieu_kien:gd_dung_clone
_7:30. Wifi đã có lại. Group "Hội Anti Sếp" có 112 tin chưa đọc. Bạn đọc hết._
{ not gd_dung_clone:
    _Bạn chưa từng vào group đó. Bạn chỉ nghe kể. Hôm nay bạn cũng không vào._
    -> END
}
{ gd_da_tra_thu:
    _Trong Danh sách đen của bạn có {gd_danh_sach_den} cái tên. Đọc lại, bạn thấy cái tên nào cũng đang làm việc cho Đêm Hồng._
}
_Bông hoa hướng dương vẫn ở đó. Ba mươi ngày. Bạn đã sửa {gd_sua_minh} điều bị chê._
* {gd_sua_minh >= 5 && not gd_da_tra_thu} [🌻 Gõ: "Hoa Hướng Dương 1989 là anh đây. Cảm ơn các em đã chửi anh đúng."]
    ~ gd_cong_khai_hoa = true
    ~ phat_hien(clone_thang)
    _Gửi. Ba phút. Không ai gõ gì. Dấu "đang nhập…" hiện lên rồi tắt, mười bốn lần._
    hong_hot: …
    hong_hot: Ủa alo.
    hong_hot: Ủa ALO?!
    ~ gd_uy(10)
* [🌻 Gõ: "Hoa Hướng Dương 1989 là anh đây."]
    ~ gd_cong_khai_hoa = true
    ~ phat_hien(clone_thang)
    hong_hot: Trời đất ơi… sếp đọc hết rồi hả?! Hướng nội hết phần đời còn lại luôn mấy bà ơi.
    { gd_da_tra_thu:
        _Ba người rời group ngay lập tức. Họ nhớ ra những gì họ đã viết, và những gì sau đó đã xảy ra với họ._
        ~ gd_uy(-15)
    - else:
        ~ gd_uy(-5)
    }
* [🚪 Lặng lẽ rời group. Xóa tài khoản.]
    _"Hoa Hướng Dương 1989 đã rời nhóm." Không ai để ý. Có lẽ thế là tốt._
* [😶 Đóng máy. Để bông hoa ở lại.]
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== giam_doc_3010_hop_danh_gia ===
# ngay:30 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Cả công ty ngồi kín phòng "Sáng Tạo". Không ai cầm gối. Hôm nay ai cũng tỉnh._
_Trên bàn: hợp đồng gia hạn của {idol_het_thoi}, hết hạn ngày mai. Danh sách đề cử Phó Giám đốc. Và lời hứa tăng lương, nếu bạn đã lỡ hứa._
_Trước giờ họp, {hr} cho dọn kho. {cho} đứng canh gầm cầu thang, gầm gừ với người cầm chổi._
* [🐕 Nhắn {hr}: "Gầm cầu thang để nguyên. Của Tuất."]
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 5)
* [😶 Kệ. Dọn hết.]
    ~ qh("cho", -15)
- _Việc thứ nhất: hợp đồng của {idol_het_thoi}._
* [✍️ Gia hạn 1 năm, giữ nguyên lương.]
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 10)
    idol_het_thoi: *(tháo kính)* Cảm ơn anh. Em sẽ… em sẽ hát cho đàng hoàng.
* [✂️ Không gia hạn. "Em tự do rồi, đi tìm chỗ hợp hơn."]
    ~ qh("idol_het_thoi", -20)
    ~ qh("quan_ly_idol", -15)
    ~ gd_tien_cty(96)
- _Việc thứ hai: Phó Giám đốc._
* [👑 {con_ong_chau_cha}.]
    ~ gd_pho_giam_doc = "con_ong_chau_cha"
    con_ong_chau_cha: Dạ… chú ơi, con… con không muốn ghế đó. Con muốn làm nhạc.
    _Cả phòng sững sờ. {truong_phong} sững sờ nhất._
    ~ qh("con_ong_chau_cha", 10)
    ~ qh("truong_phong", -20)
    ~ gd_uy(-10)
* [📅 {truong_phong}.]
    ~ gd_pho_giam_doc = "truong_phong"
    truong_phong: Vâng, em xin cảm ơn anh. Em xin phép phát biểu ngắn 5 phút ạ.
    ~ qh("truong_phong", 25)
    ~ gd_uy(5)
* [🦁 {chi_dai}.]
    ~ gd_pho_giam_doc = "chi_dai"
    chi_dai: Em hả? *(im lặng)* … Được. Nhưng họp không quá 30 phút. Ai nhắn tin sau 10 giờ đêm, em xử.
    ~ qh("chi_dai", 20)
    ~ qh("truong_phong", -10)
    ~ gd_uy(10)
* [💰 {ke_toan}.]
    ~ gd_pho_giam_doc = "ke_toan"
    ke_toan: *(lấy kính lúp ra soi tờ quyết định)* … Dạ. Em nhận. Hóa đơn đâu mọi người?
    ~ qh("ke_toan", 20)
    ~ gd_uy(10)
- { gd_hua_tang_luong_20:
    _Việc thứ ba: lời hứa tăng lương 20% ở karaoke. Hai mốt người nhìn bạn. {ke_toan} đã tính sẵn: 60 triệu mỗi tháng._
    -> giam_doc_3010_loi_hua_20
}
-> giam_doc_3010_cat_giam

=== giam_doc_3010_loi_hua_20 ===
* [💸 "Anh giữ lời. Lương anh 60 triệu, anh không nhận nữa. Ba tháng rồi, thêm vài tháng cũng được."]
    ~ gd_giu_loi_20 = true
    ~ gd_hua_tang_luong_20 = false
    ~ gd_giu_loi()
    ~ gd_uy(20)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 20
    _Cả phòng im lặng. Rồi {chi_dai} vỗ tay. Rồi cả phòng vỗ tay. {ke_toan} gạch một dòng trong sổ, viết lại: "Sếp giữ lời."_
* [😮‍💨 "Anh xin lỗi. Anh hứa khi say. Anh không làm được."]
    ~ gd_uy(-30)
    _Không ai nói gì. Nhưng ai cũng nhớ. Nói thật vẫn đỡ hơn im lặng: không đến mức mất hết._
* [🎭 "Tăng lương 20%… vào năm sau. Khi công ty ổn."]
    ~ gd_uy(-50)
    _{hong_hot} cúi xuống điện thoại. Group anti sếp có tin mới. Bạn không cần đọc cũng biết nội dung._
- -> giam_doc_3010_cat_giam

=== giam_doc_3010_cat_giam ===
_Việc cuối: danh sách cắt giảm của {hr}._
* [🗑️ "Không cắt ai. Nếu Đêm Hồng thất bại, anh đi trước."]
    ~ gd_uy(10)
    ~ qh("hr", 10)
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("thanh_xin_nghi", 10)
* [✂️ "Cắt theo danh sách. Công ty cần sống."]
    ~ gd_uy(-15)
    ~ qh("thuc_tap_sinh", -20)
    ~ qh("thanh_xin_nghi", -20)
    ~ gd_tien_cty(50)
- _Cuộc họp dài 58 phút. Ngắn nhất từ trước tới nay._
~ gd_sua("hop_ngan")
-> END

// ------------------------------------------------------------
=== giam_doc_3110_ong_ke_ngan_hang ===
# ngay:31 # gio:17:00 # noi:phong_giam_doc # bat_buoc
_Đêm Hồng Halloween. Bộ hóa trang của bạn, do {designer} chọn, vừa được gửi tới: "Ông Kẹ Ngân Hàng". Áo vest đen, mặt nạ xám, một cái túi tiền rỗng, và tấm biển "Nợ Quá Hạn"._
designer: Dạ… em chọn bộ này cho anh. Hợp vibe ạ. *(không dám nhìn thẳng)*
* [😂 Mặc vào, chụp ảnh đăng lên: "Ông Kẹ Ngân Hàng, có thật trong đời sống."]
    ~ follow(8000)
    ~ gd_uy(5)
    ~ qh("designer", 10)
    hong_hot: Sếp ơi! Sếp tự troll mình hả sếp?! Đỉnh!
* [😐 "Em đổi cho anh bộ khác."]
    designer: Hết bộ rồi anh. Còn mỗi bộ "Cây Nấm".
    _Bạn mặc bộ Cây Nấm. Không ai nhận ra bạn suốt buổi tối._
* [🎭 Mặc vào, nhưng tháo tấm biển "Nợ Quá Hạn" ra.]
    _Bộ đồ vẫn đẹp. Ai nhìn cũng nghĩ là trò đùa. Chỉ bạn biết không phải._
- -> END

// ------------------------------------------------------------
=== giam_doc_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
{ nguyen_theo_ll:
    _19:30. Sân khấu Đêm Hồng dựng xong, đèn bật, 400 ghế {thuc_tap_sinh} xếp thẳng tắp. Nhưng không có Siêu Nhân Hồng._
    _Phía bên kia thành phố, tòa nhà xanh lá chuối bắn pháo hoa. {sieu_nhan_hong} đứng trên sân khấu của LL._
    _{idol_het_thoi} cầm micro, hát "Công Viên" cho 400 cái ghế. Có 60 người ngồi. Ai cũng khóc._
    ~ follow(20000)
    -> END
}
_19:30. Mở màn: phim ngắn "Người Hùng Không Tên". Rồi video tổng kết "16 năm"._
_Bạn đứng dưới khán đài, trong bộ đồ hóa trang, tay cầm điện thoại. Con số nhảy từng nghìn: {nguoi_theo_doi}._
_Rồi {sieu_nhan_hong} bước ra. Đèn hồng. Khán giả hét._
~ follow(100000)
{ qh_sieu_nhan_hong >= 50:
    ~ follow(50000)
}
{ gd_uy_quyen >= 60:
    _Nhân viên của bạn làm việc như chưa từng làm. Ánh sáng chuẩn, âm thanh chuẩn, không ai ngủ gật._
    ~ follow(50000)
}
{ qh_chi_dai >= 40:
    ~ follow(30000)
}
_Giữa bài hát cuối, {sieu_nhan_hong} dừng lại, nhìn xuống khán đài, tìm bạn._
sieu_nhan_hong: Sếp ơi… em có nên tháo mũ hông?
* [🙅 Lắc đầu: "Đó là của em. Em quyết."]
    _{sieu_nhan_hong} gật đầu. Hát tiếp. Bạn không ép. Lần này "tùy em" nghĩa là tùy em thật._
    ~ follow(30000)
    ~ qh("sieu_nhan_hong", 10)
* [🔥 Gật đầu thật mạnh: "Tháo đi! Tạo sốc!"]
    { qh_sieu_nhan_hong >= 60:
        _{sieu_nhan_hong} tháo mũ. Một gương mặt bình thường, rụt rè, mắt ướt. Khán giả im lặng một giây, rồi gào lên._
        ~ nguyen_thao_mu_dem_hong = true
        ~ follow(150000)
    - else:
        _{sieu_nhan_hong} khựng lại, rồi lùi vào cánh gà. Điều khoản số 1: không ai được ép. Đêm diễn mất 10 phút im lặng._
        ~ follow(-50000)
        ~ qh("sieu_nhan_hong", -20)
    }
* [😶 Giơ điện thoại lên. Quay. Không ra hiệu gì.]
    ~ follow(10000)
- _Đâu đó, chung kết "Giọng Ca Ước Mơ" đang phát trên điện thoại của ai đó. Người đứng trên sân khấu đó trông rất giống {thanh_xin_nghi}._
-> END

// ------------------------------------------------------------
=== giam_doc_3110_sau_man ===
# ngay:31 # gio:22:30 # noi:choi_bao_ve
_22:30. Sân khấu đã tắt đèn. Bạn đi bộ về công ty, vẫn mặc nguyên bộ hóa trang. Chòi bảo vệ còn sáng._
bac_bao_ve: *(rót trà)* Ông Kẹ Ngân Hàng. Hợp với cậu đấy.
cho: Gâu. *(ngửi túi tiền rỗng, thất vọng)*
_Điện thoại bạn sáng lên. Con số cuối cùng: {nguoi_theo_doi}._
* [☕ Ngồi xuống. Uống trà. Không nhìn điện thoại nữa.]
    ~ gd_tra_binh = gd_tra_binh + 1
    ~ cang_thang(-20)
    bac_bao_ve: Mười sáu năm. Năm nay là năm cậu nói thật nhiều nhất đấy.
* [📲 Mở group công ty lúc 22:00 như thói quen. Gõ… rồi xóa.]
    ~ gd_sua("nhan_22h")
    _Bạn xóa từng chữ. Rồi gõ lại: "Cảm ơn các em." Gửi. Không giao việc. Không emoji._
    _Hai mươi hai người "đã xem". Mười chín người trả lời "Dạ". Một người thả tim. Là {chi_dai}._
- -> END
