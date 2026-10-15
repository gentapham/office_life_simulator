// ============================================================
// HR: TUẤN · CHƯƠNG 5: "DANH SÁCH RÒ RỈ" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== hr_2110_truy_admin ===
# ngay:21 # gio:09:00 # noi:phong_server # bat_buoc
_Sáng 21/10. Trang "Confession G-Entertainment" đăng một bài ẩn danh: "Có người lén thế chấp biệt thự để trả lương. Biệt thự đó ở Đồi Ngân Hàng." 300 lượt chia sẻ trong 1 tiếng._
_{giam_doc} gọi bạn lên, mặt xám ngoét: "Tìm cho anh admin trang đó. Tìm bằng được." Bạn xuống phòng server._
_Phòng server lạnh như tủ đông. {it} ngồi giữa 3 màn hình, ly mì ăn dở._
it: Biết anh xuống vì gì rồi. Restart chưa? À không, câu đó không dùng được ở đây.
* [💬 "Bảo, anh biết admin là ai đúng hông?"]
    it: *(nhìn màn hình, không nhìn bạn)* Lỗi người dùng.
    hr: Nghĩa là biết.
    it: Nghĩa là… người ta làm admin một trang thì đó là việc của người ta. Tui chỉ đọc log. Tui không đọc người.
    ~ qh("it", 5)
    { hr_biet_ngan_co_trang:
        _Bạn nhớ giọng {hong_hot} trong bóng tối hôm mất điện: "Tui làm admin một trang…". Bạn không nói ra. Bạn chỉ gật đầu._
        ~ hr_nghe(5)
    }
* [📓 "Đây là lệnh của sếp. Anh phải đưa tên cho tui."]
    ~ hr_so(5)
    ~ qh("it", -10)
    it: Lệnh sếp thì sếp xuống mà lấy. Tui đi sửa máy in.
    _{it} đứng dậy đi thật. Cái máy in không hư. {it} chỉ cần một lý do để không ở chung phòng với bạn._
* [🍵 Ngồi xuống, ăn chung ly mì. Không hỏi gì.]
    ~ qh("it", 8)
    ~ hr_nghe(3)
    it: …Bài đó không phải admin viết. Admin chỉ bấm duyệt. Người gửi là người khác. Tui chỉ nói vậy thôi.
    _Người gửi là người khác. Ai đó trong công ty muốn {giam_doc} bị lộ. Bạn nghĩ tới mùi lá chuối hôm mất điện._
- _Bạn lên báo {giam_doc}: "Chưa tìm ra." Ông ấy không hỏi thêm. Ông ấy đang bận nghe điện thoại ngân hàng._
-> END

// ------------------------------------------------------------
=== hr_2110_moc_3 ===
# ngay:21 # gio:16:00 # noi:phong_giam_doc # bat_buoc
_Mốc 3: 500.000 người theo dõi._
{ nguoi_theo_doi >= 500000:
    -> hr_2110_moc_3.s_dat
- else:
    -> hr_2110_moc_3.s_truot
}

= s_dat
dan_dau_tu: Nửa triệu! Biểu đồ dựng đứng! Lần này là lên thật, thật luôn!
_{giam_doc} thở phào, ngồi phịch xuống ghế, ngay dưới tấm bằng "Doanh nhân của năm"._
giam_doc: Tuấn. Tuần này… em cứ giữ danh sách như thế. Không thêm.
~ hr_ds(-1)
* [🍵 "Dạ. Anh uống trà hông? Trà sen."]
    giam_doc: Ừ. Rót cho anh. Hôm nay anh mệt.
    ~ qh("giam_doc", 5)
    ~ hr_tra()
* [😶 Gật đầu, đi ra.]
    _Bạn đi ra. Hành lang có tiếng {hong_hot} hò reo. Bạn mỉm cười, không ai thấy._
- -> END

= s_truot
dan_dau_tu: Ờ… 500 ngàn thì… chưa. Mà đây là vùng tích lũy…
giam_doc: Thôi Chương. Ra ngoài đi.
_{dan_dau_tu} đi ra. Chỉ còn bạn và {giam_doc}. Ông ấy không nhìn bạn._
giam_doc: Thêm tên vào đi em.
* [📓 "Dạ."]
    ~ hr_ds(2)
    ~ cang_thang(15)
    _Bạn về phòng, ghi thêm 2 tên. Tay bạn không run. Đó mới là điều đáng sợ._
    ~ hr_so(5)
* [🤝 "Anh, cho em đề xuất cắt sân golf mini, cắt phòng chờ riêng, cắt bánh chuối chiên… à không, cái đó trong hợp đồng."]
    giam_doc: *(cười khẩy)* Em tính hết rồi à?
    hr: Dạ. Cắt hết đồ, được 1 tên.
    giam_doc: …Thôi được. Thêm 1 tên thôi.
    ~ hr_ds(1)
    ~ qh("giam_doc", -3)
* {hr_nghi_trang_2} [🔒 "Anh ơi, danh sách của anh dày hơn của em. Trang 2 ghi gì vậy anh?"]
    _{giam_doc} ngẩng lên. Lần đầu tiên trong 7 năm, ông ấy nhìn bạn như nhìn một người ngang hàng._
    giam_doc: Em… về đi Tuấn.
    ~ hr_ds(1)
    _Câu đó, ông ấy nói nhỏ như sợ ai nghe. Bạn đi ra, biết chắc trang 2 có tồn tại._
- ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
-> END

// ------------------------------------------------------------
=== hr_2210_doan_thue ===
# ngay:22 # gio:09:00 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế tới bất ngờ. Trưởng đoàn: Chú Liêm, 55 tuổi, cặp da đen, nhìn ai cũng như nhìn hóa đơn sai._
phu_chu_liem: Cho xem toàn bộ hợp đồng lao động. 22 người, đúng không? Kèm bảng chấm công 3 tháng.
_Cả công ty giả vờ làm việc chăm chỉ. {chua_te_deadline} lần đầu tiên mở file Excel. {cho} bước vào phòng, vẫy đuôi._
phu_chu_liem: *(nhảy lên ghế)* Ối! Chó! Ai cho chó vào đây?!
* [🐕 Bế {cho} ra ngoài, nhờ {bac_bao_ve} giữ.]
    ~ qh("cho", -3)
    ~ qh("bac_bao_ve", 3)
    phu_chu_liem: *(leo xuống, chỉnh cà vạt)* Ừm. Phòng nhân sự làm việc… có trật tự.
    ~ uy_tin = uy_tin + 3
* [😊 Cười: "Dạ đó là nhân viên chính thức ạ. Lương 2 cây xúc xích mỗi ngày."]
    phu_chu_liem: Có hợp đồng lao động không?
    hr: Dạ… không ạ.
    phu_chu_liem: Ghi biên bản!
    ~ cang_thang(10)
    ~ hr_so(-2)
    _{ke_toan} nhìn bạn như muốn ném cả bộ chứng từ._
- _Chú Liêm lật từng hợp đồng. Rồi dừng lại ở bảng chấm công của {thanh_xin_nghi}: đỏ như lịch Tết._
phu_chu_liem: Nhân viên này… nghỉ 31 ngày trong 9 tháng, có giấy phòng khám đầy đủ? Phòng khám này… ký cả chủ nhật?
* [🤝 Đỡ cho {thanh_xin_nghi}: "Dạ, công ty có chính sách linh hoạt cho nhân viên có… hoàn cảnh ạ."]
    ~ qh("thanh_xin_nghi", 10)
    ~ qh("ke_toan", -3)
    phu_chu_liem: Linh hoạt tới chủ nhật. Ừ. Công ty các cô cậu linh hoạt thật.
* [📓 "Dạ, nhân viên này đang trong diện xem xét kỷ luật ạ."]
    ~ hr_so(3)
    { not hr_them_ten_son:
        ~ hr_ds(1)
        ~ hr_them_ten_son = true
    }
    _Chú Liêm gật gù. Câu đó nghe như một lời chuẩn bị._
- _Hai người làm tới 9 giờ tối. Đoàn thuế đi rồi, còn lại bạn và {ke_toan} giữa núi giấy._
~ nghi(-30)
-> END

// ------------------------------------------------------------
=== hr_2210_mi_phong_ke_toan ===
# ngay:22 # gio:21:15 # noi:phong_ke_toan
_9 giờ tối. Phòng kế toán. Hai ly mì ăn liền. Đèn tuýp kêu rè rè. {ke_toan} cởi kính, xoa mắt._
ke_toan: Ông biết hông, 7 năm tui chưa thấy ông ăn mì ly. Tưởng HR chỉ uống trà.
hr: Uống trà no lâu mà bà.
_Im lặng. Tiếng mì. Bạn nghĩ tới bản nháp email trong laptop ở căn 604: "Thư mời làm việc". Gửi {ke_toan}. Chưa bấm gửi._
* [💬 Suýt kể: "Bà nè… giả sử công ty sập, bà tính làm gì?"]
    ke_toan: *(nhìn bạn rất lâu)* Tui tính rồi. Tui có tính hết. Ông khỏi lo cho tui.
    hr: Không phải lo. Tui… muốn rủ bà làm chung một việc.
    ke_toan: Việc gì?
    _Bạn mở miệng. Rồi điện thoại {ke_toan} rung: "Ngân hàng Tín Dụng Đen Đủi". Bả nhìn màn hình, đứng dậy, ra hành lang nghe._
    ~ qh("ke_toan", 5)
    ~ hr_nghe(3)
    _Khi bả quay lại, khoảnh khắc đó đã qua. Bạn chỉ nói: "Thôi, mai kể."_
* [🍵 Không nói gì. Pha cho bả một ly trà Zzz.]
    ~ hr_tra()
    ~ qh("ke_toan", 8)
    ke_toan: Ông pha trà Zzz cho tui là biết tui mất ngủ hả?
    hr: Hôm ký hợp đồng bà nhìn trang 47 tới trắng cả mặt. Từ hôm đó chắc chưa ngủ ngon.
    ke_toan: *(im lặng, uống)* …Cảm ơn ông.
* [😶 Ăn xong mì, về.]
    _Hai người đi xuống cầu thang. {bac_bao_ve} mở cổng, nhìn hai người, nói "Về cẩn thận", rồi không nói gì thêm._
- -> END

// ------------------------------------------------------------
=== hr_2310_an_ninh_banh_kem ===
# ngay:23 # gio:14:00 # noi:san_khau_su_kien # bat_buoc
_Sinh nhật Siêu Nhân Hồng, 31 tuổi. Sự kiện livestream. Nhiệm vụ của bạn: an ninh. Nói cho đúng: giữ {cho} tránh xa cái bánh kem hồng 5 tầng._
_{cho} ngồi cách cái bánh 3 mét. Mắt không rời. Đuôi không vẫy. Đây là tư thế săn mồi._
* [🌭 Dụ {cho} bằng xúc xích, dắt ra chòi bảo vệ.]
    ~ qh("cho", 5)
    _{cho} ăn xúc xích. Đi theo bạn ra chòi. Rồi khi bạn quay lưng, {cho} biến mất như chưa từng tồn tại._
* [🔗 Cột dây xích vào chân bàn.]
    ~ qh("cho", -5)
    _{cho} nhìn bạn với ánh mắt phản bội. Cái bàn bạn cột là… bàn để bánh kem._
* [🙏 Nhờ {chi_dai} giữ. Tuất chỉ nghe lời bả.]
    ~ qh("chi_dai", 3)
    chi_dai: Được. Mà tui chỉ giữ được tới lúc tui đi lấy nước.
- -> hr_2310_an_ninh_banh_kem.s_do

= s_do
_7 giờ tối. Livestream đông nghẹt. {sieu_nhan_hong} cúi xuống thổi nến. Một vệt vàng lao qua. Cái bánh 5 tầng đổ nghiêng như tháp Pisa, rồi đổ hẳn._
_Kem hồng dính lên mặt {sieu_nhan_hong}, lên màn hình livestream, lên cà vạt {giam_doc}. {cho} đứng giữa đống kem, liếm mép, vẫy đuôi._
sieu_nhan_hong: *(cười tới chảy nước mắt sau lớp mũ dính kem)* Tuất! Quà sinh nhật của em hả!
~ follow(60000)
_Bình luận chạy như thác. Không ai giận. Clip "Chó phá bánh sinh nhật siêu nhân" đang chạy._
* [😊 Cười to. Lần này không cần giữ.]
    ~ hr_so(-5)
    _Cả sân khấu cười. Bạn cười. Chẳng ai để ý HR đang cười, vì ai cũng đang cười._
* [📓 Ghi sổ: "Sự cố an ninh: 1. Thủ phạm: 1 chó."]
    _Bạn ghi xong, xé tờ giấy, bỏ túi. Có những vụ không ai nên bị ghi sổ._
- -> END

// ------------------------------------------------------------
=== hr_2310_livestream ===
# ngay:23 # gio:20:00 # noi:san_khau_su_kien
_Livestream tiếp tục sau vụ bánh kem. {sales} hớt hải: "Mr. Kevin Trộn phải lên sóng chúc mừng mà ảnh… kẹt xe ở Singapore. Cần người đóng thế!"_
_Bên cánh gà, ai đó đang ngân nga rất khẽ trong lúc dọn kem. Micro livestream bắt được. Bình luận: "Ai hát nền hay vậy?"_
_Bạn đứng cứng người. Cái giọng đó. Bạn đã nghe nó hàng chục tối, qua cái tivi ở căn 604._
* [🕵️ Bước ra sau cánh gà xem ai.]
    _Sau cánh gà là {thanh_xin_nghi}, tay cầm khăn lau, mặt đỏ bừng khi thấy bạn._
    thanh_xin_nghi: Dạ… em… em đang test micro cho anh Phát ạ!
    _{idol_het_thoi} đang ở tít bên kia sân khấu, không cầm micro nào._
    { hr_thay_bong_kim_tuyen:
        _Hạt kim tuyến trên má hôm 16/10. Giọng hát trên tivi. Giọng hát này. Bạn đặt hết lên bàn cân trong đầu. Nó nghiêng về một phía._
        ~ hr_biet_son_kim_tuyen = true
        ~ phat_hien(son_thi_hat)
        hr: …Sơn. Em hát hay lắm.
        thanh_xin_nghi: *(đứng hình)* Dạ… dạ anh nói gì em hông hiểu…
        hr: Ừ. Anh cũng không hiểu gì hết. Đi dọn kem tiếp đi em.
        ~ qh("thanh_xin_nghi", 10)
    - else:
        hr: Ừ. Test xong nhớ tắt micro nha em.
        _Bạn đi ra. Trong đầu cứ văng vẳng một câu hát. Quen lắm. Mà không nhớ ra._
    }
* [😶 Đứng yên, nghe cho hết câu hát.]
    _Câu hát dứt. Bình luận: "Hát nữa đi!" Không ai hát nữa._
    ~ cang_thang(-5)
- _Rồi {sieu_nhan_hong} cầm micro, quay về phía {chua_te_deadline} đang đứng sau máy quay._
sieu_nhan_hong: Vũ ơi… em thích anh. Không phải PR đâu. Thiệt đó.
_Cả livestream nổ tung. Hashtag VũƠiTrảLờiĐi lên top xu hướng trong 10 phút. {chua_te_deadline} đứng đơ, tay vẫn bấm máy quay._
* [🤝 Lại gần {chua_te_deadline}, nói nhỏ: "Em không cần trả lời ngay. Mai lên phòng anh uống trà, nếu muốn."]
    ~ qh("chua_te_deadline", 8)
    ~ hr_nghe(5)
* [😊 Vỗ tay theo đám đông.]
    ~ follow(5000)
- -> END

// ------------------------------------------------------------
=== hr_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Ngày Liên Hợp Quốc. "Hội nghị hòa giải" của {chi_dai}. Bàn xếp theo cặp: {truong_phong}–{con_ong_chau_cha}, {designer}–{bien_kich}, {sales}–{ke_toan}, {chi_dai}–{thanh_ninh}, và bạn–{thanh_xin_nghi}. Bàn riêng góc phòng có bảng "Chủ nợ" cho {dan_dau_tu}._
_Tin đồn về danh sách cắt giảm đã lan cả tuần. Ai cũng biết. Không ai dám hỏi._
_Rồi {chi_dai} đập bàn._
chi_dai: Tuấn! Ông có danh sách cắt giảm đúng hông? Có tên ai, nói luôn. Đứa nào bị đuổi mà khóc, tui chỉ mặt ông. # hen_gio:5
* [🤝 "Có. Nhưng chưa có tên ai cả. Và tui đang làm mọi cách để nó trống tới 31/10."]
    _Cả phòng ồn ào. Rồi im. Rồi ai đó vỗ tay. {thuc_tap_sinh}. Rồi {hong_hot}. Rồi cả phòng._
    ~ hr_tu_thu_danh_sach = true
    ~ hr_do_ro_ri = 0
    ~ hr_so(-20)
    ~ qh("giam_doc", -20)
    ~ follow(20000)
    ~ phat_hien(danh_sach_cat_giam)
    ~ hr_nghe(10)
    chi_dai: Được. Tụi bây nghe chưa? Làm cho nó trống!
* [😊 "Mình cùng nhìn lại hành trình nha chị."]
    chi_dai: Ông cười nữa là tui đấm à nha.
    { RANDOM(1, 2) == 1:
        _{chi_dai} nhìn bạn 5 giây, rồi thở dài, ngồi xuống. "Thôi. Hôm nay hòa giải. Tha."_
    - else:
        _{chi_dai} làm thật. Bạn bị xô ngã vào bàn bánh ngọt. Kem dính đầy áo sơ mi ủi phẳng. Cả phòng cười rần rần._
        ~ hr_so(-15)
        ~ cang_thang(5)
    }
* [😶 "Không có danh sách nào hết."]
    ~ hr_noi_khong_co_danh_sach = true
    chi_dai: *(nhìn thẳng vào mắt bạn)* Ờ. Tui nhớ câu này đó.
    _Phòng họp thở ra. Tạm yên. Nhưng bạn biết, một lời nói dối trước 21 người là một quả bom hẹn giờ._
* [⏱️ (Không chọn kịp)]
    _Bạn im lặng. 5 giây. Trong phòng họp, im lặng nghĩa là "có"._
    ~ hr_ro_ri(30)
    ~ hr_so(5)
    chi_dai: Im là có. Tụi bây nghe chưa.
- -> END

// ------------------------------------------------------------
=== hr_2410_cap_tuan_son ===
# ngay:24 # gio:10:30 # noi:phong_hop_sang_tao
_Phần hòa giải theo cặp. Bạn ngồi đối diện {thanh_xin_nghi}. Trên bàn là tờ "Câu hỏi hòa giải" của {chi_dai}: "1. Điều bạn chưa từng nói với người kia là gì?"_
thanh_xin_nghi: Dạ… anh hỏi trước đi ạ.
* [😇 "Anh chưa từng nói: anh không ghét em. Anh chỉ tò mò bà ngoại em là ai."]
    thanh_xin_nghi: *(bật cười)* Bà ngoại em… khỏe lắm anh. Khỏe hơn em.
    ~ qh("thanh_xin_nghi", 8)
    ~ hr_nghe(3)
* [📓 "Anh chưa từng nói: hồ sơ của em dày 3 cm."]
    thanh_xin_nghi: Dạ… em biết rồi anh. Ai cũng biết.
    ~ hr_so(2)
* {hr_biet_son_kim_tuyen} [🔒 "Anh chưa từng nói: anh là fan của một ca sĩ tên Sơn Kim Tuyến."]
    _{thanh_xin_nghi} đặt ly nước xuống. Tay hơi run._
    thanh_xin_nghi: Anh… anh biết từ khi nào?
    hr: Từ cái hạt kim tuyến trên má em. Anh không nói ai đâu. Anh chỉ… muốn nói là anh bình chọn cho em {hr_so_lan_vote} lần rồi.
    thanh_xin_nghi: *(mắt đỏ hoe)* Số máy đuôi 604… là anh hả?
    ~ qh("thanh_xin_nghi", 20)
    ~ hr_nghe(8)
- thanh_xin_nghi: Tới em. Điều em chưa từng nói với anh là… em sợ anh lắm. Nhưng hôm nay thì hơi đỡ.
~ hr_so(-3)
-> END

// ------------------------------------------------------------
=== hr_2510_ban_ket ===
# ngay:25 # gio:20:00 # noi:can_ho_604
_Chủ nhật. Căn 604. Tối nay bán kết "Giọng Ca Ước Mơ". Bạn pha sẵn trà hoa cúc, kéo ghế sát tivi._
_Sáng nay {hong_hot} đăng story mập mờ: "Có người thấy anh Thái ở sảnh LL. Có người thấy cả Nhi. Ối dồi ôi." Bạn đã lưu lại để mai xử lý. Tối nay là của Sơn Kim Tuyến._
_Sơn Kim Tuyến bước ra. Đèn sân khấu. Kim tuyến. Một bài ballad về người đi làm xa nhà._
{ hr_biet_son_kim_tuyen:
    _Lần này, bạn biết người đứng đó là ai. Bạn nhìn cái cách em nó nắm micro. Giống hệt cách em nó nắm cuốn lịch của Siêu Nhân Hồng._
}
* [📱 Bình chọn. Bình chọn tới khi nào hết pin thì thôi.]
    ~ hr_so_lan_vote = hr_so_lan_vote + 30
    ~ tien_cong(-90000)
    _30 tin nhắn. 90.000đ. "Chi phí tinh thần", lần thứ hai trong tháng._
* [📱 Bình chọn vừa phải, 5 lần.]
    ~ hr_so_lan_vote = hr_so_lan_vote + 5
    ~ tien_cong(-15000)
- _Kết quả: Sơn Kim Tuyến vào chung kết. Chung kết trực tiếp 20:00 thứ 7, 31/10. Cùng tối với Đêm Hồng._
{ hr_biet_son_kim_tuyen:
    _Bạn nhìn lịch. 19:30 Đêm Hồng. 20:00 chung kết. Em nó định làm thế nào đây?_
    ~ cang_thang(5)
- else:
    _Bạn vỗ tay một mình trong căn 604. Rồi tự thấy ngại, dù không ai nhìn._
}
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== hr_2610_tin_don ===
# ngay:26 # gio:08:30 # noi:van_phong_tang_1 # bat_buoc
_Thứ 2. Hạn chót 7 tên. Cả văn phòng xì xào. Tin đồn "cắt giảm nhân sự nếu Siêu Nhân Hồng thất bại" đã thành chuyện ai cũng nói, chỉ chưa ai thấy tận mắt._
{ not hr_tu_thu_danh_sach:
    ~ hr_ro_ri(20)
}
{ hr_tung_ro_ri_100:
    -> hr_2610_tin_don.s_lo_roi
- else:
    -> hr_2610_tin_don.s_chua_lo
}

= s_lo_roi
_Trang Confession G-Entertainment. Ảnh chụp tập hồ sơ hồng, mờ nhưng đủ đọc. Những cái tên. 1.200 lượt chia sẻ._
_Không ai làm việc. Ai cũng đang cập nhật CV. Phân nửa công ty có lịch "đi khám răng" chiều nay, ngay sảnh LL-Entertainment._
{ hr_noi_khong_co_danh_sach:
    chi_dai: *(đứng trước bàn bạn)* "Không có danh sách nào hết". Ông nhớ câu đó hông?
    ~ qh("chi_dai", -60)
    ~ qh("hong_hot", -30)
    ~ qh("thuc_tap_sinh", -30)
    ~ qh("ke_toan", -30)
    ~ qh("thanh_xin_nghi", -30)
    ~ qh("chua_te_deadline", -30)
}
-> hr_2610_tin_don.s_tim_ke

= s_chua_lo
_Chưa ai thấy tận mắt. Nhưng {hong_hot} đã đi ngang phòng HR 4 lần trong 1 giờ. {ran_doc} hỏi bạn: "Anh ơi, phòng HR có máy hủy giấy hông ạ?"_
-> hr_2610_tin_don.s_tim_ke

= s_tim_ke
_Ai đã làm rò rỉ? Bạn có ba cái tên trong đầu._
* [🕵️ {hong_hot}: đi ngang phòng HR nhiều nhất.]
    ~ hr_tim_ke_ro_ri = "hong_hot"
    hong_hot: Ủa? Tui hóng thôi, tui đâu có chụp! Tui mà chụp thì đã có watermark của tui rồi!
    _Nghe vô lý mà lại rất có lý._
    ~ qh("hong_hot", -5)
* [🕵️ {ran_doc}: nhân viên mới, hỏi máy hủy giấy, ngọt ngào bất thường.]
    ~ hr_tim_ke_ro_ri = "ran_doc"
    ran_doc: Em hả anh? *(cười rất ngọt)* Em mới vô mà, em đâu có biết tủ nào là tủ nào.
    _Câu trả lời hoàn hảo. Quá hoàn hảo._
* [🕵️ "Con rắn thứ hai": mùi lá chuối hôm mất điện.]
    ~ hr_tim_ke_ro_ri = "ran_thu_hai"
    _Bạn đi một vòng văn phòng, giả vờ hỏi thăm, ngửi từng góc. Ở một bàn, mùi nước hoa xanh lá chuối thoảng qua. Người ngồi đó ngẩng lên cười với bạn._
    _Bạn cười lại. Lần này, nụ cười của bạn đáng sợ đúng chỗ._
    ~ hr_ro_ri(-10)
    ~ phat_hien(ran_thu_hai_lo_mat)
- -> END

// ------------------------------------------------------------
=== hr_2610_nop_danh_sach ===
# ngay:26 # gio:16:00 # noi:phong_giam_doc # bat_buoc
_4 giờ chiều. Bạn ôm tập hồ sơ hồng lên phòng kính. Danh sách có {hr_danh_sach_den} tên. Hạn chót: {hr_han_chot}._
giam_doc: Ngồi đi em. Đưa anh xem.
_{giam_doc} mở tập của bạn. Tập của ông ấy nằm ngay bên cạnh. Cũng màu hồng. Dày hơn. Gió từ máy lạnh lật trang đầu của nó lên._
_Trang 2. Một dòng viết tay: "Người cuối cùng: Tuấn (sau khi HR cắt xong hết)."_
~ hr_da_xem_trang_2 = true
_Bạn đọc nó hai lần. Rồi ba lần. Rồi {giam_doc} ngẩng lên, thấy bạn đang nhìn gì._
* [😶 Không nói gì. Chụp lại bằng mắt. Gật đầu chào, đi ra.]
    _Bạn đi ra như người vừa uống nhầm cả ấm trà gừng. {giam_doc} gọi theo "Tuấn…", nhưng không nói gì thêm._
    ~ cang_thang(15)
* [💬 "Anh… viết cái này khi nào vậy anh?"]
    giam_doc: *(gập tập hồ sơ lại)* Ngày 1/10. Cùng ngày với em. Tuấn, anh… anh không ép…
    hr: Anh không ép, tùy em. Em biết rồi anh.
    ~ qh("giam_doc", -5)
    ~ hr_nghe(3)
    _Lần đầu tiên câu cửa miệng của {giam_doc} được người khác nói trước. Ông ấy im lặng._
* [😊 Cười.]
    _Bạn cười. Cười rất lâu. {giam_doc} lùi ghế lại 20 cm._
    giam_doc: Tuấn… em ổn không?
    hr: Dạ ổn anh. Nụ cười nhân sự.
    ~ hr_so(10)
- { hr_danh_sach_den < hr_han_chot:
    giam_doc: Mới {hr_danh_sach_den} tên. Chưa đủ. Anh cho em tới 30/10.
- else:
    giam_doc: Đủ rồi. Anh giữ đây. 30/10 em đọc.
}
-> END

// ------------------------------------------------------------
=== hr_2610_email_dem ===
# ngay:26 # gio:23:30 # noi:can_ho_604 # bat_buoc
_Căn 604. Trên màn hình là bản nháp "Thư mời làm việc" gửi {ke_toan}. Bên cạnh là trang 2 bạn đã thấy trên bàn {giam_doc}, giờ nằm trong đầu bạn như một tấm ảnh: "Người cuối cùng: Tuấn"._
_Kệ trà 40 loại im lặng nhìn bạn._
* [☕ Xóa email. Pha một ấm trà Zzz, đi ngủ.]
    _Thùng rác. Rồi "dọn thùng rác". Rồi trà Zzz. Bạn không ngủ được, nhưng ít ra không có thêm kế hoạch nào để lo._
    ~ nghi(10)
* [📨 Bấm gửi.]
    ~ hr_da_gui_email = true
    _"Đã gửi". 23:41. Bạn ngồi nhìn chữ "Đã gửi" rất lâu, như nhìn một ấm trà vừa đổ ra không lấy lại được._
    ~ cang_thang(10)
* {hr_da_xem_trang_2 && hr_do_lang_nghe >= 60} [🔒 Mở tập hồ sơ hồng, gạch hết tên, chỉ ghi lại một tên: "Tuấn".]
    ~ hr_tu_ghi_ten_minh = true
    ~ hr_danh_sach_den = 1
    _Bạn gạch từng cái tên. Mỗi đường gạch là một ngôi nhà được giữ lại. Rồi bạn viết, chữ đẹp nhất bạn từng viết: "Tuấn."_
    _Đêm đó bạn ngủ ngon nhất 7 năm._
    ~ nghi(40)
    ~ cang_thang(-30)
    ** [📨 Và… bấm gửi luôn bản nháp email.]
        ~ hr_da_gui_email = true
        _"Đã gửi". Nếu mình là người cuối cùng, thì mình phải có một nơi để đi._
    ** [😶 Không gửi. Đi ngủ thôi.]
        _Bạn tắt laptop. Kệ trà vẫn đó. Ngày mai vẫn đó._
- -> END

// ------------------------------------------------------------
=== hr_2710_thuong_pantry ===
# ngay:27 # gio:08:15 # noi:pantry # dieu_kien:hr_da_gui_email
{ not hr_da_gui_email:
    -> END
}
_8 giờ 15. {ke_toan} đứng ở pantry, cầm điện thoại, mở email "Thư mời làm việc". Bả gọi bạn ra._
ke_toan: Ông muốn bỏ công ty?
* [😇 "Không. Tui muốn có chỗ cho mọi người đi, nếu công ty sập. Kể cả bà."]
    ke_toan: "Phòng Trà Nhân Sự". *(đọc lại tên)* Nghe như tên một cái phòng kỷ luật.
    hr: Ở đó, mời uống trà nghĩa là mời uống trà.
    _{ke_toan} cười. Lần đầu bạn thấy bả cười mà không phải vì có hóa đơn hợp lệ._
    ke_toan: Tui chưa trả lời. Nhưng tui không xóa.
    ~ qh("ke_toan", 15)
    ~ hr_thuong_dong_y = true
    ~ hr_nghe(5)
* [😶 "Tui gửi nhầm. Bà xóa giùm tui."]
    ke_toan: Ông gửi nhầm lúc 11 giờ 41 tối? Ừ. Tui xóa.
    ~ qh("ke_toan", -5)
- { RANDOM(1, 3) == 1:
    _Ở cửa pantry, {hong_hot} đứng cầm ly cà phê, mắt tròn xoe. Trong 1 giờ, cả công ty biết tin: "Tuấn với Thương sắp bỏ công ty!"_
    ~ hr_tin_don_bo_cong_ty = true
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
    ~ hr_ro_ri(15)
}
-> END

// ------------------------------------------------------------
=== hr_2710_luu_luc ===
# ngay:27 # gio:11:00 # noi:sanh_le_tan # bat_buoc
_LL-Entertainment ra tay. Lưu Lực đích thân tới. Vest trắng, tóc vuốt keo, đi giữa hai thư ký mặc đồ xanh lá chuối._
phu_luu_luc: Việc hôm nay phải xong từ hôm qua. Tôi tới gặp Siêu Nhân Hồng. Và vài người khác.
_Rồi Lưu Lực nhìn thấy {chi_dai} đang đứng ở quầy lễ tân, tay cầm bộ đàm. Ông ta đứng hình. Tập hồ sơ trên tay rơi xuống sàn, giấy bay tung tóe._
chi_dai: Ủa… Quán Ốc Đêm. Mười năm trước. Tô ốc len. Nhớ hông?
_Lưu Lực lùi lại 3 bước, cúi nhặt giấy lia lịa._
* [🤝 Cúi xuống nhặt giúp, liếc qua từng tờ.]
    _Thư mời. Thư mời. Thư mời. Tên {quan_ly_idol}: 36 triệu/tháng. Tên {ke_toan}: Kế toán trưởng, lương gấp đôi. Tên {it}. Tên {bien_kich}. Tên {con_ong_chau_cha}. Tên {bac_bao_ve}…_
    _Không có tên bạn. LL không cần HR. Bạn không biết nên nhẹ nhõm hay buồn._
    ~ cang_thang(5)
    phu_luu_luc: *(giật lại)* Cảm ơn. Không cần.
* [😊 Đứng chắn cửa, cười Nụ Cười Nhân Sự.]
    _Một thư ký mặc đồ xanh lá chuối nhìn bạn, tái mặt, kéo tay áo sếp mình. "Anh… người này là HR… người mời uống trà…"_
    ~ hr_so(5)
    _Lưu Lực đi vòng qua bạn một quãng rất xa._
- -> END

// ------------------------------------------------------------
=== hr_2710_phong_van_nghi_viec ===
# ngay:27 # gio:15:00 # noi:phong_hr # bat_buoc
_Chiều. Bạn ngồi trong phòng HR với một ấm trà và một danh sách mới: những người đang muốn đi. Mỗi cuộc là một "phỏng vấn nghỉ việc". Mỗi cuộc là một ấm trà._
_Người đầu tiên: {thanh_ninh}, cầm một lá đơn chưa ký._
thanh_ninh: Anh Tuấn… em chỉ hỏi thử thôi ạ. Nếu em… đi, thì thủ tục thế nào ạ?
* [🍵 Pha trà hoa nhài. "Em không cần nói lý do. Nhưng em có muốn kể không?"]
    ~ hr_tra()
    thanh_ninh: *(im lặng, rồi)* Bên kia… không phải mời em làm trợ lý. Họ muốn em làm tai mắt. Em… không biết nữa.
    hr: Đi làm tai mắt thì không bao giờ được nói thật lòng nữa đâu em. Anh làm HR 7 năm, anh biết cái mệt đó.
    ~ qh("thanh_ninh", 10)
    ~ hr_nghe(5)
* [📓 "Thủ tục là báo trước 30 ngày. Hôm nay là 27. Em tính đi ngay sau Đêm Hồng hả?"]
    thanh_ninh: Dạ… em chưa tính. *(cất lá đơn đi)*
    ~ hr_so(3)
- _Người thứ hai: {quan_ly_idol}, hai điện thoại, mắt thâm._
quan_ly_idol: Tuấn. Anh nói thẳng. LL mời anh 36 triệu, kèm Nguyên. Anh chưa quyết.
* [🍵 "Anh Thái uống trà sen hông? Rồi kể em nghe, ai sẽ lo cho ông Phát nếu anh đi?"]
    _{quan_ly_idol} khựng lại rất lâu. Một điện thoại rung. Anh ấy tắt._
    quan_ly_idol: …Không ai.
    ~ qh("quan_ly_idol", 10)
    ~ hr_nghe(5)
* [📋 "Dạ, nếu anh đi, em cần anh bàn giao lịch Siêu Nhân Hồng trước 30/10."]
    quan_ly_idol: Em làm HR giỏi thật. Giỏi tới mức lạnh.
    ~ qh("quan_ly_idol", -5)
- _Người thứ ba không tới. {designer} gửi tin nhắn: "Dạ em chỉ hỏi chơi thôi anh, đừng mời em uống trà nha."_
_Ba ấm trà. Một ấm nguội nguyên._
-> END
