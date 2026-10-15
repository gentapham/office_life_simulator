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
# ngay:28 # gio:14:10 # noi:phong_dung_phim
_Fanpage công ty vừa đăng một video lạ: 3 phút, nhạc piano, toàn cảnh {quan_ly_idol} làm việc. Đoạn cuối có dòng chữ: "Anh có biết em đã dựng bao nhiêu đêm vì anh không?"_
_Không phải video quảng cáo. Là video tỏ tình. Của {editor}. Bị xuất nhầm._
editor: *(gõ cửa phòng server liên tục)* Anh {it}! Gỡ giùm em! GỠ GIÙM EM!
~ phat_hien(linh_thich_thai)
* [🤝 Chạy vào phòng server, đọc mật khẩu fanpage cho {it}.]
    ~ qh("editor", 20)
    ~ qh("it", 5)
    _Video bị gỡ sau 6 phút. 6 phút đủ để 2.000 người xem. Nhưng không đủ để thành drama._
    editor: *(ngồi bệt xuống sàn)* Cảm ơn ông. Thật sự cảm ơn ông.
* [🐍 Tải video về trước khi bị gỡ.]
    ~ rd_tin_mat()
    ~ rd_nghi(5)
    _Bạn có một video tỏ tình trong máy. Bạn chưa biết làm gì với nó. Bạn chỉ biết mình không nên làm gì với nó._
* [🔥 Chia sẻ lại vào group Anti Sếp: "Ối dồi ôi, đám cá tươi tới rồi!"]
    ~ rd_tung_tin(12, 10)
    ~ qh("editor", -25)
    ~ qh("quan_ly_idol", -10)
    _{editor} không ra khỏi phòng dựng cả ngày hôm đó. Ở bàn bên kia, {quan_ly_idol} xem video ba lần, mặt không biểu cảm._
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
_Video "16 năm" của {editor} kẹt ở 99%. Chiến dịch mạng xã hội đứng hình._
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
* [🐍 "Không có camera thì anh cũng chỉ là người thường thôi ha."]
    sieu_nhan_hong: *(cười rất nhẹ)* Ừ. Anh biết. Anh sợ nhất là người ta biết điều đó.
    ~ rd_han(3)
    _Bạn vừa nói trúng nỗi sợ của hắn. Lẽ ra phải thấy thắng. Mà không thấy gì cả._
- _Bác {bac_bao_ve} đánh cờ ở bàn bên với ông Ba trà đá. Làm như không nghe thấy gì._
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
# ngay:30 # gio:10:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. Cả công ty ngồi kín phòng "Sáng Tạo". {sieu_nhan_hong} dự với tư cách đối tác. Trên bàn {hr} là tập hồ sơ màu hồng._
giam_doc: Hôm nay anh công bố ghế Phó Giám đốc, tăng lương, và… những thay đổi về nhân sự.
{ rd_nghi_ngo >= 100:
    _Màn hình chiếu tự bật. Ảnh chụp tin nhắn của bạn. Từng cái một. Group Anti Sếp. Nick ảo. File MV. Tờ giấy giả chữ ký._
    _Cả phòng quay lại nhìn bạn. Không ai nói gì. Không cần ai nói gì._
    -> END
}
{ not rd_biet_ran_hai:
    _{ten(ran_thu_hai)} đứng dậy, cắm USB vào máy chiếu. Trên màn hình: tập "bằng chứng" có tên bạn. Ảnh, tin nhắn, ghi âm. Cái gì cũng thật. Chỉ thiếu phần của chính người đó._
    _"Tui chỉ nói sự thật thôi mà."_
    _Câu cửa miệng của bạn. Từ miệng người khác._
    ~ rd_nghi(40)
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
    giam_doc: Người duy nhất không dính vào chuyện gì trong tháng này là… {ran_doc}.
    _Cả phòng quay lại nhìn bạn. Bạn mỉm cười. Ngọt như đường hóa học._
- else:
    giam_doc: Ghế Phó Giám đốc… anh xin phép để sau Đêm Hồng. Tháng này nhiều chuyện quá.
}
{ biet(danh_sach_cat_giam):
    _{hr} cầm tập hồ sơ hồng, không mở. "Danh sách cắt giảm… phòng nhân sự xin dời lại tới sau 31/10."_
}
-> END

// ------------------------------------------------------------
=== ran_doc_3010_dem_truoc ===
# ngay:30 # gio:22:00 # noi:hem_69
_Đêm trước Đêm Hồng. Phòng 3, dãy A. Cuốn sổ tay nằm trên bàn. {rd_so_tin_mat} tin mật. Tên của tất cả mọi người._
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
        _Bạn tô con cá thêm đậm. Mai là Đêm Hồng. Mai mọi thứ kết thúc._
        ~ rd_han(5)
    }
- -> END

// ------------------------------------------------------------
=== ran_doc_3110_hoa_trang ===
# ngay:31 # gio:17:00 # noi:san_khau_dem_hong # bat_buoc
_Đêm Hồng Halloween. Sân khấu ngoài trời ở Phường Tân Drama. Cả công ty hóa trang._
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
_Cánh gà. 10 phút nữa mở màn. Tủ điện sân khấu nằm sau tấm phông đen. Cầu dao tổng: một cái cần gạt đỏ._
_{chi_dai} đưa bạn bộ đàm: "Em giữ khu này giùm chị. Không ai được đụng vào tủ điện."_
{ rd_bao_ll_lich_dien:
    _Một người lạ áo xanh lá chuối đứng gần tủ điện. Người của LL. Cầm đúng bản lịch bạn đã gửi._
}
_Bạn đứng một mình với cái cần gạt đỏ. Gạt xuống là Đêm Hồng tối om, trước cả nghìn khán giả và mấy chục máy quay._
* [💥 Gạt cầu dao vào đúng lúc {sieu_nhan_hong} bước ra.]
    ~ rd_cat_dien_dem_hong = true
    ~ rd_pha(150000)
    _Tối om. Cả sân khấu hét lên. 3 giây. 5 giây. Rồi từ khán đài, một ánh đèn điện thoại bật lên. Rồi hai. Rồi một nghìn._
    _Giữa biển đèn điện thoại, {sieu_nhan_hong} đứng một mình, không nhạc, không micro, và bắt đầu hát "Công Viên". Sai lời. Cả khán đài hát theo._
    ~ follow(100000)
    _Bạn phá. Bạn lại vừa tạo ra khoảnh khắc đẹp nhất đêm nay. Bạn ngồi bệt xuống sau tủ điện, không biết nên cười hay khóc._
* [🤝 Đứng chắn trước tủ điện suốt buổi diễn.]
    ~ rd_giu_cau_dao = true
    ~ rd_giup(30000)
    { rd_bao_ll_lich_dien:
        _Người áo xanh lá chuối tiến lại gần. Bạn không nhúc nhích. Người đó nhìn bạn, nhìn bộ đàm, rồi lùi đi. Bạn đã gửi lịch cho họ. Giờ bạn đứng chặn họ._
        ~ rd_han(-5)
    - else:
        _Không ai tới gần tủ điện. Bạn đứng đó cả đêm, nghe nhạc vọng từ sân khấu, và thấy mình giống bác {bac_bao_ve}: người giữ cổng._
    }
* [😶 Đưa bộ đàm cho {it}, đi xuống khán đài.]
    it: Ừ. Đi đi. Tôi giữ.
    _Bạn đi xuống khán đài. Đứng ở hàng cuối, giữa đám đông, như một người lạ._
- -> END

// ------------------------------------------------------------
=== ran_doc_3110_dem_hong ===
# ngay:31 # gio:21:30 # noi:san_khau_dem_hong # bat_buoc
_Phim ngắn "Người Hùng Không Tên" mở màn. Rồi video "16 năm" của {editor}. Rồi đèn tắt, và bộ đồ hồng bước ra giữa sân khấu._
{ rd_mo_nhanh_hieu_ech && rd_moi_han < 40:
    sieu_nhan_hong: *(micro rung)* Trước khi hát, anh muốn mời một người lên đây. Người đó tên {ran_doc}.
    _Cả nghìn ánh mắt quay lại tìm bạn._
    * [😇 Bước lên sân khấu.]
        _Bạn bước lên. Đèn chói. {sieu_nhan_hong} tháo mũ, trước cả nghìn người và mấy chục máy quay._
        ~ nguyen_thao_mu_dem_hong = true
        sieu_nhan_hong: Hồi nhỏ, anh nhốt em này trong nhà kho cả buổi chiều. Anh gọi em là {ran_doc} Ếch. Anh xin lỗi. Trước mặt mọi người.
        _Hắn cúi đầu. Rất lâu._
        ~ rd_han(-20)
        ~ rd_nguyen_xin_loi = true
        -> END
    * [😶 Đứng yên dưới khán đài.]
        _Bạn không bước lên. {sieu_nhan_hong} đợi 10 giây, rồi gật đầu, như đã hiểu. Hắn hát. Bài hát dành cho một người đứng ở hàng cuối._
        ~ rd_han(-5)
        -> END
- else:
    _{sieu_nhan_hong} tạo dáng giữa pháo hoa. "Hồng không phải màu, Hồng là thái độ!" Cả khán đài hô theo._
    _Bạn đứng nhìn. Con số trên màn hình lớn sau sân khấu chạy liên tục: {nguoi_theo_doi}._
}
-> END
