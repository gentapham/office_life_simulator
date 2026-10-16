// ============================================================
// THÁNH XIN NGHỈ: SƠN · SÁU KẾT THÚC
// Lựa chọn "hai sân khấu" chốt ở 19:10 ngày 31/10 (son_chon_dem_31), rồi cảnh dừng.
// Game gọi thanh_xin_nghi_3010_danh_gia sau Đại Nhạc Hội Siêu Nhân (23:00 – 23:45),
// khi ket_thuc_su_nghiep và chung_cong_ty_song đã chốt.
// Thứ tự xét (docs/so-tay-su-that.md mục 12):
//   Bí mật: Song Ca Đại Nhạc Hội Siêu Nhân (noi_song)
//   Vui:    Sơn Kim Tuyến                  (đi thi; hoặc xin nghỉ ốm nhưng đã tự thú với {hr})
//           Điều Phối Không Nghỉ Ngày Nào  (ở lại, không nghỉ từ 15/10, chưa chạm hạn mức phép)
//   Buồn:   Hai Ghế Một Mông               (chọn chạy cả hai)
//           Ốm Trên Sóng Truyền Hình       (xin nghỉ ốm để đi thi, chưa tự thú)
//           Hết Phép Cả Đời                (còn lại: ở lại nhưng phép cạn, bị soi, ký cam kết,
//                                           hoặc đã nghỉ trong hai tuần cuối)
// ============================================================

=== thanh_xin_nghi_3010_danh_gia ===
# ngay:31 # gio:23:00 # noi:san_khau_dem_hong # dieu_kien:sau_dem_hong # danh_gia
{
- son_chon_dem_31 == "noi_song":
    ~ chot_ket_thuc("song_ca_dem_hong")
    -> thanh_xin_nghi_kt_song_ca_dem_hong
- son_chon_dem_31 == "di_thi" || (son_chon_dem_31 == "nghi_om" && son_tu_thu_tuan):
    ~ chot_ket_thuc("son_kim_tuyen")
    -> thanh_xin_nghi_kt_son_kim_tuyen
- son_chon_dem_31 == "o_lai" && not son_nghi_tu_15 && not son_tung_soi_100 && not son_ky_cam_ket && son_ngay_phep > -10:
    ~ chot_ket_thuc("dieu_phoi_khong_nghi")
    -> thanh_xin_nghi_kt_dieu_phoi_khong_nghi
- son_chon_dem_31 == "ca_hai":
    ~ chot_ket_thuc("hai_ghe_mot_mong")
    -> thanh_xin_nghi_kt_hai_ghe_mot_mong
- son_chon_dem_31 == "nghi_om":
    ~ chot_ket_thuc("om_tren_song")
    -> thanh_xin_nghi_kt_om_tren_song
- else:
    ~ chot_ket_thuc("het_phep_ca_doi")
    -> thanh_xin_nghi_kt_het_phep_ca_doi
}

// ------------------------------------------------------------
// 😄 🎤 SƠN KIM TUYẾN
=== thanh_xin_nghi_kt_son_kim_tuyen ===
# ket_thuc:son_kim_tuyen # loai:co_hau # noi:dai_tivi_hong
_Đêm qua, bạn tới Đài Tivi Hóng lúc 19:52. Tóc giả đội lệch trên xe ôm, trang điểm dặm trong thang máy._
_20:41. Thí sinh số 27 đứng giữa sân khấu chung kết. Bài cuối. Không phải bài buồn, không phải bài vui. Bài của bạn. Cùng lúc đó, trên màn hình lớn ở sân khấu Đại Nhạc Hội, cả công ty đang xem._
_Bạn hát như người đã xin nghỉ 31 lần trong năm, và lần này không cần xin nữa._
{ son_giac_mo >= 80:
    phu_mc_dai: Quán quân "Giọng Ca Ước Mơ" năm nay là… SƠN KIM TUYẾN!
    _Pháo giấy kim tuyến rơi đầy sân khấu. Bạn cầm cúp. Lớp trang điểm lem thành hai vệt dài trên má. Kệ._
- else:
    phu_mc_dai: Quán quân năm nay là thí sinh số 12! Và á quân… SƠN KIM TUYẾN!
    _Không phải cúp vàng. Một bó hoa, một tấm bằng, và một tràng vỗ tay dài hơn bạn tưởng. Lớp trang điểm lem thành hai vệt dài trên má. Kệ. Lần đầu tiên bạn thua mà không phải nói dối ai._
}
_Ở hàng ghế khán giả, cô lễ tân Phòng khám Khỏe Re giơ tấm bảng tự làm: "KHÁCH VIP CỦA EM!"_
_Hậu trường. Điện thoại rung liên tục. Group Zalo-lô công ty: 400 tin nhắn. {hong_hot}: "Ủa alo? {thanh_xin_nghi} của mình hả?" {chi_dai}: "Tui biết mà!" {idol_het_thoi}: "Em biết anh là ai không? Anh là người cho mượn vest đó!"_
_Rồi một tin nhắn riêng, từ {hr}:_
{ son_don_nghi_viec_that:
    _"Anh vote cho em 47 lần đó. Đơn nghỉ việc anh duyệt rồi. Lý do ghi: 'Đi hát'. Lý do đầu tiên của em mà anh tin."_
- else:
    _"Anh vote cho em 47 lần đó. Thứ hai đi làm nhé. Từ giờ ngày nào em đi hát, cứ ghi 'đi hát'. Anh duyệt."_
}
_Bạn ngồi xuống bậc thang sau sân khấu, ôm cúp, cười tới khi nước mắt khô._
_Bạn mở album, tìm tấm ảnh bà ngoại cười khỏe re, gửi vào group công ty kèm một dòng:_
_"Bà em khỏe lắm. Bà chưa từng ốm. Từ hôm nay bà được nghỉ ốm vĩnh viễn."_
_Group im 3 giây. Rồi 21 cái thả tim. Cái đầu tiên của {hr}._
{ not chung_cong_ty_song:
    _Bên dưới, {giam_doc} nhắn thêm một dòng, giữa những ngày công ty đang đếm ngược: "Ít ra tháng này mình làm được một ngôi sao."_
}
-> END

// ------------------------------------------------------------
// 😄 📅 ĐIỀU PHỐI KHÔNG NGHỈ NGÀY NÀO
=== thanh_xin_nghi_kt_dieu_phoi_khong_nghi ===
# ket_thuc:dieu_phoi_khong_nghi # loai:co_hau # noi:san_khau_dem_hong
_Đêm qua, bạn tắt điện thoại. Cầm bộ đàm._
thanh_xin_nghi: Xe đón vào cổng sau. Anh {thuc_tap_sinh} giữ cửa cánh gà. Chị {chi_dai}, pháo giấy 20:14. Anh {it}, đèn số 3. Anh {sieu_nhan_hong}, chiếu xong chung kết là lên.
_Đại Nhạc Hội Siêu Nhân chạy như một chiếc đồng hồ. Không chồng lịch nào. Không ai đi lạc. Ngay cả {cho} cũng xuất hiện đúng lúc, đúng chỗ, đúng nhịp trống._
{ son_vao_chung_ket:
    _20 giờ, màn hình lớn chiếu chung kết "Giọng Ca Ước Mơ". Không có thí sinh số 27. Bạn biết. Bạn đã chọn._
- else:
    _20 giờ, màn hình lớn chiếu chung kết "Giọng Ca Ước Mơ". Bạn dừng chân ở bán kết. Bạn đứng nhìn người khác hát bài mình từng tập, rồi bấm bộ đàm gọi đội đèn._
}
{ chung_cong_ty_song:
    _Cuối đêm, con số đủ. Công ty sống. {giam_doc} đi một vòng cánh gà bắt tay từng người, tới bạn thì giữ tay lâu hơn: "Đêm nay không ai đi lạc. Nhờ em."_
- else:
    _Cuối đêm, con số không đủ. Nhưng {giam_doc} vẫn đi một vòng cánh gà bắt tay từng người, tới bạn thì nói: "Show không trễ một phút. Công ty sập hay không, cái này là của em."_
}
_Hôm 30, ở họp đánh giá, anh {hr} đã đọc tên người nhận thưởng chuyên cần đầu tiên sau 3 năm. Cả phòng tưởng nghe nhầm. Tên bạn._
_Tối thứ 7 tuần sau._
_Quán cà phê Sống Ảo. Bạn ngồi ghế cao, ôm đàn. Không khẩu trang, không mũ lưỡi trai._
_Cả công ty ngồi kín 3 bàn. {chi_dai} vỗ tay trước khi bạn hát. {idol_het_thoi} đòi song ca. {quan_ly_idol} ngồi cạnh {idol_het_thoi}, chỉ cầm một cái điện thoại. {sieu_nhan_hong} ăn bánh chuối chiên bàn trong góc, vỗ tay to nhất quán._
_Hàng đầu, {hr} giơ một cây lightstick tự làm. Ghi "SƠN"._
_Không ai phải bịa lý do gì cả._
thanh_xin_nghi: Bài đầu tiên, em tặng bà ngoại. Bà khỏe lắm. Bà chưa từng ốm.
_Cả quán cười. Bạn hát._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: SONG CA ĐẠI NHẠC HỘI SIÊU NHÂN
=== thanh_xin_nghi_kt_song_ca_dem_hong ===
# ket_thuc:song_ca_dem_hong # loai:co_hau # bi_mat # noi:san_khau_dem_hong
_Đêm qua, 20:00. {it} cắm sợi cáp cuối cùng. Màn hình lớn ở sân khấu Đại Nhạc Hội Siêu Nhân nhấp nháy, rồi chia đôi._
_Một nửa: Đài Tivi Hóng, chung kết "Giọng Ca Ước Mơ". Một nửa: Sân khấu Đại Nhạc Hội Siêu Nhân, Phường Tân Drama, cả khán đài cầm đèn hồng._
it: Có tín hiệu. Đừng ai đụng vào cái gì. Không restart.
_Bạn đứng ở Đài Tivi Hóng, kim tuyến từ đầu tới chân. Bên kia màn hình, {sieu_nhan_hong} đứng giữa sân khấu Đại Nhạc Hội Siêu Nhân, giơ tay chào._
phu_mc_dai: Và đây là tiết mục đặc biệt nhất đêm nay! Thí sinh {thanh_xin_nghi} Kim Tuyến… song ca trực tiếp với… SIÊU NHÂN HỒNG!
_Nhạc dạo "Công Viên". Bản mới. Bạn hát câu đầu. {sieu_nhan_hong} hát câu hai, sai lời: "khoai chiên". Cả hai sân khấu cùng cười._
_Rồi tới điệp khúc. Một giọng thứ ba vang lên từ cánh gà Đại Nhạc Hội Siêu Nhân. {idol_het_thoi}, không kính đen, hát bè. {quan_ly_idol} đứng cạnh, hai điện thoại tắt trong túi._
_Kim tuyến và màu hồng lấp lánh trên sóng toàn quốc. Bộ đếm người theo dõi của {sieu_nhan_hong} nhảy như điên{chung_cong_ty_song:, và lần này nó nhảy qua vạch|, dù cuối đêm vẫn không đủ}._
_Ở hàng ghế đầu sân khấu Đại Nhạc Hội Siêu Nhân, {hr} đứng dậy, giơ cây lightstick ghi "SƠN KIM TUYẾN". Không giấu nữa._
_Cạnh đó, {giam_doc} trong bộ "Ông Kẹ Ngân Hàng" quay sang hỏi:_
giam_doc: {hr}, em biết từ bao giờ?
hr: Từ 47 tin nhắn trước, anh.
_Hết bài. Hai sân khấu, một tràng vỗ tay. Bạn nhìn vào ống kính, nói câu đầu tiên trong đời không cần ho trước:_
thanh_xin_nghi: Em cảm ơn bà ngoại. Và cảm ơn công ty đã cho em nghỉ… 31 lần.
-> END

// ------------------------------------------------------------
// 😢 📺 ỐM TRÊN SÓNG TRUYỀN HÌNH
=== thanh_xin_nghi_kt_om_tren_song ===
# ket_thuc:om_tren_song # loai:buon # noi:san_khau_dem_hong
_Đêm qua, 20:30. Màn hình lớn ở sân khấu Đại Nhạc Hội Siêu Nhân đang chiếu trực tiếp chung kết "Giọng Ca Ước Mơ", đúng như lịch chạy._
_{giam_doc} đi ngang, tay cầm ly cà phê, bộ "Ông Kẹ Ngân Hàng" xộc xệch. Ông ấy dừng lại._
_Trên màn hình: thí sinh số 27, kim tuyến lấp lánh, tóc giả, hát rất hay. Camera quay cận. Cái đầu nghiêng 15 độ. Cái cách nắm micro như nắm cuốn lịch._
_{giam_doc} đứng xem tới hết bài. Rồi quay sang hỏi cả cánh gà:_
giam_doc: Ơ, bà ngoại cậu {thanh_xin_nghi} hôm nay khỏe hẳn rồi nhỉ?
_Không ai trả lời. {hong_hot} đã quay xong clip. {chi_dai} lắc đầu. {hr} nhắm mắt, như người vừa thấy điều mình sợ nhất: không phải bạn đi hát, mà bạn nói dối tới tận đêm nay._
_Ở Đài Tivi Hóng, bạn cúi chào. Bạn không biết, ở một cánh gà khác, sự nghiệp của bạn vừa cúi chào theo._
_Sáng thứ 2. Bàn điều phối. Một thùng carton._
_Bên trong: cuốn lịch bìa hồng (đã có người khác giữ), cây bút chì, một hộp kẹo ngậm bạc hà._
_Và một tờ giấy nghỉ ốm của Phòng khám Khỏe Re. Chưa dùng. Ngày ký: chủ nhật._
_Ai đó, chắc là {bac_bao_ve}, đã kẹp thêm vào thùng một mẩu giấy: "Bác không thấy gì đâu. Nhưng hát hay."_
-> END

// ------------------------------------------------------------
// 😢 🗓️ HẾT PHÉP CẢ ĐỜI
=== thanh_xin_nghi_kt_het_phep_ca_doi ===
# ket_thuc:het_phep_ca_doi # loai:buon # noi:san_khau_dem_hong
{ son_ky_cam_ket:
    _Bạn đã ký bản cam kết "không nghỉ thêm ngày nào tới hết năm". Chữ ký vẫn còn mới mực._
- else:
    _Hồ sơ của bạn dày 3 cm. Phòng nhân sự đã đọc từng trang. Phép âm {0 - son_ngay_phep} ngày. Không còn lý do nào được duyệt nữa._
}
_Đêm qua, 20:00. Bạn ngồi sau cánh gà Đại Nhạc Hội Siêu Nhân, cầm bộ đàm. Đèn đỏ nhấp nháy. Pháo giấy hồng chuẩn bị bắn._
{ son_vao_chung_ket:
    _Điện thoại trong túi rung. Một tin nhắn tự động:_
    _"Thí sinh số 27, {thanh_xin_nghi} Kim Tuyến, vắng mặt. Suất chung kết thuộc về người dự bị."_
    _Bạn đọc hai lần. Rồi tắt màn hình. Trên màn hình lớn, người dự bị đang hát._
- else:
    _Bạn đã dừng chân ở bán kết. Trên màn hình lớn, người khác đang hát bài bạn tập cả tháng. Tối nay bạn chỉ còn một việc: không được nghỉ._
}
chi_dai: *(bộ đàm)* {thanh_xin_nghi}! Pháo giấy!
thanh_xin_nghi: Dạ. Ba, hai, một. Bắn.
_Pháo giấy hồng rơi đầy sân khấu. {sieu_nhan_hong} tạo dáng. Cả khán đài hò reo. Không ai nhìn ra cánh gà._
_Sáng thứ hai, trên bàn điều phối có một tờ giấy mới của phòng nhân sự: lịch trực Tết. Tên bạn ở mọi ô._
_Bạn khẽ ngân nga một câu. Câu đầu của bài chung kết, bài bạn tập cả tháng._
_Chỉ có {cho} nghe. Nó nằm dưới chân bạn, ngẩng lên, nghiêng đầu, vẫy đuôi một cái rất nhẹ._
_Rồi nó gác cằm lên giày bạn. Như nói: tao nghe rồi. Hay mà._
-> END

// ------------------------------------------------------------
// 😢 🛵 HAI GHẾ MỘT MÔNG
=== thanh_xin_nghi_kt_hai_ghe_mot_mong ===
# ket_thuc:hai_ghe_mot_mong # loai:buon # noi:dai_lo_ket_xe
_Đêm qua, 19:25. Bạn thay đồ kim tuyến trong nhà vệ sinh sân khấu Đại Nhạc Hội Siêu Nhân, đội tóc giả trên đường ra cổng, bấm gọi xe._
_19:31. Tài xế xe công nghệ hủy chuyến. "Em xin lỗi, xe em bể bánh."_
_19:34. Tài xế thứ hai hủy chuyến. "Em xin lỗi, xe em… bể bánh."_
_19:40. Tài xế thứ ba nhận chuyến, chở tới giữa Đại Lộ Kẹt Xe. Rồi hủy chuyến ngay giữa đường. "Em xin lỗi anh, em… cũng không biết vì sao."_
_Đại Lộ Kẹt Xe đứng im. Một biển đèn hậu đỏ rực tới chân trời._
_Bạn đứng giữa đường trong bộ đồ kim tuyến. Một tay cầm bộ đàm:_
chi_dai: *(bộ đàm)* {thanh_xin_nghi} đâu rồi?! {thanh_xin_nghi}! Xe đón Siêu Nhân Hồng đâu?!
_Một tay cầm điện thoại:_
phu_tro_ly_dai: *(điện thoại)* {thanh_xin_nghi} Kim Tuyến đâu rồi?! 10 phút nữa lên sóng!
_Hai giọng gọi hai cái tên. Cả hai đều là bạn. Không ai trong hai người đó có ở đây._
_Ông chú xe ôm bên cạnh nhìn bộ đồ kim tuyến: "Đi đám cưới hả con?"_
_Bạn tắt cả hai máy. Đứng dưới cột đèn đỏ. Và hát._
_Hát hết một bài. Không nhạc. Không micro. Người trên xe hơi kéo kính lên._
_Đèn chuyển xanh. Dòng xe nhích lên._
_Không ai vỗ tay._
_Ở sân khấu Đại Nhạc Hội, màn hình lớn chiếu chung kết thiếu thí sinh số 27. Ở cánh gà, xe đón {sieu_nhan_hong} tới trễ 20 phút. Hai nơi cần bạn. Không nơi nào có bạn._
-> END
