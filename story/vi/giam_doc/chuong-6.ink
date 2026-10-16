// ============================================================
// GIÁM ĐỐC · CHƯƠNG 6: "NGÀY PHÁN XÉT CỦA SẾP" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== giam_doc_2810_moc_4 ===
# ngay:28 # gio:10:00 # noi:phong_giam_doc # bat_buoc
{ gd_hua_leo >= 5:
    ~ gd_nhan_vien_bo_di = gd_nhan_vien_bo_di + 1
    ~ gd_uy(-5)
    _Trên bàn bạn có thêm một lá đơn nghỉ việc. Người nộp sẽ sang LL từ tháng sau. Lá thứ ba kể từ 26/10._
}
_Mốc 4: 800.000 người theo dõi. Số hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 800000:
    _Trượt. Lưu Lực đăng một bài trên Phây-búc: "Có những đối tác xứng đáng với sân khấu lớn hơn."_
    ~ gd_uy(-5)
    ~ cang_thang(10)
- else:
    _Đạt. Bạn không mời bánh mì. Bạn đi xuống tầng 1, bắt tay từng người. Tay ai cũng lạnh vì máy lạnh, nhưng ai cũng cười._
    ~ gd_uy(5)
}
_Trên bàn có tờ báo cáo của {it}: 2:10 sáng nay, fanpage công ty tự đăng một video tên "Thai_final_v12". Toàn cảnh {quan_ly_idol} cười, {quan_ly_idol} ngủ gục trong xe, {quan_ly_idol} cầm hai điện thoại. Cuối video: "Em thích anh. — Cú." Video nằm trên trang 6 phút, khoảng 2.000 lượt xem, rồi {it} gỡ._
_Cùng lúc, {dan_dau_tu} gõ cửa: bộ lọc số liệu của ông lần ra 80.000 tài khoản ảo đang theo dõi… {idol_het_thoi}._
* [🗑️ Nhắn group công ty: "Chuyện riêng của nhân viên không ai được đăng lại. Anh nói một lần."]
    ~ qh("editor", 10)
    ~ gd_uy(5)
    _{editor} nhắn cho bạn đúng một chữ: "Dạ." Rồi thêm: "Cảm ơn anh."_
    _Hai nghìn người đã xem. Không gỡ được khỏi trí nhớ ai. Nhưng không ai trong công ty đăng lại._
* [😠 Gọi {editor} lên: "Fanpage công ty không phải chỗ tỏ tình."]
    ~ qh("editor", -15)
    ~ gd_uy(-5)
    editor: Em không bấm đăng. Em thề. *(ngáp không nổi)*
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
{ gd_hua_leo >= 5:
    ~ gd_nhan_vien_bo_di = gd_nhan_vien_bo_di + 1
    ~ gd_uy(-5)
    _Không wifi, nhưng đơn nghỉ việc thì vẫn tới, bằng giấy. Thêm một người sang LL._
}
_Ngày Internet Quốc tế. Wifi sập cả tòa nhà. 4G trong phòng kính chỉ có một vạch, chập chờn._
_Bạn không đọc được group "Hội Anti Sếp". Không nhắn được group công ty. Video của {editor} kẹt ở 99%._
it: *(chạy qua cửa, cả công ty đuổi theo sau)* Em đang sửa! Em đang sửa! Đừng ai hỏi em restart chưa!
_Không ai biết vì sao sập. Mỗi người đoán một kiểu. {hong_hot} đoán ba kiểu._
* [🔌 "{it}, em cần gì? Anh đi mua ngay."]
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
    designer: Dạ… em đang làm poster Đại Nhạc Hội. Lần này anh đừng sửa được không ạ?
    giam_doc: Anh không sửa. Em làm theo ý em.
    thuc_tap_sinh: Dạ em đang xếp ghế cho Đại Nhạc Hội, 400 cái ạ! Anh ơi, em… em xin được ở lại sau thực tập.
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
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} ngồi giữa núi giấy note, {cho} chạy đưa thư lên các tầng. {chi_dai} điều phối bằng bộ đàm._
bac_bao_ve: Cậu {giam_doc} có giấy này. Không ký tên.
_Tờ giấy note màu vàng: "Sếp ơi, mai họp đánh giá, sếp có giữ lời tăng lương không? — Một người trong group."_
* {gd_hua_tang_luong_20} [✍️ Viết trả lời: "Anh giữ. Mai anh nói."]
    ~ gd_uy(5)
    _Bác {bac_bao_ve} cầm tờ giấy, đọc, gật đầu, đưa cho {cho}. {cho} chạy đi, tờ giấy phấp phới._
* {gd_hua_tang_luong_20} [✍️ Viết trả lời: "Anh không biết nữa. Anh xin lỗi."]
    ~ gd_uy(-5)
    _Bác {bac_bao_ve} cầm tờ giấy, đọc, không nói gì. Rồi đưa cho {cho}._
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
=== giam_doc_2910_email_nhi ===
# ngay:29 # gio:17:05 # noi:phong_giam_doc # bat_buoc
_17:05. Điện thoại bạn bắt được wifi "nghegichua" của {hong_hot}. Hộp thư tải về một lượt. Email mới nhất, gửi tới "{cong_ty} - Toàn công ty", lúc 17:02._
_Người gửi: {thanh_ninh}. Tiêu đề: "Em đồng ý về LL ạ"._
_Bên ngoài vách kính, tầng 2 im phăng phắc. Hai mươi cái điện thoại cùng sáng lên một lúc._
{ gd_ll_moi_thang:
    _Bạn nhớ cái email gấp ba của Lưu Lực đêm 26. Hóa ra Lưu Lực không chỉ mua mỗi Siêu Nhân Hồng._
}
* [🚪 Gọi {thanh_ninh} vào phòng, đóng cửa: "Em ngồi đi. Anh nghe."]
    _{thanh_ninh} ngồi xuống, tay run, mắt đỏ. "Em… em bấm nhầm người nhận, sếp ơi. Em chưa ký gì hết."_
    giam_doc: Anh không hỏi em ký chưa. Anh hỏi em có muốn đi không.
    _Lần đầu tiên trong ba năm, {thanh_ninh} không khen bạn câu nào._
    ~ qh("thanh_ninh", 15)
    ~ gd_uy(5)
* [📢 Trả lời toàn công ty: "Ai muốn đi, anh không giữ. Anh không ép, tùy các em."]
    ~ gd_tuy_em("thanh_ninh")
    ~ gd_uy(-5)
    _Mười phút sau, có thêm hai email hỏi "Ủa vậy LL còn tuyển hông?". Có lẽ là đùa. Có lẽ không._
    { gd_hua_leo >= 5:
        ~ gd_nhan_vien_bo_di = gd_nhan_vien_bo_di + 1
    }
* [😶 Tắt điện thoại. Mai họp đánh giá rồi tính.]
    ~ cang_thang(10)
    ~ qh("thanh_ninh", -5)
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
    _Trong Danh sách đen của bạn có {gd_danh_sach_den} cái tên. Đọc lại, bạn thấy cái tên nào cũng đang làm việc cho Đại Nhạc Hội Siêu Nhân._
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
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
{ gd_hua_leo >= 5:
    ~ gd_nhan_vien_bo_di = gd_nhan_vien_bo_di + 1
    ~ gd_uy(-5)
    _Phòng họp có vài ghế trống. Những người đã nộp đơn sang LL không tới họp nữa._
}
_14:00. Họp đánh giá cuối tháng. Cả công ty ngồi kín phòng họp tầng 2. Không ai cầm gối. Hôm nay ai cũng tỉnh._
_Trên bàn: hợp đồng gia hạn của {idol_het_thoi}, hết hạn ngày mai. Danh sách đề cử Phó Giám đốc. Và lời hứa tăng lương, nếu bạn đã lỡ hứa._
_Sáng nay, trước giờ họp, {hr} cho dọn kho. {cho} đứng canh gầm cầu thang, gầm gừ với người cầm chổi._
* [🐕 Nhắn {hr}: "Gầm cầu thang để nguyên. Của {cho}."]
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 5)
* [😶 Kệ. Dọn hết.]
    ~ qh("cho", -15)
- _Việc thứ nhất: hợp đồng của {idol_het_thoi}._
* [✍️ Gia hạn 1 năm, giữ nguyên lương, thưởng ký mới 10 triệu.]
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 10)
    ~ gd_tien_cty(-10)
    idol_het_thoi: *(tháo kính)* Cảm ơn anh. Em sẽ… em sẽ hát cho đàng hoàng.
* [✂️ Không gia hạn. "Em tự do rồi, đi tìm chỗ hợp hơn."]
    ~ qh("idol_het_thoi", -20)
    ~ qh("quan_ly_idol", -15)
    ~ gd_tien_cty(96)
- _Việc thứ hai: Phó Giám đốc._
* [👑 {con_ong_chau_cha}.]
    ~ gd_pho_giam_doc = "con_ong_chau_cha"
    con_ong_chau_cha: Dạ… chú ơi, con… con không muốn ghế đó. Con muốn làm nhạc.
    _Cả phòng sững sờ. {truong_phong} sững sờ nhất. Cái ghế Phó Giám đốc vẫn trống._
    ~ gd_pho_giam_doc = ""
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
* [👀 {ran_doc}. Người mới, mà không dính vào chuyện gì.]
    ~ gd_pho_giam_doc = "ran_doc"
    ran_doc: *(cười rất ngọt)* Dạ em cảm ơn anh. Em sẽ cố gắng không phụ lòng anh ạ.
    _{chi_dai} nhìn {ran_doc} rất lâu. {thanh_ninh} đánh rơi cây bút. {it} lẩm bẩm gì đó, nghe như "lỗi người dùng"._
    ~ qh("ran_doc", 20)
    ~ qh("chi_dai", -10)
    ~ qh("thanh_ninh", -10)
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
* [🗑️ "Không cắt ai. Nếu Đại Nhạc Hội thất bại, anh đi trước."]
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
_Đại Nhạc Hội Siêu Nhân. Bộ hóa trang của bạn, do {designer} chọn, vừa được gửi tới: "Ông Kẹ Ngân Hàng". Áo vest đen, mặt nạ xám, một cái túi tiền rỗng, và tấm biển "Nợ Quá Hạn"._
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
=== giam_doc_3110_truoc_gio_dien ===
# ngay:31 # gio:19:15 # noi:san_khau_dem_hong # bat_buoc
{ nguyen_theo_ll:
    _19:15. Sân khấu Đại Nhạc Hội Siêu Nhân dựng xong, đèn bật, 400 ghế {thuc_tap_sinh} xếp thẳng tắp. Phòng thay đồ của Siêu Nhân Hồng trống trơn._
    _Bên kia đường, màn hình LED khổng lồ trên tòa LL sáng lên, quay thẳng về phía sân khấu của bạn._
    _{chi_dai} đặt bộ đàm vào tay bạn: "Anh mở màn đi. Show vẫn chạy."_
    -> END
}
_19:15. Sau cánh gà. {sieu_nhan_hong} đã mặc đồ xong, ngồi một mình trên thùng loa, hai tay đan vào nhau. Thấy bạn, cậu ấy đứng bật dậy._
sieu_nhan_hong: Sếp ơi… lát hát bài cuối, em có nên tháo mũ hông?
* [🙅 "Đó là của em. Em quyết."]
    _{sieu_nhan_hong} gật đầu. Bạn không ép. Lần này "tùy em" nghĩa là tùy em thật._
    ~ qh("sieu_nhan_hong", 10)
* [🔥 "Tháo đi! Tạo sốc!"]
    { qh_sieu_nhan_hong >= 60:
        sieu_nhan_hong: *(im lặng rất lâu, rồi gật đầu)* … Dạ. Lâu rồi em cũng muốn vậy.
        ~ nguyen_thao_mu_dem_hong = true
    - else:
        sieu_nhan_hong: *(lùi một bước)* Điều khoản số 1, sếp. Hông ai được ép em.
        _Cậu ấy quay đi. Bạn vừa làm đúng cái việc hợp đồng cấm. Năm phút trước giờ diễn._
        ~ qh("sieu_nhan_hong", -15)
    }
* [😶 Vỗ vai, không nói gì.]
    sieu_nhan_hong: *(cười dưới mũ)* Dạ. Em hiểu rồi.
- _{chi_dai} gọi bộ đàm: "Sếp ơi, ra cầm micro. Mười lăm phút nữa mở màn."_
-> END
