// ============================================================
// THỰC TẬP SINH · MINIGAME
// Mỗi minigame: _mo_dau (thoại trước khi chơi), _thanh_cong, _that_bai.
// Game chạy minigame sau knot _mo_dau, rồi mở knot kết quả tương ứng.
// ============================================================

// ============ 🖨️ ĐẠI CHIẾN MÁY IN ============
=== thuc_tap_sinh_mg_may_in_mo_dau ===
# noi:tang_1 # ngau_nhien
_Máy in tầng 1 kêu "cạch… cạch… rẹt". Đèn đỏ nhấp nháy. Giấy kẹt. Lần này là kiểu kẹt thứ mấy trong 5 kiểu, chỉ có trời biết._
_Sau lưng bạn, 3 người xếp hàng: {designer} cần in poster mẫu, {ke_toan} cần in phiếu chi, {truong_phong} cần in agenda cho cuộc họp về… cuộc họp._
designer: Nhanh giùm nha em, chị sửa lần thứ 21 rồi.
{ duy_co_the_may_in:
    _Trong túi bạn có tấm thẻ "Bạn Của Máy In". Cái máy hình như biết. Nó kêu nhỏ lại một chút._
}
-> END

=== thuc_tap_sinh_mg_may_in_thanh_cong ===
# noi:tang_1
_Mở nắp B. Rút giấy theo chiều ngược kim đồng hồ. Đá nhẹ vào góc trái phía sau, cái chỗ bí mật mà {it} từng chỉ, đúng 3 phân dưới logo._
_Máy in kêu "tạch", rồi chạy êm như chưa từng có chuyện gì._
designer: *(nhận poster còn ấm)* Ơ… nhanh vậy. Cảm ơn em. Nè, ổ bánh mì chị mua dư.
~ tien_cong(30000)
~ nhan(banh_mi)
~ duy_kn(1)
~ qh("designer", 3)
{ not duy_co_the_may_in:
    _Cả ngày hôm nay máy không kẹt thêm lần nào. {it} đi ngang, đặt lên bàn bạn một tấm thẻ nhựa tự in: "Bạn Của Máy In". Rồi đi tiếp, không nói gì._
    ~ duy_co_the_may_in = true
}
-> END

=== thuc_tap_sinh_mg_may_in_that_bai ===
# noi:tang_1
_Bạn đá sai chỗ. Máy in nhả ra 40 tờ giấy trắng, rồi một tờ in đúng một chữ "Agenda", rồi tắt._
truong_phong: Cậu {thuc_tap_sinh}… Tớ sẽ họp về chuyện máy in.
ke_toan: Phiếu chi của chị đâu em? Không có phiếu chi là không có tiền đó.
~ duy_lua_doi(-2)
~ cang_thang(10)
~ duy_day_viec(1)
_{it} tới, nhìn cái máy, đá một phát đúng chỗ. Máy chạy. {it} đi về. Không nói gì. Đó là cách {it} dạy._
-> END

// ============ ☕ BARISTA BẤT ĐẮC DĨ ============
=== thuc_tap_sinh_mg_barista_mo_dau ===
# noi:pantry # ngau_nhien
chua_te_deadline: Anh {thuc_tap_sinh} ơi, em nhờ xíu. Pha giùm cà phê cho cả phòng nha. Máy lại hết hạt rồi.
~ duy_day_viec(1)
~ duy_da()
_Order cần nhớ: {editor} đen đá không đường. {designer} bạc xỉu ít đá. {truong_phong} "như mọi khi" (không ai biết "như mọi khi" là gì). {chua_te_deadline} cà phê sữa đá, đậm, nhiều đá._
_Máy pha báo hết hạt. Quán đầu đường cách 200 mét. Đồng hồ: 9 giờ 55. Họp lúc 10 giờ._
-> END

=== thuc_tap_sinh_mg_barista_thanh_cong ===
# noi:pantry
_9 giờ 59. Mỗi người một ly, đúng order, đúng bàn._
_{truong_phong} nhấp một ngụm ly "như mọi khi". Khựng lại. Nhìn bạn._
truong_phong: … Đúng là như mọi khi. Sao cậu biết?
thuc_tap_sinh: Dạ em để ý mấy cái ly anh bỏ thùng rác ạ.
~ tien_cong(50000)
~ nhan(ca_phe)
~ duy_kn(2)
~ qh("editor", 3)
~ qh("designer", 3)
~ qh("truong_phong", 3)
~ qh("chua_te_deadline", 3)
~ qh("bien_kich", 3)
-> END

=== thuc_tap_sinh_mg_barista_that_bai ===
# noi:pantry
_{editor} nhận ly bạc xỉu. {designer} nhận ly đen không đường. Hai người nhìn nhau, rồi đổi ly. Còn {truong_phong} nhận một ly trà đá, vì bạn đoán "như mọi khi" là trà đá._
truong_phong: Đây không phải như mọi khi.
~ tien_cong(20000)
~ duy_lua_doi(-2)
~ qh("truong_phong", -2)
-> END

// ============ 🪑 XẾP GHẾ PHÒNG HỌP ============
=== thuc_tap_sinh_mg_xep_ghe_mo_dau ===
# noi:phong_hop_sang_tao
_Phòng họp "Sáng Tạo". 14 cái ghế, 1 cái bàn dài, 4 luật bất thành văn:_
_{chi_dai} không ngồi cạnh {thanh_ninh}. {truong_phong} không ngồi cạnh {con_ong_chau_cha}. {cho} không ở cùng phòng với Siêu Nhân Hồng. {chua_te_deadline} phải ngồi chỗ {truong_phong} nhìn thấy._
_Thêm một luật mới hôm nay: {sales} không ngồi gần {ke_toan}, vì tuần này {sales} xin tạm ứng 3 lần._
-> END

=== thuc_tap_sinh_mg_xep_ghe_thanh_cong ===
# noi:phong_hop_sang_tao
_Cuộc họp diễn ra 2 tiếng mà không ai cãi nhau. Kỷ lục. {truong_phong} không hiểu vì sao. Chỉ có bạn hiểu._
_Họp xong, mọi người về. Trên bàn còn 3 cái bánh bông lan, nửa đĩa trái cây, 1 chai nước suối. Của bạn._
~ tien_cong(40000)
~ an(30)
~ nhan(nuoc_suoi)
~ duy_an_do_thua++
~ duy_kn(2)
chi_dai: *(đi ngang, gật đầu)* Ghế hôm nay xếp có tâm. Chị ngồi không phải nhìn mặt ai.
~ qh("chi_dai", 3)
-> END

=== thuc_tap_sinh_mg_xep_ghe_that_bai ===
# noi:phong_hop_sang_tao
_Bạn xếp {truong_phong} cạnh {con_ong_chau_cha}. Cuộc họp 2 tiếng biến thành 3 tiếng. 1 tiếng là để hai người tranh nhau cái remote máy chiếu._
_Còn {chi_dai} ngồi đối diện {thanh_ninh}. Nhìn nhau 2 tiếng. Không ai chớp mắt._
~ tien_cong(10000)
~ an(10)
~ duy_lua_doi(-2)
~ qh("truong_phong", -3)
_Đồ thừa chỉ còn đúng nửa cái bánh bông lan, có dấu răng của ai đó._
-> END

// ============ 💡 NGƯỜI CẦM HẮT SÁNG ============
=== thuc_tap_sinh_mg_hat_sang_mo_dau ===
# noi:studio_tang_2
_Tấm hắt sáng tròn, đường kính 1 mét. Thanh "mỏi tay" bắt đầu từ 0. Siêu Nhân Hồng đổi dáng liên tục, mỗi dáng một hướng._
designer: Giữ ánh sáng ở cằm! Cằm! Không phải trán! Trán bóng rồi!
sieu_nhan_hong: Biến hình! *(xoay 180 độ)*
-> END

=== thuc_tap_sinh_mg_hat_sang_thanh_cong ===
# noi:studio_tang_2
_Dáng 30. Tay bạn run như lá, nhưng ánh sáng vẫn nằm đúng ở cằm của Siêu Nhân Hồng._
designer: *(xem ảnh trên máy)* … Không cần sửa. Ủa? Không cần sửa?! Lần đầu trong đời tui nói câu này với ảnh chụp!
sieu_nhan_hong: *(chạy lại, đưa bịch bánh)* Bánh chuối chiên của phòng chờ nè. Cảm ơn em nha. Ánh sáng ấm ghê.
~ tien_cong(60000)
~ nhan(chuoi_chien)
~ follow(10000)
~ duy_kn(3)
~ duy_lua_doi(3)
~ qh("designer", 5)
~ qh("sieu_nhan_hong", 3)
~ nghi(-15)
-> END

=== thuc_tap_sinh_mg_hat_sang_that_bai ===
# noi:studio_tang_2
_Dáng 17. Tay bạn rớt xuống 10 phân. Poster ra lò: một nửa mặt Siêu Nhân Hồng sáng, một nửa tối. Như phim kinh dị._
designer: *(ôm đầu)* Lần sửa thứ 22. Cảm ơn em.
~ tien_cong(20000)
~ qh("designer", -3)
~ duy_lua_doi(-3)
~ nghi(-15)
-> END

// ============ 🧾 ĐẾM TIỀN QUỸ TRÀ SỮA ============
=== thuc_tap_sinh_mg_dem_tien_mo_dau ===
# noi:phong_ke_toan
_Hộp quỹ tiền phạt đi trễ. Tiền lẻ, tiền rách, tiền dán băng keo. Một tờ 50 nghìn ghi chữ "{chua_te_deadline} lần 9". Một tờ tiền âm phủ, mệnh giá 1 tỷ._
ke_toan: Đếm đi em. Đếm chậm thôi, đừng làm rách thêm.
_Ngón tay bạn ngứa. 8 năm đếm tiền. Cái máy đếm tiền ở ngân hàng còn phải nể bạn._
-> END

=== thuc_tap_sinh_mg_dem_tien_thanh_cong ===
# noi:phong_ke_toan
_1 triệu 250 nghìn. Không tính tờ âm phủ. Khớp với sổ của {ke_toan} tới từng đồng._
ke_toan: Đúng. Ly trà sữa đầu tiên là của em. 20 nghìn tiền lẻ dư, em cầm luôn.
~ nhan(tra_sua)
~ tien_cong(20000)
~ duy_kn(1)
~ qh("ke_toan", 5)
_Bạn uống ngụm trà sữa đầu tiên của buổi trà sữa thứ 6. Ngọt. Ngọt hơn mọi ly cà phê ở phòng kính tầng 15._
-> END

=== thuc_tap_sinh_mg_dem_tien_qua_nhanh ===
# noi:phong_ke_toan
_7 giây. Bạn đếm xong trong 7 giây. Tiền lẻ xòe ra trên tay như quạt, ngón cái lướt như máy._
_{ke_toan} không cầm bút. {ke_toan} nhìn tay bạn. Rồi nheo mắt nhìn bạn._
ke_toan: … Em học đếm tiền ở đâu vậy em?
thuc_tap_sinh: Dạ… dạ em hay đếm tiền lẻ bán vé số giùm má ạ.
~ nhan(tra_sua)
~ tien_cong(20000)
~ duy_lo(4)
~ qh("ke_toan", 3)
-> END

=== thuc_tap_sinh_mg_dem_tien_that_bai ===
# noi:phong_ke_toan
_Bạn đếm lệch 50 nghìn. Đếm lại lệch 30 nghìn. Hóa ra tờ tiền âm phủ dính vào một tờ 20 nghìn thật._
ke_toan: Không sao. Lần đầu chị cũng lệch. *(nói dối, chị chưa lệch bao giờ)*
~ nhan(tra_sua)
~ duy_ngo(3)
-> END

// ============ 🐕 TẮM CHO TUẤT ============
=== thuc_tap_sinh_mg_tam_tuat_mo_dau ===
# noi:chong_bao_ve
_Chậu nước ấm. Xà bông cho chó. Máy sấy. Một cái áo nhỏ màu hồng và một cái nơ._
{ ngay == 4:
    _{chi_dai} dội nước, bạn giữ khăn và sấy. {cho} chỉ cho {chi_dai} đụng nước vào người. Còn sấy với đeo nơ thì… tùy tay bạn._
- else:
    _Hôm nay {chi_dai} không có ở đây. {cho} nhìn chậu nước, nhìn bạn. Chưa ai ngoài {chi_dai} tắm được cho nó._
}
cho: *(lùi lại một bước)* Grừ… *(rồi ngửi tay bạn)* … Gâu.
-> END

=== thuc_tap_sinh_mg_tam_tuat_thanh_cong ===
# noi:chong_bao_ve
_{cho} sạch bong, lông bông xù, đeo nơ hồng. Bạn khô ráo từ đầu tới chân. Bác {bac_bao_ve} vỗ tay hai cái, chuyện chưa từng có._
_Rồi từ cổng, một bộ đồ hồng xuất hiện. {sieu_nhan_hong} giả tiếng sủa: "Gâu! {cho} ơi, nơ của em hồng giống anh nè!"_
cho: GÂU GÂU GÂU! *(vùng ra, lao đi, lắc mình)*
_Nước văng tung tóe. Cả bạn lẫn Siêu Nhân Hồng ướt sũng. Nhưng {cho} vẫn đeo nơ. Đó là chiến thắng._
~ nhan(xuc_xich)
~ qh("cho", 10)
~ qh("bac_bao_ve", 5)
~ duy_kn(1)
bac_bao_ve: Bác cho cháu 2 cây xúc xích. Một cho nó, một cho cháu. Hay cả hai cho nó, tùy cháu.
* [🦴 Đưa cả hai cây cho {cho}.]
    ~ mat(xuc_xich)
    cho: *(ăn 2 cây trong 3 giây, rồi dụi đầu vào chân bạn)* Gâu!
    ~ qh("cho", 5)
* [🌭 Một cho {cho}, một giữ lại.]
    cho: *(ăn cây của mình, nhìn cây của bạn)* …
- -> END

=== thuc_tap_sinh_mg_tam_tuat_that_bai ===
# noi:chong_bao_ve
_{cho} lắc mình đúng lúc bạn cúi xuống. Bạn ướt như chuột lột. Cái nơ hồng bay vào ổ, {cho} nằm lên nó._
bac_bao_ve: *(đưa khăn)* Lần đầu thì thế. Con bé {chi_dai} lần đầu còn bị nó tè vào giày.
~ qh("cho", 5)
~ uong(10)
~ cang_thang(5)
-> END
