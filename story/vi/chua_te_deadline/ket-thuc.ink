// ============================================================
// CHÚA TỂ DEADLINE · 6 KẾT THÚC
// Game gọi cảnh đánh giá sau chung_3110_dem_hong (đã chốt ket_thuc_su_nghiep, chung_cong_ty_song).
// Thứ tự: 🔒 Người Đến Sớm → 😄 Nhảy Là Phải Đẹp → 😄 Bạn Thân Hồng Chill
// → 😢 File Gốc → 😢 Nước Tới Cổ → 😢 PR Thôi Mà → mặc định.
// ============================================================

=== chua_te_deadline_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # dieu_kien:sau_dem_hong
// Đã nói "Kịch bản này ai viết vậy?" ngày 23/10: Độ Tin Thật Lòng khóa ở 0 tới hết game.
{ vu_tin_bi_khoa:
    ~ vu_tin_that_long = 0
}
{
- vu_xong_som && vu_chuoi_ngay_it_luot >= 2 && vu_so_lan_nho_xiu <= 3:
    ~ chot_ket_thuc("nguoi_den_som")
    -> chua_te_deadline_kt_nguoi_den_som
- vu_cue_sheet >= 47 && vu_cue_chuan && uy_tin >= 50 && vu_lo_file < 100 && vu_nuoc_toi_chan < 100:
    ~ chot_ket_thuc("nhay_la_phai_dep")
    -> chua_te_deadline_kt_nhay_la_phai_dep
- vu_tin_that_long >= 60 && vu_da_tra_loi_nguyen && not vu_tin_bi_khoa:
    ~ chot_ket_thuc("ban_than_hong_chill")
    -> chua_te_deadline_kt_ban_than_hong_chill
- vu_lo_file >= 100 && not vu_co_file:
    ~ chot_ket_thuc("file_goc")
    -> chua_te_deadline_kt_file_goc
- vu_nuoc_toi_chan >= 100 && vu_cue_sheet < 47:
    ~ chot_ket_thuc("nuoc_toi_co")
    -> chua_te_deadline_kt_nuoc_toi_co
- vu_tin_bi_khoa:
    ~ chot_ket_thuc("pr_thoi_ma")
    -> chua_te_deadline_kt_pr_thoi_ma
- vu_cue_sheet >= 47 && uy_tin >= 40:
    ~ chot_ket_thuc("nhay_la_phai_dep")
    -> chua_te_deadline_kt_nhay_la_phai_dep
- vu_lo_file >= 70 && not vu_co_file:
    ~ chot_ket_thuc("file_goc")
    -> chua_te_deadline_kt_file_goc
- else:
    ~ chot_ket_thuc("nuoc_toi_co")
    -> chua_te_deadline_kt_nuoc_toi_co
}

// ------------------------------------------------------------
// 😄 1. NHẢY LÀ PHẢI ĐẸP
=== chua_te_deadline_kt_nhay_la_phai_dep ===
# ket_thuc:nhay_la_phai_dep # loai:co_hau # noi:san_khau_dem_hong
_Bạn vẫn nghe tiếng mình trong bộ đàm. Cue 46: "Đèn tổng… Go!". Cả sân khấu sáng rực._
_Cue 47. Dòng cuối cùng, chữ của chính bạn, viết lúc 7 giờ 58 một buổi sáng nào đó._
{ nguyen_theo_ll:
    _Giữa sân khấu không có bộ đồ hồng. Chỉ có {idol_het_thoi}, không kính đen, hát "Công Viên". Câu cuối. Bạn hô._
- else:
    _{sieu_nhan_hong} giơ tay ở câu cuối. Đúng nhịp. Bạn hô._
}
chua_te_deadline: Pháo giấy… Go!
_Pháo hồng phủ kín sân khấu. Như một trận tuyết, nếu tuyết có màu bộ đồ của Siêu Nhân Hồng._
it: *(bộ đàm)* Đẹp.
chi_dai: *(bộ đàm)* Cả đội nghe đây. Đứa nào giỏi nhất đêm nay, chị không nói. Nhưng nó đang đeo tai nghe đứng cánh gà.
{ vu_duoc_de_bat:
    _Hôm qua, trong buổi họp đánh giá, {giam_doc} đã đọc tên bạn: Trưởng nhóm Dự án từ tháng 11, tăng lương 20%._
- else:
    _Hôm qua {giam_doc} nói "mình chờ kết quả Đại Nhạc Hội đã". Tối nay, sau show, {giam_doc} tìm tới cánh gà, vỗ vai bạn ba cái, không nói gì. Với {giam_doc}, không nói gì là nói rất nhiều._
}
{ chung_cong_ty_song:
    _Bộ đếm không còn là chuyện của bạn. Nhưng {cong_ty} qua được đêm nay, và cue sheet của bạn là một phần của chuyện đó._
- else:
    _Bộ đếm dừng dưới mốc. Công ty sắp có những ngày khó. Nhưng show đêm nay không sai một cue nào. Ai cũng thấy._
}
truong_phong: *(đi ngang cánh gà, không nhìn bạn)* Tớ vẫn ghét cách cậu làm việc. Nhưng tớ thích kết quả. Tớ ghi lại rồi.
_Show tan. Bạn đi bộ 200 mét về phòng gác. Lần đầu tiên con đường đó ngắn như nó thật sự là._
_Bạn nằm xuống nệm, chưa kịp tháo giày. Ngủ một mạch 19 tiếng._
_Tỉnh dậy, bạn lấy cây bút đỏ, lật sang tờ lịch năm sau, khoanh đúng một ngày: 31/10._
_Rồi bạn mở Tóp-tóp. Lướt. Còn 364 ngày mà. Chill._
_Nước tới chân mới nhảy. Mà nhảy là phải đẹp._
-> END

// ------------------------------------------------------------
// 😄 2. BẠN THÂN HỒNG CHILL
=== chua_te_deadline_kt_ban_than_hong_chill ===
# ket_thuc:ban_than_hong_chill # loai:co_hau # noi:quan_che_ba_bay
~ vu_thay_mai = true
{ nguyen_theo_ll:
    _23 giờ. Bạn đứng ở đầu Hẻm 69. Từ bên kia đường, {sieu_nhan_hong} đi qua, bộ đồ hồng viền xanh lá chuối, mũ cầm trên tay. Đúng giờ hẹn. Lần đầu tiên có người tới đúng giờ hẹn với bạn._
- else:
    _23 giờ. Show tan. {sieu_nhan_hong} ngồi ở mép sân khấu, cái mũ đặt bên cạnh, tóc bết mồ hôi. Bạn tới, ngồi xuống. Như đã hẹn._
}
_Bạn lấy trong túi ra cây bút highlight hồng đầu tiên. Đã cạn mực vì bạn tô quá nhiều ngày lên lịch. Bạn đặt nó lên tay {sieu_nhan_hong}._
chua_te_deadline: Em hông biết mấy món quà đó là PR hay là gì. Mà em biết anh là bạn em. Bạn thật, hông kịch bản.
sieu_nhan_hong: *(nhìn cây bút rất lâu, rồi cười, hơi buồn mà không buồn lắm)* … Ờm. Bạn thật. Ừ. Anh chịu.
chua_te_deadline: Đi ăn chè hông? Quán Bà Bảy đầu Hẻm 69 mở tới khuya.
_Quán chè Bà Bảy. Ghế nhựa đỏ, bóng đèn vàng. Một cô gái cột tóc đuôi gà đang múc chè, ngẩng lên thấy {sieu_nhan_hong} thì cười, không cần nhìn cái mũ._
mai: Anh ăn chè gì? Như mọi khi hả?
_{sieu_nhan_hong} gật đầu. Rồi đỏ mặt. Rồi đỏ tới tai. Đỏ hơn bộ đồ. Ly chè đậu ra bàn, có thêm một vá nước cốt dừa mà không ai gọi._
_Bạn nhìn {sieu_nhan_hong}. Nhìn cô bán chè. Nhìn lại {sieu_nhan_hong}. Trong đầu bạn, 47 cue tự xếp lại thành một cue sheet hoàn toàn mới._
_À. Ra là vậy. Bút hồng, ly giữ nhiệt, hộp cơm trứng, gối kê cổ. Hồi giờ ổng tập tặng quà trên mình. Người thật ở đây._
chua_te_deadline: *(nói nhỏ, rất nghiêm túc)* Anh tập kỹ vậy mà giờ mới tới đúng người. Còn chậm hơn em.
sieu_nhan_hong: Hả? Tập… tập gì?
_Bạn không giải thích. Bạn gọi thêm hai ly chè, trả tiền cả bàn, rồi để lại dưới ly một mẩu giấy: "Chill nha. —V"._
_{cho} nằm dưới gầm ghế nhựa từ lúc nào, gặm một miếng bánh chuối chiên. Lần đầu tiên nó nằm gần {sieu_nhan_hong} mà không sủa._
_Trên đường về phòng gác, bạn xóa cái hashtag cũ khỏi lịch sử tìm kiếm. Rồi lưu một hashtag mới cho kế hoạch tháng 11: "Content: quán chè. Để {hong_hot} lo."_
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: NGƯỜI ĐẾN SỚM
=== chua_te_deadline_kt_nguoi_den_som ===
# ket_thuc:nguoi_den_som # loai:co_hau # bi_mat # noi:san_khau_dem_hong
_Một tuần trước, cả công ty hoảng loạn: {chua_te_deadline} làm xong toàn bộ chiến dịch sớm 7 ngày._
_{truong_phong} triệu tập "họp khẩn tìm hiểu âm mưu". Cuộc họp kéo dài 3 tiếng. Kết luận: "Chưa rõ, cần họp thêm."_
hr: *(gõ cửa bàn bạn, cười hiền hơn bao giờ hết)* Em rảnh không, lên phòng anh uống trà xíu. Anh chỉ muốn lắng nghe em thôi. Em có ổn không em?
_{hong_hot} đăng bài: "Biến căng: producer làm xong việc sớm. Thánh nào nhập?"_
_{ke_toan} kiểm tra lại toàn bộ hóa đơn của bạn ba lần, vì "cái gì sớm quá cũng đáng ngờ"._
_Còn {editor} thì nhắn lúc 2 giờ sáng, một tin duy nhất: "ông còn sống hông"._
_Tối nay, Đại Nhạc Hội Siêu Nhân. Tất cả cue chạy như đồng hồ. {it} không cần hỏi qua bộ đàm một lần nào. {chi_dai} đứng khoanh tay, gật đầu từng cue._
_Còn bạn: không có gì để làm._
_Bạn nằm dài trên bãi cỏ sau sân khấu, hai tay gối đầu. Lần đầu tiên trong đời, bạn xem trọn vẹn một show mình làm ra. Từ đầu tới cuối. Không tai nghe. Không "Go!"._
_Pháo giấy nổ. Đúng lúc. Bạn không cần ra lệnh._
_Bạn mở Tóp-tóp. Video đầu tiên đang lên xu hướng: "Người đàn ông rảnh rỗi nhất Đại Nhạc Hội Siêu Nhân". 3 triệu lượt xem._
_Trong video, một anh chàng mặc áo cam nằm trên bãi cỏ, cười một mình giữa mưa pháo giấy hồng._
_Là bạn._
_Bình luận được ghim, của một tài khoản có avatar màu hồng: "Lần sau tới sớm vậy nữa nha. Anh chờ ở hàng ghế đầu."_
_Bạn trả lời: "Dạ, PR khéo ghê anh." Rồi tắt điện thoại, nằm tiếp. Lần đầu tiên trong đời, bạn không có gì phải làm vào ngày mai._
-> END

// ------------------------------------------------------------
// 😢 4. NƯỚC TỚI CỔ
=== chua_te_deadline_kt_nuoc_toi_co ===
# ket_thuc:nuoc_toi_co # loai:buon # noi:san_khau_dem_hong
_Tối nay, 19 giờ 30. Cue sheet trên tay bạn có {vu_cue_sheet} dòng. Dòng cuối viết dở: "Cue {vu_cue_sheet}: đèn… (hỏi {it})"._
it: *(bộ đàm)* Cue 1?
chua_te_deadline: … Đèn… tắt. Go.
_Đèn tắt. Ổn. Phim của {bien_kich} ổn. Video "16 năm" ổn. Rồi 20 giờ, tờ giấy hết chữ._
it: *(bộ đàm)* Pháo giấy khi nào?
_Bạn nhìn lên sân khấu. {nguyen_theo_ll:{idol_het_thoi}|{sieu_nhan_hong}} đang hát. Bạn không nhớ đây là câu nào. Câu nào nghe cũng giống câu cuối._
chua_te_deadline: Go!
_Pháo nổ. Đúng lúc câu buồn nhất. Cả khán đài giật mình. Ai đó cười. Rồi nhiều người cười._
chi_dai: *(bộ đàm, rất bình tĩnh, bình tĩnh đáng sợ)* Từ giờ chị cầm cue. Em đứng đó.
_Bạn đứng đó tới hết show. Tai nghe vẫn đeo, nhưng không ai gọi bạn nữa.{ not chung_cong_ty_song: Bộ đếm dừng dưới mốc. Không ai nói vì cái pháo giấy. Không ai cần nói.}_
_Sáng thứ 2, 7 giờ 45, điện thoại sáng lên._
hr: Em rảnh không, lên phòng anh uống trà xíu.
_Lần này bạn không đi trễ. Bạn tới lúc 7 giờ 50, ngồi chờ trước cửa phòng HR. Kệ trà 40 loại. Hôm nay là trà chữ "Z"._
_Lần đầu tiên trong đời bạn tới sớm. Và đó là lần duy nhất bạn ước gì mình tới trễ._
-> END

// ------------------------------------------------------------
// 😢 5. FILE GỐC
=== chua_te_deadline_kt_file_goc ===
# ket_thuc:file_goc # loai:buon # noi:cong_cong_ty
_Hôm qua, họp đánh giá ngày 30/10. {giam_doc}, {truong_phong}, {hr} ngồi một hàng._
_{ke_toan} bước vào, đặt lên bàn một tờ giấy: biên bản phạt của đoàn kiểm tra thuế. Dòng in đậm: "Doanh thu 800.000.000đ tháng 6/2026: không chứng minh được nghiệm thu."_
ke_toan: Em xin phép. Khoản phạt này em đã trừ vào quỹ công ty. Quỹ còn… em không muốn nói con số ở đây.
_{giam_doc} đọc biên bản. Đọc lại. Rồi ngẩng lên, hỏi đúng một câu._
giam_doc: File gốc đâu em?
_Cả phòng quay sang nhìn bạn. Mười mấy cặp mắt. Ai cũng biết. Hóa ra ai cũng biết từ lâu, chỉ chờ một người hỏi._
_{editor} ngồi góc phòng. Không nói gì. Chỉ ngáp. Lần này không phải vì buồn ngủ._
* [😇 "Em làm mất. Tháng 9. Em xin lỗi."]
    giam_doc: … Anh cảm ơn em đã nói thật. Muộn, nhưng thật.
* [😶 Im lặng.]
    giam_doc: Ừ. Anh hiểu rồi.
- _Chiều đó, bạn ôm thùng carton đi xuống. Trong thùng: laptop dán sticker, 2 lon Trâu Cày, một ly giữ nhiệt hồng, một cái gối cổ hồng._
_Tối nay bạn vẫn đứng cánh gà Đại Nhạc Hội, vì show không chờ ai. Đó là show cuối cùng của bạn ở {cong_ty}._
{ vu_usb_ra_bai_rac:
    _Show tan, bạn đạp xe ra bãi rác Ven Đô. Hàng nghìn bao rác giống hệt nhau dưới đèn vàng. Ở đâu đó trong đó có 800 triệu, một cảnh drone, và một buổi hoàng hôn._
    _Bạn đứng nhìn rất lâu. Rồi bạn cười. Cười thật to, tới mức chú bảo vệ bãi rác phải ló đầu ra._
    _"Cháu tìm gì?" chú hỏi._
    chua_te_deadline: Dạ, deadline.
- else:
    _Show tan, bạn đi ngang gầm cầu thang công ty lần cuối. {cho} đang nằm đó, gặm gặm một vật nhỏ. Một cái USB không nhãn. Mùi cà phê sữa đá._
    cho: *(ngẩng lên nhìn bạn, vẫy đuôi)* Gâu.
    _Bạn đứng nhìn cái USB rất lâu. Rồi bạn cười. Cười thật to, tới mức {bac_bao_ve} phải ló đầu ra khỏi chòi._
    bac_bao_ve: Bác… bác không thấy gì đâu.
    _Lần này, bác nói câu đó rất nhỏ. Như một lời xin lỗi._
}
-> END

// ------------------------------------------------------------
// 😢 6. PR THÔI MÀ
=== chua_te_deadline_kt_pr_thoi_ma ===
# ket_thuc:pr_thoi_ma # loai:buon # noi:phong_gac_quan_bida
_Đại Nhạc Hội Siêu Nhân kết thúc. {chung_cong_ty_song:Công ty qua được đêm nay. {hong_hot} gửi bạn ảnh chụp màn hình con số người theo dõi, kèm 7 cái icon pháo hoa.|Bộ đếm dừng dưới mốc. {hong_hot} gửi bạn đúng một chữ: "Toang."}_
_Bạn về phòng gác. Dưới nhà, quán bida đông nghẹt người ăn mừng Halloween. Tiếng bi lách cách._
_Không có tin nhắn nào từ {sieu_nhan_hong}. Từ sau đêm livestream, chỉ có đúng một tin, lúc 23 giờ 47 đêm 27/10. Rồi thôi._
_Sáng 1/11. Bạn đi làm. 8 giờ 20, như thường lệ._
_Trên bàn bạn không có quà hồng. Không bút. Không ly. Không gối. Không hộp cơm._
_Chỉ có một mẩu giấy viết tay. Chữ tròn tròn, quen thuộc._
_"Anh hiểu rồi. Cảm ơn em đã làm show cho anh. —N"_
_Không phải "SNH". Là "N". Lần đầu tiên {sieu_nhan_hong} ký tên thật với bạn. Và đó là lần cuối._
_Trưa đó bạn đi ngang quán chè Bà Bảy đầu Hẻm 69. {sieu_nhan_hong} ngồi đó, không mũ. Cô bán chè cột tóc đuôi gà múc thêm cho anh một vá nước cốt dừa, không cần hỏi. Anh cười. Không phải nụ cười tạo dáng. Cũng không phải nụ cười dành cho bạn._
_Bạn đứng ở đầu hẻm một lúc. Hóa ra từ đầu không phải PR. Chỉ là bạn tới trễ, như mọi khi. Mà lần này người ta không chờ._
* [📱 Mở Tóp-tóp.]
    _Bạn lướt. Lướt. Lướt. Video mèo. Video nấu mì. Video "Producer phũ nhất năm", 4 triệu lượt xem._
* [💌 Mở khung chat với {sieu_nhan_hong}.]
    _Bạn gõ: "Anh ơi". Rồi xóa. Gõ: "Em xin lỗi". Rồi xóa. Khung chat trống. Ô nhập chữ nhấp nháy, chờ một deadline không bao giờ tới._
- _Lần đầu tiên trong đời, chẳng video nào làm bạn cười._
_Cây bút highlight hồng đầu tiên vẫn nằm trong ngăn kéo. Bạn mở ngăn kéo, nhìn nó, rồi đóng lại._
_Ngày 31/10 trên tờ lịch vẫn khoanh hồng. Màu đó giờ nhìn giống một vết bút xóa không hết._
-> END
