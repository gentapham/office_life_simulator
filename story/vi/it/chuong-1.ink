// ============================================================
// IT: BẢO · CHƯƠNG 1: "TẮT ĐI BẬT LẠI" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== it_0110_may_pha_ca_phe ===
# ngay:1 # gio:07:45 # noi:pantry # bat_buoc
_7 giờ 45. Bạn tỉnh dậy trên ghế xếp trong phòng server, má còn in hình sợi dây mạng._
_Điện thoại báo 14 tin nhắn. Cái nào cũng mở đầu bằng "Anh {it} ơi"._
_Tin mới nhất, từ pantry: "MÁY CÀ PHÊ CHẾT RỒI. HÔM NAY LÀ NGÀY CÀ PHÊ QUỐC TẾ ĐÓ ANH."_
hong_hot: Anh {it}! Cứu! Ngày Cà phê Quốc tế mà máy cà phê đình công. Ối dồi ôi, điềm xấu!
thuc_tap_sinh: Dạ em bấm cái nút đỏ 40 lần rồi ạ. Nó chỉ kêu "tít".
* [🔄 "Tắt đi bật lại chưa?"]
    thuc_tap_sinh: Dạ… tắt là sao ạ?
    _Bạn rút phích cắm, đếm tới 10, cắm lại. Cái máy rùng mình, ho ra một làn hơi, rồi chảy cà phê._
    ~ it_so_lan_restart = it_so_lan_restart + 1
    hong_hot: Trời ơi thần thánh! Để tui quay clip "IT hồi sinh máy cà phê" nha!
    thuc_tap_sinh: Dạ em ghi vô sổ rồi ạ: "Rút ra. Đếm 10. Cắm vô." Em cảm ơn anh!
    ~ it_cam_on()
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("hong_hot", 5)
    ~ uy_tin = uy_tin + 3
* [😐 "Anh là IT. Không phải thợ cà phê."]
    hong_hot: Thì máy cà phê cũng xài điện mà anh! Có điện là của IT!
    _Logic không cãi được. Bạn tháo nắp sau. Bên trong có ba hạt cà phê kẹt cứng và một con gián đã an nghỉ._
    _Mười lăm phút sau, máy chạy. Không ai nói cảm ơn. {hong_hot} đã chạy đi hóng chuyện khác._
    ~ cang_thang(5)
    ~ it_on(2)
* [🍜 Lẳng lặng pha ly mì của mình trước đã.]
    _Bạn đi xuyên qua đám đông, đổ nước sôi vào ly mì, rồi đi thẳng về phòng server._
    hong_hot: Ủa alo? Anh {it}!
    ~ an(25)
    ~ it_do_toi(5)
    _Ba phút sau, mì chín. Năm phút sau, {ke_toan} gọi tên bạn bằng giọng của người đang cầm hóa đơn tiền điện. Bạn quay lại sửa máy._
    ~ qh("ke_toan", -5)
- ~ uong(10)
~ nghi(15)
-> END

// ------------------------------------------------------------
=== it_0110_may_chieu ===
# ngay:1 # gio:09:10 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2 chật kín. {sieu_nhan_hong} đang tạo dáng cạnh xấp hợp đồng dày cộp. Bạn đứng ở góc, cầm cái remote máy chiếu như cầm lựu đạn._
giam_doc: Và bây giờ, các em nhìn lên màn hình. Con số làm nên lịch sử của {cong_ty}!
_Slide "5.000.000.000đ" vừa hiện lên thì máy chiếu tắt phụt. Cả phòng quay sang nhìn bạn._
giam_doc: {it}! Em xử lý ngay cho anh. Anh không ép, tùy em. # hen_gio:5
* [🔄 Rút dây ra cắm lại.]
    ~ it_so_lan_restart = it_so_lan_restart + 1
    { RANDOM(1, 10) <= 7:
        _Máy chiếu kêu "bíp", rồi con số 5 tỷ hiện lên to đùng. Cả phòng vỗ tay, như thể bạn vừa chuyển 5 tỷ vào tài khoản._
        giam_doc: Good job em! Em tên gì ấy nhỉ? À, {it}. Anh nhớ rồi. Mười năm rồi anh mới nhớ đấy.
        ~ uy_tin = uy_tin + 10
        ~ qh("giam_doc", 10)
    - else:
        _Máy chiếu hiện màn hình xanh, kèm dòng chữ trắng không ai đọc hiểu._
        giam_doc: Ơ… cái này là slide gì thế em?
        ~ it_do_toi(10)
        ~ cang_thang(10)
    }
* [📱 Chiếu slide bằng điện thoại của mình lên TV.]
    _Slide lên ngay. Rồi một thông báo Zalo-lô hiện chình ình giữa con số 5 tỷ: "Mì ly đã giao tới phòng server. Cảm ơn quý khách thân thiết!"_
    _Cả phòng cười. Bạn muốn hướng nội hết phần đời còn lại._
    sieu_nhan_hong: Anh cũng thích mì ly! Mì ly là thái độ!
    ~ qh("sieu_nhan_hong", 10)
    ~ qh("giam_doc", 3)
    ~ cang_thang(5)
* [😶 Đứng im.]
    thanh_ninh: Dạ anh ơi, không có slide thì anh nói còn hay hơn ạ! Anh nói chuẩn quá anh ơi!
    giam_doc: Thế à? Ừ, thế thì anh kể lại hành trình khởi nghiệp nhé…
    _{giam_doc} nói thêm 40 phút. Không ai nhìn bạn, nhưng ai cũng nhớ bạn là lý do của 40 phút đó._
    ~ qh("thanh_ninh", 5)
    ~ it_do_toi(5)
* [⏱️ (Không chọn kịp)]
    _{giam_doc} bước tới, đập "bốp" lên nóc máy chiếu. Nó chạy lại._
    giam_doc: Đấy. Máy móc cũng như nhân viên, phải có kỷ luật.
    _Từ hôm nay, {giam_doc} tin mình giỏi IT hơn bạn._
    ~ it_do_toi(5)
    ~ it_truy_cap(-5)
- _{giam_doc} ký. 5 tỷ về tài khoản. Cả phòng reo hò. {ke_toan} nhìn trang 47 của hợp đồng như nhìn một cái bẫy chuột._
-> END

// ------------------------------------------------------------
=== it_0110_wifi_hong ===
# ngay:1 # gio:14:00 # noi:phong_giam_doc
_{giam_doc} gọi bạn lên phòng giám đốc. Trên bàn có một bó hoa hồng, một cây gậy golf và một tờ giấy ghi "TÊN WIFI MỚI"._
giam_doc: {it} này, tháng này cái gì cũng phải hồng. Em đổi tên wifi thành "G-Entertainment-HONG-5G" cho anh nhé.
giam_doc: Có chữ 5G nghe nó mạnh. Đối tác vào là thấy mình công nghệ.
_Bạn nghĩ tới con router đời 2014 quấn băng keo đen. Nó không có 5G. Nó còn không chắc có 4G tinh thần._
* [😇 "Router không có 5G anh."]
    giam_doc: Thì em ghi tên thế thôi, có ai kiểm tra đâu. Mindset mình phải 5G đã.
    _Bạn đổi tên. Cả công ty bắt wifi "5G", rồi than wifi 5G gì mà chậm như 2G. Lỗi ai? Lỗi IT._
    ~ it_do_toi(5)
* [💬 "Mua router mới thì có 5G thật."]
    giam_doc: À, cái tờ đề xuất 12 triệu ấy hả? Anh ký rồi mà nhỉ?
    it: Anh ký 1. Cần 3.
    giam_doc: Thế em đưa {thanh_ninh} đi xin chữ ký tiếp. Anh không ép, tùy em.
    _Bạn nhớ ra: {thanh_ninh} chính là người đã làm mất tờ giấy đó năm ngoái._
    ~ qh("giam_doc", 3)
    ~ it_truy_cap(3)
* [🐍 Đặt tên "G-Entertainment-HONG-5G" nhưng để mật khẩu là "router2014quanbangkeo".]
    giam_doc: Mật khẩu gì mà dài thế em?
    it: Bảo mật anh.
    _Trong một tuần, cả công ty gõ sai mật khẩu 300 lần. Ai gõ sai cũng đọc to chữ "router 2014 quấn băng keo". Thông điệp đã được truyền đi._
    ~ it_do_toi(-3)
    ~ qh("giam_doc", -3)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== it_0110_mung_bac_binh ===
# ngay:1 # gio:12:00 # noi:choi_bao_ve
_Trưa. Ngày Quốc tế Người cao tuổi. Cả công ty kéo xuống chòi bảo vệ mừng Bác {bac_bao_ve}, mỗi người cầm một ly trà sữa ăn mừng 5 tỷ. Bác ngại đỏ cả mặt._
bac_bao_ve: Thôi, thôi các cháu. Bác còn trẻ chán. Mỗi tội cái radio của bác nó cứ rè rè.
cho: Gâu! *(đánh hơi ly trà sữa của bạn)*
* [🤝 "Đưa con coi cái radio."]
    _Bạn mở nắp radio. Dây ăng-ten bị đứt, chắc do {cho} gặm. Bạn nối lại bằng một sợi dây đồng lấy từ túi áo, vì túi áo IT lúc nào cũng có dây._
    _Radio phát ra giọng cải lương rõ mồn một._
    bac_bao_ve: Ơ… được rồi đấy. Cháu giỏi thật. Mười năm nay cháu sửa cho bác bao nhiêu thứ rồi nhỉ?
    ~ qh("bac_bao_ve", 10)
    ~ it_cam_on()
* [🐾 Chia cho {cho} miếng trân châu.]
    cho: Gâu gâu! *(nhai trân châu như nhai kẹo cao su, vẻ mặt rất suy tư)*
    bac_bao_ve: Đừng cho nó ăn linh tinh, cháu. Nó mà đau bụng là bác thức cả đêm đấy.
    ~ qh("cho", 10)
    ~ qh("bac_bao_ve", -2)
* [😶 Đứng ở rìa, uống trà sữa, không nói gì.]
    _Đông người quá. Bạn đứng sau cột đèn, cảm thấy an toàn như đang ở phòng server._
    bac_bao_ve: *(đi ngang, nói nhỏ)* Đông quá hả cháu? Lát vãn rồi ra đây bác rót trà.
    ~ qh("bac_bao_ve", 5)
    ~ cang_thang(-5)
- ~ uong(30)
~ cang_thang(-5)
-> END

// ------------------------------------------------------------
=== it_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_tang_2 # bat_buoc
_9:30. Họp chiến dịch "Hồng Hóa Việt Nam". Trên bảng trắng, {truong_phong} vẽ một mũi tên đi lên rất tự tin, đi từ 5.000 tới 1.000.000._
truong_phong: Mình họp nhanh 5 phút thôi nhé. Mục tiêu một triệu người theo dõi trước 31/10.
giam_doc: Anh muốn mỗi tối mình livestream 4K từ sân thượng. View thành phố, gió lộng, Siêu Nhân Hồng đứng giữa. Rất là cinematic.
_Mọi ánh mắt quay về phía bạn. Bạn nghĩ tới cái router quấn băng keo, rồi nghĩ tới cái sân thượng không có ổ điện._
* [😶 Im lặng.]
    giam_doc: Im lặng là đồng ý nhé. Tốt. Anh thích nhân viên không cãi.
    _Bạn vừa nhận một việc không thể làm. Bạn biết. Ai cũng biết. Chỉ {giam_doc} không biết._
    ~ it_do_toi(10)
* [💬 "4K cần mạng mạnh. Mình chưa có."]
    giam_doc: Thế thì em làm cho có. Anh không ép, tùy em.
    sieu_nhan_hong: Hay mình livestream 720p cũng được mà anh! Hồng thì độ phân giải nào cũng hồng!
    ~ qh("sieu_nhan_hong", 5)
    ~ it_do_toi(3)
    ~ uy_tin = uy_tin + 3
* [🤝 Đề xuất kéo một đường dây riêng lên sân thượng, dùng máy phát wifi cũ của studio.]
    it: Kéo dây lên. Được 1080p.
    truong_phong: Ơ, cái này mình take note lại. Cậu làm luôn được không?
    _Bạn mất cả buổi chiều leo trèo với cuộn dây 50 mét. Nhưng tối đó, sân thượng có sóng._
    ~ it_on(10)
    ~ nghi(-20)
    ~ uy_tin = uy_tin + 5
    ~ qh("truong_phong", 5)
- truong_phong: Thôi, mình họp tiếp phần hai về font chữ trên poster nhé.
_Cuộc họp 5 phút kéo dài tới 11 giờ 40._
~ cang_thang(5)
-> END

// ------------------------------------------------------------
=== it_0210_cuoi_cham_cong ===
# ngay:2 # gio:08:02 # noi:may_cham_cong
_Ngày Nụ cười Thế giới. {hr} đứng cạnh máy chấm công, tay cầm tờ nội quy mới: "Chấm công phải cười"._
hr: Anh {it} ơi, em muốn máy chấm công không nhận mặt ai không cười. Anh cài được hông? Em chỉ muốn lắng nghe nụ cười của mọi người thôi.
_Cái máy chấm công này nhận mặt còn chưa nổi. Hôm qua nó nhận {thuc_tap_sinh} là {cho}._
* [🔄 "Tắt đi bật lại đã."]
    _Bạn khởi động lại máy. Nó nhận diện được bạn, rồi hiện chữ: "Không phát hiện cảm xúc."_
    hr: *(cười)* Máy nói đúng ghê anh ha.
    ~ it_so_lan_restart = it_so_lan_restart + 1
    ~ qh("hr", 3)
* [🐍 Chỉnh cho máy cười ngược lại người chấm công.]
    _Bạn cài một hình mặt cười to lên màn hình. Mỗi người chấm công xong, máy phát tiếng "Hí hí"._
    hong_hot: Trời ơi máy chấm công biết cười! Clip này lên xu hướng nội bộ liền!
    hr: Cái này… không đúng quy trình lắm, nhưng mọi người vui nên em ghi nhận.
    ~ qh("hong_hot", 5)
    ~ qh("hr", -2)
    ~ cang_thang(-5)
* [😶 "Lỗi người dùng." Rồi đi.]
    hr: *(vẫn cười)* Em ghi nhận phản hồi của anh nha. Ghi nhận thôi.
    _Bạn nghe thấy tiếng bút bi bấm "tách" sau lưng._
    ~ qh("hr", -5)
    ~ it_do_toi(3)
- -> END

// ------------------------------------------------------------
=== it_0210_tra_sua_thu_6 ===
# ngay:2 # gio:15:00 # noi:pantry
_Trà sữa thứ 6. {ke_toan} chia trà sữa từ quỹ phạt đi trễ. Tên trên ly của bạn lại bị viết sai chính tả, như mọi tuần._
ke_toan: Ông {it}, ly của ông nè. Mà sao máy in phòng tui in hóa đơn ra chữ mờ như ma vậy?
* [💬 "Bà để chế độ tiết kiệm mực."]
    ke_toan: Thì tiết kiệm là đúng rồi! Máy in phải hiểu chứ!
    _Bạn lên phòng kế toán, tắt chế độ tiết kiệm mực. Hóa đơn in ra rõ nét. {ke_toan} nhìn tờ giấy như nhìn một khoản chi không có hóa đơn._
    ke_toan: Tốn mực hơn hả? Thôi được. Lần này thôi nha.
    ~ qh("ke_toan", 5)
* [🧂 "Máy in già rồi, giống router."]
    ke_toan: Đừng có lái qua cái router. Ba chữ ký. Không có ba chữ ký là không có router.
    ~ qh("ke_toan", -2)
- ~ uong(30)
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== it_0310_phong_tro ===
# ngay:3 # gio:10:00 # noi:phong_tro_bao
_Thứ 7. Bạn về phòng 9, dãy B, Hẻm 69 lần đầu tiên sau 11 ngày. Bà Tư chủ trọ nhìn bạn như nhìn người lạ._
_Trong phòng: ba cái máy tính tự ráp, một núi dây điện và một cái ổ cứng to cỡ cuốn từ điển, dán băng keo đỏ: "KHÔNG ĐƯỢC MỞ"._
_Chữ là chữ của bạn. Bạn không nhớ mình viết hồi nào._
* [💬 Cầm ổ cứng lên, lật qua lật lại xem nhãn.]
    _Mặt sau có dòng chữ bé xíu: "sao lưu tự động 2016–…". Bạn nhíu mày. Ổ này chạy từ hồi nào? Nó sao lưu cái gì?_
    _Bạn định cắm thử, nhưng nhớ ra chính mình đã dặn mình "KHÔNG ĐƯỢC MỞ". Bạn của năm 2016 chắc có lý do._
    ~ it_biet_o_cung = true
    _Bạn đặt nó lại lên kệ, ngay ngắn hơn một chút._
* [🧹 Dọn phòng một chút.]
    _Bạn gom dây điện thành ba cuộn, quét ra một túi mì ly rỗng. Cái ổ cứng vẫn nằm im trên kệ, đầy bụi._
    ~ cang_thang(-10)
    ~ nghi(10)
* [😴 Nằm xuống ngủ luôn.]
    _Bạn ngủ một mạch tới 5 giờ chiều. Không có tiếng quạt server, bạn mơ thấy router kêu cứu._
    ~ nghi(40)
- _Chú Sáu karaoke bên kia hẻm bắt đầu "một bài nữa thôi"._
-> END

// ------------------------------------------------------------
=== it_0310_quan_net ===
# ngay:3 # gio:19:30 # noi:quan_net_go_phim
_Quán net Gõ Phím. {thuc_tap_sinh} ngồi máy số 7, mặc áo thun giống hệt áo của {con_ong_chau_cha}._
thuc_tap_sinh: Dạ anh {it}! Anh chơi game hả anh? Em ngồi đây làm khóa học dựng phim online ạ.
_Màn hình của {thuc_tap_sinh} có một tab bị thu nhỏ: trang quản lý tài khoản ngân hàng, hạng "Kim Cương"._
* [😶 Giả vờ không thấy.]
    _Bạn quay sang máy mình. Chuyện của người ta là chuyện của người ta. Đó là luật của nghề IT, và của người ít nói._
    ~ it_lt(3)
    ~ qh("thuc_tap_sinh", 3)
* [💬 "Tab đó tắt đi. Wifi quán không an toàn."]
    thuc_tap_sinh: Dạ?! Dạ… dạ em tắt liền ạ! Anh… anh thấy gì hông ạ?
    it: Thấy wifi yếu.
    thuc_tap_sinh: *(thở phào)* Dạ em cảm ơn anh!
    ~ it_cam_on()
    ~ qh("thuc_tap_sinh", 10)
    ~ it_lt(2)
* [🐍 Liếc kỹ hơn một chút.]
    _Số dư nhiều tới mức bạn đếm số 0 tới lần thứ ba thì bỏ cuộc. Thực tập sinh 4 triệu một tháng?_
    ~ it_lt(-5)
    ~ phat_hien(duy_tung_lam_ngan_hang)
- ~ tien_cong(-15000)
-> END

// ------------------------------------------------------------
=== it_0410_ngay_dong_vat ===
# ngay:4 # gio:10:30 # noi:san_cong_ty
_Chủ nhật, Ngày Động vật Thế giới. {chi_dai} gọi bạn lên công ty "chỉnh đèn chụp hình cho {cho}". {cho} mặc áo, đội nơ, mặt như bị bắt cóc._
chi_dai: {it}, đánh đèn cho đẹp. Thằng nhỏ này cả năm mới được tắm một lần đó.
cho: Grừ… *(nhìn bạn như muốn nói "cứu tao")*
_Đúng lúc đó, chiếc xe hồng đỗ xịch trước cổng. {sieu_nhan_hong} nhảy xuống, giả tiếng sủa "Gâu gâu!"._
sieu_nhan_hong: {cho} ơi! Anh tới chơi nè! Gâu! Gâu!
cho: GÂU GÂU GÂU!
_Trong lúc hỗn loạn, {cho} giật phăng chiếc găng tay hồng của {sieu_nhan_hong} rồi chạy mất. {sieu_nhan_hong} cười khoái chí, nhặt con gà cao su của {cho}, đi xuống tầng trệt._
_Bạn thấy {sieu_nhan_hong} nhét con gà cao su vào khe sau tủ mạng tầng trệt, rồi huýt sáo bỏ đi._
* [🤝 Đợi {sieu_nhan_hong} đi rồi, lấy con gà ra trả cho {cho}.]
    _Bạn thò tay vào khe tủ mạng, giữa 48 sợi dây xanh, rút ra con gà cao su. Nó kêu "éc"._
    cho: Gâu! *(lao tới, ngậm con gà, vẫy đuôi như cánh quạt)*
    chi_dai: Ủa, cái gà ở đâu ra vậy?
    it: Sau tủ mạng.
    chi_dai: Tủ mạng là chỗ chó chơi hả? Em khóa tủ lại giùm chị.
    ~ it_lay_ga_cao_su = true
    ~ qh("cho", 20)
    ~ qh("chi_dai", 5)
    ~ it_on(5)
* [📸 Chụp lại để làm bằng chứng, rồi để đó.]
    _Bạn chụp một tấm. Con gà cao su nằm giữa mớ dây xanh, mắt nhìn bạn như biết trước tương lai._
    _Bạn nghĩ: chắc không sao đâu._
    ~ it_truy_cap(2)
* [😶 Kệ. Đánh đèn cho {cho} tiếp.]
    _Bạn quay lại với cái đèn. {cho} được chụp 40 tấm. Tấm nào mặt cũng cau có, nhưng {chi_dai} bảo "đẹp trai"._
    ~ qh("chi_dai", 5)
- chi_dai: Xong rồi. Ra chòi ăn bánh mì với chị với bác.
~ an(30)
-> END
