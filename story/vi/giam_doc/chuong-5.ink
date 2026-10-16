// ============================================================
// GIÁM ĐỐC · CHƯƠNG 5: "THUẾ, BÁNH KEM VÀ GẤP BA" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== giam_doc_2110_confession ===
# ngay:21 # gio:08:15 # noi:phong_giam_doc # bat_buoc
_8:15. Trang "Confession {cong_ty}" đăng một bài ẩn danh: "Có ai biết sếp mình đã thế chấp biệt thự ở Đồi Ngân Hàng hông? Tiền lương tụi mình là tiền cái nhà đó đó."_
_840 lượt thích. 312 bình luận. Bình luận đầu tiên: "Ủa alo?"_
~ gd_no(20)
{ gd_noi_that_lua_trai || gd_noi_that_huong:
    _Có người đã nghe chuyện này từ chính miệng bạn. Lần này, nhiều bình luận viết: "Biết rồi. {ke_toan} sếp."_
    ~ gd_no(-10)
    ~ gd_uy(5)
}
hr: *(gõ cửa)* Anh ơi, em và {it} sẽ truy tìm admin trang này. Anh chỉ cần duyệt ạ.
* [🔍 "Truy. Tìm cho ra người gửi bài."]
    ~ qh("hr", 10)
    ~ qh("it", -5)
    ~ qh("hong_hot", -10)
    it: *(nhắn)* Restart chưa anh? À nhầm. Dạ em tìm. Nhưng em nói trước: tìm ra rồi anh sẽ không vui đâu.
    ~ gd_uy(-5)
    _Chiều, {it} gửi thêm một dòng: "23:12 tối 20/10, một máy tên LL-GUEST đăng nhập email anh. Mật khẩu email anh vừa bị đổi. Anh đổi lại đi."_
    ~ gd_no(5)
* [😮‍💨 Tự đăng một bình luận dưới bài, bằng tài khoản thật: "Đúng. Anh đã thế chấp. Anh sẽ tự lo."]
    ~ gd_tu_thu = true
    ~ gd_no(-20)
    ~ gd_uy(10)
    _Bình luận của bạn nhận 1.200 lượt thích trong một giờ. Nhiều hơn mọi bài đăng của fanpage công ty tháng này._
    ~ follow(15000)
    ~ qh("hong_hot", 10)
* [🎭 "Tin đồn thất thiệt. Gỡ bài đi."]
    ~ gd_hua()
    ~ gd_no(10)
    hr: Dạ… nhưng admin trang này mình đâu biết là ai để kêu gỡ anh.
    _Bài vẫn ở đó. Lượt chia sẻ tăng gấp đôi._
- -> END

// ------------------------------------------------------------
=== giam_doc_2110_danh_sach_du_phong ===
# ngay:21 # gio:15:00 # noi:phong_giam_doc # bat_buoc
_Mốc 3: 500.000 người theo dõi. Số hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 500000:
    _Trượt. Tin đồn cắt giảm nhân sự bắt đầu chạy khắp tầng 1, nhanh hơn wifi._
    ~ gd_uy(-5)
- else:
    _Đạt. Nhưng tin đồn cắt giảm vẫn chạy. Tin đồn không cần số liệu._
}
hr: *(đặt tập hồ sơ hồng lên bàn)* Anh ơi, "danh sách dự phòng" anh đưa em hôm 1/10. Anh cần 7 tên trước 26/10. Hiện em có 5. Có {thuc_tap_sinh} và {thanh_xin_nghi}.
_Trang 2, nét chữ của chính bạn: "Người cuối cùng: {hr}." Bạn viết dòng đó hôm 1/10 lúc hoảng nhất._
* [✂️ "Đủ 7 tên. Anh duyệt. Để phòng thôi."]
    ~ gd_uy(-5)
    ~ qh("hr", -5)
    hr: Dạ. Em… em chỉ muốn lắng nghe anh thôi. *(giọng hơi run)*
* [📄 Xé trang 2 trước mặt {hr}: "Không có người cuối cùng nào cả."]
    _{hr} nhìn tờ giấy rách. Lần đầu tiên bạn thấy nụ cười đó tắt._
    hr: … Anh viết tên em hả anh?
    giam_doc: Hôm đó anh sợ. Giờ anh hết sợ rồi. Một chút.
    ~ qh("hr", 20)
    ~ gd_uy(5)
* [🗑️ "Hủy cả danh sách. Nếu thất bại, người đi đầu tiên là anh."]
    ~ qh("hr", 15)
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("thanh_xin_nghi", 10)
    ~ gd_uy(10)
    ~ gd_hua()
    _Lời hứa đẹp nhất bạn từng nói. Và là lời hứa khó giữ nhất._
- -> END

// ------------------------------------------------------------
=== giam_doc_2210_doan_thue ===
# ngay:22 # gio:09:00 # noi:sanh_le_tan # bat_buoc
_9:00. Đoàn kiểm tra thuế tới bất ngờ. Trưởng đoàn là Chú Liêm, 55 tuổi, kính lão, chưa từng cười. Cả công ty lập tức giả vờ làm việc chăm chỉ. {chua_te_deadline} lần đầu tiên mở file Excel._
chu_liem: Chào anh Giám đốc. Tôi cần: bản gốc giấy tờ thành lập, hợp đồng tài trợ với BTT Global, bằng chứng nghiệm thu dự án tháng 6, và nguồn gốc khoản 5 tỷ.
_Bạn phải chọn ai ra tiếp đoàn._
* [🧾 "{ke_toan} tiếp anh. Sổ sách cô ấy giữ."]
    ~ gd_nguoi_tiep_thue = "ke_toan"
    ke_toan: Dạ mời chú lên tầng 2. Hóa đơn đủ hết, từng đồng.
    ~ qh("ke_toan", 5)
    ~ gd_no(-5)
* [🙇 "{thanh_ninh} tiếp anh. Em ấy ăn nói khéo."]
    ~ gd_nguoi_tiep_thue = "thanh_ninh"
    thanh_ninh: Dạ em chào chú! Chú đeo kính lão mà nhìn trẻ quá chú ơi!
    chu_liem: *(không cười)* Cô cho tôi xem sổ.
    { RANDOM(1, 10) <= 5:
        _{thanh_ninh} mở nhầm thư mục "Email sếp". Chú Liêm nheo mắt đọc tiêu đề: "Ngân hàng Tín Dụng Đen Đủi - Thông báo quá hạn"._
        ~ gd_no(15)
    - else:
        _{thanh_ninh} khen chú Liêm 11 phút. Chú Liêm vẫn không cười, nhưng quên mất hai câu hỏi._
    }
* [👔 "Tôi tự tiếp anh."]
    ~ gd_nguoi_tiep_thue = "giam_doc"
    chu_liem: Khoản 5 tỷ. Anh giải thích.
    ** [😮‍💨 Nói thật: "Tiền đối tác trả trước. Sau khi trả nợ lương và lãi vay thế chấp còn 2 tỷ. {ke_toan} có đủ chứng từ."]
        chu_liem: *(ghi chép)* Thế chấp nhà riêng để trả lương nhân viên. Ừm.
        ~ gd_no(-20)
        ~ gd_tu_thu = true
        ~ gd_uy(5)
    ** [🎭 "Doanh thu kinh doanh bình thường thôi anh. Synergy ấy mà."]
        chu_liem: Synergy là mục nào trong sổ?
        ~ gd_no(20)
        ~ cang_thang(15)
- -> END

// ------------------------------------------------------------
=== giam_doc_2210_giay_to_goc ===
# ngay:22 # gio:10:30 # noi:choi_bao_ve # bat_buoc
_Bản gốc giấy tờ thành lập. Bạn lục tung két công ty. Không có. Mười năm nay bạn chưa từng thấy nó._
_Bác {bac_bao_ve} đứng ở cửa phòng, tay cầm một túi nilon bọc ba lớp._
bac_bao_ve: Cậu tìm cái này à? Sáng nay bác về Ven Đô lấy.
_Bản gốc. Đứng tên Genta. Con dấu đỏ hình chữ G. Giấy hơi ngả vàng nhưng không một vết gấp._
* [😶 Cầm lấy, không nói nên lời.]
    _Mười sáu năm. Genta không gửi nó cho bạn. Genta gửi nó cho người ngồi ở cửa._
    ~ phat_hien(binh_tai_mat_g)
    ~ gd_tham_nha_binh = true
    ~ qh("bac_bao_ve", 10)
    ~ cang_thang(10)
* [💬 "Sao bác giữ cái này ạ?"]
    bac_bao_ve: Người ta tin bác. Thế thôi.
    giam_doc: Còn cháu… người ta có tin cháu không ạ?
    bac_bao_ve: Cậu hỏi người ta ấy. Bác chỉ giữ giấy.
    ~ phat_hien(binh_tai_mat_g)
    ~ gd_tham_nha_binh = true
    ~ qh("bac_bao_ve", 15)
* [😠 "Sao bác giấu cháu chuyện này mười năm?"]
    bac_bao_ve: Bác không giấu. Cậu không hỏi.
    ~ qh("bac_bao_ve", -10)
    ~ gd_tham_nha_binh = true
- chu_liem: *(đọc bản gốc)* Được. Bản gốc chuẩn. Giữ kỹ lắm.
~ gd_no(-5)
-> END

// ------------------------------------------------------------
=== giam_doc_2210_bang_chung_thang_6 ===
# ngay:22 # gio:14:00 # noi:phong_giam_doc # bat_buoc
_Bằng chứng nghiệm thu dự án quảng cáo tháng 6, hợp đồng 800 triệu. Không có file gốc thì khoản 800 triệu thành "doanh thu không rõ nguồn"._
chua_te_deadline: *(mặt trắng bệch)* Anh… em làm mất USB từ tháng 9. ÉT O ÉT. AI CỨU EM VỚI.
_Đúng lúc đó, {cho} đi qua cửa phòng, miệng ngậm một cái USB không nhãn, có mùi cà phê sữa đá. Chú Liêm đứng bật dậy, lùi ba bước._
chu_liem: Chó! Ai cho chó vào đây?!
* {gd_bene_tuat || qh_cho >= 20} [🐕 Ngồi xuống: "{cho}, đưa đây. Ngoan."]
    cho: Gâu. *(nhả USB vào tay bạn, vẫy đuôi)*
    ~ nhan(usb_khong_nhan)
    ~ phat_hien(usb_cua_vu)
    ~ gd_qua_thue = true
    ~ gd_no(-10)
    ~ qh("cho", 10)
    ~ qh("chua_te_deadline", 15)
    chua_te_deadline: Nước tới chân mới nhảy… mà nhảy là phải đẹp. Cảm ơn {cho}!
* [🔌 Gọi {it}: "Ổ cứng sao lưu của em có không?"]
    { qh_it >= 20:
        it: … Có. Ổ "KHÔNG ĐƯỢC MỞ". Lần này em mở. Vì anh hỏi tử tế.
        ~ gd_qua_thue = true
        ~ gd_no(-10)
        ~ qh("it", 5)
    - else:
        it: Em không biết ổ nào hết. Anh tắt đi bật lại thử chưa?
        ~ gd_no(10)
    }
* [😤 Đuổi {cho} ra, xin lỗi chú Liêm.]
    _{cho} chạy mất, USB vẫn trong miệng. Chú Liêm ghi vào biên bản: "Không cung cấp được bằng chứng nghiệm thu."_
    ~ gd_tien_cty(-200)
    ~ gd_no(15)
    ~ qh("cho", -10)
- { gd_qua_thue:
    chu_liem: *(đọc file, gật đầu)* Được. Đoàn ghi nhận. Công ty các anh… lộn xộn, nhưng không gian.
    ~ gd_uy(10)
    ~ cang_thang(-15)
}
-> END

// ------------------------------------------------------------
=== giam_doc_2310_qua_sinh_nhat ===
# ngay:23 # gio:09:30 # noi:phong_cho_snh # bat_buoc
_Sinh nhật {sieu_nhan_hong}. Phòng chờ chất đầy quà hồng. Bạn đứng ở cửa, tay cầm… quà gì?_
* [⌚ Một chiếc đồng hồ hồng thật đắt. Thẻ tín dụng còn quẹt được.]
    ~ tien_cong(-3000000)
    ~ gd_hua()
    sieu_nhan_hong: Woa! Mà… sếp ơi, sếp hông đeo đồng hồ hả?
    ~ qh("sieu_nhan_hong", 5)
    { gd_cam_dong_ho:
        ~ gd_no(5)
    }
* [🍌 Một túi chuối chiên nóng, mua ở công viên Hồ Cá Mập.]
    ~ tien_cong(-30000)
    sieu_nhan_hong: *(tháo găng, ăn liền hai cái)* Sếp hiểu em ghê!
    ~ qh("sieu_nhan_hong", 15)
* [📸 Tấm ảnh in khổ lớn: cả công ty chụp chung hôm 1/10, có {sieu_nhan_hong} đứng giữa.]
    sieu_nhan_hong: *(im lặng rất lâu)* … Lần đầu em có ảnh chụp với nhiều người vậy. Em treo ở nhà nha sếp. Nhà em bàn ăn có 12 ghế mà…
    _Câu nói bỏ lửng. Bạn hiểu. Nhà bạn cũng có cái bàn ăn 10 ghế._
    ~ qh("sieu_nhan_hong", 25)
- -> END

// ------------------------------------------------------------
=== giam_doc_2310_kevin_tron ===
# ngay:23 # gio:20:00 # noi:studio # bat_buoc
_20 giờ, studio tầng 2. Livestream sinh nhật. Kịch bản có màn "Nhà tài trợ BTT Global, Mr. Kevin Trộn, gửi lời chúc mừng". Mr. Kevin Trộn không có thật._
sales: *(thì thầm)* Anh ơi, cần một người đóng vai Mr. Kevin Trộn. Đeo kính đen, nói giọng Tây. 5 phút nữa lên sóng!
_Ứng viên: {thuc_tap_sinh}, {dan_dau_tu}, và… Bác {bac_bao_ve} đang mang trà lên._
* [🐣 "{thuc_tap_sinh} đóng."]
    thuc_tap_sinh: Dạ em làm liền ạ! Hello… ờ… em là Kevin… Kevin Trộn ạ!
    _Lễ phép quá mức. Mr. Kevin Trộn cúi chào khán giả 90 độ, "dạ" ba lần. Bình luận: "Nhà tài trợ dễ thương nhất năm"._
    ~ follow(10000)
    ~ qh("thuc_tap_sinh", 10)
* [📉 "{dan_dau_tu} đóng."]
    dan_dau_tu: Hello everybody! BTT Global… sắp x10!
    _Ba người xem nhận ra {dan_dau_tu} vì từng bị ông vay tiền. Bình luận: "Ủa anh trả tiền tui chưa?"._
    ~ follow(-5000)
    ~ scandal()
* [🛡️ "Bác {bac_bao_ve}… bác giúp cháu được không ạ?"]
    { qh_bac_bao_ve >= 30:
        bac_bao_ve: *(đeo kính đen, ngồi xuống, nói đúng một câu)* Chúc mừng sinh nhật. Cố lên.
        _Không giọng Tây, không diễn. Nhưng câu chúc chậm rãi ấy làm phần bình luận chững lại. "Ông chú này có tâm ghê."_
        ~ follow(20000)
        ~ qh("bac_bao_ve", 5)
    - else:
        bac_bao_ve: Bác không diễn đâu. Bác mang trà thôi.
        ~ follow(-3000)
    }
* [🧾 "Không diễn nữa. Bỏ màn đó. Nhà tài trợ không có thật thì không giả."]
    sales: Anh!… *(rồi im)* … Dạ.
    ~ qh("sales", -10)
    ~ gd_uy(5)
- _Giữa livestream, {sieu_nhan_hong} cầm micro, nhìn thẳng ống kính: "{chua_te_deadline} ơi… em thích anh." Hashtag \#{chua_te_deadline}ƠiTrảLờiĐi lên xu hướng trong 20 phút._
_{chua_te_deadline} cười, vỗ vai {sieu_nhan_hong}: "Ý tưởng PR hay đó anh." Cả studio cười theo. Chỉ có bạn, đứng sau máy quay, thấy {sieu_nhan_hong} cười chậm hơn mọi người nửa giây._
-> END

// ------------------------------------------------------------
=== giam_doc_2310_banh_kem ===
# ngay:23 # gio:20:30 # noi:studio
_Livestream vẫn đang chạy. Ba cái bánh kem hồng xếp trên bàn: bánh chính 3 tầng, bánh nhỏ cho nhân viên, và bánh xúc xích {chi_dai} làm riêng cho {cho}._
_{cho} đang nhìn bánh chính. {idol_het_thoi} đang đứng rất gần cái bàn. Không cái bánh nào sống sót được hết. Bạn chỉ chọn được: cái nào bị phá._
* [🎂 Dời bánh chính vào phòng kính. Để bánh nhân viên ngoài.]
    _{cho} lao vào bánh nhân viên. Cả tầng 1 ăn kem dưới sàn bằng thìa nhựa, cười như điên._
    ~ follow(5000)
    ~ qh("thuc_tap_sinh", -3)
* [🐕 Đặt bánh xúc xích ngay cửa để dụ {cho}.]
    _{cho} ăn sạch bánh xúc xích, nằm ngửa bụng. Bánh chính an toàn tới khi… {idol_het_thoi} "vấp", cả cái bánh đổ ụp. {idol_het_thoi} chỉ tay vào {cho} đang nằm ngủ._
    ~ qh("cho", 10)
    ~ qh("idol_het_thoi", -5)
* [🎥 Để nguyên. Phá thì phá, quay lại hết.]
    _{cho} nhảy lên bàn, bánh 3 tầng đổ ụp lên mũ {sieu_nhan_hong}. Clip "Siêu Nhân Kem" lên xu hướng 2 ngày._
    ~ follow(20000)
    ~ chung_so_meme = chung_so_meme + 1
    ~ qh("sieu_nhan_hong", -5)
- -> END

// ------------------------------------------------------------
=== giam_doc_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Bàn xếp cặp: {truong_phong} với {con_ong_chau_cha}, {designer} với {bien_kich}, {sales} với {ke_toan}, {hr} với {thanh_xin_nghi}, {chi_dai} với {thanh_ninh}. Bàn riêng "chủ nợ" cho {dan_dau_tu}._
chi_dai: Anh ngồi đâu cũng được. Nhưng ngồi là phải nghe, không được phát biểu.
_Cùng lúc đó, điện thoại cả phòng rung: clip {idol_het_thoi} hát "Công Viên" trong bóng tối hôm mất điện đang viral. Và một bài bóc: fan của {idol_het_thoi} có 80.000 tài khoản ảo._
* [🪑 Ngồi bàn "chủ nợ" với {dan_dau_tu}.]
    dan_dau_tu: Anh ngồi đây làm gì?
    giam_doc: Anh cũng là con nợ mà.
    _Cả bàn chủ nợ cười. Lần đầu tiên {dan_dau_tu} được cười cùng chủ nợ._
    ~ qh("dan_dau_tu", 15)
    ~ qh("bac_bao_ve", 5)
* [🎤 Đi tìm {idol_het_thoi} và {quan_ly_idol}: "Clip thật thì cứ để nó viral. Vụ fan ảo, anh đứng ra nói."]
    quan_ly_idol: Anh… anh đứng ra hả? Chuyện này để em lo…
    giam_doc: Năm 2015 anh lăng xê nó. Giờ anh chịu trách nhiệm.
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 15)
    ~ follow(20000)
    ~ gd_uy(5)
* [😶 Ngồi im, nghe hết. Không phát biểu một câu.]
    ~ gd_sua("ke_chuyen")
    ~ gd_uy(5)
    chi_dai: *(cuối buổi)* Ba tiếng không nói câu nào. Anh tiến bộ rồi đó.
    ~ qh("chi_dai", 10)
- -> END

// ------------------------------------------------------------
=== giam_doc_2410_viet_thu_hoi_am ===
# ngay:24 # gio:20:00 # noi:choi_bao_ve # bat_buoc # dieu_kien:gd_doc_thu_g
_Tối 24/10. Thư đi đường bộ mất 5 ngày. Gửi tối nay thì ngày 29 tới tay người nhận. Gửi mai là muộn._
{ not gd_doc_thu_g:
    _Bạn đi ngang chòi bảo vệ. Bác {bac_bao_ve} đang nghe radio. Bạn chưa đọc lá thư, nên không biết phải viết gì._
    -> END
}
{ gd_viet_thu_hoi_am:
    _Thư đã gửi từ hôm trước. Bác {bac_bao_ve} chỉ gật đầu với bạn: "Đi rồi."_
    -> END
}
_Bác {bac_bao_ve} đặt lên bàn một tờ giấy trắng và một cây bút bi, như đã chờ sẵn._
bac_bao_ve: Tối nay là hạn chót đấy cậu.
* [✉️ Viết thật hết: khoản vay, biệt thự, trang 47, và xin lỗi.]
    _"Anh Genta. Em xin lỗi. Năm 2024 em thế chấp nhà để trả lương. Em giấu anh vì sợ anh thất vọng. Em ký một hợp đồng mà không đọc trang 47. Nếu tháng này em không làm được, em sẽ không trốn. — {giam_doc}."_
    _Bạn viết 3 trang. Bàn tay run ở dòng cuối._
    ~ gd_viet_thu_hoi_am = true
    ~ gd_tu_thu = true
    ~ gd_lo_no = 0
    ~ cang_thang(-20)
    ~ qh("bac_bao_ve", 15)
    bac_bao_ve: *(dán tem)* Ừ. Thế là được.
* [✏️ Viết nửa thật: "Em ổn, công ty đang có một dự án lớn."]
    _Bạn viết. Đọc lại. Gấp lại. Rồi xé đôi._
    bac_bao_ve: Thư không thật thì gửi làm gì.
    ~ cang_thang(5)
* [🙈 "Để cháu nghĩ thêm."]
    bac_bao_ve: Ừ. Nghĩ lâu quá thì thành không viết.
    ~ gd_no(5)
- -> END

// ------------------------------------------------------------
=== giam_doc_2510_toa_nha_xanh_la ===
# ngay:25 # gio:10:15 # noi:cong_cong_ty
_Chủ nhật. Bạn ghé công ty lấy bộ gậy golf. Bên kia đường, đối diện cổng công ty, là tòa nhà kính 20 tầng màu xanh lá chuối của LL-Entertainment._
_Ở sảnh, bạn thấy hai người quen. {quan_ly_idol}, hai điện thoại trong tay, đang bắt tay thư ký của Lưu Lực. Và {thanh_ninh}, đội mũ, đeo khẩu trang, nhưng cái túi xách là quà 20/10 của bạn._
* [🚗 Dừng xe, gọi {quan_ly_idol}.]
    quan_ly_idol: *(giật mình)* Anh… anh nghe máy chút… À không. Dạ. Họ mời em 36 triệu một tháng. Với điều kiện mang {sieu_nhan_hong} theo.
    ** [😮‍💨 "Cậu đi thì anh không cản. Nhưng {idol_het_thoi} thì sao?"]
        quan_ly_idol: *(im lặng rất lâu)* … Em chưa nghĩ tới chuyện bỏ nó.
        ~ qh("quan_ly_idol", 15)
        ~ phat_hien(ll_moi_thai)
    ** [💼 "Anh trả cậu 30 triệu. Tháng sau."]
        ~ gd_hua()
        quan_ly_idol: "Tháng sau" của anh em nghe 10 năm rồi.
        ~ qh("quan_ly_idol", -5)
* [📱 Nhắn {thanh_ninh}: "Em đi lạc à?"]
    thanh_ninh: Dạ sếp ơi em đi… làm nail ạ! Tiệm nail ở tầng 20 ạ!
    _Tòa LL không có tiệm nail._
    ~ qh("thanh_ninh", -5)
    ~ gd_no(5)
* [😶 Lái đi. Không nhìn lại.]
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== giam_doc_2610_mua_kenh_linh ===
# ngay:26 # gio:17:00 # noi:phong_giam_doc # bat_buoc
_Chiều thứ Hai. Tin đồn "cắt giảm nếu Siêu Nhân Hồng thất bại" lan khắp tầng 1._
{ gd_hua_leo >= 5:
    ~ gd_nhan_vien_bo_di = gd_nhan_vien_bo_di + 1
    _{hr} báo: đã có người đặt lịch phỏng vấn ở LL. Hứa lèo quá nhiều, người ta không chờ nữa._
    ~ gd_uy(-5)
}
_16 giờ chiều nay, công ty chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". Cuối phim, một khung hình có con cú nhỏ. Bạn đã tra: kênh Diu-túp "Cú Đêm Cắt Ghép", 980.000 người đăng ký. Chủ kênh là {editor}._
editor: *(đứng trước bàn, ngáp)* Anh gọi em ạ?
* [💰 "Anh mua kênh của em. 200 triệu. Đổi tên thành kênh của {sieu_nhan_hong}."]
    editor: *(tỉnh hẳn)* … Kênh đó em làm 6 năm. Không bán anh.
    ~ qh("editor", -15)
    _{editor} đi ra. Không ngáp._
* [🤝 "Anh không mua. Anh xin. Một video hợp tác thôi, ghi tên em đầy đủ."]
    editor: *(im lặng)* … Ghi tên em hả anh?
    giam_doc: Ghi to. Không phải tên {truong_phong}.
    ~ qh("editor", 20)
    ~ qh("truong_phong", -5)
    ~ follow(25000)
* [💬 "Mấy cái MV của {truong_phong}… là em dựng hết à?"]
    editor: Render xong là xong anh.
    _Lần thứ hai bạn nghe câu đó. Lần này bạn hiểu nó nghĩa là "vâng"._
    ~ qh("editor", 10)
- -> END

// ------------------------------------------------------------
=== giam_doc_2610_email_luu_luc ===
# ngay:26 # gio:23:40 # noi:biet_thu
_23:40. Email mới. Người gửi: Lưu Lực, CEO LL-Entertainment._
luu_luc: *(email)* "Anh {giam_doc} thân mến. Ngày mai tôi sẽ mời {sieu_nhan_hong} với giá gấp ba. Báo trước cho anh vì tôi tôn trọng đối thủ. Việc hôm nay phải xong từ hôm qua."
~ gd_ll_moi_thang = true
~ phat_hien(ll_moi_nguyen)
* [📞 Gọi ngay cho {sieu_nhan_hong}.]
    _Chuông đổ 8 hồi. Không ai nghe. Có lẽ đang giúp ai đó qua đường. Lúc nửa đêm._
    ~ cang_thang(10)
* [📧 Chuyển tiếp cho {ke_toan} và {chi_dai}: "Ngày mai mình giữ người."]
    ke_toan: *(trả lời ngay lập tức)* Em thức nè anh.
    chi_dai: Ổng tới thì em ra cổng.
    ~ qh("ke_toan", 5)
    ~ qh("chi_dai", 5)
* [😶 Đóng máy. Mở tấm ảnh năm 2010.]
    _Căn phòng 20 mét vuông. Lúc đó cũng có người đòi mua lại. Genta đã nói: "Không bán thứ mình đang tin."_
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== giam_doc_2710_cuoc_goi_luu_luc ===
# ngay:27 # gio:09:00 # noi:phong_giam_doc # bat_buoc
_9:00. Điện thoại. Giọng diễn giả truyền cảm hứng, vang như đang nói trên sân khấu._
luu_luc: Anh {giam_doc}! Anh có muốn bán lại Siêu Nhân Hồng không, hay để em lấy miễn phí?
* [💼 "Cậu có tiền. Tôi có người. Người không bán."]
    luu_luc: Người nào cũng có giá anh ạ. Anh thì có, đúng không? Biệt thự số 1, Đồi Ngân Hàng.
    ~ gd_no(5)
    ~ gd_uy(5)
* [😂 "Anh không ép, tùy em."]
    ~ gd_so_lan_tuy_em = gd_so_lan_tuy_em + 1
    luu_luc: *(khựng lại)* … Ý anh là gì?
    giam_doc: Là cậu đoán đi.
    _Lần đầu tiên câu cửa miệng của bạn làm người khác bối rối thay vì làm nhân viên bối rối._
* [📴 Cúp máy.]
    _Ba giây sau, Lưu Lực nhắn: "Em sẽ tới tận nơi."_
- -> END

// ------------------------------------------------------------
=== giam_doc_2710_luu_luc_toi_cong ===
# ngay:27 # gio:15:00 # noi:sanh_le_tan # bat_buoc
_15:00. Một chiếc xe trắng dừng trước cổng. Lưu Lực bước xuống, vest trắng, tóc vuốt keo, tay ôm tập hồ sơ xanh lá chuối._
cho: GRỪ… GÂU GÂU!
_Lưu Lực vào tới sảnh. Đúng lúc đó, {chi_dai} từ kho sự kiện đi ra, tay xách thùng nước._
_Lưu Lực nhìn {chi_dai}. Mặt anh ta trắng bệch. Tập hồ sơ rơi xuống đất, giấy bay khắp sảnh._
luu_luc: C… chị… chị {chi_dai}… Quán Ốc Đêm… mười năm trước…
chi_dai: *(nhíu mày)* Ủa? À… cái ông bị tô ốc len hả?
* [😂 Đứng xem. Không cứu ai cả.]
    _Lưu Lực nhặt giấy trong 4 phút. {cho} tha mất 2 tờ. Bạn không giúp. Ngày hôm nay bạn thấy mình hơi xấu tính, và rất vui._
    ~ cang_thang(-15)
* [🤝 Cúi xuống nhặt giấy giúp. Liếc qua nội dung.]
    _Từng tờ là một lời mời: {quan_ly_idol} 36 triệu. {ke_toan}: Kế toán trưởng, lương gấp đôi. {it} 26 triệu. {bac_bao_ve}: "bảo vệ LL lương 15 triệu"…_
    ~ phat_hien(ll_moi_thai)
    ~ gd_uy(5)
    luu_luc: Cảm ơn anh. *(giật lại)* Anh đọc rồi thì càng tốt. Người của anh, ai cũng có giá.
* [🦁 Đứng cạnh {chi_dai}: "{chi_dai}, em tiếp khách giúp anh."]
    chi_dai: Dạ. *(đặt thùng nước xuống, xắn tay áo)*
    luu_luc: Thôi! Thôi, em… em xin phép đi trước!
    ~ qh("chi_dai", 10)
    ~ gd_uy(10)
    _Chiếc xe trắng chạy đi. {cho} sủa theo tới tận đầu đường._
- -> END

// ------------------------------------------------------------
=== giam_doc_2710_giu_chan_nguyen ===
# ngay:27 # gio:17:00 # noi:phong_cho_snh # bat_buoc
_Chiều. {sieu_nhan_hong} ngồi trong phòng chờ, trên bàn là hợp đồng của LL: lăng xê miễn phí, và gấp ba 5 tỷ._
sieu_nhan_hong: Sếp… em hông biết phải làm sao. Bên kia hứa em lên top 1 trong một tuần.
_Bạn có ba cách giữ {sieu_nhan_hong}: tiền (không có), tình cảm, hoặc sự thật._
* [💰 "Anh trả thêm. Bao nhiêu cũng được."]
    sieu_nhan_hong: Sếp ơi… em biết sếp hông có mà. Cả mạng biết rồi.
    ~ gd_hua()
    { gd_hua_leo >= 7:
        sieu_nhan_hong: Sếp hứa với ai cũng vậy hết. Em nghe mấy anh chị kể rồi.
        -> giam_doc_2710_nguyen_di
    }
    sieu_nhan_hong: *(nhìn tờ hợp đồng rất lâu)* … Thôi. Em ở lại tới Đại Nhạc Hội đã. Rồi tính.
    -> END
* {qh_sieu_nhan_hong >= 60} [🩷 "Ở đây có người nhớ em thích chuối chiên. Bên kia có ai nhớ không?"]
    sieu_nhan_hong: *(im lặng rất lâu)* … Bên đó hông có ai biết tên thật của em.
    _{sieu_nhan_hong} xé tờ hợp đồng xanh lá chuối làm đôi. Rồi làm tư. Rồi tạo dáng._
    sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ! Em ở lại!
    ~ qh("sieu_nhan_hong", 10)
    ~ gd_uy(10)
    -> END
* [😮‍💨 Nói thật: "Công ty nợ. Anh cầm nhà. Nếu em đi, bọn anh phá sản. Anh không có gì để trả giá cao hơn. Chỉ có sự thật."]
    ~ gd_noi_that_nguyen = true
    ~ gd_tu_thu = true
    ~ gd_no(-10)
    sieu_nhan_hong: *(tháo mũ, đặt lên bàn)* … Sếp biết sao em tới đây hông? Vì em đọc thấy công ty sắp đóng cửa. Em muốn giúp chỗ nào đang khó.
    sieu_nhan_hong: Bên kia đâu có khó. Em ở lại.
    ~ qh("sieu_nhan_hong", 20)
    ~ gd_uy(10)
    -> END
* [🙅 "Em đi thì đi. Anh không ép, tùy em."]
    ~ gd_tuy_em("sieu_nhan_hong")
    { qh_sieu_nhan_hong < 5:
        sieu_nhan_hong: … Dạ. Tùy em thì em… đi.
        -> giam_doc_2710_nguyen_di
    }
    sieu_nhan_hong: … Dạ. Tùy em thì em… ở. Ở đây còn có người nhớ em thích chuối chiên.
    _{sieu_nhan_hong} không nói người đó là ai. Không phải bạn._
    -> END

=== giam_doc_2710_nguyen_di ===
~ nguyen_theo_ll = true
~ follow(-100000)
~ gd_uy(-15)
_{sieu_nhan_hong} ký. Bộ đồ hồng bước ra khỏi phòng chờ, đi qua cổng. {cho} không sủa. Lần đầu tiên nó không sủa bộ đồ hồng._
_Bạn đứng nhìn bộ đồ hồng băng qua đường, đi thẳng vào tòa nhà kính xanh lá chuối đối diện._
-> END

// ------------------------------------------------------------
=== giam_doc_2710_sua_chua_hong_hao ===
# ngay:27 # gio:11:05 # noi:phong_giam_doc
_{sales} chạy vào, thở hổn hển, tóc rối, điện thoại còn nóng._
sales: Anh! Sữa Chua Hồng Hào ở Ven Đô vừa gọi em, đúng 11 giờ! Họ muốn tài trợ 1 tỷ cho Đại Nhạc Hội! Thật! Lần này thật!
_Cả phòng kính im lặng. {ke_toan} đứng ở cửa, khoanh tay. Không ai tin. Kể cả bạn, một chút._
* [😂 "Giống BTT Global à em?"]
    sales: *(mắt đỏ hoe)* … Dạ. Em biết mà. Lần duy nhất em nói thật.
    ~ qh("sales", -15)
    _Một tuần sau, Sữa Chua Hồng Hào ký với một công ty khác._
* [📞 "Gọi lại cho họ. Bật loa ngoài. Anh nghe."]
    _Đầu dây bên kia: một giọng bà cụ, chậm rãi, "Bên cô thấy cậu Siêu Nhân giúp người, cô thương. Cô tài trợ."_
    ~ gd_tien_cty(1000)
    ~ follow(20000)
    ~ qh("sales", 25)
    ~ qh("ke_toan", 5)
    sales: *(khóc thật)* Em cảm ơn anh… lần đầu có người tin em.
    ke_toan: Hợp đồng gửi lên đây em. Hóa đơn đỏ đầy đủ. Lần này chị duyệt liền.
* [🧾 "{ke_toan} kiểm tra giúp anh rồi tính."]
    ke_toan: Để em gọi xác minh. Chậm 2 ngày.
    ~ gd_tien_cty(500)
    ~ qh("sales", 5)
    _Hai ngày sau, Sữa Chua Hồng Hào giảm còn 500 triệu. "Cô đợi lâu quá, cô chia bớt cho chỗ khác rồi con."_
- -> END
