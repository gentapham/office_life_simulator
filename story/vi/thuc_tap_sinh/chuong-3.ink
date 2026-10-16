// ============================================================
// THỰC TẬP SINH · CHƯƠNG 3: "THANH NIÊN 30 TUỔI" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== thuc_tap_sinh_1310_ngay_doanh_nhan ===
# ngay:13 # gio:10:00 # noi:sanh_tang_tret # bat_buoc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho chính mình. Trên tường phòng giám đốc treo giải "Doanh nhân của năm" của BTT Global, viền vàng, chữ hơi lem._
_{thanh_ninh} vừa đọc xong bài khen 15 phút. Giờ tới lượt {giam_doc} phát biểu. Bạn đứng cuối sảnh, bưng khay cà phê._
giam_doc: Hồi anh đi vay vốn để cứu công ty, các em ạ, ông trưởng phòng ngân hàng để ria mép, đeo kính gọng vàng, nhìn anh như nhìn con nợ…
_Ly cà phê trên khay rơi xuống sàn. Choang._
_Ria mép. Kính gọng vàng. Năm 2024. Một người đàn ông đeo khẩu trang, kính đen, vay thế chấp một căn biệt thự "để cứu công ty"._
_Không thể nào. Không. Thể. Nào._
giam_doc: Ơ… thực tập sinh, em không sao chứ?
* [😶 "Dạ em xin lỗi anh, em trượt tay ạ." (cúi xuống lau)]
    _Bạn lau sàn rất lâu. Lâu hơn cần thiết. Để không ai thấy mặt bạn lúc này._
    ~ duy_ngo(3)
    ~ cang_thang(20)
* [❓ "Dạ… anh vay ở ngân hàng nào vậy anh?"]
    giam_doc: *(khựng lại)* Ơ… cái đấy là chuyện riêng của anh. Em check lại cái mindset hỏi han giúp anh.
    _Cả sảnh im. {ke_toan} nhìn bạn. {thanh_ninh} nhìn {giam_doc}. {ran_doc} nhìn tất cả mọi người._
    ~ qh("giam_doc", -5)
    ~ duy_lo(3)
    ~ duy_ngo(-5)
* [🏦 Nhìn kỹ dáng đi, giọng nói của {giam_doc}.]
    _Bạn nhìn. Dáng người. Giọng Bắc. Cái cách nói "anh không ép, tùy em". Năm 2024, ông khách đeo kính đen cũng nói đúng câu đó, khi bạn hỏi có muốn đọc lại điều khoản không._
    ~ duy_kn(2)
    ~ duy_lo(1)
    ~ cang_thang(15)
- _Tối đó, bạn ngồi trên giường tầng, nhìn tờ lịch. 15/11. Ngày đáo hạn của khoản vay mà bạn nhớ mang máng. Bạn không chắc. Bạn không dám chắc._
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1410_son_nghi ===
# ngay:14 # gio:08:45 # noi:ban_lam_viec # bat_buoc
_Ngày Hội Nông dân. {thanh_xin_nghi} xin nghỉ "về quê phụ gặt lúa". Bàn điều phối lịch nghệ sĩ trống trơn, tuần gameshow._
chua_te_deadline: Anh {thuc_tap_sinh}, em nhờ xíu. Anh cầm lịch điều phối thay {thanh_xin_nghi} hôm nay nha. Có gì hỏi em. À mà em đi họp rồi, hỏi anh {quan_ly_idol}.
~ duy_day_viec(2)
~ duy_da()
thuc_tap_sinh: Dạ em làm liền ạ! Dạ… điều phối lịch là sao ạ?
_Một file Excel 14 tab. Tab nào cũng tên "Lich_moi". Màu đỏ, vàng, xanh không theo quy luật nào._
* [🧮 Sắp xếp lại file Excel cho chuẩn, như sắp hồ sơ tín dụng.]
    _40 phút. 14 tab thành 1 tab. Màu đỏ là trễ, vàng là sắp tới, xanh là xong. Có cột "người chịu trách nhiệm". Có cả công thức tự đếm ngày._
    quan_ly_idol: *(nhìn màn hình, đặt cả hai điện thoại xuống)* Em… em làm cái này hả? Ai dạy em?
    thuc_tap_sinh: Dạ… em mới vô nên tự mò thôi ạ.
    ~ duy_kn(6)
    ~ duy_lo(4)
    ~ qh("quan_ly_idol", 10)
* [📞 Gọi điện hỏi từng người: "Dạ hôm nay anh chị rảnh giờ nào ạ?"]
    _Bạn gọi 9 cuộc. Ai cũng rảnh "tùy". Bạn ghi "tùy" vào 9 ô. Lịch tuần này: tùy._
    ~ duy_kn(2)
    ~ nghi(-15)
* [🛡️ Đi tìm {chi_dai}: "Dạ chị ơi, em không biết làm ạ."]
    ~ duy_lan_goi_huong++
    chi_dai: Đưa đây. *(làm trong 10 phút)* Lần sau em tự làm. Chị chỉ một lần.
    ~ qh("chi_dai", 3)
    ~ duy_kn(3)
- _17 giờ. Mốc 2: 200.000 người theo dõi._
{ nguoi_theo_doi >= 200000:
    hong_hot: {nguoi_theo_doi}! Qua mốc 2!
    _Bạn vỗ tay. Bạn không biết mình góp được bao nhiêu trong con số đó, nhưng bạn biết cái clip rung tay hôm 6/10 có trong đó._
    ~ duy_lua_doi(3)
- else:
    hong_hot: Trượt mốc 2… {nguoi_theo_doi}.
    _Siêu Nhân Hồng không nói gì. Chiều đó {sieu_nhan_hong} bỏ đi giúp người tới tối. Bạn được giao "xin lỗi đoàn quay" vì {sieu_nhan_hong} đi mất._
    ~ duy_day_viec(1)
}
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1510_thanh_nien ===
# ngay:15 # gio:08:05 # noi:sanh_tang_tret # bat_buoc
_8 giờ 05. "Phụt." Cả tòa nhà tối om. Mất điện cả ngày._
_Từ thang máy vọng ra tiếng đập cửa. Giọng {giam_doc} và giọng {chi_dai}._
giam_doc: *(trong thang máy)* Bình tĩnh! Anh không ép, tùy em, nhưng em đừng đấm cửa nữa!
_Hôm nay cũng là Ngày Thanh niên Việt Nam. Trên group, {hong_hot} vừa đăng: "Thanh niên đâu, điểm danh!"_
* [🧯 Chạy ra chòi tìm Bác {bac_bao_ve} lấy chìa thang máy.]
    bac_bao_ve: Ừ. Bác có chìa. Cháu cầm đèn pin soi giúp bác.
    _Cửa thang máy mở. {chi_dai} bước ra trước, thấy bạn cầm đèn pin, gật đầu: "Được đấy."_
    ~ qh("chi_dai", 5)
    ~ qh("giam_doc", 5)
    ~ qh("bac_bao_ve", 3)
    ~ duy_kn(2)
* [🙋 Đứng giữa sảnh: "Dạ em 30 tuổi nhưng em vẫn là thanh niên ạ!"]
    hong_hot: *(bật đèn điện thoại quay)* Ối dồi ôi! Thanh niên 30 tuổi điểm danh!
    _Clip lên group. 22 người thả "haha". 1 người thả tim. Người đó là {con_ong_chau_cha}._
    ~ duy_ngo(5)
    ~ duy_lua_doi(3)
    ~ follow(2000)
* [🙇 "Dạ để em lên tầng 1 xếp đèn sạc cho mọi người ạ."]
    ~ duy_da()
    ~ duy_day_viec(1)
    ~ duy_kn(1)
- _Ở phòng họp "Sáng Tạo", {truong_phong} thắp nến, họp. Ánh nến hắt lên bảng trắng. Bạn được giao cầm nến._
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1510_sac_du_phong ===
# ngay:15 # gio:14:00 # noi:pantry # bat_buoc
_14 giờ. Điện thoại cả công ty bắt đầu đỏ pin. {chua_te_deadline} ngồi góc pantry, laptop 12%, kịch bản gameshow phải nộp đài 9 giờ sáng mai._
_Trong balo bạn có 5 cục sạc dự phòng. Vỏ nhôm. Sạc nhanh. Loại bạn mua hồi còn đi công tác, mỗi cục bằng nửa tháng lương thực tập._
* [🔋 Phát hết cả 5 cục cho mọi người.]
    _Cục 1 cho {chua_te_deadline}. Cục 2 cho {hong_hot}. Cục 3 cho {quan_ly_idol}, người cầm 2 điện thoại. Cục 4 cho {chi_dai}. Cục 5 cho {editor}._
    hong_hot: *(soi cục sạc dưới đèn điện thoại)* Ủa… cái hãng này… sao thực tập sinh có nhiều sạc xịn vậy?
    ~ duy_lo(5)
    ~ qh("chua_te_deadline", 10)
    ~ qh("hong_hot", 3)
    ~ qh("quan_ly_idol", 5)
    ~ follow(5000)
* [🔋 Đưa 1 cục cho {chua_te_deadline} thôi, giấu 4 cục còn lại.]
    chua_te_deadline: Cứu tinh! Anh {thuc_tap_sinh} ơi em thương anh!
    ~ duy_lo(3)
    ~ qh("chua_te_deadline", 8)
* [😶 Không đưa. Ai lại thắc mắc.]
    _4 tiếng sau, {chua_te_deadline} hết pin. Bạn nghe tiếng thở dài ở góc pantry. Tay bạn sờ vào balo mấy lần._
    ~ duy_lua_doi(-3)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1510_trong_bong_toi ===
# ngay:15 # gio:20:10 # noi:pantry # bat_buoc
_20 giờ 10. Pantry tối om. Lúc nãy {idol_het_thoi} vừa hát khe khẽ "Công Viên" trong bóng tối. chỉ có ánh đèn điện thoại. Ở góc kia, {sieu_nhan_hong} không đội mũ, ngồi cạnh {chua_te_deadline}, nói chuyện nhỏ nhỏ. Không ai làm phiền họ._
_{chi_dai} ngồi xuống cạnh bạn, đưa cho bạn nửa ổ bánh mì._
chi_dai: Ăn đi. Mà nè, chị hỏi thiệt. Hồi trước em làm gì? Thằng nào đi thực tập mà mang 5 cục sạc xịn, cầm ly cà phê như cầm ly rượu vang vậy?
~ an(25)
* [😶 "Dạ hồi trước em làm bảo vệ ngân hàng ạ."]
    chi_dai: *(nheo mắt)* Ừ. Bảo vệ.
    _{chi_dai} không tin. Nhưng {chi_dai} không hỏi nữa. Chị nhai bánh mì, nhìn ra cửa sổ tối._
* [🤝 "Dạ… em từng làm ở ngân hàng. Làm lớn một chút. Chị giữ giùm em nha chị."]
    chi_dai: *(im lặng một lúc, rồi gật đầu)* Đứa nào hỏi mượn tiền em, chỉ mặt chị.
    ~ qh("chi_dai", 20)
    ~ duy_huong_biet = true
    ~ phat_hien(duy_tung_lam_ngan_hang)
    _{chi_dai} biết rồi. Và bạn biết chắc một điều: chị sẽ không bao giờ nói._
* [🎲 "Dạ chị đoán đi ạ."]
    chi_dai: Đoán hả? Ê mấy đứa! Đoán coi thằng {thuc_tap_sinh} hồi trước làm gì!
    hong_hot: Diễn viên!
    con_ong_chau_cha: Người mẫu nam?
    ran_doc: *(từ bóng tối, rất nhẹ)* Ngân hàng.
    _Cả pantry im một giây. Rồi ai đó cười, nói "giỡn hoài". Nhưng {ran_doc} không cười._
    ~ duy_lo(8)
- _Trong bóng tối, bạn nghe Siêu Nhân Hồng nói gì đó với {chua_te_deadline}, giọng nhỏ, run run. Bạn không nghe rõ. Bạn chỉ nghĩ: người mặc đồ hồng hóa ra cũng biết run._
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1610_gameshow ===
# ngay:16 # gio:15:20 # noi:dai_tivi_hong # bat_buoc
_Ghi hình gameshow "Hồng Hay Không Hồng" ở Đài Tivi Hóng, 20 giờ tối nay mới phát sóng. Bạn ngồi hàng khán giả, giơ bảng cổ vũ tự làm: "HỒNG LÀ THÁI ĐỘ – THỰC TẬP SINH LÀ ĐỘNG LỰC"._
_Phần "Hit Một Thời". {sieu_nhan_hong} hát "Công Viên"… và hát sai: "thích ăn… KHOAI CHIÊN!". Cả trường quay im phăng phắc._
_Bạn thấy ở cánh gà, {idol_het_thoi} đứng chết trân. Bạn ngồi ngay hàng đầu, gần cánh gà nhất._
* [📣 Đứng dậy hát to câu đúng: "…thích ăn CHUỐI CHIÊN!"]
    _Bạn hát lạc tông. Nhưng to. Khán giả hàng đầu hát theo. Rồi hàng hai. Rồi cả trường quay._
    _Ở cánh gà, {idol_het_thoi} nghe thấy, bước ra, cầm micro hát bè. Hai giọng hòa vào nhau, cộng thêm giọng lạc tông của bạn._
    ~ follow(20000)
    ~ qh("idol_het_thoi", 10)
    ~ duy_lua_doi(10)
* [🪧 Lật bảng cổ vũ, viết vội: "CHUỐI CHIÊN!" giơ lên cho {sieu_nhan_hong} thấy.]
    _{sieu_nhan_hong} thấy. {sieu_nhan_hong} hát lại câu cuối, sửa thành "chuối chiên", rồi tạo dáng chỉ thẳng vào bạn. Camera quay theo._
    ~ follow(10000)
    ~ qh("sieu_nhan_hong", 8)
    ~ duy_kn(2)
* [😶 Ngồi im, cầm bảng.]
    _"Khoai chiên" lên xu hướng trong 20 phút. Bạn ngồi im, bảng cổ vũ trên đùi, nghĩ: mình 30 tuổi rồi, đứng dậy hát giữa trường quay thì kỳ._
    ~ duy_ngo(3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1610_buffet ===
# ngay:16 # gio:21:40 # noi:tang_1
_Ngày Lương thực Thế giới. Liên hoan buffet ở công ty. Bạn được giao dọn dẹp. Phần thưởng: mang đồ ăn thừa về._
chi_dai: {thuc_tap_sinh}, dọn xong thì về. Mai 6 giờ 30 xe chạy đi Vũng Tàu. Đồ thừa em gói về hết đi, chị cho phép.
_Bàn buffet còn: nửa khay gà rán, 2 hộp cơm chiên, một đĩa bánh bông lan, và một cái bánh kem hồng gần nguyên._
* [🍗 Gói hết về cho 3 bạn cùng phòng.]
    _11 giờ đêm, phòng 12 dãy B bừng sáng. Anh thợ hồ ôm hộp gà, bạn sinh viên ôm bánh kem, anh xe ôm khóc vì cơm chiên ngon. Tháp mì gói được nghỉ một đêm._
    ~ duy_an_do_thua++
    ~ an(40)
    ~ duy_lua_doi(5)
    ~ cang_thang(-10)
* [🤝 Chia một nửa cho Bác {bac_bao_ve} và {cho}.]
    bac_bao_ve: Ừ. Cảm ơn cháu. Gà rán thì {cho} không được ăn nhiều đâu đấy.
    cho: *(nhìn gà rán, nhìn bác, nhìn bạn)* Gâu…
    ~ qh("bac_bao_ve", 5)
    ~ qh("cho", 5)
    ~ duy_an_do_thua++
    ~ an(30)
* [🙇 Dọn cả kho sự kiện giùm {chi_dai} luôn.]
    ~ duy_da()
    ~ duy_day_viec(1)
    ~ nghi(-20)
    ~ duy_kn(2)
    chi_dai: *(sáng mai đi ngang kho)* Ai dọn? … Thằng nhỏ này. Thằng nhỏ 30 tuổi này.
    ~ qh("chi_dai", 5)
- -> END
