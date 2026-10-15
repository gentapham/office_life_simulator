// ============================================================
// CON ÔNG CHÁU CHA: LONG
// CHƯƠNG 5: "AI HÁT BÀI NÀY?" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== con_ong_chau_cha_2110_confession ===
# ngay:21 # gio:09:00 # noi:phong_pho_phong_marketing # bat_buoc
_Mốc 3: 500.000 người theo dõi. Sáng nay trang Confession G-Entertainment đăng một bài ẩn danh: "Sếp công ty mình thế chấp biệt thự ở Ngân hàng Tín Dụng Đen Đủi. Ai biết gì hông?"_
~ phat_hien(the_chap_biet_thu)
_Cả công ty lướt bài đó. Rồi cả công ty lén nhìn về phía phòng bạn. Cháu sếp. Chắc biết._
{ nguoi_theo_doi < 500000:
    _Chưa qua mốc 3. Tin đồn "cắt giảm nhân sự" bắt đầu lan. Lần đầu tiên bạn nghe thấy tên mình trong một tin đồn mà không kèm chữ "được"._
}
* [🛡️ Đi ra pantry, nói to: "Ai muốn hỏi gì về chú tui thì hỏi tui."]
    _Pantry im lặng. Không ai hỏi. Nhưng {chi_dai} gật đầu với bạn từ góc phòng._
    ~ qh("chi_dai", 6)
    ~ long_od(-5)
    ~ long_tl(5)
* [😶 Đóng cửa phòng, không ra ngoài cả buổi sáng.]
    _Phòng một người. Giờ thì thật sự là một người._
    ~ cang_thang(8)
    ~ long_bh(4)
* [☂️ Gọi chú.]
    ~ long_goi_chu()
    { long_noi_chuyen_that_voi_chu:
        giam_doc: *(bắt máy, giọng mệt)* Chú biết rồi. Cháu cứ làm việc của cháu. Đừng lo cho chú.
        ~ qh("giam_doc", 4)
    - else:
        _Chú không bắt máy. Bạn biết vì sao rồi._
    }
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2110_phat_hen ===
# ngay:21 # gio:20:00 # noi:karaoke_hat_cho_nhau_nghe # bat_buoc
_Tối. Karaoke Hát Cho Nhau Nghe, phòng số 3. {idol_het_thoi} ngồi đó, kính đen, gọi sẵn hai chai nước. Không có micro nào được bật._
idol_het_thoi: Long. Em cho anh mượn bài đó đi. Anh hát, mình cùng nổi. Em biết anh là ai không? Anh là người duy nhất ở công ty từng có hit.
{ long_phat_co_ghi_am:
    _{idol_het_thoi} bật điện thoại. 20 giây. Giọng bạn, hôm mất điện. Giai điệu của bạn, trong máy của người khác._
}
* [🎤 "Ừ. Anh hát đi."]
    idol_het_thoi: *(gỡ kính ra)* Thật hả? Em không đòi gì hả?
    con_ong_chau_cha: …Hông.
    ~ long_nguoi_hat = "phat"
    ~ long_ghi_ten = false
    ~ qh("idol_het_thoi", 15)
    _Bạn về nhà, ngồi trong phòng thu, nhìn 41 tệp demo. Bạn không biết mình vừa cho đi một bài hát, hay cho đi một phần của mình._
* {long_hua_song_ca_ghi_ten || qh_idol_het_thoi >= 20} [🔒 "Anh song ca với Siêu Nhân Hồng. Tên tui ghi ở dòng 'Nhạc & lời'."]
    idol_het_thoi: *(im lặng lâu)* …Song ca. Với cái người làm anh hết thời đó hả?
    con_ong_chau_cha: Với người đang làm cả công ty sống lại.
    idol_het_thoi: *(đeo kính lại)* Được. Ghi tên em. Anh hứa.
    ~ long_nguoi_hat = "song_ca"
    ~ long_ghi_ten = true
    ~ qh("idol_het_thoi", 10)
    ~ long_tl(6)
* [🙅 "Bài này viết cho Siêu Nhân Hồng. Em xin lỗi anh."]
    idol_het_thoi: *(cười nhạt)* Ừ. Ai cũng viết cho Siêu Nhân Hồng.
    ~ qh("idol_het_thoi", -10)
    ~ long_tl(4)
    { long_phat_co_ghi_am:
        _{idol_het_thoi} cất điện thoại vào túi. Đoạn ghi âm vẫn ở trong đó._
    }
* [💬 "Anh Phát, anh nợ nhiêu?"]
    idol_het_thoi: *(khựng lại)* …54 triệu. 36 tiền nhà, 18… tiền khác.
    _Bạn biết "tiền khác" là gì. 80.000 tài khoản comment "Anh Phát đỉnh nóc kịch trần"._
    ~ long_biet_phat_no = true
    ~ phat_hien(fan_ao_phat)
    ~ long_bh(6)
    ~ qh("idol_het_thoi", 5)
    idol_het_thoi: Đừng kể ai. Kể Thái càng không.
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2210_thue ===
# ngay:22 # gio:10:15 # noi:phong_pho_phong_marketing # bat_buoc
_Đoàn kiểm tra thuế bất ngờ tới. Trưởng đoàn là Chú Liêm, 55 tuổi, đi đâu cũng nhìn xuống đất xem có chó không. Chú gõ cửa phòng bạn._
chu_liem: Anh là phó phòng Marketing, lương 25 triệu. Phòng anh có mấy nhân viên?
_Bạn đếm. Một. Là mình._
* [☂️ "Dạ chú cháu là giám đốc ạ."]
    _Chú Liêm ghi chép rất lâu. Bút chạy sột soạt như đang viết một bản án._
    ~ long_goi_chu()
    ~ qh("ke_toan", -8)
    ~ qh("giam_doc", -5)
* [😶 "Dạ… một ạ. Là cháu."]
    chu_liem: Tháng này cháu làm được gì?
    { long_so_nhan_hang >= 2:
        con_ong_chau_cha: Dạ cháu chốt được {long_so_nhan_hang} nhãn hàng trong quận. Tiệm nail, quán ốc, phòng gym. Hợp đồng đây ạ.
        chu_liem: *(gật đầu)* Được. Một người mà làm vậy là được.
        ~ long_tl(10)
        ~ qh("ke_toan", 6)
        ~ long_ngay_khong_nhac_chu = true
    - else:
        con_ong_chau_cha: Dạ… cháu… check-in ạ.
        chu_liem: Check-in là gì?
        _Bạn giải thích 5 phút. Chú Liêm vẫn không hiểu. Bạn cũng bắt đầu không hiểu._
        ~ long_tl(2)
    }
* {long_duyet_ke_hoach} [📊 Mở laptop, trình bày kế hoạch marketing đã duyệt tuần 5 – 9/10.]
    _Bạn trình bày 14 trang. Có ngày, có ngân sách, có chỗ đã sửa màu hồng. Chú Liêm đọc từng dòng._
    chu_liem: Được. Có làm thật.
    _Ngoài cửa, {ke_toan} thở phào lần đầu tiên trong ngày._
    ~ long_tl(10)
    ~ qh("ke_toan", 10)
    ~ long_ngay_khong_nhac_chu = true
- _Dưới sân, {cho} sủa một tiếng. Chú Liêm giật mình, đánh rơi bút._
-> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2210_nhat_len_phong_thu ===
# ngay:22 # gio:21:00 # noi:sky_ao_tang_30 # dieu_kien:long_mo_phong_thu_nhat
_Tối thứ Năm. Chuông cửa. {truong_phong} đứng ngoài, cặp kè cái bảng trắng gấp gọn, như đến dự một cuộc họp quan trọng._
truong_phong: Tớ đến nghe demo. Không phải họp.
_Bạn mở khóa căn phòng cuối hành lang. Lần đầu tiên có người bước vào ngoài bạn._
con_ong_chau_cha: Ông là người thứ nhất vô đây đó. Chú tui còn chưa vô.
~ long_nhat_nghe_demo = true
* [🎧 Mở từ bản 1 tới bản 41.]
    _{truong_phong} nghe từng bản, dựng bảng trắng cạnh cây đàn, ghi: "Bản 7: mở đầu. Bản 23: điệp khúc. Bản 38: bridge – nổi da gà". Rồi vẽ mũi tên nối chúng lại._
    con_ong_chau_cha: Trời… ông vừa làm cái sơ đồ đầu tiên trong đời tui hiểu được.
    ~ long_bh(15)
    ~ qh("truong_phong", 15)
* [💬 "Ông hỏi đi. Sao tui hông cho chú tui nghe."]
    truong_phong: Sao?
    con_ong_chau_cha: Nghe xong chú nói "hay, để chú lo". Rồi bài này thành bài của "cháu giám đốc".
    truong_phong: *(im lặng lâu)* Tớ hiểu. Tớ hiểu theo chiều ngược lại.
    _Bạn không hiểu câu đó. Nhưng bạn thấy {truong_phong} cúi xuống rất lâu._
    ~ qh("truong_phong", 10)
    ~ long_bh(8)
* [🎸 Hát bản 41 trực tiếp, không bật file.]
    _Bạn hát. {truong_phong} ngồi im, không ghi gì. Lần đầu bạn thấy {truong_phong} không cầm bút._
    ~ qh("truong_phong", 8)
    ~ long_bh(10)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2310_qua_sinh_nhat ===
# ngay:23 # gio:09:30 # noi:studio_tang_2 # bat_buoc
_Sinh nhật {sieu_nhan_hong}, 31 tuổi. Người giàu nhất công ty. Tặng gì cho người có tất cả?_
_Trong túi bạn có một chiếc USB nhỏ. Bên trong là bản demo mới nhất của "Hồng Là Thái Độ"._
* [⌚ Mua một cái đồng hồ đắt tiền.]
    { long_quet(15000000):
        _Thẻ chạy. Lạ thật._
    - else:
        _Thẻ bị từ chối. Bạn trả bằng lương: 3 triệu cho một cái đồng hồ "đắt tiền theo tiêu chuẩn mới"._
        ~ tien_cong(-3000000)
        ~ long_tl(3)
    }
    ~ long_qua_nguyen = "dong_ho"
    sieu_nhan_hong: Đẹp ghê! Mà anh có 3 cái rồi… à, cái này là cái đẹp nhất!
    ~ qh("sieu_nhan_hong", 4)
* [💾 Đưa chiếc USB: "Bài này em viết cho anh. Nghe một mình nha."]
    sieu_nhan_hong: *(cầm USB, bất ngờ)* Bài… viết cho anh hả? Thiệt hả?
    con_ong_chau_cha: Tên là "Hồng Là Thái Độ". Câu của anh mà.
    _{sieu_nhan_hong} tháo găng tay ra, cầm USB bằng tay trần, như cầm một thứ dễ vỡ._
    ~ long_qua_nguyen = "usb_demo"
    ~ long_tang_bai_nguyen = true
    ~ qh("sieu_nhan_hong", 20)
    ~ long_bh(5)
* [🎂 Góp tiền mua bánh chung với cả công ty.]
    ~ tien_cong(-100000)
    ~ long_qua_nguyen = "khac"
    ~ qh("sieu_nhan_hong", 3)
    ~ qh("ran_doc", 2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2310_livestream ===
# ngay:23 # gio:15:30 # noi:studio_tang_2 # bat_buoc
_Livestream sinh nhật. 40.000 người xem. Giữa buổi, {sieu_nhan_hong} cầm micro, quay về phía {chua_te_deadline} đang cầm bảng nhắc chữ._
sieu_nhan_hong: Vũ ơi… anh thích em lâu rồi. Không phải PR đâu.
_Bình luận chạy như thác: \#VũƠiTrảLờiĐi. {chua_te_deadline} đứng hình. Bảng nhắc chữ rơi._
~ follow(60000)
_Cửa studio hé mở. {cho} lao vào. Bánh kem hồng ba tầng bay lên, rơi xuống, kem dính đầy mũ._
_Studio im phăng phắc. Cần một thứ gì đó lấp khoảng lặng này. Ngay bây giờ._ # hen_gio:6
* {long_tang_bai_nguyen} [🔒 Ra hiệu cho {it}: "Bật bài trong USB đi!"]
    _Nhạc dạo của "Hồng Là Thái Độ" vang lên. {sieu_nhan_hong}, mặt dính kem, đứng giữa đống bánh vỡ, tự nhiên hát theo được một câu._
    ~ follow(40000)
    ~ long_bh(10)
    ~ long_bai_phat_hanh = true
    hong_hot: Bài gì vậy? Ai viết vậy? Bình luận hỏi quá trời!
    _Bạn đứng sau máy quay, không nói gì. Tim đập như trống._
* [🎸 Chạy vào, ôm đàn đàn bài "Chúc mừng sinh nhật".]
    _Cả studio hát theo. {cho} vẫn đang ăn bánh. Cảnh đó dễ thương tới mức không ai giận._
    ~ follow(15000)
    ~ qh("sieu_nhan_hong", 5)
* [☂️ "Chú ơi, chú lên nói gì đi!"]
    ~ long_goi_chu()
    _Chú bạn bước vào khung hình, phát biểu về "tầm nhìn" 4 phút. Lượt xem tụt dần._
    ~ follow(-5000)
* [⏱️ (Không chọn kịp)]
    _Không ai làm gì. {sieu_nhan_hong} tự cười, liếm kem trên găng tay, nói "Gét gô". Bình luận cười theo._
    ~ follow(10000)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2310_nguyen_nhan ===
# ngay:23 # gio:22:40 # noi:sky_ao_tang_30
{ long_tang_bai_nguyen:
    -> tin_nhan
- else:
    _Gần nửa đêm. Bạn ngồi trong phòng thu, mở bản 41, sửa lại câu bridge. Chưa ai nghe bài này. Có lẽ phải có ai đó nghe._
    ~ long_bh(5)
    -> END
}

= tin_nhan
_Gần nửa đêm. Điện thoại rung. {sieu_nhan_hong} nhắn:_
sieu_nhan_hong: *(tin nhắn)* Anh nghe 14 lần rồi. Câu "sau chiếc mũ là một người bình thường"… sao em biết vậy?
* [💬 "Em thấy anh trên sân thượng hôm mất điện. Em hông kể ai."]
    sieu_nhan_hong: *(một lúc lâu)* …Cảm ơn em. Đêm Hồng anh hát bài này được hông?
    ~ qh("sieu_nhan_hong", 10)
    ~ long_bh(5)
* [🎵 "Em đoán thôi. Ai cũng có một cái mũ."]
    sieu_nhan_hong: Ờ ha. Em cũng có hả?
    con_ong_chau_cha: Có. Cái mũ tên là "cháu giám đốc".
    ~ qh("sieu_nhan_hong", 8)
    ~ long_bh(5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2410_hoa_giai ===
# ngay:24 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Thứ Bảy, Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Bàn số 1: bạn và {truong_phong}._
chi_dai: Luật nè: mỗi người khen người kia ba câu. Khen thật. Đứa nào khen xạo chị biết liền.
truong_phong: *(hắng giọng)* Một: cậu hát hay. Hai: cậu không bao giờ nói xấu ai. Ba: cậu… đi trễ rất đều.
* [😄 "Một: ông làm việc thiệt. Hai: ông hông bao giờ nhờ ai gọi chú. Ba: ông vẽ sơ đồ đẹp."]
    chi_dai: Được. Hai đứa này qua.
    truong_phong: *(cười nhẹ)* Câu hai… cậu nói thật à?
    con_ong_chau_cha: Thiệt. Tui ghen với ông chỗ đó.
    ~ qh("truong_phong", 12)
    ~ qh("chi_dai", 5)
* [😎 "Một: ông họp giỏi. Hai: ông họp nhiều. Ba: ông họp lâu."]
    chi_dai: Long. Ra sân thượng đứng 5 phút cho chị.
    ~ qh("truong_phong", -8)
    ~ qh("chi_dai", -5)
* [🎵 "Một: ông là người đầu tiên nghe demo của tui. Hai… ba… để tui viết thành bài."]
    { long_nhat_nghe_demo:
        truong_phong: *(đỏ tai)* …Đừng có viết thành bài.
        chi_dai: Ủa, hai đứa này thân nhau từ hồi nào vậy?
        ~ qh("truong_phong", 10)
        ~ long_bh(3)
    - else:
        truong_phong: Demo gì?
        con_ong_chau_cha: À… hông có gì.
        ~ qh("truong_phong", 2)
    }
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2410_ban_chu_no ===
# ngay:24 # gio:11:00 # noi:phong_hop_tang_2
_Bàn riêng cho {dan_dau_tu}: "bàn chủ nợ". {sales}, {it}, Bác {bac_bao_ve}, {thanh_xin_nghi}, {thuc_tap_sinh}, {bien_kich}, {idol_het_thoi}, và bạn ngồi quanh. {dan_dau_tu} cầm một bản "kế hoạch trả nợ" như cầm báo cáo quý._
dan_dau_tu: Long… phần em là 10 triệu "vốn góp chung". Anh đề xuất… trả bằng niềm tin.
* [😎 "Thôi, tui xóa nợ cho anh."]
    dan_dau_tu: *(nước mắt rưng rưng)* Em… em là người có tầm nhìn nhất công ty!
    ~ qh("dan_dau_tu", 15)
    ~ long_gop_von_chuong = 0
    sales: Ủa?! Vậy xóa luôn của em hông?
* [💵 "Trả em 500 nghìn mỗi tháng. Em cần thật."]
    dan_dau_tu: *(nhìn bạn rất lâu)* Em… cần thật hả? Ừ. Anh trả. Lần này là trả thật.
    ~ tien_cong(500000)
    ~ long_tl(5)
    ~ qh("dan_dau_tu", 3)
* [👂 Ngồi nghe từng người kể vì sao cho {dan_dau_tu} vay.]
    _{it} cho vay vì "ổng nói ổng đói". Bác {bac_bao_ve} cho vay vì "nó có con mắt buồn". {thuc_tap_sinh} cho vay vì "dạ anh Chương nhờ ạ"._
    _Bạn ghi lại từng lý do. Mỗi lý do là một câu hát._
    ~ long_bh(8)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2510_keo_coin ===
# ngay:25 # gio:10:00 # noi:sky_ao_tang_30 # bat_buoc
_Chủ nhật. Chuông cửa reo. {dan_dau_tu} đứng ngoài, mắt sáng như chart xanh._
dan_dau_tu: Long! Kèo coin chắc thắng! Gỡ lại tiền nhà cho em luôn! Em đang cần tiền thật mà đúng hông?
_Đúng. Lần đầu tiên trong đời bạn cần tiền thật. Penthouse sắp bán. Thẻ bằng 0._
* [💸 Bỏ 5 triệu tiền lương vào.]
    { tien >= 5000000:
        ~ tien_cong(-5000000)
        ~ long_dau_tu_moi = long_dau_tu_moi + 5000000
        dan_dau_tu: Đó! Tuần sau x3!
        _Tuần sau không có x3. Nhưng đó là chuyện của tuần sau._
        ~ long_tl(-5)
    - else:
        _Ví bạn không đủ 5 triệu. Lần đầu bạn thấy may vì nghèo._
    }
* [🛵 "Hông. Tối nay tui đi làm ca, kiếm 180 nghìn. Chắc hơn."]
    dan_dau_tu: 180 nghìn? Em… đi làm ca? Em á?
    con_ong_chau_cha: Ừ. Tui tên Rồng.
    _{dan_dau_tu} nhìn bạn như nhìn một đồng coin lạ chưa ai phân tích._
    ~ long_tl(3)
    ~ qh("dan_dau_tu", 2)
    -> con_ong_chau_cha_mg_lam_them
* [📊 "Anh làm cho tui bảng số liệu nghe nhạc theo độ tuổi đi. Tui trả tiền, coi như trừ nợ."]
    dan_dau_tu: *(nghiêm túc hẳn)* Số thật hả? Được. Số thật thì anh giỏi nhất quận.
    _Bảng số liệu tới lúc 3 giờ chiều. Người 20–30 tuổi nghe nhạc có câu chuyện thật lâu gấp ba. Đúng như bạn nghĩ._
    ~ long_bh(6)
    ~ qh("dan_dau_tu", 8)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2510_tap_trinh_bay ===
# ngay:25 # gio:15:00 # noi:sky_ao_tang_30 # dieu_kien:long_nhat_nghe_demo
_Chiều Chủ nhật. Bạn nhắn {truong_phong}: "Ông rảnh hông? Tui muốn cho chú nghe bài. Mà tui sợ."_
_Ba mươi phút sau, {truong_phong} đứng trước cửa, kẹp cái bảng trắng gấp gọn._
truong_phong: Cách trình bày: mở bằng bản 41, kết bằng câu "cháu muốn tự làm". Không dùng chữ "chill".
* [😅 Tập nói 11 lần.]
    _Lần 1 bạn nói "chill". Lần 5 bạn nói "chú ơi". Lần 11 bạn nói được hết mà không run._
    ~ qh("truong_phong", 12)
    ~ long_tl(6)
    con_ong_chau_cha: Ông hông sợ tui nổi lên rồi giành ghế ông hả?
    truong_phong: …Có sợ. Nhưng bài này hay quá.
* [💬 "Sao ông giúp tui?"]
    truong_phong: Vì tớ biết cảm giác tên mình đứng sai chỗ.
    _Bạn không hỏi thêm. {truong_phong} cũng không kể thêm. Hai người tiếp tục vẽ mũi tên._
    ~ qh("truong_phong", 10)
    ~ long_tl(4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2610_trinh_bay_chu ===
# ngay:26 # gio:11:00 # noi:phong_giam_doc # bat_buoc
_Thứ Hai. Tin đồn cắt giảm nhân sự lan khắp công ty. Bạn đứng trước cửa phòng chú, tay cầm cái loa nhỏ._
{ long_nhat_nghe_demo:
    _{truong_phong} đứng phía sau bạn, cầm bảng trắng gấp gọn như cầm khiên._
}
* [🎵 Bước vào: "Chú… cháu có bài này. Cháu tự viết. Cho Siêu Nhân Hồng."]
    _Bản 41 vang lên. Chú ngồi im. Tới đoạn bridge, chú tháo kính ra._
    giam_doc: Cháu… viết từ bao giờ?
    con_ong_chau_cha: Từ lâu rồi chú. Cháu hông cần chú lo. Cháu chỉ cần chú nghe.
    giam_doc: *(một lúc lâu)* …Chú nghe rồi. Hay. Hay thật.
    ~ long_noi_chuyen_that_voi_chu = true
    ~ qh("giam_doc", 12)
    ~ long_bh(5)
    ~ long_tl(8)
    ~ long_od(-5)
    { long_nhat_nghe_demo:
        ~ qh("truong_phong", 8)
        _Ra khỏi phòng, bạn đấm nhẹ vào vai {truong_phong}. Không nói gì. Không cần nói._
    }
* [🚪 Quay đi. Chưa phải lúc.]
    _Bạn quay về phòng một người. Bài hát vẫn nằm trong cái loa nhỏ, chưa ai nghe._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2610_chieu_phim ===
# ngay:26 # gio:16:00 # noi:phong_hop_tang_2
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". Một anh nhân viên ngân hàng bỏ việc, được một người mặc đồ hồng đẩy xe trong mưa._
_Bạn liếc sang {thuc_tap_sinh}. {thuc_tap_sinh} đang khóc, không thành tiếng. Bạn nhớ câu: "Em bỏ một cái ghế mà ai cũng muốn ngồi."_
_Sau buổi chiếu, chú bạn hỏi mua kênh Diu-túp của {editor} giá 200 triệu. {editor} không trả lời._
* [🤝 Ngồi xuống cạnh {thuc_tap_sinh}, đưa khăn giấy.]
    thuc_tap_sinh: Dạ… em xúc động quá. Phim giống… một người em quen.
    ~ qh("thuc_tap_sinh", 8)
    ~ long_bh(5)
* [💬 Nói nhỏ với {editor}: "Đừng bán. Tin tui. Đồ mình làm thì mình giữ."]
    editor: *(ngáp, nhưng mắt tỉnh)* …Dạ. Ông cũng có đồ mình làm hả?
    con_ong_chau_cha: Có. 41 cái.
    ~ qh("editor", 8)
* [😶 Đứng dậy ra về sớm.]
    _Bạn về sớm. Không phải để đi chơi. Để về thu lại bản 42._
    ~ long_bh(5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2710_luu_luc ===
# ngay:27 # gio:08:30 # noi:sky_ao_tang_30 # bat_buoc
_LL-Entertainment ra tay. Sáng nay, cả công ty xôn xao vì LL ra giá gấp ba cho Siêu Nhân Hồng. Điện thoại bạn có một tin nhắn thoại lạ._
~ phat_hien(ll_moi_nguyen)
luu_luc: *(tin nhắn thoại, giọng diễn giả)* Long à, việc hôm nay phải xong từ hôm qua. 300 triệu cho bài "Hồng Là Thái Độ", kèm ghế nhạc sĩ ở LL. Không ai gọi em là "cháu ai" ở đây cả.
_300 triệu. Một phòng trọ ở Hẻm 69 giá 3 triệu một tháng. Bạn đếm: 100 tháng._
* [💰 "Ok anh. Gét gô."]
    ~ tien_cong(300000000)
    ~ long_ban_cho_ll = true
    ~ long_bai_phat_hanh = true
    ~ long_tl(20)
    ~ follow(-150000)
    _Tiền về tài khoản trong 5 phút. Độ Tự Lập của bạn chưa bao giờ cao vậy. Tự kiếm được mà._
    _Chiều đó, LL tung teaser: "Hồng Là Thái Độ", giọng một ca sĩ khác. Siêu Nhân Hồng nhìn màn hình rất lâu._
* [🙅 "Bài này viết cho Siêu Nhân Hồng. Hông bán."]
    ~ long_tl(10)
    ~ long_od(-5)
    luu_luc: *(tin nhắn chữ)* Tiếc ghê. Em sẽ đổi ý.
* [📞 Chuyển tiếp tin nhắn cho chú: "Chú ơi, bên LL hỏi mua bài của cháu."]
    ~ long_goi_chu()
    _22 giờ, chú gọi lại ngay._
    giam_doc: Bài gì? Cháu viết nhạc à? Lưu Lực biết mà chú không biết?
    { long_noi_chuyen_that_voi_chu:
        con_ong_chau_cha: Chú nghe rồi mà. Bài hôm thứ Hai đó.
        giam_doc: …Ừ. Thế thì không bán. Chú không ép. Chú xin.
    - else:
        con_ong_chau_cha: Dạ. Từ lâu rồi chú.
        giam_doc: *(im lặng rất lâu)* Mai cháu cho chú nghe. Đừng bán. Chú xin.
    }
    ~ long_noi_chuyen_that_voi_chu = true
    ~ qh("giam_doc", 8)
* {qh_sieu_nhan_hong >= 50} [🔒 "Anh Lực, bài này tui tặng Siêu Nhân Hồng rồi. Mà nhân tiện tui ghi âm tin nhắn anh rồi đó."]
    _Bạn gửi đoạn ghi âm cho {quan_ly_idol}. Mười phút sau, {quan_ly_idol} gọi lại, giọng khác hẳn mọi ngày._
    quan_ly_idol: Cảm ơn em. Có cái này, anh giữ được Nguyên. Chuyện này để anh lo.
    ~ long_ghi_am_luu_luc = true
    ~ qh("quan_ly_idol", 15)
    ~ qh("sieu_nhan_hong", 8)
    ~ long_tl(8)
    _Lưu Lực chặn bạn trên mọi nền tảng. Lần đầu bạn bị chặn vì làm đúng._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2710_sanh ===
# ngay:27 # gio:10:30 # noi:sanh_tang_tret
_Lưu Lực tới tận nơi. Vest trắng, tóc vuốt keo, ôm tập hồ sơ màu xanh lá chuối. Thấy bạn, Lưu Lực nháy mắt như hai người có bí mật chung._
luu_luc: Long! Em đọc tin nhắn anh chưa? Việc hôm nay phải xong từ hôm qua.
_Rồi ánh mắt Lưu Lực dừng ở chân cầu thang. {chi_dai} đứng đó, khoanh tay. Tập hồ sơ rơi xuống đất, giấy bay tứ tung._
chi_dai: Lâu quá hen. Quán Ốc Đêm còn mở đó.
* [📄 Cúi xuống nhặt giấy, đưa cho Lưu Lực: "Anh làm rơi nè. Bài của tui thì hông rơi đâu."]
    luu_luc: *(giật lấy, cười gượng)* Em sẽ đổi ý.
    ~ long_tl(3)
    ~ qh("chi_dai", 4)
* [😎 Đứng cạnh {chi_dai}: "Chị Hương, chị quen ổng hả?"]
    chi_dai: Quen. Một tô ốc len.
    _Bạn không hiểu. Nhưng thấy Lưu Lực lùi một bước, bạn hiểu đủ._
    ~ qh("chi_dai", 6)
* [👂 Đứng xa nghe.]
    _Bạn nghe Lưu Lực nói với {quan_ly_idol}: "36 triệu một tháng, nếu anh mang được người đó theo." Bạn ghi nhớ con số._
    ~ phat_hien(ll_moi_thai)
    ~ long_bh(3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2710_san_thuong ===
# ngay:27 # gio:21:30 # noi:san_thuong
_Tối. Sân thượng công ty. Gió lạnh. Bạn đứng tựa lan can, nghe lại tin nhắn của Lưu Lực lần thứ năm. Cửa sân thượng mở. {truong_phong} bước ra._
{ long_mo_phong_thu_nhat && qh_truong_phong >= 30:
    -> noi_that
- else:
    _{truong_phong} thấy bạn, gật đầu, rồi đứng ở góc kia gọi điện. Hai người như hai đối thủ chuẩn bị cho trận cuối._
    ~ cang_thang(5)
    -> END
}

= noi_that
* [💬 "Ông Nhật. Nói thiệt nha. Ông muốn cái ghế đó thì lấy đi. Tui chỉ muốn làm nhạc."]
    ~ long_ke_nhat_khong_muon_ghe = true
    _{truong_phong} đứng im rất lâu. Rồi ngồi xuống bậc thềm, cười ra tiếng._
    truong_phong: Thế mà tớ sửa đơn 15 lần.
    con_ong_chau_cha: Mười lăm? Trời đất. Tui chưa viết lần nào.
    ~ qh("truong_phong", 12)
    ~ cang_thang(-10)
* [🎵 "Lưu Lực trả 300 triệu cho bài của tui. Ông nghĩ sao?"]
    truong_phong: Tớ nghĩ… bài đó viết cho Siêu Nhân Hồng. Và tớ muốn đạo diễn cái đêm nó được hát.
    con_ong_chau_cha: Ông lo cho bài tui hả?
    truong_phong: Lo cho chương trình Đêm Hồng thôi.
    con_ong_chau_cha: Xạo.
    ~ qh("truong_phong", 8)
* [😶 Đưa {truong_phong} một tai nghe, mở bản 42.]
    _Hai người đứng trên sân thượng, mỗi người một bên tai nghe. Dưới kia, Thành Phố Ước Mơ sáng đèn. Không ai nhắc tới cái ghế._
    ~ qh("truong_phong", 10)
    ~ long_bh(4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2410_ca_toi ===
# ngay:24 # gio:19:00 # noi:quan_ca_phe_song_ao
_Tối thứ Bảy. Quán Sống Ảo đông nghẹt. "Rồng" đeo khẩu trang, đội mũ lưỡi trai, bưng khay._
_Bàn số 4: {sales} và {designer} đang ngồi. Bàn số 7: {thanh_xin_nghi}, mặc đồ kim tuyến, đang tập hát nhỏ cho vòng bán kết ngày mai._
* [🛵 Vào ca, cúi đầu thấp.]
    -> con_ong_chau_cha_mg_lam_them
* [🎤 Ghé bàn số 7, nói nhỏ: "Mai thi tốt nha. Tui hông thấy gì đâu."]
    thanh_xin_nghi: *(giật mình)* Ông… ông Long hả? Ông làm ở đây hả?
    con_ong_chau_cha: Ở đây tui tên Rồng.
    thanh_xin_nghi: *(bật cười)* Vậy tui là ca sĩ, ông là phục vụ. Mình giữ bí mật cho nhau nha.
    ~ qh("thanh_xin_nghi", 12)
    ~ long_bh(4)
    -> con_ong_chau_cha_mg_lam_them
* [😷 Xin nghỉ ca vì sợ bị nhận ra.]
    _Bạn về sớm. Trên đường về, bạn tự hỏi: mình sợ bị nhận ra là "cháu giám đốc", hay sợ bị nhận ra là "phục vụ"?_
    ~ long_bh(3)
    -> END
