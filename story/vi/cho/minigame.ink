// ============================================================
// MINIGAME CỦA TUẤT
// Mỗi minigame có 3 cảnh: mở đầu (cho_mg_<tên>), thắng
// (cho_mg_<tên>_thang) và thua (cho_mg_<tên>_thua).
// Game chạy cảnh mở đầu, cho chơi, rồi mở cảnh thắng hoặc thua.
// Phần thưởng của Tuất là đồ ăn, đồ chơi, được gãi bụng, và
// tiền rơi mang về cho bác (cứ 10.000đ không chủ = 1 cây xúc xích).
// ============================================================

// ============================================================
// 🛁 CHẠY TRỐN KHỎI CÁI CHẬU (chỉ ngày 4/10)
// ============================================================
=== cho_mg_tron_tam ===
# minigame:tron_tam # ngay:4 # noi:san_cong_ty
_Bác xắn tay áo. Bác cầm khăn. Bác tiến tới, chậm rãi, như một võ sĩ già._
bac_bao_ve: TUẤT… bla bla… TẮM… bla. # phu_de:{cho}, lại đây. Tắm có tí thôi.
_Luật chơi: chạy quanh sân, núp sau xe máy, chui gầm cầu thang. Đừng để bác và cái chậu dồn vào góc. Cẩn thận: vũng nước xà phòng rất trơn._
-> END

=== cho_mg_tron_tam_thang ===
# minigame:tron_tam # ket_qua:thang
_Bạn lách qua chân bác, chui qua gầm xe, nhảy qua cái chậu. Bác đứng giữa sân, thở dốc, tay vẫn cầm khăn khô._
bac_bao_ve: Bla bla… bla… bla bla. # phu_de:Thôi… bác già rồi… chịu mày.
_Bạn thắng. Bạn khô ráo. Mũi bạn vẫn ngửi được cả thế giới._
~ ch_mui(2)
_Nhưng rồi từ kho sự kiện, một mùi quen bước ra: dầu xoa bóp, cao su bao cát, cơm nhà. {chi_dai} xắn tay áo, ngồi xổm, không đuổi, chỉ chìa tay ra._
chi_dai: TUẤT. Bla bla… bla bla bla? # phu_de:{cho}. Chị tắm thì em chịu đúng hông?
* [🐾 Tự đi tới. Người này thì được.]
    ~ qh("chi_dai", 8)
    ~ ch_cung(5)
    -> cho_0410_cai_chau.cho_0410_tam_xong
* [🏃 Chạy tiếp. Không ai hết!]
    _Bạn chạy ra cổng. {chi_dai} không đuổi. Người đó chỉ đứng dậy, phủi tay, và đợi. Mười phút sau, bạn tự quay về. Người đó vẫn ở đó._
    _Bạn thua một trận mà không ai đuổi bạn cả._
    ~ qh("chi_dai", 4)
    -> cho_0410_cai_chau.cho_0410_tam_xong

=== cho_mg_tron_tam_thua ===
# minigame:tron_tam # ket_qua:thua
_Bạn trượt chân trên vũng xà phòng. Một cú trượt dài, trượt thẳng vào lòng cái chậu. Tõm._
_Bác đứng nhìn, không tin nổi. Rồi bác cười to, to tới mức phải ngồi xuống ghế._
bac_bao_ve: Bla bla… bla… bla bla bla! # phu_de:Mày tự nhảy vào à! Giỏi! Giỏi!
_Bác kỳ cọ được nửa lưng thì bạn vùng ra, rũ lông. Bác ướt từ đầu tới chân._
~ ch_mui(-3)
~ qh("bac_bao_ve", 2)
_{chi_dai} đi ngang qua, thấy cảnh đó, lắc đầu, xắn tay áo._
chi_dai: Bla bla… bla. Bla bla bla. # phu_de:Thôi bác nghỉ đi. Để con. Nó chỉ chịu con thôi.
-> cho_0410_cai_chau.cho_0410_tam_xong

// ============================================================
// 🌭 PHI VỤ TỦ LẠNH
// ============================================================
=== cho_mg_tu_lanh ===
# minigame:tu_lanh # noi:pantry
_Luật chơi: nằm rình sau thùng nước suối. Khi có người mở tủ lạnh chung, bạn có 3 giây để lẻn vào ngoạm một món. Tránh tầm mắt của {ke_toan} và {thanh_ninh}._
_Cửa pantry mở. Tiếng dép lẹp xẹp. Một bàn tay đặt lên tay nắm tủ lạnh…_
-> END

=== cho_mg_tu_lanh_thang ===
# minigame:tu_lanh # ket_qua:thang
_Cửa tủ mở. Ba giây. Bạn lao vào như một tia chớp vàng, ngoạm, quay ra, biến mất dưới gầm bàn trước khi cửa tủ kịp đóng._
{ RANDOM(1, 2) == 1:
    _Trong miệng bạn: một hộp cơm. Nắp có dán băng keo, trên đó viết gì đó. Bạn không biết chữ. Nhưng nó có mùi thịt kho._
    ~ ch_an(40)
    _Bạn ăn sạch dưới gầm cầu thang. Ngon như cơm nhà._
    _Chiều đó, có người đứng trước tủ lạnh rất lâu, tay cầm cái nắp hộp trống, mặt buồn như vừa mất lương._
- else:
    _Trong miệng bạn: một cây xúc xích. Còn trong bao. Hàng của ai đó mua ở cửa hàng tiện lợi 24/7._
    ~ ch_an(20)
    ~ nhan(xuc_xich)
    _Bạn tha nó về kho. Lương phụ của tháng này._
}
-> END

=== cho_mg_tu_lanh_thua ===
# minigame:tu_lanh # ket_qua:thua
_Cửa tủ mở. Bạn lao vào. Và một bàn tay túm gọn gáy bạn._
{ RANDOM(1, 2) == 1:
    ke_toan: TUẤT. Bla bla… bla bla bla… bla. # phu_de:{cho}. Hộp cơm này của chị. Muốn ăn thì đưa hóa đơn đây.
    _{ke_toan} nhìn bạn. Bạn nhìn {ke_toan}. Bạn không có hóa đơn. Bạn chưa bao giờ có hóa đơn._
    ~ qh("ke_toan", -3)
- else:
    thanh_ninh: Bla bla! TUẤT! Bla bla bla bla! # phu_de:Á! {cho}! Đây là sữa chua của anh {giam_doc} đó! Hư quá!
    _{thanh_ninh} la to tới mức cả tầng nghe. Cả tầng biết bạn ăn vụng. Cả tầng biết sếp có sữa chua riêng._
    ~ qh("thanh_ninh", -3)
}
~ ch_cung(-10)
_Bạn bị đuổi ra khỏi pantry. Cái đuôi cụp. Mũi vẫn còn vương mùi thịt kho._
-> END

// ============================================================
// 🎾 NHẶT BÓNG VỚI DUY
// ============================================================
=== cho_mg_nhat_bong ===
# minigame:nhat_bong # gio:12:30 # noi:bai_xe
_Giờ nghỉ trưa. Bãi xe. {thuc_tap_sinh} cầm quả bóng tennis cũ, mắt sáng như trẻ con._
thuc_tap_sinh: TUẤT! Bla bla… bla bla bla! # phu_de:{cho}! Lần này anh ném xa hơn nha! Combo mười cái là có bánh quy!
_Luật chơi: nhìn quả bóng bay, bấm đúng lúc để nhảy lên bắt giữa không trung. Bắt liền nhiều lần thì combo càng dài, {thuc_tap_sinh} càng vui._
-> END

=== cho_mg_nhat_bong_thang ===
# minigame:nhat_bong # ket_qua:thang
_Một. Hai. Năm. Mười. Bạn bắt bóng như một vận động viên. Lần cuối cùng, bạn bay lên, xoay nửa vòng trên không, ngoạm gọn._
thuc_tap_sinh: Bla bla bla! TUẤT… NGOAN… NGOAN! # phu_de:Trời ơi đỉnh quá! {cho} ngoan! Ngoan nhất quận!
_{thuc_tap_sinh} ngồi bệt xuống đất gãi bụng bạn, rồi móc trong túi áo ra hai cái bánh quy, gói giấy, đã hơi vỡ._
~ ch_cung(5)
~ ch_an(10)
~ qh("thuc_tap_sinh", 5)
_Bánh quy vỡ vẫn là bánh quy. {thuc_tap_sinh} cười, lần đầu tiên trong ngày không "dạ" với ai._
-> END

=== cho_mg_nhat_bong_thua ===
# minigame:nhat_bong # ket_qua:thua
_Quả bóng bay. Bạn nhảy. Trượt. Quả bóng lăn vào gầm xe hơi của {giam_doc}._
_Bạn chui vào lấy. Ra ngoài với quả bóng, một cái lò xo và một đống bụi đen trên mũi._
thuc_tap_sinh: Bla bla… bla bla. # phu_de:Không sao đâu {cho}, lần sau mình bắt lại nha.
~ qh("thuc_tap_sinh", 2)
~ ch_an(5)
_{thuc_tap_sinh} vẫn cho bạn một cái bánh quy. Người này không biết từ chối ai, kể cả một con chó bắt hụt._
-> END

// ============================================================
// 🪙 SĂN TIỀN RƠI
// ============================================================
=== cho_mg_san_tien ===
# minigame:san_tien # noi:tang_1
_Luật chơi: đánh hơi dưới gầm bàn, khe ghế, bãi xe. Tiền giấy có mùi tay người, đồng xu có mùi kim loại. Ngậm về chòi cho bác bỏ vào ống bơ._
_Dưới gầm bàn có cả một thế giới: vỏ kẹo, nắp bút, cọng mì khô, và… mùi tiền._
-> END

=== cho_mg_san_tien_thang ===
# minigame:san_tien # ket_qua:thang
_Bạn ngậm về chòi, từng chuyến một, đặt lên bàn trà của bác._
~ temp tim_duoc = RANDOM(1, 4)
{ tim_duoc:
- 1:
    _Một tờ 10.000đ nhàu nát. Mùi bánh mì ăn lén và mùi cửa sau._
    bac_bao_ve: Bla bla… bla. # phu_de:Tiền của thằng {dan_dau_tu} rồi. Nó hay rơi tiền lẻ lắm.
    _Bác trả lại. {dan_dau_tu} cầm tờ tiền, nhìn bạn, rồi bẻ cho bạn một khúc xương gặm trong túi (sao trong túi người này có xương gặm?)._
    ~ qh("dan_dau_tu", 5)
    ~ ch_an(10)
    ~ ch_cung(5)
    ~ ch_tong_tien_nhat = ch_tong_tien_nhat + 10000
- 2:
    _Ba đồng xu 5.000đ trong khe ghế sofa sảnh, và một tờ 2.000đ dưới máy in. Không có mùi ai rõ ràng. Mùi của cả công ty._
    ~ ch_nhat_tien(17000)
    bac_bao_ve: Bla bla… NGOAN… bla. # phu_de:Không biết của ai. Bỏ ống. Ngoan.
- 3:
    _Một tờ 20.000đ ở bãi xe, cạnh chỗ đỗ chiếc xe hồng. Mùi bánh chuối chiên._
    bac_bao_ve: Bla bla… HỒNG… bla bla. # phu_de:Của anh {sieu_nhan_hong} à. Để bác trả.
    _Chiều, bộ đồ hồng xuống chòi, cảm ơn bác, rồi ngồi xổm trước mặt bạn với một miếng chả._
    sieu_nhan_hong: Bla bla… TUẤT… bla! # phu_de:Em lượm tiền trả anh hả? Thưởng nè! Không chọc đâu, thưởng thật!
    ~ ch_an(10)
    ~ ch_hong_doi(-3)
    ~ ch_cung(5)
    ~ ch_tong_tien_nhat = ch_tong_tien_nhat + 20000
- else:
    _Hai tờ 10.000đ kẹp trong một quyển sổ rơi ở cầu thang. Không có mùi chủ. Chỉ có mùi bụi._
    ~ ch_nhat_tien(20000)
}
{ ch_tien_ong_bo >= 10000:
    ~ temp so_cay = ch_doi_xuc_xich()
    _Ống bơ đủ tiền rồi. Bác đi ra cửa hàng tiện lợi 24/7, mang về {so_cay} cây xúc xích. Lương phụ, do chính bạn kiếm._
    bac_bao_ve: Bla bla… XÚC XÍCH… NGOAN. # phu_de:Tiền mày nhặt, xúc xích của mày. Ngoan.
}
~ ch_mui(1)
-> END

=== cho_mg_san_tien_thua ===
# minigame:san_tien # ket_qua:thua
_Bạn ngửi khắp gầm bàn. Tìm được: một nắp bút, ba cọng mì khô, một cái kẹp giấy và một con gián đang rất bất ngờ._
_Không có tiền. Hôm nay loài người giữ ví rất chặt. Chắc vì gần ngày lương._
{ RANDOM(1, 2) == 1:
    _Bạn ngậm cái nắp bút về cho bác. Bác cầm lên, nhìn, rồi cất vào ống bơ._
    bac_bao_ve: Bla… bla bla. # phu_de:Ừ, cũng là đồ rơi. Bác ghi nhận.
}
~ ch_do_no = gioi_han(ch_do_no - 5)
-> END

// ============================================================
// 🚪 TRỰC CỔNG VỚI BÁC
// ============================================================
=== cho_mg_truc_cong ===
# minigame:truc_cong # noi:cong_cong_ty
_Luật chơi: khách tới cổng. Sủa đúng người lạ (paparazzi, người của LL), vẫy đuôi đúng khách thật. Shipper là ẩn số: shipper giao đồ ăn mà không bị sủa thì hay cho một miếng._
bac_bao_ve: TUẤT. Bla bla. # phu_de:{cho}. Trực với bác.
-> END

=== cho_mg_truc_cong_thang ===
# minigame:truc_cong # ket_qua:thang
_Người đeo máy ảnh ống kính dài, áo nhiều túi: bạn sủa. Người đó lùi ra tận vỉa hè bên kia._
_Một bà cụ tới hỏi đường: bạn vẫy đuôi. Bà cụ xoa đầu bạn._
_Anh shipper với túi cơm tấm: bạn… ngồi im. Cắn răng. Không sủa._
{ RANDOM(1, 2) == 1:
    shipper_teo: Bla bla… bla? TUẤT… bla bla… ĂN! # phu_de:Ủa không sủa tui hả? Bữa nay ngoan vậy! Nè, miếng sườn, ăn đi!
    ~ ch_an(10)
}
~ ch_khong_sua_shipper = ch_khong_sua_shipper + 1
bac_bao_ve: Bla bla… NGOAN… XƯƠNG. # phu_de:Giỏi. Hôm nay mày trực giỏi hơn bác. Khúc xương to đây.
~ ch_an(20)
~ ch_cung(5)
~ qh("bac_bao_ve", 3)
_Khúc xương to. Bác vuốt đầu. Hôm nay không ai lạ lọt qua cổng. Hôm nay không ai chụp được mặt người đồ hồng._
~ ch_lo_mat_nguyen = ch_lo_mat_nguyen - 3
-> END

=== cho_mg_truc_cong_thua ===
# minigame:truc_cong # ket_qua:thua
_Một người đàn ông mặc vest xám, cặp da, giày bóng tới cổng. Bạn sủa. Sủa rất to._
_Người đó là đại diện "Sữa Chua Hồng Hào" tới hỏi thăm. Người đó lùi lại, bỏ về, không để lại danh thiếp._
_Rồi người đeo máy ảnh ống kính dài đi qua. Bạn đang bận gãi tai. Người đó chụp được một tấm qua khe cổng._
_Rồi shipper. Bạn sủa. Theo thói quen._
~ ch_khong_sua_shipper = 0
bac_bao_ve: Bla… TUẤT… bla bla. # phu_de:{cho}… mày sủa nhầm người rồi. Bác lại bị mắng.
~ qh("bac_bao_ve", -2)
~ ch_cung(-3)
_Bác không mắng bạn. Bác chỉ thở dài. Cái thở dài của bác nặng hơn mọi câu mắng._
-> END

// ============================================================
// 📸 NGƯỜI MẪU TÓP-TÓP
// ============================================================
=== cho_mg_nguoi_mau ===
# minigame:nguoi_mau # noi:san_cong_ty
_{hong_hot} dựng điện thoại lên giá, bật đèn tròn. Trên tay là một hộp pate. Ánh mắt của người sắp lên xu hướng._
hong_hot: TUẤT! Bla bla… NGỒI! BẮT TAY! NẰM! Bla bla bla! # phu_de:{cho}! Nghe chị nè: Ngồi! Bắt tay! Nằm! Làm đúng là có pate!
_Luật chơi: nghe từ khóa NGỒI, BẮT TAY, NẰM, làm đúng động tác. Có lúc {hong_hot} sẽ lôi ra một cái áo hồng._
-> END

=== cho_mg_nguoi_mau_thang ===
# minigame:nguoi_mau # ket_qua:thang
_NGỒI: bạn ngồi. BẮT TAY: bạn đưa chân. NẰM: bạn nằm. Rồi bạn lăn một vòng, không ai bảo. Thêm một chút nghệ thuật._
hong_hot: Bla bla bla! Ối dồi ôi! Bla bla! # phu_de:Trời ơi lăn luôn! Lên xu hướng chắc rồi! Gắn tag anh {sieu_nhan_hong} nè!
~ follow(10000)
~ ch_tuat_noi_hon_nguyen = true
~ ch_an(25)
_Một hộp pate. Và một món đồ chơi mới: con vịt cao su màu vàng, kêu "chít chít" mỗi lần cắn._
{ not ch_co_vit_cao_su:
    ~ ch_co_vit_cao_su = true
    ~ ch_tha_ve_kho()
    _Con vịt về kho. Bạn cắn nó một nghìn lần. Nó kêu một nghìn lần. Hạnh phúc là thứ kêu "chít chít"._
}
~ qh("hong_hot", 5)
-> END

=== cho_mg_nguoi_mau_thua ===
# minigame:nguoi_mau # ket_qua:thua
_NGỒI: bạn nằm. BẮT TAY: bạn ngồi. NẰM: bạn chạy đi đuổi một con bướm._
_Rồi {hong_hot} lôi cái áo hồng ra. Bạn lùi lại ba bước, gầm gừ, ngồi im như tượng._
hong_hot: Bla bla… bla bla. # phu_de:Ủa… cái này đăng được hông ta. "{cho} ghét màu hồng phần 47."
_Clip vẫn được đăng. Không lên xu hướng. Nhưng có một bình luận: "Con chó này có chính kiến hơn tui."_
~ follow(2000)
~ ch_an(10)
_Vẫn được nửa hộp pate. {hong_hot} không bao giờ để người mẫu đói._
-> END

// ============================================================
// 🕵️ THEO DẤU MÙI
// ============================================================
=== cho_mg_theo_dau ===
# minigame:theo_dau # noi:pantry
_{ke_toan} đứng trước tủ lạnh, tay cầm cái hộp cơm trống. Thịt kho biến mất. Chỉ còn mùi._
ke_toan: TUẤT. Bla bla… bla bla bla… bla. # phu_de:{cho}. Hộp thịt kho của chị. Ai ăn, em tìm giùm chị. Tìm được chị chia nửa hộp mai.
_Luật chơi: ngửi cái hộp, rồi lần theo vệt mùi qua 3 tầng. Mùi lẫn nhau: cơm tấm của {con_ong_chau_cha} khác cơm tấm của {thuc_tap_sinh}. Đừng để bị đánh lừa._
-> END

=== cho_mg_theo_dau_thang ===
# minigame:theo_dau # ket_qua:thang
_Mùi thịt kho dẫn bạn đi: qua pantry, lên cầu thang, qua bàn photo, dừng ở một cái bàn. Bạn ngồi xuống. Thẳng lưng._
{ RANDOM(1, 3):
- 1:
    _Bàn của {chua_te_deadline}. Người đó đang ngủ, khóe miệng còn dính một hạt tiêu._
    chua_te_deadline: *(tỉnh dậy)* Bla bla… bla. # phu_de:Ủa… hộp đó không ghi tên mà… à có ghi hả…
- 2:
    _Bàn của {dan_dau_tu}. Dưới gầm bàn có cái nắp hộp, giấu rất vụng._
    dan_dau_tu: Bla bla… bla bla bla! # phu_de:Đáy rồi chị ơi, đáy thật rồi, em đói quá!
- else:
    _Bàn của {idol_het_thoi}. Người đó đang nhai. Kính đen không che được gì cả._
    idol_het_thoi: Bla bla… bla? # phu_de:Em biết anh là ai không? …Dạ, em ăn.
}
ke_toan: Bla bla. TUẤT… NGOAN. # phu_de:Ghi nhận. {cho} ngoan. Mai chị mang nửa hộp thịt kho cho em.
~ ch_mui(3)
~ ch_an(30)
~ qh("ke_toan", 6)
~ ch_cung(3)
-> END

=== cho_mg_theo_dau_thua ===
# minigame:theo_dau # ket_qua:thua
_Mùi thịt kho dẫn bạn đi… rồi lẫn vào mùi cơm tấm, mùi mì ly, mùi trà sữa. Bạn đi lòng vòng ba tầng, rồi ngồi xuống trước… cái tủ lạnh. Nơi bắt đầu._
ke_toan: Bla… bla bla. # phu_de:Ừ… chị cũng đoán là cái tủ lạnh ăn.
~ ch_mui(1)
_{ke_toan} cười. Lần đầu tiên trong tuần bạn thấy người này cười. Mất hộp thịt kho mà vẫn cười được, chắc là mệt lắm rồi._
-> END
