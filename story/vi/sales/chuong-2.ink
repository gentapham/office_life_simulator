// ============================================================
// SALES · CHƯƠNG 2: "TỦ LẠNH TRỐNG" (8/10 – 14/10)
// ============================================================

// ------------------------------------------------------------
=== sales_0810_kham_mat ===
# ngay:8 # gio:13:20 # noi:ban_sales
_Ngày Thị giác Thế giới. {chi_dai} kéo {editor} đi khám mắt ở Phòng khám Khỏe Re. {editor} ngáp suốt dọc hành lang._
_Bạn nhìn theo. Phòng khám. Khám mắt. Một ý tưởng lóe lên như đèn LED._
* [💁 Gọi Phòng khám Khỏe Re: "Tin chị đi, mình quay clip 'Editor cú đêm đi khám mắt', logo phòng khám chình ình."]
    _Bác sĩ phòng khám, giọng rất dễ tính: "Lại là bên công ty G à? Thằng Sơn khám 8 lần rồi đó em."_
    _Nhưng bác đồng ý. Gói nhỏ: 2 triệu, kèm 5 suất khám miễn phí cho nhân viên._
    ~ sl_that(2)
    ~ follow(3000)
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    ~ qh("editor", -3)
    editor: *(ngáp, trên clip)* …Ai cho quay tui vậy…
* [🤝 Đi theo, mua cho {editor} ly cà phê đen không đường.]
    editor: *(nhận ly)* …Sao em biết anh uống đen không đường?
    sales: Sales mà anh. Biết khách uống gì là nửa cái deal rồi.
    ~ qh("editor", 8)
    ~ tien_cong(-25000)
* [📞 Ngồi lại bàn gọi chào hàng.]
    -> sales_mg_goi_dien_mo_dau
- -> END

// ------------------------------------------------------------
=== sales_0910_detox_trung ===
# ngay:9 # gio:12:10 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. Ví bạn còn 47 nghìn tới khi có lương._
* [📸 Chụp story: "Detox trứng nha mọi người. Chị chủ động sống healthy."]
    ~ danh_tieng = danh_tieng + 2
    ~ sl_phet(2)
    hong_hot: *(bình luận)* Bà detox hay bà hết tiền?
    _Bạn xóa bình luận đó. Rồi ăn trứng luộc. Một quả. Rồi thêm một quả._
* [😇 Nói thật với {designer}: "Chị Quỳnh, em còn 47 nghìn."]
    ~ sl_that_long()
    designer: Ngồi xuống. Chị chia nửa đĩa trứng chiên.
    ~ qh("designer", 8)
- ~ an(25)
~ tien_cong(-15000)
-> END

// ------------------------------------------------------------
=== sales_0910_bao_cao_thu_6 ===
# ngay:9 # gio:15:00 # noi:ban_sales
_Thứ 6, 15 giờ. Trà sữa thứ 6 từ quỹ phạt đi trễ. Và hạn nộp báo cáo KPI tuần._
_KPI Thật của bạn: {sl_kpi_that} triệu. KPI Trên Giấy tuần trước: {sl_kpi_giay}%._
* [📊 Vẽ biểu đồ "đẹp". Trục tung bắt đầu từ… con số mình muốn.]
    -> sales_mg_bao_cao_mo_dau
* [🤝 Nộp báo cáo thật: {sl_kpi_that} triệu, cột thấp lè tè.]
    ~ sl_that_long()
    ~ sl_giay(-50)
    giam_doc: *(nhìn biểu đồ)* Ơ… sao tuần này thấp thế em?
    sales: Dạ… tuần này em báo số thật.
    giam_doc: *(im lặng 3 giây, nhìn bạn rất lạ)* …Ừ. Số thật thì… cũng được.
    _Bạn không biết, nhưng {giam_doc} vừa nhìn bạn như nhìn chính mình hồi 21 tuổi._
    ~ qh("giam_doc", 5)
* [😶 Nộp lại báo cáo tuần trước, đổi ngày.]
    ~ sl_phet(3)
    _Không ai phát hiện. Lần này._
- ~ nhan(tra_sua)
~ uong(20)
-> END

// ------------------------------------------------------------
=== sales_0910_ra_mat_mv ===
# ngay:9 # gio:19:00 # noi:phong_hop_sang_tao # bat_buoc
_19 giờ. MV đầu tiên của Siêu Nhân Hồng lên sóng. Cả công ty chen trong phòng họp, ăn bánh mì trứng._
giam_doc: Các em! Đêm nay mình cần một tin lớn. Một tin để báo chí đăng kèm MV. {sales}, nhà tài trợ của em đâu?
_Mọi ánh mắt dồn về bạn. {designer} đứng ở góc phòng, lắc đầu rất nhẹ._ # hen_gio:6
* [🗣️ "Tin chị đi! Tập đoàn BTT Global chính thức đồng hành cùng Siêu Nhân Hồng!"]
    ~ sl_btt_cong_bo = true
    ~ sl_phet(30)
    ~ sl_giay(50)
    ~ follow(30000)
    hong_hot: Đăng liền! "Tập đoàn lớn tài trợ Siêu Nhân Hồng"!
    _Hai trang báo mạng đăng lại trong 40 phút. Không ai gọi điện xác minh. Chưa ai._
    { sl_bong_bong >= 100:
        -> sales_tudo_bong_bong_be
    }
* [🤝 "Dạ có Quán Ốc Đêm, Tiệm Nail Lung Linh, phòng khám Khỏe Re. Nhỏ, nhưng thật."]
    ~ sl_that_long()
    giam_doc: Quán ốc… với tiệm nail à? *(gãi đầu)* Thôi, cũng là tài trợ.
    hong_hot: Ủa mà dễ thương nha! "Siêu Nhân Hồng của quận Hóng"!
    ~ follow(8000)
    ~ qh("hong_hot", 3)
* [⏱️ (Không chọn kịp)]
    _{con_ong_chau_cha} đã nói thay: "Để anh gọi chú anh tài trợ." Chú anh đang ngồi ngay đó. Cả phòng chuyển chủ đề._
- dan_dau_tu: *(nhìn điện thoại)* Ơ… có ai vừa tạo đồng Hồng Coin kìa. Sắp x10.
-> END

// ------------------------------------------------------------
=== sales_1010_het_tien ===
# ngay:10 # gio:11:00 # noi:can_1203 # bat_buoc
_Thứ 7, ngày 10. Lương chưa về. App ngân hàng: không có gì mới. Group Zalo-lô: 214 tin nhắn, toàn chữ "ủa"._
_Tủ lạnh căn 1203: một chai tương ớt. Quả trứng không rõ ngày đã biến mất. Bạn không nhớ đã ăn nó._
_Bạn hết tiền thật. Ba con đường._
* [🧾 Nhắn {ke_toan} xin tạm ứng, dù hôm nay thứ 7.]
    -> tam_ung
* [📉 Qua Hẻm 69 đòi nợ {dan_dau_tu}.]
    -> doi_no
* [🍻 Nhận lời đi nhậu Quán Ốc Đêm với {giam_doc}, để được ăn.]
    -> nhau

= tam_ung
ke_toan: *(nhắn lại sau 2 phút)* Thứ 7 chị không duyệt. Mà em… ổn không?
* [💁 "Ổn chị! Tin chị đi, em chỉ đang tối ưu dòng tiền."]
    ke_toan: Ừ. Thứ 2 lên phòng.
    ~ cang_thang(5)
* [🤝 "Dạ… thật ra em hết tiền ăn. Lương trễ, em hông dám nói."]
    ~ sl_that_long()
    _10 phút sau, chuông cửa căn 1203 reo. Không ai. Chỉ có một túi đồ treo ở tay nắm: gạo, trứng, rau, và một tờ giấy: "Không phải tạm ứng. Đừng kể ai. T."_
    ~ an(40)
    ~ qh("ke_toan", 20)
- -> END

= doi_no
_Gác lửng Hẻm 69. Cửa phòng {dan_dau_tu} dán kín giấy nhắc nợ: của {it}, của Bác {bac_bao_ve}, của {con_ong_chau_cha}. Sáu tờ là của bạn._
_Bạn dán thêm tờ thứ 7. Gõ cửa. Trong phòng có tiếng nín thở._
* [💁 "Anh Chương, chị biết anh ở trong. Tin chị đi, mở cửa thì vũ trụ thương."]
    dan_dau_tu: *(vọng ra)* Anh không có ở trong!
    _Một tờ 100 nghìn được đẩy ra từ khe cửa. Kèm mẩu giấy: "Tượng trưng. Đáy rồi."_
    ~ sl_chuong_tra(100000)
* [😇 Ngồi xuống bậc thang, nhắn: "Anh ơi, em đói thật đó."]
    _Cửa mở. {dan_dau_tu} ló ra, tóc rối, đưa bạn một ổ bánh mì nguyên._
    dan_dau_tu: Anh chỉ còn cái này. Ăn đi. Nợ anh ghi sổ, không quên đâu.
    ~ nhan(banh_mi)
    ~ an(30)
    ~ qh("dan_dau_tu", 5)
    ~ sl_that_long()
- -> END

= nhau
_Quán Ốc Đêm. {giam_doc} gọi cả bàn: ốc hương, sò điệp, nghêu hấp. Bạn ăn như chưa từng được ăn._
~ an(70)
~ nghi(-20)
giam_doc: {sales} này. Hồi anh 21 tuổi, anh cũng hay vẽ biểu đồ đẹp lắm. Cột nào cũng đi lên.
_Bạn suýt sặc ốc. Sếp nói câu đó mà không nhìn bạn, chỉ nhìn con ốc hương._
giam_doc: *(cười buồn)* Giờ anh vẫn vẽ. Gửi cho một người. Ăn đi em.
* [😶 Im lặng ăn tiếp.]
    _Hai người ăn ốc trong im lặng. Một sự đồng cảm kỳ lạ, mùi mỡ hành._
* [💬 "Sếp gửi cho ai vậy sếp?"]
    giam_doc: *(lắc đầu)* Cho người lập ra công ty này. Thôi, chuyện người lớn.
    _Lại "chuyện người lớn". Nhưng lần này, bạn không thấy khó chịu. Bạn thấy sếp cũng chỉ là một đứa nhỏ lớn tuổi._
    ~ qh("giam_doc", 8)
* [🗣️ "Sếp yên tâm, tin chị đi, BTT Global sắp chuyển tiền!"]
    ~ sl_phet(5)
    giam_doc: *(nhìn bạn lâu)* …Ừ. Anh tin.
    _Ông nói "anh tin" với giọng của người không tin. Bạn thấy lạnh gáy._
- -> END

// ------------------------------------------------------------
=== sales_1110_anh_hoi_nho ===
# ngay:11 # gio:10:00 # noi:can_1203
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ._
_Bạn tìm được tấm ảnh năm 7 tuổi: đứng sau quầy nước mía của bà ngoại, tay cầm loa, miệng há to rao hàng._
* [📸 Đăng ảnh: "Sales từ trong trứng."]
    hong_hot: *(bình luận)* Trời ơi bé {sales} rao hàng! Hồi đó có nói "tin chị đi" chưa?
    sales: *(trả lời)* Hồi đó nói "tin con đi". Bán hết 40 ly một buổi.
    ~ danh_tieng = danh_tieng + 3
    ~ qh("hong_hot", 3)
* [📸 Đăng ảnh, kèm dòng: "Hồi đó bán nước mía thật, giá thật."]
    ~ sl_that_long()
    designer: *(bình luận)* Bé này bán hàng không cần chém, mà vẫn hết hàng nè.
    _Bạn đọc bình luận đó 4 lần. Rồi tắt điện thoại._
    ~ qh("designer", 5)
* [😶 Không đăng. Lướt ảnh của người khác.]
    _Bạn thấy {sieu_nhan_hong} đăng ảnh một xóm cũ có cây me to, một đám con nít. Góc ảnh có một thằng nhỏ đang khóc. Bạn không biết là ai._
- -> END

// ------------------------------------------------------------
=== sales_1210_giao_ban ===
# ngay:12 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2. Họp giao ban. Lương vẫn chưa về lúc 8 giờ 30. Không khí nặng như hộp cơm để từ thứ 6._
giam_doc: Phòng Kinh doanh báo cáo nhanh nhé. {sales}?
* [🗣️ "Dạ, KPI tuần này 320%! Ba nhà tài trợ đang chờ ký!"]
    ~ sl_phet(5)
    ~ sl_giay(20)
    ke_toan: *(ghi sổ)* Ba nhà. Ghi nhận. Hóa đơn đâu em?
    ~ sl_hoi_hoa_don = sl_hoi_hoa_don + 1
* [🤝 "Dạ, tuần này em ký thêm {sl_kpi_that} triệu thật. Từ quán ốc, tiệm nail, phòng khám."]
    ~ sl_that_long()
    ke_toan: *(ngẩng lên, lần đầu không hỏi hóa đơn)* …Tốt.
    ~ qh("ke_toan", 5)
* [📞 Điện Thoại Giả: "Dạ em xin phép, chủ tịch BTT gọi!" rồi chạy ra ngoài.]
    ~ sl_phet(3)
    _Đúng lúc đó, điện thoại reo thật. Màn hình: "Anh Chương (nợ 5tr)". {dan_dau_tu} ngồi ngay đối diện, đang cầm điện thoại._
    dan_dau_tu: …Ủa, anh là chủ tịch BTT hả em?
    _Cả phòng cười. Bạn cười theo. Không vui._
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== sales_1210_luong_ve ===
# ngay:12 # gio:10:45 # noi:ban_sales # bat_buoc
_10 giờ 45. "Ting." Lương về. Cả tầng 1 vang lên một tiếng "Á!" đồng thanh._
~ cang_thang(-10)
_Ở cửa, {con_ong_chau_cha} quẹt thẻ mua trà sữa cho cả phòng. Thẻ bị từ chối. Lần hai. Lần ba._
con_ong_chau_cha: Ủa? Thẻ phụ của chú anh mà. Chắc máy lỗi.
_{thuc_tap_sinh} lặng lẽ rút thẻ của mình ra trả. Thẻ màu bạc, viền kim cương. Cả phòng đứng hình._
thuc_tap_sinh: Dạ… thẻ… thẻ em mượn ạ!
* [🔍 Nhìn kỹ thẻ. Dân sales biết thẻ hạng nào cần bao nhiêu tiền gửi.]
    _Thẻ kim cương của ngân hàng lớn. Muốn có thẻ này, phải có số dư mà lương thực tập 4 triệu cần… 200 năm. Có chuyện._
    ~ qh("thuc_tap_sinh", 2)
* [💁 "Anh {thuc_tap_sinh} ơi, tin chị đi, anh nên đầu tư vô… tài trợ Đêm Hồng."]
    thuc_tap_sinh: Dạ… dạ em không có tiền ạ! Thật ạ! *(nhét thẻ vào túi, chạy đi pha cà phê)*
    ~ qh("thuc_tap_sinh", -3)
- ~ nhan(tra_sua)
~ uong(20)
-> END

// ------------------------------------------------------------
=== sales_1210_tien_nha ===
# ngay:12 # gio:20:00 # noi:can_1203
_Tối. Ban quản lý Sky Ảo nhắn: "Căn 1203 vui lòng thanh toán tiền thuê tháng 10: 12.000.000đ."_
_Lương chuyên viên 13 triệu. Bạn làm toán. Toán không thương ai._
* [💸 Trả đủ. Tháng này ăn mì.]
    ~ tien_cong(-12000000)
    ~ cang_thang(10)
    _Còn lại một con số nhỏ đến mức bạn chụp màn hình lại để làm bằng chứng cho hậu thế._
* [🗣️ Nhắn ban quản lý: "Chị đang chờ tập đoàn chuyển khoản, cuối tháng chị gửi gấp đôi."]
    ~ sl_phet(8)
    ~ tien_cong(-6000000)
    _Họ đồng ý cho trả một nửa. "Gấp đôi" thì bạn hy vọng họ quên._
* [😇 Hỏi thử giá phòng trọ Hẻm 69.]
    ~ sl_that_long()
    ~ tien_cong(-12000000)
    _Bà Tư chủ trọ báo giá: 2 triệu rưỡi, có cửa sổ nhìn ra tường. Bạn lưu số. Chưa dám gọi. Nhưng đã lưu._
- { tien < 0:
    _Số dư: âm. Bạn chưa bao giờ biết ví điện tử hiện được số âm._
}
-> END

// ------------------------------------------------------------
=== sales_1310_bang_khen ===
# ngay:13 # gio:09:00 # noi:phong_giam_doc # bat_buoc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho mình. {thanh_ninh} đọc bài phát biểu khen 15 phút, có cả đoạn so sánh sếp với mặt trời._
thanh_ninh: …và như mặt trời, anh {giam_doc} chưa bao giờ đi làm trễ trong tim mỗi chúng em!
giam_doc: *(lau nước mắt)* Hay quá.
_Bạn không chịu thua. Không bao giờ._
* [🗂️ Tặng {giam_doc} bằng khen "Doanh nhân của năm" do BTT Global trao, {designer} thiết kế.]
    ~ sl_bang_khen_btt = true
    ~ sl_phet(15)
    giam_doc: Tập đoàn quốc tế công nhận anh! Treo lên! Treo chỗ dễ thấy nhất!
    _Bằng khen viền vàng, con dấu đỏ, chữ ký Kevin Trộn bay bổng. Treo ngay cạnh cửa sổ phòng giám đốc._
    thanh_ninh: *(nghiến răng cười)* Đẹp quá anh ơi. Đẹp… chuẩn quá anh ơi.
    ~ qh("giam_doc", 10)
    ~ qh("thanh_ninh", -8)
    { sl_bong_bong >= 100:
        -> sales_tudo_bong_bong_be
    }
* [🎁 Tặng {giam_doc} một voucher làm nail.]
    { sl_co_voucher_nail:
        ~ sl_co_voucher_nail = false
        giam_doc: Nail… cho anh à? *(nhìn tay mình)* …Ừ, móng anh cũng hơi xấu thật.
        _Chiều đó, {giam_doc} đi làm móng. Về khoe cả công ty. Tiệm Nail Lung Linh nhắn bạn: "Em đúng là sales của chị!"_
        ~ sl_that(1)
        ~ qh("giam_doc", 5)
    - else:
        _Bạn lục túi. Không có voucher nào. Bạn tặng sếp một cái bắt tay rất chặt._
        giam_doc: Cảm ơn em. Tay em lạnh thế.
    }
* [😇 Viết tay một tấm thiệp: "Chúc anh giữ được công ty. Em."]
    ~ sl_that_long()
    giam_doc: *(đọc, im lặng rất lâu)* …Cảm ơn em. Thật đấy.
    _Ông cất tấm thiệp vào ngăn kéo, không treo. Bạn không biết đó là tốt hay xấu._
    ~ qh("giam_doc", 12)
- -> END

// ------------------------------------------------------------
=== sales_1410_ban_goc ===
# ngay:14 # gio:10:00 # noi:phong_ke_toan # bat_buoc
_Mốc 2: 200.000 người theo dõi. Hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 200000:
    _Chưa đạt. {sieu_nhan_hong} buồn, bỏ đi giúp người cả ngày. Không ai trách được._
}
ke_toan: {sales}. Hợp đồng BTT Global bản gốc đâu em? Chị cần để hạch toán.
~ sl_hoi_hoa_don = sl_hoi_hoa_don + 1
_Lần đầu tiên có người hỏi bản gốc. Lần đầu tiên bạn nghe tim mình đập ở cổ họng._ # hen_gio:5
* [📞 Điện Thoại Giả: "Dạ chủ tịch đang gọi, chị chờ em xíu!"]
    { RANDOM(1, 10) <= 5:
        _Bạn ra hành lang "nghe máy" 20 phút. {ke_toan} bị kéo đi họp. Thoát. Tạm thời._
        ~ sl_phet(5)
    - else:
        _Điện thoại reo thật giữa lúc bạn đang "nghe". Màn hình: "Anh Chương (nợ {sl_no_chuong}đ)"._
        ke_toan: Chủ tịch BTT tên Chương hả em?
        ~ sl_phet(10)
        ~ qh("ke_toan", -8)
    }
* [🗣️ "Dạ bản gốc bên đó đang gửi từ Singapore, chị."]
    ~ sl_phet(8)
    ke_toan: Singapore. *(ghi sổ)* Chị ghi ngày em nói. Để sau này đối chiếu.
* [🤝 "Dạ… chị cho em thêm một tuần. Em… chưa có bản gốc."]
    ~ sl_that_long()
    ke_toan: *(nhìn bạn lâu)* Chưa có bản gốc… hay chưa có hợp đồng?
    sales: Dạ… em xin phép không trả lời câu đó, chị.
    ke_toan: Ừ. Một tuần.
    ~ qh("ke_toan", 5)
* [⏱️ (Không chọn kịp)]
    _Bạn đứng đơ. {ke_toan} gật đầu như đã hiểu hết, rồi quay lại màn hình. Đó là cái gật đầu đáng sợ nhất tháng._
    ~ cang_thang(10)
- { sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
-> END
