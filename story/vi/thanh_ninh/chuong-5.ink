// ============================================================
// THÁNH NỊNH: NHI · CHƯƠNG 5: "PHỎNG VẤN XANH LÁ CHUỐI" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_ninh_2110_bai_confession ===
# ngay:21 # gio:08:10 # noi:ban_tro_ly # bat_buoc
_Trang Confession G-Entertainment, 6:00 sáng: "Sếp đang thế chấp nhà, công ty sắp sập." Chi tiết tới từng ngày quá hạn, tên ngân hàng, số biệt thự._
{ tn_gui_confession_the_chap:
    _Bạn là người bấm gửi bài đó. Tay bạn lạnh ngắt trên bàn phím._
- else:
    _Bạn không gửi bài này. Nhưng ai viết nó đã đọc những gì chỉ bạn đọc được. Hoặc ai đó đã đọc qua vai bạn._
}
_Mốc 3 là hôm nay: 500.000 người theo dõi. Con số: {nguoi_theo_doi}. Không ai còn tâm trí nhìn nó._
_9 giờ 30. Sếp bước vào, không nhìn bạn. Cửa kính đóng lại. Mười phút sau, sếp gọi {hr} và {it} lên._
* [🍵 Pha trà, gõ cửa, mang vào.]
    giam_doc: Để đấy.
    _Hai chữ. Ba năm nay chưa bao giờ sếp nói với bạn chỉ hai chữ._
    ~ tn_ninh(-5)
* [🙇 Nhắn sếp: "Anh ơi, em tin anh. Bài đó bịa hết, để em báo cáo trang đó nha anh."]
    ~ tn_khen()
    giam_doc: *(đã xem)*
    _Không trả lời. Bạn biết sếp biết bài đó không bịa chữ nào._
* [😇 Gõ cửa, nói thẳng: "Anh. Em đọc email của anh mỗi ngày. Em biết hết chuyện đó từ lâu rồi."]
    giam_doc: *(ngước lên)* … Anh biết em biết.
    { tn_gui_confession_the_chap:
        _Bạn định nói tiếp câu thứ hai. Câu "em đã gửi bài đó". Nhưng chữ kẹt trong cổ._
    - else:
        giam_doc: Nhưng anh tin không phải em. Ngồi xuống đi.
        ~ qh("giam_doc", 10)
        ~ tn_ninh(5)
    }
- { nguoi_theo_doi < 500000:
    _Chiều đó, tin đồn cắt giảm nhân sự bắt đầu lan. Có người nói danh sách đã có 7 tên._
    ~ cang_thang(10)
}
-> END

// ------------------------------------------------------------
=== thanh_ninh_2110_tra_voi_tuan ===
# ngay:21 # gio:14:00 # noi:phong_hr
_Phòng HR. Ấm trà Ô Long. {hr} mỉm cười._
hr: Em {thanh_ninh}. Anh chỉ muốn lắng nghe em thôi. Trong công ty, ai đọc được email của sếp?
* [🙇 "Dạ… em. Sếp nhờ em lọc thư mà anh. Sếp tin em lắm."]
    hr: Anh biết. Vì vậy anh mới mời em đầu tiên.
    ~ qh("hr", 3)
    _Nụ cười của {hr} không đổi. Ly trà của bạn thì nguội dần._
* [🧂 "Anh hỏi {ran_doc} thử. Ổng mới vô mà biết nhiều lắm."]
    ~ qh("ran_doc", -15)
    hr: *(ghi chép)* Ừ. Anh ghi nhận.
    { tn_gui_confession_the_chap:
        _Bạn vừa đổ tội cho một người vô tội. Bạn ngồi đó, uống hết ly trà, mặt không biến sắc. Bạn giỏi việc này hơn bạn tưởng._
        ~ tn_xanh(5)
    }
* {tn_dong_minh_ke_toan} [🔒 "Chị {ke_toan} cũng biết từ đầu. Hai đứa em giữ kín cho sếp, hông ai nói ra ngoài."]
    hr: *(đặt chén xuống)* … {ke_toan} biết à.
    _{hr} im một lúc lâu. Lần đầu bạn thấy {hr} hết cười._
    hr: Em về làm việc đi. Anh sẽ tìm theo hướng khác.
    ~ qh("hr", 5)
    ~ qh("ke_toan", 5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2110_bao_log ===
# ngay:21 # gio:17:45 # noi:phong_server
_Phòng server. Quạt công nghiệp. Mì ly. {it} quay màn hình về phía bạn: lịch sử đăng nhập hộp thư của sếp._
it: Em đăng nhập lúc 7:50 mỗi sáng. Ok. Còn 23:12 tối 20/10, ai?
{ tn_gui_confession_the_chap:
    _23:12 tối qua. Bạn mở hộp thư sếp để chép lại ngày quá hạn cho chính xác. Để "giúp" bài viết của LL đúng hơn._
- else:
    _23:12. Giờ đó bạn đang ngủ. Hoặc đang nằm đọc phong bì LL. Không phải bạn. Vậy là ai?_
}
* [😶 "Em hông biết anh."]
    it: Ừ.
    { tn_gui_confession_the_chap:
        ~ tn_bi_lo_hai_mang = tn_xanh_la_chuoi >= 80
        _{it} nhìn bạn thêm một giây, rồi quay về màn hình. Một giây đó dài lắm._
    }
* [😇 "Anh {it}, em nói thật. {tn_gui_confession_the_chap: Em gửi bài đó. LL nhờ.|Hông phải em. Em nghĩ có người khác biết mật khẩu.}"]
    { tn_gui_confession_the_chap:
        it: … Đổi mật khẩu đi. Rồi đi nói với sếp.
        ~ tn_noi_that_2 = true
        ~ tn_xanh(-15)
        ~ qh("it", 5)
    - else:
        it: Ừ. Log này đăng nhập từ máy có tên "LL-GUEST". Em đổi mật khẩu đi.
        ~ qh("it", 10)
        ~ phat_hien(ran_thu_hai_lo_mat)
    }
* [🙇 "Anh {it} ơi, anh xóa giùm em dòng log đó được hông anh? Em mời anh ăn mì ly cả tháng."]
    it: Lỗi người dùng.
    _Có nghĩa là "không"._
    ~ qh("it", -10)
    { tn_xanh_la_chuoi >= 80:
        ~ tn_bi_lo_hai_mang = true
    }
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2210_doan_thue ===
# ngay:22 # gio:09:00 # noi:sanh_cong_ty # bat_buoc
_Đoàn kiểm tra thuế tới bất ngờ. Trưởng đoàn là Chú Liêm, 55 tuổi, đồ công sở tối màu, cặp tài liệu dày. Sếp cử bạn ra tiếp._
_Cả công ty giả vờ làm việc chăm chỉ. {chua_te_deadline} lần đầu mở file Excel. {ke_toan} trắng bệch._
chu_liem: Cho xem sổ sách. Bản gốc giấy tờ thành lập, hợp đồng với BTT Global, nghiệm thu dự án tháng 6. Và khoản 5 tỷ từ đâu.
* [🙇 "Dạ chú kiểm tra có tâm quá chú ơi! Chú dùng trà sen nha chú."]
    chu_liem: Trà thì được. Sổ sách đâu cháu?
    ~ tn_khen()
    _Lời khen vừa đủ: chú gật đầu, chú uống trà. Nhưng chú vẫn hỏi sổ sách._
    ~ qh("ke_toan", 3)
* [🍱 "Dạ trưa nay em mời chú với đoàn đi buffet nha chú, nhà hàng sang lắm."]
    chu_liem: *(nhíu mày)* Cháu nói lại xem nào? Mời đoàn kiểm tra đi ăn?
    _{ke_toan} nhắm mắt lại như đang cầu nguyện._
    ~ tn_ninh(-8)
    ~ qh("ke_toan", -15)
    ~ uy_tin = uy_tin - 10
* [🤝 Dẫn đoàn thẳng tới phòng {ke_toan}: "Dạ chị {ke_toan} giữ hết sổ sách, chính xác tới từng đồng."]
    ~ qh("ke_toan", 10)
    ~ uy_tin = uy_tin + 3
    chu_liem: Tốt. Làm việc thế là chuẩn.
- _Đúng lúc đó, {cho} từ gầm cầu thang chạy ra vẫy đuôi. Chú Liêm lùi một bước, rồi hai bước, rồi trèo lên ghế sofa._
chu_liem: Con… con chó của ai đây?!
* [🙇 Ôm {cho} ra ngoài, quay lại khen chú "dáng đứng trên ghế rất uy nghiêm".]
    ~ tn_khen()
    chu_liem: *(leo xuống, chỉnh cà vạt)* … Thôi được. Làm tiếp.
* [👇 "{thuc_tap_sinh}! Dắt chó ra!"]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ em dắt liền ạ! {cho} ơi đi với anh!
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2210_giay_to_goc ===
# ngay:22 # gio:14:00 # noi:choi_bao_ve
_Đoàn đòi bản gốc giấy tờ thành lập. Sếp lục tung phòng giám đốc. Không có. Sếp không biết bản gốc ở đâu._
_Bạn thì biết một điều: cái tủ thư của Bác {bac_bao_ve} chưa ai được mở._
bac_bao_ve: Cháu tìm bác à?
* [🙇 "Bác ơi, sếp cần gấp giấy tờ thành lập. Bác có giữ hông bác?"]
    bac_bao_ve: *(im lặng một lúc)* … Bản gốc đứng tên người khác. Bác giữ hộ người ta. Sáng nay bác đã về Ven Đô lấy rồi, đang để trong chòi.
    ~ qh("bac_bao_ve", 5)
    _"Người khác". Bạn không hỏi thêm. Bác cũng không nói thêm._
* [🚪 Không hỏi bác, chạy lên báo sếp: "Anh, chắc bản gốc thất lạc rồi anh."]
    ~ uy_tin = uy_tin - 3
    giam_doc: Thất lạc à… thế thì chết anh.
    _Đoàn hẹn quay lại tuần sau. Bác {bac_bao_ve} đứng ở cổng, nhìn lên tầng 2, lắc đầu khẽ._
* [😶 Mời bác ly trà, không hỏi gì.]
    ~ qh("bac_bao_ve", 10)
    bac_bao_ve: Ừ. Cháu ngồi chơi. Chuyện giấy tờ… để bác lo.
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2310_qua_sinh_nhat ===
# ngay:23 # gio:08:00 # noi:sieu_thi_mini # bat_buoc
_Sinh nhật {sieu_nhan_hong}. Sếp đưa bạn tiền túi lần nữa: mua quà thay mặt công ty. Phong bì mỏng hơn hôm 20/10._
* [🎁 Đi chọn quà. (Minigame "Mua Quà Thay Sếp")]
    -> thanh_ninh_mg_mua_qua

// ------------------------------------------------------------
=== thanh_ninh_2310_loi_chuc ===
# ngay:23 # gio:13:00 # noi:ban_tro_ly
_Sếp nhờ bạn viết lời chúc để đọc trong livestream sinh nhật. Livestream cần thêm người đóng vai "Mr. Kevin Trộn" chúc mừng qua video. {sales} đang đứng sau bạn, nhìn danh sách nhân sự._
sales: Chị {thanh_ninh}, tin em đi, chú {bac_bao_ve} đóng Kevin Trộn là chắc kèo!
* [✍️ Viết lời chúc ngắn, nói về những lần {sieu_nhan_hong} bỏ quay để giúp người.]
    _Sếp đọc nháp. Gật. Sửa đúng một chữ: "chúng tôi" thành "chúng anh"._
    ~ follow(5000)
    ~ qh("sieu_nhan_hong", 5)
* [🙇 Viết lời chúc mà 70% là kể chuyện sếp khởi nghiệp.]
    ~ tn_ninh(3)
    giam_doc: Hay! Hay! Nhưng hơi nhiều anh quá… thôi kệ, đọc.
    ~ follow(-2000)
* [💬 "{sales}, Kevin Trộn hông có thật đúng hông em?"]
    sales: *(cười rạng rỡ)* … Chị {thanh_ninh} nói gì kỳ vậy. Tin em đi.
    ~ phat_hien(btt_global_gia)
    _Nụ cười của {sales} có một vết nứt rất nhỏ. Bạn nhận ra vì bạn cũng có vết nứt đó._
    ~ qh("sales", 2)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2310_banh_kem ===
# ngay:23 # gio:20:30 # noi:studio_tang_2 # bat_buoc
_20 giờ 30, studio tầng 2. Livestream sinh nhật. Bánh kem hồng 3 tầng. {sieu_nhan_hong} vừa tỏ tình giữa livestream. Màn hình bình luận chạy chữ \#{chua_te_deadline}ƠiTrảLờiĐi._
_Rồi {cho} lao ra. Bánh kem đổ úp. Kem hồng dính đầy mũ. 30.000 người đang xem._
_Sếp quay sang bạn, mặt cắt không còn giọt máu._
giam_doc: {thanh_ninh}… em nói xem anh nên làm gì?
_Lần đầu tiên trong ba năm, sếp hỏi ý kiến thật của bạn._
~ tn_sep_hoi_y_kien = true
* [🙇 "Dạ anh làm gì cũng đúng hết anh ơi!"]
    giam_doc: *(nhìn bạn 2 giây)* … Ừ.
    ~ tn_ninh(-5)
    _Sếp tự quyết: hô cắt livestream. Màn hình đen. 30.000 người thoát ra._
    ~ follow(-10000)
* [😇 "Anh đừng cắt. Anh bước lên, cười, xin lỗi, rồi mời mọi người ăn phần bánh còn lại."]
    _Sếp bước ra trước máy quay, cầm micro, cười gượng rồi cười thật. "Thôi các em, sinh nhật ai mà chẳng có đổ vỡ." Cả studio vỗ tay._
    ~ follow(20000)
    ~ qh("giam_doc", 15)
    ~ tn_noi_that_1 = true
    ~ tn_gian(-5)
* [🧹 "Anh để em." Lao lên dọn bánh, che camera cho {sieu_nhan_hong} chỉnh lại mũ.]
    ~ follow(10000)
    ~ qh("sieu_nhan_hong", 10)
    ~ tn_ninh(3)
    _Bạn dính kem hồng từ cổ tới gối. {hong_hot} giữ cảnh đó. Bạn lên xu hướng vì "trợ lý quốc dân"._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2410_hoa_giai ===
# ngay:24 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Liên Hợp Quốc. "Hội nghị hòa giải" của {chi_dai}. Các cặp: {truong_phong} với {con_ong_chau_cha}, {designer} với {bien_kich}, {sales} với {ke_toan}, {hr} với {thanh_xin_nghi}. Bàn riêng "chủ nợ" cho {dan_dau_tu}._
ke_toan: Bà làm chủ tọa thì bà cũng phải hòa giải. Ngồi xuống đi. {thanh_ninh} ngồi đối diện đó.
_{chi_dai} ngồi xuống đối diện bạn. Chị nhìn bạn thẳng._
{ tn_gian_chi_dai <= 30:
    chi_dai: Thôi khỏi nói. Chủ nhật này về nhà chị ăn cơm.
    _Bạn sững người. Lần đầu tiên có người rủ bạn ăn cơm mà không phải sếp._
    ~ tn_gian(-10)
    ~ qh("chi_dai", 10)
    -> END
- else:
    chi_dai: Chị ghét em vì em nịnh. Nhưng chị biết em mệt. Em muốn gì ở công ty này, nói thật đi.
}
* [😢 Kể chuyện phỏng vấn LL, chuyện sợ bị cắt, chuyện ba năm chưa nghỉ phép ngày nào.]
    _Bạn khóc. Ngay giữa hội nghị hòa giải. {ke_toan} đưa khăn giấy._
    ~ tn_gian(-25)
    ~ qh("chi_dai", 20)
    chi_dai: Ừ. Vậy giờ mình tính. Mà tính cho đàng hoàng.
* [🙇 "Dạ em muốn chị với em hòa nhau, vì công ty là một family ạ."]
    chi_dai: Câu đó của ổng. Chị hỏi câu của em.
    ~ tn_gian(10)
* [🗡️ "Em muốn chị bớt nhìn em như nhìn con gián."]
    _{ke_toan} sặc trà. {chi_dai} cười thành tiếng._
    chi_dai: Ờ. Chị sẽ cố. Em cũng bớt bò lên bàn sếp đi.
    ~ tn_gian(-10)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2510_sanh_ll ===
# ngay:25 # gio:10:00 # noi:sanh_ll_entertainment # bat_buoc
_Chủ nhật. Lịch phỏng vấn là 15 giờ, mà 10 giờ bạn đã đứng ở sảnh, mặc áo xanh lá cho "hợp tông". Tòa nhà kính 20 tầng xanh lá chuối nằm ngay đối diện {cong_ty}, cách một con đường. Slogan trên tường: "Việc hôm nay phải xong từ hôm qua."_
_Ở sảnh, bạn đụng mặt một người ôm laptop, đeo khẩu trang: {designer}._
_Hai người nhìn nhau ba giây._
designer: … Ủa, đường này đi ra Chợ Phố Cũ hả bà?
* [😶 "Ờ… tui cũng đang tìm đường ra Chợ Phố Cũ."]
    _Cả hai cùng gật đầu, cùng quay đi, cùng đi lạc theo hai hướng khác nhau trong một tòa nhà có đúng một lối ra._
    ~ qh("designer", 5)
* [💬 "Bà làm cho LL hả?"]
    designer: Bà phỏng vấn LL hả?
    _Hòa. Không ai hỏi thêm câu nào._
    ~ qh("designer", 3)
* [🙇 Quay lưng, giả vờ gọi điện: "Dạ anh {giam_doc}, em tới chỗ đối tác rồi ạ."]
    _{designer} nghe rõ từng chữ. Ở công ty này, ai cũng nghe rõ từng chữ._
    ~ qh("designer", -3)
- _Thang máy mở. {quan_ly_idol} bước ra, hai điện thoại trên tay. Bạn quay mặt vào tường. Sau cột, hình như có ai đó của công ty đang đứng nhìn. Bạn không dám nhìn lại._
_Điện thoại rung. Tin nhắn của sếp: "Em đi lạc à?" Bên kia đường, cổng công ty, sếp đang đứng cạnh xe, tay cầm túi gậy golf._
* [🙇 "Dạ em đi làm nail ạ, tiệm ở tầng 20 ạ!"]
    _Tòa LL không có tiệm nail. Sếp không trả lời._
    ~ tn_ninh(-3)
* [😐 "Dạ không lạc. Em đi phỏng vấn. Em xin lỗi anh."]
    ~ tn_noi_that_1 = true
    _Ba phút sau: "Ừ. Đi cẩn thận." Không có chữ "tùy em"._
    ~ qh("giam_doc", 5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2510_cho_pho_cu ===
# ngay:25 # gio:11:00 # noi:cho_pho_cu
_11 giờ. Bạn trốn khỏi sảnh LL, đi bộ ra Chợ Phố Cũ cho bình tĩnh. Ở sạp đồ điện, {chi_dai} đang mặc cả hai cuộn dây điện với ông thợ quen._
chi_dai: Ủa. {thanh_ninh}. Đi lạc tới đây luôn hả?
{ tn_gian_chi_dai <= 50:
    chi_dai: Tiện thì đi theo chị. Bài hai: mua đồ cho sự kiện. Thứ gì rẻ thì mua hai cái, thứ gì quan trọng thì mua của người quen.
    * [✍️ Đi theo, ghi chép.]
        ~ tn_hoc_nghe_chi_dai = true
        ~ tn_gian(-10)
        ~ qh("chi_dai", 10)
        _Hai tiếng ở chợ. Bạn biết thêm vì sao đèn sân khấu phải thuê của ông thợ ở góc chợ chứ không phải công ty to. Chiều nay chị có hẹn bên Ven Đô, nên chị đi trước._
        -> END
    * [🙇 "Dạ em còn việc, chị ơi."]
        chi_dai: Ừ. Việc ở bên kia đường hả.
        ~ tn_gian(5)
        -> END
- else:
    _Chị quay lại với ông thợ điện. Bạn đứng đó một lúc, rồi đi._
    -> END
}

// ------------------------------------------------------------
=== thanh_ninh_2510_phong_van ===
# ngay:25 # gio:15:00 # noi:ll_entertainment # bat_buoc
_Phòng họp tầng 20. Ghế xoay da trắng. Người ngồi trên đó không phải chị tuyển dụng. Là Lưu Lực. Vest trắng, tóc vuốt keo._
luu_luc: *(xoay ghế, giọng diễn giả)* Em {thanh_ninh}. Ở LL, việc hôm nay phải xong từ hôm qua. Anh nghe nói em pha trà rất ngon.
* [🎭 "Dạ anh Lực nói chuẩn quá anh ơi! Văn phòng anh đẹp quá anh!"]
    ~ tn_xanh(15)
    ~ tn_khen()
    luu_luc: Anh biết. *(cười)* Em khen ai cũng hay thế à?
    _Bạn đứng hình nửa giây. Bạn không nhớ mình đang nịnh ai._
* [😐 "Dạ em pha trà, giữ lịch, và lọc email. Em làm tốt cả ba."]
    luu_luc: Lọc email. *(gõ bút lên bàn)* Thú vị.
    ~ tn_xanh(5)
- luu_luc: Câu hỏi cuối. Em có mang theo được… những gì em biết về anh {giam_doc} không?
* [🎭 "Dạ anh Lực nói chuẩn quá anh ơi! Em biết hết lịch của ổng luôn."]
    ~ tn_xanh(25)
    ~ tn_hai_mang = true
    ~ tn_mang_theo_bi_mat = true
    ~ tn_nhan_viec_ll = false
    luu_luc: Tuyệt. Em chưa cần nghỉ bên đó đâu. Cứ ở lại. "Cộng tác đặc biệt". Lương gấp đôi, trả riêng.
    _Bạn bước ra khỏi tòa nhà, cầm một tấm danh thiếp xanh lá chuối không có chức danh._
* [🙅 "Dạ em mang theo được kinh nghiệm làm trợ lý thôi anh."]
    ~ tn_xanh(-10)
    luu_luc: *(mỉm cười, gập hồ sơ)* Anh sẽ liên lạc lại.
    _Bạn biết câu đó. Bạn đã nói câu đó cả trăm lần thay sếp. Nó có nghĩa là "không bao giờ"._
    { tn_xanh_la_chuoi < 70:
        _Nhưng chiều đó, có một email: "LL mời em vị trí Trợ lý Hành chính, thử việc 2 tháng." Một công việc thật. Không cần mang theo gì._
        ~ tn_nhan_viec_ll = true
    }
* [🚪 Đứng dậy: "Em xin phép. Em nhớ ra em có việc ở công ty."]
    ~ tn_xanh_la_chuoi = 0
    ~ tn_tu_choi_ll = true
    ~ tn_hai_mang = false
    ~ tn_co_thu_moi_ll = false
    _Về tới căn 302, bạn mở ngăn bàn, lấy thư mời ra, xé làm tư. Rồi làm tám._
* {tn_hoc_nghe_chi_dai} [🔒 "Anh Lực, anh cần tai mắt chứ đâu cần trợ lý, đúng hông?"]
    _Lưu Lực khựng lại. Lần đầu tiên nụ cười diễn giả rơi xuống sàn._
    luu_luc: … Em thông minh hơn anh nghĩ. Đúng. Anh cần người đọc được hộp thư của {giam_doc}. Em có hiểu đó là một lời khen không?
    _Điện thoại trong túi áo bạn đang ghi âm. {chi_dai} dạy: "Đi gặp người lạ thì luôn bật ghi âm."_
    ~ tn_co_ghi_am_luu_luc = true
    ~ tn_tu_choi_ll = true
    ~ tn_xanh_la_chuoi = 0
    ~ tn_hai_mang = false
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2610_cat_giam ===
# ngay:26 # gio:08:30 # noi:ban_tro_ly # bat_buoc
_Họp giao ban. Tin đồn "cắt giảm nếu Siêu Nhân Hồng thất bại" lan khắp công ty. Hôm nay là hạn chót 7 tên._
_Hộp thư của sếp: email gửi {hr}, tiêu đề "Danh sách". Có tên {thuc_tap_sinh}. Có tên {thanh_xin_nghi}. Không có tên bạn._
~ phat_hien(danh_sach_cat_giam)
~ tn_email(1)
* [😶 Đóng email. Không nói ai.]
    _Bạn đi ngang bàn {thuc_tap_sinh}. Anh ấy đang photo hồ sơ cho phòng khác, cười chào bạn._
    ~ cang_thang(5)
* [🤝 Nói nhỏ với {thuc_tap_sinh}: "{thuc_tap_sinh}, tuần này làm gì cũng ghi lại, rồi gửi chị. Chị trình sếp."]
    thuc_tap_sinh: Dạ… chị lo cho em ạ?
    ~ qh("thuc_tap_sinh", 15)
    ~ tn_gian(-8)
    _Lần đầu bạn dùng cái bàn trợ lý để đỡ một người ở dưới, chứ không phải đạp._
* [🙇 Gõ cửa phòng sếp: "Anh ơi, em xin tên {ran_doc} vô danh sách nha anh. Em nói thiệt lòng."]
    giam_doc: *(nhíu mày)* {thanh_ninh}. Đừng thế.
    ~ tn_ninh(-6)
    ~ qh("ran_doc", -10)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2610_chieu_thu ===
# ngay:26 # gio:16:00 # noi:phong_hop_tang_2
_Chiếu thử nội bộ phim "Người Hùng Không Tên". Biên kịch: {bien_kich}. Một người gác két ngân hàng, một cơn mưa, một chiếc xe chết máy, một người mặc đồ hồng._
_Bạn quay sang. {thuc_tap_sinh} đang ngồi hàng cuối, mắt đỏ hoe. Bạn nhớ hôm 2/10 ở pantry._
* [💬 Nói nhỏ với {bien_kich} lúc đèn bật: "Ý tưởng này {thuc_tap_sinh} kể ở pantry mà bà."]
    bien_kich: *(tái mặt)* Đây không phải đạo… *(rồi im)*
    ~ qh("bien_kich", -10)
    ~ qh("thuc_tap_sinh", 5)
    ~ tn_gian(-5)
* [🙇 Vỗ tay to nhất, khen sếp duyệt phim có tầm.]
    ~ tn_ninh(2)
    ~ tn_khen()
* [😶 Đưa {thuc_tap_sinh} khăn giấy.]
    thuc_tap_sinh: Dạ… em bị bụi vô mắt ạ.
    ~ qh("thuc_tap_sinh", 5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2610_email_dem ===
# ngay:26 # gio:23:50 # noi:nha_thanh_ninh # bat_buoc
_23:50. Thông báo trên điện thoại: hộp thư của sếp có email mới. Người gửi: Lưu Lực._
_"Gửi anh {giam_doc}. Sáng mai LL chính thức mời Siêu Nhân Hồng với mức gấp ba. Gửi trước để anh chuẩn bị tinh thần. Thân."_
_Lưu Lực cố tình gửi trước để dọa. Sếp chưa đọc. Sếp đang ngủ._
~ phat_hien(ll_moi_nguyen)
~ tn_email(1)
* [🗑️ Xóa email đi. Sếp không cần biết đêm nay.]
    _Email biến mất khỏi hộp thư. Nhưng nó vẫn nằm trong thùng rác. Và trong đầu bạn._
    { tn_hai_mang:
        ~ tn_xanh(10)
    }
* [⏰ Đặt báo thức 5:55 sáng.]
    _Bạn nằm nhìn trần nhà tới 2 giờ sáng. Tấm ảnh với sếp trên tường chưa bao giờ to như vậy._
    ~ nghi(-15)
* [🟢 Chuyển tiếp email cho thư ký LL: "Ổng chưa đọc."]
    ~ tn_xanh(15)
    ~ tn_mang_theo_bi_mat = true
    thu_ky_ll: Tuyệt vời em ơi 💚
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2710_sau_gio_sang ===
# ngay:27 # gio:06:00 # noi:nha_thanh_ninh # bat_buoc
_6 giờ sáng. Một trang showbiz vừa đăng tin LL mời Siêu Nhân Hồng gấp ba. Một tiếng nữa cả thành phố sẽ biết._
_Bạn đang cầm điện thoại. Số của sếp ở đầu danh bạ, mục "Yêu thích"._
* [📞 Gọi sếp dậy.]
    giam_doc: *(giọng ngái ngủ)* {thanh_ninh} à… mấy giờ rồi em…
    _Bạn kể hết. Cả chuyện email tối qua. Cả chuyện bạn đã đọc email trong thùng rác._
    giam_doc: … Em đọc cả thư đã xóa của anh à?
    _Im lặng 5 giây._
    giam_doc: Ừ. Cảm ơn em. Anh qua chỗ {quan_ly_idol} và {sieu_nhan_hong} ngay bây giờ.
    ~ tn_bao_truoc_loi_moi = true
    ~ tn_ninh(-5)
    ~ qh("giam_doc", 15)
    ~ tn_xanh(-10)
* [🍵 Đợi tới 7:45, pha ấm trà đặc nhất rồi mới nói.]
    _Sếp tới 9:30 như thường lệ. Tin đã lan khắp mạng. Ly trà đặc nhất của bạn không đủ đặc._
    ~ tn_ninh(1)
* [😶 Không gọi. Tắt điện thoại.]
    _Bạn nằm thêm. Lần đầu tiên trong ba năm bạn tới công ty sau sếp._
    ~ tn_ninh(-3)
    { tn_hai_mang:
        ~ tn_xanh(5)
    }
- -> END

// ------------------------------------------------------------
=== thanh_ninh_2710_luu_luc_toi ===
# ngay:27 # gio:15:00 # noi:sanh_cong_ty # bat_buoc
_Lưu Lực tới tận nơi. Vest trắng, cặp hồ sơ xanh lá chuối. Đi ngang qua sảnh, thấy {chi_dai}, ông ta làm rơi cả tập hồ sơ._
_Hồ sơ tung ra sàn. Lời mời cho {sieu_nhan_hong}, cho {quan_ly_idol}, cho {ke_toan}, cho {dan_dau_tu}… và một tờ ghi tên bạn: "{thanh_ninh}: cộng tác đặc biệt"._
luu_luc: *(nhặt vội, mồ hôi chảy qua lớp keo tóc)* Chào… chào chị.
{ tn_bao_truoc_loi_moi:
    _Sếp đã ngồi với {quan_ly_idol} và {sieu_nhan_hong} trong phòng họp từ 8 giờ sáng. Cửa đóng tới giờ._
}
* {tn_co_ghi_am_luu_luc} [🔒 Bật đoạn ghi âm cho {sieu_nhan_hong} nghe: "Anh cần người đọc được hộp thư của {giam_doc}…"]
    _{sieu_nhan_hong} nghe hết. Rồi quay sang Lưu Lực._
    sieu_nhan_hong: Anh muốn mua em, hay muốn mua cái hộp thư?
    _Lưu Lực không trả lời. Ông ta nhặt nốt tờ giấy cuối cùng và đi ra cửa._
    ~ nguyen_theo_ll = false
    ~ follow(20000)
    ~ qh("sieu_nhan_hong", 15)
    ~ qh("giam_doc", 10)
* [🙇 Đứng sau lưng sếp, cười chào Lưu Lực thật tươi như chào khách quý.]
    ~ tn_khen()
    _Lưu Lực nháy mắt với bạn. {chi_dai} thấy cái nháy mắt đó._
    ~ tn_gian(10)
    { tn_hai_mang:
        ~ tn_xanh(5)
    }
* [🦶 Lén giẫm lên tờ giấy có tên mình trước khi ai đọc được.]
    _Bạn đứng im, chân đè lên tờ "{thanh_ninh}: cộng tác đặc biệt". Lưu Lực nhặt hết, chỉ thiếu đúng một tờ._
    { RANDOM(1, 10) <= 3:
        ran_doc: *(cúi xuống nhặt giùm)* Chị {thanh_ninh}, rớt gì nè… ủa?
        { tn_hai_mang:
            ~ tn_bi_lo_hai_mang = true
        }
    }
- { tn_hai_mang && not tn_bao_truoc_loi_moi && not tn_co_ghi_am_luu_luc && tn_xanh_la_chuoi >= 80:
    _Chiều đó, {sieu_nhan_hong} không trả lời tin nhắn của ai. Mọi điều Lưu Lực nói với {sieu_nhan_hong} đều trúng đúng chỗ, như đã đọc trước lịch của cả công ty._
    ~ nguyen_theo_ll = true
}
-> END

// ------------------------------------------------------------
=== thanh_ninh_2710_lich_dem_hong ===
# ngay:27 # gio:21:00 # noi:nha_thanh_ninh # dieu_kien:tn_xanh_la_chuoi>=40
_Thư ký LL nhắn: "Em ơi, cho chị xin lịch Đại Nhạc Hội Siêu Nhân chi tiết nha: giờ diễn, lối vào hậu trường, ai đứng cạnh {sieu_nhan_hong}. Chị cảm ơn 💚"_
_Lịch Đại Nhạc Hội Siêu Nhân nằm trong hộp thư sếp. {chi_dai} gửi lúc 17:00, đánh dấu "MẬT – chỉ anh đọc"._
* [🟢 Gửi.]
    ~ tn_gui_lich_dem_hong = true
    ~ tn_xanh(20)
    ~ tn_mang_theo_bi_mat = true
    ~ follow(-30000)
    thu_ky_ll: Cảm ơn em 💚 Anh Lực sẽ không quên em.
    _Bạn nhìn tấm ảnh với sếp trên tường. Bạn úp nó xuống. Lần này không phải để ngủ._
    { RANDOM(1, 10) <= 4:
        ~ tn_bi_lo_hai_mang = true
    }
* [🙅 "Dạ em hông giữ lịch đó chị."]
    ~ tn_xanh(-10)
    thu_ky_ll: Ok em 💚 Chị hỏi người khác.
* [📞 Chụp màn hình tin nhắn, gửi cho {chi_dai}.]
    ~ tn_xanh(-20)
    ~ tn_gian(-15)
    chi_dai: *(1 phút sau)* Chị đổi lịch hậu trường. Cảm ơn em. Mai nói chuyện.
    ~ qh("chi_dai", 15)
- -> END
