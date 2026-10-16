// ============================================================
// SALES · CHƯƠNG 3: "GÓI MÌ TRONG BÓNG TỐI" (15/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== sales_1510_thang_may ===
# ngay:15 # gio:08:10 # noi:sanh_tang_tret # bat_buoc
_8 giờ 5 phút. Phụt. Mất điện cả tòa nhà. Từ trong thang máy vọng ra hai giọng: {giam_doc} và {chi_dai}._
giam_doc: *(vọng ra)* {chi_dai} ơi, em bình tĩnh nhé. Anh không ép em bình tĩnh đâu, tùy em…
chi_dai: *(vọng ra)* Anh im giùm em là em bình tĩnh liền!
_Bạn đứng ngay trước cửa thang máy, tay cầm ly trà sữa, điện thoại còn 60% pin._
* [💁 Áp miệng vào khe cửa: "Sếp ơi, tin chị đi, 10 phút nữa có người tới cứu!"]
    giam_doc: *(vọng ra)* Em gọi ai rồi à?
    sales: Dạ… chưa. Nhưng tin chị đi!
    chi_dai: *(vọng ra)* {sales}! Gọi {it}! NGAY!
    ~ sl_phet(2)
    ~ qh("chi_dai", -3)
* [🤝 Chạy đi tìm {it} và Bác {bac_bao_ve}.]
    _3 phút sau, bạn kéo được {it} từ phòng server và Bác {bac_bao_ve} từ chòi. Bác mang theo một cái xà beng và một ấm trà._
    bac_bao_ve: Thang máy này năm nào cũng kẹt một lần. Bình tĩnh.
    ~ qh("chi_dai", 5)
    ~ qh("bac_bao_ve", 5)
    ~ qh("giam_doc", 3)
* [📸 Giơ điện thoại lên, định livestream "Sếp kẹt thang máy".]
    _Bạn vừa bấm thì nhớ ra: livestream sếp kẹt thang máy là con đường ngắn nhất tới phòng "uống trà" của {hr}._
    _Bạn tắt máy. {hong_hot} đứng cạnh, đã bấm livestream từ 2 phút trước._
    ~ cang_thang(3)
- -> END

// ------------------------------------------------------------
=== sales_1510_trang_47 ===
# ngay:15 # gio:14:00 # noi:pantry # bat_buoc
_14 giờ. Pantry tối. Cả công ty ngồi bệt dưới sàn. Bạn ngồi cạnh {ke_toan} và {chi_dai}, vừa được cứu khỏi thang máy, mặt vẫn còn hầm hầm từ vụ thang máy sáng nay._
ke_toan: *(thì thầm với {chi_dai})* {chi_dai}. Trang 47. Nếu không đủ 1 triệu người theo dõi, công ty hoàn lại 10 tỷ.
chi_dai: Mười… tỷ?
ke_toan: Và ngân sách Đại Nhạc Hội thì đang tính 2 tỷ của {sales}.
~ phat_hien(trang_47)
_Bạn nghe thấy tên mình. Trong bóng tối, không ai thấy mặt bạn trắng bệch._
_Lần đầu tiên, 2 tỷ không còn là con số để phét. Nếu không có nhà tài trợ thật, Đại Nhạc Hội Siêu Nhân có thể không đủ tiền dựng sân khấu. Và công ty có thể sập._
* [😶 Ngồi im. Không ai biết bạn nghe được.]
    ~ cang_thang(15)
    _Bạn ôm gối, đếm từng nhịp thở. 2 tỷ. 10 tỷ. 0 đồng. Ba con số đuổi nhau trong đầu._
* [🤝 Lên tiếng trong bóng tối: "Chị {ke_toan}… 2 tỷ đó… em chưa chắc đâu chị."]
    ~ sl_that_long()
    ke_toan: *(im lặng rất lâu)* …Chị biết. Chị đoán vậy từ ngày 2.
    chi_dai: *(vỗ vai bạn trong bóng tối)* Thôi. Giờ biết rồi thì làm cho có thật. Chị giúp.
    ~ qh("ke_toan", 10)
    ~ qh("chi_dai", 10)
* [🗣️ "Chị yên tâm, BTT sắp chuyển rồi."]
    ~ sl_phet(10)
    ke_toan: *(không quay sang)* Ừ. Chị ghi nhận.
    _Lần này, chính bạn cũng nghe ra câu đó rỗng tuếch tới mức nào._
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== sales_1510_noi_that_voi_duy ===
# ngay:15 # gio:15:30 # noi:cau_thang
_Chiều. Vẫn mất điện. Cầu thang bộ tối om. Bạn ngồi ở bậc thứ 7, nơi duy nhất không có ai. Rồi {thuc_tap_sinh} ngồi xuống bậc thứ 6, đưa bạn một cục sạc dự phòng._
thuc_tap_sinh: Dạ chị xài đi ạ. Em… em có dư 5 cục ạ.
_Trong bóng tối, không ai thấy mặt ai. Có lẽ vì vậy mà câu này tự bật ra._
* [🤝 "Anh {thuc_tap_sinh}… thật ra chị… em chưa ký được ai hết."]
    ~ sl_that_long()
    ~ sl_mo_noi_that = true
    _Im lặng. Rồi {thuc_tap_sinh} cười rất khẽ._
    thuc_tap_sinh: Dạ… em cũng có bí mật nè chị.
    thuc_tap_sinh: Em từng làm trưởng phòng tín dụng ở ngân hàng. Lương gấp 10 bây giờ. Em bỏ hết để đi làm phim.
    thuc_tap_sinh: Em không dám kể ai. Sợ bị hỏi mượn tiền ạ.
    ~ phat_hien(duy_tung_lam_ngan_hang)
    ~ qh("thuc_tap_sinh", 20)
    _Hai bí mật nằm cạnh nhau trên cầu thang tối. Không cái nào nặng bằng lúc còn mang một mình._
    sales: Anh {thuc_tap_sinh}. Em hứa không hỏi mượn tiền anh. Nhưng em có thể hỏi… cách đọc hợp đồng hông?
    thuc_tap_sinh: *(cười to lần đầu)* Dạ cái đó thì em giỏi nhất ạ!
* [💁 "Tin chị đi, anh {thuc_tap_sinh}, chị sắp ký 2 tỷ."]
    thuc_tap_sinh: Dạ… em tin chị ạ.
    ~ sl_phet(3)
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    _Anh ấy tin thật. Đó mới là điều làm bạn khó chịu._
* [😶 Nhận cục sạc, cảm ơn, ngồi im.]
    ~ qh("thuc_tap_sinh", 3)
    _Hai người ngồi im trong bóng tối 20 phút. Thoải mái một cách lạ lùng._
- -> END

// ------------------------------------------------------------
=== sales_1510_cong_vien_trong_bong_toi ===
# ngay:15 # gio:19:10 # noi:pantry
_19 giờ. Vẫn mất điện. Pantry chỉ còn ánh đèn pin. Từ góc tối, có tiếng hát rất khẽ._
idol_het_thoi: *(hát)* Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên…
_Không kính đen. Chỉ là giọng hát thật. Ở góc kia, {editor} giơ điện thoại quay lại, không bật đèn._
_Bạn nghe và nghĩ: năm 2015, cả nước hát bài này. Cả nước. Một ý tưởng nhú lên, mờ mờ như ánh đèn pin._
* [🎤 Ghi chú vào điện thoại: "Ca sĩ = {idol_het_thoi}? Remix?"]
    ~ sl_goi_y_phat = true
* [😇 Chỉ nghe. Không bán gì hết. Lần đầu tiên.]
    ~ cang_thang(-15)
    ~ sl_that_long()
    _Bạn nhắm mắt. Bài hát kết thúc. Không ai vỗ tay, vì không ai muốn phá vỡ cái im lặng đó._
- -> END

// ------------------------------------------------------------
=== sales_1610_buc_bi_doi ===
# ngay:16 # gio:13:30 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng, trường quay "Hồng Hay Không Hồng". Bạn đã bán cho Tiệm Nail Lung Linh một suất "logo trên bục". 5 triệu. Tiền thật. Đã nhận._
_Nhưng bục đã bị đổi chỗ. Logo tiệm nail giờ nằm… sau cây cột, chỉ camera số 4 quay tới, mà camera số 4 hỏng._
dao_dien_tivi_hong: Em ơi, sân khấu chốt rồi. 14 giờ là bấm máy. Không đổi được. # hen_gio:8
* [🗣️ "Anh ơi, tin chị đi, tiệm nail này là nhà tài trợ chiến lược của tập đoàn đa quốc gia!"]
    { RANDOM(1, 10) <= 4:
        dao_dien_tivi_hong: Đa quốc gia hả? …Thôi được, dời bục 1 mét.
        ~ sl_nail_logo_buc = true
        ~ sl_phet(5)
    - else:
        dao_dien_tivi_hong: Em ơi, tháng nào cũng có người nói với anh câu đó.
        ~ sl_phet(5)
    }
* [🤝 "Anh ơi, đây là khách nhỏ, tiền thật, em hứa với chị ấy rồi. Em xin anh 1 mét thôi."]
    ~ sl_that_long()
    dao_dien_tivi_hong: *(nhìn bạn, thở dài)* Khách nhỏ tiền thật… hiếm à nha. Dời 1 mét. Nhanh!
    ~ sl_nail_logo_buc = true
* [💅 Tặng đạo diễn voucher làm nail.]
    { sl_co_voucher_nail:
        ~ sl_co_voucher_nail = false
        dao_dien_tivi_hong: *(nhìn móng tay mình)* …Vợ anh sẽ thích cái này. Dời bục!
        ~ sl_nail_logo_buc = true
    - else:
        _Bạn không có voucher. Bạn đưa một tấm danh thiếp. Đạo diễn bỏ vào túi, không nhìn._
    }
* [⏱️ (Không chọn kịp)]
    _Đèn đỏ bật lên, máy quay chạy. Bục giữ nguyên chỗ cũ. Logo tiệm nail chìm sau cây cột._
- { sl_nail_logo_buc:
    ~ sl_that(5)
    ~ follow(5000)
    _Logo Tiệm Nail Lung Linh nằm ngay giữa khung hình. 20 giờ tối, chương trình phát sóng, chị chủ tiệm gửi bạn ảnh chụp màn hình tivi kèm 12 trái tim._
- else:
    _Chị chủ tiệm nail nhắn: "Em ơi, logo chị đâu?". Bạn nhìn tin nhắn rất lâu, rồi lên phòng kế toán xin hoàn lại 5 triệu cho chị. Tiền thật thì trả cũng phải thật._
    ke_toan: Hoàn tiền mà có lý do rõ ràng. *(ký)* Lần đầu chị duyệt cho em mà không cần hỏi hóa đơn.
    ~ qh("ke_toan", 5)
    ~ sl_that_long()
}
-> END

// ------------------------------------------------------------
=== sales_1610_gameshow ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
_14 giờ, bấm máy. Phần "Hit Một Thời". {sieu_nhan_hong} cầm micro, hát "Công Viên"._
sieu_nhan_hong: *(hát)* Ngày xưa có đôi bạn thân… bán… khoai chiên… tại công viên…
_Sai lời. Cả trường quay ồ lên. Rồi từ cánh gà, một giọng hát bè vang lên, đúng lời, đúng nốt. Là {idol_het_thoi}._
_Khán giả trường quay đứng dậy. Có người khóc. Bạn đứng ở hậu trường, ngay cạnh {quan_ly_idol}, mắt ông đỏ hoe._
* [🎤 Hỏi nhỏ {quan_ly_idol}: "Anh ơi, anh {idol_het_thoi} còn nhận show hông?"]
    quan_ly_idol: *(lau mắt)* Nhận hết. Đám cưới, khai trương, sinh nhật chó. Em có show hả?
    sales: Em đang nghĩ một cái show to hơn. Rất to.
    ~ sl_goi_y_phat = true
    ~ qh("quan_ly_idol", 5)
* [🤝 Đưa {quan_ly_idol} chai nước.]
    quan_ly_idol: *(nhận, không nhìn bạn)* Cảm ơn em. Bụi trường quay.
    ~ qh("quan_ly_idol", 8)
* [📞 Gọi ngay mấy quán nhậu: "Ca sĩ 'Công Viên' tối nay vừa lên sóng, anh muốn đặt show hông?"]
    -> sales_mg_goi_dien_mo_dau
- -> END

// ------------------------------------------------------------
=== sales_1610_buffet ===
# ngay:16 # gio:19:30 # noi:sanh_cong_ty
_Ngày Lương thực Thế giới. Xe của đoàn về tới công ty lúc 19 giờ. Liên hoan buffet ở sảnh: gà rán, bánh mì, chè. 20 giờ, cái tivi ở sảnh sẽ phát gameshow quay chiều nay._
_Tủ lạnh căn 1203 trống ba ngày rồi. Bạn mở túi xách "hàng hiệu", lặng lẽ xếp hộp nhựa vào._
* [🍗 Gói 6 cái đùi gà, 2 hộp chè. Nhanh, gọn, chuyên nghiệp.]
    ~ nhan(com_tam)
    ~ an(30)
    _{ke_toan} đi ngang. Dừng lại. Nhìn túi bạn. Chị nhìn lâu hơn cần thiết._
    ke_toan: …Gói thêm hộp xôi đi em. Để đó cũng đổ.
    _{ke_toan} quay đi. Bạn không chắc mình vừa thấy {ke_toan} cười. Bạn chỉ chắc một điều: chị đã biết tủ lạnh nhà bạn trống._
    ~ qh("ke_toan", 5)
* [🤝 Rủ {designer} cùng gói, chia đôi.]
    designer: Mình là đồng phạm rồi đó em.
    ~ qh("designer", 8)
    ~ an(30)
* [😇 Ăn tại chỗ cho no. Không gói gì.]
    ~ an(60)
    _Bạn ăn 4 cái đùi gà, vừa ăn vừa xem {sieu_nhan_hong} hát "khoai chiên" trên tivi. Ngày mai thì ngày mai tính. Slogan công ty mà._
- ~ nhan(tra_sua)
~ uong(20)
-> END
