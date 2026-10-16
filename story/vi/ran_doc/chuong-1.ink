// ============================================================
// CHƯƠNG 1: "MA MỚI, THÙ CŨ" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== ran_doc_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2
_Phòng họp tầng 2 chật kín người. Trên bàn là một xấp hợp đồng dày cộp. Ở đầu bàn, một người mặc bộ đồ siêu nhân màu hồng đang tạo dáng chụp hình._
giam_doc: Các em! Hôm nay là một ngày lịch sử của {cong_ty}! Xin giới thiệu đối tác chiến lược của chúng ta: Siêu Nhân Hồng!
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
_Cả phòng vỗ tay. {sieu_nhan_hong} tháo găng tay để ký. Trên mu bàn tay trái có một vết sẹo nhỏ._
_Bạn đứng hình. Vết sẹo đó, cái xóm Cây Me, cái nhà kho tối om… Là {sieu_nhan_hong}. Chắc chắn là {sieu_nhan_hong}._
~ phat_hien(hieu_ech)
ke_toan: *(thì thầm với {giam_doc})* Anh ơi, anh đọc giúp em trang 47 trước khi ký đã…
giam_doc: Thôi em, đối tác đang chờ. Anh không ép, tùy em… mà thôi ký luôn.
_{giam_doc} ký. 5 tỷ về tài khoản. Cả phòng reo hò._
~ follow(0)
-> ran_doc_0110_bat_tay

= ran_doc_0110_bat_tay
sieu_nhan_hong: *(đi vòng bàn bắt tay từng người, dừng lại trước bạn)* Chào em! Em là nhân viên mới hả? Anh là Siêu Nhân Hồng nè!
* [😇 "Dạ, em chào anh. Em là {ran_doc}, mới vô làm hôm nay."]
    sieu_nhan_hong: Tên đẹp ghê! Có gì cần giúp cứ kêu anh nha!
    _Không nhận ra. Không một chút nào._
* [🐍 "Anh có nhớ xóm Cây Me hông? Hồi đó có thằng nhóc tên {ran_doc} Ếch á."]
    _{sieu_nhan_hong} khựng lại 2 giây._
    sieu_nhan_hong: Hông nhớ… mà tên dễ thương ghê! {ran_doc} Ếch! Haha!
    ~ rd_moi_han = rd_moi_han + 20
    ~ rd_nghi_ngo = rd_nghi_ngo + 5
* [😶 Bắt tay thật mạnh, không nói gì.]
    sieu_nhan_hong: Úi! Tay em khỏe dữ!
    chi_dai: *(nhíu mày)* Thằng nhỏ này sao lạ vậy ta?
    ~ qh("chi_dai", -5)
- _{sieu_nhan_hong} đi tiếp sang người khác. Bạn nhìn theo bộ đồ hồng, bàn tay vẫn còn nắm chặt._
_Cả công ty muốn Siêu Nhân Hồng nổi tiếng. Còn bạn thì không._
-> END

// ------------------------------------------------------------
=== ran_doc_0110_tra_sua_sep ===
# ngay:1 # gio:10:30 # noi:phong_giam_doc # bat_buoc
_Cả công ty ăn mừng bằng trà sữa. Lúc nãy ở đầu cầu thang, {chi_dai} lỡ miệng: sếp uống ít đường, nhiều trân châu đen. Bạn đặt riêng một ly, mang lên phòng giám đốc._
giam_doc: Ơ, sao em biết anh uống thế này? Thằng bé này được việc đấy!
_Sau lưng bạn, {thanh_ninh} đứng ở cửa, tay bưng khay trà sen. Nụ cười của cô ta đứng im, chỉ có mắt là chạy từ ly trà sữa sang mặt bạn._
thanh_ninh: Dạ anh {ran_doc} giỏi quá. Mà buổi sáng sếp uống trà sen cho ấm bụng ạ. Em {ran_doc} ơi, tiện xuống photo giùm chị 52 trang hợp đồng nha.
* [😇 "Dạ chị, em đi liền."]
    ~ qh("thanh_ninh", 3)
    ~ rd_tin(3)
    giam_doc: {thanh_ninh}, nhân viên mới mà, cho nó làm quen dần đã.
    _Bạn photo 52 trang. Tới trang 47 thì máy kẹt giấy. Bạn rút tờ đó ra, vuốt phẳng, và đọc được ba chữ cỡ 6: "hoàn trả gấp đôi"._
    ~ rd_tin_mat()
* [🐍 "Dạ chị {thanh_ninh} chu đáo thật. Sếp có chị là có tất cả."]
    _Câu đó ngọt quá. Ngọt kiểu đường hóa học. {giam_doc} cười khà khà, không nghe ra. {thanh_ninh} nghe ra._
    ~ qh("giam_doc", 5)
    ~ qh("thanh_ninh", -10)
    ~ rd_do_doc = gioi_han(rd_do_doc + 5)
* [😶 Đặt ly trà sữa xuống, lùi ra, mỉm cười.]
    ~ qh("giam_doc", 2)
- _Từ hôm nay, ở tầng 2 có hai người tranh nhau một cái tai của sếp. Bạn chưa cần cái tai đó. Nhưng có thêm một cái thì không thừa._
-> END

// ------------------------------------------------------------
=== ran_doc_0110_trua_com_tam ===
# ngay:1 # gio:12:05 # noi:quan_com_tam
_Quán cơm tấm vỉa hè. Bàn nào cũng kín người của {cong_ty}. Có hai chỗ trống._
* [Ngồi với {hong_hot} và {designer}, bàn ồn nhất.]
    -> ran_doc_0110_ban_hong_hot
* [Ngồi với {thuc_tap_sinh}, đang ăn một mình.]
    -> ran_doc_0110_ban_duy

= ran_doc_0110_ban_hong_hot
hong_hot: Ủa, nhân viên mới hả? Ngồi đi ngồi đi! Ông thấy cái vụ 5 tỷ hông? Ối dồi ôi, công ty mình trúng số rồi!
designer: Trúng số mà poster tui vẫn phải sửa 3 lần trước 10 giờ sáng mai đó bà.
* [🐍 "Mà nghe nói hợp đồng có điều khoản gì đó ở trang 47, chị {ke_toan} lo lắm."]
    hong_hot: HẢ? Trang 47 gì? Kể nghe coi!
    ~ rd_do_doc = rd_do_doc + 10
    ~ rd_nghi_ngo = rd_nghi_ngo + 5
    ~ qh("hong_hot", 10)
    hong_hot: Trời đất, để chiều tui hỏi thử bả. Ông này được nha, mới vô mà hóng nhanh dữ!
* [😇 "Dạ em mới vô, em nghe mọi người kể là chính."]
    hong_hot: Ngoan ghê! Để tui kể cho nghe nè. Công ty này nhìn vậy chứ drama nhiều lắm…
    ~ rd_so_tin_mat = rd_so_tin_mat + 1
    ~ qh("hong_hot", 5)
    ~ qh("designer", 5)
- ~ an(55)
-> END

= ran_doc_0110_ban_duy
thuc_tap_sinh: Dạ anh ngồi đi ạ! Em là {thuc_tap_sinh}, thực tập sinh phòng sản xuất ạ.
_Người này nhìn lớn tuổi hơn bạn. Nhiều._
* [🤝 "Ông lớn hơn tui mà, gọi tên được rồi."]
    thuc_tap_sinh: Dạ… dạ thôi, em thực tập mà anh. Phải đúng phép ạ.
    ~ qh("thuc_tap_sinh", 15)
* [🐍 "Thực tập mà lớn tuổi vậy, chắc có chuyện gì hả?"]
    thuc_tap_sinh: *(cười gượng)* Dạ… em đổi nghề thôi ạ.
    _{thuc_tap_sinh} giấu một cái thẻ ngân hàng màu đen, viền lấp lánh, vào túi rất nhanh._
    ~ rd_so_tin_mat = rd_so_tin_mat + 1
    ~ qh("thuc_tap_sinh", -5)
- ~ an(55)
-> END

// ------------------------------------------------------------
=== ran_doc_0110_bi_bat_qua_tang ===
# ngay:1 # gio:15:10 # noi:pantry # ngau_nhien
_Bạn đang nói nhỏ với {designer} ở pantry về bộ đồ hồng "lố" của Siêu Nhân Hồng. Từ phía sau có tiếng ho nhẹ…_
ke_toan: Khụ khụ. Nói gì vui vậy mấy đứa? # hen_gio:5
* [😇 "Dạ tụi em đang khen chị tính lương nhanh quá trời luôn á!"]
    { RANDOM(1, 10) <= 6:
        ke_toan: Ờ… lương chưa về mà khen gì. Thôi làm việc đi.
    - else:
        ke_toan: Lương còn chưa phát mà khen nhanh. Tui nghe hết rồi nha.
        ~ rd_nghi_ngo = rd_nghi_ngo + 10
        ~ qh("ke_toan", -10)
    }
* [🐍 "Dạ là {designer} nói chứ không phải em."]
    designer: Ủa?!
    ~ qh("designer", -40)
    ~ qh("sales", -20)
    ~ rd_do_doc = rd_do_doc + 10
* [😶 Chạy ra nhà vệ sinh.]
    ~ rd_nghi_ngo = rd_nghi_ngo + 15
* [⏱️ (Không chọn kịp)]
    ke_toan: *(ghi vào cuốn sổ nhỏ)* Nhân viên mới. Ngày đầu tiên. Ghi nhận.
    ~ qh("ke_toan", -15)
    ~ rd_nghi_ngo = rd_nghi_ngo + 10
- -> END

// ------------------------------------------------------------
=== ran_doc_0110_chi_dai_dan_di ===
# ngay:1 # gio:08:10 # noi:tang_1 # bat_buoc
_7 giờ 58, bạn phóng xe qua cổng, suýt cán đuôi một con chó vàng. Bác bảo vệ già chỉ chỗ gửi xe, không nói thừa chữ nào. Lên tới đầu cầu thang, một chị tóc buộc cao, đeo bộ đàm bên hông, chặn bạn lại._
chi_dai: Em là {ran_doc} hả? Chị là {chi_dai}, lo sự kiện. Đi theo chị, chị dẫn đi chào cả công ty.
chi_dai: Ăn sáng chưa? Chưa thì cầm cái bánh bao này. Nhân viên mới mà đói là chị không chịu.
* [😇 "Dạ em cảm ơn chị, em ăn rồi mà chị cho thì em ăn nữa."]
    ~ an(20)
    ~ qh("chi_dai", 10)
    chi_dai: Được. Biết điều. Chị thích.
* [💬 "Dạ chị ơi, công ty mình có ai… khó chơi không chị?"]
    chi_dai: *(nheo mắt)* Mới vô đã hỏi ai khó chơi. Em định chơi với ai?
    ~ rd_nghi(3)
    ~ rd_tin_mat()
    chi_dai: Thôi được. Né con nhỏ trợ lý {thanh_ninh} ra. Nịnh trên đạp dưới. Còn lại toàn đứa dễ thương.
- _{chi_dai} dẫn bạn đi một vòng. Mỗi bàn là một câu chuyện._
_{chua_te_deadline} đang ngủ gục trên bàn phím. {thuc_tap_sinh} ôm năm ly cà phê. {it} thò đầu ra khỏi phòng server rồi thụt vào ngay._
chi_dai: Đó, phòng server. Ổng là {it}, nói chuyện thì cụt lủn mà sửa máy thì giỏi.
chi_dai: Còn đây là {hong_hot}, admin fanpage. Em mà kể gì với nhỏ này là cả quận biết trước giờ cơm.
hong_hot: Ủa alo? Chị nói xấu em trước mặt nhân viên mới luôn hả?
* [🐍 Ghi nhớ thật kỹ: {hong_hot} là cái loa phường.]
    ~ rd_tin_mat()
    _Bạn mỉm cười, gật đầu chào. Trong đầu đã có một cái loa._
* [🤝 "Chị {chi_dai} giỡn thôi chị ơi, em thích người vui tính."]
    ~ qh("hong_hot", 5)
    hong_hot: Thấy chưa! Nhân viên mới có mắt nhìn người!
- chi_dai: Thôi lên tầng 2 đi. 9 giờ ký hợp đồng với cái ông… siêu nhân gì đó. Cả công ty phải có mặt.
-> END

// ------------------------------------------------------------
=== ran_doc_0110_mung_bac_binh ===
# ngay:1 # gio:16:30 # noi:chot_bao_ve
_Ngày Quốc tế Người cao tuổi. {hr} ôm một bó hoa, cả công ty kéo nhau xuống chòi bảo vệ._
_Máy pha cà phê hỏng đúng Ngày Cà phê Quốc tế, nên thay vì cà phê, ai cũng cầm ly trà đá của bác._
hr: Chúc mừng bác {bac_bao_ve}! Bác là người lớn tuổi nhất, gắn bó lâu nhất với gia đình {cong_ty}!
bac_bao_ve: *(đỏ mặt)* Ơ… thôi, các cháu cứ bày vẽ. Bác có làm gì đâu.
cho: Gâu! *(đứng chắn trước bó hoa như sợ ai cướp)*
_Bạn để ý trên bàn trong chòi có một xấp phong bì cũ, nét chữ tay, góc ký một chữ "G" to tướng._
* [💬 Hỏi nhỏ: "Bác ơi, thư ai gửi bác mà nhiều dữ vậy?"]
    bac_bao_ve: *(lật úp xấp thư)* Thư người quen. Chuyện của bác, cháu không cần biết đâu.
    ~ qh("bac_bao_ve", -3)
    ~ rd_nghi(3)
    ~ rd_tin_mat()
    _Chữ "G". Bạn ghi vào sổ tay. Chưa biết dùng làm gì, nhưng rắn giỏi thì không bỏ phí con mồi nào._
* [😇 Rót trà mời bác trước, rồi mới tới mình.]
    ~ qh("bac_bao_ve", 10)
    bac_bao_ve: Ừ. Cháu này được. Ngày đầu đi làm mà biết mời người già trước.
    ~ uong(25)
* [🐾 Ngồi xổm xuống chơi với {cho}.]
    ~ qh("cho", 8)
    cho: Gâu gâu! *(liếm tay bạn)*
    bac_bao_ve: Nó nhớ mặt cháu rồi đấy. Sáng nay cháu chạy qua nó còn chưa kịp sủa.
- _Đúng lúc đó, bộ đồ hồng lấp ló ở cổng. {cho} gầm gừ, lông dựng ngược._
sieu_nhan_hong: {cho} ơi! Gâu gâu! Anh về nha! Biến hình! *(nhảy lên xe hồng)*
cho: GÂU GÂU GÂU GÂU!
bac_bao_ve: Thế đấy. Ngày nào nó cũng thế.
_Bạn nhìn chiếc xe hồng khuất dần. Hai mươi năm rồi mà cái tật chọc người khác vẫn y nguyên._
-> END

// ------------------------------------------------------------
=== ran_doc_0110_dem_hem_69 ===
# ngay:1 # gio:21:30 # noi:hem_69
_Phòng 3, dãy A, Hẻm 69. Bạn mở cuốn sổ tay, viết dòng đầu tiên: "Nguyễn {sieu_nhan_hong}. Xóm Cây Me. Vết sẹo tay trái."_
_Bên kia vách, tiếng {hong_hot} đang livestream: "Cả nhà ơi, công ty em hôm nay trúng số 5 tỷ nè!"_
* [🐍 Áp tai vào vách nghe tiếp.]
    _"…mà nghe đâu hợp đồng có cái gì đó ghê lắm, chị kế toán mặt tái mét luôn…"_
    ~ rd_tin_mat()
    _Bạn ghi thêm một dòng. Cái vách mỏng này đáng giá hơn tiền trọ._
* [😶 Bật quạt lên cho át tiếng, đi ngủ sớm.]
    ~ nghi(15)
    ~ cang_thang(-5)
    _Ngày đầu tiên. Mai còn dài._
* [📓 Lật lại trang cũ trong sổ: hình vẽ một cái lỗ thông gió hình con cá.]
    _Bạn vẽ nó từ năm 8 tuổi. Mỗi lần mất ngủ lại vẽ thêm một con._
    ~ rd_han(5)
    ~ cang_thang(5)
- _Đúng 22:00, điện thoại rung. Group Zalo-lô công ty._
giam_doc: Các em ngủ sớm nhé, mai 9h30 họp chiến dịch "Hồng Hóa Việt Nam". Anh không ép, tùy các em. Nhưng ai không đến thì anh buồn.
_22 người "đã xem". Không ai trả lời. Bạn thả một trái tim. Ngày đầu, phải ngoan._
~ qh("giam_doc", 2)
-> END

// ------------------------------------------------------------
=== ran_doc_0210_cuoi_cham_cong ===
# ngay:2 # gio:07:55 # noi:may_cham_cong
_Ngày Nụ cười Thế giới. {hr} đứng cạnh máy chấm công, tay cầm cuốn sổ, miệng cười tươi tới mức đáng sợ._
hr: Chào em! Hôm nay ai chấm công cũng phải cười nha. Anh chỉ muốn lắng nghe nụ cười của em thôi.
* [😇 Cười thật tươi, tám cái răng.]
    hr: Đẹp! Rất đẹp. Anh ghi nhận em là nhân viên tích cực.
    ~ qh("hr", 5)
    ~ uy_tin = uy_tin + 2
* [🐍 Cười, rồi nói nhỏ: "Anh {hr} cười cũng đẹp mà, sao hôm qua thấy anh cầm tập hồ sơ hồng mặt buồn dữ vậy?"]
    _{hr} khựng nửa giây. Nụ cười vẫn y nguyên, chỉ có mắt là thôi cười._
    hr: Hồ sơ gì em? Chắc em nhìn nhầm. Em rảnh không, chiều nay lên phòng anh uống trà xíu.
    ~ rd_tin_mat()
    ~ rd_nghi(8)
    ~ qh("hr", -5)
* [😶 Chấm công thật nhanh, không cười.]
    hr: Ơ… em chưa cười mà.
    _Máy chấm công kêu "tít". {hr} ghi vào sổ một cái gì đó._
    ~ qh("hr", -3)
- _Sau lưng bạn, {thuc_tap_sinh} cười to quá, rớt luôn năm ly cà phê. {chua_te_deadline} tới lúc 8:20, không cười, chỉ ngáp._
-> END

// ------------------------------------------------------------
=== ran_doc_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Phòng họp "Sáng Tạo". Trên màn hình là dòng chữ to: CHIẾN DỊCH HỒNG HÓA VIỆT NAM. MỤC TIÊU: 1.000.000._
giam_doc: Các em, một triệu người theo dõi trước 31/10. Anh tin các em. Cái này là mindset, các em hiểu không?
truong_phong: Mình sync nhanh 5 phút thôi nhé. Mỗi bộ phận nói một ý tưởng.
sales: Tin chị đi, chị chốt được 3 nhà tài trợ, 2 tỷ. Tập đoàn Bánh Tráng Trộn Toàn Cầu, chủ tịch Mr. Kevin Trộn. No cap.
thuc_tap_sinh: Dạ… em có một ý tưởng phim ngắn ạ. Về một người gác két ngân hàng, một ngày nghỉ việc, trời mưa, xe chết máy…
bien_kich: *(ghi chép rất nhanh)* Ừm. Hay. Cần thêm nỗi đau.
sieu_nhan_hong: Còn anh thì tình nguyện đi gặp tất cả mọi người! Gét gô! *(tạo dáng)*
truong_phong: Còn em, {ran_doc}? Truyền thông nội bộ có ý gì không?
* [😇 "Dạ em làm bản tin nội bộ, mỗi tuần đếm ngược số người theo dõi cho cả công ty có động lực."]
    truong_phong: Tốt. Cái này mình take note.
    ~ uy_tin = uy_tin + 5
    ~ qh("truong_phong", 5)
    ~ rd_tin(5)
* [🐍 "Dạ em nghĩ nên cho anh Siêu Nhân Hồng tháo mũ luôn cho nhanh nổi."]
    _Cả phòng im phăng phắc._
    sieu_nhan_hong: *(lùi một bước)* Dạ… ờm… điều khoản số 1 á em. Hông ai được ép anh tháo mũ.
    giam_doc: Em mới vào nên chưa đọc hợp đồng. Anh không trách. Nhưng anh nhớ.
    ~ rd_nghi(10)
    ~ qh("giam_doc", -5)
    _Nhưng bạn đã thấy: bàn tay có sẹo run lên. Nguyễn {sieu_nhan_hong} sợ bị lộ mặt._
    ~ rd_tin_mat()
* [💬 Ghi lại ý tưởng của {thuc_tap_sinh} và cái tên Mr. Kevin Trộn.]
    _Bạn ghi hai dòng. Một ý tưởng phim mà {bien_kich} đang chép lia lịa. Một ông chủ tịch nghe tên như món ăn vặt._
    ~ rd_tin_mat()
    ~ rd_tin_mat()
- truong_phong: Ok, họp "5 phút" của mình xong rồi. *(đồng hồ chỉ 11:47)*
-> END

// ------------------------------------------------------------
=== ran_doc_0210_chieu_thu_6 ===
# ngay:2 # gio:15:00 # noi:pantry
_Thứ 6, trà sữa từ quỹ phạt đi trễ. Việc ghi order được giao cho nhân viên mới, tức là bạn._
hong_hot: Tui ít đá, 50% đường nha. Còn bà {designer} thì không đường, vì bà đang "giảm cân" lần thứ 9.
designer: Lần thứ 8 thôi. Đừng có thêm mắm.
_Bạn nghe chữ "thêm mắm" mà giật mình. Cứ như có người đọc được suy nghĩ._
sieu_nhan_hong: Ai ghi order đó? Cho anh một ly trà sữa dâu, topping hồng, hồng nhiều nhiều!
* [😇 Ghi đúng order cho tất cả.]
    -> ran_doc_mg_tra_sua
* [🐍 Ghi ly của {sieu_nhan_hong} thành "trà sữa sầu riêng, gấp đôi sầu riêng".]
    _Nửa tiếng sau, mùi sầu riêng lan khắp tầng 1. Nội quy số 5: không ăn đồ có mùi nặng trong văn phòng._
    sieu_nhan_hong: Ủa… ly này của anh hả? *(hít một hơi, ho sặc)*
    ke_toan: Ai mang sầu riêng vào văn phòng? Nội quy số 5!
    ~ rd_do_doc = gioi_han(rd_do_doc + 5)
    ~ rd_han(-3)
    ~ rd_nghi(5)
    sieu_nhan_hong: Hông sao hông sao! Hồng là thái độ, sầu riêng cũng là thái độ! *(uống hết)*
    _Hắn uống hết thật. Mặt xanh lét. Bạn hả dạ được đúng 3 giây._
- -> END

// ------------------------------------------------------------
=== ran_doc_0310_cuoi_tuan_hem_69 ===
# ngay:3 # gio:09:30 # noi:hem_69
_Thứ 7. Bà Tư chủ trọ ngồi ghế đẩu đầu dãy, quạt nan phành phạch._
ba_tu: Nay mùng mấy rồi con? Mùng 3. Mùng 5 tiền trọ nha con, hai triệu tư, gồm điện luôn. Mà con làm ở cái công ty có ông siêu nhân hồng hả?
ba_tu: Hôm qua con {hong_hot} phòng bên nói ổng giàu lắm, tiền đựng trong vali!
* [🧂 "Dạ, nghe nói vali đó toàn tiền mệnh giá lớn, ổng đếm bằng máy luôn bà."]
    ba_tu: Trời đất! Để chiều bà kể cho chú Sáu nghe.
    ~ rd_them_mam(3, 0)
    _Tin đồn đầu tiên ra khỏi công ty. Không ai biết nó bắt đầu từ bạn. Bà Tư là đường truyền cáp quang của Hẻm 69._
* [💬 "Bà Tư ơi, hồi xưa bà có biết xóm Cây Me hông?"]
    ba_tu: Cây Me hả? Giải tỏa lâu rồi con. Cái xóm có cái nhà kho bỏ hoang đó hả? Hồi đó con nít hay trốn trong đó.
    _Bạn nắm chặt ly trà đá._
    ~ rd_han(5)
* [😇 Đưa trước tiền trọ cho bà Tư.]
    ~ tien_cong(-2400000)
    ba_tu: Con này ngoan. Trọ ở đây ba năm chưa ai đưa sớm. Có gì cần cứ nói bà.
    _Bà Tư biết hết chuyện cả hẻm. Có bà đứng về phía mình là có cả một mạng lưới._
    ~ rd_tin_mat()
- _Chiều, đầu hẻm. Một bộ đồ hồng đang khiêng giùm ông Ba trà đá mấy két nước ngọt. Không ai quay. Không ai biết. Hắn không thấy bạn._
* [😶 Đứng nhìn từ xa.]
    ~ rd_han(-8)
    _Hắn khiêng xong, cúi đầu chào ông Ba, rồi đi. Không tạo dáng. Không có ai để tạo dáng cho._
* [🤝 Ra phụ một tay.]
    ~ rd_han(-10)
    ~ qh("sieu_nhan_hong", 5)
    sieu_nhan_hong: Ủa em! Em ở hẻm này hả? Cảm ơn nha! Nặng ghê!
    _Hai người khiêng két nước. Hắn không nhận ra bạn. Nhưng hắn nói "cảm ơn" tới ba lần._
* [🐍 Nói với ông Ba: "Ổng diễn đó ông. Lát có người quay cho coi."]
    ong_ba_tra_da: Quay gì con. Thằng nhỏ tuần nào cũng ghé, có ai quay đâu.
    ~ rd_han(3)
    ~ rd_biet_chuoc_loi = true
- _Tối, bạn mở Phây-búc của Siêu Nhân Hồng. 5.400 người theo dõi. Bài đăng mới nhất: "Hôm nay Hồng giúp một chị bán vé số đẩy xe! Slay!"_
_Bạn bấm "Ẩn bài viết". Rồi lại bấm vào xem lại._
-> END

// ------------------------------------------------------------
=== ran_doc_0410_ngay_dong_vat ===
# ngay:4 # gio:10:00 # noi:cong_cong_ty # bat_buoc
_Chủ nhật, Ngày Động vật Thế giới. Bạn ghé công ty lấy laptop thì bắt gặp cảnh tượng hiếm có._
_{cho} mặc áo, đội nơ hồng, lông còn ướt. {chi_dai} vừa tắm cho nó xong. Mặt {cho} là mặt của một con chó đã mất hết niềm tin vào cuộc sống._
chi_dai: Đứng yên. Đẹp trai lắm rồi. Đứa nào cười là chị xử.
_Xe hồng đỗ xịch trước cổng. {sieu_nhan_hong} nhảy ra, giả tiếng sủa._
sieu_nhan_hong: Gâu! Gâu gâu! {cho} ơi, nơ của em hồng giống anh nè! Mình là anh em đó!
cho: GRỪ… GÂU GÂU GÂU!
_{cho} lao tới. Trong một giây hỗn loạn, chiếc găng tay hồng bay khỏi tay {sieu_nhan_hong}. {cho} ngậm lấy, chạy mất vào gầm cầu thang._
sieu_nhan_hong: Ê! Găng tay của anh! {cho} ơi trả anh đi mà!
bac_bao_ve: Cậu {sieu_nhan_hong}, hôm nay nó đã khổ lắm rồi. Tha cho nó.
* [🐾 Đi theo {cho} xuống gầm cầu thang.]
    -> ran_doc_0410_kho_gam_cau_thang
* [🐍 Cười thật to: "Siêu nhân mà thua con chó kìa!"]
    hong_hot: *(từ đâu chui ra, điện thoại giơ cao)* Quay được rồi! Ối dồi ôi, clip này đăng là lên xu hướng!
    ~ follow(8000)
    ~ rd_nghi(3)
    _Khoan. Bạn vừa làm hắn nổi thêm tám nghìn người._
    -> END
* [😇 "Anh đừng chọc nó nữa. Chó cũng có tự trọng mà anh."]
    sieu_nhan_hong: *(gãi đầu dưới mũ)* Ờ… ờm… em nói đúng. Anh xin lỗi {cho}.
    _Lần đầu tiên bạn thấy Nguyễn {sieu_nhan_hong} xin lỗi ai đó. Mà là xin lỗi một con chó._
    ~ rd_han(-5)
    ~ qh("chi_dai", 5)
    -> END

= ran_doc_0410_kho_gam_cau_thang
_Gầm cầu thang tối om. {cho} nằm trên một đống đồ, găng tay hồng kẹp giữa hai chân trước._
_Chìa khóa. Một thỏi son. Một điện thoại cũ. Và một cái USB không nhãn, thơm mùi cà phê sữa đá._
cho: Grừ… *(nhìn bạn, rồi nhìn chiếc găng)*
* [🐾 Ngồi xuống: "Tao hiểu mà. Tao cũng ghét ổng."]
    cho: …Gâu. *(nằm xuống, gác cằm lên chân bạn)*
    ~ qh("cho", 20)
    ~ rd_dong_minh_tuat = true
    _Đồng minh đầu tiên của bạn ở {cong_ty}. Có bốn chân và một kho bằng chứng._
* [🐍 Nhặt cái USB không nhãn bỏ túi.]
    cho: GRỪ! *(nhe răng)*
    _Bạn rụt tay lại. Kho này có chủ. Chủ này có răng._
    ~ qh("cho", -10)
    ~ rd_tin_mat()
    _Nhưng bạn đã nhớ: có một cái USB lạ dưới gầm cầu thang._
* [😇 Lấy găng tay ra trả cho {sieu_nhan_hong}.]
    cho: Ẳng! *(kéo lại)*
    _{cho} giật lại chiếc găng, quay lưng. Thôi, đành chịu._
    ~ qh("cho", -5)
- -> END
