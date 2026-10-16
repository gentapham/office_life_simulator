// ============================================================
// CHÚA TỂ DEADLINE · CHƯƠNG 1: "CHILL, CÒN 30 NGÀY MÀ" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== chua_te_deadline_0110_tre_ngay_lich_su ===
# ngay:1 # gio:08:19 # noi:cong_cong_ty # bat_buoc
_8 giờ 19. Từ phòng gác trên quán bida tới cổng công ty đúng 200 mét. Bạn đi hết 19 phút, trong đó 15 phút là đứng chờ đèn đỏ của… cái thang máy trong đầu mình._
_Tay trái ly cà phê sữa đá, tay phải điện thoại đang lướt Tóp-tóp dở một video mèo._
cho: Gâu! *(chạy ra, ngửi ống quần bạn, rồi ngửi ly cà phê rất lâu)*
bac_bao_ve: Cháu {chua_te_deadline}. Hôm nay ký hợp đồng lớn đấy. Cả công ty lên phòng họp từ 7 giờ rưỡi rồi.
* [😇 "Dạ con biết rồi bác. Nước tới chân mới nhảy mà bác."]
    bac_bao_ve: Ừ. Nhảy thì nhảy cho nhanh. Nước tới đầu gối rồi đấy.
    ~ qh("bac_bao_ve", 3)
* [📱 "Bác coi video con mèo này nè bác, nó biết đi xe đạp."]
    _Bác {bac_bao_ve} nhìn màn hình 3 giây. Không nói gì. Nhưng không bảo bạn đi._
    bac_bao_ve: … Con mèo nhà ai mà giỏi thế.
    ~ vu_gio_luot = vu_gio_luot + 1
    ~ vu_nuoc(3)
    ~ qh("bac_bao_ve", 5)
* [🐾 Cúi xuống xoa đầu {cho}.]
    cho: Gâu gâu! *(liếm tay bạn, mắt vẫn dán vào ly cà phê)*
    ~ qh("cho", 8)
    bac_bao_ve: Nó mê cái mùi cà phê sữa của cháu lắm. Lạ thật.
- _Ở máy chấm công, {hr} đang đứng sẵn, tay cầm cuốn sổ, miệng cười rất tươi._
hr: Chào em. 8 giờ 20. Mình cùng nhìn lại hành trình đi làm sáng nay nha em.
* [🐢 "Anh ơi, slogan công ty ghi 'Việc hôm nay cứ để ngày mai tính' mà anh."]
    ~ vu_trich_slogan++
    hr: *(cười tươi hơn)* Ừ. Tiền phạt hôm nay thì cứ để ngày mai đóng. 50 nghìn nha em.
    ~ tien_cong(-50000)
    ~ qh("hr", -3)
* [😇 "Dạ em xin lỗi anh, em bỏ quỹ trà sữa liền."]
    ~ tien_cong(-50000)
    ~ qh("hr", 3)
    hr: Ngoan. Thứ 6 em uống trà sữa bằng tiền của chính mình nha.
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp "Sáng Tạo" chật kín. Trên bàn là xấp hợp đồng 52 trang. Đầu bàn, một người mặc bộ đồ siêu nhân màu hồng đang tạo dáng cho {hong_hot} chụp._
_Bạn lách vào góc cuối phòng, ngồi xuống, mở điện thoại. Không ai để ý. Hoàn hảo._
giam_doc: Các em! Hôm nay là một ngày lịch sử! Xin giới thiệu đối tác chiến lược của {cong_ty}: Siêu Nhân Hồng!
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ! *(tạo dáng)*
ke_toan: *(thì thầm với {giam_doc})* Anh ơi, anh đọc giúp em trang 47 trước khi ký đã…
giam_doc: Thôi em, đối tác đang chờ. Anh không ép, tùy em… mà thôi ký luôn.
_Chữ ký. Tiếng vỗ tay. 5 tỷ về tài khoản. {hong_hot} livestream, {thanh_ninh} khóc vì xúc động, {dan_dau_tu} lẩm bẩm "5 tỷ mà all-in coin thì…"._
giam_doc: Và người cầm lái cả chiến dịch này là… {chua_te_deadline}! Đâu rồi? À đây rồi, ngồi góc cuối.
_Cả phòng quay lại. Bạn đang xem dở một video dạy nấu mì bằng ấm siêu tốc._
giam_doc: *(vỗ vai bạn)* MV, gameshow, livestream, Đại Nhạc Hội 31/10. Cả chiến dịch nằm trong tay em đấy. Anh không ép, tùy em.
* [🌊 "Dạ chill anh, còn 30 ngày mà. Kịp hết."]
    ~ vu_nuoc(5)
    truong_phong: *(ở đầu bàn, hít một hơi rất sâu)* "Kịp hết". Tớ ghi lại câu này nhé, {chua_te_deadline}.
    ~ qh("truong_phong", -5)
    ~ qh("giam_doc", 3)
* [😇 "Dạ em nhận. Em sẽ cố hết sức, anh."]
    ~ uy_tin = uy_tin + 3
    ~ qh("giam_doc", 5)
    giam_doc: Đấy! Thái độ đấy! Cái mindset này anh thích!
* [🙏 "Dạ em nhận, mà chắc em cần thêm người phụ…"]
    _Bạn liếc về phía {thuc_tap_sinh}. {thuc_tap_sinh} ngồi thẳng lưng lên như vừa được gọi tên._
    thuc_tap_sinh: Dạ em làm liền ạ! *(chưa biết là làm gì)*
    ~ qh("thuc_tap_sinh", 3)
- _{sieu_nhan_hong} đi một vòng bắt tay từng người. Tới chỗ bạn, Siêu Nhân Hồng khựng lại._
_Bạn vẫn đang lướt. Cả phòng thì cuống cuồng. Chỉ có bạn là ngồi im như mặt hồ._
sieu_nhan_hong: Ờm… em là producer hả?
* [😎 "Dạ. Chill anh, kịp hết."]
    _{sieu_nhan_hong} đứng hình đúng 3 giây. Rồi tạo dáng hơi lệch nhịp._
    sieu_nhan_hong: C-chill! Hồng là thái độ! Mà… chill cũng là thái độ!
    ~ qh("sieu_nhan_hong", 8)
* [🤝 Đứng dậy bắt tay đàng hoàng.]
    sieu_nhan_hong: *(nắm tay hơi lâu)* Tay em ấm ghê. À không, ý anh là… chào em!
    ~ qh("sieu_nhan_hong", 5)
* [📱 Giơ điện thoại: "Anh tạo dáng cái nữa đi, em quay làm content luôn."]
    sieu_nhan_hong: Biến hình! *(tạo dáng 7 kiểu liên tục)*
    ~ follow(3000)
    ~ qh("sieu_nhan_hong", 3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_0110_may_ca_phe ===
# ngay:1 # gio:10:15 # noi:pantry
_Ngày Cà phê Quốc tế. Máy pha cà phê ở pantry kêu "rẹt rẹt", nhả ra một giọt nước nâu, rồi tắt ngúm._
designer: Ủa alo? Ngày Cà phê mà máy pha cà phê nghỉ lễ hả?
editor: *(ngáp)* Hông có cà phê… là hông có render…
_Cả phòng quay sang nhìn bạn, người vừa được giao "cầm lái cả chiến dịch". Bạn cũng nhìn lại cả phòng._
* [🙏 "Anh {thuc_tap_sinh} ơi, em nhờ xíu. Anh chạy ra quán mua giùm 22 ly nha."]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    ~ qh("thuc_tap_sinh", -5)
    thuc_tap_sinh: Dạ em làm liền ạ! Dạ… 22 ly ạ? Dạ… dạ được ạ!
    _{thuc_tap_sinh} chạy đi. Bạn ngồi xuống, mở Tóp-tóp._
    ~ vu_gio_luot = vu_gio_luot + 1
    ~ vu_nuoc(3)
* [☕ Tự đi mua, nhân tiện đi bộ cho tỉnh.]
    ~ tien_cong(-60000)
    ~ nghi(-5)
    ~ uong(20)
    _Bạn mua 3 ly cho {editor}, {designer} và mình. 19 người còn lại nhìn bạn bằng ánh mắt của 19 người không có cà phê._
    ~ qh("editor", 5)
    ~ qh("designer", 5)
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
* [🔧 "Để tui gọi anh {it}."]
    it: *(10 phút sau, nhìn cái máy)* Rút điện cắm lại chưa?
    _Rút ra. Cắm lại. Máy chạy. Cả pantry vỗ tay. {it} đi về phòng server không nói thêm chữ nào._
    ~ qh("it", 5)
    ~ uong(15)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_0110_mung_bac_binh ===
# ngay:1 # gio:15:00 # noi:sanh_tang_tret
_Ngày Quốc tế Người cao tuổi. Cả công ty kéo xuống sảnh tặng hoa cho Bác {bac_bao_ve}, kèm trà sữa ăn mừng 5 tỷ._
bac_bao_ve: Thôi thôi… các cháu bày vẽ. Bác có già đâu.
hong_hot: Bác cười cái coi bác! Live đang 300 người xem nè!
_Bác {bac_bao_ve} đỏ mặt, cười một cái rất nhỏ. Sau lưng bác, {cho} nằm chắn gầm cầu thang, không cho ai lại gần._
* [🧋 Đưa ly trà sữa của mình cho bác.]
    bac_bao_ve: Cháu không uống à?
    _Bạn lắc đầu. Bác nhận ly, gật nhẹ. Từ bác, một cái gật nhẹ bằng người khác ôm một cái._
    ~ qh("bac_bao_ve", 8)
* [📱 Quay clip bác đỏ mặt, gửi {hong_hot} đăng.]
    ~ follow(2000)
    hong_hot: Ối dồi ôi, bác {bac_bao_ve} đỏ mặt dễ thương xỉu! Cảm ơn ông nha!
    ~ qh("hong_hot", 5)
    bac_bao_ve: … Cái gì đăng lên mạng cũng được, đừng đăng biển số xe bác.
* [💬 "Bác ơi, gầm cầu thang có gì mà {cho} canh dữ vậy bác?"]
    bac_bao_ve: *(nhấp ngụm trà, nhìn ra cổng)* Chó thì nó có chỗ của chó. Chuyện của nó, bác không biết đâu.
    _Bác nói câu đó hơi lâu. Bạn không để ý._
    ~ vu_manh_moi_binh = true
- ~ uong(20)
-> END

// ------------------------------------------------------------
=== chua_te_deadline_0210_qua_hong_dau_tien ===
# ngay:2 # gio:08:24 # noi:ban_lam_viec
_Trên bàn bạn có một cây bút highlight màu hồng, thắt nơ hồng. Mẩu giấy kèm theo, chữ tròn tròn: "Chill nha. —SNH"._
_Bạn nhìn cây bút. Nhìn mẩu giấy. Cầm điện thoại lên chụp._
* [📱 Gửi {hong_hot}: "Bên bà lên kịch bản couple hả? Ok, tui phối hợp."]
    hong_hot: *(trả lời sau 0,3 giây)* HẢ? KỊCH BẢN GÌ? Tui có biết gì đâu! Mà khoan, couple hả? Ét o ét, kể nghe coi!
    _Bạn mở bảng tiến độ, gõ thêm một dòng: "Content couple: để {hong_hot} lo."_
    ~ vu_tin(-3)
    ~ qh("hong_hot", 3)
* [🖊️ Dùng thử cây bút tô lên tờ lịch tháng 10.]
    _Bạn tô một vòng tròn hồng quanh ngày 31/10, ngày duy nhất được khoanh. Đẹp thiệt._
    ~ vu_tin(3)
* [😶 Bỏ vô ngăn kéo, coi như chưa thấy.]
    _Ngăn kéo có 14 gói mì ly, 2 lon Trâu Cày, và giờ thêm một cây bút hồng. Nó nằm đó, hồng một cách kiên nhẫn._
- ~ vu_qua_hong++
~ vu_co_but_hong = true
-> END

// ------------------------------------------------------------
=== chua_te_deadline_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp lên chiến dịch "Hồng Hóa Việt Nam". Mục tiêu: 1 triệu người theo dõi trước 31/10. Trên màn chiếu là bảng tiến độ của bạn._
_Màn chiếu hiện đúng một thanh màu hồng: "31/10: làm hết"._
truong_phong: {chua_te_deadline}, bảng tiến độ của cậu đâu? Tớ nhắn từ hôm qua rồi đấy nhé.
_{dan_dau_tu} khen: "Chart này đẹp, một cây nến xanh dài". {hong_hot} che miệng cười. {thuc_tap_sinh} ngồi ghi chép chăm chú như đang học thật._
* [🌊 "Dạ, đây là phương pháp Agile Nước Tới Chân, bên nước ngoài xài nhiều lắm anh."]
    ~ vu_nuoc(10)
    giam_doc: Agile à? Hay đấy. Anh thích những gì có chữ tiếng Anh.
    ~ qh("giam_doc", 3)
    ~ qh("truong_phong", -10)
    truong_phong: Anh {giam_doc}… đây là một thanh. Một. Thanh.
* [😇 "Dạ em làm lại liền, chiều nay có bản chi tiết."]
    ~ uy_tin = uy_tin + 10
    ~ vu_bang_tien_do_that = true
    truong_phong: Tốt. 14 giờ tớ muốn thấy từng đầu việc, từng người, từng ngày.
    ~ qh("truong_phong", 5)
    -> chua_te_deadline_mg_bang_tien_do_mo_dau
* [🙏 "Dạ chi tiết thì anh {thuc_tap_sinh} đang làm giùm em."]
    ~ vu_so_lan_nho_xiu++
    ~ vu_nho_duy++
    thuc_tap_sinh: Dạ… dạ em làm liền ạ! *(lần đầu nghe về việc này)*
    ~ qh("thuc_tap_sinh", -5)
    chi_dai: *(liếc sang bạn, rồi liếc {thuc_tap_sinh})* …
* [🎲 "Anh {truong_phong}, mình sync nhanh 5 phút sau buổi này nha."]
    { RANDOM(1, 10) <= 5:
        truong_phong: Ồ! Sync nhanh à? Được, được! Tớ đặt phòng luôn!
        _{truong_phong} vui tới mức quên luôn cái bảng tiến độ. Nước đi của thiên tài._
        ~ qh("truong_phong", 5)
    - else:
        truong_phong: Cậu đang dùng câu của tớ để chọc tớ đấy à? Được. Tớ đặt thêm 3 cuộc họp. Cả 3 cuộc đều có tên cậu.
        ~ qh("truong_phong", -10)
        ~ vu_nuoc(5)
        ~ cang_thang(10)
    }
- giam_doc: Thôi, mốc 1 là ngày 7/10: 50 nghìn người theo dõi. Mốc cuối 31/10: 1 triệu. Cả công ty sống hay chết là ở đây đấy các em.
_Bạn ghi vào điện thoại: "7/10: 50k. Còn sớm mà."_
-> END

// ------------------------------------------------------------
=== chua_te_deadline_0310_tin_nhan_22h ===
# ngay:3 # gio:22:00 # noi:phong_gac_quan_bida # bat_buoc
_Thứ 7. 22 giờ đúng. Điện thoại rung. Group Zalo-lô "G-Entertainment - Toàn công ty"._
giam_doc: Các em ơi, trước 20/10 anh muốn xem lại mấy cảnh đẹp nhất của dự án quảng cáo tháng 6, làm clip 16 năm công ty nhé. {chua_te_deadline} lo giúp anh. Anh không ép, tùy em.
_Dự án tháng 6. Hợp đồng 800 triệu. File gốc. Cái USB không nhãn. Cái túi áo khoác._
_Bạn thả tim tin nhắn. Rồi bạn nhìn cái áo khoác treo sau cửa._
* [🧥 Lục túi áo khoác ngay.]
    _Túi trái: 3 vỏ kẹo. Túi phải: 4 vỏ kẹo, một vé giữ xe tháng 9. Túi trong: một vỏ kẹo gấp hình con hạc._
    _Không có USB._
    ~ cang_thang(15)
* [😎 "Còn sớm mà. 20/10 lận."]
    ~ vu_nuoc(5)
    _Bạn tắt điện thoại, lướt Tóp-tóp thêm 2 tiếng. Tới video thứ 140 thì có một video "Cách tìm đồ thất lạc theo phong thủy". Bạn không bấm vào._
    ~ vu_gio_luot = vu_gio_luot + 2
- _2 giờ sáng. Bạn đã lật tung phòng gác: nệm, gầm bàn, kim tự tháp 14 vỏ lon Trâu Cày (giờ là đống đổ nát 14 vỏ lon Trâu Cày)._
_Dưới nhà, tiếng bi va nhau lách cách. Ai đó vừa ăn một cú băng ba băng rất đẹp._
_Vé giữ xe tháng 9 vẫn nằm trên bàn. Bãi xe công ty. Hồi tháng 9, cái lần bạn ngồi xổm buộc dây giày…_
* [🧠 Ghi chú vào điện thoại: "USB: có thể rớt ở bãi xe, tháng 9."]
    ~ phat_hien(usb_cua_vu)
    _Ít ra bây giờ bạn biết mình đã làm mất nó ở đâu. Chỉ không biết ai đã nhặt._
    ~ nghi(-20)
* [😶 Nằm xuống. "Mai tính."]
    ~ vu_nuoc(5)
    ~ nghi(-10)
- ~ cang_thang(10)
-> END

// ------------------------------------------------------------
=== chua_te_deadline_0410_ngay_dong_vat ===
# ngay:4 # gio:10:30 # noi:cong_cong_ty
_Chủ nhật. Ngày Động vật Thế giới. Bạn đi ngang công ty mua ly cà phê sữa đá, vì quán ngon nhất nằm đối diện cổng._
_{cho} mặc áo, đeo nơ hồng, nằm canh gầm cầu thang. Mặt nó là mặt của một con chó đã chịu đựng quá đủ trong một buổi sáng._
cho: Grừ… *(gầm gừ với ai đó vừa đi ngang)*
_Bạn đi ngang. {cho} không gầm gừ. {cho} đứng dậy, đi theo bạn, ngửi ly cà phê sữa đá trên tay bạn rất, rất lâu._
* [☕ Ngồi xuống, cho {cho} ngửi thêm.]
    cho: *(hít hít, nhìn ly cà phê, rồi quay đầu nhìn về gầm cầu thang)* Gâu.
    _Một con chó nhìn ly cà phê, rồi nhìn gầm cầu thang. Như muốn nói gì đó. Bạn nghĩ: "Chắc nó thèm."_
    ~ vu_manh_moi_tuat = true
    ~ qh("cho", 5)
* [🐾 Tháo cái nơ ra giùm nó.]
    cho: *(lắc mình một cái, thở ra rất dài)* Gâu…
    _{cho} nhìn bạn như nhìn một vị cứu tinh. Rồi lại ngửi ly cà phê thêm một lần nữa._
    ~ vu_manh_moi_tuat = true
    ~ qh("cho", 12)
    ~ qh("bac_bao_ve", 3)
* [📱 Đi tiếp, vừa đi vừa lướt.]
    _Bạn không để ý. {cho} đứng nhìn theo bạn tới tận đầu hẻm._
- _Từ xa, một bộ đồ hồng đang tiến lại. {sieu_nhan_hong} giơ tay vẫy, miệng giả tiếng sủa: "Gâu! {cho} ơi!"_
cho: GÂU GÂU GÂU! *(lao đi, bỏ quên bạn)*
sieu_nhan_hong: Ui! Ủa {chua_te_deadline}! Chủ nhật mà em cũng ghé công ty hả?
* [😎 "Ghé mua cà phê thôi anh. Chủ nhật là ngày nghỉ của deadline."]
    sieu_nhan_hong: Ờm… vậy chủ nhật deadline nghỉ… thì em rảnh hông? À không, không có gì! Biến hình! *(chạy đi, bị {cho} rượt)*
    ~ vu_tin(2)
* [💬 "Anh chọc nó hoài, nó ghét anh đó."]
    sieu_nhan_hong: Anh biết… Nó ghét anh mà nó vẫn nhìn anh. Còn có người anh chọc hoài mà người đó hông nhìn anh.
    _Bạn không hiểu câu đó. Bạn uống một ngụm cà phê._
    ~ vu_tin(3)
- -> END
