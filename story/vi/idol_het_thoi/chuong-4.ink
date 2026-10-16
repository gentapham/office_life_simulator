// ============================================================
// IDOL HẾT THỜI · CHƯƠNG 4: "VŨNG TÀU KHÔNG AI NHẬN RA" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== idol_het_thoi_1710_xe_di_vung_tau ===
# ngay:17 # gio:06:30 # noi:xe_khach # bat_buoc
_Ngày Quốc tế Xóa nghèo. 6 giờ 30 sáng, xe khách 29 chỗ đậu trước cổng công ty. {dan_dau_tu} lên xe tuyên bố: "Từ hôm nay tui thoát nghèo. Hồng Coin x10 rồi!"_
_{hr} cầm danh sách xếp chỗ. Bạn lên trễ nhất, như một ngôi sao. Còn ba ghế trống._
* [🕶️ Ngồi một mình ghế cuối, kính đen, tai nghe.]
    _Bạn nghe lại "Công Viên" bản 2015 bốn lần. Ở ghế trên, {chua_te_deadline} và {sieu_nhan_hong} chia nhau một tai nghe. Bạn tăng âm lượng._
    ~ phat_tt(5)
    ~ cang_thang(5)
* [💬 Ngồi cạnh anh {quan_ly_idol}.]
    _Anh {quan_ly_idol} đang nghe hai cuộc gọi cùng lúc, mỗi tai một máy. Bạn ngồi xuống, anh dịch sang nhường chỗ dù ghế còn rộng._
    _Qua khỏi trạm thu phí, cả hai máy cùng hết pin. Anh ngủ gục lên cửa kính. Bạn lấy áo khoác của mình kê giữa đầu anh và cửa kính._
    ~ qh("quan_ly_idol", 10)
    ~ phat_tt(-3)
* [🍌 Ngồi cạnh {sieu_nhan_hong}, chìa ra một bịch chuối chiên.]
    sieu_nhan_hong: Ủa anh {idol_het_thoi}! Anh mua cho em hả? *(cầm bằng hai tay)* Dạ em cảm ơn! Chuối là thái độ!
    _{sieu_nhan_hong} hỏi bạn đủ thứ: cách lấy hơi, cách cúi chào, cách nhìn ống kính mà không run. Bạn trả lời hết. Ba tiếng trôi qua nhanh như một bài hát._
    ~ qh("sieu_nhan_hong", 12)
    { phat_tinh_tuong <= 60:
        ~ phat_day_nguyen = true
        ~ follow(15000)
    }
    ~ phat_tt(-5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1710_ca_vien_bai_bien ===
# ngay:17 # gio:10:30 # noi:bai_bien_vung_tau
_Bãi Sau, Vũng Tàu. Bạn đeo kính đen ra biển. Đi dọc bãi hai lần. Không ai xin chụp hình. Một nhóm học sinh đi ngang, xin chụp với {sieu_nhan_hong} ở phía sau lưng bạn._
_Một cô bán cá viên chiên dạo đẩy xe ngang qua, dừng lại, nheo mắt nhìn bạn._
co_ca_vien: Con giống thằng ca sĩ hồi xưa ghê. Bài gì mà có cá viên chiên đó. Cô bán cá viên mười năm, ngày nào cũng có đứa hát bài đó chọc cô.
* [💸 "Cô ơi, con mua hết xe."]
    co_ca_vien: Hết hả con? Hai trăm cây xiên đó!
    _Bạn trả 400 nghìn. Rồi đứng giữa bãi biển, phát cá viên chiên cho cả công ty, cho mấy em học sinh, cho cả một chú cứu hộ._
    ~ tien_cong(-400000)
    ~ nhan(ca_vien_chien)
    ~ an(30)
    ~ qh("thuc_tap_sinh", 3)
    ~ qh("chi_dai", 3)
    ~ qh("hong_hot", 3)
    ~ phat_nt(1)
    _Một em học sinh hỏi: "Anh là ai vậy anh?" Bạn chưa kịp trả lời, cô bán cá viên đã nói: "Ca sĩ đó con. Hát bài cá viên."_
* [🎤 Hát cho cô nghe một đoạn: "Ngày xưa có đôi bạn thân bán cá viên chiên…"]
    co_ca_vien: *(cười, vỗ đùi)* Đó! Đó! Bài đó! Trời đất, thiệt là con hả?
    _Cô cho bạn ba xiên, không lấy tiền. Mắt cô sáng như được gặp người nhà._
    ~ an(15)
    ~ phat_nt(2)
    ~ phat_tt(-5)
* [🕶️ "Dạ hông phải con. Con chỉ giống thôi."]
    co_ca_vien: Ờ, vậy hả. Giống ghê. Thôi con ăn hông?
    _Bạn lắc đầu. Cô đẩy xe đi. Tiếng rao "cá viên chiên đây" nhỏ dần. Bạn đứng đó, kính đen, giữa nắng._
    ~ phat_tt(3)
    ~ cang_thang(8)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1710_nhau_toi ===
# ngay:17 # gio:19:00 # noi:nha_hang_vung_tau
_Tiệc nướng hải sản. Hôm nay Hồng Coin x10, {dan_dau_tu} bao cả team ăn ghẹ. Ai cũng gọi thêm, không ai hỏi coin là gì._
_{sales} đã say. Đứng lên ghế._
sales: Mọi người nghe chị nói nè! Đại Nhạc Hội chị mời ca sĩ nổi tiếng nhất nước về hát! Tin chị đi! Chắc kèo!
_Cả bàn quay sang nhìn bạn. Rồi quay đi chỗ khác, như thấy mình vừa nghĩ sai._
_{giam_doc} cũng đã say, giơ ly bia lên:_
giam_doc: Anh hứa! Tháng sau… tăng lương… cả công ty! Anh không ép, tùy các em… à không, anh hứa!
_{hong_hot} đang quay clip. Ai cũng thấy {hong_hot} đang quay clip. Trừ {giam_doc}._
* [🕶️ Đứng dậy: "Ca sĩ nổi tiếng nhất nước đang ngồi đây nè."]
    sales: *(nheo mắt nhìn bạn, nấc)* Ủa… ờ… chắc… cũng được!
    _Cả bàn vỗ tay. Vỗ tay vì vui, không phải vì tin. Bạn biết. Bạn vẫn ngồi xuống với cái mặt của người thắng._
    ~ phat_tt(8)
    ~ qh("sales", 3)
* [💬 Ngồi xuống cạnh {giam_doc}: "Anh say rồi. Mà hợp đồng em… anh tính chưa?"]
    giam_doc: *(vỗ vai bạn, mạnh)* {idol_het_thoi} à. Em là thằng em của anh. Anh tính rồi. Tính… mai anh tính.
    _Rồi anh {giam_doc} gục đầu xuống bàn, ngủ. Tay vẫn đặt trên vai bạn._
    ~ qh("giam_doc", 5)
    ~ cang_thang(5)
* [😇 Lấy ly bia khỏi tay {giam_doc}, đổi thành ly nước lọc.]
    _{giam_doc} uống ly nước lọc, khen "bia này mát". {chi_dai} nhìn bạn, gật đầu một cái rất nhỏ._
    ~ qh("chi_dai", 8)
    ~ qh("giam_doc", 3)
    ~ phat_tt(-3)
- ~ an(50)
~ uong(30)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1710_lua_trai ===
# ngay:17 # gio:20:00 # noi:lua_trai_vung_tau # bat_buoc
_Đêm lửa trại. Gió biển. {it} lo loa kéo, chỉnh âm cho bạn hát "Công Viên". Lần đầu tiên sau mười năm có người chỉnh âm cho bạn đàng hoàng._
idol_het_thoi: Ủa, em là thằng nhỏ bị điện giật ở hội chợ năm đó hả?
it: …Ừ. Năm 2016. Anh hát tiếp đi.
~ qh("it", 8)
_Hát xong, tới lượt {sieu_nhan_hong} kể chuyện. {sieu_nhan_hong} ngồi sát lửa, giọng nhỏ hơn mọi ngày._
sieu_nhan_hong: Hồi nhỏ… em từng nhốt một đứa nhỏ trong nhà kho. Nó khóc cả buổi. Em không nhớ tên nó. Em chỉ nhớ cái lỗ thông gió hình con cá.
_{sieu_nhan_hong} đưa tay tháo mũ để lau mắt. {hong_hot} đang livestream, điện thoại chĩa đúng về phía lửa._
_Bạn ngồi ngay giữa hai người. Ba giây._ # hen_gio:3
* [🎤 Đứng bật dậy, che ống kính, hát to: "NGÀY XƯA CÓ ĐÔI BẠN THÂN…"]
    _Cả đống lửa hát theo. Livestream của {hong_hot} chỉ thấy lưng áo sơ mi lụa của bạn. Sau lưng bạn, {sieu_nhan_hong} đội mũ lại._
    ~ qh("sieu_nhan_hong", 15)
    ~ qh("hong_hot", -3)
    ~ phat_tt(-5)
* [😤 Nghiêng người, để camera thấy rõ.]
    _Livestream bắt được 1 giây mặt {sieu_nhan_hong}, mờ, ngược sáng. Không ai nhìn rõ. Nhưng bình luận nổ tung: "Mặt thật kìa!!!"_
    ~ phat_gianh()
    ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
    ~ follow(-20000)
    ~ scandal()
    ~ qh("sieu_nhan_hong", -15)
    ~ qh("quan_ly_idol", -10)
* [😶 Nhìn xuống cát.]
    _{hong_hot} tự hạ điện thoại xuống. Livestream chỉ thấy cát. 2.000 người xem cát._
* [⏱️ (Không chọn kịp)]
    _Bạn còn đang nghĩ thì một cơn gió biển thổi bay khói lửa trại về phía {hong_hot}. Livestream chỉ thấy khói. Trời cứu._
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1710_vai_thai ===
# ngay:17 # gio:23:20 # noi:lua_trai_vung_tau # bat_buoc
_Lửa tàn dần. Mọi người về phòng gần hết. Anh {quan_ly_idol} ngồi cạnh bạn, rất lâu, nhìn đống lửa, như sắp nói gì đó. Hai điện thoại úp xuống cát._
_Bạn đã uống năm lon bia. Hay bảy._
quan_ly_idol: {idol_het_thoi} nè… mười một năm rồi đó em. Có lúc nào em muốn bỏ hông?
* [🕶️ "Bỏ gì anh? Fan em đông lắm mà."]
    _Anh {quan_ly_idol} cười. Im lặng. Ngọn lửa nổ lách tách._
    ~ phat_tt(5)
* [📖 "Có. Tối nào em cũng muốn bỏ. Mà sáng ra thấy anh gọi là em lại đi."]
    _Anh {quan_ly_idol} quay mặt đi chỗ khác. Rất lâu. Lâu tới mức bạn tưởng anh không nghe._
    quan_ly_idol: *(giọng hơi khàn)* …Ừ. Vậy thì mai anh gọi tiếp.
    ~ qh("quan_ly_idol", 20)
    ~ phat_tt(-10)
* [😴 Ngáp, tựa đầu lên vai anh: "Cho em mượn vai xíu…"]
    quan_ly_idol: *(ngồi thẳng lưng, không dám nhúc nhích)* …Ừ.
    ~ qh("quan_ly_idol", 10)
- _Bạn không nhớ mình ngủ lúc nào. Chỉ nhớ đầu mình nghiêng dần, chạm vào một bờ vai gầy, ấm._
_Ở bên kia đống lửa, {editor} nhìn thấy hết. {editor} đứng dậy, về phòng, mang ra một cái chăn, đắp lên cho cả hai người. Rồi đi ngủ trước._
_Anh {quan_ly_idol} ngồi im tới khi lửa tàn hẳn._
~ nghi(30)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1810_sang_vung_tau ===
# ngay:18 # gio:06:40 # noi:bai_bien_vung_tau
_Bạn tỉnh dậy trên ghế bố ngoài hiên, quấn trong cái chăn của khách sạn. Không nhớ gì sau lon bia thứ năm. Hay thứ bảy._
_Anh {quan_ly_idol} đứng ở bờ biển, nói điện thoại. Mắt đỏ. Như người thức trắng cả đêm._
_{dan_dau_tu} ngồi bệt trên cát, nhìn điện thoại, mặt trắng bệch._
dan_dau_tu: Hồng Coin… về 0. Người tạo coin ôm tiền biến mất lúc 4 giờ sáng. Ông {idol_het_thoi}… 2 triệu của ông…
{ phat_no > 54000000:
    _Hai triệu bạn mượn thẻ tín dụng để mua coin. Giờ là hai triệu nợ, không coin._
}
* [💬 Đi ra chỗ anh {quan_ly_idol}: "Anh thức cả đêm hả? Tối qua em có làm gì kỳ hông?"]
    quan_ly_idol: *(cúp máy, nhìn bạn một giây)* Hông. Em ngủ ngoan lắm.
    _Anh nói "ngoan lắm" rồi quay đi rất nhanh. Bạn không hiểu vì sao tai anh đỏ. Chắc tại gió biển._
    ~ qh("quan_ly_idol", 5)
* [🤝 Ngồi xuống cạnh {dan_dau_tu}: "Thôi anh. Coi như mình mua vé xem một bộ phim."]
    dan_dau_tu: Phim gì mà vé 2 triệu…
    dan_dau_tu: Mà… cảm ơn ông. Ông là người đầu tiên không chửi tui sáng nay.
    ~ qh("dan_dau_tu", 10)
    ~ phat_tt(-3)
* [🕶️ Đeo kính đen, đi dạo một mình.]
    _Bãi biển buổi sáng không có ai nhận ra bạn. Ở đầu kia bãi, {editor} đang ngồi ngắm bình minh, lần đầu tiên không phải vì chưa ngủ._
    ~ phat_tt(3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1810_ve_thanh_pho ===
# ngay:18 # gio:19:30 # noi:sanh_sky_ao
_Về tới thành phố thì ai cũng giận ai. Trên xe, {sales} không nói với {ke_toan}, {truong_phong} không nói với {con_ong_chau_cha}._
_Sảnh Sky Ảo. {con_ong_chau_cha} đứng trước bảng thông báo, kéo vali. Trên bảng có tờ rao: "BÁN GẤP PENTHOUSE TẦNG 30, CHÍNH CHỦ"._
con_ong_chau_cha: Anh {idol_het_thoi}. Penthouse của em. Chú em… rao bán mà không nói em. Em đọc ở bảng thông báo như người lạ.
* [😇 "Lên nhà anh ngồi chơi. Nhà anh nhỏ mà có poster coi đỡ buồn."]
    _{con_ong_chau_cha} ngồi ở căn 1808, nhìn bốn bức tường toàn hình bạn, bật cười lần đầu trong ngày._
    con_ong_chau_cha: Anh sống với chính mình vậy hông mệt hả anh?
    _Mệt. Bạn không nói._
    ~ qh("con_ong_chau_cha", 15)
    ~ phat_tt(-5)
* {phat_co_ghi_am_long} [🔒 "Em còn phòng thu mà, đúng hông? Anh nghe lỏm bài em rồi."]
    con_ong_chau_cha: *(đứng hình)* Anh… nghe hả?
    idol_het_thoi: Hồng không phải màu, Hồng là thái độ. Hay. Hay hơn mọi thứ công ty mình làm năm nay.
    _{con_ong_chau_cha} không nói gì. Chỉ đứng thẳng lưng hơn một chút._
    ~ qh("con_ong_chau_cha", 20)
* [🕶️ "Chú em là anh {giam_doc} mà. Gọi chú em đi."]
    con_ong_chau_cha: *(cười nhạt)* Câu đó của em. Anh lấy rồi thì em nói gì giờ.
    ~ qh("con_ong_chau_cha", -5)
    ~ phat_tt(3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1910_xep_tiet_muc ===
# ngay:19 # gio:11:10 # noi:phong_nghe_si
_Thứ 2. Họp giao ban xong, không ai nhìn mặt ai. Mai là sinh nhật công ty 16 tuổi kiêm Ngày Phụ nữ Việt Nam._
_{thanh_xin_nghi} hôm nay có mặt, đang xếp lịch văn nghệ trên bảng trắng. Dòng đầu tiên, như mọi năm: "Mở màn: {idol_het_thoi} - Công Viên"._
thanh_xin_nghi: Anh {idol_het_thoi}, năm nay anh hát gì? Vẫn bài đó hả anh? *(ho nhẹ)* Em hơi sốt.
* [🎤 "Vẫn bài đó. Anh {giam_doc} thích bài đó."]
    thanh_xin_nghi: Dạ. Em ghi.
    ~ phat_tt(2)
* [✍️ "Để trống giùm anh. Anh đang viết một bài mới."]
    thanh_xin_nghi: *(nhìn bạn lâu)* Bài mới hả anh? Mười một năm rồi đó…
    thanh_xin_nghi: Dạ. Em để trống. Anh hát gì cũng được, miễn anh hát thật.
    _Có cái gì đó trong giọng {thanh_xin_nghi} làm bạn nhớ tấm thẻ "Vòng 2, thí sinh số 27"._
    ~ qh("thanh_xin_nghi", 8)
    ~ phat_tt(-5)
* [🤝 "Xếp em hát mở màn đi {thanh_xin_nghi}. Anh hát sau."]
    thanh_xin_nghi: *(làm rơi bút)* Em… em hông hát được anh ơi. Em… bà ngoại em…
    { biet(son_thi_hat):
        idol_het_thoi: Thí sinh số 27 mà hông hát được?
        thanh_xin_nghi: *(nhìn quanh, nói rất nhỏ)* Anh… đừng nói ai nha anh.
        ~ qh("thanh_xin_nghi", 12)
    - else:
        ~ qh("thanh_xin_nghi", 3)
    }
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1910_viet_bai ===
# ngay:19 # gio:23:30 # noi:can_1808
_Căn 1808. Nửa đêm. Bạn ôm đàn, ngồi giữa bốn bức tường đầy poster. Trên bàn: một cuốn sổ, ba trang bị gạch xóa._
_Mười một năm bạn không viết được bài nào. Không phải vì bí. Vì sợ bài mới không bằng bài cũ._
* [✍️ Viết về chuyện thật: một ca sĩ hát đám cưới, hát cho người khác hạnh phúc.]
    _Bạn viết tới 3 giờ sáng. Bài tên "Hát Cho Người Ta Cưới". Không có cá viên chiên. Không có chuối chiên. Có bạn._
    ~ phat_bai_moi = true
    ~ phat_tt(-10)
    ~ nghi(-20)
* [✍️ Viết về một người lúc nào cũng cầm hai cái điện thoại.]
    _Bạn viết được hai câu: "Anh cầm hai cái máy, chẳng máy nào gọi cho anh…" Rồi bạn dừng lại. Không biết vì sao viết câu đó. Không biết viết tiếp sao._
    _Bạn ghi lên đầu trang: "Bài này để sau."_
    ~ qh("quan_ly_idol", 3)
    ~ phat_tt(-5)
    ~ nghi(-10)
* [😶 Gập sổ. Mở clip "Công Viên" 2015 coi lần nữa.]
    _Năm 2015 bạn trẻ hơn. Giọng cao hơn. Bạn coi tới khi ngủ gục trên đàn._
    ~ phat_tt(3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2010_qua_20_10 ===
# ngay:20 # gio:09:30 # noi:tang_1
_Ngày Phụ nữ Việt Nam. Bàn chị em đã có phong bì 2.100.000đ của công ty và 7 chiếc khăn cam giống hệt nhau của {giam_doc}. {dan_dau_tu} đi từng bàn chúc "8386, phát lộc nha mấy bà!", không tặng gì._
_Bạn có 200 nghìn trong ví và một thùng… à không, một bịch kẹo ngậm còn dư. Có bảy chị em trong công ty._
* [🌹 Mua bảy bông hồng lẻ ở xe hoa đầu đường, tặng mỗi người một bông.]
    ~ tien_cong(-140000)
    _Bảy bông giống nhau. Không ai so được ai hơn ai. {chi_dai} cầm bông hoa, nói: "Khôn đó." {designer} chụp hình đăng story._
    ~ qh("chi_dai", 5)
    ~ qh("hong_hot", 5)
    ~ qh("designer", 5)
    ~ qh("ke_toan", 5)
    ~ qh("sales", 5)
    ~ qh("bien_kich", 5)
    ~ qh("thanh_ninh", 5)
* [🎤 Đứng giữa phòng hát tặng một bài, gọi tên từng người.]
    _Bạn hát "Công Viên", đổi lời thành tên bảy chị em. Tới tên {thanh_ninh} thì {chi_dai} ho một tiếng. Tới tên {chi_dai} thì {thanh_ninh} ho lại._
    ~ qh("hong_hot", 5)
    ~ qh("bien_kich", 3)
    ~ phat_tt(3)
* [🕶️ Đăng một bài "Chúc mừng 20/10 tới toàn thể fan nữ của tôi".]
    _80.000 hoa sen thả tim. Không chị em nào trong công ty thả tim._
    ~ phat_tt(5)
    ~ qh("chi_dai", -3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2010_sinh_nhat_cong_ty ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_18:30. Quán Ốc Đêm. Sinh nhật {cong_ty} 16 tuổi. Bàn công ty kê nối nhau, treo bong bóng cam và hồng. Logo trên băng rôn là chữ G bảy màu bản gốc năm 2010: {giam_doc} đã chọn lại sau 38 lần sửa._
{ RANDOM(1, 2) == 1:
    _Bác {bac_bao_ve} đứng dậy, đeo kính, đọc lá thư tay ký chữ "G" tới chòi sáng nay: "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui. Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. G."_
    _Cả quán im. Bác cất một phong bì dán kín vào túi áo, ngồi xuống, gắp ốc như chưa có gì._
- else:
    _Bác {bac_bao_ve} cầm một lá thư tay, nhìn nó rất lâu, rồi cất vào túi áo cùng một phong bì dán kín. Bác không đọc. Không ai hỏi._
}
_Rồi {giam_doc} cầm micro của quán. Hôm nay không có từ tiếng Anh nào sai chỗ. Hôm nay giọng anh run._
giam_doc: Năm 2015, anh ngồi trong một quán cà phê đầu ngõ. Có một cậu sinh viên ôm đàn hát một bài về hai đứa bạn bán cá viên chiên…
_Cả quán quay sang nhìn bạn._
giam_doc: {idol_het_thoi}. Lên đây em. Hát đi.
* [🎤 Hát "Công Viên" cho anh {giam_doc}. Đúng bản ở quán cà phê năm 2015.]
    _Bạn hát lệch tông câu thứ ba, như năm đó. Cố ý. Anh {giam_doc} nghe tới câu thứ ba thì bật cười, rồi lấy tay che mắt._
    ~ qh("giam_doc", 15)
    ~ phat_nt(3)
    ~ phat_tt(-5)
* [🎤 Hát "Công Viên" cho cả công ty, kéo mọi người lên sân khấu.]
    _{thuc_tap_sinh} đứng lên đầu tiên. Rồi {hong_hot}, {chi_dai}, {sieu_nhan_hong}. Cuối cùng là cả quán, cả mấy bàn khách lạ. Bác {bac_bao_ve} gõ nhịp lên dĩa ốc._
    ~ phat_nt(5)
    ~ follow(10000)
    ~ qh("sieu_nhan_hong", 8)
    ~ qh("chi_dai", 5)
    ~ phat_tt(-8)
* {phat_bai_moi} [✍️ Hát bài mới: "Hát Cho Người Ta Cưới". Chưa ai từng nghe.]
    _Cả quán im lặng nghe. Không ai biết lời để hát theo. Không ai cần hát theo._
    _Hát xong, im ba giây. Rồi anh {giam_doc} vỗ tay đầu tiên. Anh {quan_ly_idol} đứng ở góc phòng, không vỗ tay, chỉ nhìn._
    ~ phat_nt(8)
    ~ qh("giam_doc", 10)
    ~ qh("quan_ly_idol", 10)
    ~ phat_tt(-15)
    ~ follow(15000)
* [🕶️ "Trước khi hát, em xin kể chuyện năm 2015…"]
    _Bạn kể 8 phút. {giam_doc} đứng nghe, gật gù. Phía dưới, {dan_dau_tu} đã kịp mở chart coin ra coi._
    ~ phat_tt(8)
    ~ qh("giam_doc", 3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2010_karaoke_tang_hai ===
# ngay:20 # gio:21:00 # noi:karaoke
_Sau quán ốc, tăng hai ở Karaoke Chú Sáu. {giam_doc} say. Rất say._
giam_doc: Anh hứa! Tăng lương… 20%! Cả công ty! Ai quay thì quay đi, anh không sợ!
_{hong_hot} quay. Lần này {giam_doc} nhìn thẳng vào ống kính, giơ ngón cái._
_Rồi {giam_doc} quay sang bạn, mắt đỏ._
giam_doc: {idol_het_thoi}. Hợp đồng em… Anh sợ lắm em ạ. Anh sợ anh giữ em lại để em hát đám cưới thêm mười năm. Thế thì anh có lỗi với em.
* [📖 "Anh hông có lỗi. Anh là người duy nhất từng tin em."]
    giam_doc: *(gục đầu lên vai bạn)* Thế à… Thế thì tốt…
    _Lần đầu tiên bạn nói câu đó thành lời. Anh {giam_doc} có thể sẽ không nhớ. Bạn thì nhớ._
    ~ qh("giam_doc", 15)
    ~ phat_tt(-10)
* [🕶️ "Thì anh gia hạn đi. Ký liền đi anh, em có đem bút."]
    giam_doc: *(cầm bút, nhìn bút, nhìn bạn)* Say thì không ký. Bố anh dặn thế.
    _Trang 47 của hợp đồng Siêu Nhân Hồng cũng được ký lúc tỉnh táo. Bạn không biết chuyện đó._
    ~ qh("giam_doc", -3)
    ~ phat_tt(3)
* [🎤 Cầm micro, hát một bài cho anh {giam_doc} ngủ.]
    _Bạn hát "Công Viên" bản ballad, chậm gấp đôi. Tới điệp khúc, {giam_doc} đã ngáy. {chi_dai} gọi taxi._
    ~ qh("giam_doc", 5)
    ~ qh("chi_dai", 3)
- ~ cang_thang(-5)
~ nghi(-10)
-> END
