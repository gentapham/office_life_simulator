// ============================================================
// THÁNH NỊNH: NHI · CHƯƠNG 3: "MẤT ĐIỆN, MẤT SÓNG" (14/10 – 16/10)
// ============================================================

VAR tn_xin_phong_vung_tau = 0   // 0: không xin; 1: xin xa chị Hương; 2: xin ở chung chị Hương

// ------------------------------------------------------------
=== thanh_ninh_1410_moc_2 ===
# ngay:14 # gio:09:00 # noi:ban_tro_ly # bat_buoc
_Mốc 2: 200.000 người theo dõi. Con số trên màn hình: {nguoi_theo_doi}._
_Ngày Hội Nông dân. Đơn xin nghỉ của {thanh_xin_nghi} nằm trên bàn bạn: "Lý do: về quê phụ gặt lúa."_
_{thanh_xin_nghi} sống ở Ven Đô. Nhà ông ấy trồng rau muống._
{ nguoi_theo_doi < 200000:
    _Sếp đi qua đi lại trong phòng kính. {sieu_nhan_hong} vừa nhắn: "Hôm nay anh hơi buồn. Anh đi giúp người cả ngày nha." Rồi tắt máy._
- else:
    _Sếp đang cười. Sếp cười thì cả tầng 2 dễ thở._
}
* [🚪 Giữ đơn của {thanh_xin_nghi} lại: "Sếp đang căng, tui hông trình được."]
    ~ qh("thanh_xin_nghi", -8)
    _Ba mươi phút sau, Bác {bac_bao_ve} gọi lên: "Cậu {thanh_xin_nghi} nhờ bác đưa giấy cho anh {giam_doc}." Đơn đi đường vòng, vẫn tới._
    ~ tn_ninh(-1)
* [🤝 Trình đơn, kèm một câu: "Anh duyệt cho ổng đi anh, ổng mà vui thì làm hết mình."]
    ~ qh("thanh_xin_nghi", 10)
    giam_doc: Gặt lúa à? Ừ, nông dân là gốc. Duyệt.
* [🙇 Lấy chuyện {thanh_xin_nghi} để làm sếp cười: "Anh ơi, ổng xin về gặt lúa mà nhà ổng trồng rau muống."]
    ~ tn_ninh(3)
    ~ qh("thanh_xin_nghi", -10)
    giam_doc: Haha! Thế thì gặt rau muống à? Thôi duyệt, cho nó gặt.
    _Sếp cười. Câu chuyện đó tới tai {hr} trước bữa trưa._
    ~ qh("hr", 3)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1410_tivi_toi ===
# ngay:14 # gio:20:15 # noi:nha_thanh_ninh
_Đài Tivi Hóng, vòng 2 "Giọng Ca Ước Mơ". Thí sinh số 17 bước ra trong bộ đồ kim tuyến. Bạn suýt sặc trà._
_Thí sinh số 17 là {thanh_xin_nghi}. Người đang "gặt lúa"._
_Ông ấy hát hay. Hay thật sự._
~ phat_hien(son_thi_hat)
* [🙇 Chụp màn hình gửi sếp: "Anh ơi, gặt lúa nè anh."]
    ~ tn_ninh(4)
    giam_doc: *(5 phút sau)* … Hát hay đấy. Nhưng mai bảo nó lên gặp anh. Không, bảo {hr}.
    ~ qh("thanh_xin_nghi", -15)
    ~ qh("hr", 5)
* [😶 Bình chọn cho thí sinh số 17. Không kể ai.]
    ~ qh("thanh_xin_nghi", 5)
    ~ tien_cong(-10000)
    _Một tin nhắn bình chọn 10.000đ. Một bí mật giá 10.000đ._
* [💬 Nhắn {thanh_xin_nghi}: "Hát hay đó. Mà lúa ngoài ruộng có nghe hông?"]
    thanh_xin_nghi: *(1 phút sau)* … Nhi đừng nói ai nha. Tui năn nỉ.
    ~ qh("thanh_xin_nghi", 3)
    _Bạn có thêm một người nợ mình. Cảm giác này quen lắm._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1510_thang_may ===
# ngay:15 # gio:08:05 # noi:sanh_thang_may # bat_buoc
_8 giờ 05. Điện cúp. Toàn tòa nhà tối om. Thang máy đứng giữa tầng 1 và tầng 2._
_Trong thang máy: sếp. Và {chi_dai}._
_Bạn đứng ngoài cửa thang máy, tay cầm ly trà sen vừa pha. Bốn mươi phút._
* [🙇 Đập cửa: "Anh ơi anh có sao hông anh! Em ở ngoài đây! Anh bình tĩnh nha anh!"]
    giam_doc: *(vọng ra)* Anh… anh không sao. Nhi đi gọi {it} đi em.
    chi_dai: *(vọng ra)* Nhi, im lặng một chút cho chị nói chuyện với ổng.
    ~ tn_gian(5)
    _Bạn im. Qua khe cửa, bạn nghe tiếng {chi_dai}: "Anh giấu gì cả công ty vậy?"_
* [🏃 Chạy đi tìm {it}.]
    ~ qh("it", 3)
    it: Mất điện cả khu. Chờ.
    _{it} nói bốn chữ, rồi cầm đèn pin đi xuống tầng hầm. Bạn quay lại đứng chờ._
* [😶 Đứng im, cầm ly trà, chờ.]
    _Trà nguội dần. Bạn nghe được vài câu qua khe cửa. Giọng sếp nhỏ lại, nhỏ lại, rồi nghẹn._
    ~ tn_email(1)
- _8 giờ 45. Cửa mở. {chi_dai} bước ra trước, không nhìn ai._
_Sếp bước ra sau. Bạn là người đầu tiên thấy mặt sếp. Mắt sếp đỏ. Sếp vừa khóc._
giam_doc: *(thấy ly trà trong tay bạn)* Trà… nguội rồi à em.
* [🙇 "Dạ hôm nay trông anh rạng rỡ quá anh ơi!"]
    _Câu đó rơi xuống hành lang tối như một cái muỗng rơi xuống sàn._
    giam_doc: … Ừ.
    ~ tn_ninh(-6)
    ~ tn_gian(5)
* [🍵 "Dạ để em pha ly khác. Anh ngồi nghỉ đi anh."]
    ~ tn_ninh(4)
    ~ qh("giam_doc", 8)
    giam_doc: Không cần. Đưa anh ly nguội ấy. *(uống một hơi)*
* [😇 Đưa ly trà, không nói gì, đứng cạnh sếp một lúc.]
    ~ qh("giam_doc", 12)
    ~ tn_gian(-5)
    _Hai người đứng trong hành lang tối. Không ai khen ai. Lâu lắm rồi mới có vậy._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1510_hop_nen ===
# ngay:15 # gio:09:30 # noi:phong_hop_tang_2
_{truong_phong} họp thắp nến ở phòng "Sáng Tạo". Chín cây nến thơm mùi vani. {thuc_tap_sinh} tung ra 5 cục sạc dự phòng: "Dạ mọi người dùng chung ạ!"_
truong_phong: Mất điện nhưng không mất tinh thần. Mình sync nhanh 5 phút nhé. Nhi, sếp có dự không?
* [🚪 "Sếp đang nghỉ. Anh họp đi, có gì em tóm tắt lại cho sếp."]
    ~ qh("truong_phong", 3)
    truong_phong: Tốt. Thế em ghi biên bản nhé.
    _Bạn ghi biên bản dưới ánh nến hai tiếng. Biên bản dài một dòng: "Họp tiếp sau khi có điện."_
* [👇 "Duy ghi biên bản đi, chị lo sếp."]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ em ghi ạ! Mà em ghi bằng gì ạ, máy hết pin rồi…
* [💬 Mượn một cục sạc của {thuc_tap_sinh}: "Duy, sạc xịn vậy, mua ở đâu?"]
    thuc_tap_sinh: Dạ… dạ em mua hồi còn đi làm… ờ… hồi trước ạ.
    _Cục sạc có logo của một ngân hàng lớn, khắc chữ "Quà tặng khách hàng kim cương"._
    ~ qh("thuc_tap_sinh", 3)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1510_pantry_ll_goi ===
# ngay:15 # gio:14:20 # noi:pantry # bat_buoc
_Pantry tối om. Cả công ty ngồi bệt dưới sàn, kể chuyện bằng ánh đèn điện thoại._
_Ở góc tối nhất, {ke_toan} đang thì thầm gì đó với {chi_dai}. Bạn chỉ nghe được hai chữ: "gấp đôi"._
_Bỗng điện thoại bạn reo. Nhạc chuông to nhất tầng. Màn hình sáng rực: "LL - Chị Tuyển Dụng"._
_Cả pantry im lặng. Hai mươi khuôn mặt quay về phía bạn._
hong_hot: Ủa… "LL" là ai vậy Nhi? # hen_gio:5
* [📞 Nghe máy: "Dạ alo, em nghe ạ."]
    ~ tn_xanh(10)
    _Giọng bên kia, to và rõ, vang khắp pantry: "Nhi ơi chị bên LL nè, lịch 25/10 vẫn ok hen em?"_
    ~ tn_gian(10)
    chi_dai: … Ừ. LL.
    hong_hot: Ối dồi ôi.
    _Bạn nghe thấy tiếng {hong_hot} gõ phím điện thoại trong bóng tối._
* [📵 Tắt máy, cười: "Spam đó, bên Lừa Lọc gì á."]
    { RANDOM(1, 10) <= 6:
        _Vài người cười. {hong_hot} chưa cười._
    - else:
        hong_hot: Spam mà lưu tên "Chị Tuyển Dụng" hả bà?
        ~ tn_gian(5)
    }
* [👇 Đưa điện thoại cho {thuc_tap_sinh}: "Duy nghe giùm chị, nói chị bận."]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ alo ạ… Dạ chị {thanh_ninh} bận ạ… Dạ, phỏng vấn ạ? Dạ em nhắn lại ạ!
    _{thuc_tap_sinh} nói to, rõ, lễ phép, từng chữ một. Cả pantry nghe hết._
    ~ tn_gian(8)
* [⏱️ (Không chọn kịp)]
    _Chuông reo hết bài. Rồi reo lại lần hai._
    hong_hot: *(nhìn màn hình)* "LL - Chị Tuyển Dụng"… nghe gì chưa mấy bà?
    ~ tn_gian(5)
    ~ qh("hong_hot", 2)
- _Một lúc sau, câu chuyện quay về chủ đề khác. Nhưng bạn biết: sau tối nay, có ít nhất ba người biết chữ "LL" trong điện thoại của bạn._
-> END

// ------------------------------------------------------------
=== thanh_ninh_1510_toi_pantry ===
# ngay:15 # gio:19:00 # noi:pantry # ngau_nhien
_Vẫn mất điện. Pantry chỉ còn vài người. Trong bóng tối, {idol_het_thoi} hát khe khẽ: "Ngày xưa có đôi bạn thân, bán cá viên chiên…"_
_{editor} giơ điện thoại lên quay, đèn tắt. {quan_ly_idol} ngồi yên, không dám thở mạnh._
* [🙇 Nhắn sếp: "Anh ơi anh {idol_het_thoi} đang hát Công Viên, cảm xúc lắm anh. Anh có muốn xuống hông?"]
    giam_doc: *(nhắn lại)* Thôi. Để nó hát. Lâu rồi anh không nghe nó hát mà không lấy tiền.
    ~ qh("giam_doc", 3)
* [😇 Ngồi xuống, nghe hết bài.]
    ~ cang_thang(-15)
    _Hết bài, không ai vỗ tay. Không ai cần vỗ tay._
    ~ qh("idol_het_thoi", 5)
* [😶 Đi về.]
    ~ nghi(5)
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1610_hop_bao ===
# ngay:16 # gio:08:30 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng, phòng chờ. Họp báo trước gameshow "Hồng Hay Không Hồng". {sieu_nhan_hong} cầm tờ giấy trắng, run run._
sieu_nhan_hong: Nhi ơi… anh hông biết nói gì hết. Lúc mặc đồ thì tự tin, mà cầm micro là… ờm…
quan_ly_idol: Khoan, anh nghe máy chút. Nhi viết giùm ảnh vài câu đi, em viết cho sếp hoài mà.
* [✍️ Viết cho {sieu_nhan_hong} một bài ngắn, thật, về việc giúp người.]
    _"Em không giỏi gì hết. Em chỉ thích giúp người. Nếu mọi người thấy em, em giúp được nhiều người hơn."_
    sieu_nhan_hong: *(đọc xong, sụt sịt)* Nhi… Nhi viết cho anh mãi được hông?
    ~ follow(20000)
    ~ qh("sieu_nhan_hong", 15)
    _Lần đầu có người muốn bạn viết cho họ, mà không cần bạn khen họ._
* [🙇 Viết bài cảm ơn sếp {giam_doc} là chính, {sieu_nhan_hong} là phụ.]
    sieu_nhan_hong: "…cảm ơn anh {giam_doc}, người có tầm nhìn…" Ờm… anh đọc vậy hả?
    ~ tn_ninh(4)
    ~ follow(3000)
    _Phóng viên ngáp. Sếp xem qua màn hình, cười rạng rỡ._
* [👇 "{thuc_tap_sinh}, viết giùm chị đi, em có văn."]
    ~ tn_dap_duy()
    thuc_tap_sinh: Dạ em viết liền ạ! *(viết rất nghiêm túc, như soạn tờ trình tín dụng)*
    ~ follow(8000)
    _Bài phát biểu có câu "Lợi nhuận kỳ vọng của sự tử tế". Không ai hiểu, nhưng nghe sang._
- -> END

// ------------------------------------------------------------
=== thanh_ninh_1610_xep_cho_ngoi ===
# ngay:16 # gio:10:00 # noi:dai_tivi_hong # bat_buoc
_Gameshow sắp bắt đầu. Hàng ghế khách mời có camera chĩa vào, chỉ còn đúng một ghế. Sếp, {con_ong_chau_cha}, {truong_phong}, ai cũng muốn ngồi._
_Và theo kịch bản, ghế đó là của {sieu_nhan_hong} trong phần giới thiệu._
giam_doc: *(nói nhỏ)* Nhi, chỗ nào được lên hình thì xếp anh nhé. Anh không ép, tùy em.
* [🙇 Xếp sếp ngồi ghế khách mời. {sieu_nhan_hong} ra đứng cánh gà.]
    ~ tn_ninh(10)
    ~ tn_sep_goi("nhi")
    ~ follow(-15000)
    _Phần giới thiệu, máy quay lia qua sếp 12 giây. {sieu_nhan_hong} thì 3 giây. Khán giả hỏi nhau: "Siêu nhân đâu?"_
    ~ qh("sieu_nhan_hong", -5)
* [🤝 Giữ ghế cho {sieu_nhan_hong}, xếp sếp ngồi hàng đầu khán giả "để bao quát".]
    ~ tn_ninh(-2)
    ~ follow(10000)
    giam_doc: Bao quát à… Ừ, bao quát cũng được.
    _Máy quay vẫn lia qua sếp 2 lần, vì sếp vỗ tay to nhất._
* [💬 Xếp {con_ong_chau_cha} ngồi ghế đó: "Anh Long đẹp trai, lên hình thu hút."]
    ~ qh("con_ong_chau_cha", 10)
    ~ qh("truong_phong", -10)
    ~ tn_ninh(-3)
    truong_phong: *(nghiến răng)* Thế nhé. Ghi nhận.
- _Phần "Hit Một Thời", {sieu_nhan_hong} hát "Công Viên" sai lời: "…bán khoai chiên tại công viên…". Từ cánh gà có ai đó hát bè đúng lời._
~ follow(80000)
-> END

// ------------------------------------------------------------
=== thanh_ninh_1610_buffet_tuan ===
# ngay:16 # gio:17:00 # noi:pantry
_Ngày Lương thực Thế giới: buffet ở công ty. Bạn đang gắp chả giò thì thấy {hr} cầm danh sách xếp phòng Vũng Tàu, mỉm cười._
hr: Nhi à, em có nguyện vọng gì về phòng ngủ không? Anh chỉ muốn lắng nghe em thôi.
* [🙏 "Dạ… anh xếp em xa chị {chi_dai} giùm em nha anh."]
    ~ tn_xin_phong_vung_tau = 1
    hr: *(ghi chép)* Anh hiểu. Ngân sách hơi eo hẹp, nhưng anh sẽ cố.
* [😇 "Dạ anh xếp em với chị {chi_dai} đi anh. Em muốn nói chuyện với chỉ."]
    ~ tn_xin_phong_vung_tau = 2
    hr: *(ngừng bút 2 giây)* … Em chắc chứ?
    _Bạn gật. Bạn không chắc chút nào._
* [🙇 "Dạ em ở đâu cũng được, miễn gần phòng sếp để sáng mang trà."]
    hr: Ừ. Anh ghi nhận.
    ~ tn_ninh(1)
- ~ an(100)
_Buffet miễn phí. Bạn ăn như ngày mai mất điện tiếp._
-> END
