// ============================================================
// CHÚA TỂ DEADLINE · CHƯƠNG 2: "MV MỘT ĐÊM" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== chua_te_deadline_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2. Họp giao ban đầu tuần. "Nhanh 5 phút", theo lịch là tới 10 giờ 30._
_Trên bàn bạn sáng nay: một ly giữ nhiệt màu hồng, có khắc chữ "Chill". Món quà thứ hai._
~ vu_qua_hong++
truong_phong: Rồi. {chua_te_deadline}, cậu báo cáo tiến độ MV đi. Ngày 9 ra mắt, tức là còn 4 ngày.
{ vu_bang_tien_do_that:
    _May là bảng tiến độ hôm thứ 6 bạn làm tử tế. Nó vẫn còn đúng tới… khoảng 60%._
- else:
    _Bảng tiến độ của bạn vẫn là một thanh hồng. Thanh đó vẫn ghi "31/10: làm hết"._
}
* [📊 "Dạ xong 80% rồi anh, còn khâu dựng."]
    ~ vu_bao_cao_80++
    { RANDOM(1, 10) <= 6:
        truong_phong: 80% à? Ừ. Tốt. Tớ take note lại.
        _{truong_phong} không đòi xem file. Một ngày may mắn._
    - else:
        truong_phong: 80% à? Cho tớ xem file. Ngay bây giờ.
        _Bạn mở thư mục MV. Trong đó có đúng một file tên "MV_final_final_that.txt", dung lượng 0 KB._
        ~ uy_tin = uy_tin - 20
        ~ qh("truong_phong", -10)
        truong_phong: Sau họp cậu ở lại. Mình sync nhanh 5 phút.
        ~ cang_thang(15)
    }
* [😇 Trình bày thật: quay xong, còn dựng, nhạc đã có.]
    -> chua_te_deadline_mg_bao_cao_giao_ban_mo_dau
* [🙈 "Dạ em xin phép ra nghe điện thoại đối tác…" (rồi không quay lại)]
    ~ vu_so_lan_ne_nhat++
    _Bạn lên sân thượng. Trên ghế nhựa, {ran_doc} đang ngồi bấm điện thoại, ngẩng lên cười._
    ran_doc: Ủa, ông cũng trốn họp hả? Nói nhỏ thôi nha, tui hổng nói ai đâu.
    ~ vu_nuoc(5)
    ~ qh("truong_phong", -5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_0610_chup_poster ===
# ngay:6 # gio:10:30 # noi:studio_tang_2 # bat_buoc
_Buổi chụp poster đầu tiên. {designer} đã chuẩn bị 3 phông, {thuc_tap_sinh} cầm tấm hắt sáng, {it} lo đèn, {quan_ly_idol} cầm 2 điện thoại._
_10 giờ 30. {sieu_nhan_hong} đang tạo dáng thứ 14 thì nhìn ra cửa sổ: dưới Đường Hóng, ngay đầu Hẻm 69, xe chè của Bà Bảy sụp một bánh xuống ổ gà._
sieu_nhan_hong: Điều khoản số 3! Hồng đi đây! *(phóng qua cửa sổ… à không, phóng xuống cầu thang)*
quan_ly_idol: Khoan, anh nghe máy chút… Ủa {sieu_nhan_hong} ĐÂU RỒI?
_Studio thuê theo giờ. {it} phải đi lắp mạng lúc 11 giờ. {designer} có lịch nộp banner 11 giờ 30. Mọi ánh mắt dồn về bạn._
designer: {chua_te_deadline}, tính sao ông? 15 phút. # hen_gio:8
* [🧯 "Chụp {cho} trước! Poster teaser: 'Siêu Nhân Hồng đang bận cứu người'."]
    _{cho} được đặt lên ghế. Nó nhìn ống kính bằng ánh mắt khinh bỉ cả thế giới. Tấm ảnh đẹp không tưởng._
    ~ follow(8000)
    ~ qh("designer", 5)
    ~ uy_tin = uy_tin + 5
* [🗓️ Xếp lại lịch cả đoàn ngay tại chỗ.]
    -> chua_te_deadline_mg_xep_lich_quay_mo_dau
* [📱 "Anh {thuc_tap_sinh}, chạy theo quay lại! Quay dọc cũng được!"]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    thuc_tap_sinh: Dạ em làm liền ạ! *(cầm nguyên tấm hắt sáng chạy theo)*
    _20 phút sau, {thuc_tap_sinh} quay về, thở không ra hơi, đưa điện thoại. Clip rung như động đất, nhưng thật tới nao lòng: góc thứ hai của vụ đẩy xe chè, gửi {hong_hot} đăng kèm._
    ~ follow(15000)
    ~ qh("thuc_tap_sinh", 3)
* [⏱️ (Không chọn kịp)]
    _Cả đoàn đứng chờ. Studio tính tiền thêm 1 tiếng. {ke_toan} sẽ hỏi hóa đơn._
    ~ vu_nuoc(10)
    ~ qh("designer", -5)
    ~ uy_tin = uy_tin - 5
- _Nửa tiếng sau {sieu_nhan_hong} quay về, mồ hôi ướt đẫm bộ đồ, ống hút còn cắm qua khe mũ, tay xách mấy ly chè đậu Bà Bảy gửi. Cô bán chè đứng dưới đường nhìn lên cửa sổ studio một lúc rồi mới quay đi._
sieu_nhan_hong: Xin lỗi cả nhà! Bà cho chè nè. *(đưa riêng cho bạn ly đầy nhất)* Ly này… cho producer.
* [🥤 Nhận, ăn luôn.]
    ~ an(15)
    ~ vu_tin(3)
    sieu_nhan_hong: Ngon hông? *(hỏi nhỏ, không tạo dáng)*
* [📸 "Anh cầm ly chè tạo dáng cái, đăng story là đẹp."]
    sieu_nhan_hong: À… ừ. Biến hình! *(tạo dáng, nhưng hơi chậm)*
    ~ follow(3000)
    ~ vu_tin(-2)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_0710_moc_1 ===
# ngay:7 # gio:17:00 # noi:phong_giam_doc # bat_buoc
_Mốc 1: 50.000 người theo dõi. {hong_hot} cầm điện thoại đứng giữa phòng như cầm tờ kết quả xổ số._
{ nguoi_theo_doi >= 50000 && vu_nuoc_toi_chan < 100:
    hong_hot: {nguoi_theo_doi} người! QUA MỐC 1 RỒI MẤY BÀ ƠI!
    giam_doc: Đấy! Anh đã bảo mà! Tối nay anh… à, tối nay các em về sớm.
    _Cả phòng vỗ tay. {truong_phong} vỗ tay bằng hai ngón._
    -> chua_te_deadline_0710_qua_moc
- else:
    ~ vu_moc_truot++
    hong_hot: {nguoi_theo_doi}… Hông qua mấy bà ơi. Toang.
    giam_doc: Không sao. Không sao cả. 18 giờ cả công ty lên phòng họp. Anh muốn truyền lửa một chút.
    _"Một chút" của {giam_doc}: 3 tiếng. Bạn bị xếp ngồi hàng đầu._
    -> chua_te_deadline_0710_truyen_lua
}

= chua_te_deadline_0710_qua_moc
sieu_nhan_hong: *(ló đầu vào cửa)* Qua mốc rồi hả? Vì công lý và lượt view!
* [😎 "Thấy chưa, chill là kịp hết."]
    ~ vu_nuoc(5)
    truong_phong: Lần này may thôi, {chua_te_deadline}.
* [🤝 "Nhờ cái clip giúp bà cụ đó anh. Anh làm thật nên người ta thích thật."]
    sieu_nhan_hong: *(đứng im, quên tạo dáng)* … Thiệt hả em?
    ~ vu_tin(5)
    ~ qh("sieu_nhan_hong", 5)
- -> END

= chua_te_deadline_0710_truyen_lua
giam_doc: Hồi anh khởi nghiệp năm 2010, căn phòng có 20 mét vuông, các em ạ. Anh phải tự check cái mindset của mình mỗi sáng…
_Giờ thứ 2. {editor} ngủ gục. {dan_dau_tu} mở chart dưới gầm bàn. {thuc_tap_sinh} vẫn ghi chép._
* [😴 Ngủ với mắt mở (kỹ năng cổ truyền).]
    ~ nghi(10)
    { RANDOM(1, 10) <= 3:
        giam_doc: {chua_te_deadline}! Em nhắc lại câu anh vừa nói xem!
        _Bạn nói đại: "Anh không ép, tùy em." Cả phòng nín thở. {giam_doc} gật gù: "Chuẩn!"_
    }
* [📝 Ghi lại các ý tưởng "truyền lửa" làm kịch bản video ngắn.]
    _Bạn biến bài phát biểu 3 tiếng thành video 30 giây "Sếp tui khi tụt KPI". Đăng lên với tên… à, {hong_hot} đăng._
    ~ follow(6000)
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
- ~ cang_thang(15)
~ nghi(-15)
-> END

// ------------------------------------------------------------
=== chua_te_deadline_0810_linh_kham_mat ===
# ngay:8 # gio:19:00 # noi:phong_dung_phim # bat_buoc
_Ngày Thị giác Thế giới. Đêm nay phải dựng xong MV "Hồng Hóa Việt Nam", 8 giờ sáng mai gửi bản cuối cho {hong_hot} lên lịch, 20 giờ tối mai ra mắt. Điện thoại rung._
editor: *(gọi điện, ngáp)* Tui đang ở phòng khám nè. Bác sĩ nói mắt tui như mắt người 60 tuổi. Cấm nhìn màn hình 3 ngày.
_Bạn nhìn đồng hồ: 19 giờ. Nhìn phần mềm dựng phim trên máy {editor}: 47 lớp hình, 12 lớp nhạc. Bạn chưa bao giờ mở nó quá 10 phút._
* [🙏 "Ông nhắm một mắt dựng thôi, mắt kia để mai nghỉ."]
    editor: Ha. *(cười được một tiếng, rồi cúp máy)*
    ~ qh("editor", -10)
    _Không còn ai. Chỉ còn bạn với 47 lớp hình._
    -> chua_te_deadline_mg_dem_than_toc_mo_dau
* [😇 "Thôi ông nghỉ đi. Đêm nay tui tự dựng, sai đâu ông sửa sau."]
    ~ qh("editor", 15)
    editor: … Ông nói thật hả? Ờ. Có gì ông cứ nhắn. Tui nhắm mắt nghe điện thoại được.
    -> chua_te_deadline_mg_dem_than_toc_mo_dau
* {co(mi_ly)} [🍜 "Tối nay tui mang mì ly với 2 lon Trâu Cày qua, ông ngồi chỉ thôi, tui bấm."]
    ~ mat(mi_ly)
    editor: … Được. Nhớ mì vị tôm chua cay.
    _Đêm đó hai người dựng MV. {editor} nhắm mắt chỉ từng khung hình theo trí nhớ. 2 giờ sáng, {editor} kể về một người "lúc nào cũng cầm 2 điện thoại"…_
    editor: Người đó… sáng nào cũng uống 3 ly cà phê… mà hông bao giờ nhìn…
    _{editor} ngủ gục. Không nói hết câu. Bạn đắp cho {editor} cái áo khoác, dựng tiếp._
    ~ qh("editor", 12)
    -> chua_te_deadline_mg_dem_than_toc_mo_dau
* {vu_lo_file >= 30} [🔒 "{editor}, tui nói thật: file gốc dự án tháng 6 tui làm mất rồi."]
    editor: … *(im lặng rất lâu)* Render xong là xong. Ông nợ tui một bữa.
    ~ vu_lo_file = vu_lo_file - 30
    ~ vu_linh_giu_bi_mat = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("editor", 10)
    editor: Giờ tui nói ông cách dựng, ông bấm. Tui nhắm mắt.
    -> chua_te_deadline_mg_dem_than_toc_mo_dau

// ------------------------------------------------------------
=== chua_te_deadline_0910_xuat_file_759 ===
# ngay:9 # gio:07:55 # noi:phong_dung_phim # bat_buoc
_7 giờ 55. Thanh xuất file MV: 96%. Bên ngoài cửa sổ, chim đã hót xong một lượt và đang chuẩn bị hót lượt hai._
{ vu_nuoc_toi_chan >= 80:
    _Chế độ Thần Tốc đang bật. Tay bạn nhanh gấp 3. Nhưng cái gì nhanh quá cũng có lúc trượt._
}
_7 giờ 58. 99%. Điện thoại rung: {truong_phong} gọi._ # hen_gio:6
* [📤 Bấm "Gửi" đúng 7:59, không nghe máy.]
    { vu_nuoc_toi_chan >= 80 && RANDOM(1, 10) <= 2:
        _Gửi lúc 7:59! Nhưng… lỗi phút chót: 3 giây cuối MV là màn hình đen có chữ "nhớ xóa dòng này"._
        hong_hot: ÔNG ƠI CÁI DÒNG CUỐI! Thôi khỏi sửa, tui để vậy, tối nay ai thấy thì tưởng cố ý.
        ~ vu_mv_dung_ngay = true
    - else:
        _7:59:00. Gửi. Bạn ngả ra ghế. Nước tới chân mới nhảy, mà nhảy là phải đẹp._
        ~ vu_mv_dung_ngay = true
    }
    ~ vu_nuoc(-20)
* [📞 Nghe máy {truong_phong} trước.]
    truong_phong: Cậu xong chưa? Tớ chỉ hỏi thôi. Không có ý gì.
    _Trong lúc {truong_phong} "chỉ hỏi thôi" trong 4 phút, thanh xuất file treo ở 99%._
    _8 giờ 03 mới gửi được. Trễ 4 phút, nhưng {hong_hot} vẫn lên lịch kịp 20 giờ._
    ~ vu_mv_dung_ngay = true
    ~ qh("truong_phong", 3)
    ~ uy_tin = uy_tin - 3
* [⏱️ (Không chọn kịp)]
    _Bạn ngủ gục lên bàn phím, đúng phím Esc. Thanh xuất file biến mất._
    _MV phải xuất lại từ đầu. 19 giờ 50 mới xong, bỏ luôn khâu chỉnh màu. 20 giờ MV vẫn lên sóng, hồng hơi ngả cam._
    ~ follow(-15000)
    ~ uy_tin = uy_tin - 10
    ~ vu_nuoc(10)
- ~ nghi(-30)
-> END

// ------------------------------------------------------------
=== chua_te_deadline_0910_mv_ra_mat ===
# ngay:9 # gio:12:10 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng: trứng luộc, trứng chiên, trứng ốp la, trứng "đặc biệt" (là trứng luộc cắt đôi)._
_Trên màn hình tivi căn tin, kênh Tóp-tóp của công ty đang chạy đồng hồ đếm ngược: "20:00 TỐI NAY – HỒNG HÓA VIỆT NAM"._
{ vu_mv_dung_ngay:
    hong_hot: Bản cuối tui nhận rồi nha! 20 giờ lên sóng. LL mà chơi xấu là tui chiến!
- else:
    hong_hot: Ông xuất lại kịp 20 giờ hông đó? Tui đăng đồng hồ đếm ngược rồi á!
}
idol_het_thoi: *(kính đen, nhìn tivi)* MV gì mà không có nốt cao nào. Hồi anh còn nổi…
_Bên cạnh bạn, một hộp cơm trứng màu hồng. Có tờ giấy: "Producer ăn trứng cho có sức. Hôm nay ngày Trứng mà."_
~ vu_qua_hong++
* [🍳 Ăn hộp cơm, chụp hình gửi {hong_hot}: "Content couple tập 3 nè."]
    ~ an(50)
    ~ vu_tin(-3)
    hong_hot: Tui đã nói tui hông có lên kịch bản gì hết mà ông!
    _Bạn không tin. Bạn ăn hết hộp cơm. Ngon thiệt._
* [🍳 Ăn hộp cơm, không chụp hình.]
    ~ an(50)
    ~ vu_tin(3)
    _Lần đầu tiên bạn ăn một món quà hồng mà không nghĩ tới chuyện đăng nó lên đâu._
* [🤝 Chia nửa hộp cho {idol_het_thoi}.]
    ~ an(25)
    idol_het_thoi: *(nhận, gỡ kính)* … Trứng ngon. Đừng nói ai anh ăn cơm của nó nha.
    ~ qh("idol_het_thoi", 8)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_0910_linh_hoi_file ===
# ngay:9 # gio:16:30 # noi:phong_dung_phim
_{editor} vừa từ phòng khám về, đeo kính râm như {idol_het_thoi}. Ngồi vào máy, lục máy chủ._
editor: Sếp nhờ tui "lấy giùm anh mấy cảnh dự án tháng 6". Tui lục máy chủ… hông thấy.
_{editor} xoay ghế lại. Nhìn bạn. Rất lâu._
editor: File gốc tháng 6 đâu ông?
{ vu_linh_giu_bi_mat:
    editor: À… quên. Ông nói rồi. Tui hỏi theo thói quen. Thôi, tui nói sếp là "đang tìm trong ổ lưu trữ".
    -> END
}
~ vu_lo_file = vu_lo_file + 20
* [🧯 "À, nó nằm trong ổ cứng ngoài ở nhà tui. Mai tui mang."]
    editor: Ờ. *(gật đầu, nhưng không quay lại màn hình)*
    ~ vu_lo_file = vu_lo_file + 5
    ~ vu_nuoc(5)
* [⏳ "Đang render lại bản chất lượng cao, ông chờ tui tuần sau."]
    { RANDOM(1, 10) <= 4:
        editor: Render file gốc? File gốc thì render cái gì? *(nheo mắt)*
        ~ vu_lo_file = vu_lo_file + 10
        ~ uy_tin = uy_tin - 10
    - else:
        editor: Ờ… ông nói vậy thì vậy.
    }
* [😇 "Tui… làm mất rồi. Đừng nói ai nha."]
    editor: *(thở dài)* Render xong là xong. Mà cái này hông render được. Tui giữ bí mật. Ông nợ tui một bữa.
    ~ vu_lo_file = vu_lo_file - 30
    ~ vu_linh_giu_bi_mat = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("editor", 10)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1010_het_tien ===
# ngay:10 # gio:11:00 # noi:phong_gac_quan_bida
_Thứ 7, ngày 10. Ngày lương. Nhưng lương chưa về, vì ngân hàng "kiểm tra giao dịch lớn"._
_Bạn đã hết tiền từ ngày 7, vì 4 bữa khuya liền gọi gà rán lúc 2 giờ sáng. Trong tủ còn 6 quả trứng mang về từ căn tin hôm qua._
_Bạn nhìn 6 quả trứng. 6 quả trứng nhìn lại bạn._
* [💰 Nhắn {ke_toan} xin ứng lương.]
    ke_toan: Ứng lương thì được. Em ghi lý do vào đây. Kèm hóa đơn chứng minh em đã tiêu hết tiền vào việc gì.
    _Bạn gửi ảnh 4 hóa đơn gà rán lúc 2 giờ sáng._
    ke_toan: … Chị ứng em 500 nghìn. Đây không phải vì em xứng đáng. Đây là vì chị thương con gà.
    ~ tien_cong(500000)
    ~ qh("ke_toan", -2)
* [🎱 Xuống nhà, rủ {dan_dau_tu} đánh bida cược tiền.]
    -> chua_te_deadline_mg_bida_mo_dau
* [🙏 Nhắn {thuc_tap_sinh}: "Anh ơi, cho em mượn xíu tới thứ 2."]
    ~ vu_muon_duy = true
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    thuc_tap_sinh: Dạ em gửi anh 300 nghìn ạ. Anh cứ từ từ trả ạ.
    _300 nghìn về tài khoản trong 4 giây. Thực tập sinh lương 4 triệu mà chuyển tiền nhanh như ngân hàng tự động. Bạn không để ý._
    ~ tien_cong(300000)
    ~ qh("thuc_tap_sinh", 3)
* [🥚 Ăn trứng. Ăn trứng cả tuần.]
    ~ an(30)
    _Trứng luộc. Trứng chiên. Trứng luộc rồi chiên. Tới bữa thứ 5 bạn bắt đầu nghe thấy tiếng gà gáy trong đầu._
    ~ cang_thang(10)
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1110_anh_hoi_nho ===
# ngay:11 # gio:20:00 # noi:phong_gac_quan_bida
_Chủ nhật. Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ lên group._
_{hong_hot} hồi nhỏ cầm điện thoại đồ chơi. {chi_dai} hồi nhỏ đứng chống nạnh. {giam_doc} hồi nhỏ… mặc vest._
_Rồi {sieu_nhan_hong} đăng một tấm: một đứa nhóc đội mũ len hồng, đứng giữa một con xóm có cây me, cười toe. Phía sau có một đứa nhỏ khác đang khóc._
_Dưới ảnh, {sieu_nhan_hong} nhắn riêng cho bạn: "Còn em hồi nhỏ trông sao?"_
* [📷 Gửi ảnh mình hồi 5 tuổi ngủ gục trên bài tập.]
    sieu_nhan_hong: Trời ơi dễ thương. Từ 5 tuổi đã để bài tập tới phút chót rồi hả?
    _Bạn bật cười. Thật._
    ~ vu_tin(5)
* [😎 "Ảnh em hồi nhỏ là bí mật quốc gia nha anh."]
    sieu_nhan_hong: Vậy anh chờ. Anh quen chờ rồi.
    ~ vu_tin(2)
* [📱 "Anh đăng ảnh này lên page đi, content nostalgia đang trend."]
    sieu_nhan_hong: … Ờ ha. Để anh gửi {hong_hot}.
    ~ follow(5000)
    ~ vu_tin(-2)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1210_giao_ban ===
# ngay:12 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2. Họp giao ban. Lương vẫn chưa về. Cả phòng họp bằng tinh thần của những người chỉ còn 30 nghìn trong tài khoản._
truong_phong: Tuần này là tuần gameshow. Thứ 6, 16/10, Đài Tivi Hóng. Kịch bản phải nộp đài trước 9 giờ sáng thứ 6. {chua_te_deadline}, cậu cam kết đi.
* [😇 "Em cam kết. Thứ 5 em nộp nội bộ để anh duyệt."]
    ~ uy_tin = uy_tin + 5
    ~ qh("truong_phong", 5)
    truong_phong: Thứ 5. Tớ ghi rồi đấy nhé. Tớ ghi bằng mực không xóa được.
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
* [🌊 "Dạ, 8 giờ 59 thứ 6 em nộp. Đúng phong cách."]
    ~ vu_nuoc(10)
    truong_phong: Tớ không hiểu sao cậu nói câu đó với vẻ tự hào thế.
    ~ qh("truong_phong", -5)
* [🙏 "Anh {editor} với chị {bien_kich} viết giùm phần câu hỏi rồi á anh."]
    ~ vu_so_lan_nho_xiu++
    bien_kich: Ủa? Tui viết hồi nào? À… khoan… *(mắt sáng lên)* Kịch bản gameshow… cần thêm nỗi đau…
    editor: *(ngáp)* Tui là dựng phim mà ông…
    ~ qh("bien_kich", -3)
    ~ qh("editor", -5)
- _10 giờ, giữa cuộc họp, điện thoại cả phòng cùng rung một lúc. "Tài khoản của quý khách vừa được cộng…". Lương về!_
_Cả phòng reo lên như vừa ghi bàn. {truong_phong} cố gắng giữ trật tự 4 giây rồi bỏ cuộc._
~ tien_cong(3000000)
-> END

// ------------------------------------------------------------
=== chua_te_deadline_1210_luong_ve ===
# ngay:12 # gio:13:35 # noi:ban_lam_viec
_13 giờ 35. Bạn ăn trưa bằng hộp mì ở bàn. {con_ong_chau_cha}, {thuc_tap_sinh}, {ran_doc}, {hong_hot} vừa đi Cà Phê Sống Ảo về. Không ai nói gì. {con_ong_chau_cha} đi thẳng vào phòng, đóng cửa._
hong_hot: *(ghé tai bạn, thì thầm)* Nghe gì chưa? Thẻ của ổng bị từ chối. Hai lần. Rồi ông {thuc_tap_sinh} trả giùm bằng một cái thẻ… màu kim cương.
* [💬 Hỏi {thuc_tap_sinh}: "Ủa anh, thẻ gì mà lấp lánh vậy?"]
    thuc_tap_sinh: D-dạ… thẻ… thẻ tích điểm siêu thị ạ!
    _Không ai tin. Nhưng cũng không ai hỏi tiếp._
    ~ qh("thuc_tap_sinh", -3)
* [🤝 Gõ cửa phòng {con_ong_chau_cha}: "Chiều nay ông bao tui ly trà đá nha. Tui trả."]
    ~ tien_cong(-20000)
    con_ong_chau_cha: *(mở cửa, cười gượng)* Chill… cảm ơn nha. Lần đầu có người mời anh trà đá. Lạ ghê.
    ~ qh("con_ong_chau_cha", 8)
* [😶 "Chuyện của người ta mà bà." Ăn tiếp hộp mì.]
    hong_hot: Ối dồi ôi, ông bữa nay đứng đắn ghê!
    ~ qh("con_ong_chau_cha", 2)
- ~ an(30)
-> END

// ------------------------------------------------------------
=== chua_te_deadline_1210_bida_toi ===
# ngay:12 # gio:21:00 # noi:quan_bida_co_ban
_Tối thứ 2, quán bida dưới nhà. {dan_dau_tu} đang đứng một mình, tay cầm cơ, mắt dán vào điện thoại._
dan_dau_tu: Ê {chua_te_deadline}! Vừa có lương hả? Đánh một ván. Mà nói nghe nè, có đồng Hồng Coin mới ra đêm thứ 6, theo tên Siêu Nhân Hồng đó. Lần này là lên thật.
_Rồi anh hạ giọng, như nhớ ra: "À, chị {ke_toan} hỏi anh cái hóa đơn 800 triệu dự án tháng 6 của em đó. Nghe nói tuần sau có đoàn kiểm tra. Em còn giữ biên bản nghiệm thu chứ?"_
~ vu_nuoc(5)
* [🎱 "Đánh thì đánh, coin thì thôi."]
    -> chua_te_deadline_mg_bida_mo_dau
* [💬 "Hồng Coin? Ai tạo vậy anh?"]
    dan_dau_tu: Fan ẩn danh. Hông biết ai. Mà hông biết ai mới hay! Hông biết ai thì hông ai bán tháo!
    _Bạn không giỏi tài chính, nhưng câu đó nghe giống câu mở đầu của mọi video "tôi mất trắng như thế nào"._
    ~ qh("dan_dau_tu", 3)
* [😴 "Tui lên ngủ. Thứ 6 gameshow rồi."]
    ~ nghi(20)
    ~ vu_nuoc(-3)
    dan_dau_tu: Ờ… ngủ đi. Người ngủ sớm hông bao giờ giàu, mà cũng hông bao giờ nghèo. Hay ha.
- -> END
