// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT
// CHƯƠNG 6: "LỊCH TRỐNG" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== truong_phong_2810_moc_4 ===
# ngay:28 # gio:09:00 # noi:phong_san_xuat # bat_buoc
_Mốc 4: 800.000 người theo dõi. Cả phòng nhìn con số trên màn hình {hong_hot} như nhìn bảng điểm thi đại học._
{ nguoi_theo_doi >= 800000:
    hong_hot: QUA RỒI! Qua mốc 4 rồi! Ét o ét, tui khóc đây nè!
    ~ tp_ghe(4)
    ~ tp_ca_phong(3)
- else:
    hong_hot: Còn thiếu… {800000 - nguoi_theo_doi} người. LL đang đăng bài "G-Entertainment hết thời" kìa.
    ~ cang_thang(10)
}
_{dan_dau_tu} đi ngang, kẹp laptop dưới nách, mặt như vừa phát hiện ra coin thật._
dan_dau_tu: Bộ lọc của anh mới lần ra: 80.000 tài khoản fan ảo đều từ một dịch vụ, "Like Thật 100%". Toàn comment "Anh Phát đỉnh nóc kịch trần".
* [🤫 "Anh giữ cái này lại, đừng đăng. Để anh {quan_ly_idol} xử lý."]
    dan_dau_tu: Ờ… số liệu thì anh giữ được. Miệng {hong_hot} thì anh hông giữ được.
    ~ qh("quan_ly_idol", 6)
    ~ qh("idol_het_thoi", 4)
* [📅 "Họp khẩn với phòng Nghệ sĩ chiều nay."]
    ~ tp_hop(1)
    _Cuộc họp có {idol_het_thoi}, kính đen, khoanh tay. Hai tiếng. Không ai nói từ "fan ảo"._
* [📈 "Lọc luôn cho Siêu Nhân Hồng xem mình có bao nhiêu người thật."]
    dan_dau_tu: Đã lọc. 97% thật. Người ta theo dõi thật đó em.
    _Lần đầu trong tháng, bạn thấy con số không chỉ là con số._
    ~ cang_thang(-8)
- -> END

// ------------------------------------------------------------
=== truong_phong_2810_video_lo_tay ===
# ngay:28 # gio:16:20 # noi:phong_dung_phim
_16 giờ 20. Fanpage công ty vừa đăng một video lạ: những đoạn cắt ghép {quan_ly_idol} cầm hai điện thoại, ngủ gật trên xe, cười một mình. Nhạc nền nhẹ. Dòng chữ cuối: "Anh có biết không?"_
_{editor} ngồi trước màn hình, mặt trắng bệch. Đây là video tỏ tình. Và nó vừa lên fanpage 120.000 người._
editor: Em… em bấm nhầm tài khoản. Em… *(không nói tiếp được)*
* [🗑️ "Gỡ ngay. Anh nhận là lỗi của phòng."]
    _Bạn gỡ video. Bạn đăng một dòng: "Video thử nghiệm của phòng Sản xuất, đăng nhầm. Xin lỗi." Ký tên: Nhật._
    ~ qh("editor", 20)
    ~ tp_ghe(-3)
    editor: Anh… nhận lỗi giùm em hả?
    truong_phong: Anh nhận công của em mấy năm. Nhận lỗi một lần cũng được.
* [🎭 "Để đó. Lượt xem đang lên. Mình gọi là 'video tri ân quản lý'."]
    ~ follow(10000)
    ~ qh("editor", -15)
    _Video lên 200.000 lượt xem. {editor} không nói gì cả ngày. Tối đó {editor} không tới phòng dựng._
* [📞 Gọi cho {quan_ly_idol} trước khi ai kịp làm gì.]
    quan_ly_idol: Khoan anh nghe máy… *(im lặng 10 giây)* …Video gì? Anh đang ở LL… à không, đang ở ngoài.
    _{quan_ly_idol} cúp máy. Bạn không biết ai trong hai người đang giấu điều gì to hơn._
    ~ qh("quan_ly_idol", 3)
- -> END

// ------------------------------------------------------------
=== truong_phong_2810_hoc_dem ===
# ngay:28 # gio:23:00 # noi:phong_dung_phim
_23 giờ. Đêm cuối cùng trước khi wifi sập. Bạn ngồi trước máy dựng, bài số {tp_so_bai_hoc_dem + 1}._
{ tp_mo_ca_dem && qh_editor >= 20:
    _{editor} kéo ghế ngồi cạnh. Không ai hẹn. Cả hai đều tới._
    editor: Bài cuối nè anh. Dựng một clip từ đầu tới cuối. Em không chạm vào chuột.
    ~ tp_tn(10)
}
* [🛠️ Làm hết bài.]
    -> truong_phong_mg_hoc_lom
* [😴 Ngủ gục trên bàn phím.]
    ~ nghi(5)
    _Sáng hôm sau, mặt bạn in hình chữ J, K, L. Giống {editor} hồi tháng trước. Bạn thấy mình vừa được kết nạp vào một hội kín._
- -> END

// ------------------------------------------------------------
=== truong_phong_2910_lich_trong ===
# ngay:29 # gio:07:30 # noi:phong_hop_sang_tao # bat_buoc
_Ngày Internet Quốc tế. 7 giờ 30, wifi sập. Không họp online. Không gửi file. Không ai mở được lịch._
_Bạn mở laptop. Ứng dụng lịch hiện một vòng tròn quay mãi. Rồi một ô trắng._
_Lần đầu tiên sau 6 năm đi làm, lịch của bạn trống._
~ tp_lich_trong = true
* [🚶 Đi từng bàn hỏi xem mọi người cần gì.]
    -> truong_phong_2910_di_tung_ban
* [🧱 Ngồi một mình nhìn bảng trắng.]
    _Bảng trắng trắng tinh. Bạn cầm bút lên. Bạn đặt bút xuống. Ba lần._
    _Bạn nhận ra mình không biết vẽ gì khi không có ai để nghe._
    ~ cang_thang(10)
    ~ tp_lich_trong = false
    ~ tp_hop(1)
    _Cuối cùng bạn viết: "Họp với chính mình: 5 phút." Họp tới trưa._
* [📝 Viết tay một tờ lịch họp, nhờ chòi bảo vệ chuyển giấy cho cả phòng.]
    ~ tp_hop(2)
    ~ tp_lich_trong = false
    bac_bao_ve: *(nhận tờ giấy)* Hôm nay chòi bác thành tổng đài rồi. Cháu là người thứ 14 gửi giấy.
    _Tờ lịch họp được chuyền tay khắp tòa nhà. Tới tay {chua_te_deadline} thì nó thành máy bay giấy._
- -> END

// ------------------------------------------------------------
=== truong_phong_2910_di_tung_ban ===
# ngay:29 # gio:08:30 # noi:phong_san_xuat
_Bạn đi từng bàn. Không cầm sổ. Không cầm bút._
designer: Em cần… một ngày không ai sửa gì hết.
truong_phong: Hôm nay không có wifi. Không ai gửi feedback được.
designer: *(mở to mắt)* Trời ơi. Hôm nay là ngày đẹp nhất đời em.
~ qh("designer", 8)
bien_kich: Em cần một người đọc thử đoạn kết. Thật lòng.
* [📖 Ngồi đọc đoạn kết của {bien_kich}.]
    _Bạn đọc. Có một nhân vật trưởng phòng cứ họp mãi. Ở trang cuối, người đó ngồi một mình nhìn bảng trắng._
    truong_phong: …Đoạn này hay. Buồn, nhưng hay.
    bien_kich: Anh không giận hả?
    truong_phong: Anh không biết là ai mà giận.
    ~ qh("bien_kich", 12)
* [⏩ "Để mai nhé, hôm nay anh còn đi mấy bàn nữa."]
    ~ qh("bien_kich", -3)
- _Bàn {thuc_tap_sinh}: đang chia 5 cục sạc dự phòng cho cả tầng. Bàn {chua_te_deadline}: không có Tóp-tóp, đang… làm việc. Thật._
chua_te_deadline: Anh Nhật đừng nhìn. Nhìn là tui mất cảm hứng.
_Bạn đi một vòng. Không ai cần một cuộc họp. Ai cũng cần một thứ nhỏ hơn và khó hơn: được để yên, được đọc giúp, được tin._
~ tp_ca_phong(6)
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== truong_phong_2910_may_dung_offline ===
# ngay:29 # gio:14:00 # noi:phong_dung_phim # bat_buoc
_14 giờ. Video "16 năm" của {editor} kẹt ở 99% vì không có mạng để tải nhạc bản quyền. {editor} đi tìm {it} bằng cầu thang bộ._
_Cửa phòng dựng bật mở. {giam_doc}, {thanh_ninh} và nửa phòng Truyền thông bước vào._
giam_doc: Nhật! Lĩnh đâu? Thôi, em cũng được. Em mở cho anh xem bản dựng Đêm Hồng. Em làm thế nào, em chỉ anh xem.
_Con trỏ nhấp nháy. Mười giây. Cả phòng nhìn bạn._
{ tp_tay_nghe >= 50:
    -> lam_duoc
- else:
    -> khong_lam_duoc
}

= lam_duoc
* [🛠️ Mở timeline, bấm phím cách, giải thích từng đoạn.]
    _Bạn bấm phím cách. Video chạy. Bạn dừng, cắt, chỉnh màu hồng ra hồng. Tay bạn không run._
    giam_doc: Ơ… em làm được thật à?
    truong_phong: Em học hai tháng ạ. Thầy em là Lĩnh.
    ~ tp_lo(-25)
    ~ tp_ghe(8)
    ~ tp_ghi_cong()
    ~ tp_huy_hieu_tu_render = true
    thanh_ninh: Anh Nhật đỉnh quá anh ơi! À em nói anh Thắng chọn người chuẩn quá anh ơi!
* [🙏 "Em làm được phần cơ bản. Phần đẹp là Lĩnh. Đợi Lĩnh về anh xem bản chuẩn."]
    ~ tp_lo(-15)
    ~ tp_ghi_cong()
    ~ qh("editor", 8)
    giam_doc: Ừ. Anh thích người biết mình biết gì.
    ~ tp_ghe(3)
- -> END

= khong_lam_duoc
* [😰 Thử bấm lung tung.]
    _Bạn bấm Ctrl+Z. Bấm Delete. Cả timeline biến mất. Hai mươi giây. Ba mươi giây._
    thuc_tap_sinh: *(rụt rè từ cuối phòng)* Dạ… bấm phím cách là nó chạy ạ.
    ~ tp_lo(40)
    ~ tp_ghe(-10)
* [🙏 "Anh ạ, em không biết dựng. Mọi video đều là Lĩnh làm."]
    _Cả phòng im phăng phắc. {giam_doc} nhìn bạn rất lâu._
    giam_doc: Anh biết từ lâu rồi, Nhật. Anh chỉ đợi xem em có nói không.
    ~ tp_lo(20)
    ~ tp_ghi_cong()
    ~ tp_ghe(-3)
    ~ tp_ca_phong(10)
* [📅 "Mình họp nhanh 5 phút, đợi Lĩnh về rồi trình bày ạ."]
    ~ tp_hop(1)
    giam_doc: Họp? Anh hỏi em bấm nút nào cơ mà.
    ~ tp_lo(20)
    ~ tp_ghe(-5)
- { tp_do_lo >= 100:
    -> truong_phong_tudo_lo_bai
}
-> END

// ------------------------------------------------------------
=== truong_phong_2910_toi ===
# ngay:29 # gio:19:00 # noi:hanh_lang_tang_2
_Tối. Wifi vẫn sập. Chòi bảo vệ thành tổng đài giấy. {chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua"._
_Thang máy kẹt. {con_ong_chau_cha} lao lên cầu thang bộ, ôm một cái ổ cứng, thở hổn hển. Lần đầu bạn thấy cháu sếp chạy._
con_ong_chau_cha: Né ra ông Nhật! Bản thu cuối! Phải tới phòng Lĩnh trước 8 giờ!
* [🏃 Chạy theo, cầm giúp dây cáp.]
    ~ qh("con_ong_chau_cha", 8)
    ~ nghi(-10)
    _Hai người chạy lên tầng 2, một người ôm ổ cứng, một người ôm cuộn dây. Như hai đứa sinh viên trễ nộp đồ án._
    { tp_mo_phong_thu:
        con_ong_chau_cha: *(thở dốc)* Bản 42… có thêm một câu… tui viết sau bữa ông lên phòng thu.
        ~ qh("con_ong_chau_cha", 5)
    }
* [📝 Ghi giấy nhắn gửi {editor}: "Ưu tiên file của Long."]
    bac_bao_ve: *(bộ đàm rè rè)* Giấy của Nhật gửi Lĩnh. Đã chuyển.
    ~ qh("con_ong_chau_cha", 5)
    ~ qh("editor", 3)
* [😶 Nép sang một bên.]
    _{con_ong_chau_cha} chạy qua như một cơn gió. Bạn đứng đó, nhìn theo, nhớ tới mình năm 22 tuổi mang vali tới đây._
- -> END

// ------------------------------------------------------------
=== truong_phong_3010_don_kho ===
# ngay:30 # gio:07:45 # noi:gam_cau_thang
_Sáng 30/10. Trước giờ họp đánh giá, {hr} cho dọn kho. Gầm cầu thang là kho đồ của {cho}: chìa khóa, son môi, một chiếc găng tay hồng, một cái USB không nhãn._
hr: Anh Nhật, phòng anh dọn giúp gầm cầu thang nha. Dọn sạch cho hành trình mới.
cho: Grừ… *(nằm chắn trước đống đồ)*
* [🐕 "Kho này để nguyên. Đây là… tài sản của nhân viên đặc biệt."]
    hr: *(cười)* Mình cùng nhìn lại khái niệm "nhân viên" nha anh.
    truong_phong: Có tên trong sơ đồ tổ chức của anh. Ô vuông nhỏ dưới gốc.
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 5)
    ~ qh("hr", -3)
* [📦 Dọn, nhưng nhặt riêng cái USB và chiếc găng tay ra.]
    _Bạn nhìn chiếc USB không nhãn. Có mùi cà phê sữa đá. Bạn nhớ tới file gốc tháng 6._
    { tp_vu_giu_bi_mat || qh_chua_te_deadline >= 20:
        _Bạn mang nó tới bàn {chua_te_deadline}, đặt xuống, không nói gì. {chua_te_deadline} nhìn nó như nhìn người yêu cũ quay về._
        ~ qh("chua_te_deadline", 15)
        ~ phat_hien(usb_cua_vu)
    - else:
        _Bạn cất nó vào ngăn kéo, định hỏi sau. "Take note lại."_
        ~ tp_so_lan_take_note = tp_so_lan_take_note + 1
    }
    ~ qh("cho", -5)
* [📅 "Dọn kho cũng cần một cuộc họp phân công."]
    ~ tp_hop(1)
    _Trong lúc mọi người họp, {cho} tha từng món đồ đi giấu sang chỗ mới. Kho sạch. Cũng không còn gì để dọn._
- -> END

// ------------------------------------------------------------
=== truong_phong_3010_hop_danh_gia ===
# ngay:30 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Thắng ngồi đầu bàn. Bạn đứng lên đọc "Thành tích Phòng Sản xuất"._
~ tp_hop(1)
_Trên slide: MV, gameshow, 6 poster, video Tóp-tóp, phim ngắn. Cột "Người thực hiện" vẫn đang trống. Bạn chưa điền._
* [🙏 Điền đủ tên: Lĩnh, Quỳnh, Oánh, Vũ, Duy. Không có tên mình.]
    ~ tp_ghi_cong()
    ~ tp_ca_phong(10)
    ~ tp_lo(-15)
    ~ tp_ghe(-3)
    giam_doc: Thế còn em làm gì, Nhật?
    { tp_tay_nghe >= 50:
        truong_phong: Em học dựng phim. Và em họp ít đi ạ.
    - else:
        truong_phong: Em… cho mọi người làm việc ạ.
    }
    _Ở cuối bàn, {editor} gật đầu một cái. {designer} lén lau mắt._
* [🎭 Điền "Phòng Sản xuất – chỉ đạo: Nhật".]
    ~ tp_nhan_cong()
    ~ tp_ghe(5)
    designer: *(giơ tay)* Dạ… 6 poster đó là em làm ạ.
    ~ tp_lo(5)
    ~ qh("designer", -8)
* [📊 Trình chiếu sơ đồ 4 tầng từ ngày 2/10, giờ đã kín chữ.]
    ~ tp_ghe(3)
    _Sơ đồ tháng trước chỉ có chữ. Giờ mỗi ô có thêm một cái tên. Thắng nhìn lâu nhất vào ô "Âm nhạc"._
- { tp_do_lo >= 100:
    -> truong_phong_tudo_lo_bai
}
-> truong_phong_3010_cong_bo

// ------------------------------------------------------------
=== truong_phong_3010_cong_bo ===
# ngay:30 # gio:10:30 # noi:phong_hop_tang_2 # bat_buoc
{ tp_ghe_pho >= 70 && tp_do_lo < 50 && tp_mv_dung_han && tp_gameshow_xong && nguoi_theo_doi >= 500000:
    -> chon_nhat
- else:
    -> chon_long
}

= chon_nhat
giam_doc: Ghế Phó Giám đốc. Anh đề xuất… Nhật. Em có ý kiến gì không? Anh không ép, tùy em.
_Cả phòng quay lại nhìn bạn. Rồi nhìn {con_ong_chau_cha}. {con_ong_chau_cha} đang mỉm cười._
* [🪑 "Em cảm ơn anh. Em nhận ạ."]
    ~ tp_pho_giam_doc = "tp"
    _Tiếng vỗ tay. Bạn ngồi xuống. Mười bốn bản nháp, một tháng họp. Giờ thì xong._
* {tp_mo_phong_thu && qh_con_ong_chau_cha >= 60} [🔒 "Em đề cử thêm Long. Long lo âm nhạc, em lo sản xuất."]
    ~ tp_de_cu_long = true
    -> long_tra_loi
- -> END

= chon_long
giam_doc: Ghế Phó Giám đốc. Anh đề xuất… Long. Cháu… à, em có ý kiến gì không? Anh không ép, tùy em.
_Bạn đặt bút xuống. Cả phòng nín thở. {con_ong_chau_cha} nhìn chú, rồi nhìn sang bạn._
* {tp_mo_phong_thu && qh_con_ong_chau_cha >= 60} [🔒 "Em đồng ý đề cử Long. Long có một bài hát mà cả công ty nên nghe."]
    ~ tp_de_cu_long = true
    -> long_tra_loi
* [🪑 "Em phản đối. Long đi trễ cả tháng."]
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
    ~ tp_ghe(-5)
    giam_doc: Nhật. Không phải hôm nay.
    -> long_nhan_hay_khong
* [😶 Im lặng.]
    -> long_nhan_hay_khong

= long_tra_loi
{ tp_giup_long_trinh_bay && qh_con_ong_chau_cha >= 60:
    con_ong_chau_cha: Cháu cảm ơn. Nhưng cháu đề cử ông Nhật. Ổng làm việc thật. Cháu chỉ xin lo phần âm nhạc.
    ~ tp_long_de_cu_tp = true
    _Hai lá đơn đề cử nằm trên bàn, chỉ vào nhau như hai mũi tên trên sơ đồ của bạn._
    giam_doc: *(gãi đầu)* Thế thì… hai đứa cùng làm. Anh không ép, tùy các em.
    ~ tp_pho_giam_doc = "ca_hai"
- else:
    con_ong_chau_cha: Cháu hông nhận đâu. Cháu chỉ muốn làm nhạc. Ông Nhật xứng đáng hơn.
    giam_doc: …Thế thì Nhật.
    ~ tp_pho_giam_doc = "tp"
}
-> END

= long_nhan_hay_khong
{ tp_biet_long_khong_muon_ghe:
    con_ong_chau_cha: Cháu hông nhận. Cháu muốn làm nhạc.
    giam_doc: *(thở dài)* Thế thì ghế này… để trống tới tháng sau.
    ~ tp_pho_giam_doc = "trong"
- else:
    _{con_ong_chau_cha} mở miệng định nói gì đó. {giam_doc} vỗ vai: "Anh không ép." {con_ong_chau_cha} im lặng gật đầu._
    ~ tp_pho_giam_doc = "long"
    _Bạn không thấy {con_ong_chau_cha} nhìn hộp đàn ở góc phòng. Bạn chỉ thấy cái ghế bay mất._
}
-> END

// ------------------------------------------------------------
=== truong_phong_3110_hoa_trang ===
# ngay:31 # gio:16:00 # noi:san_khau_dem_hong # bat_buoc
_Đêm Hồng Halloween. Sân khấu Đêm Hồng, Phường Tân Drama. Cả công ty hóa trang. {giam_doc} là "Ông Kẹ Ngân Hàng". Bạn là… cuốn lịch để bàn._
_Mỗi trang lịch trên người bạn là một ngày tháng 10. Trang 29 trống trơn._
hong_hot: Anh Nhật hóa trang gì vậy? Cuốn sổ nợ hả?
truong_phong: Lịch.
hong_hot: Ối dồi ôi, đúng là hóa trang thành chính mình!
* [📅 "Mọi người vào vị trí. Họp nhanh 5 phút cuối cùng."]
    ~ tp_hop(1)
    { tp_hop_hom_nay <= 1:
        _Bạn nhìn đồng hồ. Đúng 5 phút. Mọi người tản ra. Không ai phàn nàn._
        ~ tp_hop_5_phut_that = true
    }
* [🎧 "Không họp. Ai lo việc nấy. Tai nghe đạo diễn bật từ giờ."]
    ~ tp_ca_phong(5)
    _Không có cuộc họp nào. Chỉ có một chương trình phải chạy từ đầu tới cuối._
* [🤝 Đi một vòng hỏi từng người "Cần gì không?"]
    it: Cần một cái ổ cắm. Và một lời hứa không ai đụng vô bàn âm thanh.
    chi_dai: Cần em đứng im một chỗ để chị biết đạo diễn ở đâu.
    ~ qh("it", 5)
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== truong_phong_3110_canh_ga ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 30. Bạn đeo tai nghe đạo diễn ở cánh gà. Màn mở đầu: phim ngắn "Người Hùng Không Tên". Tiếp theo: video "16 năm" của {editor}._
{ qh_it >= 10 && qh_chi_dai >= 10:
    _Âm thanh chuẩn. Ánh sáng chuẩn. {it} giơ ngón cái. {chi_dai} điều phối như một vị tướng._
    ~ tp_dao_dien_dem_hong_ok = true
- else:
    _Micro của {sieu_nhan_hong} rè rè. Đèn sân khấu tắt một nhịp. Bộ đàm của {chi_dai} toàn tiếng gió._
}
_Ở bàn điều phối, {thanh_xin_nghi} lén nhìn đồng hồ: 20:00 là chung kết "Giọng Ca Ước Mơ" ở Đài Tivi Hóng._ # hen_gio:6
* [🎤 "Sơn. Đi đi. Phần của em anh lo."]
    ~ qh("thanh_xin_nghi", 20)
    thanh_xin_nghi: Anh… anh biết hả?
    truong_phong: Ai cũng cần một sân khấu.
    ~ cang_thang(5)
* [📋 "Sơn, em ở lại. Đêm nay cần đủ người."]
    ~ qh("thanh_xin_nghi", -15)
    _{thanh_xin_nghi} ngồi xuống, mắt dán vào điện thoại, nơi một chương trình khác đang gọi tên mình._
* [⏱️ (Không chọn kịp)]
    _Bạn quay lại thì ghế của {thanh_xin_nghi} đã trống. Trên ghế có tờ giấy: "Em xin phép… bà ngoại…"_
- { tp_giup_long_trinh_bay:
    _Tới tiết mục chính. Nhạc dạo của "Hồng Là Thái Độ" vang lên. {sieu_nhan_hong} cầm micro. Bạn nhìn sang cánh gà bên kia: {con_ong_chau_cha} đang nắm chặt rèm, giống hệt {idol_het_thoi} hôm gameshow._
    ~ follow(100000)
}
{ tp_dao_dien_dem_hong_ok:
    ~ follow(100000)
    _Cả khán đài hát theo điệp khúc. Bạn đứng trong cánh gà, tay cầm tai nghe, không nói một lời nào suốt 4 phút. Chương trình tự chạy. Đó là điều tuyệt vời nhất một đạo diễn có thể làm._
- else:
    ~ follow(40000)
    _Chương trình chạy, khập khiễng mà vẫn chạy. Mỗi lần sự cố, bạn bấm bộ đàm: "Tiếp đi." Không ai đề nghị họp._
}
-> END

// ------------------------------------------------------------
=== truong_phong_3110_sau_dem_hong ===
# ngay:31 # gio:22:30 # noi:san_khau_dem_hong # bat_buoc
_22 giờ 30. Đèn sân khấu tắt dần. Pháo giấy hồng nằm đầy dưới chân. Cả công ty ngồi bệt xuống sàn sân khấu._
_Bạn tháo bộ hóa trang cuốn lịch. Từng trang rơi xuống: 1/10, 2/10… 29/10 trống trơn, 30/10, 31/10._
* [📝 Nhặt trang 29/10 lên, cất vào túi áo.]
    _Ngày duy nhất trong tháng bạn không họp. Có lẽ là ngày bạn làm được nhiều nhất._
    ~ cang_thang(-10)
* [🤝 Ngồi xuống cạnh cả phòng Sản xuất.]
    ~ tp_ca_phong(5)
    thuc_tap_sinh: Dạ… anh Nhật ơi, mai mình có họp không ạ?
    truong_phong: Mai Chủ nhật, Duy ạ.
* [📱 Mở điện thoại xem số người theo dõi.]
    _{nguoi_theo_doi} người. Bạn tắt màn hình. Hôm nay bạn không muốn đếm gì nữa._
- -> truong_phong_3010_danh_gia
