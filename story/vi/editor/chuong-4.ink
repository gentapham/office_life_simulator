// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · CHƯƠNG 4: "CÚ ĐÊM Ở VŨNG TÀU" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== editor_1710_xe_buyt_ngu ===
# ngay:17 # gio:07:15 # noi:xe_buyt_doan # bat_buoc
_Xe buýt đoàn {cong_ty}. Bạn leo lên hàng ghế cuối, kéo mũ len xuống tới cằm. Trước khi xe lăn bánh, bạn đã ngủ._
_{hr} xếp chỗ: bạn ngồi cạnh cửa sổ có rèm, "phòng tối nhất trên xe". Một sự quan tâm hiếm hoi mà đáng sợ._
thuc_tap_sinh: *(nhẹ nhàng nhét cái gối chữ U vào cổ bạn)* Dạ… anh ngủ ngon ạ.
_Ở hàng ghế giữa, {hong_hot} quay sang, nheo mắt nhìn bạn ngủ, rồi nhìn cái tai nghe to đùng của bạn. Cái tai nghe giống hệt con cú trên kênh "Cú Đêm Cắt Ghép"._
* [😴 Ngủ say. Thật sự say.]
    ~ nghi(30)
    ~ ed_dem_thuc = 0
    _Bạn ngủ ba tiếng, không mộng mị. Lần đầu tiên trong mười ngày._
* [🎧 Tháo tai nghe nhét vào túi trước khi ngủ.]
    ~ ed_lo(-5)
    ~ nghi(25)
    hong_hot: *(thất vọng ra mặt)* Ủa…
* [🦉 Giả vờ ngủ, nghe hết chuyện cả xe.]
    ~ nghi(10)
    _Bạn nghe được: {sales} hứa tối nay mời "ca sĩ nổi tiếng nhất nước". {dan_dau_tu} nói Hồng Coin sắp x10. {quan_ly_idol} gọi điện, nói "Dạ" bốn mươi lần._
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== editor_1710_tro_choi_tap_the ===
# ngay:17 # gio:15:00 # noi:vung_tau_bai_bien # bat_buoc
_Trò chơi tập thể trên bãi biển, kịch bản của {bien_kich}: "Truy Tìm Kho Báu Hồng". Bạn nằm dưới cái dù, đội mũ len giữa trời 33 độ._
chi_dai: {editor}! Dậy! *(lần thứ nhất)*
_Bạn ngồi dậy. Nằm xuống. {chi_dai} quay lại._
chi_dai: {editor}! *(lần thứ hai)* … {editor}! *(lần thứ ba)* … LĨNH! *(lần thứ tư, kèm xách cổ áo)*
_Ở xa, {dan_dau_tu} giơ điện thoại lên trời: "Hồng Coin X10! Tối nay anh bao hải sản!"_
* [🏃 Chơi thật. Chạy trên cát như cú bị lôi ra ánh nắng.]
    ~ qh("chi_dai", 10)
    ~ nghi(-15)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
    chi_dai: Được! Vậy mới là người sống! *(vỗ lưng bạn, bạn suýt ngã)*
* [🎥 "Em quay phim cho đội mình nha chị." (Chơi bằng cách không chơi.)]
    chi_dai: Ờ… được. Quay cho đẹp. Đứa nào té thì zoom vào.
    ~ qh("chi_dai", 3)
    _Bạn quay được {truong_phong} té úp mặt xuống cát lúc đang hô "Mình sync nhanh nhé". Khung hình của năm._
* [😴 Ngủ Gật Chiến Lược ngay trong tư thế đứng.]
    { RANDOM(1, 10) <= 5:
        _Bạn ngủ đứng mười phút. {chi_dai} tưởng bạn đang suy nghĩ chiến thuật._
        ~ nghi(10)
    - else:
        chi_dai: *(bế bạn lên như bao gạo, thả xuống mép nước)* Tỉnh chưa?
        _Tỉnh. Rất tỉnh. Biển lạnh hơn bạn nghĩ._
        ~ cang_thang(5)
    }
- _Tối, cả đoàn ăn hải sản. {dan_dau_tu} gọi tôm hùm. Bạn ăn cho bữa sáng, bữa trưa, và bữa tối của cả tuần._
~ an(80)
-> END

// ------------------------------------------------------------
=== editor_1710_lua_trai_chan ===
# ngay:17 # gio:22:40 # noi:vung_tau_bai_bien # bat_buoc
_Lửa trại. Mười giờ tối. Giờ của bạn. Bạn là người tỉnh nhất đoàn._
_Lúc nãy, {sieu_nhan_hong} kể chuyện hồi nhỏ từng nhốt một đứa nhỏ trong nhà kho. {hong_hot} livestream đúng lúc {sieu_nhan_hong} định tháo mũ. Ba giây. Rồi không ai nhắc lại nữa._
_Giờ lửa đã nhỏ. {idol_het_thoi} say, ngủ gục trên vai {quan_ly_idol}. {quan_ly_idol} ngồi im, không động đậy, sợ làm người kia thức._
_Gió biển lạnh. Bạn ngồi bên kia đống lửa. Bạn nhìn hai người qua ngọn lửa, như nhìn một khung hình đã dựng sẵn._
_Bạn đứng dậy, vào lều lấy cái chăn. Đi vòng qua đống lửa. Đắp lên cho cả hai._
quan_ly_idol: *(nói thật nhỏ, sợ {idol_het_thoi} thức)* Cảm ơn em nha, {editor}.
{ ed_can_dam >= 30:
    quan_ly_idol: *(ngập ngừng)* Em… cũng ngồi đây đi. Lửa còn ấm.
- else:
    quan_ly_idol: À mà {editor}, mai dựng anh cái clip {sieu_nhan_hong} kéo lưới nha, gấp.
}
* [🌙 "Dạ. Em đi ngủ trước." Về lều.]
    ~ ed_can(-2)
    _Bạn về lều. Nằm nghe sóng. Bạn không ngủ. Nhưng bạn đã làm đúng việc mình muốn làm: để người ta được ấm._
* {ed_can_dam >= 30} [🔥 Ngồi xuống bên cạnh, cách một khoảng vừa đủ một cái chăn.]
    ~ ed_can(5)
    _Hai người ngồi im, nhìn lửa. {quan_ly_idol} hỏi bạn ngủ ngày có mệt không. Bạn nói không. Bạn nói dối._
    quan_ly_idol: Anh cũng vậy. Thức quen rồi. Ngủ lại thấy lạ.
    _Ba câu. Cả tháng mới có ba câu như vậy. Bạn để dành._
* [📱 "Dạ em dựng liền." (Về lều, mở laptop.)]
    ~ ed_thuc_dem()
    ~ follow(8000)
    _Clip kéo lưới lên lúc 2 giờ sáng. {sieu_nhan_hong} kéo lên được… một chiếc dép tổ ong. Bạn để nhạc nền hoành tráng. Nó hài tới mức buồn._
- -> END

// ------------------------------------------------------------
=== editor_1710_dem_tinh_nhat ===
# ngay:17 # gio:23:50 # noi:vung_tau_khach_san
_Gần nửa đêm. Cả đoàn ngủ hết. Bạn ngồi ở ban công khách sạn, laptop trên đùi, gió biển mằn mặn._
_Đồng hồ báo thức trên điện thoại hiện câu hỏi bạn tự đặt từ tuần trước: "5:00 – Bình minh? (Lần này đã ngủ chưa?)"_
* [😴 Đóng laptop. Đi ngủ. Để 5 giờ thức dậy như một người bình thường.]
    ~ ed_ngu_du()
    _Bạn nằm xuống. Lạ. Giường khách sạn mềm hơn bàn phím. Bạn ngủ trong 4 phút._
* [📺 Dựng video "Biển đêm" cho kênh riêng. Ngủ là thứ để dành.]
    ~ ed_thuc_dem()
    ~ ed_sub_cong(6000)
    ~ tien_cong(400000)
    _Ba giờ sáng. Video 3 phút, tiếng sóng và ánh đèn tàu cá. Bình luận đầu: "Cú ơi, cú đang ở biển hả?"_
- -> END

// ------------------------------------------------------------
=== editor_1810_binh_minh ===
# ngay:18 # gio:05:05 # noi:vung_tau_bai_bien # bat_buoc
{ ed_dem_thuc == 0:
    _5 giờ sáng. Bãi biển. Bạn đã ngủ. Lần đầu tiên trong đời, bạn thấy mặt trời mọc mà không phải vì chưa ngủ._
- else:
    _5 giờ sáng. Bãi biển. Bạn chưa ngủ. Như mọi lần thấy mặt trời mọc._
}
_Đường chân trời ửng hồng. Hồng thật, không phải hồng Siêu Nhân, không cần cứu màu._
_Có tiếng bước chân trên cát. {quan_ly_idol}, một điện thoại áp tai, vừa nói "Dạ dạ" vừa đi về phía biển. Anh ấy cúp máy. Đứng cạnh bạn._
quan_ly_idol: Ủa {editor}? Em dậy sớm vậy?
* [🦉 "Dạ, em chưa ngủ."]
    quan_ly_idol: *(cười)* Giống anh.
    _Hai người đứng im nhìn mặt trời lên. Mười phút. Không ai nói thêm gì. Mười phút đó dài hơn mọi bản dựng bạn từng làm._
    ~ ed_can(5)
* [💌 "Anh {quan_ly_idol}, mấy cái video tiện tay cho anh {idol_het_thoi} tuần nào cũng có… là em dựng đó."]
    quan_ly_idol: *(quay phắt sang)* Ủa thiệt hả? Anh tưởng thuật toán!
    _Anh ấy ôm vai bạn một cái. Nhanh. Mạnh. Có mùi cà phê và gió biển._
    quan_ly_idol: Cảm ơn em nha, thằng nhỏ này.
    ~ ed_noi_voi_thai = true
    ~ ed_can(15)
    ~ cang_thang(-20)
    ~ qh("quan_ly_idol", 15)
* [📱 "Dạ anh gọi tiếp đi, em đi chỗ khác."]
    _Bạn đi dọc bãi biển một mình. Dựng được một video bình minh rất đẹp cho kênh riêng. Cơ hội trôi theo con sóng, nhẹ như chưa từng có._
    ~ ed_sub_cong(10000)
* {ed_can_dam >= 45 && not ed_nguoi_dung_dem} [🔒 "Hôm mất điện… em quay {idol_het_thoi} hát. Trong khung hình có anh. Anh nhìn ảnh lâu hơn người khác."]
    _{quan_ly_idol} không nói gì. Sóng vỗ ba lần._
    quan_ly_idol: Em thấy hả?
    editor: Dạ. Em dựng phim mà.
    quan_ly_idol: *(nhìn ra biển rất lâu)* Mười năm. Chưa ai thấy. *(cười, mắt đỏ)* Gió biển cay ghê.
    ~ ed_nguoi_dung_dem = true
    ~ ed_can(10)
    ~ qh("quan_ly_idol", 15)
- _Mặt trời lên hẳn. {quan_ly_idol} lại nghe máy. Bạn chụp một tấm ảnh đường chân trời, không có ai trong đó, rồi lưu vào thư mục "{quan_ly_idol}"._
-> END

// ------------------------------------------------------------
=== editor_1810_ve_thanh_pho ===
# ngay:18 # gio:16:30 # noi:xe_buyt_doan # bat_buoc
_Chuyến xe về. Ai cũng giận ai. Hồng Coin về 0, {dan_dau_tu} ngồi im như tượng. {con_ong_chau_cha} phát hiện căn penthouse của mình đang bị rao bán trên mạng._
_{truong_phong} nhắn group: "Thứ 3 sinh nhật công ty 16 tuổi. Cần video '16 năm G-Entertainment'. {editor} dựng nhé. Tư liệu tự tìm."_
_Tư liệu tự tìm. Công ty này không có nổi một thư mục ảnh trước năm 2019._
* [💬 Nhắn {it}: "Anh ơi, ổ cứng 'KHÔNG ĐƯỢC MỞ' của anh… có ảnh cũ hông?"]
    _Đã xem. Hai tiếng sau: "Có. Không mở."_
    ~ ed_can(1)
* [😴 Ngủ tới thành phố. Mai tính.]
    ~ nghi(20)
* [🤝 Đi xuống hàng ghế giữa, đưa {dan_dau_tu} chai nước suối.]
    dan_dau_tu: *(cầm chai nước, nhìn rất lâu)* Em không nói "đáy rồi" hả?
    editor: Dạ. Em không biết đáy là gì. Em chỉ biết render.
    ~ qh("dan_dau_tu", 10)
- -> END

// ------------------------------------------------------------
=== editor_1910_video_16_nam ===
# ngay:19 # gio:14:00 # noi:phong_server # bat_buoc
_Họp giao ban sáng nay không ai nhìn mặt ai. Chiều, bạn gõ cửa phòng server. {it} đang ăn mì ly, ổ cứng ghi "KHÔNG ĐƯỢC MỞ" nằm trên kệ._
it: Không.
* {qh_it >= 15} [🔒 "Anh. Video 16 năm. Có cảnh bác {bac_bao_ve} ngày đầu gác cổng. Bác chưa từng thấy mình trên màn hình."]
    it: *(đặt ly mì xuống)* …Mười phút. Chỉ thư mục ảnh.
    ~ ed_tu_lieu_16_nam = true
* [🍜 Đặt hai ly mì lên bàn: "Một ly của anh, một ly để trả công mở ổ."]
    { RANDOM(1, 10) <= 5:
        it: *(nhìn hai ly mì)* …Mì cay. Được.
        ~ ed_tu_lieu_16_nam = true
    - else:
        it: Mì không mở được ổ cứng.
        ~ cang_thang(5)
    }
* [🎞️ Lên chòi hỏi bác {bac_bao_ve} mấy cuộn băng hình cũ.]
    bac_bao_ve: Băng thì bác có hai cuộn. Mà máy đọc băng thì… chịu.
    _Bạn mang hai cuộn băng VHS về phòng dựng. Không có máy đọc. Bạn nhìn chúng như nhìn hai viên gạch quý._
    ~ qh("bac_bao_ve", 5)
- { ed_tu_lieu_16_nam:
    _Ổ cứng quay vù vù. Thư mục "2010": ảnh căn phòng 20 mét vuông. Ảnh {giam_doc} 21 tuổi, áo sơ mi rộng thùng thình. Ảnh bác {bac_bao_ve} đứng gác cái cửa gỗ._
    _Thư mục "2015": {idol_het_thoi} cầm cúp. Và một file âm thanh: "CongVien_ban_thu_goc_chua_mix.wav"._
    _Thư mục "2026_06": một bản sao dự án quảng cáo tháng 6. Bản của {chua_te_deadline}. Bạn ghi nhớ đường dẫn, rồi im lặng._
    ~ ed_biet_file_vu = true
    ~ ed_thuc_dem()
    _Đêm đó bạn dựng tới 5 giờ sáng. Không phải vì deadline. Vì bạn không dừng được._
- else:
    _Bạn dựng video 16 năm bằng 30 tấm ảnh chụp màn hình fanpage từ 2019 trở lại. Ba phút. Nhạc buồn. Bạn biết nó thiếu._
    ~ ed_thuc_dem()
}
-> END

// ------------------------------------------------------------
=== editor_2010_chieu_video_16_nam ===
# ngay:20 # gio:10:00 # noi:sanh_tang_tret # bat_buoc
_Sinh nhật {cong_ty} 16 tuổi, kiêm Ngày Phụ nữ Việt Nam. Sảnh treo bong bóng cam và hồng. Sáng nay chòi bảo vệ nhận một lá thư tay ký "G"._
_{giam_doc} vừa chốt logo kỷ niệm 16 năm. Sau 37 bản, anh chọn lại logo gốc năm 2010. Lần sửa thứ 38._
truong_phong: Và bây giờ, video "16 năm", do anh… do phòng Sản xuất thực hiện.
_Đèn tắt._
{ ed_tu_lieu_16_nam:
    _Căn phòng 20 mét vuông. Một cậu sinh viên tên {giam_doc}, 21 tuổi, đang dán chữ G bằng băng keo lên tường._
    _Năm 2015. {idol_het_thoi} ôm cúp. Tiếng hát gốc "Công Viên", bản thu chưa mix, giọng trẻ và run._
    _Và cảnh cuối: một người bảo vệ 34 tuổi, đứng trước cái cửa gỗ, tay chắp sau lưng. Bác {bac_bao_ve}._
    _Cả sảnh im lặng. Không ai vỗ tay ngay. {giam_doc} lấy tay che mắt. {idol_het_thoi} tháo kính đen._
    _Ở cuối sảnh, bác {bac_bao_ve} đứng thẳng, như đang gác cổng. Tay đặt lên túi áo, chỗ lá thư._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
    ~ follow(10000)
    ~ qh("giam_doc", 10)
    ~ qh("bac_bao_ve", 15)
    ~ qh("idol_het_thoi", 10)
- else:
    _Ba phút ảnh chụp màn hình fanpage. Mọi người vỗ tay lịch sự. {giam_doc} gật gù: "Ổn. Mà hơi ngắn so với 16 năm nhỉ."_
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
}
_Đèn bật. {truong_phong} bước lên._
truong_phong: Video này anh và team làm xuyên đêm…
* [😶 Ngồi im. Để video tự nói.]
    ~ ed_vo(5)
* [✋ Đứng dậy: "Dạ… tư liệu là của anh {it} giữ. Em chỉ dựng."]
    ~ ed_vo(-10)
    ~ qh("it", 10)
    ~ qh("truong_phong", -5)
    ~ ed_can(3)
    _{it} ở góc phòng, giơ ly mì lên một chút. Cách {it} nói "Ừ, đúng rồi"._
* {ed_dau_cu_chung_minh >= 1} [🦉 "Anh {truong_phong}, ở phút 2, trên cái cửa gỗ, có con cú."]
    _Cả sảnh tua lại. Có. Một con cú đeo tai nghe, đậu trên cái cửa gỗ năm 2010._
    giam_doc: *(bật cười)* Thằng này. Đánh dấu lãnh thổ.
    ~ ed_vo(-15)
    ~ ed_dau_cu_chung_minh = ed_dau_cu_chung_minh + 1
    ~ qh("truong_phong", -10)
- -> END

// ------------------------------------------------------------
=== editor_2010_qua_phu_nu ===
# ngay:20 # gio:15:00 # noi:pantry # bat_buoc
_Phát quà 20/10. {giam_doc} tặng bảy chị em bảy cái khăn choàng màu cam y hệt nhau. Drama "ai được quà xịn hơn" chết từ trong trứng._
_{chi_dai} nhìn bạn: "Em là đàn ông trong phòng sản xuất đó. Quà cho chị em đâu?"_
* [🎞️ Dựng một clip 1 phút: mỗi chị em một khoảnh khắc đẹp nhất tháng, quay lén từ hậu trường.]
    ~ ed_thuc_dem()
    ~ qh("chi_dai", 10)
    ~ qh("hong_hot", 10)
    ~ qh("designer", 10)
    ~ qh("ke_toan", 10)
    ~ qh("bien_kich", 10)
    ~ qh("sales", 5)
    ~ qh("thanh_ninh", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    _{ke_toan} đang trả giá rau. {designer} đang cãi. {chi_dai} đang xách {editor} như bao gạo. Cả pantry cười, rồi im, rồi vỗ tay._
    hong_hot: Ai quay lén tui đẹp vậy?! Ai?!
* {co(hoa_hong)} [🌹 Đưa bông hồng {thuc_tap_sinh} tặng hôm 5/10 cho {chi_dai}: "Hoa này em giữ hai tuần rồi, vẫn tươi."]
    ~ mat(hoa_hong)
    chi_dai: Hai tuần mà tươi? Em ngâm thuốc hả? *(cầm hoa)* Ờ… cảm ơn. Thằng nhỏ này.
    ~ qh("chi_dai", 10)
* [😴 "Dạ em tặng chị… lời chúc ngủ ngon."]
    chi_dai: *(cười to)* Ờ, quà của em quý thật. Thứ em thiếu nhất mà.
    ~ qh("chi_dai", 3)
- -> END

// ------------------------------------------------------------
=== editor_2010_karaoke ===
# ngay:20 # gio:22:30 # noi:karaoke_hat_cho_nhau_nghe # bat_buoc
_Karaoke Hát Cho Nhau Nghe, tăng hai sau quán ốc. {giam_doc} say, cầm micro: "Nếu Đêm Hồng thành công, cả công ty tăng lương 20%!"_
_{hong_hot} quay clip. {ke_toan} đứng dậy, ngồi xuống, đứng dậy._
_Bạn ngồi góc phòng. Ghế bên cạnh trống. {quan_ly_idol} bước vào, nhìn quanh, rồi ngồi xuống đó._
quan_ly_idol: Ở đây tối nhất. Anh trốn điện thoại xíu.
* [🎤 Chọn bài "Công Viên" trên màn hình, đưa micro cho {idol_het_thoi}.]
    _{idol_het_thoi} cầm micro, hát. Cả phòng hát theo. Bạn không nhìn {idol_het_thoi}. Bạn nhìn người bên cạnh mình đang nhìn {idol_het_thoi}._
    _Anh ấy cười. Bạn làm anh ấy cười. Gián tiếp, như mọi lần. Như vậy cũng được._
    ~ qh("quan_ly_idol", 5)
    ~ qh("idol_het_thoi", 5)
    ~ ed_can(-2)
* [💬 "Anh có bao giờ ngủ đủ tám tiếng chưa?"]
    quan_ly_idol: *(cười)* Năm 2014. Trước khi quản lý {idol_het_thoi}. *(ngừng)* Còn em?
    editor: Dạ… em chưa bao giờ.
    quan_ly_idol: Vậy mình là một hội. Hội không ngủ.
    _Một hội. Hai người. Bạn ghi nhớ chữ "mình"._
    ~ ed_can(5)
* [🎥 Quay lại cảnh sếp hứa tăng lương 20%, gửi {ke_toan} làm bằng chứng.]
    ~ qh("ke_toan", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
    ke_toan: *(nhận clip, gật đầu)* Video có ngày giờ. Tốt hơn tờ giấy ăn.
- quan_ly_idol: Mà {editor}… em có thương ai chưa?
_Câu hỏi rơi xuống giữa tiếng nhạc như một khung hình bị đứng. Bạn nghe tim mình lag._
* [😶 "Dạ… chưa." (Nói dối.)]
    quan_ly_idol: Ờ. Chưa cũng tốt. Thương rồi mệt lắm. *(nhìn về phía {idol_het_thoi})*
    ~ ed_can(-3)
* [💌 "Dạ có. Mà người ta không biết."]
    quan_ly_idol: *(gật đầu chậm)* Giống anh. *(cười buồn)* Chúc em may hơn anh nha.
    _Anh ấy không hỏi là ai. Bạn không biết nên nhẹ nhõm hay buồn. Bạn chọn cả hai._
    ~ ed_can(8)
* [😴 Giả vờ ngủ gật.]
    quan_ly_idol: *(cởi áo khoác đắp cho bạn)* Ngủ đi thằng nhỏ.
    _Áo khoác có mùi cà phê. Bạn không mở mắt cho tới khi bài hát hết._
    ~ ed_can(3)
- -> END
