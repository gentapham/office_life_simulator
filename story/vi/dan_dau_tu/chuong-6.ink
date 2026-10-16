// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · CHƯƠNG 6: "CẮT LỖ" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== dan_dau_tu_2810_fan_ao ===
# ngay:28 # gio:09:00 # noi:ban_so_lieu # bat_buoc
_Mốc 4: 800.000 người theo dõi. Nền tảng thông báo sẽ "rà soát tài khoản bất thường" trước 31/10. Lượt theo dõi ảo bị phát hiện là bị phạt nặng._
_Bạn chạy bộ lọc. Danh sách tài khoản ảo hiện ra: tên "user123…", ảnh đại diện trống, bình luận giống hệt nhau._
_Phần lớn là bot rác. Nhưng có một cụm 80.000 tài khoản, cùng một nguồn trả tiền: dịch vụ "Like Thật 100%". Bình luận: "Anh {idol_het_thoi} đỉnh nóc kịch trần"._
_Bạn nợ {idol_het_thoi} 500.000đ. Và bạn vừa thấy bí mật lớn nhất của {idol_het_thoi}._
* [🧹 Xóa lặng lẽ cả cụm. Không nói với ai.]
    _Bạn lọc sạch. Trang công ty an toàn. Không ai biết cụm 80.000 tài khoản kia từng tồn tại, trừ bạn._
    ~ follow(5000)
    ~ ddt_lam_that(5)
    ~ phat_hien(fan_ao_phat)
    ** [💬 Nhắn riêng {idol_het_thoi}: "Anh xóa rồi. Đừng thuê nữa. Clip hát trong tối của em, toàn người thật."]
        idol_het_thoi: *(gõ, xóa, gõ lại)* …Anh biết hết rồi hả. Ừ. Cảm ơn anh. 500 nghìn anh nợ em, coi như xong.
        ~ ddt_xoa("idol_het_thoi", 500000)
        ~ qh("idol_het_thoi", 20)
    ** [😶 Không nhắn gì.]
        ~ qh("idol_het_thoi", 0)
* [📢 Báo cáo cho {giam_doc} và {quan_ly_idol}: "Cụm này của {idol_het_thoi}."]
    ~ ddt_noi_fan_ao = true
    quan_ly_idol: *(im lặng rất lâu qua điện thoại)* Ừ. Tui biết. Để tui lo. Đừng ai đăng gì hết.
    giam_doc: {idol_het_thoi} nó… Thôi. Em làm đúng. Anh cảm ơn.
    ~ follow(5000)
    ~ uy_tin = uy_tin + 5
    ~ qh("idol_het_thoi", -30)
    ~ phat_hien(fan_ao_phat)
* [📈 Để nguyên. Số càng to càng đẹp cho mốc 4.]
    _Con số trông đẹp thêm 80.000. Hai ngày sau, nền tảng rà soát và trừ thẳng tay._
    ~ follow(-80000)
    ~ ddt_dc(-10)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2810_du_doan_moc_4 ===
# ngay:28 # gio:16:00 # noi:phong_giam_doc # bat_buoc
_Chiều 28. Sáng nay {editor} lỡ xuất một video tỏ tình lên fanpage công ty. Bảng số liệu của bạn có một cái cột dựng đứng không ai lên kế hoạch._
giam_doc: {dan_dau_tu}. Mốc cuối trước Đại Nhạc Hội. Em đoán đi. Đoán cho đúng.
-> dan_dau_tu_mg_du_doan

// ------------------------------------------------------------
=== dan_dau_tu_2910_wifi_sap ===
# ngay:29 # gio:09:00 # noi:ban_so_lieu # bat_buoc
_Ngày Internet Quốc tế. 9 giờ sáng, wifi sập, tới tận 22 giờ 47 mới có lại. Cả công ty truy đuổi {it} từ tầng 2 xuống tầng trệt. Chiến dịch đứng hình._
_Bạn lại không có chart. Ngày thứ hai trong tháng sống như người bình thường._
{ ddt_xoa_app:
    _Thật ra, bạn đã không có chart từ hôm 22. Hôm nay chỉ là ngày cả công ty cùng bị như bạn._
    _Bạn lấy giấy bút, ngồi tính kế hoạch đăng bài cho tối nay khi có mạng lại. Tay không run._
    ~ ddt_lam_that(5)
    -> END
}
{ ddt_mo_cat_lo:
    _Điện thoại bạn có 4G yếu. Đủ để mở app. Bạn nhìn biểu tượng app chart. Nhớ tới chiếc xe về từ Vũng Tàu. Nhớ cái ghế trống ở bàn chủ nợ, hoặc tám ly trà._
    * [✂️ Giữ ngón tay trên biểu tượng 5 giây. Bấm "Gỡ cài đặt".]
        ~ ddt_xoa_app = true
        ~ ddt_nt(-30)
        ~ cang_thang(-20)
        _"Gỡ cài đặt." Màn hình phải tắt. Bạn ngồi đó, chờ cảm giác thua. Nó không tới. Chỉ có tiếng {hong_hot} hét "mật khẩu là nghegichua"._
        -> END
    * [📊 Không gỡ. Nhưng không mở. Làm việc.]
        ~ ddt_so_lan_tat_app = ddt_so_lan_tat_app + 1
        ~ ddt_lam_that(3)
        -> END
}
_Bạn bắt 4G mở chart. Nó load một nửa rồi đứng. Một nửa cây nến. Không biết xanh hay đỏ._
* [📱 Đi lòng vòng tìm sóng, giơ điện thoại lên trời.]
    _Bạn đứng trên sân thượng, giơ điện thoại như giơ ngọn đuốc. Chart load xong. Đỏ. Như mọi khi._
    ~ ddt_soi_chart()
    ~ cang_thang(10)
* [📊 Bỏ điện thoại vào ngăn kéo. Làm báo cáo bằng giấy.]
    ~ ddt_so_lan_tat_app = ddt_so_lan_tat_app + 1
    ~ ddt_lam_that(5)
    { ddt_so_lan_tat_app >= 3:
        ~ ddt_mo_cat_lo = true
        _Lần thứ ba bạn tự tay cất cái chart đi. Bạn bắt đầu thấy: cắt lỗ không phải là thua. Cắt lỗ là ngừng thua._
    }
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2910_tong_dai_giay ===
# ngay:29 # gio:11:00 # noi:choi_bao_ve
_Chòi bảo vệ thành "Tổng đài nhắn tin bằng giấy". Bác {bac_bao_ve} xếp từng tờ giấy nhắn vào hộp bánh, {chi_dai} điều phối bằng bộ đàm._
bac_bao_ve: Cậu {dan_dau_tu}. Có ai gửi gì thì để vào đây. Bác chuyển cho.
_Bạn cầm cây bút. Có 8 cái tên bạn nợ. Bạn chưa bao giờ viết cho ai trong số đó một chữ nào, ngoài "tuần sau"._
* [✍️ Viết 8 tờ giấy, mỗi tờ một câu thật lòng, gửi 8 chủ nợ.]
    _"Anh xin lỗi. Anh chưa trả được hết, nhưng anh nhớ từng đồng. Cảm ơn đã tin anh." Tám tờ, tám cái tên._
    bac_bao_ve: *(nhận xấp giấy, liếc qua tờ trên cùng, có tên mình)* Ừ. Bác chuyển.
    ~ ddt_qh_chu_no(10)
    ~ ddt_nt(-5)
    ~ cang_thang(-10)
* [📄 Gửi một tờ cho {hong_hot}: kế hoạch đăng bài 20:00 khi có mạng lại.]
    hong_hot: *(gửi lại qua giấy)* "OK anh. Có mạng là tui đăng đúng giờ. Anh đỉnh."
    ~ follow(10000)
    ~ ddt_lam_that(3)
* [😶 Không gửi gì. Ngồi uống trà.]
    ~ uong(25)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_3010_tra_no_cuoi ===
# ngay:30 # gio:08:30 # noi:tang_1 # bat_buoc
_Sáng 30. Họp đánh giá lúc 14 giờ. Bạn mở sổ nợ lần cuối trước buổi họp._
{ ddt_so_no == 0:
    _Sổ nợ: 0 đồng. Bạn nhìn con số 0 rất lâu. Đây là con số đẹp nhất bạn từng thấy, đẹp hơn mọi cây nến xanh._
    -> END
}
_Sổ nợ còn: {ddt_so_no} đồng. Ví bạn có: {tien} đồng._
* {tien >= ddt_so_no and ddt_so_no > 0} [💸 Trả hết. Đi một vòng công ty, trả từng người.]
    { ddt_no_binh > 0:
        ~ ddt_tra("bac_bao_ve", ddt_no_binh)
    }
    ~ ddt_tra("it", ddt_no_bao)
    ~ ddt_tra("sales", ddt_no_huyen)
    ~ ddt_tra("con_ong_chau_cha", ddt_no_long)
    ~ ddt_tra("thanh_xin_nghi", ddt_no_son)
    ~ ddt_tra("thuc_tap_sinh", ddt_no_duy)
    ~ ddt_tra("bien_kich", ddt_no_oanh)
    ~ ddt_tra("idol_het_thoi", ddt_no_phat)
    ~ ddt_tra("nha_hang", ddt_no_nha_hang)
    _Bạn đi một vòng. Mỗi người một phong bì. Không ai nói gì nhiều. Ai cũng nhận bằng hai tay._
    ~ ddt_qh_chu_no(10)
* {ddt_no_binh > 0 and tien >= ddt_no_binh} [💸 Trả Bác {bac_bao_ve} trước. Hết phần của bác.]
    ~ ddt_tra("bac_bao_ve", ddt_no_binh)
    bac_bao_ve: Hết rồi à? … Ừ. Cậu giỏi. Không phải giỏi vì trả. Giỏi vì không trốn.
    ~ qh("bac_bao_ve", 15)
* [📊 Trả mỗi người một phần nhỏ, theo lộ trình.]
    { tien >= 1000000:
        ~ ddt_tra("sales", 500000)
        ~ ddt_tra("it", 500000)
        ~ qh("sales", 5)
        ~ qh("it", 5)
    }
    _Không hết. Nhưng đúng hẹn. Lần đầu tiên bạn trả đúng hẹn._
* [😶 Đóng sổ. Để sau Đại Nhạc Hội.]
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_14 giờ, phòng họp tầng 2. Họp đánh giá cuối tháng. Bạn là người trình chiếu số liệu cả tháng. Máy chiếu bật lên. Laptop của bạn có hai cửa sổ đang mở._
_Cửa sổ nào hiện lên trước cả công ty, tùy cả tháng qua bạn nhìn cái nào nhiều hơn._
{ ddt_man_hinh_trai >= ddt_man_hinh_phai:
    _Màn hình trái. Bảng số liệu chiến dịch, sạch sẽ, có ghi chú tay ở từng mốc. Cả phòng im lặng đọc._
    giam_doc: Cái này… em làm cả tháng à?
    dan_dau_tu: Dạ. Mỗi ngày.
    ~ uy_tin = uy_tin + 5
- else:
    _Màn hình phải. Một cây nến đỏ to tướng phủ kín bức tường phòng họp. Dòng chữ "$HONG −99%" sáng chói._
    _Cả phòng im lặng. Rồi {hong_hot} bật cười trước. Bạn tắt nó đi, tay run._
    giam_doc: Ờ… Em chiếu lại cái kia đi.
    ~ uy_tin = uy_tin - 5
}
{ ddt_bao_ll:
    giam_doc: Và anh cảm ơn em vì đã báo chuyện LL mua số liệu. Người khác thì đã cầm 15 triệu rồi.
}
_Cuối buổi, {hr} đứng lên, cầm tập hồ sơ màu hồng. "Về điều chỉnh nhân sự… Dòng một: {thuc_tap_sinh}. Dòng hai: {thanh_xin_nghi}."_
_Hai cái tên đúng như bạn đoán. Người lương thấp nhất và người nghỉ nhiều nhất. Còn năm dòng trống._
* [📊 Giơ tay: "Anh {hr}, cắt hai người đó tiết kiệm 17 triệu một tháng. Một đêm Đại Nhạc Hội tốt mang về gấp trăm lần. Đợi số đêm mai."]
    { ddt_do_chuan >= 70:
        hr: *(gấp tập hồ sơ lại)* Số của anh {dan_dau_tu} tháng này chưa sai lần nào. Mình đợi.
        ~ qh("hr", 5)
        ~ qh("thuc_tap_sinh", 10)
        ~ qh("thanh_xin_nghi", 10)
    - else:
        hr: *(cười nhẹ)* Anh {dan_dau_tu}, số của anh thì… mình cũng biết rồi. Em đọc tiếp nhé.
        _{hr} ghi thêm một dòng bằng bút chì. Bạn không nhìn rõ. Nhưng bạn đoán được._
    }
* [😶 Nhìn xuống bàn. Nhẩm xem dòng ba là ai.]
    _Bạn nhẩm. Người hay nhìn chart trong giờ làm nhất công ty. Bạn không cần số liệu để biết._
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_3110_truoc_gio ===
# ngay:31 # gio:17:30 # noi:san_khau_dem_hong # bat_buoc
_Đại Nhạc Hội Siêu Nhân. Cả công ty hóa trang. {giam_doc} hóa trang "Ông Kẹ Ngân Hàng", tay cầm cuốn sổ nợ bằng bìa cứng. Bạn nhìn cuốn sổ, thấy hơi quen._
_Bạn không hóa trang. Bạn mặc áo sơ mi, cầm điện thoại mở bảng người theo dõi. Hôm nay, đó là bộ đồ của bạn._
_Trên điện thoại, {thanh_xin_nghi} nhắn: "Anh {dan_dau_tu}, 20:00 em thi chung kết 'Giọng Ca Ước Mơ'. Anh coi giùm em lượt bình chọn nha. Anh đọc số giỏi."_
* [📊 "Ok. Anh canh số cho em."]
    thanh_xin_nghi: Cảm ơn anh! Mà… 500 nghìn anh nợ em hồi tháng 3, thôi khỏi trả nha. Coi như tiền công đọc số!
    ~ ddt_xoa("thanh_xin_nghi", 500000)
    ~ qh("thanh_xin_nghi", 15)
* [😶 "Anh bận Đại Nhạc Hội."]
    thanh_xin_nghi: Dạ… ừ. Em hiểu.
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_3110_khan_dai ===
# ngay:31 # gio:19:15 # noi:san_khau_dem_hong # bat_buoc
_19 giờ 15. Khán đài kín dần. 15 phút nữa mở màn bằng phim ngắn "Người Hùng Không Tên", rồi video "16 năm" của {editor}. Bạn đứng ở góc khán đài, điện thoại sáng trong tay._
_Con số người theo dõi lúc này: {nguoi_theo_doi}._
{ ddt_thuyet_phuc_21:
    _Trong lịch chạy có một đoạn bạn đề xuất: màn hình lớn chiếu clip {sieu_nhan_hong} cả tháng đi giúp người thật. Bạn hồi hộp như lúc bấm "Mua", chỉ khác là lần này bạn không sợ._
}
_20 giờ, màn hình lớn sẽ chiếu trực tiếp chung kết "Giọng Ca Ước Mơ" của {thanh_xin_nghi}, thí sinh số 27. Lần đầu tiên trong đời, bạn mong một con số đi lên, không phải vì tiền của mình._
* [🙏 Cất điện thoại. Tối nay nhìn sân khấu bằng mắt thật.]
    _Bạn tắt màn hình, bỏ điện thoại vào túi. Tay hơi trống. Nhưng mắt thì rảnh._
    ~ cang_thang(-20)
    ~ ddt_nt(-10)
* [📊 Soạn sẵn cho {hong_hot} lịch đăng từng phút: lúc nào đăng clip, lúc nào ghim bình luận.]
    hong_hot: Anh là cái radar sống hả? Ok, tối nay anh nhắn, tui đăng!
    ~ ddt_lam_that(3)
    ~ qh("hong_hot", 5)
* [📱 Mở sẵn kênh Đài Tivi Hóng để canh lượt bình chọn cho {thanh_xin_nghi}.]
    _Bạn chia đôi màn hình: một bên Đại Nhạc Hội Siêu Nhân, một bên "Giọng Ca Ước Mơ". Hai con số, hai người. Tối nay bạn canh cả hai._
    ~ qh("thanh_xin_nghi", 10)
- _Đèn khán đài tắt. Phim bắt đầu._
-> END
