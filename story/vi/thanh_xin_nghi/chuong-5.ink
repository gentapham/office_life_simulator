// ============================================================
// THÁNH XIN NGHỈ: SƠN · CHƯƠNG 5: "THANH TRA NGÀY PHÉP" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_xin_nghi_2110_tin_don ===
# ngay:21 # gio:16:00 # noi:pantry # bat_buoc
_Sáng nay trang Confession đăng bài bóc chuyện ai đó thế chấp biệt thự ở Đồi Ngân Hàng. Chiều nay là Mốc 3: 500.000 người theo dõi._
{ nguoi_theo_doi >= 500000:
    _Qua mốc. Cả công ty thở ra. Nhưng ở pantry, tin đồn vẫn chạy nhanh hơn biểu đồ của {dan_dau_tu}._
- else:
    _Không qua mốc. {giam_doc} gọi anh {hr} lên phòng kính, đóng cửa. 20 phút sau anh {hr} đi ra, mặt trắng như tờ đơn._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
hong_hot: *(nói nhỏ, đủ cả pantry nghe)* Nghe gì chưa? Có danh sách cắt giảm. Ổng {hr} giữ. Mà nghe nói có tên… *(nhìn bạn)* …người nghỉ nhiều nhất công ty.
_Cả pantry quay sang bạn. Ly cà phê trên tay bạn hơi run._
* [😅 "Người nghỉ nhiều nhất là {editor} mà. Nó ngủ ban ngày."]
    editor: *(từ góc pantry, mắt nhắm)* Em làm đêm… đợi render xong…
    _Cả pantry cười. Bạn thoát. Tạm thời._
    ~ qh("editor", -2)
* [💬 "Chị {hong_hot} nghe ai nói vậy?"]
    hong_hot: Nguồn tin bí mật! Mà thôi, chắc đồn thôi. Bà ngoại ông khỏe chưa?
    _Câu hỏi thăm bằng giọng mỉa. Bà ngoại đã thành meme của công ty._
    ~ son_tin(-5)
* [😶 Im lặng, về bàn làm việc, xếp lịch cẩn thận gấp đôi.]
    ~ uy_tin = uy_tin + 3
    ~ son_soi(-3)
- ~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2210_doan_thue ===
# ngay:22 # gio:09:00 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế tới bất ngờ. Trưởng đoàn: Chú Liêm, 55 tuổi. Cả công ty giả vờ làm việc chăm chỉ. Bạn là người duy nhất không cần giả vờ, vì hôm nay bạn có mặt từ 7 giờ 30._
_Chú Liêm đối chiếu bảng lương với bảng chấm công. Tới tên bạn, chú dừng lại. Bảng chấm công của bạn đỏ như lịch Tết._
phu_chu_liem: Nhân viên này… nghỉ 31 lần trong 9 tháng. Có giấy phòng khám… ký cả chủ nhật? Phòng khám nào mở chủ nhật?
_{cho} bước vào phòng. Chú Liêm nhảy lên ghế._
phu_chu_liem: Ối! Chó! Ai cho chó vào đây?!
* [🐕 Bế {cho} ra ngoài, cảm ơn nó bằng một cây xúc xích.]
    ~ qh("cho", 8)
    _Chú Liêm leo xuống ghế, quên mất đang hỏi tới đâu. Tờ bảng chấm công của bạn bị lật sang trang sau._
    { co(xuc_xich):
        ~ mat(xuc_xich)
    }
* [😇 "Dạ chú, giấy chủ nhật là… em đi khám cấp cứu ạ."]
    phu_chu_liem: Cấp cứu 4 chủ nhật liền?
    thanh_xin_nghi: Dạ… bệnh mãn tính ạ.
    ~ son_tin(-5)
    ~ son_soi(5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2210_thuong_toi_hau_thu ===
# ngay:22 # gio:17:00 # noi:phong_ke_toan # bat_buoc
_5 giờ chiều. Đoàn thuế chưa về. Chị {ke_toan} kéo bạn vào phòng kế toán, đóng cửa._
ke_toan: {thanh_xin_nghi}. Chị nói một lần. Tuần này em mà nghỉ một ngày, chị không ký lương nữa. Đoàn thuế đang soi bảng chấm công. Em nghỉ là công ty bị phạt, chị bị phạt.
_Tuần này. Tổng duyệt bán kết chiều thứ 6, 23/10. Bán kết tối chủ nhật 25/10._
* [😇 "Dạ chị. Em đi đủ."]
    ke_toan: Hứa?
    thanh_xin_nghi: Dạ hứa.
    ~ qh("ke_toan", 5)
    ~ son_soi(-5)
* [🎤 "Chị… em nói thật. Chiều thứ 6 em có việc rất quan trọng. Không phải bà ngoại."]
    ke_toan: *(nhìn bạn qua gọng kính)* Việc gì?
    thanh_xin_nghi: Một cuộc thi hát.
    _Chị {ke_toan} im lặng rất lâu. Rồi đẩy qua cho bạn một tờ giấy: "Đơn xin về sớm 2 tiếng, có lý do"._
    ke_toan: Ghi lý do thật. Ký tên. Có giấy tờ là chị chịu được.
    ~ qh("ke_toan", 10)
    ~ son_tin(5)
* [🤧 "Dạ… khụ khụ… em hứa…"]
    ke_toan: Em ho kiểu đó với chị là chị biết em sắp nghỉ. Chị ghi nhận.
    ~ son_soi(8)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2310_tong_duyet ===
# ngay:23 # gio:15:30 # noi:san_khau_su_kien # bat_buoc
_Sinh nhật Siêu Nhân Hồng, 31 tuổi. Livestream lúc 19:00. Tổng duyệt bán kết lúc 17:00 ở Đài Tivi Hóng, Ven Đô. Bạn đang đứng giữa sân khấu sự kiện, tay cầm lịch chạy chương trình._
_{sales} chạy tới hớt hải: "Mr. Kevin Trộn kẹt xe ở Singapore! Cần người đóng thế lên sóng chúc mừng!"_
* [📅 "Bác {bac_bao_ve} đóng được. Bác nói ít, thâm thúy, nhìn như chủ tịch."]
    ~ qh("bac_bao_ve", -3)
    ~ qh("sales", 5)
    bac_bao_ve: Bác à? Bác không biết tiếng Anh. Bác chỉ biết "ô kê".
    sales: Đủ rồi bác! Chủ tịch nói ít mới sang!
* [📅 "Anh {thuc_tap_sinh} đi. Ảnh mặc vest là giống sếp ngân hàng liền."]
    ~ qh("thuc_tap_sinh", 3)
    thuc_tap_sinh: Dạ… dạ em giống sếp ngân hàng ạ? *(giật mình rất lâu)*
- _16:15. Nếu đi tổng duyệt, bạn phải rời đây ngay._
* [🌫️ Bốc Hơi: chấm công rồi lẻn ra cổng sau.]
    { qh_bac_bao_ve >= 20:
        bac_bao_ve: *(quay mặt đi)* Bác không thấy gì đâu. Về trước 7 giờ.
        ~ son_mo(8)
        ~ son_nghi_tu_15 = true
    - else:
        bac_bao_ve: Cháu {thanh_xin_nghi}. Đi đâu thế? Chị {ke_toan} dặn bác ghi giờ ra vào đấy.
        ~ son_soi(15)
        _Bạn quay lại sân khấu. Tổng duyệt vắng mặt._
        ~ son_mo(-10)
    }
* {son_thai_biet} [🔒 Nhờ anh {quan_ly_idol} che: "Anh, em đi 2 tiếng. Anh lo giùm lịch chạy livestream."]
    quan_ly_idol: Đi đi. Anh che. Mà về trước 7 giờ, Nguyên thổi nến em không có mặt là ổng buồn.
    ~ qh("quan_ly_idol", -3)
    ~ son_mo(8)
    ~ son_nghi_tu_15 = true
* [📝 Nộp đơn "về sớm 2 tiếng" với lý do thật cho chị {ke_toan}.]
    ke_toan: *(đọc)* "Tổng duyệt bán kết Giọng Ca Ước Mơ." *(ngẩng lên)* …Ký. Đi đi.
    ~ son_mo(8)
    ~ qh("ke_toan", 5)
    ~ son_tin(5)
* [😇 Ở lại. Bỏ tổng duyệt.]
    ~ son_mo(-10)
    ~ uy_tin = uy_tin + 5
    phu_tro_ly_dai: *(nhắn)* Cưng không tổng duyệt thì bán kết tự lo nha. Chị lo cho cưng rồi đó.
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2310_livestream ===
# ngay:23 # gio:19:00 # noi:san_khau_su_kien # bat_buoc
_19:00. Livestream sinh nhật. Bạn đứng sau cánh gà với bộ đàm. {sieu_nhan_hong} cúi xuống thổi nến. Một vệt vàng lao qua._
_{cho} húc đổ cái bánh kem hồng 5 tầng. Kem hồng bay lên màn hình livestream, lên cà vạt {giam_doc}, lên mũ {sieu_nhan_hong}._
~ follow(60000)
_Trong lúc cả đội lao ra dọn kem, bạn cầm khăn đứng sau cánh gà, vô thức ngân nga bài bán kết. Micro livestream gần đó vẫn mở._
_Bình luận chạy: "Ai hát nền hay vậy?" "Hát nữa đi!" "Giọng ai mà như ca sĩ vậy?"_
~ son_lo_tren_livestream = true
* [🤐 Bịt miệng, chạy vào trong.]
    _Bình luận vẫn hỏi. Không ai trả lời. {hong_hot} quay lại nhìn cánh gà, mắt nheo lại._
    ~ son_soi(5)
* [🎤 Hát tiếp thêm một câu. Cho người ta nghe.]
    ~ son_mo(5)
    ~ follow(10000)
    ~ son_soi(8)
    _Câu thứ hai. Bình luận nổ tung. Anh {hr} đứng ở hàng ghế cuối, quay phắt về phía cánh gà._
* [🧹 Giả vờ đang test micro: "Alo alo, một hai ba, test cho anh {idol_het_thoi}."]
    idol_het_thoi: *(từ xa)* Anh đâu có hát hôm nay!
    ~ son_tin(-5)
- _Rồi {sieu_nhan_hong} cầm micro, mặt mũ dính kem, quay về phía {chua_te_deadline} đang đứng sau máy quay._
sieu_nhan_hong: {chua_te_deadline} ơi… anh thích em. Không phải PR đâu. Thiệt đó.
_Hashtag VũƠiTrảLờiĐi lên top xu hướng sau 10 phút. Bạn ghi vào lịch, cột ghi chú: "23/10, 19:47: tỏ tình. Không có trong kế hoạch."_
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2410_hoi_nghi ===
# ngay:24 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Ngày Liên Hợp Quốc. "Hội nghị hòa giải" của chị {chi_dai}. Bàn xếp theo cặp. Bạn ngồi đối diện… anh {hr}._
_Trên bàn là tờ "Câu hỏi hòa giải": "1. Điều bạn chưa từng nói với người kia là gì?"_
_Trước khi cặp nào kịp hỏi, chị {chi_dai} đập bàn, hỏi anh {hr} chuyện danh sách cắt giảm trước cả phòng. Anh {hr} trả lời gì đó. Bạn không nghe rõ, vì tim bạn đập to quá._
hr: *(quay lại bạn, hít một hơi)* Tới mình. Em hỏi trước đi {thanh_xin_nghi}.
* [💬 "Anh… danh sách đó có tên em không anh?"]
    hr: *(nhìn bạn rất lâu)* Có những tên anh viết bằng bút chì. Tên em là một trong số đó.
    ~ son_soi(5)
    ~ cang_thang(10)
* [😇 "Điều em chưa từng nói: em không ghét anh. Em sợ anh thôi."]
    hr: *(bật cười)* Ai cũng sợ anh. Nhưng em là người đầu tiên nói ra.
    ~ qh("hr", 8)
    ~ son_soi(-5)
* [🤧 Ho một tràng dài.]
    hr: Ho hay đó em. *(đẩy qua ly trà gừng)* Uống đi.
    ~ uong(10)
    ~ son_soi(3)
- _Điện thoại anh {hr} để trên bàn sáng lên. Một tin nhắn tự động: "Cảm ơn quý khán giả đã bình chọn cho thí sinh {thanh_xin_nghi} Kim Tuyến."_
_Anh {hr} úp điện thoại xuống, rất nhanh. Bạn đã thấy._
* [😶 Giả vờ không thấy.]
    _Bạn cúi xuống tờ câu hỏi. Tim đập như trống trận. Người soi bạn 3 cm hồ sơ… là fan của bạn._
    ~ son_biet_so_604 = true
* [💬 "Anh… cũng xem 'Giọng Ca Ước Mơ' hả anh?"]
    hr: *(đỏ mặt, lần đầu tiên)* Ờ… thỉnh thoảng. Có một thí sinh anh thích. Em đừng kể ai nha. HR mà bình chọn tin nhắn thì… mất uy.
    ~ son_biet_so_604 = true
    ~ qh("hr", 5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2510_sang_ll ===
# ngay:25 # gio:10:00 # noi:ven_do
_Chủ nhật. Bạn chạy xe từ Ven Đô ra chợ, đi ngang tòa nhà kính 20 tầng của LL-Entertainment, màu xanh lá chuối._
_Ở sảnh, qua lớp kính, bạn thấy anh {quan_ly_idol}. Hai điện thoại. Đang bắt tay một thư ký mặc đồ xanh lá chuối._
_Bên cạnh, {designer} và {thanh_ninh} đứng nhìn nhau, đồng thanh: "Ủa, em/chị đi lạc hả?"_
* [📞 Gọi anh {quan_ly_idol} ngay.]
    quan_ly_idol: *(bắt máy, giọng gấp)* {thanh_xin_nghi} hả? Anh đang… ở chợ.
    thanh_xin_nghi: Chợ có máy lạnh, có sảnh kính hả anh?
    _Im lặng. Rồi anh {quan_ly_idol} cười, mệt._
    quan_ly_idol: Tối nay anh nói chuyện với em sau. Mà tối nay em… bà ngoại hả?
    ~ qh("quan_ly_idol", 3)
* [😶 Chạy xe đi, coi như không thấy.]
    _Ai cũng có một tòa nhà để đi ngang mà không dừng lại. Hôm nay bạn đi ngang tòa nhà của anh {quan_ly_idol}._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2510_ban_ket ===
# ngay:25 # gio:20:00 # noi:dai_tivi_hong # bat_buoc
_Tối chủ nhật. Bán kết "Giọng Ca Ước Mơ", truyền hình trực tiếp. Phòng chờ thí sinh. Bạn trong bộ áo choàng kim tuyến dài tới gót._
_Điện thoại rung. Tin nhắn của {sieu_nhan_hong}: "{son_nguyen_biet:Đặc vụ Kim Tuyến cố lên! Anh đang xem!|{thanh_xin_nghi} ơi, tối nay em đi đâu mà không nghe máy vậy?}"_
{ son_thai_biet:
    _Tin nhắn của anh {quan_ly_idol}: "Hát cho anh nghe đi. Anh ngồi trước tivi rồi. {idol_het_thoi} cũng ngồi đây, đừng hỏi vì sao."_
    ~ son_mo(5)
}
phu_tro_ly_dai: {thanh_xin_nghi} Kim Tuyến! Lên!
* [🎤 Hát bài ballad về người đi làm xa nhà.]
    ~ son_mo(10)
* [🎤 Hát "Công Viên" bản ballad.]
    { son_muon_vest_phat:
        ~ son_mo(12)
        _Trong bộ vest của chính người hát nó năm 2015. Ở một căn hộ chung cư, có người đang xem tivi, tháo kính đen ra._
    - else:
        ~ son_mo(8)
    }
- { son_giac_mo >= 50:
    -> thanh_xin_nghi_2510_ban_ket.s_vao
- else:
    -> thanh_xin_nghi_2510_ban_ket.s_truot
}

= s_vao
~ son_vao_chung_ket = true
phu_mc_dai: Và thí sinh vào chung kết cuối cùng là… SƠN KIM TUYẾN!
_Kim tuyến rơi. Bạn đứng giữa sân khấu, không biết nên khóc hay cười, nên làm cả hai._
phu_tro_ly_dai: Chung kết trực tiếp 20:00 thứ 7, 31/10 nha cưng! À, top khán giả bình chọn cho cưng: số máy đuôi 604, 47 lần! Fan cứng đó!
{ son_biet_so_604:
    _Số đuôi 604. Anh {hr}. Căn 604. Người soi bạn 3 cm hồ sơ. Bình chọn cho bạn 47 lần._
    _Bạn ngồi xuống bậc thang sau sân khấu, cười tới chảy nước mắt._
- else:
    _604. Bạn thấy con số quen quen. Hình như là số trên tấm danh thiếp của ai đó trong công ty._
    ~ son_biet_so_604 = true
}
-> END

= s_truot
phu_mc_dai: Và rất tiếc… thí sinh {thanh_xin_nghi} Kim Tuyến dừng chân ở đây.
_Đèn tắt. Kim tuyến vẫn rơi, nhưng không phải cho bạn._
~ son_mo(-10)
~ cang_thang(20)
_Bạn tẩy trang trong phòng chờ. Lớp kim tuyến cuối cùng trôi theo nước. Ngày mai thứ 2. Bạn sẽ đi làm đủ. Không cần xin nghỉ nữa._
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2610_chieu_thu ===
# ngay:26 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". 15 phút. Một người mặc đồ hồng đẩy xe chết máy cho một người lạ 2 km trong mưa._
_Đèn bật. {thuc_tap_sinh} khóc. {bien_kich} nhận lời khen. Tin đồn cắt giảm vẫn chạy khắp hành lang, nay có thêm câu: "nộp danh sách hôm nay"._
{ son_vao_chung_ket:
    _Ra khỏi phòng chiếu, {sieu_nhan_hong} kéo bạn lại góc hành lang._
    sieu_nhan_hong: {son_nguyen_biet:Đặc vụ! Anh xem bán kết rồi! Em vào chung kết! Slay!|{thanh_xin_nghi}! Tối qua em ở đâu? Anh thấy trên tivi một người giống em lắm!}
    -> thanh_xin_nghi_2610_chieu_thu.s_moi
- else:
    _Bạn về bàn điều phối. Lịch tuần cuối của Siêu Nhân Hồng chờ bạn, kín đặc._
    ~ son_di_lam()
    -> END
}

= s_moi
* {son_nguyen_biet} [🔒 "Anh Nguyên… anh làm khách mời chung kết với em được hông? Đài đang tìm khách mời."]
    sieu_nhan_hong: Khách mời? Trên sóng toàn quốc? *(tạo dáng 3 kiểu liền)* Gét gô! Mà… cùng tối Đại Nhạc Hội hả?
    thanh_xin_nghi: Dạ. 20:00. Em tính rồi. Hơi điên một chút.
    sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ! Điên là thái độ luôn!
    ~ son_moi_nguyen_khach_moi = true
    ~ qh("sieu_nhan_hong", 10)
* [😶 "Dạ… anh nhìn lộn rồi."]
    sieu_nhan_hong: Ờ… vậy hả. *(gãi mũ)*
- ~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2710_thai_loi_moi ===
# ngay:27 # gio:10:00 # noi:san_thuong # bat_buoc
_LL-Entertainment ra tay. Sáng nay Lưu Lực gửi lời mời cho Siêu Nhân Hồng: lăng xê miễn phí, trả gấp ba. Cả công ty như ngồi trên lửa._
_Sân thượng. Anh {quan_ly_idol} kéo bạn lên, tay cầm 2 điện thoại, giọng mệt._
quan_ly_idol: {thanh_xin_nghi}, anh nói thiệt. LL mời anh về, 36 triệu một tháng, kèm Nguyên. Em đi với anh không? Bên đó không ai bắt giấy phòng khám đâu.
* [🤝 "Anh {quan_ly_idol} đi đâu em đi đó. Mà… còn anh {idol_het_thoi} thì sao?"]
    _Anh {quan_ly_idol} khựng lại rất lâu. Một điện thoại rung. Anh không nghe._
    ~ qh("quan_ly_idol", 10)
    ~ son_thai_chon = "chua_ro"
    quan_ly_idol: …Anh chưa biết.
* [😤 "Anh đi thì đi một mình đi. Em hông bỏ công ty lúc này."]
    ~ qh("quan_ly_idol", -15)
    quan_ly_idol: Ừ. *(quay đi)* Em lo cho cái công ty này hơn lo cho anh.
    _Đêm đó, anh {quan_ly_idol} ngồi nghĩ lại. Bạn biết vì 2 giờ sáng anh ấy còn "đang hoạt động"._
    ~ son_thai_chon = "chua_ro"
* {not son_thai_biet} [🎤 "Anh {quan_ly_idol}, trước khi anh quyết, em kể anh nghe một chuyện. Em… đi thi hát."]
    _Bạn kể hết. Quán Sống Ảo. Vòng 2. Bán kết. Chung kết 20:00 tối 31/10._
    quan_ly_idol: *(im lặng, rồi bật cười)* Thảo nào bà ngoại em ốm đúng tối thứ 7.
    quan_ly_idol: Em giấu anh cả năm. Còn anh thì đang định bỏ đi mà không nói với em. Hai đứa mình…
    ~ son_thai_biet = true
    ~ qh("quan_ly_idol", 25)
    ~ son_thai_chon = "o_lai"
    _Anh {quan_ly_idol} không nhận lời LL ngay. Anh nói: "Để anh nghe em hát chung kết đã."_
* {son_thay_anh_phat} [🔒 "Anh không bỏ được anh {idol_het_thoi} đâu. Em thấy tấm hình trong ngăn kéo rồi."]
    _Anh {quan_ly_idol} đỏ mặt tới mang tai. Cúp cả 2 điện thoại cùng lúc. Lần đầu tiên trong lịch sử._
    quan_ly_idol: Em… nói nhỏ thôi.
    quan_ly_idol: …Ừ. Anh ở lại.
    ~ son_thai_chon = "o_lai"
    ~ qh("quan_ly_idol", 15)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2710_luu_luc ===
# ngay:27 # gio:11:00 # noi:sanh_le_tan # bat_buoc
_Lưu Lực đích thân tới. Vest trắng, tóc vuốt keo, hai thư ký xanh lá chuối. Ông ta đi thẳng tới quầy lễ tân, nơi chị {chi_dai} đang cầm bộ đàm._
phu_luu_luc: Việc hôm nay phải xong từ hôm qua. Tôi muốn gặp Siêu Nhân Hồng.
chi_dai: Ủa… Quán Ốc Đêm. Mười năm trước. Tô ốc len. Nhớ hông?
_Lưu Lực đứng hình. Tập hồ sơ rơi xuống sàn, giấy bay tứ tung. Một tờ bay tới chân bạn: "Lịch trình Siêu Nhân Hồng tuần 26/10 – 31/10". Bản sao lịch của bạn._
* [🕵️ Nhặt lên, xem kỹ.]
    _Đúng lịch của bạn. Bản bạn in tuần trước, có cả nét bút chì gạch xóa. Ai đó đã chụp lại._
    { son_hieu_biet_lich:
        _Bạn nhớ 4 tấm ảnh {ran_doc} chụp hôm 9/10. Bạn nhớ cả ly trà sữa._
    }
    ~ son_lich_chong_cheo_tuan_cuoi = true
    thanh_xin_nghi: Em phải xếp lại cả tuần.
    -> thanh_xin_nghi_mg_xep_lich_mo
* [📅 Đưa lại cho thư ký, mỉm cười: "Lịch này cũ rồi chị. Tụi em đổi hết rồi."]
    _Thư ký tái mặt. Bạn chưa đổi gì cả. Nhưng giờ bạn sẽ đổi._
    ~ uy_tin = uy_tin + 3
    -> thanh_xin_nghi_mg_xep_lich_mo
