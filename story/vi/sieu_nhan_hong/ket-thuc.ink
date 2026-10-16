// ============================================================
// SÁU KẾT THÚC ĐỜI TƯ CỦA NGUYỄN NGUYÊN
// Sáu kết thúc sự nghiệp của Siêu Nhân Hồng nằm ở nội dung chung,
// dựa trên nguoi_theo_doi, so_scandal, nguyen_theo_ll,
// nguyen_thao_mu_dem_hong mà các chương đã đặt.
// Tên cảnh đánh giá giữ "3010" theo quy ước, nhưng cảnh chạy sau
// Đại Nhạc Hội Siêu Nhân 31/10 để tính cả lựa chọn tháo mũ trong đêm diễn.
// ============================================================

=== sieu_nhan_hong_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # danh_gia_ket_thuc
// 1. Cây ATM Hồng: Độ Lộ Tiền đầy (có thể xảy ra bất cứ lúc nào)
{ snh_lo_tien >= 100:
    ~ chot_ket_thuc("cay_atm_hong")
    -> sieu_nhan_hong_kt_cay_atm_hong
}
// 2. Chiêu PR Hay Ghê: tỏ tình trên livestream / sân khấu khi Tim Hồng < 60
{ snh_to_tinh_pr:
    ~ chot_ket_thuc("chieu_pr_hay_ghe")
    -> sieu_nhan_hong_kt_chieu_pr_hay_ghe
}
// 3. Bí mật: Bạn Bốn Chân
{ snh_chuoi_hien_tai() >= 10 && snh_so_xuc_xich_tuat >= 15 && snh_cong_tuat_ve && qh_cho >= 80:
    ~ chot_ket_thuc("ban_bon_chan")
    -> sieu_nhan_hong_kt_ban_bon_chan
}
// 4. Không Phải PR
{ snh_tim_hong >= 80 && snh_thao_mu_truoc_vu >= 2 && not snh_qua_truoc_camera && not snh_to_tinh_camera:
    ~ chot_ket_thuc("khong_phai_pr")
    -> sieu_nhan_hong_kt_khong_phai_pr
}
// 5. Cây Kem Xóm Cây Me
{ snh_mo_nhanh_hieu_ech && snh_no_xom_cu <= 20 && snh_xin_loi_hieu_kin && snh_han_cua_hieu < 40:
    ~ chot_ket_thuc("cay_kem_xom_cay_me")
    -> sieu_nhan_hong_kt_cay_kem_xom_cay_me
}
// 6. Người Trong Bộ Đồ (cũng là kết thúc mặc định khi không khớp điều kiện nào)
~ chot_ket_thuc("nguoi_trong_bo_do")
-> sieu_nhan_hong_kt_nguoi_trong_bo_do

// ------------------------------------------------------------
// 😄 💗 KHÔNG PHẢI PR
// ------------------------------------------------------------
=== sieu_nhan_hong_kt_khong_phai_pr ===
# ket_thuc:khong_phai_pr # loai:co_hau
_Đại Nhạc Hội Siêu Nhân tan. 0 giờ 40. Sân thượng {cong_ty}. Ghế nhựa, cây phơi đồ, thùng nước. Đèn thành phố nhấp nháy như ai đó đang gõ phím._
_Bạn ngồi trên ghế nhựa. Không mặc đồ. Áo thun xám, tóc bết, tay còn dính kim tuyến pháo hoa._
_Cửa sân thượng kêu két. {chua_te_deadline} bước lên, tay cầm hai ly trà sữa. Một ly nhiều đá. Một ly topping hồng, hồng nhiều nhiều._
chua_te_deadline: Em đoán anh ở đây. Em đoán đúng một lần trong đời.
_Cậu ta ngồi xuống ghế bên cạnh. Lục túi. Đưa bạn một tờ giấy gấp làm tư._
_Bạn mở ra. Chữ viết tay, xấu, nghiêng như chạy deadline:_
_"KẾ HOẠCH ĐI ĂN TỐI. Địa điểm: quán ốc. Người đi: em, anh. Không camera. Deadline: tối mai."_
_Dòng cuối, gạch chân hai lần: "Trạng thái: làm xong từ hôm qua rồi."_
sieu_nhan_hong: Em… làm xong sớm hả?
chua_te_deadline: Lần đầu tiên trong đời. Cả công ty mà biết chắc nghĩ em bị bệnh.
chua_te_deadline: Em nghĩ cả tháng. Mấy món quà, cái hộp cơm, cái pantry hôm mất điện. Không có camera nào hết.
chua_te_deadline: Không phải PR. Em biết rồi. Biết hơi trễ. Mà em quen trễ rồi.
_Bạn cười. Không tạo dáng. Không hô "Biến hình". Chỉ cười, mũi đỏ._
_Chiếc mũ hồng nằm trên cái ghế nhựa thứ ba. Bạn nhìn nó một lúc. Rồi không đội lại._
chua_te_deadline: Mai 7 giờ nha anh. Em tới đúng giờ. Thề.
sieu_nhan_hong: Còn sớm mà. Chill.
chua_te_deadline: *(cười)* Câu của em mà.
_Dưới sân, {cho} sủa một tiếng. Rồi im. Thành phố vẫn sáng. Ở cuối một con đường không tên, căn nhà 12 ghế tối đèn. Tối nay không ai cần về đó sớm._
-> END

// ------------------------------------------------------------
// 😄 🐸 CÂY KEM XÓM CÂY ME
// ------------------------------------------------------------
=== sieu_nhan_hong_kt_cay_kem_xom_cay_me ===
# ket_thuc:cay_kem_xom_cay_me # loai:co_hau
_Một tuần sau Đại Nhạc Hội Siêu Nhân. Quán trà đá đầu Hẻm 69. Chiều muộn. Ông Ba quạt mo._
_Bạn đi bộ tới, không mặc đồ, tay cầm hai cây kem que mua ở tiệm tạp hóa đầu đường. Kem dâu. Loại rẻ nhất, giống hệt hai mươi năm trước._
_{ran_doc} ngồi ở bàn trong góc, ly trà đá 3 nghìn. Thấy bạn, cậu ta không đứng dậy. Cũng không quay đi._
_Bạn đặt một cây kem trước mặt cậu ta._
sieu_nhan_hong: Hai mươi năm trước anh giật của em một cây. Giờ anh trả.
ran_doc: *(nhìn cây kem rất lâu)* Có lãi hông?
sieu_nhan_hong: Dạ… ờm… hông. Hết tiền rồi.
ran_doc: Nói xạo. Cả quận biết anh giàu.
_Cậu ta bóc vỏ, cắn một miếng. Nhăn mặt._
ran_doc: Kem dở ẹc.
_Im lặng. Ông Ba quạt mo. Một chiếc xe máy chạy ngang, bóp còi._
ran_doc: …Mà thôi. Huề.
_Bạn ngồi xuống. Cắn cây kem của mình. Dở ẹc thật. Ngon nhất đời._
ran_doc: Hồi đó, cái lỗ thông gió hình con cá. Em đếm vảy con cá cho đỡ sợ. 23 cái vảy.
sieu_nhan_hong: 23 hả.
ran_doc: Ừ. Giờ em không cần đếm nữa.
_Ở bàn bên, Bác {bac_bao_ve} đánh cờ với ông Ba, rót trà, làm như không nghe thấy gì. Nhưng bác đi sai một nước. Bác chưa bao giờ đi sai nước nào._
_{cho} nằm dưới gầm bàn bác, liếc lên nhìn hai cây kem, rồi liếm mép._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: BẠN BỐN CHÂN
// ------------------------------------------------------------
=== sieu_nhan_hong_kt_ban_bon_chan ===
# ket_thuc:ban_bon_chan # loai:co_hau # bi_mat
_23:00 ngày 31/10. Đại Nhạc Hội Siêu Nhân đã tàn. Cổng {cong_ty} vắng tanh. Đèn chòi bảo vệ còn sáng._
_Bạn ghé lại lấy chiếc xe hồng. Vẫn mặc nguyên bộ đồ. Mỏi tới mức không muốn tạo dáng nữa._
_Từ gầm cầu thang, có tiếng chân lạch bạch. {cho} chạy ra, chân sau còn hơi khập khiễng từ hôm bị lạc. Trong miệng nó ngậm một thứ màu hồng._
_Chiếc găng tay hồng. Cái bạn làm mất từ ngày 4/10. Bẩn, rách một ngón, dính lông chó và mùi cà phê sữa đá. Nó đã giữ suốt 27 ngày._
_{cho} đặt chiếc găng xuống chân bạn. Lùi lại một bước. Nhìn bạn._
_Rồi nó nằm ngửa ra, bốn chân chổng lên trời, bụng phơi ra. Đòi gãi bụng._
* [🙂 Quỳ xuống, gãi bụng {cho}.]
    _Bạn quỳ giữa sân, trong bộ đồ hồng, gãi bụng một con chó. Nó lim dim mắt, chân sau đạp đạp vào không khí._
* [🙂 Tháo mũ ra trước, rồi mới gãi bụng.]
    _Bạn tháo mũ, đặt xuống đất. {cho} ngửi cái mũ. Không cắn. Rồi lại nằm ngửa ra, chờ._
- cho: …Gâu. *(nhỏ xíu, như một tiếng thở)*
_Đây là lần đầu tiên {cho} không sủa bộ đồ hồng._
_Cửa chòi bảo vệ hé mở. Bác {bac_bao_ve} nhìn ra, tay cầm ly trà, kính trễ xuống mũi._
bac_bao_ve: Thế à.
_Bác đóng cửa lại. Một lúc sau, bác mở ra lần nữa, đặt ra bậc thềm một cái ghế nhựa và một ly trà nóng._
_Bạn ngồi xuống. {cho} nằm cạnh chân, gác cằm lên chiếc găng tay hồng. Thành phố vẫn còn tiếng pháo hoa ở đâu đó._
_Hợp đồng ghi điều khoản số 5, bút bi ở lề: "Có con chó ở cổng, nhớ cho em chọc nó."_
_Bạn lấy bút, gạch dòng đó đi. Viết lại: "Có con chó ở cổng. Nhớ mang xúc xích."_
-> END

// ------------------------------------------------------------
// 😢 🎭 NGƯỜI TRONG BỘ ĐỒ
// ------------------------------------------------------------
=== sieu_nhan_hong_kt_nguoi_trong_bo_do ===
# ket_thuc:nguoi_trong_bo_do # loai:buon
_Căn nhà ở cuối con đường không tên. Bàn ăn 12 ghế. Bạn ngồi ở cái ghế duy nhất có dấu ngồi._
_Tivi đang chiếu lại Đại Nhạc Hội Siêu Nhân. Siêu Nhân Hồng tạo dáng giữa pháo hoa. Cả khán đài hô: "Hồng không phải màu, Hồng là thái độ!"_
_Trên màn hình, con số người theo dõi: {nguoi_theo_doi}._
_Trên bàn là đĩa bánh chuối chiên mang về từ phòng chờ. Điều khoản số 4. Đã nguội._
_Bộ đồ hồng treo trên móc ở góc phòng. Từ đây nhìn sang, nó giống một người khác đang đứng đó, nhìn bạn ăn tối._
_Điện thoại có 214 thông báo. "Anh Hồng ơi đỉnh quá!", "Slay!", "Bao giờ có MV mới anh?". Bạn đọc từng cái._
_Không cái nào gọi tên Nguyễn {sieu_nhan_hong}._
{ snh_tim_hong >= 40:
    _Có một tin nhắn chưa đọc từ {chua_te_deadline}: "Anh diễn đẹp lắm. Mai công ty ăn mừng, anh tới hông?". Bạn gõ "Dạ". Rồi xóa. Rồi để đó._
- else:
    _Khung chat với {chua_te_deadline} vẫn dừng ở tin cuối: một sticker ngón cái, gửi từ tuần trước._
}
{ snh_no_xom_cu >= 60:
    _Trong ví, tấm ảnh xóm Cây Me vẫn nằm sau tấm vé số cắt góc. Thằng nhóc gầy nhom ở góc ảnh vẫn đang khóc. Bạn vẫn chưa biết tên nó._
}
_Bạn cắn một miếng bánh chuối chiên. Nguội, mà vẫn ngọt._
_Ngoài kia, cả nước biết Siêu Nhân Hồng._
_Trong căn nhà này, không ai biết Nguyễn {sieu_nhan_hong} đã ăn tối chưa._
_Mười một cái ghế trống. Đèn vẫn chiếu xuống từng cái, như đang đợi._
-> END

// ------------------------------------------------------------
// 😢 💔 CHIÊU PR HAY GHÊ
// ------------------------------------------------------------
=== sieu_nhan_hong_kt_chieu_pr_hay_ghe ===
# ket_thuc:chieu_pr_hay_ghe # loai:buon
_Đại Nhạc Hội Siêu Nhân. Giữa sân khấu, giữa pháo hoa, bạn quỳ xuống. Một bó hoa hồng. Cả khán đài hét đến khản cổ._
_{chua_te_deadline} bị đẩy ra giữa sân khấu, tay vẫn cầm bộ đàm. Ánh đèn rọi thẳng vào mặt. Cậu ta cười. Một nụ cười rất chuyên nghiệp._
_Cậu ta nhận hoa. Ghé sát micro, nói nhỏ, nhưng micro bắt được hết:_
chua_te_deadline: Chiêu này đỉnh nóc kịch trần luôn anh ơi. KPI vượt rồi.
_Khán đài cười ồ, vỗ tay. Ai cũng nghĩ đó là câu đùa dễ thương nhất đêm nay. Bạn cũng cười. Vì cả nghìn người đang nhìn._
_Pháo hoa nổ. Bạn đứng dậy, tạo dáng. Tay vẫn còn run._
_Sáng hôm sau, 7 giờ 02. Điện thoại rung. Một tin nhắn từ {chua_te_deadline}._
_Một file báo cáo: "Màn tỏ tình Đại Nhạc Hội Siêu Nhân: 4,7 triệu lượt xem, 312.000 lượt chia sẻ, top 1 xu hướng 6 tiếng liền. Tương tác tăng 840%."_
_Kèm một sticker ngón cái._
_Bên dưới, một dòng: "Anh với anh {quan_ly_idol} làm content giỏi thiệt. Em học được nhiều lắm. Chill."_
_Bạn đọc đi đọc lại. Không có chữ nào sai. Chỉ là không có chữ nào đúng._
_Bạn gõ: "Hông phải PR đâu em." Ngón tay dừng ở nút gửi._
_Rồi bạn xóa. Gửi lại một sticker ngón cái._
_Căn nhà 12 ghế. Bó hoa hồng ai đó mang về giùm, cắm trong cái ly giữa bàn. Đẹp như trên tivi._
-> END

// ------------------------------------------------------------
// 😢 💸 CÂY ATM HỒNG
// ------------------------------------------------------------
=== sieu_nhan_hong_kt_cay_atm_hong ===
# ket_thuc:cay_atm_hong # loai:buon
_Tin nóng lên top 1 xu hướng lúc 6 giờ sáng: "SIÊU NHÂN HỒNG LÀ TỶ PHÚ VÉ SỐ"._
_Bên dưới là ảnh chụp tấm vé số năm 2019, không biết ai chụp được. Ảnh căn nhà ở cuối con đường không tên, chụp từ trên cao. Ảnh bàn ăn 12 ghế._
_Điện thoại bạn có 47 tin nhắn chưa đọc. Bạn mở từng cái._
dan_dau_tu: *(tin nhắn)* Anh ơi lần này là lên thật. Em có một dự án, chỉ cần anh góp chút xíu thôi.
idol_het_thoi: *(tin nhắn)* Em ơi, mượn tạm anh ít vốn ra album. Anh trả bằng… độ nổi tiếng.
_Một số lạ: "Anh còn nhớ em hông? Mình học chung lớp 3 đó." Bạn không học lớp 3 ở trường đó._
_Một số lạ khác: "Anh ơi con em bệnh." Một số khác: "Anh ơi em mở quán." Một số khác: "Anh ơi."_
_Trang Phây-búc của Siêu Nhân Hồng tăng 200.000 người theo dõi trong một buổi sáng. Không ai bình luận về MV. Ai cũng bình luận về số tiền._
_Bạn đọc hết 47 tin nhắn. Đọc lại từ đầu._
_Không tin nhắn nào hỏi: "Anh khỏe hông?"_
_Ở cổng {cong_ty}, một đám người lạ đứng chờ chiếc xe hồng. Bác {bac_bao_ve} đóng cổng, đứng chắn, không nói gì. {cho} sủa đám người lạ, lần đầu tiên không sủa bạn._
_Bạn không tới công ty hôm đó. Bạn ngồi trong căn nhà 12 ghế, rèm kéo kín, điện thoại úp xuống bàn._
_Nó vẫn rung. 48. 49. 50._
_Bạn nhìn bộ đồ hồng trên móc. Hồi 2019, bạn mua nó để không ai nhận ra mình. Giờ ai cũng nhận ra cái ví của mình. Không ai nhận ra mình._
-> END

// ------------------------------------------------------------
// SỰ KIỆN BẤT KỲ LÚC NÀO
// ------------------------------------------------------------

// Độ Lộ Tiền đầy 100: mở ngay kết thúc "Cây ATM Hồng"
=== sieu_nhan_hong_tudo_lo_tien_day ===
# dieu_kien:snh_lo_tien>=100 # bat_buoc
_Sáng nay, ai đó đã ghép đủ các mảnh: vụ trả lương hộ, cái thẻ lạ, tiền đền Hồng Coin, 10 tỷ nói như 10 nghìn. Một bài viết dài 12 trang đang lan khắp mạng._
~ chot_ket_thuc("cay_atm_hong")
-> sieu_nhan_hong_kt_cay_atm_hong

// Độ Lộ Mặt đầy 100: mặt thật bị lộ, theo cách người chơi không chọn được
=== sieu_nhan_hong_tudo_lo_mat ===
# dieu_kien:snh_lo_mat>=100 # bat_buoc
{ snh_da_lo_mat:
    -> END
}
~ snh_da_lo_mat = true
_Paparazzi Mắt Diều Hâu đã rình đủ lâu. Cái cằm ở gameshow, cái gáy ở Vũng Tàu, vết sẹo ở livestream. Sáng nay, anh ta ghép xong._
paparazzi: *(đăng bài)* Một tấm thôi, một tấm! Đây là mặt thật của Siêu Nhân Hồng!
_Ảnh chụp mờ, nghiêng, đúng lúc bạn đang ngáp ở bãi xe. Không phải lúc đẹp nhất. Không phải lúc bạn chọn._
~ follow(RANDOM(50000, 150000))
~ scandal()
hong_hot: *(gọi điện)* Anh ơi… mặt anh lên top rồi. Người ta nói… người ta nói anh nhìn hiền ghê. Có người nói nhìn giống ông chú bán vé số.
quan_ly_idol: *(gọi điện)* Chuyện này để anh lo. Mà… lần này anh không lo được hết. Anh xin lỗi.
_Bạn đứng trước gương. Mặt bình thường. Tóc bình thường. Cả nước vừa thấy cái mặt này. Trời vẫn sáng. Không ai chết._
-> END
