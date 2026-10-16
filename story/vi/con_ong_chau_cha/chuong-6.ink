// ============================================================
// CON ÔNG CHÁU CHA: LONG
// CHƯƠNG 6: "KHÔNG Ô" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== con_ong_chau_cha_2810_moc_4 ===
# ngay:28 # gio:09:30 # noi:phong_pho_phong_marketing # bat_buoc
_Mốc 4: 800.000 người theo dõi. {hong_hot} đứng giữa tầng 1, nhìn con số như nhìn bảng điểm thi đại học._
{ nguoi_theo_doi >= 800000:
    hong_hot: QUA RỒI! Ét o ét, tui khóc đây nè!
    ~ cang_thang(-5)
- else:
    hong_hot: Còn thiếu… nhiều lắm. LL đang đăng bài "G-Entertainment hết thời" kìa.
    ~ cang_thang(8)
}
_Bộ lọc của {dan_dau_tu} vừa lần ra: 80.000 tài khoản fan ảo của {idol_het_thoi}, đều từ dịch vụ "Like Thật 100%"._
~ phat_hien(fan_ao_phat)
{ long_phat_co_ghi_am && long_nguoi_hat == "" && not long_ban_cho_ll && RANDOM(1, 10) <= 3:
    -> phat_tung_bai
}
* [🎹 Về phòng, đóng cửa, hoàn thiện bản cuối.]
    -> con_ong_chau_cha_mg_phong_thu
* [🤝 Đi tìm {idol_het_thoi}.]
    _{idol_het_thoi} ngồi trong studio tối, kính đen, không hát._
    idol_het_thoi: Em tới cười anh hả?
    con_ong_chau_cha: Hông. Tui tới hỏi anh còn muốn hát hông.
    _{idol_het_thoi} gỡ kính ra. Mắt đỏ. Lần đầu bạn thấy mắt thật của {idol_het_thoi}._
    ~ qh("idol_het_thoi", 10)
    ~ long_bh(5)
* [📸 Check-in ở Sống Ảo với một món đồ hồng, để kéo lượt theo dõi.]
    -> con_ong_chau_cha_mg_check_in
- -> END

= phat_tung_bai
_Trưa đó, kênh của {idol_het_thoi} đăng một bài hát mới: "Hồng Của Anh". Giai điệu của bạn. 20 giây đầu y hệt đoạn bạn ngân hôm mất điện. Phần còn lại, {idol_het_thoi} tự viết thêm._
~ long_nguoi_hat = "phat"
~ long_bai_phat_hanh = true
~ long_bh(-10)
~ cang_thang(15)
* [📞 Gọi {idol_het_thoi}: "Anh lấy bài của tui."]
    idol_het_thoi: *(im lặng lâu)* …Anh cần một bài hit, {con_ong_chau_cha}. Anh xin lỗi.
    _Bạn cúp máy. Bạn không biết nên giận ai: người lấy, hay người đã ngân bài hát ở pantry._
    ~ qh("idol_het_thoi", -20)
* [😶 Im lặng.]
    _Bạn tắt điện thoại. Mở phòng thu. Ngồi trước 41 tệp demo. Không bấm vào cái nào._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2810_rong_bi_lo ===
# ngay:28 # gio:20:00 # noi:quan_ca_phe_song_ao
_Tối. Ca làm của "Rồng". Bàn số 2 có một người khách đeo kính, mặc y chang bộ đồ bạn mặc hôm thứ Hai: {thuc_tap_sinh}._
thuc_tap_sinh: Dạ cho em một ly… *(nhìn lên)* …anh {con_ong_chau_cha}?!
* [🤫 "Suỵt. Ở đây tui tên Rồng."]
    thuc_tap_sinh: *(thì thầm)* Dạ… anh Rồng. Dạ anh cho em… xin làm chung được hông ạ?
    con_ong_chau_cha: Anh có lương thực tập mà?
    thuc_tap_sinh: Dạ… em muốn làm chung với anh.
    _Thần tượng của {thuc_tap_sinh} là một phục vụ quán cà phê. {thuc_tap_sinh} trông còn tự hào hơn trước._
    ~ qh("thuc_tap_sinh", 12)
    ~ long_bi_phat_hien_lam_them = true
* [😷 Giả giọng: "Dạ anh nhầm người rồi ạ."]
    thuc_tap_sinh: Dạ… dạ xin lỗi anh ạ. Mà… giày anh giống anh {con_ong_chau_cha} quá.
    _Đôi sneaker trắng tinh. Thứ duy nhất bạn quên thay._
    ~ long_bh(3)
* [🛵 Bưng khay, làm tiếp.]
    -> con_ong_chau_cha_mg_lam_them
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2910_o_cung ===
# ngay:29 # gio:19:30 # noi:cau_thang_bo # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. Không gửi file được. Bản thu cuối cùng của "Hồng Là Thái Độ" nằm trong ổ cứng trên tay bạn. Phòng dựng của {editor} ở tầng 2. Phải tới trước 8 giờ._
_Thang máy kẹt. Bạn nhìn cầu thang bộ. Bạn chưa bao giờ chạy trong công ty._
* [🏃 Chạy.]
    _Bạn chạy. Tầng 1. Đụng {thuc_tap_sinh}, xin lỗi. Hành lang. Đụng {chi_dai} đang cầm bộ đàm điều phối. Bạn không dừng._
    { qh_truong_phong >= 30:
        _Ở chân cầu thang tầng 2, {truong_phong} đang đứng. Thấy bạn, {truong_phong} không hỏi gì, chạy theo, ôm giúp cuộn dây cáp._
        ~ qh("truong_phong", 6)
    }
    _7 giờ 58. Bạn đặt ổ cứng xuống bàn {editor}, thở như vừa chạy marathon._
    editor: *(ngáp)* Kịp. Đẹp. Render xong là xong.
    ~ long_ban_thu_cuoi_kip = true
    ~ long_tl(8)
    ~ long_bh(10)
    ~ nghi(-15)
* [☂️ "Để anh gọi chú anh, nhờ người mở thang máy."]
    ~ long_goi_chu()
    _Chú không bắt máy. Chú đang ở chòi bảo vệ, viết giấy nhắn cho ngân hàng vì không có mạng._
    _Bạn đứng chờ thang máy. 8 giờ 10. Bạn chạy lên. Trễ 10 phút. {editor} đã ngủ gục._
    ~ long_bh(3)
* [📝 Viết giấy nhờ chòi bảo vệ chuyển giúp.]
    bac_bao_ve: *(nhận tờ giấy)* Giấy thì chuyển được. Ổ cứng thì phải chân cháu mang lên.
    _Bác nhìn bạn, nhìn cái cầu thang. Bạn hiểu. Bạn chạy._
    ~ long_ban_thu_cuoi_kip = true
    ~ long_tl(6)
    ~ long_bh(8)
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2910_chot_bao_ve ===
# ngay:29 # gio:12:30 # noi:chot_bao_ve
_Trưa. Wifi sập, chòi bảo vệ thành tổng đài giấy. Bác {bac_bao_ve} ngồi giữa một chồng giấy nhắn, đeo kính lão, phân loại như phân thư._
bac_bao_ve: {con_ong_chau_cha}. Có giấy của cháu. *(đưa ra một tờ)* Chú cháu gửi.
_Tờ giấy chữ chú, nét run: "Tối mai sau họp, chú cháu mình nói chuyện. Chú xin lỗi chuyện căn nhà."_
* [🍵 Ngồi xuống uống chén trà với bác.]
    bac_bao_ve: Chú cháu cũng không dễ đâu. Bác thấy hết. *(rót trà)* Bác không nói gì đâu.
    ~ qh("bac_bao_ve", 8)
    ~ cang_thang(-10)
    ~ long_bh(5)
* [✍️ Viết giấy trả lời chú: "Dạ. Cháu cũng có chuyện muốn nói."]
    bac_bao_ve: Để bác chuyển. *(cất vào ngăn riêng)* Thư này bác chuyển tay.
    ~ qh("giam_doc", 5)
    ~ long_noi_chuyen_that_voi_chu = true
* [🐕 Ngồi chơi với {cho} một lúc.]
    cho: Gâu! *(tha ra một chiếc găng tay hồng, rồi tha về lại)*
    ~ qh("cho", 6)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2910_luu_luc_nhan_lai ===
# ngay:29 # gio:21:00 # noi:sky_ao_tang_30 # dieu_kien:da tu choi ban bai cho LL
{ not long_ban_cho_ll && not long_ghi_am_luu_luc && long_tu_lap < 40:
    -> nhan_lai
- else:
    _Đêm. Không có mạng. Không có tin nhắn. Penthouse yên lặng như bể cá. Bạn ngủ sớm lần đầu trong tháng._
    ~ nghi(20)
    -> END
}

= nhan_lai
_Đêm. Mạng 4G chập chờn. Một tin nhắn lọt qua._
luu_luc: *(tin nhắn)* 500 triệu. Lần cuối. Em không có nhà, không có thẻ. Em cần tiền thật mà.
_Lưu Lực biết penthouse bị bán. Lưu Lực biết thẻ bằng 0. Lưu Lực biết nhiều hơn bạn tưởng._
* [💰 "…Ok."]
    ~ tien_cong(500000000)
    ~ long_ban_cho_ll = true
    ~ long_bai_phat_hanh = true
    ~ long_tl(15)
    ~ follow(-50000)
    _Tiền về lúc 23:47. Bạn nhìn con số rất lâu. Rồi tắt màn hình. Phòng thu tối om._
* [🙅 Chặn số.]
    _Bạn chặn. Rồi mở phòng thu, nghe bản cuối một lần nữa. Bạn vẫn không có nhà. Nhưng bạn có bài này._
    ~ long_tl(8)
    ~ long_bh(5)
* [📤 Chuyển tiếp cho {quan_ly_idol}.]
    quan_ly_idol: *(gọi lại sau 2 phút)* Cảm ơn em. Anh có thêm bằng chứng LL dụ người trong công ty.
    ~ long_ghi_am_luu_luc = true
    ~ qh("quan_ly_idol", 10)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_14 giờ, họp đánh giá cuối tháng. Bạn tới lúc 13 giờ 55. Sớm. Cả phòng ngạc nhiên. {truong_phong} đặt sổ kẻ ô ngay ngắn trước mặt._
_Hợp đồng của {idol_het_thoi} hết hạn ngày mai, hôm nay phải gia hạn. Danh sách cắt giảm nằm đâu đó trong tập hồ sơ hồng của {hr}._
giam_doc: *(trước cả phòng họp)* Ghế Phó Giám đốc, anh đề xuất… {con_ong_chau_cha}. Cháu… à, em có ý kiến gì không? Anh không ép, tùy em.
_{truong_phong} đặt bút xuống. Cả phòng nín thở._
* [👑 "Dạ, cháu nhận."]
    ~ long_nhan_ghe = true
    ~ long_od(20)
    _Tiếng vỗ tay lác đác. {truong_phong} đứng dậy, rời phòng họp không nói gì._
    _Bạn nhìn cái hộp đàn ở góc phòng. Bạn không biết khi nào mới mở nó ra nữa._
* [🙅 "Cháu cảm ơn chú. Nhưng cháu hông nhận. Cháu muốn làm nhạc."]
    ~ long_tu_choi_ghe = true
    ~ long_o_du = 0
    ~ long_tl(30)
    _Phòng họp im phăng phắc. Chú nhìn bạn rất lâu._
    _{thuc_tap_sinh} vỗ tay một mình. Rồi {chi_dai} vỗ theo. Rồi vài người nữa._
    giam_doc: *(khẽ)* …Thế thì ghế này… để chú nghĩ thêm.
    { long_ke_nhat_khong_muon_ghe:
        _{truong_phong} nhìn bạn. Lần này không phải ánh nhìn của đối thủ._
    }
* {long_mo_phong_thu_nhat && qh_truong_phong >= 20} [🔒 "Cháu đề cử ông {truong_phong}. Ổng làm việc thật. Cháu chỉ xin lo phần âm nhạc."]
    ~ long_de_cu_nhat = true
    ~ long_tu_choi_ghe = true
    ~ long_o_du = 0
    ~ long_tl(20)
    _{truong_phong} ngẩng lên._
    -> nhat_tra_loi
- -> END

= nhat_tra_loi
{ long_nhat_nghe_demo && qh_truong_phong >= 25:
    truong_phong: *(đứng dậy, rút trong sổ ra một tờ giấy)* Em cũng có một lá đơn đề cử. Em đề cử {con_ong_chau_cha}. {con_ong_chau_cha} lo âm nhạc, em lo sản xuất.
    ~ long_nhat_de_cu_long = true
    _Hai lá đơn đề cử nằm trên bàn chú, chỉ vào nhau như hai mũi tên trên sơ đồ của {truong_phong}._
    giam_doc: *(gãi đầu)* Thế thì… hai đứa cùng làm. Anh không ép, tùy các em.
- else:
    giam_doc: *(nhìn {truong_phong})* {truong_phong}?
    truong_phong: *(chậm rãi)* …Em nhận ạ. Cảm ơn {con_ong_chau_cha}.
    _{truong_phong} gật đầu với bạn. Một cái gật đầu nặng hơn mọi cuộc họp._
}
-> END

// ------------------------------------------------------------
=== con_ong_chau_cha_3010_sau_hop ===
# ngay:30 # gio:19:00 # noi:sky_ao_tang_30
_Tối. Penthouse đã có người đặt cọc. Đồ đạc của bạn nằm trong ba cái thùng giấy. Chuông cửa reo. Là chú._
_Chú đứng ngoài, không vào. Lần đầu tiên chú bấm chuông nhà mình._
giam_doc: {con_ong_chau_cha}. Chú xin lỗi chuyện căn nhà. Chú định nói từ tháng 9. Mà chú không biết nói thế nào.
* [🤝 "Hông sao chú. Cháu tìm được phòng rồi. Hẻm 69."]
    giam_doc: *(khựng lại)* Hẻm 69? Cháu… ở trọ?
    con_ong_chau_cha: Dạ. 15 mét vuông. Cửa sổ nhìn tường. Cháu trả bằng lương.
    _Chú đứng im rất lâu. Rồi chú cười, mắt đỏ._
    giam_doc: Giống chú năm 2010. Phòng thuê 20 mét vuông.
    ~ qh("giam_doc", 10)
    ~ long_tl(8)
* [☂️ "Chú ơi… cháu ở đâu giờ?"]
    giam_doc: *(im lặng)* Chú cũng đang không biết mình ở đâu, {con_ong_chau_cha} ạ.
    ~ long_od(-5)
    ~ cang_thang(8)
* [🎸 Mở hộp đàn: "Chú vào đi. Cháu hát cho chú nghe bản cuối."]
    _Chú bước vào. Ngồi trên một cái thùng giấy. Bạn hát. Chú nhắm mắt._
    giam_doc: Mai… mai chú ra Đại Nhạc Hội, chú ngồi hàng đầu.
    ~ qh("giam_doc", 12)
    ~ long_bh(5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_3110_truoc_gio ===
# ngay:31 # gio:17:00 # noi:san_khau_dem_hong # bat_buoc
_Đại Nhạc Hội Siêu Nhân, Phường Tân Drama. Còn hai tiếng rưỡi nữa mới mở màn. Chú bạn hóa trang "Ông Kẹ Ngân Hàng". {truong_phong} hóa trang thành cuốn lịch để bàn. Bạn không hóa trang. Bạn ôm cây đàn._
{ long_ban_cho_ll:
    _Bài "Hồng Là Thái Độ" đã thuộc về LL. Đêm nay Đại Nhạc Hội Siêu Nhân dùng nhạc nền không lời. Bạn đứng ở cánh gà, tay trống không._
    ~ long_nguoi_hat = ""
    -> END
}
{ long_bai_hat < 50:
    _Bài hát mới xong một nửa. Không đủ để hát trước cả khán đài. Đêm nay dùng nhạc nền không lời. Bạn sẽ ngồi dưới khán đài, nghe giai điệu của người khác._
    -> END
}
{ nguyen_theo_ll: -> vang_nguyen }
{ long_nguoi_hat == "phat":
    _{idol_het_thoi} đã có bài, theo cách của {idol_het_thoi}. Đêm nay {idol_het_thoi} muốn hát nó ở tiết mục khách mời._
    -> phat_hat
}
_{quan_ly_idol} chạy tới, cầm 2 cái điện thoại: "{con_ong_chau_cha}, cần chốt: bài của em, ai hát? Dòng 'Nhạc & lời' ghi gì?"_
* {long_tang_bai_nguyen || qh_sieu_nhan_hong >= 30} [🩷 "Siêu Nhân Hồng hát. Ghi: 'Nhạc & lời: {con_ong_chau_cha}'. Không có chữ gì phía trước."]
    ~ long_nguoi_hat = "nguyen"
    ~ long_ghi_ten = true
    ~ long_tang_bai_nguyen = true
    quan_ly_idol: Chuyện này để anh lo.
* {long_nguoi_hat == "song_ca" || long_hua_song_ca_ghi_ten} [🎤 "Song ca: Siêu Nhân Hồng với anh {idol_het_thoi}. Ghi tên tui."]
    ~ long_nguoi_hat = "song_ca"
    ~ long_ghi_ten = true
    ~ long_tang_bai_nguyen = true
    quan_ly_idol: *(khựng lại)* {idol_het_thoi}… với {sieu_nhan_hong}? Em chắc hông? *(rồi gật, rất nhanh)* Được.
    ~ qh("quan_ly_idol", 8)
* [🙈 "Siêu Nhân Hồng hát. Đừng ghi tên tui."]
    ~ long_nguoi_hat = "nguyen"
    ~ long_ghi_ten = false
    ~ long_tang_bai_nguyen = true
    quan_ly_idol: Vậy ghi gì? "Nhạc & lời: Ẩn danh"?
    con_ong_chau_cha: Ghi "Rồng".
* [🙅 "Thôi. Dùng nhạc nền. Bài này chưa tới lúc."]
    ~ long_nguoi_hat = ""
    _Bạn cất ổ cứng vào túi. 41 bản demo, một bản cuối. Vẫn chỉ có bạn nghe._
- -> END

= phat_hat
* [🎤 Đi tìm {idol_het_thoi}: "Anh hát đi. Nhưng ghi tên tui."]
    idol_het_thoi: *(gỡ kính)* …Ừ. Anh nợ em cái đó.
    ~ long_ghi_ten = true
    ~ qh("idol_het_thoi", 8)
* [😶 Kệ.]
    _Bạn ngồi xuống hàng ghế cuối. Đêm nay, giai điệu của bạn sẽ có giọng của người khác._
- -> END

= vang_nguyen
_Phòng chờ của {sieu_nhan_hong} trống trơn. Bên kia đường, màn hình LED của LL đang thử hình bộ đồ hồng viền xanh lá chuối. Bài viết cho {sieu_nhan_hong} giờ không còn người hát._
{ long_nguoi_hat == "song_ca" || long_hua_song_ca_ghi_ten || long_nguoi_hat == "phat":
    _{idol_het_thoi} đứng ở cửa phòng chờ, kính đen, tay cầm micro không dây._
    idol_het_thoi: Nếu tối nay sân khấu trống… anh lên. Bài của em hay bài của anh, em chọn.
}
* {long_nguoi_hat == "song_ca" || long_hua_song_ca_ghi_ten || long_nguoi_hat == "phat"} [🎤 "Anh hát bài của tui. Ghi tên tui."]
    ~ long_nguoi_hat = "phat"
    ~ long_ghi_ten = true
    ~ long_bai_phat_hanh = true
    idol_het_thoi: *(gật)* Ghi tên em. Anh hứa lần thứ hai.
* [🙅 "Anh hát 'Công Viên' đi. Bài của tui đợi người của nó về."]
    ~ long_nguoi_hat = ""
    _Bạn cất ổ cứng vào túi. Có những bài phải đợi đúng người._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_3110_canh_ga ===
# ngay:31 # gio:19:15 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 15. Mười lăm phút nữa mở màn: phim ngắn "Người Hùng Không Tên", rồi video "16 năm" của {editor}, rồi 20 giờ là tiết mục chính. Bạn đứng trong cánh gà. {thuc_tap_sinh} đứng cạnh, mặc đồ y chang bạn, như mọi ngày._
{ long_nguoi_hat:
- "nguyen":
    _Trên bàn âm thanh của {it} có một ổ cứng dán băng keo ghi "HLTD". Tờ cue sheet của {chua_te_deadline} ghi: "20:00 – Hồng Là Thái Độ. Nhạc & lời: {long_ghi_ten: {con_ong_chau_cha}|Rồng}"._
- "song_ca":
    _Trên bàn âm thanh của {it} có một ổ cứng dán băng keo ghi "HLTD". {idol_het_thoi} đứng tập hơi ở góc cánh gà, lần đầu không đeo kính đen. Tờ cue sheet ghi: "20:00 – Hồng Là Thái Độ (song ca). Nhạc & lời: {con_ong_chau_cha}"._
- "phat":
    _{idol_het_thoi} đứng ở góc cánh gà, lẩm nhẩm lời. Giai điệu của bạn, giọng của người khác.{ long_ghi_ten: Ít nhất tên bạn sẽ nằm trên màn hình.}_
    ~ long_bai_phat_hanh = true
- else:
    _Tờ cue sheet của {chua_te_deadline} ghi: "20:00 – Nhạc nền chủ đề (không lời)". Bạn đọc dòng đó ba lần._
}
// Long công khai là tác giả và Siêu Nhân Hồng hát: Đại Nhạc Hội chung sẽ phát bài này
{ (long_nguoi_hat == "nguyen" || long_nguoi_hat == "song_ca") && long_ghi_ten && not nguyen_theo_ll:
    ~ chung_hat_hong_la_thai_do = true
    ~ long_bai_phat_hanh = true
}
{ long_nguoi_hat == "nguyen" && not long_ghi_ten:
    ~ long_bai_phat_hanh = true
}
thuc_tap_sinh: Dạ anh {con_ong_chau_cha}… xong đêm nay anh làm gì ạ?
* [🎸 "Viết bài thứ hai."]
    thuc_tap_sinh: Dạ! Em nghe đầu tiên được hông ạ?
    con_ong_chau_cha: Anh nghe thứ hai. Người đầu tiên đã đặt chỗ rồi.
    ~ qh("thuc_tap_sinh", 5)
* [🛵 "Đi làm ca sáng. Rồng cần tiền trọ."]
    thuc_tap_sinh: Dạ… em xin làm chung ạ.
    ~ qh("thuc_tap_sinh", 5)
    ~ long_tl(3)
* [🤝 Ra hàng ghế đầu tìm chú.]
    _Chú ngồi hàng đầu, mặc đồ "Ông Kẹ Ngân Hàng", tay cầm cuốn sổ nợ bằng bìa giấy. Thấy bạn, chú vỗ vào ghế trống bên cạnh: "Xong tiết mục thì ra đây ngồi với chú."_
    ~ qh("giam_doc", 6)
- -> END
