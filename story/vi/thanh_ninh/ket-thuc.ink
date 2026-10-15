// ============================================================
// THÁNH NỊNH: NHI · SÁU KẾT THÚC
// Thứ tự ưu tiên: bí mật → buồn có điều kiện cứng → có hậu → buồn mặc định
// ============================================================

=== thanh_ninh_3010_danh_gia ===
# ngay:31 # gio:21:30 # bat_buoc # dieu_kien:sau_dem_hong
// 3. 🔒 Kết thúc bí mật: Lời Thật Đầu Tiên
{ tn_noi_that_1 && tn_noi_that_2 && tn_hoc_nghe_chi_dai && tn_tu_choi_ll && tn_gian_chi_dai <= 20 && tn_khuyen_viet_thu_genta:
    ~ chot_ket_thuc("loi_that_dau_tien")
    -> thanh_ninh_kt_loi_that_dau_tien
}
// 5. 🐍 Hai Mang
{ tn_xanh_la_chuoi >= 80 && (tn_bi_lo_hai_mang || nguyen_theo_ll):
    ~ chot_ket_thuc("hai_mang")
    -> thanh_ninh_kt_hai_mang
}
// 4. 📧 Email Gửi Nhầm
{ tn_email_gui_nham && not tn_noi_that_2:
    ~ chot_ket_thuc("email_gui_nham")
    -> thanh_ninh_kt_email_gui_nham
}
// 1. 🫱 Cánh Tay Phải Chính Thức
{ tn_diem_ninh >= 80 && tn_xanh_la_chuoi < 30 && tn_sep_goi_nhi > tn_sep_goi_hieu && nguoi_theo_doi >= 500000:
    ~ chot_ket_thuc("canh_tay_phai")
    -> thanh_ninh_kt_canh_tay_phai
}
// 2. 🟢 Nhảy Đúng Lúc
{ tn_nhan_viec_ll && not tn_mang_theo_bi_mat && tn_don_nghi_viec:
    ~ chot_ket_thuc("nhay_dung_luc")
    -> thanh_ninh_kt_nhay_dung_luc
}
// 6. 🪞 Hết Người Để Nịnh (mặc định)
~ chot_ket_thuc("het_nguoi_de_ninh")
-> thanh_ninh_kt_het_nguoi_de_ninh

// ------------------------------------------------------------
// 😄 🫱 CÁNH TAY PHẢI CHÍNH THỨC
// ------------------------------------------------------------
=== thanh_ninh_kt_canh_tay_phai ===
# dieu_kien:ket_thuc_canh_tay_phai
_Ngày 30/10, sau buổi họp đánh giá._
_Bạn quay về bàn trợ lý thì thấy {bac_bao_ve} và {thuc_tap_sinh} đang khiêng một tấm biển mica, che bằng tờ giấy báo._
thuc_tap_sinh: Dạ chị đứng xích qua giùm em ạ. Sếp dặn bắt vít cho thẳng ạ.
_Tờ giấy báo rơi xuống. Tấm biển ghi: "CHÁNH VĂN PHÒNG – {thanh_ninh}"._
giam_doc: *(đứng ở cửa phòng kính, tay đút túi quần)* Lương tăng 20%. Lần này anh hứa lúc tỉnh.
_Cả tầng 2 vỗ tay. {chi_dai} vỗ chậm, nhưng vỗ. {ran_doc} vỗ nhanh, nhưng mắt không cười._
* [🙇 "Dạ anh quyết định chuẩn quá anh ơi!"]
    giam_doc: Câu đấy em nói cả nghìn lần rồi. Lần này anh tin.
* [😢 Không nói được câu nào. Chỉ cúi đầu.]
    giam_doc: Ừ. Không cần nói gì. Ba năm em nói đủ rồi.
- _Đêm 31/10, Đêm Hồng. Con số trên màn hình lớn nhảy liên tục. Bạn đứng cạnh sếp, cầm ô, cầm nước, cầm điện thoại. Nhưng lần này sếp cầm hộ bạn cái ô._
_Sáng 1/11. 7 giờ 45. Bạn tới trước sếp như mọi ngày, bưng khay trà vào phòng kính._
_Sếp đã ngồi đó. Trên bàn có hai ly trà, một ly đã rót sẵn._
_Lần đầu tiên, sếp đứng dậy rót cho bạn trước._
giam_doc: Anh pha có chuẩn không em?
_Bạn uống một ngụm. Trà sen. Nước quá sôi, lá quá nhiều, đường không có._
thanh_ninh: Dạ… hơi đắng anh.
_Sếp nhìn bạn. Rồi cả hai cùng bật cười. Tiếng cười vang ra tới tận cầu thang, nơi {cho} đang nằm, vểnh tai lên nghe._
_Đó là câu khen thật lòng nhất bạn từng nói. Vì nó không phải là một câu khen._
-> END

// ------------------------------------------------------------
// 😄 🟢 NHẢY ĐÚNG LÚC
// ------------------------------------------------------------
=== thanh_ninh_kt_nhay_dung_luc ===
# dieu_kien:ket_thuc_nhay_dung_luc
_Ngày 30/10. Bạn dọn bàn trợ lý. Ba năm gói vừa trong một thùng carton: một cái bình trà sen, một cuốn sổ tay "Sếp thích nghe gì vào thứ mấy", và tấm ảnh chụp chung với sếp._
_Bạn cầm cuốn sổ tay, lật vài trang. Rồi đặt nó lên bàn trợ lý, để lại cho người sau._
chi_dai: *(đi ngang, dừng lại)* Đi hả.
thanh_ninh: Dạ. Em đi đàng hoàng, chị.
chi_dai: Ờ. Đàng hoàng là được.
_{chi_dai} vỗ vai bạn đúng một cái. Mạnh. Đau. Bạn thấy vui lạ lùng._
_Ngày 2/11. Tòa nhà kính 20 tầng ở Ven Đô. Thẻ nhân viên LL màu xanh lá chuối, chức danh "Trợ lý Hành chính". Lương gấp đôi. Không có chữ "cộng tác đặc biệt"._
_Ở LL không ai hỏi bạn về hộp thư của ai. Bạn cũng không mang theo cái gì để kể._
_Trên bàn làm việc mới có một tấm thiệp viết tay. Nét chữ nghiêng, quen tới mức bạn nhận ra từ ba mét._
_"Đi vui nhé. Anh không ép, tùy em. – {giam_doc}"_
_Lần đầu tiên câu đó có nghĩa đúng như chữ của nó._
_Giờ nghỉ trưa. Bạn đi bộ xuống tiệm trà sữa dưới tòa nhà. Gọi một ly: ít đường, nhiều trân châu đen. Ly của sếp. Bạn đổi ý: nhiều đường, thêm thạch._
_Bạn ngồi bên cửa sổ, uống chậm. Không có ai để khen. Không có ai cần mình khen để được uống._
_Ly trà sữa ngọt. Ngọt thật, không phải ngọt kiểu đường hóa học._
_Bên kia đường lớn, rất xa, tòa nhà tím của {cong_ty} vẫn sáng đèn tầng 2. Bạn giơ ly trà sữa lên, chúc nó một câu, rất nhỏ, không ai nghe._
-> END

// ------------------------------------------------------------
// 😄 🔒 LỜI THẬT ĐẦU TIÊN (bí mật)
// ------------------------------------------------------------
=== thanh_ninh_kt_loi_that_dau_tien ===
# dieu_kien:ket_thuc_loi_that_dau_tien
_Đêm Hồng, 31/10. 19 giờ 20. Hậu trường. MC của đêm diễn gọi điện báo kẹt xe ở Đại lộ Kẹt Xe, chưa biết mấy giờ tới._
_{chi_dai} cầm bộ đàm, nhìn quanh, rồi nhìn bạn._
chi_dai: Nhi. *(dúi micro vào tay bạn)* MC đêm nay là em.
thanh_ninh: Chị… em chỉ biết khen thôi chị.
chi_dai: Thì đêm nay đừng khen. Kể. Ai làm gì, kể đúng như vậy. Em biết hết mà.
_Đèn sân khấu bật. Một nghìn khán giả. Ba cái máy quay. {hong_hot} giơ ba điện thoại._
_Bạn bước ra. Bạn không khen ai cả._
thanh_ninh: Xin chào. Tối nay tôi giới thiệu những người đã làm nên đêm này.
thanh_ninh: Anh {editor}, người dựng mọi video bạn từng xem của chúng tôi, thường lúc 3 giờ sáng.
thanh_ninh: Chị {ke_toan}, người đọc kỹ từng trang hợp đồng, kể cả những trang không ai đọc.
thanh_ninh: Anh {thuc_tap_sinh}, thực tập sinh 30 tuổi, người photo mọi tờ giấy trong tòa nhà và chưa từng than một câu.
thanh_ninh: Bác {bac_bao_ve}, người giữ cổng mười sáu năm. Và chị {chi_dai}, người dựng sân khấu này bằng hai cái máy phát điện, vì cái thứ nhất sẽ hỏng.
_Khán đài cười. Rồi vỗ tay. Không phải vỗ tay xã giao. Vỗ tay thật._
_Cuối cùng bạn giới thiệu sếp. Bạn chỉ nói một câu: "Anh {giam_doc}, người ở lại tới cuối, kể cả những đêm không ai thấy."_
_Dưới khán đài, sếp vỗ tay to nhất. Sếp không cần ai khen. Lần đầu tiên, sếp được ai đó nói đúng._
_Trong túi áo sếp có một lá thư viết tay đã gửi đi từ hôm qua. Gửi anh Genta. Kể hết. Người khuyên sếp viết lá thư đó đang cầm micro trên sân khấu._
_Ở góc hậu trường, {chi_dai} khoanh tay, nói nhỏ với {ke_toan}:_
chi_dai: Con nhỏ này được.
_{ke_toan} gật. Bạn không nghe thấy câu đó. Nhưng đêm nay, lần đầu tiên, bạn không cần nghe ai khen mình nữa._
-> END

// ------------------------------------------------------------
// 😢 📧 EMAIL GỬI NHẦM
// ------------------------------------------------------------
=== thanh_ninh_kt_email_gui_nham ===
# dieu_kien:ket_thuc_email_gui_nham
_Sáng 30/10. 7 giờ 45. Bạn tới trước sếp như mọi ngày. Bình trà sen nóng hổi._
_{hr} đứng cạnh máy chấm công, mỉm cười._
hr: Nhi à. Em rảnh không, lên phòng anh uống trà xíu.
_Trà Ô Long. Loại sếp thích. {hr} rót cho bạn một ly. Không ai nhắc tới email "Em đồng ý về LL ạ". Không cần nhắc. Nó đã được in ra, nằm trong tập hồ sơ màu hồng trên bàn._
hr: Mình cùng nhìn lại hành trình nha em.
_Hành trình kéo dài 12 phút. Ba năm, mười hai phút._
_Bạn ôm thùng carton xuống cầu thang. Trên cùng là tấm ảnh chụp chung với sếp, phóng to, đóng khung. Nó to quá, che mất nửa mặt bạn._
_Cửa phòng kính tầng 2 đóng. Bạn không biết sếp có ở trong đó không. Bạn không quay lại để biết._
_Ở pantry, không ai ngẩng lên. {hong_hot} cầm điện thoại, rồi úp xuống. Lần đầu tiên {hong_hot} không đăng gì._
_Đi ngang chòi bảo vệ. Bác {bac_bao_ve} đang uống trà đá, không nhìn bạn._
bac_bao_ve: Bác không thấy gì đâu.
_Câu đó bác nói với tất cả mọi người, ba năm nay. Hôm nay bạn mới hiểu nó là một lời tử tế._
_{cho} nằm trước chòi. Nó nhìn bạn ôm thùng carton đi qua._
_{cho} không sủa._
_Thế mới buồn._
_Đêm 31/10, Đêm Hồng. Bạn xem livestream trên điện thoại, ngồi trên bậc thềm căn 302. Camera lia qua sếp. Bên cạnh sếp, chỗ bạn vẫn đứng, giờ là {ran_doc}, cầm ô._
-> END

// ------------------------------------------------------------
// 😢 🐍 HAI MANG
// ------------------------------------------------------------
=== thanh_ninh_kt_hai_mang ===
# dieu_kien:ket_thuc_hai_mang
{ nguyen_theo_ll:
    _Ngày 30/10. Siêu Nhân Hồng chính thức ký với LL. Trong buổi họp báo, Lưu Lực cảm ơn "những người bạn bên kia đường đã giúp đỡ". Ông ta không nhìn về phía bạn._
    _Chiều đó, thư ký LL nhắn: "Cảm ơn em đã hợp tác 💚 Dự án đã kết thúc, LL xin phép dừng cộng tác."_
    _LL đã có thứ họ cần. Họ không cần cái hộp thư nữa. Không cần bạn nữa._
- else:
    _Ngày 30/10. {it} gửi sếp một bản log: hộp thư của giám đốc, đăng nhập lúc 23:12 từ máy "LL-GUEST", ngay sau một lần đăng nhập từ "NHI-IPHONE". Kèm ảnh chụp màn hình tin nhắn màu xanh lá chuối._
    _Sếp đọc. Sếp không gọi bạn lên. Sếp nhờ {hr}._
    _Cùng ngày, LL gửi email cho bạn: "Người đã bị lộ thì không còn giá trị cộng tác. Chúc em may mắn 💚"._
}
_Thẻ từ của {cong_ty}: bị khóa. Thẻ khách của LL: bị khóa._
_Đêm 31/10. Bạn đứng giữa đường lớn khu Ven Đô._
_Một bên là tòa nhà kính 20 tầng màu xanh lá chuối, đèn sáng choang, slogan chạy chữ "Việc hôm nay phải xong từ hôm qua"._
_Phía xa là tòa nhà 3 tầng màu tím của {cong_ty}. Đêm nay vắng, cả công ty đang ở Đêm Hồng. Chỉ chòi bảo vệ còn sáng một ngọn đèn._
_Bạn mở danh bạ. Lướt từ A tới Z._
_"Anh {giam_doc}". Không được nữa._
_"Anh Lực". Chưa bao giờ được._
_"Chị {chi_dai}". Chị đã nói: đi thì đi cho đàng hoàng._
_Bạn lướt lên. Lướt xuống. Mỗi cái tên là một câu khen bạn đã từng nói, và không câu nào còn dùng được._
_Xe cộ chạy qua hai bên. Không ai bấm còi gọi bạn. Bạn không biết nên nịnh ai._
-> END

// ------------------------------------------------------------
// 😢 🪞 HẾT NGƯỜI ĐỂ NỊNH
// ------------------------------------------------------------
=== thanh_ninh_kt_het_nguoi_de_ninh ===
# dieu_kien:ket_thuc_het_nguoi_de_ninh
{ nguoi_theo_doi < 1000000:
    _Đêm Hồng kết thúc lúc 22 giờ. Con số dừng lại ở {nguoi_theo_doi}. Không đủ._
    _Sếp đứng dưới khán đài trong bộ đồ "Ông Kẹ Ngân Hàng", nhìn con số rất lâu. Rồi tháo cà vạt in hình tờ tiền ra, gấp gọn, bỏ vào túi._
    giam_doc: Nhi về đi em. Mai… không cần tới sớm đâu.
    _Mười tỷ. Trang 47. Bạn biết từ đầu. Bạn đã biết mọi thứ từ đầu, và đã dùng nó để giữ ghế của mình._
- else:
    _Đêm Hồng thành công. Con số nhảy qua một triệu. Cả công ty ôm nhau._
    _Sếp ôm {ran_doc} trước. Rồi {chi_dai}. Rồi {ke_toan}. Bạn đứng cạnh, cầm ô, chờ. Lượt của bạn đến sau cùng, và ngắn nhất._
    _Sáng thứ 2, bàn trợ lý có một cái ghế nữa. {ran_doc} ngồi đó. Sếp gọi tên {ran_doc} trước, mỗi sáng._
}
_Căn 302, Phố Mới. Đêm 31/10. Ngoài đường có tiếng trẻ con hóa trang đi xin kẹo._
_Tấm ảnh chụp chung với sếp vẫn trên tường. Bạn tháo nó xuống, dựng vào góc. Tường trống một mảng, sáng màu hơn chỗ khác._
_Bạn đứng trước gương. Tập, như mọi đêm._
thanh_ninh: Chị nói chuẩn quá chị ơi.
_Gương không trả lời._
thanh_ninh: Anh nói chuẩn quá anh ơi.
_Gương vẫn không trả lời._
thanh_ninh: … Em nói chuẩn quá em ơi.
_Trong gương chỉ có một người. Mắt hơi sưng, son "Hồng Thái Độ" lem một bên._
_Và không ai cần được khen._
-> END
