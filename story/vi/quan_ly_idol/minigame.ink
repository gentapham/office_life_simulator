// ============================================================
// QUẢN LÝ IDOL · THOẠI MINIGAME (mở đầu / thắng / thua)
// Game chạy cảnh mở đầu, cho chơi, rồi nhảy vào cảnh _thang hoặc _thua.
// ============================================================

// ============================================================
// 📞 HAI ĐIỆN THOẠI
// ============================================================
=== quan_ly_idol_mg_hai_dien_thoai ===
# noi:phong_nghe_si
_Máy trái reo. Máy phải reo. Máy để bàn của phòng Nghệ sĩ cũng reo. Bạn có hai tai và ba giây._
_Luật: máy trái là {idol_het_thoi}, máy phải là Nguyên. Thỉnh thoảng chen vào {giam_doc}, đài truyền hình, và một bà mẹ cô dâu rất kiên nhẫn._
{ thai_pin < 30:
    _Pin còn {thai_pin}. Tay bạn hơi run._
}
* [📞 Bấm nghe.]
- -> END

=== quan_ly_idol_mg_hai_dien_thoai_thang ===
# noi:phong_nghe_si
_Hai mươi cuộc gọi. Không nhầm máy lần nào. {idol_het_thoi} được hứa đúng chuyện của {idol_het_thoi}, Nguyên được hứa đúng chuyện của Nguyên, mẹ cô dâu được hứa bài bolero._
_{thanh_xin_nghi} đứng nhìn từ cửa, vỗ tay chậm rãi._
thanh_xin_nghi: Anh {quan_ly_idol}. Anh nên đi thi "Tai Trái Tai Phải" trên Đài Tivi Hóng.
~ tien_cong(150000)
~ nhan(ca_phe)
~ thai_p(20)
~ uong(15)
_Một ly cà phê sữa đá từ quán đầu đường, {thanh_xin_nghi} mua. Và vì không nói nhầm máy lần nào, {it} thưởng bạn một cục sạc dự phòng "mượn vô thời hạn"._
~ thai_co_sac_du_phong = true
-> END

=== quan_ly_idol_mg_hai_dien_thoai_thua ===
# noi:phong_nghe_si
_Bạn nói vào máy trái: "Chiều nay em mặc đồ hồng nha, nhớ mang găng tay." Máy trái là {idol_het_thoi}._
idol_het_thoi: …Anh nói với ai đó? Em mặc đồ hồng hả?
_Bạn nói vào máy phải: "Đừng đeo kính đen trong tiệm nail nha em." Máy phải là Nguyên._
sieu_nhan_hong: Dạ! Em không đeo kính! Mà em có kính đâu anh?
~ thai_kh(1)
~ tien_cong(50000)
~ cang_thang(10)
* [😅 Gọi lại cả hai, xin lỗi.]
    idol_het_thoi: Anh mệt quá rồi đó. Nghỉ đi anh.
    ~ qh("idol_het_thoi", 2)
* [📱 Để vậy. Không có thời gian.]
    _Tối đó {idol_het_thoi} mặc một cái khăn quàng hồng đi hát đám cưới, "vì anh {quan_ly_idol} dặn". Cô dâu khen đẹp._
- -> END

// ============================================================
// 🧯 VIẾT THÔNG CÁO XIN LỖI
// ============================================================
=== quan_ly_idol_mg_thong_cao ===
# noi:phong_nghe_si
_Màn hình trống. Một xấp mảnh câu: "Chúng tôi chân thành xin lỗi", "Chúng tôi không có lỗi", "Anti fan bịa đặt", "Chúng tôi sẽ rút kinh nghiệm", "Mong quý khán giả thông cảm", "Ai đăng thì tự chịu"._
_Luật: đúng giọng, đúng lúc, đúng số chữ. Tránh mảnh bẫy._
{ thai_khung_hoang >= 3:
    _Đang có {thai_khung_hoang} phốt mở cùng lúc. Viết nhanh._
}
* [⌨️ Bắt đầu ghép.]
- -> END

=== quan_ly_idol_mg_thong_cao_thang ===
# noi:phong_nghe_si
_Thông cáo 147 chữ. Không một mảnh bẫy nào. Đọc lên nghe như người thật xin lỗi người thật._
_Hai tiếng sau, phốt chìm. Bình luận được thích nhiều nhất: "Thông cáo này viết có tâm ghê."_
~ thai_dap()
~ tien_cong(300000)
~ uy_tin = uy_tin + 3
{ RANDOM(1, 10) <= 4:
    giam_doc: *(gọi lên phòng)* {quan_ly_idol}. Thông cáo hay. Cầm hộp bánh này về, quà đối tác. Anh không ăn đồ ngọt.
    ~ an(20)
    ~ qh("giam_doc", 3)
}
-> END

=== quan_ly_idol_mg_thong_cao_thua ===
# noi:phong_nghe_si
_Bạn lỡ tay kéo mảnh "Chúng tôi không có lỗi" vào giữa câu "Chúng tôi chân thành xin lỗi" và "Mong quý khán giả thông cảm"._
_Thông cáo đăng lúc 23:58. Lúc 0:03, cư dân mạng chụp màn hình: "Xin lỗi mà không có lỗi?"_
~ thai_kh(1)
~ tien_cong(100000)
~ cang_thang(12)
* [🧯 Viết thông cáo xin lỗi cho cái thông cáo xin lỗi.]
    _Thông cáo thứ hai ngắn hơn. Đúng hơn. Ít người đọc hơn._
    ~ thai_p(-15)
* [🙏 Nhờ {hong_hot} gỡ.]
    hong_hot: Gỡ rồi! Mà… có người chụp màn hình rồi anh ơi.
    ~ qh("hong_hot", 2)
- -> END

// ============================================================
// 🗓️ XẾP LỊCH HAI NGHỆ SĨ
// ============================================================
=== quan_ly_idol_mg_xep_lich ===
# noi:phong_nghe_si
_Bảng trắng lịch tuần. Các khối rơi xuống: "Đám cưới quận 3", "Quay quảng cáo", "Livestream", "Khai trương tiệm nail", "Thu âm"… Thỉnh thoảng rơi xuống một khối đỏ chót: "🆘 Nguyên đi giúp người"._
{ RANDOM(1, 2) == 1:
    thanh_xin_nghi: *(hôm nay có đi làm)* Anh {quan_ly_idol}, em cầm bút lông nè. Mình xếp nhanh rồi em đi mua bánh mì.
- else:
    _{thanh_xin_nghi} hôm nay "bà ngoại ốm". Bạn xếp một mình._
}
* [🧱 Bắt đầu xếp.]
- -> END

=== quan_ly_idol_mg_xep_lich_thang ===
# noi:phong_nghe_si
_Lịch tuần không một ô chồng nào. Khối "Nguyên đi giúp người" rơi xuống đúng khoảng trống bạn chừa sẵn từ trước. Bạn đã quen._
~ tien_cong(200000)
~ uy_tin = uy_tin + 2
~ cang_thang(-5)
{ RANDOM(1, 2) == 1:
    thanh_xin_nghi: Đẹp quá anh. Em đi mua bánh mì nha! *(mua hai ổ, một ổ thịt, một ổ trứng)*
    ~ nhan(banh_mi)
    ~ an(25)
    ~ qh("thanh_xin_nghi", 3)
}
-> END

=== quan_ly_idol_mg_xep_lich_thua ===
# noi:phong_nghe_si
_Thứ 7: {idol_het_thoi} hát đám cưới quận 3 lúc 18 giờ. Nguyên livestream lúc 18 giờ. Xe đưa đón: một cái. Tài xế: bạn._
~ thai_kh(1)
~ tien_cong(50000)
* [🚗 Chạy cả hai. Đám cưới trước, livestream sau.]
    _Nguyên trễ livestream 20 phút. Bình luận: "Siêu Nhân Hồng đi giúp người hả?" Lần này không phải._
    ~ thai_p(-20)
* [📞 Nhờ {chi_dai} chở {idol_het_thoi}.]
    chi_dai: Ừ. Lần này thôi nha.
    ~ qh("chi_dai", 2)
- -> END

// ============================================================
// 💰 ÉP GIÁ CÁT-XÊ
// ============================================================
=== quan_ly_idol_mg_ep_gia ===
# noi:quan_ca_phe_song_ao
_Đối diện bạn: một bà mẹ cô dâu, một chủ tiệm nail, hoặc một đạo diễn đài truyền hình. Ai cũng có một thanh kiên nhẫn trên đầu._
_Mỗi lượt: nhắc "hit 2015", giảm giá, tặng thêm bài, hoặc dọa đi._
me_co_dau: Ca sĩ một bài mà lấy giá đó hả con?
* [💰 Bắt đầu mặc cả.]
- -> END

=== quan_ly_idol_mg_ep_gia_thang ===
# noi:quan_ca_phe_song_ao
me_co_dau: *(thở dài, gật đầu)* Thôi được. Mà hát đúng tên con gái cô nha. Con cũng ở lại ăn cỗ đi, gầy nhom à.
~ tien_cong(350000)
~ uy_tin = uy_tin + 2
* [🍗 Nhận phần cỗ cưới mang về.]
    _Gà luộc, xôi gấc, hai lon nước ngọt. Bạn để dành nửa phần cho {idol_het_thoi}._
    ~ an(40)
    ~ uong(15)
    ~ qh("idol_het_thoi", 2)
* [🎫 Nhận phiếu dịch vụ của tiệm.]
    _Phiếu làm nail miễn phí. Bạn đưa lại cho {designer}, người duy nhất bạn biết sẽ dùng nó._
    ~ qh("designer", 3)
- -> END

=== quan_ly_idol_mg_ep_gia_thua ===
# noi:quan_ca_phe_song_ao
me_co_dau: Thôi khỏi. Cô mời đứa cháu cô hát. Nó hát karaoke hay lắm.
_Thanh kiên nhẫn về 0. Show mất. Bạn ngồi lại với ly trà đá đã tan hết đá._
~ thai_kh(1)
~ cang_thang(8)
* [📞 Gọi lại xin giảm giá.]
    me_co_dau: *(im lâu)* … Nửa giá. Lấy thì lấy.
    ~ tien_cong(75000)
    ~ qh("idol_het_thoi", -2)
* [😶 Thôi. Show khác.]
    ~ cang_thang(3)
- -> END

// ============================================================
// 🚗 CHẠY SHOW
// ============================================================
=== quan_ly_idol_mg_chay_show ===
# noi:dai_lo_ket_xe
_Bản đồ Quận Hóng. {idol_het_thoi} ở ghế sau, ôm đàn. Điểm đến: nhà hàng tiệc cưới, rồi studio, rồi Đài Tivi Hóng. Đại lộ Kẹt Xe đang đỏ như chart coin của {dan_dau_tu}._
_Bắt buộc ghé xe chuối chiên: điều khoản số 4._
idol_het_thoi: Anh. Ghé chuối chiên cho nó hả? *(im một lúc)* Mua dư một bịch nha.
* [🛵 Nổ máy.]
- -> END

=== quan_ly_idol_mg_chay_show_thang ===
# noi:dai_lo_ket_xe
_Né hai đoạn ngập, một đoạn kẹt, một chú công an phường. Tới nơi trước giờ 5 phút. Bịch chuối chiên còn nóng._
~ tien_cong(100000)
~ nhan(chuoi_chien)
~ an(15)
_Phát mở bịch dư, chia bạn một nửa. "Chiên giòn. Mà hông bằng chỗ công viên hồi xưa."_
~ qh("idol_het_thoi", 3)
-> END

=== quan_ly_idol_mg_chay_show_thua ===
# noi:dai_lo_ket_xe
_Mưa ngập Đại lộ Kẹt Xe. Xe chết máy. Bạn dắt bộ 400 mét. {idol_het_thoi} đội đàn lên đầu cho khỏi ướt._
_Tới nơi trễ 25 phút. Mẹ cô dâu nhìn đồng hồ, nhìn bạn, nhìn bộ đồ ướt của {idol_het_thoi}._
~ thai_kh(1)
~ tien_cong(50000)
~ thai_p(-15)
{ RANDOM(1, 3) == 1:
    _Một chiếc xe màu hồng dừng lại. Siêu Nhân Hồng bước xuống, đẩy xe giùm bạn. {idol_het_thoi} nhìn Nguyên, không nói gì, rồi phụ đẩy._
    ~ qh("sieu_nhan_hong", 3)
}
-> END

// ============================================================
// 🔋 QUẢN LÝ SẠC
// ============================================================
=== quan_ly_idol_mg_quan_ly_sac ===
# noi:studio_0905
_Năm cục sạc dự phòng. Ba cái điện thoại. Một ổ cắm. Giờ cao điểm từ 8 giờ tới 22 giờ. Không máy nào được tắt._
* [🔌 Bắt đầu xoay vòng.]
- -> END

=== quan_ly_idol_mg_quan_ly_sac_thang ===
# noi:studio_0905
_Cả ngày không máy nào sập. Năm cục sạc đi vòng như đội hình đồng diễn._
~ thai_p(15)
~ cang_thang(-10)
_Đây có lẽ là việc duy nhất trong ngày mà kết quả hoàn toàn nằm trong tay bạn._
-> END

=== quan_ly_idol_mg_quan_ly_sac_thua ===
# noi:studio_0905
_Máy trái sập lúc 19:40. Đúng lúc {idol_het_thoi} gọi lần thứ ba._
_Khi máy sống lại: "Thôi khỏi anh, em tự lo." Bạn đọc câu đó, và lần đầu tiên thấy sợ một câu không có lỗi chính tả nào._
~ thai_p(-10)
~ cang_thang(8)
~ qh("idol_het_thoi", -2)
-> END
