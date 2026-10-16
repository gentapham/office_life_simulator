// ============================================================
// GIÁM ĐỐC · CHƯƠNG 4: "SẾP ĐI BIỂN" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== giam_doc_1710_xe_khach ===
# ngay:17 # gio:06:30 # noi:cong_cong_ty # bat_buoc
_6:30 sáng thứ 7. Team building Vũng Tàu. {hr} trình ngân sách 120 triệu, {ke_toan} gạch còn 60. Xe khách hạng sang thành xe khách thường._
hr: Anh ơi, mình chọn xe 45 chỗ hay 29 chỗ ạ? 29 chỗ thì rẻ hơn 4 triệu, nhưng có người phải ngồi ghế phụ.
ke_toan: 60 triệu là 60 triệu nha anh. Em không duyệt thêm đồng nào.
* [💼 "Xe 45 chỗ. Anh bù 4 triệu tiền túi."]
    ~ gd_xe_45_cho = true
    ~ tien_cong(-4000000)
    ~ gd_uy(5)
    ~ qh("hr", 5)
    _Xe rộng. Ai cũng có ghế. {cho} cũng có ghế. Không ai mời nó, nó tự lên._
* [🪑 "29 chỗ. Ghế phụ anh ngồi."]
    ~ gd_uy(10)
    ~ qh("ke_toan", 10)
    ~ nghi(-15)
    _Ba tiếng ngồi ghế phụ cạnh tài xế. Ổ gà nào bạn cũng biết tên._
    chi_dai: *(nói với cả xe)* Sếp ngồi ghế phụ đó. Đứa nào kêu chật nữa thì xuống đi bộ.
* [🙅 "29 chỗ. Ai đến muộn thì ngồi ghế phụ. Anh không ép, tùy các em."]
    ~ gd_tuy_em("chua_te_deadline")
    _Người đến muộn là {chua_te_deadline}. Tất nhiên. {chua_te_deadline} ngủ suốt ba tiếng trên ghế phụ, đầu tựa vào vai tài xế._
- -> END

// ------------------------------------------------------------
=== giam_doc_1710_bit_mat_bat_sep ===
# ngay:17 # gio:15:00 # noi:vung_tau
_Bãi biển Vũng Tàu. Trò chơi tập thể của {hr}: "Bịt Mắt Bắt Sếp". Bạn là sếp. Cả công ty bịt mắt, đuổi theo tiếng còi của bạn._
hr: Luật chơi: ai bắt được sếp được nói thật với sếp một câu, không bị trừ lương!
_Hai mươi người bịt mắt lao về phía bạn như sóng thần._
* [🏃 Chạy hết sức. Sếp không thể bị bắt.]
    _Bạn chạy, vấp phải lâu đài cát của một đứa trẻ, ngã sấp mặt. Người bắt được bạn là {thuc_tap_sinh}._
    thuc_tap_sinh: Dạ… em xin nói một câu ạ. Anh… anh đừng nhắn tin lúc 10 giờ đêm nữa được không ạ? Em sợ lắm ạ.
    ~ qh("thuc_tap_sinh", 5)
    ~ cang_thang(5)
* [🧍 Đứng im. Cho bắt.]
    _Người chạm vào bạn đầu tiên là {chi_dai}. Tháo khăn bịt mắt, nhìn bạn._
    chi_dai: Nói thật nha: anh họp ngắn lại, mọi người thương anh nhiều hơn.
    ~ qh("chi_dai", 10)
    ~ gd_uy(5)
* [🌊 Chạy ra biển.]
    _Không ai dám đuổi. Bạn đứng giữa sóng, ướt tới cổ, thổi còi. Cả công ty cười bò ra bãi cát._
    ~ gd_uy(5)
    ~ cang_thang(-15)
    ~ follow(5000)
    hong_hot: Sếp ơi em quay rồi nha! Clip này viral chắc luôn!
- -> END

// ------------------------------------------------------------
=== giam_doc_1710_nhau_hai_san ===
# ngay:17 # gio:19:30 # noi:vung_tau
_Quán hải sản ven biển. Bàn dài, bia lạnh. {dan_dau_tu} vừa bao cả team vì Hồng Coin tăng x10. {sales} đã say._
sales: Mọi người nghe nè! Đại Nhạc Hội chị… à em mời ca sĩ nổi tiếng nhất nước về hát! Tin em đi! Chắc kèo!
_Cả bàn vỗ tay. Rồi tất cả quay sang bạn. Ly bia thứ năm trong tay bạn._
thanh_ninh: Sếp ơi sếp nói một câu đi sếp! Một câu thôi!
* [🍻 Đứng lên: "Tháng sau… tháng sau anh tăng lương cho cả nhà!"]
    ~ gd_hua()
    ~ gd_clip_vung_tau = true
    ~ gd_uy(15)
    _Cả quán reo. Có ít nhất 6 cái điện thoại đang quay._
    hong_hot: Em lưu clip rồi nha sếp! Sếp hứa rồi nha!
* [🎤 "Anh không hứa. Anh kể chuyện năm 2010 nhé…"]
    ~ gd_uy(-3)
    _Bạn kể lần thứ 41. Cả bàn lặng lẽ nâng ly uống tiếp, không đợi bạn kể xong._
* [🥤 Đổi bia sang trà đá: "Anh tỉnh để còn trông các em."]
    ~ gd_uy(5)
    ~ qh("chi_dai", 5)
    ~ qh("ke_toan", 5)
    thanh_ninh: Ôi sếp tỉnh táo có tâm quá anh ơi!
    _{sales} vẫn hứa thêm hai ca sĩ nữa. Không ai cản được._
- ~ an(60)
-> END

// ------------------------------------------------------------
=== giam_doc_1710_lua_trai ===
# ngay:17 # gio:22:00 # noi:vung_tau # bat_buoc
_Đêm lửa trại. Gió biển lạnh. {sieu_nhan_hong} vừa kể xong một chuyện hồi nhỏ: từng nhốt một đứa nhỏ trong nhà kho, lỗ thông gió hình con cá. Giọng nhỏ dần._
_Ở góc kia, {idol_het_thoi} ngủ gục trên vai {quan_ly_idol}. {editor} lặng lẽ đắp một cái chăn cho cả hai._
_{hong_hot} đang livestream. Đúng lúc đó, gió giật. {sieu_nhan_hong} đưa tay lên… tháo mũ ra lau mồ hôi._
_Ba giây. Ống kính của {hong_hot} chĩa thẳng vào._ # hen_gio:3
* [🙋 Đứng bật dậy, che trước ống kính: "Ê, chai nước đâu nhỉ?!"]
    _Màn hình livestream chỉ thấy lưng áo của bạn. 1.200 người xem bình luận "ai vậy trời"._
    ~ qh("sieu_nhan_hong", 25)
    ~ qh("hong_hot", -5)
* [😶 Không làm gì.]
    _Livestream bắt được nửa khuôn mặt. Mờ, tối, nhưng đủ để mạng xã hội bàn tán cả tuần._
    ~ follow(50000)
    ~ scandal()
    ~ qh("sieu_nhan_hong", -10)
* [⏱️ (Không chọn kịp)]
    _Livestream bắt được nửa khuôn mặt. {sieu_nhan_hong} vội đội mũ, tay run run._
    ~ follow(50000)
    ~ scandal()
    ~ qh("sieu_nhan_hong", -5)
- _Rồi tới trò "nói thật". Chai nước ngọt xoay. Dừng lại ở bạn._
hr: Sếp nói thật một chuyện đi sếp!
* [😮‍💨 Nói thật chuyện nợ: "Công ty đang nợ ngân hàng. Anh đã thế chấp biệt thự để trả lương các em."]
    ~ gd_noi_that_lua_trai = true
    ~ phat_hien(the_chap_biet_thu)
    ~ gd_no(25)
    ~ gd_uy(15)
    _Lửa trại nổ lách tách. Hai mươi người im lặng. Sóng biển nghe rõ từng đợt._
    chi_dai: … Vậy tháng này, tụi em làm cho thật.
    hong_hot: *(tắt livestream, lần đầu tiên tự tắt)*
    ~ qh("hong_hot", 10)
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("ke_toan", 10)
* [🙊 Nói thật một chuyện nhỏ: "Anh không biết đánh golf. Anh thua có tính toán là… thua thật đấy."]
    _Cả đám cười lăn ra cát. {chua_te_deadline} cười tới sặc nước._
    ~ gd_uy(5)
    ~ cang_thang(-10)
* [🎤 Kể chuyện khởi nghiệp lần thứ 40.]
    _Tới đoạn "căn phòng 20 mét vuông", một nửa đã ngủ. Nửa kia giả vờ ngủ._
    ~ gd_uy(-5)
- -> END

// ------------------------------------------------------------
=== giam_doc_1810_ve_thanh_pho ===
# ngay:18 # gio:16:00 # noi:xe_khach # bat_buoc
_Trên xe về thành phố. Hồng Coin vừa sập về 0, người tạo ôm tiền biến mất. {dan_dau_tu} ngồi nhìn cửa sổ, im như tượng._
_Không ai nói với ai. Ai cũng đang giận ai về một chuyện gì đó tối qua._
_Điện thoại bạn rung. {con_ong_chau_cha}._
con_ong_chau_cha: Chú ơi… con vừa thấy penthouse của con, à của chú, được rao bán trên mạng. Chú bán hả chú?
* [😮‍💨 "Ừ. Chú rao. Chú cần tiền trả lãi. Chú xin lỗi cháu."]
    con_ong_chau_cha: *(im lặng rất lâu)* … Phòng thu của con trong đó.
    giam_doc: Phòng thu? Phòng nào?
    con_ong_chau_cha: … Thôi, để con tự lo. Con lớn rồi chú.
    ~ qh("con_ong_chau_cha", 10)
    ~ gd_no(10)
    ~ gd_tien_cty(0)
* [🎭 "Môi giới đăng nhầm thôi. Cháu cứ ở đấy."]
    ~ gd_hua()
    con_ong_chau_cha: Dạ… chill.
    _Giọng nó không chill chút nào._
* [💬 Quay sang {dan_dau_tu}: "Ông mất bao nhiêu?"]
    dan_dau_tu: Còn cái nịt anh ạ. Mà đây là đáy. Đáy thật rồi.
    giam_doc: Ông nợ nửa công ty đúng không?
    dan_dau_tu: *(giật mình)* … Anh biết hả?
    ~ qh("dan_dau_tu", 5)
    _Hai người đàn ông 37 tuổi ngồi cạnh nhau, cùng đang nợ, cùng nhìn ra cửa sổ. Không ai nói gì thêm._
- -> END

// ------------------------------------------------------------
=== giam_doc_1810_bao_cao_cua_bac ===
# ngay:18 # gio:19:00 # noi:choi_bao_ve
_Xe về tới công ty. Bác {bac_bao_ve} đứng chờ ở cổng, tay cầm đèn pin, {cho} đứng cạnh._
bac_bao_ve: Cậu {giam_doc}. Đêm qua cả công ty đi vắng, bác ở lại trực. Hai giờ sáng có người trong phòng giám đốc.
_Ngăn kéo thứ ba bàn bạn bị mở. Giấy tờ ngân hàng vẫn còn, nhưng bị xếp lại sai thứ tự._
* [😨 "Ai ạ? Bác thấy mặt không?"]
    bac_bao_ve: Tối quá. Bác chỉ ngửi thấy mùi nước hoa. Xanh xanh, như lá chuối.
    ~ gd_no(10)
    ~ cang_thang(15)
    _Lá chuối. Màu của LL-Entertainment._
* [☕ Ngồi xuống uống trà với bác trước đã.]
    ~ gd_tra_binh = gd_tra_binh + 1
    ~ qh("bac_bao_ve", 5)
    bac_bao_ve: Người lạ thì bác đuổi rồi. Người quen thì… bác không thấy gì đâu.
    _Bác nói chậm. Bạn hiểu bác đang để bạn tự đoán._
    ~ gd_no(5)
* [🔐 "Mai cháu thay khóa. Bác đừng nói với ai."]
    bac_bao_ve: Ừ. Bác không nói với ai ở đây.
    _"Ở đây". Bạn không để ý hai chữ đó._
    ~ gd_no(5)
- -> END

// ------------------------------------------------------------
=== giam_doc_1910_giao_ban_lanh ===
# ngay:19 # gio:08:30 # noi:phong_hop_tang_2 # bat_buoc
_Thứ Hai sau Vũng Tàu. Họp giao ban. Không ai nhìn mặt ai. {designer} ngồi xa {bien_kich} nhất có thể._
_Mai là sinh nhật công ty 16 tuổi. Bạn cần một logo kỷ niệm._
designer: Dạ, logo kỷ niệm 16 năm, em làm 3 phương án rồi ạ.
* [🎨 "Chưa đủ wow. Em sửa thêm vài bản nữa."]
    designer: Sửa nhẹ thôi là sửa cái gì ạ?
    giam_doc: Wow hơn. Hồng hơn. Nhưng vẫn phải cam.
    ~ qh("designer", -10)
    _Tối đó {designer} vẽ tới bản thứ 37._
* [✅ "Phương án 2. Chốt luôn. Không sửa."]
    designer: *(đứng hình)* … Anh nói lại được không ạ? Em muốn ghi âm.
    ~ qh("designer", 20)
    ~ gd_sua("ke_chuyen")
* [🗣️ "Trước khi bàn logo, anh xin lỗi vì Vũng Tàu. Có gì chưa vui, nói thẳng với anh."]
    _Im lặng. Rồi {chi_dai} nói. Rồi {hong_hot} nói. Cuộc họp dài 2 tiếng, nhưng lần đầu là 2 tiếng của mọi người, không phải của bạn._
    ~ gd_uy(10)
    ~ qh("chi_dai", 5)
    ~ qh("hong_hot", 5)
- -> END

// ------------------------------------------------------------
=== giam_doc_2010_la_thu_g ===
# ngay:20 # gio:07:45 # noi:choi_bao_ve # bat_buoc
_Sáng 20/10. Sinh nhật công ty 16 tuổi. Bạn đi ngang chòi bảo vệ. Bác {bac_bao_ve} đang đọc một lá thư tay. Cuối thư, một chữ ký: "G"._
_Nét chữ đó. Nét chữ đã viết "Nhận" trên hồ sơ xin việc của bạn năm 2010._
_Trên bàn còn một phong bì dán kín, ghi: "Chỉ mở khi công ty sắp sập"._
* [💬 "Bác {bac_bao_ve}… thư của anh Genta ạ?"]
    bac_bao_ve: *(gấp thư lại)* Ừ. Tháng nào cũng có. Cậu không biết à?
    giam_doc: Mười năm nay… anh ấy không viết cho cháu lá nào.
    bac_bao_ve: Thế à. Có khi người ta chờ cậu viết trước.
    ~ phat_hien(binh_tai_mat_g)
    ~ qh("bac_bao_ve", 5)
* [🙈 Giả vờ không thấy. Đi thẳng lên tầng 2.]
    ~ gd_no(5)
    _Cả buổi sáng, bạn ký nhầm hai tờ trình._
* [🎤 "Bác ơi, tối nay bác đọc thư trước cả công ty được không? Sinh nhật mà."]
    { qh_bac_bao_ve >= 30:
        bac_bao_ve: … Ừ. Đoạn nào đọc được thì bác đọc.
        ~ gd_doc_thu_g = true
    - else:
        bac_bao_ve: Thư người ta gửi bác. Đọc hay không, bác tự biết.
        _Bác cất lá thư vào tủ gỗ nhỏ, khóa lại._
    }
- -> END

// ------------------------------------------------------------
=== giam_doc_2010_qua_20_10 ===
# ngay:20 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Ngày Phụ nữ Việt Nam. Bạn phải mua quà cho 7 chị em: {thanh_ninh}, {hong_hot}, {ke_toan}, {bien_kich}, {designer}, {sales}, {chi_dai}. Bằng tiền túi. Ví hiện có: {tien} đồng._
* [🌹 Mua 7 bó hồng giống hệt nhau.]
    ~ gd_qua_20_10 = "giong_nhau"
    ~ tien_cong(-210000)
    designer: Hoa giống nhau hết hả anh? *(chụp ảnh đăng story: "quà sếp, bản sao số 7")*
    sales: Năm ngoái cũng hoa hồng.
    ~ qh("designer", -3)
    ~ qh("sales", -3)
* [🎁 Mua 7 món khác nhau, mỗi người một món hợp ý.]
    ~ gd_qua_20_10 = "khac_nhau"
    ~ tien_cong(-1500000)
    _Kính lúp mới cho {ke_toan}. Sổ da cho {bien_kich}. Bộ đàm xịn cho {chi_dai}. Ring light cho {hong_hot}…_
    ~ qh("ke_toan", 10)
    ~ qh("chi_dai", 10)
    ~ qh("bien_kich", 5)
    ~ qh("hong_hot", 5)
    _Đến trưa, group "Hội Anti Sếp" đã có bảng so sánh giá từng món. {thanh_ninh} được cái túi xách, đắt nhất. Drama "ai được quà xịn hơn" kéo dài tới 3 giờ chiều._
    ~ qh("thanh_ninh", 15)
    ~ qh("designer", -5)
    ~ qh("sales", -5)
* [💌 Viết tay 7 tấm thiệp, mỗi tấm một điều cảm ơn thật.]
    ~ gd_qua_20_10 = "thiep"
    ~ tien_cong(-70000)
    ~ cang_thang(5)
    _Bạn viết 3 tiếng. Tấm của {ke_toan}: "Cảm ơn em đã đọc trang 47 thay anh." Tấm của {chi_dai}: "Cảm ơn em đã hỏi anh trong thang máy."_
    ~ qh("ke_toan", 15)
    ~ qh("chi_dai", 10)
    ~ qh("thanh_ninh", -5)
    ~ gd_uy(5)
* [🙅 "Năm nay công ty tặng chung một bánh kem. Anh không ép, tùy các em ăn hay không."]
    ~ gd_qua_20_10 = "khong_mua"
    ~ gd_so_lan_tuy_em = gd_so_lan_tuy_em + 1
    ~ gd_uy(-10)
    _Bánh kem ngon. Nhưng không ai chụp ảnh._
- -> END

// ------------------------------------------------------------
=== giam_doc_2010_sinh_nhat_16 ===
# ngay:20 # gio:16:00 # noi:phong_hop_tang_2 # bat_buoc
_Tiệc sinh nhật công ty 16 tuổi. Phòng họp treo bóng cam và hồng. Trên màn hình là logo kỷ niệm._
designer: Dạ, đây là bản sửa thứ 37 ạ.
giam_doc: … Em mở lại bản đầu tiên năm 2010 xem nào.
_Chữ G 7 màu, nét vẽ tay hơi run. Bản gốc. Lần sửa thứ 38: quay về bản đầu tiên._
* [✅ "Bản gốc. Không sửa nữa. Xin lỗi em, 37 lần."]
    designer: *(thở ra, nửa khóc nửa cười)* Hết cứu… mà em cảm ơn anh.
    ~ qh("designer", 15)
* [🎨 "Bản gốc, nhưng thêm chút hồng."]
    designer: *(gục mặt xuống bàn)*
    ~ qh("designer", -10)
- editor: Còn clip "16 năm" ạ… *(ngáp)* em thiếu cảnh dự án quảng cáo tháng 6. File gốc… không còn.
chua_te_deadline: *(nhìn đi chỗ khác, lướt Tóp-tóp rất chăm chú)*
* [🔍 "{chua_te_deadline}. File tháng 6 là em giữ đúng không?"]
    chua_te_deadline: Dạ… còn sớm mà anh. Chill, kịp hết.
    ~ qh("chua_te_deadline", -5)
    _Không ai tin. Clip "16 năm" chiếu thiếu một đoạn, chỗ đó {editor} chèn một con cú._
* [🤝 "Không sao. Chiếu những gì mình có. Mười sáu năm, thiếu một cảnh cũng được."]
    ~ qh("editor", 10)
    ~ qh("chua_te_deadline", 10)
- { gd_doc_thu_g:
    _Cuối tiệc, Bác {bac_bao_ve} đứng lên, cầm lá thư. Cả phòng im._
    bac_bao_ve: G gửi các cháu. "Mười sáu năm rồi. Các cháu còn đi làm với nhau là tôi mừng. Nhờ bác để ý giùm tôi, sổ sách dạo này có ổn không."
    _Ở bàn bên, {ke_toan} đánh rơi ly nước. Bác {bac_bao_ve} nhìn {ke_toan}. Rồi nhìn bạn. Bác gấp một đoạn lại, không đọc._
    ~ gd_no(10)
    ~ qh("bac_bao_ve", 5)
- else:
    _Cuối tiệc, Bác {bac_bao_ve} chỉ đứng lên chúc một câu: "Sinh nhật vui vẻ." Lá thư vẫn trong túi áo bác._
}
~ follow(10000)
~ an(30)
-> END

// ------------------------------------------------------------
=== giam_doc_2010_quan_oc_karaoke ===
# ngay:20 # gio:21:00 # noi:karaoke # bat_buoc
_Tăng một ở Quán Ốc Đêm, tăng hai ở Karaoke Hát Cho Nhau Nghe. Bạn đã uống 5 ly. Đèn nháy bảy màu như logo công ty._
thanh_ninh: Sếp ơi, hôm nay sinh nhật công ty mà sếp nói câu nào cũng chuẩn quá anh ơi! Sếp nói thêm một câu nữa đi sếp!
sales: Tin em đi anh, chỉ cần anh hứa một câu là năm sau cả công ty cày gấp đôi, chắc kèo!
* [🍻 Nâng ly: "Tháng sau anh tăng lương 20% cho cả nhà!"]
    ~ gd_hua_tang_luong_20 = true
    ~ gd_hua()
    ~ gd_uy(25)
    _Cả phòng karaoke nổ tung. {hong_hot} quay clip ba góc. {ke_toan} ở góc phòng bấm máy tính bỏ túi, mặt trắng bệch._
    ke_toan: *(nói nhỏ)* Hai mươi phần trăm. Hai mốt người. Anh tính chưa anh?
* [🎤 "Anh không hứa. Anh hát một bài thay lời muốn nói." (Hát "Công Viên")]
    _Bạn cầm micro. Hát lạc tông câu đầu tiên. Rồi {idol_het_thoi} cầm micro thứ hai, song ca._
    ~ qh("idol_het_thoi", 15)
    ~ follow(8000)
    _Ai cũng quay clip. Clip không có lời hứa nào. Chỉ có hai người đàn ông hát về cá viên chiên._
* [🥤 Đổi ly bia lấy ly trà đá: "Mai còn kiểm tra thuế, anh tỉnh để lo cho các em."]
    ~ qh("chi_dai", 10)
    ~ gd_uy(5)
    chi_dai: *(gật đầu)*
    thanh_ninh: Ôi sếp tỉnh táo có tâm quá anh ơi!
    _Thật ra bạn không biết mai có kiểm tra thuế. Bạn chỉ nói bừa. Hai ngày sau bạn mới biết mình nói trúng._
- -> END

// ------------------------------------------------------------
=== giam_doc_2010_tra_dem ===
# ngay:20 # gio:23:00 # noi:choi_bao_ve # dieu_kien:sau_tiec
_Tàn tiệc. Bạn đi bộ về công ty lấy xe. Chòi bảo vệ còn sáng đèn, dù Bác {bac_bao_ve} thường ngủ lúc 9 giờ._
bac_bao_ve: *(rót trà, chậm rãi)* Cậu {giam_doc} ngồi đây. Sáng nay cậu nhìn lá thư này mãi. Có một đoạn nhắc tới cậu. Đọc hay không là việc của cậu.
~ gd_tra_binh = gd_tra_binh + 1
* [📖 Đọc đoạn bác chỉ.]
    ~ gd_doc_thu_g = true
    ~ phat_hien(binh_tai_mat_g)
    _"{bac_bao_ve}, mấy đứa nhỏ còn thương nhau không? {giam_doc} làm giám đốc 10 năm rồi. Nó có chuyện gì khó thì bảo nó nói với tôi một câu. — G."_
    _Bạn đọc ba lần. Ly trà nguội từ lúc nào._
    giam_doc: Bác ơi… anh ấy biết rồi, đúng không ạ?
    bac_bao_ve: Bác không biết người ta biết gì. Bác chỉ biết người ta đang chờ.
    ~ gd_no(-5)
    ~ qh("bac_bao_ve", 10)
* [🙈 "Bác cất đi giúp cháu. Hết tháng cháu đọc."]
    ~ gd_cat_thu_g = true
    bac_bao_ve: Ừ. Thế cũng được.
    _Bác cất lá thư vào tủ gỗ. Tiếng khóa kêu "cạch"._
    ~ gd_no(5)
* {gd_tham_nha_binh} [🔒 "Bác {bac_bao_ve}… bác viết thư cho Genta về cháu à?"]
    bac_bao_ve: Bác không thấy gì đâu. Nhưng bác không nói dối cậu bao giờ.
    ~ gd_nguoi_giu_chia_khoa = true
    ~ gd_doc_thu_g = true
    ~ phat_hien(binh_tai_mat_g)
    _Bác đẩy lá thư sang. Rồi đẩy thêm một tờ giấy trắng và một cây bút._
    bac_bao_ve: Thư gửi đi mất năm ngày. Cậu muốn viết thì viết.
- -> END
