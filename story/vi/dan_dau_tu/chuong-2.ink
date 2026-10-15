// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · CHƯƠNG 2: "HỒNG COIN" (8/10 – 14/10)
// ============================================================

// ------------------------------------------------------------
=== dan_dau_tu_0810_tiem_cam_do ===
# ngay:8 # gio:18:00 # noi:tiem_cam_do_cuu_nguy
_Ngày Thị giác Thế giới. Cả công ty đi khám mắt. Bạn thì nhìn rõ một điều: ví bạn trống._
_Tiền trọ còn nợ Bà Tư. Tiệm cầm đồ Cứu Nguy ở Phố Cũ sáng đèn. Chủ tiệm đeo dây chuyền vàng to như dây xích xe đạp._
chu_cam_do: Đồ này cầm được nhiêu đây thôi nha.
_Bạn tháo chiếc đồng hồ trên tay. Quà sinh nhật 30 tuổi. Nó vẫn chạy đúng, dù cuộc đời bạn thì không._
* {ddt_co_dong_ho} [💍 Cầm đồng hồ.]
    -> dan_dau_tu_mg_cam_do
* [🚶 Đứng trước cửa tiệm 10 phút, rồi quay về.]
    _Bạn đứng nhìn tủ kính. Trong đó có một cây đàn guitar, một cái máy ảnh, một chiếc nhẫn. Mỗi món là một câu chuyện "lần này là lên thật"._
    _Bạn về nhà. Ăn mì gói. Tiền trọ vẫn nợ. Nhưng đồng hồ vẫn trên tay._
    ~ an(20)
    ~ cang_thang(5)
    ~ ddt_nt(-5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0910_can_tin_trung ===
# ngay:9 # gio:12:00 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. Bạn có 30.000đ. Trứng luộc 7.000đ một quả._
_Bạn mua 1 quả. Rồi đứng nhìn quả trứng, nghĩ tới chuyện "đừng bỏ hết trứng vào một giỏ". Bạn chỉ có một quả trứng. Và một cái giỏ._
hong_hot: Anh {dan_dau_tu}! Tối nay MV ra mắt. Anh coi giùm tui khung giờ đăng bài quảng bá nha. Anh giỏi vụ này mà.
* [📊 "Đăng teaser 18:30, MV 20:00, clip hậu trường 21:15."]
    hong_hot: Ủa sao chi tiết vậy? … Ok! Tui làm y chang!
    { qh_hong_hot >= 30:
        ~ follow(10000)
    - else:
        _{hong_hot} làm theo… một nửa. Đăng hậu trường lúc 23 giờ vì mải hóng chuyện._
        ~ follow(5000)
    }
    ~ ddt_lam_that(5)
    ~ qh("hong_hot", 5)
* [📈 "Đăng lúc nến xanh."]
    hong_hot: Nến gì? Anh nói tiếng gì vậy?
    ~ ddt_soi_chart()
    ~ qh("hong_hot", -3)
- ~ an(15)
~ tien_cong(-7000)
-> END

// ------------------------------------------------------------
=== dan_dau_tu_0910_mv_ra_mat ===
# ngay:9 # gio:20:00 # noi:ban_so_lieu # bat_buoc
_20:00. MV đầu tiên của {sieu_nhan_hong} ra mắt. Bạn ngồi trước hai màn hình. Màn hình trái: lượt xem MV, từng giây._
_2.000. 5.000. 12.000. Con số nhảy đều đặn như nhịp tim._
_Bạn để ý một chuyện: video hậu trường {sieu_nhan_hong} cúi xuống buộc dây giày cho một em nhỏ ở trường quay có tỷ lệ xem hết cao hơn chính MV._
* [📊 Ghi chú, gửi cho {quan_ly_idol}: "Cắt clip buộc dây giày, đăng riêng."]
    quan_ly_idol: Khoan, anh nghe máy… À đọc tin. Ừ, ý hay. Để anh bảo {hong_hot}.
    ~ follow(15000)
    ~ ddt_lam_that(5)
    ~ qh("quan_ly_idol", 5)
* [📈 Mở chart xem "thị trường phản ứng thế nào với MV".]
    _Thị trường không phản ứng gì với MV. Thị trường không biết MV là gì. Nhưng bạn vẫn xem tới 22 giờ._
    ~ ddt_soi_chart()
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0910_hong_coin ===
# ngay:9 # gio:23:00 # noi:phong_gac_lung # bat_buoc
_23:00. Gác lửng, Hẻm 69. Bạn đang lướt mạng thì thấy: một nhóm fan ẩn danh vừa tạo ra "Hồng Coin" ($HONG). Logo: chiếc mũ hồng._
_Giá $HONG lên xuống theo độ nổi của {sieu_nhan_hong}. Đã tăng 40% trong một giờ. Bình luận: "Mua đi, sắp x10!", "Siêu Nhân Hồng mà, không thể thua!"._
_Tim bạn đập. Không phải đập vì sợ. Đập như hồi bạn mới 34 tuổi, lần đầu thấy nến xanh._
_Người tạo coin: ẩn danh. Ví của người tạo: đang giữ 70% tổng số coin. Bạn đọc số liệu giỏi. Bạn thấy con số đó._
* [💸 Bỏ hết 3.000.000đ trong tài khoản vào $HONG.]
    ~ ddt_mua_hong = true
    ~ ddt_hong = ddt_tai_khoan
    ~ ddt_nt(15)
    _Bạn bấm "Mua". Ngay sau đó, giá $HONG giảm 12%. Như mọi lần bạn bấm "Mua"._
    ~ ddt_tai_khoan = ddt_tai_khoan - ddt_tai_khoan * 12 / 100
    ~ ddt_hong = ddt_tai_khoan
    ~ ddt_noi_day()
    _"Đáy rồi," bạn tự nhủ. "Lần này là lên thật." Bạn thức tới 4 giờ sáng nhìn nó._
    ~ nghi(-30)
    ~ ddt_soi_chart()
* [📊 Nhắn group công ty: "Có người đang kiếm tiền trên tên {sieu_nhan_hong}. Đừng ai mua."]
    ~ ddt_canh_bao_coin = true
    ~ ddt_dc(10)
    ~ ddt_nt(-15)
    hong_hot: Ủa anh {dan_dau_tu} mà kêu đừng mua coin? Trời sắp sập hả?
    quan_ly_idol: Cảm ơn {dan_dau_tu}. Chuyện này để anh lo, đừng ai đăng gì hết.
    _Lần đầu tiên trong đời, bạn dùng con số để giữ người khác khỏi chart. Tay bạn run, nhưng bạn không xóa tin nhắn._
    ~ qh("quan_ly_idol", 10)
    ~ uy_tin = uy_tin + 5
* [😶 Tắt màn hình. Đi ngủ.]
    _Bạn nằm trong bóng tối. Màn hình tắt, nhưng con số 70% vẫn sáng trong đầu bạn._
    _Ngủ được 3 tiếng. Ít, nhưng là 3 tiếng không có nến._
    ~ ddt_so_lan_tat_app = ddt_so_lan_tat_app + 1
    ~ ddt_dc(3)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1010_giay_nhac_no ===
# ngay:10 # gio:19:00 # noi:hem_69
_Ngày 10. Lẽ ra lương về. Nhưng là thứ 7, ngân hàng giữ lệnh. Group Zalo-lô sôi sục._
_Bạn về tới gác lửng thì thấy {sales} đang đứng trước cửa, tay cầm cuộn băng keo và tờ giấy thứ 7._
sales: Anh {dan_dau_tu}! Tờ thứ 7! Em làm thành bộ sưu tập rồi đó. Tin em đi, dán đủ 10 tờ là em đóng khung!
* [😇 "Lương chưa về em. Thứ 2 anh trả em trước."]
    sales: Thứ 2 nha. Em ghi âm câu này rồi đó. No cap.
    ~ qh("sales", 3)
* [🏃 Quay xe, chạy lên công ty ngủ ở sân thượng.]
    _Đêm đó bạn nằm trên ghế nhựa sân thượng công ty, đắp áo khoác, nhìn sao. Sao không có nến đỏ. Đẹp._
    _Lúc 22:00, {giam_doc} nhắn group: "Lương thứ 2 về nhé các em. Anh không ép, các em cứ yên tâm." Không ai thả tim._
    ~ nghi(10)
    ~ cang_thang(-5)
    ~ qh("sales", -5)
* [📈 "Tuần sau anh trả em gấp đôi. Đáy rồi em."]
    sales: Anh nói câu này lần thứ 9 rồi. Em đếm đó.
    ~ ddt_noi_day()
    ~ qh("sales", -10)
- ~ ddt_co_to_nhac_no_7 = true
-> END

// ------------------------------------------------------------
=== dan_dau_tu_1110_ho_boi_long ===
# ngay:11 # gio:15:00 # noi:ho_boi_sky_ao
_Chủ nhật. Cả công ty đăng ảnh hồi nhỏ (Ngày Quốc tế Trẻ em gái). Bạn đăng ảnh năm 8 tuổi, đang đếm bi ve. Đã có máu phân tích từ nhỏ._
_Bạn tới hồ bơi Sky Ảo "tình cờ đi ngang". {con_ong_chau_cha} đang nằm ghế dài, đeo kính râm._
con_ong_chau_cha: Ủa anh {dan_dau_tu}, cái Hồng Coin là gì vậy? Ngân nói anh đang all-in hả? Chill đi anh.
* [🗣️ "Long, cơ hội trăm năm có một. Em góp với anh 20 triệu, Tết này mua xe mới."]
    con_ong_chau_cha: Ủa sao không mua xe luôn bây giờ? … Mà thôi, ok anh. Em chuyển.
    ~ ddt_vay_long_20 = true
    ~ ddt_vay("con_ong_chau_cha", 20000000)
    ~ ddt_tai_khoan = ddt_tai_khoan + 20000000
    { ddt_mua_hong:
        ~ ddt_hong = ddt_hong + 20000000
    }
    ~ ddt_nt(10)
    _Giây phút tiền về tài khoản, bạn thấy mình như CEO. Giây phút tiếp theo, giá giảm 8%._
    ~ ddt_tai_khoan = ddt_tai_khoan - 1600000
    { ddt_mua_hong:
        ~ ddt_hong = ddt_hong - 1600000
    }
    ~ ddt_noi_day()
* [📊 "Thật ra… đồng này rủi ro lắm. Em đừng bỏ tiền vô."]
    con_ong_chau_cha: *(kéo kính xuống)* Ủa? Lần đầu em nghe anh nói vậy đó. Anh ổn hông?
    ~ ddt_nt(-10)
    ~ ddt_dc(5)
    ~ qh("con_ong_chau_cha", 5)
* {ddt_do_chuan >= 60} [🔒 "Long, em có làm nhạc hông? Số liệu cho thấy nhạc nền tự sáng tác có lượt xem cao gấp ba."]
    con_ong_chau_cha: *(đơ người)* Sao… sao anh biết?
    _Bạn không biết. Bạn chỉ thấy trong bảng số liệu, mấy video có nhạc nền "Rồng" vô danh luôn được xem hết._
    con_ong_chau_cha: Anh… đừng nói chú em nha. Em… em có mấy bài. Anh nghe thử hông?
    ~ phat_hien(bai_hat_long)
    ~ qh("con_ong_chau_cha", 20)
    ~ ddt_dc(5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1210_luong_ve ===
# ngay:12 # gio:10:15 # noi:ban_so_lieu # bat_buoc
_Thứ 2. "Ting." Lương về, trễ 2 ngày. Cả công ty thở ra cùng lúc._
_Trong 3 giây, bạn nhận được 4 tin nhắn: {sales} gửi một sticker con mèo cầm dao. {it} gửi: "Restart cái ví chưa anh?". Bác {bac_bao_ve} không gửi gì. Bà Tư gửi: "Nay mùng mấy rồi con?"._
_Màn hình phải: $HONG đang xanh nhẹ._
* [📒 Trả nợ. Bác {bac_bao_ve} trước tiên, rồi tiền trọ, rồi {sales}.]
    { tien >= 4000000:
        ~ ddt_tra("bac_bao_ve", 2000000)
        ~ ddt_tra("sales", 2000000)
        _Bạn ra chòi, đưa bác 2 triệu bằng hai tay. Bác nhìn xấp tiền, rồi nhìn bạn._
        bac_bao_ve: Bác không cần gấp mà. Thôi, cậu đã đưa thì bác cầm. Ngồi uống ngụm trà.
        ~ qh("bac_bao_ve", 15)
        ~ qh("sales", 10)
        ~ ddt_nt(-10)
        ~ cang_thang(-10)
    - else:
        _Lương về không đủ như bạn tưởng. Bạn trả được Bác {bac_bao_ve} một nửa._
        ~ ddt_tra("bac_bao_ve", 1000000)
        ~ qh("bac_bao_ve", 8)
    }
* [📈 Nạp vào $HONG. Đáy rồi. Lần này là lên thật.]
    { tien >= 5000000:
        ~ tien_cong(-5000000)
        ~ ddt_tai_khoan = ddt_tai_khoan + 5000000
        ~ ddt_hong = ddt_hong + 5000000
        ~ ddt_mua_hong = true
    }
    _Bạn bấm "Nạp". Rồi "Mua". $HONG đỏ ngay lập tức, như thể nó chờ bạn._
    ~ ddt_tai_khoan = ddt_tai_khoan - 600000
    ~ ddt_hong = ddt_hong - 600000
    ~ ddt_nt(10)
    ~ ddt_noi_day()
    ~ ddt_soi_chart()
* [⚖️ Chia đôi: một nửa trả nợ, một nửa nạp.]
    { tien >= 4000000:
        ~ ddt_tra("bac_bao_ve", 2000000)
        ~ tien_cong(-2000000)
        ~ ddt_tai_khoan = ddt_tai_khoan + 2000000
        ~ ddt_hong = ddt_hong + 2000000
        ~ ddt_mua_hong = true
        ~ qh("bac_bao_ve", 10)
    }
    _Nửa này giúp bạn ngủ được. Nửa kia giữ bạn thức. Cân bằng kiểu {dan_dau_tu}._
    ~ ddt_tai_khoan = ddt_tai_khoan - 200000
    ~ ddt_hong = ddt_hong - 200000
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1210_cau_thang ===
# ngay:12 # gio:12:05 # noi:cau_thang_bo
_Bạn đang xuống cầu thang bộ. Tầng trên có tiếng giày cao gót của {sales}. Tầng dưới có tiếng dép lê của {it}._
sales: Anh {dan_dau_tu}! Đứng lại! Lương về rồi đó nha! # hen_gio:4
* [🏃 Lách vào toilet tầng 1.]
    { RANDOM(1, 10) <= 6:
        _Bạn lọt vào toilet. Thoát. Trong buồng bên cạnh, có tiếng {thuc_tap_sinh} nói điện thoại rất khẽ: "Dạ… thẻ kim cương của em… ngân hàng gọi hỏi em ký gì…"_
        ~ phat_hien(duy_tung_lam_ngan_hang)
        ~ ddt_ne_trong_ngay = ddt_ne_trong_ngay + 1
    - else:
        _Cửa toilet kẹt. Bạn đứng trong đó 10 phút. Khi bước ra, {sales} và {it} đang đứng chờ ngoài cửa, mỗi người một bên, như hai ông thần giữ cửa._
        ~ cang_thang(15)
        ~ qh("sales", -5)
    }
* [📈 "{sales}! Đáy rồi em. Đáy thật rồi. Tuần sau anh trả em gấp đôi."]
    sales: Anh nói câu này lần thứ 10 rồi đó. Em có đếm.
    ~ ddt_noi_day()
    ~ qh("sales", -10)
* [💸 Trả 500.000đ ngay tại chỗ.]
    { tien >= 500000:
        ~ ddt_tra("sales", 500000)
        sales: *(cầm tiền, đơ người)* Ủa… anh trả thiệt? Em… em quên đòi tiếp luôn.
        ~ qh("sales", 10)
    - else:
        _Bạn móc ví. Ví có 42.000đ. {sales} nhìn, rồi tự rút lại tay._
    }
* [⏱️ (Không chọn kịp)]
    it: *(đi lên, dừng lại nhìn bạn đúng 1 giây)* Restart cái ví chưa anh?
    _{it} đi tiếp. {sales} chặn được bạn ở chiếu nghỉ._
    ~ qh("sales", -3)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1210_the_phu ===
# ngay:12 # gio:16:00 # noi:ban_so_lieu
_Chiều. Bạn đang làm báo cáo thì {con_ong_chau_cha} đi ngang, mặt thẫn thờ._
con_ong_chau_cha: Anh {dan_dau_tu}, anh rành tiền bạc. Sao thẻ em quẹt cái nào cũng báo từ chối vậy? Thẻ chú em làm cho em.
_Bạn biết đọc dòng tiền. Thẻ phụ gắn với tài khoản riêng của {giam_doc}. Tài khoản đó vừa bị ngân hàng chặn chi tiêu lớn._
* [😇 "Không phải lỗi thẻ. Tài khoản gốc có chuyện. Em hỏi chú đi."]
    con_ong_chau_cha: Chú em có chuyện gì? … Thôi, chú không nghe máy. Từ sáng tới giờ.
    _{con_ong_chau_cha} ngồi xuống ghế cạnh bạn, lần đầu tiên không nói "chill"._
    ~ qh("con_ong_chau_cha", 10)
    ~ ddt_dc(3)
* {ddt_vay_long_20 or ddt_no_long > 0} [😶 Nhớ tới khoản "vốn góp" 10 triệu. Im lặng.]
    _Bạn nợ {con_ong_chau_cha} 10 triệu {ddt_vay_long_20: và 20 triệu nữa}. Và giờ {con_ong_chau_cha} có thể đang cần tiền thật._
    ~ cang_thang(15)
    ~ ddt_nt(-5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1310_bieu_do_tang_sep ===
# ngay:13 # gio:10:00 # noi:phong_giam_doc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho chính mình. {thanh_ninh} đọc bài phát biểu khen 15 phút. {sales} tặng giấy chứng nhận "Doanh nhân của năm" của BTT Global._
_Tới lượt bạn. Bạn không có tiền mua quà. Bạn có Excel._
* [📈 Tặng biểu đồ "Doanh thu công ty 5 năm tới", đi lên dựng đứng.]
    giam_doc: Ồ! Đẹp đấy! Đi lên! Anh thích cái mindset này!
    _{giam_doc} treo biểu đồ ngay cạnh giấy khen của {sales}. Hai tờ giấy đẹp nhất phòng, và giả nhất phòng._
    ~ qh("giam_doc", 10)
    ~ ddt_dc(-3)
* [📊 Tặng biểu đồ thật: dòng tiền thật, có cả cột đỏ.]
    giam_doc: *(nhìn rất lâu)* Cột này… là tháng này à?
    dan_dau_tu: Dạ. Trừ khi mình đạt một triệu.
    giam_doc: Ừ. Ừ. Em… để anh giữ. Không treo. Nhưng anh giữ.
    ~ qh("giam_doc", 3)
    ~ ddt_lam_that(8)
    ~ uy_tin = uy_tin + 3
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1410_moc_2 ===
# ngay:14 # gio:09:00 # noi:phong_giam_doc # bat_buoc
_Mốc 2: 200.000 người theo dõi. {giam_doc} lại cầm tờ giấy và cây bút._
giam_doc: Lần này em đoán đi. Trật quá 30% thì em biết rồi đấy.
-> dan_dau_tu_mg_du_doan

// ------------------------------------------------------------
=== dan_dau_tu_1410_von_gop ===
# ngay:14 # gio:15:30 # noi:pantry
_Pantry. Bạn đang pha cà phê máy thì {con_ong_chau_cha} bước vào, cầm ly trà sữa._
con_ong_chau_cha: Anh {dan_dau_tu}, cái vốn góp chung hồi đó sao rồi anh? Em không đòi đâu. Em chỉ tò mò thôi.
_{con_ong_chau_cha} không giận. {con_ong_chau_cha} chỉ tò mò. Bạn thì muốn độn thổ._
* [😢 "Nói thật: mất rồi. Còn cái nịt."]
    con_ong_chau_cha: *(gật gù)* Ờ. Em cũng đoán vậy. Mà anh nói thật là em thấy… dễ chịu hơn.
    con_ong_chau_cha: Hay vầy đi. Anh làm số liệu cho mấy bài nhạc… của bạn em. Coi như trả dần.
    ~ ddt_nt(-15)
    ~ ddt_dc(5)
    ~ qh("con_ong_chau_cha", 15)
    ~ ddt_xoa("con_ong_chau_cha", 2000000)
* [📈 "Đang lên em. Sắp x10."]
    con_ong_chau_cha: Vậy hả? Chill vậy. Anh nói lần trước cũng là sắp x10.
    ~ ddt_noi_day()
    ~ qh("con_ong_chau_cha", -5)
* [💸 "Anh trả em 1 triệu trước."]
    { tien >= 1000000:
        ~ ddt_tra("con_ong_chau_cha", 1000000)
        con_ong_chau_cha: Ủa anh trả thiệt hả? Em tưởng là… góp vốn thì không trả chứ.
        ~ qh("con_ong_chau_cha", 10)
    - else:
        _Ví không đồng ý với kế hoạch của bạn._
        ~ cang_thang(5)
    }
- -> END
