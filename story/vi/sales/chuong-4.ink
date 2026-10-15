// ============================================================
// SALES · CHƯƠNG 4: "VŨNG TÀU HỨA BỪA" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== sales_1710_chuong_x10 ===
# ngay:17 # gio:06:40 # noi:xe_khach # bat_buoc
_6 giờ 40. Xe khách đi Vũng Tàu. {dan_dau_tu} đứng ở cửa xe, giơ điện thoại lên trời như giơ cúp._
dan_dau_tu: Ngày Quốc tế Xóa nghèo! Hồng Coin x10! Từ nay anh thoát nghèo! Tối nay anh bao cả đoàn hải sản!
_Cả xe vỗ tay. Bạn không vỗ. Bạn nhìn {dan_dau_tu} như nhìn một con cá vừa tự nhảy lên thớt._
_Hôm nay là ngày duy nhất trong năm ông ấy "giàu"._
* [💁 "Anh {dan_dau_tu}. Tin chị đi, hôm nay mà anh trả đủ 5 triệu thì coin của anh sẽ x100."]
    { RANDOM(1, 10) <= 4:
        dan_dau_tu: *(nghĩ 5 giây)* X100… sòng phẳng thì vũ trụ thưởng… Được! *(bán một ít coin, chuyển khoản)*
        ~ sl_chuong_tra(sl_no_chuong)
        ~ sl_phet(5)
        ~ sl_tin_chi_di = sl_tin_chi_di + 1
        _"Ting." Bạn nhìn số dư. Rồi nhìn lại. Rồi chụp màn hình. Đòi được nợ. Gần như không thể. Nhưng đã xảy ra._
    - else:
        dan_dau_tu: Bán bây giờ là thua em ơi! Lên nữa anh trả gấp đôi!
        ~ sl_chuong_tra(500000)
        _Ông chuyển 500 nghìn "lấy hên". Còn lại vẫn nằm trong đồng coin mang tên một người đội mũ hồng._
    }
* [🤝 "Anh {dan_dau_tu}, bán đi anh. Bán ngay hôm nay. Em nói thật đó, không phải phét."]
    ~ sl_that_long()
    dan_dau_tu: *(khựng lại)* Em nói thật hả? Em mà nói thật là lạ đó.
    { RANDOM(1, 10) <= 6:
        dan_dau_tu: …Thôi được. Bán một nửa. Trả em trước. *(chuyển khoản)*
        ~ sl_chuong_tra(3000000)
        ~ qh("dan_dau_tu", 5)
    - else:
        dan_dau_tu: Cắt lỗ là thua, mà chốt lời sớm cũng là thua. Mai anh tính.
    }
* [💸 "Cho em vào 1 triệu với!"]
    ~ tien_cong(-1000000)
    dan_dau_tu: Chuẩn! Em có tầm nhìn! Lần này là lên thật!
    _Bạn vừa đầu tư 1 triệu vào một đồng coin không ai biết ai tạo. Bạn cảm thấy… rất sales._
- -> END

// ------------------------------------------------------------
=== sales_1710_che_cho_quynh ===
# ngay:17 # gio:14:00 # noi:vung_tau_bai_bien
_Nhà nghỉ không có wifi. {designer} nhìn bạn, ánh mắt khẩn cấp: Anh Lá Chuối đòi file trước Chủ nhật. Quán cà phê đầu ngõ có wifi._
_{hr} đang cầm loa điểm danh trò kéo co lần thứ 3._
* [💁 Đứng giữa bãi cát, hô to: "Mọi người ơi! Chị bao trà sữa cả đoàn!"]
    ~ sl_ung(500000)
    ~ tien_cong(-500000)
    ~ qh("designer", 12)
    _31 cánh tay giơ lên. Không ai để ý {designer} lẻn đi. Tiền trà sữa: tiền tạm ứng. Sổ Tạm Ứng thêm 500 nghìn._
    _Bạn không hối hận. Bạn sẽ nhớ cái nhìn {designer} gửi lại từ đầu ngõ._
* [🤝 Kéo {hr} ra hỏi chuyện team building, câu giờ 20 phút.]
    hr: *(cười)* Em muốn góp ý về team building à? Anh chỉ muốn lắng nghe em thôi. Mình ngồi đây nhé.
    _20 phút. {hr} kể về ngân sách bị cắt từ 120 xuống 60 triệu. Bạn gật đầu 84 lần._
    ~ qh("designer", 8)
    ~ qh("hr", 5)
    ~ nghi(-10)
* [😶 "Chị {designer}, tối về rồi làm. Ở đây đông người lắm."]
    designer: *(thở dài)* Ừ… em nói đúng.
    ~ qh("designer", -3)
- -> END

// ------------------------------------------------------------
=== sales_1710_nhau_hai_san ===
# ngay:17 # gio:19:30 # noi:vung_tau_quan_hai_san # bat_buoc
_Quán hải sản sát biển. {dan_dau_tu} bao thật: ghẹ, mực, tôm hùm (một con, chia 31 người). Bạn ngồi cạnh {giam_doc}. Ly thứ 5._
~ an(60)
giam_doc: {sales} này, Đêm Hồng mà có ca sĩ to về hát thì nổ tung luôn nhỉ. Em quen ai không? Anh không ép, tùy em.
_Rượu chạy lên má. Lưỡi bạn nhẹ như bong bóng._ # hen_gio:6
* [🗣️ "Tin chị đi, ca sĩ nổi tiếng nhất nước, chị gọi một cuộc là tới!"]
    ~ sl_hua_ca_si = true
    ~ sl_phet(30)
    ~ follow(20000)
    giam_doc: *(đập bàn)* Thế anh tăng lương cả công ty!
    _Ba cái điện thoại đang quay. {hong_hot} quay bằng hai cái. Ngày mai sẽ vui đây._
    { sl_bong_bong >= 100:
        -> sales_tudo_bong_bong_be
    }
* {sl_goi_y_phat} [🎤 "Mình có anh {idol_het_thoi} mà sếp. Bài 'Công Viên' remix là cả nước hát theo."]
    giam_doc: *(rơm rớm)* Năm 2015… anh phát hiện thằng bé ở quán cà phê… Em nói đúng. Đúng quá.
    ~ qh("idol_het_thoi", 20)
    ~ qh("giam_doc", 8)
    ~ sl_that_long()
    _Ngày mai, khi nghe kể lại, {idol_het_thoi} sẽ nhìn bạn khác đi._
* {not sl_goi_y_phat} [🎤 "Mình có anh {idol_het_thoi} mà sếp."]
    giam_doc: {idol_het_thoi} à? *(cười buồn)* {idol_het_thoi} giờ hát đám cưới thôi em ạ.
    ~ qh("idol_het_thoi", 5)
* [😶 Gắp con mực bỏ vào chén sếp: "Sếp ăn đi, mai tính."]
    giam_doc: Ừ… mai tính. *(quay sang bàn bên)* Các em! Anh tăng lương cả công ty!
    _Sếp tự hứa với bàn bên cạnh. Không phải lỗi của bạn. Lần này._
* [⏱️ (Không chọn kịp)]
    ~ sl_hua_ca_si = true
    ~ sl_phet(20)
    _Bạn còn đang nhai mực thì {giam_doc} đã tự nói: "{sales} hứa mời ca sĩ nổi tiếng nhất nước nhé!". Bạn gật đầu vì miệng đầy mực. Có người quay._
- -> END

// ------------------------------------------------------------
=== sales_1710_lua_trai ===
# ngay:17 # gio:21:30 # noi:vung_tau_bai_bien # bat_buoc
_Lửa trại. Trò "nói thật". Chai nước suối dừng trước mặt {designer}._
hr: Câu hỏi cho {designer}: "Bạn từng làm gì sau lưng công ty?"
_{designer} quay sang nhìn bạn. Balo laptop thứ hai nằm ngay sau lưng chị ấy._ # hen_gio:6
* [💁 Đứng bật dậy: "Để chị trả lời giùm! Tháng 3, chị với {designer} lén mượn xe công ty đi Đà Lạt, hết xăng giữa đèo!"]
    ~ sl_phet(5)
    ~ qh("designer", 10)
    _Không có chuyện đó. Cả đoàn tin sái cổ. {chi_dai} cười chảy nước mắt. {designer} nắm tay bạn dưới bóng tối._
* [😶 Im lặng, để {designer} tự trả lời.]
    designer: Em từng… làm thêm buổi tối. Thiết kế. Cho người ngoài.
    hr: Ồ. Ai cũng phải sống mà.
    ~ qh("designer", -2)
* [⏱️ (Không chọn kịp)]
    hong_hot: Im lặng là đồng ý nha! Có chuyện!
    ~ qh("designer", -5)
- _Chai nước quay tiếp. Dừng trước mặt {sieu_nhan_hong}._
sieu_nhan_hong: Hồi nhỏ… em từng nhốt một đứa nhỏ trong kho. Nó khóc cả buổi. Em không nhớ tên nó. Em vẫn nhớ tiếng khóc.
_Cả vòng im bặt. {ran_doc} đứng phắt dậy, đi thẳng ra biển._
_Rồi chai nước quay một vòng cuối. Dừng trước mặt bạn._
hong_hot: Câu cho {sales}! "Nhà tài trợ BTT Global có thật không?"
_Ánh lửa. Tiếng sóng. 30 cặp mắt._ # hen_gio:5
* [🗣️ "Có chứ! Mai chủ tịch Kevin Trộn gọi điện chúc mừng cả đoàn!"]
    ~ sl_phet(10)
    hong_hot: Ối dồi ôi! Nhớ bật loa ngoài nha!
* [🤝 "…Chưa có. Nhưng em đang làm cho nó có."]
    ~ sl_that_long()
    ~ sl_that_long()
    _Im lặng. Rồi {chi_dai} vỗ tay. Một mình. Rồi {ke_toan} vỗ theo. Rồi cả vòng vỗ tay, không ai biết vì sao._
    ~ qh("chi_dai", 10)
    ~ qh("ke_toan", 10)
    ~ qh("hong_hot", -3)
* [🧂 "Câu này thuộc phạm vi bảo mật thương mại, chị xin phép uống phạt."]
    ~ uong(10)
    ~ sl_phet(3)
    _Bạn uống phạt một ly bia. Rồi thêm một ly nữa vì không ai cản._
* [⏱️ (Không chọn kịp)]
    hong_hot: Hông trả lời là có chuyện! Có chuyện thiệt rồi!
    ~ sl_phet(8)
- { sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
_Cuối đêm, {idol_het_thoi} ngủ gục lên vai {quan_ly_idol}. {editor} đắp chăn cho cả hai rồi ngồi một mình nhìn sóng._
-> END

// ------------------------------------------------------------
=== sales_1810_tinh_ruou ===
# ngay:18 # gio:08:00 # noi:vung_tau_nha_nghi # bat_buoc
_8 giờ sáng. Đầu bạn như có ai đánh trống. Điện thoại: 87 tin nhắn trong group công ty._
{ sl_hua_ca_si:
    _Clip: bạn, má đỏ, giơ ly: "Tin chị đi, ca sĩ nổi tiếng nhất nước, chị gọi một cuộc là tới!". {giam_doc} đập bàn: "Thế anh tăng lương cả công ty!". 400 lượt xem._
    _Bình luận đầu tiên của {hong_hot}: "Lưu clip làm bằng chứng nha mọi người 📌"._
- else:
    _Clip: {giam_doc}, má đỏ, đập bàn hứa tăng lương cả công ty. Bạn ở góc khung hình, đang gắp mực. Ít ra không phải bạn._
}
_Cả nhà nghỉ ai cũng giận ai. Riêng bạn giận chính mình._
* [😶 Ngồi ở ban công, nhìn biển, uống nước suối.]
    ~ uong(30)
    ~ cang_thang(-5)
    _Biển không cần ai hứa gì với nó._
* {sl_hua_ca_si} [🤝 Nhắn vào group: "Mọi người ơi, tối qua chị say. Lời hứa ca sĩ… em xin rút."]
    ~ sl_that_long()
    ~ sl_phet(-15)
    ~ sl_hua_ca_si = false
    giam_doc: *(trả lời trong group)* Thế anh cũng rút lời hứa tăng lương nhé.
    _Cả group: "😡😡😡". Bạn bị ghét gấp đôi. Nhưng bong bóng nhẹ đi một chút._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
* {sl_hua_ca_si} [🗣️ Nhắn vào group: "Chị nói là làm! Đang đàm phán!"]
    ~ sl_phet(5)
    _37 cái thả tim. 1 cái mặt cười của {ke_toan}. Bạn biết cái mặt cười đó không phải đang cười._
- -> END

// ------------------------------------------------------------
=== sales_1810_coin_sap ===
# ngay:18 # gio:15:30 # noi:xe_khach
_Trên xe về. {dan_dau_tu} ngồi hàng cuối, mặt xám như nền xi măng. Hồng Coin về 0. Người tạo ôm tiền biến mất._
dan_dau_tu: Đáy… đáy thật rồi. Lần này là đáy thật.
{ sl_no_chuong <= 0:
    _Bạn nhìn số dư của mình: 5 triệu nợ đã về đủ từ hôm qua. Bạn là người duy nhất trên xe vừa thắng {dan_dau_tu}. Bạn không thấy vui như tưởng._
}
* [🤝 Đưa {dan_dau_tu} chai nước suối, ngồi xuống cạnh.]
    dan_dau_tu: *(nhận chai nước)* {sales}… anh xin lỗi. Nợ em, anh sẽ trả. Không phải bằng coin.
    ~ qh("dan_dau_tu", 10)
    ~ sl_that_long()
* [📈 "Anh {dan_dau_tu}, đáy này có mấy tầng nữa anh?"]
    dan_dau_tu: *(cười khổ)* Em hỏi câu này đau hơn cả biểu đồ.
    ~ qh("dan_dau_tu", -3)
* [💁 "Tin chị đi, mai nó lên lại."]
    dan_dau_tu: *(mắt sáng lên)* Thật không em?
    _Bạn nhìn mắt ông. Bạn thấy chính mình trong đó. Và bạn ghét điều đó._
    ~ sl_phet(5)
- -> END

// ------------------------------------------------------------
=== sales_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_sang_tao
_Thứ 2. Họp giao ban. Không ai nhìn mặt ai. {giam_doc} giả vờ không biết có clip hứa tăng lương._
giam_doc: Ngày mai sinh nhật công ty 16 tuổi. {chi_dai} lo tiệc. {designer} lo logo. Còn {sales}… em lo cho có nhà tài trợ đến chúc mừng nhé.
{ sl_hua_ca_si:
    chi_dai: *(khoanh tay)* Còn ca sĩ nổi tiếng nhất nước thì sao em?
    _Cả phòng quay sang. Bạn cảm thấy bong bóng phình thêm trong ngực._
    ~ cang_thang(10)
}
* [🗣️ "Dạ mai sẽ có bất ngờ từ BTT Global!"]
    ~ sl_phet(5)
    _Bạn chưa biết bất ngờ là gì. Bạn chỉ biết mình vừa hứa thêm một điều nữa._
* [🤝 "Dạ, em sẽ mời Quán Ốc Đêm với Tiệm Nail Lung Linh tới chúc. Họ là nhà tài trợ thật."]
    ~ sl_that_long()
    giam_doc: Quán ốc với tiệm nail… *(thở dài)* Ừ, có còn hơn không.
    ~ qh("ke_toan", 3)
* [📞 Điện Thoại Giả.]
    ~ sl_phet(3)
    _Lần này điện thoại không reo. Bạn ra hành lang đứng 10 phút, nói chuyện với không khí._
- -> END

// ------------------------------------------------------------
=== sales_2010_hoa_kevin_tron ===
# ngay:20 # gio:09:00 # noi:ban_sales # bat_buoc
_Ngày Phụ nữ Việt Nam. Anh shipper Tèo khệ nệ ôm vào một bó hoa hồng khổng lồ. {cho} sủa đuổi theo tới tận cầu thang._
_Bạn biết bó hoa đó. Bạn đặt nó tối qua. 900 nghìn. Tiền tạm ứng._
* [🗣️ Để nguyên tấm thiệp: "Thân tặng chị {sales}, Mr. Kevin Trộn, BTT Global".]
    ~ sl_hoa_btt = true
    ~ sl_phet(10)
    ~ sl_ung(900000)
    ~ tien_cong(-900000)
    hong_hot: Trời ơi! Chủ tịch tặng hoa! Đẳng cấp tập đoàn!
    _Cả phòng trầm trồ. {chi_dai} cầm tấm thiệp lên, nhìn. Rồi nhìn bạn. Không nói gì._
    _Cái im lặng đó nặng hơn cả bó hoa._
    ~ qh("chi_dai", -5)
    { sl_bong_bong >= 100:
        -> sales_tudo_bong_bong_be
    }
* [😇 Rút tấm thiệp ra trước khi ai thấy, viết lại: "Tự thưởng cho mình. H."]
    ~ sl_that_long()
    ~ tien_cong(-900000)
    chi_dai: *(nhìn thiệp)* Tự tặng mình hả? *(cười)* Chị thích. Phụ nữ phải biết thương mình.
    ~ qh("chi_dai", 8)
* [🤝 Tháo bó hoa ra, chia cho từng chị em trong công ty mỗi người một bông.]
    ~ tien_cong(-900000)
    ~ qh("ke_toan", 5)
    ~ qh("hong_hot", 5)
    ~ qh("designer", 5)
    ~ qh("chi_dai", 5)
    _Bảy bông hồng, bảy cái bàn. {ke_toan} cắm bông của mình vào ly nước, đặt cạnh máy tính. Lần đầu bàn kế toán có hoa._
- -> END

// ------------------------------------------------------------
=== sales_2010_sinh_nhat_cong_ty ===
# ngay:20 # gio:15:00 # noi:sanh_tang_tret
_Sinh nhật {cong_ty} 16 tuổi. Bánh kem cam. Bác {bac_bao_ve} cầm một phong thư, tay hơi run._
bac_bao_ve: Sáng nay có thư. Ký tên "G". Gửi cả công ty.
_Kèm theo là một phong bì dán kín, đề: "Chỉ mở khi công ty sắp sập". {giam_doc} tái mặt._
bac_bao_ve: Bác… chưa biết có nên đọc không. Bác chỉ là người giữ thư.
* [😇 "Bác đọc đi bác. Tụi con muốn nghe."]
    ~ qh("bac_bao_ve", 5)
    _Bác đọc chậm. Đúng lúc đó {cho} sủa ầm ĩ vì anh shipper Tèo. Bạn chỉ nghe rõ mấy chữ "mười sáu năm". Nhưng bạn thấy {giam_doc} quay đi lau mắt._
* [😶 Im lặng. Việc của bác.]
    bac_bao_ve: *(gấp thư)* Thôi. Bác giữ. Mọi người ăn bánh đi.
    _{giam_doc} thở phào rất to._
* [💁 "Bác ơi, tin con đi, công ty mình còn lâu mới sập."]
    bac_bao_ve: *(nhìn bạn, gật nhẹ)* Ừ. Thế thì cái phong bì này còn nằm lâu.
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    ~ qh("bac_bao_ve", 3)
- ~ an(20)
~ nhan(banh_kem)
-> END

// ------------------------------------------------------------
=== sales_2010_karaoke ===
# ngay:20 # gio:21:30 # noi:karaoke
_Karaoke Hát Cho Nhau Nghe. {giam_doc} cầm micro, mặt đỏ như logo bản 7 màu._
giam_doc: Các em! Siêu Nhân Hồng thành công, anh tăng lương 20%! Anh hứa!
_Lần này có 6 cái điện thoại quay. Bạn nhìn {idol_het_thoi} đang ngồi góc phòng, ôm micro, chưa ai mời hát._
* {sl_goi_y_phat} [🎤 Ngồi xuống cạnh {idol_het_thoi}: "Anh ơi. Đêm Hồng. 'Công Viên' bản remix. Anh hát nha."]
    idol_het_thoi: *(gỡ kính đen)* Em… mời anh thật hả? Không phải đám cưới?
    sales: Thật. Không phải phét. Lần này em nói thật.
    { qh_idol_het_thoi >= 15:
        idol_het_thoi: *(im lâu, rồi gật)* Anh hát. Anh hát cho cả nước nghe lại một lần.
        ~ sl_phat_nhan_loi = true
        ~ qh("idol_het_thoi", 10)
        ~ sl_that_long()
    - else:
        idol_het_thoi: Để anh nghĩ. Hồi anh còn nổi, anh đâu có phải nghĩ.
        ~ qh("idol_het_thoi", 5)
    }
* [🎤 Giành micro hát "Công Viên".]
    ~ cang_thang(-15)
    idol_het_thoi: Em hát sai lời rồi! *(giành lại micro, hát đúng, cả phòng hát theo)*
    ~ qh("idol_het_thoi", 5)
* [📞 Ra hành lang gọi điện chào hàng cho mấy tiệm karaoke.]
    -> sales_mg_goi_dien_mo_dau
- -> END
