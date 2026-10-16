// ============================================================
// CON ÔNG CHÁU CHA: LONG
// CHƯƠNG 4: "LỬA TRẠI" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== con_ong_chau_cha_1710_phong_ngu ===
# ngay:17 # gio:09:30 # noi:khach_san_vung_tau # bat_buoc
_Xe chạy từ 6 giờ 30. Giờ là khu nghỉ Sóng Vỗ, Vũng Tàu. Team building 2 ngày 1 đêm. {hr} xếp phòng: bạn ở phòng 201 với {thuc_tap_sinh}._
_{thuc_tap_sinh} bước ra từ phòng tắm, mặc y chang bộ đồ đi biển của bạn. Từ cái kính râm tới đôi dép tông._
* [😄 "Ủa sao anh mặc giống em vậy, mà đẹp hơn."]
    thuc_tap_sinh: *(đỏ mặt)* Dạ… dạ thật hả anh? Dạ em cảm ơn anh!
    ~ qh("thuc_tap_sinh", 10)
* [📸 "Đứng đó, chụp chung một tấm. 'Hai anh em sinh đôi khác cha khác mẹ'."]
    ~ follow(3000)
    ~ long_so_lan_check_in = long_so_lan_check_in + 1
    ~ qh("thuc_tap_sinh", 8)
    _Ảnh lên story. {hong_hot} bình luận đầu tiên: "Đám cá tươi hả mấy ông?"_
* [😎 "Chill đi anh {thuc_tap_sinh}. Đi biển mà mặc như đi họp."]
    thuc_tap_sinh: Dạ… em mặc giống anh mà.
    con_ong_chau_cha: …Ờ. Vậy tui mặc như đi họp hả?
    ~ qh("thuc_tap_sinh", 3)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1710_keo_co ===
# ngay:17 # gio:10:30 # noi:bai_bien_vung_tau # bat_buoc
_Kéo co: đội Sản xuất của {truong_phong} đấu "đội Marketing", gồm bạn và những ai chưa được chia đội. {thuc_tap_sinh} tự xin vào đội bạn, mặt nghiêm như ra trận._
giam_doc: Cố lên {truong_phong}! Cố lên {con_ong_chau_cha}! Anh ủng hộ… cả hai!
_{truong_phong} đứng đầu dây bên kia, kính trễ xuống mũi, nắm dây như nắm cái ghế Phó Giám đốc._
* [💪 Kéo thật. Lần đầu tiên bạn cố hết sức vì một thứ gì đó.]
    { RANDOM(1, 10) <= 5:
        _Đội bạn thắng. {thuc_tap_sinh} ngã ngửa trên cát, cười như được tăng lương._
        ~ long_tl(4)
        ~ qh("thuc_tap_sinh", 5)
    - else:
        _Đội bạn thua. Bạn ngã chúi xuống cát, kính râm văng mất. {truong_phong} chìa tay kéo bạn dậy. Không nói gì._
        ~ qh("truong_phong", 4)
    }
* [😎 Thả dây giữa chừng: "Chill đi, hòa nha."]
    truong_phong: *(ngã ngồi)* Cậu… thả dây à?
    con_ong_chau_cha: Kéo hoài mỏi tay ông ơi.
    ~ qh("truong_phong", 5)
    ~ long_od(-2)
* [☂️ Hô to: "Chú ơi, phạt đội bên kia đi!"]
    ~ long_goi_chu()
    giam_doc: Thôi thôi, anh không ép ai thua.
    truong_phong: *(lẩm bẩm)* Lại cái ô.
    ~ qh("truong_phong", -8)
    ~ qh("sieu_nhan_hong", -3)
    ~ follow(-15000)
    _{sieu_nhan_hong} thấy hai người cãi nhau, buồn hiu, bỏ đi giúp một bác bán kem đẩy xe lên dốc._
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1710_nhau_toi ===
# ngay:17 # gio:18:30 # noi:nha_hang_vung_tau
_Bữa tối ở quán hải sản Sóng Vỗ. {dan_dau_tu} bao cả đoàn vì Hồng Coin vừa tăng gấp mười. Chú bạn đã uống tới ly thứ bảy._
giam_doc: Các em! Tháng sau… anh tăng lương cả công ty! Anh không ép, anh tự nguyện!
_Mười cái điện thoại giơ lên quay. Bạn nhìn chú. Lần đầu tiên bạn tự hỏi: chú lấy đâu ra tiền?_
* [🍺 Giữ ly của chú lại: "Chú ơi, đủ rồi."]
    giam_doc: *(nhìn bạn, mắt đỏ)* Cháu… lớn rồi nhỉ.
    ~ qh("giam_doc", 6)
    ~ long_bh(4)
* [🎉 Cụng ly, hô theo: "Chú tui đỉnh nóc kịch trần!"]
    ~ long_od(4)
    ~ qh("hong_hot", 3)
    _Clip "cháu sếp hô to theo sếp" được thêm vào bộ sưu tập của {hong_hot}._
* [👂 Ngồi im, nghe mọi người reo hò.]
    _{designer} thì thầm với {sales}: "Tăng lương? Tháng này lương còn trễ…" Bạn nghe thấy. Bạn nhớ._
    ~ long_bh(5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1710_lua_trai ===
# ngay:17 # gio:20:00 # noi:bai_bien_vung_tau # bat_buoc
_20 giờ. Lửa trại. {sieu_nhan_hong} kể chuyện hồi nhỏ từng nhốt một đứa nhỏ trong nhà kho. Giọng nhỏ dần. {ran_doc} ngồi bên kia đống lửa, mặt cứng như đá._
_{idol_het_thoi} ngủ gục trên vai {quan_ly_idol}. {editor} lặng lẽ đắp chăn cho cả hai. Ai đó đưa bạn cây đàn ghi-ta của khách sạn._
* [🎸 Hát "Hồng Là Thái Độ". Lần đầu trước nhiều người.]
    _Bạn hát. Đoạn đầu run. Tới điệp khúc thì không run nữa. Sóng biển như đánh nhịp._
    ~ long_bh(10)
    ~ phat_hien(bai_hat_long)
    _{ran_doc} và {sieu_nhan_hong}, hai người vừa nãy còn không nhìn mặt nhau, giờ cùng ngồi im. Cùng nhìn về một hướng: về phía bạn._
    -> sau_bai_hat
* [🎸 Hát "Công Viên" cho cả đám hát theo.]
    _Cả đám hát. {idol_het_thoi} tỉnh dậy, hát bè, rồi lại ngủ tiếp._
    ~ qh("idol_het_thoi", 5)
    ~ cang_thang(-10)
    -> END
* [🙅 Đưa đàn cho người khác.]
    _Bạn đưa đàn đi. Nó đi một vòng, không ai chơi được. Cuối cùng nằm im trên cát, như bạn._
    -> END

= sau_bai_hat
{ qh_truong_phong >= 20:
    _Im lặng hai giây. Rồi có người vỗ tay. Người đầu tiên. Là {truong_phong}._
    truong_phong: Bài này cậu viết à? Hay hơn nhạc MV phòng tớ đấy.
    ~ long_mo_phong_thu_nhat = true
    -> nhat_vo_tay
- else:
    _Mọi người vỗ tay lác đác. {truong_phong} nhìn bạn rất lâu, rồi quay đi._
    con_ong_chau_cha: *(đặt cây đàn xuống)* Hát chơi thôi mà. Đừng ai kể chú tui nha.
    ~ qh("thuc_tap_sinh", 5)
    -> END
}

= nhat_vo_tay
* [😳 Đỏ mặt: "Ờ… tui viết. 41 bản demo rồi. Bữa nào ông lên tầng 30 chơi."]
    truong_phong: Bốn mươi mốt?
    con_ong_chau_cha: Ừ. Đừng kể chú tui nha.
    truong_phong: Tớ không kể. Tớ… muốn nghe.
    ~ qh("truong_phong", 20)
    ~ long_bh(5)
* [😎 "Hát chơi thôi. Ông đừng kể chú tui nha."]
    truong_phong: *(gật)* Ừ.
    ~ qh("truong_phong", 10)
* [🪑 "Ông khen để mai báo sếp là tui đi team building chỉ để hát hả?"]
    truong_phong: *(khựng lại)* …Không. Lần này tớ khen thật.
    ~ qh("truong_phong", 5)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1710_dem_voi_duy ===
# ngay:17 # gio:23:50 # noi:khach_san_vung_tau
_Gần nửa đêm. Phòng khách sạn. Hai cái giường. {thuc_tap_sinh} nằm nhìn trần nhà. Bạn cũng vậy._
con_ong_chau_cha: Anh {thuc_tap_sinh}. Nói thiệt nha. Tui chán làm "cháu giám đốc" lắm. Muốn tự làm cái gì đó.
thuc_tap_sinh: *(im lặng lâu)* Anh từng có hết mà vẫn thấy trống, anh {con_ong_chau_cha} ạ. Có hết chưa chắc đã vui.
_Bạn ngồi bật dậy._
* [💬 "Anh… 'từng có hết' là sao?"]
    thuc_tap_sinh: Dạ… em bỏ rồi. Em bỏ một cái ghế mà ai cũng muốn ngồi, để đi cầm tấm hắt sáng. Mà em vui, anh {con_ong_chau_cha} ạ.
    _Bạn nhìn {thuc_tap_sinh} rất lâu. Người này lớn hơn bạn 2 tuổi, và đi trước bạn một quãng đường dài._
    ~ qh("thuc_tap_sinh", 25)
    ~ long_bh(10)
    ~ long_tl(5)
    con_ong_chau_cha: Bữa nào… tui cho anh nghe một bài. Chưa ai được nghe hết.
* [😎 "Chill đi anh."]
    thuc_tap_sinh: *(bật cười, ném gối qua)* Dạ chill ạ.
    ~ qh("thuc_tap_sinh", 10)
* [👂 Nằm xuống lại, im lặng nghe.]
    _{thuc_tap_sinh} kể tiếp, nhỏ dần, rồi ngủ. Bạn thức tới 3 giờ sáng, viết hết một đoạn verse vào điện thoại._
    ~ long_bh(8)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1810_coin_sap ===
# ngay:18 # gio:09:00 # noi:khach_san_vung_tau
_Chủ nhật, 9 giờ sáng ngày thứ hai ở Vũng Tàu. Cuộc họp "5 phút" lúc 6 giờ trên bãi biển của {truong_phong} vừa xong._ Điện thoại {dan_dau_tu} đỏ rực: Hồng Coin về 0. Người tạo ôm tiền biến mất._
dan_dau_tu: *(cười méo)* Đây là đáy… đáy thật rồi…
{ long_dau_tu_moi > 0:
    _Số tiền bạn bỏ vào kèo của {dan_dau_tu} hôm 4/10 cũng đang nằm ở đáy. Không thấy đáy đâu._
}
* [🤝 "Hông sao anh. Tui mất thì tui chịu."]
    dan_dau_tu: *(nhìn bạn)* Em… không giận anh hả?
    con_ong_chau_cha: Giận thì tiền có về đâu.
    ~ qh("dan_dau_tu", 10)
    ~ long_tl(4)
* [☂️ "Để tui gọi chú tui coi có cách gì hông."]
    ~ long_goi_chu()
    _Chú không bắt máy. Chú đang say ở phòng bên cạnh. Bạn nghe tiếng ngáy qua vách._
* [🎵 Ghi vào điện thoại: "Đồng coin mang tên người khác, sập trong một đêm."]
    ~ long_bh(4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1810_moi_gioi ===
# ngay:18 # gio:18:30 # noi:sky_ao_tang_30 # bat_buoc
_Chiều tối, về tới Sky Ảo. Cửa thang máy tầng 30 mở ra. Trước cửa nhà bạn có hai người lạ: một anh mặc vest cầm bìa hồ sơ, một cặp vợ chồng đang ngó vào bể cá._
moi_gioi: Dạ, căn này view đẹp nhất tòa nha anh chị… À, anh là…?
con_ong_chau_cha: Tui ở đây.
moi_gioi: Ủa, chủ nhà rao bán từ tháng 9 mà anh hông biết hả?
~ long_biet_penthouse_ban = true
_Căn nhà chú cho bạn ở. Phòng thu. 41 bản demo. Tất cả đang được rao bán. Không ai nói với bạn._
* [☂️ "Để anh gọi chú anh."]
    ~ long_goi_chu()
    _Chuông đổ. Không ai bắt máy. Bạn đứng trước cửa nhà mình, nhìn người lạ đo chiều dài phòng khách._
    ~ long_od(-10)
    ~ cang_thang(10)
* [🚪 "Anh chị xem đi. Trừ cái phòng cuối hành lang."]
    moi_gioi: Phòng đó… có gì vậy anh?
    con_ong_chau_cha: Có tui.
    _Bạn vào phòng thu, khóa cửa. Ngồi im tới khi tiếng người bên ngoài tắt hẳn._
    ~ long_bh(8)
    ~ long_tl(3)
* [📱 Mở điện thoại, tìm phòng trọ ở Hẻm 69.]
    _"Phòng 15m², cửa sổ nhìn tường nhà bên, 3 triệu/tháng." Bạn chưa bao giờ ở nơi nào nhỏ hơn cái bể cá._
    _Bạn lưu tin đó lại._
    ~ long_tl(6)
- _Đêm đó bạn không ngủ. Ô dù của bạn hóa ra là một cây dù giấy. Và trời đang mưa._
-> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1910_giao_ban ===
# ngay:19 # gio:08:35 # noi:phong_hop_sang_tao # bat_buoc
_Thứ Hai. Hôm nay bạn tới đúng giờ. Không phải vì chăm chỉ. Vì không ngủ được._
_Họp giao ban sau team building. Không ai nhìn mặt ai. {truong_phong} đếm được 7 lần thở dài. Bạn góp 2 lần._
truong_phong: *(bất ngờ)* {con_ong_chau_cha}. Cậu đến đúng giờ à?
* [😶 "Ừ. Mất ngủ."]
    truong_phong: *(nhìn bạn lâu hơn bình thường)* …Cậu ổn không?
    _Câu hỏi đó, từ {truong_phong}. Bạn suýt kể hết._
    ~ qh("truong_phong", 5)
* [😎 "Chill. Tui đổi phong cách."]
    _Cả phòng cười. Bạn cười theo. Dưới bàn, tay bạn đang lướt tin phòng trọ._
* [📋 "Ông giao tui việc gì cũng được. Tuần này tui rảnh."]
    truong_phong: *(ngạc nhiên)* Thế… cậu lo phần quảng bá Đại Nhạc Hội với các tiệm trong quận nhé.
    ~ long_tl(4)
    ~ qh("truong_phong", 6)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_1910_xem_tro ===
# ngay:19 # gio:19:00 # noi:hem_69
_Tối. Hẻm 69. Hẻm sâu, hai xe máy tránh nhau phải nín thở. Bạn đứng trước một dãy trọ, tay cầm điện thoại có tin "Phòng 15m², 3 triệu/tháng"._
_Bà Tư chủ trọ ngồi ghế đẩu đầu dãy, quạt nan phành phạch._
ba_tu: Nay mùng mấy rồi con? Coi phòng hả? Nhìn con hông giống người ở trọ.
* [🙇 "Dạ, con muốn thử ở trọ bà ơi."]
    ba_tu: Thử? Ở trọ đâu phải thử áo. Mà thôi, vô coi đi.
    _Phòng nhỏ. Quạt trần kêu cót két. Cửa sổ nhìn thẳng vào tường nhà bên. Bạn đứng giữa phòng, giang tay ra, chạm được hai bức tường._
    ~ long_tl(5)
    ~ long_bh(5)
* [😎 "Bà ơi, phòng nào có view đẹp nhất?"]
    ba_tu: View? *(cười khà khà)* View tường. Tường nào cũng đẹp như nhau con.
    ~ long_bh(3)
* [🚶 Chỉ đứng nhìn, rồi đi về.]
    _Hàng xóm đang hát karaoke. Ông chú hát "Công Viên" lạc tông. Bạn đứng nghe hết bài mới đi._
    ~ long_bh(4)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2010_sinh_nhat_cong_ty ===
# ngay:20 # gio:10:00 # noi:sanh_tang_tret # bat_buoc
_Sinh nhật công ty 16 tuổi kiêm Ngày Phụ nữ Việt Nam. Chú phát mỗi chị em một phong bì 2.100.000đ, kèm bảy chiếc khăn cam giống hệt nhau. Bác {bac_bao_ve} đứng ở góc, cầm một lá thư tay ký "G" và một phong bì dán kín._
_Năm ngoái bạn quẹt thẻ mua nước hoa cho cả chục chị em. Năm nay thẻ bằng 0._
* [🌷 Mua hoa bằng tiền lương, tặng mỗi chị một bông. Đơn giản.]
    ~ tien_cong(-350000)
    ~ long_tl(4)
    ~ qh("chi_dai", 5)
    ~ qh("ke_toan", 5)
    ~ qh("designer", 3)
    ~ qh("bien_kich", 3)
    chi_dai: Năm ngoái nước hoa, năm nay hoa thật. Chị thích năm nay hơn.
* [🎸 Đàn một bài chúc mừng ngắn ở sảnh.]
    _Bạn đàn một đoạn ngắn, không lời. Mọi người vỗ tay. {hong_hot} quay lại, đăng với chữ "Phó phòng biết đàn nha mấy bà"._
    ~ long_bh(4)
    ~ follow(5000)
    ~ qh("hong_hot", 3)
* [☂️ "Năm nay chú tui lo quà hết rồi."]
    _Chú bạn đang đứng cạnh, nghe thấy, mặt hơi tái. Chú chưa lo gì cả._
    ~ long_goi_chu()
    ~ qh("giam_doc", -3)
- _Bác {bac_bao_ve} cất lá thư vào túi áo: tối nay ở Quán Ốc Đêm mới đọc. Phong bì dán kín vẫn dán kín. Chú bạn nhìn theo lá thư, như người đang chờ điểm thi._
-> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2010_quan_oc ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_18 giờ 30, Quán Ốc Đêm. Liên hoan sinh nhật công ty. Bác {bac_bao_ve} đứng dậy, đọc to lá thư: "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui. Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. G."_
_Cả quán im lặng. Một tiếng sau, chú bạn đã say. Chú ngồi một mình ở đầu bàn, nhìn cái ly rỗng._
_Bạn biết chú đang giấu điều gì đó. Căn penthouse. Cái thẻ. Những cuộc gọi không bắt máy._
* [💬 Ngồi xuống, hỏi thẳng: "Chú ơi, chú đang nợ hả?"]
    giam_doc: *(nhìn bạn rất lâu)* …Ai nói với cháu?
    con_ong_chau_cha: Người môi giới. Nhà cháu đang bị rao bán.
    giam_doc: *(thở dài)* Chú thế chấp biệt thự rồi. Để trả lương. Đừng kể ai.
    ~ long_biet_chu_no = true
    ~ phat_hien(the_chap_biet_thu)
    ~ long_od(-15)
    ~ long_noi_chuyen_that_voi_chu = true
    ~ qh("giam_doc", 8)
* [🍺 Ngồi cạnh chú, lần đầu tiên rót bia cho chú thay vì ngược lại.]
    giam_doc: *(nhìn ly bia, rồi nhìn bạn)* Cháu rót cho chú à?
    con_ong_chau_cha: Dạ. Lần này cháu rót.
    _Hai chú cháu ngồi im. Không ai hỏi, không ai kể. Nhưng chú để tay lên vai bạn, lâu, nặng._
    ~ qh("giam_doc", 12)
    ~ long_bh(8)
    ~ long_tl(4)
* [😎 "Chill đi chú. Uống tiếp!"]
    _Chú cười, uống tiếp. Bạn cười, uống theo. Cả hai cười như thể không có gì sắp sập._
    ~ long_od(3)
    ~ uong(10)
- -> END

// ------------------------------------------------------------
=== con_ong_chau_cha_2010_karaoke ===
# ngay:20 # gio:21:00 # noi:karaoke_chu_sau
_21 giờ. Tăng hai: Karaoke Chú Sáu. Chú cầm micro, hét: "Tháng sau tăng lương 20%! Cả công ty!" Cả phòng hét theo. Bạn ngồi im, bạn biết chú lấy đâu ra tiền._
_{truong_phong} ngồi xuống cạnh bạn. Không ai hát. Hai người cùng nhìn chú._
truong_phong: Chú cậu… có ổn không?
* [🎧 "Hông ổn. Mà thôi. Tối thứ Năm ông lên tầng 30 nghe demo đi. Trước khi nhà bị bán."]
    { not long_mo_phong_thu_nhat:
        truong_phong: Demo gì?
        con_ong_chau_cha: Nhạc. Tui viết. 41 bản rồi. Đừng kể chú tui.
        ~ long_mo_phong_thu_nhat = true
    }
    truong_phong: *(khựng lại)* Nhà cậu…
    con_ong_chau_cha: Ừ. Phòng thu cũng nằm trong đó.
    truong_phong: Tối thứ Năm. Tớ mang theo bảng trắng.
    con_ong_chau_cha: *(phì cười)* Mang bảng trắng tới phòng thu hả?
    ~ qh("truong_phong", 10)
* [😶 "Tui cũng đang muốn hỏi câu đó. Mà hỏi ai giờ."]
    _Hai đối thủ ngồi cạnh nhau, cùng một nỗi lo. Lần đầu tiên bạn thấy {truong_phong} không giống kẻ thù._
    ~ qh("truong_phong", 6)
* [🎤 Giành micro, hát "Công Viên" cho chú vui.]
    _Chú ôm vai bạn hát theo, giọng Bắc lẫn giọng Nam. Ít nhất trong 4 phút, không ai nghĩ tới tiền._
    ~ qh("giam_doc", 4)
    ~ cang_thang(-8)
- -> END
