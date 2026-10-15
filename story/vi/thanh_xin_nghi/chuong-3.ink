// ============================================================
// THÁNH XIN NGHỈ: SƠN · CHƯƠNG 3: "GẶT LÚA Ở ĐÀI TRUYỀN HÌNH" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_xin_nghi_1310_doanh_nhan ===
# ngay:13 # gio:09:30 # noi:phong_giam_doc # bat_buoc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho mình. {thanh_ninh} đọc bài khen 15 phút. {sales} trao tấm bằng "Doanh nhân của năm" của BTT Global, con dấu hơi lem._
giam_doc: {thanh_xin_nghi}! Lịch tuần này của Siêu Nhân Hồng đâu? Thứ 6 đi gameshow, anh muốn cả đoàn đi đúng giờ.
_Bạn đưa lịch. Ô thứ 4 (14/10) ghi: "Quay quảng cáo Trâu Cụng: dời". Ô của bạn ngày đó thì trống trơn._
giam_doc: Ô của em thứ 4 sao trống?
* [😇 "Dạ em ở văn phòng trực lịch ạ."]
    giam_doc: Tốt.
    _Câu nói dối đầu tiên của tuần. Còn 3 ngày nữa._
    ~ son_soi(3)
* [🤧 "Dạ… em chưa chắc, bà ngoại em dạo này yếu…"]
    giam_doc: Bà em lại yếu à? Năm nay bà yếu mấy lần rồi?
    hr: *(đứng ở cửa, không cần nhìn sổ)* Bảy lần, anh.
    ~ son_soi(10)
    ~ son_tin(-5)
- ~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1310_khoe_re ===
# ngay:13 # gio:17:45 # noi:phong_kham_khoe_re
_Tan làm. Mai là ngày lớn. Bạn cần một tờ giấy nghỉ ốm cho đủ bộ: lý do đẹp, giọng yếu, giấy có dấu đỏ._
{ co(giay_nghi_om):
    _Trong túi bạn đã có một tờ. Nhưng có thêm một tờ dự phòng thì không bao giờ thừa._
}
* [🏥 Vào Khỏe Re.]
    -> thanh_xin_nghi_mg_khoe_re_mo
* [😶 Không mua. Gặt lúa thì cần gì giấy bệnh.]
    _Bạn chạy xe về Ven Đô. Ruộng rau muống xanh ngắt dưới trăng. Lý do ngày mai đẹp như tranh._
    -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1410_cuoc_goi_7h ===
# ngay:14 # gio:07:00 # noi:nha_ven_do # bat_buoc
_7 giờ sáng. Ngày Hội Nông dân Việt Nam. Bạn đang ở bãi gửi xe Đài Tivi Hóng, đã trang điểm được một nửa. Phía sau, ban nhạc đang chạy thử._
_Bạn bấm gọi phòng HR. Một hồi chuông. Anh {hr} bắt máy ngay, như đã ngồi chờ._
hr: *(giọng ngọt)* Alo, anh nghe nè {thanh_xin_nghi}. Để anh đoán… bà ngoại hả em?
* [🤧 "Dạ hông anh… khụ khụ… hôm nay Ngày Hội Nông dân, em xin về quê phụ gặt lúa ạ."]
    ~ son_tin(10)
    ~ son_soi(5)
    hr: Gặt lúa tháng 10 hả em? Ờ… Ven Đô chắc mùa khác. Mà nhạc gì nghe hay vậy em?
    thanh_xin_nghi: Dạ… máy cày nhà hàng xóm có gắn loa ạ!
    hr: Máy cày có loa… Ừ. Anh ghi nhận.
    ~ son_xin_nghi()
    ~ son_gat_lua_tron = true
    ~ son_goi_hoan_hao = son_goi_hoan_hao + 1
* [👵 "Dạ… bà ngoại em lại trở bệnh, em phải chở bà đi khám."]
    ~ son_ba_ngoai()
    ~ son_tin(-10)
    ~ son_soi(15)
    hr: Bà em ốm nhiều hơn số lần anh đi khám răng đó {thanh_xin_nghi}.
    ~ son_xin_nghi()
* [🎲 Bật âm thanh tiếng máy cày, hét: "ANH ƠI ỒN QUÁ EM GỌI LẠI SAU NHA!"]
    { RANDOM(1, 2) == 1:
        _Tút tút. Cúp máy trót lọt. Không ai gọi lại._
        ~ son_xin_nghi()
        ~ son_goi_hoan_hao = son_goi_hoan_hao + 1
    - else:
        _Tiếng máy cày tắt, rồi một giọng đọc vang lên rõ mồn một: "Tải ngay app…"_
        hr: …Máy cày nhà em biết quảng cáo app luôn hả {thanh_xin_nghi}?
        ~ son_tin(-25)
        ~ son_soi(10)
        ~ son_xin_nghi()
        ~ son_goi_hoan_hao = 0
    }
* [😇 "Dạ… thôi em vô làm ạ."]
    ~ son_soi(-10)
    ~ son_mo(-20)
    hr: *(im lặng 2 giây)* Ừ. Vô đi em. Hôm nay anh mời em ly trà.
    _Bạn tẩy trang trong bãi gửi xe. Kim tuyến rơi xuống yên xe. Phía sau, ban nhạc chạy thử bài bạn định hát._
    ~ son_di_lam()
    -> END
- { co(giay_nghi_om):
    ~ mat(giay_nghi_om)
    _Bạn gửi ảnh giấy phòng khám qua Zalo-lô. Nghỉ có phép. Lương giữ nguyên._
- else:
    ~ tien_cong(-590000)
}
-> thanh_xin_nghi_1410_ghi_hinh_vong_2

// ------------------------------------------------------------
=== thanh_xin_nghi_1410_ghi_hinh_vong_2 ===
# ngay:14 # gio:09:00 # noi:dai_tivi_hong # dieu_kien:xin_nghi_14
_Đài Tivi Hóng, trường quay số 3. Đèn sân khấu. Bạn trong bộ đồ kim tuyến{son_muon_vest_phat: (của anh {idol_het_thoi}, mùi băng phiến 2015)|}, tóc giả, trang điểm đậm. Trong gương là {thanh_xin_nghi} Kim Tuyến._
~ son_vong_2 = true
phu_tro_ly_dai: {thanh_xin_nghi} Kim Tuyến chuẩn bị nha! 3 phút nữa lên! Hôm nay thứ 4, cưng xin nghỉ công ty được hả?
thanh_xin_nghi: Dạ… em về quê gặt lúa ạ.
phu_tro_ly_dai: *(cười)* Lúa ở đây hả cưng?
_Đèn bật. Nhạc dạo. Bạn bước ra._
* [🎤 Hát bài ballad đã tập cả tháng.]
    ~ son_mo(12)
    _Giám khảo thứ ba đặt bút xuống. Khán giả trường quay im phăng phắc. Hết bài, một tràng vỗ tay dài._
* [🎤 Hát bài vui, nhảy nhẹ, để kim tuyến bay.]
    ~ son_mo(8)
    _Kim tuyến bay tứ tung dưới đèn. Khán giả vỗ tay theo nhịp. Một giám khảo nói "có sân khấu tính"._
* {son_muon_vest_phat} [🔒 Hát "Công Viên" bản ballad chậm, trong bộ vest của chính người từng hát nó.]
    ~ son_mo(15)
    _Bạn hát "Công Viên" chậm, buồn, như một lời xin lỗi gửi tới một thời hoàng kim. Giám khảo lớn tuổi nhất rơm rớm nước mắt._
- phu_tro_ly_dai: Qua vòng! Cưng qua vòng rồi! Bán kết tối chủ nhật 25/10 nha! Thứ 6 tuần này qua thử đồ chụp hình quảng bá!
_Thứ 6 tuần này. Ngày bạn quay lại đài này, trong áo sơ mi, theo sau Siêu Nhân Hồng._
~ cang_thang(10)
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1410_moc_2 ===
# ngay:14 # gio:16:30 # noi:dai_tivi_hong # dieu_kien:son_vong_2
{ not son_vong_2:
    -> END
}
_Phòng thay đồ đài. Bạn đang tẩy trang thì điện thoại rung. Anh {quan_ly_idol}._
quan_ly_idol: {thanh_xin_nghi}! Mốc 2 hôm nay đó em. {nguoi_theo_doi >= 200000:Qua rồi! 200 ngàn! Nguyên vui quá tạo dáng 40 phút, anh phải kéo xuống.|Không qua. Nguyên buồn, bỏ đi giúp người cả chiều. Anh không biết xe đón ổng ở đâu. Em có lịch không?}
{ nguoi_theo_doi < 200000:
    -> thanh_xin_nghi_1410_moc_2.s_tim_xe
}
* [😇 "Dạ, tốt quá anh. Mai em vô sớm."]
    quan_ly_idol: Ừ. Mà… lúa gặt xong chưa em?
    thanh_xin_nghi: Dạ… xong… một nửa ạ.
    ~ qh("quan_ly_idol", 2)
* [😶 Nhắn lại cái emoji vỗ tay, không gọi lại.]
    ~ son_soi(3)
- -> END

= s_tim_xe
* [📅 Mở cuốn lịch, chỉ đường cho xe qua điện thoại, mặt còn nửa lớp trang điểm.]
    ~ uy_tin = uy_tin + 3
    ~ follow(3000)
    _Bạn chỉ đúng 3 điểm Nguyên hay ghé: công viên Hồ Cá Mập, đầu hẻm 69, bến xe Ven Đô. Ở điểm thứ hai, xe tìm thấy Nguyên đang gỡ diều._
    quan_ly_idol: Em giỏi quá. Em đang ở đâu mà nghe có tiếng vỗ tay?
    thanh_xin_nghi: Dạ… ruộng… vỗ tay đuổi chim ạ.
* [😶 "Dạ em đang ở ruộng, sóng yếu lắm anh…" (cúp máy)]
    ~ son_soi(8)
    ~ follow(-5000)
    _Chiều đó không ai tìm thấy Nguyên. Ở bàn điều phối, ghế bạn trống._
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1510_mat_dien ===
# ngay:15 # gio:08:05 # noi:ban_dieu_phoi # bat_buoc
_8 giờ 05. Cả tòa nhà tắt phụt. Từ thang máy vọng ra giọng {giam_doc} và {chi_dai}. Bạn đứng giữa văn phòng tối om._
_Điện thoại bạn: 3% pin. Tối qua về nhà tẩy trang tới 1 giờ sáng, quên sạc._
_Hôm nay Siêu Nhân Hồng quay Trâu Cụng lúc 14:00 (bạn đã dời từ thứ 4). Xe đón: chưa ai báo giờ._
{ son_vong_2:
    _Trên mu bàn tay bạn còn một hạt kim tuyến. Trong bóng tối, nó vẫn lấp lánh._
}
* [🔋 Xin {thuc_tap_sinh} một cục sạc dự phòng.]
    thuc_tap_sinh: Dạ anh lấy cục to nhất ạ! Em có 5 cục! *(mắt lấp lánh như người từng sở hữu cả két sạc)*
    ~ qh("thuc_tap_sinh", 5)
    _Điện thoại sống lại. Bạn nhắn xe đón: "14:00, cổng sau, đừng đi cổng trước, {cho} đang ở đó."_
    ~ uy_tin = uy_tin + 3
* [📝 Viết giờ đón xe ra giấy, nhờ {bac_bao_ve} đưa cho tài xế.]
    bac_bao_ve: Ừ. Để bác. Mà tay cháu dính gì lấp lánh thế?
    thanh_xin_nghi: Dạ… bụi… công trình ạ.
    bac_bao_ve: Thế à. Bác không thấy gì đâu.
    ~ qh("bac_bao_ve", 5)
* [😶 Ngồi chờ có điện.]
    _Không có điện. Cả ngày. Chiều đó xe đón chờ ở cổng trước, {cho} sủa, Nguyên chọc {cho}, {cho} đuổi Nguyên 3 vòng bãi xe._
    ~ follow(-5000)
    ~ son_soi(5)
- ~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1510_pantry_thai ===
# ngay:15 # gio:11:00 # noi:pantry # bat_buoc
_Pantry tối om, rèm kéo kín. Cả công ty ngồi bệt dưới sàn. Bạn ngồi cạnh {quan_ly_idol}. Lần đầu tiên trong tháng, cả hai cái điện thoại của anh {quan_ly_idol} đều hết pin._
quan_ly_idol: {thanh_xin_nghi}… anh nói em nghe chuyện này, em đừng kể ai. Có một công ty… mời anh về. Lương gấp đôi. Kèm điều kiện.
thanh_xin_nghi: Điều kiện gì anh?
quan_ly_idol: Mang Nguyên theo.
_Bạn im lặng. Anh {quan_ly_idol}, bạn thân nhất của bạn ở công ty, cũng giấu chuyện. Giống bạn._
* [💬 "Còn anh {idol_het_thoi} thì sao anh?"]
    _Trong bóng tối, bạn nghe anh {quan_ly_idol} thở ra một hơi rất dài._
    quan_ly_idol: …Anh chưa nghĩ tới đó. Hay anh không dám nghĩ.
    ~ qh("quan_ly_idol", 5)
* [🤝 "Anh đi đâu em cũng ủng hộ anh. Mà anh đi thì ai che cho em?"]
    quan_ly_idol: *(cười)* Che gì? Em có bí mật gì mà cần che?
    thanh_xin_nghi: Dạ… bà ngoại.
    ~ qh("quan_ly_idol", 3)
* {son_giac_mo >= 40} [🎤 Suýt kể. "Anh {quan_ly_idol}… em cũng có chuyện…"]
    _Đúng lúc đó, {hong_hot} bò ngang qua, giẫm lên chân hai người. "Xin lỗi xin lỗi! Ai có sạc hông?"_
    _Khoảnh khắc trôi qua. Anh {quan_ly_idol} quay sang hỏi {hong_hot} xin sạc._
    ~ qh("quan_ly_idol", 2)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1510_pantry_toi ===
# ngay:15 # gio:19:00 # noi:pantry
_7 giờ tối. Vẫn mất điện. Hầu hết đã về. Trong pantry, {idol_het_thoi} ngồi trên bệ cửa sổ, hát "Công Viên" thật chậm, không nhạc đệm._
idol_het_thoi: Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên…
_Trong góc, đèn đỏ nhỏ xíu của máy quay. {editor} đang quay, im như tượng._
_Bài hát cần một bè. Cổ họng bạn ngứa ngáy. Đây không phải ho giả._
* [🎵 Hát bè thật khẽ, từ chỗ tối.]
    ~ son_mo(5)
    ~ phat_hien(son_thi_hat)
    _Hai giọng hòa vào nhau. {idol_het_thoi} khựng lại nửa nhịp, rồi hát tiếp, mắt nhìn vào bóng tối tìm xem ai._
    idol_het_thoi: …Ai đó?
    _Bạn im. {editor} vẫn quay. Clip đó, sau này, có hai giọng._
    ~ qh("idol_het_thoi", 5)
* [😶 Đứng im nghe tới hết.]
    _Hết bài. {idol_het_thoi} lau mắt bằng vạt áo. Bạn rút lui ra hành lang trước khi ai thấy._
    ~ cang_thang(-5)
* [🤧 Ho một tiếng, để mọi người biết có người.]
    _{idol_het_thoi} ngừng hát, đeo lại kính đen dù trời tối thui._
    idol_het_thoi: Em biết anh là ai không? *(rồi thôi, đi về)*
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1610_hanh_lang ===
# ngay:16 # gio:13:30 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. Bạn đang dắt {sieu_nhan_hong} tới phòng chờ gameshow "Hồng Hay Không Hồng". Cô trợ lý sản xuất cuộc thi đi ngược chiều, mắt sáng lên._
phu_tro_ly_dai: Ủa {thanh_xin_nghi} Kim Tuyến! Hôm thứ 4 quay vòng 2 cưng hát đỉnh quá trời! Mai nhớ qua thử đồ nha!
sieu_nhan_hong: *(quay sang)* Kim Tuyến? {thanh_xin_nghi} là… ca sĩ hả? # hen_gio:5
* [😶 "Dạ chị nhận lộn người rồi, em là {thanh_xin_nghi} Điều Phối."]
    { RANDOM(1, 2) == 1:
        phu_tro_ly_dai: Ủa… vậy hả? Giống ghê. Thôi chị xin lỗi nha!
    - else:
        phu_tro_ly_dai: Lộn gì mà lộn! Nè, coi nè! *(mở điện thoại, chiếu clip vòng 2 cho {sieu_nhan_hong} xem)*
        ~ son_tin(-10)
        ~ son_nguyen_biet = true
    }
* [🤫 Kéo {sieu_nhan_hong} vô phòng chờ: "Anh Nguyên, em năn nỉ, anh giữ bí mật giùm em."]
    ~ son_nguyen_biet = true
    ~ qh("sieu_nhan_hong", 15)
    sieu_nhan_hong: Bí mật hả? Anh giỏi giữ bí mật lắm. Thiệt đó. *(gõ gõ lên cái mũ)*
* [🎤 "Dạ, em là {thanh_xin_nghi} Kim Tuyến. Mà đừng nói ai trong công ty nha."]
    ~ son_nguyen_biet = true
    ~ son_mo(5)
    sieu_nhan_hong: *(tạo dáng)* Ca sĩ với siêu nhân! Team mình mạnh quá trời!
    ~ qh("sieu_nhan_hong", 10)
* [⏱️ (Không chọn kịp)]
    sieu_nhan_hong: À! Kim Tuyến là mật danh! Ngầu ghê! Đặc vụ Kim Tuyến!
    ~ son_nguyen_mat_danh = true
    _Không ai bị lộ. Nhưng cả tuần đó, {sieu_nhan_hong} gọi bạn là "Đặc vụ Kim Tuyến" trước mặt cả công ty._
    ~ son_soi(5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1610_gameshow ===
# ngay:16 # gio:15:00 # noi:dai_tivi_hong # bat_buoc
_Gameshow "Hồng Hay Không Hồng". Bạn đứng ở cánh gà, cầm bộ đàm, tai nghe nối với tai nghe của {sieu_nhan_hong}._
_Phần "Hit Một Thời": {sieu_nhan_hong} phải hát "Công Viên". Nhạc dạo vang lên._
sieu_nhan_hong: Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên… thích ăn… khoai chiên…
_Cả trường quay cười ngặt nghẽo. MC Đài Tivi Hóng cười to nhất._
_Cạnh bạn ở cánh gà là {idol_het_thoi}, đi theo "để hỗ trợ tinh thần". Ảnh nắm chặt cái micro dự phòng._
* [🎙️ Nhắc lời qua tai nghe: "Chuối chiên anh ơi! CHUỐI CHIÊN!"]
    _{sieu_nhan_hong} nghe nhầm thành "khuấy chiên". Cả trường quay cười tới rớt ghế._
    ~ follow(10000)
* [🤝 Đưa micro cho {idol_het_thoi}: "Anh hát bè đi anh {idol_het_thoi}. Từ đây."]
    _{idol_het_thoi} nhìn bạn một giây. Rồi hát. Đúng lời, đúng tông, giọng 2015 vẫn còn đó._
    _Cả trường quay quay về phía cánh gà. MC hét lên: "Ủa, giọng gốc kìa quý vị!"_
    ~ qh("idol_het_thoi", 15)
    ~ follow(20000)
* {son_nguyen_biet} [🔒 Bật micro bộ đàm, tự hát bè thật khẽ.]
    ~ son_mo(5)
    ~ son_soi(5)
    _Ba giọng hát: {sieu_nhan_hong} hát sai, {idol_het_thoi} hát đúng, và một giọng thứ ba không ai thấy mặt. Kỹ thuật viên đài nhìn nhau: "Ai vậy?"_
    ~ follow(15000)
- ~ follow(80000)
_{sieu_nhan_hong} thắng giải 10 triệu. Cả trường quay đứng dậy vỗ tay cho một bài hát hát sai lời._
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1610_buffet ===
# ngay:16 # gio:19:00 # noi:pantry
_Ngày Lương thực Thế giới. Liên hoan buffet ở công ty. Bạn tới trễ nhất, chỗ trống cuối cùng là… cạnh anh {hr}._
hr: Ngồi đi {thanh_xin_nghi}. Ăn đi em.
_Bạn ngồi xuống. Gắp một cuốn gỏi. Anh {hr} rót cho bạn ly trà._
hr: {thanh_xin_nghi}, em có xem "Giọng Ca Ước Mơ" hông? Anh mê một thí sinh. Tên {thanh_xin_nghi} Kim Tuyến.
_Cuốn gỏi kẹt ngang cổ. Bạn ho. Ho thật. Lần đầu tiên trong năm._
* [😶 "Khụ khụ! Dạ… dạ em có nghe tên ạ."]
    hr: Giọng hay lắm em. Anh nhắn bình chọn hoài. Tối nào có chương trình anh cũng ngồi canh.
    _Bạn nhìn anh {hr}. Người đang lập hồ sơ dày 3 cm về bạn. Người đang bình chọn cho bạn mỗi tối._
    ~ qh("hr", 10)
    _Bạn ăn hết bữa mà không nói thêm câu nào. Nhưng cứ cười một mình._
* [💬 "Ảnh… hát hay hả anh? Anh thích ảnh ở điểm nào?"]
    hr: Ảnh hát như người đang xin lỗi ai đó. Mà xin lỗi rất thật lòng.
    _Bạn cúi xuống ly trà. Mắt cay. Chắc tại trà gừng._
    ~ qh("hr", 12)
    ~ son_mo(3)
* [🤧 "Dạ… em hông xem tivi, em bận chăm bà ngoại."]
    hr: Ừ ha. Bà ngoại em. *(gật gù, rót thêm trà)*
    ~ son_soi(3)
- ~ an(40)
~ son_di_lam()
{ son_hieu_biet_lich:
    _Cuối buổi, {hong_hot} hét lên: paparazzi đăng ảnh {sieu_nhan_hong} ở cổng đài lúc 13:20, đúng giờ trong lịch. Anh {quan_ly_idol} nhìn bạn: "Lịch này chỉ có em với anh giữ."_
    ~ follow(-30000)
    ~ qh("quan_ly_idol", -10)
    ~ son_soi(10)
}
-> END
