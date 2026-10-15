// ============================================================
// SALES · KẾT THÚC
// Thứ tự ưu tiên khi đánh giá (30/10):
//   1. Bong Bóng Bể        (Bong Bóng Phét = 100, có thể xảy ra bất cứ lúc nào)
//   2. Tủ Lạnh Trống Mãi   (Sổ Tạm Ứng ≥ 5tr, ví < 0, chưa đòi được nợ Chương)
//   3. Kevin Trộn Có Thật  (bí mật)
//   4. KPI Thật 100%
//   5. Song Kiếm Hợp Bích
//   6. Cô Bé Chăn Cừu      (deal thật bị bỏ lỡ, KPI Trên Giấy ngày 28/10 ≥ 250%)
//   Không khớp: đã ký Sữa Chua Hồng Hào thì "KPI Thật 100%",
//   KPI Thật ≥ 300 triệu và thân Quỳnh thì "Song Kiếm Hợp Bích",
//   còn lại "Cô Bé Chăn Cừu".
// "Chưa đòi được nợ Chương": còn nợ trên 3.000.000đ.
// ============================================================

// ------------------------------------------------------------
=== sales_3010_danh_gia ===
# ngay:30 # gio:17:30 # noi:ban_sales # bat_buoc
_17 giờ 30. Buổi đánh giá đã xong. Bạn ngồi một mình ở bàn, điện thoại úp mặt xuống. Lần đầu tiên trong tháng, bạn không muốn gọi cho ai._
{
- sl_bong_bong >= 100:
    ~ chot_ket_thuc("bong_bong_be")
    -> sales_kt_bong_bong_be
- sl_tam_ung >= 5000000 && tien < 0 && sl_no_chuong > 3000000:
    ~ chot_ket_thuc("tu_lanh_trong_mai")
    -> sales_kt_tu_lanh_trong_mai
- biet(duy_tung_lam_ngan_hang) && sl_kevin_dien_vien == "thuc_tap_sinh" && sl_kevin_thanh_cong && sl_btt_xu_huong && nguoi_theo_doi >= 1000000:
    ~ chot_ket_thuc("kevin_tron_co_that")
    -> sales_kt_kevin_tron_co_that
- sl_ky_sua_chua && sl_kpi_that >= 1000 && sl_tu_nhan_btt_gia && sl_bong_bong < 30:
    ~ chot_ket_thuc("kpi_that_100")
    -> sales_kt_kpi_that_100
- qh_designer >= 80 && not sl_bi_mat_lo && sl_kpi_that >= 300 && sl_quynh_cat_dut_ll:
    ~ chot_ket_thuc("song_kiem_hop_bich")
    -> sales_kt_song_kiem_hop_bich
- not sl_ky_sua_chua && sl_kpi_giay_2810 >= 250:
    ~ chot_ket_thuc("co_be_chan_cuu")
    -> sales_kt_co_be_chan_cuu
- sl_ky_sua_chua:
    ~ chot_ket_thuc("kpi_that_100")
    -> sales_kt_kpi_that_100
- sl_kpi_that >= 300 && qh_designer >= 60:
    ~ chot_ket_thuc("song_kiem_hop_bich")
    -> sales_kt_song_kiem_hop_bich
- else:
    ~ chot_ket_thuc("co_be_chan_cuu")
    -> sales_kt_co_be_chan_cuu
}

// ------------------------------------------------------------
// Sự kiện tức thời: Bong Bóng Phét chạm 100
=== sales_tudo_bong_bong_be ===
# ngau_nhien # bat_buoc # dieu_kien:sl_bong_bong>=100
_Bạn nghe một tiếng "bụp" trong đầu. Không ai khác nghe thấy. Nhưng mọi thứ bắt đầu từ đó._
~ chot_ket_thuc("bong_bong_be")
-> sales_kt_bong_bong_be

// ============================================================
// 😄 1. KPI THẬT 100%
// ============================================================
=== sales_kt_kpi_that_100 ===
# dieu_kien:ket_thuc_kpi_that_100
_Buổi đánh giá. Màn hình chiếu hai cột: KPI Trên Giấy và KPI Thật._
_Lần đầu tiên trong lịch sử Phòng Kinh doanh, hai cột cao bằng nhau. {dan_dau_tu} phải phóng to màn hình để chắc mình không nhìn nhầm._
dan_dau_tu: Ờ… khớp. Khớp thật. Anh nhìn chart 15 năm, lần đầu thấy cột của em không có trục tung ảo.
_{giam_doc} đứng dậy. Bằng khen "Doanh nhân của năm" trên tường phòng ông đã được tháo xuống từ lâu, nếu từng có._
giam_doc: Từ tháng 11, {sales} là Trưởng nhóm Kinh doanh. Lương tăng 20%. Lần này… anh hứa có giấy.
_Cả phòng vỗ tay. Bạn đứng lên phát biểu. Bạn mở miệng, và câu quen thuộc đã nằm sẵn trên đầu lưỡi: "Tin chị đi…"_
_Rồi bạn dừng lại. Bạn nhìn {ke_toan}, {chi_dai}, {designer}, {thuc_tap_sinh}. Những người lớn hơn bạn, đã đỡ bạn cả tháng._
sales: Mọi người… tin em nha.
_Một giây im lặng. Rồi cả phòng vỗ tay. {ke_toan} vỗ to nhất, to tới mức cây bút bi 3 chữ ký rơi khỏi bàn._
ke_toan: *(nói nhỏ khi đi ngang)* Hóa đơn của em… lần đầu chị không cần hỏi.
{ sl_bong_bong >= 30:
    _Bong bóng trong ngực bạn vẫn còn đó, nhỏ thôi. Những lời phét cũ chưa trả hết. Nhưng bạn có cả năm để trả, bằng việc thật._
}
_Tối đó, bạn đi chợ. Mua rau, trứng, thịt, sữa chua Hồng Hào. Về căn 1203, xếp đầy tủ lạnh._
_Bạn chụp một tấm ảnh cái tủ lạnh đầy. Không filter. Không caption. Không đăng._
_Có những thứ thật tới mức không cần ai xem._
-> END

// ============================================================
// 😄 2. SONG KIẾM HỢP BÍCH
// ============================================================
=== sales_kt_song_kiem_hop_bich ===
# dieu_kien:ket_thuc_song_kiem_hop_bich
_Tháng 12. Tầng trệt chung cư mini Phố Mới. Một mặt bằng 20 mét vuông, tường trắng, cửa kính, chưa có bàn._
_Biển hiệu: "QUỲNH VẼ, HUYỀN BÁN". Do {designer} thiết kế. Dòng chữ nhỏ bên dưới: "Khách hàng không được sửa biển hiệu."_
designer: Biển hiệu này là bản 1. Không sửa.
sales: Dạ. Em bán y nguyên.
_Cửa mở. Một bộ đồ hồng bước vào, tay ôm đĩa bánh chuối chiên._
sieu_nhan_hong: Biến hình! Em là khách đầu tiên phải hông? Em muốn đặt bộ nhận diện mới!
sales: Dạ anh. Giá này là giá thật. Hạn này là hạn thật. Em nói thật hết đó.
sieu_nhan_hong: *(cười)* Em tin. Mà… chị không nói "tin chị đi" nữa hả?
sales: Dạ không. Giờ em để khách tự tin.
_Hợp đồng đầu tiên của studio: ký với Siêu Nhân Hồng. Có mộc. Có mã số thuế. Không có Kevin Trộn._
_Tuần sau, bạn trả lại căn 1203 ở Sky Ảo. Dọn về một căn nhỏ ở Phố Mới, cách studio 2 tầng lầu._
_Đêm đầu tiên ở nhà mới, bạn mở tủ lạnh. Có đồ ăn. Rau, trứng, cơm nguội, và một hộp sữa chua._
_Bạn đứng nhìn cái tủ lạnh rất lâu. Lần đầu tiên tủ lạnh nhà mình có đồ ăn mà không phải đồ gói từ tiệc của ai._
designer: *(nhắn)* Mai 8 giờ mở cửa. Đừng trễ, chị không có quỹ phạt trà sữa đâu.
sales: Dạ. Em đi sớm. Thật.
-> END

// ============================================================
// 😄 3. KEVIN TRỘN CÓ THẬT (bí mật)
// ============================================================
=== sales_kt_kevin_tron_co_that ===
# dieu_kien:ket_thuc_kevin_tron_co_that
_Một tuần sau Đêm Hồng. Siêu Nhân Hồng vượt một triệu người theo dõi. Nhưng thứ đứng top tìm kiếm trên mạng lại là…_
_"Bánh tráng trộn BTT mua ở đâu?"_
hong_hot: Bà ơi! Dân mạng đi khắp thành phố tìm "bánh tráng trộn của chủ tịch Kevin"! Không có chỗ nào bán! Họ đòi mua!
_Bạn ngồi đó, nhìn màn hình, không biết nên cười hay nên trốn._
_Rồi {thuc_tap_sinh} gõ cửa. Áo vest. Tay cầm một tập hồ sơ dày. Không cúi đầu._
thuc_tap_sinh: Chị {sales}. Em… à không. {sales}. Tôi có một đề xuất kinh doanh.
_Anh đặt hồ sơ lên bàn. Giấy phép đăng ký doanh nghiệp: Công ty TNHH Bánh Tráng Trộn Toàn Cầu. Vốn điều lệ: tiền tiết kiệm 8 năm làm ngân hàng._
thuc_tap_sinh: Thị trường đã chứng minh có nhu cầu. Thương hiệu đã có người nhận diện. Chỉ thiếu sản phẩm. Và một Giám đốc Kinh doanh.
thuc_tap_sinh: Tôi mời chị. Lương thật. Hợp đồng thật. Tôi đọc kỹ từng trang rồi.
sales: *(run run)* Anh… anh không sợ bị hỏi mượn tiền nữa hả?
thuc_tap_sinh: *(cười)* Sợ. Nhưng lần này, tôi muốn làm đúng một điều liều lĩnh.
_Ngày khai trương. Chiếc xe đẩy bánh tráng trộn đầu tiên, sơn vàng, logo xoắn ốc do {designer} vẽ năm xưa, đậu trước cổng {cong_ty}._
_Khách hàng đầu tiên là {cho}. Nó ngồi xuống, nhìn bịch bánh tráng, rồi nhìn bạn._
cho: Gâu! *(vẫy đuôi)*
_Bác {bac_bao_ve} đứng trong chòi, uống trà đá, nhìn xe bánh tráng, nói khẽ: "Thế à."_
_Mr. Kevin Trộn chưa bao giờ có thật. Nhưng từ hôm nay, anh ta có một chiếc xe đẩy, một giấy phép, và một Giám đốc Kinh doanh không bao giờ nói phét nữa. Gần như không bao giờ._
-> END

// ============================================================
// 😢 4. BONG BÓNG BỂ
// ============================================================
=== sales_kt_bong_bong_be ===
# dieu_kien:ket_thuc_bong_bong_be
_{hong_hot} đang livestream fanpage, lia máy quanh văn phòng chào khán giả. "Đây là bàn của chị {sales}, sales số một công ty nè mọi người!"_
_Máy quay dừng 2 giây trên màn hình laptop của bạn. Trang tra cứu doanh nghiệp đang mở. Dòng chữ đỏ:_
_"BTT Global: Không tìm thấy doanh nghiệp."_
_Bạn quay lại. Quá muộn. 8.000 người đang xem. Ai đó chụp màn hình. Rồi một trăm người chụp._
hong_hot: *(tắt livestream, mặt tái mét)* Bà ơi… tui… tui không cố ý…
_Clip lan khắp mạng trước giờ ăn trưa. Tiêu đề: "Siêu Nhân Hồng dính nhà tài trợ ma". Bằng khen "Doanh nhân của năm" của {giam_doc} thành meme._
~ follow(-80000)
~ scandal()
_15 giờ. Tin nhắn của {hr}: "Em rảnh không, lên phòng anh uống trà xíu."_
hr: *(rót trà, giọng nhẹ)* Mình cùng nhìn lại hành trình nha em. Lần cuối.
_Bạn ôm thùng carton xuống cầu thang. Trong thùng: điện thoại sạc dự phòng, đôi giày cao gót, xấp danh thiếp "Chuyên viên Kinh doanh"._
_Và bằng khen "Doanh nhân của năm", BTT Global. {giam_doc} gỡ xuống, bỏ vào thùng của bạn, không nói câu nào._
{ qh_designer >= 50:
    _Ở chân cầu thang, {designer} đứng đợi. Không nói gì. Chỉ cầm giúp bạn một góc thùng. Ra tới cổng._
}
_Bác {bac_bao_ve} ngồi trong chòi. Bác nhìn bạn, rồi nhìn ra đường._
bac_bao_ve: Bác không thấy gì đâu.
_Bạn bước ra Đại lộ Kẹt Xe. Điện thoại rung liên tục. Lần đầu tiên trong đời, bạn không muốn nghe máy._
-> END

// ============================================================
// 😢 5. CÔ BÉ CHĂN CỪU
// ============================================================
=== sales_kt_co_be_chan_cuu ===
# dieu_kien:ket_thuc_co_be_chan_cuu
_Đêm 31/10. Đêm Hồng. Bạn đứng dưới khán đài, giữa đám đông, không phải sau cánh gà. Không ai cần bạn ở cánh gà nữa._
_Sân khấu nhỏ hơn dự kiến. Đèn thiếu, khói thiếu. Logo nhà tài trợ: quán ốc, tiệm nail, phòng khám. Những cái tên nhỏ, nhưng thật._
_Bạn ngước lên. Bên kia đường, tòa nhà kính 20 tầng của LL-Entertainment. Màn hình LED khổng lồ đang chạy quảng cáo._
_"LL-Entertainment hân hạnh hợp tác cùng Sữa Chua Hồng Hào."_
_Logo hồng nhạt. Hộp sữa chua xoay tròn. Cái tên bạn đã nghe qua điện thoại, chiều 27/10. Bằng một giọng nói rất thật._
hong_hot: *(đứng cạnh, nhìn lên)* Ủa… Sữa Chua Hồng Hào… cái tên quen quen ta.
_{hong_hot} không nhớ. Không ai nhớ. Chỉ có bạn nhớ._
_Lần nói thật duy nhất trong đời. Không ai tin._
_Và điều làm bạn đau nhất: kể cả bạn, lúc đó, cũng không tin._
{ qh_designer >= 50:
    _{designer} nắm tay bạn trong đám đông. Không nói gì. Bạn siết lại thật chặt._
}
_Bạn rút điện thoại, mở danh bạ. Số điện thoại của Sữa Chua Hồng Hào vẫn còn đó, lưu tên "chắc ai chọc"._
_Bạn đổi tên nó thành "Lần sau tin mình". Rồi cất điện thoại đi, và vỗ tay cho Siêu Nhân Hồng._
-> END

// ============================================================
// 😢 6. TỦ LẠNH TRỐNG MÃI
// ============================================================
=== sales_kt_tu_lanh_trong_mai ===
# dieu_kien:ket_thuc_tu_lanh_trong_mai
_Ngày 1 tháng 11. Sổ Tạm Ứng: {sl_tam_ung}đ chưa có hóa đơn. Ví: số âm. {ke_toan} trừ dần vào lương, mỗi tháng một ít, đều đặn như mưa._
_Bạn trả lại căn 1203 ở Sky Ảo. Sofa nhung, đèn chùm, view thành phố: trả hết. Trong tủ lạnh chỉ còn chai tương ớt. Bạn để lại cho người thuê sau._
_Hẻm 69. Gác lửng. Bà Tư chủ trọ đưa chìa khóa: "Phòng này mát, sát vách thằng Chương. Nay mùng mấy rồi con?"_
_Phòng nhỏ. Cửa sổ nhìn ra tường. Bạn đặt thùng carton xuống, ngồi lên giường, nghe tiếng chart nhấp nháy bên kia vách._
_Đêm đầu tiên. 23 giờ. Có tiếng gõ tường._
dan_dau_tu: *(vọng qua vách)* {sales} ơi. Em ở bên đó hả? Anh nghe tiếng giày cao gót.
dan_dau_tu: Lần này là lên thật. Mai anh trả em gấp đôi.
_Bạn nằm nhìn trần nhà. Trên trần có một vết ố hình đồng xu._
_Bạn xé gói mì cuối cùng. Không có bát sứ. Không có nến. Không có hai cọng hành._
_Bạn cầm điện thoại lên, mở camera, định chụp story. Rồi bạn nhận ra: không còn ai để chụp story cho._
_Bạn ăn mì. Mì vẫn ngon. Chỉ là không ai biết._
-> END
