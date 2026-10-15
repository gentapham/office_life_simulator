// ============================================================
// GIÁM ĐỐC · CHƯƠNG 1: "VALI TIỀN" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== giam_doc_0110_sang_dau_thang ===
# ngay:1 # gio:07:40 # noi:biet_thu # bat_buoc
_7 giờ 40. Biệt thự số 1, Đồi Ngân Hàng. Bạn thắt cà vạt trước tấm gương to bằng cửa sổ._
_Trên bàn ăn là một phong bì của Ngân hàng Tín Dụng Đen Đủi. Bạn chưa mở. Ba tháng nay bạn không mở phong bì nào màu đó._
_Điện thoại rung. Tin nhắn của {thanh_ninh}: "Sếp ơi, 9 giờ đối tác tới ạ. Em chuẩn bị bút ký mạ vàng rồi ạ!"_
* [😇 Mở phong bì ngân hàng ra đọc.]
    _"Kính gửi Quý khách. Khoản vay thế chấp tài sản số 1, Đồi Ngân Hàng, đến hạn ngày 15/11/2026…"_
    _Bạn gấp tờ giấy làm tư, nhét vào túi áo vest. Ngay chỗ tim._
    ~ cang_thang(10)
    ~ gd_no(-2)
* [🎭 Nhét phong bì vào ngăn kéo, khóa lại.]
    _Ngăn kéo thứ ba. Cùng chỗ với ba phong bì tháng trước._
    ~ cang_thang(-5)
    ~ gd_no(3)
* [💬 Gọi cho {thanh_ninh}: "Em đặt hộ anh thêm một bó hoa thật to nhé."]
    thanh_ninh: Dạ sếp tinh tế quá anh ơi! Hoa gì ạ sếp?
    giam_doc: Hoa gì to nhất ấy. Lên ảnh cho đẹp.
    ~ qh("thanh_ninh", 5)
    ~ tien_cong(-300000)
- _Bạn soi gương lần cuối. Người trong gương cười rất tự tin. Bạn thì không chắc._
giam_doc: Hôm nay là ngày lịch sử. Mindset phải positive.
-> END

// ------------------------------------------------------------
=== giam_doc_0110_vali_tien ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2 chật cứng. Ở giữa bàn là một chiếc vali màu hồng. Bên trong, xếp ngay ngắn: 5 tỷ._
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ! *(tạo dáng)*
_Cả phòng vỗ tay. {hong_hot} đã giơ điện thoại quay từ lúc nào._
giam_doc: Các em! Hôm nay {cong_ty} chính thức hồi sinh! Một cái deal mang tính… mang tính synergy!
_{ke_toan} đẩy bản hợp đồng 52 trang sang trước mặt bạn. Chị nói rất chậm, đủ cho mình bạn nghe._
ke_toan: Anh {giam_doc}. Trước khi ký… anh đọc giúp em trang 47.
sieu_nhan_hong: *(chìa cây bút hồng)* Ký đi anh! Ký xong mình chụp hình liền cho nóng!
_Phóng viên của một trang tin nhỏ đã lên đèn flash. Mười giây nữa là đèn tắt._ # hen_gio:10
* [✍️ "Đọc làm gì, anh tin đối tác. Ký!"]
    ~ gd_ky_khong_doc = true
    ~ gd_uy(5)
    _Bạn ký một chữ ký bay bướm nhất đời. Đèn flash nổ. Cả phòng reo hò._
    _{ke_toan} thở dài, ghi gì đó vào cuốn sổ nhỏ._
    ~ qh("ke_toan", -5)
    ~ qh("sieu_nhan_hong", 5)
* [🧐 "Em cho anh 5 phút, anh đọc lướt cái mindset của hợp đồng đã."]
    ~ gd_doc_trang_47 = true
    ~ phat_hien(trang_47)
    sieu_nhan_hong: Dạ… ờm… anh cứ đọc thoải mái ạ.
    _Trang 47. Chữ cỡ 6. "…trường hợp không đạt mục tiêu, Bên B hoàn trả gấp đôi số tiền đã nhận…"_
    _Gấp đôi. Mười tỷ. Bạn nghe thấy tiếng tim mình rõ hơn tiếng máy lạnh._
    ~ cang_thang(20)
    ~ qh("sieu_nhan_hong", 5)
    ~ qh("ke_toan", 15)
    _Bạn vẫn ký. Vì không ký thì tháng này không có lương cho ai cả. Nhưng lần này bạn ký chậm._
    sieu_nhan_hong: Sếp này cẩn thận ghê! Em thích!
* [🎭 "Thương cứ để đấy, tí anh đọc."]
    ~ gd_ky_khong_doc = true
    ~ gd_hua()
    _Bạn ký luôn, nụ cười hướng về ống kính. {ke_toan} nhìn bạn đúng một giây. Một giây rất dài._
    ~ qh("ke_toan", -10)
* [⏱️ (Không chọn kịp)]
    ~ gd_ky_khong_doc = true
    _{sieu_nhan_hong} cầm tay bạn, đặt cây bút xuống giấy. "Ký nè anh!". Đèn flash nổ ngay lúc chữ ký vừa xong._
    _Tấm ảnh lên báo: bạn mắt nhắm, miệng há. Chú thích: "Giám đốc xúc động."_
    ~ gd_uy(-3)
- _5 tỷ chuyển khoản về tài khoản công ty. Điện thoại {ke_toan} kêu "ting" một tiếng, cả phòng nghe rõ._
giam_doc: Từ hôm nay, mục tiêu của chúng ta là: Hồng Hóa Việt Nam!
-> END

// ------------------------------------------------------------
=== giam_doc_0110_tra_sua_va_ca_phe ===
# ngay:1 # gio:10:30 # noi:tang_1 # bat_buoc
_Tầng 1 như ngày Tết. Máy pha cà phê ở pantry vừa kêu "rắc" một tiếng rồi tắt hẳn. Đúng Ngày Cà phê Quốc tế._
thuc_tap_sinh: Dạ anh {giam_doc} ơi, máy cà phê… dạ em chưa đụng vào nó đâu ạ.
hong_hot: Sếp ơi, hôm nay trúng số mà không có cà phê là hông có vibe đó sếp!
_{thanh_ninh} chìa ra danh sách 22 ly trà sữa, size L, thêm trân châu._
* [🎭 "Trà sữa cả công ty, anh mời! Cà phê anh tự đi mua!"]
    ~ tien_cong(-500000)
    ~ gd_tien_cty(-1)
    ~ gd_uy(5)
    _Bạn tự xách 22 ly cà phê từ quán đầu đường về. Ví còn đúng tiền đi gửi xe._
    ke_toan: Anh. Trà sữa 22 ly. Hóa đơn đâu anh?
    _Cả tầng 1 im lặng. Ống hút dừng giữa không trung._
    ** [😅 "Đây. Anh giữ đây. Không thiếu tờ nào."]
        _Bạn đưa ra tờ hóa đơn nhăn nheo. {ke_toan} gật đầu, hơi bất ngờ._
        ~ qh("ke_toan", 5)
    ** [🙅 "Anh không ép em duyệt đâu, tùy em."]
        ~ gd_tuy_em("ke_toan")
        ke_toan: Dạ. Vậy em không duyệt. Tiền túi anh trả nha.
        ~ tien_cong(-200000)
* [😇 "Hôm nay mình uống nước lọc ăn mừng. Tiền để dành chạy chiến dịch."]
    ~ gd_uy(-5)
    ~ qh("ke_toan", 10)
    ~ qh("hong_hot", -5)
    hong_hot: Ối dồi ôi… nước lọc ăn mừng 5 tỷ. Nghe như phim buồn.
    ke_toan: *(nhìn bạn như nhìn người lạ)* Anh khỏe hông anh?
* [🤝 Xắn tay áo, tự mở máy cà phê ra sửa.]
    { RANDOM(1, 10) <= 4:
        _Bạn vặn một con ốc. Máy kêu "ọc" rồi chạy lại. Cả tầng 1 vỗ tay như xem bóng đá._
        ~ gd_uy(10)
        ~ uong(10)
    - else:
        _Bạn vặn một con ốc. Máy phun hơi nóng lên áo sơ mi trắng. {it} đi ngang, nói đúng một câu: "Rút điện chưa anh?"_
        ~ gd_uy(-5)
        ~ cang_thang(10)
        ~ qh("it", 5)
    }
- _Hôm nay, nhìn mặt ai cũng thấy vui. Lâu lắm rồi mới thế._
-> END

// ------------------------------------------------------------
=== giam_doc_0110_mung_bac_binh ===
# ngay:1 # gio:15:00 # noi:choi_bao_ve # bat_buoc
_Ngày Quốc tế Người cao tuổi. Cả công ty kéo xuống chòi bảo vệ, cầm theo một cái bánh bông lan cắm chữ "Bác Bình muôn năm"._
bac_bao_ve: Thôi thôi… các cháu bày vẽ làm gì. Bác có già đâu.
cho: Gâu! *(nhảy lên đòi bánh)*
_Ai cũng quay sang nhìn bạn. Sếp phải nói vài câu._
* [🎤 Kể chuyện ngày đầu: "Năm 2010, căn phòng 20 mét vuông, có anh và Bác Bình…"]
    ~ gd_uy(3)
    _Bạn kể 12 phút. {hong_hot} ngáp. {chua_te_deadline} ngủ đứng._
    bac_bao_ve: Cậu Thắng kể sai rồi. Hôm ấy cậu đi dép lê, không phải giày tây.
    _Cả công ty cười ồ. Bạn đỏ mặt, nhưng thấy ấm._
    ~ qh("bac_bao_ve", 5)
* [😇 Rót trà mời bác, nói ngắn: "Mười sáu năm rồi bác nhỉ. Cảm ơn bác."]
    bac_bao_ve: Ừ… mười sáu năm. Cậu cũng già đi rồi đấy.
    ~ qh("bac_bao_ve", 10)
    ~ gd_tra_binh = gd_tra_binh + 1
    ~ uong(15)
* [🎭 "Bác Bình ơi, sang năm cháu mua cho bác cái chòi mới, có điều hòa!"]
    ~ gd_hua()
    bac_bao_ve: Thế à. Bác chờ.
    _Bác không cười. Bác chỉ nhìn sang cái tủ gỗ nhỏ trong góc chòi rồi rót thêm trà._
- cho: Gâu gâu! *(ăn mất miếng bánh có chữ "muôn")*
_Bánh còn lại "Bác Bình năm". Không ai sửa._
-> END

// ------------------------------------------------------------
=== giam_doc_0110_nhan_22h ===
# ngay:1 # gio:22:00 # noi:biet_thu
_22 giờ. Bạn ngồi một mình ở bàn ăn 10 ghế. Mở group Zalo-lô "{cong_ty} - Toàn công ty"._
_Theo thói quen mười năm, ngón tay đã tự gõ: "Mai 8h sáng các em có mặt đông đủ…"_
* [📲 Gửi tin giao việc như mọi khi, kèm 5 cái emoji pháo hoa.]
    -> giam_doc_mg_nhan_22h_mo_dau
* [😶 Xóa tin. Hôm nay mọi người vui rồi, để mai nói.]
    _Bạn xóa từng chữ. Lần đầu tiên sau nhiều năm, group yên lặng lúc 22 giờ._
    ~ gd_sua("nhan_22h")
    ~ cang_thang(-5)
* [🌻 Mở một tài khoản khác. Tên: "Hoa Hướng Dương 1989".]
    _Ảnh đại diện: một bông hướng dương. Ngày sinh: 1/1/1989. Bạn mở tài khoản đó từ tháng 6._
    _Group "Hội Anti Sếp", 14 thành viên. Tin mới nhất của {hong_hot}: "5 tỷ về rồi mà sếp vẫn đi giày cũ, chắc giấu tiền mua xe."_
    ~ gd_dung_clone = true
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== giam_doc_0210_hong_hoa_viet_nam ===
# ngay:2 # gio:09:30 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Nụ cười Thế giới. {hr} bắt mọi người cười khi chấm công. Ai cũng đang cười rất méo._
_Họp lên chiến dịch "Hồng Hóa Việt Nam". Trên bảng trắng, {truong_phong} đã vẽ 14 cái mũi tên._
truong_phong: Thưa anh, em đề xuất mình sync nhanh 5 phút về KPI nhé.
sales: Em nói luôn cho nóng: em có 3 nhà tài trợ, tổng 2 tỷ! Tập đoàn Bánh Tráng Trộn Toàn Cầu, BTT Global, chủ tịch là Mr. Kevin Trộn. Tin em đi, chắc kèo!
thuc_tap_sinh: Dạ… em có ý tưởng phim ngắn ạ. Một người mặc đồ hồng đẩy xe giùm người lạ trong mưa…
bien_kich: *(ghi chép rất nhanh)*
_Mọi ánh mắt đổ về bạn. Đây là lúc chốt con số._
* [🔥 "Một triệu người theo dõi trước 31/10! Không bàn cãi!"]
    ~ gd_uy(5)
    hong_hot: Ủa alo? Sếp có hỏi em là admin fanpage chưa? Giờ mới có 5 nghìn à sếp.
    giam_doc: Anh không ép, tùy em. Nhưng phải một triệu.
    ~ gd_tuy_em("hong_hot")
* [💬 Quay sang {hong_hot}: "Em làm fanpage, em thấy con số nào là khả thi?"]
    hong_hot: Dạ… thật lòng là khó. Nhưng nếu cả công ty cùng làm, em nghĩ… một triệu cũng được!
    ~ qh("hong_hot", 15)
    ~ gd_sua("ke_chuyen")
    _Lần đầu tiên {hong_hot} được hỏi ý kiến trong một cuộc họp. Cô ấy ngồi thẳng lưng hẳn lên._
* [🧾 Quay sang {sales}: "BTT Global. Hợp đồng đâu em?"]
    sales: Dạ… tuần sau chị… à em gửi anh liền! No cap!
    ~ qh("sales", -5)
    ~ gd_uy(3)
    _{ke_toan} ở cuối bàn khẽ gật đầu. Lần đầu tiên trong tháng chị ấy gật đầu với bạn._
    ~ qh("ke_toan", 5)
- _{thuc_tap_sinh} vẫn đang giơ tay, chờ ai đó hỏi tiếp về phim ngắn. {bien_kich} đã lật sang trang mới._
* [🤝 "{thuc_tap_sinh}, em nói tiếp đi. Ý tưởng hay đấy."]
    thuc_tap_sinh: Dạ! Dạ em cảm ơn anh ạ!
    ~ qh("thuc_tap_sinh", 10)
    bien_kich: *(gạch một dòng, viết lại)* Hay. Rất có… nỗi đau.
* [⏩ "Thôi, phim ngắn để sau. Chốt KPI đã."]
    _{thuc_tap_sinh} hạ tay xuống. {bien_kich} vẫn ghi._
- -> END

// ------------------------------------------------------------
=== giam_doc_0210_cau_thang_san_thuong ===
# ngay:2 # gio:14:00 # noi:cau_thang
_Bạn đang leo cầu thang lên sân thượng, túi gậy golf trên vai. Đối tác Răng Hồng hẹn đánh thử vài gậy._
_Tiếng dép lẹp xẹp đuổi theo. {ke_toan}, tay cầm bản hợp đồng, có kẹp một cái kính lúp._
ke_toan: Anh {giam_doc}! Anh chờ em chút!
giam_doc: Thương à, anh đang vội. Có gì nói nhanh nhé. # hen_gio:8
* {gd_ky_khong_doc} [🧐 "Trang 47 à? Đưa anh xem nào."]
    ~ gd_doc_trang_47 = true
    ~ phat_hien(trang_47)
    _Bạn đứng giữa cầu thang, đọc. Mười tỷ. Gió sân thượng thổi xuống lạnh gáy._
    ke_toan: Trượt mục tiêu là hoàn gấp đôi đó anh.
    giam_doc: Thì… mình không trượt. Mindset em phải positive lên.
    ke_toan: Em positive lắm rồi anh. Positive tới mức mất ngủ.
    ~ cang_thang(20)
    ~ qh("ke_toan", 15)
* {gd_doc_trang_47} [😮‍💨 "Anh đọc rồi. Anh biết. Em đừng nói với ai nhé."]
    ke_toan: Em làm sổ cho anh từ 2024 rồi. Em có nói với ai đâu.
    _Hai người đứng im. Ở trên, đối tác gọi "Anh Thắng ơi, tee-off!"._
    ~ qh("ke_toan", 10)
* [🙅 "Em lo xa quá. Anh không ép, tùy em."]
    ~ gd_tuy_em("ke_toan")
    ke_toan: "Tùy em" thì em lo tiếp vậy.
    ~ gd_no(3)
* [✍️ Ký luôn tờ đơn mua bút bi chị ấy kẹp ở trên, rồi đi tiếp.]
    ke_toan: Dạ… ờ, cảm ơn anh. Mà trang 47…
    _Bạn đã lên tới sân thượng._
* [⏱️ (Không chọn kịp)]
    _Bạn đã lên tới sân thượng. Tiếng gậy golf vang lên. Quả bóng bay qua tòa nhà bên cạnh._
    _Phía dưới, {ke_toan} đứng một mình ở chiếu nghỉ cầu thang._
    ~ qh("ke_toan", -5)
- -> END

// ------------------------------------------------------------
=== giam_doc_0310_san_golf_mini ===
# ngay:3 # gio:08:00 # noi:biet_thu
_Thứ 7. Sân golf mini sau biệt thự. Cỏ đã ba tuần chưa cắt vì bạn cho anh làm vườn nghỉ "tạm thời"._
_Điện thoại hiện số lạ. Bạn biết là ai._
nv_ngan_hang: Dạ anh Thắng ơi, em bên Tín Dụng Đen Đủi ạ. Khoản vay của anh tới hạn ngày 15/11 rồi ạ.
* [💼 "Em yên tâm. Công ty anh vừa ký một deal 5 tỷ."]
    nv_ngan_hang: Dạ vậy là anh tất toán được luôn hả anh?
    giam_doc: Ờ… tiền ấy là tiền chiến dịch. Nhưng cuối tháng sẽ có thêm 5 tỷ nữa.
    nv_ngan_hang: Dạ, em ghi chú "cuối tháng" nha anh.
    ~ gd_hua()
* [📞 "Cho anh xin giãn thêm một ít. Anh gọi lại em thứ Hai nhé."]
    nv_ngan_hang: Dạ thứ Hai anh gọi lại cho em nha. Em chờ.
    ~ cang_thang(5)
* [😶 Để điện thoại rung tới khi tắt. Đánh một gậy thật mạnh.]
    _Quả bóng bay qua hàng rào, rơi vào sân nhà bên. Bạn không đi nhặt._
    ~ cang_thang(-5)
    ~ gd_no(2)
- _Trên tường phòng khách, bức ảnh bạn bắt tay một ca sĩ nổi tiếng năm 2015 hơi nghiêng. Bạn đi sửa lại cho thẳng._
_Trong tất cả các bức ảnh, không có tấm nào chỉ có mình bạn._
-> END

// ------------------------------------------------------------
=== giam_doc_0410_ngay_dong_vat ===
# ngay:4 # gio:10:00 # noi:cong_cong_ty # bat_buoc
_Ngày Động vật Thế giới. Chủ nhật, nhưng bạn ghé công ty lấy tài liệu. Ở cổng, {cho} đang đội nơ hồng, mặc áo hoa. Mặt rất không vui._
_{chi_dai} vừa tắm cho {cho} xong. Ai khác đụng vào là {cho} gầm gừ, chỉ có {chi_dai} là được._
sieu_nhan_hong: Ố ồ! Cún mặc áo hoa kìa! Gâu gâu! *(giả tiếng sủa, nhảy qua nhảy lại)*
cho: GRỪ… GÂU GÂU GÂU!
_{cho} lao tới, ngoạm được chiếc găng tay hồng của {sieu_nhan_hong}, chạy biến vào gầm cầu thang._
sieu_nhan_hong: Ê! Găng tay của anh! Trả đây!
bac_bao_ve: Tuất! Về đây! *(nhìn bạn)* Cậu Thắng xem…
* [💼 Bênh đối tác: "Bác Bình, bác nhốt con chó lại giúp cháu. Đối tác 5 tỷ đấy."]
    ~ qh("sieu_nhan_hong", 10)
    ~ qh("bac_bao_ve", -15)
    ~ qh("cho", -20)
    bac_bao_ve: … Ừ. Bác nhốt.
    _Chiều hôm đó, {cho} nằm trong chòi, gác mõm lên chân bác, không ăn xúc xích._
* [🐕 Bênh {cho}: "Anh {sieu_nhan_hong}, chọc chó là nó cắn đấy. Điều khoản số 5 ghi là chọc, không ghi là bị cắn đâu."]
    ~ gd_bene_tuat = true
    ~ qh("bac_bao_ve", 15)
    ~ qh("cho", 20)
    ~ qh("sieu_nhan_hong", -5)
    sieu_nhan_hong: Hơ… anh nói cũng đúng. Thôi em hông chọc nữa… hôm nay.
    _Bác Bình gật đầu với bạn. Một cái gật rất nhẹ._
* [🤝 Lấy xúc xích trong xe ra, ngồi xuống dỗ cả hai.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
    - else:
        ~ tien_cong(-15000)
    }
    _Bạn bẻ đôi cây xúc xích. Một nửa cho {cho}. Nửa kia… {sieu_nhan_hong} ăn mất._
    ~ qh("cho", 10)
    ~ qh("sieu_nhan_hong", 5)
    ~ qh("bac_bao_ve", 5)
    cho: Gâu. *(nhai, vẫn lườm cái mũ hồng)*
- _Trong lúc mọi người đuổi theo {cho}, {sieu_nhan_hong} lén nhét con gà cao su của {cho} vào sau tủ mạng tầng 1, cười khúc khích._
* [😶 Giả vờ không thấy.]
    _Bạn không thấy gì. Giống Bác Bình._
* [💬 "Anh {sieu_nhan_hong}, trả gà cho nó đi."]
    sieu_nhan_hong: Hì hì, em giấu cho vui thôi mà! Mai em trả!
    _Câu "mai em trả" nghe quen quen. Giống giọng bạn._
- -> END
