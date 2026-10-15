// ============================================================
// THÁNH XIN NGHỈ: SƠN · CHƯƠNG 4: "SAY XE VŨNG TÀU" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_xin_nghi_1710_xe_vung_tau ===
# ngay:17 # gio:06:30 # noi:cong_cong_ty # bat_buoc
_6 giờ 30 sáng thứ 7. Trước cổng công ty là chiếc xe khách thường, không máy lạnh. Team building Vũng Tàu, 2 ngày 1 đêm._
_Điện thoại bạn có tin nhắn của cô trợ lý đài: "Sơn Kim Tuyến ơi, 10h sáng nay thử đồ bán kết nha, nhớ đó!"_
_Anh Tuấn đứng ở cửa xe, cầm danh sách điểm danh. Thấy bạn, anh cười._
hr: Sơn tới sớm ghê. Lên xe đi em.
* [🤢 "Anh Tuấn ơi… em say xe nặng lắm ạ. Em xin ở nhà."]
    hr: Em chạy xe máy từ Ven Đô lên đây 30 phút mỗi ngày mà say xe khách hả em?
    thanh_xin_nghi: Dạ… xe máy thì em cầm lái, em không say. Xe khách người khác lái, em say.
    _Anh Tuấn nhìn bạn rất lâu. Rồi gạch tên bạn khỏi danh sách đi xe, ghi bên cạnh: "Say xe (?)."_
    ~ son_tin(-15)
    ~ son_soi(10)
    ~ son_di_vung_tau = false
    -> thanh_xin_nghi_1710_xe_vung_tau.s_o_lai
* [🚌 Lên xe. Nhắn cô trợ lý: "Dạ em xin dời buổi thử đồ sang thứ 2 ạ."]
    _Cô trợ lý nhắn lại: "Thứ 2 là ngày quay quảng bá đó cưng. Thôi chị lấy số đo cũ."_
    ~ son_mo(-3)
    ~ son_di_vung_tau = true
    -> thanh_xin_nghi_1710_xe_vung_tau.s_tren_xe

= s_tren_xe
_Xe lăn bánh. Bạn ngồi cạnh {quan_ly_idol}. {sieu_nhan_hong} ở hàng ghế đầu, quay xuống vẫy._
sieu_nhan_hong: {son_nguyen_mat_danh:Đặc vụ Kim Tuyến!|Sơn ơi!} Tối nay lửa trại hát hò nha!
* [😅 Vẫy lại, rồi giả vờ ngủ.]
    quan_ly_idol: Đặc vụ gì? *(nhìn bạn)*
    thanh_xin_nghi: Dạ… anh Nguyên đặt biệt danh lung tung đó anh.
* [🎧 Đeo tai nghe, nghe lại bản thu bài thi.]
    ~ son_mo(2)
    _Ba tiếng đường. Bạn nghe bài của mình 26 lần. Anh Thái ngủ gục lên vai bạn ở lần thứ 9._
- -> END

= s_o_lai
_Xe lăn bánh. Bạn đứng ở cổng nhìn theo. {bac_bao_ve} đứng cạnh, cầm ly trà đá._
bac_bao_ve: Say xe à?
thanh_xin_nghi: Dạ.
bac_bao_ve: Thế à. *(uống trà)* Bác cũng say xe. Say kiểu… có việc riêng.
_Bạn chạy xe tới Đài Tivi Hóng, kịp giờ thử đồ._
~ son_mo(5)
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1710_thu_do ===
# ngay:17 # gio:10:00 # noi:dai_tivi_hong # dieu_kien:khong_di_vung_tau
{ son_di_vung_tau:
    -> END
}
_Phòng thử đồ Đài Tivi Hóng. Bộ đồ bán kết: áo choàng kim tuyến dài tới gót, cổ áo cao như vua._
phu_tro_ly_dai: Đẹp! Cưng mặc lên như sinh ra để đứng sân khấu! Mà nè, bán kết tối chủ nhật 25/10, tổng duyệt chiều thứ 6 23/10 nha. Không được vắng.
_Chiều thứ 6, 23/10. Sinh nhật Siêu Nhân Hồng. Livestream. Bạn là người giữ lịch._
* [📝 "Dạ… em sẽ có mặt." (Ghi vào lịch bằng bút chì)]
    ~ son_mo(5)
    ~ cang_thang(5)
* [💬 "Chị ơi, tổng duyệt sớm hơn được hông? Chiều đó em kẹt việc lớn."]
    phu_tro_ly_dai: Cưng ơi, việc lớn nhất đời cưng đang ở đây nè. Thôi chị xếp cưng tổng duyệt cuối, 17:00. Ráng chạy.
    ~ son_mo(3)
- _Tối đó, Ven Đô vắng tanh. Cả công ty ở Vũng Tàu. Bạn ngồi ngoài hiên, hát cho ruộng rau muống nghe._
~ son_mo(3)
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1710_tro_choi ===
# ngay:17 # gio:15:00 # noi:bai_bien_vung_tau # dieu_kien:di_vung_tau
{ not son_di_vung_tau:
    -> END
}
_Bãi biển. Trò chơi tập thể bắt buộc. {chi_dai} cầm loa. Kéo co các phòng ban: phòng Nghệ sĩ có {quan_ly_idol}, {idol_het_thoi}, {sieu_nhan_hong}… và bạn._
chi_dai: Phòng Nghệ sĩ! Kéo! Sơn kéo đi chớ, đứng đó làm gì!
* [💪 Kéo hết sức.]
    _Phòng Nghệ sĩ thắng, nhờ {sieu_nhan_hong} một mình bằng ba. Bạn trượt chân ngã sấp xuống cát. Cả phòng cười._
    ~ qh("chi_dai", 3)
    ~ nghi(-10)
* [🤧 "Khụ khụ… em đau cổ tay chị ơi…"]
    chi_dai: Cổ tay hay cổ họng? Em đau chỗ nào cũng được, miễn là đừng đau lúc chị cần!
    ~ son_tin(-3)
- _Trò 2: Truyền bánh chuối chiên bằng miệng. {cho} lao vào giữa, đớp gọn, thắng tuyệt đối._
cho: Gâu! *(vẫy đuôi đầy cát)*
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1710_lua_trai ===
# ngay:17 # gio:21:00 # noi:bai_bien_vung_tau # bat_buoc # dieu_kien:di_vung_tau
{ not son_di_vung_tau:
    -> END
}
_Đêm lửa trại. Bia lon, mực nướng, karaoke loa kéo. {sales} say, hứa mời ca sĩ nổi tiếng nhất nước. {giam_doc} say, hứa tăng lương cả công ty._
_{idol_het_thoi} giành micro hát "Công Viên" lần thứ 4. Tới câu "thích ăn chuối chiên", {chi_dai} giật micro._
chi_dai: Thôi đủ "Công Viên" rồi! Sơn, hát một bài coi. Cả năm chị chưa nghe em mở miệng, toàn nghe em ho.
_Cả bãi biển quay sang bạn. Micro trong tay. Lửa trại lách tách._
* [🤧 "Dạ em đau họng chị ơi… khụ."]
    _Không ai bất ngờ. {idol_het_thoi} giành lại micro, hát "Công Viên" lần thứ 5._
    ~ son_mo(-5)
* [🎤 Hát thật, hết sức.]
    -> thanh_xin_nghi_1710_lua_trai.s_hat_that
* [😏 Hát dở cố ý, lạc tông cho an toàn.]
    ~ son_hat_do_lua_trai = true
    _Bạn hát lạc từ nốt đầu tới nốt cuối. Cả đám cười lăn ra cát. {hong_hot} quay clip đăng Tóp-tóp: "Xu cà na, giọng ca lạc trôi nhất công ty."_
    ~ follow(3000)
    _Bí mật an toàn. Nhưng tối đó nằm trong phòng, cổ họng bạn đau thật. Đau vì nhịn._
    ~ cang_thang(10)
* {son_nguyen_biet} [🔒 Đưa micro thứ hai cho {sieu_nhan_hong}: "Song ca hông anh?"]
    -> thanh_xin_nghi_1710_lua_trai.s_song_ca
- -> END

= s_hat_that
~ son_hat_lua_trai = true
~ phat_hien(son_thi_hat)
_Bạn nhắm mắt. Hát bài ballad của vòng 2. Không nhạc đệm. Chỉ có sóng._
_Cả bãi biển im lặng. {idol_het_thoi} buông ly nước. {editor} lặng lẽ giơ máy quay lên. {quan_ly_idol} nhìn bạn như nhìn một người lạ._
_Hết bài. 3 giây im lặng. Rồi {chi_dai} vỗ tay trước tiên, to như đập bàn._
chi_dai: Trời đất ơi! Thằng này! Cả năm nay mày giấu cái giọng này ở đâu?!
~ son_mo(15)
~ qh("chi_dai", 15)
~ son_tin(-20)
_Giờ ai cũng nghi mấy ngày nghỉ của bạn. Nhưng tối nay, bạn không quan tâm._
hr: *(ngồi phía bên kia đống lửa, nói rất khẽ, như với chính mình)* Giọng này… quen quá.
-> END

= s_song_ca
~ son_hat_lua_trai = true
~ son_song_ca_lua_trai = true
_{sieu_nhan_hong} nhận micro, đứng bật dậy, tạo dáng. Hai người hát "Công Viên": bạn hát lời đúng, {sieu_nhan_hong} hát lời sai, rất to, rất tự tin._
_Cả bãi biển hát theo. {idol_het_thoi} đứng dậy hát bè. Lửa trại bùng lên._
~ follow(20000)
~ qh("sieu_nhan_hong", 15)
~ son_mo(8)
_Clip lửa trại lan ra ngoài trong đêm. Người ta xem để nghe Siêu Nhân Hồng hát sai, rồi ở lại vì giọng của người hát đúng._
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1710_phong_ngu ===
# ngay:17 # gio:23:30 # noi:khach_san_vung_tau # dieu_kien:di_vung_tau
{ not son_di_vung_tau:
    -> END
}
_Khách sạn hướng bãi xe. Phòng của bạn và {quan_ly_idol}. Anh Thái nằm nhìn trần nhà, hai điện thoại úp trên bụng._
{ son_hat_lua_trai:
    quan_ly_idol: Sơn. Anh quen em mấy năm, chưa bao giờ nghe em hát. Em… đi học hát hả?
- else:
    quan_ly_idol: Sơn. Em ngủ chưa? Anh hỏi em cái này. Nếu anh đi… em có giận anh không?
}
* [🎤 Kể thật: "Anh Thái, em đi thi 'Giọng Ca Ước Mơ'. Mấy ngày bà ngoại ốm là mấy ngày em đi thi."]
    _Anh Thái ngồi bật dậy. Hai điện thoại rơi xuống sàn._
    quan_ly_idol: …Thảo nào bà ngoại em ốm đúng tối thứ 7. *(bật cười, rồi cười to)* Trời ơi Sơn. Sao em không nói anh?
    thanh_xin_nghi: Em sợ anh ép em ký hợp đồng ca sĩ. Em sợ thành anh Phát thứ hai.
    _Anh Thái im lặng rất lâu khi nghe tên anh Phát._
    quan_ly_idol: Anh Phát… không phải hết thời vì hát dở đâu em. Mà thôi. Anh giữ bí mật. Mà anh che cho em được bao nhiêu thì che.
    ~ son_thai_biet = true
    ~ qh("quan_ly_idol", 25)
* [😶 "Dạ em ngủ rồi anh."]
    quan_ly_idol: Ngủ rồi mà còn trả lời. Thôi, ngủ đi.
    _Bạn nằm quay mặt vào tường. Hai người bạn thân, hai bí mật, một bức tường mỏng._
* {son_thay_anh_phat} [🔒 "Anh không đi được đâu. Anh không bỏ được anh Phát."]
    _Anh Thái quay sang. Trong bóng tối, bạn nghe tiếng thở ra rất dài._
    quan_ly_idol: Em… thấy cái ngăn kéo rồi hả?
    thanh_xin_nghi: Dạ. Em không nói ai.
    quan_ly_idol: …Ngủ đi Sơn.
    ~ qh("quan_ly_idol", 10)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_1810_xe_ve ===
# ngay:18 # gio:14:00 # noi:xe_khach # bat_buoc
{ not son_di_vung_tau:
    -> thanh_xin_nghi_1810_xe_ve.s_o_nha
}
_Xe về. Nóng. Chật. Ai cũng giận ai. {dan_dau_tu} nhìn điện thoại: Hồng Coin về 0. {con_ong_chau_cha} nhìn điện thoại: penthouse bị rao bán._
{ son_hat_lua_trai:
    _Cả xe im lặng 10 phút. Rồi {thuc_tap_sinh} ở hàng ghế sau rụt rè giơ tay._
    thuc_tap_sinh: Dạ anh Sơn… anh học thanh nhạc ở đâu vậy ạ?
    -> thanh_xin_nghi_1810_xe_ve.s_hoi_han
- else:
    _Ai đó hỏi to: "Ai xếp phòng vậy trời?" Cả xe nhìn anh Tuấn. Bạn nhìn ra cửa sổ, nhẩm lời bài bán kết._
    ~ son_mo(2)
    -> END
}

= s_hoi_han
* [😅 "Dạ… Diu-túp đó anh Duy. Học miễn phí."]
    thuc_tap_sinh: Dạ… Diu-túp dạy hay vậy ạ? Em cũng học!
    ~ son_tin(3)
* [🤫 "Bí mật nha anh Duy. Em kể anh sau."]
    thuc_tap_sinh: Dạ em giữ bí mật ạ! Em giữ giỏi lắm ạ! *(liếc nhìn túi mình)*
    ~ qh("thuc_tap_sinh", 5)
* [🎤 "Ở một cuộc thi. Mấy ngày nghỉ của em là đi thi đó."]
    _Cả xe quay xuống. {hong_hot} rút điện thoại nhanh như rút súng._
    hong_hot: Ủa alo? Thi gì? Đài nào? Tên gì?
    thanh_xin_nghi: Thôi… em nói tới đó thôi.
    ~ son_soi(15)
    ~ son_tin(-10)
    ~ son_mo(3)
- -> END

= s_o_nha
_Chủ nhật. Cả công ty đang trên xe về từ Vũng Tàu. Bạn ở Ven Đô, tối nay hát ở Sống Ảo._
_{hong_hot} đăng story từ xe: "Về tới rồi, ai cũng giận ai. Có đứa trốn đi vì 'say xe', sướng ghê."_
* [🎤 Tối nay hát Sống Ảo, kiếm thêm tiền tip.]
    -> thanh_xin_nghi_mg_song_ao_mo
* [📅 Ngồi xếp lịch tuần sau cho Siêu Nhân Hồng, làm bù.]
    ~ uy_tin = uy_tin + 3
    ~ son_soi(-5)
    -> thanh_xin_nghi_mg_xep_lich_mo

// ------------------------------------------------------------
=== thanh_xin_nghi_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp giao ban. Không ai nhìn mặt ai. {truong_phong} nhìn slide: "Chuẩn bị 20/10: sinh nhật công ty 16 tuổi + Ngày Phụ nữ"._
truong_phong: Sơn, em xếp chương trình văn nghệ tối mai nhé. Như mọi năm.
_"Như mọi năm" nghĩa là: {idol_het_thoi} hát mở màn "Công Viên", {giam_doc} phát biểu 40 phút, {idol_het_thoi} hát kết thúc "Công Viên"._
{ son_hat_lua_trai:
    chi_dai: Năm nay cho Sơn hát một bài đi! Hát hay vậy mà giấu!
    _Cả phòng quay lại. Anh Tuấn nhìn bạn, ánh mắt khó đọc._
    ~ son_soi(5)
}
* [📅 "Dạ, em xếp như mọi năm."]
    ~ uy_tin = uy_tin + 2
* [💬 "Năm nay mình đổi mới chút được không anh? Có tiết mục bất ngờ."]
    truong_phong: Bất ngờ kiểu gì? Mình họp thêm về việc bất ngờ nhé.
    _Họp thêm 1 tiếng về "bất ngờ". Không ai biết bất ngờ là gì, kể cả bạn._
    ~ cang_thang(5)
- ~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2010_van_nghe ===
# ngay:20 # gio:10:00 # noi:san_khau_su_kien # bat_buoc
_Ngày Phụ nữ Việt Nam + sinh nhật công ty 16 tuổi. Bạn cầm tờ chương trình văn nghệ trống, bút trong tay._
_Dòng 1: Mở màn. Dòng 2: Phát biểu. Dòng 3: ? Dòng 4: Kết thúc._
* [🎤 Mở màn: {idol_het_thoi}, "Công Viên". Như mọi năm.]
    ~ qh("idol_het_thoi", 8)
    idol_het_thoi: Đó! Mở màn là phải anh! Fan anh chờ cả năm!
    _Fan duy nhất còn lại của anh Phát chưa tới. Nhưng ảnh vẫn vui._
* [✍️ Dòng 3: "Khách mời bí mật". Không ghi tên.]
    ~ son_khach_moi_bi_mat = true
    _Bạn viết. Tay hơi run. Khách mời bí mật là bạn._
    ~ son_mo(3)
    ~ son_soi(3)
* {son_thai_biet} [🔒 Nhờ anh Thái xếp cho: "Anh, dòng 3 anh ghi giùm em tên 'S.K.T.' nha."]
    quan_ly_idol: S.K.T.? *(cười)* Ừ. Anh ghi. Ai hỏi thì anh nói là ban nhạc từ Đài Tivi Hóng.
    ~ son_khach_moi_bi_mat = true
    ~ qh("quan_ly_idol", 5)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2010_thu_g ===
# ngay:20 # gio:11:30 # noi:chong_bao_ve
_Chòi bảo vệ. {bac_bao_ve} cầm lá thư tay ký tên "G" và một phong bì dán kín "Chỉ mở khi công ty sắp sập". Cả công ty tụ trước cổng._
_Anh Tuấn đứng cạnh bác. Bác đang hỏi anh nên đọc hay không._
* [🤝 Nói nhỏ với bác: "Bác đọc đi bác. Mọi người cần nghe."]
    bac_bao_ve: Cháu Sơn cũng bảo thế à. Ừ.
    _{bac_bao_ve} đứng lên ghế đẩu, đọc chậm: "…16 năm rồi. Gửi lời cảm ơn tới từng người còn ở lại…"_
    _Bạn nghĩ tới những ngày bạn không ở lại. 31 ngày trong năm._
    ~ qh("bac_bao_ve", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [😶 Đứng xa, nhìn.]
    _Bác cất lá thư vào túi áo. Không đọc. Mọi người tản ra chuẩn bị tiệc._
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2010_tiet_muc ===
# ngay:20 # gio:19:30 # noi:san_khau_su_kien # dieu_kien:son_khach_moi_bi_mat
{ not son_khach_moi_bi_mat:
    -> thanh_xin_nghi_2010_tiet_muc.s_binh_thuong
}
_Tối. Tiệc sinh nhật 16 tuổi. MC đọc: "Tiết mục tiếp theo: khách mời bí mật!" Đèn sân khấu quay về phía cánh gà. Cả công ty chờ._
_Bạn đứng sau cánh gà, áo sơ mi công sở, không kim tuyến, không tóc giả. Chỉ có bạn._
* [🎤 Bước ra. Hát.]
    ~ phat_hien(son_thi_hat)
    ~ son_mo(10)
    ~ son_tin(-10)
    _Bạn hát. Không trang điểm. Không nghệ danh. Cả công ty lần đầu nghe giọng của người hay xin nghỉ nhất công ty._
    _Hết bài. {giam_doc} đứng dậy vỗ tay trước tiên. Rồi ông ấy quay sang anh Tuấn, nói gì đó. Anh Tuấn không trả lời, chỉ nhìn bạn._
    giam_doc: Sơn! Hay! Anh không ép, nhưng em có muốn ký hợp đồng ca sĩ không?
    _Đúng câu bạn sợ nhất. Bạn cúi chào rồi chạy vào cánh gà._
    ~ son_soi(10)
* [😨 Đứng im sau cánh gà. Để MC nói "khách mời bị kẹt xe".]
    _MC nói "khách mời bị kẹt xe ạ". {idol_het_thoi} nhảy lên hát "Công Viên" thế chỗ. Ai cũng vui. Trừ bạn._
    ~ son_mo(-3)
- -> END

= s_binh_thuong
_Tối. Tiệc sinh nhật 16 tuổi. {idol_het_thoi} hát "Công Viên" mở màn. {giam_doc} phát biểu 40 phút. Bạn cầm bộ đàm đứng sau cánh gà, nhẩm theo mọi bài hát._
~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2010_karaoke ===
# ngay:20 # gio:22:00 # noi:karaoke_hat_cho_nhau_nghe
_Tăng hai ở Karaoke Hát Cho Nhau Nghe. {giam_doc} say, đứng lên bàn: "Tháng sau tăng lương 20%! Cả công ty!" {hong_hot} quay clip._
_Micro được chuyền tới tay bạn._
hong_hot: Sơn hát đi! Cho tui quay!
* [🎤 Hát thật, nhỏ thôi.]
    ~ son_mo(3)
    ~ son_soi(3)
    _Bạn hát nhỏ. Phòng karaoke ồn ào nên chỉ người ngồi gần nghe. Người ngồi gần nhất là anh Tuấn. Anh ấy nhắm mắt nghe tới hết._
* [😏 Chọn bài khó nhất, cố tình hát lạc.]
    _Phòng karaoke cười rần rần. Điểm máy chấm: 12/100. {hong_hot} đăng clip. Bạn an toàn thêm một đêm._
* [🤧 "Em ho quá, em nhường anh Phát."]
    idol_het_thoi: Đó! Phải vậy chớ! *(hát "Công Viên" lần thứ 7 trong ngày)*
- -> END
