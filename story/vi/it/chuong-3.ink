// ============================================================
// IT: BẢO · CHƯƠNG 3: "NGÀY KHÔNG CÓ ĐIỆN" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== it_1310_ngay_doanh_nhan ===
# ngay:13 # gio:09:45 # noi:sanh_tang_tret
_Ngày Doanh nhân Việt Nam. {giam_doc} tự ôm một bó hoa tặng chính mình. {thanh_ninh} cầm micro, chuẩn bị đọc bài phát biểu khen 15 phút._
_Bạn đứng sau bàn mixer mini. Micro này có tật: cứ tới chữ "anh" là hú._
thanh_ninh: Kính thưa anh {giam_doc}, người doanh nhân có tâm, có tầm, có…
_HÚÚÚÚ! Micro hú. Cả sảnh bịt tai._
* [🎚️ Kéo cần âm lượng xuống, chỉnh lại cho chuẩn.]
    _Bạn kéo nhẹ cần gain, lọc tần số hú. Giọng {thanh_ninh} vang đều, rõ, ngọt như mật._
    thanh_ninh: …có tầm nhìn xa như đại bàng, anh nói chuẩn quá anh ơi!
    giam_doc: *(lau nước mắt)* Âm thanh hôm nay tốt nhỉ. Ai làm đấy?
    thanh_ninh: Dạ… em chuẩn bị kỹ lắm ạ!
    _{thanh_ninh} nhận công. Bạn không bất ngờ._
    ~ qh("thanh_ninh", 5)
    ~ uy_tin = uy_tin + 3
* [🐍 Để micro hú thêm vài lần. Bài khen 15 phút sẽ thành 5 phút.]
    _HÚÚ! "…có tâm…" HÚÚ! "…có tầm…" HÚÚÚ! Sau phút thứ 4, {giam_doc} giơ tay ra hiệu "thôi đủ rồi em"._
    chi_dai: *(thì thầm)* {it} trời sinh ra để làm việc này đó.
    ~ qh("chi_dai", 10)
    ~ qh("thanh_ninh", -15)
    ~ it_do_toi(5)
* [🔇 Tắt micro, để {thanh_ninh} đọc bằng giọng thật.]
    _Không micro, giọng {thanh_ninh} chỉ tới được hàng ghế đầu. Hàng sau được 11 phút nghỉ ngơi._
    ~ qh("thanh_ninh", -5)
    ~ cang_thang(-5)
- _Sau buổi lễ, {sales} đưa bạn một file in: giấy chứng nhận "Doanh nhân của năm" của Tập đoàn BTT Global, khổ A3, phủ bóng._
sales: In giùm em nha anh {it}. Màu vàng kim nha. Mr. Kevin Trộn ký sẵn rồi đó.
_Chữ ký của "Mr. Kevin Trộn" có thuộc tính file: "Tạo bởi máy QUYNH-PC". Bạn nhìn {sales}. {sales} nhìn lại bạn, cười rất tự tin._
* [🖨️ In. Không hỏi gì.]
    ~ qh("sales", 5)
    _Chiều đó tờ giấy được treo trong phòng giám đốc, ngay giữa tường._
* [💬 "Máy in hết màu vàng kim."]
    sales: Vậy in màu vàng thường cũng được. Tin em đi, nhìn xa giống vàng kim y chang.
    ~ qh("sales", 2)
    ~ it_lt(2)
- -> END

// ------------------------------------------------------------
=== it_1410_giong_ca_uoc_mo ===
# ngay:14 # gio:20:15 # noi:phong_server
_Mốc 2: 200.000 người theo dõi. Bạn ngồi trong phòng server, ăn mì, mở cái TV cũ lên cho đỡ buồn._
_Đài Tivi Hóng đang phát vòng 2 "Giọng Ca Ước Mơ". Thí sinh số 27 bước ra, bộ đồ kim tuyến lấp lánh._
_Đó là {thanh_xin_nghi}. Người sáng nay xin nghỉ "về quê phụ gặt lúa"._
{ nguoi_theo_doi < 200000:
    _Điện thoại bạn rung: tin nhắn của {hong_hot}: "Mình trượt mốc 2 rồi. Siêu Nhân Hồng buồn, bỏ đi giúp người cả ngày. Ét o ét."_
}
_{thanh_xin_nghi} hát. Hát hay thật. Bạn quên cả gắp mì._
~ phat_hien(son_thi_hat)
_Điện thoại rung lần nữa. {hr}: "Anh {it} ơi, anh check giúp em hôm nay {thanh_xin_nghi} có đăng nhập máy công ty không ạ?"_
* [🤐 "Không thấy đăng nhập." Đúng sự thật, chỉ không đủ sự thật.]
    hr: Dạ em cảm ơn anh. Em chỉ muốn lắng nghe thôi.
    ~ it_lt(2)
    ~ qh("thanh_xin_nghi", 10)
* [📺 Chụp màn hình TV gửi {hr}.]
    hr: Ồ. Ồ ồ. Em cảm ơn anh. Mai em mời {thanh_xin_nghi} lên uống trà.
    _Bạn vừa đưa một người vào Danh Sách Đen. Mì của bạn nguội._
    ~ qh("hr", 10)
    ~ qh("thanh_xin_nghi", -30)
    ~ it_lt(-5)
* [📱 Bình chọn cho thí sinh số 27. Rồi không trả lời {hr}.]
    _Bạn nhắn tin bình chọn 5 lần. Mỗi lần 1.000đ. Đây là khoản đầu tư duy nhất của bạn trong năm._
    ~ tien_cong(-5000)
    ~ qh("thanh_xin_nghi", 5)
    ~ it_do_toi(2)
- -> END

// ------------------------------------------------------------
=== it_1510_thang_may ===
# ngay:15 # gio:08:05 # noi:thang_may # bat_buoc
_8 giờ 05. Mất điện cả tòa nhà. Quạt server tắt. Lần đầu tiên sau nhiều năm, phòng server im lặng như chùa._
_Bộ đàm của bạn rè lên giọng {chi_dai}, từ bên trong thang máy:_
chi_dai: {it}. Chị với anh {giam_doc} kẹt thang máy. Lẹ lên.
giam_doc: *(từ xa)* Em ơi, ở đây không có sóng! Anh đang có cuộc gọi với ngân hàng!
* [🔧 Lấy chìa khóa cứu hộ, mở cửa thang máy bằng tay.]
    _Bạn leo lên tầng 1, dùng chìa tam giác mở cửa. Thang máy kẹt lưng chừng: chỉ thấy đầu {giam_doc} và đôi giày của {chi_dai}._
    chi_dai: Đỡ anh {giam_doc} lên trước. Ổng sợ tối.
    giam_doc: Anh không sợ! Anh chỉ… không thích tối.
    _Mười phút sau cả hai ra ngoài. {chi_dai} vỗ vai bạn một cái, mạnh tới mức bạn đau tới chiều._
    ~ qh("chi_dai", 15)
    ~ qh("giam_doc", 10)
    ~ it_cam_on()
    ~ nghi(-15)
* [📞 Gọi đội cứu hộ thang máy của tòa nhà.]
    _Đội cứu hộ nói "40 phút nữa tới". Trong 40 phút đó, {giam_doc} kể cho {chi_dai} nghe toàn bộ hành trình khởi nghiệp._
    chi_dai: *(qua bộ đàm)* {it}. Lần sau em tự mở. Chị nghe đủ 2010 tới 2026 rồi.
    ~ qh("chi_dai", -5)
    ~ qh("giam_doc", 3)
* [💬 "Anh tắt đi bật lại thử chưa?"]
    chi_dai: {it}. Mất. Điện.
    it: …Dạ. Em lên liền.
    _Bạn chạy lên mở cửa. {chi_dai} không nói gì. {giam_doc} thì cười, vì lần đầu thấy có người dám đùa với {chi_dai}._
    ~ qh("chi_dai", -3)
    ~ qh("giam_doc", 5)
- -> END

// ------------------------------------------------------------
=== it_1510_bo_luu_dien ===
# ngay:15 # gio:10:00 # noi:phong_server # bat_buoc
_Bộ lưu điện kêu "tít… tít…". Còn 40 phút. Ba người chạy tới cùng lúc._
editor: *(ngáp)* Anh {it}… bản render MV phiên bản hai còn 12 phút nữa là xong. Cắt điện là em làm lại từ đầu…
chi_dai: {it}, tủ lạnh có bánh kem 20/10 cho chị em. Hư là chị xử em.
giam_doc: *(gọi điện lần thứ 6)* {it} ơi phòng anh nóng quá. Em ưu tiên cho anh cái điều hòa nhé.
* [💾 Cấp điện cho server.]
    _Render xong ở phút thứ 12. {editor} đăng ngay. Còn cái bánh kem thì bắt đầu chảy như tuyết tan._
    ~ qh("editor", 20)
    ~ follow(10000)
    ~ qh("chi_dai", -5)
    chi_dai: *(nhìn bạn rất lâu, không nói gì)*
* [🎂 Cấp điện cho tủ lạnh pantry.]
    _Bánh kem sống sót, lạnh tanh, chờ tới 20/10. {editor} nhìn màn hình đen, gục xuống._
    editor: Không sao… em quen rồi… đêm nay em thức thêm…
    ~ qh("chi_dai", 15)
    ~ qh("editor", -10)
* [❄️ Cấp điện cho điều hòa phòng giám đốc.]
    giam_doc: Em hiểu chuyện đấy. Anh ghi nhận.
    ~ uy_tin = uy_tin + 10
    ~ qh("giam_doc", 10)
    ~ it_do_toi(10)
    ~ qh("editor", -15)
    ~ qh("chi_dai", -10)
    _Cả công ty còn lại nhìn bạn như nhìn kẻ phản bội. Phòng giám đốc mát rượi._
* [🔌 Chia đều cho cả ba.]
    { RANDOM(1, 10) <= 5:
        _Cả ba trụ được 13 phút. Render vừa xong, bánh hơi mềm, sếp hơi nóng. Ai cũng hài lòng một chút, và không ai hài lòng hẳn._
        ~ qh("editor", 5)
        ~ qh("chi_dai", 5)
        ~ qh("giam_doc", 3)
        ~ follow(5000)
    - else:
        _Bộ lưu điện kêu "bụp", rồi bốc một làn khói mỏng. Không ai được gì cả._
        ~ it_do_toi(25)
        ~ it_on(-10)
        ~ cang_thang(15)
    }
- -> END

// ------------------------------------------------------------
=== it_1510_pantry_toi ===
# ngay:15 # gio:15:00 # noi:pantry
_Chiều. Không điện, không wifi, không ai làm được gì. Cả công ty ra pantry ngồi. Bạn cầm đèn pin, vì người ta luôn đưa đèn pin cho IT._
_Ở góc tối, {ke_toan} nói nhỏ với {chi_dai}. Bạn không cố nghe. Nhưng phòng tối thì tai thính._
ke_toan: …trang 47 đó bà. Không đạt một triệu là hoàn mười tỷ. Gấp đôi. Ảnh ký mà hông đọc.
chi_dai: Mười tỷ? Vậy là cả công ty…
ke_toan: Ừ. Cả công ty.
_Đèn pin trên tay bạn hơi run. Mười tỷ. Đêm 31/10, chiến dịch sống bằng livestream. Livestream sống bằng mạng. Mạng sống bằng… bạn._
~ phat_hien(trang_47)
* [😶 Tắt đèn pin. Giả vờ không nghe.]
    _Bạn tắt đèn. Trong bóng tối, bạn nhẩm lại danh sách thiết bị cần cho Đại Nhạc Hội Siêu Nhân. Lần đầu tiên, danh sách đó có cảm giác nặng._
    ~ it_lt(3)
    ~ cang_thang(10)
* [💬 "Em nghe rồi. Đêm 31 mạng không rớt."]
    ke_toan: *(giật mình)* Ông nghe hả? …Ờ. Vậy thì giữ mạng giùm tui. Ông là người duy nhất tui tin cái vụ này.
    chi_dai: {it}. Nghe xong thì quên. Nhưng việc thì nhớ.
    ~ qh("ke_toan", 10)
    ~ qh("chi_dai", 10)
    ~ it_on(5)
* [🔦 Chiếu đèn pin lên trần, rủ cả pantry chơi đoán bóng tay.]
    _Bạn làm bóng con chó. {cho} sủa cái bóng. Cả pantry cười. Chuyện mười tỷ trôi đi trong tiếng cười, nhưng không biến mất._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ qh("cho", 5)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== it_1510_cong_vien_trong_toi ===
# ngay:15 # gio:19:30 # noi:pantry
_Tối. Vẫn chưa có điện. Trong pantry chỉ còn vài người. {idol_het_thoi} ngồi trên quầy bếp, ôm cây đàn guitar không ai biết từ đâu ra._
idol_het_thoi: Không có micro, không có đèn. Hồi anh còn nổi, mấy show kiểu này người ta trả gấp đôi đó.
_{idol_het_thoi} bắt đầu hát "Công Viên". Không phải giọng sân khấu. Giọng thật. {editor} lặng lẽ giơ điện thoại lên quay._
* [🔦 Chiếu đèn pin thật nhẹ lên {idol_het_thoi}, như đèn sân khấu.]
    _Một vòng sáng nhỏ trên khuôn mặt {idol_het_thoi}. Trong clip của {editor}, nó đẹp như một MV làm bằng cả tỷ đồng._
    editor: *(thì thầm)* Anh {it}… giữ nguyên đó… đừng nhúc nhích…
    ~ qh("editor", 10)
    ~ qh("idol_het_thoi", 10)
* [🎵 Gõ nhịp nhẹ lên thùng mì ly.]
    _Thùng mì ly kêu "bộp bộp" đúng phách. {idol_het_thoi} cười, hát to hơn. Đây là ban nhạc tệ nhất và vui nhất từng biểu diễn ở {cong_ty}._
    ~ qh("idol_het_thoi", 15)
    ~ cang_thang(-15)
* [😶 Ngồi nghe trong bóng tối.]
    _Bạn nhớ năm 2016, hội chợ, trời mưa, sợi dây loa giật bạn một cái. Lúc đó cũng là bài này._
    ~ cang_thang(-10)
- _Bài hát hết. Không ai vỗ tay ngay. Một lúc sau mới vỗ._
-> END

// ------------------------------------------------------------
=== it_1610_tai_nghe_hong ===
# ngay:16 # gio:13:00 # noi:dai_tivi_hong
_Đài Tivi Hóng, phòng kỹ thuật. Đài có đủ thiết bị. Chỉ thiếu một thứ: tai nghe in-ear màu hồng. {sieu_nhan_hong} nhất quyết không đeo tai nghe đen._
sieu_nhan_hong: Ông {it} ơi, tai nghe đen nó không hợp thái độ. Hồng không phải màu, hồng là thái độ mà!
quan_ly_idol: Khoan, anh nghe máy chút… Ừ… Ừ… {it}, em xử lý giùm anh, 2 giờ là quay rồi.
* [💅 Mượn lọ sơn móng tay hồng của {hong_hot}, sơn lên tai nghe.]
    hong_hot: Màu "Hồng Drama" đó nha anh. Trả lại tui nguyên lọ!
    _Bạn sơn hai lớp, thổi khô bằng máy sấy của phòng hóa trang. Tai nghe giờ hồng chói lóa._
    sieu_nhan_hong: SLAY! Ông là thiên tài!
    ~ it_tai_nghe_hong = true
    ~ qh("sieu_nhan_hong", 15)
    ~ qh("hong_hot", 3)
* [🛒 Chạy ra chợ mua tai nghe hồng loại rẻ.]
    ~ tien_cong(-150000)
    _Tai nghe hồng giá 150 nghìn, có hình con mèo. Âm thanh hơi rè, nhưng hồng._
    ~ it_tai_nghe_hong = true
    ~ qh("sieu_nhan_hong", 10)
    ~ it_on(-5)
* [💬 "Đeo đen. Đội mũ ai thấy đâu."]
    sieu_nhan_hong: Ờ… cũng đúng… nhưng mà em biết là nó đen…
    _{sieu_nhan_hong} đeo tai nghe đen với vẻ mặt của người vừa mất một phần linh hồn._
    ~ qh("sieu_nhan_hong", -10)
- -> END

// ------------------------------------------------------------
=== it_1610_hit_mot_thoi ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
_14:00. Gameshow "Hồng Hay Không Hồng" bắt đầu quay, 20:00 tối nay phát sóng. Phần "Hit Một Thời". Ban nhạc chơi "Công Viên". {sieu_nhan_hong} cầm micro, tự tin bước ra._
sieu_nhan_hong: Ngày xưa có đôi bạn thân, bán… *(ngập ngừng)* …bán khoai chiên tại công viên…
_Khán giả cười. MC Đài Tivi Hóng nhướng mày. Ở cánh gà, {idol_het_thoi} đứng nhìn, mặt đanh lại._
_Bạn ngồi sau bàn kỹ thuật phụ, tay đặt trên kênh tai nghe của {sieu_nhan_hong} và kênh micro dự phòng ở cánh gà._
* {it_tai_nghe_hong} [🔒 Nhắc lời qua tai nghe hồng: "Cá viên chiên. Chuối chiên."]
    sieu_nhan_hong: …à, CÁ VIÊN CHIÊN tại công viên, thích ăn CHUỐI CHIÊN!
    _Khán giả vỗ tay. "Khoai chiên" thành một câu đùa dễ thương thay vì một tai nạn._
    ~ follow(20000)
    ~ qh("sieu_nhan_hong", 10)
* [🎤 Mở micro dự phòng ở cánh gà, chỗ {idol_het_thoi} đang đứng.]
    _Đèn đỏ trên micro cánh gà bật sáng. {idol_het_thoi} nhìn nó. Nhìn bạn. Rồi cất giọng hát bè._
    _Hai giọng hòa vào nhau: một giọng sai lời nhưng nhiệt tình, một giọng đúng lời và đã đợi mười năm._
    ~ follow(30000)
    ~ qh("idol_het_thoi", 20)
    ~ qh("quan_ly_idol", 10)
    quan_ly_idol: *(từ xa, môi mấp máy)* Cảm ơn em.
    ~ it_cam_on()
* [🎚️ Hạ nhạc nền, để tiếng cười của khán giả át đi.]
    _Bài hát trôi qua trong tiếng cười. Không hay, không dở. MC chuyển phần rất nhanh._
    ~ follow(5000)
- _Hết phần thi. Bạn kéo các cần âm lượng về 0, thở ra._
-> END

// ------------------------------------------------------------
=== it_1610_buffet ===
# ngay:16 # gio:19:00 # noi:pantry
_Ngày Lương thực Thế giới. 19:00, công ty mở tiệc buffet chờ gameshow lên sóng lúc 20:00. Ai cũng ăn mừng. Ai cũng cần sạc điện thoại._
quan_ly_idol: {it}, cho anh mượn cục sạc. Anh có 2 điện thoại, cả hai đều 3%.
_Đây là lần thứ 16 trong tháng {quan_ly_idol} mượn sạc. Không lần nào trả._
* [🔌 Đưa cục sạc. Như mọi ngày.]
    quan_ly_idol: Cảm ơn em. Mai anh trả. Hứa.
    ~ qh("quan_ly_idol", 5)
    ~ it_cam_on()
* [🤝 Dán nhãn tên "{quan_ly_idol}" lên cục sạc, tặng luôn.]
    quan_ly_idol: Tặng anh hả? Ủa… lâu lắm rồi mới có người tặng anh cái gì đó.
    ~ qh("quan_ly_idol", 15)
    ~ tien_cong(-120000)
- _Bạn lấy một đĩa đầy: gà rán, bánh bao, chè. Bữa ăn đầu tiên trong tuần không phải mì ly._
~ an(100)
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
// Cám dỗ ngẫu nhiên: hệ thống báo một tin nhắn riêng "đáng ngờ"
=== it_tudo_tin_nhan_rieng ===
# ngau_nhien # noi:phong_server
_Hệ thống lọc thư rác của công ty bắt được một tin nhắn riêng, gắn cờ "nội dung nhạy cảm". Người gửi: {ten(ran_thu_hai)}. Người nhận: một số lạ._
_Bạn chỉ cần bấm "Xem chi tiết". Không ai biết. Hoặc là có._
+ [🤐 Bấm "Bỏ qua". Tin nhắn riêng là của người ta.]
    ~ it_lt(3)
    _Bạn bấm bỏ qua. Cái quạt công nghiệp quay đều. Bạn thấy mình sạch sẽ, dù hơi tò mò._
+ [👁️ Bấm "Xem chi tiết".]
    ~ it_doc_tin_rieng()
    _Tin nhắn: "Mai 9h ở tòa nhà xanh nhé. Mang theo cái kia." Không rõ "cái kia" là gì. Bạn đọc thêm 20 tin nữa, không liên quan, nhưng vẫn đọc._
    { RANDOM(1, 10) <= 3:
        ~ it_bi_phat_hien_doc_trom = true
        ~ it_nguoi_to = ran_thu_hai
        _Màn hình máy {ten(ran_thu_hai)} hiện cảnh báo "Phiên đăng nhập lạ từ SERVER-IT". Bạn không biết là nó vừa hiện._
        ~ qh(ran_thu_hai, -20)
    - else:
        ~ it_truy_cap(3)
    }
+ [📜 Chỉ đọc log kết nối, không đọc nội dung.]
    _Log: máy của {ten(ran_thu_hai)} kết nối tới một mạng ở Ven Đô 4 lần trong tuần. Không đọc chữ nào của ai. Nhưng đủ để bạn để ý._
    ~ it_truy_cap(5)
    ~ phat_hien(ran_thu_hai_lo_mat)
- -> END

// ------------------------------------------------------------
// Cám dỗ ngẫu nhiên: điện thoại ai đó để quên ở phòng server
=== it_tudo_dien_thoai_bo_quen ===
# ngau_nhien # noi:phong_server
_Ai đó nhờ bạn sửa điện thoại rồi để quên trên bàn. Màn hình sáng: một tin nhắn mới hiện lên, chưa đọc. Không có mật khẩu._
+ [🔌 Úp điện thoại xuống, dán giấy "Của ai ra lấy".]
    ~ it_lt(3)
    ~ it_cam_on()
    _Một tiếng sau, chủ điện thoại quay lại, thấy tờ giấy, cười: "Anh {it} đúng là két sắt."_
+ [👁️ Lướt đọc một chút.]
    ~ it_doc_tin_rieng()
    { RANDOM(1, 10) <= 3:
        ~ it_bi_phat_hien_doc_trom = true
        ~ it_nguoi_to = "hong_hot"
        _Đúng lúc đó {hong_hot} bước vào lấy điện thoại. {hong_hot} nhìn màn hình đang mở, rồi nhìn bạn. Không nói gì. Ánh mắt nói hết._
        ~ qh("hong_hot", -30)
    - else:
        _Toàn chuyện đặt trà sữa. Bạn úp điện thoại xuống, thấy mình hơi tệ._
    }
- -> END
