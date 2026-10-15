// ============================================================
// HR: TUẤN · CHƯƠNG 6: "NGƯỜI TẮT ĐÈN" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== hr_2810_video_linh ===
# ngay:28 # gio:10:00 # noi:phong_hr # bat_buoc
_10 giờ sáng. Fanpage công ty vừa đăng một video lạ: những đoạn dựng tay, tỉ mỉ, toàn cảnh {quan_ly_idol} cầm 2 điện thoại, ngủ gục trong xe, cười với {idol_het_thoi}. Dòng cuối: "Anh có biết là có người luôn nhìn anh không?"_
_Video lên fanpage do lỗi xuất file. Người dựng là ai thì cả công ty đoán được trong 3 phút._
_Cửa phòng HR mở. {editor} đứng đó, giữa ban ngày, mắt đỏ, không ngáp._
editor: Anh {hr}… em tự lên. Em biết là em sai quy trình đăng bài. Anh kỷ luật em đi.
~ hr_so_nguoi_tu_len = hr_so_nguoi_tu_len + 1
* [🍵 "Ngồi đi em. Uống trà hoa cúc, cái hộp anh mua cho em hôm khám mắt đó. Rồi mình tính."]
    ~ hr_tra()
    ~ hr_nghe(8)
    ~ qh("editor", 10)
    editor: *(ôm ly trà)* Em… dựng video đó 3 tháng. Em chưa bao giờ định cho ai coi.
    hr: Video đẹp. Đẹp tới mức anh xem hai lần.
    _{editor} bật khóc. Lần đầu có người khóc trong phòng HR mà không phải vì bị đuổi._
* [📓 "Vi phạm quy trình đăng bài, anh ghi biên bản nha."]
    ~ hr_so(5)
    ~ qh("editor", -10)
    editor: Dạ. *(gật đầu, đi ra, quên luôn cả cái ly đang cầm)*
* [🤝 "Em chưa xóa video đúng hông? Đừng xóa. 40.000 người xem rồi. Người ta thả tim, không ai chê."]
    ~ follow(15000)
    ~ qh("editor", 5)
    editor: *(nhìn điện thoại)* …Thật hả anh?
    _Ở hành lang, {quan_ly_idol} đứng nhìn điện thoại rất lâu, không nghe cuộc gọi nào._
- -> END

// ------------------------------------------------------------
=== hr_2810_moc_4 ===
# ngay:28 # gio:16:00 # noi:phong_hop_sang_tao # bat_buoc
_Mốc 4: 800.000 người theo dõi. Cũng hôm nay, bộ lọc của {dan_dau_tu} lần ra 80.000 tài khoản fan ảo của {idol_het_thoi}. Phòng họp nặng như chì._
{ nguoi_theo_doi >= 800000:
    dan_dau_tu: 800 ngàn! Còn 200 ngàn nữa thôi! Lần này là lên thật, thật, thật!
    _{giam_doc} nhắm mắt, thở ra. Rồi nhìn bạn qua bàn. Một cái gật đầu rất khẽ._
    ~ hr_ds(-2)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
- else:
    dan_dau_tu: Ờ… chưa. LL có cớ rồi đó anh.
    _{giam_doc} không nói gì. Ông ấy chỉ đẩy tập hồ sơ hồng của mình sát về phía bạn thêm 10 cm._
    ~ hr_ds(1)
    ~ cang_thang(10)
}
_Họp xong, {idol_het_thoi} ngồi lại một mình, kính đen trong phòng kín._
* [🍵 Ngồi xuống cạnh {idol_het_thoi}: "Ông muốn kể hông? Không ghi sổ."]
    idol_het_thoi: Em biết anh là ai không? *(rồi tự tháo kính)* …Thôi. Tui nợ 54 triệu. Fan ảo là tui thuê. Hợp đồng tui hết hạn 31/10. Ông là HR, ông biết hết rồi còn gì.
    hr: Biết. Nhưng chưa ai kể. Giờ thì có ông kể.
    ~ qh("idol_het_thoi", 10)
    ~ hr_nghe(5)
    ~ hr_so_nguoi_tu_len = hr_so_nguoi_tu_len + 1
* [📋 "Ông {idol_het_thoi}, mai họp đánh giá có gia hạn hợp đồng của ông. Ông chuẩn bị tinh thần."]
    idol_het_thoi: *(đeo kính lại)* Fan anh đông lắm em. Anh không lo.
    ~ hr_so(2)
- -> END

// ------------------------------------------------------------
=== hr_2910_cham_cong_giay ===
# ngay:29 # gio:07:30 # noi:cong_cong_ty # bat_buoc
_Ngày Internet Quốc tế. Wifi sập từ 6 giờ sáng. Máy chấm công vân tay không đồng bộ. {it} bị cả công ty truy đuổi từ cổng tới sân thượng._
_Bạn mang một cuốn sổ, một cây bút, một cái ghế đẩu, ngồi ở cổng cạnh {bac_bao_ve}. Chấm công bằng tay._
~ hr_dung_cong_29 = true
bac_bao_ve: Cháu ngồi đây cả ngày à? Ghế đẩu đau lưng lắm đấy.
hr: Dạ, hôm nay con làm Bác {bac_bao_ve} một ngày.
bac_bao_ve: Ừ. Thế thì nhìn cho kỹ.
_7 giờ: {thuc_tap_sinh} tới đầu tiên, như mọi ngày, chào bác, chào bạn, chào cả {cho}. 7 giờ 40: {chi_dai}, xách theo hai hộp cơm, một hộp đưa {bac_bao_ve}. 8 giờ 03: {chua_te_deadline}… đi cửa trước. Lần đầu tiên._
chua_te_deadline: Ủa sao anh ngồi đây? À wifi sập. Chill. Ghi em 8 giờ đúng nha. *(nháy mắt)*
* [📓 Ghi đúng: 8 giờ 03.]
    ~ hr_so(2)
    chua_te_deadline: Ok mom.
* [😇 Ghi 8 giờ 03, kèm chú thích: "Đi cửa trước. Lần đầu."]
    ~ qh("chua_te_deadline", 5)
    chua_te_deadline: *(đọc, cười)* Anh ghi vậy là em được khen hay bị chê?
    hr: Được ghi nhận.
- _Bạn ngồi ở cổng cả buổi sáng. Bạn thấy ai đi sớm, ai đi trễ, ai đứng ở bãi xe gọi điện thoại một mình 15 phút trước khi vào._
-> END

// ------------------------------------------------------------
=== hr_2910_tong_dai_giay ===
# ngay:29 # gio:13:00 # noi:chong_bao_ve
_Chiều. Không mạng, chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Ai cần nhắn ai thì viết giấy, {cho} ngậm đi giao (giao sai 50%). {chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua"._
_Video tổng kết "16 năm" của {editor} kẹt ở 99%. Cả công ty đứng nhìn thanh tiến trình như nhìn người bệnh._
_Một tờ giấy được đưa tới cho bạn. Chữ của {giam_doc}: "Mai họp đánh giá. Em mang tập hồ sơ lên. Anh."_
* [✍️ Viết trả lời: "Dạ." Gửi theo {cho}.]
    _{cho} ngậm giấy, chạy lên tầng 2, rồi đem tờ giấy về… ổ của mình dưới gầm cầu thang._
    ~ qh("cho", 3)
* [✍️ Viết trả lời: "Anh ơi, mai cho em nói trước 5 phút, trước khi đọc danh sách."]
    _Lần này bạn tự mang lên. 15 phút sau, giấy trả lời: "Ừ. 5 phút. Không họp lâu nhé. Đừng giống {truong_phong}."_
    ~ qh("giam_doc", 3)
- _Bạn quay về cổng. {bac_bao_ve} đang ghi tay một sổ nữa, cũ hơn sổ của bạn nhiều. Sổ ra vào 16 năm._
bac_bao_ve: Bác ghi thế này từ năm 2010. Ai về muộn nhất, bác biết hết. Không ai biết bác biết.
* [💬 "Bác ơi, ai hay về muộn nhất vậy bác?"]
    bac_bao_ve: Thằng {editor}, thằng {it}, cái {ke_toan}. {giam_doc} nữa, dạo này. Và… cháu, mấy hôm cuối tuần trước.
    _Bạn không biết là bác để ý cả mình._
    ~ qh("bac_bao_ve", 5)
* [🍵 Pha trà cho bác, ngồi im cùng bác.]
    ~ hr_tra()
    ~ qh("bac_bao_ve", 5)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== hr_2910_ve_muon ===
# ngay:29 # gio:21:00 # noi:cong_cong_ty
_9 giờ tối. Bạn vẫn ngồi ở cổng. {bac_bao_ve} đã ngủ trong chòi, radio còn mở rè rè. Tầng 2 vẫn sáng 3 ô cửa sổ._
_Ô thứ nhất: phòng dựng phim. {editor} ngồi canh video 99%. Ô thứ hai: phòng server, {it} đang cầm đèn pin chui dưới gầm bàn. Ô thứ ba: phòng kế toán. {ke_toan} gục trên chồng chứng từ._
_Trong tập hồ sơ hồng, cả ba cái tên đều có thể bị gạch hoặc bị viết._
* [✍️ Mở tập hồ sơ hồng dưới ánh đèn cổng. Gạch bớt một tên.]
    ~ hr_ds(-1)
    _Bạn gạch một cái tên. Người đó đang ngồi trên kia, làm việc tới 9 giờ tối, không biết mình vừa được giữ lại._
    ~ hr_nghe(3)
* [🍵 Mang 3 ly trà lên 3 phòng.]
    ~ hr_tra()
    _{editor} nói "cảm ơn anh" không ngáp. {it} nói "để đó". {ke_toan} không nói gì, chỉ đẩy qua cho bạn một gói bánh quy._
    ~ qh("editor", 3)
    ~ qh("it", 3)
    ~ qh("ke_toan", 3)
    ~ an(10)
* [😶 Về nhà.]
    _Bạn tắt đèn cổng. Không, đèn cổng là việc của {bac_bao_ve}. Bạn để nó sáng._
- _10 giờ 47, wifi trở lại. Video "16 năm" lên 100%. Ba ô cửa sổ tắt dần._
-> END

// ------------------------------------------------------------
=== hr_3010_don_kho ===
# ngay:30 # gio:07:30 # noi:gam_cau_thang # bat_buoc
_Sáng 30/10. Trước họp đánh giá, HR cho dọn kho để "phòng họp gọn gàng chào đón tháng mới". Bạn đeo găng tay, đi một vòng tầng trệt._
_Gầm cầu thang. Một đống đồ lặt vặt: chìa khóa, son môi, điện thoại cũ, một chiếc găng tay hồng, một cái USB không nhãn dính mùi cà phê sữa đá, một con gà cao su… và tờ giấy nhắn bạn gửi {giam_doc} hôm qua._
cho: Grừ… *(đứng chắn trước đống đồ, nhe răng)*
* [🧹 Dọn hết. Kho là kho, không phải ổ chó.]
    ~ hr_don_kho_tuat = true
    ~ qh("cho", -30)
    ~ qh("bac_bao_ve", -10)
    _Bạn bỏ hết vào thùng carton đem ra cổng. {cho} sủa theo cả quãng. {bac_bao_ve} nhìn thùng carton, rồi nhìn bạn, không nói gì._
    _Cái USB rơi xuống khe cống. Không ai biết nó quan trọng cỡ nào._
* [😶 Chừa gầm cầu thang lại. Dọn chỗ khác.]
    ~ qh("cho", 10)
    cho: Gâu! *(vẫy đuôi, nằm đè lên đống đồ)*
    _Bạn dọn chỗ khác. Kho đồ của {cho} vẫn nằm đó, nguyên vẹn, đầy những thứ không ai biết đang tìm._
* [🙋 Gọi {bac_bao_ve} ra hỏi: "Bác ơi, đống này của ai?"]
    bac_bao_ve: Của {cho}. Nó nhặt từ khắp nơi. Cháu để yên đi. Có khi lại có ích.
    ~ qh("bac_bao_ve", 5)
    ~ qh("cho", 5)
    _Bạn cầm chiếc găng tay hồng lên xem. Rồi đặt lại. {cho} nhìn bạn, như thể biết bạn vừa tha cho nó._
- -> END

// ------------------------------------------------------------
=== hr_3010_hang_nguoi ===
# ngay:30 # gio:08:15 # noi:phong_hr
_8 giờ 15. Bạn lên phòng HR lấy tập hồ sơ. Ngoài cửa phòng HR…_
{ hr_do_lang_nghe >= 70 && hr_do_dang_so <= 20:
    -> hr_3010_hang_nguoi.s_dong
}
{ hr_do_lang_nghe >= 40:
    -> hr_3010_hang_nguoi.s_vai_nguoi
}
-> hr_3010_hang_nguoi.s_trong

= s_dong
_…có một hàng người. Không ai bị gọi. {thuc_tap_sinh} cầm ly. {chua_te_deadline} cầm ly. {hong_hot} cầm hai ly, một cho {designer}. {editor} đứng ngủ, tay vẫn cầm ly._
thuc_tap_sinh: Dạ… hôm nay họp đánh giá, ai cũng run ạ. Tụi em lên xin ly trà cho đỡ run.
~ hr_so_nguoi_tu_len = hr_so_nguoi_tu_len + 5
~ hr_so(-5)
* [🍵 Mở cửa, pha 3 ấm.]
    _Phòng HR chật cứng. Tiếng ly chạm ly. Không ai sợ._
    ~ hr_nghe(5)
* [😊 Cười. Lần này cười thật.]
    _Không ai chạy. {hong_hot} còn chụp hình, caption: "HR cười mà tui hông sợ, lạ ghê."_
    ~ hr_so(-5)
- -> END

= s_vai_nguoi
_…có 2 người đứng ngập ngừng. {thuc_tap_sinh} và {chi_dai}._
chi_dai: Pha trà đi. Tui uống trước rồi tụi nhỏ mới dám vô.
~ hr_so_nguoi_tu_len = hr_so_nguoi_tu_len + 2
* [🍵 Pha một ấm trà sen.]
    ~ hr_tra()
    ~ qh("chi_dai", 3)
    _{chi_dai} uống một ngụm, gật đầu với {thuc_tap_sinh}. Em nó mới dám bước vào._
* [💬 "Hai người lên đây không sợ hả?"]
    chi_dai: Tui chưa bao giờ sợ ông. Nhỏ {thuc_tap_sinh} thì đang tập.
    thuc_tap_sinh: Dạ… em tập được nửa rồi ạ.
    ~ hr_nghe(2)
- -> END

= s_trong
_…trống trơn. Ở cuối hành lang, ai đó thấy bạn, quay đi rất nhanh._
* [😶 Vào phòng, đóng cửa.]
    ~ cang_thang(5)
* [🍵 Pha một ấm trà, để ngoài cửa với tấm biển "Tự rót".]
    _Lúc bạn ra lấy ấm, ấm đã cạn. Không ai vào phòng. Nhưng ai cũng đã uống._
    ~ hr_so(-3)
- -> END

// ------------------------------------------------------------
=== hr_3010_hop_danh_gia ===
# ngay:30 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. 21 người trong phòng "Sáng Tạo". {giam_doc} ngồi đầu bàn. Bạn đứng cạnh máy chiếu, tay cầm tập hồ sơ hồng. Bạn là người đọc kết quả._
_Mục 1: gia hạn hợp đồng ca sĩ độc quyền. {idol_het_thoi} ngồi thẳng lưng, kính đen._
* [🤝 "Em đề xuất gia hạn. 'Công Viên' vẫn là bài cả nước thuộc. Và ảnh hát bè cứu cả gameshow 16/10."]
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 10)
    giam_doc: Ừ. Gia hạn. Anh không ép… à, anh ép. Gia hạn.
    _{idol_het_thoi} tháo kính. Mắt đỏ._
* [📋 "Phòng nhân sự không có ý kiến. Sếp quyết."]
    giam_doc: Thế thì… gia hạn 3 tháng, xem tiếp.
    ~ qh("idol_het_thoi", 3)
- _Mục 2: đánh giá chuyên cần. Bạn mở hồ sơ dày 3 cm. {thanh_xin_nghi} ngồi cuối bàn, mặt trắng như tờ đơn xin nghỉ._
* [📓 "{thanh_xin_nghi}: tháng này nghỉ 9 ngày. 3 bà ngoại, 1 gặt lúa, 1 đám cưới con mèo. Đề nghị kỷ luật."]
    ~ hr_so(5)
    ~ qh("thanh_xin_nghi", -15)
    { not hr_them_ten_son:
        ~ hr_ds(1)
        ~ hr_them_ten_son = true
    }
    _{thanh_xin_nghi} cúi đầu. Ngón tay gõ lên bàn một nhịp rất lạ. Như nhịp một bài hát._
* [😶 Nhìn {thanh_xin_nghi} rất lâu. "Giọng em nghe quen quen."]
    thanh_xin_nghi: *(giật mình)* Dạ…?
    hr: Không có gì. Mục này anh để sau họp. Anh với em uống trà riêng.
    ~ qh("thanh_xin_nghi", 5)
* {hr_biet_son_kim_tuyen} [🔒 "Sơn nghỉ nhiều. Nhưng mỗi ngày nghỉ, em ấy làm một việc rất nghiêm túc. Phòng nhân sự xác nhận đó không phải trốn việc."]
    _Cả phòng quay sang {thanh_xin_nghi}. {thanh_xin_nghi} quay sang bạn, mắt mở to._
    ~ qh("thanh_xin_nghi", 25)
    ~ hr_nghe(5)
    { hr_them_ten_son:
        ~ hr_ds(-1)
        ~ hr_them_ten_son = false
    }
    giam_doc: Việc gì?
    hr: Bí mật nhân sự anh.
- _Mục 3: phương án tái cấu trúc nhân sự. Cả phòng nín thở. Tập hồ sơ hồng trên tay bạn. {hr_danh_sach_den} cái tên._
{ hr_tu_ghi_ten_minh:
    _Không. Một cái tên. Tên của bạn._
}
* [📢 Đọc.]
    ~ hr_hanh_dong_3010 = "doc"
    { hr_tu_ghi_ten_minh:
        hr: Phương án tái cấu trúc có một tên. {hr}. Phòng nhân sự tự cắt phòng nhân sự.
        _Im lặng tuyệt đối. Rồi {chi_dai} đứng bật dậy, mắt đỏ hoe. Rồi {ke_toan}. Rồi cả phòng._
        ~ hr_nghe(10)
        ~ hr_so(-20)
    - else:
        _Bạn đọc từng cái tên. Mỗi cái tên rơi xuống bàn như một viên đá. Không ai khóc. Như thế còn tệ hơn._
        ~ hr_so(15)
        ~ tinh_than_cong_ty = tinh_than_cong_ty - 15
    }
* [✂️ Xé.]
    ~ hr_hanh_dong_3010 = "xe"
    _Bạn xé tập hồ sơ làm đôi. Tiếng giấy rách to như một tiếng sét trong phòng họp kín._
    giam_doc: {hr}!
    hr: Anh không ép, tùy em. Em chọn xé.
    ~ qh("giam_doc", -10)
    ~ hr_so(-10)
    ~ hr_nghe(5)
    chi_dai: *(vỗ bàn)* Được!
* [📁 Đưa lại cho {giam_doc}.]
    ~ hr_hanh_dong_3010 = "dua_lai"
    hr: Anh ơi, danh sách này anh viết trang 2. Trang 1 anh tự viết luôn đi anh.
    _{giam_doc} cầm tập hồ sơ. Nhìn trang 2. Nhìn bạn. Không mở ra._
    ~ qh("giam_doc", 5)
- -> hr_3010_danh_gia

// ------------------------------------------------------------
=== hr_3110_cong_soat_ve ===
# ngay:31 # gio:19:00 # noi:san_khau_dem_hong # bat_buoc
_Đêm Hồng Halloween. Sân khấu Đêm Hồng, Phường Tân Drama. Bạn đứng ở cổng soát vé, bên cạnh một bình trà lớn, 20 lít, và một chồng ly giấy cam có chữ G sặc sỡ._
_{giam_doc} đi ngang, hóa trang "Ông Kẹ Ngân Hàng": áo vest, tay cầm cuốn sổ nợ giả. Không ai cười. Ai cũng thấy hơi… thật._
giam_doc: {hr}. Pha cho anh một ly. Loại gì cũng được.
* [🍵 Trà sen. Trà của lần đầu tiên bạn pha cho cả công ty hôm 1/10.]
    giam_doc: *(uống)* Ừ. Ngon. Anh uống trà của em 7 năm mà chưa bao giờ khen.
    ~ qh("giam_doc", 5)
* [🍵 Trà Zzz. Sếp cần ngủ.]
    giam_doc: Đêm nay ai mà ngủ được em. *(nhưng vẫn uống hết)*
    ~ qh("giam_doc", 3)
- _Dòng người đi qua cổng. {thuc_tap_sinh} trong bộ đồ ma, {hong_hot} hóa trang thành… chính mình nhưng có thêm 3 cái điện thoại, {cho} đội nơ hồng, mặt cau có._
thuc_tap_sinh: Dạ anh còn trà Zzz không ạ? Em hồi hộp quá.
~ hr_tra()
-> END

// ------------------------------------------------------------
=== hr_3110_chung_ket ===
# ngay:31 # gio:20:00 # noi:san_khau_dem_hong
_20 giờ. Trên sân khấu Đêm Hồng, phim ngắn "Người Hùng Không Tên" vừa chiếu xong, tới video "16 năm" của {editor}. Ở cổng, bạn mở điện thoại: "Giọng Ca Ước Mơ", chung kết trực tiếp._
{ hr_biet_son_kim_tuyen:
    _Bạn biết người sắp bước ra là ai. Bạn nhìn quanh sân khấu Đêm Hồng, tìm {thanh_xin_nghi}._
- else:
    _Sơn Kim Tuyến. Thí sinh bạn bình chọn từ đầu mùa. Bạn để điện thoại tựa vào bình trà._
}
* [📱 Bình chọn. Cho đủ 47 lần.]
    { hr_so_lan_vote < 47:
        ~ tien_cong(-3000 * (47 - hr_so_lan_vote))
        ~ hr_so_lan_vote = 47
    }
    _47. Bạn không biết vì sao con số đó làm bạn vui. Nó giống số trang của một điều khoản ai cũng sợ, giờ thành số lần bạn tin một người._
* [🎤 Tắt điện thoại. Đêm nay là của Siêu Nhân Hồng.]
    _Bạn tắt điện thoại, rót trà cho người cuối cùng xếp hàng. Ở đâu đó trong thành phố, một người đang hát mà bạn không nghe._
- -> END
