// ============================================================
// THỰC TẬP SINH · CHƯƠNG 6: "HẾT THỰC TẬP" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== thuc_tap_sinh_2810_video_linh ===
# ngay:28 # gio:09:30 # noi:tang_1 # bat_buoc
_Đêm qua 2 giờ 10, fanpage công ty tự đăng một video lạ: cảnh {quan_ly_idol} ngủ gục trên xe, cầm hai điện thoại, đắp áo cho {idol_het_thoi}. Cuối video: "Em thích anh lâu rồi."_
_{editor} xuất nhầm. Video nằm trên fanpage 6 phút, khoảng 2.000 lượt xem rồi bị gỡ. Sáng nay cả tầng 1 vẫn nói về nó._
_Cùng lúc, {dan_dau_tu} đứng bật dậy: "Bộ lọc của tui lần ra 80 nghìn tài khoản ảo. Tất cả comment 'Anh {idol_het_thoi} đỉnh nóc kịch trần'."_
_Cả tầng 1 rối như tơ vò. Bạn đứng giữa, tay cầm xấp giấy photo._
* [☕ Pha một ly cà phê đen đá không đường, để lên bàn {editor}, không nói gì.]
    editor: *(nhìn ly cà phê)* … Em biết tui uống gì hả. Cảm ơn.
    ~ qh("editor", 10)
* [🤝 Ngồi xuống cạnh {idol_het_thoi}, người đang đeo kính đen trong nhà lúc 9 giờ 30 sáng.]
    idol_het_thoi: Em biết anh là ai không?
    thuc_tap_sinh: Dạ biết. Anh là người hát "Công Viên" mà hồi đó em nghe trên đường đi làm mỗi sáng ạ. Thật, không phải fan ảo ạ.
    _{idol_het_thoi} gỡ kính ra. Lần đầu tiên trong tháng._
    ~ qh("idol_het_thoi", 15)
* [🧮 Phụ {dan_dau_tu} kiểm tra lại bộ lọc.]
    _Bạn nhìn bảng số liệu 3 giây. "Dạ cột F trùng 2 nghìn tài khoản, phải trừ ra ạ." {dan_dau_tu} sửa. Bạn đúng._
    ~ duy_lo(10)
    ~ qh("dan_dau_tu", 5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2810_the_hong ===
# ngay:28 # gio:14:00 # noi:phong_giam_doc
_14 giờ. {giam_doc} ngồi ôm đầu: Đại Nhạc Hội Siêu Nhân thiếu tiền làm sân khấu. Nhà tài trợ "chắc kèo" của {sales} không có thật. Sữa Chua Hồng Hào thì không ai tin._
{ duy_do_lo < 60:
    _Bạn đứng ngoài cửa, cầm xấp giấy photo. Bạn biết có một cách. Nhưng cách đó cần cả công ty biết bạn là ai. Và bạn chưa sẵn sàng._
    ~ duy_day_viec(1)
    -> END
}
_Bạn đứng ngoài cửa. Giờ thì cả công ty đã biết, hoặc gần như biết, bạn là ai. Không còn gì để giấu nữa._
* [🔒 Gõ cửa: "Dạ anh, em gọi ngân hàng cũ thử, họ có gói tài trợ 'Thẻ Hồng' cho sự kiện giới trẻ ạ."]
    _Bạn gọi. Bật loa ngoài. "Anh Tư ạ, em {thuc_tap_sinh}. Bên mình có muốn tài trợ thẻ đồng thương hiệu cho đêm diễn của Siêu Nhân Hồng không ạ? Khán giả 20 nghìn, top xu hướng."_
    _20 phút. Sếp cũ gọi lại: "300 triệu. Logo thẻ hồng trên backdrop. Mày làm đầu mối."_
    giam_doc: *(đứng dậy)* 300… 300 triệu?
    ~ duy_the_hong = true
    ~ chung_tien_do_dem_hong = gioi_han(chung_tien_do_dem_hong + 15)
    _300 triệu. Đủ trả 80 triệu tiền thuê sân khấu hạn 17 giờ mai, đủ thuê thêm hai giàn đèn mà {chi_dai} đang thiếu._
    ~ follow(30000)
    ~ duy_lo(25)
    ~ phat_hien(duy_tung_lam_ngan_hang)
    ~ qh("giam_doc", 20)
    ~ duy_kn(10)
    _Từ hôm đó, ai cũng biết {thuc_tap_sinh} là ai._
* [😶 Đứng ngoài. Đi photo tiếp.]
    ~ duy_lua_doi(-3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2810_song_ao ===
# ngay:28 # gio:20:00 # noi:quan_ca_phe_song_ao
_Tối. Bạn ghé Cà Phê Sống Ảo mua ly cà phê, vì quán đầu hẻm đã gọi bạn là "anh kim cương". Người phục vụ bàn số 2 đeo khẩu trang, đội mũ lưỡi trai, bảng tên "RỒNG"._
_Đôi sneaker trắng tinh. Bạn biết đôi giày đó. Bạn đã tra giá nó hồi đầu tháng: 4 triệu._
* [🤫 Thì thầm: "Dạ… anh Rồng. Em cho em làm chung được hông ạ?"]
    con_ong_chau_cha: *(kéo khẩu trang xuống nửa chừng, cười)* Suỵt. Anh có lương thực tập mà?
    thuc_tap_sinh: Dạ… em muốn làm chung với anh.
    _Thần tượng của bạn là một phục vụ quán cà phê. Bạn thấy tự hào hơn trước._
    ~ duy_bat_gap_rong = true
    ~ qh("con_ong_chau_cha", 12)
    ~ duy_lua_doi(5)
* [😶 Gọi món như khách thường, không nói gì.]
    _Bạn gọi một ly cà phê đen. "Rồng" mang ra, đặt xuống, khựng lại nửa giây khi thấy bạn. Bạn chỉ nói: "Dạ cảm ơn anh." Tiền tip để dưới ly: 50 nghìn, tiền mặt._
    ~ duy_bat_gap_rong = true
    ~ qh("con_ong_chau_cha", 8)
* [👔 "Dạ… giày anh giống anh {con_ong_chau_cha} quá ạ."]
    con_ong_chau_cha: *(giả giọng)* Dạ anh nhầm người rồi ạ.
    _Bạn gật đầu. Bạn không nhầm. Nhưng bạn để anh ấy giữ cái mũ của mình._
    ~ duy_ngo(3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2810_moc_4 ===
# ngay:28 # gio:17:00 # noi:tang_1 # bat_buoc
_Mốc 4: 800.000 người theo dõi._
{ nguoi_theo_doi >= 800000:
    hong_hot: {nguoi_theo_doi}! Mốc 4! Còn một bước nữa thôi!
    _Cả tầng 1 vỗ tay. Bạn vỗ tay. Ngày mai hết thực tập… à không, ngày kia. Bạn đếm ngón tay._
    ~ duy_lua_doi(5)
- else:
    hong_hot: Trượt mốc 4… {nguoi_theo_doi}. Bên LL đang đăng bài "Siêu sao cần một ngôi nhà lớn hơn".
    ~ cang_thang(15)
}
_Tối đó, bạn ngồi viết bảng tổng kết thực tập: những gì đã học, những gì đã làm, những gì đã sai. 4 trang, chữ nghiêng, đều. Theo mẫu báo cáo thẩm định._
* [📝 Viết thật hết, kể cả những lần bị đẩy việc.]
    ~ duy_kn(5)
    _Trang cuối, bạn viết: "Em vẫn muốn ở lại."_
* [📝 Viết đẹp, khiêm tốn, như mọi thực tập sinh khác.]
    ~ duy_ngo(3)
    _Trang cuối, bạn viết: "Em cảm ơn anh chị đã dạy em." Đúng. Nhưng không đủ._
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2910_wifi_sap ===
# ngay:29 # gio:09:10 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. 9 giờ: wifi sập. Cả công ty. Tất cả máy tính hiện cùng một con khủng long._
_Sau tủ mạng, một sợi dây bị cắn đứt. Dưới đáy tủ là con gà cao su của {cho}, ai đó giấu từ hôm 4/10. {it} bị cả công ty truy đuổi qua 3 tầng. Video của {editor} kẹt ở 99%._
_Bạn đứng giữa tầng 1. 8 năm ngân hàng. 3 lần hệ thống sập đúng ngày quyết toán. Bạn đã thấy cảnh này. Bạn biết phải làm gì._
* {duy_kinh_nghiem >= 50} [📋 Đứng lên ghế: "Dạ mọi người! Em xin 10 phút. Mình chuyển sang giấy ạ!"]
    _Sổ giao việc: một cuốn, mỗi trang một người. Phiếu chuyển file bằng USB, có chữ ký nhận. Bảng tiến độ dán tường, màu đỏ vàng xanh. Chòi bảo vệ thành tổng đài giấy._
    _11 giờ, cả công ty chạy lại như chưa từng sập. {truong_phong} đứng nhìn bảng tiến độ trên tường, há miệng._
    truong_phong: Cậu… cậu làm cái này ở đâu ra?
    thuc_tap_sinh: Dạ… hồi trước em làm… à, dạ em mới vô nên tự nghĩ ạ.
    ~ duy_toa_sang_2910 = true
    ~ duy_kn(15)
    ~ duy_lua_doi(15)
    ~ duy_lo(10)
    ~ qh("truong_phong", 15)
    ~ qh("chi_dai", 10)
    ~ uy_tin = uy_tin + 15
    ~ follow(10000)
* [🙇 "Dạ để em chạy giấy giữa các tầng ạ."]
    ~ duy_da()
    ~ duy_day_viec(3)
    ~ duy_kn(5)
    ~ nghi(-30)
    _Bạn chạy 3 tầng, 41 lượt. Đôi giày lười bắt chước {con_ong_chau_cha} mòn gót._
* [🛡️ Gọi {chi_dai} điều phối.]
    ~ duy_lan_goi_huong++
    chi_dai: *(bộ đàm)* Kênh 3. Ai cần gì gọi chị. {thuc_tap_sinh}, em đứng cạnh chị, ghi lại.
    ~ duy_kn(5)
    ~ qh("chi_dai", 3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2910_tong_dai_giay ===
# ngay:29 # gio:14:30 # noi:chong_bao_ve
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} đeo kính lão, xếp từng tờ giấy vào từng ngăn. Ai cần gì thì viết, bác chuyển._
bac_bao_ve: Bác chuyển thư cho người ta mười mấy năm rồi. Thêm vài tờ có sao.
_Một tờ giấy mới tới, chữ của {ke_toan}: "Gửi {thuc_tap_sinh}. Hồ sơ đoàn thuế cần bổ sung. Em giúp chị nốt. Chị cảm ơn em."_
* [🤝 Lên phòng kế toán ngay.]
    _Bạn bổ sung trong 30 phút. {ke_toan} ký nhận, rồi nói nhỏ: "Chị đã đề xuất tên em trong buổi họp ngày mai."_
    ~ qh("ke_toan", 10)
    ~ duy_kn(5)
* [🍵 Ngồi phụ bác chuyển giấy một lúc.]
    _Bạn với bác ngồi phân giấy. Bác đọc từng tờ, chậm rãi, như đọc thư. Có tờ của {chua_te_deadline} gửi {it}: "Cue 12 {cho} ăn mất rồi, gửi lại giùm."_
    bac_bao_ve: Cháu biết không, có những người ở xa, bác cũng chuyển thư như thế này. Họ tin bác. Bác cũng tin cháu.
    ~ qh("bac_bao_ve", 10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2910_quan_net ===
# ngay:29 # gio:21:00 # noi:quan_net_go_phim
_Tối. Wifi công ty vẫn sập. Quán net Gõ Phím đông chưa từng thấy: nửa công ty kéo tới._
_Máy số 14 là {chua_te_deadline}, đang làm cue sheet Đại Nhạc Hội Siêu Nhân. Máy số 15 là bạn._
chua_te_deadline: Anh {thuc_tap_sinh}… em xin lỗi. Tháng này em nhờ anh nhiều quá.
* [😇 "Dạ em học được nhiều mà anh."]
    chua_te_deadline: Anh nói vậy em càng thấy tệ. Mai họp đánh giá, em sẽ nói tên anh.
    ~ qh("chua_te_deadline", 10)
* [😤 "Dạ, nhiều thật anh ạ."]
    chua_te_deadline: *(cười)* Ừ. Em biết. Công bằng.
    ~ qh("chua_te_deadline", 5)
    ~ duy_lua_doi(3)
* [🤝 "Dạ để em in phiếu chuyển file, rồi chép giùm anh {editor} video '16 năm' ra USB, phòng khi mạng chưa về ạ."]
    ~ duy_da()
    chua_te_deadline: Anh lại nữa rồi… Mà cảm ơn anh.
    _22 giờ 47, wifi có lại. Video của {editor} chạy tới 100%. Bản trong USB hình con cú thành bản dự phòng. {editor} nhắn bạn một chữ: "Đẹp."_
    ~ qh("chua_te_deadline", 8)
    ~ qh("editor", 8)
    ~ duy_kn(2)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_3010_don_kho ===
# ngay:30 # gio:10:00 # noi:gam_cau_thang # bat_buoc
_Sáng 30/10. {hr} cho dọn kho trước họp đánh giá. Bạn được giao dọn gầm cầu thang._
_Gầm cầu thang. Kho báu của {cho}: chùm chìa khóa, thỏi son, một điện thoại cũ, chiếc tất sọc cam, một cái găng tay hồng, một cái USB không nhãn mùi cà phê sữa đá._
cho: *(đứng chắn trước kho, nhìn bạn)* Grừ… *(rồi nhận ra bạn)* … Gâu?
* [🛡️ "Dạ anh {hr}, chỗ này em dọn rồi ạ." (không đụng vào gì)]
    _Bạn quét quanh, lau sàn, không động vào một món nào của {cho}. {cho} nằm xuống, gối đầu lên chiếc găng tay hồng._
    hr: Sạch ghê. Anh ghi nhận.
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 5)
* [🧹 Dọn sạch, gom hết vào thùng "đồ thất lạc", để ở chòi bảo vệ.]
    _Bạn ghi nhãn từng món: "Chìa khóa (chưa rõ chủ)", "Son (hồng)", "USB không nhãn (mùi cà phê)". Như lập biên bản tài sản. Bác {bac_bao_ve} nhận thùng, gật đầu._
    bac_bao_ve: Cháu làm như người ta kiểm kê kho tiền ấy.
    ~ duy_kn(3)
    ~ duy_lo(3)
    ~ qh("cho", -5)
* [🙇 Đổ hết vào bao rác như {hr} dặn.]
    ~ duy_da()
    cho: *(nhìn cái bao rác, rồi nhìn bạn, rất lâu)* …
    _Lần đầu tiên {cho} không vẫy đuôi với bạn._
    ~ qh("cho", -20)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá. Ngày hết thực tập. {giam_doc}, {truong_phong}, {hr} ngồi một hàng. Bạn ngồi một mình ở ghế đối diện, cuốn sổ trên đùi._
truong_phong: Tớ trình bày về thực tập sinh {thuc_tap_sinh}. Hai tháng. Việc gì cũng làm. Làm hết.
{ duy_toa_sang_2910:
    truong_phong: Và hôm qua, khi wifi sập, cậu ấy là người giữ cả công ty chạy. Tớ… phải ghi nhận.
}
{ duy_y_tuong_24h:
    truong_phong: Ý tưởng "24 Giờ Giúp Người" là của cậu ấy. Hai mươi nghìn người theo dõi.
}
hr: Mình cùng nhìn lại hành trình nha em. Em muốn ở lại không?
* [😇 "Dạ em muốn ở lại ạ. Em vẫn muốn cầm tấm hắt sáng."]
    ~ duy_lua_doi(5)
* [❓ "Dạ, nếu ở lại thì em có được ghi tên vào sản phẩm không ạ?"]
    hr: *(khựng)* Câu hỏi hay. Anh chưa nghĩ tới.
    truong_phong: Có. Từ giờ có. Tớ hứa.
    ~ duy_lua_doi(5)
    ~ duy_ngo(-3)
* {duy_nhan_loi_ngan_hang} [🏦 "Dạ… em đã nhận lời một chỗ khác ạ."]
    giam_doc: Chỗ khác? Ở đâu?
    thuc_tap_sinh: Dạ… ngân hàng ạ.
    _Cả hàng ghế im lặng. {hr} ngưng cười. Lần đầu tiên._
- { duy_kinh_nghiem >= 60 && duy_lua >= 50 && qh_truong_phong >= 20 && not duy_nhan_loi_ngan_hang:
    ~ duy_giu_lai = true
    hr: *(đẩy qua một tờ giấy)* Hợp đồng chính thức. 13 triệu. Em đọc rồi ký nha em.
    _Bạn đọc nguyên 8 trang. Từng điều khoản. Phản xạ nghề. Cả phòng chờ 11 phút. Không ai giục._
    _Bạn ký._
- else:
    hr: Anh cảm ơn em vì đã đồng hành cùng {cong_ty} trong 2 tháng qua.
    _Câu đó. Câu mà mọi thực tập sinh đều sợ nghe nhất. Bạn gật đầu. Bạn cảm ơn. Bạn đứng dậy._
}
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_3010_cuoc_goi_cuoi ===
# ngay:30 # gio:20:00 # noi:hem_69
_20 giờ. Phòng 12 dãy B. Điện thoại reo. Anh Tư, sếp cũ._
_"Duy. Mai là 31. Ghế phó giám đốc anh giữ tới hôm nay. Mày về không?"_
{ duy_nhan_loi_ngan_hang:
    _Bạn đã nhận lời từ chủ nhật. Anh Tư chỉ gọi để nhắc giờ: "Thứ 2, 8 giờ. Mặc vest. Đeo kính."_
    -> END
}
{ duy_tu_choi_ngan_hang:
    _Bạn đã từ chối. Anh Tư vẫn gọi, vì anh Tư không quen bị từ chối._
}
* [😤 "Dạ em ở lại ạ. Em cảm ơn anh."]
    ~ duy_tu_choi_ngan_hang = true
    _"Mày lì thật." Anh Tư cúp máy. Nhưng trước khi cúp, anh cười một tiếng. Bạn nghe được._
    ~ duy_lua_doi(5)
* {not duy_giu_lai} [🏦 "Dạ… em về ạ."]
    ~ duy_nhan_loi_ngan_hang = true
    _"Tốt. Thứ 2, 8 giờ." Bạn đặt điện thoại xuống. Tháp mì gói vẫn đứng đó. Cái thẻ vẫn dưới gối._
    ~ duy_lua_doi(-10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_3110_dung_san_khau ===
# ngay:31 # gio:14:00 # noi:san_khau_dem_hong # bat_buoc
_Sân khấu Đại Nhạc Hội Siêu Nhân. {chi_dai} điều phối bằng bộ đàm. Bạn khiêng ghế, treo backdrop, dán băng keo dây điện. Như mọi khi._
{ duy_giu_lai:
    _Nhưng hôm nay trên cổ bạn có dây đeo thẻ màu cam. Thẻ nhân viên. Có ảnh. Có tên._
- else:
    _Hôm nay là ngày cuối cùng bạn đeo thẻ "Thực tập sinh". Bạn vẫn khiêng ghế như mọi khi._
}
_Một bạn sinh viên tình nguyện chạy tới, rụt rè: "Dạ anh ơi, cái này để đâu ạ? Em mới vô nên chưa biết ạ."_
* [😇 Cười, chỉ cho bạn đó từng việc một, rất chậm.]
    _Bạn chỉ. Cách cầm tấm hắt sáng. Cách xếp ghế để {chi_dai} không ngồi cạnh {thanh_ninh}. Cách gỡ kẹt máy in, đá đúng chỗ._
    _Bạn sinh viên ghi vào sổ. Bạn thấy mình trong cuốn sổ đó._
    ~ duy_lua_doi(5)
    ~ duy_kn(2)
* [🙇 "Dạ để anh làm cho, em nghỉ đi."]
    ~ duy_da()
    _Bạn làm luôn phần của bạn sinh viên. Thói quen hai tháng khó bỏ._
    ~ nghi(-10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_3110_dem_hong ===
# ngay:31 # gio:19:15 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 15. Mười lăm phút nữa mở màn. Bạn đứng ở chân sân khấu, cầm tấm hắt sáng tròn, to như cái nắp chảo. Lần cuối. Hoặc lần đầu._
{ duy_doi_chat_oanh && qh_bien_kich >= -20:
    _{bien_kich} đi ngang, dúi vào tay bạn một tờ giấy in dòng chữ cuối phim. "Ý tưởng: {thuc_tap_sinh}. Kịch bản: {bien_kich} & {thuc_tap_sinh}." Chị nói nhỏ: "Tui sửa file rồi. Tối nay chiếu bản này."_
    ~ chung_phim_ghi_ten_duy = true
- else:
    _Ở bàn kỹ thuật, file phim "Người Hùng Không Tên" đã sẵn sàng. Dòng chữ cuối vẫn như hôm chiếu thử._
}
{ nguyen_theo_ll:
    _Phòng chờ của {sieu_nhan_hong} trống. Đĩa bánh chuối chiên bạn mua sáng nay vẫn còn nguyên. Bên kia đường, màn hình LED của LL thử hình một bộ đồ hồng viền xanh lá chuối._
}
_Ánh đèn tổng duyệt chiếu lệch. Một nửa sân khấu bị tối._
* [💡 Đứng đúng chỗ đánh dấu, tập lại góc hắt sáng một lượt.]
    _Bạn đi trái, đi phải, đếm bước. Tay mỏi từ lượt thứ 3. Bạn không hạ tay._
    ~ duy_kn(3)
    ~ nghi(-20)
* [🛡️ Gọi bộ đàm cho {it} chỉnh đèn chính.]
    it: *(bộ đàm)* Rồi.
    _Đèn chỉnh. Tấm hắt sáng của bạn thành thừa. Bạn vẫn đứng đó, cầm nó, cho chắc._
    ~ qh("it", 3)
- _19 giờ 29. Đèn tắt. Bạn nín thở._
-> END
