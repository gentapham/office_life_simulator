// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · CHƯƠNG 2: "KHÁM MẮT" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== editor_0510_hoa_thay_co ===
# ngay:5 # gio:13:05 # noi:phong_dung_phim # bat_buoc
_Ngày Nhà giáo Thế giới. Bạn tới công ty lúc 13 giờ, đúng giờ cú. Trên bàn phím có một bông hồng và một tấm thiệp viết tay._
_"Dạ em cảm ơn anh {editor} đã dạy em bấm nút render ạ. Em {thuc_tap_sinh}."_
_Bạn có dạy thật. Một lần. Lúc 2 giờ sáng, khi {thuc_tap_sinh} ở lại photo tài liệu, và bạn chỉ cho anh ấy phím tắt để xuất file._
_Tin nhắn của {truong_phong} gửi lúc 8:31: "{editor} vắng họp giao ban. Anh note lại: MV cần thêm cảnh anh chỉ tay nhé."_
* [🤝 Qua bàn {thuc_tap_sinh}: "Tối nay anh rảnh hông? Em dạy anh soát phụ đề."]
    thuc_tap_sinh: Dạ rảnh ạ! Em rảnh cả đời ạ!
    ~ qh("thuc_tap_sinh", 15)
    _Bạn có thêm một đồng đội ca đêm. Một đồng đội 30 tuổi, mang theo mì gói và sự nhiệt tình đáng sợ._
* [🌹 Cắm bông hồng vào cốc "RENDER" trên bàn.]
    ~ cang_thang(-5)
    _Cái cốc ghi chữ RENDER giờ có một bông hồng. Phòng dựng tối om có một chấm đỏ. Đẹp như một khung hình cần giữ lại._
    ~ nhan(hoa_hong)
* [😴 Đọc xong, gục xuống ngủ thêm 30 phút.]
    ~ nghi(15)
    _Tấm thiệp dính vào má bạn khi bạn ngẩng dậy. {thuc_tap_sinh} đi ngang, thấy vậy, cảm động muốn khóc._
    ~ qh("thuc_tap_sinh", 5)
- _Bạn mở tin nhắn của {truong_phong} lần nữa. "Cảnh anh chỉ tay." Bạn mở thư mục "Cảnh_anh_Nhật_chỉ_tay", trong đó đã có 23 file._
-> END

// ------------------------------------------------------------
=== editor_0610_chup_poster ===
# ngay:6 # gio:15:30 # noi:phong_dung_phim # bat_buoc
_Buổi chụp poster sáng nay bể kèo: {sieu_nhan_hong} bỏ ngang để đi giúp một bà cụ đẩy xe chè. Cả đoàn ngồi chờ ba tiếng._
_Nhưng {hong_hot} quay được hết bằng điện thoại. 4 phút rung lắc, sai màu, có cả ngón tay {hong_hot} che một góc._
quan_ly_idol: *(xông vào phòng dựng, hai điện thoại trên tay)* {editor}! Cái clip bà cụ, em cứu được hông? Phải biến cái này thành PR trước 6 giờ chiều. Đừng ai đăng gì hết khi chưa có bản của em!
* [🎨 Cứu Màu, chống rung, cắt còn 59 giây, nhạc piano nhẹ. Không thêm chữ.]
    ~ follow(30000)
    ~ uy_tin = uy_tin + 5
    ~ qh("quan_ly_idol", 10)
    ~ ed_can(3)
    ~ ed_thuc_dem()
    _Bộ đồ hồng nhìn ra hồng sang, không phải hồng chả lụa. Cảnh {sieu_nhan_hong} ăn chè bằng ống hút qua khe mũ, bạn để chậm lại đúng một nhịp._
    quan_ly_idol: *(xem xong, im ba giây)* Trời. Em… em giỏi quá. Cảm ơn em nha.
    _Ba giây im lặng đó, bạn sẽ dựng lại trong đầu cả tuần._
* [✂️ Dựng kiểu meme: nhạc hành động, chữ to "SIÊU NHÂN BỎ VIỆC ĐI ĐẨY XE".]
    ~ follow(15000)
    ~ qh("hong_hot", 10)
    quan_ly_idol: Hài ha. *(cười mệt)* Mà hơi… hơi giống chọc ảnh. Thôi đăng đi, kịp giờ là được.
* [🦉 Dựng bản đẹp, rồi giấu thêm một con cú ở khung hình thứ 812.]
    ~ follow(28000)
    ~ ed_dau_cu_chung_minh = ed_dau_cu_chung_minh + 1
    ~ qh("quan_ly_idol", 5)
    _Con cú núp sau xe chè, 1/25 giây. Một ngày nào đó, nó sẽ là bằng chứng._
- _Về sau, cái clip này được xem gấp mười hai lần cái MV. Nhưng chiều hôm đó, nó chỉ là một file tên "ba_cu_FINAL_final2.mp4"._
-> END

// ------------------------------------------------------------
=== editor_0710_moc_1 ===
# ngay:7 # gio:17:00 # noi:phong_giam_doc # bat_buoc
_Mốc 1: phải đạt 50.000 người theo dõi._
{ nguoi_theo_doi >= 50000:
    giam_doc: Đạt rồi! Mindset đúng thì kết quả đúng! Các em giỏi lắm!
    _{truong_phong} gật gù: "Clip bà cụ là ý tưởng của team mình." Team mình. Bạn ngáp._
    ~ ed_vo(3)
- else:
    giam_doc: Chưa đạt. Thế thì tối nay anh "truyền lửa" ba tiếng nhé. Anh không ép.
    _Ba tiếng. Bạn ngồi hàng cuối, ngủ trong tư thế ngồi thẳng, mắt mở hé. Kỹ năng mười năm mới luyện được._
    ~ nghi(10)
    ~ cang_thang(5)
}
* [😴 Ngủ Gật Chiến Lược tới hết buổi.]
    ~ nghi(10)
    ~ cang_thang(-5)
* [📱 Lén mở timeline MV trên điện thoại, dựng tiếp.]
    ~ uy_tin = uy_tin + 2
    ~ nghi(-5)
    _Bạn cắt được 14 giây MV trong lúc {giam_doc} kể "hồi khởi nghiệp lần một"._
- -> END

// ------------------------------------------------------------
=== editor_0810_kham_mat ===
# ngay:8 # gio:14:00 # noi:phong_kham_khoe_re # bat_buoc
_Ngày Thị giác Thế giới. {hr} bắt bạn đi khám mắt ở Phòng khám Đa Khoa Khỏe Re. "Anh lo cho đôi mắt của em thôi mà."_
_Đúng ngày phải dựng MV. Bác sĩ bật đèn. Bạn nheo mắt như con cú gặp nắng._
bac_si: Cậu đọc dòng thứ ba giúp tôi.
* [😵 Nheo mắt: "Dạ… E… hay F… hay cái ghế ạ?"]
    bac_si: Cận nặng. Kê kính. Đeo cả tuần nhé.
    ~ ed_deo_kinh = true
    ~ nghi(10)
    _Ban ngày bạn thấy rõ hơn. Rõ tới mức thấy cả quầng thâm của mình trong gương. Bạn hơi hối hận._
* [🦉 "Bác sĩ tắt đèn thử được hông?"]
    _Bác sĩ tắt đèn. Bạn đọc hết bảng. Đọc luôn dòng chữ nhỏ xíu in tên nhà sản xuất ở góc._
    bac_si: *(bật đèn lại, nhìn bạn rất lâu)* Mắt cậu là mắt cú.
    _Bác sĩ viết một tờ giấy: "Bệnh nhân nên làm việc ban đêm." Đóng dấu đỏ._
    ~ ed_co_giay_mat_cu = true
* [💬 "Dạ, anh {quan_ly_idol} cũng hay thức khuya, bác sĩ khám luôn cho ảnh được hông?"]
    bac_si: Ai cơ?
    _Bạn đỏ mặt từ cổ lên tới mũ len. Lần đầu tiên bạn nói tên {quan_ly_idol} với một người lạ, mà không vì công việc._
    ~ ed_can(3)
    bac_si: *(cười hiền)* Lần sau dẫn người ta theo. Khám đôi giảm 10%.
- _Điện thoại rung. {chua_te_deadline}: "ÔNG Ở ĐÂU? MV MAI RA MẮT. ÉT O ÉT."_
-> END

// ------------------------------------------------------------
=== editor_0810_dem_dung_mv ===
# ngay:8 # gio:22:00 # noi:phong_dung_phim # bat_buoc
_22 giờ. Phòng dựng. Còn 10 tiếng trước giờ ra mắt MV. Footage: 3 tiếng. Nhạc: 3 phút 40. Cà phê: 2 ly. Tỉnh táo: đỉnh._
chua_te_deadline: *(nằm trên sofa phòng dựng)* Tui ở đây canh ông. Có gì kêu tui. *(3 phút sau đã ngủ)*
_Tin nhắn {truong_phong}, 22:14: "Em cho cảnh anh đứng chỉ tay vào bản đồ nhé. Đoạn cao trào."_
* [✂️ Chèn cảnh {truong_phong} chỉ tay… vào đúng phách trống, thành một khoảnh khắc hài.]
    ~ qh("truong_phong", 3)
    _Anh ấy chỉ tay, nhạc "tùng", cảnh cắt sang {sieu_nhan_hong} bay người. Như thể anh ấy ra lệnh cho siêu nhân. Anh ấy sẽ thích. Khán giả sẽ cười._
* [🦉 Chèn cảnh chỉ tay, và giấu thêm con cú ngay đầu ngón tay ở giây 2:47.]
    ~ ed_dau_cu_chung_minh = ed_dau_cu_chung_minh + 1
    _Ngón tay {truong_phong} chỉ thẳng vào… một con cú đeo tai nghe. 1/25 giây. Một bằng chứng nhỏ có lông._
* [✋ Không chèn. Nhắn lại: "Dạ cảnh đó làm gãy nhịp, em xin bỏ ạ."]
    ~ qh("truong_phong", -5)
    ~ ed_can(2)
    ~ ed_vo(-3)
    _Ba chấm hiện lên. Biến mất. Rồi: "Ừ… thế cũng được. Mình take note lại nhé."_
- ~ ed_thuc_dem()
-> editor_mg_dung_mv

// ------------------------------------------------------------
=== editor_0910_mv_ra_mat ===
# ngay:9 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
{ ed_mv_kip:
    _MV ra mắt đúng giờ. Bạn xuất file lúc 7 giờ 59. 8 giờ, file lên. 8 giờ 01, bạn ngủ trên bàn phím._
- else:
    _MV ra mắt trễ ba tiếng. Cả công ty ngồi nhìn màn hình xoay vòng. {chua_te_deadline} nói "Chill" bốn lần, lần nào giọng cũng run hơn._
}
_10 giờ. Phòng họp tầng 2. {truong_phong} đứng trước màn hình lớn, tay cầm bút laser._
truong_phong: Cái MV này anh làm 3 đêm liền đấy mọi người ạ. Nhất là đoạn chuyển cảnh theo nhạc, anh tính từng khung hình.
_Cả phòng vỗ tay. Bạn ngồi hàng cuối, mũ len, quầng thâm, cốc RENDER._
chua_te_deadline: *(nói nhỏ)* Ủa {editor}, đoạn đó ông dựng mà?
* [😶 "Dạ… render xong là xong mà anh."]
    ~ ed_vo(5)
    _Không có gì xảy ra. {chua_te_deadline} lắc đầu, quay lại lướt Tóp-tóp._
* {ed_dau_cu_chung_minh >= 1} [🦉 "Anh {truong_phong} ơi, ở giây 2:47 có con cú nhỏ đó. Anh biết vì sao hông?"]
    _Cả phòng tua lại. Dừng ở giây 2:47. Một con cú đeo tai nghe, nhỏ xíu, ở đầu ngón tay {truong_phong}._
    truong_phong: À… cái đấy là… bạn {editor} hỗ trợ anh.
    hong_hot: Hỗ trợ cả con cú luôn hả anh?
    ~ ed_vo(-15)
    ~ qh("truong_phong", -20)
    ~ ed_dau_cu_chung_minh = ed_dau_cu_chung_minh + 1
    ~ ed_lo(5)
* [😴 Ngủ gật.]
    ~ cang_thang(-5)
    chi_dai: *(đắp áo khoác lên vai bạn)* Để nó ngủ. Cả công ty sống nhờ nó mà.
    ~ qh("chi_dai", 5)
* [💬 Nói nhỏ với {chua_te_deadline}: "Ông nói to giùm tui được hông?"]
    chua_te_deadline: *(nhún vai)* Tui mà nói to thì ổng hỏi file gốc tháng 6. Thôi, chill.
    ~ ed_vo(2)
- { ed_mv_dung_phach && ed_mv_kip:
    ~ follow(30000)
    _Bình luận: "MV cắt nhạc phê quá", "Ai dựng vậy, ra mắt đi!". Không ai ra mắt._
- else:
    { ed_mv_kip:
        ~ follow(15000)
    - else:
        ~ follow(5000)
    }
}
-> END

// ------------------------------------------------------------
=== editor_0910_file_thang_6 ===
# ngay:9 # gio:15:00 # noi:phong_dung_phim # bat_buoc
giam_doc: *(ghé vào phòng dựng)* {editor} à, em lấy giùm anh mấy cảnh dự án quảng cáo tháng 6 nhé. Cái hợp đồng 800 triệu ấy. Anh cần cho clip "16 năm".
_Bạn lục máy chủ. Thư mục "2026_06_QC". Trống. Chỉ có một file text: "để tạm, mai chép lại – {chua_te_deadline}"._
_Bạn quay sang. {chua_te_deadline} đang đứng ở cửa, cốc cà phê sữa đá trên tay. Hai người nhìn nhau rất lâu._
* [💬 "File gốc tháng 6 đâu ông?"]
    chua_te_deadline: *(nhìn trần nhà)* Còn sớm mà. Sếp cần tới 20/10 mới cần mà. Chill.
    editor: Ông.
    chua_te_deadline: …Tui làm rơi rồi. Ở bãi xe. Tháng 9. Đừng nói ai nha.
    ~ ed_biet_file_vu = true
    ~ qh("chua_te_deadline", 5)
* [😶 "Dạ anh, em tìm thêm." (Không nhìn {chua_te_deadline}.)]
    giam_doc: Ừ. Không gấp, nhưng gấp nhé.
    ~ qh("chua_te_deadline", 3)
-
* {ed_biet_file_vu} [🤝 "Render xong là xong. Ông nợ tui một bữa. Tui giữ bí mật."]
    chua_te_deadline: Một bữa. Không, một tuần. Một tuần cơm trưa. Ông là thánh.
    ~ qh("chua_te_deadline", 15)
* {ed_biet_file_vu} [✋ "Ông tự nói với sếp đi. Tui không gánh nữa."]
    chua_te_deadline: *(gãi đầu)* Ờ… ông nói đúng. Mà để tui chill thêm hai ngày.
    ~ ed_can(2)
* [🔎 Lặng lẽ mở log máy chủ, xem có bản sao lưu nào hông.]
    _Log có một dòng: "Sao lưu tự động: ổ ngoài, phòng server, 2016–nay". Ổ của {it}._
    ~ ed_biet_file_vu = true
- -> END

// ------------------------------------------------------------
=== editor_0910_video_tien_tay ===
# ngay:9 # gio:23:40 # noi:phong_dung_phim # bat_buoc
_Đêm. MV của {sieu_nhan_hong} đang lên xu hướng. Còn kênh của {idol_het_thoi} thì im như chùa Bà Đanh. Video mới nhất: 312 lượt xem, 300 trong đó là tài khoản ảo._
_Bạn biết {quan_ly_idol} đang lo. Anh ấy đăng story lúc 23:12: một ly cà phê, không caption._
* [🎁 Video Tiện Tay: dựng lại một đoạn {idol_het_thoi} hát đám cưới tuần trước, đăng qua kênh nghệ sĩ.]
    ~ ed_tien_tay()
    ~ follow(5000)
    ~ qh("idol_het_thoi", 5)
    _3 giờ sáng. Video 58 giây: {idol_het_thoi} hát "Công Viên" trong một tiệc cưới, cô dâu khóc, chú rể hát theo. Thật. Đẹp._
    _Sáng hôm sau, {quan_ly_idol} đăng story: "Thuật toán Diu-túp hôm nay thương {idol_het_thoi} ghê." Kèm ba trái tim._
    ~ ed_can(5)
* [🎁 Video Tiện Tay cho {sieu_nhan_hong}: hậu trường MV, cảnh ăn bánh chuối chiên qua khe mũ.]
    ~ ed_tien_tay()
    ~ follow(12000)
    _Sáng hôm sau, {quan_ly_idol} nói với ai đó ở hành lang: "Ai đăng vậy ta? Hay ghê. Chắc fan." Bạn đi ngang, mặt bình thường._
* [😴 Ngủ. Đêm nay, lần đầu trong tuần.]
    ~ ed_ngu_du()
    _Bạn ngủ trên sofa phòng dựng. Mơ thấy một thanh render chạy mãi không tới 100%. Vẫn là một giấc mơ đẹp._
- -> END

// ------------------------------------------------------------
=== editor_1010_sinh_nhat_bac_binh ===
# ngay:10 # gio:21:10 # noi:choi_bao_ve
_Thứ 7, ngày lương. Lương chưa về. Cả group than. Bạn không than: tiền quảng cáo kênh riêng về đúng ngày, như mọi tháng._
~ tien_cong(1500000)
_Tối, bạn ghé công ty lấy ổ cứng. Chòi bảo vệ còn sáng đèn. Bác {bac_bao_ve} ngồi một mình, trước mặt là một cái bánh cupcake với một cây nến nhỏ._
bac_bao_ve: Ơ… cháu à. *(hơi lúng túng, định thổi nến)* Không có gì đâu. Bánh thừa thôi.
_Radio đang đọc tin: "Hôm nay, 10/10, kỷ niệm Ngày Giải phóng Thủ đô…". Trên cái bánh có cắm tờ giấy nhỏ, nét chữ của chính bác: "50"._
* [🎂 "Sinh nhật bác hả bác? Con hát cho bác nghe nha."]
    _Bạn hát "Mừng sinh nhật" bằng giọng của người chưa ngủ hai ngày. Lạc tông. {cho} hú theo. Bác {bac_bao_ve} bật cười, cười to._
    bac_bao_ve: Năm mươi tuổi. Cả công ty không ai biết. *(thổi nến)* Giờ thì có một đứa biết.
    ~ qh("bac_bao_ve", 20)
    ~ qh("cho", 5)
* [🎥 Lấy điện thoại quay bác thổi nến, dựng thành clip 30 giây tặng bác.]
    _Clip 30 giây. Ánh nến, cái chòi, con chó, ông bác cười. Bạn chỉnh màu cho ấm như đèn dầu._
    bac_bao_ve: *(xem trên cái điện thoại cũ)* Ừ. Có một người bạn ở xa, năm nào cũng nhớ ngày này. Năm nay bác có thêm chuyện để kể trong thư.
    ~ qh("bac_bao_ve", 15)
* [😶 Ngồi xuống, rót trà đá, ngồi cạnh bác. Không nói gì.]
    bac_bao_ve: *(rót thêm trà)* Cháu ít nói nhỉ. Giống bác.
    _Hai người ngồi nghe radio tới 9 giờ. Bác ngủ đúng giờ. Bạn đi làm đúng giờ của mình._
    ~ qh("bac_bao_ve", 10)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== editor_1110_anh_hoi_nho ===
# ngay:11 # gio:20:00 # noi:can_701
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. Bạn lướt Phây-búc bằng một mắt._
_{sieu_nhan_hong} đăng ảnh xóm Cây Me, có một đứa nhỏ đứng khóc góc ảnh. {quan_ly_idol} không đăng ảnh hồi nhỏ. Anh ấy đăng ảnh {idol_het_thoi} năm 2015, cầm cúp, cười toe._
_Caption: "Hồi nhỏ của nghề anh."_
_Bạn nhìn tấm ảnh đó bằng mắt người dựng phim. Góc trái, mờ mờ, là bóng của người cầm máy phản chiếu trên tấm cúp. Người chụp là {quan_ly_idol}. Năm 2015. Anh ấy đã nhìn {idol_het_thoi} qua ống kính từ hồi đó._
* [🎞️ Dựng một video ghép ảnh hồi nhỏ của cả công ty cho fanpage.]
    ~ ed_thuc_dem()
    ~ follow(5000)
    ~ qh("hong_hot", 10)
    hong_hot: *(nhắn)* Trời ơi ai dựng vậy? Dễ thương xỉu! Tui đăng nha!
* [❤️ Thả tim ảnh {idol_het_thoi} 2015 của {quan_ly_idol}. Một tim. Đúng một.]
    ~ ed_can(2)
    _Bạn là người thứ 14 thả tim. {idol_het_thoi} là người thứ 1. {quan_ly_idol} trả lời bình luận của {idol_het_thoi} trong 40 giây._
    ~ cang_thang(5)
* [😴 Tắt điện thoại, ngủ sớm.]
    ~ ed_ngu_du()
- -> END

// ------------------------------------------------------------
=== editor_1210_giao_ban ===
# ngay:12 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp giao ban. 8 giờ 30. Bạn có mặt, nhờ {chi_dai}. Bạn đã nghĩ tới chuyện ngủ ở dưới gầm bàn._
truong_phong: MV đạt hai trăm nghìn view. Clip bà cụ còn hơn. Đây là thành quả cả tuần anh không ngủ đấy mọi người.
_Slide hiện lên: "Báo cáo tháng 10 – Người thực hiện: {truong_phong}"._
* [😶 Ngồi im. Gõ vào ghi chú điện thoại: "Lần thứ 61".]
    ~ ed_vo(5)
    ~ cang_thang(5)
* [✋ "Anh ơi, em xin bổ sung slide: 'Dựng phim: {editor}'. Một dòng thôi."]
    truong_phong: *(khựng lại)* Ừ… à… mình take note lại, slide sau anh thêm nhé.
    ~ ed_vo(-5)
    ~ ed_can(3)
    ~ qh("truong_phong", -5)
    _Slide sau không có. Nhưng ít nhất, cả phòng đã nghe tên bạn trong một câu có chữ "dựng phim"._
* [🦉 Giơ điện thoại có ảnh chụp con cú trong clip bà cụ, đưa {chi_dai} xem.]
    { ed_dau_cu_chung_minh >= 1:
        chi_dai: *(nhìn ảnh, nhìn bạn, nhìn {truong_phong})* À. Chị hiểu rồi. Chị ghi nhớ.
        ~ qh("chi_dai", 10)
        ~ ed_vo(-5)
    - else:
        _Bạn chưa giấu con cú nào. Ảnh chỉ là… một khung hình trống. {chi_dai} nhìn bạn khó hiểu._
        chi_dai: Ngủ đi em. Ngủ đi rồi tính.
    }
- -> END

// ------------------------------------------------------------
=== editor_1210_luong_ve ===
# ngay:12 # gio:10:10 # noi:khu_lam_viec_chung # bat_buoc
_Lương về trễ hai ngày. Điện thoại cả tầng rung cùng lúc. Group Zalo-lô nổ như pháo Tết._
_Ở quầy lễ tân, thẻ phụ của {con_ong_chau_cha} bị từ chối. {thuc_tap_sinh} đánh rơi một tấm thẻ hạng kim cương. Một sáng thứ 2 nhiều chất liệu._
_Bạn thì đang ngủ trên bàn. Lương về hay không, bạn đã có tiền quảng cáo từ thứ 7._
hong_hot: *(kéo ghế ngồi cạnh bạn)* Ủa {editor}. Cả công ty than lương trễ mà ông hông than gì hết. Ông có nguồn thu bí mật hả?
* [😴 "Dạ… đợi render xong…"]
    hong_hot: Render gì? Render tiền hả? *(nheo mắt)* Tui để ý ông nha.
    ~ ed_lo(5)
* [🎭 "Dạ em ăn mì gói tiết kiệm từ tháng trước."]
    hong_hot: Mì gói? *(nhìn ly cà phê 35 nghìn trên bàn bạn)* Mì gói vị cà phê Sống Ảo hả?
    ~ ed_lo(10)
* [🤝 Lảng sang chuyện khác: "Chị ơi, kênh 'Cú Đêm Cắt Ghép' ra video mới chưa, chị coi chưa?"]
    hong_hot: TRỜI ơi ông cũng coi hả?! Tui ghiền lắm! Con cú đeo tai nghe dễ thương xỉu! Mà tui nghi chủ kênh ở gần đây á, cái cổng trong video chó hôm bữa…
    { ed_lo_danh_tinh >= 15:
        _Bạn uống một ngụm cà phê rất dài._
        ~ ed_lo(5)
    - else:
        _Bạn gật gù, giả vờ ngạc nhiên. Diễn xuất hơi cứng, nhưng {hong_hot} đang bận nói._
    }
- -> END
