// ============================================================
// IT: BẢO · CHƯƠNG 6: "NGÀY INTERNET QUỐC TẾ" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== it_2810_video_nham ===
# ngay:28 # gio:02:10 # noi:phong_server # bat_buoc
_2 giờ 10 sáng. Bạn đang ngủ trên ghế xếp thì điện thoại báo: fanpage {cong_ty} vừa đăng một video mới, tên file "Thai_final_v12"._
_Video dài 2 phút, dựng rất đẹp: toàn cảnh {quan_ly_idol} cười, {quan_ly_idol} ngủ gục trong xe, {quan_ly_idol} cầm hai điện thoại. Cuối video có dòng chữ: "Anh có biết là có người luôn nhìn anh không?"_
_Một con cú nhỏ giấu ở góc khung hình. Bạn biết ngay video này của ai. Và biết ngay: nó bị xuất nhầm._
_Bạn là admin kỹ thuật của trang. Lượt xem đang nhảy: 400. 900. 1.500._
* [🗑️ Gỡ video ngay lập tức.]
    _2 giờ 16. Bạn gỡ. Video nằm trên trang đúng 6 phút, khoảng 2.000 lượt xem. 2 giờ sáng, ai xem cũng tưởng mình nằm mơ._
    _Năm phút sau, {editor} nhắn: "Anh… anh thấy rồi hả." Bạn trả lời: "Không thấy gì."_
    ~ qh("editor", 30)
    ~ it_lt(5)
    ~ it_cam_on()
* [💬 Nhắn {editor} trước, hỏi có muốn gỡ không.]
    editor: *(gõ rất lâu)* …Anh gỡ giùm em. Em run quá bấm không được.
    _2 giờ 16, bạn gỡ. 6 phút, khoảng 2.000 lượt xem. Sáng hôm đó, {quan_ly_idol} hỏi cả phòng nghệ sĩ: "Có ai lưu cái video đó không?" Không ai trả lời._
    ~ qh("editor", 20)
    ~ phat_hien(linh_thich_thai)
* [😴 Ngủ tiếp. Mai tính.]
    _Sáng ra, video đã biến mất. {editor} tự gỡ lúc 2 giờ 16, sau 6 phút và khoảng 2.000 lượt xem. Nhưng {hong_hot} đã kịp chụp màn hình._
    ~ qh("editor", -10)
    ~ phat_hien(linh_thich_thai)
- { nguoi_theo_doi < 800000:
    _Ngày 28/10, mốc 4. Chưa tới 800.000. Trên mạng bắt đầu có tin: LL-Entertainment đang "rất quan tâm" tới {sieu_nhan_hong}._
    ~ cang_thang(10)
- else:
    _Ngày 28/10, mốc 4: qua 800.000. Bạn kiểm tra lại server 3 lần, như kiểm tra khóa cửa trước khi đi xa._
}
-> END

// ------------------------------------------------------------
=== it_2910_wifi_sap ===
# ngay:29 # gio:09:00 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. 9 giờ đúng. Wifi sập. Cả tòa nhà. Không một vạch sóng._
_Bạn nghe tiếng bước chân dồn dập từ tầng 2 xuống: {truong_phong}, {hong_hot}, {sales}, {dan_dau_tu}, {chua_te_deadline}…_
hong_hot: ANH {it}! Chiến dịch đứng hình rồi! Fanpage không đăng được! Tóp-tóp không lên!
editor: *(mắt đỏ)* Video "16 năm"… kẹt ở 99%… anh {it} ơi…
* [📱 Phát 4G từ điện thoại cho máy của {hong_hot} trước.]
    hong_hot: Được rồi! Để tui phát tiếp cho cả phòng. Mật khẩu: "nghegichua"!
    _Mạng tạm bợ chạy được. Chiến dịch nhích từng bước như người bò trong sa mạc._
    ~ follow(5000)
    ~ qh("hong_hot", 10)
    ~ tien_cong(-100000)
* [🏃 "Đi tìm nguyên nhân." Chạy xuống tầng trệt.]
    _Bạn chạy. Cả đám chạy theo. Đây là lần đầu tiên trong 10 năm, cả công ty đi theo IT._
    ~ it_do_toi(5)
* [🔄 Khởi động lại router.]
    _Bạn khởi động lại. Đèn router vẫn đỏ. Khởi động lại lần nữa. Vẫn đỏ. Lần đầu tiên, tắt đi bật lại không cứu được._
    ~ it_do_toi(10)
    ~ cang_thang(10)
- _Ở chòi bảo vệ, Bác {bac_bao_ve} đã dựng một tấm bìa: "TỔNG ĐÀI NHẮN TIN BẰNG GIẤY". {chi_dai} đứng cạnh, cầm bộ đàm điều phối._
chi_dai: {it}. Em lo cái mạng. Chuyện nhắn tin để chị với bác lo.
-> END

// ------------------------------------------------------------
=== it_2910_tu_mang ===
# ngay:29 # gio:09:30 # noi:tu_mang_tang_tret # bat_buoc
{ it_lay_ga_cao_su:
    ~ it_thu_pham_29 = ran_thu_hai
- else:
    ~ it_thu_pham_29 = "cho"
}
_Bạn mở tủ mạng tầng trệt. 48 sợi dây xanh. Sợi cáp quang chính, cái sợi nuôi cả tòa nhà, đứt làm đôi. Cáp quang thì không nối bằng tay được: phải chờ thợ nhà mạng._
{ it_thu_pham_29 == "cho":
    _Chỗ đứt tua rua, ướt nhẹp, đầy dấu răng. Bên cạnh, con gà cao su màu vàng nằm nghiêng, như vừa được giải cứu._
- else:
    _Chỗ đứt phẳng lì, gọn gàng. Vết cắt bằng kéo. Không phải răng. Không phải chuột. Có người._
}
dan_dau_tu: Router cũ quá chứ gì! Anh nói rồi mà!
truong_phong: Cậu {it}, mình họp nhanh về nguyên nhân sự cố nhé.
* [📜 Mở log camera hành lang tầng trệt.]
    ~ it_tim_ra_thu_pham = true
    { it_thu_pham_29 == "cho":
        _Camera 8:52 sáng: {cho} chui vào khe tủ, cào cào, gặm gặm, rồi lôi ra con gà cao su, vẫy đuôi tự hào._
        _Cả đám đứng sau lưng bạn xem. Im lặng. Rồi {hong_hot} bật cười trước tiên._
        hong_hot: Thủ phạm có lông! Ối dồi ôi!
        bac_bao_ve: *(thở dài)* {cho}. Lại đây.
        cho: Ẳng… *(cúi đầu, đuôi vẫn hơi vẫy)*
        ~ qh("cho", -5)
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    - else:
        _Camera 8:55 sáng nay: một bóng người đội mũ lưỡi trai, cầm kéo, đứng trước tủ mạng đúng 40 giây. Rồi quay mặt lại một chút, đủ để bạn nhận ra._
        _Là {ten(ran_thu_hai)}._
        ~ phat_hien(ran_thu_hai_lo_mat)
        ~ qh(ran_thu_hai, -40)
        ~ uy_tin = uy_tin + 10
        bac_bao_ve: *(nhìn màn hình rất lâu)* Thế à. Bác không thấy gì đâu. Nhưng camera thì thấy.
    }
    ~ it_do_toi(-30)
* [🔧 Kệ thủ phạm. Gọi nhà mạng trước đã.]
    _Bạn gọi 14 cuộc. Cuộc thứ 14, tổng đài hẹn: "Tối nay thợ tới." Bạn đánh dấu sợi cáp, dọn sạch tủ, chuẩn bị sẵn mọi thứ cho thợ._
    ~ it_on(5)
    _Nhưng không ai biết vì sao dây đứt. Và tin đồn "tại router cũ" lan nhanh hơn wifi._
    ~ it_do_toi(5)
* [😶 "Router cũ. Đúng rồi."]
    _Bạn nhận lỗi để mọi chuyện qua nhanh. Mọi chuyện qua nhanh thật. Cùng với uy tín của bạn._
    ~ it_do_toi(20)
- _Thợ nhà mạng hẹn tối. Cả ngày, video "16 năm" của {editor} đứng ở 99%._
-> END

// ------------------------------------------------------------
=== it_2910_tong_dai_giay ===
# ngay:29 # gio:15:00 # noi:choi_bao_ve
_Chiều. Mạng chưa về. Chòi bảo vệ thành tổng đài, đầy giấy nhắn. Bác {bac_bao_ve} đang xếp từng tờ, như xếp thư._
bac_bao_ve: Cả buổi sáng các cháu nhắn nhau bằng giấy. Hay phết. Không ai nói xấu ai cả. Nói xấu bằng giấy thì ngại.
_Trong xấp giấy có một tờ ghi: "Cảm ơn anh {it}. Không có anh chắc tụi em chết." Không ký tên._
* [💬 "Bác, con giữ tờ này được không?"]
    bac_bao_ve: Của cháu mà. Cầm đi.
    _Bạn gấp tờ giấy, bỏ vào túi áo, cạnh cuộn băng keo đen._
    ~ it_cam_on()
    ~ cang_thang(-15)
* [🍵 Ngồi xuống uống trà với bác.]
    bac_bao_ve: Mười năm cháu ở đây. Hôm nay là lần đầu cả công ty chạy theo cháu nhỉ.
    it: Chạy để chửi.
    bac_bao_ve: Chửi là còn cần. Không ai chửi mới đáng lo.
    ~ qh("bac_bao_ve", 10)
    ~ uong(25)
- -> END

// ------------------------------------------------------------
=== it_2910_tho_nha_mang ===
# ngay:29 # gio:22:00 # noi:tu_mang_tang_tret # bat_buoc
_22 giờ. Thợ nhà mạng tới, đèn pin ngậm ở miệng, máy hàn cáp quang kêu vo vo. Bạn cầm đèn cho anh ấy. {editor} ngồi bệt ở bậc cầu thang, ôm laptop, thanh tiến trình vẫn 99%._
* [🔦 Đứng cầm đèn tới khi xong, không đi đâu.]
    ~ it_on(10)
    ~ nghi(-15)
    _Bạn cầm đèn 47 phút, tay không run lần nào._
* [🧶 Tranh thủ đi lại dây dự phòng cho tủ mạng, phòng lần sau.]
    ~ it_on(15)
    ~ nghi(-25)
    _Thợ nhà mạng nhìn đường dây bạn đi, gật đầu: "Ông này làm kỹ."_
- _22 giờ 47. Đèn router chuyển xanh. Cả tòa nhà có wifi lại. Trên laptop của {editor}, video "16 năm" nhảy từ 99% lên 100%._
editor: *(không ngẩng lên, giọng khàn)* Anh {it}… cảm ơn anh.
~ it_cam_on()
~ qh("editor", 5)
-> END

// ------------------------------------------------------------
=== it_3010_don_kho ===
# ngay:30 # gio:08:00 # noi:gam_cau_thang
_Trước họp đánh giá, {hr} cho dọn kho. Ai cũng phải dọn. {thuc_tap_sinh} được giao dọn gầm cầu thang._
thuc_tap_sinh: Dạ anh {it} ơi, ở đây có một đống đồ lạ ạ. Chìa khóa, son môi, điện thoại cũ, một cái găng tay hồng… Em bỏ hết vô bao rác ạ?
_Đó là kho báu của {cho}. Bạn nhìn cái bao rác đen. Rồi nhìn {cho} đang đứng ở chân cầu thang, mắt to tròn._
* [🛡️ "Để nguyên. Đây là… kho thiết bị IT."]
    thuc_tap_sinh: Dạ? Son môi là thiết bị IT ạ?
    it: Ừ. Để test màn hình.
    thuc_tap_sinh: Dạ em hiểu rồi ạ!
    ~ it_bao_ve_kho_tuat = true
    ~ qh("cho", 25)
    ~ qh("thuc_tap_sinh", 5)
    cho: Gâu! *(chạy tới, đặt lên chân bạn một cây xúc xích đã gặm một nửa)*
    ~ nhan(xuc_xich)
* [🧤 Chỉ lấy cái găng tay hồng ra, phần còn lại để yên.]
    _Bạn cất chiếc găng tay hồng vào túi. Biết đâu có ngày dùng tới._
    ~ nhan(gang_tay_hong)
    ~ it_bao_ve_kho_tuat = true
    ~ qh("cho", 10)
* [😶 "Ừ, dọn đi."]
    _Bao rác đen được buộc lại. {cho} nằm xuống chân cầu thang, không ăn sáng._
    ~ qh("cho", -20)
- -> END

// ------------------------------------------------------------
=== it_3010_tong_duyet ===
# ngay:30 # gio:19:00 # noi:san_khau_dem_hong # bat_buoc
_Tổng duyệt Đại Nhạc Hội Siêu Nhân. Sân khấu ngoài trời. 64 cây đèn, 12 cái loa, 4 micro, 1 cầu dao tổng. Bạn đứng sau cánh gà, kiểm tra từng thứ._
chi_dai: {it}. Đêm mai là đêm cuối. Em cần gì, nói chị. Bây giờ.
_Bạn nhìn danh sách. Thiếu một cái khóa cho tủ cầu dao. Thiếu dây dự phòng. Thiếu người thứ hai đứng cạnh cầu dao._
* [🔒 "Khóa tủ cầu dao. Chìa em giữ."]
    chi_dai: Được. Chị mua liền.
    _Mười phút sau {chi_dai} mang về một ổ khóa to như nắm tay. Bạn khóa tủ, đeo chìa vào cổ._
    ~ it_on(10)
    ~ it_dem_hong_san_sang = true
* [🧶 "Dây dự phòng. Mọi thứ, hai bộ."]
    _Bạn với {chi_dai} lục kho tới 11 giờ đêm, đủ hai bộ dây cho mọi thiết bị. Tay ai cũng đen nhẻm._
    ~ it_on(15)
    ~ nghi(-20)
    { it_on_dinh >= 70:
        ~ it_dem_hong_san_sang = true
    }
* [👤 "Một người canh cầu dao với em."]
    chi_dai: Để chị kêu Bác {bac_bao_ve}. Bác không rời vị trí bao giờ.
    bac_bao_ve: Ừ. Bác đứng. Cháu bấm đèn, bác giữ cầu dao. Đứa nào đụng vào, có {cho}.
    cho: Grừ… *(gật gù rất nghiêm túc)*
    ~ it_dem_hong_san_sang = true
    ~ qh("bac_bao_ve", 10)
* [😴 "Đủ rồi chị. Em ngủ chút."]
    chi_dai: Ngủ đi. Mai có gì là chị réo.
    ~ nghi(30)
- { it_su_co_am_thanh:
    _Bạn nhớ những lần rớt mạng, rớt hình trong tháng. Đêm mai không được có lần nào nữa._
}
-> END

// ------------------------------------------------------------
=== it_3110_canh_ga ===
# ngay:31 # gio:18:00 # noi:san_khau_dem_hong # bat_buoc
_Đại Nhạc Hội Siêu Nhân. Cả công ty hóa trang. {giam_doc} hóa trang "Ông Kẹ Ngân Hàng", tay cầm cuốn sổ nợ bằng bìa cứng. Không ai dám cười._
_Bạn đứng sau cánh gà, tai đeo bộ đàm, tay đặt trên bàn điều khiển đèn. Bên cạnh là tủ cầu dao tổng._
_Điện thoại bạn rung. {thanh_xin_nghi}: "Anh {it}, 20:00 em thi chung kết. Nếu em không ở đây, anh lo giùm em phần lịch trình đèn nha."_
* [💬 "Đi thi đi. Đèn anh lo."]
    _{thanh_xin_nghi} gửi lại một sticker con mèo cúi đầu. Rồi một tin: "Anh là người đầu tiên biết mà hông nói với ai. Cảm ơn anh."_
    ~ qh("thanh_xin_nghi", 15)
    ~ it_cam_on()
* [📺 Mở sẵn kênh Đài Tivi Hóng trên màn hình phụ.]
    _Bạn sẽ vừa đánh đèn, vừa liếc xem {thanh_xin_nghi} hát. Đa nhiệm là kỹ năng sống còn của IT._
    ~ qh("thanh_xin_nghi", 5)
- { it_thu_pham_29 != "cho" and not it_tim_ra_thu_pham:
    _18:40. Có ai đó đi ngang tủ cầu dao, dừng lại, nhìn ổ khóa, rồi đi tiếp. Bạn không thấy rõ mặt. Chỉ ngửi thấy mùi gì đó như… lá chuối._
    { not it_dem_hong_san_sang:
        ~ it_su_co_am_thanh = true
    }
}
-> END

// ------------------------------------------------------------
=== it_3110_dem_hong ===
# ngay:31 # gio:19:20 # noi:san_khau_dem_hong # bat_buoc
_19:20. Mười phút nữa mở màn. Bạn đứng sau bàn đèn, tai đeo bộ đàm, kịch bản đèn dán bằng băng keo đen lên mặt bàn._
{ it_ban_thu_cho == "editor":
    _Video "16 năm" của {editor} tối nay dùng bản thu mộc "Công Viên" năm 2015 làm nhạc nền. Ở hàng đầu, {idol_het_thoi} chưa biết._
}
{ it_ban_thu_cho == "idol_het_thoi":
    _{idol_het_thoi} nhắn: "Tối nay anh xin một bài hát mộc. Em giữ đèn cho anh nha." Bạn ghi thêm một dòng vào kịch bản đèn._
}
{ nguyen_theo_ll:
    -> it_3110_dem_hong.vang_nguyen
}
chi_dai: *(qua bộ đàm)* {it}. Bài cuối, nếu ổng đưa tay lên mũ, em chiếu đèn gì? Chị phải báo trước cho máy quay.
* [💡 Đèn trắng. Rõ. Ai muốn thấy thì thấy.]
    ~ qh("chi_dai", 5)
    _Bạn ghi vào kịch bản: "Bài cuối, nếu tay lên mũ: TRẮNG." Tháo hay không là chuyện của ổng. Nhưng nếu tháo, mọi người sẽ thấy rõ._
* [🩷 Hồng mờ. Cho người đứng đó một chỗ để trốn.]
    ~ qh("sieu_nhan_hong", 10)
    _Bạn ghi: "Bài cuối, nếu tay lên mũ: HỒNG MỜ." Điều khoản số 1 nói không ai được ép. Đèn cũng không._
* [⚡ Bấm 8 lần đèn hồng liên tục. Luật công ty.]
    ~ qh("giam_doc", 5)
    _Bạn ghi: "8 lần hồng." {giam_doc} sẽ vui. Còn khoảnh khắc đó thì sẽ trôi qua thật nhanh._
- { it_dem_hong_san_sang:
    _Bộ đàm rè rè. Giọng Bác {bac_bao_ve}, đứng cạnh tủ cầu dao: "Bác đứng đây rồi. Không ai đụng vào cái gì cả."_
- else:
    _Tủ cầu dao không khóa, không ai đứng canh. Bạn nhìn nó một lần nữa rồi quay về bàn đèn. Không còn thời gian._
}
_19:30. Đèn tắt. Màn hình lớn bật lên._
-> END

= vang_nguyen
chi_dai: *(qua bộ đàm)* {it}. Không có {sieu_nhan_hong}. {idol_het_thoi} lên thay. Đèn sao em?
* [💡 Một vệt trắng, rõ. Cho người đứng đó thấy khán giả.]
    ~ qh("idol_het_thoi", 10)
    _Bạn sửa kịch bản đèn: "Bài 1: TRẮNG. Không hồng." Tối nay không có ai cần trốn._
* [🩷 Hồng mờ. Cho sân khấu đỡ trống.]
    ~ qh("chi_dai", 5)
    _Bạn để nguyên màu hồng. Sân khấu hồng mà không có người mặc đồ hồng._
- _19:30. Đèn tắt. Màn hình lớn bật lên._
-> END
