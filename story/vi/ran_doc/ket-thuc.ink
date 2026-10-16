// ============================================================
// SÁU KẾT THÚC CỦA RẮN ĐỘC
// Tên cảnh đánh giá giữ "3010" theo quy ước (kết thúc được quyết
// định trong ngày phán xét), nhưng cảnh chạy sau Đại Nhạc Hội Siêu Nhân 31/10
// để tính cả lựa chọn trong đêm diễn.
// ============================================================

=== ran_doc_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # danh_gia_ket_thuc
// Chạy sau chung_3110_dem_hong: ket_thuc_su_nghiep và chung_cong_ty_song đã có.
// 1. Bị Lật Tẩy: Độ Nghi Ngờ đầy
{ rd_nghi_ngo >= 100:
    ~ chot_ket_thuc("bi_lat_tay")
    -> ran_doc_kt_bi_lat_tay
}
// 2. Bí mật: 30 Ngày Làm Rắn (lật mặt con rắn kia, gom đủ tin mật, không tung tin nào từ 28/10)
{ rd_lat_mat_ran_hai && rd_so_tin_mat >= 25 && rd_ngay_tung_tin_cuoi < 28:
    ~ chot_ket_thuc("30_ngay_lam_ran")
    -> ran_doc_kt_30_ngay_lam_ran
}
// 3. Hiếu Ếch Tha Thứ
{ rd_mo_nhanh_hieu_ech && rd_moi_han < 30 && rd_so_lan_giup >= 3:
    ~ chot_ket_thuc("hieu_ech_tha_thu")
    -> ran_doc_kt_hieu_ech_tha_thu
}
// 4. Trùm Cuối
{ rd_do_doc >= 70 && rd_nghi_ngo < 70 && rd_loai_nhat && rd_loai_long && rd_biet_ran_hai:
    ~ chot_ket_thuc("trum_cuoi")
    -> ran_doc_kt_trum_cuoi
}
// 5. Trả Thù Thành Công: hận còn sâu và công ty thật sự sập (hoặc Nguyên đã sang LL)
{ rd_moi_han >= 60 && not chung_cong_ty_song:
    ~ chot_ket_thuc("tra_thu_thanh_cong")
    -> ran_doc_kt_tra_thu_thanh_cong
}
// 6. Rắn Cắn Rắn: không lật được mặt con rắn kia
{ not rd_lat_mat_ran_hai:
    ~ chot_ket_thuc("ran_can_ran")
    -> ran_doc_kt_ran_can_ran
}
// Còn lại: đã lật mặt con rắn kia nhưng không khớp kết thúc nào ở trên
{ rd_nghi_ngo >= 80:
    ~ chot_ket_thuc("bi_lat_tay")
    -> ran_doc_kt_bi_lat_tay
}
~ chot_ket_thuc("hieu_ech_tha_thu")
-> ran_doc_kt_hieu_ech_tha_thu

// ------------------------------------------------------------
// 😄 👑 TRÙM CUỐI
// ------------------------------------------------------------
=== ran_doc_kt_trum_cuoi ===
# ket_thuc:trum_cuoi # loai:co_hau
_Một tuần sau Đại Nhạc Hội Siêu Nhân. Tầng 2, phòng kính mới cạnh phòng giám đốc. Trên cửa dán tấm bảng: "PHÓ GIÁM ĐỐC"._
_Tấm bảng in tên bạn. {designer} thiết kế. Sửa đúng một lần. Bạn chọn bản đầu tiên._
{ chung_cong_ty_song:
    _Ngoài kia, công ty vẫn chạy. { ket_thuc_su_nghiep == "sieu_sao_hang_a": Tiền thưởng về, hợp đồng 3 năm đã ký. | Phụ lục gia hạn tới Tết đã ký. } Chỉ là không ai còn nói chuyện với ai._
- else:
    _Ngoài kia, {ke_toan} đang đóng thùng hồ sơ thanh lý. Bạn là phó giám đốc của một công ty còn đúng một tháng để đóng cửa. Không ai tranh cái ghế này với bạn nữa. Không ai còn muốn ngồi ghế nào._
}
_{truong_phong} họp một mình trong phòng "Sáng Tạo", nói với cái bảng trắng. {con_ong_chau_cha} chuyển về ngồi ở quán cà phê Sống Ảo, lần này là thật._
_{hong_hot} nhìn bạn qua vách kính, rồi cúi xuống, nhắn gì đó vào điện thoại. Bạn không biết là nhắn cho ai. Lần đầu tiên bạn không biết._
giam_doc: *(gõ cửa)* {ran_doc}, em ổn định chưa? Anh không ép, nhưng chiều nay em chủ trì giao ban nhé.
giam_doc: Anh tin em. Em là người duy nhất trong tháng này không dính vào chuyện gì.
_Bạn cười. Ngọt như đường hóa học._
_Trên bàn có một ly trà sữa. Không ai đặt. Bạn đặt cho chính mình. 50% đường. Ít đá. Không ai nhớ bạn uống gì._
_Ở cổng, {cho} nằm trong ổ, nhìn lên tầng 2. Không sủa. Cũng không vẫy đuôi._
_Bạn mở laptop. Mở group Zola công ty. 23 thành viên. Bạn là admin._
_Con trỏ nhấp nháy trong ô chat. Bạn gõ:_
_"Nghe gì chưa?"_
_Bấm gửi. 22 người "đã xem" trong 3 giây._
_Không ai trả lời._
-> END

// ------------------------------------------------------------
// 😄 🤝 HIẾU ẾCH THA THỨ
// ------------------------------------------------------------
=== ran_doc_kt_hieu_ech_tha_thu ===
# ket_thuc:hieu_ech_tha_thu # loai:co_hau
{ nguyen_theo_ll:
    _Gần nửa đêm 31/10. Quán trà đá đầu Hẻm 69. Bên kia thành phố, màn hình LED của LL vẫn còn sáng._
    _Một người ngồi xuống ghế đối diện. Bộ đồ hồng viền xanh lá chuối đã cởi ra, gấp gọn trong túi ni lông._
    sieu_nhan_hong: *(rất nhỏ)* Anh đi rồi mới biết… bên đó hông ai hỏi anh ăn chè gì.
    sieu_nhan_hong: Anh nhốt em trong nhà kho. Giờ anh tự nhốt mình trong tòa nhà kính. Anh xin lỗi em, {ran_doc}. Lần cuối, cho đàng hoàng.
    _Bạn rót cho hắn một ly trà đá. Ông Ba quạt mo. Bạn nói: "Tui tha cho ông rồi." Lần này không có micro. Không ai vỗ tay. Vậy mà nhẹ._
    -> ran_doc_kt_hieu_ech_tha_thu_cuoi
}
_Đại Nhạc Hội Siêu Nhân, 22:47. Pháo hoa vừa tắt. Sân khấu còn khói hồng. Khán giả chưa chịu về._
{ rd_len_san_khau:
    sieu_nhan_hong: *(micro)* Anh muốn mời một người lên sân khấu. Người đó tên là {ran_doc}.
    _Bạn bước lên. Chân run. Đèn chói tới mức không thấy khán giả, chỉ thấy bộ đồ hồng trước mặt. Chiếc mũ đã tháo từ giữa bài hát, giờ nằm dưới chân hắn._
    sieu_nhan_hong: Hai mươi năm trước, ở xóm Cây Me, anh giật kem của em. Anh gọi em là {ran_doc} Ếch.
    sieu_nhan_hong: Anh nhốt em trong nhà kho cả buổi chiều. Anh sợ quá nên không dám quay lại mở cửa.
    sieu_nhan_hong: Anh đi giúp người suốt mấy năm nay, mà người anh cần xin lỗi nhất thì anh không tìm được.
    sieu_nhan_hong: Giờ anh tìm được rồi. Anh xin lỗi em.
    _Hắn cúi đầu. Cả khán đài im phăng phắc. Chỉ có tiếng {cho} sủa một tiếng ở đâu đó dưới sân khấu._
    _Bạn cầm lấy micro. Tay vẫn run._
    _"Tui chỉ nói sự thật thôi mà…"_
    _Bạn ngừng một chút. Nhìn cái mũ hồng nằm dưới sàn sân khấu._
    _"…Tui tha cho ông rồi."_
    _Cả khán đài vỗ tay. {hong_hot} khóc như mưa trên livestream. {chi_dai} vỗ tay to nhất, mắt đỏ mà vẫn gắt: "Đứa nào nhìn chị là chị xử."_
- else:
    _Bạn không lên sân khấu. Hết show, bạn ra sau cánh gà, ngồi trên thùng loa. Hắn tới ngồi cạnh, mồ hôi ướt cả bộ đồ hồng._
    { not rd_mo_nhanh_hieu_ech:
        sieu_nhan_hong: Cái lỗ thông gió… hình con cá. Lúc đứng trên sân khấu anh nhìn thấy em ở hàng cuối, tự nhiên anh nhớ ra. Là em. Đúng hông?
    }
    sieu_nhan_hong: Anh nhốt em trong nhà kho. Anh sợ quá nên không dám quay lại mở cửa. Anh xin lỗi em.
    _Không micro. Không máy quay. Chỉ có {cho} nằm dưới chân hai người, gặm một miếng pháo giấy._
    _"…Tui tha cho ông rồi."_
}
-> ran_doc_kt_hieu_ech_tha_thu_cuoi

= ran_doc_kt_hieu_ech_tha_thu_cuoi
{ chung_cong_ty_song:
    _Sáng thứ 2, {cong_ty} vẫn mở cửa. Bạn vẫn có bàn làm việc. Bản tin nội bộ số mới có một mục mới: "Chuyện xóm cũ"._
- else:
    _Sáng thứ 2, {ke_toan} bắt đầu đóng thùng hồ sơ. Công ty không qua được tháng 11. Bạn mất việc như mọi người. Lạ là bạn không thấy mất gì._
}
_Bác {bac_bao_ve} đứng ở cổng, không vỗ tay, chỉ gật đầu. Thế là đủ._
_Tối đó, bạn mở cuốn sổ tay. Trang đầu tiên: con cá. Bạn vẽ thêm bên cạnh một cánh cửa, mở toang._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: 30 NGÀY LÀM RẮN
// ------------------------------------------------------------
=== ran_doc_kt_30_ngay_lam_ran ===
# ket_thuc:30_ngay_lam_ran # loai:co_hau # bi_mat
_Ba tháng sau. Nhà sách lớn nhất Thành Phố Ước Mơ. Băng rôn: "Ra mắt sách: 30 NGÀY LÀM RẮN. Tác giả ký tặng."_
_Bìa sách: một con rắn đeo dây thẻ nhân viên màu cam. Tên tác giả: {ran_doc}._
_Chương 1: "Ma Mới, Thù Cũ". Chương cuối: "Rắn Gặp Rắn", kể lại ngày bạn đứng giữa phòng họp, chiếu từng bằng chứng LL-Entertainment cài người vào {cong_ty}._
_Không có tên thật. Không có bí mật của ai bị bóc. Chỉ có những chuyện ai đi làm văn phòng cũng gật gù: group chat lúc 11 giờ đêm, họp 5 phút kéo dài 2 tiếng, trà sữa thứ 6._
_Nhà phê bình gọi đây là "cuốn sách độc nhất năm". Theo nghĩa tốt._
_{ chung_cong_ty_song: {cong_ty} vẫn sống, nhờ một đêm diễn và một con rắn bị lật mặt đúng lúc. | {cong_ty} không qua được tháng 11. Nhưng cái tên LL-Entertainment thì không còn ai trong nghề dám bắt tay. } Bạn đã nghỉ việc từ tuần thứ hai của tháng 11._ {hr} mời bạn uống trà lần cuối, rót trà ô long số 23, rồi nói: "Anh lắng nghe em suốt một tháng. Giờ tới lượt cả nước nghe em."_
_Hàng người xin chữ ký dài tới cửa._
_{bien_kich} xếp thứ 3, ôm một cuốn tiểu thuyết của chính cô ta, đòi đổi chữ ký lấy chữ ký._
_{hong_hot} xếp thứ 7, livestream cả buổi: "Hàng xóm sát vách của tui đó cả nhà ơi!"_
_{thuc_tap_sinh} xếp thứ 12, mua 20 cuốn, trả bằng một cái thẻ đen viền kim cương._
_Rồi tới lượt một người mặc đồ hồng, đội mũ, cầm cuốn sách đã đọc tới nhàu._
sieu_nhan_hong: Dạ… ờm… em ký cho anh được hông? Ghi là… "Gửi đại ca xóm Cây Me".
_Bạn cầm bút. Viết: "Gửi người đứng xếp hàng. Lần này không ai bị nhốt. {ran_doc} Ếch."_
sieu_nhan_hong: *(đọc, cười dưới mũ)* Slay.
_Ngoài cửa, {cho} nằm canh hàng người, ngậm một cuốn sách. Không ai dám đòi lại._
-> END

// ------------------------------------------------------------
// 😢 🔥 BỊ LẬT TẨY
// ------------------------------------------------------------
=== ran_doc_kt_bi_lat_tay ===
# ket_thuc:bi_lat_tay # loai:buon
_Thứ 2, 2/11. Đại Nhạc Hội đã qua. Phòng họp "Sáng Tạo". Màn hình chiếu sáng trắng._
_Ảnh chụp tin nhắn của bạn, từng cái một. "Nghe nói 5 tỷ sếp đem đi mua xe". "Hợp đồng có điều khoản hoàn tiền gấp đôi". Bình luận bằng nick ảo. File MV bị đổi tên lúc 14:07 ngày 8/10, máy của bạn._
_Cả công ty ngồi im. Không ai nhìn màn hình nữa. Ai cũng nhìn bạn._
hong_hot: *(nhỏ xíu)* Ông… ông là hàng xóm sát vách của tui mà…
chi_dai: Chị đã nói rồi. Nghe nhiều thì phải biết giữ.
it: *(không nhìn ai)* Log là thật. Tôi đã nói đừng làm thêm.
_{hr} đứng dậy, cười. Nụ cười đó, lần này, bạn hiểu hết ý nghĩa._
hr: Em rảnh không, lên phòng anh uống trà xíu. Lần cuối.
_Trà ô long số 23. Anh ta rót cho người anh ta quý. Bạn không chắc mình còn trong danh sách đó._
hr: Mình cùng nhìn lại hành trình của em nha. Ba mươi ngày. Rất nhiều câu chuyện. Không câu nào em kể cho mình.
_Một thùng carton. Laptop trả lại. Dây thẻ màu cam trả lại. Cuốn sổ tay thì bạn giữ. Không ai đòi. Không ai muốn đọc nữa._
_Bạn ôm thùng carton đi xuống cầu thang bộ. Thang máy vẫn kẹt, như ngày đầu._
_Không ai tiễn._
_Tới cổng, có tiếng chân lạch bạch phía sau. {cho} chạy theo, ngậm một chiếc dép lẻ không rõ của ai, đi cạnh bạn ra tới tận cổng._
cho: Gâu.
_Bác {bac_bao_ve} ngồi trong chòi, rót trà, không nhìn ra._
bac_bao_ve: Bác không thấy gì đâu. *(ngừng một chút)* …Đi cẩn thận.
_{cho} đứng ở cổng nhìn theo, tới khi bạn khuất ở đầu đường._
-> END

// ------------------------------------------------------------
// 😢 🐍 RẮN CẮN RẮN
// ------------------------------------------------------------
=== ran_doc_kt_ran_can_ran ===
# ket_thuc:ran_can_ran # loai:buon
_Thứ 2, 2/11. Đèn sân khấu Đại Nhạc Hội tắt chưa đầy hai ngày. Phòng họp tầng 2. {ten(ran_thu_hai)} đứng cạnh máy chiếu, giọng nhẹ nhàng, rành mạch._
_Từng tấm ảnh. Từng tin nhắn. Từng đoạn ghi âm. Ngày 5/10 ở pantry. Ngày 15/10 trong bóng tối. Ngày 23/10, cái bánh kem. Tất cả đều là bạn. Tất cả đều là thật._
_Chỉ thiếu một thứ: những gì chính người đó đã làm. Cho LL-Entertainment. Suốt cả tháng._
giam_doc: {ran_doc}. Em có gì muốn nói không?
_Bạn mở miệng. Bạn có cả trăm tin mật. Nhưng không có một bằng chứng nào về người đang đứng kia. Bạn đã mải nhìn {sieu_nhan_hong}. Bạn chưa từng nhìn sau lưng mình._
hr: Anh chỉ muốn lắng nghe em thôi. Nhưng em không nói gì cả.
_Bạn bị đuổi trong 15 phút. Kỷ lục mới của phòng nhân sự._
{ chung_cong_ty_song:
    _Tuần sau, bản tin nội bộ có tên một người mới phụ trách. Tuần sau nữa, {ten(ran_thu_hai)} được thăng chức, ngồi đúng cái ghế bạn từng nhắm tới. Không ai biết người đó vẫn nhận lương bên kia đường._
- else:
    _Tuần sau, {cong_ty} làm thủ tục thanh lý. {ten(ran_thu_hai)} không cần ghế nào nữa: người đó sang thẳng LL-Entertainment, ngồi tầng 20, đúng cái ghế bạn chưa bao giờ biết là có._
}
_Bạn ngồi ở quán trà đá đầu hẻm, mở Phây-búc. Bài đăng mới nhất của {ten(ran_thu_hai)}: ảnh chụp với bó hoa thăng chức, kèm một dòng._
_"Tui chỉ nói sự thật thôi mà."_
_Bên dưới, {hong_hot} bình luận: "Đỉnh nóc!". {chi_dai} không bình luận. {cho} không biết dùng Phây-búc._
_Bạn tắt màn hình. Trong màn hình đen, phản chiếu một gương mặt cười ngọt như đường hóa học._
_Lần đầu tiên bạn thấy nó đáng sợ tới vậy._
-> END

// ------------------------------------------------------------
// 😢 💥 TRẢ THÙ THÀNH CÔNG
// ------------------------------------------------------------
=== ran_doc_kt_tra_thu_thanh_cong ===
# ket_thuc:tra_thu_thanh_cong # loai:buon
{ ket_thuc_su_nghiep == "bi_cuop_mat":
    _Đêm 31/10. Siêu Nhân Hồng đứng trên tầng thượng tòa LL, trong bộ đồ viền xanh lá chuối. Bên này đường, sân khấu Đại Nhạc Hội vắng chủ._
    _Bạn thắng. Bạn đã bảo hắn đi, và hắn đi._
- else:
    _Đêm 31/10. Bộ đếm trên màn hình lớn sau sân khấu dừng lại. Không đủ một triệu. Không có ai ký phụ lục gia hạn._
    _Bạn thắng._
}
_Trang 47 có hiệu lực. Mười tỷ. Quỹ còn hai. {cong_ty} nộp đơn phá sản vào sáng thứ 2._
_Ai cũng mất việc. {thuc_tap_sinh} ôm bó hoa "ngày nhà giáo" đã héo về phòng trọ. {ke_toan} mở két sắt nhà số 18, chia quỹ đen cho từng người, không giữ lại đồng nào. {editor} ngủ ba ngày liền. Bác {bac_bao_ve} gói ấm trà, dắt {cho} về nhà vườn Ven Đô._
_Kể cả bạn. Bạn cũng mất việc._
_Đêm đó, bạn ngồi một mình ở quán trà đá đầu Hẻm 69. Ông Ba quạt mo, không hỏi gì. Trà 3 nghìn một ly._
_Bên kia vách phòng trọ, {hong_hot} không livestream. Lần đầu tiên từ ngày bạn dọn tới._
_Bạn lướt điện thoại. Một clip mờ, không ai đăng chính thức, chỉ vài nghìn lượt xem: một người mặc đồ hồng, đội mũ, đang đẩy xe chết máy cho ai đó ở một tỉnh khác. Trời mưa. Không có nhạc nền. Không ai tạo dáng._
_Chú thích của người quay: "Ảnh không lấy tiền, cũng không cho chụp mặt. Ảnh nói ảnh đang tập làm người tốt."_
{ rd_biet_chuoc_loi:
    _Bạn biết vì sao hắn làm vậy. Hắn đã nói, bên đống lửa ở Vũng Tàu. Bạn đã nghe. Bạn đã chọn không tin._
}
_Bạn đặt ly trà xuống. Mối hận hai mươi năm. Ba mươi ngày lên kế hoạch. Một công ty sụp đổ._
_Bạn không thấy vui như mình tưởng._
_Bạn không thấy gì cả._
_Ông Ba rót thêm trà, đẩy ly về phía bạn._
_"Ngồi chơi, uống miếng nước."_
-> END
