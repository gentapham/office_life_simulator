// ============================================================
// IDOL HẾT THỜI · ĐÁNH GIÁ & 6 KẾT THÚC
// Chạy sau Đại Nhạc Hội Siêu Nhân (23:30 ngày 31/10), khi
// ket_thuc_su_nghiep và chung_cong_ty_song đã được chốt.
// Thứ tự: 🔒 Đôi Bạn Thân > Công Viên Hồng > Ca Sĩ Đám Cưới
//         > Tủ Kính Tiệm Cầm Đồ > Fan Ảo Bỏ Đi > Sân Khấu Trống
// Mặc định: còn hợp đồng thì Ca Sĩ Đám Cưới, không thì Tủ Kính.
// ============================================================

=== idol_het_thoi_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau_dem_hong
{ ket_thuc_su_nghiep == "":
    ~ chung_chot_ket_thuc_su_nghiep()
}
{
// 3. 🔒 Đôi Bạn Thân (bí mật)
- phat_biet_chuoichien89 and phat_thay_anh and qh_quan_ly_idol >= 80 and phat_thai_o_lai:
    ~ chot_ket_thuc("doi_ban_than")
    -> idol_het_thoi_kt_doi_ban_than
// 1. Công Viên Hồng: đã song ca (hoặc hát thay khi Nguyên vắng), không còn fan ảo
- (phat_song_ca_dem_hong or phat_vai_dem_hong == "thay_nguyen") and phat_fan_ao == 0 and phat_noi_tieng >= 35:
    ~ chot_ket_thuc("cong_vien_hong")
    -> idol_het_thoi_kt_cong_vien_hong
// 2. Ca Sĩ Đám Cưới
- phat_tinh_tuong <= 50 and phat_gianh_sau_16 == 0 and (phat_gia_han or phat_so_show >= 2) and not (phat_cam_cup and not phat_chuoc_cup):
    ~ chot_ket_thuc("ca_si_dam_cuoi")
    -> idol_het_thoi_kt_ca_si_dam_cuoi
// 5. Tủ Kính Tiệm Cầm Đồ
- (phat_cam_cup and not phat_chuoc_cup) or (phat_no >= 40000000 and not phat_gia_han):
    ~ chot_ket_thuc("tu_kinh")
    -> idol_het_thoi_kt_tu_kinh
// 4. Fan Ảo Bỏ Đi
- phat_bi_boc_phot and phat_fan_ao_khi_boc >= 100000 and not phat_lat_phot:
    ~ chot_ket_thuc("fan_ao_bo_di")
    -> idol_het_thoi_kt_fan_ao_bo_di
// 6. Sân Khấu Trống
- phat_pha_chien_dich >= 2 and not chung_cong_ty_song:
    ~ chot_ket_thuc("san_khau_trong")
    -> idol_het_thoi_kt_san_khau_trong
- phat_gia_han:
    ~ chot_ket_thuc("ca_si_dam_cuoi")
    -> idol_het_thoi_kt_ca_si_dam_cuoi
- else:
    ~ chot_ket_thuc("tu_kinh")
    -> idol_het_thoi_kt_tu_kinh
}

// ------------------------------------------------------------
// 😄 1. CÔNG VIÊN HỒNG
// ------------------------------------------------------------
=== idol_het_thoi_kt_cong_vien_hong ===
# ket_thuc:cong_vien_hong # loai:co_hau
{ phat_vai_dem_hong == "thay_nguyen":
    _Đêm đó {sieu_nhan_hong} không có mặt. Bạn hát "Công Viên" một mình cho mấy chục người sát sân khấu, cạnh một vệt đèn hồng trống trơn. Clip quay bằng điện thoại của một cô sinh viên._
    _Ba ngày sau, clip có ba triệu lượt xem. Lần này không có bình luận nào giống nhau._
- else:
    _Ba ngày sau Đại Nhạc Hội Siêu Nhân, bản remix "Công Viên Hồng" lên top 1 xu hướng._
}
_Cả nước lại hát "thích ăn chuối chiên". Lần này kèm một điệu nhảy: hai tay xiên que, lắc hông, tạo dáng siêu nhân ở câu cuối._
_Học sinh nhảy ở sân trường. Mấy chú xe ôm nhảy ở ngã tư. Một cô bán cá viên chiên ở Vũng Tàu quay clip nhảy cạnh xe đẩy, ghi: "Bài của thằng nhỏ hồi xưa đó!"_
hong_hot: *(gọi tới, hét)* Anh {idol_het_thoi} ơi! Top 1! Top 1 thiệt! Không có hoa sen nào hết! Người thật hết đó anh!
_Kênh của bạn: 0 tài khoản ảo. 214.000 người theo dõi thật. Bạn đếm đi đếm lại, như đếm tiền._
{ phat_vai_dem_hong != "thay_nguyen":
    sieu_nhan_hong: *(nhắn)* Anh ơi em viết chữ CHUỐI lên tay vẫn chưa rửa. Em giữ luôn được hông?
}
{ chung_cong_ty_song:
    giam_doc: *(nhắn group lúc 22:00)* Cả nhà ơi. Năm 2015 anh tưởng anh là thiên tài. Năm nay anh biết thiên tài là cả nhà mình. Anh không ép. Anh cảm ơn.
- else:
    giam_doc: *(nhắn riêng lúc 22:00)* Công ty không giữ được, em ạ. Nhưng bài hát thì giữ được. Em hát tiếp đi. Anh nghe.
}
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
# ket_thuc:ca_si_dam_cuoi # loai:co_hau
_Cuối tháng 11. Một đám cưới ở nhà hàng Hạnh Phúc Trăm Năm, sảnh B. Đám thứ 23 kể từ Đại Nhạc Hội Siêu Nhân._
_Lịch của bạn kín tới Tết. {chung_cong_ty_song:Hợp đồng với {cong_ty} vẫn còn, nhưng phần lớn lịch là đám cưới.|{cong_ty} không còn, nhưng mùa cưới thì còn.} Anh {quan_ly_idol} phải mua thêm một cuốn sổ. {ke_toan} đã dạy bạn xuất hóa đơn, bạn xuất hóa đơn đẹp như ký tặng._
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
# ket_thuc:doi_ban_than # loai:co_hau # bi_mat
_Đại Nhạc Hội Siêu Nhân tan lúc 23 giờ. Bãi đất trước sân khấu đầy giấy kim tuyến hồng. Công nhân bắt đầu cuộn dây điện._
_Ở cổng Sân khấu Đại Nhạc Hội Siêu Nhân có một xe chuối chiên còn mở. Ông bán chuối chiên đang dọn hàng._
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
# ket_thuc:fan_ao_bo_di # loai:buon
_23:30. Đại Nhạc Hội tan. Bạn về thẳng căn 1808, không đi ăn mừng với ai. Đèn tắt, chỉ có ánh ring light mượn của {hong_hot}._
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
_Ngoài cửa sổ, xa xa, quảng trường vẫn còn người chưa về, vẫn còn hát. Hình như họ đang hát "thích ăn… khoai chiên"._
_Không ai sửa lời._
_Điện thoại báo một tin nhắn. Máy của anh {quan_ly_idol}: "Em ở đâu? Anh tới." Bạn đọc. Không trả lời._
_Bạn vẫn ngồi đó, livestream cho không ai xem, kính đen trên mặt, trong căn phòng tối. Bốn bức tường nhìn xuống, toàn là bạn năm 2015, cười tươi._
-> END

// ------------------------------------------------------------
// 😢 5. TỦ KÍNH TIỆM CẦM ĐỒ
// ------------------------------------------------------------
=== idol_het_thoi_kt_tu_kinh ===
# ket_thuc:tu_kinh # loai:buon
{ phat_gia_han:
    _Hợp đồng được gia hạn, kèm 10 triệu thưởng. Nhưng 10 triệu không đủ trả {phat_no} đồng tiền nợ, và tiền nhà 1808 là 12 triệu một tháng._
- else:
    _Hợp đồng độc quyền của bạn hết hạn lúc 0 giờ ngày 1/11. Không ai gia hạn._
}
_Sáng 2/11, bạn dọn ra khỏi căn 1808. Bà quản lý đứng ở cửa đếm từng món đồ. Bốn mươi tấm poster cuộn tròn nhét trong một thùng mì gói._
{ phat_cam_cup and not phat_chuoc_cup:
    _Thùng đồ không có cái cúp. Hôm 30/10 là hạn chót chuộc, và bạn không chuộc._
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
# ket_thuc:san_khau_trong # loai:buon
{ nguyen_theo_ll:
    _{sieu_nhan_hong} đã sang LL. Chiến dịch Siêu Nhân Hồng coi như thất bại. {cong_ty} phải hoàn 10 tỷ. Phá sản._
- else:
    _Chiến dịch Siêu Nhân Hồng dừng ở {nguoi_theo_doi} người theo dõi. {cong_ty} phải hoàn 10 tỷ. Phá sản._
}
_Hợp đồng độc quyền của bạn, mười một năm, trở thành một tờ giấy không ai cần ký gia hạn, vì không còn ai để ký._
_Sáng 1/11. Sân khấu Đại Nhạc Hội Siêu Nhân. Công nhân đang tháo dỡ. Phông hồng được cuộn lại, đèn được hạ xuống, giấy kim tuyến bị quét thành đống._
_Bạn đứng giữa sân khấu. Không micro. Không đèn. Không kính đen: nó rơi đâu đó đêm qua, bạn không đi tìm._
_Bạn hát. "Ngày xưa có đôi bạn thân… bán cá viên chiên…"_
_Mấy chú công nhân dừng tay. Một chú ngồi xuống bậc thang, châm điếu thuốc, nghe hết bài._
cong_nhan: Hay đó. *(đứng dậy, phủi quần)* Mà dời qua cho tụi chú tháo cái đèn nha con.
_Bạn dời qua. Cái đèn được tháo xuống. Chỗ bạn vừa đứng giờ chỉ còn một vệt sáng hình chữ nhật trên sàn gỗ, nơi lớp bụi chưa kịp bám._
_Bạn nhớ lại cả tháng: cái micro bị giật, cái bánh kem bị đổ, những lần bước vào khung hình của người khác._
_Bạn nhớ ra một chuyện, rõ như giọng hát trong bóng tối._
_Mình chưa từng sợ {sieu_nhan_hong}._
_Mình chỉ sợ bị quên._
_Ở cổng, anh {quan_ly_idol} đứng chờ, tay cầm một ly cà phê, không cầm điện thoại nào. Anh không nói gì. Anh chỉ chờ._
_Bạn đi xuống khỏi sân khấu, lần đầu tiên không cúi chào ai._
-> END
