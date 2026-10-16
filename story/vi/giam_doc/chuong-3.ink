// ============================================================
// GIÁM ĐỐC · CHƯƠNG 3: "TỐI OM" (14/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== giam_doc_1410_moc_2 ===
# ngay:14 # gio:09:30 # noi:phong_giam_doc # bat_buoc
_Mốc 2: 200.000 người theo dõi. Ngày Hội Nông dân. Trên bàn bạn có một tờ đơn xin nghỉ của {thanh_xin_nghi}: "Lý do: về quê phụ gặt lúa."_
_Quê {thanh_xin_nghi} ở Ven Đô. Ven Đô trồng rau muống._
* [✍️ Ký đơn. "Gặt lúa vui nhé."]
    ~ qh("thanh_xin_nghi", 10)
    ~ qh("hr", -5)
    hr: *(nhắn)* Anh ơi, lần thứ 8 trong năm rồi đó anh. Em chỉ muốn lắng nghe anh thôi.
* [🙅 Gọi {hr}: "Em kiểm tra giúp anh xem cánh đồng nào ở Ven Đô trồng lúa."]
    hr: Dạ, em đi liền anh. *(cười, rất đáng sợ)*
    ~ qh("thanh_xin_nghi", -10)
    ~ qh("hr", 10)
- _Bạn mở điện thoại xem số người theo dõi: {nguoi_theo_doi}._
{ nguoi_theo_doi >= 200000:
    _Đạt mốc 2. Bạn thở ra một hơi dài như vừa trả xong một kỳ lãi._
    ~ gd_uy(5)
    ~ cang_thang(-5)
    -> END
- else:
    -> giam_doc_1410_tim_nguyen
}

=== giam_doc_1410_tim_nguyen ===
_Trượt mốc. Mười phút sau, {quan_ly_idol} gọi, giọng hụt hơi._
quan_ly_idol: Anh ơi, {sieu_nhan_hong} buồn, bỏ đi giúp người từ sáng tới giờ. Khoan, anh nghe máy chút… Không ai tìm được ảnh hết!
* [🚗 Tự lái xe đi tìm khắp Quận Hóng.]
    ~ gd_tim_nguyen_1410 = true
    _Công viên Hồ Cá Mập: {sieu_nhan_hong} đã gỡ diều cho ba đứa nhỏ, đi rồi. Đại Lộ Kẹt Xe: đã đẩy hai xe chết máy, đi rồi._
    _Bạn tìm thấy {sieu_nhan_hong} lúc 4 giờ chiều, ngồi một mình ở xe chuối chiên, mũ vẫn đội._
    sieu_nhan_hong: Sếp… em làm cả công ty cực mà em hông nổi. Em xin lỗi.
    ** [😇 "Không phải lỗi em. Anh đặt con số mà chưa hỏi ai."]
        sieu_nhan_hong: *(im lặng)* … Sếp mua cho em một cái chuối chiên được hông?
        ~ tien_cong(-15000)
        ~ qh("sieu_nhan_hong", 20)
        ~ gd_sua("ke_chuyen")
        _Hai người ngồi ăn chuối chiên. Không ai nói về con số._
    ** [🔥 "Đứng dậy! Siêu nhân không được buồn!"]
        sieu_nhan_hong: Dạ… *(đứng dậy, vai vẫn xệ)*
        ~ qh("sieu_nhan_hong", 5)
    - - ~ nghi(-20)
    ~ follow(10000)
* [🙅 "Cậu tìm đi. Anh không ép, tùy cậu."]
    ~ gd_tuy_em("quan_ly_idol")
    ~ follow(-10000)
    _Tới tối {sieu_nhan_hong} mới về. Không ai biết đã đi đâu._
- -> END

// ------------------------------------------------------------
=== giam_doc_1510_thang_may ===
# ngay:15 # gio:08:05 # noi:thang_may # bat_buoc
_8:05 sáng. Mất điện. Thang máy dừng giữa tầng 1 và tầng 2. Tối om. Chỉ có tiếng thở của {chi_dai}._
_Không điện, không sóng điện thoại, không {thanh_ninh}. Chỉ có hai người và một cái nút cứu hộ không sáng._
chi_dai: Anh {giam_doc}. Em hỏi một lần thôi. Anh giấu gì cả công ty vậy? # hen_gio:8
* [😮‍💨 "Công ty nợ ngân hàng. Anh cầm cả nhà rồi, {chi_dai} ạ."]
    ~ gd_noi_that_huong = true
    ~ phat_hien(the_chap_biet_thu)
    ~ gd_no(10)
    ~ qh("chi_dai", 25)
    ~ gd_uy(10)
    chi_dai: Sao giờ mới nói? Đứa nào đòi nợ anh, chỉ mặt em.
    giam_doc: Ngân hàng, {chi_dai} ạ. Cả cái ngân hàng.
    chi_dai: Vậy thì em chỉ còn cách làm show cho thật tốt.
    _Trong bóng tối, bạn nghe {chi_dai} vỗ vai mình hai cái. Mạnh. Hơi đau. Nhưng ấm._
* [🎭 "Giấu gì đâu, anh đang nghĩ cái vision cho năm sau thôi."]
    chi_dai: Dạ. Vậy lát có điện em đi hỏi {ke_toan}.
    ~ gd_no(5)
    ~ qh("chi_dai", -5)
* [😶 Bấm nút gọi cứu hộ liên tục.]
    _Nút không có điện. {chi_dai} bật cười, tiếng cười vang trong cái hộp sắt._
    chi_dai: Anh bấm nữa là nó gãy luôn đó.
    ~ qh("chi_dai", 5)
* [⏱️ (Không chọn kịp)]
    _Thang máy giật một cái, chạy lại. Cửa mở ra ngay trước mặt {thanh_ninh} và {hong_hot}._
    hong_hot: *(nhìn hai người, mắt sáng rực)* Nghe gì chưa…
    ~ gd_no(3)
    ~ qh("chi_dai", -3)
- { gd_noi_that_huong:
    _40 phút sau, thang máy chạy lại. Hai người bước ra như chưa có gì. Nhưng {chi_dai} đi trước bạn nửa bước, như người đi mở đường._
}
-> END

// ------------------------------------------------------------
=== giam_doc_1510_hop_thap_nen ===
# ngay:15 # gio:10:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng "Sáng Tạo" không điện, không máy chiếu. {truong_phong} thắp 12 cây nến xếp hình chữ G._
truong_phong: Vâng, không có điện nhưng mình vẫn sync nhanh 5 phút được ạ.
thuc_tap_sinh: Dạ, em có mang 5 cục sạc dự phòng! *(xếp lên bàn, cục nào cũng 30.000 mAh)*
designer: Ủa sao thực tập sinh có nhiều sạc xịn vậy?
_Trong ánh nến, mặt ai cũng thật hơn mọi ngày._
* [🕯️ "Hôm nay không họp. Ai có chuyện gì muốn nói với sếp thì nói. Anh nghe."]
    ~ gd_sua("hop_ngan")
    ~ gd_uy(5)
    designer: Dạ… em xin anh đừng bắt sửa logo nữa. 37 lần rồi.
    editor: *(ngáp)* … Em muốn được ghi tên trong phần credit.
    truong_phong: *(ho khan rất to)*
    ~ qh("designer", 10)
    ~ qh("editor", 10)
    ~ qh("truong_phong", -5)
    _Bạn ghi lại cả hai câu. Bằng bút. Lần đầu tiên sau nhiều năm._
* [🔥 Truyền lửa trong bóng tối: "Các em, đây là lúc ánh sáng bên trong mỗi người lên tiếng!"]
    ~ gd_uy(-3)
    _Đúng lúc đó, một cây nến đổ. Khói. Chuông báo cháy không kêu vì… mất điện._
    chi_dai: *(dập lửa bằng ly trà đá)* Anh nói ít thôi anh.
* [💬 Quay sang {thuc_tap_sinh}: "Cục sạc này hàng ngân hàng tặng VIP đúng không?"]
    thuc_tap_sinh: Dạ… dạ em mua online ạ! Dạ em mới vô nên chưa biết ạ!
    ~ phat_hien(duy_tung_lam_ngan_hang)
    _Trên vỏ cục sạc, một dòng chữ khắc mờ: "Tri ân khách hàng Kim Cương"._
- -> END

// ------------------------------------------------------------
=== giam_doc_1510_pantry_toi ===
# ngay:15 # gio:18:30 # noi:pantry
_Chiều tối, vẫn mất điện. Pantry tối mờ, chỉ có đèn pin điện thoại. Có tiếng hát rất nhỏ._
idol_het_thoi: *(hát)* "Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên…"
_Không kính đen, không phòng chờ. Chỉ là một người hát cho chính mình nghe. Giọng vẫn như năm 2015._
_Ở góc tối, {editor} đang giơ điện thoại quay, rất khẽ._
_Cạnh tủ lạnh, {ke_toan} và {chi_dai} đang nói chuyện thì thầm. Bạn nghe được hai chữ: "trang 47"._
* [🎤 Hát bè theo, như hồi 2015 ở quán cà phê.]
    ~ qh("idol_het_thoi", 20)
    ~ qh("editor", 5)
    idol_het_thoi: *(dừng lại, rồi cười)* Anh vẫn hát lạc tông y như hồi đó.
    giam_doc: Hồi đó anh cũng lạc tông, mà em vẫn nổi.
    _Clip của {editor} có thêm một giọng hát lạc. Có lẽ vì vậy mà nó thật hơn._
* [😶 Đứng ở cửa nghe hết bài, rồi đi.]
    ~ cang_thang(-10)
    _Bạn nhớ năm 2015. Năm mà bạn tin mình là thiên tài. Có lẽ bạn chỉ là người may mắn đứng đúng chỗ._
* [💬 Đi tới chỗ {ke_toan} và {chi_dai}: "Hai em nói gì về trang 47 đấy?"]
    ke_toan: *(giật mình)* Dạ… anh nghe hết rồi hả?
    chi_dai: Anh nghe rồi thì ngồi xuống luôn. Ba người lo một chuyện còn hơn hai.
    ~ qh("ke_toan", 10)
    ~ qh("chi_dai", 10)
    { gd_doc_trang_47:
        giam_doc: Anh biết rồi. Anh đọc rồi. Anh chỉ chưa dám nói thôi.
        ke_toan: … Vậy là mình ba người biết.
    - else:
        _{ke_toan} lật hợp đồng ra, soi đèn pin. Trang 47. Mười tỷ. Lần này bạn đọc._
        ~ gd_doc_trang_47 = true
        ~ phat_hien(trang_47)
        ~ cang_thang(20)
    }
- -> END

// ------------------------------------------------------------
=== giam_doc_1610_mua_suat_gameshow ===
# ngay:16 # gio:08:30 # noi:phong_giam_doc # bat_buoc
_Sáng gameshow "Hồng Hay Không Hồng" ở Đài Tivi Hóng. {quan_ly_idol} đặt tờ báo giá lên bàn bạn, mắt thâm quầng._
quan_ly_idol: Anh, mua suất khách mời chính là 350 triệu. Không mua thì {sieu_nhan_hong} chỉ được ngồi hàng ghế khán giả.
_Ngân Sách: {gd_ngan_sach} triệu._
* [✍️ "Mua. Không lên hình thì làm show để làm gì."]
    ~ gd_mua_gameshow = true
    ~ gd_tien_cty(-350)
    ~ qh("quan_ly_idol", 10)
    quan_ly_idol: Chuyện này để anh lo, đừng ai đăng gì hết! À không, đăng đi, đăng hết đi!
* [✂️ "Mặc cả xem. Bảo họ là có {idol_het_thoi} đi kèm, hát bè miễn phí."]
    quan_ly_idol: *(khựng lại)* Anh… anh cho {idol_het_thoi} lên sóng hả?
    ~ gd_mua_gameshow = true
    ~ gd_tien_cty(-250)
    ~ qh("quan_ly_idol", 20)
    ~ qh("idol_het_thoi", 10)
* [🙅 "Ngồi ghế khán giả cũng là lên hình. Anh không ép, tùy cậu."]
    ~ gd_tuy_em("quan_ly_idol")
    ~ gd_no(-5)
    quan_ly_idol: Dạ… ghế khán giả hàng thứ 14 anh.
- -> END

// ------------------------------------------------------------
=== giam_doc_1610_hang_ghe_khach_moi ===
# ngay:16 # gio:13:40 # noi:dai_tivi_hong
_Trường quay Đài Tivi Hóng. Hàng ghế khách mời có đúng 3 chỗ trước ống kính._
_Ghế 1: {con_ong_chau_cha} đã ngồi sẵn, đang selfie. Ghế 2: {truong_phong} đứng cạnh, tay cầm bộ đàm "để chỉ đạo". Ghế 3: {thanh_ninh} giữ chỗ bằng cái túi xách._
thanh_ninh: Dạ sếp ơi, em giữ ghế đẹp nhất cho sếp rồi ạ! Ngay camera 2!
* [👑 Ngồi ghế 3. Sếp phải lên hình.]
    ~ gd_uy(3)
    ~ qh("thanh_ninh", 5)
    _Cả buổi, camera 2 quay bạn đúng 4 giây. Bạn đang ngáp._
* [🤝 "{chi_dai} ngồi đi. Show này em gánh."]
    chi_dai: Thôi anh, em đứng cánh gà quen rồi.
    giam_doc: Anh không ép… À không. Lần này anh ép thật. Ngồi đi.
    ~ qh("chi_dai", 15)
    ~ qh("thanh_ninh", -10)
* [💬 Nói với {con_ong_chau_cha}: "Cháu đứng dậy nhường chỗ cho {quan_ly_idol}. Người ta lo show cả tháng nay."]
    con_ong_chau_cha: Ủa… dạ. Chill. *(đứng dậy, hơi bất ngờ vì chú lần đầu bảo vậy)*
    ~ qh("quan_ly_idol", 10)
    ~ qh("con_ong_chau_cha", -5)
    ~ qh("truong_phong", 5)
- -> END

// ------------------------------------------------------------
=== giam_doc_1610_hit_mot_thoi ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
_14 giờ, bắt đầu quay. 20 giờ tối nay mới phát sóng. Phần "Hit Một Thời". MC Đài Tivi Hóng mời {sieu_nhan_hong} hát một bài hit năm 2015._
mc_dai_tivi: Xin chào quý vị và các bạn! Và bài hát là… "Công Viên"!
sieu_nhan_hong: *(hát, tự tin tuyệt đối)* "Ngày xưa có đôi bạn thân, bán khoai chiên tại công viên…"
_Sai lời. Khán giả cười ồ. MC nhìn về phía đạo diễn._
_Ở cánh gà, {idol_het_thoi} đứng nắm chặt rèm. Anh ấy nhìn bạn._
* [🎤 Gật đầu với {idol_het_thoi}: "Lên đi. Hát bè."]
    _{idol_het_thoi} cầm micro dự phòng, hát bè từ cánh gà. "…cá viên chiên, tại công viên…" Giọng thật, ấm, chuẩn từng nốt._
    _Khán giả đứng dậy. Có người khóc. Có người hét "Anh {idol_het_thoi} ơi!"._
    ~ follow(30000)
    ~ qh("idol_het_thoi", 20)
    ~ qh("sieu_nhan_hong", 10)
    ~ qh("quan_ly_idol", 15)
* [😶 Lắc đầu. Không phải lúc.]
    _{idol_het_thoi} buông rèm, quay vào trong. {sieu_nhan_hong} hát hết bài với "khoai chiên". Tối đó, mạng xã hội có bản remix "Khoai Chiên Thái Độ"._
    ~ qh("idol_het_thoi", -10)
* [🔥 Tự chạy ra sân khấu hát cùng.]
    _Bạn hát lạc tông, to, rất tự tin. MC không biết bạn là ai._
    { RANDOM(1, 10) <= 4:
        _Clip "sếp lạc tông" lên xu hướng. Mọi người cười, nhưng là cười thương._
        ~ follow(15000)
        ~ gd_uy(10)
    - else:
        _Clip "ông chú nào lạc tông" lên xu hướng. Bình luận chửi nhiều hơn khen._
        ~ follow(-10000)
        ~ gd_uy(-10)
    }
- { gd_mua_gameshow:
    _Suất khách mời chính đáng tiền: camera dí sát {sieu_nhan_hong} cả buổi._
    ~ follow(20000)
}
_Buổi tối, công ty liên hoan buffet Ngày Lương thực, vừa ăn vừa xem gameshow phát sóng lúc 20 giờ. Ai cũng ăn như chưa từng được ăn._
~ an(100)
-> END

// ------------------------------------------------------------
=== giam_doc_1610_hoa_huong_duong_dem ===
# ngay:16 # gio:23:00 # noi:biet_thu
_Group "Hội Anti Sếp" sau buổi gameshow. Ai cũng vui, ai cũng đang no buffet._
hong_hot: Công nhận hôm nay sếp làm được việc. Mà mấy bà nghĩ coi, sao sếp ki bo vậy, có 5 tỷ mà lương vẫn trễ?
sales: Chắc sếp để dành mua du thuyền. No cap.
* [😂 Thả haha.]
    _An toàn. Bông hoa im lặng._
* [📝 Ghi tên {sales} vào Danh sách đen.]
    ~ gd_danh_sach_den = gd_danh_sach_den + 1
    ~ gd_da_tra_thu = true
    ~ qh("sales", -15)
* {gd_noi_that_huong} [🔒 Gõ: "Tui nghe nói sếp đang thế chấp nhà để trả lương cho tụi mình đó."]
    _Group im lặng 2 phút. Không ai gõ gì. Dấu "đang nhập…" hiện lên rồi tắt, hiện lên rồi tắt._
    hong_hot: … Thiệt hả?
    chi_dai: Thiệt. Đừng hỏi thêm. Từ giờ đứa nào chửi sếp chuyện lương thì nói với tui.
    ~ gd_no(15)
    ~ gd_uy(20)
    ~ qh("hong_hot", 10)
    ~ qh("ran_doc", 5)
    ~ qh("designer", 5)
    ~ qh("sales", 5)
    _Đêm đó, group "Hội Anti Sếp" lần đầu tiên không chửi sếp. Mọi người chỉ chúc nhau ngủ ngon._
* [🚪 Thoát group. Đi ngủ.]
    ~ nghi(10)
- -> END
