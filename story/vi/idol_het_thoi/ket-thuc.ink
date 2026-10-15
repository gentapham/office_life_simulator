// ============================================================
// IDOL HẾT THỜI · ĐÁNH GIÁ & 6 KẾT THÚC
// Thứ tự ưu tiên: bí mật > có hậu lớn > buồn > có hậu nhỏ > mặc định
// ============================================================

=== idol_het_thoi_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau_dem_hong
// 3. 🔒 Đôi Bạn Thân (bí mật)
{ phat_biet_chuoichien89 and phat_thay_anh and qh_quan_ly_idol >= 80 and phat_thai_o_lai:
    ~ chot_ket_thuc("doi_ban_than")
    -> idol_het_thoi_kt_doi_ban_than
}
// 1. 🌟 Công Viên Hồng
{ phat_song_ca_dem_hong and phat_noi_tieng >= 70 and phat_fan_ao == 0 and nguoi_theo_doi >= 1000000:
    ~ chot_ket_thuc("cong_vien_hong")
    -> idol_het_thoi_kt_cong_vien_hong
}
// 4. 🤖 Fan Ảo Bỏ Đi
{ phat_bi_boc_phot and phat_fan_ao_khi_boc >= 100000 and not phat_lat_phot:
    ~ chot_ket_thuc("fan_ao_bo_di")
    -> idol_het_thoi_kt_fan_ao_bo_di
}
// 5. 💍 Tủ Kính Tiệm Cầm Đồ
{ phat_no >= 80000000 or (phat_cam_cup and not phat_chuoc_cup):
    ~ chot_ket_thuc("tu_kinh")
    -> idol_het_thoi_kt_tu_kinh
}
// 6. 🎤 Sân Khấu Trống
{ phat_pha_chien_dich >= 3 and nguoi_theo_doi < 1000000:
    ~ chot_ket_thuc("san_khau_trong")
    -> idol_het_thoi_kt_san_khau_trong
}
// 2. 💒 Ca Sĩ Đám Cưới Số Một Quận Hóng
{ phat_tinh_tuong <= 20 and phat_so_show >= 8 and phat_no <= 0 and phat_gianh_sau_16 == 0:
    ~ chot_ket_thuc("ca_si_dam_cuoi")
    -> idol_het_thoi_kt_ca_si_dam_cuoi
}
// Mặc định: còn hợp đồng hoặc đã bớt tinh tướng thì vẫn đi hát; không thì dọn nhà.
{ phat_gia_han or phat_tinh_tuong <= 40:
    ~ chot_ket_thuc("ca_si_dam_cuoi")
    -> idol_het_thoi_kt_ca_si_dam_cuoi
}
~ chot_ket_thuc("tu_kinh")
-> idol_het_thoi_kt_tu_kinh

// ------------------------------------------------------------
// 😄 1. CÔNG VIÊN HỒNG
// ------------------------------------------------------------
=== idol_het_thoi_kt_cong_vien_hong ===
# ngay:31 # gio:23:45 # dieu_kien:ket_thuc_cong_vien_hong
_Ba ngày sau Đêm Hồng, bản remix "Công Viên Hồng" lên top 1 xu hướng._
_Cả nước lại hát "thích ăn chuối chiên". Lần này kèm một điệu nhảy: hai tay xiên que, lắc hông, tạo dáng siêu nhân ở câu cuối._
_Học sinh nhảy ở sân trường. Mấy chú xe ôm nhảy ở ngã tư. Một cô bán cá viên chiên ở Vũng Tàu quay clip nhảy cạnh xe đẩy, ghi: "Bài của thằng nhỏ hồi xưa đó!"_
hong_hot: *(gọi tới, hét)* Anh {idol_het_thoi} ơi! Top 1! Top 1 thiệt! Không có hoa sen nào hết! Người thật hết đó anh!
_Kênh của bạn: 0 tài khoản ảo. 214.000 người theo dõi thật. Bạn đếm đi đếm lại, như đếm tiền._
sieu_nhan_hong: *(nhắn)* Anh ơi em viết chữ CHUỐI lên tay vẫn chưa rửa. Em giữ luôn được hông?
giam_doc: *(nhắn group lúc 22:00)* Cả nhà ơi. Năm 2015 anh tưởng anh là thiên tài. Năm nay anh biết thiên tài là cả nhà mình. Anh không ép. Anh cảm ơn.
_Sáng 1/11. Có tiếng gõ cửa căn 1808. Bạn mở cửa, tay còn cầm bàn chải đánh răng._
_Bà quản lý Sky Ảo đứng đó. Tay cầm một cuốn sổ. Bạn nuốt nước bọt, chờ nghe hai chữ "tiền nhà"._
ba_quan_ly_sky_ao: Cậu {idol_het_thoi}. *(chìa cuốn sổ ra)* Ký cho con gái cô một chữ. Nó nhảy bài cậu suốt đêm qua, cô ngủ không được.
_Bạn ký. Chữ ký đẹp nhất từ năm 2015 tới giờ._
ba_quan_ly_sky_ao: *(nhìn chữ ký, gật gù, rồi ngẩng lên)* À. Tiền nhà tháng này vẫn phải đóng nha cậu.
_Cửa đóng lại. Bạn đứng trong căn hộ, nhìn bốn bức tường poster năm 2015. Bạn lấy điện thoại, chụp một tấm selfie mới. Không kính đen._
_Bạn dán nó lên tường, ngay giữa._
-> END

// ------------------------------------------------------------
// 😄 2. CA SĨ ĐÁM CƯỚI SỐ MỘT QUẬN HÓNG
// ------------------------------------------------------------
=== idol_het_thoi_kt_ca_si_dam_cuoi ===
# ngay:31 # gio:23:45 # dieu_kien:ket_thuc_ca_si_dam_cuoi
_Cuối tháng 11. Một đám cưới ở nhà hàng Hạnh Phúc Trăm Năm, sảnh B. Đám thứ 23 kể từ Đêm Hồng._
_Lịch của bạn kín tới Tết. Anh {quan_ly_idol} phải mua thêm một cuốn sổ. {ke_toan} đã dạy bạn xuất hóa đơn, bạn xuất hóa đơn đẹp như ký tặng._
_Cô dâu chú rể hôm nay quen nhau năm 2015, ở một phòng karaoke, vì cùng giành micro hát "Công Viên". Họ in lời bài hát lên thiệp cưới._
chu_re: *(cầm micro)* Tụi em mời anh {idol_het_thoi} lên hát. Anh hát cho tụi em thôi, như năm đó tụi em hát cho nhau.
_Bạn bước lên. Tháo kính đen, đặt lên bàn tiệc số 1, cạnh dĩa gà luộc._
_Không đèn sân khấu. Không fan cuồng. Không tài khoản hoa sen nào. Chỉ có hai người đứng trước mặt, nắm tay nhau, và nhìn bạn như nhìn một người quen._
_"Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên…"_
_Câu thứ hai, cô dâu hát theo. Câu thứ ba, chú rể. Tới điệp khúc thì cả rạp cưới hát, mấy chú bàn cuối gõ đũa vào ly theo nhịp._
_Mẹ cô dâu ngồi bàn đầu. Bà không nhìn dữ. Bà đang khóc._
co_dau: Anh ơi, tụi em cảm ơn anh. Không có bài của anh chắc tụi em không quen nhau.
_Bạn cúi chào. Đi xuống. Cầm lại cái kính đen trên bàn, nhìn nó một lúc, rồi bỏ vào túi áo. Không đeo._
quan_ly_idol: *(đưa phong bì, cười)* Đám thứ 23 rồi đó. Mai đám 24 ở quận 3.
_Ra tới bãi xe, bạn mới nhận ra: suốt tháng này, chưa ai hỏi "Anh là ai vậy?"._
_Họ biết bạn là ai. Bạn là người hát trong ngày vui nhất đời họ._
_Được một người cần, hóa ra cũng là nổi tiếng._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: ĐÔI BẠN THÂN
// ------------------------------------------------------------
=== idol_het_thoi_kt_doi_ban_than ===
# ngay:31 # gio:23:45 # dieu_kien:ket_thuc_doi_ban_than
_Đêm Hồng tan lúc 23 giờ. Bãi đất trước sân khấu đầy giấy kim tuyến hồng. Công nhân bắt đầu cuộn dây điện._
_Ở cổng Sân khấu Đêm Hồng có một xe chuối chiên còn mở. Ông bán chuối chiên đang dọn hàng._
idol_het_thoi: Chú ơi, cho con hai bịch.
_Bạn cầm hai bịch chuối chiên còn nóng, đi vòng ra sau cánh gà. Anh {quan_ly_idol} ngồi trên bậc thang sân khấu, hai cái điện thoại trên đùi, một cái 3% pin, một cái 1%._
_Anh ngẩng lên. Bạn đưa anh một bịch._
quan_ly_idol: Ủa… chuối chiên. Điều khoản số 4 hả?
idol_het_thoi: Hông. Điều khoản của em.
_Bạn ngồi xuống bậc thang, cạnh anh. Gần hơn mọi lần._
idol_het_thoi: Mười một năm nay em hát về đôi bạn thân bán cá viên chiên. Mà giờ em mới để ý người đứng cạnh em suốt là ai.
_Anh {quan_ly_idol} không nói gì. Tay cầm bịch chuối chiên hơi run. Chắc tại gió đêm._
idol_het_thoi: Em… chưa biết nói sao. Em còn nợ tiền nhà. Em còn đeo kính trong nhà. Em còn phải học nhiều lắm.
idol_het_thoi: Mà anh đừng đăng bài cho em mỗi tối nữa. Tối nào em cũng tự hát. Anh chỉ cần nghe thôi.
_Hai cái điện thoại trên đùi anh cùng đổ chuông. Máy trái: đài truyền hình. Máy phải: Lưu Lực._
_Lần đầu tiên trong mười hai năm, anh {quan_ly_idol} không nghe máy._
_Anh lật úp cả hai cái xuống bậc thang, cầm một miếng chuối chiên, cắn một miếng._
quan_ly_idol: *(giọng khàn)* Chiên giòn ghê. Mà hông bằng chỗ công viên hồi xưa.
_Bạn bật cười. Anh cũng cười. Ở hàng ghế khán giả trống trơn phía xa, {editor} đang cuộn dây máy quay, thấy hai người, cúi đầu, rồi lặng lẽ tắt đèn sân khấu cuối cùng._
_Chuyện sau đó thế nào thì chưa ai biết. Nhưng đêm đó, có hai người ngồi ăn chuối chiên tới khi bịch giấy nguội hẳn, và không ai cần ai lo cho ai._
-> END

// ------------------------------------------------------------
// 😢 4. FAN ẢO BỎ ĐI
// ------------------------------------------------------------
=== idol_het_thoi_kt_fan_ao_bo_di ===
# ngay:31 # gio:23:45 # dieu_kien:ket_thuc_fan_ao_bo_di
_Đêm 31/10. Ở Sân khấu Đêm Hồng, năm nghìn người đang hát. Ở căn 1808, đèn tắt, chỉ có ánh ring light mượn của {hong_hot}._
_Bạn đeo kính đen. Mặc sơ mi lụa đẹp nhất. Bấm "Phát trực tiếp"._
_Tiêu đề: "ĐÁP TRẢ ANTI FAN. SỰ THẬT VỀ IDOL {idol_het_thoi}."_
_Một phút. Người xem: 0._
_Ba phút. Người xem: 3._
idol_het_thoi: Chào các em. Anh biết các em vẫn ở đây. Fan anh đông lắm mà. Fan anh chưa bao giờ bỏ anh…
_Ba tài khoản. Avatar hoa sen. Tên: "Hoa Sen 0417", "Hoa Sen 2209", "Hoa Sen 7781"._
_Bạn chờ họ bình luận "Anh {idol_het_thoi} đỉnh nóc kịch trần". Bạn chưa bao giờ chờ câu đó như bây giờ._
_Màn hình hiện một dòng chữ xám:_
_"Hoa Sen 0417: Tài khoản đã bị khóa. Người dùng đã rời khỏi phòng."_
_Rồi dòng thứ hai. Rồi dòng thứ ba._
_Người xem: 0._
_Ngoài cửa sổ, xa xa, pháo hoa Đêm Hồng nổ trên trời Phường Tân Drama. Tiếng năm nghìn người hát vọng tới rất nhỏ. Hình như họ đang hát "thích ăn… khoai chiên"._
_Không ai sửa lời._
_Điện thoại báo một tin nhắn. Máy của anh {quan_ly_idol}: "Em ở đâu? Anh tới." Bạn đọc. Không trả lời._
_Bạn vẫn ngồi đó, livestream cho không ai xem, kính đen trên mặt, trong căn phòng tối. Bốn bức tường nhìn xuống, toàn là bạn năm 2015, cười tươi._
-> END

// ------------------------------------------------------------
// 😢 5. TỦ KÍNH TIỆM CẦM ĐỒ
// ------------------------------------------------------------
=== idol_het_thoi_kt_tu_kinh ===
# ngay:31 # gio:23:45 # dieu_kien:ket_thuc_tu_kinh
_Hợp đồng độc quyền của bạn hết hạn lúc 0 giờ ngày 1/11. Không ai gia hạn._
_Sáng 2/11, bạn dọn ra khỏi căn 1808. Bà quản lý đứng ở cửa đếm từng món đồ. Bốn mươi tấm poster cuộn tròn nhét trong một thùng mì gói._
{ not phat_cam_cup:
    _Thùng đồ không có cái cúp. Hôm qua bạn đã đem nó ra Phố Cũ, đổi lấy tiền xe dọn nhà._
}
_Anh {quan_ly_idol} tới phụ khiêng đồ. Anh không nói gì suốt buổi. Chỉ trước khi về, anh dúi vào túi bạn một phong bì, rồi đi rất nhanh._
_Chiều. Bạn đi bộ ngang Phố Cũ, kéo vali. Ngang tiệm cầm đồ Cứu Nguy._
_Trong tủ kính, giữa một cái nồi cơm điện và một cây đàn organ, có cái cúp "Ca khúc của năm 2015". Mạ vàng. Đã được lau sạch bụi. Dán một tờ giấy: "9.000.000đ"._
_Bạn đứng đó. Không đeo kính. Một cậu sinh viên đeo ba lô cũng đứng đó, ngắm cái cúp._
sinh_vien: Chú ơi, cúp này của ai vậy chú?
chu_tiem_cam_do: *(không ngẩng lên khỏi tờ báo)* Của ca sĩ nào đó. Chú quên rồi.
sinh_vien: Ca khúc của năm 2015… Năm đó con học lớp 5. Hồi đó bài gì hot ta?
_Cậu sinh viên lấy điện thoại ra tìm. Bạn đứng ngay cạnh, có thể nói một câu. "Em biết anh là ai không?"_
_Bạn không nói._
_Cậu sinh viên tìm ra. Bấm nghe. Từ cái loa điện thoại nhỏ xíu, giọng bạn năm 19 tuổi vang lên giữa Phố Cũ: "Ngày xưa có đôi bạn thân…"_
sinh_vien: Ủa bài này hả! Con nhớ rồi! Hồi nhỏ con hát hoài! Mà… ca sĩ này giờ ở đâu ta?
_Bạn kéo vali đi tiếp. Bánh xe vali kêu lạch cạch trên vỉa hè, như tiếng gõ nhịp._
_Sau lưng, cậu sinh viên vẫn đang hát theo, sai lời: "thích ăn… khoai chiên"._
-> END

// ------------------------------------------------------------
// 😢 6. SÂN KHẤU TRỐNG
// ------------------------------------------------------------
=== idol_het_thoi_kt_san_khau_trong ===
# ngay:31 # gio:23:45 # dieu_kien:ket_thuc_san_khau_trong
_Chiến dịch Siêu Nhân Hồng thất bại. {cong_ty} phải hoàn 10 tỷ. Phá sản._
_Hợp đồng độc quyền của bạn, mười một năm, trở thành một tờ giấy không ai cần ký gia hạn, vì không còn ai để ký._
_Sáng 1/11. Sân khấu Đêm Hồng. Công nhân đang tháo dỡ. Phông hồng được cuộn lại, đèn được hạ xuống, giấy kim tuyến bị quét thành đống._
_Bạn đứng giữa sân khấu. Không micro. Không đèn. Không kính đen: nó rơi đâu đó đêm qua, bạn không đi tìm._
_Bạn hát. "Ngày xưa có đôi bạn thân… bán cá viên chiên…"_
_Mấy chú công nhân dừng tay. Một chú ngồi xuống bậc thang, châm điếu thuốc, nghe hết bài._
cong_nhan: Hay đó. *(đứng dậy, phủi quần)* Mà dời qua cho tụi chú tháo cái đèn nha con.
_Bạn dời qua. Cái đèn được tháo xuống. Chỗ bạn vừa đứng giờ chỉ còn một vệt sáng hình chữ nhật trên sàn gỗ, nơi lớp bụi chưa kịp bám._
_Bạn nhớ lại cả tháng: cái micro bị giật, cái bánh kem bị đổ, những lần bước vào khung hình của người khác._
_Bạn nhớ ra một chuyện, rõ như giọng hát trong bóng tối._
_Mình chưa từng sợ Nguyên._
_Mình chỉ sợ bị quên._
_Ở cổng, anh {quan_ly_idol} đứng chờ, tay cầm một ly cà phê, không cầm điện thoại nào. Anh không nói gì. Anh chỉ chờ._
_Bạn đi xuống khỏi sân khấu, lần đầu tiên không cúi chào ai._
-> END
