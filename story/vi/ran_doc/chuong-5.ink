// ============================================================
// CHƯƠNG 5: "RẮN GẶP RẮN" (21/10 – 27/10)
// Con rắn thứ hai: {ten(ran_thu_hai)} (game chọn ngẫu nhiên mỗi lượt)
// ============================================================

// ------------------------------------------------------------
=== ran_doc_2110_confession ===
# ngay:21 # gio:09:00 # noi:tang_1 # bat_buoc
_Trang "Confession {cong_ty}" vừa đăng một bài ẩn danh: "Có ai biết giám đốc đã thế chấp biệt thự ở Ngân hàng Tín Dụng Đen Đủi để trả lương không? Hạn 15/11 đó."_
~ phat_hien(the_chap_biet_thu)
_Cả tầng 1 xôn xao. {hr} và {it} đi từ bàn này sang bàn khác, hỏi từng người. Nụ cười của {hr} hôm nay rộng hơn mọi ngày._
hr: Em {ran_doc} ơi, em rảnh không, lên phòng anh uống trà xíu. Anh chỉ muốn lắng nghe em thôi.
{ rd_nghi_ngo >= 50:
    hr: Dạo này tên em xuất hiện trong khá nhiều câu chuyện đó em.
}
* [😇 Giả nai: "Dạ em mới vô có ba tuần, em còn chưa biết biệt thự sếp ở đâu nữa anh."]
    { rd_nghi_ngo < 50:
        hr: Ừ, anh tin em. Em là người tích cực. Em về làm việc đi.
        ~ rd_nghi(-5)
    - else:
        hr: Anh tin em. Anh chỉ ghi nhận thôi.
        _Anh ta ghi vào cuốn sổ. Bạn thấy chữ cuối cùng: "theo dõi"._
        ~ rd_nghi(5)
    }
* [🐍 Đổ cho {hong_hot}: "Dạ, em thấy bà {hong_hot} hay ôm laptop lúc 2 giờ sáng lắm."]
    ~ rd_nghi(-10)
    ~ rd_tung_tin(10, 0)
    ~ qh("hong_hot", -15)
    hr: Cảm ơn em đã đồng hành cùng phòng nhân sự.
    _{it} đứng sau lưng {hr}, nhìn bạn. {it} biết ai là admin. {it} cũng biết bạn vừa đẩy {hong_hot} ra trước._
    ~ qh("it", -10)
* [🤝 "Em không biết ai gửi. Nhưng em giúp anh {it} kiểm tra được."]
    -> ran_doc_2110_cung_tra_log
- -> END

= ran_doc_2110_cung_tra_log
_Phòng server. {it} mở log. Bài đăng gửi qua tin nhắn ẩn danh, từ một thiết bị lạ, đăng nhập bằng wifi công ty lúc 23:47._
it: Thiết bị này… cũng là thiết bị đã vào máy phòng giám đốc đêm 17. Hôm cả công ty đi Vũng Tàu.
_Bạn đã ở Vũng Tàu đêm đó, trong phòng 205. Vậy ai ở lại?_
~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
~ qh("it", 10)
~ rd_tin(5)
it: Không phải anh. Không phải {hong_hot}. Còn lại thì… để tôi xem tiếp.
-> END

// ------------------------------------------------------------
=== ran_doc_2110_moc_500k ===
# ngay:21 # gio:17:00 # noi:tang_1 # bat_buoc
_Mốc 3: 500.000 người theo dõi._
{ nguoi_theo_doi >= 500000:
    _Màn hình hiện {nguoi_theo_doi}. Đạt. {giam_doc} đứng vỗ tay một mình, mắt thâm quầng sau bài confession sáng nay._
- else:
    _Màn hình hiện {nguoi_theo_doi}. Không đạt. Tin đồn bắt đầu lan khắp các bàn: "Nếu thất bại thì cắt giảm nhân sự"._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
    thuc_tap_sinh: *(thì thầm)* Anh {ran_doc} ơi… em là thực tập sinh, chắc em bị cắt đầu tiên hả anh?
}
_Bạn nhìn con số. Mỗi người theo dõi ít đi là một bước gần hơn tới cái ngày cả công ty ôm thùng carton ra về. Kể cả {thuc_tap_sinh}. Kể cả bác {bac_bao_ve}. Kể cả bạn._
* [💢 Vẫn thấy hả dạ khi nhìn con số.]
    ~ rd_han(5)
    _Bạn nhắc mình: đây là điều bạn muốn. Bạn nhắc mình hơi nhiều lần._
* [🤝 Nói với {thuc_tap_sinh}: "Hông sao đâu. Để tui coi có cách gì giúp chiến dịch."]
    ~ rd_giup(10000)
    ~ qh("thuc_tap_sinh", 10)
    ~ rd_han(-5)
* [😶 Đi lên sân thượng.]
    ~ cang_thang(-5)
    _Gió sân thượng thổi tung cuốn sổ tay. Trang nào cũng có tên một người. Bạn chưa từng nghĩ họ sẽ mất việc._
- -> END

// ------------------------------------------------------------
=== ran_doc_2210_doan_thue ===
# ngay:22 # gio:09:30 # noi:sanh_tang_tret # bat_buoc
_Đoàn kiểm tra thuế bất ngờ tới. Trưởng đoàn là chú Liêm, 55 tuổi, cặp da đen, mặt nghiêm như sổ cái._
chu_liem: Cho xem sổ sách. Bản gốc giấy tờ thành lập. Hợp đồng với BTT Global. Bằng chứng nghiệm thu dự án tháng 6. Và nguồn gốc khoản 5 tỷ.
_Cả công ty giả vờ làm việc chăm chỉ. {chua_te_deadline} mặt xanh lét: file gốc dự án tháng 6 đã mất từ tháng 9._
_{cho} lững thững đi ngang. Chú Liêm lùi lại ba bước, nép sau cột._
chu_liem: Con… con chó đó có xích không?
* {rd_dong_minh_tuat} [🐾 Huýt sáo gọi {cho} lại gần chú Liêm.]
    cho: Gâu? *(vẫy đuôi, đi tới ngửi giày chú Liêm)*
    chu_liem: Ối! Thôi! Thôi được rồi! Cho… cho các anh chị thêm một tuần nộp bổ sung!
    _Cả công ty thở phào. {ke_toan} nhìn {cho}, rồi nhìn bạn, như nhìn hai vị cứu tinh._
    ~ qh("ke_toan", 15)
    ~ rd_so_lan_dung_tuat = rd_so_lan_dung_tuat + 1
    ~ rd_giup(0)
* {rd_dong_minh_tuat} [🐾 Ra hiệu cho {cho} dẫn đường xuống gầm cầu thang. Cái USB không nhãn…]
    _{cho} dẫn bạn xuống kho. Lần này nó không gầm gừ. Nó đẩy cái USB thơm mùi cà phê sữa đá về phía bạn._
    ~ nhan(usb_khong_nhan)
    ~ phat_hien(usb_cua_vu)
    chua_te_deadline: *(cắm USB vào máy, hét lên)* FILE GỐC! Ông lấy đâu ra vậy?! Ét o ét, tui sống rồi!
    chu_liem: Được. Bằng chứng nghiệm thu đầy đủ.
    ~ qh("chua_te_deadline", 25)
    ~ rd_giup(10000)
    ~ rd_so_lan_dung_tuat = rd_so_lan_dung_tuat + 1
* [🐍 Nói nhỏ với chú Liêm: "Chú hỏi thử ông Siêu Nhân Hồng tiền ở đâu ra coi."]
    ~ rd_tung_tin(10, 10)
    chu_liem: Anh Siêu Nhân. Khoản 5 tỷ của anh, nguồn từ đâu?
    _{sieu_nhan_hong} đứng hình giữa sảnh. {ke_toan} bước lên, chắn trước mặt hắn._
    ke_toan: Dạ chú, khoản này có hợp đồng, có chứng từ đầy đủ. Em trình chú.
    _{ke_toan} nhìn bạn. Lần này không phải ánh mắt cảm ơn._
    ~ qh("ke_toan", -15)
    ~ rd_tin_mat()
* [😶 Giả vờ gõ phím thật nhanh.]
    _Bạn gõ "asdfghjkl" 400 lần. Trông rất chăm chỉ._
- -> END

// ------------------------------------------------------------
=== ran_doc_2210_ke_toan_mat_ngu ===
# ngay:22 # gio:21:30 # noi:san_thuong
_Sân thượng, tối. {ke_toan} ngồi một mình trên ghế nhựa, ôm một cuốn sổ. Mắt thâm như gấu trúc._
ke_toan: Em lên đây làm gì? Hóa đơn đâu em? *(cười mệt)* Giỡn thôi.
* [😇 Ngồi xuống cạnh: "Chị ngủ được mấy tiếng rồi chị?"]
    ke_toan: Ba ngày, tổng cộng chắc 7 tiếng. Hai tỷ trong quỹ, mười tỷ nếu thua. Tính hoài vẫn ra số âm.
    ke_toan: Em biết không, tôi có để dành một ít. Đề phòng. Gần đủ một tháng lương cho mọi người. Đừng nói ai.
    ~ phat_hien(quy_den_thuong)
    ~ rd_tin_mat()
    ~ qh("ke_toan", 15)
    ~ rd_han(-3)
    _Có người âm thầm gom tiền để cứu tất cả. Còn bạn âm thầm gom tin để phá tất cả._
* [🐍 "Chị ơi, nếu công ty sập thì chị có… chuẩn bị gì chưa?"]
    ke_toan: *(nhìn bạn rất lâu)* Em hỏi để làm gì?
    ~ rd_nghi(5)
    ~ qh("ke_toan", -5)
    ke_toan: Về đi em. Tôi muốn ngồi một mình.
* [🤝 Đưa chị ly trà sữa còn nguyên trong túi.]
    ~ qh("ke_toan", 10)
    ke_toan: …Không có hóa đơn hả? Thôi được, lần này tôi nhận.
- -> END

// ------------------------------------------------------------
=== ran_doc_2310_chuan_bi_banh ===
# ngay:23 # gio:10:00 # noi:studio_tang_2 # bat_buoc
_23/10. Sinh nhật {sieu_nhan_hong}. Bạn được giao tổ chức. Cái bánh kem hồng 3 tầng vừa giao tới, to như cái tủ lạnh mini._
sales: Tối nay livestream phải có Mr. Kevin Trộn chúc mừng! Ai đóng giả? {thuc_tap_sinh}, {dan_dau_tu}, hay bác {bac_bao_ve}?
_Hộp bánh thơm mùi kem dâu… và một mùi lạ. Nước hoa. Mùi lá chuối xanh._
{ rd_dong_minh_tuat:
    cho: *(ngửi hộp bánh, hắt hơi liên tục)* Gâu! Gâu! *(chạy vòng quanh, rồi chạy thẳng về phía bàn của {ten(ran_thu_hai)})*
    ~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
    _{cho} đứng trước bàn của {ten(ran_thu_hai)}, sủa ba tiếng, rồi quay lại nhìn bạn. Như muốn nói: "Mùi này nè."_
}
* [🧨 Đặt bánh ở góc thấp, gần lối đi của {cho}.]
    ~ rd_nghi(5)
    ~ rd_so_lan_dung_tuat = rd_so_lan_dung_tuat + 1
    _Bạn không làm gì cả. Bạn chỉ để cái bánh ở chỗ… tiện. Tiện cho một cái mũi đen ươn ướt._
* [🤝 Đặt bánh trên bàn cao, dặn bác {bac_bao_ve} giữ {cho} ở chòi tới tối.]
    bac_bao_ve: Ừ. Bác giữ. Nhưng nó mà muốn đi thì bác cũng chịu.
    ~ rd_giup(0)
    ~ rd_han(-3)
* [💬 Đề xuất bác {bac_bao_ve} đóng Mr. Kevin Trộn.]
    bac_bao_ve: Bác á? Bác nói giọng Bắc mà?
    sales: Càng tốt! Chủ tịch tập đoàn toàn cầu thì phải có giọng lạ! Tin chị đi!
    ~ qh("sales", 5)
    ~ qh("bac_bao_ve", -2)
- -> END

// ------------------------------------------------------------
=== ran_doc_2310_livestream ===
# ngay:23 # gio:20:00 # noi:studio_tang_2 # bat_buoc
_20 giờ, studio tầng 2. Livestream sinh nhật. 30.000 người đang xem. {hong_hot} cầm máy, {it} lo âm thanh, cả công ty đội mũ sinh nhật hồng._
_Giữa buổi, {sieu_nhan_hong} cầm micro, quay về phía {chua_te_deadline}._
sieu_nhan_hong: {chua_te_deadline} ơi… anh thích em. Hông phải PR đâu. Thật đó.
_Hashtag VũƠiTrảLờiĐi lên xu hướng sau 6 phút. {chua_te_deadline} đứng hình, tay vẫn cầm điện thoại đang lướt Tóp-tóp._
chua_te_deadline: *(cười, vỗ vai {sieu_nhan_hong})* Ý tưởng PR hay đó anh.
_{sieu_nhan_hong} cười theo. Chỉ có bạn, đứng gần nhất, thấy bàn tay có sẹo nắm chặt micro tới trắng bệch._
_Rồi từ cửa, một cái bóng đen lao vào. {cho}. Thẳng về phía cái bánh 3 tầng._ # hen_gio:4
* [🐾 Hô: "{cho}! Bánh đó!"]
    _{cho} hiểu đúng hai chữ: "{cho}" và "Bánh". Cái bánh đổ ụp. Kem hồng bay lên mũ {sieu_nhan_hong}, lên mặt {giam_doc}, lên máy quay._
    ~ rd_pha(0)
    ~ rd_so_lan_dung_tuat = rd_so_lan_dung_tuat + 1
    ~ chung_so_meme = chung_so_meme + 1
    ~ follow(10000)
    _Clip "chó phá bánh siêu sao" lên xu hướng. Phá mà vẫn thành giúp. Bạn bắt đầu ghét thuật toán._
* [🤝 Lao ra ôm {cho} lại.]
    _Bạn ôm được {cho}. Nhưng {idol_het_thoi} vừa "vấp" ngay cạnh bàn bánh. Cái bánh đổ ụp._
    idol_het_thoi: Ối! Con chó! Con chó làm đó!
    _Bạn đang ôm con chó. Con chó ở xa cái bánh 2 mét. {idol_het_thoi} nhìn bạn. Bạn nhìn {idol_het_thoi}._
    ~ phat_hien(fan_ao_phat)
    ~ rd_tin_mat()
    ~ qh("cho", 10)
* [⏱️ (Không chọn kịp)]
    _Cái bánh đổ. Kem hồng bay khắp nơi. {sieu_nhan_hong} nằm xuống sàn, cười, cho {cho} liếm kem trên mũ. 30.000 người xem cười theo._
- {rd_mo_nhanh_hieu_ech:
    _Cuối buổi, {sieu_nhan_hong} cắt miếng bánh còn sót lại, đưa bạn. "Em nhỏ hơn anh, phần em trước."_
    ~ rd_han(-5)
}
-> END

// ------------------------------------------------------------
=== ran_doc_2310_dau_vet_ran_hai ===
# ngay:23 # gio:23:00 # noi:ban_lam_viec
_Gần nửa đêm, bạn quay lại công ty lấy sạc. Trên bàn bạn có một tập giấy in. Không phải của bạn._
_Ảnh chụp màn hình. Tin nhắn của bạn trong group Anti Sếp. Bình luận bằng nick ảo. Cả đoạn ghi âm thang máy, chép lại thành chữ. Trang đầu ghi: "Bằng chứng: kẻ phá chiến dịch là {ran_doc}"._
_Một tờ giấy nhớ màu xanh lá chuối dính ở góc: "Gửi LL. Chờ 30/10."_
~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
_Có ai đó đang làm đúng việc của bạn. Chỉ có điều, người đó đang làm với bạn._
* [📸 Chụp lại từng trang, để y nguyên chỗ cũ.]
    ~ rd_tin_mat()
    _Rắn biết mình đang bị rình thì không chạy. Rắn nằm im, chờ._
* [🔥 Xé hết, vứt vào thùng rác.]
    _Bạn xé. Nhưng ai làm được tập này thì còn bản sao. Giờ người đó biết bạn đã thấy._
    ~ rd_nghi(10)
* [💬 Mang lên chòi bảo vệ hỏi bác {bac_bao_ve}: tối nay ai ra vào?]
    bac_bao_ve: Tối nay à… *(uống trà)* Bác không thấy gì đâu. Nhưng sổ ra vào thì có. Cháu tự xem đi.
    _Cuốn sổ ra vào. Lúc 22:41 có một chữ ký. Nét chữ của {ten(ran_thu_hai)}._
    ~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
    ~ qh("bac_bao_ve", 3)
- -> END

// ------------------------------------------------------------
=== ran_doc_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:14:00 # noi:phong_hop_sang_tao # bat_buoc
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Bàn tròn, giấy ghi tên, mỗi cặp ngồi cạnh nhau._
chi_dai: {truong_phong} với {con_ong_chau_cha}. {designer} với {bien_kich}. {sales} với {ke_toan}. {hr} với {thanh_xin_nghi}. Chị với {thanh_ninh}.
chi_dai: Còn {dan_dau_tu} thì ngồi bàn riêng. Bàn "chủ nợ". Đứa nào cho mượn tiền thì ra đó ngồi.
_Nửa công ty đứng dậy đi ra bàn chủ nợ. Bạn được giao làm "thư ký hội nghị", ngồi giữa phòng, cầm biên bản._
truong_phong: *(với {con_ong_chau_cha})* Tớ nói thẳng nhé. Cậu không xứng với cái ghế Phó Giám đốc.
con_ong_chau_cha: Ông lấy đi. Tui đâu có muốn.
* [🔥 Đổ dầu: "Ông {con_ong_chau_cha} đừng tin. Anh {truong_phong} viết đơn xin đề bạt sửa tới 14 lần, còn kể xấu ông với sếp nữa."]
    truong_phong: Cái gì?! Ai cho em xem đơn của tớ?!
    con_ong_chau_cha: Kể xấu tui với chú tui hả? Được. Để anh gọi chú anh!
    _Hai người đứng bật dậy. Biên bản hội nghị hòa giải của bạn ghi: "14:17, cãi nhau to"._
    ~ rd_tung_tin(15, 10)
    ~ rd_loai_nhat = true
    ~ rd_loai_long = true
    chi_dai: *(đập bàn)* NGỒI XUỐNG! Đứa nào châm ngòi đó?
    ~ rd_nghi(5)
* [😇 "Hai anh nói thật lòng đi. Em ghi biên bản, không ai đọc đâu."]
    con_ong_chau_cha: Tui… thật ra tui chỉ muốn làm nhạc. Cái ghế đó ông lấy đi.
    truong_phong: *(sững sờ)* Cậu nói thật à?
    _Hai người bắt tay. Biên bản của bạn ghi: "14:17, làm hòa"._
    ~ rd_tin(10)
    ~ qh("truong_phong", 10)
    ~ qh("con_ong_chau_cha", 10)
    ~ rd_do_doc = gioi_han(rd_do_doc - 10)
    ~ phat_hien(bai_hat_long)
* [😶 Ghi biên bản, không nói gì.]
    _Biên bản ghi: "14:17. Không có gì để ghi." Một câu rất an toàn._
- _Cuối hội nghị, {hong_hot} chìa điện thoại: clip {idol_het_thoi} hát "Công Viên" trong bóng tối, do {editor} quay hôm mất điện, đang lan khắp mạng._
hong_hot: Mà cùng lúc có bài bóc fan ảo của ổng nữa. 80.000 nick, comment y chang nhau: "Anh {idol_het_thoi} đỉnh nóc kịch trần".
* {biet(fan_ao_phat)} [🐍 "Tui có bằng chứng ổng thuê fan ảo nè. Bà đăng hông?"]
    ~ rd_tung_tin(15, 10)
    ~ scandal()
    ~ qh("idol_het_thoi", -20)
    ~ qh("quan_ly_idol", -15)
    _Cái clip hát đang lên bị nhấn chìm bởi phốt fan ảo. {quan_ly_idol} gọi hai cuộc liền, giọng khàn đặc: "Ai tung? Ai?"_
* [🤝 "Đẩy cái clip hát đi bà. Clip đó thật. Fan ảo thì để ổng tự giải quyết."]
    ~ qh("idol_het_thoi", 10)
    ~ qh("hong_hot", 5)
    ~ rd_tin(5)
* [😶 Không nói gì.]
    _{hong_hot} nhìn bạn, nhún vai, tự đăng cả hai. Thế giới vẫn quay mà không cần bạn._
- -> END

// ------------------------------------------------------------
=== ran_doc_2510_sanh_ll ===
# ngay:25 # gio:10:00 # noi:sanh_ll_entertainment
_Chủ nhật. Bạn đi theo một linh cảm, băng qua đường. Tòa nhà kính 20 tầng của LL-Entertainment nằm ngay đối diện {cong_ty}, sảnh lát đá, máy lạnh mùi lá chuối xanh._
_Ở sảnh, {designer} và {thanh_ninh} đứng cách nhau 3 mét, cùng ôm bìa hồ sơ, cùng nhìn lên trần nhà. {designer} cầm một cái USB. {thanh_ninh} mặc áo xanh lá, sớm hơn cái hẹn chiều nay của mình cả mấy tiếng._
designer: Ủa… tui đi lạc.
thanh_ninh: Em cũng đi lạc. Đi lạc trùng hợp ghê chị.
_Rồi thang máy mở. {quan_ly_idol} bước ra, hai điện thoại, mặt như vừa nghe một con số rất lớn. Sau anh ta là thư ký của Lưu Lực._
{ rd_manh_moi_ran_hai >= 2:
    _Và cùng thang máy đó, {ten(ran_thu_hai)} bước ra, cười chào thư ký LL như người quen lâu năm. Trên tay cầm một tập hồ sơ. Bạn nhận ra trang đầu: tập "bằng chứng" có tên bạn._
    ~ rd_biet_ran_hai = true
    ~ phat_hien(ran_thu_hai_lo_mat)
    _Đây rồi. Con rắn thứ hai._
- else:
    _Và thang máy đóng lại. Bạn thấy thoáng một bóng người quen quen, nhưng chưa đủ manh mối để chắc chắn là ai._
}
* [📸 Chụp ảnh tất cả.]
    ~ rd_tin_mat()
    ~ rd_tin_mat()
    _Ba đồng nghiệp ở sảnh đối thủ, một buổi sáng chủ nhật. Sổ tay bạn dày thêm hai trang._
* [🤝 Đi tới chỗ {designer} và {thanh_ninh}: "Hai bà đi lạc thì đi về với tui."]
    designer: *(thở phào)* Ừ… về. Về đi.
    thanh_ninh: Anh {ran_doc} đừng kể ai nha. Chị… em… em xin anh đó.
    ~ qh("designer", 10)
    ~ qh("thanh_ninh", 15)
    ~ rd_tin(5)
* [😶 Đứng sau cột, nghe.]
    thu_ky_ll: *(với {quan_ly_idol})* Ba mươi sáu triệu một tháng, anh nhé. Điều kiện duy nhất: anh mang Siêu Nhân Hồng theo.
    ~ phat_hien(ll_moi_thai)
    ~ rd_tin_mat()
- -> END

// ------------------------------------------------------------
=== ran_doc_2610_cat_giam ===
# ngay:26 # gio:08:45 # noi:tang_1 # bat_buoc
_Thứ 2. Tin đồn chạy nhanh hơn wifi: "Nếu Siêu Nhân Hồng thất bại thì cắt giảm nhân sự". Ai cũng nhìn {hr} như nhìn đao phủ._
_{giam_doc} gọi {editor} vào phòng: "Anh mua kênh Cú Đêm Cắt Ghép của em, 200 triệu, em nghĩ đi."_
editor: *(ra khỏi phòng, ngáp)* Kênh đó… không bán.
_Trên bàn {hr} có một tập hồ sơ màu hồng. Góc giấy lòi ra: "Danh sách… tối thiểu 7 tên… trước 26/10"._
* [🐍 Chụp lén góc tập hồ sơ, gửi vào group Anti Sếp.]
    ~ rd_tung_tin(20, 15)
    ~ phat_hien(danh_sach_cat_giam)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 15
    _Group im lặng 30 giây. Rồi 14 người cùng gõ một lúc. {hr} lần đầu tiên không cười._
    ~ qh("hr", -20)
* [💬 Hỏi thẳng {hr}: "Anh {hr}, có tên em trong đó hông?"]
    hr: *(nhìn bạn rất lâu)* Em rảnh không, lên phòng anh uống trà xíu.
    hr: Anh nói thật với em một lần thôi nhé. Anh cũng không muốn làm cái danh sách này.
    ~ phat_hien(danh_sach_cat_giam)
    ~ qh("hr", 10)
    ~ rd_tin_mat()
* [🤝 Nói với {editor}: "Kênh của ông là của ông. Đừng bán."]
    editor: Tui biết. Mà cảm ơn ông. Ở đây ít ai nói vậy.
    ~ qh("editor", 10)
- -> END

// ------------------------------------------------------------
=== ran_doc_2610_usb_duy ===
# ngay:26 # gio:10:15 # noi:tang_1 # bat_buoc
_Tin đồn cắt giảm đã thành tin chính thức trong lòng mọi người. Trên bàn bạn có cái USB chứa poster Đại Nhạc Hội, bản {designer} gửi hôm qua để {hong_hot} đăng trưa nay._
* [🧨 Sửa poster: đổi giờ mở màn thành 21:30. Nhờ {thuc_tap_sinh} mang USB qua cho {hong_hot}.]
    _Bạn ghé bàn {thuc_tap_sinh}, nói rất nhỏ: "Nghe nói danh sách cắt giảm có tên thực tập sinh đầu tiên. Anh gửi giùm file này, tui nói tốt cho anh với anh {hr}."_
    { qh_thuc_tap_sinh >= 20:
        _{thuc_tap_sinh} cầm USB, nhìn nó, rồi nhìn bạn. "Dạ… anh {ran_doc} gửi thì hay hơn ạ. Em sợ em làm hỏng." Không biết vô tình hay cố ý, {thuc_tap_sinh} vừa né được một cái bẫy._
        ~ rd_nghi(3)
    - else:
        _{thuc_tap_sinh} gửi liền, không mở ra xem. Poster sai giờ lên fanpage 40 phút mới bị {chi_dai} phát hiện. Ai cũng nhìn {thuc_tap_sinh}._
        ~ rd_pha(10000)
        ~ qh("thuc_tap_sinh", -5)
        ~ rd_nghi(5)
    }
* [😇 Tự mang USB qua cho {hong_hot}.]
    hong_hot: Ông đi giao hàng hả? Cảm ơn nha. Poster đẹp ghê, lần này bà {designer} sửa có 4 lần.
    ~ rd_tin(2)
- -> END

// ------------------------------------------------------------
=== ran_doc_2610_chieu_thu_phim ===
# ngay:26 # gio:16:00 # noi:phong_hop_sang_tao
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên", 15 phút. Kịch bản: {bien_kich}._
_Trên màn hình: một người gác két ngân hàng bỏ việc, trời mưa, xe chết máy. Một người lạ mặc đồ hồng đẩy xe cho anh ta 2 km._
_{thuc_tap_sinh} ngồi hàng đầu, nắm chặt tay vịn ghế. Đây là chuyện của {thuc_tap_sinh}. Kể vào ngày 2/10. Bạn có mặt hôm đó._
_Ở hàng cuối, {sieu_nhan_hong} xem mà không thở. Như thể đang xem lại chính mình._
~ phat_hien(nguoi_gac_ket)
* [🔥 Nói to: "Ủa, cái này giống y chuyện {thuc_tap_sinh} kể trong buổi họp 2/10 mà?"]
    ~ rd_tung_tin(15, 5)
    bien_kich: Đây không phải đạo, đây là cảm hứng!
    thuc_tap_sinh: *(lí nhí)* Dạ… dạ thôi anh, không sao đâu ạ…
    ~ qh("bien_kich", -20)
    ~ qh("thuc_tap_sinh", 5)
    ~ scandal()
* [🤝 Sau buổi chiếu, kéo {thuc_tap_sinh} ra hành lang: "Đó là chuyện của ông. Ông biết mà."]
    thuc_tap_sinh: Em biết… Mà anh ơi, em chưa từng biết người đẩy xe cho em hôm đó là ai.
    _Bạn nhìn về phía hàng ghế cuối. Bộ đồ hồng. Bàn tay có sẹo vẫn nắm chặt._
    ~ qh("thuc_tap_sinh", 15)
    ~ rd_han(-8)
* [😶 Ra về trước.]
    _Phim hay. Bạn không muốn thừa nhận là phim hay._
- -> END

// ------------------------------------------------------------
=== ran_doc_2710_ll_ra_tay ===
# ngay:27 # gio:11:00 # noi:ca_phe_song_ao # bat_buoc
_Quán cà phê Sống Ảo. Bàn trong góc. Lưu Lực, vest trắng, đặt một tập hợp đồng lên bàn trước mặt {sieu_nhan_hong}._
luu_luc: G lấy của anh 5 tỷ. Qua LL, tụi tui lăng xê anh miễn phí, còn trả anh gấp ba. Bên đó chỉ có một con chó ghét anh thôi mà.
_Bạn ngồi bàn bên, đội nón, cầm ly cà phê muối. Rồi {sieu_nhan_hong} xin phép đi vệ sinh, đi ngang qua bàn bạn, và dừng lại._
{ rd_mo_nhanh_hieu_ech:
    sieu_nhan_hong: *(rất nhỏ)* {ran_doc}… em nghĩ anh nên làm gì?
- else:
    sieu_nhan_hong: Ủa, em làm ở công ty mình mà! Em… em nghĩ anh nên làm gì?
}
* [🐍 "Gấp ba mà anh. Ở lại làm gì cái công ty sắp sập."]
    ~ rd_day_nguyen_sang_ll = true
    ~ rd_do_doc = gioi_han(rd_do_doc + 15)
    ~ rd_han(5)
    sieu_nhan_hong: Sắp sập… hả em? *(nhìn về phía Lưu Lực rất lâu)*
    { rd_moi_han >= 70 && not rd_mo_nhanh_hieu_ech:
        _Hắn quay về bàn. Cầm cây bút. Lưu Lực mỉm cười, chỉ vào ô chữ ký. Bạn nghe tiếng ngòi bút sột soạt từ bàn bên._
        ~ nguyen_theo_ll = true
        ~ phat_hien(ll_moi_nguyen)
    }
    _Bạn vừa nói điều bạn muốn nói từ ngày 1/10. Sao lại thấy như mình vừa đẩy ai đó vào nhà kho?_
* [😇 "Ở lại đi anh. Cả công ty đang cố vì anh. Kể cả… em."]
    ~ rd_giu_nguyen_lai = true
    ~ rd_giup(20000)
    ~ rd_han(-15)
    sieu_nhan_hong: *(đứng im 2 giây, rồi quay về bàn, đẩy tập hợp đồng lại)* Chó ghét anh là chuyện của anh với chó. Anh hông bỏ ai hết.
    _Lưu Lực mỉm cười, cất hợp đồng. Lúc đi ngang qua bàn bạn, ông ta dừng lại nửa giây, nhìn bạn rất kỹ._
* {biet(trang_47)} [🔒 "Anh hỏi ổng có chịu trả luôn 10 tỷ cho công ty theo trang 47 hông."]
    _{sieu_nhan_hong} quay về bàn, nói đúng câu đó. Lưu Lực tái mặt, cất hợp đồng._
    luu_luc: Anh… biết cả trang 47?
    ~ rd_giu_nguyen_lai = true
    ~ rd_giup(10000)
    ~ rd_han(-10)
* [😶 "Chuyện của anh, anh tự quyết."]
    sieu_nhan_hong: Ờ… ờm… đúng ha. *(đi tiếp)*
    _Hắn ngồi lại bàn. Không ký. Nhưng cũng không trả lại tập hợp đồng._
- -> END

// ------------------------------------------------------------
=== ran_doc_2710_thu_ky_ll ===
# ngay:27 # gio:15:30 # noi:san_thuong
_Sân thượng. Điện thoại rung, số lạ. Giọng nữ rất lịch sự._
thu_ky_ll: Dạ anh {ran_doc} phải không ạ? Sếp em muốn gặp anh một chút. Sếp em biết anh không thích Siêu Nhân Hồng.
thu_ky_ll: Sếp em chỉ cần một thứ: lịch chi tiết Đại Nhạc Hội. Giờ lên sân khấu, lối vào cánh gà, vị trí cầu dao điện. Đổi lại, một chỗ làm ở LL.
* [🐍 "Gửi email cho tui."]
    ~ rd_bao_ll_lich_dien = true
    ~ rd_do_doc = gioi_han(rd_do_doc + 20)
    ~ rd_nghi(15)
    _Bạn gửi. File lịch Đại Nhạc Hội Siêu Nhân, bản do {chi_dai} soạn. 4 trang. Ngón tay bạn dừng ở nút "Gửi" lâu hơn bạn nghĩ._
    ~ rd_han(5)
* [😶 Cúp máy. Chặn số.]
    ~ rd_tin(5)
    _Một con rắn khác đã tìm tới bạn. Nghĩa là bạn đã để lộ mình nhiều hơn bạn tưởng._
* [💬 "Ai trong công ty tôi đang làm cho mấy người?"]
    thu_ky_ll: Dạ… em không hiểu anh nói gì ạ. *(im lặng 2 giây)* Chúc anh một ngày tốt lành.
    _2 giây im lặng. Đủ để bạn biết là có người._
    ~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
- -> END

// ------------------------------------------------------------
=== ran_doc_2710_ran_gap_ran ===
# ngay:27 # gio:19:00 # noi:pantry # bat_buoc
_Tối. Cả công ty vẫn bàn tán chuyện 15 giờ chiều nay: Lưu Lực tới tận sảnh, thấy {chi_dai} thì làm rơi cả tập hồ sơ, đi thẳng ra xe._
_Ở pantry chỉ còn bạn và {ten(ran_thu_hai)}._
{ not rd_biet_ran_hai && rd_manh_moi_ran_hai >= 4:
    _Mùi lá chuối xanh. Chữ ký 22:41. Thiết bị lạ trong log của {it}. Mấy mảnh ghép trong sổ tay của bạn tự khớp vào nhau, ngay lúc người đó đưa ly cà phê cho bạn._
    ~ rd_biet_ran_hai = true
    ~ phat_hien(ran_thu_hai_lo_mat)
}
{ rd_biet_ran_hai:
    _Bạn biết. Người đó cũng biết bạn biết. Hai con rắn trong một cái pantry._
    * [🐍 "Tập hồ sơ có tên tui, {ong_ba_cua(ran_thu_hai)} in mấy bản rồi?"]
        _{ten(ran_thu_hai)} cười rất nhẹ. Một nụ cười bạn từng soi trong gương._
        _"Đủ để gửi cho cả công ty ngày 30. Trừ khi… mình hợp tác."_
        ~ rd_tin_mat()
        -> ran_doc_2710_ran_gap_ran_chon
    * [📸 Bấm ghi âm trong túi rồi mới nói chuyện.]
        ~ rd_tin_mat()
        _Đèn ghi âm đỏ trong túi áo. Bạn hỏi vu vơ về LL. Người đó trả lời vu vơ, nhưng nhắc đúng tên thư ký của Lưu Lực._
        ~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
        -> ran_doc_2710_ran_gap_ran_chon
- else:
    _{ten(ran_thu_hai)} pha cà phê, mời bạn một ly, cười rất thân thiện. Bạn không thấy gì lạ. Đó chính là điều đáng sợ._
    _Bạn chưa biết ai là con rắn thứ hai. Ngày mai thì đã quá muộn._
    -> END
}

= ran_doc_2710_ran_gap_ran_chon
* [🤝 "Hợp tác? Được. Kể tui nghe kế hoạch."]
    _Người đó kể. Bạn nghe. Mỗi câu là một bằng chứng. Người đó không biết túi áo bạn đang ghi âm._
    ~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
* [💢 "Không. Tui phá theo kiểu của tui. Mấy người phá cho LL."]
    _"Vậy thì 30/10 gặp nhau ở phòng họp." Người đó rửa ly, đi ra. Mùi lá chuối còn lại trong pantry rất lâu._
- -> END
