// ============================================================
// THÁNH HÓNG: NGÂN · CHƯƠNG 2: "HỘI ANTI SẾP" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== hong_hot_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_tang_2
_Họp giao ban. Ngày Nhà giáo Thế giới. {thuc_tap_sinh} đi vòng quanh bàn tặng hoa cho "thầy cô"._
thuc_tap_sinh: Dạ chị {hong_hot}, hoa của chị ạ. Chị dạy em cách đăng story không bị sếp thấy ạ.
_Cả phòng quay lại nhìn bạn. Sếp cũng quay lại._
giam_doc: Đăng story không bị anh thấy là thế nào?
* [😇 "Dạ là… chế độ bạn thân, để đăng ảnh đồ ăn thôi anh."]
    giam_doc: À. Thế thì được. Anh cũng không thích xem đồ ăn.
    ~ qh("thuc_tap_sinh", 3)
* [🧂 "Dạ là bí kíp bảo mật thông tin công ty đó anh, em dạy cả phòng."]
    giam_doc: Ồ! Tốt! Có ý thức bảo mật!
    ~ uy_tin = uy_tin + 2
    _{thuc_tap_sinh} gật đầu lia lịa, không hiểu vì sao mình vừa được khen ké._
* [🎥 Quay clip {thuc_tap_sinh} tặng hoa, đăng "Thực tập sinh 30 tuổi tri ân thầy cô".]
    ~ hh_follow(5000)
    ~ hh_tt(3)
    thuc_tap_sinh: Dạ… em lên mạng hả chị? Em… em xin che mặt được không ạ?
    _Bạn che bằng sticker hình bông hoa. Clip vẫn viral. Bình luận: "Anh thực tập sinh dễ thương quá"._
    ~ qh("thuc_tap_sinh", -2)
- truong_phong: Rồi, mình sync nhanh 5 phút nhé.
_10 giờ 32._
-> END

// ------------------------------------------------------------
=== hong_hot_0510_tien_tro ===
# ngay:5 # gio:18:30 # noi:hem_69
_Mùng 5. Bà Tư ngồi chặn đầu dãy, quạt nan, sổ thu tiền trên đùi._
ba_tu: Nay mùng mấy rồi con? Mùng 5. Một triệu tám tiền trọ, cộng điện. Mà sao tháng này điện phòng con lên 600 nghìn vậy?
_Ring light. Ba cái điện thoại sạc cả đêm. Đèn LED dán quanh tường._
* [💸 Nộp đủ, cười trừ.]
    ~ tien_cong(-2400000)
    ba_tu: Ừ. Mà nghe gì chưa, thằng phòng 3 mới dọn vô á, đêm nào cũng viết sổ. Bà nghe nó lẩm bẩm tên con hoài.
    ~ hh_tin(1)
* [👀 "Bà ơi, nghe gì chưa, công ty con mới ký hợp đồng 5 tỷ á!"]
    ~ tien_cong(-2400000)
    ~ hh_ke_tin()
    ba_tu: Năm tỷ? Vậy tháng sau bà tăng tiền trọ nha.
    _Tin của bạn vừa tăng giá phòng trọ cả dãy A._
- -> END

// ------------------------------------------------------------
=== hong_hot_0510_moi_hieu_vao_group ===
# ngay:5 # gio:22:05 # noi:nha_hong_hot
_22:00, sếp nhắn group công ty: "Tuần mới, năng lượng mới, cả nhà nhé!". 22:01, group "Hội Anti Sếp" (14 thành viên) nổ tung: 38 tin nhắn chế ảnh sếp._
_Trong danh sách thành viên, có một tài khoản tên "Hoa Hướng Dương 1989" vừa online._
_Bên kia vách, {ran_doc} gõ hai cái: "mượn mì gói"._
* [📲 Mời {ran_doc} vào group "Hội Anti Sếp".]
    ~ hh_moi_hieu_vao_group = true
    ~ qh("ran_doc", 10)
    ran_doc: *(vọng qua tường)* Ủa có group này hả? Vô liền!
    _Thành viên thứ 15. {ran_doc} không nói câu nào trong group, chỉ đọc. Đọc rất kỹ._
* [🍜 Đưa gói mì qua cửa sổ, không nhắc tới group.]
    ~ qh("ran_doc", 3)
    ran_doc: Cảm ơn bà. Mà bà cười gì một mình vậy? Đọc gì vui vậy?
    hong_hot: Hông có gì! Tóp-tóp thôi!
* [😶 Giả vờ ngủ.]
    ~ nghi(10)
- -> END

// ------------------------------------------------------------
=== hong_hot_0610_clip_ba_cu ===
# ngay:6 # gio:10:45 # noi:studio_tang_2 # bat_buoc
_Buổi chụp poster đầu tiên. Đang chụp dở, {sieu_nhan_hong} thấy một bà cụ bị giật túi ở đầu đường, hét "Biến hình!" rồi chạy mất._
_Năm phút sau, một người qua đường đăng clip: {sieu_nhan_hong} đỡ bà cụ, trả túi, cúi chào. Clip có 800 lượt xem._
dan_dau_tu: *(nghiêng màn hình về phía bạn)* Ngân. Đừng đăng giờ này. Khung 19:47 tối nay tệp người xem rảnh nhất tuần. Tin anh, số liệu không nói dối. Coin thì có.
* [📊 Nghe {dan_dau_tu}, chờ tới 19:47, viết caption "Một ngày Siêu Nhân Hồng bỏ việc".]
    ~ hh_follow(120000)
    ~ hh_tt(15)
    ~ qh("dan_dau_tu", 10)
    _19:47. Clip nổ. Lượt xem gấp mười hai lần MV sau này. Lần đầu tiên con số trên fanpage chạy nhanh hơn ngón tay bạn bấm._
* [⚡ Đăng ngay lập tức, tốc độ là tất cả.]
    ~ hh_follow(30000)
    ~ hh_tt(5)
    _Clip lên lúc 10:52, giữa giờ làm. Người ta xem, thả tim, rồi quay lại họp._
* [🎞️ Gửi {editor} dựng lại cho "xịn" rồi mới đăng.]
    editor: *(ngáp)* Đợi render xong…
    _Render xong lúc 2 giờ sáng. Clip đẹp như phim. Nhưng có trang khác đã đăng bản gốc từ chiều._
    ~ hh_follow(45000)
    ~ qh("editor", 3)
- giam_doc: *(lên tầng, mặt đỏ)* Bỏ ngang buổi chụp thế này à! Thuê studio cả buổi đấy!
_Bạn chìa điện thoại cho sếp xem bình luận. Sếp đọc. Sếp im._
-> END

// ------------------------------------------------------------
=== hong_hot_0710_moc_1 ===
# ngay:7 # gio:16:00 # noi:ban_so_lieu # bat_buoc
_Mốc 1: 50.000 người theo dõi. Bạn là người đầu tiên biết đạt hay không. Con số: {nguoi_theo_doi}._
dan_dau_tu: *(ghé tai)* Làm đẹp số liệu hả? Một ly cà phê sữa đá, anh làm tròn cho. Làm tròn lên. Tin anh.
{ nguoi_theo_doi >= 50000:
    _Đạt. Bạn chụp màn hình, tay run vì vui._
- else:
    _Chưa đạt. Thiếu {50000 - nguoi_theo_doi} người. Sếp sẽ họp khẩn, "truyền lửa" 3 tiếng._
}
* [☕ "Ok anh, một ly cà phê sữa đá." *(làm đẹp báo cáo)*]
    ~ tien_cong(-35000)
    ~ qh("dan_dau_tu", 5)
    ~ hh_lo(3)
    _Báo cáo gửi sếp ghi: "Vượt mốc, đà tăng trưởng 300%". Con số thật không đổi._
    { nguoi_theo_doi < 50000:
        ~ uy_tin = uy_tin - 5
        _{thanh_ninh} đọc báo cáo trước khi trình sếp. Nhướng một bên mày. Không nói gì._
    }
* [📊 Gửi số thật.]
    ~ uy_tin = uy_tin + 3
    { nguoi_theo_doi < 50000:
        giam_doc: Họp khẩn! Ba tiếng! Truyền lửa!
        ~ cang_thang(15)
        ~ nghi(-15)
    - else:
        giam_doc: Tốt! Ngân giỏi!
        ~ qh("giam_doc", 5)
    }
* [👀 Báo cho group "Hội Anti Sếp" trước, báo sếp sau.]
    ~ hh_ke_tin()
    ~ hh_lo(2)
    _Group biết trước sếp 14 phút. Hoa Hướng Dương 1989 thả haha. Rồi 14 phút sau, sếp nhắn bạn: "Bao nhiêu rồi em?"_
- -> END

// ------------------------------------------------------------
=== hong_hot_0810_kham_mat ===
# ngay:8 # gio:14:00 # noi:phong_kham_khoe_re
_Ngày Thị giác Thế giới. {editor} bị bắt đi khám mắt. Bạn đi theo "để quay content sức khỏe công sở"._
bac_si_khoe_re: Em này thức đêm bao nhiêu đêm rồi? Mắt như mắt cú.
editor: *(ngáp)* Dạ… đợi render xong…
_Bạn để ý: trên màn hình khóa điện thoại của {editor} có một thông báo "Cú Đêm Cắt Ghép: 980.000 người đăng ký"._
* [🔍 Nhìn kỹ, ghi nhớ.]
    ~ hh_tin(2)
    ~ phat_hien(kenh_cu_dem)
    _"Cú Đêm Cắt Ghép". Kênh dựng phim nổi tiếng mà cả công ty hay xem lén. Mỗi video đều giấu một con cú nhỏ. Và người làm đang ngồi cạnh bạn, nhỏ thuốc mắt._
* [🎥 Quay {editor} nhỏ thuốc mắt, đăng "Editor công ty mắt như cú".]
    ~ hh_follow(3000)
    editor: Chị… đừng đăng mặt em…
    ~ qh("editor", -5)
- -> END

// ------------------------------------------------------------
=== hong_hot_0810_hoa_huong_duong ===
# ngay:8 # gio:22:01 # noi:nha_hong_hot # bat_buoc
_Group "Hội Anti Sếp", 22:01. "Hoa Hướng Dương 1989" vừa online, thả haha vào ảnh chế sếp._
designer: Bà ơi, bông hoa này là ai vậy? Vô group 4 tháng chưa chửi sếp câu nào. Red flag nha.
_Bạn để ý: Hoa Hướng Dương luôn online đúng 22:01. Một phút sau khi sếp nhắn group công ty._
* [🫣 "Chắc người mới, nhát. Kệ đi bà."]
    designer: Ờ. Bà là admin, bà quyết.
    _Hoa Hướng Dương tiếp tục đọc hết. Không ai biết hoa đọc để làm gì._
* [🔍 Nhắn riêng Hoa Hướng Dương: "Ê bạn là ai vậy? Group này phải xác minh danh tính nha."]
    _4 phút sau._
    _Hoa Hướng Dương 1989: "Mình là… nhân viên mới ạ. Mình thích hoa hướng dương."_
    ~ hh_tin(1)
    _"Ạ". Trong group này không ai nói "ạ". Trừ {thuc_tap_sinh}, mà {thuc_tap_sinh} dùng tên thật._
* {qh_it >= 40} [🔒 Nhắn {it}: "Anh {it}, coi giùm em cái tài khoản hoa này đăng nhập từ máy nào."]
    it: Lỗi người dùng.
    _1 phút sau._
    it: Máy phòng tầng 2. Vách kính.
    _Bạn làm rơi điện thoại. Nó rơi úp xuống giường, may mà không vỡ._
    ~ hh_mo_nhanh_hoa_huong_duong = true
    ~ phat_hien(clone_thang)
    ~ hh_tin(3)
- -> END

// ------------------------------------------------------------
=== hong_hot_0910_mv_gio_vang ===
# ngay:9 # gio:19:30 # noi:ban_mang_xa_hoi # bat_buoc
_Ngày Trứng Thế giới, căn tin chỉ bán trứng. Và tối nay MV đầu tiên của {sieu_nhan_hong} ra mắt._
_19:25, LL tung MV của nghệ sĩ bên họ, cùng giờ. Avatar xanh lá chuối tràn vào bình luận: "MV gì mà như quảng cáo bột giặt"._
_Cuộc chiến giờ vàng._
* [⏰ Lùi MV xuống 20:00, cho LL "hết hơi" trước.]
    ~ hh_follow(40000)
    ~ hh_tt(8)
    _20:00, khán giả xem xong MV bên kia, lướt xuống thấy MV hồng. Ai cũng tò mò so sánh. So sánh là tương tác._
* [⚔️ Đăng đúng 19:30, đối đầu trực diện.]
    { RANDOM(1, 10) <= 5:
        ~ hh_follow(50000)
        _Ăn may. MV bên kia bị lỗi âm thanh. MV hồng thắng giờ vàng._
    - else:
        ~ hh_follow(25000)
        _MV hồng chìm dưới MV bên kia hai tiếng đầu. Rồi mới ngoi lên._
    }
* [💬 Đăng MV, rồi ngồi trực comment xóa tài khoản xanh lá chuối. (Minigame "Trực Comment")]
    ~ hh_follow(40000)
    -> hong_hot_mg_truc_comment
- ~ an(15)
-> END

// ------------------------------------------------------------
=== hong_hot_0910_hong_coin ===
# ngay:9 # gio:23:10 # noi:nha_hong_hot
_23:10. Một tài khoản ẩn danh đăng trong nhóm fan: "Ra mắt HỒNG COIN ($HONG)! Ủng hộ Siêu Nhân Hồng bằng tiền điện tử!"_
_{dan_dau_tu} nhắn bạn ngay: "Ngân! Có coin mang tên idol mình! Mua đáy đi em! Lần này là lên thật!"_
* [🧂 Chụp lại, đăng group "Hội Anti Sếp": "Nghe gì chưa, có coin của Siêu Nhân Hồng rồi!"]
    ~ hh_ke_tin()
    _14 người mua thử. Trong đó có {con_ong_chau_cha} mua 50 triệu "cho vui"._
* [🚫 Báo cáo bài đăng: "Không phải của công ty".]
    ~ uy_tin = uy_tin + 3
    ~ hh_tt(2)
    _Bài bị gỡ ở trang này, mọc lại ở năm trang khác. Ít nhất trang công ty sạch._
* [💸 Mua thử 200.000đ.]
    ~ tien_cong(-200000)
    dan_dau_tu: Cổ đông chiến lược! Em là cổ đông chiến lược!
    ~ qh("dan_dau_tu", 5)
- -> END

// ------------------------------------------------------------
=== hong_hot_1010_luong_chua_ve ===
# ngay:10 # gio:10:00 # noi:nha_hong_hot
_Thứ 7, ngày 10. Ngày lương. Ứng dụng ngân hàng: không có gì._
_Group "Hội Anti Sếp": 214 tin nhắn trong một buổi sáng. "Lương đâu?", "Thứ 7 ngân hàng nghỉ mà", "Nghỉ gì, lương bên LL về từ hôm qua rồi"._
_Hộp thư Confession: 19 bài mới. Bài nào cũng có chữ "lương"._
* [📮 Đăng 1 bài nhẹ nhàng: "Lương ơi, bao giờ em về?" kèm ảnh mèo khóc.]
    ~ hh_lo(2)
    ~ hh_tt(3)
    _1.200 lượt thích. Hoa Hướng Dương 1989 thả haha._
* [🤐 Không đăng gì. Đợi tới thứ 2.]
    ~ hh_kin(5)
    ~ hh_lo(-3)
    _Lần đầu tiên trong năm, trang Confession im lặng một ngày lương. Có người còn nhắn hỏi: "Ad bị bắt cóc hả?"_
* [👀 Nhắn {thanh_ninh}: "Bà ơi, bà ngồi gần sếp, lương sao vậy?"]
    { RANDOM(1, 10) <= 5:
        thanh_ninh: Nói nhỏ nè… ngân hàng giữ lệnh chuyển lương. Đừng kể ai nha.
        ~ hh_tin(2)
        ~ phat_hien(the_chap_biet_thu)
    - else:
        thanh_ninh: Thứ 7 ngân hàng nghỉ mà bà. Thứ 2 về.
        _Câu trả lời đúng một nửa. Bạn nghe ra nửa còn lại bị cắt._
        ~ hh_tin(1)
    }
- -> END

// ------------------------------------------------------------
=== hong_hot_1010_banh_sinh_nhat_bac ===
# ngay:10 # gio:17:20 # noi:choi_bao_ve # ngau_nhien
_Bạn ghé công ty lấy cục sạc để quên. Chòi bảo vệ có một chiếc bánh bông lan nhỏ cắm đúng một cây nến. Bác {bac_bao_ve} ngồi một mình, cạnh một tấm thiệp viết tay ký chữ "G"._
bac_bao_ve: Ơ… cháu Ngân. *(úp vội cái ly lên bánh)*
* [🎥 "Bác ơi sinh nhật bác hả? Để con quay chúc mừng, đăng lên trang công ty nha!"]
    bac_bao_ve: Đừng cháu. Bác xin.
    _Lần đầu bác nói "xin". Bạn hạ điện thoại xuống._
    ~ qh("bac_bao_ve", -3)
    ~ hh_tin(1)
* [😇 Hát nhỏ bài chúc mừng sinh nhật, không quay.]
    ~ qh("bac_bao_ve", 15)
    ~ hh_kin(5)
    bac_bao_ve: Năm mươi rồi đấy. Đừng nói ai nhé.
    cho: Hú… *(hú theo)*
    _Bạn giữ tin này. Tin dễ thương nhất tháng, mà không đăng._
* [👀 Liếc tấm thiệp ký "G".]
    _"Năm mươi tuổi rồi Bình ơi. Công ty dạo này thế nào? – G"_
    ~ hh_tin(3)
    ~ phat_hien(binh_tai_mat_g)
    _"G". Genta. Người sáng lập. Viết thư tay cho bác bảo vệ. Bạn cảm thấy mình vừa đọc được trang đầu của một cuốn sách rất dày._
- -> END

// ------------------------------------------------------------
=== hong_hot_1110_anh_hoi_nho ===
# ngay:11 # gio:20:00 # noi:nha_hong_hot # bat_buoc
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Bạn phát động trend "ảnh hồi nhỏ" trên fanpage. Cả công ty gửi ảnh._
_{sieu_nhan_hong} gửi ảnh chụp ở một xóm có cây me to. Trong góc ảnh, một thằng nhóc gầy nhom đang khóc, đứng cạnh một nhà kho có lỗ thông gió hình con cá._
* [📤 Đăng ảnh lên fanpage.]
    ~ hh_follow(15000)
    _Ba phút sau, bên kia vách, có tiếng đập bàn. Rầm. Rồi im lặng rất lâu._
    ~ hh_tin(1)
    { hh_go_tuong:
        _Bạn gõ ba cái lên tường: "có chuyện". Không ai gõ lại._
    }
* [✂️ Cắt bỏ góc có thằng nhóc khóc rồi mới đăng.]
    ~ hh_follow(12000)
    _Ảnh chỉ còn cây me và {sieu_nhan_hong} hồi nhỏ, tóc cua, tay chống nạnh. Bên kia vách vẫn im lặng._
    ~ qh("ran_doc", 3)
* [🐕 Đăng ảnh {cho} hồi nhỏ (Bác {bac_bao_ve} chụp hôm mưa to) thay vì ảnh người.]
    ~ hh_follow(20000)
    ~ hh_tuat_noi_hon_nguyen = true
    _Lượt thích nhiều hơn ảnh hồi nhỏ của cả công ty cộng lại._
    ~ qh("cho", 5)
- _22:30. Phòng 3 tắt đèn sớm. Bạn nghe tiếng bút bi sột soạt trong bóng tối. Viết rất mạnh, như khắc._
-> END

// ------------------------------------------------------------
=== hong_hot_1210_47_confession ===
# ngay:12 # gio:09:00 # noi:ban_mang_xa_hoi # bat_buoc
_Thứ 2. Lương về trễ 2 ngày, sáng nay mới về. Trang Confession nhận 47 bài trong một buổi sáng._
_Bài hot nhất: "Lương về trễ, sếp đi đánh golf". Kèm ảnh sếp cầm gậy golf mới hôm 9/10._
* [📮 Đăng bài "Lương về trễ, sếp đi đánh golf". Đăng ngay.]
    ~ hh_dang_bai_luong_tre = true
    ~ hh_lo(15)
    ~ hh_tt(5)
    _2.400 bình luận. Đăng lúc 9:12, giờ làm việc. Ở bàn bên, {designer} liếc màn hình điện thoại bạn đang sáng trang admin._
    ~ hh_bi_don(1)
* [✂️ Đăng nhưng sửa: bỏ ảnh, đổi "sếp" thành "ai đó".]
    ~ hh_lo(5)
    ~ hh_tt(3)
    _Bài nhạt đi một nửa. Bình luận: "Ad sợ gì vậy ad?"_
* [🤐 Không đăng bài nào về lương.]
    ~ hh_kin(8)
    ~ hh_lo(-5)
    _Trang Confession chỉ đăng một bài: "Ai lấy hộp cơm có dán tên Thương trong tủ lạnh thì trả lại giùm". {ke_toan} rất cảm kích._
- -> END

// ------------------------------------------------------------
=== hong_hot_1210_the_long ===
# ngay:12 # gio:20:30 # noi:quan_oc_dem
_Lương về. {con_ong_chau_cha} dẫn {thuc_tap_sinh}, {ran_doc} và bạn đi Quán Ốc Đêm, giành trả tiền như mọi lần._
_Máy quẹt thẻ kêu "tít" hai lần. "Thẻ bị từ chối"._
_Cả bàn im lặng. {con_ong_chau_cha} quẹt lại. "Thẻ bị từ chối". Bạn đã kịp nhìn thấy._
_{thuc_tap_sinh} lặng lẽ rút ví. Trong ví có một tấm thẻ màu kim cương lấp lánh. Anh ấy trả rất nhanh, như không muốn ai thấy._
* [👀 Nhắn ngay group: "Nghe gì chưa, thẻ của 'ông hoàng' bị từ chối!"]
    ~ hh_ke_tin()
    ~ hh_ke_tin()
    ~ qh("con_ong_chau_cha", -15)
    _Trong 30 phút, 14 người biết. Sáng mai, cả công ty biết._
* [🤐 Cất điện thoại, gắp ốc cho {con_ong_chau_cha}.]
    ~ hh_kin(10)
    ~ qh("con_ong_chau_cha", 10)
    con_ong_chau_cha: *(cười gượng)* Chắc… lỗi hệ thống. Chill.
    _Bạn gật đầu, rất nghiêm túc: "Ừ, lỗi hệ thống."_
* [🔍 Hỏi nhỏ {thuc_tap_sinh}: "Anh Duy, thẻ đó… màu gì vậy anh?"]
    thuc_tap_sinh: Dạ… thẻ… thẻ tích điểm siêu thị ạ.
    ~ phat_hien(duy_tung_lam_ngan_hang)
    ~ hh_tin(2)
    _Siêu thị nào cho thẻ tích điểm hạng kim cương?_
- -> END

// ------------------------------------------------------------
=== hong_hot_1210_bao_log ===
# ngay:12 # gio:23:20 # noi:nha_hong_hot
_23:20. Tin nhắn từ {it}. Lần đầu tiên {it} nhắn trước._
{ hh_dang_bai_luong_tre:
    it: Sếp nhờ tìm admin Confession. Log ghi: NGAN-LAPTOP, 9:12, wifi công ty.
    _Bạn nhìn cái laptop. Cái laptop nhìn lại bạn, trên nắp dán sticker "NGAN-LAPTOP" mạ vàng._
- else:
    it: Bà đăng bài lúc 23 giờ. Wifi công ty. Đừng đăng giờ làm việc.
    _{it} biết. {it} luôn biết. Chỉ là chưa bao giờ nói._
}
* [🙏 "Anh {it}… anh giữ giùm em nha. Em hứa hông kể chuyện anh ngủ ở công ty."]
    it: Ừ.
    ~ hh_bao_giu_kin = true
    ~ qh("it", 5)
    ~ hh_lo(-5)
* [🍜 "Mai em mang mì ly tôm chua cay lên phòng server nha anh."]
    it: Hai ly.
    ~ hh_bao_giu_kin = true
    ~ qh("it", 10)
    ~ tien_cong(-30000)
* [😤 "Anh đọc log của em hả? Vậy là anh đọc lén đó!"]
    it: Không đọc. Thấy.
    ~ qh("it", -10)
    { RANDOM(1, 10) <= 5:
        _Sáng hôm sau, {it} nộp sếp bản log với một dòng: "Không xác định được". Bạn không biết vì sao {it} vẫn giữ kín._
        ~ hh_bao_giu_kin = true
    - else:
        _Sáng hôm sau, sếp nhìn bạn lâu hơn mọi khi nửa giây._
        ~ hh_lo(15)
    }
- -> END
