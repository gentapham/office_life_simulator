// ============================================================
// DESIGNER · CHƯƠNG 6: "FINAL_THẬT_RỒI.PSD" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== designer_2810_mot_ngay_ba_viec ===
# ngay:28 # gio:08:30 # noi:ban_thiet_ke # bat_buoc
_Mốc 4: 800.000 người theo dõi. Con số hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 800000:
    _Chưa tới. Trong group, ai đó gửi ảnh tòa nhà kính LL kèm dòng "chắc ảnh qua bển rồi". Không ai trả lời._
    ~ cang_thang(10)
}
chi_dai: {designer}. Còn 3 ngày. Chị cần backdrop sân khấu, 20 cái standee, và 500 vé mời. Hôm nay.
_Một ngày. Ba việc. Một người. Bạn mở file mới, đặt tên "final thật rồi". Lần này bạn tin._
* [🎨 Dồn hết vào backdrop. Standee với vé mời làm đơn giản.]
    ~ ds_toi(10)
    ~ ds_backdrop_xong = true
    ~ nghi(-30)
    _Backdrop: một bầu trời đêm hồng tím, ở giữa là chiếc mũ siêu nhân nhìn từ phía sau, như đang nhìn ra khán giả. Không chữ. Không pháo hoa._
    chi_dai: *(nhìn bản in thử, im lặng lâu)* …Đẹp. Đẹp tới mức chị không biết nói gì.
* [🤝 Chia việc: nhờ {thuc_tap_sinh} cắt standee, {hong_hot} in vé, mình làm backdrop.]
    ~ qh("thuc_tap_sinh", 8)
    ~ qh("hong_hot", 5)
    ~ nghi(-20)
    { ds_cai_toi >= 50:
        ~ ds_backdrop_xong = true
        _Đúng 23 giờ, cả ba việc xong. {thuc_tap_sinh} cắt standee đẹp như máy cắt. Sau này bạn mới biết anh từng tự tay cắt thiệp cho cả chi nhánh ngân hàng._
    - else:
        _Đúng 23 giờ, mọi thứ xong. Backdrop thì ổn, chỉ ổn. Bạn không còn đủ gu để nó hơn "ổn"._
    }
* [🌈 Làm nhanh theo kiểu sếp thích: nhiều chữ, nhiều màu, nhiều pháo hoa.]
    ~ ds_toi(-10)
    ~ ds_sua(5)
    giam_doc: Đấy! Thế mới gọi là sân khấu! Wow!
    _Nhìn nó giống một đám cưới quê sang trọng. Bạn đã từng thề không bao giờ làm cái này._
- -> END

// ------------------------------------------------------------
=== designer_2810_ky_thay_huyen ===
# ngay:28 # gio:14:50 # noi:cafe_song_ao # dieu_kien:ds_huyen_deal_that
_14 giờ 50. {sales} nhắn gấp: "Chị ơi! Sếp gọi em lên phòng vì cái clip Vũng Tàu! 15 giờ Sữa Chua Hồng Hào tới Sống Ảo! Chị giữ họ giùm em!"_
_Bạn ôm laptop chạy sang Sống Ảo. Một cô mặc áo hồng nhạt, đeo bảng tên "Sữa Chua Hồng Hào", đang ngồi nhìn đồng hồ._
sua_chua_hong_hao: Chào chị. Chị {sales} đâu ạ? Bên em không chờ lâu được đâu.
* [🎨 Mở hồ sơ đề xuất bạn vừa làm tối qua. "Dạ trong lúc chờ, em trình bày phần hình ảnh trước ạ."]
    _Bạn trình bày: logo Sữa Chua Hồng Hào trên backdrop Đại Nhạc Hội Siêu Nhân, trên vé mời, trên tay áo Siêu Nhân Hồng. Tất cả đều thật. Không ảnh ghép._
    sua_chua_hong_hao: *(gật gù)* Đẹp. Rất đẹp. Mà… hồ sơ này hông có trụ sở 40 tầng gì hết ha?
    designer: Dạ. Bên em chỉ có 3 tầng. Màu tím. Thang máy hay kẹt.
    sua_chua_hong_hao: *(bật cười)* Tôi thích sự thật thà đó.
    ~ qh("sales", 10)
    ~ ds_cam(10)
    _15 giờ 40, {sales} chạy tới, tóc rối, thở hồng hộc. Hợp đồng được ký. Thật. Có mộc đỏ. Không ai phải ghép gì._
    ~ follow(30000)
* [😶 Gọi trà sữa mời khách, ngồi chờ, không nói gì nhiều.]
    _15 giờ 30, {sales} tới. Khách đã hơi cau mày, nhưng vẫn ký. Suýt soát._
    ~ qh("sales", 5)
- -> END

// ------------------------------------------------------------
=== designer_2810_video_lo_tay ===
# ngay:28 # gio:20:00 # noi:can_203
_20 giờ. Fanpage công ty vừa đăng một video lạ: những khoảnh khắc của {quan_ly_idol}, dựng đẹp như phim, nhạc nền nhẹ, câu cuối: "Anh có biết không?"_
_Có một con cú nhỏ xíu ở khung hình thứ 812. Bạn nhận ra ngay. Đây là video của {editor}. Xuất nhầm._
_Cùng lúc, bộ lọc số liệu của {dan_dau_tu} lần ra 80.000 tài khoản fan ảo của {idol_het_thoi}. Một đêm, hai quả bom._
* [🤝 Nhắn ngay {hong_hot} gỡ video xuống.]
    hong_hot: Gỡ rồi! Mà… 3.000 người xem rồi bà ơi. Tui… tui tiếc quá, nó đẹp mà.
    ~ qh("editor", 10)
    ~ qh("hong_hot", 3)
* [📞 Gọi cho {editor}.]
    editor: *(nghe máy, im lặng rất lâu)* …Bà thấy rồi hả.
    designer: Tui thấy con cú. Đẹp lắm. Ông đừng xóa file gốc nha.
    editor: *(ngáp, giọng run)* …Ừ.
    ~ qh("editor", 15)
- -> END

// ------------------------------------------------------------
=== designer_2910_wifi_sap ===
# ngay:29 # gio:08:30 # noi:ban_thiet_ke # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. {it} bị cả công ty rượt quanh 3 tầng như phim hành động._
{ RANDOM(1, 2) == 1:
    it: *(chạy ngang, thở dốc)* Dây mạng bị cắn! Dấu răng chó! {cho} đi tìm con gà cao su!
- else:
    it: *(chạy ngang, thở dốc)* Dây bị cắt! Vết cắt gọn! Có người cố ý!
}
_File backdrop nặng 4 GB. Không gửi được. Tiệm in ở đầu phố cần file trước 12 giờ._
* [🏃 Chép vào USB, chạy bộ tới tiệm photo.]
    ~ nghi(-15)
    ~ uong(-15)
    -> designer_2910_tiem_photo
* [🖨️ In thử ở máy in tầng 1 trước.]
    -> may_in
* [🖍️ Vẽ tay thêm một tấm phông dự phòng, lỡ mọi thứ hỏng hết.]
    ~ ds_toi(5)
    ~ nghi(-10)
    _Bạn vẽ một tấm khổ A1 bằng bút lông. Nếu ngày mai không có điện, không có mạng, không có gì, thì vẫn còn tấm này._
    -> END

= may_in
_Máy in tầng 1. {ran_doc} đang in bản tin nội bộ, 300 bản, chiếm máy._
ran_doc: Dạ chị đợi em xíu nha. Còn 280 bản. Bản tin hôm nay quan trọng lắm.
* [😇 "Em in đi. Chị ra tiệm photo."]
    ~ qh("ran_doc", 5)
    -> designer_2910_tiem_photo
* [🔥 Bấm "Cancel all", đặt file mình lên trước.]
    ran_doc: *(cười, mắt không cười)* Dạ… chị gấp mà. Em hiểu.
    ~ qh("ran_doc", -10)
    -> designer_mg_pha_mau_mo_dau
* {ds_bat_duoc_ke_doi_file && ds_thu_pham == "ran_doc"} [🔒 "Em in xong thì đừng đụng vào file của chị nữa nha. Lần này chị khóa ba lớp."]
    ran_doc: *(khựng lại 2 giây)* …Dạ. Em biết rồi chị.
    _{ran_doc} nhường máy. Không nói thêm câu nào._
    ~ qh("ran_doc", -5)
    -> designer_mg_pha_mau_mo_dau

// ------------------------------------------------------------
=== designer_2910_tiem_photo ===
# ngay:29 # gio:11:00 # noi:tiem_photo
_Tiệm photo đầu phố. Ông chủ đeo kính lão, máy in khổ lớn rền rĩ như máy cày._
_Màu hồng in ra… hơi cam. Bạn xoay núm, chỉnh, in lại. Ông chủ nhìn bạn đầy nể phục._
* [🎨 Đòi in lại tới khi đúng màu Hồng Thái Độ.]
    ~ ds_toi(5)
    ~ tien_cong(-300000)
    ~ ds_backdrop_xong = true
    _Lần in thứ 4. Đúng màu. Ông chủ tiệm vỗ tay. Bạn trả thêm 300.000đ tiền in lại bằng tiền túi._
* [😮‍💨 Chấp nhận hồng hơi cam. Không còn thời gian.]
    ~ ds_toi(-5)
    _Hồng hơi cam. Đứng xa 10 mét thì không ai thấy. Bạn thì thấy, từ 100 mét._
* {ds_co_cuon_decal_hong} [🔒 Dùng Cuộn Decal Hồng dán đè những chỗ in lệch màu.]
    ~ ds_backdrop_xong = true
    ~ ds_co_cuon_decal_hong = false
    _Cuộn decal hồng từ máy in tầng 1 hôm trước cứu cả tấm backdrop. Đúng màu, đúng chỗ, không tốn thêm đồng nào._
- ~ nhan(banh_mi)
~ an(30)
_Ông chủ tiệm cho bạn ổ bánh mì. "Con làm việc nghiêm túc quá, ăn đi con."_
-> END

// ------------------------------------------------------------
=== designer_2910_choi_bao_ve ===
# ngay:29 # gio:15:30 # noi:choi_bao_ve
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} ngồi giữa một chồng giấy note, đeo kính lão, phân loại thư từng phòng._
bac_bao_ve: Tầng 2 gửi tầng 1: "Hóa đơn đâu em?". Tầng 1 gửi tầng 2: "Dạ em đang tìm." Thế à. Ừ.
_{chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua". Video tổng kết của {editor} kẹt ở 99%._
bac_bao_ve: Cháu {designer}. Có giấy cho cháu.
{ ds_cat_dut_ll:
    _Mảnh giấy note của {sales}: "Chị {designer}, em tự hào về chị. Vé mời đẹp lắm. Tin em đi."_
    ~ cang_thang(-10)
- else:
    _Mảnh giấy note của {truong_phong}: "Em sửa nhẹ cái vé mời giúp anh nhé. Chữ to lên. Họp 5 phút."_
    ~ ds_sua(1)
}
* [😇 Rót trà mời bác {bac_bao_ve}.]
    bac_bao_ve: Ừ. Cháu ngồi đây nghỉ tí. Trên đó loạn lắm.
    _Bạn ngồi ghế bố trong chòi, uống trà đá, nghe radio. 10 phút yên bình nhất tháng._
    ~ qh("bac_bao_ve", 8)
    ~ cang_thang(-15)
* [🖍️ Vẽ tặng bác một tấm "Tổng đài Chòi Bảo Vệ" dán lên cửa.]
    bac_bao_ve: *(nhìn lâu)* Đẹp. Bác giữ. *(cất vào ngăn kéo, cạnh một chồng thư)*
    ~ qh("bac_bao_ve", 10)
    ~ ds_toi(3)
- -> END

// ------------------------------------------------------------
=== designer_3010_don_kho ===
# ngay:30 # gio:07:45 # noi:gam_cau_thang
_7 giờ 45. {hr} cho dọn kho trước buổi họp đánh giá. Ba thùng rác đen to xếp ở chân cầu thang._
_Ngay dưới gầm cầu thang là ổ của {cho}: một chiếc găng tay hồng, một con gà cao su, một cây son, mấy cái chìa khóa, và một chiếc USB không nhãn._
cho: Grừ… *(nằm chắn trước kho báu)*
hr: Dọn hết đi em. Rác cả mà.
* [🤝 "Anh {hr} ơi, cái này là đồ của {cho}. Để em dời nó vô chòi bác {bac_bao_ve}."]
    ~ qh("cho", 15)
    ~ qh("hr", -3)
    hr: Ừ… em rảnh thì làm. Anh chỉ muốn kho sạch thôi.
    _Bạn bê cả ổ báu vật của {cho} vào chòi bảo vệ. {cho} đi theo sát gót, đuôi vẫy như cánh quạt._
* [😶 Kệ. Không phải việc của mình.]
    _Ba phút sau, kho báu của {cho} nằm trong thùng rác đen. {cho} sủa một tiếng rất dài._
    ~ qh("cho", -5)
- -> END

// ------------------------------------------------------------
=== designer_3010_hop_danh_gia ===
# ngay:30 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. Màn hình chiếu: "Thành tích Phòng Sản xuất Nội dung, tháng 10/2026". {truong_phong} cầm bút laser._
truong_phong: Tháng này phòng mình có 6 poster được chia sẻ nhiều nhất. Đều là… ý tưởng của anh.
_Slide chiếu poster xe chè. Phông gameshow vẽ tay. Backdrop Đại Nhạc Hội Siêu Nhân. Chú thích: "Ý tưởng: {truong_phong}"._
_Ở ghế cuối, {editor} ngồi im. Video tổng kết của {editor} cũng ghi "Đạo diễn: {truong_phong}"._ # hen_gio:8
* [🎨 Đứng lên: "Dạ anh, cho em xin feedback cụ thể: ý tưởng nào là của anh ạ?"]
    ~ ds_gianh_lai_cong = true
    ~ ds_toi(15)
    ~ qh("truong_phong", -15)
    truong_phong: Thì… anh là người… bảo "làm poster".
    _Cả phòng im phăng phắc. Rồi {chi_dai} bật cười. Rồi {giam_doc} cũng cười._
    giam_doc: {truong_phong} này, thế còn cái phông vẽ tay hôm mất điện? Em vẽ à?
    truong_phong: *(đỏ mặt)* …Dạ không ạ.
    ~ uy_tin = uy_tin + 10
* [🤝 Nhìn {editor}, gật đầu. Hai người cùng đứng lên.]
    ~ ds_gianh_lai_cong = true
    ~ qh("editor", 15)
    ~ qh("truong_phong", -10)
    editor: *(ngáp, nhưng giọng rõ)* Video tổng kết… em dựng. Poster… bả vẽ. Anh {truong_phong}… ngồi họp.
    _Lần đầu tiên trong đời, {editor} nói một câu dài hơn câu hôm nhìn bản vẽ tay._
    ~ ds_toi(10)
    ~ uy_tin = uy_tin + 10
* [😶 Im lặng. Cũng quen rồi.]
    ~ ds_toi(-10)
    ~ qh("truong_phong", 5)
    _Bạn cúi xuống, vẽ con cá voi hồng thứ 31 vào lề sổ. Nó không có miệng._
* [⏱️ (Không chọn kịp)]
    ~ ds_toi(-5)
    _Slide đã chuyển sang phần "Kế hoạch tháng 11: họp nhiều hơn". Cơ hội trôi qua như mọi lần._
- _Cuối buổi, {giam_doc} gia hạn hợp đồng cho {idol_het_thoi}. {quan_ly_idol} thở phào. Không ai nói gì về con số 20% đã hứa ở karaoke._
-> END

// ------------------------------------------------------------
=== designer_3110_hoa_trang ===
# ngay:31 # gio:15:00 # noi:can_203 # bat_buoc
_Thứ 7, Đại Nhạc Hội Siêu Nhân. Cả công ty phải hóa trang._
giam_doc: *(nhắn)* {designer} ơi, chọn giúp anh bộ đồ hóa trang nhé. Ngầu, sang, nhưng thân thiện.
* [🧂 Chọn cho sếp bộ "Ông Kẹ Ngân Hàng": vest đen, cặp táp, mặt nạ cười.]
    giam_doc: Ngầu quá! Mặc vào thấy mình như doanh nhân thành đạt!
    _Không ai nói cho {giam_doc} biết đó là trò đùa. Không ai dám._
    ~ cang_thang(-10)
* [😇 Gửi 3 bộ nghiêm túc, kèm 1 bộ cho vui: "Ông Kẹ Ngân Hàng".]
    giam_doc: Ơ, bộ Ông Kẹ Ngân Hàng này hay đấy! Có cặp táp! Anh lấy bộ này!
    _Bạn định giải thích đó là bộ cho vui. Rồi bạn nhìn mặt sếp hớn hở, và quyết định để vũ trụ tự lo._
- { ds_co_cuon_vai_hong:
    _Còn bạn, bạn mở Cuộn Vải Hồng còn dư từ bộ đồ của {sieu_nhan_hong}. Một tiếng sau, bạn có một chiếc áo choàng hồng, vạt sau vẽ tay một chiếc mũ siêu nhân nhỏ._
    ~ ds_toi(5)
- else:
    _Còn bạn, bạn kẹp thêm một cái kẹp tóc hồng, đeo tai mèo, gọi đó là "hóa trang tối giản"._
}
-> END

// ------------------------------------------------------------
=== designer_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 30. Sân khấu Đại Nhạc Hội Siêu Nhân, Phường Tân Drama. Phim ngắn "Người Hùng Không Tên" mở màn. Rồi video "16 năm" của {editor}._
_Rồi tấm backdrop của bạn được kéo lên._
{ ds_backdrop_xong:
    _Bầu trời đêm hồng tím. Chiếc mũ siêu nhân nhìn ra khán giả. Cả sân khấu im một giây, rồi vỡ òa._
    ~ follow(100000)
    ~ ds_toi(10)
- else:
    _Tấm backdrop sáng lên: nhiều chữ, nhiều màu, nhiều pháo hoa. Ai đó phía sau bạn thì thầm: "Giống đám cưới quê ha."_
    ~ follow(-10000)
    ~ cang_thang(10)
}
_Bạn đứng giữa đám đông. Tay cầm ly nước, tim đập thình thịch. Rồi bạn ngẩng lên._
_Bên kia đường, trên tòa nhà kính 20 tầng của LL-Entertainment, màn hình LED khổng lồ bật sáng._
{ ds_nhan_hong_ngoai:
    _Nó đang chạy… thiết kế của chính bạn. Hồng Ngoại. Lá chuối xoắn quanh vệt hồng. Đẹp. Đẹp một cách đau lòng._
- else:
    _Nó chạy bộ nhận diện Hồng Ngoại: lá chuối xoắn quanh vệt hồng, căn lề lệch. Không phải tay bạn. Bạn thở ra một hơi rất dài._
}
sales: *(đứng cạnh bạn, nắm tay bạn)* Chị {designer}. Dù gì đi nữa, hôm nay chị đẹp nhất sân khấu này.
* [🤝 Nắm lại tay {sales}.]
    ~ qh("sales", 5)
* [🎨 Lấy điện thoại chụp lại backdrop của mình, góc chính diện.]
    ~ ds_toi(3)
    _Bạn đặt tên ảnh: "bản 1, không sửa"._
- _Sân khấu tắt đèn. {sieu_nhan_hong} bước ra. Cả quảng trường hét lên. Câu chuyện của bạn sắp có hồi kết._
-> END
