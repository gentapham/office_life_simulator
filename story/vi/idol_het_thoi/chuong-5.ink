// ============================================================
// IDOL HẾT THỜI · CHƯƠNG 5: "HAI PHỐT MỘT NGÀY" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== idol_het_thoi_2110_confession ===
# ngay:21 # gio:11:15 # noi:tang_1 # bat_buoc
_Trang "Confession {cong_ty}" vừa đăng một bài ẩn danh: "Giám đốc công ty G đã thế chấp biệt thự để trả lương. Công ty đang sống bằng tiền của Siêu Nhân Hồng."_
_Cả tầng 1 im phăng phắc. {hr} và {it} đi từng bàn, hỏi ai dùng máy nào lúc mấy giờ._
{ nguoi_theo_doi < 500000:
    _Mốc 3: 500.000 người theo dõi. Không đạt. Tin đồn cắt giảm nhân sự bắt đầu chạy khắp các bàn._
- else:
    _Mốc 3: 500.000 người theo dõi. Đạt. Nhưng hôm nay không ai còn tâm trí ăn mừng._
}
_Cửa phòng giám đốc đóng. Qua vách kính, bạn thấy anh {giam_doc} ngồi im, nhìn tấm bằng "Doanh nhân của năm" treo trên tường._
* [🚪 Gõ cửa phòng giám đốc, mang vào một ly bạc xỉu.]
    giam_doc: *(ngẩng lên)* Bạc xỉu à. Em còn nhớ.
    _Bạn không nói gì. Anh {giam_doc} cũng không. Hai người ngồi uống, như năm 2015, chỉ khác là không ai hát._
    giam_doc: {idol_het_thoi} này. Nếu công ty… thì hợp đồng em là tờ giấy vô giá trị đấy. Em tính đường khác đi.
    idol_het_thoi: Em tính rồi. Em ở lại.
    ~ qh("giam_doc", 15)
    ~ phat_tt(-8)
    ~ tien_cong(-29000)
* [🔍 Đi theo {hr} và {it} truy tìm admin.]
    it: *(liếc bạn)* Anh rảnh hả?
    _{it} gõ phím rất nhanh, rồi dừng lại ở một dòng log, rồi đóng cửa sổ đó lại nhanh hơn nữa. Bạn không kịp đọc._
    ~ qh("hr", 3)
    ~ qh("it", -2)
* [🕶️ Đăng một tấm selfie: "Dù có chuyện gì, âm nhạc vẫn ở lại."]
    _80.000 hoa sen thả tim. {hong_hot} bình luận: "Anh ơi, đọc phòng đi anh."_
    ~ phat_tt(5)
    ~ qh("hong_hot", -3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2110_karaoke_long ===
# ngay:21 # gio:19:30 # noi:karaoke
_Karaoke Hát Cho Nhau Nghe, phòng số 5. Bạn hẹn {con_ong_chau_cha} ra đây. Ở đây cách âm tốt, không ai nghe lỏm. Bạn biết vì bạn từng nghe lỏm._
con_ong_chau_cha: Anh hẹn em chi vậy anh {idol_het_thoi}? Chill, nói đi.
{ biet(bai_hat_long):
    _Bạn biết bài "Hồng Là Thái Độ" có thật. Bạn biết nó hay. Bạn cũng biết mình đang nợ 54 triệu, và một bài hit có thể trả hết._
- else:
    _Bạn nghe đồn {con_ong_chau_cha} có làm nhạc. Bạn không chắc. Nhưng bạn đang cần một bài hát mới, hơn bất cứ thứ gì._
}
* {biet(bai_hat_long)} [💸 "Cho anh mượn bài đó đi. Anh hát, mình cùng nổi."]
    con_ong_chau_cha: *(cười nhạt)* Mượn là ghi tên ai anh?
    _Bạn im lặng hơi lâu. Đủ lâu để {con_ong_chau_cha} hiểu._
    con_ong_chau_cha: Thôi anh. Bài này em viết cho người khác hát. Người mặc đồ hồng.
    ~ qh("con_ong_chau_cha", -10)
    ~ phat_tt(5)
* [🎶 "Em làm remix 'Công Viên' được hông? Cho anh với Nguyên hát chung."]
    con_ong_chau_cha: *(mắt sáng lên, rồi tắt)* Remix bài anh? Em… em chưa làm cho ai bao giờ. Lỡ dở thì sao?
    idol_het_thoi: Dở thì cả hai cùng thành meme. Anh quen rồi.
    con_ong_chau_cha: *(bật cười)* Ok. Em thử. Đừng nói chú em nha.
    ~ qh("con_ong_chau_cha", 15)
    ~ phat_tt(-5)
* {biet(bai_hat_long)} [📖 "Bài đó hay. Đừng giấu nữa. Ghi tên mình vào. Anh hối hận nhất là mười một năm không dám viết bài mới."]
    con_ong_chau_cha: *(im lặng rất lâu)* …Em ký tên "Rồng" được hông anh?
    idol_het_thoi: Tên gì cũng được. Miễn là của em.
    ~ qh("con_ong_chau_cha", 25)
    ~ phat_tt(-10)
* [🎤 "Thôi khỏi nói. Hát đi. Ai thua thì bao."]
    _Hai người hát tới 11 giờ đêm. Máy chấm {con_ong_chau_cha} 92 điểm. Bạn 78. Như mọi khi._
    ~ qh("con_ong_chau_cha", 5)
    ~ tien_cong(-300000)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2210_kiem_tra_thue ===
# ngay:22 # gio:10:30 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế tới bất ngờ. Trưởng đoàn là Chú Liêm, 55 tuổi, cặp da, kính lão. Cả công ty giả vờ làm việc chăm chỉ. {chua_te_deadline} lần đầu tiên mở Excel._
chu_liem: Cho xem sổ sách. Mục này: "Cát-xê ca sĩ độc quyền đi hát tiệc cưới". 37 khoản trong năm. Không có hóa đơn khoản nào.
_{ke_toan} nhìn bạn. Bạn nhìn anh {quan_ly_idol}. Anh {quan_ly_idol} bước lên trước, hai điện thoại vẫn rung trong túi._
quan_ly_idol: Dạ, lỗi do quản lý sắp xếp sai. Em nhận hết. Ca sĩ không biết gì đâu chú.
* [😶 Đứng im. Để anh {quan_ly_idol} nhận.]
    chu_liem: *(ghi vào biên bản)* Quản lý chịu trách nhiệm. Phạt hành chính, truy thu, biên bản. Ký đây.
    _Anh {quan_ly_idol} ký. Tay không run. Bạn thì run._
    ~ qh("quan_ly_idol", 3)
    ~ phat_tt(3)
* [🙋 Bước lên cạnh anh: "Dạ không. Con nhận tiền mặt, con không xin hóa đơn. Lỗi của con."]
    chu_liem: *(nhìn bạn qua kính lão)* Ca sĩ tự giải trình à. Hiếm đấy. Ngồi xuống đây, khai từng đám một.
    _Bạn khai 37 đám cưới. Nhớ được tên 31 cặp cô dâu chú rể. Chú Liêm nghe tới đám thứ 20 thì bắt đầu cười._
    chu_liem: Thôi được. Truy thu, nhưng không phạt. Lần sau xuất hóa đơn, nghe chưa?
    _Anh {quan_ly_idol} đứng sau lưng bạn, không nói gì. Nhưng bạn nghe anh thở ra một hơi rất dài._
    ~ qh("quan_ly_idol", 15)
    ~ qh("ke_toan", 10)
    ~ phat_tt(-12)
    ~ tien_cong(-1000000)
* [🐕 Lén ra cửa, huýt sáo gọi {cho}.]
    _{cho} chạy lên tầng 2, vẫy đuôi đi thẳng tới Chú Liêm. Chú Liêm leo lên ghế. Biên bản rơi xuống đất. Buổi kiểm tra hoãn 40 phút._
    bac_bao_ve: *(từ dưới cầu thang)* {cho}! Xuống đây ngay!
    ~ qh("cho", 10)
    ~ qh("ke_toan", -5)
    ~ qh("quan_ly_idol", -3)
    _Bốn mươi phút sau, anh {quan_ly_idol} vẫn ký biên bản. Chỉ là ký muộn hơn._
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2210_sau_thue ===
# ngay:22 # gio:19:10 # noi:bai_xe
_Bãi xe. Đoàn thuế về rồi. Anh {quan_ly_idol} ngồi trên yên xe máy, uống ly cà phê thứ sáu trong ngày._
quan_ly_idol: {idol_het_thoi}. Có chuyện này anh hỏi em. Hôm mất điện, {editor} có quay lúc em hát. Đẹp lắm. Anh muốn đăng. Nhưng phải hỏi em.
_Anh mở clip cho bạn coi. Màn hình tối, chỉ có giọng bạn và tiếng cả công ty hát theo. Lệch tông. Thật._
{ not phat_clip_15_quay:
    _Clip chỉ có 40 giây, mờ và rung. Nhưng giọng bạn vẫn nghe rõ._
}
* [😇 "Anh đăng đi. Đừng ghi tên em. Cứ để người ta nghe thôi."]
    quan_ly_idol: *(cười)* Ừ. Để anh lo.
    ~ phat_clip_15_dang = true
    ~ phat_clip_15_quay = true
    ~ qh("quan_ly_idol", 8)
    ~ phat_tt(-8)
* [🕶️ "Đăng đi, mà ghi to tên em. Ghi là 'Huyền thoại trở lại'."]
    quan_ly_idol: *(gõ thử, rồi xóa)* Ghi vậy thì người ta nghe bằng mắt, không nghe bằng tai. Anh ghi tên em thôi nha.
    ~ phat_clip_15_dang = true
    ~ phat_clip_15_quay = true
    ~ phat_tt(3)
* [😶 "Đừng anh. Em hát dở. Không có kính, không có đèn."]
    quan_ly_idol: Em hát hay nhất từ 2015 tới giờ. Mà em nói đừng thì anh không đăng.
    _Anh cất điện thoại. Anh không bao giờ làm gì bạn không muốn. Mười một năm rồi._
    ~ qh("quan_ly_idol", 5)
- quan_ly_idol: Mà nè. Hồi sáng… em đừng nghĩ gì. Anh làm quản lý thì anh nhận. Vậy thôi.
_"Vậy thôi." Anh nói câu đó nhiều tới mức bạn bắt đầu nghi nó không phải "vậy thôi"._
-> END

// ------------------------------------------------------------
=== idol_het_thoi_2310_qua_sinh_nhat ===
# ngay:23 # gio:10:30 # noi:phong_cho
_Sinh nhật Siêu Nhân Hồng, 31 tuổi. Phòng chờ ngập quà hồng. {chua_te_deadline} được nhắc tên trong 6 tấm thiệp, không phải do {chua_te_deadline} tặng._
_Bạn đứng trước cửa phòng chờ, cái phòng từng là của bạn. Trong tay có một món quà._
* [🍌 Một tháp bánh chuối chiên 31 tầng, mua ở xe đẩy đầu đường.]
    sieu_nhan_hong: *(ôm tháp bánh)* Trời ơi anh {idol_het_thoi}! Chuối chiên! Em… em ăn hết từ giờ tới tối luôn!
    _Nguyên chia ngay một nửa cho cả công ty. Tầng trên cùng để riêng cho bạn._
    ~ tien_cong(-310000)
    ~ qh("sieu_nhan_hong", 12)
    ~ phat_tt(-3)
* [💿 Đĩa CD "Công Viên" bản 2015, có chữ ký.]
    sieu_nhan_hong: *(lật đĩa)* Đĩa thiệt nè! Hồi đó em mua không nổi! Em… cảm ơn anh!
    _Đĩa còn nguyên seal. Cả thùng 500 đĩa trong nhà bạn đều còn nguyên seal._
    ~ qh("sieu_nhan_hong", 8)
    ~ phat_tt(3)
* [😶 Không tặng gì. Đi ngang qua.]
    _{sieu_nhan_hong} nhìn theo. Tối nay bạn phải hát chúc mừng sinh nhật Nguyên trên livestream. Đó là việc, không phải quà._
    ~ qh("sieu_nhan_hong", -3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2310_livestream ===
# ngay:23 # gio:19:20 # noi:studio # bat_buoc
_Livestream sinh nhật Siêu Nhân Hồng. 40.000 người đang xem. Bánh kem hồng ba tầng giữa studio. Bạn được giao hát chúc mừng sinh nhật._
_Giữa chương trình, {sieu_nhan_hong} quay thẳng vào camera: "Anh {chua_te_deadline} ơi, em thích anh. Không phải PR đâu." Bình luận chạy kín màn hình: "VũƠiTrảLờiĐi"._
_{chua_te_deadline} đứng sau máy quay, mặt trắng như bột mì._
_Bạn bước lên, cầm micro, chuẩn bị hát. Và cái bánh kem đang ở ngay cạnh chân bạn._
_{cho} lách qua chân máy quay. Đuôi nó quẹt trúng chân bàn bánh._
* [🎤 Hát Cứu Cháy: bắt nhịp "Công Viên" thật to ngay khi bánh nghiêng.]
    { RANDOM(1, 10) <= 6:
        _Bánh đổ. Nhưng bạn đã hát tới "ngày xưa có đôi bạn thân" và cả studio hát theo. Bình luận: "Bài này hay vậy ta", "Kịch bản đỉnh quá"._
        ~ phat_nt(5)
        ~ follow(20000)
        ~ qh("sieu_nhan_hong", 10)
        ~ qh("quan_ly_idol", 8)
    - else:
        _Bánh đổ. Bạn hát. Không ai biết bài. 40.000 người nghe bạn hát giữa một đống kem hồng. Im lặng tuyệt đối._
        _Rồi {sieu_nhan_hong} hát theo. Một mình. Sai lời. "Khoai chiên." Cả studio cười, cười thật._
        ~ phat_nt(1)
        ~ follow(5000)
        ~ qh("sieu_nhan_hong", 5)
    }
* [😤 "Vấp" chân thật mạnh vào bàn bánh, rồi chỉ vào {cho}.]
    _Bánh đổ ụp. Kem hồng văng lên mũ Nguyên. Bạn chỉ tay: "Con chó!" {cho} nhìn bạn. Ánh mắt của một con chó bị oan._
    ~ phat_gianh()
    ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
    ~ follow(-15000)
    ~ qh("cho", -30)
    ~ qh("sieu_nhan_hong", -10)
    ~ phat_tt(5)
    _Ở góc studio, {editor} vẫn đang quay. Góc quay của {editor} thấy rất rõ chân bạn._
* [🐕 Chụp lấy {cho}, bế nó ra khỏi khung hình trước khi bánh đổ.]
    _Bánh vẫn đổ, vì cái chân bàn đã lung lay sẵn. Nhưng không ai đổ tội cho {cho} được: nó đang nằm trong tay bạn, liếm mặt bạn, liếm luôn kính đen._
    _Bình luận: "Ông chú ôm chó dễ thương quá", "Ai vậy?"_
    ~ qh("cho", 15)
    ~ phat_nt(3)
    ~ follow(8000)
- _Anh {quan_ly_idol} đứng sau máy quay, gõ thông cáo "Đó là kịch bản" trên điện thoại. Bốn phút. Anh gõ xong trong ba phút năm mươi giây._
-> END

// ------------------------------------------------------------
=== idol_het_thoi_2410_boc_phot ===
# ngay:24 # gio:09:00 # noi:can_1808 # bat_buoc
~ phat_bi_boc_phot = true
~ phat_fan_ao_khi_boc = phat_fan_ao
~ phat_hien(fan_ao_phat)
hong_hot: *(gọi tới)* Ối dồi ôi anh {idol_het_thoi} ơi! Bài bóc phốt anh lên top rồi! "Ca sĩ một bài thuê 80.000 fan ảo"! Người ta chụp được 500 comment giống y nhau "Anh {idol_het_thoi} đỉnh nóc kịch trần" luôn á!
{ phat_huy_fan_ao:
    _Gói fan ảo bạn đã hủy từ lâu. Nhưng ảnh chụp màn hình thì không ai hủy được._
}
{ phat_clip_15_dang:
    hong_hot: Mà khoan… anh {idol_het_thoi}, cái clip "Ai đang hát trong bóng tối" cũng đang lên xu hướng nè! Người ta đang chửi anh mà vẫn nghe bài của anh! Ủa alo?
    ~ follow(30000)
    ~ phat_nt(5)
}
* [🕶️ "Em biết anh là ai không? Fan anh tự nhiên vậy đó."]
    _Câu đó được chụp lại, đăng kèm bài bóc phốt. Phốt căng gấp đôi._
    ~ phat_nt(-10)
    ~ follow(-40000)
    ~ scandal()
    ~ qh("quan_ly_idol", -5)
* [🤖 Hủy gói "Like Thật 100%". Tự viết một bài nhận lỗi, không qua anh {quan_ly_idol}.]
    _Bạn viết: "Tôi đã thuê fan ảo. Vì tôi sợ bị quên. Tôi xin lỗi những người thật đã ở lại." Bấm đăng. Rồi tắt máy._
    ~ phat_huy_fan_ao = true
    ~ phat_fan_ao = 0
    ~ phat_nt(-5)
    ~ phat_tt(-20)
    ~ follow(-10000)
    _Hai ngày sau, bài nhận lỗi có 300.000 lượt chia sẻ. "Lần đầu thấy idol nhận lỗi thật."_
    ~ phat_nt(15)
* [📞 Gọi anh {quan_ly_idol}: "Anh ơi cứu em."]
    quan_ly_idol: *(nghe máy ngay hồi chuông đầu)* Anh thấy rồi. Em đừng đăng gì hết. Chuyện này để anh lo.
    _Sáu tiếng sau, phốt chìm. Trong thông cáo có một câu: "Do quản lý tư vấn sai." Anh nhận một phần lỗi về mình. Lần thứ bao nhiêu rồi?_
    ~ phat_nt(-3)
    ~ follow(-15000)
    ~ qh("quan_ly_idol", 5)
* {phat_clip_15_dang} [🔒 "Khoan. Cái clip hát trong bóng tối… người ta đang nghe giọng thật mà."]
    _Bạn nhận ra: người ta đang chửi fan ảo, nhưng lại đang nghe giọng thật. Bạn hủy gói fan ảo, rồi đăng lại clip, ghi đúng một dòng:_
    _"Đây là giọng thật. 80.000 kia là giả. Tôi xin lỗi. Ai muốn nghe tiếp, tôi hát tiếp."_
    ~ phat_giong_trong_bong_toi = true
    ~ phat_lat_phot = true
    ~ phat_huy_fan_ao = true
    ~ phat_fan_ao = 0
    ~ phat_nt(12)
    ~ phat_tt(-15)
    ~ follow(40000)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:14:00 # noi:phong_hop_tang_2
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Bàn tròn, khăn trải bàn xanh. Bảng tên xếp cặp: {truong_phong}–{con_ong_chau_cha}, {designer}–{bien_kich}, {sales}–{ke_toan}, {hr}–{thanh_xin_nghi}, {chi_dai}–{thanh_ninh}._
_Riêng một bàn trong góc ghi: "BÀN CHỦ NỢ". {dan_dau_tu} ngồi giữa. Xung quanh là {sales}, {it}, Bác {bac_bao_ve}, {con_ong_chau_cha}, {thanh_xin_nghi}, {thuc_tap_sinh}, {bien_kich}… và bạn._
dan_dau_tu: *(đứng dậy, mở slide)* Kính thưa các chủ nợ. Hôm nay tui trình bày kế hoạch trả nợ. Slide 1: "Lần này là lên thật".
chi_dai: *(từ bàn bên)* {dan_dau_tu}. Slide 2 đi.
_Bạn ngồi đó. Chủ nợ của một người. Con nợ của một tòa chung cư. Sáng nay vừa bị bóc phốt._
* [😇 "Anh {dan_dau_tu}, 500 nghìn của em anh khỏi trả. Mình huề."]
    dan_dau_tu: *(nhìn bạn, mắt rưng rưng)* {idol_het_thoi}… ông… Ông là người đầu tiên xóa nợ cho tui.
    sales: Ủa vậy chị xóa luôn hông ta… Thôi khỏi, chị không có lòng tốt dữ vậy.
    ~ qh("dan_dau_tu", 20)
    ~ phat_tt(-5)
* [💸 "Trả em liền. Em đang cần."]
    dan_dau_tu: *(móc ví, đưa 500 nghìn, mặt đau khổ)* Đây. Ông là người đầu tiên tui trả. Ghi nhận nha.
    ~ tien_cong(500000)
    ~ qh("dan_dau_tu", -3)
* [🤝 "Hay anh lấy công trừ nợ: lọc giùm em số fan ảo còn sót."]
    dan_dau_tu: *(gật đầu như máy)* Được! Tui có bộ lọc xịn. Đây là đáy, đáy thật rồi, từ đây chỉ có lên!
    ~ qh("dan_dau_tu", 8)
    { phat_fan_ao > 0:
        ~ phat_fan_ao = phat_fan_ao / 2
    }
- _Cuối buổi, {chi_dai} bắt từng cặp bắt tay nhau. Bạn không có cặp. Bạn bắt tay cả bàn chủ nợ._
-> END

// ------------------------------------------------------------
=== idol_het_thoi_2510_ba_gio_sang ===
# ngay:25 # gio:03:00 # noi:cau_thang_sky_ao # bat_buoc
_3 giờ sáng. Bạn không ngủ được. Đi xuống cầu thang bộ Sky Ảo hóng gió. Ở chiếu nghỉ tầng 9, anh {quan_ly_idol} ngồi đó, laptop trên đùi, hai điện thoại cắm sạc dự phòng._
_Màn hình laptop: 47 bài báo đang chờ gỡ. Ly cà phê thứ bao nhiêu thì không ai đếm nữa._
_Bạn ngồi xuống bậc thang. Không đeo kính._
idol_het_thoi: Anh {quan_ly_idol}. Hai đêm rồi anh hông ngủ. Hồi trước em bị phốt anh cũng vậy. Sao anh lo cho em dữ vậy?
_Anh {quan_ly_idol} gõ thêm vài chữ. Rồi dừng tay._
{ qh_quan_ly_idol >= 60 and phat_tinh_tuong <= 50:
    quan_ly_idol: *(im lặng rất lâu, rồi đưa điện thoại cho bạn)* Em coi đi.
    _Màn hình là nhóm "Hội Cá Viên Chiên", 300 thành viên. Tên admin: "ChuoiChien89". Tài khoản đang đăng nhập: "ChuoiChien89"._
    _Bạn kéo lên. Mười năm tin nhắn. Đêm nào cũng có một câu: "Anh {idol_het_thoi} hôm nay hát ở đám cưới quận 3." "Anh {idol_het_thoi} hôm nay khai trương tiệm nail." "Anh {idol_het_thoi} hôm nay vẫn hát."_
    ~ phat_biet_chuoichien89 = true
    -> doc_xong
- else:
    -> tra_loi_thuong
}

= tra_loi_thuong
quan_ly_idol: Thì anh là quản lý của em mà. Lo là việc của anh.
_Anh nói câu đó nhẹ như đã tập nhiều năm._
* [😇 "Vậy để em ngồi đây với anh. Lo là việc của em luôn."]
    _Bạn ngồi đó tới sáng. Không giúp được gì, vì bạn không biết gỡ bài báo. Nhưng cứ mười phút bạn lại rót cà phê._
    ~ qh("quan_ly_idol", 15)
    ~ phat_tt(-5)
    ~ nghi(-20)
* [💬 "Hông phải. Quản lý khác hông vậy đâu anh."]
    quan_ly_idol: *(cười, không nhìn bạn)* Quản lý khác hông quản lý em.
    _Bạn chưa hiểu hết. Nhưng bạn không đi về._
    ~ qh("quan_ly_idol", 10)
* [🕶️ "Ừ. Cảm ơn anh. Em lên ngủ đây."]
    _Bạn đi lên. Anh {quan_ly_idol} ngồi lại một mình rất lâu._
    ~ qh("quan_ly_idol", 2)
- -> END

= doc_xong
* [😶 Không nói gì. Chỉ ngồi xuống sát cạnh anh.]
    _Hai người ngồi trên bậc thang tới khi trời sáng. Laptop sập nguồn lúc 5 giờ. Không ai cắm sạc._
    ~ qh("quan_ly_idol", 25)
    ~ phat_tt(-15)
* [💬 "Đêm nào cũng đăng… mười năm hả anh?"]
    quan_ly_idol: Có đêm quên. Mười năm quên chắc… ba đêm.
    idol_het_thoi: Ba đêm đó em hát ở đâu?
    quan_ly_idol: *(cười)* Một đêm em bệnh. Hai đêm em say, hát ở karaoke. Anh nhớ.
    ~ qh("quan_ly_idol", 20)
    ~ phat_tt(-10)
* [🕶️ "Trời, vậy là 300 fan thật đó là… anh dụ vô hả?"]
    quan_ly_idol: Anh dụ người ta vô. Còn ở lại là tại em hát.
    ~ qh("quan_ly_idol", 12)
    ~ phat_tt(-5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2510_studio_0905 ===
# ngay:25 # gio:15:00 # noi:studio_0905
_Chủ nhật. Bạn ghé Studio 0905 trả cục sạc dự phòng anh {quan_ly_idol} bỏ quên ở bậc thang. Gõ cửa không ai mở. Anh đi đâu đó từ sáng, nói "đi gặp đối tác"._
_Năm 2016, anh đưa bạn một chìa khóa dự phòng, "lỡ em say không về được nhà". Bạn chưa dùng lần nào._
_Bạn mở cửa. Phòng nhỏ. Năm cục sạc. Một cái điện thoại thứ ba trên bàn, đang sáng: "Sơn (1 giờ sáng)". Bạn đi tìm ổ cắm để cắm cục sạc vào._
_Ổ cắm ở sau tủ đầu giường. Ngăn kéo tủ hé mở._
* [🔍 Kéo ngăn kéo ra, chỉ để đẩy nó vào cho gọn.]
    _Trong ngăn kéo có một tấm ảnh lồng khung. Bạn, 19 tuổi, đêm trao giải 2015, cầm cúp, cười như không bao giờ hết thời._
    _Mặt kính khung ảnh không có một hạt bụi._
    ~ phat_thay_anh = true
    ~ phat_hien(thai_thuong_phat)
    -> thay_anh
* [😶 Đẩy ngăn kéo vào, không nhìn. Cắm sạc rồi về.]
    _Bạn để cục sạc trên bàn, kèm tờ giấy: "Trả anh. Ngủ đi. {idol_het_thoi}."_
    ~ qh("quan_ly_idol", 5)
    -> END

= thay_anh
* [📷 Đặt lại y chỗ cũ. Đóng ngăn kéo. Đi về.]
    _Trên đường về, bạn đi ngang tiệm chuối chiên ở cổng chung cư. Bạn đứng đó rất lâu, không mua gì._
    ~ phat_tt(-10)
* [📷 Cầm tấm ảnh lên, nhìn rất lâu.]
    _Bạn nhớ ra: người vỗ tay to nhất đêm đó, người đắp áo khoác cho bạn ở hội chợ, người trả lời tin nhắn trong 4 giây. Cùng một người._
    _Bạn đặt ảnh lại. Tay hơi run._
    ~ phat_tt(-15)
    ~ qh("quan_ly_idol", 10)
* [📱 Chụp lại tấm ảnh.]
    _Bạn chụp. Rồi xóa. Rồi khôi phục từ thùng rác. Rồi để đó._
    ~ phat_tt(-5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2610_chieu_thu ===
# ngay:26 # gio:15:30 # noi:phong_hop_tang_2
_Thứ 2. Tin đồn "cắt giảm nhân sự nếu Siêu Nhân Hồng thất bại" chạy khắp công ty. {hr} đi ngang bàn nào là bàn đó tắt màn hình._
_Chiều: chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". Phim về một người mặc đồ hồng đẩy xe chết máy giùm một người lạ 2 cây số trong mưa. {thuc_tap_sinh} ngồi xem, mắt đỏ hoe. Đề tên biên kịch: {bien_kich}._
_Phim xong, {giam_doc} quay sang {editor}: "Kênh Diu-túp của em, anh mua 200 triệu. Anh không ép, tùy em."_
_{editor} không nói gì. Phòng họp im lặng._
* [💬 "Anh {giam_doc}, kênh của người ta mà. Như bài hát của em là của em."]
    giam_doc: *(nhìn bạn, lâu)* …Ừ. Anh nói thế thôi.
    editor: *(nhìn bạn, gật đầu rất nhẹ)*
    ~ qh("editor", 15)
    ~ qh("giam_doc", -3)
    ~ phat_tt(-5)
* [🕶️ "200 triệu? Năm 2015 giá kênh của em là…"]
    _Không ai muốn nghe giá kênh của bạn năm 2015. {chi_dai} lườm bạn một cái làm bạn ngừng giữa câu._
    ~ phat_tt(3)
* [😶 Im lặng. Nghĩ về hợp đồng của mình, hết hạn sau 5 ngày.]
    _Nếu phim ngắn có giá, nếu kênh của {editor} có giá, thì bạn có giá bao nhiêu? Thứ 6 sẽ biết._
    ~ cang_thang(8)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_2710_thai_bi_moi ===
# ngay:27 # gio:11:00 # noi:phong_nghe_si # bat_buoc
~ phat_hien(ll_moi_thai)
_LL-Entertainment ra tay. Cả công ty biết tin lúc 10 giờ: Lưu Lực mời Siêu Nhân Hồng với giá gấp ba._
hong_hot: *(chạy vào, thì thầm)* Anh {idol_het_thoi}… nghe gì chưa? LL mời luôn anh {quan_ly_idol}. 36 triệu một tháng, gấp đôi. Điều kiện: mang theo Nguyên.
_Mang theo Nguyên. Không có tên bạn. Lần đầu tiên, bạn sợ một chuyện không liên quan tới sự nổi tiếng._
_Anh {quan_ly_idol} đi đâu đi đó. Mười một năm. Nếu anh đi, sáng mai ai gọi bạn dậy?_
* [🏃 Đi tìm anh {quan_ly_idol}. Nói thẳng: "Anh đừng đi."]
    _Anh {quan_ly_idol} đang ở sân thượng, nói điện thoại. Thấy bạn, anh cúp máy, không nói "khoan anh nghe máy chút" như mọi khi._
    idol_het_thoi: Anh đừng đi. Em… em hông biết nói sao. Mà anh đừng đi.
    quan_ly_idol: *(nhìn bạn rất lâu)* Em nói câu đó… lần đầu đó {idol_het_thoi}.
    ~ phat_xin_thai_o_lai = true
    ~ qh("quan_ly_idol", 20)
    ~ phat_tt(-15)
* [😤 "Đi thì đi. Em tự lo được."]
    _Bạn nói câu đó với {hong_hot}. {hong_hot} kể lại cho cả tầng. Tới trưa, anh {quan_ly_idol} cũng nghe._
    ~ qh("quan_ly_idol", -20)
    ~ phat_tt(10)
* [🚪 Lên phòng giám đốc: "Anh {giam_doc}, tăng lương cho anh {quan_ly_idol} đi. Trừ vô lương em cũng được."]
    giam_doc: *(bỏ kính xuống)* Lương em có 8 triệu, trừ thế nào…
    giam_doc: Thôi được. Anh nói chuyện với {quan_ly_idol}. Mà em đi nói với nó trước đi. Nó cần nghe em hơn nghe anh.
    ~ qh("giam_doc", 8)
    ~ qh("quan_ly_idol", 10)
    ~ phat_tt(-8)
* {phat_biet_chuoichien89} [🔒 "Anh là ChuoiChien89. Anh mà đi thì tối nay ai đăng bài cho 300 người kia?"]
    quan_ly_idol: *(bật cười, mắt đỏ)* Em… em lấy cái đó ra để giữ anh hả?
    idol_het_thoi: Ừ. Em còn nhiều thứ để lấy ra lắm.
    ~ phat_xin_thai_o_lai = true
    ~ qh("quan_ly_idol", 25)
    ~ phat_tt(-10)
- { phat_xin_thai_o_lai or qh_quan_ly_idol >= 60:
    ~ phat_thai_o_lai = true
- else:
    ~ phat_thai_o_lai = false
}
-> END

// ------------------------------------------------------------
=== idol_het_thoi_2710_luu_luc ===
# ngay:27 # gio:15:10 # noi:sanh_cong_ty
_Sảnh tầng trệt. Một người vest trắng, tóc vuốt keo bước vào, tay ôm tập hồ sơ bìa xanh lá chuối. Lưu Lực._
_Lưu Lực đi ngang qua {chi_dai}. Khựng lại. Tập hồ sơ rơi xuống sàn, giấy tờ tung tóe. {chi_dai} chỉ nhìn, không nói gì. Lưu Lực lau mồ hôi._
_Bạn cúi xuống nhặt giùm một tờ. Lưu Lực nhìn bạn từ đầu tới chân._
luu_luc: À. Anh {idol_het_thoi}. Ca sĩ… đám cưới.
* [🕶️ "Em biết anh là ai không?"]
    luu_luc: *(cười)* Biết chứ. Năm 2018 tôi mời {quan_ly_idol} về LL. {quan_ly_idol} nói: "Mang theo {idol_het_thoi} thì tôi đi." Tôi không cần ca sĩ một bài, nên {quan_ly_idol} ở lại.
    luu_luc: Lần này tôi không mời anh. {quan_ly_idol} sẽ phải chọn. Chào anh.
    _Bạn đứng giữa sảnh, tay vẫn cầm tờ giấy. Năm 2018. Anh {quan_ly_idol} chưa bao giờ kể._
    ~ phat_tt(-10)
    ~ qh("quan_ly_idol", 10)
* [😇 Đưa lại tờ giấy, không nói gì.]
    luu_luc: Cảm ơn. Lịch sự đấy. Tiếc là lịch sự không bán được vé.
    ~ phat_tt(-3)
* [😤 "Anh muốn lấy Nguyên thì lấy. Đừng đụng tới anh {quan_ly_idol}."]
    luu_luc: *(nhướn mày)* Ồ. Tôi tưởng anh ghét Nguyên lắm cơ mà. Thú vị. Rất thú vị.
    ~ qh("quan_ly_idol", 5)
    ~ phat_tt(-5)
- _Lưu Lực đi lên lầu. Bác {bac_bao_ve} đứng ở cửa chòi, nhìn theo, uống một ngụm trà đá._
bac_bao_ve: Người gì mà mùi như lá chuối.
-> END
