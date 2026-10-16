// ============================================================
// GIÁM ĐỐC · CHƯƠNG 2: "HOA HƯỚNG DƯƠNG 1989" (5/10 – 13/10)
// ============================================================

// ------------------------------------------------------------
=== giam_doc_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_tang_2 # bat_buoc
_Thứ Hai. Ngày Nhà giáo Thế giới. Trên bàn họp có 22 bông hồng, mỗi bông kèm một tấm thiệp: "Cảm ơn thầy/cô đã dạy em."_
thuc_tap_sinh: Dạ, em tặng các anh chị ạ. Ở đây ai cũng là thầy cô của em hết ạ.
_Bông của bạn to nhất. Thiệp ghi: "Kính tặng thầy {giam_doc}, người thầy của sự… tùy em."_
hong_hot: *(che miệng cười)*
* [😂 Cười to: "Thầy nhận! Thầy tùy em thật đấy!"]
    ~ qh("thuc_tap_sinh", 10)
    ~ gd_uy(3)
    _Cả phòng cười. Lần đầu tiên một câu đùa về sếp được nói trước mặt sếp._
* [😐 "Ai dạy em viết câu này?"]
    thuc_tap_sinh: Dạ… dạ anh {ran_doc} bảo em là sếp thích câu đó ạ.
    ~ qh("ran_doc", -5)
    ~ qh("thuc_tap_sinh", -5)
- truong_phong: Vâng, giờ mời anh {giam_doc} phát biểu đầu tuần ạ.
* [🎤 Đứng dậy phát biểu.]
    -> giam_doc_mg_phat_bieu_mo_dau
* {gd_sua_hop_ngan == false} [🗣️ "Tuần này anh chỉ nói một câu: làm việc đi, anh mời trưa."]
    ~ gd_sua("hop_ngan")
    ~ tien_cong(-400000)
    ~ gd_uy(5)
    truong_phong: Ơ… thế còn 1 tiếng 55 phút còn lại ạ?
    chi_dai: Em lấy. Em đi dựng sân khấu.
* [🙅 "{truong_phong} chủ trì đi. Anh không ép, tùy em."]
    ~ gd_tuy_em("truong_phong")
    _{truong_phong} họp tiếp 2 tiếng. Lúc ra, mặt ai cũng như vừa đi thi._
    ~ gd_uy(-3)
- -> END

// ------------------------------------------------------------
=== giam_doc_0510_hoa_huong_duong ===
# ngay:5 # gio:23:10 # noi:biet_thu # bat_buoc
_23:10. Group "Hội Anti Sếp", 14 thành viên. Bạn đang đăng nhập bằng "Hoa Hướng Dương 1989"._
hong_hot: Ét o ét mấy bà ơi! Sếp vừa nhắn "Anh không ép, tùy em" lúc 10 giờ đêm. Dịch ra là "làm liền" đó hả?
ran_doc: Nói nhỏ thôi nha… nghe nói sếp sắp mua xe mới đó.
designer: Mua xe mới mà poster tui sửa 9 lần không được thêm đồng nào.
~ gd_dung_clone = true
* [😂 Thả haha.]
    _An toàn. Không ai để ý bông hoa._
* [🌻 Gõ: "Sếp cũng áp lực mà mọi người."]
    hong_hot: Ủa alo? Bông hoa này là ai vậy? Tui hông nhớ add ai tên hoa.
    ~ gd_nghi_clone = gd_nghi_clone + 20
    _Bạn thoát ra, tim đập như chạy 5 cây số._
* [📝 Chụp màn hình, ghi tên {ran_doc} vào Danh sách đen của sếp.]
    ~ gd_danh_sach_den = gd_danh_sach_den + 1
    ~ gd_da_tra_thu = true
    ~ gd_uy(5)
    ~ qh("ran_doc", -15)
    _Danh sách đen, dòng 1: "{ran_doc}. Tội: tung tin mua xe. Hình phạt: tuần sau tính."_
* [😶 Thoát ra. Ngồi nhìn trần nhà.]
    _Mua xe mới. Bạn nhìn ra sân, chiếc xe 8 năm tuổi đang đậu dưới mưa._
    ~ cang_thang(5)
- _Bạn chưa ngủ. Bạn đọc lại tất cả tin nhắn từ tháng 6. "Sếp nói dài." "Sếp nhắn khuya." "Sếp nói tiếng Anh sai." "Lương trễ."_
_Mỗi câu chê là một việc có thể sửa. Hoặc một cái tên có thể ghi sổ._
-> END

// ------------------------------------------------------------
=== giam_doc_0610_ba_cu ===
# ngay:6 # gio:10:30 # noi:studio # bat_buoc
_Buổi chụp poster đầu tiên. Đèn, phông, máy ảnh, {designer} đứng sẵn với bảng màu 7 sắc hồng._
_10 giờ 30. Giữa chừng, {sieu_nhan_hong} nhìn qua cửa sổ xuống Đường Hóng. Gần đầu Hẻm 69, xe chè của Bà Bảy sụp một bánh xuống ổ gà, nồi chè nghiêng chực đổ._
sieu_nhan_hong: Khoan! Có người cần giúp! Biến hình! *(chạy mất)*
quan_ly_idol: Ơ! Khoan, anh nghe máy chút… ơ đi đâu rồi?!
designer: Sửa nhẹ thôi là sửa cái gì ạ? Người mẫu chạy mất rồi ạ.
_Điều khoản số 3: Siêu Nhân Hồng được bỏ ngang buổi quay để giúp người, công ty không được trừ tiền. Mất 3 triệu 2 thuê studio. {ke_toan} đã kẹp hóa đơn vào sổ._
* [😡 "Gọi về ngay! Chụp xong rồi giúp ai thì giúp!"]
    ~ qh("sieu_nhan_hong", -10)
    ~ gd_uy(-3)
    _Không ai dám gọi. {hong_hot} thì đã đứng ở cửa sổ quay clip từ đầu: bộ đồ hồng ghé vai đẩy xe chè lên khỏi ổ gà, rồi đứng ăn chè bằng ống hút luồn qua mũ._
* [📱 "{hong_hot}, quay lại hết đi. Clip này hay hơn poster."]
    hong_hot: Em quay từ nãy rồi sếp! Sếp thấy hông, em biết mà!
    ~ qh("hong_hot", 10)
    -> giam_doc_0610_day_clip
* [🤝 Tự xuống đường giúp một tay.]
    _Bạn chạy xuống. Hai người, một áo hồng, một áo vest, cùng ghé vai đẩy xe chè lên khỏi ổ gà. Bà Bảy múc cho mỗi người một ly chè đậu đỏ. Cô cháu gái phụ bán nhìn bộ đồ hồng rất lâu, như vừa nhận ra một giọng quen._
    ~ nghi(-10)
    sieu_nhan_hong: Sếp ơi sếp ngầu dữ vậy!
- -> END

=== giam_doc_0610_day_clip ===
_Chiều. {dan_dau_tu} gõ cửa phòng kính, mang theo một tờ biểu đồ nhăn nhúm._
dan_dau_tu: Anh, số liệu cho thấy clip thật có tỷ lệ chia sẻ gấp 12 lần nội dung dàn dựng. Đẩy đúng giờ vàng tối nay thì được gấp bốn.
* [✍️ "Duyệt 30 triệu chạy quảng cáo cho clip này. Ngay."]
    ~ gd_tien_cty(-30)
    ~ follow(60000)
    ~ qh("dan_dau_tu", 15)
    dan_dau_tu: Lần này là lên thật anh!
    _Lần đầu tiên câu đó của {dan_dau_tu} đúng._
* [💬 "Thế lần trước ông bảo coin lên, có lên không?"]
    dan_dau_tu: Coin khác, số liệu khác anh ơi…
    ~ qh("dan_dau_tu", -5)
- -> END

// ------------------------------------------------------------
=== giam_doc_0710_moc_1 ===
# ngay:7 # gio:16:00 # noi:phong_giam_doc # bat_buoc
_Mốc 1: 50.000 người theo dõi. Bạn mở điện thoại. Con số hiện ra: {nguoi_theo_doi}._
{ nguoi_theo_doi >= 50000:
    -> giam_doc_0710_dat_moc
- else:
    -> giam_doc_0710_truot_moc
}

=== giam_doc_0710_dat_moc ===
_Đạt. Bạn đứng dậy, đi ra khỏi phòng kính, giơ điện thoại lên như giơ cúp._
giam_doc: Các em! Mốc 1! Hôm nay anh mời cả công ty bánh mì!
* [🥖 Bánh mì thịt đặc biệt, 23 ổ, tiền túi.]
    ~ tien_cong(-575000)
    ~ gd_uy(10)
    ~ an(30)
    ~ qh("thuc_tap_sinh", 5)
    ~ qh("hong_hot", 5)
    _{cho} cũng được nửa ổ. Thật ra là tự lấy._
* [🧾 Nhờ {ke_toan} duyệt quỹ công ty.]
    ke_toan: Dạ, 23 ổ bánh mì, có hóa đơn cô Bảy, em duyệt. Anh giữ lời lần này nha.
    ~ gd_tien_cty(-1)
    ~ gd_uy(5)
- -> END

=== giam_doc_0710_truot_moc ===
_Trượt. Theo luật bạn tự đặt từ hôm 2/10: trượt mốc thì "truyền lửa" 3 tiếng._
_Cả công ty đã ngồi sẵn ở phòng "Sáng Tạo". Ánh mắt như đi đưa tang._
* [🔥 Truyền lửa đúng 3 tiếng. Lời hứa là lời hứa.]
    ~ gd_uy(-5)
    ~ cang_thang(10)
    _Tiếng thứ hai, {chua_te_deadline} ngủ. Tiếng thứ ba, chính bạn suýt ngủ._
    ~ follow(-5000)
* [😮‍💨 "Thôi. Ba tiếng các em làm việc còn hơn ba tiếng nghe anh nói."]
    ~ gd_sua("hop_ngan")
    ~ gd_uy(5)
    chi_dai: Câu hay nhất anh nói trong năm nay đó.
    ~ qh("chi_dai", 10)
    ~ follow(5000)
- -> END

// ------------------------------------------------------------
=== giam_doc_0810_kham_mat ===
# ngay:8 # gio:13:30 # noi:phong_giam_doc
_Ngày Thị giác Thế giới. {chi_dai} lôi {editor} vào phòng bạn. Mắt {editor} đỏ như mắt thỏ._
chi_dai: Anh ký giấy cho nó đi khám mắt. Nó dựng phim tới 4 giờ sáng ba tuần nay rồi.
editor: Em… *(ngáp)* … em ổn mà. Đợi render xong…
_Bạn nhớ: tuần trước {truong_phong} trình MV teaser, nói "em dựng cả đêm". Cái MV có con cú nhỏ xíu ở góc khung hình thứ 214._
* [✍️ Ký giấy khám, kèm "nghỉ sáng mai, có lương".]
    ~ qh("editor", 15)
    ~ qh("chi_dai", 5)
    editor: Dạ… em cảm ơn anh. *(ngáp)* Lần đầu có người cho em nghỉ sáng.
* [💬 "{editor}, cái teaser tuần trước… em dựng à?"]
    editor: *(im lặng ba giây)* … Render xong là xong anh.
    _Câu trả lời đó là có._
    ~ qh("editor", 5)
    ~ qh("truong_phong", -5)
* [🙅 "Khám cuối tháng nhé. Giờ đang chiến dịch. Anh không ép, tùy em."]
    ~ gd_tuy_em("editor")
    chi_dai: Anh {giam_doc}. Em hỏi lại một lần.
    _Giọng {chi_dai} không to, nhưng cái bàn rung._
    ~ gd_uy(-5)
    ~ qh("chi_dai", -10)
- -> END

// ------------------------------------------------------------
=== giam_doc_0910_duyet_quang_cao ===
# ngay:9 # gio:09:00 # noi:phong_giam_doc # bat_buoc
_Sáng ra mắt MV. {hong_hot} đứng trước bàn bạn, tay ôm laptop như ôm con._
hong_hot: Sếp! Duyệt chạy quảng cáo Phây-búc cho MV đi sếp. 200 triệu. Không chạy là MV chìm như đá liền!
_Ngân Sách hiện tại: {gd_ngan_sach} triệu._
ke_toan: *(nhắn)* "Anh nhớ lãi ngân hàng tuần này."
* [✍️ "Duyệt. Chạy hết công suất."]
    ~ gd_duyet_qc_mv = true
    ~ gd_tien_cty(-200)
    ~ follow(40000)
    ~ qh("hong_hot", 15)
    hong_hot: Sếp đỉnh! Em đi chạy liền!
* [✂️ "100 triệu thôi. Nửa còn lại để trả lãi."]
    ~ gd_tien_cty(-100)
    ~ follow(15000)
    ~ gd_no(-5)
    hong_hot: Nửa quảng cáo thì nửa người xem hả sếp…
* [🙅 "Không chạy. Nội dung hay thì tự viral. Anh không ép, tùy em."]
    ~ gd_tuy_em("hong_hot")
    ~ gd_tien_cty(0)
    ~ follow(-10000)
    ~ gd_no(-10)
    hong_hot: Dạ. Tùy em thì em… khóc.
- -> END

// ------------------------------------------------------------
=== giam_doc_0910_ra_mat_mv ===
# ngay:9 # gio:15:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. Tiệc chiếu thử MV nội bộ: trứng luộc, trứng chiên, trứng ốp la xếp hình trái tim hồng. 20 giờ tối nay MV mới lên kênh._
_MV "Hồng Hóa Việt Nam" chiếu trên màn hình lớn. {sieu_nhan_hong} xoay ba vòng, chỉ tay vào ống kính._
sieu_nhan_hong: Cả nhà thấy em slay hông?!
_Mọi người vỗ tay. {idol_het_thoi} đứng ở góc, đeo kính đen, khoanh tay._
idol_het_thoi: Hồi anh ra "Công Viên", cả nước hát trong một tuần. Còn này…
* [🎤 "{idol_het_thoi}, năm 2015 anh tìm ra em. Giờ em giúp anh tìm ra người tiếp theo."]
    idol_het_thoi: *(tháo kính)* … Anh vẫn nhớ hả?
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 5)
* [😂 "Em biết anh là ai không? Anh là người lăng xê em đấy!"]
    idol_het_thoi: Dạ… em biết.
    ~ qh("idol_het_thoi", -5)
* [🥚 Đưa cho {idol_het_thoi} một quả trứng luộc, không nói gì.]
    idol_het_thoi: … Cảm ơn anh. *(bóc trứng, ăn rất chậm)*
    ~ an(10)
    ~ qh("idol_het_thoi", 5)
- ~ an(20)
-> END

// ------------------------------------------------------------
=== giam_doc_0910_hong_coin ===
# ngay:9 # gio:23:30 # noi:biet_thu
_Gần nửa đêm. Một tài khoản ẩn danh vừa tung ra đồng "Hồng Coin" ($HONG). Group "Hội Anti Sếp" sôi lên._
dan_dau_tu: Anh em ơi, $HONG mới ra, đáy thật rồi, vào đi! Lần này là lên thật!
hong_hot: Ủa coin mang tên Siêu Nhân Hồng mà công ty mình hông biết gì hả?
{ gd_dung_clone:
    _Bạn đang là "Hoa Hướng Dương 1989". Ngón tay lơ lửng trên bàn phím._
- else:
    _Bạn đọc được nhờ {thanh_ninh} chụp màn hình gửi sang. Cô ấy chụp group nào cũng được._
}
* [💸 Âm thầm mua 2 triệu tiền túi. Biết đâu.]
    ~ tien_cong(-2000000)
    _Bạn tắt màn hình, nằm xuống. Mắt vẫn mở._
* [📢 Nhắn group công ty: "Công ty không liên quan đồng coin nào. Đề nghị không ai đầu tư."]
    ~ gd_uy(5)
    ~ qh("dan_dau_tu", -10)
    _Một phút sau, group anti sếp: "Sếp lại cấm. Chắc sếp mua hết rồi."_
* [😶 Kệ. Không phải việc của sếp.]
    ~ cang_thang(3)
- -> END

// ------------------------------------------------------------
=== giam_doc_1010_lenh_chuyen_luong ===
# ngay:10 # gio:09:00 # noi:biet_thu # bat_buoc
_Thứ 7, ngày 10. Ngày nhận lương. Bạn đang uống cà phê thì {ke_toan} gọi._
ke_toan: Anh. Ngân hàng giữ lệnh chuyển lương rồi. Họ nói "kiểm tra giao dịch lớn". Thứ Hai mới mở lại.
_Bạn biết lý do thật. Khoản vay thế chấp đang quá hạn, mọi giao dịch của công ty bị soi._
~ gd_no(5)
* [😮‍💨 "Anh biết vì sao. Thứ Hai anh nói với em."]
    ke_toan: Em làm sổ cho anh từ 2024, em cũng đoán ra rồi anh. Mình nói cho rõ là được.
    ~ qh("ke_toan", 10)
* [🎭 "Ngân hàng dạo này làm việc chậm lắm. Lỗi hệ thống thôi."]
    ke_toan: Dạ. "Lỗi hệ thống". Em ghi vậy.
    ~ gd_hua()
    ~ qh("ke_toan", -5)
* [📞 "Để anh gọi thẳng giám đốc chi nhánh."]
    -> giam_doc_mg_ngan_hang_mo_dau
- _Group công ty bắt đầu có người hỏi: "Ủa lương đâu mọi người?"._
-> END

// ------------------------------------------------------------
=== giam_doc_1010_chuyen_ha_noi ===
# ngay:10 # gio:16:00 # noi:choi_bao_ve
_Ngày Giải phóng Thủ đô. Chiều thứ 7, công ty vắng. Bạn ghé chòi bảo vệ. {truong_phong} đã ngồi đấy từ trước, đang kể về phố cổ._
truong_phong: … thế nên em bảo, phở phải có quẩy, anh ạ. Không có quẩy là không phải phở.
bac_bao_ve: Ừ. Hồi bác còn ở Hà Nội, sáng nào cũng một bát. Mười nghìn.
_Ba người miền Bắc, một ấm trà, một cái radio. {cho} ngủ dưới chân bác._
* [☕ Ngồi xuống: "Cháu kể chuyện hồ Gươm hồi cháu đi thi nhé."]
    ~ gd_tra_binh = gd_tra_binh + 1
    ~ qh("bac_bao_ve", 5)
    ~ qh("truong_phong", 5)
    ~ cang_thang(-10)
    _Lần đầu tiên trong tháng, bạn nói chuyện mà không nói chữ "mindset"._
    ~ gd_sua("tieng_anh")
* [💬 "Bác ơi, hôm nay mùng 10… bác có ngày gì đặc biệt không?"]
    bac_bao_ve: *(nhìn bạn rất lâu)* … Sao cậu biết?
    giam_doc: Hồ sơ năm 2010. Cháu là người nhập hồ sơ đầu tiên của công ty mà.
    bac_bao_ve: Năm mươi tuổi. Cả công ty chỉ có hai người nhớ. Cậu, với một người nữa.
    _Bác không nói người kia là ai. Bác rót thêm trà, tay hơi run._
    ~ qh("bac_bao_ve", 20)
    ~ gd_tra_binh = gd_tra_binh + 1
* [🏌️ "Hai người cứ nói chuyện đi, cháu có hẹn golf."]
    _Bạn đi. {truong_phong} nhìn theo, rồi kể tiếp chuyện quẩy._
- -> END

// ------------------------------------------------------------
=== giam_doc_1110_anh_hoi_nho ===
# ngay:11 # gio:20:00 # noi:biet_thu
_Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {sieu_nhan_hong} đăng ảnh xóm Cây Me: một đám nhóc, một đứa đang khóc._
_Bạn lục album. Không có ảnh hồi nhỏ. Chỉ có một tấm năm 2010: căn phòng 20 mét vuông, cái bàn nhựa, Bác {bac_bao_ve} ngồi ở cửa. Người cầm máy ảnh hôm đó là Genta._
* [📸 Đăng tấm ảnh 2010: "Ngày đầu tiên. Lúc đó anh 21 tuổi, chưa có gì ngoài sợ nghèo."]
    ~ gd_uy(5)
    ~ qh("bac_bao_ve", 5)
    hong_hot: Ủa sếp hồi đó gầy dữ! Mà sao có ông nào đứng sau máy ảnh vậy sếp?
    _Bạn không trả lời câu đó._
    ~ follow(3000)
* [🩷 Chia sẻ ảnh của {sieu_nhan_hong}, ghi "Từ nhỏ đã là siêu nhân!"]
    ~ follow(5000)
    ~ qh("sieu_nhan_hong", 5)
    _Trong ảnh, đứa nhỏ đang khóc nhìn thẳng vào ống kính. Bạn không biết đó là ai. Có người biết._
* [😶 Không đăng gì.]
    _Bạn tắt điện thoại, nhìn bức tường ảnh với người nổi tiếng. Không tấm nào là ảnh lúc nhỏ._
- -> END

// ------------------------------------------------------------
=== giam_doc_1210_luong_ve_tre ===
# ngay:12 # gio:09:00 # noi:phong_giam_doc # bat_buoc
_Thứ Hai. Lương vẫn chưa về. {ke_toan} đóng cửa phòng kính sau lưng, đặt xấp bảng lương lên bàn._
ke_toan: Anh. Ngân hàng giữ lệnh hai ngày nay, nói là "kiểm tra giao dịch lớn". Mấy năm nay họ chưa soi bao giờ. Anh có chuyện gì với ngân hàng mà em không biết không?
* [⌚ Tháo đồng hồ đặt lên bàn: "Em mang ra tiệm cầm đồ, ứng trước cho mấy đứa đang kẹt tiền nhé."]
    ~ gd_cam_dong_ho = true
    ~ tien_cong(15000000)
    ~ tien_cong(-15000000)
    ~ gd_uy(5)
    ~ gd_sua("luong_dung_han")
    ~ qh("ke_toan", 15)
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("bac_bao_ve", 5)
    ke_toan: *(cầm đồng hồ, nhìn bạn rất lâu)* Năm người. Em ứng cho năm người khó nhất trước.
    { RANDOM(1, 10) <= 4:
        ~ gd_dong_ho_bi_thay = true
        ~ gd_no(10)
        _Chiều, {hong_hot} để ý cổ tay trái của bạn. Trống trơn._
    }
* [🏦 "Lỗi hệ thống ngân hàng thôi. Em nhắn group hộ anh nhé."]
    ~ gd_hua()
    ~ gd_no(5)
    ke_toan: Đúng một nửa thôi anh. Em không nhắn nửa sự thật.
    ~ qh("ke_toan", -10)
* [🙅 Tự nhắn group: "Lương sẽ về sớm thôi. Anh không ép ai chờ, tùy các em."]
    ~ gd_tuy_em("ke_toan")
    ~ gd_uy(-15)
    _Group anti sếp: 37 tin nhắn mới trong 5 phút._
* {biet(quy_den_thuong)} [🔒 "{ke_toan}… anh biết em có để dành một khoản phòng thân."]
    _{ke_toan} im lặng rất lâu. Rất, rất lâu._
    ke_toan: Ai nói với anh?
    giam_doc: Anh cần lương về hôm nay.
    ke_toan: … Dạ. Hôm nay có lương.
    ~ qh("ke_toan", -30)
    ~ gd_sua("luong_dung_han")
    ~ gd_uy(5)
    _Một tiếng sau ngân hàng mở lệnh, khoản phòng thân không cần dùng tới. Nhưng {ke_toan} không nhìn bạn suốt buổi chiều. Có lẽ sẽ không bao giờ tin bạn hoàn toàn nữa._
- _10:00, ngân hàng mở lệnh. Lương về trễ đúng 2 ngày._
~ gd_no(3)
-> END

// ------------------------------------------------------------
=== giam_doc_1210_the_phu_long ===
# ngay:12 # gio:12:30 # noi:quan_com_tam
_Trưa. Điện thoại réo. {con_ong_chau_cha}._
con_ong_chau_cha: Chú ơi! Thẻ phụ của con bị từ chối ở Sống Ảo! Quê muốn độn thổ luôn! Thẻ đó gắn tài khoản riêng của chú mà?
_Tài khoản riêng của bạn gần như trống từ tháng 8. Sáng nay còn đúng 4,2 triệu._
_Bên cạnh, {thuc_tap_sinh} rút ví trả tiền cơm. Một chiếc thẻ màu đen viền kim cương rơi ra bàn._
thuc_tap_sinh: Dạ… dạ thẻ này… em nhặt được ạ! *(nhét vội vào túi)*
* [😮‍💨 Nói với {con_ong_chau_cha}: "Chú đang khó. Tháng này cháu tự lo nhé."]
    con_ong_chau_cha: … Chú khó hả? Chú mà cũng khó hả?
    ~ qh("con_ong_chau_cha", 10)
    ~ gd_no(5)
    _Đầu dây bên kia im lặng. Rồi: "Dạ. Để con tự lo." Giọng nó lạ lắm. Giống giọng người lớn._
* [🎭 "Lỗi máy quẹt thôi. Cháu gọi lại ngân hàng đi."]
    ~ gd_hua()
    con_ong_chau_cha: Dạ… để anh… à để con gọi.
* [💬 Quay sang {thuc_tap_sinh}: "Thẻ kim cương à? Em nhặt ở đâu đấy?"]
    thuc_tap_sinh: Dạ… ở… ở ngân hàng ạ! Dạ em mới vô nên chưa biết ạ!
    ~ phat_hien(duy_tung_lam_ngan_hang)
    _Gương mặt {thuc_tap_sinh} hơi quen. Như đã gặp ở một bàn làm việc nào đó, năm 2024. Bạn không nhớ ra._
- -> END

// ------------------------------------------------------------
=== giam_doc_1210_group_soi_suc ===
# ngay:12 # gio:22:30 # noi:biet_thu
_Group "Hội Anti Sếp" như chảo dầu._
hong_hot: Lương trễ hai ngày, 10 giờ sáng nay mới về mấy bà ơi. Tui đặt tên chị {ke_toan} là "nữ hoàng lương trễ" nha.
sales: Lương trễ mà sếp vẫn đi golf. Sao mà căng.
{ gd_dong_ho_bi_thay:
    hong_hot: Mà khoan… mấy bà để ý hông, sếp hông đeo đồng hồ nữa.
}
* {gd_dung_clone} [🌻 Gõ: "Lương trễ đâu phải lỗi chị {ke_toan}."]
    ~ gd_nghi_clone = gd_nghi_clone + 10
    ~ qh("ke_toan", 5)
    hong_hot: Ủa bông hoa bênh bả hả? Bông hoa là phòng kế toán hả?
* {gd_dung_clone} [📝 Ghi tên {hong_hot} vào Danh sách đen.]
    ~ gd_danh_sach_den = gd_danh_sach_den + 1
    ~ gd_da_tra_thu = true
    ~ qh("hong_hot", -15)
* [📲 Nhắn group công ty (bằng tài khoản thật): "Lương về trễ là lỗi của anh, không phải của {ke_toan}. Anh xin lỗi."]
    ~ gd_uy(5)
    ~ qh("ke_toan", 15)
    ~ gd_no(5)
    _Group công ty im lặng. Group anti sếp cũng im lặng. Ba phút sau, {chi_dai} thả một trái tim._
* [😶 Tắt máy.]
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== giam_doc_1310_ngay_doanh_nhan ===
# ngay:13 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Ngày Doanh nhân Việt Nam. Trên bàn bạn: một bó hoa rất to. Thiệp ghi "Gửi {giam_doc}, từ {giam_doc}"._
thanh_ninh: Sếp ơi, em viết bài phát biểu khen sếp, 15 phút thôi ạ. Em đọc liền nha sếp!
sales: Còn đây là quà của em! *(mở hộp)* Giải "Doanh nhân của năm" do Tập đoàn BTT Global trao tặng! Mr. Kevin Trộn gửi lời chúc mừng anh!
_Tấm bằng khen in màu, dấu đỏ hơi nhòe. Logo BTT trông như vẽ bằng phần mềm có sẵn._
* [🏆 Treo ngay lên tường, giữa ảnh với người nổi tiếng.]
    ~ gd_uy(3)
    ~ qh("sales", 10)
    ~ qh("thanh_ninh", 5)
    _Bằng khen hơi nghiêng. Bạn sửa cho thẳng. Bạn không hỏi Mr. Kevin Trộn là ai._
* [🧾 "{sales}, cho anh số điện thoại của Mr. Kevin Trộn. Anh gọi cảm ơn."]
    sales: Dạ… ổng đang ở… nước ngoài! Lệch múi giờ lắm anh!
    ~ qh("sales", -10)
    ~ gd_uy(5)
    _Bạn vẫn treo tấm bằng. Hơi buồn khi biết mình được khen bởi một người không có thật._
* [🌸 "{thanh_ninh}, bài khen để dành dịp khác. Bó hoa này mang xuống tặng chị lao công."]
    thanh_ninh: Dạ… sếp tặng hoa cho chị lao công… sếp nhân văn quá anh ơi!
    ~ gd_sua("tra_sua")
    ~ gd_uy(5)
    ~ qh("chi_dai", 5)
- _Tối, group anti sếp đăng một ảnh chế: bạn ôm bó hoa tự tặng, chú thích "Doanh nhân tự thưởng của năm"._
* {gd_dung_clone} [😂 Đăng nhập "Hoa Hướng Dương 1989", thả haha vào ảnh chế chính mình.]
    _Bạn thả haha. Rồi cười thật. Ảnh chế đúng là buồn cười._
    ~ cang_thang(-5)
* {gd_dung_clone} [😶 Không thả gì.]
    ~ gd_nghi_clone = gd_nghi_clone + 15
    hong_hot: Ủa bông hoa sao hông haha? Bông hoa thương sếp hả?
* {not gd_dung_clone} [😶 Bạn chỉ nghe {thanh_ninh} kể lại. Bạn cười trừ.]
    ~ cang_thang(3)
- -> END

// ------------------------------------------------------------
=== giam_doc_1110_nha_vuon_ven_do ===
# ngay:11 # gio:15:00 # noi:nha_vuon_binh
_Chủ nhật. Bạn lái xe ra Ven Đô, đường đất đỏ, ruộng rau xanh rì. Trên ghế phụ: một hộp trà mạn và hai cây xúc xích._
_Nhà cấp 4 có vườn. Bác {bac_bao_ve} đang đánh cờ tướng với Ông Ba trà đá. {cho} chạy ra cổng, ngửi giày bạn, rồi vẫy đuôi._
bac_bao_ve: Ơ, cậu {giam_doc}. Ra đây làm gì?
{ qh_bac_bao_ve >= 20:
    giam_doc: Hôm qua là sinh nhật bác. Cháu mang ít trà.
    bac_bao_ve: *(cầm hộp trà, xoay xoay)* … Ừ. Vào nhà đi.
- else:
    giam_doc: Cháu đi ngang qua, ghé bác uống nước.
    bac_bao_ve: Ven Đô mà đi ngang qua. Ừ. Vào đi.
}
~ gd_tham_nha_binh = true
~ gd_tra_binh = gd_tra_binh + 1
_Trong nhà, cạnh bàn thờ, có một cái tủ gỗ cũ, khóa đồng. Trên nóc tủ là một chồng phong bì, nét chữ quen quen. Một con dấu đỏ in hình chữ G lấp ló trong khe tủ._
* [💬 "Tủ này bác giữ gì mà khóa kỹ thế ạ?"]
    bac_bao_ve: Đồ người ta gửi. Không phải của bác.
    _Bác không nói thêm. Bạn cũng không hỏi thêm. Nhưng bạn nhớ con dấu chữ G._
    ~ phat_hien(binh_tai_mat_g)
* [🐕 Ngồi xuống cho {cho} ăn xúc xích, không hỏi gì.]
    ~ qh("cho", 15)
    { co(xuc_xich):
        ~ mat(xuc_xich)
    }
    cho: Gâu! *(gác mõm lên đầu gối bạn)*
    bac_bao_ve: Nó ít khi gác mõm lên chân ai đâu.
* [♟️ "Bác cho cháu chơi một ván."]
    _Bạn thua sau 14 nước. Lần này không phải thua có tính toán._
    ~ qh("bac_bao_ve", 10)
    ~ cang_thang(-10)
- ~ uong(20)
-> END
