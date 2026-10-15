// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · CHƯƠNG 5: "SỐ LIỆU KHÔNG BIẾT NÓI DỐI" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== dan_dau_tu_2110_thuyet_phuc ===
# ngay:21 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Mốc 3: 500.000 người theo dõi. Sáng nay trang Confession vừa bóc chuyện biệt thự của {giam_doc} đang thế chấp. Không khí phòng giám đốc đặc như keo._
_Bạn bước vào, ôm theo bảng phân tích. {quan_ly_idol} được gọi lên ngồi cạnh, hai điện thoại úp xuống bàn._
giam_doc: {dan_dau_tu}, em nói khán giả thích Siêu Nhân Hồng đi… giúp bà cụ hơn là xem MV à? Thế 300 triệu tiền MV anh đổ sông à? Anh không ép, nhưng em giải thích anh nghe.
* {ddt_bieu_do_tay} [📊 Chiếu biểu đồ vẽ tay ngày mất điện: clip bà cụ 2,4 triệu lượt xem, MV 200 nghìn.]
    { ddt_do_chuan >= 70:
        _{giam_doc} nhìn tờ giấy vẽ tay, nét bút bi run run, rất lâu. Rồi quay sang {quan_ly_idol}._
        giam_doc: {quan_ly_idol}. Từ mai, lịch của {sieu_nhan_hong} là đi giúp người thật. Quay thật. Không kịch bản.
        quan_ly_idol: Chuyện này để anh lo. Mà… cảm ơn ông, {dan_dau_tu}. Ông thấy cái mà cả công ty không thấy.
        ~ ddt_thuyet_phuc_21 = true
        ~ follow(50000)
        ~ uy_tin = uy_tin + 15
        ~ qh("giam_doc", 10)
        ~ qh("quan_ly_idol", 15)
        ~ ddt_lam_that(5)
    - else:
        giam_doc: Ừm… biểu đồ vẽ tay à. Để anh họp lại với {truong_phong}.
        _Không có gì xảy ra. Tờ giấy nằm lại trên bàn giám đốc, dưới cái gạt tàn._
        ~ ddt_dc(2)
    }
* [📈 "Sếp tin em, lần này là lên thật!"]
    giam_doc: Câu này anh nghe em nói về coin rồi.
    _{quan_ly_idol} lật điện thoại lên, nghe máy, đi ra ngoài._
    ~ uy_tin = uy_tin - 10
    ~ qh("giam_doc", -5)
* {biet(trang_47) and ddt_do_chuan >= 60} [🔒 "Sếp, con số này em chưa báo ai: nếu không đổi hướng, mốc 4 mình chỉ đạt 610 nghìn. Trang 47, em đọc rồi."]
    _{giam_doc} tái mặt. Đứng dậy. Đi ra đóng cửa phòng. Kéo rèm. Ngồi xuống chậm rãi._
    giam_doc: Ai… ai cho em đọc?
    dan_dau_tu: Không ai. Mất điện, pantry tối, tai em thính.
    giam_doc: *(thở dài rất lâu)* Thế thì em nói đi. Làm sao để không mất mười tỷ.
    _Bạn nói. 40 phút. {giam_doc} ghi chép. Lần đầu tiên, {giam_doc} ghi chép lời nhân viên._
    ~ ddt_nhanh_trang_47 = true
    ~ ddt_thuyet_phuc_21 = true
    ~ follow(60000)
    ~ uy_tin = uy_tin + 20
    ~ qh("giam_doc", 15)
    ~ qh("quan_ly_idol", 10)
    _Từ hôm nay, {giam_doc} hỏi ý bạn trước mọi quyết định của chiến dịch._
- { nguoi_theo_doi < 500000:
    _Chiều đó, tin đồn "cắt giảm nhân sự nếu thất bại" lan khắp công ty. Mốc 3 đã trượt._
}
-> END

// ------------------------------------------------------------
=== dan_dau_tu_2110_ai_gui_bai ===
# ngay:21 # gio:15:00 # noi:ban_so_lieu
_Chiều. {hr} ghé bàn bạn, mang theo một ly trà._
hr: Anh {dan_dau_tu} ơi, em chỉ muốn lắng nghe thôi. Bài Confession sáng nay… anh đọc số liệu giỏi. Anh có thấy gì lạ trong lượt tương tác không?
_Bạn mở bảng. Bài được chia sẻ đầu tiên bởi ba tài khoản mới tạo, cùng một khung giờ, cùng một kiểu ảnh đại diện xanh lá chuối._
* [📊 "Ba tài khoản ảo đẩy bài. Có người muốn nó lan."]
    hr: Ồ. Vậy là không phải chỉ người trong nhà. Em ghi nhận. Cảm ơn anh.
    ~ qh("hr", 10)
    ~ ddt_lam_that(3)
* [😶 "Không thấy gì."]
    hr: Dạ. Em cảm ơn anh.
    _{hr} đi. Bạn nhìn ba cái ảnh đại diện xanh lá chuối thêm một lúc._
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2210_kiem_tra_thue ===
# ngay:22 # gio:10:00 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế tới bất ngờ. Trưởng đoàn: Chú Liêm, 55 tuổi, cặp da đen, sợ chó. Cả công ty giả vờ chăm chỉ. Bạn tắt chart. Thật sự tắt._
chu_liem: Cậu là người làm số liệu doanh thu quảng cáo? Cho tôi xem doanh thu tài trợ ba tháng gần nhất.
_Bạn soạn báo cáo. Cột "KPI tài trợ" của {sales}: 300%. Cột "tiền thật về tài khoản": gần như 0. Hợp đồng BTT Global: không có dòng tiền nào._
* [📊 Nộp đúng số liệu thật, không bình luận.]
    chu_liem: Số này… không khớp. Tôi ghi lại. Cậu làm báo cáo sạch đấy.
    _{sales} đứng ở cửa, mặt tái dần. {ke_toan} nhìn bạn, gật đầu một cái rất nhỏ._
    ~ ddt_lam_that(8)
    ~ qh("ke_toan", 10)
    ~ qh("sales", -20)
    ~ uy_tin = uy_tin + 5
* [💬 Xin 10 phút, kéo {sales} ra hành lang hỏi riêng.]
    ~ ddt_hoi_rieng_huyen = true
    sales: *(cười, rồi không cười nổi nữa)* Anh… anh thấy rồi hả. Mr. Kevin Trộn… không có thật. Em… em sợ lắm anh.
    dan_dau_tu: Anh cũng từng nói "chắc kèo" với cả công ty. Nói thật đi. Sớm còn hơn muộn.
    sales: *(im lặng)* …Dạ. Em nói. Nhưng anh đứng cạnh em nha.
    _Bạn đứng cạnh {sales} khi {sales} nói thật với Chú Liêm. Chú Liêm ghi chép, không nổi giận._
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", 20)
    ~ ddt_lam_that(5)
* [🙈 Giấu cột tiền thật đi. "Số liệu đang cập nhật."]
    chu_liem: Đang cập nhật? Tôi chờ.
    _Chú Liêm chờ 40 phút. Bạn đổ mồ hôi. {cho} đi ngang cửa, Chú Liêm nhảy lên ghế, và cuộc kiểm tra bỏ qua phần đó._
    ~ ddt_dc(-15)
    ~ qh("sales", 10)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2210_toi ===
# ngay:22 # gio:20:00 # noi:phong_gac_lung
_Tối. Gác lửng. Bạn ngồi nhìn hai màn hình laptop cũ. Bên trái: bảng số liệu chiến dịch. Bên phải: app chart, biểu tượng nhỏ, đỏ._
_Hôm nay bạn đã không mở nó lần nào. Lần đầu tiên trong một ngày làm việc._
* {ddt_mo_cat_lo} [✂️ Giữ ngón tay trên biểu tượng app. Thử xóa.]
    _Ngón tay bạn đè lên biểu tượng. Nó rung rung, hiện dấu "X"._
    _Trong đầu bạn vang lên: "Cắt lỗ là thua." "Đáy rồi." "Lần này là lên thật."_
    ** [✂️ Bấm X.]
        ~ ddt_xoa_app = true
        ~ ddt_nt(-30)
        ~ cang_thang(-20)
        _"Bạn có chắc muốn xóa?" Bạn bấm "Có". Biểu tượng biến mất. Màn hình phải trống trơn._
        _Bạn ngồi im 5 phút, chờ cảm giác mất mát. Nó không tới. Chỉ có tiếng karaoke của chú Sáu bên kia hẻm._
    ** [😰 Rút tay lại.]
        ~ ddt_so_lan_tat_app = ddt_so_lan_tat_app + 1
        _Chưa được. Nhưng lần sau sẽ gần hơn._
* [📊 Làm báo cáo cho mai.]
    ~ ddt_lam_that(3)
    _Bạn làm báo cáo tới 11 giờ. Không nhìn chart lần nào. Báo cáo đẹp._
* [📈 Mở chart "một chút thôi".]
    ~ ddt_soi_chart()
    _"Một chút" kéo dài tới 2 giờ sáng._
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2310_kevin_tron ===
# ngay:23 # gio:17:00 # noi:studio # bat_buoc
_Sinh nhật {sieu_nhan_hong}, kiêm livestream. Một vấn đề: kịch bản có đoạn "Mr. Kevin Trộn, chủ tịch BTT Global" lên sóng chúc mừng. Mr. Kevin Trộn không tồn tại._
sales: *(kéo bạn vào góc)* Anh {dan_dau_tu}! Anh 37 tuổi, mặt nhìn… rất giống chủ tịch tập đoàn bánh tráng trộn. Anh đóng giùm em 2 phút thôi!
* [🕶️ Đeo kính đen, mặc vest mượn, lên sóng.]
    _Bạn lên sóng, nói giọng lơ lớ: "Hello Pink Hero, happy birthday, BTT Global love you." Bình luận: "Ông này nhìn quen quen", "Giống ông bán coin trên mạng"._
    ~ qh("sales", 15)
    ~ follow(5000)
    { ddt_mua_hong or ddt_mua_sau_18:
        _Có người bình luận: "Ủa đây là ông chú hay khoe x10 trên group coin mà?" Bạn đổ mồ hôi dưới cặp kính._
        ~ cang_thang(15)
    }
* [😇 "Không. Anh hết đóng vai rồi. Em nhờ Bác {bac_bao_ve} đi."]
    sales: Bác {bac_bao_ve}? Bác chịu hả?
    _Bác {bac_bao_ve} chịu. Bác đeo kính đen, ngồi trước camera đúng 10 giây._
    bac_bao_ve: Chúc mừng sinh nhật cháu. Thế thôi.
    _Bình luận: "Ông chủ tịch này ngầu quá", "Kiệm lời mà sang". {sales} thở phào. Bạn thì thấy nhẹ cả người vì đã nói "không"._
    ~ qh("sales", 5)
    ~ qh("bac_bao_ve", 3)
    ~ ddt_dc(3)
* [🤝 "Kêu {thuc_tap_sinh}. {thuc_tap_sinh} nói tiếng Anh giỏi."]
    thuc_tap_sinh: Dạ em á? Dạ… "Good evening, Pink Hero." Em hồi trước hay… tiếp khách nước ngoài ạ.
    _{thuc_tap_sinh} đóng Mr. Kevin Trộn hoàn hảo tới mức {sales} suýt tin là thật._
    ~ qh("thuc_tap_sinh", 5)
    ~ qh("sales", 10)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2310_livestream ===
# ngay:23 # gio:19:30 # noi:studio # bat_buoc
_Livestream sinh nhật. 12.000 người xem. Bạn ngồi sau camera, mở bảng lượt xem theo từng giây._
{ ddt_thuyet_phuc_21:
    _Theo đề xuất của bạn, nửa đầu buổi livestream là clip {sieu_nhan_hong} cả tuần qua đi giúp người thật: sửa mái nhà, dắt chó lạc về, đẩy xe trong mưa. Đường lượt xem dựng đứng._
    ~ follow(60000)
}
_Giữa buổi, {sieu_nhan_hong} đọc bình luận, rồi khựng lại._
sieu_nhan_hong: Ủa… có đồng tiền tên em hả? "Hồng Coin"? Ai làm vậy? Sao lại lấy tên em?
{ ddt_mua_hong:
    _Mặt bạn đỏ như cây nến. Bạn cúi xuống, giả vờ chỉnh dây camera._
    ~ cang_thang(15)
}
* {ddt_canh_bao_coin} [📊 Giơ tấm bảng: "Không phải của mình. Đã cảnh báo từ 9/10."]
    sieu_nhan_hong: À! Mọi người ơi, công ty em đã cảnh báo từ đầu rồi nha! Đừng ai mua mấy cái đó nha! Hồng là thái độ, không phải là coin!
    ~ follow(20000)
    ~ qh("sieu_nhan_hong", 10)
* {ddt_mua_hong} [😢 Nhắn vào tai nghe của {quan_ly_idol}: "Tui có mua. Tui xin lỗi."]
    quan_ly_idol: *(nhìn bạn qua camera, nói nhỏ vào micro phụ)* Ông nói thật là được. Để tui lo.
    ~ qh("quan_ly_idol", 5)
    ~ ddt_nt(-10)
* [😶 Im lặng.]
    _{sieu_nhan_hong} tự trả lời: "Chắc fan dễ thương làm cho vui." Bình luận rộ lên: "Dễ thương cái gì, tui mất 2 triệu!"_
    ~ follow(-5000)
- _Rồi {sieu_nhan_hong} nhìn thẳng vào camera: "{chua_te_deadline} ơi… em thích anh. Không phải PR đâu." Bảng lượt xem của bạn nổ tung._
_Ngay sau đó, {cho} lao vào bánh kem hồng. Bánh đổ. Nhưng \#VũƠiTrảLờiĐi đã lên xu hướng._
~ follow(30000)
-> END

// ------------------------------------------------------------
=== dan_dau_tu_2410_ban_chu_no ===
# ngay:24 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Liên Hợp Quốc. "Hội nghị hòa giải" của {chi_dai}. Các cặp ngồi đối diện nhau. Bạn được xếp riêng một bàn tròn có bảng tên: "BÀN CHỦ NỢ"._
_Quanh bàn: {sales}, {it}, Bác {bac_bao_ve}, {con_ong_chau_cha}, {thanh_xin_nghi}, {thuc_tap_sinh}, {bien_kich}, {idol_het_thoi}. Tám người. Tám ly trà._
chi_dai: Rồi. Hôm nay hòa giải. Anh {dan_dau_tu}, mời anh trình bày. Ai ngắt lời thì ra ngoài.
* [📊 Chiếu bảng "Lộ trình trả nợ": mỗi tháng trả mỗi người một phần, ưu tiên Bác {bac_bao_ve} trước.]
    _Bảng tính rõ ràng: ngày nào, ai, bao nhiêu. Bác {bac_bao_ve} đứng đầu danh sách.{ddt_no_nha_hang > 0: Nhà hàng Sóng Vỗ ở dòng cuối.}_
    _Các chủ nợ gật gù. {sales} chụp hình màn hình. {it} nói "Được"._
    ~ ddt_ban_chu_no_ok = true
    ~ ddt_chu_no_hop_mat = false
    ~ ddt_qh_chu_no(15)
    ~ ddt_lam_that(5)
* [📈 "Mọi người cho tui thêm một tuần, con coin mới này sắp…"]
    _{chi_dai} đập bàn. Tám ly trà nảy lên cùng lúc._
    chi_dai: Ra ngoài. Không, ngồi đó. Nhưng im.
    _{sales} đứng dậy bỏ về. {thuc_tap_sinh} nhìn bạn như nhìn thần tượng vừa vỡ._
    ~ ddt_qh_chu_no(-20)
    ~ ddt_noi_day()
* [😢 "Tui xin lỗi. Tui không có tiền. Tui chỉ có cái nghề đọc số."]
    _Im lặng. Lâu. Rồi {it} nói:_
    it: Thì đọc số trả nợ.
    sales: Đúng! Anh làm báo cáo thật cho em, trừ nợ!
    idol_het_thoi: Anh… lọc giùm em mấy cái tài khoản… ờ, em trừ 500.
    con_ong_chau_cha: Anh làm số liệu nhạc cho em. Em trừ hết cái vốn góp luôn.
    ~ ddt_ban_chu_no_ok = true
    ~ ddt_chu_no_hop_mat = false
    ~ ddt_qh_chu_no(10)
    ~ ddt_xoa("sales", 2000000)
    ~ ddt_xoa("idol_het_thoi", 500000)
    { ddt_vay_long_20:
        ~ ddt_xoa("con_ong_chau_cha", 10000000)
    - else:
        ~ ddt_xoa("con_ong_chau_cha", ddt_no_long)
    }
    ~ ddt_dc(5)
    _Chiều đó bạn ngồi làm ba bản báo cáo thuê. Không có chart. Chỉ có số liệu thật, và những người thật đang đợi._
* [🏃 Xin đi vệ sinh. Rồi không quay lại.]
    ~ ddt_bo_ban_chu_no = true
    _Bạn trốn ở sân thượng tới hết buổi. Ở bàn tròn, tám người ngồi nhìn chiếc ghế trống của bạn, tám ly trà nguội dần._
    ~ ddt_qh_chu_no(-25)
    ~ qh("chi_dai", -15)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2510_chu_nhat ===
# ngay:25 # gio:14:00 # noi:quan_bida_co_ban
_Chủ nhật. Quán bida Cơ Bản. {chua_te_deadline} không đánh bida. {chua_te_deadline} ngồi nhìn điện thoại, mặt nghiêm túc lần đầu tiên trong đời._
chua_te_deadline: Anh {dan_dau_tu}, anh đọc số giỏi. Anh nói em nghe: hashtag tên em lên xu hướng hai ngày rồi. Người ta… thích thật hả anh? Hay là PR?
* [📊 "Bình luận thật, tài khoản thật. Không có bot. Không phải PR."]
    chua_te_deadline: *(im lặng rất lâu)* …Vậy là thật. Ừ. Cảm ơn anh. Em… đi về suy nghĩ.
    ~ qh("chua_te_deadline", 15)
    ~ ddt_dc(3)
* [😶 "Số liệu không đọc được lòng người."]
    chua_te_deadline: Anh nói câu này nghe như ông thầy bói.
    ~ qh("chua_te_deadline", 3)
- _Bạn đánh một mình hai ván. Thua cả hai ván. Không cá cược. Thua mà không mất gì, cảm giác lạ thật._
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== dan_dau_tu_2610_cat_giam ===
# ngay:26 # gio:11:00 # noi:phong_hr # bat_buoc
_Giao ban xong, tin đồn "cắt giảm nhân sự nếu Siêu Nhân Hồng thất bại" lan khắp công ty. Bạn biết mình là ứng viên số một: chuyên viên, 37 tuổi, hay nhìn chart trong giờ làm._
_{hr} mời bạn lên uống trà. Trà ngon. Ly sứ trắng._
hr: Anh {dan_dau_tu} ơi, em chỉ muốn cùng anh nhìn lại hành trình tháng này thôi.
* [📊 Mở báo cáo cả tháng: các khung giờ đề xuất, các dự đoán, bảng phân tích.]
    { ddt_man_hinh_trai > ddt_man_hinh_phai:
        hr: *(lật từng trang)* Ồ. Em không biết là anh làm nhiều vậy. Em… ghi nhận thật lòng.
        ~ qh("hr", 15)
        ~ uy_tin = uy_tin + 5
    - else:
        hr: Báo cáo đẹp. Nhưng log máy anh cho thấy… thời gian mở chart nhiều hơn mở báo cáo, anh ha.
        ~ qh("hr", -5)
        ~ cang_thang(10)
    }
* [😢 "Nếu phải cắt, cắt anh. Đừng cắt {thuc_tap_sinh} với {thanh_xin_nghi}."]
    hr: *(ly trà khựng lại)* Sao anh biết hai cái tên đó?
    dan_dau_tu: Đoán. Số liệu. Người lương thấp nhất và người nghỉ nhiều nhất.
    hr: *(im lặng rất lâu)* Anh… đọc số giỏi thật.
    ~ qh("hr", 10)
    ~ qh("thuc_tap_sinh", 5)
    ~ phat_hien(danh_sach_cat_giam)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2610_chieu_thu_phim ===
# ngay:26 # gio:15:00 # noi:phong_hop_tang_2
_Chiếu thử phim ngắn "Người Hùng Không Tên". Cảnh người mặc đồ hồng đẩy chiếc xe chết máy trong mưa. Bên cạnh bạn, {thuc_tap_sinh} nắm chặt tay vịn ghế._
_Bạn nhớ: ngày 2/10, {thuc_tap_sinh} đã kể ý tưởng này trong cuộc họp chiến dịch. Bạn có ghi biên bản._
* [📄 Mở biên bản họp 2/10 trên điện thoại, đưa cho {thuc_tap_sinh} xem.]
    thuc_tap_sinh: *(đọc, mắt đỏ)* Dạ… có ghi lại hả anh… Em tưởng không ai nhớ.
    dan_dau_tu: Số liệu thì ai cũng quên. Biên bản thì không.
    ~ phat_hien(nguoi_gac_ket)
    ~ qh("thuc_tap_sinh", 15)
    ~ qh("bien_kich", -5)
* [😶 Xem phim tiếp.]
    _Phim hay. Bạn để ý thấy lượt xem trailer nội bộ của cảnh "đẩy xe trong mưa" cao nhất. Lại là giúp người thật._
    ~ ddt_dc(2)
- _Hết phim, {giam_doc} ra giá 200 triệu mua kênh Diu-túp của {editor}. Bạn nhìn bảng số liệu kênh "Cú Đêm": 980.000 người đăng ký. 200 triệu là rẻ. Rất rẻ._
-> END

// ------------------------------------------------------------
=== dan_dau_tu_2710_sua_chua_hong_hao ===
# ngay:27 # gio:11:00 # noi:ban_so_lieu # bat_buoc
_Sáng 27. Cả công ty xôn xao: LL-Entertainment gửi hợp đồng cho {sieu_nhan_hong}, giá gấp ba. Lưu Lực tới tận cổng, thấy {chi_dai} thì làm rơi tập hồ sơ._
_Giữa lúc đó, {sales} chạy vào, mặt đỏ bừng._
sales: Mọi người! "Sữa Chua Hồng Hào" ở Ven Đô gọi! Họ muốn tài trợ 1 tỷ! Thật đó! Lần này em không nói phét!
_Không ai tin. {hong_hot} cười. {ke_toan} không ngẩng đầu. {sales} nhìn quanh, rồi nhìn bạn._
* [📊 Mở số liệu: lượt nhắc "Sữa Chua Hồng Hào" trên các clip {sieu_nhan_hong} tăng 400% tuần này. Họ có lý do thật.]
    dan_dau_tu: Số liệu nói em nói thật. Họ thấy {sieu_nhan_hong} uống sữa chua của họ trong clip sửa mái nhà.
    _Cả phòng im. {ke_toan} ngẩng đầu. {giam_doc} bước ra khỏi phòng._
    giam_doc: Thật à? Thế thì gọi lại ngay! Anh không ép, nhưng gọi ngay!
    ~ qh("sales", 25)
    ~ uy_tin = uy_tin + 10
    ~ follow(20000)
* [😶 Im lặng. Ai biết được.]
    sales: *(cười méo)* Một lần nói thật trong đời, không ai tin. Đáng đời em ha anh.
    ~ qh("sales", -3)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2710_loi_moi_ll ===
# ngay:27 # gio:23:00 # noi:phong_gac_lung # bat_buoc
_23:00. Gác lửng. Điện thoại "ting". Số lạ. Ảnh đại diện màu xanh lá chuối._
nguoi_la_ll: Chào anh {dan_dau_tu}. 15 triệu cho toàn bộ file số liệu Siêu Nhân Hồng: lượt xem từng giờ, tệp khán giả, kế hoạch tuần cuối. Không ai biết đâu anh.
_Bạn nhìn sổ nợ: {ddt_so_no} đồng. 15 triệu. Đủ để trả gần hết._
_Rồi bạn nhìn tờ biểu đồ vẽ tay ngày mất điện, vẫn dán trên tường gác lửng._
* [💸 "Gửi số tài khoản đi."]
    ~ ddt_ban_so_lieu_ll = true
    ~ ddt_dung_tien_ll = true
    ~ tien_cong(15000000)
    _Bạn gửi file. 4 phút. 15 triệu về tài khoản. Bạn nhìn con số rất lâu. Lần này lên thật. Nhưng bạn không thấy vui._
    ~ ddt_nt(-10)
    ~ follow(-50000)
    ~ cang_thang(20)
* [🛡️ Chụp màn hình tin nhắn, gửi {chi_dai} và {quan_ly_idol}.]
    ~ ddt_bao_ll = true
    chi_dai: *(trả lời sau 30 giây)* Được. Mai chị xử. Ngủ đi.
    quan_ly_idol: Cảm ơn ông. Giờ tui biết họ đang mua ai rồi. Để tui lo.
    ~ uy_tin = uy_tin + 15
    ~ qh("chi_dai", 15)
    ~ qh("quan_ly_idol", 15)
* [📊 "Được. Tui gửi." Gửi một bộ số liệu giả, dự đoán sai hết.]
    ~ ddt_gui_so_lieu_gia = true
    ~ ddt_dung_tien_ll = true
    ~ tien_cong(15000000)
    _Bạn làm một bộ số liệu đẹp như tờ biểu đồ treo trong phòng giám đốc: cái gì cũng đi lên, sai từ đầu tới cuối. Gửi._
    { RANDOM(1, 10) <= 4:
        ~ ddt_bi_ll_lo = true
        _Một giờ sau, tin nhắn mới: "Anh nghĩ bọn tôi không đọc được số à?" Sáng mai, trên mạng có bài: "Nhân viên G-Entertainment bán dữ liệu"._
        ~ scandal()
        ~ follow(-30000)
        ~ uy_tin = uy_tin - 15
    - else:
        _LL tin. Họ lên kế hoạch dựa trên bộ số liệu sai bét của bạn. Bạn ngồi nhìn 15 triệu, không biết nó là tiền thưởng hay tiền phạt._
        ~ follow(10000)
    }
- -> END
