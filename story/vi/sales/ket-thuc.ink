// ============================================================
// SALES · KẾT THÚC
// Game gọi sales_3010_danh_gia sau Đại Nhạc Hội Siêu Nhân (23:00 – 23:45 ngày 31/10),
// khi ket_thuc_su_nghiep và chung_cong_ty_song đã chốt.
// Thứ tự xét (docs/so-tay-su-that.md mục 12):
//   Bí mật: Kevin Trộn Có Thật (biết bí mật của Duy, Duy đóng Kevin thành công,
//           BTT lên xu hướng, bong bóng chưa bể)
//   Vui:    KPI Thật 100%      (ký Sữa Chua đúng hẹn, tự nhận BTT giả, bong bóng < 60)
//           Song Kiếm Hợp Bích (Quỳnh cắt LL, thân Quỳnh ≥ 60, bong bóng < 60,
//                               ký Sữa Chua hoặc nói thật ≥ 8 lần)
//   Buồn:   Bong Bóng Bể       (Bong Bóng Phét chạm 100)
//           Tủ Lạnh Trống Mãi  (Sổ Tạm Ứng ≥ 3 triệu, Chương còn nợ ≥ 1,5 triệu, không ký Sữa Chua)
//           Cô Bé Chăn Cừu     (còn lại)
// ============================================================

// ------------------------------------------------------------
=== sales_3010_danh_gia ===
# ngay:31 # gio:23:00 # noi:san_khau_dem_hong # dieu_kien:sau_dem_hong # danh_gia
_23 giờ 30. Quảng trường vắng dần. Bạn ngồi trên bậc sân khấu, giày cao gót cầm tay. {designer} ngồi xuống cạnh, đưa bạn một hộp sữa chua._
{ sl_ky_sua_chua:
    designer: Hồng Hào. Hàng tài trợ. Còn dư 200 hộp.
- else:
    designer: Chị mua ở tiệm tạp hóa đầu quảng trường. Cái hộp cuối cùng.
}
{ chung_cong_ty_song:
    _Bộ đếm trên màn hình lớn đã tắt, nhưng ai cũng biết: {cong_ty} còn sống. Ít nhất là thêm một mùa._
- else:
    _Bộ đếm trên màn hình lớn đã tắt. Không ai nói ra, nhưng ai cũng biết: thứ hai này, {ke_toan} sẽ ngồi tính con số 10 tỷ._
}
{
- biet(duy_tung_lam_ngan_hang) && sl_kevin_dien_vien == "thuc_tap_sinh" && sl_kevin_thanh_cong && sl_btt_xu_huong && sl_bong_bong < 100:
    ~ chot_ket_thuc("kevin_tron_co_that")
    -> sales_kt_kevin_tron_co_that
- sl_ky_sua_chua && sl_kpi_that >= 1000 && sl_tu_nhan_btt_gia && sl_bong_bong < 60:
    ~ chot_ket_thuc("kpi_that_100")
    -> sales_kt_kpi_that_100
- sl_quynh_cat_dut_ll && qh_designer >= 60 && sl_bong_bong < 60 && (sl_ky_sua_chua || sl_noi_that >= 8):
    ~ chot_ket_thuc("song_kiem_hop_bich")
    -> sales_kt_song_kiem_hop_bich
- sl_bong_bong >= 100:
    ~ chot_ket_thuc("bong_bong_be")
    -> sales_kt_bong_bong_be
- sl_tam_ung >= 3000000 && sl_no_chuong >= 1500000 && not sl_ky_sua_chua:
    ~ chot_ket_thuc("tu_lanh_trong_mai")
    -> sales_kt_tu_lanh_trong_mai
- else:
    ~ chot_ket_thuc("co_be_chan_cuu")
    -> sales_kt_co_be_chan_cuu
}

// ============================================================
// 😄 1. KPI THẬT 100%
// ============================================================
=== sales_kt_kpi_that_100 ===
# ket_thuc:kpi_that_100 # loai:co_hau
_Thứ hai, 2/11. Họp giao ban đầu tháng. Màn hình chiếu lại hai cột: KPI Trên Giấy và KPI Thật._
_Lần đầu tiên trong lịch sử Phòng Kinh doanh, hai cột cao bằng nhau. {dan_dau_tu} phải phóng to màn hình để chắc mình không nhìn nhầm._
dan_dau_tu: Ờ… khớp. Khớp thật. Anh nhìn chart ba năm nay, lần đầu thấy cột của em không có trục tung ảo.
{ chung_cong_ty_song:
    _{giam_doc} đứng dậy. Bằng khen "Doanh nhân của năm" trên tường phòng ông đã được tháo xuống từ lâu, nếu từng có._
    giam_doc: Từ tháng 11, {sales} là Trưởng nhóm Kinh doanh. Lương tăng 20%. Lần này… anh hứa có giấy.
- else:
    _Công ty đang đếm ngược tới ngày hoàn 10 tỷ. Nhưng 1 tỷ của bà cụ là 1 tỷ thật, đủ để trả lương thêm vài tháng và mở một cuộc đàm phán với {sieu_nhan_hong}._
    giam_doc: Công ty có thể không qua nổi Tết. Nhưng nếu qua, thì là nhờ em. Anh ghi tên em vào biên bản, có giấy hẳn hoi.
}
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
# ket_thuc:song_kiem_hop_bich # loai:co_hau
_Tháng 12. Tầng trệt chung cư mini Phố Mới. Một mặt bằng 20 mét vuông, tường trắng, cửa kính, chưa có bàn._
_Biển hiệu: "QUỲNH VẼ, HUYỀN BÁN". Do {designer} thiết kế. Dòng chữ nhỏ bên dưới: "Khách hàng không được sửa biển hiệu."_
designer: Biển hiệu này là bản 1. Không sửa.
sales: Dạ. Em bán y nguyên.
_Cửa mở. Một bộ đồ hồng bước vào, tay ôm đĩa bánh chuối chiên._
sieu_nhan_hong: Biến hình! Em là khách đầu tiên phải hông? Em muốn đặt bộ nhận diện mới!
sales: Dạ anh. Giá này là giá thật. Hạn này là hạn thật. Em nói thật hết đó.
sieu_nhan_hong: *(cười)* Em tin. Mà… chị không nói "tin chị đi" nữa hả?
sales: Dạ không. Giờ em để khách tự tin.
{ nguyen_theo_ll:
    _Hợp đồng đầu tiên của studio không phải với Siêu Nhân Hồng. Anh đã sang bên kia đường. Khách đầu tiên là chú chủ Quán Ốc Đêm, trả bằng tiền thật, có hóa đơn._
- else:
    _Hợp đồng đầu tiên của studio: ký với Siêu Nhân Hồng. Có mộc. Có mã số thuế. Không có Kevin Trộn._
}
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
# ket_thuc:kevin_tron_co_that # loai:co_hau # bi_mat
{
- ket_thuc_su_nghiep == "sieu_sao_hang_a":
    _Một tuần sau Đại Nhạc Hội Siêu Nhân. Siêu Nhân Hồng vượt một triệu người theo dõi. Nhưng thứ đứng top tìm kiếm trên mạng lại là…_
- chung_cong_ty_song:
    _Một tuần sau Đại Nhạc Hội Siêu Nhân. {cong_ty} sống sót. Nhưng thứ đứng top tìm kiếm trên mạng không phải Siêu Nhân Hồng, mà là…_
- else:
    _Một tuần sau Đại Nhạc Hội Siêu Nhân. {cong_ty} đang đếm ngày đóng cửa. Lạ một điều: thứ đứng top tìm kiếm trên mạng tuần đó lại là…_
}
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
# ket_thuc:bong_bong_be # loai:buon
_Thứ hai, 2/11. {hong_hot} đang livestream fanpage, lia máy quanh văn phòng chào khán giả. "Đây là bàn của chị {sales}, sales số một công ty nè mọi người!"_
_Máy quay dừng 2 giây trên màn hình laptop của bạn. Trang tra cứu doanh nghiệp đang mở. Dòng chữ đỏ:_
_"BTT Global: Không tìm thấy doanh nghiệp."_
_Bạn quay lại. Quá muộn. 8.000 người đang xem. Ai đó chụp màn hình. Rồi một trăm người chụp._
hong_hot: *(tắt livestream, mặt tái mét)* Bà ơi… tui… tui không cố ý…
_Clip lan khắp mạng trước giờ ăn trưa. Tiêu đề: "Siêu Nhân Hồng dính nhà tài trợ ma". Bằng khen "Doanh nhân của năm" của {giam_doc} thành meme._
{ chung_cong_ty_song:
    _Công ty vừa sống sót qua Đại Nhạc Hội. Giờ nó cần một người để đổ lỗi cho cái meme mới._
- else:
    _Công ty vốn đã hấp hối sau Đại Nhạc Hội. Cái clip chỉ cho mọi người một cái tên để nhắc tới._
}
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
# ket_thuc:co_be_chan_cuu # loai:buon
_Bạn nhìn lại cả buổi tối. Bạn đã đứng dưới khán đài, giữa đám đông, không phải sau cánh gà. Không ai cần bạn ở cánh gà nữa._
{ sl_ky_sua_chua:
    _Logo Sữa Chua Hồng Hào nằm trên sân khấu của bạn. Bà cụ ký thật, tiền về thật. Nhưng lúc MC đọc tên nhà tài trợ, dưới khán đài có người xì xào: "Lại nhà tài trợ của {sales} hả? Chắc cũng như BTT thôi."_
    hong_hot: *(đứng cạnh, nói nhỏ)* Bà ơi… cái này thật hả? Tui hỏi thiệt, tui hết biết cái nào thật của bà rồi.
    _Cả tháng bạn nói phét. Tới lúc có cái thật, nó cũng bị coi là phét._
- else:
    _Sân khấu nhỏ hơn dự kiến. Đèn thiếu, khói thiếu. Logo nhà tài trợ: quán ốc, tiệm nail, phòng khám. Những cái tên nhỏ, nhưng thật._
    _Bên kia quảng trường, màn hình LED trên tòa LL-Entertainment chạy suốt buổi: "LL-Entertainment hân hạnh hợp tác cùng Sữa Chua Hồng Hào."_
    _Logo hồng nhạt. Hộp sữa chua xoay tròn. Cái tên bạn đã nghe qua điện thoại, trưa 27/10. Bằng một giọng bà cụ rất thật._
    hong_hot: *(đứng cạnh, nhìn lên)* Ủa… Sữa Chua Hồng Hào… cái tên quen quen ta.
    _{hong_hot} không nhớ. Không ai nhớ. Chỉ có bạn nhớ._
    { sl_tin_cuoc_goi:
        _Lần này bạn tin. Nhưng tới lúc bà cụ hỏi một câu thật, bạn lại trả lời bằng một câu phét._
        _Lần nói thật duy nhất trong đời, chính bạn làm hỏng._
    - else:
        _Lần nói thật duy nhất trong đời. Không ai tin._
        _Và điều làm bạn đau nhất: kể cả bạn, lúc đó, cũng không tin._
    }
}
{ qh_designer >= 50:
    _{designer} nắm tay bạn trên bậc sân khấu. Không nói gì. Bạn siết lại thật chặt._
}
_Bạn rút điện thoại, mở danh bạ. Số điện thoại của Sữa Chua Hồng Hào vẫn còn đó._
_Bạn đổi tên nó thành "Lần sau nói thật". Rồi cất điện thoại đi, ăn nốt hộp sữa chua {designer} đưa._
-> END

// ============================================================
// 😢 6. TỦ LẠNH TRỐNG MÃI
// ============================================================
=== sales_kt_tu_lanh_trong_mai ===
# ket_thuc:tu_lanh_trong_mai # loai:buon
_Ngày 1 tháng 11. Sổ Tạm Ứng: {sl_tam_ung}đ chưa có hóa đơn. Ví: gần như bằng không. {ke_toan} trừ dần vào lương, mỗi tháng một ít, đều đặn như mưa._
_Bạn trả lại căn 1203 ở Sky Ảo. Sofa nhung, đèn chùm, view thành phố: trả hết. Trong tủ lạnh chỉ còn chai tương ớt. Bạn để lại cho người thuê sau._
_Hẻm 69. Gác lửng. Bà Tư chủ trọ đưa chìa khóa: "Phòng này mát, 2 triệu 4 tính luôn điện, sát vách thằng {dan_dau_tu}. Mùng 5 bà lên thu nghen con."_
_Phòng nhỏ. Cửa sổ nhìn ra tường. Bạn đặt thùng carton xuống, ngồi lên giường, nghe tiếng chart nhấp nháy bên kia vách._
_Đêm đầu tiên. 23 giờ. Có tiếng gõ tường._
dan_dau_tu: *(vọng qua vách)* {sales} ơi. Em ở bên đó hả? Anh nghe tiếng giày cao gót.
dan_dau_tu: Lần này là lên thật. Mai anh trả em gấp đôi.
_Bạn nằm nhìn trần nhà. Trên trần có một vết ố hình đồng xu._
_Bạn xé gói mì cuối cùng. Không có bát sứ. Không có nến. Không có hai cọng hành._
_Bạn cầm điện thoại lên, mở camera, định chụp story. Rồi bạn nhận ra: không còn ai để chụp story cho._
_Bạn ăn mì. Mì vẫn ngon. Chỉ là không ai biết._
-> END
