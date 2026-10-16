// ============================================================
// GIÁM ĐỐC · MINIGAME
// Mỗi minigame có 3 cảnh: _mo_dau (game mở minigame sau cảnh này),
// _thanh_cong và _that_bai (game gọi theo kết quả).
// Ngân Sách tính bằng triệu đồng.
// ============================================================

// ============ ✍️ CHỒNG GIẤY KÝ DUYỆT ============
=== giam_doc_mg_chong_giay_mo_dau ===
# noi:phong_giam_doc # gio:09:35 # dieu_kien:sang_ngay_lam_viec
_Mười tờ trình bay vào bàn như lá mùa thu. {thanh_ninh} xếp chúng thành một cái tháp rất đẹp._
thanh_ninh: Dạ sếp ơi, hôm nay có 10 tờ ạ. Tờ nào sếp ký cũng chuẩn hết anh ơi!
_Tờ trên cùng: "Đề xuất tăng lương 50% cho Phó phòng Marketing. Người đề xuất: Phó phòng Marketing."_
* [✍️ Bắt đầu soi từng tờ. Kéo phải là ký, kéo trái là từ chối.]
    giam_doc: Đưa đây. Hôm nay anh đọc hết chữ nhỏ.
* [💬 "{thanh_ninh}, em lọc hộ anh mấy tờ có chữ cỡ 6 trước nhé."]
    thanh_ninh: Dạ… dạ chữ cỡ 6 là cỡ nào ạ sếp? Em thấy tờ nào cũng đẹp hết á.
    ~ qh("thanh_ninh", 3)
- -> END

=== giam_doc_mg_chong_giay_thanh_cong ===
# noi:phong_giam_doc # dieu_kien:minigame_chong_giay_dat
_Mười tờ. Mười lần đúng. Bạn bắt được một số 0 thừa, một hóa đơn "tiền ốc 2 triệu cho 1 người", và tờ tăng lương 50% của {con_ong_chau_cha}._
~ gd_tien_cty(50)
~ gd_uy(5)
thanh_ninh: *(bưng lên một ly trà sen)* Sếp ơi, mười trên mười! Sếp soi giấy có tâm quá anh ơi!
~ uong(30)
~ cang_thang(-10)
ke_toan: *(nhắn Zola)* "Hôm nay anh không ký nhầm tờ nào. Em ghi nhận."
~ qh("ke_toan", 5)
_Một tin nhắn mười chữ. Bạn đọc hai lần._
-> END

=== giam_doc_mg_chong_giay_that_bai ===
# noi:phong_giam_doc # dieu_kien:minigame_chong_giay_truot
_Bạn ký như máy. Tới tờ thứ chín mới thấy: tờ thứ hai là "tăng lương 50% cho Phó phòng Marketing". Chữ ký của bạn nằm rất đẹp ở cuối._
~ gd_tien_cty(-30)
~ gd_uy(-5)
con_ong_chau_cha: *(nhắn)* Chú ơi, cảm ơn chú nha! Chill ghê!
ke_toan: Anh. Lên phòng em nói chuyện chút.
* [😅 "Anh ký nhầm. Em hủy giúp anh."]
    ke_toan: Dạ. Lần sau anh đọc chữ trước, ký sau.
    ~ gd_tien_cty(30)
    ~ qh("con_ong_chau_cha", -10)
* [🙅 "Thôi, cháu anh mà. Anh không ép, tùy em."]
    ~ gd_tuy_em("ke_toan")
    ~ gd_no(3)
    ke_toan: Tùy em thì em ghi vào sổ: "Sếp tự tăng lương cho cháu."
- -> END

// ============ 🎤 PHÁT BIỂU THỨ 2 ============
=== giam_doc_mg_phat_bieu_mo_dau ===
# noi:phong_hop_tang_2 # gio:08:30 # dieu_kien:thu_hai
_8 giờ 30, họp giao ban. Cả công ty ngồi kín phòng "Sáng Tạo". Có người cầm cà phê, có người cầm… gối._
truong_phong: Mời anh {giam_doc} truyền lửa ạ. Anh nói 5 phút thôi nhé anh.
_Thanh cảnh báo màu đỏ trên màn hình: đừng nói chữ "nợ"._
* [🔥 Đứng dậy, cài cúc áo vest: "Các em, năm 2010, anh đi dép lê…"]
    ~ gd_uy(2)
* [🗣️ "Hôm nay anh nói ngắn thôi. Thật đấy."]
    hong_hot: *(thì thầm)* Câu này tuần trước sếp cũng nói.
    ~ gd_sua("hop_ngan")
- -> END

=== giam_doc_mg_phat_bieu_thanh_cong ===
# noi:phong_hop_tang_2 # dieu_kien:minigame_phat_bieu_dat
_Bạn nói đúng 7 phút. Không một chữ "nợ". Câu cuối "Mình không ép ai thành công, mình chỉ ép mình thôi" nhận được tràng vỗ tay thật._
~ gd_uy(15)
thanh_ninh: Sếp ơi bài phát biểu đỉnh nóc kịch trần luôn anh ơi! *(đặt lên bàn một hộp bánh pía)*
~ an(30)
chi_dai: Hôm nay nghe được. Lần sau ngắn nữa thì em vỗ tay to hơn.
~ qh("chi_dai", 5)
-> END

=== giam_doc_mg_phat_bieu_that_bai ===
# noi:phong_hop_tang_2 # dieu_kien:minigame_phat_bieu_truot
_Phút thứ 23. Bạn đang kể tới đoạn "năm 2015 anh tìm ra {idol_het_thoi}" lần thứ 40. {chua_te_deadline} ngủ gật, đầu đập xuống bàn "cộp"._
_Rồi trong lúc hăng, bạn buột miệng: "…dù công ty đang nợ… à, nợ… nợ các em một lời cảm ơn!"_
~ gd_uy(-5)
~ gd_no(10)
~ cang_thang(10)
hong_hot: *(gõ điện thoại cực nhanh)*
ke_toan: *(nhìn bạn, lắc đầu thật chậm)*
_Ba phút sau, group "Hội Anti Sếp" có tin mới: "Sếp vừa nói chữ 'nợ' mấy bà ơi."_
-> END

// ============ 🏌️ GOLF VỚI ĐỐI TÁC ============
=== giam_doc_mg_golf_mo_dau ===
# noi:san_thuong # gio:14:00 # dieu_kien:co_doi_tac
_Sân thượng công ty. Một tấm thảm cỏ nhựa, một cái lỗ, và một vị đối tác bụng to, đánh golf rất tệ nhưng rất tự tin._
doi_tac: Anh {giam_doc}, nghe nói anh đánh hay lắm. Nhẹ tay với em nha!
_Mẹo của nghề: đánh hơi kém đối tác một chút. Đối tác vui thì đối tác ký._
{ gd_co_ao_golf:
    _Bạn mặc áo golf. Đối tác nhìn cái áo, gật gù: "Dân chơi thật."_
    ~ gd_uy(5)
}
* [🏌️ Cầm gậy. Hôm nay mình… thua có tính toán.]
    giam_doc: Anh lâu không cầm gậy đâu. Em nương tay nhé.
* [🔥 "Golf là golf. Anh đánh thật đấy nhé!"]
    doi_tac: Ơ… vâng.
    ~ cang_thang(5)
- -> END

=== giam_doc_mg_golf_thanh_cong ===
# noi:san_thuong # dieu_kien:minigame_golf_dat
_Bóng của bạn dừng cách lỗ đúng một gang tay. Bóng của đối tác lăn vào lỗ sau 7 gậy. Đối tác giơ hai tay lên trời như vô địch._
doi_tac: Ha ha! Anh {giam_doc} thua em rồi nhé! Thôi, hợp đồng em ký luôn!
~ gd_so_lan_thua_golf = gd_so_lan_thua_golf + 1
{ RANDOM(1, 3):
- 1: ~ gd_tien_cty(50)
- 2: ~ gd_tien_cty(150)
- 3: ~ gd_tien_cty(300)
}
_Đối tác bổ cho bạn một trái dừa tươi và tặng một cái áo golf có in tên công ty anh ta._
~ uong(30)
~ gd_co_ao_golf = true
~ follow(5000)
~ gd_uy(5)
{ gd_so_lan_thua_golf >= 3:
    _Lần thứ ba thua có tính toán, và lần thứ ba chốt deal. Bạn bắt đầu nghi mình giỏi golf thật._
}
-> END

=== giam_doc_mg_golf_that_bai ===
# noi:san_thuong # dieu_kien:minigame_golf_truot
_Một gậy. Bóng vào lỗ. Hole-in-one. Lần đầu tiên trong đời._
_Đối tác im lặng rất lâu, rồi nhìn đồng hồ._
doi_tac: À… em có hẹn. Hợp đồng để em về bàn với vợ.
~ gd_uy(-3)
~ cang_thang(10)
_Bạn đứng một mình trên sân thượng, cầm quả bóng vô địch. Không ai quay clip._
-> END

// ============ 🍻 TIẾP KHÁCH QUÁN ỐC ============
=== giam_doc_mg_quan_oc_mo_dau ===
# noi:quan_oc_dem # gio:19:30 # dieu_kien:co_hen_doi_tac
_Quán Ốc Đêm. Bàn nhựa đỏ, đĩa ốc hương xào bơ thơm điếc mũi. Đối tác rót đầy ly._
doi_tac: Anh {giam_doc}, uống cạn rồi mình nói chuyện tiền!
_Thanh Tỉnh Táo phải giữ trên 30%. Mỗi ly là một lần chọn: uống, kể chuyện, hay "đi vệ sinh" đổ ly._
sales: *(ngồi bên cạnh, thì thầm)* Anh cứ để em, em quen hết mà.
* [🍻 "Một trăm phần trăm!"]
    ~ cang_thang(-5)
* [🧃 "Anh uống nửa ly thôi, mai còn họp."]
    doi_tac: Ơ, sếp gì uống nửa ly?
- -> END

=== giam_doc_mg_quan_oc_thanh_cong ===
# noi:quan_oc_dem # dieu_kien:minigame_quan_oc_dat
_Bạn tỉnh. Đối tác thì không. Bạn đặt tờ hợp đồng lên bàn đúng lúc anh ta đang hát._
doi_tac: Ký! Ký luôn! Anh {giam_doc} là anh em!
~ gd_tien_cty(100)
~ an(50)
~ follow(8000)
_Đĩa ốc hương cuối cùng ngon như chưa từng có. Hôm nay bạn trả tiền bằng tiền của… công ty, có hóa đơn đàng hoàng._
~ gd_uy(5)
-> END

=== giam_doc_mg_quan_oc_that_bai ===
# noi:quan_oc_dem # dieu_kien:minigame_quan_oc_truot
_Ly thứ bảy. Bạn đứng lên, choàng vai đối tác, choàng vai cả ông bán ốc._
giam_doc: Em ơi… anh nói thật… tháng sau anh tăng lương cho… cho tất cả mọi người trong quán này!
_Ông bán ốc vỗ tay. Đối tác ngủ gục trên đĩa ốc. Không ai ký gì._
~ gd_hua()
~ an(30)
~ cang_thang(10)
~ nghi(-20)
_Sáng hôm sau, bạn thấy trong điện thoại một đoạn video 40 giây. Bạn không dám xem hết._
-> END

// ============ 📞 GỌI NGÂN HÀNG GIÃN NỢ ============
=== giam_doc_mg_ngan_hang_mo_dau ===
# noi:phong_giam_doc # gio:09:40 # dieu_kien:moi_tuan_mot_lan
_Bạn khóa cửa phòng kính, kéo rèm. Bấm số của Ngân hàng Tín Dụng Đen Đủi._
nv_ngan_hang: Dạ em chào anh {giam_doc}! Hôm nay anh gọi tất toán hả anh?
_Chọn câu: xin xỏ, câu "doanh nhân", hay câu hứa hẹn._
* [💼 Giọng doanh nhân: "Em à, anh có một cái vision cho khoản vay này…"]
    nv_ngan_hang: Dạ, vision là gì em ghi vô mục nào hả anh?
* [🙏 Giọng thật: "Em ơi, cho anh thở thêm một tuần."]
    nv_ngan_hang: Dạ… để em hỏi sếp em.
- -> END

=== giam_doc_mg_ngan_hang_thanh_cong ===
# noi:phong_giam_doc # dieu_kien:minigame_ngan_hang_dat
nv_ngan_hang: Dạ, sếp em đồng ý giảm lãi tuần này 40 triệu cho anh. Anh nhớ đúng hẹn nha anh.
~ gd_tien_cty(40)
~ gd_no(-5)
~ cang_thang(-10)
_Ba ngày sau, bưu điện mang tới một cuốn lịch treo tường của ngân hàng. Mỗi tờ là một câu "Tiết kiệm hôm nay, an nhàn ngày mai"._
~ gd_co_lich_ngan_hang = true
_Bạn treo nó trong phòng giám đốc. Quay mặt vào tường._
-> END

=== giam_doc_mg_ngan_hang_that_bai ===
# noi:phong_giam_doc # dieu_kien:minigame_ngan_hang_truot
nv_ngan_hang: Dạ em xin lỗi anh, hồ sơ của anh đang bị theo dõi đặc biệt. Mọi giao dịch lớn của công ty anh bên em sẽ kiểm tra kỹ hơn nha anh.
~ gd_no(5)
~ cang_thang(10)
_Bạn cúp máy. Qua vách kính, {thanh_ninh} đang nhìn vào. Cô ấy cười rất tươi, rồi cúi xuống gõ gì đó._
-> END

// ============ 📲 NHẮN GROUP 22 GIỜ ============
=== giam_doc_mg_nhan_22h_mo_dau ===
# gio:22:00 # dieu_kien:toi_ngay_lam_viec
_22:00. Group "{cong_ty} - Toàn công ty", 23 thành viên. Bạn có 30 giây để viết tin giao việc cho sáng mai._
_Thanh emoji: càng nhiều càng "gần gũi". Quá nhiều thì thành… sếp tấu hài._
* [📲 Viết ngắn gọn, 1 emoji.]
    giam_doc: Mai 9h họp nhanh chiến dịch nhé các em 🙏
* [🎉 Viết dài, 12 emoji, kèm "Anh không ép, tùy các em".]
    giam_doc: Mai 8h các em lên sớm nhé 🔥🔥🔥💪💪🌸🌸🩷🩷🩷🚀🚀 Anh không ép, tùy các em!
    ~ gd_so_lan_tuy_em = gd_so_lan_tuy_em + 1
- -> END

=== giam_doc_mg_nhan_22h_thanh_cong ===
# gio:22:05 # dieu_kien:minigame_nhan_22h_dat
_"Đã xem: 22". Rồi lần lượt: "Dạ" của {thuc_tap_sinh}. "Dạ anh" của {thanh_ninh}. "Dạ ok anh" của {truong_phong}. Và cả "Dạ" của {chi_dai}._
~ nghi(5)
~ gd_uy(3)
~ tien_cong(100000)
ke_toan: Em hoàn tiền điện thoại tháng này cho anh 100 nghìn. Có hóa đơn nhà mạng rồi.
_Sáng mai năng suất cả công ty +10%. Đêm nay bạn ngủ được 6 tiếng._
-> END

=== giam_doc_mg_nhan_22h_that_bai ===
# gio:22:05 # dieu_kien:minigame_nhan_22h_truot
_"Đã xem: 22". Không ai trả lời. Một phút. Năm phút. Mười lăm phút._
_Ở group bên kia, "Hội Anti Sếp", có 31 tin nhắn mới._
~ gd_uy(-3)
~ cang_thang(5)
{ gd_dung_clone:
    hong_hot: Ét o ét, 10 giờ đêm sếp lại giao việc kèm 12 cái emoji mấy bà ơi.
    ran_doc: Nói nhỏ thôi nha… chắc sếp cô đơn.
    _Câu đó trúng hơn mọi câu chửi._
}
-> END

// ============ ⌚ TIỆM CẦM ĐỒ CỨU NGUY (bán đồ cứu cánh) ============
=== giam_doc_mg_cam_do ===
# noi:tiem_cam_do # dieu_kien:het_tien_tui
_Tiệm cầm đồ Cứu Nguy, Phố Cũ. Ông chủ đeo dây chuyền vàng to bằng ngón tay, nhìn chiếc đồng hồ trên cổ tay bạn như nhìn con cá ngon._
chu_tiem_cam_do: Đồ này cầm được nhiêu đây thôi nha. Mười lăm triệu.
* {not gd_cam_dong_ho} [⌚ Tháo đồng hồ đặt lên quầy.]
    ~ gd_cam_dong_ho = true
    ~ tien_cong(15000000)
    _Cổ tay trái nhẹ hẳn. Bạn kéo tay áo sơ mi xuống thật thấp._
    { RANDOM(1, 10) <= 3:
        _Lúc ra cửa, bạn chạm mặt {dan_dau_tu} đang ôm cái laptop đi vào. Hai người nhìn nhau. Không ai nói gì._
        ~ gd_dong_ho_bi_thay = true
        ~ gd_no(10)
    }
* [🏌️ Cầm bộ gậy golf thay: "Gậy này hàng xịn đấy anh."]
    chu_tiem_cam_do: Gậy cong rồi. Ba triệu.
    ~ tien_cong(3000000)
    _Bạn nhớ lại cú hole-in-one. Thôi, cũng không cần nữa._
* [😶 Quay ra. Chưa tới mức đó.]
    ~ cang_thang(5)
- -> END
