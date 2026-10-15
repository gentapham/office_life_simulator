// ============================================================
// BIÊN KỊCH: OÁNH · CHƯƠNG 6: "MÀN ẢNH LỚN" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== bien_kich_2810_moc_4 ===
# ngay:28 # gio:10:00 # noi:phong_nghe_si # bat_buoc
_Mốc 4: phải đạt 800.000 người theo dõi. Sáng nay bộ lọc số liệu của {dan_dau_tu} vừa lần ra một ổ tài khoản ảo bình luận "Anh Phát đỉnh nóc kịch trần"._
{ nguoi_theo_doi < 800000:
    _Chưa đạt mốc 4. Trên mạng, LL-Entertainment đăng một dòng: "Ngôi sao xứng đáng một bến đỗ tốt hơn." Ai cũng hiểu là nói ai._
    ~ cang_thang(10)
}
_Phòng nghệ sĩ. {quan_ly_idol} cầm hai điện thoại, cái nào cũng đang rung. Mắt anh ấy thâm tới mức thành một phong cách._
quan_ly_idol: {bien_kich}, em viết giùm anh một cái thư xin lỗi cho {idol_het_thoi}. Ngắn thôi. Trưa nay phải đăng.
_{idol_het_thoi} ngồi ở góc, không đeo kính đen. Lần đầu tiên bạn thấy mắt anh ấy giữa ban ngày._
* [✒️ Viết thật: "Tôi đã thuê người khen mình, vì tôi sợ không còn ai khen nữa. Tôi xin lỗi."]
    ~ bk_that(5)
    ~ qh("idol_het_thoi", 10)
    ~ qh("quan_ly_idol", 10)
    idol_het_thoi: *(đọc xong, im rất lâu)* …Đăng đi. Đúng là vậy mà.
    _Bài đăng lúc 12:00. Lúc 12:30, bình luận thật đầu tiên trong ba năm: "Vậy giờ em khen thật nè. Công Viên hay mà."_
    ~ follow(5000)
* [🎭 Viết khéo: "Một sự cố kỹ thuật từ đối tác truyền thông cũ, nghệ sĩ không hề hay biết."]
    ~ qh("quan_ly_idol", 5)
    ~ qh("idol_het_thoi", -5)
    idol_het_thoi: *(đọc xong)* Hay. Hay quá. *(đặt tờ giấy xuống)* Nghe không giống tôi chút nào.
    ~ bk_cam(-5)
* [😶 "Anh ơi, cái này em nghĩ anh {idol_het_thoi} nên tự viết."]
    quan_ly_idol: Em nói đúng. *(quay sang {idol_het_thoi})* Viết đi. Anh ngồi đây với em.
    ~ qh("quan_ly_idol", 5)
    ~ bk_that(3)
- _Trên đường ra, bạn đi ngang phòng dựng. {editor} ngồi nhìn màn hình như nhìn một quả bom hẹn giờ. Bạn không hỏi. Nhà văn biết khi nào không nên hỏi._
-> END

// ------------------------------------------------------------
=== bien_kich_2810_xin_chu_ky ===
# ngay:28 # gio:15:30 # noi:khu_lam_viec_chung
{ bk_trang_tieu_thuyet < 100:
    _Bạn lật bản thảo. Mới {bk_trang_tieu_thuyet} trang. Còn xa mới thành một cuốn sách. Nhưng xin phép người ta thì không cần đợi viết xong._
- else:
    _Bản thảo đã dày {bk_trang_tieu_thuyet} trang. Đến lúc phải hỏi những người trong đó: tui có được viết về mấy người không?_
}
{ bk_da_doi_ten:
    _Tên thật đã đổi hết. Nhưng bạn vẫn muốn hỏi. Vì người trong sách vẫn là người thật, dù tên là gì._
}
_Bạn cầm tờ giấy A4 kẻ bảng: "Tôi đồng ý xuất hiện trong tiểu thuyết 'Công Ty Là Gia Đình'." Đi một vòng tầng 1._
* [🙇 Đi từng bàn, đọc cho mỗi người nghe đoạn viết về họ trước khi xin ký.]
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 4
    ~ bk_lo(-10)
    ~ bk_that(5)
    hong_hot: *(nghe xong đoạn của mình)* Trời, tui hóng dữ vậy hả? …Ờ đúng. Ký!
    hr: Em viết anh cười đáng sợ à? *(cười)* Thôi được. Ký. Nhưng tập 2 anh muốn được viết hiền hơn.
    thuc_tap_sinh: Dạ em ký ạ! Mà… em có được đọc hết hông chị?
    chi_dai: Ký. Viết sai một chữ chị tìm tới nhà. Chị biết nhà em ở đâu đó.
    ~ nghi(-10)
* [📎 Chỉ đưa tờ giấy, nói nhanh: "Ký đại đi, tui viết tốt cho mấy người."]
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 2
    ~ bk_lo(5)
    designer: Viết tốt là viết sao? Tui ký vô giấy trắng hả bà?
    ~ qh("designer", -5)
* [😶 Cất tờ giấy. Chưa đủ can đảm.]
    ~ cang_thang(5)
    _Tờ giấy nằm trong sổ, trắng tinh. Như trang đầu tiên của tháng 10._
- -> END

// ------------------------------------------------------------
=== bien_kich_2910_may_danh_chu ===
# ngay:29 # gio:09:15 # noi:ban_bien_kich # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. Cả công ty ngồi nhìn màn hình đứng hình như nhìn bể cá không có cá. {it} bị cả tầng truy đuổi._
_Chỉ có một âm thanh còn chạy: lạch cạch, lạch cạch. Bạn đã khiêng cái máy đánh chữ từ gác mái tới công ty._
~ bk_go_may_29 = true
hong_hot: Ủa… tiếng gì vậy? Nghe như… như mưa trên mái tôn.
_Từng người một xúm lại. {chua_te_deadline}. {dan_dau_tu}. Rồi cả {truong_phong}, tay cầm cuốn sổ kẻ ô, không biết họp gì._
truong_phong: Thế… em gõ gì đấy?
* [⌨️ Gõ tiểu thuyết, để cả phòng nghe tiếng mà không thấy chữ.]
    ~ bk_trang(10)
    ~ bk_cam(15)
    ~ bk_lo(5)
    _Mười trang. Tiếng máy đánh chữ thành nhạc nền cho một ngày không có mạng. Không ai lướt Tóp-tóp. Không ai cãi nhau._
* [🎬 Gõ lại kịch bản phim từ đầu, đọc to từng cảnh cho mọi người nghe.]
    ~ bk_that(5)
    ~ qh("truong_phong", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    _Tới cảnh đẩy xe trong mưa, {hong_hot} khóc. {dan_dau_tu} nói "bụi vô mắt". Tòa nhà không có bụi._
* [🤝 "Ai muốn nhắn gì thì nói, tui gõ thành thư, nhờ {thuc_tap_sinh} chạy đưa."]
    ~ qh("thuc_tap_sinh", 5)
    ~ qh("hong_hot", 5)
    ~ qh("chi_dai", 5)
    ~ bk_that(5)
    _Thư đầu tiên: {dan_dau_tu} gửi {sales}: "Anh sẽ trả. Đợt này lên thật." Bạn gõ y nguyên, không sửa một chữ._
- -> END

// ------------------------------------------------------------
=== bien_kich_2910_tong_dai_giay ===
# ngay:29 # gio:14:30 # noi:choi_bao_ve # bat_buoc
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} ngồi phân loại thư tay vào mấy cái hộp bánh, theo từng tầng. {chi_dai} điều phối bằng bộ đàm._
bac_bao_ve: Cháu viết đẹp. Ngồi đây chép lại giúp bác mấy cái thư nhòe mực.
_Một tờ giấy gấp tư đề "Gửi chị {bien_kich}". Chữ nắn nót, quen quen._
_"Dạ chị ơi, mai là hạn nộp ô credit cuối phim. Em không dám hỏi chị điền gì. Em chỉ muốn nói: phim hay lắm ạ. Em {thuc_tap_sinh}."_
* [✒️ Viết thư trả lời, gửi qua tổng đài: "Mai anh tới sớm, mình cùng điền."]
    ~ qh("thuc_tap_sinh", 10)
    ~ bk_that(3)
    _Bác {bac_bao_ve} cầm thư, đọc lướt (bác đọc hết mọi thư, nhưng bác không thấy gì đâu), rồi bỏ vào hộp "Tầng 1"._
* [😶 Gấp thư lại, bỏ vào sổ. Chưa trả lời.]
    ~ cang_thang(10)
    bac_bao_ve: Thư không trả lời thì như cổng không đóng. Gió lùa vào mãi đấy, cháu ạ.
* [💬 Hỏi bác: "Bác giữ thư người ta lâu năm vậy, có bao giờ thấy nặng hông bác?"]
    bac_bao_ve: Nặng chứ. *(rót trà)* Nhưng thư là của người viết. Bác chỉ giữ. Giữ khác với lấy, cháu ạ.
    _"Giữ khác với lấy." Bạn ghi vào sổ, rồi ngồi nhìn câu đó rất lâu._
    ~ bk_that(5)
    ~ bk_cam(10)
    ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== bien_kich_2910_trang_cuoi ===
# ngay:29 # gio:23:00 # noi:gac_mai_so_7
_Đêm 29. Gác mái. Bản thảo "Công Ty Là Gia Đình" dày {bk_trang_tieu_thuyet} trang._
{ bk_trang_tieu_thuyet >= 160 && not bk_ban_cho_ll:
    _Còn một chút nữa thôi. Bạn có thể gõ tới sáng._
- else:
    _Còn xa lắm. Nhưng đêm nay vẫn có thể gõ thêm vài trang._
}
* [⌨️ Gõ tới sáng. Bí ngủ, phố ngủ, chỉ có bạn với cái máy.]
    ~ bk_trang(40)
    ~ nghi(-30)
    ~ bk_cam(-5)
    { bk_trang_tieu_thuyet >= 200:
        _5 giờ 40 sáng. Bạn gõ chữ "HẾT" lần thứ hai trong tuần. Lần này là của bạn. Toàn bộ._
        ~ bk_cam(20)
    }
* [🐈 Ngủ. Mai còn ô credit. Mai còn Đêm Hồng.]
    ~ nghi(40)
    ~ bk_vuot_meo = bk_vuot_meo + 1
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== bien_kich_3010_o_credit ===
# ngay:30 # gio:09:00 # noi:phong_dung_phim # bat_buoc
{ not bk_kich_ban_phim_xong:
    _Không có phim, nên không có ô credit nào. {editor} đưa bạn ly cà phê, không nói gì. Đôi khi im lặng là cách tử tế nhất._
    ~ bk_credit = "trong"
    -> END
}
_Phòng dựng. {editor} xoay màn hình về phía bạn. Danh sách credit cuối phim. Ô "Ý tưởng / Kịch bản" đang để trống._
editor: Chị điền đi. *(ngáp)* Render xong là xong. Không sửa được nữa đâu.
{ bk_ghi_cong_duy:
    _Ngoài cửa, {thuc_tap_sinh} đứng chờ từ 7 giờ sáng, tay cầm hai ly cà phê, một ly đen đá không đường cho {editor}._
}
* [🙇 "Ý tưởng: {thuc_tap_sinh}. Kịch bản: {bien_kich} & {thuc_tap_sinh}."]
    ~ bk_credit = "ca_hai"
    { not bk_ghi_cong_duy:
        ~ bk_so_lan_ghi_cong = bk_so_lan_ghi_cong + 1
        ~ bk_muon(-20)
        ~ qh("thuc_tap_sinh", 20)
    }
    editor: *(gõ, rồi dừng lại)* Đẹp. Dòng này đẹp hơn dòng cũ.
* [✍️ "Kịch bản: {bien_kich}."]
    ~ bk_credit = "oanh"
    editor: *(gõ chậm)* …Dạ.
    _{editor} biết ai là người dựng mọi thứ mà không được ghi tên. Cái "dạ" đó dài hơn bình thường._
* [😶 Để trống. "Phim này… không phải của ai hết."]
    ~ bk_credit = "trong"
    editor: Để trống thì màn hình đen ba giây. Ba giây trên màn hình lớn dài lắm đó chị.
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== bien_kich_3010_hop_danh_gia ===
# ngay:30 # gio:15:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Phòng họp tầng 2, đông như ngày ký hợp đồng. Chỉ khác là không ai cười._
_{giam_doc} cầm tập hồ sơ. {hr} ngồi bên cạnh, nụ cười cố định. {ke_toan} lật sổ, không ngẩng lên._
giam_doc: Các em. Một tháng qua… *(dừng lại)* Một tháng qua anh nghe nhiều chuyện. Có chuyện anh vui. Có chuyện anh vừa mới biết.
truong_phong: Phòng Sản xuất xin báo cáo. Kịch bản phim ngắn… *(nhìn sang bạn)* Oánh nói đi.
* [🙇 Đứng dậy nói hết: chuyện của ai, của ai, của ai.]
    { not bk_ghi_cong_duy:
        ~ bk_so_lan_ghi_cong = bk_so_lan_ghi_cong + 1
        ~ bk_muon(-10)
    }
    ~ bk_that(5)
    _Bạn nói về cô Năm cơm tấm, về {designer}, về {thuc_tap_sinh}. Về những câu bạn "tham khảo". Cả phòng im._
    giam_doc: *(gật đầu chậm rãi)* Thế mới là gia đình.
* [🎤 Nói như một bài phát biểu: ngắn, hay, có năm từ khóa sếp thích.]
    ~ qh("giam_doc", 5)
    _Gia đình, mindset, hồi khởi nghiệp, văn hóa, cùng nhau. {giam_doc} vỗ tay. Không ai khác vỗ._
* [😶 "Dạ, xin để phim tự nói vào tối mai."]
    ~ bk_cam(5)
    giam_doc: Được. Anh không ép.
- -> bien_kich_3010_danh_gia

// ------------------------------------------------------------
=== bien_kich_3110_hau_truong ===
# ngay:31 # gio:18:30 # noi:san_khau_dem_hong # bat_buoc
_Sân khấu Đêm Hồng. Cả công ty hóa trang. {giam_doc} là "Ông Kẹ Ngân Hàng", vest đen, răng nanh nhựa. Còn {sieu_nhan_hong} thì… vẫn là {sieu_nhan_hong}._
_Hậu trường chật cứng. Ngoài kia cả nghìn người đang tới. Màn hình lớn sẽ chiếu phim của bạn lúc 19:30._
{ bk_hai_cay_so:
    _{thuc_tap_sinh} đứng cạnh bạn ở cánh gà, áo sơ mi ủi phẳng tới mức có thể cắt giấy. Cách đó năm mét, bộ đồ hồng đang tập động tác "Biến hình!"._
}
* {bk_hai_cay_so} [🔒 Dẫn {thuc_tap_sinh} tới trước {sieu_nhan_hong}: "Anh có nhớ một cái xe máy chết giữa mưa, đẩy tới cây xăng?"]
    sieu_nhan_hong: Xe máy… mưa… *(nhìn {thuc_tap_sinh} rất lâu qua khe mũ)* Anh đẩy nhiều lắm… mà… cái áo sơ mi trắng ướt nhẹp… ôm cái thùng giấy…?
    thuc_tap_sinh: Dạ… dạ là em. Thùng giấy là đồ ở bàn làm việc cũ của em ạ.
    sieu_nhan_hong: Trời ơi! Là em hả?! Anh nhớ rồi! Em khóc quá trời, anh tưởng do mưa!
    _Hai người đứng đó, một người mặc đồ hồng, một người mặc sơ mi trắng. Không ai nói thêm gì. Không cần._
    ~ qh("thuc_tap_sinh", 15)
    ~ qh("sieu_nhan_hong", 15)
    ~ bk_that(10)
* [😇 Đứng cạnh {thuc_tap_sinh}, đưa cho anh ấy chai nước: "Chút nữa mình coi chung nha."]
    thuc_tap_sinh: Dạ. *(cầm chai nước bằng hai tay)* Em run quá chị.
    ~ qh("thuc_tap_sinh", 5)
* [✍️ Ngồi một góc, ghi lại hậu trường. Trang cuối của tháng 10.]
    ~ bk_trang(3)
    ~ bk_cam(5)
- -> END

// ------------------------------------------------------------
=== bien_kich_3110_mo_man ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 30. Đèn tắt. Cả nghìn người im lặng. Màn hình lớn sáng lên: "NGƯỜI HÙNG KHÔNG TÊN"._
{ not bk_kich_ban_phim_xong:
    _Không. Màn hình sáng lên: "15 PHÚT CÙNG CEO". {giam_doc} bước ra trong bộ đồ Ông Kẹ Ngân Hàng, cầm micro._
    giam_doc: Hồi khởi nghiệp…
    _Ở hàng ghế khán giả, có người bắt đầu ngáp. Rồi người thứ hai._
    -> END
}
{ bk_phim_thanh_cong:
    _Mười lăm phút. Người ta cười ở cảnh ly chè. Người ta im ở cảnh mưa. Người ta khóc ở cảnh cuối, khi người hùng quay lưng đi._
    ~ follow(120000)
    { bk_credit == "ca_hai" && bk_ghi_cong_duy:
        ~ follow(50000)
    }
    { bk_hai_cay_so:
        ~ follow(50000)
    }
- else:
    _Mười lăm phút. Phim ổn. Người ta vỗ tay. Không ai khóc, nhưng cũng không ai về sớm._
    ~ follow(30000)
}
_Màn hình đen dần. Dòng chữ cuối phim bắt đầu chạy lên…_
-> END
