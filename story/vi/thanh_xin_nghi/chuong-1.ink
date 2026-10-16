// ============================================================
// THÁNH XIN NGHỈ: SƠN · CHƯƠNG 1: "BÀ NGOẠI LẦN THỨ 8" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_xin_nghi_0110_goi_7h ===
# ngay:1 # gio:06:50 # noi:nha_ven_do # bat_buoc
_Nhà vườn Ven Đô. 6 giờ 50 sáng. Gà gáy thật, không phải gà tải trên mạng. Trên tường, ảnh bà ngoại cười tươi khỏe re._
_Bạn cầm điện thoại, tập giọng yếu ớt trước gương. Hôm nay Quốc tế Người cao tuổi. Lý do đẹp như trong sách._
_"Dạ anh {hr}, hôm nay ngày người cao tuổi, bà ngoại em cũng là người cao tuổi, em xin phép…"_
_Điện thoại reo trước khi bạn kịp bấm gọi. Màn hình: "Anh {quan_ly_idol} (2)". Rồi "Anh {quan_ly_idol} (3)". Rồi "Anh {quan_ly_idol} (5)"._
quan_ly_idol: {thanh_xin_nghi}! Đừng có nói với anh là bà ngoại! Hôm nay ký hợp đồng 5 tỷ! Vắng em là anh chết! Anh chết thiệt đó!
* [🤧 Ho giả: "Khụ khụ… anh {quan_ly_idol}… em hơi sốt…"]
    quan_ly_idol: Sốt thì uống hạ sốt rồi tới! Anh mua sẵn cho em ở quầy lễ tân! Có cả cháo!
    ~ son_tin(-3)
    _Anh {quan_ly_idol} lo hết, kể cả cơn sốt bạn chưa kịp có._
* [😇 "Dạ, em tới liền."]
    quan_ly_idol: Đó! Vậy mới là em anh! Mang theo cuốn sổ lịch nha!
    ~ qh("quan_ly_idol", 5)
    ~ son_soi(-3)
* [👵 "Anh ơi… bà ngoại em…"]
    quan_ly_idol: Bà ngoại em ốm 7 lần trong năm rồi {thanh_xin_nghi}. Lần thứ 8 để tháng sau đi. Anh xin em đó.
    ~ son_tin(-5)
    ~ qh("quan_ly_idol", -3)
- _Bạn nhìn ảnh bà ngoại trên tường. Bà vẫn cười. Bà ở quê, khỏe re, đang đi tập dưỡng sinh. Bạn xin lỗi bà lần thứ 32 trong năm, rồi dắt xe ra._
~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2. Một người mặc nguyên bộ siêu nhân màu hồng ký vào tập hợp đồng 52 trang. 5 tỷ về tài khoản. Cả phòng hò reo._
sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ!
_Rồi {giam_doc} quay sang bạn, đặt vào tay bạn một cuốn sổ lịch dày cộp, bìa hồng._
giam_doc: {thanh_xin_nghi}. Đây là lịch 30 ngày của Siêu Nhân Hồng. Em giữ. Từ hôm nay em là người quan trọng nhất công ty sau anh. Anh không ép, tùy em.
_Bạn lật trang cuối. Một dòng in đậm: "31/10, 19:30: ĐẠI NHẠC HỘI SIÊU NHÂN. Toàn công ty có mặt. Không ai được nghỉ."_
_Chữ "không ai được nghỉ" được ai đó gạch chân hai lần bằng bút đỏ. Nét gạch giống chữ anh {hr}._
* [📅 "Dạ, em lo được. Lịch là nghề của em."]
    ~ uy_tin = uy_tin + 3
    ~ qh("giam_doc", 5)
    giam_doc: Tốt! Thế mới là nhân viên có mindset!
* [😶 Lật thử vài trang, thấy toàn ô trống, thở dài trong bụng.]
    _30 ngày. Không một ô nào ghi "Sơn". Như mọi tháng._
    ~ cang_thang(5)
* [💬 "Anh ơi, cuối tuần thì Siêu Nhân Hồng có nghỉ không anh?"]
    giam_doc: Siêu nhân thì nghỉ gì em. Mà em hỏi thế làm gì? Em định nghỉ à?
    ~ son_soi(5)
    hr: *(đứng sát tường, cười)* …
    _Bạn thấy anh {hr} mỉm cười ở góc phòng. Bạn nổi da gà._
- _{sieu_nhan_hong} đi vòng bàn bắt tay từng người, dừng lại trước bạn._
sieu_nhan_hong: Em là người giữ lịch hả? Lịch anh có chỗ nào ghi "đi giúp người" hông?
* [🤝 "Dạ có. Em chừa cho anh mỗi ngày một khung, 15 phút."]
    ~ son_khung_gio_giup_nguoi = true
    ~ qh("sieu_nhan_hong", 10)
    sieu_nhan_hong: Slay! Em là người hiểu anh nhất công ty!
    chi_dai: *(liếc qua)* Lịch gì có dòng "đi giúp người", {thanh_xin_nghi}?
* [📅 "Dạ hông có anh. Lịch kín lắm."]
    sieu_nhan_hong: Ờ… vậy anh tự chen vô. *(tạo dáng, hơi buồn)*
    ~ qh("sieu_nhan_hong", -3)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0110_trua_xe_day ===
# ngay:1 # gio:12:10 # noi:xe_day_com
_Trưa. Bạn với {quan_ly_idol} ăn vội ở xe đẩy cơm đầu hẻm, đứng ăn. Anh {quan_ly_idol} cầm hai cái điện thoại, đũa kẹp giữa hai ngón._
quan_ly_idol: Khoan, anh nghe máy chút… Alo… Ừ… Đám cưới tối thứ 7 hả, {idol_het_thoi} hát 3 bài, 4 triệu… Rồi.
quan_ly_idol: {thanh_xin_nghi}. {idol_het_thoi} cuối tuần này hát 2 đám cưới. Em xếp xe cho ổng giùm anh.
_Bạn nhìn {quan_ly_idol}. 37 tuổi, mắt thâm, 2 cái điện thoại. Anh lo cho cả thế giới, trừ chính mình._
* [🤝 "Anh ăn đi, để em nghe máy giùm 5 phút."]
    ~ qh("quan_ly_idol", 8)
    _Bạn nghe 3 cuộc. Anh {quan_ly_idol} ăn được nửa hộp cơm. Lần đầu trong tuần._
    quan_ly_idol: Em mà đi làm đủ ngày thì anh sống thêm được 10 năm.
* [💬 "Anh {quan_ly_idol}… nếu em có một bí mật, anh có giận em không?"]
    quan_ly_idol: Bí mật gì? Em lấy vợ hả?
    _Bạn cười, lắc đầu. Chưa phải lúc._
    ~ qh("quan_ly_idol", 3)
* [😶 Ăn im lặng, nghĩ tới tối nay.]
    _Tối nay có tin nhắn. Bạn biết. Bạn đã chờ nó 2 tuần._
- ~ an(50)
~ tien_cong(-30000)
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0110_tin_nhan ===
# ngay:1 # gio:21:00 # noi:nha_ven_do # bat_buoc
_9 giờ tối. Nhà vườn Ven Đô. Tiếng ếch nhái. Điện thoại rung._
_"Chúc mừng SƠN KIM TUYẾN đã vào vòng trong 'Giọng Ca Ước Mơ'. Vòng 2 ghi hình: lịch báo sau. Chung kết truyền hình trực tiếp: 20:00, thứ 7 ngày 31/10."_
_Bạn mở cuốn sổ lịch bìa hồng. Trang cuối. "31/10, 19:30: ĐẠI NHẠC HỘI SIÊU NHÂN. Toàn công ty có mặt. Không ai được nghỉ."_
_Hai sân khấu. Một đêm. Cách nhau 30 phút xe máy. Giờ cao điểm thì 1 tiếng._
* [🎤 Lấy bộ đồ kim tuyến cũ ra, tập hát trước gương tới khuya.]
    ~ son_mo(5)
    ~ nghi(-15)
    _Kim tuyến rơi lả tả trên sàn nhà. Mai phải quét kỹ, kẻo dính lên áo đi làm._
* [📅 Lấy bút chì, viết nhỏ xíu vào góc trang 31/10: "20:00 – S.K.T."]
    _Ba chữ cái. Không ai hiểu. Chỉ có bạn hiểu. Bạn tẩy đi, rồi viết lại, nhỏ hơn._
    ~ cang_thang(5)
* [😢 Nhìn ảnh bà ngoại: "Bà ơi, con lại phải nhờ bà ốm nữa rồi."]
    _Bà cười trên tường. Bà không biết mình là người ốm nhiều nhất Thành Phố Ước Mơ._
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0210_cuoi_cham_cong ===
# ngay:2 # gio:07:58 # noi:tang_tret # bat_buoc
_Ngày Nụ cười Thế giới. Tối qua {giam_doc} nhắn group: "Mai ai chấm công cũng phải cười nhé." Ở máy chấm công là anh {hr}. Đang cười. Rất tươi._
_4 người phía trước bạn đã quay đầu chạy ra bãi xe._
hr: Chào em {thanh_xin_nghi}. Cười lên nào. Hôm nay ngày Nụ cười.
* [😁 Cười gượng hết cỡ.]
    _Bạn nhe răng. Má co giật. Anh {hr} nhìn bạn rất lâu, rồi ghi gì đó vào cuốn sổ nhỏ._
    ~ son_soi(5)
    _Sau này bạn mới biết anh ấy ghi: "Nụ cười của người sắp xin nghỉ."_
* [🎤 Cười kiểu sân khấu, nghiêng đầu 15 độ, mắt long lanh.]
    hr: *(khựng lại)* …Ủa. Em cười đẹp ha. Giống ai đó…
    _Tim bạn rớt xuống bãi xe. Bạn chấm công rồi chạy lên cầu thang._
    ~ son_soi(3)
    ~ son_mo(2)
* [😷 Đeo khẩu trang, cười bằng mắt.]
    hr: Hôm nay đâu có bụi em?
    thanh_xin_nghi: Dạ… em hơi… dị ứng nụ cười ạ.
    ~ son_soi(8)
    ~ son_tin(-3)
- ~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp chiến dịch "Hồng Hóa Việt Nam". {truong_phong} vẽ mũi tên lên bảng: "1.000.000". {sales} hứa 3 nhà tài trợ 2 tỷ từ BTT Global. {thuc_tap_sinh} kể một ý tưởng phim về người hùng không tên._
truong_phong: {thanh_xin_nghi}, em trình bày lịch tổng thể của Siêu Nhân Hồng nhé.
_Bạn bật máy chiếu. Một cái bảng 30 ô, màu hồng. Bạn đã thức tới 1 giờ sáng để tô._
* [📅 Lịch kín, chặt, không một khe hở.]
    ~ follow(10000)
    ~ uy_tin = uy_tin + 5
    ~ son_mo(-3)
    truong_phong: Rất tốt. Rất chặt. Mình take note.
    _Lịch chặt tới mức không có chỗ cho chính bạn. Bạn biết. Bạn vẫn trình bày._
* [🤝 Lịch có "khung giờ giúp người" 15 phút mỗi ngày, có máy quay đi theo.]
    ~ son_khung_gio_giup_nguoi = true
    chi_dai: Lịch gì có dòng "đi giúp người", {thanh_xin_nghi}? Rồi lỡ ổng giúp lố 2 tiếng thì sao?
    thanh_xin_nghi: Dạ… thì mình quay 2 tiếng chị. Clip giúp người là clip người ta xem nhiều nhất.
    _{dan_dau_tu} gật gù, mở chart. {sieu_nhan_hong} vỗ tay to nhất phòng._
    ~ qh("sieu_nhan_hong", 5)
    ~ qh("chi_dai", -3)
* [🗂️ Lịch có vài ô trống "dự phòng" rơi đúng ngày 14/10 và 25/10.]
    _Không ai để ý. Chỉ có anh {hr} nhìn cái ô trống ngày 14/10 hơi lâu._
    ~ son_soi(5)
    ~ son_mo(3)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0310_lop_thanh_nhac ===
# ngay:3 # gio:15:00 # noi:lop_thanh_nhac
_Thứ 7. Một phòng tập nhỏ trên lầu tiệm sửa đàn ở Phường Tân Drama. Cô giáo thanh nhạc ngồi ở đàn, kính trễ xuống mũi._
phu_co_giao_thanh_nhac: {thanh_xin_nghi}. Vòng 2 sắp tới rồi. Em còn ho giả nhiều quá, cổ họng em quen kiểu ho đó rồi. Phải bỏ.
thanh_xin_nghi: Dạ… nghề của em cần ho cô ơi.
phu_co_giao_thanh_nhac: Nghề gì mà cần ho?
* [😅 "Dạ… nghề xin nghỉ ạ."]
    phu_co_giao_thanh_nhac: *(nhìn bạn qua cặp kính)* Em mà dùng cái giọng đó để hát thay vì để ho, thì em vô chung kết lâu rồi.
    ~ son_mo(5)
* [🎤 "Dạ em bỏ. Từ hôm nay em không ho giả nữa."]
    phu_co_giao_thanh_nhac: Hứa?
    thanh_xin_nghi: Dạ… hứa tới thứ 2 ạ.
    ~ son_mo(3)
- _Một tiếng luyện thanh. Học phí 300.000đ._
* [💰 Trả đủ.]
    ~ tien_cong(-300000)
    ~ son_mo(5)
    ~ nghi(-10)
* [🙏 "Cô cho em thiếu tới lương nha cô."]
    phu_co_giao_thanh_nhac: Thiếu thì thiếu. Hát hay thì trả. Hát dở thì trả gấp đôi.
    ~ son_mo(3)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0410_dem_nhac_song_ao ===
# ngay:4 # gio:20:00 # noi:quan_song_ao # bat_buoc
_Chủ nhật. Ngày Động vật. Quán cà phê Sống Ảo, đèn vàng, cây xanh. Bạn ngồi trên ghế cao, ôm đàn guitar, khẩu trang và mũ lưỡi trai che gần hết mặt._
_Bàn trong góc: một người mặc bộ đồ siêu nhân màu hồng, đang ăn bánh chuối chiên. Đeo đôi găng hồng (đôi dự phòng, Nguyên than với cô phục vụ là đôi chính bị "một con chó ở công ty" cướp sáng nay)._
_Bạn nhận ra bộ găng tay hồng ngay. Bạn kéo mũ xuống thấp hơn._
phu_chu_quan_song_ao: {thanh_xin_nghi}, tối nay đông. Hát gì cho khách vui đi em.
* [🎶 Một bài ballad buồn, hát mộc.]
    ~ son_mo(5)
    _Cả quán im lặng. Có cô gái bàn bên lấy khăn giấy chấm mắt. Góc trong cùng, bộ đồ hồng ngồi yên, không ăn bánh nữa._
* [🎶 "Công Viên" bản acoustic. Bài hit 2015 ai cũng thuộc.]
    ~ son_mo(3)
    ~ tien_cong(50000)
    _Cả quán hát theo đoạn điệp khúc. "…bán cá viên chiên tại công viên…". Bàn trong góc hát to nhất, sai lời: "khoai chiên"._
* [🎶 Một bài vui, gõ nhịp lên thân đàn.]
    ~ son_mo(2)
    ~ cang_thang(-10)
    _Khách vỗ tay theo nhịp. Bộ đồ hồng đứng dậy nhảy một mình, rất tự tin, rất lệch nhịp._
- ~ tien_cong(200000)
~ uong(15)
_Chủ quán đưa bạn phong bì tiền tip, 200.000đ, kèm một ly trà đào miễn phí như mọi khi._
-> thanh_xin_nghi_0410_dem_nhac_song_ao.s_sau_dem_nhac

= s_sau_dem_nhac
_Bài cuối. Cả quán vỗ tay. Bàn trong góc vỗ tay to nhất quán, rồi đứng dậy, đặt vào hộp đàn một tờ 500.000đ._
sieu_nhan_hong: Em hát hay quá! Hồng không phải màu, Hồng là thái độ! Mà giọng em là thái độ luôn!
_{sieu_nhan_hong} không nhận ra bạn. Bạn mới gặp anh ấy 3 ngày trước, ở phòng họp, đưa anh ấy cuốn lịch._
* [🤐 Nhận tiền, cúi đầu cảm ơn, im lặng.]
    ~ tien_cong(500000)
    _{sieu_nhan_hong} vẫy tay rồi biến mất trên chiếc xe hồng. Bí mật vẫn là bí mật._
* [🙋 Kéo khẩu trang xuống: "Anh Nguyên! Em là {thanh_xin_nghi}, người giữ lịch của anh nè!"]
    sieu_nhan_hong: *(làm rơi miếng bánh chuối)* {thanh_xin_nghi}?! {thanh_xin_nghi} giữ lịch?! Em… em hát hả?
    thanh_xin_nghi: Dạ… anh giữ bí mật giùm em nha. Ở công ty không ai biết.
    sieu_nhan_hong: Bí mật hả? Anh giỏi giữ bí mật lắm. Thiệt đó. *(chỉ vào cái mũ)* Cái này là bằng chứng.
    ~ tien_cong(500000)
    ~ son_nguyen_biet = true
    ~ qh("sieu_nhan_hong", 15)
* [💸 Trả lại tờ 500.000: "Dạ nhiều quá anh, em nhận 50 thôi."]
    sieu_nhan_hong: Tiền giúp ước mơ thì không có nhiều. Giữ đi! *(chạy mất trước khi bạn kịp nói gì)*
    ~ tien_cong(500000)
    ~ qh("sieu_nhan_hong", 5)
- -> END
