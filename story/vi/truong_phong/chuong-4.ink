// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT
// CHƯƠNG 4: "HỌP TRÊN BÃI BIỂN" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== truong_phong_1710_hop_bai_bien ===
# ngay:17 # gio:06:00 # noi:bai_bien_vung_tau # bat_buoc
_Vũng Tàu, 6 giờ sáng. Mặt trời vừa nhú. Bạn dựng cái bảng trắng gấp gọn giữa bãi cát, cắm bút lông vào túi áo._
_Đêm qua bạn ở chung phòng với {chua_te_deadline}. {chua_te_deadline} lướt Tóp-tóp tới 3 giờ sáng, ánh màn hình nhấp nháy như đèn hải đăng._
truong_phong: Mọi người ơi! Họp nhanh 5 phút tổng kết team building nhé!
chua_te_deadline: *(lết ra, mắt nhắm)* Team building… còn chưa bắt đầu mà anh…
hong_hot: *(giơ điện thoại)* Livestream nè cả nhà! Trưởng phòng họp lúc 6 giờ sáng trên bãi biển! Ối dồi ôi!
* [📅 Họp đủ 7 mục, có cả mục "rút kinh nghiệm bữa sáng chưa ăn".]
    ~ tp_hop(2)
    ~ tp_ca_phong(-6)
    _Sóng vỗ. Gió thổi bay mất tờ biên bản. {thuc_tap_sinh} lội xuống nước nhặt lại, ướt tới thắt lưng._
    ~ follow(-3000)
* [🌅 Nhìn mặt trời lên, xóa bảng: "Thôi. Mọi người đi tắm biển đi."]
    ~ tp_ca_phong(10)
    ~ cang_thang(-15)
    _Mọi người reo lên. {bien_kich} nói "Hôm nay biển cười thay tui". Bạn ngồi xuống cát. Lâu lắm rồi bạn không ngồi xuống đâu mà không cầm bút._
    ~ follow(5000)
* [🧱 Vẽ sơ đồ "Vị trí từng người trong trò kéo co".]
    ~ tp_hop(1)
    _Sơ đồ có mũi tên chỉ "Duy: đứng cuối, vì nặng nhất". {thuc_tap_sinh} gật đầu rất tự hào._
    ~ qh("thuc_tap_sinh", 2)
- -> END

// ------------------------------------------------------------
=== truong_phong_1710_keo_co ===
# ngay:17 # gio:10:00 # noi:bai_bien_vung_tau # bat_buoc
_Kéo co: đội Sản xuất đấu "đội Marketing" (gồm {con_ong_chau_cha} và những ai chưa được chia đội, trong đó có {thuc_tap_sinh} tự xin sang)._
_Bạn đứng đầu dây bên này. {con_ong_chau_cha} đứng đầu dây bên kia, kính râm, dép tông._
giam_doc: Cố lên {truong_phong}! Cố lên {con_ong_chau_cha}! Anh ủng hộ… cả hai!
_Không ai biết sếp đứng về phía nào. Dây căng như cuộc đua ghế Phó._
* [💪 Kéo bằng tất cả sức lực và 6 năm uất ức.]
    { RANDOM(1, 10) <= 5:
        _Đội bạn thắng. {con_ong_chau_cha} ngã ngồi xuống cát, cười khì._
        con_ong_chau_cha: Ông kéo như kéo deadline vậy.
        ~ tp_ghe(3)
        ~ qh("con_ong_chau_cha", 2)
    - else:
        _Đội bạn thua. Bạn ngã sấp mặt xuống cát, kính lệch sang một bên. {hong_hot} quay cận mặt._
        ~ cang_thang(10)
        ~ follow(4000)
    }
* [🤝 Cố tình nới tay để hai đội hòa, rồi chạy sang đỡ {con_ong_chau_cha} dậy.]
    con_ong_chau_cha: Ủa… ông thả dây hả? Sao vậy?
    truong_phong: Kéo mãi cũng mỏi tay thôi.
    ~ qh("con_ong_chau_cha", 10)
    ~ tp_ghe(-1)
* [🗣️ Hét to: "Long! Kéo như cậu đi làm, tức là không kéo ấy!"]
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
    ~ qh("con_ong_chau_cha", -10)
    ~ qh("sieu_nhan_hong", -3)
    sieu_nhan_hong: Ê ê, hai đứa đừng cãi nhau mà… anh buồn…
    ~ follow(-15000)
    ~ tp_ghe(-5)
    _{sieu_nhan_hong} bỏ dở trò chơi, đi giúp một bác bán dạo đẩy xe kem lên dốc. Cả buổi không quay lại._
- -> END

// ------------------------------------------------------------
=== truong_phong_1710_nhau_toi ===
# ngay:17 # gio:20:00 # noi:nha_hang_vung_tau
_Bữa tối hải sản. {dan_dau_tu} bao cả đoàn vì Hồng Coin vừa tăng gấp mười. {giam_doc} đã uống tới ly thứ bảy._
giam_doc: Các em! Anh hứa… tháng sau… tăng lương cả công ty! Anh không ép… anh tự nguyện!
_Mười cái điện thoại giơ lên quay. {sales} cũng đứng dậy: "Em sẽ mời ca sĩ nổi tiếng nhất nước về hát Đêm Hồng!"_
* [📝 Mở sổ, ghi lại lời hứa của sếp "để làm biên bản".]
    ~ tp_hop(1)
    giam_doc: {truong_phong}! Em ghi gì đấy? Xóa đi! À mà thôi, ghi đi. Anh là người giữ lời.
    _Bạn có trong tay bằng chứng giấy trắng mực đen. Bạn không biết nó là kho báu hay quả mìn._
* [🍺 Chạm ly với {giam_doc}: "Em tin anh ạ."]
    ~ uong(10)
    ~ qh("giam_doc", 6)
    ~ tp_ghe(3)
    giam_doc: {truong_phong}! Em là người miền Bắc duy nhất ở đây hiểu anh!
* [😶 Đặt ly xuống, ra bờ biển đi dạo một mình.]
    ~ cang_thang(-8)
    _Ngoài bãi, đống lửa trại đã được nhóm. Có tiếng đàn ghi-ta ai đó đang lên dây._
- -> END

// ------------------------------------------------------------
=== truong_phong_1710_lua_trai ===
# ngay:17 # gio:22:30 # noi:bai_bien_vung_tau # bat_buoc
_Lửa trại. {sieu_nhan_hong} kể chuyện hồi nhỏ từng nhốt một đứa nhỏ trong nhà kho, giọng nhỏ dần, như đang xin lỗi ai đó không có mặt._
_{idol_het_thoi} ngủ gục lên vai {quan_ly_idol}. {editor} lặng lẽ đắp một tấm chăn lên cả hai. {hong_hot} đang livestream. Không ai để ý ai._
{ qh_con_ong_chau_cha >= 30:
    -> truong_phong_1710_long_hat
- else:
    _{con_ong_chau_cha} ôm cây đàn, gảy vài nốt, nhìn sang bạn, rồi đặt đàn xuống. Bài hát không bao giờ bắt đầu._
    _Bạn có cảm giác vừa bỏ lỡ một cái gì đó. Bạn không biết là cái gì._
    -> END
}

= truong_phong_1710_long_hat
_{con_ong_chau_cha} ôm cây đàn hát một bài không ai từng nghe. Câu điệp khúc có chữ "Hồng". Cả đống lửa im lặng._
_Bạn nhận ra: bài này hay hơn nhạc MV phòng bạn đã duyệt. Hay hơn nhiều._
con_ong_chau_cha: *(đặt cây đàn xuống)* Ủa ông {truong_phong} ngó gì dữ vậy? Bài tui hát chơi thôi mà. Đừng kể chú tui nha.
* [👏 "Bài này cậu viết à? Hay hơn nhạc MV phòng tớ đấy."]
    ~ qh("con_ong_chau_cha", 20)
    ~ tp_mo_phong_thu = true
    con_ong_chau_cha: *(đỏ mặt)* Ờ… tui viết. Tên tạm là "Hồng Là Thái Độ". Ở nhà tui còn 41 bản demo.
    truong_phong: Bốn mươi mốt?
    con_ong_chau_cha: Ông muốn nghe thì… bữa nào lên tầng 30 chơi.
    ~ phat_hien(bai_hat_long)
* [🪑 "Hay đấy. Mai tớ báo sếp là phó phòng Marketing đi team building chỉ để hát."]
    ~ tp_ghe(5)
    ~ qh("con_ong_chau_cha", -25)
    ~ tp_so_lan_cai_long = tp_so_lan_cai_long + 1
    _{con_ong_chau_cha} cất đàn vào hộp, kéo khóa. Từ đó về sau, {con_ong_chau_cha} không bao giờ hát trước mặt bạn nữa._
* [😶 Gật đầu, ngồi im nghe hết bài.]
    ~ qh("con_ong_chau_cha", 10)
    ~ cang_thang(-15)
    _Lần đầu tiên trong tháng, bạn không nghĩ tới lịch họp. Lửa nổ lách tách. Biển thở đều._
- -> END

// ------------------------------------------------------------
=== truong_phong_1810_sang_vung_tau ===
# ngay:18 # gio:08:00 # noi:khach_san_vung_tau
_Chủ nhật. Sáng ngày thứ hai ở Vũng Tàu. Cả đoàn mắt sưng như vừa xem phim buồn. Điện thoại {dan_dau_tu} hiện một con số đỏ: Hồng Coin về 0._
dan_dau_tu: *(cười méo)* Đây là đáy… đáy thật rồi…
{ tien < 500000:
    _Bạn nhớ ra 500.000đ của mình. Giờ nó là một biểu tượng tên lửa cắm đầu xuống đất._
}
* [🤝 Mua cho {dan_dau_tu} một ly cà phê.]
    ~ tien_cong(-25000)
    ~ qh("dan_dau_tu", 8)
    dan_dau_tu: Em tốt quá… Lần sau có kèo anh rủ em đầu tiên.
    _Bạn quyết định đây là lần cuối bạn tốt với {dan_dau_tu} vào buổi sáng._
* [📅 "Mình họp nhanh rút kinh nghiệm chuyến đi trước khi lên xe nhé."]
    ~ tp_hop(1)
    ~ tp_ca_phong(-5)
    _Không ai rút được kinh nghiệm gì ngoài việc không nên đi team building với bạn._
* [😴 Ngủ thêm 30 phút.]
    ~ nghi(20)
- -> END

// ------------------------------------------------------------
=== truong_phong_1810_xe_ve ===
# ngay:18 # gio:15:00 # noi:xe_khach
_Xe về thành phố. Ai cũng giận ai: người giận vì phòng, người giận vì clip say, người giận vì coin._
_Ghế bên cạnh bạn là {con_ong_chau_cha}. Điện thoại {con_ong_chau_cha} rung. Một tin nhắn từ môi giới nhà đất, kèm ảnh căn penthouse tầng 30._
_Mặt {con_ong_chau_cha} trắng bệch như tờ giấy A4 chưa in._
* [💬 "Có chuyện gì thế?"]
    con_ong_chau_cha: *(cất điện thoại)* Hông có gì. Chắc nhầm.
    _Một lúc sau, {con_ong_chau_cha} nói nhỏ, không nhìn bạn: "Nhà tui… hình như đang bị rao bán. Mà tui hông biết."_
    ~ qh("con_ong_chau_cha", 8)
    { tp_mo_phong_thu:
        truong_phong: Thế phòng thu của cậu…
        con_ong_chau_cha: Ừ. Phòng thu cũng nằm trong đó.
    }
* [🐍 Lén nhìn màn hình, ghi nhớ.]
    _Penthouse Sky Ảo. Giá đỏ chót. Cái ô của cháu sếp đang bị thủng một lỗ._
    ~ tp_ghe(2)
    ~ cang_thang(3)
* [😶 Đeo tai nghe, quay ra cửa sổ.]
    _Ngoài kia, cánh đồng lướt qua. Bên cạnh, có người đang mất nhà. Hai người ngồi cạnh nhau suốt 2 tiếng mà không ai biết ai đang nghĩ gì._
- -> END

// ------------------------------------------------------------
=== truong_phong_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
~ tp_lich_co_dinh()
_Họp giao ban sau team building. Không ai nhìn mặt ai. {chua_te_deadline} nhìn trần nhà. {designer} nhìn {bien_kich}. {bien_kich} nhìn cuốn sổ của mình như sợ ai đọc._
~ tp_hop(1)
_Bạn đếm được 7 lần thở dài trong 10 phút đầu._
* [🧱 Vẽ lên bảng: "Cảm xúc sau team building" với thang điểm 1 – 10.]
    _Mọi người lần lượt chấm. Điểm trung bình: 3. {thuc_tap_sinh} chấm 10 vì "được ngủ chung phòng với anh Long"._
    ~ qh("thuc_tap_sinh", 3)
    ~ tp_hop(1)
* [😇 "Anh xin lỗi vì cuộc họp 6 giờ sáng ở bãi biển."]
    { truong_phong_1710_hop_bai_bien > 0:
        _Cả phòng quay sang nhìn bạn. Không ai từng nghe trưởng phòng xin lỗi._
        chua_te_deadline: Ủa… anh {truong_phong} xin lỗi thiệt hả?
        ~ tp_ca_phong(8)
    - else:
        chua_te_deadline: Xin lỗi vụ gì anh? À thôi, chill.
        ~ tp_ca_phong(2)
    }
* [📋 "Mai là 20/10. Mỗi người nhận một việc cho lễ sinh nhật công ty. Hết họp."]
    ~ tp_ca_phong(4)
    ~ uy_tin = uy_tin + 3
    _Cuộc họp ngắn tới mức {editor} chưa kịp ngủ gật. Đây là một điều đáng ghi vào lịch sử._
- -> END

// ------------------------------------------------------------
=== truong_phong_1910_mua_qua ===
# ngay:19 # gio:18:00 # noi:sieu_thi_mini
_Tối. Siêu thị mini. Mai là 20/10, bạn phải có quà cho {bien_kich} và {designer}. Trong giỏ đang có… hai quyển sổ kẻ ô._
* [📓 Giữ nguyên: sổ kẻ ô là món quà thiết thực nhất.]
    ~ tp_qua_20_10 = "so_ke_o"
    ~ tien_cong(-60000)
    _Bạn tưởng tượng hai người mở quà. Bạn tưởng tượng họ cười. Bạn không chắc đó là kiểu cười nào._
* [📞 Nhắn hỏi {hong_hot}: "Con gái thích quà gì?"]
    hong_hot: Ủa hỏi tui chi vậy? Tặng ai? Bà {bien_kich} hả? Bà {designer} hả? Hay ai???
    _Năm phút sau, group "Hội ăn trưa" có tin: "Anh {truong_phong} đang đi mua quà cho ai đó, nghi lắm nha!"_
    ~ tp_qua_20_10 = "hoi_ngan"
    ~ qh("hong_hot", 3)
    ~ tien_cong(-300000)
* [🎨 Đổi sang một bộ bút màu cho {designer} và một cuốn sổ bìa da để viết cho {bien_kich}.]
    ~ tp_qua_20_10 = "chu_dao"
    ~ tien_cong(-400000)
    _Bạn đứng trước kệ bút màu 20 phút. Đây là cuộc họp lâu nhất bạn từng họp với chính mình mà không thấy phí._
- -> END

// ------------------------------------------------------------
=== truong_phong_2010_logo_16_nam ===
# ngay:20 # gio:09:00 # noi:phong_giam_doc # bat_buoc
~ tp_lich_co_dinh()
_Sinh nhật công ty 16 tuổi. {giam_doc} gọi bạn và {designer} lên phòng._
giam_doc: Logo kỷ niệm 16 năm! Phải wow! Mà phải giữ được cái hồn 2010!
_{designer} trình bản thứ 38. {giam_doc} nhìn rất lâu, rồi mở ngăn kéo lấy ra… logo gốc năm 2010._
giam_doc: Cái này! Cái này mới đúng. Em thấy chưa, sửa nhiều là đẹp liền!
designer: *(thì thầm)* Sửa nhẹ thôi là sửa về bản đầu…
* [🙏 "Anh ạ, bản 38 của {designer} rất đẹp. Mình dùng logo gốc cho video, bản 38 cho sân khấu được không?"]
    giam_doc: Ừ… cũng được. Anh không ép, tùy em.
    ~ qh("designer", 15)
    ~ tp_ghi_cong()
    designer: *(ra khỏi phòng, nói nhỏ)* Cảm ơn anh {truong_phong}. Lần đầu có người cãi giùm em.
* [🙇 "Anh chọn chuẩn quá ạ."]
    ~ qh("giam_doc", 3)
    ~ qh("designer", -8)
    ~ tp_ghe(2)
* [📅 "Mình họp nhanh với cả phòng để chốt lại phương án nhé anh."]
    ~ tp_hop(1)
    _Cuộc họp chốt lại đúng logo gốc 2010. Mất thêm 1 tiếng để đi tới chỗ đã ở từ đầu._
- giam_doc: À, video "16 năm" thì {editor} làm rồi đúng không? Anh cần đoạn quảng cáo tháng 6 cho vào, cái hợp đồng 800 triệu ấy.
_Bạn nhớ lại ngọn nến, và câu {chua_te_deadline} nói về file gốc tháng 6._
* [🤐 "Dạ, em sẽ hỏi {chua_te_deadline} ạ."]
    { tp_vu_giu_bi_mat:
        _Bạn hỏi. {chua_te_deadline} nhìn bạn, bạn nhìn {chua_te_deadline}. Cả hai cùng nói: "Thôi, dùng cảnh khác."_
    - else:
        chua_te_deadline: Dạ… file đó… để em tìm. Còn sớm mà.
        ~ cang_thang(3)
    }
* [🎞️ "Mình dùng cảnh năm 2015 thay vào, cảnh 'Công Viên' ạ. Khán giả nhớ cái đó hơn."]
    giam_doc: Ừ… cũng được. Hồi đó anh còn trẻ.
    ~ tp_ghe(2)
    ~ qh("idol_het_thoi", 5)
- -> END

// ------------------------------------------------------------
=== truong_phong_2010_tang_qua ===
# ngay:20 # gio:11:00 # noi:phong_san_xuat
_Ngày Phụ nữ Việt Nam. Bạn mang quà tới bàn {bien_kich} và {designer}._
{ tp_qua_20_10:
- "so_ke_o":
    _Hai quyển sổ kẻ ô. {designer} mở ra, lật lật, không thấy gì ngoài ô kẻ._
    designer: Ủa… sổ… để em ghi feedback hả anh?
    bien_kich: Một món quà… có hình dạng của một cuộc họp.
    _Cả phòng cười. Bạn cười theo, hơi muộn nửa giây._
    ~ tp_ca_phong(2)
- "hoi_ngan":
    _Cả công ty đã biết bạn đi mua quà. Khi bạn đặt quà xuống, 6 người đứng sau vách ngăn nhìn._
    hong_hot: *(thì thầm vào điện thoại)* Phát sóng trực tiếp nha cả nhà…
    ~ qh("bien_kich", 5)
    ~ qh("designer", 5)
- "chu_dao":
    designer: Bút màu… loại em thích nữa nè. Sao anh biết?
    truong_phong: Anh đứng ở kệ 20 phút.
    bien_kich: *(vuốt bìa da)* Cảm ơn anh. Em sẽ viết… một cái gì đó thật.
    ~ qh("bien_kich", 12)
    ~ qh("designer", 12)
- else:
    -> quen_qua
}
-> END

= quen_qua
_Bạn quên mua quà. Bạn đứng giữa phòng với hai bàn tay trống._
* [🍰 Chạy xuống căn tin mua hai hộp bánh.]
    ~ tien_cong(-80000)
    ~ qh("bien_kich", 2)
    ~ qh("designer", 2)
* [📅 "Anh xin phép họp xong rồi tặng sau nhé."]
    ~ tp_hop(1)
    ~ qh("bien_kich", -6)
    ~ qh("designer", -6)
- -> END

// ------------------------------------------------------------
=== truong_phong_2010_thu_g ===
# ngay:20 # gio:15:00 # noi:sanh_tang_tret
_Chiều. Lễ sinh nhật công ty ở sảnh tầng trệt. Bác {bac_bao_ve} đứng ở góc, tay cầm một lá thư tay và một phong bì dán kín ghi "Chỉ mở khi công ty sắp sập"._
_Bác nhìn {giam_doc}, rồi nhìn mọi người. Bác chưa quyết có đọc lá thư trước công ty hay không._
* [🤝 Đi tới đứng cạnh bác: "Bác đọc hay không, cháu đều đứng đây ạ."]
    bac_bao_ve: *(gật nhẹ)* Ừ. Thế là đủ.
    ~ qh("bac_bao_ve", 10)
* [📅 Cầm micro: "Mời bác {bac_bao_ve} phát biểu vài lời ạ!"]
    bac_bao_ve: …Bác không quen nói. Thôi, mọi người ăn bánh đi.
    _Bác cất lá thư vào túi áo. Phong bì dán kín vẫn dán kín._
    ~ qh("bac_bao_ve", -5)
* [😶 Đứng xa, nhìn.]
    _Bạn thấy {giam_doc} cũng đang nhìn lá thư. Lần đầu bạn thấy sếp giống một người đang chờ điểm thi._
- -> END

// ------------------------------------------------------------
=== truong_phong_2010_karaoke ===
# ngay:20 # gio:21:30 # noi:karaoke_hat_cho_nhau_nghe
_Sau Quán Ốc Đêm, cả công ty kéo sang karaoke Hát Cho Nhau Nghe. {giam_doc} cầm micro, mặt đỏ như logo… à không, logo có 7 màu._
giam_doc: Anh hứa! Tháng sau tăng lương 20%! Cả công ty!
_Cả phòng hét lên. Bạn ngồi cạnh {con_ong_chau_cha}. {con_ong_chau_cha} không hát, chỉ lặng lẽ nhìn chú mình._
* {tp_mo_phong_thu} [🔒 "Mai cậu cho tớ nghe 41 bản demo nhé. Tớ mang theo bảng trắng."]
    con_ong_chau_cha: *(bật cười)* Ông mang bảng trắng tới phòng thu hả?
    truong_phong: Để ghi lại những đoạn hay.
    con_ong_chau_cha: …Ờ. Tối thứ Năm. Tầng 30.
    ~ qh("con_ong_chau_cha", 10)
* [🎤 Giành micro, hát một bài nhạc đỏ quê nhà.]
    ~ qh("giam_doc", 6)
    ~ qh("bac_bao_ve", 3)
    _{giam_doc} hát theo, khóc một chút. Thành Phố Ước Mơ không có mùa thu, nhưng phòng karaoke số 5 có._
* [💬 Hỏi {con_ong_chau_cha}: "Chú cậu… có ổn không?"]
    con_ong_chau_cha: Tui cũng đang muốn hỏi câu đó. Mà hỏi ai giờ.
    ~ qh("con_ong_chau_cha", 6)
    _Hai người cùng nhìn {giam_doc} đang hát. Hai đối thủ, cùng một nỗi lo._
- -> END

// ------------------------------------------------------------
=== truong_phong_1910_hoc_dem ===
# ngay:19 # gio:22:30 # noi:phong_dung_phim
_22 giờ 30. Sau một ngày không ai nhìn mặt ai, phòng dựng là chỗ duy nhất không có tiếng thở dài._
{ tp_linh_nghi_om:
    _Bàn của {editor} trống. Từ hôm gameshow, {editor} vẫn còn mệt, về sớm. Trên bàn có tờ giấy: "Máy phụ em cài sẵn bài 'Chỉnh màu da'. Đừng tắt máy ngang."_
    ~ qh("editor", 2)
}
* [🌙 Học một bài.]
    -> truong_phong_mg_hoc_lom
* [🎞️ Tự dựng lại clip kéo co ở Vũng Tàu cho vui.]
    { tp_tay_nghe >= 25:
        _Clip 40 giây. {con_ong_chau_cha} ngã sấp, bạn ngã ngửa, {thuc_tap_sinh} đứng cười. Bạn chèn nhạc. Không ai giao việc này. Bạn làm vì muốn làm._
        ~ tp_tn(8)
        ~ follow(4000)
        ~ tp_so_video_toptop = tp_so_video_toptop + 1
    - else:
        _Bạn kéo nhầm clip. Cảnh kéo co thành cảnh bãi biển trống. Ba mươi giây sóng vỗ. Nhìn cũng… thư giãn._
        ~ tp_tn(3)
    }
* [🚪 Về nhà ngủ.]
    ~ nghi(15)
- -> END
