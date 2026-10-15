// ============================================================
// CHỊ ĐẠI: HƯƠNG · CHƯƠNG 6: "ĐÊM HỒNG DO CHỊ ĐỨNG" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== chi_dai_2810_dung_san_khau ===
# ngay:28 # gio:08:00 # noi:san_khau_dem_hong # bat_buoc
_Mốc 4: 800.000. Bãi đất trống giờ đã có khung sân khấu, giàn giáo, hai máy phát điện của {it}. Cái cột điện vẫn đứng đó, giờ quấn đèn hồng._
{ nguoi_theo_doi >= 800000:
    _Điện thoại: {nguoi_theo_doi} người theo dõi. Qua mốc 4. Đội dựng sân khấu hò reo, mặc dù không ai trong đội biết mốc là gì._
- else:
    _Điện thoại: {nguoi_theo_doi}. Chưa tới mốc 4. Trên mạng, một bài báo: "LL-Entertainment: Siêu Nhân Hồng xứng đáng một sân khấu lớn hơn."_
    ~ cd_nk(5)
}
_Đội đèn báo: thiếu 2 giàn đèn lớn. Ngân sách hết. Không có 2 giàn đó, nửa sân khấu sẽ tối._
* {cd_tin_sua_chua} [🔒 Gọi Sữa Chua Hồng Hào: "Chị ơi, 1 tỷ tài trợ, cho em ứng trước 60 triệu tiền đèn."]
    _Chị marketing Hồng Hào cười: "Dạ được ạ. Chiều em chở thêm 2 thùng sữa chua cho anh chị em dựng sân khấu."_
    _Hai giàn đèn tới lúc 3 giờ chiều. Kèm 200 hộp sữa chua. {cho} ăn 6 hộp._
    ~ cd_td(12)
    ~ cd_uy(5)
    ~ an(15)
* [👊 Lên phòng giám đốc đập bàn đòi thêm tiền.]
    ~ cd_dap_ban()
    { cd_thang_that_long:
        giam_doc: *(không đợi bàn rung xong)* Anh biết rồi. Anh bán cái gậy golf. 60 triệu. Em cầm đi.
        ~ cd_td(10)
        ~ qh("giam_doc", 5)
    - else:
        giam_doc: Em {chi_dai}… công ty hết rồi em ạ. Anh không ép, tùy em… mà anh không có thật.
        _22:00 tối đó, tin nhắn "văn hóa ứng xử" lần thứ hai. Bạn đọc rồi xóa._
        ~ cd_nk(15)
        ~ cd_td(2)
    }
* {cd_muon_den_nguoi_quen} [📞 Gọi chú bán đồ điện ở Chợ Phố Cũ, bạn cũ thời "chị đại".]
    _Chú cười lộ cái răng vàng: "{chi_dai} cần là có. Hai giàn. Tiền xăng thôi." Chiều đó, xe chở đèn tới, kèm 4 anh thợ cũ, ai cũng gọi bạn là "chị Hai"._
    ~ cd_td(10)
    ~ cd_uy(3)
* [📞 Đi mượn đèn của người quen cũ thời "chị đại".]
    _Bạn gọi 6 cuộc. Cuộc thứ 6 có người nhớ bạn: "Ủa {chi_dai} tô ốc hả? Có! Đèn cũ thôi nha!" Hai giàn đèn hơi cũ, hơi rỉ, nhưng sáng._
    ~ cd_td(7)
* [✂️ Cắt. Dồn đèn về giữa sân khấu, hai bên để tối.]
    _Sân khấu nhỏ đi một nửa. Đẹp kiểu "tối giản". {thanh_ninh} chắc sẽ khen._
    ~ cd_khong_cat_den = false
    ~ cd_td(2)
- -> END

// ------------------------------------------------------------
=== chi_dai_2810_video_linh ===
# ngay:28 # gio:16:00 # noi:phong_dung_phim
_Fanpage công ty vừa đăng một video lạ. 2 phút. Dựng rất đẹp. Toàn cảnh {quan_ly_idol}: cầm hai điện thoại, ngủ gật trên xe, cười với {idol_het_thoi}. Cuối video: "Anh {quan_ly_idol} ơi, em thích anh lâu rồi."_
_Góc khung hình có một con cú nhỏ xíu._
_{editor} ngồi trong phòng dựng, hai tay ôm đầu. Video đã có 30.000 lượt xem._
editor: Em… em bấm nhầm xuất bản. Em định lưu nháp. Chị ơi… em muốn biến mất.
* [🛡️ Gỡ video xuống ngay. Rồi đứng trước cửa phòng dựng, không ai được vào.]
    _Bạn gọi {hong_hot}: "Gỡ. Ngay. Ai hỏi thì nói lỗi kỹ thuật." Rồi bạn đứng ở cửa phòng dựng hai tiếng. {hong_hot} tới, {sales} tới, {dan_dau_tu} tới. Không ai qua._
    ~ qh("editor", 15)
    ~ cd_bao_ke(de_editor)
    ~ cd_uy(3)
* [🤝 Ngồi xuống cạnh {editor}: "Video đẹp. Thật lòng. Lỡ rồi thì… em có muốn nói thật với ổng hông?"]
    editor: *(lắc đầu)* Ảnh thích người khác. Em biết lâu rồi.
    chi_dai: Vậy thì em vẫn dựng đẹp nhất công ty. Chuyện đó không ai gỡ được.
    ~ qh("editor", 12)
    ~ cd_nk(-5)
* [📞 Lên tìm {quan_ly_idol}, nói thẳng: "Anh coi rồi phải hông? Anh đừng làm thằng nhỏ khó xử."]
    quan_ly_idol: *(hai điện thoại đều đang rung)* Anh coi rồi. Anh… anh sẽ nói chuyện với nó. Tử tế. Hứa.
    _Rồi điện thoại thứ ba của anh rung: tin {dan_dau_tu} vừa chạy bộ lọc, 80.000 tài khoản fan ảo đều trỏ về một người: {idol_het_thoi}._
    quan_ly_idol: Chuyện này để anh lo… *(giọng vỡ)* …hai chuyện một ngày.
    ~ qh("quan_ly_idol", 5)
    ~ phat_hien(fan_ao_phat)
- -> END

// ------------------------------------------------------------
=== chi_dai_2910_wifi_sap ===
# ngay:29 # gio:08:10 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. Wifi sập. Cả tòa nhà. Zalo-lô chết, Phây-búc chết, Tóp-tóp chết. Chiến dịch mạng xã hội đứng hình._
_{it} bị 14 người đuổi từ tầng 2 xuống tầng trệt. Video tổng kết của {editor} kẹt ở 99%._
_Chỉ còn một thứ chạy được: bộ đàm. Không cần wifi. Không cần sóng điện thoại._
it: *(thở hổn hển)* Dây mạng tủ tầng 1. Bị cắn. Hoặc bị cắt. Chưa biết.
{ RANDOM(1, 10) <= 6:
    _Dưới chân tủ mạng: lông chó. Và dấu răng. {cho} đã đi tìm con gà cao su._
    -> tuat_can
- else:
    _Dây cáp đứt gọn, vết cắt thẳng như dao lam. Không phải răng chó. Có ai đó cắt._
    -> bi_cat
}

= tuat_can
* {chi_dai_0410_nguyen_choc_tuat} [🔒 Thò tay ra sau tủ mạng, lôi con gà cao su ra, đưa cho {cho}.]
    _Con gà cao su nằm đó từ 4/10, phủ bụi. {cho} ngậm lấy, nằm xuống, thở ra như vừa tìm lại được người thân. Không cắn dây nào nữa._
    it: Bà biết nó ở đó từ đầu?
    chi_dai: Biết. Quên. Giờ nhớ.
    ~ qh("cho", 15)
    ~ qh("it", 5)
* [🐕 Lôi {cho} ra khỏi tủ mạng, giao cho Bác {bac_bao_ve}.]
    bac_bao_ve: *(bộ đàm)* Ừ. Đưa nó đây. Hôm nay nó nằm chòi.
    ~ qh("cho", -3)
- -> dieu_phoi

= bi_cat
* [🕵️ Nhìn quanh. Ai tới sớm nhất sáng nay?]
    _Bạn bộ đàm cho Bác {bac_bao_ve}. Bác đọc sổ trực: "6 giờ 50. Một người. Bác ghi tên rồi. Cháu cần thì xuống chòi, bác không nói qua máy được."_
    ~ cd_uy(2)
* [📻 Kệ ai cắt. Việc bây giờ là chạy.]
    ~ cd_nk(5)
- -> dieu_phoi

= dieu_phoi
_Bạn đứng giữa tầng 1, bộ đàm trên tay, giọng to nhất tòa nhà:_
chi_dai: Tất cả nghe đây. Hôm nay không wifi. Mọi tin nhắn đi qua chòi bảo vệ, viết giấy. Việc gấp gọi bộ đàm. {hong_hot}, phát wifi điện thoại cho {editor} render.
hong_hot: Mật khẩu "nghegichua" nha mọi người!
* [📻 Điều phối cả công ty bằng bộ đàm, từng người một, cả ngày.]
    ~ cd_bo_dam_2910 = true
    -> chi_dai_mg_bo_dam_mo_dau
* [🤝 Giao bộ đàm cho {thuc_tap_sinh} điều phối, mình chạy ra sân khấu.]
    thuc_tap_sinh: Dạ… em? Dạ… dạ rõ chị!
    _{thuc_tap_sinh} điều phối cả ngày. Giọng run lúc 8 giờ, chắc lúc 10 giờ, ra lệnh lúc 2 giờ chiều. Bạn nghe qua bộ đàm, mỉm cười._
    ~ qh("thuc_tap_sinh", 15)
    ~ cd_td(5)
- -> END

// ------------------------------------------------------------
=== chi_dai_2910_email_nhi ===
# ngay:29 # gio:16:50 # noi:ban_tro_ly
_4 giờ 50 chiều. Wifi vừa có lại. {thanh_ninh} ngồi trước màn hình, con trỏ chuột lơ lửng trên nút "Gửi". Tiêu đề: "Em đồng ý về LL ạ"._
{ cd_hoa_voi_nhi:
    -> da_hoa
- else:
    -> chua_hoa
}

= da_hoa
_{thanh_ninh} quay ra, thấy bạn đi ngang. Gọi nhỏ:_
thanh_ninh: Chị {chi_dai}… chị coi giùm em. Ô người nhận này… đúng hông chị?
_Ô người nhận: "G-Entertainment - Toàn công ty". Không phải thư ký của Lưu Lực._
* [🛡️ "Sai. Toàn công ty. Xóa đi."]
    thanh_ninh: *(xóa, tay run)* Trời ơi… suýt nữa…
    chi_dai: Còn gửi hay không, là chuyện của em. Nhưng gửi thì gửi đúng người. Và nói với sếp trước.
    ~ qh("thanh_ninh", 15)
    ~ cd_bao_ke(de_thanh_ninh)
* [💬 "Sai rồi. Mà em chắc muốn gửi hông? Bên đó muốn em làm gì, em biết rồi mà."]
    thanh_ninh: *(nhìn màn hình rất lâu)* …Em biết. Họ muốn em lấy mật khẩu email anh {giam_doc}.
    _{thanh_ninh} xóa bức thư. Không viết lại._
    thanh_ninh: Em ở lại. Không phải vì sếp. Vì chị là người đầu tiên rủ em ăn cơm.
    ~ qh("thanh_ninh", 25)
    ~ cd_bao_ke(de_thanh_ninh)
    ~ phat_hien(ran_thu_hai_lo_mat)
- -> END

= chua_hoa
_17:02. "Đã gửi." Tới: "G-Entertainment - Toàn công ty"._
_Điện thoại của cả công ty rung lên cùng lúc. Kể cả của bạn. "Em đồng ý về LL ạ."_
_Tầng 1 im lặng. Rồi mọi người nhìn về phía bàn trợ lý. {thanh_ninh} đứng dậy, tái mặt, cầm túi chạy ra cầu thang._
* [🛡️ Chặn cầu thang. Không phải để giữ. Để không ai đuổi theo bàn tán.]
    _Bạn đứng chắn. {thanh_ninh} chạy qua bạn, xuống tầng. Phía sau, bạn quay lại nhìn cả tầng 1: "Ai bàn chuyện này thì bàn với chị."_
    _Không ai bàn._
    ~ qh("thanh_ninh", 10)
    ~ cd_uy(5)
* [🔥 "Đi đi. Đi cho đúng chỗ của em."]
    _{thanh_ninh} khựng lại trên bậc thang một giây. Rồi đi tiếp._
    ~ cd_nk(-5)
    ~ qh("thanh_ninh", -10)
* [😶 Đọc lại email. Rồi úp điện thoại.]
    ~ cd_nk(5)
- -> END

// ------------------------------------------------------------
=== chi_dai_2910_toi_kiem_tra ===
# ngay:29 # gio:21:00 # noi:san_khau_dem_hong
_9 giờ tối. Sân khấu Đêm Hồng. Lần chạy thử đầu tiên. Đèn bật. Loa bật. Cột điện quấn đèn hồng nhấp nháy._
_Tiến Độ Đêm Hồng: {cd_tien_do}%._
{
- cd_tien_do >= 80:
    _Mọi thứ chạy. Âm thanh trong. Đèn đều. {it} đứng giữa sân khấu, nhìn lên giàn đèn, gật đầu: "Ổn."_
- cd_tien_do >= 50:
    _Đèn chạy, loa chạy, nhưng loa trái thỉnh thoảng rè, một góc sân khấu hơi lỏng. Cần thêm một ngày._
- else:
    _Đèn chớp tắt. Loa rè. Một góc sân khấu kêu "rắc" khi {thuc_tap_sinh} bước qua. Còn hai ngày._
    ~ cd_nk(10)
}
* [📋 Ở lại tới 1 giờ sáng siết từng con ốc.]
    _1 giờ sáng. Bạn ngồi bệt trên sân khấu, tay đen dầu máy. Cái góc sân khấu không còn kêu nữa._
    ~ cd_td(6)
    ~ cd_met(15)
    ~ nghi(-20)
* [🤝 Chia ca: {it} lo đèn, {thuc_tap_sinh} lo ghế, mình lo lối thoát hiểm. 11 giờ về.]
    ~ cd_td(4)
    ~ cd_met(5)
* [🍚 Mua 10 hộp cơm tấm cho đội dựng, ngồi ăn chung trên sân khấu.]
    _Mười người ngồi trên sân khấu chưa hoàn thành, ăn cơm tấm, nhìn lên cái cột điện quấn đèn hồng. Ai cũng nghĩ: đẹp thật._
    ~ tien_cong(-350000)
    ~ an(60)
    ~ cd_td(3)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- -> END

// ------------------------------------------------------------
=== chi_dai_3010_don_kho ===
# ngay:30 # gio:07:45 # noi:gam_cau_thang
_7 giờ 45. {hr} cho dọn kho trước buổi họp đánh giá. Hai anh lao công đang khiêng một thùng carton từ gầm cầu thang ra._
_Trong thùng: chìa khóa, son môi, điện thoại cũ, một chiếc găng tay hồng, một cái USB không nhãn. Kho báu của {cho}._
_{cho} đứng ở chân cầu thang, gầm gừ, run run._
* [🛡️ "Để xuống. Đồ của {cho}. Không ai được dọn."]
    _Hai anh lao công đặt thùng xuống ngay. Không ai cãi chị Đại lúc 7 giờ 45 sáng._
    _{cho} kéo cái thùng về gầm cầu thang, nằm đè lên._
    ~ cd_giu_kho_tuat = true
    ~ qh("cho", 15)
    ~ qh("hr", -3)
* [💬 Lục thùng xem. Có gì quan trọng hông?]
    _Một chiếc USB không nhãn, mùi cà phê sữa đá. Một chiếc găng tay hồng. Bạn cầm USB lên, nghĩ tới vụ đoàn thuế cần bằng chứng dự án tháng 6._
    chi_dai: Cái này ai làm rớt, chị đưa {it} kiểm tra. Còn lại để y nguyên cho {cho}.
    ~ nhan(usb_khong_nhan)
    ~ cd_giu_kho_tuat = true
    ~ qh("cho", 5)
* [😶 Kệ. Dọn thì dọn. Hôm nay còn họp đánh giá.]
    _Thùng đồ của {cho} ra xe rác. {cho} chạy theo xe tới đầu hẻm, rồi đứng lại._
    ~ qh("cho", -20)
- -> END

// ------------------------------------------------------------
=== chi_dai_3010_hop_danh_gia ===
# ngay:30 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Họp đánh giá cuối tháng. Cả công ty. Phòng họp không đủ ghế, người đứng tới cửa._
_{giam_doc} công bố: hợp đồng {idol_het_thoi} được gia hạn thêm 6 tháng. {quan_ly_idol} thở phào. {idol_het_thoi} tháo kính đen ra, lần đầu tiên trong năm._
_Rồi {hr} đứng lên, cầm tập hồ sơ màu hồng._
hr: Về điều chỉnh nhân sự… Dòng một: {thuc_tap_sinh}…
_Bạn đứng dậy trước khi {hr} đọc tới cái tên thứ hai._
{
- cd_dan_em >= 5 && cd_doi_chat_tuan:
    -> dung_len_manh
- cd_uy_luc >= 60:
    -> dung_len
- else:
    -> dung_len_yeu
}

= dung_len_manh
chi_dai: Ông đọc tiếp đi. Mà đọc tên ai, người đó đứng sau lưng tui.
_Rồi {thuc_tap_sinh} đứng dậy, đi ra sau lưng bạn. Rồi {thanh_xin_nghi}. Rồi {editor}. Rồi {designer}. Rồi {sales}. Rồi {ke_toan}._
_Rồi Bác {bac_bao_ve}, đứng ở cửa, cũng bước vào, đứng sau cùng._
_{hr} nhìn cả hàng người. Rồi gấp tập hồ sơ lại, đặt lên bàn trước mặt bạn._
hr: Anh không đọc nữa.
* [🔥 Xé đôi tờ danh sách.]
    _Xoẹt. Âm thanh hay nhất tháng 10._
* [🤝 Đẩy tập hồ sơ về phía {giam_doc}: "Sếp xé đi. Sếp là người viết."]
    _{giam_doc} nhìn tập hồ sơ. Nhìn bạn. Nhìn cả hàng người sau lưng bạn. Rồi xé. Chậm rãi. Hai lần._
    ~ qh("giam_doc", 10)
- _Cả phòng họp im lặng. Rồi ai đó thở ra. Rồi ai đó cười._
~ cd_khong_ai_bi_duoi = true
~ cd_uy(15)
~ tinh_than_cong_ty = tinh_than_cong_ty + 15
_{giam_doc} hắng giọng: "Ừ. Nếu Đêm Hồng thành công thì… không có danh sách nào cả. Nếu không thì… anh là người đầu tiên đi."_
-> END

= dung_len
chi_dai: Ông dừng. Đêm mai mới có kết quả. Đọc danh sách hôm nay là đọc trước án.
giam_doc: *(im lặng một lúc)* Em {chi_dai} nói đúng. Tạm hoãn. Sau Đêm Hồng.
_{hr} gấp hồ sơ lại. Thở ra. Không ai bị gạch tên. Hôm nay._
* [🦁 "Không phải 'tạm'. Hủy."]
    giam_doc: …Anh hứa. Đêm Hồng thành công thì hủy.
    ~ cd_khong_ai_bi_duoi = true
    ~ cd_uy(8)
* [😶 Ngồi xuống. Thế là đủ cho hôm nay.]
    ~ cd_khong_ai_bi_duoi = true
- -> END

= dung_len_yeu
chi_dai: Ông dừng!
_Cả phòng quay lại. Nhưng không ai đứng lên theo bạn. {hr} nhìn bạn, nhìn {giam_doc}._
giam_doc: Em {chi_dai}… ngồi xuống đã. Anh hiểu, nhưng…
_{hr} đọc tiếp. Dòng hai: {thanh_xin_nghi}. Rồi gấp lại: "Hai trường hợp, hiệu lực sau 31/10 nếu chiến dịch không đạt."_
~ cd_khong_ai_bi_duoi = false
~ cd_mat_em(de_thuc_tap_sinh)
~ cd_mat_em(de_thanh_xin_nghi)
~ cd_nk(25)
~ cd_uy(-10)
-> END

// ------------------------------------------------------------
=== chi_dai_3010_toi_truoc_dem_hong ===
# ngay:30 # gio:21:00 # noi:san_thuong
_Sân thượng công ty. Đêm trước Đêm Hồng. Bên kia đường, karaoke đang hát "Công Viên". Ai đó hát sai lời "khoai chiên", cả phòng cười._
{ qh_ke_toan >= 30:
    -> co_ban
- else:
    -> mot_minh
}

= co_ban
_{ke_toan} lên, mang hai ly trà đá. Không nói gì. Ngồi xuống cạnh bạn._
ke_toan: Mai bà đứng cánh gà. Tui đứng quầy vé. Hai bà già giữ cái công ty này.
* [😇 "Hai bà già 30 tuổi."]
    ke_toan: *(cười)* Ờ. Mà mệt như 60.
    ~ cd_nk(-15)
    ~ cd_met(-10)
* [🤝 Nắm tay {ke_toan}: "Mai có gì, bà chạy trước. Tui chặn sau."]
    ke_toan: Không. Mai có gì, mình đứng chung. Như 8 năm nay.
    ~ qh("ke_toan", 10)
    ~ cd_nk(-10)
- ~ uong(30)
-> END

= mot_minh
_Không ai lên. Cả công ty đang ở karaoke bên kia đường. Bạn nghe tiếng hát vọng lên, tháo bộ đàm ra, đặt lên ghế nhựa._
* [📻 Gắn lại bộ đàm. Mai còn việc.]
    ~ cd_met(5)
* [📞 Gọi {ke_toan}.]
    _Chuông đổ. {ke_toan} không nghe. Chắc đang hát. Chắc vậy._
    ~ cd_met(10)
- -> END

// ------------------------------------------------------------
=== chi_dai_3110_sang_dem_hong ===
# ngay:31 # gio:10:00 # noi:san_khau_dem_hong # bat_buoc
_31/10. Đêm Hồng Halloween. 19:30 mở màn. Còn 9 tiếng rưỡi._
_{giam_doc} tới sân khấu trong bộ hóa trang "Ông Kẹ Ngân Hàng": áo vest đen, mặt nạ, tay cầm một cuốn sổ nợ giả. Không ai cười, vì không ai chắc anh đang đùa._
_{thanh_xin_nghi} đứng ở chân sân khấu, gãi đầu, cầm tờ giấy xin nghỉ: "Dạ… tối nay em xin về sớm lúc 7 giờ ạ… bà ngoại em…"_
_Bạn biết. 20:00 tối nay là chung kết trực tiếp "Giọng Ca Ước Mơ" ở Đài Tivi Hóng._
* [🤝 "Đi đi. Chị thấy em trên tivi bữa giờ. Hát cho đã."]
    thanh_xin_nghi: *(ngẩng phắt lên)* Chị… biết?
    chi_dai: Biết lâu rồi. Bà ngoại em mà nghe em hát chắc khỏi bệnh liền.
    _{thanh_xin_nghi} ôm bạn. Rồi chạy. Rồi quay lại cảm ơn. Rồi chạy tiếp._
    ~ qh("thanh_xin_nghi", 20)
    ~ cd_bao_ke(de_thanh_xin_nghi)
    ~ cd_td(-2)
* [🦁 "Ở lại tới 7 giờ. Lịch trình nghệ sĩ là việc của em. 7 giờ chị cho xe chở em đi."]
    thanh_xin_nghi: Dạ! Dạ được chị! 7 giờ em đi!
    _Tới 7 giờ, lịch trình được bàn giao đầy đủ. {thanh_xin_nghi} lên xe với bộ đồ kim tuyến gói trong túi nilon._
    ~ qh("thanh_xin_nghi", 10)
    ~ cd_td(2)
* [😶 "Hôm nay hông ai được nghỉ."]
    _{thanh_xin_nghi} gật đầu, đi ra. Tới 7 giờ thì không thấy đâu nữa._
    ~ qh("thanh_xin_nghi", -10)
- _Bạn bấm bộ đàm. Kiểm tra lần cuối: đèn, loa, máy phát, lối thoát hiểm, lối của {sieu_nhan_hong}, lối của {cho}._
_Mọi tiếng trả lời đều là: "Rõ, chị Đại."_
-> END

// ------------------------------------------------------------
=== chi_dai_3110_canh_ga ===
# ngay:31 # gio:19:30 # noi:canh_ga_dem_hong # bat_buoc
~ cd_dang_quay = true
_19:30. Sân khấu Đêm Hồng. Cả nghìn khán giả. Truyền hình trực tiếp. Mở màn bằng phim ngắn "Người Hùng Không Tên", rồi video "16 năm" của {editor}._
_Bạn đứng sau cánh gà, bộ đàm bên tai, tay đặt lên cầu dao tổng._
{
- cd_tien_do >= 80:
    _Mọi thứ chạy như đồng hồ. Đèn đổi màu đúng nhịp. Loa trong. Khói lan đúng lúc._
- cd_tien_do >= 50:
    _Mọi thứ chạy. Có lúc loa trái rè một nhịp, có lúc đèn chậm nửa giây. Khán giả không để ý. Bạn để ý hết._
- else:
    _Đèn chớp. Loa rè. MC hỏi qua bộ đàm "Em ra lúc nào?" ba lần. Bạn nghiến răng._
}
_20:10. {sieu_nhan_hong} chuẩn bị bước ra. Bộ đàm của Bác {bac_bao_ve} rè rè: "Cổng sau. Thằng áo nhiều túi, máy ảnh ống dài. Nó vào được rồi."_
_Paparazzi Mắt Diều Hâu. Đang đi về phía phòng chờ của {sieu_nhan_hong}._
* [🛡️ Bỏ cầu dao cho {it}, tự đi chặn paparazzi.]
    _Bạn đứng chắn ở cửa phòng chờ. Gã paparazzi giơ máy ảnh: "Một tấm thôi, một tấm!"_
    chi_dai: Một tấm cũng hông. Đi ra. Hoặc chị dắt ra.
    _Gã nhìn bạn. Nhìn bộ đàm. Hạ máy ảnh. Đi ra._
    ~ cd_paparazzi_bi_duoi = true
    ~ cd_uy(5)
* [📻 Bộ đàm: "Bác {bac_bao_ve}. Gọi {cho}."]
    _Mười giây sau, tiếng sủa vang khắp hậu trường. Gã paparazzi bị {cho} rượt chạy vòng quanh cột điện quấn đèn hồng, ba vòng, rồi ra cổng._
    ~ cd_paparazzi_bi_duoi = true
    ~ qh("cho", 5)
    ~ follow(10000)
* {cd_no_khi >= 70} [🥋 Ra Tay. Năm giây.]
    _Bạn đi thẳng tới, giật máy ảnh, rút thẻ nhớ, trả máy. Năm giây. Đúng lúc đó, một camera truyền hình lia qua._
    ~ cd_nk(30)
    ~ cd_paparazzi_bi_duoi = true
    ~ scandal()
    { RANDOM(1, 10) <= 5:
        ~ follow(50000)
    - else:
        ~ follow(-80000)
    }
* [😶 Giữ cầu dao. Sân khấu quan trọng hơn.]
    _Bạn không rời cầu dao. Gã paparazzi lách vào được phòng chờ. Bạn nghe tiếng màn trập máy ảnh, liên tục._
    ~ cd_nk(10)
- { cd_vua_no:
    ~ cd_vua_no = false
    -> chi_dai_tudo_bung_no
}
_20:20. {sieu_nhan_hong} bước ra sân khấu. Hát. Múa. Rồi giữa bài, đứng im. Hai tay đặt lên chiếc mũ hồng._
_Bộ đàm của bạn im lặng. Cả nghìn người im lặng._
* [📻 Bộ đàm cho đội đèn: "Rọi đèn trắng. Một luồng. Vào giữa."]
    _Một luồng đèn trắng rọi xuống. {sieu_nhan_hong} tháo mũ. Mặt thật. Một anh chàng bình thường, mắt đỏ, đang cười._
    _Khán giả im ba giây. Rồi đứng dậy. Rồi vỗ tay. Rồi hét tên. Tên thật._
    ~ nguyen_thao_mu_dem_hong = true
    ~ cd_td(3)
* [🛡️ Bộ đàm: "Tắt đèn sân khấu 5 giây. Cho cậu ấy chọn trong bóng tối."]
    _Đèn tắt. Năm giây. Khi đèn bật lại, {sieu_nhan_hong} vẫn đội mũ. Khán giả gào lên. Có những thứ nên để bí ẩn._
* [😶 Không làm gì. Đây là khoảnh khắc của cậu ấy.]
    _{sieu_nhan_hong} đứng đó rất lâu. Rồi hạ tay xuống, cười, hát tiếp._
- -> chi_dai_3110_ket_dem

// ------------------------------------------------------------
=== chi_dai_3110_ket_dem ===
# ngay:31 # gio:22:00 # noi:san_khau_dem_hong
~ cd_dang_quay = false
{
- cd_tien_do >= 80:
    _22:00. Bài cuối. Pháo giấy hồng. Khán giả hát theo "Hồng là thái độ" tới khản cổ. Trên mạng: \#DemHong lên top 3 xu hướng._
    ~ follow(150000)
- cd_tien_do >= 50:
    _22:00. Show kết thúc. Không hoàn hảo, nhưng tròn trịa. Khán giả về, vừa đi vừa hát._
    ~ follow(40000)
- else:
    _22:00. Một góc sân khấu sụp xuống trong bài cuối. Không ai bị thương. Nhưng clip "sân khấu sập" chạy khắp mạng nhanh hơn mọi bài hát._
    ~ follow(-100000)
}
_Bạn tháo bộ đàm ra. Nó nóng như vừa chạy cả một tháng. Đúng là nó vừa chạy cả một tháng._
-> chi_dai_3010_danh_gia

// ------------------------------------------------------------
=== chi_dai_tudo_bung_no ===
# dieu_kien:cd_no_khi_100
_Nộ Khí: 100. Bạn nghe tiếng máu dồn lên tai, như tiếng bao cát đứt dây._
~ cd_vua_no = false
{ cd_dang_quay:
    _Đèn đỏ của máy quay vẫn sáng. Bạn biết. Bạn không dừng được._
    _Bạn lật cái bàn gần nhất. Ly nhựa bay. Bánh bay. Giọng bạn vang khắp sảnh, khắp mạng, khắp cả Thành Phố Ước Mơ._
    ~ cd_no_tren_song = true
    ~ scandal()
    { RANDOM(1, 10) <= 5:
        ~ follow(-50000)
    - else:
        _Một phút sau, có người cắt clip, ghép chữ "CHỊ ĐẠI HỒNG". Không ai đoán được nó sẽ đi về đâu._
        ~ follow(30000)
    }
- else:
    _May mà không có máy quay. Bạn đập tay xuống bàn ba lần, đi ra sân thượng, hét một tiếng vào trời chiều. Con chim trên cây phơi đồ bay mất._
    ~ cd_uy(-5)
}
~ cd_no_khi = 30
~ cd_met(10)
-> END
