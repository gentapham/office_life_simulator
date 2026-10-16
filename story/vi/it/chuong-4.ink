// ============================================================
// IT: BẢO · CHƯƠNG 4: "WIFI VŨNG TÀU" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== it_1710_wifi_resort ===
# ngay:17 # gio:14:00 # noi:vung_tau_resort # bat_buoc
_Team building Vũng Tàu. Resort "Sóng Vỗ" chỉ có một cục wifi, đặt ở quầy lễ tân. 21 người đứng vây quanh quầy như vây quanh đống lửa._
hong_hot: Anh {it}! Sao wifi yếu vậy? Tui đang livestream cảnh biển mà biển nó đứng hình!
dan_dau_tu: {it}, chart anh không load! Coin đang chạy mà!
sales: Anh {it} ơi, em gửi hồ sơ cho đối tác mà nó cứ xoay xoay.
_Ai cũng nhìn bạn, như thể bạn mang theo cái router trong ba lô. Thật ra… bạn có mang. Cái router cũ quấn băng keo, phòng hờ._
* [🎒 Lôi router cũ ra, nối vào dây mạng của resort, phát thêm một mạng.]
    _Tên mạng mới: "G-Entertainment-DI-CHOI". Cả đoàn reo lên như vừa thấy đất liền._
    hong_hot: Anh mang router đi biển hả? Trời ơi đỉnh nóc kịch trần!
    ~ it_on(10)
    ~ it_cam_on()
    ~ qh("hong_hot", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [🔄 Xin lễ tân khởi động lại cục wifi của resort.]
    _Lễ tân nhìn bạn như nhìn người ngoài hành tinh, rồi rút điện. Wifi khỏe lên được 15 phút._
    ~ it_so_lan_restart = it_so_lan_restart + 1
* [😶 "Wifi resort. Không phải của anh."]
    _Đúng, nhưng không ai nghe. Từ chiều tới tối, mỗi lần wifi chập chờn, 21 cái đầu lại quay về phía bạn._
    ~ it_do_toi(10)
- _Trên xe tới đây, {dan_dau_tu} đã tuyên bố "Từ hôm nay tui thoát nghèo". Giờ {dan_dau_tu} đang nhìn điện thoại, tay run run._
-> END

// ------------------------------------------------------------
=== it_1710_hai_san ===
# ngay:17 # gio:18:00 # noi:vung_tau_nha_hang
_Hồng Coin vừa tăng gấp 10 trong 4 tiếng. {dan_dau_tu} đứng giữa nhà hàng, giơ tay gọi món như một vị vua._
dan_dau_tu: Cua! Ghẹ! Tôm hùm! Hôm nay tui bao hết! Lần này là lên thật!
_Cả đoàn hô vang: "Anh {dan_dau_tu} đỉnh nóc!"_
_Bạn nhìn con tôm hùm, rồi nhìn {dan_dau_tu}. Trong đầu bạn hiện một con số: 3.000.000đ. Từ tháng 3._
* [💬 "Anh trả em 3 triệu trước khi ăn."]
    dan_dau_tu: Ơ… để mai về thành phố anh trả hết, trả cả lãi! Hứa trước mặt mọi người luôn!
    _Cả bàn vỗ tay vì lời hứa. Bạn là người duy nhất không vỗ._
    ~ qh("dan_dau_tu", -3)
* [🤝 "Anh bán đi. Bán ngay tối nay."]
    dan_dau_tu: Bán? Bây giờ? Nó còn lên x20 mà em!
    it: Người tạo coin ẩn danh. Log ví lạ. Đừng giữ.
    dan_dau_tu: *(khựng lại, nhìn bạn rất lâu)* …Em nói thật hả?
    ~ qh("dan_dau_tu", 10)
    ~ it_lt(5)
    _Bạn không biết {dan_dau_tu} có nghe không. Nhưng bạn đã nói._
* [🦀 Ăn cua. Ăn thật nhiều cua.]
    _Nếu đằng nào cũng không được trả, ít ra bạn đã ăn được 3 triệu tiền cua. Hoặc gần như vậy._
    ~ an(80)
    ~ cang_thang(-10)
- ~ an(40)
-> END

// ------------------------------------------------------------
=== it_1710_lua_trai ===
# ngay:17 # gio:20:00 # noi:vung_tau_bai_bien # bat_buoc
_20:00. Lửa trại. Bạn lo cái loa kéo. {chi_dai} giao: "Loa mà rè là em ngủ ngoài bãi."_
_{idol_het_thoi} cầm micro, hát "Công Viên". Bạn chỉnh âm cho {idol_het_thoi}, lần đầu tiên sau 10 năm. Giọng ấm, không hú, không rè._
idol_het_thoi: *(hát xong, nhìn bạn)* Ủa… em là thằng nhỏ bị điện giật hồi hội chợ hả? Năm 2016? Trời mưa?
* [😇 "Dạ. Dây loa anh."]
    idol_het_thoi: Trời đất! Mười năm rồi đó! Hồi đó anh còn nổi, em còn ốm nhom!
    _{idol_het_thoi} ôm vai bạn. Lần đầu tiên {idol_het_thoi} nói chuyện mà không như đang trả lời phỏng vấn._
    ~ qh("idol_het_thoi", 20)
* [😶 Gật đầu, rồi chỉnh tiếp cái loa.]
    idol_het_thoi: Vẫn ít nói như hồi đó. Được. Anh thích.
    ~ qh("idol_het_thoi", 10)
- _Lửa tàn dần. {sieu_nhan_hong} ngồi bên đống lửa, kể chuyện hồi nhỏ từng nhốt một đứa nhỏ trong nhà kho. Giọng nhỏ, không giống giọng siêu nhân chút nào._
_Rồi {sieu_nhan_hong} đưa tay lên… tháo chiếc mũ hồng ra, lau mồ hôi. Bên kia đống lửa, điện thoại của {hong_hot} đang livestream._
_Cả đoàn dùng mạng "G-Entertainment-DI-CHOI" của bạn. Bạn có 3 giây._ # hen_gio:3
* [🐢 Bóp băng thông máy của {hong_hot} về 0.]
    _Livestream của {hong_hot} đứng hình ở khung hình đống lửa. Ba giây sau, chiếc mũ đã về lại trên đầu {sieu_nhan_hong}._
    hong_hot: Ủa ủa ủa! Rớt mạng! Đúng lúc quan trọng nhất!
    ~ it_do_toi(5)
    ~ qh("sieu_nhan_hong", 10)
    ~ it_lt(5)
* [😶 Không làm gì. Chuyện của người ta.]
    { RANDOM(1, 10) <= 5:
        _Camera của {hong_hot} đang quay ra biển. Không ai thấy gì._
    - else:
        _1.200 người xem thấy một khuôn mặt bình thường, mắt đỏ hoe, trong ánh lửa. Bình luận: "Ai vậy?", "Đẹp trai mà buồn ghê"._
        ~ follow(20000)
    }
* [⏱️ (Không chọn kịp)]
    _Ba giây trôi qua. Bạn không biết livestream có quay được gì không. Bạn chỉ biết mình đã đứng im._
- _Gần nửa đêm, {idol_het_thoi} ngủ gục lên vai {quan_ly_idol}. {editor} lặng lẽ đắp cái chăn lên cho cả hai._
-> END

// ------------------------------------------------------------
=== it_1710_tin_nhan_bac_binh ===
# ngay:17 # gio:22:30 # noi:vung_tau_resort
_Điện thoại bạn rung. Tin nhắn của Bác {bac_bao_ve}, người ở lại trực công ty. Đúng một tin:_
bac_bao_ve: "{cho} cắn dây gì ở tủ mạng ấy. Bác buộc lại rồi."
_Bạn nhìn tin nhắn. "Buộc lại". Dây mạng không phải dây phơi đồ._
* [🛵 Bắt xe đêm về thành phố kiểm tra.]
    ~ it_ve_som_vung_tau = true
    ~ tien_cong(-250000)
    ~ nghi(-30)
    _Bạn rời resort lúc 22:45. {chi_dai} thấy, gật đầu: "Đi đi. Chị nói với {hr} cho."_
    ~ qh("chi_dai", 5)
    -> it_1710_dem_cong_ty
* [💬 Nhắn lại: "Bác chụp hình giùm con."]
    _Năm phút sau, một tấm hình mờ: mớ dây xanh, một chỗ quấn băng keo cá nhân hình con gấu. Bên cạnh, thấp thoáng một cái gì đó màu vàng._
    { not it_lay_ga_cao_su:
        _Cái gì đó màu vàng có mỏ. Bạn có linh cảm không lành._
    }
    ~ qh("bac_bao_ve", 3)
    -> END
* [😴 "Mai về tính." Đi ngủ.]
    _Bạn ngủ. Trong mơ, router của bạn bị một con chó khổng lồ cắn. Nó vẫy đuôi._
    ~ nghi(30)
    -> END

= it_1710_dem_cong_ty
_0 giờ 40. Công ty tối om. Bác {bac_bao_ve} mở cổng, {cho} chạy ra ngửi chân bạn, vẻ mặt hơi tội lỗi._
_Ở tủ mạng tầng trệt, một sợi dây chính bị gặm sờn, quấn băng keo cá nhân hình con gấu. Bạn thay sợi dây mới._
~ it_on(15)
{ not it_lay_ga_cao_su:
    _Sau tủ, con gà cao su vẫn nằm đó, nơi {sieu_nhan_hong} giấu từ hôm 4/10. Dấu răng chó đầy quanh khe tủ._
}
* {not it_lay_ga_cao_su} [🐔 Lấy con gà ra, trả cho {cho}.]
    ~ it_lay_ga_cao_su = true
    cho: Gâu! *(ngậm gà, chạy một vòng sân, rồi nằm xuống ngủ ngay trên chân bạn)*
    ~ qh("cho", 20)
    bac_bao_ve: À… thì ra nó tìm cái này. Mấy hôm nay nó cứ cào cái tủ.
* [📜 Mở log máy chủ xem đêm nay có ai đăng nhập lạ.]
    _23:47: một máy lạ đăng nhập wifi khách, rồi thử vào thư mục "Hop_dong_SNH". Thất bại. Tên máy bị đổi thành "MAY-IN-2"._
    _Công ty không có máy in 2._
    ~ it_truy_cap(10)
    ~ phat_hien(ran_thu_hai_lo_mat)
    bac_bao_ve: Máy với chả móc. Bác chỉ thấy cái đèn wifi nó nháy cả tối.
- _Bạn lên phòng giám đốc kiểm tra modem phụ, ngồi xuống ghế của {giam_doc} một chút. Chiếc ghế êm như mây._
_Bạn vừa chợp mắt thì 1 giờ 4 phút, một ánh đèn pin rọi thẳng vào mặt._
bac_bao_ve: Bác cứ tưởng trộm. Hóa ra là cháu. Thôi, xuống chòi bác pha trà.
~ qh("bac_bao_ve", 10)
-> END

// ------------------------------------------------------------
=== it_1810_coin_sap ===
# ngay:18 # gio:10:30 # noi:vung_tau_xe_ve
_Ngày 2 team building, trên xe về. Lúc 10:15, người tạo Hồng Coin ôm tiền biến mất. $HONG về 0 trong 15 phút. Còn cái nịt._
_{dan_dau_tu} ngồi ghế cuối, nhìn màn hình điện thoại không chớp mắt. Hóa đơn hải sản tối qua vẫn nằm trong túi áo._
{ it_ve_som_vung_tau:
    _Bạn không có mặt trên xe. Bạn nghe kể lại qua group: cả xe im lặng suốt 2 tiếng. {hong_hot} nhắn riêng: "Anh về sớm là đúng rồi đó."_
    -> END
}
_Cả xe im lặng. Không ai hát. Không ai livestream. {hong_hot} nhìn bạn, ra hiệu: "Nói gì đi anh."_
* [🤝 Đưa {dan_dau_tu} ly mì ly và bình nước nóng mang theo.]
    dan_dau_tu: *(cầm ly mì, giọng khàn)* Em… em nói anh bán rồi mà. Anh không nghe.
    it: Ăn đi. Mì không sập.
    _{dan_dau_tu} ăn. Vừa ăn vừa khóc. Mì hơi mặn._
    ~ qh("dan_dau_tu", 15)
    ~ mat(mi_ly)
* [💬 "Ba triệu của em khỏi trả."]
    dan_dau_tu: Không! Anh trả! Anh phải trả… Anh trả được mà…
    _Bạn không nói gì thêm. Nhưng {dan_dau_tu} nhìn bạn như nhìn người đầu tiên không đòi nợ mình._
    ~ qh("dan_dau_tu", 20)
    ~ it_lt(5)
* [😶 Đeo tai nghe, nhìn ra cửa sổ.]
    _Biển lùi lại phía sau. Bạn nghĩ tới cái router ở nhà, không biết có ai cho nó uống nước không._
- -> END

// ------------------------------------------------------------
=== it_1810_ve_thanh_pho ===
# ngay:18 # gio:16:00 # noi:phong_server
_Về tới thành phố. Ai cũng giận ai. Bạn đi thẳng vào phòng server như đi về nhà._
_Điện thoại rung. {con_ong_chau_cha}: "Anh {it}, anh check giúp em cái tin rao này có phải lừa đảo hông?"_
_Kèm theo là đường link: "Bán gấp penthouse tầng 30 chung cư Sky Ảo. Chính chủ."_
* [📜 Kiểm tra thật kỹ.]
    _Tin rao đăng từ một tài khoản môi giới thật, có giấy tờ thật. Không phải lừa đảo._
    it: Thật. Xin lỗi em.
    con_ong_chau_cha: …À. Ừ. Vậy là thật. Em cảm ơn anh.
    _Mười phút sau {con_ong_chau_cha} gửi thêm một tin: "Anh có biết chỗ nào thuê phòng thu âm rẻ hông?"_
    ~ qh("con_ong_chau_cha", 10)
* [😶 "Hỏi chú em đi."]
    con_ong_chau_cha: Chú em không nghe máy. Từ hôm thẻ bị khóa tới giờ.
    _Bạn đọc tin đó ba lần. Rồi bạn kiểm tra đường link. Nó là thật._
    ~ qh("con_ong_chau_cha", 3)
- -> END

// ------------------------------------------------------------
=== it_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_tang_2 # bat_buoc
_Giao ban thứ 2. Không ai nhìn mặt ai. {truong_phong} cố mở lời bằng một slide có tiêu đề "Chúng ta là một gia đình"._
truong_phong: Mai là 20/10, sinh nhật công ty 16 tuổi. Cậu {it} chuẩn bị âm thanh cho buổi lễ. Ba micro không dây. Đừng để hú như hôm 13.
_Bạn có hai micro không dây. Cái thứ ba nằm trong kho, pin phồng như bánh bao._
* [🛒 Tự mua pin mới, sửa micro thứ ba.]
    ~ tien_cong(-180000)
    ~ it_on(5)
    _Ba micro. Ba cục pin mới. Bạn dán nhãn từng cái: "Sếp", "{thanh_ninh}", "Đừng ai cầm"._
* [💬 "Hai micro. Mua thêm cần ba chữ ký."]
    truong_phong: Ba chữ ký thì mình họp để xin ba chữ ký nhé.
    _Cuộc họp xin chữ ký kéo dài 45 phút. Không có chữ ký nào._
    ~ cang_thang(10)
- _Sau giờ họp, {designer} gửi file logo kỷ niệm 16 năm lần sửa thứ 37. Rồi lần thứ 38. Lần thứ 38 giống hệt logo năm 2010._
designer: Anh {it}… in giùm em bản này. Đây là bản đầu tiên. Ổng chọn lại bản đầu tiên.
* [🖨️ In bằng giấy đẹp nhất, màu chuẩn nhất.]
    designer: *(nhìn tờ giấy rất lâu)* Đẹp ghê. Mười sáu năm rồi mà nó vẫn đẹp. Cảm ơn anh.
    ~ qh("designer", 10)
    ~ it_cam_on()
* [😶 In. Đưa. Đi.]
    ~ qh("designer", 2)
- -> END

// ------------------------------------------------------------
=== it_2010_qua_chi_em ===
# ngay:20 # gio:08:30 # noi:pantry
_Ngày Phụ nữ Việt Nam. Bàn nào cũng có hoa. Bạn không có hoa. Bạn có một tấm bìa cứng viết tay: "SỬA ĐIỆN THOẠI MIỄN PHÍ CHO CHỊ EM. HÔM NAY THÔI."_
hong_hot: Ủa anh {it}, quà 20/10 của anh là… sửa điện thoại hả?
* [😇 "Đưa máy đây."]
    _Bạn sửa cho {hong_hot} cái sạc lỏng, cho {ke_toan} cái màn hình đơ, cho {designer} cái loa rè, cho {sales} cái nút nguồn kẹt, cho {bien_kich} cái bàn phím gõ ra toàn chữ "đ"._
    _Bạn sửa cho {chi_dai} cái bộ đàm. {thanh_ninh} cũng xếp hàng. Bạn sửa luôn._
    hong_hot: Thực dụng tới mức cảm động luôn á. Cảm ơn anh!
    ke_toan: Không tốn đồng nào mà xài được thêm 2 năm. Quà này tui chấm 10.
    ~ it_cam_on()
    ~ it_cam_on()
    ~ it_cam_on()
    ~ qh("hong_hot", 5)
    ~ qh("ke_toan", 10)
    ~ qh("designer", 5)
    ~ qh("sales", 5)
    ~ qh("bien_kich", 5)
    ~ qh("chi_dai", 5)
    ~ qh("thanh_ninh", 5)
    ~ nghi(-20)
* [🤝 Vừa sửa vừa dạy từng người cách tự khởi động lại.]
    _Chậm hơn, nhưng cuối buổi, 5 chị em biết giữ nút nguồn 10 giây. {ke_toan} còn ghi vào sổ._
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 3
    ~ it_cam_on()
    ~ it_cam_on()
    ~ qh("ke_toan", 10)
    ~ qh("hong_hot", 5)
    ~ qh("chi_dai", 5)
    ~ nghi(-25)
- -> END

// ------------------------------------------------------------
=== it_2010_thu_g ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_18:30. Tiệc sinh nhật 16 tuổi của {cong_ty} ở Quán Ốc Đêm. Logo năm 2010 in trên băng rôn. Bạn được giao cái loa kéo với micro của quán._
_Bác {bac_bao_ve} ngồi đầu bàn, cầm một lá thư tay ký chữ "G" tới chòi sáng nay, kẹp theo một phong bì dán kín. Bác nhìn cái micro, rồi nhìn bạn._
bac_bao_ve: *(nói nhỏ)* Cháu… cái micro kia có chạy không?
_Bạn hiểu: nếu micro chạy, bác có thể đọc. Nếu không, bác có cớ để không đọc. Bác đang hỏi bạn giúp bác quyết định._
* [🎤 "Chạy bác. Con đứng đây."]
    _Bạn bật micro, chỉnh âm thật ấm. Bác {bac_bao_ve} đứng dậy, giọng Bắc chậm rãi vang khắp quán._
    bac_bao_ve: "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui. Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. G."
    _Ngắn vậy thôi. Nhưng cả quán im phăng phắc. {giam_doc} cúi mặt rất lâu. Phong bì dán kín vẫn nằm trong túi áo bác._
    ~ qh("bac_bao_ve", 15)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
* [🔇 "Micro hư rồi bác." Rút pin ra.]
    bac_bao_ve: *(thở ra)* Ừ. Thế thì thôi. Để bác cất. Ốc nguội mất.
    _Bác cất lá thư vào túi áo, gật đầu với bạn. Như cảm ơn. Như hiểu._
    ~ qh("bac_bao_ve", 10)
    ~ it_lt(3)
* [💬 "Bác muốn đọc không?"]
    bac_bao_ve: *(im lặng rất lâu)* Bác không biết. Cháu nghĩ sao?
    it: Bác đọc. Con giữ micro.
    _Bác đọc. Giọng run. Micro không hú một lần nào._
    ~ qh("bac_bao_ve", 20)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
- -> END

// ------------------------------------------------------------
=== it_2010_karaoke ===
# ngay:20 # gio:21:00 # noi:karaoke
_Sau quán ốc, cả công ty kéo qua Karaoke Chú Sáu. Dàn máy của quán hư, bạn được gọi vào sửa như mọi khi._
_{giam_doc} đã say. Cầm micro, đứng lên ghế._
giam_doc: Anh tuyên bố! Nếu Siêu Nhân Hồng đạt một triệu, cả công ty tăng lương 20%! Anh không ép, tùy… tùy anh!
_Cả phòng gào lên. Màn hình karaoke có nút "Ghi âm" đang nhấp nháy. Bạn là người duy nhất biết nút đó ở đâu._
* [🔴 Bấm ghi âm. Bằng chứng là bằng chứng.]
    _File ghi âm 47 giây, rõ từng chữ "20%". Bạn lưu vào ổ riêng, đặt tên "hua_luong.mp3"._
    ~ qh("ke_toan", -3)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    hong_hot: *(nháy mắt)* Anh ghi rồi hả? Nghe gì chưa, IT có bằng chứng!
    ~ qh("hong_hot", 5)
* [🎚️ Vặn nhỏ micro của {giam_doc}, tăng nhạc lên.]
    _Lời hứa chìm trong tiếng nhạc "Công Viên" bản remix. Sáng mai, không ai chắc mình đã nghe thấy gì._
    ~ qh("ke_toan", 10)
    ke_toan: *(thì thầm)* Ông cứu quỹ lương công ty đó.
* [🎤 Đưa micro cho {idol_het_thoi} hát cho đổi chủ đề.]
    idol_het_thoi: Để anh! Fan anh đông lắm em!
    _{idol_het_thoi} hát 3 bài liền. {giam_doc} ngủ gục trên ghế sofa, tay vẫn giơ số 20._
    ~ qh("idol_het_thoi", 5)
- ~ uong(20)
~ cang_thang(-10)
-> END
