// ============================================================
// CHÚA TỂ DEADLINE · CHƯƠNG 6: "NHẢY LÀ PHẢI ĐẸP" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== chua_te_deadline_2810_video_linh ===
# ngay:28 # gio:09:20 # noi:phong_dung_phim # bat_buoc
_9 giờ 20. {editor} ngồi giữa phòng dựng, mặt trắng như màn hình lỗi. Đêm qua 2 giờ 10, bản nháp video "16 năm" lên kênh "Cú Đêm Cắt Ghép" ở chế độ công khai. Cuối bản nháp còn sót bốn phút tên "Thai_final_v12": cảnh {quan_ly_idol} ngủ gục trên xe, {quan_ly_idol} cầm hai điện thoại, {quan_ly_idol} đắp áo cho {idol_het_thoi}. Câu cuối: "Em thích anh lâu rồi. Đừng lo, render xong là xong."_
_Sáu phút sau nó biến mất. Khoảng 2.000 lượt xem._
editor: Tui… chọn nhầm "Công khai" thay vì "Riêng tư". Gỡ kịp rồi. Mà 2.000 người đó…
* [🧯 "Hai nghìn người lúc 2 giờ sáng thì 1.900 người đang ngủ gật. Để tui nhờ {hong_hot} dọn mấy cái bản lưu."]
    hong_hot: Dọn rồi! Gỡ được trên page, hông gỡ được trong đầu người ta. Nhưng tui hứa hông nhắc.
    editor: *(ngồi phịch xuống)* Ừ.
    ~ qh("editor", 5)
* [🤝 Ngồi xuống cạnh {editor}. Không nói gì. Đưa ly cà phê.]
    _{editor} uống một ngụm. Rồi cười, kiểu cười của người vừa rơi từ tầng 30 xuống mà còn sống._
    editor: Ít ra ông hông hỏi "ai vậy". Cả công ty hỏi rồi.
    ~ qh("editor", 12)
* [📊 "Video này… lượt tương tác cao gấp 4 lần MV đó ông."]
    editor: Ông nói câu đó lúc này thiệt hả?
    ~ qh("editor", -8)
- _Cùng lúc đó, ở bàn số liệu, {dan_dau_tu} đứng bật dậy: "Bộ lọc của tui lần ra 80 nghìn tài khoản ảo. Tất cả đều comment 'Anh {idol_het_thoi} đỉnh nóc kịch trần'."_
_Cả phòng quay sang {idol_het_thoi}. {idol_het_thoi} đeo kính đen vào. Trong phòng. Lúc 9 giờ 30 sáng._
-> END

// ------------------------------------------------------------
=== chua_te_deadline_2810_moc_4 ===
# ngay:28 # gio:17:00 # noi:phong_giam_doc # bat_buoc
_Mốc 4: 800.000 người theo dõi._
{ nguoi_theo_doi >= 800000 && vu_nuoc_toi_chan < 100 && not nguyen_theo_ll:
    hong_hot: {nguoi_theo_doi}! Mốc 4! Còn đúng một mốc nữa thôi mấy bà ơi!
    giam_doc: Còn 3 ngày. Anh không ép… Anh van các em.
- else:
    ~ vu_moc_truot++
    hong_hot: {nguoi_theo_doi}… Trượt mốc 4. Bên LL đang đăng bài "Siêu sao cần một ngôi nhà lớn hơn".
    _{giam_doc} không nói gì. Lần đầu {giam_doc} không nói gì trong 3 phút liền._
}
_Bạn về chỗ. Lấy cây bút đỏ, khoanh tròn ngày 29/10 trên lịch. Ghi bên cạnh: "Đêm Thần Tốc cuối cùng."_
{ vu_cue_sheet >= 47:
    _À không. Cue sheet xong rồi. Bạn gạch chữ "Đêm Thần Tốc", ghi lại: "Đêm ngủ sớm đầu tiên"._
}
* [😴 Về ngủ sớm để mai còn sức.]
    ~ nghi(30)
* [📱 Lướt Tóp-tóp "lấy cảm hứng" cho Đại Nhạc Hội.]
    ~ vu_gio_luot = vu_gio_luot + 1
    { RANDOM(1, 10) <= 5:
        _Một trend mới: "Ai cũng có một chiếc mũ". Người ta đội mũ len, mũ bảo hiểm, nồi cơm. Bạn ghi lại: cue số 40, khán giả cùng đội mũ._
        ~ follow(15000)
    - else:
        _1 tiếng, 200 video, 0 ý tưởng. Một con mèo đội nồi cơm. Thế thôi._
        ~ vu_nuoc(5)
    }
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2910_wifi_sap ===
# ngay:29 # gio:09:00 # noi:ban_lam_viec # bat_buoc
_Ngày Internet Quốc tế. 9 giờ: wifi sập. Cả công ty. Tất cả máy tính hiện cùng một con khủng long._
_{it} bị cả công ty truy đuổi qua 3 tầng. Sau tủ mạng, một sợi dây bị cắn đứt. Dưới đáy tủ là con gà cao su của {cho}, ai đó giấu từ hôm 4/10. Nghe nói 22 giờ 47 mới có mạng lại._
_Video của {editor} kẹt ở 99%. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua", 14 người chen nhau vào._
_Hôm nay là đêm bạn định làm cue sheet và tải toàn bộ file Đại Nhạc Hội Siêu Nhân lên mạng._
* [☕ Ra quán cà phê Sống Ảo. Đắt, nhưng wifi mạnh.]
    ~ tien_cong(-150000)
    _Ly nước 75 nghìn, gọi 2 ly để ngồi cả ngày. Bàn bên cạnh có {designer} đang mở 2 laptop, thấy bạn thì gập một cái lại._
    ~ vu_nuoc(-10)
    ~ uong(30)
* [🖥️ Ra quán net Gõ Phím. Rẻ, ồn, có máy lạnh.]
    ~ tien_cong(-20000)
    _Máy số 14. Máy số 15 là {thuc_tap_sinh}, đang in sổ giao việc cho cả công ty bằng tay nghề của người từng sống qua 3 lần hệ thống ngân hàng sập ngày quyết toán._
    thuc_tap_sinh: Dạ anh {chua_te_deadline}! Em in giùm anh phiếu chuyển file luôn nha anh, 5 phút là xong ạ!
    ~ qh("thuc_tap_sinh", 5)
    ~ vu_nuoc(-10)
* [✍️ Làm bằng giấy bút. Lần đầu tiên trong đời.]
    _Bạn xin {bac_bao_ve} một xấp giấy A4 và một cây bút bi. Chòi bảo vệ hôm nay thành "tổng đài nhắn tin bằng giấy": ai cần gì thì viết giấy, {bac_bao_ve} chuyển._
    bac_bao_ve: Bác chuyển thư cho người ta mười mấy năm rồi. Thêm vài tờ có sao.
    ~ qh("bac_bao_ve", 5)
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
    ~ vu_cue(5)
- _Bộ đàm kêu rè rè. Giọng {chi_dai}: "Tất cả nghe đây. Không có mạng thì có chị. Ai cần gì, gọi bộ đàm kênh 3."_
-> END

// ------------------------------------------------------------
=== chua_te_deadline_2910_bo_dam ===
# ngay:29 # gio:15:00 # noi:sanh_tang_tret
_15 giờ. Bộ đàm kênh 3 kêu liên tục. Cả công ty phối hợp bằng giấy, bộ đàm và chân chạy._
chi_dai: *(bộ đàm)* {chua_te_deadline}, kênh 3. Tiền thuê sân khấu 80 triệu chị nộp rồi, kịp hạn 17 giờ. Giờ tới em: danh sách cue cần {it} chuẩn bị âm thanh ánh sáng. Em gửi bằng gì?
* [📻 Đọc qua bộ đàm từng cue.]
    _Bạn đọc 20 cue qua bộ đàm, mỗi cue {it} trả lời đúng một chữ: "Rồi." Nhanh hơn email._
    ~ qh("it", 5)
    ~ qh("chi_dai", 3)
    ~ vu_cue(3)
* [🐕 Nhét giấy vào vòng cổ {cho}, nhờ nó chạy lên phòng server.]
    _{cho} chạy lên. 5 phút sau quay về, tờ giấy vẫn trên cổ, có thêm chữ của {it}: "Ok. Mà nó ăn mất cue 12 rồi."_
    ~ qh("cho", 5)
    ~ cang_thang(-5)
* [🙏 "Anh {thuc_tap_sinh} ơi, chạy giùm em tờ này lên tầng 2."]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    thuc_tap_sinh: Dạ em làm liền ạ!
    ~ qh("thuc_tap_sinh", -3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2910_dem_than_toc_cuoi ===
# ngay:29 # gio:22:00 # noi:phong_gac_quan_bida # bat_buoc
_22 giờ. Phòng gác. Dưới nhà, quán bida đóng cửa sớm vì mất mạng nên không ai coi được bóng đá. Yên lặng tới lạ._
_Cue sheet Đại Nhạc Hội Siêu Nhân: {vu_cue_sheet} trên 47. Trên bàn: 2 lon Trâu Cày, 1 ly mì, cây bút highlight hồng._
{ vu_cue_sheet >= 47:
    _Cue sheet đã xong từ lâu. Đêm nay bạn chỉ đọc lại một lượt, sửa 2 lỗi chính tả, rồi tắt đèn lúc 23 giờ. Lần đầu tiên trong đời._
    ~ vu_dem_than_toc_2910 = true
    ~ nghi(40)
    -> END
}
{ vu_nuoc_toi_chan >= 80:
    _Nước tới chân. Không, nước tới cổ. Tay bạn tự động nhanh gấp 3. Chế độ Thần Tốc: bật._
}
* [🌙 Bắt đầu. 47 cue. 7 giờ 59 phải gửi.]
    -> chua_te_deadline_mg_dem_than_toc_mo_dau
* [😶 "Mai làm. Mai là 30, Đại Nhạc Hội là 31 mà."]
    ~ vu_nuoc(30)
    _Bạn đi ngủ. Lần đầu tiên trong đời, bạn nằm mơ thấy một cái deadline có mặt người._
    -> END

// ------------------------------------------------------------
=== chua_te_deadline_3010_don_kho ===
# ngay:30 # gio:10:00 # noi:gam_cau_thang # bat_buoc
_Sáng 30/10. {hr} cho dọn kho trước họp đánh giá. Cái chổi đầu tiên đang tiến về phía gầm cầu thang, nơi {cho} cất kho báu._
{ vu_co_file:
    -> chua_te_deadline_3010_giu_kho
}
_Cái USB không nhãn. Nó vẫn nằm trong đống đồ đó. Đây là cơ hội cuối cùng._ # hen_gio:6
* [🏃 Lao tới trước cái chổi.]
    _Bạn trượt chân trên sàn mới lau, trượt thẳng vào gầm cầu thang, tay chộp được một vật nhỏ. Mùi cà phê sữa đá._
    ~ vu_co_file = true
    ~ vu_lo_file = 0
    ~ nhan(usb_khong_nhan)
    ~ phat_hien(usb_cua_vu)
    hr: Em… em ổn không em?
    _Bạn nằm dưới gầm cầu thang, giơ cái USB lên như giơ cúp vô địch._
* {co(xuc_xich)} [🦴 Đưa xúc xích cho {cho}, xin cái USB.]
    ~ mat(xuc_xich)
    cho: *(nhả USB ra tay bạn)* Gâu.
    ~ vu_co_file = true
    ~ vu_lo_file = 0
    ~ nhan(usb_khong_nhan)
    ~ phat_hien(usb_cua_vu)
    ~ qh("cho", 5)
* [⏱️ (Không chọn kịp)]
    _Chổi quét qua. Bao rác buộc lại. Xe rác tới lúc 11 giờ. Cái USB đi theo xe rác ra bãi Ven Đô._
    ~ vu_usb_ra_bai_rac = true
    ~ vu_lo_file = vu_lo_file + 20
- -> END

= chua_te_deadline_3010_giu_kho
_Bạn đã có file. Bạn chỉ đứng nhìn. {cho} ôm chiếc găng tay hồng, nhìn cái chổi bằng ánh mắt của một ông chủ ngân hàng sắp bị kiểm toán._
* [🛡️ "Anh {hr}, chỗ này để em dọn."]
    hr: Ồ? Em chủ động dọn dẹp à? Anh ghi nhận nha em.
    _Bạn "dọn" bằng cách đứng chắn trước gầm cầu thang 10 phút. Kho của {cho} được giữ nguyên._
    ~ qh("cho", 10)
    ~ qh("hr", 3)
* [😶 Để yên.]
    _Cái chổi quét qua. {cho} ôm được chiếc găng tay hồng chạy thoát. Phần còn lại vào bao rác._
    ~ qh("cho", -5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. {giam_doc}, {truong_phong}, {hr} ngồi một hàng. Trước mặt mỗi người là một tập hồ sơ. Tập của bạn mỏng nhất, hoặc dày nhất, tùy cách nhìn._
truong_phong: Tớ xin trình bày về tác phong làm việc của {chua_te_deadline}. Tháng này cậu ấy đi trễ… *(lật trang)* … nhiều lần.
{ vu_moc_truot <= 1:
    truong_phong: Nhưng. Chiến dịch trượt không quá một mốc. Tớ… phải ghi nhận.
- else:
    truong_phong: Chiến dịch trượt {vu_moc_truot} mốc. Tớ không nói thêm.
}
{ vu_bi_phat_thue:
    ke_toan: *(đứng ở cửa)* Em xin phép bổ sung: biên bản phạt của đoàn thuế, doanh thu 800 triệu tháng 6 không chứng minh được.
    ~ vu_lo_file = vu_lo_file + 20
}
giam_doc: {chua_te_deadline}, em có gì muốn nói không?
* [😇 "Dạ em đi trễ thật. Nhưng em chưa bao giờ để việc chết."]
    ~ uy_tin = uy_tin + 5
    ~ qh("giam_doc", 3)
* [🐢 "Dạ, em chỉ sống theo đúng slogan công ty thôi anh."]
    ~ vu_trich_slogan++
    giam_doc: *(bật cười)* Slogan ấy là anh in nhầm đấy. Nhưng em sống đúng nó thật.
    ~ qh("giam_doc", 2)
* {vu_co_file && vu_lo_file < 100} [💾 "Dạ, và em xin nộp lại file gốc dự án tháng 6. Lần sau em sẽ nhớ chỗ để đồ."]
    { vu_bi_phat_thue:
        giam_doc: Muộn một tuần. Nhưng còn hơn không. Em đưa {ke_toan} nộp bổ sung cho đoàn thuế đi.
    - else:
        giam_doc: File gốc? Nó mất bao giờ?
        _Thì ra {giam_doc} chưa từng biết nó mất. Bạn quyết định không giải thích._
    }
    ~ uy_tin = uy_tin + 5
- { uy_tin >= 60 && vu_moc_truot <= 1 && vu_lo_file < 100:
    ~ vu_duoc_de_bat = true
    giam_doc: Vậy thì. Từ tháng 11, {chua_te_deadline}: Trưởng nhóm Dự án. Tăng lương 20%.
    _{truong_phong} vỗ tay. Bằng hai ngón. Nhưng vỗ._
    ~ qh("truong_phong", 5)
- else:
    giam_doc: Anh ghi nhận. Mình chờ kết quả Đại Nhạc Hội đã.
}
-> END

// ------------------------------------------------------------
=== chua_te_deadline_3010_toi_truoc_dem_hong ===
# ngay:30 # gio:21:00 # noi:phong_gac_quan_bida
_Tối 30/10. Đêm cuối trước Đại Nhạc Hội Siêu Nhân. Cue sheet: {vu_cue_sheet} trên 47._
{ vu_cue_sheet < 47:
    ~ vu_nuoc(20)
    _Nước tới chân. Không. Tới gối. Tới bụng. Bạn ngồi xuống, mở file._
- else:
    _Mọi thứ đã xong. Bạn nằm trên nệm, nghe tiếng bi dưới nhà, thấy lạ vì không có gì để lo._
}
_Trên bàn có một hộp bánh chuối chiên. Không có giấy nhắn. Không cần._
~ vu_qua_hong++
* [💌 Nhắn {sieu_nhan_hong}: "Mai diễn vui nha anh. Xong show em nói chuyện với anh."]
    { vu_tin_bi_khoa:
        _Tin nhắn hiện "Đã gửi". Không hiện "Đã xem"._
    - else:
        sieu_nhan_hong: Ừ. Anh biết em làm phút chót mà. Anh chờ.
        ~ vu_tin(5)
    }
* {vu_cue_sheet < 47} [✍️ Làm nốt cue sheet tới sáng.]
    ~ vu_cue(15)
    ~ nghi(-40)
    { vu_cue_sheet >= 47:
        ~ vu_cue_sheet = 47
        _5 giờ sáng. Cue 47: "Pháo giấy… Go!". Xong. Bạn ngủ gục lên bàn phím._
        ~ vu_nuoc(-30)
    - else:
        _5 giờ sáng. {vu_cue_sheet} trên 47. Mắt không mở nổi nữa._
    }
* [🍌 Ăn bánh, ngủ.]
    ~ an(25)
    ~ nghi(30)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_3110_dung_san_khau ===
# ngay:31 # gio:14:00 # noi:san_khau_dem_hong # bat_buoc
_14 giờ, Sân khấu Đại Nhạc Hội Siêu Nhân. {chi_dai} điều phối dựng sân khấu bằng bộ đàm. {it} treo đèn. {designer} dán backdrop hồng cao 6 mét._
_{thanh_xin_nghi} tới gần bạn, đeo khẩu trang, nói thì thầm._
thanh_xin_nghi: Anh ơi… 19 giờ 50 em xin phép về sớm được hông anh. Bà ngoại em…
_Chung kết "Giọng Ca Ước Mơ" phát trực tiếp lúc 20 giờ. Bạn đã thấy ảnh {thanh_xin_nghi} trên poster của đài từ tuần trước. Bạn không nói gì từ tuần trước._
* [😎 "Ông đi đi. Hát cho hay. Bà ngoại ông chắc sẽ tự hào."]
    thanh_xin_nghi: *(đứng hình)* Anh… biết hả?
    _Bạn gật. {thanh_xin_nghi} ôm bạn một cái rất nhanh rồi chạy đi, bỏ quên cái khẩu trang._
    ~ qh("thanh_xin_nghi", 20)
    ~ phat_hien(son_thi_hat)
* [📋 "Ông đi thì ai cầm lịch cue đội nghệ sĩ?"]
    thanh_xin_nghi: Dạ… em làm sẵn rồi nè anh. *(đưa tờ giấy, chữ đẹp tới bất ngờ)*
    _Lần đầu tiên bạn thấy {thanh_xin_nghi} làm xong việc trước hạn. Hóa ra ai có deadline thật cũng biết làm sớm._
    ~ vu_cue(2)
    ~ qh("thanh_xin_nghi", 5)
* [🙏 "Ở lại giùm tui đi, tối nay tui cần người."]
    thanh_xin_nghi: … Dạ. *(cúi đầu)*
    _Tới 19 giờ 45 {thanh_xin_nghi} vẫn biến mất. Bạn không ngạc nhiên. Bạn chỉ thấy hơi buồn vì đã hỏi câu đó._
    ~ qh("thanh_xin_nghi", -10)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_3110_phong_cho ===
# ngay:31 # gio:18:30 # noi:san_khau_dem_hong # bat_buoc
{ nguyen_theo_ll: -> ben_kia_duong }
_18 giờ 30. Phòng chờ. {sieu_nhan_hong} ngồi một mình, cái mũ đặt trên đùi, đĩa bánh chuối chiên chưa đụng miếng nào._
{ vu_tin_bi_khoa:
    _{sieu_nhan_hong} thấy bạn ở cửa, đội mũ lên liền. "Chào producer!" Giọng chào máy quay._
    -> END
}
sieu_nhan_hong: Ờm… em tới hỏi cue hả?
* {vu_hen_dem_hong || vu_tra_loi_2710 == "hen_31"} [🤝 "Hông. Em tới nói trước: xong show, em ngồi với anh. Lần này hông để phút chót."]
    ~ vu_da_tra_loi_nguyen = true
    ~ vu_tin(5)
    sieu_nhan_hong: *(ngẩng lên)* … Ừ. Anh chờ.
* [🍌 Ngồi xuống, ăn một miếng bánh chuối chiên của anh.]
    ~ an(10)
    ~ vu_tin(5)
    _Hai người ăn bánh, không nói gì. Lúc bạn đứng dậy đi, {sieu_nhan_hong} nói nhỏ: "Cảm ơn em đã làm show cho anh."_
    ~ vu_da_tra_loi_nguyen = true
* [📋 "Dạ, cue 20 giờ anh bước ra từ trái nha. Đừng tạo dáng sớm."]
    sieu_nhan_hong: Dạ… ờm, trái. Ừ. Cue. *(đội mũ lên)*
    ~ vu_tin(-3)
- -> END

= ben_kia_duong
_18 giờ 30. Phòng chờ của {sieu_nhan_hong} trống trơn. Bên kia đường, màn hình LED của LL đang thử hình bộ đồ hồng viền xanh lá chuối._
_Điện thoại bạn rung. {sieu_nhan_hong} nhắn từ tầng thượng tòa nhà kính: "Tối nay em làm show bên đó hả? Anh nhìn qua thấy đèn hồng đẹp ghê."_
* {not vu_tin_bi_khoa} [💌 "Dạ. Xong show anh qua đường ăn chè hông? Quán đầu Hẻm 69 mở tới khuya."]
    ~ vu_da_tra_loi_nguyen = true
    ~ vu_tin(5)
    _Ba chấm hiện lên, rất lâu. "Ừ. Anh qua."_
* [📋 Úp điện thoại. Cue sheet còn một ô trống cần lấp.]
    ~ vu_cue(1)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_3110_canh_ga ===
# ngay:31 # gio:19:15 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 15. Mười lăm phút nữa mở màn. Bạn đeo tai nghe đứng cánh gà, tay cầm cue sheet. Dưới sân khấu, khán giả đội mũ hồng bắt đầu đứng sát rào._
{ vu_cue_sheet >= 47:
    _47 cue. Cue 1: đèn tắt. Cue 2: phim của {bien_kich}. Cue 3: video "16 năm" của {editor}. Lần đầu tiên trong đời, bạn biết chính xác điều gì sẽ xảy ra trong 3 tiếng tới._
- else:
    _Cue sheet có {vu_cue_sheet} dòng. Phần còn lại là… cảm hứng. Và cầu nguyện._
}
{ nguyen_theo_ll:
    _Dòng "20:00 – Siêu Nhân Hồng" giờ là một ô trống. {chi_dai} gạch nó bằng bút đỏ, viết bên cạnh: "Ai lên được thì lên."_
}
it: *(bộ đàm)* Chốt lần cuối. Pháo giấy khi nào?
* {vu_cue_sheet >= 47} [📋 "Cue 47. Chờ câu cuối, tui hô."]
    ~ vu_cue_chuan = true
    ~ chung_tien_do_dem_hong = chung_tien_do_dem_hong + 15
    it: Rồi.
    _Một chữ. Từ {it}, một chữ đó bằng một bài diễn văn._
* [🎯 "Lúc nào thấy đẹp thì tui hô."]
    { RANDOM(1, 10) <= 4:
        ~ chung_tien_do_dem_hong = chung_tien_do_dem_hong + 5
        it: … Rồi. Tui tin cái mắt của ông.
    - else:
        ~ chung_tien_do_dem_hong = chung_tien_do_dem_hong - 10
        ~ vu_nuoc(10)
        it: *(thở dài vào bộ đàm rất lâu)* Rồi.
    }
* [🙏 "Chị {chi_dai} ơi, chị cầm cue giùm em…"]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nuoc(15)
    ~ chung_tien_do_dem_hong = chung_tien_do_dem_hong + 5
    chi_dai: *(bộ đàm)* Đưa đây. Em đứng cạnh chị, học.
- { vu_cue_sheet < 30:
    ~ chung_tien_do_dem_hong = chung_tien_do_dem_hong - 20
}
~ chung_tien_do_dem_hong = gioi_han(chung_tien_do_dem_hong)
_19 giờ 29. Bạn hít một hơi. "Cue 1: đèn tắt… Go."_
-> END
