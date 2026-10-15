// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · CHƯƠNG 6: "XUẤT NHẦM" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== editor_2810_xuat_nham ===
# ngay:28 # gio:03:00 # noi:phong_dung_phim # bat_buoc
{ not ed_dung_video_thai:
    _3 giờ sáng. Bạn xuất bản dựng teaser Đêm Hồng. Lần này bạn chọn đúng thư mục, đúng tên file. Bạn kiểm tra hai lần, rồi ngủ gục lên bàn phím._
    ~ ed_thuc_dem()
    -> END
}
_3 giờ sáng. Đêm trắng thứ {ed_dem_thuc}. Bạn có hai việc phải xuất: teaser Đêm Hồng cho fanpage công ty, và bản lưu của video thư mục "{quan_ly_idol}"._
_Mắt bạn mờ. Ô "Đích xuất file" có hai dòng giống nhau tới mức đáng sợ: "Fanpage G-Entertainment (hẹn giờ)" và "Ổ_riêng/Thai_final"._
_Bạn bấm. Thanh tiến trình chạy. Màn hình hiện: "Đã thêm vào hàng chờ. Đăng lúc 09:00, 29/10 – Fanpage G-Entertainment"._
_Bạn không đọc dòng đó. Bạn đang ngủ._
~ ed_video_xuat_nham = true
~ ed_thuc_dem()
* [😴 (Ngủ tiếp.)]
    _Bạn mơ thấy thanh render chạy tới 100% rồi chạy tiếp, 101%, 102%, ra khỏi màn hình, chạy mất._
* {ed_dem_thuc <= 2} [👀 Giật mình tỉnh lúc 3 giờ 07, liếc lại hàng chờ.]
    _Fanpage G-Entertainment. Hẹn giờ 9 giờ sáng mai. Video "Thai_final"._
    _Tim bạn ngừng một nhịp. Bạn bấm hủy. Hàng chờ trống. Video về lại thư mục. Bạn ngồi thở như vừa chạy hai cây số._
    ~ ed_video_xuat_nham = false
    ~ cang_thang(15)
- -> END

// ------------------------------------------------------------
=== editor_2810_moc_4 ===
# ngay:28 # gio:14:00 # noi:phong_nghe_si # bat_buoc
_Mốc 4: phải đạt 800.000 người theo dõi. Bộ lọc số liệu của {dan_dau_tu} vừa lần ra 80.000 tài khoản ảo bình luận "Anh {idol_het_thoi} đỉnh nóc kịch trần"._
{ nguoi_theo_doi < 800000:
    _Chưa đạt mốc 4. LL-Entertainment đăng lên mạng: "Ngôi sao xứng đáng một bến đỗ tốt hơn." Cả công ty hiểu là nói ai._
}
_Phòng nghệ sĩ. {quan_ly_idol} ngồi giữa hai điện thoại úp mặt xuống bàn. Lần đầu bạn thấy anh ấy không nghe máy._
quan_ly_idol: {editor}. Anh cần một video cứu {idol_het_thoi}. Anh không biết cứu kiểu gì nữa.
* {ed_tu_lieu_16_nam} [🔒 Dùng bản thu gốc "Công Viên" năm 2015, ghép với clip hát trong bóng tối. "Mười năm, một giọng hát."]
    ~ ed_tien_tay()
    ~ follow(25000)
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 15)
    ~ ed_can(8)
    _Giọng năm 2015 và giọng năm 2026, chồng lên nhau ở điệp khúc. Run như nhau. Thật như nhau._
    _Bình luận: "Fan ảo thì xóa đi. Còn tui là fan thật nè."_
* [🎁 Video Tiện Tay: {idol_het_thoi} nói thẳng vào máy quay, không kính đen, không kịch bản.]
    ~ ed_tien_tay()
    ~ follow(10000)
    ~ qh("idol_het_thoi", 10)
    ~ ed_can(5)
    idol_het_thoi: *(nhìn thẳng ống kính)* Tôi thuê người khen mình. Vì tôi sợ không còn ai khen nữa. Tôi xin lỗi.
    _Bạn để nguyên. Không cắt. Không nhạc. Đây là lần đầu bạn dựng một video mà không dựng gì cả._
* [😶 "Dạ… em hết sức rồi anh. Em xin một đêm ngủ."]
    quan_ly_idol: *(nhìn quầng thâm của bạn)* Ừ. Ngủ đi. Anh xin lỗi. Anh quên là em cũng là người.
    ~ ed_ngu_du()
- { ed_cong_khai_kenh && not ed_keu_goi_follow && not ed_ban_kenh:
    _Trên đường về, bạn mở kênh "Cú Đêm Cắt Ghép". Gần một triệu người đang chờ con cú nói gì đó._
}
* {ed_cong_khai_kenh && not ed_keu_goi_follow && not ed_ban_kenh} [🔒 Đăng video 40 giây: con cú chỉ vào bộ đồ hồng. "Cú đêm nhờ cả nhà một việc."]
    ~ ed_keu_goi_follow = true
    ~ follow(150000)
    ~ uy_tin = uy_tin + 15
    _Một trăm năm mươi nghìn người bấm theo dõi {sieu_nhan_hong} trong một đêm. Ở góc màn hình, bộ đếm sub của bạn cũng nhích lên._
    ~ ed_sub_cong(10000)
* [🏠 Về nhà.]
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== editor_2910_99_phan_tram ===
# ngay:29 # gio:09:00 # noi:phong_dung_phim # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả ngày. {it} bị cả công ty truy đuổi qua ba tầng lầu._
{ not ed_video_xuat_nham:
    _Hàng chờ fanpage trống. Video thư mục "{quan_ly_idol}" nằm yên trong ổ riêng. Không có mạng, bạn dựng offline, yên bình như giữa đêm._
    { ed_dung_video_thai:
        _Bạn chép nó vào một cái USB. Cái USB nhỏ xíu, hình con cú, mua ở cửa hàng tiện lợi lúc 2 giờ sáng._
        ~ ed_chep_usb = true
    }
    -> END
}
_Màn hình: "Đang tải lên Fanpage G-Entertainment… 99%". Wifi chập chờn. Thanh tiến trình đứng ở đó như một lời thú tội chưa nói hết._
_Cả công ty than không có mạng. Chỉ có bạn cầu cho mạng đừng bao giờ có lại._
_Ở phòng bên, {it} hét: "Sắp có mạng lại rồi!"_ # hen_gio:5
* [❌ Bấm hủy.]
    ~ ed_huy_video = true
    ~ ed_can(-10)
    ~ ed_loi_99 = ed_loi_99 + 1
    _Video biến mất khỏi hàng chờ. An toàn. Video vẫn nằm trong thư mục "{quan_ly_idol}". Như bốn năm qua._
* [🙈 Không làm gì. Để số phận quyết định.]
    ~ ed_video_len_fanpage = true
    _Mạng có lại. 100%. "Đã đăng." Bốn phút về {quan_ly_idol}, trên fanpage của cả công ty._
    _Bạn nhìn màn hình. Không thở._
* [🏃 Rút dây mạng máy mình, xóa hàng chờ, chép video vào USB.]
    ~ ed_chep_usb = true
    ~ ed_can(5)
    _Bạn giật dây mạng như giật dây kíp nổ. Hàng chờ trống. Video vào một cái USB nhỏ xíu hình con cú._
    _Lần này, nếu nó tới tay anh ấy, thì là do bạn tự tay đưa. Không phải do thuật toán. Không phải do số phận._
* [⏱️ (Không chọn kịp)]
    ~ ed_video_len_fanpage = true
    _{it} cắm lại dây. 100%. "Đã đăng." Bạn nhìn màn hình rất lâu._
- -> END

// ------------------------------------------------------------
=== editor_2910_tong_dai_giay ===
# ngay:29 # gio:14:00 # noi:choi_bao_ve # bat_buoc
_Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} chia thư vào mấy hộp bánh. {chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua"._
_{con_ong_chau_cha} chạy lên cầu thang bộ, thở hồng hộc, ôm một ổ cứng. Lần đầu tiên trong đời anh ấy chạy trong công ty._
con_ong_chau_cha: {editor}! Bản thu cuối! Thang máy kẹt! Mix giùm tui được hông? Offline cũng được!
* [🎧 "Được. Ngồi đây. Hát lại đoạn hai cho em nghe."]
    _Bài hát tên "Hồng Là Thái Độ". Giọng hát ký tên "Rồng". Bạn nhìn {con_ong_chau_cha}, rồi nhìn file, rồi không hỏi gì._
    ~ phat_hien(bai_hat_long)
    ~ qh("con_ong_chau_cha", 15)
    ~ uy_tin = uy_tin + 3
* [😴 "Dạ… đợi render xong…" (Thật sự đang render.)]
    con_ong_chau_cha: *(ngồi xuống sàn, ôm ổ cứng)* Ờ. Tui chờ. Lần đầu tui chờ ai đó.
    ~ qh("con_ong_chau_cha", 5)
- _Một tờ giấy gấp tư trong hộp "Phòng dựng". Chữ của bác {bac_bao_ve}: "Cháu nhớ ăn trưa. Bác thấy cháu ba ngày không xuống căn tin rồi."_
* [🍚 Xuống căn tin ăn trưa.]
    ~ an(55)
    ~ qh("bac_bao_ve", 5)
* [✍️ Viết lại vào mặt sau: "Dạ con cảm ơn bác. Con ăn mì rồi ạ." (Chưa ăn.)]
    ~ qh("bac_bao_ve", 3)
    _Bác đọc tờ giấy, lắc đầu, rồi sai {cho} ngậm một hộp cơm lên phòng dựng. {cho} đặt hộp cơm lên bàn phím của bạn._
    ~ an(40)
    ~ qh("cho", 5)
- -> END

// ------------------------------------------------------------
=== editor_2910_dem ===
# ngay:29 # gio:22:00 # noi:can_701 # bat_buoc
{ ed_video_len_fanpage:
    _22 giờ. Video trên fanpage đã có 50.000 lượt xem. Bình luận: "Hậu trường quản lý nghệ sĩ cảm động ghê", "Công ty quay chuyên nghiệp ghê"._
    { ed_nguoi_dung_dem:
        _Điện thoại rung. {quan_ly_idol}: "{editor}. Cái video trên fanpage… là em hả?"_
        _Rồi: "Anh coi bốn lần rồi. Anh không biết nói gì."_
    - else:
        _{quan_ly_idol} bình luận dưới video: "Dựng hay ghê! Ai dựng vậy? Dựng cho {idol_het_thoi} một cái y vậy nha, gấp."_
        _Bạn đọc bình luận đó ở căn 701, rèm đen kín. Bạn không trả lời._
        ~ ed_can(-10)
        ~ cang_thang(20)
    }
- else:
    { ed_chep_usb:
        _22 giờ. Cái USB hình con cú nằm trên bàn, cạnh cốc RENDER. Nhỏ tới mức có thể mất. Nặng tới mức không cầm lên nổi._
    - else:
        _22 giờ. Căn 701. Bạn ngồi trước ba màn hình tắt. Mai họp đánh giá. Ngày kia Đêm Hồng._
    }
}
* {ed_video_len_fanpage && ed_nguoi_dung_dem} [💌 "Dạ. Là em. Bốn năm."]
    ~ ed_can(15)
    _Đã xem. Không trả lời. Rồi 23:47: "Mai gặp anh trước Đêm Hồng nha. Anh muốn nói chuyện. Không phải chuyện công việc."_
* {ed_video_len_fanpage && ed_nguoi_dung_dem} [😶 "Dạ… em xuất nhầm. Em xin lỗi anh."]
    ~ ed_can(-5)
    _"Không sao. Đẹp lắm. Cảm ơn em." Không có biểu tượng con cú nào._
* [😴 Ngủ. Đêm nay phải ngủ.]
    ~ ed_ngu_du()
* [📺 Dựng nốt video tổng kết Đêm Hồng. Thức trắng.]
    ~ ed_thuc_dem()
    ~ uy_tin = uy_tin + 3
- -> END

// ------------------------------------------------------------
=== editor_3010_usb ===
# ngay:30 # gio:12:15 # noi:san_thuong # bat_buoc
{ not ed_chep_usb:
    _Trưa. Sân thượng. Bạn ngồi trên ghế nhựa, ăn ổ bánh mì {thuc_tap_sinh} mua giùm. Gió thổi bay tờ giấy note vàng kẹp trong ốp lưng. Bạn chụp lại kịp._
    ~ an(30)
    -> END
}
_Trưa. Sân thượng. {quan_ly_idol} đứng ở chỗ hôm nghe điện thoại của LL, tay cầm ly cà phê, không cầm điện thoại nào. Lạ._
_Cái USB hình con cú trong túi áo bạn. Bạn bóp nó tới mức in hình con cú vào lòng bàn tay._
quan_ly_idol: {editor}. Lên đây trốn họp hả?
* {ed_can_dam >= 80} [🔒 Đưa USB. "Anh coi cái này sau Đêm Hồng nha. Khi xong hết rồi."]
    ~ ed_dua_usb_thai = true
    quan_ly_idol: *(cầm cái USB, xoay xoay)* Con cú. *(nhìn bạn)* Cái gì trong đây?
    editor: Dạ… một bản dựng. Của em. Lần này em ký tên.
    quan_ly_idol: *(bỏ USB vào túi áo ngực, chỗ không có điện thoại)* Ừ. Sau Đêm Hồng. Anh hứa.
* [💌 Đưa USB, nói nhanh: "Anh coi liền đi." (Can đảm chưa đủ để chờ.)]
    _Anh ấy cắm vào laptop. Ba mươi giây. Rồi điện thoại reo: {sieu_nhan_hong} cần gấp. Anh ấy rút USB, đưa lại cho bạn: "Tối anh coi tiếp nha em." Tối đó không ai coi._
    ~ ed_can(-5)
* [😶 Không đưa. "Dạ em lên hóng gió."]
    quan_ly_idol: Ừ. Gió trên này thật hơn gió máy lạnh.
    _Cái USB vẫn trong túi. Đêm Hồng ngày mai. Sau đó thì không biết._
    ~ ed_can(-3)
- -> END

// ------------------------------------------------------------
=== editor_3010_hop_danh_gia ===
# ngay:30 # gio:15:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. Màn hình lớn chiếu báo cáo: "Sản phẩm truyền thông tháng 10: MV, highlight gameshow, clip bà cụ, video 16 năm, livestream."_
_Ô cuối cùng: "Người thực hiện: ____". {truong_phong} cầm bút laser._
truong_phong: Phòng Sản xuất xin báo cáo. Người thực hiện…
* {ed_cong_bi_nhan_vo <= 40} [✋ Đứng dậy: "Dạ, em xin điền: Dựng phim: {editor}. Em có bằng chứng ở giây 2:47."]
    ~ ed_o_nguoi_thuc_hien = "editor"
    ~ ed_vo(-20)
    ~ uy_tin = uy_tin + 5
    _Cả phòng quay lại nhìn bạn. Lần đầu tiên bạn đứng thẳng trong một phòng họp mà không phải để đi ngủ._
    giam_doc: Em ngồi xuống. *(quay sang {truong_phong})* Điền tên {editor}.
* [🤝 Nhìn {truong_phong}: "Anh điền tên cả hai đi anh. Anh giám sát, em dựng."]
    ~ ed_o_nguoi_thuc_hien = "ca_hai"
    ~ ed_vo(-15)
    ~ qh("truong_phong", 10)
    truong_phong: *(khựng lại, rồi gật)* Ừ. Thế là đúng. Anh… lẽ ra phải ghi từ lâu.
* [😶 Ngồi im. Để {truong_phong} điền.]
    ~ ed_o_nguoi_thuc_hien = "truong_phong"
    ~ ed_vo(5)
    _Ô "Người thực hiện" ghi: {truong_phong}. Lần thứ 62._
- -> editor_3010_danh_gia

// ------------------------------------------------------------
=== editor_3010_dem_trang_cuoi ===
# ngay:30 # gio:22:00 # noi:phong_dung_phim
_Đêm 30. Đêm trắng cuối cùng của tháng 10. Video tổng kết Đêm Hồng phải xong trước 6 giờ tối mai._
_{thuc_tap_sinh} ngồi cạnh, soát phụ đề. {chua_te_deadline} nằm trên sofa, lần này không ngủ, đang gõ bảng tiến độ thật._
chua_te_deadline: Lần đầu tui làm xong việc sớm. Ông đừng nói ai, người ta nghi tui có âm mưu.
* [✂️ Dựng tới sáng. Cắt Đúng Nhịp từng giây.]
    ~ ed_video_tong_ket = true
    ~ ed_thuc_dem()
    _5 giờ sáng. Bạn bấm xuất. Lần này bạn đọc kỹ ô "Đích xuất file". Ba lần._
* [⏳ Render Qua Đêm. Ngủ gục ba tiếng. Tin vào cái máy.]
    { RANDOM(1, 10) <= 7:
        ~ ed_video_tong_ket = true
        ~ nghi(20)
        _6 giờ. Máy báo xong. Không lỗi. Lần đầu tiên trong tháng, cái máy thương bạn._
    - else:
        ~ ed_loi_99 = ed_loi_99 + 1
        ~ ed_video_tong_ket = true
        ~ ed_thuc_dem()
        _6 giờ. Lỗi ở 99%. Bạn bật cười. Thật sự bật cười. Rồi render lại, tỉnh như sáo._
    }
- -> END

// ------------------------------------------------------------
=== editor_3110_truoc_gio ===
# ngay:31 # gio:18:40 # noi:san_khau_dem_hong # bat_buoc
_Sân khấu Đêm Hồng. Bàn dựng của bạn nằm sau khán đài, dưới một cái lều đen. Ba màn hình, một bộ trộn hình, một ly cà phê._
_Cả công ty hóa trang. {giam_doc} là "Ông Kẹ Ngân Hàng". {thuc_tap_sinh} hóa trang thành… thực tập sinh. {sieu_nhan_hong} thì vẫn là {sieu_nhan_hong}._
_{quan_ly_idol} đi ngang lều, dừng lại, thò đầu vào._
quan_ly_idol: Em hóa trang thành gì vậy?
editor: Dạ… thành con cú.
quan_ly_idol: *(nhìn cái mũ len và quầng thâm của bạn)* Ờ. Giống thiệt. *(cười)* Lát nữa… làm tốt nha.
{ ed_video_len_fanpage && ed_nguoi_dung_dem:
    quan_ly_idol: *(nhỏ giọng)* Cái video hôm qua… anh vẫn chưa biết nói gì. Mà anh giữ nó rồi. Tải về máy. Được hông?
    _Bạn gật đầu. Không nói được chữ nào. Đó là câu trả lời dài nhất bạn từng có._
}
* [💌 "Anh cũng vậy. Hôm nay anh đừng nghe điện thoại nha."]
    quan_ly_idol: *(nhìn hai cái điện thoại trên tay)* …Ừ. Thử. *(tắt một cái)* Một cái thôi.
    ~ ed_can(3)
* [😶 Gật đầu. Quay lại màn hình.]
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== editor_3110_ban_dung ===
# ngay:31 # gio:19:50 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 50. Phim ngắn của {bien_kich} vừa chiếu xong. Tới lượt video tổng kết "16 năm" của bạn. Rồi màn hình lớn là của bạn, dựng trực tiếp._
{ ed_video_tong_ket:
    _Video tổng kết chạy. Căn phòng 20 mét vuông. Bài hát năm 2015. Bà cụ và ly chè. Chiếc bánh kem đổ. Bình minh Vũng Tàu._
    ~ follow(50000)
- else:
    _Video tổng kết chưa xong hẳn. Bạn dựng nốt những đoạn cuối ngay trên bàn trộn, tay nhanh hơn ý nghĩ._
    ~ follow(20000)
}
_Màn hình lớn còn trống ba phút trước khi {sieu_nhan_hong} lên sân khấu. Bạn quyết định nó chiếu gì._
* {ed_cong_khai_kenh && not ed_ban_kenh} [🦉 Chiếu con cú đeo tai nghe, chỉ vào bộ đếm người theo dõi: "Cú ơi, bấm theo dõi đi!"]
    { not ed_keu_goi_follow:
        ~ ed_keu_goi_follow = true
        ~ follow(100000)
    - else:
        ~ follow(30000)
    }
    _Cả nghìn người giơ điện thoại lên. Bộ đếm nhảy như nhịp tim._
* [🎥 Chiếu cảnh khán giả. Từng khuôn mặt. Những người đã ở đây suốt tháng 10.]
    ~ follow(20000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    _{dan_dau_tu} thấy mình trên màn hình lớn, giơ tay chào như vừa x10._
* [🎤 Chiếu bản dựng {idol_het_thoi} hát "Công Viên" mười năm trước và hôm nay.]
    ~ follow(15000)
    ~ qh("idol_het_thoi", 10)
    ~ qh("quan_ly_idol", 10)
    _Ở hàng ghế đầu, {quan_ly_idol} tắt nốt cái điện thoại còn lại._
- -> END

// ------------------------------------------------------------
=== editor_tudo_ngat ===
# ngau_nhien # dieu_kien:ed_vua_ngat # bat_buoc
~ ed_vua_ngat = false
_Bạn đang nói "Dạ… đợi render xong…" thì sàn nhà nghiêng. Bàn phím lao vào mặt bạn. Hoặc mặt bạn lao vào bàn phím._
_Tối om._
_Tỉnh dậy ở Phòng khám Đa Khoa Khỏe Re. Trần nhà trắng. Đèn sáng. Quá sáng._
bac_si: Lại là… à không, lần này là cậu. Bảy đêm không ngủ. Cậu là người hay cú?
{ ed_so_lan_ngat >= 2:
    _Lần thứ hai. Bác sĩ không cười nữa. Bác sĩ viết vào hồ sơ một dòng chữ đỏ._
    ~ cang_thang(20)
- else:
    _{chi_dai} ngồi ở ghế bên cạnh, khoanh tay. {thuc_tap_sinh} ôm túi cam. {quan_ly_idol} đứng ở cửa, điện thoại tắt màn hình._
    chi_dai: Ngủ. Lệnh của chị. Đứa nào bắt em dựng nữa, chỉ mặt chị.
}
* [😴 Ngủ. Thật.]
    ~ ed_ngu_du()
    ~ nghi(30)
* [📱 "Dạ… còn cái MV…"]
    chi_dai: *(tịch thu điện thoại)* MV cái gì. Ngủ.
    ~ ed_ngu_du()
    ~ qh("chi_dai", 5)
- ~ uy_tin = uy_tin - 5
-> END
