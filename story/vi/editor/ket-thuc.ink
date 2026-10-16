// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · ĐÁNH GIÁ & 6 KẾT THÚC
// Chạy sau Đại Nhạc Hội Siêu Nhân (31/10, 23:30), dùng mọi lựa chọn tới hết 31/10.
// Đọc ket_thuc_su_nghiep / chung_cong_ty_song khi nhắc tới Nguyên và công ty.
// Thứ tự: bí mật > 2 vui > 3 buồn > mặc định
//   1. 🔒 Bản Dựng Cuối Cùng (bí mật): đã nói thật với Thái ngày 28/10, chép USB, đưa USB 30/10
//   2. Một Triệu Con Cú (kênh riêng chạm 1.000.000 người đăng ký)
//   3. Tên Trong Ô Người Thực Hiện
//   4. Ngất Ở Bàn Dựng (Số Đêm Thức Trắng chạm 7 lần thứ hai)
//   5. Kênh Bị Mua (bán kênh ngày 26/10)
//   6. Tưởng Là Video Quảng Cáo (để mọi người tưởng đoạn "Thai_final_v12" là quảng cáo)
//   Mặc định: Công Bị Nhận Vơ ≤ 60 thì Tên Trong Ô, còn lại Tưởng Là Video Quảng Cáo
// ============================================================

=== editor_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau_dem_hong
{
- ed_noi_voi_thai && ed_chep_usb && (ed_dua_usb_thai || ed_can_dam >= 85) && ed_so_lan_ngat < 2 && not ed_ban_kenh:
    ~ chot_ket_thuc("ban_dung_cuoi_cung")
    -> editor_kt_ban_dung_cuoi_cung
- ed_cong_khai_kenh && ed_keu_goi_follow && not ed_ban_kenh && ed_sub >= 1000000 && ed_so_lan_ngat < 2:
    ~ chot_ket_thuc("mot_trieu_con_cu")
    -> editor_kt_mot_trieu_con_cu
- ed_cong_bi_nhan_vo <= 20 && ed_so_lan_ngat == 0 && not ed_ban_kenh && ed_o_nguoi_thuc_hien != "truong_phong":
    ~ chot_ket_thuc("ten_trong_o")
    -> editor_kt_ten_trong_o
- ed_so_lan_ngat >= 2:
    ~ chot_ket_thuc("ngat_o_ban_dung")
    -> editor_kt_ngat_o_ban_dung
- ed_ban_kenh:
    ~ chot_ket_thuc("kenh_bi_mua")
    -> editor_kt_kenh_bi_mua
- ed_video_len_fanpage && not ed_noi_voi_thai:
    ~ chot_ket_thuc("tuong_la_quang_cao")
    -> editor_kt_tuong_la_quang_cao
- ed_cong_bi_nhan_vo <= 60 && ed_o_nguoi_thuc_hien != "truong_phong":
    ~ chot_ket_thuc("ten_trong_o")
    -> editor_kt_ten_trong_o
- else:
    ~ chot_ket_thuc("tuong_la_quang_cao")
    -> editor_kt_tuong_la_quang_cao
}

// ------------------------------------------------------------
// 😄 1. MỘT TRIỆU CON CÚ
=== editor_kt_mot_trieu_con_cu ===
# ket_thuc:mot_trieu_con_cu # loai:co_hau # noi:san_khau_dem_hong
_23 giờ 30. Khán đài đã vãn. Bạn còn ngồi trong cái lều đen, cuộn dây cáp. Điện thoại rung một cái._
_Thông báo Diu-túp: "Chúc mừng! Kênh 'Cú Đêm Cắt Ghép' vừa đạt 1.000.000 người đăng ký."_
{ ket_thuc_su_nghiep == "sieu_sao_hang_a":
    _Trên màn hình lớn, bộ đếm của {sieu_nhan_hong} đã vượt một triệu từ một tiếng trước. Hai bộ đếm. Cùng một đêm. Một triệu con cú, và một triệu người theo dõi một bộ đồ hồng._
- else:
    _Trên màn hình lớn, bộ đếm của {sieu_nhan_hong} dừng lại trước mốc một triệu. Không đủ. Nhưng bộ đếm của bạn thì đủ. Một triệu con cú, phần lớn tới từ một video 40 giây chỉ vào một bộ đồ hồng._
}
_Bạn nhìn màn hình điện thoại, quên mất phải thở._
_Rồi {sieu_nhan_hong}, đang dọn sân khấu, cầm micro còn bật, chỉ thẳng xuống khán đài, về phía cái lều đen._
sieu_nhan_hong: Cảm ơn cả nhà! Và… cảm ơn con cú!
_Mấy chục người còn lại quay lại nhìn. Đèn sân khấu lia theo. Chạm vào cái lều. Một tia sáng rọi thẳng vào bạn: mũ len, tai nghe to, quầng thâm, cốc RENDER._
_Theo phản xạ, bạn định kéo mũ len xuống che mặt._
_Bạn không kéo._
_Lần đầu tiên, bạn không trốn vào bóng tối. Bạn đứng dậy. Giơ tay lên. Vụng về như con cú lần đầu thấy nắng._
_{thuc_tap_sinh} hét "Anh {editor}!". {chi_dai} huýt sáo. {truong_phong} vỗ tay, chậm, rồi nhanh dần, rồi vỗ thật._
_Ở hàng ghế đầu, {quan_ly_idol} quay lại, tìm bạn. Tìm thấy. Gật đầu một cái. Rồi cười._
_Bạn ngồi xuống, tim đập lệch phách. Lần đầu tiên trong đời, bạn không muốn sửa cái nhịp đó._
-> END

// ------------------------------------------------------------
// 😄 2. TÊN TRONG Ô NGƯỜI THỰC HIỆN
=== editor_kt_ten_trong_o ===
# ket_thuc:ten_trong_o # loai:co_hau # noi:hau_truong_dem_hong
_23 giờ 30. Hậu trường. {giam_doc}, vẫn mặc bộ Ông Kẹ Ngân Hàng, cầm tờ biên bản họp chiều qua, đọc to cho cả hậu trường nghe._
{ ed_o_nguoi_thuc_hien == "ca_hai":
    giam_doc: Video "16 năm". Người thực hiện: {truong_phong} giám sát, {editor} dựng phim. Hai dòng, to bằng nhau.
- else:
    giam_doc: Video "16 năm". Người thực hiện: {editor}. Một dòng. Năm chữ. Bốn năm. Anh ghi sai bốn năm rồi.
}
_Cả hậu trường vỗ tay. {thuc_tap_sinh} vỗ to nhất. {chua_te_deadline} vỗ bằng một tay, tay kia giơ điện thoại quay lại._
giam_doc: {editor}. Từ thứ 2, em là Trưởng nhóm Hậu kỳ. Có phòng riêng, có rèm.
{ not chung_cong_ty_song:
    giam_doc: *(im một lúc)* Nếu thứ 2 còn công ty. Còn hay không thì tờ giấy này em cứ giữ. Đi đâu cũng có người biết ai dựng.
}
giam_doc: Kèm một điều kiện. *(nghiêm mặt)* Từ nay em phải ngủ ban đêm. Anh không ép.
_Cả hậu trường cười ồ. Bạn không cười. Bạn đang nghĩ thật sự: ngủ ban đêm là làm thế nào?_
truong_phong: *(nói nhỏ khi đi ngang)* Anh nợ em… nhiều cái slide. Anh sẽ học dựng. Thật. Anh đăng ký kênh em lâu rồi, mà chưa biết phím tắt "C".
_Đêm đó, về tới căn 701, bạn nằm xuống. Nhắm mắt. Đếm cừu. Đếm khung hình. Đếm tới khung hình thứ 214._
_Bạn ngủ._
_Sáng hôm sau. 7 giờ. Lần đầu tiên sau bốn năm, bạn đứng dậy, đi tới cửa sổ, kéo tấm rèm đen ra._
_Nắng tràn vào. Thật, không cần cứu màu. Ba màn hình tắt ngấm, phản chiếu mặt trời._
_Bạn nheo mắt như con cú gặp nắng. Rồi bạn hắt hơi. Một cái. Rất to._
_Ở dưới đường, có ai đó nói "Sống lâu trăm tuổi". Bạn không biết là ai. Nhưng bạn đã nghe thấy. Vì bạn đang thức, vào buổi sáng, như người bình thường._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: BẢN DỰNG CUỐI CÙNG
=== editor_kt_ban_dung_cuoi_cung ===
# ket_thuc:ban_dung_cuoi_cung # loai:co_hau # bi_mat # noi:hau_truong_dem_hong
_23 giờ 30, sau Đại Nhạc Hội Siêu Nhân. Hậu trường. Đèn sân khấu đã tắt. Chỉ còn đèn tuýp trắng, mấy thùng đạo cụ, và mùi pháo hoa._
{ not ed_dua_usb_thai:
    _Cái USB bạn giữ suốt hai ngày. Mười phút trước, bạn mới dám đặt nó vào tay anh ấy, không nói gì._
}
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
{ chung_cong_ty_song:
    _Ngoài kia người ta còn đang ăn mừng con số. Hai người đi ngang qua đám đông mà không ai để ý._
- else:
    _Ngoài kia, bộ đếm đã dừng ở một con số không đủ. Sáng mai công ty có thể không còn. Nhưng sáng mai vẫn có bữa sáng._
}
_Hai người bước ra khỏi hậu trường. Mấy tiếng nữa trời sẽ sáng. Không hồng, không cần cứu màu. Chỉ là sáng._
_Bạn không biết chuyện gì sẽ xảy ra sau bữa sáng. Bạn chỉ biết lần này, bạn không cần giấu con cú nào trong khung hình. Bạn đang ở trong đó._
-> END

// ------------------------------------------------------------
// 😢 4. NGẤT Ở BÀN DỰNG
=== editor_kt_ngat_o_ban_dung ===
# ket_thuc:ngat_o_ban_dung # loai:buon # noi:phong_kham_khoe_re
_23 giờ 30. Phòng khám Đa Khoa Khỏe Re. Trần trắng. Đèn sáng. Tay cắm dây truyền._
bac_si: Lần này là lần thứ mấy rồi? Cậu không phải cú. Cậu là người. Người thì phải ngủ.
_Cái TV nhỏ trên tường đang chiếu lại Đại Nhạc Hội Siêu Nhân. Tới đoạn video "16 năm"._
_Không có video. Thay vào đó là một chuỗi ảnh chụp điện thoại của sếp {giam_doc}: mờ, nghiêng, có ngón tay che một góc. File "16 năm" vẫn nằm trong cái máy dưới lều đen, chỗ bạn gục xuống lúc 19 giờ 15._
_Khán giả vẫn vỗ tay. Người ta không biết chỗ trống đó là chỗ của bạn._
{ ed_o_nguoi_thuc_hien == "truong_phong":
    _Cuối chuỗi ảnh, dòng chữ trắng trên nền đen: "Thực hiện: {truong_phong}." Bạn nhìn dòng chữ đó rất lâu. Lâu hơn một giây._
}
{ chung_cong_ty_song:
    _Dòng chữ chạy dưới màn hình: {cong_ty} được cứu. Bạn không có mặt lúc người ta ăn mừng._
- else:
    _Dòng chữ chạy dưới màn hình nói về một khoản hoàn tiền 10 tỷ. Bạn không biết mình buồn vì chuyện đó, hay vì cái chỗ trống trong video._
}
_Điện thoại trên bàn rung. {quan_ly_idol}: "Em khỏe chưa? Video em làm, anh coi ở phòng dựng rồi. Anh biết là của em." Bạn chưa đọc. Điện thoại úp mặt._
_Bạn quay mặt vào tường._
_Ngoài cửa sổ phòng khám, pháo hoa hồng nổ muộn. Bạn nhắm mắt. Lần đầu tiên trong tháng, bạn ngủ trước nửa đêm. Không phải vì muốn._
-> END

// ------------------------------------------------------------
// 😢 5. TƯỞNG LÀ VIDEO QUẢNG CÁO
=== editor_kt_tuong_la_quang_cao ===
# ket_thuc:tuong_la_quang_cao # loai:buon # noi:hau_truong_dem_hong
_23 giờ 30. Hậu trường. Màn hình lớn đã tắt. {quan_ly_idol} đi ngang lều đen, dừng lại, vỗ vai bạn._
quan_ly_idol: {editor}! Video "16 năm" đỉnh luôn. *(cười)* Mà cái đoạn hậu trường hôm 28 đó, ai cũng tưởng quảng cáo phòng nghệ sĩ. Dựng hay ghê!
quan_ly_idol: Em dựng cho {idol_het_thoi} một cái y vậy nha. Gấp. Anh cảm ơn trước.
_Kèm một cái giơ ngón cái. Không phải con cú._
{ chung_cong_ty_song:
    _Rồi anh ấy chạy đi, hai điện thoại reo cùng lúc. Công ty được cứu. Anh ấy còn cả trăm cuộc gọi phải nghe._
- else:
    _Rồi anh ấy chạy đi, hai điện thoại reo cùng lúc. Công ty sắp phải hoàn tiền. Anh ấy còn cả trăm cuộc gọi phải nghe._
}
_Bạn đứng đó. Bốn phút. {quan_ly_idol} nghe điện thoại. {quan_ly_idol} ngủ gật trong xe. {quan_ly_idol} cười một mình. Không chữ. Không nhạc. Bốn năm. Hai nghìn người đã coi. Một người cần coi thì tưởng là quảng cáo._
_Bạn về căn 701. Rèm đen kín. Ba màn hình sáng._
_Rồi bạn làm điều mà bạn giỏi nhất, điều bạn đã làm suốt bốn năm._
_Bạn mở phần mềm dựng phim. Tạo dự án mới. Đặt tên: "{idol_het_thoi}_tien_tay_215"._
_Bạn kéo clip đầu tiên lên timeline._
_Thanh render bắt đầu chạy. Chậm hơn cả lương về._
-> END

// ------------------------------------------------------------
// 😢 6. KÊNH BỊ MUA
=== editor_kt_kenh_bi_mua ===
# ket_thuc:kenh_bi_mua # loai:buon # noi:can_701
_23 giờ 30. Căn 701. Bạn về thẳng nhà sau đêm diễn, chưa kịp tháo mũ len._
_Kênh "Cú Đêm Cắt Ghép" giờ tên là "G-Entertainment Official". Logo con cú đeo tai nghe đã bị thay bằng chữ G bảy màu. Ảnh bìa là {giam_doc} đứng trước tấm bằng "Doanh nhân của năm"._
_Video mới nhất của kênh: bản ghi Đại Nhạc Hội đêm nay. Video "16 năm" của bạn, với logo chữ G bảy màu ở góc. Đầu video, {truong_phong} đứng chỉ tay vào màn hình, mỉm cười._
truong_phong: Xin chào các bạn! Đây là kênh do công ty xây dựng từ con số 0…
_Bình luận top: "Cú đâu rồi?", "Trả cú lại đây", "Ủa ông này là ai?". Sub giảm từng phút._
{ not chung_cong_ty_song:
    _Bình luận thứ hai: "Kênh của công ty sắp phá sản hả?" Bạn không biết trả lời sao. Kênh đâu còn là của bạn._
}
_Hai trăm triệu nằm trong tài khoản. Bạn không biết mua gì. Máy dựng mới? Bạn có rồi. Rèm mới? Rèm cũ vẫn đen. Kỳ nghỉ? Bạn không biết nghỉ là gì._
_Bạn mở trang kênh "G-Entertainment Official"._
_Nút đỏ: "Đã đăng ký". Bạn là người đăng ký đầu tiên của kênh này, từ ngày nó chỉ có một video._
_Bạn đưa chuột lên. Dừng lại một chút. Lâu hơn một giây._
_Bấm._
_"Hủy đăng ký."_
_Màn hình hiện số: 689.002. Rồi 689.001._
_Bạn tắt máy. Căn phòng tối hẳn. Lần đầu tiên trong bốn năm, không có màn hình nào sáng._
-> END
