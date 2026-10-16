// ============================================================
// CHƯƠNG 3: "TRONG BÓNG TỐI KHÔNG CẦN MŨ" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== sieu_nhan_hong_1310_doanh_nhan ===
# ngay:13 # gio:10:00 # noi:phong_giam_doc
_Ngày Doanh nhân Việt Nam. {giam_doc} ôm bó hoa tự tặng mình. Trên tường vừa treo tấm bằng "Doanh nhân của năm" của BTT Global._
sales: Anh {sieu_nhan_hong} ơi, chụp chung với sếp và tấm bằng đi! Đối tác chiến lược mà!
_Bạn nhìn kỹ tấm bằng. Con dấu là hình… cái bánh tráng. Không có mã số thuế._
* [🦸 Tạo dáng chụp chung, giơ ngón cái.]
    ~ follow(1000)
    ~ qh("giam_doc", 5)
    ~ qh("sales", 5)
    _Ảnh đăng lên. Có người bình luận: "Con dấu hình bánh tráng hả?". Bình luận đó có 2.000 lượt thích._
    ~ snh_meme(2000)
* [🙂 Nói nhỏ với {sales}: "Em ơi, cái dấu này… hình như là bánh tráng thiệt."]
    sales: *(cười rất tươi)* Anh tinh mắt ghê. Thôi anh đừng nói ai nha. Tin chị đi, chị lo được.
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", -3)
* [💬 Hỏi {thanh_ninh}: "Bài phát biểu 15 phút đó em viết bao lâu vậy?"]
    thanh_ninh: Cả đêm anh ạ. Mà anh {giam_doc} nghe có 3 phút là khóc. Anh nói chuẩn quá anh ơi… à, chưa ai nói gì.
    ~ qh("thanh_ninh", 5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1410_moc_200k ===
# ngay:14 # gio:17:00 # noi:tang_1 # bat_buoc
_Mốc 2: 200.000 người theo dõi. Ngày Hội Nông dân. {thanh_xin_nghi}, người dắt bạn đi gameshow ngày mai, xin nghỉ "về quê gặt lúa"._
{ nguoi_theo_doi >= 200000:
    _Màn hình hiện {nguoi_theo_doi}. Đạt. Bạn nhảy một vòng giữa tầng 1, va vào cây nước. Cả phòng cười._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    -> END
- else:
    _Màn hình hiện {nguoi_theo_doi}. Không đạt. Không ai nói gì. Không ai cần nói gì._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
_Bạn đi ra cổng. Không tạo dáng. Không lên xe. Đi bộ._
* [🆘 Đi giúp người cả ngày. Không camera, không ai biết.]
    ~ snh_giup_nguoi()
    ~ snh_giup_nguoi()
    ~ snh_giup_nguoi()
    ~ follow(-5000)
    _Bạn đẩy ba chiếc xe chết máy, dắt hai cụ qua đường, gỡ một con diều. Không ai quay. Người theo dõi tụt 5.000 vì không có bài mới._
    _Tối về, chân đau, mà lòng nhẹ hơn._
    ~ cang_thang(-15)
* [😶 Ngồi ở bậc thềm chòi bảo vệ.]
    bac_bao_ve: Uống trà không? *(rót sẵn)*
    ~ uong(25)
    ~ qh("bac_bao_ve", 5)
    _Bác không hỏi. Bạn không kể. Con chó nằm cách bạn 2 mét, lần đầu tiên không sủa._
    { co(xuc_xich):
        _Bạn lấy một cây xúc xích trong túi, đặt xuống đất, đẩy nhẹ về phía nó. Nó nhìn cây xúc xích, nhìn bạn, rồi ăn. Không sủa._
        ~ snh_cho_xuc_xich()
    }
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1410_che_con_so ===
# ngay:14 # gio:21:30 # noi:hem_69 # bat_buoc
_Tối. Quán Chè Bà Bảy. Bạn không mặc đồ. Mai lau bàn, ngẩng lên, nhận ra bạn từ xa. Từ hôm 6/10, cô nhìn bạn hơi lâu hơn một chút, rồi thôi._
mai: Siêu nhân tới. *(nói nhỏ, chỉ đủ hai người nghe)* Anh ăn chè gì?
* [Kể: "Hôm nay công ty anh đếm người theo dõi. {nguoi_theo_doi} người."]
    mai: *(múc chè, nghĩ một lúc)* {nguoi_theo_doi} người… nhiều hay ít vậy anh?
    sieu_nhan_hong: Dạ… ờm… cần một triệu.
    mai: Vậy còn thiếu. *(đặt ly chè xuống)* Mà ở đây em chỉ cần đếm một người thôi: người đang ngồi ăn chè. Đậu trắng nha.
    _Bạn bật cười. Lần đầu tiên trong tháng, có người không hỏi con số nào khác ngoài số ly chè._
    ~ snh_gan_mai(2)
    ~ cang_thang(-10)
* [Không kể gì. "Như mọi khi."]
    mai: Như mọi khi. *(múc chè đậu trắng, nhiều nước cốt dừa)*
    _Mai không hỏi. Bạn không kể. Bà Bảy coi tivi, cười một mình với một chương trình hài._
    ~ snh_gan_mai(1)
* [🦸 Tạo dáng nhỏ: "Siêu Nhân Hồng sắp có một triệu người theo dõi đó nha."]
    mai: Dạ, chúc mừng anh. *(rồi nhìn bạn, không cười)* Mà anh ăn chè gì?
    _Câu hỏi đó, vẫn câu đó. Không có thêm chữ nào vì bạn sắp nổi tiếng._
- ~ an(10)
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1510_mat_dien ===
# ngay:15 # gio:08:15 # noi:sanh_tang_tret # bat_buoc
_Ngày Thanh niên Việt Nam. Mất điện cả khu từ 8 giờ 05. Bạn tới cổng lúc 8 giờ 15, nghe tiếng la vọng ra từ thang máy._
giam_doc: *(vọng ra)* Bình tĩnh! Anh là giám đốc, anh rất bình tĩnh!
chi_dai: *(vọng ra)* Anh đứng xa em ra!
bac_bao_ve: Bác đang mở. Cái chìa khóa cứu hộ nó kẹt.
* [🦸 "Biến hình! Để Siêu Nhân Hồng!" *(cầm chìa khóa, cạy cửa thang máy)*]
    _Cửa mở được một nửa. {giam_doc} bò ra, mồ hôi như tắm. {chi_dai} bước ra, tóc không rối sợi nào._
    giam_doc: Cảm ơn em! Em là siêu nhân thật!
    ~ follow(2000)
    ~ qh("giam_doc", 10)
    ~ qh("chi_dai", 5)
    _{hong_hot} quay được. Clip "siêu nhân cứu sếp khỏi thang máy" lan khắp quận trước 10 giờ._
* [🙂 Đứng giữ đèn pin cho bác {bac_bao_ve}.]
    bac_bao_ve: Ừ. Cầm cao lên tí. Được rồi.
    ~ qh("bac_bao_ve", 8)
    _Cửa mở. Không ai quay. Bác vỗ vai bạn một cái. Vậy là đủ._
- _Thực tập sinh {thuc_tap_sinh} đi một vòng phát 5 cục sạc dự phòng loại đắt tiền: "Dạ em 30 tuổi, em vẫn là thanh niên ạ!"_
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1510_trang_47 ===
# ngay:15 # gio:15:30 # noi:pantry
_Pantry tối om. {ke_toan} ngồi một mình, đèn điện thoại chiếu vào tập giấy. Bạn đi ngang qua._
ke_toan: Anh {sieu_nhan_hong}. Anh ngồi đây một chút được không. Tôi hỏi anh một câu.
ke_toan: Anh có đọc trang 47 hợp đồng không?
* [🦸 "Dạ trang 47… là trang có hình hồng hả chị?"]
    ke_toan: *(thở dài)* Không có trang nào có hình hồng hết anh.
    ke_toan: Trang 47: nếu không tới một triệu người theo dõi và top 10 xu hướng, công ty hoàn anh gấp đôi. 10 tỷ. Công ty còn 2.
    -> sieu_nhan_hong_1510_trang_47_biet
* [🙂 Tháo mũ, ngồi xuống: "Dạ… chưa. Anh lật qua thôi. Có chuyện gì hả chị?"]
    ~ snh_thao_mu(false)
    ke_toan: *(nhìn mặt bạn trong ánh đèn điện thoại)* Anh… trẻ hơn tôi nghĩ.
    ke_toan: Trang 47: nếu thất bại, công ty hoàn anh gấp đôi. 10 tỷ. Công ty còn 2. Nghĩa là sập. Hai mươi mốt người mất việc.
    -> sieu_nhan_hong_1510_trang_47_biet

= sieu_nhan_hong_1510_trang_47_biet
~ snh_biet_trang_47 = true
~ phat_hien(trang_47)
_Bạn ngồi im. Bạn không bao giờ đòi 10 tỷ. Bạn không cần. Nhưng chữ ký là chữ ký._
_Bạn chợt nhớ hôm ký, bạn có viết vội một tờ giấy nhỏ, kẹp vào đâu đó trong tập hợp đồng, dính miếng bánh chuối chiên. Viết gì nhỉ? Kẹp ở trang nào? Bạn không nhớ._
* [🙂 "Chị ơi, anh hông đòi đâu. Anh viết giấy liền cho chị."]
    ke_toan: *(nhìn bạn rất lâu)* Anh tốt. Nhưng giấy phải có chữ ký giám đốc và người làm chứng. Mà ổng thì… thôi.
    ke_toan: Anh cứ cố tới một triệu. Đó là cách sạch nhất.
    ~ qh("ke_toan", 15)
    ~ snh_no(-3)
* [💸 "Hay anh trả luôn 10 tỷ cho công ty, coi như xong?"]
    ~ snh_ket(9)
    ke_toan: *(đặt bút xuống)* Anh nói 10 tỷ như nói 10 nghìn. Anh lấy tiền đâu ra?
    _Bạn im. {ke_toan} không hỏi nữa. Nhưng chị ghi một dòng vào sổ._
* [🦸 Đứng dậy: "Vậy thì mình lên một triệu! Hồng là thái độ!"]
    ke_toan: Ừ. Thái độ thì có rồi. Giờ cần con số.
    ~ qh("ke_toan", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1510_pantry_toi ===
# ngay:15 # gio:19:30 # noi:pantry # bat_buoc
_Vẫn mất điện. Pantry tối om. Ở góc, {idol_het_thoi} hát "Công Viên" rất khẽ, giọng mộc. Hay tới nổi da gà. Đèn đỏ nhỏ của một máy quay: {editor} đang quay lén._
_Bạn ngồi xuống một cái ghế trong góc tối nhất. Tháo mũ ra lau mồ hôi. Không ai thấy. Lần đầu tiên bạn tháo mũ giữa văn phòng._
~ snh_dang_mac_do = false
_Bên cạnh có tiếng ai đó thở dài._
chua_te_deadline: Ai đó? Ủa… anh {sieu_nhan_hong} hả? Không có mũ nghe giọng anh lạ ghê. Nhỏ nhỏ.
* [🙂 "Dạ… ờm… ừ. Anh đây. Em… sao chưa về?"]
    ~ snh_thao_mu(true)
    chua_te_deadline: Mất điện thì deadline cũng mất điện mà anh. Chill.
    ~ snh_tim(10)
    _Hai người ngồi trong bóng tối. Cậu ta kể về con mèo trong ảnh đại diện. Bạn kể về cái bàn 12 ghế. Cậu ta nghe, gật gù, rồi nói: "Bàn to vậy mà quay content ăn tối là hết ý." Bạn cười. Cậu ta nghe chuyện thật của bạn như nghe một ý tưởng hay._
* [🦸 Đội mũ vào lại thật nhanh: "Biến hình! Đừng sợ, có Siêu Nhân Hồng đây!"]
    chua_te_deadline: *(cười)* Diễn hoài hông mệt hả anh?
    ~ snh_dang_mac_do = true
* [🙂 "{chua_te_deadline} nè. Mấy món quà hồng… không phải PR đâu."]
    ~ snh_thao_mu(true)
    { snh_tim_hong < 40:
        chua_te_deadline: Em biết mà. Anh {quan_ly_idol} dặn anh nói vậy đúng hông?
        ~ snh_tim(5)
    - else:
        _{chua_te_deadline} im lặng một lúc._
        chua_te_deadline: Em biết mà anh. Anh tặng quà cho cả công ty, tặng em nhiều hơn vì em hay bị la nhất. Chill. Em coi anh như anh ruột.
        _"Anh ruột." Trong bóng tối, bạn gật đầu. Không ai thấy bạn gật đầu._
        ~ snh_tim(10)
    }
- _Ở góc kia, {idol_het_thoi} vẫn hát. "…thích ăn chuối chiên…". Bạn hát theo trong đầu. Sai lời._
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1610_truoc_gameshow ===
# ngay:16 # gio:13:00 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. {thanh_xin_nghi} dắt bạn vào cổng, giọng khỏe re, không còn chút gì của người "về quê gặt lúa" hai hôm trước._
thanh_xin_nghi: Anh ơi, đi lối này. Em… quen đường ở đây lắm. Đừng hỏi vì sao.
_Ở hành lang, {idol_het_thoi} đứng tựa tường, kính đen. Phần "Hit Một Thời" có bài "Công Viên". Không ai mời {idol_het_thoi} hát._
idol_het_thoi: Bài của anh. Người ta cho em hát bài của anh. Em biết anh là ai không?
* [🙂 "Anh hát bè cho em đi. Em hát sai lời chắc luôn."]
    idol_het_thoi: *(gỡ kính)* …Em nói thật?
    idol_het_thoi: Được. Anh đứng ở cánh gà. Em sai chỗ nào anh sửa chỗ đó.
    ~ qh("idol_het_thoi", 15)
* [🦸 "Em sẽ hát hay hơn bản gốc! Gét gô!"]
    idol_het_thoi: *(đeo kính lại)* Ừ. Để xem.
    ~ qh("idol_het_thoi", -10)
* [💬 Hỏi {thanh_xin_nghi}: "Sao em quen đường ở đài dữ vậy?"]
    thanh_xin_nghi: *(ho)* Em… em hay đi ngang. Anh đừng nói anh {hr} nha anh.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1610_gameshow ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
_14 giờ. Gameshow "Hồng Hay Không Hồng" bắt đầu quay, 8 giờ tối phát sóng. Đèn sân khấu chói lóa. Khán giả trường quay vỗ tay theo nhạc._
_Phòng chờ 5 phút trước giờ quay. Gương to, đèn vàng, một đĩa bánh chuối chiên mà ai đó ở công ty đã gửi tới tận đài. Điều khoản số 4._
thanh_xin_nghi: Anh ơi, quay một lần là xong, không quay lại đâu. Đừng chạy đi giúp ai giữa chừng nha. Em xin anh.
* [🙂 Tháo mũ, hít thở sâu trước gương.]
    _Trong gương là Nguyễn {sieu_nhan_hong}, mặt tái, tay run. Bạn nhìn cái mặt đó 10 giây. Rồi đội mũ lại. Siêu Nhân Hồng nhìn lại bạn, tự tin._
    ~ cang_thang(-10)
* [📱 Nhắn {chua_te_deadline}: "Em có coi hông?"]
    chua_te_deadline: *(tin nhắn)* Coi gì anh? À gameshow. 8 giờ tối mới phát mà. Chill. Hát đúng lời là được.
    ~ snh_tim(3)
* [🍌 Ăn hết đĩa bánh chuối chiên.]
    ~ an(20)
    thanh_xin_nghi: Anh ăn nhiều vậy lát vượt chướng ngại vật sao anh?!
- mc_tivi_hong: Xin chào quý vị và các bạn! Khách mời hôm nay: Siêu Nhân Hồng!
-> sieu_nhan_hong_mg_gameshow

// ------------------------------------------------------------
=== sieu_nhan_hong_1610_sau_gameshow ===
# ngay:16 # gio:22:00 # noi:pantry
_Công ty vẫn còn buffet Ngày Lương thực. Cả công ty vừa xem bạn trên tivi lúc 8 giờ. Bạn về tới, cả tầng 1 vỗ tay._
_Trên mạng, đoạn "bán… khoai chiên tại công viên" đã có bản remix "Khoai Chiên Thái Độ". Có người gọi bạn là "Siêu Nhân Gâu", vì cứ clip nào có bạn là có tiếng chó sủa._
{ snh_lo_mat >= 25:
    hong_hot: Anh ơi! Ảnh cái cằm của anh lên top xu hướng rồi! Người ta đoán anh là ca sĩ, diễn viên, có người đoán là chủ tiệm nail Lung Linh!
}
~ an(60)
{ not snh_thuong_gameshow:
    _Không có phong bì tiền thưởng. {quan_ly_idol} gọi hai cuộc liền, rồi thôi. {chua_te_deadline} đưa bạn một đĩa buffet đã gắp sẵn._
    chua_te_deadline: Không có 10 triệu thì có đĩa này. Em gắp toàn món ngon.
    ~ snh_tim(3)
    -> END
}
_Trên bàn là phong bì 10 triệu tiền thưởng của gameshow. {quan_ly_idol} gọi hai cuộc liền._
* [🤝 Quyên góp hết cho quỹ người già neo đơn ở Phường Tân Drama.]
    ~ follow(18000)
    ~ snh_no(-5)
    quan_ly_idol: Ok, chuyện này để anh lo. Anh đăng bài liền. Mà… em tốt thiệt.
    ~ qh("quan_ly_idol", 10)
* [👛 Giữ lại, bỏ vào Ví Cát-xê.]
    ~ snh_cat_xe(10000000)
    _Tiền này là tiền "làm ra". Lần đầu tiên bạn có một khoản lớn mà không ai cần hỏi tiền từ đâu._
    ~ cang_thang(-10)
* [🍢 Đãi cả công ty một bữa cá viên chiên ở Công viên Hồ Cá Mập.]
    ~ snh_cat_xe(-500000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
    idol_het_thoi: *(cầm que cá viên chiên, tự động hát)* Ngày xưa có đôi bạn thân…
    _Cả công ty hát theo. Đúng lời._
    ~ qh("idol_het_thoi", 5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1610_che_sau_gameshow ===
# ngay:16 # gio:23:15 # noi:hem_69 # bat_buoc
_23 giờ 15. Quán Chè Bà Bảy sắp dọn. Cái tivi nhỏ trên xe chè vẫn mở kênh Đài Tivi Hóng, đang chiếu lại gameshow lúc 8 giờ._
_Bạn ngồi xuống ghế nhựa thấp, không mặc đồ, tóc còn bết keo xịt của trường quay._
ba_bay: *(chỉ lên tivi)* Thằng siêu nhân này hát sai lời quá trời. Khoai chiên. Bà cười muốn rụng cái răng còn lại.
mai: *(liếc bạn, mím môi nhịn cười)* Dạ. Hát sai thiệt bà.
_Mai múc một ly chè, đặt trước mặt bạn. Không hỏi. Chè khoai môn._
mai: Khoai. *(rất nghiêm túc)* Cho đúng lời bài hát.
* [Bật cười tới mức suýt sặc.]
    _Bạn cười tới chảy nước mắt. Cả ngày hôm nay, ở đài, ở công ty, ai cũng cười bạn. Chỉ có ở đây, bạn cười cùng người ta._
    ~ snh_gan_mai(2)
* [Hỏi nhỏ: "Em… thấy anh trên tivi có kỳ hông?"]
    mai: Kỳ. *(rồi ngồi xuống ghế đối diện)* Mà ngoài đời anh còn kỳ hơn. Ăn chè khuya, thối 2 nghìn hông lấy, ngồi hoài hông về.
    mai: Em thấy cái người ngồi đây dễ coi hơn cái người trên tivi.
    ~ snh_gan_mai(2)
    ~ snh_no(-2)
* [Nhìn điện thoại, đọc bình luận về "Siêu Nhân Gâu".]
    _Bạn đọc tới bình luận thứ 200. Ly chè khoai môn nguội dần. Mai dọn ghế xung quanh, chừa lại cái ghế của bạn tới cuối cùng._
    ~ snh_gan_mai(1)
- ~ an(10)
-> END
