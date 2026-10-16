// ============================================================
// KẾ TOÁN · CHƯƠNG 3: "THÌ THẦM TRONG BÓNG TỐI" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== ke_toan_1310_mot_bong_hoa ===
# ngay:13 # gio:09:00 # noi:phong_ke_toan # bat_buoc
_Ngày Doanh nhân Việt Nam. Trên bàn bạn: đề nghị thanh toán "Hoa chúc mừng Giám đốc nhân Ngày Doanh nhân: 5.000.000đ". Người đề nghị: {giam_doc}. Người nhận hoa: {giam_doc}._
* [🌹 Duyệt 50.000đ. Mua một bông.]
    ~ kt_keo(5)
    ~ kt_quy(0)
    _Bạn tự đi mua. Một bông hồng đỏ, gói giấy báo. Đặt lên bàn sếp với tờ ghi chú: "Doanh nhân thật thì một bông là đủ."_
    giam_doc: *(cầm bông hoa, đọc tờ ghi chú, im lặng)* … Ừ. Đủ.
    ~ qh("giam_doc", 3)
* [🧾 "Hóa đơn tự tặng mình thì hạch toán vào mục nào anh?"]
    ~ kt_hoa_don()
    giam_doc: Mục… "văn hóa doanh nghiệp"?
    ke_toan: Văn hóa doanh nghiệp không có mục đó anh.
    ~ qh("giam_doc", -3)
* [😇 Duyệt đủ 5 triệu. Ổng cũng cần được vui.]
    ~ kt_quy(-5)
    ~ kt_keo(-5)
    ~ qh("giam_doc", 5)
    _Bó hoa to bằng cái bàn. {thanh_ninh} đọc bài khen 15 phút trước bó hoa. {sales} tặng thêm bằng khen "Doanh nhân của năm" của BTT Global. Bạn ghi vào sổ: "Hoa: 5 triệu. Bằng khen: không rõ nguồn gốc."_
- -> END

// ------------------------------------------------------------
=== ke_toan_1410_moc_2 ===
# ngay:14 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Ngày Hội Nông dân. Trên bàn bạn có đơn nghỉ phép của {thanh_xin_nghi}: "Về quê phụ gặt lúa." Quê ở Ven Đô. Ven Đô trồng rau muống. Bạn vẫn đóng dấu "nghỉ không lương"._
_Mốc 2: 200.000 người theo dõi. Hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi >= 200000:
    _Đạt. {giam_doc} vẫn gọi bạn lên phòng. "Đà đang tốt, mình tăng quảng cáo gấp đôi cho nóng!"_
- else:
    _Trượt. {sieu_nhan_hong} buồn, bỏ đi giúp người cả ngày. {giam_doc} đập bàn: "Tăng ngân sách quảng cáo gấp đôi!"_
}
giam_doc: 400 triệu. Em duyệt nhé. Anh không ép, tùy em.
* [✅ Duyệt 400 triệu.]
    ~ kt_quy(-400)
    ~ follow(50000)
    ~ kt_ngu(15)
    ~ kt_keo(-10)
    _Bạn bấm nút. Tay lạnh ngắt. Quỹ Công Ty: {kt_quy_cong_ty} triệu._
* [🙅 "Không. Tuần trước 200 triệu mới ra được bấy nhiêu. Gấp đôi tiền không ra gấp đôi người."]
    ~ kt_keo(10)
    ~ follow(-10000)
    ~ qh("giam_doc", -5)
    giam_doc: Em lo xa quá…
    ke_toan: Em lo đúng 10 tỷ thôi anh. Không xa đâu.
* {qh_sieu_nhan_hong >= 30} [🩷 "Em có ý này: chiến dịch 'Hồng 0 Đồng'. Quay lại những lần {sieu_nhan_hong} đi giúp người. Thật. Không tốn tiền."]
    ~ kt_hong_0_dong = true
    ~ follow(40000)
    ~ kt_keo(5)
    ~ qh("sieu_nhan_hong", 15)
    ~ qh("giam_doc", 5)
    giam_doc: *(im lặng)* … Người keo nhất công ty lại nghĩ ra cái chiến dịch hay nhất công ty.
    sieu_nhan_hong: *(đứng ở cửa, nghe hết)* Chị {ke_toan}… vậy là em cứ đi giúp người là được hả? Vì công lý và lượt view!
* [✂️ "Em duyệt 100. Còn lại anh đi golf tìm tài trợ đi."]
    ~ kt_quy(-100)
    ~ follow(15000)
    ~ kt_ngu(5)
    giam_doc: … Ừ. Anh đi golf. Thật đấy.
- -> END

// ------------------------------------------------------------
=== ke_toan_1510_ngoi_khong ===
# ngay:15 # gio:08:10 # noi:phong_ke_toan # bat_buoc
_Ngày Thanh niên. 8:05, mất điện cả tòa nhà. Nghe nói {giam_doc} và {chi_dai} đang kẹt trong thang máy._
_Không máy tính. Không ngân hàng điện tử. Không máy in. Lần đầu tiên trong mười năm, bạn ngồi không._
_Bạn nhìn hai bàn tay mình. Chúng không biết làm gì nếu không cầm bút hoặc bấm máy tính._
* [📒 Lấy sổ tay ra, cộng sổ bằng tay dưới ánh sáng cửa sổ.]
    _Bạn cộng ba lần. Ba lần ra cùng một con số. Thấy yên tâm một chút._
    ~ kt_keo(3)
* [🕯️ Đi dự cuộc họp thắp nến của {truong_phong} ở phòng "Sáng Tạo".]
    _12 cây nến xếp hình chữ G. {thuc_tap_sinh} xếp 5 cục sạc dự phòng 30.000 mAh lên bàn._
    designer: Ủa sao thực tập sinh có nhiều sạc xịn vậy?
    _Bạn nhìn vỏ cục sạc. Dòng chữ khắc mờ: "Tri ân khách hàng Kim Cương"._
    ~ phat_hien(duy_tung_lam_ngan_hang)
* [😴 Gục đầu xuống bàn. Ngủ.]
    _Bạn ngủ 40 phút. Giấc ngủ sâu nhất từ ngày 1/10. Bạn mơ thấy một bảng tính không có ô màu đỏ nào._
    ~ kt_ngu(-15)
    ~ nghi(20)
- -> END

// ------------------------------------------------------------
=== ke_toan_1510_pantry_huong ===
# ngay:15 # gio:11:30 # noi:pantry # bat_buoc
_Pantry tối mờ. Ai cũng ra đây ngồi buôn chuyện vì không có gì để làm. {chi_dai} vừa thoát khỏi thang máy, mặt còn hầm hầm, kéo bạn vào góc cạnh tủ lạnh._
chi_dai: *(đưa bạn ly trà đá)* Bà nhìn mặt kìa. Hai tuần nay bà ngủ được mấy tiếng? Có chuyện gì nói tui nghe.
* [🤝 "{chi_dai}, nói nhỏ thôi. Trang 47 hợp đồng. Thất bại là hoàn gấp đôi. 10 tỷ."]
    ~ kt_ke_huong = 2
    ~ kt_ngu(-20)
    ~ qh("chi_dai", 15)
    chi_dai: *(im lặng ba giây)* … Rồi. Từ giờ show nào chị cũng gánh.
    ~ kt_ran_doc_nghe_47 = true
    _Cửa nhà vệ sinh cuối pantry khép hờ. Bạn không thấy ai. Nhưng có một đôi giày đứng yên rất lâu ở khe cửa. Giày của người mới vào ngày 1/10._
* [😶 "Không có gì. Tui mất ngủ do uống cà phê thôi."]
    ~ kt_ke_huong = 0
    ~ kt_ngu(5)
    chi_dai: Bà hông uống cà phê. *(thở dài)* Thôi được. Lúc nào muốn nói thì nói.
* [🗄️ "{chi_dai}, nếu công ty sập, tui có để dành một ít. Đủ trả mọi người một tháng."]
    ~ kt_ke_huong = 1
    ~ kt_huong_biet_quy_den = true
    _{chi_dai} im lặng rất lâu. Rồi nắm tay bạn. Tay {chi_dai} to, chai, ấm._
    chi_dai: Bà… gom bao lâu rồi?
    ke_toan: Gần hai năm.
    ~ qh("chi_dai", 20)
    ~ kt_ngu(-10)
    { RANDOM(1, 10) <= 4:
        ~ kt_them_dau_vet(1)
        _Cửa nhà vệ sinh kêu "két" một tiếng rất nhỏ._
    }
- -> END

// ------------------------------------------------------------
=== ke_toan_1510_nen_va_so ===
# ngay:15 # gio:18:30 # noi:pantry
_Chiều tối, vẫn mất điện. Pantry chỉ có đèn pin điện thoại. Có tiếng hát rất nhỏ._
idol_het_thoi: *(hát)* "Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên…"
_Không kính đen. Không phòng chờ. Giọng vẫn như năm 2015. Ở góc tối, {editor} giơ điện thoại quay rất khẽ._
_Bạn đứng ở cửa, tay ôm cuốn sổ. Bạn nhớ mình đã mua đĩa "Công Viên" năm 2015, bằng tiền làm thêm. Có hóa đơn hẳn hoi._
* [😇 Ngồi xuống nghe hết bài.]
    ~ kt_ngu(-10)
    ~ cang_thang(-10)
    _Hết bài, {idol_het_thoi} nhìn thấy bạn, giật mình đeo kính vào. Rồi tháo ra._
    idol_het_thoi: Chị {ke_toan}… chị nghe hả?
    ke_toan: Tui có mua đĩa năm 2015. Còn giữ hóa đơn.
    idol_het_thoi: *(cười, mắt đỏ)* … Thật hả bà?
    ~ qh("idol_het_thoi", 15)
* [💬 Nhắn {editor}: "Clip đó đừng đăng vội. Hỏi ý {idol_het_thoi} trước."]
    editor: *(nhắn lại)* Dạ. Em không đăng đâu. Em quay… cho người khác xem thôi.
    ~ qh("editor", 5)
* [🕯️ Đi lên phòng kế toán, đếm tiền mặt quỹ lẻ dưới ánh nến.]
    _Trên cầu thang tối, bạn thấy {sieu_nhan_hong} ngồi bậc thứ 7, mũ đặt bên cạnh, nói chuyện nhỏ với {chua_te_deadline}. Gương mặt thật, bình thường, hơi buồn._
    _Bạn quay lại, đi đường khác. Có những thứ không cần ghi sổ._
    ~ qh("sieu_nhan_hong", 5)
- -> END

// ------------------------------------------------------------
=== ke_toan_1610_cho_5_gio ===
# ngay:16 # gio:05:00 # noi:cho_pho_cu # bat_buoc
_Ngày Lương thực Thế giới. Tối nay công ty liên hoan buffet. Ngân sách buffet: 8 triệu. Bạn tới chợ Phố Cũ lúc 5 giờ sáng._
_Chợ vừa thắp đèn. Mùi cà phê vợt, mùi rau ướt sương. Đây là nơi duy nhất trong thành phố mà bạn thấy con số trở nên dễ thương._
_Danh sách gồm 47 món. {giam_doc} nhắn lúc 4:50: "{ke_toan} ơi thêm tôm hùm nhé anh không ép tùy em."_
* [🦞 Trả lời: "Tôm hùm không có trong dự toán. Tôm đất thì có."]
    ~ kt_keo(3)
    giam_doc: *(5 phút sau)* … Tôm đất cũng là tôm.
* [😇 Thêm tôm hùm vào danh sách. Một con. Cho sếp vui.]
    ~ kt_quy(-1)
    ~ qh("giam_doc", 3)
- _Bạn chọn bắt đầu thế nào?_
* [🛒 Bắt đầu mặc cả một mình.]
    -> ke_toan_mg_cho_mac_ca_mo_dau
* [📞 Rủ {chi_dai} đi cùng. Hai người hai sạp.]
    chi_dai: *(giọng ngái ngủ)* … 5 giờ sáng? … Rồi. Tui tới.
    ~ qh("chi_dai", 5)
    -> ke_toan_mg_cho_mac_ca_mo_dau

// ------------------------------------------------------------
=== ke_toan_1610_duyet_gameshow ===
# ngay:16 # gio:08:30 # noi:phong_ke_toan # bat_buoc
_Gameshow "Hồng Hay Không Hồng" ở Đài Tivi Hóng: 14:00 quay, 20:00 phát sóng. {quan_ly_idol} đặt lên bàn bạn ba tờ đề nghị: trang phục mới, xe đưa đón, bánh chuối chiên phòng chờ._
quan_ly_idol: {ke_toan} ơi duyệt giùm anh trước 10 giờ nha. Khoan, anh nghe máy chút… Không kịp là {sieu_nhan_hong} lên sóng bằng bộ đồ cũ bạc màu đó!
* [✅ Duyệt cả ba, ngay bây giờ.]
    ~ kt_duyet_gameshow = true
    ~ kt_quy(-25)
    ~ follow(15000)
    ~ qh("quan_ly_idol", 10)
    ~ qh("sieu_nhan_hong", 5)
    quan_ly_idol: Em là cứu tinh! Chuyện này để anh lo, à em lo xong rồi!
* [✍️ "Ba chữ ký đủ thì chị duyệt."]
    ~ kt_keo(5)
    _{quan_ly_idol} chạy đi săn chữ ký. Về tới nơi là 11:40. Xe đặt được, bánh có, nhưng trang phục không kịp may._
    ~ follow(10000)
    ~ qh("quan_ly_idol", -5)
    _Tối đó, trên sóng truyền hình, bộ đồ hồng hơi bạc ở đầu gối. Mạng xã hội gọi là "Hồng Bạc Màu"._
* [🧾 "Bánh chuối chiên mà cũng tính tiền công ty? Không có điều khoản nào…"]
    ke_toan: … À. Có. Điều khoản số 4.
    _Bạn tự bật cười. Duyệt cả ba. Kèm một câu: "Hóa đơn bánh chuối chiên giữ kỹ cho chị."_
    ~ kt_duyet_gameshow = true
    ~ kt_quy(-25)
    ~ follow(15000)
- -> END

// ------------------------------------------------------------
=== ke_toan_1610_gameshow_va_buffet ===
# ngay:16 # gio:20:00 # noi:tang_1
_20:00. Cái tivi ở tầng 1 đang phát gameshow quay từ chiều: {sieu_nhan_hong} hát "Công Viên" sai lời, "bán khoai chiên tại công viên". Và một giọng hát bè từ cánh gà, chuẩn từng nốt. Mười phút sau, clip đã lên xu hướng._
_Buffet công ty bày kín tầng 1. Đồ ăn bạn mua từ 5 giờ sáng. Ai cũng ăn như chưa từng được ăn._
~ an(100)
* [🧾 Đứng cạnh bàn buffet, cầm sổ, đếm từng đĩa.]
    hong_hot: Chị ơi! Ăn đi chị, đếm gì nữa!
    ke_toan: Đếm để tháng sau dự toán chính xác hơn.
    _Bạn đếm tới đĩa thứ 47 thì {chi_dai} lấy sổ của bạn, nhét vào túi tạp dề, đưa bạn một đĩa gỏi cuốn._
    ~ qh("chi_dai", 5)
    ~ kt_ngu(-5)
* [😇 Ăn. Không đếm. Một tối thôi.]
    ~ kt_ngu(-10)
    ~ cang_thang(-15)
    ~ qh("hong_hot", 5)
    ~ qh("thuc_tap_sinh", 5)
    _Gỏi cuốn ngon. Chả giò giòn. Bạn quên mất trang 47 trong 26 phút. Một kỷ lục._
* [📦 Gói đồ ăn thừa vào hộp, dán nhãn, chia cho ai ở trọ.]
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("it", 5)
    ~ qh("dan_dau_tu", 5)
    _Mười hai hộp, mỗi hộp ghi tên. {it} nhận hộp có ghi "{it} – không phải mì ly". Lần đầu tiên bạn thấy {it} cười._
- -> END
