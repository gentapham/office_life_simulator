// ============================================================
// DESIGNER · CHƯƠNG 1: "BẢN SỐ 1" (1/10 – 7/10)
// ============================================================

// ------------------------------------------------------------
=== designer_0110_banner_5_ty ===
# ngay:1 # gio:09:35 # noi:ban_thiet_ke # bat_buoc
_9 giờ 35. Từ phòng họp tầng 2 vọng xuống tiếng reo hò: 5 tỷ đã về tài khoản. Bạn chưa kịp vỗ tay thì điện thoại rung._
giam_doc: {designer} ơi, anh cần một cái banner ăn mừng treo ở sảnh. 30 phút nhé.
giam_doc: Hoành tráng, nhưng tiết kiệm mực. Anh không ép, tùy em.
_Bạn nhìn đồng hồ. Rồi nhìn file tên "final thật sự lần này final" từ năm ngoái. Bạn đã không còn tin vào chữ "final" từ lâu._
* [🎨 Làm một bản thật có gu: nền cam, chữ trắng, một vệt hồng tinh tế.]
    ~ ds_toi(5)
    _25 phút sau, bạn gửi bản 1. Thoáng, sang, nhìn là muốn chụp hình._
    giam_doc: Đẹp! Nhưng chưa đủ wow. Em cho chữ "5 TỶ" to lên. To nữa. Thêm pháo hoa.
    -> sua_vong
* [🧠 Ba Bản Mồi: một bản 7 màu chói lóa, một bản toàn chữ, một bản mình thích.]
    ~ ds_toi(2)
    giam_doc: Ơ, bản thứ ba được đấy! Nhưng em lấy pháo hoa của bản một ghép sang nhé.
    designer: *(lẩm bẩm)* Pháo hoa là thứ em cố tình làm xấu mà anh…
    ~ ds_sua(2)
    -> chot
* [🌈 Làm luôn "phong cách sếp": chữ vàng viền đỏ, G 7 màu, pháo hoa nhấp nháy.]
    ~ ds_toi(-10)
    giam_doc: Đúng rồi! Đúng tinh thần rồi! Nhưng em làm cho nó… sang hơn tí. Anh không ép.
    _Bạn cảm thấy một phần linh hồn rời khỏi cơ thể, bay lên tầng 2 và đầu quân cho phòng kế toán._
    ~ ds_sua(1)
    ~ cang_thang(5)
    -> chot

= sua_vong
_Lần sửa 2: chữ to lên. Lần sửa 3: logo to lên. Lần sửa 4: "nhưng phải thoáng nhé em"._
giam_doc: Em ơi, sao nhìn nó chật thế nhỉ? Anh thấy bản đầu tiên thoáng hơn.
* [😶 Mở lại bản 1, đổi tên thành "v5", gửi đi.]
    giam_doc: Thấy chưa! Sửa là khác hẳn! Anh có con mắt nghệ thuật lắm đấy.
    ~ ds_ban_1_thanh_cong = ds_ban_1_thanh_cong + 1
    ~ cang_thang(-5)
* [🎨 "Dạ, đó chính là bản đầu tiên anh chê đó anh."]
    giam_doc: …Thì anh chê để em có động lực. Văn hóa doanh nghiệp đấy em.
    ~ ds_toi(5)
    ~ qh("giam_doc", -3)
- ~ ds_sua(4)
~ ds_co_huy_hieu_ban_1 = true
_Bạn nhận được vật phẩm Huy Hiệu Bản Đầu Tiên. Nhìn nó, bạn thấy lòng nhẹ đi một chút._
-> chot

= chot
_Banner được treo ở sảnh lúc 10 giờ 15. {sieu_nhan_hong} đi ngang, tạo dáng chụp hình với nó 11 kiểu._
sieu_nhan_hong: Banner đẹp quá trời! Ai làm vậy? Hồng chưa đủ… nhưng mà đẹp!
~ follow(2000)
~ qh("sieu_nhan_hong", 5)
_Số Lần Bị Sửa của bạn hiện là {ds_so_lan_bi_sua}._
-> END

// ------------------------------------------------------------
=== designer_0110_nhan_vien_moi ===
# ngay:1 # gio:11:10 # noi:ban_thiet_ke
_{chi_dai} dẫn một cậu trai lạ mặt đi một vòng tầng 1. Áo sơ mi phẳng phiu, nụ cười ngọt như trà sữa full đường._
chi_dai: {designer}, đây là {ran_doc}, nhân viên mới bên Truyền thông nội bộ. Có gì em chỉ nó nha.
ran_doc: Dạ chào chị! Cái banner ở sảnh là chị làm hả? Đẹp quá trời luôn á!
_Một người khen poster đúng chỗ. Hiếm như lương về đúng hạn._
ran_doc: Mà file gốc mấy cái poster chị để thư mục nào vậy chị? Em làm bản tin nội bộ, cần lấy hình.
* [🤝 "Ổ chung, thư mục POSTER HỒNG. Em lấy thoải mái."]
    ~ ds_chi_thu_muc_cho_hieu = true
    ~ qh("ran_doc", 10)
    ran_doc: Dạ em cảm ơn chị nhiều! Chị dễ thương ghê.
    chi_dai: Thấy chưa, phòng này toàn người tốt. Đứa nào làm em khóc, chỉ mặt chị.
* [💬 "Cần hình nào chị xuất JPG cho. File gốc thì khum đưa nha."]
    ~ ds_toi(3)
    ran_doc: *(cười, hơi khựng)* Dạ… dạ được chị. Em hỏi vậy thôi.
    _Cậu ta liếc màn hình bạn một giây. Một giây hơi lâu._
* [😶 Đeo tai nghe, gật đầu mỉm cười.]
    chi_dai: Nó đang làm, để chiều chị dẫn em quay lại.
    ran_doc: Dạ không sao chị, em đi chào tiếp!
- _{chi_dai} kéo {ran_doc} đi tiếp. Bạn quay lại màn hình, phóng to cái logo 300% chỉ để có cảm giác kiểm soát được thứ gì đó._
-> END

// ------------------------------------------------------------
=== designer_0110_tra_sua_an_mung ===
# ngay:1 # gio:15:00 # noi:pantry
_Cả công ty ăn mừng bằng trà sữa. Máy pha cà phê hỏng đúng Ngày Cà phê Quốc tế. Ai đó cắm một cây nến lên ly trà sữa của Bác {bac_bao_ve}, mừng Ngày Người cao tuổi._
bac_bao_ve: Thôi thôi, các cháu làm bác ngại…
sales: Mọi người nghe nè! Siêu Nhân Hồng á, chị gặp ảnh ở Sống Ảo, chị dụ ảnh về đó. Tin chị đi!
_{sieu_nhan_hong} đứng ngay đó, mở miệng định cãi, rồi lịch sự ngậm lại. {hong_hot} đã đăng vào group trước khi ai kịp thở._
hong_hot: Ối dồi ôi, {sales} đỉnh nóc kịch trần! Đăng rồi nha!
_{sales} liếc bạn. Ánh mắt đó bạn hiểu: "Chị {designer}, đỡ em."_
* [🤝 "Đúng rồi, hôm đó tui ngồi bàn bên, thấy {sales} chốt ảnh trong 5 phút."]
    ~ qh("sales", 10)
    ~ cang_thang(3)
    sales: Thấy chưa! Có nhân chứng nha mọi người!
    sieu_nhan_hong: *(nhỏ giọng)* Ờm… em tự tới mà… nhưng thôi, vậy cũng được.
* [😇 "Ủa, anh {sieu_nhan_hong} tự tới mà ta?"]
    ~ qh("sieu_nhan_hong", 5)
    ~ qh("sales", -10)
    sieu_nhan_hong: Dạ đúng rồi, em tự tới! Mà… chị {sales} nói vậy nghe cũng ngầu.
    sales: *(nghiến răng cười)* Chị nói ẩn dụ đó. Ẩn dụ là… dụ ảnh bằng ẩn ý.
* [🧂 "{sales} còn dụ được cả cái máy pha cà phê chạy lại hông?"]
    ~ qh("hong_hot", 5)
    hong_hot: Ha ha! Câu này hay, đăng luôn!
    sales: Tin chị đi, chiều nay nó chạy. *(Nó không chạy.)*
- ~ uong(30)
~ nhan(tra_sua)
_Bạn được một ly trà sữa trân châu đường đen. Lần cuối công ty bao trà sữa là… bạn không nhớ nổi._
-> END

// ------------------------------------------------------------
=== designer_0110_dem_can_203 ===
# ngay:1 # gio:22:00 # noi:can_203
_22 giờ. Căn 203 chung cư Phố Mới. Ban công đầy cây, cây nào cũng tên một deadline đã qua._
giam_doc: *(group Zalo-lô)* Cả nhà ơi, hôm nay là ngày lịch sử! Mai 8h sharp mình meeting chiến lược nhé. Ai chưa ngủ thì like cho anh biết.
_Bạn bấm "đã xem". Rồi bạn nhìn sang laptop thứ hai, nằm im trên bàn vẽ, nắp dán sticker cây xương rồng._
_Một tin nhắn mới hiện lên. Người gửi: Anh Lá Chuối._
la_chuoi: Em ơi. Job nhỏ nè. Logo cho tiệm trà sữa bên anh khai trương. 800 nghìn. Sáng mai cần.
* [🥬 Mở laptop thứ hai. 800 nghìn là tiền điện tháng này.]
    -> designer_mg_alt_tab_mo_dau
* [🧡 "Dạ tối nay em mệt. Hẹn anh dịp khác."]
    ~ ds_cam(5)
    la_chuoi: Ok em. Bên anh lúc nào cũng có việc. Nhớ nha.
    _Bạn tắt máy, tưới cây, và đi ngủ lúc 23 giờ. Một điều xa xỉ._
    ~ nghi(15)
* [👍 Like tin nhắn của sếp trước, rồi tính.]
    ~ qh("giam_doc", 2)
    giam_doc: *(nhắn riêng)* {designer} chăm chỉ quá! Mai em làm thêm cái slide chiến lược cho anh nhé. Anh không ép.
    ~ ds_sua(1)
    ~ cang_thang(5)
    _Bạn nhìn laptop thứ hai. Anh Lá Chuối vẫn đang "đang soạn tin…"._
- -> END

// ------------------------------------------------------------
=== designer_0210_hong_hoa_viet_nam ===
# ngay:2 # gio:09:00 # noi:phong_hop_sang_tao # bat_buoc
_Phòng họp "Sáng Tạo". Sáng nay ai chấm công cũng phải cười vào camera, Ngày Nụ cười Thế giới. Bạn cười như người vừa bị sửa 41 lần._
truong_phong: Mình họp nhanh 5 phút thôi nhé. Chiến dịch "Hồng Hóa Việt Nam": 1 triệu người theo dõi trước 31/10.
sieu_nhan_hong: Em xin đọc điều khoản số 2 ạ! "Mọi sản phẩm phải có ít nhất một chút màu hồng." Biến hình!
_Cả phòng gật gù. Chỉ có bạn giơ tay._
* [💬 "Dạ cho em hỏi, một chút là bao nhiêu phần trăm ạ?"]
    _Im lặng. {truong_phong} nhìn {giam_doc}. {giam_doc} nhìn {sieu_nhan_hong}. {sieu_nhan_hong} nhìn trần nhà._
    sieu_nhan_hong: Ờm… một chút là… đủ để thấy mình được thương?
    truong_phong: Cái này mình take note lại, họp tiếp sau nhé.
    ~ ds_toi(5)
    ~ qh("sieu_nhan_hong", 5)
* [🧂 "Vậy em đề xuất mã màu Hồng Thái Độ, in thành bảng màu chuẩn cho cả công ty."]
    ~ uy_tin = uy_tin + 5
    ~ qh("truong_phong", 5)
    truong_phong: Hay đấy! Thế em làm luôn bộ nhận diện nhé. Hôm nay. Kèm 5 phương án.
    ~ ds_sua(1)
* [😶 Vẽ nguệch ngoạc một con mèo hồng vào sổ.]
    _Bạn vẽ xong con mèo thứ ba thì thấy {bien_kich} đang nhìn chằm chằm._
    bien_kich: *(liếc sổ bạn)* Con mèo này có nỗi đau. Cho tui mượn làm nhân vật nha.
    ~ qh("bien_kich", -3)
- _Giữa buổi, {thuc_tap_sinh} rụt rè kể một ý tưởng phim về người gác két ngân hàng. {bien_kich} ghi chép rất chăm._
sales: *(đứng bật dậy)* Tin chị đi! Chị lo 3 nhà tài trợ, tổng 2 tỷ, trước Đại Nhạc Hội!
giam_doc: Tuyệt vời! Mọi người vỗ tay cho {sales}!
_{ke_toan} lặng lẽ ghi vào sổ: "2 tỷ. {sales}. Chưa có hóa đơn."_
_{sales} ngồi xuống, đá chân bạn dưới gầm bàn hai cái. Mật mã của hai đứa: "Tối nay có việc."_
-> END

// ------------------------------------------------------------
=== designer_0210_can_mot_tap_doan ===
# ngay:2 # gio:23:40 # noi:can_203 # bat_buoc
sales: Chị {designer} ơi, cứu em! À không… tin chị đi, chị cứu em là chắc kèo!
sales: Sáng mai em cần hồ sơ năng lực của Tập đoàn Bánh Tráng Trộn Toàn Cầu. Có logo, có ảnh trụ sở, có chữ ký chủ tịch.
_{sales} nhỏ hơn bạn 3 tuổi, nhưng xưng "chị" với cả thế giới, kể cả với bạn. Bạn đã quen. Gần như quen._
sales: Chủ tịch tên Mr. Kevin Trộn. Em mới đặt lúc nãy, khi đang ăn bánh tráng trộn.
~ phat_hien(btt_global_gia)
* [🗂️ "Cho chị 2 tiếng. Logo tông vàng bánh tráng, slogan 'Trộn Là Dính'."]
    ~ qh("sales", 10)
    sales: Trời ơi chị là thiên thần! Mai em bao ốc! Quán Ốc Đêm, gọi gì gọi!
    -> designer_mg_deal_ma_mo_dau
* [😇 "Huyền, cái tập đoàn đó có thật hông em?"]
    ~ qh("sales", -5)
    sales: Có chứ! …Sắp có.
    sales: Chị {designer}, em biết là kỳ. Nhưng 2 tỷ em lỡ nói rồi. Chị giúp em lần này thôi.
    _Giọng {sales} nhỏ lại, không còn "chị" nữa. Bạn nể con nhỏ này, lần đầu tiên vì nó nói thật._
    ~ qh("sales", 8)
    ~ ds_toi(2)
    designer: Rồi. Mai chị làm. Nhưng logo khum được giống của ai có thật nha.
* [🤝 "Chị làm. Nhưng tối nào chị làm job bên kia, em ra Sống Ảo canh cửa cho chị."]
    ~ ds_huyen_canh_cua = true
    ~ qh("sales", 12)
    sales: Deal! Em canh cửa giỏi lắm, hồi đi học em canh cô giáo cho cả lớp quay bài.
    _Hai người cùng nắm thóp nhau. Kiểu tình bạn chắc hơn cả hợp đồng 52 trang._
- _1 giờ sáng. Tập đoàn Bánh Tráng Trộn Toàn Cầu, BTT Global, chính thức ra đời trên màn hình laptop của bạn._
~ nghi(-15)
-> END

// ------------------------------------------------------------
=== designer_0310_thu_bay_song_ao ===
# ngay:3 # gio:10:00 # noi:cafe_song_ao
_Thứ 7. Quán Sống Ảo đèn vàng, cây xanh, wifi mạnh. Bạn ngồi góc khuất nhất, hai laptop xếp cạnh nhau như hai nhân cách._
{ ds_huyen_canh_cua:
    sales: *(ngồi bàn cạnh cửa, đeo kính râm)* Chị cứ làm. Có ai quen là em ho ba tiếng.
}
_Trên laptop thứ nhất: poster Siêu Nhân Hồng, bản nháp 3. Trên laptop thứ hai: logo tiệm trà sữa của LL, tông xanh lá chuối._
* [🥬 Làm job Lá Chuối cho xong, cuối tuần mà.]
    ~ ds_job_ll(800000)
    ~ ds_cam(-5)
    ~ nghi(-15)
    { ds_huyen_canh_cua:
        ~ ds_lo(-5)
    - else:
        ~ ds_lo(5)
    }
    la_chuoi: Nhận file rồi em. Gu em lạ mà sang. Tuần sau có job nữa.
    _800 nghìn về ví. Ly bạc xỉu ít đá bỗng ngon hơn hẳn._
* [🎨 Vẽ poster Siêu Nhân Hồng thôi, LL đợi được.]
    ~ ds_cam(5)
    ~ ds_toi(5)
    ~ follow(3000)
    _Bạn thêm một dải sáng hồng sau lưng Siêu Nhân Hồng, nhìn như thể ảnh vừa bước ra khỏi bình minh._
* [🌿 Gập cả hai máy. Đi về tưới cây.]
    ~ cang_thang(-15)
    ~ nghi(10)
    _Cây lưỡi hổ trên ban công không bao giờ bắt bạn sửa. Đó là lý do bạn yêu nó._
- ~ uong(20)
-> END

// ------------------------------------------------------------
=== designer_0410_tuat_khong_vui ===
# ngay:4 # gio:09:30 # noi:cong_cong_ty
_Chủ nhật, Ngày Động vật Thế giới. Bạn ghé công ty lấy cái ổ cứng quên, thì thấy {cho} mặc áo thun hồng, đội nơ hồng, tóc thơm mùi dầu tắm._
_Mặt {cho}: khó chịu ở mức có thể kiện ra tòa._
chi_dai: Tắm xong rồi nè! Cả công ty này chỉ chị tắm được nó thôi đó.
cho: Grừ…
_Một chiếc xe hồng đỗ xịch trước cổng. {sieu_nhan_hong} bước xuống, giả tiếng sủa._
sieu_nhan_hong: Gâu gâu! Ê {cho}! Mặc đồ hồng giống anh rồi nè! Mình là anh em đó!
cho: GÂU! GÂU GÂU! *(lao ra, ngoạm phăng một chiếc găng tay hồng)*
_Khoảnh khắc vàng. {cho} ngậm găng tay, nơ lệch, mắt trợn ngược. Tay bạn đang cầm điện thoại._
* [📸 Bấm máy liên tục. Bộ sticker "Tuất Không Vui" ra đời.]
    ~ ds_co_sticker_tuat = true
    ~ qh("cho", -5)
    ~ follow(5000)
    cho: Grừ… *(nhìn thẳng ống kính, bất mãn)*
    _Bạn có 14 tấm. Tấm nào cũng như một lời tuyên chiến._
* [🤝 Chạy tới giữ {cho} lại, kẻo nó cắn luôn {sieu_nhan_hong}.]
    ~ qh("cho", 5)
    ~ qh("sieu_nhan_hong", 10)
    sieu_nhan_hong: Cảm ơn chị! Mà… nó lấy găng tay em mất rồi.
    chi_dai: Cho đáng! Ai biểu chọc nó.
* [🦴 Đưa {cho} cây xúc xích trong túi để nó nhả găng ra.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
        cho: *(nhả găng, ngoạm xúc xích, rồi ngoạm lại găng, chạy mất)*
        ~ qh("cho", 10)
    - else:
        _Túi bạn trống trơn. {cho} nhìn bạn khinh bỉ rồi chạy mất cùng chiếc găng tay._
        ~ qh("cho", -2)
    }
- _{cho} biến mất dưới gầm cầu thang. Chiếc găng tay hồng không bao giờ được trả lại. Ít nhất là trong tháng này._
-> END

// ------------------------------------------------------------
=== designer_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_sang_tao
_Thứ 2, họp giao ban. {truong_phong} chủ trì, dự kiến 30 phút, thực tế 2 tiếng. Hôm nay là Ngày Nhà giáo Thế giới._
thuc_tap_sinh: Dạ em tặng chị {designer} bông hoa ạ. Chị dạy em cách đặt tên file ạ.
_{thuc_tap_sinh} 30 tuổi, lớn hơn bạn, cúi đầu tặng hoa như học sinh lớp 3. Cả phòng ngại thay._
* [😇 "Anh {thuc_tap_sinh} ơi, anh lớn hơn em mà…" rồi nhận hoa.]
    ~ qh("thuc_tap_sinh", 10)
    thuc_tap_sinh: Dạ học thì không phân biệt tuổi ạ!
    ~ nhan(hoa_hong)
* [🎨 Nhận hoa, rồi dạy thật: "Đừng bao giờ đặt tên file là final."]
    ~ qh("thuc_tap_sinh", 8)
    ~ ds_toi(2)
    thuc_tap_sinh: Dạ em ghi lại ạ! Vậy đặt là gì ạ?
    designer: Đặt là "chưa phải cuối đâu". Cho đỡ đau.
    ~ nhan(hoa_hong)
- truong_phong: Rồi, quay lại agenda. Tuần này {designer} lo poster MV ra mắt thứ 6 nhé. Mình sync mỗi ngày 2 lần.
* [🎧 Đeo tai nghe lúc {truong_phong} bắt đầu slide thứ 40.]
    ~ ds_tai_nghe_lien_tiep = ds_tai_nghe_lien_tiep + 1
    ~ cang_thang(-5)
    _Bạn nghe lofi trong 1 tiếng 20 phút. Không ai phát hiện, trừ {chua_te_deadline}, người cũng đang đeo tai nghe._
* [📝 Ghi chép nghiêm túc.]
    ~ ds_tai_nghe_lien_tiep = 0
    ~ qh("truong_phong", 5)
    ~ nghi(-10)
    _Bạn ghi được 3 trang. Nội dung chính: "họp tiếp sau"._
- -> END

// ------------------------------------------------------------
=== designer_0510_sua_nhe_1725 ===
# ngay:5 # gio:17:25 # noi:ban_thiet_ke
_17 giờ 25. Túi đã đeo một quai. Tiếng bước chân {truong_phong} vang lên sau lưng._
truong_phong: {designer} ơi, poster ổn rồi đấy. Em sửa nhẹ giúp anh tí nhé.
truong_phong: Chữ to lên, logo to lên, mặt Siêu Nhân Hồng cũng to lên, mà nhìn vẫn phải thoáng nhé.
* [🎨 "Dạ anh ơi, cho em xin feedback cụ thể được không ạ? Ba cái cùng to thì tờ A4 hết chỗ thở luôn á."]
    ~ ds_toi(5)
    truong_phong: Thế mình họp nhanh 5 phút nhé.
    _Cuộc họp 5 phút kết thúc lúc 19 giờ 30. Kết luận: "để mai tính"._
    ~ nghi(-15)
    ~ cang_thang(5)
* [🔁 "Dạ em sửa liền." (Gửi Lại Bản 1 sau 20 phút)]
    { RANDOM(1, 10) <= 7:
        truong_phong: Thấy chưa, sửa là khác hẳn! Anh bảo mà.
        ~ ds_sua(1)
        ~ ds_ban_1_thanh_cong = ds_ban_1_thanh_cong + 1
        ~ cang_thang(-10)
    - else:
        truong_phong: Ơ, sao chữ "Siêu Nhân" vẫn sai dấu ngã như bản sáng nay thế em?
        _Bản 1 vẫn còn lỗi chính tả cũ. Bạn quên sửa đúng cái lỗi duy nhất cần sửa._
        ~ uy_tin = uy_tin - 10
        ~ qh("truong_phong", -5)
    }
* [😶 Đeo tai nghe, gõ phím thật mạnh.]
    ~ ds_tai_nghe_lien_tiep = ds_tai_nghe_lien_tiep + 1
    { ds_tai_nghe_lien_tiep >= 2:
        truong_phong: {designer}. Mai 8 giờ lên phòng anh họp 5 phút về thái độ nhé.
        ~ ds_tai_nghe_lien_tiep = 0
        ~ qh("truong_phong", -10)
        ~ cang_thang(10)
    - else:
        _{truong_phong} gọi thêm 2 lần, rồi bỏ đi. 22 giờ, Zalo-lô reo: "Em nhớ sửa nhé. Anh không gấp. Sáng mai cần."_
        ~ cang_thang(10)
    }
* {ds_co_huy_hieu_ban_1} [🔒 "Hôm bữa anh {giam_doc} nói thích bản này y nguyên mà anh."]
    truong_phong: À… thế à. Thế thôi giữ nguyên. Sếp thích là được.
    ~ ds_toi(10)
    ~ qh("truong_phong", -2)
    _Poster được duyệt ngay. Bạn ra về lúc 17 giờ 31. Kỷ lục cá nhân._
- -> END

// ------------------------------------------------------------
=== designer_0610_chup_poster ===
# ngay:6 # gio:09:30 # noi:studio # bat_buoc
_Buổi chụp poster đầu tiên. Studio tầng 2 phủ phông hồng. {thuc_tap_sinh} cầm hắt sáng, {bien_kich} cầm kịch bản, {sieu_nhan_hong} cầm… một đĩa bánh chuối chiên._
bien_kich: Chữ phải theo hình! Poster phải kể chuyện nỗi đau của một siêu anh hùng cô đơn.
designer: Hình phải theo chữ bà ơi. Poster mà kể chuyện thì ai đọc? Người ta lướt có nửa giây.
bien_kich: Nửa giây cũng đủ để đau nếu đủ sâu.
* [🎨 "Vậy mình làm cả hai: hình kể chuyện, chữ thì ngắn. Ba chữ thôi."]
    ~ qh("bien_kich", 5)
    ~ ds_toi(3)
    bien_kich: Ba chữ… "Hồng. Một. Mình." Nghe được đó.
* [🐍 "Nỗi đau duy nhất ở đây là kịch bản MV chưa xong đó bà."]
    ~ qh("bien_kich", -10)
    ~ ds_oanh_gian = true
    bien_kich: Cảm hứng không có deadline, {designer}.
    thuc_tap_sinh: *(run tay, hắt sáng lệch sang mặt {bien_kich})* Dạ em xin lỗi ạ!
- _Đang chụp tới kiểu thứ 6, {sieu_nhan_hong} bỗng đứng thẳng, nhìn ra cửa sổ._
sieu_nhan_hong: Có bà cụ đứng giữa ngã tư kìa! Điều khoản số 3! Em đi chút rồi về!
_Và ảnh đi thật. Bộ đồ hồng phóng xuống cầu thang. Đĩa bánh chuối chiên vẫn còn trên ghế._
truong_phong: Thế bây giờ poster thế nào? Mai cần!
* [💻 Ghép ảnh Nguyên vào phông bằng Photoshop. Nhanh, gọn, giả.]
    ~ ds_sua(1)
    ~ follow(3000)
    _Bạn ghép 6 kiểu đã chụp lên phông. Đẹp, nhưng cái bóng đổ sai hướng mặt trời. Chỉ bạn thấy. Bạn thấy suốt tối._
    ~ ds_toi(-3)
* [🏃 Xách máy ảnh chạy theo. Chụp cảnh thật.]
    ~ ds_chay_theo_ba_cu = true
    -> chay_theo
- -> END

= chay_theo
_Ngã tư Đại lộ Kẹt Xe. {sieu_nhan_hong} một tay dắt bà cụ, một tay giơ lên chặn dòng xe máy. Nắng 11 giờ trưa đổ xuống bộ đồ hồng._
_Bạn bấm máy. Một khung hình: bàn tay đeo găng hồng nắm bàn tay nhăn nheo. Không cần chỉnh màu._
sieu_nhan_hong: Ủa chị {designer}? Chị đi theo em hả?
* [😇 "Anh cứ dắt bà đi. Em chụp thôi, hông làm phiền."]
    ~ qh("sieu_nhan_hong", 15)
    sieu_nhan_hong: *(nhỏ giọng)* Dạ… cảm ơn chị. Ít ai chụp lúc em không tạo dáng.
* [🧂 "Anh tạo dáng một kiểu đi, cho poster!"]
    sieu_nhan_hong: Biến hình! Vì công lý và lượt view!
    _Bà cụ cũng giơ tay tạo dáng. Tấm này hài, nhưng không đẹp bằng tấm trước._
    ~ qh("sieu_nhan_hong", 5)
- ~ ds_toi(10)
~ ds_cam(5)
~ nghi(-20)
~ an(-10)
_Cả buổi chiều mất trắng. Nhưng trong máy bạn có tấm hình đẹp nhất năm. Bạn gửi cho {hong_hot} kèm dòng "đăng giờ vàng nha bà"._
-> END

// ------------------------------------------------------------
=== designer_0610_clip_ba_cu ===
# ngay:6 # gio:20:30 # noi:can_203
_Tối. Clip ai đó quay cảnh Siêu Nhân Hồng dắt bà cụ đang lên xu hướng._
{ ds_chay_theo_ba_cu:
    hong_hot: BÀ ƠI! Tấm hình bà chụp lên xu hướng chung với clip luôn! Ét o ét, fanpage nổ thông báo!
    ~ follow(15000)
    ~ qh("hong_hot", 10)
    _Bình luận đầu tiên: "Ai chụp tấm này vậy, cho tui xin làm hình nền." Bạn đọc đi đọc lại 7 lần._
- else:
    hong_hot: Clip bà cụ hot quá trời mà fanpage chỉ có poster ghép. Dân mạng hỏi sao bóng đổ ngược kìa bà.
    _Bạn phóng to cái bóng. Đúng là ngược thật. Mắt dân mạng còn hơn mắt sếp._
}
* [📱 Làm nhanh một thumbnail Tóp-tóp ăn theo clip.]
    -> designer_mg_thumbnail_mo_dau
* [😴 Đi ngủ. Mai còn bị sửa tiếp.]
    ~ nghi(20)
    -> END

// ------------------------------------------------------------
=== designer_0710_moc_1 ===
# ngay:7 # gio:16:00 # noi:phong_hop_sang_tao # bat_buoc
_Mốc 1: 50.000 người theo dõi. Cả công ty dán mắt vào màn hình lớn._
{ nguoi_theo_doi >= 50000:
    giam_doc: {nguoi_theo_doi} người! Vượt mốc rồi các em! Văn hóa doanh nghiệp là đây!
    hong_hot: Poster của {designer} được chia sẻ nhiều nhất tuần luôn nha!
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ ds_cam(5)
    -> chot
- else:
    giam_doc: Chưa tới 50 nghìn… Thế thì mình họp truyền lửa nhé. 3 tiếng thôi.
    _3 tiếng. {giam_doc} kể chuyện khởi nghiệp trong căn phòng 20 mét vuông năm 2010. Lần thứ 9 trong năm._
    ~ nghi(-20)
    ~ cang_thang(10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
    -> chot
}

= chot
_Họp xong, {giam_doc} vỗ vai bạn._
giam_doc: Tuần sau MV ra mắt. Poster phải đẹp hơn nữa. Đẹp kiểu… nhìn là thấy tiền ấy em.
* [🎨 "Dạ, đẹp kiểu nhìn là thấy người, được hông anh?"]
    ~ ds_toi(5)
    giam_doc: Người cũng được. Người có tiền càng tốt.
* [😇 "Dạ em cố."]
    ~ qh("giam_doc", 3)
* [🧂 "Dạ, em in tờ tiền lên nền luôn cho chắc."]
    giam_doc: …Em đùa à? Ừ, đùa được. Mà đừng in thật nhé.
    ~ qh("giam_doc", -2)
    ~ cang_thang(-3)
- -> END
