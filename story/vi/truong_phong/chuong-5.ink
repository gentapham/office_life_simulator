// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT
// CHƯƠNG 5: "CUỘC HỌP VỀ VIỆC GIẢM HỌP" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== truong_phong_2110_len_phong_sep ===
# ngay:21 # gio:10:00 # noi:phong_giam_doc # bat_buoc
~ tp_lich_co_dinh()
_Mốc 3: 500.000 người theo dõi. Sáng nay, một bài đăng trên trang Confession G-Entertainment bóc chuyện {giam_doc} thế chấp biệt thự. Cả công ty xôn xao._
_{giam_doc} ngồi sau bàn, cạnh tấm bằng "Doanh nhân của năm", mắt thâm như vừa thức với ngân hàng cả đêm._
{ nguoi_theo_doi < 500000 || tp_so_cuoc_hop >= 45:
    -> bi_nhac
- else:
    -> qua_moc
}

= bi_nhac
giam_doc: {truong_phong}. Phòng em họp nhiều quá đấy. Anh không ép, tùy em.
_Bạn hiểu "tùy em" nghĩa là gì. Cả công ty hiểu "tùy em" nghĩa là gì._
* [📅 "Dạ, em sẽ tổ chức một cuộc họp để bàn về việc giảm số cuộc họp ạ."]
    giam_doc: …Em nghe mình vừa nói gì chưa?
    -> truong_phong_2110_hop_giam_hop
* [✂️ "Dạ. Từ mai phòng em chỉ họp một cuộc mỗi ngày."]
    ~ tp_ca_phong(10)
    ~ tp_ghe(3)
    giam_doc: Tốt. Anh thích quyết định nhanh.
    _Bạn bước ra, tay run nhẹ. Một cuộc mỗi ngày. Như cai thuốc lá._
* [🧱 "Anh cho em 5 phút trình bày lý do vì sao họp là cần thiết."]
    ~ tp_hop(1)
    ~ tp_ghe(-4)
    giam_doc: Đấy. Em vừa họp với anh về việc họp đấy.
- -> END

= qua_moc
giam_doc: Qua mốc 3 rồi. Phòng em làm tốt. Nhưng cái bài confession… em có biết ai đăng không?
* [🤐 "Dạ em không biết ạ."]
    giam_doc: Ừ. Anh tin em.
    ~ tp_ghe(2)
* [💬 "Anh có cần em họp phòng để trấn an mọi người không?"]
    ~ tp_hop(1)
    giam_doc: Không. Lần này đừng họp. Cứ làm việc như bình thường là được.
    ~ tp_ghe(1)
- -> END

// ------------------------------------------------------------
=== truong_phong_2110_hop_giam_hop ===
# ngay:21 # gio:14:00 # noi:phong_hop_sang_tao
_Cuộc họp để bàn về việc giảm số cuộc họp. Bắt đầu lúc 14:00. Bạn đã chuẩn bị 9 slide._
~ tp_hop(3)
~ tp_hop_ve_giam_hop = true
bien_kich: Một cuộc họp… để giết chết những cuộc họp. Như một con rắn tự cắn đuôi.
chua_te_deadline: Vậy mình chốt là mấy cuộc một ngày anh?
_Ba tiếng sau, kết luận: "Thành lập tổ công tác rà soát cuộc họp, họp mỗi sáng thứ Hai."_
* [🙈 Đọc lại kết luận, im lặng rất lâu.]
    _Bạn nhìn bảng trắng. Bảng trắng nhìn lại bạn. Có gì đó rất sai, và bạn biết chính xác đó là gì._
    ~ cang_thang(10)
    truong_phong: …Xóa dòng đó đi. Không có tổ công tác nào cả.
    ~ tp_ca_phong(5)
* [📝 "Cái này mình take note lại, họp tiếp sau nhé."]
    ~ tp_so_lan_take_note = tp_so_lan_take_note + 1
    ~ tp_ca_phong(-8)
    hong_hot: *(đứng ngoài cửa)* Ối dồi ôi, cuộc họp về giảm họp sẽ có phần hai!
* [😂 Phá lên cười.]
    _Bạn cười. Lần đầu cả phòng thấy bạn cười trong phòng họp. Mọi người cười theo. {editor} cười tới chảy nước mắt._
    ~ tp_ca_phong(8)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== truong_phong_2110_hoc_dem ===
# ngay:21 # gio:22:15 # noi:phong_dung_phim
_22 giờ 15. Phòng dựng. {editor} đang ngồi đó, như mọi đêm._
{ tp_mo_ca_dem:
    -> ca_dem
- else:
    -> mot_minh
}

= ca_dem
editor: Tới rồi hả anh. Bài hôm nay: chỉnh màu. Hồng phải ra hồng, không ra cam.
* [🎨 Ngồi xuống, làm theo từng bước.]
    ~ tp_tn(10)
    ~ nghi(-15)
    ~ qh("editor", 5)
    _Bạn kéo thanh màu. Áo choàng của Siêu Nhân Hồng chuyển từ cam sang hồng. {editor} gật đầu một cái. Một cái thôi, nhưng bạn nhớ tới sáng._
* [😴 "Hôm nay anh mệt quá, em dạy sau nhé."]
    ~ nghi(10)
    editor: Dạ. Render xong là xong. Học xong mới xong.
- -> END

= mot_minh
_{editor} không quay lại. Bạn đứng ở cửa một lúc, rồi lên máy dựng phụ, mở video con cú._
* [🌙 Học một bài.]
    -> truong_phong_mg_hoc_lom
* [🚪 Về.]
    -> END

// ------------------------------------------------------------
=== truong_phong_2210_thue ===
# ngay:22 # gio:09:20 # noi:phong_san_xuat # bat_buoc
~ tp_lich_co_dinh()
_Đoàn kiểm tra thuế bất ngờ tới. Trưởng đoàn là Chú Liêm, 55 tuổi, cặp da đen, đi đâu cũng nhìn xuống đất xem có chó không._
ke_toan: *(nói rất chậm)* Anh {truong_phong}. Đoàn thuế lên tầng 2 rồi. Phòng anh làm ơn trông giống như đang làm việc.
* [📅 "Cả phòng vào phòng họp. Mình họp nhanh 5 phút về… mọi thứ."]
    ~ tp_hop(1)
    _Hai cán bộ thuế đi ngang, bị bạn mời vào ngồi dự. Hai mươi phút sau, cả hai ngủ gật, đầu tựa vào nhau._
    ~ qh("ke_toan", 10)
    ke_toan: *(thì thầm)* Lần đầu tiên chị thấy họp có ích.
* [🎬 "Mọi người ngồi yên tại chỗ, làm việc thật đi."]
    { RANDOM(1, 10) <= 5:
        chu_liem: Ồ. Phòng này làm việc thật này. Tốt. Tốt lắm.
        ~ uy_tin = uy_tin + 5
        ~ qh("ke_toan", 5)
    - else:
        _Chú Liêm đi ngang đúng lúc {chua_te_deadline} đang lướt Tóp-tóp, tiếng nhạc trend vang lên to rõ._
        chu_liem: Cậu kia đang phân tích… xu hướng à?
        chua_te_deadline: Dạ… nghiên cứu thị trường ạ.
        ~ qh("ke_toan", -5)
    }
* {biet(trang_47)} [🔒 "Chị cứ để em. Em có bảng trắng giải thích dòng tiền 5 tỷ."]
    _Bạn vẽ sơ đồ 4 tầng: Siêu Nhân Hồng, hợp đồng 52 trang, chiến dịch, mục tiêu. Mũi tên nào cũng có màu hồng._
    chu_liem: *(gật gù)* Ừ… ừ… thế cái mũi tên này đi đâu?
    truong_phong: Đi tới tương lai ạ.
    chu_liem: Được. Chú không hiểu, nhưng chú thấy có quy trình.
    ~ tp_ghe(10)
    ~ qh("giam_doc", 10)
    ~ qh("ke_toan", 12)
- _Dưới sân, {cho} sủa một tiếng. Chú Liêm giật mình suýt đánh rơi cặp._
-> END

// ------------------------------------------------------------
=== truong_phong_2210_bang_chung_thang_6 ===
# ngay:22 # gio:14:30 # noi:phong_hop_tang_2
_Chú Liêm đòi xem bằng chứng nghiệm thu dự án quảng cáo tháng 6, hợp đồng 800 triệu. Cả phòng nhìn {chua_te_deadline}. {chua_te_deadline} nhìn cái cửa sổ._
chu_liem: File gốc đâu? Có file gốc là xong.
* {tp_vu_giu_bi_mat} [🔒 Đứng chắn trước {chua_te_deadline}: "File gốc phòng em đang phục hồi ạ. Hẹn chú trong tuần."]
    chu_liem: Được. Nhưng trong tuần là trong tuần đấy.
    ~ qh("chua_te_deadline", 20)
    chua_te_deadline: *(thì thầm)* …Anh {truong_phong}. Tui nợ anh một lần.
* [🧑‍💻 "Anh {it} ơi, server công ty có sao lưu không ạ?"]
    it: Có. Từ 2016. Ở… chỗ khác. Để em coi.
    _{it} nói "để em coi" bằng giọng của người đang giấu một ổ cứng dưới gầm giường._
    ~ qh("it", 3)
* [😶 Quay sang {chua_te_deadline}: "Cậu là điều phối, cậu trả lời đi."]
    chua_te_deadline: Dạ… file đó… *(nuốt nước bọt)* …còn sớm mà chú.
    chu_liem: Sớm gì? Tháng 6 rồi.
    ~ qh("chua_te_deadline", -10)
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== truong_phong_2210_phong_thu_tang_30 ===
# ngay:22 # gio:21:00 # noi:sky_ao_tang_30 # dieu_kien:tp_mo_phong_thu
{ not tp_mo_phong_thu:
    -> END
}
_Tối thứ Năm. Penthouse tầng 30, Sky Ảo. Rộng, trống, lạnh. Bể cá to hơn cả phòng khách nhà bạn._
_{con_ong_chau_cha} mở khóa căn phòng cuối hành lang. Một cây đàn, một bàn phím, một cái micro, và một màn hình có 41 tệp tên "Hồng Là Thái Độ – bản 1" tới "bản 41"._
con_ong_chau_cha: Ông là người thứ nhất bước vô đây đó. Chú tui còn chưa vô.
_Bạn dựng cái bảng trắng gấp gọn lên cạnh cây đàn. Nó lạc lõng như một biên bản giữa buổi hòa nhạc._
* [🧱 Nghe từng bản, ghi lên bảng những đoạn hay nhất.]
    _Bản 7 có đoạn mở đầu đẹp. Bản 23 có câu điệp khúc. Bản 38 có đoạn bridge làm bạn nổi da gà. Bạn vẽ mũi tên nối chúng lại._
    con_ong_chau_cha: *(nhìn bảng, im lặng lâu)* Trời… ông vừa làm cái sơ đồ đầu tiên trong đời tui hiểu được.
    ~ qh("con_ong_chau_cha", 15)
* [💬 "Sao cậu không cho chú cậu nghe?"]
    con_ong_chau_cha: Nghe xong chú nói "hay, để chú lo". Rồi bài này thành bài của "cháu giám đốc". Tui hông muốn.
    _Bạn hiểu. Bạn hiểu rõ hơn ai hết cảm giác tên mình bị đặt lên một thứ không thuộc về mình. Chỉ là ngược chiều._
    ~ qh("con_ong_chau_cha", 10)
    ~ tp_lo(-5)
* [🎧 Ngồi im nghe bản 41, không ghi gì.]
    ~ qh("con_ong_chau_cha", 8)
    ~ cang_thang(-12)
    _Bạn không ghi. Lần đầu tiên bạn nghe một thứ mà không nghĩ cách trình bày nó trong cuộc họp._
- -> END

// ------------------------------------------------------------
=== truong_phong_2310_chuan_bi_livestream ===
# ngay:23 # gio:13:00 # noi:studio_tang_2 # bat_buoc
~ tp_lich_co_dinh()
_Sinh nhật Siêu Nhân Hồng, 31 tuổi. Livestream lúc 15:00, bạn làm đạo diễn. Kịch bản có màn "nhà tài trợ BTT Global, Mr. Kevin Trộn, gửi lời chúc". Nhưng Mr. Kevin Trộn… không có thật._
sales: *(kéo bạn ra góc)* Anh {truong_phong}, cứu em. Cần một người đóng Mr. Kevin Trộn, đeo kính đen, nói tiếng Anh vài câu.
* [👔 Chọn {thuc_tap_sinh}: "Duy mặc vest trông rất… tài chính."]
    thuc_tap_sinh: Dạ… em mặc vest quen rồi ạ… à dạ, em thử ạ!
    _{thuc_tap_sinh} khoác vest vào, đứng thẳng, nói "Good afternoon" chuẩn như người đã đọc báo cáo quý 10 năm. Cả phòng im lặng._
    ~ qh("thuc_tap_sinh", 8)
    ~ qh("sales", 8)
    ~ follow(10000)
* [📉 Chọn {dan_dau_tu}: "Anh {dan_dau_tu} có khí chất người hay… nói về tiền."]
    dan_dau_tu: Đóng chủ tịch tập đoàn hả? Lần này là lên thật!
    _{dan_dau_tu} diễn hơi quá, lỡ mời khán giả "đầu tư vào tương lai Hồng". Phải cắt gấp._
    ~ qh("dan_dau_tu", 5)
    ~ follow(3000)
* [🛡️ Hỏi bác {bac_bao_ve}.]
    bac_bao_ve: Bác à? Bác không biết tiếng Anh. Bác chỉ biết "ô kê".
    _Bác đeo kính đen, ngồi yên, nói đúng một câu "Ô kê. Happy birthday." Bình luận nổ tung: "Ông chú này ngầu quá!"_
    ~ qh("bac_bao_ve", 8)
    ~ qh("sales", 5)
    ~ follow(8000)
* [😶 "Cắt màn đó đi. Không có thật thì đừng diễn."]
    sales: Ủa anh! Sao mà căng!
    ~ qh("sales", -10)
    ~ uy_tin = uy_tin + 3
- -> END

// ------------------------------------------------------------
=== truong_phong_2310_livestream ===
# ngay:23 # gio:15:30 # noi:studio_tang_2 # bat_buoc
_Livestream đang chạy. 40.000 người xem. Giữa buổi, {sieu_nhan_hong} cầm micro, quay về phía {chua_te_deadline} đang đứng cầm bảng nhắc chữ._
sieu_nhan_hong: {chua_te_deadline} ơi… em… à, anh… anh thích em lâu rồi. Không phải PR đâu.
_Màn hình bình luận chạy như thác: \#VũƠiTrảLờiĐi. {chua_te_deadline} đứng hình, bảng nhắc chữ rơi xuống đất._
~ follow(60000)
_Đúng lúc đó, cửa studio hé mở. {cho} thò mũi vào. Mắt {cho} khóa chặt vào cái bánh kem hồng ba tầng._ # hen_gio:5
* [✂️ Hô "Cắt!" và chuyển sang camera phụ.]
    ~ tp_cat_kip_banh_kem = true
    _Màn hình chuyển sang cảnh hoa hồng. Ngoài khung hình, một tiếng "BỐP" và một tiếng "GÂU" đầy thỏa mãn._
    ~ uy_tin = uy_tin + 5
    ~ tp_ghe(3)
    _Buổi livestream sạch sẽ, chuyên nghiệp. Không ai biết cái bánh đã thành bãi chiến trường._
* [🎥 Để máy quay chạy.]
    _{cho} lao vào. Bánh kem bay. Kem hồng dính đầy mũ của {sieu_nhan_hong}. {sieu_nhan_hong} vừa tỏ tình xong, giờ đứng giữa đống kem, cười như mếu._
    { RANDOM(1, 10) <= 6:
        ~ follow(60000)
        hong_hot: Ối dồi ôi! Clip lên xu hướng rồi! "Tỏ tình xong bị chó phá bánh"!
        ~ scandal()
    - else:
        ~ follow(10000)
        _Clip có lượt xem, nhưng nhiều người bình luận "dàn dựng". {sieu_nhan_hong} buồn cả tối._
        ~ qh("sieu_nhan_hong", -5)
    }
* [📅 Bấm bộ đàm: "Ê-kíp họp khẩn 1 phút!"]
    ~ tp_hop(1)
    _Một phút họp khẩn. Đủ để {cho} ăn hết tầng một của bánh, trực tiếp trên sóng._
    ~ follow(5000)
    ~ tp_ghe(-3)
* [⏱️ (Không chọn kịp)]
    _Bạn đứng hình như {chua_te_deadline}. Hai người đàn ông đứng hình trong cùng một buổi livestream._
    ~ follow(20000)
- -> END

// ------------------------------------------------------------
=== truong_phong_2310_sau_livestream ===
# ngay:23 # gio:19:30 # noi:phong_san_xuat
_Tối. Phòng Sản xuất vắng. {chua_te_deadline} ngồi một mình, nhìn điện thoại. \#VũƠiTrảLờiĐi vẫn đứng top 3._
chua_te_deadline: Anh {truong_phong}… anh nghĩ đó là PR hông?
* [💬 "Anh không biết. Nhưng anh thấy anh ấy run."]
    chua_te_deadline: *(im lặng)* …Ờ. Tui cũng thấy.
    ~ qh("chua_te_deadline", 10)
* [📅 "Cái này cậu cần một cuộc họp với chính mình đấy."]
    chua_te_deadline: Trời. Anh {truong_phong} đúng là anh {truong_phong}.
    _Nhưng {chua_te_deadline} cười. Và không lướt Tóp-tóp nữa._
    ~ qh("chua_te_deadline", 4)
* [😶 Đặt một lon cà phê lên bàn, đi về.]
    ~ qh("chua_te_deadline", 6)
    _Có những chuyện không cần biên bản._
- -> END

// ------------------------------------------------------------
=== truong_phong_2410_hoa_giai ===
# ngay:24 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Thứ Bảy, Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Mỗi bàn một cặp. Bàn số 1: bạn và {con_ong_chau_cha}._
chi_dai: Luật nè: mỗi người khen người kia ba câu. Khen thật. Đứa nào khen xạo chị biết liền.
_Bàn bên cạnh, {dan_dau_tu} ngồi một mình giữa một vòng tròn chủ nợ. {ke_toan} và {sales} không ai nhìn ai._
* [😇 "Một: cậu hát hay. Hai: cậu không bao giờ nói xấu ai. Ba: cậu… đi trễ rất đều."]
    con_ong_chau_cha: *(phì cười)* Câu ba khen hả?
    truong_phong: Đều là một đức tính.
    con_ong_chau_cha: Ờ. Một: ông làm việc thiệt. Hai: ông hông bao giờ nhờ ai gọi chú. Ba: ông… vẽ sơ đồ đẹp.
    chi_dai: Được. Hai đứa này qua.
    ~ qh("con_ong_chau_cha", 12)
    ~ qh("chi_dai", 5)
* [🪑 "Một: cậu có chú. Hai: cậu có chú. Ba: cậu có chú."]
    chi_dai: {truong_phong}. Ra sân thượng đứng 5 phút cho chị.
    ~ qh("con_ong_chau_cha", -12)
    ~ qh("chi_dai", -8)
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
* [📝 "Cho tớ ghi ra giấy trước đã."]
    ~ tp_hop(1)
    _Bạn viết 3 câu khen dưới dạng biên bản. {con_ong_chau_cha} đọc, bật cười, ký tên vào dưới như biên bản thật._
    ~ qh("con_ong_chau_cha", 6)
- -> END

// ------------------------------------------------------------
=== truong_phong_2410_clip_phat ===
# ngay:24 # gio:20:00 # noi:can_501_pho_moi
_Tối. Clip {idol_het_thoi} hát "Công Viên" trong bóng tối hôm mất điện đang viral. Ai đăng không rõ. Cùng lúc, có tài khoản bóc chuyện fan ảo của {idol_het_thoi}._
hong_hot: Anh {truong_phong}! Clip anh {idol_het_thoi} đang lên mà phốt fan ảo cũng lên! Làm sao giờ, đăng tiếp hay ngưng?
* [🎬 "Đăng bản đầy đủ, ghi rõ: quay bởi {editor}, đêm 15/10."]
    ~ tp_ghi_cong()
    ~ qh("editor", 8)
    ~ qh("idol_het_thoi", 8)
    ~ follow(15000)
    _Bình luận chuyển từ "fan ảo" sang "giọng thật đỉnh vậy cần gì fan ảo". Không phải ai cũng đổi ý. Nhưng đủ nhiều._
* [📅 "Mai mình họp xử lý khủng hoảng."]
    ~ tp_so_lan_take_note = tp_so_lan_take_note + 1
    hong_hot: Mai là hết hot rồi anh ơi!
    ~ follow(-5000)
* [📞 "Hỏi anh {quan_ly_idol} trước. Đây là nghệ sĩ của anh ấy."]
    quan_ly_idol: Khoan, anh nghe máy chút… *(5 phút sau)* Chuyện này để anh lo, đừng ai đăng gì hết!
    ~ qh("quan_ly_idol", 10)
- -> END

// ------------------------------------------------------------
=== truong_phong_2510_chu_nhat ===
# ngay:25 # gio:10:00 # noi:can_501_pho_moi
_Chủ nhật. Căn 501. Bạn đứng trước bảng trắng, định tổ chức "họp gia đình" như mọi chủ nhật. Gia đình gồm: bạn, và cái bảng._
{ tp_mo_phong_thu:
    _Điện thoại rung. {con_ong_chau_cha} nhắn: "Ông rảnh hông? Tui muốn cho chú nghe bài. Mà tui sợ. Ông lên giúp tui soạn cách nói được hông?"_
}
* {tp_mo_phong_thu} [🔒 Gấp bảng trắng, bắt xe lên Sky Ảo.]
    _Hai người ngồi cả buổi chiều. Bạn vẽ sơ đồ cách trình bày: mở bằng bản 41, kết bằng câu "cháu muốn tự làm". {con_ong_chau_cha} tập nói 11 lần._
    con_ong_chau_cha: Ông hông sợ tui nổi lên rồi giành ghế ông hả?
    truong_phong: …Có sợ. Nhưng bài này hay quá.
    ~ qh("con_ong_chau_cha", 12)
    ~ tp_giup_long_trinh_bay = true
* [📅 Họp với bảng trắng 2 tiếng như thường lệ.]
    ~ tp_hop(1)
    _Biên bản: "Gia đình thống nhất tiếp tục họp." Không ai phản đối._
    ~ cang_thang(5)
* [✍️ Mở "Đơn xin đề bạt", sửa thêm một lần.]
    ~ tp_ban_nhap_so = tp_ban_nhap_so + 1
    _Bản {tp_ban_nhap_so}. Bạn đổi chữ "trách nhiệm" thành "tận tụy". Đổi lại. Đổi lần nữa._
* [🌳 Ra công viên Hồ Cá Mập ngồi ghế đá, không mang gì theo.]
    ~ cang_thang(-15)
    ~ nghi(15)
    _Không có cá mập. Không có cuộc họp. Có một bà cụ cho chim ăn. Bạn ngồi tới trưa._
- -> END

// ------------------------------------------------------------
=== truong_phong_2610_giao_ban_tin_don ===
# ngay:26 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
~ tp_lich_co_dinh()
_Họp giao ban. Tin đồn "cắt giảm nhân sự nếu Siêu Nhân Hồng thất bại" lan khắp công ty. Nghe nói danh sách có tên {thuc_tap_sinh}._
~ tp_hop(1)
thuc_tap_sinh: *(nhỏ giọng)* Dạ… anh {truong_phong}… nếu em bị cắt thì em… dạ em hiểu ạ.
* [🛡️ "Phòng anh không cắt ai. Ai muốn cắt thì phải họp với anh trước."]
    ~ tp_ca_phong(12)
    ~ qh("thuc_tap_sinh", 10)
    _Lần đầu tiên câu "phải họp với anh trước" nghe như một cái khiên._
* [😶 "Anh không biết. Mọi người cứ làm tốt việc của mình."]
    ~ tp_ca_phong(-3)
    _Câu trả lời đúng. Nhưng không ai thấy đỡ lo._
* [📊 "Mình làm bảng tổng kết đóng góp từng người, anh mang lên sếp."]
    ~ tp_hop(1)
    _Bạn ghi tên từng người cạnh việc họ làm. Lần này, cột "Người thực hiện" không có chữ "Nhật"._
    ~ tp_ghi_cong()
    ~ tp_ca_phong(6)
    ~ tp_lo(-5)
- -> END

// ------------------------------------------------------------
=== truong_phong_2610_trinh_bay_bai_hat ===
# ngay:26 # gio:11:00 # noi:phong_giam_doc # dieu_kien:tp_giup_long_trinh_bay
{ not tp_giup_long_trinh_bay:
    -> END
}
_Phòng giám đốc. {con_ong_chau_cha} đứng trước mặt chú, tay cầm cái loa nhỏ. Bạn đứng phía sau, cầm cái bảng trắng gấp gọn như cầm khiên._
con_ong_chau_cha: Chú… cháu có bài này. Cháu tự viết. Cho Siêu Nhân Hồng.
_Bản 41 vang lên. {giam_doc} ngồi im. Tới đoạn bridge, {giam_doc} cởi kính ra._
giam_doc: Cháu… viết từ bao giờ?
con_ong_chau_cha: Từ lâu rồi chú.
* [🧱 Mở bảng trắng: "Anh ơi, đây là kế hoạch đưa bài vào Đêm Hồng, phòng em lo sản xuất."]
    giam_doc: *(nhìn sơ đồ, nhìn hai đứa)* Hai đứa làm chung từ bao giờ thế?
    truong_phong: Từ hôm qua ạ.
    giam_doc: Được. Anh không ép. *(ngừng)* Lần này anh nói thật: anh không ép.
    ~ qh("giam_doc", 8)
    ~ qh("con_ong_chau_cha", 10)
    ~ tp_ghe(3)
* [😶 Đứng im, để {con_ong_chau_cha} tự nói hết.]
    con_ong_chau_cha: Cháu hông cần chú lo. Cháu chỉ cần chú nghe.
    giam_doc: …Chú nghe rồi. Hay. Hay thật.
    ~ qh("con_ong_chau_cha", 12)
- _Ra khỏi phòng, {con_ong_chau_cha} đấm nhẹ vào vai bạn. Không nói gì. Không cần nói._
-> END

// ------------------------------------------------------------
=== truong_phong_2610_chieu_thu_phim ===
# ngay:26 # gio:16:00 # noi:phong_hop_tang_2
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". 15 phút. Biên kịch: {bien_kich}. Một anh nhân viên ngân hàng bỏ việc, được một người mặc đồ hồng đẩy xe trong mưa._
_Bạn nhớ cuộc họp 2/10. Nhớ {thuc_tap_sinh} kể "một người hùng không ai biết tên"._
_Sau buổi chiếu, {giam_doc} quay sang {editor}: "Lĩnh, anh nghe nói em có kênh Diu-túp gần 1 triệu sub, 'Cú Đêm Cắt Ghép'. Anh trả 200 triệu, bán cho công ty nhé?"_
_Kênh có con cú. Kênh bạn học mỗi đêm. Giọng ngái ngủ nói "render xong là xong"._
~ tp_biet_linh_la_cu_dem = true
~ phat_hien(kenh_cu_dem)
* [🙏 "Anh ạ, kênh đó là của {editor}. Em nghĩ nên để {editor} giữ. Phòng em học từ kênh đó."]
    ~ tp_ghi_cong()
    ~ tp_lo(-10)
    ~ qh("editor", 15)
    ~ tp_ghe(-3)
    editor: *(nhìn bạn)* …Anh học từ kênh em hả?
    truong_phong: Hai tháng nay. Đêm nào cũng học.
    _{editor} không nói gì. Nhưng tối đó, kênh "Cú Đêm" đăng một video mới: "Bài dành cho người mới, từ số 0"._
    { not tp_mo_ca_dem:
        ~ tp_mo_ca_dem = true
    }
* [💬 Quay sang {thuc_tap_sinh}: "Ý tưởng phim này… nghe quen nhỉ?"]
    thuc_tap_sinh: Dạ… dạ giống ý em kể hồi trước. Mà chắc trùng thôi ạ.
    bien_kich: *(cứng người)* Đây không phải đạo, đây là cảm hứng.
    { truong_phong_0210_hop_chien_dich > 0:
        truong_phong: Biên bản họp 2/10 có ghi đấy, {bien_kich}.
        ~ qh("bien_kich", -10)
        ~ qh("thuc_tap_sinh", 12)
        ~ tp_ghi_cong()
    }
* [😶 Im lặng.]
    _Kênh con cú. Ý tưởng của {thuc_tap_sinh}. Hôm nay bạn biết hai bí mật, và cả hai đều giống bí mật của bạn._
    ~ cang_thang(8)
- -> END

// ------------------------------------------------------------
=== truong_phong_2710_ll_toi ===
# ngay:27 # gio:10:30 # noi:sanh_tang_tret # bat_buoc
~ tp_lich_co_dinh()
_LL-Entertainment ra tay. Lưu Lực đích thân tới, vest trắng, tóc vuốt keo, ôm một tập hồ sơ màu xanh lá chuối. Lời mời gấp ba cho Siêu Nhân Hồng._
luu_luc: Chào các bạn {cong_ty}. Việc hôm nay phải xong từ hôm qua. Mà hôm qua các bạn đang… họp thì phải?
_Lưu Lực liếc thẳng vào bạn. Rồi ánh mắt Lưu Lực dừng ở {chi_dai}, đang đứng ở chân cầu thang. Tập hồ sơ rơi xuống đất, giấy bay tứ tung._
chi_dai: *(khoanh tay)* Lâu quá hen. Quán Ốc Đêm còn mở đó.
* [📄 Nhặt hồ sơ giúp, liếc thấy tên mấy đồng nghiệp trên đó.]
    _Tên {quan_ly_idol}. Tên {ke_toan}. Tên {it}. Mỗi tên một con số. Bạn đưa lại tập hồ sơ, tay hơi run._
    ~ phat_hien(ll_moi_thai)
    ~ cang_thang(5)
* [🧱 "Anh Lực, bên em đang họp. Anh đặt lịch trước nhé."]
    luu_luc: Đặt lịch? Bên tôi không đặt lịch. Bên tôi đặt cọc.
    _Nhưng Lưu Lực vẫn cúi xuống nhặt giấy. Chưa ai từng bắt Lưu Lực đặt lịch._
    ~ qh("giam_doc", 4)
* [😶 Đứng sau lưng {chi_dai}.]
    ~ qh("chi_dai", 5)
    _Bạn không biết chuyện gì từng xảy ra ở Quán Ốc Đêm. Nhưng bạn biết đứng sau {chi_dai} là chỗ an toàn nhất tòa nhà._
- -> END

// ------------------------------------------------------------
=== truong_phong_2710_trailer ===
# ngay:27 # gio:14:00 # noi:phong_dung_phim
_Trailer phim ngắn "Người Hùng Không Tên" ra mắt. Dòng chữ cuối: "Biên kịch & Ý tưởng: {bien_kich}". {editor} cần bạn duyệt trước khi đăng._
* [🙏 "Thêm dòng: Ý tưởng gốc: {thuc_tap_sinh}."]
    { tp_so_lan_ghi_cong >= 3:
        editor: Dạ. Anh ghi công riết thành quen tay rồi đó.
    }
    ~ tp_ghi_cong()
    ~ qh("thuc_tap_sinh", 15)
    ~ qh("bien_kich", -8)
    ~ tp_lo(-5)
* [🎭 "Cứ đăng như thế."]
    ~ qh("bien_kich", 5)
    _Bạn nhìn dòng chữ một giây lâu hơn bình thường. Bạn biết cảm giác đứng sau dòng chữ của người khác._
* [🛠️ Tự sửa dòng credits, để {editor} ngồi xem.]
    { tp_tay_nghe >= 30:
        _Phím T. Gõ. Căn giữa. Xuất. {editor} không phải chạm vào chuột lần nào._
        ~ tp_tn(5)
        ~ tp_ghi_cong()
        ~ qh("editor", 6)
    - else:
        _Bạn căn giữa nhầm thành căn lề trái. Chữ bay ra khỏi khung hình. {editor} lặng lẽ sửa lại._
        ~ tp_tn(2)
        ~ tp_lo(3)
    }
- ~ follow(20000)
-> END

// ------------------------------------------------------------
=== truong_phong_2710_long_noi_that ===
# ngay:27 # gio:21:30 # noi:san_thuong
_Tối. Sân thượng công ty. Gió lạnh. {con_ong_chau_cha} đứng tựa lan can, điện thoại sáng một tin nhắn thoại của Lưu Lực: "300 triệu cho bài đó."_
{ tp_mo_phong_thu && qh_con_ong_chau_cha >= 30:
    -> noi_that
- else:
    _{con_ong_chau_cha} thấy bạn, cất điện thoại, gật đầu chào rồi đi xuống. Hai người như hai đối thủ chuẩn bị cho trận cuối._
    ~ cang_thang(5)
    -> END
}

= noi_that
con_ong_chau_cha: Ông {truong_phong}. Nói thiệt nha. Ông muốn cái ghế đó thì lấy đi. Tui chỉ muốn làm nhạc.
_Sáu năm. Một tháng chiến tranh. Và đối thủ của bạn chưa bao giờ ra trận._
~ tp_biet_long_khong_muon_ghe = true
* [😶 Ngồi xuống bậc thềm, cười ra tiếng.]
    truong_phong: Thế mà tớ sửa đơn 15 lần.
    con_ong_chau_cha: Mười lăm? Trời đất. Tui chưa viết lần nào.
    ~ qh("con_ong_chau_cha", 10)
    ~ cang_thang(-15)
* [🪑 "Thật không? Hay cậu đang thả mồi?"]
    con_ong_chau_cha: Ông coi tui giống người biết thả mồi hông?
    ~ qh("con_ong_chau_cha", 3)
* [💬 "Thế còn LL? Cậu có bán bài không?"]
    con_ong_chau_cha: Hông. Bài đó viết cho Siêu Nhân Hồng. Mà ông hỏi vậy… là ông lo cho bài tui hả?
    truong_phong: Lo cho chương trình Đêm Hồng thôi.
    con_ong_chau_cha: Xạo.
    ~ qh("con_ong_chau_cha", 8)
- -> END
