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
    ~ follow(3000)
    ~ qh("giam_doc", 5)
    ~ qh("sales", 5)
    _Ảnh đăng lên. Có người bình luận: "Con dấu hình bánh tráng hả?". Bình luận đó có 2.000 lượt thích._
    ~ snh_meme(5000)
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
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1510_mat_dien ===
# ngay:15 # gio:09:00 # noi:sanh_tang_tret # bat_buoc
_Ngày Thanh niên Việt Nam. Mất điện cả khu. Bạn tới cổng lúc 9:00, nghe tiếng la trong thang máy từ hồi 8:05._
giam_doc: *(vọng ra)* Bình tĩnh! Anh là giám đốc, anh rất bình tĩnh!
chi_dai: *(vọng ra)* Anh đứng xa em ra!
bac_bao_ve: Bác đang mở. Cái chìa khóa cứu hộ nó kẹt.
* [🦸 "Biến hình! Để Siêu Nhân Hồng!" *(cầm chìa khóa, cạy cửa thang máy)*]
    _Cửa mở được một nửa. {giam_doc} bò ra, mồ hôi như tắm. {chi_dai} bước ra, tóc không rối sợi nào._
    giam_doc: Cảm ơn em! Em là siêu nhân thật!
    ~ follow(5000)
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
* [🙂 "Chị ơi, anh hông đòi đâu. Anh viết giấy liền cho chị."]
    ke_toan: *(nhìn bạn rất lâu)* Anh tốt. Nhưng giấy phải có chữ ký giám đốc và người làm chứng. Mà ổng thì… thôi.
    ke_toan: Anh cứ cố tới một triệu. Đó là cách sạch nhất.
    ~ qh("ke_toan", 15)
    ~ snh_no(-3)
* [💸 "Hay anh trả luôn 10 tỷ cho công ty, coi như xong?"]
    ~ snh_ket(15)
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
    _Hai người ngồi trong bóng tối. Cậu ta kể về con mèo trong ảnh đại diện. Bạn kể về cái bàn 12 ghế. Lần đầu tiên bạn kể cho ai nghe._
* [🦸 Đội mũ vào lại thật nhanh: "Biến hình! Đừng sợ, có Siêu Nhân Hồng đây!"]
    chua_te_deadline: *(cười)* Diễn hoài hông mệt hả anh?
    ~ snh_dang_mac_do = true
* [🙂 "{chua_te_deadline} nè. Mấy món quà hồng… không phải PR đâu."]
    ~ snh_thao_mu(true)
    { snh_tim_hong < 40:
        chua_te_deadline: Em biết mà. Anh {quan_ly_idol} dặn anh nói vậy đúng hông?
        ~ snh_tim(5)
    - else:
        _{chua_te_deadline} im lặng rất lâu. Lâu tới mức bạn tưởng cậu ta ngủ rồi._
        chua_te_deadline: …Đèn có lại thì nói lại câu đó coi.
        ~ snh_tim(20)
    }
* {co(usb_khong_nhan)} [🔒 Đưa cho {chua_te_deadline} cái USB tìm được trong kho của {cho}.]
    ~ snh_thao_mu(true)
    ~ mat(usb_khong_nhan)
    ~ phat_hien(usb_cua_vu)
    chua_te_deadline: *(cầm USB, ngửi)* Mùi cà phê sữa đá… Trời đất… file gốc! Anh lấy ở đâu ra vậy?
    ~ snh_tim(30)
    ~ snh_nguoi_duy_nhat_biet = true
    chua_te_deadline: Anh là người duy nhất biết em làm mất cái này. Đừng nói ai nha. Em… em nợ anh.
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
# ngay:16 # gio:19:00 # noi:dai_tivi_hong # bat_buoc
_Gameshow "Hồng Hay Không Hồng". Đèn sân khấu chói lóa. Khán giả trường quay vỗ tay theo nhạc._
_Phòng chờ 5 phút trước giờ lên sóng. Gương to, đèn vàng, một đĩa bánh chuối chiên mà ai đó ở công ty đã gửi tới tận đài. Điều khoản số 4._
thanh_xin_nghi: Anh ơi, lên sóng trực tiếp đó. Đừng chạy đi giúp ai giữa chừng nha. Em xin anh.
* [🙂 Tháo mũ, hít thở sâu trước gương.]
    _Trong gương là Nguyễn {sieu_nhan_hong}, mặt tái, tay run. Bạn nhìn cái mặt đó 10 giây. Rồi đội mũ lại. Siêu Nhân Hồng nhìn lại bạn, tự tin._
    ~ cang_thang(-10)
* [📱 Nhắn {chua_te_deadline}: "Em có coi hông?"]
    chua_te_deadline: *(tin nhắn)* Coi gì anh? À gameshow. Em đang ở quán bida, tivi có chiếu. Chill. Hát đúng lời là được.
    ~ snh_tim(3)
* [🍌 Ăn hết đĩa bánh chuối chiên.]
    ~ an(20)
    thanh_xin_nghi: Anh ăn nhiều vậy lát vượt chướng ngại vật sao anh?!
- mc_tivi_hong: Xin chào quý vị và các bạn! Khách mời hôm nay: Siêu Nhân Hồng!
-> sieu_nhan_hong_mg_gameshow

// ------------------------------------------------------------
=== sieu_nhan_hong_1610_sau_gameshow ===
# ngay:16 # gio:22:00 # noi:pantry
_Công ty vẫn còn buffet Ngày Lương thực. Cả công ty vừa xem bạn trên tivi. Bạn về tới, cả tầng 1 vỗ tay._
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
    ~ follow(40000)
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
