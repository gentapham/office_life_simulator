// ============================================================
// BÁC BẢO VỆ: BÌNH · CHƯƠNG 3: "ĐÊM KHÔNG ĐIỆN" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== bac_bao_ve_1310_giai_doanh_nhan ===
# ngay:13 # gio:08:45 # noi:cong_cong_ty
_Ngày Doanh nhân Việt Nam. 8 giờ 45. Một anh giao hàng đứng ở cổng, ôm một cái hộp to bọc giấy kim tuyến._
_"Giao cho anh {giam_doc}. Bằng khen Doanh nhân của năm. Tập đoàn BTT Global trao tặng. Chị {sales} dặn đưa vào lúc sếp có mặt."_
_Bác nhìn hộp. Góc hộp dán nhãn tiệm in ở Phố Mới, cách đây hai con đường. Tập đoàn toàn cầu mà in bằng khen ở Phố Mới._
* [🚪 Hỏi: "BTT Global trụ sở ở đâu hả cháu?"]
    _Anh giao hàng gãi đầu: "Dạ… em chỉ chạy từ tiệm in tới đây thôi chú. Chị {sales} trả tiền ship."_
    _Bác gật đầu. Ký nhận. Ghi vào sổ trực: "Bằng khen BTT. Tiệm in Phố Mới. {sales} trả ship."_
    ~ bv_bm(3)
    ~ phat_hien(btt_global_gia)
    ~ tien_cong(100000)
* [🙈 Ký nhận. Bác không thấy gì đâu.]
    _Sếp vui thì có sao. Mười phút sau, trên tầng 2 vọng xuống tiếng {giam_doc} xúc động: "Anh xin cảm ơn BTT Global!"._
    ~ bv_khong_thay_gi()
    ~ qh("sales", 3)
* [🐕 Để {cho} ngửi hộp trước.]
    cho: *(ngửi, rồi hắt xì ba cái)* Hắt xì! Grừ…
    _Mùi mực in còn mới. Mùi keo dán. Không có mùi tập đoàn toàn cầu nào cả._
    ~ bv_bm(2)
    ~ qh("cho", 2)
- _Chiều, {giam_doc} treo tấm bằng ngay sau ghế giám đốc. Bác nhìn lên qua vách kính. Chữ "Doanh nhân" bị in sai thành "Doanh nhận"._
_Bác uống ngụm trà. Doanh nhận. Cũng đúng với tháng này._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1410_do_dai ===
# ngay:14 # gio:07:00 # noi:choi_bao_ve # bat_buoc
_Mốc 2. Ngày Hội Nông dân. Sáng nay {thanh_xin_nghi} gửi tin nhắn xin nghỉ: "Dạ em về quê phụ gặt lúa ạ."_
_7 giờ sáng, một chiếc xe máy chạy ngang cổng. Người lái đội mũ bảo hiểm kín mít, nhưng cái áo khoác thì không kín: kim tuyến bạc, lấp lánh dưới nắng như cái đèn sân khấu. Hướng đi: Ven Đô, Đài Tivi Hóng._
_10 giờ. Bác uống trà. Bật radio. Vặn núm dò đài, tìm bản tin giao thông._
-> bac_bao_ve_mg_do_dai_mo_dau

// ------------------------------------------------------------
=== bac_bao_ve_1410_sau_do_dai ===
# ngay:14 # gio:11:30 # noi:choi_bao_ve
_Radio rè rè bắt được một chương trình trực tiếp: "Giọng Ca Ước Mơ, vòng 2. Thí sinh số 27…"_
_Một giọng hát cất lên. Trong, cao, run nhẹ ở đầu câu rồi vững dần. Giọng này bác nghe mỗi ngày qua cổng: "Dạ em chào bác, hôm qua em ốm ạ"._
{ nguoi_theo_doi < 200000:
    _Cùng lúc đó, trên tivi nhỏ chạy dòng chữ: "Siêu Nhân Hồng chưa đạt 200.000 người theo dõi". Xe hồng chạy ra cổng, {sieu_nhan_hong} vẫy tay: "Hôm nay con đi giúp người cả ngày nha bác!"_
}
* [📻 Vặn to lên. Nghe hết bài.]
    _Bài hát hết. MC đọc: "Thí sinh số 27 vào vòng trong!". Bác gật gù, như vừa xem cháu mình thi._
    ~ bv_biet_son_hat = true
    ~ phat_hien(son_thi_hat)
    ~ bv_bm(3)
    ~ bv_tam(5)
* [📒 Ghi sổ: "14/10. {thanh_xin_nghi} nghỉ gặt lúa. Lúa hát hay."]
    ~ bv_biet_son_hat = true
    ~ phat_hien(son_thi_hat)
    ~ bv_bm(3)
* [🙈 Vặn sang kênh thời sự. Chuyện của nó.]
    ~ bv_khong_thay_gi()
- _4 giờ chiều, {hr} đi ra cổng, hỏi: "Bác có thấy {thanh_xin_nghi} đi đâu sáng nay không ạ? Cậu ấy xin nghỉ gặt lúa."_
* [🙈 "Bác không thấy gì đâu."]
    hr: *(nhìn bác)* …Cháu hiểu rồi ạ.
    ~ bv_khong_thay_gi()
    ~ qh("thanh_xin_nghi", 5)
* [😐 "Lúa ở Ven Đô gặt tháng 10 à? Bác ở Ven Đô, bác không biết."]
    hr: *(cười)* Bác cũng biết đùa ạ.
    ~ qh("hr", 3)
    ~ qh("thanh_xin_nghi", -3)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_1510_thang_may ===
# ngay:15 # gio:08:05 # noi:thang_may # bat_buoc
_8 giờ 05. Cả tòa nhà tắt phụt. Quạt chòi ngừng quay. Radio vẫn chạy, vì radio chạy pin. Đèn pin vẫn sáng, vì đèn pin chạy pin._
_Bộ đàm bên hông rè rè: giọng {chi_dai}, bình tĩnh: "Bác {bac_bao_ve}, thang máy kẹt giữa tầng trệt với tầng 1. Có sếp ở trong. Bình tĩnh, hông gấp."_
* [🔧 Lấy tay quay cứu hộ trong tủ dụng cụ. Đi ngay.]
    _Cái tay quay nằm trong tủ từ 2014, chưa ai dùng trừ bác. Bác quay chậm, đều, như quay máy xay ngô. Thang nhích từng phân._
    -> mo_cua
* [🍵 Uống nốt chén trà đã. "Hông gấp" mà.]
    _Bác uống nốt chén trà. Rồi đi lấy tay quay. Mười phút sau mới tới. Bên trong, {giam_doc} đã kịp nói hết nỗi lòng với {chi_dai}._
    ~ bv_tam(3)
    -> mo_cua

= mo_cua
_Cửa thang hé ra. Đèn pin của bác chiếu vào. {giam_doc} ngồi bệt trên thùng dây điện, mặt tái. {chi_dai} đứng khoanh tay, mặt bình thường._
bac_bao_ve: Anh {giam_doc} ra trước. Cháu {chi_dai} ra sau, đưa bác cái thùng dây.
_{giam_doc} trèo ra, chỉnh lại cà vạt, nói nhỏ khi đi ngang bác: "Bác ơi… em vừa nói linh tinh trong ấy. Bác đừng… à mà bác không nghe thấy gì đâu nhỉ."_
* [🙈 "Bác không nghe thấy gì đâu."]
    giam_doc: *(thở ra)* Vâng. Cảm ơn bác.
    ~ bv_khong_thay_gi()
    ~ qh("giam_doc", 5)
* [🍵 "Trong thang máy tối thì người ta hay nói thật. Không sao đâu anh."]
    giam_doc: *(khựng lại)* …Vâng. Có lẽ thế.
    ~ qh("giam_doc", 8)
    ~ bv_lo_than(2)
- ~ qh("chi_dai", 3)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1510_mang_da_pantry ===
# ngay:15 # gio:14:00 # noi:pantry # bat_buoc
_2 giờ chiều. Bác xách hai thùng đá {it} mua về lên pantry tầng 1. Pantry tối, chỉ có ánh nến và ánh cửa sổ. Cả công ty ngồi bệt dưới sàn._
_Bác đặt thùng đá ở góc tủ lạnh. Góc tối nhất. Và nghe thấy tiếng thì thầm sau lưng tủ._
ke_toan: *(rất nhỏ)* …trang 47. Chữ cỡ 6. Sếp ký mà không đọc. Nếu tới hết 31/10 không đủ 1 triệu người theo dõi… công ty phải hoàn 10 tỷ.
chi_dai: *(im lặng rất lâu)* …Vậy thì không được thất bại.
_Bác đứng yên trong bóng tối. Mười tỷ. Đây là thứ G cần biết nhất. Hơn mọi lá thư ngân hàng cộng lại._
~ phat_hien(trang_47)
~ bv_bm(5)
_Ở góc bên kia tủ lạnh, có một bóng người khác cũng đang nín thở nghe. Đèn pin của bác lướt qua: đôi giày thể thao trắng của {ran_doc}._
* [🔦 Rọi đèn thẳng vào góc đó.]
    _{ran_doc} giật mình, đứng bật dậy, cười gượng: "Dạ con… con đi tìm đá ạ."_
    bac_bao_ve: Đá đây. Cầm lấy một thùng.
    _{ran_doc} cầm thùng đá đi ra. Không nhìn bác. Bác biết cậu ta đã nghe hết._
    ~ qh("ran_doc", -5)
    ~ bv_bm(2)
* [🙈 Tắt đèn pin. Lùi ra. Bác không thấy gì đâu.]
    _Bác đi ra, để lại hai thùng đá và hai người đang nghe chuyện không phải của mình. Một trong hai người là bác._
    ~ bv_khong_thay_gi()
* [😶 Hắng giọng một tiếng thật to.]
    _{ke_toan} và {chi_dai} giật mình, quay lại, thấy bác. Ở góc bên kia, tiếng bước chân rón rén chạy đi._
    ke_toan: Bác… bác nghe hết rồi ạ?
    bac_bao_ve: Bác mang đá lên thôi. Đá này ăn được, cháu ạ.
    ~ qh("ke_toan", 5)
    ~ qh("chi_dai", 3)
- ~ bv_tam(-8)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1510_quanh_choi ===
# ngay:15 # gio:16:30 # noi:choi_bao_ve # bat_buoc
_4 giờ 30. Tầng 1 nóng không chịu nổi. Cả công ty kéo xuống cổng, ngồi quanh chòi bảo vệ. Thứ duy nhất còn chạy: radio pin của bác và ấm trà đá._
hong_hot: Bác ơi, mình chơi trò mỗi người kể một chuyện đi bác! Chuyện gì cũng được!
_Bác rót trà. Ly nào cũng đầy. Người ta tự kể, không cần ai hỏi._
_{sales} kể chuyện bị đối tác cho leo cây ba lần. {editor} kể chuyện thức 5 đêm liền. {quan_ly_idol} kể chuyện đi hát đám cưới bị cô dâu xin chữ ký nhầm người. {con_ong_chau_cha} kể chuyện… à không, {con_ong_chau_cha} chỉ nghe._
~ bv_bm(10)
~ bv_so_ly_tra = bv_so_ly_tra + 15
~ tien_cong(45000)
hong_hot: Tới bác! Bác kể một chuyện đi bác!
* [🍵 "Năm 2010, công ty có mỗi một phòng 20 mét vuông. Cái bàn là cái thùng mì."]
    _Cả đám im lặng nghe. {giam_doc} ngồi ở rìa, cười một mình. Bác kể tới đoạn "có một người bạn của bác thuê căn phòng ấy" thì dừng lại._
    hong_hot: Người bạn của bác là ai vậy bác?
    bac_bao_ve: Một người ở xa.
    ~ bv_lo_than(10)
    ~ bv_qh_ca_cong_ty(3)
* [🐕 "Năm 2020, bác nhặt được con {cho} dưới mưa, ở đầu hẻm. Nó bé bằng chiếc dép."]
    cho: *(nghe tên mình, ngóc đầu)* Gâu?
    _Cả đám "ồ" lên. {thuc_tap_sinh} xoa đầu {cho}. Câu chuyện không có bí mật nào, chỉ có một con chó ướt và một ông bảo vệ cũng ướt._
    ~ bv_qh_ca_cong_ty(2)
    ~ qh("cho", 5)
* [🙈 "Bác không có chuyện gì. Bác chỉ thấy thôi."]
    hong_hot: Thấy gì bác?
    bac_bao_ve: Thấy hết. Nhưng bác không nói.
    _Cả đám cười rộ. Một vài người cười hơi gượng._
    ~ bv_khong_thay_gi()
    ~ bv_tam(5)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_1510_den_pin_toi ===
# ngay:15 # gio:19:00 # noi:tang_1
_7 giờ tối. Vẫn chưa có điện. Bác đi tuần một vòng bằng đèn pin, như mọi đêm. Nhưng đêm nay cả tòa nhà còn người._
_Ở pantry, trong bóng tối, có ai đó đang hát: "Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên…". Giọng khàn, chậm. {idol_het_thoi}. Ở góc, {editor} giơ điện thoại quay._
* [🔦 Tắt đèn pin. Đứng ở cửa nghe hết bài.]
    _Bác đứng im. Năm 2015 bác nghe bài này cả ngày trên radio. Năm 2026 bác nghe nó trong bóng tối. Hay hơn._
    ~ bv_tam(8)
    ~ qh("idol_het_thoi", 3)
* [🔦 Rọi đèn vào góc của {editor}: "Quay thì quay. Đừng đăng lung tung."]
    editor: *(giật mình)* Dạ… con quay để giữ thôi bác.
    ~ qh("editor", 3)
    ~ bv_bm(1)
- _Ở cuối hành lang, cạnh cửa sổ: {sieu_nhan_hong} ngồi bệt, chiếc mũ để trên đùi. Mặt thật. Bên cạnh là {chua_te_deadline}, ngủ gật, đầu tựa vào tường._
_{sieu_nhan_hong} đang nói gì đó rất nhỏ với một người đang ngủ._
_Dưới chân cầu thang có tiếng bước chân đi lên, có cả ánh flash điện thoại._
* [🔦 Rọi đèn xuống cầu thang: "Ai đấy? Mất điện, đi lại cẩn thận."]
    _Ánh flash tắt. Tiếng bước chân lùi xuống. Khi bác quay lại, {sieu_nhan_hong} đã đội mũ, giơ tay vẫy, ra hiệu "cảm ơn"._
    ~ qh("sieu_nhan_hong", 8)
    ~ bv_chan_paparazzi = bv_chan_paparazzi + 1
* [🙈 Quay đi. Đi tuần tầng khác.]
    _Sáng hôm sau, một ảnh mờ trên trang tin: "Siêu Nhân Hồng tháo mũ trong bóng tối?". Không ai nhận ra mặt. Nhưng người ta bắt đầu tò mò._
    ~ bv_khong_thay_gi()
    ~ follow(8000)
- _21 giờ. Có điện lại. Bác về chòi, ngủ đúng giờ. Đêm đó bác mơ thấy căn phòng 20 mét vuông, và tiếng ai đó hát "Công Viên"._
~ nghi(20)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1610_tuat_dau_roi ===
# ngay:16 # gio:06:30 # noi:choi_bao_ve # bat_buoc
_6 giờ 30. Bác mở cổng. Ổ của {cho} trống. Bát nước còn nguyên. Không có tiếng sủa chào buổi sáng._
_Bác tìm khắp bãi xe. Gầm cầu thang. Nóc chòi. Không thấy. Chỉ thấy ba chiếc xe tải đạo cụ đi gameshow đang xếp hàng ở cổng._
_Thùng đạo cụ số 7 trên xe số 2 phát ra một tiếng: "…Ẳng."_
* [📻 Bộ đàm cho {chi_dai}: "Cháu {chi_dai}. Thùng số 7. Có {cho}."]
    _Bộ đàm im 3 giây. Rồi giọng {chi_dai}: "Dạ. Con biết rồi bác. Để con xử."_
    ~ qh("chi_dai", 3)
    { RANDOM(1, 2) == 1:
        ~ bv_tuat_di_gameshow = true
    }
* [🐕 Đi tới, gõ vào thùng: "{cho}. Ra."]
    _Thùng im lặng. Rồi một tiếng gâu rất nhỏ, như nói "không". {cho} ôm chiếc găng tay hồng trong đó, quyết đi gameshow bằng được._
    ~ qh("cho", -2)
    ~ bv_tuat_di_gameshow = true
* [🙈 Kệ nó. Cho nó đi chơi một hôm.]
    _Bác về chòi, rót trà. Chòi vắng {cho} một ngày. Lạ. Ấm trà nguội nhanh hơn._
    ~ bv_khong_thay_gi()
    ~ bv_tam(-3)
    ~ bv_tuat_di_gameshow = true
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_1610_tivi_trong_choi ===
# ngay:16 # gio:14:00 # noi:choi_bao_ve # bat_buoc
_2 giờ chiều. Gameshow "Hồng Hay Không Hồng" phát trực tiếp trên Đài Tivi Hóng. Bác ngồi trước cái tivi 14 inch trong chòi. Ăng-ten phải xoay ba lần mới rõ hình._
_Phần "Hit Một Thời". {sieu_nhan_hong} cầm micro hát "Công Viên": "…thích ăn… KHOAI chiên…"._
_Bác nhíu mày. Sai lời rồi. Rồi từ trong cánh gà vang lên một giọng hát khác, đúng lời, khàn khàn quen thuộc: "…thích ăn CHUỐI chiên…"._
* [📺 Vặn to âm lượng hết cỡ.]
    _Cả bãi xe nghe thấy. Anh shipper Tèo dừng xe ở cổng, đứng xem ké. Hai người, một già một trẻ, cùng gật gù theo điệp khúc._
    ~ bv_tam(5)
    ~ qh("idol_het_thoi", 3)
* [📞 Gọi cho {idol_het_thoi} ngay sau khi chương trình hết: "Hát hay."]
    _Chuông đổ một hồi. {idol_het_thoi} nghe máy, giọng còn run: "Bác… bác xem hả bác?". "Ừ. Hát hay." Tút tút._
    ~ qh("idol_het_thoi", 10)
- { bv_tuat_di_gameshow:
    _Cuối chương trình, máy quay số 3 lia vào cánh gà: {cho} đứng đó, ngậm găng tay hồng. Khán giả trường quay vỗ tay. Bác vỗ tay một mình trong chòi._
}
_Trên tivi, khán giả đứng dậy. Bác ngồi yên, uống ngụm trà. Đôi khi một bài hát cũ còn hay hơn khi người ta hát sai lời._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_1610_hoi_am_2 ===
# ngay:16 # gio:20:30 # noi:choi_bao_ve
{ bv_so_thu < 2:
    _Hộp thư trống. Bác ngồi nhìn cái hộp thư một lúc lâu, rồi tắt đèn._
    ~ bv_tam(-5)
    -> END
}
_Hồi âm thứ hai của G. Kèm một hộp chè Thái Nguyên, gói giấy báo cẩn thận._
_"{bac_bao_ve}. Chè quê. Anh pha cho đặc, uống một mình thì phí, mời ai đó uống cùng."_
{ bv_ke_tot_thang:
    _"Anh nói {giam_doc} sợ làm tôi thất vọng. Anh bảo nó: thất vọng là chuyện của tôi, không phải chuyện của nó. Nó cứ làm cho tử tế."_
    ~ bv_g(2)
}
_"Còn một chuyện. Anh hay nhìn mặt người ta mà đoán. Nhìn giày ấy. Đôi giày nói thật hơn cái miệng. G."_
~ bv_co_che_thai = true
~ bv_g_khuyen_giay = true
* [🍵 Pha ngay một ấm chè Thái Nguyên. Mời {cho} ngửi.]
    cho: *(ngửi, hắt xì)* Hắt xì!
    _Bác cười. Lâu lắm mới uống chè quê. Đặc, chát, rồi ngọt hậu._
    ~ bv_tam(10)
* [📒 Ghi lời dặn của G vào trang đầu sổ trực: "Nhìn giày."]
    ~ bv_tam(5)
    ~ bv_bm(1)
- -> END
