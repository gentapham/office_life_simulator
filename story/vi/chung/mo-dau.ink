// ============================================================
// MỞ ĐẦU GAME & HƯỚNG DẪN NGÀY 1/10 (dùng chung cho mọi nhân vật)
// Theo docs/gameplay/mo-dau-va-am-thanh.md mục 1.2 – 1.3.
//
// Thẻ riêng của file này:
//   # cutscene              cảnh phim, người chơi không điều khiển
//   # bo_qua_duoc           bấm để bỏ qua
//   # man_hinh:<kiểu>       hiệu ứng màn hình (den, trang, chu_go_phim)
//   # am_thanh:<tên>        hiệu ứng âm thanh
//   # goi_y:<chữ>           gợi ý nhỏ ở góc màn hình
//   # phim:<phím>           phím cần bấm (game tự đổi sang nút trên điện thoại)
// Mỗi nhân vật có thể có cảnh riêng cùng giờ (vd ran_doc_0110_cong_cong_ty);
// khi đó game ưu tiên cảnh riêng, cảnh chung ở đây là mặc định.
// ============================================================

// Mô tả chỗ ngủ của người chơi
=== function chung_nha_cua_toi() ===
{ vai:
- "ran_doc": ~ return "Phòng 3, dãy A, Hẻm 69. Phòng sạch tới mức đáng ngờ."
- "hong_hot": ~ return "Phòng 5, dãy A, Hẻm 69. Ring light vẫn sáng từ đêm qua."
- "thuc_tap_sinh": ~ return "Phòng 12, dãy B, Hẻm 69. Ba người ở chung còn ngáy. Tháp mì gói vẫn đứng vững."
- "it": ~ return "Phòng server công ty. Quạt tản nhiệt ru bạn ngủ như mưa."
- "dan_dau_tu": ~ return "Gác lửng Hẻm 69. Màn hình chart sáng cả đêm, toàn màu đỏ."
- "giam_doc": ~ return "Biệt thự số 1, Đồi Ngân Hàng. Rộng, đẹp, và không thật sự là của bạn."
- "con_ong_chau_cha": ~ return "Penthouse tầng 30, Sky Ảo. Bể cá to hơn phòng trọ của người khác."
- "idol_het_thoi": ~ return "Căn 1808, Sky Ảo. Poster của chính bạn năm 2015 nhìn xuống giường."
- "sales": ~ return "Căn 1203, Sky Ảo. Nội thất sang. Tủ lạnh trống."
- "quan_ly_idol": ~ return "Studio 0905, Sky Ảo. Ba điện thoại cắm sạc, cả ba đều có thông báo."
- "truong_phong": ~ return "Căn 501, Phố Mới. Cái bảng trắng ở phòng khách ghi: \"Họp với bản thân: 6:35\"."
- "thanh_ninh": ~ return "Căn 302, Phố Mới. Ảnh bạn chụp với sếp, phóng to, nhìn bạn mỉm cười."
- "hr": ~ return "Căn 604, Phố Mới. Kệ trà 40 loại, sắp theo bảng chữ cái."
- "designer": ~ return "Căn 203, Phố Mới. Ban công đầy cây, hai cái laptop."
- "editor": ~ return "Căn 701, Phố Mới. Rèm đen kín mít. Với bạn, 6:30 sáng là nửa đêm."
- "ke_toan": ~ return "Nhà số 18, Phố Cũ. Cái gì cũng dán nhãn, kể cả cái đồng hồ báo thức."
- "chi_dai": ~ return "Nhà số 45, Phố Cũ. Bao cát giữa sân đung đưa trong gió sớm."
- "bien_kich": ~ return "Gác mái số 7, Phố Cũ. Con mèo Bí đang nằm trên bản thảo của bạn."
- "thanh_xin_nghi": ~ return "Nhà vườn Ven Đô. Ảnh bà ngoại trên tường cười tươi khỏe re."
- "chua_te_deadline": ~ return "Phòng gác trên Quán bida Cơ Bản. Cách công ty đúng 200 mét."
- "bac_bao_ve": ~ return "Chòi bảo vệ ở cổng công ty. Ấm trà, radio, ghế bố. {cho} ngủ bên cạnh."
- "sieu_nhan_hong": ~ return "Một căn nhà rất to ở cuối một con đường không tên. Bàn ăn 12 ghế."
- "cho": ~ return "Ổ cạnh chòi bảo vệ. Mùi bác. Mùi trà. Mùi an toàn."
}
~ return "Nhà của bạn."

// ============================================================
=== chung_mo_dau ===
# cutscene # bo_qua_duoc # am_thanh:cong_vien_lofi
_Thành Phố Ước Mơ, 30/9/2026, 23 giờ 47._ # man_hinh:chu_go_phim
_Tầng 2, tòa nhà ba tầng sơn tím. Cả tòa nhà tối om, trừ một căn phòng vách kính._
_Phòng giám đốc {cong_ty}. Một người đàn ông ngồi một mình. Cà vạt nới lỏng. Đồng hồ vàng to bản. Trên bàn là một cây gậy golf mini và một tờ giấy._
_Tờ giấy có logo Ngân hàng Tín Dụng Đen Đủi. Dòng chữ in đậm: "THÔNG BÁO NỢ QUÁ HẠN"._
_{giam_doc} đọc nó lần thứ mười. Chữ không thay đổi._
_Anh mở điện thoại. Group Zalo-lô "{cong_ty} - Toàn công ty"._ # am_thanh:zalo_lo
giam_doc: *(gõ chậm)* Mai các em đi làm nhé. 💪
_Gửi. Không ai "đã xem". Một phút. Năm phút. Vẫn không ai._
_{giam_doc} nhìn lên bức tường sảnh qua vách kính. Câu slogan in to: "Việc hôm nay cứ để ngày mai tính."_
giam_doc: *(một mình, giọng Bắc rất nhỏ)* Ngày mai… thì tính thế nào đây, anh Genta…
_Dưới cổng, đèn chòi bảo vệ đã tắt từ 9 giờ. Một con chó vàng ngóc đầu dậy, đánh hơi, rồi gầm gừ khe khẽ về phía cầu thang._
_Cộc. Cộc. Cộc._ # am_thanh:go_cua
_{giam_doc} giật mình. 23 giờ 59. Không ai còn ở công ty giờ này._
giam_doc: Ai… ai đấy?
_Cửa mở. Ngoài cửa là một người mặc bộ đồ siêu nhân màu hồng. Mũ kín đầu, kính đen. Áo choàng ngắn. Tay xách một chiếc vali._
_Người đó tạo dáng chữ V._
sieu_nhan_hong: Chào anh! Em muốn nổi tiếng. Anh nhận em hông?
giam_doc: …
_Chiếc vali đặt lên bàn. Hai cái khóa bật ra. "Tách. Tách."_ # am_thanh:mo_vali
_Chiếc vali mở ra._
_Ánh sáng từ bên trong làm {giam_doc} nheo mắt._ # man_hinh:trang
_1/10/2026. Thứ năm. 6:30 sáng._ # man_hinh:chu_go_phim
-> END

// ============================================================
// HƯỚNG DẪN NGÀY 1/10
// ============================================================

=== chung_0110_huong_dan_thuc_day ===
# ngay:1 # gio:06:30 # noi:nha # bat_buoc # goi_y:Bấm Tab để mở điện thoại # phim:Tab
_{chung_nha_cua_toi()}_
{ vai == "cho": -> ban_cho }
_Điện thoại rung. Một lần. Hai lần. Mười bốn lần._ # am_thanh:zalo_lo
_Group "{cong_ty} - Toàn công ty". Tin nhắn của sếp {giam_doc} lúc 23:47: "Mai các em đi làm nhé. 💪"_
_Bên dưới, lúc 0:12, sếp gửi thêm: "9 giờ sáng họp toàn công ty. Có tin vui. Anh không ép, nhưng ai cũng phải có mặt."_
{ vai == "giam_doc":
    _Bạn đọc lại tin nhắn của chính mình. Tối qua không phải là mơ. Chiếc vali vẫn đang nằm trong két ở phòng giám đốc._
- else:
    { vai == "sieu_nhan_hong":
        _Bạn nằm giữa căn phòng rộng, nhìn trần nhà. Tối qua, cái anh giám đốc đó đã nói "Ơ… vào đi em". Hôm nay bạn đi làm. Lần đầu tiên trong đời có nơi để đi làm._
    - else:
        _Tin vui? Ở {cong_ty}? Lần cuối công ty có tin vui là… năm 2015?_
    }
}
* [📱 Trả lời: "{chung_toi_hoa("giam_doc")} nhận ạ!"]
    { vai == "giam_doc":
        _Bạn tự trả lời tin nhắn của chính mình cho group bớt trống. Không ai biết. Bạn thấy hơi tủi._
    - else:
        ~ qh("giam_doc", 2)
    }
* [👍 Thả like.]
* [😴 Ngủ thêm 5 phút.]
    ~ nghi(5)
    _Năm phút thành mười hai phút. Bạn bật dậy._
- -> END

= ban_cho
_Bạn mở mắt. Mũi mở trước mắt. Mùi trà của bác đã bay ra từ chòi._
cho: *(vươn vai, ngáp to)* # phu_de: Sáng rồi. Hôm nay có mùi gì mới không ta?
_Hôm nay có mùi lạ. Rất lạ. Hồng hồng. Từ đêm qua._
-> END

=== chung_0110_huong_dan_an_sang ===
# ngay:1 # gio:06:45 # noi:nha # goi_y:Đi bằng W A S D (hoặc joystick). Thanh No đang giảm # phim:WASD
{ vai == "cho": -> ban_cho }
_Bụng bạn kêu một tiếng dài. Thanh No ở góc màn hình đang nhấp nháy._
{
- vai == "giam_doc" || vai == "con_ong_chau_cha" || vai == "idol_het_thoi" || vai == "sales" || vai == "quan_ly_idol":
    _Dưới sảnh chung cư có tiệm bánh mì đắt gấp đôi ngoài đường. Bạn biết vậy. Bạn vẫn mua._
- vai == "sieu_nhan_hong":
    _Trong tủ lạnh căn nhà to có 12 hộp sữa. Bạn uống một hộp, đứng, một mình. Rồi nghĩ: hay ra đường ăn bánh mì, đông người hơn._
- vai == "bac_bao_ve":
    _Ngoài cổng, xe bánh mì đi ngang. Bác vẫy tay._
- else:
    _Đầu hẻm có xe bánh mì. Mùi pa-tê nướng bay tới tận đây._
}
* [🥖 Mua bánh mì thịt (25.000đ).]
    ~ tien_cong(-25000)
    ~ an(30)
    _Bánh mì nóng giòn. Thanh No tăng. Một ngày bắt đầu đúng cách._
* [🍜 Ăn gói mì trong tủ (miễn phí).]
    ~ an(20)
    ~ cang_thang(2)
    _No thì no. Nhưng ăn mì gói buổi sáng làm người ta hơi buồn. Thanh Stress nhích nhẹ._
* [☕ Chỉ uống cà phê.]
    ~ uong(15)
    ~ nghi(15)
    _Tỉnh. Nhưng tới 10 giờ bụng sẽ đòi nợ._
- -> END

= ban_cho
_Bụng bạn kêu. Thanh No: thấp. Bác đang bóc một ổ bánh mì._
* [🥺 Ngồi ngay ngắn, mắt long lanh.]
    cho: Ẳng… # phu_de: Một miếng thôi bác.
    bac_bao_ve: …bla bla… **{cho}** …bla… **ĂN** … # phu_de: Ăn đi. Nửa ổ thôi, còn để bác ăn.
    ~ an(25)
    ~ qh("bac_bao_ve", 3)
* [🐾 Chạy ra cổng đánh hơi.]
    _Không có gì ngoài mùi xăng. Bạn quay lại thì bánh mì đã hết. Bài học đầu tiên trong ngày._
- -> END

=== chung_0110_huong_dan_ra_duong ===
# ngay:1 # gio:07:20 # noi:duong # goi_y:Bấm M để mở bản đồ, chọn đường đi # phim:M
{ vai == "bac_bao_ve" || vai == "cho":
    _Bạn không cần đi đâu cả. Bạn đã ở cổng công ty. Đây là đặc quyền duy nhất của nghề này._
    -> END
}
{ vai == "chua_te_deadline":
    _Từ phòng bạn tới công ty là 200 mét. Bạn còn 40 phút. Bạn nằm thêm 35 phút. Đó là chiến thuật._
    -> END
}
{ vai == "it":
    _Bạn ngủ ở phòng server. Bạn đã ở công ty. Bạn chỉ cần đi xuống một tầng. Bạn sẽ đi lúc 7 giờ 59._
    -> END
}
_Đại Lộ Kẹt Xe đúng như tên gọi. Bản đồ hiện hai đường: đường lớn (đông, chắc chắn) và một con hẻm tắt (nhanh, không chắc chắn)._
{ vai == "sieu_nhan_hong":
    _Chiếc xe hồng của bạn bị kẹt giữa dòng xe máy. Có người chỉ trỏ. Có người chụp ảnh. Có một bà cụ gõ cửa kính hỏi đường._
}
* [🗺️ Đi hẻm tắt.]
    { RANDOM(1, 3) <= 2:
        _Hẻm thông. Bạn chạy qua một chợ chồm hổm và một đám giỗ. Tới sớm 5 phút._
    - else:
        _Hẻm cụt. Bạn quay đầu. Bài học: bản đồ không phải lúc nào cũng đúng._
        ~ cang_thang(5)
    }
* [🛣️ Đi đường lớn.]
    _Chậm, nhưng chắc. Bạn nghe trọn một bài nhạc và hai cuộc cãi nhau ở đèn đỏ._
* [🚕 Gọi Grab.]
    ~ tien_cong(-40000)
    npc_grab: Em xin lỗi, xe em bể bánh.
    _Chuyến thứ hai thì tới. Đi Grab tốn tiền, nhưng lâu lâu cũng được một lần._
- -> END

=== chung_0110_huong_dan_cham_cong ===
# ngay:1 # gio:07:58 # noi:cong_cong_ty # goi_y:Bấm E để tương tác. Chấm công trước 8:00 # phim:E
{ vai == "cho": -> ban_cho }
{ vai == "bac_bao_ve": -> ban_bac }
_7 giờ 58. Cổng {cong_ty}. Máy chấm công nằm ngay sảnh, đèn xanh nhấp nháy như đang đếm ngược._
_Bác {bac_bao_ve} ngồi trong chòi, gật đầu với bạn. {cho} đứng dậy._
{ vai == "sieu_nhan_hong":
    cho: GRỪ… GÂU GÂU GÂU! *(lông dựng, nhe răng)*
    _Con chó ghét bạn ngay từ cái nhìn đầu tiên. Ghi chú bút bi ở lề hợp đồng của bạn ghi: "Có con chó ở cổng, nhớ cho em chọc nó."_
- else:
    cho: Gâu! *(vẫy đuôi)*
}
{ vai == "hr":
    _Bạn đứng vào vị trí quen thuộc: cạnh máy chấm công, tách trà trên tay, nụ cười trên môi. Hôm nay bạn sẽ thấy ai đến muộn._
}
* [⏱️ Bấm chấm công.]
    _"Tít." 7:59. Đúng giờ. Máy chấm công không khen. Nhưng nó cũng không ghi tên bạn vào danh sách đỏ._
* [🐕 Xoa đầu {cho} trước đã.]
    { vai == "sieu_nhan_hong":
        cho: GÂU! *(đớp hụt găng tay của bạn)*
        _Bạn rụt tay lại kịp. Lần sau nhớ: có những tình bạn phải bắt đầu bằng xúc xích._
    - else:
        _{cho} nheo mắt, dụi đầu vào tay bạn. Rồi bạn nhìn đồng hồ: 8:01._
        ~ qh("cho", 5)
        { vai != "hr":
            hr: *(mỉm cười, ghi gì đó)* Một phút thôi mà. {chung_xung_hoa("hr")} chỉ ghi nhận thôi.
        }
    }
- -> END

= ban_cho
_Buổi sáng ở cổng. Người đi vào từng đợt. Mỗi người một mùi: cà phê, bánh mì, nước hoa, mồ hôi chạy trễ._
_Rồi một mùi chưa từng có. Hồng. Nhựa. Bánh chuối chiên. Nó đến từ một chiếc xe màu hồng vừa đỗ chéo ngay cổng._
* [😤 Sủa.]
    cho: GÂU GÂU GÂU! # phu_de: Mày là ai? Mày mùi gì vậy?
* [👃 Lại gần đánh hơi.]
    cho: *(hít hít)* … # phu_de: Mùi tiền. Mùi một mình. Mùi… hồng.
* [🐾 Nằm xuống giả vờ ngủ.]
    cho: … # phu_de: Chuyện người, người lo.
- -> END

= ban_bac
_6 giờ 30 bạn đã mở cổng. Giờ là 7 giờ 58, lúc người ta chạy ào vào như lũ. Bạn ngồi trong chòi, rót trà, nhìn từng người qua._
_Một chiếc xe màu hồng đỗ chéo ngay giữa cổng. Một người mặc đồ siêu nhân bước ra, giơ tay chào bạn, rồi ngồi xổm xuống sủa con {cho}._
* [🍵 "Cậu ơi, đỗ xe cho thẳng."]
    sieu_nhan_hong: Dạ dạ! Con xin lỗi bác! *(vẫn không dời xe)*
* [🐕 "{cho}, vào ổ."]
    _{cho} lườm bộ đồ hồng, rồi lùi vào ổ, vẫn gầm gừ. Nó nghe lời bạn. Nó không bao giờ nghe lời ai khác._
    ~ qh("cho", 3)
* [😶 Uống trà. Bác không thấy gì đâu.]
    _Bạn uống trà. Bạn thấy hết. Như mọi khi._
- -> END

=== chung_0110_huong_dan_gioi_thieu ===
# ngay:1 # gio:08:10 # noi:van_phong # goi_y:Chọn câu trả lời. Mỗi câu thay đổi quan hệ với người đó
{ vai == "cho": -> ban_cho }
{ vai == "chi_dai":
    _Bạn đứng giữa văn phòng, vỗ tay hai cái. Cả tầng im lặng._
    chi_dai: Hôm nay có nhân viên mới. Đứa nào bắt nạt nó, chỉ mặt chị.
    _Người mới đứng sau lưng bạn, cười rất tươi: {ran_doc}. Bạn dẫn {ran_doc} đi một vòng. {ran_doc} nhớ tên tất cả mọi người ngay lần đầu. Hơi nhanh quá._
    -> END
}
{ vai == "ran_doc":
    chi_dai: Nhân viên mới hả? Đi theo chị. Chị giới thiệu một vòng. Ai bắt nạt em, chỉ mặt chị.
- else:
    chi_dai: Cả nhà! Họp toàn công ty lúc 9 giờ. Trước đó chị dẫn bạn mới đi chào một vòng. Ai đang ăn sáng thì nuốt lẹ.
    _Người mới đi sau lưng {chi_dai}, cười rất tươi. Tên là {ran_doc}. Tới bàn bạn, {chi_dai} dừng lại._
}
{ vai == "ran_doc":
    _{chi_dai} dẫn bạn tới bàn đầu tiên. Người ngồi đó là {thuc_tap_sinh}, đứng bật dậy cúi chào 90 độ._
    thuc_tap_sinh: Dạ em chào anh ạ! Em là {thuc_tap_sinh}, thực tập sinh ạ!
- else:
    ran_doc: Chào {chung_goi("ran_doc")}! {chung_xung_hoa("ran_doc")} là {ran_doc}, truyền thông nội bộ. Sinh nhật {chung_goi("ran_doc")} ngày mấy? {chung_xung_hoa("ran_doc")} ghi lại, sau này tổ chức.
}
* [😇 Bắt tay thân thiện.]
    { vai == "ran_doc":
        ~ qh("thuc_tap_sinh", 5)
    - else:
        ~ qh("ran_doc", 5)
    }
    _Cái bắt tay ấm áp. Một quan hệ mới bắt đầu. Ở công ty này, quan hệ là tài sản. Và là rủi ro._
* [😶 Gật đầu, quay lại làm việc.]
    _Lịch sự, đủ dùng. Không thân, không ghét. Bạn đã chọn trung lập._
* [💬 Hỏi: "Công ty có gì vui hông?"]
    chi_dai: Vui lắm. Lương về trễ, sếp nhắn tin 11 giờ đêm, máy in kẹt mỗi ngày. Ngồi xuống chị kể cho nghe.
    ~ qh("chi_dai", 3)
- -> END

= ban_cho
_Bạn đi theo bước chân người. Ai cũng xoa đầu bạn một cái. Hôm nay có một người mới, mùi sổ tay và mực bút bi. Người đó xoa đầu bạn hơi lâu._
-> END

=== chung_0110_huong_dan_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # goi_y:Thanh "Người theo dõi" của Siêu Nhân Hồng đã xuất hiện. Mục tiêu: 1.000.000 trước 31/10
{ vai == "cho": -> ban_cho }
_Phòng họp "Sáng Tạo" chật kín. Trên bàn là một xấp hợp đồng dày cộp: 52 trang. Đầu bàn, Siêu Nhân Hồng tạo dáng._
{ vai != "giam_doc":
    giam_doc: Các em! Hôm nay là một ngày lịch sử của {cong_ty}! Xin giới thiệu đối tác chiến lược: Siêu Nhân Hồng!
}
{ vai != "sieu_nhan_hong":
    sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
}
_Bút ký lướt trên trang cuối. Năm tỷ đồng về tài khoản. Cả phòng reo hò. Ai đó gọi trà sữa cho cả công ty._ # am_thanh:ting_ting
_Trên điện thoại của bạn hiện một thanh mới: 📈 Người theo dõi Siêu Nhân Hồng: {chung_so(nguoi_theo_doi)} / 1.000.000._
_Hạn chót: Đêm Hồng Halloween, 31/10. Đạt: công ty sống. Không đạt: hoàn gấp đôi. Phá sản._
{ vai != "ke_toan":
    _Ở cuối bàn, {ke_toan} lật tới một trang gần cuối, nhíu mày, đẩy kính lên. Không ai để ý._
}
-> END

= ban_cho
_Phòng họp tầng 2 đầy người. Bạn nằm dưới bàn. Trên đầu bạn có tiếng bút ký, tiếng vỗ tay, và một mùi hồng nồng nặc._
_Rồi cả phòng reo hò. Bạn sủa theo cho vui. Hôm nay mọi người vui. Có lẽ tối nay có xúc xích._
-> END

=== chung_0110_huong_dan_viec_dau_tien ===
# ngay:1 # gio:10:00 # noi:van_phong # goi_y:Làm việc theo nghề của bạn để có tiền, đồ ăn và đẩy thanh Người theo dõi
_10 giờ. Việc đầu tiên của ngày đã tới. Mỗi người một việc, đúng nghề của mình. Làm tốt thì có tiền, có đồ ăn, và Siêu Nhân Hồng có thêm người theo dõi._
_Làm dở thì… cũng có người theo dõi. Nhưng là theo kiểu khác._
-> END

=== chung_0110_huong_dan_nghi_trua ===
# ngay:1 # gio:12:00 # noi:quan_com_tam # goi_y:Chọn chỗ ngồi. Ngồi gần ai thì nghe chuyện của người đó
{ vai == "cho": -> ban_cho }
_Quán cơm tấm vỉa hè. Cô Năm múc cơm, tai nghe hết các bàn. Có ba bàn còn chỗ._
npc_co_nam: Thêm chả hông con?
* [🍽️ Ngồi bàn đông nhất, ồn nhất.]
    _Bạn nghe được tin đồn đầu tiên: "Nghe nói hợp đồng có một trang mà chỉ một người đọc." Ai đọc? Không ai biết._
    ~ tien_cong(-45000)
    ~ an(55)
* [🍽️ Ngồi với người đang ăn một mình.]
    _Người đó ngạc nhiên, rồi cười. Hai người ăn trong im lặng dễ chịu. Không phải bữa trưa nào cũng cần tin đồn._
    ~ tien_cong(-45000)
    ~ an(55)
    ~ cang_thang(-5)
* [🥡 Mua mang về bàn ăn.]
    _Bạn ăn một mình trước màn hình. Không ai làm phiền. Cũng không ai kể gì._
    ~ tien_cong(-45000)
    ~ an(55)
- -> END

= ban_cho
_Giờ trưa. Cả công ty kéo ra quán cơm tấm. Bạn đi theo, ngồi dưới gầm bàn đông người nhất. Ở đây đồ ăn hay rơi, và chuyện cũng hay rơi._
-> END

=== chung_0110_huong_dan_het_ca_phe ===
# ngay:1 # gio:15:00 # noi:pantry # goi_y:Việc chung ở công ty ai cũng làm được: sửa máy, gỡ máy in, dọn tủ lạnh…
_15 giờ. Hôm nay là Ngày Cà phê Quốc tế. Và máy pha cà phê ở pantry hỏng. Đúng hôm nay._
_Cả tầng đứng quanh cái máy như đứng quanh giường bệnh. Ai đó dán giấy: "Đã mất. Hưởng thọ 6 năm."_
{ vai == "cho": -> ban_cho }
* [🔧 Thử sửa.]
    { RANDOM(1, 2) == 1:
        _Bạn gõ ba cái vào hông máy. Máy rùng mình, chạy lại. Cả tầng vỗ tay như vừa có lương._
        ~ nhan(ca_phe)
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 1
    - else:
        _Máy phun hơi vào mặt bạn. Bạn lùi lại, tóc dựng như vừa đi qua máy sấy._
        ~ cang_thang(3)
    }
* [💬 Gọi {it}.]
    { vai == "it":
        _Mọi người quay sang nhìn bạn. Bạn chính là người được gọi. Bạn tắt đi bật lại. Nó chạy. Bạn không hiểu vì sao lần nào cũng được._
    - else:
        it: Restart chưa?
        _Rút điện, cắm lại. Máy chạy. Thế giới có những quy luật không cần hiểu._
    }
* [☕ Ra quán đầu ngõ mua cà phê.]
    ~ tien_cong(-35000)
    ~ nghi(25)
- -> END

= ban_cho
_Bạn liếm một vũng cà phê dưới sàn. Đắng. Bạn hắt hơi. Mọi người cười. Ít ra ai đó vui._
-> END

=== chung_0110_huong_dan_tan_lam ===
# ngay:1 # gio:17:30 # goi_y:Giờ tự do! Đi ăn, đi chơi, làm thêm, hoặc về ngủ. Coi chừng thanh Năng lượng
{ vai == "cho": -> ban_cho }
_17 giờ 30. Tan làm. Mọi người ùa ra cổng như tan trường._
_Thành Phố Ước Mơ buổi tối có nhiều nơi để đi: Quán Ốc Đêm, karaoke Hát Cho Nhau Nghe, quán cà phê Sống Ảo, phòng gym Cơ Bắp Ảo, Công viên Hồ Cá Mập… hoặc về nhà ngủ._
_Thanh Năng lượng của bạn: còn {nang_luong}. Đi chơi thì vui, nhưng mai vẫn phải đi làm._
{ vai == "giam_doc":
    _Riêng bạn còn một việc: tối nay 22 giờ, nhắn group. Truyền thống mà._
}
-> END

= ban_cho
_Người về hết. Bác đóng cổng một nửa. Buổi tối là của bạn: đi tuần, đánh hơi, và canh cái kho dưới gầm cầu thang._
-> END

=== chung_0110_huong_dan_tin_nhan_22h ===
# ngay:1 # gio:22:00 # noi:dien_thoai # goi_y:Tin nhắn của sếp sau 22:00 không bắt buộc trả lời (nhưng nên trả lời)
{ vai == "cho": -> ban_cho }
{ vai == "giam_doc":
    _22 giờ. Bạn mở group, gõ: "Hôm nay là một ngày lịch sử. Cảm ơn các em. Mai 8h họp nhanh nhé." Gửi._
    _Ba giây sau: {thanh_ninh} trả lời "Dạ anh nói chuẩn quá anh ơi!!!". Những người khác "đã xem"._
    _Bạn tắt điện thoại, nhìn trần nhà biệt thự. Hôm nay, lần đầu tiên sau nhiều tháng, bạn ngủ được._
    -> END
}
_Ting! Group công ty:_ # am_thanh:zalo_lo
giam_doc: Hôm nay là một ngày lịch sử. Cảm ơn các em. Mai 8h họp nhanh nhé. Anh không ép. 💪🩷
_Ba giây sau, {thanh_ninh} trả lời: "Dạ anh nói chuẩn quá anh ơi!!!"_
{ vai == "thanh_ninh":
    _…Khoan, đó là bạn. Ngón tay bạn đã gõ trước khi não kịp nghĩ. Phản xạ nghề nghiệp._
    -> END
}
* [💬 "Mai {chung_toi("giam_doc")} có mặt ạ."]
    ~ qh("giam_doc", 3)
* [👍 Thả tim.]
    ~ qh("giam_doc", 1)
* [😴 Để mai đọc.]
    ~ nghi(5)
    _Bạn úp điện thoại xuống. Nội quy số 7: tin nhắn sau 22:00 không bắt buộc trả lời. Bạn chọn tin vào nội quy._
- -> END

= ban_cho
_22 giờ. Bác đã ngủ. Điện thoại của bác trên bàn sáng lên, rung rung. Bạn sủa nó một tiếng. Nó im._
-> END

=== chung_0110_huong_dan_di_ngu ===
# ngay:1 # gio:23:00 # noi:nha # goi_y:Ngủ để sang ngày mới. Game tự lưu # am_thanh:luu_game
{ vai == "cho": -> ban_cho }
_{chung_nha_cua_toi()}_
_23 giờ. Ngày đầu tiên của tháng 10 kết thúc. Còn 30 ngày nữa tới Đêm Hồng._
{ vai == "sieu_nhan_hong":
    _Bạn tháo mũ, đặt lên cái ghế thứ hai của bàn ăn 12 ghế. Ít ra hôm nay cái ghế đó có thứ để giữ._
- else:
    _Bạn nhắm mắt. Ở đâu đó trong thành phố, một người mặc đồ hồng đang đẩy giùm ai đó một chiếc xe chết máy._
}
_Đang lưu…_
-> END

= ban_cho
_Bạn cuộn tròn trong ổ, mũi gác lên đuôi. Bác ngáy khe khẽ trong chòi. Ngày đầu tiên của tháng có mùi hồng. Bạn không thích nó._
cho: Hừ. # phu_de: Mai tao sẽ xử cái bộ đồ hồng đó.
-> END
