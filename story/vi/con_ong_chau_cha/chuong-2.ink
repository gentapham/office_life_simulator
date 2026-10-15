// ============================================================
// CON ÔNG CHÁU CHA: LONG
// CHƯƠNG 2: "KHÓA QUẢN LÝ" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== con_ong_chau_cha_0510_khoa_quan_ly ===
# ngay:5 # gio:08:25 # noi:phong_giam_doc # bat_buoc
_Thứ Hai, 8 giờ 25. Lần đầu tiên trong năm bạn tới công ty trước 9 giờ. Vì chú gọi lúc 7 giờ sáng._
giam_doc: Long. Tuần này cháu phải làm việc thật. Học "Khóa Quản Lý Có Tâm", và tự lên kế hoạch quảng bá MV. Anh không ép, tùy cháu.
_Chú đẩy qua một cuốn sách dày, bìa có hình chú đang cười, tay chỉ lên trời._
* [😎 "Chill đi chú. Một tuần thôi mà."]
    giam_doc: Một tuần thôi. Nhưng cả công ty nhìn vào đấy.
    ~ long_od(2)
* [📖 "Dạ. Cháu học thật."]
    giam_doc: *(nhìn bạn, hơi ngạc nhiên)* …Ừ. Tốt.
    ~ long_tl(4)
    ~ qh("giam_doc", 3)
* [💬 "Chú ơi, sao tự nhiên chú bắt cháu học vậy?"]
    giam_doc: *(ngừng một nhịp)* Vì… có thể sẽ có lúc cháu phải tự đứng. Thôi, đi họp đi.
    _Bạn không hiểu câu đó. Phải mười mấy ngày nữa bạn mới hiểu._
    ~ long_bh(3)
- _8 giờ 30. Họp giao ban của {truong_phong}. Bạn ngồi đủ 2 tiếng. Lần đầu tiên._
_{thuc_tap_sinh} tặng hoa ngày Nhà giáo cho {truong_phong}, gọi "thầy". {truong_phong} không biết xưng gì. Bạn suýt cười thành tiếng._
* [📚 Mở cuốn sách ngay trong họp, đọc to câu hỏi đầu: "Nhân viên xin tăng lương, em nói gì?"]
    truong_phong: Đọc đáp án luôn đi.
    con_ong_chau_cha: "Đáp án đúng: Anh không ép, tùy em."
    _Cả phòng cười rần. {truong_phong} cũng cười, rồi vội nghiêm mặt lại._
    ~ qh("truong_phong", 4)
    ~ qh("chua_te_deadline", 2)
    ~ qh("bien_kich", 2)
* [😶 Ngồi im, ghi chép như mọi người.]
    _Bạn ghi chép thật. Hai trang. Trang thứ hai là lời bài hát, nhưng không ai biết._
    ~ long_bh(3)
    ~ long_tl(2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0610_den_studio ===
# ngay:6 # gio:09:15 # noi:studio_tang_2
_Buổi chụp poster đầu tiên. Bạn tới sớm (9 giờ 15, tức là sớm). Đèn studio chính chớp tắt liên tục._
it: Bóng hư. Đặt bóng mới thì 3 ngày.
designer: Không có đèn này thì hình ra như chụp trong hầm.
* [🛒 "Ủa sao không mua cái mới luôn? Tui quẹt."]
    { long_quet(8000000):
        _Hai tiếng sau, một bộ đèn mới tinh được giao tới. {designer} nhìn nó như nhìn người yêu._
        ~ follow(10000)
        ~ long_od(4)
        ~ qh("designer", 6)
    - else:
        _Thẻ báo lỗi. Bạn tưởng mạng chập chờn._
    }
* [🔧 "Anh Bảo, mượn bóng ở phòng họp tầng 2 qua được hông?"]
    it: …Được. Mà phòng họp của Nhật đó.
    _Bạn tháo bóng đèn phòng "Sáng Tạo". Sáng đó {truong_phong} họp trong ánh sáng lờ mờ, không hiểu vì sao._
    ~ long_tl(5)
    ~ qh("it", 3)
    ~ qh("truong_phong", -1)
    ~ follow(5000)
* [😎 Kệ, chụp tối cũng được, gọi là "nghệ thuật".]
    designer: Nghệ thuật cái gì anh… hết cứu.
    ~ qh("designer", -4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0610_quan_voi_duy ===
# ngay:6 # gio:11:00 # noi:quan_ca_phe_song_ao # bat_buoc
_Đang chụp thì {sieu_nhan_hong} bỏ đi giúp một bà cụ (điều khoản số 3). Cả đoàn nghỉ. Bạn ra quán Sống Ảo. {thuc_tap_sinh} lẽo đẽo theo sau, mặc đúng bộ đồ của bạn hôm thứ Năm._
thuc_tap_sinh: Dạ… em ngồi đây được hông anh Long?
* [🤝 "Ngồi đi. Uống gì? Tui mời."]
    thuc_tap_sinh: Dạ… dạ nước lọc thôi ạ.
    _Bạn gọi hai ly cà phê kem. {thuc_tap_sinh} uống từng ngụm nhỏ như sợ ly cà phê hết._
    ~ qh("thuc_tap_sinh", 6)
* [📸 "Ngồi đi, mà xích ra chút cho tui chụp ly nước."]
    ~ long_so_lan_check_in = long_so_lan_check_in + 1
    ~ follow(3000)
    _Story của bạn có góc áo của {thuc_tap_sinh}. Bình luận: "Hai anh mặc đồ đôi hả?"_
    ~ qh("thuc_tap_sinh", 2)
- _Im lặng một lúc. Ngoài kia, clip {sieu_nhan_hong} nhặt cam cho bà cụ bắt đầu lan trên Tóp-tóp._
* [👂 "Anh Duy, trước khi đi thực tập anh làm gì vậy?"]
    thuc_tap_sinh: Dạ… làm văn phòng thôi ạ. *(nhìn xuống ly)* Ngồi văn phòng cao lắm anh. Cao mà… lạnh.
    _Bạn nhớ tới tầng 30. Cao, mà lạnh. Bạn không nói gì. Bạn chỉ nhớ câu đó._
    ~ long_bh(5)
    ~ long_nghi_duy = true
    ~ qh("thuc_tap_sinh", 4)
* [💬 "Anh thích làm giải trí hả? Sao vậy?"]
    thuc_tap_sinh: Dạ… vì hồi trước có người giúp em lúc em tệ nhất. Người đó mặc đồ… thôi, em kể dài lắm ạ.
    ~ long_bh(4)
* [😎 "Chill đi anh, đừng ngồi nghiêm vậy."]
    thuc_tap_sinh: Dạ… chill ạ. *(vẫn ngồi nghiêm)*
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0710_ke_hoach ===
# ngay:7 # gio:14:00 # noi:phong_pho_phong_marketing # bat_buoc
_Mốc 1: 50.000 người theo dõi. Bản kế hoạch quảng bá MV nằm trên bàn bạn. 14 trang. Chú dặn phải đọc trước khi ký._
_Ở góc màn hình, nút "Ký luôn cho lẹ" sáng xanh, nhấp nháy như mời gọi._
{ nguoi_theo_doi < 50000:
    _Chưa tới 50.000. Tối nay chú sẽ "truyền lửa" cả công ty 3 tiếng. Ai cũng biết bạn là cháu, nên ai cũng nhìn bạn khi nghe tin này._
    ~ cang_thang(8)
}
* [📊 Đọc thật, từng trang.]
    -> con_ong_chau_cha_mg_duyet_ke_hoach
* [✍️ "Ký luôn cho lẹ."]
    _Bạn ký. Ba giây. {truong_phong} đi ngang qua cửa kính, liếc vào, cười khẩy._
    ~ qh("truong_phong", -4)
    ~ long_od(2)
* [☂️ Gọi chú: "Chú ơi, chú coi giùm cháu rồi cháu ký."]
    ~ long_goi_chu()
    giam_doc: *(qua điện thoại)* Long. Tuần này cháu tự làm. Chú cúp máy đây.
    _Lần đầu tiên chú cúp máy trước. Bạn nhìn cái điện thoại rất lâu._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0810_chao_hang ===
# ngay:8 # gio:10:30 # noi:tiem_nail_lung_linh
_Chú giao: chào gói quảng cáo hợp tác màu hồng cho các tiệm trong quận. Điểm đầu tiên: Tiệm Nail & Tóc Lung Linh._
_Chị chủ tiệm móng dài lấp lánh, ngồi nghe {hong_hot} và {sales} buôn chuyện. Thấy bạn, chị cười thật to._
* [🤝 Chào hàng thật: gói ảnh Siêu Nhân Hồng làm móng hồng, đăng 3 kênh.]
    -> con_ong_chau_cha_mg_chot_nhan_hang
* [☂️ "Chú em là giám đốc G-Entertainment đó chị."]
    _Chị chủ tiệm gật đầu cái rụp. Ký luôn. Chị không hỏi gói có gì._
    ~ long_so_nhan_hang = long_so_nhan_hang + 1
    ~ long_od(5)
    ~ long_tl(-5)
    ~ tien_cong(200000)
    ~ long_co_phieu_nail = true
    ~ follow(5000)
* [😎 Ngồi xuống làm móng trước đã.]
    ~ tien_cong(-150000)
    _Bạn làm móng màu hồng. Tay của phó phòng Marketing giờ là tấm quảng cáo di động. {hong_hot} chụp lại, đăng lên với chữ "Ối dồi ôi"._
    ~ follow(3000)
    ~ qh("hong_hot", 3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0910_ra_mat_mv ===
# ngay:9 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Ra mắt MV đầu tiên của Siêu Nhân Hồng. Căn tin chỉ bán trứng (Ngày Trứng Thế giới), nên ai cũng ngồi xem MV với một quả trứng luộc trên tay._
_MV chạy. Hình đẹp, nhịp nhanh, hồng rực. Nhưng nhạc… nhạc như nhạc chờ điện thoại._
giam_doc: Đỉnh! Ai làm cái này?
_Mọi người nhìn {truong_phong}. Ở hàng ghế cuối, {editor} lặng lẽ bóc vỏ trứng rất chậm._
* [🎵 Thì thầm với {thuc_tap_sinh}: "Nhạc này… chưa tới."]
    thuc_tap_sinh: Dạ… em thấy hay mà anh. Mà anh nói chưa tới thì chắc chưa tới ạ.
    ~ long_bh(3)
* [👏 Vỗ tay to nhất phòng.]
    _Chú nhìn bạn, gật đầu hài lòng. Bạn vỗ tay mà trong đầu đang viết lại đoạn điệp khúc._
    ~ long_od(2)
    ~ qh("giam_doc", 2)
* [🛒 "Ủa sao không mua nhạc xịn hơn?"]
    truong_phong: Ngân sách. Cậu có biết từ đó không?
    ~ qh("truong_phong", -4)
    ~ long_od(1)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0910_trung ===
# ngay:9 # gio:12:10 # noi:can_tin
_Trưa. Căn tin: "HÔM NAY CHỈ CÓ TRỨNG". Trứng luộc, trứng chiên, trứng hấp, trứng… trứng._
* [🛒 "Ủa sao hông gọi đồ ngoài?" Đặt pizza cho cả bàn.]
    { long_quet(600000):
        _Pizza tới. Cả bàn reo hò. {chi_dai} lắc đầu: "Ngày Trứng mà, ăn trứng là văn hóa."_
        ~ an(40)
        ~ long_od(2)
    - else:
        _Thẻ báo lỗi. Bạn ăn trứng._
        ~ an(30)
    }
* [🍳 Ăn trứng chiên với {thuc_tap_sinh} và {chi_dai}.]
    chi_dai: Thấy chưa, trứng ngon mà. Ăn đi, người gì gầy nhom.
    ~ an(35)
    ~ qh("chi_dai", 5)
    ~ long_tl(1)
* [👂 Ngồi gần bàn cô chú căn tin, nghe họ kể chuyện tiền chợ.]
    _"Trứng lên giá 500 đồng một quả rồi", cô bán căn tin nói. Bạn chưa bao giờ biết trứng giá bao nhiêu._
    ~ long_bh(4)
    ~ an(30)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_0910_ban_1 ===
# ngay:9 # gio:23:50 # noi:sky_ao_tang_30
_Gần nửa đêm. Phòng thu tầng 30. Bạn bật lại nhạc MV, nghe ba lần, lắc đầu._
_Bạn mở file mới. Đặt tên: "Hồng Là Thái Độ – bản 1"._
_Điện thoại rung. {dan_dau_tu} nhắn group: "Hồng Coin vừa ra đời! Fan nào đó tạo! Ai vô hông?"_
* [🎹 Tắt điện thoại, làm nhạc.]
    -> con_ong_chau_cha_mg_phong_thu
* [💸 Bỏ 1 triệu vào Hồng Coin "cho vui".]
    ~ tien_cong(-1000000)
    ~ qh("dan_dau_tu", 5)
    _Đồng coin mang tên idol công ty. Bạn thấy hay hay. Bạn không biết 9 ngày nữa nó sẽ về 0._
* [😴 Đi ngủ.]
    ~ nghi(15)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1010_rong ===
# ngay:10 # gio:19:00 # noi:quan_ca_phe_song_ao
_Thứ Bảy, ngày lương, nhưng lương chưa về. Quán Sống Ảo treo bảng "Tuyển phục vụ ca tối, trả theo ca"._
_Bạn đứng nhìn tấm bảng 10 phút. Rồi bạn đeo khẩu trang, đội mũ lưỡi trai, bước vào._
quan_ly_quan: Tên gì em?
* [🐉 "Dạ… Rồng."]
    -> con_ong_chau_cha_mg_lam_them
* [😅 "Dạ thôi, em hỏi giùm bạn."]
    _Bạn quay ra. Tim đập nhanh như vừa làm chuyện xấu. Thật ra bạn chỉ vừa định làm một chuyện tốt._
    ~ cang_thang(3)
* [😎 "Long. Cháu của…" *(khựng lại)*]
    quan_ly_quan: Cháu của ai?
    con_ong_chau_cha: …Cháu của… bà ngoại em. Em tên Rồng.
    -> con_ong_chau_cha_mg_lam_them
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1110_anh_hoi_nho ===
# ngay:11 # gio:20:30 # noi:sky_ao_tang_30
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {truong_phong} đăng ảnh 7 tuổi đang "chủ trì họp" với gấu bông._
* [📸 Đăng ảnh 8 tuổi, ôm cây đàn đồ chơi, đứng cạnh chú Thắng hồi còn trẻ.]
    hong_hot: Ủa! Anh Long hồi nhỏ chơi đàn hả? Đàn thật hay đàn đồ chơi?
    con_ong_chau_cha: Đồ chơi. *(xóa bình luận đó 1 phút sau)*
    ~ long_bh(3)
    ~ qh("hong_hot", 3)
    ~ follow(2000)
* [📸 Đăng ảnh 8 tuổi mặc vest, đứng trước cửa công ty chú.]
    giam_doc: *(bình luận)* Cháu chú từ bé đã ra dáng!
    _Ảnh được 47 lượt thích. Phần lớn là vì chú bình luận._
    ~ long_od(3)
* [😶 Không đăng gì. Chỉ xem ảnh mọi người.]
    _Có một ảnh lạ: một đứa nhỏ mặc áo hồng ở xóm Cây Me, đứng cạnh một đứa khác đang khóc. Bạn không biết ai đăng._
    _Bạn nhìn đứa đang khóc rất lâu. Có một câu hát chợt hiện ra: "người hùng hồi đó cũng từng làm ai khóc"._
    ~ long_bh(4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1210_giao_ban ===
# ngay:12 # gio:08:40 # noi:phong_hop_sang_tao # bat_buoc
_Thứ Hai. Lương trễ 2 ngày. {truong_phong} triệu tập "họp về việc lương về trễ". Không ai biết lương ở đâu, kể cả {truong_phong}._
chua_te_deadline: Ủa ông Long, ông là cháu sếp mà, ông biết lương ở đâu hông?
_Cả phòng quay sang. Bạn chưa bao giờ phải lo lương. Bạn có thẻ của chú._
* [☂️ "Để tui gọi chú tui hỏi."]
    ~ long_goi_chu()
    _Chuông đổ. Một hồi. Hai hồi. Chú không bắt máy. Bạn cười gượng: "Chú đang họp."_
    ~ long_od(-5)
* [🤐 "Tui cũng hông biết."]
    _Lần đầu bạn đứng chung một phía với cả phòng: phía không biết gì._
    ~ long_tl(3)
    ~ qh("chua_te_deadline", 3)
* [😎 "Chill đi, chiều nay về à."]
    designer: Ông chill vì ông có thẻ. Tui chill bằng gì?
    _Câu đó làm bạn khựng lại. Không ai cười._
    ~ qh("designer", -5)
    ~ long_bh(2)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1210_the_bi_tu_choi ===
# ngay:12 # gio:19:30 # noi:quan_ca_phe_song_ao # bat_buoc
~ long_the_phu = 0
_Tối. Lương vừa về. Bạn dẫn {thuc_tap_sinh}, {ran_doc}, {hong_hot} đi quán Sống Ảo ăn mừng, giành trả tiền như mọi lần._
thu_ngan_song_ao: Dạ anh ơi, thẻ của anh bị từ chối rồi ạ. Anh có thẻ khác hông?
_{hong_hot}, {ran_doc} và {thuc_tap_sinh} đang ngồi chờ. Phía sau có 6 người xếp hàng._ # hen_gio:6
* [☂️ "Để anh gọi chú anh."]
    ~ long_goi_chu()
    ~ long_od(-15)
    _Chú không bắt máy. Lần đầu tiên chú không bắt máy hai lần trong một ngày. {hong_hot} đã kịp chụp màn hình "Cuộc gọi nhỡ: Chú Thắng"._
    ~ long_so_nguoi_thay_the_tu_choi = long_so_nguoi_thay_the_tu_choi + 3
* {tien >= 420000} [💵 Rút ví, trả bằng lương của chính mình.]
    ~ tien_cong(-420000)
    ~ long_tl(10)
    _420.000đ. Lần đầu tiên bạn nhìn giá từng món trên hóa đơn. Cà phê kem: 85.000đ. Bạn uống mỗi ngày._
* [😅 "Ủa, hay mình chia tiền đi mấy bạn?"]
    ran_doc: *(cười)* Ủa phó phòng mà chia hả?
    ~ long_od(-15)
    ~ long_tl(5)
    _{thuc_tap_sinh} giành trả hết, lỡ rút ra một cái thẻ hạng kim cương rồi vội cất đi. Cả bàn im lặng lần hai._
    ~ long_nghi_duy = true
    ~ long_so_nguoi_thay_the_tu_choi = long_so_nguoi_thay_the_tu_choi + 3
* [⏱️ (Không chọn kịp)]
    _{hong_hot} trả giùm. Sáng mai, cả group "Hội Anti Sếp" biết thẻ của cháu sếp bị từ chối._
    ~ long_od(-10)
    ~ qh("hong_hot", 3)
    ~ long_so_nguoi_thay_the_tu_choi = long_so_nguoi_thay_the_tu_choi + 3
- ~ long_the_bi_tu_choi = true
_Trên đường về, không ai nói gì nhiều. {thuc_tap_sinh} đi sát bên bạn, như sợ bạn ngã._
-> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1210_dem_trang ===
# ngay:12 # gio:23:30 # noi:sky_ao_tang_30
_23 giờ 30. Penthouse. Bạn mở ứng dụng ngân hàng. Thẻ phụ: 0đ. Hạn mức: 0đ. Tài khoản chính của chú: "Không có quyền truy cập"._
_Bạn gọi chú lần thứ ba. Tiếng tút dài. Rồi tin nhắn tự động: "Thuê bao quý khách vừa gọi hiện không liên lạc được."_
* [🎹 Vào phòng thu. Đánh đàn tới sáng.]
    _Bạn đánh cùng một hợp âm 100 lần. Lần 101, nó thành một câu: "Ô của ai cũng có ngày gãy nan"._
    ~ long_bh(8)
    ~ nghi(-20)
    ~ cang_thang(-5)
* [💵 Mở ví, đếm tiền lương của mình.]
    _25 triệu, trừ trà sữa, trừ cà phê, trừ làm móng. Bạn ghi lên một tờ giấy. Lần đầu tiên bạn làm sổ chi tiêu._
    ~ long_tl(6)
* [📱 Nhắn {hong_hot}: "Đừng đăng gì nha."]
    hong_hot: Muộn rồi ông ơi… mà tui xóa rồi. Ông ổn hông?
    _Một câu "ông ổn hông" từ {hong_hot}. Bạn không biết nên vui hay buồn._
    ~ qh("hong_hot", 5)
- -> END
