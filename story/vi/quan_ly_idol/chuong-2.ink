// ============================================================
// QUẢN LÝ IDOL · CHƯƠNG 2: "BỎ NGANG" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_tang_2
~ thai_ly_ca_phe = 0
_Thứ 2. Họp giao ban. {truong_phong}: "Mình sync nhanh 5 phút nhé." Đồng hồ treo tường đã chỉ 10 giờ 15._
_Dưới gầm bàn, máy trái của bạn sáng: mẹ cô dâu đám thứ 7 tuần sau hỏi "ca sĩ có hát được bài bolero hông con". Bạn gõ trả lời bằng một ngón tay._
_Ngày Nhà giáo Thế giới. {thuc_tap_sinh} đi vòng quanh bàn họp tặng hoa "các thầy cô". Tới lượt bạn._
thuc_tap_sinh: Dạ, em tặng thầy {quan_ly_idol} ạ. Thầy dạy em… ờ… cách nghe hai điện thoại cùng lúc ạ.
* [😇 "Cảm ơn {thuc_tap_sinh}. Mà đừng học cái đó. Học cái khác đi em."]
    thuc_tap_sinh: Dạ? Dạ học cái gì ạ?
    quan_ly_idol: Học cách tắt máy.
    _{thuc_tap_sinh} ghi vào sổ, gạch chân. Bạn thì chưa bao giờ học được._
    ~ qh("thuc_tap_sinh", 8)
* [📞 Nhận hoa bằng tay trái, vì tay phải đang gõ tin nhắn.]
    _Bông hoa kẹp giữa hai điện thoại. Cánh hoa rụng xuống bàn phím._
    ~ qh("thuc_tap_sinh", 3)
- truong_phong: Anh {quan_ly_idol}, anh có ý kiến gì không?
* [🗓️ "Lịch tuần này: thứ 3 chụp poster, thứ 6 ra MV. {idol_het_thoi} có 3 đám cưới. Không đụng."]
    truong_phong: Tuyệt vời. Ngắn gọn. Mình take note.
    ~ uy_tin = uy_tin + 3
* [😶 Đang nghe máy, giơ ngón cái.]
    truong_phong: Ừ… thế anh đồng ý nhé. *(ghi "Thái: đồng ý" vào biên bản, dù không ai biết đồng ý cái gì)*
- ~ thai_p(-10)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0610_chup_poster ===
# ngay:6 # gio:09:30 # noi:studio # bat_buoc
_Studio tầng 2. Buổi chụp poster đầu tiên. Đèn, phông hồng, quạt gió. Bạn đứng sau thợ chụp, hai tay hai máy._
_Phát đi ngang khung hình lần thứ mười bốn. Lần này mang theo ly nước, đi rất chậm._
_Rồi {sieu_nhan_hong} nhìn ra cửa sổ, thấy một bà cụ loay hoay với giỏ đồ ngoài vỉa hè. Nguyên bỏ mic, bỏ đèn._
sieu_nhan_hong: Điều khoản số 3! Em đi chút về liền!
_Nguyên chạy xuống thang bộ. Thợ chụp nhìn đồng hồ. {idol_het_thoi} nhìn cái phông trống, bước lên một bước._
* [🏃 Đuổi theo Nguyên.]
    _Bạn xuống tới vỉa hè thì Nguyên đã xách một bên giỏ bí đỏ, bà cụ xách bên kia. Một cậu học sinh đang quay._
    _Bạn đứng ngoài khung hình, nhắn {hong_hot}: "Có người quay. Xin clip gốc ngay."_
    ~ follow(5000)
    ~ uy_tin = uy_tin + 3
    _Trên lầu, {idol_het_thoi} chụp 200 tấm. Thợ chụp hết thẻ nhớ._
    ~ qh("idol_het_thoi", -3)
* [✋ Chặn {idol_het_thoi}: "Phát. Đứng đây với anh."]
    idol_het_thoi: *(đứng lại, hơi giận)* Đèn đang đẹp mà anh.
    quan_ly_idol: Đèn đẹp thì để dành. Anh hứa cho em một buổi chụp riêng.
    _Phát đứng lại. Nhìn bạn. Rồi gỡ kính đen, đứng lặng cạnh bạn._
    ~ qh("idol_het_thoi", 5)
    ~ thai_gk(-5)
* [📸 "Chụp {idol_het_thoi} đi em. Đèn đang đẹp. Phí của trời."]
    _Phát chụp 200 tấm. Lần này bạn chọn giùm 5 tấm đẹp nhất. Tấm đẹp nhất là tấm {idol_het_thoi} không đeo kính, cười thật, vì bạn vừa nói gì đó buồn cười._
    ~ qh("idol_het_thoi", 12)
    ~ thai_gk(-8)
    ~ qh("sieu_nhan_hong", -3)
- _Nửa tiếng sau Nguyên quay lại, tay dính đất bí đỏ. "Xin lỗi cả nhà! Mình chụp tiếp nha! Gét gô!"_
~ thai_kh(1)
~ thai_p(-15)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0610_bien_thanh_pr ===
# ngay:6 # gio:19:00 # noi:phong_nghe_si
_Tối. Clip "Siêu Nhân Hồng bỏ buổi chụp đi giúp bà cụ" đang lên. Nhưng có bình luận: "Diễn", "Bỏ việc thì công ty trừ lương hông?"._
_Bạn phải quyết định: dập, hay đẩy._
hong_hot: Anh {quan_ly_idol}! Em đăng lại lên fanpage nha? Em quen admin mấy trang hóng, em nhờ đẩy cho!
* [🙏 Nhờ {hong_hot} đẩy lên các trang hóng, kèm tiêu đề "Siêu Nhân Hồng bỏ quay đi giúp bà cụ".]
    hong_hot: Gét gô! *(5 phút sau)* Ơ, bên kia hỏi có phải bà cụ là người nhà hông. Em nói hông. Mà em lỡ kể chuyện bí đỏ…
    ~ follow(30000)
    ~ qh("hong_hot", 5)
    { RANDOM(1, 10) <= 3:
        _Một trang hóng giật tít: "Siêu Nhân Hồng bỏ việc, công ty bất lực". Phốt nhỏ._
        ~ thai_kh(1)
    }
* [🦉 Nhắn {editor}: "Em dựng lại clip này giùm anh, thêm nhạc, đừng thêm chữ."]
    editor: *(trả lời sau 11 giây, lúc 7 giờ tối, giờ {editor} mới thức dậy)* Dạ được anh. Render xong em gửi.
    _Hai tiếng sau: bản dựng 47 giây, nhạc piano, không một chữ. Cuối clip, một con cú nhỏ xíu đậu trên cột điện, nửa giây. Bạn không để ý._
    ~ follow(45000)
    ~ qh("editor", 8)
    ~ thai_dap()
* [📊 Hỏi {dan_dau_tu}: "Ông coi số liệu, người ta thích cái gì ở clip này?"]
    dan_dau_tu: *(mở bảng, tắt chart coin)* Người ta thích cái thật. Lượt xem gấp 12 lần MV, giữ chân tới giây cuối. Đẩy đúng cách là ăn gấp bốn.
    dan_dau_tu: Mà muốn đẩy đúng cách thì cần {hong_hot} với {editor} cùng làm. Tui chỉ đọc số thôi.
    ~ qh("dan_dau_tu", 8)
    ~ follow(30000)
    { qh_hong_hot >= 10 and qh_editor >= 10:
        _{hong_hot} đăng, {editor} dựng, {dan_dau_tu} chọn giờ. Lần đầu ba người cùng làm một việc._
        ~ follow(90000)
    }
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_0710_moc_mot ===
# ngay:7 # gio:14:00 # noi:phong_hop_tang_2
{ nguoi_theo_doi < 50000:
    _Mốc 1: 50.000 người theo dõi. Không đạt. {giam_doc} họp khẩn "truyền lửa". Ba tiếng._
    giam_doc: Mindset của các em đang bị lock! Anh muốn mỗi em burning như hồi anh khởi nghiệp!
    ~ thai_kh(1)
- else:
    _Mốc 1: 50.000 người theo dõi. Đạt. {giam_doc} vẫn họp, họp khen. Hai tiếng rưỡi._
    giam_doc: {quan_ly_idol} làm tốt lắm! Anh không ép, nhưng tối nay ai rảnh thì đi ăn ốc!
    ~ thai_tt(5)
}
_Dưới gầm bàn, máy trái sáng. Mẹ cô dâu: "Bolero được hông con? Trả lời cô liền đi." Máy phải sáng. {sieu_nhan_hong}: "Anh ơi em đang ở công viên, có con mèo kẹt trên cây…"_
* [📞 Trả lời cả hai dưới gầm bàn, mắt vẫn nhìn {giam_doc}.]
    { RANDOM(1, 10) <= 7:
        _Mẹ cô dâu: "Ok con." Nguyên: "Dạ em leo xuống rồi!" Không ai biết bạn vừa làm hai việc dưới gầm bàn._
        ~ uy_tin = uy_tin + 2
    - else:
        _Bạn gửi nhầm. Mẹ cô dâu nhận được: "Leo xuống từ từ, đừng để mèo cào mặt nha." Nguyên nhận được: "Bolero được ạ."_
        ~ thai_kh(1)
    }
    ~ thai_p(-10)
* [😶 Úp cả hai máy xuống bàn. Nghe {giam_doc} nói hết.]
    giam_doc: *(liếc thấy, gật đầu)* {quan_ly_idol} hôm nay tập trung đấy.
    _Sau buổi họp: 23 cuộc gọi nhỡ. Mẹ cô dâu đã tìm ca sĩ khác._
    ~ qh("giam_doc", 5)
    ~ tien_cong(-150000)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_0810_xep_lich ===
# ngay:8 # gio:10:00 # noi:phong_nghe_si
_Ngày Thị giác Thế giới. Phòng Nghệ sĩ. Bạn và {thanh_xin_nghi} ngồi trước bảng trắng, xếp lịch hai nghệ sĩ cho tuần sau. Ô nào cũng chồng lên ô khác._
_{editor} đi ngang, mắt đỏ như thỏ, bị {hr} bắt đi khám mắt._
* [💬 "Lĩnh. Đi khám đi em. Thức đêm hoài mù mắt đó."]
    editor: *(khựng lại)* Dạ… anh {quan_ly_idol} cũng thức khuya mà…
    quan_ly_idol: Anh già rồi, mù cũng được. Em còn trẻ.
    editor: *(đỏ mặt, đi nhanh)* Dạ em đi!
    ~ qh("editor", 8)
* [📱 "Lĩnh, khám xong dựng anh cái teaser MV nha, mai ra mắt rồi."]
    editor: Dạ… dạ em dựng liền.
    ~ qh("editor", 2)
- thanh_xin_nghi: Anh {quan_ly_idol}… thứ 7 tuần sau với thứ 4 tuần sau nữa… em xin nghỉ được hông anh? Bà ngoại em…
_{thanh_xin_nghi} nói "bà ngoại" mà mắt nhìn lịch phát sóng Đài Tivi Hóng dán sau lưng bạn._
* [🗓️ "Được. Anh đổi lịch cho em. Mà em nợ anh một lời giải thích."]
    thanh_xin_nghi: Dạ… em nợ. Em hứa sẽ kể. Mà chưa phải bây giờ.
    ~ thai_doi_lich_son = thai_doi_lich_son + 1
    ~ qh("thanh_xin_nghi", 10)
    ~ thai_p(-10)
* [😤 "Bà ngoại em ốm 7 lần rồi đó {thanh_xin_nghi}."]
    thanh_xin_nghi: Dạ… lần này là lần 8 ạ.
    ~ qh("thanh_xin_nghi", -5)
- _Trên màn hình, kênh nghệ sĩ của {idol_het_thoi} có một video mới đăng lúc 3 giờ sáng: {idol_het_thoi} hát ở đám cưới tuần trước, dựng lại đẹp như MV. Bạn không nhớ mình có đăng._
~ thai_video_tien_tay = thai_video_tien_tay + 1
quan_ly_idol: *(lẩm bẩm)* Thuật toán Diu-túp hôm nay thương {idol_het_thoi} ghê.
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0910_trung ===
# ngay:9 # gio:12:10 # noi:can_tin
~ thai_ly_ca_phe = 0
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. Mười món trứng, không một miếng chuối nào._
_Điều khoản số 4: phòng chờ phải có bánh chuối chiên. Tối nay ra mắt MV. {sieu_nhan_hong} nhắn: "Anh ơi phòng chờ hết chuối chiên rồi, em ăn trứng được hông?"_
* [🏃 Chạy ra xe đẩy đầu đường. Xe nghỉ bán. Chạy tiếp ra chợ.]
    _Chợ Phố Cũ có chuối, không có ai chiên. Bạn mua chuối, mượn chảo của cô bán xôi, tự chiên._
    _Bánh hơi cháy. Nguyên ăn hết, khen "cháy là thái độ"._
    ~ nhan(chuoi_chien)
    ~ qh("sieu_nhan_hong", 8)
    ~ thai_p(-15)
* [🥚 "Em ăn trứng đi. Trứng là thái độ."]
    sieu_nhan_hong: Dạ! Trứng là thái độ! *(gửi kèm ảnh selfie với quả trứng luộc vẽ mặt cười)*
    _Ảnh đó có 12.000 lượt thích. Điều khoản số 4 thì bị vi phạm lần đầu tiên._
    ~ follow(3000)
* [📞 Nhờ {idol_het_thoi}: "Em đi ngang xe chuối chiên nào thì mua giùm anh một bịch."]
    idol_het_thoi: Mua cho nó hả?
    quan_ly_idol: Mua cho anh.
    _Hai mươi phút sau {idol_het_thoi} mang tới hai bịch. Một bịch đặt trong phòng chờ. Một bịch đặt trên bàn bạn, kèm ly cà phê đen đá ít đường._
    ~ qh("idol_het_thoi", 8)
    ~ thai_gk(-3)
    ~ an(15)
- ~ an(20)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0910_ra_mat_mv ===
# ngay:9 # gio:20:00 # noi:phong_nghe_si # bat_buoc
_8 giờ tối. MV "Hồng Hóa Việt Nam" ra mắt. Bạn ngồi trước laptop, hai điện thoại dựng hai bên như hai cái loa._
_10 phút: 31.000 lượt xem. 20 phút: 52.000. Bình luận chảy như thác._
_Ở tab bên cạnh, kênh của {idol_het_thoi}: MV "Công Viên" bản 2015 vừa được đăng lại. 20 phút: 50.112 lượt xem._
_Bạn biết con số đó từ đâu ra: dịch vụ "Like Thật 100%". {idol_het_thoi} đã nợ 18 triệu vì nó. {idol_het_thoi} nghĩ bạn không biết._
* [📊 Tập trung cho MV của Nguyên: ghim bình luận, trả lời fan, nhắn {hong_hot} đẩy giờ vàng.]
    ~ follow(15000)
    ~ uy_tin = uy_tin + 3
    ~ thai_p(-15)
* [🔁 Bấm chia sẻ MV của Nguyên từ kênh nghệ sĩ, kèm dòng: "Đàn anh {idol_het_thoi} chúc mừng đàn em."]
    _Bạn quản lý kênh của {idol_het_thoi}, bạn bấm được. Mười phút sau {idol_het_thoi} thấy. {idol_het_thoi} không xóa._
    ~ follow(8000)
    ~ qh("sieu_nhan_hong", 5)
    { RANDOM(1, 2) == 1:
        ~ qh("idol_het_thoi", -5)
    }
* [😶 Nhìn con số 50.112 rất lâu.]
    _Bạn tưởng tượng {idol_het_thoi} đang ngồi một mình ở căn 1808, bấm F5. Bạn biết {idol_het_thoi} đang làm vậy. Bạn biết vì mười một năm nay bạn cũng làm vậy với kênh của {idol_het_thoi}._
    ~ thai_gk(-3)
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_0910_fan_ao ===
# ngay:9 # gio:23:40 # noi:studio_0905 # bat_buoc
_23 giờ 40. Bạn mở trang quản lý kênh của {idol_het_thoi}. 50.000 view trong 20 phút. 500 bình luận giống hệt nhau: "Anh {idol_het_thoi} đỉnh nóc kịch trần"._
idol_het_thoi: *(gọi tới)* Anh thấy chưa? Fan em về rồi đó! Em nói rồi mà, em chưa hết thời!
_Giọng {idol_het_thoi} vui. Vui thật. Bạn chưa nghe giọng đó từ lâu._
* [😶 "Ừ, anh thấy rồi. Ngủ sớm đi em."]
    idol_het_thoi: Dạ! Ngủ ngon nha anh!
    ~ thai_gk(5)
    _Bạn cúp máy. Fan ảo vẫn còn. Một quả bom nhỏ, chưa nổ._
* [📞 "Phát. Anh biết đó là fan ảo. Hủy đi, rồi mình tính cách khác."]
    _Phát im lặng 5 giây. Rồi cúp máy._
    ~ qh("idol_het_thoi", -15)
    { RANDOM(1, 10) <= 6:
        _Hai ngày sau, bạn thấy gói "Like Thật 100%" của {idol_het_thoi} chuyển sang "Đã hủy". {idol_het_thoi} không nói gì với bạn. Bạn cũng không._
        ~ thai_phat_huy_fan_ao = true
        ~ thai_phat_fan_ao = 0
        ~ qh("idol_het_thoi", 8)
    }
* [🛡️ Lén vào tài khoản, tự hủy gói, không nói với ai.]
    _Mật khẩu của {idol_het_thoi} là ngày phát hành "Công Viên". Bạn biết. Bạn hủy gói. 80.000 hoa sen héo trong một giây._
    _Ba ngày sau, {idol_het_thoi} buồn. "Fan bỏ em rồi anh ơi." Bạn ngồi nghe, không nói gì._
    ~ thai_phat_huy_fan_ao = true
    ~ thai_phat_fan_ao = 0
    ~ thai_gk(-5)
    ~ cang_thang(8)
* {thai_giau_kin >= 60} [🔒 Đăng nhập "ChuoiChien89", nhắn vào nhóm "Hội Cá Viên Chiên": "Tối nay ai rảnh vô nghe anh {idol_het_thoi} hát nha."]
    _47 fan thật vào kênh. Bình luận đủ kiểu, không cái nào giống cái nào: "Anh ơi hát lại khúc 2 đi", "Em nghe bài này hồi lớp 8", "Mai anh hát đâu?"._
    _Phát không biết vì sao. Nhưng lần đầu tiên trong năm, {idol_het_thoi} đọc hết bình luận. {idol_het_thoi} nhắn bạn lúc 1 giờ sáng: "Anh coi nè, có người hỏi mai em hát đâu."_
    ~ qh("idol_het_thoi", 10)
    ~ thai_gk(-3)
- ~ thai_p(-10)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1010_hai_gio_sang ===
# ngay:10 # gio:02:00 # noi:studio_0905 # bat_buoc
_Thứ 7, ngày 10. Ngày lương. Lương chưa về: ngân hàng "kiểm tra giao dịch lớn"._
_2 giờ sáng. Máy trái sáng. {idol_het_thoi}._
idol_het_thoi: Anh ơi, bà quản lý dán giấy lên cửa nhà em.
_Bạn mở ví điện tử. Số dư: 9.000.000đ. Tháng 7 bạn đã trả giùm {idol_het_thoi} một tháng tiền nhà. {idol_het_thoi} không biết._
* [💸 Chuyển 9 triệu cho bà quản lý Sky Ảo, ghi "Căn 1808, tháng 8".]
    _Bạn chuyển. Rồi xóa lịch sử giao dịch. Rồi nhắn {idol_het_thoi}: "Ngủ đi. Thứ 2 lương về. Có gì anh lo."_
    _Ví còn 0 đồng. Tối mai bạn ăn mì gói. Không sao, bạn quen._
    ~ thai_tra_tien_nha = true
    ~ tien_cong(-9000000)
    ~ thai_gk(-10)
    ~ cang_thang(5)
* [🏃 Mặc áo khoác, đi thang máy lên tầng 18.]
    _Phát mở cửa, mắt đỏ, không đeo kính. Tờ giấy dán cửa đã được gỡ, vò lại trên sàn._
    idol_het_thoi: Anh lên chi vậy… 2 giờ sáng mà…
    quan_ly_idol: Lên coi em có ngủ được hông.
    _Hai người ngồi ở hành lang tầng 18 tới 4 giờ sáng, ăn mì ly. Không ai nhắc tới tiền._
    ~ qh("idol_het_thoi", 12)
    ~ thai_gk(-8)
    ~ thai_p(-20)
* [📞 Nhắn: "Em đừng lo. Thứ 2 lương về. Có gì anh lo."]
    idol_het_thoi: Dạ.
    _Một chữ "Dạ". Bạn đọc chữ đó tới sáng._
    ~ thai_gk(3)
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1010_luu_luc_goi ===
# ngay:10 # gio:16:00 # noi:quan_ca_phe_song_ao
_Chiều thứ 7. Quán cà phê Sống Ảo. Bạn đang ngồi duyệt lịch với Nguyên qua điện thoại thì máy trái reo. Số lạ. Đầu số đẹp._
luu_luc: Anh {quan_ly_idol} phải không? Em Lưu Lực đây. Em mời anh ly cà phê. Chỉ cà phê thôi.
_Lưu Lực. Năm 2018 người này đã mời bạn về LL. Bạn từ chối._
* [🚪 "Cảm ơn. Anh có cà phê rồi." Cúp máy.]
    luu_luc: *(trước khi máy cúp)* Em sẽ gọi lại. Lần sau giá khác.
    ~ thai_tt(5)
* [🤔 "Cà phê ở đâu?"]
    luu_luc: Tòa nhà kính xanh lá chuối, tầng 20. Nhìn thẳng sang tòa nhà tím của anh. Đẹp lắm.
    _Bạn không trả lời. Nhưng bạn không xóa số._
    ~ thai_tt(-5)
* [😶 Để máy reo tới khi tắt.]
    _Máy reo 3 lần. Rồi một tin nhắn: "Anh {quan_ly_idol}, lương bên em không về trễ."_
    _Hôm nay là ngày 10. Lương chưa về._
    ~ thai_tt(-3)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1110_anh_hoi_nho ===
# ngay:11 # gio:10:00 # noi:studio_0905
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {sieu_nhan_hong} gửi bạn một tấm để duyệt trước khi đăng: một xóm nhỏ có cây me, cả đám con nít, có một đứa đang khóc._
sieu_nhan_hong: Anh ơi em đăng tấm này được hông? Xóm cũ em đó. Hồi đó em quậy lắm.
_Đứa bé đang khóc nhìn thẳng vào ống kính. Bạn không biết nó là ai._
* [✅ "Đăng đi. Dễ thương."]
    sieu_nhan_hong: Dạ! Gét gô!
    ~ follow(8000)
    { RANDOM(1, 10) <= 3:
        _Chiều đó có người bình luận ẩn danh: "Đứa đang khóc giờ lớn rồi đó. Nó còn nhớ." Bạn đọc hai lần, không hiểu._
        ~ thai_kh(1)
    }
* [✂️ "Cắt đứa nhỏ đang khóc ra. Người ta hông xin phép được."]
    sieu_nhan_hong: Dạ… em hông nghĩ tới. Anh nói đúng.
    ~ follow(5000)
    ~ uy_tin = uy_tin + 3
- _Máy trái báo: {idol_het_thoi} vừa đăng ảnh năm 2015 cầm cúp, ghi "Hồi nhỏ."_
_Bạn mở nhóm "Hội Cá Viên Chiên" bằng tài khoản ChuoiChien89._
* [🍌 Đăng: "Anh {idol_het_thoi} 'hồi nhỏ' nè mọi người. Mười một năm mà vẫn đẹp vậy đó."]
    _Ba trăm thành viên thả tim. {idol_het_thoi} không biết ai đăng. Nhưng {idol_het_thoi} chụp màn hình gửi bạn: "Anh coi nè, fan em còn nhớ."_
    ~ qh("idol_het_thoi", 5)
    ~ thai_gk(-2)
* [😶 Chỉ thả tim ảnh của {idol_het_thoi} bằng tài khoản thật.]
    _Một trái tim từ tài khoản quản lý. Không ai để ý. {idol_het_thoi} để ý._
    ~ thai_gk(2)
- _Kênh nghệ sĩ của {idol_het_thoi} lại có một video mới, đăng lúc 3 giờ 40 sáng: "Công Viên" bản acoustic cắt từ đám cưới hôm thứ 7, dựng đẹp như MV. Bạn không đăng. Thuật toán lại thương {idol_het_thoi}._
~ thai_video_tien_tay = thai_video_tien_tay + 1
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1210_luong_ve ===
# ngay:12 # gio:09:30 # noi:tang_1 # bat_buoc
~ thai_ly_ca_phe = 0
_Thứ 2. Lương về trễ 2 ngày. 18.000.000đ. Group Zalo-lô nổ như chợ. {con_ong_chau_cha} bị từ chối thẻ phụ ở quầy cà phê, {thuc_tap_sinh} trả giùm bằng một cái thẻ màu kim cương rồi giấu ngay._
~ tien_cong(18000000)
_Họp giao ban. Lần này bạn ngồi gần cửa. Máy phải reo: Lưu Lực. Bạn tắt. Máy phải reo lần hai._
dan_dau_tu: *(thì thầm, ngồi kế bên)* {quan_ly_idol}. Hôm qua tui thấy thằng {idol_het_thoi} ở tiệm cầm đồ Cứu Nguy. Nó ôm cái cúp. Tui không biết nó cầm hay không.
* [💍 Họp xong chạy ra tiệm cầm đồ Cứu Nguy.]
    -> tiem_cam_do
* [📞 Nhắn {idol_het_thoi}: "Em còn giữ cúp hông?"]
    { RANDOM(1, 2) == 1:
        idol_het_thoi: Còn. Em đem về rồi. Em nhớ anh nói cái cúp là của hai anh em.
        _Bạn nhớ mình nói câu đó. Năm 2015, ở hậu trường, lúc {idol_het_thoi} say. Bạn tưởng {idol_het_thoi} quên rồi._
        ~ qh("idol_het_thoi", 10)
        ~ thai_gk(-3)
    - else:
        idol_het_thoi: …Anh đừng hỏi.
        _Bạn không hỏi nữa._
        ~ cang_thang(8)
    }
    -> END
* [😶 Không làm gì. Họp tiếp.]
    ~ cang_thang(5)
    -> END

= tiem_cam_do
_Tiệm cầm đồ Cứu Nguy. Cái cúp "Ca khúc của năm 2015" nằm trong tủ kính, giữa một nồi cơm điện và một cây đàn organ. Dán giá cầm: 6.000.000đ._
chu_tiem_cam_do: Chuộc hả con? Chuộc thì chính chủ phải ký. Con là ai của nó?
* [💸 "Con là quản lý. Con trả tiền, hẹn chính chủ ra ký."]
    chu_tiem_cam_do: Ừ. Tiền cọc thì giữ. Nó tới ký là lấy.
    _Bạn đặt cọc 6 triệu. Nhắn {idol_het_thoi}: "Ra tiệm cầm đồ ký giấy. Đừng hỏi." {idol_het_thoi} ra. {idol_het_thoi} ký. {idol_het_thoi} ôm cúp đi về, không nói câu nào, chỉ gửi bạn một cái sticker ôm._
    ~ tien_cong(-6000000)
    ~ qh("idol_het_thoi", 15)
    ~ thai_gk(-10)
* [😶 Đứng nhìn qua tủ kính rồi đi.]
    _Bạn chụp lại tấm hình cái cúp trong tủ kính. Không biết để làm gì._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1210_quan_oc ===
# ngay:12 # gio:21:30 # noi:quan_oc_dem
_Quán Ốc Đêm. Lương về, cả hẻm đi ăn ốc. Bàn công ty kê ba cái nối nhau. Bạn ngồi đầu bàn, hai điện thoại úp cạnh dĩa ốc len xào dừa._
sales: Anh {quan_ly_idol}! Tin chị đi, tháng sau chị book anh {idol_het_thoi} show 50 triệu bên BTT Global! Anh làm hợp đồng trước giùm chị nha!
_Phát ngồi đối diện, mắt sáng lên. 50 triệu. Gần đủ trả hết nợ._
_Bạn làm showbiz mười hai năm. Bạn biết show 50 triệu trông như thế nào. Nó không trông như {sales} lúc 9 giờ tối sau ba lon bia._
* [💰 "Ok em. Gửi anh hợp đồng có mộc đỏ, đặt cọc 30%. Anh ký liền."]
    sales: *(cười tươi, nhìn đi chỗ khác)* Dạ… để chị nhậu với bên đó rồi gửi anh.
    _Phát nhìn bạn, hiểu. Ánh mắt sáng lên lúc nãy tắt dần. Nhưng {idol_het_thoi} gật đầu với bạn, như cảm ơn vì không để mình hy vọng lâu._
    ~ qh("sales", -3)
    ~ qh("idol_het_thoi", 3)
    ~ uy_tin = uy_tin + 2
* [😇 "Em book được thì anh mừng. Mà {idol_het_thoi}, ăn ốc đi em, đừng chờ."]
    idol_het_thoi: *(gắp con ốc, cười)* Dạ. Em hông chờ đâu. Em quen rồi.
    _"Em quen rồi." Bạn nghe câu đó và uống hết ly trà đá._
    ~ qh("sales", 2)
    ~ thai_gk(-2)
* [🎤 "Thôi, khỏi BTT. {idol_het_thoi}, hát cho quán nghe một bài. Cát-xê là dĩa nghêu."]
    _Phát đứng dậy hát "Công Viên". Bàn bên là mấy chú xe ôm, hát to nhất. Cô chủ quán tặng thêm dĩa nghêu._
    _Bạn vỗ tay to nhất quán. Không ai để ý. {editor} ngồi cuối bàn để ý._
    ~ qh("idol_het_thoi", 8)
    ~ thai_gk(-5)
    ~ an(10)
- ~ an(35)
~ tien_cong(-150000)
~ thai_p(-5)
-> END
