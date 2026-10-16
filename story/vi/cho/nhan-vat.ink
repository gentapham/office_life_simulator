// ============================================================
// GẶP TỪNG NGƯỜI (cảnh tự do, không gắn ngày)
// Mỗi người đối xử với {cho} một kiểu. Game mở cảnh khi Tuất
// lại gần NPC đó. Lựa chọn "+" có thể lặp lại ở lần gặp sau.
// ============================================================

// ------------------------------------------------------------
=== cho_tudo_ran_doc ===
# npc:ran_doc # noi:tang_1
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_{ran_doc} ngồi ở bàn, cuốn sổ tay mở, bút bi gõ gõ. Mùi trà sữa. Mùi giấy sổ. Mùi bực bội đã quen thuộc như mùi nhà._
_Người này nhìn bạn. Không cười, không xua. Nhìn như nhìn một quân cờ._
ran_doc: Bla bla… TUẤT… bla bla… HỒNG… bla? # phu_de:{cho}, mày cũng ghét cái tên mặc đồ hồng đó hả? Vậy mình là đồng minh rồi.
* [🐾 Vẫy đuôi. Kẻ thù của kẻ thù là bạn.]
    _Bạn vẫy đuôi. Người này xoa đầu bạn, lần này tay ấm hơn hôm 1/10._
    ran_doc: Bla bla… bla bla bla. # phu_de:Tui chỉ nói sự thật thôi mà. Mày là đứa duy nhất trong công ty không giả bộ thương ổng.
    ~ qh("ran_doc", 6)
* [👃 Đánh hơi cuốn sổ tay.]
    ~ ch_mui(2)
    _Cuốn sổ có mùi của cả công ty: mùi thịt kho, mùi cá viên chiên, mùi cà phê sữa đá, mùi két sắt. Mỗi trang một người._
    { ch_mui_thinh >= 60:
        _Và kẹp giữa sổ, một tấm ảnh rất cũ. Mùi cây me. Mùi nhà kho có lỗ thông gió. Mùi một đứa nhỏ khóc._
        ~ phat_hien(hieu_ech)
    }
    ran_doc: *(gập sổ lại)* Bla. KHÔNG. # phu_de:Không. Cái này không phải đồ chơi.
* [🎁 Chạy về kho, mang ra cho người này xem một món đồ.]
    _Bạn chạy xuống gầm cầu thang. Người này đứng dậy, đi theo, rất khẽ. Bạn không để ý._
    _Lúc bạn quay ra với chiếc tất lẻ, người này đang đứng ở chân cầu thang, mắt quét qua cả kho. Chìa khóa, son môi, chiếc găng tay hồng… Người đó mỉm cười._
    ran_doc: Bla bla… bla bla. # phu_de:Ồ… mày là thánh hóng còn hơn {hong_hot} nữa đó.
    ~ ch_kho_bi_lo = true
    ~ qh("ran_doc", 4)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_giam_doc ===
# npc:giam_doc # noi:phong_giam_doc
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Phòng kính tầng 2. Cửa có dán nội quy số 8. Bạn vẫn không biết đọc._
~ ch_vao_phong_gd = ch_vao_phong_gd + 1
giam_doc: *(đang gọi điện, giọng ngọt bất thường)* Bla bla… bla bla bla… bla. # phu_de:Dạ vâng, em biết khoản vay đến hạn 15/11 rồi ạ… dạ… em sẽ thu xếp…
_Người này cúp máy. Nhìn thấy bạn. Mặt đổi từ sợ sang giận sang… mệt._
giam_doc: TUẤT. Bla bla… KHÔNG… bla bla bla. # phu_de:{cho}. Lại vào đây. Nội quy số 8 đấy. Anh không ép, tùy em… nhưng ra.
* [🐾 Ngồi xuống, đặt cằm lên đầu gối người đó.]
    _Bạn đặt cằm lên đầu gối. Người này định đẩy ra, rồi thôi. Bàn tay đeo đồng hồ to đặt lên đầu bạn, nằm im đó rất lâu._
    giam_doc: Bla bla… bla… bla bla. # phu_de:Hồi mới mở công ty, phòng có 20 mét vuông. Bác {bac_bao_ve} ngồi ở cửa. Chưa có mày. Chưa có gì cả.
    ~ qh("giam_doc", 6)
* [👃 Đánh hơi ngăn kéo bàn.]
    ~ ch_mui(2)
    _Ngăn kéo có mùi giấy ngân hàng, rất nhiều giấy ngân hàng. Và một mùi lạ: mùi đất đỏ, mùi sân golf mini, mùi một căn biệt thự trống._
    giam_doc: Bla! KHÔNG! # phu_de:Ấy! Không! Cái đấy không ngửi được!
    ~ qh("giam_doc", -3)
* [💩 Để lại quà. Bạn không đọc được nội quy, nhưng bạn có quan điểm.]
    ~ ch_de_qua("phong_gd")
    giam_doc: TUẤT! Bla bla bla bla! Bla! # phu_de:{cho}! Lần thứ mấy rồi! {thanh_ninh}! Gọi bác {bac_bao_ve}! Viết thêm nội quy số 11!
    ~ qh("giam_doc", -10)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_truong_phong ===
# npc:truong_phong # noi:phong_hop_tang_2
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Phòng họp "Sáng Tạo". {truong_phong} ngồi một mình trước bảng trắng. Trên bảng: một sơ đồ rất phức tạp. Tiêu đề: "Họp để giảm số cuộc họp"._
truong_phong: Bla bla… TUẤT. Bla bla bla… bla. # phu_de:{cho} à. Vào họp với anh 5 phút. Không ai chịu họp với anh nữa.
* [🐾 Nhảy lên ghế, ngồi ngay ngắn như người tham dự.]
    _Bạn ngồi lên ghế. Thẳng lưng. Nhìn bảng trắng. {truong_phong} xúc động, bắt đầu trình bày. Slide 1 trên 40._
    _Bạn nghe hết. Không ngắt lời. Không lướt điện thoại. Không ngủ (gần như)._
    truong_phong: Bla bla… TUẤT… NGOAN. # phu_de:Cậu là thành viên họp tốt nhất từ trước tới giờ. Mình take note lại nhé.
    ~ qh("truong_phong", 8)
* [😴 Nằm dưới gầm bàn ngủ.]
    _Bạn ngủ. {truong_phong} họp với một con chó đang ngủ suốt 40 phút. Cuối buổi, người đó gật gù: "Ừ, cậu nói đúng. Cần nghỉ ngơi."_
    ~ nghi(20)
    ~ qh("truong_phong", 3)
* [😤 Sủa một tiếng rồi chạy ra.]
    cho: Gâu!
    truong_phong: Bla… bla bla. # phu_de:Ừ… phản hồi đã nhận. Cuộc họp kết thúc.
    _Lần đầu tiên trong tháng, có một cuộc họp của {truong_phong} kéo dài đúng 5 phút._
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_thanh_ninh ===
# npc:thanh_ninh # noi:ban_tro_ly
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Bàn trợ lý ngoài phòng giám đốc. {thanh_ninh} đang soạn bài phát biểu khen sếp. Mùi nước hoa ngọt. Thỉnh thoảng có thêm một mùi lạ: sàn đá lạnh, điều hòa rất mạnh, kính rất cao._
thanh_ninh: Bla… TUẤT… KHÔNG… bla bla. # phu_de:{cho}, không được vô phòng sếp nha. Ra ngoài. Chó gì mà cứ thích vô chỗ sang.
* [🐾 Ngồi trước bàn, làm mặt ngoan.]
    _Bạn ngồi. Ngoan. Mắt long lanh. Người này nhìn quanh, không có ai. Thở ra. Rồi lấy trong ngăn kéo một miếng bánh quy._
    thanh_ninh: *(thì thầm)* Bla bla… bla bla bla. # phu_de:Nè. Đừng nói ai. Cả công ty tưởng chị chỉ biết nịnh sếp.
    ~ ch_an(5)
    ~ qh("thanh_ninh", 6)
* [👃 Đánh hơi túi xách dưới gầm bàn.]
    ~ ch_mui(2)
    _Túi xách có mùi một tờ giấy mời, giấy dày, mực xanh lá chuối._
    { ch_mui_thinh >= 80:
        _Mùi xanh lá chuối. Mùi tòa nhà kính ở Ven Đô. Rõ như ban ngày._
    }
    thanh_ninh: *(giật túi lại)* Bla bla! KHÔNG! # phu_de:Ê! Không! Đồ riêng tư!
    ~ qh("thanh_ninh", -4)
* [🏃 Lẻn vào phòng giám đốc khi người này quay đi.]
    ~ ch_vao_phong_gd = ch_vao_phong_gd + 1
    _Bạn lẻn vào. Ngồi lên ghế sofa của sếp. Mềm. Êm. Người này quay lại, hét lên một tiếng như còi cứu hỏa._
    ~ qh("thanh_ninh", -3)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_hong_hot ===
# npc:hong_hot # noi:tang_1
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Bàn mạng xã hội. Ba cái điện thoại, một cái đèn tròn, một túi khô gà. {hong_hot} thấy bạn là mắt sáng rỡ như thấy tin nóng._
hong_hot: TUẤT! Bla bla bla… bla bla! # phu_de:{cho}! Nghe gì chưa? Clip của em được nhiều view hơn anh {sieu_nhan_hong} rồi đó! Ối dồi ôi!
* [🦴 Mắt cún nhìn túi khô gà.]
    hong_hot: Bla bla… bla… ĂN! # phu_de:Biết liền! Một miếng thôi nha, khô gà cay đó!
    _Cay. Rất cay. Bạn hắt xì năm cái. {hong_hot} quay được. Clip "{cho} ăn cay" thêm 2.000 lượt thích._
    ~ ch_an(5)
    ~ ch_mui(-1)
    ~ follow(2000)
* [🐾 Nhảy lên đùi, chui vào khung hình livestream.]
    _Bạn chui vào khung hình. Bình luận nổ tung: "{cho} kìa!", "Chó idol!", "Cho tui xin vía!"._
    hong_hot: Bla bla bla! # phu_de:Mấy bà thấy chưa! Idol bốn chân của {cong_ty}!
    ~ follow(5000)
    ~ ch_tuat_noi_hon_nguyen = true
    ~ qh("hong_hot", 5)
* [👃 Đánh hơi cái laptop.]
    ~ ch_mui(2)
    _Laptop mùi nửa đêm: mì gói, đèn LED, ring light nóng. Và một mùi hồi hộp của người đang giữ một bí mật rất to._
    hong_hot: *(gập laptop nhanh như chớp)* Bla bla… bla. # phu_de:Ủa ngửi gì ngửi. Không có gì hết á.
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha # noi:sanh_tang_tret
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_{con_ong_chau_cha} bước vào lúc 10 giờ, kính râm, ly cà phê đá, đôi giày da bóng đến mức bạn thấy mặt mình trong đó._
con_ong_chau_cha: Bla bla… TUẤT. Bla bla bla? # phu_de:Ê {cho}. Sao mày không có cái ổ xịn hơn? Để anh mua cho cái ổ nhập khẩu.
* [🐾 Vẫy đuôi, đi theo người này.]
    _Bạn đi theo. Người này đi tới cửa hàng tiện lợi 24/7, mua một hộp xúc xích loại đắt nhất, ngồi trên bậc thềm chia cho bạn từng cây._
    con_ong_chau_cha: Bla bla… bla… bla bla. # phu_de:Mày biết không, ai cũng tưởng tui sướng. Chú tui lo hết. Mà tui đâu có muốn vậy.
    ~ ch_an(30)
    ~ qh("con_ong_chau_cha", 8)
* [👃 Đánh hơi túi áo.]
    ~ ch_mui(2)
    _Túi áo có mùi một phòng kín, tiêu âm, mùi dây micro và mùi giấy viết nhạc. Rất nhiều giấy viết nhạc, bị vò rồi lại vuốt phẳng._
    { ch_mui_thinh >= 60:
        _Trên mấy tờ giấy đó, có một chữ lặp đi lặp lại. Bạn không biết đọc. Nhưng bạn biết nó vần với "HỒNG"._
    }
* [💩 Đôi giày bóng quá. Bạn có ý kiến.]
    ~ ch_de_qua("van_phong")
    con_ong_chau_cha: Bla bla! Bla bla bla! # phu_de:Ủa! Đôi giày này 20 triệu! Để anh gọi chú anh!
    ~ qh("con_ong_chau_cha", -8)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_chua_te_deadline ===
# npc:chua_te_deadline # noi:tang_1
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Bàn của {chua_te_deadline}. Người này đang nằm ngửa trên ghế, điện thoại trên mặt, lướt Tóp-tóp. Mùi cà phê sữa đá. Mùi gối ôm màu hồng._
chua_te_deadline: Bla… TUẤT. Bla bla. # phu_de:Ờ, {cho}. Chill đi, còn sớm mà.
{ ch_tra_usb_cho_vu:
    _Người này nhìn thấy bạn thì ngồi bật dậy, như thấy sếp. Rồi cười, xoa đầu bạn bằng cả hai tay._
    chua_te_deadline: Bla bla… TUẤT… bla… NGOAN. # phu_de:Ân nhân của anh. Ngoan. Muốn gì anh cũng chiều.
    ~ ch_an(15)
}
* [😴 Nằm dưới ghế ngủ cùng. Đồng nghiệp chill.]
    _Hai đứa ngủ. Không ai làm việc. Đây là sự hợp tác hoàn hảo nhất của {cong_ty}._
    ~ nghi(20)
    ~ qh("chua_te_deadline", 4)
* [👃 Đánh hơi ly cà phê sữa đá.]
    ~ ch_mui(2)
    _Mùi cà phê sữa đá. Mùi này… bạn biết. Trong kho. Cái thứ nhỏ, cứng, dễ gặm. {co(usb_khong_nhan):Vẫn còn nằm dưới gầm cầu thang.|Bạn đã trả rồi.}_
    { co(usb_khong_nhan):
        _Bạn nhìn người này. Người này nhìn điện thoại. Không ai hiểu ai._
    }
* [😤 Sủa. Tới deadline rồi đó!]
    cho: Gâu! Gâu!
    chua_te_deadline: Bla bla! ÉT O ÉT! Bla bla bla! # phu_de:Ủa mấy giờ rồi! Ét o ét! Ai cứu tui với!
    _Người này nhảy khỏi ghế, mở máy tính, gõ như bão. Bạn vừa làm được điều mà {truong_phong} không làm được cả tháng._
    ~ qh("truong_phong", 2)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh # noi:pantry
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Pantry. {thuc_tap_sinh} đang úp mì gói, tay áo xắn cao, chân trái đứng chân phải xếp ghế. Người này lúc nào cũng làm ba việc một lúc._
thuc_tap_sinh: Dạ… TUẤT! Bla bla… bla bla! # phu_de:Dạ… à không, {cho}! Em đó hả! Ăn mì với anh hông?
+ [🦴 Ngồi chờ phần mì.]
    _Người này gắp cho bạn một gắp mì. Thổi nguội. Đặt vào nắp hộp. Như phục vụ khách VIP._
    ~ ch_an(10)
    ~ qh("thuc_tap_sinh", 3)
+ [🎾 Tha quả bóng tới.]
    -> cho_mg_nhat_bong
* [🙃 Nằm ngửa giữa pantry.]
    _Người này bỏ hết, ngồi bệt xuống sàn gãi bụng bạn. Mì nở. Ghế chưa xếp. Không sao. Người này cười như hồi còn đi học._
    thuc_tap_sinh: Bla bla… bla bla bla. # phu_de:Hồi trước làm ngân hàng, cả năm anh không cười như vầy.
    ~ qh("thuc_tap_sinh", 6)
    ~ ch_cung(2)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_ke_toan ===
# npc:ke_toan # noi:phong_ke_toan
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Phòng kế toán. Mọi thứ dán nhãn. Bút bi dán nhãn. Ly nước dán nhãn. Cái ghế cho khách dán nhãn "khách". {ke_toan} ngẩng lên, nhìn bạn qua cặp kính._
ke_toan: TUẤT. Bla bla… bla bla bla? # phu_de:{cho}. Lại tới xin ăn hả? Hóa đơn đâu em?
* [🦴 Ngồi ngay ngắn, mắt cún.]
    ke_toan: Bla bla. KHÔNG. Bla bla bla. # phu_de:Không. Không có hóa đơn là không có thịt kho.
    _Bạn vẫn ngồi. Mắt vẫn long lanh. Một phút. Hai phút._
    { RANDOM(1, 3) == 1:
        _Người này thở dài, mở hộp cơm, gắp một miếng thịt kho đặt xuống. Rồi ghi vào một cuốn sổ nhỏ: "Phúc lợi chó: 1 miếng."_
        ~ ch_an(15)
        ~ qh("ke_toan", 3)
    - else:
        _Người này tiếp tục bấm máy tính. Bạn thua. Người này là bức tường thép duy nhất trong công ty._
    }
* [🎁 Ngậm một đồng xu tìm được, đặt lên bàn người này.]
    _Bạn đặt đồng xu 5.000đ lên bàn. {ke_toan} nhìn đồng xu, nhìn bạn, rồi mỉm cười, lần đầu trong ngày._
    ke_toan: Bla bla… TUẤT… bla bla. # phu_de:{cho} nộp quỹ hả. Ghi nhận. Cả công ty này chỉ có em nộp tiền chứ không xin.
    ~ qh("ke_toan", 6)
    ~ ch_cung(3)
* [👃 Hộp cơm thịt kho đâu rồi? Cái mùi bị lấy mất!]
    -> cho_mg_theo_dau
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_hr ===
# npc:hr # noi:phong_hr
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Phòng HR. Mùi trà ô long, mùi giấy in còn nóng, mùi một tập hồ sơ màu hồng giấu trong ngăn kéo khóa. {hr} cười. Như mọi khi._
hr: TUẤT. Bla bla… bla bla bla… bla. # phu_de:{cho}. Em rảnh không, vào phòng anh uống trà xíu.
_Câu này, ai trong công ty nghe cũng sợ. Bạn thì không hiểu, nên bạn vào._
* [🐾 Ngồi xuống ghế khách, nghe người này nói.]
    _Người này rót trà. Một ly cho mình. Một ly đặt trước mặt bạn (bạn không uống). Rồi người này nói, rất lâu, giọng nhỏ dần._
    hr: Bla bla… bla bla bla… bla bla. # phu_de:Anh có cái danh sách. Có tên những người anh quý. Anh không muốn đọc nó lên. Mà anh chỉ nói được với em thôi.
    _Người này không cười nữa. Mặt người này khi không cười trông trẻ hơn, và buồn hơn._
    ~ qh("hr", 8)
* [👃 Đánh hơi cái ngăn kéo khóa.]
    ~ ch_mui(2)
    _Mùi giấy hồng. Mùi phòng giám đốc. Mùi bảy cái tên. Không, bạn không biết đếm. Bạn chỉ biết nó nặng._
    hr: *(cười, nhưng mắt không cười)* Bla bla… KHÔNG. # phu_de:Không được đâu {cho}. Cái đó anh cũng không muốn mở.
* [😤 Gầm gừ. Phòng này có mùi đáng sợ.]
    cho: Grừ…
    hr: Bla bla… bla bla bla. # phu_de:Ừ. Anh hiểu. Ai vô phòng này cũng muốn gầm gừ vậy hết.
    ~ qh("hr", -2)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_it ===
# npc:it # noi:phong_server
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Phòng server. Ấm. Ù ù. Ba màn hình. Năm ly mì rỗng. {it} ngồi trong bóng tối như một con cú, không nói gì._
it: … # phu_de:…
_Người này đẩy một cái hộp các-tông về phía bạn bằng chân. Bên trong lót áo cũ. Một cái ổ. Người này làm ổ cho bạn trong phòng server từ bao giờ?_
* [😴 Nằm vào ổ.]
    _Ổ vừa khít. Ấm như lòng máy chủ. Bạn ngủ. {it} gõ phím, thỉnh thoảng thả xuống một sợi mì._
    ~ nghi(30)
    ~ qh("it", 5)
* [👃 Đánh hơi dưới gầm bàn server.]
    ~ ch_mui(2)
    _Dây điện. Bụi. Mùi một cái ổ cứng rất cũ được mang đi mang về nhiều lần, mùi phòng trọ có ba cái máy tính tự ráp._
    it: Bla. KHÔNG. # phu_de:Cái đó không được mở. Kể cả em.
* [🦷 Cắn thử một sợi dây xanh.]
    it: TUẤT. KHÔNG. # phu_de:{cho}. Không. Lỗi người dùng có lông.
    _Người này không giận. Chỉ lấy sợi dây ra khỏi miệng bạn, đưa cho bạn một cái nắp chai để gặm. Chuyên nghiệp._
    ~ qh("it", 2)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_idol_het_thoi ===
# npc:idol_het_thoi # noi:studio_tang_2
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Studio. {idol_het_thoi} đeo kính đen trong nhà, luyện thanh. "Mi mi mi… Công Viên… mi mi…". Mùi cá viên chiên trong túi áo._
idol_het_thoi: Bla bla… TUẤT. Bla bla bla… bla? # phu_de:{cho}. Em biết anh là ai không? Hồi anh còn nổi, chưa có ai mặc đồ hồng hết.
{ ch_ghet_hong >= 70:
    _Người này cúi xuống, thì thầm: "Mình là đồng minh. Kẻ thù của kẻ thù." Rồi đưa cho bạn một viên cá viên chiên._
    ~ ch_an(5)
    ~ qh("idol_het_thoi", 3)
}
* [🐾 Tru theo lúc người đó luyện thanh.]
    cho: Auuuu…
    _Người này ngừng hát, cười phá lên, rồi hát tiếp. Bạn tru bè. Hai giọng, một bài hit năm 2015._
    idol_het_thoi: Bla bla… bla bla bla! # phu_de:Hay! Fan anh đông lắm, giờ có thêm một fan bốn chân!
    ~ qh("idol_het_thoi", 6)
* [🦴 Xin cá viên chiên.]
    _Người này đưa một viên. Rồi hai. Rồi cả bịch. Rồi ngồi xuống sàn studio cùng bạn ăn hết._
    ~ ch_an(15)
    ~ qh("idol_het_thoi", 4)
* [🎁 Ngậm cái kính đen chạy đi.]
    _Bạn ngậm cái kính. Chạy. Người này đuổi theo, mặt trần, giữa hành lang. Ai đi qua cũng quay lại nhìn: "Ủa, mắt anh {idol_het_thoi} đẹp vậy hả?"_
    _Người này dừng lại, ngơ ngác. Không ai nói câu đó với người này từ năm 2015._
    ~ qh("idol_het_thoi", 2)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_quan_ly_idol ===
# npc:quan_ly_idol # noi:phong_nghe_si
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_{quan_ly_idol} đi qua sảnh, hai điện thoại kẹp hai tai, một ly cà phê kẹp giữa cằm và vai. Như một cái cây treo đầy thứ._
quan_ly_idol: Bla bla! Bla bla… TUẤT… bla bla bla! # phu_de:Khoan anh nghe máy chút! {cho}, tránh đường giùm anh, chuyện này để anh lo!
* [🐾 Đi theo, ngồi cạnh khi người này ngồi xuống.]
    _Cuối cùng người này cũng ngồi. Đặt hai điện thoại xuống. Thở. Bạn đặt đầu lên đùi. Người này nhắm mắt._
    quan_ly_idol: Bla bla… bla bla bla. # phu_de:Năm phút thôi. Năm phút không ai gọi. Em giữ giùm anh nha.
    _Bạn giữ. Điện thoại rung, bạn gầm gừ với cái điện thoại. Nó ngừng rung. Năm phút._
    ~ qh("quan_ly_idol", 8)
* [🎁 Ngậm một cái điện thoại chạy đi.]
    _Bạn ngậm. Chạy. Người này đuổi, ly cà phê đổ, điện thoại còn lại rơi. Không còn cái nào trên tai. Người này đứng giữa sân, lần đầu trong ngày nghe được tiếng chim._
    ~ qh("quan_ly_idol", -2)
* [👃 Đánh hơi túi áo.]
    ~ ch_mui(2)
    _Mùi cá viên chiên. Mùi kính đen. Mùi của {idol_het_thoi}, đậm hơn cả mùi của chính người này._
    { ch_mui_thinh >= 80:
        _Và một mùi mới: xanh lá chuối, mùi tòa nhà kính. Rất nhẹ. Như vừa đi ngang qua đó._
    }
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_bien_kich ===
# npc:bien_kich # noi:san_thuong
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Sân thượng. {bien_kich} ngồi trên ghế nhựa "tìm cảm hứng". Cuốn sổ trên đùi. Mùi mực, mùi mèo, mùi cà phê sống ảo._
bien_kich: Bla bla… TUẤT… bla bla bla. # phu_de:{cho}. Em là nhân vật phụ hay nhất trong tiểu thuyết của chị đó. Chương 2: "Con chó lùi lại".
* [👃 Đánh hơi cuốn sổ.]
    ~ ch_mui(2)
    _Cuốn sổ có mùi của mọi người trong công ty. Mỗi trang một mùi. Có cả mùi của bạn, ở trang rất sớm._
    bien_kich: Bla bla! Bla bla bla. # phu_de:Ê! Đây không phải đạo, đây là cảm hứng!
* [🐾 Nằm cạnh ghế, nhìn trời.]
    _Bạn nằm. Người này viết. Gió thổi. Một lúc lâu, người này đọc to một đoạn, giọng run run. Bạn không hiểu, nhưng bạn thấy nó buồn._
    ~ qh("bien_kich", 5)
* [😤 Sủa. Người này có mùi mèo!]
    cho: Gâu! Gâu!
    bien_kich: Bla bla… bla. # phu_de:Bí gửi lời chào em đó. Bí vẫn thắng nha.
    _Bạn lùi lại một bước. Không phải vì sợ. Chỉ là… chiến lược._
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_editor ===
# npc:editor # noi:phong_dung_phim
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Phòng dựng phim tối om. 13 giờ. {editor} vừa tới, mắt như chưa tới._
editor: *(ngáp)* Bla… TUẤT… bla bla. # phu_de:{cho}… đợi render xong… rồi chơi…
* [😴 Nằm cạnh, chờ render.]
    _Thanh tiến độ chạy. 12%. 40%. 99%. Bạn ngủ, tỉnh, ngủ. 99%. Người này cũng ngủ. 99%._
    ~ nghi(25)
    ~ qh("editor", 3)
* [🐾 Ngồi trước camera, làm mẫu cho video mới.]
    _Người này quay bạn 10 giây. Dựng 3 tiếng. Video có nhạc, có slow-motion, có một con cú nhỏ giấu ở góc khung hình._
    editor: Bla bla… bla. # phu_de:Video này lên kênh riêng của anh nha. Đừng nói ai.
    ~ follow(3000)
    ~ qh("editor", 6)
* [👃 Đánh hơi thư mục trên màn hình (mùi bàn phím).]
    ~ ch_mui(1)
    _Bàn phím có mùi tay người này, và một mùi khác, rất nhẹ: cà phê đen, taxi 2 giờ sáng. Có người khác ngồi đây, lâu rồi. Người này không lau phím._
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_designer ===
# npc:designer # noi:ban_thiet_ke
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Bàn thiết kế. Hai laptop. Một cái mở file poster hồng. Một cái… vừa đóng lại khi nghe tiếng móng bạn gõ trên sàn._
designer: Bla! Bla… TUẤT. Bla bla. # phu_de:Hú hồn! À… {cho}. Tưởng ai.
* [😤 Gầm gừ khi người này giơ điện thoại lên.]
    cho: Grừ…
    designer: Bla bla bla! # phu_de:Đó! Cái mặt đó! Sticker "{cho} Không Vui" bản mới!
    ~ ch_tuat_noi_hon_nguyen = true
    ~ qh("designer", 4)
* [👃 Đánh hơi laptop thứ hai.]
    ~ ch_mui(2)
    _Laptop thứ hai ấm. Mới đóng. Mùi quán cà phê Sống Ảo, mùi bạc xỉu, và…_
    { ch_mui_thinh >= 80:
        _Xanh lá chuối. Mùi tòa nhà kính. Rất rõ._
    - else:
        _Một mùi gì đó xanh xanh. Bạn chưa phân biệt được._
    }
    designer: *(đẩy laptop ra xa)* Bla bla… bla. # phu_de:Cái đó… của khách. Khách bình thường thôi.
* [🐾 Nằm lên bàn chân người này cho đỡ căng.]
    _Người này thở ra. Rồi cúi xuống gãi tai bạn. Rồi nói nhỏ: "Sửa nhẹ thôi là sửa cái gì vậy {cho}?". Bạn không biết. Người này cũng không._
    ~ qh("designer", 5)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_sales ===
# npc:sales # noi:sanh_tang_tret
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_{sales} vừa gọi điện vừa đi, giọng to, tự tin, như đang mua cả tòa nhà._
sales: Bla bla bla… bla bla! TUẤT! Bla bla bla bla! # phu_de:Dạ deal này chắc kèo! À {cho}! Chị mới ký hợp đồng tài trợ cho em đó, 10 tấn xúc xích, tin chị đi!
_10 tấn xúc xích. Bạn không biết 10 tấn là bao nhiêu. Nhưng nghe có chữ XÚC XÍCH là đủ._
* [🦴 Ngồi chờ 10 tấn xúc xích.]
    _Bạn ngồi chờ. Một tiếng. Không có xúc xích. Người này đã đi "gặp đối tác" từ lâu._
    _Tối, người này về, ngồi bậc thềm, mở một gói mì ăn sống. Thấy bạn, bẻ cho bạn một nửa._
    sales: Bla bla… bla. # phu_de:Nói thật nha… lần duy nhất… chị cũng không có xúc xích.
    ~ ch_an(5)
    ~ qh("sales", 6)
* [👃 Đánh hơi cái cặp hồ sơ.]
    ~ ch_mui(2)
    _Cặp hồ sơ có mùi giấy mới in, mùi keo, mùi tiệm in lấy liền. Không có mùi tay người lạ nào. Chưa ai ngoài người này từng chạm vào bản hợp đồng đó._
    ~ phat_hien(btt_global_gia)
* [😤 Sủa khi người này nói "chắc kèo".]
    cho: Gâu!
    sales: Bla bla… bla bla! # phu_de:Ủa con chó này cũng không tin chị hả! Sao mà căng!
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_chi_dai ===
# npc:chi_dai # noi:kho_su_kien
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Kho sự kiện. Mùi dầu xoa bóp. Bao cát tập đấm treo giữa kho. {chi_dai} đang đấm bao cát, mỗi cú một tên người (bạn đoán vậy)._
chi_dai: TUẤT. Bla bla… ĂN… bla bla? # phu_de:{cho}. Ăn cơm chưa? Ngồi xuống chị cho thịt kho.
+ [🦴 Ngồi xuống, ăn thịt kho.]
    _Người này mở hộp cơm, chia cho bạn một nửa. Không hỏi hóa đơn. Không đòi bắt tay. Chỉ đưa._
    ~ ch_an(20)
    ~ qh("chi_dai", 3)
* [🙃 Nằm ngửa giữa kho.]
    _Người này dừng đấm. Ngồi xuống. Gãi bụng bạn bằng bàn tay đã đấm bao cát cả buổi. Nhẹ không tưởng._
    chi_dai: Bla bla… bla bla bla. # phu_de:Ở cái công ty này, chị chỉ tin em với bác {bac_bao_ve} thôi.
    ~ qh("chi_dai", 6)
    ~ ch_cung(3)
* [🐾 Đi theo người này cả buổi.]
    _Người này đi đâu, bạn đi đó. Kho sự kiện, sân khấu, phòng họp. Ai thấy hai người cũng tránh đường. Bạn chưa bao giờ thấy mình oai như vậy._
    ~ qh("chi_dai", 4)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_dan_dau_tu ===
# npc:dan_dau_tu # noi:ban_so_lieu
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Bàn số liệu. Màn hình đầy đường đỏ đường xanh. {dan_dau_tu} nhìn chằm chằm, miệng lẩm bẩm như cầu kinh._
dan_dau_tu: Bla bla… bla bla… bla. TUẤT? Bla bla bla. # phu_de:Đáy rồi… đáy thật rồi… {cho}? Mày có tiền không? Lần này là lên thật.
* [🪙 Ngậm đồng xu trong khe ghế, đặt lên bàn người này.]
    _Bạn đặt đồng xu xuống. Người này nhìn đồng xu, nhìn bạn, rồi ôm mặt cười._
    dan_dau_tu: Bla bla… bla bla bla! # phu_de:Chó cũng cho tui vay! Trời ơi! Đây là tín hiệu! Tín hiệu đảo chiều!
    ~ qh("dan_dau_tu", 5)
* [😤 Gầm gừ. Người này nợ bác.]
    cho: Grừ…
    dan_dau_tu: Bla bla… bla! Bla bla bla. # phu_de:Biết rồi biết rồi! Tuần sau tui trả bác! Mày làm ơn đừng nhìn tui như chủ nợ!
    ~ qh("dan_dau_tu", -2)
* [😴 Nằm dưới chân, nghe người này lẩm bẩm.]
    _Người này lẩm bẩm về x10, về đáy, về "còn cái nịt". Bạn ngủ. Giọng người này đều đều như radio của bác._
    ~ nghi(15)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi # noi:tang_1
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
{ RANDOM(1, 3) == 1:
    _Bàn điều phối trống. Lại trống. Trên ghế: mùi kim tuyến, mùi đèn sân khấu, mùi nước súc miệng bạc hà._
    _Bạn ngửi cái ghế. Bạn nằm lên ghế. Bạn trở thành người duy nhất có mặt ở bàn điều phối hôm nay._
    hr: Bla bla… TUẤT… bla bla. # phu_de:Ủa, {cho} đi làm thay {thanh_xin_nghi} hả? Còn chuyên cần hơn nó.
    -> END
}
_Hôm nay {thanh_xin_nghi} có mặt. Hiếm như Ngày Trứng. Người này ngồi gõ phím, ho khẽ, giọng yếu ớt dù chẳng có ai nghe._
thanh_xin_nghi: *(thì thầm)* Bla… TUẤT… bla bla bla. # phu_de:{cho}… đừng nói ai nha… tối nay anh đi thi hát.
* [🐾 Nằm dưới chân, nghe người này ngân nga.]
    _Người này ngân nga rất nhỏ. Hay. Hay hơn bất cứ ai bạn từng nghe, trừ người đeo kính đen trong pantry tối._
    ~ qh("thanh_xin_nghi", 6)
* [👃 Đánh hơi túi áo.]
    ~ ch_mui(2)
    _Một tờ giấy khám bệnh. Mùi phòng khám Khỏe Re. Mùi ông bác sĩ thở dài. Đây là tờ thứ tám bạn ngửi thấy trong tháng._
    { ch_mui_thinh >= 60:
        ~ phat_hien(son_thi_hat)
        _Và kẹp chung: một tờ giấy dày, mùi Đài Tivi Hóng, mùi kim tuyến. Giấy báo vào vòng trong._
    }
* [😤 Sủa to. Có người đang giả ốm!]
    cho: Gâu! Gâu!
    _{hr} ngẩng lên từ phòng bên. {thanh_xin_nghi} ho to hơn. Một màn kịch ba người, trong đó chỉ có bạn là thật._
    ~ qh("thanh_xin_nghi", -4)
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_bac_bao_ve ===
# npc:bac_bao_ve # noi:choi_bao_ve
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Chòi bảo vệ. Ấm trà. Radio. Ghế bố. Ổ của bạn. Mùi trà mạn và dầu gió. Nhà._
bac_bao_ve: TUẤT. Bla bla. # phu_de:{cho}. Lại đây.
+ [🙃 Nằm ngửa.]
    _Bác gãi bụng. Chân sau bạn đạp vào không khí. Bác cười, cái cười ít ai trong công ty được thấy._
    ~ qh("bac_bao_ve", 2)
    ~ ch_cung(1)
+ [🪙 Huých mũi vào ống bơ tiền rơi.]
    { ch_tien_ong_bo >= 10000:
        ~ temp so = ch_doi_xuc_xich()
        bac_bao_ve: Bla bla… XÚC XÍCH… NGOAN. # phu_de:Đủ rồi đấy. {so} cây xúc xích. Tiền mày nhặt, mày ăn. Ngoan.
    - else:
        bac_bao_ve: Bla bla… KHÔNG… bla. # phu_de:Chưa đủ đâu. Mới {ch_tien_ong_bo} đồng. Đi nhặt thêm đi.
    }
+ [😴 Nằm dưới ghế bố, nghe radio cùng bác.]
    _Radio đọc tin thời sự. Bác nghe. Bạn ngủ. Thỉnh thoảng bác thò chân xuống, xoa lưng bạn bằng bàn chân đi dép tổ ong._
    ~ nghi(20)
* [🎁 Tha một món đồ trong kho ra cho bác xem.]
    _Bạn tha chiếc tất lẻ sọc cam ra. Bác nhìn, nhíu mày, rồi ghi vào sổ trực: "Tất cam, của ai, chưa rõ"._
    bac_bao_ve: Bla bla… bla bla. # phu_de:Mày giữ cả kho chuyện của người ta đấy, {cho} ạ. Bác không thấy gì đâu.
    { ch_dong_minh_kho == "":
        ~ ch_dong_minh_kho = "bac_bao_ve"
    }
+ -> END
- -> END

// ------------------------------------------------------------
=== cho_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong # noi:cong_cong_ty
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Mùi bánh chuối chiên. Mùi nước hoa hồng. Lông gáy bạn dựng lên trước cả khi bạn kịp quay đầu._
{ ch_ghet_hong >= 60:
    sieu_nhan_hong: Gâu! Gâu gâu! Bla bla… TUẤT… {ch_hong()}… bla bla! # phu_de:Gâu! Gâu gâu! {cho} ơi, nhìn anh nè, hôm nay anh hồng hơn hôm qua!
    _Người đó ngồi xổm, làm mặt xấu, thè lưỡi, tay thò về phía cái bóng cao su của bạn._ # hen_gio:3
- else:
    sieu_nhan_hong: Bla bla… TUẤT… bla. XÚC XÍCH? # phu_de:{cho}… hôm nay anh không chọc đâu. Xúc xích hông?
    _Người đó ngồi xổm, không làm mặt xấu. Tay cầm một cây xúc xích, chìa ra, chờ._ # hen_gio:3
}
+ [😤 Sủa thật to.]
    cho: GÂU GÂU GÂU!
    ~ ch_lan_sua_hong = ch_lan_sua_hong + 1
    { RANDOM(1, 2) == 1:
        hong_hot: Bla bla bla! # phu_de:Quay được rồi! {cho} với Hồng, phần mới!
        ~ follow(8000)
    }
    ~ ch_hong_doi(5)
* [🦷 Lao vào ngoạm vạt áo choàng hồng.]
    { RANDOM(1, 10) <= 4 && not ch_co_manh_ao_hong:
        _Roẹt. Một mảnh vải hồng nằm trong miệng bạn. Người đó nhìn cái áo choàng rách, nhìn bạn, rồi bật cười._
        ~ ch_co_manh_ao_hong = true
        ~ ch_tha_ve_kho()
        ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 5
        bac_bao_ve: Bla… TUẤT… KHÔNG. # phu_de:{cho}. Không.
    - else:
        _Bạn ngoạm hụt. Người đó xoay một vòng như múa, tạo dáng. Bạn tức. Rất tức._
        ~ ch_hong_doi(3)
    }
+ {ch_ghet_hong < 60} [🦴 Nhận xúc xích từ tay người đó.]
    ~ ch_an_cua_nguyen()
    ~ ch_hong_doi(-3)
    _Bạn ăn. Người đó không giấu bóng, không làm mặt xấu. Chỉ ngồi xem bạn ăn, cười, như xem một chương trình hay._
    sieu_nhan_hong: Bla bla… bla bla. # phu_de:Ăn từ từ thôi. Anh có cả hộp mà.
+ [🐾 Quay lưng, nằm xuống, phớt lờ.]
    _Bạn quay lưng. Người đó ngơ ngác, không biết làm gì tiếp. Một lúc sau, người đó ngồi xuống cạnh bạn, cũng quay lưng. Hai cái lưng._
    ~ ch_hong_doi(-3)
+ [⏱️ (Không chọn kịp)]
    { ch_ghet_hong >= 60:
        _Cái bóng biến ra sau lưng bộ đồ hồng. Mặt xấu. Lưỡi thè. "Gâu!" Rất dở._
        cho: Ẳng!
        ~ ch_lan_bi_choc = ch_lan_bi_choc + 1
        ~ ch_hong_doi(10)
    - else:
        _Người đó đặt cây xúc xích xuống đất, rồi đi. Không chọc gì cả. Bạn nhìn cây xúc xích rất lâu, rồi ăn._
        ~ ch_an_cua_nguyen()
    }
+ -> END
- -> END

// ------------------------------------------------------------
// NPC phụ: anh shipper Tèo, kẻ thù số hai
=== cho_tudo_shipper_teo ===
# npc:shipper_teo # noi:cong_cong_ty # ngau_nhien
{ ch_lac_vung_tau:
    -> cho_tudo_xa_nha
}
_Tiếng xe máy. Tiếng còi. Mũ bảo hiểm. Mùi xăng và 40 loại đồ ăn. KẺ THÙ SỐ HAI._
shipper_teo: Bla bla bla… bla bla! # phu_de:Hàng tới rồi, ra lấy giùm em!
+ [😤 Sủa. Như mọi lần.]
    cho: GÂU! GÂU!
    shipper_teo: Bla bla bla… bla! # phu_de:Trời ơi lần nào cũng vậy! Tui giao đồ ăn cho mày mà!
    ~ ch_khong_sua_shipper = 0
+ [😶 Ngồi im. Cắn răng. Không sủa.]
    ~ ch_khong_sua_shipper = ch_khong_sua_shipper + 1
    { ch_khong_sua_shipper >= 5:
        _Lần thứ năm liên tiếp không sủa. Hắn dừng xe, ngồi xổm, nhìn bạn như nhìn một người bạn cũ._
        shipper_teo: Bla bla… TUẤT… bla bla bla. # phu_de:{cho}… mình hết thù rồi hả? Anh cảm động thiệt đó. Nè, cả hộp sườn.
        ~ ch_an(25)
    - else:
        shipper_teo: Bla… bla? # phu_de:Ủa… không sủa?
        { RANDOM(1, 2) == 1:
            _Hắn thả xuống một miếng chả. Thử lòng. Bạn ăn. Thử lòng thành công._
            ~ ch_an(10)
        }
    }
* [🦷 Ngoạm cái mũ bảo hiểm treo trên xe.]
    _Bạn ngoạm. Chạy. Cái mũ to quá, nặng quá, bạn chạy được ba mét thì phải đặt xuống. Hắn đuổi kịp, đội lại, nhìn bạn với vẻ khó hiểu._
    shipper_teo: Bla bla… {ch_mu()}… bla bla? # phu_de:Mày ghét cái mũ của anh hả? Mũ bảo hiểm mà, đội cho an toàn!
    _Không phải ghét. Đó là luyện tập. Có một cái mũ khác, màu hồng, bạn cần tập trước._
+ -> END
- -> END


// ------------------------------------------------------------
// Khi Tuất đã lạc ở Vũng Tàu, không gặp được ai ở công ty
=== cho_tudo_xa_nha ===
_Gió từ phía thành phố thổi tới. Bạn tưởng mình ngửi thấy người đó. Bạn quay đầu. Chỉ có mùi biển._
-> END
