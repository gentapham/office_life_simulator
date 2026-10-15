// ============================================================
// THÁNH NỊNH: NHI · CHƯƠNG 4: "PHÒNG ĐÔI VỚI CHỊ ĐẠI" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_ninh_1710_xe_di_vung_tau ===
# ngay:17 # gio:06:00 # noi:cong_cong_ty # bat_buoc
_6 giờ sáng, thứ 7. Xe 29 chỗ đậu trước cổng. Công ty có 22 người, một con chó, một siêu nhân. Ngân sách chỉ đủ xe 29 chỗ._
_Ghế đầu, cạnh sếp, còn trống. Bạn ôm bình trà sen, gối cổ cho sếp, và một túi thuốc say xe._
_Rồi bạn thấy {ran_doc} đang bước lên bậc xe, tay cầm… gối cổ cho sếp._
* [🏃 Lách lên trước, ngồi phịch xuống ghế cạnh sếp.]
    ~ tn_ninh(3)
    ~ tn_sep_goi("nhi")
    ~ qh("ran_doc", -5)
    giam_doc: Ơ Nhi. Ừ, ngồi đây. À {ran_doc} ngồi sau anh nhé, có gì anh hỏi.
    _Suốt 3 tiếng, sếp quay ra sau hỏi {ran_doc} 9 lần. Bạn đếm._
    ~ tn_sep_goi("hieu")
* [🙇 "Em {ran_doc} ngồi với sếp đi, chị xuống cuối xe trông mọi người."]
    ~ qh("ran_doc", 5)
    ~ tn_gian(-5)
    _Cuối xe là chỗ ồn nhất, nóng nhất, và có {chi_dai}. Chị nhích qua một chút cho bạn ngồi._
    chi_dai: Hôm nay lạ ha.
* [👇 Kêu {thuc_tap_sinh} ngồi ghế phụ, bê thùng nước suối cả đường.]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ em ngồi ghế phụ cũng được ạ, em quen rồi ạ.
    _{chi_dai} ngồi ngay sau ghế phụ. Chị thấy hết._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1710_xep_phong ===
# ngay:17 # gio:10:30 # noi:khach_san_vung_tau # bat_buoc
_Sảnh khách sạn Vũng Tàu. {hr} cầm danh sách, mỉm cười, đọc từng cặp. Ngân sách bị cắt còn một nửa. Thiếu phòng._
hr: {ran_doc} với Siêu Nhân Hồng… {thuc_tap_sinh} với {con_ong_chau_cha}…
{ tn_xin_phong_vung_tau == 2:
    ~ tn_chung_phong_chi_dai = true
- else:
    { tn_xin_phong_vung_tau == 1:
        { RANDOM(1, 10) <= 2:
            ~ tn_chung_phong_chi_dai = true
        }
    - else:
        { RANDOM(1, 10) <= 4:
            ~ tn_chung_phong_chi_dai = true
        }
    }
}
{ tn_chung_phong_chi_dai:
    hr: …và phòng 204: {chi_dai} với {thanh_ninh}.
    _Cả sảnh im phăng phắc. Luật bất thành văn số 1 của {cong_ty}: Hương không ở với Nhi. Không ai dám đổi._
    hong_hot: *(thì thầm)* Bốc trúng sít rịt luôn…
    chi_dai: *(cầm chìa khóa, đi thẳng lên lầu)* Phòng 204. Đi.
- else:
    hr: …phòng 206: {thanh_ninh} với {hong_hot}.
    hong_hot: Yeah! Bạn cùng phòng! Tối nay tui kể bà nghe hết nha!
    _Bạn thở ra. Phòng của {chi_dai} ở cuối hành lang. An toàn._
}
* [🙇 Đi kiểm tra phòng sếp trước, chỉnh điều hòa, đặt trà lên bàn.]
    ~ tn_ninh(3)
    giam_doc: Phòng anh có view biển không em? À có. Nhi chu đáo.
* [😶 Kéo vali lên phòng mình, nằm vật ra.]
    ~ nghi(10)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1710_tro_choi ===
# ngay:17 # gio:15:00 # noi:bai_bien_vung_tau
_Trò chơi tập thể bắt buộc: "Bịt mắt bắt sếp". Sếp bị bịt mắt, đi lò dò trên cát. Ai bị bắt phải hát._
_Sếp đang đi thẳng về phía bạn. Phía sau bạn là {ran_doc}._
* [🙇 Đứng yên cho sếp bắt.]
    giam_doc: Bắt được rồi! Ai đây? Tóc dài… thơm mùi trà sen… Nhi!
    ~ tn_ninh(4)
    ~ tn_sep_goi("nhi")
    _Bạn hát "Công Viên". Sếp vỗ tay. {idol_het_thoi} ngồi gần đó, mặt hơi nhăn vì bạn hát sai tông._
* [🏃 Né sang một bên, để sếp bắt {ran_doc}.]
    giam_doc: Bắt được rồi! Ơ… {ran_doc}! Hát đi em!
    ~ tn_sep_goi("hieu")
    _{ran_doc} hát một bài về "người cha thứ hai". Sếp xúc động. Bạn ước gì mình đã đứng yên._
* [🤝 Kéo {thuc_tap_sinh} ra chắn: "Duy hát hay lắm sếp!"]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ… em hát "Lý cây bông" được không ạ…
    _Cả bãi biển vỗ tay. {thuc_tap_sinh} hát hay bất ngờ. Bạn bị {chi_dai} nhìn._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1710_lua_trai ===
# ngay:17 # gio:21:00 # noi:bai_bien_vung_tau # bat_buoc
_Đêm lửa trại. Sếp đã ngà ngà, vừa hứa tăng lương cả công ty. {hong_hot} quay được. {sales} vừa hứa mời "ca sĩ nổi tiếng nhất nước" về hát Đêm Hồng._
_{sieu_nhan_hong} tháo mũ, kể chuyện hồi nhỏ từng nhốt một đứa nhỏ trong nhà kho. {ran_doc} ngồi bất động như tượng._
_Rồi tới trò "nói thật". Chai nước suối quay, dừng ngay trước mặt bạn._
hong_hot: Nhi! Nói thật đi, bà có thấy sếp phát biểu hay không?
_Cả công ty nín thở. Sếp ngồi cách bạn hai người, ly bia trên tay._ # hen_gio:6
* [🙇 "Hay chứ! Sếp phát biểu là đỉnh nóc kịch trần!"]
    _Ba người cười. Một người ho. {chi_dai} lắc đầu._
    ~ tn_ninh(3)
    ~ tn_gian(5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 2
* [😐 "Nói thật hả… Dài. Nhưng có mấy câu sếp nói thật lòng thì hay."]
    _Im lặng. Rồi sếp bật cười trước tiên._
    giam_doc: Dài à? Ừ. Dài thật. Haha!
    ~ tn_noi_that_1 = true
    ~ tn_gian(-10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ qh("giam_doc", 5)
* [🔄 "Tui chọn uống phạt." *(uống cạn ly)*]
    ~ cang_thang(-5)
    ~ nghi(-10)
    hong_hot: Né hả bà? Ok, cả group ghi nhận!
* [⏱️ (Không chọn kịp)]
    _Bạn im quá lâu. Sự im lặng nói thay bạn._
    giam_doc: *(cười gượng)* Thôi, quay tiếp đi các em.
    ~ tn_ninh(-3)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1710_dem_voi_chi_dai ===
# ngay:17 # gio:23:30 # noi:khach_san_vung_tau # bat_buoc
{ tn_chung_phong_chi_dai:
    _Phòng 204. Mất điện khách sạn 10 phút. Trong bóng tối chỉ có tiếng sóng và tiếng {chi_dai} trở mình ở giường bên._
- else:
    _Mất điện khách sạn. Bạn ra hành lang hóng gió, gặp {chi_dai} đang ngồi bậc thang nhìn ra biển. Chị vỗ vỗ chỗ trống bên cạnh._
}
chi_dai: Hồi trẻ chị làm "chị đại" cả quận. Có lần đổ nguyên tô ốc lên đầu một thằng ở Quán Ốc Đêm vì nó ăn hiếp bạn chị.
chi_dai: Nhi. Chị hỏi thiệt. Em nịnh ổng hoài vậy, em hông mệt hả?
* [🙇 "Dạ chị nói chuẩn quá chị ơi, chị đúng là có tâm…"]
    chi_dai: Thôi ngủ đi.
    ~ tn_gian(15)
    _Điện có lại. Chị quay mặt vào tường._
* [😢 "Mệt chứ chị. Mà em sợ. Em hông giỏi gì hết, em chỉ biết làm sếp vui."]
    _Im lặng lâu. Tiếng sóng. Tiếng quạt chạy lại khi có điện._
    chi_dai: Sáng mai chị dạy em lên kế hoạch sự kiện. Học cái gì thiệt mà làm.
    ~ tn_gian(-30)
    ~ tn_hoc_nghe_chi_dai = true
    ~ qh("chi_dai", 20)
    _Bạn kể thêm một chuyện thật duy nhất trong tháng: bạn sợ bị đuổi việc tới mất ngủ. {chi_dai} không nói gì, chỉ đưa bạn cái gối của chị._
* [🗡️ "Chị hông nịnh ai nên chị đâu có hiểu."]
    chi_dai: *(bật cười)* Ờ, gan đó.
    ~ tn_gian(-5)
* {tn_xanh_la_chuoi >= 40} [🟢 "Em sắp đi rồi chị. Có chỗ trả gấp đôi."]
    chi_dai: … LL hả?
    _Bạn không trả lời. Chị không hỏi tiếp._
    chi_dai: Đi thì đi cho đàng hoàng. Đừng để ai nói mình là đứa bỏ thuyền.
    ~ tn_gian(-10)
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1810_sang_vung_tau ===
# ngay:18 # gio:06:00 # noi:bai_bien_vung_tau
_6 giờ sáng. {truong_phong} gọi họp trên bãi biển "nhanh 5 phút". {chi_dai} thì đang trải tờ giấy A3 trên bàn đá._
{ tn_hoc_nghe_chi_dai:
    -> hoc_nghe
}
_Bạn ngồi họp với {truong_phong}. Cuộc họp kéo dài tới bữa sáng. Tin mới: "Hồng Coin" về 0. {dan_dau_tu} ngồi nhìn biển rất lâu._
~ nghi(-10)
-> END
= hoc_nghe
chi_dai: Nhi, lại đây. Bài một: một sự kiện có ba thứ. Người, tiền, và thứ sẽ hỏng. Ghi đi.
* [✍️ Ghi chép, bỏ họp của {truong_phong}.]
    ~ qh("truong_phong", -5)
    ~ qh("chi_dai", 10)
    ~ uy_tin = uy_tin + 5
    _Một tiếng học. Bạn biết thêm vì sao sân khấu luôn cần hai máy phát điện, và vì sao không bao giờ để Tuất gần bánh kem._
* [🙇 "Dạ chị cho em đi họp với anh {truong_phong} chút, rồi em quay lại."]
    chi_dai: Ừ. Đi đi. *(cất tờ giấy)*
    ~ tn_gian(5)
- _Xa xa, tin mới lan khắp bãi biển: "Hồng Coin" về 0._
-> END

// ------------------------------------------------------------
=== thanh_ninh_1810_xe_ve ===
# ngay:18 # gio:15:00 # noi:xe_ve_thanh_pho
_Xe về thành phố. Ai cũng giận ai. {con_ong_chau_cha} nhìn điện thoại, mặt trắng bệch: penthouse đang bị rao bán. Clip sếp say hứa tăng lương đã có 4.000 lượt xem trong group._
giam_doc: *(nhắn riêng bạn)* Nhi ơi… cái clip tối qua… em xử lý giúp anh được không?
* [🙇 "Dạ để em nói khéo với {hong_hot} gỡ xuống nha anh."]
    ~ tn_ninh(4)
    ~ qh("hong_hot", -3)
    _{hong_hot} gỡ clip khỏi group. Nhưng ai cần lưu thì đã lưu._
* [😇 "Anh ơi, mọi người quay rồi. Hay anh nói thật: anh sẽ cố, nhưng chưa hứa được."]
    ~ tn_ninh(-2)
    ~ tn_noi_that_1 = true
    giam_doc: … Để anh nghĩ.
    _Tối đó, sếp nhắn group: "Hôm qua anh vui quá nói hơi lố. Anh sẽ cố hết sức." Group im lặng 2 phút, rồi có 9 cái thả tim._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [🤐 Đưa sếp tai nghe, mở nhạc thiền.]
    giam_doc: Ừ… nghe cái này cũng được.
    _Sếp ngủ gục tới tận cầu Sài… cầu Ước Mơ._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1910_giao_ban_lanh ===
# ngay:19 # gio:08:30 # noi:phong_hop_tang_2
_Họp giao ban. Không ai nhìn mặt ai. {truong_phong} không dám nói "5 phút"._
_Sau họp, sếp gọi bạn vào, đưa một phong bì: tiền túi của sếp, để mua quà 20/10 cho 7 chị em._
giam_doc: Em mua giúp anh nhé. Mỗi người một món. Đừng giống nhau quá, mà cũng đừng khác nhau quá. Anh không ép, tùy em.
_Bạn đếm: 7 người, trong đó có chính bạn. Phong bì có 2.100.000đ._
* [🙇 "Dạ anh tinh tế quá anh ơi! Em lo liền."]
    ~ tn_ninh(2)
    ~ tn_khen()
* [💬 "Anh… anh có chắc dư tiền hông anh?"]
    giam_doc: *(cười gượng)* Em lo gì. Anh còn mà.
    _Bạn nhớ con số 4.200.000đ trong tài khoản cá nhân của sếp. Giờ còn một nửa._
    ~ qh("giam_doc", 3)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1910_tin_nhan_xanh ===
# ngay:19 # gio:22:30 # noi:nha_thanh_ninh
_Tin nhắn mới, avatar màu xanh lá chuối: "Chào em, chị là thư ký anh Lực. Anh Lực rất mong gặp em 25/10. Tiện thể, tuần này anh {giam_doc} có lịch gì đặc biệt không em?"_
thu_ky_ll: Chị hỏi cho vui thôi, để hai bên "phối hợp" cho đỡ trùng sự kiện ấy mà 💚
* [🟢 Gửi lịch tuần của sếp.]
    ~ tn_xanh(15)
    ~ tn_nhan_lich_ll = true
    thu_ky_ll: Cảm ơn em! Em đúng là người được việc 💚
    _Bạn tự nhủ: chỉ là lịch đánh golf thôi mà. Bạn tự nhủ ba lần._
* [😶 "Dạ em hông tiện nói chị ơi."]
    thu_ky_ll: Không sao em, chị hiểu mà 💚
    ~ tn_xanh(2)
* [🙅 Chặn số.]
    ~ tn_xanh(-10)
    _Năm phút sau, cùng một nội dung tới từ một số khác. Họ kiên nhẫn hơn bạn nghĩ._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2010_mua_qua ===
# ngay:20 # gio:07:30 # noi:sieu_thi_mini # bat_buoc
_Ngày Phụ nữ Việt Nam và sinh nhật công ty 16 tuổi. Siêu thị mini mở cửa lúc 7 giờ. Bạn cầm phong bì của sếp và một danh sách 7 cái tên._
* [🎁 Bắt đầu chọn quà. (Minigame "Mua Quà Thay Sếp")]
    -> thanh_ninh_mg_mua_qua

// ------------------------------------------------------------
=== thanh_ninh_2010_thu_g ===
# ngay:20 # gio:09:00 # noi:choi_bao_ve
_Sáng nay có một lá thư tay ký "G" tới chòi bảo vệ. Kèm một phong bì dán kín: "Chỉ mở khi công ty sắp sập"._
_Sếp chưa tới. Bác {bac_bao_ve} đang ngồi cầm thư, nhìn ra cổng rất lâu._
bac_bao_ve: Cháu Nhi. Bác đang nghĩ có nên đọc lá thư này trước cả công ty không.
* [🙇 "Dạ bác để con đưa lên sếp, sếp đọc trước rồi quyết nha bác."]
    bac_bao_ve: Thư không gửi anh ấy. Bác giữ.
    ~ qh("bac_bao_ve", -3)
    _Bạn quên mất: ở công ty này có đúng một cánh cửa bạn không gác được._
* [😇 "Con hông biết thư viết gì. Mà nếu là lời tốt, mọi người đang cần nghe lắm bác."]
    ~ qh("bac_bao_ve", 8)
    bac_bao_ve: Ừ… thế à.
    _Bác gấp lá thư lại, nhìn bạn lâu hơn mọi khi._
* [📧 "Bác ơi, thư này anh Genta có gửi bản email cho sếp hông bác?"]
    bac_bao_ve: Anh ấy không dùng email. Mười năm nay vẫn vậy.
    _Ba năm đọc hộp thư sếp, bạn chưa từng thấy email nào ký "G". Giờ thì bạn biết vì sao._
    ~ tn_email(1)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2010_logo ===
# ngay:20 # gio:11:00 # noi:phong_giam_doc
_Sếp đòi logo kỷ niệm 16 năm. {designer} vừa nộp bản sửa lần thứ 38. Sếp xem, im lặng, rồi mở thư mục cũ._
giam_doc: Anh chọn… bản gốc 2010. Cái chữ G bảy màu này. Nhi thấy sao?
designer: *(đứng ở cửa, mắt vô hồn)* Sửa nhẹ thôi là sửa cái gì ạ…
* [🙇 "Anh chọn chuẩn quá anh ơi! Bản gốc là linh hồn!"]
    ~ tn_ninh(3)
    ~ tn_khen()
    ~ qh("designer", -5)
    designer: Ba mươi tám lần. Linh hồn.
* [🤝 "Bản 38 của {designer} để làm phông sân khấu Đêm Hồng được đó anh."]
    ~ qh("designer", 10)
    giam_doc: Ừ! Ý hay! Đưa {chi_dai} xem.
* [😐 "Anh… biết từ đầu là anh chọn bản gốc mà, đúng hông anh?"]
    giam_doc: *(ngập ngừng)* … Ừ. Anh cứ muốn xem có cái nào hơn không. Không có.
    ~ tn_noi_that_1 = true
    ~ qh("designer", 5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2010_quan_oc ===
# ngay:20 # gio:21:30 # noi:quan_oc_dem # bat_buoc
_Quán Ốc Đêm, rồi karaoke Hát Cho Nhau Nghe. Sếp say. Sếp cầm micro, đứng lên bàn._
giam_doc: Các em! Mười sáu năm! Anh tuyên bố… tháng sau… tăng lương… hai mươi…
_Bạn ngồi sát sếp nhất. Tay bạn với tới cái micro được. Còn {hong_hot} đã giơ điện thoại lên._ # hen_gio:5
* [🎤 Giật nhẹ micro: "Dạ anh hát tặng chị em bài 'Công Viên' đi anh!"]
    ~ tn_chan_hua_tang_luong = true
    giam_doc: Ơ… ừ! Công Viên! Phát đâu!
    _Cả phòng hát. Không ai nghe thấy chữ "phần trăm"._
    ~ qh("giam_doc", 5)
    ~ tn_ninh(2)
* [👏 Vỗ tay to nhất: "Sếp có tâm quá! Hai mươi phần trăm!"]
    ~ tn_khen()
    ~ tn_ninh(3)
    giam_doc: Hai mươi phần trăm!
    _Cả phòng reo hò. {hong_hot} quay rõ từng chữ. Sáng mai, {ke_toan} sẽ không ngủ được._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
    ~ qh("ke_toan", -10)
* [😶 Nhìn {ke_toan}. {ke_toan} lắc đầu nhẹ.]
    giam_doc: …phần trăm!
    _Bạn để yên. Có những thứ không cản được._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
* [⏱️ (Không chọn kịp)]
    giam_doc: …hai mươi phần trăm! Anh hứa!
    _Clip có 6.000 lượt xem trước khi về tới nhà._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2010_dem_confession ===
# ngay:20 # gio:23:40 # noi:nha_thanh_ninh # dieu_kien:tn_xanh_la_chuoi>=30
_Gần nửa đêm. Thư ký của Lưu Lực nhắn tiếp._
thu_ky_ll: Em ơi, chị có một bài viết. Em gửi ẩn danh lên trang Confession bên em giúp chị được không? Chuyện thật thôi mà 💚
_Bài viết: "Sếp đang thế chấp nhà ở Ngân hàng Tín Dụng Đen Đủi, công ty sắp sập." Chi tiết tới từng ngày quá hạn. Như có người đọc được email của sếp._
_Không. Là có người đọc được email của sếp. Và người đó là bạn. Ai đã kể cho LL?_
* [🟢 Gửi bài vào Confession.]
    ~ tn_xanh(20)
    ~ tn_gui_confession_the_chap = true
    ~ tn_mang_theo_bi_mat = true
    thu_ky_ll: Cảm ơn em 💚 Anh Lực sẽ nhớ chuyện này.
    _Bạn tắt điện thoại, nhìn tấm ảnh với sếp trên tường. Ảnh nhìn lại bạn._
* [🙅 "Em hông làm vậy được chị."]
    ~ tn_xanh(-10)
    thu_ky_ll: Ok em. Không sao 💚
    _"Không sao" nghĩa là họ sẽ nhờ người khác. Bạn biết vì bạn cũng hay nói vậy._
* [📧 Xóa bài, rồi vào hộp thư sếp đổi mật khẩu.]
    ~ tn_xanh(-5)
    _Mật khẩu mới: "Thang@family2026". Bạn vẫn không nỡ đổi chữ "family"._
- -> END
