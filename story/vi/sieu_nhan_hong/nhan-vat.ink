// ============================================================
// HỘI THOẠI TỰ DO CỦA SIÊU NHÂN HỒNG VỚI 22 NHÂN VẬT
// Mỗi cảnh mở khi người chơi bắt chuyện với NPC đó (thẻ npc:<mã>).
// 🦸 = đang mặc đồ, 🙂 = đã tháo mũ / nói thật lòng.
// ============================================================

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_ran_doc ===
# npc:ran_doc # noi:ban_lam_viec
ran_doc: *(cười rất ngọt)* Dạ anh cần gì ạ? Em làm truyền thông nội bộ, có gì cần đưa lên bản tin anh cứ nói.
* [🦸 "Đưa lên bản tin: Siêu Nhân Hồng yêu cả công ty!"]
    ran_doc: Dạ. Em ghi rồi. *(gõ phím, không nhìn bạn)*
    ~ snh_hieu(2)
* [🙂 "Em ăn trưa chưa? Đi ăn cơm tấm với anh hông?"]
    ran_doc: *(khựng lại)* …Em ăn rồi.
    { snh_mo_nhanh_hieu_ech:
        ran_doc: Mà… mai thì chưa ăn.
        ~ snh_hieu(-5)
    }
* [🐕 Giả tiếng ếch: "Ộp ộp!"]
    ran_doc: *(quay phắt lại, mặt trắng bệch)* Anh… anh vừa làm gì?
    _Bạn không biết vì sao cậu ta phản ứng như vậy. Bạn chỉ đùa như hồi nhỏ vẫn đùa._
    ~ snh_hieu(15)
    ~ snh_no(5)
* -> sieu_nhan_hong_tudo_het_chuyen
- ran_doc: Mà anh nè. Hồi nhỏ anh có hay chơi trốn tìm hông?
* [🙂 "Có. Anh hay làm người đi tìm. Mà có lần anh… quên đi tìm."]
    ran_doc: *(nhìn bạn rất lâu)* Quên hả anh.
    ~ snh_no(3)
    ~ snh_hieu(-3)
* [🦸 "Siêu nhân thì không trốn! Siêu nhân đi cứu người!"]
    ran_doc: Dạ. Cứu người. *(cười, mắt không cười)*
    ~ snh_hieu(3)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_giam_doc ===
# npc:giam_doc # noi:phong_giam_doc
giam_doc: À, em {sieu_nhan_hong}! Vào đây, vào đây. Đối tác chiến lược của anh! Em uống gì? Trà, cà phê, hay… nước hồng?
* [🦸 "Nước hồng! Hồng là thái độ!"]
    giam_doc: Đúng rồi! Đấy là mindset! *(rót nước ép hồng)*
    ~ uong(30)
    ~ qh("giam_doc", 3)
* [🙂 "Dạ anh ơi, anh ngủ được hông? Mắt anh thâm quá."]
    giam_doc: *(cười gượng)* Anh… anh ổn. Doanh nhân thì ngủ ít. Anh không ép mình, tùy mình… mà thôi.
    ~ qh("giam_doc", 8)
* -> sieu_nhan_hong_tudo_het_chuyen
- giam_doc: Em ơi, nói thật với anh. Một triệu người theo dõi… em thấy có kịp không?
* [🦸 "Kịp hết! Gét gô!"]
    giam_doc: Ừ! Đấy! Anh tin em!
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
* [🙂 "Em hông biết anh ơi. Mà em sẽ cố hết sức. Em hứa."]
    giam_doc: *(im lặng)* …Cảm ơn em đã nói thật. Ở đây ít ai nói thật với anh.
    ~ qh("giam_doc", 8)
* {snh_biet_trang_47} [🔒 "Anh có đọc trang 47 chưa anh?"]
    giam_doc: Trang… 47? *(mặt tái dần)* Có gì ở trang 47?
    _Bạn kể. {giam_doc} ngồi im, tay nắm chặt tay ghế._
    giam_doc: Anh… anh ký mà không đọc. Mười sáu năm làm giám đốc, anh ký mà không đọc.
    ~ qh("giam_doc", 5)
    ~ cang_thang(5)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_truong_phong ===
# npc:truong_phong # noi:phong_hop_sang_tao
truong_phong: Anh {sieu_nhan_hong}! Đúng lúc. Mình sync nhanh 5 phút về lịch quay tuần sau nhé.
* [🦸 "5 phút thôi nha! Siêu nhân bận cứu thế giới!"]
    truong_phong: Ừ, 5 phút thôi. *(mở slide 1 trên 42)*
    ~ cang_thang(5)
    ~ qh("truong_phong", 3)
* [🙂 "Dạ… anh ơi, mình họp đứng được hông? Họp đứng nhanh hơn."]
    truong_phong: Họp… đứng? *(suy nghĩ)* Cái này hay đấy. Tớ… à anh sẽ họp một buổi để bàn về việc họp đứng.
    ~ qh("truong_phong", 5)
* -> sieu_nhan_hong_tudo_het_chuyen
- truong_phong: Mà anh nói thật nhé, anh rất cần chiến dịch này thành công. Ghế Phó Giám đốc… à không, công ty cần.
* [🤝 "Em giúp anh. Anh cần em quay thêm buổi nào cứ nói."]
    truong_phong: Thật à? Cảm ơn anh. Anh là đối tác dễ làm việc nhất từ trước tới giờ. *(mà cũng là đối tác duy nhất)*
    ~ qh("truong_phong", 10)
* [💬 "Clip hậu trường tuần trước đẹp ghê. Anh dựng hả?"]
    truong_phong: Ờ… anh với {editor}… cùng làm. Chủ yếu là… ý tưởng của anh.
    _Bạn nhìn sang phòng dựng phim. Đèn sáng từ 3 giờ sáng tới giờ._
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_thanh_ninh ===
# npc:thanh_ninh # noi:ban_tro_ly
thanh_ninh: Dạ anh {sieu_nhan_hong}! Bộ đồ hôm nay của anh hồng chuẩn quá anh ơi! Hồng có tâm!
* [🦸 "Cảm ơn em! Hồng là thái độ!"]
    thanh_ninh: Anh nói chuẩn quá anh ơi! *(ghi vào sổ tay câu này để dùng với sếp)*
    ~ qh("thanh_ninh", 5)
* [🙂 "Hôm qua anh mặc bộ y chang mà."]
    thanh_ninh: *(khựng lại)* Dạ… hôm qua cũng chuẩn ạ. Ngày nào cũng chuẩn.
    ~ qh("thanh_ninh", 2)
* -> sieu_nhan_hong_tudo_het_chuyen
- thanh_ninh: Mà anh ơi, nếu… nếu có công ty nào khác mời anh, anh có đi không ạ? Em hỏi vu vơ thôi.
* [🦸 "Không bao giờ! Siêu nhân không bỏ đồng đội!"]
    thanh_ninh: *(cười hơi méo)* Dạ… anh trung thành ghê.
* [🙂 "Sao em hỏi vậy? Em có ai mời hả?"]
    thanh_ninh: *(mặt trắng bệch)* Dạ không! Em trung thành với anh {giam_doc} tuyệt đối ạ!
    _Cô ta liếc chiếc túi tote xanh lá chuối dưới gầm bàn, đẩy nó vào sâu hơn._
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_hong_hot ===
# npc:hong_hot # noi:ban_mang_xa_hoi
hong_hot: Anh ơi! Nghe gì chưa? Fanpage anh vừa có bình luận lạ lắm: "Siêu Nhân Hồng là tỷ phú bí ẩn". Ối dồi ôi, thật hông anh?
* [🦸 "Tỷ phú… thái độ! Haha!"]
    hong_hot: Né khéo ghê! Mà tui hóng lắm á.
    ~ snh_tien(2)
* [🙂 "Em đừng đăng mấy cái đó nha. Anh xin em."]
    hong_hot: *(nhìn bạn)* Anh nói nghiêm túc hả? …Ok. Tui ẩn bình luận đó. Mà anh nợ tui một ly trà sữa.
    ~ qh("hong_hot", 5)
    ~ snh_tien(-3)
* -> sieu_nhan_hong_tudo_het_chuyen
- hong_hot: Mà nè, tối nay livestream thêm một buổi nha anh? Tui có ý tưởng: anh đọc bình luận ác ý rồi trả lời dễ thương.
* [🤝 "Ok! Gét gô!"]
    ~ follow(5000)
    ~ qh("hong_hot", 5)
    hong_hot: Đỉnh nóc! Anh dễ thương nhất công ty luôn á.
* [💬 "Em làm admin fanpage, có bao giờ em… đăng gì ẩn danh hông?"]
    hong_hot: *(đứng hình 2 giây)* Ủa alo? Anh hỏi gì kỳ vậy? Tui… tui đi lấy nước.
    ~ phat_hien(admin_confession)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha # noi:ca_phe_song_ao
con_ong_chau_cha: Ê anh. Ngồi đi. Chill. Ly này 85 nghìn, em bao. À mà anh giàu hơn em, thôi anh bao.
* [💸 "Ok, anh bao cả quán luôn!"]
    ~ snh_ket(5)
    con_ong_chau_cha: *(nhìn bạn)* Ủa… anh bao thiệt hả? Anh lấy tiền đâu dữ vậy? Chú em còn không dám.
* [🙂 "Mỗi người tự trả ly của mình. Vậy cho vui."]
    con_ong_chau_cha: *(cười to)* Lần đầu có người nói vậy với em. Hay ghê. Ok.
    ~ qh("con_ong_chau_cha", 10)
* -> sieu_nhan_hong_tudo_het_chuyen
- _Trên màn hình điện thoại cậu ta là một file nhạc tên "HLTD_demo41"._
* [💬 "File gì vậy em? Nghe thử được hông?"]
    con_ong_chau_cha: Không… không có gì. Nhạc… nhạc của bạn em. Nghệ danh "Rồng".
    _Cậu ta bấm nghe 5 giây rồi tắt. Giai điệu bắt tai. Có chữ "hồng" và chữ "thái độ"._
    ~ phat_hien(bai_hat_long)
    * * [🙂 "Nếu bạn em cho, anh muốn hát bài đó ở Đêm Hồng."]
        con_ong_chau_cha: *(nhìn bạn rất lâu)* …Để em hỏi "bạn em". Chắc… bạn em vui lắm.
        ~ qh("con_ong_chau_cha", 20)
    * * [🦸 "Hay đó! Mà bài của anh là bài hay nhất!"]
        con_ong_chau_cha: Ờ. Chắc vậy. *(cất điện thoại)*
        ~ qh("con_ong_chau_cha", -5)
    * * -> sieu_nhan_hong_tudo_het_chuyen
* [😶 Không hỏi.]
    _Cậu ta cất điện thoại. Hai người uống cà phê, nhìn ra đường. Hai người giàu, không biết làm gì với tiền._
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_chua_te_deadline ===
# npc:chua_te_deadline # noi:ban_lam_viec
chua_te_deadline: *(lướt Tóp-tóp)* Ủa anh. Gì đó? Còn sớm mà.
* [🦸 "Biến hình! Anh tới giúp em chạy deadline!"]
    chua_te_deadline: Deadline còn 3 ngày lận anh. Ngày thứ 3 mới chạy. Chill.
    ~ snh_tim(1)
* [🙂 Kéo ghế ngồi cạnh, cũng lướt điện thoại.]
    chua_te_deadline: *(chìa màn hình)* Coi nè anh. Con chó té xuống hồ. Giống con Tuất ghê.
    _Hai người ngồi lướt clip chó mèo 20 phút. Không ai nói gì quan trọng. Đó là 20 phút quan trọng nhất trong ngày._
    ~ snh_tim(4)
* {snh_tim_hong >= 40} [🙂 Tháo mũ, ngồi xuống: "Hôm nay anh mệt. Ngồi đây chút nha."]
    ~ snh_thao_mu(true)
    chua_te_deadline: *(liếc quanh xem có ai, rồi đẩy nửa ly trà sữa qua)* Uống đi anh. Em uống hông hết.
    ~ snh_tim(6)
    ~ uong(15)
* -> sieu_nhan_hong_tudo_het_chuyen
- chua_te_deadline: Mà nè anh. Quà hồng của anh… em để hết trên bàn đó. Thái nói anh tặng để có content hả?
* [🙂 "Hông phải. Anh tặng vì anh muốn tặng."]
    { snh_tim_hong >= 60:
        chua_te_deadline: *(ngừng lướt)* …Ừ. Em bắt đầu thấy vậy.
        ~ snh_tim(5)
    - else:
        chua_te_deadline: Ok ok. Em hiểu mà. *(lướt tiếp)* Content xịn.
    }
* [🦸 "Content cũng được! Hồng là thái độ!"]
    chua_te_deadline: Thấy chưa. Biết ngay.
    ~ snh_tim(-3)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh # noi:pantry
thuc_tap_sinh: Dạ anh {sieu_nhan_hong} uống cà phê không ạ? Em pha liền ạ! Ít đường, nhiều đường, hay… hồng ạ?
* [🦸 "Cà phê hồng! Có hông em?"]
    thuc_tap_sinh: Dạ… em thêm siro dâu được ạ! *(pha thật)*
    _Cà phê siro dâu. Kinh khủng. Bạn uống hết vì cậu ta đứng nhìn, mắt long lanh._
    ~ uong(10)
    ~ qh("thuc_tap_sinh", 5)
* [🙂 "Em ngồi đi. Để anh pha cho em."]
    thuc_tap_sinh: Dạ… dạ không được ạ! Em là thực tập sinh mà!
    _Bạn pha. Cậu ta cầm ly cà phê bằng hai tay, như cầm giấy khen._
    ~ qh("thuc_tap_sinh", 10)
* -> sieu_nhan_hong_tudo_het_chuyen
- thuc_tap_sinh: Dạ anh ơi… em hỏi cái này hơi kỳ ạ. Anh có bao giờ sợ người ta biết mình… có tiền không ạ?
* [🙂 "Có. Sợ lắm. Người ta sẽ chỉ nhìn mình như cái máy ATM."]
    thuc_tap_sinh: *(mắt đỏ hoe)* Dạ… em cũng vậy ạ. Em… à không, em nói chơi thôi ạ.
    ~ qh("thuc_tap_sinh", 15)
    ~ phat_hien(duy_tung_lam_ngan_hang)
* [🦸 "Siêu nhân không sợ gì hết!"]
    thuc_tap_sinh: Dạ… anh giỏi quá ạ. *(cười, mà hơi buồn)*
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_ke_toan ===
# npc:ke_toan # noi:phong_ke_toan
ke_toan: Anh {sieu_nhan_hong}. Ngồi đi. Hóa đơn đâu anh? *(rồi nhớ ra)* À, anh là đối tác. Anh trả tiền, không xin tiền.
* [🙂 "Chị ơi, chị ngủ được hông? Em thấy chị mệt."]
    ke_toan: Tôi ngủ đủ… khi nào sổ sách khớp. Tức là chưa bao giờ.
    ~ qh("ke_toan", 5)
* [💸 "Chị cần tiền gì cứ nói em, em lo."]
    ke_toan: *(đặt bút xuống)* Anh nói câu đó nhiều lần quá. Một người bình thường không nói câu đó.
    ~ snh_tien(5)
    ke_toan: Tôi không hỏi anh tiền đâu ra. Nhưng đoàn thuế sẽ hỏi. Anh chuẩn bị đi.
* -> sieu_nhan_hong_tudo_het_chuyen
- ke_toan: Nếu anh có gì cần tôi xoay giúp trên sổ sách… thì nói sớm. Đừng để nước tới chân.
* [🙂 "Chị ơi… tiền của em là tiền vé số. Năm 2019."]
    ke_toan: *(im lặng rất lâu)* …Hợp pháp?
    sieu_nhan_hong: Dạ. Đóng thuế đủ.
    ke_toan: Vậy thì tôi lo được. Anh đừng kể ai nữa. Kể một người là một người. Kể hai người là cả quận.
    ~ phat_hien(ve_so_nguyen)
    ~ snh_tien(-10)
    ~ qh("ke_toan", 15)
* [😶 "Dạ em cảm ơn chị."]
    ke_toan: Ừ. Đi đi. Đừng làm rơi bánh chuối chiên trong phòng tôi.
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_hr ===
# npc:hr # noi:phong_hr
hr: Anh {sieu_nhan_hong}! Anh rảnh không, lên phòng em uống trà xíu. Không có gì đâu, em chỉ muốn lắng nghe anh thôi.
_Phòng HR. Kệ trà 40 loại. {hr} rót trà, cười._
* [🦸 "Trà hồng có hông em?"]
    hr: Trà hoa hồng. Số 31. Em pha cho người em quý. *(cười rộng hơn)*
    ~ uong(15)
    ~ qh("hr", 5)
* [🙂 "Em cười hoài hông mỏi hả?"]
    hr: *(nụ cười khựng lại nửa giây)* …Mỏi. Mà nghề của em là cười. Như nghề của anh là đội mũ.
    ~ qh("hr", 10)
* -> sieu_nhan_hong_tudo_het_chuyen
- hr: Anh là đối tác, em không có quyền gì với anh. Nhưng em muốn hỏi: nếu chiến dịch thất bại, anh nghĩ ai nên ở lại?
* [🙂 "Ai cũng nên ở lại. Em cũng vậy."]
    hr: *(im lặng)* Em… cũng có trong danh sách à? *(cười)* Anh nói đúng. Người cuối cùng thường là người cầm danh sách.
    ~ qh("hr", 10)
* [🦸 "Mình sẽ không thất bại! Gét gô!"]
    hr: Em ghi nhận tinh thần tích cực của anh.
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_it ===
# npc:it # noi:phong_server
it: Chuyện gì.
* [🦸 "Mạng livestream của anh lag quá!"]
    it: Tắt đi bật lại thử chưa?
    sieu_nhan_hong: Rồi.
    it: Thì do Tóp-tóp. Ai đó trong công ty đang lướt. *(nhìn về phía bàn {chua_te_deadline})*
* [🙂 Tháo mũ, ngồi xuống ghế nhựa trong phòng server: "Ở đây mát ghê."]
    ~ snh_thao_mu(false)
    it: *(liếc mặt bạn đúng 1 giây, rồi quay lại màn hình)* Ừ. Server cần mát. Người cũng vậy.
    ~ qh("it", 10)
* -> sieu_nhan_hong_tudo_het_chuyen
- it: Có người search tên thật của anh trên máy công ty. Nhiều lần.
* [💬 "Ai vậy anh?"]
    it: Không nói. *(gõ phím)* Mà tôi chặn rồi.
    ~ snh_mat(-5)
    ~ qh("it", 5)
* [🍜 Đặt một ly mì ly vị mới lên bàn.]
    it: …Cảm ơn. *(gõ thêm vài dòng)* Đã xóa lịch sử tìm kiếm. Cả của anh lẫn của họ.
    ~ snh_mat(-8)
    ~ qh("it", 10)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_idol_het_thoi ===
# npc:idol_het_thoi # noi:phong_cho
idol_het_thoi: *(kính đen, trong phòng chờ không cửa sổ)* Em vô phòng chờ của anh làm gì? À, phòng chờ của em. Phòng chờ của anh bị đổi rồi.
idol_het_thoi: Em biết anh là ai không?
* [🙂 "Biết. 'Công Viên'. Em thuộc từ năm lớp 12."]
    idol_het_thoi: *(gỡ kính)* Lớp 12? …Hát thử đoạn điệp khúc coi.
    _Bạn hát. Sai lời. "Khoai chiên". {idol_het_thoi} cười lần đầu tiên._
    idol_het_thoi: Cá viên chiên! Trời ơi, cá viên chiên!
    ~ qh("idol_het_thoi", 10)
* [🦸 "Biết! Anh là đàn anh của Siêu Nhân Hồng!"]
    idol_het_thoi: Đàn anh… hay đồ cũ? *(đeo kính lại)*
    ~ qh("idol_het_thoi", -3)
* -> sieu_nhan_hong_tudo_het_chuyen
- idol_het_thoi: Nói thật đi. Họ lăng xê em để thay anh, đúng không?
* [🙂 "Không ai thay ai được hết. Đêm Hồng, anh hát mở màn với em nha?"]
    idol_het_thoi: *(im lặng rất lâu)* …Em nói thật hay PR?
    sieu_nhan_hong: Thật. Không có camera ở đây.
    idol_het_thoi: Để anh hỏi {quan_ly_idol}… à không. Anh tự quyết. Ừ. Anh hát.
    ~ qh("idol_het_thoi", 20)
* [💸 "Em nghe nói anh nợ tiền nhà. Em trả giùm anh nha."]
    ~ snh_ket(10)
    idol_het_thoi: *(đứng bật dậy)* Em thương hại anh hả? Em biết anh là ai không?!
    ~ qh("idol_het_thoi", -10)
    _Anh ta đi ra, đóng sầm cửa. Bạn vừa làm một việc tốt theo cách tệ nhất._
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_quan_ly_idol ===
# npc:quan_ly_idol # noi:phong_nghe_si
quan_ly_idol: Khoan, anh nghe máy chút. *(điện thoại 1)* Ừ. *(điện thoại 2)* Không! Đừng ai đăng gì hết! *(cúp cả hai)* Rồi. Em cần gì?
* [🙂 "Anh uống nước đi. Anh nói chuyện điện thoại 6 tiếng rồi."]
    quan_ly_idol: *(cầm chai nước, nhìn nó như nhìn vật lạ)* …Ừ. Cảm ơn em.
    ~ qh("quan_ly_idol", 8)
* [🦸 "Lịch tuần sau có gì vui hông anh?"]
    quan_ly_idol: Thứ 2 chụp, thứ 4 livestream, thứ 6 đám cưới… à không, đám cưới là lịch của {idol_het_thoi}. Anh lộn.
    ~ qh("quan_ly_idol", 3)
* -> sieu_nhan_hong_tudo_het_chuyen
- quan_ly_idol: Em nghe anh nói nè. Có ai rủ em đi đâu, ký gì, hứa gì, em hỏi anh trước. Chuyện này để anh lo.
* [🙂 "Còn anh? Có ai rủ anh đi đâu hông?"]
    quan_ly_idol: *(hai điện thoại cùng reo, anh không bắt máy)* …Em hỏi gì kỳ vậy.
    quan_ly_idol: Anh mà đi thì ai lo cho {idol_het_thoi}. Nó… dễ tổn thương lắm.
    ~ phat_hien(thai_thuong_phat)
    ~ qh("quan_ly_idol", 10)
* [😶 "Dạ."]
    quan_ly_idol: Ngoan. *(bắt máy)* Alo?
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_bien_kich ===
# npc:bien_kich # noi:san_thuong
bien_kich: Anh {sieu_nhan_hong}. Đứng yên. Ánh sáng chiếu lên bộ đồ hồng của anh lúc này… có vị của sự cô đơn.
* [🦸 "Vị dâu hả em?"]
    bien_kich: *(thở dài)* Anh phá hỏng ẩn dụ của tôi rồi.
    ~ qh("bien_kich", -2)
* [🙂 "Sao em biết anh cô đơn?"]
    bien_kich: Vì người không cô đơn thì không cần ai vỗ tay nhiều như vậy.
    _Bạn đứng im. Cô ta ghi gì đó vào cuốn sổ bìa da._
    ~ qh("bien_kich", 8)
* -> sieu_nhan_hong_tudo_het_chuyen
- bien_kich: Phim ngắn mở màn Đêm Hồng có một nhân vật mặc đồ hồng. Anh có muốn đóng không? Không lộ mặt.
* [🙂 "Nhân vật đó có thật hông em? Ai kể cho em?"]
    bien_kich: *(khựng lại)* Đây không phải đạo, đây là cảm hứng. Từ… cuộc sống.
    ~ phat_hien(nguoi_gac_ket)
* [🦸 "Đóng! Gét gô!"]
    bien_kich: Tốt. Nhưng không được tạo dáng. Người hùng thật không tạo dáng.
    ~ qh("bien_kich", 5)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_editor ===
# npc:editor # noi:phong_dung_phim
editor: *(ngáp)* Đợi render xong… À, anh {sieu_nhan_hong}. Anh muốn sửa gì trong MV hả?
* [🦸 "Thêm hồng! Hồng hơn nữa!"]
    editor: Hồng nữa là thành màu đỏ đó anh. *(vẫn chỉnh)* Render xong là xong.
    ~ qh("editor", 2)
* [🙂 "Hông sửa gì. Anh mua cà phê cho em nè. Em thức mấy đêm rồi?"]
    editor: Bốn. *(cầm ly, nhìn bạn)* Ở công ty này anh là người thứ hai mua cà phê cho tui.
    ~ qh("editor", 10)
* -> sieu_nhan_hong_tudo_het_chuyen
- _Trên màn hình phụ, một video dựng dở: toàn cảnh {quan_ly_idol} ôm hai điện thoại, ngủ gục trên xe._
* [💬 "Video gì vậy em?"]
    editor: *(tắt màn hình nhanh như chớp)* Không có gì. Video… test màu.
    ~ phat_hien(linh_thich_thai)
* [😶 Giả vờ không thấy.]
    editor: *(thở ra)* …Cảm ơn anh.
    ~ qh("editor", 5)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_designer ===
# npc:designer # noi:ban_thiet_ke
designer: Anh ơi đừng nói gì. Em đang sửa poster của anh lần thứ 23. Sửa nhẹ thôi là sửa cái gì ạ?
* [🦸 "Hồng thêm chút nữa!"]
    designer: *(gõ đầu vào bàn)* Hết cứu.
    ~ qh("designer", -3)
* [🙂 "Bản đầu tiên đẹp nhất. Em gửi bản đầu đi, anh nói sếp giùm."]
    designer: *(ngẩng lên)* Anh… nói được hả? Anh là người duy nhất sếp nghe.
    ~ qh("designer", 15)
* -> sieu_nhan_hong_tudo_het_chuyen
- _Laptop thứ hai của {designer} đang mở. Một bộ hồ sơ tên "Dự án Hồng Ngoại", logo xanh lá chuối. Ảnh trong đó… là ảnh bạn._
* [💬 "Hồ sơ đó… là về anh hả?"]
    designer: *(đóng laptop cái rầm)* Không! Job freelance. Cho idol mới. Em… em tưởng vậy.
    designer: *(nhỏ giọng)* Anh đừng nói ai nha. Em… em cũng mới thấy lạ.
    ~ phat_hien(quynh_lam_cho_ll)
    ~ qh("designer", 5)
* [😶 Không hỏi.]
    _Bạn không hỏi. Cô ta nhìn bạn, biết bạn đã thấy. Hai người cùng giả vờ._
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_sales ===
# npc:sales # noi:sanh_tang_tret
sales: Anh trai! Tin chị đi, tháng này chị chốt BTT Global, 2 tỷ, Mr. Kevin Trộn ký liền!
* [💬 "Em nhỏ hơn anh 5 tuổi mà xưng chị hả?"]
    sales: Tuổi là con số. Deal mới là thật. Gọi chị.
    ~ qh("sales", 3)
* [🦸 "Gét gô! Chị {sales}… à em… à chị!"]
    sales: Đó! Biết điều!
    ~ qh("sales", 5)
* -> sieu_nhan_hong_tudo_het_chuyen
- sales: Mà anh ơi, nếu… nếu chị cần một người đóng giả Mr. Kevin Trộn, anh có quen ai không? Hỏi vu vơ.
* [🙂 "Em ơi… BTT Global có thật hông?"]
    sales: *(nụ cười cứng lại 2 giây)* …Anh nói nhỏ thôi.
    sales: Chị nói nhỏ thì không ai nghe. Nên chị nói to. Nói to riết… thành nói phét. *(cười)* Anh đừng kể ai nha.
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", 10)
* [💸 "Anh đóng tiền tài trợ luôn, mình khỏi cần Kevin."]
    ~ snh_ket(15)
    sales: *(trợn mắt)* Anh… anh nói thiệt hả? Anh lấy tiền đâu?
    ~ qh("sales", 5)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_chi_dai ===
# npc:chi_dai # noi:kho_su_kien
chi_dai: Em {sieu_nhan_hong}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe. *(dù bằng tuổi, chị gọi ai cũng là em)*
* [🙂 "Chưa. Ở nhà em ăn một mình hoài."]
    chi_dai: Ăn một mình? Nhà to vậy mà ăn một mình? Tối nay về nhà chị ăn. Nhà số 45, Phố Cũ. Không cãi.
    ~ an(30)
    ~ qh("chi_dai", 15)
* [🦸 "Siêu nhân không cần ăn!"]
    chi_dai: Ăn! *(dúi hộp cơm vào tay)* Đứa nào nhịn đói trước mặt chị là chị xử.
    ~ an(30)
    ~ qh("chi_dai", 5)
* -> sieu_nhan_hong_tudo_het_chuyen
- chi_dai: Đêm Hồng chị lo sân khấu. Em muốn gì cứ nói chị. Pháo hoa, khói, đèn. Hay… một chỗ để em tháo mũ mà không ai thấy?
* [🙂 "Một cái cánh gà tối. Bên trái."]
    chi_dai: *(gật)* Được. Chị để trống cánh gà bên trái. Không ai vào. Trừ đứa em muốn.
    ~ qh("chi_dai", 5)
* [🦸 "Pháo hoa hồng! Nhiều nhiều!"]
    chi_dai: Pháo hoa hồng thì tốn. Mà thôi. Chị lo.
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_dan_dau_tu ===
# npc:dan_dau_tu # noi:ban_so_lieu
dan_dau_tu: Anh ơi! Nhìn chart nè! Người theo dõi của anh đang hình thành mô hình "cốc và tay cầm". Sắp bứt phá!
* [🦸 "Bứt phá! Gét gô!"]
    dan_dau_tu: Đúng! Lần này là lên thật!
    ~ qh("dan_dau_tu", 3)
* [🙂 "Em giỏi số thật đó. Sao em không làm số liệu cho công ty nhiều hơn?"]
    dan_dau_tu: *(khựng lại)* Có người khen em giỏi số thật à? Không phải giỏi đoán coin?
    ~ qh("dan_dau_tu", 10)
    ~ follow(3000)
* -> sieu_nhan_hong_tudo_het_chuyen
- dan_dau_tu: Mà anh… anh có muốn góp vốn không? Em thấy anh… có vẻ có điều kiện.
* [💸 "Em nợ bao nhiêu? Anh trả hết cho."]
    ~ snh_ket(15)
    dan_dau_tu: 22 triệu… *(mắt sáng rồi tắt)* Mà thôi anh. Em tự trả. Em muốn một lần tự trả.
    ~ qh("dan_dau_tu", 5)
* [🙂 "Anh không góp vốn. Mà tối nay anh bao em tô hủ tiếu."]
    dan_dau_tu: *(cười)* Hủ tiếu thì em nhận. Không tính lãi.
    ~ snh_cat_xe(-50000)
    ~ qh("dan_dau_tu", 8)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi # noi:ban_dieu_phoi
thanh_xin_nghi: *(giọng yếu ớt)* Anh ơi… lịch quay chiều nay… em hơi sốt… em xếp lại cho anh qua ngày mai nha…
* [🙂 "Em về nghỉ đi. Anh tự lo được."]
    thanh_xin_nghi: *(giọng khỏe lại ngay)* Thiệt hả anh? Anh là người tốt nhất em từng điều phối!
    ~ qh("thanh_xin_nghi", 10)
* [🦸 "Siêu nhân chữa sốt! Biến hình!"]
    thanh_xin_nghi: *(ho)* Dạ… em vẫn sốt anh ơi.
* -> sieu_nhan_hong_tudo_het_chuyen
- thanh_xin_nghi: Mà anh nè… anh thấy giọng em… có hay hông? Em hỏi chơi.
* [🙂 "Hát thử anh nghe."]
    _{thanh_xin_nghi} nhìn quanh, rồi hát khẽ hai câu. Giọng ấm, chắc, lên nốt cao không chút "sốt" nào._
    sieu_nhan_hong: Em… hát hay hơn anh nhiều.
    thanh_xin_nghi: *(đỏ mặt)* Anh đừng nói anh {hr} nha. Bà ngoại em… à, em…
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 15)
* [🦸 "Hay! Mà không hay bằng thái độ!"]
    thanh_xin_nghi: Dạ… *(thở dài)* xu cà na.
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_bac_bao_ve ===
# npc:bac_bao_ve # noi:chot_bao_ve
bac_bao_ve: Cậu đấy à. Ngồi đi. Uống trà.
~ uong(25)
* [🙂 Tháo mũ ra trước khi ngồi.]
    ~ snh_thao_mu(false)
    bac_bao_ve: *(nhìn mặt bạn, gật đầu)* Ừ. Vào chòi bác thì tháo mũ. Thế mới phải phép.
    ~ qh("bac_bao_ve", 8)
* [🦸 "Con chào bác! Hồng không phải màu…"]
    bac_bao_ve: Ừ. Hồng là thái độ. Bác thuộc rồi. *(uống trà)*
    ~ qh("bac_bao_ve", 2)
* -> sieu_nhan_hong_tudo_het_chuyen
- bac_bao_ve: Bác nói một câu thôi. Cái gì giấu lâu quá thì nặng. Mũ cũng thế. Tiền cũng thế.
* [🙂 "Bác biết hả bác?"]
    bac_bao_ve: Bác không biết gì đâu. *(rót thêm trà)* Bác chỉ thấy cậu đi vào cổng lúc nào cũng thẳng lưng, mà đi ra thì cúi đầu.
    ~ snh_no(-2)
    ~ qh("bac_bao_ve", 5)
* [💬 "Bác ơi, {cho} ghét con lắm hả bác?"]
    bac_bao_ve: Nó không ghét ai cả. Nó chỉ nhớ ai trêu nó. *(nhìn {cho})* Cậu thử một tuần không trêu nó xem.
    ~ qh("bac_bao_ve", 3)
* -> sieu_nhan_hong_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_cho ===
# npc:cho # noi:chot_bao_ve
{ snh_chuoi_hien_tai() >= 10:
    cho: *(ngẩng đầu, nhìn bộ đồ hồng, rồi… vẫy đuôi một cái)* Gâu.
- else:
    cho: GRỪ… GÂU GÂU! *(lông dựng, nhìn chằm chằm vào mũ)*
}
+ {co(xuc_xich)} [🦴 Cho {cho} một cây xúc xích.]
    ~ mat(xuc_xich)
    ~ snh_cho_xuc_xich()
    cho: *(ăn sạch, liếm mép)* …Gâu.
    { qh_cho >= 60:
        _{cho} không sủa nữa. Nó ngồi xuống, nhìn túi áo bạn, chờ cây thứ hai._
    - else:
        _Ăn xong, nó vẫn sủa bạn một tiếng. Ăn thì ăn, ghét thì vẫn ghét._
    }
+ [🐕 Giả tiếng sủa: "Gâu! Gâu gâu!"]
    ~ snh_choc_tuat()
    cho: GÂU GÂU GÂU GÂU!
    bac_bao_ve: *(từ trong chòi)* Cậu lại thế.
+ [🙂 Ngồi xuống cách {cho} 2 mét. Không nói gì.]
    ~ qh("cho", 2)
    _{cho} gầm gừ. Rồi gầm gừ nhỏ dần. Rồi nằm xuống, mắt vẫn nhìn bạn. Hôm nay vậy là đủ._
- -> END


// ------------------------------------------------------------
// Khi đã nói hết chuyện (mọi lựa chọn một-lần đã dùng)
// ------------------------------------------------------------
=== sieu_nhan_hong_tudo_het_chuyen ===
_Hai người nói thêm vài câu chuyện phiếm: thời tiết, kẹt xe, giá trà sữa. Hôm nay vậy là đủ._
-> END