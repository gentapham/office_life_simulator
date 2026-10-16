// ============================================================
// THỰC TẬP SINH · CHƯƠNG 2: "THẦY CÔ ƠI" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== thuc_tap_sinh_0510_tang_hoa ===
# ngay:5 # gio:07:50 # noi:tang_1 # bat_buoc
_Ngày Nhà giáo Thế giới. Bạn mua 12 bông hồng ở chợ Phố Cũ lúc 6 giờ sáng, mỗi bông gói giấy kraft, kèm thiệp viết tay: "Em cảm ơn thầy/cô đã dạy em."_
_Đi từng bàn. {editor} nhận hoa trong lúc ngủ. {designer} nhận, hỏi "thiệp này font gì vậy em?". Tới bàn {sales}, người nhỏ nhất công ty._
thuc_tap_sinh: Dạ em cảm ơn chị {sales} đã dạy em nhiều điều ạ.
sales: *(nhận hoa, vuốt tóc)* Tin chị đi, em có tương lai.
_{sales} 26 tuổi. Bạn 30. Cả phòng nhìn nhau ngại giùm. Chỉ có bạn và {sales} là không ngại._
~ tien_cong(-120000)
* [😇 "Dạ, ở đây chị là tiền bối mà chị."]
    sales: Đúng rồi! Em này biết điều! Mai chị dẫn em đi gặp "đối tác".
    ~ qh("sales", 8)
    ~ duy_ngo(3)
* [❓ "Dạ chị dạy em gì ạ? Để em ghi vào sổ."]
    sales: *(ngưng 2 giây)* … Dạy em… tự tin! Ừ, tự tin. Ghi đi.
    _Bạn ghi: "Bài học từ chị {sales}: tự tin." Bên dưới, bạn ghi thêm nhỏ xíu: "kể cả khi không có cơ sở"._
    ~ duy_kn(2)
    ~ qh("sales", 3)
- _Bông cuối cùng, bạn để trên bàn {truong_phong}. {truong_phong} nhìn bông hoa như nhìn một biên bản chưa được duyệt._
truong_phong: Cảm ơn cậu. Tớ… à, anh… à, cảm ơn.
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0510_giao_ban ===
# ngay:5 # gio:08:15 # noi:phong_hop_sang_tao # bat_buoc
truong_phong: Cậu {thuc_tap_sinh}, xếp ghế cho họp giao ban giúp tớ. 8 giờ 30 bắt đầu.
~ duy_day_viec(1)
~ duy_da()
thuc_tap_sinh: Dạ em làm liền ạ!
_Luật bất thành văn của phòng họp "Sáng Tạo": {chi_dai} không ngồi cạnh {thanh_ninh}. {truong_phong} không ngồi cạnh {con_ong_chau_cha}. {chua_te_deadline} phải ngồi chỗ {truong_phong} nhìn thấy. {cho} không được ở cùng phòng với Siêu Nhân Hồng._
-> thuc_tap_sinh_mg_xep_ghe_mo_dau

// ------------------------------------------------------------
=== thuc_tap_sinh_0610_hat_sang ===
# ngay:6 # gio:09:00 # noi:studio_tang_2 # bat_buoc
_Buổi chụp poster đầu tiên. Bạn cầm tấm hắt sáng tròn, to như cái nắp chảo. {designer} chỉ góc. {it} lo đèn._
designer: Em {thuc_tap_sinh}, giữ ánh sáng hắt lên mặt… à, lên mũ của anh Hồng. Ảnh đổi dáng là em đổi góc theo nha.
sieu_nhan_hong: Biến hình! *(dáng 1)* Vì công lý! *(dáng 2)* Và lượt view! *(dáng 3)*
_Mỗi giây một dáng. Tay bạn bắt đầu mỏi từ dáng thứ 9._
-> thuc_tap_sinh_mg_hat_sang_mo_dau

// ------------------------------------------------------------
=== thuc_tap_sinh_0610_chay_theo ===
# ngay:6 # gio:10:30 # noi:duong_hong_hem_69 # bat_buoc
_10 giờ 30. {sieu_nhan_hong} đang tạo dáng thứ 14 thì nhìn ra cửa sổ: dưới Đường Hóng, ngay đầu Hẻm 69, xe chè của Bà Bảy sụp một bánh xuống ổ gà._
sieu_nhan_hong: Điều khoản số 3! Hồng đi đây!
_Cả studio đứng hình. {quan_ly_idol} đang nghe điện thoại. {chua_te_deadline} đang tính lịch. Không ai chạy theo._
chua_te_deadline: Anh {thuc_tap_sinh}, chạy theo quay lại! Quay dọc cũng được!
~ duy_day_viec(1)
* [🏃 Cầm nguyên tấm hắt sáng chạy theo, quay bằng điện thoại.]
    ~ duy_da()
    _Bạn chạy xuống đường, một tay tấm hắt sáng, một tay điện thoại. Siêu Nhân Hồng đẩy xe chè ra khỏi ổ gà, Bà Bảy đứng bên cạnh cười móm mém, cô cháu gái bán chè nhìn bộ đồ hồng như vừa nghe thấy một giọng quen._
    _Mặt trời chiếu đúng vào tấm hắt sáng, hắt lên bộ đồ hồng. Ánh sáng đẹp như phim. Tay bạn rung như động đất._
    { RANDOM(1, 10) <= 6:
        _{hong_hot} đăng clip lên với caption "Chất thật. Không kịch bản." Clip nổ._
        ~ follow(15000)
        ~ duy_lua_doi(10)
        hong_hot: Ông thực tập sinh quay đó hả? Rung mà thật dữ vậy trời!
        ~ qh("hong_hot", 5)
    - else:
        _{hong_hot} đăng clip lên. Bình luận đầu tiên: "Ai quay mà như thực tập sinh vậy?". Bình luận thứ hai: "Mà cảm động thiệt."_
        ~ follow(5000)
        ~ duy_lua_doi(3)
    }
    ~ duy_kn(5)
    ~ nghi(-15)
* [🤝 Chạy theo, bỏ điện thoại, phụ đẩy xe.]
    _Bạn và Siêu Nhân Hồng cùng đẩy. Bà Bảy cho mỗi người một ly chè đậu. {sieu_nhan_hong} ăn bằng ống hút luồn qua mũ. Không ai quay được gì._
    sieu_nhan_hong: *(nói nhỏ, không tạo dáng)* Em… đẩy xe quen tay ghê.
    thuc_tap_sinh: Dạ… hồi trước có người đẩy xe giùm em. Trong mưa. 2 cây số. Em hông biết người đó là ai.
    _{sieu_nhan_hong} im lặng rất lâu. Bạn không thấy mặt sau cái mũ._
    ~ follow(3000)
    ~ qh("sieu_nhan_hong", 12)
    ~ duy_lua_doi(8)
* [😶 "Dạ em giữ hắt sáng ở đây, để lát anh Hồng về chụp tiếp ạ."]
    _Bạn đứng giữ tấm hắt sáng 30 phút, chĩa vào một cái ghế trống. {it} nhìn bạn, lắc đầu, đưa bạn cái ghế._
    ~ duy_ngo(5)
    ~ qh("it", 3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0710_photo_300_trang ===
# ngay:7 # gio:17:25 # noi:tang_1 # bat_buoc
_Mốc 1 vừa qua (hoặc vừa trượt, tùy con số của {hong_hot}). 17 giờ 25. Bạn đang thu dọn balo._
chua_te_deadline: Anh {thuc_tap_sinh} ơi, em nhờ xíu. Anh photo giùm em 300 trang kịch bản, xếp ghế phòng họp, rồi chạy ra mua bánh chuối chiên cho anh Hồng nha. Chill, kịp hết. # hen_gio:5
* [🙇 "Dạ em làm liền ạ!"]
    ~ duy_da()
    ~ duy_day_viec(3)
    ~ duy_kn(5)
    ~ nghi(-30)
    ~ qh("chua_te_deadline", 5)
    _Bạn về tới Hẻm 69 lúc 21 giờ. 3 bạn cùng phòng đã ăn hết mì. Tháp mì gói thấp đi 4 tầng._
* [❓ "Dạ 300 trang này ai đọc vậy anh?"]
    chua_te_deadline: *(khựng lại)* …Ờ ha. Thôi photo 3 trang đầu thôi.
    ~ duy_day_viec(2)
    ~ nghi(-10)
    ~ duy_ngo(-3)
    ~ duy_kn(3)
* {duy_mo_noi_loan} [😤 "Dạ hôm nay em xin phép không ạ. Anh tự làm một việc, em làm hai việc."]
    ~ duy_so_lan_noi_loan++
    { RANDOM(1, 10) <= 6:
        chua_te_deadline: *(nhìn bạn 3 giây)* … Ok. Công bằng. Em đi mua bánh.
        ~ qh("chua_te_deadline", 5)
    - else:
        chua_te_deadline: Ờ… ok anh.
        _Sáng hôm sau, {truong_phong} gọi bạn ra: "Nghe nói thực tập sinh dạo này lạ lắm."_
        ~ qh("truong_phong", -5)
    }
    ~ duy_lua_doi(5)
* [⏱️ (Không chọn kịp)]
    _{chua_te_deadline} đã đặt xấp giấy lên bàn và đi mất._
    ~ duy_da()
    ~ duy_day_viec(3)
    ~ duy_kn(5)
    ~ nghi(-30)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0810_kham_mat ===
# ngay:8 # gio:14:00 # noi:phong_kham_khoe_re
_Ngày Thị giác Thế giới. {truong_phong} cử bạn dẫn {editor} đi khám mắt "vì cậu ấy sẽ trốn"._
_Phòng khám Khỏe Re. Bác sĩ soi mắt {editor}, rồi tháo kính, thở dài._
editor: *(ngáp)* Bác sĩ nói mắt tui như mắt người 60 tuổi. Cấm nhìn màn hình 3 ngày. Mà tối nay phải dựng MV.
* [🤝 "Dạ để em ngồi bấm, anh chỉ em ạ."]
    editor: Ông… à, anh… à, em biết dựng hả?
    thuc_tap_sinh: Dạ em mới biết phím C là cắt ạ.
    editor: *(cười một tiếng)* Đủ rồi. Tối nay tui nhắm mắt chỉ, ông bấm.
    _Đêm đó bạn ngồi phòng dựng tới 3 giờ sáng. {editor} nhắm mắt, đọc từng khung hình theo trí nhớ. Bạn bấm. Lần đầu bạn hiểu dựng phim là gì._
    ~ duy_kn(10)
    ~ duy_lua_doi(8)
    ~ qh("editor", 10)
    ~ nghi(-30)
* [😶 "Dạ, anh nghỉ đi ạ. Để em báo anh {truong_phong}."]
    editor: Báo ổng thì ổng họp. Thôi để tui báo {chua_te_deadline}.
    ~ qh("editor", 3)
* [🏦 Đọc kỹ hóa đơn phòng khám, phát hiện tính trùng 2 lần phí soi đáy mắt.]
    _Bạn đọc hóa đơn trong 3 giây. "Dạ cô ơi, mục 4 với mục 7 là một ạ." Cô thu ngân sửa, trả lại 180 nghìn._
    editor: Ông… đọc hóa đơn nhanh dữ vậy?
    ~ duy_lo(10)
    ~ qh("editor", 5)
    ~ duy_ngo(-5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0910_share_mv ===
# ngay:9 # gio:20:00 # noi:hem_69 # bat_buoc
_20 giờ. MV "Hồng Hóa Việt Nam" vừa lên Tóp-tóp và Diu-túp của công ty. Bạn là người share đầu tiên, 37 giây sau khi {hong_hot} đăng._
_Caption của bạn: 400 chữ. Kể về buổi chụp poster, về tấm hắt sáng, về xe chè của Bà Bảy, về "lần đầu em thấy một người tốt mặc đồ hồng". Kết thúc bằng: "6-7"._
hong_hot: Ông thực tập sinh ơi, caption của ông được nhiều like hơn bài gốc của tui nè!
* [😇 "Dạ em viết thật lòng thôi ạ."]
    ~ follow(5000)
    ~ duy_lua_doi(5)
    hong_hot: Thật lòng là trend đó ông! Mai viết tiếp nha!
    ~ qh("hong_hot", 5)
* [❓ "Dạ 6-7 nghĩa là gì vậy chị? Em thấy các bạn trẻ hay ghi."]
    hong_hot: Ối dồi ôi, ông ghi mà hông biết nghĩa hả? Nó… nó hông có nghĩa! Hay ở chỗ đó!
    _Bạn gật gù, ghi vào sổ: "6-7: không có nghĩa. Hay ở chỗ đó."_
    ~ follow(3000)
    ~ duy_ngo(3)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0910_ngay_trung ===
# ngay:9 # gio:12:05 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. Bạn mua một đĩa trứng luộc 15 nghìn, ngồi góc._
_{con_ong_chau_cha} đi ngang, áo sơ mi linen màu be, quần kaki xắn gấu, giày lười không vớ. Bạn nhìn bộ đồ đó như nhìn một bức tranh._
con_ong_chau_cha: Chill. Ăn trứng hả anh {thuc_tap_sinh}? Ủa sao không gọi món khác?
* [👔 "Dạ anh mặc đồ đẹp quá. Em xin link mua được hông ạ?"]
    con_ong_chau_cha: Link? Anh… mua ở tiệm. Mà anh thấy anh mặc chắc cũng hợp. Mai mặc thử coi.
    ~ qh("con_ong_chau_cha", 5)
    ~ duy_ngay_mac_giong_long++
* [🥚 "Dạ hôm nay căn tin chỉ có trứng ạ. Anh ăn chung hông ạ?"]
    con_ong_chau_cha: Trứng… *(ngồi xuống, ăn một quả)* Ừ. Ngon. Lâu rồi anh chưa ăn đồ căn tin.
    ~ qh("con_ong_chau_cha", 8)
- ~ an(35)
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_0910_may_bien_kich ===
# ngay:9 # gio:16:20 # noi:pantry
_16 giờ 20. Pantry vắng. Laptop của {bien_kich} mở trên bàn, chủ nhân ra sân thượng "lấy cảm hứng"._
_Bạn đi ngang, liếc màn hình. Một file tên "NguoiHungKhongTen_ban9.docx". Dòng đầu: "Cảnh 1. Một trưởng phòng tín dụng ngồi trong phòng kính, sinh nhật 30 tuổi…"_
{ duy_biet_y_tuong_bi_lay:
    _Bạn đã biết từ hôm họp. Nhưng tận mắt thấy chữ thì khác. Như nhìn thấy nhà mình trong ảnh rao bán._
- else:
    _Đó là ý tưởng của bạn. Từng chi tiết. Cả cái phòng kính. Cả sinh nhật 30 tuổi. Bạn kể với {bien_kich} ở đúng cái pantry này, tháng 9._
}
~ duy_biet_y_tuong_bi_lay = true
~ duy_lua_doi(-15)
* [😶 Đóng nắp laptop lại giùm, như chưa thấy gì.]
    _Bạn đóng laptop nhẹ nhàng. Ra máy in, in 300 trang không ai đọc. Tay bạn run._
    ~ cang_thang(15)
* [📸 Chụp lại màn hình bằng điện thoại.]
    _Một bức ảnh. Có ngày giờ. Theo thói quen của người từng lưu hồ sơ 8 năm: không có bằng chứng thì không có gì._
    ~ duy_kn(3)
    ~ duy_ngo(-5)
* [❓ Đợi {bien_kich} quay lại: "Dạ chị ơi, phim này giống ý em kể hồi tháng 9 ghê ạ."]
    bien_kich: *(đứng sững ở cửa)* … Giống hả? Ý tưởng thì ai cũng giống ai. Đây không phải đạo, đây là cảm hứng.
    _{bien_kich} gập laptop, đi ra. Đi hơi nhanh._
    ~ qh("bien_kich", -10)
    ~ duy_ngo(-5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1010_sinh_nhat_bac_binh ===
# ngay:10 # gio:16:00 # noi:chong_bao_ve
_Thứ 7, ngày 10. Lương chưa về, vì ngân hàng "kiểm tra giao dịch lớn". Theo kinh nghiệm 8 năm, bạn biết câu đó thường nghĩa là: tài khoản của ai đó đang có vấn đề._
_Nhưng bạn ghé công ty vì chuyện khác. Tuần trước, photo hồ sơ nhân sự cho {hr}, bạn thấy ngày sinh của Bác {bac_bao_ve}: 10/10/1976. Hôm nay bác tròn 50. Không ai biết._
_Bạn cầm một hộp bánh bông lan nhỏ, cắm một cây nến._
bac_bao_ve: *(nhìn cây nến rất lâu)* … Sao cháu biết?
* [😇 "Dạ, hôm photo hồ sơ em thấy ạ. Em chúc bác sinh nhật vui ạ."]
    bac_bao_ve: *(thổi nến, rất nhẹ)* Cả công ty… có mỗi một người nhớ ngày này. Mà người đó ở xa lắm.
    _Bác không nói người đó là ai. Bạn không hỏi. Hai người ngồi ăn bánh, nghe radio kể chuyện Hà Nội ngày Giải phóng Thủ đô._
    ~ qh("bac_bao_ve", 20)
    ~ duy_lua_doi(5)
* [🤫 "Dạ em hông nói ai đâu bác. Bánh này của bác với {cho} thôi."]
    bac_bao_ve: Ừ. *(cắt một miếng cho {cho})* Cháu kín miệng. Tốt.
    cho: Gâu! *(ăn bánh, dính kem lên mũi)*
    ~ qh("bac_bao_ve", 15)
    ~ qh("cho", 5)
- bac_bao_ve: Lương chưa về à cháu? Có đủ tiêu không?
* [😶 "Dạ em còn đủ ăn mì tới thứ 2 ạ."]
    bac_bao_ve: Mì. Ừ. Hồi bác mới vào đây cũng ăn mì.
* [🏦 "Dạ… lương trễ này là do ngân hàng giữ lệnh, chắc tài khoản công ty bị gắn cờ vì một khoản vay nào đó ạ."]
    bac_bao_ve: *(đặt ly trà xuống)* Cháu biết những chuyện ấy à?
    thuc_tap_sinh: Dạ… em đọc báo ạ.
    _Bác nhìn bạn. Bác không nói gì. Nhưng bạn có cảm giác bác vừa ghi nhớ điều gì đó, rất cẩn thận._
    ~ duy_lo(5)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1110_chuong_muon_tien ===
# ngay:11 # gio:10:00 # noi:hem_69
_Chủ nhật, ngày 11. Ngày Quốc tế Trẻ em gái, cả công ty đăng ảnh hồi nhỏ. Bạn đăng ảnh 8 tuổi ngồi trước tivi viết lại cái kết phim bộ._
_Tiếng gõ cửa phòng 12. {dan_dau_tu}, dép lê, áo thun "To The Moon", tay cầm điện thoại mở chart._
dan_dau_tu: {thuc_tap_sinh} ơi, cho anh mượn thêm 2 triệu. Bằng nửa lương em thôi mà. Thứ 2 anh trả gấp đôi, coin này lần này là lên thật.
_Bạn nhớ: anh {dan_dau_tu} còn nợ bạn 500 nghìn từ tháng 9. Chưa nhắc tới._
_Bạn nhìn cái chart trên điện thoại. 3 giây. Bơm, giữ, chuẩn bị xả. Bạn đã thấy cái hình này trong 40 hồ sơ lừa đảo._
* [🙇 "Dạ… em hông có 2 triệu. Em mời anh tô hủ tiếu đầu hẻm nha."]
    ~ tien_cong(-35000)
    ~ duy_muon_chuong = true
    dan_dau_tu: *(ăn sạch tô)* Em là nguồn vốn tiềm năng! Anh ghi tên em vào danh sách rồi!
    _Danh sách đó tên là "Nguồn vốn tiềm năng". Bạn đứng thứ 9, với 500 nghìn từ tháng 9. Tám người trước chưa ai được trả._
    ~ duy_lua_doi(-3)
* [😶 "Dạ em còn có 300 nghìn để ăn tới ngày 12 thôi anh."]
    dan_dau_tu: Ờ… vậy thôi. Thông cảm, thông cảm. Ra đầu hẻm anh mời ly trà đá.
    ~ duy_ngo(5)
    ~ uong(15)
    ~ qh("dan_dau_tu", 3)
* [🧮 "Dạ anh ơi, cái chart này là mô hình bơm xả, nến đỏ tuần sau là sập đó anh."]
    dan_dau_tu: *(sững người)* … Sao em biết?
    thuc_tap_sinh: Dạ… em xem video trên Tóp-tóp ạ.
    ~ duy_lo(15)
    ~ duy_chuong_coi_la_thay = true
    _{dan_dau_tu} nhìn bạn rất lâu, rồi nhìn cái chart, rồi lại nhìn bạn. Rồi vẫn quyết định không tin._
* {duy_kinh_nghiem >= 20} [🔒 "Dạ em hông cho mượn thêm. Mà khoản 500 nghìn cũ, mình làm giấy, trả góp 5 tuần, mỗi tuần 100 nghìn nha anh."]
    _Bạn lấy giấy, viết một hợp đồng 1 trang cho khoản 500 nghìn, rõ ràng tới mức {dan_dau_tu} đọc 2 lần. Có điều khoản. Có chữ ký. Có cả lịch trả._
    dan_dau_tu: Em… em làm cái này như dân chuyên nghiệp vậy?
    thuc_tap_sinh: Dạ em học trên mạng ạ.
    ~ duy_muon_chuong = true
    ~ duy_tin_dung_hem_69 = true
    ~ duy_lo(10)
    ~ duy_kn(5)
    ~ qh("dan_dau_tu", 10)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1210_giao_ban ===
# ngay:12 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2. Họp giao ban. Lương vẫn chưa về. {truong_phong} hỏi cả phòng ý tưởng nội dung mới cho tuần gameshow._
_Bạn có một ý: "24 Giờ Giúp Người". Siêu Nhân Hồng livestream một ngày đi giúp người thật, không kịch bản. Bạn nghĩ ra từ hôm chạy theo xe chè Bà Bảy._
{ duy_oanh_nghe_truoc:
    _Nhưng tối qua, ở pantry, bạn lỡ kể ý này với {bien_kich}…_
}
truong_phong: Có ai có ý gì không? Đừng ngại.
* {duy_do_ngo <= 60} [💬 Đứng dậy: "Dạ em có một ý ạ. '24 Giờ Giúp Người'."]
    { duy_oanh_nghe_truoc:
        bien_kich: *(chen ngang)* À, tui cũng đang định nói ý này! "24 Giờ Giúp Người". Tui nghĩ ra từ tối qua.
        _Cả phòng vỗ tay cho {bien_kich}. Bạn đứng đó, nửa người đã đứng dậy._
        ~ duy_lua_doi(-15)
    - else:
        truong_phong: *(ghi chép rất nhanh)* … Hay. Hay thật. Tớ duyệt. Cậu viết đề xuất chi tiết cho tớ trước thứ 4.
        _Lần đầu tiên tên bạn được ghi lên bảng trắng phòng họp, cạnh một ý tưởng._
        ~ duy_y_tuong_24h = true
        ~ follow(20000)
        ~ duy_kn(10)
        ~ duy_lua_doi(15)
        ~ qh("truong_phong", 10)
    }
* [😶 Ngồi im. "Dạ em mới vô nên chưa biết ạ."]
    _Ý tưởng nằm yên trong cuốn sổ của bạn, trang 34, cạnh hình vẽ một cái két sắt có cánh._
    ~ duy_ngo(3)
* [🙈 Viết ý tưởng lên giấy, đưa nhờ {chua_te_deadline} nói giùm.]
    chua_te_deadline: *(đọc, gật gù, đứng dậy)* Em có ý này, "24 Giờ Giúp Người"…
    truong_phong: Hay! {chua_te_deadline} lần đầu có ý tưởng trước hạn!
    _Ý tưởng được duyệt. Tên trên bảng trắng là {chua_te_deadline}. {chua_te_deadline} quay lại nhìn bạn, hơi ngại._
    ~ follow(20000)
    ~ duy_lua_doi(-5)
    ~ qh("chua_te_deadline", 5)
- _10 giờ, giữa cuộc họp, điện thoại cả phòng rung cùng lúc. "Tài khoản của quý khách vừa được cộng…". Lương về._
~ tien_cong(4000000)
_4 triệu. Bạn nhìn con số, rồi nhìn quanh. Mọi người reo như ghi bàn. Bạn cũng reo theo. Thật lòng._
-> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1210_the_kim_cuong ===
# ngay:12 # gio:12:30 # noi:quan_ca_phe_song_ao # bat_buoc
_12 giờ 30, Cà Phê Sống Ảo. {con_ong_chau_cha} dẫn bạn, {ran_doc} và {hong_hot} đi ăn trưa mừng lương, "anh bao". Tới lúc tính tiền, thẻ phụ của {con_ong_chau_cha} bị từ chối. Hai lần._
con_ong_chau_cha: Ủa? Để anh gọi chú anh…
_{giam_doc} không nghe máy. Hóa đơn 420 nghìn. Cả bàn im lặng. Theo phản xạ, tay bạn đã rút ví. Cái thẻ lấp lánh ló ra một góc._
hong_hot: Ủa… thẻ gì mà lấp lánh vậy ông {thuc_tap_sinh}?
* [💳 Quẹt luôn. "Dạ… thẻ tích điểm ạ, có hoàn tiền ạ."]
    _"Tít." Quản lý quán chạy ra, cúi chào: "Dạ cảm ơn quý khách hạng kim cương ạ."_
    _Cả bàn nhìn bạn. Không ai nói gì. {hong_hot} đặt ly cà phê xuống rất chậm._
    ~ duy_lo(25)
    ~ qh("con_ong_chau_cha", 10)
    con_ong_chau_cha: Chill… cảm ơn anh. Mà… anh là ai vậy?
* [😶 Nhét thẻ vào lại. "Dạ thẻ tích điểm siêu thị ạ. Mình chia đều đi ạ."]
    _Cả bàn chia đều. Mỗi người 105 nghìn. Không ai tin đó là thẻ tích điểm. Nhưng không ai hỏi tiếp, vì hóa đơn vẫn nằm đó._
    ~ tien_cong(-105000)
    ~ duy_lo(10)
* [🍜 Ăn một gói mì tôm sống cho mọi người thấy (Mì gói trước mặt mọi người).]
    _Bạn rút từ balo ra một gói mì, bẻ ăn sống, giòn rụm. Cả bàn quên luôn cái thẻ. Người đàn ông ăn mì sống thì không thể là đại gia._
    ~ duy_lo(-5)
    ~ duy_ngo(5)
    ~ tien_cong(-105000)
- -> END

// ------------------------------------------------------------
=== thuc_tap_sinh_1210_quan_net ===
# ngay:12 # gio:21:00 # noi:quan_net_go_phim
_Tối. Quán net Gõ Phím. Máy số 15. Máy số 14 là {it}, vẫn tai nghe, vẫn mì ly._
it: *(không quay sang)* Thẻ kim cương hả. Hôm nay cả công ty nói.
* [😰 "Dạ… dạ thẻ tích điểm thôi anh."]
    it: Ừ. *(ăn mì)* Log quẹt thẻ ở nhà hàng gửi về email công ty. Anh đọc hết log.
    _{it} nói xong là thôi. Không hỏi. Không kể ai. Bạn chợt thấy an toàn lạ lùng._
    ~ qh("it", 5)
* [🤝 "Anh {it}… anh giữ giùm em nha."]
    it: Anh giữ bí mật của 14 người rồi. Thêm một.
    ~ qh("it", 10)
* [🖥️ "Dạ anh chỉ em thêm phím tắt dựng phim được hông ạ?"]
    it: J, K, L. Lùi, dừng, tiến. Tập đi.
    ~ duy_kn(5)
    ~ qh("it", 3)
- -> END
