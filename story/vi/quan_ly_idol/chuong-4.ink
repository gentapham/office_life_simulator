// ============================================================
// QUẢN LÝ IDOL · CHƯƠNG 4: "ĐÊM LỬA TRẠI" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_1710_xe_khach ===
# ngay:17 # gio:06:30 # noi:xe_khach # bat_buoc
~ thai_ly_ca_phe = 0
_Team building Vũng Tàu. Xe khách 29 chỗ. {dan_dau_tu} tuyên bố thoát nghèo nhờ Hồng Coin. Bạn ngồi ghế giữa, hai tai hai điện thoại: máy trái đài truyền hình, máy phải nhà hàng hải sản xác nhận bàn._
_{idol_het_thoi} lên xe trễ nhất. Ghế trống cạnh bạn. {idol_het_thoi} nhìn ghế đó một giây, rồi ngồi xuống._
* [📞 Tiếp tục nghe hai máy. Việc là việc.]
    _Qua trạm thu phí, cả hai máy cùng hết pin. Bạn ngủ gục lên cửa kính._
    _Khi tỉnh dậy, có một cái áo khoác kê giữa đầu bạn và cửa kính. Áo sơ mi lụa hoa văn. Của {idol_het_thoi}._
    ~ thai_p(15)
    ~ qh("idol_het_thoi", 3)
* [😶 Tắt cả hai máy. "Ngồi đi em." Dịch vào trong nhường chỗ dù ghế còn rộng.]
    idol_het_thoi: Anh tắt máy hả? Trời sập hả anh?
    quan_ly_idol: Ba tiếng thôi. Trời chưa sập kịp đâu.
    _Ba tiếng. {idol_het_thoi} kể chuyện đám cưới tuần rồi, cô dâu tên Thúy Hằng mà suýt đọc thành Thủy Hằng. Bạn cười, lần đầu cười thành tiếng trong tháng._
    ~ qh("idol_het_thoi", 10)
    ~ thai_gk(-5)
    ~ thai_p(20)
    ~ cang_thang(-10)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1710_keo_luoi ===
# ngay:17 # gio:10:00 # noi:bai_bien_vung_tau
_Bãi Sau. Cả công ty tắm biển. Bạn không được nghỉ: {sieu_nhan_hong} đi giúp ngư dân kéo lưới, bộ đồ hồng ướt sũng, và ba nhóm khách du lịch đang quay Tóp-tóp._
_Máy phải rung liên tục. Một clip đã lên: "Siêu Nhân Hồng kéo lưới, té ngửa, lưới toàn rong"._
* [✅ Duyệt ngay trên bãi biển: chia sẻ lại, ghi "Hồng không sợ ướt".]
    ~ follow(15000)
    ~ uy_tin = uy_tin + 3
    ~ thai_p(-10)
* [🙏 Nhắn {hong_hot} (đang nằm phơi nắng) đẩy clip lên fanpage.]
    hong_hot: *(dậy liền)* Gét gô! Mà anh ơi, có clip {sieu_nhan_hong} tháo mũ lau mặt nữa nè, đăng hông?
    ** [😤 "KHÔNG. Xóa liền."]
        hong_hot: Dạ dạ, em xóa! *(xóa thật)*
        ~ follow(10000)
        ~ qh("hong_hot", 3)
    ** [🤔 "Để anh coi đã."]
        _Bạn coi. Mặt {sieu_nhan_hong} mờ, ngược nắng, không ai nhận ra. Bạn vẫn xóa. Nhưng {hong_hot} đã lỡ gửi cho {designer}._
        ~ follow(10000)
        ~ thai_kh(1)
* [😶 Ngồi xuống cát. Nhìn biển 5 phút. Rồi mới mở máy.]
    _Năm phút. Biển xanh. Ai đó đặt xuống cạnh bạn một xiên cá viên chiên. {idol_het_thoi}, đi ngang, không nói gì._
    ~ nghi(10)
    ~ an(10)
    ~ cang_thang(-10)
    ~ follow(5000)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1710_nhau_toi ===
# ngay:17 # gio:20:00 # noi:lua_trai_vung_tau
_20 giờ. Lửa trại vừa nhóm. Tiệc hải sản còn dư nửa nồi ghẹ: Hồng Coin x10, {dan_dau_tu} bao. {sales} say, hứa mời "ca sĩ nổi tiếng nhất nước". {giam_doc} say, hứa tăng lương cả công ty. Mấy chuyện đó không phải việc của bạn tối nay._
_Việc của bạn đang ngồi sát đống lửa: {sieu_nhan_hong}, mồ hôi chảy ròng trong bộ đồ hồng, hai tay đưa lên mũ. Cách đó hai bước, {hong_hot} đang livestream, điện thoại chĩa thẳng vào đống lửa._
_Chiếc mũ nhích lên một chút. Bạn có đúng ba giây._ # hen_gio:3
* [🏃 Lao tới, đứng chắn giữa ống kính và {sieu_nhan_hong}.]
    _Livestream của {hong_hot} có 3 giây lưng áo blazer đen của bạn. Bình luận: "Ông chú cầm hai điện thoại lại xuất hiện". Sau lưng bạn, {sieu_nhan_hong} lau mặt xong, đội mũ lại._
    hong_hot: Ối dồi ôi anh! Em đang live mà!
    quan_ly_idol: Anh biết. Vì vậy anh mới đứng đây.
    ~ uy_tin = uy_tin + 3
    ~ qh("hong_hot", -3)
    ~ qh("sieu_nhan_hong", 5)
* [📱 Nhắn {hong_hot}: "TẮT LIVE."]
    _{hong_hot} đọc tin nhắn ở giây thứ hai, tắt live ở giây thứ ba. Khung hình cuối cùng là một cái cằm mờ trong ánh lửa. Bình luận đoán già đoán non tới sáng._
    ~ follow(5000)
    ~ thai_kh(1)
* [😶 Đứng yên. Mười hai năm rồi, có những thứ nên để tự nó xảy ra.]
    _Ba giây. Chiếc mũ không lên hẳn. {sieu_nhan_hong} chỉ lau mồ hôi dưới cằm rồi kéo xuống. Livestream có 3 giây "suýt", và 20.000 lượt chia sẻ trong đêm._
    ~ follow(10000)
    ~ thai_kh(1)
* [⏱️ (Không chọn kịp)]
    _Ba giây trôi qua. Bạn còn đang cầm hai điện thoại. Clip "Siêu Nhân Hồng suýt lộ mặt" lên Tóp-tóp trước khi bạn kịp gọi cho ai._
    ~ thai_kh(2)
    ~ scandal()
- ~ an(30)
~ uong(20)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1710_noi_that ===
# ngay:17 # gio:21:30 # noi:lua_trai_vung_tau # bat_buoc
_Đêm lửa trại. {it} chỉnh loa, {idol_het_thoi} hát "Công Viên". Rồi {sieu_nhan_hong} kể chuyện từng nhốt một đứa nhỏ trong nhà kho. Rồi {chi_dai} đề nghị chơi "nói thật"._
_Chai nước suối quay vòng. Dừng lại trước mặt bạn._
chi_dai: {quan_ly_idol}. Nói một sự thật. Cái gì mà cả công ty chưa biết.
_Cả đống lửa nhìn bạn. {idol_het_thoi} ngồi đối diện, ánh lửa trên mặt. {editor} ngồi bên kia, ôm gối._
* [😇 Sự thật vô hại: "Anh ghét cà phê. Mười hai năm rồi, chưa bao giờ thấy ngon."]
    chi_dai: *(bật cười)* Vậy mà ngày năm ly!
    _Cả đống lửa cười. Không ai hỏi thêm. Bạn thở ra._
    ~ thai_noi_that_lua_trai = "vo_hai"
    ~ thai_gk(5)
* [💚 Nói về LL: "Có một công ty mời anh về. Lương gấp đôi."]
    _Cả đống lửa im bặt. {giam_doc} đang ngủ gục, không nghe. {idol_het_thoi} nghe. {idol_het_thoi} đặt lon bia xuống._
    chi_dai: Rồi ông trả lời sao?
    quan_ly_idol: Chưa.
    ~ thai_noi_that_lua_trai = "ll"
    ~ phat_hien(ll_moi_thai)
    ~ qh("idol_het_thoi", -5)
    ~ thai_tt(5)
    ~ thai_kh(1)
* [🔥 Một nửa sự thật: "Có một người anh lo suốt mười một năm. Người đó không biết."]
    _Im lặng. Lửa nổ lách tách. {hong_hot} há miệng, rồi bị {chi_dai} đè tay xuống._
    chi_dai: *(nói nhỏ, khác hẳn mọi khi)* Ừ. Vậy là đủ. Qua lượt.
    _Bên kia đống lửa, {editor} cúi đầu thấp hơn. {idol_het_thoi} thì nhìn bạn, nhíu mày, như đang tính một phép tính chưa ra._
    ~ thai_noi_that_lua_trai = "mot_nua"
    ~ thai_gk(-15)
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1710_vai_ao ===
# ngay:17 # gio:23:30 # noi:lua_trai_vung_tau # bat_buoc
_Lửa tàn dần. Mọi người về phòng gần hết. Bạn ngồi cạnh {idol_het_thoi}. {idol_het_thoi} đã uống năm lon bia. Hay bảy._
_Bạn định nói gì đó. Đã định suốt mười một năm._
* [💬 "{idol_het_thoi} nè… mười một năm rồi đó em. Có lúc nào em muốn bỏ hông?"]
    { qh_idol_het_thoi >= 40:
        idol_het_thoi: *(nhìn lửa)* Có. Tối nào em cũng muốn bỏ. Mà sáng ra thấy anh gọi là em lại đi.
        _Bạn quay mặt đi chỗ khác. Rất lâu._
        ~ qh("idol_het_thoi", 10)
        ~ thai_gk(-5)
    - else:
        idol_het_thoi: Bỏ gì anh? Fan em đông lắm mà.
        _Bạn cười. Im lặng._
    }
* [😶 Không nói. Ngồi im nghe sóng.]
    ~ cang_thang(-5)
- _Đầu {idol_het_thoi} nghiêng dần. Chạm vào vai bạn. {idol_het_thoi} ngủ thật. Hơi thở mùi bia và cá viên chiên._
_Bạn ngồi thẳng lưng, không dám nhúc nhích. Hai điện thoại úp trên cát rung, rung, rồi thôi._
_Bạn ngồi im tới khi lửa tàn hẳn. Rồi {editor} bước tới, đắp một cái chăn lên cho cả hai._
editor: *(ngáp)* Anh {quan_ly_idol}… gió biển lạnh. Anh đừng thức nữa, mai anh còn dập phốt.
* [😊 "Cảm ơn em. Mà sao em còn thức?"]
    editor: Dạ… em quen thức rồi.
    ~ qh("editor", 10)
    _{editor} quay đi. Bạn vẫn không nhận ra gì._
* [📱 "Ừ. Mà {editor}, mai dựng anh cái clip {sieu_nhan_hong} kéo lưới nha, gấp."]
    editor: Dạ… em dựng liền.
    _{editor} đi về phòng. Đèn phòng {editor} sáng tới 5 giờ sáng._
* {thai_video_tien_tay >= 5 or thai_nguoi_dung_dem} [🔒 "Mấy cái video 'tiện tay' cho {idol_het_thoi} với {sieu_nhan_hong} tuần nào cũng có… là em làm hả?"]
    _{editor} đứng im. Rồi gật đầu._
    editor: Dạ… tại em thấy anh mệt.
    _Bí mật của bạn vẫn nằm yên chỗ cũ. Nhưng lần đầu tiên, giữa bãi biển lúc nửa đêm, có ai đó lo cho bạn. Bạn không biết đặt cảm giác đó ở đâu._
    ~ thai_nguoi_dung_dem = true
    ~ phat_hien(linh_thich_thai)
    ~ qh("editor", 15)
- ~ thai_p(-15)
_Sáng hôm sau {idol_het_thoi} không nhớ gì. Bạn thì nhớ. Bạn thức trắng tới sáng._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1810_binh_minh ===
# ngay:18 # gio:05:10 # noi:bai_bien_vung_tau
_5 giờ sáng. Bạn ra biển để gọi điện cho đài truyền hình, chỗ duy nhất có sóng. {editor} đã đứng ở đó, nhìn chân trời. Lần đầu thấy mặt trời mọc mà không phải vì chưa ngủ._
editor: Dạ… chào anh {quan_ly_idol}. Mặt trời mọc đẹp ha anh.
_Hai người đứng cạnh nhau. Mặt trời lên từ từ._
* [😊 "Ừ. Anh mười năm rồi chưa coi mặt trời mọc mà không cầm điện thoại."]
    editor: Giống em. Em toàn coi trên màn hình, lúc render xong.
    quan_ly_idol: *(cười)* Giống anh.
    _Hai người đứng im mười phút. Bạn không gọi cho đài. Đài gọi bạn ba lần. Bạn để máy rung._
    ~ qh("editor", 10)
    ~ cang_thang(-10)
    ~ thai_p(10)
* [📞 "Ừ đẹp. Khoan, anh nghe máy chút."]
    _Bạn nghe máy 10 phút. Khi quay lại, {editor} đã về phòng. Trên cát có dấu chân đứng rất lâu ở một chỗ._
    ~ thai_dap()
* {thai_nguoi_dung_dem} [💬 "{editor}. Mấy video đó… cảm ơn em nha. Thằng nhỏ này."]
    _Bạn vỗ vai {editor} một cái. {editor} đứng thẳng như bị điện giật nhẹ._
    editor: Dạ… dạ không có gì ạ.
    _Mặt trời lên hẳn. Tai {editor} đỏ. Chắc tại nắng sớm._
    ~ qh("editor", 12)
- _{dan_dau_tu} ngồi bệt trên cát gần đó, nhìn điện thoại, mặt trắng bệch: "Hồng Coin về 0 rồi…"_
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1810_son_goi ===
# ngay:18 # gio:20:30 # noi:studio_0905
_Về tới thành phố thì ai cũng giận ai. {con_ong_chau_cha} vừa phát hiện penthouse bị rao bán, đứng ở sảnh Sky Ảo với vali. Bạn đi ngang, đưa cậu chai nước, rồi lên nhà._
_Máy thứ ba rung. {thanh_xin_nghi}. Người không đi team building vì "bà ngoại ốm"._
thanh_xin_nghi: Anh {quan_ly_idol}. Ông nói thiệt đi. Ông có tính đi LL hông?
{ thai_noi_that_lua_trai == "ll":
    thanh_xin_nghi: Cả công ty biết rồi đó. Chị {hong_hot} kể với em trước khi xe về tới thành phố.
}
* [😇 "Có người mời. Anh chưa quyết. Em là người đầu tiên anh nói thật."]
    thanh_xin_nghi: *(im lặng)* … Ông đi thì ai lo cho anh {idol_het_thoi}?
    _Câu đó. Bạn đã tự hỏi câu đó mỗi đêm từ ngày 10._
    ~ qh("thanh_xin_nghi", 10)
    ~ thai_tt(3)
* [🛡️ "Không. Anh ở lại."]
    thanh_xin_nghi: Thiệt hông?
    quan_ly_idol: Thiệt.
    _Bạn nói "thiệt" mà không chắc. {thanh_xin_nghi} biết bạn không chắc. Mười năm bạn thân mà._
    ~ thai_tt(5)
* [💬 "Em hỏi anh, thì anh hỏi em: tối thứ 7 bà ngoại em ốm ở Đài Tivi Hóng hả?"]
    thanh_xin_nghi: *(im lặng rất lâu)* …Anh biết hả?
    quan_ly_idol: Anh làm showbiz mười hai năm. Anh biết đài nào quay gì tối thứ mấy.
    thanh_xin_nghi: *(giọng run)* Anh đừng nói ai nha anh. Em… em sợ thành anh {idol_het_thoi} thứ hai.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 15)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_tang_2
~ thai_ly_ca_phe = 0
_Thứ 2. Họp giao ban. Không ai nhìn mặt ai. {dan_dau_tu} ngồi sát tường, tránh ánh mắt của nửa phòng là chủ nợ. Mai là sinh nhật công ty 16 tuổi._
truong_phong: Anh {quan_ly_idol}, tiết mục văn nghệ mai. Mọi năm anh {idol_het_thoi} hát mở màn. Năm nay có {sieu_nhan_hong}. Anh xếp sao?
* [🎤 "{idol_het_thoi} mở màn như mọi năm. {sieu_nhan_hong} hát kết."]
    truong_phong: Ừ. Truyền thống. Mình take note.
    ~ qh("idol_het_thoi", 5)
    ~ thai_gk(-3)
* [🩷 "{sieu_nhan_hong} mở màn. Năm nay là năm của {sieu_nhan_hong}."]
    truong_phong: Hợp lý. Chiến dịch mà.
    _Bạn nói câu hợp lý. Rồi suốt buổi họp không nhìn về phía cửa, chỗ {idol_het_thoi} hay đứng._
    ~ follow(5000)
    ~ qh("idol_het_thoi", -8)
    ~ thai_gk(5)
* [🗓️ "Để {thanh_xin_nghi} xếp. Nó giữ lịch."]
    thanh_xin_nghi: Dạ… em xếp anh {idol_het_thoi} mở màn, anh {sieu_nhan_hong} hát kết.
    _Lúc {thanh_xin_nghi} gập sổ, bạn thấy ở trang sau một ô khoanh đỏ: "31/10, 20:00". Không ghi gì thêm. {thanh_xin_nghi} nhìn xuống bàn._
    ~ qh("thanh_xin_nghi", 5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2010_qua ===
# ngay:20 # gio:09:00 # noi:tang_1
_Ngày Phụ nữ Việt Nam, 9 giờ, giờ tặng hoa. Bạn có nhiệm vụ mua quà cho chị em thay mặt hai nghệ sĩ. Ngân sách: 500 nghìn, tiền túi. Bảy chị em. {dan_dau_tu} đi từng bàn chúc "8386", không tặng gì._
* [🌹 Bảy hộp bánh giống hệt nhau, thiệp ký tên "{idol_het_thoi} & {sieu_nhan_hong}".]
    _Không ai so được hộp nào to hơn. {chi_dai}: "Khôn đó." {thanh_ninh}: "Anh {quan_ly_idol} chu đáo quá anh ơi!"_
    ~ tien_cong(-490000)
    ~ qh("chi_dai", 5)
    ~ qh("hong_hot", 5)
    ~ qh("ke_toan", 5)
    ~ qh("designer", 3)
    ~ qh("sales", 3)
    ~ qh("bien_kich", 3)
    ~ qh("thanh_ninh", 3)
* [🩷 Bảy cái nơ hồng, thiệp ký "Siêu Nhân Hồng".]
    _{sieu_nhan_hong} chụp hình với từng chị. Fanpage có bộ ảnh "Hồng Tặng Hồng". {idol_het_thoi} không có trong ảnh nào._
    ~ follow(8000)
    ~ tien_cong(-300000)
    ~ qh("idol_het_thoi", -3)
* [🎤 Không mua quà. Nhờ {idol_het_thoi} hát tặng một bài, gọi tên từng người.]
    idol_het_thoi: Anh nhờ em hả? *(cười)* Ừ, em hát.
    _{idol_het_thoi} hát, đổi lời gọi tên bảy chị em. Tới tên {thanh_ninh} thì {chi_dai} ho. Tới tên {chi_dai} thì {thanh_ninh} ho lại._
    ~ qh("idol_het_thoi", 5)
    ~ qh("hong_hot", 3)
    ~ thai_gk(-2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2010_sinh_nhat ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_Sinh nhật {cong_ty} 16 tuổi. Quán Ốc Đêm, 18 giờ 30. Phông nền dán tạm trên vách quán là logo chữ G bảy màu bản gốc 2010, sau 38 lần sửa._
_Bác {bac_bao_ve} đứng dậy, đeo kính lão, đọc to lá thư "G" tới sáng nay: "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui. Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có. G."_
_Cả quán im. Rồi {giam_doc} cầm micro karaoke của quán, giọng run._
giam_doc: Năm 2015, anh ngồi ở một quán cà phê, nghe một cậu sinh viên hát về cá viên chiên. Anh đem cậu ấy về, và anh nói với một cậu trợ lý booking: "Lo cho thằng bé này nhé."
_{giam_doc} nhìn xuống chỗ bạn đứng._
giam_doc: Cái thằng {quan_ly_idol} ấy. Mười hai năm chưa xin nghỉ ngày nào. Năm 2018 người ta mời đi, nó ở lại. Anh chưa bao giờ cảm ơn nó. Hôm nay anh cảm ơn.
~ thai_tt(10)
_Cả quán vỗ tay. Bạn đứng giữa tiếng vỗ tay, hai tay hai điện thoại, không biết để đâu._
* [😶 Cúi đầu. Không nói gì.]
    ~ qh("giam_doc", 5)
    ~ thai_gk(3)
* [💬 Cầm micro: "Em cảm ơn anh. Mà người nên được cảm ơn là {idol_het_thoi}. Em chỉ đi theo thôi."]
    _Cả quán quay sang nhìn {idol_het_thoi}. {idol_het_thoi} đỏ mặt, lần đầu tiên không biết tạo dáng gì._
    ~ qh("idol_het_thoi", 10)
    ~ qh("giam_doc", 5)
    ~ thai_gk(-8)
- giam_doc: {idol_het_thoi}! Lên đây hát đi em!
_{idol_het_thoi} đứng lên ghế nhựa. Hát "Công Viên". Lệch tông câu thứ ba, như năm đó, cố ý. {giam_doc} bật cười, lấy tay che mắt._
_Bạn đứng dưới sân khấu. Lần này bạn có quay. Video dài 4 phút 12 giây, rung, mờ, toàn mặt {idol_het_thoi}._
* [📲 Đăng lên kênh nghệ sĩ, ghi: "Sinh nhật công ty, sinh nhật bài hát."]
    ~ follow(5000)
    ~ qh("idol_het_thoi", 3)
* [🔒 Giữ lại trong máy. Không đăng.]
    _Thư mục ảnh của bạn có 2.341 tấm. 2.200 tấm có {idol_het_thoi}._
    ~ thai_gk(2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2010_karaoke ===
# ngay:20 # gio:21:00 # noi:karaoke
_Tăng hai, Karaoke Chú Sáu. {giam_doc} say rất say, hứa tăng lương 20%. {hong_hot} quay. {giam_doc} giơ ngón cái vào ống kính._
_Rồi {giam_doc} ngồi phịch xuống cạnh bạn._
giam_doc: {quan_ly_idol}. Hợp đồng thằng {idol_het_thoi} hết hạn 31. Anh sợ giữ nó lại để nó hát đám cưới thêm mười năm. Cậu nói đi. Giữ hay thả?
* [🛡️ "Giữ anh. Nó còn hát được. Em lo."]
    giam_doc: *(vỗ vai bạn)* Cậu lúc nào cũng "em lo". Ai lo cho cậu?
    _Câu hỏi đó không ai trả lời. {giam_doc} ngủ gục._
    ~ qh("giam_doc", 5)
    ~ thai_tt(3)
* [😇 "Anh hỏi nó. Đừng hỏi em. Em không công bằng được."]
    giam_doc: *(nhìn bạn, tỉnh ra một chút)* Không công bằng à… Ừ. Anh hiểu.
    _{giam_doc} có hiểu không thì bạn không biết. Sáng mai {giam_doc} có nhớ không thì bạn càng không biết._
    ~ thai_gk(-10)
    ~ qh("giam_doc", 3)
* [📞 "Để em nghe máy chút anh." Rồi đi ra hành lang.]
    _Không có ai gọi. Bạn đứng ở hành lang karaoke, nghe tiếng {idol_het_thoi} hát "Công Viên" lần thứ tư trong đêm vọng ra qua cửa cách âm._
    ~ cang_thang(5)
- ~ thai_p(-10)
-> END
