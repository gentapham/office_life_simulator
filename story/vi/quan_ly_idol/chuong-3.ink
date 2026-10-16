// ============================================================
// QUẢN LÝ IDOL · CHƯƠNG 3: "MẤT ĐIỆN, MẤT SÓNG" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_1310_doanh_nhan ===
# ngay:13 # gio:10:00 # noi:phong_giam_doc
~ thai_ly_ca_phe = 0
_Ngày Doanh nhân Việt Nam. {giam_doc} tự tặng hoa cho mình. {thanh_ninh} đọc bài phát biểu khen sếp, phút thứ 13. {sales} trao tấm bằng "Doanh nhân của năm, do BTT Global bình chọn"._
_Bạn làm showbiz mười hai năm. Bạn biết gần hết các tập đoàn hay tài trợ sự kiện. Bạn chưa bao giờ nghe tên BTT Global._
giam_doc: {quan_ly_idol}! Gọi {idol_het_thoi} lên hát một bài mừng đi!
* [📞 Gọi {idol_het_thoi}: "Lên phòng sếp hát. Bài kia."]
    _{idol_het_thoi} lên. Hát "Công Viên", đổi lời "Ngày xưa có anh {giam_doc} thân…". {giam_doc} cười to nhất phòng._
    _Bạn đứng ở cửa. Nhìn {idol_het_thoi} hát. Quên bấm quay._
    ~ qh("giam_doc", 5)
    ~ qh("idol_het_thoi", 3)
    ~ thai_gk(-2)
* [💬 Hỏi nhỏ {sales}: "BTT Global có hợp đồng mẫu hông em? Anh xin một bản."]
    sales: *(cười rất tươi)* Dạ để em gửi anh sau nha. Tin chị đi!
    _{designer} đứng sau {sales}, nhìn bạn. Ánh mắt nói "anh đừng hỏi nữa"._
    ~ qh("sales", -5)
    ~ qh("designer", -3)
* [😶 Vỗ tay theo mọi người.]
    _Bạn vỗ tay, hai điện thoại kẹp dưới nách. Một cái rơi. Màn hình nứt thêm một đường._
    _Lúc cúi nhặt, bạn thấy ở góc dưới tấm bằng có một con cú nhỏ xíu, nét in mờ như ai lén thêm vào. Bạn từng thấy con cú này ở đâu đó rồi._
    ~ thai_video_tien_tay = thai_video_tien_tay + 1
    ~ thai_p(-5)
- _Lúc nhặt điện thoại, bạn thấy kênh của {sieu_nhan_hong} vừa có video mới, đăng lúc 4 giờ sáng: {sieu_nhan_hong} đẩy xe cho ông chú hôm thứ 7, dựng lại có nhạc. Bạn chưa duyệt video này. Lại thuật toán._
~ thai_video_tien_tay = thai_video_tien_tay + 1
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1310_ep_gia_dai ===
# ngay:13 # gio:15:00 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng, phòng sản xuất. Gameshow "Hồng Hay Không Hồng" quay 14 giờ thứ 6 này, phát sóng 20 giờ tối cùng ngày. Đạo diễn chương trình lật kịch bản._
dao_dien_dai: Anh {quan_ly_idol}. Nghệ sĩ của anh chưa có tên tuổi gì. Tôi xếp anh ấy vào phần đầu, phát lúc khán giả còn đang ăn cơm. Quảng bá trước giờ phát thì không có.
_Phần đầu chương trình: lúc cả nước đang gắp miếng cá kho, không ai nhìn TV._
* [💰 "Anh cho em phần cuối, có quảng bá, em tặng thêm một tiết mục: ca sĩ 'Công Viên' làm khách mời phụ."]
    dao_dien_dai: *(nhướn mày)* Ông {idol_het_thoi} á? Còn hát được à?
    quan_ly_idol: Hát được. Anh nghe là biết.
    dao_dien_dai: Thôi được. Phần cuối. Phần "Hit Một Thời" tôi tự lo kịch bản.
    ~ thai_book_gio_vang = true
    ~ follow(15000)
    ~ uy_tin = uy_tin + 5
    _Bạn chưa biết "tự lo kịch bản" nghĩa là gì. Thứ 6 bạn sẽ biết._
* [💸 "Em trả thêm 20 triệu tiền tài trợ hậu trường."]
    dao_dien_dai: Tiền công ty anh hay tiền anh?
    _Bạn gọi {ke_toan}. {ke_toan} hỏi: "Hóa đơn đâu anh?". Không có hóa đơn._
    dao_dien_dai: Thôi. Giữa chương trình. Lấy hay không?
    ~ follow(5000)
* [🚪 "Vậy thôi, em đưa {sieu_nhan_hong} qua đài khác."]
    dao_dien_dai: Đài khác hả? *(cười)* Anh cứ thử.
    { RANDOM(1, 10) <= 4:
        dao_dien_dai: *(gọi lại sau 10 phút)* Thôi được, phần cuối. Nhưng anh nợ tôi một lần.
        ~ thai_book_gio_vang = true
        ~ follow(15000)
    - else:
        _Không có đài nào khác. Bạn gọi lại xin phần đầu. Giọng đạo diễn rất vui._
        ~ thai_kh(1)
        ~ uy_tin = uy_tin - 3
    }
- ~ thai_p(-15)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1410_son_gat_lua ===
# ngay:14 # gio:08:10 # noi:phong_nghe_si # bat_buoc
_Ngày Hội Nông dân. Máy thứ ba rung lúc 6 giờ sáng: {thanh_xin_nghi} xin nghỉ "về quê phụ gặt lúa". {thanh_xin_nghi} sống ở Ven Đô. Ven Đô trồng rau, không trồng lúa._
{ nguoi_theo_doi < 200000:
    _Mốc 2: 200.000 người theo dõi. Không đạt. {sieu_nhan_hong} buồn, bỏ đi giúp người cả ngày, tắt cả máy phải._
    ~ thai_kh(1)
- else:
    _Mốc 2: 200.000 người theo dõi. Đạt. {sieu_nhan_hong} mua chuối chiên cho cả công ty. Phòng chờ dư ba bịch._
    ~ thai_tt(3)
}
_{hr} đứng ở cửa phòng Nghệ sĩ, cầm cuốn sổ đen._
hr: Anh {quan_ly_idol}, anh rảnh không… À không, anh hỏi nhanh thôi. {thanh_xin_nghi} hôm nay đi đâu vậy anh?
* [🛡️ "Đi khảo sát địa điểm quay cho {sieu_nhan_hong}. Anh giao."]
    hr: *(nhìn bạn rất lâu)* Thế à. Khảo sát ruộng lúa à anh?
    quan_ly_idol: Ruộng rau. Cảnh đồng quê. {sieu_nhan_hong} cần.
    hr: Dạ. Em ghi nhận.
    ~ thai_doi_lich_son = thai_doi_lich_son + 1
    ~ qh("thanh_xin_nghi", 10)
    ~ qh("hr", -3)
    ~ uy_tin = uy_tin - 2
* [😶 "Nó xin nghỉ. Anh duyệt. Có gì hỏi nó."]
    hr: Dạ.
    ~ qh("thanh_xin_nghi", 2)
* [😤 "Anh không biết. Em tự hỏi nó đi. Anh mệt lắm rồi."]
    hr: *(mỉm cười, ghi vào sổ)* Dạ. Em sẽ hỏi.
    _Chiều đó {thanh_xin_nghi} bị gọi lên "uống trà". Không ai biết vì sao {hr} biết chuyện ruộng rau._
    ~ thai_to_son = true
    ~ qh("thanh_xin_nghi", -20)
    ~ qh("hr", 3)
- _Tối, máy thứ ba rung. {thanh_xin_nghi} gửi một tấm ảnh: đôi giày kim tuyến đặt cạnh một tấm thẻ đeo, góc ảnh bị che bằng ngón tay. Kèm tin: "Cảm ơn anh. Em kể sau."_
{ thai_to_son:
    _Không. Tối đó máy thứ ba không rung._
}
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1510_mat_dien ===
# ngay:15 # gio:08:30 # noi:tang_1 # bat_buoc
~ thai_ly_ca_phe = 0
_Ngày Thanh niên. Mất điện cả ngày. 8 giờ 5 phút, {giam_doc} và {chi_dai} kẹt thang máy. Bạn tới lúc 8 giờ 30, nghe tiếng {chi_dai} đạp cửa thang máy vọng lên._
_Máy trái: 12% pin. Máy phải: 9%. Ổ cắm: không có điện. Năm cục sạc dự phòng ở nhà. Bạn quên mang. Lần đầu tiên trong năm._
~ thai_pin = 12
_{thuc_tap_sinh} đi một vòng tầng 1, phát sạc dự phòng. Năm cục. Không ai hỏi vì sao thực tập sinh có năm cục sạc xịn._
thuc_tap_sinh: Dạ anh {quan_ly_idol}, anh lấy một cục nè. Ngày Thanh niên em phải gương mẫu ạ.
* [🔋 Nhận, cắm cho máy phải. {sieu_nhan_hong} quan trọng hơn hôm nay.]
    ~ thai_p(25)
    ~ thai_co_sac_du_phong = true
    ~ qh("thuc_tap_sinh", 5)
    _Máy trái còn 11%. Bạn tắt máy trái. Đây là lần đầu tiên trong mười một năm bạn tự tay tắt máy của {idol_het_thoi}._
    ~ thai_gk(3)
* [🔋 Nhận, cắm cho máy trái.]
    ~ thai_p(25)
    ~ thai_co_sac_du_phong = true
    ~ qh("thuc_tap_sinh", 5)
    _Máy phải sập lúc 10 giờ. {sieu_nhan_hong} đi giúp người ở đâu đó, không ai liên lạc được. Bạn đi lòng vòng tầng 1 như con thoi._
    ~ thai_kh(1)
    ~ thai_gk(-3)
* [🤝 "Cảm ơn {thuc_tap_sinh}. Đưa anh {giam_doc} đi, ảnh ra khỏi thang máy là gọi ngân hàng liền."]
    thuc_tap_sinh: Dạ… anh nhường hả anh?
    _Hai máy sập lúc 11 giờ. Bạn ngồi yên ở bậc thang. Không gọi được cho ai. Lần đầu tiên sau nhiều năm._
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("giam_doc", 3)
    ~ thai_p(-15)
    ~ cang_thang(-5)
- truong_phong: *(trong phòng "Sáng Tạo", ba cây nến)* Anh {quan_ly_idol} vào đây. Mình họp thắp nến, chủ đề: làm việc khi không có điện.
_Bạn vào. Không có điện thoại để cầm, hai tay bạn không biết để đâu._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1510_cau_thang ===
# ngay:15 # gio:11:00 # noi:cau_thang_bo
_11 giờ. Mất điện, thang máy chết, cả tòa nhà đi thang bộ. Bạn ngồi ở chiếu nghỉ tầng 2, chỗ duy nhất có gió. {thanh_xin_nghi} ngồi xuống cạnh, giọng hôm nay khàn khàn sau một ngày "gặt lúa" hôm qua._
thanh_xin_nghi: *(nói nhỏ)* Anh {quan_ly_idol}. Dạo này anh lạ lắm. Có chuyện gì hả?
* [😶 "Có một công ty mời anh về. Lương gấp đôi. Anh chưa trả lời."]
    thanh_xin_nghi: *(quay phắt sang)* Anh… giấu em hả?
    _Lần đầu tiên {thanh_xin_nghi} thấy bạn thân mình cũng giấu chuyện. Lần đầu tiên bạn thấy {thanh_xin_nghi} không giả vờ ho._
    ~ qh("thanh_xin_nghi", 5)
    ~ thai_tt(-3)
* [🛡️ "Hông có gì. Mệt thôi."]
    thanh_xin_nghi: Ừ. Em cũng mệt. *(im lặng)* Cả hai mình đều đang nói dối hả anh?
    ~ qh("thanh_xin_nghi", 2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1510_pantry ===
# ngay:15 # gio:16:45 # noi:pantry # bat_buoc
_Gần 5 giờ chiều. Vẫn chưa có điện. Ngoài trời mưa, pantry không cửa sổ tối như đêm. Cả công ty ngồi bệt dưới sàn. Bếp ga mini của {chi_dai} đun ấm nước._
_Bạn ngồi ở góc xa nhất. Điện thoại cả hai đều đã sập._
_Rồi {hong_hot} nói: "Chán quá, có ai hát gì đi." {chi_dai}: "{idol_het_thoi}. Hát đi."_
_Trong bóng tối, giọng {idol_het_thoi} vang lên, không micro, không loa: "Ngày xưa có đôi bạn thân… bán cá viên chiên…"_
_Câu thứ hai, {thuc_tap_sinh} hát theo. Câu thứ ba, {hong_hot}. Tới điệp khúc cả pantry hát, lệch tông, sai lời. Lần đầu tiên thật lòng._
_Bạn không hát. Bạn chỉ nhìn. Không ai thấy mặt bạn lúc này. Trừ {editor}, ngồi ngay cạnh bạn, đang cầm điện thoại quay lại cảnh {idol_het_thoi} hát. Màn hình điện thoại là ánh sáng duy nhất, và nó hắt lên mặt bạn._
* [😶 Nhìn {idol_het_thoi}. Cứ nhìn. Quên rằng có người ngồi cạnh.]
    _Bạn nhìn tới hết bài. Lâu hơn người khác một giây. Rồi thêm một giây._
    _{editor} hạ điện thoại xuống. Dừng quay._
    ~ thai_gk(-10)
* [🙈 Nhìn xuống sàn. Gõ ngón tay theo nhịp.]
    _Bạn gõ nhịp lên đầu gối. Đúng nhịp, như mười một năm qua._
    ~ thai_gk(5)
* [🎶 Hát theo, thật nhỏ, câu "thích ăn chuối chiên".]
    _Giọng bạn lẫn trong giọng cả pantry. Không ai nghe ra. Chỉ {editor} ngồi cạnh nghe rõ, và quay sang nhìn bạn, rồi nhìn về phía {idol_het_thoi}, rồi cúi đầu._
    ~ thai_gk(-5)
- _Hát xong. Im lặng. Bạn nghe mình nói, rất khẽ: "Hay quá."_
_{idol_het_thoi} quay về phía góc tối. Bạn biết {idol_het_thoi} không thấy mặt bạn. Bạn vẫn quay đi._
~ cang_thang(-15)
~ thai_p(10)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1510_nhan_linh ===
# ngay:15 # gio:23:50 # noi:studio_0905
_Điện về lúc 5 giờ rưỡi chiều. Tới khuya bạn mới cắm sạc xong. Hai điện thoại sống lại, 46 tin nhắn, 19 cuộc gọi nhỡ. Bạn đọc hết, trả lời hết. Rồi mở Zalo-lô, tìm tên {editor}._
* [📱 "{editor} ơi, hồi chiều có ai quay lúc {idol_het_thoi} hát hông em? Anh muốn coi lại."]
    _Mười phút sau. Một file video, đã dựng lại: ánh sáng chỉnh ấm, giọng {idol_het_thoi} rõ, tiếng cả công ty hát theo lọt vào vừa đủ. Không có góc nào có mặt bạn._
    editor: Dạ em có quay nè anh. Em cắt cho gọn.
    _Bạn xem đi xem lại năm lần. Lần thứ sáu bạn mới để ý: video dừng đúng trước khi điện thoại của {editor} quay về phía góc tối._
    ~ qh("editor", 8)
    ** [💬 "Em dựng đẹp vậy! Cảm ơn em nha. Anh xin phép {idol_het_thoi} rồi đăng nha."]
        editor: Dạ… anh {quan_ly_idol} vui là được rồi ạ.
        ~ qh("editor", 5)
    ** {thai_video_tien_tay >= 3} [🔒 "{editor}. Mấy cái video 'tiện tay' trên kênh {idol_het_thoi}… có phải em làm hông?"]
        editor: *(im lặng 3 phút)* …Dạ. Tại em thấy anh mệt.
        _Bạn đọc dòng đó, không biết trả lời sao. Bạn gõ "cảm ơn em", xóa, gõ "em ngủ đi", xóa, rồi gửi một cái sticker con cú._
        ~ thai_video_tien_tay = thai_video_tien_tay + 2
        ~ thai_nguoi_dung_dem = true
        ~ phat_hien(linh_thich_thai)
        ~ qh("editor", 12)
* [📱 Nhắn {idol_het_thoi} trước: "Hồi chiều em hát hay nhất từ 2015 tới giờ."]
    idol_het_thoi: *(trả lời sau 30 giây)* Anh ngồi đâu vậy? Em hông thấy anh.
    quan_ly_idol: Anh ngồi chỗ tối nhất.
    idol_het_thoi: Hèn chi.
    ~ qh("idol_het_thoi", 8)
    ~ thai_gk(-5)
* [😴 Tắt máy. Ngủ. Lần đầu tiên trước 1 giờ sáng trong tháng.]
    ~ thai_p(40)
    ~ nghi(30)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1610_canh_ga ===
# ngay:16 # gio:14:00 # noi:dai_tivi_hong # bat_buoc
~ thai_ly_ca_phe = 0
{ thai_book_gio_vang:
    _Đài Tivi Hóng, 14 giờ, buổi quay. Bạn đã giành được phần cuối, tối nay 20 giờ phát sóng có quảng bá. Trường quay kín khán giả._
- else:
    _Đài Tivi Hóng, 14 giờ, buổi quay. Phần đầu chương trình, không quảng bá, nhưng trường quay vẫn đông, vì Siêu Nhân Hồng đang nổi._
}
_Phần "Hit Một Thời". MC: "Xin mời Siêu Nhân Hồng thể hiện một bản hit năm 2015!" Nhạc dạo vang lên. Là "Công Viên". Đài đã "tự lo kịch bản"._
_{sieu_nhan_hong} hát tới câu đó: "…thích ăn… khoai chiên!" Khán giả cười ồ._
_Trong cánh gà, {idol_het_thoi} tháo kính, bước lên một bước. Máy phải reo: đạo diễn đài. Máy trái reo: {idol_het_thoi} gọi, dù đứng cách bạn 2 mét._ # hen_gio:5
* [✋ Nắm tay áo {idol_het_thoi}: "{idol_het_thoi}. Tin anh. Lát nữa anh cho em lên."]
    _{idol_het_thoi} đứng lại. Nhìn tay bạn trên tay áo mình. Nhìn bạn._
    ~ qh("idol_het_thoi", 10)
    ~ thai_gk(-5)
    _Bạn chạy ra sau máy quay, xin đạo diễn đúng một phút cuối._
    { RANDOM(1, 10) <= 5:
        dao_dien_dai: Một phút. Không hơn.
        _{idol_het_thoi} bước ra. Hát cùng {sieu_nhan_hong} đoạn cuối. Đúng lời. Đúng tông. Khán giả đứng dậy._
        ~ follow(20000)
        ~ thai_song_ca_ghep = true
        ~ qh("sieu_nhan_hong", 5)
    - else:
        dao_dien_dai: Không được anh ơi. Hết giờ quảng cáo rồi.
        _{idol_het_thoi} đứng trong cánh gà tới hết chương trình. Không nói gì. Không đeo kính lại._
        ~ qh("idol_het_thoi", -3)
    }
* [📞 Nghe máy đạo diễn trước.]
    dao_dien_dai: Anh {quan_ly_idol}, khán giả đang thích, cho {sieu_nhan_hong} hát lại đoạn…
    _Bạn quay lại. {idol_het_thoi} đã bước ra sân khấu. Giật micro: "CHUỐI chiên!"_
    _Bảo vệ đài lôi {idol_het_thoi} ra. Khán giả trường quay quay lại, clip "Ông chú giật micro" lên Tóp-tóp sau 7 phút._
    ~ thai_kh(2)
    ~ scandal()
    ~ follow(-10000)
    _Đạo diễn đài gọi bạn vào phòng, đòi một bản tường trình. Bạn viết: "Do quản lý sắp xếp sai vị trí nghệ sĩ khách mời." Không có tên {idol_het_thoi}._
    ~ thai_ganh()
* [🎶 Nói vào máy trái: "Hát bè đi {idol_het_thoi}. Từ chỗ em đứng luôn."]
    _{idol_het_thoi} nghe máy, nhìn bạn, gật đầu. Giọng {idol_het_thoi} vang ra từ bóng tối cánh gà: "…thích ăn CHUỐI chiên…"_
    _{sieu_nhan_hong} quay về phía cánh gà. Đưa tay ra mời. {idol_het_thoi} bước ra. Song ca bất đắc dĩ. Khán giả đứng dậy._
    dao_dien_dai: *(nói qua máy phải)* Anh {quan_ly_idol} biết dàn cảnh ghê ha.
    ~ follow(20000)
    ~ thai_song_ca_ghep = true
    ~ qh("idol_het_thoi", 8)
    ~ qh("sieu_nhan_hong", 8)
    ~ uy_tin = uy_tin + 5
* [⏱️ (Không chọn kịp)]
    _Bạn đứng giữa hai người, hai máy reo, không bắt máy nào. Camera đài quay trúng cánh gà: một người đàn ông hai tay hai điện thoại, đứng chết trân cạnh một người đeo kính đen._
    _Cư dân mạng: "Ông chú cánh gà", "Ông kia cầm hai điện thoại là ai vậy?"_
    ~ thai_kh(1)
- ~ thai_p(-20)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1610_hanh_lang_dai ===
# ngay:16 # gio:17:30 # noi:dai_tivi_hong
_Hành lang Đài Tivi Hóng, sau buổi quay. Ba tiếng nữa chương trình mới phát sóng. Bạn ngồi bệt xuống sàn, lưng dựa tường. Pin: còn {thai_pin}. Tay run nhẹ._
{ thai_khung_hoang >= 3:
    _Ba phốt đang mở. Bạn nghe tim mình đập trong tai, lấn cả tiếng chuông điện thoại. Bạn nhớ mang máng có ai đó từng ngất ở chính hành lang này._
}
_{idol_het_thoi} đi ra, cầm hai ly cà phê sữa đá. Đưa bạn một ly. Ngồi xuống cạnh bạn._
idol_het_thoi: Anh. Hôm nay… cảm ơn anh.
* [☕ "Uống đi. Lần này anh uống sữa, cho đỡ xót ruột."]
    idol_het_thoi: Em biết. Ly thứ năm anh hay uống sữa mà.
    _{idol_het_thoi} biết. Bạn không biết {idol_het_thoi} biết._
    ~ thai_p(20)
    ~ qh("idol_het_thoi", 5)
    ~ thai_gk(-3)
* [📱 "Cảm ơn gì. Việc của anh mà." Rồi nghe máy.]
    _{idol_het_thoi} ngồi đó, nhìn bạn nghe máy. Rồi đứng dậy, đi về trước._
    ~ thai_gk(5)
    ~ thai_dap()
- -> END
