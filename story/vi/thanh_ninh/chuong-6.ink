// ============================================================
// THÁNH NỊNH: NHI · CHƯƠNG 6: "EMAIL GỬI NHẦM" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_ninh_2810_moc_4 ===
# ngay:28 # gio:09:30 # noi:phong_giam_doc # bat_buoc
_Mốc 4: 800.000 người theo dõi. Con số: {nguoi_theo_doi}._
_Sáng nay fanpage công ty tự dưng đăng một video lạ: một người dựng phim tỏ tình với "anh quản lý", giọng run run. Video của {editor}, xuất nhầm. Đã có 50.000 lượt xem._
giam_doc: Nhi! Cái video này là sao? Gỡ đi! Không… khoan… lượt xem đang lên… Em nói xem anh nên làm gì?
* [😇 "Anh hỏi {editor} trước đi anh. Video của người ta mà."]
    giam_doc: … Ừ. Đúng. Gọi nó lên đây.
    ~ qh("editor", 10)
    _{editor} lên, mặt trắng như tờ giấy. Sếp nói chuyện với cậu ấy 10 phút. Cửa đóng. Khi mở ra, {editor} gật đầu: "Để vậy đi anh."_
    ~ follow(20000)
* [🙇 "Dạ anh giữ đi anh! Lượt xem là vàng, anh có tầm nhìn mà!"]
    ~ tn_ninh(3)
    ~ follow(40000)
    ~ qh("editor", -15)
    _Video ở lại. Lượt xem tăng. {editor} không tới công ty buổi chiều._
* [🗑️ Tự gỡ video bằng tài khoản admin sếp đưa.]
    ~ follow(-5000)
    ~ qh("editor", 5)
    hong_hot: *(nhắn)* Ai gỡ video vậy?? Đang viral mà!
    ~ qh("hong_hot", -5)
- { nguoi_theo_doi < 800000:
    _Chiều đó, LL đăng thêm một bài: "Siêu Nhân Hồng xứng đáng một nơi tốt hơn"._
}
-> END

// ------------------------------------------------------------
=== thanh_ninh_2810_don_nghi_viec ===
# ngay:28 # gio:17:45 # noi:ban_tro_ly
_Hết giờ làm. Bàn trợ lý. Bạn mở một file trắng. Gõ: "ĐƠN XIN NGHỈ VIỆC". Rồi xóa. Rồi gõ lại._
{ tn_nhan_viec_ll:
    _Email từ LL vẫn nằm đó: "Trợ lý Hành chính, thử việc 2 tháng, bắt đầu 2/11". Một công việc thật. Không ai đòi bạn mang theo gì._
}
* {tn_nhan_viec_ll} [📝 Viết đơn đàng hoàng, in ra, ký tên, đặt lên bàn sếp kèm ly trà.]
    ~ tn_don_nghi_viec = true
    _Sáng mai sếp sẽ thấy. Bạn viết đúng ba dòng, không một chữ "tâm"._
    ~ cang_thang(10)
    ~ tn_noi_that_2 = true
* [🙇 Xóa file, viết bài chúc mừng Mốc 4 cho sếp thay vào.]
    ~ tn_ninh(2)
    ~ tn_khen()
* [😶 Lưu file nháp, tắt máy, về.]
    _File "don_nghi_viec_ban_7.docx" nằm trên màn hình nền, cạnh file "loi_khen_sep_thu_2.docx"._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2910_wifi_sap ===
# ngay:29 # gio:09:00 # noi:khu_lam_viec_chung # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. Cả công ty đi tìm {it}. Video của {editor} kẹt ở 99%._
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. {chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua"._
_Bạn mở hộp thư nháp. Thư trả lời LL đã soạn sẵn, chờ có mạng là gửi._
{ tn_tu_choi_ll:
    _Tiêu đề: "Em xin phép từ chối LL ạ"._
- else:
    _Tiêu đề: "Em đồng ý về LL ạ"._
}
bac_bao_ve: *(qua bộ đàm của {chi_dai})* Cháu Nhi. Anh {giam_doc} nhờ bác chuyển giấy: "Nhi lên phòng anh."
* [🙇 Chạy lên ngay, mang theo trà.]
    giam_doc: Không có mạng, anh không biết làm gì. Ngồi đây nói chuyện với anh tí.
    ~ qh("giam_doc", 5)
    _Hai người ngồi nhìn cái router đèn đỏ. Sếp kể chuyện năm 2010, lần này bạn nghe như lần đầu._
* [👇 Gửi {thuc_tap_sinh} lên thay: "Duy lên hỏi sếp cần gì giùm chị."]
    ~ tn_dap_duy()
    _{thuc_tap_sinh} quay xuống: "Dạ sếp nói sếp cần chị ạ, không cần em ạ."_
* [🤝 Xuống chòi bảo vệ phụ Bác {bac_bao_ve} chuyển giấy cho cả công ty.]
    ~ qh("bac_bao_ve", 8)
    ~ tn_gian(-5)
    _Bạn chạy cầu thang 14 lần. Biết thêm ai nhắn gì cho ai. Không đọc một tờ nào._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2910_email_1702 ===
# ngay:29 # gio:17:02 # noi:ban_tro_ly # bat_buoc
_17:02. Wifi vừa có lại. Hộp thư nháp tự gửi._
_Ô người nhận đã tự điền gợi ý: "G-Entertainment - Toàn công ty"._
{ tn_tu_choi_ll:
    _Tiêu đề: "Em xin phép từ chối LL ạ". Nội dung kể rõ bạn đã đi phỏng vấn ngày 25/10._
- else:
    _Tiêu đề: "Em đồng ý về LL ạ"._
}
_Thanh tiến trình chạy. Bạn có 5 giây._ # hen_gio:5
* [🖱️ Bấm "Hoàn tác" thật nhanh.]
    { RANDOM(1, 10) <= 7:
        ~ tn_hoan_tac_thanh_cong = true
        _"Đã hoàn tác." Không ai thấy. Bạn ngồi yên, tay run cả buổi tối._
        -> END
    - else:
        _Bạn bấm hụt. Chữ "Đã gửi" hiện lên. 21 người nhận._
        -> gui_roi
    }
* [🔌 Rút dây mạng.]
    _Email kẹt lại ở 99%, giống video của {editor}._
    _Năm phút sau, {it} xuất hiện ở cửa với một cuộn dây: "Ai rút cổng phòng sếp?"_
    it: *(nhìn màn hình của bạn một giây)* … Ừ.
    { tn_hai_mang:
        ~ tn_bi_lo_hai_mang = true
    }
    ~ qh("it", -3)
    -> END
* [📱 Gọi ngay cho {giam_doc}: "Anh ơi, em có chuyện phải nói trước khi anh đọc email."]
    ~ tn_noi_that_2 = true
    ~ tn_ninh(-20)
    giam_doc: … Ừ. Anh biết em đi phỏng vấn lâu rồi.
    _Im lặng. Tiếng router kêu tít tít._
    giam_doc: Em nói trước với anh. Thế là được.
    -> END
* [⏱️ (Không chọn kịp)]
    -> gui_roi

= gui_roi
_21 người nhận được email. {hong_hot} chụp màn hình trong 0,5 giây. Group Zalo-lô nổ tung._
{ not tn_tu_choi_ll:
    ~ tn_email_gui_nham = true
    ~ tn_ninh(-30)
    ~ tn_xanh(10)
- else:
    ~ tn_ninh(-10)
    _Email kể bạn đã đi phỏng vấn. Và đã từ chối. Cả công ty đọc cả hai._
}
chi_dai: *(qua bộ đàm)* Nhi. Ra sân thượng gặp chị.
* {tn_hoc_nghe_chi_dai} [🔒 Lên sân thượng.]
    chi_dai: Gửi nhầm rồi thì đứng thẳng lên mà chịu. Rồi đi nói với ổng trước khi ổng đọc. Đi liền.
    _Bạn chạy xuống. Sếp chưa mở hộp thư. Bạn kể hết._
    ~ tn_noi_that_2 = true
    ~ tn_email_gui_nham = false
* [😶 Tắt máy, đi cầu thang thoát hiểm về nhà.]
    ~ cang_thang(25)
    _Điện thoại rung 74 lần trên đường về._
* [🙇 Nhắn group: "Mọi người ơi email đó là thử nghiệm hệ thống ạ!"]
    hong_hot: *(gửi ảnh chụp màn hình)* Thử nghiệm hệ thống tên "Em đồng ý về LL ạ" hả bà?
    ~ cang_thang(15)
    ~ tn_gian(10)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_3010_don_kho ===
# ngay:30 # gio:08:00 # noi:gam_cau_thang
_Trước buổi họp đánh giá, {hr} cho dọn kho. Thùng carton xếp đầy hành lang. {thuc_tap_sinh} đang lôi đồ ra từ gầm cầu thang: một chiếc găng tay hồng, một con gà cao su, một cái USB không nhãn._
{ tn_email_gui_nham:
    hr: *(mỉm cười)* Nhi à, em rảnh không, lát lên phòng anh uống trà xíu.
    _Bạn biết câu đó nghĩa là gì. Cả công ty biết._
    ~ cang_thang(20)
}
cho: GRỪ! *(lao tới giành lại kho báu)*
* [🙇 "Anh {hr}, dọn hết đi anh, cho phòng sếp sạch sẽ."]
    ~ qh("cho", -15)
    ~ qh("hr", 3)
    _{cho} nhìn bạn như nhìn một shipper._
* [🤝 "Anh {hr}, để góc này lại. Kho của Tuất. Bác {bac_bao_ve} nói mấy thứ trong đó có người cần."]
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 10)
    hr: *(nhún vai)* Ừ. Anh không ép, tùy em… à, câu của sếp.
    _Cái USB không nhãn nằm lại dưới gầm cầu thang, cạnh con gà cao su._
* [💬 Nhặt cái USB đưa cho {chua_te_deadline}: "Của ông hả? Có mùi cà phê sữa đá."]
    chua_te_deadline: *(mắt mở to)* Trời đất… ÉT O ÉT, nó đây rồi!
    ~ qh("chua_te_deadline", 20)
    ~ phat_hien(usb_cua_vu)
    ~ follow(50000)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_3010_hop_danh_gia ===
# ngay:30 # gio:15:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Sếp đứng đầu bàn, cầm tờ giấy. Hợp đồng {idol_het_thoi} hết hạn mai, chưa ai nói gì. Ghế Phó Giám đốc vẫn trống._
_Thanh "Sếp gọi ai" trên điện thoại bạn: Nhi {tn_sep_goi_nhi}, {ran_doc} {tn_sep_goi_hieu}._
{ tn_sep_goi_nhi > tn_sep_goi_hieu:
    giam_doc: Tháng này người anh muốn cảm ơn đầu tiên là Nhi. Ba năm nay không trễ ngày nào. Và… mấy đêm anh ngồi lại, Nhi đều ở lại.
    _Bạn cúi đầu. Sếp chưa bao giờ nói câu đó. Bạn tưởng sếp chưa bao giờ để ý._
    ~ tn_ninh(10)
- else:
    giam_doc: Tháng này anh muốn khen {ran_doc}. Mới vào mà nhớ hết sinh nhật cả công ty.
    _{ran_doc} cúi đầu cảm ơn. Bạn vỗ tay. Tay bạn vỗ mà không có tiếng._
    ~ tn_ninh(-5)
}
_Sau họp, sếp gọi bạn vào phòng. Cửa đóng. Sếp nhìn ra cửa sổ, phía tòa nhà kính xanh lá chuối ở xa._
giam_doc: Nhi. Mai Đêm Hồng. Nếu không đạt… anh không biết nói với anh Genta thế nào.
* [🙇 "Dạ anh nói chuẩn quá anh ơi, mình chắc chắn đạt mà anh!"]
    ~ tn_khen()
    giam_doc: … Ừ.
    _Sếp không quay lại nhìn bạn._
* [😐 "Anh… anh phải viết thư cho anh Genta. Nói thật hết. Trước khi ảnh nghe từ người khác."]
    ~ tn_khuyen_viet_thu_genta = true
    ~ tn_noi_that_1 = true
    _Sếp quay lại. Nhìn bạn lâu thật lâu._
    giam_doc: Em là người đầu tiên dám nói câu đó với anh.
    giam_doc: Bác {bac_bao_ve} gửi thư cho anh ấy. Anh biết. Anh biết lâu rồi. Anh chỉ… sợ.
    _Tối đó, sếp ngồi viết tay. Lần đầu tiên bạn không phải viết thay sếp._
    ~ qh("giam_doc", 15)
    ~ qh("bac_bao_ve", 10)
* {tn_noi_that_2} [😇 "Anh. Em đã nói thật một lần rồi. Giờ anh nói thật đi: anh cần em ở lại hông?"]
    giam_doc: Anh cần một người nói thật. Nếu em ở lại để làm việc đó thì ở lại.
    ~ qh("giam_doc", 10)
    ~ tn_ninh(5)
* {tn_don_nghi_viec} [📝 "Anh đã đọc đơn của em chưa anh?"]
    giam_doc: Đọc rồi. *(rút từ ngăn kéo ra một tấm thiệp viết tay)* Mai em mang theo.
    _Trên thiệp, nét chữ của sếp: "Đi vui nhé. Anh không ép, tùy em."_
- -> END

// ------------------------------------------------------------
=== thanh_ninh_3110_hoa_trang ===
# ngay:31 # gio:16:00 # noi:san_khau_dem_hong # bat_buoc
_Đêm Hồng Halloween. Sân khấu ở Phường Tân Drama. Sếp hóa trang "Ông Kẹ Ngân Hàng" do {designer} chọn: vest, cà vạt in hình tờ tiền, một xấp giấy báo nợ giả dán quanh người._
_Không ai dám nói với sếp đó là trò đùa. Sếp tưởng là "concept tài chính"._
giam_doc: Nhi, anh nhìn thế nào?
* [🙇 "Dạ anh như ông trùm tài chính quốc tế luôn anh!"]
    ~ tn_khen()
    giam_doc: Haha! Chuẩn!
    designer: *(quay đi, vai rung rung)*
* [😐 "Dạ… anh đọc dòng chữ trên mấy tờ giấy chưa anh?"]
    giam_doc: *(cúi xuống đọc)* "Thông báo quá hạn lần 3"… *(im)* … Thôi kệ. Đêm nay anh mặc thật. Để cho mọi người cười.
    ~ qh("giam_doc", 5)
    ~ qh("designer", 5)
* {tn_hoc_nghe_chi_dai} [🔒 "Anh ơi, em đi phụ chị {chi_dai} dựng hậu trường nha anh. Em học được nhiều lắm."]
    giam_doc: Đi đi. Anh tự cầm ô được.
    _Lần đầu tiên sếp tự cầm ô. Lần đầu tiên bạn cầm bộ đàm._
    ~ uy_tin = uy_tin + 5
- -> END

// ------------------------------------------------------------
=== thanh_ninh_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_19:30. Màn mở đầu: phim ngắn "Người Hùng Không Tên", rồi video "16 năm" của {editor}. Khán đài kín người. Con số trên màn hình lớn: {nguoi_theo_doi}._
{ tn_email_gui_nham:
    _Bạn đứng ở rìa khán đài, đội mũ lưỡi trai thấp. Không ai trong công ty nhìn về phía bạn. Hoặc ai cũng nhìn, mà giả vờ không nhìn._
- else:
    { tn_hai_mang && tn_xanh_la_chuoi >= 80:
        _Bạn đứng ở khán đài phía tây, nơi mọi người mặc áo xanh lá chuối. Đối diện, cả công ty đứng dưới tấm phông bảy màu._
    - else:
        _Bạn đứng cạnh sếp như mọi khi: cầm ô, cầm nước, cầm điện thoại. Nhưng đêm nay, sếp hỏi bạn có lạnh không._
    }
}
* [👏 Vỗ tay khi màn hình chiếu tên từng người trong công ty.]
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [📱 Mở ứng dụng ghi chú "SẾP GỌI AI", nhìn lần cuối.]
    _Nhi {tn_sep_goi_nhi}. {ran_doc} {tn_sep_goi_hieu}. Bạn xóa ghi chú. Không ai thắng cuộc thi này cả._
* [😶 Nhìn lên sân khấu, chờ.]
- -> thanh_ninh_3010_danh_gia
