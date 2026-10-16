// ============================================================
// KẾ TOÁN · CHƯƠNG 4: "HÓA ĐƠN VŨNG TÀU" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== ke_toan_1710_gach_ngan_sach ===
# ngay:17 # gio:06:15 # noi:cong_cong_ty # bat_buoc
_6:15 sáng thứ 7. Team building Vũng Tàu. {hr} đứng ở cổng, tay cầm bản ngân sách 120 triệu, đã bị bạn gạch đỏ từ thứ 5._
hr: {ke_toan} ơi, mình nhìn lại hành trình của bản ngân sách này nha. 60 triệu thì xe hạng sang thành xe thường, phòng hướng biển thành phòng hướng… bãi xe.
* [🧾 "60 là 60. Biển thì ra bãi coi, phòng để ngủ thôi."]
    ~ kt_keo(10)
    ~ kt_ngan_sach_vung_tau = 60
    ~ qh("hr", -5)
    hr: *(cười, nụ cười làm bạn hơi lạnh gáy)* Dạ. Mình lắng nghe nhau vậy.
    _Xe khách thường. Máy lạnh kêu như máy cày. {chua_te_deadline} ngủ ở ghế phụ._
* [✂️ "Thêm 10 triệu. Đủ cho phòng có cửa sổ."]
    ~ kt_ngan_sach_vung_tau = 70
    ~ kt_quy(-10)
    ~ qh("hr", 10)
    hr: {ke_toan} ơi, em rảnh không, về lên phòng anh uống trà xíu. *(lần này không đáng sợ)*
* [😇 "120 thì 120. Đi một lần cho đàng hoàng."]
    ~ kt_ngan_sach_vung_tau = 120
    ~ kt_quy(-60)
    ~ kt_keo(-15)
    ~ kt_ngu(10)
    ~ qh("hr", 15)
    ~ qh("hong_hot", 5)
    _Xe hạng sang. Phòng hướng biển. Cả đoàn reo hò. Bạn ngồi cuối xe, ôm máy tính bỏ túi, không ngắm biển._
- -> END

// ------------------------------------------------------------
=== ke_toan_1710_muc_nuong ===
# ngay:17 # gio:18:00 # noi:vung_tau # bat_buoc
_Quán hải sản Sóng Vỗ. {dan_dau_tu} vừa tuyên bố "thoát nghèo" vì Hồng Coin tăng x10, bao cả team. Rồi gọi thêm 7 dĩa mực nướng "cho cả phòng". Ăn một mình._
_Bạn là người duy nhất giữ hóa đơn của cả đoàn. Túi bạn dày như cuốn sổ cái._
sales: *(say, đứng lên ghế)* Mọi người nghe nè! Đại Nhạc Hội em mời ca sĩ nổi tiếng nhất nước về hát! Chắc kèo!
giam_doc: *(say, nâng ly)* Tháng sau… tháng sau anh tăng lương cho cả nhà!
_Sáu cái điện thoại đang quay. Bạn nhìn hóa đơn trong tay. Bạn nhìn {giam_doc}._
* [🧾 Kẹp hóa đơn 7 dĩa mực vào sổ, ghi: "{dan_dau_tu} – tự trả."]
    ~ kt_hoa_don()
    dan_dau_tu: Ủa em… hôm nay anh bao mà!
    ke_toan: Anh bao thì anh trả. Đúng không anh?
    ~ qh("dan_dau_tu", -5)
    ~ kt_quy(1)
* [🎥 Lấy điện thoại quay lại lời hứa của sếp. Làm bằng chứng.]
    ~ qh("giam_doc", -3)
    _Clip 40 giây. Bạn lưu vào thư mục "Hóa đơn – Lời hứa"._
    ~ kt_keo(3)
* [🍺 Giật ly bia khỏi tay {giam_doc}, đổi thành trà đá.]
    giam_doc: Ơ… {ke_toan}!
    ke_toan: Anh nói thêm câu nữa là em tính lãi đó anh.
    _Cả bàn cười ồ. Lời hứa dừng ở chữ "tháng sau"._
    ~ qh("giam_doc", 5)
    ~ qh("chi_dai", 5)
- ~ an(60)
-> END

// ------------------------------------------------------------
=== ke_toan_1710_lua_trai ===
# ngay:17 # gio:20:00 # noi:vung_tau # bat_buoc
_20:00. Lửa trại. Gió biển lạnh. {sieu_nhan_hong} vừa kể chuyện hồi nhỏ từng nhốt một đứa nhỏ trong nhà kho. Không ai cười._
_Góc kia, {idol_het_thoi} ngủ gục trên vai {quan_ly_idol}. {editor} lặng lẽ đắp chăn cho cả hai. Bạn để ý thấy, nhưng không ghi sổ._
_Trò "nói thật". Chai nước ngọt xoay. Dừng lại ở bạn._
hr: {ke_toan} nói thật một chuyện đi!
{ kt_mat_ngu >= 60:
    _Bạn mệt. Rất mệt. Miệng nói trước khi não kịp duyệt._
    ke_toan: Tháng này mà không xong… mình không còn công ty mà team building đâu.
    _Lửa trại nổ lách tách. Hai mươi người im lặng. Sóng biển nghe rõ từng đợt._
    ~ cang_thang(15)
    -> ke_toan_1710_sau_khi_lo_mieng
}
* [🙊 Nói thật một chuyện nhỏ: "Tui đã ăn vụng hộp cơm của… chính tui. Tui quên là của tui."]
    _Cả đám cười lăn ra cát. {chi_dai} cười tới sặc._
    ~ kt_ngu(-10)
    ~ cang_thang(-10)
* [😮‍💨 Nói thật chuyện lớn: "Hợp đồng có điều khoản: thất bại là hoàn 10 tỷ."]
    _Im lặng. Rồi {hong_hot} tắt livestream. Lần đầu tiên tự tắt._
    -> ke_toan_1710_sau_khi_lo_mieng
* [🧾 "Sự thật là: mọi người nộp hóa đơn hôm nay trước 12 giờ đêm nha."]
    _Cả đám rên rỉ. {chua_te_deadline} giả vờ ngủ._
    ~ kt_keo(5)
- -> END

=== ke_toan_1710_sau_khi_lo_mieng ===
chi_dai: *(đứng dậy)* Rồi. Ai nghe rồi thì làm cho thật. Ai muốn khóc thì khóc tối nay, mai làm.
thuc_tap_sinh: Dạ… em làm thêm giờ được ạ. Không lương cũng được ạ.
sieu_nhan_hong: *(rất nhỏ)* … Là tại em hả?
* [😇 Quay sang {sieu_nhan_hong}: "Không phải tại anh. Tại không ai đọc trang 47."]
    ~ qh("sieu_nhan_hong", 15)
    sieu_nhan_hong: Trang 47… *(ngẫm nghĩ)* … hình như trang đó có gì đó dính dính…
    _Câu nói lơ đãng. Bạn không để ý. Lúc đó._
* [😶 Đứng dậy, đi ra biển một mình.]
    ~ kt_ngu(5)
    _Sóng vỗ ướt gấu quần. Bạn đứng tới khi chân lạnh. {chi_dai} ra đứng cạnh, không nói gì._
    ~ qh("chi_dai", 5)
- ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
~ follow(10000)
-> END

// ------------------------------------------------------------
=== ke_toan_1810_ve_thanh_pho ===
# ngay:18 # gio:13:00 # noi:xe_khach # bat_buoc
_Trên xe về thành phố. Hồng Coin vừa sập về 0, người tạo ôm tiền biến mất. Ai cũng đang giận ai về một chuyện gì đó tối qua._
_Bạn thì giận chính mình. Vì đã lỡ miệng. Hoặc vì đã không lỡ miệng sớm hơn._
dan_dau_tu: *(ngồi xuống ghế bên cạnh, giọng thấp)* {ke_toan}… ứng anh tháng lương sau. Anh… còn cái nịt.
* [🧾 "Không. Anh nợ 22 triệu nửa công ty rồi. Ứng nữa là anh nợ cả công ty."]
    ~ kt_keo(5)
    ~ qh("dan_dau_tu", -5)
    dan_dau_tu: … Ừ. Em nói đúng.
* [💸 "Em ứng 5 triệu. Điều kiện: anh trả Bác {bac_bao_ve} 2 triệu trước."]
    ~ kt_quy(-5)
    ~ qh("dan_dau_tu", 5)
    ~ qh("bac_bao_ve", 5)
    dan_dau_tu: *(gật đầu chậm)* … Ok. Anh trả bác trước.
* [📊 "Anh làm cho em một bảng số liệu fanpage thật đàng hoàng. Có số liệu là em xét."]
    dan_dau_tu: *(lần đầu nhìn bạn nghiêm túc)* … Clip thật có tỷ lệ chia sẻ gấp 12 lần. Anh biết từ tuần đầu. Không ai hỏi anh.
    ~ qh("dan_dau_tu", 10)
    ~ follow(5000)
- -> END

// ------------------------------------------------------------
=== ke_toan_1910_du_toan_20_10 ===
# ngay:19 # gio:09:30 # noi:phong_giam_doc # bat_buoc
_Thứ Hai sau Vũng Tàu. Không ai nhìn mặt ai. Mai là sinh nhật công ty 16 tuổi kiêm Ngày Phụ nữ Việt Nam._
giam_doc: {ke_toan}, mai làm tiệc lớn. 50 triệu. Thuê nhà hàng, ban nhạc, pháo giấy. Mười sáu năm mới có một lần.
* [🧾 "Mười sáu năm mới có một lần, nhưng 10 tỷ thì cả đời có một lần anh. 15 triệu."]
    ~ kt_keo(5)
    ~ kt_quy(-15)
    giam_doc: … 15 thì làm ở công ty, ăn ở Quán Ốc Đêm.
    ke_toan: Ốc ngon hơn nhà hàng anh.
    ~ qh("giam_doc", -2)
* [🛒 "Em đi chợ, tự lo đồ ăn. 20 triệu là đủ cho tiệc ở công ty và quà 20/10."]
    -> ke_toan_mg_cho_mac_ca_mo_dau
* [😇 "50 thì 50. Mọi người cần một tối vui sau Vũng Tàu."]
    ~ kt_quy(-50)
    ~ kt_keo(-10)
    ~ kt_ngu(10)
    ~ qh("giam_doc", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
- -> END

// ------------------------------------------------------------
=== ke_toan_2010_qua_cua_sep ===
# ngay:20 # gio:10:00 # noi:phong_ke_toan
_Ngày Phụ nữ Việt Nam. {giam_doc} gõ cửa, tay cầm một hộp quà nhỏ._
giam_doc: {ke_toan}, quà 20/10. Anh tự mua bằng tiền túi. Không cần hóa đơn đâu nhé.
_Trong hộp: một cái kính lúp mới, tay cầm gỗ, mặt kính trong vắt. Và một tấm thiệp: "Cảm ơn em đã đọc trang 47 thay anh."_
* [😇 "Dạ… em cảm ơn anh."]
    ~ qh("giam_doc", 10)
    ~ kt_ngu(-5)
    _Bạn soi tấm thiệp bằng kính mới. Chữ của sếp xấu, nhưng thật._
* [🧾 "Anh mua bao nhiêu? Anh còn tiền túi không anh?"]
    giam_doc: … Đủ để đi gửi xe. Em đừng lo.
    ke_toan: Em lo đó anh.
    ~ qh("giam_doc", 5)
* [😶 Nhận, đặt vào ngăn kéo, quay lại làm việc.]
    _Tối đó, bạn mở ngăn kéo ba lần. Chỉ để nhìn._
- -> END

// ------------------------------------------------------------
=== ke_toan_2010_la_thu_g ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_Tiệc sinh nhật công ty 16 tuổi ở Quán Ốc Đêm. Logo được quay về bản gốc năm 2010, lần sửa thứ 38. {designer} vừa khóc vừa cười._
_Giữa tiệc, Bác {bac_bao_ve} đứng lên, tay cầm một lá thư tay tới chòi sáng nay. Cuối thư ký "G". Kẹp theo lá thư là một phong bì dán kín._
{ qh_bac_bao_ve >= 25 || RANDOM(1, 2) == 1:
    -> ke_toan_2010_thu_duoc_doc
- else:
    _Bác chỉ nói một câu: "Sinh nhật vui vẻ." Rồi cất lá thư vào túi áo. Bác nhìn bạn một chút, rồi đi xuống chòi._
    ~ kt_ngu(3)
    -> END
}

=== ke_toan_2010_thu_duoc_doc ===
bac_bao_ve: *(đeo kính, đọc chậm)* "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui. Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. G."
_Cả quán im. Rồi Bác giơ cái phong bì dán kín lên cho mọi người thấy dòng chữ ngoài bìa: "Chỉ mở khi công ty sắp sập."_
_Ly nước trong tay bạn rơi xuống sàn. Vỡ. Cả quán quay lại. Trong cả quán, chỉ có bạn biết "sắp sập" là còn bao nhiêu ngày._
_Bác {bac_bao_ve} nhìn bạn. Bác không nói gì. Bác cất phong bì vào túi áo trong._
~ phat_hien(binh_tai_mat_g)
~ kt_ngu(15)
* [😶 Cúi xuống nhặt mảnh vỡ. Tay run.]
    thuc_tap_sinh: Dạ để em, chị ơi! Chị đứt tay bây giờ!
    ~ qh("thuc_tap_sinh", 5)
    { RANDOM(1, 10) <= 3:
        ~ kt_them_dau_vet(1)
        _Ở góc quán, {hong_hot} nhìn bạn, nghiêng đầu. Ánh mắt của người vừa ngửi thấy một câu chuyện._
    }
* [🧾 "Dạ… tại tay con trơn. Công ty còn lâu mới sập mà bác."]
    bac_bao_ve: Ừ. Bác biết.
    _Hai chữ "Bác biết" làm bạn mất ngủ thêm một đêm._
    ~ kt_ngu(5)
* [🤝 Tan tiệc, ghé chòi bảo vệ: "Bác… tháng nào người ta cũng hỏi công ty dạo này thế nào, đúng không?"]
    bac_bao_ve: *(rót trà)* Tháng nào cũng hỏi. Bác chưa trả lời thư này. Cháu muốn bác trả lời sao?
    ** [😮‍💨 "Bác cứ trả lời thật. Sổ sạch. Nhưng công ty nợ."]
        bac_bao_ve: Ừ. Thật thì bác viết.
        ~ qh("bac_bao_ve", 15)
        ~ kt_ngu(-10)
    ** [🙏 "Bác chờ con hết tháng được không?"]
        bac_bao_ve: Bác chờ. Người ta cũng đang chờ.
        ~ qh("bac_bao_ve", 5)
- -> END

// ------------------------------------------------------------
=== ke_toan_2010_karaoke ===
# ngay:20 # gio:21:00 # noi:karaoke # bat_buoc
_Tăng một Quán Ốc Đêm, tăng hai Karaoke Chú Sáu. {giam_doc} đã uống 5 ly. Đèn nháy 7 màu._
thanh_ninh: Sếp ơi, hôm nay sinh nhật công ty mà sếp nói câu nào cũng chuẩn quá anh ơi! Sếp nói thêm một câu nữa đi sếp!
sales: Tin em đi anh, chỉ cần anh hứa một câu là năm sau cả công ty cày gấp đôi!
_{giam_doc} nâng ly. Bạn đã thấy cảnh này ở Vũng Tàu. Bạn có 5 giây._ # hen_gio:5
* [🦶 Đá nhẹ vào chân ghế {giam_doc} dưới gầm bàn.]
    giam_doc: *(khựng lại, nhìn bạn)* … Anh… anh hát một bài thay lời muốn nói!
    _{giam_doc} hát "Công Viên", lạc tông. {idol_het_thoi} cầm micro song ca. Không ai hứa gì._
    ~ qh("giam_doc", 5)
    ~ qh("idol_het_thoi", 5)
* [🧮 Giơ máy tính bỏ túi lên, bấm cho cả phòng xem: 20% × 21 người = 60 triệu/tháng.]
    _Cả phòng nhìn con số. {sales} ngồi xuống. {giam_doc} hạ ly._
    giam_doc: … Anh không hứa. Anh cảm ơn các em.
    ~ qh("sales", -5)
    ~ qh("thanh_ninh", -5)
    ~ kt_keo(5)
* [😶 Để sếp nói.]
    giam_doc: Tháng sau anh tăng lương 20% cho cả nhà!
    ~ kt_sep_hua_20 = true
    _Cả phòng nổ tung. Bạn bấm máy tính. 60 triệu mỗi tháng. Bạn tắt máy tính._
    ~ kt_ngu(15)
* [⏱️ (Không chọn kịp)]
    giam_doc: Tháng sau anh tăng lương 20% cho cả nhà!
    ~ kt_sep_hua_20 = true
    _{hong_hot} quay clip ba góc. Bạn nhìn cái micro, rồi nhìn ra cửa sổ._
    ~ kt_ngu(15)
- -> END

// ------------------------------------------------------------
=== ke_toan_1810_dem_qua_co_nguoi ===
# ngay:18 # gio:15:00 # noi:choi_bao_ve
_15:00. Xe về tới công ty. Bác {bac_bao_ve} đứng chờ ở cổng, đèn pin trong tay, {cho} đứng cạnh._
bac_bao_ve: Cháu {ke_toan}. Đêm qua, 1 giờ 4 phút, có người trên tầng 2. Phòng giám đốc, rồi đi ngang phòng kế toán.
_Bạn chạy lên. Cửa phòng kế toán vẫn khóa. Nhưng xấp hồ sơ ngân hàng trên bàn bị xếp lại sai thứ tự. Bạn chưa bao giờ xếp sai thứ tự._
* [🔍 Kiểm tra từng tờ bằng kính lúp.]
    _Không mất tờ nào. Nhưng trên tờ sao kê khoản vay thế chấp có một vệt mờ, như ai đó đã đặt điện thoại lên chụp._
    ~ kt_ngu(10)
    ~ nghi(-10)
* [💬 "Bác có thấy mặt không bác?"]
    { RANDOM(1, 3):
    - 1:
        bac_bao_ve: Tối quá. Bác chỉ ngửi thấy mùi nước hoa. Xanh xanh, như lá chuối.
        _Lá chuối. Màu của LL-Entertainment._
    - 2:
        bac_bao_ve: Tối quá. Chỉ thấy cái bóng lục ngăn bàn, mùi cà phê sữa đá. Bác rọi đèn thì nó chạy mất.
        _Cà phê sữa đá. Cả công ty chỉ có một người uống thứ đó cả ngày. Người đó đang đi tìm một cái gì đó._
    - else:
        bac_bao_ve: Bác rọi đèn thì thấy thằng {it} ngủ gục trên ghế phòng server, ngáy to lắm. Bác đánh thức nó dậy. Nó nói nó không đi Vũng Tàu vì "server không ai trông".
        _Có thể đúng. Có thể không. Bạn ghi vào sổ cả hai khả năng._
    }
    ~ kt_ngu(5)
    ~ qh("bac_bao_ve", 5)
* [🔌 Nhắn {it}: "Anh {it}, đêm qua có ai đăng nhập máy phòng kế toán không?"]
    it: *(10 phút sau)* Không ai đăng nhập. Nhưng có người cắm điện thoại vào cổng USB lúc 1:07. Em không biết ai.
    ~ qh("it", 5)
    ~ kt_ngu(5)
- _Bạn khóa xấp hồ sơ vào tủ sắt. Lần đầu tiên bạn khóa tủ trong chính phòng mình._
~ kt_keo(5)
-> END
