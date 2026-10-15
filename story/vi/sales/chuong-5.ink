// ============================================================
// SALES · CHƯƠNG 5: "KEVIN TRỘN RA MẮT" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== sales_2110_confession ===
# ngay:21 # gio:09:00 # noi:ban_sales # bat_buoc
_Trang Confession G-Entertainment vừa đăng bài ẩn danh: biệt thự của {giam_doc} đang bị thế chấp ở ngân hàng._
hong_hot: *(mặt tỉnh bơ hơi quá mức)* Ối dồi ôi, biến căng rồi mấy bà ơi…
_Bạn đọc bài. Rồi nhớ lại câu {giam_doc} nói ở quán ốc, hoặc cái cách ông ấy nhìn biểu đồ của bạn. Sếp cũng đang vẽ biểu đồ đẹp. Gửi cho một người._
{ nguoi_theo_doi >= 500000:
    _Mốc 3 vượt: {nguoi_theo_doi}. Nhưng không ai còn tâm trạng ăn mừng._
- else:
    _Mốc 3 chưa đạt: {nguoi_theo_doi}. Tin đồn "cắt giảm nhân sự" chạy khắp các bàn. Có người nói Phòng Kinh doanh "toàn số ảo"._
    ~ cang_thang(10)
}
_{hr} và {it} đi từng bàn. {it} mở log truy cập mạng. Lịch sử tìm kiếm của bạn có dòng: "tra cứu mã số thuế BTT Global"._
* [🧹 Xóa lịch sử trình duyệt ngay.]
    it: *(dừng sau lưng bạn)* Xóa lịch sử thì log vẫn còn. Mà tôi tìm admin Confession, không tìm chuyện bánh tráng.
    ~ qh("it", 3)
    ~ cang_thang(5)
* [😇 Đi tới chỗ {giam_doc}, đặt lên bàn một ly trà đá.]
    giam_doc: *(ngẩng lên, mắt thâm)* Em… không hỏi gì à?
    sales: Dạ không. Ai cũng có biểu đồ đẹp mà sếp.
    _{giam_doc} nhìn bạn rất lâu. Rồi gật đầu, rất khẽ._
    ~ qh("giam_doc", 15)
* [🗣️ Đăng vào group: "Mọi người bình tĩnh, BTT Global vẫn cam kết tài trợ!"]
    ~ sl_phet(10)
    _Không ai trả lời. Trong một ngày như hôm nay, chẳng ai muốn nghe thêm một tập đoàn nào._
- { sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
-> END

// ------------------------------------------------------------
=== sales_2210_cuu_quynh ===
# ngay:22 # gio:10:15 # noi:ban_thiet_ke
_Đoàn kiểm tra thuế. Trưởng đoàn Chú Liêm, 55 tuổi, đi dọc dãy bàn. Cả công ty giả vờ chăm chỉ tới mức đáng ngờ._
_Bàn {designer}. Balo hé ra góc laptop thứ hai, màn hình còn sáng, logo xanh lá chuối chình ình ở góc._
ke_toan: {designer}, máy này của công ty hả em? Hóa đơn đâu em?
_{designer} liếc sang bạn. Một cái liếc. Mật mã của hai đứa: "Cứu."_ # hen_gio:4
* [🧋 Làm đổ ly trà sữa lên bàn mình. Thật mạnh.]
    _Trân châu lăn khắp sàn. Trà sữa chảy lên xấp hợp đồng. Cả đoàn quay sang._
    sales: Ối chết! Hợp đồng của chị! Ướt hết rồi!
    _May mà toàn hợp đồng giả. Bạn mất một ly trà sữa và một xấp giấy. {designer} gập laptop trong tích tắc._
    ~ mat(tra_sua)
    ~ qh("designer", 12)
* [🐕 Huýt sáo gọi {cho}.]
    cho: Gâu! *(phóng vào, đuôi vẫy tít)*
    chu_liem: Ối! Chó! Ai cho chó vào đây!
    _Chú Liêm sợ chó. Cả đoàn lùi lại 3 mét. {designer} gập máy._
    ~ qh("designer", 10)
    ~ qh("cho", 5)
* [😶 Không làm gì. Bạn còn lo phần mình chưa xong.]
    { RANDOM(1, 10) <= 4:
        _{ke_toan} thấy logo. Ghi một dòng vào sổ. Không nói gì. Nhưng {designer} biết, và bạn biết._
        ~ sl_bi_mat_lo = true
    - else:
        _Laptop thứ hai tự tắt vì hết pin. May. {designer} không nhìn bạn suốt buổi sáng._
    }
    ~ qh("designer", -10)
* [⏱️ (Không chọn kịp)]
    _Laptop thứ hai tự tắt vì hết pin. {designer} thở phào. Bạn cũng vậy. Hai người đều không làm gì cả._
- -> END

// ------------------------------------------------------------
=== sales_2210_doan_thue ===
# ngay:22 # gio:14:30 # noi:ban_sales # bat_buoc
_Chú Liêm ngồi xuống bàn bạn, mở cặp tài liệu._
chu_liem: Chị cho xem bản gốc hợp đồng tài trợ với Tập đoàn Bánh Tráng Trộn Toàn Cầu. Mã số thuế bên đó là gì chị?
_Đó là hợp đồng có giá trị lớn nhất trong sổ sách công ty. Và nó không tồn tại._ # hen_gio:5
* [📞 Rút điện thoại: "Dạ chủ tịch đang gọi, anh chờ em xíu!"]
    { RANDOM(1, 10) <= 5:
        _Bạn ra hành lang "nghe máy". Chú Liêm chờ 3 phút rồi chuyển sang bàn khác. Thoát. Tạm thời._
        ~ sl_phet(5)
    - else:
        _Điện thoại reo thật. To. Màn hình hiện: "Anh {dan_dau_tu} (nợ 5tr)". Chú Liêm nhìn màn hình, nhìn bạn._
        chu_liem: Chủ tịch tên {dan_dau_tu} à?
        ~ sl_phet(15)
        ~ cang_thang(15)
    }
* [🎨 Nhìn sang {designer}.]
    _{designer} lập tức đứng dậy, hỏi Chú Liêm về "quy định hóa đơn phần mềm thiết kế bản quyền theo năm". Kéo dài 15 phút. Chú Liêm lau mồ hôi._
    ~ qh("designer", 10)
* [🤝 "Dạ… hợp đồng đó chưa ký. Em báo cáo sai."]
    ~ sl_that_long()
    ~ sl_phet(-40)
    ~ sl_tu_nhan_btt_gia = true
    ~ sl_bi_mat_lo = true
    chu_liem: *(ghi chép)* Báo cáo sai. Phạt hành chính công ty 2 triệu. Lần sau ghi đúng nhé cháu.
    _Cả văn phòng nghe thấy. {hong_hot} bỏ điện thoại xuống. Lần đầu tiên {hong_hot} không đăng gì._
    giam_doc: *(từ cầu thang)* {sales}. Lên phòng anh.
    -> len_phong
* [⏱️ (Không chọn kịp)]
    ke_toan: *(đứng ra)* Hợp đồng đó đang chờ bản dịch, chú ạ. Bên kia là đối tác nước ngoài.
    _{ke_toan} đỡ cho bạn. Bạn biết từ giờ bạn nợ {ke_toan} một lần. Một lần lớn._
    ~ sl_no_thuong = true
    ~ qh("ke_toan", 5)
- -> END

= len_phong
_Phòng giám đốc. Bằng khen "Doanh nhân của năm" vẫn treo cạnh cửa sổ, nếu bạn từng tặng nó. {giam_doc} ngồi im._
giam_doc: Em biết không. Anh biết từ lâu rồi.
sales: Dạ…?
giam_doc: Anh cũng vẽ biểu đồ đẹp. Gửi anh Genta. Mấy năm rồi. *(cười buồn)* Em nói thật trước anh. Em giỏi hơn anh hồi 21 tuổi.
* [😢 "Sếp… em xin lỗi."]
    giam_doc: Đừng xin lỗi. Đi tìm nhà tài trợ thật đi. Còn 9 ngày.
    ~ qh("giam_doc", 10)
* [🤝 "Vậy sếp cũng nói thật đi sếp. Em đi cùng."]
    giam_doc: *(im lặng rất lâu)* …Để anh nghĩ. Cảm ơn em.
    ~ qh("giam_doc", 15)
- -> END

// ------------------------------------------------------------
=== sales_2210_chuong_soi_so ===
# ngay:22 # gio:16:30 # noi:san_thuong
_Sân thượng. {dan_dau_tu} đứng chờ bạn, cầm một tờ giấy in biểu đồ._
dan_dau_tu: {sales}. Đoàn thuế hỏi số liệu doanh thu quảng cáo. Anh soạn báo cáo. KPI của em không khớp với dòng tiền.
dan_dau_tu: Anh nhìn chart cả đời. Cột của em cao 300%, tiền về thì… 30%.
{ sl_tu_nhan_btt_gia:
    sales: Em đã nói với đoàn thuế rồi anh. Hợp đồng BTT không có.
    dan_dau_tu: *(gật)* Vậy thì anh ghi số thật. Em đỡ một gánh.
    ~ qh("dan_dau_tu", 5)
    -> END
}
* [🤝 "Anh ghi số thật đi anh. Em chịu."]
    ~ sl_that_long()
    ~ sl_giay(-100)
    dan_dau_tu: *(nhìn bạn)* Em nói thật hai lần trong một tháng. Anh sợ em bệnh.
    ~ qh("dan_dau_tu", 10)
* [💁 "Anh {dan_dau_tu}. Tin chị đi, giữ số này giùm em. Em xóa 1 triệu tiền nợ."]
    ~ sl_no_chuong = sl_no_chuong - 1000000
    ~ sl_phet(10)
    dan_dau_tu: *(nghĩ lâu)* …Anh giữ. Nhưng chỉ tới 30/10 thôi. Họp đánh giá là anh phải chiếu số thật.
* [😶 "Anh muốn sao thì làm vậy."]
    dan_dau_tu: Anh chưa biết. *(gấp tờ giấy, bỏ túi)*
    ~ cang_thang(10)
- { sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
-> END

// ------------------------------------------------------------
=== sales_2210_tuyen_chu_tich ===
# ngay:22 # gio:19:30 # noi:ban_sales # bat_buoc
giam_doc: *(nhắn)* {sales} ơi, mai livestream sinh nhật {sieu_nhan_hong}, anh muốn chủ tịch Kevin Trộn lên sóng tặng quà. Anh không ép, tùy em.
{ sl_tu_nhan_btt_gia:
    giam_doc: *(nhắn thêm)* …À, anh quên. Thôi khỏi. Em làm gì thật thì làm.
    _Bạn nhìn tin nhắn. Sếp quên thật hay sếp cố tình cho bạn một lối ra?_
}
_Bạn cần một người đóng vai chủ tịch. Hoặc không cần nữa._
thuc_tap_sinh: *(ló đầu ra từ pantry)* Dạ chị {sales} ơi, chị cần người đóng vai chủ tịch hả chị? Em mới vô nên chưa biết, chứ em… mặc vest cũng quen ạ.
* [💁 "Tin chị đi, anh {thuc_tap_sinh} mặc vest là ra đại gia liền."]
    ~ sl_kevin_dien_vien = "thuc_tap_sinh"
    ~ sl_tin_chi_di = sl_tin_chi_di + 1
    thuc_tap_sinh: Dạ! Em tập liền ạ!
    ~ qh("thuc_tap_sinh", 5)
* {biet(duy_tung_lam_ngan_hang)} [🔒 "Anh {thuc_tap_sinh}, hồi trước anh làm trưởng phòng ngân hàng phải hông? Em cần anh đóng chủ tịch. Và xem giùm em một cái hợp đồng thật nữa."]
    ~ sl_kevin_dien_vien = "thuc_tap_sinh"
    ~ sl_duy_xem_hop_dong = true
    thuc_tap_sinh: *(thẳng lưng, giọng đổi hẳn)* Chủ tịch thì ngồi thế này. Không cười trước. Gật đầu chậm. Hỏi lãi suất sau cùng.
    _Trong một giây, anh không còn là thực tập sinh. Bạn nổi da gà._
    ~ qh("thuc_tap_sinh", 15)
* {sl_no_chuong >= 1000000} [📉 Nhắn {dan_dau_tu}: "Anh đóng chủ tịch Kevin Trộn một buổi, em xóa nợ 1 triệu."]
    ~ sl_kevin_dien_vien = "dan_dau_tu"
    ~ sl_no_chuong = sl_no_chuong - 1000000
    dan_dau_tu: Deal! Anh sinh ra để làm chủ tịch. Chỉ là thị trường chưa nhận ra.
* [🛡️ Xuống chòi nhờ Bác {bac_bao_ve}.]
    bac_bao_ve: Bác á? Bác không biết nói gì đâu.
    sales: Dạ bác chỉ cần nói "Ừ" với "Thế à" thôi bác.
    bac_bao_ve: *(nghĩ)* Ừ. Thế à. *(gật)* Được.
    _Bạn nghe hai chữ đó và hiểu: Bác {bac_bao_ve} vô tình ra dáng đại gia hơn bất kỳ ai._
    ~ sl_kevin_dien_vien = "bac_bao_ve"
    ~ qh("bac_bao_ve", 5)
* [😇 "Thôi anh, em hông muốn kéo ai vô chuyện này nữa."]
    ~ sl_that_long()
    ~ qh("thuc_tap_sinh", 5)
    _Bạn nhắn sếp: "Dạ chủ tịch bận, không lên sóng được ạ." Sếp trả lời: "Ừ." Một chữ. Nhẹ cả người._
- -> END

// ------------------------------------------------------------
=== sales_2310_tap_dien ===
# ngay:23 # gio:14:00 # noi:studio
_Sinh nhật {sieu_nhan_hong}, 31 tuổi. Tập diễn ở góc studio, sau tấm phông BTT {designer} làm đêm qua._
{ sl_kevin_dien_vien:
- "thuc_tap_sinh":
    thuc_tap_sinh: *(vest, kính đen)* Chào các bạn. Tôi là Kevin Trộn. Tập đoàn chúng tôi… dạ chị ơi, câu tiếp theo là gì ạ?
    { sl_duy_xem_hop_dong:
        _Lần tập thứ hai, anh không cần kịch bản. Anh nói như thể đã ngồi ghế chủ tịch 10 năm._
    }
- "dan_dau_tu":
    dan_dau_tu: *(vest hơi chật)* Chào các bạn. Tập đoàn BTT… đang ở vùng tích lũy. Sắp bứt phá.
    sales: Anh ơi, đừng nói như phân tích chart!
    dan_dau_tu: Anh chỉ biết nói kiểu này thôi em.
- "bac_bao_ve":
    bac_bao_ve: *(áo vest cũ, kính lão)* Ừ.
    sales: Bác ơi, khi MC hỏi "Ông nghĩ sao về Siêu Nhân Hồng?"
    bac_bao_ve: Thế à.
    _Không biết vì sao, nhưng nó… thuyết phục._
- else:
    _Không có Kevin Trộn nào hôm nay. Bạn phụ {chi_dai} canh bánh kem, cách {cho} 5 mét._
    ~ qh("chi_dai", 5)
}
~ nghi(-10)
-> END

// ------------------------------------------------------------
=== sales_2310_livestream ===
# ngay:23 # gio:19:00 # noi:studio # bat_buoc
_19 giờ. Livestream sinh nhật. 12.000 người xem. Bánh kem hồng 3 tầng giữa phòng._
{ sl_kevin_dien_vien != "":
    -> kevin
- else:
    -> to_tinh
}

= kevin
giam_doc: Và bây giờ, xin mời chủ tịch Tập đoàn Bánh Tráng Trộn Toàn Cầu, Mr. Kevin Trộn!
~ sl_phet(10)
{ sl_kevin_dien_vien:
- "thuc_tap_sinh":
    { sl_duy_xem_hop_dong:
        thuc_tap_sinh: *(bước ra, gật đầu chậm)* Chúc mừng sinh nhật. Tập đoàn chúng tôi tin vào những người dám giúp người khác. Không cần lợi nhuận quý này.
        _Câu đó không có trong kịch bản. Bình luận chạy như thác: "Chủ tịch nói chuyện thấm quá", "BTT Global là gì vậy, muốn mua bánh tráng"._
        ~ sl_kevin_thanh_cong = true
        ~ sl_btt_xu_huong = true
    - else:
        { RANDOM(1, 10) <= 7:
            thuc_tap_sinh: Chúc mừng sinh nhật Siêu Nhân Hồng! Tập đoàn chúng tôi… rất vui!
            ~ sl_kevin_thanh_cong = true
            { RANDOM(1, 2) == 1:
                ~ sl_btt_xu_huong = true
            }
        - else:
            thuc_tap_sinh: Gói tài trợ có lãi suất ưu đãi 0,6% một tháng trong 12 kỳ đầu…
            hong_hot: *(nheo mắt)* Ủa… chủ tịch bánh tráng mà rành lãi suất dữ vậy?
            ~ sl_phet(10)
        }
    }
- "dan_dau_tu":
    { RANDOM(1, 10) <= 6:
        dan_dau_tu: Chúc mừng sinh nhật! BTT Global cam kết đồng hành dài hạn!
        ~ sl_kevin_thanh_cong = true
    - else:
        dan_dau_tu: Chúc mừng sinh nhật! Và các bạn ơi, cái này sắp x10, vào sớm còn kịp!
        _Bình luận: "Ủa chủ tịch rủ đầu tư hả?", "Lừa đảo hả?", "Giống Hồng Coin quá"._
        ~ sl_phet(15)
        ~ scandal()
        ~ follow(-20000)
    }
- "bac_bao_ve":
    giam_doc: Thưa chủ tịch, ông nghĩ sao về Siêu Nhân Hồng?
    bac_bao_ve: *(nhìn camera rất lâu)* Ừ.
    giam_doc: Ông có muốn gửi lời chúc gì không ạ?
    bac_bao_ve: Thế à. *(đặt hộp quà xuống, gật đầu, đi ra)*
    _Bình luận: "Đại gia thật sự là kiệm lời", "Chủ tịch ngầu quá", "Ông này giống bảo vệ chỗ tui ghê"._
    ~ sl_kevin_thanh_cong = true
    { RANDOM(1, 2) == 1:
        ~ sl_btt_xu_huong = true
    }
}
{ sl_kevin_thanh_cong:
    ~ follow(30000)
}
{ sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
-> to_tinh

= to_tinh
sieu_nhan_hong: Cảm ơn mọi người! Hôm nay em 31 tuổi! Em… có chuyện muốn nói.
sieu_nhan_hong: Anh {chua_te_deadline} ơi… em thích anh. Không phải PR đâu.
_Bình luận nổ tung. Hashtag \#VũƠiTrảLờiĐi lên xu hướng trong 4 phút. {chua_te_deadline} đứng ở góc phòng, đứng hình._
_Đúng lúc đó, một bóng đen lao vào. {cho}. Chiếc mũ bằng đường trên đỉnh bánh. Bánh kem bay._
cho: GÂU! *(ngoạm mũ đường, phóng ra cửa)*
* [💁 Cầm micro: "Đây là tiết mục bất ngờ do nhà tài trợ… à, do {cho} tài trợ!"]
    ~ follow(5000)
    ~ sl_phet(2)
    _Khán giả cười ồ. Ít ra là cười._
* [🤝 Chạy đi lấy khăn và dĩa mới, dọn cùng {chi_dai}.]
    ~ qh("chi_dai", 5)
    ~ qh("sieu_nhan_hong", 5)
* [📞 Gọi ngay tiệm bánh đầu phố: "Chị ơi, bánh của chị vừa lên livestream 12 nghìn người xem. Chị làm thêm cái nữa, mình ghi tên tiệm nha?"]
    _Chị chủ tiệm bánh im lặng 2 giây, rồi hét lên: "20 phút nữa có bánh!"_
    ~ sl_that(3)
    ~ follow(5000)
    ~ nhan(banh_kem)
- -> END

// ------------------------------------------------------------
=== sales_2410_hoi_nghi_hoa_giai ===
# ngay:24 # gio:09:30 # noi:sanh_tang_tret
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "hội nghị hòa giải". Bạn bị xếp ngồi đối diện {ke_toan}._
chi_dai: Hai đứa viết cho nhau một điều tốt. Thật lòng. Ai viết xạo chị biết liền.
_{ke_toan} viết xong trước, gấp đôi tờ giấy, đẩy sang. Bạn mở ra._
_"Em nói chuyện hay. Nếu nói thật thì càng hay."_
{ sl_no_thuong:
    _Bạn nhớ hôm 22. Bạn nợ {ke_toan} một lần._
}
* [🤝 Viết: "Chị ơi, BTT Global không có thật. Em xin lỗi chị. Em sẽ trả hết tạm ứng."]
    ~ sl_that_long()
    ~ sl_tu_nhan_btt_gia = true
    ~ sl_phet(-20)
    ~ sl_no_thuong = false
    _{ke_toan} đọc. Gấp lại. Bỏ vào túi áo. Rồi gật đầu một cái._
    ke_toan: Chị biết. Cảm ơn em đã viết. Chị giữ tờ này.
    ~ qh("ke_toan", 20)
* [😇 Viết: "Chị là người duy nhất trong công ty đọc hết hợp đồng. Cảm ơn chị."]
    ke_toan: *(đọc, khóe miệng giật nhẹ)* …Em cũng biết khen thật đó chứ.
    ~ qh("ke_toan", 10)
* [💁 Viết: "Tin chị đi, chị là kế toán giỏi nhất quận!"]
    ke_toan: *(đọc)* "Tin chị đi." *(nhìn bạn)* Chị nào?
    ~ sl_phet(2)
    ~ qh("ke_toan", -2)
- _Bàn bên cạnh, {chi_dai} và {thanh_ninh} vẽ chung một bức tranh chỉ có hai con dao. {chi_dai} nói là "dao cắt bánh"._
-> END

// ------------------------------------------------------------
=== sales_2410_ban_chu_no ===
# ngay:24 # gio:14:00 # noi:sanh_tang_tret
_{chi_dai} xếp riêng cho {dan_dau_tu} một bàn: "bàn chủ nợ". Bạn, {it}, Bác {bac_bao_ve}, {con_ong_chau_cha}, {thanh_xin_nghi}, {thuc_tap_sinh}, {bien_kich}, {idol_het_thoi} ngồi quanh._
dan_dau_tu: *(đứng trước bảng trắng)* Kế hoạch trả nợ: giai đoạn 1, tích lũy. Giai đoạn 2, bứt phá. Giai đoạn 3…
chi_dai: Giai đoạn 3 là trả. Nói con số.
_Phần nợ của bạn còn: {sl_no_chuong}đ._
* [📈 "Anh {dan_dau_tu}, em đề xuất: anh làm báo cáo số liệu thật cho em, mỗi bản trừ 500 nghìn."]
    dan_dau_tu: *(mắt sáng)* Trả nợ bằng nghề! Được! Lần này là… trả thật!
    ~ sl_no_chuong = sl_no_chuong - 500000
    ~ sl_chuong_lam_ngo = true
    ~ qh("dan_dau_tu", 10)
* [💁 "Tin chị đi, anh trả em trước thì mấy người kia sẽ tin anh hơn."]
    { RANDOM(1, 10) <= 3:
        dan_dau_tu: *(chuyển khoản 1 triệu)* Em nói có lý. Uy tín là vốn.
        ~ sl_chuong_tra(1000000)
    - else:
        it: *(cụt lủn)* Tôi cho vay trước cô.
        bac_bao_ve: Ừ. Bác cũng thế.
        _Bạn lùi về cuối hàng. Hợp lý._
    }
* [🤝 "Em xóa 1 triệu. Còn lại anh trả từ từ."]
    ~ sl_no_chuong = sl_no_chuong - 1000000
    ~ qh("dan_dau_tu", 15)
    dan_dau_tu: *(im lặng, rồi nói nhỏ)* Em là người đầu tiên xóa nợ cho anh. Anh nhớ.
- -> END

// ------------------------------------------------------------
=== sales_2510_ho_boi ===
# ngay:25 # gio:10:00 # noi:ho_boi_sky_ao
_Chủ nhật. Hồ bơi Sky Ảo. {con_ong_chau_cha} ngồi mép hồ, chân thả xuống nước, không có phao con vịt._
con_ong_chau_cha: {sales}. Penthouse của anh bị rao bán rồi. Chú anh không nói gì. Anh đọc trên mạng.
_Ở một tòa nhà khác, giờ này có người đang đi phỏng vấn lén ở LL, có người đang đàm phán lương. Ở đây, chỉ có tiếng nước._
* [💬 "Anh có muốn tự làm gì hông? Em bán giùm cho."]
    con_ong_chau_cha: *(nhìn bạn)* Bán… bán gì? Anh có gì đâu mà bán.
    sales: Ai cũng có cái để bán. Chỉ là chưa ai giúp mình gọi tên nó.
    con_ong_chau_cha: *(nghĩ lâu)* …Anh có viết vài bài hát. Dở thôi.
    sales: Dở thì em không bán. Hay thì em bán thật. Không phét.
    ~ qh("con_ong_chau_cha", 15)
* [💁 "Tin chị đi, anh qua căn 1203 ở chung, chia tiền nhà."]
    con_ong_chau_cha: *(bật cười)* Căn em có tủ lạnh trống, anh biết mà. Thôi, cảm ơn em.
    ~ qh("con_ong_chau_cha", 5)
* [😶 Ngồi xuống cạnh, thả chân xuống nước.]
    _Hai người ngồi im 15 phút. Nước mát. Không ai phải tỏ ra giàu._
    ~ cang_thang(-10)
    ~ qh("con_ong_chau_cha", 8)
- -> END

// ------------------------------------------------------------
=== sales_2610_tin_don ===
# ngay:26 # gio:09:00 # noi:ban_sales
_Thứ 2. Tin đồn chạy khắp công ty: nếu Siêu Nhân Hồng thất bại, cắt giảm ít nhất 7 người. {hr} đi qua bàn nào, bàn đó im._
hong_hot: *(thì thầm)* Bà ơi, nghe nói danh sách có phòng Kinh doanh đó.
_Chiều nay còn chiếu thử phim "Người Hùng Không Tên". Tối qua, nghe đâu Lưu Lực đã gửi email gì đó cho {giam_doc}._
* [📞 Gọi điện chào hàng như điên. Cách duy nhất để không nghĩ.]
    -> sales_mg_goi_dien_mo_dau
* [🧾 Lên phòng kế toán trả bớt tạm ứng.]
    { sl_tam_ung > 0 && tien >= 1000000:
        ~ tien_cong(-1000000)
        ~ sl_tam_ung = sl_tam_ung - 1000000
        { sl_tam_ung < 0:
            ~ sl_tam_ung = 0
        }
        ke_toan: *(ngạc nhiên)* Trả? Em trả tạm ứng? *(ghi sổ)* Chị ghi ngày này lại.
        ~ qh("ke_toan", 8)
    - else:
        _Bạn mở ví. Không đủ. Bạn quay xuống, bước chậm hơn lúc lên._
    }
* [💬 Hỏi thẳng {hr}: "Anh {hr}, em có trong danh sách hông?"]
    hr: *(cười)* Em rảnh không, lên phòng anh uống trà xíu.
    _Đó không phải câu trả lời. Đó là câu trả lời._
    ~ cang_thang(15)
- -> END

// ------------------------------------------------------------
=== sales_2710_luu_luc_toi ===
# ngay:27 # gio:14:00 # noi:sanh_tang_tret
_14 giờ. Một chiếc xe trắng đỗ trước cổng. Lưu Lực bước xuống: vest trắng, tóc vuốt keo, tay cầm tập hồ sơ dày._
luu_luc: Chào cả nhà {cong_ty}. Việc hôm nay phải xong từ hôm qua. Tôi tới gặp {sieu_nhan_hong}.
cho: Grừ… GÂU!
_Lưu Lực bước vào sảnh. Khựng lại. Ở cầu thang, {chi_dai} đang khoanh tay. Tập hồ sơ rơi xuống sàn. Lưu Lực lùi một bước, quay ra xe._
chi_dai: *(nhướng mày)* Ủa, ổng bị gì vậy?
* [💁 Đuổi theo ra xe: "Anh Lực! Bên em có gói tài trợ Đêm Hồng, anh quan tâm hông?"]
    luu_luc: *(dừng ở cửa xe, nhìn bạn từ đầu tới chân)* Em là cái người có tập đoàn bánh tráng hả? *(cười)* Bên anh biết hết.
    _Cửa xe đóng. Bạn đứng giữa sân, lạnh từ gót giày lên._
    ~ cang_thang(10)
* [🤝 Nhặt giấy tờ, đưa {chi_dai} giữ.]
    chi_dai: Để chị giữ. Chị không đọc. Mà đứa nào cần đọc thì chị không thấy.
    ~ qh("chi_dai", 8)
- -> END

// ------------------------------------------------------------
=== sales_2710_cuoc_goi ===
# ngay:27 # gio:16:00 # noi:ban_sales # bat_buoc
_16 giờ. Một số lạ gọi tới._
sua_chua_hong_hao: Chào chị, bên em là Sữa Chua Hồng Hào ở Ven Đô. Bên em muốn tài trợ Đêm Hồng 1 tỷ. Chị {sales} phụ trách phải không ạ?
_Bạn đứng chết lặng. Rồi bạn hét lên. Rồi bạn kể với cả phòng._
hong_hot: Ủa alo? Sữa Chua Hồng Hào gọi tài trợ 1 tỷ hả? Thôi {sales} ơi, tháng này em kể 7 nhà tài trợ rồi đó.
_Cả phòng cười. Không ai tin. Kể cả bạn, một chút._ # hen_gio:8
* [🤝 "Lần này thật mà chị {hong_hot}. Thật tới mức… chị sợ."]
    ~ sl_tin_cuoc_goi = true
    ~ sl_that_long()
    hong_hot: *(cười)* Ờ, ờ. Chị tin. *(không tin)*
    _Không ai tin. Bạn vẫn tin. Bạn ghi lại số điện thoại, giờ hẹn: 15 giờ ngày mai, quán Sống Ảo._
* [📱 Bật loa ngoài, gọi lại số vừa nãy trước mặt cả phòng.]
    ~ sl_tin_cuoc_goi = true
    ~ sl_chung_minh_cuoc_goi = true
    ~ sl_phet(-20)
    ~ sl_that_long()
    _Tút… tút… "Dạ Sữa Chua Hồng Hào xin nghe." Giọng chuyên nghiệp, rõ ràng._
    _Cả phòng im phăng phắc. {hong_hot} buông điện thoại. {ke_toan} đứng dậy từ bàn bên kia._
    ke_toan: *(nói nhỏ)* Hẹn ký ở đâu em?
    sales: Dạ… 15 giờ mai, Sống Ảo.
    ~ qh("ke_toan", 10)
    ~ qh("hong_hot", 5)
* [🗣️ "Thật ra họ tài trợ 3 tỷ, mà chị nói 1 cho khiêm tốn."]
    ~ sl_tin_cuoc_goi = true
    ~ sl_phet(20)
    hong_hot: 3 tỷ?! Đăng liền!
    _20 phút sau, Sữa Chua Hồng Hào gọi lại: "Ủa chị, sao trên mạng ghi bên em tài trợ 3 tỷ?". Giọng không còn vui._
* [😶 "Chắc ai chọc mình thôi." Cúp máy, không gọi lại.]
    _Bạn cười cùng cả phòng. Cười to nhất. Rồi xóa lịch sử cuộc gọi._
    _Ở Ven Đô, một người đặt điện thoại xuống, ghi vào sổ: "Bên G không phản hồi. Thử bên LL."_
* [⏱️ (Không chọn kịp)]
    _Bạn đứng đơ quá lâu. Cuộc gọi tự ngắt. Bạn gọi lại: thuê bao không liên lạc được. Bạn nhìn màn hình, không biết nên tin ai._
    ~ sl_tin_cuoc_goi = true
- { sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
-> END

// ------------------------------------------------------------
=== sales_2710_dem_quynh ===
# ngay:27 # gio:22:30 # noi:can_1203 # bat_buoc
_22 giờ 30. {designer} gọi video. Mắt đỏ, tóc rối._
designer: {sales}. Hồ sơ LL gửi anh {sieu_nhan_hong} hôm nay. Bìa hồ sơ… là chị vẽ. Font của chị. Dự án Hồng Ngoại.
designer: Chị tự tay vẽ cái bẫy cho công ty mình. Anh Lá Chuối vừa nhắn: thưởng 2 triệu, mời full-time lương gấp đôi.
_Bạn là người duy nhất biết bí mật này. Lời bạn nói lúc này nặng hơn bất kỳ deal nào._
* [🤝 "Chị cắt đi. Tiền mình kiếm lại được. Chị thì chỉ có một."]
    ~ sl_quynh_cat_dut_ll = true
    ~ qh("designer", 15)
    designer: *(im lặng lâu)* …Ừ. Chị nhắn anh ấy liền. {sales}… cảm ơn em.
    sales: Mai mốt mình mở studio, chị vẽ, em bán. Bán thật.
    designer: *(cười trong nước mắt)* Em hứa thật đó nha.
* [💁 "Tin chị đi, chị qua đó lương gấp đôi, em qua sau."]
    designer: *(nhìn bạn rất lâu)* …Em nói thật hay em đang bán hàng?
    _Bạn không trả lời được. {designer} tắt máy._
    ~ qh("designer", -15)
* [🔍 "Chị ơi… file gốc vẫn trong tay chị đúng hông? Màn hình LED của LL sẽ chạy đúng file đó…"]
    designer: *(mắt sáng lên)* …Em đang nghĩ cái chị đang nghĩ hả?
    sales: Em không nghĩ gì hết. Em chỉ nói "sửa nhẹ" thôi.
    designer: *(bật cười)* Sửa nhẹ. Lần đầu tiên chị muốn sửa nhẹ.
    ~ sl_quynh_cat_dut_ll = true
    ~ qh("designer", 12)
- -> END
