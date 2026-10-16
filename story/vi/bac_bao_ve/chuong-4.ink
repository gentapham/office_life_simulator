// ============================================================
// BÁC BẢO VỆ: BÌNH · CHƯƠNG 4: "MỘT MÌNH GIỮ NHÀ" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== bac_bao_ve_1710_xe_buyt ===
# ngay:17 # gio:06:00 # noi:cong_cong_ty # bat_buoc
_6 giờ sáng. Xe 29 chỗ đậu trước cổng. Cả công ty đi Vũng Tàu, 2 ngày 1 đêm. Bác ở lại giữ tòa nhà, như mọi năm._
_{chi_dai} cầm còi đứng ở cửa xe. {hr} cầm danh sách phòng. {thuc_tap_sinh} ôm một túi bánh mì cho cả xe._
_{cho} ngồi ở chân bậc xe, nhìn lên. Đuôi quét qua quét lại. Mắt nhìn bác._
* [🐕 "{cho}. Ở nhà với bác."]
    cho: *(nhìn xe, nhìn bác, nhìn xe)* …Ẳng.
    _{cho} lững thững đi về chòi, nằm xuống, quay lưng về phía xe. Giận. Nhưng ở lại._
    ~ bv_tuat_o_lai = true
    ~ qh("cho", -2)
* [😊 "Đi đi. Đi chơi với các cháu. Bác ở một mình được."]
    _{cho} nhảy phắt lên xe, chui xuống gầm ghế cuối. {chi_dai} nhìn bác, gật đầu: "Con giữ nó, bác yên tâm."_
    ~ bv_tuat_o_lai = false
    ~ qh("cho", 8)
    ~ qh("chi_dai", 3)
* [🙈 Quay đi pha trà. Nó muốn đi đâu thì đi.]
    { RANDOM(1, 2) == 1:
        _Khi bác quay lại, {cho} đã biến mất. Năm phút sau, {hong_hot} nhắn: "Bác ơi {cho} trốn dưới ghế xe nè! Tụi con mang theo nha!"_
        ~ bv_tuat_o_lai = false
    - else:
        _Khi bác quay lại, {cho} vẫn ngồi đó. Xe chạy rồi. Nó chọn ở lại với bác._
        ~ bv_tuat_o_lai = true
        ~ qh("cho", 5)
    }
- giam_doc: *(thò đầu ra cửa sổ xe)* Bác {bac_bao_ve}! Em nhờ bác trông nhà nhé! Có gì bác gọi em!
bac_bao_ve: Ừ. Anh đi đi. Uống ít thôi.
_Xe chạy. Cổng vắng. Lần đầu tiên trong tháng, tòa nhà ba tầng im phăng phắc._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1710_mot_minh ===
# ngay:17 # gio:14:00 # noi:choi_bao_ve
_2 giờ chiều. Tòa nhà trống. Radio đọc bản tin giao thông: "Đường đi Vũng Tàu kẹt 12 cây số". Bác cười. Các cháu đang kẹt._
{ bv_tuat_o_lai:
    _{cho} nằm dưới chân, thỉnh thoảng ngóc đầu nhìn ra cổng, chờ một chiếc xe 29 chỗ không về._
- else:
    _Ổ của {cho} trống. Bát nước đầy. Chòi yên lặng tới mức bác nghe rõ tiếng nước trà rót._
}
* [🔦 Đi một vòng tòa nhà kiểm tra cửa nẻo trước khi tối.]
    _Tầng 1: pantry còn hộp cơm của ai đó trong tủ lạnh, đã mốc. Tầng 2: phòng giám đốc khóa, nhưng ngăn kéo tủ hồ sơ hé ra một khe nhỏ. Bác nhớ chi tiết đó._
    ~ bv_bm(2)
* [🍵 Pha ấm chè Thái Nguyên. Ngồi nghe đài. Hưởng một buổi chiều yên.]
    { bv_co_che_thai:
        _Chè quê, đặc, chát, ngọt hậu. Bác uống một mình, nhớ lời G: "Uống một mình thì phí". Ừ. Phí thật._
        ~ bv_tam(12)
    - else:
        _Trà đá thì vẫn là trà đá. Bác uống, nghe đài, ngủ gật trên ghế bố một tiếng._
        ~ bv_tam(8)
        ~ nghi(15)
    }
* [📒 Đọc lại sổ trực cả tháng, gạch chân những chuyện cần kể cho G.]
    _Thư ngân hàng: 6 lá. Paparazzi: 3 lần. Bằng khen in ở Phố Mới. Biên nhận cầm đồ. Trang 47. Cậu {ran_doc} trong góc pantry._
    _Gạch chân hết thì cả trang đều đỏ._
    ~ bv_bm(2)
    ~ bv_tam(-3)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_1710_dien_thoai_lua_trai ===
# ngay:17 # gio:20:50 # noi:choi_bao_ve
_8 giờ 50 tối. Bác vừa nằm xuống ghế bố thì điện thoại reo. {chi_dai} gọi từ Vũng Tàu. Đằng sau có tiếng lửa tí tách và cả chục người đang la hét._
chi_dai: *(qua loa ngoài)* Bác ơi! Bác ơi bác thức hông! Tụi con đang chơi "nói thật". {hong_hot} hỏi vụ tô ốc năm đó có thật hông. Bác nói giùm con đi bác!
_Hai mươi người bên kia đầu dây im lặng chờ._
* [🍵 "Thật. Bác ở đó. Bác ngồi bàn bên. Bác còn nhớ mặt thằng kia. Ngủ đi các cháu."]
    _Bên kia nổ tung tiếng hò hét. Bác cúp máy. Quay mặt vào tường. Mỉm cười trong bóng tối._
    ~ qh("chi_dai", 8)
    ~ bv_qh_ca_cong_ty(1)
    ~ bv_bm(1)
* [🙈 "Bác không thấy gì đâu. Bác ngủ đây."]
    chi_dai: Bác ơi! Bác!
    _Tút tút. Bên kia la ó tiếc nuối. {chi_dai} thì bật cười: câu "không thấy gì" của bác, ai cũng hiểu là "có"._
    ~ bv_khong_thay_gi()
    ~ qh("chi_dai", 3)
* [😐 "Chuyện người ta, các cháu hỏi làm gì. Ngủ đi, mai còn tắm biển."]
    _Bên kia im lặng một giây. Rồi tiếng {chi_dai}: "Dạ… dạ con xin lỗi bác. Tụi con ngủ đây."_
    ~ qh("chi_dai", -2)
- _Bác nằm xuống lại. Thằng thanh niên tóc ướt ốc len năm ấy. Bác nhớ mặt nó. Bây giờ nó mặc vest trắng, lên báo suốt. Chỉ có điều không ai hỏi bác._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1810_mot_gio_sang ===
# ngay:18 # gio:01:04 # noi:tang_2 # bat_buoc
~ temp r = RANDOM(1, 3)
{
- r == 1:
    ~ bv_nguoi_dem_17 = "ran_thu_hai"
- r == 2:
    ~ bv_nguoi_dem_17 = "chua_te_deadline"
- else:
    ~ bv_nguoi_dem_17 = "it"
}
_Đêm 17 rạng sáng 18. 1 giờ 04. Bác dậy đi vệ sinh, nhìn lên tòa nhà theo thói quen. Đèn tầng 2 đang sáng. Phòng giám đốc._
_Bác cầm đèn pin, đi cầu thang bộ. Từng bậc. Không tiếng động._
_Cửa phòng giám đốc khép hờ. Bên trong có tiếng lục tủ hồ sơ. Một bóng người cầm điện thoại đang chụp gì đó, ánh màn hình xanh lét._
_Đèn pin của bác chiếu vào cửa._ # hen_gio:4
* [🔦 Rọi đèn thẳng vào mặt: "Ai đấy?"]
    -> ro_mat
* [🙈 Tắt đèn, lùi ra, ghi vào sổ trực: "1:04. Tầng 2 có người."]
    _Bác lùi xuống. Ngồi ở chòi, mắt không rời cầu thang. Không đối đầu. Sáng mai đối chiếu giờ ra cổng._
    ~ bv_khong_thay_gi()
    ~ bv_bm(1)
    -> END
* {bv_tuat_o_lai} [🐕 Huýt sáo gọi {cho}.]
    _{cho} lao lên cầu thang như mũi tên, phi vào phòng. Một tiếng hét. Một tiếng "Ẳng!". Bóng người chạy vụt qua bác xuống cầu thang. Một chân trần._
    _{cho} quay ra, ngậm một chiếc giày. {cho} mang chiếc giày về kho dưới gầm cầu thang, nằm đè lên._
    ~ bv_bat_qua_tang_17 = true
    ~ bv_bm(3)
    ~ qh("cho", 5)
    -> END
* {bv_g_khuyen_giay} [🔒 Không rọi mặt. Rọi xuống chân. "Nhìn giày."]
    _Đèn pin lướt qua đôi giày. Bác nhận ra ngay. Không cần thấy mặt._
    -> ro_mat_giay
* [⏱️ (Không chọn kịp)]
    _Bóng người lách qua bác, chạy xuống cầu thang. Bác chỉ kịp ngửi thấy một mùi nước hoa lạ, ngai ngái như lá chuối non._
    ~ bv_bm(1)
    -> END

= ro_mat
{
- bv_nguoi_dem_17 == "ran_thu_hai":
    _Ánh đèn chiếu thẳng vào mặt. {ten(ran_thu_hai)}. Tay cầm điện thoại, màn hình đang mở ảnh chụp hợp đồng Siêu Nhân Hồng, trang 47._
    _{ten(ran_thu_hai)} chết lặng một giây, rồi lao qua bác, chạy mất. Mùi nước hoa lá chuối còn vương ở cửa._
    ~ bv_biet_ran_thu_hai = true
    ~ phat_hien(ran_thu_hai_lo_mat)
    ~ bv_bm(5)
- bv_nguoi_dem_17 == "chua_te_deadline":
    _Ánh đèn chiếu thẳng vào mặt. {chua_te_deadline}. Tóc rối, mắt thâm, tay đang lục ngăn kéo "Dự án tháng 6"._
    chua_te_deadline: Bác… bác ơi… con tìm cái USB. File gốc. Con làm mất từ tháng 9. Bác đừng nói ai nha bác…
    ~ phat_hien(usb_cua_vu)
    ~ bv_bm(3)
- else:
    _Ánh đèn chiếu thẳng vào mặt. {it}. Ngủ gục trên sofa phòng giám đốc, điện thoại rơi xuống sàn vẫn sáng. Mì ly ăn dở trên bàn._
    it: *(mở một mắt)* …Wifi ở đây mạnh nhất. Bác tắt đèn giùm.
    ~ bv_bm(1)
}
~ bv_bat_qua_tang_17 = true
-> END

= ro_mat_giay
{
- bv_nguoi_dem_17 == "ran_thu_hai":
    _Đôi giày quen. Bác thấy nó đi qua cổng mỗi sáng. Của {ten(ran_thu_hai)}. Gót giày dính bùn đỏ Ven Đô, chỗ tòa nhà xanh lá chuối._
    _Bác tắt đèn, lùi xuống. Người kia không biết mình đã bị nhận ra._
    ~ bv_biet_ran_thu_hai = true
    ~ phat_hien(ran_thu_hai_lo_mat)
    ~ bv_bm(5)
- bv_nguoi_dem_17 == "chua_te_deadline":
    _Đôi dép lê, một chiếc đứt quai buộc dây thun. Chỉ một người cả công ty đi đôi dép này: {chua_te_deadline}. Đang tìm gì đó trong ngăn "Dự án tháng 6"._
    ~ phat_hien(usb_cua_vu)
    ~ bv_bm(3)
- else:
    _Đôi tất màu xám, không giày. Nằm trên sofa. Chỉ có {it} cởi giày ở bất cứ đâu có wifi mạnh._
    ~ bv_bm(1)
}
~ bv_bat_qua_tang_17 = true
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1810_sang_kiem_tra ===
# ngay:18 # gio:07:00 # noi:choi_bao_ve
_Chủ nhật. 7 giờ sáng. Bác ngồi đối chiếu sổ trực. Đêm qua cổng chính khóa từ 21 giờ. Không ai ra vào bằng cổng chính._
_Cổng sau: chốt cửa bị kéo. Có vết bùn đỏ ở bậc thềm._
{ bv_bat_qua_tang_17:
    _Bác biết là ai. Câu hỏi bây giờ là: nói với ai?_
- else:
    _Bác chưa biết là ai. Nhưng bác biết người đó có chìa khóa cổng sau, hoặc biết cách mở chốt._
}
* [📞 Gọi cho {giam_doc} ở Vũng Tàu.]
    _Chuông đổ 7 hồi. {giam_doc} nghe máy, giọng khàn như vừa hát karaoke cả đêm: "Alo… bác ạ… có cháy không bác?"_
    bac_bao_ve: Không cháy. Đêm qua có người vào phòng anh.
    giam_doc: *(tỉnh hẳn)* Ai? Lấy gì?
    { bv_nguoi_dem_17 == "ran_thu_hai" && bv_bat_qua_tang_17:
        bac_bao_ve: Có người chụp hợp đồng. Anh về bác nói.
        ~ bv_ke_dem_17 = true
    - else:
        bac_bao_ve: Không mất gì. Anh về kiểm tra.
    }
    ~ bv_lo_than(5)
    ~ qh("giam_doc", 5)
* [🤫 Không nói ai. Ghi vào sổ, để dành kể cho G.]
    ~ bv_bm(1)
* [🐕 Ra gầm cầu thang xem kho của {cho}.]
    { bv_bat_qua_tang_17 && bv_tuat_o_lai:
        _Trong kho: một chiếc giày, còn ấm mùi nước hoa lá chuối. Bác không lấy. Bằng chứng để trong kho của chó là chỗ an toàn nhất công ty._
        ~ bv_bm(2)
    - else:
        _Trong kho: chìa khóa, son môi, điện thoại cũ, chiếc găng tay hồng, một cái USB không nhãn thơm mùi cà phê sữa đá. Không có gì mới._
        ~ bv_bm(1)
    }
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_1810_ca_cong_ty_ve ===
# ngay:18 # gio:17:00 # noi:cong_cong_ty # bat_buoc
_5 giờ chiều. Xe 29 chỗ về. Cửa mở. Không ai nói chuyện với ai. Ai cũng mặt nặng như vừa đi đưa đám._
_{dan_dau_tu} xuống xe đầu tiên, mặt xám: Hồng Coin về 0. Hôm qua còn bao cả team ăn hải sản._
_{con_ong_chau_cha} xuống thứ hai, nhìn chằm chằm điện thoại: tin rao bán penthouse Sky Ảo, tầng 30. Cái penthouse anh đang ở._
{ not bv_tuat_o_lai:
    _{cho} nhảy xuống cuối cùng, phi thẳng vào lòng bác, đen nhẻm vì cát biển, mùi hải sản nồng nặc._
}
* [🍵 Pha sẵn một ấm trà lớn. Ai đi qua cổng cũng đưa một ly.]
    _Hai mươi ly trà. Không ai nói cảm ơn thành tiếng. Nhưng ai cầm ly cũng đứng lại uống hết, rồi mới về._
    ~ bv_so_ly_tra = bv_so_ly_tra + 20
    ~ tien_cong(60000)
    ~ bv_qh_ca_cong_ty(2)
* [💬 Gọi {con_ong_chau_cha} lại: "Ngồi đây một tí."]
    con_ong_chau_cha: *(ngồi xuống ghế nhựa, lần đầu trong đời)* Bác… chú cháu bán nhà mà không nói với cháu.
    bac_bao_ve: Chú cháu cũng có chuyện không nói được với ai.
    con_ong_chau_cha: *(im lặng rất lâu)* …Vâng. Cháu hiểu rồi.
    ~ qh("con_ong_chau_cha", 10)
    ~ bv_bm(2)
* [📒 Nhìn {dan_dau_tu}: "Cháu còn nợ bác." Chỉ nói thế.]
    dan_dau_tu: *(cười méo)* Bác… hôm nay đừng bác.
    ~ qh("dan_dau_tu", -3)
- _{giam_doc} xuống xe sau cùng. Đi thẳng tới chòi. Hỏi nhỏ: "Đêm qua là ai hả bác?"_
{ bv_bat_qua_tang_17:
    -> ke_thang
}
bac_bao_ve: Bác không thấy rõ. Chỉ biết có người.
-> END

= ke_thang
* [🤫 Kể. Đúng người, đúng giờ.]
    _{giam_doc} nghe xong, gật đầu chậm. "Cảm ơn bác. Em sẽ xử lý." Rồi nhìn bác, lâu hơn bình thường: "Bác trực đêm giỏi thật."_
    ~ bv_lo_than(5)
    ~ bv_so_truc_dung = bv_so_truc_dung + 1
    ~ qh("giam_doc", 8)
* [🙈 "Bác không thấy rõ. Bác già rồi."]
    ~ bv_khong_thay_gi()
    ~ qh("giam_doc", -2)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_1810_thu_g_3 ===
# ngay:18 # gio:20:30 # noi:choi_bao_ve # bat_buoc
_Tối chủ nhật. Lá thư thứ ba. Tháng này nhiều chuyện quá, tờ giấy kẻ ô không đủ chỗ._
~ bv_dong_thu = 0
- (chon)
{ bv_dong_thu >= 3:
    -> gui
}
* {biet(trang_47)} [✉️ "Trang 47 hợp đồng. Nếu cậu áo hồng không đủ 1 triệu người theo dõi trước 31/10, công ty phải hoàn 10 tỷ. {giam_doc} ký không đọc."]
    _Bác viết câu này ba lần. Lần đầu tay run. Lần thứ hai chữ xấu. Lần thứ ba thì gửi được._
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_ke_trang_47 = true
    ~ bv_g(8)
    ~ bv_tam(-8)
    -> chon
* {bv_bat_qua_tang_17} [✉️ "Đêm 17, 1 giờ sáng, có người vào phòng {giam_doc}. Bác biết là ai."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_ke_dem_17 = true
    ~ bv_g(5)
    -> chon
* [✉️ "Có đứa tạo ra đồng tiền ảo mang tên cậu áo hồng. Hôm nay nó về 0. Thằng {dan_dau_tu} mất sạch."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_g(2)
    -> chon
* {bv_biet_son_hat} [✉️ "Thằng {thanh_xin_nghi} xin nghỉ gặt lúa để đi thi hát. Nó hát hay lắm."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_g(1)
    ~ bv_tam(3)
    -> chon
* {bac_bao_ve_1810_ca_cong_ty_ve} [✉️ "{giam_doc} đang bán penthouse thằng cháu nó ở. Thằng {con_ong_chau_cha} không biết."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_ke_ngan_hang = true
    ~ bv_g(4)
    -> chon
* [🌸 "Các cháu đi Vũng Tàu về, vui lắm. Đoàn kết lắm."]
    _Bác viết. Rồi nhớ lại hai mươi khuôn mặt nặng trịch lúc xuống xe. Bác không gạch._
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_dep = bv_thu_dep + 1
    ~ bv_g(-5)
    -> chon
* {bv_dong_thu >= 1} [📮 Thế thôi. Gấp thư.]
    -> gui
* [😶 Tuần này không viết. Viết ra thì G lo.]
    -> bo

= gui
~ bv_so_thu = bv_so_thu + 1
_Bác dán tem. Thư này nặng hơn hai thư trước. Không phải vì giấy._
-> END

= bo
~ bv_bo_thu = bv_bo_thu + 1
~ bv_g(-15)
~ bv_tam(-8)
_Bác cất giấy vào ngăn kéo. Giấu G một tuần. Bác không quen. Đêm đó bác thức tới 11 giờ, muộn nhất trong năm._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1910_quan_oc_bao ===
# ngay:19 # gio:19:30 # noi:quan_oc_dem
_Thứ 2. Họp giao ban xong, không ai nhìn mặt ai. Tối, {it} rủ bác ra Quán Ốc Đêm. Như mọi tối thứ 2 đầu tháng. Bạn nhậu: một người 50, một người 31._
_Hai đĩa ốc. Một chai bia. Một ly trà đá cho bác. {it} không ăn ốc, ăn mì ly mang theo._
it: *(cụt lủn)* Bác. Log server. Có người gửi file hợp đồng Siêu Nhân Hồng ra ngoài. Cháu biết là ai. Nói không bác?
* [🙈 "Bác không thấy gì đâu. Cháu cũng thế."]
    it: *(gật)* Ừ. Thế thôi.
    _Bí mật nằm yên trong đĩa ốc. Hai người ăn tiếp._
    ~ bv_khong_thay_gi()
    ~ bv_tam(5)
* [🍵 "Cháu nói với bác. Bác giữ."]
    it: *(nhìn quanh, nói nhỏ)* {ten(ran_thu_hai)}. Gửi lúc 23 giờ, tới một địa chỉ đuôi "la.chuoi".
    _Bác gật đầu. Không bất ngờ. Bác chỉ ghi nhớ._
    ~ bv_biet_ran_thu_hai = true
    ~ phat_hien(ran_thu_hai_lo_mat)
    ~ bv_bm(5)
    ~ qh("it", 5)
* [📢 "Mai lên báo anh {giam_doc}."]
    it: *(lắc đầu)* Lộ là lộ cả việc cháu đọc log. Không được.
    ~ qh("it", -15)
- _Chủ quán ốc mang ra một đĩa ốc len xào dừa, đặt trước mặt bác: "Bác {bac_bao_ve}, lâu rồi không thấy bác. Hồi đó bác ngồi đúng bàn này, cái đêm con nhỏ úp tô ốc lên đầu thằng kia đó."_
it: *(ngẩng lên)* Hả?
bac_bao_ve: Chuyện cũ. Ăn đi.
~ an(40)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2010_thu_den ===
# ngay:20 # gio:07:30 # noi:choi_bao_ve # bat_buoc
_20/10. Ngày Phụ nữ Việt Nam. Sinh nhật {cong_ty} 16 tuổi. Mười sáu năm bác đứng ở cổng này._
_7 giờ 30. Anh bưu tá đưa tận tay một lá thư tem nước ngoài. Dày hơn mọi tháng. Bên trong: một lá thư tay ký "G", và một phong bì nhỏ dán kín, ngoài ghi: "Chỉ mở khi công ty sắp sập."_
_Bác đọc lá thư. "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui…". Lá thư này viết cho cả công ty._
_Cuối thư có một dòng riêng cho bác: "{bac_bao_ve}. Phong bì kia anh giữ. Tới lúc thì chỉ anh được mở, và anh đọc to cho mấy đứa nhỏ nghe. Anh không phải quyết gì. Tôi quyết rồi."_
~ bv_co_phong_bi_g = true
~ nhan(thu_g)
-> thang_toi

= thang_toi
_Một bóng người đứng ở cửa chòi. {giam_doc}, tới sớm hơn mọi ngày 2 tiếng, tay cầm bó hoa tặng chị em._
giam_doc: Bác {bac_bao_ve}, thư gì mà bác đọc chăm thế ạ? Chữ ký "G" à? Ơ… chữ này em thấy quen quen.
* [😶 Gấp thư bỏ túi: "Thư của bạn cũ ở quê thôi anh."]
    giam_doc: Vâng… *(nhìn theo cái túi áo rất lâu)* …Bạn cũ của bác viết chữ đẹp thế.
    ~ bv_lo_than(10)
    -> sau_thang
* [🍵 "Anh {giam_doc} ngồi xuống đây. Bác nói chuyện này một lần thôi."]
    -> ke_rieng
* [📢 "Tối nay liên hoan, bác đọc lá thư này cho cả công ty nghe."]
    giam_doc: *(khựng lại)* Thư… cho cả công ty ạ? Của ai ạ?
    bac_bao_ve: Tối anh nghe.
    ~ bv_doc_thu_cong_ty = true
    -> sau_thang
* {bv_long_tin_g >= 80} [🔒 Mở phong bì thứ hai, dù chưa tới lúc.]
    -> mo_som

= ke_rieng
_{giam_doc} ngồi xuống ghế nhựa. Bác rót trà. Rồi kể. Từ năm 2016. Từng lá thư. Giấy tờ trong tủ gỗ ở Ven Đô. Mỗi chủ nhật một lá thư trả lời._
_{giam_doc} ngồi im một phút. Hai phút. Rồi hỏi, giọng rất nhỏ:_
giam_doc: Anh ấy… có hỏi gì về em không?
~ bv_ke_thang_rieng = true
~ bv_thang_biet = true
~ phat_hien(binh_tai_mat_g)
{
- bv_ke_tot_thang:
    bac_bao_ve: Có. Tháng nào cũng hỏi. Bác kể anh cố lắm. Ông ấy bảo: "Nó cứ làm cho tử tế."
    _{giam_doc} cúi đầu. Bó hoa trên tay run run. Anh không nói gì, chỉ gật đầu, rất nhiều lần._
    ~ qh("giam_doc", 20)
- bv_ke_ngan_hang:
    bac_bao_ve: Có. Bác kể chuyện ngân hàng. Bác kể hết.
    giam_doc: *(đứng dậy, mặt tái)* Bác… kể với anh ấy… mà không nói với em một câu?
    _Anh đi lên tầng. Bó hoa bỏ quên trên ghế nhựa._
    ~ qh("giam_doc", -20)
- else:
    bac_bao_ve: Có. Ông ấy hỏi anh có ngủ đủ không.
    giam_doc: *(cười, mắt đỏ)* Em không ngủ đủ đâu bác.
    ~ qh("giam_doc", 10)
}
-> sau_thang

= mo_som
_Bác bóc phong bì. Tay không run. Bác đã đợi cái này mười năm mà không biết mình đợi._
_Bên trong là quyết định của G về tương lai công ty, viết tay, ký tên, ghi ngày từ tháng 9. Bác đọc một lần. Gấp lại. Bỏ vào túi áo trong._
_Bác biết rồi. Và bác biết người sẽ phải đứng lên đọc nó, trước mặt tất cả mọi người, là bác._
~ bv_mo_phong_bi = true
~ chung_binh_da_mo_phong_bi = true
~ bv_tam(-30)
giam_doc: Bác? Bác sao thế? Mặt bác…
bac_bao_ve: Không sao. Anh lên đi. Hôm nay sinh nhật công ty.
-> sau_thang

= sau_thang
_{giam_doc} đi lên. Bác ngồi lại với lá thư, phong bì, ấm trà. Ngoài cổng, các chị em bắt đầu tới, ai cũng mặc áo dài._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2010_hoa_chi_em ===
# ngay:20 # gio:09:30 # noi:cong_cong_ty
_Tối qua bác về Ven Đô cắt một bó hoa trong vườn. Hoa cúc trắng, hoa mười giờ, mấy cành hoa giấy. Không đẹp như hoa tiệm. Nhưng là hoa thật._
* [🌸 Chia đều cho 7 chị em, mỗi người một cành, kèm một câu.]
    _{ke_toan}: "Cháu giữ tiền giỏi, giữ sức nữa nhé." {chi_dai}: "Cháu đứng cánh gà, nhớ ngồi xuống lúc nào cũng được." {hong_hot}: "Kể ít thôi, cháu ạ." {sales}: "Nói thật, bác tin." {designer}: "Bản số 1 là bản đẹp nhất." {bien_kich}: "Viết tên người ta thì hỏi người ta." {thanh_ninh}: "Cháu không cần nịnh bác đâu."_
    _Bảy người cầm hoa, đứng ở cổng, không ai nói gì. Rồi {hong_hot} khóc trước._
    ~ qh("ke_toan", 5)
    ~ qh("chi_dai", 5)
    ~ qh("hong_hot", 5)
    ~ qh("sales", 5)
    ~ qh("designer", 5)
    ~ qh("bien_kich", 5)
    ~ qh("thanh_ninh", 5)
    ~ bv_lo_than(3)
* [🌸 Đặt cả bó trong cái xô ở cổng, ghi tờ giấy: "Chị em lấy tự nhiên".]
    _Bó hoa hết trong 15 phút. Không ai biết ai để. Ai cũng đoán được._
    ~ bv_qh_ca_cong_ty(1)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2010_logo_goc ===
# ngay:20 # gio:14:00 # noi:phong_giam_doc
_2 giờ chiều. {giam_doc} gọi bác lên phòng giám đốc. Lần thứ hai trong năm bác lên tầng 2. Trên màn hình là 38 bản logo kỷ niệm 16 năm. Bản thứ 38 là logo gốc năm 2010._
giam_doc: Bác ơi, em chọn lại logo gốc. Chữ G 7 màu. Bác có nhớ… ai vẽ cái logo này không ạ? Em quên mất rồi.
{ bv_thang_biet:
    -> da_biet
}
* [🙈 "Bác không nhớ. Bác chỉ giữ cổng."]
    giam_doc: Vâng… em cũng chỉ nhớ mang máng là vẽ trên một tờ giấy ăn.
    ~ bv_khong_thay_gi()
* [🍵 "Vẽ trên tờ giấy ăn ở quán phở. Bút bi xanh. Rồi tô màu bằng bút sáp của con nhà hàng xóm."]
    giam_doc: *(đứng hình)* Bác… sao bác nhớ rõ thế ạ?
    bac_bao_ve: Bác ngồi bàn bên.
    _{giam_doc} nhìn bác. Rất lâu. Anh bắt đầu ghép các mảnh: bác {bac_bao_ve}, năm 2010, căn phòng 20 mét vuông, quán phở, lá thư ký "G" sáng nay._
    ~ bv_lo_than(15)
    ~ qh("giam_doc", 5)
- -> END

= da_biet
giam_doc: *(cười)* À mà em hỏi thừa. Bác biết hết mà.
bac_bao_ve: Vẽ trên tờ giấy ăn ở quán phở. Ông ấy bảo: "Bảy màu, vì công ty sẽ có đủ loại người, màu nào cũng phải có chỗ."
giam_doc: Màu nào cũng phải có chỗ… Ừ. Em dùng lại bản ấy.
~ qh("giam_doc", 8)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2010_lien_hoan ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_18 giờ 30. Liên hoan sinh nhật công ty ở Quán Ốc Đêm. Cái quán bác ngồi mười năm trước. {chi_dai} xếp chỗ, {cho} buộc ở gốc cây cách bánh kem 5 mét._
{ bv_doc_thu_cong_ty:
    -> doc_thu
- else:
    -> khong_doc
}

= doc_thu
_Bác đứng dậy, gõ đũa vào ly trà. Cả quán ốc im bặt. Bác đeo kính lão, mở lá thư. Giọng Bắc chậm rãi:_
bac_bao_ve: Mười sáu năm rồi. Các cháu còn đứng đó là anh vui.
bac_bao_ve: Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. Ký tên: G.
_Bác gấp thư. Im lặng ba giây. Rồi {thuc_tap_sinh} vỗ tay. Rồi cả quán vỗ tay. {giam_doc} cúi đầu, lấy khăn giấy lau mắt, nói là "do ớt"._
_{hong_hot} hỏi to: "G là ai vậy bác?". Bác uống ngụm trà: "Là người làm ra cái công ty này. Bác chỉ là người giữ thư."_
~ bv_lo_than(40)
~ phat_hien(binh_tai_mat_g)
~ tinh_than_cong_ty = tinh_than_cong_ty + 15
~ follow(20000)
~ bv_qh_ca_cong_ty(5)
~ bv_g(5)
-> ket

= khong_doc
_Bác ngồi cuối bàn, uống trà, ăn ốc. Lá thư nằm yên trong túi áo trong, cạnh phong bì dán kín._
_{giam_doc} nâng ly phát biểu về "16 năm hành trình", có nhắc "người sáng lập ở xa". Không ai biết người đó vừa gửi thư tới, cách cái bàn này hai mét._
* [🍵 Rót trà cho từng người ngồi gần. Không nói gì.]
    ~ bv_so_ly_tra = bv_so_ly_tra + 6
    ~ bv_tam(5)
* [🐕 Ra gốc cây ngồi với {cho}, cho nó ăn mấy con ốc luộc không cay.]
    cho: *(nhai rộp rộp)* Gâu!
    ~ qh("cho", 5)
- -> ket

= ket
_Cuối tiệc, cả công ty kéo nhau đi karaoke. Bác về chòi. 21 giờ đúng, bác tắt đèn. Phong bì dán kín nằm dưới gối._
-> END
