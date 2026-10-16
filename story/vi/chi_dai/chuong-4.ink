// ============================================================
// CHỊ ĐẠI: HƯƠNG · CHƯƠNG 4: "VŨNG TÀU THẤT THỦ" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== chi_dai_1710_xe_di_vung_tau ===
# ngay:17 # gio:06:00 # noi:cong_cong_ty # bat_buoc
_6 giờ sáng. Xe 29 chỗ đậu trước cổng. Bạn đứng ở cửa xe, cầm danh sách, cầm còi. Ai lên xe cũng phải đi qua bạn._
_Bác {bac_bao_ve} đứng ở chòi, vẫy tay. Bác ở lại trực, như mọi năm._
bac_bao_ve: Đi cẩn thận nhé. Đừng để anh {giam_doc} uống nhiều.
_{hr} đưa bạn tờ danh sách xếp phòng. Bạn liếc qua. Phòng 207: "{chi_dai} – {thanh_ninh}"._
hr: Anh xếp theo thuật toán "gắn kết đội nhóm" đó em. Anh chỉ muốn hai em hiểu nhau thôi.
* [🦁 Cầm bút gạch luôn tại chỗ: "Phòng 207: {chi_dai} – {ke_toan}. Xong."]
    hr: Ơ… thuật toán của anh…
    chi_dai: Thuật toán của ông cho tui ngủ với người tui ghét nhất công ty. Thuật toán đó đem đi sửa.
    _{thanh_ninh} ngồi trên xe nghe thấy hết. Mặt đỏ bừng, quay ra cửa sổ._
    ~ cd_uy(4)
    ~ qh("hr", -5)
    ~ qh("thanh_ninh", -5)
    ~ qh("ke_toan", 5)
* [😶 Thôi. Một đêm thôi mà. Chịu.]
    _Bạn gấp tờ giấy lại. {hr} nhìn bạn, ngạc nhiên. Lần đầu tiên chị Đại không cãi._
    ~ cd_nk(15)
    ~ qh("hr", 5)
    ~ cd_hoa_voi_nhi = true
* [🤝 Đổi cho {thanh_ninh} ở với {sales}, còn mình ở với {thuc_tap_sinh}… à không, {thuc_tap_sinh} ở với {con_ong_chau_cha}.]
    hr: Phòng {thuc_tap_sinh} với {con_ong_chau_cha} là anh xếp đúng rồi đó em.
    chi_dai: Ờ. Cái đó đúng. Cái của tui sai. Sửa cái sai thôi.
    ~ qh("hr", 2)
- _Xe chạy. Ở ghế cuối, {thuc_tap_sinh} vừa nhặt được một cuốn sổ bìa da rơi dưới sàn, nhét đầy giấy note. Bìa ghi "Ý tưởng". Chữ của {bien_kich}._
thuc_tap_sinh: Dạ chị ơi, sổ của ai rớt nè chị. Em mở ra coi tên được hông ạ?
* [🤝 "Đừng mở. Đưa lại cho {bien_kich}. Đồ của ai người nấy giữ."]
    _{thuc_tap_sinh} gật đầu, đi lên đưa tận tay. {bien_kich} giật lấy, ôm vào ngực, rồi quay xuống nhìn bạn, gật đầu cảm ơn._
    ~ qh("bien_kich", 10)
    ~ qh("thuc_tap_sinh", 3)
* [💬 "Mở trang đầu coi tên thôi."]
    thuc_tap_sinh: *(lật)* Dạ… "Chương 7: Chị Đại úp tô ốc lên đầu…" Dạ có tên chị ạ. Tên thật luôn ạ.
    chi_dai: {bien_kich}. Lại đây.
    bien_kich: *(tái mặt)* Đây không phải đạo, đây là cảm hứng chị ơi…
    ~ qh("bien_kich", -8)
    ~ cd_nk(8)
* [😶 "Kệ. Em giữ đi, tới nơi hỏi."]
    _{thuc_tap_sinh} nhét cuốn sổ vào ba lô. Bạn không biết trong đó có tên của cả công ty._
- -> END

// ------------------------------------------------------------
=== chi_dai_1710_tro_choi_tap_the ===
# ngay:17 # gio:15:00 # noi:bai_bien_vung_tau # bat_buoc
_Bãi biển Vũng Tàu. Nắng gắt. Bạn cầm còi. Cả công ty sợ còi hơn sợ sếp._
_Trò thứ nhất: kéo co. Đội Sản Xuất đấu đội Truyền Thông. {truong_phong} đòi "họp chiến thuật 5 phút" trước khi kéo._
* [📯 Thổi còi: "Không họp. Kéo."]
    _Tuýt! Đội Sản Xuất bị kéo lê 3 mét vì còn đang họp. {truong_phong} ngã sấp, mặt dính cát._
    ~ cd_uy(4)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [😇 Cho họp 5 phút. Bấm giờ.]
    _Đúng 5 phút, bạn thổi còi. {truong_phong} chưa họp xong slide thứ 2. Nhưng lần đầu tiên trong đời, anh họp đúng giờ._
    ~ qh("truong_phong", 5)
- _Trò thứ hai: "Bịt mắt dẫn đường". Mỗi người bịt mắt, đồng đội dẫn đi qua chướng ngại vật._
_{sieu_nhan_hong} bịt mắt bằng… chính chiếc mũ, quay ngược. {chua_te_deadline} được xếp làm người dẫn đường._
chua_te_deadline: Đi thẳng… rẽ trái… ờ… chill… cứ đi đi.
_{sieu_nhan_hong} đi thẳng xuống biển. Vẫn cười._
* [🛡️ Lội xuống kéo {sieu_nhan_hong} lên trước khi sóng đánh tuột mũ.]
    _Bạn ướt tới ngực. {sieu_nhan_hong} được kéo lên, mũ còn nguyên. {hong_hot} quay được hết._
    sieu_nhan_hong: Chị Đại là siêu nhân thật!
    ~ qh("sieu_nhan_hong", 8)
    ~ follow(12000)
* [📯 Thổi còi phạt {chua_te_deadline}: "Em dẫn đường kiểu gì vậy?"]
    chua_te_deadline: Ảnh đi nhanh quá mà chị!
    sieu_nhan_hong: *(từ dưới nước)* Không sao! {chua_te_deadline} dẫn đi đâu anh cũng đi!
    _Cả bãi biển "ồ" lên. {chua_te_deadline} quay đi, giả bộ coi điện thoại._
    ~ follow(5000)
    ~ qh("chua_te_deadline", -3)
- -> END

// ------------------------------------------------------------
=== chi_dai_1710_danh_sach_cat_giam ===
# ngay:17 # gio:21:00 # noi:quan_nhau_vung_tau # bat_buoc
_Bàn nhậu ven biển. Ghẹ, mực, bia. {sales} đã say, đứng lên ghế tuyên bố:_
sales: Tin chị đi! Đại Nhạc Hội, chị mời ca sĩ nổi tiếng nhất nước về hát! No cap!
_Cả bàn vỗ tay. Không ai hỏi ca sĩ nào._
_{giam_doc} cũng say. Anh cầm ly bia, đứng dậy, mắt long lanh:_
giam_doc: Các em! Anh hứa! Tháng sau… tăng lương cả công ty! Anh nói là làm!
_{hong_hot} đã bấm quay từ chữ "Các em". Không ai thấy, trừ bạn._
_Rồi mọi người kéo nhau ra bãi biển. {hr} đứng dậy sau cùng, bỏ quên một tập hồ sơ màu hồng trên ghế._
_Bạn cầm lên. Tờ đầu tiên: "Danh sách điều chỉnh nhân sự (dự kiến)". Dòng 1: {thuc_tap_sinh}. Dòng 2: {thanh_xin_nghi}. Dòng 3 tới dòng 7 còn trống._
_Kẹp phía sau là một tờ giấy khác, chữ của {giam_doc}: "Trang 2. Người cuối cùng: {hr}."_
~ phat_hien(danh_sach_cat_giam)
~ cd_nk(15)
* [📋 Đọc hết. Chụp lại. Trả về chỗ cũ như chưa hề thấy.]
    _Bạn đọc từng dòng hai lần. Chụp ảnh. Đặt lại đúng góc ghế, đúng chiều. Tim bạn đập như đấm bao cát._
    ~ cd_doc_danh_sach = true
    ~ cd_uy(2)
* [🔥 Xé đôi. Xé tư. Thả xuống biển.]
    _Giấy tan vào bọt sóng. Bạn biết nó vẫn còn bản gốc trong máy tính. Nhưng tối nay, ít nhất, nó không còn trong tay ai._
    ~ cd_xe_danh_sach = true
    ~ cd_doc_danh_sach = true
    ~ cd_nk(-10)
    ~ qh("hr", -10)
* [🦁 Cầm tập hồ sơ, đi thẳng ra bãi biển tìm {hr}.]
    -> doi_chat
* [💬 Cầm tập hồ sơ đi tìm {giam_doc}, hỏi thẳng.]
    _{giam_doc} đang nằm trên ghế bố, ôm cây đàn ghi-ta không biết của ai, ngủ say như con nít. Hỏi không được._
    _Bạn đặt tập hồ sơ dưới chân ghế {giam_doc}. Sáng mai anh sẽ thấy, và sẽ biết bạn đã thấy._
    ~ cd_hoi_thang_danh_sach = true
    ~ cd_doc_danh_sach = true
- -> END

= doi_chat
_{hr} đang đứng một mình ở mép nước, tay cầm ly trà đá mang theo từ quán. Thấy bạn cầm tập hồ sơ, anh khựng lại._
hr: Em… em đọc rồi hả.
chi_dai: Đọc rồi. Thằng {thuc_tap_sinh}. Thằng {thanh_xin_nghi}. Còn 5 dòng trống, ông định điền ai?
hr: Anh không định điền ai hết. Sếp bắt 7 tên trước 26/10. Anh để trống đó… vì anh không biết điền ai.
* [🔥 "Ông không biết thì để tui điền. Dòng 3: tên ông."]
    hr: *(cười buồn)* Em lật trang 2 chưa?
    _Bạn lật. "Người cuối cùng: {hr}." Chữ của sếp._
    chi_dai: …Ông biết từ đầu?
    hr: Biết. Người cắt người khác thì cuối cùng cũng bị cắt. Nghề nhân sự nó vậy.
    ~ cd_nk(-10)
* [🤝 "Ông với tui, mình giữ 7 dòng đó trống tới 31. Được hông?"]
    hr: Nếu Siêu Nhân Hồng thành công thì danh sách này vô nghĩa. Nếu không… thì có 22 dòng chứ không phải 7.
    chi_dai: Vậy thì thành công.
    ~ qh("hr", 10)
- _Hai người đứng im nghe sóng. Một lúc lâu, {hr} nói nhỏ: "Đừng nói với thằng {thuc_tap_sinh}. Nó còn tin công ty này lắm."_
~ cd_doi_chat_tuan = true
~ cd_doc_danh_sach = true
~ cd_uy(5)
-> END

// ------------------------------------------------------------
=== chi_dai_1710_lua_trai ===
# ngay:17 # gio:22:30 # noi:bai_bien_vung_tau # bat_buoc
_Lửa trại. Cả công ty ngồi thành vòng tròn. Trò "nói thật". Chai nước suối quay, đầu chai chỉ vào ai, người đó trả lời một câu hỏi._
_Chai chỉ vào {sieu_nhan_hong}. Câu hỏi: "Chuyện xấu nhất anh từng làm?"_
sieu_nhan_hong: *(im một lúc)* Hồi nhỏ… tui nhốt một đứa nhỏ trong nhà kho. Nó khóc cả buổi chiều. Tui không nhớ tên nó. Tui chỉ nhớ cái lỗ thông gió hình con cá.
_Cả vòng tròn im lặng. Bên kia đống lửa, {ran_doc} ngồi bất động, mặt sáng đỏ trong ánh lửa._
{ cd_de_y_ran_doc:
    _Bạn nhìn {ran_doc}. Tay {ran_doc} siết chặt cái ly nhựa tới móp méo. Bạn nhớ tấm ảnh xóm Cây Me._
}
_Chai quay tiếp. Dừng ở bạn. {hong_hot} giành hỏi:_
hong_hot: Chị {chi_dai}! Vụ tô ốc ở Quán Ốc Đêm năm đó có thật hông?!
* [🦁 Kể thật. Kể hết.]
    chi_dai: Thật. Năm chị 20 tuổi. Thằng đó bắt cá hai tay, bạn chị khóc ba ngày. Chị úp nguyên tô ốc len lên đầu nó. Nước cốt dừa chảy xuống tới cằm.
    chi_dai: Nó đứng dậy, nói "Em sẽ thành người thành công, chị sẽ hối hận". Chị trả tiền tô ốc rồi về.
    _Cả vòng tròn vỗ tay như vừa xem xong một bộ phim võ thuật._
    ~ cd_ke_vu_oc = "that"
    ~ cd_uy(10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [😇 Kể giảm: "Có. Mà hông phải nguyên tô. Nửa tô thôi."]
    hong_hot: Nửa tô cũng huyền thoại rồi chị ơi!
    ~ cd_ke_vu_oc = "giam"
    ~ cd_uy(5)
* [📞 Bấm điện thoại gọi Bác {bac_bao_ve}, bật loa ngoài: "Bác, vụ tô ốc có thật hông bác?"]
    _Chuông đổ 5 hồi. Bác đang ngủ. Rồi một giọng Bắc ngái ngủ vang lên giữa đống lửa:_
    bac_bao_ve: Thật. Bác ở đó. Bác ngồi bàn bên. Bác còn nhớ mặt thằng kia. Ngủ đi các cháu.
    _Tút tút. Cả vòng tròn nổ tung. Bác {bac_bao_ve} vừa thành huyền thoại thứ hai của đêm nay._
    ~ cd_ke_vu_oc = "bac_binh"
    ~ cd_hoi_bac_binh = true
    ~ cd_uy(8)
    ~ qh("bac_bao_ve", 5)
- _Gần nửa đêm. {idol_het_thoi} ngủ gục lên vai {quan_ly_idol}. {quan_ly_idol} ngồi im, không dám cử động. {editor} lặng lẽ đắp một cái chăn lên cả hai, rồi đi ra biển một mình._
_{sieu_nhan_hong} nóng quá, tháo mũ ra lau mồ hôi. Đúng lúc đó, bạn thấy đèn livestream của {hong_hot} đang đỏ, chĩa thẳng về phía này._
_Ba giây. Chỉ có ba giây._ # hen_gio:3
* [🛡️ Bước ngang, đứng chắn trước ống kính.]
    _Màn hình livestream của {hong_hot}: 3 giây toàn lưng áo của chị Đại. Bình luận: "Chị Đại che gì vậy?", "Ủa ai vậy?", "Đỉnh nóc kịch trần!"._
    _Khi bạn bước đi, {sieu_nhan_hong} đã đội mũ lại._
    ~ qh("sieu_nhan_hong", 10)
    ~ cd_paparazzi_bi_duoi = true
    ~ follow(5000)
* [🗣️ Quát: "{hong_hot}! Tắt!"]
    hong_hot: *(giật mình, bấm nhầm)* Dạ… dạ tắt rồi!
    _{hong_hot} tắt kịp. Livestream chỉ quay được tiếng quát. 4.000 người nghe chị Đại quát. Không ai thấy mặt ai._
    ~ cd_so_lan_quat = cd_so_lan_quat + 1
    ~ qh("hong_hot", -3)
* [⏱️ (Không chọn kịp)]
    _Ba giây. Đủ để livestream ghi lại một gương mặt mờ, ngược sáng lửa trại. Dân mạng tranh cãi suốt đêm: "Đó có phải mặt thật?"._
    ~ follow(20000)
    ~ scandal()
- -> END

// ------------------------------------------------------------
=== chi_dai_1810_ve_thanh_pho ===
# ngay:18 # gio:15:00 # noi:xe_vung_tau
_Xe về. Không ai nói chuyện với ai._
_{dan_dau_tu} ngồi ôm điện thoại, mặt xám như tro: Hồng Coin về 0. Người tạo ôm tiền biến mất. Hôm qua anh còn bao cả team ăn hải sản._
_{con_ong_chau_cha} nhìn chằm chằm một tin rao bán: "Penthouse Sky Ảo, tầng 30, giá thương lượng". Penthouse anh đang ở._
_Còn bạn, bạn chỉ giận một người. {hr} ngồi ghế đầu, đeo kính râm, không quay lại._
* [🗣️ Đi lên ghế đầu, ngồi xuống cạnh {hr}: "Nói chuyện tiếp đi."]
    { cd_doi_chat_tuan:
        hr: Tối qua mình nói hết rồi mà em.
        chi_dai: Tối qua ông nói ông không biết điền ai. Hôm nay tui nói: ông đừng điền ai. Ông bị gì, tui đứng trước.
        hr: *(tháo kính, mắt thâm quầng)* …Ừ.
        ~ qh("hr", 8)
    - else:
        hr: Em muốn nói chuyện gì?
        chi_dai: Tập hồ sơ màu hồng. Ông để quên ở bàn nhậu.
        hr: *(tái mặt)* Em… đọc rồi?
        chi_dai: Đọc rồi. Thằng {thuc_tap_sinh}, thằng {thanh_xin_nghi}. Ông dám đọc cái danh sách đó ngày 30, thì tui đứng lên trước khi ông đọc tới tên thứ hai.
        hr: Anh cũng mong có người đứng lên, em ạ.
        ~ cd_doi_chat_tuan = true
        ~ cd_uy(5)
    }
* [🤝 Ngồi cạnh {dan_dau_tu}: "Mất bao nhiêu?"]
    dan_dau_tu: Còn cái nịt em ơi. Mà lần sau là lên thật.
    chi_dai: Lần sau anh mua coin thì báo em. Em đứng cạnh đấm vô vai cho tỉnh.
    ~ qh("dan_dau_tu", 5)
    ~ cd_bao_ke(de_dan_dau_tu)
* [😶 Đeo tai nghe. Ngủ. Hai ngày rồi chưa ngủ.]
    ~ nghi(30)
    ~ cd_met(-10)
- -> END

// ------------------------------------------------------------
=== chi_dai_1810_toi_bao_cat ===
# ngay:18 # gio:20:30 # noi:nha_so_45
_Nhà số 45. Bao cát. Đèn sân vàng vọt. Bạn quấn băng tay._
{ cd_xe_danh_sach || cd_doc_danh_sach:
    _Trong đầu bạn chỉ có 7 dòng trên tờ giấy. 2 dòng có tên. 5 dòng trống._
}
* [🥊 Đấm. Cho tới khi hết nghĩ.]
    -> chi_dai_mg_bao_cat_mo_dau
* [📞 Gọi {ke_toan} qua uống trà.]
    _{ke_toan} tới sau 15 phút, mang theo một hộp bánh và cuốn sổ chi tiêu (theo thói quen)._
    ke_toan: Bà biết rồi hả? Danh sách đó.
    chi_dai: Bà cũng biết?
    ke_toan: Tui là người tính tiền trợ cấp cho từng tên. Tui biết trước bà 2 tuần.
    _Hai người ngồi im. Ấm trà nguội dần._
    ~ qh("ke_toan", 8)
    ~ cd_nk(-15)
* [📋 Ngồi mở laptop, làm lại dự toán Đại Nhạc Hội lần thứ 6.]
    _Bạn cắt bớt hoa, cắt bớt pháo, giữ nguyên đèn. 1 giờ sáng, dự toán còn 280 triệu và chạy được._
    ~ cd_td(5)
    ~ cd_met(10)
- -> END

// ------------------------------------------------------------
=== chi_dai_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp giao ban sau Vũng Tàu. Không ai nhìn mặt ai. {giam_doc} vào phòng, mặt hơi tái: clip "Anh hứa tăng lương cả công ty" đã có 200 lượt xem trong group Hội Anti Sếp._
giam_doc: Các em, hôm qua anh… có nói gì không nhỉ? Anh hơi mệt.
_Hai mươi người cùng nhìn lên trần nhà._
truong_phong: Dạ, mình chuyển sang nội dung chuẩn bị 20/10 nhé. Sinh nhật công ty 16 tuổi, kiêm Ngày Phụ nữ.
giam_doc: Đúng! {chi_dai} lo liên hoan nhé. Còn logo kỷ niệm 16 năm, {designer} làm giúp anh. Bản thứ… thứ mấy rồi em?
designer: Thứ 37 anh.
* [🦁 "Sếp. Liên hoan em lo. Nhưng sếp nhớ lời hứa hôm qua. Cả công ty nhớ."]
    giam_doc: *(ho khan)* Anh… anh sẽ "review" lại nhé.
    ~ cd_uy(5)
    ~ qh("giam_doc", -3)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [🤝 Giơ tay: "Em lo liên hoan. Nhưng {designer} làm logo tới bản 37 rồi, sếp chốt hôm nay giùm em."]
    designer: *(nhìn bạn như nhìn ân nhân)*
    giam_doc: Ờ… thì… mai anh chốt. Mai sinh nhật mà.
    ~ qh("designer", 10)
    ~ cd_bao_ke(de_designer)
* [😶 Ghi chép. Không nói gì. Người ta đang mệt.]
    ~ cd_nk(-3)
- -> END

// ------------------------------------------------------------
=== chi_dai_1910_phong_giam_doc ===
# ngay:19 # gio:16:00 # noi:phong_giam_doc
_Bạn mang dự toán Đại Nhạc Hội Siêu Nhân lần thứ 6 lên phòng giám đốc. {giam_doc} ngồi một mình, nhìn tờ giấy báo ngân hàng trên bàn. Thấy bạn, anh úp vội nó xuống._
giam_doc: Ơ, {chi_dai}. Dự toán à? Em để đó anh xem.
* [👊 Đập bàn: "Sếp xem bây giờ. Đại Nhạc Hội còn 12 ngày."]
    ~ cd_dap_ban()
    _RẦM. Tờ giấy úp trên bàn lật ngửa. "Thông báo đến hạn: 15/11/2026."_
    giam_doc: …Anh ký. 280 triệu. Anh ký.
    ~ cd_td(8)
    ~ cd_uy(8)
    ~ qh("giam_doc", -5)
* [😇 "Em để đây. Mà sếp ăn gì chưa? Mặt sếp xanh quá."]
    giam_doc: Anh… anh không đói. Cảm ơn em.
    _Anh nhìn bạn một lúc, rồi đẩy một chiếc bánh bao trong túi nilon về phía bạn: "Em ăn đi. Anh mua hai cái, ăn không nổi."_
    ~ qh("giam_doc", 8)
    ~ an(20)
* {biet(trang_47)} [🔒 "Sếp, em biết trang 47. Em cũng biết sếp đang lo. Sếp nói thật với em, công ty còn bao nhiêu?"]
    -> chi_dai_tudo_thang_that_long
- -> END

// ------------------------------------------------------------
=== chi_dai_tudo_thang_that_long ===
# noi:phong_giam_doc # dieu_kien:biet_trang_47
_{giam_doc} im lặng. Rất lâu. Anh đứng dậy, kéo rèm vách kính lại, rồi ngồi xuống ghế đối diện bạn, không phải ghế giám đốc._
giam_doc: Còn đủ trả lương hai tháng. Nếu không có 5 tỷ của cậu ấy, thì tháng 9 đã đóng cửa rồi.
giam_doc: Anh… anh thế chấp cả biệt thự. Năm 2024. Để trả lương cho các em. Không ai biết. Anh Genta cũng không biết.
_Anh nói "anh Genta" như nói tên một người thầy._
~ cd_thang_that_long = true
~ phat_hien(the_chap_biet_thu)
* [🤝 "Sếp không phải gánh một mình. Từ giờ cái gì cần đập bàn, để em đập."]
    giam_doc: *(cười, mắt đỏ)* Bàn anh mua trả góp đấy, em nhẹ tay.
    ~ qh("giam_doc", 20)
    ~ cd_uy(5)
* [🦁 "Vậy thì sếp đừng hứa tăng lương lúc say nữa. Hứa lúc tỉnh, rồi làm."]
    giam_doc: Ừ. Anh hứa lúc tỉnh: nếu Đại Nhạc Hội thành công, team sự kiện của em được tăng lương trước.
    ~ qh("giam_doc", 12)
    ~ cd_uy(8)
* [😶 Không nói gì. Chỉ rót cho anh một ly trà.]
    _{giam_doc} uống hết ly trà. Lần đầu tiên bạn thấy anh uống trà mà không khen trà "premium"._
    ~ qh("giam_doc", 15)
    ~ cd_nk(-5)
- _Ra khỏi phòng, bạn đi ngang bàn trợ lý. {thanh_ninh} đang cúi đầu rất sát màn hình, giả vờ không nghe thấy gì._
-> END

// ------------------------------------------------------------
=== chi_dai_1910_hoi_bac_binh ===
# ngay:19 # gio:17:45 # noi:choi_bao_ve
_Chòi bảo vệ. Bác {bac_bao_ve} đang dò đài radio. {cho} nằm dưới chân, gặm con gà cao su… à không, con gà cao su vẫn nằm sau tủ mạng. {cho} đang gặm cái dép._
bac_bao_ve: Cháu {chi_dai}. Ngồi đi. Trà đá nhé.
{ cd_tim_thay_anh_cu:
    -> co_anh
- else:
    -> khong_anh
}

= co_anh
_Bạn rút tấm ảnh cũ trong ví ra, đặt lên bàn. Quán Ốc Đêm. Tô ốc. Gã thanh niên tóc ướt. Và ông chú ngồi bàn bên, uống trà đá._
chi_dai: Bác. Ông chú trong góc ảnh này… là bác phải hông?
bac_bao_ve: *(đeo kính lão, nhìn rất lâu)* Ừ. Hồi ấy bác còn tóc.
* [💬 "Thằng bị úp ốc đó, bác còn nhớ mặt nó hông?"]
    bac_bao_ve: Nhớ. Mặt nó bây giờ… hay lên báo lắm.
    chi_dai: Báo nào?
    bac_bao_ve: *(uống trà)* Bác không thấy gì đâu. Cháu cứ nhìn kỹ những người mặc vest trắng ấy.
    _Bác không nói thêm. Bác không bao giờ nói thêm._
    ~ cd_hoi_bac_binh = true
* [😇 "Bác giữ tấm ảnh này giùm con. Để nhà, con sợ con xé."]
    bac_bao_ve: Ừ. Bác giữ. Bác giữ được nhiều thứ lắm.
    _Bác kẹp tấm ảnh vào cuốn sổ trực. Rồi như sực nhớ, bác nói thêm: "Nhưng cháu nhớ mặt thằng ấy nhé. Có ngày cần đấy."_
    ~ cd_hoi_bac_binh = true
    ~ qh("bac_bao_ve", 5)
- ~ uong(30)
-> END

= khong_anh
* [🍵 Ngồi uống trà, nghe đài. Không nói gì.]
    _Radio đọc bản tin giao thông. {cho} ngáy. Nắng chiều đổ xiên qua cổng. Mười lăm phút, bạn thấy mình nhẹ đi._
    ~ cd_nk(-15)
    ~ qh("bac_bao_ve", 3)
* [💬 "Bác ơi, mai 20/10. Mai bác có thư hông?"]
    bac_bao_ve: *(khựng tay rót trà)* Thư gì?
    chi_dai: Thì… năm nào ngày 20 bác cũng ngồi đọc một lá thư. Con thấy hoài.
    bac_bao_ve: Thư bạn cũ thôi. Uống trà đi cháu.
    ~ qh("bac_bao_ve", 2)
- ~ uong(30)
-> END

// ------------------------------------------------------------
=== chi_dai_2010_hoa_va_logo ===
# ngay:20 # gio:09:00 # noi:tang_1 # bat_buoc
_20/10. Ngày Phụ nữ Việt Nam. Sinh nhật {cong_ty} 16 tuổi. Tầng 1 thơm mùi hoa, mùi bánh, và mùi drama._
_Các anh trong công ty tặng hoa chị em. {con_ong_chau_cha} tặng {sales} bó hoa to nhất. {chua_te_deadline} quên mua, chạy ra đầu hẻm mua đại bó cúc vàng, tặng {designer}._
designer: Ủa… cúc vàng là hoa đi viếng mà?
_Còn {thuc_tap_sinh} mua 7 bông hồng, tặng đúng 7 chị em, mỗi người một bông. Tới bạn, cậu đưa bông hồng to nhất._
thuc_tap_sinh: Dạ em tặng chị ạ. Chị là "chị Đại" của em ạ.
* [😇 Nhận hoa, xoa đầu: "Cảm ơn em. Năm sau tặng người yêu nha."]
    thuc_tap_sinh: Dạ em chưa có người yêu ạ. Em có chị với chị {ke_toan} thôi ạ.
    ~ qh("thuc_tap_sinh", 5)
* [🧂 "Em tặng chị bông to nhất, mấy chị kia có buồn hông?"]
    _Sáu chị em còn lại cùng giơ bông hồng nhỏ hơn lên. {sales}: "Có chứ!" Cả phòng cười._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
- _Trên tầng 2, {giam_doc} gọi to: "{designer} ơi! Logo 16 năm, bản 38! Anh nghĩ kỹ rồi… mình dùng lại logo gốc năm 2010 nhé!"_
_{designer} đứng sững. Bó cúc vàng tuột khỏi tay._
designer: Ba mươi tám bản… để quay về bản số 1…
* [🛡️ Đi lên tầng 2: "Sếp. Logo gốc thì logo gốc. Nhưng {designer} được ghi tên 'thiết kế lại bản kỷ niệm'. Và nghỉ chiều nay."]
    giam_doc: Ơ… được. Được em. {designer} nghỉ chiều nhé. "Well done".
    _{designer} ngồi xuống bậc cầu thang, ôm mặt, cười như khóc._
    ~ qh("designer", 12)
    ~ cd_bao_ke(de_designer)
    ~ cd_uy(5)
* [🤝 Ngồi xuống bên cạnh {designer}: "Bản 1 cũng là của em. Em thắng 38 lần."]
    designer: *(cười, mắt đỏ)* Chị nói vậy thì… ừ. Em thắng.
    ~ qh("designer", 8)
* [😶 Đi qua. Hôm nay còn liên hoan 23 người.]
    ~ cd_met(5)
- -> END

// ------------------------------------------------------------
=== chi_dai_2010_thu_g ===
# ngay:20 # gio:17:00 # noi:choi_bao_ve # bat_buoc
_5 giờ chiều. Bộ đàm của bạn rè rè. Giọng Bác {bac_bao_ve}, chậm, khàn: "Cháu {chi_dai}. Xuống chòi bác một tí."_
_Trên bàn trong chòi có một lá thư tay, giấy kẻ ô học sinh. Ký tên một chữ: "G". Cạnh đó là một phong bì nhỏ dán kín, ngoài ghi: "Chỉ mở khi công ty sắp sập."_
bac_bao_ve: Thư của… một người bạn cũ. Người làm ra cái công ty này. Mỗi năm ngày này lại có một lá.
bac_bao_ve: Năm nay ông ấy viết cho cả công ty. Bác đọc trước mọi người, hay để yên? Bác hỏi cháu, vì cháu là người hiểu mấy đứa nhỏ nhất.
_Bạn liếc dòng đầu: "Mười sáu năm rồi. Các cháu còn đứng đó là anh vui…"_
* [📢 "Đọc đi bác. Tối nay ở liên hoan. Mấy đứa nhỏ cần nghe."]
    bac_bao_ve: *(gật đầu chậm)* Ừ. Thế thì bác đọc. Đọc xong rồi thì… người ta biết bác là ai đấy.
    chi_dai: Thì người ta biết bác là bác {bac_bao_ve}. Có gì đâu.
    ~ cd_khuyen_doc_thu = "doc"
    ~ qh("bac_bao_ve", 8)
* [🤫 "Bác giữ đi. Giờ này mà cả công ty biết có người ở xa đang theo dõi, tụi nhỏ hoảng."]
    bac_bao_ve: Ừ. Cháu nói có lý. Bác giữ.
    ~ cd_khuyen_doc_thu = "giu"
    ~ qh("bac_bao_ve", 3)
* [🤝 "Bác đưa sếp {giam_doc} đọc riêng. Ổng cần nghe nhất."]
    bac_bao_ve: *(nhìn lên tầng 2)* Anh {giam_doc} ấy à… Ừ. Có khi đúng.
    ~ cd_khuyen_doc_thu = "thang"
    ~ qh("bac_bao_ve", 5)
    ~ qh("giam_doc", 5)
- _Bác cất phong bì dán kín vào túi áo trong. Bạn không hỏi trong đó là gì. Bác cũng không nói._
bac_bao_ve: Cái này… bác chỉ là người giữ. Người quyết là ông ấy. Bác chỉ đọc khi đến lúc.
-> END

// ------------------------------------------------------------
=== chi_dai_2010_lien_hoan ===
# ngay:20 # gio:18:30 # noi:quan_oc_dem # bat_buoc
_Liên hoan sinh nhật công ty ở Quán Ốc Đêm. Bạn chọn chỗ này vì rẻ, vì gần, và vì… bạn chưa quay lại đây từ năm 20 tuổi._
_Chủ quán nhìn thấy bạn, đánh rơi cái vá. Rồi tự động mang ra một đĩa ốc len xào dừa: "Quán mời. Lâu quá rồi."_
_Bàn dài 23 chỗ. Một cái bánh kem sinh nhật 16 nến. {cho} được Bác {bac_bao_ve} dắt theo, buộc ở gốc cây, cách bánh đúng 5 mét._
-> chi_dai_mg_lien_hoan_mo_dau

// ------------------------------------------------------------
=== chi_dai_2010_doc_thu ===
# ngay:20 # gio:20:00 # noi:quan_oc_dem # dieu_kien:cd_khuyen_doc_thu_doc
{ cd_khuyen_doc_thu != "doc":
    -> END
}
_Bác {bac_bao_ve} đứng dậy, gõ đũa vào ly trà. Cả quán ốc im bặt. Bác đeo kính lão, mở lá thư._
bac_bao_ve: Mười sáu năm rồi. Các cháu còn đứng đó là anh vui.
bac_bao_ve: Việc hôm nay cứ để ngày mai tính, nhưng ngày mai thì phải có.
bac_bao_ve: Ký tên: G. *(gấp thư)* Thế thôi. Bác đọc xong rồi.
_Im lặng ba giây. Rồi {thuc_tap_sinh} vỗ tay. Rồi cả quán vỗ tay. {giam_doc} cúi đầu, lấy khăn giấy lau mắt, nói là "do ớt"._
~ tinh_than_cong_ty = tinh_than_cong_ty + 15
~ cd_nk(-15)
~ qh("bac_bao_ve", 10)
-> END

// ------------------------------------------------------------
=== chi_dai_2010_karaoke ===
# ngay:20 # gio:22:00 # noi:karaoke_hat_cho_nhau_nghe
_Tăng hai. Karaoke Hát Cho Nhau Nghe. Phòng VIP 2, sức chứa 15 người, đang chứa 21._
_{idol_het_thoi} hát "Công Viên" lần thứ ba. {giam_doc} đã say, cầm micro đứng lên bàn:_
giam_doc: Các em! Năm nay sinh nhật 16 tuổi! Anh hứa… nếu Đại Nhạc Hội thành công, tăng lương 20%! Cả công ty!
_Cả phòng gào lên. {hong_hot} bấm quay._
* [📝 Lấy tờ khăn giấy, đưa bút: "Sếp ký vô đây. Có người làm chứng."]
    giam_doc: Ký! Anh ký! Anh không sợ!
    _Tờ khăn giấy có chữ ký của {giam_doc} và 21 chữ ký làm chứng. Bạn gấp lại, cất vào ví, cạnh tấm ảnh cũ._
    ~ cd_luong_20 = true
    ~ cd_uy(5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [🗣️ Giật micro: "Sếp say rồi. Hứa lúc tỉnh nha sếp." Rồi đưa {giam_doc} ngồi xuống.]
    { cd_thang_that_long:
        giam_doc: *(ngồi phịch xuống, nói nhỏ)* Ừ. Em nói đúng. Hứa lúc tỉnh. Em nhớ giùm anh.
        ~ qh("giam_doc", 8)
    - else:
        giam_doc: Anh không say! Anh "full energy"!
        _Anh ngủ gục 5 phút sau._
    }
    ~ cd_uy(3)
* [🎤 Giành micro hát một bài bolero, đổi không khí.]
    _Bạn hát "Đêm buồn tỉnh lẻ". Cả phòng im lặng nghe. Chị Đại hát bolero hay một cách vô lý._
    ~ cd_nk(-10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- _1 giờ sáng. Bạn gọi taxi cho từng người. Người cuối cùng là {giam_doc}. Bạn đọc địa chỉ "Biệt thự số 1, Đồi Ngân Hàng" cho tài xế, rồi đứng nhìn chiếc xe đi khuất._
~ cd_met(10)
-> END
