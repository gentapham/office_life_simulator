// ============================================================
// CHỊ ĐẠI: HƯƠNG · CHƯƠNG 5: "HỘI NGHỊ HÒA GIẢI" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== chi_dai_2110_confession ===
# ngay:21 # gio:09:15 # noi:pantry # bat_buoc
_Mốc 3: 500.000 người theo dõi. Nhưng sáng nay không ai nhìn con số đó. Cả công ty nhìn một bài đăng khác._
_Trang "Confession G-Entertainment", bài ẩn danh lúc 2 giờ sáng: "Có ai biết sếp G-Ent thế chấp biệt thự ở Ngân hàng Tín Dụng Đen Đủi không? Công ty sắp sập rồi đó mấy bà."_
{ nguoi_theo_doi < 500000:
    _Và con số trên màn hình: {nguoi_theo_doi}. Chưa tới mốc 3. Hai chuyện cộng lại thành một tin đồn: "Sắp cắt giảm nhân sự"._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
_Pantry ồn như chợ. {thuc_tap_sinh} ngồi một góc, mặt tái mét. {thanh_xin_nghi} đang soạn đơn xin nghỉ "vì lo âu"._
sales: Tui nói rồi mà! Tui có nguồn tin là danh sách có 10 người!
hong_hot: *(nói hơi nhanh)* Ủa ai đăng vậy ta? Tui… tui đâu biết gì đâu!
* [🗣️ Quát: "IM HẾT!"]
    _Một tiếng. Cả pantry im phăng phắc. Cái muỗng rơi vào ly nghe rõ như chuông chùa._
    chi_dai: Chưa ai bị đuổi. Chưa có danh sách nào được đọc. Ai còn truyền tin "10 người" thì gặp chị.
    chi_dai: Bây giờ về chỗ. Làm việc. Đêm Hồng còn 10 ngày.
    _Từng người lặng lẽ về chỗ. {sales} đi cuối cùng, không dám nhìn bạn._
    ~ cd_uy(8)
    ~ cd_nk(5)
    ~ cd_so_lan_quat = cd_so_lan_quat + 1
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [🕵️ Hỏi Thăm Kiểu Chị Đại: hỏi thẳng từng người tin "10 người" từ đâu ra.]
    -> hoi_tham
* [🤝 Ngồi xuống cạnh {thuc_tap_sinh}, nói nhỏ: "Có chị đây. Không ai gạch tên em được."]
    thuc_tap_sinh: Dạ… chị biết danh sách rồi hả chị?
    chi_dai: Chị biết cái gì không quan trọng. Chị đứng đâu mới quan trọng. Chị đứng trước em.
    ~ qh("thuc_tap_sinh", 10)
    ~ cd_bao_ke(de_thuc_tap_sinh)
- -> END

= hoi_tham
_Bạn hỏi {sales}. {sales} nói nghe {hong_hot}. Bạn hỏi {hong_hot}. {hong_hot} nói nghe "ai đó trong group"._
{ cd_de_y_ran_doc:
    _Bạn hỏi tiếp ba người. Cả ba đều nói nghe từ {ran_doc}. "Nói nhỏ thôi nha… tui nghe nói…"_
    _Bạn đi tới bàn {ran_doc}. {ran_doc} ngẩng lên, nụ cười đông cứng một giây._
    chi_dai: Tin "10 người" là em kể hả?
    ran_doc: Dạ… em chỉ nghe người ta nói lại thôi chị.
    chi_dai: Ờ. Lần sau nghe thì giữ. Chị đang để ý em đó.
    ~ qh("ran_doc", -10)
    ~ cd_uy(5)
- else:
    _Tin đồn đi một vòng rồi quay về chỗ cũ: không ai là nguồn, ai cũng là nguồn. Nhưng bạn hỏi tới đâu, tin đồn tắt tới đó._
    ~ cd_uy(3)
}
_{hr} và {it} đi ngang, mỗi người cầm một cái laptop, mặt nghiêm như đi bắt trộm. Họ đang truy tìm admin trang Confession._
it: *(liếc {hong_hot}, rồi nhìn đi chỗ khác)* Không biết. Lỗi người dùng.
-> END

// ------------------------------------------------------------
=== chi_dai_2210_doan_thue ===
# ngay:22 # gio:08:00 # noi:cau_thang_tang_2 # bat_buoc
_8 giờ sáng. Bộ đàm của Bác {bac_bao_ve} rè rè: "Ba người. Cặp tài liệu. Đồ tối màu. Đoàn thuế. Bác giữ được 2 phút."_
_{ke_toan} lao ra hành lang, mặt trắng bệch: "Bà ơi, tui cần 15 phút. Hóa đơn tháng 6 còn nằm trong thùng mì."_
_Bạn đứng chắn ở đầu cầu thang tầng 2. Trưởng đoàn đi lên trước: Chú Liêm, 55 tuổi, kính dày, cặp da sờn._
chu_liem: Chào cô. Đoàn kiểm tra. Cho xem sổ sách.
* [🍵 "Dạ chú đi đường xa. Mời chú uống chén trà trước đã, trà Thái Nguyên, nước sôi lần hai."]
    chu_liem: *(khựng)* Ờ… trà Thái Nguyên à. Cũng được. Một chén thôi.
    _Một chén thành ba chén. Ba chén thành chuyện quê. Chuyện quê thành chuyện con cái. 17 phút._
    ~ cd_chan_doan_thue = true
    ~ cd_uy(5)
    ~ qh("ke_toan", 10)
* [🐕 Bộ đàm: "Bác {bac_bao_ve}. Thả {cho} đi dạo cầu thang."]
    _Ba giây sau, {cho} phi lên cầu thang, vẫy đuôi, sủa một tiếng thân thiện._
    chu_liem: *(nhảy lên bậc trên, bám tay vịn)* CON… CON CHÓ! Cô… cô giữ nó lại!
    _Bạn giữ {cho}. Từ từ. Rất từ từ. Mười lăm phút sau {cho} mới chịu xuống. Chú Liêm vẫn chưa dám buông tay vịn._
    ~ cd_chan_doan_thue = true
    ~ qh("ke_toan", 8)
    ~ qh("cho", 5)
    ~ cd_nk(-5)
* [🦁 "Dạ mời chú lên. Công ty con không giấu gì."]
    _Đoàn đi thẳng vào phòng kế toán. {ke_toan} đang ngồi giữa thùng mì, ôm một xấp hóa đơn chưa kẹp._
    ke_toan: *(nhìn bạn, ánh mắt "bà phản tui hả")*
    ~ qh("ke_toan", -10)
    ~ cd_nk(5)
- _Trong phòng họp, Chú Liêm mở cặp, đọc danh sách: "Một: bản gốc giấy tờ thành lập năm 2010. Hai: hợp đồng tài trợ với BTT Global. Ba: bằng chứng nghiệm thu dự án quảng cáo tháng 6. Bốn: nguồn gốc khoản 5 tỷ."_
_{giam_doc} vã mồ hôi. {sales} vã mồ hôi. {chua_te_deadline} vã mồ hôi. Ba người, ba lý do khác nhau._
-> END

// ------------------------------------------------------------
=== chi_dai_2210_che_huyen ===
# ngay:22 # gio:14:00 # noi:phong_hop_tang_2
_Chiều. Đoàn thuế hỏi tới mục hai: hợp đồng BTT Global. {sales} đứng dậy, rồi ngồi xuống, rồi đứng dậy._
sales: Dạ… hợp đồng… bên đó đang… đang ký điện tử ạ. Mr. Kevin Trộn đi công tác…
chu_liem: Tôi tra mã số thuế BTT Global rồi. Không có.
_{sales} nhìn quanh. Mắt dừng ở bạn. Ánh mắt "cứu em"._
* [🛡️ "Dạ chú, hợp đồng tài trợ là bên sự kiện con giữ. Hồ sơ đang ở kho. Chiều mai con nộp bổ sung."]
    _Bạn nói chắc như đinh đóng cột. Chú Liêm ghi "nộp bổ sung". {sales} ngồi phịch xuống ghế._
    _Bạn không biết mình vừa đứng ra che cho một nhà tài trợ không có thật. Bạn chỉ biết đứa nhỏ nhất công ty đang run._
    ~ qh("sales", 15)
    ~ cd_bao_ke(de_sales)
    ~ cd_uy(3)
* [😶 Im lặng. Ai làm người đó chịu.]
    chu_liem: Tôi ghi nhận: hợp đồng chưa xác minh.
    _{sales} cúi đầu. Chiều đó {sales} ngồi trên sân thượng rất lâu._
    ~ qh("sales", -5)
* [💬 Kéo {sales} ra hành lang: "Nói thật với chị. Có BTT Global hông?"]
    sales: *(lí nhí)* …Không chị. Không có. Kevin Trộn… là em bịa.
    chi_dai: Được. Giờ vô đó nói "đối tác rút, em xin lỗi". Thật thì chú ấy còn nương tay.
    _{sales} vô nói thật. Chú Liêm nhìn {sales} một lúc, rồi ghi: "Hủy hợp đồng, không phát sinh nghĩa vụ thuế". Thở ra._
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", 10)
    ~ cd_uy(5)
- { cd_chan_doan_thue:
    _Cuối ngày, {ke_toan} nộp đủ hóa đơn. Đoàn thuế về lúc 5 giờ. {ke_toan} gục đầu xuống bàn, thì thầm: "Bà cứu tui một mạng."_
    ~ qh("ke_toan", 5)
}
_Lúc về, bạn thấy Bác {bac_bao_ve} đang lau một tập giấy tờ cũ ố vàng, cất vào túi nilon. Bạn không hỏi. Bác không nói._
-> END

// ------------------------------------------------------------
=== chi_dai_2310_chuan_bi_livestream ===
# ngay:23 # gio:14:00 # noi:sanh_cong_ty # bat_buoc
_Sinh nhật 31 tuổi của {sieu_nhan_hong}, kiêm livestream lớn. Sảnh tầng trệt thành sân khấu. Bánh kem hồng 3 tầng do {designer} thiết kế đang nằm trong tủ mát._
_Vấn đề: kịch bản có đoạn "nhà tài trợ BTT Global lên chúc mừng". Nhà tài trợ không có thật. Cần người đóng vai Mr. Kevin Trộn._
sales: *(van nài)* Chị ơi… chị chọn giùm em một người…
* [🤝 {thuc_tap_sinh}: vest cũ, cà vạt, nói giọng ngân hàng.]
    thuc_tap_sinh: Dạ… em mặc vest được ạ. Em… em từng mặc vest đi làm 6 năm ạ.
    _{thuc_tap_sinh} mặc vest vào. Dáng đứng thay đổi hẳn. Ai cũng nhìn. Ai cũng lạ._
    ~ cd_kevin_tron = "thuc_tap_sinh"
    ~ qh("thuc_tap_sinh", 5)
* [🧂 {dan_dau_tu}: "Anh nói chuyện tiền giỏi nhất công ty."]
    dan_dau_tu: Lần này là lên thật! Kevin Trộn sẽ nói về… blockchain bánh tráng!
    ~ cd_kevin_tron = "dan_dau_tu"
    ~ qh("dan_dau_tu", 5)
* [🍵 Bác {bac_bao_ve}: "Người ta nhìn bác là tin."]
    bac_bao_ve: *(đặt ly trà xuống, rất lâu)* Bác… đóng ông Tây à?
    chi_dai: Ông Tây gốc Bắc. Đại diện thị trường châu Á.
    bac_bao_ve: Thế à. Ừ. Thế thì bác đóng. Mấy câu thôi nhé.
    ~ cd_kevin_tron = "bac_bao_ve"
    ~ qh("bac_bao_ve", 5)
- _Bạn quay sang việc thứ hai, việc khó nhất: {cho}. Bác {bac_bao_ve} đã nhốt {cho} trong chòi. Nhưng {cho} đã từng mở được cửa chòi 4 lần trong tháng này._
* [📻 Giao {thuc_tap_sinh} canh {cho} qua bộ đàm, kèm 3 cây xúc xích.]
    ~ nhan(xuc_xich)
    thuc_tap_sinh: Dạ rõ chị! {cho} ở đâu em ở đó ạ!
    ~ cd_td(2)
* [🍖 Tự mang xúc xích trong túi áo. Không tin ai hết.]
    ~ nhan(xuc_xich)
    ~ tien_cong(-20000)
- -> END

// ------------------------------------------------------------
=== chi_dai_2310_banh_kem ===
# ngay:23 # gio:19:30 # noi:sanh_cong_ty # bat_buoc
~ cd_dang_quay = true
~ cd_livestream_on = true
_Livestream đang chạy. 10.000 người xem. {hong_hot} cầm máy. {sieu_nhan_hong} vừa nhận lời chúc từ "Mr. Kevin Trộn"._
{
- cd_kevin_tron == "bac_bao_ve":
    _Bác {bac_bao_ve} trong bộ vest, đọc đúng ba câu, giọng Bắc chậm rãi: "Chúc mừng sinh nhật. Làm việc tốt. Ngủ đúng giờ." Bình luận nổ tung: "Ông Kevin này thật quá!", "Kevin Trộn gốc Hà Nội hả?"._
    ~ follow(15000)
- cd_kevin_tron == "thuc_tap_sinh":
    _{thuc_tap_sinh} trong vest nói như một giám đốc ngân hàng thật, trôi chảy, chắc chắn. Bình luận: "Ông Kevin này đẹp trai ghê", "Ủa nhìn quen quen"._
    ~ follow(10000)
- else:
    _{dan_dau_tu} nói về "blockchain bánh tráng" 4 phút. Bình luận: "Ủa coin $HONG đâu?", "Anh này có liên quan Hồng Coin không?"._
    ~ follow(5000)
}
_Rồi {sieu_nhan_hong} cầm micro, quay sang góc phòng, nơi {chua_te_deadline} đang lướt điện thoại._
sieu_nhan_hong: {chua_te_deadline} ơi. Anh thích em. Không phải PR đâu. Em trả lời anh đi!
_Bình luận chạy như thác: "\#VũƠiTrảLờiĐi". {chua_te_deadline} đứng như tượng, màn hình điện thoại vẫn đang chạy một video mèo._
~ follow(20000)
_Rồi bánh kem hồng 3 tầng được đẩy ra. Ở cuối sảnh, {cho} hạ thấp người. Mắt dán vào chiếc mũ hồng trên đầu {sieu_nhan_hong}._
thuc_tap_sinh: *(bộ đàm)* Dạ chị ơi, {cho} thoát rồi ạ! # hen_gio:3
* {co(xuc_xich)} [🍖 Ném xúc xích về phía ngược lại.]
    ~ mat(xuc_xich)
    _{cho} quay đầu giữa không trung, phi theo cây xúc xích. Bánh kem an toàn. {sieu_nhan_hong} thổi nến. 10.000 người hát chúc mừng._
    ~ cd_td(5)
    ~ follow(60000)
* [🦁 Hét: "{cho}! NGỒI!"]
    ~ cd_nk(15)
    { RANDOM(1, 10) <= 5:
        _{cho} phanh gấp, ngồi xuống ngay giữa sân khấu, ngẩng đầu nhìn bạn. Bình luận: "CHỊ ĐẠI HUẤN LUYỆN CHÓ!", "Người thuần chó!"._
        ~ follow(80000)
        ~ cd_uy(8)
        ~ qh("cho", 5)
    - else:
        _{cho} giật mình, lao thẳng vào bánh. Ba tầng kem hồng đổ ụp. {sieu_nhan_hong} dính kem đầy mũ, đứng cười trong đống kem như một cái bánh biết đi._
        _Clip "{cho} phá bánh" lan khắp Tóp-tóp._
        ~ follow(90000)
        ~ scandal()
    }
* [🛡️ Lao người ra chắn trước xe bánh.]
    _{cho} húc vào bạn. Bạn ngã ngửa ra sau, ôm trọn cái bánh vào áo. Kem hồng từ cằm xuống bụng. {sieu_nhan_hong} và chiếc mũ không dính một vết._
    _Bình luận: "Chị này là ai mà ngầu vậy?", "Ăn bánh bằng cả người luôn"._
    ~ cd_uy(10)
    ~ cd_met(15)
    ~ follow(60000)
    ~ qh("sieu_nhan_hong", 10)
* [⏱️ (Không chọn kịp)]
    _{cho} nhảy lên. Không nhắm vào bánh. Nhắm vào chiếc mũ. Một cú giật. Chiếc mũ hồng bay khỏi đầu {sieu_nhan_hong}._
    _{sieu_nhan_hong} lấy hai tay che mặt. 10.000 người đang xem._
    -> mat_that
- -> ket

= mat_that
~ cd_mat_that_tren_song = true
* [🧥 Cởi áo khoác, trùm lên đầu {sieu_nhan_hong}, kéo vào cánh gà.]
    _Hai giây. Không ai kịp chụp rõ. Chỉ thấy một chị mặc áo đen trùm áo khoác cho Siêu Nhân Hồng như vệ sĩ chuyên nghiệp._
    ~ follow(40000)
    ~ qh("sieu_nhan_hong", 15)
    ~ cd_uy(8)
* [🗣️ Hét vào bộ đàm: "{hong_hot}! TẮT MÁY!"]
    _{hong_hot} tắt máy. Muộn 4 giây. Ảnh chụp màn hình gương mặt mờ mờ của {sieu_nhan_hong} bắt đầu lan đi. Có người khen đẹp, có người chê thường._
    ~ follow(50000)
    ~ scandal()
    ~ cd_nk(20)
- -> ket

= ket
{ cd_vua_no:
    _Bạn nghe tiếng máu dồn lên tai. Nộ Khí chạm đỉnh. Ngay trước ống kính._
    ~ cd_vua_no = false
    -> chi_dai_tudo_bung_no
}
~ cd_dang_quay = false
~ cd_livestream_on = false
-> END

// ------------------------------------------------------------
=== chi_dai_2310_sau_livestream ===
# ngay:23 # gio:21:30 # noi:sau_choi_bao_ve
_Livestream tắt. Sảnh tan. Bạn ra sau chòi bảo vệ thay áo. Ở đó, {sieu_nhan_hong} đang ngồi bệt dưới đất, mũ đặt bên cạnh, mặt thật, cầm cái khăn Bác {bac_bao_ve} đưa._
sieu_nhan_hong: *(giọng nhỏ, khác hẳn trên sóng)* Chị Đại… {chua_te_deadline} không trả lời tui. Nó tưởng là PR.
_Một tin nhắn trên điện thoại {sieu_nhan_hong}, của ai đó: "Ủa Hồng Coin là của anh hả? Sao có coin tên anh?"_
sieu_nhan_hong: Tui còn không biết coin là gì.
* [😇 Ngồi xuống cạnh: "Người ta tưởng PR vì ông tỏ tình trước 10.000 người. Lần sau nói riêng."]
    sieu_nhan_hong: Nói riêng… tui không dám. Đội mũ thì tui dám.
    chi_dai: Vậy đội mũ mà nói riêng. Có ai cấm đâu ông.
    sieu_nhan_hong: *(bật cười)* Chị nói đúng ghê.
    ~ qh("sieu_nhan_hong", 10)
* [🛡️ "Thằng {chua_te_deadline} mà làm ông khóc thì chỉ mặt tui."]
    sieu_nhan_hong: Đừng chị Đại! Nó… nó không có lỗi. Nó chỉ… chưa hiểu thôi.
    _{sieu_nhan_hong} nói câu đó như bảo vệ một người trong nhà._
    ~ qh("sieu_nhan_hong", 5)
    ~ qh("chua_te_deadline", -3)
* [💬 "Cậu ăn sinh nhật một mình hả? Còn miếng bánh nào hông?"]
    sieu_nhan_hong: Còn một miếng trong hộp. Nhà tui có cái bàn 12 ghế mà tui ngồi một mình. Quen rồi.
    chi_dai: Chủ nhật này qua nhà tui. Bàn tui có 8 ghế, mà hay thiếu ghế.
    ~ qh("sieu_nhan_hong", 12)
- -> END

// ------------------------------------------------------------
=== chi_dai_2410_hoi_nghi ===
# ngay:24 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Ngày Liên Hợp Quốc. Bạn tổ chức "Hội nghị hòa giải". Phòng họp xếp thành từng cặp bàn đối mặt, như phòng thi._
_Cặp 1: {truong_phong} – {con_ong_chau_cha}. Cặp 2: {designer} – {bien_kich}. Cặp 3: {sales} – {ke_toan}. Cặp 4: {hr} – {thanh_xin_nghi}._
_Và một bàn riêng ở góc, có biển "BÀN CHỦ NỢ": {dan_dau_tu} ngồi một mình, đối diện 7 cái ghế._
_Luật: không ai được về trước khi bắt tay._
truong_phong: Mình có thể họp nhanh 5 phút về quy trình hòa giải không?
* [🦁 "Không. Bắt tay trước, họp sau."]
    _{truong_phong} và {con_ong_chau_cha} bắt tay. Rất ngượng. {con_ong_chau_cha} nói nhỏ: "Anh không muốn cái ghế đó đâu." {truong_phong} không tin. Nhưng nghe._
    ~ cd_uy(4)
* [😇 "Được. 5 phút. Bấm giờ."]
    _Đúng 5 phút, bạn thổi còi. Lần thứ hai trong tháng {truong_phong} họp đúng giờ. Anh có vẻ tự hào._
    ~ qh("truong_phong", 5)
- _Cặp 2 cãi nhau về "ai nghĩ ra cái slogan Đêm Hồng". Cặp 3 cãi nhau về hóa đơn tiếp khách. Cặp 4 cãi nhau về giấy nghỉ ốm thứ 9._
_Ở bàn chủ nợ, {dan_dau_tu} vừa hứa trả {sales} 5 triệu "sau Đêm Hồng"._
* [📋 Đi từng bàn, mỗi bàn một câu, không ai được rời ghế.]
    chi_dai: {designer}, slogan của em. {bien_kich}, em sửa câu thứ hai cho hay hơn. Xong.
    chi_dai: {ke_toan}, bà duyệt 2 triệu tiếp khách. {sales}, em nộp hóa đơn trước thứ 2. Xong.
    chi_dai: {hr}, ông cho {thanh_xin_nghi} nghỉ 31/10 buổi tối. {thanh_xin_nghi}, em làm bù chủ nhật. Xong.
    _Mười phút. Bốn cặp bắt tay. Không ai bỏ về._
    ~ cd_hoa_giai_ok = true
    ~ cd_uy(10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
* [😶 Để mọi người tự cãi. Cãi xong tự hòa.]
    _Một tiếng sau, {designer} đứng dậy bỏ về. Rồi {thanh_xin_nghi}. Rồi {dan_dau_tu} (vì chủ nợ ngồi kín bàn)._
    ~ cd_nk(10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 2
- ke_toan: *(chỉ vào ghế trống cuối cùng)* Bà làm chủ tọa thì bà cũng phải hòa giải. Ngồi xuống đi. {thanh_ninh} ngồi đối diện đó.
-> chi_dai_2410_hoa_giai_nhi

// ------------------------------------------------------------
=== chi_dai_2410_hoa_giai_nhi ===
# ngay:24 # gio:10:30 # noi:phong_hop_sang_tao
_Bạn ngồi xuống. Đối diện là {thanh_ninh}. Mắt thâm quầng. Bàn tay bấu vào nhau._
thanh_ninh: Dạ… em chào chị {chi_dai} ạ.
* [🤝 "Chị ghét em vì em nịnh. Nhưng chị biết em mệt. Em muốn gì ở công ty này, nói thật đi."]
    _{thanh_ninh} im lặng. Rồi khóc. Không phải khóc nịnh. Khóc thật, nước mắt rơi xuống tờ giấy bút bi._
    thanh_ninh: Em… em đi phỏng vấn bên LL. Em tưởng làm trợ lý. Mà mai ông Lưu Lực tự phỏng vấn em… em sợ ổng muốn cái khác.
    thanh_ninh: Em nịnh vì em sợ bị bỏ lại. Ở đây ai cũng có người bênh. Em không có ai hết.
    ~ qh("thanh_ninh", 30)
    ~ cd_nk(-20)
    ~ cd_hoa_voi_nhi = true
    ~ cd_thay_nhi_o_ll = true
* [🦁 "Chị không hòa. Chị ngồi đây vì {ke_toan} bắt."]
    _Cả phòng cười. {thanh_ninh} cũng cười, gượng gạo. Không đổi gì, nhưng "đúng chất"._
    ~ cd_uy(5)
* [🍚 "Thôi khỏi nói. Chủ nhật này về nhà chị ăn cơm."]
    _{thanh_ninh} sững người. Rất lâu._
    thanh_ninh: Dạ… em? Nhà chị?
    chi_dai: Ừ. Em. Ăn được cá lóc hông?
    thanh_ninh: *(gật, mắt đỏ)* Dạ được ạ.
    _Lần đầu tiên {thanh_ninh} được ai đó rủ ăn cơm mà không phải sếp._
    ~ cd_moi_nhi_an_com = true
    ~ qh("thanh_ninh", 15)
* {cd_co_thop_nhi} [🔒 "Chị không nói chuyện tòa nhà xanh lá chuối với ai hết. Em biết mà."]
    thanh_ninh: *(ngẩng lên)* Chị… chị giữ cho em hả?
    chi_dai: Chị giữ. Vì chị muốn em tự chọn, không phải vì bị ai nắm thóp.
    ~ qh("thanh_ninh", 20)
    ~ cd_hoa_voi_nhi = true
- _Ngoài hành lang, điện thoại cả phòng cùng rung. Clip {idol_het_thoi} hát "Công Viên" trong bóng tối ngày mất điện đang lên xu hướng. Cùng lúc, một trang tin bóc "fan ảo 80.000 tài khoản" của một ca sĩ cũ. Chưa ai biết là ai._
-> END

// ------------------------------------------------------------
=== chi_dai_2510_chu_nhat ===
# ngay:25 # gio:09:00 # noi:cho_pho_cu
_Chủ nhật. Chợ Phố Cũ. Hôm nay là ngày nấu cơm đãi khách._
{ cd_moi_nhi_an_com:
    _Bạn đã hẹn {thanh_ninh}. 11 giờ. {thanh_ninh} nhắn từ sáng sớm: "Dạ em tới được ạ. Chiều em có hẹn bên Ven Đô, em đi sau ạ."_
    ~ cd_khach_com = "thanh_ninh"
    -> chi_dai_mg_com_nha_mo_dau
}
_Bạn mời ai tối nay?_
* [🐣 {thuc_tap_sinh}: lâu rồi chưa được ăn cơm nhà.]
    ~ cd_khach_com = "thuc_tap_sinh"
* [🩷 {sieu_nhan_hong}: người có cái bàn 12 ghế.]
    ~ cd_khach_com = "sieu_nhan_hong"
* [📞 {quan_ly_idol}: dạo này mặt anh như sắp đi đâu xa.]
    ~ cd_khach_com = "quan_ly_idol"
* [🦉 {editor}: thức đêm cả tháng, bỏ bữa cả tháng.]
    ~ cd_khach_com = "editor"
- -> chi_dai_mg_com_nha_mo_dau

// ------------------------------------------------------------
=== chi_dai_2610_chieu_thu_phim ===
# ngay:26 # gio:15:00 # noi:phong_hop_sang_tao # bat_buoc
_Chiếu thử nội bộ phim ngắn "Người Hùng Không Tên". 15 phút. Biên kịch: {bien_kich}._
_Trên màn hình: một nhân viên ngân hàng bỏ việc trong ngày mưa, xe chết máy, và một người mặc đồ hồng đẩy xe giùm anh 2 cây số._
_Bạn liếc sang. {thuc_tap_sinh} ngồi bất động. Nước mắt chảy dài. Môi mấp máy: "Chuyện… chuyện của em…"_
* [🛡️ Chờ phim hết, đứng dậy: "Ý tưởng này của {thuc_tap_sinh}. Tháng 9. Chị nghe nó kể."]
    _Cả phòng quay sang {bien_kich}. {bien_kich} mở miệng: "Đây không phải đạo, đây là…" rồi dừng lại._
    bien_kich: …Đúng. Ý tưởng của {thuc_tap_sinh}. Em xin lỗi.
    giam_doc: Vậy thì phim ghi "Ý tưởng: {thuc_tap_sinh}, Biên kịch: {bien_kich}" nhé. "Fair" mà.
    ~ qh("thuc_tap_sinh", 15)
    ~ qh("bien_kich", -10)
    ~ cd_uy(8)
    ~ cd_bao_ke(de_thuc_tap_sinh)
* [💬 Ra hành lang nói riêng với {bien_kich}: "Em tự nói. Trước 27. Không thì chị nói."]
    bien_kich: *(cắn môi)* Mai trailer ra rồi chị…
    chi_dai: Vậy thì nói hôm nay.
    _{bien_kich} không trả lời. Bạn không biết em có nói không._
    ~ qh("bien_kich", -3)
* [🤝 Ngồi yên, đưa {thuc_tap_sinh} gói khăn giấy. Chuyện này để nó tự quyết.]
    thuc_tap_sinh: Dạ… em không sao chị. Em chỉ… nhớ người đẩy xe cho em hôm đó. Em chưa kịp cảm ơn.
    _Ở hàng ghế đầu, {sieu_nhan_hong} ngồi im, chiếc mũ cúi xuống thấp hơn bình thường._
    ~ qh("thuc_tap_sinh", 8)
- -> END

// ------------------------------------------------------------
=== chi_dai_2610_tin_don_cat_giam ===
# ngay:26 # gio:17:30 # noi:san_thuong
_Hạn chót danh sách 7 tên của {giam_doc}. Tin đồn đã lan khắp công ty. Sân thượng chật người hút gió, ai cũng thì thầm._
_{editor} ngồi một góc, cầm điện thoại: tin nhắn của {giam_doc}: "Anh trả 200 triệu, mua lại kênh Cú Đêm của em nhé. Cho công ty."_
editor: Chị… em không bán. Mà em không bán thì em có trong danh sách hông chị?
* [🛡️ "Không bán. Ai gạch tên em vì chuyện đó thì gặp chị."]
    editor: *(thở ra)* Dạ. Em cảm ơn chị.
    ~ qh("editor", 10)
    ~ cd_bao_ke(de_editor)
* [💬 "Em muốn bán hông? Bỏ qua chuyện danh sách. Em muốn gì?"]
    editor: Em muốn… giữ nó. Đó là chỗ duy nhất em dựng cái em thích.
    chi_dai: Vậy giữ. Chị nói với sếp: kênh đó của em, không phải của công ty.
    ~ qh("editor", 12)
- _Bạn mở điện thoại nhắn {hr}: "Mai ông có nộp danh sách hông?"_
{ cd_doi_chat_tuan:
    hr: *(trả lời sau 1 phút)* Anh nộp. Bảy dòng. Dòng nào cũng ghi "{hr}".
    _Bạn bật cười, lần đầu trong ngày._
    ~ qh("hr", 10)
- else:
    hr: *(đã xem)*
    ~ cd_nk(10)
}
_Đêm đó, một email lạ tới hộp thư {giam_doc}. Bạn không biết. Nhưng sáng mai, cả tòa nhà sẽ biết._
-> END

// ------------------------------------------------------------
=== chi_dai_2710_luu_luc_o_sanh ===
# ngay:27 # gio:10:00 # noi:sanh_cong_ty # bat_buoc
_10 giờ sáng. Một chiếc xe xanh lá chuối đậu ngay cổng. Một người bước xuống: vest trắng, tóc vuốt keo bóng như gương, tay cầm cặp hồ sơ da._
_Lưu Lực. CEO LL-Entertainment. Bước vào sảnh như bước lên sân khấu._
_Rồi Lưu Lực thấy bạn, đang đứng ở quầy lễ tân, bộ đàm bên hông._
_Cặp hồ sơ rơi xuống sàn. Giấy văng ra cả sảnh._
luu_luc: *(nhặt cặp hồ sơ, mồ hôi chảy qua lớp keo tóc)* Ờ… chào chị. Tôi tới gặp anh {quan_ly_idol} và Siêu Nhân Hồng. Chị là… trưởng nhóm sự kiện à?
_Giọng nói này. Giọng như diễn giả. "Em sẽ thành người thành công…"_
* [😶 "Ừ. Anh tìm ai thì lên tầng 2."]
    _Lưu Lực gật đầu lia lịa, đi lên cầu thang, hai lần suýt vấp. Hợp đồng gấp ba được đưa tới tay {sieu_nhan_hong} như bình thường._
* [🕵️ "Ủa, mình gặp nhau ở đâu rồi phải hông? Nhìn anh quen quen."]
    luu_luc: *(ho sặc sụa)* Khụ… khụ! Không… chắc không! Tôi… tôi có hẹn gấp! Tôi về đây! Hẹn ngày mai!
    _Lưu Lực quay đầu đi thẳng ra xe, quên luôn một tờ giấy dưới gầm ghế sảnh. Lời mời bị hoãn 1 ngày._
    ~ cd_ll_hoan_1_ngay = true
    ~ cd_uy(5)
* {cd_tim_thay_anh_cu && cd_hoi_bac_binh} [🔒 "Quán Ốc Đêm, 10 năm trước, tô ốc len. Tóc anh giờ đẹp ha."]
    -> nhan_ra
- -> END

= nhan_ra
~ cd_nhan_ra_ll = true
_Lưu Lực tái mặt. Tái thật. Lớp keo tóc như chảy xuống theo._
luu_luc: Chị… chị nhớ.
chi_dai: Hồi nãy thì chưa. Giờ thì nhớ. "Em sẽ thành người thành công, chị sẽ hối hận." Anh thành công rồi đó. Tui chưa hối hận.
luu_luc: *(lùi một bước)* Tám năm nay tôi câu người của G… trừ chị. Chị biết tại sao không?
chi_dai: Biết rồi.
* [🦁 "Anh rút lời mời với Siêu Nhân Hồng. Hôm nay. Không thì cả quận này nghe lại chuyện tô ốc, có ảnh."]
    luu_luc: *(nuốt nước bọt)* Chị… chị đang đe dọa tôi?
    chi_dai: Không. Tui đang kể chuyện. Chuyện thì ai kể cũng được.
    _Lưu Lực rút điện thoại, nhắn một tin. Rồi gật đầu. Một lần. Rồi đi thẳng ra xe._
    ~ cd_ep_ll_rut = true
    ~ nguyen_theo_ll = false
    ~ cd_uy(15)
    ~ phat_hien(ll_moi_nguyen)
* [🤫 "Anh cứ lên tầng 2. Tui không nói gì hết. Tui giữ chuyện này… tới Đêm Hồng."]
    luu_luc: *(nhìn bạn, lần đầu không cười)* Chị muốn gì?
    chi_dai: Tui chưa biết. Lúc nào biết tui gọi.
    _Lưu Lực lên tầng 2, nhưng đi như người đang bị theo dõi. Bạn có một cái thóp lớn nhất quận Hóng._
    ~ cd_giu_thop_ll = true
    ~ cd_uy(8)
- -> END

// ------------------------------------------------------------
=== chi_dai_2710_sau_cuoc_gap ===
# ngay:27 # gio:14:00 # noi:tang_2
_Buổi chiều. Cả tầng 2 thì thầm: Lưu Lực mời {sieu_nhan_hong} gấp ba. Mời {quan_ly_idol} 36 triệu một tháng. Mời {ke_toan} làm kế toán trưởng. Ai cũng có một phong bì xanh lá chuối._
_Trailer phim ngắn vừa ra mắt trên fanpage. Đề tên: "Biên kịch: {bien_kich}"._
{ cd_ep_ll_rut:
    _Riêng phong bì của {sieu_nhan_hong} thì không có. Lưu Lực rút lại trước khi tới tay. Không ai hiểu vì sao. Trừ bạn._
    _{sieu_nhan_hong} gặp bạn ở cầu thang, nghiêng đầu: "Chị ơi, ổng nói 'xin lỗi chị {chi_dai}' rồi bỏ về. Chị làm gì ổng vậy?"_
    chi_dai: Chị kể chuyện cổ tích cho ổng nghe.
    -> END
}
_{ke_toan} đứng ở cửa phòng kế toán, tay cầm phong bì xanh lá chuối, nhìn bạn._
ke_toan: Gấp đôi lương. Kế toán trưởng. Văn phòng có cửa sổ.
* [🤝 "Bà muốn đi thì đi. Tui không giận. Tui chỉ buồn."]
    ke_toan: *(xé phong bì làm đôi)* Bà nói câu đó thì tui đi kiểu gì.
    ~ qh("ke_toan", 15)
* [🦁 "Đi đâu? Bà đi rồi ai cắt ngân sách của tui?"]
    ke_toan: *(bật cười, bỏ phong bì vào thùng rác)* Ờ ha. Ai mà cắt cho đã tay như tui.
    ~ qh("ke_toan", 10)
* [😶 Không nói gì. Đứng đợi.]
    _{ke_toan} nhìn phong bì rất lâu. Rồi cất vào ngăn kéo. Không xé. Không mở._
    ~ qh("ke_toan", -3)
- -> nguyen_mot_minh

= nguyen_mot_minh
_Ở cuối hành lang, {sieu_nhan_hong} ngồi một mình, phong bì gấp ba đặt trên đùi, chưa mở._
* [💬 Đi tới ngồi xuống: "Ông muốn ở đâu? Hông phải ở đâu nhiều tiền."]
    sieu_nhan_hong: Tui… tui muốn ở chỗ có người nhớ tên tui. Bên kia chắc không ai nhớ.
    chi_dai: Ở đây tui nhớ. Nguyễn {sieu_nhan_hong}.
    _{sieu_nhan_hong} ngẩng lên. Lần đầu tiên có người trong công ty gọi đủ họ tên._
    ~ qh("sieu_nhan_hong", 15)
* [😶 Để {sieu_nhan_hong} tự quyết.]
    _Bạn đi qua. Có những quyết định chị Đại cũng không đứng chắn được._
- -> END

// ------------------------------------------------------------
=== chi_dai_2710_sua_chua_hong_hao ===
# ngay:27 # gio:16:30 # noi:tang_1
_{sales} chạy vào phòng, điện thoại trên tay, mặt đỏ bừng._
sales: Mấy anh chị! Bên Sữa Chua Hồng Hào ở Ven Đô gọi! Họ muốn tài trợ Đêm Hồng 1 tỷ! Thật! Lần này thật!
_Cả phòng im lặng. Rồi {hong_hot} cười. Rồi {dan_dau_tu} cười. Rồi cả phòng cười._
truong_phong: Thôi em, BTT Global cũng "thật" mà.
_{sales} đứng giữa phòng, điện thoại vẫn sáng: "Hồng Hào - Phòng Marketing"._
* [🤝 "Đưa chị số. Chị gọi lại."]
    _Bạn gọi. Một chị nói giọng Ven Đô, rất thật: "Dạ, bên em thích clip giúp bà cụ. Bên em muốn tài trợ Đêm Hồng ạ. Mai em qua ký."_
    _Bạn cúp máy. Nhìn cả phòng. Cả phòng thôi cười._
    chi_dai: Thật.
    sales: *(òa khóc)* Lần đầu tiên em nói thật mà không ai tin…
    ~ cd_tin_sua_chua = true
    ~ cd_td(10)
    ~ qh("sales", 15)
    ~ cd_bao_ke(de_sales)
* [😶 Cười theo. Một tháng nghe {sales} nói phét rồi.]
    _{sales} ra sân thượng. Sữa Chua Hồng Hào gọi lại hai lần. Không ai nghe máy._
    ~ qh("sales", -5)
- -> END
