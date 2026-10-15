// ============================================================
// KẾ TOÁN · CHƯƠNG 5: "THUẾ GÕ CỬA" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== ke_toan_2110_confession ===
# ngay:21 # gio:08:20 # noi:phong_ke_toan # bat_buoc
_8:15. Trang "Confession {cong_ty}" đăng bài ẩn danh: "Có ai biết sếp mình đã thế chấp biệt thự ở Đồi Ngân Hàng hông? Tiền lương tụi mình là tiền cái nhà đó đó."_
_8:20. Cửa phòng kế toán có ba người đứng. {hong_hot}, {sales}, {thuc_tap_sinh}. Ai cũng nhìn bạn. Vì ai cũng biết bạn giữ sổ._
hong_hot: Chị… thiệt hả chị?
* [😮‍💨 "Thật. Năm 2024 ảnh cầm nhà để trả lương tụi em. Chị làm sổ cho khoản đó."]
    _Im lặng. {thuc_tap_sinh} cúi đầu. {sales} lần đầu tiên không nói câu nào._
    hong_hot: … Vậy mà tụi em chửi ổng trong group…
    ~ qh("hong_hot", 10)
    ~ qh("giam_doc", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
    ~ kt_ngu(-5)
* [🧾 "Sổ sách công ty là bí mật kế toán. Chị không bình luận."]
    ~ kt_keo(5)
    hong_hot: Không bình luận nghĩa là có rồi chị ơi…
    ~ kt_ngu(5)
* [😶 Đóng cửa phòng.]
    _Ba cái bóng đứng ngoài cửa kính mờ rất lâu, rồi đi. Bạn ngồi yên. Điện thoại có 14 tin nhắn chưa đọc._
    ~ kt_ngu(10)
- _Trưa, {hr} và {it} bắt đầu truy tìm admin trang Confession. {it} nhìn bạn qua vách kính, lắc đầu rất nhẹ: không phải bạn. Bạn biết. Bạn chỉ không biết là ai._
-> END

// ------------------------------------------------------------
=== ke_toan_2110_moc_3 ===
# ngay:21 # gio:15:00 # noi:phong_ke_toan # bat_buoc
_Mốc 3: 500.000 người theo dõi. Hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 500000:
    _Trượt. Tin đồn cắt giảm nhân sự bắt đầu chạy khắp tầng 1._
- else:
    _Đạt. Nhưng tin đồn cắt giảm vẫn chạy. Tin đồn không đọc số liệu._
}
{ kt_ran_doc_nghe_47:
    _Kèm theo tin đồn là một chi tiết rất cụ thể: "Nghe nói hợp đồng có trang 47, thất bại là hoàn 10 tỷ." Chỉ có hai người nghe bạn nói câu đó ở pantry. Một người là {chi_dai}._
    ~ kt_ngu(10)
}
hr: *(gõ cửa, cười)* Thương ơi, em tính giùm anh chi phí trợ cấp thôi việc cho… 7 người. Anh chỉ muốn chuẩn bị thôi.
* [🧾 "Tên 7 người đâu anh? Không có tên thì không có số."]
    hr: *(do dự)* … Có {thuc_tap_sinh} với {thanh_xin_nghi}.
    _Hai người lương thấp nhất. Bạn nhớ cái thẻ kim cương, nhớ tấm thẻ thí sinh cuộc thi hát. Không ai trong danh sách là người dễ thay._
    ~ kt_ngu(5)
    ~ phat_hien(danh_sach_cat_giam)
* [🗄️ "Anh Tuấn, đừng lập danh sách. Nếu tới lúc đó, có tiền cho mọi người một tháng."]
    hr: *(nụ cười tắt)* … Tiền ở đâu ra Thương?
    ke_toan: Đến lúc đó anh sẽ biết. Giờ thì cất danh sách đi.
    ~ qh("hr", 10)
    ~ kt_them_dau_vet(1)
* [😶 "Em tính. Nhưng em không ký."]
    hr: Dạ. Mình cùng lắng nghe nhau vậy.
    ~ kt_ngu(5)
- -> END

// ------------------------------------------------------------
=== ke_toan_2210_thue_go_cua ===
# ngay:22 # gio:08:30 # noi:phong_ke_toan # bat_buoc
_8:30. {thanh_ninh} chạy lên tầng 2, mặt trắng bệch._
thanh_ninh: Chị Thương ơi! Đoàn kiểm tra thuế! Ba người! Đang ở sảnh! Trưởng đoàn tên Liêm, nhìn như chưa từng cười chị ơi!
_Cả công ty lập tức giả vờ làm việc chăm chỉ. {chua_te_deadline} lần đầu mở file Excel. {hong_hot} tắt Tóp-tóp, mở… Word._
_Bạn có 30 phút trước khi họ lên tầng 2. Mười năm hồ sơ._
~ kt_ngu(10)
* [🗂️ Xắn tay áo. Bắt đầu.]
    -> ke_toan_mg_thue_toi_roi_mo_dau
* [📞 Gọi {chi_dai}: "Bà giữ chân đoàn dưới sảnh 15 phút giùm tui."]
    chi_dai: Rồi. Tui mời trà. 15 phút. Không hơn.
    ~ qh("chi_dai", 5)
    -> ke_toan_mg_thue_toi_roi_mo_dau

// ------------------------------------------------------------
=== ke_toan_2210_chu_liem ===
# ngay:22 # gio:10:30 # noi:phong_ke_toan # bat_buoc
_Chú Liêm ngồi đối diện bạn, đọc sổ cái tháng 9 rất chậm. {cho} đi ngang cửa phòng, chú Liêm co chân lên ghế._
chu_liem: Chó… chó ai đây?! *(rồi lấy lại bình tĩnh, đẩy kính lão)*
chu_liem: Cô Thương. Sổ cô sạch quá. Sạch quá thì tôi nghi. Cô có khoản tiền mặt nào ngoài sổ không?
_{thuc_tap_sinh} đang đứng sau lưng chú Liêm, ôm xấp hồ sơ, nhìn bạn._ # hen_gio:6
* [🤝 "Dạ có. Đây là sổ tay ghi từng khoản, cháu để dành trả lương nếu công ty gặp khó. Cháu xin nộp lại vào sổ chung ngay hôm nay."]
    _Chú Liêm đọc cuốn sổ tay 10 phút. Từng trang. Từng dòng: "+8. Không đi du lịch Tết." "+5. Không mua kính mới."_
    chu_liem: *(gấp sổ lại, im lặng rất lâu)* Lần đầu tôi thấy có người giấu tiền để trả lương.
    ~ kt_tu_khai = true
    ~ kt_quy_den_lo = true
    ~ kt_quy_den_nop = true
    ~ kt_quy(kt_quy_den)
    ~ kt_ngu(-20)
    ~ qh("giam_doc", 10)
    _Quỹ đen chuyển vào Quỹ Công Ty. Con đường "Kẻ Biển Thủ" đóng lại vĩnh viễn. Bạn thấy nhẹ, như vừa đặt xuống một cái két sắt._
* [😶 "Dạ không có chú."]
    { RANDOM(1, 10) <= 7:
        chu_liem: Ừm. *(ghi chép)* Sổ sạch.
        _Qua được. Tim bạn đập nghe rõ trong phòng._
        ~ kt_ngu(10)
    - else:
        thuc_tap_sinh: *(ngó vào sổ, buột miệng)* Dạ con số này lệch 250 triệu nè chị… dạ em… em xin lỗi ạ!
        _Chú Liêm ngẩng lên. Nhìn {thuc_tap_sinh}. Nhìn bạn._
        chu_liem: Cậu thực tập sinh này… đọc sổ nhanh nhỉ.
        ~ kt_them_dau_vet(2)
        ~ kt_ngu(20)
    }
* {co(chuoi_chien)} [🍌 "Dạ chú dùng bánh chuối chiên không ạ? Của phòng chờ Siêu Nhân Hồng, ngon lắm."]
    ~ mat(chuoi_chien)
    _Chú Liêm ăn 3 cái. Ngón tay dính dầu. Chú quên mất câu hỏi._
    chu_liem: Bánh này… mua ở đâu?
    ke_toan: Dạ xe đẩy công viên Hồ Cá Mập ạ. Có hóa đơn.
    _Chú gật đầu. Lần sau chú quay lại, chú sẽ nhớ. Nhưng không phải hôm nay._
    ~ kt_ngu(5)
* [⏱️ (Không chọn kịp)]
    chu_liem: Im lặng là có. *(ghi vào biên bản: "Cần kiểm tra thêm tiền mặt")*
    ~ kt_them_dau_vet(1)
    ~ kt_ngu(15)
- -> END

// ------------------------------------------------------------
=== ke_toan_2210_dem_mat_ngu ===
# ngay:22 # gio:23:30 # noi:nha_so_18
_23:30. Nhà số 18. Đoàn thuế đã về. Bạn chưa ngủ._
{ kt_trang_47_tu_lanh:
    _Tờ "trang 47 chữ cỡ 20" trên tủ lạnh vẫn ở đó. Mở tủ lấy nước là thấy._
}
_Bạn mở két. Nhìn cuốn sổ. Đóng két._
* [📞 Gọi {chi_dai}. Rủ ăn ốc khuya.]
    _Quán Ốc Đêm, bàn trong góc. {chi_dai} gọi một dĩa ốc len xào dừa, đẩy sang cho bạn._
    chi_dai: Ăn. Rồi kể. Hoặc ăn rồi thôi khỏi kể.
    ~ an(40)
    ~ tien_cong(-70000)
    ~ kt_ngu(-20)
    ~ qh("chi_dai", 5)
    { RANDOM(1, 10) <= 2 && kt_huong_biet_quy_den:
        _Bàn bên cạnh có một người đội mũ, ngồi quay lưng, ăn rất chậm. Bạn không để ý._
        ~ kt_them_dau_vet(1)
    }
* [💤 Uống một ly sữa nóng. Ép mình ngủ.]
    ~ kt_ngu(-5)
    ~ nghi(15)
* [🧮 Ngồi tính lại toàn bộ dòng tiền tới 31/10.]
    ~ kt_ngu(10)
    _Ba giờ sáng. Kết quả không đổi. Chỉ có bạn là đổi: mệt hơn._
- -> END

// ------------------------------------------------------------
=== ke_toan_2310_phong_cho ===
# ngay:23 # gio:09:30 # noi:phong_cho_snh # bat_buoc
_Sinh nhật {sieu_nhan_hong}, 31 tuổi. Phòng chờ. {sieu_nhan_hong} vừa ăn bánh chuối chiên vừa ký tặng, dầu dính đầy giấy._
sieu_nhan_hong: Thương ơi! Ăn bánh hông em? Hôm ký hợp đồng anh cũng ăn y vầy nè, ngon dữ lắm!
_Bạn nhìn tờ giấy ký tặng dính dầu. Hai tờ giấy dính vào nhau, cầm lên tưởng là một._
_Bạn chợt nhớ: sáng 1/10, tờ trang 47 trong bản gốc… dày hơn các tờ khác._
* [🧾 "Anh Nguyên, phòng chờ có bánh là đúng điều khoản số 4 rồi. Hóa đơn bánh tuần này đâu anh?"]
    ~ kt_hoa_don()
    sieu_nhan_hong: *(cười nghiêng ngả)* Em đúng là kế toán chính hiệu!
    ~ qh("sieu_nhan_hong", 5)
* [🔍 "Hôm ký hợp đồng… anh vừa ăn vừa ký hả?"]
    sieu_nhan_hong: Ừa! Dính tùm lum luôn. Mà có một tờ anh viết tay, kẹp sau trang 47 đó, em đọc chưa?
    ~ kt_manh_moi_47b = true
    ~ kt_ngu(-5)
    _Tim bạn đập lỡ một nhịp._
    ** {qh_sieu_nhan_hong >= 30} [🔒 "Anh Nguyên, trang 47b anh viết gì? Anh nói thật với em đi."]
        _{sieu_nhan_hong} nhìn quanh. Rồi tháo mũ. Một gương mặt bình thường, hơi rụt rè._
        sieu_nhan_hong: Ờm… anh sợ mọi người cực vì anh. Nếu không thành thì thôi, anh hông lấy lại tiền.
        sieu_nhan_hong: Mà… anh quên kêu anh Thắng ký. Anh tưởng ký trang chính là đủ rồi.
        ~ kt_mo_nhanh_47b = true
        ~ phat_hien(trang_47b)
        ~ kt_ngu(-40)
        ~ qh("sieu_nhan_hong", 10)
        _Cần: chữ ký của {giam_doc} và một người làm chứng. Trước 31/10._
    ** [😶 "Dạ… để em về đọc lại."]
        sieu_nhan_hong: Ừa! Đọc đi em! Anh viết hơi xấu đó nha.
* [🍌 Nhận một cái bánh chuối chiên. Cất vào túi.]
    ~ nhan(chuoi_chien)
    ~ qh("sieu_nhan_hong", 5)
    sieu_nhan_hong: Ăn liền đi em, nguội mất ngon!
- -> END

// ------------------------------------------------------------
=== ke_toan_2310_livestream ===
# ngay:23 # gio:14:00 # noi:studio # bat_buoc
_Livestream sinh nhật. Kịch bản có màn "Mr. Kevin Trộn của BTT Global gửi lời chúc". {sales} chạy tới bàn bạn._
sales: Chị ơi! Ứng em 3 triệu thuê bộ vest với cặp kính đen cho Mr. Kevin Trộn! Người đóng là {thuc_tap_sinh}!
* [🧾 "Nhà tài trợ không có thật thì không có tiền thuê vest cho người không có thật."]
    ~ kt_hoa_don()
    ~ qh("sales", -5)
    _{thuc_tap_sinh} đóng Mr. Kevin Trộn bằng áo sơ mi của chính mình, cúi chào khán giả 90 độ, "dạ" ba lần. Bình luận: "Nhà tài trợ dễ thương nhất năm."_
    ~ follow(10000)
* [💸 Duyệt 3 triệu. Lần này thôi.]
    ~ kt_quy(-3)
    ~ follow(10000)
    ~ qh("sales", 5)
    ~ qh("thuc_tap_sinh", 3)
* [😶 Không xem. Đi xuống chòi bảo vệ ngồi.]
    bac_bao_ve: Không xem livestream à cháu?
    ke_toan: Con mệt bác.
    bac_bao_ve: Ừ. Ngồi đi.
    ~ kt_ngu(-5)
    ~ qh("bac_bao_ve", 5)
- _Cuối livestream, {sieu_nhan_hong} cầm micro: "{chua_te_deadline} ơi… em thích anh." Hashtag \#VũƠiTrảLờiĐi lên xu hướng trong 20 phút._
_Rồi {cho} lao vào bàn. Cái bánh kem hồng đổ ụp. Bạn ghi vào sổ: "Bánh kem: 1.200.000đ. Hư hỏng: 100%. Lượt xem: rất nhiều."_
~ follow(60000)
-> END

// ------------------------------------------------------------
=== ke_toan_2310_tach_trang_47 ===
# ngay:23 # gio:20:30 # noi:phong_ke_toan # dieu_kien:kt_manh_moi_47b
{ not kt_manh_moi_47b:
    _Tối. Phòng kế toán. Bạn cất bản gốc hợp đồng vào két công ty, không lật lại. Không có lý do gì để lật._
    -> END
}
_20:30. Phòng kế toán. Bạn lấy bản gốc hợp đồng 52 trang ra khỏi két công ty. Đặt dưới đèn bàn._
_Trang 47. Bạn sờ mép giấy. Dày gấp đôi. Ở góc, một vết dầu đã khô, ố vàng._
* [🔍 Lấy khăn ướt, nhẹ tay tách hai tờ.]
    _Mười phút. Tay bạn chưa bao giờ nhẹ như vậy, kể cả khi đếm tiền. Tờ thứ hai bong ra, không rách._
    -> ke_toan_2310_doc_47b
* [♨️ Hơ nhẹ trên hơi nước ấm từ bình đun.]
    _Hơi nước làm lớp dầu mềm ra. Tờ giấy tách dần. Một góc hơi nhòe mực, nhưng còn đọc được._
    -> ke_toan_2310_doc_47b

=== ke_toan_2310_doc_47b ===
_Một tờ giấy viết tay, không đánh số. Chữ to, hơi nghiêng, mực tím:_
_"Nếu cả công ty đã cố hết sức mà Hồng vẫn không nổi, em không lấy lại đồng nào. Coi như em mua 30 ngày được làm siêu sao. Còn nếu có người cố tình phá, thì giữ nguyên trang 47. Ký tên: Hồng."_
~ kt_manh_moi_47b = true
~ phat_hien(trang_47b)
_Chỉ có một chữ ký. Muốn có hiệu lực, cần thêm chữ ký của {giam_doc} và một người làm chứng, trước 31/10._
_Bạn gọi nó là trang 47b. Bạn ngồi nhìn nó rất lâu. Rồi bạn khóc, lần đầu tiên từ ngày 1/10. Không ai thấy. Có lẽ thế là tốt._
~ kt_ngu(-30)
~ kt_mo_nhanh_47b = true
* [📁 Bỏ vào bìa nhựa, cất vào két. Mai đi xin chữ ký.]
    ~ kt_keo(3)
* [📞 Gọi {giam_doc} ngay bây giờ.]
    giam_doc: *(giọng ngái ngủ)* Thương à… có chuyện gì thế em?
    ke_toan: Anh. Mai anh lên sớm. Em có một trang anh phải đọc. Lần này anh phải đọc.
    giam_doc: … Ừ. Anh đọc.
    ~ qh("giam_doc", 5)
- -> END

// ------------------------------------------------------------
=== ke_toan_2410_ngoi_canh_huyen ===
# ngay:24 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Bàn số 3: {sales} và bạn. Trên bàn có một bình trà và một tấm biển "Nói thật, không nói phét"._
sales: *(khoanh tay)* Chị… à, em bắt đầu trước nha. Chị khó quá trời.
_Cùng lúc, điện thoại cả phòng rung: clip {idol_het_thoi} hát trong bóng tối hôm mất điện đang viral. Và một bài bóc 80.000 fan ảo._
* [😇 "Chị khó vì chị sợ. Không phải vì chị ghét em."]
    sales: *(im lặng)* … Em cũng sợ. Em hứa với ai cũng chắc kèo vì em sợ không ai cần em.
    ~ qh("sales", 20)
    ~ qh("designer", 10)
    _Lần đầu tiên hai người nói chuyện mà không có tờ giấy ăn nào trên bàn._
* [🧾 "Tổng các khoản em xin tạm ứng không có hóa đơn từ đầu năm: 312 triệu. Chị có bảng."]
    sales: *(nhìn bảng, tái mặt)* … Sao mà căng vậy chị.
    ~ qh("sales", -10)
    ~ kt_keo(5)
* {kt_bat_bai_huyen} [🔒 "Chị chưa nói với ai vụ tiệm nail Lung Linh. Em cũng đừng nói phét với chị nữa. Mình hòa."]
    sales: *(thở ra một hơi rất dài)* … Hòa. Em hứa. Hứa thật.
    ~ qh("sales", 15)
    ~ qh("designer", 5)
- -> END

// ------------------------------------------------------------
=== ke_toan_2510_xin_chu_ky ===
# ngay:25 # gio:09:00 # noi:biet_thu # dieu_kien:kt_mo_nhanh_47b
{ not kt_mo_nhanh_47b:
    _Chủ nhật. Bạn ở nhà, ghi sổ chi tiêu tuần. Một tuần thiếu ngủ. Bạn ngủ trưa 3 tiếng._
    ~ kt_ngu(-10)
    -> END
}
_Chủ nhật. Bạn đứng trước cổng sắt biệt thự số 1, Đồi Ngân Hàng, ôm cái bìa nhựa có trang 47b. Cỏ sân golf mọc cao tới mắt cá._
giam_doc: *(mở cổng, áo thun cũ, dép lê)* Thương? Chủ nhật mà em…
* [📄 "Anh đọc trang này. Rồi ký."]
    _{giam_doc} đọc. Đọc lần thứ hai. Tay cầm tờ giấy hơi run._
    giam_doc: Cậu ấy… không đòi tiền lại nếu mình cố hết sức?
    ke_toan: Nếu có người cố tình phá thì vẫn đòi. Anh ký thì nó mới có hiệu lực.
    giam_doc: *(cầm bút)* Lần này anh đọc rồi mới ký.
    ~ kt_ky_thang_47b = true
    ~ kt_thang_doc_47 = true
    ~ qh("giam_doc", 15)
* {qh_giam_doc < 0} [🧾 "Anh ký đi. Anh không cần hiểu."]
    giam_doc: *(nhíu mày)* Em lại bắt anh ký cái gì mà không cho anh đọc?
    ke_toan: … Anh nói đúng. Anh đọc đi.
    _Anh ấy đọc. Lâu. Rồi ký. Nhưng không nhìn bạn._
    ~ kt_ky_thang_47b = true
- _Còn thiếu một người làm chứng._
* [🦁 Chạy qua nhà số 45, Phố Cũ. Gọi {chi_dai}.]
    { qh_chi_dai >= 20:
        chi_dai: *(đọc, rồi ký một chữ ký to như chữ ký trên hợp đồng mua nhà)* Rồi. Đứa nào dám nói tờ này giả, chỉ mặt tui.
        ~ kt_nhan_chung_47b = "chi_dai"
        ~ qh("chi_dai", 10)
    - else:
        chi_dai: Tờ gì đây bà? … Bà chưa kể gì với tui mà giờ bắt tui ký làm chứng?
        _{chi_dai} không ký. Hôm nay thì chưa._
    }
* [🛡️ Chạy ra nhà vườn Ven Đô. Bác {bac_bao_ve} đang tưới rau.]
    { qh_bac_bao_ve >= 20:
        bac_bao_ve: *(đeo kính, đọc rất chậm, rồi ký bằng nét chữ ngay ngắn)* Bác làm chứng. Bác thấy hết.
        ~ kt_nhan_chung_47b = "bac_bao_ve"
        ~ qh("bac_bao_ve", 10)
    - else:
        bac_bao_ve: Giấy tờ người ta, bác không ký bừa đâu cháu.
    }
- { kt_ky_thang_47b && kt_nhan_chung_47b != "":
    ~ kt_47b_hieu_luc = true
    _Trang 47b: ba chữ ký. Bạn bỏ vào bìa nhựa, ôm vào ngực, đi bộ về nhà số 18. Trời Thành Phố Ước Mơ hôm nay đẹp một cách vô lý._
    ~ kt_ngu(-20)
}
-> END

// ------------------------------------------------------------
=== ke_toan_2610_mua_kenh ===
# ngay:26 # gio:10:00 # noi:phong_giam_doc # bat_buoc
_Thứ Hai. Tin đồn "cắt giảm nếu Siêu Nhân Hồng thất bại" lan khắp công ty. Chiều qua chiếu thử phim ngắn "Người Hùng Không Tên". Hay. Hay tới mức {thuc_tap_sinh} ngồi khóc ở hàng cuối._
giam_doc: Thương, duyệt cho anh 200 triệu. Anh mua kênh Diu-túp "Cú Đêm Cắt Ghép" của {editor}. Gần một triệu người đăng ký. Đổi tên thành kênh của {sieu_nhan_hong}.
* [🧾 "Anh hỏi {editor} chưa? Kênh của người ta làm 6 năm."]
    giam_doc: … Chưa.
    ke_toan: Vậy hóa đơn chưa có, người bán chưa có. Em không duyệt.
    ~ qh("editor", 10)
    ~ kt_keo(5)
* [✅ Duyệt 200 triệu. Một triệu người là một triệu người.]
    ~ kt_quy(-200)
    ~ kt_ngu(10)
    _Chiều đó, {editor} từ chối bán. 200 triệu nằm trên giấy, không đi đâu. Bạn gạch lại._
    ~ kt_quy(200)
    ~ qh("editor", -5)
* [💡 "Không mua. Xin một video hợp tác, ghi tên {editor} đầy đủ. Chi phí: tiền cà phê đêm."]
    ~ kt_quy(-1)
    ~ follow(40000)
    ~ qh("editor", 15)
    ~ qh("giam_doc", 5)
    giam_doc: Người keo nhất công ty lại là người hiểu chuyện nhất công ty.
- -> END

// ------------------------------------------------------------
=== ke_toan_2710_luu_luc_toi ===
# ngay:27 # gio:11:00 # noi:cong_cong_ty # bat_buoc
_11:00. Một chiếc xe trắng đỗ trước cổng. Lưu Lực bước xuống, vest trắng, tóc vuốt keo, ôm tập hồ sơ xanh lá chuối._
_Đúng lúc đó, {chi_dai} từ kho sự kiện đi ra. Lưu Lực nhìn {chi_dai}, mặt trắng bệch. Tập hồ sơ rơi xuống, giấy bay khắp sân._
luu_luc: C… chị Hương… Quán Ốc Đêm… mười năm trước…
chi_dai: Ủa? À… cái ông bị tô ốc len hả?
_Một tờ giấy bay tới chân bạn. "Thư mời: Kế toán trưởng LL-Entertainment. Người nhận: {ke_toan}. Lương: gấp đôi."_
* [🧾 Nhặt lên, đưa lại cho Lưu Lực: "Anh làm rơi hóa đơn nè."]
    luu_luc: *(giật lại)* Chị Thương… chị đọc rồi thì càng tốt. Tối nay em gửi email.
    ke_toan: Em đọc rồi. Chữ cỡ 12, dễ đọc lắm anh.
    ~ phat_hien(ll_moi_nguyen)
* [😂 Đứng xem Lưu Lực nhặt giấy 4 phút. Không giúp.]
    _{cho} tha mất hai tờ. Bạn không cản. Hôm nay bạn thấy mình hơi xấu tính, và rất vui._
    ~ kt_ngu(-10)
    ~ qh("cho", 5)
* [🦁 Đứng cạnh {chi_dai}: "Bà, ông này mời tui qua làm kế toán."]
    chi_dai: *(xắn tay áo)* À. Vậy hả.
    luu_luc: Thôi! Thôi, em… em xin phép!
    ~ qh("chi_dai", 10)
- -> END

// ------------------------------------------------------------
=== ke_toan_2710_sua_chua_hong_hao ===
# ngay:27 # gio:15:30 # noi:phong_ke_toan
_{sales} chạy vào, thở hổn hển._
sales: Chị Thương! Sữa Chua Hồng Hào ở Ven Đô gọi em! Họ muốn tài trợ 1 tỷ cho Đêm Hồng! Thật! Lần này thật!
_Phòng kế toán im lặng. Bạn có 312 triệu lý do để không tin._
* [📞 "Đưa số đây. Chị gọi xác minh. Ngay."]
    _Đầu dây bên kia: một giọng bà cụ, chậm rãi. "Bên cô thấy cậu Siêu Nhân giúp người, cô thương. Cô tài trợ. Hóa đơn đỏ cô xuất được, con cứ yên tâm."_
    _Hóa đơn đỏ. Hai chữ đẹp nhất bạn nghe trong tháng._
    ~ kt_quy(1000)
    ~ follow(30000)
    ~ qh("sales", 25)
    ~ kt_ngu(-15)
    sales: *(khóc thật)* Chị… lần đầu có người tin em.
    ke_toan: Chị không tin em. Chị tin hóa đơn. Mà lần này hóa đơn là của em.
* [🧾 "Giống BTT Global hả em?"]
    sales: *(mắt đỏ hoe)* … Dạ. Em biết mà. Lần duy nhất em nói thật.
    ~ qh("sales", -15)
    _Một tuần sau, Sữa Chua Hồng Hào ký với một công ty khác._
* [✍️ "Đủ ba chữ ký thì chị làm hồ sơ."]
    _Hai ngày săn chữ ký. Bà cụ đợi lâu quá, chia bớt cho chỗ khác. Còn 500 triệu._
    ~ kt_quy(500)
    ~ qh("sales", 5)
- -> END

// ------------------------------------------------------------
=== ke_toan_2710_email_23h ===
# ngay:27 # gio:23:00 # noi:nha_so_18 # bat_buoc
_23:00. Email mới. Người gửi: Lưu Lực, CEO LL-Entertainment._
luu_luc: *(email)* "Chào chị Thương. Ở LL-Entertainment, lương luôn về đúng ngày, hóa đơn luôn đủ, và không ai ký hợp đồng mà không đọc. Lương gấp đôi. Chị suy nghĩ nhé."
_Hôm nay LL cũng gửi lời mời gấp ba cho {sieu_nhan_hong}. Bạn chưa biết người ta đã trả lời chưa._
* [🧾 Trả lời: "Cảm ơn anh. Hóa đơn của lời mời này đâu anh?"]
    ~ kt_ll_email = 1
    _Năm phút sau: "Ý chị là sao ạ?". Bạn không trả lời nữa. Đóng máy._
    ~ kt_ngu(-10)
    _Bạn ngủ ngon nhất trong tháng._
* [😶 Để đó, không trả lời.]
    ~ kt_ll_email = 2
    ~ kt_ngu(5)
    _Lời mời còn hiệu lực tới 30/10. Nó nằm trong hộp thư như một cánh cửa hé._
* [🤝 Chuyển tiếp email cho {giam_doc}: "Để anh biết người ta đang câu ai."]
    ~ kt_ll_email = 3
    _23:15, điện thoại reo._
    giam_doc: *(giọng khác hẳn mọi khi)* Cảm ơn em. Mười năm rồi nhỉ.
    ~ qh("giam_doc", 20)
* [🐍 Trả lời: "Em đồng ý. Đêm Hồng sẽ không có tiền thuê sân khấu."]
    ~ kt_ll_email = 2
    ~ kt_pha_chien_dich = true
    ~ kt_ngu(25)
    ~ follow(-50000)
    _Gửi. Bạn nhìn màn hình rất lâu. Tờ trang 47 chữ cỡ 20 trên tủ lạnh nhìn lại bạn._
- -> END
