// ============================================================
// CHÚA TỂ DEADLINE · CHƯƠNG 5: "LÊN XU HƯỚNG" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== chua_te_deadline_2110_confession ===
# ngay:21 # gio:09:10 # noi:ban_lam_viec # bat_buoc
_Sáng 21/10. Trang "Confession {cong_ty}" đăng một bài ẩn danh: "Có ai biết sếp mình đem biệt thự đi thế chấp không?"._
_Cả tầng 1 im phăng phắc, rồi ồn ào gấp đôi. {hr} và {it} đi từng bàn "hỏi thăm"._
hr: Em {chua_te_deadline}, tối qua em làm gì từ 22 giờ tới 23 giờ? Anh chỉ muốn lắng nghe em thôi.
* [😎 "Em lướt Tóp-tóp anh. Anh {it} coi log là biết, em lướt 3 tiếng."]
    it: *(nhìn laptop)* Đúng. 3 tiếng 12 phút. Toàn video mèo.
    hr: Ừ… Em vô tội. Nhưng mình cùng nhìn lại 3 tiếng 12 phút đó nha em.
    ~ vu_gio_luot = vu_gio_luot + 1
* [💬 "Anh ơi, chuyện thế chấp là thật hả anh?"]
    hr: *(cười, không trả lời)* Em làm việc đi em.
    _Nụ cười đó trả lời hết rồi._
    ~ cang_thang(10)
* [🤝 "Anh {it}, xong vụ này em hỏi anh một chuyện riêng được hông?"]
    it: … Ừ. Tối. Phòng server.
    ~ qh("it", 3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2110_moc_3 ===
# ngay:21 # gio:17:00 # noi:phong_giam_doc # bat_buoc
_Mốc 3: 500.000 người theo dõi._
{ nguoi_theo_doi >= 500000 && vu_nuoc_toi_chan < 100:
    hong_hot: {nguoi_theo_doi}! Mốc 3 qua rồi! Nhưng hôm nay ai cũng bận lo vụ Confession nên hông ai ăn mừng…
    _{giam_doc} gật đầu một cái rồi đóng cửa phòng. Không "truyền lửa". Không "anh không ép". Chỉ một cái gật._
- else:
    ~ vu_moc_truot++
    hong_hot: {nguoi_theo_doi}. Trượt mốc 3.
    _Từ chiều đó, tin đồn "cắt giảm nhân sự nếu chiến dịch thất bại" bắt đầu chạy khắp công ty, nhanh hơn wifi._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
-> chua_te_deadline_2110_lam_som

= chua_te_deadline_2110_lam_som
_Bạn về chỗ. Trên bàn: tờ lịch, ngày 31/10 khoanh hồng. Còn 10 ngày. Cue sheet Đêm Hồng: {vu_cue_sheet} trên 47 cue._
{ vu_kich_ban_gameshow && vu_ho_so_phuong && vu_so_lan_nho_xiu == 0:
    _Bạn chợt nhận ra: MV xong, gameshow xong, hồ sơ phường xong, và bạn chưa nhờ ai làm giùm việc gì. Nếu làm luôn cue sheet bây giờ thì…_
}
* [✍️ Làm cue sheet ngay tối nay. Không lướt.]
    ~ vu_cue_sheet = vu_cue_sheet + 20
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 20
    ~ vu_chuoi_ngay_it_luot = vu_chuoi_ngay_it_luot + 1
    ~ nghi(-20)
    _Bạn viết được 20 cue. "Cue 1: Đèn tắt. Cue 2: Phim của {bien_kich}." Cảm giác lạ lắm. Như đang đi bộ trên đường mà không ai rượt._
* [😎 "Còn 10 ngày lận. Chill."]
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 10
    ~ vu_gio_luot = vu_gio_luot + 2
    ~ vu_chuoi_ngay_it_luot = 0
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2210_phong_server ===
# ngay:22 # gio:00:30 # noi:phong_server # bat_buoc
_0 giờ 30. Phòng server, tiếng quạt máy rì rì. {it} ngồi ăn mì ly, ánh màn hình xanh lè trên mặt._
_Sáng mai đoàn kiểm tra thuế tới. Họ sẽ đòi bằng chứng nghiệm thu dự án 800 triệu tháng 6._
{ vu_co_file:
    _Bạn đã có file. Bạn tới đây chỉ để… ngồi. Phòng server mát, và {it} không hỏi gì._
    it: Ăn mì hông?
    ~ an(20)
    ~ qh("it", 5)
    -> END
}
it: Chuyện riêng gì?
_Lần đầu tiên bạn không cười._
* [😇 "Anh {it} ơi… em làm mất file gốc rồi."]
    ~ vu_thu_nhan_bao = true
    ~ phat_hien(usb_cua_vu)
    it: *(đặt ly mì xuống)* … File gốc tháng 6?
    { qh_it >= 30:
        it: Khoan. Tháng 6… Hồi tháng 6 anh có cắm một cái ổ cứng sao lưu tự động vô máy chủ. Rồi rút về nhà. Ghi chữ "KHÔNG ĐƯỢC MỞ" để khỏi ai đụng.
        it: Anh quên mất nó. Mai 7 giờ anh mang tới.
        ~ vu_co_file = true
        ~ vu_file_tu_bao = true
        ~ vu_lo_file = 0
        ~ qh("it", 10)
        _Bạn không biết nói gì. Bạn ăn ké ly mì của {it}. {it} để yên._
    - else:
        it: Restart chưa? *(ngưng một giây)* Đùa. Anh không biết. Để anh nghĩ.
        _{it} nhìn màn hình rất lâu. Có cái gì đó lóe lên trong mắt, rồi tắt. "Chưa đủ thân để nhớ ra", có lẽ vậy._
        ~ vu_lo_file = vu_lo_file + 10
        ~ qh("it", 5)
    }
* [😶 "Thôi, không có gì. Em ngồi đây chút."]
    it: Ừ.
    _Hai người ngồi tới 2 giờ sáng. Không nói gì. Quạt máy kêu rì rì._
    ~ qh("it", 3)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2210_doan_thue ===
# ngay:22 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Đoàn kiểm tra thuế ngồi ở phòng họp. Trưởng đoàn là Chú Liêm, 55 tuổi, kính lão, cặp da. Cả công ty giả vờ chăm chỉ tới mức {dan_dau_tu} tắt chart._
_{ke_toan} lùng khắp ba tầng tìm bạn._
ke_toan: {chua_te_deadline}! Đoàn đòi bằng chứng nghiệm thu dự án tháng 6. File gốc, biên bản, hình ảnh. Em đưa chị ngay.
{ vu_co_file:
    _Bạn đưa cái ổ. Chú Liêm cắm vào, xem 3 phút, gật đầu: "Có nghiệm thu. Được."_
    ke_toan: *(thở ra như vừa sống lại)* Lần đầu chị muốn ôm em.
    ~ qh("ke_toan", 15)
    ~ uy_tin = uy_tin + 10
    -> END
}
* [😇 Nói thật với {ke_toan}.]
    ke_toan: *(nhắm mắt 3 giây)* … Được. Chị cảm ơn em đã nói thật. Giờ chị đi gỡ.
    _{ke_toan} gỡ bằng biên bản giấy, email cũ, và 40 phút giải trình. Đoàn vẫn ghi "chưa đủ bằng chứng", nhưng mức phạt nhẹ hơn._
    ~ vu_bi_phat_thue = true
    ~ vu_lo_file = vu_lo_file + 15
    ~ qh("ke_toan", 5)
* [🧯 "Dạ file đang ở máy {editor}, để em chạy lên lấy." (rồi trốn vào phòng server)]
    _Bạn trốn vào phòng server 2 tiếng. {ke_toan} đi tìm {editor}. {editor} nói "hông có"._
    ~ vu_bi_phat_thue = true
    ~ vu_lo_file = vu_lo_file + 30
    ~ qh("ke_toan", -15)
    ~ qh("editor", -5)
* [🐢 "Chị ơi, việc hôm nay cứ để ngày mai tính…"]
    ~ vu_trich_slogan++
    ke_toan: Em nói câu đó với đoàn thuế đi. Nói đi. Chị quay video.
    _Bạn không nói. Không ai nói câu đó với đoàn thuế. Đoàn ghi biên bản phạt._
    ~ vu_bi_phat_thue = true
    ~ vu_lo_file = vu_lo_file + 25
    ~ qh("ke_toan", -10)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2210_chu_liem_va_tuat ===
# ngay:22 # gio:11:20 # noi:sanh_tang_tret
_Chú Liêm đi xuống sảnh xem "cơ sở vật chất". Đúng lúc {cho} chạy ra từ gầm cầu thang._
cho: Gâu!
_Chú Liêm nhảy lên ghế lễ tân với tốc độ của một vận động viên 25 tuổi._
* [🐕 Bế {cho} đi chỗ khác.]
    cho: *(ngửi ly cà phê sữa trên tay bạn, ngoan hẳn, quay đầu nhìn gầm cầu thang)* Gâu…
    _Chú Liêm bước xuống, chỉnh lại kính: "Cảm ơn cháu. Chú… dị ứng lông chó." Không ai tin, nhưng ai cũng gật._
    ~ vu_manh_moi_tuat = true
    ~ qh("cho", 3)
* [😶 Đứng nhìn, cố không cười.]
    _Bạn không cười. Bạn chỉ quay mặt vào tường 30 giây. Vai bạn rung._
    ~ cang_thang(-5)
* [💬 "Chú ơi, nó hiền lắm, nó chỉ thích mùi cà phê sữa thôi."]
    bac_bao_ve: *(từ chòi, nói vọng vào)* Ừ… Nó thích nhặt đồ có mùi cà phê sữa. Bác không thấy gì đâu.
    _Bác nói câu đó hơi lâu. Lần này bạn để ý._
    ~ vu_manh_moi_binh = true
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2310_qua_sinh_nhat ===
# ngay:23 # gio:08:25 # noi:ban_lam_viec
_Sinh nhật {sieu_nhan_hong}. Lần đầu tiên trong tháng, bàn bạn không có quà hồng. Mà là bàn bạn phải có quà cho người ta._
_Bạn chưa mua gì. Tất nhiên._
* [🖊️ Lấy cây bút highlight hồng đầu tiên, buộc lại cái nơ, viết thiệp.]
    _"Sinh nhật vui nha anh. Trả lại anh cây bút, để anh tô thêm một ngày nữa lên lịch." Bạn để lên bàn phòng chờ._
    ~ vu_tin_that_long = vu_tin_that_long + 8
* [🍌 Chạy ra mua bánh chuối chiên nóng, để ở phòng chờ, không ghi tên.]
    ~ tien_cong(-40000)
    _Không ghi tên. Nhưng cả công ty chỉ có một người biết Nguyên thích bánh chuối chiên của xe đẩy đầu hẻm, chứ không phải của tiệm._
    ~ vu_tin_that_long = vu_tin_that_long + 10
* [📋 Ghi vào bảng tiến độ: "Quà sinh nhật SNH: {hong_hot} lo."]
    hong_hot: Ông đó nha! Quà sinh nhật mà cũng giao việc!
    ~ vu_tin_that_long = vu_tin_that_long - 5
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2310_phong_dieu_khien ===
# ngay:23 # gio:20:15 # noi:studio_tang_2 # bat_buoc
_Livestream sinh nhật. Bạn ngồi phòng điều khiển, tai nghe đeo một bên, tay lướt Tóp-tóp. Video đầu tiên hiện lên là… màn hình livestream ngay sau lưng bạn._
_Trên sóng, {dan_dau_tu} vừa đóng vai "Mr. Kevin Trộn" của BTT Global xong, bằng một cái mũ lưỡi trai và giọng Anh rất Quận Hóng._
sieu_nhan_hong: *(tháo găng tay, nhìn thẳng vào camera)* Có một người… sáng nào anh cũng để quà trên bàn. Người đó tưởng anh làm PR. {chua_te_deadline} ơi, anh không có làm PR đâu.
_Bình luận chạy như thác. Hashtag \#{chua_te_deadline}ƠiTrảLờiĐi leo top 3. Ngoài kia, {cho} vừa nhảy lên bàn bánh kem._
* [🌊 "Kịch bản này ai viết vậy? Hay quá, để tui nâng KPI cho bà {bien_kich}."]
    ~ follow(60000)
    ~ vu_tin_bi_khoa = true
    ~ vu_tin_that_long = 0
    _Bạn nói câu đó vào micro nội bộ. Micro nội bộ đang mở ra loa phòng chờ._
    _{sieu_nhan_hong} cười. Tối đó không ghé phòng chờ ăn bánh chuối chiên._
* [😳 Gõ bình luận: "Cho em tới 31/10 nha. Em quen làm phút chót."]
    ~ follow(60000)
    ~ vu_tin_that_long = vu_tin_that_long + 20
    ~ vu_hen_dem_hong = true
    _Bình luận của bạn được ghim. Cả nước gõ "31/10" vào lịch. {sieu_nhan_hong} đọc to, rồi đội mũ lại, rồi tháo ra, rồi đội lại._
* [🧯 Bỏ điện thoại, lao ra cứu cái bánh kem khỏi {cho}.]
    ~ follow(40000)
    ~ vu_cuu_banh_kem = true
    _Nửa cái bánh được cứu. Livestream quay được cảnh bạn ôm bánh, {cho} cắn ống quần. Câu trả lời bị hoãn._
    ~ qh("cho", -3)
    ~ vu_tin_that_long = vu_tin_that_long + 5
* {vu_tin_that_long >= 50} [🔒 Bước ra trước camera.]
    chua_te_deadline: Anh {sieu_nhan_hong}, em tưởng là PR thiệt. Xin lỗi anh. Cho em suy nghĩ đàng hoàng. Lần đầu em không muốn để tới phút chót.
    ~ follow(80000)
    ~ vu_tin_that_long = vu_tin_that_long + 30
    ~ vu_hen_dem_hong = true
    _{sieu_nhan_hong} đội mũ lại thật nhanh, vì mặt đỏ hơn bộ đồ._
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2310_sau_livestream ===
# ngay:23 # gio:23:10 # noi:phong_gac_quan_bida
_23 giờ 10. Phòng gác. Dưới nhà tiếng bi lách cách. Điện thoại vẫn rung vì bình luận._
{ vu_tin_bi_khoa:
    _Không có tin nhắn nào từ {sieu_nhan_hong}. Lần đầu tiên trong tháng._
    _Bạn lướt Tóp-tóp. Lướt. Lướt. Thấy mình trong một video "Producer phũ nhất năm". 2 triệu lượt xem._
    ~ vu_gio_luot = vu_gio_luot + 2
    -> END
}
_Bạn mở khung chat với {sieu_nhan_hong}. Gõ. Xóa. Gõ. Xóa._
* [💌 "Sinh nhật vui nha anh. Không phải PR đâu."]
    _Đã gửi. Đã xem. Ba chấm hiện lên, biến mất, hiện lên. Rồi một sticker con mèo hồng đội mũ._
    ~ vu_tin_that_long = vu_tin_that_long + 10
    ~ qh("sieu_nhan_hong", 8)
* [😶 Đặt điện thoại xuống. Mai nói.]
    _Bạn nằm nhìn trần nhà. Lần đầu tiên bạn thấy "mai nói" không chill chút nào._
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:10:00 # noi:phong_hop_sang_tao
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Xếp cặp: {truong_phong} – {con_ong_chau_cha}, {designer} – {bien_kich}, {sales} – {ke_toan}, {hr} – {thanh_xin_nghi}, {chi_dai} – {thanh_ninh}. Bàn riêng "chủ nợ" cho {dan_dau_tu}._
chi_dai: {chua_te_deadline}, em ngồi bàn {truong_phong} với {con_ong_chau_cha}. Làm trọng tài. Mỗi người phải khen người kia 3 câu. Em cũng phải khen {truong_phong} 3 câu.
truong_phong: *(khoanh tay)* Tớ đang chờ.
* [😇 Khen thật: "Anh là người duy nhất đọc hết mọi file em gửi."]
    truong_phong: *(khựng lại)* … Thì… đó là việc của tớ.
    _Câu thứ hai, thứ ba bạn cũng nói thật. {truong_phong} đỏ tai. {con_ong_chau_cha} vỗ tay: "Chill, hay ghê."_
    ~ qh("truong_phong", 15)
    ~ qh("con_ong_chau_cha", 3)
* [😏 "Anh họp giỏi. Anh họp rất giỏi. Anh họp giỏi nhất Quận Hóng."]
    truong_phong: Đấy là một câu nói ba lần.
    chi_dai: Tính là ba câu. Qua.
    ~ qh("truong_phong", -3)
    ~ cang_thang(-5)
* [🤝 Lái cho {truong_phong} và {con_ong_chau_cha} khen nhau trước.]
    con_ong_chau_cha: Anh {truong_phong}… làm slide đẹp. Thiệt. Anh hông muốn ghế Phó Giám đốc đâu, anh nói thật.
    truong_phong: *(nhìn {con_ong_chau_cha} rất lâu)* … Cậu nói thật à?
    _Một cuộc chiến ghế Phó Giám đốc vừa có vết nứt đầu tiên. Bạn làm được trong 4 phút._
    ~ qh("truong_phong", 8)
    ~ qh("con_ong_chau_cha", 8)
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2510_gam_cau_thang ===
# ngay:25 # gio:15:00 # noi:gam_cau_thang # dieu_kien:vu_chua_co_file_va_du_manh_moi
{ vu_co_file or not (vu_manh_moi_tuat && vu_manh_moi_binh):
    _Chủ nhật. Bạn ghé công ty lấy sạc. Gầm cầu thang tối om. {cho} ngủ. Bạn đi về._
    -> END
}
_Chủ nhật. Gầm cầu thang tối om. {cho} nằm chắn trước một đống đồ: chìa khóa, thỏi son, một cái điện thoại cũ, một con gà cao su… và một cái USB không nhãn. Mùi cà phê sữa đá._
_Ly cà phê {cho} ngửi. Câu "bác không thấy gì đâu" hơi lâu. Bạn hiểu ra rồi._
cho: Grừ… Gâu!
bac_bao_ve: *(từ ngoài cửa, không quay lại)* Ừ… Bác không thấy gì đâu.
* {co(xuc_xich)} [🦴 Đưa cho {cho} một cây xúc xích, chỉ vào cái USB.]
    ~ mat(xuc_xich)
    cho: *(nhai xúc xích, nhả cái USB ra)* Gâu.
    _Cái USB có thêm 4 vết răng nhưng vẫn chạy. File gốc dự án tháng 6. Cảnh drone. Hoàng hôn. Tất cả._
    -> chua_te_deadline_2510_tim_thay
* [🏃 Thò tay vào giật nhanh.]
    { RANDOM(1, 10) <= 3:
        _Bạn giật được! {cho} sủa một tiếng muộn màng._
        -> chua_te_deadline_2510_tim_thay
    - else:
        cho: GÂU GÂU GÂU GÂU!
        _{ran_doc} đi ngang, cầm ly trà sữa, đứng lại xem hết từ đầu tới cuối. Cười rất tươi._
        ran_doc: Ủa… cái USB gì vậy ông? Nói nhỏ thôi nha, tui hổng nói ai đâu.
        ~ vu_lo_file = vu_lo_file + 40
        ~ qh("cho", -10)
        -> END
    }
* {qh_bac_bao_ve >= 40} [🔒 "Bác Bình, cháu biết bác thấy hết. Cháu làm mất, cháu sai. Bác giúp cháu nha bác."]
    bac_bao_ve: Thế à.
    _Bác huýt sáo một tiếng. {cho} đứng dậy, tự tha cái USB ra, đặt vào tay bạn._
    bac_bao_ve: Lần sau để đồ thì nhớ chỗ, cháu ạ.
    ~ qh("bac_bao_ve", 10)
    -> chua_te_deadline_2510_tim_thay
* [😶 Bỏ đi. Mai tính.]
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 10
    _Bạn đi về. Lần đầu tiên câu "mai tính" làm bạn thấy mình hèn. Còn một cơ hội: tối 30/10._
    -> END

= chua_te_deadline_2510_tim_thay
~ vu_co_file = true
~ vu_lo_file = 0
~ nhan(usb_khong_nhan)
~ phat_hien(usb_cua_vu)
_Bạn ngồi bệt xuống sàn, ôm cái USB như ôm một con mèo bị lạc. {cho} liếm tay bạn, rồi quay về ngủ._
-> END

// ------------------------------------------------------------
=== chua_te_deadline_2510_chu_nhat ===
# ngay:25 # gio:20:00 # noi:quan_bida_co_ban
_Tối chủ nhật. Quán bida. Ai cũng đồn hôm nay nhiều người đi "phỏng vấn lén" ở tòa nhà kính LL-Entertainment._
dan_dau_tu: Nghe nói anh {quan_ly_idol} được mời 36 triệu một tháng đó. Mang theo Siêu Nhân Hồng.
* [💬 "Anh {quan_ly_idol} sẽ hông đi đâu. Ảnh còn anh {idol_het_thoi}."]
    dan_dau_tu: Sao em biết?
    _Bạn không biết. Bạn chỉ nhớ cảnh ở lửa trại, cái chăn {editor} đắp cho hai người._
    ~ qh("dan_dau_tu", 3)
* [📊 Tính lại cue sheet trong đầu nếu Đêm Hồng thiếu Siêu Nhân Hồng.]
    _Cue 1: Đèn tắt. Cue 2: …không có ai. Bạn gạch hết. Không có cue sheet nào cho một đêm diễn không có người diễn._
    ~ cang_thang(10)
    ~ vu_cue_sheet = vu_cue_sheet + 5
* [🎱 Đánh bida, không nghĩ gì hết.]
    -> chua_te_deadline_mg_bida_mo_dau
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2610_tin_don_cat_giam ===
# ngay:26 # gio:08:45 # noi:phong_hop_sang_tao # bat_buoc
_Họp giao ban thứ 2. Tin đồn "cắt giảm nhân sự nếu Siêu Nhân Hồng thất bại" đã thành tin chính thức trong lòng tất cả mọi người, dù chưa ai nói ra._
truong_phong: Cue sheet Đêm Hồng. Bao nhiêu cue rồi?
_Cue sheet: {vu_cue_sheet} trên 47._
* [😇 Nói thật con số.]
    truong_phong: {vu_cue_sheet}. Ừ. Tớ ghi. Đây là lần đầu cậu nói một con số không tròn. Tớ tin con số không tròn.
    ~ qh("truong_phong", 5)
    ~ uy_tin = uy_tin + 3
* [📊 "80% anh."]
    ~ vu_bao_cao_80++
    { vu_cue_sheet >= 38:
        truong_phong: Tớ xem thử. … Ừ, đúng là gần 80%. Lạ thật.
        ~ qh("truong_phong", 3)
    - else:
        truong_phong: Cho tớ xem.
        _Bạn đưa. {truong_phong} đếm. Đếm lại._
        truong_phong: Cậu đếm 80% theo hệ đếm nào thế?
        ~ uy_tin = uy_tin - 20
        ~ qh("truong_phong", -10)
    }
* [🙏 "Anh {editor} với chị {designer} đang làm giùm phần hình ảnh rồi anh."]
    ~ vu_so_lan_nho_xiu++
    designer: Ủa? Cue sheet mà cũng tui hả? Sửa nhẹ thôi là sửa cái gì ạ?
    ~ qh("designer", -5)
    ~ qh("editor", -5)
    ~ vu_cue_sheet = vu_cue_sheet + 5
- -> chua_te_deadline_2610_chieu_thu

= chua_te_deadline_2610_chieu_thu
_Chiều. Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". Một anh nhân viên ngân hàng bỏ việc đi làm siêu nhân. Cảnh cuối: một người mặc đồ hồng đẩy xe chết máy trong mưa._
_Trong bóng tối phòng chiếu, bạn nghe {thuc_tap_sinh} ngồi hàng sau, thở rất mạnh. Như người đang cố không nói gì._
* [💬 Quay xuống hỏi nhỏ: "Anh {thuc_tap_sinh}, anh sao vậy?"]
    thuc_tap_sinh: Dạ… dạ không sao anh. Phim… phim hay quá ạ.
    _Bạn không hỏi nữa. Nhưng bạn ghi nhớ gương mặt đó._
    ~ qh("thuc_tap_sinh", 5)
* [📋 Ghi chú: phim này làm màn mở đầu Đêm Hồng, cue số 2.]
    ~ vu_cue_sheet = vu_cue_sheet + 2
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2710_ll_ra_tay ===
# ngay:27 # gio:10:00 # noi:sanh_tang_tret # bat_buoc
_10 giờ sáng. Một chiếc xe màu xanh lá chuối đậu trước cổng. Bước xuống là Lưu Lực, CEO LL-Entertainment, vest trắng, tóc vuốt keo, tay cầm tập hồ sơ dày._
_Ông ta đi thẳng vào sảnh, miệng cười như diễn giả. Rồi thấy {chi_dai} đứng ở quầy lễ tân. Tập hồ sơ rơi xuống đất, giấy bay tung tóe._
chi_dai: *(nheo mắt)* Ủa? Anh… Quán Ốc Đêm hả?
_Lưu Lực nhặt giấy với tốc độ của người đang chạy trốn quá khứ. Một tờ bay tới chân bạn: "Đề nghị hợp tác: gấp ba 5 tỷ. Người nhận: Siêu Nhân Hồng."_
* [📄 Nhặt lên, đưa trả, nhìn thẳng vào mắt Lưu Lực.]
    _Lưu Lực nhận tờ giấy, gật đầu cảm ơn, rồi nhìn bạn từ đầu tới chân: "Producer hả? Bên anh cũng cần producer. Việc hôm nay phải xong từ hôm qua."_
    _Bạn nghĩ tới slogan của công ty mình. Và lần đầu tiên bạn thấy tự hào về nó._
* [📸 Chụp ảnh tờ giấy, gửi anh {quan_ly_idol}.]
    quan_ly_idol: Chuyện này để anh lo, đừng ai đăng gì hết! *(gọi lại ngay, hai điện thoại cùng lúc)*
    ~ qh("quan_ly_idol", 5)
* [🦶 Đạp chân lên tờ giấy, giả vờ không thấy.]
    _Lưu Lực nhìn chân bạn. Bạn nhìn trần nhà. {chi_dai} nhìn Lưu Lực. Lưu Lực bỏ luôn tờ giấy, đi thẳng lên tầng 2._
    ~ qh("chi_dai", 5)
- _Chiều, trailer phim ngắn "Người Hùng Không Tên" được đăng lên, đề tên tác giả: {bien_kich}. Cùng lúc, {sales} chạy vào, mặt trắng bệch._
sales: Mấy người! Sữa Chua Hồng Hào gọi tui! Họ muốn tài trợ 1 tỷ cho Đêm Hồng! Thiệt đó!
_Cả phòng cười. Không ai tin. {sales} đứng giữa phòng, lần đầu tiên nói thật, và không ai tin._
* [🤝 "Tui tin. Gửi tui số điện thoại, tui gọi xác nhận."]
    _Bạn gọi. Một giọng cô ở Ven Đô bắt máy: "Dạ đúng rồi con, Sữa Chua Hồng Hào đây." Bạn bật loa ngoài. Cả phòng im._
    ~ qh("sales", 20)
    ~ follow(10000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [😂 Cười theo cả phòng.]
    sales: *(mắt đỏ hoe)* … Ừ. Thôi. Tin chị đi, mấy người sẽ hối hận.
    ~ qh("sales", -5)
- -> END

// ------------------------------------------------------------
=== chua_te_deadline_2710_tin_nhan_2347 ===
# ngay:27 # gio:23:47 # noi:phong_gac_quan_bida # bat_buoc
_23 giờ 47. Dưới nhà, quán bida đang dọn. Điện thoại sáng lên. Không phải group công ty. Là {sieu_nhan_hong}._
sieu_nhan_hong: Bên LL trả gấp ba. Anh {quan_ly_idol} nói anh tự quyết. Anh chỉ muốn hỏi một người thôi. Em muốn anh ở lại không?
{ vu_tin_bi_khoa:
    _Bạn nhìn tin nhắn. Bạn nhớ câu "kịch bản này ai viết vậy". Tay bạn hơi run._
}
* [😇 "Anh ở lại đi. Đêm Hồng mà thiếu anh thì em chiếu cái gì."]
    ~ vu_tra_loi_2710 = "o_lai"
    ~ nguyen_theo_ll = false
    { not vu_tin_bi_khoa:
        ~ vu_tin_that_long = vu_tin_that_long + 10
    }
    sieu_nhan_hong: Ừ. Anh ở lại.
    _1 giờ sáng, {quan_ly_idol} nhắn cho bạn: "Cảm ơn em." Không kèm sticker. Với {quan_ly_idol}, vậy là rất nhiều._
    ~ qh("quan_ly_idol", 10)
* [🌊 Để "đã xem". Sáng mai trả lời.]
    ~ vu_tra_loi_2710 = "da_xem"
    _Sáng mai bạn ngủ quên tới 7 giờ 58. Nguyên đã tự quyết._
    { RANDOM(1, 10) <= 5:
        ~ nguyen_theo_ll = false
        _Nguyên ở lại. Nhưng sáng đó, không có quà hồng trên bàn bạn._
    - else:
        ~ nguyen_theo_ll = true
        _Nguyên nhận lời gặp Lưu Lực. Tin lên mạng lúc 9 giờ: "Siêu Nhân Hồng về LL?"_
        ~ follow(-150000)
    }
    ~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 10
* [🤝 "Chuyện hợp đồng anh hỏi anh {quan_ly_idol} với anh {giam_doc}. Còn chuyện kia… em trả lời anh ngày 31."]
    ~ vu_tra_loi_2710 = "hen_31"
    ~ nguyen_theo_ll = false
    { not vu_tin_bi_khoa:
        ~ vu_tin_that_long = vu_tin_that_long + 5
        ~ vu_hen_dem_hong = true
    }
    sieu_nhan_hong: Anh chờ được. Anh quen chờ rồi.
- -> END
