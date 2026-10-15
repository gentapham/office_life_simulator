// ============================================================
// KẾ TOÁN · SÁU KẾT THÚC
// Đánh giá dựa trên họp đánh giá 30/10 và con số cuối cùng sau
// Đêm Hồng, nên cảnh đánh giá chạy cuối ngày 31/10.
// Thứ tự ưu tiên:
//   1. Mất Ngủ Vĩnh Viễn    (ngất lần thứ hai)
//   2. 🔒 Trang 47b (bí mật) (47b có hiệu lực, không phá chiến dịch)
//   3. Người Hùng Quỹ Đen   (tự khai, quỹ ≥ 297, quan hệ sếp ≥ 40)
//   4. Kẻ Biển Thủ          (đủ 3 dấu vết, người khác lộ, chưa tự khai)
//   5. Sổ Sạch, Ngủ Ngon    (qua thuế, ≥ 1 triệu, Mất Ngủ < 40)
//   6. Phá Sản              (dưới 1 triệu)
//   Còn lại (đủ 1 triệu nhưng chưa trọn điều kiện 5): Sổ Sạch, Ngủ Ngon
// ============================================================

=== ke_toan_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc
{
- kt_lan_ngat >= 2:
    ~ chot_ket_thuc("mat_ngu_vinh_vien")
    -> ke_toan_kt_mat_ngu_vinh_vien
- kt_47b_hieu_luc && not kt_pha_chien_dich:
    ~ chot_ket_thuc("trang_47b")
    -> ke_toan_kt_trang_47b
- kt_tu_khai && kt_quy_den >= 297 && qh_giam_doc >= 40:
    ~ chot_ket_thuc("nguoi_hung_quy_den")
    -> ke_toan_kt_nguoi_hung_quy_den
- kt_quy_den_lo && kt_lo_boi_nguoi_khac && not kt_tu_khai:
    ~ chot_ket_thuc("ke_bien_thu")
    -> ke_toan_kt_ke_bien_thu
- nguoi_theo_doi < 1000000:
    ~ chot_ket_thuc("pha_san")
    -> ke_toan_kt_pha_san
- else:
    ~ chot_ket_thuc("so_sach_ngu_ngon")
    -> ke_toan_kt_so_sach_ngu_ngon
}

// Độ Mất Ngủ chạm 100: ngất ở phòng kế toán, nằm viện 2 ngày.
=== ke_toan_tudo_ngat_xiu ===
# bat_buoc # noi:phong_ke_toan # dieu_kien:kt_dang_nam_vien
{ kt_lan_ngat >= 2:
    ~ chot_ket_thuc("mat_ngu_vinh_vien")
    -> ke_toan_kt_mat_ngu_vinh_vien
}
_Bạn đang cộng một cột số. Con số thứ 47 nhòe đi. Rồi cả cột nhòe đi. Rồi cái bàn nghiêng._
_Tiếng cuối cùng bạn nghe là {thuc_tap_sinh}: "Chị {ke_toan}! Chị {ke_toan} ơi!"_
_Bạn tỉnh dậy ở Phòng khám Đa Khoa Khỏe Re. Dây truyền nước trên tay. Bác sĩ đeo kính, rất dễ tính._
bac_si_khoe_re: Mất ngủ kéo dài, kiệt sức. Nằm đây 2 ngày. Không điện thoại, không con số.
* [😮‍💨 Gật đầu. Nhắm mắt.]
    ~ kt_ngu(-20)
    ~ nghi(50)
    _Hai ngày. Không ai duyệt chi được. Chiến dịch đứng hình. Nhưng bạn ngủ._
* [📱 Lén mở điện thoại xem có ai duyệt chi thay mình không.]
    _Không ai. 23 đề nghị thanh toán đang chờ. {chi_dai} giật điện thoại của bạn, nhét vào túi áo._
    chi_dai: Nằm im. Không thì tui trói.
    ~ qh("chi_dai", 5)
    ~ kt_ngu(-10)
- ~ follow(-20000)
~ kt_dang_nam_vien = false
~ kt_mat_ngu = 50
_{chi_dai} ngồi bên giường, gọt táo, nói đúng một câu: "Lần sau bà mà ngất nữa, tui khóa két của bà lại."_
-> END

// ------------------------------------------------------------
// 😄 1. NGƯỜI HÙNG QUỸ ĐEN
// ------------------------------------------------------------
=== ke_toan_kt_nguoi_hung_quy_den ===
# ket_thuc:nguoi_hung_quy_den # loai:co_hau
_Họp đánh giá 30/10. Phòng "Sáng Tạo". Không ai cầm gối, không ai ngủ gật._
_{giam_doc} đứng ở đầu bàn, không cầm slide, không nói tiếng Anh. Trên tay anh ấy là cuốn sổ tay ghi tay của bạn, bìa sờn, góc quăn._
giam_doc: Mười năm nay, có người lo cho các em hơn cả anh.
_Anh ấy mở cuốn sổ, đọc to từng dòng._
giam_doc: "Tháng 1 năm 2024. Cộng 8 triệu. Không đi du lịch Tết." … "Tháng 9 năm 2025. Cộng 5 triệu. Không mua kính mới, dùng kính lúp." …
_Cả phòng quay sang nhìn bạn. Bạn nhìn xuống bàn. Bạn đếm vân gỗ trên bàn. Bốn mươi bảy vân._
giam_doc: Hai trăm chín mươi bảy triệu. Một tháng lương cho hai mươi mốt người. Và… *(lật trang cuối)* … sáu mươi cây xúc xích cho {cho}.
cho: *(ở ngoài cửa)* Gâu!
_Có người bật cười. Có người khóc. {thuc_tap_sinh} khóc to nhất._
giam_doc: Từ hôm nay, {ke_toan} là Giám đốc Tài chính của công ty. Anh không ép. Lần này là anh xin.
_Cả phòng vỗ tay. {chi_dai} vỗ mạnh tới mức cái bàn rung._
_Bạn đứng dậy. Bạn có cả một bài phát biểu trong đầu, có số liệu, có biểu đồ. Bạn nói đúng một câu._
ke_toan: Lương tháng 11 về đúng ngày 10. Hóa đơn đâu mọi người?
_Cả phòng cười. Cười tới mức {cho} ngoài cửa cũng sủa theo, sủa liên tục, không ai bảo dừng._
_Tối đó, bạn về nhà số 18. Bức tranh phong cảnh vẫn treo đó. Két sắt phía sau giờ trống trơn._
_Bạn treo lên tường, ngay cạnh bức tranh, tấm thẻ tên mới: "Giám đốc Tài chính". Bạn dán nhãn cho nó: "Thẻ tên – KHÔNG MƯỢN"._
-> END

// ------------------------------------------------------------
// 😄 2. SỔ SẠCH, NGỦ NGON
// ------------------------------------------------------------
=== ke_toan_kt_so_sach_ngu_ngon ===
# ket_thuc:so_sach_ngu_ngon # loai:co_hau
_Đêm Hồng. Pháo giấy hồng vừa nổ. Con số trên màn hình lớn vượt một triệu. Top 10 xu hướng._
_Đám đông nhảy. {hong_hot} hét. {chi_dai} nhấc bổng {thuc_tap_sinh} lên. {giam_doc} đứng khóc trong bộ đồ hóa trang, không ai nhận ra._
_23:47. Điện thoại bạn rung. "Tài khoản công ty +5.000.000.000đ."_
_Ngay giữa đám đông đang nhảy, bạn mở ngân hàng điện tử. Wifi có lại rồi. Chuyển khoản trả hết nợ ngân hàng. Khoản vay thế chấp biệt thự số 1, Đồi Ngân Hàng: tất toán._
_Bạn bấm "Xác nhận". Lần đầu tiên trong mười năm, bấm xong không phải lo gì._
{ kt_bi_phat_thue:
    _Biên bản phạt thuế 200 triệu vẫn nằm trong ngăn kéo. Nhưng đã đóng đủ. Có hóa đơn._
}
_Bạn về nhà số 18. Đi thẳng tới tủ lạnh._
{ kt_trang_47_tu_lanh:
    _Tờ giấy "trang 47 chữ cỡ 20" vẫn dán ở đó, mép đã quăn. Bạn gỡ nó xuống. Gấp làm tư. Không vứt. Bỏ vào ngăn kéo, dán nhãn "Đã xong"._
- else:
    _Tủ lạnh trống trơn, chỉ có hộp cơm ghi tên "{ke_toan}". Bạn ăn nó. Không ai lấy được nữa._
}
_Bạn tắt điện thoại. Kéo rèm. Nằm xuống._
{ kt_mat_ngu < 40:
    _Bạn ngủ một mạch 14 tiếng. Không mơ thấy con số nào._
- else:
    _Bạn nằm thao thức một lúc, đếm vết nứt trên trần, đếm tới 12 thì ngủ. Ngủ một mạch 11 tiếng. Với bạn, thế là kỷ lục._
}
_Sáng ra, có 37 tin nhắn của {giam_doc}. Tin đầu: "Cảm ơn em." Tin cuối: "Em ơi mai mình mở rộng văn phòng nhé anh không ép tùy em."_
_Bạn để "đã xem". Rồi đi pha một ly cà phê. Có hóa đơn._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 TRANG 47B (bí mật)
// ------------------------------------------------------------
=== ke_toan_kt_trang_47b ===
# ket_thuc:trang_47b # loai:co_hau # bi_mat
{ nguoi_theo_doi >= 1000000:
    _Đêm Hồng thành công. Một triệu người. Năm tỷ thưởng. Không ai cần tới trang 47b._
- else:
    _Đêm Hồng dừng ở con số {nguoi_theo_doi}. Không đủ. Giấy đòi 10 tỷ chưa kịp gửi thì luật sư của {sieu_nhan_hong} đã gửi một tờ khác: "Căn cứ trang 47b, Bên A không yêu cầu hoàn trả."_
    _Công ty vẫn còn. Cả công ty đã cố hết sức. Có ba chữ ký làm chứng cho điều đó._
}
_Sáng 1/11. Phòng kế toán, tầng 2. Chưa ai tới. Bạn đến sớm như mọi khi._
_Bạn lấy trang 47b ra khỏi bìa nhựa. Tờ giấy viết tay, mực tím, chữ nghiêng. Chữ ký của {sieu_nhan_hong}. Chữ ký của {giam_doc}, lần đầu tiên ký sau khi đọc._
{ kt_nhan_chung_47b == "chi_dai":
    _Và chữ ký của {chi_dai}, to như chữ ký trên hợp đồng mua nhà._
- else:
    _Và chữ ký của Bác {bac_bao_ve}, ngay ngắn như chữ học trò._
}
_Góc giấy vẫn còn vết dầu bánh chuối chiên, ố vàng. Bạn lấy khăn ướt, lau thật nhẹ. Từng chút. Như lau một tấm ảnh cũ._
_Bạn bỏ nó vào bìa nhựa mới, cất vào két. Két công ty. Không phải két sau bức tranh._
_Ngoài cửa sổ, {sieu_nhan_hong} đang đứng ở cổng, giả tiếng sủa chọc {cho}. {cho} gầm gừ, nhảy lên đòi cắn mũ. Bác {bac_bao_ve} ngồi uống trà, không can._
_Bạn mở sổ cái tháng 11. Dòng đầu tiên._
_"Khoản thu bất ngờ: một người tốt. Không có hóa đơn."_
_Bạn nhìn dòng chữ rất lâu. Mười năm, chưa từng có khoản nào không có hóa đơn đi qua tay bạn._
_Bạn cầm con dấu. Đóng xuống._
_"ĐÃ DUYỆT."_
-> END

// ------------------------------------------------------------
// 😢 4. KẺ BIỂN THỦ
// ------------------------------------------------------------
=== ke_toan_kt_ke_bien_thu ===
# ket_thuc:ke_bien_thu # loai:buon
_Họp đánh giá. Màn hình lớn phòng "Sáng Tạo" chiếu một tấm ảnh: két sắt sau bức tranh, nhà số 18, Phố Cũ. Cửa két hé mở. Những xấp tiền buộc dây thun._
_Ai chụp, không ai nói. {ran_doc} nhìn xuống bàn. {thuc_tap_sinh} nhìn bạn, mắt đỏ, như muốn xin lỗi vì đã đếm ra con số lệch._
hr: *(cười, nụ cười buồn nhất bạn từng thấy)* {ke_toan} ơi, mình lên phòng anh uống trà xíu.
_Cuốn sổ tay ghi tay nằm trong túi xách bạn. Từng đồng, từng tháng, từng lý do. Không ai hỏi xem nó._
_Bạn uống trà với {hr}. Trà Lắng Nghe. Anh ấy lắng nghe rất kỹ, rồi đưa bạn một tờ giấy để ký._
_Chiều. Bạn ôm một thùng carton, bên trong toàn hóa đơn đã dán nhãn, đi xuống cầu thang. Không ai đứng dậy._
_Bạn đi ngang bảng thông báo. Tờ giấy vẫn dán ở đó, mép đã ngả vàng: "Ai lấy hộp cơm có ghi tên {ke_toan}, trả lại."_
_Bạn không gỡ nó xuống._
_Ở cổng, Bác {bac_bao_ve} đứng sẵn. Bác mở cổng. Rồi nói nhỏ, chỉ đủ cho một mình bạn nghe._
bac_bao_ve: Bác biết cháu không lấy đồng nào.
_Bạn gật đầu. Bác chỉ nói với mình bạn. Như mọi lần, bác không nói với ai khác._
cho: *(đi theo bạn tới đầu đường, rồi ngồi xuống, nhìn theo)*
_Tối đó, ở nhà số 18, bạn mở cuốn sổ. Viết dòng cuối: "30/10. Còn lại: {kt_quy_den} triệu. Chưa ai nhận."_
-> END

// ------------------------------------------------------------
// 😢 5. PHÁ SẢN
// ------------------------------------------------------------
=== ke_toan_kt_pha_san ===
# ket_thuc:pha_san # loai:buon
_Đêm Hồng dừng ở con số {nguoi_theo_doi}. Không đủ một triệu. Không vào top 10._
{ kt_47b_hieu_luc && kt_pha_chien_dich:
    _Trang 47b có đủ chữ ký. Nhưng tờ giấy viết rõ: "Nếu có người cố tình phá, thì giữ nguyên trang 47." Bạn là người đó. Bạn biết._
}
_Ngày 1/11, giấy đòi 10 tỷ tới. Bạn ký nhận. Chữ ký không run. Bạn đã tập ký tờ này trong đầu từ đêm 1/10._
{ kt_quy_den_nop:
    _Quỹ đen đã nộp vào sổ chung từ hôm kiểm tra thuế. Sổ chung giờ thuộc về chủ nợ. Két sau bức tranh trống trơn._
    _Đêm đó, ở nhà số 18, bạn rút hết tiền tiết kiệm của mình. Hai mươi mốt phong bì, mỗi cái mỏng hơn bạn muốn._
- else:
    _Đêm đó, ở nhà số 18, bạn gỡ bức tranh. Mở két. {kt_quy_den} triệu. Cuốn sổ ghi tay._
    _Bạn ngồi cả đêm, bỏ từng phong bì. Hai mươi mốt cái. Mỗi cái một tháng lương, ghi tên từng người bằng bút bi kế toán._
}
_Phong bì cuối cùng, bạn ghi: "{cho} – 60 cây xúc xích"._
_Sáng ra, bạn đi phát từng phong bì. {thuc_tap_sinh} cúi đầu cảm ơn 90 độ. {hong_hot} ôm bạn, không nói được câu nào. Bác {bac_bao_ve} nhận phong bì, nhìn bạn, gật đầu chậm._
_Ai cũng cảm ơn. Không ai hỏi tiền ở đâu ra. Không ai biết đây là hai năm không đi du lịch Tết, không mua kính mới, không mua áo._
_Bạn về nhà. Mở máy tính. Hộp thư còn một email cũ, ngày 27/10, người gửi Lưu Lực: "Ở LL, chúng tôi chưa bao giờ trả lương trễ."_
{ kt_ll_email == 1:
    _Bạn từng hỏi lại: "Hóa đơn của lời mời này đâu anh?". Anh ta chưa bao giờ trả lời._
}
_Lần này, bạn không đóng nó._
-> END

// ------------------------------------------------------------
// 😢 6. MẤT NGỦ VĨNH VIỄN
// ------------------------------------------------------------
=== ke_toan_kt_mat_ngu_vinh_vien ===
# ket_thuc:mat_ngu_vinh_vien # loai:buon
_Lần thứ hai. Phòng kế toán, ngày 30/10. Bạn đang đọc con số cuối cùng của bảng tổng kết. Rồi chữ số bắt đầu bơi._
_Bạn tỉnh dậy ở Phòng khám Đa Khoa Khỏe Re. Dây truyền nước trên tay trái. Trần nhà màu trắng, không có vết nứt nào để đếm._
bac_si_khoe_re: Lại là em à? *(lật hồ sơ)* Lần thứ hai trong tháng. Lần này nghỉ 2 tháng. Tránh mọi con số.
ke_toan: Dạ… mọi con số là sao bác sĩ?
bac_si_khoe_re: Là mọi con số. Kể cả giờ đồng hồ.
_Bác sĩ đi ra. Bạn nằm. Điện thoại trên tủ đầu giường sáng lên. {chi_dai} gửi video._
_Đêm Hồng. Đèn hồng. Pháo giấy. Tiếng hét. {sieu_nhan_hong} tạo dáng. Hàng ghế cuối, chỗ bạn định ngồi, có một cái ghế trống. Ai đó đặt lên ghế một máy tính bỏ túi._
_Bạn xem video ba lần. Lần thứ ba, bạn để ý con số người theo dõi ở góc màn hình: {nguoi_theo_doi}. Bạn nhắm mắt lại. Bạn hứa với bác sĩ rồi._
_Năm phút sau, bạn mở mắt._
_Bạn lén lấy tờ giấy ghi đơn thuốc trên tủ, lật mặt sau. Lấy cây bút bi kế toán trong túi áo bệnh nhân. Không ai biết sao nó lại ở đó._
_Bạn bắt đầu tính: viện phí, bảo hiểm trả bao nhiêu phần trăm, phần còn lại chia mấy tháng._
_Y tá đi ngang, nhìn tờ giấy kín số, lắc đầu, nhưng không giật._
_Ngoài cửa sổ, Thành Phố Ước Mơ tối dần. Ở góc tờ đơn thuốc, bạn viết nhỏ thêm một dòng không phải con số: "Ngủ đi, {ke_toan}."_
-> END
