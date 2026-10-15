// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT
// CHƯƠNG 1: "HỌP NHANH 5 PHÚT" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== truong_phong_0110_sang_som ===
# ngay:1 # gio:07:30 # noi:phong_hop_sang_tao # bat_buoc
~ tp_lich_co_dinh()
_7 giờ 30. Phòng họp "Sáng Tạo" còn thơm mùi nước lau sàn. Bạn đặt laptop, quyển sổ kẻ ô và ba cây bút lông bảng trắng thẳng hàng như quân duyệt binh._
_Lịch hôm nay: 8:00 họp chuẩn bị lễ ký. 8:30 họp chuẩn bị cho cuộc họp lúc 8:00. 9:00 lễ ký hợp đồng. 10:00 họp rút kinh nghiệm lễ ký._
thuc_tap_sinh: Dạ em chào thầy… à dạ, anh {truong_phong} ạ! Em tới từ 7 giờ, em xếp ghế xong rồi ạ.
_{thuc_tap_sinh}, 30 tuổi, thực tập sinh, đứng nghiêm như đang chào cờ._
* [😇 "Cảm ơn cậu… à, em… à, {thuc_tap_sinh} nhé. Cứ gọi anh là được."]
    ~ qh("thuc_tap_sinh", 5)
    thuc_tap_sinh: Dạ! Anh {truong_phong} ạ! Dạ em ghi nhớ ạ!
    _Không ai trong hai người biết ai nên xưng gì. Không khí ngượng như hai cái ghế xếp lệch._
* [📅 "Tốt. Thế mình họp nhanh 5 phút về việc xếp ghế nhé."]
    ~ tp_hop(1)
    thuc_tap_sinh: Dạ… họp về cái ghế em vừa xếp hả anh?
    _Cuộc họp kéo dài 25 phút. Kết luận: ghế vẫn để nguyên chỗ cũ._
    ~ cang_thang(3)
* [☕ "Duy pha giúp anh cốc cà phê được không?"]
    thuc_tap_sinh: Dạ… máy pha cà phê hỏng rồi anh ơi. Đúng ngày Cà phê Quốc tế luôn ạ.
    _Bạn nhìn cái máy. Cái máy nhìn lại bạn, nhấp nháy đèn đỏ như đang cười._
    ~ cang_thang(5)
- _Ngoài cửa kính, thang máy kêu "két" một tiếng rồi đứng im. Một ngày dài bắt đầu._
-> END

// ------------------------------------------------------------
=== truong_phong_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2 chật kín. Một người mặc bộ đồ siêu nhân màu hồng đứng ở đầu bàn, tạo dáng sau mỗi câu nói._
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
giam_doc: Các em, hôm nay là ngày lịch sử của {cong_ty}! Anh không ép ai vỗ tay, tùy các em.
_Cả phòng vỗ tay. {ke_toan} cúi xuống thì thầm gì đó về "trang 47", nhưng {giam_doc} đã đặt bút ký. 5 tỷ về tài khoản._
_Cửa bật mở. {con_ong_chau_cha} bước vào, trễ 25 phút, tay cầm ly cà phê kem._
giam_doc: {con_ong_chau_cha}! Đi làm mà như đi chơi thế à? Chú… anh nói thế cho công bằng thôi nhé.
con_ong_chau_cha: Dạ. Chill đi chú.
_Mọi người bắt đầu đứng dậy, kéo ghế. Đây là khoảnh khắc của bạn._
* [📅 "Nhân tiện mọi người đang đủ, mình họp nhanh 5 phút nhé!"]
    ~ tp_hop(2)
    _Năm phút trở thành hai tiếng. Bạn trình bày 7 mục, mục nào cũng có mục con._
    sieu_nhan_hong: Ờm… mấy giờ thì mình được ăn trà sữa vậy em?
    giam_doc: Họp thế là có tâm. Anh thích.
    ~ tp_ghe(2)
    ~ qh("giam_doc", 3)
    ~ qh("hong_hot", -3)
    ~ qh("chua_te_deadline", -3)
    ~ qh("sieu_nhan_hong", -2)
* [😇 "Chúc mừng anh {sieu_nhan_hong}. Phòng Sản xuất sẽ lo MV đầu tiên trong 9 ngày."]
    sieu_nhan_hong: 9 ngày! Gét gô! Em là trưởng phòng hả? Nhìn em nghiêm túc ghê!
    ~ qh("sieu_nhan_hong", 8)
    ~ tp_ghe(1)
    editor: *(ngáp, thì thầm)* 9 ngày… là 9 đêm của em…
    ~ qh("editor", -3)
* [🪑 Liếc sang {con_ong_chau_cha}: "Có người trễ 25 phút, mình nên thống nhất giờ giấc ngay từ đầu."]
    con_ong_chau_cha: Ủa ông {truong_phong}, tui mới vô mà. Chill đi.
    giam_doc: Thôi thôi. Hai đứa đều là nhân tài của anh cả.
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
    ~ qh("con_ong_chau_cha", -8)
    ~ tp_ghe(-1)
    _Không ai hiểu "đều là nhân tài" nghĩa là ai thắng. Bạn hiểu là mình thua._
- _Trà sữa tới. Cả công ty reo hò. Bạn ngồi lại một mình, ghi vào sổ: "Ngày 1. Ghế Phó: vẫn còn trống."_
-> END

// ------------------------------------------------------------
=== truong_phong_0110_cai_chen ===
# ngay:1 # gio:11:20 # noi:phong_hop_tang_2
_Cuộc họp vẫn chưa xong. Một nhân viên mới thò đầu vào, tay cầm khay ly nhựa._
ran_doc: Dạ anh {truong_phong}, em mới vô. Họp xong rồi hả anh? Em đi rửa ly giùm mọi người nha.
* [📅 "Chưa xong đâu, còn mục 7. Cậu tiện thì mang cái bát lên đây đựng giấy note nhé."]
    ran_doc: Dạ… cái chén hả anh?
    ~ tp_hieu_nham()
    ~ tp_hop(1)
    _{ran_doc} gật đầu, rồi lấy cuốn sổ nhỏ ra ghi gì đó. Bạn không để ý._
    ~ qh("ran_doc", -3)
* [😇 "Ừ, nghỉ đi. Cảm ơn cậu nhé."]
    ~ qh("ran_doc", 5)
    ~ tp_ca_phong(2)
    _Cả phòng thở phào như vừa được ân xá. {chua_te_deadline} biến khỏi ghế trong 3 giây._
    _Một cuộc họp kết thúc mà không ai phải xin. Lạ thật._
* [🧱 "Khoan, tớ vẽ cho cậu sơ đồ tổ chức đã."]
    _Bạn vẽ một cái cây có 4 tầng, 11 mũi tên, 2 vòng tròn tượng trưng cho "tinh thần"._
    ran_doc: Dạ… ô vuông nhỏ xíu dưới gốc là ai vậy anh?
    _Là {bac_bao_ve}. Và {cho}. Bạn giải thích thêm 25 phút._
    ~ qh("ran_doc", 3)
    ~ tp_hop(1)
- -> END

// ------------------------------------------------------------
=== truong_phong_0110_mung_bac_binh ===
# ngay:1 # gio:16:00 # noi:chot_bao_ve
_Ngày Quốc tế Người cao tuổi. Cả công ty kéo xuống chòi bảo vệ, mang theo một cái bánh bông lan cắm đúng một cây nến._
bac_bao_ve: Thôi… các cháu bày vẽ làm gì. Bác ngại lắm.
_Bác {bac_bao_ve} đỏ mặt. {cho} sủa hai tiếng như phát biểu thay chủ._
* [🎤 Đứng ra phát biểu thay mặt công ty, 3 trang giấy.]
    ~ tp_hop(1)
    bac_bao_ve: Cháu {truong_phong} nói hay. Nhưng nến tắt rồi đấy.
    _Sáp nến chảy xuống bánh. Mọi người ăn bánh vị sáp._
    ~ qh("bac_bao_ve", 2)
* [😇 Ngồi xuống ghế nhựa, rót trà cho bác bằng tiếng Bắc: "Bác uống chén trà cho ấm ạ."]
    bac_bao_ve: Ừ. Lâu lắm mới có đứa nói "chén" mà không ai hỏi lại.
    ~ qh("bac_bao_ve", 10)
    ~ nghi(5)
    _Ở đây, bạn với bác nói chung một thứ tiếng. Cái chòi nhỏ bỗng giống Hà Nội một chút._
* [🐕 Đưa {cho} một miếng bánh.]
    cho: Gâu! *(nuốt chửng, vẫy đuôi)*
    ~ qh("cho", 8)
    bac_bao_ve: Nó nhớ mặt cháu rồi đấy. Nó nhớ dai lắm.
- -> END

// ------------------------------------------------------------
=== truong_phong_0210_hop_chien_dich ===
# ngay:2 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
~ tp_lich_co_dinh()
_Họp chiến dịch "Hồng Hóa Việt Nam". Mục tiêu: 1.000.000 người theo dõi trước 31/10. Bạn đã vẽ sẵn trên bảng trắng một sơ đồ 4 tầng, 3 màu bút, 1 ngôi sao vàng._
~ tp_hop(1)
truong_phong: Tầng 1 là MV. Tầng 2 là gameshow. Tầng 3 là livestream. Tầng 4 là… cảm xúc.
chua_te_deadline: *(giơ bảng tiến độ có đúng một thanh màu hồng)* Của tui nè anh. "31/10: làm hết."
thuc_tap_sinh: Dạ… em có một ý tưởng phim ngắn ạ. Về một người hùng không ai biết tên…
_{bien_kich} lặng lẽ cầm bút, ghi lại từng chữ._
* [📝 "Cái này mình take note lại, họp sau nhé."]
    ~ tp_so_lan_take_note = tp_so_lan_take_note + 1
    thuc_tap_sinh: Dạ… dạ em mới vô nên chưa biết ạ.
    ~ qh("thuc_tap_sinh", -3)
* [💬 "Hay đấy. {thuc_tap_sinh} kể tiếp đi, {bien_kich} ghi rõ là ý của {thuc_tap_sinh} nhé."]
    ~ qh("thuc_tap_sinh", 12)
    ~ qh("bien_kich", -5)
    bien_kich: *(khựng lại nửa giây)* Dạ… em ghi rồi anh.
    _Bạn không biết dòng chữ "ý của Duy" sẽ còn ở đó bao lâu._
* [⏰ Quay sang {chua_te_deadline}: "Cậu làm lại bảng tiến độ, có ngày, có người, có màu."]
    chua_te_deadline: Ok mom… à dạ, ok anh.
    ~ qh("chua_te_deadline", -5)
    ~ uy_tin = uy_tin + 3
- _Cửa mở. {con_ong_chau_cha} bước vào, trễ 40 phút, tay cầm ly cà phê._
con_ong_chau_cha: Mấy người họp gì mà căng vậy? Chill đi. Cho Siêu Nhân Hồng hát một bài là xong.
giam_doc: *(gật gù)* Ý tưởng trẻ! Anh thích cái mindset này.
_Cây bút lông trong tay bạn kêu "rắc" một tiếng nhỏ._
* [🪑 "Hát bài gì? Ai viết? Ai hát? Ngân sách bao nhiêu? Cậu có số liệu không?"]
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
    con_ong_chau_cha: Ủa… hỏi dồn dữ vậy ông.
    giam_doc: {truong_phong}, bình tĩnh. Anh không ép, tùy em.
    ~ tp_ghe(-2)
    ~ qh("con_ong_chau_cha", -10)
    _Lần đầu tiên {con_ong_chau_cha} không có câu trả lời. Bạn thắng. Nhưng {giam_doc} nhìn bạn hơi lâu._
* [🧱 Vẽ thêm tầng 5 lên sơ đồ: "Âm nhạc (phụ trách: {con_ong_chau_cha})".]
    con_ong_chau_cha: Ờ… tui ghi tên mình vô đó hả?
    giam_doc: Thấy chưa, phối hợp là đẹp!
    ~ tp_ghe(3)
    ~ qh("con_ong_chau_cha", 5)
    _{con_ong_chau_cha} nhìn cái ô có tên mình rất lâu, như nhìn một thứ lạ._
* [😶 Nhặt nửa cây bút gãy, cất vào túi.]
    ~ cang_thang(8)
    _Không ai thấy. Trừ {hong_hot}. {hong_hot} thấy hết._
    ~ qh("hong_hot", 2)
- -> END

// ------------------------------------------------------------
=== truong_phong_0210_cuoi_cham_cong ===
# ngay:2 # gio:07:55 # noi:sanh_tang_tret
_Ngày Nụ cười Thế giới. {hr} đứng cạnh máy chấm công, cầm một tấm bảng: "CƯỜI RỒI MỚI CHẤM"._
hr: Anh {truong_phong} ơi. Cười một cái cho hành trình hôm nay nha anh.
* [😁 Cười thật tươi.]
    hr: Đẹp quá anh. Em ghi nhận nụ cười đầu tiên của tuần.
    ~ qh("hr", 5)
    _Nụ cười của {hr} làm bạn muốn đi kiểm tra lại hợp đồng lao động._
* [📅 "Anh cười trong cuộc họp 8:30 nhé, giờ anh đang vội."]
    hr: Dạ. Em có mặt ở cuộc họp 8:30 luôn nha anh.
    ~ qh("hr", -3)
    _Hôm đó {hr} ngồi cuối phòng họp, cầm ly trà, nhìn bạn và mỉm cười suốt hai tiếng._
    ~ cang_thang(5)
* [💬 "Cười theo quy định thì có tính là cười không anh {hr}?"]
    hr: *(cười rộng hơn)* Mình cùng nhìn lại câu hỏi đó trong buổi trà chiều nay nha anh.
    ~ cang_thang(3)
    ~ qh("hr", 2)
- -> END

// ------------------------------------------------------------
=== truong_phong_0210_sync_linh ===
# ngay:2 # gio:15:05 # noi:phong_dung_phim
_Trà sữa thứ 6 về. Bạn cầm hai ly, gõ cửa phòng dựng tối như hang. Trên màn hình, một timeline dài ngoằng._
editor: *(ngáp)* Dạ anh {truong_phong}… có gì hông anh…
truong_phong: Sync nhanh 5 phút thôi. MV phải ra đúng 9/10. Em xem lịch giúp anh.
editor: 7 ngày. 7 đêm. Còn chưa có cảnh quay nào hết anh…
* [🤝 Đặt ly trà sữa lên bàn: "Anh dời họp giao ban sáng thứ Hai để em ngủ bù."]
    ~ qh("editor", 10)
    ~ nhan(tra_sua)
    editor: …Dạ. Lần đầu có người dời họp vì em.
    _Lĩnh cắm ống hút. Màn hình render nhảy lên 1%._
* [📅 "Mỗi sáng 8 giờ em báo cáo tiến độ ở phòng họp nhé."]
    ~ tp_hop(1)
    ~ qh("editor", -10)
    editor: 8 giờ… là lúc em mới đi ngủ anh…
    _Lĩnh gật đầu bằng cả cái đầu đang gục xuống bàn phím._
* [👀 Ngồi xuống cạnh, nhìn {editor} làm: "Cái nút này để làm gì thế?"]
    editor: Nút cắt anh. Phím C.
    ~ tp_tn(2)
    ~ qh("editor", 3)
    _Bạn ghi vào sổ: "Phím C: cắt". Đây là dòng kỹ thuật đầu tiên trong cuốn sổ toàn biên bản họp._
- -> END

// ------------------------------------------------------------
=== truong_phong_0310_bang_trang_nha ===
# ngay:3 # gio:20:00 # noi:can_501_pho_moi
_Thứ Bảy. Căn 501, chung cư mini Phố Mới. Phòng khách không có ti vi, chỉ có một cái bảng trắng to bằng cửa sổ._
_Trên bàn là "Đơn xin đề bạt Phó Giám đốc, bản 14". Bản 13 nằm trong sọt rác. Bản 12 dưới gầm giường._
* [✍️ Sửa thêm một bản nữa.]
    ~ tp_ban_nhap_so = tp_ban_nhap_so + 1
    _Bản 15. Bạn thêm chữ "tận tâm" vào đoạn hai, xóa chữ "tận tâm" ở đoạn ba. Nhìn lại, vẫn như bản 14._
    ~ cang_thang(5)
* [🧱 Vẽ lên bảng: "Long" ở bên trái, "Nhật" ở bên phải, kẻ hai cột ưu và nhược.]
    _Cột "Long – ưu": cháu sếp. Cột "Long – nhược": đi trễ, ít họp, hay nói "chill"._
    _Bạn nhìn cột "Nhật – ưu" rất lâu. Bạn viết: "họp nhiều". Rồi bạn không chắc đó là ưu hay nhược._
    ~ cang_thang(3)
* [🌙 Mở video hướng dẫn dựng phim trên Diu-túp, kênh có hình con cú.]
    _Kênh "Cú Đêm Cắt Ghép", gần 1 triệu người đăng ký. Giọng người hướng dẫn nhỏ, ngái ngủ, cứ nói "render xong là xong"._
    _Nghe quen quen. Bạn không nghĩ thêm._
    ~ tp_tn(3)
    ~ nghi(-10)
- _Đồng hồ chỉ 11 giờ đêm. Group công ty sáng lên: {giam_doc} nhắn "Mai chủ nhật, các em nghỉ ngơi nhé. Anh không ép."_
_Bạn trả lời "Dạ vâng anh" trong 4 giây. Rồi mở slide họp thứ Hai._
-> END

// ------------------------------------------------------------
=== truong_phong_0410_chu_nhat_cong_ty ===
# ngay:4 # gio:09:30 # noi:cong_cong_ty
_Chủ nhật, Ngày Động vật Thế giới. Bạn tới công ty để làm slide họp thứ Hai. Cổng mở một nửa._
_{cho} đứng giữa sân, mặc áo kẻ sọc, đội nơ hồng, lông còn ướt. Vẻ mặt của một con chó vừa bị xúc phạm sâu sắc._
chi_dai: Đứng yên! Tắm xong rồi mà còn quẫy nữa là chị cột nơ thêm cái nữa nghe!
bac_bao_ve: *(ngồi trong chòi, rót trà)* Chủ nhật cũng đi làm à. Thế thì ai ở nhà?
_Câu hỏi rơi xuống như một viên sỏi. Bạn không có câu trả lời._
* [😶 "Nhà cháu… có cái bảng trắng ạ."]
    bac_bao_ve: Ừ. Bảng trắng thì không đợi cơm.
    ~ qh("bac_bao_ve", 5)
    ~ cang_thang(5)
    _Cả buổi sáng, bạn làm slide mà câu hỏi đó cứ nằm ở góc màn hình._
* [😇 Ngồi xuống uống với bác một chén trà, để slide đó.]
    ~ qh("bac_bao_ve", 10)
    ~ nghi(10)
    ~ cang_thang(-10)
    bac_bao_ve: Thấy chưa. Slide nó vẫn ở đấy. Không chạy đi đâu.
* [📅 "Dạ, cháu chỉ ghé 5 phút thôi ạ."]
    bac_bao_ve: Ừ. Thế 5 giờ chiều bác khóa cổng nhé.
    _Bác không hỏi sao 5 phút lại thành 5 tiếng. Bác đã thấy nhiều cái "5 phút" ở cái công ty này rồi._
- _Một chiếc xe màu hồng phanh trước cổng. {sieu_nhan_hong} nhảy xuống, giả tiếng sủa "Gâu gâu!" với {cho}._
cho: GRỪ… GÂU GÂU GÂU!
_{cho} lao tới, ngoạm mất chiếc găng tay hồng, chạy biến vào gầm cầu thang._
sieu_nhan_hong: Ê ê! Găng tay của anh! Cái đó đặt may đó!
* [🤝 "Anh {sieu_nhan_hong} đừng lo, em lập biên bản sự việc ngay."]
    ~ tp_hop(1)
    sieu_nhan_hong: Biên bản… cho con chó hả em? Em dễ thương ghê.
    ~ qh("sieu_nhan_hong", 3)
    ~ qh("cho", -3)
* [😄 Bật cười.]
    sieu_nhan_hong: Cười gì! Nó ghét anh vậy đó. Mà anh đâu có làm gì đâu!
    chi_dai: Ông chọc nó hoài, nó hông ghét mới lạ.
    ~ qh("cho", 5)
    ~ qh("chi_dai", 3)
* [📸 Quay lại cảnh này: "Clip này đăng Tóp-tóp được đấy."]
    ~ follow(3000)
    sieu_nhan_hong: Đăng đi! Vì công lý và lượt view!
    ~ tp_so_video_toptop = tp_so_video_toptop + 1
    _Clip "Chó công ty cướp găng tay siêu nhân" được 3.000 lượt thích trước bữa trưa._
- -> END
