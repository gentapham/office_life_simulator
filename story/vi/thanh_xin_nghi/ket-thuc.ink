// ============================================================
// THÁNH XIN NGHỈ: SƠN · SÁU KẾT THÚC
// Kết thúc của Sơn chốt ở 19:10 ngày 31/10 (sau lựa chọn "hai sân khấu"),
// nên cảnh đánh giá được gọi từ thanh_xin_nghi_3110_1910.
// Ưu tiên: Hết Phép Cả Đời (Bị Soi 100 / phép ≤ -10 / đã ký cam kết)
//          > Song Ca Đêm Hồng (bí mật) > Hai Ghế Một Mông
//          > Ốm Trên Sóng Truyền Hình (nói dối, Độ Tin < 20, chưa tự thú)
//          > Sơn Kim Tuyến > Điều Phối Không Nghỉ Ngày Nào
// Không khớp: rời Đêm Hồng thì Ốm Trên Sóng Truyền Hình, ở lại thì Hết Phép Cả Đời.
// ============================================================

=== thanh_xin_nghi_3010_danh_gia ===
# ngay:31 # gio:19:15 # bat_buoc
{ son_tung_soi_100 || son_ngay_phep <= -10 || son_ky_cam_ket:
    ~ chot_ket_thuc("het_phep_ca_doi")
    -> thanh_xin_nghi_kt_het_phep_ca_doi
}
{ son_chon_dem_31 == "noi_song":
    ~ chot_ket_thuc("song_ca_dem_hong")
    -> thanh_xin_nghi_kt_song_ca_dem_hong
}
{ son_chon_dem_31 == "ca_hai":
    ~ chot_ket_thuc("hai_ghe_mot_mong")
    -> thanh_xin_nghi_kt_hai_ghe_mot_mong
}
{ son_chon_dem_31 == "nghi_om" && son_do_tin < 20 && not son_tu_thu_tuan:
    ~ chot_ket_thuc("om_tren_song")
    -> thanh_xin_nghi_kt_om_tren_song
}
{ (son_chon_dem_31 == "di_thi" || son_chon_dem_31 == "nghi_om") && son_giac_mo >= 80 && son_don_nghi_viec_that:
    ~ chot_ket_thuc("son_kim_tuyen")
    -> thanh_xin_nghi_kt_son_kim_tuyen
}
{ son_chon_dem_31 == "o_lai" && not son_nghi_tu_15 && uy_tin >= 70 && not son_lich_chong_cheo_tuan_cuoi:
    ~ chot_ket_thuc("dieu_phoi_khong_nghi")
    -> thanh_xin_nghi_kt_dieu_phoi_khong_nghi
}
{ son_chon_dem_31 == "di_thi" || son_chon_dem_31 == "nghi_om":
    ~ chot_ket_thuc("om_tren_song")
    -> thanh_xin_nghi_kt_om_tren_song
}
~ chot_ket_thuc("het_phep_ca_doi")
-> thanh_xin_nghi_kt_het_phep_ca_doi

// ------------------------------------------------------------
// 😄 🎤 SƠN KIM TUYẾN
=== thanh_xin_nghi_kt_son_kim_tuyen ===
# ngay:31 # gio:21:45 # noi:dai_tivi_hong
_Bạn tới Đài Tivi Hóng lúc 19:52. Tóc giả đội lệch trên xe ôm, trang điểm dặm trong thang máy._
_20:41. Bạn đứng giữa sân khấu chung kết. Bài cuối. Không phải bài buồn, không phải bài vui. Bài của bạn._
_Bạn hát như người đã xin nghỉ 31 lần trong năm, và lần này không cần xin nữa._
phu_mc_dai: Quán quân "Giọng Ca Ước Mơ" năm nay là… SƠN KIM TUYẾN!
_Pháo giấy kim tuyến rơi đầy sân khấu. Bạn cầm cúp. Lớp trang điểm lem thành hai vệt dài trên má. Kệ._
_Ở hàng ghế khán giả, cô lễ tân Phòng khám Khỏe Re giơ tấm bảng tự làm: "KHÁCH VIP CỦA EM!"_
_Hậu trường. Điện thoại rung liên tục. Group Zalo-lô công ty: 400 tin nhắn. {hong_hot}: "Ủa alo? Sơn của mình hả?" {chi_dai}: "Tui biết mà!" {idol_het_thoi}: "Em biết anh là ai không? Anh là người cho mượn vest đó!"_
_Rồi một tin nhắn riêng, từ {hr}:_
_"Anh vote cho em 47 lần đó. Đơn nghỉ việc anh duyệt rồi. Lý do ghi: 'Đi hát'. Lý do đầu tiên của em mà anh tin."_
_Bạn ngồi xuống bậc thang sau sân khấu, ôm cúp, cười tới khi nước mắt khô._
_Bạn mở album, tìm tấm ảnh bà ngoại cười khỏe re, gửi vào group công ty kèm một dòng:_
_"Bà em khỏe lắm. Bà chưa từng ốm. Từ hôm nay bà được nghỉ ốm vĩnh viễn."_
_Group im 3 giây. Rồi 21 cái thả tim. Cái đầu tiên của {hr}._
-> END

// ------------------------------------------------------------
// 😄 📅 ĐIỀU PHỐI KHÔNG NGHỈ NGÀY NÀO
=== thanh_xin_nghi_kt_dieu_phoi_khong_nghi ===
# ngay:31 # gio:23:00 # noi:san_khau_dem_hong
_Bạn tắt điện thoại. Cầm bộ đàm._
thanh_xin_nghi: Xe đón vào cổng sau. Anh Duy giữ cửa cánh gà. Chị Hương, pháo giấy 20:14. Anh Bảo, đèn số 3. Anh Nguyên, 20:15 lên.
_Đêm Hồng chạy như một chiếc đồng hồ. Không chồng lịch nào. Không ai đi lạc. Ngay cả {cho} cũng xuất hiện đúng lúc, đúng chỗ, đúng nhịp trống._
_Ở đâu đó trong thành phố, chung kết "Giọng Ca Ước Mơ" đang chiếu. Không có Sơn Kim Tuyến. Bạn biết. Bạn đã chọn._
_Nhưng hôm qua, ở họp đánh giá, anh Tuấn đã đọc tên người nhận thưởng chuyên cần đầu tiên sau 3 năm. Cả phòng tưởng nghe nhầm. Tên bạn._
_Tối thứ 7 tuần sau._
_Quán cà phê Sống Ảo. Bạn ngồi ghế cao, ôm đàn. Không khẩu trang, không mũ lưỡi trai._
_Cả công ty ngồi kín 3 bàn. {chi_dai} vỗ tay trước khi bạn hát. {idol_het_thoi} đòi song ca. {quan_ly_idol} ngồi cạnh {idol_het_thoi}, chỉ cầm một cái điện thoại. {sieu_nhan_hong} ăn bánh chuối chiên bàn trong góc, vỗ tay to nhất quán._
_Hàng đầu, {hr} giơ một cây lightstick tự làm. Ghi "SƠN"._
_Không ai phải bịa lý do gì cả._
thanh_xin_nghi: Bài đầu tiên, em tặng bà ngoại. Bà khỏe lắm. Bà chưa từng ốm.
_Cả quán cười. Bạn hát._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: SONG CA ĐÊM HỒNG
=== thanh_xin_nghi_kt_song_ca_dem_hong ===
# ngay:31 # gio:20:30 # noi:san_khau_dem_hong
_20:00. {it} cắm sợi cáp cuối cùng. Màn hình lớn ở sân khấu Đêm Hồng nhấp nháy, rồi chia đôi._
_Một nửa: Đài Tivi Hóng, chung kết "Giọng Ca Ước Mơ". Một nửa: Sân khấu Đêm Hồng, Phường Tân Drama, 5.000 người cầm đèn hồng._
it: Có tín hiệu. Đừng ai đụng vào cái gì. Không restart.
_Bạn đứng ở Đài Tivi Hóng, kim tuyến từ đầu tới chân. Bên kia màn hình, {sieu_nhan_hong} đứng giữa sân khấu Đêm Hồng, giơ tay chào._
phu_mc_dai: Và đây là tiết mục đặc biệt nhất đêm nay! Thí sinh Sơn Kim Tuyến… song ca trực tiếp với… SIÊU NHÂN HỒNG!
_Nhạc dạo "Công Viên". Bản mới. Bạn hát câu đầu. {sieu_nhan_hong} hát câu hai, sai lời: "khoai chiên". Cả hai sân khấu cùng cười._
_Rồi tới điệp khúc. Một giọng thứ ba vang lên từ cánh gà Đêm Hồng. {idol_het_thoi}, không kính đen, hát bè. {quan_ly_idol} đứng cạnh, hai điện thoại tắt trong túi._
_Kim tuyến và màu hồng lấp lánh trên sóng toàn quốc. Bộ đếm người theo dõi của {sieu_nhan_hong} nhảy như điên._
~ follow(150000)
_Ở hàng ghế đầu sân khấu Đêm Hồng, {hr} đứng dậy, giơ cây lightstick ghi "SƠN KIM TUYẾN". Không giấu nữa._
_Cạnh đó, {giam_doc} trong bộ "Ông Kẹ Ngân Hàng" quay sang hỏi:_
giam_doc: Tuấn, em biết từ bao giờ?
hr: Từ 47 tin nhắn trước, anh.
_Hết bài. Hai sân khấu, một tràng vỗ tay. Bạn nhìn vào ống kính, nói câu đầu tiên trong đời không cần ho trước:_
thanh_xin_nghi: Em cảm ơn bà ngoại. Và cảm ơn công ty đã cho em nghỉ… 31 lần.
-> END

// ------------------------------------------------------------
// 😢 📺 ỐM TRÊN SÓNG TRUYỀN HÌNH
=== thanh_xin_nghi_kt_om_tren_song ===
# ngay:31 # gio:20:30 # noi:san_khau_dem_hong
_20:30. Sau cánh gà Đêm Hồng, đội kỹ thuật để một cái tivi nhỏ trên thùng loa, xem chung kết "Giọng Ca Ước Mơ" cho đỡ buồn lúc chờ._
_{giam_doc} đi ngang, tay cầm ly cà phê, bộ "Ông Kẹ Ngân Hàng" xộc xệch. Ông ấy dừng lại._
_Trên tivi: một thí sinh kim tuyến lấp lánh, tóc giả, hát rất hay. Camera quay cận. Cái đầu nghiêng 15 độ. Cái cách nắm micro như nắm cuốn lịch._
_{giam_doc} đứng xem tới hết bài. Rồi quay sang hỏi cả cánh gà:_
giam_doc: Ơ, bà ngoại cậu Sơn hôm nay khỏe hẳn rồi nhỉ?
_Không ai trả lời. {hong_hot} đã quay xong clip. {chi_dai} lắc đầu. {hr} nhắm mắt, như người vừa thấy điều mình sợ nhất._
_Ở Đài Tivi Hóng, bạn cúi chào. Bạn không biết, ở một cánh gà khác, sự nghiệp của bạn vừa cúi chào theo._
_Sáng thứ 2. Bàn điều phối. Một thùng carton._
_Bên trong: cuốn lịch bìa hồng (đã có người khác giữ), cây bút chì, một hộp kẹo ngậm bạc hà._
_Và một tờ giấy nghỉ ốm của Phòng khám Khỏe Re. Chưa dùng. Ngày ký: chủ nhật._
_Ai đó, chắc là {bac_bao_ve}, đã kẹp thêm vào thùng một mẩu giấy: "Bác không thấy gì đâu. Nhưng hát hay."_
-> END

// ------------------------------------------------------------
// 😢 🗓️ HẾT PHÉP CẢ ĐỜI
=== thanh_xin_nghi_kt_het_phep_ca_doi ===
# ngay:31 # gio:20:00 # noi:san_khau_dem_hong
{ son_ky_cam_ket:
    _Bạn đã ký bản cam kết "không nghỉ thêm ngày nào tới hết năm". Chữ ký vẫn còn mới mực._
- else:
    _Hồ sơ của bạn dày 3 cm. Phòng nhân sự đã đọc từng trang. Không còn lý do nào được duyệt nữa._
}
_20:00 ngày 31/10. Bạn ngồi sau cánh gà Đêm Hồng, cầm bộ đàm. Đèn đỏ nhấp nháy. Pháo giấy hồng chuẩn bị bắn._
_Điện thoại trong túi rung. Một tin nhắn tự động:_
_"Thí sinh Sơn Kim Tuyến vắng mặt. Suất chung kết thuộc về người dự bị."_
_Bạn đọc hai lần. Rồi tắt màn hình._
chi_dai: *(bộ đàm)* Sơn! Pháo giấy!
thanh_xin_nghi: Dạ. Ba, hai, một. Bắn.
_Pháo giấy hồng rơi đầy sân khấu. {sieu_nhan_hong} tạo dáng. 5.000 người hò reo. Không ai nhìn ra cánh gà._
_Bạn khẽ ngân nga một câu. Câu đầu của bài chung kết, bài bạn tập cả tháng._
_Chỉ có {cho} nghe. Nó nằm dưới chân bạn, ngẩng lên, nghiêng đầu, vẫy đuôi một cái rất nhẹ._
_Rồi nó gác cằm lên giày bạn. Như nói: tao nghe rồi. Hay mà._
-> END

// ------------------------------------------------------------
// 😢 🛵 HAI GHẾ MỘT MÔNG
=== thanh_xin_nghi_kt_hai_ghe_mot_mong ===
# ngay:31 # gio:19:40 # noi:dai_lo_ket_xe
_19:25. Bạn thay đồ kim tuyến trong nhà vệ sinh sân khấu Đêm Hồng, đội tóc giả trên đường ra cổng, bấm gọi xe._
_19:31. Tài xế xe công nghệ hủy chuyến. "Em xin lỗi, xe em bể bánh."_
_19:34. Tài xế thứ hai hủy chuyến. "Em xin lỗi, xe em… bể bánh."_
_19:40. Tài xế thứ ba nhận chuyến, chở tới giữa Đại Lộ Kẹt Xe. Rồi hủy chuyến ngay giữa đường. "Em xin lỗi anh, em… cũng không biết vì sao."_
_Đại Lộ Kẹt Xe đứng im. Một biển đèn hậu đỏ rực tới chân trời._
_Bạn đứng giữa đường trong bộ đồ kim tuyến. Một tay cầm bộ đàm:_
chi_dai: *(bộ đàm)* Sơn đâu rồi?! Sơn! Xe đón Siêu Nhân Hồng đâu?!
_Một tay cầm điện thoại:_
phu_tro_ly_dai: *(điện thoại)* Sơn Kim Tuyến đâu rồi?! 10 phút nữa lên sóng!
_Hai giọng gọi hai cái tên. Cả hai đều là bạn. Không ai trong hai người đó có ở đây._
_Ông chú xe ôm bên cạnh nhìn bộ đồ kim tuyến: "Đi đám cưới hả con?"_
_Bạn tắt cả hai máy. Đứng dưới cột đèn đỏ. Và hát._
_Hát hết một bài. Không nhạc. Không micro. Người trên xe hơi kéo kính lên._
_Đèn chuyển xanh. Dòng xe nhích lên._
_Không ai vỗ tay._
-> END
