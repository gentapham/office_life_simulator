// ============================================================
// CHƯƠNG 5: "BÁNH KEM HỒNG" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== cho_2110_confession ===
# ngay:21 # gio:10:00 # noi:tang_1
_Thứ 4. Cả tầng 1 xì xào. Ai cũng cầm điện thoại, ai cũng đọc một bài gì đó, ai cũng liếc nhau._
_Ở phòng server, {hr} và {it} chụm đầu bên màn hình. {hr} hôm nay không cười. Đáng sợ hơn lúc cười._
hr: Bla bla… bla bla… bla bla bla? # phu_de:Bài Confession bóc chuyện thế chấp biệt thự. Admin là ai? Em tìm được máy đăng bài không?
it: Bla. Bla bla. # phu_de:Không biết. Đừng hỏi.
_{it} nói "không biết" nhưng mùi của {it} không nói vậy. Mùi của người đang giữ bí mật cho một người bạn._
_{hr} quay sang nhìn bạn. Rồi cười. Lại cười._
hr: TUẤT… bla bla… bla bla bla? # phu_de:{cho}, em ngửi giỏi lắm phải không? Thử ngửi giùm anh coi cái laptop nào hay đăng bài lúc nửa đêm?
* [👃 Đi thẳng tới bàn {hong_hot}, ngồi xuống.]
    _Laptop của {hong_hot} có mùi nửa đêm: mùi mì gói, mùi đèn LED, mùi ring light nóng. Bạn ngồi xuống. Thẳng lưng. Như ngồi trước tủ lạnh._
    hr: Bla… bla bla bla. # phu_de:Ồ. Thú vị.
    hong_hot: Bla bla! Bla bla bla bla! TUẤT! # phu_de:Ủa! Gì vậy! Con chó ngồi đó vì tui hay cho nó ăn thôi mà! {cho}!
    _{it} nhìn bạn, lắc đầu rất nhẹ. Bạn thấy mình vừa làm gì đó không nên._
    ~ phat_hien(admin_confession)
    ~ qh("hong_hot", -15)
    ~ qh("hr", 8)
    ~ qh("it", -5)
* [👃 Đi tới bàn {hr}, ngồi xuống trước laptop của chính người đó.]
    _Bạn ngồi xuống trước bàn của {hr}. Thẳng lưng. Nhìn {hr}._
    it: *(phì cười, lần đầu trong tuần)* Bla. # phu_de:Lỗi người dùng.
    hr: Bla bla… bla bla. # phu_de:Haha… thôi được rồi. Chó cũng biết thao túng tâm lý.
    ~ qh("it", 8)
    ~ qh("hong_hot", 3)
* [😴 Nằm ngủ dưới gầm bàn server. Ấm. Ù ù.]
    _Phòng server ấm như ổ. Tiếng máy ù ù như tiếng bác ngáy. Bạn ngủ. {it} lấy chân gãi lưng bạn suốt cuộc nói chuyện._
    ~ nghi(25)
    ~ qh("it", 4)
- { nguoi_theo_doi < 500000:
    _Chiều, có một tin đồn bay khắp công ty, nhanh hơn mùi thịt kho: "cắt giảm". Bạn không hiểu từ đó. Nhưng bạn thấy {thuc_tap_sinh} ngồi ở cầu thang, ôm gối._
    _Bạn nằm xuống cạnh người đó. Cầu thang đủ chỗ cho cả hai._
    ~ qh("thuc_tap_sinh", 5)
}
-> END

// ------------------------------------------------------------
=== cho_2210_chu_liem ===
# ngay:22 # gio:09:00 # noi:sanh_tang_tret # bat_buoc
_Thứ 5. Ba người mặc đồ tối màu bước qua cổng, tay xách cặp. Cả công ty bỗng gõ phím rất nhanh. Nhanh một cách đáng ngờ._
_Người đi đầu, tóc hoa râm, nhìn thấy bạn thì đứng sững. Mùi của ông ấy đổi ngay lập tức: mùi sợ chó. Mùi này bạn biết rất rõ, giống mùi của mọi shipper._
chu_liem: Bla… bla bla… bla bla bla? # phu_de:Con… con chó này có cắn không? Cho tôi xin… cột nó lại được không?
ke_toan: *(mắt thâm, giọng run)* Bla bla… TUẤT… bla bla. # phu_de:Dạ chú yên tâm, {cho} hiền lắm ạ. Mời chú lên tầng 2 ạ.
_Trong cặp của ông ấy có mùi bánh bao nhân thịt. Một cái. Còn ấm._
* [🐾 Ngồi ngoan, cách xa ông ấy một mét, không nhúc nhích.]
    _Bạn ngồi. Không vẫy, không ngửi, không nhìn cái cặp. Đó là bài kiểm tra ý chí khó nhất đời chó._
    _Ông ấy đi qua bạn, vai hạ xuống một chút. Lúc đi lên cầu thang, ông ấy còn ngoái lại, nói nhỏ: "Ừ… ngoan."_
    ~ qh("ke_toan", 8)
    ~ ch_cung(4)
    ke_toan: *(thì thầm khi đi ngang)* Bla bla… TUẤT… ĂN. # phu_de:Trưa chị cho thịt kho. Không cần hóa đơn.
    ~ ch_an(20)
* [👃 Đánh hơi cái cặp. Bánh bao!]
    _Bạn dí mũi vào cái cặp. Ông ấy nhảy lùi ba bước, lưng đập vào bảng nội quy._
    chu_liem: Bla bla! Bla bla bla bla! # phu_de:Ấy ấy! Cái gì đây! Thôi, kiểm tra luôn ở tầng trệt, tôi không lên đâu!
    _Buổi kiểm tra kéo dài thêm 2 tiếng vì phải bê hồ sơ xuống tầng trệt. {ke_toan} nhìn bạn như nhìn một hóa đơn không hợp lệ._
    _Nhưng cái bánh bao rơi ra. Bạn ăn. Ngon. Không có hóa đơn._
    ~ ch_an(15)
    ~ qh("ke_toan", -8)
    ~ cang_thang(5)
* {co(usb_khong_nhan) && not ch_tra_usb_cho_vu} [🔒 Chạy về kho, ngậm cái USB, đặt vào tay {chua_te_deadline}.]
    _Bạn nhìn thấy {chua_te_deadline} đứng sau {ke_toan}, mặt trắng bệch. Ông tóc hoa râm vừa hỏi gì đó về "nghiệm thu tháng 6"._
    _Bạn chạy đi, chạy về. Cái USB rơi vào tay người có mùi cà phê sữa đá._
    chua_te_deadline: Bla… bla bla! Bla bla bla! # phu_de:Dạ… dạ đây ạ! Bằng chứng nghiệm thu dự án tháng 6, file gốc đầy đủ ạ!
    _{ke_toan} thở ra một hơi dài như vừa được cứu khỏi đuối nước. Ông tóc hoa râm gật đầu, ghi chép._
    ~ mat(usb_khong_nhan)
    ~ ch_so_mon_kho = ch_so_mon_kho - 1
    ~ ch_tra_usb_cho_vu = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("chua_te_deadline", 40)
    ~ qh("ke_toan", 15)
    ~ ch_cung(10)
- -> END

// ------------------------------------------------------------
=== cho_2210_ho_so ===
# ngay:22 # gio:14:00 # noi:phong_ke_toan
_Phòng kế toán. Mười năm hồ sơ chất thành núi. {ke_toan} và {thuc_tap_sinh} xếp như chạy giặc. {thuc_tap_sinh} xếp nhanh tới mức đáng ngờ, như người đã làm việc này cả đời._
ke_toan: Bla bla… bla bla bla… bla. # phu_de:2016 qua đây, 2017 qua kia. Em… sao em biết cái này là hồ sơ tín dụng vậy?
thuc_tap_sinh: Bla… bla bla… bla! # phu_de:Dạ… em… đoán ạ!
_Một xấp giấy rơi xuống sàn, ngay trước mũi bạn. Mùi giấy rất cũ, mùi két sắt, mùi một ngân hàng tên gì đó có chữ "Đen Đủi"._
* [🎁 Tha xấp giấy chạy đi. Trò đuổi bắt!]
    _Bạn ngoạm, chạy. {thuc_tap_sinh} đuổi theo. Vòng quanh tầng 2. Vòng quanh phòng họp. Xấp giấy bay tứ tung như pháo giấy._
    ke_toan: TUẤT! Bla bla bla bla! # phu_de:{cho}! Đó là hồ sơ năm 2024!
    _Họ nhặt lại được gần hết. Gần hết. Một tờ có con dấu đỏ của ngân hàng Tín Dụng Đen Đủi đã nằm yên trong kho dưới gầm cầu thang._
    ~ ch_tha_ve_kho()
    ~ ch_cung(-6)
    ~ qh("ke_toan", -6)
    ~ cang_thang(3)
* [🐾 Ngậm xấp giấy, đặt lại lên bàn {ke_toan}.]
    _Bạn ngậm nhẹ, đặt lên bàn, ngay ngắn. {ke_toan} nhìn bạn rất lâu, rồi lấy tay lau mắt._
    ke_toan: Bla bla… TUẤT… bla. # phu_de:Cả công ty này chỉ có {cho} là biết trả đồ đúng chỗ.
    ~ qh("ke_toan", 6)
    ~ ch_cung(4)
* [😴 Nằm ngủ trên chồng hồ sơ năm 2018.]
    _Chồng hồ sơ năm 2018 vừa êm vừa ấm. Bạn ngủ. Không ai dám đánh thức bạn, nên chồng 2018 không cần sắp xếp nữa._
    ~ nghi(20)
- -> END

// ------------------------------------------------------------
=== cho_2310_sang_sinh_nhat ===
# ngay:23 # gio:09:00 # noi:sanh_tang_tret # bat_buoc
_Thứ 6. Sảnh trang trí hồng từ trần tới sàn. Bóng bay hồng. Thảm hồng. Ruy băng hồng. Mùi nước hoa hồng phun khắp nơi để "đồng bộ thương hiệu"._
_Mũi bạn muốn đình công._
hr: Bla bla… TUẤT… bla bla bla… KHÔNG… bla. # phu_de:Anh phụ trách an ninh sự kiện. Nhiệm vụ số một: giữ {cho} cách cái bánh 5 mét. Không ngoại lệ.
thuc_tap_sinh: *(ôm hộp bánh, mặt căng)* Bla bla… TUẤT… bla bla bla. # phu_de:Dạ… em được giao giữ bánh. {cho} ơi, em xin em, hôm nay đừng nha.
_Ở góc sảnh, có một người mặc vest bóng, đeo kính râm, dán ria mép giả. Người đó đang tập nói "Hello, I am Kevin"._
{ RANDOM(1, 3):
- 1:
    _Bạn ngửi. Ria mép giả. Keo dán. Và bên dưới: mùi trà mạn và dầu gió._
    _Là BÁC. Bác mặc vest. Bác đeo ria. Bạn chưa từng thấy bác ngượng như vậy._
    cho: Gâu! Gâu! *(vẫy đuôi điên cuồng)*
    bac_bao_ve: *(thì thầm)* Bla… TUẤT… KHÔNG… bla bla. # phu_de:Suỵt! {cho}, không! Hôm nay bác là… "Mr. Kevin"!
    ~ qh("bac_bao_ve", 3)
- 2:
    _Bạn ngửi. Ria mép giả. Keo dán. Và bên dưới: mùi mì gói và nước xả vải rẻ tiền. {thuc_tap_sinh}! Người này vừa dúi hộp bánh cho {hr}, rồi chạy đi dán ria, đóng vai chủ tịch tập đoàn._
    _Thôi, loài người tự hiểu nhau. Bạn chỉ chắc một điều: Mr. Kevin không phải người lạ._
- else:
    _Bạn ngửi. Ria mép giả. Keo dán. Và bên dưới: mùi chart cả đêm và mùi bánh mì ăn lén. {dan_dau_tu}._
    _Người này đang đóng vai chủ tịch tập đoàn. Người nợ nửa công ty. Bạn không hiểu loài người, nhưng bạn thấy buồn cười._
}
* [🐾 Đi theo người đang giữ hộp bánh như cái bóng.]
    _Bạn đi theo. Người giữ bánh đi đâu, bạn đi đó. Người đó đổ mồ hôi. Bạn không làm gì cả. Bạn chỉ nhìn._
    _Áp lực của một cái nhìn chó._
    ~ cang_thang(-2)
* [😴 Ngủ trước. Tối mới là trận chính.]
    ~ nghi(30)
    _Bạn ngủ dưới gầm cầu thang, cạnh chiếc găng tay hồng. Trong mơ, có một cái bánh to bằng tòa nhà._
* [👃 Đi đánh hơi quanh sảnh.]
    ~ ch_mui(3)
    _Sau rèm sân khấu có mùi dây điện mới của {it}. Ở phòng chờ có mùi bánh chuối chiên và mùi hồi hộp. Ở bàn điều khiển có mùi cà phê sữa đá và một người đang lướt điện thoại._
- -> END

// ------------------------------------------------------------
=== cho_2310_banh_kem ===
# ngay:23 # gio:19:30 # noi:sanh_tang_tret # bat_buoc
_Livestream đang chạy. Mười nghìn người đang xem. Đèn hồng. Nhạc hồng. Rồi cánh cửa mở ra, {thuc_tap_sinh} đẩy vào một chiếc xe nhỏ._
_Trên xe: một cái bánh kem 3 tầng màu hồng, hình cái mũ siêu nhân. Mùi kem bơ. Mùi nước hoa hồng. Mùi đường. Mùi kẻ thù được làm thành đồ ăn._
~ follow(60000)
giam_doc: Bla bla… ĂN… bla bla… bla… HỒNG! # phu_de:Cả nhà mình ra cắt bánh nào! Siêu Nhân Hồng của chúng ta tròn 31 tuổi!
sieu_nhan_hong: Bla bla bla… bla bla… bla bla bla bla. # phu_de:Cảm ơn mọi người! Mà khoan… trước khi cắt bánh, em có chuyện muốn nói với một người. {chua_te_deadline} ơi, em thích anh. Thật đó. Không phải PR.
_Cả sảnh nín thở. Mười nghìn bình luận chạy. Ở bàn điều khiển, có tiếng một cái điện thoại rơi xuống sàn._
_Không ai nhìn bạn. Không ai cả. Bạn đang đứng ngay cạnh chân bàn._ # hen_gio:5
* [🏃 Lao lên.]
    _Bạn lao lên. Bánh đổ. Kem hồng bay khắp nơi, lên tóc {giam_doc}, lên vest Mr. Kevin, lên cả cái {ch_mu()} của bộ đồ hồng._
    _Mười nghìn người xem. Một trăm nghìn người chia sẻ. Bạn ngồi giữa đống kem, liếm mép, thỏa mãn như vừa trả được thù cả tháng._
    ~ ch_pha_banh = true
    ~ follow(50000)
    ~ scandal()
    ~ ch_an(100)
    ~ ch_hong_doi(-10)
    ~ ch_cung(-3)
    quan_ly_idol: Bla bla bla! Bla bla! # phu_de:Đó là kịch bản! Mọi người ơi đó là kịch bản! Đừng ai đăng gì hết!
* [🐾 Ngồi xuống, nhìn cái bánh, chảy nước miếng.]
    _Bạn ngồi xuống. Nước miếng nhỏ giọt. Nhưng bạn ngồi. Không ai tin nổi. {thuc_tap_sinh} suýt khóc vì cảm động._
    _Bộ đồ hồng nhìn bạn. Rồi tự cắt một miếng đầu tiên, gạt hết kem ra, chỉ còn bánh bông lan, đặt xuống trước mặt bạn._
    sieu_nhan_hong: Bla bla… TUẤT… bla… ĂN… bla. # phu_de:Miếng đầu tiên cho {cho}. Không có kem, kem không tốt cho em. Ăn đi.
    ~ ch_an_cua_nguyen()
    ~ ch_hong_doi(-15)
    ~ ch_cung(8)
    ~ follow(20000)
* [😤 Sủa cái bánh.]
    cho: GÂU! GÂU!
    _Mọi người cười. Rồi {idol_het_thoi}, đứng cạnh bàn, "vấp chân". Cái bánh nghiêng. Đổ. Mọi ánh mắt nhìn bạn._
    idol_het_thoi: Bla bla… TUẤT… bla bla! # phu_de:Trời ơi con chó! Nó sủa làm tui giật mình!
    _Oan. Oan như Thị Kính. Bạn chưa từng biết Thị Kính là ai, nhưng bạn hiểu cảm giác này._
    ~ ch_cung(-5)
    ~ follow(30000)
* {ch_ghet_hong <= 30 && co(gang_tay_hong)} [🔒 Ngậm chiếc găng tay hồng từ kho ra, đặt cạnh bánh như một món quà.]
    _Bạn chạy về kho. Chạy ra. Chiếc găng tay hồng mà bạn cướp ngày 4/10, giờ được đặt cẩn thận cạnh chân bàn bánh kem._
    _Bộ đồ hồng nhìn chiếc găng. Nhìn bạn. Rồi đưa tay lên. Tháo cái {ch_mu()} ra. Ngay trên livestream._
    _Một khuôn mặt bình thường. Hơi gầy. Mắt đỏ. Người đó ngồi bệt xuống sàn, ôm lấy bạn._
    sieu_nhan_hong: Bla bla… TUẤT… bla bla… NGOAN… # phu_de:Trả anh hả… {cho}… cảm ơn em… ngoan quá…
    ~ mat(gang_tay_hong)
    ~ ch_so_mon_kho = ch_so_mon_kho - 1
    ~ ch_tang_gang_tay = true
    ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 30
    ~ follow(80000)
    ~ ch_hong_doi(-20)
    ~ qh("sieu_nhan_hong", 25)
* [⏱️ (Không chọn kịp)]
    _Bạn còn đang phân vân thì cơ thể đã tự quyết. Chân bạn bật lên trước não. Bánh đổ._
    ~ ch_pha_banh = true
    ~ follow(50000)
    ~ scandal()
    ~ ch_an(100)
    ~ ch_hong_doi(-10)
- _Giữa hỗn loạn, bộ đồ hồng cầm micro, hỏi một câu không ai hiểu: "Ủa mà sao có đồng coin mang tên em vậy mọi người?"_
_Ở bàn điều khiển, {chua_te_deadline} vẫn chưa nhặt cái điện thoại lên._
-> END

// ------------------------------------------------------------
=== cho_2310_sau_choi ===
# ngay:23 # gio:21:30 # noi:choi_bao_ve
_Khuya. Livestream tắt. Đèn hồng tắt. Sau chòi bảo vệ, chỗ không có camera, có một người ngồi trên bậc thềm._
_Người đó tháo cái {ch_mu()} đặt bên cạnh. Mặt dính kem. Hoặc nước mắt. Mũi bạn nói là cả hai._
_Bác đi ra, không nói gì, đưa cho người đó một cái khăn. Rồi quay vào chòi. Bác luôn biết lúc nào nên đi vào._
sieu_nhan_hong: *(rất nhỏ)* Bla bla… bla… bla bla. # phu_de:Ảnh không trả lời. Chắc ảnh nghĩ em làm PR. Ai cũng nghĩ vậy.
_Cái {ch_mu()} nằm đó. Không ai canh. Ngay cạnh chân bạn._
* [🎁 Ngoạm cái mũ chạy đi.]
    _Bạn ngoạm. Nhưng rồi bạn đứng lại. Người đó không đuổi theo. Người đó chỉ ngồi nhìn bạn, không có sức để đuổi._
    _Cái mũ trong miệng bạn bỗng nặng lạ thường. Đuổi theo mới vui. Không ai đuổi thì chẳng vui gì cả._
    _Bạn đặt nó lại chỗ cũ._
    ~ ch_hong_doi(-5)
* [🐾 Ngồi xuống cạnh, dựa vào chân người đó.]
    _Bạn ngồi xuống. Dựa vào. Người đó giật mình, rồi đặt tay lên lưng bạn. Không gãi, không vuốt. Chỉ đặt tay lên đó, như để biết có ai đang ở cạnh._
    ~ ch_hong_doi(-10)
    ~ qh("sieu_nhan_hong", 10)
* [😤 Gầm gừ nhỏ. Vẫn là kẻ thù.]
    cho: Grừ…
    sieu_nhan_hong: *(cười yếu ớt)* Bla bla… bla. # phu_de:Ừ. Ít ra em vẫn ghét anh thật lòng.
    _Người đó đội mũ lại, đứng dậy, đi về phía chiếc xe hồng. Bạn nhìn theo. Gầm gừ cho đến khi đèn xe khuất. Rồi thôi._
- { ch_nhan_qua_hong():
    _Trước khi về, người đó rút trong túi ra một cây xúc xích, đặt xuống đất, không nói gì._
    ~ ch_an_cua_nguyen()
}
-> END

// ------------------------------------------------------------
=== cho_2410_hoa_giai ===
# ngay:24 # gio:09:30 # noi:phong_hop_tang_2 # bat_buoc
_Thứ 7. "Hội nghị hòa giải" của {chi_dai}. Bàn ghế xếp từng cặp: những người ghét nhau ngồi đối diện nhau. Không khí đặc như hồ dán._
chi_dai: Bla bla bla. Bla bla bla bla. # phu_de:Hôm nay Ngày Liên Hợp Quốc. Không hòa giải xong thì không ai về.
_Hai người đối diện nhau, không ai nói. Nhưng tay thì cùng thò xuống gầm bàn. Vuốt đầu bạn. Cả hai cùng lúc._
_Bạn đi từ bàn này sang bàn kia. Ở đâu cũng có tay vuốt đầu. Bạn là sứ giả hòa bình duy nhất có lông._
* [🐾 Nằm dưới bàn {truong_phong} và {con_ong_chau_cha}.]
    _Hai người cùng cúi xuống gãi bạn, rồi đụng đầu nhau dưới gầm bàn. "Á!" "Xin lỗi!" "Không sao, cậu à… ờ, ông à…"_
    _Hai người ngồi dậy, xoa đầu, rồi phì cười. Cuộc nói chuyện đầu tiên của họ không phải về cái ghế._
    ~ qh("truong_phong", 4)
    ~ qh("con_ong_chau_cha", 4)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [🐾 Nằm dưới bàn {chi_dai} và {thanh_ninh}.]
    _Đây là bàn căng nhất. Hai người không nhìn nhau. Nhưng bạn nằm ngửa ra giữa. Bụng chó. Không ai cưỡng nổi bụng chó._
    _Bốn bàn tay gãi bụng bạn. Một lúc sau, hai bàn tay chạm nhau. Rụt lại. Rồi ai đó nói: "Nó thích gãi bên trái hơn." "Ừ, tui biết."_
    ~ qh("chi_dai", 4)
    ~ qh("thanh_ninh", 4)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [🦴 Đi tới bàn "chủ nợ", nơi {dan_dau_tu} ngồi một mình đối diện 6 người.]
    _Bàn này có bánh. Nhiều bánh. Vì ai cũng muốn {dan_dau_tu} khao trước khi trả nợ._
    _Bạn ngồi cạnh {dan_dau_tu}. Người đó chia bánh cho bạn trước, rồi cho các chủ nợ. Bác cũng ngồi bàn này. Bác cười._
    ~ ch_an(20)
    ~ qh("dan_dau_tu", 5)
- _Cuối buổi, {chi_dai} chụp một tấm ảnh. Không ai cười tươi. Nhưng không ai đứng xa ai. Ở giữa ảnh là bạn, đang ngáp._
~ ch_cung(5)
-> END

// ------------------------------------------------------------
=== cho_2510_vu_tim_kho ===
# ngay:25 # gio:09:00 # noi:gam_cau_thang # dieu_kien:not ch_tra_usb_cho_vu
_Chủ nhật. Bác ở lại trực vì đội của {chi_dai} chuẩn bị sân khấu. Tòa nhà vắng. Có tiếng bước chân lén lút xuống gầm cầu thang. KHO CỦA BẠN._
_Mùi cà phê sữa đá. {chua_te_deadline}. Người đó đang soi đèn điện thoại vào góc tối, lẩm bẩm._
chua_te_deadline: Bla bla… bla bla… bla bla bla. # phu_de:Bác {bac_bao_ve} nói "bác không thấy gì đâu" lâu quá… chắc chắn có gì đó ở đây…
* [😤 Gầm gừ. Đây là kho của bạn!]
    cho: GRỪ…
    _Người đó giật lùi, đập đầu vào bậc cầu thang. Bác đi tới, nhìn hai bên, rồi huýt sáo một tiếng._
    bac_bao_ve: Bla bla. TUẤT. # phu_de:Thế à. {cho}, đưa cho người ta.
    _Bác huýt sáo. Bạn hiểu. Bạn tự tha cái USB ra, đặt vào tay người đó._
    bac_bao_ve: Bla bla… bla bla bla. # phu_de:Lần sau để đồ thì nhớ chỗ, cháu ạ.
    ~ mat(usb_khong_nhan)
    ~ ch_so_mon_kho = ch_so_mon_kho - 1
    ~ ch_tra_usb_cho_vu = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("chua_te_deadline", 30)
    ~ ch_dong_minh_kho = "bac_bao_ve"
* [🐾 Đi tới, ngậm cái USB, tự đưa cho người đó.]
    _Bạn bước qua người đó, vào góc, lấy đúng cái USB có mùi cà phê sữa đá, đặt vào tay người đó. Rồi nhìn người đó. "Đi đi, đừng động vào đồ khác."_
    chua_te_deadline: Bla… TUẤT… bla bla… NGOAN… # phu_de:{cho}… em giữ nó suốt hả… ngoan… cảm ơn em…
    ~ mat(usb_khong_nhan)
    ~ ch_so_mon_kho = ch_so_mon_kho - 1
    ~ ch_tra_usb_cho_vu = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("chua_te_deadline", 40)
    ~ ch_cung(6)
* [😶 Nằm chắn trước kho, im lặng.]
    _Bạn nằm chắn trước kho. Người đó soi đèn, thấy bạn, thấy đống đồ phía sau. Thấy cả chiếc găng tay hồng, chiếc tất lẻ, cây son. Người đó dừng lại._
    chua_te_deadline: Bla bla… bla bla. # phu_de:Ừ… chill. Để mai tính. Việc hôm nay cứ để ngày mai.
    _Người đó đi. Kho vẫn còn nguyên. Nhưng giờ đã có thêm một người biết chỗ._
    ~ ch_kho_bi_lo = true
- -> END

// ------------------------------------------------------------
=== cho_2510_ven_do_ll ===
# ngay:25 # gio:16:00 # noi:ven_do
_Chiều. Bác chở bạn về Ven Đô. Trên đường, xe đi ngang một tòa nhà kính 20 tầng, xanh lá chuối từ chân tới đỉnh._
_Mùi tòa nhà đó: kính lạnh, máy lạnh, tiền mới, và một mùi nước hoa xanh lá chuối nồng như vừa được phun cả bình._
~ ch_mui(5)
_Ở sảnh tòa nhà, qua lớp kính, bạn thấy hai người quen đứng cách nhau năm mét, cùng nhìn lên trần nhà, cùng giả vờ đọc biển chỉ đường._
_{designer} và {thanh_ninh}. Ở đây. Cùng lúc. Đều đang làm mặt "tui đi lạc"._
_Và từ thang máy, một người cầm hai điện thoại bước ra, mặt nặng như vác cả tòa nhà trên vai: {quan_ly_idol}._
* [😤 Sủa từ trên xe máy. Chào hỏi kiểu chó.]
    cho: Gâu! Gâu!
    _Ba người cùng quay lại. Ba khuôn mặt cùng trắng bệch. Ba người cùng biết rằng ba người còn lại cũng biết._
    bac_bao_ve: Bla bla… bla. # phu_de:Bác không thấy gì đâu. Đi thôi.
    ~ qh("designer", -3)
    ~ qh("thanh_ninh", -3)
    ~ qh("quan_ly_idol", -3)
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 3
* [👃 Hít thật sâu, ghi nhớ mùi xanh lá chuối.]
    ~ ch_mui(5)
    _Bạn hít đầy phổi. Mùi xanh lá chuối. Mùi kính. Mùi tiền. Bạn cất nó vào một ngăn riêng trong đầu, cạnh mùi bánh chuối chiên và mùi shipper. Ngăn "kẻ thù"._
    { ch_mui_thinh >= 80:
        _Và bạn nhận ra: mùi này, bạn đã ngửi thấy ở đâu đó rồi. Rất nhẹ. Trên áo một người trong công ty._
    }
* [😴 Gục đầu vào lưng bác, ngủ tiếp.]
    ~ nghi(15)
    _Bạn ngủ. Tòa nhà kính lướt qua như một giấc mơ xanh không vui._
- _Ở nhà vườn, bác tưới rau. Bể cá vẫn bơi chậm. Bác ngồi rất lâu trước cái tủ gỗ cũ, tay đặt lên cửa tủ, không mở._
-> END

// ------------------------------------------------------------
=== cho_2610_chieu_thu_phim ===
# ngay:26 # gio:16:00 # noi:phong_hop_tang_2
_Thứ 2. Phòng họp tầng 2 kéo rèm, tắt đèn. Chiếu thử phim ngắn "Người Hùng Không Tên". Bạn nằm ở hàng ghế đầu, vì ghế đầu có ít chân nhất._
_Trên màn hình: trời mưa. Một chiếc xe máy chết máy. Một người mặc đồ hồng đẩy chiếc xe đó, hai cây số, trong mưa._
_Mùi trong phòng đổi. Ở hàng ghế cuối, {thuc_tap_sinh} khóc. Không thành tiếng. Mùi nước mắt mặn như biển Vũng Tàu._
_Ở cửa, {bien_kich} đứng nhìn màn hình, mùi mực bút và mùi lo lắng._
* [🐾 Đi tới hàng ghế cuối, nằm lên chân {thuc_tap_sinh}.]
    _Bạn nằm lên chân người đó. Người đó ôm lấy đầu bạn, thì thầm gì đó. Bạn chỉ nghe được "TUẤT", và "bla bla", và một tiếng sụt sịt._
    thuc_tap_sinh: Bla bla… bla bla bla… bla bla. # phu_de:Chuyện này là chuyện của anh mà… sao lại thành phim của người khác…
    ~ qh("thuc_tap_sinh", 8)
* [👃 Đi tới cửa, ngửi {bien_kich}.]
    ~ ch_mui(2)
    _Người này có mùi giấy, mùi mực, mùi mèo, và mùi của một người biết mình đang cầm thứ không phải của mình._
    bien_kich: *(nhìn xuống bạn)* Bla bla… bla bla. # phu_de:Đây không phải đạo, đây là… cảm hứng. Đúng không {cho}?
    _Bạn không trả lời. Bạn chỉ ngồi đó. Người đó tự nghe thấy câu trả lời._
    ~ qh("bien_kich", -3)
* [😤 Sủa vào người đồ hồng trên màn hình.]
    cho: Gâu!
    _Cả phòng cười. Không khí nhẹ đi. Nhưng {thuc_tap_sinh} thì không cười. Người đó nhìn màn hình như nhìn một kỷ niệm._
- { ch_mui_thinh >= 60:
    _Bạn để ý: trên màn hình, người đồ hồng đẩy xe. Ngoài đời, bạn biết mùi đẩy xe đó. Mùi bánh chuối chiên và mồ hôi tay hồi hộp. Bạn từng được người đó cõng về. Người trong phim không phải diễn viên._
}
_Tối đó, tin đồn "cắt giảm" chạy khắp công ty. Bác ngồi trong chòi, nhìn lên tầng 2 sáng đèn tới khuya._
-> END

// ------------------------------------------------------------
=== cho_2710_vest_trang ===
# ngay:27 # gio:09:45 # noi:cong_cong_ty # bat_buoc
_Thứ 3. Một chiếc xe màu trắng đỗ trước cổng. Một người đàn ông bước xuống. Vest trắng. Tóc vuốt keo bóng như mặt hồ._
_Và cái mùi. Xanh lá chuối. Kính tòa nhà cao tầng. Tiền mới. Đúng cái mùi trong ngăn "kẻ thù" bạn cất hôm chủ nhật._
luu_luc: Bla bla bla… bla bla… XÚC XÍCH… bla. # phu_de:Việc hôm nay phải xong từ hôm qua. Nào, cún con, xúc xích cho em. Cho anh vào gặp Siêu Nhân Hồng nhé.
_Người đó chìa ra một cây xúc xích. To. Bóng. Hàng nhập khẩu. Bạn chưa từng thấy cây xúc xích nào đẹp như vậy._
_Bác ngồi trong chòi, không nói gì. Bác nhìn bạn._
* [🦴 Ăn xúc xích.]
    _Bạn ăn. Ngon. Ngon thật sự. Người vest trắng mỉm cười, bước thẳng vào trong._
    _Bác nhìn bạn. Không nói gì. Cái không nói gì của bác nặng hơn mọi câu mắng._
    ~ ch_an(20)
    ~ ch_nguy_co_ll = ch_nguy_co_ll + 10
    ~ qh("bac_bao_ve", -5)
* [😤 Sủa, chặn đường.]
    cho: GÂU! GÂU! GRỪ…
    _Bạn đứng chắn giữa cổng, nhe răng. Người vest trắng lùi lại một bước. Hai bước. Cây xúc xích rơi xuống đất._
    bac_bao_ve: *(đứng dậy khỏi ghế)* Bla… NGOAN. # phu_de:Ngoan.
    ~ ch_cung(5)
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 10
    ~ qh("bac_bao_ve", 5)
* [🐾 Nhảy lên, để lại hai vết chân bùn trên đầu gối vest trắng.]
    _Bạn nhảy lên, hai chân trước đặt đúng lên đầu gối. Bạn vừa đi qua vũng nước mưa sáng nay. Hai dấu chân nâu in trên nền trắng tinh, rõ như con dấu đỏ._
    luu_luc: Bla! Bla bla bla bla! # phu_de:Ối! Bộ vest này may ở nước ngoài đó!
    hong_hot: Bla bla bla! # phu_de:Tui quay được rồi! Ối dồi ôi!
    _Người vest trắng nhìn đầu gối, nhìn bạn, nhìn cái điện thoại đang quay. Rồi quay về xe._
    ~ follow(5000)
    ~ qh("bac_bao_ve", 5)
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 8
* {ch_mui_thinh >= 80} [🔒 👃 Đánh hơi thật kỹ, rồi chạy vào văn phòng tìm người có cùng mùi.]
    _Bạn hít một hơi thật sâu. Xanh lá chuối. Rồi bạn quay đầu, chạy vào trong, lên tầng 1, qua từng bàn._
    _Không phải bàn này. Không phải bàn này. Không phải…_
    _Bạn dừng lại. Ngồi xuống. Trước bàn của {ten(ran_thu_hai)}. Thẳng lưng. Nhìn thẳng._
    cho: Gâu.
    _Một tiếng. Chỉ một tiếng. Người đó đứng hình. Cả phòng quay lại. Trên áo người đó, rất nhẹ, mùi xanh lá chuối._
    _Không ai nói gì. Nhưng ai để ý thì sẽ hiểu. {hong_hot} đã để ý._
    ~ ch_chi_ra_ran_thu_hai = true
    ~ phat_hien(ran_thu_hai_lo_mat)
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 15
    ~ qh(ran_thu_hai, -20)
- -> END

// ------------------------------------------------------------
=== cho_2710_ho_so_roi ===
# ngay:27 # gio:10:30 # noi:sanh_tang_tret
{ ch_nguy_co_ll > 0:
    _Người vest trắng đã vào được sảnh. Đang nói chuyện rất ngọt với bộ đồ hồng ở chân cầu thang. Tay cầm một tập hồ sơ màu xanh lá chuối._
- else:
    _Người vest trắng quay lại lần nữa, lần này đi cửa sau. Đứng ở sảnh, tay cầm một tập hồ sơ màu xanh lá chuối, chờ bộ đồ hồng._
}
_Rồi {chi_dai} từ kho sự kiện bước ra, tay xách bao cát tập đấm._
_Người vest trắng nhìn thấy {chi_dai}. Mặt người đó chuyển từ trắng sang trắng hơn. Tập hồ sơ rơi xuống sàn. Giấy bay tung tóe._
chi_dai: *(nheo mắt)* Bla bla… bla bla… bla bla? # phu_de:Ủa… cái mặt này quen quen. Quán Ốc Đêm, mười năm trước, tô ốc len hả?
luu_luc: Bla… bla bla… bla! # phu_de:Không! Nhầm người! Tôi… tôi có hẹn!
_Người vest trắng bỏ chạy, quên luôn mấy tờ giấy. Một tờ trượt tới ngay dưới chân bạn. Mùi xanh lá chuối. Mùi mực in. Trên đó có tên của nhiều người trong công ty, và những con số._
* [🎁 Tha tờ giấy về kho.]
    ~ ch_co_trang_ho_so_ll = true
    ~ ch_tha_ve_kho()
    _Tờ giấy về kho, nằm cạnh chiếc giày và chiếc găng tay. Kho của bạn bắt đầu giống một cái tủ hồ sơ hơn là một cái ổ đồ chơi._
* [🐾 Ngậm tờ giấy đưa cho {chi_dai}.]
    _{chi_dai} đọc tờ giấy. Mặt người đó tối lại. Rồi gấp tư, cất vào túi._
    chi_dai: Bla bla… TUẤT… NGOAN. Bla bla bla. # phu_de:{cho} ngoan. Đứa nào bán công ty, chỉ mặt chị.
    ~ qh("chi_dai", 6)
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 5
* [😤 Đuổi theo người vest trắng ra tận cổng.]
    _Bạn đuổi. Người vest trắng chạy nhanh lắm cho một người mặc vest. Bạn đuổi tới cổng, sủa theo cho tới khi chiếc xe trắng khuất._
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 5
    ~ follow(5000)
- -> END

// ------------------------------------------------------------
=== cho_2710_dem ===
# ngay:27 # gio:22:30 # noi:cong_cong_ty
_Khuya. Bác đã ngủ. Radio rè rè. Ở bậc thềm cổng, lại có một người ngồi. Đồ hồng. Mũ để bên cạnh. Điện thoại sáng trên tay._
_Người đó gõ một tin nhắn. Xóa. Gõ lại. Xóa. Gõ lại. Bạn ngửi thấy hồi hộp, mạnh hơn cả hôm sinh nhật._
sieu_nhan_hong: *(lẩm bẩm)* Bla bla… bla bla bla? # phu_de:"Em muốn anh ở lại không?" …Gửi hông ta?
{ ch_nguy_co_ll > 5:
    _Trên bậc thềm cạnh người đó, một tập hồ sơ xanh lá chuối. Mùi tiền mới. Mùi tòa nhà kính. Người đó đang nghĩ về nó._
}
* [🐾 Đi tới, nằm xuống, gác đầu lên giày của người đó.]
    _Bạn gác đầu lên giày. Người đó giật mình, ngón tay chạm vào màn hình. "Đã gửi."_
    sieu_nhan_hong: Bla! Bla bla… TUẤT! Bla bla… bla. # phu_de:Á! Gửi rồi! {cho}! Thôi… vậy cũng được. Cảm ơn em.
    ~ ch_hong_doi(-10)
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 5
    ~ qh("sieu_nhan_hong", 8)
* [😤 Sủa vào tập hồ sơ xanh lá chuối.]
    cho: Gâu! Gâu!
    _Người đó nhìn tập hồ sơ. Nhìn bạn. Rồi cười, rất nhẹ._
    sieu_nhan_hong: Bla bla… bla… bla bla. # phu_de:Em cũng không thích ổng hả. Ừ… chỗ đó không có chó ở cổng.
    ~ ch_nguy_co_ll = ch_nguy_co_ll - 8
    ~ ch_hong_doi(-3)
* [😴 Mặc kệ. Đi ngủ.]
    _Bạn quay vào ổ. Sau lưng bạn, người đó ngồi rất lâu dưới đèn đường, điện thoại sáng rồi tắt, sáng rồi tắt._
- { ch_nhan_qua_hong():
    _Người đó đứng dậy, đặt xuống cạnh ổ của bạn một cây xúc xích. Rồi lên chiếc xe hồng, biến mất._
    ~ ch_an_cua_nguyen()
}
-> END
