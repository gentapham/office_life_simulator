// ============================================================
// CON ÔNG CHÁU CHA: LONG
// CHƯƠNG 3: "BẢN DEMO" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== con_ong_chau_cha_1310_hoa_cho_chu ===
# ngay:13 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Ngày Doanh nhân Việt Nam. Phòng chú đầy hoa chú tự mua. {thanh_ninh} vừa đọc xong bài khen 15 phút. {sales} vừa trao tấm bằng "Doanh nhân của năm – BTT Global"._
_Bạn đứng ở cửa, cầm một bó hoa nhỏ mua bằng tiền lương._
giam_doc: Long! Cháu cũng nhớ à? Vào đây.
* [💐 Đưa hoa, rồi hỏi nhỏ: "Chú ơi, thẻ của cháu bị sao vậy?"]
    giam_doc: *(không nhìn bạn)* Lỗi ngân hàng. Họ đang kiểm tra giao dịch lớn. Vài hôm là xong.
    _Chú nói nhanh quá. Như câu đã tập trước. Bạn tin. Nhưng chỉ một nửa._
    ~ qh("giam_doc", 3)
    ~ long_bh(4)
* [💐 Đưa hoa, không hỏi gì.]
    giam_doc: Bó này đẹp nhất phòng đấy. Cháu tự chọn à?
    con_ong_chau_cha: Dạ. Tự chọn, tự trả.
    giam_doc: *(khựng lại)* …Tự trả à.
    ~ qh("giam_doc", 5)
    ~ long_tl(3)
* [📸 Chụp ảnh chú với tấm bằng, đăng story "Chú tui đỉnh nóc kịch trần".]
    ~ long_od(4)
    ~ follow(2000)
    sales: Anh Long tag BTT Global vô giùm em nha!
    _Bạn tìm mãi không thấy trang BTT Global nào để tag._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1310_giao_do_an ===
# ngay:13 # gio:20:30 # noi:sky_ao_tang_18
_Tối. Ca làm thêm thứ hai. Lần này "Rồng" chạy giao đồ ăn. Đơn tiếp theo: căn 1808, Sky Ảo. Ngay tòa nhà bạn ở._
_Cửa mở hé. {idol_het_thoi}, kính đen, áo choàng ngủ in hình chính mình năm 2015. Trên tường dán một tờ giấy đỏ: "THÔNG BÁO NỢ TIỀN THUÊ NHÀ – 3 THÁNG"._
idol_het_thoi: Để đó em. Tiền… anh chuyển khoản sau được hông? Em biết anh là ai không?
* [😷 Đứng im sau khẩu trang: "Dạ được ạ."]
    _Bạn trả tiền đơn đó bằng lương mình. {idol_het_thoi} không nhận ra "Rồng" là ai._
    ~ tien_cong(-120000)
    ~ long_biet_phat_no = true
    ~ long_bh(5)
    ~ long_so_ca_lam_them = long_so_ca_lam_them + 1
    ~ long_tl(6)
* [😶 "Dạ, anh trả tiền mặt giùm em."]
    idol_het_thoi: *(lục túi, đếm từng tờ 10.000đ)* …Đây. Đủ chưa em?
    _Thiếu 20.000đ. Bạn nói "đủ rồi anh"._
    ~ long_biet_phat_no = true
    ~ long_bh(4)
    ~ long_so_ca_lam_them = long_so_ca_lam_them + 1
    ~ long_tl(6)
    ~ tien_cong(160000)
* [🙈 Đặt túi đồ ăn xuống, chạy mất.]
    _Bạn chạy xuống cầu thang bộ 18 tầng. Không phải vì sợ bị nhận ra. Mà vì tờ giấy đỏ trên tường._
    ~ long_biet_phat_no = true
    ~ long_so_ca_lam_them = long_so_ca_lam_them + 1
    ~ nghi(-10)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1410_duyet_poster ===
# ngay:14 # gio:10:30 # noi:ban_thiet_ke
_Mốc 2: 200.000 người theo dõi. {designer} trình 3 bản poster. Bạn ghé qua, vì Marketing là phòng bạn (phòng có một người)._
designer: Anh Long… anh cũng duyệt hả?
* [😎 Chỉ vào bản xấu nhất: "Cái này. Nhìn nó chill."]
    _{designer} nhìn {truong_phong}. {truong_phong} đứng phắt dậy._
    truong_phong: Poster là việc của phòng Sản xuất. Cậu duyệt nhạc chưa xong thì đừng duyệt hình.
    con_ong_chau_cha: Nhạc gì? Ông nói như tui có làm nhạc… *(khựng lại)* Thôi, tùy ông.
    ~ long_od(3)
    ~ qh("designer", -6)
    ~ qh("truong_phong", -5)
* [💬 "Chị Quỳnh thích bản nào nhất?"]
    designer: Bản 2 ạ. Chữ "Hồng" thở được.
    con_ong_chau_cha: Vậy bản 2. Chị là dân chuyên mà.
    ~ qh("designer", 10)
    ~ qh("truong_phong", 3)
    ~ long_tl(3)
    ~ follow(5000)
* [🎵 "Bản 3 có nhịp. Nhìn như một đoạn điệp khúc."]
    designer: *(nhìn lại bản 3)* …Ủa. Đúng là em vẽ nó theo nhịp bài hát em nghe. Sao anh biết?
    ~ qh("designer", 6)
    ~ long_bh(3)
- { nguoi_theo_doi < 200000:
    _Chưa tới mốc 2. {sieu_nhan_hong} buồn, bỏ đi giúp người cả ngày. Studio trống trơn._
    ~ cang_thang(5)
}
-> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1410_hoi_chuong ===
# ngay:14 # gio:15:00 # noi:ban_so_lieu
_Bàn số liệu. {dan_dau_tu} đang nhìn chart, ăn bánh mì lén. Bạn chợt nhớ ra một chuyện._
con_ong_chau_cha: Anh Chương, cái vốn góp chung hồi năm ngoái sao rồi?
_{dan_dau_tu} cứng người như chart vừa đỏ._
dan_dau_tu: À… cái đó… nằm… đáy. Đáy thật.
* [😎 "Ờ, hông sao. Tui hỏi chơi."]
    dan_dau_tu: *(thở phào)* Em đúng là người có tầm nhìn dài hạn!
    ~ qh("dan_dau_tu", 5)
* [💬 "Thiệt ra tui đang cần tiền. Anh trả dần được hông?"]
    dan_dau_tu: *(nhìn bạn rất lâu)* Em… cần tiền? Em á?
    con_ong_chau_cha: Ừ. Lần đầu luôn.
    dan_dau_tu: …Tháng sau anh trả 500 nghìn. Hứa. Lần này là trả thật.
    ~ long_tl(5)
    ~ qh("dan_dau_tu", -2)
* [🎵 "Anh nói số liệu nhạc tự viết cao gấp ba hả? Cho tui xem lại."]
    dan_dau_tu: *(vui hẳn lên, mở số liệu thật)* Đây. Bài nào tự viết, có câu chuyện thật thì giữ chân người nghe lâu gấp ba.
    _"Có câu chuyện thật." Bạn ghi lại._
    ~ long_bh(5)
    ~ qh("dan_dau_tu", 4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1510_mat_dien ===
# ngay:15 # gio:08:10 # noi:sanh_tang_tret # bat_buoc
_Hôm nay bạn tới sớm (8 giờ 10) vì không ngủ được. Vừa bước vào sảnh: "Phụt." Mất điện cả khu._
_Từ thang máy vọng ra tiếng đập cửa. Tiếng chú bạn và tiếng {chi_dai}: "Bảo ơi! Mở cửa!"_
giam_doc: *(trong thang máy)* Long hả? Long! Gọi người cứu chú!
* [☂️ "Để cháu gọi… à." *(chú đang ở trong đó)*]
    _Lần đầu tiên câu cửa miệng của bạn vô dụng. Người bạn hay gọi đang kẹt trong thang máy._
    ~ long_od(-3)
    ~ cang_thang(5)
    _Bạn chạy đi tìm {it}._
    ~ qh("it", 2)
* [🏃 Chạy lên phòng server tìm {it}.]
    it: *(cầm đèn pin)* Ai kẹt?
    con_ong_chau_cha: Chú tui với chị Hương.
    it: …Chị Hương kẹt thì thang máy nên sợ, không phải chị Hương.
    _Hai người cùng nạy cửa thang máy. Mười phút sau, chú bước ra, áo ướt đẫm mồ hôi. {chi_dai} bước ra sau, tóc không lệch một sợi._
    ~ long_tl(5)
    ~ qh("it", 6)
    ~ qh("giam_doc", 5)
* [🗣️ Nói vọng vào: "Chú ơi, chill đi! Có chị Hương trong đó là an toàn nhất rồi!"]
    chi_dai: *(từ trong thang máy)* Long! Ra đây chị nói chuyện!
    giam_doc: Long… đi gọi người!
    ~ qh("chi_dai", -3)
    ~ follow(2000)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1510_pantry_dan ===
# ngay:15 # gio:14:00 # noi:pantry # bat_buoc
_Không máy lạnh, không wifi. Cả công ty ngồi pantry. {thuc_tap_sinh} chia 5 cục sạc dự phòng. Ai đó lôi trong kho studio ra một cây đàn cũ, dúi vào tay bạn._
hong_hot: Anh Long đàn được hông? Đàn một bài đi, nóng quá chết mất!
* [🎸 Ngân nga một đoạn "Hồng Là Thái Độ".]
    _Bạn gảy vài hợp âm. Rồi ngân nhỏ, rất nhỏ. Cả pantry im lặng. Không ai bấm điện thoại. Có lẽ vì hết pin._
    ~ long_bh(10)
    ~ long_phat_co_ghi_am = true
    ~ phat_hien(bai_hat_long)
    -> phat_hoi
* [🎸 Đàn bài "Công Viên" cho mọi người hát theo.]
    _"Ngày xưa có đôi bạn thân bán cá viên chiên…" Cả pantry hát theo. Lạc tông, vui vẻ. Không ai biết bạn có bài khác._
    ~ qh("hong_hot", 4)
    ~ qh("idol_het_thoi", 6)
    ~ cang_thang(-10)
* [🙅 "Thôi, tui đâu biết đàn."]
    _Bạn đặt đàn xuống. Một chút tiếc nuối. Một chút an toàn._
- -> END

= phat_hoi
_{idol_het_thoi} đứng ở cửa pantry, nghe hết. Bạn không biết anh ấy đã giơ điện thoại lên từ câu thứ hai._
idol_het_thoi: *(tháo kính đen, giọng như đang trả lời phỏng vấn)* Long. Bài em vừa ngân là bài gì vậy? Em biết anh là ai không? Anh nghe là biết hit liền.
* [🙈 "Bài trên mạng thôi anh, em nghe đâu đó."]
    _Giấu được. Nhưng {idol_het_thoi} đã ghi âm 20 giây._
    ~ long_phat_co_ghi_am = true
    { RANDOM(1, 10) <= 3:
        ~ long_mo_nhanh_ai_hat = true
        _Tối đó, {idol_het_thoi} ngồi trong căn 1808, nghe đi nghe lại 20 giây, viết thêm lời của mình vào._
    }
* [🎵 "Bài em tự viết cho Siêu Nhân Hồng. Chưa xong."]
    idol_het_thoi: Cho anh hát thử đi em.
    ~ long_mo_nhanh_ai_hat = true
    ~ long_bh(10)
    _Có người khen. Lần đầu tiên có người khen bài của bạn mà không biết bạn là cháu ai._
* {long_biet_phat_no} [🔒 "Anh Phát, anh cần một bài hit để trả nợ đúng hông? Nói thiệt đi, em hông kể ai."]
    _{idol_het_thoi} im lặng rất lâu. Rồi đeo kính lại._
    idol_het_thoi: …Ừ. Từ 2015 tới giờ anh chưa có bài nào.
    _{idol_het_thoi} giơ điện thoại lên, xóa đoạn ghi âm trước mặt bạn._
    ~ long_phat_co_ghi_am = false
    ~ long_hua_song_ca_ghi_ten = true
    ~ long_mo_nhanh_ai_hat = true
    ~ qh("idol_het_thoi", 20)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1510_sau_chiec_mu ===
# ngay:15 # gio:18:40 # noi:san_thuong
_Chạng vạng. Vẫn mất điện. Bạn lên sân thượng tìm gió. Ở góc, có hai người ngồi. Một người không đội mũ._
_Bạn nhận ra bộ đồ hồng. Nhưng gương mặt kia… bình thường. Rất bình thường. {sieu_nhan_hong} đang ngồi cạnh {chua_te_deadline}, nói nhỏ, tay vân vê chiếc mũ._
* [🤫 Lặng lẽ quay xuống.]
    _Bạn không thấy gì. Như Bác {bac_bao_ve} hay nói. Nhưng bạn nhớ cái cách {sieu_nhan_hong} cầm chiếc mũ: như cầm một thứ vừa là áo giáp vừa là gánh nặng._
    ~ long_bh(8)
    ~ qh("sieu_nhan_hong", 3)
* [🎵 Ngồi xuống bậc thang, ghi lời bài hát.]
    _"Sau chiếc mũ là một người bình thường. Người bình thường cũng cần ai đó gọi tên." Bạn viết liền một mạch._
    ~ long_bh(10)
* [📸 Giơ điện thoại lên.]
    _Bạn giơ lên. Rồi hạ xuống. Bạn biết cảm giác bị người ta chỉ nhìn thấy "cháu giám đốc", không ai thấy mặt thật. Bạn không chụp._
    ~ long_bh(5)
    ~ long_tl(2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1610_ghe_khach_moi ===
# ngay:16 # gio:13:30 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. Gameshow "Hồng Hay Không Hồng". Bạn được xếp hàng ghế khách mời. Bạn ngồi đó từ sớm, vì ghế êm._
_Chú bạn tới, muốn ngồi giữa để lên hình. {thanh_ninh} đang cầm sơ đồ chỗ ngồi, toát mồ hôi. {truong_phong} đứng cạnh máy quay số 2, nhìn hàng ghế bằng ánh mắt của người không có ghế._
* [🪑 Nhường ghế giữa cho chú, ngồi ra mép.]
    giam_doc: Ờ… cháu ngoan.
    _Ghế mép ngay cạnh lối đi. Lát nữa MC sẽ đi qua đúng chỗ này._
    ~ qh("giam_doc", 3)
    ~ qh("thanh_ninh", 4)
* [🤝 Vẫy {truong_phong}: "Ông ngồi đây nè, tui đứng được."]
    truong_phong: *(ngạc nhiên)* …Tớ đứng chỉ đạo. Cảm ơn.
    _Nhưng {truong_phong} nhìn bạn khác đi một chút. Một chút thôi._
    ~ qh("truong_phong", 6)
* [😎 Ngồi im ghế giữa.]
    giam_doc: Long… nhích sang chút cho chú.
    ~ long_od(3)
    ~ qh("thanh_ninh", -3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1610_mc_hoi ===
# ngay:16 # gio:15:20 # noi:dai_tivi_hong # bat_buoc
_Phần "Hit Một Thời". {sieu_nhan_hong} hát "Công Viên" sai lời: "bán… khoai chiên…". Cả trường quay cười ồ. Trong cánh gà, {idol_het_thoi} mấp máy môi đúng lời._
~ follow(80000)
_Hết phần thi. MC bất ngờ đi xuống hàng ghế khách mời, chĩa micro vào bạn._
mc_tivi_hong: Xin chào! Anh là ai trong ê-kíp của Siêu Nhân Hồng?
_Đèn chiếu thẳng vào mặt. Bạn chưa bao giờ phải tự giới thiệu mình mà không có chữ "chú"._ # hen_gio:6
* [☂️ "Dạ, chú tui là giám đốc ạ."]
    mc_tivi_hong: À… vâng! Xin cảm ơn… cháu giám đốc!
    _Cả trường quay cười. Clip "cháu giám đốc" lên Tóp-tóp tối đó. Chú bạn ngồi bên cạnh, đỏ mặt._
    ~ long_od(5)
    ~ long_tl(-5)
    ~ scandal()
    ~ follow(5000)
* [😶 "Dạ… tui lo marketing. Phòng tui có một người. Là tui."]
    mc_tivi_hong: Một người! Một người mà làm cả gameshow này! Xin một tràng pháo tay!
    _Khán giả vỗ tay thật. Câu trả lời thật thà được cắt thành clip, 200.000 lượt xem: "Phòng một người"._
    ~ long_tl(8)
    ~ long_od(-5)
    ~ follow(15000)
* [🎵 "Dạ… tui viết nhạc. Mà chưa ai nghe."]
    mc_tivi_hong: Ồ! Bí ẩn quá! Vậy hẹn anh ở chương trình sau nhé!
    _Chú bạn quay sang nhìn bạn. Một cái nhìn rất lâu. "Viết nhạc?"_
    ~ long_bh(5)
    ~ long_tl(5)
    ~ follow(8000)
* [⏱️ (Không chọn kịp)]
    _Bạn há miệng. Không có chữ nào đi ra. MC cười chuyên nghiệp, chuyển micro sang chú bạn. Chú nói 4 phút về "tầm nhìn"._
    ~ long_od(2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1610_buffet ===
# ngay:16 # gio:12:00 # noi:pantry
_Ngày Lương thực Thế giới. Buffet trưa ở công ty trước khi đi quay. Trà sữa thứ Sáu tới cùng lúc. Hôm nay ai cũng ăn miễn phí. Kể cả bạn, không cần thẻ._
* [🍱 Ngồi chung bàn với {thuc_tap_sinh}, {editor}, {it}.]
    _{thuc_tap_sinh} lấy đầy một hộp, nói "để dành tối ăn". {editor} ăn trong lúc ngủ. {it} ăn mì ly dù có buffet._
    it: Quen rồi.
    _Bạn nhìn ba người, mỗi người một kiểu sống. Có một câu hát: "mỗi người một cái tô, chung một cái bàn"._
    ~ long_bh(5)
    ~ an(40)
* [👂 Ngồi gần bàn {ke_toan} và {chi_dai}, nghe hai chị nói chuyện tiền chợ.]
    ke_toan: Rau muống lên 2 nghìn. Chị ghi rồi.
    chi_dai: Ghi chi vậy bà, có ai hoàn tiền rau đâu.
    _Bạn cười. Rồi bạn nhận ra mình không biết một bó rau muống giá bao nhiêu._
    ~ long_bh(4)
    ~ long_tl(2)
    ~ an(40)
* [📸 Chụp buffet đăng story, check-in "Công ty mình chất ghê".]
    ~ follow(3000)
    ~ long_so_lan_check_in = long_so_lan_check_in + 1
    ~ an(35)
- ~ nhan(tra_sua)
-> END
