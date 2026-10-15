// ============================================================
// DESIGNER · CHƯƠNG 5: "LOGO QUÊN XÓA" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== designer_2110_confession ===
# ngay:21 # gio:09:00 # noi:ban_thiet_ke # bat_buoc
_Trang Confession G-Entertainment vừa đăng một bài ẩn danh: biệt thự của {giam_doc} đang bị thế chấp ở ngân hàng._
hong_hot: *(mặt tỉnh bơ hơi quá mức)* Ối dồi ôi, biến căng rồi mấy bà ơi…
_Cả tầng 1 xôn xao. {hr} và {it} đi từng bàn, hỏi từng người. {it} cầm laptop, mở log truy cập._
it: Tôi soi log mạng cả công ty. Ai đăng gì, lúc mấy giờ, máy nào.
_Log mạng cả công ty. Bao gồm cả… những lần bạn tải file lên thư mục "LL" từ wifi công ty._
{ nguoi_theo_doi >= 500000:
    _Ít ra Mốc 3 đã vượt: {nguoi_theo_doi} người theo dõi. Nhưng không ai có tâm trạng ăn mừng._
- else:
    _Mốc 3 chưa đạt: {nguoi_theo_doi} người. Tin đồn "cắt giảm nhân sự" bắt đầu chạy khắp các bàn._
    ~ cang_thang(10)
}
* [🥬 Lén xóa lịch sử, đổi tên thư mục "LL" thành "Linh Linh".]
    { RANDOM(1, 10) <= 6:
        _Xóa kịp. Thư mục giờ tên "Linh Linh", nghe như tên một con mèo._
        ~ ds_lo(-5)
    - else:
        it: *(dừng ngay sau lưng bạn)* Xóa log là để lại log xóa log đó.
        ~ ds_lo(15)
        ~ qh("it", -5)
    }
* [🤝 Mang cho {it} một ly mì ly nóng và ngồi nói chuyện.]
    ~ qh("it", 10)
    it: *(ăn mì)* Tôi chỉ tìm admin Confession. Mấy chuyện khác… không phải việc tôi.
    _{it} nói câu đó mà không nhìn bạn. Bạn hiểu đó là một lời hứa._
    ~ ds_lo(-10)
* [😶 Ngồi im. Làm poster như không có gì.]
    ~ cang_thang(5)
    _Bạn sửa poster với tốc độ của một người vô tội. Tay bạn run nhẹ._
- { ds_do_lo >= 100:
    -> designer_tudo_lat_tay
}
-> END

// ------------------------------------------------------------
=== designer_2210_doan_thue ===
# ngay:22 # gio:10:15 # noi:ban_thiet_ke # bat_buoc
_Đoàn kiểm tra thuế. Trưởng đoàn Chú Liêm, 55 tuổi, đi dọc dãy bàn, cặp tài liệu kẹp nách. Cả công ty giả vờ làm việc chăm chỉ tới mức đáng ngờ._
_Balo dưới chân bạn hé ra một góc laptop thứ hai, màn hình vẫn sáng. Logo xanh lá chuối nằm chình ình ở góc file._
chu_liem: Cho xem hóa đơn phần mềm thiết kế của các máy trong phòng này.
ke_toan: {designer}, máy này của công ty hả em? Hóa đơn đâu em? # hen_gio:4
* [🥬 Alt-Tab về poster Siêu Nhân Hồng, giơ lên: "Dạ máy riêng em, em đem theo làm thêm giờ cho chiến dịch!"]
    { RANDOM(1, 10) <= 6:
        chu_liem: Nhân viên tận tụy. Tốt. Ghi nhận.
        ~ uy_tin = uy_tin + 10
    - else:
        _Bàn tay bạn trượt. Alt-Tab nhảy sai cửa sổ. Logo LL hiện to đúng 1 giây._
        _{ke_toan} thấy. {ke_toan} ghi một dòng vào sổ. Không nói gì._
        ~ ds_lo(25)
        ~ qh("ke_toan", -5)
    }
* [🤝 Liếc sang {sales}.]
    _{sales} lập tức làm đổ ly trà sữa lên bàn mình. Trân châu lăn khắp sàn. Cả đoàn quay sang._
    sales: Ối chết! Hợp đồng của chị! Ướt hết rồi!
    _Một xấp hợp đồng ướt nhẹp. May mà toàn hợp đồng giả._
    ~ qh("sales", 10)
* [😇 "Dạ máy riêng. Trong đó có job làm thêm bên ngoài. Em xin lỗi chị."]
    ~ ds_cam(10)
    ~ ds_lo(10)
    ke_toan: *(nhìn bạn 3 giây, rồi gật)* Máy cá nhân không cần hóa đơn công ty. Chú ơi, máy này cá nhân.
    _{ke_toan} giữ bí mật cho bạn. Một phần vì tử tế. Một phần vì đang bận cứu cả công ty._
    ~ qh("ke_toan", 10)
* [⏱️ (Không chọn kịp)]
    _Bạn đứng đơ. Đúng lúc đó, màn hình laptop thứ hai tự tắt vì hết pin. Lần đầu tiên bạn biết ơn cục pin chai._
- { ds_do_lo >= 100:
    -> designer_tudo_lat_tay
}
-> END

// ------------------------------------------------------------
=== designer_2210_chu_liem_so_cho ===
# ngay:22 # gio:14:30 # noi:ban_sales
_Buổi chiều, Chú Liêm ngồi xuống bàn {sales}._
chu_liem: Cho xem bản gốc hợp đồng tài trợ với Tập đoàn Bánh Tráng Trộn Toàn Cầu. Mã số thuế bên đó là gì?
_{sales} quay sang nhìn bạn. Lần này tới lượt bạn._
* [🎨 Đứng lên hỏi Chú Liêm về "quy định hóa đơn phần mềm thiết kế bản quyền theo năm", kéo dài 15 phút.]
    chu_liem: À… cái này… để chú tra. Bản quyền theo năm hay theo máy?
    _15 phút. Bạn hỏi tới phiên bản font chữ. Chú Liêm lau mồ hôi trán._
    ~ qh("sales", 10)
    ~ nghi(-10)
* [🐕 Huýt sáo gọi {cho}.]
    cho: Gâu! *(phóng vào văn phòng, đuôi vẫy tít)*
    chu_liem: Ối! Chó! Cho… cho chú qua bàn khác!
    _Chú Liêm sợ chó. Cả công ty giờ mới biết. {cho} được thưởng 2 cây xúc xích._
    ~ qh("cho", 8)
    ~ qh("sales", 8)
* [😶 Giả vờ không thấy. Việc ai nấy lo.]
    ~ qh("sales", -15)
    _{sales} lắp bắp. Cuối cùng {ke_toan} phải đứng ra đỡ: "Hợp đồng đó đang chờ bản dịch."_
- -> END

// ------------------------------------------------------------
=== designer_2210_toi_kevin_tron ===
# ngay:22 # gio:20:30 # noi:can_203
sales: Chị Quỳnh, mai livestream sinh nhật anh {sieu_nhan_hong}. Sếp muốn chủ tịch Kevin Trộn lên sóng tặng quà.
sales: Em cần: danh thiếp, backdrop BTT, và một cái hộp quà to có logo. Em tìm được người đóng rồi.
_Một tập đoàn không có thật sắp lên sóng trực tiếp. Và logo của nó do chính tay bạn vẽ._
* [🗂️ Làm đủ hết. Đã lỡ thì lỡ cho đẹp.]
    -> designer_mg_deal_ma_mo_dau
* [💬 "Huyền. Hay mình dừng ở đây? Chị sợ."]
    sales: *(im rất lâu)* Em cũng sợ chị. Nhưng giờ dừng là sếp hỏi 2 tỷ đâu.
    sales: Qua Đêm Hồng, em sẽ nói thật. Em hứa. Lần này hông phải "tin chị đi". Là "tin em đi".
    ~ qh("sales", 10)
    _Bạn làm danh thiếp, nhưng không làm backdrop. Ít một món là ít một tội._
* [😇 "Chị không làm nữa. Em tự lo nha."]
    ~ qh("sales", -15)
    ~ ds_cam(3)
    sales: …Dạ. Em hiểu.
    _Tin nhắn cuối của {sales} là một sticker con mèo buồn. Bạn nhìn nó tới 12 giờ đêm._
- -> END

// ------------------------------------------------------------
=== designer_2310_banh_kem ===
# ngay:23 # gio:10:00 # noi:pantry
_Sinh nhật {sieu_nhan_hong}, 31 tuổi. {chi_dai} đặt bánh kem hồng 3 tầng theo thiết kế của bạn: tầng trên cùng là chiếc mũ siêu nhân bằng đường._
chi_dai: Bánh tới rồi! Nhiệm vụ của cả công ty hôm nay: giữ {cho} cách cái bánh 5 mét.
* [🎨 Tô thêm dòng chữ "Hồng là thái độ" bằng kem trắng lên bánh.]
    ~ ds_toi(5)
    chi_dai: Đẹp quá! Tiếc ghê, ăn vô là mất.
    designer: Dạ thì mình chụp trước. Thiết kế nào cũng chết, chỉ có ảnh là sống.
* [📸 Chụp bánh làm ảnh bìa fanpage trước khi có chuyện.]
    ~ follow(3000)
    hong_hot: Bà khôn ghê! Lỡ có gì thì vẫn còn hình!
* [🦴 Đem xúc xích ra cổng hối lộ {cho} trước.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        ~ qh("cho", 8)
        cho: *(ngoạm xúc xích, liếc vào trong)* Grừ…
        _{cho} nhận hối lộ. Nhưng ánh mắt nó vẫn dán vào cái mũ bằng đường._
    - else:
        _Bạn không có xúc xích. {cho} nhìn bạn, rồi nhìn cái bánh. Nó đã có kế hoạch._
    }
- -> END

// ------------------------------------------------------------
=== designer_2310_livestream ===
# ngay:23 # gio:19:00 # noi:studio # bat_buoc
_19 giờ. Livestream sinh nhật. 12.000 người xem. Bánh kem hồng đặt giữa phòng._
_"Chủ tịch Kevin Trộn" lên sóng, đeo kính đen, tay cầm hộp quà có logo BTT. Logo bạn vẽ. Bạn nín thở cả đoạn._
sieu_nhan_hong: Cảm ơn mọi người! Hôm nay em 31 tuổi! Em… em có chuyện muốn nói.
sieu_nhan_hong: Anh {chua_te_deadline} ơi… em thích anh. Không phải PR đâu.
_Bình luận nổ tung. Hashtag #VũƠiTrảLờiĐi lên xu hướng trong 4 phút. {chua_te_deadline} đứng ở góc phòng, cầm điện thoại, đứng hình._
_Đúng lúc đó, một bóng đen lao vào từ cửa. {cho}. Chiếc mũ bằng đường. Bánh kem bay._
cho: GÂU! *(ngoạm mũ đường, phóng ra cửa)*
{ ds_co_sticker_tuat:
    hong_hot: Bà ơi! Bộ sticker "Tuất Không Vui"! Ghép vô clip này là nổ!
- else:
    hong_hot: Trời ơi bánh! Mà… clip này hay quá, đăng luôn!
}
* {ds_co_sticker_tuat} [📱 Ghép sticker vào clip, đăng liền.]
    ~ ds_sticker_viral = true
    ~ follow(50000)
    ~ qh("hong_hot", 10)
    ~ qh("cho", -3)
    _Clip "Tuất Không Vui phá bánh sinh nhật" kèm sticker lan khắp 22 group chat trong một đêm. {cho} chính thức nổi tiếng hơn nhiều ca sĩ._
* {ds_co_sticker_tuat} [😇 "Thôi bà, để hôm nay là ngày của ảnh."]
    ~ qh("sieu_nhan_hong", 10)
    _Bạn cất sticker. Đêm nay là của người khác._
* {not ds_co_sticker_tuat} [📱 Gửi {hong_hot} góc quay đẹp nhất bạn quay được.]
    ~ follow(5000)
    ~ qh("hong_hot", 3)
* {not ds_co_sticker_tuat} [🤝 Chạy đi lấy khăn với dĩa mới.]
    ~ qh("chi_dai", 3)
- -> chot

= chot
_{sieu_nhan_hong} đứng giữa đống kem, đội chiếc mũ dính kem, cười. Tiếng cười thật nhất bạn từng nghe từ ảnh._
* [🤝 Lấy khăn giấy lau kem trên mũ cho ảnh.]
    sieu_nhan_hong: *(nhỏ giọng)* Chị… cảm ơn chị. Bánh chị thiết kế đẹp lắm. Tiếc ghê.
    ~ qh("sieu_nhan_hong", 8)
* [🎨 Nhặt mảnh mũ đường còn sót, đặt lên đĩa: "Còn cái này nè anh. Bản 1, không sửa."]
    sieu_nhan_hong: Ha ha! Bản 1! Em giữ làm kỷ niệm!
    ~ qh("sieu_nhan_hong", 10)
    ~ ds_toi(3)
- -> END

// ------------------------------------------------------------
=== designer_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:09:30 # noi:sanh_tang_tret
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Xếp cặp: {truong_phong}–{con_ong_chau_cha}, {sales}–{ke_toan}, {hr}–{thanh_xin_nghi}. Và bạn với {bien_kich}._
chi_dai: Hai đứa vẽ chung một bức tranh "Đoàn kết". Chừng nào xong mới được ăn trưa.
bien_kich: *(cầm bút lông)* Tui vẽ chữ. Bà vẽ hình. Chữ là linh hồn.
{ ds_oanh_gian:
    _{bien_kich} vẫn còn giận vụ "nước ốc". Bà ấy viết chữ "Đoàn kết" sát mép giấy, chừa cho bạn đúng 3 phân._
}
* [🎨 "Mình vẽ hai cái ghế nhựa quay vào nhau. Không cần chữ."]
    bien_kich: …Không cần chữ? *(nhìn lâu)* Hai cái ghế nhựa… có nỗi đau. Được.
    ~ qh("bien_kich", 15)
    ~ ds_oanh_gian = false
    ~ ds_toi(5)
* [🤝 "Bà viết đi. Tui vẽ theo chữ của bà, lần này thôi."]
    ~ qh("bien_kich", 10)
    ~ ds_toi(-3)
    bien_kich: *(ngạc nhiên)* Bà… nhường tui? Tui ghi lại ngày này.
* [🐍 "Bà lấy ý tưởng của ai vẽ cũng được, quen rồi mà."]
    ~ qh("bien_kich", -15)
    bien_kich: *(đặt bút xuống)* Hội nghị hòa giải mà bà nói vậy?
    chi_dai: Hai đứa! Ngồi đó thêm 1 tiếng!
    ~ cang_thang(10)
- _Bàn bên cạnh, {chi_dai} và {thanh_ninh} vẽ một bức tranh chỉ có… hai con dao. {chi_dai} giải thích là "dao cắt bánh"._
_Điện thoại rung: clip {idol_het_thoi} hát trong bóng tối hôm mất điện đang lan trên mạng. Cùng lúc, có tài khoản bóc chuyện fan ảo._
-> END

// ------------------------------------------------------------
=== designer_2510_sanh_ll ===
# ngay:25 # gio:10:30 # noi:sanh_ll # bat_buoc
_Chủ nhật. Tòa nhà kính 20 tầng của LL-Entertainment. Sảnh lát đá trắng, máy lạnh lạnh như thái độ lễ tân._
{ ds_nhan_hong_ngoai:
    _Bạn tới giao file Hồng Ngoại bản cuối. Anh Lá Chuối nhắn: "Gửi lễ tân nha em. Anh bận họp."_
- else:
    _Anh Lá Chuối mời bạn "ghé uống ly cà phê, bàn chuyện tương lai". Bạn tới, tự nhủ chỉ để xem cho biết._
}
_Bạn quay người. Và đứng hình. Cách bạn 3 mét, mặc áo sơ mi xanh lá chuối, tay cầm bìa hồ sơ xin việc, là {thanh_ninh}._
_Ba giây. Hai người nhìn nhau. Không ai chớp mắt._
thanh_ninh: Ủa… đây là… tiệm nail hả bà?
* [😶 "Ờ… tui cũng tưởng vậy. Đi lạc."]
    thanh_ninh: Đi lạc ha. Ừ. Đi lạc.
    _Hai người cùng quay lưng, đi về hai hướng. Một thỏa thuận không lời, chắc hơn hợp đồng 52 trang._
    ~ qh("thanh_ninh", 5)
* [💬 "Bà đi phỏng vấn hả?"]
    thanh_ninh: *(mặt cứng lại)* Còn bà đi giao hàng hả?
    _Hai người nhìn nhau thêm 2 giây. Rồi cùng cười. Cái cười của hai kẻ đồng tội._
    thanh_ninh: Tui không thấy bà. Bà không thấy tui. Ok?
    designer: Ok.
    ~ qh("thanh_ninh", 8)
* [🏃 Quay đầu đi thẳng ra cửa, không giao gì hết.]
    ~ ds_cam(10)
    _Bạn đi bộ ra tới tận Đại lộ Kẹt Xe mới dám thở. Laptop thứ hai trong balo nặng như cục gạch._
    -> END
- { ds_nhan_hong_ngoai:
    ~ ds_giao_hong_ngoai = true
    ~ ds_job_ll(2000000)
    ~ ds_cam(-5)
    _Bạn để USB ở quầy lễ tân. Tin nhắn chuyển khoản 2 triệu đến trước khi bạn ra tới cửa. Nhanh tới mức đáng sợ._
- else:
    la_chuoi: *(nhắn)* Em tới rồi hả? Anh xin lỗi, sếp gọi họp gấp. Em cầm phiếu cà phê dưới sảnh nha. Vụ full-time mình nói qua tin nhắn.
    ~ nhan(ca_phe)
}
-> END

// ------------------------------------------------------------
=== designer_2610_chieu_phim ===
# ngay:26 # gio:14:00 # noi:phong_hop_sang_tao
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". 15 phút. Phim về một người bỏ nghề ngân hàng, được một người lạ mặc đồ hồng đẩy xe chết máy 2 km trong mưa._
_Bạn nhớ ra: buổi họp ngày 2/10. {thuc_tap_sinh} kể đúng ý tưởng này. {bien_kich} ghi chép rất chăm._
_Hết phim, cả phòng vỗ tay. Chữ cuối phim: "Kịch bản: {bien_kich}". {thuc_tap_sinh} vỗ tay to nhất, mắt đỏ hoe._
truong_phong: {designer}, em làm poster phim nhé. Trailer ra mắt ngày mai.
* [🎨 Làm poster, và giấu một dòng chữ nhỏ ở góc: "Từ một câu chuyện có thật."]
    ~ ds_toi(5)
    ~ qh("thuc_tap_sinh", 5)
    _Không ai để ý dòng chữ đó. Trừ {thuc_tap_sinh}, người phóng to poster lên 400% và nhìn rất lâu._
* [💬 Hỏi riêng {bien_kich}: "Ý tưởng này của {thuc_tap_sinh} mà bà?"]
    bien_kich: *(khựng lại)* Đây không phải đạo. Đây là… cảm hứng.
    designer: Cảm hứng thì ghi tên người truyền cảm hứng vô đi bà.
    ~ qh("bien_kich", -5)
    ~ ds_toi(5)
    bien_kich: *(im lặng rất lâu)* …Để tui nghĩ.
* [😶 Làm poster như được giao. Không phải việc của mình.]
    ~ ds_sua(1)
- _Tối đó, tin đồn chạy khắp group: "{giam_doc} trả 200 triệu mua kênh Diu-túp của {editor}", và "nếu Siêu Nhân Hồng thất bại, cắt giảm 7 người"._
~ cang_thang(5)
-> END

// ------------------------------------------------------------
=== designer_2710_bia_ho_so ===
# ngay:27 # gio:10:30 # noi:phong_nghe_si # bat_buoc
_LL-Entertainment ra tay. {quan_ly_idol} bước vào văn phòng, mặt xám như tro, tay cầm một bìa hồ sơ._
quan_ly_idol: Lưu Lực gửi hợp đồng cho {sieu_nhan_hong}. Gấp ba. Lăng xê miễn phí. Chuyện này để anh lo, đừng ai đăng gì hết!
_Ông đặt bìa hồ sơ xuống bàn. Bạn nhìn thấy._
~ ds_thay_bia_ho_so = true
~ phat_hien(ll_moi_nguyen)
{ ds_nhan_hong_ngoai:
    _Nền trắng. Chữ "HỒNG NGOẠI". Dải hồng chạy xéo trong chiếc lá chuối. Font chữ… là font của bạn. Bạn tự vẽ từng nét, từng đêm._
    _"Nghệ sĩ mới" chưa bao giờ là ai khác. Nghệ sĩ đó là {sieu_nhan_hong}. Và bạn đã tự tay vẽ cái bẫy._
    ~ phat_hien(quynh_lam_cho_ll)
    ~ cang_thang(20)
    -> cua_minh
- else:
    _Bìa hồ sơ: chữ "HỒNG NGOẠI", dải hồng chạy xéo trong chiếc lá chuối. Thiết kế ẩu, căn lề lệch, kerning như răng khểnh._
    _Đây là cái job Anh Lá Chuối từng mời bạn. Bạn đã từ chối. Ai đó khác đã làm, và làm dở._
    -> khong_phai_cua_minh
}

= cua_minh
* [😇 Kéo {quan_ly_idol} ra hành lang. Thú nhận hết.]
    ~ ds_thu_nhan_voi_thai = true
    ~ ds_cam(15)
    ~ ds_lo(10)
    quan_ly_idol: *(nghe xong, im lặng 10 giây)* Em làm cho LL… mà không biết là cho ai.
    quan_ly_idol: Anh cũng đang bị LL mời đó em. 36 triệu một tháng. Nếu mang {sieu_nhan_hong} theo.
    _Hai người đứng ở hành lang, cùng nhìn sang tòa nhà kính bên kia đường._
    quan_ly_idol: Cảm ơn em đã nói. Anh sẽ nói với {sieu_nhan_hong}: hồ sơ đẹp là nhờ người của mình vẽ. Không phải nhờ LL.
    ~ qh("quan_ly_idol", 15)
* [😶 Im lặng. Cúi xuống làm poster.]
    ~ ds_cam(-5)
    ~ cang_thang(10)
    _Bạn sửa poster lần thứ 5, dù không ai bắt sửa. Chỉ để tay có việc làm._
* [🔥 "Em sẽ phá cái hồ sơ này từ bên trong."]
    ~ ds_cam(10)
    _Bạn không nói câu đó thành tiếng. Bạn chỉ mở laptop thứ hai, mở file Hồng Ngoại, và nhìn chằm chằm vào nó._
    _File gốc vẫn còn trong tay bạn. Màn hình LED của LL sẽ chạy đúng file đó._
- -> END

= khong_phai_cua_minh
* [🎨 Chỉ cho {quan_ly_idol} từng lỗi: "Bên đó làm ẩu vậy đó anh. Với anh {sieu_nhan_hong} mà còn ẩu."]
    quan_ly_idol: *(nhìn kỹ)* Em nói đúng. Căn lề lệch thật. Anh sẽ cho {sieu_nhan_hong} xem cái này.
    ~ qh("quan_ly_idol", 10)
    ~ ds_cam(10)
    ~ follow(10000)
* [😶 Thở phào, không nói gì.]
    ~ ds_cam(5)
    _Bạn thở phào. Rồi bạn giật mình vì thấy mình thở phào._
- -> END

// ------------------------------------------------------------
=== designer_2710_luu_luc_toi ===
# ngay:27 # gio:14:00 # noi:sanh_tang_tret
_14 giờ. Một chiếc xe trắng đỗ trước cổng. Lưu Lực bước xuống: vest trắng, tóc vuốt keo, tay cầm tập hồ sơ dày._
luu_luc: Chào cả nhà {cong_ty}. Việc hôm nay phải xong từ hôm qua. Tôi tới gặp {sieu_nhan_hong}.
cho: Grừ… GÂU! GÂU!
_Lưu Lực bước vào sảnh. Rồi khựng lại. Ở cầu thang, {chi_dai} đang đứng khoanh tay._
_Tập hồ sơ rơi xuống sàn. Giấy bay tứ tung. Lưu Lực lùi một bước, lắp bắp, quay ra xe._
chi_dai: *(nhướng mày)* Ủa, ổng bị gì vậy?
_Một tờ giấy bay tới chân bạn. Là trang thiết kế màn hình LED, có logo Hồng Ngoại._
* [🔍 Nhặt lên, đọc kỹ.]
    _Kế hoạch: đêm 31/10, màn hình LED khổng lồ trên tòa LL sẽ chạy bộ nhận diện Hồng Ngoại, đúng giờ Đêm Hồng mở màn. Đối diện sân khấu._
    ~ ds_cam(10)
    ~ cang_thang(5)
* [🤝 Nhặt hết, đưa cho {chi_dai}.]
    chi_dai: Để chị giữ. Chị không đọc. Mà nếu có đứa nào cần đọc… thì chị không thấy.
    ~ qh("chi_dai", 8)
- -> END

// ------------------------------------------------------------
=== designer_2710_sua_chua_hong_hao ===
# ngay:27 # gio:16:00 # noi:ban_sales
_16 giờ. {sales} đứng giữa văn phòng, cầm điện thoại, mặt trắng bệch._
sales: Mọi người… Sữa Chua Hồng Hào vừa gọi. Ở Ven Đô. Họ muốn tài trợ Đêm Hồng 1 tỷ.
hong_hot: Ủa alo? Thôi {sales} ơi, tháng này em kể 7 nhà tài trợ rồi đó.
_Cả phòng cười. {sales} không cười. {sales} quay sang bạn. Ánh mắt đó không có chữ "chắc kèo". Chỉ có sợ._
* [🤝 "Chị tin. Bật loa ngoài gọi lại đi em."]
    _{sales} bấm gọi lại. Loa ngoài. Bên kia bắt máy: "Dạ Sữa Chua Hồng Hào xin nghe, em chào chị {sales}." Giọng chuyên nghiệp, rõ ràng._
    _Cả phòng im phăng phắc._
    ~ ds_huyen_deal_that = true
    ~ qh("sales", 15)
    sales: *(thì thầm sau khi cúp máy)* Chị Quỳnh… lần này là thật. Chị làm giùm em bộ hồ sơ đề xuất. Hồ sơ thật. Lần đầu tiên.
    designer: Lần này chị không cần ghép ảnh trụ sở nữa ha.
* [😶 Im lặng. Ai biết đâu là thật nữa.]
    ~ qh("sales", -10)
    _{sales} cười gượng, cất điện thoại. Bạn thấy tay nó run._
* [💬 "Em chắc không? Hay Ngân gọi chọc?"]
    sales: Chắc. Mà… tháng này em nói "chắc" nhiều quá rồi ha.
    ~ qh("sales", -3)
    _{sales} đi ra sân thượng một mình._
- -> END

// ------------------------------------------------------------
=== designer_2710_la_chuoi_23h ===
# ngay:27 # gio:23:00 # noi:can_203 # bat_buoc
_23 giờ. Laptop thứ hai sáng lên một lần nữa._
{ ds_nhan_hong_ngoai:
    la_chuoi: Em ơi, file Hồng Ngoại xài tốt lắm. Mai sếp Lực đem đi gặp "nghệ sĩ" lần nữa. Thưởng nóng em thêm 2 triệu nè.
- else:
    la_chuoi: Em ơi. Anh nói thật. Bên anh cần designer giỏi. Bên kia sắp sập rồi.
}
la_chuoi: Bên anh còn ghế full-time, lương gấp đôi. Em qua hông?
_Bạn nhìn ra ban công. Bên kia thành phố, tòa nhà kính xanh lá chuối sáng đèn. Bên này, tòa nhà 3 tầng màu tím đã tắt đèn từ lâu._
* [🏃 "Dạ em qua."]
    ~ ds_nhan_fulltime_ll = true
    ~ ds_cam(-30)
    { ds_nhan_hong_ngoai:
        ~ ds_job_ll(2000000)
    }
    la_chuoi: Tuyệt! Đầu tháng 11 em lên tầng 18 nha. Sếp Lực rất thích em.
    _Bạn tắt máy. Căn 203 im lặng tới mức nghe được tiếng cây lưỡi hổ thở._
* [🧡 "Em hủy hợp tác. Tiền thưởng anh giữ lại đi."]
    ~ ds_cat_dut_ll = true
    ~ ds_cam(20)
    la_chuoi: *(đang soạn tin… rất lâu)* …Em chắc chứ?
    designer: Dạ chắc. Cảm ơn anh đã thuê em. Nhưng em có chỗ của em rồi.
    la_chuoi: Ok. Em giỏi lắm. Thật đó.
    _Bạn gỡ app nhắn tin khỏi laptop thứ hai. Rồi dán một tờ giấy lên nắp: "Laptop để xem phim"._
* {ds_mau_cam >= 70 && ds_thay_bia_ho_so && ds_nhan_hong_ngoai} [🔒 "Dạ anh, cho em sửa nhẹ file lần cuối trước khi in nha."]
    la_chuoi: Sửa nhẹ hả? Ok em, gửi trước 6 giờ sáng nha.
    _Bạn mở file Hồng Ngoại. Phóng to 1600%. Giữa họa tiết lá chuối, bạn vẽ một chữ G 7 màu tí hon, và dòng chữ nhỏ hơn hạt gạo: "Hồng là của G"._
    _Nó chỉ hiện ra khi màn hình đủ to. Như màn hình LED 20 tầng._
    ~ ds_giau_chu_g = true
    ~ ds_cam(10)
    ~ ds_toi(10)
    _Lần đầu tiên trong đời, bạn tự nguyện "sửa nhẹ". Và bạn cười một mình tới 2 giờ sáng._
- -> END
