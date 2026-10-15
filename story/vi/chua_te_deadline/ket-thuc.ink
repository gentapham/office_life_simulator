// ============================================================
// CHÚA TỂ DEADLINE · 6 KẾT THÚC
// Kết quả được chốt theo trạng thái sau buổi họp đánh giá 30/10,
// cảnh kết hiện ra sau khi Đêm Hồng (31/10) tan.
// Thứ tự ưu tiên: 💾 File Gốc → 🌊 Nước Tới Cổ → 🔒 Người Đến Sớm
// → 🩷 Không Phải PR → 📱 PR Thôi Mà → 🌊 Nhảy Là Phải Đẹp.
// ============================================================

=== chua_te_deadline_3010_danh_gia ===
# ngay:31 # gio:22:40 # noi:san_khau_dem_hong # bat_buoc
// Đã nói "Kịch bản này ai viết vậy?" ngày 23/10: Độ Tin Thật Lòng khóa ở 0 tới hết game.
{ vu_tin_bi_khoa:
    ~ vu_tin_that_long = 0
}
{
- vu_lo_file >= 100 && not vu_co_file:
    ~ chot_ket_thuc("file_goc")
    -> chua_te_deadline_kt_file_goc
- vu_nuoc_toi_chan >= 100 && vu_cue_sheet < 47:
    ~ chot_ket_thuc("nuoc_toi_co")
    -> chua_te_deadline_kt_nuoc_toi_co
- vu_xong_som && vu_chuoi_ngay_it_luot >= 7 && vu_so_lan_nho_xiu == 0:
    ~ chot_ket_thuc("nguoi_den_som")
    -> chua_te_deadline_kt_nguoi_den_som
- vu_tin_that_long >= 80 && vu_hen_dem_hong && vu_da_tra_loi_nguyen && not vu_tin_bi_khoa:
    ~ chot_ket_thuc("khong_phai_pr")
    -> chua_te_deadline_kt_khong_phai_pr
- vu_tin_bi_khoa && vu_tin_that_long < 20:
    ~ chot_ket_thuc("pr_thoi_ma")
    -> chua_te_deadline_kt_pr_thoi_ma
- vu_moc_truot <= 1 && vu_dem_than_toc_2910 && vu_cue_sheet >= 47 && uy_tin >= 60:
    ~ chot_ket_thuc("nhay_la_phai_dep")
    -> chua_te_deadline_kt_nhay_la_phai_dep
- vu_cue_sheet >= 47 && uy_tin >= 45:
    ~ chot_ket_thuc("nhay_la_phai_dep")
    -> chua_te_deadline_kt_nhay_la_phai_dep
- else:
    ~ chot_ket_thuc("nuoc_toi_co")
    -> chua_te_deadline_kt_nuoc_toi_co
}

// ------------------------------------------------------------
// 😄 1. NHẢY LÀ PHẢI ĐẸP
=== chua_te_deadline_kt_nhay_la_phai_dep ===
# ngay:31 # gio:22:00 # noi:san_khau_dem_hong
_Cue 46: "Đèn tổng… Go!". Cả sân khấu sáng rực._
_Cue 47. Bạn nhìn tờ cue sheet trên tay. Dòng cuối cùng, chữ của chính bạn, viết lúc 7 giờ 58 một buổi sáng nào đó._
chua_te_deadline: Pháo giấy… Go!
_Pháo hồng phủ kín sân khấu. Như một trận tuyết, nếu tuyết có màu bộ đồ của Siêu Nhân Hồng._
it: *(bộ đàm)* Đẹp.
_Một chữ. Từ {it}, một chữ đó bằng một bài diễn văn._
chi_dai: *(bộ đàm)* Cả đội nghe đây. Đứa nào giỏi nhất đêm nay, chị không nói. Nhưng nó đang đeo tai nghe đứng cánh gà.
_Hôm qua, trong buổi họp đánh giá, {giam_doc} đã đọc tên bạn: Trưởng nhóm Dự án, tăng lương 20%._
_{truong_phong} vỗ tay. Bằng hai ngón. Hai ngón vỗ rất lâu._
truong_phong: *(đi ngang cánh gà, không nhìn bạn)* Tớ vẫn ghét cách cậu làm việc. Nhưng tớ thích kết quả. Tớ ghi lại rồi.
_Show tan. Bạn đi bộ 200 mét về phòng gác. Lần đầu tiên con đường đó ngắn như nó thật sự là._
_Dưới nhà, tiếng bi va nhau lách cách. Bạn nằm xuống nệm, chưa kịp tháo giày._
_Bạn ngủ một mạch 19 tiếng._
_Tỉnh dậy, bạn lấy cây bút đỏ, lật sang tờ lịch năm sau, khoanh đúng một ngày: 31/10._
_Rồi bạn mở Tóp-tóp. Lướt. Còn 364 ngày mà. Chill._
_Nước tới chân mới nhảy. Mà nhảy là phải đẹp._
-> END

// ------------------------------------------------------------
// 😄 2. KHÔNG PHẢI PR
=== chua_te_deadline_kt_khong_phai_pr ===
# ngay:31 # gio:22:35 # noi:san_khau_dem_hong
_Show tan. Sân khấu tắt đèn từng dãy, như ai đó đang gấp lại một tấm chăn lớn._
_{sieu_nhan_hong} ngồi ở mép sân khấu, chân đung đưa. Cái mũ hồng đặt bên cạnh. Tóc bết mồ hôi. Không tạo dáng._
_Đồng hồ: 22 giờ 35. Còn 1 tiếng 24 phút tới hết ngày 31. Với bạn, đó là sớm. Sớm khủng khiếp._
_Bạn đi tới, ngồi xuống bên cạnh. Lấy trong túi ra một cây bút highlight màu hồng, cây đầu tiên. Đã cạn mực vì bạn tô quá nhiều ngày lên lịch._
_Bạn đặt nó lên tay Nguyên._
chua_te_deadline: Lần đầu tiên trong đời em trả lời trước deadline đó.
sieu_nhan_hong: … *(nhìn cây bút rất lâu)* Trả lời… là sao?
chua_te_deadline: Là không phải PR. Từ đầu đã không phải. Em chỉ chậm hiểu. Chậm như em đi làm.
_Nguyên cười. Không tạo dáng. Không "Biến hình!". Chỉ là một anh chàng tên Nguyễn Nguyên, ngồi mép sân khấu, cười với một người._
sieu_nhan_hong: Ờm… vậy… mai em rảnh hông?
chua_te_deadline: Mai là chủ nhật. Chủ nhật là ngày nghỉ của deadline.
sieu_nhan_hong: Anh nhớ câu đó. Ngày Động vật. Em nói câu đó, mà anh nhớ tới giờ.
_Phía xa, {cho} sủa một tiếng. Nhưng lần này không lao tới. Nó nằm xuống cạnh chân {bac_bao_ve}, đầu gối lên con gà cao su._
bac_bao_ve: *(nhìn về phía sân khấu, uống ngụm trà)* Bác không thấy gì đâu.
_Lần này, câu đó không lâu chút nào. Bác nói nhanh, và cười._
_Trên điện thoại bạn, cái hashtag cũ vẫn còn trong lịch sử tìm kiếm. Bạn xóa nó đi. Không cần nữa. Người cần nghe câu trả lời đã nghe rồi._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: NGƯỜI ĐẾN SỚM
=== chua_te_deadline_kt_nguoi_den_som ===
# ngay:31 # gio:21:00 # noi:san_khau_dem_hong
_Một tuần trước, cả công ty hoảng loạn: {chua_te_deadline} làm xong toàn bộ chiến dịch sớm 7 ngày._
_{truong_phong} triệu tập "họp khẩn tìm hiểu âm mưu". Cuộc họp kéo dài 3 tiếng. Kết luận: "Chưa rõ, cần họp thêm."_
hr: *(gõ cửa bàn bạn, cười hiền hơn bao giờ hết)* Em rảnh không, lên phòng anh uống trà xíu. Anh chỉ muốn lắng nghe em thôi. Em có ổn không em?
_{hong_hot} đăng bài: "Biến căng: producer làm xong việc sớm. Thánh nào nhập?"_
_{ke_toan} kiểm tra lại toàn bộ hóa đơn của bạn ba lần, vì "cái gì sớm quá cũng đáng ngờ"._
_Còn {editor} thì nhắn lúc 2 giờ sáng, một tin duy nhất: "ông còn sống hông"._
_Đêm Hồng. Tất cả cue chạy như đồng hồ. {it} không cần hỏi qua bộ đàm một lần nào. {chi_dai} đứng khoanh tay, gật đầu từng cue._
_Còn bạn: không có gì để làm._
_Bạn nằm dài trên bãi cỏ sau sân khấu, hai tay gối đầu. Lần đầu tiên trong đời, bạn xem trọn vẹn một show mình làm ra. Từ đầu tới cuối. Không tai nghe. Không "Go!"._
_Pháo giấy nổ. Đúng lúc. Bạn không cần ra lệnh._
_Bạn mở Tóp-tóp. Video đầu tiên đang lên xu hướng: "Người đàn ông rảnh rỗi nhất Đêm Hồng". 3 triệu lượt xem._
_Trong video, một anh chàng mặc áo cam nằm trên bãi cỏ, cười một mình giữa mưa pháo giấy hồng._
_Là bạn._
_Bình luận được ghim, của một tài khoản có avatar màu hồng: "Lần sau tới sớm vậy nữa nha. Anh chờ ở hàng ghế đầu."_
-> END

// ------------------------------------------------------------
// 😢 4. NƯỚC TỚI CỔ
=== chua_te_deadline_kt_nuoc_toi_co ===
# ngay:31 # gio:19:58 # noi:san_khau_dem_hong
_19 giờ 58. Còn 2 phút mở màn._
_Cue sheet trên tay bạn có {vu_cue_sheet} dòng. Dòng cuối viết dở: "Cue {vu_cue_sheet}: đèn… (hỏi {it})"._
it: *(bộ đàm)* Cue 1?
chua_te_deadline: … Đèn… tắt. Go.
_Đèn tắt. Ổn. Cue 2 ổn. Cue 3 ổn. Rồi tờ giấy hết chữ._
it: *(bộ đàm)* Pháo giấy khi nào?
_Bạn nhìn lên sân khấu. Nguyên đang hát. Bạn không nhớ đây là câu nào. Câu nào nghe cũng giống câu cuối._
chua_te_deadline: Go!
_Pháo nổ. Đúng lúc Nguyên đang hát câu buồn nhất. Cả khán đài giật mình. Ai đó cười. Rồi nhiều người cười._
_Nguyên đứng giữa mưa pháo giấy, ngơ ngác, cố tạo dáng cho đỡ quê._
chi_dai: *(bộ đàm, rất bình tĩnh, bình tĩnh đáng sợ)* Từ giờ chị cầm cue. Em đứng đó.
_Bạn đứng đó tới hết show. Tai nghe vẫn đeo, nhưng không ai gọi bạn nữa._
_Sáng thứ 2, 7 giờ 45, điện thoại sáng lên._
hr: Em rảnh không, lên phòng anh uống trà xíu.
_Lần này bạn không đi trễ. Bạn tới lúc 7 giờ 50, ngồi chờ trước cửa phòng HR. Kệ trà 40 loại. Hôm nay là trà chữ "Z"._
_Lần đầu tiên trong đời bạn tới sớm. Và đó là lần duy nhất bạn ước gì mình tới trễ._
-> END

// ------------------------------------------------------------
// 😢 5. FILE GỐC
=== chua_te_deadline_kt_file_goc ===
# ngay:31 # gio:22:40 # noi:cong_cong_ty
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
_Bạn đi ngang gầm cầu thang._
_{cho} đang nằm đó, gặm gặm một vật nhỏ. Một cái USB không nhãn. Mùi cà phê sữa đá._
cho: *(ngẩng lên nhìn bạn, vẫy đuôi)* Gâu.
_Bạn đứng nhìn cái USB rất lâu. Rồi bạn cười. Cười thật to, tới mức {bac_bao_ve} phải ló đầu ra khỏi chòi._
bac_bao_ve: Bác… bác không thấy gì đâu.
_Lần này, bác nói câu đó rất nhỏ. Như một lời xin lỗi._
-> END

// ------------------------------------------------------------
// 😢 6. PR THÔI MÀ
=== chua_te_deadline_kt_pr_thoi_ma ===
# ngay:31 # gio:23:30 # noi:phong_gac_quan_bida
_Đêm Hồng kết thúc. Chiến dịch có thể thành công. Bạn có thể được khen. {hong_hot} gửi bạn ảnh chụp màn hình con số người theo dõi, kèm 7 cái icon pháo hoa._
_Bạn về phòng gác. Dưới nhà, quán bida đông nghẹt người ăn mừng Halloween. Tiếng bi lách cách._
_Không có tin nhắn nào từ {sieu_nhan_hong}. Từ sau đêm livestream, chỉ có đúng một tin, lúc 23 giờ 47 đêm 27/10. Rồi thôi._
_Sáng 1/11. Bạn đi làm. 8 giờ 20, như thường lệ._
_Trên bàn bạn không có quà hồng. Không bút. Không ly. Không gối. Không hộp cơm._
_Chỉ có một mẩu giấy viết tay. Chữ tròn tròn, quen thuộc._
_"Anh hiểu rồi. Cảm ơn em đã làm show cho anh. —N"_
_Không phải "SNH". Là "N". Lần đầu tiên Nguyên ký tên thật. Và đó là lần cuối._
* [📱 Mở Tóp-tóp.]
    _Bạn lướt. Lướt. Lướt. Video mèo. Video nấu mì. Video "Producer phũ nhất năm", 4 triệu lượt xem._
* [💌 Mở khung chat với {sieu_nhan_hong}.]
    _Bạn gõ: "Anh ơi". Rồi xóa. Gõ: "Em xin lỗi". Rồi xóa. Khung chat trống. Ô nhập chữ nhấp nháy, chờ một deadline không bao giờ tới._
- _Lần đầu tiên trong đời, chẳng video nào làm bạn cười._
_Cây bút highlight hồng đầu tiên vẫn nằm trong ngăn kéo. Bạn mở ngăn kéo, nhìn nó, rồi đóng lại._
_Ngày 31/10 trên tờ lịch vẫn khoanh hồng. Màu đó giờ nhìn giống một vết bút xóa không hết._
-> END
