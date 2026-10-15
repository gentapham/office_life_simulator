// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · ĐÁNH GIÁ & 6 KẾT THÚC
// Thứ tự ưu tiên:
//   1. Ngất Ở Bàn Dựng (Số Đêm Thức Trắng chạm 7 lần thứ hai)
//   2. Kênh Bị Mua (bán kênh ngày 26/10)
//   3. 🔒 Bản Dựng Cuối Cùng (bí mật)
//   4. Tưởng Là Video Quảng Cáo
//   5. Một Triệu Con Cú
//   6. Tên Trong Ô Người Thực Hiện
//   Dự phòng: video đã lên fanpage thì "Tưởng Là Video Quảng Cáo";
//   Công Bị Nhận Vơ ≤ 40 và chưa từng ngất thì "Tên Trong Ô";
//   còn lại "Ngất Ở Bàn Dựng" (đêm trắng 29/10 là giọt nước tràn ly)
// ============================================================

=== editor_3010_danh_gia ===
# ngay:30 # gio:17:30 # bat_buoc
{
- ed_so_lan_ngat >= 2:
    ~ chot_ket_thuc("ngat_o_ban_dung")
    -> editor_kt_ngat_o_ban_dung
- ed_ban_kenh:
    ~ chot_ket_thuc("kenh_bi_mua")
    -> editor_kt_kenh_bi_mua
- ed_nguoi_dung_dem && ed_chep_usb && ed_can_dam >= 80 && ed_dua_usb_thai:
    ~ chot_ket_thuc("ban_dung_cuoi_cung")
    -> editor_kt_ban_dung_cuoi_cung
- ed_video_len_fanpage && ed_can_dam < 50 && not ed_nguoi_dung_dem:
    ~ chot_ket_thuc("tuong_la_quang_cao")
    -> editor_kt_tuong_la_quang_cao
- ed_cong_khai_kenh && ed_keu_goi_follow && not ed_ban_kenh && nguoi_theo_doi >= 1000000:
    ~ chot_ket_thuc("mot_trieu_con_cu")
    -> editor_kt_mot_trieu_con_cu
- ed_cong_bi_nhan_vo <= 20 && ed_so_lan_ngat == 0 && uy_tin >= 60:
    ~ chot_ket_thuc("ten_trong_o")
    -> editor_kt_ten_trong_o
- ed_video_len_fanpage:
    ~ chot_ket_thuc("tuong_la_quang_cao")
    -> editor_kt_tuong_la_quang_cao
- ed_cong_bi_nhan_vo <= 40 && ed_so_lan_ngat == 0:
    ~ chot_ket_thuc("ten_trong_o")
    -> editor_kt_ten_trong_o
- else:
    ~ chot_ket_thuc("ngat_o_ban_dung")
    -> editor_kt_ngat_o_ban_dung
}

// ------------------------------------------------------------
// 😄 1. MỘT TRIỆU CON CÚ
=== editor_kt_mot_trieu_con_cu ===
# ngay:31 # gio:21:45 # noi:san_khau_dem_hong
_Đêm Hồng. 21 giờ 45. Trên màn hình lớn, bộ đếm người theo dõi của {sieu_nhan_hong} chạy như đồng hồ đếm ngược ngày Tết._
_999.812. 999.904. 999.977._
_Cả nghìn người đếm to theo. {hong_hot} hét vào micro livestream. {giam_doc} trong bộ Ông Kẹ Ngân Hàng nắm tay {ke_toan}, {ke_toan} không rút tay ra._
_1.000.000._
_Pháo hoa hồng nổ. Sân khấu rung lên. {sieu_nhan_hong} nhảy cẫng, cái mũ suýt văng._
_Cùng lúc đó, sau khán đài, trong cái lều đen, điện thoại của bạn rung một cái._
_Thông báo Diu-túp: "Chúc mừng! Kênh 'Cú Đêm Cắt Ghép' vừa đạt 1.000.000 người đăng ký."_
_Hai bộ đếm. Cùng một giây. Bạn nhìn màn hình điện thoại, quên mất phải thở._
_Trên sân khấu, {sieu_nhan_hong} cầm micro, chỉ thẳng xuống khán đài, về phía cái lều đen._
sieu_nhan_hong: Cảm ơn cả nhà! Và… cảm ơn con cú!
_Cả nghìn người quay lại nhìn._
_Đèn sân khấu lia theo. Chạm vào cái lều. Một tia sáng rọi thẳng vào bạn: mũ len, tai nghe to, quầng thâm, cốc RENDER._
_Theo phản xạ, bạn định kéo mũ len xuống che mặt._
_Bạn không kéo._
_Lần đầu tiên, bạn không trốn vào bóng tối. Bạn đứng dậy. Giơ tay lên. Vụng về như con cú lần đầu thấy nắng._
_Khán đài vỗ tay. {thuc_tap_sinh} hét "Anh {editor}!". {chi_dai} huýt sáo. {truong_phong} vỗ tay, chậm, rồi nhanh dần, rồi vỗ thật._
_Ở hàng ghế đầu, {quan_ly_idol} quay lại, tìm bạn trong đám đông. Tìm thấy. Gật đầu một cái. Rồi cười._
_Bạn ngồi xuống, tim đập lệch phách. Lần đầu tiên trong đời, bạn không muốn sửa cái nhịp đó._
-> END

// ------------------------------------------------------------
// 😄 2. TÊN TRONG Ô NGƯỜI THỰC HIỆN
=== editor_kt_ten_trong_o ===
# ngay:30 # gio:17:45 # noi:phong_hop_tang_2
_Họp đánh giá. Màn hình lớn. Báo cáo cuối tháng. Ô "Người thực hiện" không còn trống._
{ ed_o_nguoi_thuc_hien == "ca_hai":
    _"Người thực hiện: {truong_phong} (giám sát), {editor} (dựng phim)." Hai dòng. Dòng của bạn ở dưới, nhưng to bằng._
- else:
    _"Người thực hiện: {editor}." Một dòng. Năm chữ. Bốn năm._
}
_Cả phòng vỗ tay. {thuc_tap_sinh} vỗ to nhất. {chua_te_deadline} vỗ bằng một tay, tay kia giơ điện thoại quay lại._
giam_doc: {editor}. Anh đề bạt em làm Trưởng nhóm Hậu kỳ. Lương tăng. Có phòng riêng, có rèm.
giam_doc: Kèm một điều kiện. *(nghiêm mặt)* Từ nay em phải ngủ ban đêm. Anh không ép.
_Cả phòng cười ồ. Bạn không cười. Bạn đang nghĩ thật sự: ngủ ban đêm là làm thế nào?_
truong_phong: *(nói nhỏ khi đi ngang)* Anh nợ em… nhiều cái slide. Anh sẽ học dựng. Thật.
_Tối đó, 10 giờ đêm, giờ mà bạn thường mở mắt, bạn nằm xuống. Nhắm mắt. Đếm cừu. Đếm khung hình. Đếm tới khung hình thứ 214._
_Bạn ngủ._
_Sáng hôm sau. 7 giờ. Căn 701._
_Lần đầu tiên sau bốn năm, bạn đứng dậy, đi tới cửa sổ, kéo tấm rèm đen ra._
_Nắng tràn vào. Thật, không cần cứu màu. Ba màn hình tắt ngấm, phản chiếu mặt trời._
_Bạn nheo mắt như con cú gặp nắng._
_Rồi bạn hắt hơi. Một cái. Rất to._
_Ở dưới đường, có ai đó nói "Sống lâu trăm tuổi". Bạn không biết là ai. Nhưng bạn đã nghe thấy. Vì bạn đang thức, vào buổi sáng, như người bình thường._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: BẢN DỰNG CUỐI CÙNG
=== editor_kt_ban_dung_cuoi_cung ===
# ngay:31 # gio:23:55 # noi:hau_truong_dem_hong
_Sau Đêm Hồng. Hậu trường. Đèn sân khấu đã tắt. Chỉ còn đèn tuýp trắng, mấy thùng đạo cụ, và mùi pháo hoa._
_{quan_ly_idol} ngồi trên một thùng loa, laptop trên đùi. Hai cái điện thoại úp mặt xuống bên cạnh. Cái USB hình con cú cắm ở cổng bên phải._
_Bạn đứng cách ba bước. Không dám lại gần hơn. Không dám đi xa hơn._
_Bốn phút._
_{quan_ly_idol} nghe điện thoại ở hành lang. {quan_ly_idol} ngủ gật trong xe, đầu tựa cửa kính. {quan_ly_idol} cười một mình khi {idol_het_thoi} hát đúng nốt cao._
_Một tờ giấy note vàng: "Ly của em nè."_
_Lần đầu tiên, {quan_ly_idol} thấy mình qua mắt người khác. Không phải người quản lý. Không phải người lo. Chỉ là một người, được nhìn thấy._
_Video hết. Màn hình đen. {quan_ly_idol} ngồi im._
_Rồi anh ấy làm một việc bạn chưa từng thấy suốt bốn năm: cầm cả hai điện thoại lên, tắt nguồn, và úp xuống._
quan_ly_idol: Em dựng đẹp vậy… *(giọng khàn)* …sao giờ anh mới thấy?
_Bạn không trả lời. Có những câu hỏi không cần trả lời. Có những câu hỏi chỉ cần được hỏi._
_Im lặng một lúc. Ngoài kia, xe dọn sân khấu kêu bíp bíp._
quan_ly_idol: *(đứng dậy, phủi quần)* Anh chưa biết nói gì. Anh cần… anh cần thời gian. Em hiểu hông?
editor: Dạ. Em quen chờ render mà.
quan_ly_idol: *(bật cười, mắt đỏ)* Thằng nhỏ này.
_Anh ấy rút USB, bỏ vào túi áo ngực. Chỗ không có điện thoại._
quan_ly_idol: Đi ăn sáng hông? Anh bao.
editor: Dạ… em chưa ăn sáng bao giờ.
quan_ly_idol: Vậy hôm nay là lần đầu.
_Hai người bước ra khỏi hậu trường. Trời bắt đầu sáng. Không hồng, không cần cứu màu. Chỉ là sáng._
_Bạn không biết chuyện gì sẽ xảy ra sau bữa sáng. Bạn chỉ biết lần này, bạn không cần giấu con cú nào trong khung hình. Bạn đang ở trong đó._
-> END

// ------------------------------------------------------------
// 😢 4. NGẤT Ở BÀN DỰNG
=== editor_kt_ngat_o_ban_dung ===
# ngay:31 # gio:20:00 # noi:phong_kham_khoe_re
_4 giờ sáng ngày 30/10. Phòng dựng. Thanh render ở 74%. Bạn nói với không ai: "Dạ… đợi render xong…"_
_Rồi sàn nhà nghiêng._
_Bạn ngất trên bàn phím. Khi {thuc_tap_sinh} tìm thấy bạn lúc 7 giờ sáng, mặt bạn in hình hàng phím chữ, rõ nhất là chữ J._
_Tỉnh dậy ở Phòng khám Đa Khoa Khỏe Re. Trần trắng. Đèn sáng. Tay cắm dây truyền._
bac_si: Lần này là lần thứ mấy rồi? Cậu không phải cú. Cậu là người. Người thì phải ngủ.
_Ngày 31/10. 8 giờ tối. Bạn vẫn nằm đó. Cái TV nhỏ trên tường đang phát trực tiếp Đêm Hồng._
_Video tổng kết của bạn lên màn hình. Dựng dở. Có một đoạn đen ba giây, chỗ bạn chưa kịp ghép. Không ai sửa được, vì không ai biết dùng phần mềm._
_Khán giả vẫn vỗ tay. Người ta không biết chỗ đen đó là chỗ của bạn._
_Rồi dòng chữ cuối video hiện lên, trắng trên nền đen:_
_"Thực hiện: {truong_phong}."_
_Bạn nhìn dòng chữ đó rất lâu. Lâu hơn một giây._
_Điện thoại trên bàn rung. {quan_ly_idol}: "Em khỏe chưa? Video đẹp lắm. Anh biết là của em." Bạn chưa đọc. Điện thoại úp mặt._
_Bạn quay mặt vào tường._
_Ngoài cửa sổ phòng khám, pháo hoa hồng nổ. Bạn nhắm mắt. Lần đầu tiên trong tháng, bạn ngủ lúc 8 giờ tối. Không phải vì muốn._
-> END

// ------------------------------------------------------------
// 😢 5. TƯỞNG LÀ VIDEO QUẢNG CÁO
=== editor_kt_tuong_la_quang_cao ===
# ngay:31 # gio:23:30 # noi:can_701
_Video trên fanpage công ty đạt 50.000 lượt xem._
_Bốn phút. {quan_ly_idol} nghe điện thoại. {quan_ly_idol} ngủ gật trong xe. {quan_ly_idol} cười một mình. Không chữ. Không nhạc. Bốn năm._
_Bình luận: "Hậu trường quản lý nghệ sĩ cảm động quá", "G-Entertainment làm PR có tâm ghê", "Anh quản lý đẹp trai, công ty tuyển thêm hông?"._
_Ai cũng tưởng đó là video "hậu trường" để PR cho công ty. {giam_doc} chia sẻ, kèm caption "Gia đình mình đấy!"._
_{quan_ly_idol} cũng vậy._
_Anh ấy bình luận dưới video, lúc 23:12:_
_"Dựng hay ghê! Ai dựng vậy? Em dựng cho {idol_het_thoi} một cái y vậy nha, gấp."_
_Kèm một biểu tượng ngón cái. Không phải con cú._
_Bạn đọc bình luận đó ở căn 701. Rèm đen kín. Ba màn hình sáng. Ngoài kia, Đêm Hồng vừa tắt pháo hoa._
_Bạn đọc lại. Lần thứ hai. Lần thứ ba._
_Rồi bạn làm điều mà bạn giỏi nhất, điều bạn đã làm suốt bốn năm._
_Bạn mở phần mềm dựng phim. Tạo dự án mới. Đặt tên: "{idol_het_thoi}_tien_tay_215"._
_Bạn kéo clip đầu tiên lên timeline._
_Thanh render bắt đầu chạy. Chậm hơn cả lương về._
-> END

// ------------------------------------------------------------
// 😢 6. KÊNH BỊ MUA
=== editor_kt_kenh_bi_mua ===
# ngay:31 # gio:22:00 # noi:can_701
_Kênh "Cú Đêm Cắt Ghép" giờ tên là "G-Entertainment Official"._
_Logo con cú đeo tai nghe đã bị thay bằng chữ G bảy màu. Ảnh bìa là {giam_doc} đứng trước tấm bằng "Doanh nhân của năm"._
_Video đầu tiên của kênh mới: {truong_phong} đứng chỉ tay vào màn hình, mỉm cười._
truong_phong: Xin chào các bạn! Đây là kênh do anh xây dựng từ con số 0…
_Bình luận top: "Cú đâu rồi?", "Trả cú lại đây", "Ủa ông này là ai?". Sub giảm từng phút._
_Bạn xem video đó ở căn 701. Rèm đen. Ba màn hình. Hai trăm triệu nằm trong tài khoản._
_Bạn không biết mua gì. Bạn đã nghĩ cả tuần. Máy dựng mới? Bạn có rồi. Rèm mới? Rèm cũ vẫn đen. Kỳ nghỉ? Bạn không biết nghỉ là gì._
_Ngoài kia, Đêm Hồng đang diễn ra. Bạn không đi. Video tổng kết của bạn đang chiếu, với logo chữ G bảy màu ở góc._
_Bạn mở trang kênh "G-Entertainment Official"._
_Nút đỏ: "Đã đăng ký". Bạn là người đăng ký đầu tiên của kênh này, từ ngày nó chỉ có một video._
_Bạn đưa chuột lên. Dừng lại một chút. Lâu hơn một giây._
_Bấm._
_"Hủy đăng ký."_
_Màn hình hiện số: 689.002. Rồi 689.001._
_Bạn tắt máy. Căn phòng tối hẳn. Lần đầu tiên trong bốn năm, không có màn hình nào sáng._
-> END
