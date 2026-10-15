// ============================================================
// CHƯƠNG 6: "ĐÊM HỒNG CỦA CHÓ" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== cho_2810_moc_bon ===
# ngay:28 # gio:11:00 # noi:tang_1 # bat_buoc
_Thứ 4. Hai chuyện nổ ra cùng một buổi sáng. Bạn không hiểu chuyện nào, nhưng bạn ngửi được cả hai._
_Ở phòng dựng phim: {editor} ngồi ôm đầu. Trên fanpage công ty vừa hiện lên một video dựng rất đẹp, toàn cảnh một người cầm hai điện thoại. Không phải video quảng cáo._
editor: Bla bla… bla… bla bla bla. # phu_de:Xuất nhầm… mình xuất nhầm lên fanpage… trời ơi…
_Ở bàn số liệu: {dan_dau_tu} nhìn màn hình, rồi nhìn sang {idol_het_thoi}. Màn hình đầy những tài khoản giống hệt nhau, cùng một câu "đỉnh nóc kịch trần"._
dan_dau_tu: Bla bla… bla bla… bla. # phu_de:Bộ lọc của tui ra rồi. Tám chục nghìn tài khoản ảo… đều trỏ về ông hết á, {idol_het_thoi}.
_{idol_het_thoi} tháo kính đen. Lần đầu tiên bạn thấy mắt người đó giữa ban ngày._
* [🐾 Tới phòng dựng phim, nằm lên chân {editor}.]
    _Bạn nằm lên chân {editor}. Người đó cúi xuống, tựa trán vào đầu bạn. Một lúc lâu._
    _Rồi cửa phòng mở. {quan_ly_idol} đứng đó, tay cầm một ly cà phê, không phải cho mình._
    quan_ly_idol: Bla bla… bla bla bla. # phu_de:Anh coi rồi. Dựng đẹp lắm. Ăn sáng chưa?
    ~ qh("editor", 10)
    ~ ch_cung(4)
* [🐾 Tới bàn số liệu, nằm lên chân {idol_het_thoi}.]
    _Bạn nằm lên chân người đó. Người đó gãi tai bạn, cười méo xệch._
    idol_het_thoi: Bla bla… TUẤT… bla bla bla. # phu_de:Em biết anh là ai không? …Ừ, chắc giờ thì ai cũng biết rồi.
    _Rồi có tiếng giày quen. {quan_ly_idol} tới, ngồi xuống bên cạnh, không nói gì, đặt lên bàn một bịch cá viên chiên._
    ~ qh("idol_het_thoi", 10)
    ~ ch_cung(4)
* [🏃 Chạy lòng vòng cả tầng cho mọi người quên chuyện đó đi.]
    _Bạn chạy. Một vòng. Hai vòng. Ly cà phê của ai đó đổ lên bàn phím của ai đó. Cả tầng hét lên, rồi cười, rồi đuổi bạn._
    _Mười phút. Mười phút không ai nhắc tới video hay tài khoản ảo. Mười phút đó là quà của bạn._
    ~ ch_cung(-2)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- { nguoi_theo_doi < 800000:
    _Chiều, {giam_doc} đi ngang chòi, mặt xám như xi măng. Ông ấy không xoa đầu bạn hôm nay. Con số không đạt. Bạn ngửi thấy mùi sợ từ tầng 2 xuống tận cổng._
- else:
    _Chiều, {giam_doc} đi ngang chòi, mặt hồng hào, xoa đầu bạn mạnh như lắc chai nước mắm. Con số đạt rồi._
    ~ qh("giam_doc", 3)
}
-> END

// ------------------------------------------------------------
=== cho_2910_ga_cao_su ===
# ngay:29 # gio:07:30 # noi:sanh_tang_tret # bat_buoc
_Thứ 5. Sáng sớm. Bạn đứng trước cái tủ sắt đầy dây xanh. Lần thứ mười trong tháng._
_Mùi con gà cao su. Rõ hơn bao giờ hết. Nó ở đó. Nó vẫn ở đó. 25 ngày rồi._
{ ch_co_ga_cao_su:
    _Không, khoan. Con gà của bạn đang nằm trong ổ. Cái mùi ở tủ sắt là mùi cũ, mùi nhớ. Bạn bỏ đi._
    _Lúc 9 giờ, wifi vẫn sập. Không phải do bạn. Có ai đó đã cắt một sợi dây. Gọn, phẳng, bằng kéo. Không có vết răng._
    ~ ch_cung(2)
    -> END
}
* [🦷 Cắn. Kéo. Cắn. Kéo. Con gà ơi, ra đây!]
    _Bạn cắn. Kéo. Một sợi dây tuột ra. Rồi sợi nữa. Rồi cả bó. Đèn trên tủ tắt hết, từng cái một, như sao tắt._
    _Và rồi, trong miệng bạn: con gà cao su. Bẩn, bụi, nhưng là con gà của bạn. Bạn chạy về ổ, vẫy đuôi điên cuồng._
    ~ ch_co_ga_cao_su = true
    _9 giờ. Cả công ty phát hiện: không có wifi. Không có gì cả. Tiếng hét từ tầng 1 vọng xuống tận cổng._
    it: *(mở tủ, nhìn đống dây bị cắn, nhìn xuống bạn đang ôm con gà)* Bla. Bla bla. # phu_de:Lỗi người dùng. Người dùng có lông.
    ~ qh("it", -5)
    ~ ch_cung(-3)
* [🐾 Ngồi chờ trước tủ, rên khe khẽ cho tới khi có người tới.]
    cho: Ẳng… ẳng…
    _{it} đi xuống, mắt thâm, cầm ly mì. Thấy bạn, thấy cái tủ. Người đó mở tủ, thò tay vào, lôi ra… con gà cao su._
    it: Bla. TUẤT. # phu_de:Của em hả. Ừ. {cho}.
    _{it} đưa con gà cho bạn. Rồi nhìn thêm vào trong tủ. Một sợi dây đã bị cắt sẵn, gọn, phẳng, bằng kéo. {it} đứng im rất lâu._
    ~ ch_co_ga_cao_su = true
    ~ qh("it", 10)
    ~ ch_cung(3)
* [😴 Thôi. Con gà không về được. Đi ngủ.]
    _Bạn bỏ đi. Lúc 9 giờ, wifi sập. Không phải do bạn. Lúc đó bạn đang ngủ dưới gầm cầu thang, mơ thấy con gà đang chạy về._
- -> END

// ------------------------------------------------------------
=== cho_2910_tong_dai_giay ===
# ngay:29 # gio:10:30 # noi:choi_bao_ve # bat_buoc
_Không có wifi, loài người trở về thời tiền sử. Chòi bảo vệ thành tổng đài. Người ta viết giấy, gửi bác, bác chuyển. Và bác có một nhân viên chuyển phát: bạn._
chi_dai: *(qua bộ đàm, giọng rè)* Bla bla… TUẤT… bla bla bla! # phu_de:{bac_bao_ve} ơi, cho {cho} mang tờ này lên phòng kỹ thuật, khẩn cấp!
hong_hot: Bla bla bla… bla! # phu_de:Wifi điện thoại của tui nè, mật khẩu "nghegichua", ai cần thì lên tầng 1!
_Hôm nay ai cũng rảnh. Rảnh tức là chơi với chó. Bạn được vuốt đầu gấp đôi mọi ngày._
* [🎁 Nhận việc chuyển thư. Chạy lên chạy xuống cả ngày.]
    _Bạn ngậm tờ giấy, chạy lên tầng 2. Ngậm tờ khác, chạy xuống. Ba tầng. Hai mươi lần. Mỗi lần giao xong, có một cái vuốt đầu, đôi khi là một miếng bánh._
    ~ ch_cung(5)
    ~ ch_cung(5)
    ~ ch_an(20)
    ~ ch_do_no = gioi_han(ch_do_no - 15)
    { RANDOM(1, 3) == 1:
        _Có một tờ giấy bạn giao nhầm. Tờ ghi "Em vẫn chưa trả lời anh" của ai đó, lại tới tay người khác. Bạn không biết. Nhưng tầng 1 hôm đó có thêm một vụ drama._
        ~ scandal()
    }
* [🎁 Ngậm một tờ giấy, tha về kho.]
    _Bạn ngậm một tờ giấy, không giao. Tha về kho. Tờ giấy có mùi nước hoa ngọt và mùi một tòa nhà kính. Trên đó có một địa chỉ email._
    ~ ch_tha_ve_kho()
    ~ ch_cung(5)
* [🙃 Nằm ngửa giữa chòi.]
    _Bạn nằm ngửa. Mỗi người tới gửi giấy đều cúi xuống gãi bụng bạn. Hai mươi người. Bạn không làm việc gì, nhưng là nhân viên được yêu nhất ngày._
    ~ ch_cung(5)
    ~ ch_cung(5)
    ~ nghi(20)
- -> END

// ------------------------------------------------------------
=== cho_2910_ai_cung_choi ===
# ngay:29 # gio:14:00 # noi:bai_xe
_Chiều. Vẫn không có wifi. Bãi xe biến thành sân chơi._
thuc_tap_sinh: Bla bla… TUẤT… bla bla! # phu_de:{cho} ơi! Ném bóng nè!
hong_hot: Bla bla… TUẤT… NGỒI… BẮT TAY… bla bla bla! # phu_de:Không có mạng thì quay trước, có mạng thì đăng! {cho}, ngồi! Bắt tay!
_Và từ phía cổng, mùi bánh chuối chiên. Bộ đồ hồng không có việc gì làm, cũng ra bãi xe._
sieu_nhan_hong: Gâu! Bla bla… TUẤT… XÚC XÍCH… bla bla! # phu_de:Gâu! {cho} ơi, không có mạng thì anh cũng hết việc, chơi với em nè, có xúc xích!
* [🐾 Chơi nhặt bóng với {thuc_tap_sinh}.]
    -> cho_mg_nhat_bong
* [🐾 Làm người mẫu cho {hong_hot}.]
    -> cho_mg_nguoi_mau
* [🦴 Nhận xúc xích từ tay bộ đồ hồng.]
    ~ ch_an_cua_nguyen()
    ~ ch_hong_doi(-5)
    sieu_nhan_hong: Bla bla! Bla bla bla! # phu_de:Ăn rồi! Ăn của anh rồi nha! Mình là bạn rồi!
    _Bạn không phải bạn. Bạn chỉ đói. Nhưng bạn vẫn cho người đó xoa đầu một cái. Một cái thôi._
    { ch_ghet_hong <= 30:
        hong_hot: Bla bla bla… bla bla! # phu_de:Khoan! Đứng yên! Chụp chung một tấm! Tuất với Hồng, hòa bình!
        _Bạn ngồi cạnh bộ đồ hồng. Không gầm gừ. Tách. "Cuối cùng cũng hòa bình!" Tấm ảnh lên mạng ngay khi có wifi._
        ~ ch_chup_anh_hoa_binh = true
        ~ follow(30000)
    }
- -> END

// ------------------------------------------------------------
=== cho_3010_don_kho ===
# ngay:30 # gio:07:15 # noi:gam_cau_thang # bat_buoc
_Thứ 6. Ngày quan trọng. Bạn biết vì bác mặc áo đồng phục mới, và vì {hr} đi lại khắp tòa nhà với một cái bảng kẹp giấy._
hr: Bla bla bla… bla bla bla… bla. # phu_de:Trước họp đánh giá, dọn sạch toàn bộ kho. Gầm cầu thang cũng dọn. Đội vệ sinh 9 giờ tới.
_Gầm cầu thang. KHO CỦA BẠN. 9 giờ._
_Bạn đứng trước kho. Chìa khóa. Son môi. Điện thoại cũ. Tất lẻ. Nắp bút hồng. {ch_co_giay_dem_17:Chiếc giày. }{co(gang_tay_hong):Chiếc găng tay hồng. }{ch_co_trang_ho_so_ll:Tờ giấy xanh lá chuối. }{ch_co_la_thu_g:Lá thư chữ G. }Tất cả những gì bạn đã giữ._
{ ch_kho_bi_lo:
    _Có người đã nhòm thấy kho. Mùi người đó còn ở đây. Đội dọn dẹp chắc chắn sẽ được chỉ tới đúng chỗ này._
}
* [🏃 Chạy ra chòi, cắn ống quần bác kéo tới kho.]
    _Bác đi theo. Bác nhìn kho. Bác không ngạc nhiên. Bác chỉ thở dài, lấy một cái thùng các-tông, xếp từng món vào, cẩn thận như xếp hồ sơ._
    bac_bao_ve: Bla bla… bla… bla bla. # phu_de:Đồ của mày thì để trong chòi. Chòi là của bác, chả ai dọn được.
    ~ ch_dong_minh_kho = "bac_bao_ve"
    ~ qh("bac_bao_ve", 5)
* [🏃 Chạy lên phòng server, kéo {it} xuống.]
    _{it} đi xuống, nhìn kho. Nhìn rất lâu. Rồi lấy điện thoại chụp từng món._
    it: Bla. Bla bla. # phu_de:Lưu rồi. Có log là có bằng chứng.
    _{it} chuyển hết vào phòng server. Phòng server không ai dám dọn._
    ~ ch_dong_minh_kho = "it"
    ~ qh("it", 6)
* [🏃 Chạy đi tìm {thuc_tap_sinh}.]
    _{thuc_tap_sinh} đi theo bạn, nhìn kho, há hốc miệng. Rồi xắn tay áo, ôm hết vào một cái thùng, chạy lên giấu dưới bàn photo._
    thuc_tap_sinh: Bla bla… TUẤT… bla bla! # phu_de:Dạ em giữ cho {cho}! Bàn photo là địa bàn của em ạ!
    ~ ch_dong_minh_kho = "thuc_tap_sinh"
    ~ qh("thuc_tap_sinh", 6)
* [🎁 Tự tha từng món, mang thẳng vào phòng họp tầng 2.]
    ~ ch_tha_vao_phong_hop = true
    _Bạn ngậm món đầu tiên, chiếc chìa khóa. Chạy lên tầng 2. Đặt dưới gầm bàn phòng họp. Chạy xuống. Ngậm món tiếp theo._
    _Hai mươi chuyến. Ba tầng. Chân bạn mỏi nhừ. Gầm bàn phòng họp giờ là kho báu thứ hai._
    ~ ch_do_no = gioi_han(ch_do_no - 25)
* [😴 Nằm chắn trước kho, không cho ai lại gần.]
    _Bạn nằm chắn. 9 giờ, đội dọn dẹp tới, ba người, một cái chổi và rất nhiều túi đen. Họ nhìn bạn. Bạn nhìn họ. Họ nhìn {hr}._
    { ch_dong_minh_kho != "":
        _Rồi bác tới. Bác nói vài câu. Đội dọn dẹp đi chỗ khác. Bác đã biết kho từ trước, và bác đã chuẩn bị._
    - else:
        hr: Bla bla… TUẤT… bla bla. # phu_de:{cho}, xin lỗi em nha. Nội quy là nội quy.
        _Người cười suốt bế bạn ra. Không mạnh tay. Rất nhẹ. Nhưng vẫn bế ra._
        ~ ch_kho_bi_don = true
    }
- { ch_dong_minh_kho == "" && not ch_tha_vao_phong_hop && not ch_kho_bi_don:
    ~ ch_kho_bi_don = true
}
{ ch_kho_bi_don:
    _9 giờ 30. Gầm cầu thang sạch bong. Sơn trắng. Một cái biển nhựa: "Kho chứa đồ vệ sinh". Mọi thứ vào túi rác đen._
    _Chỉ còn sót một thứ, lăn vào khe gạch: chiếc nắp bút hồng. Bạn nằm xuống cạnh nó._
}
-> END

// ------------------------------------------------------------
=== cho_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2. Cả công ty. {giam_doc} ngồi đầu bàn, tay cầm một tập giấy dày. Không khí căng như dây đàn của {idol_het_thoi}._
giam_doc: Bla bla bla… bla bla… bla bla bla bla. # phu_de:Hôm nay mình đánh giá cuối tháng. Đề bạt, tăng lương, và… những thay đổi cần thiết.
{ ch_tha_vao_phong_hop:
    -> cho_3010_tha_tung_mon
}
_Bạn nằm dưới gầm bàn, như mọi cuộc họp. 22 đôi chân. Đôi nào cũng run._
* [😴 Ngủ. Chuyện của loài người.]
    ~ nghi(20)
    _Bạn ngủ. Mơ thấy lương ba cây xúc xích. Tỉnh dậy, cuộc họp vẫn chưa xong._
* [🐾 Đi một vòng, dụi đầu vào từng đôi chân run nhất.]
    _Bạn đi một vòng. Chân {thuc_tap_sinh}. Chân {thanh_xin_nghi}. Chân {hr}, lạ thay, run nhất. Mỗi đôi chân bạn chạm qua, run ít đi một chút._
    ~ ch_cung(5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [😤 Sủa đúng lúc {giam_doc} đọc tới "cắt giảm".]
    cho: GÂU!
    _Cả phòng giật mình. Rồi im lặng. Rồi {chi_dai} bật cười, và cả phòng cười theo. {giam_doc} đặt tập giấy xuống. Chưa đọc tiếp._
    ~ ch_cung(-2)
    ~ qh("chi_dai", 3)
- -> END

= cho_3010_tha_tung_mon
_Bạn chui ra từ gầm bàn. Trong miệng là chiếc chìa khóa. Bạn đặt lên bàn, ngay giữa._
chi_dai: Bla… bla bla bla? # phu_de:Ủa, chìa khóa sân thượng? Ai làm rơi lúc 22 giờ vậy?
_Một người ở cuối bàn ho khan. Mặt đỏ._
_Bạn chui xuống, chui lên. Cây son môi. Một người khác đặt tay lên miệng._
~ temp so_mon_tha = 2
{ ch_co_bien_lai_cam_do:
    _Tờ biên lai cầm đồ. {dan_dau_tu} nhìn nó như nhìn biểu đồ lao dốc._
    ~ so_mon_tha = so_mon_tha + 1
}
{ ch_co_la_thu_g:
    _Lá thư chữ G. Bác đứng ở cửa, khẽ gật đầu. Bác cầm lá thư lên, cất vào túi áo. {giam_doc} nhìn chữ G, mặt tái đi._
    ~ so_mon_tha = so_mon_tha + 1
    ~ phat_hien(binh_tai_mat_g)
}
{ ch_co_trang_ho_so_ll:
    _Tờ giấy xanh lá chuối. Có tên người. Có con số. Cả phòng chuyền tay nhau đọc. Không khí đổi màu._
    ~ so_mon_tha = so_mon_tha + 1
}
{ co(usb_khong_nhan):
    _Cái USB không nhãn. {chua_te_deadline} đứng bật dậy, rồi ngồi xuống, rồi đứng dậy lần nữa._
    ~ so_mon_tha = so_mon_tha + 1
}
{ ch_co_giay_dem_17:
    _Món cuối cùng. Chiếc giày đêm 17/10. Bạn đặt nó lên bàn, rồi đi thẳng tới chỗ {ten(ch_nguoi_la_dem_17)}, ngồi xuống trước mặt người đó._
    ~ so_mon_tha = so_mon_tha + 1
    { ch_nguoi_la_dem_17 == ran_thu_hai:
        _Người đó đứng bật dậy. {it} mở laptop: "Log đêm 17, máy giám đốc, 1 giờ 04 phút." Bác mở sổ trực: "1 giờ, đèn tầng 2 sáng." Mọi thứ khớp._
        ~ phat_hien(ran_thu_hai_lo_mat)
        ~ ch_chi_ra_ran_thu_hai = true
    - else:
        _Người đó đỏ mặt, gãi đầu: "Dạ… đêm đó em lên tìm đồ… em quên mất." Cả phòng thở phào. Không phải kẻ xấu. Chỉ là kẻ đãng trí._
    }
- else:
    { ch_chi_ra_ran_thu_hai:
        _Món cuối cùng không phải đồ vật. Bạn đi thẳng tới chỗ {ten(ran_thu_hai)}, ngồi xuống, sủa đúng một tiếng như hôm 27/10. Mùi xanh lá chuối vẫn còn đó. Lần này cả phòng đều hiểu._
        ~ phat_hien(ran_thu_hai_lo_mat)
    }
}
_Bạn đã tha vào phòng họp {so_mon_tha + 3} món, nếu tính cả tất lẻ, điện thoại cũ và nắp bút hồng. Mỗi món một câu chuyện. Không ai trong phòng còn nhìn bạn như nhìn một con chó nữa._
~ ch_cung(10)
-> END

// ------------------------------------------------------------
=== cho_3010_toi ===
# ngay:30 # gio:19:30 # noi:choi_bao_ve
_Tối. Công ty về hết. Bác pha ấm trà cuối ngày. Ngày mai là Đêm Hồng, cả công ty sẽ ở Sân khấu Đêm Hồng tới khuya._
bac_bao_ve: Bla bla… TUẤT… bla bla bla. # phu_de:Mai đông người lắm. Mày đi theo bác. Đừng có chạy lung tung, nghe chưa.
{ ch_kho_bi_don:
    _Bạn nằm trong ổ, ngậm chiếc nắp bút hồng. Nó là tất cả những gì còn lại. Bác nhìn bạn, không nói gì, đặt thêm một cây xúc xích cạnh ổ._
    ~ ch_an(15)
- else:
    _Kho của bạn vẫn còn. Ở đâu đó. Bạn biết. Bạn ngủ ngon hơn khi biết đồ của mình còn đó._
}
* [🙃 Nằm ngửa cạnh ghế bố.]
    _Bác gãi bụng. Radio phát bài hát về Hà Nội. Ngày mai đông người, ồn ào, hồng rực. Tối nay chỉ có hai ông cháu._
    ~ qh("bac_bao_ve", 4)
* [👃 Ra cổng đánh hơi lần cuối trong ngày.]
    ~ ch_mui(2)
    _Mùi khói xe. Mùi cơm tấm. Và từ phía Sân khấu Đêm Hồng cách đây mấy con phố: mùi sơn mới, mùi dây điện mới, mùi rất nhiều bánh chuối chiên._
- -> END

// ------------------------------------------------------------
=== cho_3110_hoa_trang ===
# ngay:31 # gio:16:00 # noi:san_khau_dem_hong # bat_buoc
_Thứ 7. Đêm Hồng Halloween. Mọi người hóa trang. Một con ma. Một bà phù thủy. Một quả bí ngô. {giam_doc} mặc áo choàng đen, đeo mặt nạ in hình tờ giấy vay nợ: "Ông Kẹ Ngân Hàng"._
_Sân khấu ngoài trời đầy đèn hồng. Mùi hồng khắp nơi. Mũi bạn muốn xin nghỉ phép, như {thanh_xin_nghi}._
designer: Bla bla… TUẤT… bla bla bla? # phu_de:{cho} hóa trang gì đây ta? Có bộ bí ngô, có bộ… siêu nhân hồng mini nè!
* [😤 Gầm gừ vào bộ siêu nhân hồng mini.]
    cho: Grừ…
    designer: Bla bla. Bla bla bla. # phu_de:Rồi rồi. Bộ bí ngô. Hiểu rồi.
    _Bạn thành một quả bí ngô có đuôi. Bạn không vui, nhưng ít ra không hồng._
* [🐾 Mặc bộ siêu nhân hồng mini.]
    _Bạn để người ta mặc. Cả sân khấu cười rần. {hong_hot} quay lia lịa. Bộ đồ hồng thật nhìn thấy bạn, đứng hình, rồi chạy tới ngồi xổm, hai tay ôm mặt._
    sieu_nhan_hong: Bla bla… TUẤT… bla bla bla! # phu_de:Trời ơi {cho}! Em mặc giống anh! Đồng đội thật rồi!
    ~ follow(20000)
    ~ ch_hong_doi(-5)
* [🏃 Chạy trốn, không hóa trang gì cả.]
    _Bạn chạy, trốn dưới sân khấu. Ở đó có {chi_dai} đang ngồi với bộ đàm và cái cầu dao. Người đó nhìn bạn, gật đầu, cho bạn nằm cạnh._
    ~ qh("chi_dai", 3)
- -> END

// ------------------------------------------------------------
=== cho_3110_canh_ga ===
# ngay:31 # gio:20:45 # noi:san_khau_dem_hong # bat_buoc
_Đêm Hồng đang diễn ra. Tiếng nhạc dội tới cả đáy dạ dày. Bạn lẻn ra sau cánh gà._
_Ở đó, bộ đồ hồng ngồi một mình trên cái ghế nhựa. Tháo cái {ch_mu()} ra, lau mồ hôi, đặt xuống ghế bên cạnh._
_Khuôn mặt bình thường. Hơi gầy. Mắt mệt._
sieu_nhan_hong: Bla bla… TUẤT… bla bla… # phu_de:{cho} hả? Anh mệt quá. Hôm nay anh không chọc em đâu.
_Cái {ch_mu()} nằm đó. Không ai canh. Thứ bạn muốn ngoạm nhất trên đời. Cả tháng nay. Một lần thôi._
* [🦷 Ngoạm chiếc mũ, chạy thẳng ra sân khấu.]
    _Bạn ngoạm. Chạy. Ra khỏi cánh gà. Ra giữa ánh đèn. Hàng nghìn người. Một con chó vàng ngậm một chiếc mũ hồng._
    _Và phía sau, chạy đuổi theo, là một người với khuôn mặt thật. Không mũ. Giữa sân khấu Đêm Hồng._
    ~ ch_giat_mu = true
    ~ ch_lo_mat_nguyen = 100
    ~ follow(150000)
    ~ ch_hong_doi(-30)
    _Khán đài im bặt một giây. Rồi vỡ òa. Không ai đoán được tiếng vỡ òa đó là cười, là hét, hay là vỗ tay._
* [🐾 Ngồi canh chiếc mũ, không cho ai khác lại gần.]
    _Bạn ngồi cạnh chiếc mũ. Một người quay phim đi tới, giơ máy lên. Bạn gầm gừ. Người đó lùi lại._
    _Một paparazzi thò đầu qua rèm. Bạn sủa. Người đó biến mất._
    _Bộ đồ hồng nhìn bạn rất lâu._
    sieu_nhan_hong: Bla… bla bla… NGOAN… # phu_de:Em… canh mũ cho anh hả… ngoan… ngoan quá…
    ~ ch_hong_doi(-20)
    ~ qh("sieu_nhan_hong", 15)
* {ch_ghet_hong <= 30} [🙃 Nằm ngửa trước mặt người đó.]
    _Bạn nằm ngửa. Bụng chó. Ngay trước đôi giày hồng._
    _Người đó ngồi bệt xuống sàn, gãi bụng bạn. Rất lâu. Lần đầu tiên, không có camera nào._
    ~ ch_nam_ngua_dem_hong = true
    ~ ch_hong_doi(-20)
    ~ qh("sieu_nhan_hong", 20)
* [😤 Sủa cho người ta biết là nó đang tháo mũ.]
    cho: GÂU! GÂU! GÂU!
    _Ba người chạy tới. Bộ đồ hồng chụp vội cái mũ, đội lên, xiêu vẹo. Rồi nhìn bạn. Không giận. Chỉ buồn._
    ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 10
    ~ ch_hong_doi(5)
- _Một lúc sau, tiếng MC gọi tên. Người đó đứng dậy, cầm mũ lên, nhìn nó, rồi nhìn bạn._
{ ch_giat_mu:
    _Không còn mũ nào để đội. Người đó bước ra sân khấu như vậy. Mặt thật. Dưới hàng nghìn ánh đèn._
- else:
    { ch_ghet_hong <= 20:
        _Người đó đặt cái mũ lại xuống ghế. Rồi bước ra sân khấu. Không đội._
        ~ nguyen_thao_mu_dem_hong = true
    - else:
        _Người đó đội mũ lên. Bước ra sân khấu. "Hồng không phải màu, Hồng là thái độ!" Khán đài gào lên._
    }
}
-> END

// ------------------------------------------------------------
=== cho_3110_sau_dem_hong ===
# ngay:31 # gio:23:00 # noi:cong_cong_ty # bat_buoc
_23 giờ. Đêm Hồng kết thúc. Bác chở bạn về chòi. Cổng công ty vắng tanh, chỉ có đèn đường vàng và mấy quả bóng bay hồng xẹp lăn theo gió._
_Mũi bạn mỏi. Chân bạn mỏi. Nhưng đuôi bạn vẫn còn sức vẫy một chút._
bac_bao_ve: Bla bla… TUẤT… bla. # phu_de:Xong rồi, {cho} ạ. Một tháng. Về nhà thôi.
-> cho_3010_danh_gia
