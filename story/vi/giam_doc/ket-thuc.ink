// ============================================================
// GIÁM ĐỐC · SÁU KẾT THÚC
// Đánh giá dựa trên kết quả họp đánh giá 30/10 và con số cuối cùng
// sau Đại Nhạc Hội Siêu Nhân, nên cảnh đánh giá chạy cuối ngày 31/10.
// Thứ tự ưu tiên:
//   1. Còn Mỗi Mình Sếp     (Hứa Lèo ≥ 5 và LL cướp Nguyên)
//   2. Ghế Ai Người Nấy Ngồi (Nguy Cơ Lộ Nợ 100 hoặc Uy Quyền < 20)
//   3. 🔒 Hoa Hướng Dương Lộ Diện (bí mật)
//   4. Thư Hồi Âm
//   5. Doanh Nhân Của Năm (Thật)
//   6. Biệt Thự Có Chủ Mới  (dưới 1 triệu)
//   Còn lại (đủ 1 triệu nhưng mất lòng tin): Ghế Ai Người Nấy Ngồi
// ============================================================

=== giam_doc_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc
{
- gd_hua_leo >= 5 && nguyen_theo_ll:
    ~ chot_ket_thuc("con_moi_minh_sep")
    -> giam_doc_kt_con_moi_minh_sep
- gd_lo_no >= 100 || gd_uy_quyen < 20:
    ~ chot_ket_thuc("ghe_ai_nguoi_nay_ngoi")
    -> giam_doc_kt_ghe_ai_nguoi_nay_ngoi
- gd_dung_clone && gd_cong_khai_hoa && not gd_da_tra_thu && gd_sua_minh >= 5:
    ~ chot_ket_thuc("hoa_huong_duong_lo_dien")
    -> giam_doc_kt_hoa_huong_duong_lo_dien
- gd_doc_thu_g && gd_viet_thu_hoi_am:
    ~ chot_ket_thuc("thu_hoi_am")
    -> giam_doc_kt_thu_hoi_am
- nguoi_theo_doi >= 1000000 && gd_ngan_sach >= 0 && gd_uy_quyen >= 60 && gd_hua_leo == 0:
    ~ chot_ket_thuc("doanh_nhan_cua_nam")
    -> giam_doc_kt_doanh_nhan_cua_nam
- nguoi_theo_doi < 1000000:
    ~ chot_ket_thuc("biet_thu_co_chu_moi")
    -> giam_doc_kt_biet_thu_co_chu_moi
- else:
    ~ chot_ket_thuc("ghe_ai_nguoi_nay_ngoi")
    -> giam_doc_kt_ghe_ai_nguoi_nay_ngoi
}

// Nguy Cơ Lộ Nợ chạm 100 có thể xảy ra bất cứ ngày nào.
=== giam_doc_tudo_lo_no_100 ===
# bat_buoc # dieu_kien:gd_lo_no>=100
_Sáng hôm đó, cả công ty đều đã biết. Ngân hàng gọi tới tận quầy lễ tân. Group Zalo-lô không còn ai nói chuyện khác._
_Bác {bac_bao_ve} đi lên tầng 2, tay cầm một phong bì dán kín. Bác không gõ cửa._
~ chot_ket_thuc("ghe_ai_nguoi_nay_ngoi")
-> giam_doc_kt_ghe_ai_nguoi_nay_ngoi

// ------------------------------------------------------------
// 😄 1. DOANH NHÂN CỦA NĂM (THẬT)
// ------------------------------------------------------------
=== giam_doc_kt_doanh_nhan_cua_nam ===
# ket_thuc:doanh_nhan_cua_nam # loai:co_hau
_Một triệu người theo dõi. Top 10 xu hướng. Pháo giấy hồng rơi đầy sân khấu Đại Nhạc Hội Siêu Nhân, dính cả vào mặt nạ "Ông Kẹ Ngân Hàng" của bạn._
_5 tỷ thưởng về tài khoản lúc 23:47. {ke_toan} nhắn: "Em chuyển trả ngân hàng rồi anh. Hết nợ."_
_Bạn đọc tin đó bốn lần. Lần thứ tư mới tin._
_Sáng 1/11. Ngân hàng Tín Dụng Đen Đủi. Cô nhân viên tín dụng đóng một con dấu đỏ lên tờ giấy thế chấp: "ĐÃ TẤT TOÁN"._
nv_ngan_hang: Dạ chúc mừng anh {giam_doc}. Anh có muốn vay thêm để… mở rộng hông anh?
giam_doc: Thôi em. Anh xin.
_Bạn lái xe về biệt thự số 1, Đồi Ngân Hàng. Cỏ sân golf đã cao tới mắt cá chân. Bạn để nguyên._
_Phòng khách. Bức tường ảnh. Bạn bắt tay ca sĩ. Bạn ôm diễn viên. Bạn chụp với người dẫn chương trình. Năm 2015. Năm 2016. Năm 2017._
_Bạn gỡ bức ảnh to nhất ở chính giữa xuống. Treo vào đó tờ giấy thế chấp có dấu đỏ "ĐÃ TẤT TOÁN"._
_Trong tất cả các tấm ảnh trên tường, đây là tấm duy nhất bạn chụp với chính mình._
{ gd_giu_loi_20:
    _Dưới tờ giấy, bạn dán thêm một mẩu note vàng: "Tăng lương 20%: đã giữ lời."_
}
_Điện thoại rung. Group công ty. Không phải 22 giờ. Là 9 giờ sáng chủ nhật, và người nhắn là {thuc_tap_sinh}: "Dạ chúc mừng anh ạ!"_
_Rồi {chi_dai}: "Chúc mừng sếp. Mai họp ngắn thôi nha."_
_Rồi cả công ty. Hai mươi hai cái "Dạ"._
giam_doc: Anh không ép… *(dừng lại, xóa đi, gõ lại)* Cảm ơn các em.
_Bạn pha một ấm trà, ngồi trước bức tường. Ở góc phải, sát mép khung, có tấm ảnh năm 2010: căn phòng 20 mét vuông, Bác {bac_bao_ve} ngồi ở cửa._
_Người cầm máy ảnh hôm đó chắc cũng đang mỉm cười, ở một nơi rất xa._
-> END

// ------------------------------------------------------------
// 😄 2. THƯ HỒI ÂM
// ------------------------------------------------------------
=== giam_doc_kt_thu_hoi_am ===
# ket_thuc:thu_hoi_am # loai:co_hau
_Một buổi chiều đầu tháng 11. Trời Thành Phố Ước Mơ hửng nắng sau mưa. Bạn ghé chòi bảo vệ, như đã quen._
_Bác {bac_bao_ve} đang rót trà. Trên bàn có một phong bì, nét chữ quen thuộc. Ngoài phong bì ghi: "{bac_bao_ve} đọc cho {giam_doc} nghe."_
bac_bao_ve: Thư về rồi. Người ta dặn bác đọc. Cậu ngồi xuống.
_Bạn ngồi xuống cái ghế nhựa. {cho} chui ra từ gầm bàn, nằm xuống, gác đầu lên giày bạn._
bac_bao_ve: *(đeo kính, đọc chậm)* "{giam_doc}."
bac_bao_ve: "Tôi biết từ năm ngoái rồi. Tôi chờ cậu nói."
_Bác dừng lại. Uống một ngụm trà. Bạn không thở._
bac_bao_ve: "Nợ thì mình trả cùng nhau."
bac_bao_ve: "Việc hôm nay cứ để ngày mai tính, trừ chuyện thật lòng."
bac_bao_ve: "— G."
_Bác gấp lá thư lại, đặt vào tay bạn. Tay bác thô và ấm._
bac_bao_ve: Người ta tin cậu. Từ đầu. Chỉ là người ta muốn cậu tin người ta.
_Bạn cúi mặt vào ly trà đá. Đá tan rất nhanh. Có lẽ không phải vì trời nóng._
giam_doc: Bác ơi… cái slogan ấy. Hóa ra là câu đùa thật ạ?
bac_bao_ve: Ừ. Nửa câu sau người ta chưa kịp nói thì cậu đã in lên tường rồi.
_Hai người cùng cười. {cho} ngẩng đầu lên nhìn, rồi lại gác xuống giày bạn, thở dài một tiếng rất chó._
_Tối đó, bạn mở một tờ giấy trắng. Không phải để giao việc lúc 22 giờ. Bạn viết lá thư thứ hai cho Genta. Lần này, chỉ kể chuyện công ty: ai vừa được gia hạn hợp đồng, ai vừa dựng xong một video có con cú, ai mới học được cách làm việc sớm._
_Cuối thư, bạn viết: "Mấy đứa nhỏ vẫn thương nhau anh ạ. — {giam_doc}."_
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 HOA HƯỚNG DƯƠNG LỘ DIỆN (bí mật)
// ------------------------------------------------------------
=== giam_doc_kt_hoa_huong_duong_lo_dien ===
# ket_thuc:hoa_huong_duong_lo_dien # loai:co_hau # bi_mat
_Ngày 30/10, 7 giờ 31 phút. Tin nhắn của "Hoa Hướng Dương 1989" vẫn nằm đó, cuối group "Hội Anti Sếp": "Hoa Hướng Dương 1989 là anh đây. Cảm ơn các em đã chửi anh đúng."_
_Ba phút. Không ai gõ gì._
_Bạn ngồi trong xe ở bãi đỗ công ty, không dám bước vào thang máy._
_Phút thứ tư. {hong_hot} gõ: "Vậy là… mấy tháng nay sếp đọc hết hả?"_
_Phút thứ năm. {designer}: "Vậy là… sếp hông bắt sửa logo lần 38 là vì đọc group hả?"_
_Phút thứ sáu. {thuc_tap_sinh}: "Dạ… vậy là anh bỏ nhắn tin lúc 10 giờ đêm là vì em xin hả anh?"_
_Phút thứ bảy. {chi_dai}: "Tui biết từ lâu rồi. Bông hoa không bao giờ chửi sếp mà ai cũng chửi thì bông hoa là sếp."_
hong_hot: Ủa bà biết sao hông nói?!
chi_dai: Tại thấy sếp đang sửa. Để yên cho sếp sửa.
_Phút thứ mười. Group im lặng thêm một lần nữa._
_Rồi một thông báo: "{hong_hot} đã đổi tên nhóm thành: Hội Thương Sếp (Một Chút)"._
_Rồi một thông báo nữa: "{hong_hot} đã chỉ định Hoa Hướng Dương 1989 làm phó admin."_
hong_hot: Sếp làm phó admin. Admin vẫn là em nha. Mà sếp có quyền xóa tin nhắn chửi sếp. Nhưng sếp hông được xóa.
ran_doc: Tui chỉ nói sự thật thôi mà… mà sếp cũng được.
_Bạn cười một mình trong xe. Cười tới mức bác {bac_bao_ve} gõ cửa kính hỏi "Cậu có sao không?"._
_Bạn gõ tin nhắn đầu tiên với tư cách phó admin. Gõ dài. Xóa. Gõ "Anh không ép…". Xóa._
_Cuối cùng, bạn gửi một sticker: bông hoa hướng dương cúi chào._
_Hai mươi người thả tim. Một người thả haha. Là {chua_te_deadline}. Có lẽ chỉ vì nó buồn cười thật._
-> END

// ------------------------------------------------------------
// 😢 4. BIỆT THỰ CÓ CHỦ MỚI
// ------------------------------------------------------------
=== giam_doc_kt_biet_thu_co_chu_moi ===
# ket_thuc:biet_thu_co_chu_moi # loai:buon
_Đại Nhạc Hội Siêu Nhân kết thúc ở con số {nguoi_theo_doi}. Không đủ một triệu. Không vào top 10._
_Trang 47 có hiệu lực. Mười tỷ. {ke_toan} gửi bạn bảng tính lúc 1 giờ sáng, không kèm một chữ nào._
_Ngày 15/11. Ngân hàng Tín Dụng Đen Đủi dán một tờ thông báo lên cổng sắt biệt thự số 1, Đồi Ngân Hàng. Băng keo trong, bốn góc, rất ngay ngắn._
_Bạn đi một vòng trong nhà lần cuối. Sân golf mini cỏ mọc tới đầu gối. Bàn ăn 10 ghế. Bức tường ảnh._
_Bạn gỡ từng tấm ảnh chụp với người nổi tiếng, xếp vào một thùng carton. Ca sĩ. Diễn viên. MC. Năm 2015. Năm 2016._
_Tấm cuối cùng ở góc tường: căn phòng 20 mét vuông năm 2010. Bạn để nó nằm trên cùng._
_Bạn đặt Grab. "Tài xế đang tới." Rồi: "Em xin lỗi, xe em bể bánh."_
_Chuyến bị hủy._
_Bạn xách thùng carton đi bộ xuống đồi. Thùng nặng hơn bạn nghĩ. Ảnh của người nổi tiếng thì ra cũng nặng._
giam_doc: Anh không ép… tùy em…
_Không ai nghe. Câu đó lần đầu tiên không có ai để nói._
_Giữa dốc, một chiếc xe máy cũ dừng lại. Bác {bac_bao_ve}. {cho} ngồi trong giỏ xe, đầu đội cái nón bảo hiểm trẻ con._
bac_bao_ve: Lên đi. Thùng để đằng trước.
giam_doc: Bác… sao bác biết cháu ở đây?
bac_bao_ve: Bác không biết gì đâu. Bác đi ngang.
_Đồi Ngân Hàng cách chòi bảo vệ 40 phút. Không ai "đi ngang" cả._
_Bạn ngồi sau xe Bác {bac_bao_ve}, ôm thùng ảnh. {cho} quay lại liếm tay bạn một cái. Chiếc xe chạy chậm, rất chậm, xuống con dốc dài._
-> END

// ------------------------------------------------------------
// 😢 5. GHẾ AI NGƯỜI NẤY NGỒI
// ------------------------------------------------------------
=== giam_doc_kt_ghe_ai_nguoi_nay_ngoi ===
# ket_thuc:ghe_ai_nguoi_nay_ngoi # loai:buon
{ gd_pho_giam_doc == "":
    ~ gd_pho_giam_doc = "truong_phong"
}
_Phòng họp "Sáng Tạo". Cả công ty ngồi kín. Bác {bac_bao_ve} đứng ở đầu bàn, chỗ bạn vẫn đứng phát biểu mỗi thứ Hai._
_Trên tay bác là phong bì dán kín, ngoài ghi: "Chỉ mở khi công ty sắp sập"._
{ gd_lo_no >= 100:
    bac_bao_ve: Cả công ty biết chuyện nợ rồi. Ngân hàng gọi tới quầy lễ tân. Thế là đủ rồi.
- else:
    bac_bao_ve: Công ty còn tiền. Nhưng người trong công ty hết tin nhau rồi. Bác nghĩ… sập kiểu đấy cũng là sập.
}
_Bác xé phong bì. Tiếng giấy rách nghe rõ trong phòng im lặng._
bac_bao_ve: *(đọc chậm)* "Quyết định của người sáng lập. Giao quyền điều hành tạm thời cho người vừa được bầu làm Phó Giám đốc. Giữ {giam_doc} lại, chức danh: Cố vấn Văn hóa Doanh nghiệp. Nó nói về văn hóa nhiều, để nó làm cái nó thích. — G."
_Mọi ánh mắt quay sang {ten(gd_pho_giam_doc)}. Rồi quay sang bạn._
_Bạn gật đầu. Bạn không nói "Anh không ép, tùy em". Lần này không có gì để tùy._
_Sáng thứ Hai tuần sau. 8:30. Bạn ngồi ở ghế cuối phòng họp, cạnh cửa sổ. Lần đầu tiên bạn thấy phòng họp từ góc này. Nó rộng hơn bạn tưởng._
{ gd_pho_giam_doc:
- "truong_phong":
    truong_phong: Vâng. Họp nhanh 5 phút thôi nhé.
    _Và lần đầu tiên, cuộc họp kéo dài đúng 5 phút. {truong_phong} nhìn đồng hồ, tự ngạc nhiên._
- "chi_dai":
    chi_dai: Họp 10 phút. Ai nói dài, tui cắt.
- "ke_toan":
    ke_toan: Họp nhanh. Trước khi họp, ai có hóa đơn tuần trước thì nộp lên đây.
- "con_ong_chau_cha":
    con_ong_chau_cha: Ờm… chill nha mọi người. Ai có ý gì cứ nói. Con… à em nghe.
- else:
    _Người mới đứng đầu bàn hắng giọng, rồi mở đầu rất ngắn._
}
_Bạn mở cuốn sổ, cầm bút. Lặng lẽ ghi chép. Cố vấn Văn hóa Doanh nghiệp ghi dòng đầu tiên:_
_"Họp ngắn. Mọi người có vẻ vui hơn."_
_Bạn gạch dòng đó đi. Rồi viết lại, nắn nót hơn._
-> END

// ------------------------------------------------------------
// 😢 6. CÒN MỖI MÌNH SẾP
// ------------------------------------------------------------
=== giam_doc_kt_con_moi_minh_sep ===
# ket_thuc:con_moi_minh_sep # loai:buon
_Đêm 31/10. Văn phòng tầng 2. Đèn tắt hết, chỉ còn đèn bàn phòng giám đốc._
_Bạn ngồi một mình. Ghế của {thanh_ninh} trống. Bàn của {hong_hot} trống, ring light đã tháo đi. Phòng kế toán khóa._
_Mỗi ngày từ 26/10, có một người nộp đơn. Lời hứa nào của bạn cũng là một tờ đơn._
_Qua vách kính, phía bên kia thành phố, tòa nhà xanh lá chuối của LL-Entertainment bắn pháo hoa Đại Nhạc Hội Siêu Nhân. Màu hồng. Rồi màu xanh. Rồi màu hồng._
_Trên màn hình lớn của tòa nhà kia, {sieu_nhan_hong} đang tạo dáng. Bên dưới là dòng chữ "LL Presents"._
_Bạn mở group Zalo-lô "{cong_ty} - Toàn công ty". Thành viên: 2._
_{giam_doc}. Và Bác {bac_bao_ve}._
_Đồng hồ trên máy tính nhảy sang 22:00. Ngón tay bạn tự gõ, theo thói quen mười năm:_
giam_doc: Mai các em đi làm nhé.
_Gửi._
_Không ai "đã xem". Bác {bac_bao_ve} đã ngủ từ 9 giờ._
_Bạn ngồi nhìn tin nhắn của mình. Một dấu tích xám._
_Dưới cổng, {cho} sủa một tiếng về phía pháo hoa. Rồi im._
{ gd_co_lich_ngan_hang:
    _Ở góc bàn có cuốn lịch ngân hàng, tờ tháng 10: "Tiết kiệm hôm nay, an nhàn ngày mai". Bạn lật sang tháng 11. Tờ tháng 11 trắng trơn._
- else:
    _Bạn tắt đèn bàn. Văn phòng tối hẳn. Chỉ còn pháo hoa xanh lá chuối hắt qua vách kính, rồi tắt._
}
-> END
