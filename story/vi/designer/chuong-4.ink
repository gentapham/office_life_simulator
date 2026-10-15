// ============================================================
// DESIGNER · CHƯƠNG 4: "VŨNG TÀU KHÔNG CÓ WIFI" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== designer_1710_xe_vung_tau ===
# ngay:17 # gio:06:30 # noi:xe_khach # bat_buoc
_6 giờ 30. Xe khách 29 chỗ đậu trước cổng. Balo của bạn nặng hơn bình thường đúng 1,8 ký: laptop thứ hai._
la_chuoi: *(tin nhắn lúc 6:02)* Em ơi, anh cần file trước Chủ nhật nha. Bên anh không chờ được.
hr: Mọi người lên xe theo danh sách nhé! {designer} ngồi cạnh {sales}, ở chung phòng 202 với {sales} luôn nha.
_Ít nhất có một điều đúng trong ngày hôm nay._
dan_dau_tu: *(đứng ở cửa xe, giơ điện thoại)* Hôm nay Ngày Quốc tế Xóa nghèo! Hồng Coin x10 rồi! Tối nay anh bao cả đoàn hải sản!
_Cả xe vỗ tay. {chi_dai} nhìn {dan_dau_tu} như nhìn một quả bom đã rút chốt._
{ ds_co_hong_coin:
    _Bạn chợt nhớ ra 200.000đ Hồng Coin của mình. Giờ là 2 triệu. Bạn không dám mở app ra xem, sợ nó biến mất._
}
* [🎧 Đeo tai nghe, ôm balo, ngủ suốt đường đi.]
    ~ nghi(20)
    sales: *(thì thầm)* Chị cứ ngủ. Balo để em ôm cho.
    ~ qh("sales", 3)
* [🎨 Ngồi phác thảo cảnh biển qua cửa kính.]
    ~ ds_toi(5)
    bien_kich: *(ghế sau, ngó qua)* Biển này buồn ghê. Cho tui mượn làm mở đầu chương 3 nha.
    designer: {dan_dau_tu} 3 của cái gì bà?
    bien_kich: *(giật mình)* Của… kịch bản. Trò chơi. Tối nay.
* [💬 Hỏi {dan_dau_tu}: "Anh ơi, x10 rồi bán chưa?"]
    dan_dau_tu: Bán là thua em ơi. Lần này là lên thật. X100.
    _Bạn quyết định tối nay ăn hải sản thật nhiều. Ngày mai có thể không còn cơ hội._
- -> END

// ------------------------------------------------------------
=== designer_1710_ca_phe_dau_ngo ===
# ngay:17 # gio:14:00 # noi:vung_tau_ca_phe
_Nhà nghỉ không có wifi. Chỉ có quán cà phê đầu ngõ, wifi tên "Khong co pass", mật khẩu là "khongcopass"._
_Cả đoàn đang chơi trò tập thể ngoài bãi cát. {hr} cầm loa gọi điểm danh lần thứ 3._
sales: Chị đi đi. Em lo phía bên này.
_{sales} đứng giữa bãi cát, giơ tay hô to:_
sales: Mọi người ơi! Chị bao trà sữa cả đoàn! Ai uống gì giơ tay!
_31 cánh tay giơ lên. Không ai để ý bạn lẻn đi. Bạn biết tiền trà sữa đó là tiền tạm ứng của {sales}. Bạn sẽ không bao giờ quên._
~ qh("sales", 10)
* {ds_nhan_hong_ngoai} [🥬 Gửi bản nháp Hồng Ngoại cho Anh Lá Chuối.]
    ~ ds_cam(-5)
    ~ nghi(-15)
    ~ ds_lo(5)
    la_chuoi: Đẹp! Đúng ý sếp anh. Màn hình LED sẽ chạy cái này. Thưởng thêm 500 nghìn nè.
    ~ ds_job_ll(500000)
    _Màn hình LED. Ở đâu? Bạn định hỏi. Rồi bạn không hỏi._
* [🥬 Làm job banner quán nướng còn dở.]
    -> designer_mg_alt_tab_mo_dau
* [🧡 Ngồi đó 10 phút, rồi gập máy, quay lại bãi cát chơi kéo co.]
    ~ ds_cam(10)
    ~ nghi(-5)
    _Bạn kéo co đội {chi_dai}. {giam_doc}. {chi_dai} vỗ lưng bạn đau điếng._
    chi_dai: Tay vẽ mà kéo khỏe ghê ta!
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== designer_1710_nhau_hai_san ===
# ngay:17 # gio:19:30 # noi:vung_tau_quan_hai_san
_Quán hải sản sát biển. {dan_dau_tu} bao thật. Ghẹ, mực, tôm hùm (một con, chia 31 người)._
~ an(60)
_Bàn bên kia, {giam_doc} đã sang ly thứ 5. {sales} ngồi cạnh._
giam_doc: {sales} này, Đêm Hồng mà có ca sĩ to về hát thì nổ tung luôn nhỉ. Em quen ai không?
_Bạn thấy ánh mắt {sales} lóe lên. Ánh mắt của người sắp hứa một điều không có._
* [🤝 Đá chân {sales} dưới gầm bàn. Mật mã: "Đừng."]
    sales: *(khựng lại)* Dạ… mình có anh {idol_het_thoi} mà sếp. "Công Viên" bản remix, cả nước hát theo.
    giam_doc: *(rơm rớm)* Năm 2015… em nói đúng. Đúng quá.
    ~ qh("sales", 5)
    ~ qh("idol_het_thoi", 5)
* [😶 Để {sales} tự quyết. Gắp con mực.]
    sales: Tin chị đi! Ca sĩ nổi tiếng nhất nước, chị gọi một cuộc là tới!
    giam_doc: *(đập bàn)* Thế anh tăng lương cả công ty!
    _Ba cái điện thoại đang quay. {hong_hot} quay hai cái._
    ~ cang_thang(5)
* [🧂 Chen vào: "Sếp ơi, sếp hứa tăng lương thì em hứa vẽ chân dung sếp!"]
    giam_doc: Được! Tăng lương cả công ty! Vẽ anh to nhé!
    _Clip quay cảnh {giam_doc} hứa tăng lương có thêm giọng bạn ở nền. Ngày mai sẽ vui đây._
    ~ qh("giam_doc", 5)
- -> END

// ------------------------------------------------------------
=== designer_1710_lua_trai ===
# ngay:17 # gio:21:30 # noi:vung_tau_bai_bien # bat_buoc
_Lửa trại. Trò "nói thật". Chai nước suối quay giữa vòng tròn, dừng ở trước mặt bạn._
hr: Câu hỏi cho {designer}: "Bạn từng làm gì sau lưng công ty?"
_31 cặp mắt. Ánh lửa. Tiếng sóng. Balo laptop thứ hai nằm ngay sau lưng bạn._ # hen_gio:6
* [😇 Nói thật nửa vời: "Em từng… làm thêm buổi tối. Thiết kế. Cho người ngoài."]
    ~ ds_noi_that_lua_trai = true
    ~ ds_cam(5)
    ~ ds_lo(10)
    hr: Ồ. Ai cũng phải sống mà. Mình cùng nhìn lại hành trình sau nha em.
    _{hr} cười. Nụ cười làm bạn lạnh sống lưng hơn gió biển._
* [🐍 Nói dối: "Em từng lén ăn bánh chuối chiên trong phòng chờ của anh {sieu_nhan_hong}."]
    sieu_nhan_hong: Ủa là chị hả! Em tưởng {cho}!
    _Cả vòng cười ồ. Câu chuyện trôi qua. Chỉ có {sales} nhìn bạn, gật nhẹ._
    ~ cang_thang(5)
* [🤝 Nhìn sang {sales}.]
    sales: *(đứng dậy)* Để chị trả lời giùm! Hồi tháng 3, chị với {designer} lén mượn xe công ty đi Đà Lạt. Xe hết xăng ở đèo.
    _Hoàn toàn không có chuyện đó. Cả đoàn tin sái cổ. {chi_dai} cười tới chảy nước mắt._
    ~ qh("sales", 5)
    ~ ds_lo(-5)
* [⏱️ (Không chọn kịp)]
    hong_hot: Im lặng là đồng ý nha! Có chuyện! Chắc chắn có chuyện!
    ~ ds_lo(10)
    ~ cang_thang(10)
- { ds_do_lo >= 100:
    -> designer_tudo_lat_tay
}
_Tới lượt {sieu_nhan_hong}. Ảnh nhìn ngọn lửa rất lâu._
sieu_nhan_hong: Hồi nhỏ… em từng nhốt một đứa nhỏ trong kho. Nó khóc cả buổi. Em không nhớ tên nó. Em… vẫn nhớ tiếng khóc.
_Cả vòng im bặt. Bạn thấy {ran_doc} đứng phắt dậy, đi thẳng ra biển._
_Cuối đêm, {idol_het_thoi} ngủ gục lên vai {quan_ly_idol}. {editor} lặng lẽ đắp chăn cho cả hai, rồi ngồi một mình nhìn sóng._
* [🎨 Ghi nhớ khung cảnh đó.]
    ~ ds_toi(5)
* [🤝 Mang ly trà gừng cho {editor}.]
    editor: *(ngáp, nhận ly)* …Cảm ơn bà. Đừng kể ai nha.
    designer: Kể gì?
    editor: …Ừ. Kể gì.
    ~ qh("editor", 8)
- -> END

// ------------------------------------------------------------
=== designer_1810_ve_thanh_pho ===
# ngay:18 # gio:15:30 # noi:xe_khach # bat_buoc
_Trên xe về. Ai cũng giận ai. Clip {giam_doc} hứa tăng lương đã có 400 lượt xem trong group._
_{dan_dau_tu} ngồi hàng cuối, nhìn điện thoại, mặt xám như nền xi măng. Hồng Coin về 0. Người tạo ôm tiền biến mất._
dan_dau_tu: Đáy… đáy thật rồi. Lần này là đáy thật.
{ ds_co_hong_coin:
    _200.000đ Hồng Coin của bạn giờ là 0 đồng. Bạn nhìn ra cửa sổ, thấy một con bò đang nhai cỏ, thản nhiên hơn bạn nhiều._
    ~ ds_co_hong_coin = false
    ~ cang_thang(5)
}
_Ghế bên, {bien_kich} quay sang bạn, mắt lạnh._
bien_kich: Tối qua bà nói kịch bản trò chơi của tui "nhạt như nước ốc". {hong_hot} kể tui nghe hết rồi.
_Bạn có nói thật. Lúc đang ăn ốc. Rất đúng ngữ cảnh._
~ ds_oanh_gian = true
* [😇 "Tui xin lỗi. Tui mệt quá nên nói bậy. Trò bà có ý mà."]
    ~ qh("bien_kich", 10)
    ~ ds_oanh_gian = false
    bien_kich: *(dịu xuống)* …Thôi. Nước ốc cũng có vị riêng. Tui ghi câu đó vô sổ.
* [🎨 "Nhạt thì nhạt thiệt mà. Lần sau mình làm chung, tui vẽ, bà viết."]
    bien_kich: …Làm chung? Với bà? *(suy nghĩ 10 giây)* Để coi.
    ~ qh("bien_kich", 3)
    ~ ds_toi(3)
* [🐍 "Nước ốc còn có người húp. Kịch bản bà thì không."]
    ~ qh("bien_kich", -15)
    bien_kich: Ghi nhận. Bà sẽ có một chương riêng.
    _Bạn không hiểu câu đó nghĩa là gì. Bạn có linh cảm xấu._
- -> END

// ------------------------------------------------------------
=== designer_1810_toi_can_203 ===
# ngay:18 # gio:21:30 # noi:can_203
_Về tới căn 203. Cát trong giày. Mùi biển trong tóc. Và một tin nhắn từ Anh Lá Chuối._
la_chuoi: Chủ nhật rồi đó em.
{ ds_nhan_hong_ngoai:
    _File Hồng Ngoại xong 85%. Còn bìa hồ sơ và màn hình LED. Bạn mở ra, nhìn cái logo, và nghĩ tới tiếng "Công Viên" trong pantry tối._
- else:
    _Bạn không làm Hồng Ngoại. Nhưng banner quán nướng thì còn dở._
}
* {ds_nhan_hong_ngoai} [🥬 Làm cho xong bìa hồ sơ Hồng Ngoại tối nay.]
    ~ nghi(-25)
    ~ ds_cam(-5)
    _Bìa hồ sơ: nền trắng, chữ "HỒNG NGOẠI" font tự vẽ, dải hồng chạy xéo. Font của bạn. Bạn nhận ra nó ở bất cứ đâu._
* [🥬 Nhận một job nhỏ khác cho đủ tiền nhà tháng sau.]
    -> designer_mg_alt_tab_mo_dau
* [🧡 Nhắn "Em xin dời qua thứ 4", rồi đi tắm.]
    ~ ds_cam(5)
    ~ nghi(10)
    la_chuoi: …Ok. Lần cuối nha em.
- -> END

// ------------------------------------------------------------
=== designer_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_sang_tao
_Thứ 2. Họp giao ban. Không ai nhìn mặt ai. {giam_doc} giả vờ không biết có clip hứa tăng lương._
giam_doc: Ngày mai là sinh nhật công ty 16 tuổi! Anh cần một logo kỷ niệm 16 năm. {chi_dai} lo tiệc, {designer} lo logo.
chi_dai: *(khoanh tay)* Tiệc thì có. Tăng lương thì sao anh?
giam_doc: À… cái đó… mình họp sau nhé.
_{truong_phong} gật gù, ghi chép "họp sau" vào sổ, gạch chân 2 lần._
* [💬 "Dạ logo làm mới hay giữ cũ ạ?"]
    giam_doc: Mới hẳn. Nhưng nhìn vẫn y như cũ. Em hiểu ý anh mà.
    designer: Dạ… em hiểu. Em hiểu lắm luôn.
    ~ ds_sua(1)
* [🧂 "Dạ em xin đề xuất: tặng mỗi người một bản in logo, thay cho tăng lương."]
    _{chi_dai} bật cười. {giam_doc} không cười._
    ~ qh("chi_dai", 5)
    ~ qh("giam_doc", -5)
* [😶 Gật đầu, vẽ con cá voi hồng vào lề sổ.]
    ~ cang_thang(-3)
- -> END

// ------------------------------------------------------------
=== designer_2010_logo_38 ===
# ngay:20 # gio:09:30 # noi:phong_giam_doc # bat_buoc
_Ngày Phụ nữ Việt Nam. Sinh nhật {cong_ty} 16 tuổi. Phòng giám đốc treo bóng bay cam._
giam_doc: {designer} ơi, nhân dịp 16 năm, em làm mới cái logo giúp anh nhé. Mới hẳn, nhưng nhìn vẫn y như cũ. Anh không ép, tùy em.
_Lần sửa thứ 38 trong lịch sử logo. Bạn hít một hơi dài._
* [🧠 Gửi 3 bản: G 7 màu, G 16 màu, và bản gốc 2010 đổi tên "bản mới nhất".]
    giam_doc: Ơ! Bản "mới nhất" này! Đột phá quá! Đúng tinh thần 16 năm!
    ~ ds_sua(1)
    ~ cang_thang(-15)
    ~ ds_ban_1_thanh_cong = ds_ban_1_thanh_cong + 1
    _Bạn gật đầu, mỉm cười, và ghi vào sổ: "Lần 38. Kết quả: lần 1"._
* [🎨 Làm thật một bản mới: hiện đại, tối giản, chỉ còn 2 màu.]
    _{giam_doc} nhìn bản mới. Im lặng. 10 giây. Đồng hồ trên tường tích tắc._
    giam_doc: …Thiếu 5 màu.
    ~ ds_toi(15)
    ~ uy_tin = uy_tin - 5
    ~ ds_sua(1)
* [💬 "Sếp ơi, logo năm 2010 là ai duyệt vậy ạ?"]
    giam_doc: Anh Genta duyệt. Hồi đó anh ấy bảo: "Thắng ạ, 7 màu là vì công ty mình sẽ có đủ loại người. Màu nào cũng phải có chỗ."
    _Rồi {giam_doc} kể chuyện khởi nghiệp 40 phút. Lần này bạn nghe. Lần này có đoạn bạn chưa nghe bao giờ._
    giam_doc: …Anh ấy đi lâu rồi. Thỉnh thoảng anh vẫn sợ anh ấy về thấy công ty thế này.
    ~ qh("giam_doc", 10)
    ~ ds_cam(5)
    ~ nghi(-10)
- _Cuối ngày, như mọi năm, {giam_doc} chọn lại logo gốc năm 2010._
-> END

// ------------------------------------------------------------
=== designer_2010_hoa_20_10 ===
# ngay:20 # gio:11:30 # noi:ban_thiet_ke
_Các chị em trong công ty được tặng hoa. Bó của bạn: 3 bông cúc họa mi và một nhành lá, bọc giấy kraft. Kèm thiệp "Chúc em mãi xinh, mãi sửa không mệt. Phòng Sản xuất"._
{ ds_mau_cam <= 40:
    _Tối qua, một bó hồng xanh lá chuối to gấp năm được gửi tới căn 203. Thiệp ghi: "Gửi designer giỏi nhất quận. LL"._
    _Bạn nhìn bó cúc họa mi trên bàn. Rồi nghĩ tới bó hoa to ở nhà. Bạn thấy mình như đang đứng giữa hai bờ sông._
    ~ ds_cam(-5)
}
truong_phong: *(đứng ngập ngừng)* Ờm… anh mua quà cho em với {bien_kich}. Anh không biết chọn nên… mua sổ kẻ ô.
* [😇 "Dạ em cảm ơn anh. Sổ kẻ ô vẽ lưới đẹp lắm."]
    ~ qh("truong_phong", 10)
    truong_phong: Thật à? Thế… thế năm sau anh mua tiếp nhé.
* [🧂 "Sổ kẻ ô để em ghi lại số lần bị sửa hả anh?"]
    truong_phong: *(đỏ mặt)* Không… à, cũng có thể…
    ~ qh("truong_phong", 2)
    ~ cang_thang(-5)
- ~ nhan(hoa_hong)
-> END

// ------------------------------------------------------------
=== designer_2010_thu_g ===
# ngay:20 # gio:15:00 # noi:sanh_tang_tret
_Tiệc sinh nhật công ty ở sảnh tầng trệt. Bánh kem cam. Bác {bac_bao_ve} cầm một phong thư, tay hơi run._
bac_bao_ve: Sáng nay có thư. Ký tên "G". Gửi cả công ty.
_Cả sảnh im phăng phắc. {giam_doc} tái mặt. Kèm theo thư là một phong bì dán kín, đề: "Chỉ mở khi công ty sắp sập"._
bac_bao_ve: Bác… chưa biết có nên đọc không. Bác chỉ là người giữ thư.
* [😇 "Bác đọc đi bác. Mười sáu năm rồi, tụi con muốn nghe."]
    ~ qh("bac_bao_ve", 8)
    bac_bao_ve: Ừ… thế thì bác đọc phần thư thôi. Phong bì kia, chưa tới lúc.
    _Bác đọc chậm, giọng nhỏ. Đúng lúc đó {cho} sủa ầm ĩ vì anh shipper Tèo. Bạn đứng cuối sảnh, chỉ nghe rõ được mấy chữ "mười sáu năm"._
    _Nhưng bạn thấy mắt {giam_doc} đỏ lên. Bạn nhìn logo chữ G 7 màu treo trên tường. Lần đầu tiên bạn thấy nó không xấu._
    ~ ds_cam(10)
    ~ ds_toi(5)
* [😶 Im lặng. Đó là việc của bác.]
    bac_bao_ve: *(gấp thư lại)* Thôi. Bác giữ. Mọi người ăn bánh đi.
    _{giam_doc} thở phào rất to. Không ai biết vì sao._
    ~ qh("bac_bao_ve", 3)
- -> END

// ------------------------------------------------------------
=== designer_2010_karaoke ===
# ngay:20 # gio:21:30 # noi:karaoke
_Sau Quán Ốc Đêm, cả công ty kéo qua Karaoke Hát Cho Nhau Nghe. {giam_doc} cầm micro, mặt đỏ như logo bản 7 màu._
giam_doc: Các em! Anh hứa! Siêu Nhân Hồng thành công, anh tăng lương 20%! Anh không ép, anh hứa!
_Lần này có 6 cái điện thoại quay. {sales} lấy điện thoại bạn quay thêm một góc nữa._
* [🎤 Giành micro, hát "Công Viên" với {idol_het_thoi}.]
    ~ qh("idol_het_thoi", 8)
    ~ cang_thang(-15)
    idol_het_thoi: Em hát được đó! Hồi anh còn nổi, em mà đi casting là anh nhận liền!
* [🥤 Ngồi góc, uống nước ngọt, nhìn mọi người hát.]
    ~ uong(30)
    ~ nghi(5)
    _Bạn nhìn cả phòng: người hát lệch tông, người khóc, người ngủ. Bạn thấy, lạ thay, mình thương cái công ty này._
    ~ ds_cam(5)
* [🏃 Về sớm. Laptop thứ hai đang đợi.]
    ~ ds_cam(-3)
    -> designer_mg_alt_tab_mo_dau
- -> END
