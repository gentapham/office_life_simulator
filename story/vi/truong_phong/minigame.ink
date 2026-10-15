// ============================================================
// TRƯỞNG PHÒNG HỌP: NHẬT · thoại minigame
// Mỗi minigame: cảnh mở đầu, cảnh thắng, cảnh thua.
// ============================================================

// ============ 📅 XẾP LỊCH HỌP ============
=== truong_phong_mg_xep_lich ===
# noi:phong_hop_sang_tao # dieu_kien:minigame xep lich hop
_Lịch tuần của 5 nhân viên và phòng họp "Sáng Tạo" hiện ra như một bàn xếp gạch. Khối họp rơi từ trên xuống._
_Luật: không đè giờ nghỉ trưa. Không đè ca đêm của {editor}. Không đè buổi {chua_te_deadline} đi "nghiên cứu xu hướng" (lướt Tóp-tóp)._
chua_te_deadline: Anh Nhật, khung 14:00 – 16:00 thứ Tư là thời gian nghiên cứu của tui nha. Thiêng lắm đó.
editor: *(ngáp)* Trước 13 giờ em là xác sống… đừng xếp gì hết…
-> END

=== truong_phong_mg_xep_lich_thang ===
# noi:phong_hop_sang_tao # dieu_kien:thang minigame xep lich hop
_Lịch gọn gàng. Các khối họp khớp nhau như gạch lát vỉa hè mới._
~ tien_cong(100000)
~ nhan(ca_phe)
~ uong(10)
~ tp_hop(1)
~ uy_tin = uy_tin + 2
designer: Ủa… tuần này em có nguyên buổi chiều thứ Năm trống. Anh xếp lộn hả?
truong_phong: Anh xếp cố ý.
designer: *(nhìn bạn như nhìn người lạ)* Cảm ơn anh.
~ qh("designer", 3)
-> END

=== truong_phong_mg_xep_lich_hoan_hao ===
# noi:phong_hop_sang_tao # dieu_kien:lich hoan hao 0 xung dot
_Không một xung đột. Không một khối nào đè lên giờ ăn trưa. Đây là tác phẩm nghệ thuật._
~ tien_cong(100000)
~ nhan(ca_phe)
~ uong(10)
~ tp_co_banh_bong_lan = true
~ tp_ca_phong(3)
~ tp_hop(1)
thuc_tap_sinh: Dạ… có hộp bánh bông lan trên bàn họp, của ai vậy ạ?
truong_phong: Của cả phòng. Thưởng lịch hoàn hảo.
chua_te_deadline: Lần đầu tui thấy cái lịch họp mà muốn ăn mừng.
-> END

=== truong_phong_mg_xep_lich_thua ===
# noi:phong_hop_sang_tao # dieu_kien:thua minigame xep lich hop
_Khối họp đè lên giờ nghỉ trưa. Một khối khác đè lên ca đêm của {editor}. Khối thứ ba đè lên chính khối thứ hai._
~ tp_hop(2)
~ cang_thang(8)
~ tp_ca_phong(-2)
editor: Anh Nhật… họp lúc 3 giờ sáng là họp với ai vậy anh?
chua_te_deadline: Thứ Tư 14:00 có họp. Thời gian nghiên cứu của tui chết rồi. Ok mom.
-> END

// ============ 🎬 DUYỆT BẢN DỰNG ============
=== truong_phong_mg_duyet_ban_dung ===
# noi:phong_dung_phim # dieu_kien:minigame duyet ban dung
editor: *(ngáp)* Bản dựng xong rồi anh. Có gì anh góp ý… em sửa… rồi render.
_Clip 45 giây. Trong đó có đúng một lỗi thật. Trong danh sách góp ý, dòng đầu tiên là "Thêm cảm xúc" như mọi khi._
{ tp_tay_nghe >= 30:
    _Nhờ mấy đêm học lén, danh sách góp ý của bạn có thêm vài câu cụ thể: "khung hình đen ở giây 12", "nhạc lệch nửa nhịp", "logo thiếu màu hồng"._
}
-> END

=== truong_phong_mg_duyet_ban_dung_thang ===
# noi:phong_dung_phim # dieu_kien:chi dung loi
_Bạn chỉ đúng chỗ lỗi. {editor} mở mắt to hơn bình thường một chút._
editor: …Đúng rồi anh. Khung đó bị đen thật. Sao anh thấy?
truong_phong: Anh… nhìn kỹ.
~ tien_cong(200000)
~ uy_tin = uy_tin + 5
~ qh("editor", 6)
~ tp_tn(2)
~ tp_lo(-3)
editor: Sửa 2 phút là xong. Render xong là xong.
-> END

=== truong_phong_mg_duyet_ban_dung_thua ===
# noi:phong_dung_phim # dieu_kien:chi sai loi
truong_phong: Em thêm cảm xúc vào đoạn này nhé.
editor: *(im lặng 3 giây)* …Cảm xúc là màu gì anh?
_{editor} ngáp, quay về màn hình, dựng lại từ đầu. Đèn phòng dựng sáng tới 4 giờ sáng._
~ tp_lo(5)
~ qh("editor", -5)
~ cang_thang(3)
-> END

// ============ 🎥 HÔ "CẮT!" ============
=== truong_phong_mg_ho_cat ===
# noi:studio_tang_2 # dieu_kien:minigame ho cat
_Trường quay. Bạn ngồi ghế đạo diễn, tay cầm loa. Thanh rủi ro nhấp nháy: {sieu_nhan_hong} có thể bỏ đi giúp người bất cứ lúc nào (điều khoản 3). {cho} có thể chạy vào khung hình._
sieu_nhan_hong: Sẵn sàng rồi em! Vì công lý và lượt view!
_Ngoài cửa, có tiếng "gâu" rất khẽ._
-> END

=== truong_phong_mg_ho_cat_thang ===
# noi:studio_tang_2 # dieu_kien:canh dat
truong_phong: Cắt! Đạt!
_Cả đoàn vỗ tay. Đoàn phim phát cơm hộp. {sieu_nhan_hong} tháo găng, ăn ngon lành._
~ tien_cong(150000)
~ an(35)
~ nhan(nuoc_suoi)
~ uong(15)
~ follow(8000)
~ uy_tin = uy_tin + 3
sieu_nhan_hong: Đạo diễn hô "Cắt" nghe đã ghê! Lần sau hô to hơn nữa nha em!
-> END

=== truong_phong_mg_ho_cat_nhanh ===
# noi:studio_tang_2 # dieu_kien:quay xong trong 3 lan
truong_phong: Cắt! Đạt! Lần thứ ba!
_Ba lần là xong. Không ai phải ở lại. {thuc_tap_sinh} vừa cầm tấm hắt sáng vừa nhảy lên._
~ tien_cong(150000)
~ an(35)
~ nhan(nuoc_suoi)
~ uong(15)
~ tp_ghe(3)
~ follow(10000)
~ tp_ca_phong(2)
thuc_tap_sinh: Dạ anh Nhật hô "Cắt" như đạo diễn phim điện ảnh ạ!
-> END

=== truong_phong_mg_ho_cat_thua ===
# noi:studio_tang_2 # dieu_kien:canh hong
_Lần quay thứ 9. {cho} lao vào khung hình, ngoạm vạt áo choàng hồng. {sieu_nhan_hong} chạy vòng quanh studio. Máy quay vẫn chạy._
sieu_nhan_hong: Cứu! Cứu anh với! Thân chưa mà giỡn vậy Tuất!
cho: GRỪ… GÂU!
~ cang_thang(10)
~ nghi(-10)
~ follow(2000)
_Cảnh hỏng. Nhưng {hong_hot} đã kịp quay bằng điện thoại. Có lẽ không hỏng hoàn toàn._
-> END

// ============ 📝 BIÊN BẢN HỌP ============
=== truong_phong_mg_bien_ban ===
# noi:phong_hop_sang_tao # dieu_kien:minigame bien ban hop
_Cuộc họp đang diễn ra. Chữ chạy trên màn hình như mưa. Bạn phải gõ biên bản kịp nhịp, và bấm vào ai đang ngủ gật để "đánh thức" bằng một câu hỏi._
~ tp_hop(1)
_Ở góc bàn, đầu {editor} bắt đầu gật gù như con lật đật._
-> END

=== truong_phong_mg_bien_ban_thang ===
# noi:phong_hop_sang_tao # dieu_kien:bien ban du y
_Biên bản đủ ý, đúng chính tả, có cả mục "việc cần làm" và tên người làm._
~ uy_tin = uy_tin + 5
~ tp_co_banh_quy = true
~ an(10)
_Trong ngăn kéo phòng họp, bạn tìm thấy một gói bánh quy. Không biết ai để. Hôm nay nó là của bạn._
bien_kich: Biên bản của anh đọc như một bài thơ hành chính. Em thích.
~ qh("bien_kich", 2)
-> END

=== truong_phong_mg_bien_ban_bat_ngu ===
# noi:phong_hop_sang_tao # dieu_kien:bat duoc 3 nguoi ngu gat
truong_phong: {editor}, ý em thế nào? {chua_te_deadline}, cậu nghĩ sao? Duy, em ghi lại chưa?
_Ba người giật mình tỉnh dậy cùng lúc. Cả ba cùng nói "Dạ em đồng ý ạ"._
~ uy_tin = uy_tin + 5
~ qh("editor", -3)
~ qh("chua_te_deadline", -3)
~ qh("thuc_tap_sinh", -3)
_Uy quyền của bạn tăng. Lượng người muốn ngồi xa bạn trong cuộc họp sau cũng tăng._
-> END

=== truong_phong_mg_bien_ban_thua ===
# noi:phong_hop_sang_tao # dieu_kien:bien ban thieu y
_Biên bản thiếu một nửa. Dòng cuối ghi: "Kết luận: mình take note lại, họp sau."_
~ tp_so_lan_take_note = tp_so_lan_take_note + 1
~ tp_hop(1)
~ cang_thang(5)
chua_te_deadline: Vậy… tụi mình vừa họp về cái gì vậy anh?
-> END

// ============ 🌙 HỌC LÉN DỰNG PHIM ============
=== truong_phong_mg_hoc_lom ===
# gio:22:00 # noi:phong_dung_phim # dieu_kien:minigame hoc len dung phim
_Sau 22 giờ. Máy dựng phụ. Video hướng dẫn kênh "Cú Đêm Cắt Ghép", bài số {tp_so_bai_hoc_dem + 1}. Cắt, ghép, chỉnh màu. Sai một bước là phải xem lại từ đầu._
{ tp_biet_linh_la_cu_dem:
    _Giờ bạn biết giọng ngái ngủ trong video là ai. Nghe "render xong là xong" mà bạn bật cười một mình._
}
_Dưới sân, đèn chòi bảo vệ vẫn sáng. Bác {bac_bao_ve} thấy hết, như mọi đêm._
-> END

=== truong_phong_mg_hoc_lom_thang ===
# noi:phong_dung_phim # dieu_kien:hoan thanh bai hoc
~ tp_so_bai_hoc_dem = tp_so_bai_hoc_dem + 1
~ tp_tn(8)
~ nghi(-30)
~ an(15)
~ uong(15)
~ tien_cong(35000)
_Xong bài {tp_so_bai_hoc_dem}. Mì ly và cà phê lon từ cửa hàng tiện lợi 24/7 được công ty hoàn tiền 35.000đ. Mắt bạn đỏ như đèn ghi hình._
_Lúc tính tiền, anh thu ngân ca đêm Khoa ngáp: "Có cần hâm nóng hông anh? Tuần này anh tới lần thứ mấy rồi đó."_
{ tp_so_bai_hoc_dem >= 10 && not tp_huy_hieu_tu_render:
    ~ tp_huy_hieu_tu_render = true
    _Bài thứ 10. Bạn tự dựng được một clip 30 giây, có nhạc, có chữ, có màu hồng ra hồng. Huy hiệu "Tự Tay Render"._
    ~ tp_lo(-10)
}
-> END

=== truong_phong_mg_hoc_lom_thua ===
# noi:phong_dung_phim # dieu_kien:sai buoc phai xem lai
_Bạn bấm nhầm. Cả timeline bay mất. Video hướng dẫn quay về phút 0:00. "Chào mấy bạn, hôm nay mình học cắt ghép…"_
~ tp_tn(2)
~ nghi(-30)
~ cang_thang(8)
_Lần thứ ba nghe câu chào đó. Bạn thuộc lòng. Nhưng tay vẫn chưa thuộc._
-> END

// ============ ⚽ GIAO HỮU PHÒNG BAN ============
=== truong_phong_mg_giao_huu ===
# gio:16:00 # noi:san_bong_mini # dieu_kien:minigame giao huu phong ban
_Chiều thứ Sáu, sân bóng mini Ven Đô. Đội Sản xuất đấu đội Marketing của {con_ong_chau_cha} (gồm {con_ong_chau_cha} và bất kỳ ai {con_ong_chau_cha} rủ được)._
_Bạn dựng bảng trắng gấp gọn bên đường biên, vẽ sơ đồ 4-4-2. Đội bạn chỉ có 5 người._
con_ong_chau_cha: Ông vẽ 4-4-2 cho đội 5 người hả? Chill đi.
-> END

=== truong_phong_mg_giao_huu_thang ===
# noi:san_bong_mini # dieu_kien:doi san xuat thang
_Còi mãn cuộc. Đội Sản xuất thắng. {thuc_tap_sinh} ghi bàn quyết định bằng… bụng._
~ tien_cong(300000)
~ nhan(nuoc_tang_luc)
~ uong(15)
~ tp_ca_phong(4)
~ cang_thang(-10)
con_ong_chau_cha: *(nằm dài trên cỏ)* Được. Lần này tui thua. Mà vui.
~ qh("con_ong_chau_cha", 3)
_Một thùng nước tăng lực cho cả đội. Bạn mở một lon, giơ lên. Lần đầu trong tháng bạn giơ cái gì đó lên mà không phải bút lông._
-> END

=== truong_phong_mg_giao_huu_thua ===
# noi:san_bong_mini # dieu_kien:thua doi marketing
_Còi mãn cuộc. Đội Marketing thắng. {con_ong_chau_cha} ăn mừng bằng cách… check-in story._
~ cang_thang(15)
~ nghi(-15)
con_ong_chau_cha: Hông sao ông Nhật, bóng tròn mà.
_Bạn cuộn sơ đồ 4-4-2 lại. Có lẽ bóng tròn thật. Có lẽ đội 5 người thì không nên đá 4-4-2._
-> END
