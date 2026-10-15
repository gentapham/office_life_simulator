// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · CHƯƠNG 3: "RENDER TRONG BÓNG TỐI" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== editor_1310_video_doanh_nhan ===
# ngay:13 # gio:13:20 # noi:phong_dung_phim # bat_buoc
_Ngày Doanh nhân Việt Nam. Sáng nay {thanh_ninh} đọc bài khen sếp 15 phút. {giam_doc} tự tặng hoa cho mình, và treo tấm bằng "Doanh nhân của năm" của BTT Global trong phòng._
giam_doc: *(đứng ở cửa phòng dựng)* Lĩnh à, em dựng giúp anh một video "Hành trình doanh nhân" nhé. Ba phút. 5 giờ chiều anh đăng. Anh không ép.
_Tư liệu: 14 ảnh {giam_doc} chụp với người nổi tiếng (người nổi tiếng thì bị cắt mất nửa mặt), một clip {giam_doc} đánh golf hụt bóng, và tấm bằng BTT Global._
* [🎬 Dựng hoành tráng: nhạc sử thi, slow-motion cú đánh golf… cắt trước lúc hụt bóng.]
    ~ qh("giam_doc", 10)
    ~ uy_tin = uy_tin + 3
    giam_doc: *(xem xong, mắt ướt)* Đây. Đây là anh. Đây là văn hóa.
    _{giam_doc} đăng lúc 17:00. 41 lượt thích. 40 lượt là nhân viên. 1 lượt là ngân hàng._
* [😏 Dựng hoành tráng… nhưng để nguyên cú hụt bóng, kèm hiệu ứng âm thanh "toang".]
    ~ qh("giam_doc", -5)
    ~ qh("hong_hot", 5)
    ~ follow(3000)
    giam_doc: *(xem, im lặng, rồi bật cười)* Thôi được. Đời doanh nhân cũng có lúc hụt. Đăng.
    _Video được chia sẻ trong group "Hội Anti Sếp" 14 lần. Một tài khoản tên "Hoa Hướng Dương 1989" thả haha đầu tiên._
* [🦉 Dựng bình thường, ba phút, gọn. Giấu con cú trên tấm bằng BTT Global.]
    ~ ed_dau_cu_chung_minh = ed_dau_cu_chung_minh + 1
    _Con cú đậu trên chữ "Global". 1/25 giây. Bạn thấy hợp lý: cú đêm và một tập đoàn không tồn tại, hai thứ ít người nhìn thấy._
- ~ ed_thuc_dem()
-> END

// ------------------------------------------------------------
=== editor_1410_moc_2 ===
# ngay:14 # gio:15:00 # noi:phong_dung_phim # bat_buoc
_Mốc 2: phải đạt 200.000 người theo dõi. Bàn của {thanh_xin_nghi} có tờ giấy: "Em xin nghỉ về quê phụ gặt lúa ạ."_
{ nguoi_theo_doi < 200000:
    _Chưa đạt. {sieu_nhan_hong} buồn, bỏ đi giúp người cả ngày. Lịch quay hôm nay trống trơn._
}
_Bạn đang cắt quảng cáo cho gameshow ngày mai, lấy hình từ kênh livestream của Đài Tivi Hóng. Đài đang phát trực tiếp vòng 2 "Giọng Ca Ước Mơ"._
_Thí sinh số 17 bước ra. Áo kim tuyến. Giọng vang như chuông chùa. Khuôn mặt… là {thanh_xin_nghi}._
~ phat_hien(son_thi_hat)
* [🎨 Cắt bỏ mọi khung hình có thí sinh số 17 khỏi quảng cáo.]
    ~ qh("thanh_xin_nghi", 10)
    _Không ai biết. Lúa ở quê {thanh_xin_nghi} hôm nay được gặt bằng micro._
* [📞 Nhắn {quan_ly_idol}, bạn thân của {thanh_xin_nghi}: "Anh coi Đài Tivi Hóng kênh 2 liền đi."]
    ~ qh("quan_ly_idol", 3)
    _Năm phút sau: "Trời đất ơi. Thằng này." Rồi: "Đừng ai đăng gì hết." Rồi: "Mà nó hát hay ghê ha."_
    ~ ed_can(2)
* [📺 Lưu lại clip vào ổ riêng. Biết đâu sau này cần.]
    ~ ed_sub_cong(0)
    _Thư mục "Lưu_phòng_khi_cần" có thêm một file. Bạn không phải người hay dùng bí mật. Bạn chỉ là người hay lưu file._
- -> END

// ------------------------------------------------------------
=== editor_1510_mat_dien_render ===
# ngay:15 # gio:08:10 # noi:phong_dung_phim # bat_buoc
_Bạn ngủ lại công ty đêm qua, máy đang render bản dựng gameshow. 8 giờ 05: phụt. Cả tòa nhà tắt điện._
_Thanh render đứng ở 87%. Màn hình tắt. Bạn ngồi trong bóng tối, nghe tim mình chạy chậm như thanh render._
_Ở thang máy, có tiếng {giam_doc} hét "Có ai không?" và tiếng {chi_dai} bảo "Anh im đi". Hai người kẹt chung._
_{it} chạy qua hành lang, tay ôm bộ lưu điện. Bộ lưu điện chỉ chạy được 40 phút. Một thứ được cứu: server, tủ lạnh, hay máy lạnh phòng giám đốc._
* {qh_it >= 10} [🔒 "Anh {it}. Server. Em xin."]
    it: *(dừng lại, nhìn bạn, nhìn thanh render trên cái laptop nhỏ)* …Ừ.
    _Server sống lại. Bản render cứu được ở 87%. {giam_doc} gọi 6 cuộc vì phòng nóng. {it} không nghe máy._
    ~ ed_render_15_cuu = true
    ~ qh("it", 5)
* [🍜 Đưa {it} ly mì ly cuối cùng trong ngăn kéo: "Server được hông anh?"]
    { RANDOM(1, 10) <= 5:
        it: *(nhận ly mì)* Ừ. Server.
        ~ ed_render_15_cuu = true
        ~ qh("it", 5)
    - else:
        it: Tủ lạnh. Bánh kem 20/10 trong đó. *(vẫn cầm ly mì đi)*
        ~ ed_render_15_cuu = false
    }
* [😶 Thở dài. Làm lại từ đầu, tối nay.]
    ~ ed_render_15_cuu = false
    ~ cang_thang(10)
- { not ed_render_15_cuu:
    _87% bay màu. Đêm nay làm lại. Bạn ghi vào ghi chú: "Lỗi ở 87%. Gần 99% nhưng chưa tới. Một cách an ủi."_
    ~ ed_loi_99 = ed_loi_99 + 1
}
-> END

// ------------------------------------------------------------
=== editor_1510_phat_hat_toi ===
# ngay:15 # gio:19:10 # noi:pantry # bat_buoc
_Tối. Điện chưa có. Cả công ty dạt về pantry tối om, ngồi bệt dưới sàn. Ai đó nói: "Chán quá, có ai hát gì đi."_
_Một giọng cất lên. Không micro. Không kính đen._
idol_het_thoi: "Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên…"
_Bạn rút điện thoại, bấm quay. Thói quen nghề nghiệp. Màn hình điện thoại là ánh sáng duy nhất trong phòng._
_Cả công ty hát theo. Lần đầu tiên, "Công Viên" không bị ai cười._
_Bạn lia máy. Chậm. Từng khuôn mặt. Rồi tới góc xa nhất của khung hình._
_{quan_ly_idol} ngồi đó. Không hát. Không cầm điện thoại. Mắt nhìn {idol_het_thoi}, không rời. Lâu hơn người khác một giây. Một giây rất dài._
_Bạn dừng quay._
_Bạn biết. Người dựng phim nhìn khung hình đủ lâu thì thấy hết. Bạn biết từ lâu rồi. Chỉ là chưa bao giờ thấy rõ như vậy._
~ phat_hien(thai_thuong_phat)
* [😶 Cất điện thoại. Hát theo, nhỏ thôi.]
    ~ cang_thang(-10)
    ~ ed_can(-3)
    _"…thích ăn chuối chiên…" Giọng bạn lạc vào giọng cả công ty. Không ai nghe ra. Như vậy cũng tốt._
* [🎥 Quay tiếp, nhưng chĩa máy về {idol_het_thoi}. Chỉ {idol_het_thoi}.]
    _Bạn quay cho {quan_ly_idol}. Vì đó là thứ anh ấy muốn xem lại. Bạn biết thế._
    ~ ed_can(2)
* [🚪 Ra ngoài hành lang đứng một lúc.]
    ~ cang_thang(5)
    _Hành lang tối. Bên trong, cả công ty vẫn hát. Bạn đứng dựa tường, nghe hết bài. Rồi quay vào, ngồi đúng chỗ cũ._
    chi_dai: *(nói nhỏ khi bạn ngồi xuống)* Ổn không em?
    editor: Dạ. Render xong là xong.
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== editor_1510_tin_nhan_thai ===
# ngay:15 # gio:23:50 # noi:can_701 # bat_buoc
_23 giờ 50. Điện đã có lại. Căn 701 sáng ba màn hình. Clip pantry nằm trên timeline: 4 phút 12 giây, tối, rung, đẹp tới mức đau._
_Điện thoại rung._
quan_ly_idol: *(nhắn tin)* Lĩnh ơi, hồi chiều có ai quay lúc {idol_het_thoi} hát hông em? Anh muốn coi lại.
* [🎁 Cắt bỏ góc có anh ấy, gửi bản đẹp nhất: "Dạ em có quay nè anh."]
    ~ ed_clip_phat_toi = "gui_thai"
    ~ ed_can(10)
    ~ ed_thuc_dem()
    quan_ly_idol: *(nhắn)* Trời, em dựng đẹp vậy! Cảm ơn em nha. Để anh hỏi {idol_het_thoi} rồi đăng.
    _Một tiếng sau, clip lên kênh nghệ sĩ, có lời xin phép của {idol_het_thoi}: "Một đêm mất điện, cả công ty hát cùng tôi."_
    ~ follow(30000)
    ~ qh("quan_ly_idol", 10)
    ~ qh("idol_het_thoi", 10)
* [😶 "Dạ em hông có quay anh."]
    ~ ed_clip_phat_toi = "giu"
    ~ ed_can(-5)
    _"Ờ, tiếc ghê. Thôi em ngủ đi." Clip nằm trong máy. Thư mục "Thái" nặng thêm 1,2 GB._
* [📺 Đăng thẳng lên kênh "Cú Đêm Cắt Ghép".]
    ~ ed_clip_phat_toi = "dang_kenh"
    ~ ed_thuc_dem()
    { RANDOM(1, 10) <= 6:
        ~ ed_sub_cong(20000)
        ~ follow(10000)
        _Clip viral. 800.000 lượt xem trong một đêm. Bình luận: "Ca sĩ này là ai vậy? Giọng buồn mà ấm."_
    - else:
        ~ ed_lo(25)
        ~ ed_sub_cong(5000)
        _Bình luận đầu tiên: "Cái pantry này… có cái lịch Vạn Sự… công ty G ở Tân Drama phải hông?"_
    }
    quan_ly_idol: *(gọi điện, giọng khàn)* Em đăng mà chưa hỏi {idol_het_thoi} hả? … Thôi. Để anh lo. Đừng ai đăng gì thêm.
    ~ qh("quan_ly_idol", -10)
    ~ scandal()
* {ed_can_dam >= 60} [🔒 Gửi nguyên bản chưa cắt, kèm một câu: "Anh nhìn anh {idol_het_thoi} lâu hơn người khác một giây đó."]
    ~ ed_clip_phat_toi = "nguyen_ban"
    _Đã xem. Không trả lời. Mười phút. Hai mươi phút._
    _00:14. "Em thấy hả?"_
    _Bạn gõ: "Dạ. Em dựng phim mà." Rồi xóa. Rồi gõ lại. Rồi gửi._
    _00:31. "Cảm ơn em. Lần đầu tiên anh biết có người nhìn thấy." Kèm một biểu tượng: con cú._
    ~ ed_nguoi_dung_dem = true
    ~ ed_can(10)
    ~ qh("quan_ly_idol", 15)
- -> END

// ------------------------------------------------------------
=== editor_1610_buffet ===
# ngay:16 # gio:12:30 # noi:pantry
_Ngày Lương thực Thế giới. Buffet ở công ty. Bạn tới lúc 12 giờ 30, đúng bữa sáng của mình._
_{thuc_tap_sinh} ngồi cạnh, laptop mở file phụ đề gameshow. "Siêu Nhân Hông". "Hồng không phải mầu". "Thích ăn chuối chiêng"._
thuc_tap_sinh: Dạ anh {editor}… em gõ phụ đề rồi, anh soát giúp em được hông ạ? Em sợ sai.
* [💬 "Để em soát. Anh ăn đi."]
    -> editor_mg_phu_de
* [😇 "Anh sai có bốn lỗi thôi. Lần trước mười hai. Anh tiến bộ đó."]
    thuc_tap_sinh: Dạ… thiệt hả anh? *(cười tới mang tai)* Em sửa liền ạ!
    ~ qh("thuc_tap_sinh", 10)
    ~ an(100)
* [😴 Ăn ba đĩa bánh cuốn, ngủ luôn trên ghế.]
    ~ an(100)
    ~ nghi(10)
    _{thuc_tap_sinh} tự soát. Bản phụ đề lên sóng có dòng "Siêu Nhân Hông". Nó thành meme trong ba ngày._
    ~ follow(2000)
- -> END

// ------------------------------------------------------------
=== editor_1610_gameshow_hau_truong ===
# ngay:16 # gio:19:40 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. Gameshow "Hồng Hay Không Hồng". Bạn đứng ở cánh gà với máy quay phụ, quay hậu trường cho bản highlight._
mc_tivi_hong: Và bây giờ là phần "Hit Một Thời"! Mời Siêu Nhân Hồng!
_{sieu_nhan_hong} hát "Công Viên". Tới câu "thích ăn chuối chiên" thì hát thành "thích ăn… khoai chiên"._
_Khán giả cười rần. Rồi từ cánh gà, ngay cạnh bạn, một giọng hát bè cất lên. Đúng từng chữ. "Chuối chiên"._
_Là {idol_het_thoi}. Kính đen tháo ra, cầm trên tay. Ở phía sau {idol_het_thoi}, {quan_ly_idol} đứng lặng, hai điện thoại cùng tắt màn hình._
* [🎥 Quay {idol_het_thoi} hát bè. Cận mặt. Ánh đèn sân khấu hắt vào từ một bên.]
    ~ ed_can(3)
    _Khung hình đẹp nhất tháng. Mắt {idol_het_thoi} nhắm. Giọng mười năm trước, vẫn còn đó._
* [🎥 Quay {sieu_nhan_hong} hát sai lời trên sân khấu. Cận cái mũ lắc lư.]
    ~ follow(5000)
    _Khung hình hài nhất tháng. Cái mũ hồng gật gù theo nhịp "khoai chiên". Khán giả trường quay ôm bụng._
* [🎥 Lùi lại, quay toàn cảnh: sân khấu, cánh gà, và người đứng sau cánh gà.]
    _Trong khung hình rộng, ba người: một người hát sai, một người hát đúng, và một người chỉ đứng nhìn._
    _Bạn biết khung hình này không đăng được. Nhưng bạn vẫn giữ._
    ~ ed_can(2)
- -> END

// ------------------------------------------------------------
=== editor_1610_highlight_dem ===
# ngay:16 # gio:23:00 # noi:phong_dung_phim # bat_buoc
_23 giờ. Phòng dựng. Gameshow phát sóng xong. Highlight phải lên trước 8 giờ sáng, trước khi cả công ty lên xe đi Vũng Tàu._
{ not ed_render_15_cuu:
    _Và bạn còn phải làm lại bản render đã mất hôm mất điện. Hai việc, một đêm._
    ~ cang_thang(10)
}
truong_phong: *(nhắn lúc 23:04)* Lĩnh ơi, highlight 2 tiếng sau phát sóng là đẹp nhất nhé. Anh tin em.
_Hai tiếng sau phát sóng là 1 giờ sáng. Bạn còn hai tiếng. Phải chọn cảnh "hồn" của bản highlight._
* [😂 Cảnh {sieu_nhan_hong} hát "khoai chiên". Hài, dễ viral.]
    ~ ed_highlight = "nguyen_sai_loi"
    ~ follow(10000)
    ~ qh("hong_hot", 5)
* [🎤 Cảnh {idol_het_thoi} hát bè trong cánh gà. Cảm động, làm {quan_ly_idol} vui.]
    ~ ed_highlight = "phat_hat_be"
    ~ qh("quan_ly_idol", 10)
    ~ qh("idol_het_thoi", 10)
    ~ ed_can(5)
* [✂️ Cả hai: sai lời trên sân khấu, cắt sang hát đúng ở cánh gà. "Song ca vô tình."]
    ~ ed_highlight = "ca_hai"
    ~ follow(10000)
    ~ qh("quan_ly_idol", 5)
    ~ qh("idol_het_thoi", 5)
- ~ ed_thuc_dem()
* [⏳ Dựng xong, đăng lúc 5 giờ sáng. Không ngủ.]
    ~ ed_highlight_kip = true
    ~ follow(40000)
    _5 giờ 02. Highlight lên fanpage. 5 giờ 03, bạn tắt màn hình, ngồi nhìn trời sáng qua khe rèm. 7 giờ, bạn lên xe đi Vũng Tàu._
    { ed_highlight == "phat_hat_be" || ed_highlight == "ca_hai":
        _7 giờ 20, trên xe, {quan_ly_idol} xem highlight. Cười. Quay xuống hàng ghế cuối: "Ai dựng vậy? Hay ghê." Bạn đang ngủ._
        ~ ed_can(3)
    }
* [⏳ Render Qua Đêm: để máy chạy, ngủ gục 3 tiếng.]
    { RANDOM(1, 10) <= 7:
        ~ ed_highlight_kip = true
        ~ follow(40000)
        ~ nghi(15)
        _6 giờ. Máy báo xong. Bạn đăng bằng một ngón tay, mắt nhắm._
    - else:
        ~ ed_loi_99 = ed_loi_99 + 1
        ~ follow(15000)
        _6 giờ. Màn hình: "Lỗi xuất file ở 99%". Bạn render lại. Highlight lên lúc 9 giờ, khi cả công ty đã ở trên xe, và mạng ở trạm dừng chân yếu như lời hứa tăng lương._
    }
- -> END
