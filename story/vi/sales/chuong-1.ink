// ============================================================
// SALES · CHƯƠNG 1: "CHỊ MANG SIÊU SAO VỀ" (1/10 – 7/10)
// ============================================================

// ------------------------------------------------------------
=== sales_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2. Bạn đứng sát cửa, giày cao gót 9 phân, điện thoại áp tai dù không ai gọi. Thói quen nghề nghiệp._
giam_doc: Các em! Hôm nay là ngày lịch sử của {cong_ty}! Xin giới thiệu đối tác chiến lược: Siêu Nhân Hồng!
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
_{ke_toan} cúi xuống thì thầm gì đó với {giam_doc}. Bạn chỉ nghe được hai chữ: "trang 47"._
giam_doc: Thôi em, đối tác đang chờ. Anh không ép, tùy em… mà thôi ký luôn.
_Ký. 5 tỷ về tài khoản. Cả phòng reo hò. Bạn vỗ tay to nhất, như thể chính bạn vừa chốt deal._
* [📞 Giả vờ nghe điện thoại: "Dạ, bên em vừa ký 5 tỷ, anh chờ em gọi lại nha!"]
    ~ sl_phet(3)
    _Mấy người đứng gần quay sang nhìn bạn đầy nể phục. Không ai biết đầu dây bên kia là… không ai._
    ~ danh_tieng = danh_tieng + 3
* [🤝 Tới bắt tay {sieu_nhan_hong}: "Dạ em là {sales}, phòng Kinh doanh. Có gì cần anh cứ gọi em."]
    sieu_nhan_hong: Chào em! Em nhỏ tuổi mà nhìn khí thế ghê! Như sếp lớn!
    ~ qh("sieu_nhan_hong", 8)
* [💬 Lại gần {ke_toan}: "Chị {ke_toan}, trang 47 là gì vậy chị?"]
    ke_toan: *(nhìn bạn, gấp sổ lại)* Chuyện người lớn. Em lo phần doanh thu đi.
    _"Chuyện người lớn." Bạn 26 tuổi. Bạn không thích chữ đó chút nào._
    ~ qh("ke_toan", -2)
- -> END

// ------------------------------------------------------------
=== sales_0110_an_mung ===
# ngay:1 # gio:15:00 # noi:pantry # bat_buoc
_Trà sữa ăn mừng. Máy pha cà phê hỏng đúng Ngày Cà phê Quốc tế. Cả công ty mừng Bác {bac_bao_ve} ngày Người cao tuổi, bác ngại đỏ cả tai._
hong_hot: Mà nói thiệt, sao Siêu Nhân Hồng biết công ty mình mà tới vậy ta?
_Cả pantry quay sang nhìn. Một khoảng trống. Bạn chưa bao giờ để khoảng trống nào trống quá 2 giây._
* [🗣️ "Chị gặp ảnh ở Sống Ảo, chị dụ ảnh về đó. Tin chị đi!"]
    ~ sl_phet(5)
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    _{sieu_nhan_hong} đứng ngay đó, mở miệng định cãi, rồi lịch sự ngậm lại._
    sieu_nhan_hong: Ờm… dạ… chị {sales} dụ… cũng dễ thương.
    hong_hot: Ối dồi ôi! Đăng group liền!
    ~ qh("hong_hot", 5)
    _Tin "{sales} dụ được Siêu Nhân Hồng về" lan khắp 3 tầng trong 4 phút. Bạn cười. Bong bóng đã thổi._
* [😇 "Ảnh tự tới đó. Mà tới đúng chỗ."]
    ~ sl_that_long()
    sieu_nhan_hong: Đúng rồi! Em tự tới! Cảm ơn chị đã nói đúng!
    ~ qh("sieu_nhan_hong", 10)
    hong_hot: Nhạt ghê. Tưởng có drama.
    _Một khoảnh khắc nói thật hiếm hoi. Không ai vỗ tay. Nhưng {sieu_nhan_hong} nhìn bạn rất lâu._
* [🧂 "Tại ảnh nghe danh phòng Kinh doanh mình á. Chị quen nhiều lắm."]
    ~ sl_phet(3)
    ~ sl_giay(10)
    giam_doc: Đúng rồi! Phòng Kinh doanh của mình mạnh lắm!
    _{ke_toan} nhướng mày, ghi gì đó vào sổ._
- _{designer} đứng cạnh, đá nhẹ chân bạn. Mật mã của hai đứa: "Liệu hồn."_
~ nhan(tra_sua)
~ uong(30)
-> END

// ------------------------------------------------------------
=== sales_0110_toi_sky_ao ===
# ngay:1 # gio:21:00 # noi:can_1203
_Căn 1203 chung cư Sky Ảo. Ghế sofa nhung, đèn chùm, view thành phố. Tủ lạnh: một chai tương ớt và một quả trứng không rõ ngày._
_Khách hàng hay hỏi bạn ở đâu. Bạn trả lời "Sky Ảo" bằng giọng của người có tủ lạnh đầy._
* [📸 Chụp story "bữa tối sang chảnh" bằng gói mì, hai cọng hành và ánh nến.]
    -> sales_mg_song_ao_mo_dau
* [🍜 Nấu mì, ăn thật, không chụp gì.]
    ~ an(30)
    ~ cang_thang(-5)
    _Mì không chụp thì ăn ngon hơn. Bạn phát hiện ra điều đó lúc 21 giờ 14 phút._
* [📞 Lướt danh bạ, gọi thử một quán ốc chào hàng.]
    -> sales_mg_goi_dien_mo_dau
- -> END

// ------------------------------------------------------------
=== sales_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Nụ cười Thế giới. 9 giờ 30, phòng họp tầng 2. {hr} bắt mọi người cười khi chấm công. Bạn cười như đang chụp ảnh thẻ cho visa._
truong_phong: Chiến dịch "Hồng Hóa Việt Nam". Mục tiêu 1 triệu người theo dõi trước 31/10. Mình cần ngân sách cho Đại Nhạc Hội.
_Giữa buổi, {thuc_tap_sinh} rụt rè kể ý tưởng phim về một người bỏ nghề ngân hàng. {bien_kich} ghi chép chăm chú._
ke_toan: Ngân sách hiện tại không đủ dựng sân khấu lớn. Cần tài trợ.
_Cả phòng im lặng. Bạn cảm thấy chân mình tự đứng dậy, như có ai giật dây._ # hen_gio:6
* [🗣️ "Tin chị đi! Tập đoàn Bánh Tráng Trộn Toàn Cầu, BTT Global. Chủ tịch Mr. Kevin Trộn. Ba gói, tổng 2 tỷ, trước Đại Nhạc Hội!"]
    ~ sl_phet(10)
    ~ sl_giay(50)
    ~ sl_btt_dat_ten = true
    ~ phat_hien(btt_global_gia)
    giam_doc: Tập đoàn à? Tuyệt vời! Mọi người vỗ tay cho {sales}!
    _{ke_toan} lặng lẽ ghi vào sổ: "2 tỷ. BTT Global. {sales}. Chưa có hóa đơn."_
    _Bạn ngồi xuống. Tim đập như trống. Cái tên đó bạn nghĩ ra đúng lúc nhìn thấy bịch bánh tráng trộn trên bàn {hong_hot}. Bạn chưa có nhà tài trợ nào cả._
* [🤝 "Dạ em sẽ đi chào từng quán trong quận. Nhỏ thôi, nhưng thật."]
    ~ sl_that_long()
    giam_doc: Nhỏ thôi à? Hơi… khiêm tốn nhỉ. Anh thích cái gì đó wow hơn.
    ~ qh("ke_toan", 8)
    ~ qh("giam_doc", -3)
    _{ke_toan} nhìn bạn, gật đầu rất nhẹ. Lần đầu tiên._
* [⏱️ (Không chọn kịp)]
    _Bạn vừa mở miệng thì {con_ong_chau_cha} đã nói "Để anh gọi chú anh". Không ai để ý chú anh chính là giám đốc đang ngồi đây._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== sales_0210_dem_1203 ===
# ngay:2 # gio:23:40 # noi:can_1203 # bat_buoc
_23 giờ 40. Bạn mở tủ lạnh. Trống. Bạn đóng lại. Mở ra lần nữa, như thể đồ ăn tự mọc._
{ sl_btt_dat_ten:
    _2 tỷ. BTT Global. Bạn đã nói cả hai. Trước mặt sếp, trước mặt {ke_toan}, trước cả cái sổ của {ke_toan}._
    sales: Chị {designer} ơi, em lỡ có một tập đoàn rồi. Giờ nó cần một bộ hồ sơ.
- else:
    _Bạn không hứa 2 tỷ. Nhưng {giam_doc} vẫn nhắn: "Em ơi, có đối tác nào to không, anh cần cho slide gửi nhà đầu tư."_
    sales: Chị {designer} ơi, tụi mình cần một tập đoàn.
}
designer: *(trả lời sau 30 giây)* Em nói lại coi? Một… tập đoàn?
* [🗣️ "Tập đoàn Bánh Tráng Trộn Toàn Cầu. Chủ tịch Mr. Kevin Trộn. Chị làm giùm em logo với cái hồ sơ."]
    ~ sl_phet(10)
    ~ sl_btt_dat_ten = true
    ~ phat_hien(btt_global_gia)
    designer: …{sales}. Cái tập đoàn đó có thật hông em?
    sales: Có chứ! …Sắp có.
    designer: *(gửi sticker thở dài)* Cho chị 2 tiếng. Logo tông vàng bánh tráng. Slogan "Trộn Là Dính".
    ~ qh("designer", 5)
    _1 giờ sáng. Tập đoàn Bánh Tráng Trộn Toàn Cầu, BTT Global, chính thức ra đời trên màn hình laptop của {designer}: logo xoắn ốc vàng, trụ sở 40 tầng ghép ảnh, chữ ký chủ tịch bay bổng._
    sales: Chị {designer}, mai em bao ốc! Quán Ốc Đêm, gọi gì gọi!
    designer: Em nhớ đó. Mà khum được giống logo của ai có thật nha.
* [🤝 "Chị {designer}, em lỡ nói rồi. Em không biết làm sao."]
    ~ sl_that_long()
    designer: Vậy mai mình đi chào hàng thật. Chị vẽ hồ sơ thật cho em. Đừng bịa nữa nha.
    ~ qh("designer", 10)
    _Bạn nằm xuống sofa nhung, nhìn trần nhà. Lần đầu tiên trong tháng, bạn ngủ trước 1 giờ sáng._
    ~ nghi(10)
* [😶 Thôi, ngủ. Mai tính.]
    _Bạn ngủ lúc 3 giờ, sau khi lướt 400 video Tóp-tóp về "cách nói chuyện với nhà đầu tư"._
    ~ nghi(-10)
- -> END

// ------------------------------------------------------------
=== sales_0410_ngay_dong_vat ===
# ngay:4 # gio:09:30 # noi:cong_cong_ty
_Chủ nhật, Ngày Động vật Thế giới. Bạn ghé công ty lấy xấp danh thiếp quên. {cho} đang được {chi_dai} tắm, mặc áo hồng, đội nơ._
cho: Grừ…
_Một chiếc xe hồng đỗ trước cổng. {sieu_nhan_hong} bước ra, giả tiếng sủa. {cho} lao ra, ngoạm phăng chiếc găng tay hồng._
sieu_nhan_hong: Ối! Găng tay em!
_Một ý tưởng lóe lên. Ngay đầu phố có tiệm thú cưng mới mở. Họ cần quảng cáo. Còn bạn cần… bất kỳ ai trả tiền._
* [💁 Chạy qua tiệm thú cưng: "Tin chị đi, chó công ty tụi em đang viral. Anh tài trợ một bịch xúc xích, tụi em quay clip."]
    _Chủ tiệm nhìn bạn, nhìn {cho} đang ngoạm găng tay, nhìn {sieu_nhan_hong} đang đuổi theo. Rồi gật đầu._
    ~ nhan(xuc_xich)
    ~ sl_that(1)
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    ~ follow(3000)
    _Deal thật đầu tiên của tháng: một bịch xúc xích. Trị giá 1 triệu "theo bảng giá quảng cáo". Bạn tự định giá._
* [🦴 Lấy xúc xích dụ {cho} trả găng tay cho {sieu_nhan_hong}.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        _{cho} nhả găng, ngoạm xúc xích, rồi ngoạm lại găng, chạy mất. Một con chó có nguyên tắc._
    - else:
        _Bạn không có xúc xích. {cho} nhìn bạn khinh bỉ rồi chạy mất cùng chiếc găng._
    }
    ~ qh("sieu_nhan_hong", 5)
* [😶 Đứng xem. Lấy danh thiếp rồi đi.]
    chi_dai: Ủa {sales}, chủ nhật cũng đi làm hả em? Siêng ghê.
    sales: Dạ, sales thì không có chủ nhật chị.
    ~ qh("chi_dai", 3)
- -> END

// ------------------------------------------------------------
=== sales_0510_tam_ung_50_trieu ===
# ngay:5 # gio:10:00 # noi:phong_ke_toan # bat_buoc
_Phòng kế toán. Bạn đặt lên bàn {ke_toan} một tờ giấy ăn, ghi bằng bút kẻ mắt: "Tạm ứng 50tr – {sales}"._
ke_toan: Cái gì đây em?
sales: Dạ, đề nghị tạm ứng. Để chốt nhà tài trợ lớn nhất năm.
ke_toan: Hóa đơn đâu em? Hợp đồng đâu em?
~ sl_hoi_hoa_don = sl_hoi_hoa_don + 2
{ sl_btt_dat_ten:
    ke_toan: À, số điện thoại "văn phòng BTT Global" em ghi trên slide. Hôm qua chị gọi thử. Tiệm Nail Lung Linh bắt máy, hỏi chị muốn sơn màu gì.
    _{ke_toan} không nói thêm. Chị chỉ gạch một dòng trong sổ, rồi nhìn bạn. Từ hôm nay, chị nắm đuôi bạn._
}
* [💁 "Tin chị đi! Mai chị đưa hợp đồng!"]
    ke_toan: Em nhỏ hơn chị bốn tuổi đó {sales}.
    _{ke_toan} trả lại tờ giấy ăn, kèm một câu: "Em lau miệng đi, son lem kìa."_
    ~ qh("ke_toan", -5)
    ~ cang_thang(5)
* [🧾 "Dạ… thôi 5 triệu thôi chị. Đi tiếp khách quán ốc."]
    -> sales_mg_tam_ung_mo_dau
* [🤝 "Dạ… thật ra em chưa có nhà tài trợ nào. Em cần tiền để đi chào hàng."]
    ~ sl_that_long()
    ke_toan: *(đặt bút xuống, nhìn bạn lâu)* Đi chào hàng thì cần xăng, cần danh thiếp. Không cần 50 triệu.
    ke_toan: 300 nghìn. Có hóa đơn xăng thì về đây chị duyệt tiếp.
    ~ sl_ung(300000)
    ~ qh("ke_toan", 10)
- -> END

// ------------------------------------------------------------
=== sales_0510_chuong_ban_huyen ===
# ngay:5 # gio:14:00 # noi:ban_sales
_{dan_dau_tu} xuất hiện ở bàn bạn với nụ cười "lần này là lên thật". Áo sơ mi hơi nhàu, tay cầm điện thoại mở chart._
dan_dau_tu: {sales} ơi, anh biết em định nói gì. Nhưng nghe anh nè: con coin này đang ở đáy, đáy thật rồi. Tuần sau anh trả em gấp đôi.
* [📈 "Anh {dan_dau_tu}, tháng 6 anh cũng nói đáy. Tháng này là đáy của đáy hả?"]
    dan_dau_tu: Đáy có nhiều tầng em ạ. *(chuyển khoản 200 nghìn)* Cho có. Tượng trưng.
    ~ sl_chuong_tra(200000)
* [💁 "Tin chị đi, anh trả em hôm nay thì mai anh giàu, vì vũ trụ thưởng người sòng phẳng."]
    dan_dau_tu: *(mắt sáng lên)* Vũ trụ… thưởng người sòng phẳng… Hay! *(chuyển 1 triệu)*
    ~ sl_chuong_tra(1000000)
    ~ sl_phet(5)
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    _Bạn không tin vũ trụ. Nhưng 1 triệu thì có thật._
* [🗂️ "Thôi, anh trả nợ bằng việc khác. Thứ 6 này anh đừng soi báo cáo của em."]
    ~ sl_chuong_lam_ngo = true
    dan_dau_tu: Deal. Anh mù một bên mắt tới hết tháng.
    _Nợ giữ nguyên. Nhưng báo cáo thứ 6 của bạn giờ an toàn hơn._
- _Trên cửa gác lửng Hẻm 69 của {dan_dau_tu}, theo lời {hong_hot}, đã có 6 tờ giấy nhắc nợ của bạn. Bạn định dán thêm tờ thứ 7._
-> END

// ------------------------------------------------------------
=== sales_0510_duy_tang_hoa ===
# ngay:5 # gio:16:30 # noi:ban_sales
_Ngày Nhà giáo Thế giới. {thuc_tap_sinh} đi từng bàn tặng hoa cho các "thầy cô". Tới bàn bạn._
thuc_tap_sinh: Dạ em tặng chị {sales} ạ! Chị dạy em cách nói chuyện tự tin ạ!
_{thuc_tap_sinh} 30 tuổi. Bạn 26. Anh ấy cúi đầu "dạ chị" như học sinh lớp 3._
* [💁 "Tin chị đi, em có tương lai."]
    thuc_tap_sinh: Dạ! Em tin chị ạ!
    ~ qh("thuc_tap_sinh", 8)
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    _Cả phòng nín cười. Bạn nhận ra mình vừa gọi một người lớn hơn 4 tuổi là "em". Bạn quyết định không sửa._
* [😇 "Anh {thuc_tap_sinh} ơi, anh lớn hơn em mà. Em cảm ơn anh."]
    thuc_tap_sinh: Dạ học thì không phân biệt tuổi ạ!
    ~ qh("thuc_tap_sinh", 10)
- ~ nhan(hoa_hong)
-> END

// ------------------------------------------------------------
=== sales_0610_buoi_chup ===
# ngay:6 # gio:10:30 # noi:studio
_Buổi chụp poster đầu tiên. Bạn đã hứa với chị chủ Tiệm Nail & Tóc Lung Linh: "Siêu Nhân Hồng sẽ giơ bàn tay làm nail của tiệm trong một tấm poster"._
_Đang chụp tới kiểu thứ 6, {sieu_nhan_hong} nhìn ra cửa sổ._
sieu_nhan_hong: Có xe chè của bà cụ sụp ổ gà ngoài Đường Hóng kìa! Điều khoản số 3! Em đi chút rồi về!
_Và ảnh đi thật. Chị chủ tiệm nail gọi tới: "Ủa em, nail của chị đâu?"_
* [📞 Điện Thoại Giả: "Alo chủ tịch hả? Dạ em qua liền!" rồi cúp máy chị nail.]
    ~ sl_phet(5)
    _Chị chủ nail gọi lại 4 lần. Bạn để im lặng. Lần thứ 5, bạn bắt máy, nói "Bên em đang xử lý."_
    ~ cang_thang(5)
* [🏃 Chạy theo {sieu_nhan_hong}, mang theo bộ móng giả của tiệm.]
    _Đường Hóng, gần đầu Hẻm 69. {sieu_nhan_hong} đẩy xe chè của Bà Bảy ra khỏi ổ gà, rồi được bà mời một ly chè, ăn bằng ống hút luồn qua mũ. Xe chè dừng ngay trước cửa Tiệm Nail Lung Linh._
    _Bạn chớp thời cơ, nhờ bà cụ cầm hộ bộ móng giả. Bà cụ cười, giơ lên. Ai đó quay clip._
    ~ sl_that(2)
    ~ follow(5000)
    ~ qh("sieu_nhan_hong", 5)
    _Tối đó, clip đẩy xe chè lên xu hướng. Góc phải khung hình: bảng hiệu Tiệm Nail Lung Linh. Chị chủ tiệm gửi bạn 6 trái tim._
* [🤝 Gọi lại chị nail, nói thật: "Chị ơi, ảnh đi giúp người, em xin dời qua tuần sau."]
    ~ sl_that_long()
    _Chị nail im lặng một lúc. "Đi giúp người hả? …Ừ, vậy thì chị đợi. Chị thích người tử tế."_
    ~ sl_co_voucher_nail = true
    _Chị còn tặng bạn một voucher làm nail "vì em thật thà". Bạn nhìn voucher như nhìn sinh vật lạ._
- -> END

// ------------------------------------------------------------
=== sales_0710_quan_oc_dem ===
# ngay:7 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_Mốc 1: 50.000 người theo dõi. Hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 50000:
    _Chưa đạt. {giam_doc} họp "truyền lửa" 3 tiếng. Bạn trốn ra bằng cớ "đi gặp đối tác". Lần này là thật._
    ~ nghi(-10)
}
_Quán Ốc Đêm. Chủ quán là một ông chú bụng to, tạp dề dính mỡ hành, đang nướng sò._
chu_quan_oc: Gói tài trợ gì? Logo quán chú trên áo siêu nhân hả? Bao nhiêu tiền?
* [🤝 "Dạ chú trả bằng ốc cũng được. Đổi lại ảnh tới ăn thử trước máy quay."]
    chu_quan_oc: Bằng ốc? *(cười ha hả)* Chịu! 10 dĩa ốc, cho ai ăn cũng được!
    ~ sl_quan_oc_deal = true
    ~ sl_so_dia_oc = sl_so_dia_oc + 10
    ~ sl_so_voucher_oc = sl_so_voucher_oc + 10
    ~ sl_that(3)
    ~ follow(5000)
    _Deal thật đầu tiên có chữ ký. Trên tờ giấy ghi: "10 dĩa ốc, đã trả bằng quảng cáo". Bạn sẽ giữ tờ này cả đời._
* [🗣️ "Tin chị đi chú, quán chú sẽ lên báo. 50 triệu thôi, rẻ như cho."]
    chu_quan_oc: 50 triệu? Chú bán ốc 30 năm chưa thấy tờ 50 triệu nằm chung một chỗ.
    ~ sl_phet(5)
    _Chú quay lại nướng sò. Cuộc nói chuyện kết thúc ở đó._
* [🍻 Ngồi xuống, rủ chú làm vài lon.]
    -> sales_mg_quan_oc_mo_dau
- -> END
