// ============================================================
// BÁC BẢO VỆ: BÌNH · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// Phần lớn diễn ra ở chòi bảo vệ, quanh ấm trà đá.
// Mỗi cảnh có thể mở lại; lựa chọn cuối (+) luôn còn.
// ============================================================

// ------------------------------------------------------------
=== bac_bao_ve_tudo_ran_doc ===
# npc:ran_doc
_{ran_doc} dừng xe ở cổng, cười thật tươi, chìa ra một gói bánh._
ran_doc: Dạ con chào bác! Con mua bánh cho bác nè. Mà bác ơi, bác ở đây lâu, bác biết ai trong công ty cũng biết hết hả bác?
* [🙈 "Bác không thấy gì đâu."]
    ran_doc: *(cười)* Dạ, con hiểu. Bác giữ miệng giỏi ghê.
    _{ran_doc} để gói bánh lại. Đi lên. Bác nhìn theo. Gói bánh vẫn chưa bóc._
    ~ bv_khong_thay_gi()
* [🍵 "Ngồi uống chén trà. Rồi bác hỏi cháu một câu."]
    ran_doc: Dạ… bác hỏi gì ạ?
    bac_bao_ve: Cháu với cậu áo hồng… quen nhau từ bé à?
    _{ran_doc} khựng lại đúng một giây. Rồi cười: "Dạ đâu có bác. Con mới gặp ổng ngày đầu thôi."_
    ~ bv_rot_tra("ran_doc", 2)
    ~ bv_bm(1)
* [😐 Nhận bánh. "Cảm ơn cháu. Lần sau không cần mua gì."]
    ran_doc: Dạ… con mua cho vui thôi bác.
    ~ qh("ran_doc", 3)
+ [😶 Gật đầu chào.]
- ran_doc: Bác ơi… bác có bao giờ ghét ai mà không làm gì được hông bác?
* [🍵 "Có. Rồi bác lớn. Ghét lâu thì mình mệt, người ta không mệt."]
    ran_doc: *(im lặng)* …Dạ.
    _Lần đầu bác thấy {ran_doc} không cười._
    ~ qh("ran_doc", 8)
* [🙈 "Bác chỉ ghét shipper. À không, đấy là con {cho}."]
    ran_doc: *(bật cười thật)* Bác cũng biết đùa ha.
    ~ qh("ran_doc", 4)
+ [😶 Rót thêm trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_giam_doc ===
# npc:giam_doc
_{giam_doc} dừng xe máy ở cổng. Mũ bảo hiểm còn chưa tháo, điện thoại đã đổ chuông. "Ngân hàng Tín Dụng Đen Đủi". Anh bấm từ chối._
giam_doc: Bác {bac_bao_ve}! Sáng nay bác khỏe không ạ? Em có cuộc họp "urgent", em lên luôn nhé.
* [🍵 "Uống chén trà đã. Họp thì lúc nào chả có."]
    giam_doc: *(ngập ngừng, rồi ngồi xuống)* Vâng… một chén thôi bác.
    _Một chén thành ba chén. Điện thoại reo thêm hai lần. Anh không nghe. Lần đầu tiên trong tuần anh ngồi yên năm phút._
    ~ bv_rot_tra("giam_doc", 5)
* [💬 "Anh đi xe máy mấy tháng rồi. Cái ô tô đâu?"]
    giam_doc: *(cười gượng)* Em… em "go green" bác ạ. Bảo vệ môi trường.
    bac_bao_ve: Ừ. Thế à.
    ~ bv_lo_than(2)
    ~ bv_bm(1)
* [😐 "Tối qua anh nhắn group lúc 23 giờ."]
    giam_doc: Ơ… bác cũng ở trong group ạ?
    bac_bao_ve: Bác ở trong group từ 2016. Bác không đọc. Nhưng điện thoại nó kêu.
    giam_doc: *(gãi đầu)* Em… em xin lỗi bác. Em sẽ "schedule" tin nhắn.
    ~ qh("giam_doc", 3)
+ [😶 Mở cổng cho anh lên.]
- giam_doc: Bác này… em hỏi thật. Hồi năm 2010, bác thấy em thế nào?
* [🍵 "Gầy. Đeo kính. Ngồi bàn thùng mì tới nửa đêm. Không ai bảo, tự ngồi."]
    giam_doc: *(cười, mắt đỏ)* Giờ em béo rồi.
    bac_bao_ve: Ừ. Nhưng vẫn ngồi tới nửa đêm.
    ~ qh("giam_doc", 8)
* [🙈 "Lâu rồi. Bác không nhớ."]
    giam_doc: Vâng… em cũng quên nhiều thứ rồi.
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_truong_phong ===
# npc:truong_phong
_7 giờ 30. {truong_phong} tới sớm thứ hai công ty, ôm laptop và một xấp slide in sẵn._
truong_phong: Cháu chào bác ạ. Bác ơi, bác có 5 phút không ạ? Cháu muốn "sync" nhanh với bác về quy trình gửi xe.
* [😐 "Gửi xe thì có quy trình gì. Đến thì gửi, về thì lấy."]
    truong_phong: Dạ… nhưng mình có thể tối ưu hơn bằng cách…
    bac_bao_ve: Cháu lên đi. Muộn họp đấy.
    truong_phong: *(nhìn đồng hồ)* Ối, vâng ạ!
* [🍵 "Ngồi đây. 5 phút. Bác bấm giờ."]
    _Bác bấm giờ trên cái đồng hồ treo tường. {truong_phong} nói đúng 4 phút 50 giây, rồi dừng. Bác gật đầu: "Được đấy."_
    truong_phong: *(tự hào)* Cháu cảm ơn bác ạ.
    ~ qh("truong_phong", 5)
* [💬 "Cháu ăn sáng chưa? Người Bắc xa quê, ăn uống thế nào?"]
    truong_phong: Cháu… ăn bánh mì ạ. Cháu nhớ xôi xéo lắm bác.
    bac_bao_ve: Chủ nhật về Ven Đô, bác nấu xôi. Đỗ xanh bác trồng.
    ~ qh("truong_phong", 8)
+ [😶 Gật đầu.]
- truong_phong: Bác ơi, cháu có làm Phó Giám đốc được không bác?
* [🍵 "Được. Nếu cháu bớt họp đi một nửa."]
    truong_phong: Một nửa ạ? *(nhìn lịch, tái mặt)* …Cháu sẽ thử.
    ~ qh("truong_phong", 5)
* [🙈 "Bác chỉ biết ai gửi xe chỗ nào."]
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_thanh_ninh ===
# npc:thanh_ninh
_7 giờ 45. {thanh_ninh} tới, sớm hơn sếp đúng 1 tiếng 45 phút. Tay cầm ly trà sữa: "Dạ con mua cho anh {giam_doc}"._
thanh_ninh: Dạ con chào bác ạ! Hôm nay bác trông khỏe quá ạ! Áo bác đẹp quá ạ!
* [😐 "Áo đồng phục. Mặc từ 2018."]
    thanh_ninh: *(khựng lại)* Dạ… dạ thì vẫn đẹp ạ.
    _Bác nhìn cô. Cô nhìn xuống._
* [🍵 "Cháu không cần khen bác. Ngồi uống chén trà đi, đi sớm thế này mệt."]
    thanh_ninh: *(ngạc nhiên)* Dạ… con… con ngồi được hả bác?
    _Cô ngồi. Uống. Không nói câu nịnh nào. Lần đầu bác thấy cô im lặng mà không lo lắng._
    ~ bv_rot_tra("thanh_ninh", 6)
* [🤫 "Hôm qua cháu đi Ven Đô à? Giày cháu dính đất đỏ."]
    thanh_ninh: *(nhìn giày, tái mặt)* Dạ… con đi… thăm người quen ạ.
    bac_bao_ve: Ừ. Thế à.
    ~ bv_bm(2)
    ~ qh("thanh_ninh", -3)
+ [😶 Mở cổng.]
- thanh_ninh: Bác ơi… bác có bao giờ sợ bị bỏ lại không ạ?
* [🍵 "Bác đứng cổng 16 năm. Người ta đi qua bác, chứ bác không đi đâu. Nên không sợ."]
    thanh_ninh: *(gật đầu chậm)* …Con thì sợ lắm bác.
    ~ qh("thanh_ninh", 8)
* [😐 "Sợ thì đừng chạy trước."]
    thanh_ninh: Dạ…
    ~ qh("thanh_ninh", 4)
+ [😶 Không trả lời.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_hong_hot ===
# npc:hong_hot
_8 giờ 05. {hong_hot} đi vào, trễ đúng 5 phút như mọi ngày, tay cầm bánh mì, tay cầm điện thoại đang livestream._
hong_hot: Bác ơi! Chào bác đi bác! 3.000 người đang xem nè!
* [😐 Gật đầu với cái điện thoại. Một cái.]
    _Bình luận: "Ông bác ngầu quá!", "Bác gật đầu thôi mà thấy uy lực". {hong_hot} cười ngặt nghẽo._
    ~ follow(2000)
    ~ bv_lo_than(1)
* [🙈 Quay mặt đi, rót trà.]
    hong_hot: Bác ngại hả bác? Thôi con tắt nè!
    ~ qh("hong_hot", 2)
* [🐕 "Quay con {cho} ấy. Nó thích lên hình."]
    cho: *(lập tức ngồi thẳng, nhìn camera)* Gâu!
    hong_hot: TRỜI ƠI NÓ BIẾT TẠO DÁNG!
    ~ follow(5000)
    ~ qh("cho", 3)
+ [😶 Ghi giờ vào sổ: 8:05.]
- hong_hot: Mà bác ơi, bác biết hết chuyện công ty, bác kể con nghe một chuyện đi bác! Một chuyện thôi!
* [🍵 "Chuyện này: có đứa đi trễ 5 phút mỗi ngày, cả tháng nộp phạt 1 triệu. Quỹ trà sữa thứ 6 là của nó."]
    hong_hot: *(há hốc)* Ủa… là con hả bác?
    bac_bao_ve: Bác không nói tên.
    ~ qh("hong_hot", 5)
* [🙈 "Bác không thấy gì đâu."]
    hong_hot: Bác lúc nào cũng nói vậy! Mà con biết bác thấy hết!
    ~ bv_khong_thay_gi()
+ [😶 Lắc đầu.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
_10 giờ. {con_ong_chau_cha} tới. Chiếc xe phân khối lớn to nhất bãi. Đỗ chéo ba ô._
con_ong_chau_cha: Bác ơi, bác dắt xe giùm con xíu nha. Chill.
* [😐 "Xe cháu, cháu dắt. Bác dắt nó không nổi."]
    con_ong_chau_cha: *(ngớ ra)* Ủa… dạ. *(tự dắt xe, vất vả, mồ hôi nhễ nhại)*
    _Lần đầu tiên trong đời {con_ong_chau_cha} tự đỗ xe vào đúng một ô._
    ~ qh("con_ong_chau_cha", 3)
* [🛵 Dắt giùm. Tay run vì xe nặng.]
    con_ong_chau_cha: Bác khỏe ghê! Con cảm ơn bác nha.
    ~ bv_tam(-3)
    ~ qh("con_ong_chau_cha", 5)
* [💬 "Tối qua 2 giờ sáng đèn penthouse cháu còn sáng. Thức làm gì đấy?"]
    con_ong_chau_cha: *(giật mình)* Sao bác biết?
    bac_bao_ve: Từ cổng nhìn lên Sky Ảo, tầng 30 sáng nhất.
    con_ong_chau_cha: Con… con nghe nhạc thôi bác.
    ~ bv_bm(1)
+ [😶 Ghi sổ: "Xe đỗ chéo ba ô."]
- con_ong_chau_cha: Bác ơi, nếu con không làm cháu chú con nữa… con có làm bảo vệ được không bác?
* [🍵 "Không. Bảo vệ phải dậy 6 giờ. Cháu làm cái cháu đang nghe trong tai nghe ấy."]
    con_ong_chau_cha: *(sững người)* Bác… nghe được hả?
    bac_bao_ve: Tai nghe cháu to, bác nghe được cả câu "Hồng là thái độ".
    ~ qh("con_ong_chau_cha", 10)
    ~ phat_hien(bai_hat_long)
* [😐 "Thử dậy 6 giờ một hôm đã."]
    con_ong_chau_cha: 6 giờ sáng hả bác? Có 6 giờ sáng hả?
    ~ qh("con_ong_chau_cha", 3)
+ [😶 Cười.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_chua_te_deadline ===
# npc:chua_te_deadline
_8 giờ 20. {chua_te_deadline} đi bộ vào cổng, ở cách đúng 200 mét mà vẫn trễ. Mắt díp, tay lướt Tóp-tóp._
chua_te_deadline: Chill bác ơi. Còn sớm mà.
* [😐 "8 giờ 20. Trễ 20 phút. Bác ghi rồi."]
    chua_te_deadline: Ok bác… à dạ, con biết rồi ạ.
    ~ bv_bm(1)
* [🍵 "Ngồi uống chén trà cho tỉnh. Mặt cháu như chưa ngủ."]
    chua_te_deadline: *(ngồi phịch xuống)* Tối qua con tìm một cái… à thôi. Con mất một cái USB bác ạ. Từ tháng 9.
    bac_bao_ve: Mất ở đâu?
    chua_te_deadline: Hình như… ở bãi xe này luôn.
    ~ bv_rot_tra("chua_te_deadline", 4)
    ~ phat_hien(usb_cua_vu)
* [💬 "Cậu áo hồng tặng cháu cái gối ôm hồng. Bác thấy cậu ấy ôm nó ra cổng đợi cháu."]
    chua_te_deadline: *(khựng tay lướt điện thoại)* …Bác thấy hả?
    bac_bao_ve: Đợi 40 phút. Cháu đi cổng sau.
    _{chua_te_deadline} im lặng. Lần đầu bác thấy cậu ta không nói "chill"._
    ~ qh("chua_te_deadline", 3)
    ~ qh("sieu_nhan_hong", 2)
+ [😶 Mở cổng.]
- chua_te_deadline: Bác… nếu người ta thích mình thật mà mình tưởng là giả, thì sao bác?
* [🍵 "Thì mình hỏi. Hỏi một câu thôi. Đỡ hơn tưởng cả tháng."]
    chua_te_deadline: *(gật chậm)* …Dạ. Để con… để con nghĩ. Chill. Nghĩ đã.
    ~ qh("chua_te_deadline", 6)
* [🙈 "Bác già rồi, bác không biết chuyện ấy."]
+ [😶 Rót thêm trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
_7 giờ. {thuc_tap_sinh} tới sớm nhất công ty, như mọi ngày. Xe đạp. Ba lô. Một túi mì gói._
thuc_tap_sinh: Dạ con chào bác ạ! Bác ăn sáng chưa ạ? Con có mì gói vị mới ạ!
* [🍵 "Mì gói không phải bữa sáng. Ngồi đây, bác có xôi."]
    _Bác chia đôi gói xôi đỗ xanh. {thuc_tap_sinh} ăn chậm, như sợ hết, như ăn một bữa ở nhà._
    ~ qh("thuc_tap_sinh", 8)
    ~ an(-10)
* [💬 "Cháu đi xe đạp à? Cháu có tiền mua xe máy mà."]
    thuc_tap_sinh: *(giật mình)* Dạ… dạ con thích đạp xe cho khỏe ạ.
    bac_bao_ve: Ừ. Cái thẻ màu bạc trong ví cháu cũng đạp xe à?
    _{thuc_tap_sinh} cúi đầu, cười. "Bác đừng nói ai nha bác."_
    ~ bv_bm(1)
    ~ phat_hien(duy_tung_lam_ngan_hang)
* [🤝 "Hôm nay ai sai việc cháu thì bảo người ta xuống hỏi bác."]
    thuc_tap_sinh: Dạ… hỏi bác cái gì ạ?
    bac_bao_ve: Hỏi xem bác có đồng ý không.
    ~ qh("thuc_tap_sinh", 6)
+ [😶 Xoa đầu, mở cổng.]
- thuc_tap_sinh: Bác ơi… bác làm bảo vệ 16 năm, bác có bao giờ muốn làm nghề khác không ạ?
* [🍵 "Không. Bác hứa với một người rồi. Hứa thì đứng."]
    thuc_tap_sinh: *(mắt sáng lên)* Con cũng hứa với mình là làm nghề này tới cùng ạ.
    ~ qh("thuc_tap_sinh", 8)
* [😐 "Có. Năm 2012 bác muốn làm thợ sửa radio. Rồi thôi."]
    thuc_tap_sinh: Sao thôi ạ?
    bac_bao_ve: Vì sửa radio thì không ai ngồi uống trà với bác.
    ~ qh("thuc_tap_sinh", 5)
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_ke_toan ===
# npc:ke_toan
_7 giờ 55. {ke_toan} tới, tay xách hộp cơm mang từ nhà, cuốn sổ chi tiêu kẹp nách._
ke_toan: Dạ con chào bác. Bác ơi, tháng này phụ cấp trực đêm của bác con chưa thấy giấy đề nghị. Không có giấy là không có tiền đâu bác.
* [📒 Rút cuốn sổ trực ra: "Đây. Đêm 17. Đêm 29. Ghi giờ đầy đủ."]
    ke_toan: *(lật xem, gật gù)* Sổ của bác còn chuẩn hơn sổ của con. Con duyệt.
    ~ tien_cong(150000)
    ~ qh("ke_toan", 5)
* [😐 "Thôi, bác không lấy. Công ty đang khó."]
    ke_toan: *(nhìn bác rất lâu)* Bác biết công ty khó?
    bac_bao_ve: Bác ở cổng. Thư ngân hàng đi qua cổng.
    ke_toan: *(nói rất nhỏ)* …Dạ. Con biết bác biết.
    ~ qh("ke_toan", 8)
    ~ bv_bm(1)
* [🍵 "Ngồi uống chén trà. Mắt cháu thâm như con gấu trúc."]
    ke_toan: Con mất ngủ ba tuần rồi bác.
    _Cô ngồi xuống. Uống. Không kể vì sao mất ngủ. Bác không hỏi. Bác biết: trang 47._
    ~ bv_rot_tra("ke_toan", 6)
+ [😶 Gật đầu.]
- ke_toan: Bác ơi, nếu một ngày công ty phải đóng cửa… bác đi đâu?
* [🍵 "Về Ven Đô trồng rau. Cháu về ăn rau với bác."]
    ke_toan: *(cười, lần đầu trong tuần)* Dạ. Con mang hóa đơn theo.
    ~ qh("ke_toan", 6)
* [😐 "Công ty không đóng. Bác đứng đây thì còn mở."]
    ke_toan: *(im lặng)* …Con mong vậy.
    ~ qh("ke_toan", 4)
+ [😶 Không trả lời.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_hr ===
# npc:hr
_8 giờ đúng. {hr} đứng cạnh máy chấm công như mọi ngày. Rồi đi ra cổng, cười với bác. Nụ cười làm cả công ty sợ._
hr: Bác {bac_bao_ve}. Bác rảnh không, cháu mời bác lên phòng uống trà xíu.
* [😐 "Bác có trà ở đây. Cháu xuống mà uống."]
    hr: *(bật cười)* Vâng. Bác là người duy nhất từ chối lời mời uống trà của cháu.
    _{hr} ngồi xuống ghế nhựa. Lần này người rót trà là bác._
    ~ bv_rot_tra("hr", 6)
* [🍵 "Cháu mời bác uống trà là bác sắp bị cho nghỉ à?"]
    hr: *(xua tay lia lịa)* Không không! Cháu mời thật lòng mà bác!
    bac_bao_ve: Ừ. Cả công ty sợ câu ấy của cháu đấy.
    hr: *(nụ cười tắt dần)* …Cháu biết.
    ~ qh("hr", 3)
* [💬 "Tập hồ sơ màu hồng trong cặp cháu. Bác thấy cháu cầm nó ra vào mỗi ngày."]
    hr: *(siết chặt cặp)* Bác… thấy hả?
    bac_bao_ve: Cầm cái gì nặng thì vai lệch. Vai cháu lệch cả tháng nay.
    ~ bv_bm(2)
    ~ phat_hien(danh_sach_cat_giam)
+ [😶 Gật đầu.]
- hr: Bác ơi. Cháu hỏi thật. Nếu cháu phải gạch tên ai đó… cháu có còn là người tốt không bác?
* [🍵 "Người tốt là người gạch tên mình trước, nếu phải gạch."]
    hr: *(im lặng rất lâu)* …Cháu cũng nghĩ vậy.
    ~ qh("hr", 8)
* [🙈 "Bác không biết. Bác chỉ ghi ai vào ai ra."]
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_it ===
# npc:it
_{it} đi ra cổng lúc 11 giờ đêm, cầm ly mì, đứng hút gió. Bác chưa ngủ: bác nghe tiếng dép quen._
it: Bác. Mì.
* [🍵 Nhận ly mì. "Ngồi đây."]
    _Hai người ngồi ăn mì dưới đèn đường. Không ai nói gì. Bạn nhậu thì không cần nói._
    ~ an(20)
    ~ qh("it", 5)
* [📻 "Cái radio bác rè quá. Cháu xem giùm."]
    it: *(tháo radio ra trong 30 giây, lắp lại trong 60 giây)* Hết rè. Tụ điện cũ.
    _Radio trong vắt. Bác nghe được cả đài nước ngoài._
    ~ bv_tam(5)
    ~ qh("it", 3)
* [💬 "Cháu ngủ ở phòng server mấy đêm rồi?"]
    it: 6. Wifi ở đó mạnh. Phòng trọ không có.
    bac_bao_ve: Mai về ngủ. Bác khóa phòng server.
    it: *(nhìn bác)* …Bác không có chìa.
    bac_bao_ve: Bác có tất cả chìa.
    ~ qh("it", 4)
+ [😶 Gật đầu.]
- it: Bác. Ổ cứng "KHÔNG ĐƯỢC MỞ" ở phòng cháu. Có bản sao mọi thứ từ 2016. Kể cả file thư scan của công ty.
* [🤫 "Thư scan? Thư gì?"]
    it: Thư tay. Ký "G". Ai đó scan năm 2016. Cháu không mở. Cháu chỉ biết nó có.
    bac_bao_ve: Thế thì để nó không được mở.
    ~ bv_bm(2)
    ~ bv_lo_than(2)
* [🙈 "Bác không thấy gì đâu. Cháu cũng thế."]
    it: Ừ.
    ~ bv_khong_thay_gi()
+ [😶 Ăn nốt ly mì.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_idol_het_thoi ===
# npc:idol_het_thoi
_11 giờ. {idol_het_thoi} tới, kính đen, áo khoác dù trời 33 độ. Đứng ở cổng, nhìn quanh như chờ fan._
idol_het_thoi: Bác {bac_bao_ve}. Bác biết anh là ai không?
* [😐 "Biết. Cháu {idol_het_thoi}. Đi trễ 3 tiếng."]
    idol_het_thoi: *(tháo kính)* …Bác nói vậy thì buồn ghê.
    ~ qh("idol_het_thoi", -1)
* [🍵 "Biết. Năm 2015 bác nghe cháu hát cả ngày trên radio. 'Thích ăn chuối chiên'."]
    idol_het_thoi: *(mắt sáng lên)* Bác nhớ hả bác? Bác thuộc hả bác?
    bac_bao_ve: Thuộc. Bác hát dở, nên không hát.
    ~ qh("idol_het_thoi", 8)
* [🐕 "Con {cho} biết cháu. Nó không sủa cháu."]
    cho: *(ngửi giày {idol_het_thoi}, vẫy đuôi)*
    idol_het_thoi: *(cười, cúi xuống xoa đầu)* Ít ra còn một fan.
    ~ qh("idol_het_thoi", 5)
    ~ qh("cho", 2)
+ [😶 Mở cổng.]
- idol_het_thoi: Bác… nếu một người chỉ có một bài hit, cả đời chỉ có một bài, thì có phải là thất bại không bác?
* [🍵 "Bác cả đời có một việc. Đứng cổng. Bác không thấy mình thất bại."]
    idol_het_thoi: *(im lặng)* …Dạ.
    ~ qh("idol_het_thoi", 8)
* [😐 "Một bài mà cả nước hát được 10 năm thì nhiều hơn mười bài không ai nhớ."]
    idol_het_thoi: *(gật, chậm)* Bác nói giống… giống anh {quan_ly_idol} nói.
    ~ qh("idol_het_thoi", 6)
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_quan_ly_idol ===
# npc:quan_ly_idol
_{quan_ly_idol} đứng ở cổng, mỗi tay một điện thoại, cả hai đang rung. Mắt thâm tới cằm._
quan_ly_idol: Khoan bác, con nghe máy chút… Ừ… ừ… Chuyện này để anh lo, đừng ai đăng gì hết! *(cúp)* Dạ bác, có gì không bác?
* [🍵 Đặt ly trà đá vào tay anh. Không nói gì.]
    quan_ly_idol: *(uống một hơi, thở ra)* …Con cảm ơn bác. Cả ngày nay chưa ai đưa con cái gì, toàn đòi.
    ~ bv_rot_tra("quan_ly_idol", 6)
* [💬 "Tháng 7 cháu đóng tiền nhà giùm ai đấy? Bác thấy biên lai rơi ở bãi xe."]
    quan_ly_idol: *(hai điện thoại cùng ngừng rung, như cũng đang nghe)* Bác… đừng nói với nó nha bác.
    bac_bao_ve: Bác có nói ai bao giờ.
    ~ bv_bm(2)
    ~ phat_hien(thai_thuong_phat)
* [😐 "Hai cái điện thoại. Tắt một cái đi."]
    quan_ly_idol: Tắt cái nào bác? Một cái của {idol_het_thoi}, một cái của {sieu_nhan_hong}.
    bac_bao_ve: Thế tắt cái của cháu. À, cháu không có cái nào của cháu à?
    _{quan_ly_idol} nhìn hai cái điện thoại rất lâu._
    ~ qh("quan_ly_idol", 4)
+ [😶 Mở cổng.]
- quan_ly_idol: Bác ơi, nếu người ta trả gấp đôi, mà phải bỏ lại một người… bác đi không?
* [🍵 "Bác 16 năm không đi đâu. Bác không có câu trả lời khác."]
    quan_ly_idol: *(cười mệt)* Bác trả lời rồi đó.
    ~ qh("quan_ly_idol", 6)
* [💬 "Người ấy biết cháu ở lại vì họ không?"]
    quan_ly_idol: *(điện thoại rung)* Khoan, con nghe máy chút…
    _Anh đi mất. Câu hỏi ở lại cổng._
+ [😶 Gật đầu.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_bien_kich ===
# npc:bien_kich
_9 giờ. {bien_kich} đi vào, ôm cuốn sổ, ngước nhìn trời "tìm cảm hứng", suýt đâm vào cột cổng._
bien_kich: Bác {bac_bao_ve}! Bác là nhân vật hay nhất công ty này! Bác cho con phỏng vấn bác một chút được không ạ?
* [😐 "Phỏng vấn để viết vào cái sổ ấy à?"]
    bien_kich: *(ôm chặt sổ)* Dạ… chỉ để tham khảo ạ.
    bac_bao_ve: Viết tên bác thì hỏi bác. Viết tên người khác thì hỏi người khác.
    ~ qh("bien_kich", 2)
* [🍵 "Ngồi đây. Bác kể một chuyện. Cháu không được viết."]
    _Bác kể chuyện năm 2010, căn phòng 20 mét vuông, cái bàn thùng mì. {bien_kich} nghe, không ghi. Tay để yên trên cuốn sổ đóng._
    bien_kich: …Chuyện này hay quá bác. Con không viết đâu. Con hứa.
    ~ qh("bien_kich", 8)
    ~ bv_lo_than(3)
* [💬 "Cái phim 'Người Hùng Không Tên'. Thằng {thuc_tap_sinh} kể với bác ý tưởng ấy từ tháng 9."]
    bien_kich: *(tái mặt)* Đây… đây không phải đạo, đây là cảm hứng bác…
    bac_bao_ve: Cảm hứng thì ghi tên người cho cảm hứng.
    ~ qh("bien_kich", -3)
    ~ phat_hien(nguoi_gac_ket)
+ [😶 Mở cổng.]
- bien_kich: Bác ơi, viết về người thật mà viết vì thương, có tội không bác?
* [🍵 "Không tội. Nhưng phải hỏi."]
    bien_kich: Dạ… con sẽ hỏi.
    ~ qh("bien_kich", 5)
* [😐 "Thương thì cứ nói thẳng. Viết làm gì."]
    bien_kich: *(cười)* Con là biên kịch mà bác.
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_editor ===
# npc:editor
_3 giờ sáng. Bác dậy đi vệ sinh, thấy {editor} ngồi bệt ở bậc thềm, mắt đỏ, ôm laptop, đợi render._
editor: *(ngáp)* Bác… con xin lỗi, con làm bác thức.
* [🍵 Rót ly trà đá. "Uống. Rồi về ngủ."]
    editor: Render còn 2 tiếng bác…
    bac_bao_ve: Máy nó tự chạy. Cháu không phải ngồi canh nó. Bác canh cho.
    _{editor} nhìn bác. Rồi gật đầu. Lần đầu tiên trong tháng cậu về nhà trước 5 giờ sáng._
    ~ qh("editor", 10)
    ~ bv_rot_tra("editor", 3)
* [💬 "Cháu dựng cái gì mà thức mãi thế?"]
    editor: *(quay màn hình)* Video "16 năm" cho Đêm Hồng. Thiếu mỗi ảnh năm 2010.
    bac_bao_ve: Bác có. Mai bác mang lên.
    editor: *(tỉnh hẳn)* Thật hả bác?
    ~ qh("editor", 8)
    ~ bv_lo_than(5)
* [🐕 Để {cho} ra nằm cạnh cậu ấy.]
    _{cho} nằm gác cằm lên chân {editor}. Cậu xoa đầu nó, mắt díp lại, ngủ gục trên bậc thềm. Bác đắp cho cái áo._
    ~ qh("editor", 5)
    ~ qh("cho", 2)
+ [😶 Quay vào ngủ tiếp.]
- editor: Bác ơi… thích một người mà người ta thích người khác thì làm sao bác?
* [🍵 "Thì vẫn thích. Đứng ở cổng mà nhìn người ta đi qua, cũng là một kiểu thương."]
    editor: *(nhìn bác, rất lâu)* …Bác cũng vậy hả bác?
    bac_bao_ve: Bác đứng cổng 16 năm. Bác thương cả cái công ty.
    ~ qh("editor", 8)
    ~ phat_hien(linh_thich_thai)
* [😐 "Ngủ đi đã. Thức đêm thì chuyện gì cũng to."]
    ~ qh("editor", 4)
+ [😶 Không trả lời.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_designer ===
# npc:designer
_8 giờ 30. {designer} tới, hai cái laptop trong ba lô, mặt như vừa bị sửa thiết kế lần thứ 38._
designer: Dạ con chào bác. Bác ơi… sửa nhẹ thôi là sửa cái gì hả bác?
* [🍵 "Là sửa lại từ đầu. Bác nghe anh {giam_doc} nói câu ấy 16 năm rồi."]
    designer: *(bật cười)* Từ năm 2010 luôn hả bác?
    bac_bao_ve: Cái logo chữ G ấy, năm 2010 sửa 12 lần. Rồi lấy bản đầu tiên.
    designer: Trời ơi… vậy là lời nguyền có từ trước khi con vào…
    ~ qh("designer", 8)
* [🤫 "Hôm 8/10 có cái bưu phẩm giấy xanh lá chuối gửi cháu. Bác ký nhận."]
    designer: *(khựng lại, nhìn quanh)* Dạ… bác… bác không nói ai đúng hông bác?
    bac_bao_ve: Bác có nói ai bao giờ.
    ~ bv_bm(2)
    ~ phat_hien(quynh_lam_cho_ll)
* [😐 "Cháu mang hai cái máy tính làm gì? Một cái không đủ à?"]
    designer: Dạ… một cái làm việc, một cái… làm việc khác ạ.
    ~ bv_bm(1)
+ [😶 Mở cổng.]
- designer: Bác ơi, nếu con lỡ làm một việc mà con biết là không đúng… còn sửa được không bác?
* [🍵 "Được. Thiết kế còn sửa 38 lần được. Người sửa một lần thì có sao."]
    designer: *(cười, mắt đỏ)* Bác nói hay hơn cả feedback của sếp.
    ~ qh("designer", 8)
* [😐 "Dừng trước đã. Rồi hẵng sửa."]
    ~ qh("designer", 4)
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_sales ===
# npc:sales
_{sales} đứng ở cổng gọi điện, giọng như CEO: "Dạ anh, deal này chắc kèo, tin em đi!". Cúp máy. Thở dài. Mặt xẹp như quả bóng._
sales: Bác ơi… bác cho con ngồi xíu.
* [🍵 Rót trà. "Ngồi. Ở đây không cần nói phét."]
    sales: *(bật cười, rồi suýt khóc)* Bác biết hết hả bác?
    bac_bao_ve: Bác biết người ta nói thật thì giọng khác. Cháu nãy giờ giọng như người đọc quảng cáo.
    ~ bv_rot_tra("sales", 8)
* [💬 "Cái tập đoàn BTT Global, trụ sở ở đâu?"]
    sales: *(cứng người)* Dạ… dạ ở… nước ngoài ạ.
    bac_bao_ve: Bằng khen của họ in ở Phố Mới.
    sales: *(cúi đầu)* …Bác đừng nói với anh {giam_doc} nha bác.
    ~ bv_bm(1)
    ~ phat_hien(btt_global_gia)
* [😐 "Cháu nợ ai bao nhiêu? Thằng {dan_dau_tu} nợ cháu 5 triệu đúng không?"]
    sales: Dạ… sao bác biết?
    bac_bao_ve: Sổ bác ghi cả sổ nợ của nó.
    ~ qh("sales", 3)
+ [😶 Mở cổng.]
- sales: Bác ơi… nếu một ngày con nói thật, có ai tin con không bác?
* [🍵 "Bác tin. Bác nghe giọng là biết."]
    sales: *(nhìn bác rất lâu)* …Dạ. Con nhớ câu này.
    ~ qh("sales", 10)
* [😐 "Nói thật nhiều lần thì người ta tin. Một lần thì chưa."]
    ~ qh("sales", 4)
+ [😶 Gật đầu.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_chi_dai ===
# npc:chi_dai
_7 giờ 40. {chi_dai} tới, bộ đàm bên hông, tay xách túi đồ chợ, chào bác bằng cái gật đầu quen thuộc._
chi_dai: Bác ơi! Trà đá bác pha sẵn chưa, con khát khô cổ rồi.
* [🍵 Rót ly đặc, nhiều đá, đúng kiểu cô thích.]
    chi_dai: *(uống một hơi)* Bác nhớ đúng ghê. Cả công ty chỉ có bác pha trúng ý con.
    ~ bv_rot_tra("chi_dai", 6)
* [💬 "Hôm nay mặt cháu đỏ. Ai làm cháu nóng ruột thế?"]
    chi_dai: *(cười)* Bác nhìn ra hả? {thanh_ninh} chứ ai. Mà thôi, con nhịn.
    bac_bao_ve: Nhịn thì ra đây uống trà. Đừng đấm bàn sếp, bàn trả góp đấy.
    ~ qh("chi_dai", 6)
* [🐕 "Con {cho} nhớ cháu. Cả sáng nó ngồi đợi ở cổng."]
    cho: *(lao ra, quẫy đuôi tít)* Gâu gâu!
    chi_dai: {cho}! *(ngồi xổm xuống ôm)* Chị nhớ em nữa nè!
    ~ qh("chi_dai", 4)
    ~ qh("cho", 4)
+ [😶 Gật đầu chào.]
- chi_dai: Bác ơi… bác thấy con gánh nhiều quá hông? Có lúc con thấy mệt mà không biết nói với ai.
* [🍵 "Nói với bác. Bác không kể ai. Mà cháu cũng phải biết đặt xuống."]
    chi_dai: *(ngồi im, rất lâu)* …Dạ. Con biết rồi bác.
    ~ qh("chi_dai", 10)
* [😐 "Cháu không gánh một mình. Cả công ty đứng sau cháu. Chỉ là cháu không quay lại nhìn."]
    chi_dai: *(quay lại nhìn tòa nhà)* …Bác nói vậy con thấy nhẹ ghê.
    ~ qh("chi_dai", 8)
+ [😶 Rót thêm trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_dan_dau_tu ===
# npc:dan_dau_tu
_8 giờ 10. {dan_dau_tu} rón rén đi vào… bằng cổng sau. Gặp ngay bác đang tưới cây ở cổng sau._
dan_dau_tu: *(giật mình)* Ơ… bác! Bác… bác ra cổng sau làm gì ạ?
* [📒 Mở sổ trực, chỉ vào dòng nợ.]
    dan_dau_tu: Dạ… em nhớ mà bác. Sau Đêm Hồng. Em hứa.
    bac_bao_ve: Cháu hứa với 8 người. Bác là người thứ mấy?
    dan_dau_tu: *(cúi đầu)* …Thứ tư ạ.
    ~ bv_so_truc_dung = bv_so_truc_dung + 1
* [🍵 "Tưới cây. Cháu cũng ngồi uống chén trà đi, đi cổng sau mãi mỏi chân."]
    _{dan_dau_tu} ngồi xuống. Lần đầu tiên anh ngồi ở cổng sau mà không phải để trốn ai._
    ~ bv_rot_tra("dan_dau_tu", 6)
* [💬 "Cái chart đỏ ấy, cháu xem cả đêm à? Mắt cháu đỏ như cái chart."]
    dan_dau_tu: *(cười méo)* Đỏ là màu may mắn bác ạ. Lần này là lên thật.
    bac_bao_ve: Ừ. Lần trước cũng thế.
    ~ qh("dan_dau_tu", 2)
+ [😶 Tưới tiếp.]
- dan_dau_tu: Bác ơi… bác có nghĩ người như em thoát nghèo được không?
* [🍵 "Được. Hôm nào cháu đi cổng trước, là hôm ấy cháu bắt đầu thoát."]
    dan_dau_tu: *(nhìn ra cổng trước, im lặng rất lâu)* …Dạ.
    ~ qh("dan_dau_tu", 8)
* [😐 "Bán cái đồng hồ đi thì được một tháng. Bỏ cái app đi thì được cả đời."]
    dan_dau_tu: *(sờ cổ tay trống trơn)* Bác… biết cả chuyện đồng hồ ạ?
    ~ qh("dan_dau_tu", 4)
+ [😶 Không trả lời.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
_Hiếm hoi: {thanh_xin_nghi} có mặt. 8 giờ đúng. Giọng khàn khàn: "Dạ con chào bác, con hơi viêm họng ạ."_
* [😐 "Viêm họng vì hát hay vì ho?"]
    thanh_xin_nghi: *(đứng hình)* Dạ… dạ vì… ho ạ.
    bac_bao_ve: Ừ. Ho mà lên được nốt cao thì giỏi.
    _{thanh_xin_nghi} cười, gãi đầu. Biết là bị lộ rồi._
    ~ qh("thanh_xin_nghi", 3)
* [🍵 "Uống ly trà gừng đây. Bác pha cho người viêm họng."]
    thanh_xin_nghi: *(cảm động)* Bác pha riêng cho con hả bác?
    _Không phải trà gừng. Trà đá. Nhưng bác thêm một lát gừng. Cũng là quan tâm._
    ~ bv_rot_tra("thanh_xin_nghi", 6)
* {bv_biet_son_hat} [🔒 "Vòng trong rồi à? Bác nghe đài."]
    thanh_xin_nghi: *(há hốc)* Bác… bác nghe hả bác?
    bac_bao_ve: Nhà bác cạnh nhà cháu ở Ven Đô. Bộ đồ kim tuyến phơi ngoài sân, cả xóm thấy.
    _{thanh_xin_nghi} ôm mặt cười. Rồi nói nhỏ: "Bác đừng nói anh {hr} nha bác."_
    ~ qh("thanh_xin_nghi", 10)
+ [😶 Mở cổng.]
- thanh_xin_nghi: Bác ơi… nếu con chọn đi hát mà mất việc, bác có thấy con dại không?
* [🍵 "Không. Người ta chỉ dại khi không dám chọn."]
    thanh_xin_nghi: *(mắt đỏ)* Dạ… con cảm ơn bác.
    ~ qh("thanh_xin_nghi", 10)
* [😐 "Chọn thì nói thật. Bà ngoại cháu ốm 7 lần rồi, cho bà nghỉ đi."]
    thanh_xin_nghi: *(bật cười)* Dạ… bà ngoại con khỏe re bác ơi.
    ~ qh("thanh_xin_nghi", 6)
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
_9 giờ. Xe hồng vào ô "HỒNG". {sieu_nhan_hong} nhảy xuống, tạo dáng với cột điện: "Biến hình!"_
sieu_nhan_hong: Bác ơi! Chào buổi sáng! Hồng không phải màu, Hồng là thái độ!
* [😐 Gật đầu. "Ừ. Cháu đỗ thẳng xe vào ô đi đã."]
    sieu_nhan_hong: *(nhìn lại xe, lệch nửa ô)* Dạ! Siêu nhân đỗ xe dở lắm bác!
    ~ qh("sieu_nhan_hong", 3)
* [🐕 "Đừng chọc con {cho} hôm nay. Nó chưa ăn sáng."]
    sieu_nhan_hong: *(nhìn {cho}, {cho} nhìn lại, gầm gừ)* Dạ… hôm nay con tha cho nó.
    cho: Grừ…
    ~ qh("cho", 2)
* [🍵 "Uống chén trà rồi hẵng lên. Đội mũ cả ngày, nóng."]
    sieu_nhan_hong: *(hạ giọng, nói nhỏ như lúc không mặc đồ)* Dạ… con cảm ơn bác.
    _Cậu ngồi xuống ghế nhựa, kéo mũ lên một chút để uống bằng ống hút. Ở chòi bác, cậu không cần tạo dáng._
    ~ bv_rot_tra("sieu_nhan_hong", 6)
+ [😶 Mở cổng.]
- sieu_nhan_hong: Bác ơi… hồi nhỏ con hay bắt nạt mấy đứa trong xóm. Giờ con đi giúp người. Bác thấy vậy có bù được không bác?
* [🍵 "Không bù được. Nhưng tốt hơn là không làm gì. Còn đứa bị bắt nạt, có khi nó đang ở gần cháu hơn cháu nghĩ."]
    sieu_nhan_hong: *(ngẩng lên)* Gần… là sao bác?
    bac_bao_ve: Bác không thấy gì đâu.
    ~ qh("sieu_nhan_hong", 8)
    ~ bv_lo_than(2)
* [😐 "Người ta không cần cháu bù. Người ta cần cháu nhớ."]
    sieu_nhan_hong: *(im lặng)* …Con không nhớ tên nó, bác ạ.
    ~ qh("sieu_nhan_hong", 6)
+ [😶 Rót trà.]
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_tudo_cho ===
# npc:cho
_Chòi bảo vệ. {cho} nằm ở ổ, gác cằm lên chân ghế bố, mắt lim dim. Thấy bác nhìn, đuôi đập lộp độp._
cho: Gâu.
* [🍖 Đưa một cây xúc xích.]
    cho: *(ăn trong 2 giây, rồi ngồi thẳng, chờ cây thứ hai)*
    bac_bao_ve: Một cây thôi. Lương mày 2 cây một ngày.
    ~ qh("cho", 5)
    { co(xuc_xich):
        ~ mat(xuc_xich)
    }
* [🐕 "Đi dạo không?"]
    cho: *(nghe chữ "đi dạo", bật dậy như lò xo, chạy ba vòng quanh chòi)* GÂU GÂU!
    _Hai ông cháu đi một vòng quanh bãi xe. {cho} tè vào đúng cái cột quen. Bác đứng đợi, như mọi ngày._
    ~ qh("cho", 6)
    ~ bv_tam(5)
* [📒 "Hôm nay mày tha gì về kho?"]
    cho: *(chạy đi, quay lại, đặt dưới chân bác một chiếc bút bi hồng của ai đó)* Gâu!
    bac_bao_ve: Bút của cậu áo hồng. Mày lấy làm gì?
    cho: *(nhìn bác, như nói "vì thích")*
    ~ bv_bm(1)
    ~ qh("cho", 3)
+ [😶 Xoa đầu.]
- cho: *(gác cằm lên đầu gối bác, thở dài như người)*
* [🍵 Ngồi im với nó một lúc.]
    _Mười phút. Radio rè rè. Nắng chiều xiên qua cổng. Một ông già, một con chó, không ai cần nói gì._
    ~ bv_tam(8)
    ~ qh("cho", 4)
* [💬 "Mày có nhớ hôm bác nhặt mày không? Mưa to lắm."]
    cho: *(vểnh tai)* …Ẳng.
    _Bác coi như là "có"._
    ~ qh("cho", 5)
+ [😶 Đứng dậy đi tuần.]
- -> END
