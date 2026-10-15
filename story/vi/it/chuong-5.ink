// ============================================================
// IT: BẢO · CHƯƠNG 5: "THANH TRA Ổ CỨNG" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== it_2110_confession_the_chap ===
# ngay:21 # gio:09:00 # noi:phong_hr # bat_buoc
_Sáng 21/10. Trang Confession đăng bài ẩn danh: "Có ai biết biệt thự của sếp đang thế chấp ngân hàng không? Hạn 15/11 đó."_
_{hr} mời bạn lên phòng HR. Có trà. Trà ngon. Chuyện thì không ngon._
hr: Anh {it} ơi, em chỉ muốn lắng nghe thôi. Anh giúp em truy người gửi bài này nha. Sếp đang… không chill.
_Bạn mở log. Bài được đăng từ "NGAN-LAPTOP", như mọi khi. Nhưng {hong_hot} chỉ là người đăng. Người gửi bài qua form ẩn danh là một người khác._
* [📜 Truy ngược form gửi bài.]
    ~ it_truy_cap(5)
    { ran_thu_hai == "thanh_ninh":
        _Form được gửi từ bàn trợ lý giám đốc. Máy của {thanh_ninh}. Đúng 23:59._
    - else:
        { RANDOM(1, 10) <= 5:
            _Form được gửi từ bàn trợ lý giám đốc. Máy của {thanh_ninh}. Đúng 23:59._
        - else:
            _Form được gửi từ máy của {ten(ran_thu_hai)}, qua một mạng ảo đặt ở… khu Ven Đô. Ngay tòa nhà kính màu xanh lá chuối._
            ~ phat_hien(ran_thu_hai_lo_mat)
        }
    }
    hr: Anh thấy gì hông anh?
    ** [😇 Nói tên người gửi, giữ kín tên {hong_hot}.]
        hr: Em ghi nhận. Cảm ơn anh. Anh không nhắc tới trang admin là em hiểu anh đang bảo vệ ai đó. Em cũng… lắng nghe chuyện đó.
        ~ qh("hr", 10)
        ~ it_cam_on()
        ~ it_lt(3)
    ** [🤐 "Không truy được."]
        hr: *(cười)* Anh {it} hông biết nói dối đâu. Nhưng em tôn trọng.
        ~ qh("hr", -5)
        ~ it_lt(5)
    ** [📜 Khai hết: cả người gửi lẫn máy {hong_hot}.]
        hr: Hai người lận hả anh. Ok. Em mời cả hai lên uống trà.
        ~ qh("hong_hot", -50)
        ~ qh("hr", 15)
        ~ it_lt(-10)
        { it_giu_bi_mat_ngan:
            _{hong_hot} nhắn: "Anh giữ cho tui cả tháng nay, sao giờ anh nói?" Bạn không trả lời được._
            ~ it_giu_bi_mat_ngan = false
            ~ it_bi_phat_hien_doc_trom = true
            ~ it_nguoi_to = "hong_hot"
        }
* [👁️ Mở luôn hộp tin nhắn riêng của người gửi, đọc cho chắc.]
    ~ it_doc_tin_rieng()
    ~ it_truy_cap(5)
    _Bạn đọc. Tin nhắn riêng, ảnh chụp màn hình, cả những đoạn chẳng liên quan gì tới bài đăng. Bạn đọc nhiều hơn mức cần._
    { RANDOM(1, 10) <= 4:
        { ran_thu_hai == "thanh_ninh" or RANDOM(1, 2) == 1:
            ~ it_nguoi_to = "thanh_ninh"
        - else:
            ~ it_nguoi_to = ran_thu_hai
        }
        _Tối đó, {ten(it_nguoi_to)} nhận được thông báo "Tài khoản của bạn vừa được truy cập từ máy SERVER-IT". {ten(it_nguoi_to)} chụp màn hình lại._
        ~ it_bi_phat_hien_doc_trom = true
        ~ qh(it_nguoi_to, -30)
    }
    hr: Anh thấy gì hông anh?
    it: Thấy nhiều quá.
    ~ qh("hr", 3)
* [💬 "Đọc nội dung trước đã. Có đúng không?"]
    hr: *(ly trà khựng lại giữa không trung)* …Em hông biết anh ơi. Mà nếu đúng thì sao?
    it: Thì người gửi không có lỗi.
    _{hr} nhìn bạn rất lâu. Rồi rót thêm trà, không nhắc chuyện truy tìm nữa._
    ~ qh("hr", 5)
    ~ it_lt(5)
- { nguoi_theo_doi < 500000:
    _Chiều đó, tin đồn "cắt giảm nhân sự nếu Siêu Nhân Hồng thất bại" chính thức lan khắp công ty. Mốc 3 đã trượt._
    ~ cang_thang(10)
- else:
    _Chiều đó, {hong_hot} khoe trong group: qua mốc 3, 500.000 người theo dõi. Group có 1 phút vui trước khi quay lại chuyện biệt thự._
}
-> END

// ------------------------------------------------------------
=== it_2210_vu_mat_file ===
# ngay:22 # gio:00:30 # noi:phong_server # bat_buoc
_0 giờ 30 sáng. Có tiếng gõ cửa phòng server. Lần đầu tiên trong đời, {chua_te_deadline} đứng đó mà không cười._
chua_te_deadline: Anh {it}… em nói cái này anh đừng la nha. File gốc dự án quảng cáo hồi tháng 6… em làm mất rồi. Sáng mai đoàn thuế đòi bằng chứng nghiệm thu.
* [💾 "Đưa ổ đây. Đi mua mì."]
    chua_te_deadline: Dạ! Mì gì anh? Mì ly hay mì gói?
    it: Cả hai.
    _Bạn cắm cái ổ cứng cũ của {chua_te_deadline}. Màn hình hiện ra một lưới ô vuông như bãi mìn. Đêm nay sẽ dài._
    ~ nghi(-40)
    -> it_mg_cuu_file
* [😐 "Ủa alo? Tháng 6 mà giờ mới nói?"]
    chua_te_deadline: Thì… nước tới chân mới nhảy mà anh. Mà giờ nước tới cổ rồi.
    ~ qh("chua_te_deadline", -5)
    ** [💾 "Đưa ổ đây."]
        ~ nghi(-40)
        -> it_mg_cuu_file
    ** {it_biet_o_cung} [🔒 "Khoan. Ở nhà anh có cái ổ ghi 'KHÔNG ĐƯỢC MỞ'…"]
        -> it_2210_o_cung
* {it_biet_o_cung} [🔒 "Khoan. Ở nhà anh có cái ổ cứng ghi 'KHÔNG ĐƯỢC MỞ'…"]
    -> it_2210_o_cung

= it_2210_o_cung
_Hai người phóng xe về Hẻm 69 lúc 1 giờ sáng. Bà Tư chủ trọ thức dậy hỏi "nay mùng mấy rồi con?". Bạn cắm cái ổ cứng vào máy._
_Một cây thư mục hiện ra: sao lưu tự động toàn bộ máy chủ {cong_ty}, từ năm 2016 tới giờ. Bạn của năm 2016 thật chu đáo._
_Thư mục "2026-06": file gốc của {chua_te_deadline}, nguyên vẹn. Và một thư mục khác: "CongVien_2015_moc"._
chua_te_deadline: *(ôm chầm lấy bạn)* ANH LÀ THẦN! Em nợ anh cả đời! Không, nợ anh 10 hộp pizza!
~ it_cuu_file_vu = true
~ it_nhanh_ban_thu_moc = true
~ it_co_o_cung = true
~ qh("chua_te_deadline", 30)
~ it_cam_on()
~ phat_hien(usb_cua_vu)
_Bạn mở thư mục "CongVien_2015_moc". Một bản thu chưa qua phối khí. Giọng {idol_het_thoi} năm 19 tuổi, hát "Công Viên" với cây guitar thùng và tiếng xe máy chạy ngoài cửa sổ._
_Bạn nghe hết bài. Rồi nghe lại lần nữa._
-> END

// ------------------------------------------------------------
=== it_2210_kiem_tra_thue ===
# ngay:22 # gio:09:30 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế tới bất ngờ. Trưởng đoàn là Chú Liêm, 55 tuổi, cặp da đen, mắt nhìn sổ sách như nhìn bài kiểm tra._
_Cả công ty giả vờ làm việc chăm chỉ. {chua_te_deadline} lần đầu mở Excel. {dan_dau_tu} tắt chart._
_{ke_toan} kéo bạn ra góc, giọng run run._
ke_toan: Ông {it}… đoàn xin xem máy tính kế toán. Ông làm cho máy chạy… chậm chậm một chút được hông? Tui cần thời gian sắp xếp.
* [😇 "Không. Bà nói thật đi."]
    ke_toan: Nói thật? Nói thật là… quỹ công ty còn 2 tỷ, hợp đồng BTT thì tui chưa thấy bản gốc, còn dự án tháng 6…
    it: Nói vậy luôn.
    _{ke_toan} hít một hơi, rồi bước ra nói thật với Chú Liêm. Chú Liêm gật đầu, ghi chép, không nổi giận._
    chu_liem: Nói thật thì dễ làm việc. Cô làm sổ sách sạch đấy.
    ~ qh("ke_toan", 10)
    ~ it_lt(10)
* [🐢 Làm máy chạy chậm một chút.]
    _Bạn mở 40 tiến trình chạy ngầm. Máy kế toán bò như rùa. Chú Liêm ngồi chờ 15 phút, rồi nhìn bạn._
    chu_liem: Cậu là IT à? Máy này lỗi gì?
    it: Lỗi người dùng.
    chu_liem: Người dùng nào?
    _Câu hỏi rất hay. Bạn không có câu trả lời hay._
    ~ qh("ke_toan", 10)
    ~ it_lt(-15)
    ~ it_do_toi(15)
* [🤝 "Tui ngồi cạnh bà. Hỏi gì tui mở."]
    _Bạn ngồi cạnh {ke_toan}, mở từng thư mục nhanh như chớp. Không chậm, không giấu, chỉ là… rất gọn gàng._
    ~ qh("ke_toan", 15)
    ~ uy_tin = uy_tin + 5
- chu_liem: Còn bằng chứng nghiệm thu dự án tháng 6, 800 triệu. File gốc đâu?
{ it_cuu_file_vu:
    _Bạn cắm USB, mở file. Chú Liêm xem 3 phút, gật đầu, ký biên bản. {chua_te_deadline} đứng ở cửa, giơ ngón cái run run._
    ~ uy_tin = uy_tin + 10
    ~ qh("giam_doc", 10)
- else:
    _Không ai trả lời. Chú Liêm ghi một dòng dài vào sổ. {giam_doc} đổ mồ hôi dù điều hòa đang chạy._
    ~ cang_thang(10)
}
_Đúng lúc đó, {cho} chạy vào phòng, vẫy đuôi. Chú Liêm nhảy lên ghế._
chu_liem: Con… con chó! Ai cho chó vào đây!
* [🐾 Bế {cho} ra ngoài.]
    ~ qh("cho", -3)
    chu_liem: *(lau mồ hôi)* Cảm ơn cậu. Cậu IT này được.
    ~ it_cam_on()
* [😶 Để {cho} ở lại thêm chút.]
    _Chú Liêm kiểm tra phần còn lại nhanh gấp ba, vừa kiểm vừa nhìn chân mình._
    ~ qh("cho", 5)
    ~ qh("ke_toan", 5)
- -> END

// ------------------------------------------------------------
=== it_2210_ban_thu_moc ===
# ngay:22 # gio:21:00 # noi:phong_server # dieu_kien:it_nhanh_ban_thu_moc
{ not it_nhanh_ban_thu_moc:
    -> END
}
_Tối. Bạn ngồi trong phòng server, bản thu "CongVien_2015_moc" mở trên màn hình. Bốn phút mười hai giây của một người 19 tuổi chưa biết mình sẽ nổi tiếng._
_Bạn có thể đưa nó cho ai đó. Hoặc giữ._
* [🎤 Gửi cho {idol_het_thoi}.]
    ~ it_ban_thu_cho = "idol_het_thoi"
    _Bạn nhắn: "Của anh. Năm 2015." Kèm file. Mười phút sau, {idol_het_thoi} gọi tới. Không nói gì. Chỉ có tiếng thở._
    idol_het_thoi: Anh… quên mất là anh từng hát như vậy. Cảm ơn em. Thật đó.
    ~ qh("idol_het_thoi", 30)
    ~ it_cam_on()
* [🦉 Gửi cho {editor}, người đang dựng video "16 năm".]
    ~ it_ban_thu_cho = "editor"
    editor: *(nghe xong, im lặng rất lâu)* Anh {it}… em làm được một cái video "16 năm" thật sự rồi. Có cái này là đủ.
    ~ qh("editor", 25)
    ~ follow(20000)
    ~ it_cam_on()
* [💾 Giữ lại. Dán thêm một nhãn: "Chưa tới lúc."]
    ~ it_ban_thu_cho = ""
    _Bạn tắt file. Có những thứ cần được giữ, và có người cần giữ chúng._
    ~ it_lt(5)
- -> END

// ------------------------------------------------------------
=== it_2310_chuan_bi_livestream ===
# ngay:23 # gio:14:00 # noi:studio
_Sinh nhật {sieu_nhan_hong}. Chiều, bạn đi dây cho buổi livestream tối nay. Studio đầy bóng bay hồng, mỗi bước chân là một tiếng "bụp"._
_{sieu_nhan_hong} lén vào studio, đóng cửa, giọng nhỏ hẳn so với mọi khi._
sieu_nhan_hong: Ông {it}… ông là IT. Ông có biết… làm sao biết một người đã đọc tin nhắn của mình chưa? Mà người ta không bật "đã xem"?
_Bạn biết tin nhắn đó gửi cho ai. Cả công ty biết. Chỉ có người nhận là chưa biết._
* [😇 "Không biết được. Hỏi thẳng đi."]
    sieu_nhan_hong: Hỏi thẳng… ờ… ừ. Tối nay. Trên livestream. Ông thấy sao?
    it: Mạng em lo. Còn lại ông lo.
    sieu_nhan_hong: *(cười, kéo mũ xuống)* Deal!
    ~ qh("sieu_nhan_hong", 10)
* [📜 "Đưa tên. Tui coi log."]
    sieu_nhan_hong: Thôi… thôi khỏi. Coi lén vậy kỳ lắm. Hồng là thái độ mà, phải đường đường chính chính.
    _{sieu_nhan_hong} đi ra. Bạn nhận ra mình vừa được một siêu nhân dạy đạo đức nghề nghiệp._
    ~ it_lt(3)
- _Bạn quay lại với đống dây. Đêm nay 10.000 người sẽ xem. Có thể hơn._
* [📱 Cài sẵn điểm phát 4G dự phòng, tự động nhận khi rớt mạng.]
    ~ it_on(10)
    ~ tien_cong(-100000)
    _Mất 40 phút và một gói 4G lớn. Nhưng nếu có chuyện, máy livestream sẽ tự chuyển trong 1 giây._
* [🐾 Rào dây mạng bằng băng keo dưới sàn, phòng {cho}.]
    ~ it_on(5)
    _Bạn dán băng keo đen dọc sàn. Nhìn như hiện trường vụ án. {sales} đi ngang hỏi "ai chết vậy anh?"._
- -> END

// ------------------------------------------------------------
=== it_2310_livestream_sinh_nhat ===
# ngay:23 # gio:19:00 # noi:studio # bat_buoc
_Sinh nhật {sieu_nhan_hong}, 31 tuổi, kiêm livestream lớn. Studio toàn bóng bay hồng. Bánh kem hồng ba tầng đặt giữa bàn._
_Ai đó phải đóng vai "Mr. Kevin Trộn" của BTT Global để lên sóng chúc mừng. {sales} đứng nhìn quanh tìm người với ánh mắt tuyệt vọng._
_10.000 người đang xem. Rồi 12.000._
sieu_nhan_hong: Cảm ơn mọi người! Hôm nay em có một điều muốn nói… với một người…
sieu_nhan_hong: {chua_te_deadline} ơi… em thích anh. Không phải PR đâu. \#VũƠiTrảLờiĐi
_Bình luận nổ tung. Server nóng ran. Đúng lúc đó, {cho} lao vào bánh kem, kéo theo sợi dây mạng chạy ngang sàn._
_Màn hình livestream đứng hình. Bạn có 5 giây._ # hen_gio:5
* [🔌 Nhào tới cắm lại dây.]
    _Bạn trượt trên kem hồng, nhưng tay vẫn kịp cắm sợi dây vào. Livestream sống lại sau 4 giây._
    ~ follow(40000)
    ~ it_livestream_23_on = true
    ~ qh("hong_hot", 10)
    hong_hot: Anh {it} trượt kem mà vẫn cắm trúng cổng! Huyền thoại!
* [📱 Chuyển sang phát 4G dự phòng.]
    { it_on_dinh >= 60:
        _Điểm phát 4G bạn cài sẵn từ chiều tự động nhận. Livestream chỉ khựng 1 giây._
        ~ follow(35000)
        ~ it_livestream_23_on = true
    - else:
        _Điểm phát 4G chưa được cài sẵn. Mất 30 giây để bật. 30 giây đó, 4.000 người rời đi._
        ~ follow(-10000)
        ~ it_do_toi(10)
    }
* [⏱️ (Không chọn kịp)]
    _Livestream rớt hẳn. Khi lên lại, {sieu_nhan_hong} mặt đầy kem, {chua_te_deadline} đã biến mất, bánh nằm dưới sàn._
    ~ follow(-30000)
    ~ it_do_toi(15)
    ~ it_su_co_am_thanh = true
    { RANDOM(1, 10) <= 3:
        _Rồi tấm ảnh chụp màn hình "Siêu Nhân Hồng đứng hình với mặt dính kem" thành meme._
        ~ follow(10000)
    }
- _Cái bánh kem đã đổ. Nhưng chữ \#VũƠiTrảLờiĐi đang lên xu hướng._
-> END

// ------------------------------------------------------------
=== it_2410_ban_chu_no ===
# ngay:24 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Bạn được xếp vào một bàn đặc biệt: bàn chủ nợ của {dan_dau_tu}._
_Quanh bàn: {sales}, Bác {bac_bao_ve}, {con_ong_chau_cha}, {thanh_xin_nghi}, {thuc_tap_sinh}, {bien_kich}, {idol_het_thoi}. Và bạn. 3.000.000đ._
chi_dai: Rồi. Anh {dan_dau_tu}, mời anh trình bày. Ai ngắt lời thì ra ngoài.
dan_dau_tu: *(nhìn quanh bàn)* Tui… tui xin lỗi. Tui không có tiền. Tui chỉ có cái nghề đọc số.
_Cả bàn im lặng. Mọi người nhìn nhau. Rồi nhìn bạn, vì bạn là người ít nói nhất, nên ai cũng tò mò bạn sẽ nói gì._
* [💬 "Thì đọc số trả nợ."]
    _{dan_dau_tu} ngẩng đầu. {sales} gật gù. {con_ong_chau_cha} vỗ tay. Bác {bac_bao_ve} rót trà._
    sales: Đúng rồi! Anh làm báo cáo thật cho em, trừ nợ dần!
    idol_het_thoi: Anh lọc giùm em… mấy cái tài khoản… ờ, em trả công.
    dan_dau_tu: *(giọng khàn)* Cảm ơn em, {it}.
    ~ qh("dan_dau_tu", 20)
    ~ qh("chi_dai", 10)
    ~ it_cam_on()
* [🤝 "Ba triệu của em, xóa."]
    dan_dau_tu: Không được! Anh…
    it: Đổi lại. Anh dạy em đọc chart. Để biết đừng bao giờ mua.
    _Cả bàn cười. Lần đầu tiên trong buổi hòa giải, có người cười._
    ~ qh("dan_dau_tu", 25)
    ~ qh("bac_bao_ve", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [😶 Uống trà.]
    _Bạn uống trà. Trà ngon. Hội nghị kéo dài thêm 1 tiếng._
- -> END

// ------------------------------------------------------------
=== it_2410_clip_trong_toi ===
# ngay:24 # gio:20:00 # noi:phong_server
_Clip {idol_het_thoi} hát "Công Viên" trong pantry tối ngày mất điện đột nhiên nổ tung. Một triệu lượt xem trong 6 tiếng._
_Cùng lúc, một trang "bóc phốt" tung tin {idol_het_thoi} thuê 80.000 fan ảo. Trang fanpage {cong_ty} bị spam bình luận._
_Hệ thống lọc bot của bạn đang kêu bíp bíp. Danh sách tài khoản ảo hiện ra, đuôi giống hệt nhau: "Anh {idol_het_thoi} đỉnh nóc kịch trần"._
* [🧹 Lọc sạch bot, khóa tài khoản ảo, không công bố gì.]
    _Bạn khóa 80.000 tài khoản trong lặng lẽ. Lượt theo dõi trang giảm một chút, nhưng sạch._
    ~ follow(5000)
    ~ qh("idol_het_thoi", 10)
    ~ it_on(5)
    ~ phat_hien(fan_ao_phat)
* [💬 Nhắn riêng cho {quan_ly_idol}: "Bot này của ai, anh biết."]
    quan_ly_idol: Khoan, anh nghe máy… À không, anh đọc tin. Ừ. Anh biết. Để anh lo. Đừng ai đăng gì hết.
    _Mười phút sau, trang bóc phốt tự xóa bài. Bạn không hỏi {quan_ly_idol} làm cách nào._
    ~ qh("quan_ly_idol", 15)
    ~ phat_hien(fan_ao_phat)
* [📜 Đăng danh sách lên group công ty cho minh bạch.]
    _Group nổ tung. {idol_het_thoi} rời group. Clip trong bóng tối vẫn viral, nhưng bình luận giờ là "Hát hay mà thuê fan ảo làm gì?"._
    ~ qh("idol_het_thoi", -40)
    ~ follow(-20000)
    ~ scandal()
    ~ it_lt(-5)
- -> END

// ------------------------------------------------------------
=== it_2510_nha_vuon_ven_do ===
# ngay:25 # gio:15:00 # noi:nha_vuon_bac_binh
_Chủ nhật. Bác {bac_bao_ve} nhờ bạn ra nhà vườn Ven Đô sửa cái TV "chỉ hiện toàn muỗi". {cho} chạy trước dẫn đường._
_Nhà nhỏ, vườn rau, bể cá. Trong góc là một cái tủ gỗ cũ khóa kỹ. Trên nóc tủ có một chồng phong bì, tem nước ngoài._
bac_bao_ve: Cháu cứ sửa đi. Bác pha trà.
* [📺 Chỉ sửa TV. Không nhìn tủ gỗ.]
    _Bạn chỉnh lại đầu thu, dò lại kênh. TV hiện rõ chương trình cờ tướng. Bác {bac_bao_ve} cười tít mắt._
    bac_bao_ve: Cháu là đứa duy nhất bác cho vào nhà này sửa đồ đấy.
    ~ qh("bac_bao_ve", 10)
    ~ it_lt(5)
* {qh_bac_bao_ve >= 80} [🔒 "Bác ơi, mấy cái thư tay bác nhận… con thấy đóng dấu bưu điện nước ngoài."]
    _Bác {bac_bao_ve} đặt ấm trà xuống. Im lặng rất lâu. {cho} cũng im._
    bac_bao_ve: Bác không thấy gì đâu. Mà cháu cũng không thấy gì nhé.
    it: Dạ. Con không thấy.
    bac_bao_ve: *(gật đầu chậm)* Ừ. Người giữ được miệng thì bác quý. Ông ấy cũng quý.
    ~ it_nhanh_nguoi_gui_thu = true
    ~ phat_hien(binh_tai_mat_g)
    ~ qh("bac_bao_ve", 10)
* [🐍 Lúc bác đi pha trà, liếc nhanh con tem trên phong bì.]
    _Tem nước ngoài. Người gửi chỉ ghi một chữ "G". Bạn nhìn đúng 2 giây rồi quay đi, tim đập nhanh._
    ~ it_lt(-5)
    ~ phat_hien(binh_tai_mat_g)
    bac_bao_ve: *(từ trong bếp)* Cháu tìm gì đấy?
    it: Remote ạ.
- ~ uong(25)
~ an(20)
~ cang_thang(-15)
-> END

// ------------------------------------------------------------
=== it_2610_chieu_thu_phim ===
# ngay:26 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Sáng giao ban, tin đồn "cắt giảm nếu Siêu Nhân Hồng thất bại" lan khắp công ty. Chiều, chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". Bạn lo máy chiếu._
_Máy chiếu lần này chạy ngon. Bạn đã tắt đi bật lại nó 3 lần từ sáng, để chắc._
_Phim chiếu tới cảnh người mặc đồ hồng đẩy chiếc xe chết máy trong mưa. Bạn nghe tiếng ghế bên cạnh rung nhẹ: {thuc_tap_sinh} đang nắm chặt tay vịn._
thuc_tap_sinh: *(thì thầm)* Dạ… cái này… là chuyện của em mà anh…
* [💬 "Của em à?"]
    thuc_tap_sinh: Dạ… em kể cho chị {bien_kich} hồi tháng 9. Ngày em bỏ ngân hàng, có người mặc đồ hồng đẩy xe cho em 2 cây số…
    _Trên màn hình, chữ "Kịch bản: {bien_kich}" hiện lên. {thuc_tap_sinh} cúi đầu._
    ~ phat_hien(nguoi_gac_ket)
    ~ qh("thuc_tap_sinh", 10)
* [🔦 Đưa {thuc_tap_sinh} tờ khăn giấy, không hỏi gì.]
    thuc_tap_sinh: Dạ em cảm ơn anh… em không sao ạ… phim hay quá thôi ạ…
    ~ qh("thuc_tap_sinh", 10)
- _Phim hết. Cả phòng vỗ tay. {giam_doc} đứng lên, nói một câu khiến cả phòng nín thở:_
giam_doc: Phim hay. Còn {editor}, kênh Diu-túp "Cú Đêm" của em ấy, anh trả 200 triệu, em bán cho công ty nhé. Anh không ép.
_{editor} đứng hình. Bạn là người duy nhất biết từ lâu cái kênh đó của ai, vì bạn thấy nó trong log upload mỗi đêm lúc 3 giờ sáng._
-> END

// ------------------------------------------------------------
=== it_2710_loi_moi_ll ===
# ngay:27 # gio:12:15 # noi:quan_ca_phe_song_ao # bat_buoc
_Quán cà phê Sống Ảo. Lưu Lực mặc vest trắng, tóc vuốt keo, ngồi ở góc đẹp nhất, như đang chờ chụp ảnh bìa tạp chí._
luu_luc: {it} à, người giỏi không nên ngồi trong phòng server ăn mì ly. Bên anh có phòng IT 20 người, router đời mới nhất.
luu_luc: Trưởng phòng Công nghệ. 26 triệu một tháng, gấp đôi. Anh chỉ cần cái log lịch trình của {sieu_nhan_hong} bốn ngày tới thôi.
_Bạn nhìn ly cà phê. Rồi nghĩ tới cái router quấn băng keo, giờ đang nằm trên kệ phòng server như một chiến binh già._
* [🚪 "Dạ cảm ơn anh. Em quen router quấn băng keo rồi."]
    _Bạn đứng dậy, trả tiền ly cà phê của mình, đi về._
    luu_luc: *(nói với theo)* Người thông minh sẽ đổi ý trước 31 đấy!
    ~ it_tu_choi_ll = true
    ~ it_lt(15)
    { qh_chi_dai >= 30:
        _Tối đó {chi_dai} biết chuyện, không biết từ ai. Chị chỉ nhắn: "Thằng này được."_
        ~ qh("chi_dai", 15)
    }
* [💰 "Gửi qua email nha anh."]
    _Bạn gửi một file log. 15 giây. Rồi nhận 5.000.000đ "tiền cà phê"._
    ~ it_gui_log_ll = true
    ~ tien_cong(5000000)
    ~ it_lt(-50)
    ~ follow(-50000)
    _Trên đường về, bạn đi ngang chòi bảo vệ. Bác {bac_bao_ve} nhìn bạn, không nói gì. Bạn không dám nhìn lại._
* [📜 Lén ghi âm cuộc nói chuyện, mang về đưa {giam_doc}.]
    it: Em suy nghĩ thêm.
    luu_luc: Được. Anh chờ.
    _Về công ty, bạn đặt điện thoại lên bàn {giam_doc}, bấm phát. Giọng Lưu Lực vang khắp phòng._
    giam_doc: *(mặt đỏ dần)* Thằng… thằng này nó câu cả người của anh. Em làm tốt lắm, {it}.
    ~ it_ghi_am_ll = true
    ~ it_tu_choi_ll = true
    ~ uy_tin = uy_tin + 20
    ~ qh("giam_doc", 15)
    ~ it_lt(5)
    _Từ chiều, cả công ty gọi bạn là "người của sếp". Bạn không biết nên vui hay buồn._
- -> END

// ------------------------------------------------------------
=== it_2710_camera_cong ===
# ngay:27 # gio:16:40 # noi:phong_server
_Bạn đang upload trailer phim ngắn thì camera cổng báo có chuyển động. Một chiếc xe màu trắng dừng trước cổng._
_Lưu Lực bước xuống, ôm tập hồ sơ, đi thẳng vào sảnh. Đúng lúc đó {chi_dai} đi ra từ thang bộ._
_Trên màn hình camera, Lưu Lực khựng lại, làm rơi tập hồ sơ. Giấy bay tứ tung. {chi_dai} nhìn Lưu Lực, khoanh tay, không nói một chữ._
_Lưu Lực nhặt giấy, quay lưng đi thẳng ra xe._
* [💾 Lưu đoạn camera này lại.]
    _Bạn lưu vào thư mục "Bang_chung". Bạn không biết để làm gì, nhưng IT thì cái gì cũng lưu._
    ~ it_truy_cap(5)
* [😶 Xóa. Chuyện riêng của chị {chi_dai}.]
    _Có những chuyện cũ không nên nằm trên ổ cứng._
    ~ it_lt(3)
    ~ qh("chi_dai", 5)
- _Thanh upload trailer: 100%. Dòng chữ "Kịch bản: {bien_kich}" lên mạng cùng lúc._
~ follow(15000)
-> END
