// ============================================================
// IDOL HẾT THỜI · THOẠI MINIGAME (mở đầu / thắng / thua)
// Game chạy cảnh mở đầu, cho chơi, rồi nhảy vào cảnh _thang hoặc _thua.
// ============================================================

// ============================================================
// 💒 HÁT ĐÁM CƯỚI
// ============================================================
=== idol_het_thoi_mg_hat_dam_cuoi ===
# noi:nha_hang_tiec_cuoi # dieu_kien:cuoi_tuan_hoac_toi
_Sảnh tiệc cưới. Cổng hoa, đèn chớp, MC thử micro "a lô a lô". Bảng tên cô dâu chú rể dựng ở cửa._
{ RANDOM(1, 3):
- 1:
    _Bảng ghi: "Thúy Hằng & Minh Tuấn". Bàn số 3 có một cô tên Thủy Hằng, em họ cô dâu. Cẩn thận._
- 2:
    _Bảng ghi: "Ngọc Hân & Văn Hải". Phù dâu tên Ngọc Hằng. Ai đặt tên vậy trời._
- else:
    _Bảng ghi: "Kim Ngân & Bảo Long". Chú rể có người anh song sinh tên Bảo Lân, đứng ngay cạnh._
}
quan_ly_idol: *(đưa bạn chai nước)* Nhịp chậm, đừng chen nốt. Tới đoạn chúc mừng nhớ đọc ĐÚNG tên. Mẹ cô dâu ngồi bàn đầu, bà nhìn dữ lắm.
* [🎤 Lên sân khấu.]
- -> END

=== idol_het_thoi_mg_hat_dam_cuoi_thang ===
# noi:nha_hang_tiec_cuoi
_Bài hát vừa dứt. Bạn đọc tên cô dâu chú rể không sai một dấu. Mẹ cô dâu gật đầu. Gật đầu một cái là bằng mười tràng pháo tay._
me_co_dau: Được đó con. Đọc tên rõ ràng. Ăn cỗ rồi hẵng về.
~ phat_so_show = phat_so_show + 1
~ tien_cong(1350000)
~ an(45)
~ uong(25)
_Phong bì 1.500.000đ, anh {quan_ly_idol} giữ lại 10% hoa hồng. Kèm một phần cỗ mang về: gà luộc, xôi gấc, và hai lon nước ngọt._
* [💸 Gửi luôn 1 triệu cho bà quản lý Sky Ảo.]
    ~ tien_cong(-1000000)
    ~ phat_tra_no(1000000)
    _Tin nhắn ngân hàng: "Đã chuyển." Tin nhắn bà quản lý: "Ok cậu." Hai tin nhắn, một chút nhẹ lòng._
* [🍗 Chia phần gà luộc cho anh {quan_ly_idol}.]
    quan_ly_idol: Anh đâu có hát… Ừ, đưa đây cái đùi.
    ~ qh("quan_ly_idol", 5)
* [🕶️ Ký tặng lên thiệp cưới mà không ai xin.]
    _Cô dâu nhận lại tấm thiệp có chữ ký của bạn ngay cạnh tên chú rể. Cô nhìn nó, không biết nên vui hay nên buồn._
    ~ phat_tt(3)
- { phat_so_show >= 8:
    _Đây là show thứ {phat_so_show} trong tháng. Mấy anh phục vụ nhà hàng đã thuộc lời "Công Viên"._
}
-> END

=== idol_het_thoi_mg_hat_dam_cuoi_thua ===
# noi:nha_hang_tiec_cuoi
_Tới đoạn chúc mừng, bạn nói rõ to: "Xin chúc mừng hạnh phúc của cô dâu… Thủy Hằng!"_
_Cô dâu tên Thúy Hằng. Thủy Hằng là em họ cô, đang ngồi bàn số 3, mặt đỏ như gấc._
_Mẹ cô dâu nhìn. Không nói gì. Chỉ nhìn._
me_co_dau: …Con hát hay. Mà lần sau con đọc kỹ cái bảng giùm cô.
~ phat_so_show = phat_so_show + 1
~ phat_doc_nham_ten = phat_doc_nham_ten + 1
~ tien_cong(900000)
~ cang_thang(10)
* [🙏 Chạy xuống xin lỗi cô dâu, hát tặng thêm một bài không lấy tiền.]
    _Cô dâu cười. Cô Thủy Hằng ở bàn 3 cũng cười. Mẹ cô dâu… nhìn bớt dữ._
    ~ phat_tt(-5)
    ~ an(20)
* [🕶️ "Ngôi sao cũng có lúc nhầm."]
    _Câu đó bị một người khách quay lại. Clip tên "Ca sĩ hát cưới đọc nhầm tên cô dâu, còn nói mình là ngôi sao"._
    ~ phat_tt(5)
    ~ phat_nt(-1)
- -> END

// ============================================================
// 🎀 KHAI TRƯƠNG TIỆM
// ============================================================
=== idol_het_thoi_mg_khai_truong ===
# noi:tiem_moi_khai_truong
_Trước cửa một tiệm mới. Băng rôn đỏ, lẵng hoa, một dàn pháo giấy chĩa thẳng vào chỗ bạn đứng._
chu_tiem_moi: Anh ca sĩ ơi! Hát tới câu "thích ăn chuối chiên" là em bấm pháo, anh cắt băng liền nha! Cắt trễ là xui cả năm đó!
quan_ly_idol: Né pháo qua trái nha {idol_het_thoi}. Năm ngoái em ăn nguyên một chùm kim tuyến vô miệng.
* [✂️ Cầm kéo, hít sâu.]
- -> END

=== idol_het_thoi_mg_khai_truong_thang ===
# noi:tiem_moi_khai_truong
_"…thích ăn chuối chiên!" PẰNG! Pháo giấy nổ, bạn cắt băng đúng nhịp, né qua trái, bắt tay chủ tiệm. Một chuỗi động tác trơn như hồi 2015._
chu_tiem_moi: Trời ơi đẹp quá anh! Em gửi anh cát-xê với phiếu quà nè. Anh chọn đi!
~ phat_so_show = phat_so_show + 1
~ tien_cong(800000)
~ phat_nt(1)
* [💅 Phiếu làm nail miễn phí.]
    _Bạn chưa làm nail bao giờ. Có lẽ đã tới lúc. Hoặc đem tặng ai đó._
    ~ cang_thang(-5)
* [🐌 Phiếu 1 dĩa ốc ở Quán Ốc Đêm.]
    ~ phat_co_phieu_oc = true
    _Phiếu này đổi ra một dĩa ốc len xào dừa. Đủ để rủ một người ăn chung._
- -> END

=== idol_het_thoi_mg_khai_truong_thua ===
# noi:tiem_moi_khai_truong
_PẰNG! Bạn né qua phải. Pháo cũng bắn qua phải. Nguyên chùm kim tuyến dính vào kính đen, vào tóc mullet, và một ít vào miệng._
_Bạn cắt băng trễ hai giây. Chủ tiệm nhìn cái băng đứt, nhìn trời, thở dài._
chu_tiem_moi: Thôi… không sao anh. Chắc năm nay tiệm em… thôi không sao.
~ phat_so_show = phat_so_show + 1
~ tien_cong(500000)
~ cang_thang(8)
* [😇 Ở lại hát thêm một bài, "cho tiệm hên lại".]
    chu_tiem_moi: *(mắt sáng lên)* Dạ! Anh hát thêm thì em đốt nhang lại!
    ~ phat_tt(-3)
    ~ tien_cong(100000)
* [🕶️ Phủi kim tuyến, đi thẳng ra xe.]
    _Kim tuyến còn trên tóc bạn tới tận ba ngày sau._
    ~ phat_tt(3)
- -> END

// ============================================================
// 🎙️ PHÒNG THU
// ============================================================
=== idol_het_thoi_mg_phong_thu ===
# noi:studio
_Studio tầng 2. Trên màn hình là vạch cao độ chuẩn. Ở cuối bài có một nốt đỏ chót: nốt cao năm 2015._
it: Có hai cách. Anh gồng, hoặc em hạ tông. Chọn đi.
{ phat_co_keo_ngam:
    _Bạn có hộp kẹo ngậm thông cổ trong túi. Lần này giọng bạn sẽ không vỡ._
}
* [🎤 Gồng. Năm 2015 lên được thì giờ cũng lên được.]
    { phat_co_keo_ngam:
        ~ phat_co_keo_ngam = false
        _Bạn ngậm một viên kẹo. Mát cổ._
    }
    ~ phat_tt(3)
* [🎚️ "Hạ tông giùm anh, {it}."]
    it: Ừ. Không ai biết đâu.
    ~ phat_tt(-5)
    ~ qh("it", 3)
- -> END

=== idol_het_thoi_mg_phong_thu_thang ===
# noi:studio
_Bạn hát khớp vạch chuẩn từ đầu tới cuối. Nốt đỏ chót cuối bài: lên. Không đẹp như năm 2015, nhưng lên._
it: *(bỏ tai nghe xuống)* …Được.
_Một chữ "được" của {it} bằng một tràng pháo tay của người khác._
~ tien_cong(300000)
~ phat_co_keo_ngam = true
~ phat_nt(2)
~ cang_thang(-5)
_{it} đưa bạn một hộp kẹo ngậm thông cổ mới. "Của anh {quan_ly_idol} gửi. Ảnh dặn anh tập là sẽ cần."_
~ qh("quan_ly_idol", 2)
-> END

=== idol_het_thoi_mg_phong_thu_thua ===
# noi:studio
_Nốt cao. Giọng bạn vỡ "éc" như bản lề cửa sắt. Tiếng vang dội ngược từ bốn bức tường cách âm._
_Ngoài hành lang, {editor} đang đi ngang, giật mình làm rơi ly cà phê._
it: …Thu lại. Lần này hạ tông.
~ phat_vo_giong = true
~ tien_cong(150000)
~ cang_thang(12)
* [😶 "Ừ. Hạ đi."]
    ~ phat_tt(-5)
* [😤 "Không. Gồng lại."]
    _Bạn gồng ba lần. Lần thứ tư {it} rút dây micro._
    ~ nghi(-15)
    ~ phat_tt(3)
- -> END

// ============================================================
// ✍️ KÝ TẶNG
// ============================================================
=== idol_het_thoi_mg_ky_tang ===
# noi:sanh_trung_tam_thuong_mai
_Bàn ký tặng ở sảnh trung tâm thương mại, cạnh quầy nhận hàng online. Một hàng người xếp dài. Bạn không chắc ai xếp hàng vì bạn._
fan_cuong_phat: *(đứng đầu hàng, áo in hình bạn năm 2015)* Công Viên muôn năm! Anh ơi, em tới sớm nhất!
_Mẹo: fan thật nhớ đúng lời bài hát, hay mang quà. Người xếp nhầm thì cầm mã đơn hàng._
* [🖊️ Mở nắp bút.]
- -> END

=== idol_het_thoi_mg_ky_tang_thang ===
# noi:sanh_trung_tam_thuong_mai
_Bạn ký đúng cho 23 fan thật. Người xếp nhầm, bạn chỉ đường sang quầy nhận hàng, còn tặng thêm một nụ cười._
fan_cuong_phat: Anh vẫn đẹp trai như năm đó! Quà của hội nè anh!
~ phat_nt(2)
~ tien_cong(500000)
_Bạn bán được 5 tấm ảnh ký tặng, mỗi tấm 100.000đ. Và nhận một bọc quà: trà sữa, bánh chuối chiên, một con gấu bông hình xiên cá viên._
~ nhan(tra_sua)
~ nhan(chuoi_chien)
~ nhan(gau_bong)
* [💬 "Mấy em biết anh qua đâu vậy?"]
    fan_cuong_phat: Qua nhóm "Hội Cá Viên Chiên" anh! Admin ChuoiChien89 nhắc tụi em đêm nào cũng nhắc!
    _ChuoiChien89. Cái tên bạn thấy đâu đó rồi, mà không nhớ ở đâu._
* [🕶️ "Cảm ơn fan của anh."]
    ~ phat_tt(3)
- -> END

=== idol_het_thoi_mg_ky_tang_thua ===
# noi:sanh_trung_tam_thuong_mai
_Bạn ký chữ ký nghệ sĩ lên 14 tờ phiếu nhận hàng. Người thứ 15 cầm tờ phiếu nhìn bạn: "Anh ơi, cái máy hút bụi của em đâu?"_
_Quản lý quầy nhận hàng đi tới, mặt rất nghiêm._
~ phat_nt(-1)
~ phat_tt(-3)
~ cang_thang(10)
* [😇 "Xin lỗi chị. Để em phụ chị phát hàng luôn."]
    _Bạn phát hàng một tiếng. Ba người nhận hàng xin chụp hình với "anh shipper đeo kính"._
    ~ tien_cong(100000)
* [🕶️ Đứng dậy, đi ra, kính đen.]
    _Sau lưng có người hỏi: "Ổng là ai vậy?" Người kia: "Ai biết."_
- -> END

// ============================================================
// 📱 LIVESTREAM BÁN CÁ VIÊN
// ============================================================
=== idol_het_thoi_mg_livestream_ca_vien ===
# noi:can_1808
_Căn 1808. Đèn ring light mượn của {hong_hot}. Trên bàn là 20 gói cá viên chiên ăn liền của nhãn hàng nhỏ "Cá Viên Ông Tám"._
_Luật: hát, đọc bình luận, chốt đơn đúng lúc. Không được để chết sóng quá 5 giây._
hong_hot: *(nhắn)* Anh {idol_het_thoi}, nhớ chào người xem bằng tên nha! Người ta thích được gọi tên lắm!
* [📱 Bấm "Phát trực tiếp".]
- -> END

=== idol_het_thoi_mg_livestream_ca_vien_thang ===
# noi:can_1808
_Một tiếng livestream. Bạn hát "Công Viên" ba lần, mỗi lần chèn một câu "chốt đơn". 312 người xem. Bán được 180 gói._
_Bình luận lần này không có hoa sen nào: "Anh hát xong em đói", "Chốt 5 gói cho ba em, ba em fan anh", "Cá viên chiên tại công viên, chốt!"._
~ tien_cong(800000)
~ nhan(ca_vien_chien)
~ an(20)
~ phat_nt(2)
~ follow(2000)
_Nhãn hàng gửi tặng một thùng cá viên chiên. Bạn có thể chia cho đồng nghiệp._
* [🤝 Đem thùng cá viên lên công ty chia cả tầng 1.]
    ~ qh("thuc_tap_sinh", 3)
    ~ qh("hong_hot", 3)
    ~ qh("chi_dai", 3)
    ~ qh("cho", 5)
    _{cho} nhận được ba viên. Ba viên rơi "tình cờ"._
* [🕶️ Giữ lại ăn dần.]
    ~ an(20)
- -> END

=== idol_het_thoi_mg_livestream_ca_vien_thua ===
# noi:can_1808
_Phút 23, bạn mải kể chuyện năm 2015. Chết sóng 9 giây. Người xem tụt từ 80 xuống 11. Còn 11 người, 10 người là hoa sen._
_Bán được 12 gói. Một bình luận thật duy nhất: "Anh ơi nói chuyện cá viên đi anh."_
~ tien_cong(200000)
~ cang_thang(8)
~ phat_tt(-3)
_Nhãn hàng vẫn gửi một thùng cá viên chiên. Kèm thiệp: "Lần sau anh nói ít, hát nhiều nha."_
~ nhan(ca_vien_chien)
-> END

// ============================================================
// 🎤 KARAOKE ĐẤU ĐIỂM
// ============================================================
=== idol_het_thoi_mg_karaoke ===
# noi:karaoke
_Karaoke Hát Cho Nhau Nghe. Máy chấm điểm đời cũ, màn hình có pháo hoa pixel. Mục tiêu: "Công Viên", 100 điểm. Máy chưa bao giờ cho bạn quá 78._
dan_dau_tu: Thua thì bao đồ nhậu nha. Kèo này tui all-in.
* [🎤 Cầm micro.]
- -> END

=== idol_het_thoi_mg_karaoke_thang ===
# noi:karaoke
{ phat_karaoke_100:
    _Màn hình lại nhấp nháy: 100 ĐIỂM. Lần thứ hai. Máy chắc đã quen bạn._
- else:
    _Màn hình nhấp nháy. Pháo hoa pixel. Một con số chưa từng thấy: 100 ĐIỂM._
    _Cả phòng im lặng. Rồi {dan_dau_tu} đứng dậy, vỗ tay như thấy coin x100._
    ~ phat_karaoke_100 = true
    ~ phat_tt(20)
}
dan_dau_tu: Đồ nhậu tui bao! Mực nướng! Khô gà! Lần này là… thôi, lần này là thiệt.
~ an(30)
~ uong(20)
~ cang_thang(-15)
~ phat_nt(2)
-> END

=== idol_het_thoi_mg_karaoke_thua ===
# noi:karaoke
_Màn hình: 78 điểm. "Bạn có tiềm năng!"_
dan_dau_tu: 78! Như mọi khi! Ông bao!
~ tien_cong(-250000)
~ cang_thang(-15)
* [😤 "Máy hư. Cái máy này ghét anh từ 2015."]
    ~ phat_tt(3)
* [😇 "Ừ, 78 là điểm của anh. Đủ rồi."]
    _Bạn nói câu đó và thấy nhẹ lạ lùng._
    ~ phat_tt(-5)
- ~ an(20)
-> END
