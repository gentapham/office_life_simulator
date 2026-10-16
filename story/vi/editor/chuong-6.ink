// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · CHƯƠNG 6: "XUẤT NHẦM" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== editor_2810_xuat_nham ===
# ngay:28 # gio:02:10 # noi:phong_dung_phim # bat_buoc
~ ed_dung_video_thai = true
_2 giờ 10 sáng. Đêm trắng thứ {ed_dem_thuc}. Bạn tải bản nháp video "16 năm" lên kênh "Cú Đêm Cắt Ghép" ở chế độ riêng tư, để sáng gửi link cho sếp duyệt._
_Mắt bạn mờ. Trên timeline, sau đoạn kết, còn sót một đoạn bốn phút bạn kéo vào từ thư mục "{quan_ly_idol}" hồi tối, chưa kịp xóa: "Thai_final_v12". Và ô "Chế độ" ghi "Công khai"._
* [✂️ Bấm tải lên, rồi ngồi soát lại phụ đề bản dựng chính.]
    _Bạn soát phụ đề. Bạn không soát cái ô "Chế độ"._
* [⏳ Bấm tải lên, gục xuống ngủ trong lúc chờ.]
    _Bạn gục xuống, má áp lên phím "J"._
    ~ nghi(10)
- _2 giờ 16. Điện thoại rung liên tục. {chua_te_deadline}, đang nằm sofa phòng dựng chạy deadline, bật dậy: "Ông ơi! Kênh ông đang công khai cái gì vậy? Cuối video có ông {quan_ly_idol} ngủ trong xe kìa!"_
_Bạn gỡ video. Sáu phút. 2.014 lượt xem. Toàn cú đêm. Ảnh bìa tự chọn là khung hình cuối: {quan_ly_idol} ngủ gục trong xe, đầu tựa cửa kính._
~ ed_video_xuat_nham = true
~ ed_thuc_dem()
_Còn lại file "Thai_final_v12" trên máy. Bốn phút. Bốn năm._
* [🦉 Chép bản gốc vào cái USB hình con cú, xóa khỏi timeline video "16 năm".]
    ~ ed_chep_usb = true
    ~ ed_can(5)
    _Cái USB mua ở cửa hàng tiện lợi lúc 2 giờ sáng. Nhỏ xíu. Lần này, nếu nó tới tay anh ấy, là do bạn tự tay đưa._
* [🗑️ Xóa vĩnh viễn. Không bao giờ nữa.]
    ~ ed_huy_video = true
    ~ ed_can(-10)
    ~ ed_loi_99 = ed_loi_99 + 1
    _Thùng rác trống. Thư mục "{quan_ly_idol}" còn 214 clip, chưa dựng thành gì cả. Như bốn năm qua._
* [😴 Để nguyên đó. Ngủ. Mai tính.]
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== editor_2810_anh_chup ===
# ngay:28 # gio:09:30 # noi:phong_dung_phim # bat_buoc
_9 giờ 30. Hai nghìn lượt xem lúc 2 giờ sáng đã thành vài tấm ảnh chụp màn hình trong group công ty. Tấm nào cũng là khung hình cuối: một người cầm hai điện thoại, ngủ gục trong xe._
hong_hot: *(chạy vào phòng dựng)* {editor}! Nghe gì chưa? Cái đoạn cuối video hôm qua là gì vậy? Ai cũng hỏi!
_{quan_ly_idol} đứng ngoài cửa, tay cầm hai điện thoại, không vào._
* [🎬 "Dạ… đoạn hậu trường em dựng thử để làm quảng cáo cho phòng nghệ sĩ. Em ghép nhầm."]
    ~ ed_video_len_fanpage = true
    ~ ed_can(-5)
    hong_hot: À, quảng cáo! Hèn chi đẹp vậy. *(quay ra)* Anh {quan_ly_idol} ơi, hậu trường PR đó anh!
    _Ngoài cửa, {quan_ly_idol} gật đầu, đi tiếp. Bạn thở ra. Rồi thấy hơi tiếc, không biết tiếc cái gì._
* {ed_can_dam >= 40} [💌 Đi ra cửa, nói nhỏ với {quan_ly_idol}: "Đoạn đó… em dựng cho anh. Em ghép nhầm vô video."]
    ~ ed_noi_voi_thai = true
    ~ ed_can(10)
    quan_ly_idol: *(im rất lâu)* …Anh chưa coi. Anh chỉ thấy cái hình. *(nhìn bạn)* Từ từ anh coi, được hông?
    editor: Dạ. Em quen chờ render mà.
    { not ed_huy_video && not ed_chep_usb:
        _Tối đó, bạn chép đoạn "Thai_final_v12" vào một cái USB hình con cú. Để khi nào anh ấy muốn coi, nó nằm sẵn trong tay anh ấy, không nằm trên mạng._
        ~ ed_chep_usb = true
    }
* [😶 Không nói gì. Cúi xuống bàn phím.]
    truong_phong: *(bước vào, đứng chắn trước bàn bạn)* Sự cố kỹ thuật của phòng Sản xuất. Anh là trưởng phòng, anh nhận. Không ai hỏi {editor} nữa nhé.
    _Lần đầu tiên tên bạn đứng sau tên {truong_phong} mà bạn không thấy khó chịu._
    ~ qh("truong_phong", 10)
    ~ ed_vo(-5)
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
    ~ follow(15000)
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
    ~ follow(100000)
    ~ uy_tin = uy_tin + 15
    _Một trăm nghìn người bấm theo dõi {sieu_nhan_hong} trong một đêm. Ở góc màn hình, bộ đếm sub của bạn cũng nhích lên._
    ~ ed_sub_cong(10000)
* [🏠 Về nhà.]
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== editor_2910_99_phan_tram ===
# ngay:29 # gio:09:00 # noi:phong_dung_phim # bat_buoc
_Ngày Internet Quốc tế. 8 giờ 50 bạn bắt đầu tải bản chính thức của video "16 năm" lên kênh công ty cho Đại Nhạc Hội. 9 giờ, wifi sập cả tòa. {it} bị cả công ty truy đuổi qua ba tầng lầu._
_Màn hình: "Đang tải lên… 99%". Thanh tiến trình đứng ở đó như một lời hứa chưa nói hết._
* [📶 Xin {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua". Chậm cũng được.]
    hong_hot: Gét gô! Mà ông tải cái gì nặng dữ vậy? Mười phút tui hết 4G luôn đó!
    _4 giờ chiều, 100%. {hong_hot} hết sạch dung lượng, bạn nợ chị ấy một tháng cà phê._
    ~ qh("hong_hot", 5)
    ~ ed_video_tong_ket = true
* [⏳ Ngồi chờ. Mạng sẽ có lại.]
    _Bạn ngồi chờ. Cả ngày. Thanh tiến trình không nhúc nhích._
    ~ cang_thang(10)
* [✂️ Hủy tải lên. Mở lại timeline, sửa tiếp đoạn kết cho tới khi mạng có lại.]
    _Bạn hủy. Không có mạng, bạn dựng offline, yên bình như giữa đêm. Đoạn kết dài thêm mười giây: căn phòng 20 mét vuông, và một con cú nhỏ trên cánh cửa gỗ._
    ~ ed_thuc_dem()
    ~ ed_can(3)
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
# ngay:29 # gio:22:47 # noi:phong_dung_phim # bat_buoc
_22 giờ 47. Wifi có lại. Cả tòa nhà reo lên như đội nhà ghi bàn. Trên màn hình của bạn, video "16 năm" chạy tới 100%. "Đã tải lên."_
~ ed_video_tong_ket = true
{ ed_noi_voi_thai:
    _Điện thoại rung. {quan_ly_idol}: "{editor}. Anh coi đoạn đó rồi. Bốn lần." Rồi: "Anh không biết nói gì. Mai gặp anh nha. Không phải chuyện công việc."_
- else:
    { ed_video_len_fanpage:
        _{quan_ly_idol} nhắn vào group: "Cái đoạn hậu trường hôm 28 ai dựng vậy? Dựng cho {idol_het_thoi} một cái y vậy nha, gấp."_
        _Bạn đọc tin nhắn đó ở phòng dựng. Bạn không trả lời._
        ~ ed_can(-10)
        ~ cang_thang(20)
    - else:
        { ed_chep_usb:
            _Cái USB hình con cú nằm trên bàn, cạnh cốc RENDER. Nhỏ tới mức có thể mất. Nặng tới mức không cầm lên nổi._
        - else:
            _Mai họp đánh giá. Ngày kia Đại Nhạc Hội Siêu Nhân. Bạn ngồi trước ba màn hình, không biết nên mở cái nào._
        }
    }
}
* {ed_noi_voi_thai} [💌 "Dạ. Là em. Bốn năm."]
    ~ ed_can(15)
    _Đã xem. Rồi một biểu tượng con cú. Không chữ._
* [😴 Ngủ. Đêm nay phải ngủ.]
    ~ ed_ngu_du()
* [📺 Dựng nốt phần dựng trực tiếp cho đêm Đại Nhạc Hội. Thức trắng.]
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
_12 giờ 15. Sân thượng, giờ nghỉ trưa. Bạn lên trước, đứng cạnh cây phơi đồ. Cái USB hình con cú trong túi áo. Bạn bóp nó tới mức in hình con cú vào lòng bàn tay._
_{quan_ly_idol} lên sau, tay cầm ly cà phê, định gọi điện. Thấy bạn thì cất điện thoại. Lạ._
quan_ly_idol: {editor}. Lên đây trốn họp hả?
* {ed_can_dam >= 70 or ed_noi_voi_thai} [🔒 Đưa USB. "Anh coi cái này sau Đại Nhạc Hội nha. Khi xong hết rồi."]
    ~ ed_dua_usb_thai = true
    quan_ly_idol: *(cầm cái USB, xoay xoay)* Con cú. *(nhìn bạn)* Cái gì trong đây?
    editor: Dạ… một bản dựng. Của em. Lần này em ký tên.
    quan_ly_idol: *(bỏ USB vào túi áo ngực, chỗ không có điện thoại)* Ừ. Sau Đại Nhạc Hội. Anh hứa.
* [💌 Đưa USB, nói nhanh: "Anh coi liền đi." (Can đảm chưa đủ để chờ.)]
    _Anh ấy cắm vào laptop. Ba mươi giây. Rồi điện thoại reo: {sieu_nhan_hong} cần gấp. Anh ấy rút USB, đưa lại cho bạn: "Tối anh coi tiếp nha em." Tối đó không ai coi._
    ~ ed_can(-5)
* [😶 Không đưa. "Dạ em lên hóng gió."]
    quan_ly_idol: Ừ. Gió trên này thật hơn gió máy lạnh.
    _Cái USB vẫn trong túi. Đại Nhạc Hội Siêu Nhân ngày mai. Sau đó thì không biết._
    ~ ed_can(-3)
- -> END

// ------------------------------------------------------------
=== editor_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_14 giờ. Họp đánh giá cuối tháng. Đầu buổi là ghế Phó Giám đốc, {truong_phong} và {con_ong_chau_cha} ngồi hai đầu bàn. Rồi danh sách cắt giảm của {hr}, úp mặt. Rồi tới phần bạn sợ nhất: màn hình lớn chiếu báo cáo "Sản phẩm truyền thông tháng 10: MV, highlight gameshow, clip bà cụ, video 16 năm, livestream."_
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
- { qh_designer >= 20:
    _Cuối buổi, {designer} đứng dậy đòi ghi tên mình lên bản poster đầu tiên. Bạn đứng dậy theo. Không nói gì. Chỉ đứng cạnh. {designer} liếc bạn, gật đầu một cái._
    ~ qh("designer", 5)
}
-> END

// ------------------------------------------------------------
=== editor_3010_dem_trang_cuoi ===
# ngay:30 # gio:22:00 # noi:phong_dung_phim
_Đêm 30. Đêm trắng cuối cùng của tháng 10. Video "16 năm" đã lên. Còn gói hình cho phần dựng trực tiếp đêm mai: ba mươi đoạn ngắn, phải xong trước 6 giờ tối._
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
// Ngất lần thứ hai thì video "16 năm" không ai chạy được: cảnh chung chiếu ảnh của sếp thay vào
~ chung_video_16_nam = ed_so_lan_ngat < 2
_Sân khấu Đại Nhạc Hội Siêu Nhân. Bàn dựng của bạn nằm sau khán đài, dưới một cái lều đen. Ba màn hình, một bộ trộn hình, một ly cà phê._
_Cả công ty hóa trang. {giam_doc} là "Ông Kẹ Ngân Hàng". {thuc_tap_sinh} hóa trang thành… thực tập sinh. {sieu_nhan_hong} thì vẫn là {sieu_nhan_hong}._
{ ed_so_lan_ngat >= 2:
    _Bạn ngồi xuống ghế. Ba màn hình nhòe thành một. Bạn nói với không ai: "Dạ… đợi render xong…"_
    _Rồi cái lều đen nghiêng đi. Cơ thể bạn đã báo trước hai lần trong tháng. Lần này nó không báo nữa._
    _{chi_dai} là người tìm thấy bạn, gục trên bàn trộn hình, mười lăm phút trước giờ chiếu. Không ai khác biết mở file "16 năm" trên cái máy đó._
    ~ cang_thang(20)
    -> END
}
_{quan_ly_idol} đi ngang lều, dừng lại, thò đầu vào._
quan_ly_idol: Em hóa trang thành gì vậy?
editor: Dạ… thành con cú.
quan_ly_idol: *(nhìn cái mũ len và quầng thâm của bạn)* Ờ. Giống thiệt. *(cười)* Lát nữa… làm tốt nha.
{ ed_noi_voi_thai:
    quan_ly_idol: *(nhỏ giọng)* Cái đoạn hôm 28… anh vẫn chưa biết nói gì. Mà anh giữ nó rồi. Được hông?
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
{ ed_so_lan_ngat >= 2:
    _Bạn không ở bàn dựng. Bạn đang nằm trên chiếc giường gấp ở Phòng khám Đa Khoa Khỏe Re, tay cắm dây truyền._
    -> END
}
_19 giờ 50. Phim ngắn của {bien_kich} vừa chiếu xong. Video "16 năm" của bạn đang chạy. Còn ba phút nữa, màn hình lớn là của bạn, dựng trực tiếp._
_Màn hình lớn còn trống ba phút trước khi {sieu_nhan_hong} lên sân khấu. Bạn quyết định nó chiếu gì._
* {ed_cong_khai_kenh && not ed_ban_kenh} [🦉 Chiếu con cú đeo tai nghe, chỉ vào bộ đếm người theo dõi: "Cú ơi, bấm theo dõi đi!"]
    { not ed_keu_goi_follow:
        ~ ed_keu_goi_follow = true
    }
    ~ ed_sub_cong(20000)
    _Cả khán đài giơ điện thoại lên. Ở góc màn hình của bạn, bộ đếm sub kênh "Cú Đêm Cắt Ghép" nhảy theo, từng con cú một._
* [🎥 Chiếu cảnh khán giả. Từng khuôn mặt. Những người đã ở đây suốt tháng 10.]
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    _{dan_dau_tu} thấy mình trên màn hình lớn, giơ tay chào như vừa x10._
* [🎤 Chiếu bản dựng {idol_het_thoi} hát "Công Viên" mười năm trước và hôm nay.]
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
