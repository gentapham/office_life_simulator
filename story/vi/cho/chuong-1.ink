// ============================================================
// CHƯƠNG 1: "MÙI LẠ Ở CỔNG" (1/10 – 4/10)
// Người chơi là {cho}. Người nói chỉ hiện từ khóa Tuất hiểu,
// phần còn lại là "bla bla". Thẻ phu_de chỉ hiện ở chế độ
// "dịch tiếng người".
// ============================================================

// ------------------------------------------------------------
=== cho_0110_buoi_sang_o_choi ===
# ngay:1 # gio:06:30 # noi:choi_bao_ve # bat_buoc
_6 giờ 30. Cánh cổng sắt kêu "kééét". Đó là tiếng chuông báo thức của bạn._
_Bạn duỗi chân trước, duỗi chân sau, ngáp một cái dài tới mức thấy cả cuống họng của chính mình._
bac_bao_ve: Bla bla… TUẤT… bla… XÚC XÍCH… bla bla. # phu_de:Dậy rồi đấy à, {cho}. Lương hôm nay đây, hai cây xúc xích. Ăn từ từ thôi.
_Hai cây xúc xích. Lương tháng 10 về đúng giờ. Thế giới này vẫn còn công lý._
* [🦴 Ăn liền hai cây, không nhai.]
    ~ ch_an(30)
    cho: Gâu! *(liếm mép)*
    bac_bao_ve: Bla… KHÔNG… bla bla… ĂN… bla. # phu_de:Ăn kiểu ấy thì nghẹn có ngày. Chả ai giành của mày đâu.
    _Bác nói sai. Cả thế giới đều đang muốn giành xúc xích của bạn. Bạn biết điều đó._
* [🎁 Ăn một cây, tha cây còn lại về giấu dưới gầm cầu thang.]
    ~ ch_an(15)
    ~ nhan(xuc_xich)
    _Bạn đào một cái hố tưởng tượng trên nền gạch, đặt cây xúc xích xuống, lấy mũi lấp đất tưởng tượng lên. Hoàn hảo. Không ai tìm ra._
    bac_bao_ve: Bla bla… TUẤT… bla bla. # phu_de:Lại giấu dưới gầm cầu thang à. Bác thấy hết đấy, {cho} ạ.
* [🐾 Vẫy đuôi cảm ơn bác trước rồi mới ăn.]
    ~ ch_an(30)
    ~ qh("bac_bao_ve", 3)
    ~ ch_cung(2)
    bac_bao_ve: Bla… NGOAN. # phu_de:Ngoan.
    _Bác xoa đầu bạn bằng bàn tay có mùi trà mạn và dầu gió. Mùi bạn thích nhất trên đời._
- _Radio trong chòi đang nói gì đó về "Ngày Quốc tế Người cao tuổi". Bạn không hiểu, nhưng thấy bác ngồi thẳng lưng hơn mọi ngày._
-> END

// ------------------------------------------------------------
=== cho_0110_mui_la_o_cong ===
# ngay:1 # gio:07:58 # noi:cong_cong_ty # bat_buoc
_7 giờ 58. Một chiếc xe máy phóng vào cổng như bị ma đuổi. Một người lạ. Mùi lạ._
_Mũi bạn làm việc trước cả não:_
_👃 Trà sữa trân châu đường đen. Giấy sổ tay mới. Mồ hôi của người sắp trễ giờ. Và một mùi khó tả, chua chua, như cái nồi cơm bị quên trong tủ ba ngày: mùi bực bội._
ran_doc: Bla bla… bla… bla bla bla? # phu_de:Dạ con chào bác! Con là {ran_doc}, mới vô làm hôm nay ạ.
bac_bao_ve: Bla. Bla bla… bla. # phu_de:Ừ. Gửi xe bên kia, còn 2 phút nữa là 8 giờ đấy.
* [😤 Sủa người lạ. Đó là việc của bạn mà.]
    cho: Gâu! Gâu gâu!
    bac_bao_ve: TUẤT… KHÔNG. # phu_de:{cho}, không. Người nhà đấy.
    _Người nhà? Bạn chưa từng ngửi thấy người này trong đời. Bạn ghi nhớ mùi này vào một ngăn riêng trong đầu, dán nhãn "theo dõi"._
    ~ ch_mui(1)
* [👃 Đánh hơi kỹ ống quần người lạ.]
    ~ ch_mui(2)
    _Ống quần có mùi một con hẻm chật, mùi bánh mì đầu hẻm, và mùi một con chó khác ở xa xa, sủa cả đêm._
    {ch_mui_thinh >= 30:
        _Và trong cặp, sâu tận đáy, có mùi giấy cũ của một tấm ảnh rất lâu năm. Tấm ảnh có mùi cây me._
    }
    ran_doc: Bla bla… bla, bla bla. # phu_de:Ủa, con chó này đánh hơi kỹ dữ vậy. Tui không có xúc xích đâu nha.
    _Người lạ gãi đầu bạn một cái. Tay nhanh, gọn, hơi lạnh. Bạn chưa quyết định là thích hay không._
* [🐾 Vẫy đuôi. Người lạ biết đâu có đồ ăn.]
    ~ ch_cung(1)
    ~ qh("ran_doc", 5)
    ran_doc: Bla… TUẤT… bla bla. # phu_de:Tên {cho} hả? Dễ thương ghê. Mai anh mang cho miếng chả nha.
    _Người lạ nói một tràng. Không có chữ XÚC XÍCH nào. Đáng thất vọng, nhưng bạn vẫn còn hi vọng._
- _Người lạ chạy biến vào trong. Mùi bực bội còn đọng lại ở cổng rất lâu, lâu hơn cả mùi khói xe._
-> END

// ------------------------------------------------------------
=== cho_0110_ke_thu_hong ===
# ngay:1 # gio:09:20 # noi:cong_cong_ty # bat_buoc
_9 giờ 20. Một chiếc xe màu hồng đỗ xịch trước cổng. Cửa mở ra._
_Rồi cái mùi đó ập tới. Mùi bánh chuối chiên trộn với nước hoa hồng, đậm tới mức bạn hắt xì ba cái liên tiếp._
_Một người mặc bộ đồ hồng từ đầu tới chân, đội một cái mũ tròn hồng, bước qua cổng. Bạn chưa từng thấy thứ gì hồng tới mức đó. Kể cả cái nắp bút trong kho của bạn._
_Lông gáy bạn dựng đứng._
sieu_nhan_hong: *(ngồi xổm, nhìn bạn)* Bla bla… bla bla bla!
sieu_nhan_hong: Gâu! Gâu gâu! Bla bla… TUẤT… bla bla! # phu_de:Ủa con chó nè! Gâu! Gâu gâu! Hợp đồng ghi rồi nha, anh được chọc em đó, {cho}!
_Người đồ hồng sủa. Rất dở. Sai tông, sai nhịp, sai cả cảm xúc. Một sự xúc phạm tới nghệ thuật sủa._
_Rồi người đó thò tay lấy cái bóng cao su của bạn đang nằm cạnh ổ._ # hen_gio:3
* [😤 Sủa thật to.]
    cho: GÂU GÂU GÂU!
    ~ ch_lan_sua_hong = ch_lan_sua_hong + 1
    sieu_nhan_hong: Bla bla! Bla bla bla! # phu_de:Úi trời, dữ ghê! Vậy mới đúng chất phản diện của anh chứ!
    _Người đồ hồng cười to, buông cái bóng, tạo dáng chỉ tay lên trời. Không hiểu sao người đó vui. Bạn càng sủa to hơn._
    hong_hot: Bla bla… bla bla bla! # phu_de:Ối dồi ôi, quay được rồi nha! Clip đầu tiên của chiến dịch đây!
    ~ follow(8000)
    ~ ch_hong_doi(5)
* [🏃 Lao tới ngoạm lại cái bóng trước.]
    { RANDOM(1, 10) <= 6:
        _Bạn nhanh hơn. Cái bóng về lại trong miệng bạn, ướt nhẹp và an toàn._
        sieu_nhan_hong: Bla bla! Bla bla bla! # phu_de:Ủa nhanh vậy! Được, hôm nay em thắng!
        ~ ch_hong_doi(-2)
    - else:
        _Người đồ hồng nhanh hơn. Cái bóng biến ra sau lưng bộ đồ hồng. Rồi người đó lè lưỡi, trợn mắt với bạn._
        cho: Ẳng!
        ~ ch_hong_doi(5)
        ~ ch_lan_bi_choc = ch_lan_bi_choc + 1
    }
* [🐾 Quay lưng, nằm xuống, phớt lờ.]
    _Bạn quay mông về phía bộ đồ hồng. Một thông điệp rõ ràng trong ngôn ngữ chó: "Thân chưa mà giỡn."_
    sieu_nhan_hong: Bla… bla bla? # phu_de:Ủa… em giận anh hả?
    _Người đồ hồng đứng ngơ ngác, không biết làm gì tiếp. Bạn thấy mình thắng._
    ~ ch_hong_doi(-3)
* [⏱️ (Không chọn kịp)]
    _Cái bóng biến mất sau lưng bộ đồ hồng. Người đó lè lưỡi, trợn mắt, giả tiếng "gâu" một lần nữa._
    cho: Ẳng!
    ~ ch_lan_bi_choc = ch_lan_bi_choc + 1
    ~ ch_hong_doi(10)
- bac_bao_ve: Bla bla… bla. # phu_de:Thôi anh ơi, trả bóng cho nó. Người ta chờ anh ký hợp đồng trên kia kìa.
_Người đồ hồng đặt cái bóng xuống, làm mặt xấu lần cuối, rồi đi vào trong._
bac_bao_ve: Bla bla… bla… bla bla. # phu_de:Thế này thì một tháng vất vả đây.
_Bạn nhìn theo bóng hồng khuất sau cầu thang. Bạn chưa biết tên người đó. Nhưng bạn đã biết mùi. Và một con chó không bao giờ quên một cái mùi._
-> END

// ------------------------------------------------------------
=== cho_0110_hoa_cho_bac ===
# ngay:1 # gio:15:30 # noi:choi_bao_ve
_Chiều. Cả đám người từ trong công ty kéo ra chòi, tay cầm hoa, tay cầm ly trà sữa._
_Hôm nay họ uống trà sữa rất nhiều. Máy pha cà phê hỏng, mà lại có "5 tỷ" gì đó. Bạn không biết 5 tỷ là bao nhiêu xúc xích, nhưng ai cũng cười._
chi_dai: Bla bla… BÁC… bla bla bla! # phu_de:Bác {bac_bao_ve} ơi, hôm nay Ngày Người cao tuổi, cả công ty tặng bác nè!
thuc_tap_sinh: Bla bla… BÁC… bla. # phu_de:Dạ con chúc bác mạnh khỏe sống lâu ạ!
bac_bao_ve: Bla… bla bla… bla. # phu_de:Ơ… các cháu bày vẽ làm gì. Bác ngại lắm.
_Mặt bác đỏ như cái ghế nhựa. Bác ôm bó hoa mà không biết để đâu. Bạn chưa thấy bác lúng túng bao giờ._
_Mọi người có quà cho bác. Bạn thì không._
* [🎁 Ngậm một bông hoa trong bó, cắm vào bát nước của mình.]
    ~ ch_co_hoa_bac = true
    _Bạn rút một bông cúc vàng, chạy ra bát nước, thả vào. Bông hoa nổi lềnh bềnh. Đẹp. Rất đẹp. Đây là quà của bạn._
    chi_dai: Bla bla! TUẤT… bla bla bla! # phu_de:Trời ơi coi nó kìa! {cho} cũng tặng hoa cho bác nè mấy đứa!
    bac_bao_ve: *(cười, nheo mắt)* Bla… NGOAN. # phu_de:Ừ, con bác ngoan.
    ~ qh("bac_bao_ve", 5)
    ~ qh("chi_dai", 3)
    ~ ch_cung(4)
* [🦴 Ngồi ngay ngắn trước người đang cầm ly trà sữa. Mắt cún.]
    _Bạn nhắm vào {thuc_tap_sinh}. Người này mềm lòng nhất, mùi cũng hiền nhất._
    thuc_tap_sinh: Bla bla… TUẤT… KHÔNG… bla. # phu_de:Dạ {cho} ơi, trà sữa không tốt cho chó đâu ạ. Anh cho em… trân châu thôi nha?
    _Ba viên trân châu rơi xuống. Dẻo, ngọt, dính răng. Đáng giá từng giây ngồi ngay ngắn._
    ~ ch_an(5)
    ~ qh("thuc_tap_sinh", 3)
* [😴 Nằm dưới ghế bố của bác, nhìn mọi người.]
    _Bạn nằm gác mõm lên chân trước. Từ dưới ghế, bạn thấy hết: giày ai mới, giày ai cũ, ai đứng gần ai._
    _Đôi giày của {ke_toan} đứng không yên, cứ nhón lên nhón xuống. Mùi của {ke_toan} hôm nay là mùi giấy hợp đồng và mùi mất ngủ._
    ~ ch_mui(2)
- _Ai đó chụp hình. Trong ảnh có bác, bó hoa, cả công ty, và nửa cái đuôi của bạn._
-> END

// ------------------------------------------------------------
=== cho_0210_cuoi_cham_cong ===
# ngay:2 # gio:07:59 # noi:sanh_tang_tret # bat_buoc
_Sáng thứ 6. Cạnh máy chấm công có một người đứng cười. Cười suốt. Cười tới mức bạn thấy lo._
hr: Bla bla… bla bla bla… bla! # phu_de:Hôm nay Ngày Nụ cười Thế giới! Ai chấm công cũng phải cười nha, không cười là anh ghi tên đó.
_Ai đi qua cũng nhe răng ra. Bạn biết nhe răng nghĩa là gì: chuẩn bị cắn. Cả công ty hôm nay chuẩn bị cắn nhau?_
chua_te_deadline: *(đi trễ, ngáp)* Bla bla… bla. # phu_de:Cười rồi nè anh. Cười trong tâm.
hr: Bla bla… bla. # phu_de:Ghi nhận em {chua_te_deadline} đi trễ 20 phút và cười trong tâm.
_Rồi người cười suốt quay sang nhìn bạn._
hr: TUẤT… bla bla… bla bla? # phu_de:Còn {cho} thì sao? Chó có chấm công không ta?
* [😤 Nhe răng. Bạn cũng biết "cười".]
    cho: Grừ…
    hr: *(lùi lại một bước, vẫn cười)* Bla bla… bla bla. # phu_de:Ờ… nụ cười rất… có chính kiến. Anh ghi nhận.
    _Người cười suốt có mùi trà ô long và mùi giấy in còn nóng. Trong tay người đó có một tập hồ sơ màu hồng. Bạn ghét màu đó._
    ~ ch_mui(1)
* [🐾 Vẫy đuôi, há miệng thè lưỡi. Chó cười là vậy.]
    hr: Bla bla! TUẤT… NGOAN… bla bla! # phu_de:Đó! {cho} còn cười đẹp hơn cả phòng Sản xuất!
    ~ qh("hr", 5)
    ~ ch_cung(3)
    _Người cười suốt đặt tay lên đầu bạn. Đó là lần đầu bạn thấy người này cười mà mắt cũng cười theo._
* [👃 Đánh hơi tập hồ sơ hồng trong tay người cười suốt.]
    ~ ch_mui(2)
    _Tập hồ sơ có mùi phòng giám đốc, mùi nước hoa đắt tiền, và mùi tay người cầm nó: mồ hôi lạnh._
    hr: Bla… KHÔNG. # phu_de:Không, cái này không phải đồ chơi đâu {cho}.
    _Người đó giấu tập hồ sơ ra sau lưng nhanh y như bộ đồ hồng giấu cái bóng của bạn hôm qua. Đáng ngờ._
- _Lúc 15 giờ, cả công ty lại uống trà sữa. Thứ 6 nào cũng vậy. Bạn ngồi canh dưới gầm bàn pantry, chờ trân châu rơi như chờ mưa._
{ RANDOM(1, 2) == 1:
    _Trời thương bạn: một ly trà sữa đổ cả cái. Bạn ăn 11 viên trân châu và bị dính đường đen lên râu tới tối._
    ~ ch_an(10)
- else:
    _Hôm nay không ai làm rơi gì. Nhưng ly trà sữa uống dở của {hong_hot} nằm trong thùng rác, vẫn còn trân châu._
    ~ ch_co_vo_coc_tra_sua = true
    ~ ch_tha_ve_kho()
    _Bạn tha cái cốc về kho. Không ai hỏi một cái cốc rỗng đi đâu._
}
-> END

// ------------------------------------------------------------
=== cho_0310_cuoi_tuan_ven_do ===
# ngay:3 # gio:09:00 # noi:nha_vuon_ven_do
_Thứ 7. Bác chở bạn về nhà vườn ở Ven Đô. Bạn ngồi phía trước xe máy, tai bay phần phật, lưỡi bay phần phật. Đây là phần đẹp nhất của cả tuần._
_Nhà vườn có rau, có bể cá, có cái sân đất mà bạn được đào thoải mái. Không ai mặc đồ hồng ở đây._
_Ông Ba trà đá đã ngồi sẵn dưới gốc cây, bàn cờ tướng bày ra._
bac_bao_ve: Bla bla… bla bla. # phu_de:Hôm nay tôi không thua ông nữa đâu.
_Hai ông ngồi đánh cờ. Một tiếng không nói. Bạn có cả buổi sáng._
* [👃 Đi đánh hơi khắp vườn, chỗ nào cũng ngửi.]
    ~ ch_mui(3)
    _Luống rau muống. Bể cá. Tổ kiến. Một con mèo hàng xóm đi qua lúc 6 giờ sáng. Một cái tủ gỗ cũ trong nhà có mùi giấy rất cũ, cũ hơn cả bạn._
    _Mùi giấy đó lạ lắm: không phải giấy báo, không phải giấy hóa đơn. Giống mùi của lá thư bác hay ngồi đọc dưới đèn vàng._
* [🏃 Đào một cái hố thật sâu ở góc vườn.]
    _Bạn đào. Đất bay tung tóe. Bạn tìm được một cái rễ cây, một hòn sỏi tròn và một con giun rất bất ngờ._
    bac_bao_ve: TUẤT! KHÔNG! Bla bla… bla! # phu_de:{cho}! Không! Luống hành của bác!
    _Bạn nhìn xuống chân. À. Cái hố nằm giữa luống hành._
    _Bạn ngậm hòn sỏi tròn, giữ nó suốt đường về thành phố. Thứ 2, nó nằm trong kho dưới gầm cầu thang. Kỷ vật quê nhà._
    ~ ch_tha_ve_kho()
    ~ ch_cung(-2)
    ~ ch_do_no = gioi_han(ch_do_no - 10)
* [😴 Nằm dưới bàn cờ, gác cằm lên dép của bác.]
    _Tiếng quân cờ gõ lách cách. Gió đồng thổi qua. Bạn ngủ một giấc dài, mơ thấy cây xúc xích to bằng cái ghế bố._
    ~ nghi(30)
    _Lúc tỉnh dậy, bác đang thắng. Bác cười, giấu không nổi. Ông Ba lắc đầu, bảo chắc tại có con chó nằm dưới chân mang may mắn._
    ~ qh("bac_bao_ve", 3)
- _Chiều về, bạn nhìn bể cá rất lâu. Cá bơi vòng vòng. Bạn chưa từng hiểu cá, nhưng thấy cá ở đây có vẻ không vội._
-> END

// ------------------------------------------------------------
=== cho_0410_cai_chau ===
# ngay:4 # gio:08:30 # noi:san_cong_ty # bat_buoc
_Chủ nhật. Nhưng bác lại chở bạn lên công ty. Bạn thấy lạ. Rồi bạn thấy cái chậu._
_Một cái chậu nhựa to. Một bánh xà phòng. Một cái khăn. Bạn biết những thứ này cộng lại thành một từ khủng khiếp._
bac_bao_ve: TUẤT… bla bla… TẮM… bla bla. # phu_de:{cho}, hôm nay Ngày Động vật Thế giới. Tắm cho sạch rồi chụp ảnh với mọi người nhé.
_TẮM._
_Toàn bộ cơ thể bạn nhận được tín hiệu: CHẠY._
* [🏃 Chạy. Chạy ngay. Chạy như chưa từng được chạy.]
    -> cho_mg_tron_tam
* [😴 Giả vờ ngủ say, biết đâu bác thương.]
    _Bạn nằm im, mắt nhắm, thở đều. Diễn rất đạt. Nhưng cái đuôi của bạn tự vẫy khi nghe tiếng mở nắp xà phòng. Cái đuôi phản bội bạn._
    bac_bao_ve: Bla bla… bla. # phu_de:Đuôi mày khai hết rồi.
    -> cho_mg_tron_tam
* [🐾 Đi tìm người duy nhất bạn cho phép tắm.]
    _Bạn chạy thẳng vào kho sự kiện, nơi có một mùi quen: mùi dầu xoa bóp, mùi cao su của bao cát, mùi cơm nhà._
    chi_dai: Bla bla… TUẤT… TẮM… bla bla? # phu_de:Ủa, {cho}? Trốn tắm qua đây hả? Thôi, để chị tắm cho. Chị tắm thì em chịu đúng hông?
    _Người này nói một là một. Bạn biết vậy. Nên bạn tự đi ra chậu._
    ~ qh("chi_dai", 8)
    ~ ch_cung(5)
    -> cho_0410_tam_xong
- -> END

= cho_0410_tam_xong
_Nước ấm. Bọt xà phòng mùi chanh. Bàn tay của {chi_dai} gãi đúng chỗ sau tai, chỗ chỉ bác biết._
_{thuc_tap_sinh} đứng cầm khăn. Bạn rũ lông một phát. {thuc_tap_sinh} ướt từ đầu tới chân._
thuc_tap_sinh: Bla bla… bla bla! # phu_de:Dạ không sao ạ! Em cũng cần tắm ạ!
chi_dai: Bla bla… NGOAN… bla. # phu_de:Ngoan. Đứa nào chọc em hôm nay, chỉ mặt chị.
~ ch_mui(-5)
_Sạch sẽ. Thơm tho. Mũi bạn giờ chỉ ngửi thấy mùi chanh. Cả thế giới mất đi một nửa màu sắc._
-> END

// ------------------------------------------------------------
=== cho_0410_no_hong ===
# ngay:4 # gio:10:30 # noi:san_cong_ty # bat_buoc
_Tắm xong chưa phải là hết. Bác mang ra một cái áo nhỏ và một cái nơ._
_Cái nơ màu hồng._
bac_bao_ve: Bla bla… bla… bla bla. # phu_de:Các cháu bảo tháng này cái gì cũng phải có tí hồng. Chịu khó tí, {cho}.
_Bạn bị mặc áo. Bạn bị đội nơ. Bạn đứng giữa sân như một cái bánh kem bị lỗi._
_{designer} giơ điện thoại lên, mắt sáng rỡ._
designer: Bla bla bla! Bla bla… bla! # phu_de:Trời ơi cái mặt! Cái mặt khó chịu này phải làm sticker! "{cho} Không Vui"!
* [😤 Gầm gừ vào cái điện thoại.]
    cho: Grừ…
    designer: Bla bla! Bla bla bla! # phu_de:Đó! Đúng cái mặt đó! Giữ nguyên! Slay!
    _Càng gầm gừ, người đó càng chụp. Bạn không hiểu loài người._
    ~ ch_tuat_noi_hon_nguyen = true
    ~ qh("designer", 5)
* [🏃 Lăn ra đất, cọ lưng cho tới khi cái nơ rớt.]
    _Bạn lăn trái, lăn phải, lăn vòng. Cái nơ rớt. Cái áo dính đầy bụi. Bạn vừa làm hỏng 20 phút công sức của bác._
    bac_bao_ve: Bla… bla bla. # phu_de:Ừ… bác cũng đoán thế.
    ~ ch_cung(-1)
* [🐾 Đứng yên cho chụp, vì bác bảo vậy.]
    _Bạn đứng yên. Mặt vẫn khó chịu, vì khó chịu là sự thật. Nhưng đứng yên._
    designer: Bla bla… TUẤT… NGOAN! # phu_de:Ngoan quá trời! Tui gửi bác một tấm nha!
    ~ ch_cung(3)
    ~ qh("bac_bao_ve", 2)
- _Rồi một cái mùi khác bước vào sân: mùi giấy vụn, mùi cà phê sữa và mùi… mèo._
_{bien_kich} ôm một con mèo tam thể đi tới._
bien_kich: Bla bla… bla bla bla… TUẤT. # phu_de:Bí, đây là {cho}. Hai đứa gặp nhau đi. Đây là chương 2 của chị.
_Con mèo nhìn bạn. Bạn nhìn con mèo. 30 giây trôi qua trong im lặng tuyệt đối._
_Con mèo không chớp mắt. Bạn chớp trước. Bạn lùi lại một bước._
bien_kich: Bla… bla bla bla. # phu_de:Ừm… kẻ mạnh không cần sủa. Ghi lại.
_Ở cửa sổ tầng 2, {truong_phong} đang làm slide ngày chủ nhật. Bác nhìn lên, nói vọng một câu._
bac_bao_ve: Bla bla… bla bla… bla? # phu_de:Chủ nhật cũng đi làm à. Thế thì ai ở nhà?
_Cửa sổ tầng 2 im lặng rất lâu._
-> END

// ------------------------------------------------------------
=== cho_0410_tran_dau_tien ===
# ngay:4 # gio:14:00 # noi:cong_cong_ty # bat_buoc
_14 giờ. Chiếc xe hồng lại tới. Mùi bánh chuối chiên và nước hoa hồng lại ập tới. Bạn đang mặc áo, đội nơ, và không có đường lui._
sieu_nhan_hong: Bla bla bla! Gâu! Gâu gâu! Bla bla… TUẤT… bla! # phu_de:Trời ơi! Gâu! Gâu gâu! {cho} ơi, nơ của em hồng giống anh nè! Mình là đồng đội rồi!
_Đồng đội. Bạn không hiểu từ đó, nhưng bạn hiểu giọng điệu đó._
_Người đồ hồng cúi xuống sát mặt bạn, hai bàn tay đeo găng hồng chống đầu gối. Ở phía sau, {hong_hot} đã giơ điện thoại lên._
hong_hot: Bla bla… bla bla! # phu_de:Quay nè quay nè! {cho} với Hồng, phần 2!
_Một chiếc găng tay hồng đang ở ngay trước mũi bạn._ # hen_gio:3
* [🎁 Ngoạm chiếc găng tay. Chạy.]
    { RANDOM(1, 10) <= 7:
        _Bạn ngoạm. Chiếc găng tuột khỏi tay người đồ hồng. Bạn chạy, cái nơ bay phấp phới như lá cờ chiến thắng._
        sieu_nhan_hong: Bla bla! Bla bla bla! # phu_de:Ê! Găng tay của anh! Size L khó mua lắm đó!
        ~ nhan(gang_tay_hong)
        ~ ch_tha_ve_kho()
        ~ ch_hong_doi(-5)
        ~ ch_lo_mat_nguyen = ch_lo_mat_nguyen + 3
        ~ follow(15000)
        _Chiếc găng tay hồng nằm trong kho dưới gầm cầu thang. Món đầu tiên trong "bộ sưu tập Hồng". Nó có mùi bánh chuối chiên, mùi mồ hôi tay, và một mùi rất nhẹ của ai đó đang hồi hộp._
    - else:
        _Bạn ngoạm hụt. Người đồ hồng rụt tay lại, cười như được mùa._
        sieu_nhan_hong: Bla bla! Bla! # phu_de:Hụt rồi! Anh là siêu nhân mà!
        ~ ch_hong_doi(5)
    }
* [😤 Sủa đuổi quanh bãi xe.]
    _Bạn lao lên. Người đồ hồng bỏ chạy, vừa chạy vừa cười, vòng quanh bãi xe ba vòng. Cái nơ của bạn đứt dây, bay đi._
    hong_hot: Bla bla bla! Bla! # phu_de:Trời ơi view nổ rồi! Chạy nữa đi {cho}!
    ~ follow(20000)
    ~ ch_lan_sua_hong = ch_lan_sua_hong + 1
    { RANDOM(1, 10) <= 3:
        _Người đồ hồng vấp phải cái chân chống xe, té một cú đẹp như phim._
        ~ follow(10000)
    }
* [🐾 Quay lưng, nằm xuống, phớt lờ.]
    _Bạn nằm xuống, mặt quay vào tường. Cái nơ trên đầu vẫn hồng, nhưng tâm hồn bạn thì không._
    sieu_nhan_hong: Bla… bla bla? # phu_de:Ủa… không chơi hả? Vậy… anh mượn cái này nha.
    ~ ch_hong_doi(-3)
* [⏱️ (Không chọn kịp)]
    _Người đồ hồng giật cái nơ trên đầu bạn, cài lên mũ của mình, tạo dáng. {hong_hot} cười ngặt nghẽo._
    cho: Ẳng!
    ~ ch_lan_bi_choc = ch_lan_bi_choc + 1
    ~ ch_hong_doi(10)
- _Trong lúc hỗn loạn, người đồ hồng lén cầm con gà cao su của bạn, đi vào sảnh, nhét ra sau cái tủ sắt đầy dây xanh. Bạn không thấy. Không ai thấy._
~ ch_co_ga_cao_su = false
giam_doc: *(chạy ra từ sảnh)* Bla bla… bla bla bla… TUẤT… bla! # phu_de:Ấy chết, anh {sieu_nhan_hong}! Anh không sao chứ? Bác {bac_bao_ve}, giữ con {cho} giúp em với!
bac_bao_ve: Bla. # phu_de:Ừ.
_Bác nói "ừ" nhưng không giữ. Bác chỉ ngồi uống trà. Bạn thấy bác hơi cười._
sieu_nhan_hong: Bla bla… HỒNG… bla bla! # phu_de:Hồng không phải màu, Hồng là thái độ!
_Người đồ hồng nói câu đó, và lần này, giữa một tràng "bla bla", có một từ nhảy ra rõ ràng. Bạn đã nghe nó cả trăm lần trong ba ngày. Bạn hiểu rồi._
~ ch_hoc_tu(ch_tv_hong)
_📖 Từ mới: HỒNG. Nghĩa: kẻ thù._
-> END

// ------------------------------------------------------------
=== cho_0410_sinh_nhat_tuat ===
# ngay:4 # gio:19:30 # noi:choi_bao_ve
_Tối. Bác cởi cái áo nhỏ cho bạn, gấp lại, cất vào ngăn bàn. Cái nơ thì bác vứt luôn. Bác hiểu bạn._
_Rồi bác lấy ra một cây xúc xích. Cây thứ ba trong ngày. Chưa từng có tiền lệ._
bac_bao_ve: Bla bla… TUẤT… bla bla… bla. # phu_de:Hôm nay là ngày bác nhặt được mày đấy, {cho}. Mưa to lắm. Mày bé bằng cái ca nước.
bac_bao_ve: Bla bla… bla… XÚC XÍCH. # phu_de:Thôi, coi như sinh nhật. Xúc xích đây.
* [🦴 Ăn chậm thôi, lần này ăn thật chậm.]
    ~ ch_an(20)
    _Bạn ăn chậm. Rất chậm. Nhai từng miếng như {ke_toan} đếm từng đồng._
    bac_bao_ve: Bla… bla. # phu_de:Biết thưởng thức rồi đấy.
* [🙃 Nằm ngửa. Quà sinh nhật bạn muốn là được gãi bụng.]
    ~ ch_an(20)
    ~ qh("bac_bao_ve", 5)
    _Bác cười, cúi xuống gãi bụng bạn. Chân sau bạn đạp đạp vào không khí như đang đạp xe._
    _Cái radio trong chòi phát một bài hát cũ về Hà Nội. Bác hát theo, sai lời, nhưng không ai sửa._
* [🎁 Tha cây xúc xích về kho, giữ làm kỷ niệm.]
    _Bạn tha cây xúc xích sinh nhật về gầm cầu thang. Đặt cạnh chiếc nắp bút hồng. Bạn nằm nhìn nó rất lâu._
    _Rồi bạn ăn nó. Kỷ niệm thì giữ trong lòng là được rồi._
    ~ ch_an(20)
- _Bác lấy giấy bút ra, viết một lá thư. Bác viết chậm, gạch xóa nhiều. Thỉnh thoảng bác nhìn bạn._
bac_bao_ve: Bla bla… bla… TUẤT… TẮM… bla bla. # phu_de:Kể gì cho ông ấy đây… Thôi, kể là hôm nay {cho} được tắm.
_Bạn không biết "ông ấy" là ai. Nhưng lá thư có mùi tay bác, và bác gấp nó cẩn thận như gấp cái áo của bạn._
-> END
