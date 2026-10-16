// ============================================================
// QUẢN LÝ IDOL · CHƯƠNG 5: "HAI PHỐT MỘT NGÀY" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_2110_confession ===
# ngay:21 # gio:09:30 # noi:tang_1 # bat_buoc
~ thai_ly_ca_phe = 0
_Trang "Confession {cong_ty}" đăng bài ẩn danh: giám đốc thế chấp biệt thự để trả lương, công ty sống bằng tiền của Siêu Nhân Hồng. Cả tầng 1 im phăng phắc._
{ nguoi_theo_doi < 500000:
    _Mốc 3: 500.000 người theo dõi. Không đạt. Tin đồn cắt giảm nhân sự chạy khắp các bàn._
    ~ thai_tt(-5)
- else:
    _Mốc 3: 500.000 người theo dõi. Đạt. Nhưng không ai còn tâm trí ăn mừng._
}
_Máy phải rung. Tin nhắn từ số đầu đẹp: "Anh {quan_ly_idol}, bên em không thế chấp nhà ai để trả lương. Cà phê vẫn đang chờ anh. LL."_
_Máy trái rung. {sieu_nhan_hong}: "Anh {quan_ly_idol} ơi, công ty mình sắp sập hả anh? Có phải tại em hông?"_
* [📞 Trả lời Nguyên trước: "Không phải tại em. Em cứ làm việc của em. Chuyện này để anh lo."]
    sieu_nhan_hong: Dạ… em tin anh.
    _Ba chữ "em tin anh" nặng hơn cả hai cái điện thoại._
    ~ qh("sieu_nhan_hong", 8)
    ~ thai_tt(3)
* [🗑️ Xóa tin nhắn của LL. Chặn số.]
    _Ba phút sau, một số khác: "Anh chặn số này thì em dùng số khác. Em kiên nhẫn lắm."_
    ~ thai_tt(5)
* [😶 Không trả lời ai. Nhìn qua vách kính phòng giám đốc.]
    _{giam_doc} ngồi im, nhìn tấm bằng "Doanh nhân của năm". Bạn nhớ năm 2015, ở quán cà phê, {giam_doc} gọi ly bạc xỉu và nói "thằng bé này sẽ thành sao"._
    ~ thai_tt(3)
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2110_moc_ba ===
# ngay:21 # gio:15:00 # noi:phong_giam_doc
_{dan_dau_tu} gõ cửa phòng giám đốc, ôm laptop, mặt nghiêm túc tới mức lạ. {giam_doc} gọi bạn vào nghe cùng._
dan_dau_tu: Sếp. {quan_ly_idol}. Tui coi số liệu ba tuần. Khán giả không thích Nguyên khi Nguyên diễn. Họ thích Nguyên khi Nguyên đi giúp người thật. Clip bà cụ, clip kéo lưới, clip đẩy xe. Giữ chân gấp năm lần MV.
giam_doc: Thế thì sao? Cả chiến dịch đổi hướng à? Ba tuần nữa là Đại Nhạc Hội rồi!
_Cả hai quay sang bạn. Người cầm lịch của Nguyên._
* [🤝 "Đổi. Mình bớt quay, để Nguyên đi giúp người. Mình chỉ cần theo sau mà ghi lại."]
    giam_doc: *(im lâu)* …Anh không ép, tùy cậu. Cậu là người hiểu nó.
    _Lần đầu tiên "tùy cậu" của {giam_doc} nghĩa là "tùy cậu" thật._
    ~ follow(80000)
    ~ qh("dan_dau_tu", 10)
    ~ uy_tin = uy_tin + 5
    ~ thai_p(-15)
* [🗓️ "Đổi một nửa. Giữ lịch quay, thêm khung 'Hồng đi giúp người' mỗi ngày."]
    ~ follow(40000)
    ~ qh("dan_dau_tu", 5)
    ~ thai_p(-10)
* [😶 "Không đổi. Kế hoạch là kế hoạch."]
    dan_dau_tu: *(gập laptop)* Ừ. Tui chỉ đọc số thôi mà.
    ~ qh("dan_dau_tu", -5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2210_kiem_tra_thue ===
# ngay:22 # gio:10:30 # noi:phong_ke_toan # bat_buoc
~ thai_ly_ca_phe = 0
_Đoàn kiểm tra thuế. Trưởng đoàn Chú Liêm, 55 tuổi, kính lão. Cả công ty giả vờ chăm chỉ. {chua_te_deadline} mở Excel lần đầu trong đời._
chu_liem: Mục này. "Cát-xê ca sĩ độc quyền đi hát tiệc cưới." 37 khoản. Không hóa đơn khoản nào. Ai giải trình?
_{ke_toan} nhìn {idol_het_thoi}. {idol_het_thoi} nhìn bạn. Bạn nhìn {idol_het_thoi}, rồi nhìn Chú Liêm._
* [🛡️ Bước lên trước: "Dạ, lỗi do quản lý sắp xếp sai. Em nhận hết. Ca sĩ không biết gì đâu chú."]
    chu_liem: *(ghi biên bản)* Quản lý chịu trách nhiệm. Phạt hành chính, truy thu. Ký đây.
    _Bạn ký. Tay không run. {idol_het_thoi} đứng sau, bạn nghe {idol_het_thoi} thở rất mạnh._
    ~ thai_ganh()
    ~ tien_cong(-2000000)
    ~ qh("ke_toan", 3)
    ~ qh("idol_het_thoi", 5)
* [🤝 "Phát. Em giải trình đi. Anh đứng đây."]
    idol_het_thoi: *(nuốt nước bọt, bước lên)* Dạ… con nhận tiền mặt. Con không xin hóa đơn. Con khai từng đám ạ.
    _Phát khai 37 đám. Nhớ tên 31 cặp cô dâu chú rể. Chú Liêm nghe tới đám thứ 20 thì bắt đầu cười._
    chu_liem: Thôi được. Truy thu, không phạt. Lần sau xuất hóa đơn.
    _Phát quay lại nhìn bạn. Lần đầu tiên trong mười một năm, {idol_het_thoi} tự gỡ một chuyện._
    ~ qh("idol_het_thoi", 12)
    ~ uy_tin = uy_tin + 5
* [🐕 Nháy mắt với Bác {bac_bao_ve}. Bác thả {cho} lên lầu.]
    _Chú Liêm sợ chó. Rất sợ. Chú leo lên ghế. Buổi kiểm tra hoãn 40 phút. Bốn mươi phút đủ để {ke_toan} tìm ra 12 tờ hóa đơn "khai trương tiệm nail" có thể dùng thay thế._
    ~ qh("ke_toan", 5)
    ~ qh("cho", 5)
    ~ thai_kh(1)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2210_bai_xe ===
# ngay:22 # gio:19:10 # noi:bai_xe
_Bãi xe. Đoàn thuế đã về. Bạn ngồi trên yên xe máy, ly cà phê thứ sáu. Tay run nhẹ._
{ thai_ganh_ho > 0:
    -> phat_hoi
- else:
    _Phát đi tới, ngồi lên yên sau xe bạn, không nói gì. Ngồi vậy mười phút._
    ~ qh("idol_het_thoi", 3)
    -> hoi_clip
}

= phat_hoi
_Phát đi tới. Không đeo kính. Đứng trước mặt bạn._
idol_het_thoi: Anh. Sao anh nhận? Đó là tiền của em.
* [📱 "Anh là quản lý. Nhận là việc của anh. Vậy thôi."]
    idol_het_thoi: "Vậy thôi." Anh nói câu đó hoài.
    ~ thai_gk(5)
* [☕ "Tại anh muốn em được hát tiếp. Không phải đi giải trình."]
    _Phát đứng im. Rồi ngồi xuống yên sau xe bạn._
    ~ qh("idol_het_thoi", 8)
    ~ thai_gk(-8)
- -> hoi_clip

= hoi_clip
_Bạn mở điện thoại. Clip {editor} quay hôm mất điện: màn hình tối, giọng {idol_het_thoi}, tiếng cả công ty hát theo._
* [💬 "Phát. Anh muốn đăng clip này. Không ghi tên ai. Cứ để người ta nghe."]
    idol_het_thoi: *(xem hết clip, im lâu)* … Anh đăng đi. Đừng ghi tên em.
    ~ thai_clip_15_dang = true
    ~ qh("idol_het_thoi", 5)
    ~ qh("editor", 5)
* [🔒 Không hỏi. Giữ clip trong máy.]
    _Video đó nằm trong máy bạn, cạnh 2.200 tấm ảnh khác._
    ~ thai_gk(2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2310_mr_kevin ===
# ngay:23 # gio:15:30 # noi:phong_nghe_si
_Sinh nhật Nguyên. Livestream tối nay có tiết mục "Nhà tài trợ BTT Global chúc mừng". {sales} kéo bạn vào phòng, đóng cửa._
sales: Anh {quan_ly_idol}. Nói nhỏ nha. Mr. Kevin Trộn… bận. Mình cần người đóng vai. Mặc vest, đeo kính, nói tiếng Anh hai câu. Anh chọn giùm chị!
_Bạn nhìn {sales}. {sales} nhìn bạn. Không ai nói ra chữ "không có thật"._
* [🤵 Chọn {thuc_tap_sinh}: "Duy mặc vest nhìn giống giám đốc ngân hàng lắm."]
    thuc_tap_sinh: Dạ… em mặc vest hả anh? *(đứng thẳng, cài khuy, bỗng nhiên nhìn y như một trưởng phòng tín dụng)*
    _Bạn hơi rùng mình. Không biết vì sao._
    ~ qh("thuc_tap_sinh", 5)
    ~ follow(5000)
* [🤵 Chọn {dan_dau_tu}: "Ông {dan_dau_tu} nói tiếng Anh như đọc chart coin."]
    dan_dau_tu: "To the moon!" Được hông?
    sales: Được! Tin chị đi!
    ~ qh("dan_dau_tu", 5)
    { RANDOM(1, 10) <= 4:
        _Giữa livestream, một chủ nợ của {dan_dau_tu} nhận ra anh ta trong bộ vest. Bình luận: "Ủa Mr. Kevin nợ tui 500 nghìn"._
        ~ thai_kh(1)
    }
* [🤵 Chọn Bác {bac_bao_ve}: "Bác {bac_bao_ve} ít nói. Càng ít nói càng giống chủ tịch."]
    bac_bao_ve: *(nhận bộ vest, nhìn rất lâu)* Bác đóng. Nhưng bác không nói tiếng Anh đâu. Bác gật đầu thôi.
    _Tối đó Bác gật đầu bốn lần trên livestream. Bình luận: "Ông chủ tịch này khí chất ghê"._
    ~ qh("bac_bao_ve", 8)
    ~ follow(8000)
* [😤 "Không. Chuyện này anh không dính vô."]
    sales: *(hơi khựng)* Ừ… ok anh. Chị tự lo.
    ~ qh("sales", -5)
    ~ uy_tin = uy_tin + 2
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2310_livestream ===
# ngay:23 # gio:19:20 # noi:studio # bat_buoc
_Livestream sinh nhật Siêu Nhân Hồng, 31 tuổi. 40.000 người xem. Bạn đứng sau máy quay với hai điện thoại và một kịch bản chạy chương trình 14 trang._
_Trang 9 không có trong kịch bản: {sieu_nhan_hong} quay thẳng vào camera._
sieu_nhan_hong: Anh {chua_te_deadline} ơi. Em thích anh. Không phải PR đâu.
_Bình luận nổ tung: "VũƠiTrảLờiĐi". {chua_te_deadline} đứng sau máy quay, trắng như bột mì. Bạn đứng cạnh, cũng trắng._
~ thai_kh(1)
_Rồi {cho} lách qua chân máy quay. Cái bánh kem hồng ba tầng đổ ụp._
{ RANDOM(1, 2) == 1:
    _Phát đang đứng cạnh bàn bánh. {idol_het_thoi} nhảy lên, bắt nhịp "Công Viên" thật to. Cả studio hát theo._
    ~ follow(10000)
- else:
    _Phát đứng ngay cạnh bàn bánh. Bạn không chắc {idol_het_thoi} có vấp không. Bạn không muốn chắc._
}
_Máy phải: đạo diễn livestream: "ANH THÁI ƠI THÔNG CÁO!" Bốn phút trước khi báo mạng đăng bài._ # hen_gio:6
* [🧯 Viết thông cáo: "Đó là kịch bản. Cả bánh, cả lời tỏ tình. Cảm ơn mọi người đã xem tới giây cuối."]
    _Ba phút năm mươi giây. Thông cáo lên. Phốt đổ bánh chìm. Phốt tỏ tình… thì không ai tin là kịch bản._
    ~ thai_dap()
    ~ follow(10000)
* [💬 Viết: "Bánh đổ là thật. Lời nói cũng thật. Mời mọi người ăn bánh online."]
    _Bình luận: "Thật lòng quá", "Hông dàn dựng gì hết hả trời". Người xem tăng lên 60.000._
    ~ follow(30000)
    ~ qh("sieu_nhan_hong", 10)
    ~ qh("chua_te_deadline", -3)
    ~ thai_kh(1)
* [🙏 Nhờ {hong_hot} xin các trang gỡ clip bánh đổ.]
    hong_hot: Em gọi liền! *(5 phút sau)* Anh ơi… bên kia nghe em xin gỡ, họ còn ghim lên đầu trang luôn…
    ~ thai_kh(1)
    ~ qh("hong_hot", 2)
* [⏱️ (Không chọn kịp)]
    _Bốn phút trôi qua. Báo mạng đăng: "Sinh nhật Siêu Nhân Hồng: bánh đổ, tỏ tình, quản lý ở đâu?"_
    ~ thai_kh(2)
- ~ thai_p(-20)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_2410_hai_phot ===
# ngay:24 # gio:09:00 # noi:phong_nghe_si # bat_buoc
~ thai_ly_ca_phe = 0
~ thai_phat_bi_boc = true
~ phat_hien(fan_ao_phat)
_Ngày Liên Hợp Quốc. 7 giờ sáng, hai chuyện nổ cùng lúc._
_Một: bài bóc phốt "Ca sĩ một bài thuê 80.000 fan ảo", kèm 500 ảnh chụp bình luận "Anh {idol_het_thoi} đỉnh nóc kịch trần"._
{ thai_clip_15_dang:
    _Hai: clip "Ai đang hát trong bóng tối" lên xu hướng. Người ta chửi fan ảo, mà vẫn bấm nghe lại bài hát._
    ~ follow(30000)
- else:
    _Hai: có người tìm ra clip {idol_het_thoi} giật micro ở gameshow, ghép chung với bài bóc phốt. Tiêu đề: "Toàn cảnh một idol hết thời"._
    ~ follow(-10000)
}
~ thai_kh(2)
{ thai_phat_huy_fan_ao:
    _Gói fan ảo đã hủy từ lâu. Nhưng ảnh chụp màn hình thì không ai hủy được._
}
hong_hot: *(gọi tới)* Anh {quan_ly_idol} ơi! Anh muốn em làm gì? Em quen hết admin mấy trang!
* [🧯 Tự viết thông cáo. Nhận một phần lỗi: "Do quản lý tư vấn sai."]
    _Sáu tiếng sau, phốt chìm. Trong thông cáo, câu "Do quản lý tư vấn sai" được in đậm._
    ~ thai_ganh()
    ~ thai_dap()
    ~ follow(-10000)
* [🙏 "Em nhờ admin gỡ bài giùm anh."]
    hong_hot: Gét gô! *(2 tiếng sau)* Anh ơi… một trang gỡ, hai trang đăng lại kèm ảnh chụp "trang kia đã gỡ"…
    ~ thai_dap()
    ~ thai_kh(1)
    ~ follow(-20000)
* [📞 Gọi {idol_het_thoi}: "Em tự viết. Viết thật. Anh đọc trước, không sửa chữ nào."]
    idol_het_thoi: *(im lâu)* … Em viết nha anh.
    _Phát viết: "Tôi đã thuê fan ảo. Vì tôi sợ bị quên. Tôi xin lỗi những người thật đã ở lại." Bạn đọc. Không sửa chữ nào. Bấm đăng._
    ~ thai_phat_huy_fan_ao = true
    ~ thai_phat_fan_ao = 0
    ~ follow(-10000)
    ~ qh("idol_het_thoi", 10)
    _Hai ngày sau, bài nhận lỗi có 300.000 lượt chia sẻ._
    ~ thai_kh(-1)
* {thai_clip_15_dang} [🔒 "Ghim clip bóng tối lên đầu kênh. Ghi một dòng: 'Đây là giọng thật.'"]
    _Bạn ghim clip. {idol_het_thoi} hủy gói fan ảo cùng giờ. Người ta đọc phốt fan ảo, rồi bấm vào clip, rồi nghe tới hết. Phốt lật._
    ~ thai_phat_huy_fan_ao = true
    ~ thai_phat_fan_ao = 0
    ~ thai_dap()
    ~ thai_dap()
    ~ follow(40000)
    ~ qh("idol_het_thoi", 8)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2410_hoa_giai ===
# ngay:24 # gio:14:00 # noi:phong_hop_tang_2
_"Hội nghị hòa giải" của {chi_dai}. Bảng tên xếp cặp: {truong_phong}–{con_ong_chau_cha}, {designer}–{bien_kich}, {sales}–{ke_toan}, {hr}–{thanh_xin_nghi}, {chi_dai}–{thanh_ninh}. Một "bàn chủ nợ" cho {dan_dau_tu}._
_Bạn không có bảng tên. {chi_dai} đẩy bạn ngồi vào một cái bàn phụ trong góc. Ở đó đã có {editor}, đang ngủ gục._
chi_dai: Hai đứa mắt thâm nhất công ty. Ngồi đây. Không cần hòa giải, cần ngủ.
_{editor} tỉnh dậy. Thấy bạn. Ngồi thẳng lưng ngay lập tức._
* [😊 "Ngủ tiếp đi {editor}. Anh canh cho."]
    editor: Dạ… em ngủ được hả anh?
    _{editor} gục xuống lại. Không ngủ. Bạn biết vì tai {editor} đỏ suốt hai tiếng._
    ~ qh("editor", 8)
    ~ thai_p(10)
* [📱 Mở laptop, viết tiếp thông cáo phốt sáng nay.]
    _{editor} nhìn màn hình bạn. "Anh để em dựng clip xin lỗi cho anh {idol_het_thoi} nha. Em làm nhanh." Bạn gật đầu. {editor} dựng trong 40 phút._
    ~ qh("editor", 5)
    ~ thai_dap()
* {thai_nguoi_dung_dem} [💬 "Lĩnh. Em có bao giờ… lo cho ai đó mà người ta không biết hông?"]
    editor: *(nhìn bạn rất lâu)* … Dạ có.
    quan_ly_idol: Mệt hông?
    editor: Dạ mệt. Mà… không lo thì còn mệt hơn.
    _Hai người ngồi im. Cả hai đều nghĩ người kia đang nói về một người khác._
    ~ qh("editor", 10)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2410_dem_thuc ===
# ngay:24 # gio:23:40 # noi:studio_0905
_Đêm thứ hai không ngủ. 47 bài báo chờ gỡ. Máy trái: 8%. Máy phải: 14%. Năm cục sạc đều đang cắm._
{ thai_pin < 20:
    _Mắt bạn mờ. Chữ trên màn hình nhảy múa. Bạn đứng dậy lấy nước, phải vịn bàn._
}
_Ting. Tin nhắn từ {editor}: "Anh {quan_ly_idol}, em để ly cà phê ở cửa phòng anh. Đen đá ít đường. Em đi rồi."_
_Bạn mở cửa. Có một ly cà phê. Và một hộp cơm còn nóng._
* [☕ Uống cà phê, ăn cơm, làm tiếp.]
    ~ thai_ca_phe()
    ~ an(40)
    ~ qh("editor", 5)
* [😴 Ăn cơm. Rồi ngủ hai tiếng. Phốt để sáng tính.]
    ~ an(40)
    ~ thai_p(40)
    ~ nghi(30)
    ~ thai_kh(1)
* [📱 Nhắn {editor}: "Sao em biết anh uống đen đá ít đường?"]
    editor: Dạ… anh {idol_het_thoi} nói.
    _Phát biết. {idol_het_thoi} nói với {editor}. Bạn ngồi nhìn ly cà phê rất lâu._
    ~ thai_gk(-5)
    ~ qh("editor", 5)
    ~ thai_ca_phe()
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2510_ba_gio_sang ===
# ngay:25 # gio:03:00 # noi:cau_thang_sky_ao # bat_buoc
_3 giờ sáng. Bạn mang laptop ra cầu thang bộ Sky Ảo ngồi, vì trong phòng ngột ngạt. Chiếu nghỉ tầng 9. Hai điện thoại cắm sạc dự phòng._
_Tiếng bước chân từ trên xuống. {idol_het_thoi}. Không đeo kính. Ngồi xuống bậc thang cạnh bạn._
idol_het_thoi: Anh {quan_ly_idol}. Hai đêm rồi anh hông ngủ. Hồi trước em bị phốt anh cũng vậy. Sao anh lo cho em dữ vậy?
* [📱 "Thì anh là quản lý của em mà. Lo là việc của anh."]
    _Phát gật đầu. Đứng dậy. Đi về._
    _Bạn ngồi lại một mình rất lâu. Laptop sập nguồn lúc 5 giờ._
    ~ thai_gk(10)
* [☕ "Tại anh muốn có một người được hát cho tới già."]
    _Phát nhìn bạn. Chưa hiểu hết. Nhưng không đi về._
    idol_het_thoi: …Người đó là em hả?
    quan_ly_idol: Ừ.
    _Hai người ngồi tới sáng. Không ai nói thêm gì._
    ~ thai_gk(-20)
    ~ qh("idol_het_thoi", 20)
* {thai_giau_kin <= 40} [🔒 Lấy điện thoại, mở nhóm "Hội Cá Viên Chiên", đưa cho {idol_het_thoi} xem tên admin.]
    _Phát đọc: "ChuoiChien89". Kéo lên. Mười năm tin nhắn. Đêm nào cũng một câu: "Anh {idol_het_thoi} hôm nay vẫn hát."_
    _Phát không nói gì. Chỉ ngồi xích lại, sát cạnh bạn. Vai chạm vai. Như đêm lửa trại, chỉ khác là lần này {idol_het_thoi} tỉnh._
    idol_het_thoi: *(rất nhỏ)* Ba đêm anh quên đăng… em hát ở đâu?
    quan_ly_idol: Một đêm em bệnh. Hai đêm em say, hát karaoke.
    idol_het_thoi: Anh nhớ hết hả?
    quan_ly_idol: Ừ.
    ~ thai_mo_doi_ban_than = true
    ~ thai_gk(-20)
    ~ qh("idol_het_thoi", 25)
    ~ phat_hien(thai_thuong_phat)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2510_toa_ll ===
# ngay:25 # gio:10:00 # noi:toa_ll # bat_buoc
_Chủ nhật. Tòa nhà kính xanh lá chuối, Ven Đô, tầng 20. Qua cửa kính, bạn thấy tòa nhà tím của {cong_ty} bên kia đường, nhỏ như một hộp diêm._
_Lưu Lực, vest trắng, tóc vuốt keo, đặt một tập hợp đồng lên bàn kính. Ly cà phê của bạn: đen đá ít đường. Ai đã nói cho Lưu Lực biết?_
luu_luc: Anh {quan_ly_idol}, mười hai năm anh gánh cái công ty sắp sập đó. Bên em: 36 triệu, phòng riêng, hai trợ lý, khỏi cầm hai điện thoại. Anh chỉ cần dắt theo Nguyên.
luu_luc: Còn {idol_het_thoi}… thì thôi, anh hiểu mà.
* [✍️ "Đưa bút đây."]
    _Bạn ký. Chữ ký của bạn trên giấy xanh lá chuối trông lạ lẫm như chữ người khác._
    luu_luc: *(mỉm cười)* Tuyệt vời. Hạn chót: Đại Nhạc Hội. Không có Nguyên thì hợp đồng này là giấy lộn.
    ~ thai_ky_ll = true
    ~ thai_mo_dat_nguyen = true
    ~ thai_tt(-50)
    ~ phat_hien(ll_moi_thai)
* [🚪 "Phát không phải 'thì thôi'. Em giữ ly cà phê này, coi như anh đã trả."]
    _Bạn đặt tiền ly cà phê lên bàn, đứng dậy. Lưu Lực không cản._
    luu_luc: Anh sẽ đổi ý trước 27. Em sẽ nhắn anh mỗi ngày.
    ~ thai_tt(20)
    ~ thai_tu_choi_ll = true
* [🤔 "Cho anh suy nghĩ tới 27."]
    luu_luc: Được. Em chờ. Em giỏi chờ lắm.
    _Lúc bước ra sảnh, bạn thấy một bóng người đội mũ lưỡi trai quen quen vừa quay mặt đi. Hình như là {thanh_xin_nghi}. Hôm nay bán kết "Giọng Ca Ước Mơ" ở đài, ngay gần đây._
    { RANDOM(1, 10) <= 4:
        _Chiều đó {hong_hot} nhắn: "Anh {quan_ly_idol}, nghe gì chưa? Có người thấy anh ở tòa LL đó!" Phốt nhỏ._
        ~ thai_kh(1)
    }
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2610_giao_ban ===
# ngay:26 # gio:08:30 # noi:phong_hop_tang_2
~ thai_ly_ca_phe = 0
_Thứ 2. Tin đồn "cắt giảm nhân sự nếu Siêu Nhân Hồng thất bại" chạy khắp công ty. {hr} đi ngang bàn nào, bàn đó tắt màn hình._
_Chiều nay chiếu thử phim ngắn "Người Hùng Không Tên". Tối qua bán kết "Giọng Ca Ước Mơ" của {thanh_xin_nghi}; sáng nay {thanh_xin_nghi} đi làm đúng giờ, khàn giọng._
giam_doc: {quan_ly_idol}. Thứ 6 họp đánh giá. Hợp đồng thằng {idol_het_thoi}. Cậu chuẩn bị cho anh một lý do để gia hạn. Một thôi. Thật.
* [📊 "Clip hát trong bóng tối, 2 triệu lượt nghe thật. Không có cái nào là ảo."]
    { thai_clip_15_dang:
        giam_doc: *(gật đầu chậm)* Ừ. Anh có nghe. Anh nghe ba lần.
        ~ qh("giam_doc", 5)
    - else:
        giam_doc: Clip nào? Anh chưa thấy ai đăng.
        _Clip vẫn nằm trong máy bạn._
    }
* [📖 "Nó là người duy nhất ở đây từng nổi tiếng thật. Mình cần người biết cảm giác đó để giữ Nguyên."]
    giam_doc: *(im lâu)* Lý do đấy nghe giống lý do của cậu hơn của nó.
    ~ thai_gk(-5)
    ~ qh("giam_doc", 3)
* [😶 "Để em nghĩ."]
    giam_doc: Nghĩ nhanh lên. Anh cũng đang nghĩ.
- { thai_doi_lich_son >= 1 and not thai_to_son:
    thanh_xin_nghi: *(đi ngang, thì thầm)* Anh {quan_ly_idol}. Em vô chung kết. Đêm 31. 20 giờ. Cùng giờ Đại Nhạc Hội.
    _Bạn nhìn {thanh_xin_nghi}. Rồi nhìn lịch Đại Nhạc Hội Siêu Nhân. Hai khung giờ chồng lên nhau như hai khối gạch._
}
-> END

// ------------------------------------------------------------
=== quan_ly_idol_2710_nguyen_hoi ===
# ngay:27 # gio:10:30 # noi:phong_cho # bat_buoc
~ thai_ly_ca_phe = 0
_LL ra tay. 10 giờ sáng, lời mời chính thức tới tay Nguyên: Lưu Lực lăng xê miễn phí, trả gấp ba 5 tỷ. Cả công ty im lặng như có tang._
_Phòng chờ. {sieu_nhan_hong} ngồi một mình, đã tháo mũ. Cầm tờ hợp đồng xanh lá chuối._
sieu_nhan_hong: Anh {quan_ly_idol}. Anh nói em nên đi hông?
_Đây là lựa chọn lớn nhất của bạn trong mười hai năm. Lớn hơn năm 2018._
{ thai_ky_ll:
    -> da_ky
- else:
    -> chua_ky
}

= da_ky
_Hợp đồng của bạn với LL nằm trong túi áo. Không có Nguyên thì nó là giấy lộn._
* [💚 "Đi với anh. Bên đó có người lo cho em. Có anh."]
    sieu_nhan_hong: *(nhìn bạn lâu)* … Anh đi hả? Còn anh {idol_het_thoi}?
    _Bạn không trả lời câu thứ hai._
    sieu_nhan_hong: Dạ… nếu anh đi, em đi.
    ~ thai_dat_nguyen_di = true
    ~ nguyen_theo_ll = true
    ~ thai_trung_thanh = 0
    ~ qh("idol_het_thoi", -30)
    ~ phat_hien(ll_moi_nguyen)
* [😇 Lấy hợp đồng LL trong túi ra, xé đôi. "Ở lại em. Anh cũng ở lại."]
    sieu_nhan_hong: *(tròn mắt)* Anh… anh ký rồi hả? Rồi anh xé?
    quan_ly_idol: Ký lúc mệt. Xé lúc tỉnh.
    ~ thai_ky_ll = false
    ~ thai_tu_choi_ll = true
    ~ thai_tt(40)
    ~ qh("sieu_nhan_hong", 15)
- -> END

= chua_ky
* [💚 "Đi đi. Anh đi với em."]
    _Bạn gọi Lưu Lực. Chiều đó, bạn ký. Tối đó, Nguyên ký._
    ~ thai_ky_ll = true
    ~ thai_dat_nguyen_di = true
    ~ nguyen_theo_ll = true
    ~ thai_trung_thanh = 0
    ~ qh("idol_het_thoi", -30)
    ~ phat_hien(ll_moi_nguyen)
* [🛡️ "Ở lại. Em hứa với cả công ty rồi. Anh cũng ở lại."]
    sieu_nhan_hong: *(đội mũ lại, đứng dậy, tạo dáng)* Dạ! Hồng không phải màu, Hồng là thái độ! Ở lại!
    ~ thai_tu_choi_ll = true
    ~ thai_tt(15)
    ~ qh("sieu_nhan_hong", 10)
* [🤝 "Chuyện hợp đồng anh lo. Còn chuyện ở hay đi… em hỏi người em muốn hỏi."]
    sieu_nhan_hong: *(im lâu, rồi gật)* Dạ. Em biết em muốn hỏi ai rồi.
    _Tối đó, 23 giờ 47, Nguyên nhắn cho một người. Không phải bạn, không phải {giam_doc}._
    { qh_sieu_nhan_hong >= 30 or RANDOM(1, 10) <= 7:
        _1 giờ sáng, Nguyên nhắn bạn: "Em ở lại anh nha." Bạn nhắn cho {chua_te_deadline}: "Cảm ơn em." {chua_te_deadline} không hỏi vì sao._
        ~ qh("sieu_nhan_hong", 10)
    - else:
        _1 giờ sáng, Nguyên nhắn bạn: "Anh ơi… em nhận lời LL rồi." Bạn ngồi nhìn màn hình tới sáng._
        ~ nguyen_theo_ll = true
        ~ thai_kh(2)
    }
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2710_san_thuong ===
# ngay:27 # gio:12:30 # noi:san_thuong
_Sân thượng. Ghế nhựa, cây phơi đồ. Bạn hẹn {thanh_xin_nghi} lên đây. Ở góc sân thượng, {editor} đang ngủ trên ghế bố, mũ trùm mặt. Bạn tưởng {editor} ngủ._
{ thai_dat_nguyen_di:
    quan_ly_idol: {thanh_xin_nghi}. Anh đi LL. Kèm Nguyên. Em đi với anh hông? Bên đó không ai bắt giấy phòng khám.
- else:
    quan_ly_idol: {thanh_xin_nghi}. LL mời anh 36 triệu. Kèm Nguyên. Anh… chưa trả lời hẳn. Em nghĩ sao?
}
{ not thai_to_son and qh_thanh_xin_nghi >= 30:
    thanh_xin_nghi: Anh {quan_ly_idol}. Trước khi anh quyết, em kể anh nghe một chuyện. Em… đi thi hát. "Giọng Ca Ước Mơ". Vô chung kết rồi.
    _Bạn im. Rồi bật cười._
    quan_ly_idol: Thảo nào bà ngoại em ốm đúng tối thứ 7.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 15)
- else:
    thanh_xin_nghi: Anh {quan_ly_idol} đi đâu em đi đó. Mà… còn anh {idol_het_thoi} thì sao?
}
* [🎤 "Sơn. Chung kết đêm 31, 20 giờ. Anh đổi lịch cho em. Đêm đó anh lo Nguyên một mình."]
    thanh_xin_nghi: *(mắt đỏ)* Anh… anh đổi thiệt hả?
    ~ thai_doi_lich_son = thai_doi_lich_son + 1
    ~ qh("thanh_xin_nghi", 15)
    ~ thai_p(-10)
* [💬 "Còn {idol_het_thoi}… anh không bỏ được."]
    thanh_xin_nghi: *(nhìn bạn rất lâu)* Em biết. Em thấy anh nhìn ảnh ở đâu đó hoài. Em nói nhỏ thôi.
    _Bạn đỏ mặt. Cả hai điện thoại cùng reo. Bạn cúp cả hai._
    ~ thai_gk(-10)
    ~ thai_tt(10)
    ~ qh("thanh_xin_nghi", 5)
* [😶 "Thôi. Quên chuyện anh vừa hỏi đi."]
    thanh_xin_nghi: Dạ. Mà em không quên được đâu anh.
- _Ở góc sân thượng, cái mũ trên mặt {editor} khẽ động. {editor} không ngủ. {editor} đã nghe hết._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_2710_ho_so ===
# ngay:27 # gio:15:10 # noi:sanh_cong_ty
_Sảnh tầng trệt. Lưu Lực tới tận nơi, ôm tập hồ sơ bìa xanh lá chuối "Dự án Hồng Ngoại", đến tìm bạn và Nguyên._
_Lưu Lực đi ngang qua {chi_dai}. Khựng lại như thấy ma. Tập hồ sơ rơi xuống sàn, giấy tung tóe. {chi_dai} chỉ nhìn. Lưu Lực lau mồ hôi qua lớp keo tóc._
luu_luc: Ờ… chào chị. Tôi tới gặp anh {quan_ly_idol} và Siêu Nhân Hồng.
_Bạn cúi xuống nhặt giấy. Bìa hồ sơ là một bộ nhận diện rất đẹp. Font chữ này bạn thấy ở đâu rồi: trên tấm găng tay "Hồng Thái Độ" mà {designer} nhuộm._
* [💬 Đưa bìa hồ sơ cho {designer} xem, nhẹ nhàng: "Quen hông em?"]
    designer: *(mặt trắng bệch)* Anh… em tưởng là làm cho idol mới…
    quan_ly_idol: Anh không nói ai. Em tự quyết làm gì với nó.
    ~ qh("designer", 10)
* [😤 Ném hồ sơ lại cho Lưu Lực: "Anh về đi. Nghệ sĩ của tôi không bán."]
    luu_luc: *(liếc {chi_dai}, lùi một bước)* Được. Được. Tôi về.
    _{chi_dai} gật đầu với bạn. Cái gật đầu hiếm hoi nhất công ty._
    ~ qh("chi_dai", 10)
    ~ thai_tt(10)
* [🤝 "Lên phòng họp, mình nói chuyện đàng hoàng."]
    _Bạn dẫn Lưu Lực lên lầu. Bác {bac_bao_ve} nhìn theo, uống trà: "Người gì mà mùi như lá chuối."_
    ~ thai_tt(-5)
- -> END
