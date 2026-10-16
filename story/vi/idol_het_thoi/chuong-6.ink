// ============================================================
// IDOL HẾT THỜI · CHƯƠNG 6: "CÔNG VIÊN NĂM ẤY" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== idol_het_thoi_2810_loi_de_nghi ===
# ngay:28 # gio:10:30 # noi:phong_cho # bat_buoc
{ nguoi_theo_doi < 800000:
    _Mốc 4: 800.000 người theo dõi. Không đạt. Hành lang có mùi nước hoa xanh lá chuối. LL đã có cớ._
- else:
    _Mốc 4: 800.000 người theo dõi. Đạt. Cả tầng 1 ăn mừng bằng mì ly, vì quỹ trà sữa đã hết._
}
{ qh_sieu_nhan_hong >= 30:
    -> moi_song_ca
- else:
    -> khong_moi
}

= moi_song_ca
_Phòng chờ. {sieu_nhan_hong} ngồi một mình, đã tháo mũ. Lần đầu tiên bạn thấy mặt thật: một anh chàng bình thường, mắt hơi sưng, tóc bết mồ hôi._
sieu_nhan_hong: *(giọng nhỏ, rụt rè)* Dạ… anh {idol_het_thoi}… em muốn hỏi… Đại Nhạc Hội anh hát chung với em bài "Công Viên" được hông? Em hát dở lắm. Mà em thích bài đó thiệt.
* [😎 "Anh hát chính, em đứng bè."]
    sieu_nhan_hong: Dạ! Dạ được! Em đứng bè!
    ~ phat_song_ca = true
    ~ phat_tt(10)
    ~ qh("sieu_nhan_hong", 5)
    quan_ly_idol: *(đứng ở cửa từ lúc nào)* {idol_het_thoi}… Đại Nhạc Hội là show của Nguyên mà em…
* [🎶 "Hát chung. Mỗi người một nửa. Mà em phải nhớ là CHUỐI chiên."]
    sieu_nhan_hong: *(bật cười, dụi mắt)* Chuối chiên! Em nhớ rồi! Em viết lên tay luôn!
    _Nguyên lấy bút bi viết lên mu bàn tay trái, ngay cạnh vết sẹo nhỏ: "CHUỐI"._
    ~ phat_song_ca = true
    ~ phat_sua_loi_nguyen = phat_sua_loi_nguyen + 1
    ~ qh("sieu_nhan_hong", 25)
    ~ phat_tt(-10)
    _Giờ chỉ cần một người làm bản remix "Công Viên Hồng"._
* [😤 "Em có tiền, em có fan, giờ em lấy luôn bài của anh hả?"]
    _Nguyên đội mũ lại. Đứng dậy. Đi ra. Không nói gì._
    ~ qh("sieu_nhan_hong", -30)
    ~ follow(-10000)
    ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
    ~ phat_tt(10)
    _Chiều đó Nguyên hủy một buổi quay. Lần đầu tiên không phải vì đi giúp ai._
- -> END

= khong_moi
_Phòng chờ hé cửa. {sieu_nhan_hong} đang tập "Công Viên" một mình, không nhạc. Hát sai đúng câu đó: "…thích ăn khoai chiên…" Rồi tự gõ đầu mình._
_Nguyên không thấy bạn. Hoặc thấy, mà không dám mời._
* {phat_tinh_tuong <= 60} [🎤 Gõ cửa: "Lấy hơi ở bụng. Đừng ở cổ. Và là CHUỐI."]
    sieu_nhan_hong: *(giật mình)* Dạ… dạ! Anh dạy em thêm được hông?
    _Bạn dạy 30 phút. Nguyên hát đúng được 2 lần trong 10 lần. Vậy là tiến bộ._
    ~ phat_day_nguyen = true
    ~ phat_sua_loi_nguyen = phat_sua_loi_nguyen + 1
    ~ qh("sieu_nhan_hong", 15)
    ~ follow(15000)
    ~ phat_tt(-5)
* [🕶️ Đi ngang qua, cười khẩy cho đủ nghe.]
    _Tiếng hát trong phòng chờ tắt ngay._
    ~ qh("sieu_nhan_hong", -10)
    ~ phat_tt(5)
* [😶 Đóng cửa giùm cho Nguyên tập.]
    ~ qh("sieu_nhan_hong", 3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2810_bo_loc ===
# ngay:28 # gio:15:30 # noi:ban_so_lieu
_Bàn số liệu của {dan_dau_tu}. Hai màn hình: bên trái là bảng lượt theo dõi, bên phải là chart coin đỏ lòm._
dan_dau_tu: {idol_het_thoi}. Lại đây. Tui lọc tài khoản ảo trước khi nền tảng kiểm tra. Có một cụm 80.000 cái, avatar hoa sen. Dẫn về… ông.
{ phat_fan_ao == 0:
    dan_dau_tu: Mà gói đã hủy rồi ha. Cụm này đang chết dần. Tui xóa luôn cho sạch, khỏi ai biết.
    ~ qh("dan_dau_tu", 5)
    _Bạn thở ra. Cái gì đã hủy thì ít ra cũng không cắn lại._
    -> END
}
* [🙏 "Anh giấu giùm em. Đừng nói ai."]
    dan_dau_tu: Giấu thì được. Mà nền tảng phát hiện thì cả chiến dịch bị phạt, ông biết hông?
    ~ qh("dan_dau_tu", 3)
    ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
    ~ follow(-20000)
    ~ phat_tt(5)
* [🤖 "Xóa hết đi anh. Em hủy gói luôn bây giờ."]
    _Bạn mở app, bấm "Hủy gói". Lần này không do dự. 80.000 hoa sen héo trong một giây._
    ~ phat_huy_fan_ao = true
    ~ phat_fan_ao = 0
    ~ phat_tt(-15)
    ~ qh("dan_dau_tu", 10)
    ~ follow(5000)
* [💸 "Em trả anh 2 triệu, anh xóa êm."]
    dan_dau_tu: *(nhìn tiền, nhìn chart coin, nhìn tiền)* …Không. Lần này tui làm số liệu thật. Ông tự xóa đi.
    _Lần đầu tiên {dan_dau_tu} từ chối tiền. Bạn không biết nên vui hay buồn._
    ~ qh("dan_dau_tu", 5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2810_tim_remix ===
# ngay:28 # gio:20:00 # noi:studio
{ not phat_song_ca:
    _Studio tầng 2. Bạn ngồi một mình, ôm đàn, chơi "Công Viên" bản gốc. Không ai làm remix cho một bài không ai định hát._
    ~ cang_thang(5)
    -> END
}
_Studio tầng 2. Còn 3 ngày. Bạn cần một bản remix "Công Viên Hồng". Bản gốc năm 2015 mất từ lâu, chỉ còn bản MP3 nén tệ._
* {qh_con_ong_chau_cha >= 20 or biet(bai_hat_long)} [🎹 Gọi {con_ong_chau_cha}: "Em làm remix giùm anh."]
    con_ong_chau_cha: Em đang làm rồi anh. Từ hôm karaoke. Em chỉ chờ anh hỏi.
    _Gửi qua một file: "CongVienHong_v7_final_final.wav". Nghe xong, bạn ngồi im hai phút._
    ~ phat_nguoi_remix = "long"
    ~ qh("con_ong_chau_cha", 10)
* {qh_editor >= 20} [🦉 Nhắn {editor} lúc nửa đêm. Giờ đó {editor} tỉnh nhất.]
    editor: Dạ được anh. Em dựng âm thanh cũng được. Render xong là xong.
    editor: *(một lúc sau)* Anh {idol_het_thoi}… anh {quan_ly_idol} biết anh làm vụ này chưa? Ảnh mà biết chắc vui lắm.
    ~ phat_nguoi_remix = "linh"
    ~ qh("editor", 10)
* {qh_it >= 20} [💾 Hỏi {it}: "Còn bản thu gốc hông em?"]
    it: *(im lặng, rồi gõ phím)* Có. Ổ cứng "KHÔNG ĐƯỢC MỞ". Bản thu gốc chưa mix, 2015.
    it: Giọng anh năm 19 tuổi. Mộc. Không chỉnh. Lấy hông?
    _Bạn nghe lại giọng mình năm 19 tuổi. Rồi quay mặt đi chỗ khác._
    ~ phat_nguoi_remix = "bao"
    ~ qh("it", 10)
* [🎸 Tự làm bằng app điện thoại.]
    _Ba tiếng sau, bản remix nghe như nhạc chờ tổng đài. Bạn xóa._
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2910_wifi_sap ===
# ngay:29 # gio:09:30 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. Cả công ty đuổi theo {it}. Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. {chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua"._
_Bạn mở trang cá nhân. Không có mạng thì 80.000 hoa sen cũng im. Không like, không comment. Lần đầu tiên trong ba năm, trang của bạn im lặng như thật._
_Ở phòng dựng, {editor} ngồi nhìn một thanh tải lên kẹt ở 99%, mặt như đang cầu nguyện cho mạng đừng bao giờ có lại._
* [✉️ Viết một tờ giấy gửi qua chòi bảo vệ: "Anh {quan_ly_idol} ăn trưa chưa?"]
    _Mười phút sau, tờ giấy quay về, chữ anh {quan_ly_idol}: "Chưa. Em mua gì anh ăn nấy." Kèm hình vẽ một xiên cá viên chiên, vẽ xấu._
    bac_bao_ve: *(đưa giấy)* Bác chuyển thư cả đời rồi. Thư này dễ thương nhất hôm nay đấy.
    ~ qh("quan_ly_idol", 8)
    ~ qh("bac_bao_ve", 3)
* [💬 Ngồi xuống cạnh {editor}: "Cái gì 99% vậy em?"]
    editor: *(che màn hình)* Dạ… cái video… lỡ bấm xuất. Em đang cầu cho nó kẹt luôn.
    idol_het_thoi: Video gì mà cầu cho kẹt?
    editor: Video… cho một người. Mà người đó nhìn người khác, anh ạ.
    _{editor} nói "người khác" rồi nhìn bạn một giây. Bạn không hiểu ánh mắt đó. Chưa hiểu._
    ~ qh("editor", 8)
* [🕶️ Đi dọc tầng 1 hỏi: "Ai có 4G cho anh đăng bài?"]
    hong_hot: Mật khẩu "nghegichua". Mà anh đăng gì? Đăng ảnh kính đen nữa hả?
    _Bạn nhìn màn hình rất lâu. Rồi cất điện thoại. Không có gì để đăng._
    ~ phat_tt(-3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2910_cong_vien ===
# ngay:29 # gio:16:00 # noi:cong_vien_ho_ca_map # bat_buoc
_Công viên Hồ Cá Mập. Hồ không có cá mập. Bạn ôm đàn, ngồi ghế đá. Không kính đen. Không ai quay. Không có mạng để đăng._
_Bạn hát "Công Viên". Bài hát về một cái công viên, hát ở một cái công viên. Mười một năm mới làm chuyện hiển nhiên vậy._
_Có 7 người dừng lại. Một chú chạy bộ. Hai bà cụ tập dưỡng sinh. Một cô bán vé số. Một chị mặc áo dài có bảng tên "Tiệc cưới Hạnh Phúc". Một em bé và mẹ._
em_be: Chú ơi hát lại đi! Hát lại cái bài cá viên chiên!
* [🎤 Hát lại. Lần này cho em bé hát câu "thích ăn chuối chiên".]
    _Em bé hét "CHUỐI CHIÊN!" to nhất công viên. Hai bà cụ vỗ tay. Chú chạy bộ chạy thêm hai vòng rồi quay lại nghe tiếp._
    ~ phat_nt(5)
    ~ phat_tt(-15)
    ~ cang_thang(-20)
    { phat_tinh_tuong <= 40:
        _Chị áo dài đưa bạn tấm danh thiếp: "Mùa cưới năm nay em kín lịch. Anh nhận hết hông? Em đặt cọc luôn."_
        ~ tien_cong(20000000)
        ~ phat_so_show = phat_so_show + 1
        _Hai mươi triệu tiền cọc cho cả mùa cưới. Bạn cầm phong bì, tay run hơn lúc nhận cúp năm 2015._
    }
* [📖 Kể cho 7 người nghe chuyện năm 2015, rồi mới hát lại.]
    _Bà cụ ngồi nghe hết. Em bé ngủ gục trên vai mẹ. Chú chạy bộ đã chạy đi. Còn 4 người. Bốn người nghe thật._
    ~ phat_nt(2)
    ~ phat_tt(-8)
* [🕶️ Đeo lại kính đen: "Muốn nghe tiếp thì xin chữ ký trước nha."]
    _Em bé nhìn mẹ. Mẹ kéo em bé đi. Còn 2 bà cụ, nhưng hai bà đang tập dưỡng sinh._
    ~ phat_tt(10)
    ~ phat_nt(-2)
- _Trời chiều. Bạn ngồi lại một mình trên ghế đá. Lần đầu tiên sau mười một năm, không ai biết bạn là ai, mà bạn vẫn thấy mình là ca sĩ._
~ nhan(ca_vien_chien)
~ an(15)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_2910_chuoc_cup ===
# ngay:29 # gio:19:30 # noi:tiem_cam_do
{ not phat_cam_cup:
    _Bạn đi ngang tiệm cầm đồ Cứu Nguy. Tủ kính toàn đồng hồ của {dan_dau_tu}. Cái cúp của bạn đang ở nhà, bám bụi, nhưng ở nhà._
    -> END
}
_Tiệm cầm đồ Cứu Nguy. Ngày mai là hạn chót chuộc cúp. Cái cúp "Ca khúc của năm 2015" vẫn ở trong tủ kính, giữa cái nồi cơm điện và cây đàn organ._
chu_tiem_cam_do: Chuộc hông con? 6 triệu, thêm 300 nghìn lãi. Mai là tiệm bán đó nha.
* {tien >= 6300000} [💸 Chuộc.]
    ~ tien_cong(-6300000)
    ~ phat_cam_cup = false
    ~ phat_chuoc_cup = true
    ~ phat_co_cup = true
    _Bạn ôm cúp ra khỏi tiệm. Trời mưa lâm râm. Bạn che mưa cho cái cúp bằng áo sơ mi lụa._
    ~ cang_thang(-10)
* [📞 Gọi anh {quan_ly_idol}: "Anh cho em mượn 6 triệu."]
    { qh_quan_ly_idol >= 50:
        quan_ly_idol: Em đứng đó. Anh tới liền.
        _Hai mươi phút sau anh tới, tóc ướt mưa, chuyển khoản tại quầy. Anh không hỏi gì. Chỉ nói: "Cái cúp này của hai anh em mà."_
        ~ phat_cam_cup = false
        ~ phat_chuoc_cup = true
        ~ phat_co_cup = true
        ~ phat_them_no(6300000)
        ~ qh("quan_ly_idol", 10)
    - else:
        quan_ly_idol: Anh đang ở đài… {idol_het_thoi}, anh hết rồi em ơi. Tháng 7 anh… thôi, để anh tính.
        _Anh không tính kịp. Mai tiệm bán._
        ~ cang_thang(10)
    }
* [😶 Đứng nhìn qua tủ kính một lúc rồi đi.]
    _Cái cúp phản chiếu một người không đeo kính đen, đứng ngoài mưa._
    ~ cang_thang(8)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_3010_don_kho ===
# ngay:30 # gio:08:20 # noi:gam_cau_thang
_Sáng sớm, hiếm hoi bạn tới trước 9 giờ. {hr} đang chỉ đạo dọn kho trước buổi họp đánh giá. Hai anh lao công đang lôi đồ dưới gầm cầu thang ra: chìa khóa, son môi, điện thoại cũ, một con gà cao su, một chiếc găng tay hồng._
_Kho báu của {cho}. {cho} đứng đó, sủa không ra tiếng, nhìn từng món bị bỏ vào bao rác._
* [🐾 Đứng chắn trước gầm cầu thang: "Đồ này của anh. Anh gửi đó. Đừng dọn."]
    hr: Của anh {idol_het_thoi} hết hả? Son môi cũng của anh?
    idol_het_thoi: Đồ diễn.
    hr: *(mỉm cười)* Dạ. Vậy để nguyên ạ.
    ~ qh("cho", 25)
    ~ qh("hr", -3)
* [🧤 Nhặt chiếc găng tay hồng ra khỏi bao rác, cất vào túi.]
    _Găng tay của {sieu_nhan_hong}, bị {cho} cướp ngày 4/10. Hơi rách, dính lông chó. Bạn cất kỹ._
    ~ nhan(gang_tay_hong)
    ~ qh("cho", 5)
* [😶 Đứng nhìn. Không phải chuyện của mình.]
    _{cho} nhìn bạn. Rồi đi về chòi bảo vệ, nằm úp mặt vào chân bác {bac_bao_ve}._
    ~ qh("cho", -10)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Cả công ty ngồi kín phòng họp tầng 2. Đề bạt, tăng lương, cắt giảm. Mục cuối cùng trong chương trình: "Gia hạn hợp đồng ca sĩ độc quyền"._
_{giam_doc} lật tới trang của bạn. Đọc rất lâu._
giam_doc: {idol_het_thoi}. Anh hỏi em một câu thôi. Em muốn ở lại để làm gì?
* [🕶️ "Để làm ngôi sao của công ty. Fan em vẫn đông."]
    giam_doc: *(gật đầu chậm)* Ừ.
    ~ phat_tt(5)
* [📖 "Để hát. Đám cưới, khai trương, công viên, ở đâu cũng được. Em chỉ biết hát thôi anh."]
    giam_doc: *(nhìn bạn rất lâu)* Năm 2015 em cũng nói câu đấy. Ở quán cà phê.
    ~ qh("giam_doc", 10)
    ~ phat_tt(-10)
* {phat_song_ca} [🎶 "Để đêm mai hát 'Công Viên Hồng' với Nguyên. Rồi để anh quyết."]
    giam_doc: *(lần đầu trong tháng, cười thật)* Thế thì đêm mai anh ngồi hàng đầu.
    ~ qh("giam_doc", 8)
    ~ qh("sieu_nhan_hong", 5)
* {qh_quan_ly_idol >= 70} [🤝 Nhìn sang anh {quan_ly_idol}: "Để làm việc với anh {quan_ly_idol} thêm vài năm nữa."]
    quan_ly_idol: *(làm rơi điện thoại bên trái xuống bàn)*
    giam_doc: {quan_ly_idol}. Cậu đặt cược uy tín cho thằng này không?
    quan_ly_idol: *(nhặt điện thoại, không nhìn ai)* Mười hai năm rồi anh. Cược hết.
    ~ qh("quan_ly_idol", 10)
    ~ qh("giam_doc", 5)
- { phat_noi_tieng >= 50 or qh_giam_doc >= 50 or qh_quan_ly_idol >= 70 or (phat_song_ca and qh_giam_doc >= 20):
    ~ phat_gia_han = true
    giam_doc: Gia hạn một năm. Lương giữ nguyên, cát-xê đám cưới phải có hóa đơn. {ke_toan} nhìn kìa. Kèm thưởng gia hạn 10 triệu.
    ~ tien_cong(10000000)
    _{ke_toan} gật đầu. Anh {quan_ly_idol} thở ra. Bạn không biết mình đang nín thở từ lúc nào._
- else:
    ~ phat_gia_han = false
    giam_doc: Anh… chưa gia hạn. Hết tháng này em tự do. Anh xin lỗi em, {idol_het_thoi}.
    _"Tự do." Một từ đẹp, nghe như cửa đóng lại._
    ~ cang_thang(20)
}
-> END

// ------------------------------------------------------------
=== idol_het_thoi_3010_dem_cuoi ===
# ngay:30 # gio:22:00 # noi:can_1808
_Đêm trước Đại Nhạc Hội Siêu Nhân. Bạn ngồi trên sàn căn 1808. Bốn bức tường vẫn là poster năm 2015. Trên bàn: hóa đơn, thông báo nợ, cuốn sổ có bài hát mới._
_Tiền Nợ còn: {phat_no} đồng._
_22:00. Anh {giam_doc} nhắn group như mọi tối: "Mai cả nhà mình cháy hết mình nhé. Anh không ép, tùy các em."_
* {tien >= phat_no and phat_no > 0} [💸 Chuyển khoản trả hết nợ, một lần.]
    ~ tien_cong(0 - phat_no)
    ~ phat_no = 0
    _Màn hình hiện: "Giao dịch thành công." Bạn ngồi nhìn dòng chữ đó lâu hơn nhìn bất kỳ bình luận nào trong ba năm._
    ~ cang_thang(-20)
* [🧹 Gỡ bớt poster trên tường. Để lại một tấm.]
    _Bạn gỡ 30 tấm. Để lại tấm năm 2016 ở hội chợ, trời mưa, có cậu kỹ thuật viên bị điện giật ở góc. Tường trống ra một khoảng lớn. Dễ thở._
    ~ phat_tt(-10)
* [📱 Nhắn anh {quan_ly_idol}: "Mai anh đứng ở đâu?"]
    quan_ly_idol: *(trả lời sau 4 giây)* Ở chỗ thấy em rõ nhất.
    _Bạn đọc tin nhắn đó ba lần. Không trả lời. Nhưng cũng không tắt màn hình._
    ~ qh("quan_ly_idol", 8)
* [🕶️ Đeo kính đen, tập cúi chào trước gương.]
    _Một trăm lần. Lần nào cũng đẹp. Trong gương nhà mình._
    ~ phat_tt(5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_3110_hau_truong ===
# ngay:31 # gio:18:30 # noi:san_khau_dem_hong # bat_buoc
_Sân khấu Đại Nhạc Hội Siêu Nhân, Phường Tân Drama. Hậu trường ồn như chợ. Cả công ty hóa trang Halloween. {giam_doc} mặc đồ "Ông Kẹ Ngân Hàng", không ai dám cười._
{ phat_song_ca and phat_nguoi_remix != "" and qh_sieu_nhan_hong >= 50:
    ~ phat_vai_dem_hong = "song_ca"
    _Danh sách tiết mục: số 3, "Công Viên Hồng", {sieu_nhan_hong} và {idol_het_thoi}. Tên bạn in cùng cỡ chữ với tên Nguyên._
- else:
    { phat_gia_han:
        ~ phat_vai_dem_hong = "mo_man"
        _Danh sách tiết mục: sau phim ngắn và video "16 năm", phần ca nhạc mở màn: {idol_het_thoi}, "Công Viên"._
    - else:
        ~ phat_vai_dem_hong = "khan_gia"
        _Danh sách tiết mục không có tên bạn. Bạn có một tấm vé. Hàng cuối._
    }
}
_Sau cánh gà, dây micro của {sieu_nhan_hong} nằm ngay dưới chân bạn. Không ai để ý. Một cú giật là đủ._
* [😤 Giật dây micro.]
    ~ phat_vai_dem_hong = "pha_dam"
    ~ phat_gianh()
    ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
    _Bạn cúi xuống. Tay bạn chạm vào dây. Bạn giật._
    _Ba mươi phút sau, khi Nguyên bước ra, micro câm. Ba mươi giây im lặng trước năm nghìn khán giả. {it} chạy như bay._
    ~ follow(-50000)
    ~ scandal()
* [🤝 Gom dây micro lại, dán băng keo xuống sàn cho khỏi ai vấp.]
    it: *(đi ngang, nhìn băng keo)* …Cảm ơn.
    ~ qh("it", 5)
    ~ qh("sieu_nhan_hong", 3)
* {co(gang_tay_hong)} [🧤 Đưa Nguyên chiếc găng tay hồng: "Của em nè. Tìm được ở kho của con {cho}."]
    sieu_nhan_hong: *(đeo vào, một tay hồng cũ, một tay hồng mới)* Anh… tìm cho em hả? Trời ơi…
    ~ mat(gang_tay_hong)
    ~ qh("sieu_nhan_hong", 15)
    ~ qh("cho", -5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 30. Đại Nhạc Hội Siêu Nhân bắt đầu. Phim ngắn "Người Hùng Không Tên" mở màn, rồi video "16 năm" của {editor}. Năm nghìn người ngồi kín bãi. Cùng giờ, ở Đài Tivi Hóng, chung kết "Giọng Ca Ước Mơ" chuẩn bị lên sóng._
{ phat_vai_dem_hong:
- "song_ca":
    -> song_ca
- "mo_man":
    -> mo_man
- "pha_dam":
    -> pha_dam
- else:
    -> khan_gia
}

= song_ca
_Tiết mục số 3. Đèn tắt. Nhạc dạo của bản remix vang lên: vẫn là "Công Viên", nhưng nhanh hơn, hồng hơn, có tiếng trống như tim đập._
{ phat_nguoi_remix == "bao":
    _Giữa bản remix, chèn một đoạn giọng mộc năm 2015, giọng bạn năm 19 tuổi. Năm nghìn người im lặng nghe một cậu sinh viên hát._
}
sieu_nhan_hong: *(vào micro)* Ngày xưa có đôi bạn thân…
_Bạn hát câu tiếp theo. Hai giọng, một bài. Tới câu đó, Nguyên nhìn mu bàn tay trái, đọc to: "…thích ăn CHUỐI chiên!"_
_Năm nghìn người hét theo. Có người đứng dậy nhảy. Có người khóc. {giam_doc} ở hàng đầu, bộ đồ Ông Kẹ Ngân Hàng ướt đẫm nước mắt._
~ phat_song_ca_dem_hong = true
~ follow(150000)
~ phat_nt(20)
* [🕶️ Tháo kính đen, ném xuống khán giả.]
    _Một em bé bắt được. Đeo vào. Kính to che hết nửa mặt._
    ~ phat_tt(-10)
* [🎶 Lùi lại nửa bước, để Nguyên hát điệp khúc cuối một mình.]
    _Nguyên hát. Đúng lời. Khán giả hát theo. Bạn đứng phía sau, nhìn lưng áo hồng, và lần đầu tiên không thấy ghen._
    ~ qh("sieu_nhan_hong", 10)
    ~ phat_tt(-10)
- -> END

= mo_man
_Phần ca nhạc mở màn. Bạn bước ra với "Công Viên". Năm nghìn người. Không có ai đeo áo in hình bạn, trừ một người: cô fan cuồng số 1, giơ băng rôn "Công Viên muôn năm"._
{ phat_noi_tieng >= 50:
    _Tới điệp khúc, nửa bãi hát theo. Bạn nghe được cả giọng anh {quan_ly_idol} ở cánh gà._
    ~ follow(30000)
    ~ phat_nt(5)
- else:
    _Tới điệp khúc, vài trăm người hát theo. Số còn lại đang chờ Siêu Nhân Hồng. Vậy cũng được._
    ~ follow(5000)
}
* [😇 Kết bài: "Mời mọi người đón Siêu Nhân Hồng!"]
    _Bạn nhường sân khấu. Khi đi vào cánh gà, Nguyên đập tay với bạn._
    ~ qh("sieu_nhan_hong", 5)
    ~ follow(10000)
* [🕶️ Hát thêm một bài, dù không có trong kịch bản.]
    _{chi_dai} cầm bộ đàm: "Phát. Ra." Bạn ra._
    ~ phat_gianh()
    ~ follow(-5000)
- -> END

= pha_dam
_Micro của Nguyên câm 30 giây. Năm nghìn người xì xào. Rồi Nguyên tháo mũ, hát không micro, hét thật to cho hàng cuối nghe. Có người quay lại. Có người cười._
_Bạn đứng trong bóng tối cánh gà. Không ai biết bạn làm. Trừ anh {quan_ly_idol}, đang nhìn bạn, và không nói gì._
~ qh("quan_ly_idol", -25)
* [😶 Đi ra cổng sau.]
    ~ phat_tt(5)
* [🔌 Chạy ra cắm lại dây micro.]
    _Bạn cắm lại. Micro sống lại giữa câu hát. Nguyên quay lại nhìn cánh gà. Không biết ai cắm. Gật đầu cảm ơn._
    ~ follow(20000)
    ~ qh("quan_ly_idol", 10)
- -> END

= khan_gia
_Hàng cuối. Bạn đeo kính đen, ngồi giữa hai người lạ. Bên trái là một bác xe ôm, bên phải là một cô sinh viên đang livestream._
_Siêu Nhân Hồng hát. Rồi giữa bài, Nguyên dừng lại, nói vào micro:_
sieu_nhan_hong: Bài tiếp theo là của một đàn anh em rất quý. Ảnh dạy em là CHUỐI chiên. Hông phải khoai.
_Nhạc dạo "Công Viên" vang lên. Cô sinh viên bên cạnh hát theo. Bác xe ôm cũng hát theo._
* [🎤 Hát theo từ hàng cuối, thật to.]
    _Không ai biết giọng to nhất hàng cuối là ai. Nhưng cô sinh viên quay sang nhìn bạn rất lâu._
    ~ phat_nt(3)
    ~ follow(5000)
* [😶 Ngồi im nghe bài của mình.]
    _Bạn nghe bài của mình như một khán giả. Lần đầu tiên. Nó hay hơn bạn nhớ._
    ~ phat_tt(-5)
- -> END
