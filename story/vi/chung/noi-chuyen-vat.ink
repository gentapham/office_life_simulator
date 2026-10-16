// ============================================================
// NÓI CHUYỆN VẶT (chung_nc_<mã>)
//
// Mỗi cảnh in ra MỘT câu nói vặt của nhân vật đó với người chơi, theo:
//   - giờ (sáng < 11, trưa 11–13, chiều 14–16, tối ≥ 17),
//   - ngày có sự kiện (1, 4, 9, 12, 15, 16, 17–18, 20, 22, 23, 27, 29, 30),
//   - stress của người chơi, số người theo dõi Siêu Nhân Hồng,
//   - người chơi là ai (vài câu riêng cho các cặp quan hệ đặc biệt).
// Khi người chơi là Tuất (vai == "cho"), người nói chỉ để lộ từ khóa
// (…bla bla… **TỪ KHÓA** …) kèm thẻ # phu_de: là câu đầy đủ.
// Nếu lỡ gọi đúng cảnh của chính nhân vật người chơi thì chuyển sang
// chung_nc_tu_noi (người chơi tự lẩm bẩm).
// Thẻ: # npc:<mã> # noi_chuyen_vat
// ============================================================

=== chung_nc_tu_noi ===
# noi_chuyen_vat
{ vai == "cho":
    cho: {~Gâu.|Hừ.|Gâu? *(nhìn cái đuôi của chính mình)*} # phu_de: {~Đói.|Buồn ngủ.|Cái đuôi này của ai vậy?}
- else:
    _{~Bạn lẩm bẩm một mình: "Cố lên. Còn {31 - ngay} ngày."|Bạn tự nhủ: "Việc hôm nay cứ để ngày mai tính." Rồi thấy hơi tội lỗi.|Bạn nhìn vào gương thang máy, gật đầu với chính mình. Người trong gương cũng mệt y chang.}_
}
-> END

// ------------------------------------------------------------
=== chung_nc_giam_doc ===
# npc:giam_doc # noi_chuyen_vat
~ temp g = chung_goi("giam_doc")
~ temp G = chung_goi_hoa("giam_doc")
~ temp r = RANDOM(1, 4)
{ vai == "giam_doc": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "bac_bao_ve" && r <= 2:
    { shuffle:
    - giam_doc: Bác {bac_bao_ve}, bác uống trà chưa ạ? Em… em chỉ ghé chào bác thôi.
    - giam_doc: Bác còn nhớ hồi mình có mỗi cái phòng 20 mét vuông không bác? Em thì nhớ mãi.
    }
- vai == "con_ong_chau_cha" && r <= 2:
    { shuffle:
    - giam_doc: {con_ong_chau_cha}, cháu đi làm đúng giờ giúp chú một hôm thôi. Một hôm thôi, chú không ép.
    - giam_doc: Cháu là bộ mặt của gia đình mình ở công ty đấy, hiểu chưa? Bỏ kính râm ra.
    }
- vai == "thanh_ninh" && r <= 2:
    giam_doc: {thanh_ninh} ơi, lịch chiều nay của anh thế nào? Mà thôi, em sắp gì anh đi nấy.
- r == 1 && ngay == 1:
    giam_doc: Năm tỷ! {G} thấy chưa? Anh đã bảo rồi, văn hóa doanh nghiệp tốt thì tiền tự tìm tới!
- r == 1 && (ngay == 10 || ngay == 11 || ngay == 12):
    { shuffle:
    - giam_doc: Lương… lương thì ngân hàng đang kiểm tra giao dịch lớn. Lớn quá nên kiểm lâu. Tốt mà.
    - giam_doc: {G} đừng lo lương. Lo cái mindset trước. Mindset có rồi thì lương… sẽ về.
    }
- r == 1 && ngay == 13:
    giam_doc: Em thấy giải "Doanh nhân của năm" anh treo trong phòng chưa? Tập đoàn BTT Global trao đấy. Quốc tế đấy.
- r == 1 && ngay == 15:
    giam_doc: Kẹt thang máy với chị {chi_dai} 40 phút, anh hiểu ra nhiều điều. Chủ yếu là anh sợ chị ấy.
- r == 1 && (ngay == 17 || ngay == 18):
    giam_doc: Biển đẹp nhỉ? Tối nay anh có thể hứa vài điều. Đừng ai quay phim nhé. Anh nói thật đấy.
- r == 1 && ngay == 20:
    giam_doc: Mười sáu năm. Mười sáu năm rồi đấy {g} ạ. Hồi đó anh hai mươi mốt tuổi, chưa có cái cà vạt nào.
- r == 1 && ngay == 22:
    giam_doc: *(thì thầm)* Đoàn thuế hỏi gì thì cứ cười. Cười cho có văn hóa. Anh không ép.
- r == 1 && ngay >= 27 && ngay <= 30:
    { shuffle:
    - giam_doc: Bên LL họ có tòa nhà 20 tầng. Mình có… tinh thần. Tinh thần thì không thế chấp được. À ý anh là… thôi.
    - giam_doc: Tuần cuối rồi. {G} cố lên giúp anh. Anh không ép. Mà anh xin đấy.
    }
- r == 2 && stress >= 70:
    giam_doc: Trông em căng quá. Đọc sách đi. Anh có cuốn bìa xanh, quên tên rồi, nhưng hay lắm.
- r == 2 && nguoi_theo_doi >= 800000:
    giam_doc: Tám trăm nghìn rồi! {G} biết không, đêm qua anh ngủ được bốn tiếng. Bốn tiếng liền!
- r == 2 && nguoi_theo_doi < 200000 && ngay >= 14:
    giam_doc: Số liệu hơi… khiêm tốn. Nhưng mình là gia đình. Gia đình thì cùng nhau… tăng ca.
- r == 4:
    { shuffle:
    - giam_doc: Anh không ép, tùy em. Nhưng sáng mai anh cần.
    - giam_doc: {G} check lại cái mindset giúp anh nhé. Cái mindset ấy, nó đang hơi lệch.
    - giam_doc: Công ty là gia đình. Mà gia đình thì không ai hỏi lương, đúng không?
    - giam_doc: Hồi khởi nghiệp, anh ăn mì gói ba tháng. Nên giờ anh hiểu các em lắm. Mì nào ngon nhỉ?
    - giam_doc: Cái cà vạt hồng này là sacrifice đấy. Anh hy sinh vì chiến dịch.
    }
- gio < 11:
    { shuffle:
    - giam_doc: Chào buổi sáng! Hôm nay em đã có energy chưa? Chưa thì xuống pantry nạp đi.
    - giam_doc: Anh vừa đánh một cú golf trong phòng. Trúng cái bình hoa. Không ai thấy đâu nhỉ?
    - giam_doc: Sáng nay anh nói chuyện điện thoại với ngân hàng. Chuyện thường thôi. Đừng nghĩ nhiều.
    - giam_doc: 9 giờ 30 là giờ đến của lãnh đạo. Không phải đi muộn. Là đến vừa kịp tầm nhìn.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - giam_doc: Trưa nay anh ăn nhà hàng với đối tác. Đối tác là… cuốn sổ kế hoạch của anh.
    - giam_doc: Em ăn trưa chưa? Ăn đi rồi chiều làm cho có năng suất. Năng suất là KPI của dạ dày.
    - giam_doc: Ngủ trưa 15 phút thôi nhé. Ở Nhật Bản người ta ngủ trưa 7 phút mà vẫn làm ra ô tô.
    }
- gio >= 17:
    { shuffle:
    - giam_doc: Về sớm thế? À, đúng giờ à. Ừ, đúng giờ cũng là một kiểu… sớm.
    - giam_doc: Tối nay 22 giờ anh nhắn group nhé. Không bắt buộc trả lời. Nhưng anh sẽ thấy ai đọc.
    - giam_doc: Anh ra sân golf mini đây. Một mình thôi. Doanh nhân là một nghề cô đơn.
    - giam_doc: Em có thấy dạo này bác {bac_bao_ve} hay nhìn anh không? Hay anh tưởng tượng nhỉ?
    }
- else:
    { shuffle:
    - giam_doc: Chiều rồi mà em vẫn tươi thế, tốt! Đấy là văn hóa {cong_ty}.
    - giam_doc: Anh vừa nghĩ ra một ý tưởng. Mai họp. À, nhờ {truong_phong} xếp lịch giúp anh.
    - giam_doc: Em thấy cái logo bảy màu đẹp không? Anh chọn bản đầu tiên. Bản đầu bao giờ cũng có hồn.
    - giam_doc: Đừng gọi anh là sếp. Gọi là anh. Mà thôi, cứ gọi sếp đi, nghe cũng hay.
    }
}
-> END
= ban_cho
{ shuffle:
- giam_doc: …bla bla… **{cho}** …bla… **PHÒNG GIÁM ĐỐC** …bla bla… **KHÔNG** … # phu_de: {cho}, không được vào phòng giám đốc. Nội quy số 8 đấy.
- giam_doc: …bla… **NGOAN** …bla bla… **LINH VẬT** … # phu_de: Ngoan nào. Mày là linh vật của công ty đấy, biết không?
- giam_doc: …bla bla… **HỒNG** …bla… **CÀ VẠT** …bla… # phu_de: Đừng nhìn cái cà vạt hồng của tao như thế.
- giam_doc: …bla… **ĂN** …bla bla… **LƯƠNG** …bla… # phu_de: Mày ăn xúc xích đúng ngày, tao còn chưa nhận lương ba tháng.
}
-> END

// ------------------------------------------------------------
=== chung_nc_truong_phong ===
# npc:truong_phong # noi_chuyen_vat
~ temp g = chung_goi("truong_phong")
~ temp G = chung_goi_hoa("truong_phong")
~ temp x = chung_xung("truong_phong")
~ temp X = chung_xung_hoa("truong_phong")
~ temp r = RANDOM(1, 4)
{ vai == "truong_phong": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "con_ong_chau_cha" && r <= 2:
    { shuffle:
    - truong_phong: Ồ, {con_ong_chau_cha} đến rồi à? Mới 10 giờ thôi mà. Sớm thế. Tớ take note lại.
    - truong_phong: Ghế phó giám đốc ấy mà… à không, tớ chỉ hỏi cậu có thích ghế xoay không thôi.
    }
- vai == "chua_te_deadline" && r <= 2:
    { shuffle:
    - truong_phong: {chua_te_deadline}, bảng tiến độ của cậu có đúng một thanh màu hồng. Mình cần họp về thanh đấy.
    - truong_phong: Đừng "ok mom" với tớ. Tớ bằng tuổi cậu.
    }
- vai == "editor" && r <= 2:
    truong_phong: {editor} à, cái video hôm trước… à, cậu gửi tớ bản export cuối nhé. Tớ cần… xem lại thôi.
- r == 1 && ngay == 15:
    truong_phong: Mất điện không có nghĩa là không họp được. Tớ có nến. Tớ có cả bút lông dạ quang.
- r == 1 && (ngay == 17 || ngay == 18):
    truong_phong: Biển đẹp đấy. Nhưng mình sync nhanh tiến độ 5 phút trước khi xuống tắm nhé.
- r == 1 && ngay == 29:
    truong_phong: Wifi sập thì mình họp trực tiếp. Thực ra tớ thích thế hơn. Nhìn được mắt nhau.
- r == 1 && ngay == 30:
    truong_phong: Hôm nay họp đánh giá. Tớ đã chuẩn bị 41 slide. Slide 38 có tên {g} đấy. Tốt hay xấu thì… họp sẽ rõ.
- r == 1 && ngay >= 26:
    truong_phong: Đơn đề bạt phó giám đốc tớ sửa đến lần 15 rồi. Lần 15 là con số đẹp, đúng không?
- r == 2 && stress >= 70:
    truong_phong: Trông {g} mệt thế. Hay mình họp một buổi về sức khỏe tinh thần nhé? 2 tiếng thôi.
- r == 2 && nguoi_theo_doi >= 500000:
    truong_phong: Số người theo dõi tăng tốt. Đây là kết quả của… các cuộc họp. Tớ tin thế.
- r == 4:
    { shuffle:
    - truong_phong: Tớ đã đặt lịch họp để lên lịch họp tuần sau.
    - truong_phong: Biên bản họp hôm qua dài 14 trang. Tớ tóm tắt lại còn 13.
    - truong_phong: Cậu nói "cái chén" nhưng tớ vẫn nghĩ đây là "cái bát". Mình họp về chuyện này sau nhé.
    - truong_phong: Họp nhanh 5 phút thôi.
    - truong_phong: Cái này mình take note lại, họp tiếp sau nhé.
    - truong_phong: {G} có lịch trống lúc nào không? Tớ cần 15 phút. Có thể 2 tiếng.
    - truong_phong: Tớ đang lên kế hoạch cho cuộc họp về việc giảm số cuộc họp.
    - truong_phong: Phòng "Sáng Tạo" kín lịch đến thứ sáu rồi. Toàn lịch của tớ.
    - truong_phong: {X} vừa mua bìa sổ họp màu hồng. Tuân thủ nội quy là một kỹ năng.
    }
- gio < 11:
    { shuffle:
    - truong_phong: Chào buổi sáng. Tớ ở đây từ 7 rưỡi. Phòng họp cũng thế.
    - truong_phong: Sáng nay có 3 cuộc họp. Cuộc thứ 3 là để tổng kết 2 cuộc đầu.
    - truong_phong: {G} có ăn sáng chưa? Ăn đi rồi lên họp. À không, mang lên họp ăn cũng được.
    - truong_phong: Thứ hai nào cũng mặc áo cam. Tớ mặc từ chủ nhật cho chắc.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - truong_phong: Tớ ăn cơm tại bàn. Vừa ăn vừa họp với chính mình. Hiệu quả lắm.
    - truong_phong: Cái bát cơm này… à, "cái chén" theo cách các cậu nói. Tớ vẫn chưa quen.
    - truong_phong: Nghỉ trưa là 90 phút. Tớ đã chia thành 6 block 15 phút.
    }
- gio >= 17:
    { shuffle:
    - truong_phong: Về à? Tớ còn ở lại soạn slide. Slide không tự soạn được.
    - truong_phong: Mai 7 rưỡi nhé. Họp nhanh thôi. Nhanh thật đấy.
    - truong_phong: Tối nay tớ họp gia đình. Gia đình tớ là cái bảng trắng ở phòng khách.
    }
- else:
    { shuffle:
    - truong_phong: Chiều nay cậu có rảnh không? Không cần trả lời, tớ đã đặt lịch rồi.
    - truong_phong: Tớ không biết dùng phần mềm dựng phim. Nhưng tớ biết dùng lịch. Lịch quan trọng hơn.
    - truong_phong: Ơ, sao {g} gọi cái này là "cái ly"? Đây là "cái cốc" chứ.
    }
}
-> END
= ban_cho
{ shuffle:
- truong_phong: …bla bla… **HỌP** …bla… **5 PHÚT** … # phu_de: {cho}, ra ngoài đi, bọn tớ họp 5 phút thôi.
- truong_phong: …bla… **{cho}** …bla bla… **NGỒI** …bla… # phu_de: {cho} ngồi yên thì được dự họp. Cậu là thành viên thứ 12.
- truong_phong: …bla bla bla… **GHI CHÚ** … # phu_de: Chó cũng cần biết ghi chú. Đùa thôi.
}
-> END

// ------------------------------------------------------------
=== chung_nc_thanh_ninh ===
# npc:thanh_ninh # noi_chuyen_vat
~ temp g = chung_goi("thanh_ninh")
~ temp G = chung_goi_hoa("thanh_ninh")
~ temp x = chung_xung("thanh_ninh")
~ temp X = chung_xung_hoa("thanh_ninh")
~ temp r = RANDOM(1, 4)
{ vai == "thanh_ninh": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "giam_doc":
    { shuffle:
    - thanh_ninh: Anh nói chuẩn quá anh ơi! À em chưa nghe anh nói gì, nhưng chắc chắn là chuẩn!
    - thanh_ninh: Dạ anh, em pha trà cho anh rồi, 72 độ, đúng như anh thích ạ.
    - thanh_ninh: Dạ cà vạt hồng hôm nay của anh có tầm nhìn quá anh ơi!
    - thanh_ninh: Dạ lịch chiều nay của anh trống, em giữ cho anh suy ngẫm chiến lược ạ.
    }
- vai == "chi_dai" && r <= 2:
    thanh_ninh: *(cười gượng)* Dạ chị {chi_dai}… chị ăn cơm chưa ạ? Em… em hỏi thăm thôi.
- vai == "ran_doc" && r <= 2:
    thanh_ninh: Hôm qua sếp khen ông hả? Ừ, sếp khen ai cũng vậy đó. Khen tui thì khác.
- r == 1 && ngay == 13:
    thanh_ninh: Hôm nay ngày Doanh nhân, {x} viết bài phát biểu khen sếp 15 phút. Mới viết tới phút thứ 9 mà đã xúc động rồi.
- r == 1 && ngay == 20:
    thanh_ninh: Ngày 20/10 năm nào {x} cũng được tặng hoa. Năm nay {x} chuẩn bị sẵn bình rồi.
- r == 1 && ngay >= 25 && ngay <= 29:
    { shuffle:
    - thanh_ninh: *(giật mình, úp điện thoại)* Ủa {g}! Không có gì, email… email công việc thôi.
    - thanh_ninh: Màu xanh lá chuối đẹp hông? Hỏi vậy thôi, không có ý gì.
    }
- r == 2 && stress >= 70:
    thanh_ninh: {G} stress hả? Học {x} nè: cứ cười với sếp. Cười nhiều rồi mặt tự cười luôn.
- r == 2 && nguoi_theo_doi >= 800000:
    thanh_ninh: Sếp nói nhờ có tầm nhìn của sếp mà tụi mình được tám trăm nghìn đó. Chuẩn quá!
- r == 4:
    { shuffle:
    - thanh_ninh: {X} vừa học được 12 cách nói "dạ". Cách thứ 12 dùng khi sếp sai.
    - thanh_ninh: Nụ cười này {x} để dành cho sếp. Với {g} thì {x} cười… cỡ vừa.
    - thanh_ninh: {G} có biết sếp thích trà gì hông? {x} biết. {x} không nói.
    - thanh_ninh: Chuẩn quá! À, {x} nói với cái điện thoại, không phải với {g}.
    - thanh_ninh: Anh nói chuẩn quá anh ơi! À, {x} tập trước thôi.
    - thanh_ninh: Chị nói em nghe nè, ở công ty này phải biết ai là người quan trọng.
    - thanh_ninh: Sếp hắt hơi hồi sáng. Hắt hơi có tâm lắm.
    - thanh_ninh: {G} có thấy cái bình giữ nhiệt của sếp đâu hông? Không có nó {x} mất phương hướng.
    - thanh_ninh: Nơ hồng của {x} to nhất công ty. Trừ Siêu Nhân Hồng. Mà ảnh là cả bộ đồ thì không tính.
    }
- gio < 11:
    { shuffle:
    - thanh_ninh: {X} tới lúc 7 giờ 45, trước sếp. Lúc nào cũng trước sếp.
    - thanh_ninh: Sếp chưa tới hả? Vậy mình nói chuyện bình thường được. Mệt ghê.
    - thanh_ninh: Sáng nay {x} đặt sân golf cho sếp rồi. Sân mini thôi, mà sếp vui.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - thanh_ninh: {X} đặt cơm cho sếp xong mới đi ăn. Thường là hết cơm.
    - thanh_ninh: Tiệm nail Lung Linh giờ trưa vắng lắm, đi hông? Đi làm móng rồi về khen sếp tiếp.
    }
- gio >= 17:
    { shuffle:
    - thanh_ninh: Sếp chưa về thì {x} chưa về. Nguyên tắc.
    - thanh_ninh: Tối nay {x} có hẹn… hẹn làm nail. Ở bên… Ven Đô. Tiệm mới.
    - thanh_ninh: 22 giờ sếp nhắn group, {x} trả lời trong 0,3 giây. Kỷ lục cá nhân là 0,2.
    }
- else:
    { shuffle:
    - thanh_ninh: Chiều nay sếp họp, {x} ngồi ngoài cửa canh. Canh cho có không khí.
    - thanh_ninh: {G} biết mật khẩu email của sếp hông? Không biết hả? Tốt. Đừng biết.
    }
}
-> END
= ban_cho
{ shuffle:
- thanh_ninh: …bla bla… **{cho}** …bla… **SẾP** …bla bla… **ĐI RA** … # phu_de: {cho}, sếp sắp tới, đi ra chỗ khác giùm chị.
- thanh_ninh: …bla… **NGOAN** …bla bla… **NƠ HỒNG** … # phu_de: Ngoan nè, chị cho mượn nơ hồng chụp hình với sếp nha.
- thanh_ninh: …bla bla bla… **KHÔNG** … # phu_de: Đừng đánh hơi cái túi của chị. Không có gì đâu.
}
-> END

// ------------------------------------------------------------
=== chung_nc_hong_hot ===
# npc:hong_hot # noi_chuyen_vat
~ temp g = chung_goi("hong_hot")
~ temp G = chung_goi_hoa("hong_hot")
~ temp x = chung_xung("hong_hot")
~ temp X = chung_xung_hoa("hong_hot")
~ temp r = RANDOM(1, 4)
{ vai == "hong_hot": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "designer" && r <= 2:
    { shuffle:
    - hong_hot: Bà ơi trưa nay ăn gì? Tui kể bà nghe chuyện này, mà bà hứa hông kể ai nha.
    - hong_hot: Poster của bà đẹp mà! Ổng hông biết nhìn thôi!
    }
- vai == "it" && r <= 2:
    hong_hot: *(nhỏ giọng)* Ông… ông vẫn chưa nói ai cái chuyện đó đúng hông? Tui bao ông mì ly nguyên tháng.
- vai == "ran_doc" && r <= 2:
    hong_hot: Ê hàng xóm! Tối qua ông có nghe tui livestream hông? Tường mỏng quá ha.
- r == 1 && ngay == 9:
    hong_hot: MV ra rồi! Ối dồi ôi, bình luận nổ tung! Có người khen, có người chửi, mà chửi cũng là view!
- r == 1 && ngay == 15:
    hong_hot: Mất điện là mùa vàng của hóng hớt đó {g}. Ngồi pantry đi, chuyện tự tới.
- r == 1 && ngay == 21:
    hong_hot: Ủa alo? Bài confession hôm nay ai gửi vậy trời? Tui… tui chỉ đọc thôi nha!
- r == 1 && ngay == 23:
    hong_hot: Livestream sinh nhật tối nay mà {cho} phá bánh là lên top liền. Tui có linh cảm.
- r == 1 && ngay == 29:
    hong_hot: Wifi sập! Phát điện thoại nè, mật khẩu "nghegichua". Đừng hỏi vì sao.
- r == 2 && stress >= 70:
    hong_hot: Ủa {g} sao mặt như vừa bị bóc phốt vậy? Kể tui nghe đi, kể xong nhẹ người lắm.
- r == 2 && nguoi_theo_doi >= 800000:
    hong_hot: Tám trăm nghìn! Biến căng rồi mấy bà ơi, theo hướng tốt!
- r == 2 && nguoi_theo_doi < 200000 && ngay >= 10:
    hong_hot: Fanpage đứng hình rồi {g} ơi. Cần một drama. Drama nhỏ thôi. Có hông?
- r == 4:
    { shuffle:
    - hong_hot: Tui có hai điện thoại. Một để hóng, một để hóng tiếp.
    - hong_hot: Ring light này giúp mặt tui sáng khi kể chuyện tối.
    - hong_hot: Chuyện này tui chưa kể ai nha. À, tui kể ba người rồi. Nhưng ba người đó chưa kể ai.
    - hong_hot: Nghe gì chưa?
    - hong_hot: Biến căng rồi mấy bà ơi!
    - hong_hot: Ét o ét! Tui vừa thấy một chuyện mà tui hông được kể!
    - hong_hot: Tui không ác đâu nha, tui chỉ là không giữ được miệng.
    - hong_hot: Ủa alo? Sao {g} biết chuyện đó trước tui? Ai kể?
    - hong_hot: Kể tui nghe một chuyện, tui kể lại một chuyện. Công bằng.
    }
- gio < 11:
    { shuffle:
    - hong_hot: Tui tới 8 giờ 5. Trễ 5 phút là truyền thống, không phải lỗi.
    - hong_hot: Sáng nay fanpage có 3 tin nhắn hỏi Siêu Nhân Hồng có người yêu chưa. Tui nên trả lời sao?
    - hong_hot: Cà phê chưa? Chưa hả? Uống đi rồi tui kể.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - hong_hot: Ra cơm tấm hông? Bàn tui là bàn hóng nhất quán.
    - hong_hot: Cô Năm cơm tấm biết nhiều chuyện hơn tui đó. Tui đang học hỏi.
    - hong_hot: Ăn trưa mà không có chuyện để nói thì cơm nuốt không trôi.
    }
- gio >= 17:
    { shuffle:
    - hong_hot: Tối nay tui livestream. Vào xem nha, tui kể chuyện… không phải chuyện công ty. Gần như vậy.
    - hong_hot: Đi tiệm nail hông? Tiệm Lung Linh là trụ sở thứ hai của tui.
    - hong_hot: Về Hẻm 69 hông? Đi chung, tui kể chuyện cả đường.
    }
- else:
    { shuffle:
    - hong_hot: Pantry đi! Ba giờ chiều là giờ vàng hóng hớt.
    - hong_hot: Tui vừa đăng clip, 2 triệu view! À không, 2 nghìn. Gần gần vậy.
    }
}
-> END
= ban_cho
{ shuffle:
- hong_hot: …bla bla… **{cho}** …bla… **QUAY** … **TÓP-TÓP** … # phu_de: {cho} ơi nhìn đây! Chị quay một clip Tóp-tóp nha!
- hong_hot: …bla… **ĐÁNH HƠI** …bla bla… **AI** … # phu_de: {cho} ngửi coi hồi sáng ai mới đi với ai, kể chị nghe!
- hong_hot: …bla bla bla… **BÁNH** … # phu_de: Nè, nửa cái bánh bông lan, đừng nói ai chị cho nha.
}
-> END

// ------------------------------------------------------------
=== chung_nc_con_ong_chau_cha ===
# npc:con_ong_chau_cha # noi_chuyen_vat
~ temp g = chung_goi("con_ong_chau_cha")
~ temp G = chung_goi_hoa("con_ong_chau_cha")
~ temp x = chung_xung("con_ong_chau_cha")
~ temp X = chung_xung_hoa("con_ong_chau_cha")
~ temp r = RANDOM(1, 4)
{ vai == "con_ong_chau_cha": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "giam_doc" && r <= 2:
    { shuffle:
    - con_ong_chau_cha: Dạ chú. Cháu tới rồi. Mười giờ là giờ… sáng tạo, chú.
    - con_ong_chau_cha: Chú ơi, nếu cháu muốn làm một việc không ai giao, chú có giận hông?
    }
- vai == "thuc_tap_sinh" && r <= 2:
    con_ong_chau_cha: Ê {thuc_tap_sinh}, sao ông mặc giống tui vậy? Ông lớn hơn tui mà. Thôi, đẹp đó.
- vai == "truong_phong" && r <= 2:
    con_ong_chau_cha: Ông {truong_phong} nè, ghế phó giám đốc ông thích thì ông lấy đi. Tui hông giành đâu. Thiệt.
- r == 1 && ngay == 12:
    con_ong_chau_cha: Ủa thẻ của {x} bị từ chối là sao? Thẻ đó… là thẻ của chú. *(nhìn cái thẻ rất lâu)*
- r == 1 && ngay == 18:
    con_ong_chau_cha: Penthouse đang bị rao bán. {X} đọc trên mạng mới biết. Chill… chill nổi hông ta.
- r == 1 && (ngay == 17 || ngay == 18):
    con_ong_chau_cha: Phòng {x} ở chung với {thuc_tap_sinh}. {thuc_tap_sinh} gấp chăn như khách sạn năm sao. Lạ ghê.
- r == 1 && ngay >= 26:
    con_ong_chau_cha: Nếu có một bài hát hay mà không ai biết ai viết, {g} nghĩ người viết có nên nói ra hông?
- r == 2 && stress >= 70:
    con_ong_chau_cha: Căng quá vậy? Chill đi. Để anh gọi chú anh cho {g} nghỉ… à mà thôi, khỏi gọi.
- r == 2 && nguoi_theo_doi >= 800000:
    con_ong_chau_cha: Siêu Nhân Hồng gần triệu fan rồi. Ổng cần một bài chủ đề. Một bài thật… hồng.
- r == 4:
    { shuffle:
    - con_ong_chau_cha: Hôm nay {x} đi làm sớm. Mười giờ kém năm.
    - con_ong_chau_cha: Kính râm trong nhà là để… tập trung. Thiệt.
    - con_ong_chau_cha: {G} có bao giờ mua đồ mà phải coi giá trước hông? Kể {x} nghe cảm giác đó đi.
    - con_ong_chau_cha: Hôm qua {x} tự trả tiền taxi. Bằng tiền mình. Cảm giác lạ ghê.
    - con_ong_chau_cha: Ủa lương 13 triệu là sống được hả? Sống sao vậy? {x} hỏi thật, không đùa.
    - con_ong_chau_cha: Có một giai điệu cứ lởn vởn trong đầu {x} từ sáng. Hay lắm. Mà thôi.
    - con_ong_chau_cha: Để anh gọi chú anh.
    - con_ong_chau_cha: Ủa sao không mua cái mới luôn?
    - con_ong_chau_cha: Chill đi. Chuyện gì cũng chill được hết.
    - con_ong_chau_cha: Chú anh nói… mà thôi, hôm nay {x} hông muốn nói chú {x} nói gì.
    - con_ong_chau_cha: Áo khoác hồng này giá bằng ba tháng lương ai đó. {X} mới biết hôm qua. Hơi kỳ ha.
    - con_ong_chau_cha: {G} có bao giờ muốn làm một thứ chỉ của riêng mình hông?
    }
- gio < 11:
    { shuffle:
    - con_ong_chau_cha: Mới mấy giờ mà {g} tới rồi? Sớm dữ. {X} còn chưa tỉnh.
    - con_ong_chau_cha: Sáng nay {x} họp marketing ở cà phê Sống Ảo. Một mình. Ý tưởng nhiều lắm.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - con_ong_chau_cha: Ăn trưa hông? {X} bao. Nhà hàng. Mà {g} chọn chỗ đi, {x} chán nhà hàng rồi.
    - con_ong_chau_cha: Cơm tấm vỉa hè ngon hông? {X} chưa ăn bao giờ. Nói thiệt.
    }
- gio >= 17:
    { shuffle:
    - con_ong_chau_cha: Tối nay đi bơi ở Sky Ảo hông? Hồ bơi rộng mà buồn lắm.
    - con_ong_chau_cha: {X} về sớm. Có việc… riêng. Ở nhà. Trong một căn phòng. Thôi, chill.
    - con_ong_chau_cha: Tai nghe này cách âm tốt lắm. Nghe nhạc mình tự… à, nghe nhạc thôi.
    }
- else:
    { shuffle:
    - con_ong_chau_cha: Chiều nay {x} ở phòng phó phòng. Phòng có mỗi mình. Phòng Marketing có mỗi mình.
    - con_ong_chau_cha: {G} nghĩ chữ "Rồng" làm nghệ danh nghe sao? Hỏi vậy thôi.
    }
}
-> END
= ban_cho
{ shuffle:
- con_ong_chau_cha: …bla bla… **{cho}** …bla… **CHILL** … # phu_de: {cho}, chill đi, đừng cắn sneaker trắng của anh.
- con_ong_chau_cha: …bla… **XÚC XÍCH** …bla bla… **MUA** …bla… # phu_de: Mua nguyên thùng xúc xích cho mày nha? Ủa sao không mua luôn?
- con_ong_chau_cha: …bla bla bla… **BÍ MẬT** … # phu_de: Mày biết giữ bí mật hông? Anh có viết một bài hát.
}
-> END

// ------------------------------------------------------------
=== chung_nc_chua_te_deadline ===
# npc:chua_te_deadline # noi_chuyen_vat
~ temp g = chung_goi("chua_te_deadline")
~ temp G = chung_goi_hoa("chua_te_deadline")
~ temp x = chung_xung("chua_te_deadline")
~ temp X = chung_xung_hoa("chua_te_deadline")
~ temp r = RANDOM(1, 4)
{ vai == "chua_te_deadline": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "sieu_nhan_hong":
    { shuffle:
    - chua_te_deadline: Ủa anh. Quà hôm qua em nhận rồi. PR đỉnh nóc. Mà… cảm ơn.
    - chua_te_deadline: Anh ăn chưa? Em hỏi vậy thôi. Producer phải lo cho nghệ sĩ.
    - chua_te_deadline: Hôm nay anh không tạo dáng hả? Lạ ghê. Mà cũng… dễ nói chuyện hơn.
    - chua_te_deadline: Gối hồng anh tặng, em ôm ngủ trưa. Vì nó êm. Chỉ vì nó êm thôi.
    }
- vai == "truong_phong" && r <= 2:
    chua_te_deadline: Ok mom. À ok anh. Họp gì cũng được, miễn đừng bắt em làm bảng tiến độ.
- vai == "editor" && r <= 2:
    chua_te_deadline: {editor} ơi… nhờ xíu. Xíu thôi. Đêm nay thôi. Lần cuối. Thiệt.
- r == 1 && ngay == 15:
    chua_te_deadline: Mất điện thì deadline cũng mất điện. Chill.
- r == 1 && ngay == 23:
    chua_te_deadline: Tối nay ông {sieu_nhan_hong} livestream sinh nhật. Tui làm producer. Chỉ là công việc. *(nhìn điện thoại)* Chỉ là công việc.
- r == 1 && ngay >= 24 && ngay <= 28:
    { shuffle:
    - chua_te_deadline: {G} có bao giờ bị ai tỏ tình trên livestream chưa? Chưa hả? Ừ, chắc chiêu PR thôi. Chắc vậy.
    - chua_te_deadline: Hashtag gì mà cả nước bắt tui trả lời vậy trời. Trả lời deadline còn chưa xong.
    }
- r == 1 && ngay >= 29:
    { shuffle:
    - chua_te_deadline: ÉT O ÉT! AI CỨU TUI VỚI! Cue sheet còn 41 cue chưa viết!
    - chua_te_deadline: Nước tới chân rồi. Giờ nhảy. Mà nhảy là phải đẹp.
    }
- r == 2 && stress >= 70:
    chua_te_deadline: {G} stress hả? Học tui nè: cứ để mai tính. Mai stress tiếp, nhưng là của mai.
- r == 2 && nguoi_theo_doi < 500000 && ngay >= 21:
    chua_te_deadline: Chưa tới mốc hả? Chill. Còn mấy ngày lận. Tui nói vậy… để tui tự tin thôi.
- r == 4:
    { shuffle:
    - chua_te_deadline: Tui làm việc tốt nhất vào lúc 3 giờ sáng ngày cuối cùng.
    - chua_te_deadline: Đừng nhìn tui vậy. Kịp mà. Lần nào cũng kịp.
    - chua_te_deadline: Gối ôm này hả? Êm. Chỉ vì êm. Đừng hỏi ai tặng.
    - chua_te_deadline: Còn sớm mà.
    - chua_te_deadline: Chill, kịp hết.
    - chua_te_deadline: Nước tới chân mới nhảy, mà nhảy là phải đẹp.
    - chua_te_deadline: Việc hôm nay cứ để ngày mai tính. Slogan công ty mà, tui tuân thủ thôi.
    - chua_te_deadline: Đồng hồ cát trên bàn tui chưa lật bao giờ. Lật rồi nó chảy, áp lực lắm.
    - chua_te_deadline: {G} ơi nhờ xíu. Xíu thôi. Không gấp. Mà hơi gấp.
    }
- gio < 11:
    { shuffle:
    - chua_te_deadline: Tui ở cách công ty 200 mét. Đi trễ là vì quá gần, chủ quan.
    - chua_te_deadline: *(ngáp)* Sáng rồi hả? Tóp-tóp chưa hết video mà.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - chua_te_deadline: Trưa nay mì ly tại bàn. Tiết kiệm 20 phút để… ngủ.
    - chua_te_deadline: Hồi sáng ai đó để bánh mì trên bàn tui. Không ghi tên. Mà ghi "N.". Ai vậy ta.
    }
- gio >= 17:
    { shuffle:
    - chua_te_deadline: Tối nay đánh bida dưới nhà. Deadline mai mới tính.
    - chua_te_deadline: Giờ này mới là giờ làm việc thật. Ban ngày chỉ là khởi động.
    - chua_te_deadline: Tui về ngủ trước. Ba giờ sáng tui dậy làm. Hoặc không.
    }
- else:
    { shuffle:
    - chua_te_deadline: Ba giờ chiều là giờ lướt Tóp-tóp chuẩn nhất. Khoa học chứng minh. Tui chứng minh.
    - chua_te_deadline: File gốc hả? File gì? À… file gì đâu. Không có file nào mất hết.
    }
}
-> END
= ban_cho
{ shuffle:
- chua_te_deadline: …bla bla… **{cho}** …bla… **NGỦ** … # phu_de: {cho}, ngủ chung hông? Gối hồng êm lắm.
- chua_te_deadline: …bla… **USB** …bla bla… **TÌM** …bla… # phu_de: Mày có thấy cái USB không nhãn nào hông? Tìm giùm tao với.
- chua_te_deadline: …bla bla bla… **MAI** … # phu_de: Để mai tính.
}
-> END

// ------------------------------------------------------------
=== chung_nc_thuc_tap_sinh ===
# npc:thuc_tap_sinh # noi_chuyen_vat
~ temp g = chung_goi("thuc_tap_sinh")
~ temp G = chung_goi_hoa("thuc_tap_sinh")
~ temp r = RANDOM(1, 4)
{ vai == "thuc_tap_sinh": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "con_ong_chau_cha" && r <= 2:
    { shuffle:
    - thuc_tap_sinh: Dạ anh {con_ong_chau_cha}! Hôm nay anh mặc đẹp quá ạ! Em… em mua cái áo y chang rồi ạ!
    - thuc_tap_sinh: Dạ anh {con_ong_chau_cha}, em muốn học cách anh "chill" ạ. Em chill không được ạ.
    }
- vai == "chi_dai" && r <= 2:
    thuc_tap_sinh: Dạ chị {chi_dai}! Hôm qua có người bắt em photo 400 trang, mà em không mách chị đâu ạ!
- vai == "bien_kich" && r <= 2:
    thuc_tap_sinh: Dạ chị {bien_kich}, kịch bản phim tới đâu rồi ạ? Em hóng lắm ạ! Em có kể chị nghe một chuyện hồi tháng 9 đó ạ.
- r == 1 && ngay == 5:
    thuc_tap_sinh: Dạ hôm nay Ngày Nhà giáo Thế giới, em tặng hoa {g} ạ! {G} là thầy cô của em ạ!
- r == 1 && ngay == 12:
    thuc_tap_sinh: Dạ… lương về rồi ạ. Bốn triệu ạ. Em… em vui lắm ạ. Thật đó ạ.
- r == 1 && ngay == 15:
    thuc_tap_sinh: Dạ em có mang 5 cục sạc dự phòng ạ! {G} cần sạc không ạ? Em có cả loại sạc nhanh ạ!
- r == 1 && ngay >= 26 && ngay <= 30:
    thuc_tap_sinh: Dạ… em hết thực tập ngày 31 ạ. Em không biết có được ở lại không ạ. Em… em thích ở đây lắm ạ.
- r == 2 && stress >= 70:
    thuc_tap_sinh: Dạ {g} mệt hả ạ? Em pha cà phê cho ạ. Lần này em không bỏ muối đâu ạ!
- r == 2 && nguoi_theo_doi >= 800000:
    thuc_tap_sinh: Dạ số người theo dõi tăng nhanh ghê ạ! Em có in biểu đồ ra treo ở bàn ạ!
- r == 4:
    { shuffle:
    - thuc_tap_sinh: Dạ em vừa photo xong 400 trang ạ. Tay em còn ấm ạ.
    - thuc_tap_sinh: Dạ hôm nay em học được chữ "slay" ạ. Em slay chưa ạ?
    - thuc_tap_sinh: Dạ em xếp ghế phòng họp theo hình chữ G ạ. Anh {truong_phong} khen sáng tạo ạ.
    - thuc_tap_sinh: Dạ {g} có cần em cầm giùm gì không ạ? Em rảnh hai tay ạ.
    - thuc_tap_sinh: Dạ em ba mươi tuổi ạ. Nhưng tâm hồn em mới vô làm ạ.
    - thuc_tap_sinh: Dạ cái máy pha cà phê hôm nay hiền ạ. Em nói chuyện với nó rồi ạ.
    - thuc_tap_sinh: Dạ em mới vô nên chưa biết ạ.
    - thuc_tap_sinh: Dạ em làm liền ạ!
    - thuc_tap_sinh: Dạ cái này là sao ạ?
    - thuc_tap_sinh: Dạ {g} cần gì cứ kêu em ạ! Photo, pha cà phê, xếp ghế, em làm hết ạ!
    - thuc_tap_sinh: Dạ hôm nay là Ngày Thanh niên… à không phải ạ. Nhưng em vẫn là thanh niên ạ!
    - thuc_tap_sinh: Dạ em đang học "6-7" của giới trẻ ạ. 6-7! Em nói vậy đúng chưa ạ?
    }
- gio < 11:
    { shuffle:
    - thuc_tap_sinh: Dạ em tới lúc 7 giờ ạ. Em mở cửa pantry, pha cà phê cho cả phòng rồi ạ.
    - thuc_tap_sinh: Dạ chào buổi sáng ạ! *(cúi 90 độ)*
    - thuc_tap_sinh: Dạ máy photo hôm nay khỏe ạ. Em vừa nói chuyện với nó ạ.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - thuc_tap_sinh: Dạ trưa nay em ăn mì gói ở pantry ạ. Mì gói ngon lắm ạ, em ăn 12 năm… à không, mới ăn thôi ạ.
    - thuc_tap_sinh: Dạ {g} ăn trưa chưa ạ? Em đi mua giùm ạ!
    }
- gio >= 17:
    { shuffle:
    - thuc_tap_sinh: Dạ tối nay em ra quán net ạ. Chơi game với anh {it} ạ. Em thua hoài ạ.
    - thuc_tap_sinh: Dạ còn việc gì không ạ? Em ở lại làm được ạ, em quen tăng ca rồi ạ… hồi trước ạ.
    }
- else:
    { shuffle:
    - thuc_tap_sinh: Dạ chiều nay em cầm hắt sáng ạ. Tay em mỏi mà vui ạ.
    - thuc_tap_sinh: Dạ… {G} có biết lãi suất tiết kiệm giờ bao nhiêu không ạ? À, em hỏi cho vui thôi ạ.
    }
}
-> END
= ban_cho
{ shuffle:
- thuc_tap_sinh: …bla bla… **{cho}** …bla… **NGOAN** … # phu_de: Dạ {cho} ngoan quá ạ. Em… à anh xoa đầu nha.
- thuc_tap_sinh: …bla… **XÚC XÍCH** …bla bla… # phu_de: Dạ anh có mua xúc xích cho {cho} nè ạ. Hai cây ạ.
- thuc_tap_sinh: …bla bla bla… **ĐI DẠO** … # phu_de: Chiều nay mình đi dạo công viên nha {cho}.
}
-> END

// ------------------------------------------------------------
=== chung_nc_ran_doc ===
# npc:ran_doc # noi_chuyen_vat
~ temp g = chung_goi("ran_doc")
~ temp G = chung_goi_hoa("ran_doc")
~ temp x = chung_xung("ran_doc")
~ temp X = chung_xung_hoa("ran_doc")
~ temp r = RANDOM(1, 4)
{ vai == "ran_doc": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "sieu_nhan_hong":
    { shuffle:
    - ran_doc: *(cười rất tươi)* Chào anh. Hôm nay anh hồng ghê. Hồng… như hồi nhỏ.
    - ran_doc: Anh còn nhớ nhà kho nào có lỗ thông gió hình con cá hông? Hỏi vậy thôi.
    - ran_doc: Anh tốt bụng quá ha. Giúp ai cũng giúp. Ai cũng vậy hả anh?
    }
- vai == "hong_hot" && r <= 2:
    ran_doc: Nói nhỏ thôi nha… hôm qua bà livestream tui nghe hết. Mà tui hông nói ai đâu.
- r == 1 && ngay == 1:
    ran_doc: Ngày đầu đi làm mà gặp được… người quen. Vui ghê.
- r == 1 && ngay == 11:
    ran_doc: Ảnh hồi nhỏ hả? Tui không đăng. Hồi nhỏ của tui… không có gì đáng chụp.
- r == 1 && ngay >= 17 && ngay <= 18:
    ran_doc: Ở chung phòng với Siêu Nhân Hồng. Bốc trúng sít rịt luôn {g} ạ.
- r == 2 && stress >= 70:
    ran_doc: Nói nhỏ thôi nha… {G} trông mệt quá. Ai làm {g} mệt vậy? Kể {x} nghe đi.
- r == 2 && nguoi_theo_doi >= 800000:
    ran_doc: Tám trăm nghìn… ừ. Nhiều ha. *(nụ cười hơi cứng)*
- r == 4:
    { shuffle:
    - ran_doc: Hôm nay {g} mặc đẹp ghê. Ai tặng vậy? Hỏi vậy thôi.
    - ran_doc: Tui hông thích drama đâu. Tui chỉ… ghi chép.
    - ran_doc: Nói nhỏ thôi nha, hồi sáng tui thấy một chuyện. Mà thôi, chưa tới lúc.
    - ran_doc: Group công ty hôm qua sôi nổi ghê. Tui là admin mà, tui đọc hết.
    - ran_doc: Tui mới vô thôi, nhưng tui hiểu công ty này nhanh lắm.
    - ran_doc: Cười lên đi {g}. Cười thì người ta không đoán được mình nghĩ gì.
    - ran_doc: {G} có tin người ta thay đổi được hông? Tui thì… chưa chắc.
    - ran_doc: Sổ tay bìa xanh này hả? Ghi sinh nhật. Với ghi nhớ. Nhớ hết.
    - ran_doc: Tui chỉ nói sự thật thôi mà.
    - ran_doc: Nói nhỏ thôi nha… mà thôi, chuyện người ta.
    - ran_doc: Tui nói vậy thôi chứ không có ý gì đâu.
    - ran_doc: {G} biết hông, công ty này ai cũng có một bí mật. {G} cũng vậy đúng hông?
    - ran_doc: Sinh nhật {g} ngày mấy? {X} ghi lại, tổ chức cho. Tổ chức sinh nhật là nghề của {x}.
    - ran_doc: Bản tin nội bộ tuần này {x} viết về {g} đó. Toàn chuyện tốt thôi. Gần như vậy.
    }
- gio < 11:
    { shuffle:
    - ran_doc: Chào buổi sáng! {X} đi một vòng các phòng rồi. Phòng nào cũng có chuyện.
    - ran_doc: Sáng nay {G} đẹp ghê. Tui khen thiệt đó, không có ý gì.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - ran_doc: Ra cơm tấm hông? Ngồi gần nhóm đông người cho vui.
    - ran_doc: Bàn bên kia đang nói về {g} đó. Nói tốt. Chắc vậy.
    }
- gio >= 17:
    { shuffle:
    - ran_doc: Tối nay ra quán trà đá đầu hẻm hông? Ngồi đó nghe được cả hẻm.
    - ran_doc: Về sớm vậy? Ừ, nghỉ đi. Mai còn nhiều chuyện.
    }
- else:
    { shuffle:
    - ran_doc: Pantry giờ này vắng. Vắng là lúc người ta nói thật.
    - ran_doc: Cuốn sổ này hả? Sổ ghi sinh nhật đồng nghiệp thôi. Với vài thứ khác.
    }
}
-> END
= ban_cho
{ shuffle:
- ran_doc: …bla bla… **{cho}** …bla… **NGOAN** … # phu_de: {cho} ngoan. Mày biết hết chuyện công ty đúng hông?
- ran_doc: …bla… **HỒNG** …bla bla… **CẮN** …bla… # phu_de: Mày ghét bộ đồ hồng hả? Tao cũng vậy. Cắn mạnh vô.
- ran_doc: …bla bla bla… **XÚC XÍCH** … # phu_de: Xúc xích nè. Đổi lại, mày dẫn tao tới kho dưới gầm cầu thang nha.
}
-> END

// ------------------------------------------------------------
=== chung_nc_ke_toan ===
# npc:ke_toan # noi_chuyen_vat
~ temp g = chung_goi("ke_toan")
~ temp G = chung_goi_hoa("ke_toan")
~ temp x = chung_xung("ke_toan")
~ temp X = chung_xung_hoa("ke_toan")
~ temp r = RANDOM(1, 4)
{ vai == "ke_toan": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "sales" && r <= 2:
    { shuffle:
    - ke_toan: {sales}. Hóa đơn tiếp khách tuần trước đâu? Không có hóa đơn là không có tiền.
    - ke_toan: Tạm ứng nữa hả? Thân chưa mà giỡn.
    }
- vai == "chi_dai" && r <= 2:
    ke_toan: Bà ăn rau chưa? Tui mua bó rau muống cho bà rồi. Mười ba nghìn. Bà trả tui sau.
- vai == "giam_doc" && r <= 2:
    ke_toan: Anh. Em nhắc lại lần thứ mười: trang 47. Anh đọc chưa?
- r == 1 && ngay == 1:
    ke_toan: Hợp đồng 52 trang. Tui đọc tới trang 47 thì… thôi. Không có gì. Đi làm đi.
- r == 1 && (ngay == 10 || ngay == 11):
    ke_toan: Lương chưa về không phải lỗi của tui. Đừng nhìn tui như vậy.
- r == 1 && ngay == 12:
    ke_toan: Lương về rồi. Đừng tiêu hết trong một ngày. Ngày 15 tui không cho tạm ứng đâu.
- r == 1 && ngay == 22:
    ke_toan: Đoàn thuế ở phòng tui. Ai đi ngang thì làm ơn trông chăm chỉ giùm.
- r == 1 && ngay >= 26:
    ke_toan: *(nhìn lịch rất lâu)* Còn mấy ngày nữa ha. Tui đếm từng ngày như đếm tiền.
- r == 2 && stress >= 70:
    ke_toan: {G} stress hả? Ghi ra giấy. Cái gì ghi ra giấy thì bớt sợ. Tiền cũng vậy.
- r == 2 && nguoi_theo_doi >= 800000:
    ke_toan: Tám trăm nghìn. *(thở ra)* Tối nay tui ngủ được. Chắc vậy.
- r == 2 && nguoi_theo_doi < 500000 && ngay >= 21:
    ke_toan: Số liệu chưa đủ. Tui không nói gì thêm. Tui chỉ đang tính.
- r == 4:
    { shuffle:
    - ke_toan: Tui không keo. Tui chỉ thương tiền công ty.
    - ke_toan: Ngày 10 năm nào cũng có người giận tui. Tui quen rồi.
    - ke_toan: Máy tính cầm tay này theo tui mười năm. Chưa sai một phép tính nào. Người thì sai hoài.
    - ke_toan: {G} biết điều khoản nào đáng sợ nhất trong hợp đồng hông? Là điều khoản không ai đọc.
    - ke_toan: Tiền mặt, tiền chuyển khoản, tiền để dành. Tui có ba ngăn ví.
    - ke_toan: Không có hóa đơn là không có tiền.
    - ke_toan: Hóa đơn đâu {g}?
    - ke_toan: Mua bút bi cần ba chữ ký. Mua ba cây thì cần chín. Đùa thôi. Vẫn ba.
    - ke_toan: Bảo hiểm có theo luật. Tui nhắc mỗi tuần. Tuần này tui nhắc rồi đó.
    - ke_toan: Kính này không phải kính lão. Là kính đọc chữ cỡ 6.
    - ke_toan: Tiền công ty là tiền của mọi người. Nên tui giữ như tiền nhà tui.
    }
- gio < 11:
    { shuffle:
    - ke_toan: Tui tới 7 giờ 55. Không sớm, không trễ. Đúng như sổ sách.
    - ke_toan: Sáng nay chợ Phố Cũ rau tăng giá. Tui ghi lại rồi.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - ke_toan: Hộp cơm của tui có dán nhãn. Ai ăn là tui biết.
    - ke_toan: Cá kho hôm nay mặn. Tại tui đang lo. Lo thì nêm tay nặng.
    }
- gio >= 17:
    { shuffle:
    - ke_toan: Về nhà tui còn ghi sổ chi tiêu. Ngày nào cũng ghi. Ghi xong mới ngủ.
    - ke_toan: Tối nay tui ghé chợ. Mua rau cho tui, với cho một người không biết giá rau.
    }
- else:
    { shuffle:
    - ke_toan: Chiều nay tui duyệt chi. Đừng ai vô phòng tui với vẻ mặt "xin xíu".
    - ke_toan: {G} có biết két sắt nào chắc nhất hông? Hỏi vậy thôi. Cho công việc.
    }
}
-> END
= ban_cho
{ shuffle:
- ke_toan: …bla bla… **{cho}** …bla… **HÓA ĐƠN** … # phu_de: {cho}, xúc xích hôm nay có hóa đơn chưa?
- ke_toan: …bla… **HAI CÂY** …bla bla… # phu_de: Lương của mày là hai cây xúc xích. Tao ghi sổ đàng hoàng.
- ke_toan: …bla bla bla… **ĐỪNG** … **HỘP CƠM** … # phu_de: Đừng nhìn hộp cơm của tao. Hộp cơm này không có trong ngân sách của mày.
}
-> END

// ------------------------------------------------------------
=== chung_nc_hr ===
# npc:hr # noi_chuyen_vat
~ temp g = chung_goi("hr")
~ temp G = chung_goi_hoa("hr")
~ temp x = chung_xung("hr")
~ temp X = chung_xung_hoa("hr")
~ temp r = RANDOM(1, 4)
{ vai == "hr": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "thanh_xin_nghi":
    { shuffle:
    - hr: Ồ, {thanh_xin_nghi} hôm nay đi làm. Bà ngoại khỏe chưa em? Anh mừng cho bà.
    - hr: Em rảnh không, lên phòng anh uống trà xíu. Không có gì đâu, chỉ là… lần thứ tám rồi.
    - hr: Đêm qua anh coi tivi, thấy một thí sinh giống em lắm. Chắc anh nhìn nhầm ha?
    }
- vai == "ke_toan" && r <= 2:
    hr: {ke_toan}… à, chị {ke_toan}, em gửi chị bảng chấm công rồi. Chị… chị uống trà hông?
- r == 1 && ngay == 2:
    hr: Hôm nay Ngày Nụ cười Thế giới. Ai chấm công mà không cười, {x} ghi nhận.
- r == 1 && ngay >= 15 && ngay <= 16:
    hr: Team building Vũng Tàu sắp tới rồi! Kéo co trên cát. Bắt buộc mà vui.
- r == 1 && ngay >= 26 && ngay <= 30:
    { shuffle:
    - hr: *(nụ cười hơi mỏi)* {G} rảnh không, lên uống trà. Lần này {x} cần người lắng nghe {x}.
    - hr: Tập hồ sơ hồng này hả? Không có gì đâu. Chỉ là… giấy tờ.
    }
- r == 2 && stress >= 70:
    hr: {X} thấy {g} căng quá. Mình cùng nhìn lại hành trình nha. Hay uống trà trước đã.
- r == 2 && nguoi_theo_doi < 500000 && ngay >= 21:
    hr: Dạo này {x} hay được sếp gọi lên. Không có gì đâu. {G} cứ làm tốt việc của {g} nha.
- r == 4:
    { shuffle:
    - hr: {X} cười suốt vì {x} thấy mọi người dễ thương. Đừng sợ.
    - hr: Mời uống trà không phải lúc nào cũng là chuyện xấu. Chỉ là thường thôi.
    - hr: {G} có muốn góp ý gì cho phòng nhân sự hông? Ẩn danh. Gần như ẩn danh.
    - hr: Hôm nay {x} không mời ai uống trà. Chưa.
    - hr: Danh sách hả? Danh sách gì? {x} có nhiều danh sách lắm. Danh sách trà chẳng hạn.
    - hr: Team building là để gắn kết. Kéo co là để thấy ai kéo, ai đứng chơi.
    - hr: Em rảnh không, lên phòng anh uống trà xíu.
    - hr: {X} chỉ muốn lắng nghe {g} thôi.
    - hr: Mình cùng nhìn lại hành trình nha.
    - hr: Kệ trà của {x} có 40 loại, sắp theo bảng chữ cái. Trà lài ở chữ L.
    - hr: {G} đi làm đúng giờ cả tuần. {X} ghi nhận. {X} ghi nhận hết.
    - hr: Nụ cười này {x} luyện 6 năm. Mỏi miệng lắm, nhưng nghề mà.
    }
- gio < 11:
    { shuffle:
    - hr: 8 giờ đúng. {X} đứng cạnh máy chấm công. Chào buổi sáng!
    - hr: Hôm nay {g} đến lúc 7 giờ 58. Tốt lắm. Hai phút đó quý giá.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - hr: Căn tin hôm nay có canh chua. {X} khuyên dùng. Đây là lời khuyên, không phải chỉ đạo.
    - hr: Ăn trưa với {x} hông? Không có gì đâu, ăn trưa thật thôi.
    }
- gio >= 17:
    { shuffle:
    - hr: Về rồi hả? Nhớ chấm công ra nha. Máy nhớ, {x} cũng nhớ.
    - hr: Tối nay {x} về pha trà. Có loại trà làm người ta nói thật, {x} chưa dám thử.
    - hr: Nếu {g} mở một quán trà, {g} đặt tên gì? Hỏi vậy thôi.
    }
- else:
    { shuffle:
    - hr: Chiều nay {x} có ba buổi uống trà. {G} không có trong danh sách. Đừng lo.
    - hr: Anh {thanh_xin_nghi}… à, bạn {thanh_xin_nghi} có đi làm hôm nay không {g}?
    }
}
-> END
= ban_cho
{ shuffle:
- hr: …bla bla… **{cho}** …bla… **CHẤM CÔNG** … # phu_de: {cho}, mày cũng phải chấm công. Đùa thôi.
- hr: …bla… **TRÀ** …bla bla… **KHÔNG** … # phu_de: Không, trà không phải cho chó.
- hr: …bla bla bla… **NGOAN** … # phu_de: Ngoan. Mày là nhân viên duy nhất không bao giờ xin nghỉ.
}
-> END

// ------------------------------------------------------------
=== chung_nc_it ===
# npc:it # noi_chuyen_vat
~ temp g = chung_goi("it")
~ temp G = chung_goi_hoa("it")
~ temp x = chung_xung("it")
~ temp X = chung_xung_hoa("it")
~ temp r = RANDOM(1, 4)
{ vai == "it": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "hong_hot" && r <= 2:
    it: Máy bà tên "NGAN-LAPTOP". Đổi tên đi. Tui nói một lần.
- vai == "bac_bao_ve" && r <= 2:
    it: Bác. Tối nay ốc. Cháu bao. Bác kể chuyện, cháu nghe.
- vai == "dan_dau_tu" && r <= 2:
    it: Ba triệu. Anh nợ em ba triệu. Restart lại trí nhớ đi anh.
- r == 1 && ngay == 15:
    it: Mất điện. Server chạy bằng UPS. Còn 40 phút. Đừng ai sạc điện thoại vào ổ server.
- r == 1 && ngay == 29:
    { shuffle:
    - it: Wifi sập. Không phải lỗi tui. Lần này thật.
    - it: Đừng hỏi wifi. Tui đang tìm dây. Dây có dấu răng.
    }
- r == 1 && ngay == 31:
    it: Tối nay tui chạy âm thanh ánh sáng. Ai đụng cầu dao là tui biết.
- r == 2 && stress >= 70:
    it: {G} restart chưa? Tắt điện thoại đi. Ngủ. Bật lại sáng mai.
- r == 4:
    { shuffle:
    - it: Mất wifi đừng gọi tui. Gọi router.
    - it: Ổ cứng ghi "KHÔNG ĐƯỢC MỞ". Đừng hỏi.
    - it: Tui biết ai hay đọc trang Confession giờ làm. Không nói.
    - it: Tai nghe đeo cổ. Không nghe gì. Để người ta khỏi bắt chuyện.
    - it: Cáp HDMI. Cáp mạng. Cáp sạc. Cáp nào cũng có người mượn không trả.
    - it: Máy {g} có 47 tab đang mở. Đóng bớt. Máy khóc rồi.
    - it: Hướng nội. Không phải khó chịu. Khác nhau.
    - it: Phòng server nhiệt độ 18 độ. Nơi duy nhất mát trong công ty.
    - it: Anh tắt đi bật lại thử chưa?
    - it: Restart chưa?
    - it: Lỗi người dùng.
    - it: Mì ly. Vị tôm. Ly thứ ba. Đừng nói ai.
    - it: Tui đọc được log. Không đọc nội dung. Gần như không.
    - it: Mật khẩu "123456" là của ai đó trong công ty này. Không nói ai.
    }
- gio < 11:
    { shuffle:
    - it: Tui ngủ ở phòng server. Mát. Yên. Có tiếng quạt như mưa.
    - it: Sáng. Máy in kẹt chưa? Chưa à. Chờ chút.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - it: Ăn trưa. Mì ly. Tại bàn. Như mọi ngày.
    - it: {G} ăn cơm tấm hả. Ngon không. Lâu rồi tui chưa ăn cơm.
    }
- gio >= 17:
    { shuffle:
    - it: Về? Tui ở lại. Server cần người.
    - it: Tối nay quán net. {thuc_tap_sinh} chơi dở. Nhưng lễ phép với quái.
    - it: Quán ốc với bác {bac_bao_ve}. Hai người ít nói. Hợp.
    }
- else:
    { shuffle:
    - it: Đèn bàn phím tui đổi sang hồng rồi. Nội quy.
    - it: Chiều nay sửa máy cả công ty. Cả công ty quên restart.
    }
}
-> END
= ban_cho
{ shuffle:
- it: …bla bla… **{cho}** …bla… **DÂY MẠNG** …**KHÔNG** … # phu_de: {cho}. Dây mạng. Không cắn.
- it: …bla… **MÌ** …bla bla… # phu_de: Mì ly. Chia mày sợi cuối.
- it: …bla bla bla… **CON GÀ** … # phu_de: Con gà cao su của mày. Sau tủ mạng. Tao biết. Đừng cắn dây.
}
-> END

// ------------------------------------------------------------
=== chung_nc_idol_het_thoi ===
# npc:idol_het_thoi # noi_chuyen_vat
~ temp g = chung_goi("idol_het_thoi")
~ temp G = chung_goi_hoa("idol_het_thoi")
~ temp x = chung_xung("idol_het_thoi")
~ temp X = chung_xung_hoa("idol_het_thoi")
~ temp r = RANDOM(1, 4)
{ vai == "idol_het_thoi": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "sieu_nhan_hong":
    { shuffle:
    - idol_het_thoi: Ờ, chào. Hồng ghê. Hồng quá đà. Hồi anh còn nổi, anh mặc tím, sang hơn nhiều.
    - idol_het_thoi: Em biết anh là ai không? …Biết hả? Ờ. Vậy thôi, đi đi.
    - idol_het_thoi: Hát sai lời "Công Viên" một lần nữa là anh kiện đó. Đùa. Mà không đùa lắm.
    }
- vai == "quan_ly_idol":
    { shuffle:
    - idol_het_thoi: Anh {quan_ly_idol} ăn chưa? Ăn đi rồi lo cho em. Em… em lo được mà. Chắc vậy.
    - idol_het_thoi: Anh ơi, tối nay đám cưới sảnh B. Anh có đi theo hông? Đi đi, em hát hay hơn khi có anh.
    - idol_het_thoi: Mười một năm rồi đó anh. Anh vẫn chưa bỏ em. Lạ ghê.
    }
- vai == "giam_doc" && r <= 2:
    idol_het_thoi: Anh cả! Hồi 2015 anh lăng xê em. Giờ anh lăng xê lại một lần nữa được hông?
- r == 1 && ngay == 16:
    idol_het_thoi: Gameshow hôm nay có phần "Hit Một Thời". Hit của ai? Hỏi vậy thôi. *(chỉnh khăn quàng)*
- r == 1 && ngay == 15:
    idol_het_thoi: Pantry tối thui, hông ai thấy mặt. Hát một bài cũng được ha. Không ai quay đâu ha.
- r == 1 && ngay >= 24 && ngay <= 28:
    idol_het_thoi: Cái clip đó… cái clip trong bóng tối… mọi người nghe thật hả? Không phải bot hả?
- r == 1 && ngay == 30:
    idol_het_thoi: Hợp đồng {x} hết hạn mai. Mai là Halloween. Hù ai chứ hù {x} được rồi đó.
- r == 2 && stress >= 70:
    idol_het_thoi: Stress hả? Hồi anh còn nổi, anh stress vì fan đông quá. Giờ stress vì… thôi. Ngồi đây, anh hát cho nghe.
- r == 2 && nguoi_theo_doi >= 800000:
    idol_het_thoi: Tám trăm nghìn. Năm 2015 anh có ba triệu. *(im lặng)* …Mà thôi, chúc mừng ổng.
- r == 4:
    { shuffle:
    - idol_het_thoi: Micro này theo anh từ 2015. Nó biết hết.
    - idol_het_thoi: Khăn quàng hồng này để át ai đó. Không nói tên.
    - idol_het_thoi: Phỏng vấn anh đi. Hỏi gì cũng được. Anh trả lời hay lắm.
    - idol_het_thoi: Album thứ hai của anh… đang ấp ủ. Ấp từ 2016.
    - idol_het_thoi: Em biết anh là ai không?
    - idol_het_thoi: Hồi anh còn nổi…
    - idol_het_thoi: Fan anh đông lắm em. Đông… theo cách riêng.
    - idol_het_thoi: "Ngày xưa có đôi bạn thân bán cá viên chiên tại công viên…" Xin lỗi, phản xạ.
    - idol_het_thoi: Kính râm này hả? Để fan không nhận ra. *(nhìn quanh, không có ai)*
    - idol_het_thoi: Phòng chờ riêng của anh đâu rồi? À, giờ là phòng chờ của Siêu Nhân Hồng. Ừ.
    }
- gio < 11:
    { shuffle:
    - idol_het_thoi: Sáng sớm vậy mà gặp anh hả? Hiếm lắm. Anh tới lúc 11 giờ, theo giờ nghệ sĩ.
    - idol_het_thoi: Mi mi mi mi… *(luyện thanh)* Xin lỗi, đang trả lời phỏng vấn trong đầu.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - idol_het_thoi: Anh gọi đồ ăn sang. Ngôi sao không ra quán. Mà… cơm tấm cô Năm ngon hông?
    - idol_het_thoi: Ăn trưa hả? Cá viên chiên đi. Không phải vì bài hát. Vì… ngon.
    }
- gio >= 17:
    { shuffle:
    - idol_het_thoi: Tối nay anh có show. Show đám cưới. Nhưng show.
    - idol_het_thoi: Karaoke hông? Bài nào cũng được. Trừ… à không, bài đó cũng được.
    }
- else:
    { shuffle:
    - idol_het_thoi: Chiều nay anh luyện thanh ở studio. Studio trống. Như lịch diễn của anh.
    - idol_het_thoi: Em có nghe "Công Viên" bao giờ chưa? Chưa thì thôi. Có thì nói anh nghe.
    }
}
-> END
= ban_cho
{ shuffle:
- idol_het_thoi: …bla bla… **{cho}** …bla… **FAN** … # phu_de: {cho} là fan anh đúng hông? Mày nghe "Công Viên" là vẫy đuôi mà.
- idol_het_thoi: …bla… **CÁ VIÊN CHIÊN** …bla bla… # phu_de: Một viên cá viên chiên. Chia nha.
- idol_het_thoi: …bla bla bla… **ĐỪNG** … **MICRO** … # phu_de: Đừng liếm micro của anh.
}
-> END

// ------------------------------------------------------------
=== chung_nc_quan_ly_idol ===
# npc:quan_ly_idol # noi_chuyen_vat
~ temp g = chung_goi("quan_ly_idol")
~ temp G = chung_goi_hoa("quan_ly_idol")
~ temp x = chung_xung("quan_ly_idol")
~ temp X = chung_xung_hoa("quan_ly_idol")
~ temp r = RANDOM(1, 4)
{ vai == "quan_ly_idol": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "idol_het_thoi":
    { shuffle:
    - quan_ly_idol: Ăn chưa? Ăn đi rồi tập. Khoan, anh nghe máy chút… à không, không ai gọi. Ăn đi.
    - quan_ly_idol: Tối nay đám cưới sảnh B. Anh mang micro riêng cho em rồi. Đừng quên kính râm.
    - quan_ly_idol: Em hát hay mà. Từ 2015 tới giờ vẫn hay. Người ta không nghe thôi.
    }
- vai == "editor" && r <= 2:
    quan_ly_idol: {editor} hả? Video hôm qua em dựng cho {idol_het_thoi}, anh coi rồi. Đẹp lắm. Cảm ơn em nha.
- vai == "thanh_xin_nghi" && r <= 2:
    quan_ly_idol: {thanh_xin_nghi}. Lịch tuần này em có mặt mấy ngày? Nói thật với anh thôi, anh không nói HR.
- vai == "sieu_nhan_hong" && r <= 2:
    quan_ly_idol: Em đừng đăng gì hết khi chưa hỏi anh. Đặc biệt là ảnh không mũ. Đặc biệt.
- r == 1 && ngay == 6:
    quan_ly_idol: Nghệ sĩ bỏ ngang buổi chụp đi giúp bà cụ. Lịch đổ. Mà clip lên xu hướng. Anh không biết nên vui hay buồn.
- r == 1 && ngay == 25:
    quan_ly_idol: Hôm nay anh đi gặp đối tác. Bên… Ven Đô. Đừng hỏi. Chuyện này để anh lo.
- r == 1 && ngay == 28:
    quan_ly_idol: Video gì trên fanpage vậy? Ai đăng? Ai… ai tỏ tình với ai?
- r == 2 && stress >= 70:
    quan_ly_idol: Căng hả? Anh cũng vậy. Ly cà phê thứ sáu rồi. Uống chung hông?
- r == 2 && nguoi_theo_doi >= 800000:
    quan_ly_idol: Tám trăm nghìn. Anh tắt bớt một điện thoại được rồi. Một thôi.
- r == 4:
    { shuffle:
    - quan_ly_idol: Anh có 5 cục sạc dự phòng. Pin anh thì không sạc được.
    - quan_ly_idol: Mắt thâm là huy chương của nghề quản lý.
    - quan_ly_idol: Lịch tuần này kín. Lịch của anh thì… để dành cho người khác.
    - quan_ly_idol: Đừng ai đăng gì hết. Kể cả story ăn sáng.
    - quan_ly_idol: Có những người mình lo cho họ mà họ không biết. Vậy cũng được.
    - quan_ly_idol: Anh vào làm năm 2014. Có những thứ anh giữ từ hồi đó tới giờ.
    - quan_ly_idol: Cà phê không đường. Đời đủ đắng rồi thì uống cà phê cho quen.
    - quan_ly_idol: Chuyện này để anh lo, đừng ai đăng gì hết!
    - quan_ly_idol: Khoan, anh nghe máy chút.
    - quan_ly_idol: Hai điện thoại, hai nghệ sĩ, một trái tim… à không, một bộ não. Mệt.
    - quan_ly_idol: Tai nghe này nhấp nháy từ 2019 tới giờ. Chưa tắt bao giờ.
    - quan_ly_idol: {G} có biết ai giỏi dập khủng hoảng hông? Ngoài anh ra.
    }
- gio < 11:
    { shuffle:
    - quan_ly_idol: Sáng nay anh đã xử lý ba khủng hoảng. Mới 9 giờ.
    - quan_ly_idol: Cà phê chưa? Anh ly thứ ba rồi.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - quan_ly_idol: Ăn vội ở xe đẩy thôi. Xe đẩy nhanh hơn nhà hàng ba phút.
    - quan_ly_idol: Trưa nay anh phải lo cơm cho hai nghệ sĩ. Anh thì… lát ăn.
    }
- gio >= 17:
    { shuffle:
    - quan_ly_idol: Đi show tối. Về khuya. Như mọi ngày.
    - quan_ly_idol: Chùa Phố Cũ linh lắm. Anh hay đi. Cầu… công việc. Công việc thôi.
    }
- else:
    { shuffle:
    - quan_ly_idol: Chiều nay anh theo {idol_het_thoi}. À, theo lịch của {idol_het_thoi}. Lịch.
    - quan_ly_idol: Đừng ai đăng gì hết trước 6 giờ chiều nha. Anh đang soạn thông cáo.
    }
}
-> END
= ban_cho
{ shuffle:
- quan_ly_idol: …bla bla… **{cho}** …bla… **ĐỪNG** … **SỦA** … # phu_de: {cho}, đừng sủa lúc anh đang gọi cho đối tác.
- quan_ly_idol: …bla… **KHOAN** …bla bla… # phu_de: Khoan, anh nghe máy chút.
- quan_ly_idol: …bla bla bla… **NGOAN** … # phu_de: Ngoan. Mày là đứa duy nhất không gây khủng hoảng.
}
-> END

// ------------------------------------------------------------
=== chung_nc_bien_kich ===
# npc:bien_kich # noi_chuyen_vat
~ temp g = chung_goi("bien_kich")
~ temp G = chung_goi_hoa("bien_kich")
~ temp x = chung_xung("bien_kich")
~ temp X = chung_xung_hoa("bien_kich")
~ temp r = RANDOM(1, 4)
{ vai == "bien_kich": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "thuc_tap_sinh" && r <= 2:
    { shuffle:
    - bien_kich: {thuc_tap_sinh}… à, kịch bản đang ổn. Nó… có cảm hứng từ nhiều nguồn. Nhiều lắm.
    - bien_kich: Câu chuyện hôm tháng 9 {thuc_tap_sinh} kể ấy… {thuc_tap_sinh} có kể cho ai khác hông? Hỏi vậy thôi.
    }
- vai == "designer" && r <= 2:
    bien_kich: Poster của bà thiếu nỗi đau. Đừng nhìn tui vậy, tui chỉ góp ý thôi.
- r == 1 && ngay == 26:
    bien_kich: Chiếu thử nội bộ hôm nay. Tay tui run. Đây không phải đạo… đây là run.
- r == 1 && ngay == 27:
    bien_kich: Trailer ra rồi. Tên tui hiện to ghê. To quá. {G} thấy… có to quá hông?
- r == 1 && ngay == 30:
    bien_kich: Mai chiếu mở màn Đại Nhạc Hội. Tui chưa chốt dòng chữ cuối phim. Một dòng thôi mà khó.
- r == 1 && (ngay == 17 || ngay == 18):
    bien_kich: Có ai thấy cuốn sổ bìa da của tui hông? Rơi trên xe. Trong đó… toàn ghi chú thời tiết.
- r == 2 && stress >= 70:
    bien_kich: {G} đang đau hả? Đau là chất liệu. Kể tui nghe, tui trả bằng một ly trà.
- r == 4:
    { shuffle:
    - bien_kich: Mỗi người trong công ty này là một nhân vật. {G} là nhân vật phụ có cái kết bất ngờ.
    - bien_kich: Tui đọc lại bản thảo hôm qua, khóc. Tại hay. Hoặc tại thiếu ngủ.
    - bien_kich: Cảm hứng giống như con mèo. Gọi thì không tới, không gọi thì nằm lên bàn phím.
    - bien_kich: {G} có tin mỗi câu chuyện đều đã được ai đó kể trước rồi hông? Tui tin. Tui an tâm vì vậy.
    - bien_kich: Máy đánh chữ ở nhà tui kêu lách cách như tiếng mưa. Tui viết vì nghe nó.
    - bien_kich: Đạo hay không là do ai kể trước. Mà cái này tui cũng… mượn câu.
    - bien_kich: Phim ngắn của tui dài 15 phút. Sửa 15 lần. Mỗi lần một phút đau.
    - bien_kich: Tui nhìn trời tìm cảm hứng. Hôm nay trời chỉ có mây và một con chim.
    - bien_kich: Viết cho sếp thì phải có chữ "tầm nhìn". Viết cho mình thì phải có chữ "thật".
    - bien_kich: Đây không phải đạo, đây là cảm hứng.
    - bien_kich: Kịch bản này cần thêm nỗi đau.
    - bien_kich: Mây hôm nay giống một cái kết buồn. {G} thấy hông?
    - bien_kich: Nói tiếp đi, tui đang ghi… à không, tui đang nghe.
    - bien_kich: Con mèo Bí nhà tui đọc bản thảo của tui rồi nằm lên nó. Đó là lời phê bình hay nhất.
    - bien_kich: Mực hồng viết lên giấy trông như máu của một bông hồng. Đẹp ha.
    }
- gio < 11:
    { shuffle:
    - bien_kich: Tui tìm cảm hứng trên sân thượng. Sáng nay cảm hứng chưa tới. Chắc kẹt xe.
    - bien_kich: Chín giờ là giờ của nghệ sĩ. Tám giờ là giờ của người bình thường.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - bien_kich: Trưa nay tui ngồi Sống Ảo. Ở đó ai cũng có chuyện để nghe lỏm.
    - bien_kich: Cơm tấm là bi kịch: sườn ngon mà luôn hết trước.
    }
- gio >= 17:
    { shuffle:
    - bien_kich: Tối nay tui về gác mái viết tiếp. Viết về… công ty. À, một công ty hư cấu.
    - bien_kich: Đi chùa hông? Chùa yên tĩnh, ý tưởng tự tới. Hoặc tự quay lại.
    }
- else:
    { shuffle:
    - bien_kich: Chiều nay tui viết phát biểu cho sếp. Sếp muốn có "nỗi đau khởi nghiệp".
    - bien_kich: {G} có câu chuyện nào chưa ai nghe hông? Tui hỏi vì… tò mò.
    }
}
-> END
= ban_cho
{ shuffle:
- bien_kich: …bla bla… **{cho}** …bla… **NỖI ĐAU** … # phu_de: {cho} ơi, ánh mắt mày có nỗi đau. Cho chị ghi lại nha.
- bien_kich: …bla… **SỔ** …bla bla… **TRẢ** … # phu_de: Trả cuốn sổ cho chị. Mày giấu ở đâu rồi?
- bien_kich: …bla bla bla… **NGOAN** … # phu_de: Ngoan. Mày sẽ có một chương riêng.
}
-> END

// ------------------------------------------------------------
=== chung_nc_editor ===
# npc:editor # noi_chuyen_vat
~ temp g = chung_goi("editor")
~ temp G = chung_goi_hoa("editor")
~ temp x = chung_xung("editor")
~ temp X = chung_xung_hoa("editor")
~ temp r = RANDOM(1, 4)
{ vai == "editor": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "quan_ly_idol":
    { shuffle:
    - editor: *(tỉnh hẳn)* Dạ… anh. Anh ăn chưa? À… em hỏi vậy thôi.
    - editor: Video hôm qua… em dựng tiện tay thôi. Không tốn công đâu. Thiệt.
    - editor: Anh uống ít cà phê thôi. Mắt anh thâm hơn mắt em rồi đó.
    }
- vai == "truong_phong" && r <= 2:
    editor: *(ngáp)* Bản export đây anh. Anh trình bày đi. Em… quen rồi.
- vai == "chua_te_deadline" && r <= 2:
    editor: Lần trước ông nói lần cuối. Lần trước nữa cũng vậy. *(thở dài)* Gửi file đi.
- r == 1 && ngay == 8:
    editor: Bị bắt đi khám mắt. Bác sĩ nói mắt tui như mắt cú. Tui coi đó là lời khen.
- r == 1 && ngay == 15:
    editor: Mất điện. Laptop còn 12% pin. Tui dựng được 12% cuộc đời.
- r == 1 && ngay == 29:
    editor: Video kẹt ở 99%. Chín mươi chín. Đó là con số buồn nhất thế giới.
- r == 1 && ngay == 30:
    editor: Đêm nay là đêm trắng cuối cùng. Chắc vậy. Lần nào cũng chắc vậy.
- r == 2 && stress >= 70:
    editor: {G} mệt hả? Ngủ đi. Ban ngày là để ngủ mà.
- r == 2 && nguoi_theo_doi >= 800000:
    editor: Video cuối tui giấu một con cú màu hồng. Ăn mừng.
- r == 4:
    { shuffle:
    - editor: Ngủ ngày cày đêm. Đây không phải lời khuyên. Đây là cuộc đời tui.
    - editor: Mũ len hồng này ấm. Phòng dựng lạnh lắm.
    - editor: Tui không giỏi nói. Tui giỏi cắt. Cắt bớt lời của người khác.
    - editor: Video nào cũng có một khung hình đẹp nhất. Người cũng vậy.
    - editor: Render 73%. Tui đi pha cà phê. Lúc quay lại còn 73%.
    - editor: Có những video dựng xong không gửi cho ai. Để đó thôi.
    - editor: *(ngáp)* Render xong là xong.
    - editor: Đợi render xong…
    - editor: Mỗi video tui giấu một con cú. Tìm được hông?
    - editor: Ban ngày tui là zombie. Đừng hỏi tui gì quan trọng trước 6 giờ chiều.
    - editor: Cốc này ghi "RENDER". Không phải tên. Là trạng thái.
    }
- gio < 11:
    { shuffle:
    - editor: *(ngủ gật đứng)* …Hả? Sáng hả? Tui tưởng còn đêm.
    - editor: Giờ này tui đáng lẽ đang ngủ. Có ai gọi tui hả?
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - editor: Bữa trưa là gì? Tui bỏ bữa. Bữa sáng của tui là 13 giờ.
    - editor: *(ngáp)* Chào buổi… sáng. Với tui là buổi sáng.
    }
- gio >= 17:
    { shuffle:
    - editor: Giờ mới là giờ của tui. Tỉnh như sáo.
    - editor: Tối nay dựng tới 3 giờ. Ở lại hông? Tui chỉ cho cách giấu con cú.
    - editor: Ban đêm công ty đẹp lắm. Không ai họp.
    }
- else:
    { shuffle:
    - editor: Tui đang render. Đừng chạm vào bàn. Bàn rung là file lỗi.
    - editor: Kênh Diu-túp hả? Kênh nào? Tui không có kênh nào. *(đóng tab nhanh)*
    }
}
-> END
= ban_cho
{ shuffle:
- editor: …bla bla… **{cho}** …bla… **NGỦ** … # phu_de: {cho}, ngủ chung dưới bàn dựng hông? Ấm lắm.
- editor: …bla… **CÚ** …bla bla… # phu_de: Mày giống con cú. Ban đêm tỉnh, ban ngày ngủ.
- editor: …bla bla bla… **ĐỪNG** … **DÂY** … # phu_de: Đừng giẫm dây ổ cứng. Đang render.
}
-> END

// ------------------------------------------------------------
=== chung_nc_designer ===
# npc:designer # noi_chuyen_vat
~ temp g = chung_goi("designer")
~ temp G = chung_goi_hoa("designer")
~ temp x = chung_xung("designer")
~ temp X = chung_xung_hoa("designer")
~ temp r = RANDOM(1, 4)
{ vai == "designer": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "hong_hot" && r <= 2:
    { shuffle:
    - designer: Bà ơi trưa nay ăn gì? Tui sửa poster tới lần thứ 15 rồi, cần ăn để sống.
    - designer: Bà kể chuyện gì nữa đó? Kể đi, mà đừng kể chuyện của tui cho ai nha.
    }
- vai == "sales" && r <= 2:
    designer: Hồ sơ "xịn xò" cho deal mới tui làm xong rồi. Bà đừng hỏi tui có thật hông.
- vai == "bien_kich" && r <= 2:
    designer: Nỗi đau hả? Nỗi đau của tui là feedback. Bà viết về cái đó đi.
- vai == "giam_doc" && r <= 2:
    designer: Dạ sếp, bản này đã đủ wow chưa ạ? Hay em sửa lại về bản đầu tiên luôn ạ?
- r == 1 && ngay == 6:
    designer: Buổi chụp poster bị bỏ ngang. Siêu nhân đi giúp bà cụ. Tui thì đi giúp… cái poster.
- r == 1 && ngay == 20:
    designer: Logo 16 năm. Sửa lần thứ 38. Cuối cùng chọn lại logo gốc 2010. Tui hông nói gì. Tui hết nói nổi.
- r == 1 && ngay >= 28 && ngay <= 30:
    designer: Backdrop Đại Nhạc Hội, standee, vé mời. Một ngày. Tui là designer hay là phép màu?
- r == 2 && stress >= 70:
    designer: Stress hả? Tui hiểu. Ngồi đây, tui chỉ {g} vẽ một vòng tròn. Vẽ vòng tròn giảm stress lắm.
- r == 4:
    { shuffle:
    - designer: Feedback cụ thể là "chữ to lên 2px". Feedback không cụ thể là "có hồn hơn".
    - designer: Màu cam công ty và màu hồng chiến dịch đánh nhau trên mọi poster.
    - designer: Logo chữ G bảy màu tui vẽ lại 37 lần. Đừng nhắc.
    - designer: Bút cảm ứng kẹp tai. Đi đâu cũng sẵn sàng bị sửa.
    - designer: Hôm nay tui nói "không" với một feedback. Cảm giác như được tăng lương.
    - designer: Đẹp là chủ quan. Sửa là khách quan. Khách là sếp.
    - designer: Tui có cái tôi nghệ thuật. Nó đang nằm viện.
    - designer: Tui khum vui. Nhưng poster thì vui.
    - designer: Sửa nhẹ thôi là sửa cái gì ạ?
    - designer: Cho xin feedback cụ thể được không ạ?
    - designer: Font này mà anh nói xấu hả?
    - designer: Hết cứu.
    - designer: Chưa đủ wow là bao nhiêu wow? Có đơn vị đo hông?
    - designer: Màu hồng này là hồng phấn, không phải hồng sen. Khác nhau một trời một vực.
    }
- gio < 11:
    { shuffle:
    - designer: Sáng nay mở mail: 4 feedback. Cái nào cũng "sửa nhẹ".
    - designer: Cà phê chưa? Tui chưa. Tui đang sửa poster bằng ý chí.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - designer: Ăn với {hong_hot} hay {sales} đây ta. Ăn với {hong_hot} thì nghe chuyện, ăn với {sales} thì nghe phét.
    - designer: Trưa nay tui khum ăn. Ăn rồi buồn ngủ, buồn ngủ là sửa sai.
    }
- gio >= 17:
    { shuffle:
    - designer: Tối nay tui ra Sống Ảo. Chạy job freelancer. Quán trà sữa. Màu… xanh.
    - designer: Về hông? Tui về tưới cây. Cây là thứ duy nhất không bắt tui sửa.
    }
- else:
    { shuffle:
    - designer: {G} nhìn coi, hai bản này khác nhau hông? Khác 2% đó.
    - designer: Bản final, final_2, final_that_roi, final_that_roi_2. Tui đang mở bản nào ta?
    }
}
-> END
= ban_cho
{ shuffle:
- designer: …bla bla… **{cho}** …bla… **MẪU** … # phu_de: {cho} ơi, làm mẫu cho chị vẽ một tấm nha.
- designer: …bla… **ĐỪNG** … **BÚT** … # phu_de: Đừng tha cây bút cảm ứng của chị!
- designer: …bla bla bla… **HỒNG** … # phu_de: Mày ghét màu hồng hả? Chị cũng hơi hơi.
}
-> END

// ------------------------------------------------------------
=== chung_nc_sales ===
# npc:sales # noi_chuyen_vat
~ temp g = chung_goi("sales")
~ temp G = chung_goi_hoa("sales")
~ temp x = chung_xung("sales")
~ temp X = chung_xung_hoa("sales")
~ temp r = RANDOM(1, 4)
{ vai == "sales": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "designer" && r <= 2:
    { shuffle:
    - sales: Bà ơi, hồ sơ deal mới cần thêm logo tập đoàn. Tập đoàn nào hả? Bà cứ vẽ cho sang là được.
    - sales: Ai đụng bà là đụng tui. No cap.
    }
- vai == "ke_toan" && r <= 2:
    sales: Chị {ke_toan} ơi, tạm ứng xíu thôi. Hóa đơn hả? Hóa đơn… đang trên đường tới. Kẹt xe.
- vai == "giam_doc" && r <= 2:
    sales: Sếp ơi, tối nay đi nhậu với đối tác hông? Đối tác này chắc kèo! Tin em đi!
- r == 1 && ngay == 2:
    sales: Ba nhà tài trợ, hai tỷ, Tập đoàn BTT Global! Mr. Kevin Trộn là bạn thân của {x} đó!
- r == 1 && ngay == 13:
    sales: Giải "Doanh nhân của năm" của sếp hả? Do {x} mang về. Đừng hỏi in ở đâu.
- r == 1 && (ngay == 17 || ngay == 18):
    sales: Tối qua {x} có hứa mời ca sĩ nổi tiếng nhất nước hả? *(nuốt nước bọt)* …Thì mời. Mời được mà.
- r == 1 && ngay == 27:
    sales: Có bên "Sữa Chua Hồng Hào" gọi mời tài trợ 1 tỷ. Thiệt! Lần này thiệt! Sao không ai tin {x} hết vậy?
- r == 2 && stress >= 70:
    sales: Sao mà căng! Ngồi xuống, {x} kể chuyện deal 5 tỷ cho nghe, nghe xong là thấy đời đẹp liền.
- r == 2 && nguoi_theo_doi >= 800000:
    sales: Tám trăm nghìn! Giờ mới là lúc gọi tài trợ thật nè! Thật thật luôn!
- r == 4:
    { shuffle:
    - sales: Mr. Kevin Trộn hả? Ổng bận lắm. Bận nhất thế giới.
    - sales: Danh thiếp {x} in nhũ vàng. Chức danh dài ba dòng.
    - sales: Chị nói thật nha. Lần này thật. Lần trước cũng thật, mà không ai tin.
    - sales: {G} biết bí quyết của sales hông? Tự tin. Và không bao giờ nhìn bảng KPI thật.
    - sales: Son hồng này hợp với mọi deal.
    - sales: Người ta nói {x} nói phét. {x} gọi đó là "tầm nhìn chiến lược".
    - sales: Điện thoại {x} áp tai cả ngày. Có khi không có ai ở đầu dây.
    - sales: Tin chị đi, deal này chắc kèo!
    - sales: Chị quen hết mà.
    - sales: Deal này chắc chắn 100%. Có thể 98%. Thôi 30%.
    - sales: Để tối nay chị nhậu với bên đó.
    - sales: KPI tháng này {x} đạt 300%. Trên giấy. Giấy đẹp lắm.
    - sales: Túi này hàng hiệu đó. Hiệu… gì cũng được, miễn sang.
    }
- gio < 11:
    { shuffle:
    - sales: Sáng nay {x} gọi 14 cuộc. Ba cuộc có người bắt máy. Một cuộc là mẹ {x}.
    - sales: Chào buổi sáng! Hôm nay ngày đẹp để chốt deal!
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - sales: Ăn trưa với {designer}. Đừng ngồi chung, tụi tui bàn chuyện… chiến lược.
    - sales: Ăn mì gói trưa nay. Dưỡng sinh. Không phải hết tiền.
    }
- gio >= 17:
    { shuffle:
    - sales: Tối nay quán Ốc Đêm, tiếp khách. Khách là… sẽ có khách.
    - sales: Về căn hộ Sky Ảo. Căn hộ sang lắm. Tủ lạnh thì… tối giản.
    }
- else:
    { shuffle:
    - sales: Chiều nay đi gặp đối tác. Đối tác là quán cà phê. Ngồi để suy nghĩ.
    - sales: Tui nhỏ nhất công ty mà nói chuyện lớn nhất công ty. Đó là năng lực.
    }
}
-> END
= ban_cho
{ shuffle:
- sales: …bla bla… **{cho}** …bla… **ĐẠI SỨ** … # phu_de: {cho} ơi, làm đại sứ thương hiệu cho chị nha! Thù lao: một cây xúc xích. Chắc kèo!
- sales: …bla… **ĐỪNG** … **TÚI** … # phu_de: Đừng cắn túi chị! Túi hiệu đó! …Hiệu nhái loại một.
- sales: …bla bla bla… **TIN CHỊ** … # phu_de: Tin chị đi.
}
-> END

// ------------------------------------------------------------
=== chung_nc_chi_dai ===
# npc:chi_dai # noi_chuyen_vat
~ temp g = chung_goi("chi_dai")
~ temp G = chung_goi_hoa("chi_dai")
~ temp x = chung_xung("chi_dai")
~ temp X = chung_xung_hoa("chi_dai")
~ temp r = RANDOM(1, 4)
{ vai == "chi_dai": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "thanh_ninh":
    { shuffle:
    - chi_dai: *(liếc)* Ừ. Chào.
    - chi_dai: Sếp đâu? Đi theo sếp đi. Đừng đứng đây.
    - chi_dai: Nịnh vừa thôi. Người ta nói sau lưng em nhiều lắm đó. …Chị nói vậy là vì chị thấy, không phải vì chị quan tâm.
    }
- vai == "thuc_tap_sinh":
    { shuffle:
    - chi_dai: {thuc_tap_sinh}, ăn chưa? Ai bắt em làm gì quá sức thì chỉ mặt chị.
    - chi_dai: Đừng cúi chào chị nữa. Em lớn bằng chị mà. Đứng thẳng lên.
    - chi_dai: Tối nay về nhà chị ăn cơm. Chị nấu canh chua.
    }
- vai == "ke_toan" && r <= 2:
    chi_dai: Bà lại không ngủ hả? Mắt bà thâm như mắt {editor} rồi. Nói chị nghe, chuyện gì?
- vai == "giam_doc" && r <= 2:
    chi_dai: Sếp. Ngân sách Đại Nhạc Hội. Em hỏi lần cuối. "Tùy em" là bao nhiêu tiền?
- r == 1 && ngay == 4:
    chi_dai: Tắm cho {cho} xong rồi. Nó chỉ cho {x} tắm thôi. Người khác thì nó cắn.
- r == 1 && ngay == 15:
    chi_dai: Kẹt thang máy với sếp 40 phút. Sếp kể chuyện khởi nghiệp. {X} suýt phá cửa ra.
- r == 1 && ngay == 24:
    chi_dai: Hôm nay hội nghị hòa giải. Ai không hòa thì ngồi đó tới khi hòa. {X} giữ cửa.
- r == 1 && ngay >= 29:
    chi_dai: *(bộ đàm)* Sân khấu đâu? Đèn đâu? Ai đụng cầu dao? …À {g}. Ăn chưa? Ăn đi rồi phụ chị.
- r == 2 && stress >= 70:
    chi_dai: Mặt sao vậy? Ai làm {g} khóc? Chỉ mặt {x}.
- r == 2 && no < 30:
    chi_dai: Bụng kêu kìa. Ăn cơm chưa? Chưa hả? Đi. Ngay.
- r == 4:
    { shuffle:
    - chi_dai: Cái xăm con hổ hả? Kỷ niệm thời trẻ. Đừng hỏi.
    - chi_dai: Ai mà dám bắt nạt người mới thì nhớ mặt chị.
    - chi_dai: Đại Nhạc Hội mà sập là chị không tha cho ai. Kể cả cái loa.
    - chi_dai: Đứa nào làm em khóc, chỉ mặt chị.
    - chi_dai: Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
    - chi_dai: Nói một là một. Hỏi lại là hai.
    - chi_dai: Bộ đàm này dán sticker hồng. Nội quy. Đừng cười.
    - chi_dai: Hồi trẻ {x} cũng có tiếng ở quận này. Giờ {x} chỉ làm sự kiện thôi.
    - chi_dai: Quán Ốc Đêm hả? Ừ. {X} có kỷ niệm ở đó. Không kể được.
    }
- gio < 11:
    { shuffle:
    - chi_dai: Sáng nay chạy bộ 5 cây. {G} chạy chưa? Chưa hả? Mai chạy với chị.
    - chi_dai: Kho sự kiện có ai đụng vô hông? Có thì nói. Không nói thì chị cũng biết.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - chi_dai: Ra cơm tấm. Ngồi đầu bàn với chị. Ai giành chỗ chị xử.
    - chi_dai: Ăn thêm miếng chả đi, ốm nhom vậy làm sao bê loa?
    }
- gio >= 17:
    { shuffle:
    - chi_dai: Tối nay đi gym. Đấm bao cát. Tưởng tượng là… thôi, không nói.
    - chi_dai: Về nhà chị ăn cơm hông? Nhà số 45. Có bao cát giữa sân, đừng sợ.
    }
- else:
    { shuffle:
    - chi_dai: Chiều nay khảo sát sân khấu. Bãi đất trống, một cột điện, với ếch. Nhiều ếch.
    - chi_dai: Đừng đứng không vậy. Phụ chị khiêng cái loa.
    }
}
-> END
= ban_cho
{ shuffle:
- chi_dai: …bla bla… **{cho}** …bla… **TẮM** … # phu_de: {cho}, chủ nhật tắm nha. Chỉ chị tắm được mày thôi.
- chi_dai: …bla… **NGOAN** …bla bla… **XÚC XÍCH** … # phu_de: Ngoan, giữ cổng giùm chị, tối chị mua xúc xích.
- chi_dai: …bla bla bla… **CẮN** … **LÁ CHUỐI** … # phu_de: Thấy ai mặc vest trắng, mùi lá chuối, thì cắn. Chị cho phép.
}
-> END

// ------------------------------------------------------------
=== chung_nc_dan_dau_tu ===
# npc:dan_dau_tu # noi_chuyen_vat
~ temp g = chung_goi("dan_dau_tu")
~ temp G = chung_goi_hoa("dan_dau_tu")
~ temp x = chung_xung("dan_dau_tu")
~ temp X = chung_xung_hoa("dan_dau_tu")
~ temp r = RANDOM(1, 4)
{ vai == "dan_dau_tu": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "con_ong_chau_cha" || vai == "sales" || vai == "it" || vai == "bac_bao_ve" || vai == "thanh_xin_nghi" || vai == "thuc_tap_sinh" || vai == "bien_kich" || vai == "idol_het_thoi":
    { r <= 2:
        { shuffle:
        - dan_dau_tu: Ủa {g}! Tiền hả? Tuần sau. Tuần sau là lên thật. {X} thề với cái nến xanh.
        - dan_dau_tu: {X} nhớ mà. {X} có sổ. Tên {g} ở trang đầu. À, trang… gần đầu.
        }
    - else:
        dan_dau_tu: Chào {g}! Hôm nay trời đẹp ha, đẹp như… cái chart tuần sau.
    }
- r == 1 && ngay == 9:
    dan_dau_tu: Có đồng coin mới tên "Hồng Coin" nè. Mang tên Siêu Nhân Hồng. Đây là định mệnh!
- r == 1 && ngay == 17:
    dan_dau_tu: x10! X MƯỜI! Tối nay {x} bao cả team hải sản! Lần này là lên thật!
- r == 1 && ngay >= 18 && ngay <= 20:
    dan_dau_tu: *(nhìn xa xăm)* Về 0. Người tạo biến mất. Còn cái nịt. Mà bữa hải sản ngon ha.
- r == 1 && ngay == 31:
    dan_dau_tu: Tối nay {x} chỉ coi một con số: người theo dõi. Lần đầu tiên {x} mong số lên mà không phải vì tiền.
- r == 2 && stress >= 70:
    dan_dau_tu: Stress hả? Coi chart đi. Thấy người khác lỗ nhiều hơn mình là đỡ liền.
- r == 2 && nguoi_theo_doi >= 800000:
    dan_dau_tu: Số liệu đẹp! Đồ thị người theo dõi là cái đồ thị duy nhất {x} từng thấy đi lên thật.
- r == 2 && nguoi_theo_doi < 500000 && ngay >= 14:
    dan_dau_tu: Theo phân tích của {x}, mình cần đăng clip vào 20 giờ tối thứ năm. Số liệu không biết nói dối. Chỉ có {x} biết.
- r == 4:
    { shuffle:
    - dan_dau_tu: {G} tin vào số liệu hông? {x} tin. Số liệu chỉ không tin {x} thôi.
    - dan_dau_tu: Phân tích lượt xem thì {x} giỏi nhất công ty. Phân tích ví mình thì… còn học.
    - dan_dau_tu: Mỗi lần {x} bán là nó lên. Mỗi lần {x} mua là nó xuống. Thị trường để ý {x} ghê.
    - dan_dau_tu: Sổ nợ này dày hơn sổ tiết kiệm. Mà sổ tiết kiệm thì không có.
    - dan_dau_tu: Cửa sau công ty có khe hàng rào vừa người. {x} biết vì {x} đo rồi.
    - dan_dau_tu: Ngày 8 tháng 8 là sinh nhật {x}. {idol_het_thoi} phát. Năm nay chưa phát.
    - dan_dau_tu: Biểu đồ người theo dõi của Siêu Nhân Hồng là biểu đồ đẹp nhất {x} từng thấy.
    - dan_dau_tu: Lần này là lên thật.
    - dan_dau_tu: Sắp x10 rồi.
    - dan_dau_tu: Đây là đáy, đáy thật rồi.
    - dan_dau_tu: Cắt lỗ là thua.
    - dan_dau_tu: Vòng tay đá hồng này chiêu tài. Chiêu được 20 nghìn hôm qua. Lượm ngoài đường.
    - dan_dau_tu: {G} có biết đọc nến hông? Nến xanh là vui, nến đỏ là… học phí.
    }
- gio < 11:
    { shuffle:
    - dan_dau_tu: Suỵt. Hôm nay {x} đi cửa sau. Có ai hỏi thì nói không thấy {x}.
    - dan_dau_tu: Sáng nay thị trường mở cửa. {X} cũng mở. Mở mắt.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - dan_dau_tu: Bánh mì. Ăn lén. Chủ nợ đi ăn cơm tấm thì {x} ăn bánh mì.
    - dan_dau_tu: Bữa trưa là chi phí cố định. {X} đang tối ưu chi phí cố định.
    }
- gio >= 17:
    { shuffle:
    - dan_dau_tu: Tối nay quán bida. Đánh với {chua_te_deadline}. Thua là trả trà đá. Thua hoài.
    - dan_dau_tu: Ghé chùa hông? Cầu cho chart. À, cầu cho mọi người. Có chart.
    }
- else:
    { shuffle:
    - dan_dau_tu: Báo cáo số liệu chiến dịch nè. Cái này {x} làm thật. Đẹp hông?
    - dan_dau_tu: Ba giờ chiều là giờ "đu đỉnh". Đừng ai mua gì lúc ba giờ.
    }
}
-> END
= ban_cho
{ shuffle:
- dan_dau_tu: …bla bla… **{cho}** …bla… **LÊN** … # phu_de: {cho}, mày vẫy đuôi là chart lên. Vẫy đi!
- dan_dau_tu: …bla… **XÚC XÍCH** … **TUẦN SAU** … # phu_de: Xúc xích hả? Tuần sau anh mua. Tuần sau là lên thật.
- dan_dau_tu: …bla bla bla… **ĐỪNG** … **BÁC** … # phu_de: Đừng dẫn bác ra đây. Anh đang… né chút.
}
-> END

// ------------------------------------------------------------
=== chung_nc_thanh_xin_nghi ===
# npc:thanh_xin_nghi # noi_chuyen_vat
~ temp g = chung_goi("thanh_xin_nghi")
~ temp G = chung_goi_hoa("thanh_xin_nghi")
~ temp x = chung_xung("thanh_xin_nghi")
~ temp X = chung_xung_hoa("thanh_xin_nghi")
~ temp r = RANDOM(1, 4)
{ vai == "thanh_xin_nghi": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "hr":
    { shuffle:
    - thanh_xin_nghi: *(ho khụ khụ)* Dạ… anh. Em hơi sốt. Mà em vẫn đi làm nè anh.
    - thanh_xin_nghi: Dạ bà ngoại em khỏe rồi anh. Khỏe lắm. Chắc tuần sau lại… à không có gì.
    - thanh_xin_nghi: Dạ uống trà hả anh? Dạ… dạ em vừa uống thuốc, không uống trà được.
    }
- vai == "quan_ly_idol" && r <= 2:
    thanh_xin_nghi: Anh {quan_ly_idol}, lịch tuần này em xếp xong rồi. Em có mặt… ba ngày. Ba ngày rưỡi.
- r == 1 && ngay == 14:
    thanh_xin_nghi: *(giọng khỏe re)* Ủa {g}. Không, hôm nay {x} về quê gặt lúa. Mặc kim tuyến gặt lúa. Mốt mà.
- r == 1 && ngay == 25:
    thanh_xin_nghi: Tối nay {x} có… việc. Việc gia đình. Nhà {x} có tivi. Đừng coi kênh Tivi Hóng nha.
- r == 1 && ngay >= 30:
    thanh_xin_nghi: Mai 8 giờ tối {x} bận. Bận lắm. Đại Nhạc Hội hả? {X}… {X} tới sau. Hoặc coi qua tivi.
- r == 2 && stress >= 70:
    thanh_xin_nghi: Mệt quá thì xin nghỉ đi. {X} chỉ cho. Bí quyết là: đừng xài bà ngoại, bà ngoại {x} giữ bản quyền.
- r == 4:
    { shuffle:
    - thanh_xin_nghi: Bà ngoại {x} khỏe lắm. Bà nói {x} đừng lấy bà ra làm lý do nữa.
    - thanh_xin_nghi: {X} đang nghĩ lý do cho tuần sau. Có ý tưởng gì hông?
    - thanh_xin_nghi: Giọng {x} khàn vì… vì nói nhiều. Không phải hát.
    - thanh_xin_nghi: Đi làm đủ ngày một tuần là kỷ lục của {x}. Năm 2024.
    - thanh_xin_nghi: {X} có giấy khám bệnh. Bác sĩ ghi "khỏe re". {x} đang tìm cách giải thích.
    - thanh_xin_nghi: Ho nhẹ khi gặp HR là phản xạ. Không kiểm soát được.
    - thanh_xin_nghi: Có những ước mơ phải giấu. Như giấu giấy nghỉ ốm.
    - thanh_xin_nghi: Nhà {x} ở Ven Đô, gió mát, có vườn. Ngồi đó hát… à nói chuyện với cây.
    - thanh_xin_nghi: Nếu một ngày {x} lên tivi, {g} có nhận ra hông?
    - thanh_xin_nghi: Hôm nay em xin phép nghỉ ạ, bà ngoại em… à, {x} tập trước thôi.
    - thanh_xin_nghi: *(khụ khụ)* {X} hơi sốt. Nhẹ thôi. Đủ để về sớm.
    - thanh_xin_nghi: Nhà {x} có việc đột xuất. Ngày nào cũng đột xuất.
    - thanh_xin_nghi: Khẩu trang hồng này đẹp hông? Che được nửa mặt, phòng khi lên tivi… à không.
    - thanh_xin_nghi: Phòng khám Khỏe Re có thẻ thành viên hông ta? {X} hỏi vậy thôi.
    - thanh_xin_nghi: Lý do xin nghỉ hôm nay: "Xe hư vì xe buồn". Được hông?
    }
- gio < 11:
    { shuffle:
    - thanh_xin_nghi: Ủa {g} thấy {x} hả? Hôm nay {x} có đi làm. Hiếm lắm, chụp hình đi.
    - thanh_xin_nghi: *(giọng khàn)* Sáng… {X} đang ốm… nhưng {x} vẫn tới. Nhớ nói với HR nha.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - thanh_xin_nghi: Trưa nay {x} ra phòng khám. Lần thứ chín. Bác sĩ nhớ tên {x} rồi.
    - thanh_xin_nghi: Ăn trưa nhẹ thôi, chiều {x} còn… luyện giọng. Ý là ho cho đúng tông.
    }
- gio >= 17:
    { shuffle:
    - thanh_xin_nghi: Tối nay {x} ở Ven Đô. Ở nhà. Ngủ sớm. Thiệt. Không có cà phê Sống Ảo gì hết.
    - thanh_xin_nghi: {G} có nghe ai hát ở Sống Ảo cuối tuần chưa? Nghe nói hay lắm. Nghe nói thôi.
    }
- else:
    { shuffle:
    - thanh_xin_nghi: Lịch nghệ sĩ tuần sau {x} xếp xong rồi. Lịch của {x} thì… để tính.
    - thanh_xin_nghi: Áo len giữa trời 34 độ hả? Phòng khi sếp hỏi sao {x} đổ mồ hôi.
    }
}
-> END
= ban_cho
{ shuffle:
- thanh_xin_nghi: …bla bla… **{cho}** …bla… **ĐỪNG** … **SỦA** … # phu_de: {cho}, đừng sủa, anh đang trốn HR.
- thanh_xin_nghi: …bla… **HÁT** …bla bla… # phu_de: Nghe anh hát thử nè. Đừng hú theo.
- thanh_xin_nghi: …bla bla bla… **BÍ MẬT** … # phu_de: Mày giữ bí mật giùm anh nha. Mày là chó, mày không kể ai được.
}
-> END

// ------------------------------------------------------------
=== chung_nc_bac_bao_ve ===
# npc:bac_bao_ve # noi_chuyen_vat
~ temp g = chung_goi("bac_bao_ve")
~ temp G = chung_goi_hoa("bac_bao_ve")
~ temp r = RANDOM(1, 4)
{ vai == "bac_bao_ve": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "giam_doc" && r <= 2:
    { shuffle:
    - bac_bao_ve: Anh {giam_doc} đến sớm thế. Uống chén trà đã rồi lên.
    - bac_bao_ve: Ừ. Bác thấy anh dạo này ngủ ít. Đừng nhắn tin muộn quá.
    }
- vai == "sieu_nhan_hong" && r <= 2:
    { shuffle:
    - bac_bao_ve: Cậu {sieu_nhan_hong}. Đỗ xe cho thẳng. Và tha cho con chó.
    - bac_bao_ve: Bộ đồ ấy nóng không? Ngồi đây uống chén trà đá cho mát.
    }
- vai == "dan_dau_tu" && r <= 2:
    bac_bao_ve: {dan_dau_tu} à. Hai triệu. Bác không đòi. Bác chỉ nhắc cho cháu nhớ.
- vai == "it" && r <= 2:
    bac_bao_ve: {it}. Tối nay ốc nhé. Bác trả. Lần trước cháu trả rồi.
- r == 1 && ngay == 1:
    bac_bao_ve: Mừng bác làm gì. Thôi, vào làm đi, muộn giờ chấm công.
- r == 1 && ngay == 10:
    bac_bao_ve: Hôm nay ngày Giải phóng Thủ đô. Bác nhớ Hà Nội. Ừ… thế thôi.
- r == 1 && ngay == 4:
    bac_bao_ve: Hôm nay nó bị tắm, bị mặc áo, bị đội nơ. Đừng trêu nó nữa.
- r == 1 && ngay == 20:
    bac_bao_ve: Mười sáu năm rồi. Hồi ấy bác 34 tuổi. *(sờ túi áo ngực)* Ừ… thế thôi.
- r == 1 && ngay == 27:
    bac_bao_ve: Có người mặc vest trắng hỏi cổng. Bác bảo chưa mở. Cổng thì mở. Nhưng bác bảo chưa.
- r == 2 && stress >= 70:
    bac_bao_ve: Ngồi xuống. Uống chén trà. Chuyện gì cũng để sau chén trà.
- r == 4:
    { shuffle:
    - bac_bao_ve: Ai đối xử tốt với con chó thì bác nhớ.
    - bac_bao_ve: Bác đứng cổng mười sáu năm. Người đến, người đi. Cổng vẫn thế.
    - bac_bao_ve: Bác không thấy gì đâu.
    - bac_bao_ve: Ừ…
    - bac_bao_ve: Thế à.
    - bac_bao_ve: Chuyện người ta, bác không biết đâu.
    - bac_bao_ve: Đi chậm thôi cháu. Đi chậm thì mới thấy đường.
    - bac_bao_ve: Trà đá 3 nghìn một cốc. Ở chòi bác thì không mất tiền.
    }
- gio < 11:
    { shuffle:
    - bac_bao_ve: 6 giờ 30 bác mở cổng. Cháu đến sớm thế, tốt.
    - bac_bao_ve: Xe dựng chỗ râm kia. Trưa nắng, yên xe nóng lắm.
    - bac_bao_ve: Radio sáng nay báo mưa chiều. Mang áo mưa đi.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - bac_bao_ve: Cơm hộp. Ăn ở chòi. Có radio, có con chó. Đủ rồi.
    - bac_bao_ve: Cháu ăn chưa? Ăn đi. Đi làm mà nhịn là không được.
    }
- gio >= 17:
    { shuffle:
    - bac_bao_ve: Về cẩn thận. Đường Đại Lộ giờ này đông lắm.
    - bac_bao_ve: 9 giờ bác ngủ. Ai về muộn thì gõ cửa chòi nhẹ thôi.
    - bac_bao_ve: Cuối tuần bác về Ven Đô, đánh cờ với ông Ba. Ông ấy thắng nhiều hơn.
    }
- else:
    { shuffle:
    - bac_bao_ve: Chiều rồi. Trà nguội rồi. Bác pha ấm mới.
    - bac_bao_ve: Có thư đến. Không phải của cháu. Ừ.
    }
}
-> END
= ban_cho
{ shuffle:
- bac_bao_ve: …bla bla… **{cho}** …bla… **NGOAN** … # phu_de: {cho}. Ngoan. Nằm đây với bác.
- bac_bao_ve: …bla… **XÚC XÍCH** …bla bla… **CHỜ** … # phu_de: Xúc xích thì chờ lương về đã. Đừng nhìn bác thế.
- bac_bao_ve: …bla bla bla… **ĐI DẠO** … # phu_de: Chiều mát rồi, bác dắt đi dạo một vòng.
- bac_bao_ve: …bla… **KHÔNG** … **SHIPPER** … # phu_de: Không được cắn shipper. Người ta đi làm cả.
}
-> END

// ------------------------------------------------------------
=== chung_nc_sieu_nhan_hong ===
# npc:sieu_nhan_hong # noi_chuyen_vat
~ temp g = chung_goi("sieu_nhan_hong")
~ temp G = chung_goi_hoa("sieu_nhan_hong")
~ temp x = chung_xung("sieu_nhan_hong")
~ temp X = chung_xung_hoa("sieu_nhan_hong")
~ temp r = RANDOM(1, 4)
{ vai == "sieu_nhan_hong": -> chung_nc_tu_noi }
{ vai == "cho": -> ban_cho }
{
- vai == "chua_te_deadline":
    { shuffle:
    - sieu_nhan_hong: {chua_te_deadline}! Ăn chưa? *(ngừng tạo dáng giữa chừng)* …À, ờm, anh hỏi vậy thôi. Không phải PR.
    - sieu_nhan_hong: Em… em ngủ đủ hông? Mắt em thâm quá. Gối hồng có êm hông?
    - sieu_nhan_hong: Hồng không phải màu, hồng là… *(quên lời)* …là… em có rảnh tối nay hông?
    - sieu_nhan_hong: Bánh mì trên bàn em là của… một người. Người đó không có camera. Thiệt.
    }
- vai == "ran_doc" && r <= 2:
    { shuffle:
    - sieu_nhan_hong: {ran_doc}! Tên em quen quen ghê. Hồi nhỏ em ở đâu vậy?
    - sieu_nhan_hong: Tay em khỏe dữ! Bắt tay hôm đầu tới giờ anh còn ê.
    }
- vai == "idol_het_thoi" && r <= 2:
    sieu_nhan_hong: Anh {idol_het_thoi}! "Công Viên" hay quá trời! Anh dạy em hát đi! Em hát toàn ra "khoai chiên".
- vai == "bac_bao_ve" && r <= 2:
    sieu_nhan_hong: Bác ơi! Hôm nay con hông chọc {cho} nha. Chọc chút xíu thôi. Một chút.
- r == 1 && ngay == 1:
    sieu_nhan_hong: Từ hôm nay mình là đồng đội! Biến hình! Vì công lý và lượt view!
- r == 1 && ngay == 4:
    sieu_nhan_hong: {cho} đội nơ hồng kìa! Giống anh ghê! Sao nó nhìn anh như vậy?
- r == 1 && ngay == 6:
    sieu_nhan_hong: Xin lỗi vụ bỏ buổi chụp nha! Bà cụ kẹt xe lăn ở lề đường, anh hông đứng yên được.
- r == 1 && ngay == 16:
    sieu_nhan_hong: Gameshow hôm nay! Nếu MC hỏi tháo mũ… *(im lặng)* …thì anh tạo dáng.
- r == 1 && ngay == 23:
    sieu_nhan_hong: Hôm nay anh 31 tuổi! Bánh kem hồng ba tầng! *(nhìn về phía cổng)* …{cho} có biết hông ta?
- r == 1 && ngay >= 27 && ngay <= 30:
    { nguyen_theo_ll:
        sieu_nhan_hong: *(không tạo dáng)* …Anh xin lỗi. Anh… anh chọn rồi. Đừng giận anh nha.
    - else:
        sieu_nhan_hong: Bên kia có tòa nhà 20 tầng. Bên này có con chó ghét anh. Anh chọn bên có con chó.
    }
- r == 2 && stress >= 70:
    sieu_nhan_hong: {G} buồn hả? Có cần siêu nhân hông? Anh đẩy xe, gỡ diều, nghe tâm sự, đủ hết!
- r == 2 && nguoi_theo_doi >= 800000:
    sieu_nhan_hong: Tám trăm nghìn người! Mà… có ai trong đó biết tên thật của anh hông ta?
- r == 2 && nguoi_theo_doi < 200000 && ngay >= 14:
    sieu_nhan_hong: *(nhỏ giọng)* Chắc người ta hông thích anh lắm ha. Thôi, anh đi giúp người. Giúp người thì hông cần ai thích.
- r == 4:
    { shuffle:
    - sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ!
    - sieu_nhan_hong: Biến hình!
    - sieu_nhan_hong: Vì công lý và lượt view!
    - sieu_nhan_hong: Gét gô! *(tạo dáng)* Slay chưa?
    - sieu_nhan_hong: Anh mới đẩy xe giùm ba người. Xe anh thì hết xăng. Chuyện thường.
    - sieu_nhan_hong: Bánh chuối chiên trong phòng chờ nè, ăn đi! Điều khoản số 4 đó!
    }
- gio < 11:
    { shuffle:
    - sieu_nhan_hong: Chào buổi sáng! Anh tới bằng xe hồng! Đỗ… hơi chéo. Xin lỗi bác {bac_bao_ve}.
    - sieu_nhan_hong: Sáng nay anh dắt hai cụ qua đường. Một cụ hông muốn qua. Anh dắt về lại.
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - sieu_nhan_hong: Ăn trưa chung hông? Bàn 12 ghế ở nhà anh… à, ở đây có ghế nhựa, vui hơn.
    - sieu_nhan_hong: Anh ăn trưa trong phòng chờ. Một mình. Mà có bánh chuối chiên nên… gần như hông một mình.
    }
- gio >= 17:
    { shuffle:
    - sieu_nhan_hong: Tối rồi! Anh đi giúp người đây. Đừng theo xe hồng nha!
    - sieu_nhan_hong: Về nhà hả? Nhà {g} có ai chờ hông? Có hả? Vui ghê.
    }
- else:
    { shuffle:
    - sieu_nhan_hong: Chiều nay quay quảng cáo! Hoặc đi giúp người. Tùy coi ai cần trước.
    - sieu_nhan_hong: *(tháo găng tay ra lau mồ hôi, vội đeo lại)* Nóng ghê. Bộ đồ này hông có quạt.
    }
}
-> END
= ban_cho
{ shuffle:
- sieu_nhan_hong: Gâu! Gâu gâu! …bla bla… **{cho}** …bla… **HỒNG** … # phu_de: Gâu! {cho} ơi, nhìn anh nè, hôm nay anh hồng hơn hôm qua!
- sieu_nhan_hong: …bla… **CON GÀ** …bla bla… **ĐÂU** … # phu_de: Con gà cao su của em đâu rồi ta? Anh hông biết đâu nha. *(huýt sáo)*
- sieu_nhan_hong: …bla bla bla… **NGOAN** … **XIN LỖI** … # phu_de: Ngoan… anh xin lỗi. Anh chỉ muốn chơi với em thôi.
- sieu_nhan_hong: Gâu gâu gâu! …bla… # phu_de: ({sieu_nhan_hong} đang sủa sai giọng. Rất sai.)
}
-> END

// ------------------------------------------------------------
// Tuất chỉ sủa. Thẻ # phu_de: là cảm xúc thật của Tuất.
=== chung_nc_cho ===
# npc:cho # noi_chuyen_vat
~ temp r = RANDOM(1, 4)
{ vai == "cho": -> chung_nc_tu_noi }
{
- vai == "sieu_nhan_hong":
    { shuffle:
    - cho: GRỪ… *(lông dựng, nhe răng)* # phu_de: Mày. Bộ đồ hồng. Đứng yên đó.
    - cho: GÂU GÂU GÂU! # phu_de: Trả con gà đây!
    - cho: Gâu! *(nhảy lên đớp mũ)* # phu_de: Cái mũ đó trông ngon lắm.
    - cho: Hừ. *(quay lưng, ngồi xuống)* # phu_de: Thân chưa mà giỡn.
    - cho: Grừ… *(nhìn găng tay)* # phu_de: Một chiếc găng tay của mày đang ở kho tao. Tao nhắc thôi.
    }
- vai == "bac_bao_ve":
    { shuffle:
    - cho: Gâu! *(vẫy đuôi tít mù)* # phu_de: Bác! Bác! Bác về rồi!
    - cho: Ư ử… *(gác cằm lên dép tổ ong)* # phu_de: Ngồi đây với bác.
    - cho: Gâu? *(nhìn ấm trà)* # phu_de: Hôm nay có bánh bao hông bác?
    - cho: *(nằm ngửa)* # phu_de: Gãi bụng đi bác.
    }
- (vai == "thuc_tap_sinh" || vai == "chi_dai") && r <= 2:
    { shuffle:
    - cho: Gâu gâu! *(chạy vòng quanh)* # phu_de: Người tốt tới rồi!
    - cho: *(dụi đầu vào chân)* # phu_de: Thơm mùi xúc xích. Hoặc mùi người tốt. Giống nhau.
    }
- r == 1 && ngay == 4:
    cho: Grừ… *(đội nơ hồng, mặt cực kỳ không vui)* # phu_de: Đừng. Nhìn. Tao.
- r == 1 && ngay == 15:
    cho: Ẳng… *(nép dưới bàn pantry)* # phu_de: Tối quá. Ai đó làm rơi bánh đi.
- r == 1 && ngay == 23:
    cho: *(hít hít, mắt nhìn chằm chằm về phía cái bánh kem)* # phu_de: Bánh. Hồng. To. Hông ai canh.
- r == 1 && ngay == 27:
    cho: Grừ… *(hít về phía cổng)* # phu_de: Mùi lá chuối. Mùi tiền mới. Kẻ lạ.
- r == 1 && ngay == 29:
    cho: *(ngậm một khúc dây mạng, vẫy đuôi)* # phu_de: Tìm được rồi… à không, đây là dây. Gà đâu?
- r == 2 && qh_cho >= 50:
    { shuffle:
    - cho: Gâu! *(đặt một chiếc tất xuống chân bạn)* # phu_de: Quà nè. Lượm ở tầng 2.
    - cho: *(nằm ngửa giữa hành lang)* # phu_de: Mày được phép gãi bụng tao.
    }
- r == 2 && qh_cho <= -20:
    cho: Grừ… # phu_de: Tao nhớ mày. Không phải theo nghĩa tốt.
- r == 2 && co(xuc_xich):
    cho: Ẳng… *(ngồi ngay ngắn, mắt long lanh)* # phu_de: Tao ngửi thấy rồi. Trong túi trái. Đừng chối.
- r == 4:
    { shuffle:
    - cho: Gâu. # phu_de: Chào.
    - cho: Gâu gâu! # phu_de: Đói.
    - cho: Gâu? *(nghiêng đầu)* # phu_de: Mày nói gì? Có từ "ăn" hông?
    - cho: Hắt xì! # phu_de: Ai xịt nước hoa vậy trời.
    - cho: *(đi một vòng quanh chân bạn, ngửi)* # phu_de: Mày vừa ăn cơm tấm. Có chả. Không chia tao.
    - cho: *(ngáp to)* # phu_de: Chuyện người chán quá.
    }
- gio < 11:
    { shuffle:
    - cho: Gâu! Gâu! *(chạy ra cổng)* # phu_de: Có tiếng xe! Shipper? SHIPPER?
    - cho: *(ngồi cạnh máy chấm công)* # phu_de: Mày trễ 2 phút. Tao thấy.
    - cho: Gâu. *(đuôi đập xuống đất hai cái)* # phu_de: Buổi sáng. Tốt. Có bánh mì hông?
    }
- gio >= 11 && gio < 14:
    { shuffle:
    - cho: Ẳng… *(nhìn hộp cơm)* # phu_de: Một miếng thôi. Một miếng là tình bạn.
    - cho: *(nằm dưới bàn pantry, mắt mở hé)* # phu_de: Tao đang ngủ. Mà ai làm rơi đồ ăn là tao biết.
    }
- gio >= 17:
    { shuffle:
    - cho: Gâu! *(ngậm dây xích)* # phu_de: Đi dạo! Đi dạo! ĐI DẠO!
    - cho: *(nằm trước chòi, nhìn đường)* # phu_de: Ai cũng về nhà. Nhà tao ở đây.
    - cho: Hú… *(theo tiếng karaoke xa xa)* # phu_de: Bài này tao biết. Công Viên.
    }
- else:
    { shuffle:
    - cho: *(ngủ dưới gầm cầu thang, chân đạp đạp)* # phu_de: (Đang mơ đuổi shipper.)
    - cho: Gâu? *(tha tới một cây bút)* # phu_de: Của mày hả? Giờ của tao.
    - cho: *(hít hít túi áo bạn)* # phu_de: Mùi lạ. Mày vừa gặp ai?
    }
}
-> END
