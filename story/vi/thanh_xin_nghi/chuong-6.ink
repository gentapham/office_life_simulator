// ============================================================
// THÁNH XIN NGHỈ: SƠN · CHƯƠNG 6: "HAI SÂN KHẤU MỘT ĐÊM" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== thanh_xin_nghi_2810_moc_4 ===
# ngay:28 # gio:16:00 # noi:phong_hop_sang_tao # bat_buoc
_Mốc 4: 800.000 người theo dõi. Sáng nay một video tỏ tình lạ lên fanpage công ty vì lỗi xuất file, ai cũng đoán là của {editor}. Chiều nay bộ lọc của {dan_dau_tu} lần ra 80.000 fan ảo của {idol_het_thoi}._
{ nguoi_theo_doi >= 800000:
    dan_dau_tu: 800 ngàn! Lần này là lên thật, thật, thật!
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
- else:
    dan_dau_tu: Chưa tới. LL có cớ rồi.
    _{giam_doc} nhìn về phía tòa nhà xanh lá chuối ở Ven Đô, không nói gì._
}
{ son_moi_nguyen_khach_moi:
    -> thanh_xin_nghi_2810_moc_4.s_khach_moi
}
~ son_di_lam()
-> END

= s_khach_moi
_Điện thoại bạn rung. Đài Tivi Hóng vừa đăng thông báo: "Khách mời đặc biệt đêm chung kết Giọng Ca Ước Mơ: SIÊU NHÂN HỒNG!" Lượt chia sẻ nhảy như điên._
~ follow(40000)
hong_hot: Ủa alo? Siêu Nhân Hồng làm khách mời thi hát? Ai sắp xếp vụ này vậy?
_Cả phòng họp quay sang người giữ lịch. Bạn._
* [😇 "Dạ em. Một phần trong chiến dịch ạ."]
    giam_doc: Hay! Hay lắm! Cùng tối Đại Nhạc Hội à? Thế thì… thế thì tính sao?
    thanh_xin_nghi: Dạ… em đang tính.
    ~ uy_tin = uy_tin + 5
    ~ son_soi(5)
* [😶 "Dạ chắc bên đài tự mời ạ."]
    _Anh {hr} nhìn bạn. Rồi nhìn cái lịch 31/10 trên màn chiếu. Rồi nhìn lại bạn._
    ~ son_soi(10)
- { qh_it >= 10:
    _Tan họp, {it} đi ngang bàn bạn, không dừng lại, chỉ nói một câu: "Cùng giờ hai sân khấu hả. Cần nối sóng thì nói. Tui có cáp."_
    ~ son_bao_giup = true
}
~ son_di_lam()
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2810_phong_server ===
# ngay:28 # gio:19:00 # noi:phong_server
_7 giờ tối. Phòng server. Lạnh như tủ đông. {it} ngồi giữa 3 màn hình, ly mì ăn dở._
it: Lỗi gì? Restart chưa?
{ son_bi_bao_ghi_am:
    it: À. {thanh_xin_nghi}. File "test_mic_trua_08". 47 phút. Tui nghe hết rồi. Test micro gì mà hát 11 bài.
}
* {son_moi_nguyen_khach_moi} [💬 "Anh {it}, nối sóng trực tiếp từ Đài Tivi Hóng về sân khấu Đại Nhạc Hội được hông anh? Chia đôi màn hình."]
    it: *(lần đầu quay hẳn ghế lại)* …Được. Cần đường truyền riêng. Cần đài đồng ý. Cần sếp không biết cho tới phút chót.
    { qh_it >= 20 || son_bi_bao_ghi_am:
        it: Tui làm. Không phải vì em. Vì 11 bài đó hay.
        ~ son_bao_giup = true
        ~ qh("it", 10)
    - else:
        it: Mà tui với em chưa thân tới mức đó. Đem mì ly tới thêm vài lần đi rồi tính.
        ~ qh("it", 5)
    }
* [🍜 Đặt lên bàn một thùng mì ly. "Không nhờ gì. Biếu anh."]
    ~ tien_cong(-120000)
    ~ qh("it", 15)
    it: *(nhìn thùng mì rất lâu)* …Có mùi nhờ vả. Nhưng tui nhận.
    { son_moi_nguyen_khach_moi:
        it: Mà nghe nói đêm 31 có người cần nối sóng từ Đài Tivi Hóng về sân khấu. Tui làm. Vì thùng mì. Không phải vì em.
        ~ son_bao_giup = true
    }
* [😶 Xin cái dây sạc rồi đi.]
    it: Lỗi người dùng. *(đưa dây sạc)*
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2910_goi_thang ===
# ngay:29 # gio:09:10 # noi:ban_dieu_phoi # bat_buoc
_Ngày Internet Quốc tế. 9 giờ sáng, wifi sập cả tòa nhà. Zalo-lô không gửi được. Chiều nay 14:00 là tổng duyệt chung kết ở Đài Tivi Hóng._
_Bạn phải xin về sớm nửa ngày. Bạn gọi số bàn phòng HR, cách bạn đúng một tầng lầu. Chuông reo 5 hồi. Rồi có người nhấc máy._
giam_doc: Alo! Phòng HR đây! {hr} ra cổng chấm công bằng giấy rồi, anh ngồi trực hộ. Ai đấy?
_Là {giam_doc}. Bạn chưa bao giờ xin nghỉ với {giam_doc}._
* [👵 "Dạ… anh {giam_doc}… bà ngoại em…"]
    ~ son_ba_ngoai()
    giam_doc: Bà ngoại cậu {thanh_xin_nghi} à? Anh nghe {hr} kể nhiều về bà rồi. Bà là người ốm nhiều nhất công ty đấy. Thôi được, anh không ép, tùy em. Nhưng 31/10 mà vắng là anh… *(tiếng máy fax kêu)* …thôi anh bận.
    ~ son_xin_nghi()
    ~ son_soi(10)
    ~ tien_cong(-295000)
    _Bạn được nghỉ nửa ngày. Và giờ {giam_doc} cũng biết bà ngoại._
* [🎤 "Anh {giam_doc}, em nói thật. Chiều nay em tổng duyệt chung kết một cuộc thi hát."]
    giam_doc: Thi hát? *(im lặng)* …Cậu hát được à?
    thanh_xin_nghi: Dạ. Được ạ.
    giam_doc: Ừ. Hồi 2015 anh tìm thấy {idol_het_thoi} ở một quán cà phê. Anh biết cảm giác đó. Đi đi. Nhưng 31/10…
    thanh_xin_nghi: Dạ em biết, anh.
    ~ son_xin_nghi()
    ~ son_tin(10)
    ~ qh("giam_doc", 10)
    ~ tien_cong(-295000)
* [😇 "Dạ… không có gì anh. Em gọi nhầm. Em tới liền."]
    ~ son_mo(-10)
    ~ son_soi(-5)
    ~ son_di_lam()
    _Bạn nhắn cô trợ lý (bằng 4G yếu ớt): "Em xin vắng tổng duyệt." Cô trả lời: "Cưng điên hả?"_
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_2910_tong_dai_giay ===
# ngay:29 # gio:10:00 # noi:chong_bao_ve
_Không mạng. Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Ai cần nhắn ai thì viết giấy, {cho} ngậm đi giao (sai 50%). Chị {chi_dai} điều phối bằng bộ đàm. {hong_hot} phát wifi điện thoại, mật khẩu "nghegichua"._
_Anh {hr} ngồi ghế đẩu ở cổng, chấm công bằng tay. Video "16 năm" của {editor} kẹt ở 99%._
chi_dai: *(bộ đàm)* {thanh_xin_nghi}! Lịch Đại Nhạc Hội! Xe đón Siêu Nhân Hồng mấy giờ? Kẹo ở đâu? Pháo giấy ở đâu?
* [📅 Viết lịch chạy chương trình ra 5 tờ giấy, phát tận tay.]
    ~ uy_tin = uy_tin + 5
    ~ follow(5000)
    chi_dai: Được! Giấy tờ rõ ràng! Thằng này hôm nay đi làm đủ, giỏi!
    ~ qh("chi_dai", 5)
* [🐕 Nhờ {cho} đưa lịch lên tầng 2.]
    _{cho} ngậm lịch, chạy lên tầng 2, rồi chạy xuống gầm cầu thang. Lịch Đại Nhạc Hội Siêu Nhân giờ nằm cạnh một chiếc găng tay hồng và một cái USB không nhãn._
    ~ cang_thang(5)
    ~ qh("cho", 3)
- hr: *(từ cổng)* {thanh_xin_nghi}. Hôm nay em đi làm. Hiếm ghê. Anh ghi lại để mai đọc trong họp.
-> END

// ------------------------------------------------------------
=== thanh_xin_nghi_3010_uong_tra ===
# ngay:30 # gio:08:30 # noi:phong_hr # bat_buoc
_Sáng 30/10. Trước họp đánh giá. Anh {hr} gọi bạn lên phòng HR. Câu đáng sợ nhất công ty: "Em rảnh không, lên phòng anh uống trà xíu."_
_Kệ trà. Ấm trà. Một tập hồ sơ dày 3 cm. Tên bạn trên gáy._
hr: *(rót trà, cười)* Mình cùng nhìn lại hành trình tháng này nha em. Em nghỉ {son_so_lan_nghi - 31} ngày. Trong đó {son_lan_ba_ngoai - 7} ngày bà ngoại, 1 ngày gặt lúa, 1 ngày… "đi đám cưới con mèo".
thanh_xin_nghi: Dạ… con mèo đó là có thật anh.
* [😢 "Dạ… em xin lỗi anh. Tháng sau em hứa đi đủ."]
    ~ son_soi(-10)
    hr: Ừ. Anh ghi nhận lời hứa.
    { son_ngay_phep <= -10:
        hr: Nhưng phép em âm {0 - son_ngay_phep} ngày rồi {thanh_xin_nghi}. Anh không cứu được. Em ký cái này.
        _Bản cam kết: "Không nghỉ thêm ngày nào tới hết năm, kể cả 31/10."_
        ~ son_ky_cam_ket = true
    }
* [🤧 Ho một tràng dài.]
    hr: Ho hay đó em. Trà này trị ho nè. *(đẩy qua ly trà gừng)*
    ~ son_soi(5)
    ~ uong(10)
* [🎤 "Anh {hr}, em nói thật. Mấy ngày đó em đi thi 'Giọng Ca Ước Mơ'."]
    _Anh {hr} đặt ly trà xuống. Rất chậm._
    hr: …{thanh_xin_nghi} Kim Tuyến?
    ~ son_tu_thu_tuan = true
    ~ phat_hien(son_thi_hat)
    { son_giac_mo >= 60:
        ~ son_bi_soi = 0
        hr: *(im lặng rất lâu, rồi cười, lần này không đáng sợ chút nào)* Anh biết mà. Anh không chịu tin thôi.
    - else:
        ~ son_soi(-20)
        hr: Anh… cần thời gian để tiêu hóa chuyện này.
    }
    ~ qh("hr", 15)
* {son_biet_so_604} [🔒 Mở điện thoại: "Cảm ơn số máy đuôi …604 đã bình chọn 47 lần."]
    _Anh {hr} im lặng 5 giây. Ly trà trên tay khựng giữa chừng._
    hr: Chuyện này… mình giữ trong phòng này thôi nha em.
    ~ son_soi(-50)
    ~ son_tu_thu_tuan = true
    ~ qh("hr", 30)
    hr: *(đỏ mặt)* 47 lần là… do mạng lag. Gửi trùng.
    _Mạng lag 47 lần. Bạn không cãi._
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_14 giờ. Họp đánh giá cuối tháng ở phòng họp tầng 2. Anh {hr} đứng cạnh máy chiếu, cầm một tập hồ sơ màu hồng. Hợp đồng của {idol_het_thoi} được bàn trước. Rồi tới mục chuyên cần._
{ not son_nghi_tu_15 && uy_tin >= 70:
    hr: Thưởng chuyên cần tháng này. Lần đầu tiên sau 3 năm có người nhận. Người đó là… *(nhìn tờ giấy, nhìn lại lần nữa)* …{thanh_xin_nghi}.
    _Cả phòng họp tưởng nghe nhầm. {hong_hot} dụi mắt. {chi_dai} vỗ bàn cười._
    ~ tien_cong(500000)
    ~ son_ngay_phep = son_ngay_phep + 1
- else:
    hr: {thanh_xin_nghi}. *(nhìn bạn rất lâu)* Giọng em nghe quen quen.
    _Cả phòng không hiểu câu đó. Chỉ có bạn hiểu. Hoặc bạn tưởng mình hiểu._
}
_Rồi anh {hr} mở tập hồ sơ màu hồng. "Về điều chỉnh nhân sự… Dòng một: {thuc_tap_sinh}. Dòng hai: {thanh_xin_nghi}."_
_Cả phòng quay sang bạn. Cái tên của bạn, đọc to, trong phòng họp. Lần này không phải để hỏi thăm bà ngoại._
{
- son_biet_so_604 && son_tu_thu_tuan:
    _Anh {hr} dừng lại. Nhìn bạn. Nhìn tờ giấy. Rồi gấp tập hồ sơ lại: "Danh sách này… phòng nhân sự xin đọc lại sau Đại Nhạc Hội." Không ai hỏi vì sao. Chỉ bạn biết số máy đuôi 604._
- qh_chi_dai >= 30:
    chi_dai: *(đứng dậy)* Ông dừng. Đêm mai mới có kết quả. Đọc danh sách hôm nay là đọc trước án.
    _Anh {hr} gấp tập hồ sơ lại. Thở ra. Không ai bị gạch tên. Hôm nay._
- else:
    hr: Hai trường hợp, hiệu lực sau 31/10 nếu chiến dịch không đạt. *(gấp lại)* Anh xin lỗi em.
    ~ cang_thang(15)
}
giam_doc: {thanh_xin_nghi}, mai Đại Nhạc Hội. Em là người giữ lịch. Em có gì muốn nói trước cả công ty không?
* [📝 Đặt lên bàn một lá đơn: "Đơn xin nghỉ việc. Lý do: đi hát."]
    ~ son_don_nghi_viec_that = true
    _Cả phòng im phăng phắc. Lần đầu tiên trong 31 lá đơn, lý do là thật._
    giam_doc: *(đọc, nhìn bạn)* Đi hát? Em… hát à?
    { son_tu_thu_tuan:
        hr: Hát hay lắm anh. Em xác nhận. Phòng nhân sự xác nhận.
    }
    giam_doc: Anh không ép… à. Lần này anh không ép thật. Em làm hết Đại Nhạc Hội đã, rồi tính.
    ~ son_tin(20)
* [📅 "Dạ, lịch mai em lo xong hết rồi ạ. Mọi người cứ tin em."]
    ~ uy_tin = uy_tin + 5
    giam_doc: Tốt.
* {son_ngay_phep <= -10 && not son_ky_cam_ket} [😶 Im lặng. Ký bản cam kết anh {hr} đưa: "Không nghỉ thêm ngày nào tới hết năm".]
    ~ son_ky_cam_ket = true
    _Bút ký. Một tờ giấy mỏng tang. Nặng hơn cả bộ áo choàng kim tuyến._
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_3010_dem_cuoi ===
# ngay:30 # gio:22:00 # noi:nha_ven_do
_Đêm cuối. Nhà vườn Ven Đô. Trên giường: bộ đồ kim tuyến. Trên bàn: cuốn lịch bìa hồng, mở trang 31/10._
_"19:30: ĐẠI NHẠC HỘI SIÊU NHÂN." Góc trang, bút chì, nhỏ xíu: "20:00 – S.K.T."_
{ not son_vao_chung_ket:
    _Dòng bút chì đó giờ không cần nữa. Bạn tẩy đi. Tẩy rất lâu._
    -> END
}
* {son_thai_biet} [📞 Gọi anh {quan_ly_idol}.]
    quan_ly_idol: {thanh_xin_nghi}. Anh vừa từ chối LL. Đừng hỏi vì sao. *(im lặng)* Mai em tính sao?
    thanh_xin_nghi: Em chưa biết anh. Em muốn cả hai.
    quan_ly_idol: Muốn cả hai thì phải có người giúp. Anh giúp.
    ~ qh("quan_ly_idol", 5)
* {son_moi_nguyen_khach_moi} [📞 Gọi anh {sieu_nhan_hong}.]
    sieu_nhan_hong: Đặc vụ! Mai anh đi khách mời rồi về Đại Nhạc Hội! Anh có xe hồng! Xe hồng chạy nhanh lắm! *(rồi nhỏ giọng lại)* …Mà kẹt xe thì xe nào cũng như nhau ha.
    ~ qh("sieu_nhan_hong", 5)
* [🎤 Hát một mình cho bà ngoại trong ảnh nghe.]
    ~ son_mo(5)
    ~ cang_thang(-10)
    _Bà cười trên tường. Bà vẫn khỏe re. Lần này bạn hát không để xin lỗi ai._
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_3110_sang ===
# ngay:31 # gio:10:00 # noi:san_khau_dem_hong # bat_buoc
_Thứ 7, 31/10. Sân khấu Đại Nhạc Hội Siêu Nhân đang dựng. Cả công ty hóa trang Halloween. {giam_doc} thử bộ "Ông Kẹ Ngân Hàng". {cho} đội nơ hồng, mặt cau có._
_Bạn đi một vòng sân khấu với cuốn lịch: xe đón 18:30, phim của {bien_kich} 19:30, video "16 năm" của {editor} 19:50, 20:00 màn hình lớn chiếu trực tiếp chung kết "Giọng Ca Ước Mơ" từ Đài Tivi Hóng, rồi Siêu Nhân Hồng lên sân khấu._
_Chung kết 20:00. Thí sinh số 27. Màn hình lớn ở đây sẽ chiếu chính bạn, nếu bạn có mặt ở bên kia._
{ son_vao_chung_ket:
    _Chị {chi_dai} đi ngang, bộ đàm bên hông, dừng lại trước mặt bạn._
    { son_hat_lua_trai || qh_chi_dai >= 30:
        chi_dai: Đi đi. Chị thấy em trên tivi bữa giờ. Bảy giờ chị cho xe chở em qua đài. Lịch ở đây, chị đứng.
        ~ qh("chi_dai", 5)
    - else:
        chi_dai: Tối nay em đứng đâu thì đứng cho chắc. Đừng để chị gọi bộ đàm mà không ai trả lời.
    }
}
thuc_tap_sinh: Dạ anh {thanh_xin_nghi}, em giúp được gì không ạ? Em rảnh cả ngày ạ!
* [🤝 "Anh {thuc_tap_sinh}, đi theo em cả ngày. Học thuộc cuốn lịch này giùm em."]
    thuc_tap_sinh: Dạ em học liền ạ! *(mở sổ, ghi chép như ôn thi đại học)*
    ~ qh("thuc_tap_sinh", 15)
* [😶 "Dạ không có gì đâu anh {thuc_tap_sinh}, em lo được."]
    thuc_tap_sinh: Dạ… dạ em ở gần đây, anh cần gì cứ gọi ạ.
    ~ qh("thuc_tap_sinh", 3)
- -> END

// ------------------------------------------------------------
=== thanh_xin_nghi_3110_1910 ===
# ngay:31 # gio:19:10 # noi:san_khau_dem_hong # bat_buoc
_19:10. Sân khấu Đại Nhạc Hội Siêu Nhân đang chỉnh đèn. Pháo giấy hồng xếp sẵn. Khán giả đổ về._
{ not son_vao_chung_ket:
    _Không có cuộc gọi nào từ đài. Không có sân khấu thứ hai. Chỉ có một sân khấu, và bạn là người giữ lịch._
    ~ son_chon_dem_31 = "o_lai"
    -> END
}
_Điện thoại bạn rung: "Sơn Kim Tuyến ơi, 50 phút nữa lên sóng, em đang ở đâu???"_
giam_doc: {thanh_xin_nghi}! Xe đón Siêu Nhân Hồng đâu? Lịch chạy chương trình đâu? Anh không ép, tùy em, nhưng em mà biến lúc này thì…
{ son_ky_cam_ket:
    _Trong túi áo bạn là bản cam kết "Không nghỉ thêm ngày nào tới hết năm". Chữ ký của bạn._
}
* [📅 Tắt điện thoại, cầm bộ đàm: "Dạ có em đây anh."]
    ~ son_chon_dem_31 = "o_lai"
    _Bạn tắt điện thoại. 20 giờ, màn hình lớn sẽ chiếu chung kết. Không có thí sinh số 27._
    -> END
* [🎤 Đưa bộ đàm và cuốn lịch cho {thuc_tap_sinh}: "Anh {thuc_tap_sinh}, em nhờ anh một lần thôi."]
    thuc_tap_sinh: Dạ em làm liền ạ!
    ~ son_chon_dem_31 = "di_thi"
    { qh_thuc_tap_sinh < 40:
        _{thuc_tap_sinh} cầm cuốn lịch ngược. Bạn không còn thời gian để chỉ lại._
    }
    _Bạn chạy ra cổng, bộ đồ kim tuyến gói trong túi nilon._
    -> END
* [🤧 Ho thật to: "Anh {giam_doc}… bà ngoại em… nhập viện…"]
    giam_doc: Bà ngoại? Đêm nay? *(nhìn bạn rất lâu)* …Đi đi.
    ~ son_ba_ngoai()
    ~ son_chon_dem_31 = "nghi_om"
    ~ son_xin_nghi()
    _Bạn chạy ra cổng. Sau lưng, {giam_doc} vẫn đứng nhìn theo, lâu hơn cần thiết._
    -> END
* [🛵 "Em chạy qua đài 30 phút rồi về liền anh!"]
    ~ son_chon_dem_31 = "ca_hai"
    _Bạn nhét bộ đàm vào túi quần, ôm bộ đồ kim tuyến, chạy ra đường gọi xe. 19 giờ 25. Đại Lộ Kẹt Xe đỏ rực đèn hậu._
    -> END
* {son_moi_nguyen_khach_moi && son_bao_giup && (son_thai_biet || qh_quan_ly_idol >= 30) && qh_sieu_nhan_hong >= 40} [🔒 "Sếp, em có cách cho Siêu Nhân Hồng lên sóng toàn quốc tối nay. Anh tin em một lần."]
    giam_doc: *(nhìn bạn, nhìn {quan_ly_idol}, nhìn {it} đang ôm cuộn cáp)* …Anh không ép. Anh tin.
    ~ son_chon_dem_31 = "noi_song"
    _{it} ôm cuộn cáp chạy về bàn kỹ thuật. Bạn nhảy lên xe ôm qua đài, {sieu_nhan_hong} ở lại sân khấu này. 20 giờ, hai sân khấu sẽ nối làm một._
    -> END
