// ============================================================
// CON ÔNG CHÁU CHA: LONG
// CHƯƠNG 1: "CHÁU CỦA CHÚ" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== con_ong_chau_cha_0110_song_ao ===
# ngay:1 # gio:08:50 # noi:quan_ca_phe_song_ao # bat_buoc
_8 giờ 50. Quán cà phê Sống Ảo. Đèn vàng, cây xanh, ly cà phê kem vừa ra. Bạn đang xếp ly sao cho ánh nắng chiếu xiên đúng 45 độ._
_Điện thoại rung. Group công ty: "9:00 KÝ HỢP ĐỒNG SIÊU NHÂN HỒNG. TẤT CẢ CÓ MẶT." Tin nhắn từ hôm qua. Bạn chưa đọc._
* [📸 Chụp xong tấm này đã. Ánh sáng đẹp vậy mà.]
    ~ long_so_lan_check_in = long_so_lan_check_in + 1
    _Story: "Ngày mới, năng lượng mới ☕". 214 lượt xem trong 5 phút. Trong đó có chú bạn._
    ~ long_od(2)
* [🏃 Bỏ ly cà phê, chạy liền.]
    _Bạn chạy, tay vẫn cầm ly. Đi bộ 5 phút là tới. Bạn chạy mất 4 phút 50 giây vì dừng lại chỉnh tóc ở cửa kính._
    ~ long_tl(2)
* [☂️ "Để anh gọi chú anh, xin trễ chút."]
    ~ long_goi_chu()
    _Chú không bắt máy. Chú đang đứng trước 22 nhân viên và một siêu nhân màu hồng._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0110_ky_hop_dong ===
# ngay:1 # gio:09:25 # noi:phong_hop_tang_2 # bat_buoc
_9 giờ 25. Bạn đẩy cửa phòng họp tầng 2. Đúng lúc một người mặc bộ đồ siêu nhân hồng đặt bút ký. Cả phòng quay lại nhìn ly cà phê kem trên tay bạn._
giam_doc: Long! Đi làm mà như đi chơi thế à? Muộn 25 phút! Chú… anh nói thế cho công bằng thôi nhé.
_Hai mươi hai cặp mắt. Một cái mũ hồng cũng quay sang. {truong_phong} nhìn bạn như nhìn một cái lỗi chính tả._
* [😎 "Dạ. Chill đi chú."]
    giam_doc: Chill cái gì mà chill! Ngồi xuống!
    _Vài người bật cười. {truong_phong} ghi gì đó vào sổ._
    ~ long_od(2)
    ~ qh("truong_phong", -5)
* [🙇 "Dạ cháu… em xin lỗi. Em sai."]
    _Cả phòng im lặng. Cháu sếp xin lỗi. Chưa ai từng thấy cảnh này._
    giam_doc: *(khựng lại)* Ừ… biết sai là tốt. Ngồi đi.
    ~ long_od(-3)
    ~ long_tl(3)
    ~ qh("chi_dai", 3)
* [😶 Lặng lẽ ngồi xuống ghế cuối, giấu ly cà phê dưới bàn.]
    _Ly cà phê đổ. Kem chảy vào giày {thuc_tap_sinh}. {thuc_tap_sinh} không dám nói gì, chỉ cười._
    ~ qh("thuc_tap_sinh", 2)
- _{giam_doc} ký. 5 tỷ về tài khoản. Cả phòng reo hò. {sieu_nhan_hong} tạo dáng._
sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ!
_Câu đó dội vào đầu bạn như một câu hát. "Hồng… là thái độ." Bạn gõ nhanh vào ghi chú điện thoại. Không ai thấy._
~ long_bh(2)
-> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0110_may_pha_ca_phe ===
# ngay:1 # gio:11:00 # noi:pantry
_Ngày Cà phê Quốc tế. Máy pha cà phê ở pantry hỏng, nhấp nháy đèn đỏ. Một hàng người đứng nhìn nó như nhìn người bệnh._
it: Hỏng bo mạch. Sửa thì 3 ngày.
* [🛒 "Ủa sao không mua cái mới luôn?"]
    { long_quet(8000000):
        _Bạn quẹt thẻ. Chiều đó một cái máy pha cà phê mới tinh được khiêng vào. Màu bạc. Có màn hình cảm ứng._
        ~ long_od(5)
        hong_hot: Ối dồi ôi, phó phòng chơi lớn!
        ke_toan: *(nói chậm)* Hóa đơn đâu em? Đứng tên công ty hay tên chú em?
        ~ qh("ke_toan", -3)
    - else:
        _Thẻ báo lỗi. Bạn nhìn màn hình rất lâu._
    }
* [🔧 "Anh Bảo chỉ em sửa được hông?"]
    it: *(nhìn bạn)* Cầm cái tua vít.
    _Hai tiếng sau, máy chạy lại. Ly cà phê đầu tiên hơi nhạt. Ngon nhất đời bạn._
    ~ long_tl(5)
    ~ qh("it", 6)
    ~ uong(10)
* [😎 Đi ra quán mua cà phê cho cả pantry.]
    ~ tien_cong(-300000)
    ~ qh("hong_hot", 3)
    ~ qh("thuc_tap_sinh", 3)
    _Mười hai ly. Bạn trả bằng lương. Lần đầu bạn thấy 300.000đ là một con số._
    ~ long_tl(2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0110_fan_cung ===
# ngay:1 # gio:15:30 # noi:sanh_tang_tret
_Chiều. Cả công ty ăn mừng bằng trà sữa. Một người đàn ông chạy tới, mặc chiếc áo khoác y chang cái bạn mặc hôm qua._
thuc_tap_sinh: Dạ anh Long! Em mua y chang cái áo anh mặc hôm qua luôn ạ! Anh mặc đẹp quá nên em… dạ em mới vô nên chưa biết ạ.
_{thuc_tap_sinh}. Thực tập sinh. 30 tuổi. Lớn hơn bạn 2 tuổi._
* [😎 "Chill đi anh Duy. Mà áo này hàng cũ rồi, sao hông mua cái mới luôn?"]
    thuc_tap_sinh: Dạ… dạ để em coi giá ạ!
    _Tối đó {thuc_tap_sinh} tra giá cái áo mới: 4 triệu. Đúng bằng một tháng lương thực tập._
    ~ qh("thuc_tap_sinh", 5)
    ~ qh("chi_dai", -5)
    chi_dai: *(nghe được, nhíu mày)* Long. Lại đây chị nói chuyện chút.
* [🤝 "Anh lớn hơn tui mà, đừng 'dạ anh' nữa. Gọi Long thôi."]
    thuc_tap_sinh: Dạ… dạ Long ạ.
    _{thuc_tap_sinh} vẫn không bỏ được chữ "dạ". Nhưng mắt sáng lên như vừa được thăng chức._
    ~ qh("thuc_tap_sinh", 10)
* [👂 "Mà anh Duy trước làm gì vậy? Sao 30 tuổi mới đi thực tập?"]
    thuc_tap_sinh: *(khựng lại)* Dạ… làm văn phòng thôi ạ.
    _Câu trả lời ngắn như một cánh cửa đóng lại. Bạn biết cảm giác đó. Bạn cũng có một cánh cửa._
    ~ long_bh(5)
    ~ long_nghi_duy = true
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0110_tin_nhan_chu ===
# ngay:1 # gio:22:05 # noi:sky_ao_tang_30
_22 giờ 05. Penthouse tầng 30, Sky Ảo. Rộng, trống, lạnh. Bể cá to hơn cả phòng trọ của người ta. Điện thoại sáng:_
giam_doc: *(tin nhắn)* Chú nói thế thôi, đừng để bụng. Mai đi làm sớm nhé. Anh không ép, tùy em… à tùy cháu.
_Bạn nhìn tin nhắn. Rồi nhìn căn phòng cuối hành lang, cánh cửa khóa._
* [🎹 Mở khóa phòng thu. Ghi lại câu "Hồng là thái độ" thành giai điệu.]
    _Một cây đàn, một bàn phím, một cái micro. Bạn ngân câu đó 20 lần, mỗi lần một kiểu. Lần thứ 21 thì nghe được._
    ~ long_bh(5)
    ~ nghi(-15)
* [📱 Trả lời: "Dạ cháu biết rồi chú. Cháu hông để bụng."]
    _Chú thả tim. Hai chú cháu nói chuyện với nhau bằng biểu tượng nhiều hơn bằng lời._
    ~ qh("giam_doc", 3)
* [😶 Đã xem, không trả lời. Ra ban công nhìn thành phố.]
    _Thành Phố Ước Mơ sáng đèn. Từ tầng 30, ai cũng nhỏ xíu. Bạn tự hỏi từ dưới kia nhìn lên, mình có nhỏ xíu không._
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0210_hop_chien_dich ===
# ngay:2 # gio:09:10 # noi:phong_hop_sang_tao # bat_buoc
_Họp chiến dịch "Hồng Hóa Việt Nam". Bạn tới lúc 9 giờ 10, trễ 40 phút, tay cầm ly cà phê. {truong_phong} đang đứng trước một sơ đồ 4 tầng._
truong_phong: Tầng 4 là… cảm xúc.
_Cả phòng gật đầu như những người không hiểu gì. Mọi người nhìn bạn, chờ phó phòng Marketing nói gì đó._
* [😎 "Chill đi. Cho Siêu Nhân Hồng hát một bài là xong."]
    giam_doc: *(gật gù)* Ý tưởng trẻ! Anh thích cái mindset này.
    _Có tiếng "rắc" nhỏ. Cây bút lông trong tay {truong_phong} gãy làm đôi._
    ~ long_od(5)
    ~ qh("truong_phong", -8)
    ~ long_bh(3)
* [📊 "Cho tui xem số liệu người theo dõi theo ngày được hông?"]
    _Cả phòng quay lại. Phó phòng Marketing vừa hỏi số liệu. {dan_dau_tu} rơi cả cái bánh mì._
    dan_dau_tu: Có… có liền em!
    ~ long_tl(5)
    ~ qh("dan_dau_tu", 5)
    ~ qh("truong_phong", 2)
* [😶 Ngồi cuối bàn, lướt điện thoại.]
    _Bạn mở ghi chú, viết: "Hồng là thái độ – điệp khúc?" Không ai biết phó phòng đang làm việc thật._
    ~ long_bh(3)
- truong_phong: *(nhìn bạn)* Cậu nói hát một bài. Hát bài gì? Ai viết? Ngân sách bao nhiêu?
* [☂️ "Để anh… à để tui hỏi chú tui."]
    ~ long_goi_chu()
    giam_doc: Thôi thôi, hai đứa đều là nhân tài của anh cả.
    _{truong_phong} nhìn bạn. Ánh mắt đó bạn quen rồi: "Lại cái ô."_
    ~ qh("truong_phong", -5)
* [🤐 "Chưa biết. Tui… sẽ tìm."]
    truong_phong: *(nhíu mày)* Cậu tìm thật à?
    ~ long_tl(3)
    ~ qh("truong_phong", 2)
* [🎵 "Có thể… ai đó trong công ty viết được."]
    _Bạn nói xong thì muốn rút lại ngay. Nhưng không ai để ý. Họ chỉ nghe "ai đó"._
    ~ long_bh(2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0210_cuoi_cham_cong ===
# ngay:2 # gio:09:05 # noi:sanh_tang_tret
_Ngày Nụ cười Thế giới. {hr} đứng cạnh máy chấm công, cầm tấm bảng "CƯỜI RỒI MỚI CHẤM". Bạn tới trễ, máy đã ghi tên bạn vào "quỹ trà sữa"._
hr: Long. Cười một cái cho hành trình nha em. Mà em trễ 1 tiếng 5 phút. Phạt 50.000 cho quỹ trà sữa.
* [💵 Đưa 50.000đ bằng tiền mặt của mình.]
    ~ tien_cong(-50000)
    ~ long_tl(2)
    hr: Em tự trả hả? *(ghi chú)* Đáng ghi nhận.
* [☂️ "Anh ghi vô… phần của chú em được hông?"]
    hr: *(cười rộng hơn)* Em rảnh không, chiều lên phòng anh uống trà xíu.
    ~ long_od(2)
    ~ long_tl(-3)
    ~ cang_thang(5)
* [😁 Cười thật tươi.]
    hr: Đẹp. Nhưng vẫn 50.000 nha em.
    ~ tien_cong(-50000)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0210_tra_sua ===
# ngay:2 # gio:15:00 # noi:phong_san_xuat
_Trà sữa thứ Sáu. Quỹ trà sữa vừa đủ cho 15 ly. Công ty có 22 người._
hong_hot: Thiếu 7 ly! Ai rút thăm hông có thì nhịn nha!
* [🛒 "Ủa sao không mua thêm? Để tui quẹt."]
    { long_quet(350000):
        _Bảy ly thêm. Cả công ty reo "anh Long!". Bạn thấy vui. Bạn không nghĩ về cái thẻ._
        ~ long_od(3)
        ~ qh("hong_hot", 4)
    - else:
        _Thẻ báo lỗi. {hong_hot} nhìn màn hình, rồi nhìn bạn._
    }
* [💵 Trả bằng tiền lương của mình.]
    ~ tien_cong(-350000)
    ~ long_tl(4)
    ~ qh("hong_hot", 4)
    _Bạn đếm tiền. Bảy ly trà sữa bằng bảy bữa cơm của {thuc_tap_sinh}. Bạn biết vì {thuc_tap_sinh} vừa nói thế._
* [🙋 "Tui nhịn. Tui uống cà phê rồi."]
    ~ qh("thuc_tap_sinh", 3)
    ~ qh("chi_dai", 3)
    _{chi_dai} nhìn bạn lâu hơn bình thường một chút._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0310_ho_boi ===
# ngay:3 # gio:16:00 # noi:ho_boi_sky_ao
_Thứ Bảy. Hồ bơi Sky Ảo. {sales} nằm ghế bên cạnh, đeo kính râm, gọi điện liên tục._
sales: *(cúp máy)* Anh Long! Em vừa nói chuyện với Mr. Kevin Trộn của BTT Global. Ổng muốn tài trợ 2 tỷ! Tin chị đi… à tin em đi!
* [😎 "Ồ, đỉnh vậy. Chừng nào ký?"]
    sales: Sớm thôi anh! Mà anh nói với chú anh giùm em một tiếng nha.
    ~ long_goi_chu()
    ~ qh("sales", 6)
* [📊 "BTT Global có trang web hông? Tui coi thử."]
    sales: Ờ… trang web… đang bảo trì.
    _{sales} chụp hình hồ bơi đăng story. Câu hỏi của bạn chìm theo ảnh._
    ~ long_tl(3)
    ~ qh("sales", -3)
* [🏊 Nhảy xuống hồ, không nghe nữa.]
    _Dưới nước im lặng. Không có chú, không có công ty, không có ai gọi bạn là "cháu sếp". Bạn nín thở lâu nhất có thể._
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0410_chuong_toi ===
# ngay:4 # gio:10:00 # noi:sky_ao_tang_30 # bat_buoc
_Chủ nhật, Ngày Động vật Thế giới. Chuông cửa reo. {dan_dau_tu} đứng ngoài, ôm laptop, cười như sắp trúng số._
dan_dau_tu: Long! Cơ hội trăm năm có một! Lần này là lên thật. Em góp với anh 20 triệu, Tết này mua xe mới.
_Thẻ phụ của chú vẫn còn hạn mức. Bạn có một "vốn góp chung" 10 triệu với {dan_dau_tu} từ năm ngoái. Bạn đã quên mất._
* [💳 "Ủa sao không mua xe luôn bây giờ? Ok, chuyển 20 triệu."]
    { long_quet(20000000):
        ~ long_dau_tu_moi = 20000000
        dan_dau_tu: Đó! Tầm nhìn! Anh biết em là người có tầm nhìn mà!
        ~ qh("dan_dau_tu", 10)
        ~ long_od(3)
        _Thẻ phụ về 0. Bạn không nghĩ gì. Thẻ của chú mà._
    - else:
        _Thẻ không đủ. {dan_dau_tu} nhìn bạn như nhìn một cái đáy giả._
    }
* [💵 "Tui bỏ 2 triệu tiền lương thôi. Lỗ thì thôi."]
    ~ tien_cong(-2000000)
    ~ long_dau_tu_moi = 2000000
    ~ long_tl(4)
    dan_dau_tu: Ít mà chắc. Được!
    ~ qh("dan_dau_tu", 4)
* [💬 "Anh Chương, cái vốn góp 10 triệu năm ngoái sao rồi?"]
    dan_dau_tu: *(tái mặt)* À… cái đó… đang… nằm đáy. Đáy thật.
    _{dan_dau_tu} xin phép đi về vì "có việc gấp". Bạn không giận. Bạn chỉ tò mò thật._
    ~ long_tl(3)
    ~ qh("dan_dau_tu", -4)
* {long_bai_hat >= 10} [🎵 "Anh, số liệu cho thấy nhạc tự sáng tác có lượt xem cao hông?"]
    dan_dau_tu: *(mở laptop thật)* Có. Nhạc nền tự viết cao gấp ba. Sao em hỏi?
    _Bạn không trả lời. Nhưng bạn ghi con số "gấp ba" vào điện thoại._
    ~ long_bh(5)
    ~ qh("dan_dau_tu", 3)
- _{dan_dau_tu} về rồi. Bạn mở story của {hong_hot}: chó {cho} của công ty bị tắm, mặc áo, đội nơ, ngoạm mất găng tay hồng của {sieu_nhan_hong}._
_Bạn bật cười. Rồi gõ vào ghi chú: "Con chó ghét màu hồng – câu 2?"_
~ long_bh(2)
-> END
