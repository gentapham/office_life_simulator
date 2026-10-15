// ============================================================
// QUẢN LÝ IDOL · CHƯƠNG 4: "ĐÊM LỬA TRẠI" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_1710_xe_khach ===
# ngay:17 # gio:06:30 # noi:xe_khach # bat_buoc
~ thai_ly_ca_phe = 0
_Team building Vũng Tàu. Xe khách 29 chỗ. {dan_dau_tu} tuyên bố thoát nghèo nhờ Hồng Coin. Bạn ngồi ghế giữa, hai tai hai điện thoại: máy trái đài truyền hình, máy phải nhà hàng hải sản xác nhận bàn._
_Phát lên xe trễ nhất. Ghế trống cạnh bạn. Phát nhìn ghế đó một giây, rồi ngồi xuống._
* [📞 Tiếp tục nghe hai máy. Việc là việc.]
    _Qua trạm thu phí, cả hai máy cùng hết pin. Bạn ngủ gục lên cửa kính._
    _Khi tỉnh dậy, có một cái áo khoác kê giữa đầu bạn và cửa kính. Áo sơ mi lụa hoa văn. Của Phát._
    ~ thai_p(15)
    ~ qh("idol_het_thoi", 3)
* [😶 Tắt cả hai máy. "Ngồi đi em." Dịch vào trong nhường chỗ dù ghế còn rộng.]
    idol_het_thoi: Anh tắt máy hả? Trời sập hả anh?
    quan_ly_idol: Ba tiếng thôi. Trời chưa sập kịp đâu.
    _Ba tiếng. Phát kể chuyện đám cưới tuần rồi, cô dâu tên Thúy Hằng mà suýt đọc thành Thủy Hằng. Bạn cười, lần đầu cười thành tiếng trong tháng._
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
    ~ follow(25000)
    ~ uy_tin = uy_tin + 3
    ~ thai_p(-10)
* [🙏 Nhắn {hong_hot} (đang nằm phơi nắng) đẩy clip lên fanpage.]
    hong_hot: *(dậy liền)* Gét gô! Mà anh ơi, có clip Nguyên tháo mũ lau mặt nữa nè, đăng hông?
    ** [😤 "KHÔNG. Xóa liền."]
        hong_hot: Dạ dạ, em xóa! *(xóa thật)*
        ~ follow(20000)
        ~ qh("hong_hot", 3)
    ** [🤔 "Để anh coi đã."]
        _Bạn coi. Mặt Nguyên mờ, ngược nắng, không ai nhận ra. Bạn vẫn xóa. Nhưng {hong_hot} đã lỡ gửi cho {designer}._
        ~ follow(20000)
        ~ thai_kh(1)
* [😶 Ngồi xuống cát. Nhìn biển 5 phút. Rồi mới mở máy.]
    _Năm phút. Biển xanh. Ai đó đặt xuống cạnh bạn một xiên cá viên chiên. Phát, đi ngang, không nói gì._
    ~ nghi(10)
    ~ an(10)
    ~ cang_thang(-10)
    ~ follow(10000)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1710_nhau_toi ===
# ngay:17 # gio:19:00 # noi:nha_hang_vung_tau
_Tiệc hải sản. Hồng Coin x10, {dan_dau_tu} bao. {sales} say, đứng lên ghế hứa mời "ca sĩ nổi tiếng nhất nước" về hát Đêm Hồng._
_{giam_doc} cũng say, giơ ly: "Anh hứa! Tháng sau tăng lương cả công ty!" {hong_hot} đang quay. Ai cũng thấy, trừ {giam_doc}._
_Đây không phải nghệ sĩ của bạn. Nhưng mười hai năm làm khủng hoảng, tay bạn tự động thò vào túi lấy điện thoại._
* [🧯 Đi tới cạnh {hong_hot}: "Clip đó giữ trong máy thôi nha. Coi như quà sinh nhật anh xin trước."]
    hong_hot: *(nhìn bạn, nhìn {giam_doc})* Ối dồi ôi… ok anh. Em giữ. Mà giữ là giữ thôi nha, hông hứa xóa.
    ~ qh("giam_doc", 5)
    ~ qh("hong_hot", 2)
* [😶 Kệ. Hôm nay là ngày nghỉ.]
    _Bạn uống một ngụm bia. Lần đầu tiên trong tháng bạn để một cuộc khủng hoảng tự chạy._
    ~ cang_thang(-5)
* [🎤 Quay sang {sales}: "Ca sĩ nổi tiếng nhất nước là ai em? Để anh book."]
    sales: *(nấc, chỉ thẳng vào Phát)* Đó! Ảnh đó!
    _Phát đang gắp ghẹ, đứng hình, rồi ưỡn ngực. Cả bàn vỗ tay vì vui. Bạn vỗ to nhất._
    ~ qh("idol_het_thoi", 5)
    ~ qh("sales", 3)
    ~ thai_gk(-2)
- ~ an(50)
~ uong(20)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1710_noi_that ===
# ngay:17 # gio:21:30 # noi:lua_trai_vung_tau # bat_buoc
_Đêm lửa trại. {it} chỉnh loa, Phát hát "Công Viên". Rồi {sieu_nhan_hong} kể chuyện từng nhốt một đứa nhỏ trong nhà kho. Rồi {chi_dai} đề nghị chơi "nói thật"._
_Chai nước suối quay vòng. Dừng lại trước mặt bạn._
chi_dai: Thái. Nói một sự thật. Cái gì mà cả công ty chưa biết.
_Cả đống lửa nhìn bạn. Phát ngồi đối diện, ánh lửa trên mặt. {editor} ngồi bên kia, ôm gối._
* [😇 Sự thật vô hại: "Anh ghét cà phê. Mười hai năm rồi, chưa bao giờ thấy ngon."]
    chi_dai: *(bật cười)* Vậy mà ngày năm ly!
    _Cả đống lửa cười. Không ai hỏi thêm. Bạn thở ra._
    ~ thai_noi_that_lua_trai = "vo_hai"
    ~ thai_gk(5)
* [💚 Nói về LL: "Có một công ty mời anh về. Lương gấp đôi."]
    _Cả đống lửa im bặt. {giam_doc} đang ngủ gục, không nghe. Phát nghe. Phát đặt lon bia xuống._
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
    _Bên kia đống lửa, {editor} cúi đầu thấp hơn. Phát thì nhìn bạn, nhíu mày, như đang tính một phép tính chưa ra._
    ~ thai_noi_that_lua_trai = "mot_nua"
    ~ thai_gk(-15)
    ~ qh("chi_dai", 5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1710_vai_ao ===
# ngay:17 # gio:23:30 # noi:lua_trai_vung_tau # bat_buoc
_Lửa tàn dần. Mọi người về phòng gần hết. Bạn ngồi cạnh Phát. Phát đã uống năm lon bia. Hay bảy._
_Bạn định nói gì đó. Đã định suốt mười một năm._
* [💬 "Phát nè… mười một năm rồi đó em. Có lúc nào em muốn bỏ hông?"]
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
- _Đầu Phát nghiêng dần. Chạm vào vai bạn. Phát ngủ thật. Hơi thở mùi bia và cá viên chiên._
_Bạn ngồi thẳng lưng, không dám nhúc nhích. Hai điện thoại úp trên cát rung, rung, rồi thôi._
_Bạn ngồi im tới khi lửa tàn hẳn. Rồi {editor} bước tới, đắp một cái chăn lên cho cả hai._
editor: *(ngáp)* Anh Thái… gió biển lạnh. Anh đừng thức nữa, mai anh còn dập phốt.
* [😊 "Cảm ơn em. Mà sao em còn thức?"]
    editor: Dạ… em quen thức rồi.
    ~ qh("editor", 10)
    _{editor} quay đi. Bạn vẫn không nhận ra gì._
* [📱 "Ừ. Mà Lĩnh, mai dựng anh cái clip Nguyên kéo lưới nha, gấp."]
    editor: Dạ… em dựng liền.
    _{editor} đi về phòng. Đèn phòng {editor} sáng tới 5 giờ sáng._
* {thai_video_tien_tay >= 5 or thai_nguoi_dung_dem} [🔒 "Mấy cái video 'tiện tay' cho Phát với Nguyên tuần nào cũng có… là em làm hả?"]
    _{editor} đứng im. Rồi gật đầu._
    editor: Dạ… tại em thấy anh mệt.
    _Bí mật của bạn vẫn nằm yên chỗ cũ. Nhưng lần đầu tiên, giữa bãi biển lúc nửa đêm, có ai đó lo cho bạn. Bạn không biết đặt cảm giác đó ở đâu._
    ~ thai_nguoi_dung_dem = true
    ~ phat_hien(linh_thich_thai)
    ~ qh("editor", 15)
- ~ thai_p(-15)
_Sáng hôm sau Phát không nhớ gì. Bạn thì nhớ. Bạn thức trắng tới sáng._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_1810_binh_minh ===
# ngay:18 # gio:05:10 # noi:bai_bien_vung_tau
_5 giờ sáng. Bạn ra biển để gọi điện cho đài truyền hình, chỗ duy nhất có sóng. {editor} đã đứng ở đó, nhìn chân trời. Lần đầu thấy mặt trời mọc mà không phải vì chưa ngủ._
editor: Dạ… chào anh Thái. Mặt trời mọc đẹp ha anh.
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
* {thai_nguoi_dung_dem} [💬 "Lĩnh. Mấy video đó… cảm ơn em nha. Thằng nhỏ này."]
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
thanh_xin_nghi: Anh Thái. Ông nói thiệt đi. Ông có tính đi LL hông?
{ thai_noi_that_lua_trai == "ll":
    thanh_xin_nghi: Cả công ty biết rồi đó. Chị {hong_hot} kể với em trước khi xe về tới thành phố.
}
* [😇 "Có người mời. Anh chưa quyết. Em là người đầu tiên anh nói thật."]
    thanh_xin_nghi: *(im lặng)* … Ông đi thì ai lo cho anh Phát?
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
    thanh_xin_nghi: *(giọng run)* Anh đừng nói ai nha anh. Em… em sợ thành anh Phát thứ hai.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 15)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_tang_2
~ thai_ly_ca_phe = 0
_Thứ 2. Họp giao ban. Không ai nhìn mặt ai. {dan_dau_tu} ngồi sát tường, tránh ánh mắt của nửa phòng là chủ nợ. Mai là sinh nhật công ty 16 tuổi._
truong_phong: Anh Thái, tiết mục văn nghệ mai. Mọi năm anh Phát hát mở màn. Năm nay có Nguyên. Anh xếp sao?
* [🎤 "Phát mở màn như mọi năm. Nguyên hát kết."]
    truong_phong: Ừ. Truyền thống. Mình take note.
    ~ qh("idol_het_thoi", 5)
    ~ thai_gk(-3)
* [🩷 "Nguyên mở màn. Năm nay là năm của Nguyên."]
    truong_phong: Hợp lý. Chiến dịch mà.
    _Bạn nói câu hợp lý. Rồi suốt buổi họp không nhìn về phía cửa, chỗ Phát hay đứng._
    ~ follow(5000)
    ~ qh("idol_het_thoi", -8)
    ~ thai_gk(5)
* [🗓️ "Để {thanh_xin_nghi} xếp. Nó giữ lịch."]
    thanh_xin_nghi: Dạ… em xếp anh Phát mở màn. Còn một ô trống em… ghi "khách mời bí mật".
    _Bạn nhìn ô "khách mời bí mật". Nhìn {thanh_xin_nghi}. {thanh_xin_nghi} nhìn xuống bàn._
    ~ qh("thanh_xin_nghi", 5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2010_qua ===
# ngay:20 # gio:10:00 # noi:tang_1
_Ngày Phụ nữ Việt Nam. Bạn có nhiệm vụ mua quà cho chị em thay mặt hai nghệ sĩ. Ngân sách: 500 nghìn, tiền túi. Bảy chị em. {dan_dau_tu} đi từng bàn chúc "8386", không tặng gì._
* [🌹 Bảy hộp bánh giống hệt nhau, thiệp ký tên "Phát & Nguyên".]
    _Không ai so được hộp nào to hơn. {chi_dai}: "Khôn đó." {thanh_ninh}: "Anh Thái chu đáo quá anh ơi!"_
    ~ tien_cong(-490000)
    ~ qh("chi_dai", 5)
    ~ qh("hong_hot", 5)
    ~ qh("ke_toan", 5)
    ~ qh("designer", 3)
    ~ qh("sales", 3)
    ~ qh("bien_kich", 3)
    ~ qh("thanh_ninh", 3)
* [🩷 Bảy cái nơ hồng, thiệp ký "Siêu Nhân Hồng".]
    _Nguyên chụp hình với từng chị. Fanpage có bộ ảnh "Hồng Tặng Hồng". Phát không có trong ảnh nào._
    ~ follow(8000)
    ~ tien_cong(-300000)
    ~ qh("idol_het_thoi", -3)
* [🎤 Không mua quà. Nhờ Phát hát tặng một bài, gọi tên từng người.]
    idol_het_thoi: Anh nhờ em hả? *(cười)* Ừ, em hát.
    _Phát hát, đổi lời gọi tên bảy chị em. Tới tên {thanh_ninh} thì {chi_dai} ho. Tới tên {chi_dai} thì {thanh_ninh} ho lại._
    ~ qh("idol_het_thoi", 5)
    ~ qh("hong_hot", 3)
    ~ thai_gk(-2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2010_sinh_nhat ===
# ngay:20 # gio:18:30 # noi:san_khau_cong_ty # bat_buoc
_Sinh nhật {cong_ty} 16 tuổi. Phông nền là logo chữ G bảy màu bản gốc 2010, sau 38 lần sửa. {giam_doc} cầm micro, giọng run._
giam_doc: Năm 2015, anh ngồi ở một quán cà phê, nghe một cậu sinh viên hát về cá viên chiên. Anh đem cậu ấy về, và anh nói với một cậu trợ lý booking: "Lo cho thằng bé này nhé."
_{giam_doc} nhìn xuống chỗ bạn đứng._
giam_doc: Cái thằng Thái ấy. Mười hai năm chưa xin nghỉ ngày nào. Năm 2018 người ta mời đi, nó ở lại. Anh chưa bao giờ cảm ơn nó. Hôm nay anh cảm ơn.
~ thai_tt(10)
_Cả sảnh vỗ tay. Bạn đứng giữa tiếng vỗ tay, hai tay hai điện thoại, không biết để đâu._
* [😶 Cúi đầu. Không nói gì.]
    ~ qh("giam_doc", 5)
    ~ thai_gk(3)
* [💬 Cầm micro: "Em cảm ơn anh. Mà người nên được cảm ơn là Phát. Em chỉ đi theo thôi."]
    _Cả sảnh quay sang nhìn Phát. Phát đỏ mặt, lần đầu tiên không biết tạo dáng gì._
    ~ qh("idol_het_thoi", 10)
    ~ qh("giam_doc", 5)
    ~ thai_gk(-8)
- giam_doc: Phát! Lên đây hát đi em!
_Phát bước lên. Hát "Công Viên". Lệch tông câu thứ ba, như năm đó, cố ý. {giam_doc} bật cười, lấy tay che mắt._
_Bạn đứng dưới sân khấu. Lần này bạn có quay. Video dài 4 phút 12 giây, rung, mờ, toàn mặt Phát._
* [📲 Đăng lên kênh nghệ sĩ, ghi: "Sinh nhật công ty, sinh nhật bài hát."]
    ~ follow(10000)
    ~ qh("idol_het_thoi", 3)
* [🔒 Giữ lại trong máy. Không đăng.]
    _Thư mục ảnh của bạn có 2.341 tấm. 2.200 tấm có Phát._
    ~ thai_gk(2)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_2010_karaoke ===
# ngay:20 # gio:22:40 # noi:karaoke
_Tăng hai, Karaoke Hát Cho Nhau Nghe. {giam_doc} say rất say, hứa tăng lương 20%. {hong_hot} quay. {giam_doc} giơ ngón cái vào ống kính._
_Rồi {giam_doc} ngồi phịch xuống cạnh bạn._
giam_doc: Thái. Hợp đồng thằng Phát hết hạn 31. Anh sợ giữ nó lại để nó hát đám cưới thêm mười năm. Cậu nói đi. Giữ hay thả?
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
    _Không có ai gọi. Bạn đứng ở hành lang karaoke, nghe tiếng Phát hát "Công Viên" lần thứ tư trong đêm vọng ra qua cửa cách âm._
    ~ cang_thang(5)
- ~ thai_p(-10)
-> END
