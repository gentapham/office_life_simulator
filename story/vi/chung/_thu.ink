// ============================================================
// SỰ KIỆN NGẪU NHIÊN DÙNG CHUNG (chung_nn_<chủ đề>)
//
// Thẻ dòng đầu:
//   # ngau_nhien            sự kiện có thể xảy ra
//   # noi:<địa điểm>        nơi xảy ra (xem danh sách bên dưới)
//   # gio:<hh:mm-hh:mm>     khung giờ có thể xảy ra
//   # ngay_tu:<n>           (tùy chọn) chỉ từ ngày n
//   # ngay_den:<n>          (tùy chọn) chỉ tới ngày n
//   # vai_khong:<mã>        (tùy chọn, có thể lặp nhiều thẻ) KHÔNG mở khi người
//                           chơi đang là nhân vật này (vd: NPC chính của sự kiện,
//                           hoặc vai_khong:cho khi sự kiện cần người chơi nói tiếng người)
//
// Địa điểm dùng trong file: van_phong, may_in, pantry, toilet, thang_may,
// san_thuong, bai_xe, cong_cong_ty, phong_hop_tang_2, phong_server, hem_69,
// quan_tra_da, cho_pho_cu, chua_pho_cu, quan_ca_phe, duong, quan_com_tam,
// quan_oc, karaoke, tiem_nail, dien_thoai, cua_hang_tien_loi, sieu_thi,
// cong_vien, gym, rap_phim, phong_kham, tiem_cam_do, quan_bida, quan_net
//
// Mỗi sự kiện tự kết thúc bằng -> END.
// ============================================================

// ======================= VĂN PHÒNG & MÁY IN =======================

=== chung_nn_may_in_ket ===
# ngau_nhien # noi:may_in # gio:08:30-17:00 # vai_khong:cho # vai_khong:truong_phong
~ temp g = chung_goi("truong_phong")
~ temp x = chung_xung("truong_phong")
_Máy in tầng 1 kêu "rẹt… rẹt…" rồi im bặt. Đèn đỏ nhấp nháy như đang kêu cứu._
truong_phong: Ơ, {g} ơi! Giúp {x} gỡ cái máy in với. Mười phút nữa họp rồi, slide chưa in được trang nào.
* [🤝 Mở nắp, rút tờ giấy kẹt ra.]
    _Tờ giấy kẹt nhăn như mặt người nhận feedback lần thứ 5. Máy in chạy lại._
    ~ tien_cong(30000)
    ~ qh("truong_phong", 3)
    truong_phong: Tuyệt vời! Cái này mình take note lại, cuối tuần {x} khen trong cuộc họp.
* [😶 "Gọi anh {it} đi, {chung_toi("truong_phong")} sợ máy in lắm."]
    it: *(từ đâu hiện ra, tay cầm mì ly)* Tắt đi bật lại chưa?
    _{it} tắt đi bật lại. Máy chạy. {truong_phong} nhìn hai người với ánh mắt mất niềm tin vào khoa học._
    ~ qh("it", 2)
* [🐍 Đá nhẹ vào hông máy in.]
    { RANDOM(1, 2) == 1:
        _Máy in rùng mình rồi nhả ra 47 bản slide. Cả 47 bản đều in ngược._
        truong_phong: …Thôi, mình họp xoay ngược đầu vậy.
    - else:
        _Máy in kêu "bíp" một tiếng dài, rồi tắt hẳn. Cả tầng quay lại nhìn bạn._
        ~ cang_thang(5)
        ~ qh("truong_phong", -3)
    }
- -> END

=== chung_nn_may_in_giay_bi_mat ===
# ngau_nhien # noi:may_in # gio:08:00-17:30 # vai_khong:cho # vai_khong:thanh_xin_nghi
_Máy in nhả ra một tờ giấy không ai tới lấy. Dòng đầu: "ĐƠN XIN NGHỈ PHÉP (lần 8). Lý do: bà ngoại em…"_
_Tên người làm đơn: {thanh_xin_nghi}. Ngày xin nghỉ: ba ngày nữa._
* [😇 Gấp lại, đem tới bàn {thanh_xin_nghi}.]
    thanh_xin_nghi: *(ho khụ khụ rất đúng lúc)* Dạ… cảm ơn {chung_goi_ai("thanh_xin_nghi", vai)} nha. Bà ngoại tui… à, bà ngoại em… à mà thôi, cảm ơn nhiều.
    ~ qh("thanh_xin_nghi", 8)
* [🧂 Đem lên phòng HR cho anh {hr} "xem giùm".]
    hr: *(cười, nhấp ngụm trà)* Ồ. Lần thứ tám. Bà ngoại bạn {thanh_xin_nghi} đúng là một người phụ nữ kiên cường.
    ~ qh("hr", 5)
    ~ qh("thanh_xin_nghi", -10)
* [💬 Lật mặt sau tờ giấy coi còn gì.]
    _Mặt sau là lịch trình viết tay: "Thứ 7, 19:00, Đài Tivi Hóng, phòng thu 3. Mang đồ kim tuyến."_
    _Kim tuyến? Về quê gặt lúa mà mặc kim tuyến?_
    ~ phat_hien(son_thi_hat)
- -> END

=== chung_nn_tu_lanh_trom ===
# ngau_nhien # noi:pantry # gio:12:00-13:30 # vai_khong:cho # vai_khong:ke_toan
~ temp g = chung_goi("ke_toan")
_Tủ lạnh chung mở toang. {ke_toan} đứng trước tủ, tay cầm hộp cơm rỗng ruột, dán nhãn "THƯƠNG - CÁ KHO - KHÔNG PHẢI CỦA BẠN"._
ke_toan: Hộp cơm của tui. Cá kho. Ai ăn? {g} có thấy ai hông?
* [😇 "Không thấy ạ, mà để {chung_toi("ke_toan")} chia cơm cho nè."]
    ke_toan: Thôi… cảm ơn. Nhưng tui vẫn sẽ tìm ra.
    ~ an(-20)
    ~ qh("ke_toan", 10)
* [🐍 "Hồi nãy thấy {cho} đứng gần đây lâu lắm."]
    ke_toan: Chó không biết mở nắp hộp. Mà cũng không biết đậy lại. Người này đậy lại kỹ lắm.
    _{ke_toan} lấy sổ ra, ghi một dòng. Bạn thấy tên mình ở cuối danh sách "đáng ngờ"._
    ~ qh("ke_toan", -5)
* [🔥 "Chắc người nào đói vì lương chưa về đó chị."]
    ke_toan: *(nheo mắt)* Lương về hay không là chuyện của ngân hàng. Cá kho là chuyện của tui.
    ~ cang_thang(3)
- _Chiều đó, trên cửa tủ lạnh xuất hiện tờ giấy: "Hộp cơm cũng có hóa đơn. — K.T."_
-> END

=== chung_nn_tu_lanh_bat_qua_tang ===
# ngau_nhien # noi:pantry # gio:13:30-17:00 # vai_khong:cho # vai_khong:chua_te_deadline
~ temp g = chung_goi("chua_te_deadline")
_Bạn mở tủ lạnh. {chua_te_deadline} đang ngồi xổm dưới gầm bàn pantry, ăn một hộp bánh flan dán nhãn "CỦA NHẬT - ĐỪNG ĐỤNG"._
chua_te_deadline: *(muỗng còn trong miệng)* Ủa {g}. Chill. Tui tính mai mua trả mà.
* [🤝 "Ăn lẹ đi, {chung_toi("chua_te_deadline")} canh cửa cho."]
    chua_te_deadline: Đồng đội đỉnh nóc. Lần sau có flan tui chia nửa.
    ~ qh("chua_te_deadline", 8)
    ~ qh("truong_phong", -2)
* [🐍 Chụp một tấm, gửi vào group "Hội ăn trưa".]
    _Ba phút sau, {truong_phong} triệu tập "họp nhanh 5 phút về văn hóa tủ lạnh"._
    ~ qh("chua_te_deadline", -10)
    ~ qh("truong_phong", 5)
    ~ cang_thang(5)
* [💬 "Mai là mai nào?"]
    chua_te_deadline: Mai của deadline. Tức là ngày 31.
- -> END

=== chung_nn_tu_lanh_giay_note ===
# ngau_nhien # noi:pantry # gio:08:00-17:30 # vai_khong:cho
_Cửa tủ lạnh dán kín giấy note như tường bệnh viện tâm lý:_
_"Ai lấy sữa chua của tui làm ơn trả lại." / "Sữa chua hết hạn từ tháng 8 rồi, tui giúp bạn đó." / "HẠN LÀ CỦA TUI, CHUYỆN CỦA TUI."_
* [🧂 Dán thêm: "Tủ lạnh này có camera." (không có)]
    _Chiều đó tủ lạnh sạch bong. Ba hộp đồ ăn được trả về chỗ cũ. Một hộp còn kèm lời xin lỗi._
    ~ cang_thang(-5)
* [😇 Dọn tủ lạnh, vứt đồ hết hạn.]
    _Bạn tìm thấy 4 hộp sữa chua, 1 nửa ổ bánh mì đã có hệ sinh thái riêng, và một cây xúc xích chưa bóc vỏ._
    ~ nhan(xuc_xich)
    ~ nghi(-5)
* [😶 Đóng tủ lạnh, giả vờ chưa thấy gì.]
    _Đôi khi hòa bình là không đọc giấy note._
- -> END

// ======================= PANTRY =======================

=== chung_nn_ca_phe_het ===
# ngau_nhien # noi:pantry # gio:08:00-11:00 # vai_khong:cho # vai_khong:editor
~ temp g = chung_goi("editor")
_Máy pha cà phê nhả ra một giọt. Một giọt duy nhất. Rồi hiện chữ "HẾT HẠT"._
_Bên cạnh, {editor} đứng cầm cốc "RENDER", mắt nhắm, cơ thể đã có mặt nhưng linh hồn còn ở bàn dựng._
editor: *(ngáp)* {g}… cà phê… còn hông…
* [🤝 Chia cho {editor} nửa ly cà phê sữa đá của mình.]
    ~ uong(-10)
    ~ qh("editor", 10)
    editor: Cảm ơn. Tối nay tui giấu cho {g} một con cú trong video. Đừng nói ai nha.
* [😇 Lấy gói cà phê hòa tan dự phòng trong ngăn kéo ra pha.]
    ~ nghi(10)
    ~ qh("editor", 5)
    editor: Cà phê hòa tan… mùi giống năm 2019… *(uống một hơi)* Được rồi, tui sống lại 30%.
* [😶 "Uống nước lọc đi, healthy."]
    editor: *(nhìn ly nước như nhìn một bản export lỗi)* …
    ~ qh("editor", -3)
- -> END

=== chung_nn_ca_phe_may_hong ===
# ngau_nhien # noi:pantry # gio:08:00-17:00 # vai_khong:cho
_Máy pha cà phê kêu như máy cày, rồi phun hơi nước ra tứ phía. Ai đó dán lên máy tờ giấy: "ĐANG BỊ TRẦM CẢM, ĐỪNG ĐỤNG"._
* [🔧 Xắn tay áo, tự sửa.]
    { RANDOM(1, 3) <= 2:
        _Bạn tháo khay bã ra, gõ ba cái, lắp lại. Máy kêu "tèn ten" vui vẻ. Cả tầng vỗ tay._
        ~ nhan(ca_phe)
        ~ nghi(15)
    - else:
        _Máy phun một tia cà phê nóng thẳng vào áo bạn. Hôm nay bạn đi làm bằng áo "họa tiết cà phê"._
        ~ cang_thang(8)
    }
* [💬 Nhắn {it} trên Zalo-lô.]
    it: Restart chưa?
    _Bạn rút điện, cắm lại. Máy chạy. Bạn không biết nên vui hay buồn._
    ~ qh("it", 2)
* [😶 Đi ra quán cà phê đầu ngõ, 35 nghìn.]
    ~ tien_cong(-35000)
    ~ nghi(25)
    ~ uong(20)
- -> END

=== chung_nn_pantry_mi_ly_mui ===
# ngau_nhien # noi:pantry # gio:15:00-17:30 # vai_khong:cho
_Ba giờ chiều. Ai đó ở pantry vừa úp một ly mì vị tôm chua cay. Mùi lan tới tận phòng giám đốc. Sáu cái đầu ngóc lên cùng lúc._
* [🍜 Úp thêm một ly, ăn chung cho vui.]
    ~ tien_cong(-15000)
    ~ an(25)
    _Mười phút sau, pantry thành "Hội mì ly 3 giờ chiều". Chuyện trên trời dưới biển, không ai nhắc deadline._
    ~ cang_thang(-8)
* [🧂 Nhắn group: "Ai ăn mì mà thơm dữ, cho xin tọa độ."]
    _Group nổ 40 tin nhắn. Không ai nhận là mình. Mùi mì vẫn ở đó._
* [😶 Đeo khẩu trang làm việc tiếp.]
    ~ an(-5)
    _Bụng bạn kêu to tới mức người bàn bên tưởng điện thoại rung._
- -> END

=== chung_nn_pantry_hong_chuyen ===
# ngau_nhien # noi:pantry # gio:10:00-16:30 # vai_khong:cho # vai_khong:hong_hot
~ temp g = chung_goi("hong_hot")
hong_hot: Ê {g}! Lại đây lại đây. Nghe gì chưa?
_{hong_hot} kéo bạn vào góc pantry, nhìn trước nhìn sau như sắp giao dịch tin mật._
* [💬 "Gì? Kể lẹ!"]
    hong_hot: {~Hồi sáng tui thấy sếp {giam_doc} đứng ngoài ban công nói điện thoại với ngân hàng, mặt trắng bệch luôn á.|Ông {it} ăn mì ly hết 3 ly từ sáng tới giờ, chắc sắp có biến server.|Anh {quan_ly_idol} mua 2 ly cà phê, mà một ly ghi tên anh {idol_het_thoi}, có vẽ trái tim nhỏ xíu. Tui chưa nói gì nha!}
    ~ qh("hong_hot", 5)
* [🐍 "Kể tui nghe, rồi tui kể lại một chuyện còn hay hơn."]
    hong_hot: Ối dồi ôi, trao đổi tin mật hả? Chơi!
    _Hai người thì thầm 15 phút. Ra khỏi pantry, bạn biết nhiều hơn, và {hong_hot} cũng vậy._
    ~ qh("hong_hot", 10)
    ~ cang_thang(-3)
* [😶 "Thôi, tui đang bận."]
    hong_hot: Bận gì mà bận, chuyện này hot lắm á! Thôi, không nghe thì thôi, để tui kể người khác.
    ~ qh("hong_hot", -3)
- -> END

// ======================= NHÀ VỆ SINH =======================

=== chung_nn_toilet_nghe_len ===
# ngau_nhien # noi:toilet # gio:09:00-17:00 # vai_khong:cho # vai_khong:hong_hot # vai_khong:designer
_Bạn đang ngồi trong buồng vệ sinh thì cửa ngoài mở. Hai giọng quen thuộc bước vào: {hong_hot} và {designer}._
designer: …tui nói thiệt, sửa lần thứ 12 rồi đó bà. Ổng kêu "chưa đủ wow". Wow là cái gì? Wow màu gì?
hong_hot: Thôi kệ đi. Mà nè, bà có thấy dạo này {ten(ran_thu_hai)} lạ lạ hông? Hay đi điện thoại ra hành lang.
_Bạn nín thở. Chân bắt đầu tê._
* [😶 Ngồi im tới khi họ đi.]
    _Bạn ngồi thêm 7 phút. Chân tê tới mức đi ra như vừa tập squat 300 cái. Nhưng bạn nghe được hết._
    ~ nghi(-5)
* [🧂 Ho một tiếng thật to.]
    designer: …
    hong_hot: …Thôi đi ra đi bà.
    _Họ đi ra rất nhanh. Bạn nghe tiếng {hong_hot} thì thầm: "Ai trong đó vậy trời?"_
    ~ cang_thang(3)
* [🤝 Đi ra, rửa tay, giả bộ như không nghe gì.]
    designer: *(đứng hình)* Ủa… Ơ… Chào.
    hong_hot: *(cười gượng)* Ủa nãy giờ có người hả? Tụi tui nói chuyện… thời tiết.
    ~ qh("designer", -3)
    ~ qh("hong_hot", -3)
- -> END

=== chung_nn_toilet_het_giay ===
# ngau_nhien # noi:toilet # gio:08:00-17:30 # vai_khong:cho
_Bạn đưa tay ra. Cuộn giấy vệ sinh chỉ còn cái lõi. Cái lõi nhìn bạn. Bạn nhìn cái lõi._
* [📱 Nhắn group công ty: "Ét o ét, toilet nam/nữ tầng 1, cần tiếp tế."]
    _Bốn giây sau, cửa mở hé, một cuộn giấy lăn vào. Không ai nói gì. Group công ty có 23 người "đã xem"._
    ~ cang_thang(5)
* [📱 Nhắn riêng cho người thân nhất công ty.]
    _Người đó tới, đưa giấy qua khe cửa, rồi đứng ngoài nói: "Nợ tui một ly trà sữa nha."_
    ~ tien_cong(-40000)
* [🧠 Dùng tờ thông báo "Tiết kiệm giấy, bảo vệ môi trường" dán trên cửa.]
    _Bạn đã bảo vệ môi trường theo cách không ai ngờ tới._
    ~ cang_thang(-2)
- -> END

=== chung_nn_toilet_khoc ===
# ngau_nhien # noi:toilet # gio:13:30-17:30 # vai_khong:cho # vai_khong:sales
~ temp g = chung_goi("sales")
_Buồng bên cạnh có tiếng sụt sịt. Rồi một giọng run run gọi điện thoại:_
sales: Dạ… dạ, anh bên Răng Hồng ơi, em gửi lại hồ sơ… Alo? Alo?… *(tút tút)*
_Im lặng. Rồi tiếng khóc nhỏ, rất nhỏ._
* [😇 Gõ nhẹ vách: "{chung_ban_hoa("sales")} ổn hông?"]
    sales: *(nín bặt)* Ổn! Ổn mà! Deal này chắc kèo! Tui… tui chỉ bị dị ứng phấn hoa!
    _Toilet không có hoa._
    sales: …Cảm ơn nha {g}. Đừng kể ai.
    ~ qh("sales", 12)
* [🤝 Đặt một gói khăn giấy dưới khe vách.]
    _Gói khăn giấy biến mất. Một lúc sau, nó quay lại, kèm một danh thiếp in nhũ vàng: "Chuyên viên Kinh doanh cấp cao, quan hệ đối tác chiến lược"._
    ~ qh("sales", 8)
* [😶 Đi ra thật nhẹ.]
    _Có những lúc, im lặng là lịch sự._
- -> END

// ======================= THANG MÁY =======================

=== chung_nn_thang_may_ket ===
# ngau_nhien # noi:thang_may # gio:08:00-18:00 # vai_khong:cho # vai_khong:giam_doc
~ temp g = chung_goi("giam_doc")
_Thang máy rung một cái rồi đứng giữa tầng 1 và tầng 2. Trong thang: bạn và sếp {giam_doc}._
giam_doc: Không sao, không sao. {g} biết không, năm 2010 anh khởi nghiệp trong một căn phòng 20 mét vuông, còn chật hơn cái thang này…
_Bạn nhận ra: đây không phải sự cố thang máy. Đây là một bài phát biểu có tường bao quanh._ # hen_gio:6
* [🙇 "Sếp kể tiếp đi, {chung_toi("giam_doc")} đang rất có động lực!"]
    giam_doc: Đấy! Mindset đấy! Anh không ép, nhưng tuần sau em trình bày lại cho cả phòng nghe nhé.
    ~ qh("giam_doc", 8)
    ~ cang_thang(5)
* [📱 Bấm nút gọi cứu hộ liên tục.]
    _Chuông kêu ở chòi bảo vệ. Bác {bac_bao_ve} đặt ấm trà xuống, đi lên rất chậm, mở cửa thang bằng cái chìa khóa thứ 14 trong chùm._
    bac_bao_ve: Lại kẹt à. Ra đi. Đi thang bộ cho khỏe.
    ~ qh("bac_bao_ve", 3)
* [😶 Ngồi xuống sàn, nhắm mắt nghỉ.]
    ~ nghi(10)
    giam_doc: …Em ngủ đấy à? Thôi được, anh kể tóm tắt. Năm 2011…
* [⏱️ (Không chọn kịp)]
    giam_doc: …và đấy là lý do năm 2012 bọn anh chuyển về tòa nhà này. Em thấy chưa, cái gì cũng có lý do của nó!
    ~ cang_thang(8)
- -> END

=== chung_nn_thang_may_tra ===
# ngau_nhien # noi:thang_may # gio:08:00-17:30 # vai_khong:cho # vai_khong:hr
~ temp g = chung_goi("hr")
~ temp x = chung_xung("hr")
_Cửa thang máy mở. Bên trong là {hr}, tay cầm tách trà hồng, mỉm cười. Nụ cười đó. Nụ cười nhân sự._
hr: Ồ, {g} đi lên hả? Vào đi, vào đi.
_Cửa đóng. Ba tầng. Mười hai giây. Im lặng tuyệt đối._
hr: Mà {g} nè… lát {g} rảnh không, lên phòng {x} uống trà xíu.
* [😰 "D… dạ? Em… em làm gì sai hả?"]
    hr: Ủa đâu có! {x} chỉ muốn lắng nghe {g} thôi. Mà nhìn {g} lo dữ vậy… có chuyện gì {x} nên biết không?
    ~ cang_thang(10)
* [😇 "Trà gì vậy {chung_ban("hr")}?"]
    hr: Trà lài. Uống để bình tĩnh. Thật ra {x} chỉ muốn hỏi {g} có thấy bạn {thanh_xin_nghi} đi làm hôm nay không thôi.
    ~ qh("hr", 5)
* [🏃 Bấm mở cửa ở tầng gần nhất, bước ra.]
    _Bạn bước ra ở tầng 1. Bạn cần lên tầng 2. Bạn đi thang bộ, tim vẫn đập thình thịch._
    ~ nghi(-5)
- -> END

=== chung_nn_thang_may_ao_choang ===
# ngau_nhien # noi:thang_may # gio:09:00-17:00 # vai_khong:cho # vai_khong:sieu_nhan_hong
~ temp g = chung_goi("sieu_nhan_hong")
_Thang máy mở. Một nửa không gian bị chiếm bởi Siêu Nhân Hồng đang tạo dáng. Nửa còn lại là áo choàng._
sieu_nhan_hong: Vào đi {g}! Có chỗ mà! Hồng không phải màu, Hồng là thái độ!
_Bạn chen vào. Cửa đóng lại, kẹp vạt áo choàng hồng._
* [🤝 Giúp gỡ vạt áo.]
    sieu_nhan_hong: Cảm ơn {g}! Đúng là đồng đội! Để mai anh mang bánh chuối chiên cho em!
    ~ qh("sieu_nhan_hong", 8)
* [📸 Chụp lại, đăng Tóp-tóp: "Siêu nhân cũng bị thang máy bắt nạt".]
    _Clip được 40 nghìn lượt xem trong một buổi chiều. Bình luận top: "Ảnh kẹt mà vẫn tạo dáng, chuyên nghiệp ghê"._
    ~ follow(5000)
    ~ chung_so_meme = chung_so_meme + 1
* [😶 Đứng sát vách, nhìn số tầng.]
    sieu_nhan_hong: Ê, thang máy chạy chậm ha. Để anh tạo dáng cho nó nhanh hơn!
    _Nó không nhanh hơn._
- -> END

// ======================= SÂN THƯỢNG =======================

=== chung_nn_san_thuong_dien_thoai ===
# ngau_nhien # noi:san_thuong # gio:12:00-18:30 # vai_khong:cho # vai_khong:quan_ly_idol
~ temp g = chung_goi("quan_ly_idol")
~ temp x = chung_xung("quan_ly_idol")
_Trên sân thượng, {quan_ly_idol} đứng cạnh cây phơi đồ, hai điện thoại hai tay, cả hai đều đang rung._
quan_ly_idol: Dạ… dạ, bên em lo… Khoan, anh nghe máy chút. *(đổi máy)* Alo, {idol_het_thoi} hả? Ừ, ăn chưa?… Ăn đi rồi tập.
_{quan_ly_idol} cúp máy, quay lại thấy bạn._
quan_ly_idol: Ủa {g}. Lên hóng gió hả? Đừng kể ai là {x} đứng đây nha.
* [🤝 Đưa {quan_ly_idol} ly cà phê của mình.]
    quan_ly_idol: Ly thứ năm hôm nay. Cảm ơn {g}. *(uống, nhìn xa xăm)* Mười một năm rồi đó, mà lần nào nó hỏi "ăn chưa", {x} cũng vui như lần đầu.
    ~ qh("quan_ly_idol", 10)
* [💬 "Bộ {chung_ban("quan_ly_idol")} quan tâm {idol_het_thoi} dữ ha?"]
    quan_ly_idol: *(ho sặc)* Quản lý thì phải quan tâm nghệ sĩ chứ! Chuyện… chuyện công việc! Khoan, điện thoại rung.
    _Điện thoại không rung._
* [😶 Gật đầu, đi xuống.]
    ~ qh("quan_ly_idol", 2)
- -> END

=== chung_nn_san_thuong_oanh ===
# ngau_nhien # noi:san_thuong # gio:09:00-12:00 # vai_khong:cho # vai_khong:bien_kich
~ temp g = chung_goi("bien_kich")
_{bien_kich} ngồi trên ghế nhựa, ngước nhìn trời, bút máy mực hồng lơ lửng trên cuốn sổ bìa da._
bien_kich: {g} ơi… {g} đã bao giờ thấy đau chưa? Kiểu đau mà… có thể viết thành 15 phút phim?
* [😇 Kể thật một chuyện buồn của mình.]
    _{bien_kich} nghe chăm chú, gật gù, và ghi chép nhanh tới mức bút máy kêu rột rột._
    bien_kich: Cảm ơn {g}. Đây không phải đạo, đây là cảm hứng.
    ~ qh("bien_kich", 8)
    ~ cang_thang(-5)
* [🧂 Bịa một chuyện thật bi thảm.]
    _Bạn kể chuyện con cá vàng của mình tự tử vì thất tình. {bien_kich} khóc._
    bien_kich: Hay quá… Tui sẽ cho nó vào chương 12.
    ~ qh("bien_kich", 5)
* [😶 "Đau lưng có tính hông?"]
    bien_kich: …Tính. Ghi lại: "Nỗi đau của người văn phòng nằm ở đốt sống thắt lưng số 4."
- -> END

=== chung_nn_san_thuong_ao_choang_phoi ===
# ngau_nhien # noi:san_thuong # gio:07:00-10:00 # vai_khong:cho # vai_khong:sieu_nhan_hong
_Trên cây phơi đồ sân thượng có một bộ đồ siêu nhân màu hồng đang phơi, bay phần phật như lá cờ của một quốc gia rất vui vẻ._
_Bên dưới dán tờ giấy: "Đồ dự phòng số 3. Đừng mặc thử. — N."_
* [😇 Gió to quá, gỡ vào giúp.]
    _Bạn gấp bộ đồ, để lên bàn phòng chờ. Trưa đó, trên bàn bạn có một đĩa bánh chuối chiên với tờ note: "Cảm ơn! Hồng là thái độ!"_
    ~ qh("sieu_nhan_hong", 5)
    ~ an(15)
* [🧂 Mặc thử áo choàng, chụp một tấm.]
    _Ảnh đẹp. Đẹp tới mức {hong_hot} đăng lên fanpage với caption "Siêu Nhân Hồng có phiên bản 2?". Bình luận nổ tung._
    ~ follow(3000)
    ~ qh("sieu_nhan_hong", -2)
* [🐕 Để yên. Nhưng thấy {cho} đang rình ở cầu thang.]
    _Mười phút sau, ống quần trái của bộ đồ dự phòng số 3 biến mất. Không ai biết nó đi đâu. Trừ một cái kho dưới gầm cầu thang._
- -> END

=== chung_nn_san_thuong_hoang_hon ===
# ngau_nhien # noi:san_thuong # gio:17:00-18:30 # vai_khong:cho
_Hoàng hôn trên sân thượng {cong_ty}. Thành Phố Ước Mơ nhuộm cam, đúng màu áo công ty. Dưới đường, Đại Lộ Kẹt Xe bắt đầu… kẹt._
* [😌 Ngồi xuống ghế nhựa, ngắm trời.]
    _Mười phút không deadline, không group chat, không ai gọi tên. Lâu lắm rồi mới có._
    ~ cang_thang(-12)
    ~ nghi(5)
* [📸 Chụp ảnh đăng story: "Chốn bình yên của dân văn phòng".]
    _Ba phút sau sếp thả tim story. Năm phút sau sếp nhắn: "Em còn ở công ty à? Tiện xem giúp anh cái file."_
    ~ cang_thang(5)
* [🎧 Mở bài "Công Viên" bản lofi.]
    _"Ngày xưa có đôi bạn thân bán cá viên chiên tại công viên…" Không hiểu sao, nghe giữa hoàng hôn, bài này buồn ghê._
    ~ cang_thang(-8)
- -> END

// ======================= BÃI XE & CỔNG =======================

=== chung_nn_bai_xe_bi_chan ===
# ngau_nhien # noi:bai_xe # gio:17:30-19:00 # vai_khong:cho # vai_khong:con_ong_chau_cha
~ temp g = chung_goi("con_ong_chau_cha")
_Tan làm. Xe bạn bị chặn kín bởi một chiếc mô tô phân khối lớn, bóng loáng, dán sticker "CHILL"._
con_ong_chau_cha: *(đi ra, đeo kính râm dù trời đã tối)* Ủa xe {g} hả? Sorry nha. Mà sao {g} không mua xe nào nhỏ hơn cho dễ dắt?
* [😇 "Không sao, {chung_ban("con_ong_chau_cha")} dời xe giùm nha."]
    con_ong_chau_cha: Ok! Mà nè, hông thì để anh gọi chú anh mua cho bãi xe thêm tầng.
    ~ qh("con_ong_chau_cha", 5)
* [🐍 "Xe của chú mua hả?"]
    con_ong_chau_cha: *(khựng lại, tháo kính)* …Ừ. Cái gì cũng của chú hết. *(dắt xe đi, không nói thêm câu nào)*
    ~ qh("con_ong_chau_cha", -8)
* [💬 "Xe đẹp ghê, cho chạy thử một vòng được hông?"]
    con_ong_chau_cha: Được luôn! Mà nhớ đừng chạy qua Ven Đô, bên LL tụi nó nhìn thấy tức chơi.
    ~ qh("con_ong_chau_cha", 8)
    ~ cang_thang(-5)
- -> END

=== chung_nn_bai_xe_cua_sau ===
# ngau_nhien # noi:bai_xe # gio:07:50-08:20 # vai_khong:cho # vai_khong:dan_dau_tu
~ temp g = chung_goi("dan_dau_tu")
_Góc bãi xe có tiếng sột soạt. {dan_dau_tu} đang lách qua khe hàng rào sau, đầu đội nón bảo hiểm che kín mặt, tay ôm điện thoại đang mở chart._
dan_dau_tu: Suỵt! {g} có thấy {ten("con_ong_chau_cha")} với {ten("sales")} ở cổng trước hông? Thấy thì đừng nói là thấy anh nha.
* [🤝 "Đi lẹ đi, tui che cho."]
    dan_dau_tu: Tình nghĩa! Lần này lên thật, {g} có phần!
    ~ qh("dan_dau_tu", 8)
* [🐍 Nói to: "Ủa anh {dan_dau_tu}, sao đi cửa sau vậy?"]
    _Ở cổng trước, hai cái đầu quay phắt lại. {dan_dau_tu} biến mất sau đống thùng carton với tốc độ của một cổ phiếu sập sàn._
    ~ qh("dan_dau_tu", -10)
    ~ qh("sales", 3)
* [💬 "Anh nợ bao nhiêu người vậy?"]
    dan_dau_tu: Nợ đâu mà nợ! Đây là vốn góp! Mà… tổng là 22 triệu. Đáy rồi, sắp lên rồi.
- -> END

=== chung_nn_cong_xe_hong ===
# ngau_nhien # noi:cong_cong_ty # gio:08:50-09:30 # vai_khong:cho # vai_khong:sieu_nhan_hong # vai_khong:bac_bao_ve
_Chiếc xe màu hồng của Siêu Nhân Hồng đậu chéo ngay giữa cổng. Xe máy xếp hàng phía sau như đợi qua phà._
bac_bao_ve: *(đứng nhìn chiếc xe, tay cầm chén trà)* Cậu Nguyên đỗ đấy rồi chạy đi giúp bà cụ bán vé số qua đường. Đợi tí.
* [🤝 Phụ bác điều xe máy vào lối bên.]
    bac_bao_ve: Ừ. Được.
    _Bác {bac_bao_ve} không nói thêm. Nhưng chiều đó, xe bạn được dựng ở chỗ mát nhất bãi._
    ~ qh("bac_bao_ve", 8)
* [📸 Chụp chiếc xe hồng chắn cổng, đăng lên mạng.]
    _Ảnh được chia sẻ với caption "Siêu nhân thì không cần đậu xe đúng chỗ"._
    { RANDOM(1, 2) == 1:
        ~ follow(4000)
    - else:
        ~ follow(-3000)
    }
* [😤 Bấm còi.]
    _Không ai ra. Chỉ có {cho} chạy tới sủa chiếc xe hồng, rồi tè vào bánh trước._
    ~ cang_thang(3)
- -> END

=== chung_nn_cong_teo_giao_hang ===
# ngau_nhien # noi:cong_cong_ty # gio:09:00-17:00
{ vai == "cho": -> ban_cho }
_Anh shipper Tèo dừng xe trước cổng. {cho} đã đứng sẵn, lông dựng, đuôi cứng như cây ăng-ten._
npc_teo: Hàng tới rồi, ra lấy giùm em! Anh chị ơi, con chó nhà mình nó nhìn em kiểu… thù truyền kiếp á!
cho: Grừ… GÂU GÂU!
* [🤝 Chạy ra nhận hàng hộ.]
    npc_teo: Cảm ơn anh chị! Bo em ít tiền nước hông? Không thì thôi, em đi lẹ không con chó nó…
    ~ tien_cong(20000)
    ~ cang_thang(3)
* [🦴 Đưa {cho} một cây xúc xích để đánh lạc hướng.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        _{cho} ăn xúc xích, vẫn liếc Tèo, nhưng không sủa nữa. Đã ăn của người ta thì phải nể._
        ~ qh("cho", 10)
    - else:
        _Bạn thò tay vào túi. Không có xúc xích. {cho} nhìn bạn đầy thất vọng, rồi sủa tiếp, to hơn._
    }
* [😶 Đứng nhìn trận chiến.]
    _Tèo ném gói hàng qua cổng rồi rồ ga. {cho} đuổi theo tới đầu đường, rồi quay về với vẻ mặt của người vừa thắng trận._
- -> END

= ban_cho
_Mùi xăng. Mùi áo khoác giao hàng. Mùi… kẻ thù. Anh shipper Tèo dừng xe trước cổng._
npc_teo: Hàng tới rồi, ra lấy giùm em! …Ơ chết, con chó!
* [😤 Sủa thật to.]
    cho: GÂU GÂU GÂU! # phu_de: Lãnh thổ của tao! Cút!
    _Tèo ném gói hàng qua cổng rồi phóng xe đi. Gói hàng rơi trúng ổ của bạn. Hình như là pa-tê._
    ~ an(10)
* [🦷 Ngoạm ống quần Tèo.]
    cho: Grừ… # phu_de: Bắt được rồi nha.
    _Tèo đứng yên một chân như con cò. Bác {bac_bao_ve} phải ra gỡ._
    bac_bao_ve: …bla bla… **TUẤT** …bla… **KHÔNG** …
    ~ qh("bac_bao_ve", -3)
* [🐾 Quay lưng, nằm xuống, phớt lờ.]
    cho: … # phu_de: Hôm nay tha. Hôm nay thôi.
    _Tèo nhìn bạn, ngơ ngác như vừa được ân xá._
- -> END

=== chung_nn_teo_giao_nham ===
# ngau_nhien # noi:cong_cong_ty # gio:10:00-16:00 # vai_khong:cho # vai_khong:chua_te_deadline # vai_khong:sieu_nhan_hong
npc_teo: Anh chị ơi, có gói hàng ghi "Gửi Vũ, từ N.", mà gọi anh Vũ hoài không bắt máy. Anh chị nhận giùm nha!
_Gói hàng màu hồng. Gói bằng giấy hồng. Buộc nơ hồng. Có một tấm thiệp hồng kẹp bên ngoài._
* [😇 Đem lên tận bàn {chua_te_deadline}.]
    chua_te_deadline: *(ngóc đầu dậy khỏi gối ôm hồng)* Lại quà hả? Ông Nguyên này làm PR chăm ghê. *(mở ra: một cây bút highlight hồng)* …Mà cũng xài được.
    _{chua_te_deadline} bỏ cây bút vào túi áo. Không phải vào ngăn kéo. Vào túi áo._
    ~ qh("chua_te_deadline", 5)
    ~ qh("sieu_nhan_hong", 5)
* [🧂 Đọc lén tấm thiệp.]
    _Tấm thiệp viết: "Hôm nay em đi trễ 20 phút. Anh để bánh mì trên bàn rồi. Không phải PR đâu. — N."_
    _Bạn gấp thiệp lại. Không hiểu sao, tim bạn hơi nhói._
* [📸 Chụp gói quà gửi {hong_hot}.]
    _Mười phút sau, fanpage công ty có bài: "Siêu Nhân Hồng gửi quà cho ai? Đoán đúng nhận ngay… sự tò mò!"_
    ~ follow(3000)
    ~ qh("hong_hot", 5)
- -> END

=== chung_nn_teo_hoi_lo_tuat ===
# ngau_nhien # noi:cong_cong_ty # gio:14:00-17:00 # ngay_tu:8
{ vai == "cho": -> ban_cho }
_Anh shipper Tèo ngồi xổm trước cổng, chìa cây xúc xích cho {cho}, mặt thành khẩn như đi xin lỗi người yêu cũ._
npc_teo: Tuất ơi, hòa nha, hòa nha… Anh chị ơi, anh chị nói giúp em với nó một tiếng đi!
* [🤝 Ngồi xuống cạnh Tèo, xoa đầu {cho}.]
    _{cho} ăn xúc xích từ tay Tèo, rồi sủa Tèo một tiếng. Rồi ăn tiếp. Hòa bình theo kiểu rất riêng._
    ~ qh("cho", 5)
* [🧂 "Nó ghét áo khoác của anh đó, cởi ra thử coi."]
    _Tèo cởi áo khoác. {cho} ngửi, rồi ngoạm luôn cái áo khoác chạy vào gầm cầu thang. Tèo về trong gió lạnh._
* [😶 Đi ngang qua.]
    npc_teo: Anh chị ơi đừng bỏ em mà…
- -> END

= ban_cho
_Tèo ngồi xổm cách bạn ba mét, tay chìa ra một cây xúc xích. Mùi xúc xích. Mùi kẻ thù. Hai mùi đánh nhau trong mũi bạn._
npc_teo: Tuất ơi… hòa nha? Em giao hàng ở đây cả năm rồi mà…
* [🦴 Ăn xúc xích.]
    cho: … # phu_de: Ăn thì ăn. Ghét thì vẫn ghét.
    ~ an(15)
    _Bạn ăn xong, sủa Tèo thêm một tiếng cho đúng nguyên tắc._
* [😤 Sủa, không thèm ăn.]
    cho: GÂU! # phu_de: Tao không bán lòng tự trọng vì một cây xúc xích. Hai cây thì tính.
    npc_teo: *(rút ra cây thứ hai)*
    cho: … # phu_de: …Được.
    ~ an(25)
- -> END

=== chung_nn_nguyen_choc_tuat ===
# ngau_nhien # noi:cong_cong_ty # gio:08:50-10:00 # vai_khong:sieu_nhan_hong
{ vai == "cho": -> ban_cho }
_Ở cổng, Siêu Nhân Hồng ngồi xổm, giả tiếng sủa với {cho}. {cho} sủa lại. Siêu Nhân Hồng sủa to hơn. Cuộc đối thoại này đã kéo dài 4 phút._
sieu_nhan_hong: Gâu! Gâu gâu! Tuất ơi, nơ hồng nè, đội hông?
cho: GÂU GÂU GÂU! *(lông dựng)*
* [🛑 "Anh ơi, tha cho nó đi."]
    sieu_nhan_hong: Ủa anh chơi với nó mà! Nó thích lắm á! *(tránh một cú đớp)* …Chắc vậy.
    ~ qh("cho", 5)
* [📸 Quay lại, gửi cho {hong_hot}.]
    _Clip "Siêu Nhân Hồng vs Chó Công Ty: hiệp 47" lên Tóp-tóp, được chia sẻ trong mọi group nuôi chó._
    ~ follow(6000)
    ~ chung_so_meme = chung_so_meme + 1
* [🦴 Đưa {cho} xúc xích để nó bỏ đi.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        _{cho} ngậm xúc xích, đi một vòng, đặt xúc xích xuống trước mặt Siêu Nhân Hồng, rồi sủa một tiếng. Ý là: "Tao không cần, tao chỉ ghét mày."_
        ~ qh("cho", 10)
    - else:
        _Bạn không có xúc xích. {cho} nhìn bạn, nhìn Siêu Nhân Hồng, rồi sủa cả hai._
    }
- -> END

= ban_cho
_Mùi hồng. Mùi kem chống nắng. Mùi bánh chuối chiên. Bộ đồ hồng ngồi xổm trước mặt bạn, nghiêng đầu y hệt bạn._
sieu_nhan_hong: Gâu! Gâu gâu! …bla bla… **TUẤT** …bla… **HỒNG** …bla bla… # phu_de: Gâu! Tuất ơi, hôm nay anh hồng hơn hôm qua nè!
* [😤 Sủa to hơn.]
    cho: GÂU GÂU GÂU GÂU! # phu_de: Thân chưa mà giỡn!
    _{hong_hot} quay được. Clip "Siêu nhân và chó công ty cãi nhau" lên fanpage._
    ~ follow(5000)
    ~ qh("sieu_nhan_hong", -5)
* [🦷 Ngoạm mép áo choàng.]
    cho: Grừ… # phu_de: Áo choàng này giờ là của tao.
    _Rách một mảnh nhỏ. Mảnh vải hồng vào kho dưới gầm cầu thang._
    ~ qh("sieu_nhan_hong", -5)
* [🐾 Quay lưng, nằm xuống.]
    cho: Hừ. # phu_de: Không chơi.
    sieu_nhan_hong: Ủa… Tuất? Tuất giận anh thiệt hả?
    _Bộ đồ hồng đứng đó một lúc, không biết làm gì tiếp. Bạn thấy mình thắng._
- -> END

=== chung_nn_ga_cao_su ===
# ngau_nhien # noi:phong_server # gio:09:00-17:00 # ngay_tu:5 # ngay_den:28 # vai_khong:sieu_nhan_hong
{ vai == "cho": -> ban_cho }
_Từ sau tủ mạng phòng server có tiếng "chíp… chíp" nho nhỏ, mỗi khi quạt tản nhiệt thổi qua._
_Bạn rọi đèn điện thoại: kẹt sau đống dây là một con gà cao su, đã bị gặm sứt mỏ._
* [🤝 Lấy ra, đem trả {cho}.]
    _{cho} nhìn con gà, nhìn bạn, rồi nằm ngửa ra giữa sân. Bác {bac_bao_ve} nói: "Nó cảm ơn đấy."_
    ~ qh("cho", 20)
    ~ qh("bac_bao_ve", 5)
* [😶 Để đó. Gỡ ra lỡ đứt dây mạng thì khổ.]
    _Bạn để con gà ở lại. Nó sẽ còn ở đó cho tới khi có một ai đó, một ngày nào đó, đi tìm nó bằng răng._
* [💬 Hỏi {it} ai để nó ở đây.]
    it: Ông Nguyên. Hôm 4/10. Thấy trên camera. Không nói ai.
- -> END

= ban_cho
_Có một mùi. Mùi cao su. Mùi CON GÀ CỦA BẠN. Nó ở đâu đó sau cái tủ có nhiều đèn nhấp nháy._
* [👃 Đánh hơi quanh tủ mạng.]
    cho: *(hít hít hít)* … # phu_de: Ở đây. Ở ĐÂY. Sau mấy sợi dây.
    _Bạn thò mõm vào khe. Gần tới rồi. Một sợi dây nằm chắn ngang. Rất ngon để cắn._
* [😤 Sủa cái tủ.]
    cho: GÂU! GÂU! # phu_de: Trả gà đây!
    it: …bla bla… **TUẤT** …bla… **KHÔNG** …bla… **DÂY MẠNG** … # phu_de: Tuất, không được cắn dây mạng!
* [🐾 Bỏ đi, nhớ chỗ này.]
    cho: … # phu_de: Tao sẽ quay lại.
- -> END

=== chung_nn_nguyen_gia_tieng_sua ===
# ngau_nhien # noi:san_thuong # gio:12:00-13:30 # ngay_tu:4 # vai_khong:sieu_nhan_hong # vai_khong:cho
_Giờ trưa. Trên sân thượng, Siêu Nhân Hồng đang tập… sủa. Rất nghiêm túc. Có điện thoại ghi âm để nghe lại._
sieu_nhan_hong: Gâu. Không, chưa giống. GÂU. *(ghi âm)* Ê, nghe thử coi giống {cho} chưa?
* [😇 "Giống lắm, mà anh tập sủa làm gì?"]
    sieu_nhan_hong: Để nói chuyện với nó! Anh nghĩ nó ghét anh vì anh sủa sai giọng. Chứ đâu phải vì anh giấu con gà của nó… *(im lặng)* …Ủa anh lỡ nói gì hả?
    ~ qh("sieu_nhan_hong", 5)
* [📸 Quay lại, đăng "Siêu Nhân Hồng luyện tiếng chó".]
    _Clip được ghép nhạc nền gameshow, lên xu hướng nhẹ trong 2 tiếng. Cư dân mạng đặt cho Nguyên biệt danh "Siêu Nhân Gâu"._
    ~ follow(8000)
    ~ chung_so_meme = chung_so_meme + 1
* [🐕 "Hay anh thử… đừng chọc nó nữa?"]
    sieu_nhan_hong: *(đứng hình 3 giây)* …Ủa, có cách đó hả?
    ~ qh("sieu_nhan_hong", 3)
    ~ qh("cho", 3)
- -> END

// ======================= GIÁN ĐIỆP LL =======================

=== chung_nn_ll_ca_phe_rinh ===
# ngau_nhien # noi:quan_ca_phe # gio:12:00-20:00 # vai_khong:cho
_Quán cà phê Sống Ảo. Bàn bên cạnh, một người mặc đồ công sở xanh lá chuối đang cầm tờ báo ngược. Lỗ khoét trên tờ báo vừa đúng hai con mắt._
_Mỗi lần bạn nhắc tới "Siêu Nhân Hồng", tờ báo dịch lại gần thêm một chút._
* [🐍 Nói to: "Nghe nói Siêu Nhân Hồng sắp ký hợp đồng 10 năm với bên mình rồi đó!"]
    _Tờ báo rơi xuống. Người áo xanh lá chuối gọi điện ra ngoài, giọng gấp gáp: "Sếp ơi, 10 năm ạ!"_
    _Bạn vừa tung tin giả cho đối thủ. Cảm giác này… hơi phê._
    ~ cang_thang(-5)
* [😶 Đổi chủ đề sang… giá rau.]
    _Bạn nói về giá rau muống 20 phút. Người áo xanh lá chuối ngủ gục trên tờ báo._
* [📸 Chụp lén người đó gửi vào group công ty.]
    _Group nổ tung. {chi_dai} nhắn: "Ở yên đó. Chị tới." Mười phút sau, bàn bên trống trơn, chỉ còn lại tờ báo có hai cái lỗ._
    ~ qh("chi_dai", 5)
- -> END

=== chung_nn_ll_mui_la_chuoi ===
# ngau_nhien # noi:van_phong # gio:08:00-18:00 # ngay_tu:10
{ vai == "cho": -> ban_cho }
_Hành lang tầng 1 thoang thoảng một mùi nước hoa lạ: tươi, xanh, hơi chát. Giống mùi… lá chuối._
_{cho} đi ngang, khựng lại, mũi hếch lên, rồi gầm gừ khe khẽ về phía dãy bàn cuối._
* [👀 Đi theo {cho}.]
    _{cho} dừng trước bàn của {ten(ran_thu_hai)}, ngồi xuống, nhìn chằm chằm. Rồi đi mất, như chưa từng có gì xảy ra._
    _Bạn không chắc mình vừa thấy gì. Nhưng bạn ghi nhớ._
* [💬 Hỏi to: "Ai xài nước hoa mới vậy, thơm ghê?"]
    _Không ai trả lời. Năm giây sau, có tiếng ai đó xịt thêm một lớp nước hoa khác lên người, mùi bạc hà, rất nồng._
* [😶 Mở cửa sổ cho thoáng.]
    _Mùi bay đi. Cùng với manh mối._
- -> END

= ban_cho
_Mũi bạn giật giật. Mùi này. Mùi lá chuối. Mùi tòa nhà kính bên kia sông. Mùi… không thuộc về chỗ này._
* [👃 Lần theo mùi.]
    cho: *(hít hít)* … Grừ. # phu_de: Mày. Mày có mùi của bọn bên kia.
    _Bạn dừng trước bàn của {ten(ran_thu_hai)}. Người đó nhìn bạn, mỉm cười hơi cứng, rồi đẩy ghế lùi ra._
    ~ qh(ran_thu_hai, -5)
* [😤 Sủa cả hành lang.]
    cho: GÂU GÂU! # phu_de: Có kẻ lạ! Bác ơi có kẻ lạ!
    _Cả tầng nhìn bạn. Không ai hiểu. Bác {bac_bao_ve} ở dưới cổng ngóc đầu lên._
* [🐾 Kệ, đi ngủ.]
    cho: … # phu_de: Chuyện người, người lo.
    ~ nghi(10)
- -> END

=== chung_nn_ll_danh_thiep ===
# ngau_nhien # noi:cong_cong_ty # gio:17:30-19:00 # ngay_tu:12 # vai_khong:cho
_Bạn vừa ra cổng thì một người mặc đồ xanh lá chuối chặn lại, tay đưa tấm danh thiếp in nhũ: "LL-Entertainment. Việc hôm nay phải xong từ hôm qua."_
npc_thu_ky_ll: Sếp em muốn gặp {anh_chi()} một chút. Chỉ một ly cà phê thôi ạ. Lương bên em… gấp đôi.
* [🙅 Xé đôi danh thiếp.]
    npc_thu_ky_ll: *(vẫn cười)* Không sao ạ. Em còn 300 tấm.
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
* [🤔 Nhận, bỏ túi, không nói gì.]
    _Danh thiếp nằm trong túi bạn. Nó nặng hơn một tấm giấy bình thường._
    ~ cang_thang(5)
* [🐕 Huýt sáo gọi {cho}.]
    _{cho} chạy ra, ngửi đôi giày của thư ký LL, rồi để lại một vệt chân bùn trên ống quần xanh lá chuối. Thư ký LL lùi ba bước, bỏ đi._
    ~ qh("cho", 5)
    ~ qh("bac_bao_ve", 3)
- -> END

=== chung_nn_ll_bang_ron ===
# ngau_nhien # noi:duong # gio:07:00-09:00 # ngay_tu:14 # vai_khong:cho
_Sáng nay, trên tòa nhà kính 20 tầng của LL-Entertainment bên Ven Đô, có một tấm băng rôn khổng lồ, nhìn thẳng về phía {cong_ty}:_
_"VIỆC HÔM NAY PHẢI XONG TỪ HÔM QUA. CÒN AI ĐÓ THÌ CỨ ĐỂ NGÀY MAI TÍNH."_
* [😤 Đăng story: "Tụi mình để mai tính, mà tính là ra!"]
    _Story được cả công ty chia sẻ. {giam_doc} thả tim, rồi bình luận: "Đúng mindset!!!"_
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
    ~ follow(2000)
* [😶 Cúi đầu đi tiếp.]
    ~ cang_thang(5)
* [😂 Chụp băng rôn, ghép mặt Siêu Nhân Hồng tạo dáng trước nó.]
    _Ảnh ghép lan nhanh. Cư dân mạng chia phe "Team Ngày Mai" và "Team Hôm Qua". Team Ngày Mai đông hơn, vì ai cũng lười._
    ~ follow(5000)
- -> END

// ======================= ZALO-LÔ BUỔI TỐI =======================

=== chung_nn_zalo_22h_sep ===
# ngau_nhien # noi:dien_thoai # gio:22:00-22:30 # vai_khong:cho # vai_khong:giam_doc
_Ting! Group "{cong_ty} - Toàn công ty"._
giam_doc: Các em ơi, anh vừa đọc một cuốn sách rất hay về văn hóa doanh nghiệp. Mai 7h30 mình họp nhanh nhé. Anh không ép, tùy các em. 💪🔥
_Mười giây sau: 23 người "đã xem". Không ai trả lời._ # hen_gio:8
* [🙇 "{chung_toi_hoa("giam_doc")} nhận ạ! Sách gì vậy sếp, {chung_toi("giam_doc")} mua đọc liền!"]
    giam_doc: Đấy! Thế mới là tinh thần! Sách tên là… anh quên rồi, bìa màu xanh.
    ~ qh("giam_doc", 5)
    ~ qh("thanh_ninh", -3)
* [👍 Thả một like, rồi tắt điện thoại.]
    _Like của bạn là cái duy nhất. Nó cô đơn như một ngọn hải đăng giữa biển "đã xem"._
    ~ qh("giam_doc", 2)
* [😴 Giả vờ ngủ rồi.]
    ~ nghi(5)
* [⏱️ (Không chọn kịp)]
    thanh_ninh: Dạ anh nói chuẩn quá anh ơi!!! Em đặt phòng họp liền ạ 🥰🥰🥰
    _{thanh_ninh} trả lời trong 0,3 giây. Như mọi tối._
- -> END

=== chung_nn_zalo_nham_group ===
# ngau_nhien # noi:dien_thoai # gio:21:00-23:30 # vai_khong:cho # vai_khong:hong_hot
_Group công ty hiện một tin nhắn của {hong_hot}:_
hong_hot: Bà ơi bà biết gì chưa, ổng hồi chiều mặc cái cà vạt hồng mà thắt ngược, tui cười muốn xỉu 😭😭
_Ba giây sau: "{hong_hot} đã thu hồi một tin nhắn"._
_Group im lặng. Rất, rất im lặng. {giam_doc} đang online._
* [📸 Kịp chụp màn hình.]
    _Bạn có một tấm ảnh chụp màn hình. Trong thế giới văn phòng, đây là tài sản._
    ~ qh("hong_hot", -2)
* [🤝 Nhắn riêng {hong_hot}: "Bình tĩnh, chắc ổng chưa đọc."]
    hong_hot: TRỜI ƠI cứu tui 😭 Tui nhắn cho bà {designer} mà bấm nhầm! Hướng nội hết phần đời còn lại luôn!
    ~ qh("hong_hot", 8)
* [🧂 Gửi vào group một sticker con mèo cười.]
    _Sticker của bạn làm cả group bật cười. Mười hai người thả sticker theo. Tin nhắn thu hồi chìm nghỉm dưới 40 con mèo._
    ~ qh("hong_hot", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
- -> END

=== chung_nn_zalo_hoi_an_trua ===
# ngau_nhien # noi:dien_thoai # gio:15:00-18:00 # vai_khong:cho
_Group "Hội ăn trưa (không sếp)":_
_"Tổng trà sữa chiều nay 287.500đ / 7 người = 41.071,43đ/người. Mọi người chuyển khoản giùm em nha."_
_Năm người đã chuyển. Một người chuyển 41.000đ. Một người chưa chuyển. Người chưa chuyển là bạn._
* [💸 Chuyển 41.072đ, làm tròn lên cho sang.]
    ~ tien_cong(-41072)
    _Bạn được thả 5 trái tim. Sự hào phóng 0,57 đồng được ghi nhận._
* [💸 Chuyển 42.000đ, ghi chú "khỏi thối".]
    ~ tien_cong(-42000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
    _Group gọi bạn là "đại gia". Không ai biết bạn còn đúng một gói mì trong tủ._
* [😶 Để mai tính.]
    _Một tuần sau, tên bạn vẫn nằm trong danh sách "chưa chuyển", được ghim lên đầu group._
    ~ cang_thang(5)
- -> END

=== chung_nn_zalo_hop_thu_7 ===
# ngau_nhien # noi:dien_thoai # gio:20:00-23:00 # vai_khong:cho # vai_khong:truong_phong
_Ting!_
truong_phong: Mọi người ơi, sáng thứ 7 mình họp nhanh 5 phút lúc 7h nhé, online thôi, để sync lại tiến độ chiến dịch. Cái này quan trọng. 🙏
* [😇 "{chung_toi_hoa("truong_phong")} tham gia."]
    truong_phong: Tốt quá! Cậu là người đầu tiên. Tớ ghi nhận.
    ~ qh("truong_phong", 5)
    ~ cang_thang(5)
* [😶 Đổi trạng thái thành "Đang đi về quê, sóng yếu".]
    _Mười phút sau, ba người khác cũng đổi trạng thái thành "Đang đi về quê". Có vẻ cả công ty cùng một quê._
* [🐍 "5 phút thật hay 5 phút kiểu anh?"]
    truong_phong: …Tớ take note câu hỏi này. Mình sẽ họp riêng về nó.
    ~ qh("truong_phong", -5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
- -> END

=== chung_nn_zalo_poll ===
# ngau_nhien # noi:dien_thoai # gio:19:00-22:00 # ngay_den:15 # vai_khong:cho # vai_khong:hr
_{hr} tạo bình chọn trong group: "Team building năm nay mình chơi trò gì? 1. Kéo co. 2. Kéo co có nhạc. 3. Kéo co trên cát (Vũng Tàu)."_
* [🗳️ Chọn số 3.]
    _Phương án 3 thắng với 100% số phiếu. Vì {hr} đã khóa hai phương án còn lại._
* [💬 Thêm phương án: "4. Ngủ."]
    _Phương án 4 được 17 phiếu trong 2 phút. {hr} xóa phương án 4, rồi gửi bạn tin nhắn riêng: "Em rảnh không, mai lên uống trà xíu."_
    ~ qh("hr", -5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
* [😶 Không chọn.]
    _Sáng hôm sau, tên bạn nằm trong danh sách "chưa bình chọn, cần động viên tinh thần tập thể"._
- -> END

=== chung_nn_zalo_chart_dem ===
# ngau_nhien # noi:dien_thoai # gio:22:30-23:59 # vai_khong:cho # vai_khong:dan_dau_tu
_Ting! Ting! Ting! Ting! {dan_dau_tu} gửi 9 tấm ảnh chụp biểu đồ vào group, kèm một tin nhắn:_
dan_dau_tu: Mọi người thấy cái nến xanh này hông? Đáy rồi. ĐÁY THẬT RỒI. Lần này là lên thật. Ai vô cùng anh thì vô lẹ!
* [🙄 "Anh trả em tiền trước rồi tính tiếp."]
    dan_dau_tu: *(đã xem)*
    _{dan_dau_tu} đổi ảnh đại diện thành một cái nến xanh._
    ~ qh("dan_dau_tu", -3)
* [😂 Gửi sticker "Còn cái nịt".]
    _Cả group thả "haha". {dan_dau_tu} gửi thêm 3 biểu đồ nữa. Không ai mở._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
* [🔕 Tắt thông báo group.]
    ~ nghi(5)
    ~ cang_thang(-3)
- -> END

=== chung_nn_zalo_da_xem ===
# ngau_nhien # noi:dien_thoai # gio:20:00-23:00 # vai_khong:cho # vai_khong:giam_doc
_Hồi chiều bạn gửi sếp {giam_doc} file báo cáo. Bây giờ là 21 giờ. Trạng thái: "Đã xem lúc 17:41"._
_Không trả lời. Không thả tim. Không gì cả._
* [📱 Nhắn thêm: "Sếp có góp ý gì không ạ?"]
    giam_doc: Anh đang ăn tối với đối tác. Mai nói. 👍
    _Ảnh đại diện của sếp: đang ngồi một mình ở sân golf mini._
    ~ cang_thang(3)
* [😰 Mở file ra đọc lại 7 lần, tìm lỗi chính tả.]
    _Bạn tìm ra một lỗi: "chiến dịch" bị gõ thành "chiến địch". Bạn mất ngủ._
    ~ nghi(-10)
    ~ cang_thang(10)
* [😌 Kệ. Đi tắm.]
    _22:00, sếp trả lời: "Ok em." Hai chữ. Bạn đã tắm xong và không quan tâm nữa. Gần như thế._
    ~ cang_thang(-5)
- -> END

=== chung_nn_zalo_anh_hoi_nho ===
# ngau_nhien # noi:dien_thoai # gio:20:00-23:30 # ngay_tu:11 # ngay_den:14 # vai_khong:cho
_Group công ty đang đăng ảnh hồi nhỏ. Có tấm đội nón tai bèo, có tấm cầm cây kem, có tấm khóc vì bị giành đồ chơi._
_Mọi người tag nhau: "Đoán coi ai đây!"_
* [📸 Đăng ảnh hồi nhỏ của mình.]
    _Tấm ảnh được 18 trái tim. {chi_dai} bình luận: "Dễ thương vậy mà lớn lên đi làm khổ quá trời." Ai cũng thả haha._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
    ~ cang_thang(-5)
* [🔍 Đoán ảnh của người khác.]
    _Bạn đoán trúng 5/7. Tấm thứ 6 bạn đoán là {giam_doc}, hóa ra là {con_ong_chau_cha}. Hai chú cháu giống nhau tới đáng sợ._
    ~ qh("con_ong_chau_cha", 3)
* [😶 Lướt qua, không đăng.]
    _Có những tấm ảnh nằm trong ngăn kéo vì lý do riêng._
- -> END

// ======================= HẺM 69 =======================

=== chung_nn_hem_karaoke_chu_sau ===
# ngau_nhien # noi:hem_69 # gio:22:00-23:30 # vai_khong:cho
_22 giờ đúng. Loa kẹo kéo nhà Chú Sáu bật lên. Tiếng nhạc dạo dài 40 giây. Rồi giọng Chú Sáu, cao hơn cả hóa đơn tiền điện._
npc_chu_sau: Một bài nữa thôi! Bài này tặng cả xóm!
* [🎤 Ra hát chung một bài.]
    _Bạn hát bài "Công Viên". Cả hẻm hát theo đoạn "thích ăn chuối chiên". Chú Sáu xúc động, tặng bạn một trái bắp luộc._
    ~ an(15)
    ~ nghi(-10)
    ~ cang_thang(-10)
* [🛌 Đeo tai nghe chống ồn, cố ngủ.]
    _Tai nghe chặn được tiếng nhạc. Không chặn được tiếng vỗ tay của Bà Tư._
    ~ nghi(-5)
* [📱 Nhắn {it}: "Có cách nào cho cái loa đó… nghỉ ngơi không?"]
    it: Có. Không nói qua tin nhắn.
    _Năm phút sau, loa nhà Chú Sáu tự dưng "rè rè" rồi tắt. Không ai biết vì sao. Bạn ngủ ngon._
    ~ nghi(10)
- -> END

=== chung_nn_hem_ba_tu_thu_tien ===
# ngau_nhien # noi:hem_69 # gio:06:30-21:00 # ngay_tu:3 # ngay_den:8 # vai_khong:cho
_Bà Tư chủ trọ ngồi ghế đẩu đầu dãy, quạt nan phe phẩy, nhìn bạn đi ngang._
npc_ba_tu: Nay mùng mấy rồi con?
* [💸 "Dạ con gửi tiền trọ luôn nè bà."]
    ~ tien_cong(-2500000)
    npc_ba_tu: Ngoan. Mà nè, con nhỏ phòng 5 hồi tối livestream tới 2 giờ, con có nghe hông? Bà nghe hết.
    ~ cang_thang(-3)
* [😅 "Dạ lương chưa về bà ơi, cho con khất tới ngày 12."]
    npc_ba_tu: Ngày 12. Bà ghi rồi đó. *(ghi vào cuốn sổ ô li)* Mà công ty con bán siêu nhân hả? Lương về trễ quá ha.
    ~ cang_thang(5)
* [🏃 Giả vờ nghe điện thoại, đi thẳng.]
    npc_ba_tu: *(nói với theo)* Bà ngồi đây tới 10 giờ tối nha con!
    ~ cang_thang(8)
- -> END

=== chung_nn_hem_cup_nuoc ===
# ngau_nhien # noi:hem_69 # gio:06:00-08:00 # vai_khong:cho
_Cúp nước. Cả hẻm xách xô ra vòi nước công cộng đầu hẻm. {thuc_tap_sinh} đứng đầu hàng, cầm 4 cái xô của 4 người ở chung phòng._
thuc_tap_sinh: Dạ, {chung_goi_ai("thuc_tap_sinh", vai)} lên trước đi ạ. Em lấy lâu lắm, 4 xô lận.
* [🤝 Xách phụ {thuc_tap_sinh} hai xô.]
    thuc_tap_sinh: Dạ… dạ thôi, em làm được mà! *(vẫn đưa cho bạn hai xô)* Dạ em cảm ơn ạ!
    ~ qh("thuc_tap_sinh", 10)
    ~ nghi(-5)
* [😇 Đứng sau, chờ tới lượt.]
    _Hàng chờ 25 phút. Bạn nghe được ba chuyện tình, hai vụ nợ, và một tin đồn về chính bạn._
    ~ cang_thang(3)
* [🧴 Mua nước suối rửa mặt, đi làm luôn.]
    ~ tien_cong(-16000)
    _Bạn rửa mặt bằng nước suối đóng chai. Cảm giác như đại gia. Một đại gia chưa tắm._
- -> END

=== chung_nn_hem_vach_mong ===
# ngau_nhien # noi:hem_69 # gio:21:00-01:00 # vai_khong:cho # vai_khong:hong_hot
_Vách phòng trọ mỏng như lời hứa tăng lương. Phòng bên vọng sang giọng {hong_hot} đang livestream:_
hong_hot: …mọi người ơi, hôm nay Siêu Nhân Hồng làm gì biết hông? Tui kể nè, mà tui kể nhỏ thôi nha, vì tường nhà tui mỏng lắm…
* [🧱 Gõ vách ba cái.]
    hong_hot: *(im ba giây)* …Mọi người nghe gì hông? Ma hả? Thôi tui nói nhỏ hơn nữa nè.
    _Cô nói nhỏ hơn được 30 giây._
* [👂 Áp tai vào vách nghe tiếp.]
    _Bạn nghe được ba tin nóng về công ty. Một tin trong đó là về bạn. Nó sai 70%._
    ~ nghi(-5)
* [📱 Vào livestream, bình luận: "Tường mỏng thiệt đó, tui nghe hết rồi."]
    hong_hot: ỦA ALO?
    _Livestream tăng 200 người xem, vì drama nhỏ này. Tóp-tóp của công ty được nhắc ké._
    ~ follow(2000)
    ~ qh("hong_hot", 3)
- -> END

=== chung_nn_hem_banh_mi_co_bay ===
# ngau_nhien # noi:hem_69 # gio:06:00-08:00 # vai_khong:cho
_Xe bánh mì Cô Bảy đầu hẻm. Mùi pa-tê nướng bay xa tới mức chó nhà Bà Tư thức dậy._
npc_co_bay: Như mọi khi hả con?
* [🥖 "Dạ như mọi khi, thêm trứng!"]
    ~ tien_cong(-30000)
    ~ an(35)
    npc_co_bay: Nè. Thêm cọng hành cho con, đi làm cho tươi.
* [📝 "Cô ghi sổ giùm con nha, ngày 12 con trả."]
    npc_co_bay: *(lật sổ)* Con nợ cô 3 ổ rồi đó. Thôi lấy đi, đi làm đói sao được.
    ~ an(30)
    ~ cang_thang(3)
* [🥖 Mua thêm một ổ cho đồng nghiệp.]
    ~ tien_cong(-50000)
    ~ an(30)
    _Ổ thứ hai được người nhận cảm động đăng story: "Có đồng nghiệp mua bánh mì cho là thấy đời đáng sống"._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
- -> END

=== chung_nn_hem_tra_da ===
# ngau_nhien # noi:quan_tra_da # gio:17:30-21:00 # vai_khong:cho
_Quán trà đá đầu hẻm. Ông Ba ngồi dưới gốc cây, quạt mo phe phẩy, bàn cờ tướng bày sẵn._
npc_ong_ba: Ngồi chơi, uống miếng nước.
* [🍵 Ngồi xuống uống một ly.]
    ~ tien_cong(-3000)
    ~ uong(25)
    _Ba nghìn đồng một ly trà, kèm miễn phí toàn bộ tin tức của cả hẻm trong 24 giờ qua._
    ~ cang_thang(-5)
* [♟️ Đánh một ván cờ với Ông Ba.]
    _Ông Ba thắng trong 11 nước. Ông nói: "Chơi được. Bằng thằng Bình hồi mới tập." Bạn không biết đó là khen hay chê._
    ~ cang_thang(-8)
    ~ nghi(-3)
* [😶 Chào rồi đi về.]
    npc_ong_ba: Ừ. Mai ghé.
- -> END

=== chung_nn_hem_hong_danh_nhau ===
# ngau_nhien # noi:hem_69 # gio:19:00-22:00 # vai_khong:cho
_Đầu hẻm ồn ào. Cả hẻm đổ ra hóng. Cặp đôi phòng 7 đang cãi nhau, to tới mức chó nhà Bà Tư phải ngồi xuống nghe._
_"Anh mặc áo hồng đi chơi với ai?" / "Công ty bắt mặc! Tháng này cái gì cũng phải hồng!"_
* [🧂 Đứng hóng tới cuối.]
    _Cuối cùng cả hai làm hòa vì cùng ghét màu hồng. Cả hẻm vỗ tay. Bạn đã có một buổi tối giải trí miễn phí._
    ~ cang_thang(-5)
* [🤝 Xen vào: "Thiệt mà chị, công ty em cũng bắt mặc hồng!"]
    _Chị phòng 7 nhìn bạn từ đầu tới chân, thấy món đồ hồng bạn đang đeo, gật gù. "Ờ, vậy là thật."_
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
* [🏠 Vô phòng, đóng cửa.]
    _Vách mỏng. Bạn vẫn nghe hết._
- -> END

// ======================= CHỢ, CHÙA PHỐ CŨ =======================

=== chung_nn_cho_mac_ca ===
# ngau_nhien # noi:cho_pho_cu # gio:06:00-10:00 # vai_khong:cho # vai_khong:ke_toan
~ temp g = chung_goi("ke_toan")
_Chợ Phố Cũ. {ke_toan} đứng trước sạp rau, máy tính cầm tay trong một tay, bó rau muống trong tay kia._
ke_toan: Chị ơi, hôm qua 12 nghìn, hôm nay 15 nghìn, tăng 25% trong một ngày. Chị có hóa đơn đầu vào hông?
_Cô bán rau nhìn {ke_toan} như nhìn đoàn kiểm tra thuế._
* [🤝 Nói với cô bán rau: "Thôi cô bán 13 nghìn đi, con mua hai bó."]
    _Cô bán rau đồng ý. {ke_toan} gật đầu với bạn, rất nhẹ. Đó là cái gật đầu "đồng chí"._
    ~ tien_cong(-26000)
    ~ qh("ke_toan", 8)
* [😂 "Rau muống mà cũng cần hóa đơn hả {chung_ban("ke_toan")}?"]
    ke_toan: Không có hóa đơn là không có tiền. Rau muống cũng vậy.
    ~ qh("ke_toan", 2)
* [💬 Hỏi {ke_toan} đi chợ mua cho ai.]
    ke_toan: Cho tui. Với… mua thêm phần cho {chi_dai}. Bả ăn rau mà không biết rau giá bao nhiêu.
    ~ qh("ke_toan", 5)
- -> END

=== chung_nn_cho_co_ban_ca ===
# ngau_nhien # noi:cho_pho_cu # gio:06:00-10:00 # vai_khong:cho
_Sạp cá. Hai cô bán cá đang nói chuyện, tay vẫn làm cá thoăn thoắt._
_"Bà nghe chưa, có người mặc đồ siêu nhân hồng đi chợ hồi sáng, phụ bà Năm khiêng thùng đá, xong đi mất, không lấy tiền." / "Diễn đó bà, quay clip đó!" / "Có ai quay đâu, tui ngó rồi."_
* [😇 "Dạ người đó là bạn công ty con."]
    _Hai cô quay sang, mắt sáng rỡ. Bạn được biếu một con cá rô, kèm lời nhắn: "Nói cậu đó mai ghé, cô bán rẻ."_
    ~ an(20)
    ~ follow(2000)
* [📱 Nhắn {hong_hot} kể lại chuyện này.]
    _Tối đó fanpage có bài "Siêu Nhân Hồng đi chợ: chuyện không ai quay". Bài viết chân thật tới mức được chia sẻ 3.000 lần._
    ~ follow(6000)
    ~ qh("hong_hot", 3)
* [😶 Mua cá rồi đi.]
    ~ tien_cong(-40000)
    ~ an(20)
- -> END

=== chung_nn_chua_cau_may ===
# ngau_nhien # noi:chua_pho_cu # gio:06:00-19:00 # vai_khong:cho # vai_khong:dan_dau_tu
_Chùa Phố Cũ. Khói hương nhẹ nhàng. Trước điện, {dan_dau_tu} quỳ, điện thoại đặt bên cạnh, màn hình đang mở chart._
dan_dau_tu: *(thì thầm)* Con xin lên… chỉ cần lên một chút thôi… Con hứa lần này cắt lỗ…
* [🙏 Thắp một nén hương, cầu cho chiến dịch.]
    _Bạn cầu cho Siêu Nhân Hồng đủ 1 triệu người theo dõi. Rồi cầu thêm cho lương về đúng ngày. Cái sau khó hơn._
    ~ cang_thang(-15)
* [🤝 Ngồi xuống cạnh {dan_dau_tu}.]
    dan_dau_tu: *(giật mình, úp điện thoại)* Ủa… Anh… anh tới tịnh tâm thôi. Không phải vì coin đâu.
    _Một lúc sau, {dan_dau_tu} nói nhỏ: "Thật ra anh mệt lắm." Lần đầu tiên bạn nghe ổng nói một câu không có chữ "lên"._
    ~ qh("dan_dau_tu", 10)
* [😶 Đi ra sân sau ngồi.]
    _Sân sau có một bà cụ quét lá. Không ai nói gì. Bình yên._
    ~ cang_thang(-10)
    ~ nghi(5)
- -> END

// ======================= QUÁN CÀ PHÊ =======================

=== chung_nn_ca_phe_wifi ===
# ngau_nhien # noi:quan_ca_phe # gio:08:00-22:00 # vai_khong:cho
_Quán cà phê Sống Ảo. Tên wifi: "Khong co pass". Bạn kết nối. Nó đòi mật khẩu._
* [💬 Hỏi nhân viên mật khẩu.]
    _"Mật khẩu là khongcopass, viết liền, không dấu ạ." Mạng chạy vèo vèo. Bạn đã hiểu cuộc đời theo một cách mới._
    ~ cang_thang(-3)
* [📶 Bắt đại wifi "LL_Guest_Free".]
    _Wifi bắt được. Màn hình hiện: "Chào mừng bạn đến với LL-Entertainment. Bạn có muốn nhận thông tin tuyển dụng?". Bạn ngắt kết nối nhanh như rút tay khỏi bếp._
* [📱 Dùng 4G của mình.]
    ~ tien_cong(-10000)
- -> END

=== chung_nn_ca_phe_long_moi ===
# ngau_nhien # noi:quan_ca_phe # gio:10:00-15:00 # vai_khong:cho # vai_khong:con_ong_chau_cha
~ temp g = chung_goi("con_ong_chau_cha")
_{con_ong_chau_cha} ngồi bàn đẹp nhất quán, laptop mở nhưng màn hình đang chiếu Tóp-tóp, đeo tai nghe chụp tai, kính râm trong nhà._
con_ong_chau_cha: Ê {g}! Ngồi đi, anh bao! Đây là "họp marketing", ghi vào sổ của chú anh luôn.
* [☕ Gọi ly rẻ nhất.]
    con_ong_chau_cha: Ủa sao gọi ly đó? Gọi ly 95 nghìn đi, ngon hơn mà.
    ~ uong(20)
    ~ nghi(20)
    ~ qh("con_ong_chau_cha", 5)
* [💬 "Anh làm việc thật hả?"]
    con_ong_chau_cha: *(tháo tai nghe, nhìn bạn lâu)* …Nếu anh nói anh có làm một thứ, mà không ai biết, {g} tin hông?
    _{con_ong_chau_cha} đeo tai nghe lại. Trong tai nghe vọng ra một đoạn giai điệu chưa từng nghe, rất hay._
    ~ qh("con_ong_chau_cha", 8)
* [📸 Chụp story "Họp marketing" của {con_ong_chau_cha} gửi {truong_phong}.]
    truong_phong: Tớ biết rồi. Tớ đã take note từ tháng 3.
    ~ qh("truong_phong", 3)
    ~ qh("con_ong_chau_cha", -5)
- -> END

=== chung_nn_ca_phe_tieng_hat ===
# ngau_nhien # noi:quan_ca_phe # gio:19:00-22:00 # vai_khong:cho # vai_khong:thanh_xin_nghi
_Tối cuối tuần ở quán cà phê Sống Ảo có đêm nhạc acoustic. Người hát đeo khẩu trang hồng, đội mũ lưỡi trai sụp xuống tận mắt._
_Giọng hát rất hay. Rất quen. Giống giọng đã từng gọi điện xin nghỉ với HR, nhưng khỏe hơn khoảng 300%._
* [👏 Vỗ tay thật to.]
    _Người hát cúi đầu cảm ơn, rồi thấy bạn. Khựng lại. Ho một tiếng. Ho rất đúng kiểu {thanh_xin_nghi}._
    ~ qh("thanh_xin_nghi", 5)
    ~ cang_thang(-8)
* [🤫 Nhắn {thanh_xin_nghi}: "Hát hay ghê."]
    thanh_xin_nghi: Ai hát? Em đang nằm nhà, sốt 39 độ.
    _Trên sân khấu, người đeo khẩu trang hồng vừa liếc điện thoại._
    ~ phat_hien(son_thi_hat)
* [📸 Quay một đoạn.]
    _Bạn có 20 giây clip. Trong 20 giây đó, người hát nhìn thẳng vào camera và lắc đầu rất nhẹ._
- -> END

=== chung_nn_ca_phe_hai_laptop ===
# ngau_nhien # noi:quan_ca_phe # gio:18:00-22:00 # vai_khong:cho # vai_khong:designer
~ temp g = chung_goi("designer")
_{designer} ngồi góc quán, hai laptop mở song song. Laptop bên trái: poster Siêu Nhân Hồng. Laptop bên phải: một bảng màu toàn xanh lá chuối._
designer: *(gập laptop phải lại, nhanh như phản xạ)* Ủa {g}. Ngồi… ngồi đi. Job freelancer thôi. Quán trà sữa.
* [😇 "Ừ, ai mà chẳng chạy thêm job."]
    designer: *(thở ra)* Ừ… đúng rồi. Ai mà chẳng vậy. Cảm ơn nha.
    ~ qh("designer", 8)
* [🐍 "Quán trà sữa gì mà màu lá chuối vậy?"]
    designer: Trà sữa… matcha. Matcha màu xanh mà. Phải không? *(cười gượng)*
    ~ qh("designer", -5)
* {biet(quynh_lam_cho_ll)} [🔒 "Bên LL trả bao nhiêu một bản?"]
    designer: *(im lặng rất lâu)* …Đủ trả tiền nhà. Đừng nói ai. Tui… tui chưa biết bỏ sao.
    ~ qh("designer", 3)
    ~ cang_thang(3)
- -> END

// ======================= ĐƯỜNG XÁ & MƯA =======================

=== chung_nn_duong_ket_xe ===
# ngau_nhien # noi:duong # gio:07:15-08:00 # vai_khong:cho # vai_khong:bac_bao_ve
_Đại Lộ Kẹt Xe đúng như tên gọi. Xe máy đứng im như một bãi đậu xe khổng lồ. Đồng hồ: 7 giờ 41._
_Bên phải có một con hẻm. Bản đồ nói đi hẻm nhanh hơn 6 phút. Bản đồ chưa bao giờ đi hẻm này._ # hen_gio:6
* [🏍️ Rẽ vào hẻm.]
    { RANDOM(1, 3) <= 2:
        _Hẻm thông! Bạn chạy qua ba khúc cua, một cái chợ chồm hổm, và một đám cưới. Tới công ty lúc 7:56._
        ~ cang_thang(-3)
    - else:
        _Hẻm cụt. Cuối hẻm là một con chó và một bà cụ đang phơi đồ. Bà cụ nói: "Đi lui ra con." Bạn tới công ty lúc 8:09._
        ~ tien_cong(-50000)
        ~ cang_thang(10)
    }
* [😶 Đứng chờ, mở nhạc nghe.]
    _Bạn tới lúc 8:03. Máy chấm công kêu "tít" một cách phán xét. {hr} đứng cạnh, mỉm cười, ghi gì đó._
    ~ cang_thang(5)
* [📱 Nhắn group: "Kẹt xe quá, em tới trễ xíu ạ."]
    _Mười một người khác cũng vừa nhắn y chang. Group công ty biến thành bản tin giao thông._
* [⏱️ (Không chọn kịp)]
    _Bạn chần chừ quá lâu. Chiếc xe phía sau bấm còi. Bạn không đi đâu cả. Tới công ty lúc 8:07._
    ~ tien_cong(-50000)
    ~ cang_thang(8)
- -> END

=== chung_nn_duong_het_xang ===
# ngau_nhien # noi:duong # gio:07:00-19:00 # vai_khong:cho # vai_khong:sieu_nhan_hong # vai_khong:bac_bao_ve
_Xe bạn ho hai tiếng, rồi im. Kim xăng chỉ chữ E. E là "Ét o ét"._
_Cây xăng gần nhất cách 1,5 km._
* [🚶 Dắt bộ.]
    _Bạn dắt xe 1,5 km dưới nắng. Đổ xăng xong, bạn mua thêm một chai nước vì tưởng mình sắp thành xác ướp._
    ~ tien_cong(-60000)
    ~ uong(-20)
    ~ nghi(-15)
* [🙏 Đứng ven đường chờ ai giúp.]
    _Năm phút sau, một bóng hồng phóng tới. Siêu Nhân Hồng đẩy xe bạn tới cây xăng, chạy song song, vừa đẩy vừa hô "Vì công lý và lượt view!". Không có camera nào._
    _Đổ xăng xong, bạn quay lại cảm ơn. Bóng hồng đã đi đẩy chiếc xe tiếp theo._
    ~ tien_cong(-50000)
    ~ qh("sieu_nhan_hong", 10)
* [📱 Gọi Grab, bỏ xe lại.]
    npc_grab: Em xin lỗi, xe em bể bánh.
    _Chuyến thứ hai cũng bể bánh. Chuyến thứ ba bể… thắng. Bạn quyết định dắt bộ._
    ~ tien_cong(-60000)
    ~ nghi(-15)
    ~ cang_thang(8)
- -> END

=== chung_nn_duong_grab_huy ===
# ngau_nhien # noi:duong # gio:07:00-08:00 # vai_khong:cho # vai_khong:bac_bao_ve
_Trời sắp mưa. Bạn đặt Grab. "Đã tìm thấy tài xế." Ba giây sau: "Tài xế đã hủy chuyến."_
_Tin nhắn từ tài xế: "Em xin lỗi, xe em bể bánh."_
* [🔄 Đặt lại.]
    _Lần hai: tài xế nhận. Tài xế gọi: "Anh chị ơi, anh chị đứng chỗ nào? Em thấy có 4 người giống anh chị." Bạn vẫy tay. Tài xế chạy qua bạn._
    ~ tien_cong(-45000)
    ~ cang_thang(5)
* [🏍️ Mượn xe của hàng xóm.]
    _Hàng xóm cho mượn, kèm điều kiện: mua giùm một ổ bánh mì không hành, không đồ chua, không pa-tê, không thịt. Bánh mì không._
    ~ tien_cong(-15000)
* [🏃 Chạy bộ đi làm.]
    ~ nghi(-20)
    ~ uong(-15)
    _Bạn tới công ty mồ hôi ướt áo. {chi_dai} nhìn bạn, đưa cho một cái khăn: "Lần sau gọi chị chở."_
    ~ qh("chi_dai", 5)
- -> END

=== chung_nn_duong_kiem_tra ===
# ngau_nhien # noi:duong # gio:07:00-09:00 # vai_khong:cho # vai_khong:bac_bao_ve
_Đầu Đại Lộ Kẹt Xe có chốt kiểm tra. Anh công an phường ra hiệu dừng xe._
npc_cong_an: Cho xem giấy tờ xe. …Ừ, đủ. Mà {anh_chi()} làm ở công ty có Siêu Nhân Hồng phải không? Đồng phục cam có chữ G kìa.
* [😇 "Dạ đúng rồi anh."]
    npc_cong_an: *(nhỏ giọng)* Hôm bữa ảnh giúp mẹ tôi qua đường. Nói ảnh tôi cảm ơn nha. Đi đi, đi cẩn thận.
    ~ cang_thang(-5)
    ~ qh("sieu_nhan_hong", 2)
* [📸 "Anh chụp chung một tấm với logo công ty em hông?"]
    npc_cong_an: Thôi, đang làm nhiệm vụ. Đi đi em.
* [😶 Gật đầu, đi tiếp.]
    _Bạn đi tiếp, tim đập nhanh dù chẳng làm gì sai. Ai đi làm cũng vậy._
- -> END

=== chung_nn_duong_den_do ===
# ngau_nhien # noi:duong # gio:18:00-23:00 # vai_khong:cho # vai_khong:idol_het_thoi
~ temp g = chung_goi("idol_het_thoi")
_Đèn đỏ 90 giây. Xe bên cạnh: một người đội nón bảo hiểm dán sticker ngôi sao, đeo kính râm lúc 9 giờ tối, khăn quàng cổ hồng bay phấp phới._
idol_het_thoi: *(hạ kính xuống một chút, nhìn quanh xem có ai nhận ra mình không)* …Ủa {g}. Đi đâu đó? Anh đi hát đám cưới. Đám này VIP lắm.
* [😇 "Đám cưới ở đâu vậy anh?"]
    idol_het_thoi: Nhà hàng Hỷ Hỷ, sảnh B. Sảnh B là sảnh nhỏ. Nhưng mà… VIP. *(đèn xanh)* Nhớ nghe "Công Viên" bản đám cưới nha!
    ~ qh("idol_het_thoi", 5)
* [🎵 Hát: "Ngày xưa có đôi bạn thân…"]
    idol_het_thoi: *(bật cười, hát tiếp)* "…bán cá viên chiên tại công viên!" *(đèn xanh, phóng đi, vẫn hát)*
    _Lần đầu tiên tối nay, {idol_het_thoi} cười thật._
    ~ qh("idol_het_thoi", 10)
* [😶 Giả vờ không nhận ra.]
    idol_het_thoi: *(kéo kính xuống thêm)* Em biết anh là ai không?
    _Đèn xanh. Bạn đi. Câu hỏi vẫn lơ lửng ở ngã tư._
    ~ qh("idol_het_thoi", -3)
- -> END

=== chung_nn_mua_ngap ===
# ngau_nhien # noi:duong # gio:16:30-19:30 # vai_khong:cho # vai_khong:bac_bao_ve
_Mưa. Mưa kiểu Thành Phố Ước Mơ: 15 phút là nước ngập tới đầu gối. Xe máy trôi lềnh bềnh như thuyền thúng._
* [🌊 Lội qua.]
    { RANDOM(1, 2) == 1:
        _Bạn lội qua thành công, quần ướt tới hông. Xe vẫn chạy. Bạn là người hùng của chính mình._
    - else:
        _Xe chết máy giữa dòng. Bạn đẩy xe 200 mét. Một chiếc xe tải chạy qua, tạo sóng. Bạn được tắm miễn phí._
        ~ nghi(-15)
        ~ cang_thang(10)
    }
* [☕ Trú mưa ở quán cóc ven đường.]
    _Bạn ngồi uống ly trà đá, nhìn mưa. Cả quán đầy dân văn phòng, ai cũng nhìn điện thoại, ai cũng đang nhắn "kẹt mưa, về trễ"._
    ~ tien_cong(-5000)
    ~ cang_thang(-5)
* {co(ao_mua)} [🧥 Mặc áo mưa, đi chậm.]
    _Áo mưa làm tròn nhiệm vụ. Bạn về tới nhà khô ráo 70%. 30% còn lại là do giày._
    ~ cang_thang(-2)
- -> END

=== chung_nn_mua_ao_mua_chung ===
# ngau_nhien # noi:cong_cong_ty # gio:17:00-18:30 # vai_khong:cho # vai_khong:thuc_tap_sinh
_Tan làm, trời đổ mưa. {thuc_tap_sinh} đứng ở cổng, chỉ có một cái áo mưa loại 5 nghìn, đang cố mở ra mà nó dính chặt như giấy bóng kính._
thuc_tap_sinh: Dạ… dạ {chung_goi_ai("thuc_tap_sinh", vai)} có áo mưa chưa ạ? Em có một cái, mình… mình mặc chung được không ạ?
* [🤝 Mặc chung. Hai người một áo mưa.]
    _Hai người, một áo mưa, một xe máy. Áo mưa che được đầu người lái và… ý chí của người ngồi sau._
    ~ qh("thuc_tap_sinh", 12)
    ~ cang_thang(-3)
* [🧥 Đưa luôn áo mưa của mình cho {thuc_tap_sinh}.]
    { co(ao_mua):
        ~ mat(ao_mua)
        thuc_tap_sinh: Dạ… em cảm ơn ạ! Mai em mua trả liền!
        _Sáng hôm sau, trên bàn bạn có một cái áo mưa mới, loại xịn, kèm tờ giấy viết chữ rất đẹp: "Em cảm ơn ạ."_
        ~ nhan(ao_mua)
        ~ qh("thuc_tap_sinh", 15)
    - else:
        _Bạn lục túi. Không có áo mưa. Hai người đứng nhìn mưa, cùng thở dài._
    }
* [🏃 Chạy ra xe trước.]
    _Ra tới xe thì bạn đã ướt. {thuc_tap_sinh} vẫn đứng ở cổng, vẫn cố mở cái áo mưa dính._
- -> END

=== chung_nn_mua_xin_ve_som ===
# ngau_nhien # noi:van_phong # gio:15:00-17:00 # vai_khong:cho # vai_khong:hr
~ temp g = chung_goi("hr")
~ temp x = chung_xung("hr")
_Trời tối sầm lúc 3 giờ chiều. Sấm. Cả văn phòng nhìn ra cửa sổ, rồi nhìn {hr}. {hr} nhìn lại, mỉm cười._
hr: Ủa, {g} muốn nói gì với {x} hả?
* [🙏 "Cho {chung_toi("hr")} về sớm 30 phút nha, nhà {chung_toi("hr")} ngập."]
    hr: Ồ. Nhà {g} ở Hẻm 69 hả? Hẻm 69 đâu có ngập. {x} có kiểm tra rồi. Nhưng thôi, về đi. Lần này {x} ghi nhận.
    ~ cang_thang(-5)
    ~ qh("hr", -2)
* [😇 "Thôi, {chung_toi("hr")} làm tiếp."]
    hr: Tốt quá. {x} sẽ nhớ.
    ~ qh("hr", 5)
    ~ nghi(-5)
* [🌧️ "{chung_ban_hoa("hr")} ơi, mưa thế này {chung_toi("hr")} sợ {thanh_xin_nghi} kẹt ở Ven Đô quá…"]
    hr: *(nụ cười đứng hình)* Ven Đô? Hôm nay {thanh_xin_nghi} xin nghỉ "về quê". Quê ở Ven Đô hả? *(mở sổ)* Cảm ơn {g} nha.
    ~ qh("thanh_xin_nghi", -8)
    ~ qh("hr", 8)
- -> END

=== chung_nn_mua_nguoi_ao_hong ===
# ngau_nhien # noi:duong # gio:17:30-20:00 # vai_khong:sieu_nhan_hong # vai_khong:cho
_Mưa như trút. Giữa Đại Lộ Kẹt Xe, có một bóng áo hồng đang đẩy lần lượt từng chiếc xe chết máy lên lề. Không ai quay. Ai cũng đang lo cho xe mình._
_Áo choàng ướt sũng, dính sát người. Không có tạo dáng. Không có khẩu hiệu. Chỉ có đẩy._
* [🤝 Xuống xe, đẩy phụ.]
    _Hai người đẩy được 7 chiếc xe. Lúc chia tay, bóng hồng giơ ngón cái. Không nói gì. Bạn về nhà ướt nhưng nhẹ người lạ thường._
    ~ qh("sieu_nhan_hong", 12)
    ~ nghi(-10)
    ~ cang_thang(-10)
* [📸 Quay lại đăng lên mạng.]
    _Clip mờ, rung, đầy mưa. Nhưng thật. 30 nghìn lượt xem qua đêm. Bình luận: "Cái này mới là siêu nhân."_
    ~ follow(12000)
* [😶 Chạy xe đi tiếp.]
    _Qua gương chiếu hậu, bạn thấy bóng hồng đang đẩy chiếc xe thứ tám._
- -> END

// ======================= KARAOKE & QUÁN ỐC =======================

=== chung_nn_karaoke_cong_vien ===
# ngau_nhien # noi:karaoke # gio:20:00-23:30 # vai_khong:cho # vai_khong:idol_het_thoi
_Karaoke Hát Cho Nhau Nghe, phòng VIP (VIP vì có hai cái micro không rè). Ai đó bấm bài "Công Viên". Cả phòng quay sang nhìn {idol_het_thoi}._
idol_het_thoi: Thôi… thôi mà. Bài này… anh hát hoài rồi. *(đã đứng dậy, đã cầm micro, đã tháo kính râm)*
* [👏 Hô: "Hát đi! Hát đi! Hát đi!"]
    _{idol_het_thoi} hát. Hát hay. Hay thật. Tới đoạn "thích ăn chuối chiên", cả phòng hát theo, có người khóc vì nhớ năm 2015._
    ~ qh("idol_het_thoi", 10)
    ~ cang_thang(-15)
* [🎤 Giành micro hát chung.]
    _Bạn hát lệch tông nửa cung. {idol_het_thoi} kéo tông về giúp bạn mà không ai nhận ra. Dân chuyên nghiệp là vậy._
    ~ qh("idol_het_thoi", 5)
    ~ cang_thang(-10)
* [📸 Quay lại, đăng lên mạng: "Ca sĩ gốc hát Công Viên ở karaoke".]
    _Clip được 5.000 lượt xem. Bình luận nhiều nhất: "Ủa ổng còn hát hả?". Bình luận thứ hai: "Hay vậy sao giờ mới thấy?"._
    ~ follow(2000)
    ~ qh("idol_het_thoi", 3)
- ~ tien_cong(-50000)
-> END

=== chung_nn_karaoke_tranh_micro ===
# ngau_nhien # noi:karaoke # gio:20:00-23:30 # vai_khong:cho # vai_khong:sales # vai_khong:idol_het_thoi
_{sales} và {idol_het_thoi} cùng cầm một cái micro. Không ai buông. Nhạc dạo đã chạy tới lần thứ ba._
sales: Tin chị đi, bài này chị hát hay hơn!
idol_het_thoi: Em biết anh là ai không?
* [🤝 Đưa cái micro thứ hai cho {sales}.]
    _Hai người song ca. Một người hát đúng lời, một người hát đúng tông. Không ai trùng ai. Cả phòng vỗ tay vì sợ._
    ~ qh("sales", 3)
    ~ qh("idol_het_thoi", 3)
* [🎤 Giật luôn micro, tự hát.]
    _Cả hai quay sang nhìn bạn. Lần đầu tiên tối nay họ đồng lòng: cùng ghét bạn._
    ~ qh("sales", -5)
    ~ qh("idol_het_thoi", -5)
    ~ cang_thang(-10)
* [🍉 Ăn dưa hấu, xem.]
    ~ an(10)
    _Đĩa dưa hấu karaoke luôn ngon hơn dưa hấu ở bất kỳ đâu. Không ai biết vì sao._
- -> END

=== chung_nn_karaoke_sep_hat ===
# ngau_nhien # noi:karaoke # gio:20:30-23:30 # vai_khong:cho # vai_khong:giam_doc
_Sếp {giam_doc} cầm micro, bấm một bài nhạc đỏ về Hà Nội mùa thu. Hát xong, quay ra nhìn cả phòng. Màn hình chấm điểm: 62._
giam_doc: Máy này chấm không chuẩn. Ai thấy anh hát được thì vỗ tay nhé. Anh không ép.
* [👏 Vỗ tay thật to, hô "Đỉnh nóc kịch trần!"]
    giam_doc: Thấy chưa! Có người biết nghe!
    ~ qh("giam_doc", 8)
    ~ qh("thanh_ninh", -5)
* [💬 "Hát lại bài khác đi sếp, máy chấm lại."]
    _Bài thứ hai: 58 điểm. Sếp đổ lỗi cho micro. Bài thứ ba: 99 điểm, vì {it} đã lén chỉnh máy._
    ~ qh("giam_doc", 3)
    ~ qh("it", 3)
* [😶 Nhìn xuống điện thoại.]
    giam_doc: …Em kia, em đang nhắn tin với ai thế? Đối thủ à?
    ~ cang_thang(5)
- -> END

=== chung_nn_quan_oc_lo_mieng ===
# ngau_nhien # noi:quan_oc # gio:19:00-23:30 # vai_khong:cho
_Quán Ốc Đêm. Lon bia thứ tư. Ai cũng bắt đầu nói thật. Người ngồi đối diện bạn đặt lon bia xuống, mắt đỏ hoe._
_"Tui nói cái này… mấy người đừng kể ai nha…"_
* [🍺 Rót thêm bia, lắng nghe.]
    _Bạn nghe một bí mật không phải của mình. Nó nặng hơn bạn tưởng. Sáng mai, người kể sẽ không nhớ. Bạn thì sẽ nhớ._
    ~ tien_cong(-20000)
    ~ cang_thang(3)
* [🛑 "Thôi, mai tỉnh rồi kể."]
    _Người đó gật đầu, rồi gục xuống bàn ngủ. Một lúc sau ai đó nói: "Bạn tốt ghê." Bạn thấy mình hơi tốt thiệt._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
* [🧂 Bật ghi âm trong túi.]
    _Bạn có một đoạn ghi âm 3 phút. Hai phút rưỡi là tiếng ốc len. Ba mươi giây còn lại thì… đáng giá._
    ~ cang_thang(8)
- ~ an(40)
-> END

=== chung_nn_quan_bida ===
# ngau_nhien # noi:quan_bida # gio:19:00-23:30 # vai_khong:cho # vai_khong:chua_te_deadline # vai_khong:dan_dau_tu
_Quán bida Cơ Bản, ngay dưới phòng gác của {chua_te_deadline}. {chua_te_deadline} và {dan_dau_tu} đang đánh, cược một ly trà đá._
dan_dau_tu: Cú này anh phân tích rồi, góc 37 độ, xác suất vô lỗ 89%.
_Bi trắng nhảy ra khỏi bàn._
chua_te_deadline: Chill. Để em. *(đánh không nhìn, vô ba bi)*
* [🎱 Xin vào đánh chung.]
    _Bạn đánh dở. Nhưng {chua_te_deadline} chỉ cho bạn một mẹo: "Đánh nhẹ thôi, tới đâu hay tới đó." Bạn thấy câu này áp dụng được cho cả cuộc đời._
    ~ cang_thang(-10)
    ~ qh("chua_te_deadline", 5)
* [💬 Hỏi {chua_te_deadline}: "Mai deadline mà ông còn đánh bida hả?"]
    chua_te_deadline: Deadline là mai. Mai mới làm. Hôm nay là hôm nay. Logic mà.
    ~ qh("chua_te_deadline", 2)
* [🍵 Đứng xem, trả tiền ly trà đá cho người thua.]
    _Người thua là {dan_dau_tu}. Lần thứ chín liên tiếp. Ổng nói "đáy rồi"._
    ~ tien_cong(-5000)
    ~ qh("dan_dau_tu", 3)
- -> END

// ======================= TIỆM NAIL =======================

=== chung_nn_nail_tin_don ===
# ngau_nhien # noi:tiem_nail # gio:17:30-21:00 # vai_khong:cho
_Tiệm Nail & Tóc Lung Linh. Chị chủ tiệm vừa sơn móng cho bạn vừa liếc quanh, hạ giọng._
npc_chi_nail: Ngồi đây chị kể nghe nè… Hôm qua có một cô ở công ty em ngồi đúng ghế này, gọi điện cho ai đó, nói "em đồng ý"… chị nghe lỏm vậy thôi chứ chị không có nhiều chuyện nha.
* [💬 "Cô nào vậy chị?"]
    npc_chi_nail: Chị không nói tên. Chỉ biết cô đó sơn màu xanh lá chuối. Ai sơn màu đó giờ này?
    ~ cang_thang(3)
* [🧂 "Chị biết gì nữa kể em nghe đi, em kể lại chuyện công ty cho chị."]
    _Bốn mươi phút. Móng tay bạn đã khô từ lâu. Hai người trao đổi tin tức như hai sàn chứng khoán._
    ~ tien_cong(-150000)
    ~ cang_thang(-10)
* [😶 "Chị ơi sơn nhanh giùm em."]
    npc_chi_nail: Sơn nhanh thì móng không đẹp. Kể chuyện thì móng mới đẹp. Đó là bí quyết.
    ~ tien_cong(-120000)
- -> END

=== chung_nn_nail_hai_ghe ===
# ngau_nhien # noi:tiem_nail # gio:12:00-13:30 # vai_khong:cho # vai_khong:thanh_ninh # vai_khong:sales
_{thanh_ninh} và {sales} ngồi hai ghế cạnh nhau, cùng làm móng, cùng nói về sếp._
thanh_ninh: Anh {giam_doc} khen bộ móng tuần trước của em là "có tầm nhìn".
sales: Thì sao? Anh {giam_doc} gọi chị đi nhậu với đối tác ba lần tuần này. Ba lần!
_Cả hai cùng quay sang nhìn bạn, chờ phân xử._
* [🙇 "Hai bà đều được sếp quý hết á."]
    _Câu trả lời ngoại giao nhất lịch sử. Cả hai đều không vui. Nhưng cũng không ai ghét bạn._
* [🐍 "Tuần trước sếp khen tui là 'nhân tố mới' đó."]
    _Không khí đông cứng. Hai bộ móng đang sơn dở ngưng lại. Bạn vừa tạo ra một liên minh mới. Liên minh chống bạn._
    ~ qh("thanh_ninh", -5)
    ~ qh("sales", -5)
* [💅 Hỏi chị chủ tiệm màu nào đang hot.]
    npc_chi_nail: Hồng. Tháng này cái gì cũng hồng. Cả quận sơn hồng hết rồi.
    _Siêu Nhân Hồng đã thay đổi ngành nail. Không ai ngờ._
- -> END

// ======================= CỬA HÀNG TIỆN LỢI, SIÊU THỊ, ATM =======================

=== chung_nn_tien_loi_2h ===
# ngau_nhien # noi:cua_hang_tien_loi # gio:00:00-03:30 # vai_khong:cho # vai_khong:editor
~ temp g = chung_goi("editor")
_Hai giờ sáng. Cửa hàng tiện lợi. Bạn và {editor} cùng với tay lấy lon nước tăng lực Trâu Cày cuối cùng._
editor: *(tỉnh như sáo)* Ủa {g}. Giờ này còn thức hả? Thức đêm là nghề của tui mà.
npc_khoa: Có cần hâm nóng hông anh chị? …À lon nước, không hâm được.
* [🤝 Nhường lon nước cho {editor}.]
    editor: Cảm ơn. Video tối nay có con cú, tui đặt tên nó theo tên {g}. Đừng nói ai nha.
    ~ qh("editor", 10)
* [💬 Ngồi ghế nhựa trước cửa hàng, nói chuyện với {editor}.]
    _{editor} nói chuyện ban đêm hay hơn ban ngày gấp mười. Kể về con cú, về cái kênh nhỏ, về một người mà {editor} không chịu nói tên._
    ~ qh("editor", 8)
    ~ nghi(-10)
* [🥤 Lấy luôn, chạy ra quầy.]
    ~ tien_cong(-15000)
    ~ nghi(30)
    editor: …Thôi được. Tui uống cà phê lon.
- -> END

=== chung_nn_tien_loi_xuc_xich ===
# ngau_nhien # noi:cua_hang_tien_loi # gio:06:00-23:00 # vai_khong:cho
_Quầy xúc xích nướng xoay vòng, bóng loáng dưới đèn vàng. Bảng giá: 15.000đ._
_Bạn chợt nhớ ánh mắt của {cho} mỗi lần có ai đi ngang với túi đồ ăn._
* [🌭 Mua một cây cho {cho}.]
    ~ tien_cong(-15000)
    ~ nhan(xuc_xich)
    _Cây xúc xích nằm trong túi bạn, gói giấy bạc. Nó sẽ mở ra cánh cửa tình bạn với một con chó. Hoặc ít nhất là cánh cửa chòi bảo vệ._
* [🌭 Mua hai cây, một cho mình.]
    ~ tien_cong(-30000)
    ~ an(10)
    ~ nhan(xuc_xich)
* [🍜 Mua mì ly thôi.]
    ~ tien_cong(-15000)
    ~ an(25)
- -> END

=== chung_nn_sieu_thi_gio_vang ===
# ngau_nhien # noi:sieu_thi # gio:19:30-21:00 # vai_khong:cho
_"Giờ vàng giảm giá 50%!" Loa siêu thị vang lên. Cả siêu thị lao về quầy thịt. Còn đúng một hộp thịt ba chỉ. Bàn tay bạn và một bàn tay khác chạm vào nó cùng lúc._
_Bàn tay kia cầm máy tính cầm tay. Là {ke_toan}._
{ vai == "ke_toan":
    _…Khoan. Bàn tay kia đeo vòng tay phong thủy đá hồng. Là {dan_dau_tu}._
}
* [😇 Nhường.]
    _Người kia cầm hộp thịt, gật đầu cảm ơn, rồi đi. Ra tới quầy tính tiền, họ quay lại đưa bạn một nửa._
    ~ an(20)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
* [💪 Giật.]
    _Bạn thắng. Hộp thịt trong tay bạn. Danh dự ở lại quầy thịt._
    ~ tien_cong(-35000)
    ~ an(40)
    ~ cang_thang(3)
* [🤝 "Chia đôi đi, về nấu chung."]
    _Hai người nấu một nồi thịt kho trứng. Không ai nói chuyện công việc. Lần đầu tiên tháng này._
    ~ tien_cong(-20000)
    ~ an(50)
    ~ cang_thang(-10)
- -> END

=== chung_nn_atm_hang_dai ===
# ngau_nhien # noi:sieu_thi # gio:12:00-20:00 # ngay_tu:12 # ngay_den:13 # vai_khong:cho
_Lương đã về. Cây ATM trước siêu thị có một hàng người dài 40 mét. Ai cũng cầm điện thoại, nhìn số dư, cười một mình._
_Người đứng đầu hàng rút tiền rất lâu. Rất, rất lâu. Rồi in sao kê. Rồi rút tiếp._
* [⏳ Xếp hàng.]
    _Bốn mươi phút sau, bạn rút được tiền. Trong lúc chờ, bạn biết lương của ba người đứng trước. Bạn không muốn biết, nhưng họ nói to._
    ~ nghi(-10)
* [📱 Chuyển khoản hết, không cần tiền mặt.]
    _Bạn quay về. Cô Bảy bánh mì không nhận chuyển khoản. Bạn quay lại xếp hàng._
    ~ cang_thang(5)
* [🧂 Hỏi người đầu hàng: "Anh rút cả lương cả năm hả?"]
    _Người đầu hàng quay lại. Là {thuc_tap_sinh}. Trên tay là một tấm thẻ ngân hàng màu bạc lấp lánh, loại bạn chỉ thấy trên quảng cáo._
    thuc_tap_sinh: Dạ… dạ không, em… em in sao kê thôi ạ! *(cất thẻ vào túi nhanh như chớp)*
    ~ phat_hien(duy_tung_lam_ngan_hang)
- -> END

=== chung_nn_luong_tre_muon_tien ===
# ngau_nhien # noi:van_phong # gio:12:00-17:00 # ngay_tu:10 # ngay_den:12 # vai_khong:cho # vai_khong:thuc_tap_sinh
~ temp g = chung_goi("thuc_tap_sinh")
_Lương chưa về. Cả văn phòng ăn mì gói. {thuc_tap_sinh} đi lại chỗ bạn, vò vò cái dây đeo thẻ hồng._
thuc_tap_sinh: Dạ {g} ơi… {g} cho em mượn 50 nghìn ăn trưa được không ạ? Lương về em trả liền ạ.
* [💸 Đưa 50 nghìn.]
    ~ tien_cong(-50000)
    ~ qh("thuc_tap_sinh", 12)
    thuc_tap_sinh: Dạ em cảm ơn ạ! Em ghi sổ ạ!
    _{thuc_tap_sinh} ghi vào một cuốn sổ bìa da rất xịn, nét chữ rất đẹp, kẻ bảng rất chuẩn. Giống sổ của… ngân hàng._
* [🍜 Chia nửa gói mì của mình.]
    ~ an(-10)
    ~ qh("thuc_tap_sinh", 8)
    thuc_tap_sinh: Dạ… mì này ngon hơn mì em hay ăn ạ. Chắc tại ăn chung.
* [😅 "{chung_toi_hoa("thuc_tap_sinh")} cũng đang ăn mì nè."]
    thuc_tap_sinh: Dạ… dạ không sao ạ! Em đi hỏi chỗ khác ạ!
    _Lát sau, bạn thấy {thuc_tap_sinh} ngồi một mình ở pantry, bóc một gói bánh quy nhỏ, chia làm bốn bữa._
- -> END

// ======================= QUÁN CƠM TẤM =======================

=== chung_nn_com_tam_co_nam ===
# ngau_nhien # noi:quan_com_tam # gio:11:45-13:30 # vai_khong:cho
_Quán cơm tấm vỉa hè. Cô Năm múc cơm, tai thì nghe hết các bàn._
npc_co_nam: Thêm chả hông con? …Mà con ở công ty G hả? Hồi nãy bàn kia nói công ty con sắp…
_Cô Năm dừng lại, nhìn bạn từ đầu tới chân._
* [💬 "Sắp gì cô?"]
    npc_co_nam: Sắp nổi tiếng! Siêu nhân gì đó. Cô nghe vậy chứ cô hông biết. *(nháy mắt)* Thêm chả nha.
    ~ tien_cong(-55000)
    ~ an(65)
* [🍳 "Thêm trứng, thêm chả, thêm bì, cô ơi."]
    npc_co_nam: Ăn vậy mới làm nổi! Con ăn nhiều vậy chắc lương cao ha?
    ~ tien_cong(-65000)
    ~ an(80)
* [😶 Ăn nhanh, đi.]
    ~ tien_cong(-45000)
    ~ an(55)
- -> END

=== chung_nn_com_tam_quen_vi ===
# ngau_nhien # noi:quan_com_tam # gio:11:45-13:30 # vai_khong:cho
_Ăn xong. Thò tay vào túi. Không có ví. Thò tay vào túi kia. Có một tờ giấy ghi "nhớ mang ví"._
* [🙏 "Cô Năm ơi, cô ghi sổ giùm con."]
    npc_co_nam: Con nợ cô một dĩa. Cô nhớ mặt rồi. Cả quận này ai ăn thiếu cô cũng nhớ.
    _Cô Năm không ghi gì cả. Cô thật sự nhớ._
    ~ cang_thang(3)
* [📱 Nhắn đồng nghiệp ở bàn bên.]
    _Đồng nghiệp trả giùm, rồi đăng lên group "Hội ăn trưa": "Hôm nay có người quên ví, tên bắt đầu bằng…". Cả group đoán trúng trong 4 giây._
    ~ cang_thang(5)
* [🍽️ Xin rửa chén trừ nợ.]
    npc_co_nam: Trời đất, ngồi xuống! Mai đem tiền ra là được. Con nít bây giờ…
    _Cô Năm cho bạn thêm ly trà đá miễn phí. Vì cảm động._
    ~ uong(20)
- -> END

// ======================= HỌP HÀNH & SẾP =======================

=== chung_nn_hop_5_phut ===
# ngau_nhien # noi:phong_hop_tang_2 # gio:16:30-17:30 # vai_khong:cho # vai_khong:truong_phong
~ temp g = chung_goi("truong_phong")
_17:20. Bạn đang thu dọn đồ. {truong_phong} xuất hiện ở cửa, laptop kẹp nách, bút lông trên tay._
truong_phong: {g} ơi, vào phòng "Sáng Tạo" họp nhanh 5 phút nhé. Chỉ 5 phút thôi.
* [😮‍💨 Đi họp.]
    _Cuộc họp kết thúc lúc 19:12. Kết luận: "Mình sẽ họp tiếp vào sáng mai để chốt." Không ai nhớ đã họp về cái gì._
    ~ nghi(-15)
    ~ cang_thang(10)
    ~ qh("truong_phong", 5)
* [⏱️ Đặt báo thức 5 phút, đặt điện thoại giữa bàn.]
    _Đúng 5 phút, chuông reo. Cả phòng nhìn chiếc điện thoại, rồi nhìn {truong_phong}. {truong_phong} nhìn đồng hồ, nhìn slide thứ 3 trên 41._
    truong_phong: …Ok. Mình… take note lại, họp tiếp sau nhé.
    ~ qh("truong_phong", -3)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
* [🏃 "Em… em đang đau bụng!"]
    truong_phong: Không sao, cậu dự online từ toilet cũng được.
    ~ cang_thang(8)
- -> END

=== chung_nn_sep_giao_viec_1725 ===
# ngau_nhien # noi:van_phong # gio:17:15-17:30 # vai_khong:cho # vai_khong:giam_doc
~ temp g = chung_goi("giam_doc")
_17:25. Còn 5 phút nữa tan làm. Cửa phòng giám đốc mở. Sếp {giam_doc} đi thẳng tới bàn bạn, tay cầm một tập hồ sơ màu hồng._
giam_doc: {g} ơi, cái này gấp lắm nhé. Sáng mai anh cần. Anh không ép, tùy em. # hen_gio:5
* [🙇 "{chung_toi_hoa("giam_doc")} làm liền sếp!"]
    _Bạn làm tới 21:00. Sáng hôm sau, sếp mở tập hồ sơ, gật đầu, rồi bỏ vào ngăn kéo. Tập hồ sơ nằm đó tới hết tháng._
    ~ nghi(-20)
    ~ qh("giam_doc", 8)
* [🤔 "Sếp ơi, mai 10 giờ được không ạ?"]
    giam_doc: 10 giờ thì muộn quá. 9 giờ 59 nhé. Anh linh hoạt mà.
    ~ cang_thang(5)
    ~ qh("giam_doc", 2)
* [😶 Gật đầu, tan làm, mai làm.]
    _Bạn làm từ 7:00 sáng mai. Xong lúc 8:55. Sếp tới lúc 9:30. Chẳng ai biết gì. Đây là bí quyết của {chua_te_deadline}._
    ~ cang_thang(3)
* [⏱️ (Không chọn kịp)]
    giam_doc: Không trả lời là đồng ý nhé! Cảm ơn em!
    ~ nghi(-15)
    ~ cang_thang(8)
- -> END

=== chung_nn_nhi_vo_tay ===
# ngau_nhien # noi:van_phong # gio:09:30-17:00 # vai_khong:cho # vai_khong:thanh_ninh # vai_khong:giam_doc
_Sếp {giam_doc} hắt hơi một cái trước cửa phòng. {thanh_ninh} lập tức vỗ tay._
thanh_ninh: Anh hắt hơi có tâm quá anh ơi! Mọi người, vỗ tay cho sếp!
_{thanh_ninh} quay sang nhìn bạn, ánh mắt ra lệnh._
* [👏 Vỗ tay.]
    _Bạn vỗ tay cho một cái hắt hơi. Bạn đã chính thức trưởng thành trong môi trường công sở._
    ~ qh("thanh_ninh", 3)
    ~ qh("giam_doc", 3)
    ~ cang_thang(3)
* [🤧 Đưa sếp tờ khăn giấy.]
    giam_doc: Ừ, cảm ơn em. Thế mới là quan tâm thật.
    _{thanh_ninh} nhìn tờ khăn giấy như nhìn đối thủ cạnh tranh._
    ~ qh("giam_doc", 5)
    ~ qh("thanh_ninh", -5)
* [😐 Không làm gì.]
    thanh_ninh: *(thì thầm)* Không vỗ tay là không có tinh thần đó nha.
    ~ qh("thanh_ninh", -3)
- -> END

=== chung_nn_mon_do_hong ===
# ngau_nhien # noi:cong_cong_ty # gio:08:00-09:45 # vai_khong:cho # vai_khong:giam_doc
_Nội quy tháng 10: mỗi ngày phải có ít nhất một món đồ màu hồng. Hôm nay bạn quên. Sếp {giam_doc} đang đứng ở sảnh, cà vạt hồng, kiểm tra từng người._
* {co(phu_kien_hong)} [🎀 Đeo phụ kiện hồng trong túi vào.]
    giam_doc: Tốt! Đúng tinh thần!
    ~ qh("giam_doc", 3)
* [🖍️ Mượn bút dạ quang hồng của {chua_te_deadline}, tô lên móng tay.]
    giam_doc: Ừ… hồng thì có hồng. Sáng tạo đấy. Anh ghi nhận.
    ~ cang_thang(3)
* [🧣 Xin {idol_het_thoi} mượn tạm khăn quàng hồng.]
    idol_het_thoi: Khăn này đi show đó nha. Đi show đám cưới. Nhưng mà show.
    _Bạn quàng khăn, trông như sắp lên sân khấu. Sếp gật đầu hài lòng._
    ~ qh("idol_het_thoi", 3)
* [🏃 Đi cửa sau.]
    _Bạn lẻn vào bằng cửa sau. Ở đó có {dan_dau_tu} đang lẻn vào, đeo đúng một cái vòng tay đá hồng. Hai người gật đầu với nhau, không nói gì._
- -> END

=== chung_nn_ao_cam_thu_hai ===
# ngau_nhien # noi:cong_cong_ty # gio:07:45-08:30 # vai_khong:cho # vai_khong:sieu_nhan_hong
_Thứ 2. Cả công ty mặc áo thun cam có chữ G bảy màu. Trừ bạn. Bạn mặc áo đen._
_Bạn nổi bật giữa một biển cam như một dấu chấm hết._
* [👕 Hỏi kho có áo dư không.]
    _{chi_dai} lôi ra từ kho sự kiện một cái áo cam size XXXL, in chữ "G-Entertainment 2015 – Công Viên Tour"._
    chi_dai: Mặc đi. Đồ cổ đó, quý lắm.
    ~ qh("chi_dai", 5)
* [🦸 Nói: "Em đang đóng vai Siêu Nhân Đen, phản diện của chiến dịch."]
    _Câu đùa lan khắp công ty. Tới trưa, {hong_hot} đã làm xong một poster "Siêu Nhân Đen: Kẻ Không Mặc Áo Cam"._
    ~ follow(2000)
    ~ cang_thang(-3)
* [😶 Mặc áo khoác vào, kéo khóa tới cằm.]
    _Trời 34 độ. Bạn mặc áo khoác cả ngày. Không ai phát hiện. Bạn mất 2 lít mồ hôi._
    ~ uong(-25)
- -> END

=== chung_nn_tra_sua_thu_6 ===
# ngau_nhien # noi:van_phong # gio:15:00-16:00 # vai_khong:cho
_Thứ 6, 15:00. Trà sữa từ "quỹ phạt đi trễ" về tới. Hai mươi ba ly, dán tên từng người. Có một ly không dán tên._
_Ly của bạn: trân châu đen, 50% đường. Người order đã nhớ đúng. Cảm động._
* [🧋 Uống.]
    ~ uong(30)
    ~ cang_thang(-10)
* [🔍 Điều tra ly không tên.]
    _Ly không tên là trà sữa chuối, topping bánh chuối chiên. Không ai uống trà sữa chuối. Trừ một người mặc đồ hồng. Ai đó đã nhớ tới cả Siêu Nhân Hồng._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
* [🐕 Đổ phần trân châu cuối cho {cho}.]
    { vai == "bac_bao_ve":
        _Bác nhìn {cho} ăn trân châu, lắc đầu: "Chó gì mà ăn trân châu." Rồi cười._
    - else:
        bac_bao_ve: Ơ, cháu đừng cho nó ăn trân châu, nó nghiện đấy!
    }
    ~ qh("cho", 5)
- -> END

// ======================= ĐỒNG NGHIỆP =======================

=== chung_nn_son_xin_nghi ===
# ngau_nhien # noi:van_phong # gio:07:30-09:00 # vai_khong:cho # vai_khong:thanh_xin_nghi
~ temp g = chung_goi("thanh_xin_nghi")
_Điện thoại bạn rung. {thanh_xin_nghi} gọi. Giọng yếu như bóng đèn sắp cháy._
thanh_xin_nghi: Alo {g}… *(khụ khụ)* … {g} báo giùm anh {hr} là hôm nay {chung_xung("thanh_xin_nghi")} xin nghỉ… bà ngoại {chung_xung("thanh_xin_nghi")}…
_Phía sau có tiếng nhạc dạo piano và tiếng ai đó hô "Thí sinh số 14 chuẩn bị!"._
* [🤝 "Ừ, để báo cho."]
    thanh_xin_nghi: Cảm ơn {g}. {chung_xung_hoa("thanh_xin_nghi")} sẽ nhớ ơn này. Bà ngoại cũng sẽ nhớ.
    ~ qh("thanh_xin_nghi", 8)
* [💬 "Thí sinh số 14 là ai vậy?"]
    thanh_xin_nghi: *(im ba giây)* …Tivi. Bà ngoại {chung_xung("thanh_xin_nghi")} coi tivi. Bà bệnh nên coi tivi to. Thôi, {chung_xung("thanh_xin_nghi")} cúp nha.
    ~ phat_hien(son_thi_hat)
* [🐍 Chuyển máy qua cho {hr}.]
    hr: *(cầm máy, mỉm cười)* Alo bạn {thanh_xin_nghi}. Lần thứ mấy rồi bạn nhỉ? Mình cùng nhìn lại hành trình nha.
    _Đầu dây bên kia im lặng. Rồi tiếng piano cũng im lặng._
    ~ qh("thanh_xin_nghi", -15)
    ~ qh("hr", 5)
- -> END

=== chung_nn_vu_nho_xiu ===
# ngau_nhien # noi:van_phong # gio:14:00-17:30 # vai_khong:cho # vai_khong:chua_te_deadline
~ temp g = chung_goi("chua_te_deadline")
_{chua_te_deadline} kéo ghế lại gần bạn, ôm gối hồng, mặt cực kỳ chill._
chua_te_deadline: {g} ơi, nhờ xíu. Xíu thôi. Cái bảng tính này điền giùm tui mấy ô. Mấy ô thôi.
_"Mấy ô" là 400 ô._
* [🤝 Làm giùm.]
    _Ba tiếng sau, bạn điền xong. {chua_te_deadline} đã ngủ trên gối hồng. Lúc tỉnh dậy, ổng nói "đỉnh nóc" rồi nộp luôn, ghi tên ổng._
    ~ nghi(-20)
    ~ qh("chua_te_deadline", 10)
* [🙅 "Ông tự làm đi, deadline của ông mà."]
    chua_te_deadline: Ok mom. *(quay về bàn, lướt Tóp-tóp tiếp)*
    ~ qh("chua_te_deadline", -3)
* [🤝 "Làm chung đi, tui một nửa, ông một nửa."]
    chua_te_deadline: …Nửa của tui có được "nửa của nửa" không?
    _Hai người làm xong trong 40 phút. {chua_te_deadline} làm nhanh kinh khủng khi chịu làm. Điều này làm bạn tức điên._
    ~ nghi(-8)
    ~ qh("chua_te_deadline", 8)
- -> END

=== chung_nn_vu_qua_hong ===
# ngau_nhien # noi:van_phong # gio:09:00-12:00 # vai_khong:cho # vai_khong:chua_te_deadline # vai_khong:sieu_nhan_hong
~ temp g = chung_goi("chua_te_deadline")
_Trên bàn {chua_te_deadline} có thêm một món hồng mới: một hộp cơm hồng, nắp có dán sticker trái tim. Bên trong là cơm chiên trứng, xếp thành hình mặt cười._
chua_te_deadline: {g} nghĩ coi, cái này là PR đúng hông? Anh {quan_ly_idol} dặn ổng tặng quà cho đồng nghiệp để có content đúng hông?
* [😇 "Không có camera nào quay hết. PR gì mà không quay?"]
    chua_te_deadline: *(im lặng, nhìn hộp cơm)* …Ờ ha. *(ăn một muỗng)* …Ngon.
    ~ qh("chua_te_deadline", 5)
    ~ qh("sieu_nhan_hong", 5)
* [🐍 "PR chứ gì nữa. Nghệ sĩ mà."]
    chua_te_deadline: Đó, tui biết mà. Chill. *(vẫn ăn hết hộp cơm)*
* [🧂 "Ăn đi rồi trả lời tin nhắn ổng."]
    chua_te_deadline: Tin nhắn gì? *(lật hộp cơm, đáy hộp có dán tờ giấy nhỏ: "Ăn đúng giờ nha.")* …
    _{chua_te_deadline} gấp tờ giấy, bỏ vào túi áo hoodie. Không nói gì nữa._
- -> END

=== chung_nn_duy_cui_chao ===
# ngau_nhien # noi:van_phong # gio:07:30-09:00 # vai_khong:cho # vai_khong:thuc_tap_sinh
_{thuc_tap_sinh} bê một khay 8 ly cà phê, cúi chào bạn 90 độ. Cà phê nghiêng 45 độ._
thuc_tap_sinh: Dạ em chào {chung_goi_ai("thuc_tap_sinh", vai)} buổi sáng ạ!
* [🤝 Đỡ cái khay.]
    _Bạn cứu được 7 ly. Ly thứ 8 đổ lên giày bạn. {thuc_tap_sinh} cúi xin lỗi thêm 4 lần, mỗi lần 90 độ._
    ~ qh("thuc_tap_sinh", 8)
* [😅 "Ông đừng cúi nữa, ông lớn hơn nửa công ty mà."]
    thuc_tap_sinh: Dạ… em biết ạ. Nhưng em mới vô nên chưa biết ạ.
    _{thuc_tap_sinh} cúi chào lần nữa. Lần này 75 độ. Đó là tiến bộ._
    ~ qh("thuc_tap_sinh", 5)
* [🙇 Cúi chào lại 90 độ.]
    _Hai người cúi chào nhau giữa hành lang như hai võ sĩ trước trận đấu. {hong_hot} quay được. Clip có tên "Văn hóa doanh nghiệp đỉnh cao"._
    ~ follow(1500)
    ~ qh("thuc_tap_sinh", 5)
- -> END

=== chung_nn_duy_ca_phe_muoi ===
# ngau_nhien # noi:pantry # gio:08:00-10:00 # vai_khong:cho # vai_khong:thuc_tap_sinh
_{thuc_tap_sinh} đưa bạn ly cà phê sữa đá. Bạn uống một ngụm. Mặn. Mặn như nước biển Vũng Tàu._
thuc_tap_sinh: Dạ… ngon không ạ? Em làm theo công thức "cà phê muối" trên mạng ạ!
* [😇 "Ngon! Mới lạ!" *(cố nuốt)*]
    thuc_tap_sinh: Dạ thật ạ? Vậy em pha cho cả phòng luôn ạ!
    _Mười phút sau, cả phòng đồng loạt ho._
    ~ qh("thuc_tap_sinh", 5)
    ~ uong(-10)
* [💬 "Ông bỏ bao nhiêu muối?"]
    thuc_tap_sinh: Dạ… hai muỗng canh ạ. Công thức ghi "một nhúm". Em tưởng nhúm là… nhúm tay ạ.
    ~ qh("thuc_tap_sinh", 3)
* [🤝 Chỉ {thuc_tap_sinh} pha lại.]
    _Lần hai: cà phê muối đúng nghĩa, béo, mặn nhẹ, thơm. {thuc_tap_sinh} nhìn ly cà phê như nhìn tác phẩm đầu tay._
    ~ qh("thuc_tap_sinh", 10)
    ~ nghi(15)
- -> END

=== chung_nn_bao_restart ===
# ngau_nhien # noi:van_phong # gio:08:00-17:30 # vai_khong:cho # vai_khong:it
_Máy tính bạn hiện màn hình xanh. Chữ trắng. File chưa lưu. Bạn gọi {it}._
it: *(tới, nhìn màn hình, ăn mì ly)* Restart chưa?
* [😰 "Chưa, file chưa lưu!"]
    it: *(gõ ba phím, màn hình xanh biến mất, file hiện ra)* Tự lưu 5 phút một lần. Tui cài từ 2018. Không ai biết.
    ~ qh("it", 8)
    ~ cang_thang(-10)
* [🔁 "Restart rồi, ba lần."]
    it: Lỗi người dùng. *(rút dây mạng ra, cắm lại)* Xong.
    _Bạn không biết dây mạng liên quan gì tới màn hình xanh. Nhưng nó chạy._
    ~ qh("it", 3)
* [🍜 Đưa {it} ly mì mới.]
    it: *(nhận mì)* …Ổ cứng sắp hư. Mai thay. Đừng nói ai tui thay bằng cái mới.
    ~ qh("it", 10)
    ~ tien_cong(-15000)
- -> END

=== chung_nn_bao_wifi_cham ===
# ngau_nhien # noi:van_phong # gio:09:00-17:00 # ngay_den:28 # vai_khong:cho # vai_khong:it
_Wifi chậm như rùa đi bộ. Video 30 giây load 4 phút. Cả văn phòng than. {it} đứng giữa phòng, nhìn điện thoại, rồi nhìn quanh._
it: Có người đang xem phim 4K. Tốn 80% băng thông.
_Ánh mắt cả phòng đổ dồn về dãy bàn cuối._
* [🔍 "Ai vậy?"]
    it: Không nói. Nhưng tên wifi máy đó là "NGAN-LAPTOP"… à không. Tui nói nhầm. Không có gì.
    ~ phat_hien(admin_confession)
* [😇 "Thôi, để người ta xem, tui làm việc offline."]
    it: …Người tốt. Hiếm.
    ~ qh("it", 5)
    ~ nghi(-5)
* [🐍 "Ông chặn máy đó luôn đi."]
    it: Chặn rồi. Lúc ông hỏi.
    _Từ dãy bàn cuối có tiếng "Ủa alo?"._
    ~ qh("it", 3)
- -> END

=== chung_nn_thuong_hoa_don ===
# ngau_nhien # noi:van_phong # gio:08:00-17:00 # vai_khong:cho # vai_khong:ke_toan
~ temp g = chung_goi("ke_toan")
_Bạn xin thanh toán 15 nghìn tiền mua bút bi cho phòng. {ke_toan} kéo kính lão xuống mũi, nhìn bạn qua gọng._
ke_toan: Hóa đơn đâu {g}?
* [🧾 Đưa tờ bill viết tay của tiệm tạp hóa.]
    ke_toan: Không có mã số thuế. Không có chữ ký. Không có con dấu. *(thở dài)* …Thôi được, lần này thôi. Ký đây, đây và đây.
    _Ba chữ ký cho 15 nghìn đồng._
    ~ tien_cong(15000)
    ~ qh("ke_toan", 2)
* [😇 "Thôi, coi như {chung_toi("ke_toan")} tặng công ty."]
    ke_toan: *(ghi vào sổ)* "Ngày… tháng 10. Có người tặng công ty 15 nghìn." *(ngẩng lên)* Cảm ơn. Đây là lần đầu tiên trong năm.
    ~ qh("ke_toan", 8)
* [🐍 "Vậy chị cho em xin hóa đơn mấy hộp cơm cá kho của chị luôn."]
    ke_toan: *(im lặng rất lâu)* …Hộp cơm là chi phí cá nhân. Bút bi là chi phí công ty. Hai cái khác nhau.
    ~ qh("ke_toan", -5)
- -> END

=== chung_nn_huong_an_com ===
# ngau_nhien # noi:van_phong # gio:12:00-13:30 # vai_khong:cho # vai_khong:chi_dai
~ temp g = chung_goi("chi_dai")
~ temp x = chung_xung("chi_dai")
_Giờ trưa, bạn vẫn ngồi lì ở bàn, bụng kêu òng ọc. {chi_dai} đi ngang, khựng lại, quay đầu._
chi_dai: Ăn cơm chưa? Chưa ăn hả? Ngồi đây làm gì? Đi! {chung_xung_hoa("chi_dai")} dẫn đi.
* [😇 Đi theo {chi_dai}.]
    _{chi_dai} gọi cho bạn dĩa cơm tấm đầy đủ, gắp thêm miếng chả của mình. Không cho bạn trả tiền._
    chi_dai: Đi làm thì phải ăn. Đứa nào làm {g} bỏ bữa, chỉ mặt {x}.
    ~ an(60)
    ~ qh("chi_dai", 10)
    ~ cang_thang(-8)
* [😅 "{chung_toi_hoa("chi_dai")} đang bận deadline."]
    chi_dai: Deadline ăn được hả? *(đặt hộp xôi lên bàn bạn)* Ăn. Không ăn {x} đứng đây.
    ~ an(35)
    ~ qh("chi_dai", 5)
* {vai == "thanh_ninh"} [🙂 "Chị đi trước đi."]
    chi_dai: *(lạnh)* Ừ. *(đi, rồi khựng lại ở cửa, nói vọng vào)* …Có xôi trong tủ lạnh, của chị. Ăn đi.
    ~ qh("chi_dai", 2)
- -> END
