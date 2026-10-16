// ============================================================
// HR: TUẤN · CHƯƠNG 2: "TUYỂN NGƯỜI CHĂM SIÊU NHÂN" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== hr_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp giao ban đầu tuần. Ngày Nhà giáo Thế giới. Trên mỗi ghế có một bông hồng nhung và một tấm thiệp viết tay._
_Thiệp của bạn ghi: "Kính tặng thầy {hr}, người dạy em cách cười ạ. Em {thuc_tap_sinh}."_
thuc_tap_sinh: Dạ, hôm nay Ngày Nhà giáo ạ. Ai trong phòng cũng là thầy cô của em hết ạ.
* [😇 "Cảm ơn em. Nhưng em lớn tuổi hơn nửa phòng này đó {thuc_tap_sinh}."]
    thuc_tap_sinh: Dạ… tuổi đời không bằng tuổi nghề ạ!
    ~ qh("thuc_tap_sinh", 5)
* [😊 Cười, cài bông hồng lên túi áo.]
    ~ hr_so(2)
    hong_hot: *(nói nhỏ)* Ổng cài hoa kìa… như đi đám tang.
- _{giam_doc} bước vào, muộn 40 phút, tay cầm ly cà phê to bằng cái xô._
giam_doc: {hr}! Việc gấp. Mới ký hợp đồng 5 ngày mà Siêu Nhân Hồng trễ 3 buổi hẹn rồi. Anh cần một người chuyên chăm Siêu Nhân Hồng: giữ lịch, nhắc giờ, chịu được màu hồng, không bị chó cắn.
giam_doc: Cuối tuần này có người. Anh không ép, tùy em.
truong_phong: Em đề xuất mình họp thêm một buổi về tiêu chí tuyển dụng ạ.
giam_doc: Không! Họp ít thôi {truong_phong}!
_{truong_phong} ghi chú: "Họp về việc họp ít." Cả phòng nhìn nhau._
* [📋 "Dạ, em mở phỏng vấn từ chiều nay."]
    ~ qh("giam_doc", 5)
    ~ uy_tin = uy_tin + 2
* [💬 "Anh ơi, vậy mình có ngân sách lương cho vị trí này không?"]
    giam_doc: Có! Ngân sách là… em hỏi {ke_toan} nhé.
    ke_toan: Không có.
    giam_doc: Đấy, có câu trả lời rồi. Lương thử việc 85%, 85% của bao nhiêu thì tính sau.
    ~ qh("ke_toan", 3)
- -> END

// ------------------------------------------------------------
=== hr_0510_ung_vien_dau_tien ===
# ngay:5 # gio:14:00 # noi:phong_hr
_Hộp thư HR: {hr_dang_tin_tuyen_dung:3.000 hồ sơ, 2.900 cái là ảnh chế. Bạn lọc ra được 5 người thật.|47 hồ sơ. Bạn lọc ra được 5 người thật.}_
_Ứng viên số 1 bước vào, đeo 7 cái đồng hồ trên hai cổ tay._
phu_ung_vien_1: Dạ em chào anh! Em đúng giờ lắm ạ. Em có 7 cái đồng hồ, mỗi cái chỉnh nhanh 5 phút.
hr: Vậy giờ thật là mấy giờ em?
phu_ung_vien_1: Dạ… *(nhìn 7 cái đồng hồ, mặt tái dần)* Dạ cái đó em chưa tính tới ạ.
_Ứng viên số 2 là một người mặc áo khoác giao hàng, mũ bảo hiểm chưa tháo._
phu_shipper_teo: Hàng tới rồi, ra lấy giùm em! À lộn, em đi phỏng vấn. Em tên Tèo. Giao hàng cho công ty anh 3 năm rồi, đường nào em cũng rành.
_Dưới sân, nghe tiếng xe Tèo, {cho} bắt đầu sủa như báo động cháy._
* [💬 "Em có sợ chó không Tèo?"]
    phu_shipper_teo: Dạ hông sợ! Mà… *(nghe tiếng sủa, rụt cổ)* …con này thì hơi sợ.
* [🍵 Mời cả hai uống trà rồi hỏi tiếp.]
    ~ hr_tra()
    _Ứng viên số 1 uống trà, xin phép đi vệ sinh, rồi không quay lại. Ứng viên số 2 uống hết ly, xin luôn cái ly mang về. Bạn ghi chú: "Thật thà."_
- _Còn 3 ứng viên nữa trong tuần. Bạn đánh dấu hồ sơ, pha thêm một ấm trà._
-> hr_mg_phong_van_mo

// ------------------------------------------------------------
=== hr_0610_vu_chay_toi ===
# ngay:6 # gio:11:00 # noi:phong_hr # bat_buoc
_Cửa phòng HR bật mở. {chua_te_deadline} đứng đó, thở hồng hộc, tóc dựng như vừa bị điện giật._
chua_te_deadline: Anh {hr}! Ổng bỏ đi rồi! Đang chụp poster thì thấy xe chè của Bà Bảy sụp ổ gà ngoài Đường Hóng, ổng bỏ ngang luôn! Studio thuê theo giờ đó anh!
chua_te_deadline: Anh tuyển giùm em người nào giữ được ổng đi! Em lạy anh!
_{chua_te_deadline} đứng trong phòng HR. Lần đầu tiên có người tự vào phòng HR mà không bị mời._
* [🍵 "Ngồi xuống, uống ly trà bạc hà cho hạ hỏa đã em."]
    ~ hr_tra()
    ~ hr_nghe(5)
    _{chua_te_deadline} uống. Rồi kể. Về buổi chụp, về {truong_phong} gọi 14 cuộc, về việc em sợ mình làm hỏng mọi thứ._
    chua_te_deadline: …Mà anh đừng ghi sổ nha. Em chỉ than thôi.
    hr: Anh không ghi.
    ~ qh("chua_te_deadline", 10)
    ~ hr_so_nguoi_tu_len = hr_so_nguoi_tu_len + 1
* [📓 "Buổi chụp trễ là trách nhiệm điều phối dự án đó em."]
    ~ hr_so(5)
    ~ qh("chua_te_deadline", -10)
    chua_te_deadline: Ok mom. *(quay đi)* Biết vậy hông lên.
* [💬 "Bà cụ đó sao rồi em?"]
    chua_te_deadline: Hả? À… ổng đẩy xe chè lên khỏi ổ gà, rồi ngồi ăn chè bằng ống hút luồn qua mũ. Có người quay clip lại. *(mở điện thoại)* Ủa… sao nó lên cả chục ngàn view rồi?
    _Clip giúp bà cụ đang lan nhanh hơn mọi poster công ty từng làm._
- -> END

// ------------------------------------------------------------
=== hr_0610_ung_vien_so_4 ===
# ngay:6 # gio:15:00 # noi:phong_hr
_Ứng viên số 4 bước vào, mặc nguyên bộ đồ siêu nhân màu xanh lá chuối. Có mùi nước hoa gì đó rất… lá chuối._
phu_ung_vien_4: Dạ em chào anh. Em rất yêu màu hồng. Em có 3 năm kinh nghiệm chăm sóc siêu nhân. Trước em làm bên… à thôi.
_Màu xanh lá chuối là màu nhận diện của LL-Entertainment. Cả Quận Hóng ai cũng biết._
* [☕ "Em uống trà gì? Anh có 40 loại."]
    ~ hr_tra()
    ~ hr_so(5)
    _Ứng viên run tay, làm đổ nửa ly trà gừng ra bàn._
    phu_ung_vien_4: Dạ… dạ em khai! Bên kia cử em qua để ghi lịch trình của Siêu Nhân Hồng! Em xin lỗi! Đừng mời em uống trà nữa!
    ~ hr_bat_gian_diep = true
    ~ qh("giam_doc", 15)
    _Ứng viên chạy mất, bỏ lại một tấm danh thiếp màu xanh lá chuối. Bạn gửi lên phòng giám đốc._
* [😊 "Em được nhận. Mai đi làm luôn nha."]
    ~ hr_nhan_gian_diep = true
    phu_ung_vien_4: Dạ em cảm ơn anh! *(cười rất tươi, rất… xanh)*
* [🔍 "Bộ đồ xanh lá chuối đẹp ghê. Em may ở đâu vậy?"]
    phu_ung_vien_4: Dạ… em… may ở… *(đứng dậy cúi chào)* Em xin phép, em có hẹn ạ.
    _Không bắt được, nhưng cũng không bị cài người._
- -> END

// ------------------------------------------------------------
=== hr_0710_moc_1 ===
# ngay:7 # gio:16:00 # noi:phong_hop_sang_tao # bat_buoc
_Mốc 1: 50.000 người theo dõi. Cả công ty dán mắt vào màn hình của {dan_dau_tu}._
{ nguoi_theo_doi >= 50000:
    -> hr_0710_moc_1.s_dat
- else:
    -> hr_0710_moc_1.s_truot
}

= s_dat
dan_dau_tu: Đây rồi! Qua mốc! Biểu đồ xanh lè! Lần này là lên thật!
_Cả phòng vỗ tay. {giam_doc} ôm {sieu_nhan_hong}, {sieu_nhan_hong} ôm {chua_te_deadline}, {chua_te_deadline} đứng đơ như cột điện._
giam_doc: {hr}, tối nay em lo liên hoan nhé. Ngân sách…
ke_toan: Không có.
* [🍵 "Dạ, em pha trà cho cả công ty. Miễn phí."]
    ~ hr_tra()
    ~ hr_so(-3)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
    hong_hot: Trà của HR mà miễn phí là thấy sợ rồi á. Mà thôi, uống!
* [🤝 "Dạ, mỗi người góp 50.000, em bù phần còn lại."]
    ~ tien_cong(-200000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ hr_nghe(3)
    _Bạn bù 200.000đ. Tối đó cả công ty ăn ốc. Không ai biết HR bỏ tiền túi._
- _Tối về, bạn mở tập hồ sơ hồng ra nhìn. Chiến dịch đạt mốc, danh sách nhẹ đi một chút._
~ hr_ds(-1)
-> END

= s_truot
dan_dau_tu: *(nhìn chart)* Ờ… đây là đáy. Đáy thật rồi. Cắt lỗ là thua.
giam_doc: Không đạt. Họp khẩn. Truyền lửa. 3 tiếng. Không ai về.
_3 tiếng sau, lửa chưa thấy đâu, chỉ thấy khói từ cái máy chiếu cũ._
giam_doc: *(nói nhỏ khi đi ngang bạn)* {hr}. Cái danh sách ấy. Em bắt đầu nghiêm túc đi nhé.
~ hr_ds(1)
~ cang_thang(10)
* [😶 "Dạ."]
    _Bạn về phòng. Ô số 1, số 2 trong tập hồ sơ hồng vẫn trống. Bạn viết một tên bằng bút chì. Rồi lấy gôm bỏ vào túi áo, để mai còn xóa._
* [🤝 "Anh, hay mình thử tăng tinh thần trước rồi mới cắt?"]
    giam_doc: Tinh thần không trả được lãi ngân hàng em ạ.
    _{giam_doc} nói xong mới nhận ra mình lỡ miệng chữ "ngân hàng". Ông ấy đi nhanh hơn._
    ~ qh("giam_doc", -3)
- -> END

// ------------------------------------------------------------
=== hr_0810_kham_mat ===
# ngay:8 # gio:09:00 # noi:phong_kham_khoe_re
_Ngày Thị giác Thế giới. Nhiệm vụ của bạn: áp giải {editor} đi khám mắt. {editor} làm đêm, nên 9 giờ sáng là 3 giờ khuya của em nó._
editor: *(ngáp)* Anh {hr}… đợi em render xong… cái mắt…
_Phòng khám Đa Khoa Khỏe Re. Cô lễ tân nhìn thấy bạn, rồi nhìn ra sau lưng bạn như tìm ai._
phu_le_tan_khoe_re: Ủa, hôm nay hông có anh {thanh_xin_nghi} đi chung hả anh? Ảnh khám ở đây 8 lần rồi, tụi em quen mặt.
* [🕵️ "Anh {thanh_xin_nghi} khám bệnh gì vậy em?" (Xác Minh Đơn Nghỉ)]
    phu_le_tan_khoe_re: Dạ cái đó bí mật bệnh nhân á anh. Mà nói nhỏ… lần nào bác sĩ khám cũng thấy ảnh khỏe re. Giọng còn khỏe hơn bác sĩ.
    ~ hr_so_lan_bat_son = hr_so_lan_bat_son + 1
    ~ qh("thanh_xin_nghi", -3)
    _Bạn ghi vào sổ: "Giọng khỏe hơn bác sĩ." Câu này nghe lạ lạ._
* [😶 "Không, hôm nay chỉ có em {editor} thôi."]
    _Bạn để chuyện đó qua. Hôm nay là việc của mắt {editor}._
- phu_bac_si_khoe_re: Em này thức đêm nhiều quá. Mắt đỏ như mắt cú. Ngủ trước 2 giờ sáng được không em?
editor: Dạ… đợi render xong ạ.
_Trên đường về, {editor} ngủ gục trên vai bạn ở ghế sau xe ôm. Bạn để yên._
* [🍵 Mua cho em nó hộp trà hoa cúc tốt cho mắt.]
    ~ hr_tra()
    ~ tien_cong(-60000)
    ~ qh("editor", 10)
    editor: *(ôm hộp trà)* Em cảm ơn anh… anh là HR đầu tiên… không làm em sợ… *(ngủ tiếp)*
    ~ hr_nghe(3)
* [📓 Nhắc khéo: "Lần sau em chấm công buổi sáng giùm anh nha."]
    ~ hr_so(3)
    editor: Dạ… *(mắt nhắm nghiền)*
- -> END

// ------------------------------------------------------------
=== hr_0910_mv_ra_mat ===
# ngay:9 # gio:19:30 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Trứng Thế giới. 19:30. Còn nửa tiếng nữa MV "Hồng Hóa Việt Nam" lên kênh Tóp-tóp và Diu-túp của công ty. Cả công ty ở lại, chen chúc trước màn chiếu phòng họp tầng 2._
sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ! Tám giờ đúng mọi người share giùm nha!
_Mọi ánh mắt quay về phía bạn. Vì chuyện "share" là chuyện của HR._
* {hr_kpi_share} [📋 Nhắc KPI share bài trong group.]
    ~ follow(5000)
    ~ hr_so(3)
    _20:00. MV lên sóng. 21 người share trong 3 phút. Ai cũng sợ HR kiểm tra. Group "Hội Anti Sếp" cũng share, kèm caption "bị ép"._
* [🎉 Hoạt Động Gắn Kết: "Cả nhà đứng dậy, nắm tay thành vòng tròn, hô 'Hồng là thái độ'!"]
    { RANDOM(1, 2) == 1:
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 6
        ~ cang_thang(-5)
        ~ follow(8000)
        ~ hr_so(-5)
        _20:00. MV lên sóng. Vòng tròn 22 người. {hong_hot} livestream. {cho} chạy vòng quanh sủa theo nhịp. Clip "công ty hô khẩu hiệu như giáo phái" lên Tóp-tóp._
    - else:
        ~ hr_so(3)
        _Không ai đứng dậy. Chỉ có {thuc_tap_sinh} và {sieu_nhan_hong} nắm tay nhau, thành một vòng tròn… 2 người. Rất buồn._
    }
* [🥚 Mở túi trứng luộc mua ở căn tin hồi chiều, chia cho cả phòng.]
    ~ tien_cong(-66000)
    ~ an(15)
    ~ hr_so(-2)
    _20:00. MV lên sóng, có cả một quả trứng khổng lồ màu hồng. 22 quả trứng thật trong phòng. Ai cũng nhận, không ai hỏi "trứng này có ý gì không anh". Trứng là thứ duy nhất HR đưa mà không ai sợ._
- -> END

// ------------------------------------------------------------
=== hr_0910_son_kham_mat ===
# ngay:9 # gio:13:45 # noi:phong_hr
_Cửa gõ 3 tiếng nhẹ. {thanh_xin_nghi} ló đầu vào, mặt nghiêm túc tới đáng ngờ._
thanh_xin_nghi: Anh {hr} ơi… chiều nay em xin nghỉ, đi khám mắt chung với {editor} cho vui ạ. Hôm qua ảnh khám một mình, tội ảnh.
hr: {editor} khám hôm qua rồi em. Anh dắt đi mà.
thanh_xin_nghi: Dạ… thì… tái khám ạ! Bác sĩ nói phải có người đi kèm!
* [🕵️ "Phòng khám Khỏe Re hả em? Cô lễ tân nhắc em quá trời."]
    ~ hr_so_lan_bat_son = hr_so_lan_bat_son + 1
    ~ hr_so(3)
    thanh_xin_nghi: *(đứng hình)* Dạ… dạ em quen cổ… vì… bà ngoại em khám ở đó…
    hr: Bà ngoại em ở Ven Đô mà đi khám tận Tân Drama hả?
    thanh_xin_nghi: Dạ… thôi em ở lại làm ạ.
    ~ qh("thanh_xin_nghi", -5)
* [📓 "Anh ghi nhận. Đây là lần nghỉ thứ… 32 của em trong năm nha."]
    ~ qh("thanh_xin_nghi", -3)
    thanh_xin_nghi: Dạ… anh đếm kỹ ghê.
    _{thanh_xin_nghi} đi. Chiều hôm đó, bạn lỡ nghe trên tivi pantry một đoạn quảng cáo "Giọng Ca Ước Mơ: vòng 2 ghi hình tuần sau"._
* [🍵 "Đi đi em. Mà nhớ mang cho {editor} hộp trà hoa cúc, ảnh để quên ở xe ôm."]
    ~ qh("thanh_xin_nghi", 8)
    ~ hr_nghe(3)
    thanh_xin_nghi: *(ngạc nhiên)* Dạ… dạ em cảm ơn anh! Anh hiền bất thường luôn á!
- -> END

// ------------------------------------------------------------
=== hr_0910_chot_ung_vien ===
# ngay:9 # gio:16:30 # noi:phong_hr # bat_buoc
_Thứ 6. Hạn chót {giam_doc} giao. Bạn đã phỏng vấn đủ 5 người. Trên bàn: 5 bộ hồ sơ, 1 ly trà nguội, 1 cây bút._
_Ứng viên số 3: chị Hạnh, 34 tuổi, từng giữ trẻ cho một nhà sinh ba suốt 4 năm. Mặc áo hồng phấn. Trả lời câu "nếu Siêu Nhân Hồng bỏ đi giúp người giữa buổi quay" bằng: "Thì chị đi theo, quay luôn."_
_Ứng viên số 5: một anh chàng đẹp trai, nói tiếng Anh như gió, khoe "chưa bao giờ trễ hẹn". Trên ảnh story Phây-búc của anh ta: 6 tấm check-in quán bar lúc 3 giờ sáng ngày thứ 3._
{ hr_nhan_gian_diep:
    _Còn ứng viên số 4 thì bạn đã lỡ nhận rồi. Sáng nay người đó đi làm sớm, xin luôn bản lịch quay tuần sau._
}
* [✅ Chọn chị Hạnh, ứng viên số 3.]
    ~ hr_tuyen_dung = 1
    -> hr_mg_phong_van_dat
* [✅ Chọn ứng viên số 5. Đẹp trai, nói hay.]
    ~ hr_tuyen_dung = 2
    -> hr_mg_phong_van_truot
* [✅ Chọn {thuc_tap_sinh}, kiêm nhiệm luôn. Em nó chịu khó nhất công ty.]
    ~ hr_tuyen_dung = 2
    thuc_tap_sinh: Dạ em làm liền ạ! Mà… em vẫn photo, pha cà phê, xếp ghế, cầm hắt sáng chứ ạ?
    hr: Ừ.
    thuc_tap_sinh: Dạ… dạ em làm liền ạ. *(mắt hơi rưng)*
    ~ qh("thuc_tap_sinh", -5)
    -> hr_mg_phong_van_truot

// ------------------------------------------------------------
=== hr_1010_quan_ly_cam_xuc ===
# ngay:10 # gio:10:00 # noi:can_ho_604 # bat_buoc
_Thứ 7, ngày 10. Ngày lương. Lương chưa về. Ngân hàng "kiểm tra giao dịch lớn"._
_Group Zalo-lô công ty: 312 tin nhắn trong 2 tiếng. Toàn dấu chấm hỏi._
_Tin nhắn riêng của {giam_doc}: "{hr} ơi, em quản lý cảm xúc của anh em giúp anh nhé. Anh đang nói chuyện với ngân hàng. Hôm nay Ngày Giải phóng Thủ đô, anh nhớ Hà Nội quá."_
_Bạn gõ tin nhắn vào group. Ngón tay lơ lửng._
* [💬 "Cả nhà bình tĩnh nha, lương sẽ về sớm thôi 😊"]
    ~ hr_so(5)
    hong_hot: HR vô group rồi kìa mấy bà. Ai nói gì thì xóa lẹ!
    _47 tin nhắn bị thu hồi trong 1 phút. Group im lặng tuyệt đối. Không phải yên tâm. Là sợ._
* [🤝 "Ai đang kẹt tiền nhà, tiền học, nhắn riêng anh. Anh ứng trước 1 triệu từ tiền túi."]
    ~ hr_nghe(10)
    ~ hr_so(-5)
    ~ tien_cong(-2000000)
    _2 người nhắn: {thuc_tap_sinh} (không phải cho em ấy, mà hỏi giùm bạn cùng phòng) và {idol_het_thoi} (hỏi luôn 3 triệu). Bạn chuyển 2 triệu. Không ai trong group biết._
    ~ qh("idol_het_thoi", 8)
* [🧠 "Hôm nay Ngày Sức khỏe Tâm thần. Ai stress quá, Phòng khám Khỏe Re đang giảm giá nha."]
    thanh_xin_nghi: Dạ em biết phòng khám đó nè! Ủa… em nói gì đâu.
    ~ hr_so_lan_bat_son = hr_so_lan_bat_son + 1
    _Cả group thả "haha". Lần đầu tiên tin nhắn của HR có người thả "haha"._
    ~ hr_so(-3)
* [😶 Không nhắn gì. Nhắn riêng cho {ke_toan}: "Có cách nào không bà?"]
    ke_toan: Thứ 2. Chắc chắn thứ 2. Đừng hỏi vì sao.
    ~ qh("ke_toan", 5)
    _"Đừng hỏi vì sao." HR nào cũng biết câu đó nghĩa là có chuyện._
- -> END

// ------------------------------------------------------------
=== hr_1110_anh_hoi_nho ===
# ngay:11 # gio:20:00 # noi:can_ho_604
_Chủ nhật. Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ lên Phây-búc. Bạn lướt._
_{chi_dai} 8 tuổi cầm gậy đứng trên nóc tủ. {thuc_tap_sinh} 6 tuổi đeo cà vạt. {idol_het_thoi} 10 tuổi cầm micro đồ chơi._
_Rồi tới trang của {sieu_nhan_hong}: một tấm ảnh cũ, xóm nhỏ, mấy đứa trẻ đứng trước một cái nhà kho. Một thằng nhóc gầy đứng góc, đang khóc._
_Chú thích: "Xóm Cây Me ngày xưa ❤️ Ai nhận ra mình hông?"_
{ hr_biet_xom_cay_me:
    -> hr_1110_anh_hoi_nho.s_nho_ra
- else:
    _Bạn thả tim rồi lướt tiếp. Một xóm nghèo nào đó, như trăm xóm nghèo khác._
    -> END
}

= s_nho_ra
_Xóm Cây Me. Cái tên trong hồ sơ của {ran_doc}. Nửa giây khựng lại hôm 1/10._
_Bạn phóng to tấm ảnh. Thằng nhóc đang khóc có đôi mắt giống ai đó bạn mới gặp gần đây._
* [💬 Nhắn {ran_doc}: "Em ơi, em có ở xóm Cây Me cùng Siêu Nhân Hồng hả?"]
    _Đã xem. 10 phút. 20 phút. Rồi:_
    ran_doc: Dạ hông anh. Trùng tên xóm thôi ạ. Xóm Cây Me nhiều lắm. Anh ngủ ngon ạ.
    ~ qh("ran_doc", -5)
    _Làm HR 7 năm, bạn biết "trùng tên thôi" là câu trả lời của người đã chuẩn bị sẵn câu trả lời._
* [😶 Không hỏi. Ghi vào sổ riêng: "Xóm Cây Me: để ý."]
    _Không phải sổ kỷ luật. Là sổ "người cần được để ý". Cuốn sổ này bạn chưa từng cho ai xem._
    ~ hr_nghe(2)
* [🍵 Gác chuyện đó lại. Mỗi người có một cái nhà kho của riêng mình.]
    ~ cang_thang(-3)
- -> END

// ------------------------------------------------------------
=== hr_1210_group_soi_suc ===
# ngay:12 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Thứ 2. Lương vẫn chưa về. Họp giao ban mà không ai ngồi ghế, ai cũng đứng, như sẵn sàng bỏ đi bất cứ lúc nào._
sales: Chị nói thật, lương mà trễ nữa là chị nhận lời mời bên kia nha. Chắc kèo!
dan_dau_tu: Anh còn chờ lương để… trả nợ cho em đó {sales}.
chi_dai: {hr}! HR đứng đó cười là sao? Ông biết gì nói đi!
* [🤝 "Tui biết đúng 1 điều: bà {ke_toan} nói thứ 2. Hôm nay thứ 2. Chờ tới trưa."]
    ~ hr_nghe(5)
    ke_toan: *(gật đầu nhẹ)*
    chi_dai: Ờ. Bà {ke_toan} nói thì tui tin. Ông nói thì chưa chắc.
* [🗣️ "Mình cùng nhìn lại hành trình lương tháng này nha mọi người."]
    ~ hr_so(5)
    chi_dai: Hành trình gì? Hành trình từ ngân hàng tới túi tui có 2 tiếng mà đi 3 ngày chưa tới!
    _Cả phòng vỗ tay cho {chi_dai}. Bạn cũng muốn vỗ tay, nhưng HR thì không được._
    ~ qh("chi_dai", -3)
* [😶 Im lặng, phát trà gừng cho cả phòng.]
    ~ hr_tra()
    ~ hr_so(-2)
    _Trà gừng cho người đang nóng giận. Sai bài. {sales} uống một ngụm, mặt đỏ như trái ớt._
- _10 giờ đúng. Điện thoại cả phòng rung cùng lúc. "Tài khoản +…". Lương về. Tiếng thở phào to tới mức {cho} dưới sân cũng sủa theo._
~ tinh_than_cong_ty = tinh_than_cong_ty + 5
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== hr_1210_the_bi_tu_choi ===
# ngay:12 # gio:12:30 # noi:song_ao
_Trưa, Cà Phê Sống Ảo. Lương vừa về, cả bàn gọi 9 ly. {hong_hot}, {ran_doc}, {thuc_tap_sinh} ngồi cùng bàn với bạn. {con_ong_chau_cha} rút thẻ, hào phóng: "Hôm nay anh bao!"_
phu_chu_quan_song_ao: Thẻ bị từ chối nè em.
con_ong_chau_cha: Ủa? Thẻ phụ của chú anh mà. Chưa bao giờ… Để anh gọi chú anh.
_Không ai bắt máy. {con_ong_chau_cha} ngồi xuống, mặt trắng bệch. Cả bàn im lặng._
thuc_tap_sinh: Dạ… để em trả cho ạ!
_{thuc_tap_sinh} rút ví. Một cái thẻ lấp lánh rơi ra bàn. Hạng kim cương. Cả bàn nhìn. {hong_hot} đã kịp chụp. {thuc_tap_sinh} vội nhét lại, đổi sang tiền mặt._
* [😶 Giả vờ không thấy, trả tiền phần mình rồi đứng dậy.]
    ~ qh("thuc_tap_sinh", 5)
    _HR biết nhiều chuyện. HR giỏi nhất là biết mà không nói._
    ~ hr_nghe(3)
* [💬 Hỏi nhỏ {thuc_tap_sinh} khi ra về: "Em có gì cần kể với anh không?"]
    thuc_tap_sinh: Dạ… em… thẻ đó của… ba em ạ. *(nói dối rất dở)*
    hr: Ừ. Khi nào muốn kể thì lên phòng anh uống trà. Không phải kỷ luật đâu.
    thuc_tap_sinh: Dạ… dạ em biết rồi ạ. *(vẫn hơi sợ)*
    ~ hr_nghe(3)
* [📓 Nghĩ thầm: thẻ phụ của {con_ong_chau_cha} gắn với tài khoản riêng của sếp. Sếp đang cạn tiền thật.]
    ~ hr_ro_ri(3)
    _Nếu cả tài khoản riêng của {giam_doc} cũng cạn, thì tập hồ sơ hồng không còn là "phương án dự phòng" nữa._
    ~ cang_thang(5)
- ~ an(50)
-> END

// ------------------------------------------------------------
=== hr_1210_goi_len_phong ===
# ngay:12 # gio:17:00 # noi:phong_giam_doc
_Chiều. {giam_doc} gọi bạn lên. Trên bàn, điện thoại úp mặt, rung liên tục. Màn hình hiện "Tín Dụng Đen Đủi"._
giam_doc: {hr}. Lương về rồi, anh em vui rồi. Nhưng em biết đấy… tháng sau thì… Danh sách thế nào rồi?
{ hr_danh_sach_den == 0:
    hr: Dạ… em chưa ghi tên nào hết anh.
- else:
    hr: Dạ… có {hr_danh_sach_den} tên rồi anh.
}
* [😇 "Anh cho em thêm thời gian. Mỗi cái tên là một cái nhà."]
    giam_doc: Anh biết. Anh cũng… *(dừng lại)* Thôi. Em về đi.
    ~ qh("giam_doc", 3)
    ~ hr_nghe(2)
* [📓 "Dạ, em thêm 2 tên trong tuần này."]
    ~ hr_ds(2)
    ~ hr_them_ten_duy = true
    ~ qh("giam_doc", 5)
    giam_doc: Tốt. Em hiểu anh nhất.
    ~ cang_thang(10)
* {hr_nghi_trang_2} [🔒 Liếc nhìn tập hồ sơ hồng trên bàn sếp. Nó dày hơn tập của mình.]
    _Tập hồ sơ của {giam_doc} cũng màu hồng. Nhưng dày hơn. Ít nhất 2 trang._
    giam_doc: *(lấy tay đè lên)* Em nhìn gì đấy?
    hr: Dạ… màu hồng đẹp anh.
    ~ hr_ro_ri(2)
- -> END
