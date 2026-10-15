// ============================================================
// QUẢN LÝ IDOL · CHƯƠNG 6: "TẮT MÁY" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_2810_ghep_song_ca ===
# ngay:28 # gio:10:30 # noi:phong_cho # bat_buoc
~ thai_ly_ca_phe = 0
{ nguoi_theo_doi < 800000:
    _Mốc 4: 800.000 người theo dõi. Không đạt. Hành lang thoang thoảng mùi nước hoa xanh lá chuối._
    ~ thai_kh(1)
- else:
    _Mốc 4: 800.000 người theo dõi. Đạt. Cả tầng 1 ăn mừng bằng mì ly, vì quỹ trà sữa đã cạn._
}
{ nguyen_theo_ll:
    _Phòng chờ trống. Biển "Phòng chờ Siêu Nhân Hồng" vẫn còn. Đĩa bánh chuối chiên nguội ngắt. Không còn ai để ghép song ca._
    -> END
}
_Còn ba ngày tới Đêm Hồng. Bạn có một ý tưởng từ hôm gameshow: {idol_het_thoi} và Nguyên song ca "Công Viên Hồng". Một bản remix. Muốn làm được, phải làm hòa cả hai._
_Bạn gọi cả hai vào phòng chờ. {idol_het_thoi} đứng ở cửa. Nguyên ngồi trên ghế, mũ cầm tay._
* {qh_idol_het_thoi >= 40 and qh_sieu_nhan_hong >= 40} [🤝 "Hai đứa hát chung. Mỗi người một nửa bài. Nguyên nhớ: CHUỐI chiên."]
    sieu_nhan_hong: *(bật dậy)* Dạ em nhớ! Em viết lên tay luôn!
    idol_het_thoi: *(nhìn Nguyên viết chữ "CHUỐI" lên mu bàn tay, rồi nhìn bạn)* …Ừ. Hát chung.
    ~ thai_song_ca_ghep = true
    ~ qh("idol_het_thoi", 5)
    ~ qh("sieu_nhan_hong", 5)
* [📞 "Nguyên hát chính. {idol_het_thoi} đứng bè."]
    idol_het_thoi: *(cười nhạt)* Đứng bè bài của em hả anh?
    _Phát đi ra. Cửa phòng chờ đóng hơi mạnh._
    ~ qh("idol_het_thoi", -15)
* [🎤 "Phát hát chính. Nguyên đứng bè."]
    sieu_nhan_hong: Dạ được! Em đứng bè!
    _Phát gật đầu. Nhưng {giam_doc} đi ngang, nghe được: "Thái, Đêm Hồng là show của Nguyên mà."_
    ~ thai_song_ca_ghep = true
    ~ qh("idol_het_thoi", 10)
    ~ qh("giam_doc", -5)
- { thai_song_ca_ghep:
    _Giờ cần một người làm remix. Bạn nhắn ba người: {con_ong_chau_cha}, {editor}, {it}. Ba phút sau, {editor} trả lời đầu tiên: "Dạ em làm. Render xong là xong."_
    ~ qh("editor", 5)
}
-> END

// ------------------------------------------------------------
=== quan_ly_idol_2810_bo_loc ===
# ngay:28 # gio:15:30 # noi:ban_so_lieu
_Bàn số liệu. {dan_dau_tu} gọi bạn qua. Hai màn hình: bảng lượt theo dõi, và chart coin vẫn đỏ._
dan_dau_tu: {quan_ly_idol}. Tui lọc tài khoản ảo trước khi nền tảng kiểm tra. Có một cụm 80.000 cái, avatar hoa sen. Dẫn về {idol_het_thoi}.
{ thai_phat_huy_fan_ao:
    dan_dau_tu: Mà gói đã hủy rồi. Cụm này chết dần. Tui xóa luôn cho sạch, không ai biết.
    _Bạn thở ra. Lần đầu tiên trong tuần không có phốt mới._
    ~ qh("dan_dau_tu", 5)
    ~ thai_kh(-1)
    -> END
}
* [🙏 "Ông giấu giùm. Tui nợ ông một lần."]
    dan_dau_tu: Nợ thì nợ. Mà nền tảng phát hiện thì cả chiến dịch bị phạt.
    ~ follow(-20000)
    ~ qh("dan_dau_tu", 3)
* [📞 Gọi {idol_het_thoi}: "Hủy gói. Ngay bây giờ. Anh đứng đây chờ."]
    _Ba phút. {idol_het_thoi} gọi lại: "Hủy rồi anh." Giọng {idol_het_thoi} nhẹ hẳn, như vừa đặt xuống một cái vali._
    ~ thai_phat_huy_fan_ao = true
    ~ thai_phat_fan_ao = 0
    ~ qh("idol_het_thoi", 5)
    ~ follow(5000)
* [🛡️ Tự đăng nhập tài khoản {idol_het_thoi}, hủy gói. Không nói ai.]
    ~ thai_phat_huy_fan_ao = true
    ~ thai_phat_fan_ao = 0
    ~ thai_gk(-5)
    _Mật khẩu vẫn là ngày phát hành "Công Viên". {idol_het_thoi} chưa bao giờ đổi._
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2810_xuat_nham ===
# ngay:28 # gio:18:30 # noi:phong_dung
_Chiều. {hong_hot} chạy tới: "Anh {quan_ly_idol}, nghe gì chưa? Fanpage công ty đang tự tải lên một video lạ! Tên file là… 'Thai_final_v12'!"_
_Bạn chạy xuống phòng dựng. {editor} ngồi trước màn hình, mặt trắng bệch. Thanh tải lên: 73%. Rồi 74%._
editor: *(không quay lại)* Dạ… em lỡ bấm nhầm. Anh… anh đừng coi.
* [😇 "Ừ. Anh không coi. Em tự xử lý nha. Anh ra ngoài."]
    editor: *(nói rất nhỏ)* Dạ… cảm ơn anh.
    _Bạn ra ngoài. Đứng ở hành lang. Bạn không coi. Nhưng bạn đã kịp thấy ảnh thu nhỏ của video: một người cầm hai điện thoại, ngủ gục trong xe._
    ~ qh("editor", 10)
* [💬 "Video gì mà tên anh vậy {editor}?"]
    editor: Dạ… video… cho một người. *(dừng)* Em… em xin anh đừng hỏi hôm nay.
    _Bạn không hỏi. Bạn để một ly cà phê sữa lên bàn {editor}, rồi đi._
    ~ qh("editor", 8)
* [📞 "Anh gọi {it} hủy tải lên giùm em."]
    it: *(qua điện thoại)* Hủy được. Mai. Hôm nay đang… *(tiếng gõ phím)* Mai.
    ~ qh("editor", 3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2910_wifi_sap ===
# ngay:29 # gio:09:00 # noi:tang_1 # bat_buoc
~ thai_ly_ca_phe = 0
_Ngày Internet Quốc tế. Wifi sập cả ngày. Cả công ty đuổi theo {it}. Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. {chi_dai} điều phối bằng bộ đàm. {hong_hot} phát 4G, mật khẩu "nghegichua"._
_Không mạng. Không bài báo mới. Không ai đăng gì. Lần đầu tiên trong một tháng, Khủng Hoảng không tăng._
~ thai_kh(-1)
_Ở phòng dựng, video của {editor} kẹt ở 99%. {editor} ngồi nhìn thanh tải lên như cầu nguyện._
* [✉️ Viết giấy gửi qua chòi bảo vệ cho {idol_het_thoi}: "Ăn trưa chưa?"]
    _Mười phút sau, tờ giấy quay về, chữ {idol_het_thoi}: "Chưa. Anh mua gì em ăn nấy." Kèm hình vẽ một xiên cá viên chiên, vẽ xấu._
    bac_bao_ve: *(đưa giấy)* Bác chuyển thư cả đời rồi. Thư này dễ thương nhất hôm nay đấy.
    ~ qh("idol_het_thoi", 5)
    ~ qh("bac_bao_ve", 3)
* [📵 Tắt cả hai điện thoại. Ngồi im ở bàn. Không làm gì.]
    _Ba mươi phút. Không ai chết. Công ty không sập. Thế giới vẫn quay. Bạn ngạc nhiên._
    ~ thai_p(30)
    ~ cang_thang(-15)
* [🔋 Quản lý sạc: xoay vòng năm cục sạc cho ba điện thoại, để chiều có mạng là sẵn sàng.]
    ~ thai_p(15)
    ~ thai_co_sac_du_phong = true
    ~ uy_tin = uy_tin + 2
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2910_chua ===
# ngay:29 # gio:16:00 # noi:chua_pho_cu # bat_buoc
_Chùa Phố Cũ. Cây bồ đề lớn, mùi nhang trầm, tiếng chuông xa. Bạn chưa từng tới đây vào ngày thường._
_Không có mạng. Không có ai gọi. Bạn cầm một nén nhang. Bạn có một điều muốn cầu, nhưng không dám nói thành lời, kể cả trong đầu._
~ thai_nhang = thai_nhang + 1
* [🙏 Cầu cho Đêm Hồng suôn sẻ. Cho công ty. Cho Nguyên.]
    _Một điều nói ra được. Bạn nói ra. Nhẹ hơn một chút._
    ~ thai_tt(5)
    ~ cang_thang(-10)
* [🙏 Cầu cho {idol_het_thoi} được hát tới già.]
    _Bạn nói thầm, môi không động. Một cô gái đang cầu duyên ở bên cạnh liếc sang bạn, rồi mỉm cười như hiểu._
    ~ thai_gk(-5)
    ~ cang_thang(-15)
* [🙏 Không cầu gì. Chỉ đứng đó cho tới khi nhang tàn.]
    _Nhang tàn sau 20 phút. Hai mươi phút dài nhất và yên nhất trong năm._
    ~ cang_thang(-20)
    ~ thai_p(20)
- _Lúc ra cổng chùa, bạn thấy {bien_kich} đang ngồi ghế đá viết sổ, và {dan_dau_tu} đang khấn rất to "cầu coin lên". Ba người gật đầu chào nhau, không ai hỏi ai._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_2910_linh_hoi ===
# ngay:29 # gio:21:00 # noi:phong_dung
_Tối. Vẫn chưa có mạng. Phòng dựng tối om, chỉ có ánh màn hình. Thanh tải lên vẫn ở 99%. {editor} ngồi đó, ôm gối._
editor: Anh {quan_ly_idol}… em hỏi anh một câu nha. Nếu có người dựng video cho anh… anh có muốn coi hông?
_Câu hỏi treo lơ lửng giữa phòng tối, như thanh tải lên 99%._
* [😊 "Có chứ. Ai dựng cho anh thì anh coi. Mà ai rảnh dựng cho anh?"]
    editor: *(cười rất nhỏ)* Dạ… ai đó thôi.
    _{editor} không nói thêm. Bạn không hỏi thêm. Đêm đó, cái video vẫn 99%._
    ~ qh("editor", 5)
* {thai_nguoi_dung_dem} [💬 "Lĩnh. Anh biết em lo cho anh. Anh cảm ơn em. Mà anh…"]
    editor: *(ngắt lời, rất nhẹ)* Dạ em biết. Anh nhìn anh {idol_het_thoi} lâu hơn người khác một giây. Em dựng phim mà anh. Em thấy hết.
    _Bạn không nói gì được. Mười hai năm giấu, hóa ra có người thấy từ lâu, và vẫn ở đây._
    editor: Em không cần anh trả lời. Em chỉ muốn anh biết là… có người thức cùng.
    ~ qh("editor", 15)
    ~ thai_gk(-10)
* [📱 "Mai có mạng, em dựng giùm anh cái teaser Đêm Hồng nha."]
    editor: *(im lâu)* … Dạ. Em dựng.
    ~ qh("editor", -3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_3010_sac_pin ===
# ngay:30 # gio:07:30 # noi:studio_0905
~ thai_ly_ca_phe = 0
_Sáng thứ 6. Mạng đã có lại. 312 tin nhắn chưa đọc. Năm cục sạc, ba điện thoại, một ổ cắm. Bạn xoay vòng như tung hứng._
_Máy thứ ba rung. {thanh_xin_nghi}._
thanh_xin_nghi: Anh {quan_ly_idol}… mai chung kết. 20 giờ. Đêm Hồng cũng 20 giờ. Em… em xin nghỉ được hông anh? Lần này em không nói bà ngoại.
* {not thai_to_son} [🗓️ "Đi đi. Lịch Đêm Hồng anh tự cầm. Hát cho đã nha {thanh_xin_nghi}."]
    thanh_xin_nghi: *(im lâu, giọng nghẹn)* Anh {quan_ly_idol}… em… em hát xong em gọi anh liền.
    ~ thai_doi_lich_son = thai_doi_lich_son + 1
    ~ qh("thanh_xin_nghi", 15)
    ~ thai_p(-10)
* [😤 "Đêm Hồng mà em đi thi? Em biết công ty đang sống chết không?"]
    thanh_xin_nghi: Dạ… em biết. Em… ở lại.
    _{thanh_xin_nghi} cúp máy. Tiếng ho giả quen thuộc cũng không có._
    ~ qh("thanh_xin_nghi", -20)
* [🤝 "Em đi. Anh nhờ {it} nối sóng màn hình lớn ở Đêm Hồng, cả công ty coi em hát."]
    thanh_xin_nghi: Anh… làm được hả?
    quan_ly_idol: Anh không biết. Anh hỏi thử.
    ~ thai_doi_lich_son = thai_doi_lich_son + 1
    ~ qh("thanh_xin_nghi", 12)
    ~ qh("it", 3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Cả công ty ngồi kín phòng họp. Đề bạt, tăng lương, cắt giảm. Mục cuối: "Gia hạn hợp đồng ca sĩ độc quyền: {idol_het_thoi}"._
_Phát ngồi ở ghế phụ sát cửa. Không đeo kính._
giam_doc: {quan_ly_idol}. Cậu là quản lý của nó. Nói đi. Gia hạn hay không?
* {uy_tin >= 30} [🎲 "Gia hạn. Em đặt cược uy tín của em. Một năm nữa không lên, em nghỉ trước nó."]
    _Cả phòng im lặng. {hr} ngừng ghi chép. {idol_het_thoi} quay phắt sang nhìn bạn._
    giam_doc: *(nhìn bạn rất lâu)* Mười hai năm cậu chưa cược cái gì. Lần đầu cậu cược, cược cho nó.
    giam_doc: Được. Gia hạn.
    ~ thai_dat_cuoc = true
    ~ thai_phat_gia_han = true
    ~ thai_gk(-10)
    ~ qh("idol_het_thoi", 15)
* [📊 "Clip bóng tối. Bài nhận lỗi. Đám cưới cả tháng. Số liệu đây anh. Nó đáng."]
    { thai_clip_15_dang or thai_phat_huy_fan_ao or qh_giam_doc >= 30:
        giam_doc: *(lật số liệu)* Ừ. Số thật. Gia hạn một năm.
        ~ thai_phat_gia_han = true
    - else:
        giam_doc: Số liệu này… anh không thấy lý do. Anh xin lỗi.
    }
* [😶 "Anh quyết đi. Em không công bằng được."]
    giam_doc: *(thở dài)* Thế thì anh quyết theo số.
    { qh_giam_doc >= 40 or thai_song_ca_ghep:
        ~ thai_phat_gia_han = true
        giam_doc: Gia hạn. Vì Đêm Hồng mai nó còn song ca.
    - else:
        giam_doc: Chưa gia hạn.
    }
- { thai_phat_gia_han:
    _Phát nhìn bạn. Không cười. Chỉ gật đầu một cái, rất chậm, như cúi chào sau một bài hát._
    ~ thai_tt(10)
- else:
    _Phát đứng dậy, ra ngoài. Bạn muốn đi theo. Máy phải reo: đạo diễn Đêm Hồng. Bạn nghe máy._
    ~ thai_kh(1)
    ~ thai_tt(-10)
}
_Cuối buổi, {giam_doc} đọc thêm một dòng: "Khủng hoảng truyền thông đang mở: {thai_khung_hoang}." Cả phòng nhìn bạn._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_3010_dem_truoc ===
# ngay:30 # gio:22:30 # noi:studio_0905
_Đêm trước Đêm Hồng. Studio 0905. 22 giờ, {giam_doc} nhắn group: "Mai cả nhà cháy hết mình nhé. Anh không ép, tùy các em."_
_Bạn mở ngăn kéo tủ đầu giường. Tấm ảnh {idol_het_thoi} năm 2015, đêm trao giải. Mặt kính không một hạt bụi. Mười một năm bạn lau nó mỗi tối._
_Máy trái sáng. {idol_het_thoi}: "Mai anh đứng ở đâu?"_
* [💬 "Ở chỗ thấy em rõ nhất."]
    idol_het_thoi: …Dạ.
    _Một chữ "Dạ". Lần này bạn không đọc nó tới sáng. Bạn đi ngủ, và ngủ được._
    ~ thai_gk(-5)
    ~ thai_p(30)
* [📱 "Cánh gà. Như mọi khi."]
    idol_het_thoi: Như mọi khi.
    ~ thai_gk(3)
* {thai_ky_ll} [💚 Không trả lời. Mở tin nhắn của Lưu Lực: "Mai 18 giờ, xe LL đón anh và Nguyên."]
    _Bạn đọc hai tin nhắn, một trên một dưới. Bạn trả lời tin dưới: "Ok." Tin trên, bạn để đó._
    ~ thai_tt(-10)
- _Bạn đóng ngăn kéo. Lần này không kiểm tra lại._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_3110_vi_tri ===
# ngay:31 # gio:18:30 # noi:san_khau_dem_hong # bat_buoc
_Đêm Hồng Halloween. Sân khấu Đêm Hồng, Phường Tân Drama. Cả công ty hóa trang. {giam_doc} mặc đồ "Ông Kẹ Ngân Hàng", không ai dám cười._
{ thai_dat_nguyen_di:
    ~ thai_vi_tri_dem_hong = "ll"
    _Nhưng bạn không ở đó. Bạn ở tầng 18 tòa nhà kính xanh lá chuối, ngồi trước màn hình livestream._
    -> END
}
{ thai_khung_hoang >= 5:
    _Bạn không ở đó. Bạn đang nằm ở Phòng khám Đa Khoa Khỏe Re._
    -> END
}
_Hậu trường ồn như chợ. Máy phải: đạo diễn sân khấu. Máy trái: {idol_het_thoi}, đứng cách bạn 3 mét._
{ thai_doi_lich_son >= 3 and not thai_to_son:
    _Máy thứ ba: tin nhắn của {thanh_xin_nghi}, gửi từ Đài Tivi Hóng: "Em sắp lên. Anh coi em nha."_
}
* [📞 Đứng cánh gà với hai điện thoại. Như mọi khi.]
    ~ thai_vi_tri_dem_hong = "canh_ga"
    _Bạn đứng ở chỗ quen thuộc nhất đời mình: giữa sân khấu và bóng tối._
    ~ uy_tin = uy_tin + 3
* [📵 Giao bộ đàm cho {chi_dai}. Tắt cả hai máy. Ra ngồi hàng ghế đầu.]
    chi_dai: *(cầm bộ đàm, nhướn mày)* Ông đi đâu đó?
    quan_ly_idol: Đi coi ca nhạc.
    chi_dai: *(cười)* Đi đi. Tối nay tui lo.
    ~ thai_vi_tri_dem_hong = "hang_dau"
    ~ qh("chi_dai", 5)
    ~ thai_p(20)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
{ thai_vi_tri_dem_hong == "ll":
    _Màn hình livestream. Phim ngắn "Người Hùng Không Tên" mở màn ở sân khấu bên kia đường. Rồi video "16 năm". Bạn thấy chính mình năm 2015, đứng sau một cậu sinh viên ôm đàn._
    _Bạn tắt tiếng livestream. Không tắt được hình._
    -> END
}
_19 giờ 30. Đêm Hồng bắt đầu. Phim ngắn "Người Hùng Không Tên" mở màn, rồi video "16 năm" của {editor}. Trong video có một cảnh năm 2015: một cậu trợ lý booking đứng sau cậu sinh viên ôm đàn, tay cầm một cái điện thoại cục gạch._
_Cả bãi năm nghìn người không ai biết người đó là bạn. {editor} thì biết. {editor} đã giữ khung hình đó lâu hơn các khung khác một giây._
{ thai_song_ca_ghep and not nguyen_theo_ll:
    _Tiết mục số 3. "Công Viên Hồng". {idol_het_thoi} và Nguyên. Nhạc dạo bản remix vang lên. Nguyên nhìn mu bàn tay trái, đọc to: "…thích ăn CHUỐI chiên!"_
    _Năm nghìn người hét theo. {giam_doc} ở hàng đầu, bộ đồ Ông Kẹ ướt đẫm nước mắt._
    ~ follow(150000)
- else:
    { thai_phat_gia_han:
        _Phát mở màn phần ca nhạc. "Công Viên". Nửa bãi hát theo._
        ~ follow(20000)
    }
}
{ thai_vi_tri_dem_hong == "hang_dau":
    _Bạn ngồi hàng ghế đầu. Hai máy đã tắt. Tay bạn không biết để đâu, nên bạn vỗ tay. Vỗ tới đỏ cả tay, như đêm trao giải năm 2015._
    _Trên sân khấu, {idol_het_thoi} nhìn xuống. Thấy bạn. Lần đầu tiên trong mười một năm, {idol_het_thoi} thấy bạn ở hàng ghế đầu, không phải trong bóng tối._
- else:
    _Bạn đứng trong cánh gà. Máy phải: đạo diễn. Máy trái: im. {idol_het_thoi} đang hát, không gọi ai._
}
* [🎶 Hát theo. Lần này thành tiếng.]
    ~ thai_gk(-5)
    ~ cang_thang(-10)
* [📞 Nghe máy đạo diễn: chuẩn bị tiết mục tiếp theo.]
    ~ uy_tin = uy_tin + 2
    ~ follow(10000)
* {thai_doi_lich_son >= 3 and not thai_to_son} [📺 Mở máy thứ ba coi {thanh_xin_nghi} hát chung kết.]
    _Màn hình nhỏ xíu. {thanh_xin_nghi} trong bộ vest kim tuyến, hát nốt cao, không ho tiếng nào._
    _Bạn giơ ngón cái lên trước màn hình. Không ai thấy. {thanh_xin_nghi} thì như thấy._
    ~ qh("thanh_xin_nghi", 10)
- -> END
