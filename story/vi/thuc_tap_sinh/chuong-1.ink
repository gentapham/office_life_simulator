// ============================================================
// THỰC TẬP SINH · CHƯƠNG 1: "DẠ EM MỚI VÔ" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== thuc_tap_sinh_0110_den_som ===
# ngay:1 # gio:07:00 # noi:cong_cong_ty # bat_buoc
_7 giờ sáng. Bạn là người tới sớm nhất công ty, như mọi ngày trong tháng thực tập thứ hai. Áo sơ mi ủi phẳng, giày lau bóng, balo có 3 cây bút và 1 cuốn sổ ghi chép._
_Ở Hẻm 69, 3 bạn cùng phòng vẫn đang ngủ. Dưới gối của bạn, một cái thẻ màu bạc lấp lánh vẫn nằm yên chỗ cũ._
bac_bao_ve: Ừ… Cháu {thuc_tap_sinh}. Sớm thế. Hôm nay có ký hợp đồng gì lớn lắm, cả công ty nói từ tuần trước.
cho: Gâu! *(chạy ra, vẫy đuôi, đứng hai chân)*
* [😇 "Dạ con chào bác ạ! Con chúc mừng bác ngày Người cao tuổi ạ!"]
    bac_bao_ve: *(khựng lại)* Cháu nhớ cả ngày đấy à? … Ừ. Bác cảm ơn.
    ~ qh("bac_bao_ve", 8)
* [🐕 Ngồi xuống cho {cho} liếm tay.]
    cho: *(liếm sạch tay bạn, rồi nằm ngửa)* Gâu gâu!
    ~ qh("cho", 10)
    bac_bao_ve: Nó quý cháu. Cả công ty nó quý được mấy người.
* [🧹 "Dạ để con quét sân giùm bác ạ."]
    ~ duy_da()
    ~ nghi(-5)
    bac_bao_ve: Thôi thôi, việc của bác. *(nhưng vẫn đưa cái chổi)* Quét nhẹ tay thôi, bụi bay vào chòi.
    ~ qh("bac_bao_ve", 5)
    ~ duy_kn(1)
- _Bạn lên tầng 1, bật đèn, bật máy in, xếp ghế phòng họp. Không ai giao. Bạn quen làm vậy._
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0110_22_ly_ca_phe ===
# ngay:1 # gio:08:25 # noi:pantry # bat_buoc
_Ngày Cà phê Quốc tế. Máy pha cà phê ở pantry kêu "rẹt rẹt", nhả ra một giọt nước nâu, rồi tắt ngúm._
_8 giờ 25. {chua_te_deadline} vừa tới, tay cầm ly cà phê sữa đá của chính mình, nhìn quanh pantry rồi nhìn bạn._
chua_te_deadline: Anh {thuc_tap_sinh} ơi, em nhờ xíu. Anh chạy ra quán mua giùm 22 ly nha. 9 giờ ký hợp đồng, cả công ty cần tỉnh.
~ duy_day_viec(1)
~ duy_da()
thuc_tap_sinh: Dạ em làm liền ạ!
_Quán cà phê đầu đường. 22 ly. 660 nghìn. Bạn mở ví: 85 nghìn tiền mặt. Và cái thẻ. Hôm nay bạn quên để nó dưới gối._
_Cái thẻ hạng kim cương nằm trong ví, sáng lấp lánh như đang nói: "Quẹt đi. Một giây thôi."_
* [💳 Quẹt thẻ kim cương.]
    _"Tít." Cô thu ngân nhìn cái thẻ, rồi nhìn bạn, rồi gọi quản lý ra chào. Quản lý cúi đầu: "Dạ quý khách hạng kim cương lần sau ghé, bên em tặng thêm topping ạ."_
    ~ duy_lo(15)
    _Bạn xách 22 ly về đúng 8 giờ 50. Không ai thấy cái thẻ. Chỉ có quán cà phê thấy, và quán cà phê ở cạnh tiệm nail Lung Linh._
    ~ qh("chua_te_deadline", 5)
* [🏃 Chạy về Hẻm 69 lấy tiền mặt trong hộp bánh.]
    _Bạn chạy 1,5 km về Hẻm 69, mở hộp bánh quy bằng thiếc dưới gầm giường, lấy 600 nghìn, chạy lại._
    _9 giờ 20 mới về tới. Lễ ký hợp đồng đã xong. Cả công ty đang uống trà sữa ăn mừng 5 tỷ, không ai còn cần cà phê._
    ~ tien_cong(-660000)
    ~ nghi(-25)
    ~ duy_ngo(5)
    ~ duy_lua_doi(-5)
    chua_te_deadline: Ủa anh… em nói chơi á. À không, em nói thiệt. Mà… cảm ơn anh nha.
* [🙏 Gom tiền từng người, 30 nghìn một ly.]
    _Bạn đi từng bàn. "Dạ anh chị cho em xin 30 nghìn tiền cà phê ạ."_
    hong_hot: Ủa thực tập sinh gì mà đi đòi tiền vậy?
    ke_toan: *(đưa đúng 30 nghìn, kèm hóa đơn lẻ)* Em ghi tên chị vào. Không có ghi tên là không có tiền.
    ~ duy_kn(3)
    ~ qh("hong_hot", -3)
    ~ qh("ke_toan", 3)
    _Bạn gom đủ 19 ly. 3 ly còn lại bạn tự trả: của {chua_te_deadline}, của {editor}, và của chính mình._
    ~ tien_cong(-90000)
- ~ uong(20)
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2. Bạn đứng ở góc cuối, cạnh cái máy chiếu, vì thực tập sinh không có ghế._
_Đầu bàn, một người mặc bộ đồ siêu nhân màu hồng tạo dáng. Trên bàn, một xấp hợp đồng dày cộp. 52 trang._
giam_doc: Các em! Hôm nay là một ngày lịch sử! Đối tác chiến lược của chúng ta: Siêu Nhân Hồng!
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
ke_toan: *(thì thầm)* Anh ơi, anh đọc giúp em trang 47 trước khi ký đã…
giam_doc: Thôi em, đối tác đang chờ. Anh không ép, tùy em… mà thôi ký luôn.
_30 giây. {giam_doc} ký 52 trang trong 30 giây._
_Theo phản xạ nghề nghiệp 8 năm, bạn nghĩ: "Hợp đồng 52 trang mà ký trong 30 giây, ai cho vay mà dám vậy."_
* [😶 Đứng im. Bạn là thực tập sinh.]
    _Bạn đứng im. Cổ họng ngứa ngáy như có ai nhét một con dấu vào đó._
    ~ duy_ngo(3)
* [❓ Giơ tay: "Dạ… trang 47 là trang gì vậy ạ?"]
    _Cả phòng quay lại. Thực tập sinh 30 tuổi vừa hỏi câu duy nhất có ý nghĩa của buổi sáng._
    giam_doc: Trang 47… là trang sau trang 46, em ạ. *(cười to)* Thực tập sinh vui tính quá!
    ke_toan: *(nhìn bạn rất lâu, rồi ghi gì đó vào sổ)*
    ~ qh("ke_toan", 5)
    ~ qh("giam_doc", -3)
    ~ duy_ngo(-5)
    ~ duy_lo(3)
* [📝 Ghi vào sổ: "Hợp đồng SNH. 52 trang. Ký 30 giây. Trang 47?"]
    _Bạn ghi. Chữ nghiêng, đều, như chữ trên một biên bản thẩm định. Bạn chưa viết kiểu chữ này 1 năm rồi._
    ~ duy_kn(2)
- _5 tỷ về tài khoản. Cả phòng reo hò. {sieu_nhan_hong} đi vòng bắt tay từng người. Tới chỗ bạn, Siêu Nhân Hồng bắt tay rất chặt._
sieu_nhan_hong: Chào em! Em là… ờm, nhân viên hả?
* [😇 "Dạ em là thực tập sinh ạ. Em mới vô nên chưa biết ạ."]
    sieu_nhan_hong: Thực tập sinh! Biến hình! Cố lên nha em! *(tạo dáng)*
    ~ qh("sieu_nhan_hong", 5)
    ~ duy_ngo(2)
* [🤝 "Dạ, anh cần gì cứ kêu em, em chạy được ạ."]
    sieu_nhan_hong: Thiệt hả? Vậy… ờm… em biết chỗ nào bán bánh chuối chiên ngon hông?
    _Câu đó mở ra một sự nghiệp mới của bạn: người mua bánh chuối chiên cho phòng chờ._
    ~ qh("sieu_nhan_hong", 8)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0110_mung_bac_binh ===
# ngay:1 # gio:15:00 # noi:sanh_tang_tret
_Cả công ty xuống sảnh tặng hoa Bác {bac_bao_ve} nhân ngày Người cao tuổi, kèm trà sữa ăn mừng 5 tỷ. Bạn là người bưng 22 ly trà sữa._
hong_hot: Bác cười cái coi bác! Live đang có 300 người xem nè!
bac_bao_ve: Thôi thôi… các cháu bày vẽ.
_Bác đỏ mặt. Bạn để ý bác không uống trà sữa. Bác chỉ nhìn ấm trà đá của mình._
* [🍵 Pha cho bác một ly trà đá mới, để cạnh ly trà sữa.]
    bac_bao_ve: *(cầm ly trà đá, gật đầu một cái)* Cháu tinh ý đấy.
    ~ qh("bac_bao_ve", 8)
* [🧋 Đưa ly trà sữa đầu tiên cho bác.]
    bac_bao_ve: Ừ… *(cầm ly, không uống, để xuống)*
    ~ qh("bac_bao_ve", 2)
* [📋 Đứng ra sau, xếp lại ghế cho mọi người ngồi.]
    ~ duy_kn(2)
    chi_dai: Ê, em thực tập sinh kia. Em tên gì?
    thuc_tap_sinh: Dạ em là {thuc_tap_sinh} ạ.
    chi_dai: Ừ. Đứa nào bắt nạt em, chỉ mặt chị.
    ~ qh("chi_dai", 5)
- ~ uong(20)
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0210_nu_cuoi ===
# ngay:2 # gio:07:58 # noi:may_cham_cong # bat_buoc
_Ngày Nụ cười Thế giới. {hr} đứng cạnh máy chấm công, tay cầm cuốn sổ, bắt mọi người cười khi chấm vân tay._
hr: Em {thuc_tap_sinh}. Cười một cái cho anh nha em. Mình cùng lan tỏa năng lượng tích cực.
_Bạn cười. Cười theo phản xạ. Nụ cười 32 độ, môi trên nâng vừa đủ, mắt hơi híp, đầu nghiêng 5 độ. Nụ cười đã chào đón 4.000 khách hàng VIP trong 8 năm._
hr: *(dừng bút)* Ồ… Nụ cười chuyên nghiệp ghê. Em học ở đâu vậy em?
* [🏦 "Dạ hồi trước em tiếp khách V… à, dạ em tự tập ở nhà ạ."]
    hr: Tiếp khách V gì em?
    thuc_tap_sinh: Dạ… tiếp khách… vào… vào hẻm ạ. Nhà em ở hẻm.
    _{hr} cười. Bạn không chắc {hr} có tin. Nụ cười của {hr} thì không bao giờ cho biết gì._
    ~ duy_lo(5)
* [😶 "Dạ em mới vô nên chưa biết ạ."]
    hr: Mới vô mà cười đẹp vậy, ở lâu chắc cười đẹp hơn nữa. Anh ghi nhận.
    ~ duy_ngo(3)
    ~ qh("hr", 3)
* [😆 "Dạ, 6-7 anh!" (bắt trend giới trẻ)]
    hr: … 6-7 là sao em?
    thuc_tap_sinh: Dạ em cũng hông biết ạ, em thấy các bạn trẻ nói vậy.
    hr: *(cười thật lần đầu trong ngày)* Ừ. Anh cũng hông biết.
    ~ qh("hr", 5)
    ~ duy_ngo(5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp lên chiến dịch "Hồng Hóa Việt Nam". Mục tiêu: 1 triệu người theo dõi trước 31/10. Bạn ngồi ghế nhựa sát tường, sổ trên đùi._
_Trên màn chiếu, bảng tiến độ của {chua_te_deadline} chỉ có một thanh màu hồng: "31/10: làm hết"._
chua_te_deadline: Dạ chi tiết thì anh {thuc_tap_sinh} đang làm giùm em.
_Bạn lần đầu nghe về việc này._
thuc_tap_sinh: Dạ… dạ em làm liền ạ!
~ duy_da()
~ duy_day_viec(1)
truong_phong: Tốt. Giờ mọi người góp ý tưởng nội dung. Phim ngắn cho Đại Nhạc Hội, ai có ý gì không?
_{bien_kich} ngồi thẳng lên, mở laptop. Bạn liếc thấy màn hình: một file kịch bản. Bạn nhớ tháng 9, ở pantry, bạn từng kể với {bien_kich} một ý tưởng phim: "Người Gác Két"._
* [💬 Kể lại ý tưởng "Người Gác Két" trước cả phòng.]
    thuc_tap_sinh: Dạ… em có một ý ạ. Một anh nhân viên ngân hàng bỏ việc đi làm siêu nhân. Tên là "Người Gác Két" ạ.
    _Cả phòng im. {bien_kich} đóng laptop lại hơi mạnh tay._
    bien_kich: Ý tưởng… cũng được. Nghe hơi quen. Chắc ai cũng từng nghĩ tới.
    truong_phong: Tớ take note lại nhé. Ý hay đấy, {thuc_tap_sinh}… à, cậu {thuc_tap_sinh}.
    ~ duy_kn(5)
    ~ duy_lua_doi(5)
    ~ qh("bien_kich", -3)
    ~ duy_ngo(-3)
* [😶 Im lặng. "Chắc chị {bien_kich} có ý hay hơn."]
    bien_kich: Tui có một ý. Phim ngắn 15 phút, tên tạm là "Người Hùng Không Tên".
    _Bạn nghe tóm tắt. Một anh nhân viên ngân hàng. Bỏ việc. Đi làm siêu nhân. Bạn đánh rơi cây bút._
    ~ duy_biet_y_tuong_bi_lay = true
    ~ duy_lua_doi(-10)
* [📝 Ghi chép, hỏi ngây thơ: "Dạ phim ngắn thì ai viết ý tưởng gốc ạ?"]
    bien_kich: *(khựng)* Tui. Đương nhiên là tui. Đây không phải đạo… ờ, ý tui là, tui viết.
    _Bạn chưa hiểu vì sao {bien_kich} nói câu đó. Bạn ghi lại: "Đây không phải đạo"._
    ~ duy_kn(2)
    ~ duy_ngo(-2)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0210_quy_tra_sua ===
# ngay:2 # gio:15:00 # noi:phong_ke_toan
_Thứ 6, 15 giờ. Trà sữa thứ 6. {ke_toan} gọi bạn vào phòng kế toán phụ đếm hộp quỹ tiền phạt đi trễ._
ke_toan: Em đếm giùm chị. Tiền lẻ, tiền rách. Có cả một tờ tiền âm phủ, chị biết của ai nhưng chị chưa chứng minh được.
-> thuc_tap_sinh_mg_dem_tien_mo_dau

// ------------------------------------------------------------
=== thuc_tap_sinh_0310_hem_69 ===
# ngay:3 # gio:20:00 # noi:hem_69
_Thứ 7. Phòng 12, dãy B, Hẻm 69. 4 người, 2 giường tầng, 1 cái quạt quay 3 hướng, và một tháp mì gói cao 1 mét 2._
_3 bạn cùng phòng (một anh chạy xe ôm công nghệ, một bạn sinh viên, một anh thợ hồ) đang chơi bài. Họ biết bạn "trước làm bảo vệ ngân hàng"._
_Bạn trùm mền, sờ xuống gối. Cái thẻ vẫn đó._
{ duy_do_lo >= 15:
    _Hôm thứ 5 nó đã quẹt 660 nghìn tiền cà phê. Từ đó, cô thu ngân quán đầu đường gọi bạn là "anh kim cương". Bạn đổi quán._
}
* [🍜 Nấu mì cho cả phòng, góp thêm 4 quả trứng.]
    ~ an(30)
    ~ tien_cong(-15000)
    _Cả phòng ăn mì. Anh thợ hồ kể chuyện công trình. Bạn sinh viên kể chuyện thi lại. Không ai hỏi bạn lương bao nhiêu. Ở đây bạn chỉ là "thằng Duy"._
    ~ duy_lua_doi(3)
    ~ cang_thang(-10)
* [🖥️ Ra quán net Gõ Phím, học phần mềm dựng phim.]
    _Máy số 15. Máy số 14 là {it}, đang chơi game, đeo tai nghe, không nói gì._
    it: *(liếc màn hình bạn)* Phím tắt cắt cảnh là C. Đừng kéo chuột.
    ~ duy_kn(5)
    ~ qh("it", 5)
    ~ tien_cong(-15000)
* [📖 Nằm viết tiếp kịch bản "Người Gác Két" vào sổ.]
    _Bạn viết tới 2 giờ sáng. Cảnh cuối: người gác két đứng trong mưa, có một người lạ mặc đồ hồng đẩy xe giùm. Bạn không biết vì sao mình viết cảnh đó. Chỉ biết nó có thật._
    ~ duy_lua_doi(5)
    ~ nghi(-15)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0410_tam_tuat ===
# ngay:4 # gio:09:00 # noi:chong_bao_ve # bat_buoc
_Chủ nhật. Ngày Động vật Thế giới. Bác {bac_bao_ve} nhờ bạn tắm cho {cho}, rồi mặc áo, đeo nơ hồng "cho hợp chiến dịch"._
bac_bao_ve: Cả công ty nó chỉ cho đúng một người tắm: con bé {chi_dai}. Cháu phụ sấy với đeo nơ. Nhẹ tay thôi.
chi_dai: *(xắn tay áo)* Em giữ khăn. Chị dội nước. Nó mà vẩy là em chịu trận đó nha.
cho: *(nhìn cái chậu nước, nhìn bạn, nhìn cái chậu, thở dài như người)* Gâu…
-> thuc_tap_sinh_mg_tam_tuat_mo_dau
