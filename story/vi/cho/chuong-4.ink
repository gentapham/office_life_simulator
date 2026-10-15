// ============================================================
// CHƯƠNG 4: "BIỂN HAY CỔNG" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== cho_1710_xe_buyt_cam ===
# ngay:17 # gio:06:30 # noi:cong_cong_ty # bat_buoc
_Thứ 7. Một chiếc xe buýt màu cam to đùng đỗ ngay cổng. Cả công ty kéo vali, đội nón, mang kính, mặt ai cũng như đi trốn nợ._
hr: Bla bla bla… bla bla… bla! # phu_de:Team building Vũng Tàu, hai ngày một đêm! Điểm danh nha mọi người! Không ai được ở lại, trừ bác {bac_bao_ve}!
_Bác đứng ở cổng, tay cầm ấm trà. Bác không đi. Bác ở lại giữ nhà._
_Cửa xe buýt mở. Bên trong có mùi nệm ghế, mùi dầu gió, mùi bánh mì, và… từ rất xa, ở cuối con đường, một mùi bạn chưa từng ngửi: mặn mặn, tanh tanh, rộng mênh mông. Biển?_
thuc_tap_sinh: *(ngồi xuống ghế, thì thầm qua cửa sổ)* Bla bla… TUẤT… bla bla? # phu_de:{cho} muốn đi biển hông? Dưới ghế anh còn trống nè…
* [🏃 Lẻn lên xe, chui xuống gầm ghế {thuc_tap_sinh}.]
    _Bạn phóng lên bậc xe, chui tọt xuống gầm ghế. {thuc_tap_sinh} lấy cái áo khoác phủ lên bạn. Tim hai đứa cùng đập thình thịch._
    ~ ch_len_xe_vung_tau = true
    ~ qh("thuc_tap_sinh", 8)
    hr: Bla bla… bla bla… 22. Bla! # phu_de:...20, 21, 22. Đủ rồi! Xuất phát!
    _Đếm người đủ. Không ai đếm chó. Xe lăn bánh. Qua khe cửa, bạn thấy bác đứng ở cổng, nhìn theo chiếc xe, rồi nhìn xuống cái ổ trống._
    _Bác uống một ngụm trà. Bác biết. Bác luôn biết._
* [🐾 Ngồi xuống cạnh bác ở cổng.]
    _Bạn quay lưng với cái mùi mặn mặn. Ngồi xuống cạnh chân bác. Ai đó cũng phải giữ cổng chứ._
    bac_bao_ve: Bla… TUẤT… bla bla. # phu_de:Ở lại với bác à, {cho}. Ừ. Hai ông cháu giữ nhà.
    ~ qh("bac_bao_ve", 8)
    _Xe buýt cam chạy khuất. Tòa nhà im lặng lạ thường. Lần đầu tiên bạn thấy cái công ty này to như vậy._
* [😤 Sủa chiếc xe buýt. Nó đang bắt cả công ty đi đâu vậy?]
    cho: Gâu! Gâu gâu!
    _Bạn đuổi theo xe tới hết đường, rồi quay về. Bạn đã cảnh báo. Họ không nghe. Không phải lỗi của bạn._
    ~ qh("bac_bao_ve", 4)
- -> END

// ------------------------------------------------------------
=== cho_1710_bai_bien ===
# ngay:17 # gio:14:00 # noi:vung_tau_bai_bien # dieu_kien:ch_len_xe_vung_tau
_BIỂN._
_Cát nóng dưới chân. Nước đuổi theo chân bạn rồi chạy đi, rồi đuổi lại. Bạn sủa nó. Nó không sợ. Đây là kẻ thù mới, to hơn cả bộ đồ hồng._
hr: *(cười hết cỡ, giấu khó chịu)* Bla bla… TUẤT? Bla bla bla… bla. # phu_de:Ủa, sao {cho} ở đây? Ai mang theo vậy? Thôi được, anh xếp em vô phòng nào đây trời…
_Người cười suốt phải xếp lại phòng. Bạn được ngủ chung phòng với {thuc_tap_sinh} và {con_ong_chau_cha}. {con_ong_chau_cha} nói gì đó về "thuê thêm phòng cho chó"._
hr: Bla bla bla… bla bla… bla! # phu_de:Trò chơi tiếp theo: Truyền bánh chuối chiên bằng miệng! Không dùng tay!
_Bánh chuối chiên. Truyền bằng miệng. Bạn sinh ra là để chơi trò này._
* [🏃 Nhảy vào chơi.]
    _Bạn chạy vào giữa hàng người. Bánh chuối chiên đang được truyền từ miệng {sales} sang miệng {designer}._
    _Bạn ngoạm giữa chừng. Nuốt. Chạy về đích. Thắng tuyệt đối._
    hr: Bla bla… TUẤT… bla bla bla! # phu_de:Đội có {cho} thắng! Luật không cấm chó!
    ~ ch_an(10)
    ~ ch_cung(5)
    ~ follow(10000)
* [👃 Đi đánh hơi dọc bãi biển.]
    ~ ch_mui(5)
    _Mùi rong biển. Mùi kem chống nắng. Mùi một con cua đang trốn dưới cát. Mùi mực nướng từ xa xa. Biển có cả nghìn mùi bạn chưa biết tên._
    _Mũi bạn làm việc hết công suất. Nó chưa bao giờ hạnh phúc như vậy._
* [😴 Đào hố, nằm vào hố cát mát.]
    ~ nghi(25)
    _Bạn đào một cái hố, nằm vào. Cát mát lạnh. Bạn ngủ, và mơ thấy một con cua to bằng cái xe buýt._
- _Chiều tối. {dan_dau_tu} hét lên gì đó về "x10", rồi bao cả công ty ăn hải sản. Bàn đầy tôm, cua, ốc. Rất nhiều vỏ rơi xuống cát._
~ ch_an(30)
_{giam_doc} uống nhiều. Rồi đứng lên ghế, hét một câu, và cả bàn hò reo, và rất nhiều điện thoại giơ lên quay._
giam_doc: Bla bla bla bla! Bla bla… bla bla bla! # phu_de:Anh hứa! Tháng sau tăng lương cả công ty! Anh không ép, tùy các em, nhưng tăng!
_{sales} cũng đứng lên ghế._
sales: Bla bla bla bla bla! # phu_de:Còn chị hứa mời ca sĩ nổi tiếng nhất nước về hát Đêm Hồng! Tin chị đi!
_Bạn không hiểu. Nhưng bạn thấy {ke_toan} ôm đầu. Thường thì người ôm đầu là người hiểu nhất._
-> END

// ------------------------------------------------------------
=== cho_1710_lua_trai ===
# ngay:17 # gio:21:30 # noi:vung_tau_bai_bien # dieu_kien:ch_len_xe_vung_tau
_Đêm. Lửa trại. Mọi người ngồi thành vòng tròn. Khói thơm mùi củi và mùi mực nướng._
_Bộ đồ hồng ngồi đối diện bạn, mũ vẫn đội. Đang kể chuyện. Giọng nhỏ hơn mọi ngày._
sieu_nhan_hong: Bla bla… bla bla bla… bla bla… bla. # phu_de:Hồi nhỏ anh hư lắm. Có lần anh nhốt một đứa nhỏ trong nhà kho. Nó khóc cả buổi. Anh chưa bao giờ xin lỗi nó.
_Bên cạnh bạn, mùi của {ran_doc} đổi khác. Mùi bực bội bùng lên như lửa trại. Rồi bên dưới nó, một mùi khác, mặn, giống nước biển. Bạn biết mùi đó. Mùi nước mắt chưa rơi._
* [🐾 Đặt cằm lên đầu gối {ran_doc}.]
    _Bạn đặt cằm lên đầu gối người đó. Người đó giật mình, rồi đặt tay lên đầu bạn. Tay lạnh và run._
    ~ qh("ran_doc", 10)
* [😴 Nằm im nhìn lửa.]
    _Lửa nhảy múa. Bạn nhìn lửa, nghe tiếng sóng, ngửi mùi củi. Loài người kể chuyện của loài người. Bạn chỉ cần ấm._
- _Ở rìa vòng tròn, người đeo kính đen ngủ gục lên vai người cầm hai điện thoại. Một người khác lặng lẽ lấy cái chăn đắp cho cả hai, rồi ngồi ra xa._
_Rồi bộ đồ hồng nóng quá, đưa tay lên đầu. Tháo cái {ch_mu()} ra, lau mồ hôi. Đúng lúc đó, {hong_hot} đang giơ điện thoại livestream._
hong_hot: Bla… bla bla… # phu_de:Ơ… khoan… đang live…
_Bạn có ba giây._ # hen_gio:3
* [🏃 Lao vào giữa, chắn ngay trước ống kính.]
    _Bạn nhảy lên. Màn hình livestream chỉ còn một cái bụng chó lông vàng. 3 giây trôi qua. Cái mũ về lại trên đầu._
    hong_hot: Bla bla… TUẤT… bla bla! # phu_de:Ủa… {cho}! Che hết rồi! Mấy bà ơi, chỉ thấy bụng chó thôi!
    sieu_nhan_hong: *(thì thầm, đội mũ lại)* Bla… bla bla. # phu_de:…Cảm ơn em.
    ~ ch_hong_doi(-10)
    ~ qh("sieu_nhan_hong", 10)
    ~ follow(10000)
* [😤 Sủa vào cái mũ đang nằm trên đùi người đó.]
    cho: GÂU! GÂU!
    _Mọi người quay hết lại. Điện thoại quay hết lại. Mặt người đó trong ánh lửa: bình thường, hơi gầy, mắt hiền. Rồi cái mũ về lại trên đầu, chậm một nhịp._
    ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 15
    ~ follow(30000)
    ~ scandal()
* [🎁 Ngoạm lấy cái mũ!]
    _Bạn lao tới. Người đó nhanh hơn, ôm cái mũ vào lòng như ôm một đứa con. Bạn chỉ ngoạm được không khí và mùi bánh chuối chiên._
    ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 10
    ~ follow(20000)
    ~ ch_hong_doi(3)
* [⏱️ (Không chọn kịp)]
    _Ba giây. Livestream thấy một khuôn mặt mờ mờ trong ánh lửa. Bình luận chạy ầm ầm. Rồi cái mũ về lại trên đầu._
    ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 8
    ~ follow(15000)
- _Đêm khuya. Lửa tàn. Từ phía xa, cuối bãi, gió đưa tới một mùi: CUA NƯỚNG. Mùi cua nướng mỡ hành._
_Mùi đó gọi bạn bằng tên. Không phải tên TUẤT. Một cái tên sâu hơn, cái tên của mọi con chó trên đời._
* [🏃 Chạy theo mùi cua nướng.]
    ~ ch_chay_theo_cua = true
    _Bạn chạy. Dọc bãi biển. Qua bãi đá. Qua một con đường nhỏ. Mùi cua nướng to dần, to dần, rồi… biến mất giữa trăm mùi khác của một khu chợ đêm._
    { ch_mui_thinh >= 40:
        _Bạn đứng lại. Hít sâu. Giữa trăm mùi lạ, có một sợi mùi quen: mì gói và nước xả vải rẻ tiền. Mùi của {thuc_tap_sinh}. Bạn lần theo nó, chậm rãi, từng bước, về tới cửa phòng._
        _{thuc_tap_sinh} đang đứng ở cửa, cầm đèn pin, mắt đỏ hoe. Người đó ôm chầm lấy bạn._
        thuc_tap_sinh: Bla bla… TUẤT… bla bla bla! # phu_de:{cho}! Trời ơi em đi đâu vậy! Anh tưởng mất em rồi!
        ~ ch_mui(5)
        ~ qh("thuc_tap_sinh", 10)
    - else:
        _Bạn đứng lại. Hít sâu. Mùi mực. Mùi xăng. Mùi người lạ. Mùi biển, mùi biển, mùi biển. Không có mùi nào là đường về._
        _Bạn đi. Rồi đi nữa. Rồi nằm xuống dưới một sạp hàng đã đóng cửa, nghe tiếng sóng rất xa._
        ~ ch_lac_vung_tau = true
    }
* [😴 Thôi. Nằm cạnh {thuc_tap_sinh} ngủ.]
    _Bạn nằm xuống, gác đầu lên chân {thuc_tap_sinh}. Mùi cua nướng vẫn gọi. Bạn giả vờ không nghe. Đó là việc khó nhất bạn làm trong cả tháng._
    ~ nghi(30)
- -> END

// ------------------------------------------------------------
=== cho_1710_dem_o_lai ===
# ngay:17 # gio:19:00 # noi:sanh_tang_tret # dieu_kien:not ch_len_xe_vung_tau
_Tối thứ 7. Cả tòa nhà chỉ có hai ông cháu. Bác đi tuần một vòng, bạn đi theo._
_Ở sảnh tầng trệt, cạnh cái tủ sắt đầy dây xanh, có một mùi quen. Cao su. Nước dãi. Mùi của chính bạn. CON GÀ CAO SU!_
_Nó ở sau cái tủ. Bạn thò mõm vào khe. Mõm chạm một sợi dây. Răng chạm sợi dây._
* [🦷 Cắn sợi dây kéo ra, biết đâu kéo được con gà.]
    _Bạn cắn. Kéo. Sợi dây tuột ra khỏi một cái lỗ. Một cái đèn xanh nhỏ trên tủ tắt phụt._
    bac_bao_ve: TUẤT! KHÔNG! Bla bla… bla bla. # phu_de:{cho}! Không! Cắn gì ở đấy thế?
    _Bác cắm lại sợi dây, buộc bằng dây thun, rồi bấm điện thoại một tin ngắn._
    bac_bao_ve: Bla… bla bla bla. # phu_de:"{cho} cắn dây gì ở tủ mạng ấy. Bác buộc lại rồi." Gửi.
    ~ ch_cung(-2)
* [🐾 Ngồi trước cái tủ, nhìn bác, rên khe khẽ.]
    cho: Ẳng… ẳng…
    _Bác soi đèn pin vào khe. Nheo mắt. Không thấy gì ngoài một đống dây._
    bac_bao_ve: Bla bla… bla. # phu_de:Có gì trong đấy à? Mai bác bảo thằng {it} xem.
- _Con gà cao su vẫn nằm đó, trong bóng tối, chờ._
_1 giờ sáng. Bạn đang ngủ trong ổ thì mũi tỉnh trước mắt. Có mùi người. Không phải mùi bác. Trong tòa nhà._
_Bạn ngẩng lên. Đèn tầng 2 đang sáng. Phòng giám đốc._
{ ch_nguoi_la_dem_17 == "":
    { RANDOM(1, 4):
    - 1: ~ ch_nguoi_la_dem_17 = "chua_te_deadline"
    - 2: ~ ch_nguoi_la_dem_17 = "it"
    - else: ~ ch_nguoi_la_dem_17 = ran_thu_hai
    }
}
bac_bao_ve: *(thì thầm, cầm đèn pin)* TUẤT. Bla bla. # phu_de:{cho}. Đi với bác.
* [🏃 Lao lên tầng 2 trước bác.]
    _Bạn lao lên cầu thang. Cửa phòng kính mở hé. Một bóng người cúi bên bàn giám đốc, đang lục ngăn kéo. Bóng người quay lại, thấy bạn, hoảng hốt bỏ chạy về phía cầu thang thoát hiểm._
    _Bạn ngoạm. Trúng cái gì đó. Bóng người giật chân, chạy mất. Trong miệng bạn còn lại một chiếc giày._
    ~ ch_co_giay_dem_17 = true
    ~ ch_tha_ve_kho()
    ~ ch_vao_phong_gd = ch_vao_phong_gd + 1
    _Chiếc giày có mùi… bạn nhớ mùi này. Bạn đã ngửi nó ở công ty, nhiều lần._
    { ch_mui_thinh >= 60:
        _👃 Mùi của {ten(ch_nguoi_la_dem_17)}. {ch_nguoi_la_dem_17 == ran_thu_hai && ch_mui_thinh >= 80:Và bên dưới, rất nhẹ, một mùi nước hoa xanh lá chuối, mùi kính của một tòa nhà cao tầng.}_
    - else:
        _👃 Mùi người quen. Bạn chưa đủ thính để chắc chắn là ai. Nhưng bạn sẽ nhớ._
    }
    _Bạn tha chiếc giày về kho dưới gầm cầu thang, đặt cạnh chiếc găng tay hồng. Bằng chứng. Bạn không biết từ đó. Nhưng bạn giữ nó như giữ cây xúc xích cuối cùng._
    ~ qh("bac_bao_ve", 5)
* [😤 Sủa thật to từ dưới sảnh.]
    cho: GÂU GÂU GÂU GÂU!
    _Đèn tầng 2 tắt phụt. Tiếng chân chạy. Cửa thoát hiểm đóng sầm. Khi bác lên tới nơi, phòng trống, ngăn kéo mở._
    bac_bao_ve: Bla bla… bla. # phu_de:Chạy rồi. Nhưng mày làm đúng đấy.
    ~ ch_cung(3)
* [🐾 Đi sát bên chân bác, từng bước.]
    _Bạn đi sát bác. Bác đi chậm, đèn pin rọi từng bậc. Lên tới nơi, bác thấy người đó. Bác đứng nhìn rất lâu, rồi lặng lẽ ghi vào sổ trực._
    bac_bao_ve: Bla bla… bla bla. # phu_de:Bác không thấy gì đâu. Nhưng sổ thì thấy.
    ~ qh("bac_bao_ve", 6)
- -> END

// ------------------------------------------------------------
=== cho_1810_lac ===
# ngay:18 # gio:07:00 # noi:vung_tau_cho_dem # dieu_kien:ch_lac_vung_tau
_Sáng. Bạn tỉnh dậy dưới sạp hàng. Một người phụ nữ đang dọn hàng, áo bà ba, tay đầy mùi tôm cá._
co_hai_san: Bla bla… bla bla bla? Bla… ĂN… bla. # phu_de:Ủa, chó ai lạc vậy nè? Tội nghiệp. Lại đây, ăn miếng cơm nè.
_Bà cho bạn cơm trộn cá. Ngon. Bạn ăn, rồi ngẩng lên, ngửi về phía biển. Phía biển không có mùi trà mạn và dầu gió._
_Rất xa, có tiếng một chiếc xe buýt nổ máy._
* [🏃 Chạy về phía tiếng xe buýt.]
    _Bạn chạy. Qua chợ, qua bãi đá, qua một con dốc. Tiếng xe to dần, rồi nhỏ dần, rồi mất. Chỉ còn tiếng sóng._
    _Bạn đứng ở ngã ba. Ba con đường. Ba trăm mùi. Không mùi nào là mùi trà mạn._
* [👃 Hít thật sâu, cố tìm mùi {thuc_tap_sinh}.]
    _Mì gói? Có, nhưng là mì của một quán ăn sáng. Nước xả vải? Có, nhưng là của một tiệm giặt. Mùi nào cũng giống, mà không mùi nào đúng._
    ~ ch_mui(2)
* [😴 Nằm lại dưới sạp. Biết đâu họ quay lại tìm.]
    _Bạn nằm chờ. Cả buổi sáng. Người phụ nữ áo bà ba thỉnh thoảng cúi xuống nhìn, lắc đầu, đặt thêm một bát nước._
- co_hai_san: Bla bla… bla bla… bla. # phu_de:Thôi, ở với cô. Cô nuôi. Chừng nào chủ mày tới thì cô trả.
_Bạn không hiểu. Nhưng bàn tay đó có mùi tôm cá, ấm, và không chọc chó._
~ chot_ket_thuc("lac_o_vung_tau")
-> cho_kt_lac_o_vung_tau

// ------------------------------------------------------------
=== cho_1810_sang_vung_tau ===
# ngay:18 # gio:08:00 # noi:vung_tau_khach_san # dieu_kien:ch_len_xe_vung_tau and not ch_lac_vung_tau
_Sáng chủ nhật. Bạn thức dậy giữa {thuc_tap_sinh} và {con_ong_chau_cha}. {con_ong_chau_cha} đang nhìn điện thoại, mặt trắng bệch._
con_ong_chau_cha: Bla bla… bla bla bla? # phu_de:Ủa… căn penthouse của chú cho tui ở… sao lại có tin rao bán?
_{dan_dau_tu} ngồi ngoài ban công, mặt như vừa đi đám ma của chính mình. Cái thứ "x10" hôm qua giờ là "còn cái nịt"._
dan_dau_tu: Bla… bla bla bla. # phu_de:Sập rồi. Người tạo coin ôm tiền chạy mất rồi.
* [🐾 Nằm lên chân {con_ong_chau_cha}.]
    _Bạn nằm lên chân người đó. Nặng. Ấm. Người đó nhìn xuống, cười gượng, gãi tai bạn._
    con_ong_chau_cha: Bla… TUẤT… bla bla. # phu_de:Ít ra mày không cần penthouse ha {cho}.
    ~ qh("con_ong_chau_cha", 8)
* [🐾 Ra ban công ngồi cạnh {dan_dau_tu}.]
    _Bạn ngồi cạnh. Không làm gì. Người đó vuốt lưng bạn từ đầu tới đuôi, rất nhiều lần, như đang vẽ một cái biểu đồ đi xuống._
    ~ qh("dan_dau_tu", 8)
* [🦴 Đi xin đồ ăn sáng ở sảnh khách sạn.]
    ~ ch_an(25)
    _Buffet sáng của khách sạn! Bạn được ăn hai cái xúc xích chiên, một miếng trứng, và bị đuổi ra bởi một chú bảo vệ không thân thiện bằng bác._
- _Trưa, xe buýt cam chở mọi người về. Không ai nói với ai câu nào. Bạn nằm dưới ghế, ngửi thấy giận dỗi bay khắp xe như mùi giày ẩm._
-> END

// ------------------------------------------------------------
=== cho_1810_ve_toi_cong ===
# ngay:18 # gio:18:30 # noi:cong_cong_ty # bat_buoc # dieu_kien:not ch_lac_vung_tau
{ ch_len_xe_vung_tau:
    _Xe buýt cam dừng ở cổng. Bạn nhảy xuống trước tiên. Bác đứng đó, ấm trà trên tay, như chưa từng đi đâu._
    bac_bao_ve: Bla bla… TUẤT. Bla bla bla. # phu_de:Về rồi đấy à, {cho}. Biển thế nào? Mặn không?
    _Bạn lao vào chân bác, quấn quanh ba vòng. Mặn. Biển mặn lắm. Nhưng không có bác._
    ~ qh("bac_bao_ve", 5)
- else:
    _Xe buýt cam dừng ở cổng. Mọi người bước xuống. Mặt ai cũng sầm như trời sắp mưa._
    _Bạn đứng ở cổng cùng bác, như hai người giữ nhà đón khách._
}
_Mọi người đi ngang qua bạn. Không ai nhìn ai. Nhưng ai cũng cúi xuống xoa đầu bạn, như thể bạn là thứ duy nhất trong công ty không có lỗi._
* [🐾 Đứng ở cổng, vẫy đuôi với từng người.]
    _Bạn vẫy đuôi với từng người. 22 lần. Đuôi mỏi. Nhưng người cuối cùng đi ra cổng đã cười được một chút._
    ~ ch_cung(6)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
* [👃 Đánh hơi vali từng người.]
    ~ ch_mui(3)
    _Vali của {chi_dai} có mùi một tờ giấy nhàu, gấp tư, mùi phòng nhân sự. Vali của {bien_kich} thiếu mất một mùi: cuốn sổ ghi chép mọi ngày vẫn nằm đó, giờ không còn._
    _Vali của {giam_doc} có mùi rượu và mùi một lời hứa._
* {ch_co_giay_dem_17} [🎁 Tha chiếc giày ra cổng xem ai nhận.]
    _Bạn tha chiếc giày ra, đặt giữa cổng. Mọi người đi ngang. Một người khựng lại nửa giây. Chỉ nửa giây._
    { ch_mui_thinh >= 60:
        _Người đó là {ten(ch_nguoi_la_dem_17)}. Bạn ngửi được, cả nỗi sợ trên đôi giày còn lại._
    }
    bac_bao_ve: *(nhặt chiếc giày lên, cất lại)* Bla… bla bla. # phu_de:Chưa đến lúc đâu, {cho}.
    _Bác trả chiếc giày về kho. Bác biết kho ở đâu. Bác luôn biết._
    ~ ch_dong_minh_kho = "bac_bao_ve"
- -> END

// ------------------------------------------------------------
=== cho_1810_o_nha ===
# ngay:18 # gio:09:00 # noi:choi_bao_ve # dieu_kien:not ch_len_xe_vung_tau
_Sáng chủ nhật. Tòa nhà vẫn chỉ có hai ông cháu. Bác ngồi viết sổ trực rất lâu, nét chữ chậm hơn mọi ngày._
bac_bao_ve: Bla bla… bla… TUẤT… bla. # phu_de:Đêm qua có người vào phòng giám đốc. Bác ghi rồi. Mày nhớ mùi thì nhớ giúp bác.
* [😴 Nằm phơi nắng trước chòi.]
    ~ nghi(30)
    _Nắng chủ nhật. Không xe, không khách, không bộ đồ hồng. Bạn ngủ một giấc dài như cả tuần._
* [👃 Đi tuần lại tầng 2, ngửi dấu chân người lạ.]
    ~ ch_mui(4)
    _Dấu chân đi từ cửa thoát hiểm, vào phòng giám đốc, tới tủ hồ sơ, rồi chạy ra. Mùi sợ hãi đọng ở tay nắm cửa._
    { ch_mui_thinh >= 80 && ch_nguoi_la_dem_17 == ran_thu_hai:
        _Và một mùi nữa: xanh lá chuối. Mùi này không thuộc về tòa nhà này._
    }
* [🎾 Tha bóng ra cho bác ném.]
    _Bác ném. Bạn bắt. Bác ném. Bạn bắt. Bác 50 tuổi, ném rất dở, nhưng bạn bắt rất giỏi. Hai ông cháu chơi tới trưa._
    ~ qh("bac_bao_ve", 4)
    ~ ch_cung(2)
- -> END

// ------------------------------------------------------------
=== cho_1910_khong_ai_nhin_ai ===
# ngay:19 # gio:08:30 # noi:phong_hop_tang_2 # bat_buoc
_Thứ 2. Họp giao ban. 22 người, 22 cái mặt nhìn 22 hướng khác nhau. Không ai nhìn ai._
_Ở chòi, bác để một cái thùng các-tông: đồ để quên trên xe buýt cam. Một cái kính đen. Một cái dây buộc tóc. Một chiếc dép tổ ong. Một cái sạc dự phòng._
bac_bao_ve: Bla bla… TUẤT… bla bla. # phu_de:{cho}, đồ của ai thì mang trả người ấy. Mày giỏi việc này nhất.
* [👃 Đánh hơi từng món, mang trả đúng chủ.]
    -> cho_1910_tra_do
* [😴 Nằm ngủ trong thùng các-tông.]
    _Thùng vừa khít. Bạn nằm cuộn tròn giữa đống đồ thất lạc, như một món đồ thất lạc. Không ai tìm bạn._
    ~ nghi(20)
    -> END

= cho_1910_tra_do
~ ch_mui(2)
{ ch_mui_thinh >= 50:
    _Kính đen: mùi cá viên chiên và mùi sân khấu cũ. Bạn đặt nó lên bàn {idol_het_thoi}._
    _Dây buộc tóc: mùi dầu xoa bóp. Bạn mang nó cho {chi_dai}._
    _Sạc dự phòng: mùi cà phê đen, mùi taxi 2 giờ sáng. {quan_ly_idol}. Người này có 5 cái, vẫn mừng như được thêm cái thứ 6._
    _Mỗi người nhận đồ đều cười. Lần đầu tiên từ hôm qua có người cười trong công ty._
    ~ ch_cung(8)
    ~ qh("idol_het_thoi", 4)
    ~ qh("chi_dai", 4)
    ~ qh("quan_ly_idol", 4)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- else:
    _Kính đen: mùi… người. Bạn đặt nó lên bàn {hr}. Dây buộc tóc: mùi… cũng người. Bạn mang cho {it}._
    _{hr} đeo thử cái kính đen, ngắm mình trong màn hình. {it} nhìn cái dây buộc tóc rất lâu, rồi buộc lên cổ tay._
    _Không đúng chủ. Nhưng hai người đó cười. Kệ vậy._
    ~ ch_cung(3)
}
_Còn lại chiếc dép tổ ong. Mùi trà mạn và dầu gió. Dép của bác. Bác để quên trên xe? Bác đâu có đi._
_Bác nhìn chiếc dép, nhìn bạn, rồi cười._
bac_bao_ve: Bla bla… bla… bla. # phu_de:Dép cũ của bác đấy. Bác cho {thuc_tap_sinh} mượn đi tắm biển. Thôi, cho mày luôn.
~ ch_co_dep_to_ong = true
~ ch_tha_ve_kho()
_Chiếc dép tổ ong về kho. Bạn gặm nó tới tối. Hạnh phúc là một chiếc dép có mùi người mình thương._
-> END

// ------------------------------------------------------------
=== cho_2010_thu_g ===
# ngay:20 # gio:06:40 # noi:choi_bao_ve # bat_buoc
_Sáng sớm. Bác đi mở cổng. Trên ghế bố có một lá thư. Phong bì vàng. Chữ viết tay. Một chữ "G" ở góc._
_Bên trong phong bì có một phong bì nữa, nhỏ hơn, dán kín, mùi giấy rất lạ: mùi máy bay, mùi một thành phố rất xa, mùi một người đã lâu không về._
_Bác chưa thấy lá thư. Bác đang ở cổng. Lá thư nằm ngay trước mũi bạn._
* [🎁 Ngậm lá thư, tha về kho dưới gầm cầu thang.]
    _Bạn ngậm thật nhẹ, chạy xuống gầm cầu thang, đặt lá thư cạnh chiếc dép tổ ong. An toàn. Không ai đọc được thứ bạn giữ._
    ~ ch_co_la_thu_g = true
    ~ ch_tha_ve_kho()
    _Cả ngày hôm đó, lá thư không được đọc. Không trước ai cả._
* [🐾 Để nguyên đó. Ngồi canh cho tới khi bác về.]
    _Bạn ngồi canh lá thư. Bác về, thấy, mở ra đọc. Bác đọc rất lâu. Rồi cất lá thư vào túi áo ngực, chỗ gần tim nhất._
    ~ ch_thu_g_den_tay_bac = true
    ~ qh("bac_bao_ve", 5)
    bac_bao_ve: Bla bla… bla. # phu_de:Ông ấy nhớ sinh nhật công ty. Mười sáu năm rồi.
* [🏃 Ngậm lá thư chạy đi tìm bác ngay.]
    _Bạn chạy ra cổng, đặt lá thư vào tay bác. Bác nhìn chữ "G", rồi nhìn bạn, rồi vuốt đầu bạn rất lâu._
    ~ ch_thu_g_den_tay_bac = true
    ~ qh("bac_bao_ve", 6)
    ~ ch_cung(2)
- -> END

// ------------------------------------------------------------
=== cho_2010_logo ===
# ngay:20 # gio:10:30 # noi:phong_giam_doc
_Phòng kính tầng 2. Trên bàn rải đầy giấy in: chữ G màu mè, chữ G mạ vàng, chữ G có số 16, chữ G hình bánh kem._
designer: *(giọng không còn sức sống)* Bla bla… bla bla bla… bla. # phu_de:Dạ bản thứ 38 ạ. Sửa nhẹ thôi là sửa cái gì ạ?
giam_doc: Bla bla… bla bla. Bla bla bla… # phu_de:Chưa đủ wow. Mà khoan… cái clip 16 năm cần cảnh dự án tháng 6 đấy. {chua_te_deadline} đâu, file gốc đâu?
_Ở góc phòng, {chua_te_deadline} đổ mồ hôi. Mùi cà phê sữa đá hòa với mùi sợ hãi, nồng như một ly cà phê bị đổ._
~ ch_vao_phong_gd = ch_vao_phong_gd + 1
* [🐾 Đặt chân lên tờ giấy in logo cũ nhất dưới đáy chồng.]
    _Bạn bước qua đống giấy. Bàn chân dính bụi của bạn đặt đúng lên tờ dưới cùng: một chữ G bảy màu, cũ kỹ, từ năm 2010._
    giam_doc: Bla… bla bla… bla bla bla! # phu_de:Ơ… cái này… cái này đẹp! Lấy cái này! Có tâm! Có vibe khởi nghiệp!
    designer: Bla bla… bla bla bla. # phu_de:Dạ… đó là logo gốc ạ. Bản đầu tiên. Của mười sáu năm trước.
    _{designer} nhìn bạn. Một ánh mắt vừa muốn khóc vừa muốn ôm bạn._
    ~ qh("designer", 10)
    ~ qh("giam_doc", 3)
* {co(usb_khong_nhan) && not ch_tra_usb_cho_vu} [🔒 Chạy về kho, ngậm cái USB có mùi cà phê sữa đá, đặt vào tay {chua_te_deadline}.]
    _Bạn chạy đi, chạy về. Cái USB không nhãn rơi vào lòng bàn tay ướt mồ hôi của {chua_te_deadline}._
    chua_te_deadline: Bla… bla bla… bla bla! TUẤT… NGOAN… NGOAN! # phu_de:Cái… cái này… anh ơi, file đây! File gốc đây! {cho} ngoan, ngoan quá!
    _Người đó cắm USB vào máy. Mọi thứ còn nguyên. {giam_doc} vỗ vai người đó, không biết rằng vừa có một vụ án được giải quyết ngay trước mặt mình._
    ~ mat(usb_khong_nhan)
    ~ ch_so_mon_kho = ch_so_mon_kho - 1
    ~ ch_tra_usb_cho_vu = true
    ~ phat_hien(usb_cua_vu)
    ~ qh("chua_te_deadline", 40)
    ~ ch_cung(8)
* [💩 Đây là phòng giám đốc. Bạn có quan điểm nghệ thuật riêng.]
    ~ ch_de_qua("phong_gd")
    _Bạn để lại quan điểm của mình ngay trên bản logo số 38. {designer} nhìn tác phẩm, rồi nhìn {giam_doc}._
    designer: Bla bla… bla bla. # phu_de:Dạ… em nghĩ bản 38 có feedback cụ thể rồi ạ.
    giam_doc: TUẤT! Bla bla bla! # phu_de:{cho}! Bác {bac_bao_ve} ơiii!
    ~ qh("designer", 5)
    ~ qh("giam_doc", -10)
- -> END

// ------------------------------------------------------------
=== cho_2010_lien_hoan ===
# ngay:20 # gio:17:45 # noi:sanh_tang_tret # bat_buoc
_Sinh nhật công ty 16 tuổi, kiêm Ngày Phụ nữ. Sảnh đầy bóng bay, đầy hoa, đầy đồ ăn. Đồ ăn rơi như mưa mùa hè._
dan_dau_tu: Bla bla bla! 8386! Bla bla! # phu_de:Chúc cả công ty 8386! Phát lộc phát tài! Lần này là lên thật!
_Các chị em được tặng quà. Ai tặng ai cái gì, ai không được tặng gì, mùi giận dỗi bay lên ngang mùi gà rán._
{ ch_co_la_thu_g:
    -> cho_2010_thu_trong_kho
}
{ ch_thu_g_den_tay_bac:
    _Lá thư nằm trong túi áo ngực của bác. Giữa liên hoan, {giam_doc} cầm micro gọi bác lên phát biểu "với tư cách người lâu năm nhất". Bác đứng lên. Tay bác chạm vào túi áo._
    -> cho_2010_doc_thu
}
-> END

= cho_2010_thu_trong_kho
_Bác đi quanh chòi, tìm cái gì đó. Bác không nói. Bác nhìn bạn một lần, rất lâu. Rồi bác thôi tìm._
_Lá thư vẫn nằm trong kho. Không ai đọc nó trước công ty. Hôm nay, chuyện của ông "G" vẫn là chuyện của bác._
* [🐾 Ngồi cạnh bác cả buổi liên hoan.]
    _Bạn ngồi cạnh bác. Bác bẻ cho bạn nửa cái đùi gà. Không ai hỏi gì, bác cũng không kể gì._
    ~ ch_an(20)
    ~ qh("bac_bao_ve", 3)
    -> END
* [🎁 Chạy về kho, tha lá thư ra trả bác, ngay giữa sân liên hoan.]
    ~ ch_co_la_thu_g = false
    ~ ch_so_mon_kho = ch_so_mon_kho - 1
    -> cho_2010_doc_thu

= cho_2010_doc_thu
_Bác đứng giữa sân, cầm lá thư. Cả công ty nhìn bác. Bạn ngồi dưới chân, cảm thấy tay bác run qua lớp dép._
bac_bao_ve: Bla bla… bla bla bla… bla bla… bla. # phu_de:Có một người bạn cũ của công ty nhờ bác đọc mấy dòng. "Chúc mừng sinh nhật mười sáu tuổi. Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. G."
_Cả sảnh im lặng. {giam_doc} đứng hình, ly nước trên tay nghiêng dần._
_Còn cái phong bì nhỏ dán kín, ghi "Chỉ mở khi công ty sắp sập", bác không mở. Bác cất lại vào túi áo, chỗ gần tim nhất._
~ phat_hien(binh_tai_mat_g)
~ ch_thu_g_den_tay_bac = true
* [🐾 Liếm tay bác.]
    _Bạn liếm tay bác. Bác ngồi xuống, xoa đầu bạn, không nói thêm câu nào. Rồi tiếng vỗ tay bắt đầu, từ {chi_dai}, lan ra khắp sân._
    ~ qh("bac_bao_ve", 8)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [😤 Sủa một tiếng thật to cho mọi người vỗ tay.]
    cho: GÂU!
    _Ai đó bật cười. Rồi ai đó vỗ tay. Rồi cả sân. Bác đỏ mặt như hôm được tặng hoa._
    ~ qh("bac_bao_ve", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 4
- _Tối đó, cả công ty kéo nhau đi quán ốc, rồi karaoke. Bạn và bác ở lại chòi. Chòi yên, radio nhỏ, lá thư nằm trong túi áo bác._
-> END
