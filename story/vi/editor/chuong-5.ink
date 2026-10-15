// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · CHƯƠNG 5: "AI LÀ CÚ ĐÊM?" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== editor_2110_confession ===
# ngay:21 # gio:13:30 # noi:phong_dung_phim # bat_buoc
_Mốc 3: phải đạt 500.000 người theo dõi. Nhưng hôm nay cả công ty chỉ nhìn một thứ: bài Confession ẩn danh bóc chuyện biệt thự của sếp bị thế chấp._
{ nguoi_theo_doi < 500000:
    _Chưa đạt mốc 3. Tin đồn "cắt giảm nhân sự" lan từ pantry lên phòng dựng. Lần đầu tiên tin đồn leo được tới chỗ bạn._
    ~ cang_thang(10)
}
_{hr} và {it} gõ cửa phòng dựng. {hr} cười. {it} ôm laptop, mắt dán vào log._
hr: {editor} à, em giỏi hình ảnh nhất công ty. Em xem giúp anh: ảnh chụp giấy thế chấp trong bài này có bị chỉnh sửa không?
* [🔎 Xem kỹ, nói thật: "Dạ ảnh thật. Không chỉnh. Ánh sáng khớp, mép giấy khớp."]
    hr: *(nụ cười cứng lại một chút)* Ừ. Anh cũng đoán vậy.
    ~ uy_tin = uy_tin + 3
    ~ qh("hr", 3)
* [😶 "Dạ… em không chắc. Đợi render xong…"]
    hr: Không sao. Anh chỉ muốn lắng nghe em thôi.
    ~ qh("hr", -2)
* [🎭 "Ảnh chỉnh hết đó anh. Mấy cái này AI làm được hết." (Che cho ai đó, dù không biết là ai.)]
    hr: Thật à? *(ghi chép)* Thế thì nhẹ nhõm hơn nhiều.
    it: *(liếc bạn, không nói)*
    ~ qh("hr", 5)
    ~ qh("it", -5)
- it: *(lúc {hr} đi rồi, nói rất nhỏ)* Log máy em. Upload lúc 3 giờ sáng. Kênh gì?
* [🦉 "Anh đoán thử."]
    it: *(gật nhẹ)* Ừ. Con cú. Anh không nói ai.
    ~ ed_lo(10)
    ~ qh("it", 5)
* [😴 "Dạ… phim của công ty ạ."]
    it: Công ty không có kênh nào upload 4K lúc 3 giờ sáng.
    ~ ed_lo(5)
- -> END

// ------------------------------------------------------------
=== editor_2210_thanh_tra_thu_nhap ===
# ngay:22 # gio:10:15 # noi:phong_ke_toan # bat_buoc
_Đoàn kiểm tra thuế. Trưởng đoàn là chú Liêm, 55 tuổi, sợ chó. {bien_kich} đã viết sẵn kịch bản "làm việc chăm chỉ" cho cả tầng 1._
_Bạn bị gọi vào phòng kế toán để "giải trình kỹ thuật". {ke_toan} ngồi đó, chú Liêm ngồi đối diện, kính trễ xuống mũi._
chu_liem: Cho tôi hỏi: công ty có nhân viên nào có thu nhập ngoài từ kênh Diu-túp hay không?
_{ke_toan} nhìn bạn. Bạn nhìn xuống đất. Đất là gạch men, có một vết nứt hình con cú._
* [😇 "Dạ… có. Em. Em có kênh riêng, em khai thuế cá nhân đầy đủ."]
    chu_liem: *(gật đầu)* Khai đủ là được. Thanh niên bây giờ giỏi nhỉ. Kênh tên gì?
    editor: Dạ… "Cú Đêm Cắt Ghép".
    chu_liem: *(mắt sáng lên)* Ơ! Cháu tôi xem kênh này! Cái video con chó đội nơ!
    ~ ed_lo(25)
    ~ uy_tin = uy_tin + 5
    ~ qh("ke_toan", 10)
    ke_toan: *(ghi vào sổ, khóe miệng nhích lên một li)* Có khai. Có chứng từ. Tốt.
* [😶 Im lặng.]
    _{ke_toan} trả lời thay: "Dạ thưa chú, nhân viên công ty khai thuế cá nhân riêng, không qua công ty ạ." Chị không nhìn bạn. Nhưng chị vừa che cho bạn._
    ~ qh("ke_toan", 5)
    ~ cang_thang(10)
* [🎭 "Dạ, em chỉ dựng phim cho công ty. Ban đêm em… ngủ ạ."]
    chu_liem: Ngủ à? *(nhìn quầng thâm của bạn)* Ừ. Ngủ.
    _Không ai tin. Kể cả bạn._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== editor_2210_cuu_footage ===
# ngay:22 # gio:15:00 # noi:phong_dung_phim # bat_buoc
_Chiều. Đoàn kiểm tra đòi "bằng chứng nghiệm thu dự án quảng cáo tháng 6". Hợp đồng 800 triệu. Không có file thì doanh thu đó "không chứng minh được"._
chua_te_deadline: *(lao vào phòng dựng, mặt trắng bệch)* {editor}. Ét o ét. Thật sự ét o ét lần này.
{ ed_biet_file_vu:
    _Bạn nhớ đường dẫn: ổ cứng "KHÔNG ĐƯỢC MỞ", thư mục "2026_06". Bản sao lưu tự động. Nó ở đó._
}
* {ed_biet_file_vu} [🔒 "Ổ của anh {it} có bản sao. Đi. Rủ thêm ảnh."]
    chua_te_deadline: Ông… ông biết từ hồi nào?
    editor: Từ hồi ông nói "chill".
    ~ qh("chua_te_deadline", 15)
    -> editor_mg_cuu_footage
* [🧩 "Đưa tui mọi thứ còn lại: clip nháp, clip điện thoại, story ai đăng. Tui ghép lại."]
    -> editor_mg_cuu_footage
* [✋ "Lần này ông tự lo đi. Tui không gánh nữa."]
    chua_te_deadline: *(đứng im)* …Ờ. Ông nói đúng. Tui đi nói với sếp.
    ~ qh("chua_te_deadline", -10)
    ~ ed_can(3)
- -> END

// ------------------------------------------------------------
=== editor_2310_livestream_banh ===
# ngay:23 # gio:19:30 # noi:studio_tang_2 # bat_buoc
_Sinh nhật {sieu_nhan_hong}, 31 tuổi. Livestream. Bạn ngồi bàn điều khiển, ba máy quay, mười hai nghìn người xem._
_{thuc_tap_sinh} đóng vai "Mr. Kevin Trộn" của BTT Global, đeo kính râm, đọc lời chúc bằng giọng chủ tịch ngân hàng. Diễn tốt tới mức đáng ngờ._
_Rồi {sieu_nhan_hong} cầm micro: "Anh {chua_te_deadline}, em thích anh. Không phải PR." Hashtag \#{chua_te_deadline}ƠiTrảLờiĐi lên xu hướng trong ba phút._
_Và rồi một bóng vàng lao vào khung hình. Chiếc bánh kem hồng ba tầng đổ ụp. {cho} ngồi giữa đống kem, rất hài lòng._ # hen_gio:5
* [🎥 Chuyển ngay sang máy 3, cận mặt {cho} dính kem, giữ đúng 4 giây.]
    ~ follow(10000)
    ~ qh("cho", 5)
    _Bốn giây. Mặt chó, mũi hồng kem, mắt tròn vô tội. Bình luận chạy như thác: "Bé chó là MVP", "Chó cũng muốn ăn sinh nhật"._
* [🎥 Giữ máy 1 trên {sieu_nhan_hong}: xem phản ứng của người hùng.]
    _{sieu_nhan_hong} quỳ xuống, giả tiếng sủa, chọc {cho}. {cho} gầm gừ, ngoạm luôn chóp mũ. Hai bên giằng co trên sóng trực tiếp._
    ~ follow(5000)
* [🎥 Lia sang {chua_te_deadline}: người vừa được tỏ tình, đang cầm điện thoại ngược.]
    _Khung hình: một người đàn ông 28 tuổi, nhìn bánh kem đổ, nhìn bộ đồ hồng, nhìn màn hình điện thoại, không biết nhìn đâu. Mạng xã hội gọi đó là "biểu cảm của năm"._
    ~ follow(8000)
    ~ qh("chua_te_deadline", -3)
* [⏱️ (Không chọn kịp)]
    _Máy quay đứng yên trên cái bàn trống, chỉ còn vụn kem. Năm giây im lặng trên sóng. Bình luận: "Lag hả?", "Ủa công ty bày trò hả?"._
    ~ follow(-5000)
- -> END

// ------------------------------------------------------------
=== editor_2310_slowmo ===
# ngay:23 # gio:23:30 # noi:phong_dung_phim # bat_buoc
_Gần nửa đêm. Bạn mở lại cảnh cái bánh đổ, quay từ ba góc. Tay bạn tự dựng: slow-motion, nhạc phim hành động, kem bay như pháo hoa, {cho} hạ cánh như siêu anh hùng._
_Một phút mười giây. Đẹp. Hài. Hơi ác với chiếc bánh._
~ ed_thuc_dem()
* [📤 Gửi {hong_hot} đăng lên fanpage: "{cho}: Người Phá Bánh".]
    ~ ed_slowmo_banh = true
    ~ follow(20000)
    ~ qh("hong_hot", 10)
    ~ qh("cho", 5)
    hong_hot: *(nhắn lúc 23:58)* TRỜI ƠI. Đăng liền! Ai dựng mà cú vậy?!
    _"Cú vậy." Bạn nhìn chữ đó rất lâu._
    ~ ed_lo(5)
* [📺 Đăng lên kênh "Cú Đêm Cắt Ghép" thay vì fanpage.]
    ~ ed_sub_cong(25000)
    ~ ed_lo(15)
    ~ follow(5000)
    _Bình luận top: "Ủa con chó này là chó của công ty Siêu Nhân Hồng mà? Cú làm ở đó hả?"_
* [🦉 Không đăng. Gửi riêng cho {sieu_nhan_hong}: "Chúc mừng sinh nhật anh."]
    ~ qh("sieu_nhan_hong", 15)
    _Một tiếng sau: "Trời ơi em ơi! Anh coi 20 lần rồi! Sinh nhật vui nhất đời anh! Mà đừng đăng nha, {cho} nó đọc được nó giận."_
- -> END

// ------------------------------------------------------------
=== editor_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Liên Hợp Quốc. "Hội nghị hòa giải" của {chi_dai}. Các cặp ngồi đối mặt: {truong_phong} – {con_ong_chau_cha}, {designer} – {bien_kich}, {chi_dai} – {thanh_ninh}…_
_Bạn không có cặp. Bạn được giao quay phim "biên bản hòa giải"._
{ ed_clip_phat_toi == "gui_thai" || ed_clip_phat_toi == "dang_kenh":
    _Đúng sáng nay, clip {idol_het_thoi} hát trong bóng tối viral lại lần hai. Cùng lúc, có người bóc chuyện fan ảo của {idol_het_thoi}. Một ngày, hai cái khủng hoảng ngược chiều._
- else:
    _Sáng nay, có người bóc chuyện {idol_het_thoi} thuê fan ảo. {quan_ly_idol} không có mặt ở hội nghị. Anh ấy ở phòng nghệ sĩ, cầm hai điện thoại, không cái nào ngừng rung._
}
* [🎁 Lẻn ra khỏi hội nghị, dựng một Video Tiện Tay: {idol_het_thoi} hát đám cưới, toàn khách thật, mặt thật, khóc thật.]
    ~ ed_tien_tay()
    ~ follow(8000)
    ~ qh("idol_het_thoi", 5)
    _Video đăng lúc 14:00, qua kênh nghệ sĩ. Bình luận: "Fan ảo thì có, mà cô dâu khóc này là thật." {quan_ly_idol} đăng lại, không caption._
    ~ ed_can(3)
* [🎥 Ở lại quay hội nghị. Đúng việc được giao.]
    ~ uy_tin = uy_tin + 3
    _Bạn quay được {designer} và {bien_kich} vẽ chung một bức tranh hai bàn tay giật bút của nhau. {chi_dai} gật gù như trọng tài._
    ~ qh("chi_dai", 5)
* [🤝 Mang cà phê qua phòng nghệ sĩ cho {quan_ly_idol}. Không nói gì. Đặt xuống rồi đi.]
    _Bạn đặt ly cà phê cạnh hai cái điện thoại. {quan_ly_idol} ngẩng lên, chưa kịp nói gì thì bạn đã ra tới cửa._
    quan_ly_idol: *(nói vọng theo)* {editor}! … Cảm ơn em.
    ~ ed_can(3)
    ~ qh("quan_ly_idol", 5)
- -> END

// ------------------------------------------------------------
=== editor_2510_chu_nhat ===
# ngay:25 # gio:20:00 # noi:can_701
_Chủ nhật. Bạn ngủ tới 6 giờ tối. Dậy, mở điện thoại._
_Story của {quan_ly_idol}, đăng lúc 15:40: một sảnh tòa nhà kính, sàn bóng loáng, chậu cây màu xanh lá chuối. Không caption. 20 giây sau thì bị xóa._
_Bạn đã kịp xem. Người dựng phim nhìn khung hình đủ lâu thì nhận ra: màu xanh lá chuối. Màu của LL-Entertainment._
* [💬 Nhắn: "Anh ơi, hôm nay anh đi đâu vậy?"]
    _Đã xem. Ba chấm. Biến mất. Ba chấm. Rồi: "Đi gặp đối tác thôi em. Em ngủ chưa?"_
    _Bạn nhìn chữ "đối tác" rất lâu._
    ~ ed_can(2)
    ~ cang_thang(10)
* [📺 Dựng video cho kênh riêng để khỏi nghĩ.]
    -> editor_mg_dem_cua_cu
* [😶 Úp điện thoại. Ngủ tiếp.]
    ~ ed_ngu_du()
    _Bạn không ngủ được. Nhưng bạn nằm yên, như thể ngủ. Nằm yên cũng là một cách nghỉ ngơi._
- -> END

// ------------------------------------------------------------
=== editor_2610_bi_phat_hien ===
# ngay:26 # gio:10:00 # noi:khu_lam_viec_chung # bat_buoc
_Họp giao ban. Tin đồn cắt giảm nhân sự lan khắp công ty. Nhưng tới 10 giờ, có một tin còn lan nhanh hơn._
{ ed_lo_danh_tinh >= 40:
    _{hong_hot} đăng lên group: ảnh chụp màn hình video "Một ngày làm chó công ty", cổng công ty, và cái tai nghe to đùng của bạn trong một khung hình phản chiếu. "NGHE GÌ CHƯA? CÚ ĐÊM LÀ NGƯỜI NHÀ MÌNH!"_
- else:
    { RANDOM(1, 2) == 1:
        _{ran_doc} gửi vào group một bảng so sánh: giờ đăng video của kênh "Cú Đêm Cắt Ghép" và giờ bạn rời công ty. Khớp từng phút. "Tui chỉ nói sự thật thôi mà."_
    - else:
        _Ai đó đọc được log máy chủ, thấy tài khoản dựng phim của công ty đăng nhập Diu-túp lúc 3 giờ sáng. Không ai biết người đó là ai. Chỉ biết tin đã lan._
    }
}
~ ed_bi_phat_hien = true
_Cả tầng 1 quay về phía phòng dựng. {hong_hot} chạy tới, mắt sáng như đèn sân khấu._
hong_hot: {editor}! Là ông hả?! Con cú đeo tai nghe là ông hả?!
* [🦉 "Dạ. Là em." (Nói thật, trước mặt mọi người.)]
    ~ ed_cong_khai_kenh = true
    ~ ed_can(10)
    ~ ed_vo(-10)
    _Cả tầng im. Rồi {thuc_tap_sinh} vỗ tay. Một mình. Rồi {chi_dai} vỗ theo. Rồi cả tầng._
    hong_hot: Ối dồi ôi! Tui coi kênh ông ba năm nay! Ký tên lên tay tui đi!
    ~ qh("hong_hot", 10)
* [😶 "Dạ… không phải em. Đợi render xong…"]
    hong_hot: *(nheo mắt)* Ờ. Render. Tui chờ.
    ~ ed_can(-5)
* [🎭 "Em là fan của con cú đó thôi. Em cũng muốn biết nó là ai."]
    hong_hot: Fan mà đeo y chang cái tai nghe? *(khoanh tay)* Diễn dở quá ông ơi.
    ~ ed_lo(10)
- -> END

// ------------------------------------------------------------
=== editor_2610_thang_mua_kenh ===
# ngay:26 # gio:14:30 # noi:phong_giam_doc # bat_buoc
giam_doc: {editor} à, anh mới biết em là cái kênh con cú gần 1 triệu người. Giỏi thế mà giấu anh.
giam_doc: Công ty mua lại nhé, 200 triệu. Đổi tên thành "G-Entertainment Official". Anh không ép, tùy em.
_Bạn nhìn tấm bằng "Doanh nhân của năm" BTT Global sau lưng {giam_doc}. Con cú bạn giấu trên chữ "Global" vẫn ở đó, trong một video mà anh ấy đã xem hai mươi lần._
* [💸 "Dạ… em bán."]
    ~ ed_ban_kenh = true
    ~ tien_cong(200000000)
    ~ ed_sub_cong(-290000)
    _+200.000.000đ. Ba ngày sau, logo con cú đeo tai nghe bị thay bằng chữ G bảy màu. Sub tụt 30%._
    giam_doc: Tốt! Từ nay em là người của gia đình mình, chính thức!
    ~ qh("giam_doc", 10)
* [🦉 "Dạ hông bán. Nhưng em có thể kêu gọi người xem kênh follow Siêu Nhân Hồng. Miễn phí."]
    ~ ed_keu_goi_follow = true
    ~ ed_cong_khai_kenh = true
    ~ follow(150000)
    ~ uy_tin = uy_tin + 20
    ~ ed_can(5)
    giam_doc: *(đứng dậy, mắt đỏ)* Em… em đúng là người của gia đình mình.
    _Tối đó, kênh "Cú Đêm Cắt Ghép" đăng video 40 giây: con cú đeo tai nghe chỉ vào một bộ đồ hồng. "Cú đêm nhờ cả nhà một việc."_
    _Một trăm năm mươi nghìn người bấm theo dõi trong một đêm._
* [✋ "Dạ, mà em hỏi anh trước: ô 'Người thực hiện' tháng này ghi tên ai ạ?"]
    giam_doc: *(nhìn bạn, rồi nhìn ra phòng {truong_phong})* …Anh hiểu rồi.
    ~ ed_vo(-25)
    ~ qh("truong_phong", -10)
    _Chiều đó, {hr} mời {truong_phong} lên phòng uống trà. Trà hoa cúc. Hai tiếng._
- -> END

// ------------------------------------------------------------
=== editor_2610_chieu_thu_phim ===
# ngay:26 # gio:16:30 # noi:phong_hop_tang_2
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". Kịch bản của {bien_kich}. Bản dựng của bạn. Bạn ngồi phòng máy chiếu, nhìn qua ô kính._
_Phút thứ 9: cảnh đẩy xe trong mưa. Ở hàng cuối, {thuc_tap_sinh} quay sang nhìn {bien_kich}. Bạn thấy hết từ ô kính. Người dựng phim luôn thấy hàng ghế cuối._
_Hết phim. Màn hình hiện credit tạm. Dòng "Dựng phim" đang để trống, chờ bạn tự điền._
* [✍️ Điền "Dựng phim: {editor}".]
    ~ ed_vo(-5)
    ~ ed_can(2)
    _Năm chữ. Lần đầu tiên bạn tự gõ tên mình lên một sản phẩm của công ty. Ngón tay hơi run._
* [🦉 Để trống, nhưng giấu con cú ở khung hình cuối.]
    ~ ed_dau_cu_chung_minh = ed_dau_cu_chung_minh + 1
    _Không tên. Chỉ có con cú. Như mọi lần. Có lẽ bạn chưa sẵn sàng thôi làm cú._
* [💬 Đi xuống hỏi {bien_kich}: "Chị ơi… cảnh mưa đó là chuyện của ai vậy chị?"]
    bien_kich: *(khựng lại, nhìn về hàng ghế cuối)* …Em thấy hả?
    editor: Dạ. Em dựng phim mà.
    _Câu đó bạn đã nói với một người khác, trong một tình huống khác. Lần nào nói ra, cũng có người im lặng rất lâu._
    ~ qh("bien_kich", 5)
- -> END

// ------------------------------------------------------------
=== editor_2710_san_thuong_thai ===
# ngay:27 # gio:11:00 # noi:san_thuong # bat_buoc
_LL-Entertainment ra tay với {sieu_nhan_hong}. Cả công ty nhốn nháo. Bạn lên sân thượng trốn ồn, mang theo ly cà phê đen._
_Sau cái cây phơi đồ, có tiếng {quan_ly_idol} nói điện thoại. Giọng nhỏ, khác mọi khi._
quan_ly_idol: Dạ… ba mươi sáu triệu một tháng… em hiểu. Gấp đôi… Dạ, nếu em đi thì phải mang theo {sieu_nhan_hong}… Còn {idol_het_thoi} thì sao? … Dạ, em hiểu. Không cần.
_"Không cần." Hai chữ đó rơi xuống sân thượng như cái ly nhựa._
~ ed_biet_ll_moi_thai = true
~ phat_hien(ll_moi_thai)
* [😶 Đứng im sau cây phơi đồ, chờ anh ấy đi.]
    _{quan_ly_idol} cúp máy, đứng nhìn xuống đường rất lâu. Rồi đi xuống. Không thấy bạn. Bạn đứng thêm mười phút, ly cà phê nguội._
    ~ cang_thang(10)
* [🤝 Bước ra. Đưa ly cà phê: "Em chưa uống. Anh uống đi."]
    quan_ly_idol: *(giật mình, rồi cười mệt)* Em nghe hết rồi hả?
    editor: Dạ… một chút.
    quan_ly_idol: Đừng ai đăng gì hết. *(uống một ngụm)* Đen không đường. Giống em ha.
    ~ ed_can(5)
    ~ qh("quan_ly_idol", 5)
* [💌 "Anh đi thì… ai lo cho anh {idol_het_thoi}?"]
    quan_ly_idol: *(quay lại, nhìn bạn rất lâu)* …Em hỏi câu mà anh sợ nhất đó {editor}.
    _Anh ấy không trả lời. Nhưng anh ấy cũng không đi xuống ngay. Hai người đứng cạnh nhau trên sân thượng, như ở bãi biển hôm nào._
    ~ ed_can(8)
    ~ qh("quan_ly_idol", 5)
- -> END

// ------------------------------------------------------------
=== editor_2710_luu_luc_toi ===
# ngay:27 # gio:15:00 # noi:sanh_tang_tret # bat_buoc
_Chiều. Một chiếc xe sang màu trắng đỗ trước cổng. Lưu Lực bước xuống, vest trắng, tóc vuốt keo, tập hồ sơ xanh lá chuối kẹp nách._
luu_luc: Chào cả nhà G-Entertainment! Việc hôm nay phải xong từ hôm qua!
_Rồi Lưu Lực thấy {chi_dai} đứng ở quầy lễ tân. Mặt tái đi. Tập hồ sơ rơi xuống sàn, giấy tờ văng tung tóe._
chi_dai: *(khoanh tay)* Ủa. Quen ha.
_Một tờ giấy trượt tới ngay chân bạn. Bản thiết kế "Dự án Hồng Ngoại". Bố cục, font chữ, cách để khoảng trắng… bạn nhận ra tay nghề này. Bạn đã ghép phụ đề lên poster của người này cả năm._
~ phat_hien(quynh_lam_cho_ll)
* [🤝 Nhặt tờ giấy, đưa thẳng cho {chi_dai}.]
    chi_dai: *(liếc tờ giấy, rồi nhìn Lưu Lực)* Hồ sơ hay ha. Để chị giữ giùm.
    _Lưu Lực không dám đòi lại. Mười năm trước có một tô ốc len. Hôm nay vẫn còn mùi._
    ~ qh("chi_dai", 10)
* [😶 Nhặt lên, đưa lại cho Lưu Lực. Chuyện người lớn, cú không xen vào.]
    luu_luc: Cảm ơn em. *(nhìn bạn kỹ)* Em là editor à? Bên anh trả gấp đôi đấy.
    editor: Dạ. Em đang render.
    ~ cang_thang(5)
* [🎥 Rút điện thoại, quay lại cảnh Lưu Lực lượm giấy dưới chân {chi_dai}.]
    _Ba mươi giây. Một CEO vest trắng bò dưới sàn nhặt giấy, một chị đại đứng khoanh tay. Khung hình tự kể chuyện._
    ~ qh("chi_dai", 5)
    ~ follow(3000)
- -> END

// ------------------------------------------------------------
=== editor_2710_mo_thu_muc_thai ===
# ngay:27 # gio:23:30 # noi:can_701 # bat_buoc
_23 giờ 30. Căn 701. Rèm đen. Ba màn hình. Bạn mở thư mục tên "{quan_ly_idol}"._
_Bốn năm. Hai trăm mười bốn đoạn clip. {quan_ly_idol} nghe điện thoại ở hành lang. {quan_ly_idol} ngủ gật trong xe, đầu tựa cửa kính. {quan_ly_idol} cười một mình khi {idol_het_thoi} hát đúng nốt cao. Tờ giấy note "Ly của em nè"._
_Chưa bao giờ dựng. Chưa bao giờ gửi. Đêm nay, lần đầu tiên, bạn kéo chúng lên timeline._
~ ed_thuc_dem()
* [✂️ Dựng thật. Bốn phút. Không chữ, không nhạc, chỉ tiếng thành phố ban đêm.]
    ~ ed_dung_video_thai = true
    ~ ed_can(10)
    _5 giờ sáng. Bốn phút. Bạn xem lại một lần. Hai lần. Lần thứ ba, bạn tắt tiếng, chỉ nhìn._
    _Video không nói "em thích anh". Video chỉ nói: "Em đã thấy anh. Suốt bốn năm."_
* [✂️ Dựng, nhưng thêm một dòng chữ cuối: "Anh cũng xứng đáng được ai đó nhìn thấy."]
    ~ ed_dung_video_thai = true
    ~ ed_can(15)
    _Bạn gõ dòng chữ đó, xóa, gõ lại bảy lần. Lần thứ tám, bạn để yên._
* [😶 Dựng, nhưng không cho mình xem lại. Lưu xong là đóng máy.]
    ~ ed_dung_video_thai = true
    ~ ed_can(-3)
    _Bạn dựng như dựng quảng cáo tiệm ốc: nhanh, gọn, không nhìn kỹ. Lưu xong là gập máy. Có những thứ dựng xong rồi mới thấy sợ._
- -> END
