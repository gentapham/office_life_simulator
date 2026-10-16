// ============================================================
// HR: TUẤN · CHƯƠNG 3: "BÓNG TỐI KHÔNG CÓ DANH SÁCH" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== hr_1310_doanh_nhan ===
# ngay:13 # gio:09:30 # noi:phong_giam_doc # bat_buoc
_Ngày Doanh nhân Việt Nam. {giam_doc} tự đặt một bó hoa to trên bàn mình, thiệp ghi: "Gửi {giam_doc}, từ {giam_doc}"._
_{thanh_ninh} đọc bài phát biểu khen 15 phút. Tới phút thứ 9, {sales} bước vào với một tấm bằng khung vàng._
sales: Anh {giam_doc}! Tập đoàn BTT Global trao anh giải "Doanh nhân của năm"! Mr. Kevin Trộn gửi lời chúc mừng, ảnh bận họp ở Singapore!
giam_doc: Ôi… anh không ngờ. *(ôm tấm bằng, mắt rưng rưng)* {hr}! Tổ chức cho anh em vỗ tay đi!
_Bạn nhìn tấm bằng. Con dấu đỏ hơi lem, như vẽ bằng son môi._
* [👏 Hô cả phòng vỗ tay ba tràng.]
    ~ qh("giam_doc", 5)
    ~ hr_so(2)
    _Ba tràng pháo tay. {giam_doc} treo tấm bằng ngay sau ghế ngồi. Từ nay ai lên phòng kính cũng phải nhìn nó._
* [💬 Hỏi nhỏ {sales}: "Em ơi, BTT Global có website hông?"]
    sales: Có chứ anh! Đang… bảo trì. Tin chị đi!
    _{sales} nhỏ hơn bạn 4 tuổi nhưng vẫn xưng "chị". Bạn không cãi. Không ai cãi được {sales}._
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", -5)
* [😶 Đứng im, nghĩ tới 7 cái tên.]
    _Một tấm bằng doanh nhân của năm, treo trên một công ty sắp cắt 7 người. Bạn nuốt một ngụm trà, thấy đắng hơn mọi khi._
    ~ cang_thang(5)
- giam_doc: À {hr}, ở lại anh bảo cái này.
_Cả phòng ra hết. {giam_doc} hạ giọng._
giam_doc: Doanh nhân của năm thì phải quyết đoán. Danh sách em có {hr_danh_sach_den} tên. Thứ 4 tuần sau anh muốn thấy 5.
* [📓 "Dạ."]
    ~ hr_ds(1)
    ~ cang_thang(5)
* [🤝 "Anh, nếu chiến dịch đạt mốc 2 ngày mai, anh cho em giữ nguyên nha."]
    giam_doc: Ừ. Đạt mốc thì… anh tính. Anh không ép.
    ~ hr_nghe(2)
- -> END

// ------------------------------------------------------------
=== hr_1410_cuoc_goi_son ===
# ngay:14 # gio:07:00 # noi:can_ho_604 # bat_buoc
_7 giờ sáng. Ngày Hội Nông dân Việt Nam. Điện thoại reo. Màn hình: "{thanh_xin_nghi} (bà ngoại lần 8?)". Bạn tự lưu tên vậy từ tháng 6._
thanh_xin_nghi: *(giọng yếu ớt, phía sau có tiếng nhạc sân khấu xập xình)* Anh {hr} ơi… hôm nay em xin phép nghỉ ạ. Em về quê phụ gặt lúa… bà ngoại em… # hen_gio:5
* [🕵️ "Tháng 10 gặt lúa hả em? Nhà em ở Ven Đô trồng rau mà."]
    _Im lặng 3 giây. Tiếng nhạc phía sau tắt cái bụp. Rồi tiếng "tút tút"._
    ~ hr_so_lan_bat_son = hr_so_lan_bat_son + 1
    ~ hr_thay_bong_kim_tuyen = true
    ~ qh("thanh_xin_nghi", -5)
    _{thanh_xin_nghi} biết bạn đã biết. Còn bạn thì biết… có tiếng nhạc. Nhạc gì mà 7 giờ sáng?_
* [📓 "Ừ, anh ghi nhận nha em."]
    ~ hr_lan_ba_ngoai = hr_lan_ba_ngoai + 1
    { not hr_them_ten_son:
        ~ hr_ds(1)
        ~ hr_them_ten_son = true
    }
    thanh_xin_nghi: Dạ… em cảm ơn anh… khụ khụ.
    _Bạn ghi: "Vi phạm. Lần thứ 8." Ô tên {thanh_xin_nghi} trong tập hồ sơ hồng đậm thêm một chút._
* [🍵 "Ừ, nghỉ đi em. Mà nhạc gì nghe hay vậy? Bà ngoại em nghe nhạc sàn hả?"]
    _{thanh_xin_nghi} bật cười, rồi ho giả._
    thanh_xin_nghi: Khụ… dạ… bà em… sành điệu lắm anh. Khụ.
    ~ qh("thanh_xin_nghi", 5)
    ~ hr_nghe(3)
    ~ hr_so(-3)
    _Lần đầu {thanh_xin_nghi} thấy HR cũng biết đùa. Lần đầu bạn thấy mình đùa mà người ta cười._
* [⏱️ (Không chọn kịp)]
    _{thanh_xin_nghi} cúp máy. Đơn nghỉ tự động được duyệt. Bạn ghi chú trong sổ: "Lần thứ 8."_
    ~ hr_lan_ba_ngoai = hr_lan_ba_ngoai + 1
- -> END

// ------------------------------------------------------------
=== hr_1410_tham_tu ===
# ngay:14 # gio:10:00 # noi:phong_hr
_Lá đơn nghỉ của {thanh_xin_nghi} nằm trên bàn. Lý do: "Về quê phụ gặt lúa". Đính kèm: giấy Phòng khám Khỏe Re "viêm họng nhẹ, nghỉ 1 ngày"._
_Gặt lúa mà viêm họng? Viêm họng mà gặt lúa?_
hong_hot: *(đi ngang, ghé đầu vào)* Ủa anh {hr} soi đơn của {thanh_xin_nghi} hả? Ối dồi ôi, lần thứ mấy rồi?
* [🕵️ Bắt đầu xác minh. Mở story Phây-búc, gọi phòng khám, hỏi sổ ra vào của Bác {bac_bao_ve}.]
    ~ hr_so(2)
    -> hr_mg_tham_tu_mo
* [😶 Úp lá đơn xuống. "Không có gì đâu {hong_hot}."]
    hong_hot: "Không có gì" là có gì đó rồi. Thôi em đi. *(đi chậm, mắt vẫn ngó vào)*
    ~ hr_ro_ri(3)
    _Bạn nhận ra tập hồ sơ hồng đang nằm ngay dưới lá đơn. Một góc hồng lòi ra._
    -> END

// ------------------------------------------------------------
=== hr_1410_moc_2 ===
# ngay:14 # gio:16:00 # noi:phong_hop_sang_tao # bat_buoc
_Mốc 2: 200.000 người theo dõi._
{ nguoi_theo_doi >= 200000:
    dan_dau_tu: Qua rồi! 200 ngàn! Biểu đồ đẹp như tranh!
    giam_doc: Tốt! Tốt lắm! {hr}, cái danh sách… thôi, tuần này em cứ thong thả.
    ~ hr_ds(-1)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
- else:
    dan_dau_tu: Ờ… chưa tới. Mà đây là tích lũy, tích lũy trước khi bùng nổ.
    _{sieu_nhan_hong} nhìn con số, im lặng. Rồi lặng lẽ đi ra cổng, lên xe hồng. Cả buổi chiều, người ta thấy {sieu_nhan_hong} đi giúp người khắp Quận Hóng: gỡ diều, đẩy xe, nhặt rác._
    giam_doc: {hr}. 5 tên. Thứ 4 tuần sau.
    ~ hr_ds(1)
    ~ cang_thang(10)
}
* [🍵 Pha một ấm trà, mang xuống cổng mời Bác {bac_bao_ve}.]
    bac_bao_ve: Ừ. Ngồi đây. Hôm nay mặt cháu nặng như cái cổng sắt.
    hr: Bác ơi, bác có bao giờ phải chọn ai ở, ai đi chưa?
    bac_bao_ve: Bác chỉ chọn mở cổng hay đóng cổng thôi. Mà mở cổng thì dễ hơn.
    ~ qh("bac_bao_ve", 5)
    ~ cang_thang(-5)
* [📓 Lên phòng, mở tập hồ sơ hồng ra nhìn.]
    _Bạn nhìn mãi. Mấy cái ô trống như mấy cái ghế trống trong phòng họp ngày mai._
- -> END

// ------------------------------------------------------------
=== hr_1510_mat_dien ===
# ngay:15 # gio:08:05 # noi:phong_hr # bat_buoc
_8 giờ 05. Cả tòa nhà tắt phụt. Máy lạnh im. Đèn tắt. Từ thang máy vọng ra tiếng đập cửa và hai giọng nói._
giam_doc: *(vọng ra)* {bac_bao_ve} ơi! {bac_bao_ve}! Mở cửa cho anh với!
chi_dai: *(vọng ra)* Anh la nhỏ thôi! Hết oxy bây giờ!
_{giam_doc} và {chi_dai} kẹt chung thang máy. Bạn đứng ở hành lang, cầm đèn pin điện thoại, không biết nên cứu ai trước._
_Rồi bạn nhớ ra: tủ hồ sơ phòng HR khóa bằng khóa từ. Không có điện, khóa từ… mở toang._
~ hr_ro_ri(20)
* [🗂️ Chạy về phòng, ôm tập hồ sơ hồng theo người suốt ngày.]
    ~ hr_ro_ri(-10)
    _Bạn nhét tập hồ sơ vào trong áo khoác. Cả ngày hôm đó bạn đi đứng như người ôm bụng đau._
* [🚪 Chạy xuống phụ Bác {bac_bao_ve} mở thang máy.]
    ~ qh("chi_dai", 5)
    ~ qh("giam_doc", 5)
    bac_bao_ve: Cầm cái xà beng này. Cạy nhẹ thôi. Cửa thang máy đắt lắm.
    _10 phút sau, cửa mở. {chi_dai} bước ra trước, {giam_doc} bước ra sau, mặt trắng bệch. Ông ấy đã kể hết chuyện đời mình trong 10 phút đó._
    chi_dai: Cảm ơn ông. Lần đầu thấy ông làm việc tay chân.
    _Bạn quay lại phòng HR. Cửa tủ hé mở. Hình như không ai đụng tới. Hình như._
    ~ hr_ro_ri(5)
* [🗝️ Lấy dây thun cột cửa tủ lại. Tạm vậy.]
    _Dây thun buộc tủ. Rất HR. Rất 2026._
- -> END

// ------------------------------------------------------------
=== hr_1510_bong_toi_ngan ===
# ngay:15 # gio:10:30 # noi:pantry # bat_buoc
_Mất điện. Pantry tối om, rèm kéo kín vì nắng gắt. Cả công ty ngồi bệt dưới sàn, quạt giấy._
_{truong_phong} đang họp thắp nến ở phòng "Sáng Tạo". {thuc_tap_sinh} vừa phát 5 cục sạc dự phòng. Không ai nhìn rõ mặt ai._
_Trong bóng tối, không ai thấy nụ cười của bạn._
_Ai đó ngồi xuống cạnh bạn, tưởng bạn là người khác._
hong_hot: Ê… tui mệt quá bà ơi. Tui làm admin một trang, ngày nào cũng phải đọc người ta chửi nhau. Mà hông dám nói với ai. Ủa, bà là ai vậy?
* [🍵 "Là anh {hr}. Em cứ nói tiếp đi, anh không ghi sổ đâu."]
    _{hong_hot} khựng lại. Rồi… nói tiếp._
    hong_hot: …Ờ. Vậy thôi kệ. Tối tui về livestream, sáng đi làm, trưa hóng chuyện. Mà chẳng ai hóng chuyện của tui hết.
    ~ hr_nghe(15)
    ~ hr_nghe_bong_toi = hr_nghe_bong_toi + 1
    ~ hr_biet_ngan_co_trang = true
    ~ qh("hong_hot", 10)
    _Bạn biết {hong_hot} có một trang bí mật. Bạn không biết trang nào. Bạn quyết định không cần biết._
* [📓 "Là anh {hr}. Trang gì vậy em?"]
    _{hong_hot} đứng dậy đi mất._
    hong_hot: *(nói to với cả pantry)* Mấy bà ơi! Ổng ngồi rình trong bóng tối!
    ~ hr_so(10)
    ~ qh("hong_hot", -10)
* [😶 Im lặng, đưa cho {hong_hot} ly trà hoa cúc.]
    ~ hr_tra()
    _{hong_hot} uống, rồi ngủ gục trên vai… cái ghế bên cạnh._
    ~ hr_nghe(10)
    ~ hr_nghe_bong_toi = hr_nghe_bong_toi + 1
    _Bạn đặt lại tờ giấy cạnh ly: "Trà Zzz, uống để ngủ." Sáng mai {hong_hot} sẽ không biết ai pha._
- -> END

// ------------------------------------------------------------
=== hr_1510_bong_toi_tam_su ===
# ngay:15 # gio:14:00 # noi:pantry
_Đầu giờ chiều. Vẫn mất điện. Pantry như hang động. Có tiếng thở dài bên trái._
chua_te_deadline: Anh… anh nào đó ơi. Nói thiệt nha, em sợ anh {truong_phong} lắm. Ổng họp với em 14 cuộc một ngày. Em lướt Tóp-tóp là để khỏi nghe tim mình đập.
* [🍵 "Ừ. Anh nghe nè. Cứ nói."]
    ~ hr_nghe(8)
    ~ hr_nghe_bong_toi = hr_nghe_bong_toi + 1
    ~ qh("chua_te_deadline", 8)
    chua_te_deadline: …Ủa anh {hr} hả? Thôi kệ. Tối thui, coi như em nói với cái tủ lạnh.
* [🗣️ "Mình cùng nhìn lại hành trình của em với anh {truong_phong} nha."]
    chua_te_deadline: Á. HR. *(lết đi chỗ khác trong bóng tối)*
    ~ hr_so(3)
- _Bên phải có tiếng sụt sịt rất khẽ._
thuc_tap_sinh: Dạ… em xin lỗi. Hôm nay Ngày Thanh niên. Em 30 tuổi rồi, vẫn tự nhận là thanh niên. Mà… em nhớ nhà. Em bỏ một công việc… rất tốt, để vô đây. Ba má em không biết.
* [🍵 Không hỏi "công việc gì". Chỉ nói: "Em giỏi lắm. Bỏ cái chắc chắn để theo cái mình thích là gan lắm đó."]
    ~ hr_nghe(10)
    ~ hr_nghe_bong_toi = hr_nghe_bong_toi + 1
    ~ qh("thuc_tap_sinh", 10)
    thuc_tap_sinh: Dạ… em cảm ơn ạ. *(sụt sịt)* Anh là ai vậy ạ?
    hr: Một người cũng đang nhớ nhà.
* [💬 "Công việc gì vậy em? Lương cao hông?"]
    thuc_tap_sinh: Dạ… *(im lặng)* …thôi em đi phát sạc dự phòng tiếp ạ.
    ~ hr_nghe(-3)
- { hr_nghe_bong_toi >= 3:
    _Một giọng nữ trầm từ góc tối: {ke_toan}._
    ke_toan: {hr} hả. Tui nghe ông nói nãy giờ. Lâu lắm mới nghe ông nói chuyện giống người.
    ~ qh("ke_toan", 8)
    ~ hr_nghe_bong_toi = hr_nghe_bong_toi + 1
}
{ hr_nghe_bong_toi >= 4:
    _Rồi {chi_dai} ngồi phịch xuống, kể chuyện kẹt thang máy với sếp, cười tới chảy nước mắt. Bạn cười theo. Trong bóng tối, không ai sợ cái cười đó._
    ~ hr_nghe_bong_toi = hr_nghe_bong_toi + 1
    ~ hr_so(-10)
    ~ qh("chi_dai", 5)
}
-> END

// ------------------------------------------------------------
=== hr_1510_toi_pantry ===
# ngay:15 # gio:19:00 # noi:pantry
_7 giờ tối. Vẫn chưa có điện. Hầu hết đã về. Trong pantry, {idol_het_thoi} ngồi trên bệ cửa sổ, hát "Công Viên" thật chậm, không nhạc đệm._
idol_het_thoi: Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên…
_Trong góc, đèn đỏ nhỏ xíu của một cái máy quay. {editor} đang quay lại, im như tượng._
_Bạn đứng ở cửa. Rồi bạn nghe tiếng giấy sột soạt ở phía hành lang phòng HR. Một ánh đèn pin điện thoại lướt qua._
* [🏃 Chạy về phòng HR.]
    _Cửa phòng hé. Không ai. Tủ hồ sơ vẫn cột dây thun. Nhưng dây thun… cột kiểu khác._
    ~ hr_ro_ri(10)
    _Ở hành lang, thoảng một mùi nước hoa lạ. Hơi… xanh. Như lá chuối._
    ~ hr_tim_ke_ro_ri = "ran_thu_hai"
* [🎵 Đứng lại nghe hết bài.]
    _Bài hát hết. {idol_het_thoi} quay lại, thấy bạn, giật mình._
    idol_het_thoi: Em… em biết anh là ai không? À, anh {hr}. Anh đừng kể ai nha.
    hr: Ông hát hay mà. Kể làm gì.
    ~ qh("idol_het_thoi", 8)
    ~ qh("editor", 3)
    ~ hr_ro_ri(15)
    _Sáng hôm sau bạn mới biết: tối đó có người lục tủ hồ sơ của bạn._
* {hr_do_ro_ri >= 40} [🔒 Gọi {it} hỏi log camera hành lang.]
    it: Mất điện. Camera tắt. Restart chưa? À, không restart được.
    it: …Nhưng wifi điện thoại có log. Có một máy lạ bắt wifi hành lang lúc 18:58. Tui gửi anh.
    ~ qh("it", 5)
    ~ hr_ro_ri(-5)
    ~ hr_tim_ke_ro_ri = "may_la"
- -> END

// ------------------------------------------------------------
=== hr_1610_dai_tivi_hong ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. Gameshow "Hồng Hay Không Hồng", giải 10 triệu. Bạn đi theo đoàn {hr_tuyen_dung_text()}._
_Phần "Hit Một Thời": {sieu_nhan_hong} hát "Công Viên". Hát sai lời: "…bán cá viên chiên, thích ăn… khoai chiên". Cả trường quay cười ngặt nghẽo._
_Từ cánh gà, một giọng hát bè vang lên, đúng lời, đúng tông. Là {idol_het_thoi}. Tối nay 20:00 mới phát sóng, nhưng cả trường quay đã biết đoạn nào sẽ thành meme._
_Giữa giờ nghỉ, bạn đi dọc hành lang tìm nhà vệ sinh. Ở hành lang trường quay bên cạnh, có một bóng người mặc đồ kim tuyến lấp lánh, tóc giả, đang thử đồ. Dáng đi… quen quen._
_Bóng người quay lại, thấy bạn, rồi biến vào phòng thay đồ nhanh như một cơn gió kim tuyến._
* [🏃 Đuổi theo.]
    _Bạn chạy tới cửa phòng thay đồ. Một cô trợ lý sản xuất chặn lại._
    phu_tro_ly_dai: Anh ơi, khu thí sinh "Giọng Ca Ước Mơ", người ngoài miễn vào nha!
    _"Giọng Ca Ước Mơ". Cuộc thi bạn xem mỗi tối. Bạn đứng đó, tim đập lạ lùng._
    ~ hr_thay_bong_kim_tuyen = true
    ~ hr_so(2)
* [📸 Chụp hình.]
    _Ảnh nhòe. Chỉ thấy một vệt kim tuyến và một đôi giày… giống giày {thanh_xin_nghi} hay mang._
    ~ hr_thay_bong_kim_tuyen = true
    ~ hr_chup_bong_kim_tuyen = true
* [😶 Giả vờ không thấy.]
    _Ai cũng có quyền có một hành lang của riêng mình. Bạn đi tiếp, tìm nhà vệ sinh._
    ~ hr_nghe(3)
- _Lúc quay về, {thanh_xin_nghi} đang đứng cạnh {sieu_nhan_hong}, thở hơi gấp, trên má còn dính một hạt kim tuyến._
* [💬 "{thanh_xin_nghi}, má em dính gì kìa."]
    thanh_xin_nghi: Dạ… dạ… bụi trường quay đó anh! *(lau lia lịa)*
    {hr_thay_bong_kim_tuyen:
        _Bạn nhìn hạt kim tuyến. Bạn nhìn {thanh_xin_nghi}. Một ý nghĩ lóe lên, rồi bạn tự cười: "Không thể nào. {thanh_xin_nghi} Kim Tuyến hát hay vậy mà."_
    }
* [😶 Không nói gì.]
    _Bạn đưa {thanh_xin_nghi} một tờ khăn giấy. Không giải thích._
    ~ qh("thanh_xin_nghi", 5)
- -> END

// ------------------------------------------------------------
=== hr_1610_buffet ===
# ngay:16 # gio:19:00 # noi:pantry
_Ngày Lương thực Thế giới. Liên hoan buffet ở công ty. Bánh mì, gỏi cuốn, xúc xích (một nửa đã nằm trong bụng {cho})._
_Bạn ngồi cạnh {thanh_xin_nghi}. Không ai muốn ngồi cạnh HR, trừ người tới trễ nhất, chỗ trống cuối cùng._
thanh_xin_nghi: Dạ… anh {hr} ăn đi ạ.
* [💬 "{thanh_xin_nghi}, em có xem 'Giọng Ca Ước Mơ' hông? Anh mê một thí sinh, tên {thanh_xin_nghi} Kim Tuyến."]
    _{thanh_xin_nghi} sặc gỏi cuốn. Ho thật, lần đầu tiên trong năm._
    thanh_xin_nghi: Khụ khụ! Dạ… dạ em… có nghe tên ạ.
    hr: Giọng hay lắm em. Anh nhắn bình chọn hoài. {hr_so_lan_vote > 0:Đã {hr_so_lan_vote} lần rồi.|Định bình chọn mà chưa có dịp.}
    thanh_xin_nghi: *(nhìn bạn rất lâu, mắt như muốn khóc)* Dạ… chắc ảnh… vui lắm.
    ~ hr_so_lan_vote = hr_so_lan_vote + 2
    ~ qh("thanh_xin_nghi", 10)
    _Bạn không hiểu sao {thanh_xin_nghi} ăn hết buổi mà không nói thêm câu nào, nhưng cứ cười một mình._
* [📓 "{thanh_xin_nghi}, tuần này em nghỉ 1 ngày, đi trễ 2 ngày. Thứ 2 lên phòng anh uống trà nha."]
    ~ hr_so(5)
    ~ qh("thanh_xin_nghi", -8)
    thanh_xin_nghi: Dạ… *(đặt đũa xuống, hết muốn ăn)*
* [🍵 Gắp cho em nó miếng xúc xích cuối cùng trước khi {cho} cướp.]
    ~ qh("thanh_xin_nghi", 5)
    ~ qh("cho", -3)
    cho: Grừ…
    thanh_xin_nghi: Dạ em cảm ơn anh. Anh… hông giống HR chút nào.
    ~ hr_so(-2)
- ~ an(40)
{ hr_nhan_gian_diep:
    _Cuối buổi, {hong_hot} hét lên: paparazzi đăng ảnh {sieu_nhan_hong} ở cổng đài lúc 13:58, trước cả giờ đoàn tới. Ai báo lịch? Bạn nhìn sang người nhân viên mặc đồ xanh lá chuối mà bạn đã nhận. Ghế trống._
    ~ follow(-10000)
    ~ qh("giam_doc", -10)
}
-> END

// ------------------------------------------------------------
=== function hr_tuyen_dung_text() ===
{ hr_tuyen_dung:
- 1: ~ return "cùng chị Hạnh, người đang giữ lịch cho Siêu Nhân Hồng như giữ trứng"
- 2: ~ return "cùng người chăm sóc mới, người đã làm lạc Siêu Nhân Hồng 2 lần trên đường tới đài"
- else: ~ return "và tự tay giữ lịch cho Siêu Nhân Hồng, vì chưa tuyển được ai"
}
