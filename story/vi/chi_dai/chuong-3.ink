// ============================================================
// CHỊ ĐẠI: HƯƠNG · CHƯƠNG 3: "PANTRY KHÔNG ĐÈN" (15/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== chi_dai_1510_ket_thang_may ===
# ngay:15 # gio:08:05 # noi:thang_may # bat_buoc
_8 giờ 05. Bạn bước vào thang máy, tay ôm thùng dây điện. {giam_doc} chạy theo, chen vào phút chót, tay cầm ly cà phê._
giam_doc: Ơ, may quá! Chào em Hương. Hôm nay em đi sớm nhỉ.
_Cửa đóng. Thang đi được nửa tầng. Rồi đèn tắt. Rồi mọi thứ im lặng. Cả tòa nhà mất điện._
giam_doc: Ơ… ơ? Ơ thôi chết. Hương ơi… em còn đấy không?
* [📻 Bật bộ đàm: "Bác Bình, thang máy kẹt giữa tầng trệt với tầng 1. Có sếp ở trong. Bình tĩnh, hông gấp."]
    _Bộ đàm rè rè rồi có tiếng bác: "Ừ. Bác biết rồi. Đợi bác lấy cái tay quay."_
    giam_doc: Bộ đàm à? Em lúc nào cũng mang à?
    chi_dai: Lúc nào cũng mang. Kể cả đi đám cưới.
    ~ cd_uy(5)
* [😶 Ngồi xuống thùng dây điện. Đợi.]
    _Trong bóng tối, bạn nghe tiếng {giam_doc} thở nhanh dần. Người lớn mà sợ chỗ hẹp._
    ~ cd_nk(3)
* [🗣️ "Sếp đừng có đạp cửa. Thang này cũ hơn em."]
    giam_doc: Anh… anh có đạp đâu. Anh "check" thôi.
    ~ cd_so_lan_quat = cd_so_lan_quat + 1
- _Mười phút. Mười lăm phút. Trong bóng tối, giọng {giam_doc} nhỏ dần, rồi thành một giọng bạn chưa từng nghe._
giam_doc: Hương này. Em làm ở đây 8 năm rồi nhỉ. Em có bao giờ nghĩ công ty này… không còn không?
* [😇 "Có. Năm nào em cũng nghĩ. Mà năm nào nó cũng còn."]
    giam_doc: *(cười khẽ)* Ừ. Năm nào cũng còn.
    _Anh im lặng. Rồi nói rất nhỏ: "Năm nay anh không chắc lắm."_
    ~ qh("giam_doc", 8)
* [💬 "Sếp nói thẳng đi. Có chuyện gì?"]
    giam_doc: Không… không có gì. Thang máy tối quá nên anh nói linh tinh thôi. Em quên đi nhé.
    _Bạn không quên. Bạn ghi nhớ._
    ~ qh("giam_doc", 3)
* [🦁 "Còn em thì còn. Sếp lo cho sếp đi."]
    giam_doc: Em nói câu này giống… giống một người anh quen hồi xưa.
    chi_dai: Ai?
    giam_doc: Thôi. Người ở xa rồi.
    ~ qh("giam_doc", 5)
    ~ cd_uy(3)
- _Cửa thang máy bị cạy ra. Ánh sáng đèn pin. Bác Bình đứng ở khe cửa, cầm cái tay quay, mặt không cảm xúc._
bac_bao_ve: Anh Thắng ra trước. Cháu Hương ra sau, đưa bác cái thùng dây.
_{giam_doc} trèo ra, chỉnh lại cà vạt, rồi lại là {giam_doc} của mọi ngày: "Okay cả nhà! Hôm nay mình làm việc "offline" nhé!"_
-> END

// ------------------------------------------------------------
=== chi_dai_1510_bo_dam_mat_dien ===
# ngay:15 # gio:10:00 # noi:tang_1 # bat_buoc
_Mất điện cả ngày. Tầng 1 nóng như lò bánh mì. Máy tính chết, wifi chết, máy lạnh chết. Group Zalo-lô sống, nhưng ai cũng tiếc pin._
_Phòng "Sáng Tạo" thắp nến. {truong_phong} đang họp. Về chủ đề: "Làm thế nào để họp khi mất điện"._
_{thuc_tap_sinh} vừa lôi từ trong cặp ra 5 cục sạc dự phòng. Cả tầng nhìn {thuc_tap_sinh} như nhìn người tiền sử mang lửa tới._
* [📻 Phát bộ đàm cho 5 người, chia việc: đá, nến, quạt tay, nước, giữ cửa sổ.]
    -> chia_viec
* [😶 Ngồi xuống, cởi giày, quạt bằng bìa hồ sơ. Ngày này không ai làm gì được.]
    _Mọi người ngồi nhìn nhau. Mồ hôi chảy. Không ai biết bắt đầu từ đâu. Hai tiếng trôi qua trong ngột ngạt._
    ~ cd_met(10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 3
    -> END

= chia_viec
chi_dai: {thuc_tap_sinh}, sạc dự phòng chia cho người cần gọi điện nhất. {it}, đi mua đá. {hong_hot}, kiếm quạt tay. {con_ong_chau_cha}, xe em to, chở đá về.
con_ong_chau_cha: Ủa sao không gọi ship?
chi_dai: Ship đang kẹt ở cổng với Tuất.
* [🦁 "{truong_phong}! Thổi nến ra đây. Họp sau. Bây giờ đi lấy nước."]
    truong_phong: Ơ… nhưng đây là cuộc họp "khẩn cấp" về tình hình mất điện mà.
    chi_dai: Tình hình mất điện là: mất điện. Hết họp. Đi.
    _{truong_phong} thổi nến. Cả phòng họp ùa ra. Lần đầu tiên trong năm, một cuộc họp kết thúc vì có việc thật để làm._
    ~ cd_uy(8)
    ~ qh("truong_phong", -5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [🤝 Để {truong_phong} họp tiếp, nhưng mượn hết người ngồi hàng sau.]
    truong_phong: Ờ… cứ mượn đi. Họp với 3 người cũng được.
    ~ cd_uy(4)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- _Nửa tiếng sau: hai thùng đá, một bao nến, 14 cái quạt nan mượn của Cô Năm cơm tấm. Mọi người làm việc nhóm mà không cần một slide nào._
_{ke_toan} đi ngang, nhìn bạn, gật đầu một cái. Cái gật đầu nặng hơn mọi lời khen._
~ qh("ke_toan", 3)
~ cd_td(3)
~ uong(30)
-> END

// ------------------------------------------------------------
=== chi_dai_1510_trang_47 ===
# ngay:15 # gio:14:00 # noi:pantry # bat_buoc
_Pantry. Chỗ mát nhất tầng 1 vì có cửa sổ. Cả công ty ngồi bệt dưới sàn, kể chuyện, ăn đá bào._
_{ke_toan} kéo tay áo bạn ra góc tủ lạnh. Góc tối nhất. Bạn chưa thấy bạn mình mặt trắng như vậy bao giờ._
ke_toan: Bà… tui nói chuyện này, bà nghe thôi. Trang 47 hợp đồng. Chữ cỡ 6. Sếp ký mà không đọc.
ke_toan: Nếu tới hết 31/10 mà Siêu Nhân Hồng không đủ 1 triệu người theo dõi, cộng top 10 xu hướng… công ty phải hoàn 10 tỷ. Gấp đôi.
ke_toan: Quỹ còn 2 tỷ. Tức là phá sản. Tức là 22 người mất việc.
_Bạn im lặng. Một phút. Ở đầu pantry, {hong_hot} đang kể chuyện ma. Mọi người cười._
~ phat_hien(trang_47)
* [🦁 "Vậy thì không được thất bại."]
    ke_toan: *(nhìn bạn, mắt đỏ hoe)* Tui biết bà sẽ nói vậy. Vì vậy tui mới nói bà.
    ~ qh("ke_toan", 10)
    ~ cd_uy(5)
* [💬 "Còn đường nào khác hông? Đọc kỹ chưa? Có phụ lục gì hông?"]
    ke_toan: Tui đọc 11 lần rồi. Có một chỗ… sau trang 47 có cái gì đó dính dính, giống miếng bánh chuối chiên. Tui chưa dám gỡ ra.
    chi_dai: Bánh chuối chiên?
    ke_toan: Thôi. Chắc tui mệt quá rồi.
    ~ qh("ke_toan", 8)
* [🔥 Đứng phắt dậy: "Để tui lên hỏi ổng!"]
    ke_toan: *(kéo bạn ngồi xuống)* Bà ngồi xuống. Đây là bí mật. Bà lên đó là cả công ty biết, cả công ty hoảng.
    _Bạn ngồi xuống. Nắm tay đặt trên đầu gối, run nhẹ._
    ~ cd_nk(20)
- _Bạn nhìn quanh pantry. 20 người, mồ hôi nhễ nhại, cười đùa với nhau dưới ánh nến. Không ai biết._
_Ở góc tối sau tủ lạnh, có tiếng ai đó nín thở._
* [🕵️ Đứng dậy, soi đèn pin vào góc tối.]
    { cd_de_y_ran_doc:
        _Ánh đèn quét qua một mũi giày. Rồi mũi giày rụt lại. Lúc bạn bước tới, góc đó trống trơn. Nhưng mùi nước xả vải thì quen: mùi áo {ran_doc}._
        chi_dai: *(nói vọng vào bóng tối)* Ai nghe thì nghe cho hết. Nghe xong thì im.
        ~ cd_uy(3)
    - else:
        _Góc tối trống trơn. Chỉ có cái thùng carton và một vết nước. Chắc tại bạn đa nghi._
    }
* [😶 Kệ. Mất điện thì đâu đâu cũng có tiếng thở.]
    _Bạn không biết rằng, từ chiều nay, câu chuyện trang 47 không còn là bí mật của hai người._
- ~ cd_met(10)
-> END

// ------------------------------------------------------------
=== chi_dai_1510_pantry_toi ===
# ngay:15 # gio:18:30 # noi:pantry
_Trời tối hẳn. Vẫn chưa có điện. Pantry chỉ còn vài ngọn nến._
_Trong bóng tối, có ai đó cất giọng hát, khàn khàn, chậm rãi: "Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên…"_
_Là {idol_het_thoi}. Không kính đen. Không micro. Không "fan anh đông lắm em". Chỉ là một người hát._
_Ở góc pantry, ánh đèn đỏ nhỏ xíu của một cái điện thoại: {editor} đang quay._
* [🤫 Ra hiệu cho cả pantry im lặng. Để anh hát hết bài.]
    _Hai mươi người ngồi im. Bài hát hết. Không ai vỗ tay ngay. Rồi {quan_ly_idol} vỗ tay trước, rất khẽ._
    ~ cd_uy(3)
    ~ qh("idol_het_thoi", 8)
    ~ qh("editor", 5)
* [🛡️ Đi tới chỗ {editor}: "Quay thì giữ cho kỹ. Đừng để ai đăng lung tung."]
    editor: *(gật đầu)* Em không đăng. Em quay để… để giữ thôi.
    ~ qh("editor", 8)
* [🎤 Hát theo câu điệp khúc, giọng chị đại.]
    _Cả pantry hát theo. Lạc nhịp. Lạc tông. {idol_het_thoi} cười, lần đầu tiên sau nhiều năm, cười thật._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ qh("idol_het_thoi", 5)
    ~ cd_nk(-10)
- _Bạn ra hành lang hít thở. Ở cuối hành lang, cạnh cửa sổ, có hai bóng người._
_{sieu_nhan_hong} đang cầm chiếc mũ hồng trên tay. Mặt thật. Ngồi cạnh {chua_te_deadline}, nói gì đó rất nhỏ. {chua_te_deadline} đang ngủ gật._
_Cầu thang phía dưới có tiếng bước chân. Ai đó đang đi lên, tay cầm điện thoại sáng đèn flash._
* [🛡️ Đứng chắn đầu cầu thang. Không ai đi qua đây lúc này.]
    _Bạn đứng đó 5 phút, như tượng. Người đi lên nhìn bạn, quay xuống. Khi bạn quay lại, {sieu_nhan_hong} đã đội mũ, vẫy tay cảm ơn._
    sieu_nhan_hong: Chị Đại… chị không thấy gì hết, đúng hông?
    chi_dai: Tui thấy. Mà tui không nói.
    ~ qh("sieu_nhan_hong", 15)
    ~ cd_paparazzi_bi_duoi = true
* [😶 Quay vào pantry. Chuyện của người ta.]
    _Sáng mai, một tấm ảnh mờ "Siêu Nhân Hồng tháo mũ trong bóng tối?" xuất hiện trên một trang tin lá cải. Mặt mờ, không ai nhận ra. Nhưng người ta bắt đầu tò mò._
    ~ follow(8000)
- -> END

// ------------------------------------------------------------
=== chi_dai_1610_tuat_trong_thung_xe ===
# ngay:16 # gio:07:00 # noi:bai_xe
_Gameshow "Hồng Hay Không Hồng" ở Đài Tivi Hóng, Ven Đô. Ghi hình 14:00. Bạn điều phối 3 xe đạo cụ, 1 nghệ sĩ, 1 quản lý, và 6 thùng bánh chuối chiên._
_Xe số 2 đã xếp xong. Bạn đóng cửa thùng xe thì nghe tiếng "Gâu" vọng ra từ… thùng đạo cụ số 7._
_Bạn mở nắp. {cho} nằm trong đó, ôm chiếc găng tay hồng, nhìn bạn bằng ánh mắt của một hành khách đã mua vé._
* [🐕 Đưa {cho} về chòi. Trễ giờ thì trễ.]
    _{cho} không chịu ra. Bạn phải bế cả thùng ra. Bác Bình đứng chờ ở chòi, lắc đầu._
    bac_bao_ve: Nó trốn từ 5 giờ sáng đấy. Bác tìm mãi.
    _Đoàn xe khởi hành trễ 30 phút. Đài Tivi Hóng gọi 4 cuộc. Bạn trả lời cả 4, giọng ngọt như đường phèn, tay nắm chặt vô lăng._
    ~ cd_td(-2)
    ~ cd_met(8)
    ~ cd_tuat_o_canh_ga = false
* [🙏 Đóng nắp lại. Giữ {cho} ở cánh gà và cầu trời.]
    _Bạn nhét thêm 2 cây xúc xích vào thùng. "Ngồi im. Im là có ăn."_
    cho: …Gâu. *(rất nhỏ)*
    ~ cd_tuat_o_canh_ga = true
    ~ qh("cho", 5)
* [📻 Gọi bộ đàm: "{thuc_tap_sinh}, nhiệm vụ của em hôm nay: dính lấy Tuất như keo."]
    thuc_tap_sinh: Dạ rõ chị! Em mang theo xúc xích rồi ạ!
    _{cho} đi gameshow với một "vệ sĩ" 30 tuổi. Hai đứa ngồi chung một thùng xe._
    ~ cd_tuat_o_canh_ga = true
    ~ qh("thuc_tap_sinh", 5)
    ~ cd_bao_ke(de_thuc_tap_sinh)
- -> END

// ------------------------------------------------------------
=== chi_dai_1610_ghi_hinh ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
~ cd_dang_quay = true
_Đài Tivi Hóng. Trường quay "Hồng Hay Không Hồng". Giải thưởng 10 triệu. Đèn chói, khán giả vỗ tay theo bảng nhắc._
_MC (vest bóng, nụ cười truyền hình): "Và bây giờ là phần Hit Một Thời! Siêu Nhân Hồng sẽ hát lại một bài hit năm 2015!"_
_Nhạc "Công Viên" vang lên. {sieu_nhan_hong} cầm micro, tự tin hát:_
sieu_nhan_hong: "Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên… thích ăn… KHOAI chiên…"
_Khán giả khựng lại. Trong cánh gà, {idol_het_thoi} đứng như trời trồng. {quan_ly_idol} quay sang nhìn bạn._
quan_ly_idol: Hương, sai lời rồi. Chuyện này để anh lo… mà anh không biết lo sao.
* [📻 Bộ đàm cho {it}: "Mở micro cánh gà. Ngay." Rồi đẩy {idol_het_thoi} ra sát rèm.]
    chi_dai: Ông hát bè. Hát đúng lời. Hát đi.
    idol_het_thoi: Anh… anh là ca sĩ chính bài này mà…
    chi_dai: Thì hát cho người ta nhớ ai là ca sĩ chính.
    _Từ cánh gà vang lên giọng hát thật: "…thích ăn CHUỐI chiên…". {sieu_nhan_hong} quay đầu, cười rạng rỡ, hát theo. Song ca bất đắc dĩ. Khán giả đứng dậy._
    ~ cd_gameshow_on = true
    ~ follow(40000)
    ~ cd_uy(8)
    ~ qh("idol_het_thoi", 10)
    ~ qh("quan_ly_idol", 8)
    ~ cd_td(4)
* [😶 Kệ. Khoai chiên cũng là chiên. Cứ để chạy.]
    _{sieu_nhan_hong} hát tới hết bài bằng "khoai chiên". Khán giả cười. Dân mạng làm meme "Khoai Viên Chiên". Không tệ, nhưng không như kế hoạch._
    ~ follow(15000)
    ~ cd_nk(5)
* [🔥 Ra hiệu cắt nhạc, làm lại từ đầu.]
    _MC đứng hình. Đạo diễn đài chửi qua tai nghe. Ghi lại lần hai thì {sieu_nhan_hong} run, quên luôn lời. Khán giả về bớt._
    ~ follow(-10000)
    ~ cd_nk(15)
    ~ cd_td(-2)
- { cd_tuat_o_canh_ga:
    -> tuat
}
-> ket

= tuat
_Đúng lúc chương trình sắp hết, một tiếng "GÂU!" vang lên trong cánh gà. Máy quay số 3 lia sang. {cho} đứng đó, ngậm găng tay hồng._
* [🦁 Bước ra trước máy quay, chỉ tay: "Tuất. Ngồi."]
    _{cho} ngồi. Ngay ngắn. Như chó nghiệp vụ. Khán giả vỗ tay rần rần. MC: "Ôi, cả chó của đội cũng chuyên nghiệp!"_
    ~ follow(10000)
    ~ cd_uy(5)
    ~ qh("cho", 5)
* [🍖 Lén ném xúc xích ra sau, kéo {cho} khỏi khung hình.]
    _{cho} biến mất khỏi khung hình như chưa từng xuất hiện. Không ai thấy gì. Trừ bạn, người vừa mất cây xúc xích cuối cùng._
    ~ cd_td(1)
- -> ket

= ket
~ cd_dang_quay = false
_Ghi hình xong. Đoàn xe về lúc 7 giờ tối. Trong xe, {sieu_nhan_hong} ngủ gục với chiếc mũ hồng trên đùi, quay mặt vào cửa kính._
-> END

// ------------------------------------------------------------
=== chi_dai_1610_buffet_toi ===
# ngay:16 # gio:19:30 # noi:sanh_cong_ty
_Ngày Lương thực Thế giới. Liên hoan buffet ở sảnh công ty. Bạn đặt đồ ăn từ tuần trước. Đúng 19:30, đồ ăn tới. Đúng 19:31, {cho} tới._
_Bàn dài 23 chỗ. Và một danh sách những người đang giận nhau dài hơn cái bàn._
* [📋 Tự tay xếp chỗ ngồi theo "sơ đồ thù hằn".]
    _{truong_phong} cách {con_ong_chau_cha} 4 ghế. {designer} cách {bien_kich} một chậu cây. {ke_toan} ngồi cạnh bạn, xa {sales}._
    _Bữa ăn trôi qua không một tiếng cãi nhau. Kỷ lục mới._
    ~ cd_uy(5)
    ~ cd_td(3)
    ~ an(70)
* [🍚 "Ai ngồi đâu thì ngồi. Ăn đi, no rồi hết giận."]
    _{truong_phong} và {con_ong_chau_cha} giành nhau miếng sườn cuối cùng. {designer} hỏi {bien_kich} "ý tưởng này của ai". Không no nổi._
    ~ cd_nk(10)
    ~ an(70)
* [🐕 Việc đầu tiên: giữ {cho} cách bàn đồ ăn 5 mét.]
    _Bạn cột {cho} vào chân cầu thang với một khúc xương to. {cho} gặm, mắt vẫn liếc về phía bàn bánh._
    ~ qh("cho", -2)
    ~ cd_td(2)
    ~ an(60)
- { cd_gameshow_on:
    giam_doc: *(nâng ly)* Hôm nay gameshow thành công! Anh nghe đài nói clip song ca đang lên xu hướng! Cảm ơn em Hương! Cảm ơn Phát!
    idol_het_thoi: *(gãi đầu)* Dạ… em hát bè thôi anh.
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
}
_Mai đi Vũng Tàu. Bạn nhìn bàn tiệc, nhẩm lại danh sách xe, phòng, phao bơi, còi. Và cái tên {thanh_ninh} nằm trong danh sách phòng của bạn._
-> END
