// ============================================================
// THÁNH HÓNG: NGÂN · CHƯƠNG 1: "BIẾN CĂNG NGÀY ĐẦU" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== hong_hot_0110_tre_5_phut ===
# ngay:1 # gio:08:05 # noi:may_cham_cong # bat_buoc
_8 giờ 05. Bạn phóng vào sảnh, ba cái điện thoại trên tay, cái nào cũng đang sáng. Trễ 5 phút. Như mọi ngày._
_{hr} đứng cạnh máy chấm công, mỉm cười, cầm sổ._
hr: Em {hong_hot}. 8 giờ 05. Năm mươi nghìn vào quỹ trà sữa nha em. Anh chỉ ghi nhận thôi.
* [😇 "Dạ em nộp. Coi như em mời cả công ty trà sữa thứ 6."]
    ~ tien_cong(-50000)
    ~ qh("hr", 2)
    hr: Em hào phóng ghê. Tháng này em mời được 22 ly rồi đó.
* [👀 "Anh {hr} ơi, nghe gì chưa? Bữa nay ký hợp đồng 5 tỷ đó!"]
    ~ tien_cong(-50000)
    hr: Anh biết. Anh là HR mà.
    _{hr} vẫn ghi tên bạn vào sổ. Nhưng có vẻ hơi tò mò bạn biết từ đâu._
    ~ hh_tin(1)
* [📱 Giơ điện thoại lên: "Em đang live nè anh, anh chào khán giả đi!"]
    hr: *(nụ cười cứng lại 0,5 giây, rồi giãn ra)* Chào các bạn. Đi làm đúng giờ nha các bạn.
    ~ tien_cong(-50000)
    ~ hh_tt(2)
- _Máy pha cà phê tầng 1 kêu "rè rè" rồi tắt ngúm. Hôm nay là Ngày Cà phê Quốc tế. Bạn chụp lại, chú thích: "Máy cà phê cũng biết hôm nay là ngày của nó, nên nó nghỉ."_
-> END

// ------------------------------------------------------------
=== hong_hot_0110_live_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp "Sáng Tạo". Bạn đang livestream lễ ký hợp đồng lên fanpage công ty. 🔴 LIVE · 312 người xem. Trong đó 40 người là nhân viên công ty, và mẹ của họ._
sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ! *(tạo dáng)*
giam_doc: Các em! Hôm nay là một ngày lịch sử của {cong_ty}!
_Đúng lúc sếp cầm bút, {ke_toan} cúi sát tai sếp. Micro điện thoại của bạn bắt được tiếng thì thầm: "…anh đọc giúp em trang 47…"_
* [🎚️ Tắt tiếng live 3 giây, giả vờ "mạng lag".]
    _Bình luận: "Ủa mất tiếng?", "Lag quá ad ơi". Không ai nghe được gì._
    ~ hh_tin(1)
    ~ hh_so_live_sach = hh_so_live_sach + 1
    _Riêng bạn thì nghe rõ. "Trang 47". Nghe như tên một bộ phim kinh dị._
* [🎥 Giữ nguyên, zoom vào chữ ký của sếp cho hoành tráng.]
    _Không ai trong 312 người xem để ý câu thì thầm. Trừ một tài khoản tên "Lá Chuối Xanh 2018" thả biểu tượng 🤔._
    ~ hh_tt(3)
    ~ hh_tin(1)
* [📸 Lia máy sang {sieu_nhan_hong} đang tạo dáng.]
    sieu_nhan_hong: Chào các bạn! Gét gô!
    ~ hh_tt(5)
    ~ hh_follow(2000)
    ~ qh("sieu_nhan_hong", 5)
- _Sếp ký. 5 tỷ về tài khoản. Cả phòng reo hò. Bình luận: "Chúc mừng công ty!", "Siêu nhân gì mà hồng vậy?", "Mẹ thấy con rồi nha!"._
~ hh_follow(1000)
-> END

// ------------------------------------------------------------
=== hong_hot_0110_tra_sua ===
# ngay:1 # gio:11:00 # noi:khu_lam_viec_chung
_Cả công ty ăn mừng bằng trà sữa. Hôm nay còn là Ngày Quốc tế Người cao tuổi, nên mọi người kéo xuống chòi bảo vệ chúc mừng Bác {bac_bao_ve}. Bác ngại đỏ mặt._
bac_bao_ve: Thôi… thôi các cháu. Bác có già lắm đâu.
* [🎥 Quay clip "Bác bảo vệ được cả công ty chúc mừng", đăng Tóp-tóp.]
    ~ hh_follow(3000)
    ~ hh_tt(3)
    bac_bao_ve: Ơ, đừng quay bác…
    ~ qh("bac_bao_ve", -2)
    _Clip được 20.000 lượt xem. Bình luận nhiều nhất: "Bác giống ông nội tui quá"._
* [🧋 Đưa bác ly trà sữa phần mình.]
    ~ qh("bac_bao_ve", 8)
    bac_bao_ve: Cảm ơn cháu. Bác uống trà đá quen rồi, nhưng… ừ, thử xem nào.
    _{cho} ngửi ly trà sữa, hắt hơi._
* [👀 Ngồi cạnh {designer}: "Bà ơi, nghe gì chưa? Trang 47 đó."]
    { hh_kho_tin >= 1:
        designer: Trang 47 gì? Poster tui có 3 trang thôi.
        ~ hh_ke_tin()
        ~ qh("designer", 3)
    - else:
        designer: Gì? Bà nói gì vậy?
    }
- ~ uong(30)
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== hong_hot_0110_hang_xom_moi ===
# ngay:1 # gio:19:30 # noi:hem_69 # bat_buoc
_Hẻm 69. Dãy A. Bạn ôm ring light về phòng 5 thì thấy cửa phòng 3 kế bên mở. Có người mới dọn vào._
ran_doc: *(đứng ở cửa phòng 3, cười)* Ủa, bà là {hong_hot} bên mạng xã hội đúng hông? Trời, mình ở sát vách luôn nè.
_Nhân viên mới. Ngày đầu tiên. Sát vách. Bạn nghe thấy mùi drama._
* [👀 "Ét o ét! Hàng xóm hóng chung! Nghe gì chưa, anh {truong_phong} hôm nay họp 4 tiếng đó!"]
    ~ qh("ran_doc", 15)
    ~ hh_ke_tin()
    ran_doc: Bốn tiếng hả? Trời. Bà kể thêm đi, tui mới vô chưa biết gì hết.
    _{ran_doc} cười rất hiền. Bạn kể thêm 40 phút. Bạn không để ý {ran_doc} nghe mà không hỏi lại câu nào, như đang ghi nhớ._
* [🤝 "Ừa, có gì cần mượn đồ thì gõ tường nha."]
    ~ qh("ran_doc", 5)
    ~ hh_go_tuong = true
    ran_doc: Gõ ba cái là "có chuyện", gõ hai cái là "mượn mì gói" nha.
    _Bức tường giữa phòng 3 và phòng 5 mỏng như tờ lịch._
* [🧐 "Mà sao phòng ông sạch dữ vậy? Đáng nghi à nha."]
    ran_doc: *(cười gượng)* Tui… sạch sẽ thôi mà.
    ~ hh_tin(1)
    _Trên bàn phòng 3 có một cuốn sổ tay. {ran_doc} đứng chắn đúng trước nó._
- _Bà Tư chủ trọ ngồi quạt nan đầu dãy, nghe hết._
ba_tu: Nay mùng mấy rồi con? Mùng 1 hả. Mùng 5 nộp tiền trọ nha hai đứa.
-> END

// ------------------------------------------------------------
=== hong_hot_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_tang_2 # bat_buoc
_Họp lên chiến dịch "Hồng Hóa Việt Nam". Sếp đứng trước slide, tay chỉ con số to tướng: 1.000.000._
giam_doc: Mục tiêu: một triệu người theo dõi trước 31/10. {hong_hot} lo fanpage nhé. Anh không ép, tùy em.
_Không ai hỏi ý bạn. Bạn tính nhẩm: 1.000.000 trừ 5.000, chia 29 ngày. Mỗi ngày 33.000 người._
* [😱 "Ối dồi ôi." *(nói to hơn mình tưởng)*]
    giam_doc: Em nói gì?
    _Cả phòng cười. {chua_te_deadline} gật gù: "Còn sớm mà"._
    ~ qh("giam_doc", -2)
    ~ qh("chua_te_deadline", 3)
* [📊 "Dạ anh, mỗi ngày 33.000 người. Em cần ngân sách quảng cáo với một người đăng bài phụ."]
    giam_doc: Ngân sách thì… để {thanh_ninh} trình. Người phụ thì… em có {ran_doc} đấy.
    ~ uy_tin = uy_tin + 3
    ~ hh_tt(2)
* [😶 Mở Tóp-tóp xem trend đang lên.]
    _Trend hôm nay: "Một ngày làm văn phòng mà sếp hông biết". Bạn bấm lưu._
    ~ hh_tt(1)
- sales: Mọi người yên tâm! Chị chốt rồi: 3 nhà tài trợ, 2 tỷ, Tập đoàn Bánh Tráng Trộn Toàn Cầu, BTT Global. Chủ tịch là Mr. Kevin Trộn. Tin chị đi, deal này chắc kèo!
* [🔍 Mở điện thoại tìm "BTT Global" ngay dưới gầm bàn.]
    _Kết quả: một trang web làm bằng mẫu miễn phí, logo là cái bánh tráng xoay xoay, số điện thoại là số của {sales}._
    ~ phat_hien(btt_global_gia)
    ~ hh_tin(1)
* [👏 Vỗ tay theo cả phòng.]
    ~ qh("sales", 3)
- _Ngồi cạnh, {thuc_tap_sinh} đang kể {bien_kich} nghe một ý tưởng phim về một người gác két. {bien_kich} ghi chép rất nhanh._
-> END

// ------------------------------------------------------------
=== hong_hot_0210_cham_cong_cuoi ===
# ngay:2 # gio:08:05 # noi:may_cham_cong
_Ngày Nụ cười Thế giới. {hr} bắt mọi người cười khi chấm công. Bạn trễ 5 phút, lại. Nhưng bạn có ý tưởng._
* [🎬 Quay series "Nụ cười chấm công": từng người cười trước máy.]
    _Nụ cười chuẩn 8 răng của {thanh_ninh}. Nụ cười đi phỏng vấn ngân hàng của {thuc_tap_sinh}. Nụ cười làm người ta sợ của {hr}._
    ~ hh_follow(4000)
    ~ hh_tt(4)
    ~ qh("thanh_ninh", 3)
    ~ qh("thuc_tap_sinh", 3)
* [😇 Cười thật, chấm công, nộp 50.000đ.]
    ~ tien_cong(-50000)
    hr: Nụ cười trễ 5 phút, đẹp. Ghi nhận.
- -> END

// ------------------------------------------------------------
=== hong_hot_0210_toi_len_bai ===
# ngay:2 # gio:19:30 # noi:nha_hong_hot
_Phòng 5, dãy A. Ring light bật. Ba điện thoại xếp hàng. 19:30, giờ vàng bắt đầu._
* [📱 Lên bài giờ vàng. (Minigame "Lên Bài Giờ Vàng")]
    -> hong_hot_mg_gio_vang
* [😴 Đăng đại một tấm ảnh rồi đi ngủ.]
    ~ hh_follow(1000)
    ~ hh_chuoi_gio_vang = 0
    ~ nghi(20)
    -> END

// ------------------------------------------------------------
=== hong_hot_0310_ap_tai ===
# ngay:3 # gio:21:00 # noi:nha_hong_hot
_Thứ 7. Hẻm 69. Chú Sáu karaoke chưa bắt đầu hát. Hẻm yên tới mức bạn nghe được tiếng bút bi sột soạt từ phòng 3 bên kia vách._
_{ran_doc} đang viết. Viết rất lâu. Thỉnh thoảng lật trang._
* [🧱 Áp tai vào tường.]
    _"…{hong_hot}… fanpage… 29 tuổi… kể chuyện không giữ được quá 2 tiếng…"_
    _Bạn nghe thấy tên mình. Bạn ngồi bật dậy._
    ~ hh_tin(2)
* {hh_go_tuong} [🔒 🤝 Gõ ba cái: "có chuyện".]
    ran_doc: *(vọng qua tường)* Gì đó bà?
    hong_hot: Ông viết gì mà sột soạt hoài vậy? Viết nhật ký hả?
    ran_doc: Tui… viết bản tin nội bộ. Công việc thôi.
    _Bản tin nội bộ ra thứ 2. Hôm nay mới thứ 7._
    ~ hh_tin(1)
    ~ qh("ran_doc", 2)
* [🎧 Đeo tai nghe, lướt Tóp-tóp tìm trend cho tuần sau.]
    ~ hh_tt(3)
    ~ cang_thang(-5)
    _Trend mới: "chó công sở". Bạn nghĩ ngay tới một con chó ghét màu hồng._
- ba_tu: *(dưới hẻm, nói vọng lên)* Hai đứa trên đó nói chuyện qua tường hoài, sao hông qua phòng nhau cho rồi!
_Cả hẻm cười. Bà Tư chủ trọ là Thánh Hóng phiên bản ngoài đời._
-> END

// ------------------------------------------------------------
=== hong_hot_0410_tuat_doi_no ===
# ngay:4 # gio:10:00 # noi:san_cong_ty # bat_buoc
_Chủ nhật, Ngày Động vật Thế giới. {chi_dai} vừa tắm cho {cho}, người duy nhất {cho} cho tắm. Bạn mặc cho nó áo hồng, đội nơ hồng. {cho} rất không vui._
_{sieu_nhan_hong} tới, giả tiếng sủa, giấu con gà cao su của {cho} sau lưng._
sieu_nhan_hong: Gâu gâu! {cho} ơi, gà đâu rồi? Hehe!
cho: GRỪ! *(giật đứt dây nơ, lao tới)*
_{cho} đuổi {sieu_nhan_hong} ba vòng quanh sân, ngoạm được chiếc găng tay hồng, chạy mất xuống gầm cầu thang. Bạn quay được hết, 4K._
* [🔥 Đăng nguyên clip, caption: "Ai mới là idol thật của công ty?"]
    ~ hh_follow(40000)
    ~ hh_tuat_noi_hon_nguyen = true
    ~ hh_tt(10)
    _Clip lên xu hướng trong 3 tiếng. 30% người theo dõi mới là fan của {cho}. Hashtag \#{cho}VàHồng xuất hiện._
    ~ qh("sieu_nhan_hong", -5)
    ~ qh("cho", 5)
* [✂️ Cắt đoạn {cho} cắn găng, chỉ giữ cảnh rượt đuổi dễ thương.]
    ~ hh_follow(20000)
    ~ hh_tt(5)
    _Clip dễ thương, an toàn. Bình luận: "Siêu nhân chạy cũng có thái độ ghê"._
    ~ qh("sieu_nhan_hong", 3)
* [😶 Không đăng. Gửi riêng cho {sieu_nhan_hong} xem.]
    sieu_nhan_hong: *(xem xong)* Hehe… mà nó ghét anh thiệt hả em? Anh chỉ giỡn thôi mà…
    _Dưới chiếc mũ, giọng {sieu_nhan_hong} nhỏ hẳn đi._
    ~ qh("sieu_nhan_hong", 8)
- _Ở sau tủ mạng, {sieu_nhan_hong} lén giấu con gà cao su của {cho}. Bạn thấy. Bạn ghi vào ghi chú: "Gà cao su: sau tủ mạng"._
~ hh_tin(1)
-> END

// ------------------------------------------------------------
=== hong_hot_0410_toi_tuong_tac ===
# ngay:4 # gio:21:30 # noi:nha_hong_hot
_Tối Chủ nhật. Bạn ngồi đếm. Con số trên fanpage: {nguoi_theo_doi}. Phần bạn góp: {hh_dong_gop}._
{ hh_tuat_noi_hon_nguyen:
    _Bình luận được thích nhiều nhất trên trang không nói về {sieu_nhan_hong}. Nó nói: "Cho xin thêm clip con chó!"_
}
* [📱 Lên bài giờ vàng thêm lần nữa.]
    -> hong_hot_mg_gio_vang
* [💬 Ngồi trả lời bình luận tới khuya. (Minigame "Trực Comment")]
    -> hong_hot_mg_truc_comment
* [😴 Đi ngủ.]
    ~ nghi(25)
    ~ hh_chuoi_gio_vang = 0
    -> END
