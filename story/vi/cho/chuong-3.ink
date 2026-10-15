// ============================================================
// CHƯƠNG 3: "BÓNG TỐI VÀ TỦ LẠNH" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== cho_1310_doanh_nhan ===
# ngay:13 # gio:10:00 # noi:phong_giam_doc
_Thứ 3. Cửa phòng kính tầng 2 mở hé. Bên trong có mùi hoa tươi, rất nhiều hoa. Và mùi một người đang rất tự hào về bản thân._
_Trên cửa có dán một tờ giấy. Bạn không biết đọc. Tờ giấy ghi: "Nội quy số 8: Không được dắt chó vào phòng giám đốc."_
_Không ai dắt bạn. Bạn tự đi vào._
~ ch_vao_phong_gd = ch_vao_phong_gd + 1
giam_doc: *(đang cắm hoa vào bình)* Bla bla… bla bla bla… bla! # phu_de:Ngày Doanh nhân Việt Nam! Anh tự tặng hoa cho anh, vì anh xứng đáng, các em ạ!
thanh_ninh: Bla bla bla bla… bla bla bla… # phu_de:Dạ anh tặng hoa cho anh là đỉnh nóc kịch trần luôn ạ! Em xin phép đọc bài phát biểu khen anh, 15 phút thôi ạ…
_Rồi {sales} bước vào, hai tay nâng một tấm bảng vàng chóe như cái mâm._
sales: Bla bla… bla bla bla… bla! # phu_de:Anh ơi, BTT Global trao anh giải Doanh nhân của năm nè! Mr. Kevin Trộn gửi lời chúc mừng đích thân luôn! No cap!
_{giam_doc} cầm tấm bảng như cầm một đứa con. Treo ngay lên tường._
* [👃 Đánh hơi tấm bảng vàng.]
    ~ ch_mui(2)
    _Tấm bảng có mùi nhựa mới, mùi keo dán và mùi một tiệm in ở đầu ngõ, loại in thiệp cưới lấy liền trong 1 tiếng._
    { ch_mui_thinh >= 60:
        _Và mùi ngón tay của {designer}. Tấm bảng này được thiết kế tối qua, lúc 2 giờ sáng, trên một cái ban công đầy cây._
    }
    _Bạn hắt xì vào tấm bảng. {sales} nhìn bạn rất nhanh, rất căng._
    ~ phat_hien(btt_global_gia)
* [💩 Để lại quà ngay dưới bình hoa.]
    ~ ch_de_qua("phong_gd")
    _Bạn để lại một món quà. Ngay dưới bình hoa. Một tác phẩm sắp đặt._
    giam_doc: TUẤT! Bla bla bla bla! KHÔNG! # phu_de:{cho}! Đứa nào cho con chó vào đây! Không! Ối giời ơi bình hoa của anh!
    _{thanh_ninh} hét lên. {sales} lùi ra cửa. {giam_doc} gọi điện xuống chòi._
    _Chiều hôm đó, bảng nội quy có thêm một dòng mới, chữ to hơn mọi dòng khác. Bạn vẫn không biết đọc._
    ~ qh("giam_doc", -10)
    ~ qh("bac_bao_ve", -3)
* [🎁 Ngậm một bông hoa trong bình, chạy xuống chòi.]
    _Bạn rút một bông hồng (màu đỏ, may quá), phóng xuống cầu thang. Phía sau vang lên tiếng "Ơ, hoa của anh!"._
    _Bạn đặt bông hoa lên bàn trà của bác. Bác nhìn bông hoa, nhìn lên tầng 2, rồi cắm nó vào ly trà đá._
    bac_bao_ve: Bla… bla bla. # phu_de:Doanh nhân tặng bảo vệ à. Ừ, cũng được.
    ~ qh("bac_bao_ve", 3)
* [🐾 Ngồi nghe bài phát biểu 15 phút cùng mọi người.]
    _Bạn ngồi nghe. 15 phút. Không có từ nào bạn hiểu. {giam_doc} nghe say sưa, gật gù. Bạn cũng gật gù, vì buồn ngủ._
    _Hết bài, {giam_doc} xoa đầu bạn._
    giam_doc: Bla bla… TUẤT… bla bla bla! # phu_de:Con chó này biết nghe lời hay đấy! Có mindset!
    ~ qh("giam_doc", 4)
    ~ qh("thanh_ninh", 2)
- -> END

// ------------------------------------------------------------
=== cho_1410_moc_hai ===
# ngay:14 # gio:09:30 # noi:cong_cong_ty
_Thứ 4. Bàn điều phối lịch trình trống. Người hay ngồi ở đó hôm nay không tới. Trên ghế để lại một mùi lạ: đèn sân khấu nóng, kim tuyến và nước súc miệng bạc hà._
hr: Bla bla… bla bla bla? # phu_de:Lại "về quê gặt lúa"? Tháng 10 gặt lúa ở đâu ra vậy em {thanh_xin_nghi}?
{ ch_mui_thinh >= 60:
    _Mùi kim tuyến đó, bạn từng ngửi một lần trên cái tivi nhỏ trong chòi. Mùi của Đài Tivi Hóng. Người này không về quê. Người này đi hát._
    ~ phat_hien(son_thi_hat)
}
{ nguoi_theo_doi < 200000:
    -> cho_1410_vang_hong
}
_Chiếc xe hồng tới. Bộ đồ hồng nhảy xuống, mặt mũ tươi rói. Tay cầm một cây xúc xích._
sieu_nhan_hong: Gâu! Bla bla… TUẤT… XÚC XÍCH… bla bla! # phu_de:Gâu! {cho} ơi, xúc xích nè! Mốc 2 đạt rồi, anh vui, anh hối lộ em đó!
* [🦴 Ăn. Đồ ăn thì không có màu.]
    ~ ch_an_cua_nguyen()
    _Bạn ăn. Ngon. Bạn ăn xong mới nhớ ra đó là xúc xích của kẻ thù. Bạn gầm gừ một tiếng cho có lệ._
    cho: Grừ… *(liếm mép)*
    sieu_nhan_hong: Bla bla! # phu_de:Ha! Vừa ăn vừa chửi! Giống anh hồi nhỏ ghê!
    ~ ch_hong_doi(-3)
* [😤 Sủa cây xúc xích. Bạn không bán mình.]
    cho: GÂU!
    _Bộ đồ hồng giật mình, làm rơi cây xúc xích. Nó lăn tới chân bạn. Bạn… vẫn không ăn. Bạn nhìn nó. Nó nhìn bạn._
    _Bác nhặt lên, bỏ vào túi áo. Tối nay bác sẽ đưa lại cho bạn, và bạn sẽ ăn, vì lúc đó nó là xúc xích của bác._
    ~ ch_hong_doi(2)
* [🐾 Ngửi tay người đồ hồng trước.]
    ~ ch_mui(2)
    _Tay hồng có mùi bánh chuối chiên, mùi xăng (xe hồng hết xăng giữa đường?), và mùi một bàn ăn rất to, rất lạnh, chỉ có một người ngồi._
    ~ ch_an_cua_nguyen()
    ~ ch_hong_doi(-4)
- -> END

= cho_1410_vang_hong
_Hôm nay là ngày của một con số lớn. Con số không đạt. Chiếc xe hồng không ghé cổng. Nghe nói bộ đồ hồng buồn, đi giúp người cả ngày ở đâu đó._
_Cổng yên tĩnh. Không ai giả tiếng sủa. Không ai giấu bóng._
* [😴 Ngủ trưa trọn vẹn. Cuối cùng cũng yên.]
    ~ nghi(30)
    _Bạn ngủ ngon. Rất ngon. Chỉ là thỉnh thoảng bạn mở một mắt, nhìn ra cổng. Không vì lý do gì cả._
* [👃 Ra đứng ở cổng, ngửi về phía đường lớn.]
    _Bạn đứng ở cổng rất lâu. Gió mang tới mùi khói xe, mùi cơm tấm, không có mùi bánh chuối chiên._
    _Bạn không nhớ nó. Chắc chắn là không nhớ. Bạn chỉ đứng đó canh, phòng khi nó tới thì sủa._
    ~ ch_hong_doi(-3)
- -> END

// ------------------------------------------------------------
=== cho_1410_tu_lanh ===
# ngay:14 # gio:12:10 # noi:pantry # ngau_nhien
_Trưa. Pantry. Tủ lạnh chung kêu ù ù. Bên trong là cả một vũ trụ: hộp cơm thịt kho, hộp cơm gà, sữa chua, nửa cái bánh kem từ tuần trước._
_Bạn nằm rình sau thùng nước suối. Mắt dán vào tay nắm cửa tủ._
_Bên bàn ăn, {ke_toan} đang ăn trưa, mắt dán vào sổ. {thanh_ninh} đứng pha trà cho sếp, mắt dán vào… mọi thứ._
* [🦴 Rình. Chờ đúng lúc có người mở tủ.]
    _Bạn nằm im như một cái thảm chùi chân. Tim đập. Đuôi không được vẫy. Đuôi, làm ơn đừng vẫy._
    -> cho_mg_tu_lanh
* [🥺 Thôi, đi xin {ke_toan} cho chắc ăn.]
    _Bạn ra ngồi trước mặt {ke_toan}. Thẳng lưng. Mắt cún._
    ke_toan: Bla bla… bla bla bla? # phu_de:Hóa đơn đâu em?
    { RANDOM(1, 3) == 1:
        _Người này nhìn bạn rất lâu, rồi gắp một miếng thịt kho, đặt xuống. Rồi ghi sổ._
        ~ ch_an(15)
        ~ qh("ke_toan", 2)
    - else:
        _Người này lật sang trang sổ mới. Bạn thua. Bạn quay lại sau thùng nước suối._
    }
* [👃 Đánh hơi khe cửa tủ lạnh trước, chọn mục tiêu.]
    ~ ch_mui(2)
    _Hộp cơm thịt kho: kệ giữa. Sữa chua của {giam_doc}: kệ trên, có dán tên. Nửa cái bánh kem: hôi rồi, bỏ qua. Mục tiêu đã chọn._
    -> cho_mg_tu_lanh
- -> END

// ------------------------------------------------------------
=== cho_1510_thang_may ===
# ngay:15 # gio:08:05 # noi:sanh_tang_tret # bat_buoc
_8 giờ 5. "Phụt." Tất cả tắt. Đèn, quạt, máy chấm công, cái radio của bác. Cả tòa nhà thở ra một hơi dài rồi im._
_Rồi từ trong cái hộp sắt giữa sảnh, nơi người ta đứng đi lên đi xuống, vang ra hai giọng nói._
giam_doc: Bla bla bla! Bla bla! # phu_de:Ơ! Kẹt rồi! Kẹt thang máy rồi! {thanh_ninh} ơi! Gọi ai đi!
chi_dai: Bla bla. Bla bla bla. # phu_de:Anh bình tĩnh. Đừng có đập cửa. Đập nữa là tui đập anh.
_Bạn biết giọng thứ hai. Giọng của người tắm cho bạn. Người đó đang bị nhốt trong hộp sắt._
* [😤 Sủa vào khe cửa thang máy cho tới khi có người tới.]
    cho: Gâu! Gâu! GÂU GÂU!
    _Bạn sủa không ngừng. Một phút sau, {it} chạy xuống với cái đèn pin và một cây sắt dài._
    it: Bla bla. Bla. # phu_de:Ở đây hả. Ừ. Tắt đi bật lại không được rồi.
    _{it} cạy cửa. Một khe sáng. {chi_dai} bước ra trước, phủi áo, nhìn xuống bạn._
    chi_dai: Bla bla… TUẤT… NGOAN… bla. # phu_de:Giỏi lắm {cho}. Trưa nay chị cho thịt kho.
    ~ qh("chi_dai", 8)
    ~ qh("it", 4)
    ~ ch_cung(5)
    _{giam_doc} bước ra sau, tóc dựng đứng. Ông ấy cũng xoa đầu bạn, nhưng tay vẫn còn run._
    ~ qh("giam_doc", 3)
* [🏃 Chạy đi tìm bác.]
    _Bạn chạy ra chòi, cắn ống quần bác kéo vào. Bác hiểu ngay. Bác luôn hiểu ngay._
    bac_bao_ve: Bla bla… bla bla. # phu_de:Ừ, bác biết rồi. Đi gọi thằng {it}.
    ~ qh("bac_bao_ve", 3)
    ~ ch_cung(3)
    _Hai mươi phút sau cửa mới mở. Bên trong, {giam_doc} đang kể chuyện hồi khởi nghiệp. {chi_dai} trông như vừa ở tù hai mươi năm._
* [👃 Ngửi khe cửa. Bên trong đang có chuyện gì?]
    ~ ch_mui(2)
    _Mùi mồ hôi sợ hãi của một người đàn ông. Mùi dầu xoa bóp bình tĩnh của một người phụ nữ. Và mùi một tờ giấy ngân hàng nằm trong túi áo vest, rất mới, rất đáng sợ._
    _Bạn ngồi im canh ngoài cửa. Tới khi có người tới, bạn vẫn ngồi đó._
- -> END

// ------------------------------------------------------------
=== cho_1510_tu_lanh_tat ===
# ngay:15 # gio:10:30 # noi:pantry # bat_buoc
_Không có điện, tủ lạnh chung tắt. Cửa tủ mở ra, hơi lạnh cuối cùng bay đi như một linh hồn._
ke_toan: Bla bla… bla bla bla. # phu_de:Mất điện cả ngày thì mấy món này chiều là hư. Ai của ai thì lấy, không thì… chia.
_CHIA. Bạn không biết từ đó. Nhưng bạn thấy mọi người bắt đầu nhìn xuống chân. Nhìn bạn._
hong_hot: Bla bla… TUẤT… ĂN! # phu_de:{cho} ơi, sữa chua nè! Sắp hư rồi, ăn giùm chị!
thuc_tap_sinh: Bla bla… XÚC XÍCH… bla! # phu_de:Dạ em còn cây xúc xích, chia {cho} nửa nha!
con_ong_chau_cha: Bla bla bla? # phu_de:Ủa sao không mua tủ lạnh có pin dự phòng luôn? Thôi, ăn nửa cái bánh kem này đi {cho}.
_Đồ ăn từ bốn phía. Bạn chưa từng thấy cảnh này kể cả trong mơ. Đây là ngày hạnh phúc nhất tháng 10. Có lẽ là nhất đời._
* [🦴 Ăn mọi thứ người ta đưa.]
    ~ ch_an(60)
    ~ ch_cung(5)
    _Sữa chua. Xúc xích. Bánh kem. Một miếng thịt kho của {ke_toan} (người này cho mà không hỏi hóa đơn, lần đầu tiên trong lịch sử)._
    _Bạn ăn tới mức phải nằm nghiêng. Mũi bạn đầy mùi ngọt, không phân biệt được gì nữa._
    ~ ch_mui(-3)
* [🎁 Ăn một ít, tha phần ngon nhất về kho.]
    ~ ch_an(30)
    ~ nhan(xuc_xich)
    _Bạn tha nửa cây xúc xích về kho, chạy lên, ăn tiếp, rồi lại tha. Kho của bạn giờ là tủ lạnh dự phòng duy nhất của cả tòa nhà._
* [🐾 Đi một vòng cảm ơn từng người bằng cách dụi đầu vào chân.]
    ~ ch_an(40)
    ~ ch_cung(7)
    ~ qh("ke_toan", 3)
    ~ qh("hong_hot", 3)
    ~ qh("thuc_tap_sinh", 3)
    _Bạn dụi đầu vào từng đôi chân. Ai cũng cười. Trong bóng tối, cười dễ hơn. Không ai phải giữ mặt._
- -> END

// ------------------------------------------------------------
=== cho_1510_gam_ban_pantry ===
# ngay:15 # gio:14:30 # noi:pantry # bat_buoc
_Chiều. Pantry tối om, chỉ có vài ngọn nến của phòng họp "Sáng Tạo" hắt sang. Bạn nằm dưới gầm bàn. Trong bóng tối, không ai để ý một con chó._
_Trên đầu bạn, hai người đang thì thầm._
hong_hot: Bla bla… bla… bla bla bla… # phu_de:Nói nhỏ thôi… ông nghe ai nói trang 47 hả? Chị {ke_toan} mới nói với chị {chi_dai} ở đây hồi nãy đó.
ran_doc: Bla… bla bla… # phu_de:Tui chỉ nói sự thật thôi mà. Hoàn tiền gấp đôi. Mười tỷ.
{ ch_mui_thinh >= 60:
    _👃 Mùi trên áo {ran_doc}: trà sữa 🧋, mực bút bi 🖊️, và mùi một nhà kho cũ 📦 có lỗ thông gió, mùi cây me phía ngoài._
}
_Xa hơn một chút, ở góc pantry, có một người ngồi cạnh {chua_te_deadline}. Người này không đội mũ. Giọng rất nhỏ, hay "ờm…"._
_Nhưng cái mùi. Bánh chuối chiên. Nước hoa hồng. Là NÓ. Không có mũ. Không có màu hồng trong bóng tối. Chỉ có mùi._
_Bên cạnh, cái ly của {chua_te_deadline} bốc mùi cà phê sữa đá. Giống hệt. Giống hệt mùi cái USB trong kho của bạn._
~ ch_mui(3)
* [👃 Đánh hơi chân {ran_doc}.]
    ran_doc: *(giật nảy)* Bla! Bla bla bla! # phu_de:Á! Chuột hả trời!
    _Câu chuyện dừng lại. Hai người tản ra. Bạn được thêm một cái mùi vào bộ nhớ._
    ~ ch_mui(2)
* [🦴 Ngồi im, chờ ai đó làm rơi đồ ăn.]
    _{hong_hot} làm rơi nửa cái bánh bông lan. Bạn ăn không một tiếng động. Bạn nghe hết câu chuyện. Bạn không hiểu, nhưng bạn nhớ giọng điệu: giọng của người đang sợ._
    ~ ch_an(10)
    ~ phat_hien(trang_47)
* {co(usb_khong_nhan) && ch_mui_thinh >= 60} [🔒 Chạy về kho, ngậm cái USB, đặt lên đùi {chua_te_deadline}.]
    _Bạn chạy xuống gầm cầu thang trong bóng tối. Ngậm cái USB không nhãn, chạy lên. Đặt nó lên đùi người có mùi cà phê sữa đá._
    chua_te_deadline: Bla… bla bla… bla… # phu_de:Cái gì đây… khoan… cái USB này… trời ơi…
    chua_te_deadline: Bla bla… TUẤT… bla… NGOAN… NGOAN… NGOAN… # phu_de:{cho}… em kiếm đâu ra… ngoan… ngoan quá… ngoan…
    _Người đó ôm bạn. Run run. Tim đập nhanh như vừa chạy deadline. Người không đội mũ bên cạnh nhìn hai bạn, cười rất nhẹ._
    ~ mat(usb_khong_nhan)
    ~ ch_so_mon_kho = ch_so_mon_kho - 1
    ~ ch_tra_usb_cho_vu = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("chua_te_deadline", 40)
    ~ ch_cung(8)
    _Ngày mai, người này mua cho bạn năm cây xúc xích. Bạn chưa biết điều đó. Nhưng cái đuôi của bạn hình như biết._
* [🐾 Đi tới góc pantry, ngồi trước người không đội mũ.]
    _Bạn ngồi trước mặt người đó. Nhìn. Người đó nhìn lại, trong bóng tối, khuôn mặt bình thường, hơi gầy, mắt hiền._
    sieu_nhan_hong: *(thì thầm)* Bla… TUẤT? Bla bla… bla bla. # phu_de:{cho}? Em nhận ra anh hả? Đừng sủa nha… làm ơn.
    * * [😤 Sủa.]
        cho: Gâu!
        _Người đó lấy tay che mặt. Ai đó bật đèn pin điện thoại. Nhưng chỉ thấy một bàn tay che mặt và một con chó đang sủa._
        ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 5
        ~ ch_hong_doi(3)
    * * [😶 Không sủa. Nằm xuống cạnh chân người đó.]
        _Bạn không sủa. Bạn không biết vì sao. Có thể vì trong bóng tối, người này chỉ là một mùi. Và mùi thì không biết chọc chó._
        ~ ch_hong_doi(-8)
        ~ qh("sieu_nhan_hong", 8)
        sieu_nhan_hong: *(rất nhỏ)* Bla bla… bla. # phu_de:Cảm ơn em. Mai anh không chọc em nữa. Chắc vậy.
* [💩 Không ai thấy đâu mà…]
    ~ ch_de_qua("van_phong")
    _Không ai thấy thật. Cho tới 8 giờ sáng mai, khi có điện lại._
    _Cả công ty thấy. Không ai nghi ai khác._
- -> END

// ------------------------------------------------------------
=== cho_1510_cong_vien_trong_toi ===
# ngay:15 # gio:18:40 # noi:pantry
_Tối. Vẫn không có điện. Mọi người về gần hết. Trong pantry chỉ còn một ngọn nến và hai người._
_Một người đeo kính đen trong bóng tối (vì sao vậy?). Người đó bắt đầu hát, rất nhỏ:_
idol_het_thoi: Bla bla bla bla… bla bla bla bla… bla bla bla… # phu_de:"Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên… thích ăn chuối chiên…"
_Người thứ hai ngồi trong góc, giơ điện thoại lên quay, không dám thở mạnh. Mắt người đó như hai ngọn nến._
_Giọng hát hay. Không giống tiếng người ta hát ở karaoke. Giống tiếng mưa đêm hôm bác nhặt được bạn._
* [🐾 Tru theo. Bạn cũng có cảm xúc.]
    cho: Auuuu… auuu…
    _Người đeo kính đen giật mình, rồi bật cười, rồi hát tiếp, để bạn tru bè. Một bản song ca người và chó._
    _Người đang quay suýt làm rơi điện thoại vì nín cười._
    ~ qh("idol_het_thoi", 8)
    ~ qh("editor", 4)
    ~ ch_tuat_noi_hon_nguyen = true
* [😴 Nằm xuống cạnh ngọn nến, nghe hết bài.]
    _Bạn nằm nghe. Hết bài, người đeo kính đen tháo kính ra lau mắt. Người đang quay tắt máy, nói khẽ "hay lắm". Rồi cả hai im lặng._
    ~ qh("idol_het_thoi", 5)
    ~ nghi(15)
* [🦴 Đi xin miếng cá viên chiên trong túi người đeo kính.]
    _Túi áo người này có mùi cá viên chiên thật. Người này lúc nào cũng mang theo một bịch nhỏ, như mang theo bài hát của mình._
    idol_het_thoi: Bla bla… TUẤT… bla… ĂN. # phu_de:Em biết anh là ai không? Không biết hả? Ừ… thôi, ăn đi.
    ~ ch_an(10)
    ~ qh("idol_het_thoi", 4)
- -> END

// ------------------------------------------------------------
=== cho_1610_xe_dao_cu ===
# ngay:16 # gio:06:45 # noi:bai_xe
_Sáng sớm. Ba chiếc xe tải chở đạo cụ đỗ ở bãi xe, chuẩn bị đi Đài Tivi Hóng. Trong thùng xe có mùi bánh chuối chiên. Rất nhiều bánh chuối chiên._
_Bạn đã nằm sẵn trong thùng xe số 2 từ 6 giờ. Giữa hai cái hộp đạo cụ. Không ai biết._
_Rồi tấm bạt bị kéo ra. Một gương mặt. Mùi dầu xoa bóp. Bộ đàm kêu rè rè._
chi_dai: Bla bla… TUẤT. Bla bla bla bla. # phu_de:{cho}. Em làm chị trễ 30 phút là chị cột em vô bao cát tập đấm luôn nha. Giỡn thôi. Ra.
* [🐾 Ngoan ngoãn nhảy xuống.]
    _Bạn nhảy xuống. {chi_dai} xoa đầu bạn một cái nhanh, rồi hét vào bộ đàm. Xe chạy đúng giờ._
    ~ qh("chi_dai", 5)
    ~ ch_cung(3)
    ~ follow(5000)
* [😴 Giả vờ ngủ say.]
    _Bạn nằm im, thở đều. {chi_dai} thở dài, bế bạn lên bằng một tay, tay kia vẫn cầm bộ đàm. Người này bế một con chó như bế một bao cát tập đấm._
    chi_dai: Bla bla… bla. # phu_de:Ngủ cái gì mà đuôi còn vẫy.
    _Xe chạy trễ 10 phút._
    ~ qh("chi_dai", 2)
* [😤 Gầm gừ, giữ chặt chỗ của mình.]
    cho: Grừ…
    _{chi_dai} nhìn bạn. Bạn nhìn {chi_dai}. Một cuộc đấu mắt ngắn ngủi. Bạn thua._
    _Bạn bị bế xuống. Xe chạy trễ 30 phút. Cả ngày, {chi_dai} gọi bạn là "đồ phá đám" bằng giọng không giận lắm._
    ~ qh("chi_dai", -4)
    ~ follow(-5000)
- -> END

// ------------------------------------------------------------
=== cho_1610_buffet ===
# ngay:16 # gio:12:00 # noi:sanh_tang_tret
_Ngày Lương thực Thế giới. Công ty bày buffet ở sảnh. Hôm nay vắng: nửa công ty đi Đài Tivi Hóng. Nửa còn lại ăn gấp đôi._
_Bàn buffet cao. Mùi gà rán, mùi chả giò, mùi bánh chuối chiên (còn sót từ phòng chờ)._
* [🦴 Mắt cún trước người đang cầm đĩa đầy nhất.]
    _Người đầy đĩa nhất là {dan_dau_tu}. Người này ăn như sắp không còn được ăn nữa._
    dan_dau_tu: Bla bla… KHÔNG… bla bla. # phu_de:Không được đâu, bữa nay tui ăn trừ cơm ba ngày.
    _Nhưng một miếng chả giò vẫn rơi xuống. Có thể là vô tình. Có thể không._
    ~ ch_an(15)
* [🏃 Chạy lòng vòng quanh bàn buffet cho mọi người rối.]
    _Bạn chạy. Một vòng. Hai vòng. Một đĩa gà rán nghiêng. Ba miếng rơi. Bạn là cơn bão vàng của Ngày Lương thực._
    ~ ch_an(30)
    ~ ch_cung(-5)
    ke_toan: TUẤT! Bla bla bla! # phu_de:{cho}! Ba miếng gà là 45 nghìn đó nha!
    ~ qh("ke_toan", -3)
* [🎁 Tha một miếng gà về cho bác ở chòi.]
    _Bác đang trực, không lên ăn được. Bạn mang miếng gà ngon nhất xuống. Bác bẻ đôi, như mọi lần._
    ~ ch_an(15)
    ~ qh("bac_bao_ve", 4)
- _15 giờ, trà sữa thứ 6. Ly của {thuc_tap_sinh} có trân châu dư. Bạn nhận phần dư._
~ ch_an(5)
{ ch_tra_usb_cho_vu:
    _Chiều, {chua_te_deadline} xuống chòi, tay xách một túi nilon. Năm cây xúc xích. Đúng năm cây._
    chua_te_deadline: Bla bla… TUẤT… XÚC XÍCH… bla bla. # phu_de:{cho}, xúc xích nè. Năm cây. Lần đầu tiên trong đời anh giữ lời đúng hạn đó.
    ~ ch_an(40)
    ~ nhan(xuc_xich)
    _Bạn ăn hai cây, giấu ba cây. Người này ngồi xổm xem bạn ăn, cười như người vừa thoát một deadline lớn nhất đời._
}
-> END

// ------------------------------------------------------------
=== cho_1610_tivi_trong_choi ===
# ngay:16 # gio:20:00 # noi:choi_bao_ve # bat_buoc
_Tối. Bác bật cái tivi nhỏ trong chòi. Màn hình hiện một sân khấu sáng choang, chữ to: "HỒNG HAY KHÔNG HỒNG"._
_Và giữa sân khấu: NÓ._
bac_bao_ve: Bla bla… HỒNG… bla. # phu_de:Đây, anh {sieu_nhan_hong} lên tivi rồi.
~ follow(80000)
* [😤 Sủa vào màn hình. Không ngừng.]
    cho: GÂU! GÂU! GÂU GÂU GÂU!
    ~ ch_lan_sua_hong = ch_lan_sua_hong + 1
    _Bạn sủa suốt một tiếng. Bác vặn to âm lượng. Bạn sủa to hơn. Hàng xóm gõ cửa chòi hỏi có trộm không._
    ~ ch_hong_doi(3)
* [😴 Nằm xem với bác, thỉnh thoảng gầm gừ.]
    _Bạn nằm xem. Thỉnh thoảng "grừ". Bác thỉnh thoảng "ừ". Hai ông cháu bình luận gameshow theo cách của mình._
* [👃 Ngửi cái tivi.]
    _Tivi có mùi bụi nóng và mùi dầu gió của bác. Không có mùi bánh chuối chiên. Cái thứ trong tivi không phải là NÓ thật. Bạn hơi thất vọng, hơi nhẹ nhõm._
    ~ ch_mui(1)
- _Phần "Hit Một Thời". Người đồ hồng hát "Công Viên". Sai lời: "bán cá viên chiên tại công viên, thích ăn… khoai chiên"._
_Rồi từ đâu đó phía sau sân khấu, một giọng hát bè vang lên, rất chuẩn. Giọng người đeo kính đen trong pantry tối qua._
bac_bao_ve: *(gật gù)* Bla bla… bla. # phu_de:Thằng {idol_het_thoi} hát bè đấy. Vẫn hay.
_Rồi người dẫn chương trình, vest bóng, cười truyền hình, chĩa micro vào bộ đồ hồng._
mc_tivi_hong: Bla bla bla… MŨ… bla bla… MŨ… bla bla bla MŨ? # phu_de:Câu hỏi cuối! Bao giờ anh tháo mũ? Khán giả muốn thấy mặt sau chiếc mũ! Anh có dám tháo mũ ngay bây giờ?
_MŨ. MŨ. MŨ. Người đó lặp lại ba lần, chỉ tay vào cái thứ tròn tròn hồng hồng trên đầu kẻ thù. Cái thứ bạn muốn ngoạm nhất trên đời._
~ ch_hoc_tu(ch_tv_mu)
_📖 Từ mới: MŨ. Nghĩa: chiến lợi phẩm tối thượng._
sieu_nhan_hong: Bla… bla bla… bla. # phu_de:Ờm… Hồng không phải màu… Hồng là… thái độ. Mũ để sau nha.
_Người đồ hồng không tháo. Bạn nhìn cái {ch_mu()} trên màn hình đến khi chương trình hết. Bác tắt tivi. Bạn vẫn nhìn vào màn hình đen._
-> END
