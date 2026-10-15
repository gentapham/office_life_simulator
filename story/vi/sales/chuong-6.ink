// ============================================================
// SALES · CHƯƠNG 6: "TIN CHỊ ĐI (LẦN CUỐI)" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== sales_2810_hai_nga ===
# ngay:28 # gio:14:50 # noi:ban_sales # bat_buoc
~ sl_kpi_giay_2810 = sl_kpi_giay
_Mốc 4: 800.000 người theo dõi. Hiện tại: {nguoi_theo_doi}._
{ not sl_tin_cuoc_goi:
    _Hôm nay là một ngày bình thường. Không ai gọi tới. Hoặc có ai đó đã gọi, hôm qua, và bạn đã cười._
    hong_hot: Bà ơi, LL vừa đăng bài: "LL-Entertainment hân hạnh hợp tác cùng Sữa Chua Hồng Hào". Ủa… cái tên nghe quen quen.
    _Bạn nhìn màn hình. Cái tên đó. Bạn nhớ ra. Ly cà phê trong tay nguội dần._
    ~ cang_thang(20)
    -> END
}
_14 giờ 50. Bạn ôm xấp hồ sơ đề xuất {designer} làm đêm qua, chuẩn bị chạy sang Sống Ảo. Hẹn 15 giờ._
_Điện thoại reo. {giam_doc}._
{ sl_hua_ca_si:
    giam_doc: {sales}, lên phòng anh ngay. Cái clip Vũng Tàu. Ca sĩ nổi tiếng nhất nước đâu em? Còn 3 ngày.
- else:
    giam_doc: {sales}, lên phòng anh ngay. Đoàn thuế gửi văn bản hỏi về hợp đồng BTT. Anh cần em giải thích.
}
_15 giờ. Hai nơi. Một người._ # hen_gio:8
* [🏃 Đi Sống Ảo. Sếp đợi được. Sữa chua thì không.]
    -> song_ao
* [🏢 Lên phòng sếp. Không thể trốn mãi.]
    -> phong_sep
* {qh_designer >= 50} [🤝 Nhắn {designer}: "Chị giữ khách giùm em 30 phút!" rồi lên phòng sếp.]
    designer: *(nhắn lại sau 5 giây)* Đi đi. Chị lo.
    -> phong_sep
* [⏱️ (Không chọn kịp)]
    _Bạn đứng giữa cầu thang, một chân lên, một chân xuống. 15 giờ 10. Bạn chạy xuống. Chậm 10 phút._
    -> song_ao

= song_ao
_Quán Sống Ảo. Một cô mặc áo hồng nhạt, bảng tên "Sữa Chua Hồng Hào", ngồi nhìn đồng hồ._
sua_chua_hong_hao: Chào chị {sales}. Bên em đọc hồ sơ rồi. Đẹp. Mà… bên em hỏi thật: công ty chị có bao nhiêu nhà tài trợ rồi?
* [🤝 "Dạ, nói thật: bên em chỉ có quán ốc, tiệm nail, phòng khám. Chị là nhà tài trợ lớn đầu tiên."]
    ~ sl_that_long()
    sua_chua_hong_hao: *(bật cười)* Tôi thích sự thật thà đó. Bên tôi cũng chỉ là xưởng sữa chua nhỏ ở Ven Đô mà.
    -> ky
* [🗣️ "Dạ, ba tập đoàn lớn, trong đó có BTT Global!"]
    ~ sl_phet(10)
    sua_chua_hong_hao: BTT Global? *(lướt điện thoại)* Em tra không ra. Chị có mã số thuế không?
    _Bạn cảm thấy cả quán Sống Ảo im lặng, dù không ai im lặng._
    ** [🤝 "…Dạ không có. Em xin lỗi. Cái đó em bịa."]
        ~ sl_that_long()
        ~ sl_tu_nhan_btt_gia = true
        sua_chua_hong_hao: *(nhìn bạn rất lâu)* Chị nói thật lúc bị hỏi tới. Vậy cũng được. Ký.
        -> ky
    ** [📞 Điện Thoại Giả: "Dạ chủ tịch gọi, chị chờ em xíu!"]
        _Bạn quay lại sau 5 phút. Ghế trống. Trên bàn để lại tờ giấy: "Bên tôi cần đối tác nói thật. Chúc chị may mắn."_
        ~ sl_phet(10)
        -> END

= ky
_Hợp đồng được ký. Thật. Có mộc đỏ. 1 tỷ đồng tài trợ Đêm Hồng. Không ai phải ghép ảnh trụ sở._
{ sl_duy_xem_hop_dong:
    _Bạn đã nhờ {thuc_tap_sinh} đọc trước. Anh chỉ ra 2 điều khoản bất lợi, bạn đã xin sửa. Deal an toàn tuyệt đối._
- else:
    _Điều khoản 7 ghi: "Siêu Nhân Hồng ăn sữa chua trên sân khấu, tối thiểu 3 hộp". Bạn quyết định ảnh sẽ vui._
}
~ sl_ky_sua_chua = true
~ sl_that(1000)
~ follow(100000)
_Bạn bước ra khỏi quán. Đứng giữa vỉa hè. Rồi bạn khóc. Không ai thấy. Lần này bạn không chụp story._
-> END

= phong_sep
_Phòng giám đốc. {giam_doc} ngồi sau bàn. Trên tường, nếu có, là bằng khen "Doanh nhân của năm" của BTT._
giam_doc: Em nói đi. Anh nghe.
* {not sl_tu_nhan_btt_gia} [🤝 "Sếp ơi… BTT Global không có thật. Ca sĩ cũng không có. Em xin lỗi."]
    ~ sl_that_long()
    ~ sl_tu_nhan_btt_gia = true
    ~ sl_phet(-30)
    giam_doc: *(im lặng rất lâu, rồi đứng dậy, tháo bằng khen trên tường xuống)* Anh biết. Lâu rồi.
    giam_doc: Đi đi. Em còn một cái hẹn thật mà, phải không?
    ~ qh("giam_doc", 15)
* [🗣️ "Sếp yên tâm! Tin chị đi, mọi thứ đang trong tầm kiểm soát!"]
    ~ sl_phet(15)
    giam_doc: *(nhìn bạn, giọng mệt)* Ừ. Anh tin. *(không tin)*
* [💬 "Sếp ơi, em có hẹn ký với nhà tài trợ thật. Ngay bây giờ. Sếp cho em đi được hông?"]
    giam_doc: Thật à? *(nhìn đồng hồ)* Thế còn đứng đây làm gì! Đi!
    ~ qh("giam_doc", 5)
- { sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
_15 giờ 40. Bạn chạy như bay sang Sống Ảo._
{ qh_designer >= 50:
    _{designer} đang ngồi đối diện khách, laptop mở, trình bày phần hình ảnh. Khách đang cười. {designer} quay lại, nháy mắt: "Tới rồi đó chị."_
    -> ky
- else:
    _Ghế trống. Ly sữa chua uống dở. Trên bàn để lại tấm danh thiếp, mặt sau ghi: "Gọi lại cho em trước 17 giờ."_
    * [📞 Gọi lại ngay, nói thật vì sao trễ.]
        ~ sl_that_long()
        _"Bị sếp gọi lên vì một lời hứa cũ." Đầu dây bên kia im lặng, rồi bật cười: "Ai cũng có sếp. Mai 9 giờ, ở Ven Đô nhé."_
        -> ky
    * [🗣️ Gọi lại: "Dạ em bị kẹt cuộc họp với tập đoàn đa quốc gia!"]
        _"Chị ơi, bên em cần đối tác nói thật." Tút tút tút._
        ~ sl_phet(10)
        -> END
}

// ------------------------------------------------------------
=== sales_2810_toi ===
# ngay:28 # gio:20:00 # noi:can_1203
_20 giờ. Fanpage công ty vừa lỡ đăng một video lạ: những khoảnh khắc của {quan_ly_idol}, câu cuối "Anh có biết không?". Gỡ sau 6 phút._
_Cùng lúc, bộ lọc số liệu của {dan_dau_tu} lần ra 80.000 tài khoản fan ảo của {idol_het_thoi}. Mạng xã hội sôi sùng sục._
{ sl_phat_nhan_loi:
    idol_het_thoi: *(nhắn)* {sales}… em còn muốn anh hát Đêm Hồng không? Giờ ai cũng biết anh thuê fan.
    * [🤝 "Còn. Fan ảo thì ảo. Giọng anh thì thật. Em bán giọng thật."]
        idol_het_thoi: *(gửi một sticker khóc)* …Ừ. Anh hát.
        ~ qh("idol_het_thoi", 10)
        ~ sl_that_long()
        -> END
    * [😶 "Để em hỏi lại sếp đã anh."]
        idol_het_thoi: Ừ. Anh hiểu.
        ~ sl_phat_nhan_loi = false
        ~ qh("idol_het_thoi", -10)
        -> END
- else:
    _Bạn ngồi trên sofa nhung, ăn mì, xem mạng xã hội cháy. Lần đầu tiên, drama không phải của bạn._
    ~ an(25)
    -> END
}

// ------------------------------------------------------------
=== sales_2910_grab_ven_do ===
# ngay:29 # gio:09:30 # noi:ban_sales # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. {it} bị cả công ty rượt quanh 3 tầng._
{ sl_ky_sua_chua:
    _Hợp đồng Sữa Chua Hồng Hào cần bản gốc có chữ ký {giam_doc}, gửi về Ven Đô trước 17 giờ. Email không gửi được. Chỉ còn cách chạy._
- else:
    _Không có hợp đồng nào cần chạy. Bạn nhìn màn hình không có mạng, và cảm thấy mình cũng đang không có tín hiệu._
    ~ cang_thang(10)
    -> END
}
_Bạn đặt Grab. Tài xế nhận. Rồi hủy: "Em xin lỗi, xe em bể bánh."_
_Đặt lại. Nhận. Hủy: "Em xin lỗi, trời sắp mưa."_
* [🏍️ Mượn xe máy của {thuc_tap_sinh}, tự chạy ra Ven Đô.]
    thuc_tap_sinh: Dạ chị lấy đi ạ! Xe em hơi yếu, tới dốc chị đẩy giùm em nha chị!
    _Một tiếng. Đường đất đỏ. Một con dốc phải đẩy bộ. Bạn tới nơi, giày cao gót cầm trên tay, áo vest dính bụi._
    ~ nghi(-30)
    ~ qh("thuc_tap_sinh", 5)
    sua_chua_hong_hao: *(nhìn bạn từ đầu tới chân)* Chị chạy xe ra đây hả? *(cười)* Bên em làm ăn với chị dài dài.
    ~ sl_that(50)
* [📞 Đặt lần thứ 3, nhắn tài xế: "Anh ơi, tin chị đi, chuyến này quan trọng lắm, em boa gấp đôi."]
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    ~ tien_cong(-200000)
    _Tài xế không hủy. Tới Ven Đô lúc 16 giờ 45. Kịp. Boa gấp đôi là thứ duy nhất bạn hứa mà làm ngay._
* [🤝 Nhờ Bác {bac_bao_ve} chở bằng xe đạp điện.]
    bac_bao_ve: Ven Đô à? Bác về nhà cũng đường đấy. Lên đi.
    _Bác chạy chậm, chắc, không nói câu nào. Tới nơi, bác đứng ngoài cổng đợi, uống nước chè mang theo._
    ~ qh("bac_bao_ve", 10)
    ~ nghi(-10)
- -> END

// ------------------------------------------------------------
=== sales_2910_choi_bao_ve ===
# ngay:29 # gio:15:30 # noi:choi_bao_ve
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} đeo kính lão, phân loại giấy note theo tầng._
bac_bao_ve: Tầng 2 gửi tầng 1: "Hóa đơn đâu em?". Thế à. Ừ.
_{chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua". Video của {editor} kẹt ở 99%._
bac_bao_ve: Cháu {sales}. Có giấy cho cháu.
{ sl_ky_sua_chua:
    _Mảnh giấy của {ke_toan}: "Tiền tài trợ về rồi. 1 tỷ. Có hóa đơn. Chị khóc. T."_
    ~ cang_thang(-20)
    ~ qh("ke_toan", 5)
- else:
    _Mảnh giấy của {ke_toan}: "Sổ tạm ứng của em: {sl_tam_ung}đ. Mai họp đánh giá."_
    ~ cang_thang(10)
}
* [😇 Ngồi xuống ghế bố, xin bác cốc trà đá.]
    bac_bao_ve: Ừ. *(rót trà)* Dạo này cháu nói ít đi. Bác nghe dễ chịu hơn.
    ~ uong(30)
    ~ qh("bac_bao_ve", 8)
* [📝 Viết giấy gửi {designer}: "Chị Quỳnh, tối nay ăn ốc, em bao bằng tiền thật."]
    _Năm phút sau, giấy trả lời: một hình vẽ con cá voi hồng giơ ngón cái._
    ~ qh("designer", 5)
- -> END

// ------------------------------------------------------------
=== sales_3010_don_kho ===
# ngay:30 # gio:07:45 # noi:gam_cau_thang
_7 giờ 45. {hr} cho dọn kho. Trong ngăn bàn bạn: một xấp hợp đồng BTT Global, một con dấu khắc tay, một tấm danh thiếp "Mr. Kevin Trộn, Chủ tịch"._
* [🗑️ Bỏ hết vào thùng rác đen.]
    ~ sl_phet(-5)
    _Xấp giấy rơi xuống thùng nghe "bịch". Nhẹ hơn bạn tưởng._
* [🗂️ Giữ lại tấm danh thiếp Kevin Trộn. Làm kỷ niệm.]
    _Bạn bỏ nó vào ví, sau tấm thẻ ngân hàng. Một chủ tịch không có thật, nhưng là người đồng hành thật nhất tháng của bạn._
- _Ngay dưới gầm cầu thang, {cho} nằm chắn trước ổ đồ báu vật của nó, gầm gừ với {hr}._
* [🤝 "Anh {hr}, ổ của {cho} để em dời vô chòi."]
    ~ qh("cho", 12)
    ~ qh("hr", -2)
    _{cho} đi theo bạn, đuôi vẫy như cánh quạt._
* [😶 Đi lên họp.]
    _Sau lưng bạn, {cho} sủa một tiếng rất dài._
- -> END

// ------------------------------------------------------------
=== sales_3010_hop_danh_gia ===
# ngay:30 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. {dan_dau_tu} được giao đối chiếu số liệu. Màn hình chiếu hai cột: KPI Trên Giấy và KPI Thật._
_Cột cam: {sl_kpi_giay}%. Cột xám: {sl_kpi_that} triệu đồng._
{ sl_ky_sua_chua:
    _Lần đầu tiên, cột xám cao vút. 1 tỷ từ Sữa Chua Hồng Hào. Cả phòng xì xào._
}
dan_dau_tu: Phòng Kinh doanh. {sales}, em có 30 giây trước khi anh chuyển slide.
_Ba mươi giây. Đồng hồ trên tường tích tắc._ # hen_gio:10
* [🤝 Đứng lên: "Cột cam là số em vẽ. Cột xám mới là thật. Em xin lỗi mọi người."]
    ~ sl_that_long()
    ~ sl_phet(-30)
    { not sl_tu_nhan_btt_gia:
        _Bạn nói thêm: "BTT Global cũng không có thật." Lần này trước cả công ty._
        ~ sl_bi_mat_lo = true
    }
    _Im lặng. Rồi {ke_toan} vỗ tay. Rồi {chi_dai}. Rồi {giam_doc}._
    ~ qh("ke_toan", 10)
    ~ uy_tin = uy_tin + 10
* [🗣️ "Tin chị đi! Số liệu đang chờ cập nhật từ đối tác nước ngoài!"]
    ~ sl_phet(20)
    dan_dau_tu: *(nhìn bạn, lắc đầu nhẹ)* Anh chuyển slide nhé.
* [🔁 "Do đối tác đổi ý phút chót ạ."]
    ~ sl_phet(10)
    ke_toan: Đối tác nào? Hóa đơn đâu em?
    ~ sl_hoi_hoa_don = sl_hoi_hoa_don + 1
* [⏱️ (Không chọn kịp)]
    _{dan_dau_tu} bấm chuyển slide. Hai cột biến mất. Câu chuyện của bạn trôi qua như mọi khi._
- { sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
_Cuối buổi, {giam_doc} gia hạn hợp đồng cho {idol_het_thoi}. Không ai nhắc tới con số 20% đã hứa ở karaoke._
-> END

// ------------------------------------------------------------
=== sales_3110_canh_ga ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 30. Đêm Hồng Halloween. Cả công ty hóa trang. {giam_doc} là "Ông Kẹ Ngân Hàng", vest đen, cặp táp, mặt nạ cười._
{ sl_ky_sua_chua:
    _Trên sân khấu lớn, logo Sữa Chua Hồng Hào sáng rực. Sân khấu to gấp ba dự kiến. Đèn đủ, âm thanh đủ, khói đủ._
    ~ follow(30000)
- else:
    _Sân khấu nhỏ hơn dự kiến. Logo nhà tài trợ: Quán Ốc Đêm, Tiệm Nail Lung Linh, Phòng khám Khỏe Re. Và một khoảng trống, nơi lẽ ra là BTT Global._
}
_Bạn đứng sau cánh gà, cầu trời không ai hỏi chủ tịch Kevin Trộn đâu._
mc_tivi_hong: *(trên sân khấu)* Và xin cảm ơn các nhà tài trợ!
{ sl_btt_cong_bo && not sl_tu_nhan_btt_gia:
    mc_tivi_hong: …À, có khán giả hỏi: đại diện Tập đoàn BTT Global đâu ạ?
    _Ánh đèn rọi về phía cánh gà. Về phía bạn._ # hen_gio:5
    * [🤝 Bước ra: "Dạ, BTT Global không có thật. Nhà tài trợ thật là những người đang có logo trên kia."]
        ~ sl_that_long()
        ~ sl_tu_nhan_btt_gia = true
        ~ sl_bi_mat_lo = true
        ~ sl_phet(-30)
        _Khán đài im lặng 3 giây. Rồi ai đó vỗ tay. Rồi cả quảng trường vỗ tay. Mạng xã hội gọi đó là "cú quay xe thật thà nhất năm"._
        ~ follow(20000)
        -> ca_si
    * [💁 "Chủ tịch đang trên đường ạ! Tin chị đi!"]
        ~ sl_phet(20)
        -> ca_si
    * [⏱️ (Không chọn kịp)]
        _MC tự lấp: "Chắc chủ tịch kẹt xe!". Khán giả cười. Bạn không cười._
        ~ sl_phet(5)
        -> ca_si
- else:
    -> ca_si
}

= ca_si
{ sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
{ sl_hua_ca_si:
    { sl_phat_nhan_loi:
        _Đèn tắt. Một giọng hát cất lên từ bóng tối: "Ngày xưa có đôi bạn thân…". {idol_het_thoi}, bản remix. Cả quảng trường hát theo, từ người 15 tuổi tới người 45 tuổi._
        _"Ca sĩ nổi tiếng nhất nước" là một lời phét. Nhưng đêm nay, trong 4 phút, nó là sự thật._
        ~ follow(40000)
        ~ qh("idol_het_thoi", 10)
    - else:
        _Khán giả bắt đầu hô: "Ca sĩ đâu! Ca sĩ đâu!". Clip Vũng Tàu được chiếu lại trên hàng trăm điện thoại._
        ~ follow(-50000)
        ~ scandal()
        ~ cang_thang(20)
    }
- else:
    { sl_phat_nhan_loi:
        _Không ai hứa gì, nhưng {idol_het_thoi} vẫn bước ra, hát "Công Viên" bản remix. Cả quảng trường hát theo._
        ~ follow(30000)
    }
}
_{sieu_nhan_hong} bước ra giữa sân khấu. Cả quảng trường hét lên. Bạn đứng sau cánh gà, tay nắm chặt tấm rèm._
-> END

// ------------------------------------------------------------
=== sales_3110_sau_dem_hong ===
# ngay:31 # gio:23:30 # noi:san_khau_dem_hong
_23 giờ 30. Quảng trường vắng dần. Bạn ngồi trên bậc sân khấu, giày cao gót cầm tay. {designer} ngồi xuống cạnh, đưa bạn một hộp sữa chua._
designer: Hồng Hào. Hàng tài trợ. Còn dư 200 hộp.
{ sl_ky_sua_chua:
    sales: Chị Quỳnh. Lần đầu tiên em ký được cái gì thật.
    designer: Chị biết. Chị thấy em khóc ở vỉa hè Sống Ảo.
    sales: Chị thấy hả?!
    designer: Chị không thấy gì đâu. *(cười)* Câu của Bác Bình.
- else:
    sales: Chị Quỳnh. Em mệt quá.
    designer: Ừ. Ăn sữa chua đi. Mệt thì ăn.
}
* [😇 "Chị Quỳnh… mai mình làm gì?"]
    designer: Mai chủ nhật. Mai ngủ.
    sales: Còn mốt?
    designer: Mốt tính. Slogan công ty mà.
    ~ qh("designer", 5)
* [💁 "Tin chị đi, tụi mình sẽ ổn."]
    designer: *(nhìn bạn)* Câu đó em nói thật hay em đang bán?
    sales: *(nghĩ lâu)* …Lần này thật.
    ~ sl_that_long()
    ~ qh("designer", 5)
- _Hai đứa ngồi ăn sữa chua dưới ánh đèn sân khấu đang tắt dần. Câu chuyện của bạn sắp có hồi kết._
-> END
