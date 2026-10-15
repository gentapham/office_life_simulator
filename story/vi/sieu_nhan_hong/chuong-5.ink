// ============================================================
// CHƯƠNG 5: "BA MƯƠI MỐT TUỔI" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== sieu_nhan_hong_2110_moc_500k ===
# ngay:21 # gio:17:00 # noi:tang_1 # bat_buoc
_Sáng nay trang Confession đăng bài: giám đốc thế chấp biệt thự để trả lương. {hr} và {it} đi từng bàn hỏi chuyện. Không ai hỏi bạn. Bạn không phải nhân viên._
~ phat_hien(the_chap_biet_thu)
_17:00. Mốc 3: 500.000 người theo dõi._
{ nguoi_theo_doi >= 500000:
    _Màn hình hiện {nguoi_theo_doi}. Đạt. {giam_doc} vỗ tay một mình, mắt thâm quầng._
- else:
    _Màn hình hiện {nguoi_theo_doi}. Không đạt. Tin đồn cắt giảm nhân sự bắt đầu chạy khắp các bàn._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
    thuc_tap_sinh: *(thì thầm với ai đó)* Thực tập sinh chắc bị cắt đầu tiên…
}
* [🙂 Lên phòng giám đốc: "Anh ơi, cái biệt thự… anh ổn hông?"]
    giam_doc: *(giật mình, rồi cười méo)* Em… em là đối tác, em đừng lo chuyện nhà anh.
    giam_doc: Mà… cảm ơn em đã hỏi. Cả tuần nay chưa ai hỏi anh "ổn không".
    ~ qh("giam_doc", 10)
* [🦸 Livestream ngay: "Cả nhà ơi, giúp Hồng lên nửa triệu nha! Hồng hứa sẽ…" *(tạo dáng)*]
    ~ follow(15000)
    _Bạn hứa sẽ nhảy trend mới. Rồi sẽ đi giúp 100 người. Rồi sẽ… bạn hứa hơi nhiều._
* [💸 Thuê dịch vụ "Like Thật 100%" mua 100.000 người theo dõi bằng Két Vé Số.]
    ~ snh_mua_fan_ao = true
    ~ snh_ket(15)
    ~ follow(100000)
    _Con số nhảy vọt trong một đêm. Sáng mai cả công ty sẽ vui. Bạn sẽ không vui bằng._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2210_doan_thue ===
# ngay:22 # gio:10:00 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế. Trưởng đoàn chú Liêm, 55 tuổi, cặp da đen. Đòi giấy tờ thành lập, hợp đồng BTT, nghiệm thu dự án tháng 6, và…_
chu_liem: Anh Siêu Nhân. Khoản 5 tỷ anh chuyển cho công ty. Nguồn gốc từ đâu?
_{ke_toan} nhìn bạn. Cả phòng kế toán im phăng phắc._
* [🙂 Tháo mũ: "Dạ… con trúng vé số năm 2019. Giải độc đắc. Con có giấy tờ."]
    ~ snh_khai_ve_so = true
    ~ phat_hien(ve_so_nguyen)
    ~ snh_thao_mu(false)
    ~ snh_tien(40)
    chu_liem: *(lật giấy tờ)* Ồ… hợp lệ. Đóng thuế đầy đủ. Sổ sách công ty sạch phần này.
    ke_toan: *(thở ra một hơi dài như vừa nín từ ngày 1/10)*
    ~ qh("ke_toan", 20)
    _Bạn vừa nói ra điều chưa từng kể với ai. Với một chú thanh tra thuế, trong phòng kế toán. Cửa phòng hé mở. Bạn không biết ai đứng ngoài._
* [🤝 Nhìn {ke_toan}: "Chị {ke_toan}… chị trình giúp anh được hông?"]
    ke_toan: Dạ chú, khoản này có hợp đồng, có chứng từ đầy đủ. Em trình chú.
    { snh_tra_luong_ho:
        chu_liem: Còn khoản chuyển ngày 10/10 thì sao? Cũng từ anh Siêu Nhân?
        ke_toan: *(nuốt nước bọt)* Dạ… cái đó em… em sẽ bổ sung.
        ~ snh_tien(15)
    - else:
        chu_liem: Được. Tuần sau nộp bổ sung.
        ~ snh_tien(5)
    }
    ~ qh("ke_toan", 5)
* [🎲 Tạo dáng: "Nguồn gốc của Hồng là… thái độ!"]
    { RANDOM(1, 2) == 1:
        chu_liem: *(bật cười)* Hồi trẻ chú cũng thích siêu nhân. Thôi được, tuần sau nộp bổ sung.
        ~ follow(5000)
    - else:
        chu_liem: Anh đùa với đoàn kiểm tra à? *(ghi biên bản)*
        ~ snh_tien(10)
        ~ snh_meme(20000)
        _Ai đó quay clip "siêu nhân tạo dáng trước đoàn thuế". Đêm đó nó lên xu hướng._
    }
- _Đúng lúc đó, {cho} lững thững đi ngang. Chú Liêm lùi ba bước, nép sau cột: "Con chó đó có xích không?"_
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2210_kho_cua_tuat ===
# ngay:22 # gio:15:00 # noi:gam_cau_thang
_{chua_te_deadline} ngồi bệt ở cầu thang, mặt xanh lét. Đoàn thuế cần bằng chứng nghiệm thu dự án tháng 6. File gốc đã mất từ tháng 9._
chua_te_deadline: Ét o ét… lần này nước không tới chân nữa anh. Nước tới cổ rồi.
{ snh_nguoi_duy_nhat_biet:
    _Bạn nhớ cái USB đã đưa cậu ta trong bóng tối hôm 15. Cậu ta cũng nhớ._
    chua_te_deadline: À mà… em có file rồi. Nhờ anh. *(cười lần đầu trong ngày)* Em quên mất mình đã được cứu.
    ~ snh_tim(5)
    -> END
}
_Sau lưng cậu ta là gầm cầu thang. Kho của {cho}._
* {qh_cho >= 20} [🐕 Ngồi xổm trước kho: "{cho} ơi, cho anh mượn một món được hông?"]
    cho: *(nhìn bạn rất lâu, rồi đẩy ra một cái USB thơm mùi cà phê sữa đá)* …Gâu.
    ~ nhan(usb_khong_nhan)
    ~ qh("cho", 5)
    _Bạn đưa USB cho {chua_te_deadline}._
    ~ mat(usb_khong_nhan)
    ~ phat_hien(usb_cua_vu)
    chua_te_deadline: FILE GỐC! Anh… anh với con chó này… hai người là sao vậy?!
    ~ snh_tim(25)
    ~ snh_nguoi_duy_nhat_biet = true
* [🐕 Giả tiếng sủa, bò vào kho lục.]
    ~ snh_choc_tuat()
    cho: GÂU GÂU GÂU! *(cắn vào tay áo hồng, kéo ra)*
    _Không lấy được gì. Mất thêm một mảnh tay áo._
    ~ snh_meme(5000)
* [🙂 Ngồi xuống cạnh {chua_te_deadline}: "Để anh ngồi đây với em."]
    chua_te_deadline: Ngồi thì có giải quyết gì đâu anh.
    _Nhưng cậu ta không bảo bạn đi._
    ~ snh_tim(3)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2310_sang_sinh_nhat ===
# ngay:23 # gio:07:00 # noi:nha_nguyen # bat_buoc
_23/10. Bạn 31 tuổi. Căn nhà 12 ghế. Bạn tự rán một quả trứng, cắm một que diêm lên, thổi tắt._
_Điện thoại có 3 tin nhắn: ngân hàng chúc mừng sinh nhật, nhà mạng chúc mừng sinh nhật, và {quan_ly_idol}: "8 giờ tối livestream. Đừng trễ. Chuyện này để anh lo."_
* [🦸 Mặc đồ sớm, đến công ty trước giờ.]
    _Cổng công ty. {cho} đang nằm. Thấy bạn, nó ngẩng lên. Hôm nay nó không sủa ngay. Nó chờ 2 giây rồi mới sủa._
    ~ qh("cho", 2)
* [🙂 Đi bộ ra Công viên Hồ Cá Mập ăn chuối chiên, không mặc đồ.]
    _Không ai nhận ra bạn. Một bà bán chuối chiên cho thêm một miếng: "Nhìn mặt con buồn quá, ăn thêm đi con."_
    ~ an(15)
    ~ cang_thang(-10)
    _Người đầu tiên chúc mừng Nguyễn {sieu_nhan_hong} năm nay là một bà không biết tên bạn._
* [🆘 Đi giúp người tới trưa.]
    ~ snh_giup_nguoi()
    _Bạn đẩy một xe chết máy, dắt một cụ qua đường. Cụ hỏi: "Hôm nay ngày gì mà con mặc đẹp vậy?". Bạn nói: "Dạ, ngày thường thôi cụ."_
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2310_livestream ===
# ngay:23 # gio:20:00 # noi:studio_tang_2 # bat_buoc
_Livestream sinh nhật. Bánh kem hồng 3 tầng. Cả công ty đội mũ sinh nhật hồng. 30.000 người đang xem._
sales: Và đây là lời chúc từ chủ tịch BTT Global, Mr. Kevin Trộn!
_Bước ra là… {thuc_tap_sinh}, đeo kính râm, vest, nói giọng lơ lớ. Diễn quá tốt. Như từng làm sếp ngân hàng thật._
~ follow(60000)
_Giữa buổi, {hong_hot} đưa micro cho bạn. Ống kính chĩa vào bạn. {chua_te_deadline} đứng sau máy quay, đang lướt điện thoại._
* [🦸 "Vũ ơi… anh thích em. Hông phải PR đâu. Thật đó."]
    ~ snh_to_tinh_camera = true
    { snh_tim_hong < 60:
        ~ snh_to_tinh_pr = true
    }
    ~ follow(50000)
    _Hashtag VũƠiTrảLờiĐi lên xu hướng sau 6 phút. {chua_te_deadline} đứng hình, tay vẫn cầm điện thoại._
    { snh_tim_hong < 60:
        chua_te_deadline: *(nói nhỏ)* …Anh {quan_ly_idol} dặn anh nói vậy hả? Đỉnh ghê. Lên top luôn.
        ~ snh_tim(-5)
    - else:
        chua_te_deadline: *(nói nhỏ, không cười)* …Anh nói gì kỳ vậy. Trên sóng mà.
        _Cậu ta quay đi. Nhưng tai đỏ._
    }
* [🙂 Nói vào micro: "Cảm ơn mọi người đã ở đây. Năm nay là năm đầu tiên anh không ăn sinh nhật một mình."]
    ~ follow(30000)
    ~ snh_no(-3)
    _Bình luận chạy chậm lại. Rồi một loạt trái tim. Người ta không cần siêu nhân. Người ta cần một câu thật._
    ~ snh_tim(5)
* [🦸 Tạo dáng: "Hồng 31 tuổi vẫn là thái độ!"]
    ~ follow(20000)
- _Rồi từ cửa, một cái bóng vàng lao vào. {cho}. Thẳng về phía cái bánh 3 tầng._ # hen_gio:4
* [😂 Cười, giang tay: "{cho} ơi, ăn đi em!"]
    _Cái bánh đổ ụp. Kem hồng bay lên mũ bạn, lên mặt {giam_doc}, lên máy quay. Bạn cười lăn. 30.000 người cười theo._
    ~ snh_meme(30000)
    ~ qh("cho", 5)
* [😤 "{cho}! Bánh của anh!"]
    _Cái bánh vẫn đổ. Bạn hét trên sóng trực tiếp. Bình luận: "Siêu nhân giận chó", "Hồng là thái độ… xấu"._
    ~ follow(-5000)
    ~ qh("cho", -5)
* [🐕 Nằm xuống sàn chơi với {cho}, cho nó liếm kem trên mũ.]
    _{cho} khựng lại. Rồi liếm kem. Rồi nằm cạnh bạn. Lần đầu tiên, nó không cắn mũ._
    ~ snh_meme(25000)
    ~ qh("cho", 15)
    { co(xuc_xich):
        ~ mat(xuc_xich)
        ~ snh_cho_xuc_xich()
        _Bạn lấy cây xúc xích trong túi ra. Nó ăn. Rồi vẫn sủa bạn một tiếng. Nhưng sủa nhỏ._
    }
* [⏱️ (Không chọn kịp)]
    _Cái bánh đổ. {idol_het_thoi} đứng cạnh bàn bánh, phủi tay: "Con chó! Con chó làm đó!". Con chó ở cách đó 2 mét._
    ~ follow(20000)
- { snh_mo_nhanh_hieu_ech:
    _Cuối buổi, bạn cắt miếng bánh còn sót lại, đưa {ran_doc} trước tiên. "Em nhỏ hơn anh, phần em trước." Lần này hông ai giật của ai._
    ~ snh_hieu(-5)
}
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2310_dem_12_ghe ===
# ngay:23 # gio:23:30 # noi:nha_nguyen # bat_buoc
_Căn nhà 12 ghế. Bạn ngồi ở cái ghế có dấu ngồi. Trên bàn là hộp bánh kem còn sót lại một góc, dính lông chó._
{ snh_tim_hong >= 50:
    ~ snh_tin_nhan_vu_sinh_nhat = true
    _Điện thoại rung. Một tin nhắn._
    chua_te_deadline: *(tin nhắn)* Sinh nhật vui nha anh. Không phải PR đâu. —{chua_te_deadline}
    * [🙂 Trả lời: "Cảm ơn em. Anh vui."]
        ~ snh_tim(5)
        _Ba chấm nhảy lên. Rồi tắt. Rồi nhảy lên. "Ngủ đi anh. Mai còn chạy deadline." Bạn ngủ với điện thoại trên ngực._
        -> END
    * [🙂 Gửi một tấm ảnh: cái bàn 12 ghế, chỉ có một cái ghế có người.]
        ~ snh_tim(10)
        chua_te_deadline: *(tin nhắn)* …Nhà anh to dữ. Mà trống ghê.
        chua_te_deadline: *(tin nhắn)* Bữa nào em qua ngồi một ghế. Còn 11 ghế mà.
        -> END
- else:
    _Điện thoại im lặng. Bạn ăn góc bánh, nhìn 11 cái ghế trống. Dưới ánh đèn, cái nào cũng như đang đợi ai._
    ~ cang_thang(10)
    -> END
}

// ------------------------------------------------------------
=== sieu_nhan_hong_2410_hoi_nghi ===
# ngay:24 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức hội nghị hòa giải. Các cặp ngồi cạnh nhau: {truong_phong}–{con_ong_chau_cha}, {designer}–{bien_kich}, {sales}–{ke_toan}, {hr}–{thanh_xin_nghi}, {chi_dai}–{thanh_ninh}._
chi_dai: Em {sieu_nhan_hong} không phải nhân viên, nên làm "đại sứ hòa bình". Đi từng bàn. Ai cãi thì em tạo dáng cho tụi nó cười.
_Cùng lúc, {hong_hot} chìa điện thoại: clip {idol_het_thoi} hát trong bóng tối hôm mất điện đang lan. Và cùng lúc, có bài bóc 80.000 fan ảo của anh ta._
* [🦸 Đi từng bàn tạo dáng, pha trò.]
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
    _{truong_phong} và {con_ong_chau_cha} bật cười cùng lúc, rồi nhìn nhau ngượng ngùng. {designer} và {bien_kich} cãi nhau xem dáng nào xấu hơn. Ít ra là cãi chuyện khác._
* [🤝 Đăng bài trên trang mình: "Ai cũng có lúc cần người vỗ tay. Clip hát này của anh {idol_het_thoi} là thật. Mình nghe chính tai."]
    ~ follow(10000)
    ~ qh("idol_het_thoi", 25)
    ~ qh("quan_ly_idol", 15)
    ~ snh_hieu(-3)
    _Clip hát lấn át phốt fan ảo. {idol_het_thoi} nhắn riêng bạn, lần đầu tiên không kèm câu "em biết anh là ai không": "Cảm ơn em."_
* [😶 Ngồi một góc, ăn bánh.]
    _Không ai cần bạn hòa giải. Hay là ai cũng cần, mà bạn không đủ sức._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2510_cuoi_tuan ===
# ngay:25 # gio:21:00 # noi:nha_nguyen
_Chủ nhật. Bạn đi giúp người cả ngày ở khu Ven Đô. Lúc đẩy một xe chết máy ngang tòa kính LL-Entertainment, bạn thấy {quan_ly_idol} bước ra, hai điện thoại tắt cả hai._
_Tối, {quan_ly_idol} gọi._
quan_ly_idol: Em. Anh nói thẳng. LL mời anh 36 triệu một tháng. Điều kiện: anh mang em theo.
quan_ly_idol: Anh chưa trả lời. Anh… anh mà đi thì {idol_het_thoi} ở lại một mình.
~ phat_hien(ll_moi_thai)
* [🙂 "Anh muốn đi hông? Anh hỏi lòng anh trước, đừng hỏi em."]
    quan_ly_idol: *(im lặng rất lâu)* …Anh không muốn. Anh chỉ mệt.
    ~ qh("quan_ly_idol", 15)
    _Bạn không biết vì sao anh ta không muốn đi. Nhưng bạn nghe được tên {idol_het_thoi} trong câu trả lời._
    ~ phat_hien(thai_thuong_phat)
* [🦸 "Em đi đâu là quyền của em. Mà em chưa định đi đâu hết!"]
    quan_ly_idol: Ừ. Vậy thì tốt. Chuyện này để anh lo.
    ~ qh("quan_ly_idol", 5)
* [💬 "LL có cho mang con chó theo hông?"]
    quan_ly_idol: Con… con {cho}? Em đùa à? *(rồi bật cười, lần đầu trong tuần)*
    ~ qh("quan_ly_idol", 8)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2610_chieu_phim ===
# ngay:26 # gio:16:00 # noi:phong_hop_sang_tao # bat_buoc
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". Kịch bản: {bien_kich}. Tin đồn cắt giảm nhân sự chạy khắp hành lang._
_Trên màn hình: một người bỏ việc ngân hàng, trời mưa, xe chết máy. Một người lạ mặc đồ hồng đẩy xe cho anh ta 2 km._
_Bạn ngồi hàng cuối, không thở. Cái áo sơ mi trắng. Cái cặp da ướt sũng. Câu cảm ơn run run ở cuối đường. Bạn nhớ rồi. Là {thuc_tap_sinh}._
~ phat_hien(nguoi_gac_ket)
_{thuc_tap_sinh} ngồi hàng đầu, nắm chặt tay vịn ghế. Cậu ta không biết người đẩy xe hôm đó đang ngồi sau lưng mình._
* [🙂 Sau buổi chiếu, kéo {thuc_tap_sinh} ra hành lang: "Hôm đó mưa lớn ha. Cái cặp da của em ướt hết."]
    thuc_tap_sinh: *(sững người)* Dạ… sao anh biết… Là anh hả? Là anh hả anh?!
    _{thuc_tap_sinh} ôm chầm lấy bạn. Một người 30 tuổi khóc như con nít giữa hành lang. Ở cuối hành lang, {ran_doc} đứng nhìn, rồi lặng lẽ quay đi._
    ~ snh_hieu(-5)
    thuc_tap_sinh: Hôm đó em định quay lại ngân hàng. Anh đẩy xe xong, em nghĩ… đời còn người tốt, em thử làm cái mình thích.
    ~ qh("thuc_tap_sinh", 25)
    ~ snh_no(-5)
* [🦸 Đứng dậy vỗ tay: "Phim hay quá! Người hùng ơi, anh là ai vậy?"]
    ~ follow(5000)
    bien_kich: *(mỉm cười, cúi chào)* Cảm ơn. Đây là cảm hứng từ… cuộc sống.
    _{thuc_tap_sinh} nhìn {bien_kich}, rồi nhìn xuống. Bạn thấy hết._
* [💬 Nói nhỏ với {bien_kich}: "Ý tưởng này của {thuc_tap_sinh} mà, em ghi tên cậu ấy đi."]
    bien_kich: *(đứng hình)* Đây không phải đạo, đây là cảm hứng… *(im lặng)* …Để em nghĩ.
    ~ qh("bien_kich", -5)
    ~ qh("thuc_tap_sinh", 10)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2710_vest_trang ===
# ngay:27 # gio:11:00 # noi:ca_phe_song_ao # bat_buoc
_Quán cà phê Sống Ảo. Bàn trong góc. Một người vest trắng, tóc vuốt keo, đặt tập hợp đồng lên bàn trước mặt bạn._
luu_luc: G lấy của anh 5 tỷ. Qua LL, tụi tui lăng xê anh miễn phí, mà còn trả ngược cho anh gấp ba con số đó.
luu_luc: Đội ngũ chuyên nghiệp, tòa nhà 20 tầng. Bên đó… chỉ có một con chó ghét anh thôi mà.
~ phat_hien(ll_moi_nguyen)
{ nguoi_theo_doi < 800000:
    luu_luc: Mà anh nhìn con số đi. Bên đó không đưa anh lên nổi đâu.
}
* [😤 "Chó ghét anh là chuyện của anh với chó. Anh hông bỏ ai hết."]
    ~ snh_tu_choi_ll = true
    ~ nguyen_theo_ll = false
    luu_luc: *(mỉm cười, cất hợp đồng)* Tiếc ghê. Mà anh đổi ý thì…
    _Ông ta đặt danh thiếp xanh lá chuối lên bàn. Bạn để lại nó, cạnh ly cà phê chưa uống._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [🤔 "Cho anh suy nghĩ tới 30/10."]
    ~ snh_hen_ll_30 = true
    luu_luc: Được. Tui không vội. Tui chỉ… nhanh.
    _Chiều đó, {ran_doc}, {quan_ly_idol} và {idol_het_thoi} mỗi người nghe một tin đồn khác nhau về quyết định của bạn._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
* [✍️ Ký.]
    ~ nguyen_theo_ll = true
    _Bạn ký. Chữ ký run. Lưu Lực bắt tay bạn, tay ông ta lạnh như máy lạnh tòa kính._
    luu_luc: Chào mừng anh về nhà mới.
    _Bạn ra khỏi quán. Đi ngang {cong_ty}. Không ai biết. Chưa ai biết._
* {snh_biet_trang_47} [🔒 "Anh có biết G-Entertainment có cái trang 47 hông? Anh trả luôn 10 tỷ cho tụi nó thì anh ký."]
    ~ snh_tu_choi_ll = true
    ~ snh_tien(5)
    luu_luc: *(tái mặt)* Mười… tỷ?
    _Ông ta cất hợp đồng, đứng dậy. Từ nay LL không dám ra giá nữa. Bạn ngồi lại, uống hết ly cà phê. Nói chuyện tiền tỷ bình thản quá, chính bạn cũng thấy lạ._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2710_tin_nhan ===
# ngay:27 # gio:23:00 # noi:nha_nguyen # bat_buoc
_Đêm 27/10. Lưu Lực đã tới tận công ty chiều nay, thấy {chi_dai} thì làm rơi cả tập hồ sơ. Cả công ty bàn tán. Ai cũng hỏi bạn có đi không._
_Bạn mở khung chat với {chua_te_deadline}. Gõ: "Em muốn anh ở lại không?"_
* [🙂 Gửi.]
    { snh_tim_hong >= 60:
        _Ba chấm. Rất lâu. Rồi:_
        chua_te_deadline: *(tin nhắn)* Em không giỏi trả lời mấy câu này. Em chỉ giỏi để tới phút chót.
        chua_te_deadline: *(tin nhắn)* Mà phút chót thì em chưa bao giờ trễ. Anh nhớ vậy là được.
        ~ snh_tim(10)
    - else:
        chua_te_deadline: *(tin nhắn)* Anh ở đâu thì PR cũng được mà anh. Chill. Em ủng hộ anh hết.
        _Không sai. Không đúng. Không phải câu bạn muốn nghe._
        ~ cang_thang(10)
    }
* [😶 Xóa. Gõ lại: "Ngủ ngon." Gửi.]
    chua_te_deadline: *(tin nhắn)* Ngủ ngon anh. Ủa mà anh có đi LL hông? Cả công ty hỏi em.
    _Cả công ty hỏi cậu ta. Không ai hỏi bạn có muốn đi không._
* [📱 Không gửi gì. Mở trang LL, nhìn tấm ảnh tòa kính 20 tầng.]
    ~ snh_no(3)
    _Tòa nhà đẹp. Cửa kính sáng. Không có con chó nào ở cổng. Cũng không có bác bảo vệ nào rót trà._
- -> END
