// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · CHƯƠNG 1: "5 TỶ TRÊN MÀN HÌNH" (1/10 – 7/10)
// ============================================================

// ------------------------------------------------------------
=== dan_dau_tu_0110_cua_sau ===
# ngay:1 # gio:08:10 # noi:cong_sau # bat_buoc
_8 giờ 10. Bạn dắt xe vòng ra cửa sau công ty, như mọi sáng. Cửa trước có {sales}. Cửa trước luôn có {sales}._
_Bạn vừa đẩy cánh cửa sắt thì nghe tiếng trà rót. Bác {bac_bao_ve} đang ngồi ngay đó, trên một cái ghế nhựa, như thể đã chờ sẵn._
bac_bao_ve: Cậu {dan_dau_tu}. Hôm nay bác ra cửa sau ngồi cho mát.
cho: Gâu! *(chạy tới, đánh hơi túi quần bạn, nơi có cái điện thoại đang mở chart)*
_Bạn nợ bác 2.000.000đ. Bác chưa nhắc lần nào. Đó là lý do bạn sợ bác nhất._
* [😇 "Dạ con chào bác. Con… con nhớ mà bác."]
    bac_bao_ve: Nhớ gì? Bác có hỏi gì đâu. Vào đi, sắp 8 giờ 15 rồi.
    ~ qh("bac_bao_ve", 5)
    ~ ddt_nt(-5)
* [📈 "Bác ơi, chart sáng nay xanh lắm, tuần sau con…"]
    bac_bao_ve: Thế à.
    _Hai chữ. Bạn thấy mình nhỏ lại một xíu._
    ~ ddt_noi_day()
    ~ qh("bac_bao_ve", -3)
* [🏃 Cười một cái rồi đi thật nhanh vào trong.]
    bac_bao_ve: *(nói với theo)* Đi chậm thôi, trơn đấy.
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0110_5_ty ===
# ngay:1 # gio:10:30 # noi:ban_so_lieu # bat_buoc
_Bạn là người cập nhật bảng số liệu của công ty. Nên khi 5 tỷ về tài khoản, con số hiện lên trên màn hình trái của bạn: 5.000.000.000đ._
_Màn hình phải, như mọi khi, đang mở chart. Màn hình phải lúc nào cũng sáng hơn._
_{sales} đi ngang qua. Dừng lại. Nhìn màn hình trái. Nhìn bạn. Ánh mắt chứa đựng hy vọng của 5.000.000đ._
sales: Anh {dan_dau_tu}… cái số này là…
* [😇 "Tiền công ty. Không phải tiền anh."]
    sales: Em biết! Em chỉ hỏi thôi! Mà… công ty có tiền thì lương anh cũng…
    it: *(đi ngang, dừng lại)* Restart cái ví chưa anh?
    _Đến trưa, bạn đã giải thích 11 lần rằng 5 tỷ là tiền công ty. Lần thứ 11 là với {thuc_tap_sinh}, người thật ra chỉ hỏi đường xuống pantry._
    ~ cang_thang(10)
    ~ ddt_lam_that(2)
* [💻 Thu nhỏ màn hình trái.]
    _Con số 5 tỷ biến mất. Chỉ còn chart. Cây nến đỏ. {sales} nhìn chart, lắc đầu, đi tiếp._
    sales: Tin em đi, anh mà tập trung làm báo cáo thì giờ trả em xong rồi đó.
    ~ ddt_soi_chart()
    ~ qh("sales", -3)
* [🧾 Dán một tờ giấy lên mép màn hình: "TIỀN CÔNG TY. KHÔNG PHẢI TIỀN ANH."]
    _Tờ giấy hiệu quả. Mọi người đọc, cười, rồi chụp hình đăng group. {hong_hot} đặt caption: "Câu nói thật thà nhất năm 2026"._
    ~ qh("hong_hot", 5)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0110_tra_sua ===
# ngay:1 # gio:15:30 # noi:tang_1
_Cả công ty ăn mừng 5 tỷ bằng trà sữa. Bạn nhận ly của mình. Trên khay còn một ly nữa, dán tên {idol_het_thoi}, người chiều nay đi hát đám cưới ở Ven Đô._
_Bạn nợ {idol_het_thoi} 500.000đ "tiền ăn trưa". Về mặt kế toán, uống ly trà sữa này có thể coi là… lãi âm._
* [🧋 Uống luôn ly của {thanh_xin_nghi}.]
    _Ngọt. Hơi tội lỗi. Chủ yếu là ngọt._
    ~ uong(30)
    ~ cang_thang(-10)
    ~ ddt_so_lan_an_chuc = ddt_so_lan_an_chuc + 1
    { RANDOM(1, 10) <= 3:
        hong_hot: *(chụp hình)* Ủa anh {dan_dau_tu} uống hai ly hả? Lên group liền!
        ~ danh_tieng = danh_tieng - 5
    }
* [📦 Cất vào tủ lạnh, dán giấy "Của {idol_het_thoi}. Đừng ai uống. Kể cả tui."]
    _Hôm sau {idol_het_thoi} đi làm, thấy ly trà sữa còn nguyên với tờ giấy. Nhắn bạn: "Em {dan_dau_tu} tử tế ghê. Fan anh mà biết chắc cảm động."_
    ~ qh("idol_het_thoi", 10)
    ~ uong(30)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0110_mung_bac_binh ===
# ngay:1 # gio:17:40 # noi:choi_bao_ve
_Ngày Quốc tế Người cao tuổi. Cả công ty kéo xuống chòi mừng Bác {bac_bao_ve}. Ai cũng có quà: một gói trà, một hộp bánh, một cái quạt cầm tay._
_Bạn có… cái điện thoại đang mở chart, và 87.000đ trong ví._
* [🍵 Mua một gói trà ở tiệm tạp hóa, 50 nghìn.]
    ~ tien_cong(-50000)
    bac_bao_ve: Cảm ơn cậu. Trà này bác thích. Mà cậu đừng mua đồ đắt cho bác, nghe chưa.
    ~ qh("bac_bao_ve", 8)
* [📊 Tặng bác một tờ "biểu đồ sức khỏe người 50 tuổi" vẽ bằng bút bi.]
    _Biểu đồ đi lên. Tất cả biểu đồ bạn vẽ đều đi lên._
    bac_bao_ve: *(nhìn tờ giấy rất lâu)* Đi lên à. Ừ. Cảm ơn cậu. Bác giữ.
    ~ qh("bac_bao_ve", 5)
    ~ ddt_dc(1)
* [😶 Đứng sau đám đông, vỗ tay to nhất.]
    _Không ai để ý bạn không có quà. Trừ một người. Bác {bac_bao_ve} nhìn bạn, gật đầu nhẹ, như nói "không sao"._
    ~ qh("bac_bao_ve", 3)
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0210_hop_chien_dich ===
# ngay:2 # gio:09:30 # noi:phong_hop_tang_2 # bat_buoc
_9 giờ 30. Họp chiến dịch "Hồng Hóa Việt Nam". {truong_phong} vẽ một mũi tên đi lên trên bảng trắng. {sales} hứa ba nhà tài trợ 2 tỷ từ "Tập đoàn Bánh Tráng Trộn Toàn Cầu, BTT Global", chủ tịch "Mr. Kevin Trộn"._
_{thuc_tap_sinh} kể lại một ý tưởng phim về "người gác két". Không ai để ý lắm, trừ {bien_kich}, đang ghi chép rất nhanh._
giam_doc: {dan_dau_tu}. Mục tiêu một triệu người theo dõi trong 30 ngày. Có khả thi không? Em là người của số liệu, em nói anh nghe.
_Bạn mở bảng số liệu. 5.000 người theo dõi. Tăng tự nhiên khoảng 12.000 một ngày. Nhân 30. Cộng các sự kiện lớn…_
* [📊 "Tự nhiên thì được 600–700 nghìn. Thiếu 300 nghìn. Phải có cú hích."]
    giam_doc: Ba trăm nghìn. Cú hích. Ừ. Anh thích con số cụ thể. Em theo dõi sát cho anh.
    truong_phong: Cái này mình take note lại nhé. "Cú hích". Hay.
    ~ ddt_lam_that(5)
    ~ uy_tin = uy_tin + 5
    ~ qh("giam_doc", 5)
* [📈 "Lần này là lên thật, sếp!"]
    giam_doc: Đấy! Anh cần cái tinh thần đấy! Anh không ép, nhưng anh tin em!
    _Cả phòng vỗ tay. {ke_toan} không vỗ. {ke_toan} nhìn bạn như nhìn một hóa đơn không có dấu đỏ._
    ~ ddt_nt(5)
    ~ qh("giam_doc", 5)
    ~ qh("ke_toan", -5)
* [😶 "Để em chạy số thêm rồi báo anh."]
    giam_doc: Được. Chiều nay nhé.
    _Chiều nay, bạn mở bảng số liệu, rồi mở chart "một chút". Báo cáo được gửi lúc 23 giờ._
    ~ ddt_soi_chart()
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0210_cuoi_cham_cong ===
# ngay:2 # gio:08:12 # noi:may_cham_cong
_Ngày Nụ cười Thế giới. {hr} đứng cạnh máy chấm công: "Chấm công phải cười". Máy chấm công nằm ở cửa trước._
_Cửa trước có {sales}._
sales: Anh {dan_dau_tu}! Cười đi anh! Cười với em một cái. Tháng 6 tới giờ là 4 tháng rồi đó.
hr: Anh {dan_dau_tu} ơi, anh cười giùm em để máy nhận nha.
* [😁 Cười thật tươi, quẹt thẻ, chạy.]
    _Máy chụp được nụ cười đẹp nhất năm của bạn: nụ cười của người đang chạy trốn._
    hr: Đẹp quá anh! Em lưu làm ảnh minh họa luôn!
    ~ qh("hr", 3)
    ~ qh("sales", -3)
* [💸 Trả {sales} 200 nghìn, coi như "phí nụ cười".]
    { tien >= 200000:
        ~ ddt_tra("sales", 200000)
        sales: Ủa… anh trả thiệt hả? *(cười thật)* Thôi được, hôm nay em cười với anh.
        ~ qh("sales", 8)
    - else:
        _Bạn mở ví. Ví mở ra một làn gió. {sales} nhìn vào ví, rồi nhìn bạn với ánh mắt thương hại._
        ~ qh("sales", -2)
    }
* [📉 "Hôm nay thị trường đỏ, anh không cười nổi."]
    sales: Thị trường đỏ chứ ví em còn đỏ hơn đó anh.
    hr: *(ghi chú)* Không cười. Ghi nhận.
    ~ qh("hr", -3)
    ~ ddt_noi_day()
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0310_bida ===
# ngay:3 # gio:20:00 # noi:quan_bida_co_ban
_Thứ 7. Quán bida Cơ Bản, ngay dưới phòng của {chua_te_deadline}. Tiếng bi lách cách. {chua_te_deadline} đang lướt Tóp-tóp giữa hai lượt đánh._
chua_te_deadline: Anh {dan_dau_tu}, làm ván không? Thua thì bao nước.
* [🎱 Chơi, kèo một chai nước.]
    { RANDOM(1, 10) <= 4:
        _Bạn thắng. Lần đầu tiên trong tháng, một khoản đầu tư sinh lời: một chai nước suối._
        ~ uong(30)
        ~ cang_thang(-10)
    - else:
        _Bạn thua. Bạn bao nước. Bạn nói "ván sau là lên thật". Ván sau bạn cũng thua._
        ~ tien_cong(-20000)
        ~ ddt_noi_day()
    }
* [📊 "Anh chỉ ngồi coi, phân tích góc đánh."]
    chua_te_deadline: Phân tích chi cho mệt anh. Chill. Cú nào đẹp thì đánh.
    _Bạn tính góc đánh cho {chua_te_deadline}. {chua_te_deadline} đánh đúng góc bạn tính, vào lỗ. Bạn thấy vui một cách kỳ lạ._
    ~ ddt_dc(2)
    ~ qh("chua_te_deadline", 5)
- chua_te_deadline: Mà anh, nghe nói anh nợ nửa công ty hả? Tui thì chưa cho anh mượn. Chắc vì tui cũng không có.
_{chua_te_deadline} móc ví trả tiền bàn. Một tờ vé gửi xe tháng 9 rơi ra. {chua_te_deadline} nhặt lên, nhìn rất lâu, mặt tái dần._
chua_te_deadline: …Bãi xe. Tháng 9. Cái USB của tui. Chắc rớt ở đó.
_Bạn ghi nhớ. Người của số liệu nhớ mọi thứ có ngày tháng._
-> END

// ------------------------------------------------------------
=== dan_dau_tu_0410_chua_pho_cu ===
# ngay:4 # gio:09:00 # noi:chua_pho_cu
_Chủ nhật. Chùa Phố Cũ. Khói hương thơm, chuông ngân nhẹ. Bạn quỳ trước điện, chắp tay, khấn rất thành tâm:_
_"Xin cho con màu xanh."_
_Bên cạnh, {bien_kich} đang ngồi viết sổ, "tìm cảm hứng". {bien_kich} liếc sang._
bien_kich: Anh {dan_dau_tu}… anh cầu gì mà mặt đau khổ như nhân vật chính hồi thứ ba vậy?
* [🙏 "Cầu chart xanh."]
    bien_kich: *(ghi ngay vào sổ)* "Một người đàn ông cầu xin màu xanh, nhưng đời chỉ cho anh màu đỏ." Hay quá. Em mượn nha.
    ~ ddt_so_lan_chua = ddt_so_lan_chua + 1
    ~ cang_thang(-20)
    ~ ddt_nt(5)
* [😶 "Cầu bình an."]
    bien_kich: Bình an là thứ khó cầu nhất. Em cũng đang cầu đó.
    ~ ddt_so_lan_chua = ddt_so_lan_chua + 1
    ~ cang_thang(-15)
    ~ qh("bien_kich", 5)
* [💬 "Cầu trả hết nợ cho em, {bien_kich}."]
    bien_kich: *(cười)* 500 nghìn tiền cơm hả? Em quên rồi. À không, giờ nhớ rồi.
    ~ qh("bien_kich", 3)
    ~ ddt_nt(-5)
- _Bạn ra về. Mở điện thoại. Chart vẫn đỏ. Chùa không ảnh hưởng tới giá coin. Đương nhiên._
-> END

// ------------------------------------------------------------
=== dan_dau_tu_0510_tien_tro ===
# ngay:5 # gio:06:45 # noi:hem_69
_Ngày 5. Bà Tư chủ trọ ngồi ghế đẩu đầu dãy, quạt nan phe phẩy. Hôm nay thu tiền trọ._
_Cửa gác lửng của bạn dán 6 tờ giấy nhắc nợ của {sales}. Bà Tư nhìn chúng như nhìn một bộ sưu tập._
ba_tu: Nay mùng mấy rồi con?
* [💸 "Dạ mùng 5. Con gửi tiền trọ đây bà."]
    { tien >= 2400000:
        ~ tien_cong(-2400000)
        ba_tu: Giỏi. Hai triệu tư, tính luôn tiền điện. Mà mấy tờ trên cửa, bao giờ con gỡ?
        _Bạn không trả lời. Bạn chỉ dán thêm băng keo cho tờ thứ 6 khỏi rơi._
    - else:
        _Bạn mở ví. Bà Tư nhìn vào ví. Bà thở dài, rất dài._
        ba_tu: Thôi, cuối tuần nha con. Cuối tuần mà không có là bà kể với cả hẻm đó.
        ~ cang_thang(10)
    }
* [📈 "Bà ơi, tuần sau con trả gấp đôi. Đây là đáy rồi."]
    ba_tu: Đáy cái gì? Đáy nồi hả con? Bà nghe câu này của con 3 năm rồi.
    ~ ddt_noi_day()
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0510_giao_ban ===
# ngay:5 # gio:08:30 # noi:phong_hop_tang_2 # bat_buoc
_Họp giao ban đầu tuần. Ngày Nhà giáo Thế giới. {thuc_tap_sinh} tặng hoa cho từng "thầy cô" trong phòng._
thuc_tap_sinh: Dạ anh {dan_dau_tu}, em tặng anh! Anh dạy em đọc bảng tính ạ!
_Bạn nợ {thuc_tap_sinh} 500.000đ. Người cho bạn mượn tiền đang tặng hoa cho bạn._
* [😇 "Cảm ơn em. Tuần sau anh trả 500 nha."]
    thuc_tap_sinh: Dạ? À… dạ em quên mất rồi ạ! Anh cứ thong thả ạ!
    ~ qh("thuc_tap_sinh", 10)
    ~ ddt_nt(-3)
* [📊 "Để anh dạy em thêm bài: lọc dữ liệu trùng."]
    _Bạn chỉ {thuc_tap_sinh} lọc 2.000 dòng trùng trong bảng lượt xem. {thuc_tap_sinh} làm nhanh tới mức bạn hơi giật mình._
    thuc_tap_sinh: Dạ… hồi trước em cũng… hay làm bảng tính ạ.
    ~ ddt_lam_that(3)
    ~ qh("thuc_tap_sinh", 8)
- truong_phong: Rồi, mình vào việc. Họp nhanh 5 phút. Anh {dan_dau_tu} báo cáo số liệu tuần đầu.
* [📊 Báo cáo đúng: 18.000 người theo dõi, chậm hơn kế hoạch.]
    truong_phong: Chậm hơn kế hoạch. Mình take note. Họp riêng bàn tăng tốc nhé.
    ~ ddt_lam_that(3)
    ~ uy_tin = uy_tin + 3
* [📈 Làm tròn lên cho đẹp: "Gần 25 nghìn, đang lên mạnh."]
    truong_phong: Ồ, tốt quá. Cứ thế phát huy.
    _Bạn thấy nhẹ người. Trong 5 phút. Rồi bạn nhớ ra con số sẽ phải đúng vào ngày 7._
    ~ ddt_dc(-5)
    ~ follow(-5000)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0610_clip_ba_cu ===
# ngay:6 # gio:14:00 # noi:ban_so_lieu # bat_buoc
_Buổi chụp poster sáng nay đổ bể: khoảng 10 giờ rưỡi, {sieu_nhan_hong} bỏ ngang để đẩy xe chè của Bà Bảy ra khỏi ổ gà trên Đường Hóng, rồi ngồi ăn chè bằng ống hút luồn qua mũ. Ai đó quay clip, {hong_hot} đăng lên._
_Màn hình trái: cột lượt xem của clip xe chè vọt lên như tên lửa, cao gấp nhiều lần mọi video khác._
_Màn hình phải: Một đồng coin vừa nhảy 3%. Nến xanh. Nhỏ, nhưng xanh._
* [📊 Phóng to màn hình trái. Nhìn kỹ cái cột đó.]
    _Clip xe chè: lượt xem đang gấp 12 lần trung bình. Tỷ lệ chia sẻ cao bất thường. Bình luận: "Thương quá", "Siêu nhân thật đây rồi"._
    _Bạn ghi vào một mẩu giấy: "Khán giả thích… đi giúp người?" Rồi dán nó lên mép màn hình._
    ~ ddt_thay_clip_ba_cu = true
    ~ ddt_lam_that(5)
    ** [📱 Nhắn {hong_hot}: "Ghim clip này lên đầu trang. Đăng lại lúc 20:00."]
        hong_hot: Ủa sao anh biết 20:00? … Ok tui làm theo anh!
        { qh_hong_hot >= 0:
            ~ follow(40000)
        - else:
            ~ follow(15000)
        }
        ~ qh("hong_hot", 5)
    ** [😶 Ghi chú thôi, để mai tính.]
        ~ follow(5000)
* [📈 Phóng to màn hình phải. Nến xanh!]
    _Bạn nhìn cây nến xanh 30 phút. Nó thành nến đỏ. Bạn nói "đây là đáy"._
    _Cái cột trên màn hình trái vẫn đang vọt lên. Bạn không nhìn thấy nó._
    ~ ddt_soi_chart()
    ~ ddt_noi_day()
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_0710_moc_1 ===
# ngay:7 # gio:09:00 # noi:phong_giam_doc # bat_buoc
_Mốc 1: 50.000 người theo dõi. {giam_doc} gọi bạn lên, cầm sẵn tờ giấy và cây bút._
giam_doc: {dan_dau_tu}, em dự đoán đi. Cuối ngày hôm nay mình được bao nhiêu? Đoán trúng anh thưởng. Đoán trật anh "truyền lửa" riêng em một tiếng.
-> dan_dau_tu_mg_du_doan
