// ============================================================
// HR: TUẤN · CHƯƠNG 4: "VŨNG TÀU ĐỔ BỂ" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== hr_1710_xe_khach ===
# ngay:17 # gio:06:30 # noi:cong_cong_ty # bat_buoc
_6 giờ 30 sáng thứ 7. Ngày Quốc tế Xóa nghèo. Trước cổng công ty là một chiếc xe khách thường, không máy lạnh. Ghế bọc da… giả, rách một nửa._
_Bạn đề xuất 120 triệu. {ke_toan} cắt còn 60. Kết quả là chiếc xe này, và 10 phòng khách sạn hướng thẳng ra… bãi xe._
dan_dau_tu: Từ hôm nay anh thoát nghèo! Coin của anh x5 rồi! Chuyến này anh bao nước mía!
ke_toan: Anh {dan_dau_tu} trả nợ trước rồi bao sau.
_Bạn là trưởng đoàn. Trên tay là danh sách 22 người, 1 con chó, và 1 tờ giấy trắng: sơ đồ phòng._
sieu_nhan_hong: {hr} ơi! Cho anh ở chung phòng với nhân viên mới nha! Để gắn kết tập thể!
ran_doc: *(mặt cứng đờ, cười)* Dạ… em… sao cũng được ạ.
* [😊 "Được luôn! Gắn kết là đúng tinh thần team building!"]
    ~ qh("sieu_nhan_hong", 5)
    _{ran_doc} cười. Bạn thấy bàn tay em nó nắm chặt quai ba lô tới trắng bệch._
* {hr_biet_xom_cay_me} [🔒 Nhớ tới tấm ảnh xóm Cây Me. "Để anh xem lại đã nha."]
    _Bạn nhìn {ran_doc}. {ran_doc} nhìn xuống đất._
    sieu_nhan_hong: Đi mà {hr}! Anh hứa không ngáy!
    _Cuối cùng vẫn là phòng chung, vì không còn phòng nào khác. Nhưng bạn dặn {ran_doc}: "Có gì gọi anh, phòng 203."_
    ~ qh("ran_doc", 5)
    ~ hr_nghe(3)
- _Xe lăn bánh. Bạn mở tờ giấy trắng. Đã tới lúc xếp phòng._
-> hr_mg_xep_phong_mo

// ------------------------------------------------------------
=== hr_1710_tro_choi ===
# ngay:17 # gio:15:00 # noi:bai_bien_vung_tau # bat_buoc
_Bãi biển Vũng Tàu, nắng gắt. Trò chơi tập thể bắt buộc, do bạn tổ chức, do {chi_dai} cầm loa._
chi_dai: Trò 1: Kéo co các phòng ban! Thua thì nhảy xuống biển!
_Phòng Sản xuất kéo với phòng Nghệ sĩ. {truong_phong} chỉ đạo bằng cách… họp ngay giữa sân. Phòng Nghệ sĩ thắng nhờ {sieu_nhan_hong} một mình bằng ba người._
chi_dai: Trò 2: Truyền bánh chuối chiên bằng miệng! Không dùng tay!
_Bánh chuối chiên đi qua miệng {thuc_tap_sinh}, {con_ong_chau_cha}, {hong_hot}… rồi {cho} lao vào giữa, đớp gọn cả miếng, vẫy đuôi._
chi_dai: {cho} thắng! Ai cãi?
* [📱 Quay clip {sieu_nhan_hong} chơi trò tập thể, gửi {hong_hot} đăng.]
    { hr_vi_pham_phong == 0:
        ~ follow(50000)
        ~ hr_clip_tro_choi = true
        _Clip "Siêu Nhân Hồng thua chó trong trò truyền bánh" lên xu hướng Tóp-tóp. {hong_hot} hét lên mỗi 5 phút._
    - else:
        ~ follow(20000)
        _Clip đăng lên. Nhưng ai cũng mệt mỏi, mặt ai cũng như vừa cãi nhau tối qua… à không, sắp cãi nhau tối nay. Clip được ít người xem hơn._
    }
    ~ qh("hong_hot", 5)
* [🎉 Hoạt Động Gắn Kết: "Trò cuối: cả đoàn nắm tay nhau thành vòng tròn!"]
    { RANDOM(1, 2) == 1:
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
        ~ cang_thang(-10)
        ~ follow(15000)
        ~ hr_so(-5)
        _Một vòng tròn 22 người trên bãi biển, hoàng hôn phía sau. {chi_dai} nắm tay {thanh_ninh} mà không để ý. Hai người nhận ra rồi buông ra cùng lúc. Nhưng đã có ảnh._
    - else:
        ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
        ~ hr_so(3)
        _Không ai muốn nắm tay ai. Vòng tròn biến thành một đường thẳng, rồi biến thành 5 nhóm nhỏ đi uống nước mía._
    }
* [😶 Đứng ngoài giữ dép cho cả đoàn.]
    _22 đôi dép. Bạn ngồi canh. Không ai sợ người giữ dép._
    ~ hr_so(-2)
    ~ qh("thuc_tap_sinh", 3)
- -> END

// ------------------------------------------------------------
=== hr_1710_lua_trai ===
# ngay:17 # gio:21:00 # noi:bai_bien_vung_tau # bat_buoc
_Đêm lửa trại. Bia lon, mực nướng{hr_hai_san:, và một khay hải sản nướng mà bạn được nhà nghỉ tặng vì "trưởng đoàn xếp phòng giỏi quá"|}. Trò "nói thật"._
{ hr_hai_san:
    ~ an(40)
}
sales: *(say, đứng lên ghế)* Chị hứa! Đại Nhạc Hội chị mời ca sĩ nổi tiếng nhất nước về hát! Chắc kèo!
giam_doc: *(say hơn)* Anh hứa! Tăng lương cả công ty!
_{hong_hot} quay clip. {ke_toan} ôm đầu._
_Tới lượt {sieu_nhan_hong}. Ánh lửa hắt lên bộ đồ hồng._
sieu_nhan_hong: Hồi nhỏ… anh từng nhốt một đứa nhỏ trong nhà kho. Nó khóc cả buổi. Anh không nhớ tên nó nữa. Anh… đi giúp người bây giờ, chắc một phần vì vậy.
_Phía bên kia đống lửa, {ran_doc} đứng dậy, đi thẳng ra biển. Không ai để ý. Trừ bạn._
_Rồi tới lượt bạn. 21 cặp mắt, 1 cặp mắt chó. Ai cũng chờ HR nói về "cái danh sách". Tin đồn đã có từ tuần trước._
* [🍵 Nói về trà: "Tui có 40 loại trà. Loại tui thích nhất là trà Zzz, uống để ngủ. Vì tui hay mất ngủ."]
    ~ hr_noi_that_lua_trai = "tra"
    hong_hot: Ủa… sao HR mất ngủ?
    hr: Vì nghĩ tới mọi người.
    _Cả đám im lặng. Không ai biết đây là câu đáng sợ hay câu dễ thương._
    ~ hr_so(-3)
* [😢 Nói về 11 người: "7 năm, tui mời 19 người uống trà, 11 người nghỉ việc. Tui nhớ tên từng người."]
    ~ hr_noi_that_lua_trai = "11_nguoi"
    _Bạn đọc 11 cái tên. Có người {chi_dai} còn nhớ, có người chỉ {bac_bao_ve} còn nhớ._
    chi_dai: Ông… nhớ hết hả?
    hr: Nhớ hết. Tui mời họ uống trà vì muốn nói chuyện. Lần nào cũng thành chuyện khác.
    ~ hr_so(-12)
    ~ hr_nghe(10)
    ~ qh("chi_dai", 10)
* [📂 Nói thật: "Có một danh sách. Tui đang cố để nó trống."]
    ~ hr_noi_that_lua_trai = "that"
    _Tiếng sóng. Tiếng lửa lách tách. Rồi 21 tiếng hỏi cùng một lúc._
    giam_doc: *(tỉnh rượu ngay lập tức)* {hr}!
    ~ hr_tu_thu_danh_sach = true
    ~ hr_ro_ri(-30)
    ~ hr_so(-15)
    ~ qh("giam_doc", -20)
    ~ phat_hien(danh_sach_cat_giam)
    ~ hr_nghe(8)
    chi_dai: Ông nói "đang cố để nó trống". Tui tin ông. Tụi bây cũng làm việc cho đàng hoàng vô, cho nó trống luôn!
    ~ follow(10000)
- _Đêm đó {hong_hot} đang livestream đúng lúc {sieu_nhan_hong} kéo mũ lên quạt cho mát. Ba giây. Rồi cái mũ lại được kéo xuống._
-> END

// ------------------------------------------------------------
=== hr_1710_nua_dem ===
# ngay:17 # gio:23:45 # noi:khach_san_vung_tau
_Gần nửa đêm. Phòng 203. Bạn vừa nằm xuống thì điện thoại rung._
{ hr_vi_pham_phong > 0:
    -> hr_1710_nua_dem.s_cai_nhau
- else:
    -> hr_1710_nua_dem.s_yen_binh
}

= s_cai_nhau
_Cuộc gọi 1: {chi_dai}. "Tuấn, nhỏ {thanh_ninh} ngáy." Cuộc gọi 2: {truong_phong}. "Anh muốn họp với {con_ong_chau_cha} về vấn đề điều hòa." Cuộc gọi 3: {dan_dau_tu}, giọng thì thầm: "Ba chủ nợ đang ngồi đếm tiền trên giường anh."_
_Bạn chạy qua chạy lại giữa 3 tầng trong dép tổ ong._
* [🗣️ Ngôn Ngữ Nhân Sự: "Mình cùng nhìn lại hành trình đêm nay nha mọi người."]
    { RANDOM(1, 2) == 1:
        _Mọi người mệt quá, ngủ luôn. Ngôn Ngữ Nhân Sự có tác dụng như thuốc ngủ._
        ~ cang_thang(5)
    - else:
        _Cả hai bên cùng quay sang bạn. "Ông im đi!" Đây là lần đầu {chi_dai} và {thanh_ninh} đồng ý với nhau về một chuyện._
        ~ qh("chi_dai", -5)
        ~ qh("thanh_ninh", -5)
        ~ cang_thang(10)
    }
* [🛏️ Đổi phòng cho {dan_dau_tu}: cho ảnh ngủ phòng mình, mình ngủ ghế sảnh.]
    ~ qh("dan_dau_tu", 10)
    ~ nghi(-20)
    ~ hr_nghe(5)
    _Bạn ngủ trên ghế sảnh khách sạn, cạnh {cho}. Nửa đêm, {bac_bao_ve} gọi từ công ty: "Bác bắt gặp người lạ trong phòng giám đốc. Đi rồi. Bác chỉ báo thế thôi."_
- -> END

= s_yen_binh
_Không ai gọi. Lần đầu tiên trong 7 năm team building, không ai gọi trưởng đoàn lúc nửa đêm._
_Bạn đứng ở ban công phòng 203. Ngoài kia là bãi xe, xa hơn là biển. Tiếng {chi_dai} cười ở phòng bên._
* [🍵 Pha một ly trà Zzz, ngủ.]
    ~ nghi(30)
    ~ cang_thang(-10)
* [📱 Gọi về chòi bảo vệ hỏi thăm {bac_bao_ve}.]
    bac_bao_ve: Bác đây. Ở công ty có người lạ vào phòng giám đốc lúc 11 giờ. Bác đuổi rồi. Không thấy mặt. Cháu ngủ đi.
    ~ qh("bac_bao_ve", 5)
    ~ hr_ro_ri(5)
    _Phòng giám đốc. Nơi có tập hồ sơ hồng thứ hai._
- -> END

// ------------------------------------------------------------
=== hr_1810_xe_ve ===
# ngay:18 # gio:14:00 # noi:xe_khach # bat_buoc
_Xe về. Nóng. Chật. Ai cũng giận ai._
dan_dau_tu: *(nhìn điện thoại, mặt trắng bệch)* Hồng Coin… về 0. Người tạo ôm tiền biến mất rồi. Còn cái nịt.
con_ong_chau_cha: *(nhìn điện thoại, mặt còn trắng hơn)* Penthouse của anh… đang bị rao bán trên mạng. Chú anh không nói gì với anh hết.
_Rồi ai đó ở hàng ghế cuối nói to: "Mà ai xếp phòng vậy trời?"_
{ hr_vi_pham_phong > 0:
    _Cả xe quay lên nhìn bạn. 21 cái nhìn. Ánh nắng chiếu vào mặt bạn như đèn tra khảo._
    ~ hr_so(5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
- else:
    _Không ai trả lời. Phòng xếp đẹp, nhưng người ta vẫn cần ai đó để giận. Vài người liếc lên ghế trưởng đoàn._
}
* [😇 "Là tui. Tui xin lỗi. Lần sau cho mọi người tự chọn phòng."]
    ~ hr_so(-5)
    ~ hr_nghe(3)
    chi_dai: Ờ. Ít ra ông dám nhận.
* [🍵 Mở thùng giữ nhiệt: trà đá chanh cho cả xe.]
    ~ hr_tra()
    ~ uong(20)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
    _Nóng 37 độ, trà đá chanh là thứ duy nhất trên đời không ai từ chối, kể cả từ HR._
* [🤝 Ngồi xuống cạnh {dan_dau_tu}, không nói gì, đưa ảnh một ổ bánh mì.]
    ~ qh("dan_dau_tu", 8)
    dan_dau_tu: Cảm ơn em. Đây là đáy. Đáy thật rồi. *(ăn bánh mì, mắt đỏ hoe)*
    _Còn {con_ong_chau_cha} thì ngồi nhìn ra cửa sổ suốt 2 tiếng, không gọi chú lần nào._
- -> END

// ------------------------------------------------------------
=== hr_1810_toi_604 ===
# ngay:18 # gio:21:30 # noi:can_ho_604
_Chủ nhật, tối. Căn 604. Valy chưa mở. Bạn mở laptop. Group "Hội Anti Sếp" đã có người chụp màn hình gửi bạn (bạn không ở trong group, nhưng luôn có người gửi)._
_Chủ đề mới: "HR xếp phòng hay xếp án?" 47 bình luận._
{ hr_tu_thu_danh_sach:
    _Chủ đề thứ hai: "Danh sách cắt giảm có thật! Ổng tự nói!" 112 bình luận. Bình luận đứng đầu: "Ổng nói đang cố để nó trống mà. Tui tin."_
}
* [🍵 Đóng laptop. Pha trà. Mai tính.]
    ~ cang_thang(-5)
* [✍️ Viết đề xuất "buổi trà làm lành" gửi {giam_doc}.]
    _"Kính gửi anh {giam_doc}. Em đề xuất một buổi trà chiều thứ 2, tự nguyện, không ghi sổ, không kỷ luật…" Bạn viết tới 1 giờ sáng._
    ~ nghi(-10)
    ~ uy_tin = uy_tin + 2
- -> END

// ------------------------------------------------------------
=== hr_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp giao ban. Không ai nhìn mặt ai. {truong_phong} nhìn slide. {con_ong_chau_cha} nhìn điện thoại. {chi_dai} nhìn {thanh_ninh} như nhìn kẻ thù. {dan_dau_tu} nhìn… vào hư vô._
truong_phong: Mình chuẩn bị cho 20/10 nhé. Sinh nhật công ty 16 tuổi, Ngày Phụ nữ. Ai lo quà?
_Không ai giơ tay._
* [🙋 "Phòng nhân sự lo quà. Và chiều nay em xin tổ chức 'buổi trà làm lành' ở pantry. Ai muốn thì tới."]
    ~ hr_tra_lam_lanh = true
    truong_phong: Ờ… "làm lành" à? Ừ, cũng được. Mình take note.
    hong_hot: *(thì thầm)* Uống trà với HR để làm lành… hay để làm đơn?
* [😶 "Dạ, phòng nhân sự lo quà."]
    _Chỉ lo quà. An toàn. Nhưng chiều nay pantry vẫn lạnh như tủ đá._
- -> END

// ------------------------------------------------------------
=== hr_1910_tra_lam_lanh ===
# ngay:19 # gio:16:00 # noi:pantry # dieu_kien:hr_tra_lam_lanh
_4 giờ chiều. Pantry. Bạn bày 22 cái ly, 5 ấm trà: hoa cúc, sen, ô long, bạc hà, và trà Zzz phòng khi có người cần ngủ._
{ hr_do_lang_nghe >= 50:
    -> hr_1910_tra_lam_lanh.s_dong
- else:
    -> hr_1910_tra_lam_lanh.s_vang
}

= s_dong
_4 giờ 05. {chua_te_deadline} ló đầu vào. Rồi {thuc_tap_sinh}. Rồi {hong_hot} kéo theo {designer}. Rồi {chi_dai}, rồi {ke_toan}._
_4 giờ 30, pantry chật. Không ai bị mời. Ai cũng tự tới._
~ hr_so_nguoi_tu_len = hr_so_nguoi_tu_len + 6
~ follow(30000)
~ tinh_than_cong_ty = tinh_than_cong_ty + 10
~ hr_so(-10)
chi_dai: Thôi, {thanh_ninh}, chị xin lỗi vụ nửa đêm. Em ngáy thiệt, nhưng chị nói hơi to.
thanh_ninh: Dạ… em cũng xin lỗi chị. Chị nói… chuẩn quá chị ơi.
chi_dai: Đó! Lại nịnh!
_Cả pantry cười. Ai đó đăng ảnh lên story: "Trà làm lành ở {cong_ty}". Người ngoài thả tim, rồi tò mò vào xem trang Siêu Nhân Hồng._
* [🍵 Rót ly cuối cùng cho mình. Lần đầu uống trà ở công ty mà không phải ngồi một mình.]
    ~ cang_thang(-15)
    ~ hr_nghe(5)
* [😊 Cười.]
    _Bạn cười. {thuc_tap_sinh} nhìn bạn, rồi cười lại. Không chạy._
    ~ hr_so(-5)
- -> END

= s_vang
_4 giờ 05. Không ai. 4 giờ 30. Không ai. 5 giờ. Tiếng móng chân lách cách trên sàn._
cho: Gâu.
_{cho} ngồi xuống trước ấm trà Zzz, ngửi, rồi nằm dài dưới chân bạn._
* [🍵 Rót cho {cho} một chén nước lọc. Ngồi với nó tới 6 giờ.]
    ~ qh("cho", 10)
    ~ cang_thang(5)
    _Ít ra cũng có một người tới. Một "người"._
* [📓 Ghi vào sổ: "Buổi trà làm lành: 1 khách."]
    _Bạn gạch chữ "khách", viết lại: "1 bạn". {cho} vẫy đuôi._
    ~ qh("cho", 5)
- -> END

// ------------------------------------------------------------
=== hr_2010_qua_chi_em ===
# ngay:20 # gio:09:00 # noi:van_phong_tang_1 # bat_buoc
_Ngày Phụ nữ Việt Nam + sinh nhật công ty 16 tuổi. Bạn đứng giữa văn phòng với 7 phần quà cho 7 chị em: {thanh_ninh}, {hong_hot}, {ke_toan}, {bien_kich}, {designer}, {sales}, {chi_dai}._
_Ngân sách quà: {ke_toan} duyệt 700.000đ. 100.000đ một người. Quà giống hệt nhau: một hộp trà hoa hồng và một tấm thiệp._
dan_dau_tu: Chúc các chị em 8386! Phát lộc phát tài!
_Rồi drama bắt đầu. {thanh_ninh} được {giam_doc} tặng riêng một bó hoa 99 bông. {chi_dai} nhìn bó hoa. {sales} khoe hộp quà "từ Mr. Kevin Trộn" (bạn thấy rõ nhãn siêu thị mini)._
designer: Ủa, quà của tui sao hộp trà móp vậy anh?
* [🍵 "Đổi cho em hộp của anh nè. Anh mua dư một hộp cho mình."]
    ~ qh("designer", 8)
    ~ hr_nghe(3)
    designer: Ủa… anh tự mua trà tặng mình hả? Dễ thương dữ.
* [🗣️ "Quà nào cũng là tấm lòng em ơi. Mình cùng nhìn vào tấm lòng nha."]
    designer: Tấm lòng móp anh ơi. *(quay đi)*
    ~ qh("designer", -3)
    ~ hr_so(2)
* [😶 Lặng lẽ để thêm vào hộp của từng người một tờ giấy viết tay, khen một điều thật về họ.]
    ~ hr_nghe(8)
    ~ hr_so(-5)
    _"{ke_toan}: người duy nhất đọc trang 47." "{chi_dai}: người duy nhất không sợ tui." "{hong_hot}: người duy nhất làm pantry có tiếng cười."… Bạn viết 7 tờ, mất cả buổi sáng._
    ke_toan: *(đọc tờ giấy, nhìn bạn rất lâu)* Sao ông biết vụ trang 47?
    hr: Tui đứng sát tường hôm ký hợp đồng. HR đứng sát tường nghe được nhiều lắm.
    ~ qh("ke_toan", 10)
    ~ qh("chi_dai", 5)
    ~ qh("hong_hot", 5)
- -> END

// ------------------------------------------------------------
=== hr_2010_thu_g ===
# ngay:20 # gio:11:00 # noi:chong_bao_ve # bat_buoc
_Chòi bảo vệ. {bac_bao_ve} cầm một lá thư tay, ký tên "G". Bên trong còn một phong bì dán kín, đề: "Chỉ mở khi công ty sắp sập"._
_Cả công ty đứng ngoài cổng chuẩn bị tiệc sinh nhật 16 tuổi. {bac_bao_ve} nhìn bạn._
bac_bao_ve: Cháu {hr}. Thư của ông G gửi. Bác không biết có nên đọc trước mọi người không. Bác chỉ là người giữ thư thôi.
* [🤝 "Bác đọc đi bác. Mọi người cần nghe một người không phải sếp nói về công ty."]
    ~ hr_doc_thu_g = true
    _{bac_bao_ve} đứng lên ghế đẩu. Đọc chậm, giọng Bắc trầm: "…16 năm rồi. Tôi vẫn nhớ căn phòng 20 mét vuông. Gửi lời cảm ơn tới từng người còn ở lại…"_
    _Cả sân im lặng. {giam_doc} đứng phía sau, mặt tái đi rồi đỏ lên, không rõ vì xúc động hay vì sợ._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
    ~ qh("bac_bao_ve", 8)
    ~ qh("giam_doc", -5)
* [😶 "Chuyện của bác với ông G, con không dám có ý kiến."]
    bac_bao_ve: Ừ. Thế bác cất đi.
    _Lá thư vào tủ gỗ. Phong bì dán kín vẫn dán kín._
    ~ qh("bac_bao_ve", 3)
* [💬 "Phong bì 'chỉ mở khi công ty sắp sập'… bác nghĩ giờ đã tới lúc chưa?"]
    bac_bao_ve: Chưa. Lúc nào sập thật thì bác biết. Bác ngồi cổng 16 năm rồi.
    _Bạn nhớ câu đó rất lâu._
- -> END

// ------------------------------------------------------------
=== hr_2010_karaoke ===
# ngay:20 # gio:22:00 # noi:karaoke_hat_cho_nhau_nghe
_Sau quán ốc, tăng hai ở Karaoke Hát Cho Nhau Nghe. {idol_het_thoi} hát "Công Viên" lần thứ 3. {giam_doc} say, cầm micro, đứng lên bàn._
giam_doc: Các em! Anh tuyên bố! Tháng sau… tăng lương 20%! Cả công ty!
_Cả phòng karaoke nổ tung. {hong_hot} quay. {ke_toan} lấy tay che mặt._
_Rồi {giam_doc} nhìn thấy bạn, mắt hơi tỉnh lại. Ông ấy ngồi xuống cạnh bạn, nói nhỏ:_
giam_doc: {hr}. Tăng lương thì phải bớt người. Em hiểu không? Danh sách…
* [📓 "Dạ. Em hiểu."]
    ~ hr_ds(1)
    ~ cang_thang(10)
* [🤝 "Anh vừa hứa trước 20 người, có clip. Anh hứa tăng thì mình giữ người, anh nha."]
    giam_doc: *(nhìn cái điện thoại của {hong_hot} đang quay)* …Ừ. Ừ. Anh nói rồi mà. Đàn ông nói là làm.
    ~ hr_ds(-1)
    ~ qh("giam_doc", -3)
    ~ hr_nghe(3)
* [🎤 Giành micro, hát một bài để sếp quên chuyện danh sách.]
    _Bạn hát "Công Viên". Dở. Rất dở. Cả phòng cười bò. {giam_doc} cười tới quên luôn mình đang nói gì._
    ~ hr_so(-8)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- -> END
