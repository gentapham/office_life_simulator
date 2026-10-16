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
_14 giờ 50. Bạn ôm xấp hồ sơ đề xuất {designer} làm đêm qua, chuẩn bị chạy sang Sống Ảo. Hẹn 15 giờ. Bà cụ chủ xưởng không đợi ai quá lâu: tới đúng giờ thì 1 tỷ, trễ thì bà tính lại._
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
_Quán Sống Ảo. Một bà cụ tóc bạc, áo bà ba hồng nhạt, ngồi cạnh đứa cháu trai đang ôm cặp hồ sơ. Trên bàn: hai hộp sữa chua và một cái đồng hồ đeo tay đặt ngửa._
sua_chua_hong_hao: Con là {sales} hả? Bà đọc hồ sơ rồi. Đẹp. Mà bà hỏi thật nghen: công ty con có bao nhiêu nhà tài trợ rồi?
* [🤝 "Dạ, nói thật: bên em chỉ có quán ốc, tiệm nail, phòng khám. Chị là nhà tài trợ lớn đầu tiên."]
    ~ sl_that_long()
    sua_chua_hong_hao: *(bật cười)* Bà thích con nói vậy. Bà cũng chỉ là cái xưởng sữa chua nhỏ ở Ven Đô thôi mà.
    -> ky
* [🗣️ "Dạ, ba tập đoàn lớn, trong đó có BTT Global!"]
    ~ sl_phet(10)
    sua_chua_hong_hao: BTT Global? *(quay sang đứa cháu, đứa cháu lắc đầu)* Thằng cháu bà tra không ra. Con có mã số thuế hông?
    _Bạn cảm thấy cả quán Sống Ảo im lặng, dù không ai im lặng._
    ** [🤝 "…Dạ không có. Em xin lỗi. Cái đó em bịa."]
        ~ sl_that_long()
        ~ sl_tu_nhan_btt_gia = true
        sua_chua_hong_hao: *(nhìn bạn rất lâu)* Con nói thật lúc bị hỏi tới. Vậy cũng được. Ký.
        -> ky
    ** [📞 Điện Thoại Giả: "Dạ chủ tịch gọi, chị chờ em xíu!"]
        _Bạn quay lại sau 5 phút. Ghế trống. Trên bàn để lại tờ giấy, chữ run run: "Bà cần người nói thật. Chúc con may mắn."_
        ~ sl_phet(10)
        -> END

= ky
_Hợp đồng được ký. Thật. Có mộc đỏ. 1 tỷ đồng tài trợ Đại Nhạc Hội Siêu Nhân. Không ai phải ghép ảnh trụ sở._
~ sl_that(1000)
{ sl_duy_xem_hop_dong:
    _Bạn đã nhờ {thuc_tap_sinh} đọc trước. Anh chỉ ra 2 điều khoản bất lợi, bạn đã xin sửa. Deal an toàn tuyệt đối._
- else:
    _Điều khoản 7 ghi: "Siêu Nhân Hồng ăn sữa chua trên sân khấu, tối thiểu 3 hộp". Bạn quyết định ảnh sẽ vui._
}
-> da_ky

= ky_tre
_Sáng 29/10, 9 giờ, xưởng sữa chua ở Ven Đô. Bà cụ đọc hợp đồng thật chậm, rồi lấy bút sửa một con số._
sua_chua_hong_hao: Con tới trễ một bữa. Bà không giận. Mà bà làm ăn thì phải giữ lời với chính bà: trễ thì nửa thôi. 500 triệu nghen con.
_Có mộc đỏ. 500 triệu. Vẫn là tiền thật. Lần đầu tiên, bạn thấy một nửa sự thật vẫn nặng hơn hai tỷ lời phét._
~ sl_that(500)
-> da_ky

= da_ky
~ sl_ky_sua_chua = true
~ follow(50000)
_Bạn bước ra đứng giữa vỉa hè. Rồi bạn khóc. Không ai thấy. Lần này bạn không chụp story._
chi_dai: *(nhắn, chỉ 5 phút sau)* Nghe nói có tiền thật rồi hả? Chị xin 60 triệu thuê hai giàn đèn còn thiếu. Lần này chị đi xin, không phải em.
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
- _15 giờ 40. Bạn chạy như bay sang Sống Ảo._
{ qh_designer >= 50:
    _{designer} đang ngồi đối diện khách, laptop mở, trình bày phần hình ảnh. Khách đang cười. {designer} quay lại, nháy mắt: "Tới rồi đó chị."_
    -> ky
- else:
    _Ghế trống. Hộp sữa chua ăn dở. Trên bàn để lại tấm danh thiếp, mặt sau ghi: "Gọi lại cho bà trước 17 giờ."_
    * [📞 Gọi lại ngay, nói thật vì sao trễ.]
        ~ sl_that_long()
        _"Bị sếp gọi lên vì một lời hứa cũ." Đầu dây bên kia im lặng, rồi bà cụ bật cười: "Ai cũng có sếp. Mai 9 giờ, xuống Ven Đô gặp bà."_
        -> ky_tre
    * [🗣️ Gọi lại: "Dạ em bị kẹt cuộc họp với tập đoàn đa quốc gia!"]
        _"Con ơi, bà cần người nói thật." Tút tút tút._
        ~ sl_phet(10)
        -> END
}

// ------------------------------------------------------------
=== sales_2810_toi ===
# ngay:28 # gio:20:00 # noi:can_1203
_20 giờ. Fanpage công ty vừa lỡ đăng một video lạ: những khoảnh khắc của {quan_ly_idol}, câu cuối "Anh có biết không?". Gỡ sau 6 phút._
_Cùng lúc, bộ lọc số liệu của {dan_dau_tu} lần ra 80.000 tài khoản fan ảo của {idol_het_thoi}. Mạng xã hội sôi sùng sục._
{ sl_phat_nhan_loi:
    idol_het_thoi: *(nhắn)* {sales}… em còn muốn anh hát Đại Nhạc Hội không? Giờ ai cũng biết anh thuê fan.
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
=== sales_2910_xe_ven_do ===
# ngay:29 # gio:09:30 # noi:ban_sales # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. {it} bị cả công ty rượt quanh 3 tầng._
{ sl_ky_sua_chua:
    _Hợp đồng Sữa Chua Hồng Hào cần bản gốc có chữ ký {giam_doc}, gửi về Ven Đô trước 17 giờ. Email không gửi được. Chỉ còn cách chạy._
- else:
    _Không có hợp đồng nào cần chạy. Bạn nhìn màn hình không có mạng, và cảm thấy mình cũng đang không có tín hiệu._
    ~ cang_thang(10)
    -> END
}
_Bạn đặt xe ôm công nghệ. Tài xế nhận. Rồi hủy: "Em xin lỗi, xe em bể bánh."_
_Đặt lại. Nhận. Hủy: "Em xin lỗi, trời sắp mưa."_
* [🏍️ Mượn xe máy của {thuc_tap_sinh}, tự chạy ra Ven Đô.]
    thuc_tap_sinh: Dạ chị lấy đi ạ! Xe em hơi yếu, tới dốc chị đẩy giùm em nha chị!
    _Một tiếng. Đường đất đỏ. Một con dốc phải đẩy bộ. Bạn tới nơi, giày cao gót cầm trên tay, áo vest dính bụi._
    ~ nghi(-30)
    ~ qh("thuc_tap_sinh", 5)
    sua_chua_hong_hao: *(nhìn bạn từ đầu tới chân)* Con chạy xe ra tới đây hả? *(cười)* Bà làm ăn với con dài dài.
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
    _Mảnh giấy của {ke_toan}: "Tiền tài trợ về rồi. Có hóa đơn. Chị khóc. T."_
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
* [📝 Viết giấy gửi {designer}: "Chị {designer}, tối nay ăn ốc, em bao bằng tiền thật."]
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
* [🔍 Ngồi xuống cạnh ổ của {cho}, nhìn kỹ đống báu vật.]
    _Chùm chìa khóa, thỏi son, một chiếc tất sọc cam. Và một chiếc USB không nhãn, thơm mùi cà phê sữa đá._
    _Dân sales nhìn đồ là biết chủ. Mùi này chỉ có ở bàn {chua_te_deadline}._
    ~ nhan(usb_khong_nhan)
    chua_te_deadline: *(nhận USB, cắm thử, đứng im mấy giây)* …File tháng 6. Tìm cả tháng nay. Em lấy đâu ra vậy?
    sales: Đồ thất lạc thì phải về đúng chủ. Lần này em không bán.
    ~ mat(usb_khong_nhan)
    ~ qh("chua_te_deadline", 15)
    ~ qh("cho", -3)
* [😶 Đi lên họp.]
    _Sau lưng bạn, {cho} sủa một tiếng rất dài._
- -> END

// ------------------------------------------------------------
=== sales_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_14 giờ, phòng họp tầng 2. Họp đánh giá cuối tháng. {dan_dau_tu} được giao đối chiếu số liệu. Màn hình chiếu hai cột: KPI Trên Giấy và KPI Thật._
_Cột cam: {sl_kpi_giay}%. Cột xám: {sl_kpi_that} triệu đồng._
{ sl_ky_sua_chua:
    _Lần đầu tiên, cột xám cao vút. Tiền thật từ Sữa Chua Hồng Hào. Cả phòng xì xào._
}
dan_dau_tu: Phòng Kinh doanh. {sales}, em có 30 giây trước khi anh chuyển slide.
_Ba mươi giây. Đồng hồ trên tường tích tắc._ # hen_gio:10
* [🤝 Đứng lên: "Cột cam là số em vẽ. Cột xám mới là thật. Em xin lỗi mọi người."]
    ~ sl_that_long()
    ~ sl_phet(-30)
    { not sl_tu_nhan_btt_gia:
        _Bạn nói thêm: "BTT Global cũng không có thật." Lần này trước cả công ty._
        ~ sl_tu_nhan_btt_gia = true
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
- _Cuối buổi, {giam_doc} gia hạn hợp đồng cho {idol_het_thoi}. Không ai nhắc tới con số 20% đã hứa ở karaoke._
-> END

// ------------------------------------------------------------
=== sales_3110_canh_ga ===
# ngay:31 # gio:19:15 # noi:canh_ga_dem_hong # bat_buoc
_19 giờ 15. Cánh gà Đại Nhạc Hội Siêu Nhân. Cả công ty hóa trang. {giam_doc} là "Ông Kẹ Ngân Hàng", vest đen, cặp táp, mặt nạ cười._
_Lịch chạy dán trên vách: 19 giờ 30 mở màn bằng phim ngắn "Người Hùng Không Tên" của {bien_kich}, rồi video "16 năm" của {editor}. 20 giờ, màn hình lớn chiếu trực tiếp chung kết "Giọng Ca Ước Mơ" của {thanh_xin_nghi}, thí sinh số 27, rồi tới tiết mục chính._
{ sl_ky_sua_chua:
    _Trên phông sân khấu, logo Sữa Chua Hồng Hào sáng rực. Đèn đủ, âm thanh đủ, khói đủ. {chi_dai} đi ngang, gõ vào vai bạn một cái: "Hai giàn đèn đó là của em."_
- else:
    _Sân khấu nhỏ hơn dự kiến. Logo nhà tài trợ: Quán Ốc Đêm, Tiệm Nail Lung Linh, Phòng khám Khỏe Re. Và một khoảng trống, nơi lẽ ra là BTT Global._
}
_Bên kia quảng trường, màn hình LED trên tòa LL bật bộ nhận diện "Hồng Ngoại" màu xanh lá chuối, quay thẳng về sân khấu._
_Bạn đứng sau cánh gà, cầu trời không ai hỏi chủ tịch Kevin Trộn đâu._
mc_tivi_hong: *(thử micro trước giờ mở màn)* Một, hai, ba… Và xin cảm ơn các nhà tài trợ!
{ sl_btt_cong_bo && not sl_tu_nhan_btt_gia:
    -> hoi_btt
}
-> ca_si

= hoi_btt
mc_tivi_hong: …À, có khán giả hỏi: đại diện Tập đoàn BTT Global đâu ạ?
_Ánh đèn rọi về phía cánh gà. Về phía bạn._ # hen_gio:5
* [🤝 Bước ra: "Dạ, BTT Global không có thật. Nhà tài trợ thật là những người đang có logo trên kia."]
    ~ sl_that_long()
    ~ sl_tu_nhan_btt_gia = true
    ~ sl_phet(-30)
    _Khán đài im lặng 3 giây. Rồi ai đó vỗ tay. Rồi cả quảng trường vỗ tay. Mạng xã hội gọi đó là "cú quay xe thật thà nhất năm"._
* [💁 "Chủ tịch đang trên đường ạ! Tin chị đi!"]
    ~ sl_phet(20)
* [⏱️ (Không chọn kịp)]
    _MC tự lấp: "Chắc chủ tịch kẹt xe!". Khán giả cười. Bạn không cười._
    ~ sl_phet(5)
- -> ca_si

= ca_si
{ sl_hua_ca_si:
    { sl_phat_nhan_loi:
        _{idol_het_thoi} đứng cạnh bạn sau cánh gà, ôm micro, môi lẩm nhẩm "Ngày xưa có đôi bạn thân…". Tiết mục "Công Viên" bản remix đã có tên trên lịch chạy._
        _"Ca sĩ nổi tiếng nhất nước" là một lời phét. Nhưng tối nay, trong 4 phút, nó sắp thành sự thật._
        ~ qh("idol_het_thoi", 10)
    - else:
        _Dưới khán đài, mấy người cầm điện thoại chiếu lại clip Vũng Tàu, hô: "Ca sĩ đâu! Ca sĩ đâu!". Clip của bạn thành meme trước cả khi màn mở._
        ~ scandal()
        ~ cang_thang(20)
    }
- else:
    { sl_phat_nhan_loi:
        _Không ai hứa gì, nhưng {idol_het_thoi} đã có tên trên lịch chạy: "Công Viên" bản remix. Anh đứng sau cánh gà, gỡ kính đen ra lau, đeo lại, rồi gỡ ra lần nữa._
    }
}
_Đèn khán đài tắt. Phim của {bien_kich} bắt đầu. Bạn nắm chặt tấm rèm cánh gà._
-> END
