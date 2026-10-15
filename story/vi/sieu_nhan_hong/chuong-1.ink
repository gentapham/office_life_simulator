// ============================================================
// CHƯƠNG 1: "VALI TIỀN VÀ CHIẾC MŨ" (1/10 – 4/10)
// Người chơi là {sieu_nhan_hong}. 🦸 = đang mặc đồ, 🙂 = đã tháo mũ.
// ============================================================

// ------------------------------------------------------------
=== sieu_nhan_hong_0110_xe_hong_toi ===
# ngay:1 # gio:08:50 # noi:cong_cong_ty # bat_buoc
_8:50. Chiếc xe màu hồng đỗ trước cổng {cong_ty}. Bạn chỉnh mũ trong gương chiếu hậu. Hít một hơi. Hôm nay là ngày đầu tiên._
_Trong gương là Siêu Nhân Hồng. Dưới cái mũ là Nguyễn {sieu_nhan_hong}, tim đập như trống trường._
cho: GRỪ… GÂU GÂU GÂU!
_Một con chó lông vàng lao ra từ chòi bảo vệ, sủa như thể bạn vừa ăn trộm bát cơm của nó._
bac_bao_ve: {cho}! Im nào. *(nhìn bạn từ đầu tới chân)* Cậu là… cái cậu siêu nhân đấy à?
* [🦸 Tạo dáng: "Biến hình! Chào bác! Hồng không phải màu, Hồng là thái độ!"]
    bac_bao_ve: Ừ. Thế à. *(uống một ngụm trà đá)*
    cho: GÂU GÂU GÂU GÂU!
    ~ follow(1000)
    _Không ai vỗ tay. Chỉ có con chó sủa to hơn._
* [🐕 Giả tiếng sủa lại: "Gâu! Gâu gâu! Chào em nha!"]
    ~ snh_choc_tuat()
    cho: GRỪ… GÂU! *(nhe răng, lông dựng ngược)*
    bac_bao_ve: Cậu đừng trêu nó. Nó nhớ dai lắm.
    _Bạn chưa biết, nhưng một cuộc chiến vừa bắt đầu. Nó sẽ kéo dài cả tháng._
* [🙂 Cúi đầu thật thấp: "Dạ… con chào bác. Con xin lỗi, con làm em chó sợ."]
    bac_bao_ve: Ơ… cậu lễ phép thế. *(nhìn lâu hơn một chút)* Vào đi. Phòng họp tầng 2.
    ~ qh("bac_bao_ve", 5)
    cho: Grừ… *(vẫn gầm gừ, nhưng không sủa)*
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2 chật kín người. Trên bàn là bản hợp đồng 52 trang bạn đã… lật qua. Lật thôi._
giam_doc: Các em! Hôm nay là một ngày lịch sử của {cong_ty}! Xin giới thiệu đối tác chiến lược của chúng ta: Siêu Nhân Hồng!
* [🦸 "Chào cả nhà! Hồng không phải màu, Hồng là thái độ!" *(tạo dáng)*]
    _Cả phòng vỗ tay. Có người huýt sáo. Tim bạn đập nhanh vì vui. Lâu lắm rồi mới có nhiều người vỗ tay vậy._
    ~ follow(2000)
* [🦸 "Vì công lý và lượt view!" *(tạo dáng hai tay)*]
    hong_hot: *(quay video)* Ối dồi ôi, câu này phải làm slogan!
    ~ follow(3000)
- _Bạn tháo găng tay để ký. Vết sẹo nhỏ trên mu bàn tay trái lộ ra. Bạn quen rồi, không giấu._
ke_toan: *(thì thầm với {giam_doc})* Anh ơi, anh đọc giúp em trang 47 trước khi ký đã…
giam_doc: Thôi em, đối tác đang chờ. Anh không ép, tùy em… mà thôi ký luôn.
_Hai chữ ký. 5 tỷ. Cả phòng reo hò. Bạn đi vòng bàn bắt tay từng người. Tới một cậu nhân viên mới, cậu ta bắt tay bạn rất chặt, nhìn rất lâu vào vết sẹo._
ran_doc: Dạ, em chào anh. Em là {ran_doc}.
* [🦸 "Úi, tay em khỏe dữ! Anh là Siêu Nhân Hồng nè!"]
    ran_doc: *(cười, nhưng mắt không cười)* Dạ.
    _Không có gì xảy ra. Ngay bây giờ._
* [🙂 "{ran_doc} hả… tên này anh nghe quen quen."]
    ~ snh_nghe_ten_quen = true
    ~ snh_no(5)
    _{ran_doc} khựng lại. Bàn tay buông ra hơi nhanh._
    ran_doc: Chắc tên em phổ biến thôi anh.
    _Bạn không nhớ ra. Nhưng có cái gì đó nhói lên trong ngực, như chạm vào vết thương cũ._
* [📸 "Chụp chung một tấm làm kỷ niệm ngày đầu nha em!"]
    ~ follow(2000)
    _Tách. Tấm ảnh nằm trong điện thoại {ran_doc}. Bạn không biết cậu ta sẽ phóng to nó, đúng chỗ vết sẹo._
    ~ snh_hieu(5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0110_gap_vu ===
# ngay:1 # gio:10:15 # noi:phong_hop_tang_2 # bat_buoc
_Sau khi ký, cả phòng cuống cuồng: lịch quay, poster, MV, livestream. {truong_phong} viết kín ba cái bảng trắng._
_Chỉ có một người ngồi góc phòng, chân gác lên ghế, lướt điện thoại. Tóc rối, áo thun nhăn, đeo tai nghe một bên._
truong_phong: {chua_te_deadline}! Lịch MV ra sao rồi? Ngày 9 là ra mắt đấy!
chua_te_deadline: *(không ngẩng lên)* Chill, kịp hết.
_Bạn đứng hình 3 giây. Cả thế giới đang chạy, có một người ngồi yên. Như cái ghế đá giữa công viên giờ cao điểm._
~ snh_tim(5)
* [🦸 Đi tới, tạo dáng: "Chào em! Anh là Siêu Nhân Hồng! Em làm gì vậy?"]
    chua_te_deadline: Lướt Tóp-tóp. *(liếc lên)* Ủa, anh là cái ông 5 tỷ hả? Đồ đẹp đó. Hồng dữ.
    _Rồi cậu ta lướt tiếp. Không xin chụp ảnh. Không hỏi tiền. Không cần gì ở bạn._
    ~ snh_tim(2)
* [🙂 Ngồi xuống ghế bên cạnh, im lặng, cũng lướt điện thoại.]
    _5 phút sau, cậu ta chìa màn hình qua: một clip con mèo té khỏi bàn._
    chua_te_deadline: Coi nè anh. Con này ngu ghê.
    _Bạn cười. Lần đầu tiên trong ngày, bạn cười mà không cần tạo dáng._
    ~ snh_tim(5)
* [🎁 Tặng ngay cây bút hồng trong túi.]
    chua_te_deadline: Ủa? Cho em hả? *(cầm, xoay xoay)* Chiêu PR mới hả anh? Được đó.
    ~ snh_tim(1)
- _Bạn quay đi, mới nhớ ra chưa hỏi tên. Bạn hỏi {hong_hot}._
hong_hot: Ổng hả? {chua_te_deadline}. Chúa tể deadline. Ối dồi ôi, anh đừng dính vô, ổng làm tim người ta đứng như deadline vậy á.
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0110_phong_cho ===
# ngay:1 # gio:12:15 # noi:phong_cho
_Phòng chờ của bạn. Điều khoản số 4: một đĩa bánh chuối chiên còn nóng. Ai đó đã nhớ._
_{quan_ly_idol} bước vào, hai điện thoại kẹp hai bên tai._
quan_ly_idol: Khoan, anh nghe máy chút. *(điện thoại 1)* Ừ, poster thứ 3 tuần sau. *(điện thoại 2)* Không, {idol_het_thoi} không hát đám cưới đó. Chuyện này để anh lo!
quan_ly_idol: Rồi. Em là {sieu_nhan_hong} hả? Từ nay anh quản lý lịch của em. Có mấy điều: một, đừng đăng gì khi chưa hỏi anh.
* [🦸 "Dạ! Siêu Nhân Hồng sẵn sàng!" *(tạo dáng)*]
    quan_ly_idol: Ừ… sẵn sàng là tốt. Đừng tạo dáng trong thang máy. Thang máy hay kẹt.
* [🙂 Tháo mũ ra lau mồ hôi trước mặt {quan_ly_idol}.]
    ~ snh_thao_mu(false)
    quan_ly_idol: *(ngưng nói chuyện điện thoại 2 giây)* …À. Em… mặt bình thường ghê.
    quan_ly_idol: Đừng để ai thấy. Chuyện này để anh lo. Mà tốt nhất anh cũng không nên thấy.
    ~ qh("quan_ly_idol", 5)
* [🍌 Mời {quan_ly_idol} ăn bánh chuối chiên.]
    quan_ly_idol: *(cắn một miếng, đứng yên)* …Lâu rồi anh mới ăn cái gì mà không phải đứng.
    ~ qh("quan_ly_idol", 8)
    ~ an(15)
- quan_ly_idol: Hai, mỗi tuần một buổi chụp, một buổi livestream. Ba, đừng chọc con chó ở cổng nữa. Bác {bac_bao_ve} cưng nó lắm.
~ an(15)
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0110_nha_12_ghe ===
# ngay:1 # gio:21:00 # noi:nha_nguyen
_Căn nhà ở cuối con đường không tên. Bàn ăn 12 ghế. Bạn ngồi cái ghế duy nhất có dấu ngồi._
_Tối nay ăn hộp cơm mua dọc đường. Ở 11 cái ghế kia, chỉ có bóng đèn chiếu xuống._
_Điện thoại rung. Group Zalo-lô công ty vừa thêm bạn vào. 23 thành viên._
giam_doc: *(22:00)* Các em ngủ sớm nhé, mai 8h30 họp chiến dịch "Hồng Hóa Việt Nam". Anh không ép, tùy các em.
* [🦸 Gửi sticker siêu nhân tạo dáng.]
    _12 người thả "haha". Bạn đếm đi đếm lại. 12. Như số ghế._
    ~ follow(500)
* [🙂 Gõ "Chúc cả nhà ngủ ngon", rồi xóa. Rồi gõ lại. Rồi xóa.]
    _Bạn để màn hình sáng tới khi nó tự tắt._
    ~ cang_thang(5)
* [💬 Bấm vào tên {chua_te_deadline} trong danh sách thành viên.]
    _Ảnh đại diện: một con mèo đang ngủ. Trạng thái: "Còn sớm mà". Bạn bấm "Kết bạn". Rồi hủy. Rồi bấm lại._
    ~ snh_tim(2)
- _Bạn tắt đèn. Bộ đồ hồng treo trên móc ở góc phòng, như một người khác đang đứng nhìn bạn ngủ._
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0210_hop_chien_dich ===
# ngay:2 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp chiến dịch "Hồng Hóa Việt Nam". Màn hình: MỤC TIÊU 1.000.000. Hiện tại: {nguoi_theo_doi}._
giam_doc: Một triệu người theo dõi trước 31/10. Cái này là mindset!
sales: Tin chị đi, chị chốt 3 nhà tài trợ, 2 tỷ, Tập đoàn Bánh Tráng Trộn Toàn Cầu. Chủ tịch là Mr. Kevin Trộn. No cap.
thuc_tap_sinh: Dạ… em có ý tưởng phim ngắn ạ. Một người bỏ việc ngân hàng, trời mưa, xe chết máy, có người lạ đẩy giùm 2 cây số…
_Bạn khựng lại. Mưa. Xe chết máy. 2 cây số. Bạn từng đẩy xe cho một anh mặc sơ mi trắng như vậy. Hồi tháng… mà thôi, bạn đẩy xe cho cả trăm người rồi._
bien_kich: *(ghi chép lia lịa)* Hay. Cần thêm nỗi đau.
truong_phong: Anh {sieu_nhan_hong}, anh có ý kiến gì không?
* [🦸 "Anh tình nguyện đi gặp tất cả mọi người! Gét gô!"]
    truong_phong: Tuyệt vời. Mình take note.
    ~ follow(3000)
    _Cả phòng vỗ tay. Bạn sẽ đi gặp tất cả. Kể cả con chó ở cổng._
* [🙂 "Dạ… ờm… ý tưởng phim của em {thuc_tap_sinh} hay đó. Anh muốn đóng."]
    thuc_tap_sinh: *(đỏ mặt)* Dạ… dạ anh thích thật hả ạ?
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("bien_kich", -3)
* [💬 "Anh có câu hỏi: hợp đồng mình… có trang nào quan trọng mà anh cần biết hông?"]
    _{ke_toan} ngẩng phắt lên. {giam_doc} cười to._
    giam_doc: Hợp đồng chuẩn quốc tế rồi em. Không có gì phải lo!
    _{ke_toan} nhìn bạn rất lâu. Rồi cúi xuống, không nói gì._
    ~ qh("ke_toan", 5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0210_tra_sua_thu_6 ===
# ngay:2 # gio:15:00 # noi:pantry
_Trà sữa thứ 6. Cả tầng 1 xếp hàng order. Bạn đứng cuối hàng, sau {chua_te_deadline}._
chua_te_deadline: *(với người ghi order)* Nhiều đá. Để trưa ngủ cho mát.
_Đến lượt bạn._
* [🦸 "Trà sữa dâu! Topping hồng! Hồng nhiều nhiều!"]
    hong_hot: Đúng chất! *(quay lại)*
    ~ follow(1000)
    ~ uong(30)
* [🙂 "Cho anh giống {chua_te_deadline}. Nhiều đá."]
    chua_te_deadline: *(quay lại)* Ủa, anh cũng thích ngủ trưa hả?
    _Bạn không thích. Bạn chỉ muốn uống cùng một thứ với ai đó._
    ~ snh_tim(3)
    ~ uong(30)
* [💸 "Hôm nay anh bao cả công ty! Mỗi người thêm một ly!"]
    ~ snh_ket(8)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    hong_hot: TRỜI ƠI! Đại gia hồng!
    ke_toan: *(nhìn hóa đơn)* Anh trả bằng… tiền gì đây anh?
    _Bạn cười, không trả lời. {ke_toan} ghi gì đó vào sổ._
    ~ uong(30)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0310_giup_nguoi_cuoi_tuan ===
# ngay:3 # gio:09:00 # noi:quan_hong
_Thứ 7. Không ai giao lịch. Bạn mặc đồ, lên xe hồng, chạy quanh Quận Hóng._
_Ngã tư Đại Lộ Kẹt Xe: một chị bán vé số bị kẹt xe đẩy giữa đường. Công viên Hồ Cá Mập: một con diều mắc trên cây. Hẻm 69: một cụ ông đứng nhìn cái hẻm như nhìn sông._
* [🆘 Đi giúp hết, từng người một.]
    -> sieu_nhan_hong_mg_giup_nguoi
* [📸 Giúp chị bán vé số, nhờ chị quay giùm một clip.]
    ~ snh_giup_nguoi()
    _Chị quay. Clip rung, mờ, có ngón tay che một góc. Bạn đăng lên._
    ~ follow(3000)
    _"Hôm nay Hồng giúp một chị bán vé số đẩy xe! Slay!" 47 lượt thích. 3 bình luận: "Diễn hả?", "Mặt đâu?", "Hồng đẹp á"._
* [😴 Về nhà ngủ bù.]
    ~ nghi(30)
    _Căn nhà 12 ghế. Ngủ tới trưa. Không ai gọi._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0410_ngay_dong_vat ===
# ngay:4 # gio:10:00 # noi:cong_cong_ty # bat_buoc
_Chủ nhật, Ngày Động vật Thế giới. Bạn ghé công ty "tiện đường". Thật ra là cố ý._
_{cho} vừa được {chi_dai} tắm, mặc áo, đội nơ hồng. Mặt cực kỳ không vui._
cho: Grừ…
bac_bao_ve: Cậu {sieu_nhan_hong}, hôm nay nó đã khổ lắm rồi. Tha cho nó.
* [🐕 Giả tiếng sủa: "Gâu! Gâu gâu! {cho} ơi, nơ của em hồng giống anh nè!"]
    ~ snh_choc_tuat()
    cho: GÂU GÂU GÂU!
    hong_hot: *(từ đâu xuất hiện, điện thoại giơ cao)* Quay được rồi! Siêu nhân chọc chó!
    ~ follow(8000)
    -> sieu_nhan_hong_0410_mat_gang
* [🙂 Ngồi xuống, tháo cái nơ ra cho {cho}.]
    _Bạn tháo găng, tháo cái nơ. {cho} khựng lại, ngửi bàn tay có vết sẹo. Không sủa._
    ~ qh("cho", 10)
    ~ qh("bac_bao_ve", 5)
    chi_dai: Ủa? Lần đầu nó cho ai đụng mà không sủa đó. Trừ chị.
    _Rồi {cho} ngoạm chiếc găng tay bạn vừa đặt xuống đất, chạy biến._
    -> sieu_nhan_hong_0410_mat_gang
* {co(xuc_xich)} [🦴 Lấy xúc xích trong túi ra.]
    ~ mat(xuc_xich)
    ~ snh_cho_xuc_xich()
    cho: *(ăn sạch, rồi vẫn sủa)* GÂU!
    bac_bao_ve: Ăn thì ăn, ghét thì vẫn ghét. Nó thế đấy.
    _Trong lúc bạn cười, {cho} ngoạm luôn chiếc găng tay hồng trên tay bạn, chạy mất._
    -> sieu_nhan_hong_0410_mat_gang

= sieu_nhan_hong_0410_mat_gang
_{cho} chạy vào gầm cầu thang. Chiếc găng tay hồng biến mất cùng nó._
* [🐕 Đuổi theo, giả làm chó bò vào gầm cầu thang.]
    ~ snh_choc_tuat()
    cho: GRỪ! *(chắn cửa kho, nhe răng)*
    ~ snh_meme(10000)
    hong_hot: Siêu nhân bò bằng bốn chân! Clip này mà không lên xu hướng tui đi bằng đầu!
* [🙂 "Thôi, em giữ đi. Coi như quà Ngày Động vật."]
    bac_bao_ve: Thế à. *(gật đầu)* Cậu này được.
    ~ qh("bac_bao_ve", 5)
    ~ qh("cho", 5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_0410_ga_cao_su ===
# ngay:4 # gio:15:30 # noi:tang_1
_Chiều. Công ty vắng. Bạn quay lại lấy cái bình nước. Trên sàn tầng 1 có một con gà cao su màu vàng, bị gặm mòn một bên cánh._
_Đồ chơi của {cho}. Nó vừa lấy găng tay của bạn. Giờ bạn đang cầm con gà của nó._
* [🐕 Giấu con gà ra sau tủ mạng. Cho nó biết cảm giác mất đồ.]
    ~ snh_giau_ga_cao_su = true
    ~ snh_choc_tuat()
    _Bạn nhét con gà vào khe sau tủ mạng, cười một mình. Chỉ đùa thôi. Mai trả._
    _Bạn sẽ quên trả. Và con gà đó sẽ quay lại vào một ngày rất tệ._
* [🙂 Đặt con gà vào ổ của {cho} ở chòi bảo vệ.]
    ~ qh("cho", 8)
    bac_bao_ve: *(nhìn con gà, rồi nhìn bạn)* Cậu nhặt được à? Nó tìm cả chiều.
    ~ qh("bac_bao_ve", 5)
* [😶 Để nguyên đó.]
    _Bạn bước qua. Con gà nằm đó, nhìn trần nhà bằng đôi mắt cao su._
- -> END
