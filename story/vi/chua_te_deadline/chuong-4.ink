// ============================================================
// CHÚA TỂ DEADLINE · CHƯƠNG 4: "DEADLINE TRÊN BÃI BIỂN" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== chua_te_deadline_1710_xe_khach ===
# ngay:17 # gio:06:30 # noi:cong_cong_ty # bat_buoc
_6 giờ 30 sáng thứ 7. Xe khách 29 chỗ nổ máy trước cổng. {chi_dai} đứng ở cửa xe cầm danh sách, mặt của người sẽ bỏ lại bất kỳ ai._
_Bạn tới lúc 6 giờ 31, tay ôm laptop, sau lưng là balo chỉ có đúng 1 cái áo và 2 cục sạc._
chi_dai: Một phút. Lần này chị tha. Lên.
_Trong đầu bạn: hồ sơ xin phép biểu diễn Đại Nhạc Hội Siêu Nhân. Hạn 8 giờ sáng thứ 2. Số chữ đã viết: 0._
* [💻 Ngồi cuối xe, mở laptop làm luôn.]
    _Xe chạy. Laptop rung theo ổ gà. Câu đầu tiên bạn gõ được là "Kính gửi Ủy ban phường Tân Draaaaaaaaa" vì xe vừa xóc._
    ~ vu_nuoc(-10)
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
    _Đến trạm dừng chân, hồ sơ được 4 trang. Bạn bị say xe. Đáng._
    ~ nghi(-10)
* [😴 Ngủ. "Tới Vũng Tàu làm."]
    ~ nghi(25)
    ~ vu_nuoc(5)
    _Bạn ngủ ngon lành, đầu dựa vào cửa kính. Tỉnh dậy thấy trên vai có một cái gối cổ hồng ai đó đã kê vào từ lúc nào._
    ~ vu_qua_hong++
    ~ vu_tin(3)
* [🎤 Tham gia trò hát karaoke trên xe do {hr} tổ chức.]
    hr: Mời em {chua_te_deadline}! Mình cùng nhau gắn kết nha em!
    _Bạn hát "Công Viên". Cả xe hát theo đoạn "chuối chiên". {idol_het_thoi} ngồi đầu xe, đeo kính đen, nhưng nhịp chân theo._
    ~ qh("hr", 5)
    ~ qh("idol_het_thoi", 3)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1710_toilet_wifi ===
# ngay:17 # gio:15:10 # noi:khu_nghi_duong_vung_tau # bat_buoc
_Khu nghỉ dưỡng. Cả công ty đang chơi trò "kéo co gắn kết" ngoài bãi biển. Còn bạn đang ngồi trên nắp bồn cầu toilet sảnh, vì đây là chỗ wifi mạnh nhất cả khu._
_Hồ sơ: 9 trang. Bản vẽ sân khấu: chưa có. Wifi: 4 vạch. Cuộc đời: tạm ổn._
_Cốc cốc cốc._
hr: Em {chua_te_deadline}? Anh biết em trong đó. Anh chỉ muốn lắng nghe em thôi. Mọi người đang kéo co thiếu một người. # hen_gio:6
* [🧻 "Dạ em… đau bụng anh. Hải sản Vũng Tàu nó mạnh quá."]
    { RANDOM(1, 10) <= 5:
        hr: Ừ. Anh hiểu. Anh để thuốc ngoài cửa nha em.
        _{hr} để lại một gói thuốc và một tờ giấy: "Mình cùng nhìn lại bữa trưa nha em." Bạn làm thêm được 40 phút._
        ~ vu_nuoc(-10)
    - else:
        hr: Em chưa ăn trưa mà em. Anh có danh sách ăn trưa.
        _Bạn bị lôi ra kéo co. Đội bạn thua. {chi_dai} ở đội bên kia, kéo một mình như ba người._
        ~ qh("hr", -5)
        ~ nghi(-15)
    }
* [😇 Mở cửa, nói thật: "Em đang làm hồ sơ xin phép Đại Nhạc Hội, hạn sáng thứ 2."]
    hr: *(nhìn laptop, nhìn bạn)* … Ừ. Vậy em làm đi. Anh ghi em là "đang gắn kết với công việc".
    ~ qh("hr", 8)
    ~ vu_nuoc(-15)
    ~ uy_tin = uy_tin + 3
* [🐢 "Anh ơi, slogan công ty là 'Việc hôm nay cứ để ngày mai tính'. Kéo co để mai kéo được hông anh?"]
    ~ vu_trich_slogan++
    hr: *(im lặng 5 giây, rồi cười)* Ngày mai mình về rồi em. Nhưng anh thích câu trả lời đó. Anh ghi lại.
    ~ qh("hr", -3)
* [⏱️ (Không chọn kịp)]
    hr: Anh đếm tới 3 nha em. 1… 2…
    _Bạn mở cửa trước khi {hr} đếm tới 3. Nụ cười của {hr} vẫn y nguyên. Đáng sợ y nguyên._
    ~ nghi(-10)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1710_nhau_toi ===
# ngay:17 # gio:18:30 # noi:quan_hai_san_vung_tau
_Bữa tối ở quán hải sản Sóng Vỗ. {sales} đã uống tới ly thứ 5 và bắt đầu nói chuyện như chủ tịch tập đoàn._
sales: Tin chị đi! Đại Nhạc Hội chị mời ca sĩ nổi tiếng nhất nước về hát! Chị quen hết mà! No cap!
_{giam_doc} đứng dậy, ly bia trên tay, mặt đỏ như bộ đồ của Siêu Nhân Hồng._
giam_doc: Các em! Anh tuyên bố! Nếu chiến dịch thành công, anh tăng lương cả công ty!
_{hong_hot} giơ điện thoại lên. Đèn quay đỏ. {thanh_ninh} vỗ tay. {ke_toan} để ly xuống, mặt tái._
* [📝 Ghi vào bảng tiến độ: "Ca sĩ nổi tiếng nhất nước: {sales} lo. Hạn: 31/10."]
    sales: *(tỉnh rượu 30%)* Ủa… ông ghi thiệt hả?
    ~ qh("sales", -5)
    _Bạn đã học được một điều từ {truong_phong}: cái gì ghi vào bảng thì người ta sợ._
* [🍻 "Anh {giam_doc}, nói lại câu đó vào camera của {hong_hot} đi anh!"]
    giam_doc: Tăng lương! Tăng hết! Anh không ép, tùy… à không, anh ép!
    ~ follow(8000)
    ~ qh("giam_doc", 3)
    ~ qh("ke_toan", -5)
* [🦐 Lo ăn. Tôm hùm không chờ ai.]
    ~ an(70)
    _Bạn ăn ba con tôm, hai con ghẹ, một đĩa sò điệp. Một ngày nào đó, ai đó sẽ phải trả tiền cho bữa này. Hôm nay không phải bạn._
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1710_lua_trai ===
# ngay:17 # gio:20:00 # noi:bai_bien_vung_tau # bat_buoc
_20 giờ. Lửa trại trên bãi biển. Trò "nói thật": chai nước xoay vào ai, người đó phải nói một điều thật lòng._
_{sieu_nhan_hong} kể trước, giọng nhỏ dần: hồi nhỏ từng nhốt một đứa nhóc trong nhà kho. Cả đám im lặng. Ở góc, {ran_doc} bóp nát một con mực nướng._
_Chai nước xoay. Dừng lại ở {sieu_nhan_hong} lần nữa. Lần này {sieu_nhan_hong} tháo mũ ra. Không ai nói gì. Lửa bập bùng._
sieu_nhan_hong: Người anh thích… là người lúc nào cũng tới phút chót mới tới. Mà tới là làm mọi thứ đẹp hết.
_Cả đám quay sang nhìn bạn. Tất cả. Kể cả ông bán bắp nướng đi ngang._
_Trong đầu bạn: "Thoại hay ghê, ai viết vậy ta. Chắc {bien_kich}."_
_Cùng lúc đó, {hong_hot} đang livestream. Camera đang chĩa đúng vào gương mặt không mũ của {sieu_nhan_hong}._ # hen_gio:3
* [🧯 Đứng dậy, chắn trước ống kính của {hong_hot}.]
    _Lưng bạn chiếm trọn khung hình. 4.000 người xem livestream thấy đúng một cái lưng áo thun cam._
    hong_hot: Ông làm gì vậy?!
    _Bạn không trả lời. {sieu_nhan_hong} đội mũ lại. Nhìn lưng bạn rất lâu._
    ~ vu_tin(15)
    ~ qh("sieu_nhan_hong", 15)
    ~ qh("hong_hot", -5)
* [😅 "Hay ghê. Ai viết thoại vậy? Chị {bien_kich} hả?"]
    bien_kich: Ủa? Tui đâu có viết. Mà… câu đó hay thiệt. Tui mượn nha.
    _{sieu_nhan_hong} cười, đội mũ lại. Nụ cười lần này không tới được mắt._
    ~ vu_tin(-10)
    ~ qh("bien_kich", 3)
* [😶 Nhìn xuống đống lửa. Không nói gì.]
    _Bạn không nói gì. Nhưng tối đó bạn không mở Tóp-tóp lần nào._
    ~ vu_tin(8)
* [⏱️ (Không chọn kịp)]
    _3 giây. Livestream có đủ 3 giây. Gương mặt thật của Siêu Nhân Hồng nằm trong máy của 4.000 người._
    ~ follow(30000)
    ~ scandal()
    ~ vu_tin(2)
- _Phía bên kia đống lửa, {idol_het_thoi} đã ngủ gục lên vai {quan_ly_idol}. {editor} lặng lẽ lấy chăn đắp cho cả hai, rồi về chỗ ngồi, nhìn biển._
_Bạn nhìn {editor}. {editor} nhìn bạn. Hai người hiểu nhau theo kiểu của những người thức khuya._
-> END

// ------------------------------------------------------------
=== chua_te_deadline_1710_dem_sanh ===
# ngay:17 # gio:23:50 # noi:khu_nghi_duong_vung_tau
_Gần nửa đêm. Cả đoàn đã ngủ. Bạn ngồi ở sảnh khách sạn, laptop mở, hồ sơ được 11 trang. Còn bản vẽ sân khấu._
_Có tiếng dép lẹp xẹp. {sieu_nhan_hong} đi xuống, không mũ, mặc áo thun, tay cầm hai ly mì._
sieu_nhan_hong: Ờm… anh đoán em chưa ngủ. Mì nè.
* [🍜 "Cảm ơn anh. Ngồi đi."]
    ~ an(30)
    _Hai người ăn mì. {sieu_nhan_hong} nhìn bạn vẽ sơ đồ sân khấu. Tới chỗ cầu thang lên sân khấu, {sieu_nhan_hong} nói nhỏ: "Chỗ này để rộng ra, có người già lên tặng hoa thì dễ đi."_
    _Bạn sửa theo. Bản vẽ đẹp hơn hẳn._
    ~ vu_tin(10)
    ~ vu_nuoc(-10)
* [💬 "Câu lúc nãy… anh {quan_ly_idol} bày hả anh?"]
    sieu_nhan_hong: *(đặt ly mì xuống)* Anh {quan_ly_idol} mà biết anh nói câu đó trước cả đám chắc ảnh ngất. Ảnh đang ngủ trên lầu kìa.
    _Câu đó làm bạn khựng lại. Rồi bạn lại nghĩ: "Nghệ sĩ giỏi là nghệ sĩ nói dối mà mặt không đổi."_
    ~ vu_tin(4)
* [😎 "Em đang chạy deadline, anh để mì đó, mai em ăn."]
    sieu_nhan_hong: À… ừ. Anh để đây nha. Chill nha em.
    _Sáng hôm sau, ly mì nở thành một khối. Bạn vẫn ăn._
    ~ vu_tin(-3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1810_ve_thanh_pho ===
# ngay:18 # gio:15:00 # noi:xe_khach # bat_buoc
_Xe về thành phố. Trên xe ai cũng giận ai: phòng xếp sai, clip {giam_doc} say bị chia sẻ, {sales} không dám nhìn ai. {dan_dau_tu} ôm đầu: Hồng Coin vừa về 0._
dan_dau_tu: Còn cái nịt. Người tạo ôm tiền chạy mất rồi. Hôm qua tui mới bao cả đám ăn hải sản…
_Còn bạn, lần đầu tiên trong đời, đang vui: hồ sơ xin phép biểu diễn đã xong trên xe. 14 trang. Đủ con dấu (sáng mai đi đóng)._
{ vu_nuoc_toi_chan >= 60:
    _À không. Mới xong 12 trang. Bản vẽ sân khấu còn thiếu lối thoát hiểm. Tối nay phải làm._
}
* [📤 Gửi bản nháp cho {chi_dai} góp ý trước.]
    chi_dai: *(đọc trên điện thoại, 5 phút)* Thiếu lối thoát hiểm. Thiếu chỗ để xe cứu thương. Còn lại được. Giỏi.
    _"Giỏi" từ {chi_dai} bằng một tấm bằng khen._
    ~ qh("chi_dai", 8)
    ~ vu_ho_so_phuong = true
    ~ vu_nuoc(-10)
* [🤝 Ngồi cạnh {dan_dau_tu}, nghe anh kể.]
    dan_dau_tu: Em biết hông, anh tính lời được thì trả nợ hết cả công ty… Thiệt đó.
    _Bạn không nói gì. Bạn đưa anh nửa gói bánh. {dan_dau_tu} ăn, mắt đỏ hoe._
    ~ qh("dan_dau_tu", 10)
* [📱 Lướt Tóp-tóp xem "Khoai Chiên" đã thành meme tới đâu.]
    ~ vu_gio_luot = vu_gio_luot + 2
    ~ vu_chuoi_ngay_it_luot = 0
    _Có người làm hẳn bài remix "Khoai Chiên Thái Độ". Nó hay một cách đáng sợ._
    { RANDOM(1, 10) <= 5:
        _Bạn gửi cho {hong_hot}: "Đu trend này đi, cho anh Hồng nhảy theo." Ăn ngay._
        ~ follow(15000)
    }
    ~ vu_ho_so_phuong = true
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1810_bida_toi ===
# ngay:18 # gio:21:30 # noi:quan_bida_co_ban
_Chủ nhật, tối. Quán bida vắng. {con_ong_chau_cha} ngồi một mình ở bàn số 3, điện thoại mở một trang rao bán nhà: "Penthouse Sky Ảo tầng 30, chính chủ bán gấp"._
con_ong_chau_cha: Penthouse của anh đó. Chú anh rao bán mà không nói anh một tiếng.
* [🎱 "Đánh một ván cho quên hông ông?"]
    _Hai người đánh bida tới 23 giờ. {con_ong_chau_cha} đánh dở tệ, nhưng cười được ba lần._
    ~ qh("con_ong_chau_cha", 10)
    ~ vu_nuoc(5)
* [💬 "Ông muốn ở đó thiệt hông, hay chỉ quen ở đó?"]
    con_ong_chau_cha: … *(im lâu)* Hỏi gì kỳ vậy. Chill đi.
    _Nhưng {con_ong_chau_cha} úp điện thoại xuống bàn và không mở lại._
    ~ qh("con_ong_chau_cha", 8)
* [😴 "Tui lên ngủ, mai nộp hồ sơ phường lúc 8 giờ."]
    con_ong_chau_cha: Ờ. Ông có deadline cũng sướng. Có cái để chạy theo.
    ~ nghi(20)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1910_nop_ho_so ===
# ngay:19 # gio:07:40 # noi:uy_ban_phuong # bat_buoc
_7 giờ 40 sáng thứ 2. Trước cửa Ủy ban phường Tân Drama. Hạn chót: 8 giờ._
{ vu_ho_so_phuong:
    _Bạn cầm tập hồ sơ 14 trang. Đủ dấu. Đủ bản vẽ. Có cả lối thoát hiểm._
    _Cô cán bộ phường lật một lượt, đóng dấu "Đã nhận". 7 giờ 52._
    ~ uy_tin = uy_tin + 10
    ~ vu_nuoc(-10)
    -> chua_te_deadline_1910_nop_xong
- else:
    _Bạn cầm tập hồ sơ 9 trang. Thiếu bản vẽ. Thiếu dấu. Có một trang in nhầm meme mèo._
    -> chua_te_deadline_1910_nop_thieu
}

= chua_te_deadline_1910_nop_xong
_Bạn đứng trước cửa phường, hít một hơi. Nắng sớm. Lần đầu tiên bạn nộp một thứ trước hạn 8 phút mà không ai bắt._
* [📸 Chụp tờ biên nhận gửi {truong_phong}.]
    truong_phong: Tớ… tớ không biết nói gì. Tớ sẽ ghi nhận vào biên bản giao ban.
    ~ qh("truong_phong", 8)
* [☕ Đi uống cà phê, không khoe ai.]
    ~ uong(25)
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
- -> END

= chua_te_deadline_1910_nop_thieu
_Cô cán bộ nhìn tập giấy. Nhìn bạn. Nhìn cái meme mèo._ # hen_gio:6
* [🙏 "Cô cho con bổ sung tới 17 giờ chiều nay được hông cô?"]
    _Cô thở dài, viết lên tờ giấy: "Bổ sung trước 17:00"._
    ~ vu_nuoc(15)
    ~ cang_thang(15)
    _Chiều đó bạn chạy như bay, nộp lúc 16 giờ 58._
    ~ vu_ho_so_phuong = true
* [📞 Gọi {chi_dai} cầu cứu.]
    chi_dai: Đứng yên đó. 10 phút.
    _9 phút sau {chi_dai} phóng xe tới, tay cầm bản vẽ sân khấu đã vẽ sẵn từ… năm ngoái. Cô cán bộ phường chào {chi_dai} bằng tên._
    ~ vu_ho_so_phuong = true
    ~ qh("chi_dai", 3)
    ~ uy_tin = uy_tin - 5
* [⏱️ (Không chọn kịp)]
    _Hồ sơ bị trả. Đại Nhạc Hội Siêu Nhân phải xin phép lại, có nguy cơ dời địa điểm. {giam_doc} gọi bạn 7 cuộc trong 10 phút._
    ~ uy_tin = uy_tin - 15
    ~ vu_nuoc(20)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_1910_giao_ban_im_lang ===
# ngay:19 # gio:09:00 # noi:phong_hop_sang_tao
_Họp giao ban sau Vũng Tàu. Không ai nhìn mặt ai. {hong_hot} không nói câu nào, chuyện chưa từng có trong lịch sử. {giam_doc} nhìn trần nhà._
truong_phong: Mai 20/10. Sinh nhật công ty và ngày Phụ nữ. {chua_te_deadline}, clip 16 năm thế nào?
{ vu_co_file:
    _Bạn có file. Bạn chỉ cần gật đầu._
    truong_phong: Tốt. Đây là lần đầu tiên tớ không phải hỏi lần hai.
    ~ qh("truong_phong", 5)
    -> END
}
~ vu_lo_file = vu_lo_file + 10
* [🧯 "Dạ… đang chờ {editor} xuất bản cuối."]
    editor: *(ngáp, không phản đối, cũng không đồng ý)*
    { vu_linh_giu_bi_mat:
        _{editor} không nói gì. Đó là cách {editor} giữ bí mật._
    - else:
        ~ vu_lo_file = vu_lo_file + 10
    }
* [😇 "Anh ơi, em xin 5 phút sau họp, em nói riêng."]
    truong_phong: *(sáng mắt)* Sau họp à? Một cuộc họp riêng à? Được!
    _Sau họp, bạn nói với {truong_phong} là file gốc "có vấn đề kỹ thuật". {truong_phong} nghe xong, ghi chú, rồi đặt thêm một cuộc họp "giải quyết vấn đề kỹ thuật"._
    ~ vu_lo_file = vu_lo_file + 5
    ~ qh("truong_phong", 5)
* [🙈 Giả vờ ngủ gật vì "Vũng Tàu mệt quá".]
    ~ vu_so_lan_ne_nhat++
    truong_phong: Cậu đang ngủ hay đang trốn?
    _Bạn ngáy nhẹ, rất thuyết phục._
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2010_cho_hoa ===
# ngay:20 # gio:07:45 # noi:cho_pho_cu # bat_buoc
_7 giờ 45 sáng 20/10. Bạn chợt nhớ ra: phải mua quà cho các chị em trong phòng. 15 phút nữa vào làm._
_Chợ hoa Phố Cũ đông như hội. Các cô bán hoa nhìn bạn như nhìn một đơn hàng 15 phút._
* [💐 Mua 7 bó hồng giống nhau, tốc độ ánh sáng.]
    ~ tien_cong(-350000)
    ~ nhan(hoa_hong)
    _Bảy bó hồng. Bạn chạy về công ty, 7 giờ 59. Đưa từng bó. {ke_toan}, {chi_dai}, {designer}, {bien_kich}, {hong_hot}, {sales}, {thanh_ninh}. Cả bảy nhận, cả bảy nhìn nhau: giống hệt._
    ke_toan: Hóa đơn đâu em? À, quà mà. Chị đùa. Cảm ơn em.
    ~ qh("ke_toan", 5)
    ~ qh("chi_dai", 5)
    ~ qh("designer", 5)
    ~ qh("hong_hot", 5)
* [🌷 Mua mỗi người một kiểu hoa hợp tính.]
    ~ tien_cong(-450000)
    _Hướng dương cho {chi_dai}. Cúc trắng cho {ke_toan}. Một chậu sen đá cho {designer} vì "nó không cần sửa". Bạn trễ 7 phút._
    ~ tien_cong(-50000)
    designer: *(cầm chậu sen đá, cười)* Lần đầu có người tặng tui thứ không cần sửa.
    ~ qh("designer", 12)
    ~ qh("chi_dai", 8)
    ~ qh("ke_toan", 8)
    ~ qh("bien_kich", 5)
* [🙏 Nhắn {thuc_tap_sinh}: "Anh đang ở đâu, mua giùm em mấy bó hoa…"]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    thuc_tap_sinh: Dạ em đang ở chợ hoa nè anh! Em mua cho cả phòng rồi ạ!
    _{thuc_tap_sinh} đã mua quà cho tất cả chị em từ 6 giờ sáng. Khăn lụa. Nước hoa thật. Bạn nhìn túi quà của {thuc_tap_sinh}, rồi nhìn túi rỗng của mình._
    ~ qh("thuc_tap_sinh", -3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2010_clip_16_nam ===
# ngay:20 # gio:10:30 # noi:sanh_tang_tret # bat_buoc
_Sinh nhật công ty 16 tuổi. Cả công ty tụ ở sảnh. Màn chiếu đã dựng. Bản đầy đủ của video "16 năm" {editor} còn đang dựng, để dành mở màn Đại Nhạc Hội 31/10. Sáng nay chỉ chiếu đoạn mở đầu một phút. {giam_doc} cầm micro, mắt long lanh._
giam_doc: Và bây giờ… một phút đầu tiên của "16 năm {cong_ty}"!
{ vu_co_file:
    ~ vu_file_truoc_2010 = true
    _Cảnh drone bay qua cầu lúc hoàng hôn. Nhạc lên. Hình ảnh 2010, căn phòng 20 mét vuông. Rồi màn hình tắt, hiện dòng chữ: "Còn tiếp: 31/10"._
    _{giam_doc} khóc. {bac_bao_ve} đứng ở cửa, không khóc, nhưng không uống trà._
    ~ follow(10000)
    ~ qh("giam_doc", 15)
    ~ uy_tin = uy_tin + 10
- else:
    _Màn chiếu hiện lên… ảnh chụp điện thoại. Ảnh tiệc tất niên. Ảnh {giam_doc} cầm cúp golf. Chuyển cảnh kiểu "trái tim bay". Nhạc nền là nhạc đám cưới._
    _{hong_hot} lỡ đăng lên page trước khi kịp xem. Bình luận đầu tiên: "Như slide đám cưới."_
    ~ follow(-10000)
    ~ vu_lo_file = vu_lo_file + 15
    giam_doc: *(cười gượng)* … Cảnh drone đâu em?
}
_Bác {bac_bao_ve} đứng ở góc sảnh, tay cầm một lá thư tay ký chữ "G" tới sáng nay, và một phong bì dán kín ghi "Chỉ mở khi công ty sắp sập". Bác nói tối nay ở quán ốc mới đọc._
-> END

// ------------------------------------------------------------
=== chua_te_deadline_2010_thu_g ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_18 giờ 30, Quán Ốc Đêm. Cả công ty kéo bàn dài. Bác {bac_bao_ve} đứng dậy, lá thư ký "G" trên tay. Bác nhìn quanh bàn, chưa mở._
bac_bao_ve: Thư của ông G gửi các cháu. Bác… đọc hay không đọc, các cháu bảo bác.
_Cả bàn nhìn nhau. {giam_doc} tái mặt. Mọi ánh mắt đổ về phía người điều phối mọi thứ: bạn._
* [😇 "Bác đọc đi bác. Hôm nay sinh nhật mà."]
    _Bác đọc: "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui. Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. G."_
    _Cả quán lặng đi. Bạn nghe câu "ngày mai thì phải có" và thấy như ai vừa đọc tên mình._
    ~ qh("bac_bao_ve", 8)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ vu_nuoc(-5)
* [😶 "Chuyện này để anh {giam_doc} quyết ạ."]
    giam_doc: Bác cứ… cứ cất đi đã. Để hôm khác.
    _Bác {bac_bao_ve} gật đầu, cất thư vào túi áo. Cái phong bì dán kín vẫn dán kín._
* [💬 "Bác ơi, cái phong bì kia khi nào mới mở được bác?"]
    bac_bao_ve: Khi nào công ty sắp sập. Mà bác mong là không bao giờ.
    ~ qh("bac_bao_ve", 3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2010_karaoke ===
# ngay:20 # gio:21:00 # noi:karaoke_chu_sau
_21 giờ. Sau quán ốc là Karaoke Chú Sáu. {giam_doc} say, cầm micro hát lạc 4 tông, rồi dừng nhạc giữa chừng._
giam_doc: Anh hứa! Tháng 11 anh tăng lương 20%! Cả công ty!
_Lần thứ hai trong tháng {giam_doc} hứa tăng lương khi say. Lần này {thanh_ninh} quay lại bằng hai máy._
_Trong góc phòng, trên ghế sofa, một hộp cơm màu hồng. Mẩu giấy: "Hôm nay sinh nhật công ty. Producer ăn chưa?"_
~ vu_qua_hong++
* [🍱 Ra hành lang ăn hộp cơm, nhắn lại: "Ăn rồi. Ngon. Cảm ơn anh."]
    ~ an(45)
    sieu_nhan_hong: *(nhắn lại sau 2 giây, rồi thu hồi, rồi nhắn lại)* Dạ… ờm. Hông có gì!
    ~ vu_tin(8)
* [🎤 Giành micro hát "Công Viên" bản "khoai chiên".]
    _Cả phòng cười lăn. {idol_het_thoi} hát bè. {giam_doc} quên mất mình vừa hứa gì._
    ~ cang_thang(-15)
    ~ qh("idol_het_thoi", 5)
* [📝 "Anh {giam_doc}, em ghi lời hứa vào bảng tiến độ nha anh."]
    giam_doc: Ghi! Ghi đi em! Anh ký luôn! *(ký vào tờ giấy ăn)*
    _Tờ giấy ăn có chữ ký giám đốc. Bạn gấp lại, bỏ túi. Ai biết được._
    ~ qh("ke_toan", -3)
- -> END
