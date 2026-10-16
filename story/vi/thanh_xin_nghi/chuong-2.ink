// ============================================================
// THÁNH XIN NGHỈ: SƠN · CHƯƠNG 2: "LƯƠNG CHƯA VỀ, LÝ DO ĐÃ HẾT" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_xin_nghi_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2. Ngày Nhà giáo Thế giới. Trên ghế bạn có một bông hồng nhung và tấm thiệp: "Kính tặng anh {thanh_xin_nghi}, người dạy em cách giữ lịch ạ. Em {thuc_tap_sinh}."_
_{thuc_tap_sinh} 30 tuổi, lớn hơn bạn 2 tuổi, gọi bạn là "anh". Bạn cũng gọi em ấy là "anh". Hai người "anh" nhau suốt 1 tháng mà chưa ai chịu thua._
thuc_tap_sinh: Dạ anh {thanh_xin_nghi}, em mới vô nên chưa biết, lịch Siêu Nhân Hồng mình ghi bằng bút gì ạ?
* [😇 "Bút chì anh {thuc_tap_sinh} ơi. Ổng đổi lịch dữ lắm."]
    thuc_tap_sinh: Dạ em ghi nhớ ạ! *(ghi vào sổ: "Bút chì. Anh {thanh_xin_nghi} dạy.")*
    ~ qh("thuc_tap_sinh", 5)
* [🤝 "Anh {thuc_tap_sinh}, sau này em có… việc gấp, anh giữ cuốn lịch giùm em được hông?"]
    thuc_tap_sinh: Dạ em làm liền ạ! Mà… việc gấp gì ạ?
    thanh_xin_nghi: Dạ… bà ngoại.
    thuc_tap_sinh: Dạ em hiểu ạ! *(rất nghiêm túc, rất cảm động)*
    ~ qh("thuc_tap_sinh", 8)
- _{giam_doc} bước vào, muộn 40 phút._
giam_doc: Tuần này Siêu Nhân Hồng chụp poster đầu tiên. Thứ 3. {thanh_xin_nghi}, lịch phải chuẩn từng phút. Anh không ép.
~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0610_poster_domino ===
# ngay:6 # gio:10:00 # noi:studio_tang_2 # bat_buoc
_Studio tầng 2. Buổi chụp poster đầu tiên. Đèn, phông hồng, {designer} cầm bảng màu, {chua_te_deadline} cầm ly cà phê._
_Giữa lúc đang tạo dáng, {sieu_nhan_hong} nhìn qua cửa sổ. Ngoài Đường Hóng, gần đầu Hẻm 69, xe chè của một bà cụ sụp bánh xuống ổ gà._
sieu_nhan_hong: Đợi anh 5 phút!
_{sieu_nhan_hong} chạy mất. 5 phút. 15 phút. 1 tiếng. Studio thuê theo giờ. Lịch quay chiều nay, lịch phỏng vấn mai, lịch thử đồ thứ 5… đổ như domino._
chua_te_deadline: SƠN! Ét o ét! Lịch cả tuần sập rồi!
* {son_khung_gio_giup_nguoi} [🔒 "Bình tĩnh. Khung giờ giúp người, em có chừa. Anh {thuc_tap_sinh}, cầm máy quay chạy theo ổng!"]
    thuc_tap_sinh: Dạ em chạy liền ạ!
    _{thuc_tap_sinh} chạy theo, quay được trọn cảnh {sieu_nhan_hong} đẩy xe chè của Bà Bảy ra khỏi ổ gà, rồi ngồi ăn ly chè bà mời bằng ống hút luồn qua mũ._
    ~ follow(20000)
    ~ qh("sieu_nhan_hong", 5)
    ~ uy_tin = uy_tin + 5
    _Chiều đó clip lên mạng. Lượt xem đuổi kịp mọi poster công ty từng làm._
* [📞 Gọi điện năn nỉ {sieu_nhan_hong} quay lại.]
    sieu_nhan_hong: *(thở hổn hển, miệng còn ngậm ống hút)* Bà đang mời anh ăn chè! Em đợi chút! Hợp đồng ghi rõ mà!
    ~ cang_thang(10)
* [😶 Ngồi xuống, mở cuốn lịch, bắt đầu xếp lại từ đầu.]
    _Bạn thở ra. Đây là nghề của bạn. Xếp hình. Khối nào rơi thì xếp lại._
- _Bạn mở bảng lịch tuần, chế độ khẩn cấp._
-> thanh_xin_nghi_mg_xep_lich_mo

// ------------------------------------------------------------
=== thanh_xin_nghi_0710_moc_1 ===
# ngay:7 # gio:16:00 # noi:phong_hop_sang_tao # bat_buoc
_Mốc 1: 50.000 người theo dõi. Tối nay 18:00 bạn có buổi tập thanh nhạc, buổi cuối trước vòng 2._
{ nguoi_theo_doi >= 50000:
    dan_dau_tu: Qua mốc! Lần này là lên thật!
    _Cả phòng vỗ tay. {giam_doc} cho về đúng giờ. Bạn chạy ra bãi xe lúc 17:31, kịp giờ tập._
    ~ son_mo(5)
    ~ son_di_lam()
    -> END
- else:
    giam_doc: Không đạt. Họp khẩn. Truyền lửa. 3 tiếng. Không ai về.
    _16:00 + 3 tiếng = 19:00. Buổi tập lúc 18:00. Bạn nhìn đồng hồ. Đồng hồ nhìn lại bạn._
}
* [🌫️ Bốc Hơi 5 Phút: xin đi vệ sinh, chạy ra bãi xe, gọi cô giáo dời sang 19:30.]
    { qh_bac_bao_ve >= 20:
        bac_bao_ve: *(đang tưới cây, không ngẩng lên)* Bác không thấy gì đâu.
        ~ son_mo(3)
    - else:
        bac_bao_ve: Cháu {thanh_xin_nghi}. Đi đâu thế? Họp chưa xong mà.
        ~ son_soi(10)
        _Bạn quay lại phòng họp. Buổi tập dời sang tuần sau._
        ~ son_mo(-5)
    }
* [🤝 Nhờ {quan_ly_idol} Che: nhắn {quan_ly_idol} nói đỡ "Sơn đi khảo sát địa điểm quay".]
    ~ qh("quan_ly_idol", -5)
    quan_ly_idol: *(nhắn lại)* Khảo sát địa điểm lúc 6 giờ tối? Thôi được, đi đi. Lần này thôi nha.
    ~ son_mo(5)
    ~ son_soi(5)
* [😇 Ngồi lại họp. Bỏ buổi tập.]
    ~ son_mo(-5)
    ~ son_soi(-5)
    ~ uy_tin = uy_tin + 3
    _3 tiếng truyền lửa. Lửa không thấy đâu. Chỉ có bạn ngồi nhẩm lời bài hát trong đầu, đánh nhịp bằng ngón chân dưới gầm bàn._
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0810_tap_hat_len ===
# ngay:8 # gio:12:15 # noi:studio_tang_2
_Giờ nghỉ trưa. Ngày Thị giác Thế giới. Anh {hr} dắt {editor} đi khám mắt. Phòng HR trống. Studio tầng 2 trống._
_Cơ hội vàng. Bạn lẻn vào studio, khép cửa, mở micro._
_Trên bàn mixer có một hộp cơm ai bỏ quên, còn nguyên._
* [🎙️ Tập hát. Canh tiếng bước chân ngoài cửa.]
    -> thanh_xin_nghi_mg_tap_hat_mo
* [🍱 Ăn hộp cơm trước đã. Hát bụng đói không ra hơi.]
    ~ an(40)
    _Cơm sườn. Ngon. Của ai đó. Bạn để lại tờ giấy: "Em nợ 1 hộp cơm. {thanh_xin_nghi}." Rồi xé đi, vì để tên là toang._
    -> thanh_xin_nghi_mg_tap_hat_mo

// ------------------------------------------------------------
=== thanh_xin_nghi_0910_mv_ra_mat ===
# ngay:9 # gio:20:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. 20 giờ, MV "Hồng Hóa Việt Nam" lên kênh Tóp-tóp và Diu-túp của công ty. Cả công ty ở lại, chen chúc trước màn chiếu phòng họp tầng 2._
_MV kết thúc bằng cảnh {sieu_nhan_hong} tạo dáng trước một quả trứng hồng khổng lồ. Không ai hiểu quả trứng. Ai cũng share._
_Điện thoại bạn rung trong túi. Tin nhắn từ chương trình:_
_"Thí sinh SƠN KIM TUYẾN: Vòng 2 ghi hình ngày 14/10 (thứ 4), có mặt lúc 7:30 tại Đài Tivi Hóng."_
_Thứ 4. Giờ hành chính. Bạn nhìn cuốn lịch bìa hồng: 14/10, Siêu Nhân Hồng quay quảng cáo Trâu Cụng lúc 9:00._
* [🗂️ Đổi Lịch: dời buổi quay Trâu Cụng sang chiều 15/10.]
    ~ follow(-5000)
    _Một khối lịch dịch sang phải. Gọn. Không ai để ý. Trừ việc 15/10 hình như có gì đó…_
    ~ son_soi(3)
* [😶 Để lịch như cũ. Tính sau.]
    _Tính sau là nghề của {chua_te_deadline}. Nhưng hôm nay bạn mượn tạm._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0910_xin_kham_mat ===
# ngay:9 # gio:13:45 # noi:phong_hr
_Chiều nay cô giáo thanh nhạc có một suất trống. Bạn cần 2 tiếng. Bạn gõ cửa phòng HR._
thanh_xin_nghi: Anh {hr} ơi… chiều nay em xin nghỉ, đi khám mắt chung với {editor} cho vui ạ. Hôm qua ảnh khám một mình, tội ảnh.
hr: {editor} khám hôm qua rồi em. Anh dắt đi mà.
* [🤧 "Dạ… thì… tái khám ạ! Bác sĩ dặn phải có người đi kèm!"]
    { RANDOM(1, 2) == 1:
        hr: *(nhìn bạn rất lâu)* Ừ. Đi đi. Nhớ mang cho {editor} hộp trà hoa cúc ảnh để quên.
        ~ son_xin_nghi()
        ~ son_mo(5)
        ~ tien_cong(-590000)
        _Được duyệt. Bạn đi tập 2 tiếng, ghé đưa hộp trà cho {editor}. {editor} đang ngủ, ôm hộp trà ngủ tiếp._
    - else:
        hr: Khám ở Khỏe Re hả em? Cô lễ tân ở đó nhắc em quá trời.
        ~ son_soi(10)
        ~ son_tin(-10)
        thanh_xin_nghi: Dạ… thôi em ở lại làm ạ.
    }
* [😇 "Dạ… thôi. Em nói xạo. Em ở lại làm ạ."]
    hr: *(ngạc nhiên)* Ừ… cảm ơn em nói thật.
    ~ son_soi(-8)
    ~ son_mo(-3)
    ~ qh("hr", 5)
    ~ son_di_lam()
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_0910_hieu_hoi_lich ===
# ngay:9 # gio:16:30 # noi:ban_dieu_phoi
_Bàn điều phối. {ran_doc} ghé qua, tay cầm hai ly trà sữa, cười rất ngọt._
ran_doc: {thanh_xin_nghi} ơi, tui mời ông ly trà sữa nè. Mà ông giữ lịch anh {sieu_nhan_hong} đúng hông? Tuần sau ảnh quay ở đâu vậy? Tui viết bản tin nội bộ, muốn đăng lịch cho mọi người cổ vũ.
_{ran_doc} vô làm mới 9 ngày, mà hỏi han ai cũng thân như quen 10 năm._
* [📅 "Đây nè, ông chụp lại đi." (Mở cuốn lịch)]
    ~ son_hieu_biet_lich = true
    ~ qh("ran_doc", 10)
    ~ nhan(tra_sua)
    ran_doc: Cảm ơn ông nha! Ông dễ thương ghê! *(chụp 4 tấm, rất nhanh)*
* [🤐 "Lịch nội bộ, tui không đưa được. Ông hỏi anh {quan_ly_idol} nha."]
    ran_doc: Ờ… ừ, đúng rồi. Tui hỏi vậy thôi chứ không có ý gì đâu. Trà sữa ông cứ uống nha.
    ~ nhan(tra_sua)
    ~ qh("ran_doc", -3)
    ~ qh("quan_ly_idol", 3)
* [💬 "Ông hỏi kỹ dữ. Bản tin nội bộ cần giờ đón xe luôn hả?"]
    ran_doc: *(cười, mắt không cười)* Tui làm kỹ lắm. Thôi tui đi nha.
    _Bạn nhìn theo. Lần sau bạn sẽ úp cuốn lịch xuống mỗi khi {ran_doc} đi ngang._
- ~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1010_tien_may_do ===
# ngay:10 # gio:10:00 # noi:nha_ven_do # bat_buoc
_Thứ 7, ngày 10. Ngày lương. Lương chưa về, ngân hàng "kiểm tra giao dịch lớn". Group Zola sôi sục._
_Bạn nhìn bộ đồ kim tuyến cũ trên móc. Rách một bên vai, bong một mảng kim tuyến to bằng bàn tay. Vòng 2 cần đồ mới. Thợ may báo giá: 1.200.000đ._
* [💰 Nhắn chị {ke_toan} xin ứng lương.]
    ke_toan: Ứng lương lúc lương chưa về? Em ứng cái gì? Mà ứng làm gì? Hóa đơn đâu em?
    thanh_xin_nghi: Dạ… may đồ… cho bà ngoại ạ.
    ke_toan: Bà ngoại em mặc size gì?
    _Bạn cúp máy. Không có hóa đơn là không có tiền._
    ~ son_tin(-5)
    -> thanh_xin_nghi_1010_tien_may_do.s_cach_khac
* [🤝 Qua nhà anh {quan_ly_idol} mượn tiền.]
    -> thanh_xin_nghi_1010_tien_may_do.s_nha_thai
* [🎤 Tối nay hát thêm một đêm ở Sống Ảo.]
    _Bạn nhắn chủ quán: "Tối nay em hát được không anh?" "Được, 8 giờ."_
    -> thanh_xin_nghi_mg_song_ao_mo
* [🎤 Mượn bộ vest kim tuyến cũ của anh {idol_het_thoi}. Ảnh còn cả tủ đồ 2015.]
    -> thanh_xin_nghi_1010_tien_may_do.s_vest_phat

= s_cach_khac
* [🤝 Qua nhà anh {quan_ly_idol} mượn tiền.]
    -> thanh_xin_nghi_1010_tien_may_do.s_nha_thai
* [🎤 Mượn bộ vest của anh {idol_het_thoi}.]
    -> thanh_xin_nghi_1010_tien_may_do.s_vest_phat

= s_nha_thai
_Studio 0905, chung cư Sky Ảo. Nhỏ gọn. 5 cục sạc dự phòng, 3 cái điện thoại đang sạc. Anh {quan_ly_idol} mở cửa, mắt thâm, tay cầm ly cà phê thứ tư._
quan_ly_idol: {thanh_xin_nghi}? Thứ 7 mà em tới nhà anh? Có chuyện gì? Bà ngoại hả?
thanh_xin_nghi: Dạ… anh cho em mượn 1 triệu 2. Lương về em trả liền.
quan_ly_idol: Ờ. Đợi anh. *(đi vào trong lấy ví)*
_Anh {quan_ly_idol} để ngăn kéo tủ đầu giường mở hé. Trong đó có một khung ảnh. Ảnh {idol_het_thoi} năm 2015, cầm micro, cười rạng rỡ. Lồng khung cẩn thận. Giấu kỹ._
~ son_thay_anh_phat = true
* [😶 Đẩy ngăn kéo lại nhẹ nhàng, như chưa thấy gì.]
    ~ qh("quan_ly_idol", 3)
    _Bạn biết lịch của tất cả mọi người. Giờ bạn biết thêm một điều không có trong lịch._
* [💬 "Anh {quan_ly_idol}… ảnh anh {idol_het_thoi} hả anh?"]
    quan_ly_idol: *(đóng ngăn kéo cái rầm)* Ảnh… ảnh tư liệu. Để làm hồ sơ nghệ sĩ. Em đừng nói lung tung.
    _Tai anh {quan_ly_idol} đỏ tới tận cổ._
    ~ qh("quan_ly_idol", -3)
- ~ tien_cong(1200000)
~ son_co_do_kim_tuyen = true
~ qh("quan_ly_idol", -5)
quan_ly_idol: Đây. Mà em mượn làm gì vậy?
thanh_xin_nghi: Dạ… để em kể sau anh. Hứa.
~ tien_cong(-1200000)
_Bạn đem thẳng tiền tới tiệm may. Bộ đồ mới sẽ xong trước 14/10._
-> END

= s_vest_phat
_Căn 1808, chung cư Sky Ảo. Tường đầy poster {idol_het_thoi} năm 2015. Một tủ quần áo toàn đồ sân khấu: vest kim tuyến, áo lông vũ, quần ống loe bạc._
idol_het_thoi: Em mượn đồ của anh làm gì? Em biết anh là ai không? Đây là bộ anh mặc đêm "Công Viên" lên top 1 đó!
* [😇 "Dạ biết anh. Em đi hát đám cưới bạn em, muốn mặc đồ của người nổi tiếng cho hên."]
    idol_het_thoi: *(mềm lại ngay)* Ờ… vậy thì được. Mà đừng làm rách nha. Bộ này có fan xin mua 10 triệu đó. *(không ai xin)*
    ~ qh("idol_het_thoi", 8)
* [🎤 "Anh {idol_het_thoi}… em đi thi hát. Em cần đồ đẹp."]
    idol_het_thoi: *(gỡ kính đen)* Thi hát? Em? *(nhìn bạn từ đầu tới chân)* …Lấy bộ bạc. Bộ đó ăn đèn hơn. Và đừng để ai biết, kẻo người ta ép em ký hợp đồng như anh.
    ~ qh("idol_het_thoi", 12)
    ~ son_mo(3)
- ~ son_muon_vest_phat = true
~ son_co_do_kim_tuyen = true
_Bộ vest hơi rộng vai, hơi mùi băng phiến 2015. Nhưng kim tuyến thì vẫn lấp lánh như đêm đó._
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1110_anh_hoi_nho ===
# ngay:11 # gio:19:00 # noi:nha_ven_do
_Chủ nhật. Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {sieu_nhan_hong} đăng ảnh một xóm nghèo tên Cây Me, có đứa nhỏ đứng góc đang khóc._
_Bạn lục album. Có một tấm: bạn 7 tuổi, đứng trên cái ghế đẩu giữa sân nhà bà ngoại, cầm cây chổi làm micro, bà ngồi vỗ tay._
* [📸 Đăng tấm đó. "Ca sĩ nhí của bà ngoại."]
    ~ son_tin(-5)
    ~ qh("hr", 3)
    _10 phút sau, anh {hr} thả tim. Rồi bình luận: "Bà ngoại em khỏe re ghê. Ảnh này chụp năm nào em?"_
    _Bạn nhìn bình luận, mồ hôi chảy ròng ròng dù trời mát._
    ~ son_soi(5)
* [📸 Đăng tấm khác: bạn 5 tuổi đang ngủ, không liên quan gì tới hát.]
    _An toàn. Không ai bình luận gì ngoài {hong_hot}: "Dễ thương ghê, giờ sao bị vậy?"_
* [😶 Không đăng gì. Ngồi hát cho tấm ảnh bà ngoại trên tường nghe.]
    _Bà cười trong khung ảnh, khỏe re như mọi ngày. Bạn tưởng tượng bà hỏi: "Hát hay vậy mà sao con đi làm văn phòng?"_
    ~ son_mo(3)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1210_luong_ve ===
# ngay:12 # gio:10:00 # noi:ban_dieu_phoi # bat_buoc
_Thứ 2. 10 giờ. Điện thoại cả văn phòng rung cùng lúc. Lương về. Tiếng thở phào to tới mức {cho} dưới sân sủa theo._
~ tinh_than_cong_ty = tinh_than_cong_ty + 5
~ cang_thang(-10)
_Bạn nhìn số dư. Trừ 1 ngày nghỉ không phép tháng trước, trừ 3 ngày phép âm. Còn ít hơn bạn tưởng._
{ son_co_do_kim_tuyen && not son_muon_vest_phat:
    _Trả anh {quan_ly_idol} 1.200.000đ trước đã._
}
* {son_co_do_kim_tuyen && not son_muon_vest_phat} [🤝 Chuyển khoản trả anh {quan_ly_idol} ngay, kèm "Em cảm ơn anh nhiều."]
    ~ qh("quan_ly_idol", 8)
    quan_ly_idol: *(nhắn lại)* Trả gì lẹ vậy. Mà em may đồ gì?
* [💰 Đóng học phí thanh nhạc tháng sau luôn.]
    ~ tien_cong(-300000)
    ~ son_mo(3)
* [😶 Để dành. Tháng này còn dài.]
    _Ngày 12 có lương, ngày 15 hết tiền. Bạn quyết tâm lần này ngày 16 mới hết._
- _Chiều đó, {hong_hot} đi từng bàn kể: 12 giờ 30 ở Cà Phê Sống Ảo, thẻ phụ của {con_ong_chau_cha} bị từ chối, rồi một cái thẻ lấp lánh rơi ra từ ví {thuc_tap_sinh}. Bạn nghe hết, gật gù, rồi quay về cuốn lịch. Bạn không phải {hong_hot}._
~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1210_lich_tuan ===
# ngay:12 # gio:14:00 # noi:ban_dieu_phoi
_Chiều. Bạn xếp lịch tuần cho Siêu Nhân Hồng. Thứ 4 (14/10): vòng 2 của bạn. Thứ 5: chưa có gì. Thứ 6 (16/10): gameshow "Hồng Hay Không Hồng" ở Đài Tivi Hóng._
_Đài Tivi Hóng. Cái đài bạn sẽ có mặt thứ 4 trong bộ đồ kim tuyến. Thứ 6 bạn lại phải tới, trong áo sơ mi, đi kèm {sieu_nhan_hong}._
quan_ly_idol: {thanh_xin_nghi}, thứ 6 em đưa {sieu_nhan_hong} lên đài từ sáng nha. Anh kẹt đám cưới của {idol_het_thoi} buổi sáng, trưa anh mới tới kịp giờ quay.
* [😅 "Dạ… dạ được anh."]
    _Hai lần trong một tuần, ở cùng một đài. Một lần là {thanh_xin_nghi} Kim Tuyến, một lần là {thanh_xin_nghi} Điều Phối. Bạn bắt đầu tập đi kiểu khác._
    ~ cang_thang(5)
* [🗂️ "Anh ơi, thứ 6 để anh {thuc_tap_sinh} đi được hông? Em… bị dị ứng đèn trường quay."]
    quan_ly_idol: Dị ứng đèn trường quay? Em làm điều phối nghệ sĩ bao nhiêu năm mà dị ứng đèn trường quay?
    ~ son_tin(-8)
    quan_ly_idol: Đi. Không bàn.
- ~ son_di_lam()
-> END
