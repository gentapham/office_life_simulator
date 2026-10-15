// ============================================================
// BÁC BẢO VỆ: BÌNH · ĐÁNH GIÁ & 6 KẾT THÚC
// Chạy sau Đêm Hồng (cần kết quả chiến dịch), theo thứ tự ưu tiên:
//   1. Bị Cho Nghỉ Hưu        (Lộ Thân Phận 100 khi Thắng chưa biết sự thật,
//                              hoặc quan hệ với Thắng ≤ −40)
//   2. Gác Cổng Cho Người Lạ  (nhận tiền LL + chiến dịch Bị Cướp Mất / Chìm Nghỉm)
//   3. Thư Không Hồi Âm       (Lòng Tin Của G ≤ 30)
//   4. Người Đọc Thư          (bí mật)
//   5. Người Gác Cổng Được Tin
//   6. Về Vườn
//   Không khớp gì: Lòng Tin ≥ 60 thì 5, còn lại thì 4 (Thư Không Hồi Âm).
// ============================================================

// Chiến dịch Siêu Nhân Hồng có kết thúc có hậu không (Siêu Sao / Tháo Mũ / Meme)
=== function bv_chien_dich_ok() ===
{ nguyen_theo_ll:
    ~ return false
}
{ nguoi_theo_doi >= 1000000:
    ~ return true
}
{ nguoi_theo_doi >= 800000 && nguyen_thao_mu_dem_hong:
    ~ return true
}
{ nguoi_theo_doi >= 600000 && so_scandal >= 3:
    ~ return true
}
~ return false

// Chiến dịch rơi vào "Bị Cướp Mất" hoặc "Chìm Nghỉm"
=== function bv_chien_dich_mat() ===
{ nguyen_theo_ll || ket_thuc_su_nghiep == "bi_cuop_mat" || ket_thuc_su_nghiep == "chim_nghim":
    ~ return true
}
{ nguoi_theo_doi < 600000 && so_scandal < 3:
    ~ return true
}
~ return false

=== bac_bao_ve_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # dieu_kien:sau_dem_hong
{
- (bv_lo >= 100 && not bv_thang_biet) || qh_giam_doc <= -40:
    ~ chot_ket_thuc("bi_cho_nghi_huu")
    -> bac_bao_ve_kt_bi_cho_nghi_huu
- bv_nhan_tien_ll && bv_chien_dich_mat():
    ~ chot_ket_thuc("gac_cong_cho_nguoi_la")
    -> bac_bao_ve_kt_gac_cong_cho_nguoi_la
- bv_long_tin_g <= 30:
    ~ chot_ket_thuc("thu_khong_hoi_am")
    -> bac_bao_ve_kt_thu_khong_hoi_am
- bv_mo_phong_bi && bv_mang_giay_to && bv_bi_mat >= 40 && bv_doc_quyet_dinh:
    ~ chot_ket_thuc("nguoi_doc_thu")
    -> bac_bao_ve_kt_nguoi_doc_thu
- bv_long_tin_g >= 80 && bv_so_thu >= 4 && bv_lo < 50 && not bv_nhan_tien_ll:
    ~ chot_ket_thuc("nguoi_gac_cong_duoc_tin")
    -> bac_bao_ve_kt_nguoi_gac_cong_duoc_tin
- bv_chien_dich_ok() && bv_qh_tb() >= 50 && bv_binh_tam >= 70:
    ~ chot_ket_thuc("ve_vuon")
    -> bac_bao_ve_kt_ve_vuon
- bv_long_tin_g >= 60:
    ~ chot_ket_thuc("nguoi_gac_cong_duoc_tin")
    -> bac_bao_ve_kt_nguoi_gac_cong_duoc_tin
- else:
    ~ chot_ket_thuc("thu_khong_hoi_am")
    -> bac_bao_ve_kt_thu_khong_hoi_am
}

// ------------------------------------------------------------
// 😄 ✉️ NGƯỜI GÁC CỔNG ĐƯỢC TIN
// ------------------------------------------------------------
=== bac_bao_ve_kt_nguoi_gac_cong_duoc_tin ===
# ngay:31
_Sáng 1/11. 6 giờ 30. Bác mở cổng. Tiếng then sắt kêu "két" như mọi sáng suốt 16 năm. Radio bật kênh thời sự._
_Trong hộp thư có một lá thư mới. Tem nước ngoài. Chữ nghiêng nghiêng. Không phải chủ nhật, không phải ngày hồi âm. G viết thêm một lá._
_"Bình. Cảm ơn anh. Tháng này tôi ngủ ngon."_
_"Bốn lá thư của anh, không lá nào nói dối tôi. Có lá làm tôi buồn. Nhưng buồn vì biết thật thì tôi chịu được. Buồn vì không biết gì mới khó."_
_"Kèm theo đây là cái quán trà đá cổng sau. Tôi mua lại từ tháng trước, đứng tên anh. Không phải trả công. Là cảm ơn. G."_
_Trong phong bì là một tờ giấy sang tên. Quán trà đá cổng sau: hai cái bàn gỗ, bốn cái ghế nhựa, một cây bàng._
_Bác đọc ba lần. Như G vẫn đọc thư bác. Rồi gấp lại, cất vào hộp sắt, cạnh 120 lá thư khác._
_Chiều đó, bác mua thêm hai cái ghế nhựa. Màu cam, cho đúng màu công ty._
_5 giờ 30. Tan làm. {thuc_tap_sinh} ngồi xuống trước tiên. Rồi {chi_dai}, {ke_toan}. Rồi {it}, mang theo mì ly. Rồi {dan_dau_tu}, móc ra 500 nghìn: "Con trả bác một phần ạ."_
_Rồi {giam_doc}. Anh ngồi xuống cái ghế cam cuối cùng, không cà vạt, không điện thoại. Chỉ ngồi._
giam_doc: Bác ơi. Một ly trà đá. Đặc. Nhiều đá.
bac_bao_ve: 3 nghìn.
giam_doc: *(cười, móc ví)* Vâng. 3 nghìn.
_{cho} nằm dưới chân bàn, gác cằm lên dép bác. Radio rè rè bản tin giao thông: "Đại lộ Kẹt Xe ùn tắc nhẹ…". Không ai vội về._
_Bác rót trà. Ly nào cũng đầy. Ai uống đặc, ai uống nhạt, ai cần thêm đá vì đang nóng ruột. Bác nhớ hết._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: NGƯỜI ĐỌC THƯ
// ------------------------------------------------------------
=== bac_bao_ve_kt_nguoi_doc_thu ===
# ngay:31
_Người ta sẽ kể về buổi họp đánh giá ngày 30/10 rất nhiều năm sau._
_Kể rằng phòng họp "Sáng Tạo" chật kín, người đứng tới cửa. Rằng {hr} đã cầm tập hồ sơ màu hồng. Rằng ai cũng nín thở._
_Rồi ông bảo vệ đi lên. Lần đầu tiên trong 16 năm. Đứng ở cuối phòng. Đeo kính lão. Mở một phong bì đã ố vàng._
_Giọng Bắc chậm rãi, từng chữ: "Công ty giữ lại. Thắng làm giám đốc thêm một năm. Không đứa nào bị đuổi vì cái lỗi ký không đọc của Thắng. Điều kiện duy nhất: không nhắn tin cho nhân viên sau 22 giờ."_
_Cả phòng họp đứng dậy vỗ tay. {giam_doc} khóc. {hr} gấp tập hồ sơ màu hồng lại, mãi mãi._
_Và ông bảo vệ gấp thư lại, nói đúng một câu: "Bác đọc xong rồi." Rồi đi xuống cổng, rót trà, đeo lại cái thẻ "Bảo vệ"._
_Không ai hỏi bác vì sao bác giữ thư. Không ai hỏi vì sao bác có giấy tờ gốc năm 2010. Không ai cần hỏi._
_Một tuần sau, {giam_doc} đặt một cái bảng nhỏ ở cổng, chữ in tay: "Sau 22 giờ: liên hệ bác Bình."_
_Tối thứ 2 đầu tiên của tháng 11, đúng 22 giờ 01, điện thoại {giam_doc} sáng lên. Anh gõ một tin nhắn cho group công ty. Ngón tay lơ lửng trên nút gửi._
_Từ chòi bảo vệ, một tin nhắn tới trước: "Anh {giam_doc}. Ngủ đi."_
_Anh bật cười. Xóa tin. Tắt máy._
_Dưới chòi, bác tắt đèn. Đúng 9 giờ như mọi khi. Hôm nay muộn hơn một chút. Bác vừa trực xong ca đêm dài nhất đời mình: ca canh một lá thư._
-> END

// ------------------------------------------------------------
// 😄 🌱 VỀ VƯỜN
// ------------------------------------------------------------
=== bac_bao_ve_kt_ve_vuon ===
# ngay:31
_Đêm Hồng thành công. Siêu Nhân Hồng nổi tiếng. {cong_ty} sống. Bác nhìn tất cả những thứ đó từ cổng sân khấu và nghĩ: thế là đủ._
_Tháng 11, bác nộp đơn nghỉ hưu. Viết tay, giấy kẻ ô học sinh. {hr} đọc xong, ngồi im năm phút, rồi ký. Lần đầu tiên anh làm thủ tục nghỉ việc mà khóc._
_Bác về nhà cấp 4 ở Ven Đô. Vườn rau muống. Bể cá. Tủ gỗ. Ghế bố mang từ chòi về, kê dưới gốc cây._
_Chủ nhật đầu tiên, có người tới._
_{thuc_tap_sinh} chở theo một thùng mì gói: "Dạ con mang để bác ăn dần ạ." Bác bảo mì gói không phải bữa sáng. {thuc_tap_sinh} cười, ở lại ăn cơm._
_{it} tới, không nói gì, tháo cái radio cũ của bác ra, thay linh kiện, lắp lại. Bây giờ nó bắt được cả đài nước ngoài._
_{chi_dai} mang cơm. Nồi canh chua cá lóc, kho quẹt, rau luộc. Ba người ăn hết sạch._
_Rồi {giam_doc} tới. Không mang gì. Ngồi xuống ghế nhựa dưới gốc cây, uống trà, không nói gì suốt hai tiếng. Lúc về, anh nói: "Chủ nhật sau em lại tới nhé bác."_
_Tuần nào cũng có người tới. Có tuần năm người. Có tuần mười người. Ông Ba trà đá bảo: "Chú về hưu mà nhà đông hơn hồi còn đi làm."_
_{cho} chạy khắp vườn rau, đuổi bướm, đào hố trồng xương. Không còn cổng nào phải gác. Không còn shipper nào phải sủa._
_Bể cá có thêm ba con cá mới, {thuc_tap_sinh} mua tặng. Bác đặt tên: {giam_doc}, {truong_phong} và {ran_doc}._
_Con {giam_doc} bơi lăng xăng cả ngày. Con {truong_phong} cứ bơi vòng tròn như đang họp. Con {ran_doc} trốn sau hòn non bộ, thỉnh thoảng mới ló ra._
_Bác ngồi bên bể, rót trà, nhìn ba con cá. Mười sáu năm gác cổng cho người khác. Bây giờ gác cái vườn của mình._
-> END

// ------------------------------------------------------------
// 😢 📭 THƯ KHÔNG HỒI ÂM
// ------------------------------------------------------------
=== bac_bao_ve_kt_thu_khong_hoi_am ===
# ngay:31
_Tháng 11. Hộp thư ở chòi trống._
_Bác vẫn viết. Tối chủ nhật. Giấy kẻ ô học sinh. Bút bi. "Gửi G,"._
_Bác kể chuyện Đêm Hồng. Kể chuyện {cho} lại cắn dây mạng. Kể chuyện thằng {thuc_tap_sinh} đã biết nói "không"._
_Năm ngày. Mười ngày. Hộp thư vẫn trống._
_Tháng 12. Bác viết thật hơn. Viết hết những gì tháng 10 bác đã giấu, đã tô đẹp, đã bỏ không gửi. Viết dài ba trang. Gửi._
_Hộp thư vẫn trống._
_Tháng 1. Tết. Công ty treo câu đối. {giam_doc} xuống chòi lì xì bác một phong bao đỏ: "Bác ơi, dạo này bác ít cười thế ạ?"_
_Bác cười. Một cái thôi._
_Có những thứ bác hiểu mà không cần ai nói. G không giận. G chỉ… không còn hỏi. Khi người ta thôi hỏi, là vì người ta thôi tin câu trả lời._
_Bác vẫn viết. Mỗi tối chủ nhật. Không phải để được trả lời. Mà vì bác đã hứa._
_Lá thư cuối cùng của mùa xuân năm ấy, bác chỉ viết đúng một dòng. Chữ nghiêng, chậm, rõ ràng:_
_"G ơi, bác vẫn ở cổng."_
_Bác dán tem. Ra bưu điện. Cô bưu tá hỏi: "Lại gửi đi nước ngoài hả chú?". Bác gật đầu._
_Về tới cổng, {cho} chạy ra đón. Hộp thư trống. Bác rót trà, ngồi xuống ghế bố, nhìn ra đường. Đợi._
-> END

// ------------------------------------------------------------
// 😢 🚪 BỊ CHO NGHỈ HƯU
// ------------------------------------------------------------
=== bac_bao_ve_kt_bi_cho_nghi_huu ===
# ngay:31
_Sáng 1/11. {giam_doc} đứng trước chòi. Không mang hoa. Không mang bánh cốm. Mang một tờ quyết định đánh máy._
giam_doc: Bác nghỉ ngơi đi ạ. Công ty sẽ thuê bảo vệ dịch vụ.
_Giọng Bắc đều đều, như đọc một bản tin. Anh không nhìn vào mắt bác. Anh nhìn cái ấm trà sứt vòi._
giam_doc: Em… em không trách bác. Em chỉ không biết mười năm nay, cái gì em làm cũng có người kể cho người khác. Em không làm việc được như thế, bác ạ.
_Bác gật đầu. Không giải thích. Có những thứ giải thích muộn thì thành biện minh._
_Bác gấp ghế bố. Cuộn dây radio. Bỏ ấm trà vào túi, cả cái cũ sứt vòi lẫn cái mới men xanh. Tháo cái thẻ "Bảo vệ" đặt lên bàn._
_Cuốn sổ trực, bác để lại. Mười sáu năm, ba mươi hai cuốn. Ai đọc thì đọc._
_Bác dắt xe ra cổng. {cho} đi theo. Qua bãi xe. Qua ô "HỒNG". Qua cái cột nó hay tè._
_Tới đầu đường, {cho} đứng lại. Nhìn bác. Nhìn cổng. Nhìn bác._
bac_bao_ve: Ở lại. Ở đấy có người cho mày ăn.
_{cho} ngồi xuống giữa đường. Không theo. Không về._
_Chiều hôm đó, công ty dịch vụ cử người tới. Áo xanh, bộ đàm mới, không uống trà. Thấy {cho} nằm trước cổng, anh ta xua tay:_
_"Chó ở đâu ra? Đi! Đi ra!"_
_{cho} lùi ra khỏi cổng. Lần đầu tiên trong đời, nó đứng ở phía ngoài._
-> END

// ------------------------------------------------------------
// 😢 💚 GÁC CỔNG CHO NGƯỜI LẠ
// ------------------------------------------------------------
=== bac_bao_ve_kt_gac_cong_cho_nguoi_la ===
# ngay:31
_Tháng 12. {cong_ty} không còn nữa. LL-Entertainment mua lại tòa nhà ba tầng với giá rẻ như mua cái chòi._
_Một sáng thứ 2, xe cẩu tới. Biển chữ "G" bảy màu được tháo xuống. Cái biển Genta vẽ trên tờ giấy ăn ở quán phở năm 2010._
_Thay vào là chữ "LL" màu xanh lá chuối, đèn LED, sáng cả ngày lẫn đêm._
_Slogan trên tường sảnh được sơn lại: "Việc hôm nay phải xong từ hôm qua."_
_Bác vẫn đứng ở cổng. Đồng phục mới màu xanh lá. Lương 15 triệu, như người ta hứa. Có máy lạnh trong chòi. Có camera thay cho sổ trực._
_Không có ấm trà. Nội quy mới: "Không ăn uống tại vị trí trực."_
_Người ra vào là người lạ. Họ quẹt thẻ, đi qua, không chào. Không ai đi trễ, vì máy chấm công tự trừ lương. Không ai về muộn với người không cùng phòng, vì camera thấy hết._
_Không ai cần bác thấy gì nữa._
_Hai cái ghế nhựa trước chòi bị dọn đi từ tuần đầu. Bác giấu một cái sau bồn cây, tối tối lôi ra ngồi một mình._
_Lá thư cuối cùng gửi G, bác viết mà không gửi. Vì không biết gửi để nói gì. Vì phong bì 3 triệu tháng 10 vẫn nằm đâu đó trong túi áo cũ, nặng hơn lương cả tháng._
_Thỉnh thoảng có một con chó vàng gầy nhom đi ngang cổng, đứng lại nhìn vào. Bảo vệ ca đêm đuổi nó đi._
_Bác không đuổi. Bác lén để một cây xúc xích ở chân hàng rào. Sáng ra, cây xúc xích không còn._
_Thế là đủ. Bác tự nhủ. Thế là đủ._
-> END
