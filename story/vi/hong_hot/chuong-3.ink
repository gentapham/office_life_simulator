// ============================================================
// THÁNH HÓNG: NGÂN · CHƯƠNG 3: "PIN 3%" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== hong_hot_1310_doanh_nhan ===
# ngay:13 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Doanh nhân Việt Nam. Sếp tự tặng mình một bó hoa hồng to. {sales} trao cho sếp giải "Doanh nhân của năm" của BTT Global. Cúp nhựa mạ vàng._
_Rồi {thanh_ninh} đứng lên đọc bài phát biểu khen sếp. 15 phút. {chi_dai} đứng cuối phòng, cầm bút đếm chữ "tâm"._
* [🔴 Livestream bài phát biểu: "Một trợ lý khen sếp 15 phút không nghỉ".]
    ~ hh_follow(8000)
    ~ qh("thanh_ninh", -10)
    _Bình luận: "Chị này có tâm quá", "Đếm được 23 chữ tâm rồi nè". {thanh_ninh} đọc được bình luận ngay giữa bài._
    ~ hh_so_live_sach = hh_so_live_sach + 1
* [📸 Chụp bó hoa sếp tự tặng mình, gửi group "Hội Anti Sếp".]
    ~ hh_ke_tin()
    _22 giây sau, 9 người thả haha. Bạn để ý: ở đầu bàn, điện thoại của sếp rung. Sếp liếc xuống, ngón cái bấm một cái._
    _Trong group, Hoa Hướng Dương 1989 vừa thả haha vào ảnh bó hoa._
    ~ hh_tin(1)
    { hh_mo_nhanh_hoa_huong_duong:
        _Máy tầng 2. Vách kính. 22:01. Và giờ thì ngón cái của sếp, đúng giây đó._
        _Bạn suýt đánh rơi điện thoại lần thứ hai trong tháng._
        ~ hh_biet_hoa_la_sep = true
        ~ hh_tin(3)
    }
* [🤐 Ngồi nghe, đếm chữ "tâm" cùng {chi_dai}.]
    ~ qh("chi_dai", 5)
    ~ hh_kin(3)
    _Hai mươi ba. Bạn và {chi_dai} nhìn nhau, cùng giơ hai ngón tay và ba ngón tay._
- -> END

// ------------------------------------------------------------
=== hong_hot_1410_moc_2 ===
# ngay:14 # gio:08:30 # noi:ban_mang_xa_hoi # bat_buoc
_Mốc 2: 200.000 người theo dõi. Con số: {nguoi_theo_doi}._
{ nguoi_theo_doi < 200000:
    _Chưa đủ. {sieu_nhan_hong} nhắn group dự án: "Hôm nay anh hơi buồn. Anh đi giúp người cả ngày nha." Rồi lên xe hồng đi mất._
    _Bạn có hai lựa chọn: ngồi lo, hoặc đi theo quay._
    -> buon
- else:
    _Đủ! Sếp gửi group 12 sticker pháo hoa. {sieu_nhan_hong} tạo dáng trước cửa công ty cho bạn chụp._
    ~ hh_follow(5000)
    -> END
}
= buon
* [🎥 Đi theo, quay series "Một ngày Siêu Nhân Hồng không cần ai thấy".]
    _Dắt một cụ già qua đường. Gỡ diều cho con nít. Đẩy xe ba gác lên dốc. Nhặt rác ở Công viên Hồ Cá Mập. Không camera, chỉ có bạn, đứng xa._
    _Cuối ngày, xe hồng của {sieu_nhan_hong} hết xăng giữa đường. Không ai đẩy giùm. Bạn đẩy._
    ~ hh_follow(60000)
    ~ qh("sieu_nhan_hong", 15)
    ~ nghi(-25)
    ~ hh_tt(10)
* [📱 Ở lại công ty, đăng bài cũ để "giữ nhiệt".]
    ~ hh_follow(5000)
    _Bài cũ không ai thả tim. Fanpage nguội như cơm nguội._
* [💬 Nhắn {sieu_nhan_hong}: "Anh ơi, buồn thì nói với em. Đừng đi một mình."]
    sieu_nhan_hong: *(30 phút sau)* … Cảm ơn em. Anh đi một mình quen rồi.
    ~ qh("sieu_nhan_hong", 8)
    ~ hh_follow(10000)
- -> END

// ------------------------------------------------------------
=== hong_hot_1410_son_tren_tivi ===
# ngay:14 # gio:20:15 # noi:nha_hong_hot
_Ngày Hội Nông dân. {thanh_xin_nghi} xin nghỉ "về quê phụ gặt lúa"._
_20:15, Đài Tivi Hóng, vòng 2 "Giọng Ca Ước Mơ". Thí sinh số 17 bước ra trong bộ đồ kim tuyến. Bạn suýt rớt ring light._
_Thí sinh số 17 là {thanh_xin_nghi}. Hát hay. Hay thật sự._
~ phat_hien(son_thi_hat)
~ hh_tin(2)
* {hh_kin_mieng < 40} [📣 Quay màn hình tivi, đăng group: "GẶT LÚA NÈ MẤY BÀ!"]
    ~ hh_ke_tin()
    ~ qh("thanh_xin_nghi", -15)
    _Trong 5 phút, cả group biết. Trong 30 phút, {hr} biết. Sáng mai, {thanh_xin_nghi} được mời "uống trà"._
* [🤐 Bình chọn cho thí sinh số 17. Không kể ai.]
    ~ tien_cong(-10000)
    ~ hh_kin(8)
    ~ qh("thanh_xin_nghi", 5)
* [💬 Nhắn {thanh_xin_nghi}: "Ông hát hay quá. Mà ruộng lúa ở trường quay hả?"]
    thanh_xin_nghi: … {hong_hot}. Tui năn nỉ. Đừng đăng gì hết.
    ~ hh_kin(3)
    ~ qh("thanh_xin_nghi", 3)
* [🔥 Đăng clip lên fanpage công ty: "Nhân viên G-Entertainment đi thi hát!"]
    ~ hh_follow(10000)
    ~ qh("thanh_xin_nghi", -20)
    ~ qh("hr", 3)
    _Clip được chia sẻ nhiều. Nhưng {thanh_xin_nghi} đang "gặt lúa" trên giấy tờ._
- -> END

// ------------------------------------------------------------
=== hong_hot_1510_pin_du_phong ===
# ngay:15 # gio:09:30 # noi:pantry # bat_buoc
_Mất điện cả ngày. 8:05 sếp và {chi_dai} kẹt thang máy 40 phút. Cả công ty ngồi bệt ở pantry tối om._
_Bạn có ba cục pin dự phòng đầy. Ở đây, đó là quyền lực._
designer: Bà ơi cho tui sạc ké. Máy tui 3%.
_Quy tắc mới, do bạn đặt ra ba phút trước: ai muốn sạc thì phải kể một chuyện._
* [🔋 "Ok, sạc 10 phút đổi một chuyện. Ai trước?"]
    ~ hh_pin_doi_tin = hh_pin_doi_tin + 1
    designer: Ờ… tui kể: sếp sửa logo tới bản 37 rồi. Mà tui cá sếp chọn bản 1.
    ~ hh_tin(1)
    chua_te_deadline: Tui kể! Tui làm mất một cái USB. Mà thôi, hông có gì.
    ~ hh_pin_doi_tin = hh_pin_doi_tin + 1
    ~ hh_tin(1)
    thuc_tap_sinh: Dạ… em kể… em nhớ nhà ạ.
    ~ hh_pin_doi_tin = hh_pin_doi_tin + 1
    ~ hh_tin(1)
    -> them
* [🤝 Phát pin miễn phí cho cả pantry.]
    ~ qh("designer", 5)
    ~ qh("thuc_tap_sinh", 5)
    ~ qh("chua_te_deadline", 5)
    _{thuc_tap_sinh} cũng tung ra 5 cục sạc dự phòng có logo ngân hàng. Pantry sáng như rạp hát. Không ai nợ ai chuyện gì._
    ~ hh_kin(3)
    -> END
= them
_{con_ong_chau_cha}, {sales}, {editor} cũng xếp hàng. Họ kể: chuyện penthouse, chuyện "deal sắp chốt", chuyện kênh Diu-túp._
* [🔋 Đổi tiếp. Hết pin thì thôi.]
    ~ hh_pin_doi_tin = hh_pin_doi_tin + 3
    ~ hh_tin(3)
    _Sáu chuyện trong một buổi sáng. Kho Tin Mật đầy tới mức bạn phải mở thêm một trang ghi chú mới._
    ~ hh_bi_don(2)
    _Ở góc pantry, có người thì thầm: "{hong_hot} đổi pin lấy bí mật. Cẩn thận nha."_
* [🙅 Đủ rồi, cho sạc không cần kể.]
    ~ qh("con_ong_chau_cha", 5)
    ~ qh("sales", 5)
    ~ hh_kin(3)
- -> END

// ------------------------------------------------------------
=== hong_hot_1510_trang_47 ===
# ngay:15 # gio:14:20 # noi:pantry # bat_buoc
_Trong góc tối, {ke_toan} nói nhỏ với {chi_dai}: "…trang 47. Thất bại là hoàn gấp đôi. Mười tỷ đó chị." Bạn nghe hết._
_Đây là tin nặng nhất bạn từng nghe._
~ phat_hien(trang_47)
designer: *(chìa điện thoại hết pin)* Bà ơi cho tui sạc ké. Mà bà nghe gì mà mặt tái mét vậy? # hen_gio:5
* {hh_kin_mieng < 40} [📣 "Nghe gì chưa? Công ty mà thất bại là đền 10 tỷ đó bà!"]
    ~ hh_kin(-15)
    _Trong 2 ngày, tin lan tới cả công ty, thêm mắm thành "sếp đã bán công ty"._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 10
    ~ cang_thang(10)
    ~ hh_bi_don(3)
* [🤐 "Hông có gì. Pin nè, sạc đi."]
    ~ hh_giu_trang_47 = true
    ~ hh_giu_tin_cap_cao()
    ~ hh_tin(1)
    _Bạn nuốt tin đó xuống. Nó nằm trong bụng nặng như hòn đá._
* [🗒️ Gõ vội vào ghi chú điện thoại: "trang 47". Không nói gì.]
    ~ hh_kin(5)
    ~ hh_tin(1)
    { RANDOM(1, 10) <= 4:
        _{ran_doc} ngồi ngay cạnh. Màn hình bạn sáng trong bóng tối. Bạn không thấy {ran_doc} liếc qua. Nhưng {ran_doc} có liếc qua._
    - else:
        ~ hh_giu_trang_47 = true
    }
* [⏱️ (Không chọn kịp)]
    _Bạn vô thức nói to: "Mười tỷ hả?"_
    _Cả pantry quay lại. {ke_toan} nhìn bạn bằng ánh mắt lạnh nhất tháng._
    ~ qh("ke_toan", -20)
    ~ hh_kin(-10)
    ~ hh_bi_don(4)
- -> END

// ------------------------------------------------------------
=== hong_hot_1510_phat_hat ===
# ngay:15 # gio:19:00 # noi:pantry
_Vẫn mất điện. Pantry còn vài người. Trong bóng tối, {idol_het_thoi} hát khe khẽ "Công Viên". Không kính đen, không micro, giọng mộc._
_{editor} giơ điện thoại quay, đèn tắt. {quan_ly_idol} ngồi yên, nhìn {idol_het_thoi} như nhìn một thứ rất xa._
_Bạn cũng đang cầm điện thoại. Pin 3%._
* [🎥 Quay luôn, 20 giây cuối.]
    _Clip 20 giây. Giọng hát thật nhất bạn từng nghe trong công ty này._
    ~ hh_tin(1)
    _Bạn lưu vào thư mục "Chưa đăng". Thư mục đó có 312 clip._
* [😶 Tắt màn hình, nghe hết bài.]
    ~ cang_thang(-15)
    ~ qh("idol_het_thoi", 5)
    _Hết bài, không ai vỗ tay. Bạn để ý {editor} không quay {idol_het_thoi}. {editor} đang quay {quan_ly_idol}._
    ~ hh_tin(2)
    ~ phat_hien(linh_thich_thai)
- -> END

// ------------------------------------------------------------
=== hong_hot_1610_gameshow ===
# ngay:16 # gio:10:00 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. Gameshow "Hồng Hay Không Hồng", giải 10 triệu. Bạn ngồi khán đài, vừa xem vừa cắt clip ngắn._
mc_tivi_hong: Xin chào quý vị và các bạn! Phần thi "Hit Một Thời"!
_{sieu_nhan_hong} hát "Công Viên" sai lời: "…bán khoai chiên tại công viên…". Từ cánh gà, có ai đó hát bè đúng lời. Giọng quen lắm._
_Cùng lúc, 2.000 tài khoản avatar xanh lá chuối tràn vào bình luận livestream: "Hát dở", "Giả trân", "Trả tiền vé"._
* [💬 Trực comment, xóa tài khoản xanh lá chuối. (Minigame "Trực Comment")]
    ~ hh_follow(80000)
    -> hong_hot_mg_truc_comment
* [🎬 Cắt clip "khoai chiên" đăng liền, caption: "Hồng hát sai cũng có thái độ".]
    ~ hh_follow(80000)
    ~ hh_follow(25000)
    ~ hh_tt(10)
    _Clip "khoai chiên" thành meme. Một nửa bình luận cười, một nửa hỏi: "Ai hát bè vậy?"_
    ~ scandal()
* [🔍 Lia máy về cánh gà, tìm người hát bè.]
    ~ hh_follow(80000)
    _Kính đen. Áo khoác da. {idol_het_thoi}. Đứng một mình trong bóng tối cánh gà, hát đúng lời bài hát của chính mình._
    ~ hh_tin(2)
    ~ qh("idol_het_thoi", 3)
- -> END

// ------------------------------------------------------------
=== hong_hot_1610_bao_cao ===
# ngay:16 # gio:15:30 # noi:ban_so_lieu
_Thứ 6. Trà sữa thứ 6 từ quỹ phạt đi trễ. Một nửa quỹ là tiền của bạn._
_Rồi tới giờ ngồi với {dan_dau_tu} đối chiếu số liệu fanpage. Anh ấy đã "làm tròn" sẵn ba con số._
* [📊 Bắt lỗi từng dòng. (Minigame "Báo Cáo Số Liệu")]
    -> hong_hot_mg_bao_cao
* [🧋 Uống trà sữa, ký đại cho xong.]
    ~ uong(30)
    ~ cang_thang(-10)
    ~ uy_tin = uy_tin - 3
    dan_dau_tu: Đối tác tin cậy! Anh nợ em ổ bánh mì nha.
    -> END

// ------------------------------------------------------------
=== hong_hot_1610_buffet ===
# ngay:16 # gio:17:30 # noi:pantry
_Ngày Lương thực Thế giới: buffet ở công ty. {hr} đi vòng quanh, cầm danh sách xếp phòng Vũng Tàu._
hr: Em {hong_hot}, mai em được giao livestream cả chuyến đi cho fanpage nha. Em có nguyện vọng gì về phòng không?
* [🙋 "Dạ cho em ở với {designer}!"]
    hr: Ừ. Anh ghi nhận. *(gạch gạch)*
    ~ qh("designer", 3)
* [👀 "Dạ em ở đâu cũng được, miễn có ổ cắm. Mà anh xếp chị {chi_dai} với ai vậy?"]
    hr: *(mỉm cười, gập danh sách)* Bí mật nhân sự, em ạ.
    ~ hh_tin(1)
- ~ an(100)
_Bạn ăn ba đĩa. Mai lên sóng cả ngày, phải có sức._
-> END
