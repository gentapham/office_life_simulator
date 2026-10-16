// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT · 6 kết thúc
// 😄 pho_giam_doc_nhat · dao_dien_that · ban_pho_hai_nguoi (bí mật)
// 😢 phim_cach_la_chay · ban_nhap_thu_15 · hop_toi_kiet_suc
// ============================================================

// ------------------------------------------------------------
// Đánh giá kết thúc. Chạy sau chung_3110_dem_hong (23:00 ngày 31/10),
// lúc ket_thuc_su_nghiep và chung_cong_ty_song đã được chốt.
=== truong_phong_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # danh_gia_ket_thuc
// 1. Lộ bài: Độ Lộ từ 85 trở lên
{ tp_do_lo >= 85:
    ~ chot_ket_thuc("phim_cach_la_chay")
    -> truong_phong_kt_phim_cach_la_chay
}
// 2. Kiệt sức vì họp
{ tp_kiet_suc || tp_so_cuoc_hop >= 98:
    ~ chot_ket_thuc("hop_toi_kiet_suc")
    -> truong_phong_kt_hop_toi_kiet_suc
}
// 3. Bí mật: hai người đề cử nhau, cùng làm Phó
{ tp_pho_giam_doc == "ca_hai":
    ~ chot_ket_thuc("ban_pho_hai_nguoi")
    -> truong_phong_kt_ban_pho_hai_nguoi
}
// 4. Phó Giám đốc: {giam_doc} đã bổ nhiệm ở cuộc họp 30/10
{ tp_pho_giam_doc == "tp":
    ~ chot_ket_thuc("pho_giam_doc_nhat")
    -> truong_phong_kt_pho_giam_doc_nhat
}
// 5. Đạo diễn thật
{ tp_tay_nghe >= 30 && tp_so_lan_ghi_cong >= 3 && tp_mo_ca_dem:
    ~ chot_ket_thuc("dao_dien_that")
    -> truong_phong_kt_dao_dien_that
}
// 6. Còn lại: ghế bay mất
~ chot_ket_thuc("ban_nhap_thu_15")
-> truong_phong_kt_ban_nhap_thu_15

// ------------------------------------------------------------
// 😄 🪑 PHÓ GIÁM ĐỐC NHẬT
=== truong_phong_kt_pho_giam_doc_nhat ===
# ket_thuc:pho_giam_doc_nhat # loai:co_hau # noi:phong_pho_giam_doc
_Sáng thứ Hai đầu tháng 11. Phòng Phó Giám đốc, tầng 2. Vách kính mới lau, còn mùi nước lau kính._
{ not chung_cong_ty_song:
    _Đại Nhạc Hội đã qua. Trang 47 có hiệu lực, công ty có một tháng để thanh lý. Việc đầu tiên của Phó Giám đốc là lên lịch bàn giao. Không ai tranh cái ghế này nữa. Bạn vẫn ngồi vào._
}
_Trên bàn: một cái bảng tên "Phó Giám đốc: {truong_phong}", một quyển sổ kẻ ô, và cái bảng trắng gấp gọn từng đi Vũng Tàu._
_Bạn mở email. Thói quen 6 năm. Ngón tay tự gõ: "Họp nhanh 5 phút. 8:30. Phòng Sáng Tạo. Toàn bộ phòng Sản xuất."_
_Ngón tay dừng trên nút gửi._
_Qua vách kính, bạn thấy {editor} đang ngủ gục, {designer} đang sửa một cái gì đó, {chua_te_deadline} đang… làm việc. {thuc_tap_sinh} đang pha cà phê cho cả phòng, "như mọi khi" của bạn nằm ở cốc ngoài cùng._
_Bạn xóa hết. Gõ lại:_
{ chung_cong_ty_song:
    _"Tuần này không họp. Ai cần gì thì lên phòng anh. Cửa không khóa."_
- else:
    _"Tháng này không họp. Ai cần thư giới thiệu thì lên phòng anh. Anh viết đúng tên người làm. Cửa không khóa."_
}
_Bấm gửi._
_Mười giây. Hai mươi giây. Ngoài vách kính, từng người cúi xuống điện thoại._
_Rồi {thuc_tap_sinh} đứng dậy trước tiên. Rồi {designer}. Rồi {chua_te_deadline}, vẫn cầm điện thoại. Cả phòng Sản xuất đứng dậy vỗ tay._
_{editor} tỉnh dậy, không hiểu chuyện gì, vỗ tay theo, mắt vẫn nhắm._
giam_doc: *(gõ cửa, ló đầu vào)* {truong_phong}. Họp nhanh 5 phút không?
truong_phong: Dạ… anh không ép, tùy em ạ.
giam_doc: *(bật cười)* Thằng này. Học nhanh thật.
_Bạn mở quyển sổ kẻ ô, trang đầu tiên của tháng 11. Bạn viết một dòng, rồi gạch chân hai lần:_
_"Cuộc họp tốt nhất là cuộc họp không cần họp."_
_Rồi bạn gạch chữ "tốt nhất", viết lại: "đáng nhớ nhất". Có những thói quen sửa mãi không hết._
-> END

// ------------------------------------------------------------
// 😄 🎬 ĐẠO DIỄN THẬT
=== truong_phong_kt_dao_dien_that ===
# ket_thuc:dao_dien_that # loai:co_hau # noi:san_khau_dem_hong
_Đại Nhạc Hội Siêu Nhân kết thúc. Pháo giấy hồng còn bay lả tả. Màn hình lớn chạy credits, chậm rãi, từng dòng một._
_"Đạo diễn: {truong_phong}."_
_"Dựng phim: {editor}."_
_Hai dòng. To bằng nhau. Cùng một kiểu chữ. Ở góc dưới khung hình, một con cú nhỏ đeo tai nghe chớp mắt đúng một lần._
{ tp_biet_linh_la_cu_dem:
    _Khán giả không ai để ý. Bạn để ý. Bạn biết con cú đó ở đó vì ai._
}
_2 giờ sáng. Phòng dựng tầng 2. Cả tòa nhà tối, chỉ còn hai màn hình sáng._
_Bạn ngồi ghế chính. {editor} ngồi ghế phụ, tay khoanh trước ngực, không chạm vào chuột._
editor: Clip này anh tự dựng từ đầu hả?
truong_phong: Từ đầu. Từng cảnh. Kể cả chỗ nhạc lên.
{ not chung_cong_ty_song:
    _Công ty có thể không qua được tháng 11. Nhưng clip này thì ở lại._
}
_Clip 60 giây tổng kết Đại Nhạc Hội Siêu Nhân. Có cảnh {sieu_nhan_hong} cúi chào. Có cảnh {cho} ngủ dưới gầm sân khấu. Có cảnh cả phòng Sản xuất ngồi bệt dưới pháo giấy._
_Bạn bấm "Xuất". Thanh tiến trình chạy. 12%. 47%. 89%._
_100%._
_Clip đầu tiên trong đời bạn tự làm, không cần ai, không nhận công của ai._
editor: *(ngáp thật dài)* Render xong là xong anh.
truong_phong: Ừ. Xong rồi.
editor: Mai… à, tối mai, anh tới học bài 11 không? Bài chỉnh âm thanh. Khó lắm.
truong_phong: Mấy giờ?
editor: 22 giờ. Họp nhanh 5 phút thôi.
_Hai người cùng cười. Dưới sân, đèn chòi bảo vệ vẫn sáng. Bác {bac_bao_ve} ngẩng lên nhìn ô cửa sổ tầng 2, rồi tắt radio, đi ngủ._
-> END

// ------------------------------------------------------------
// 😄 🔒 BAN PHÓ HAI NGƯỜI (kết thúc bí mật, chung với Long)
=== truong_phong_kt_ban_pho_hai_nguoi ===
# ket_thuc:ban_pho_hai_nguoi # loai:co_hau # bi_mat # noi:phong_hop_tang_2
_Nhớ lại họp đánh giá chiều 30/10. Trên bàn {giam_doc} có hai lá đơn đề cử. Lá của bạn ghi tên {con_ong_chau_cha}. Lá của {con_ong_chau_cha} ghi tên bạn._
_{giam_doc} nhìn lá này. Nhìn lá kia. Đeo kính vào nhìn lại. Tháo kính ra. Gãi đầu._
giam_doc: Thế thì… hai đứa cùng làm. Anh không ép, tùy các em.
_Cả phòng im lặng ba giây. Rồi {thuc_tap_sinh} vỗ tay một mình. Rồi {chi_dai} vỗ theo. Rồi cả phòng._
con_ong_chau_cha: *(nói nhỏ)* Ủa, vậy là tui với ông chung ghế hả?
truong_phong: Chung bàn. Ghế thì mỗi người một cái.
_Một tháng sau._
{ not chung_cong_ty_song:
    _Công ty đã thanh lý. {con_ong_chau_cha} bán penthouse, thuê lại một căn phòng 20 mét vuông ở Phố Cũ. Hai "Phó Giám đốc" không còn công ty, nhưng còn một cái bàn dài và một cây đàn._
}
_Phòng làm việc có một cái bàn dài. Một đầu bàn có tấm bảng trắng nhỏ, kín sơ đồ sản xuất. Đầu kia có một cây đàn ghi-ta dựng nghiêng và một cái bàn phím nhỏ._
_Bạn lo sản xuất. {con_ong_chau_cha} lo âm nhạc. "Hồng Là Thái Độ" đã có bản 43, lần này có cả đoạn bè do chính bạn góp ý: "chỗ này nghe như mũi tên đi lên"._
_{con_ong_chau_cha} vẫn đi trễ, nhưng giờ trễ có lý do: đêm qua thu âm. Bạn vẫn vẽ sơ đồ, nhưng giờ sơ đồ có nốt nhạc._
_Trên lịch chung của hai người chỉ có đúng một cuộc họp mỗi ngày. Lặp lại, không bao giờ hủy:_
_"Họp nhanh 5 phút: trưa nay ăn gì?"_
con_ong_chau_cha: Cơm tấm hông?
truong_phong: Hôm qua cơm tấm rồi. Phở đi.
con_ong_chau_cha: Phở là món Bắc, ông thiên vị.
truong_phong: Thế thì biểu quyết.
_Biểu quyết 1–1. Cuộc họp kéo dài 40 phút. Hai người đói meo, cuối cùng gọi {thuc_tap_sinh} vào làm phiếu quyết định._
thuc_tap_sinh: Dạ… em chọn bánh mì ạ. Em mới vô nên chưa biết ạ.
_Ba người ăn bánh mì trên bậc thềm sân thượng. Không ai nhắc tới cái ghế nữa._
-> END

// ------------------------------------------------------------
// 😢 ⌨️ PHÍM CÁCH LÀ CHẠY
=== truong_phong_kt_phim_cach_la_chay ===
# ket_thuc:phim_cach_la_chay # loai:buon # noi:phong_dung_phim
_Thứ Hai sau Đại Nhạc Hội. Phòng họp tầng 2 chật kín. Người ta mang cả ghế từ pantry lên. Ở giữa phòng là cái máy dựng, kéo từ phòng {editor} sang._
_{giam_doc} khoanh tay đứng cạnh. {thanh_ninh} cầm sổ. {hong_hot} cầm điện thoại, đèn đỏ đang quay._
giam_doc: {truong_phong}. Em mở cho anh xem em làm thế nào.
_Con trỏ nhấp nháy trên timeline. Hàng chục dải màu xếp chồng lên nhau như sơ đồ của bạn, chỉ khác là lần này bạn không hiểu gì._
_Mười giây._
_Bạn đặt tay lên chuột. Chuột lạnh._
_Hai mươi giây._
_Bạn nghĩ tới tất cả những cuộc họp. Tất cả những slide ghi "Sản xuất: {truong_phong}". Tất cả những đêm {editor} ngủ gục trên bàn phím._
_Ba mươi giây. Không ai thở._
thuc_tap_sinh: *(rụt rè từ cuối phòng)* Dạ… bấm phím cách là nó chạy ạ.
_Video chạy. Nó đẹp. Nó luôn đẹp. Chỉ là không phải của bạn._
_Không ai cười. Như thế còn tệ hơn._
{ chung_cong_ty_song:
    _Tuần sau, bảng thông báo tầng trệt dán một tờ giấy mới: "Bổ nhiệm Trưởng phòng Sản xuất Nội dung: {editor}."_
- else:
    _Công ty đang làm thủ tục thanh lý. Nhưng trên bảng thông báo tầng trệt vẫn có người dán một tờ giấy: "Trưởng phòng Sản xuất Nội dung (tháng cuối): {editor}."_
}
_Bạn được giữ lại, chức danh mới: "Điều phối cuộc họp". Lịch của bạn vẫn kín từ 8 giờ sáng. Chỉ là giờ không ai bắt buộc phải tới._
_Tối đó, bạn về căn 501. Đứng trước bảng trắng. Mở kênh "Cú Đêm Cắt Ghép", bài 1: "Cắt và ghép"._
_Giọng ngái ngủ quen thuộc: "Mấy bạn nhớ nha, render xong là xong."_
_Bạn bấm phím cách. Video chạy._
-> END

// ------------------------------------------------------------
// 😢 📄 BẢN NHÁP THỨ 15
=== truong_phong_kt_ban_nhap_thu_15 ===
# ket_thuc:ban_nhap_thu_15 # loai:buon # noi:can_501_pho_moi
_Gần nửa đêm 31/10. Đại Nhạc Hội vừa tan. Căn 501, chung cư mini Phố Mới. Thang máy hỏng, bạn đi bộ 5 tầng, tay xách cái bảng trắng gấp gọn._
{ tp_pho_giam_doc == "long":
    _Ghế Phó Giám đốc đã có chủ: {con_ong_chau_cha}. Lúc ký nhận, {con_ong_chau_cha} nhìn hộp đàn ở góc phòng rất lâu. Bạn không để ý. Bạn chưa bao giờ để ý._
- else:
    _Ghế Phó Giám đốc để trống tới tháng sau. Không phải của bạn. Cũng không phải của ai._
}
_Bạn đứng trước bảng trắng to bằng cửa sổ. Mở nắp bút. Viết dòng tiêu đề:_
_"Đơn xin đề bạt, bản 15."_
_Bạn viết được nửa trang. "Kính gửi anh {giam_doc}. Em đã gắn bó với công ty 6 năm…"_
_Bạn dừng lại. Đọc lại. Sáu năm. Sáu năm, bao nhiêu cuộc họp?_
_Bạn lấy giẻ, xóa hết. Từng chữ một. Bảng trắng lại trắng._
_Ở góc bảng, bạn viết nhỏ:_
_"Họp với chính mình: 5 phút."_
_Rồi bạn ngồi xuống sàn, tựa lưng vào tường, nhìn cái bảng._
{ tp_biet_long_khong_muon_ghe:
    _Bạn nhớ câu nói trên sân thượng: "Ông muốn cái ghế đó thì lấy đi." Cái ghế đã ở đó. Chỉ là bạn không với tới được._
- else:
    _Bạn nghĩ về {con_ong_chau_cha}. Đi trễ, về sớm, nói "chill". Bạn tự hỏi cậu ta có muốn cái ghế đó như bạn muốn không. Bạn chưa bao giờ hỏi._
}
_Điện thoại rung. Group công ty. {giam_doc} nhắn: "Cảm ơn các em một tháng qua. Anh không ép ai trả lời."_
{ not chung_cong_ty_song:
    _Bên dưới, {ke_toan} nhắn thêm: "Thứ Hai mọi người lên nhận giấy tờ thanh lý." Đơn xin đề bạt bản 15 của bạn giờ không còn ai để gửi._
}
_Bạn không trả lời. Lần đầu tiên._
_Cuộc họp với chính mình kéo dài tới sáng. Biên bản trống. Không ai ký._
-> END

// ------------------------------------------------------------
// 😢 🕯️ HỌP TỚI KIỆT SỨC
=== truong_phong_kt_hop_toi_kiet_suc ===
# ket_thuc:hop_toi_kiet_suc # loai:buon # noi:phong_hop_sang_tao
_Sáng thứ Hai sau Đại Nhạc Hội. Cuộc họp thứ {tp_so_cuoc_hop + 1} kể từ đầu tháng 10. Phòng "Sáng Tạo". Bảng trắng kín ba lớp sơ đồ, lớp sau đè lên lớp trước._
truong_phong: Mục 14. Mình rà soát lại tiến độ của việc rà soát tiến độ…
_Bạn đứng dậy, cầm bút lông, chỉ vào một mũi tên. Mũi tên chỉ vào một mũi tên khác. Mũi tên đó chỉ vào bạn._
_Căn phòng nghiêng đi một chút. Rồi nghiêng thêm một chút nữa._
_Bạn ngã ngồi xuống ghế. Cây bút lông lăn trên mặt bàn, rơi xuống đất, nắp văng ra._
_Không ai nói gì._
_{chua_te_deadline} đứng dậy trước. Đẩy ghế vào. Rồi {designer}. Rồi {bien_kich}, ôm cuốn sổ vào ngực. {thuc_tap_sinh} đi cuối, đặt một chai nước suối trước mặt bạn._
_{editor} là người cuối cùng ra khỏi phòng. Đóng cửa rất nhẹ, như sợ đánh thức ai._
_Bạn tỉnh dậy ở Phòng khám Khỏe Re. Đèn trắng. Mùi cồn. Ngoài hành lang, {thanh_xin_nghi} đang lấy số khám, nhìn bạn, ngại ngùng vẫy tay._
bac_si_khoe_re: Kiệt sức. Thiếu ngủ. Thiếu nước. Thiếu… ừm, thiếu khoảng trống trong lịch. Lần đầu tôi ghi chẩn đoán này đấy.
_Điện thoại trên đầu giường sáng lên. 14 lời mời họp mới._
_Bạn mở ra xem người gửi._
_Người gửi: {truong_phong}._
_Bạn nằm nhìn trần nhà rất lâu. Rồi bạn bấm "Từ chối". Từng cái một. Mười bốn lần._
_Đó là cuộc họp ngắn nhất bạn từng chủ trì._
-> END
