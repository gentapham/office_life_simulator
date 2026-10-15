// ============================================================
// CHƯƠNG 2: "HỘI ANTI SẾP" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== ran_doc_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2, họp giao ban. Ngày Nhà giáo Thế giới. {thuc_tap_sinh} ôm một bó hoa to hơn người, đi phát cho từng "thầy cô" trong phòng._
thuc_tap_sinh: Dạ em tặng anh {truong_phong}, thầy của em ạ. Dạ em tặng anh {ran_doc}, anh cũng là thầy của em ạ.
_{thuc_tap_sinh} 30 tuổi. Bạn 28. Bạn cầm bông hoa mà không biết để tay vào đâu._
truong_phong: Cảm ơn em. Thôi mình vào việc nhé. Họp nhanh 5 phút thôi.
truong_phong: Mốc 1 là thứ 4 này, 50.000 người theo dõi. Hiện tại mình mới có… *(nhìn màn hình)* chưa tới một nửa.
* [😇 Giơ tay: "Em đề xuất mỗi người share bài của anh Siêu Nhân Hồng về trang cá nhân."]
    truong_phong: Đơn giản mà hiệu quả. Cái này mình take note nhé.
    ~ rd_giup(5000)
    ~ uy_tin = uy_tin + 3
    ~ rd_han(2)
    _Bạn vừa giúp kẻ thù. Để không ai nghi, đôi khi phải vậy._
* [🐍 Thì thầm với {thuc_tap_sinh}: "Ông biết hông, đứa thực tập trước bị ổng đuổi vì pha cà phê ngọt quá đó."]
    thuc_tap_sinh: *(tái mặt)* Dạ… dạ thật hả anh? Sáng nay em pha cho ảnh hai muỗng đường…
    _Cả buổi họp, {thuc_tap_sinh} run tay, làm đổ nước lên laptop của {truong_phong}._
    truong_phong: Ơ! Cái laptop! Slide của tớ!
    ~ rd_tung_tin(8, 5)
    ~ qh("truong_phong", -3)
    ~ cang_thang(-5)
* [😶 Ngủ gật.]
    truong_phong: {ran_doc}! Em nhắc lại cho anh ý vừa rồi xem nào.
    ~ cang_thang(5)
    ~ uy_tin = uy_tin - 3
    _Bạn không nhớ. Mà hình như chính {truong_phong} cũng không nhớ._
- _Đồng hồ chỉ 10:32. Cuộc họp "5 phút" kéo dài 2 tiếng, đúng truyền thống._
-> END

// ------------------------------------------------------------
=== ran_doc_0510_hoi_anti_sep ===
# ngay:5 # gio:14:20 # noi:pantry # bat_buoc
_Pantry. {hong_hot} kéo bạn vào góc, mắt sáng rỡ._
hong_hot: Ê ê, nghe gì chưa? Tui add ông vô group này nè. "Hội Anti Sếp". 14 thành viên. Cấm nói cho ai biết.
_Điện thoại rung. Bạn được thêm vào group. Tin nhắn mới nhất: ảnh chụp màn hình sếp nhắn lúc 23:04 kêu sửa slide._
hong_hot: Đọc chưa? Sếp lại nhắn lúc 11 giờ đêm. Ối dồi ôi, tui nghỉ việc tới nơi.
~ rd_da_vao_hoi_anti_sep = true
* [🐍 "Nghe nói 5 tỷ của Siêu Nhân Hồng sếp đem đi mua xe mới rồi đó."]
    hong_hot: HẢ? Thật hông? Trời ơi để tui kể mấy đứa bên kia nghe!
    ~ rd_tung_tin(15, 10)
    ~ qh("hong_hot", 5)
    _Trong 2 ngày tới, ít nhất 3 người sẽ nghe câu này. Không ai nhớ ai nói đầu tiên._
* [🧂 "Ờ, mà tui thấy sếp toàn nhắn mấy đứa làm chăm thôi. Chắc thấy bà dễ bắt nạt."]
    hong_hot: Đúng! Đúng y chang! Ông hiểu tui ghê!
    ~ rd_them_mam(5, 0)
    ~ qh("hong_hot", 5)
* [😇 "Thôi, chắc sếp cũng áp lực. Mình cố thêm tí."]
    hong_hot: Ờ… ông hiền quá à. Chán.
    ~ rd_tin(5)
    ~ qh("hong_hot", -2)
- _Bạn lướt danh sách thành viên. 14 người. Có một tài khoản lạ: "Hoa Hướng Dương 1989". Không bao giờ nhắn. Tin nào cũng "đã xem" trong 3 giây._
* [💬 "Bà ơi, Hoa Hướng Dương 1989 là ai vậy?"]
    hong_hot: Ủa… tui cũng hông nhớ ai add. Chắc bạn của ai đó. Kệ đi.
    ~ rd_tin_mat()
    _1989. Bạn ghi lại con số đó._
* [😶 Không hỏi. Chụp màn hình danh sách thành viên.]
    ~ rd_tin_mat()
    _Rắn không hỏi. Rắn chụp màn hình._
- -> END

// ------------------------------------------------------------
=== ran_doc_0610_chup_poster ===
# ngay:6 # gio:09:30 # noi:studio_tang_2 # bat_buoc
_Studio tầng 2. Buổi chụp poster đầu tiên. {designer} cầm bản phác, {sieu_nhan_hong} tạo dáng, {cho} nằm canh ở cửa._
designer: Anh ơi, tay cao hơn chút. Không, cao quá rồi. Sửa nhẹ thôi là sửa cái gì ạ… thôi được rồi.
_File poster gốc đang mở trên laptop của {designer}. {designer} đi ra ngoài lấy nước._
* [🧨 Lén đổi file poster thành bản lỗi: chữ "HỒNG" thành "HỔNG".]
    ~ rd_pha(20000)
    ~ rd_nghi(15)
    ~ qh("designer", -5)
    _Bạn bấm lưu. Tim đập nhanh. Sáng mai poster sẽ lên với dòng chữ "SIÊU NHÂN HỔNG"._
* [🤝 Chỉnh giúp đèn, gọi {designer} quay lại cho kịp.]
    ~ rd_giup(5000)
    ~ qh("designer", 10)
    designer: Cảm ơn ông! Tưởng nay lại phải sửa lần thứ 12.
* [😶 Đứng xem, không làm gì.]
    _Bạn khoanh tay đứng xem. Đứng xem cũng là một kỹ năng._
- _Đang chụp dở, {sieu_nhan_hong} nhìn qua cửa sổ. Dưới lề đường, một bà cụ bị kẹt bánh xe lăn ở rãnh nước._
sieu_nhan_hong: Khoan! Ngoài kia có người cần giúp! Điều khoản số 3! Biến hình! *(chạy biến)*
designer: ANH ƠI! Còn 7 kiểu nữa!
_Bạn nhìn xuống. Hắn quỳ giữa trời nắng, nhấc từng bánh xe, đẩy bà cụ qua đường, rồi đứng nghe bà kể chuyện thêm 10 phút._
* [📸 Quay lại bằng điện thoại.]
    ~ rd_co_clip_ba_cu = true
    ~ rd_han(-3)
    _Bạn quay. Bạn tự nhủ là để có bằng chứng hắn bỏ ngang buổi chụp. Chỉ vậy thôi._
* [🐍 Nhắn group công ty: "Siêu sao bỏ ngang buổi chụp, tiền thuê studio ai chịu?"]
    ~ rd_tung_tin(10, 8)
    ke_toan: *(trả lời trong 4 giây)* Tiền studio là 3 triệu 2. Hóa đơn chị giữ. Ai bỏ ngang thì chị ghi sổ.
    _Ít nhất có một người tức. Mà người đó lại là người giữ tiền._
* [😶 Kéo rèm lại.]
    ~ rd_han(3)
    _Bạn không muốn nhìn. Nhìn thì sẽ phải nghĩ._
- -> END

// ------------------------------------------------------------
=== ran_doc_0610_clip_ba_cu ===
# ngay:6 # gio:20:00 # noi:hem_69
_Tối. Clip ai đó quay {sieu_nhan_hong} đẩy xe lăn cho bà cụ đang lan trên Tóp-tóp. 30.000 lượt xem… rồi 50.000._
_Tin nhắn riêng từ {dan_dau_tu}: "Em ơi, anh nhìn chart rồi. Clip này mà đăng lại đúng giờ vàng, kèm nhạc buồn, là x4. Lần này là lên thật."_
{ rd_co_clip_ba_cu:
    _Bạn mở thư viện ảnh. Clip của bạn quay gần hơn, rõ hơn, thấy cả lúc bà cụ nắm tay hắn cảm ơn._
}
* {rd_co_clip_ba_cu} [🤝 Gửi clip của mình cho {dan_dau_tu}.]
    ~ rd_dua_clip_cho_chuong = true
    ~ rd_giup(90000)
    ~ qh("dan_dau_tu", 10)
    dan_dau_tu: Góc máy này đỉnh! Anh canh 21:07 đăng. Em thấy chưa, đường xu hướng dựng đứng luôn!
    _Clip vượt 1 triệu lượt xem trong đêm, gấp 12 lần cái MV còn chưa ra mắt. Bạn nằm nhìn trần nhà. Vừa làm gì vậy?_
    ~ rd_han(-5)
* [🐍 Bình luận dưới clip bằng nick ảo: "Diễn đó mấy bà, có ekip quay sẵn rồi."]
    ~ rd_tung_tin(10, 5)
    ~ follow(15000)
    _Bình luận của bạn lên top. Người ta cãi nhau dưới đó. Mà cãi nhau thì… thuật toán càng đẩy. Clip càng lan._
    _Chiêu này hình như phản tác dụng._
* [😶 Tắt điện thoại.]
    ~ follow(30000)
    _Clip vẫn lan mà không cần bạn. Có những thứ không cần ai đẩy._
- -> END

// ------------------------------------------------------------
=== ran_doc_0710_moc_50k ===
# ngay:7 # gio:17:00 # noi:tang_1 # bat_buoc
_Mốc 1. Màn hình to giữa tầng 1 hiện con số người theo dõi của Siêu Nhân Hồng._
{ nguoi_theo_doi >= 50000:
    _{nguoi_theo_doi} người. Cả tầng vỗ tay. {giam_doc} mở một chai nước ngọt, rót cho từng người một chút xíu._
    giam_doc: Thấy chưa! Mindset đúng thì số tự lên! Anh không ép, nhưng tối nay ai đi ốc thì đi.
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
- else:
    _{nguoi_theo_doi} người. Không đạt. {giam_doc} đứng giữa phòng, mặt đỏ tía tai._
    giam_doc: Họp khẩn! Tất cả lên phòng họp! Anh truyền lửa cho các em 3 tiếng!
    _3 tiếng sau, lửa thì chưa thấy, chỉ thấy cả công ty khét như cơm cháy._
    ~ cang_thang(15)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
hong_hot: *(nhắn group Anti Sếp)* Ai thấy mặt sếp hồi nãy hông? Tui tưởng ổng sắp biến hình luôn á.
* [🧂 "Tui còn thấy ổng lẩm bẩm 'chết rồi chết rồi' trong toilet nữa."]
    ~ rd_them_mam(5, 5)
    hong_hot: Ối dồi ôi! Ổng sợ gì vậy ta? Chắc có chuyện thật rồi!
    _Thật ra bạn có nghe thấy thật. Chỉ là không phải trong toilet, mà ở cầu thang. Thêm mắm là vậy._
* [😇 Không nhắn gì, chỉ thả một cái sticker cười.]
    ~ rd_tin(2)
* [💬 Nhắn riêng {hong_hot}: "Mà ai trong group hay xem tin đầu tiên vậy bà?"]
    hong_hot: Cái nick Hoa Hướng Dương đó. Lần nào cũng xem trước tui. Tui là admin mà còn thua!
    ~ rd_tin_mat()
- -> END

// ------------------------------------------------------------
=== ran_doc_0810_phong_dung ===
# ngay:8 # gio:14:00 # noi:phong_dung_phim
_Ngày Thị giác Thế giới. {editor} bị {chi_dai} lôi đi khám mắt, vì mắt đỏ như mắt thỏ sau 3 đêm thức trắng._
editor: *(ngáp)* {ran_doc} ơi, trông giùm phòng dựng chút. Đang render cái MV. Đừng đụng gì nha. Render xong là xong.
_Phòng dựng tối om, rèm đen. Thanh tiến trình chạy 63%. Trên màn hình là file MV "Hồng Là Thái Độ" sẽ ra mắt ngày mai._
_Bên cạnh có một thư mục tên "dung_xoa_ban_loi". Trong đó là bản dựng thử, âm thanh lệch hình 2 giây._
* [🧨 Đổi tên bản lỗi thành bản chính.]
    ~ rd_doi_file_mv = true
    ~ rd_nghi(10)
    _Ba cú click. Không ai thấy. Trừ log máy tính, mà log thì ai đọc?_
    _Ở phòng server, {it} đang ăn mì ly. Màn hình của anh ta vừa hiện một dòng chữ nhỏ._
* [🤝 Thấy file đang render bị lỗi phụ đề, nhắn {editor} báo.]
    editor: Ủa thiệt hả? Cảm ơn ông. Để tui về sửa. Ông cứu tui một mạng đó.
    ~ rd_giup(5000)
    ~ qh("editor", 15)
* [💬 Lục thử các thư mục khác.]
    _Một thư mục tên "{quan_ly_idol}". Bên trong là mười mấy video dựng riêng cho nghệ sĩ của {quan_ly_idol}, chưa bao giờ gửi._
    _Một thư mục khác tên "Cu_dem". Logo một con cú. Kênh Diu-túp gần 1 triệu người đăng ký._
    ~ rd_tin_mat()
    ~ rd_tin_mat()
    ~ rd_nghi(5)
- _Thanh tiến trình chạy tới 100%. "Render xong là xong."_
-> END

// ------------------------------------------------------------
=== ran_doc_0910_can_tin_trung ===
# ngay:9 # gio:12:05 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. Trứng chiên, trứng luộc, trứng kho, trứng ốp la hình trái tim hồng (nội quy tháng 10)._
thuc_tap_sinh: Dạ anh {ran_doc} ăn trứng gì ạ? Em mời. Hôm nay em có lương tuần.
_Lương tuần thực tập sinh là 1 triệu. Mà ví của {thuc_tap_sinh} thò ra một cái thẻ màu bạc lấp lánh._
* [🤝 "Ông lớn hơn tui, để tui mời. Mà ông gọi tên tui được rồi."]
    thuc_tap_sinh: Dạ… dạ thôi anh. Mà… cảm ơn anh. Ở đây chưa ai nói vậy với em hết.
    _Mắt {thuc_tap_sinh} đỏ hoe. Vì một quả trứng._
    ~ qh("thuc_tap_sinh", 15)
    ~ tien_cong(-30000)
    ~ an(30)
* [📸 "Ông giúp tui một việc nhỏ, tui kể ông nghe hết bí mật phòng này."]
    thuc_tap_sinh: Dạ… việc gì ạ? Em làm liền ạ!
    ~ rd_tai_mat_duy = true
    ~ rd_tin_mat()
    _Từ hôm nay, bạn có một đôi tai ở phòng Sản xuất. Đôi tai này pha cà phê cho cả phòng mỗi sáng._
    ~ an(30)
* [🐍 Nhìn cái thẻ, cười: "Thẻ đẹp ha. Thực tập mà xài thẻ bạch kim."]
    thuc_tap_sinh: *(nhét vội vào ví)* Dạ… thẻ… thẻ của người quen cho mượn ạ.
    ~ rd_tin_mat()
    ~ qh("thuc_tap_sinh", -5)
    ~ an(30)
- -> END

// ------------------------------------------------------------
=== ran_doc_0910_ra_mat_mv ===
# ngay:9 # gio:19:00 # noi:studio_tang_2 # bat_buoc
_Ra mắt MV "Hồng Là Thái Độ". Cả công ty ngồi trước màn hình chiếu. {sieu_nhan_hong} đứng giữa, tạo dáng chờ._
{ rd_doi_file_mv:
    _Nhạc lên. Hình lên… chậm hơn nhạc 2 giây. {sieu_nhan_hong} hô "Biến hình!" mà miệng vẫn còn ngậm._
    editor: *(bật dậy)* Cái gì vậy?! Đây là bản lỗi! Ai đổi file của tui?!
    _Bình luận trên mạng: "MV lồng tiếng như phim bộ 2005", "ảnh nói xong rồi mới mở miệng". Có người cắt ghép làm meme._
    ~ follow(10000)
    ~ rd_so_lan_pha = rd_so_lan_pha + 1
    ~ qh("editor", -5)
    it: *(liếc về phía bạn, cắn mì ly)* Lỗi người dùng.
    ~ rd_nghi(10)
    _MV bị chê, nhưng meme thì lan. Siêu Nhân Hồng nổi thêm vì… bị chê. Thế giới này kỳ lạ thật._
- else:
    _Nhạc lên. Bộ đồ hồng lướt giữa phố, khói màu, pháo giấy. Không đỉnh nóc kịch trần, nhưng xem được._
    ~ follow(40000)
    giam_doc: Đấy! Thấy chưa! Đấy là vision!
}
sieu_nhan_hong: Cả nhà ơi! Cảm ơn mọi người! Hồng không phải màu, Hồng là thái độ!
_Mọi người vỗ tay. {sieu_nhan_hong} đi bắt tay từng người, tới bạn thì giơ tay đập tay._
sieu_nhan_hong: High five nè em!
* [😇 Đập tay.]
    sieu_nhan_hong: Tay em khỏe ghê, lần trước bắt tay anh nhớ hoài!
    _Nhớ cái bắt tay. Mà không nhớ cái mặt._
    ~ rd_han(3)
* [😶 Để tay hắn lơ lửng giữa không trung.]
    _{sieu_nhan_hong} giữ tay thêm 2 giây, rồi tự đập vào tay mình, cười xòa._
    chi_dai: *(nhìn bạn)* …
    ~ rd_nghi(3)
* [🐍 "Anh hát nhép giỏi ghê. Chắc hồi nhỏ luyện nhiều."]
    sieu_nhan_hong: *(khựng lại)* Hồi nhỏ… ờm… hồi nhỏ anh hông có hát.
    _Hồi nhỏ hắn không hát. Hồi nhỏ hắn giật kem._
    ~ rd_han(5)
- -> END

// ------------------------------------------------------------
=== ran_doc_0910_hong_coin ===
# ngay:9 # gio:23:10 # noi:hem_69
_Gần nửa đêm. {dan_dau_tu} gõ cửa phòng bạn, tay cầm điện thoại sáng rực._
dan_dau_tu: Em ơi! Có fan vừa tạo "Hồng Coin" nè! Ký hiệu HONG! Giá đang bằng một ly trà đá! Lần này là lên thật!
_Trên màn hình là một đường biểu đồ, dựng đứng như cái cột điện._
* [🧂 "Anh nghe nói chính Siêu Nhân Hồng đứng sau coin này đó."]
    dan_dau_tu: Thật hả?! Vậy là có tổ chức! Anh all-in!
    ~ rd_them_mam(5, 5)
    _Một tin đồn dễ thương. Nó sẽ quay lại cắn ai đó, sớm thôi._
* [😇 "Anh đừng bỏ tiền vô mấy cái này. Anh còn nợ bác {bac_bao_ve} mà."]
    dan_dau_tu: *(cười méo)* Em cũng biết hả? Thôi… anh bỏ ít thôi. Một ít. Một ít xíu.
    ~ rd_tin(5)
    ~ rd_tin_mat()
* [💬 "Ai tạo coin vậy anh?"]
    dan_dau_tu: Ẩn danh. Người giàu thật hay ẩn danh lắm.
    ~ rd_tin_mat()
- _Bạn đóng cửa. Bên kia vách, {hong_hot} đang hét: "Hồng Coin! Cả nhà ơi Hồng Coin!"_
-> END

// ------------------------------------------------------------
=== ran_doc_1010_luong_chua_ve ===
# ngay:10 # gio:09:00 # noi:hem_69 # bat_buoc
_Thứ 7, ngày 10. Ngày nhận lương. Tài khoản: không có gì. Group "Hội Anti Sếp" nổ như pháo Tết._
hong_hot: Lương đâu?! Ét o ét! Tui còn đúng 37 nghìn!
dan_dau_tu: Anh còn 12 nghìn. Mà anh vừa mua Hồng Coin.
_Tin nhắn từ "Hoa Hướng Dương 1989": đã xem._
* [🔥 "Nghe nói sếp chuyển 5 tỷ đi đâu rồi nên mới không có lương đó."]
    ~ rd_tung_tin(15, 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
    hong_hot: TUI BIẾT MÀ!
    _Group nổ tung. 87 tin nhắn trong 10 phút. Bạn nằm nghe vách bên cạnh {hong_hot} chửi "trời đất ơi" 12 lần._
* [🐍 Nhắn một câu, rồi tự xóa sau 30 giây: "Mấy bà có ai thấy nick Hoa Hướng Dương lúc nào cũng xem đầu tiên hông?"]
    ~ rd_tung_tin(5, 3)
    ~ rd_tin_mat()
    _30 giây là đủ cho 6 người đọc. Nick Hoa Hướng Dương… vẫn "đã xem". Không nói gì._
* [😇 "Hôm nay thứ 7, ngân hàng nghỉ. Chắc thứ 2 về."]
    ~ rd_tin(5)
    ke_toan: *(nhắn riêng bạn)* Em nói đúng. Cảm ơn em đã bình tĩnh.
    ~ qh("ke_toan", 10)
- -> END

// ------------------------------------------------------------
=== ran_doc_1010_sinh_nhat_bac_binh ===
# ngay:10 # gio:16:00 # noi:chot_bao_ve # dieu_kien:qh_bac_bao_ve>=10
_Ngày Giải phóng Thủ đô. Ở chòi bảo vệ, {giam_doc}, {truong_phong} và bác {bac_bao_ve} đang kể chuyện Hà Nội. Ba giọng Bắc, một ấm trà._
giam_doc: Hồi tớ còn sinh viên, mùa này Hà Nội thơm hoa sữa lắm.
truong_phong: Em thì nhớ phở. Ở đây cái bát phở bé quá anh ạ.
* [💬 "Cái bát… là cái tô hả anh?"]
    truong_phong: Ừ. Cái tô. Ở đây cái gì cũng gọi khác.
    ~ qh("truong_phong", 3)
- _Trên bàn có một tờ lịch cũ. Ngày 10/10 được khoanh tròn bằng bút đỏ. Bên cạnh có chữ "G" viết tay: "Chúc mừng 50 tuổi."_
_Bác {bac_bao_ve} 50 tuổi hôm nay. Không ai trong công ty biết._
* [😇 Đợi mọi người về, rồi chạy ra tiệm mua một cái bánh bông lan nhỏ.]
    ~ tien_cong(-60000)
    bac_bao_ve: *(nhìn cái bánh rất lâu)* Thế à… Cháu biết à.
    bac_bao_ve: Cảm ơn cháu. Đừng nói với ai nhé. Bác không thích ồn.
    ~ qh("bac_bao_ve", 25)
    ~ rd_tin(5)
    cho: Gâu! *(nhìn cái bánh, rồi nhìn bạn)*
    _Bạn bẻ cho {cho} một góc. Ba sinh vật ăn bánh bông lan trong chòi bảo vệ, không ai nói gì. Dễ chịu lạ._
* [🐍 Ghi vào sổ: "Bác {bac_bao_ve}, 50 tuổi, ai đó tên G nhớ sinh nhật bác. G là ai?"]
    ~ rd_tin_mat()
    _Một cái tên viết tắt. Một người nhớ sinh nhật bảo vệ. Bạn không biết dùng thế nào, nhưng có cảm giác đây là con bài lớn._
- -> END

// ------------------------------------------------------------
=== ran_doc_1110_anh_hoi_nho ===
# ngay:11 # gio:20:30 # noi:hem_69 # bat_buoc
_Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {hong_hot} đăng ảnh mặc váy công chúa. {chi_dai} đăng ảnh cầm cây chổi, mặt rất ngầu._
_Rồi trang của Siêu Nhân Hồng đăng một tấm. "Hồi nhỏ Hồng ở một cái xóm có cây me to lắm nè!"_
_Bạn phóng to. Một đám con nít đứng trước cây me. Đứa cao nhất đeo khăn quàng đỏ làm áo choàng. Ở góc ảnh, một thằng nhóc gầy nhom, mặt lấm lem, đang khóc._
_Là bạn._
~ rd_thay_anh_cay_me = true
~ phat_hien(hieu_ech)
_Bạn nhớ hết. Cái nhà kho. Buổi chiều tối dần. Cái lỗ thông gió hình con cá, chỗ duy nhất có ánh sáng. Tiếng tụi nhỏ cười ngoài kia: "{ran_doc} Ếch! {ran_doc} Ếch!"_
* [💢 Bình luận: "Thằng nhỏ góc ảnh khóc vì ai vậy anh?"]
    ~ rd_han(10)
    ~ rd_nghi(8)
    _3 phút sau, bài đăng bị ẩn bình luận. 5 phút sau, cả bài viết bị gỡ._
    _Hắn có đọc. Hắn có sợ. Bạn không biết nên vui hay không._
* [📸 Tải ảnh về. Cất vào thư mục "Bằng chứng".]
    ~ rd_tin_mat()
    ~ rd_han(5)
    _Tấm ảnh này một ngày nào đó sẽ có ích. Bạn chưa biết là ích cho ai._
* [😶 Úp điện thoại xuống bàn.]
    ~ cang_thang(10)
    ~ rd_han(-3)
    _Bên kia vách, {hong_hot} đang hát karaoke một mình. Bạn nằm nhìn trần nhà tới 2 giờ sáng._
- -> END

// ------------------------------------------------------------
=== ran_doc_1210_luong_ve ===
# ngay:12 # gio:09:15 # noi:tang_1 # bat_buoc
_Thứ 2. Lương về trễ 2 ngày. Cả tầng 1 thở phào như vừa thoát nạn._
_Nhưng ở quầy lễ tân, {con_ong_chau_cha} đang nhìn cái máy quẹt thẻ. "TỪ CHỐI GIAO DỊCH". Lần thứ ba._
con_ong_chau_cha: Ủa? Thẻ phụ của chú anh mà. Sao lại từ chối? Để anh gọi chú anh.
_Cùng lúc đó, {thuc_tap_sinh} rút ví trả tiền cà phê cho cả phòng. Một cái thẻ đen viền kim cương rơi xuống sàn._
hong_hot: Ủa alo? Thẻ kim cương? Thực tập sinh mà thẻ kim cương?!
thuc_tap_sinh: Dạ… dạ… thẻ… của ba em… à không, của… người quen ạ!
* [🔥 "{con_ong_chau_cha} ơi, thẻ phụ của sếp mà bị từ chối, chắc tài khoản sếp có chuyện rồi đó."]
    ~ rd_tung_tin(10, 8)
    con_ong_chau_cha: *(mặt tái)* Ủa… vậy hả? Chú anh… hông có nói gì hết.
    _Cái thẻ phụ gắn với tài khoản riêng của {giam_doc}. Không ai biết vì sao nó trống. Nhưng giờ thì ai cũng bắt đầu đoán._
    ~ rd_tin_mat()
* [🤝 Nhặt cái thẻ kim cương lên, đưa lại cho {thuc_tap_sinh}, che bằng tay.]
    thuc_tap_sinh: *(thì thầm)* Cảm ơn anh… em nợ anh một lần.
    ~ qh("thuc_tap_sinh", 15)
    ~ rd_tin(5)
    ~ phat_hien(duy_tung_lam_ngan_hang)
    ~ rd_tin_mat()
* [🐍 Chụp ảnh cái thẻ.]
    ~ rd_tin_mat()
    ~ rd_nghi(5)
    _Click. {chi_dai} quay lại đúng lúc đó, nhìn bạn rồi nhìn cái điện thoại._
    chi_dai: Em chụp gì đó?
    _Bạn cười, giơ màn hình: một ly cà phê. Rắn giỏi thì chụp hai tấm._
- -> END

// ------------------------------------------------------------
=== ran_doc_1210_truy_clone ===
# ngay:12 # gio:15:30 # noi:phong_server
_Phòng server. Mì ly, quạt rè rè, ba màn hình đầy chữ xanh. {it} không quay lại khi bạn bước vào._
it: Chuyện gì.
* [💬 "Anh {it} ơi, có cách nào biết một nick Zalo-lô đăng nhập từ máy nào hông anh?"]
    it: Có. Mà không.
    it: *(cắn mì)* Nick nào.
    -> ran_doc_1210_truy_clone_hoi
* [🍜 Đặt lên bàn một ly mì ly vị mới, chưa ai ăn.]
    it: …Vị gì.
    ~ qh("it", 10)
    -> ran_doc_1210_truy_clone_hoi

= ran_doc_1210_truy_clone_hoi
_Bạn đưa màn hình danh sách thành viên "Hội Anti Sếp". Ngón tay chỉ vào "Hoa Hướng Dương 1989"._
_{it} nhìn rất lâu. Gõ vài dòng. Màn hình hiện: "Đăng nhập lần cuối: máy THANG-PC, tầng 2, phòng giám đốc."_
it: Không nói gì hết. Tôi không thấy gì. Anh tắt đi bật lại rồi quên đi.
~ phat_hien(clone_thang)
~ rd_biet_clone = true
~ rd_tin_mat()
_1989. Năm sinh của {giam_doc}. Sếp ngồi trong group nói xấu sếp, từ tháng 6._
* [🐍 Tối nay tố cáo trong group luôn.]
    ~ rd_to_clone = true
    ~ rd_tung_tin(20, 15)
    _22:00. Bạn nhắn bằng một nick phụ: "Hoa Hướng Dương ơi, máy THANG-PC có ấm hông?"_
    _Nick Hoa Hướng Dương rời nhóm sau 4 giây. Group im lặng 10 phút, rồi nổ tung._
    giam_doc: *(22:15, group công ty)* Các em ngủ sớm nhé. Anh không đọc gì đâu.
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
    ~ qh("it", -10)
    it: *(nhắn riêng)* Tôi đã nói không nói gì hết.
* [📸 Giữ lại. Bí mật này để dành.]
    ~ rd_tin(3)
    _Một bí mật của sếp, nằm trong túi bạn. Không ai biết bạn biết. Đó mới là quyền lực._
* [😇 Rời khỏi group "Hội Anti Sếp" luôn cho lành.]
    ~ rd_tin(5)
    ~ rd_da_vao_hoi_anti_sep = false
    _Bạn bấm rời nhóm. {hong_hot} nhắn ngay: "Ủa? Ông bị gì vậy?"_
    ~ qh("hong_hot", -5)
- -> END

// ------------------------------------------------------------
=== ran_doc_1210_ban_tin ===
# ngay:12 # gio:16:30 # noi:ban_lam_viec
_Bản Tin Thứ 2 số đầu tiên của bạn. {truong_phong} muốn nó lên trước 17:00._
truong_phong: Em gửi anh trước 17 giờ nhé. Nhớ có mục "Câu chuyện cảm hứng" và một chút hồng.
_Trong sổ tay của bạn có {rd_so_tin_mat} tin mật. Cái nào an toàn, cái nào cay?_
-> ran_doc_mg_ban_tin
