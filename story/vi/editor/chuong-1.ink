// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · CHƯƠNG 1: "BAN NGÀY LÀ ZOMBIE" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== editor_0110_ngu_gat_ky_hop_dong ===
# ngay:1 # gio:10:30 # noi:phong_dung_phim # bat_buoc
~ ed_thuc_dem()
_Phòng dựng phim. Rèm đen. Ba màn hình vẫn sáng. Bạn gục mặt trên bàn phím từ 6 giờ sáng, sau một đêm dựng quảng cáo cho Quán Ốc Đêm._
_Trên màn hình, thanh render dừng ở 100%. Dưới má bạn, phím "J" đã in thành hình._
_Từ tầng 2 vọng xuống tiếng vỗ tay, tiếng reo, tiếng ai đó hét "5 tỷ!". Bạn mở một mắt. Rồi mở mắt còn lại._
_Bàn bên cạnh có một ly trà sữa. Ly của ai đó đã để sẵn, đá tan một nửa. Dán trên nắp là tờ giấy note vàng:_
_"Ly của em nè. Lát dựng anh cái teaser nha. – {quan_ly_idol}"_
_Chữ viết vội, nghiêng, có một vết cà phê ở góc. Bạn nhìn tờ giấy lâu hơn cần thiết._
* [💌 Bóc tờ giấy, kẹp vào ốp lưng điện thoại.]
    ~ ed_can(3)
    _Tờ giấy nằm gọn sau ốp lưng, cạnh cái thẻ nhân viên. Không ai thấy. Bạn thấy đủ rồi._
* [🥤 Uống một hơi hết ly trà sữa, gục xuống ngủ tiếp.]
    ~ uong(30)
    ~ nghi(10)
    _Trà sữa ngọt. Giấc ngủ cũng ngọt. Tờ giấy vẫn dán trên nắp ly, bị bạn úp mặt lên._
* [🏃 Cầm ly lên tầng 2 cảm ơn.]
    _Bạn leo cầu thang, tóc tổ quạ, mũ len lệch, mặt in phím "J". Ở cửa phòng họp, {quan_ly_idol} đang nói chuyện bằng hai điện thoại cùng lúc._
    quan_ly_idol: *(che một điện thoại)* Ủa {editor} dậy rồi hả? Uống chưa em? Teaser nha, chiều nay. *(quay lại điện thoại)* Dạ không, em nói với người khác…
    _Bạn đứng đó, giơ ly trà sữa lên như cụng ly với không khí. Rồi đi xuống._
    ~ ed_can(2)
    ~ qh("quan_ly_idol", 3)
    ~ cang_thang(5)
- _Ở góc màn hình, bạn mở thư mục tên "{quan_ly_idol}". Thêm vào đó một file mới: ảnh chụp tờ giấy note. Rồi đóng thư mục lại._
-> END

// ------------------------------------------------------------
=== editor_0110_may_ca_phe_hong ===
# ngay:1 # gio:14:00 # noi:pantry
_Ngày Cà phê Quốc tế. Máy pha cà phê treo biển "HỎNG. ĐỪNG ĐẬP". Với bạn, đây không phải sự cố. Đây là thảm họa nhân đạo._
_Giữa pantry, cả công ty đang mừng bác {bac_bao_ve} nhân Ngày Người cao tuổi. Bác đỏ mặt, tay cầm tấm thiệp._
chi_dai: {editor}! Ký vô thiệp cho bác đi. Mà sao mặt em như xác ướp vậy?
_Bạn cầm bút, ký. Chữ ký trượt khỏi thiệp, kéo dài ra mặt bàn._
thuc_tap_sinh: *(lao vào, tay ôm khay cà phê)* Dạ anh {editor}! Máy hỏng nên em chạy ra quán ạ! Đen đá không đường của anh nè!
* [😇 "Anh cứu em một mạng. Đêm nay em dựng thêm phụ đề giùm anh."]
    ~ qh("thuc_tap_sinh", 10)
    thuc_tap_sinh: Dạ… anh gọi em là anh làm em ngại quá. Mà dạ, em cảm ơn anh!
    ~ uong(15)
    ~ nghi(25)
* [😴 Uống, gật đầu, gục luôn lên vai {chi_dai}.]
    chi_dai: Ê… ờ thôi. Để nó ngủ. Cả công ty sống nhờ nó mà.
    ~ qh("chi_dai", 5)
    ~ nghi(15)
    ~ uong(15)
* [💬 Hỏi bác {bac_bao_ve}: "Bác ơi, hồi xưa công ty có quay phim gì hông bác? Con muốn coi tư liệu cũ."]
    bac_bao_ve: Có chứ. Ngày xưa có cái máy quay to như cái nồi cơm. Băng hình chắc vẫn nằm đâu đó. Hỏi thằng {it} xem.
    ~ qh("bac_bao_ve", 5)
    ~ uong(15)
    ~ nghi(25)
- -> END

// ------------------------------------------------------------
=== editor_0110_teaser_dem ===
# ngay:1 # gio:23:30 # noi:phong_dung_phim
_23 giờ 30. Văn phòng tắt hết đèn. Bạn tỉnh như sáo. Ba màn hình, một ly cà phê, và 47 phút cảnh quay ký hợp đồng._
_Teaser cho {quan_ly_idol}. 30 giây. Siêu Nhân Hồng ký tên, nhạc dồn, chữ "HỒNG LÀ THÁI ĐỘ" hiện lên._
~ ed_thuc_dem()
* [✂️ Cắt Đúng Nhịp: khớp từng phách nhạc, tới 3 giờ sáng.]
    ~ follow(3000)
    ~ uy_tin = uy_tin + 3
    _Mỗi lần đổi cảnh rơi đúng một nhịp trống. 30 giây mà như một cú đấm nhẹ vào tim._
* [🦉 Giấu một con cú nhỏ, một khung hình, ở giây thứ 17.]
    ~ ed_dau_cu_chung_minh = ed_dau_cu_chung_minh + 1
    _Con cú đeo tai nghe hiện đúng 1/25 giây, sau lưng tấm hợp đồng. Không ai thấy. Nhưng nó ở đó. Như bạn._
* [😴 Dựng tạm cho xong, ngủ lúc 1 giờ.]
    ~ nghi(20)
    _Teaser hơi lệch nhịp ở giây thứ 9. Chỉ người dựng phim mới nghe ra. Bạn nghe ra._
- _2 giờ 14 sáng, điện thoại rung. {quan_ly_idol}: "Em còn thức hả? Anh cũng còn. Mai gửi anh trước 9h nha."_
* [💌 Trả lời: "Dạ em gửi liền nè anh."]
    ~ ed_can(3)
    _"Trời, nhanh vậy! Cảm ơn em nha. Ngủ đi." Bạn không ngủ. Bạn đọc lại tin nhắn đó ba lần._
* [😶 Không trả lời. Gửi file lúc 8:59.]
    _8 giờ 59. File gửi đi. 9 giờ 01, {quan_ly_idol} thả tim. Một tim. Bạn chụp màn hình._
- -> END

// ------------------------------------------------------------
=== editor_0210_hop_chien_dich ===
# ngay:2 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp chiến dịch lúc 8 giờ 30. Với bạn, 8 giờ 30 là nửa đêm. {chi_dai} phải xách bạn từ phòng dựng lên._
truong_phong: MV đầu tiên của Siêu Nhân Hồng ra mắt ngày 9/10. {editor} dựng nhé. Tớ… à anh sẽ giám sát.
_Bạn nhìn lịch trên điện thoại. Hôm nay mùng 2. Ra mắt mùng 9. Bảy ngày. Bảy đêm._
_Bạn ngáp. Một cái ngáp dài tới mức {thuc_tap_sinh} ngồi bên cạnh cũng ngáp theo._
* [😴 Ngủ Gật Chiến Lược: nhắm mắt, gật đầu mỗi khi {truong_phong} ngừng nói.]
    { RANDOM(1, 10) <= 6:
        _Hai mươi phút. Bạn gật đầu bốn lần, đúng bốn lần {truong_phong} hỏi "mọi người đồng ý nhé?"._
        ~ nghi(15)
        ~ cang_thang(-5)
    - else:
        truong_phong: {editor}, em thấy ý tưởng của bạn {thuc_tap_sinh} thế nào?
        _Bạn mở mắt. Không biết ý tưởng nào. Cả phòng nhìn bạn._
        editor: Dạ… đợi render xong…
        ~ qh("truong_phong", -5)
        ~ cang_thang(10)
    }
* [✋ "Anh {truong_phong}, MV cần quay xong trước ngày 6 thì em mới kịp. Không thì em xin lùi."]
    truong_phong: Ừ… thế mình take note lại nhé. {chua_te_deadline}, cậu xếp lịch quay đi.
    chua_te_deadline: *(lướt Tóp-tóp)* Còn sớm mà anh. Chill.
    ~ uy_tin = uy_tin + 3
    ~ ed_can(2)
* [😶 "Dạ." (Nhận việc, như mọi lần.)]
    ~ ed_vo(5)
    ~ cang_thang(5)
- _Ở cuối bàn, {thuc_tap_sinh} rụt rè kể một ý tưởng về người hùng mặc đồ hồng giúp người rồi đi mất. {bien_kich} ghi lại từng chữ. Bạn để ý, vì bạn hay để ý những người bị ghi lại mà không được ghi tên._
-> END

// ------------------------------------------------------------
=== editor_0210_cuoi_cham_cong ===
# ngay:2 # gio:13:00 # noi:may_cham_cong
_Ngày Nụ cười Thế giới. {hr} đứng cạnh máy chấm công: ai chấm công cũng phải cười vào camera._
hr: Cười lên em. Cười từ trong tim. *(cười)* Anh chỉ muốn thấy em vui thôi.
_Bạn nhìn vào camera. Camera nhìn lại bạn. Máy chấm công kêu "bíp", báo lỗi: "Không nhận diện được khuôn mặt"._
* [😁 Cố cười thật to.]
    _Màn hình máy chấm công hiện: "Phát hiện hành vi đáng ngờ". {hr} lùi lại nửa bước._
    hr: Thôi… em cười bình thường thôi. Bình thường là đủ rồi.
    ~ qh("hr", -2)
* [🦉 Kéo mũ len xuống, nhìn máy bằng mắt cú.]
    _Máy chấm công nhận diện được. Lần đầu tiên trong tháng. Nó quen bạn ở dạng này hơn._
    hr: Ờ… vậy cũng được. Anh không ép.
* [😴 Chấm công bằng vân tay, ngủ gật luôn trên quầy lễ tân.]
    thanh_ninh: *(gõ lên quầy)* Anh ơi! Đây là quầy lễ tân, hông phải giường!
    ~ qh("thanh_ninh", -3)
    ~ nghi(5)
- _Chiều đó, trà sữa thứ 6. {quan_ly_idol} đi ngang bàn bạn, đặt thêm một ly. Không note. Chỉ có ly. Vậy cũng đủ._
~ uong(30)
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== editor_0310_ngu_ca_ngay ===
# ngay:3 # gio:12:00 # noi:can_701
_Thứ 7. Căn 701, chung cư mini Phố Mới. Rèm đen kín. Đồng hồ chỉ 12 giờ trưa. Với bạn, đây là 3 giờ sáng._
_Điện thoại có 3 tin nhắn. {chua_te_deadline}: "Ông ơi cứu tui, clip quảng cáo tiệm nail tui quên". {hong_hot}: "Kênh Cú Đêm Cắt Ghép ra video mới chưa, tui ghiền". Và group công ty: 47 tin._
* [😴 Ngủ. Thật sự ngủ. Tới tối.]
    ~ ed_ngu_du()
    _Bạn ngủ một giấc dài như một bộ phim không có cảnh cắt. Tỉnh dậy, trời tối. Đúng giờ của bạn._
* [📺 Dậy dựng video cho kênh riêng.]
    -> editor_mg_dem_cua_cu
* [🤝 Cứu {chua_te_deadline}: dựng clip tiệm nail trong 2 tiếng.]
    ~ ed_thuc_dem()
    ~ qh("chua_te_deadline", 10)
    chua_te_deadline: *(nhắn)* Ông là thánh. Tui nợ ông một bữa. Nợ thiệt.
    ~ tien_cong(100000)
- -> END

// ------------------------------------------------------------
=== editor_0410_mot_ngay_lam_cho ===
# ngay:4 # gio:21:00 # noi:can_701
_Chủ nhật, Ngày Động vật Thế giới. Sáng nay bạn ghé công ty lấy ổ cứng, đứng ở cửa sổ tầng 1 quay được cảnh {cho} bị tắm, bị đội nơ, rồi bị {sieu_nhan_hong} chọc._
_Rồi cảnh đẹp nhất: {cho} ngoạm chiếc găng tay hồng chạy vào gầm cầu thang, ngoảnh lại với ánh mắt của một siêu anh hùng vừa trả thù xong._
_Bạn dựng thành video "Một ngày làm chó công ty", nhạc phim hành động, slow-motion đúng lúc cái nơ bay._
~ ed_thuc_dem()
* [📺 Đăng nguyên bản lên kênh. Cảnh cổng công ty rõ mồn một.]
    ~ ed_sub_cong(15000)
    ~ ed_lo(15)
    ~ tien_cong(800000)
    _300.000 lượt xem trong một đêm. Bình luận top: "Ủa cái cổng này quen quen, công ty G ở Tân Drama đúng hông?"_
    _Bạn nhìn bình luận đó rất lâu. Rồi tắt màn hình. Rồi mở lại._
* [🎨 Làm mờ cổng và biển hiệu trước khi đăng.]
    ~ ed_sub_cong(8000)
    ~ tien_cong(500000)
    _200.000 lượt xem. Không ai biết đây là chó của công ty nào. Chỉ biết đây là chó ngầu nhất tuần._
* [🦉 Không đăng. Gửi riêng cho bác {bac_bao_ve} coi.]
    ~ qh("bac_bao_ve", 10)
    ~ qh("cho", 5)
    _Sáng hôm sau, bác {bac_bao_ve} xem đi xem lại trên cái điện thoại cũ, cười khà khà. {cho} nằm cạnh, xem chính mình, vẫy đuôi._
    bac_bao_ve: *(nhắn bằng giọng nói)* Hay đấy. Bác không biết cháu làm thế nào, nhưng hay đấy.
- -> END
