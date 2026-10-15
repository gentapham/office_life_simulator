// ============================================================
// HR: TUẤN · CHƯƠNG 1: "NỤ CƯỜI BẮT BUỘC" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== hr_0110_may_cham_cong ===
# ngay:1 # gio:07:55 # noi:tang_tret # bat_buoc
_7 giờ 55. Bạn đứng cạnh máy chấm công, áo sơ mi ủi phẳng, tay cầm ly trà atiso còn bốc khói._
_Đây là vị trí quen thuộc của bạn suốt 7 năm. Cũng là lý do 7 năm nay không ai dám đi ngang máy chấm công mà ngẩng mặt lên._
bac_bao_ve: Cháu Tuấn đứng đấy từ 7 rưỡi rồi à? Hôm nay ký cái hợp đồng to lắm hả?
hr: Dạ, 5 tỷ đó bác. Mà bác ơi, hôm nay Quốc tế Người cao tuổi, trưa nay cả công ty mừng bác nha.
bac_bao_ve: Ơ thôi. Bác có già đâu. Bác mới 50.
_{thuc_tap_sinh} chạy vào lúc 7 giờ 56, thấy bạn, khựng lại như gặp ma._
thuc_tap_sinh: Dạ… dạ em chào anh Tuấn ạ! Em… em có làm gì sai không ạ?
* [😊 Cười thật tươi: "Có gì đâu em, anh đứng chơi thôi."]
    ~ hr_so(3)
    ~ hr_so_nguoi_chay = hr_so_nguoi_chay + 1
    _{thuc_tap_sinh} chấm công bằng ngón tay run run, cúi chào 3 lần rồi chạy thẳng lên cầu thang._
    bac_bao_ve: Cháu cười thế thì đến bác cũng sợ.
* [🍵 Đưa ly trà: "Em uống trà atiso hông? Mát gan lắm."]
    ~ hr_tra()
    ~ qh("thuc_tap_sinh", 5)
    thuc_tap_sinh: Dạ… dạ em cảm ơn anh. Em uống liền ạ!
    _{thuc_tap_sinh} uống một hơi hết ly trà nóng, mặt đỏ như tôm luộc, nhưng vẫn cố cười._
    ~ hr_nghe(2)
* [😶 Quay mặt đi chỗ khác cho em nó đỡ sợ.]
    ~ hr_so(-2)
    _{thuc_tap_sinh} chấm công xong, thở phào. Lần đầu tiên có người đi qua máy chấm công mà không run._
- _8 giờ 00. Máy chấm công kêu "tít" lần cuối. {chua_te_deadline} vẫn chưa thấy đâu._
-> END

// ------------------------------------------------------------
=== hr_0110_ho_so_hieu ===
# ngay:1 # gio:08:20 # noi:phong_hr # bat_buoc
_Phòng HR tầng 2. Cái bàn gọn như sách giáo khoa, kệ trà 12 loại mang từ nhà lên. Nhân viên mới ngồi đối diện bạn._
ran_doc: Dạ em chào anh. Em là {ran_doc}, hôm nay em đi làm ngày đầu ạ.
hr: Chào em. Ngồi đi em. Mình làm hồ sơ nhanh thôi nha. Giấy khám sức khỏe, sơ yếu lý lịch, ảnh 3x4.
_{ran_doc} đưa tập giấy. Mọi thứ sạch sẽ, đầy đủ, đóng ghim ngay ngắn. Gọn tới mức đáng ngờ._
_Ở mục "Địa chỉ thường trú cũ", {ran_doc} ghi: "Xóm Cây Me"._
* [💬 "Xóm Cây Me hả? Tên dễ thương ghê. Ở đâu vậy em?"]
    ~ hr_biet_xom_cay_me = true
    ran_doc: *(khựng lại nửa giây)* Dạ… xóm nhỏ thôi anh, giờ giải tỏa rồi. Không còn ai ở đó nữa đâu ạ.
    _Nửa giây. Làm HR 7 năm, bạn biết nửa giây đó nặng cỡ nào._
    -> hr_0110_ho_so_hieu.s_tra_sua
* [📓 "Em ghi thiếu số điện thoại người thân nè."]
    ran_doc: Dạ… em không có ai để ghi hết anh.
    hr: À… ờ. Vậy để trống cũng được em.
    ~ hr_nghe(3)
    -> hr_0110_ho_so_hieu.s_tra_sua
* [😊 "Hồ sơ đẹp quá. Em làm HR được luôn á."]
    ~ hr_so(2)
    ran_doc: Dạ em cảm ơn anh. *(cười, nhưng mắt không cười)*
    -> hr_0110_ho_so_hieu.s_tra_sua

= s_tra_sua
ran_doc: Anh Tuấn, trưa nay em mời anh ly trà sữa nha. Ngày đầu đi làm, em muốn làm quen mọi người.
* [😇 "Ừ, cảm ơn em. Mà anh uống ít đường thôi."]
    ~ qh("ran_doc", 5)
    ~ tien_cong(100000)
    ~ nhan(tra_sua)
    _Hồ sơ xong. Phòng nhân sự thưởng 100.000đ cho mỗi bộ hồ sơ hoàn thiện đúng hạn. Ly trà sữa tới lúc 10 giờ, ít đường thật._
* [🍵 "Thôi em, để anh mời em trà. Anh có 12 loại ở đây nè."]
    ~ hr_tra()
    ~ qh("ran_doc", 3)
    ~ tien_cong(100000)
    ran_doc: Dạ… thôi em xin ly nước lọc thôi ạ. Nghe nói ai uống trà phòng anh là… à không có gì ạ.
    ~ hr_so(2)
- -> END

// ------------------------------------------------------------
=== hr_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2 đông nghẹt. Một người mặc nguyên bộ đồ siêu nhân màu hồng đang tạo dáng trước tập hợp đồng 52 trang._
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
giam_doc: Vỗ tay nào các em! Hôm nay là ngày lịch sử của {cong_ty}!
_Bạn đứng sát tường, chỗ của HR: đủ gần để vỗ tay, đủ xa để không bị ai nhìn thấy cười._
_Bạn thấy {ke_toan} nghiêng người thì thầm gì đó với {giam_doc}. Bạn chỉ nghe được ba chữ: "…trang 47…"._
giam_doc: Thôi em, đối tác đang chờ. Anh ký đây.
_Bút ký. 5 tỷ về tài khoản. Cả phòng hò reo. {hong_hot} đã livestream từ lúc nào._
* [🤝 Lại gần hỏi nhỏ {ke_toan}: "Trang 47 có gì vậy bà?"]
    ke_toan: *(nhìn bạn rất lâu)* Không có gì. Ông lo hồ sơ của ông đi.
    _Giọng {ke_toan} bình thường. Nhưng tay bả nắm chặt cây bút tới trắng cả khớp._
    ~ qh("ke_toan", 3)
* [😊 Vỗ tay theo, cười thật tươi.]
    ~ hr_so(2)
    sieu_nhan_hong: *(chỉ thẳng vô bạn)* Anh kia cười đẹp nè! Mà… sao anh cười giống bác sĩ chuẩn bị chích quá vậy?
    _Cả phòng cười. Bạn cười theo. Không ai biết bạn đang cười thật._
* [😶 Ra ngoài rót trà cho mọi người.]
    ~ hr_tra()
    _Bạn pha 2 ấm trà sen. Không ai uống, vì ai cũng đang bận chụp hình với Siêu Nhân Hồng. Chỉ có {bac_bao_ve} dưới cổng nhận một ly._
    ~ qh("bac_bao_ve", 3)
- -> END

// ------------------------------------------------------------
=== hr_0110_mung_bac_binh ===
# ngay:1 # gio:12:00 # noi:chong_bao_ve # bat_buoc
_Trưa. Cả công ty kéo nhau ra chòi bảo vệ với một ổ bánh bông lan và một tấm thiệp ghi "Mừng Ngày Người Cao Tuổi"._
_{bac_bao_ve} đứng giữa, tay cầm ly trà đá, mặt đỏ như gấc. {cho} đội một cái nơ hồng ai đó đã kịp gắn lên đầu._
chi_dai: Tuấn! HR phát biểu đi chớ, đứng đó cười hoài.
_21 cặp mắt quay qua bạn. Bạn nghe được tiếng ai đó nuốt nước miếng._
* [😇 Phát biểu từ trái tim: "Bác là người đầu tiên tới công ty, người cuối cùng tắt đèn. Tụi con cảm ơn bác."]
    ~ qh("bac_bao_ve", 10)
    ~ hr_nghe(5)
    ~ hr_so(-3)
    bac_bao_ve: *(ho một tiếng)* Thôi… thôi. Nói thế bác ngại lắm.
    _{bac_bao_ve} quay đi, giả vờ chỉnh lại cái radio. {chi_dai} gật gù nhìn bạn, lần đầu tiên không dọa đấm._
    ~ qh("chi_dai", 5)
* [🗣️ Ngôn ngữ nhân sự: "Mình cùng nhìn lại hành trình 16 năm gắn bó của bác nha."]
    ~ hr_so(3)
    bac_bao_ve: Ơ… 16 năm thì đúng rồi. Nhưng sao nghe như sắp cho bác nghỉ hưu thế?
    _Cả đám cười ồ. {bac_bao_ve} cười theo, nhưng hơi gượng._
* [🍵 Không nói gì, rót cho bác một ly trà sen nóng thay ly trà đá.]
    ~ hr_tra()
    ~ qh("bac_bao_ve", 6)
    bac_bao_ve: Ừ. Trà sen ngon. Lâu lắm rồi mới có người pha trà cho bác.
    hong_hot: Ủa, anh Tuấn mời trà mà không ai bị đuổi kìa! Ghi vô lịch sử công ty đi!
    ~ hr_so(-2)
- ~ an(20)
cho: Gâu! *(cắn một miếng bánh bông lan rồi chạy mất)*
-> END

// ------------------------------------------------------------
=== hr_0110_ho_so_hong ===
# ngay:1 # gio:15:30 # noi:phong_giam_doc # bat_buoc
_Phòng giám đốc vách kính. Mùi nước hoa đàn ông và mùi tiền mới. {giam_doc} vừa cúp điện thoại ngân hàng, mặt tươi rói._
giam_doc: Tuấn đấy à. Ngồi đi em. Em uống gì? À, em mang trà theo rồi. Thói quen tốt đấy.
_{giam_doc} đẩy qua bàn một tập hồ sơ. Màu hồng. Từ tháng 10, cái gì cũng phải hồng._
_Trang bìa: "PHƯƠNG ÁN TÁI CẤU TRÚC NHÂN SỰ (NẾU CHIẾN DỊCH THẤT BẠI)"._
giam_doc: Cái này chỉ là phương án dự phòng thôi. Anh tin Siêu Nhân Hồng. Nhưng 26/10 em cho anh 7 cái tên. Anh không ép, tùy em.
_Bên trong chỉ có đúng 1 trang. 21 cái tên, không kể {giam_doc}. Tên bạn không có trong đó._
* [☕ "Dạ sếp. Mình cùng nhìn lại hành trình của từng bạn rồi em gửi anh."]
    giam_doc: Tốt! Em hiểu anh nhất. Mindset của HR là phải thế.
    ~ qh("giam_doc", 5)
    ~ hr_han_chot = 7
* [🤝 "Anh ơi, mình cắt chi phí khác trước được không? Golf trên sân thượng chẳng hạn."]
    _{giam_doc} nhìn bạn rất lâu._
    giam_doc: Em nói chuyện giống Hương thế. Thôi được. 6 tên. Nhưng sân golf mini là để tiếp đối tác, em hiểu không?
    ~ qh("giam_doc", -5)
    ~ hr_han_chot = 6
    ~ hr_nghe(3)
* [😊 Cười. (Nụ Cười Nhân Sự)]
    _{giam_doc} rùng mình, tự rót trà cho mình, uống một ngụm, rồi tự rót thêm ngụm nữa._
    giam_doc: Em… em cười thế này với nhân viên à? Thảo nào.
    ~ hr_so(5)
* {qh_giam_doc >= 50} [🔒 "Anh, danh sách này có tên anh không?"]
    _{giam_doc} im lặng. Rồi cười to, to hơn mức cần thiết._
    giam_doc: Anh là giám đốc mà em! Giám đốc thì ai cắt?
    _Thắng đã né câu hỏi. Bạn ghi nhận. Bạn luôn ghi nhận._
    ~ hr_nghi_trang_2 = true
- ~ hr_ro_ri(5)
_Bạn ôm tập hồ sơ hồng ra khỏi phòng kính. Ở bàn trợ lý, {thanh_ninh} liếc theo màu hồng rất lâu._
* [🗝️ Về phòng, khóa tủ ngay.]
    ~ hr_khoa_tu = true
    ~ hr_ro_ri(-5)
    _Tủ hồ sơ khóa từ. Tít một tiếng. Tạm yên._
* [📂 Kẹp tập hồ sơ vào giữa xấp đơn xin nghỉ phép của {thanh_xin_nghi}. Ai mà lục chỗ đó.]
    ~ hr_ro_ri(5)
    _Xấp đơn của {thanh_xin_nghi} dày 3 cm. Một tập hồ sơ hồng nằm giữa trông… khá nổi bật._
- -> END

// ------------------------------------------------------------
=== hr_0110_dem_604 ===
# ngay:1 # gio:22:00 # noi:can_ho_604
_Căn 604. Kệ trà 40 loại sắp theo bảng chữ cái, từ Atiso tới trà Zzz. Bạn ngồi trước laptop, tách trà hoa cúc nguội từ lúc nào._
_Điện thoại rung. Group Zalo-lô công ty. {giam_doc}: "Hôm nay là ngày lịch sử. Mai 8h30 họp chiến dịch nhé cả nhà. Anh không ép."_
_14 người "đã xem". 0 người trả lời._
* [💬 Trả lời: "Dạ, cả nhà nghỉ ngơi sớm nha 😊"]
    ~ hr_so(3)
    _3 giây sau, 4 người rời khỏi trạng thái "đang hoạt động". Một cái emoji mặt cười của HR lúc 10 giờ đêm là thứ đáng sợ nhất trong group._
* [😶 Thả tim tin nhắn của sếp rồi úp điện thoại.]
    _Một trái tim. Vô hại. Bạn nghĩ vậy._
* [📺 Mở tivi xem "Giọng Ca Ước Mơ" cho đỡ nghĩ.]
    -> hr_0110_dem_604.s_tivi
- -> END

= s_tivi
_Đài Tivi Hóng đang chiếu lại tập tuyển chọn. Một thí sinh mặc đồ kim tuyến lấp lánh, trang điểm đậm, hát một bài ballad cũ._
_Nghệ danh trên màn hình: "SƠN KIM TUYẾN"._
_Bạn đặt tách trà xuống. Giọng hát đó làm bạn quên mất tập hồ sơ hồng trong cặp._
* [📱 Nhắn tin bình chọn. Một lần thôi.]
    ~ hr_so_lan_vote = hr_so_lan_vote + 1
    _"Cảm ơn quý khán giả đã bình chọn cho Sơn Kim Tuyến." Bạn mỉm cười. Ở một mình thì cười thoải mái, không ai sợ._
* [📱 Nhắn 5 lần. Giọng hay vầy mà.]
    ~ hr_so_lan_vote = hr_so_lan_vote + 5
    ~ tien_cong(-15000)
    _5 tin nhắn, 15.000đ. Bạn tự nhủ đây là "chi phí tinh thần", không cần hóa đơn._
- ~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== hr_0210_ngay_nu_cuoi ===
# ngay:2 # gio:07:55 # noi:tang_tret # bat_buoc
_Ngày Nụ cười Thế giới. Tối qua 22:05, {giam_doc} nhắn riêng cho bạn: "Mai ai chấm công cũng phải cười nhé. Em làm mẫu."_
_Bạn đứng cạnh máy chấm công. Bạn cười. Bạn cười hết sức._
_7 giờ 56: {thuc_tap_sinh} thấy bạn, quay đầu chạy ra bãi xe. 7 giờ 57: {designer} và {hong_hot} thấy bạn, nắm tay nhau quay đầu. 7 giờ 58: {editor} vốn không tính đi làm buổi sáng, đi ngang chỉ để mua bánh mì, thấy bạn, về nhà ngủ tiếp._
bac_bao_ve: Cháu Tuấn này. 4 đứa quay về rồi đấy. Cười ít thôi.
* [😊 Tiếp tục cười. Lệnh sếp mà.]
    ~ hr_so(8)
    ~ hr_so_nguoi_chay = hr_so_nguoi_chay + 4
    ~ hr_cuoi_may_cham_cong = "cuoi"
    _8 giờ 05. Bảng chấm công: 6 người trễ, 4 người "đang trên đường", 1 người ({thanh_xin_nghi}) cười gượng tới mức méo cả mặt._
    thanh_xin_nghi: Dạ… em cười nè anh. *(nhe răng)*
    _Bạn ghi vào sổ: "Nụ cười của người sắp xin nghỉ." Rồi tự thấy mình hơi quá._
* [😷 Đeo khẩu trang, chỉ cười bằng mắt.]
    ~ hr_so(-3)
    ~ hr_cuoi_may_cham_cong = "khau_trang"
    _Mọi người quay lại. Có người còn nói "chào anh" mà không lắp bắp. Hóa ra phân nửa nỗi sợ nằm ở cái miệng._
    bac_bao_ve: Ừ. Thế này được. Trông như bác sĩ, nhưng là bác sĩ hiền.
* [🤝 Nhờ {thuc_tap_sinh} đứng thay. Duy cười chuẩn nhân viên ngân hàng.]
    ~ hr_cuoi_may_cham_cong = "duy"
    ~ qh("thuc_tap_sinh", 5)
    thuc_tap_sinh: Dạ em làm liền ạ! *(cười một nụ cười 32 cái răng, chuẩn mực tới đáng ngờ)* Kính chào quý khách… à quý anh chị!
    _Ai đi qua cũng cười lại. Có người còn suýt hỏi "cho em rút 2 triệu". Bạn đứng phía sau, nhìn {thuc_tap_sinh} và tự hỏi trước đây em nó làm nghề gì._
    ~ hr_so(-5)
- ~ tien_cong(100000)
-> END

// ------------------------------------------------------------
=== hr_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_sang_tao # bat_buoc
_Phòng họp "Sáng Tạo". Chiến dịch "Hồng Hóa Việt Nam". Trên bảng trắng, {truong_phong} vẽ một cái mũi tên chỉ lên: "1.000.000"._
truong_phong: Mình sync nhanh 5 phút nhé. Mỗi phòng đề xuất một cách góp người theo dõi.
sales: Bên em chốt rồi nha anh. 3 nhà tài trợ, 2 tỷ, tập đoàn Bánh Tráng Trộn Toàn Cầu. Mr. Kevin Trộn quen chị lâu rồi. No cap!
thuc_tap_sinh: Dạ… em có một ý tưởng phim ngắn ạ, về một người hùng không ai biết tên…
bien_kich: *(ghi chép rất nhanh)* Hay đó em. Rất… cảm hứng.
truong_phong: Anh Tuấn, phòng nhân sự góp gì?
* [📣 "Tui đăng tin tuyển dụng: 'Tuyển người chịu được màu hồng'. Cho nó viral."]
    ~ hr_dang_tin_tuyen_dung = true
    ~ follow(40000)
    hong_hot: Ủa alo? Hay! Để tui làm ảnh, ghi thêm "Không bị chó cắn là một lợi thế"!
    _Chiều đó bài tuyển dụng bị chia sẻ như meme. Hộp thư HR nhận 3.000 hồ sơ, 2.900 cái là ảnh chế._
    ~ qh("hong_hot", 5)
* [📋 "Đặt KPI: mỗi nhân viên share bài Siêu Nhân Hồng mỗi ngày."]
    ~ hr_kpi_share = true
    ~ hr_so(10)
    ~ follow(20000)
    _Cả phòng im phăng phắc. {hong_hot} lặng lẽ mở điện thoại. Trong group "Hội Anti Sếp" có thêm một chủ đề mới: "HR lại bày trò."_
    ~ qh("hong_hot", -5)
* [😶 "Phòng nhân sự lo tinh thần anh em. Ai mệt cứ lên uống trà."]
    _Cả phòng rùng mình đồng loạt, như có gió lạnh._
    truong_phong: Ờ… cái đó mình take note lại nhé.
    ~ hr_so(3)
- truong_phong: Cuộc họp 5 phút của mình kết thúc. *(nhìn đồng hồ: 2 tiếng 10 phút)*
-> END

// ------------------------------------------------------------
=== hr_0210_tra_sua_thu_6 ===
# ngay:2 # gio:15:00 # noi:pantry
_Trà sữa thứ 6, mua bằng quỹ phạt đi trễ. Tuần này quỹ dày bất thường, nhờ nụ cười sáng nay ở máy chấm công._
_Bạn xách 22 ly vào pantry. Không khí đông cứng lại._
hong_hot: *(thì thầm với {designer})* Ổng mua trà sữa… trước khi đuổi ai hả bà?
designer: Khum biết. Uống lẹ đi, lỡ ổng đòi lại.
* [🍵 Đặt ly trà sữa xuống bàn rồi đi ra luôn, cho mọi người tự nhiên.]
    ~ hr_so(-3)
    _Bạn vừa khuất khỏi cửa, pantry ồn ào trở lại như chợ. Bạn đứng ngoài hành lang nghe tiếng cười, uống ly của mình một mình._
* [😊 Ngồi xuống cùng uống: "Hôm nay anh không gọi ai lên uống trà đâu, uống trà sữa thôi."]
    { RANDOM(1, 2) == 1:
        ~ hr_nghe(5)
        ~ hr_so(-5)
        hong_hot: Ủa… thiệt hả? Vậy kể nghe coi, anh có thiệt 40 loại trà hông?
        _Bạn kể về trà Zzz. {hong_hot} cười sặc trân châu. Lần đầu tiên._
    - else:
        ~ hr_so(3)
        designer: Dạ… "hôm nay" hả anh? Còn mai?
        _Không ai trả lời. 22 cái ống hút cùng hút một lúc, nghe như một cơn gió lùa._
    }
* [📓 Ghi tên những người đi trễ sáng nay lên bảng "nhà tài trợ trà sữa".]
    ~ hr_so(5)
    ~ hr_quy_tra_sua = hr_quy_tra_sua + 300000
    chua_te_deadline: Ủa tên tui ba lần vậy anh? Tui góp nhiều nhất hả? Thôi cũng được, tui uống ba ly.
- -> END

// ------------------------------------------------------------
=== hr_0310_ke_tra ===
# ngay:3 # gio:09:00 # noi:can_ho_604
_Thứ 7. Căn 604. Bạn lau từng hộp trà trên kệ: Atiso, Bạc hà, Cúc, Đinh hương, Gừng… cho tới Zzz._
_Tập hồ sơ hồng nằm trên bàn. Bạn đã mang nó về nhà, vì tủ ở công ty bạn không tin bằng cái kệ trà này._
~ hr_ro_ri(-10)
_Điện thoại rung. Là {chi_dai}._
chi_dai: Tuấn, mai Ngày Động vật, tui tắm cho Tuất. Ông qua phụ hông? Hay ông lại ngồi nhà vuốt ve mấy hộp trà?
* [😇 "Mai tui qua. Tui mang trà hoa cúc cho bà, tắm chó xong uống cho mát."]
    ~ qh("chi_dai", 5)
    chi_dai: Được. Mà đừng có cười với con chó. Nó cắn đó.
* [😶 "Mai tui bận… việc riêng."]
    chi_dai: Việc riêng gì? Ông mà có việc riêng thì tui là hoa hậu. Thôi tùy ông.
    _"Việc riêng" là tập hồ sơ hồng. Nhưng bạn không nói được._
* [💬 "Hương, hỏi thiệt, bà có sợ tui hông?"]
    chi_dai: Sợ ông? *(cười khẩy)* Ông cười nữa là tui đấm à nha. Tui chỉ sợ ông cô đơn quá rồi hóa điên thôi.
    ~ hr_nghe(3)
    ~ qh("chi_dai", 3)
- -> END

// ------------------------------------------------------------
=== hr_0410_ten_dau_tien ===
# ngay:4 # gio:21:30 # noi:can_ho_604 # bat_buoc
_Chủ nhật. Ngày Động vật. Story Phây-búc của {chi_dai} toàn ảnh {cho} mặc áo, đội nơ, mặt cau có. Một tấm có Siêu Nhân Hồng chạy trối chết, tay không còn đôi găng hồng._
_Bạn ngồi trước kệ trà, mở tập hồ sơ hồng. Cây bút trên tay. Ô số 1 trống trơn._
_Bạn biết mặt từng người. Ai đang nuôi ai. Ai mới chuyển nhà. Ai trả góp chiếc xe máy còn 7 tháng._
* [✍️ Viết tên {thanh_xin_nghi}. "Nghỉ 31 lần trong năm" là lý do dễ nhất.]
    ~ hr_ds(1)
    ~ hr_them_ten_son = true
    _Bạn viết. Rồi bạn nhớ ra hôm qua {thanh_xin_nghi} nhắn "chúc anh cuối tuần vui" kèm emoji cái ly trà. Bạn không xóa. Nhưng đêm đó bạn không ngủ._
    ~ cang_thang(10)
* [✍️ Viết. Xóa. Viết lại. Xóa.]
    _Bạn viết tên {thuc_tap_sinh}: lương thấp nhất, cắt cũng không tiết kiệm được bao nhiêu. Xóa. Bạn viết tên {idol_het_thoi}: hợp đồng hết hạn 31/10. Xóa._
    _Tờ giấy rách một lỗ ở ô số 1. Bạn dán băng keo lại, rồi pha một ấm trà Zzz._
    ~ cang_thang(5)
    ~ nghi(10)
* [🍵 Gập tập hồ sơ lại. Pha trà. Hôm nay là Ngày Động vật, không phải ngày cắt người.]
    ~ cang_thang(-5)
    _Bạn bật bài "Công Viên" của {idol_het_thoi}, hồi 2015 cả nước hát. "Ngày xưa có đôi bạn thân bán cá viên chiên…"_
    _Ô số 1 vẫn trống. Ngày mai cũng vậy. Bạn hứa với chính mình như thế._
- -> END
