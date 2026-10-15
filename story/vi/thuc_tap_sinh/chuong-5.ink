// ============================================================
// THỰC TẬP SINH · CHƯƠNG 5: "CHỮ KÝ CỦA CHÍNH MÌNH" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== thuc_tap_sinh_2110_confession ===
# ngay:21 # gio:09:15 # noi:tang_1 # bat_buoc
_Trang "Confession {cong_ty}" đăng bài ẩn danh: "Có ai biết sếp mình đem biệt thự đi thế chấp không?"_
_Cả tầng 1 xôn xao. Bạn đọc bài đó 3 lần. Biệt thự. Thế chấp. Bạn nhớ một hồ sơ năm 2024. Một căn biệt thự trên Đồi Ngân Hàng._
_{hr} và {it} đi từng bàn "hỏi thăm"._
hr: Em {thuc_tap_sinh}, tối qua em làm gì từ 22 tới 23 giờ? Anh chỉ muốn lắng nghe em thôi.
* [😶 "Dạ em ngủ ạ. Phòng em 4 người, 3 người làm chứng ạ."]
    hr: Ừ. 3 nhân chứng. Ngoan.
    ~ duy_ngo(2)
* [❓ "Dạ anh ơi, bài này đăng từ máy nào ạ? Log có ghi tên máy không ạ?"]
    it: *(liếc bạn, rất nhanh)* … Có.
    hr: Ồ, em hỏi đúng câu anh định hỏi {it} đó em.
    _{it} đóng laptop lại, nhìn bạn một giây lâu hơn bình thường. Bạn vừa hỏi một câu quá trúng._
    ~ duy_ngo(-5)
    ~ qh("it", -3)
    ~ qh("hong_hot", -5)
* [🏦 "Dạ… nếu thế chấp thật thì mình nên xem ngày đáo hạn ạ."]
    hr: *(ngưng cười một giây)* Em nói gì?
    thuc_tap_sinh: Dạ… em đọc báo ạ.
    ~ duy_lo(8)
- -> thuc_tap_sinh_2110_moc_3

= thuc_tap_sinh_2110_moc_3
_17 giờ. Mốc 3: 500.000 người theo dõi._
{ nguoi_theo_doi >= 500000:
    hong_hot: {nguoi_theo_doi}! Qua mốc 3! Mà hôm nay hông ai có tâm trạng ăn mừng…
- else:
    hong_hot: Trượt mốc 3. {nguoi_theo_doi}.
    _Từ chiều đó, tin đồn "cắt giảm nhân sự" bắt đầu chạy khắp công ty. Ai cũng nói: thực tập sinh là cắt đầu tiên._
    ~ cang_thang(15)
    ~ duy_lua_doi(-5)
}
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2210_doan_thue ===
# ngay:22 # gio:09:40 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế. Trưởng đoàn Chú Liêm, 55 tuổi, kính lão. Đòi bản gốc giấy tờ thành lập, hợp đồng BTT, bằng chứng nghiệm thu dự án tháng 6, và nguồn gốc 5 tỷ._
_{ke_toan} bị ngập giấy tờ tới cằm. Bạn xung phong phụ._
ke_toan: Em xếp được không? 10 năm hồ sơ. Không theo thứ tự nào hết.
_Bạn xếp. Theo năm, theo loại, theo số chứng từ, có thẻ màu. Chuẩn ngân hàng. 20 phút._
ke_toan: *(nhìn chồng hồ sơ, nhìn đồng hồ, nhìn bạn)* … 20 phút. Chị làm 3 ngày chưa xong.
~ duy_kn(10)
~ duy_lo(10)
_Rồi trong xấp năm 2024, bạn cầm lên một tờ giấy: Hợp đồng thế chấp căn biệt thự số 1, Đồi Ngân Hàng. Người vay: {giam_doc}. Ngân hàng Tín Dụng Đen Đủi._
_Góc dưới, ô "Phê duyệt": Trưởng phòng Tín dụng, D. Một chữ ký nghiêng, đều. Chữ ký của chính bạn. 2 năm trước._
_Ngày đáo hạn: 15/11/2026._
~ duy_thay_chu_ky = true
~ phat_hien(the_chap_biet_thu)
ke_toan: Duy, xếp xong chưa em? Đoàn đòi hồ sơ năm 2024 kìa.
* [😶 Xếp vào đúng chỗ, không nói gì.]
    _Bí mật giữ nguyên. Tờ giấy nằm đúng thứ tự, đúng thẻ màu. Chỉ có tay bạn là không đúng thứ tự nữa._
    ~ cang_thang(20)
    ~ nghi(-20)
* [🤝 "Dạ chị {ke_toan}, khoản vay này 15/11 là tới hạn. Nếu không trả, ngân hàng phát mãi trong 30 ngày đó chị."]
    ke_toan: *(nhìn bạn rất lâu)* … Sao em biết?
    thuc_tap_sinh: Dạ… em… em từng làm ở đó ạ.
    ke_toan: *(đóng cửa phòng kế toán lại)* Ngồi xuống. Từ giờ, hai đứa mình biết sổ. Không ai khác.
    ~ duy_hai_nguoi_biet_so = true
    ~ duy_lo(25)
    ~ qh("ke_toan", 20)
* {duy_kinh_nghiem >= 50 && qh_giam_doc >= 30} [🔒 "Dạ chị cho em gặp anh {giam_doc} 10 phút. Em nghĩ em giúp được khoản này."]
    ke_toan: *(nhíu mày, rồi gật)* 17 giờ. Phòng giám đốc. Chị đi cùng.
    ~ duy_nhanh_nguoi_gac_ket = true
    ~ duy_lo(15)
    ~ qh("ke_toan", 10)
* [📞 Ra hành lang, gọi cho sếp cũ ở ngân hàng.]
    _"Alo, anh Tư ạ… Dạ em Duy… Dạ em hỏi khoản vay thế chấp biệt thự số 1 Đồi Ngân Hàng, có cách nào giãn không anh?"_
    _Sếp cũ cười: "Mày hỏi khoản đó làm gì? À mà mày về đi. Ghế phó giám đốc chi nhánh còn trống. Chủ nhật anh gọi lại."_
    ~ duy_kn(3)
    ~ duy_lo(5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2210_chu_liem ===
# ngay:22 # gio:11:30 # noi:sanh_tang_tret
_Chú Liêm xuống sảnh xem "cơ sở vật chất". Đúng lúc {cho} chạy ra từ gầm cầu thang._
cho: Gâu!
_Chú Liêm nhảy lên ghế lễ tân với tốc độ của một vận động viên 25 tuổi._
* [🐕 "Tuất, ngồi!" (giọng của người đã tắm cho nó)]
    cho: *(ngồi xuống ngay, vẫy đuôi)* Gâu.
    _Chú Liêm bước xuống, chỉnh kính: "Cảm ơn cháu. Chú… dị ứng lông chó." Rồi chú hỏi tên bạn, ghi vào sổ. "Cháu xếp hồ sơ hả? Xếp đẹp. Lâu rồi chú mới thấy bộ hồ sơ có thẻ màu."_
    ~ qh("cho", 5)
    ~ duy_kn(3)
* [🦴 Lấy xúc xích dụ {cho} ra chòi.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        cho: *(theo cây xúc xích ra chòi như theo một người yêu)* Gâu gâu!
        ~ qh("cho", 8)
    - else:
        _Bạn không có xúc xích. Bạn giả vờ có. {cho} nhìn bàn tay trống của bạn bằng ánh mắt bị phản bội._
        ~ qh("cho", -3)
    }
* [😶 Đứng nhìn. Cố không cười.]
    _Bạn quay mặt vào tường 30 giây. Vai rung._
    ~ cang_thang(-5)
- _Chú Liêm quay lại phòng họp, hỏi câu cuối: "5 tỷ của đối tác Siêu Nhân Hồng, nguồn gốc ở đâu?". Không ai trả lời được. Siêu Nhân Hồng chỉ nói: "Tiền sạch mà chú! Hồng là thái độ!"_
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2210_ong_ria_mep ===
# ngay:22 # gio:17:00 # noi:phong_giam_doc # dieu_kien:duy_nhanh_nguoi_gac_ket
{ not duy_nhanh_nguoi_gac_ket:
    _17 giờ. Bạn ngồi photo biên bản của đoàn thuế. Phòng giám đốc đóng cửa. Không ai mời bạn vào._
    -> END
}
_17 giờ. Phòng giám đốc. {giam_doc} ngồi sau bàn, giải "Doanh nhân của năm" treo sau lưng. {ke_toan} đứng ở cửa._
giam_doc: {ke_toan} bảo em có chuyện. Thực tập sinh có chuyện gì với anh? Anh không ép, tùy em nói.
_Bạn đặt tờ hợp đồng thế chấp lên bàn. Chỉ vào ô phê duyệt. Rồi bạn lấy trong ví ra một tấm ảnh thẻ cũ: một người đàn ông mặc vest, kính gọng vàng, ria mép "cho có uy"._
_{giam_doc} nhìn tấm ảnh. Nhìn chữ ký. Nhìn bạn. Rất lâu._
giam_doc: Ông… là ông ria mép?
* [🤝 "Dạ. Em là người duyệt khoản vay của anh năm 2024. Em biết ngân hàng sẽ làm gì ngày 15/11."]
    giam_doc: *(đứng dậy, ngồi xuống, đứng dậy)* Thế… thế em vào đây làm gì? Ngân hàng cử em vào à?
    thuc_tap_sinh: Dạ không. Em vào đây để cầm tấm hắt sáng ạ.
    _{giam_doc} bật cười. Cười tới chảy nước mắt. Rồi nước mắt không phải vì cười nữa._
    giam_doc: Em giúp anh được không?
    ~ qh("giam_doc", 25)
    ~ duy_kn(5)
* [😶 "Dạ… em chỉ muốn anh biết. Em không đòi gì hết."]
    giam_doc: … Anh cảm ơn em. Anh… anh xin lỗi vì hôm đó nhìn em như nhìn con nợ. À không, em nhìn anh như nhìn con nợ.
    thuc_tap_sinh: Dạ, anh lúc đó đúng là con nợ mà anh.
    giam_doc: *(cười khổ)* Ừ. Vẫn là con nợ.
    ~ qh("giam_doc", 15)
- ~ phat_hien(nguoi_gac_ket)
~ duy_lo(10)
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2310_banh_chuoi_chien ===
# ngay:23 # gio:08:00 # noi:phong_cho_snh
_Sinh nhật Siêu Nhân Hồng. 8 giờ sáng. Bạn được giao mua bánh chuối chiên cho phòng chờ, như mọi ngày. Hôm nay mua gấp đôi._
_Xe đẩy đầu hẻm. Cô bán bánh nhìn bạn: "Lại cho cái cậu mặc đồ hồng hả con? Cậu đó hay mua của cô lắm, hồi trước còn đẩy xe giùm cô lúc mưa."_
* [💬 "Dạ cô, ảnh đẩy xe giùm cô hả? Lúc nào vậy cô?"]
    _"Lâu rồi con. Trời mưa là cậu đó đi khắp phường. Gặp ai chết máy cũng đẩy, hông cần biết người ta là ai."_
    _Bạn chợt nhớ một buổi chiều mưa, một bộ đồ hồng nhòe nước, 2 cây số. Rồi bạn lắc đầu. Thành phố này đâu thiếu người mặc đồ hồng._
    ~ duy_lua_doi(5)
* [🍌 Mua thêm một phần, viết thiệp "Chúc mừng sinh nhật anh Hồng".]
    ~ tien_cong(-40000)
    ~ qh("sieu_nhan_hong", 8)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2310_kevin_tron ===
# ngay:23 # gio:19:40 # noi:studio_tang_2 # bat_buoc
_Livestream sinh nhật. {sales} cần một người đóng vai "Mr. Kevin Trộn", chủ tịch BTT Global, lên sóng chúc mừng. Chủ tịch đó không có thật. Ai cũng biết, trừ khán giả._
sales: Em {thuc_tap_sinh}! Em đeo vest đẹp nhất công ty! Tin chị đi, em là Kevin Trộn!
* [👔 Đeo vest, kính gọng vàng (lần đầu sau 1 năm), lên sóng.]
    _Bạn lên sóng. Vest. Kính gọng vàng. Giọng trầm, chậm, chuyên nghiệp: "BTT Global chúc mừng đối tác chiến lược. Chúng tôi đánh giá cao tiềm năng tăng trưởng của thương hiệu Hồng."_
    _Livestream bùng nổ. Bình luận: "Ông chủ tịch này nhìn thật dữ vậy?", "Giọng như giám đốc ngân hàng"._
    ~ follow(20000)
    ~ duy_lo(15)
    ~ qh("sales", 15)
    giam_doc: *(đứng sau camera, nhìn bạn, lẩm bẩm)* Cái dáng này… quen quá…
* [🙅 "Dạ em ngại lắm chị. Để anh {dan_dau_tu} đóng ạ."]
    dan_dau_tu: Anh hả? Ok! *(đội mũ lưỡi trai, nói giọng Anh rất Quận Hóng)* Hê lô, ai em Kevin!
    _Livestream cười ngất. Không ai tin đó là chủ tịch. Nhưng ai cũng vui._
    ~ follow(8000)
    ~ duy_lo(-3)
* [🛡️ "Dạ để Bác {bac_bao_ve} đóng, bác nhìn uy lắm ạ."]
    bac_bao_ve: *(đứng trước camera 10 giây, không nói gì, gật đầu một cái)* … Ừ. Chúc mừng.
    _Clip 10 giây "chủ tịch kiệm lời nhất lịch sử" lên xu hướng._
    ~ follow(12000)
    ~ qh("bac_bao_ve", 3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2310_giu_banh_kem ===
# ngay:23 # gio:20:30 # noi:studio_tang_2 # bat_buoc
_Bạn được giao giữ cái bánh kem hồng 3 tầng khỏi {cho}, vì "Tuất thương Duy"._
_Giữa livestream, {sieu_nhan_hong} vừa tháo găng tay, nhìn thẳng camera, tỏ tình với {chua_te_deadline}. Cả studio náo loạn. Bình luận chạy như thác._
_Dưới chân bạn, {cho} ngồi im. Nhìn bạn. Nhìn bánh. Nhìn Siêu Nhân Hồng. Nhìn bạn._
cho: … *(vẫy đuôi một lần, rất chậm)* # hen_gio:5
* [🎂 Giữ chặt cái bánh.]
    _Bạn giữ. {cho} nằm xuống, gối đầu lên giày bạn, thở dài như người. Cái bánh được cắt nguyên vẹn. Siêu Nhân Hồng cảm ơn bạn bằng miếng bánh đầu tiên._
    ~ qh("sieu_nhan_hong", 8)
    ~ qh("cho", -3)
    ~ follow(5000)
* [🙈 Quay đi… 3 giây.]
    _1 giây. 2 giây. 3 giây. Tiếng "BỘP". Bánh kem hồng phủ kín {cho}. Livestream 40 nghìn người xem vừa thấy cảnh đẹp nhất năm._
    sieu_nhan_hong: *(nằm luôn xuống sàn, cười, chơi với {cho})* Trời ơi Tuất! Em hồng hơn anh rồi!
    ~ follow(30000)
    ~ qh("cho", 15)
* [⏱️ (Không chọn kịp)]
    _{cho} không chờ bạn quyết định. Nó lao lên. Bánh đổ. Bạn té theo. Livestream thấy cả hai._
    ~ follow(20000)
    ~ qh("cho", 5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2410_hoa_giai ===
# ngay:24 # gio:10:00 # noi:phong_hop_sang_tao
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Các cặp đã xếp. Riêng {dan_dau_tu} ngồi "bàn chủ nợ": đối diện là những người anh đang nợ._
_Bạn ngồi ở bàn chủ nợ. Ghế cuối. Cạnh {it}, {sales}, Bác {bac_bao_ve}._
chi_dai: Mỗi chủ nợ nói một câu với {dan_dau_tu}. Không chửi. Không đòi. Chỉ nói thật.
* {duy_tin_dung_hem_69} [📄 "Dạ anh trả em đúng hạn 2 tuần rồi. Em tự hào về anh ạ."]
    dan_dau_tu: *(rưng rưng)* Lần đầu tiên… có người nói tự hào về anh.
    _Cả bàn chủ nợ nhìn {dan_dau_tu}. Rồi nhìn tờ giấy vay một trang của bạn. {sales} xin chụp lại "để làm mẫu"._
    ~ qh("dan_dau_tu", 15)
    ~ qh("chi_dai", 5)
* [😇 "Dạ, anh không cần trả em 500 nghìn đâu ạ. Anh trả người khác trước."]
    dan_dau_tu: *(nhìn bạn)* Em… em chắc hông?
    _{sales} nhìn bạn như nhìn một vị thánh. {it} nhìn bạn như nhìn một lỗi hệ thống._
    ~ qh("dan_dau_tu", 10)
    ~ duy_lo(5)
* [🧮 Lập bảng trả nợ cho cả 8 chủ nợ, chia theo thu nhập của anh {dan_dau_tu}.]
    _10 phút. Một bảng. Mỗi tuần trả bao nhiêu, cho ai, tới tháng nào xong. {chi_dai} đọc, gật đầu, dán lên tường._
    chi_dai: Bảng này dán đây. Đứa nào thấy {dan_dau_tu} mua coin thì báo chị.
    ~ duy_kn(5)
    ~ duy_lo(10)
    ~ qh("chi_dai", 8)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2510_sep_cu_goi ===
# ngay:25 # gio:10:00 # noi:hem_69 # bat_buoc
_Chủ nhật. 10 giờ. Phòng 12 dãy B. Điện thoại reo. Số máy bàn ngân hàng. Bạn biết số này thuộc lòng._
_"Duy hả. Anh Tư đây. Quay về đi. Ghế phó giám đốc chi nhánh còn trống. 60 triệu. Xe đưa đón. Phòng kính tầng 15, có cửa sổ nhìn xuống đường."_
_Bạn nhìn cái cửa sổ phòng trọ. Nó nhìn thẳng vào bức tường nhà bên. Có rêu._
_Anh thợ hồ ngủ giường trên ngáy. Bạn sinh viên học bài. Anh xe ôm đếm tiền lẻ._
* [🏦 "Dạ… em nhận ạ. Em về sau 31/10."]
    ~ duy_nhan_loi_ngan_hang = true
    _"Được! Anh giữ ghế cho mày tới 1/11." Bạn cúp máy. Thấy nhẹ. Rồi thấy nặng._
    ~ duy_lua_doi(-15)
    ~ cang_thang(-10)
* [😤 "Dạ em cảm ơn anh. Em không về ạ."]
    ~ duy_tu_choi_ngan_hang = true
    _"Mày điên à? 60 triệu! Thực tập 4 triệu!". Bạn cười: "Dạ, 4 triệu mà em vui, anh ạ."_
    _Cúp máy. Anh xe ôm ngẩng lên: "Ai gọi mày mà cười vậy?". "Dạ người quen cũ ạ."_
    ~ duy_lua_doi(15)
* [😶 "Dạ cho em suy nghĩ tới 30/10 ạ."]
    _"Ừ. Anh chờ. Mà đừng để lâu, ghế này nhiều người muốn."_
    _Cái ghế đó luôn có nhiều người muốn. Đó là lý do bạn đứng dậy khỏi nó._
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2610_giao_ban ===
# ngay:26 # gio:08:30 # noi:phong_hop_sang_tao
_Họp giao ban thứ 2. Tin đồn cắt giảm treo lơ lửng trên trần phòng họp như cái quạt trần sắp rớt._
truong_phong: Tuần cuối. Ai còn việc tồn thì báo. Ai cần người phụ thì… *(nhìn bạn)* … thì như mọi khi.
_Cả phòng nhìn bạn. Như mọi khi._
~ duy_day_viec(2)
* [🙇 "Dạ em làm liền ạ."]
    ~ duy_da()
    ~ duy_kn(3)
    ~ nghi(-15)
* [❓ "Dạ, mình có thể ghi lên bảng ai giao việc gì cho em không ạ, để em xếp thứ tự ạ?"]
    truong_phong: *(khựng lại)* … Hợp lý. Tớ thích bảng. Ghi đi.
    _Bảng trắng có 14 dòng. 9 dòng tên {chua_te_deadline}. {chua_te_deadline} nhìn bảng, ho nhẹ._
    ~ duy_kn(5)
    ~ qh("truong_phong", 5)
    ~ duy_ngo(-3)
* {duy_mo_noi_loan && duy_so_lan_noi_loan >= 4} [😤 Đứng dậy. Đọc to danh sách 47 việc vặt đã bị đẩy trong tháng, kể tên từng người.]
    ~ duy_so_lan_noi_loan = duy_so_lan_noi_loan + 2
    _"Ngày 1: 22 ly cà phê, anh {chua_te_deadline}. Ngày 2: bảng tiến độ, anh {chua_te_deadline}. Ngày 5: xếp ghế, anh {truong_phong}…"_
    _Bạn đọc 6 phút. Cả phòng im phăng phắc. Bạn đúng. Từng dòng đều đúng. Nhưng bạn nói theo cách khiến ai cũng thấy mình bị bêu riếu._
    _{chi_dai} nhìn bạn. Lần đầu tiên, chị không bênh._
    ~ qh("chi_dai", -30)
    ~ qh("truong_phong", -15)
    ~ qh("chua_te_deadline", -15)
    ~ uy_tin = uy_tin - 20
    ~ duy_lua_doi(5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2610_hieu_poster ===
# ngay:26 # gio:10:15 # noi:tang_1 # bat_buoc
_Thứ 2. Tin đồn cắt giảm nhân sự đã thành tin chính thức trong lòng mọi người. {ran_doc} ghé bàn bạn, nói rất nhỏ._
ran_doc: Nói nhỏ thôi nha anh {thuc_tap_sinh}. Nghe nói danh sách cắt giảm có tên thực tập sinh đầu tiên đó. Anh giúp tui gửi file poster bản này cho chị {hong_hot} đăng, tui nói tốt cho anh với anh {hr}.
_{ran_doc} đưa bạn một cái USB. Mỉm cười. Ngọt như trà sữa._
* [🙇 "Dạ cảm ơn anh {ran_doc} nhiều lắm ạ! Em gửi liền!"]
    ~ duy_da()
    ~ duy_poster_loi = true
    _Bạn gửi. {hong_hot} đăng trong lúc vội. Poster: sai font, sai màu, mặt Siêu Nhân Hồng bị lật ngược. Bình luận: "Thiết kế bằng chân hả?"_
    ~ follow(-20000)
    ~ qh("ran_doc", 5)
    ~ qh("designer", -5)
* [❓ "Dạ sao anh không tự gửi cho chị {hong_hot} ạ? Chị ngồi ngay đó mà."]
    ran_doc: *(cười gượng)* À… ờ, tui quên. Thôi để tui gửi.
    _{ran_doc} cầm USB đi. Bạn không biết mình vừa né được gì. Từ đó {ran_doc} bắt đầu né bạn._
    ~ duy_ngo(-3)
    ~ qh("ran_doc", -5)
* {duy_do_ngo <= 40} [🔒 Mở file ra xem: "Ủa, poster này sai font, sai màu, mặt anh Hồng bị lật ngược nè."]
    ~ duy_pha_am_muu_hieu = true
    ran_doc: *(mặt cứng lại 1 giây, rồi cười)* Ủa vậy hả? Chắc tui gửi nhầm bản. Cảm ơn anh nha.
    _Lần đầu tiên bạn hiểu vì sao {chi_dai} hay nhìn {ran_doc} bằng ánh mắt đó._
    ~ qh("ran_doc", -30)
    ~ duy_ngo(-10)
    ~ duy_kn(5)
    ~ qh("designer", 5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2610_chieu_thu ===
# ngay:26 # gio:15:00 # noi:phong_hop_sang_tao # bat_buoc
_Chiếu thử nội bộ "Người Hùng Không Tên". Phòng họp kéo rèm. Bạn ngồi hàng cuối._
_Một trưởng phòng tín dụng ngồi trong phòng kính, sinh nhật 30 tuổi. Bỏ việc. Đi làm siêu nhân. Cảnh cuối: trời mưa, xe chết máy, một người lạ mặc đồ hồng đẩy xe giùm 2 cây số._
_Đèn bật. Mọi người vỗ tay. Dòng chữ chạy lên: "Kịch bản: {bien_kich}". Không có tên bạn._
{ duy_poster_loi:
    _Sáng nay bạn còn gửi nhầm poster lỗi. Chiều nay bạn ngồi xem câu chuyện của mình mang tên người khác. Một ngày dài._
    ~ duy_lua_doi(-5)
}
* [😶 Vỗ tay. Cười. Đi ra.]
    ~ duy_lua_doi(-15)
    _Bạn vỗ tay to nhất phòng. Rồi đi ra sân thượng, đứng một mình 20 phút._
* {not duy_doi_chat_oanh} [✍️ Đợi mọi người về, nói riêng với {bien_kich}.]
    thuc_tap_sinh: Dạ chị {bien_kich}. Cảnh cuối… là chuyện thật của em. Em chỉ muốn chị biết vậy.
    bien_kich: *(im lặng rất lâu)* … Tui biết. Tui biết từ đầu. Tui xin lỗi. Tui… tui bí quá.
    ~ duy_doi_chat_oanh = true
    ~ phat_hien(nguoi_gac_ket)
    ~ qh("bien_kich", 5)
    ~ duy_lua_doi(5)
* {duy_doi_chat_oanh} [🤝 Tới chỗ {bien_kich}: "Phim hay chị ạ. Chị viết hay hơn em nghĩ."]
    bien_kich: *(mắt đỏ)* Đừng nói vậy. Nói vậy tui càng thấy mình tệ.
    ~ qh("bien_kich", 10)
    ~ duy_lua_doi(5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2710_ll_ra_tay ===
# ngay:27 # gio:10:00 # noi:sanh_tang_tret # bat_buoc
_Một chiếc xe màu xanh lá chuối đậu trước cổng. Lưu Lực bước xuống, vest trắng, tóc vuốt keo, tay cầm tập hồ sơ._
_Ông ta đi vào sảnh, thấy {chi_dai} ở quầy lễ tân. Tập hồ sơ rơi xuống đất, giấy bay tung tóe._
chi_dai: *(nheo mắt)* Ủa? Anh… Quán Ốc Đêm hả?
_Bạn cúi xuống nhặt giấy giùm, theo phản xạ. Một tờ: "Đề nghị hợp tác: gấp ba 5 tỷ. Người nhận: Siêu Nhân Hồng". Bạn đọc lướt điều khoản trong 3 giây._
* [🧮 "Dạ anh ơi, điều khoản 9 phạt hủy hợp đồng gấp 5 lần, là bẫy ạ." (nói to)]
    _Lưu Lực khựng lại. {quan_ly_idol} đứng gần đó nghe thấy, chụp lại điều khoản 9 bằng điện thoại._
    quan_ly_idol: Em… đọc hợp đồng 3 giây ra điều khoản phạt?
    ~ duy_lo(15)
    ~ qh("quan_ly_idol", 10)
    ~ follow(10000)
* [😶 Đưa trả giấy, cúi đầu: "Dạ của anh ạ."]
    _Lưu Lực nhận, nhìn bạn từ đầu tới chân: "Thực tập sinh hả? Bên anh không có thực tập sinh 30 tuổi. Việc hôm nay phải xong từ hôm qua."_
    ~ duy_lua_doi(-3)
* [🛡️ Đứng ra sau lưng {chi_dai}.]
    ~ duy_lan_goi_huong++
    chi_dai: Em đứng đó. Chị nói chuyện với ổng.
    _Lưu Lực nhìn {chi_dai}, nhặt nốt tờ giấy cuối, đi thẳng lên tầng 2, không nhìn lại._
- -> thuc_tap_sinh_2710_trailer

= thuc_tap_sinh_2710_trailer
_14 giờ. Trailer "Người Hùng Không Tên" lên fanpage. Dòng cuối: "Biên kịch: {bien_kich}". 50 nghìn lượt xem trong 1 giờ._
{ duy_doi_chat_oanh:
    _Ngay dưới bài, {bien_kich} bình luận: "Cảm ơn người đã kể cho tôi nghe câu chuyện này. Bạn biết là ai." Một trái tim. Không tên. Nhưng bạn biết._
    ~ duy_lua_doi(5)
- else:
    _Không có tên bạn. Không có ở đâu cả._
    ~ duy_lua_doi(-10)
}
* [📱 Share trailer, caption: "Phim hay. 6-7."]
    ~ follow(3000)
    _Không ai hiểu caption. Bạn cũng không. Nhưng bạn thấy nhẹ._
* [😶 Không share. Đi photo.]
    ~ duy_day_viec(1)
    _Máy in kẹt. Bạn gỡ. Lần thứ 14 trong tháng. Có những việc vẫn cần làm, dù tim đang kẹt giấy._
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_2710_sua_chua_hong_hao ===
# ngay:27 # gio:16:30 # noi:tang_1 # bat_buoc
_16 giờ 30. {sales} chạy vào tầng 1, mặt trắng bệch, điện thoại trên tay._
sales: Mấy người! Sữa Chua Hồng Hào gọi tui! Ở Ven Đô! Họ muốn tài trợ 1 tỷ cho Đêm Hồng! Thiệt đó! No cap!
_Cả phòng cười. {hong_hot} cười to nhất. {dan_dau_tu} nói "lần này là lên thật hả". Không ai tin. {sales} đứng giữa phòng, lần đầu tiên nói thật, và không ai tin._
_Bạn nhìn màn hình điện thoại của {sales}. Số máy bàn, đầu số khu Ven Đô. Cuộc gọi dài 14 phút. Theo kinh nghiệm thẩm định, người lừa đảo không bao giờ gọi từ máy bàn._
* [🧮 "Dạ chị cho em số, em gọi xác nhận ạ." (bật loa ngoài)]
    _Một giọng cô bắt máy: "Dạ Sữa Chua Hồng Hào đây con. Đúng rồi, cô muốn tài trợ cho cậu mặc đồ hồng. Cậu đó đẩy xe sữa giùm cô hồi mưa tháng trước."_
    _Cả tầng 1 im. {sales} quay sang bạn, mắt đỏ hoe._
    sales: Em… em tin chị hả?
    thuc_tap_sinh: Dạ, em tin cái máy bàn ạ. Mà cũng tin chị ạ.
    ~ qh("sales", 20)
    ~ follow(15000)
    ~ duy_kn(5)
    ~ duy_lo(5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [😶 Cười theo cả phòng.]
    sales: *(mắt đỏ hoe)* … Ừ. Thôi. Tin chị đi, mấy người sẽ hối hận.
    ~ qh("sales", -3)
* [🛡️ Đi tìm {chi_dai}: "Dạ chị ơi, chị {sales} nói thật đó chị."]
    ~ duy_lan_goi_huong++
    chi_dai: *(nhìn {sales}, nhìn điện thoại, rồi cầm máy gọi lại)* … Thật. Ê cả phòng, im. Con bé nói thật.
    ~ qh("sales", 10)
    ~ qh("chi_dai", 3)
    ~ follow(10000)
- _Tối đó, Siêu Nhân Hồng không đăng gì. Có tin đồn Lưu Lực vừa gửi lời mời gấp ba. Bạn ngồi gỡ kẹt máy in, nghĩ: người có tiền thì ai cũng muốn giữ. Người có lòng thì ít ai nhận ra._
-> END
