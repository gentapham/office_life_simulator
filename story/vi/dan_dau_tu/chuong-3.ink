// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · CHƯƠNG 3: "MẤT ĐIỆN, MẤT CHART" (15/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== dan_dau_tu_1510_khong_chart ===
# ngay:15 # gio:08:10 # noi:ban_so_lieu # bat_buoc
_8 giờ 05. Mất điện cả tòa nhà. 8 giờ 10, bạn tới bàn. Hai màn hình đen thui. Điện thoại 4%. Wifi chết._
_Lần đầu tiên sau 3 năm, bạn không biết giá coin đang là bao nhiêu._
_Từ xa vọng lại tiếng {giam_doc} trong thang máy kẹt: "Có ai không? Anh đang có cuộc gọi với ngân hàng!" Rồi tiếng {chi_dai}: "Anh im giùm em năm phút."_
~ ddt_nt(-30)
* [😰 Chạy khắp tầng tìm ổ điện còn chạy để sạc điện thoại.]
    _Không có ổ nào chạy. Bạn đứng giữa văn phòng tối, tay cầm sợi cáp sạc như cầm sợi dây cứu sinh không nối vào đâu._
    ~ cang_thang(15)
* [😶 Ngồi xuống. Nhìn màn hình đen.]
    _Màn hình đen phản chiếu khuôn mặt bạn. Bạn nhận ra mình gầy đi. Và có tóc bạc._
    _Lạ là… bạn thấy nhẹ người một chút._
    ~ cang_thang(-10)
    ~ ddt_dc(3)
* [🤝 Đi giúp {chi_dai} kéo cửa thang máy.]
    _Bạn với {it} kéo cửa thang máy. {giam_doc} bò ra, áo vest nhàu. {chi_dai} ra sau, phủi tay._
    chi_dai: Cảm ơn {dan_dau_tu}. Lần đầu chị thấy anh chạy về phía có người mà không phải chạy trốn.
    ~ qh("chi_dai", 10)
    ~ qh("giam_doc", 5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1510_tra_da_bac_binh ===
# ngay:15 # gio:10:30 # noi:choi_bao_ve # bat_buoc
_Không điện, không việc. Bạn đi lang thang xuống cổng. Bác {bac_bao_ve} đang ngồi ở chòi, radio chạy pin, ấm trà đá đầy._
bac_bao_ve: *(rót trà, đẩy sang)* Uống đi. Hôm nay mất điện, cậu không có cái đồ thị kia để nhìn nhỉ.
* [😶 "Dạ… con cũng thấy nhẹ người, bác."]
    bac_bao_ve: Ừ. Người ta nhìn cái gì lâu quá thì nó nhìn lại mình. Cái đồ thị kia nhìn cậu ba năm rồi đấy.
    ~ ddt_nt(-15)
    ~ cang_thang(-20)
    ~ qh("bac_bao_ve", 10)
* [💸 "Bác ơi, tiền con mượn bác, con sẽ trả. Con hứa."]
    bac_bao_ve: Tiền bác cho mượn, bác không cần gấp đâu. Cậu đừng trốn bác là được.
    _Bạn không biết trả lời sao. Bạn uống hết ly trà, rồi rót thêm, chỉ để có việc cho hai bàn tay._
    ~ ddt_hua_binh = true
    ~ qh("bac_bao_ve", 15)
    ~ ddt_nt(-5)
* [📈 "Bác có muốn đầu tư hông? Con có một đồng này…"]
    bac_bao_ve: *(nhìn bạn rất lâu)* Thế à.
    _Hai chữ. Nặng như hai bao xi măng. {cho} ngẩng đầu khỏi ổ, gầm gừ._
    cho: Grừ…
    ~ qh("bac_bao_ve", -15)
    ~ qh("cho", -10)
    ~ ddt_noi_day()
- ~ uong(25)
-> END

// ------------------------------------------------------------
=== dan_dau_tu_1510_pantry_trang_47 ===
# ngay:15 # gio:14:00 # noi:pantry # bat_buoc
_Chiều. Cả công ty ra pantry ngồi, vì đó là chỗ duy nhất có cửa sổ to. {thuc_tap_sinh} bất ngờ lôi ra 5 cục sạc dự phòng, chia cho mọi người. Không ai hỏi một thực tập sinh lấy đâu ra 5 cục sạc xịn._
thuc_tap_sinh: Dạ anh {dan_dau_tu}, anh cầm một cục ạ! Sạc được 3 lần đó ạ!
_Cục sạc trong tay bạn. Điện thoại 4%. Chart chỉ cách bạn 30 giây sạc._
* [🔌 Sạc điện thoại, mở chart.]
    _4G chập chờn. Chart load được một nửa. Đỏ. Bạn nhìn cái nửa chart đỏ đó suốt một tiếng, trong khi cả pantry nói chuyện quanh bạn._
    ~ ddt_soi_chart()
    ~ ddt_nt(10)
    ~ qh("thuc_tap_sinh", 5)
* [🤝 Đưa lại cục sạc cho {quan_ly_idol}, người có hai điện thoại đều 1%.]
    quan_ly_idol: Cảm ơn ông. Ông cứu tui. Hôm nay mà mất liên lạc với {sieu_nhan_hong} là chết.
    ~ qh("quan_ly_idol", 10)
    ~ qh("thuc_tap_sinh", 5)
    ~ ddt_dc(2)
- _Ở góc tối của pantry, {ke_toan} nói nhỏ với {chi_dai}. Không có tiếng quạt máy, tiếng thì thầm nghe rõ mồn một._
ke_toan: …trang 47 đó bà. Không đạt một triệu là hoàn mười tỷ. Gấp đôi. Ảnh ký mà hông đọc.
chi_dai: Mười tỷ…
_Bạn nhẩm nhanh, theo thói quen: mười tỷ chia cho 22 người là 454 triệu một người._
_Rồi bạn nghĩ tới sổ nợ của mình: 22 triệu. Lần đầu tiên trong đời, nợ của bạn trông thật nhỏ bé._
~ phat_hien(trang_47)
* [😶 Giả vờ không nghe. Nhưng nhớ từng chữ.]
    ~ ddt_dc(3)
    ~ cang_thang(10)
* [💬 Tới gần, nói nhỏ: "Em nghe rồi. Em tính được đường đi tới một triệu."]
    ke_toan: *(giật mình)* Anh {dan_dau_tu}? Anh tính được thiệt hả? Không phải chart?
    dan_dau_tu: Không phải chart. Số liệu công ty.
    chi_dai: Vậy tính đi. Tính cho đúng. Lần này không được "lên thật", phải "đúng thật".
    ~ qh("ke_toan", 10)
    ~ qh("chi_dai", 10)
    ~ ddt_dc(5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1510_bieu_do_tay ===
# ngay:15 # gio:16:30 # noi:pantry # bat_buoc
_Trời bắt đầu tối. Không máy tính. Bạn lấy một xấp giấy in hỏng và cây bút bi, ngồi ở bàn pantry._
_Bạn bắt đầu vẽ lại biểu đồ lượt xem của chiến dịch, từ trí nhớ. Cột này là MV. Cột này là poster. Cột này là…_
{ ddt_thay_clip_ba_cu:
    _…cái cột bạn đã dán mẩu giấy ghi chú hôm 6/10: clip xe chè._
- else:
    _…một cái cột mà bạn chỉ nhớ mang máng là rất cao. Hôm 6/10 bạn mải nhìn chart nên không để ý kỹ._
}
_Bạn vẽ xong. Bạn nhìn tờ giấy. Rồi nhìn lại lần nữa._
_Clip {sieu_nhan_hong} đẩy xe chè cho Bà Bảy: gấp 12 lần MV chính thức. Clip buộc dây giày cho em nhỏ: gấp 5 lần. Mọi video {sieu_nhan_hong} đi giúp người thật: gấp nhiều lần mọi video {sieu_nhan_hong} diễn._
_Khán giả không thích {sieu_nhan_hong} khi diễn. Họ thích {sieu_nhan_hong} khi giúp người thật._
* [📊 Viết to lên đầu tờ giấy: "ĐỔI HƯỚNG." Gạch chân ba lần.]
    ~ ddt_bieu_do_tay = true
    ~ ddt_phan_tich_cao = true
    ~ ddt_lam_that(15)
    ~ ddt_nt(-10)
    _Lần đầu tiên sau nhiều năm, bạn thấy một con số làm tim mình đập nhanh, mà không phải vì tiền của mình._
    ** [🤝 Cho {thuc_tap_sinh} xem.]
        thuc_tap_sinh: Dạ… anh ơi… cái này… em nghĩ là đúng ạ. Hồi trước em đọc báo cáo tín dụng, nhìn kiểu này là biết ạ.
        dan_dau_tu: Báo cáo tín dụng?
        thuc_tap_sinh: Dạ… em… em nói lộn ạ! Em đi rót nước ạ!
        ~ qh("thuc_tap_sinh", 10)
    ** [😶 Gấp tờ giấy, cất vào túi áo ngực.]
        _Giữ cho tới khi có người cần nghe._
* [📈 Lật mặt sau tờ giấy, vẽ chart $HONG theo trí nhớ.]
    _Bạn vẽ chart. Nó đi lên. Mọi chart bạn vẽ đều đi lên._
    ~ ddt_nt(5)
    ~ ddt_man_hinh_phai = ddt_man_hinh_phai + 1
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1510_cong_vien ===
# ngay:15 # gio:19:30 # noi:pantry
_Tối. Pantry chỉ còn ánh đèn pin của {it}. {idol_het_thoi} ngồi trên quầy bếp, ôm cây đàn ghi-ta, hát "Công Viên" bằng giọng thật. {editor} lặng lẽ quay._
_Bạn nợ {idol_het_thoi} 500.000đ tiền ăn trưa. {idol_het_thoi} hát bài hit duy nhất của đời mình trong bóng tối, cho 6 người nghe._
* [👏 Vỗ tay thật to khi hết bài.]
    idol_het_thoi: Cảm ơn! Hồi anh còn nổi, tiếng vỗ tay như vầy là của 5 nghìn người đó.
    dan_dau_tu: Giờ là của 6 người. Mà 6 người thật.
    idol_het_thoi: *(im lặng một lúc)* …Ừ. Thật.
    ~ qh("idol_het_thoi", 10)
* [📊 Nhắn {editor}: "Clip này giữ lại. Số liệu nói nó sẽ nổ."]
    editor: *(ngáp)* Anh nói thiệt hả… Ừ… em giữ…
    ~ qh("editor", 8)
    ~ ddt_dc(3)
- ~ cang_thang(-15)
-> END

// ------------------------------------------------------------
=== dan_dau_tu_1610_canh_ga ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
_14 giờ. Ghi hình gameshow "Hồng Hay Không Hồng" ở Đài Tivi Hóng, 20 giờ tối nay phát sóng. Bạn ngồi sau cánh gà, điện thoại mở bảng đo phản ứng khán giả trường quay theo từng phút mà đài cho mượn._
_Bên cạnh là {chi_dai}, cầm bộ đàm._
chi_dai: {dan_dau_tu}. Lúc nào khán giả chán, nói chị. Chị không đọc được số, nhưng chị đọc được em.
_Phần "Hit Một Thời": {sieu_nhan_hong} hát "Công Viên" sai lời, "bán khoai chiên". Từ cánh gà, {idol_het_thoi} hát bè đúng lời. Đường phản ứng rung lên: người ta cười, nhưng không ai rời mắt._
_Phút thứ 22: đường phản ứng bắt đầu đi xuống. Khán giả trường quay chán phần trò chơi, bắt đầu cầm điện thoại lên lướt._
* {ddt_phan_tich_cao} [🔒 "Chị, cho {sieu_nhan_hong} xuống giúp bà cụ hàng ghế đầu đang loay hoay với cái dù."]
    chi_dai: *(vào bộ đàm)* Hồng. Hàng một, ghế ba. Bà cụ. Đi.
    _{sieu_nhan_hong} nhảy khỏi sân khấu, mở dù giùm bà cụ, đỡ bà ngồi lại. Camera đài bắt trọn. Đường phản ứng dựng đứng. Tối nay lên sóng, đoạn này sẽ được cắt riêng._
    ~ follow(30000)
    ~ qh("chi_dai", 15)
    ~ ddt_lam_that(5)
* [📊 "Chị, cắt quảng cáo sớm 2 phút."]
    chi_dai: *(vào bộ đàm)* Đạo diễn, cắt quảng cáo. Ngay.
    _Đường phản ứng không tụt thêm. Không tăng, nhưng không tụt._
    ~ follow(15000)
    ~ ddt_lam_that(3)
* [📈 Lén mở chart $HONG xem gameshow có làm coin tăng không.]
    _$HONG nhích 4%. Bạn mỉm cười. Phút thứ 22 trôi qua mà không ai báo {chi_dai}. Nửa trường quay ngồi lướt điện thoại._
    ~ ddt_soi_chart()
    ~ follow(-10000)
    ~ qh("chi_dai", -5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1610_buffet ===
# ngay:16 # gio:19:30 # noi:sanh_cong_ty
_Ngày Lương thực Thế giới. Xe của đoàn về tới công ty lúc 19 giờ. Liên hoan buffet ở sảnh, 20 giờ cả công ty xem gameshow phát sóng trên tivi. Miễn phí. Bạn đã chờ ngày này cả tuần._
_Bạn là người đầu tiên cầm đĩa. Và là người duy nhất mang theo hộp nhựa._
* [🍱 Ăn một đĩa đầy. Ăn đàng hoàng.]
    ~ an(100)
    ~ cang_thang(-10)
    _Gà rán, bánh bao, chè. Lần đầu tiên trong tuần, bạn no tới mức không muốn nhìn chart._
* [🥡 Ăn một đĩa, rồi lén gói thêm một hộp mang về gác lửng.]
    -> dan_dau_tu_mg_an_chuc
* [🤝 Gói một hộp cho Bác {bac_bao_ve} ở chòi.]
    ~ an(80)
    _Bạn mang hộp cơm xuống chòi. Bác nhận, gật đầu, chia một nửa cho {cho}._
    bac_bao_ve: Cậu biết nghĩ cho người khác rồi đấy.
    ~ qh("bac_bao_ve", 8)
    ~ qh("cho", 5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1610_tra_sua_thu_6 ===
# ngay:16 # gio:17:30 # noi:xe_khach
_Trên xe về từ Đài Tivi Hóng. Trà sữa thứ 6 từ quỹ phạt đi trễ, mua ở căn tin của đài. Tháng này quỹ dày vì {chua_te_deadline} đi trễ 9 lần._
_{sales} đi dọc lối xe chia trà sữa. Ly của bạn được đưa tới kèm một câu:_
sales: Anh {dan_dau_tu}, ly này là em tặng nha. Không tính vô nợ. Hôm nay em vui vì gameshow quay ngon.
* [😇 "Cảm ơn em. Anh sẽ trả. Thật."]
    sales: Anh nói "thật" mà không có "lần này là lên" phía trước, nghe lạ ghê. Em tin… 30%.
    ~ qh("sales", 5)
* [📊 "Em, báo cáo nhà tài trợ của em… anh coi giùm được không?"]
    sales: *(nụ cười khựng lại nửa giây)* Báo cáo của em chuẩn mà anh. Tin em đi. Mà… để tuần sau nha.
    ~ ddt_dc(2)
- ~ uong(30)
~ cang_thang(-10)
-> END
