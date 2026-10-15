// ============================================================
// MINIGAME CỦA SIÊU NHÂN HỒNG
// Mỗi minigame có 3 cảnh: mở đầu (_mg_<tên>), thắng (_thang), thua (_thua).
// Game chạy minigame sau cảnh mở đầu, rồi mở cảnh thắng hoặc thua.
// Tiền làm ra đi vào Ví Cát-xê (snh_cat_xe).
// ============================================================

// ------------------------------------------------------------
// 📸 CHỤP POSTER MỘT TRIỆU KIỂU
// ------------------------------------------------------------
=== sieu_nhan_hong_mg_poster ===
# minigame:poster # noi:studio_tang_2
designer: 10 kiểu. Mỗi kiểu 3 giây. Em giơ bản phác, anh tạo dáng y chang. Lệch một ngón tay là em sửa tới sáng.
_Ở cửa studio, {cho} nằm canh. Mắt không rời bộ đồ hồng. Đuôi không vẫy._
designer: Sẵn sàng chưa anh? Kiểu 1: "Siêu nhân nhìn về tương lai".
-> END

=== sieu_nhan_hong_mg_poster_thang ===
# minigame:poster # ket_qua:thang
designer: *(nhìn màn hình, im lặng 5 giây)* …Không cần sửa. Lần đầu tiên trong năm em không phải sửa.
~ snh_cat_xe(300000)
~ an(15)
~ follow(RANDOM(5000, 15000))
~ qh("designer", 10)
_Điều khoản số 4: một đĩa bánh chuối chiên còn nóng chờ sẵn trong phòng chờ. 300.000đ cát-xê vào Ví Cát-xê. Tiền sạch, ai cũng thấy._
{ RANDOM(1, 4) == 1:
    _Kiểu thứ 10, {cho} đi ngang khung hình đúng lúc bấm máy. {designer} định xóa, rồi dừng lại._
    designer: Khoan… tấm này đẹp. Siêu nhân và chó. Để làm poster phụ.
    ~ snh_meme(5000)
}
-> END

=== sieu_nhan_hong_mg_poster_thua ===
# minigame:poster # ket_qua:thua
_Kiểu 7: "Siêu nhân bay". Bạn nhảy lên. {cho} lao vào khung hình, ngoạm áo choàng. Cả hai té nhào lên phông nền._
cho: GRỪ! *(kéo áo choàng ra cửa)*
designer: Hết cứu. *(ôm đầu)* Mai chụp lại. Lần thứ 2. Em đếm đó.
~ snh_cat_xe(100000)
~ cang_thang(10)
~ qh("designer", -3)
_Nhưng {hong_hot} quay được cảnh siêu nhân bị chó kéo áo choàng. Clip lên Tóp-tóp tối đó._
~ snh_meme(15000)
-> END

// ------------------------------------------------------------
// 📱 LIVESTREAM BÁN HÀNG HỒNG
// ------------------------------------------------------------
=== sieu_nhan_hong_mg_livestream ===
# minigame:livestream # noi:studio_tang_2
sales: Hoa hồng 10% nha anh! Nước tăng lực "Hồng Hào", bàn chải "Răng Hồng". Đọc bình luận, chọn câu trả lời, chốt đơn!
_Bình luận chạy liên tục: "Anh ơi mua 2 tặng 1 hông?", "Hồng Hào uống có hồng hào thiệt hông?", "Lộ mặt đi anh ơi", "Lộ mặt đi anh ơi", "Lộ mặt đi anh ơi"._
it: *(tai nghe)* Mạng ổn. Đừng ai mở Tóp-tóp.
-> END

=== sieu_nhan_hong_mg_livestream_thang ===
# minigame:livestream # ket_qua:thang
_Đơn chạy liên tục. {sales} nhảy lên ghế: "Tin chị đi, kỷ lục!"_
~ snh_cat_xe(RANDOM(500000, 2000000))
~ nhan(nuoc_tang_luc)
~ uong(15)
~ nghi(20)
~ follow(15000)
~ qh("sales", 10)
_Một bình luận nổi lên: "Lộ mặt đi anh ơi"._
* [🦸 "Mặt anh là thái độ! Mua Hồng Hào là thấy mặt anh trong gương!"]
    ~ follow(5000)
    _Câu trả lời thành meme dễ thương. Đơn chạy thêm._
* [🙂 "Mặt anh bình thường lắm. Mấy em xem anh vì mấy việc anh làm được hông?"]
    ~ follow(3000)
    ~ snh_no(-1)
    _Bình luận im một nhịp. Rồi: "Được anh ơi". Rồi một chuỗi trái tim._
- _Hết buổi, {sales} đưa bạn một thùng nước tăng lực mẫu, kèm hóa đơn hoa hồng. {ke_toan} nhìn hóa đơn, gật đầu. Lần đầu tiên chị gật đầu với hóa đơn của {sales}._
-> END

=== sieu_nhan_hong_mg_livestream_thua ===
# minigame:livestream # ket_qua:thua
_Bạn đọc nhầm. "Bàn chải Răng Hồng" thành "Bàn chải Hồng Răng". "Nước Hồng Hào" thành "Nước Hào Hồng". Rồi mạng giật, hình đứng đúng lúc bạn đang há miệng._
it: Mạng không lỗi. Có người mở Tóp-tóp.
chua_te_deadline: *(ở góc phòng, giấu điện thoại)* …Không phải em.
~ snh_cat_xe(200000)
~ cang_thang(10)
~ qh("sales", -3)
_Ảnh chụp màn hình siêu nhân há miệng, chú thích "Hào Hồng", thành meme._
~ snh_meme(10000)
-> END

// ------------------------------------------------------------
// 📺 GAMESHOW "HỒNG HAY KHÔNG HỒNG"
// ------------------------------------------------------------
=== sieu_nhan_hong_mg_gameshow ===
# minigame:gameshow # noi:dai_tivi_hong
mc_tivi_hong: Vòng 1: câu đố nhanh! Vòng 2: vượt chướng ngại vật… trong bộ đồ hồng! Vòng 3: câu hỏi cá nhân, trị giá 10 triệu đồng!
_Khán giả trường quay vỗ tay. Ở cánh gà, {thanh_xin_nghi} giơ ngón cái. Bên cạnh là {idol_het_thoi}, kính đen, khoanh tay._
mc_tivi_hong: Nhưng trước đó, phần đặc biệt "Hit Một Thời": Siêu Nhân Hồng sẽ hát lại bài hit 2015, "Công Viên"!
sieu_nhan_hong: *(hát)* Ngày xưa có đôi bạn thân… bán… khoai chiên tại công viên!
_Trường quay cười ồ. Bạn hát sai lời._
{ qh_idol_het_thoi >= 10:
    _Từ cánh gà, một giọng hát bè cất lên, sửa lại cho đúng: "…cá viên chiên tại công viên…". {idol_het_thoi}. Trường quay vỗ tay rần rần._
    ~ follow(20000)
    ~ qh("idol_het_thoi", 10)
}
~ follow(80000)
-> END

=== sieu_nhan_hong_mg_gameshow_thang ===
# minigame:gameshow # ket_qua:thang
mc_tivi_hong: Xuất sắc! Siêu Nhân Hồng vượt qua vòng 1 và vòng 2! Một giỏ quà từ nhà tài trợ!
~ nhan(nuoc_tang_luc)
~ an(15)
~ follow(10000)
-> sieu_nhan_hong_mg_gameshow_cau_cuoi

=== sieu_nhan_hong_mg_gameshow_thua ===
# minigame:gameshow # ket_qua:thua
_Vòng 2. Bộ đồ hồng mắc vào chướng ngại vật số 3. Bạn treo lơ lửng trên cái xà như một cái lồng đèn._
mc_tivi_hong: Ối! Siêu Nhân Hồng… bị treo! Quý vị cho một tràng pháo tay!
~ snh_meme(25000)
~ cang_thang(10)
-> sieu_nhan_hong_mg_gameshow_cau_cuoi

=== sieu_nhan_hong_mg_gameshow_cau_cuoi ===
mc_tivi_hong: Câu hỏi cuối cùng, trị giá 10 triệu đồng! Siêu Nhân Hồng ơi, khán giả muốn biết: anh có dám tháo mũ ngay tại đây không?
_Khán giả trường quay đếm ngược: 5… 4…_ # hen_gio:5
* [🦸 Tạo dáng: "Hồng không phải màu, Hồng là thái độ! Mà thái độ của anh là… để dành!"]
    mc_tivi_hong: Ôi, khéo quá! Nhưng không có 10 triệu nha anh!
    ~ follow(20000)
* [🙂 Đưa tay lên mũ, kéo lên tới cằm, rồi dừng.]
    ~ snh_mat(25)
    ~ follow(50000)
    ~ snh_thuong_gameshow = true
    mc_tivi_hong: Gần như tháo rồi! Ban giám khảo… tính! 10 triệu là của anh!
    _Đêm đó, ảnh cái cằm của bạn được phóng to trên khắp mạng xã hội. Người ta đoán đủ kiểu._
* [🆘 "Khoan! Ngoài kia có người cần giúp!" *(chạy khỏi trường quay)*]
    { RANDOM(1, 10) <= 3:
        _Ngoài cổng đài có thật một chiếc xe chết máy. Bạn đẩy nó giữa ánh đèn camera của cả đoàn quay._
        ~ follow(40000)
        ~ snh_giup_nguoi()
    - else:
        _Ngoài cổng không có ai. Bên trong, MC đứng một mình trên sân khấu, cười gượng 30 giây._
        ~ snh_meme(10000)
    }
* [⏱️ (Không chọn kịp)]
    mc_tivi_hong: Vậy là anh chọn im lặng! Không có tiền thưởng!
    _Điện thoại rung. {quan_ly_idol} gọi. Rồi gọi tiếp. Hai cuộc liền._
- -> END

// ------------------------------------------------------------
// 🆘 GIÚP NGƯỜI KHẮP QUẬN
// ------------------------------------------------------------
=== sieu_nhan_hong_mg_giup_nguoi ===
# minigame:giup_nguoi # noi:quan_hong
_Quận Hóng. Đẩy xe chết máy, gỡ diều trên cây, dắt cụ qua đường, nhặt rác ở Công viên Hồ Cá Mập. Mỗi việc là một minigame nhỏ._
_Không ai giao lịch. Không ai trả cát-xê. Không ai bắt tạo dáng._
-> END

=== sieu_nhan_hong_mg_giup_nguoi_thang ===
# minigame:giup_nguoi # ket_qua:thang
~ snh_giup_nguoi()
_Một chú xe ôm đẩy xe xong, dúi vào tay bạn ổ bánh mì. Một bà bán nước mía rót cho một ly. Một đứa nhỏ lấy lại được con diều, đưa bạn trái bắp nướng nó đang cầm._
~ nhan(banh_mi)
~ uong(25)
~ an(15)
~ cang_thang(-10)
{ RANDOM(1, 10) <= 3:
    _Có người quay lại. Tối đó, clip "Siêu nhân gỡ diều cho con nít" lên xu hướng._
    ~ follow(RANDOM(20000, 50000))
- else:
    _Không ai quay. Không ai biết. Chỉ có đứa nhỏ cầm con diều vẫy tay chào tới khi bạn khuất ở cuối đường._
}
-> END

=== sieu_nhan_hong_mg_giup_nguoi_thua ===
# minigame:giup_nguoi # ket_qua:thua
_Bạn đẩy xe chết máy giùm một anh, đẩy được 500 mét thì… xe của bạn hết xăng. Giữa Đại Lộ Kẹt Xe._
_Anh kia đã đi mất. Bạn dắt chiếc xe hồng đi bộ 2 km tìm cây xăng, trời bắt đầu mưa._
~ snh_giup_nguoi()
~ nghi(-20)
~ cang_thang(10)
~ follow(-5000)
_Giúp cả phố, xe mình thì hết xăng. Bạn cười một mình dưới mũ. Lần nào cũng vậy._
-> END

// ------------------------------------------------------------
// 💃 ĐU TREND TÓP-TÓP
// ------------------------------------------------------------
=== sieu_nhan_hong_mg_tiktok ===
# minigame:tiktok # noi:san_thuong
hong_hot: Nhịp 1-2-3-xoay-chỉ tay! Anh bấm theo nhịp nha. Mặc bộ đó thì khó gấp đôi, nhưng mà hồng thì phải chịu!
_Nhạc lên. Gió sân thượng thổi tung áo choàng. Ở cây phơi đồ, một cái áo của ai đó đang bay về phía bạn._
-> END

=== sieu_nhan_hong_mg_tiktok_thang ===
# minigame:tiktok # ket_qua:thang
hong_hot: Ối dồi ôi! Chuẩn từng nhịp! Đăng liền!
~ nhan(tra_sua)
~ uong(30)
~ snh_cat_xe(200000)
~ follow(10000)
~ qh("hong_hot", 10)
_{hong_hot} đãi bạn ly trà sữa dâu. Clip "Siêu nhân nhảy trend" có 200.000 lượt xem trước giờ ăn tối. Phần lớn bình luận: "Slay!"._
-> END

=== sieu_nhan_hong_mg_tiktok_thua ===
# minigame:tiktok # ket_qua:thua
_Nhịp "xoay". Áo choàng quấn vào chân. Bạn xoay thêm nửa vòng rồi đổ cái rầm xuống sàn sân thượng, đầu cắm vào thùng nước._
hong_hot: Trời đất ơi! Anh có sao hông?! *(nhưng vẫn quay)*
~ nghi(-10)
~ uong(10)
~ snh_meme(25000)
_Clip "Siêu nhân cắm đầu vào thùng nước" lên xu hướng hạng 4. Người theo dõi tăng vọt. Mà toàn người theo dõi để… chờ bạn té tiếp._
-> END

// ------------------------------------------------------------
// 🎁 QUÀ CHO VŨ
// ------------------------------------------------------------
=== sieu_nhan_hong_mg_qua_vu ===
# minigame:qua_vu
_Quà Cho {chua_te_deadline}. Chọn quà, chọn lúc tặng. Đừng tặng lúc cậu ta đang "nước tới chân". Đừng để camera nào gần đó._
* [🖊️ Bút hồng.]
    ~ snh_mg_qua_dat_tien = false
* [🛏️ Gối ôm hồng.]
    ~ snh_mg_qua_dat_tien = false
* [🍱 Hộp cơm hồng tự làm.]
    ~ snh_mg_qua_dat_tien = false
* [⌚ Đồng hồ hồng mạ vàng, đặt từ nước ngoài.]
    ~ snh_mg_qua_dat_tien = true
    ~ snh_ket(15)
- _Ở bàn bên, {hong_hot} đang cầm điện thoại. Không biết có đang quay không._
* [😶 Đợi {hong_hot} đi khỏi rồi mới tặng.]
    ~ snh_mg_qua_co_camera = false
* [📸 Kệ. Quay được thì càng tốt.]
    ~ snh_mg_qua_co_camera = true
- -> END

=== sieu_nhan_hong_mg_qua_vu_thang ===
# minigame:qua_vu # ket_qua:thang
{ snh_mg_qua_co_camera:
    ~ snh_qua_truoc_camera = true
    ~ snh_tim(3)
    ~ follow(5000)
    chua_te_deadline: *(nhìn {hong_hot} đang quay, rồi nhìn món quà)* À… PR hả anh? Ok, em cười nè. *(cười vào máy)*
    _Clip được 5.000 lượt thích. Cậu ta để món quà trên bàn, chưa mở._
- else:
    { snh_mg_qua_dat_tien:
        chua_te_deadline: *(mở hộp, đứng hình)* Anh… cái này bao nhiêu tiền vậy? Em… em hông nhận được đâu.
        ~ snh_tim(5)
        _Cậu ta trả lại, lịch sự. Nhưng tối đó bạn thấy cậu ta lên mạng tra giá cái đồng hồ. Rồi tra "Siêu Nhân Hồng giàu cỡ nào"._
        ~ snh_tien(5)
    - else:
        ~ snh_tim(RANDOM(10, 15))
        chua_te_deadline: *(mở quà, nhìn rất lâu)* …Cảm ơn anh.
        _Rồi cậu ta làm một việc không ai ngờ: bẻ đôi ổ bánh mì đang ăn dở, đưa bạn một nửa._
        chua_te_deadline: Nè. Em chưa ăn trưa. Anh cũng chưa đúng hông?
        ~ nhan(banh_mi)
        _Nửa ổ bánh mì. Món quà quý nhất cả tháng._
    }
}
-> END

=== sieu_nhan_hong_mg_qua_vu_thua ===
# minigame:qua_vu # ket_qua:thua
_Bạn tặng đúng lúc {chua_te_deadline} đang gõ phím như điên, mắt đỏ, 3 tab deadline mở cùng lúc._
chua_te_deadline: Anh ơi… anh để đó đi. Nước tới chân rồi. Đừng có đứng sau lưng em.
~ snh_tim(-3)
~ cang_thang(5)
{ snh_mg_qua_co_camera:
    ~ snh_qua_truoc_camera = true
    _{hong_hot} quay được cảnh bạn bị đuổi khéo. Clip "Siêu nhân bị từ chối" có 10.000 lượt xem._
    ~ snh_meme(10000)
}
_Món quà nằm trên góc bàn tới tối. Sáng hôm sau, nó vẫn ở đó. Tới chiều thì biến mất. Không ai biết cậu ta mang về hay vứt._
-> END
