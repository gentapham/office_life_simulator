// ============================================================
// THỰC TẬP SINH · 6 KẾT THÚC
// Kết quả được chốt theo trạng thái sau buổi họp đánh giá 30/10,
// cảnh kết hiện ra khi Đêm Hồng (31/10) khép lại.
// Thứ tự ưu tiên: 🏦 Lửa Đam Mê về 0 → 🏧 Cây ATM Biết Đi → 💥 Nổi Loạn Lỡ Đà
// → 🔒 Người Gác Két → 🎬 Tên Trên Màn Ảnh → 🎫 Nhân Viên Chính Thức
// → 🏦 Về Lại Ngân Hàng (không được giữ lại và đã nhận lời sếp cũ).
// ============================================================

=== thuc_tap_sinh_3010_danh_gia ===
# ngay:31 # gio:22:30 # noi:san_khau_dem_hong # bat_buoc
{
- duy_ve_ngan_hang || duy_lua <= 0:
    ~ chot_ket_thuc("ve_lai_ngan_hang")
    -> thuc_tap_sinh_kt_ve_lai_ngan_hang
- duy_do_lo >= 100 && duy_so_nguoi_muon >= 5:
    ~ chot_ket_thuc("cay_atm_biet_di")
    -> thuc_tap_sinh_kt_cay_atm_biet_di
- duy_so_lan_noi_loan > 5 && qh_chi_dai < 0 && uy_tin < 30:
    ~ chot_ket_thuc("noi_loan_lo_da")
    -> thuc_tap_sinh_kt_noi_loan_lo_da
- duy_nhanh_nguoi_gac_ket && duy_kinh_nghiem >= 70 && qh_giam_doc >= 50 && duy_tu_choi_ngan_hang:
    ~ chot_ket_thuc("nguoi_gac_ket")
    -> thuc_tap_sinh_kt_nguoi_gac_ket
- duy_doi_chat_oanh && qh_bien_kich >= -20 && duy_lua >= 60:
    ~ chot_ket_thuc("ten_tren_man_anh")
    -> thuc_tap_sinh_kt_ten_tren_man_anh
- duy_kinh_nghiem >= 60 && duy_lua >= 50 && qh_truong_phong >= 20 && not duy_bi_lo_het && not duy_nhan_loi_ngan_hang:
    ~ chot_ket_thuc("nhan_vien_chinh_thuc")
    -> thuc_tap_sinh_kt_nhan_vien_chinh_thuc
- not duy_giu_lai && duy_nhan_loi_ngan_hang:
    ~ chot_ket_thuc("ve_lai_ngan_hang")
    -> thuc_tap_sinh_kt_ve_lai_ngan_hang
- duy_giu_lai:
    ~ chot_ket_thuc("nhan_vien_chinh_thuc")
    -> thuc_tap_sinh_kt_nhan_vien_chinh_thuc
- else:
    ~ chot_ket_thuc("ve_lai_ngan_hang")
    -> thuc_tap_sinh_kt_ve_lai_ngan_hang
}

// ------------------------------------------------------------
// 😄 1. NHÂN VIÊN CHÍNH THỨC
=== thuc_tap_sinh_kt_nhan_vien_chinh_thuc ===
# ngay:31 # gio:22:00 # noi:san_khau_dem_hong
_Hôm qua, 30/10, {hr} đẩy qua bàn một tờ giấy: hợp đồng chính thức, 13 triệu._
_Bạn đọc nguyên 8 trang. Từng điều khoản. Từng dấu phẩy. Phản xạ nghề. Cả phòng chờ 11 phút. {truong_phong} không giục. {giam_doc} không giục. Lần đầu có người chờ bạn._
_Bạn ký. Chữ ký nghiêng, đều. Lần này, ô chữ ký ghi: "Người lao động"._
_Đêm Hồng. Lần đầu tiên bạn đeo thẻ nhân viên màu cam. Có ảnh. Có tên. Không có chữ "Thực tập sinh"._
_Bạn vẫn cầm tấm hắt sáng. Tay vẫn mỏi từ bài thứ 3. Bạn vẫn "dạ anh, dạ chị"._
chi_dai: *(bộ đàm)* {thuc_tap_sinh}, chuyển hắt sáng sang trái 20 phân. Giỏi.
_Một bạn sinh viên tình nguyện chạy tới, ôm một cuộn dây điện, rụt rè._
_"Dạ anh {thuc_tap_sinh} ơi, cái này để đâu ạ? Em mới vô nên chưa biết ạ."_
_"Anh {thuc_tap_sinh}." Có người mới hơn bạn gọi bạn là "anh Duy"._
* [😇 "Để đó em. Lại đây anh chỉ."]
    _Bạn chỉ. Chậm rãi. Như {chi_dai} từng chỉ bạn. Như {it} từng chỉ phím C._
* [🙇 "Dạ… à không. Ừ. Để anh làm cho."]
    _Bạn suýt "dạ" với một người nhỏ hơn mình 9 tuổi. Thói quen hai tháng. Bạn cười, rồi chỉ cho bạn ấy._
- _Pháo giấy hồng phủ kín sân khấu. Bạn hạ tấm hắt sáng xuống._
_11 giờ đêm, bạn về Hẻm 69. 3 bạn cùng phòng đã chờ sẵn với một gói mì mỗi người và một cây nến cắm trên tháp mì gói._
_Anh thợ hồ giơ ly trà đá: "Chúc mừng thằng {thuc_tap_sinh} có việc chính thức!"_
_Dưới gối, cái thẻ kim cương vẫn nằm đó. Bạn không cần nó tối nay. Lương 13 triệu. Đủ mua thêm một tầng cho tháp mì._
-> END

// ------------------------------------------------------------
// 😄 2. TÊN TRÊN MÀN ẢNH
=== thuc_tap_sinh_kt_ten_tren_man_anh ===
# ngay:31 # gio:21:00 # noi:rap_bap_rang
_Một tuần sau Đêm Hồng. Rạp Bắp Rang. Buổi chiếu chính thức phim ngắn "Người Hùng Không Tên". Thảm đỏ dài 4 mét, hơi nhăn._
_Bạn ngồi hàng thứ 3. Bên cạnh là {bien_kich}. Phía sau là 3 bạn cùng phòng ở Hẻm 69, mặc áo sơ mi đẹp nhất của họ (một người mượn áo của {con_ong_chau_cha})._
_Phim chiếu. Phòng kính tầng 15. Sinh nhật 30 tuổi. Bỏ việc. Cơn mưa. Người mặc đồ hồng đẩy xe 2 cây số._
_Đèn vẫn tắt. Dòng chữ chạy lên:_
_"Ý tưởng gốc: {thuc_tap_sinh}. Kịch bản: {bien_kich}."_
_Tên bạn. Trên màn ảnh. Chữ to bằng chữ tên {bien_kich}._
bien_kich: *(nói nhỏ, không nhìn bạn)* Đây không phải đạo… à thôi. Đây là đạo. Xin lỗi.
* [🤝 "Dạ, phim chị viết hay hơn em nghĩ ạ. Thật."]
    bien_kich: *(lau mắt bằng tay áo)* Em đừng tốt vậy. Tui viết tiểu thuyết sẽ khó lắm.
* [😶 Không nói gì. Chỉ nhìn dòng chữ.]
    _{bien_kich} hiểu. Có những lời xin lỗi không cần được trả lời. Chỉ cần được nghe._
- _Bạn giơ điện thoại lên, chụp màn hình dòng chữ đó. Hơi mờ, hơi lệch. Như mọi clip bạn từng quay._
_Ở hàng sau, 3 bạn cùng phòng vỗ tay to nhất rạp. Anh thợ hồ huýt sáo. Bảo vệ rạp nhìn sang._
_Tối đó, bạn đặt tấm ảnh làm hình nền điện thoại. Thay cho tấm cũ: một cái két sắt có cánh, bạn tự vẽ năm 8 tuổi._
_Ở góc phải khung hình cuối của bộ phim, có một con cú nhỏ. Bạn biết là ai dựng. Bạn không nói._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: NGƯỜI GÁC KÉT
=== thuc_tap_sinh_kt_nguoi_gac_ket ===
# ngay:31 # gio:10:00 # noi:ngan_hang_tin_dung_den_dui
_Sáng 31/10. Ngân hàng Tín Dụng Đen Đủi, tầng 15, Đồi Ngân Hàng. Phòng kính. Cái phòng bạn từng ngồi._
_Bạn mặc sơ mi linen màu be. Không vest. Không kính gọng vàng. Bên cạnh bạn là {giam_doc}, mặc vest, tay cầm cặp hồ sơ, run nhẹ._
_Đối diện: anh Tư, sếp cũ. Anh nhìn bạn, nhìn {giam_doc}, rồi nhìn bộ hồ sơ giãn nợ bạn soạn: 22 trang, có dòng tiền dự kiến, có tài trợ "Thẻ Hồng", có cả lịch trả theo từng tháng._
_"Mày bỏ ghế trưởng phòng đi cầm hắt sáng, giờ quay về đàm phán cho chính con nợ mày duyệt?"_
thuc_tap_sinh: Dạ. Em duyệt khoản này năm 2024, em biết nó. Em xin giãn 2 năm. Công ty đang sống lại, anh Tư ạ.
_40 phút. Anh Tư ký. Giãn nợ 2 năm. Căn biệt thự được giữ lại, dù Đêm Hồng tối nay có ra sao._
_Ra tới thang máy, {giam_doc} đứng lại._
giam_doc: Anh muốn đề bạt em làm Phó Giám đốc Tài chính. Anh không ép… à không. Anh xin em.
_Bạn lắc đầu. Cái thẻ kim cương vừa dùng để chứng minh năng lực tài chính cho hồ sơ, bạn cất lại vào ví, sâu nhất có thể._
* [😇 "Dạ em còn thực tập mà anh."]
    giam_doc: *(lắc đầu, cười như khóc)* Thực tập. Ừ. Thực tập.
* [😇 "Dạ, anh cho em làm nhân viên sản xuất. Em muốn làm phim ạ."]
    giam_doc: Được. Phim. Anh duyệt. Lần này anh đọc hết hợp đồng.
- _Tối đó, Đêm Hồng. Bạn cầm tấm hắt sáng như mọi khi._
_Từ hôm đó, cả công ty nghe {giam_doc} gọi một thực tập sinh là "anh Duy". Rót trà cho "anh Duy". Mở cửa cho "anh Duy"._
_Không ai hiểu vì sao. {ke_toan} hiểu, nhưng {ke_toan} không nói. Bác {bac_bao_ve} hiểu, và bác viết một dòng vào lá thư tháng sau gửi đi xa: "Có một đứa nhỏ tốt."_
-> END

// ------------------------------------------------------------
// 😢 4. VỀ LẠI NGÂN HÀNG
=== thuc_tap_sinh_kt_ve_lai_ngan_hang ===
# ngay:31 # gio:20:30 # noi:ngan_hang_tin_dung_den_dui
_Văn phòng kính tầng 15, Đồi Ngân Hàng. Bạn mặc lại vest. Đeo lại kính gọng vàng. Ria mép chưa kịp mọc lại._
{ duy_lua <= 0:
    _Đêm đó, Lửa Đam Mê tắt. Bạn viết đơn xin nghỉ lúc 2 giờ sáng, gửi {hr} lúc 2 giờ 01. Sáng ra, bạn gọi anh Tư._
- else:
    _Ngày 30/10, {hr} đã nói câu đó: "Cảm ơn em vì đã đồng hành." Bạn đã nhận lời anh Tư từ trước. Mọi thứ khớp như một bảng cân đối kế toán._
}
_Tối 31/10. Bạn ở lại văn phòng tới 20 giờ 30. Không ai bắt. Bạn chỉ không muốn về._
_Bạn mở Tóp-tóp. Livestream Đêm Hồng. Siêu Nhân Hồng tạo dáng giữa pháo giấy. Ở chân sân khấu, ai đó đang cầm tấm hắt sáng, đứng đúng chỗ bạn từng đứng._
_Người đó cầm lệch. Một nửa mặt Siêu Nhân Hồng bị tối._
_Bạn nhìn màn hình rất lâu. Tay bạn tự động nâng lên 10 phân, như đang cầm tấm hắt sáng giùm người ta._
_Có tiếng gõ cửa. Một nhân viên mới, áo sơ mi trắng, đứng ở cửa, rụt rè._
_"Dạ anh ơi… em mới vô nên chưa biết ạ."_
* [😇 Mỉm cười. "Vô đây ngồi. Anh chỉ."]
    _Bạn mỉm cười. Giống hệt cách {chi_dai} từng cười với bạn, trong bóng tối pantry, với nửa ổ bánh mì._
* [😶 Gật đầu. Chỉ tay vào cái ghế.]
    _Bạn chỉ vào cái ghế. Rồi bạn đứng dậy, rót cho bạn ấy ly nước. Thói quen hai tháng. Không mất đi được._
- _Ngoài cửa sổ phòng kính, thành phố sáng đèn. Phía xa, về hướng Phường Tân Drama, có một vệt hồng trên trời. Pháo giấy. Hoặc bạn tưởng tượng ra._
-> END

// ------------------------------------------------------------
// 😢 5. CÂY ATM BIẾT ĐI
=== thuc_tap_sinh_kt_cay_atm_biet_di ===
# ngay:31 # gio:21:00 # noi:hem_69
_Cả công ty biết bạn từng là trưởng phòng ngân hàng. Từ tuần trước._
_Không ai sai bạn photo nữa. Ai cũng gọi "anh Duy". Ai cũng mời bạn đi ăn. {thanh_ninh} pha trà cho bạn. {sales} gọi bạn là "anh" lần đầu tiên._
_Rồi ai cũng có "việc gấp cần mượn chút"._
_{idol_het_thoi}: tiền nhà. {sales}: tiếp khách. {thanh_xin_nghi}: "tiền xăng". {ran_doc}: "kẹt chút". {con_ong_chau_cha}: "thẻ bị khóa"._
_Và {dan_dau_tu}: 200 triệu, "đợt cuối, lần này là lên thật"._
_Tối 31/10. Bạn ngồi một mình trong phòng 12, dãy B. 3 bạn cùng phòng đi xem Đêm Hồng ngoài đường._
_Cả công ty đang ở Đêm Hồng. Không ai rủ bạn. Bạn nghe {hong_hot} kể với ai đó trong group: "Rủ ổng thì ngại lắm, lỡ ổng nhắc nợ."_
_Bạn nhìn cái tháp mì gói. Nó cao hơn tháng trước. Bạn đã mua thêm, vì bạn không còn tiền mặt._
* [🍜 Nấu một gói mì.]
    _Bạn ăn mì. Một mình. Không ai hỏi bạn lương bao nhiêu. Mà ai cũng biết rồi._
* [📱 Mở Tóp-tóp xem Đêm Hồng.]
    _Trên livestream, bạn thấy {chi_dai} nhìn quanh, như tìm ai đó. Rồi thôi._
- _Điện thoại rung. Một tin nhắn. {dan_dau_tu}: "Anh {thuc_tap_sinh} ơi, coin lên rồi! Cho em thêm 5 triệu nữa thôi."_
_Bạn úp điện thoại xuống. Sờ xuống gối. Cái thẻ kim cương vẫn ở đó, sáng lấp lánh trong bóng tối._
_Lần đầu tiên, bạn ước gì nó chỉ là thẻ tích điểm siêu thị._
-> END

// ------------------------------------------------------------
// 😢 6. NỔI LOẠN LỠ ĐÀ
=== thuc_tap_sinh_kt_noi_loan_lo_da ===
# ngay:31 # gio:18:00 # noi:cong_cong_ty
_Họp giao ban 26/10. Bạn đứng dậy, đọc to danh sách 47 việc vặt đã bị đẩy trong tháng, kể tên từng người._
_Bạn đúng. Từng dòng đều đúng. Nhưng bạn nói theo cách khiến ai cũng thấy mình bị bêu riếu. Cả phòng im phăng phắc._
_{chi_dai} nhìn bạn. Lần đầu tiên, chị không bênh._
_Ngày 30/10, họp đánh giá. {hr} cười như mọi khi._
hr: Anh cảm ơn em vì đã đồng hành cùng {cong_ty} trong 2 tháng qua.
_Bạn gật đầu. Bạn không "dạ". Lần đầu tiên bạn không "dạ"._
_Chiều 31/10. Cả công ty đi dựng sân khấu Đêm Hồng. Bạn ôm thùng carton đi ra cổng: cuốn sổ ghi chép, 3 cây bút, tấm hắt sáng cũ mà {designer} cho bạn giữ._
_{cho} chạy theo bạn tới cổng. Nó ngậm theo ổ bánh mì của bạn, ổ bánh mì bạn để quên trên bàn._
cho: *(đặt ổ bánh mì xuống chân bạn, ngồi xuống)* Gâu.
* [🐾 Ngồi xuống, ôm {cho}.]
    _{cho} liếm mặt bạn. Bác {bac_bao_ve} đứng trong chòi, không ra, nhưng bật radio to hơn một chút. Bài "Công Viên"._
* [😶 Nhặt ổ bánh mì, đi tiếp.]
    _{cho} đứng ở cổng, nhìn theo bạn tới tận đầu đường. Không sủa. Chó chỉ sủa người lạ._
- _Bạn đứng ở trạm xe buýt. Trong túi, danh sách 47 việc vẫn còn. Bạn lấy ra, đọc lại. Việc thứ 1: 22 ly cà phê._
_Bạn nhớ ra: hôm đó, người duy nhất nói cảm ơn là {chua_te_deadline}. Hôm đó bạn đã vui. Bạn đã quên mất mình từng vui._
-> END
