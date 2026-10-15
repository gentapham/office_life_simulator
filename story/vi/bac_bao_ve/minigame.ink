// ============================================================
// BÁC BẢO VỆ: BÌNH · MINIGAME (mở đầu / thành công / thất bại)
// Game chạy cảnh _mo_dau, rồi chơi minigame, rồi chạy
// _thanh_cong hoặc _that_bai theo kết quả.
// ============================================================

// ============================================================
// 🛵 XẾP XE GIỜ CAO ĐIỂM
// ============================================================
=== bac_bao_ve_mg_xep_xe_mo_dau ===
# noi:bai_xe
_7 giờ 45. Xe máy đổ vào bãi như thác. Còi bấm inh ỏi. Bác cầm cái còi nhựa, đứng giữa bãi như cảnh sát giao thông._
_Luật của bãi: xe {giam_doc} vào chỗ quen dưới gốc cây. Xe {con_ong_chau_cha} (to nhất) không được chắn lối. Xe hồng của {sieu_nhan_hong} vào ô "HỒNG" như hợp đồng._
_Và không xe nào được đỗ trước ổ của {cho}._
cho: Gâu! *(đứng gác ổ)*
-> END

=== bac_bao_ve_mg_xep_xe_thanh_cong ===
_8 giờ 05. Bãi xe xếp thẳng tắp như hàng quân. Xe nào cũng ra được, xe nào cũng vào được. {giam_doc} dắt xe vào chỗ quen, gật đầu: "Bác xếp như xếp cờ."_
_{thuc_tap_sinh} chạy ra cổng, đưa bác một ổ bánh mì ốp la nóng hổi: "Dạ con mua dư một ổ ạ." Không phải mua dư. Bác biết._
~ tien_cong(80000)
~ uy_tin = uy_tin + 2
~ bv_co_banh_mi_op_la = true
~ an(30)
~ bv_tam(3)
-> END

=== bac_bao_ve_mg_xep_xe_that_bai ===
_Xe {con_ong_chau_cha} đỗ chéo giữa lối. Xe hồng lấn sang ô của {giam_doc}. Một chiếc xe số đỗ ngay trước ổ {cho}, bị {cho} tè vào bánh._
_17 giờ 30, cả bãi kẹt cứng. Hai mươi người đứng chờ bác dắt từng xe ra. Ai cũng nhìn đồng hồ._
~ bv_tam(-5)
~ uy_tin = uy_tin - 2
~ bv_qh_ca_cong_ty(-1)
-> END

// ============================================================
// 🚪 AI ĐƯỢC VÀO CỔNG
// ============================================================
=== bac_bao_ve_mg_cong_mo_dau ===
# noi:cong_cong_ty
_Một hàng người đứng ngoài cổng. Mỗi người một lý do. Sổ hẹn trên bàn. Cặp kính lão trên mũi._
_Shipper thật thì giày mòn, áo bạc màu, biết tên người nhận. Paparazzi giả shipper thì giày mới, máy ảnh trong túi. Người của LL thì nói giọng diễn giả, mùi nước hoa lá chuối._
_Còn đoàn thuế thật thì… không cười._
{ bv_g_khuyen_giay:
    _Bác nhớ lời G: "Nhìn giày."_
}
-> END

=== bac_bao_ve_mg_cong_thanh_cong ===
_Ba kẻ gian bị chặn ở cổng. Một paparazzi giả shipper, một "khách hàng" đi giày da bóng của LL, một cậu bán bảo hiểm tự nhận là cháu giám đốc._
_Người thật thì vào hết, không ai phải chờ quá 1 phút. {cho} chỉ sủa đúng người._
_Lúc đi ra, cậu "khách hàng" của LL làm rơi tấm danh thiếp màu xanh lá chuối. Bác nhặt, kẹp vào sổ._
~ tien_cong(300000)
~ bv_bm(1)
~ bv_chan_paparazzi = bv_chan_paparazzi + 1
~ follow(10000)
-> END

=== bac_bao_ve_mg_cong_that_bai ===
_Bác chặn nhầm một người: chị đối tác thật của {sales}, đi xe máy cũ, đội nón lá. Chị bỏ về, không ký hợp đồng._
_Chiều đó {ke_toan} xuống chòi, mặt khổ sở: "Con xin lỗi bác, sếp bảo trừ 50 nghìn… con phải ghi."_
~ tien_cong(-50000)
~ qh("sales", -5)
~ bv_tam(-5)
-> END

// ============================================================
// 🔦 TUẦN TRA NỬA ĐÊM
// ============================================================
=== bac_bao_ve_mg_tuan_tra_mo_dau ===
# noi:toa_nha_ban_dem
_Nửa đêm. Đèn pin. Ba tầng lầu và sân thượng. Tiếng máy lạnh nhỏ giọt, tiếng chuột chạy trong trần._
_Tầng 1 có ánh sáng xanh của màn hình phòng dựng. Tầng trệt có tiếng ngáy trong phòng server. Tầng 2 thì… im. Quá im._
-> END

=== bac_bao_ve_mg_tuan_tra_thanh_cong ===
_Một vòng trọn vẹn. Phòng dựng: {editor} đang render, bác nhắc "ngủ đi cháu". Phòng server: {it} ngủ trên ghế, bác đắp cho cái áo. Tầng 2: cửa khóa, ngăn kéo đóng. Sân thượng: chỉ có gió._
_Lúc bác đi xuống, {it} mở cửa phòng server, đưa ra một ly mì đã chế nước sôi: "Bác. Ăn khuya."_
~ tien_cong(150000)
~ nhan(mi_ly)
~ an(25)
~ bv_bm(2)
~ bv_tam(-10)
-> END

=== bac_bao_ve_mg_tuan_tra_that_bai ===
_Đèn pin hết pin ở cầu thang tầng 2. Bác đứng trong bóng tối, nghe tiếng bước chân ở đâu đó trên đầu. Rồi im._
_Bác lần tay vịn đi xuống, vấp bậc cuối, trẹo chân. Sáng mai mới biết đêm qua có ai đó đã ở trên sân thượng._
~ bv_tam(-15)
~ nghi(-15)
-> END

// ============================================================
// 🍵 QUÁN TRÀ ĐÁ CỔNG SAU
// ============================================================
=== bac_bao_ve_mg_tra_da_mo_dau ===
# noi:choi_bao_ve
_Hai cái ghế nhựa. Một ấm trà to. Một xô đá._
_{ke_toan} uống đặc, không đá. {chi_dai} uống đặc, nhiều đá. {thuc_tap_sinh} uống nhạt, xin thêm đường mà không dám nói. {dan_dau_tu} uống gì cũng được, miễn là miễn phí._
_Ai đang nóng ruột thì thêm đá. Rót đúng thì người ta ngồi lâu. Ngồi lâu thì người ta kể._
-> END

=== bac_bao_ve_mg_tra_da_thanh_cong ===
_Mười ly trà, mười người ngồi. Ai cũng được rót đúng vị. Người thì kể chuyện vợ con, người thì kể chuyện sếp, người thì kể chuyện mình không dám kể ở tầng trên._
_Người cuối cùng đứng dậy, để lại trên bàn một gói hạt dưa và hai trái cam: "Bác giữ lấy. Cảm ơn bác nghe con."_
~ tien_cong(30000)
~ bv_so_ly_tra = bv_so_ly_tra + 10
~ bv_tam(5)
~ bv_bm(1)
~ bv_co_hat_dua = true
~ bv_co_trai_cam = true
-> END

=== bac_bao_ve_mg_tra_da_that_bai ===
_Bác rót trà đặc cho {thuc_tap_sinh}, cậu nhăn mặt uống hết vì không dám chê. Bác quên thêm đá cho {chi_dai}, chị nóng ruột đứng dậy đi luôn._
_Hôm nay chòi vắng. Bác uống phần trà thừa một mình._
~ tien_cong(9000)
~ bv_so_ly_tra = bv_so_ly_tra + 3
~ bv_tam(-3)
-> END

// ============================================================
// 📻 DÒ ĐÀI
// ============================================================
=== bac_bao_ve_mg_do_dai_mo_dau ===
# noi:choi_bao_ve
_Cái radio cũ, núm vặn mòn bóng. Tiếng rè rè. Vặn sang trái: tiếng nhạc. Vặn sang phải: tiếng người. Vặn thật chậm thì mới bắt được đúng tần số._
_Hôm nay có bản tin giao thông, dự báo mưa, và… một chương trình ca nhạc trực tiếp._
-> END

=== bac_bao_ve_mg_do_dai_thanh_cong ===
_Tiếng rè tan đi. Giọng phát thanh viên trong vắt: "Chiều nay mưa lớn, Phường Tân Drama có thể ngập sâu 30 phân."_
_Bác bấm bộ đàm, báo cả công ty: "Chiều mưa ngập. Ai đi xe số thì về sớm." Năm giờ chiều mưa thật. Không ai bị chết máy giữa đường._
_Sáng hôm sau, bàn trong chòi đầy quà: gói hạt dưa, hộp bánh pía, mấy trái cam, một ly trà sữa ít đường._
~ bv_tam(10)
~ bv_co_hat_dua = true
~ bv_co_trai_cam = true
~ bv_qh_ca_cong_ty(2)
~ an(10)
-> END

=== bac_bao_ve_mg_do_dai_that_bai ===
_Rè. Rè. Rè. Bác vặn mãi chỉ bắt được kênh quảng cáo thuốc bổ. Rồi đài tắt hẳn. Pin hết._
_Chiều đó mưa ngập. Cả bãi xe ướt sũng. Bác dắt từng xe chết máy ra, nước tới ống quần._
~ bv_tam(-5)
~ nghi(-10)
-> END

// ============================================================
// ✉️ THƯ TAY GỬI G (dùng khi game mở giao diện chọn chuyện)
// ============================================================
=== bac_bao_ve_mg_thu_g_mo_dau ===
# noi:choi_bao_ve
_Tối chủ nhật. Giấy kẻ ô học sinh. Bút bi. Đèn bàn. Ba chuyện cho một lá thư._
_Chọn thật hay chọn đẹp. G đọc ba lần mỗi lá. G biết khi nào bác viết đẹp._
-> END

=== bac_bao_ve_mg_thu_g_thanh_cong ===
_Lá thư gọn gàng, ba chuyện, chuyện nào cũng có ngày, có giờ, có tên. Không thêm, không bớt._
_Bác gấp làm ba, dán tem, đặt lên bàn để sáng mai ra bưu điện. Ngủ ngon._
~ bv_so_thu = bv_so_thu + 1
~ bv_g(5)
~ bv_tam(3)
-> END

=== bac_bao_ve_mg_thu_g_that_bai ===
_Lá thư toàn chuyện vui, chuyện đẹp. Đọc lên thấy công ty như trong quảng cáo._
_Bác vẫn gửi. Nhưng bác biết: G đọc ba lần, và lần thứ ba G sẽ thấy cái khoảng trống giữa các dòng._
~ bv_so_thu = bv_so_thu + 1
~ bv_g(-5)
-> END

// ============================================================
// 🐕 GIỮ TUẤT KHÔNG CẮN MŨ (4/10, Ngày Động vật)
// ============================================================
=== bac_bao_ve_mg_giu_tuat_mo_dau ===
# noi:cong_cong_ty
_{cho} đã hạ thấp người. {sieu_nhan_hong} vẫn đang sủa giả, nhảy lò cò, chiếc mũ hồng lắc lư như mồi câu._
_Bác nắm dây xích. Nhịp thả, nhịp giữ. Kéo mạnh quá thì {cho} giật mình lao lên. Thả lỏng quá thì chiếc mũ không còn._
-> END

=== bac_bao_ve_mg_giu_tuat_thanh_cong ===
_Bác giữ. Thả. Giữ. Mười giây, hai mươi giây. {cho} gầm gừ, nhưng không lao lên. {sieu_nhan_hong} hết hứng, đi lên tầng, mũ vẫn nguyên._
sieu_nhan_hong: Bác giữ nó giỏi ghê! Mai con chọc tiếp nha!
bac_bao_ve: Mai bác không giữ nữa đâu.
~ qh("sieu_nhan_hong", 5)
~ qh("cho", 3)
~ bv_tam(3)
-> bac_bao_ve_0410_sau_giu_tuat

=== bac_bao_ve_mg_giu_tuat_that_bai ===
_Dây xích tuột. {cho} phóng lên như lò xo. Răng sượt qua vành mũ hồng, để lại một vết rách nhỏ. {sieu_nhan_hong} hét lên, ôm đầu chạy vào trong._
_{hong_hot} quay được hết. Clip "Tuất cắn mũ" có 50.000 lượt xem trong một buổi chiều._
~ follow(15000)
~ qh("sieu_nhan_hong", -5)
~ bv_tam(-5)
-> bac_bao_ve_0410_sau_giu_tuat
