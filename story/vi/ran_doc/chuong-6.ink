// ============================================================
// CHƯƠNG 6: "NGÀY PHÁN XÉT" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== ran_doc_2810_moc_800k ===
# ngay:28 # gio:09:00 # noi:tang_1 # bat_buoc
_Mốc 4: 800.000 người theo dõi._
{ nguoi_theo_doi >= 800000:
    _Màn hình hiện {nguoi_theo_doi}. Đạt. Cả tầng 1 hét lên. {sieu_nhan_hong} ôm {thuc_tap_sinh} nhấc bổng lên, quên mất {thuc_tap_sinh} nặng 70 ký._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
- else:
    _Màn hình hiện {nguoi_theo_doi}. Không đạt. Trên mạng, trang của LL-Entertainment đăng một tấm ảnh bóng lưng màu hồng, chú thích: "Sắp về nhà mới?"_
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
}
_Bộ lọc dữ liệu của {dan_dau_tu} vừa chạy xong. Anh ta gọi bạn ra một góc._
dan_dau_tu: Em ơi, anh lọc ra 80.000 nick ảo bình luận y chang nhau. Chủ của tụi nó là… {idol_het_thoi}. Anh có nên báo cáo không?
* [🐍 "Đăng luôn đi anh. Số liệu là sự thật mà."]
    ~ rd_tung_tin(10, 5)
    ~ scandal()
    ~ qh("idol_het_thoi", -15)
    dan_dau_tu: Ừ. Số liệu là sự thật. *(bấm gửi, tay hơi run)*
* [🤝 "Báo riêng cho anh {quan_ly_idol} trước. Để ảnh xử lý êm."]
    ~ qh("quan_ly_idol", 15)
    ~ qh("dan_dau_tu", 5)
    ~ rd_tin(5)
    ~ phat_hien(fan_ao_phat)
* [😶 "Em không biết gì hết anh."]
    dan_dau_tu: Ừ. Em không biết. Anh cũng không biết. *(đóng laptop)*
- -> END

// ------------------------------------------------------------
=== ran_doc_2810_video_linh ===
# ngay:28 # gio:02:10 # noi:hem_69
_2 giờ 10 sáng. Bên kia vách, {hong_hot} hét lên một tiếng rồi đập vách rầm rầm: "Ông ơi dậy! Fanpage!"_
_Kênh Diu-túp của {editor} vừa tự đăng một video: bản nháp video "16 năm" của {editor}, chưa xong, nhạc tạm. Giữa video có cả một đoạn dài lấy nhầm từ thư mục "{quan_ly_idol}": {quan_ly_idol} làm việc, {quan_ly_idol} ngủ gục trong xe, quay rất lâu, rất kỹ._
_Ai xem đoạn đó cũng hiểu người quay nghĩ gì về người được quay. Bị xuất nhầm._
editor: *(nhắn group, toàn chữ hoa)* ANH {it} ƠI GỠ GIÙM EM! GỠ GIÙM EM!
~ phat_hien(linh_thich_thai)
* [🤝 Gọi điện đánh thức {it}, rồi gọi {editor} dậy gỡ video.]
    ~ qh("editor", 20)
    ~ qh("it", 5)
    _Video bị gỡ sau 6 phút. 6 phút đủ để khoảng 2.000 người xem. Nhưng không đủ để thành drama._
    it: *(giọng ngái ngủ)* Gỡ rồi. Mà lạ. Lệnh xuất không đi từ máy {editor}. Đi từ một máy khác, đăng nhập lúc 02:09.
    ~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
    editor: *(nhắn riêng bạn)* Cảm ơn ông. Thật sự cảm ơn ông.
* [🐍 Tải video về trước khi bị gỡ.]
    ~ rd_tin_mat()
    ~ rd_nghi(5)
    _Bạn có bản nháp đó trong máy, cả đoạn quay {quan_ly_idol}. Bạn chưa biết làm gì với nó. Bạn chỉ biết mình không nên làm gì với nó._
* [🔥 Chia sẻ lại vào group Anti Sếp: "Ối dồi ôi, đám cá tươi tới rồi!"]
    ~ rd_tung_tin(12, 10)
    ~ qh("editor", -25)
    ~ qh("quan_ly_idol", -10)
    _Sáng hôm đó, {editor} không ra khỏi phòng dựng. Ở bàn bên kia, {quan_ly_idol} xem lại bản tải về ba lần, mặt không biểu cảm._
- -> END

// ------------------------------------------------------------
=== ran_doc_2810_gom_bang_chung ===
# ngay:28 # gio:20:00 # noi:phong_server # dieu_kien:rd_biet_ran_hai
_Tối. Phòng server. Bạn bày ra bàn: ảnh ở sảnh LL, chữ ký trong sổ ra vào của bác {bac_bao_ve}, đoạn ghi âm ở pantry._
it: Thiết bị đăng bài confession. Thiết bị vào máy giám đốc đêm 17. Cùng một cái. Tên thiết bị: máy cá nhân của {ten(ran_thu_hai)}.
it: Tôi in log được. Mà anh định làm gì?
* [🤝 "Mai họp đánh giá. Tui đưa hết lên màn hình."]
    it: Ừ. Vậy cũng phải đưa luôn mấy log của anh. Công bằng.
    _{it} nhìn bạn. Bạn hiểu: muốn lật mặt con rắn kia thì chính bạn cũng phải lột da._
    ~ rd_tin(10)
    ~ qh("it", 10)
* [🐍 "In log của nó thôi. Log của tui thì… anh tắt đi bật lại rồi quên đi."]
    it: *(nhìn rất lâu)* …Lỗi người dùng.
    _{it} in. Chỉ in một xấp. Không phải của bạn._
    ~ qh("it", -5)
- -> END

// ------------------------------------------------------------
=== ran_doc_2910_wifi_sap ===
# ngay:29 # gio:08:40 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. Wifi sập. Cả công ty truy đuổi {it} từ tầng 2 xuống tầng trệt._
_Video "16 năm" của {editor} kẹt ở 99%. Chiến dịch mạng xã hội đứng hình. Phải tới 22 giờ 47 tối nay mạng mới có lại._
{ rd_biet_ran_hai:
    _Bạn không chạy theo đám đông. Bạn đi thẳng ra tủ mạng sau cầu thang. Và bắt gặp {ten(ran_thu_hai)} đang cầm cây kéo, cạnh sợi dây mạng bị cắt đứt._
    * [📸 Chụp ảnh.]
        _Tách. Người đó quay lại. Lần đầu tiên bạn thấy nụ cười kia biến mất._
        ~ rd_manh_moi_ran_hai = rd_manh_moi_ran_hai + 1
        ~ rd_tin_mat()
        -> ran_doc_2910_wifi_sap_tiep
    * [🤝 Giật cây kéo, gọi {it} tới nối dây.]
        it: *(chạy tới)* Dây bị cắt. Không phải chó cắn. Vết kéo.
        ~ qh("it", 10)
        ~ rd_giup(10000)
        -> ran_doc_2910_wifi_sap_tiep
- else:
    _Bạn tìm ra thủ phạm: {cho} đang nằm cạnh tủ mạng, ngậm sợi dây đã bị cắn đứt, nhìn quanh tìm con gà cao su._
    cho: Gâu? *(vẫy đuôi)*
    * [🐾 Xoa đầu {cho}, giấu sợi dây đi.]
        ~ qh("cho", 10)
        ~ qh("bac_bao_ve", 5)
        _Không ai biết. Bạn với {cho} có chung một bí mật nhỏ._
        -> ran_doc_2910_wifi_sap_tiep
    * [🐍 Hô to: "Con chó cắn dây mạng!"]
        ~ qh("cho", -15)
        ~ rd_do_doc = gioi_han(rd_do_doc + 5)
        _Cả công ty quay sang {cho}. {cho} nhìn bạn, như bị phản bội._
        -> ran_doc_2910_wifi_sap_tiep
}

= ran_doc_2910_wifi_sap_tiep
_{hong_hot} phát wifi điện thoại. Tên mạng: "nghegichua". Mật khẩu: "nghegichua". Cả tầng 1 xúm quanh {hong_hot} như quanh đống lửa trại._
-> END

// ------------------------------------------------------------
=== ran_doc_2910_tong_dai_giay ===
# ngay:29 # gio:11:00 # noi:chot_bao_ve
_Không có mạng, chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} ngồi giữa, phân loại giấy nhắn. {chi_dai} điều phối bằng bộ đàm._
chi_dai: *(bộ đàm)* Tầng 2 gọi chòi. Tờ "đặt cơm trưa" gửi nhầm lên phòng giám đốc rồi.
bac_bao_ve: Cháu {ran_doc}. Cháu chạy giấy giúp bác được không? Chân bác mỏi.
_Trên tay bạn là cả xấp tin nhắn của cả công ty. Không mã hóa. Không xóa được. Không ai kiểm tra._
* [😇 Chạy giấy đàng hoàng, không đọc.]
    -> ran_doc_mg_chay_giay
* [🐍 Viết thêm một tờ giả: "Siêu Nhân Hồng đã ký với LL. — {quan_ly_idol}".]
    ~ rd_tung_tin(20, 20)
    _Tờ giấy đi từ tầng 1 lên tầng 2 trong 4 phút. Tới tay {quan_ly_idol}. Anh ta đọc, nhìn chữ ký, rồi đi thẳng xuống chòi._
    quan_ly_idol: Bác {bac_bao_ve}, tờ này ai đưa bác?
    bac_bao_ve: *(uống trà)* Bác không thấy gì đâu. *(nhưng nhìn bạn)*
    ~ qh("bac_bao_ve", -15)
    ~ qh("quan_ly_idol", -10)
* [😶 Đưa lại xấp giấy cho bác: "Dạ con bận chút bác ơi."]
    bac_bao_ve: Ừ. Thế thôi.
    ~ qh("bac_bao_ve", -3)
- -> END

// ------------------------------------------------------------
=== ran_doc_2910_tra_da ===
# ngay:29 # gio:18:30 # noi:quan_tra_da_dau_hem # bat_buoc
_Quán trà đá đầu Hẻm 69. Trời chạng vạng. Bạn ngồi một mình, ly trà đá 3 nghìn._
_Một người ngồi xuống ghế đối diện. Không mũ, không đồ hồng. Áo thun xám, tay dính dầu nhớt, mồ hôi nhễ nhại. Vết sẹo trên mu bàn tay trái._
sieu_nhan_hong: *(rất nhỏ)* Dạ… ờm… cho anh một ly trà đá.
sieu_nhan_hong: Hôm nay hông có mạng, hông livestream được. Anh đi đẩy xe cho người ta cả ngày. Hông ai quay. Mà… vui.
{ rd_mo_nhanh_hieu_ech:
    sieu_nhan_hong: {ran_doc}. Anh ngồi đây được hông?
- else:
    sieu_nhan_hong: Ủa, em là… em làm ở công ty mình mà. Em ở hẻm này hả?
}
* [😇 "Ngồi đi anh. Ông Ba ơi, hai ly trà đá."]
    ~ rd_han(-10)
    ~ uong(25)
    sieu_nhan_hong: Hồi nhỏ, xóm anh cũng có quán trà đá như vầy. Có cây me to lắm.
    _Hai người uống trà. Ông Ba quạt mo. Hẻm 69 lên đèn. Không ai nói gì về nhà kho, mà ai cũng nghĩ về nó._
* {rd_mo_nhanh_hieu_ech} [💬 "Anh có thấy dễ chịu hơn chưa, sau khi xin lỗi?"]
    sieu_nhan_hong: Chưa. Xin lỗi xong mới biết… nó hông xóa được gì hết. Chỉ là bớt nặng một chút.
    sieu_nhan_hong: Anh hông xin em tha. Anh chỉ xin em… đừng phá mấy đứa trong công ty. Tụi nó hông có lỗi gì.
    ~ rd_han(-10)
    ~ rd_nguyen_xin_loi = true
    _Hắn biết. Hắn biết bạn là người phá. Và hắn vẫn ngồi đây, mua trà cho bạn._
* {not rd_mo_nhanh_hieu_ech && rd_moi_han < 60} [🔒 "Anh còn nhớ cái nhà kho có lỗ thông gió hình con cá hông?"]
    _{sieu_nhan_hong} đặt ly trà xuống. Tay run. Nhìn bạn rất lâu._
    sieu_nhan_hong: …{ran_doc}. {ran_doc} Ếch. Là em hả?
    sieu_nhan_hong: Anh xin lỗi. Không có camera. Không có ai. Anh xin lỗi em.
    ~ rd_mo_nhanh_hieu_ech = true
    ~ rd_nguyen_xin_loi = true
    ~ rd_han(-20)
    _Ông Ba trà đá quay đi chỗ khác, quạt mo thật mạnh, như sợ người ta thấy mình nghe._
* [🐍 "Không có camera thì anh cũng chỉ là người thường thôi ha."]
    sieu_nhan_hong: *(cười rất nhẹ)* Ừ. Anh biết. Anh sợ nhất là người ta biết điều đó.
    ~ rd_han(3)
    _Bạn vừa nói trúng nỗi sợ của hắn. Lẽ ra phải thấy thắng. Mà không thấy gì cả._
- _Bác {bac_bao_ve} đánh cờ ở bàn bên với ông Ba trà đá. Làm như không nghe thấy gì._
_Uống xong, hắn đứng dậy, đi thẳng sang quán Chè Bà Bảy ở đầu hẻm. Cô cháu gái của bà, Mai, ngẩng lên, không hỏi gì về bộ đồ hồng, chỉ hỏi: "Anh ăn chè gì?". Hắn cười. Cái cười đó bạn chưa thấy bao giờ, kể cả hồi ở xóm Cây Me._
-> END

// ------------------------------------------------------------
=== ran_doc_3010_don_kho ===
# ngay:30 # gio:08:00 # noi:gam_cau_thang
_Trước họp đánh giá, {hr} cho dọn kho. Hai anh dọn vệ sinh đang cầm bao rác đi về phía gầm cầu thang. Kho của {cho}._
cho: GRỪ… GÂU GÂU! *(đứng chắn trước kho, lông dựng)*
hr: Mình cùng nhìn lại không gian làm việc nha em. Gầm cầu thang này nhiều đồ lạ quá.
* {rd_dong_minh_tuat} [🐾 Đứng chắn cạnh {cho}: "Anh {hr} ơi, kho này là của bác {bac_bao_ve}, có đồ của khách."]
    hr: Ồ… vậy hả. Vậy mình để lại nha em.
    cho: Gâu! *(dụi đầu vào chân bạn)*
    ~ qh("cho", 20)
    ~ qh("bac_bao_ve", 10)
    _Kho của {cho} được giữ nguyên. Trong đó vẫn còn chiếc găng tay hồng ngày 4/10._
* [🐍 Kệ. Kho đó có ảnh hưởng gì tới bạn đâu.]
    _Bao rác đầy dần. Chìa khóa, thỏi son, điện thoại cũ. Găng tay hồng. {cho} đứng nhìn, không sủa nữa._
    ~ qh("cho", -20)
* [🤝 Xin {hr} cho mình tự dọn.]
    hr: Em tích cực quá. Anh ghi nhận.
    _Bạn "dọn" bằng cách đẩy hết vào sâu hơn. {cho} hiểu. {cho} vẫy đuôi._
    ~ qh("cho", 15)
    ~ qh("hr", 3)
- -> END

// ------------------------------------------------------------
=== ran_doc_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_14 giờ. Họp đánh giá cuối tháng ở phòng họp tầng 2. Cả công ty ngồi kín. { nguyen_theo_ll: Ghế đối tác bỏ trống, chỉ còn tấm bảng tên "Siêu Nhân Hồng" úp mặt xuống bàn. | {sieu_nhan_hong} dự với tư cách đối tác. } Trên bàn {hr} là tập hồ sơ màu hồng. {thanh_ninh} ngồi sát ghế sếp, liếc bạn một cái rất nhanh._
giam_doc: Hôm nay anh điểm lại cả tháng, gia hạn hợp đồng cho {idol_het_thoi}, và… những thay đổi về nhân sự. Còn ai ở, ai đi, ai lên ghế nào thì anh chốt sau Đại Nhạc Hội.
{ rd_nghi_ngo >= 100:
    _Màn hình chiếu tự bật. Ảnh chụp tin nhắn của bạn. Từng cái một. Group Anti Sếp. Nick ảo. File MV. Tờ giấy giả chữ ký._
    _Cả phòng quay lại nhìn bạn. {giam_doc} tắt máy chiếu, giọng rất khẽ: "Mai diễn xong đã. Thứ 2 em lên phòng anh."_
    -> END
}
{ not rd_biet_ran_hai:
    _{ten(ran_thu_hai)} đứng dậy, cắm USB vào máy chiếu. Trên màn hình: tập "bằng chứng" có tên bạn. Ảnh, tin nhắn, ghi âm. Cái gì cũng thật. Chỉ thiếu phần của chính người đó._
    _"Tui chỉ nói sự thật thôi mà."_
    _Câu cửa miệng của bạn. Từ miệng người khác. {giam_doc} giơ tay: "Để sau 31. Giờ ai về việc nấy."_
    ~ rd_nghi(30)
    -> END
}
_{ten(ran_thu_hai)} đứng dậy, cầm USB đi về phía máy chiếu. Bạn đứng dậy cùng lúc._
* {rd_manh_moi_ran_hai >= 4} [🔒 Lật mặt: đưa log của {it}, sổ ra vào của bác {bac_bao_ve}, ảnh ở sảnh LL lên màn hình trước.]
    ~ rd_lat_mat_ran_hai = true
    _Màn hình hiện: thiết bị đăng bài confession, thiết bị vào phòng giám đốc đêm 17, ảnh ở sảnh LL, chữ ký 22:41. Tất cả cùng một cái tên: {ten(ran_thu_hai)}._
    it: Log là thật. Tôi xác nhận.
    bac_bao_ve: Sổ ra vào là của bác. Chữ ký trong đó bác không sửa được.
    giam_doc: {ten(ran_thu_hai)}… em làm cho LL?
    _Người đó không trả lời. Chỉ nhìn bạn, rồi đi ra cửa. Mùi lá chuối còn lại trong phòng rất lâu._
    ~ rd_nghi(-20)
    ~ uy_tin = uy_tin + 15
* [😇 Nói trước: "Em có chuyện cần thú nhận trước khi ai đó chiếu gì lên."]
    _Bạn kể. Không hết, nhưng đủ: tin đồn, cái file MV, cái bánh. Và người đang cầm USB kia cũng làm y như vậy, cho LL._
    _Cả phòng im phăng phắc. {chi_dai} là người đầu tiên lên tiếng._
    chi_dai: Ít nhất nó tự nói. Còn đứa kia thì không.
    ~ rd_lat_mat_ran_hai = true
    ~ rd_tin(15)
    ~ rd_do_doc = gioi_han(rd_do_doc - 20)
* [🐍 Để người đó chiếu, rồi đổ ngược: "Mấy cái này ai cũng làm được. Hỏi xem tối 22:41 ngày 23 người đó làm gì ở đây."]
    ~ rd_nghi(10)
    _Hai con rắn cắn nhau giữa phòng họp. Cả công ty nhìn như xem phim. Không ai tin ai nữa._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
-
{ rd_do_doc >= 80 && rd_nghi_ngo < 40 && rd_loai_nhat && rd_loai_long:
    giam_doc: Ghế Phó Giám đốc. {truong_phong} thì… nhiều chuyện quá. {con_ong_chau_cha} thì… anh không bênh được nữa.
    giam_doc: Người duy nhất không dính vào chuyện gì trong tháng này là… {ran_doc}. Anh chưa chốt. Nhưng anh nói trước để em chuẩn bị tinh thần.
    _Cả phòng quay lại nhìn bạn. Ở ghế bên cạnh sếp, {thanh_ninh} đánh rơi cây bút. Bạn mỉm cười. Ngọt như đường hóa học._
- else:
    giam_doc: Ghế Phó Giám đốc… anh xin phép để sau Đại Nhạc Hội. Tháng này nhiều chuyện quá.
}
{ biet(danh_sach_cat_giam):
    _{hr} cầm tập hồ sơ hồng, không mở. "Danh sách cắt giảm… phòng nhân sự xin dời lại tới sau 31/10."_
}
-> END

// ------------------------------------------------------------
=== ran_doc_3010_dem_truoc ===
# ngay:30 # gio:22:00 # noi:hem_69
_Đêm trước Đại Nhạc Hội Siêu Nhân. Phòng 3, dãy A. Cuốn sổ tay nằm trên bàn. {rd_so_tin_mat} tin mật. Tên của tất cả mọi người._
_Bên kia vách, {hong_hot} không livestream. Chỉ có tiếng thở dài._
hong_hot: *(gõ vách)* Ông ơi. Ông ngủ chưa? Mai mà thất bại là tui mất việc. Tui sợ thiệt đó.
* [😇 Gõ vách trả lời: "Mai sẽ ổn. Tui hứa."]
    hong_hot: Ông hứa hả? Ông mà xạo là tui bóc ông lên confession á.
    ~ qh("hong_hot", 10)
    ~ rd_han(-5)
* [🐍 Không trả lời. Lật cuốn sổ, tìm trang viết về {hong_hot}.]
    _Trang của {hong_hot} dày nhất. Admin confession. Cái loa phường. Người add bạn vào group đầu tiên._
    ~ rd_han(3)
* [📓 Lật lại trang đầu tiên của cuốn sổ: hình vẽ cái lỗ thông gió hình con cá.]
    { rd_moi_han < 40:
        _Bạn nhìn con cá rất lâu. Rồi lần đầu tiên, bạn vẽ thêm một cánh cửa mở bên cạnh nó._
        ~ rd_han(-5)
    - else:
        _Bạn tô con cá thêm đậm. Mai là Đại Nhạc Hội Siêu Nhân. Mai mọi thứ kết thúc._
        ~ rd_han(5)
    }
- -> END

// ------------------------------------------------------------
=== ran_doc_3110_hoa_trang ===
# ngay:31 # gio:17:00 # noi:san_khau_dem_hong # bat_buoc
_Đại Nhạc Hội Siêu Nhân. Sân khấu ngoài trời ở Phường Tân Drama. Cả công ty hóa trang._
_{giam_doc} hóa trang "Ông Kẹ Ngân Hàng", đeo cà vạt in hình tờ giấy nợ. {cho} đeo cánh dơi, mặt cực kỳ không vui. {thanh_xin_nghi} biến mất, vì 20:00 có chung kết "Giọng Ca Ước Mơ"._
chi_dai: {ran_doc}, em hóa trang gì? Chị chưa thấy.
* [🐍 Hóa trang thành con rắn. Không giấu nữa.]
    chi_dai: *(nhìn bạn từ đầu tới chân)* …Cũng hợp. Mà tối nay đừng có cắn ai.
    ~ rd_do_doc = gioi_han(rd_do_doc + 5)
* [🐸 Hóa trang thành con ếch.]
    { rd_mo_nhanh_hieu_ech:
        _{sieu_nhan_hong} nhìn thấy bạn từ cánh gà. Hắn đứng im rất lâu, rồi đưa tay lên mũ chào, như chào một người quen cũ._
        ~ rd_han(-10)
    - else:
        hong_hot: Ủa ếch? Sao ếch? Dễ thương mà kỳ kỳ.
        ~ rd_han(-5)
    }
* [😇 Mặc áo thun cam công ty, đeo một món đồ hồng.]
    chi_dai: Đúng nội quy. Chị thích. Thôi lên cánh gà phụ chị.
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== ran_doc_3110_canh_ga ===
# ngay:31 # gio:19:20 # noi:canh_ga_dem_hong # bat_buoc
_Cánh gà. 10 phút nữa mở màn. {chi_dai} đứng cạnh tủ điện, một tay đặt lên cầu dao tổng, tay kia cầm bộ đàm. Không ai qua được chị._
chi_dai: {ran_doc}, em đứng bàn cue với {chua_te_deadline}. Có gì báo chị.
_Bàn cue có một cái laptop mở sẵn: lịch chạy chương trình, phút nào ai lên. Bên kia đường, màn hình LED trên tòa LL-Entertainment tối om, như đang chờ ai đó bấm nút._
{ rd_bao_ll_lich_dien:
    _Điện thoại bạn rung. Số của thư ký LL: "Anh nhắn em đúng giây Siêu Nhân Hồng bước ra nha anh." Kèm một trái tim xanh lá._
}
* [💥 Nhắn cho LL đúng giây {sieu_nhan_hong} bước ra.]
    ~ rd_cat_dien_dem_hong = true
    ~ rd_pha(30000)
    ~ rd_nghi(10)
    _Bạn bấm gửi. Lát nữa, đúng lúc bộ đồ hồng bước vào luồng sáng, màn hình LED bên kia đường sẽ bật "Hồng Ngoại" lên, to bằng cả tòa nhà. Nửa khán đài sẽ quay đầu._
    _{chua_te_deadline} liếc màn hình điện thoại của bạn, rồi nhìn bạn rất lâu. Không nói gì._
* [🤝 Báo {chi_dai}: "Chị ơi, LL có lịch chạy chương trình. Họ canh giờ bật màn hình LED."]
    ~ rd_giu_cau_dao = true
    ~ rd_giup(20000)
    chi_dai: *(bộ đàm)* {it}! Đẩy tiết mục chính sớm ba phút. Đừng hỏi.
    { rd_bao_ll_lich_dien:
        _Bạn đã gửi lịch cho họ. Giờ bạn đứng phá cái lịch của chính mình. {chi_dai} không hỏi bạn biết bằng cách nào. Chị chỉ gật đầu._
        ~ rd_han(-5)
    - else:
        _{chi_dai} nhìn bạn. Lần đầu tiên trong tháng, ánh mắt đó không có chữ "nghi"._
        ~ rd_nghi(-5)
    }
* [😶 Đưa tai nghe cho {chua_te_deadline}, đi xuống khán đài.]
    chua_te_deadline: Ừ. Đi đi. Tui giữ.
    _Bạn đi xuống khán đài. Đứng ở hàng cuối, giữa đám đông, như một người lạ._
- -> END

// ------------------------------------------------------------
=== ran_doc_3110_truoc_gio_dien ===
# ngay:31 # gio:19:25 # noi:canh_ga_dem_hong # bat_buoc
{ nguyen_theo_ll:
    _19 giờ 25. Phòng thay đồ của Siêu Nhân Hồng trống trơn. Chỉ còn cái móc áo hồng và một hộp chè Bà Bảy chưa mở._
    _Bên kia đường, trên tầng thượng tòa LL, có một bóng hồng viền xanh lá chuối đang đứng. Bạn nhìn lên. Bạn không biết mình muốn thấy gì._
    { rd_day_nguyen_sang_ll:
        ~ rd_han(-5)
        _Câu "Gấp ba mà anh" của bạn hôm 27 vẫn còn văng vẳng. Lần này không ai bị nhốt trong nhà kho. Người ta tự bước vào._
    }
    -> END
}
_19 giờ 25. Năm phút nữa mở màn. {sieu_nhan_hong} đứng một mình sau tấm phông đen, chỉnh lại găng tay. Thấy bạn, hắn khựng lại._
{ rd_mo_nhanh_hieu_ech && rd_moi_han < 40:
    sieu_nhan_hong: *(nói rất nhỏ)* {ran_doc}. Hết show, anh muốn mời em lên sân khấu. Anh muốn nói chuyện nhà kho trước mặt mọi người. Em cho phép hông?
    * [😇 "Ừ. Em lên."]
        ~ rd_len_san_khau = true
        ~ nguyen_thao_mu_dem_hong = true
        ~ rd_han(-10)
        sieu_nhan_hong: *(hít một hơi thật sâu)* Vậy… tối nay anh tháo mũ luôn. Lâu rồi anh muốn làm vậy.
        -> END
    * [😶 "Anh nói với em là đủ rồi. Đừng kéo em lên."]
        sieu_nhan_hong: *(gật đầu)* Ừ. Anh hiểu. Em đứng ở đâu anh cũng biết.
        ~ rd_han(-5)
        -> END
- else:
    sieu_nhan_hong: Ủa em! Em đứng cue hả? Tối nay nhờ em nha!
    * [😇 "Diễn tốt nha anh."]
        sieu_nhan_hong: *(tạo dáng chữ V)* Hồng là thái độ!
        ~ rd_han(-3)
        -> END
    * [🐍 Mỉm cười, không trả lời.]
        _Hắn chờ một câu trả lời không tới, rồi gãi đầu dưới mũ, đi ra phía ánh đèn._
        ~ rd_han(3)
        -> END
}
-> END
