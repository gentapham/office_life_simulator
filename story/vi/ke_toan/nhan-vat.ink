// ============================================================
// KẾ TOÁN · NÓI CHUYỆN TỰ DO VỚI 22 NHÂN VẬT
// Game mở cảnh khi người chơi bắt chuyện với NPC.
// Lựa chọn "+" cuối mỗi cảnh là lối ra, dùng lại được.
// ============================================================

// ------------------------------------------------------------
=== ke_toan_tudo_giam_doc ===
# npc:giam_doc
_Phòng giám đốc. {giam_doc} đang tập swing gậy golf giữa phòng kính, suýt trúng cái bằng khen BTT Global trên tường._
giam_doc: {ke_toan} à! Vào đi em. Có chuyện tiền à?
* [🧾 "Anh nộp hóa đơn tiền xăng ba tuần nay chưa?"]
    ~ kt_hoa_don()
    giam_doc: *(lục túi, ra một nắm giấy nhàu)* … Có đây. Hơi… nhàu.
    ke_toan: Nhàu thì vẫn là hóa đơn anh. Em ủi được.
    ~ qh("giam_doc", 3)
* [😮‍💨 "Anh ngủ được không anh?"]
    giam_doc: *(đặt gậy xuống)* … Không. Em thì sao?
    ke_toan: Cũng không.
    giam_doc: Hai người không ngủ được vì cùng một trang giấy. Anh xin lỗi em.
    ~ qh("giam_doc", 10)
    ~ kt_ngu(-5)
* {kt_manh_moi_47b && not kt_ky_thang_47b} [🔒 "Anh. Có một trang anh phải đọc. Lần này đọc trước khi ký."]
    giam_doc: *(nhìn tờ giấy trong bìa nhựa, đọc chậm)* … Cậu ấy viết cái này lúc ký à? … Lần này anh đọc rồi mới ký.
    { kt_mo_nhanh_47b:
        ~ kt_ky_thang_47b = true
        ~ kt_thang_doc_47 = true
        ~ qh("giam_doc", 15)
        { kt_nhan_chung_47b != "":
            ~ kt_47b_hieu_luc = true
            _Đủ ba chữ ký. Trang 47b có hiệu lực._
        }
    - else:
        giam_doc: Nhưng mình phải hỏi chính cậu ấy đã, em nhỉ? Không thì giống mình bắt người ta ký mà không đọc.
    }
+ [👋 "Thôi, anh đánh golf tiếp đi."]
    giam_doc: Anh không đánh nữa. Anh… ừ, anh đánh thêm chút.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_ran_doc ===
# npc:ran_doc
_{ran_doc} đứng ở cửa phòng kế toán, tay cầm phiếu tạm ứng, nụ cười rất ngọt._
ran_doc: Dạ chị {ke_toan} ơi, em xin tạm ứng 500 nghìn tổ chức sinh nhật cho phòng mình. Mà nói nhỏ thôi nha… chị có nghe gì về anh Siêu Nhân Hồng chưa?
* [🧾 "Danh sách sinh nhật đâu em? Hóa đơn bánh đâu em?"]
    ~ kt_hoa_don()
    ran_doc: *(đưa ra ngay, đủ cả)* Dạ đây chị.
    _Đủ tới mức đáng ngờ. Người chuẩn bị kỹ thường muốn thứ gì đó hơn 500 nghìn._
    ~ kt_quy(-1)
* [💬 "Nghe gì em? Kể chị nghe."]
    ran_doc: Tui chỉ nói sự thật thôi mà… nghe nói ảnh hồi nhỏ hay bắt nạt con nít trong xóm. Chị giữ sổ, chị có thấy ảnh trả tiền gì lạ hông?
    ke_toan: Chị giữ sổ công ty. Không giữ chuyện xóm.
    ~ qh("ran_doc", -5)
* [🐍 "{ran_doc}. Mấy hôm trước em đứng ở cửa nhà vệ sinh pantry lâu lắm đúng không?"]
    ran_doc: *(nụ cười không đổi, nhưng mắt chớp một cái)* Dạ… em đau bụng chị ơi.
    { kt_ran_doc_nghe_47:
        ke_toan: Đau bụng mà nghe rõ hai chữ "trang 47".
        ran_doc: … Em không có ý gì đâu chị.
        ~ qh("ran_doc", -10)
    }
+ [👋 "Thôi, em làm việc đi."]
    ran_doc: Dạ! Chị giữ sức khỏe nha chị!
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_truong_phong ===
# npc:truong_phong
_{truong_phong} ôm laptop, đứng chờ ngoài cửa phòng kế toán từ lúc nào._
truong_phong: Chị {ke_toan} ơi, em xin duyệt ngân sách cho… một cuộc họp về việc giảm số cuộc họp ạ. Tiền nước, tiền in slide.
* [🧾 "Họp về việc giảm họp thì có bao nhiêu slide?"]
    truong_phong: Dạ… 46 slide ạ.
    ke_toan: In 46 slide cho 12 người là 552 tờ giấy. Em chiếu lên tường đi.
    ~ kt_hoa_don()
    ~ kt_keo(3)
    ~ qh("truong_phong", -3)
* [💬 "{truong_phong}, mấy cái MV đó… em dựng hay {editor} dựng?"]
    truong_phong: *(ho khan)* … Team mình dựng ạ.
    ke_toan: Bảng chấm công đêm ghi tên {editor} 47 đêm. Tên em 0 đêm.
    truong_phong: … Vâng. Em sẽ ghi tên em ấy vào credit.
    ~ qh("truong_phong", -5)
    ~ qh("editor", 5)
* [☕ "Em ngồi xuống uống ly trà. Không họp, không slide."]
    truong_phong: *(ngồi xuống, hơi lúng túng)* … Lâu lắm em không ngồi mà không có lịch họp, chị ạ.
    ~ qh("truong_phong", 10)
    ~ kt_ngu(-3)
+ [👋 "Thôi, em họp tiếp đi."]
    truong_phong: Vâng ạ, em book phòng tới 7 giờ tối.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_thanh_ninh ===
# npc:thanh_ninh
_{thanh_ninh} gõ cửa, tay cầm hóa đơn tiệm nail Lung Linh._
thanh_ninh: Chị {ke_toan} ơi, chị duyệt giùm em hóa đơn làm móng nha chị. Em làm móng để… tiếp khách cho sếp ạ. Chị hôm nay da đẹp quá chị ơi!
* [🧾 "Làm móng để tiếp khách thì khách tên gì em?"]
    ~ kt_hoa_don()
    thanh_ninh: Dạ… khách… ờ… khách VIP ạ.
    ~ qh("thanh_ninh", -5)
* [🔍 Lật mặt sau hóa đơn.]
    _Mặt sau có ghi địa chỉ tiệm. Không phải Lung Linh ở Tân Drama. Là chi nhánh ở Ven Đô, sát tòa nhà xanh lá chuối._
    ke_toan: Tiệm này ở Ven Đô hả em? Xa ghê.
    thanh_ninh: *(cười cứng)* Dạ… em đi lạc ạ.
    ~ phat_hien(ll_moi_nguyen)
* [😇 "Duyệt. Nhưng lần sau nộp kèm lịch làm việc của sếp ngày đó."]
    thanh_ninh: Dạ chị chu đáo quá chị ơi!
    ~ kt_quy(0)
    ~ qh("thanh_ninh", 5)
+ [👋 "Thôi, em về làm việc đi."]
    thanh_ninh: Dạ chị! Chị giữ gìn sức khỏe nha chị!
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_hong_hot ===
# npc:hong_hot
_{hong_hot} lao vào phòng kế toán, đóng cửa, thì thầm thật to._
hong_hot: Chị {ke_toan}! Nghe gì chưa?! Ối dồi ôi, biến căng rồi chị ơi!
* [🧾 "Chuyện gì cũng được. Nhưng hóa đơn ring light tháng trước đâu em?"]
    ~ kt_hoa_don()
    hong_hot: *(móc từ túi ra, nhàu)* Đây chị! Mà chị nghe nè…
    ~ qh("hong_hot", 3)
* [💬 "Kể đi. Nhưng đừng kể ai là chị nghe."]
    hong_hot: {chua_te_deadline} lần đầu nộp việc trước hạn! Cả phòng tưởng ảnh bị bệnh! Mà khoan… sao chị cười?
    ke_toan: Chị đang tính: lần đầu cả công ty không ai trễ deadline, tiết kiệm bao nhiêu tiền điện tăng ca.
    ~ qh("hong_hot", 10)
    ~ kt_ngu(-3)
* [😶 "Chị không nghe gì hết. Chị chỉ nghe tiếng máy tính bỏ túi."]
    hong_hot: Chán chị ghê! *(rồi bỏ lên bàn một cái kẹo)* Mà chị nhớ ngủ nha chị, mắt chị thâm như admin.
    ~ qh("hong_hot", 3)
+ [👋 "Thôi, em đi hóng tiếp đi."]
    hong_hot: Dạ! Có tin gì nóng em báo chị liền!
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
_{con_ong_chau_cha} đứng trước bàn, cầm hóa đơn cà phê Sống Ảo: 47 ly trong một tháng._
con_ong_chau_cha: Chị {ke_toan}, chị duyệt giùm em mấy cái này nha. Em làm việc ở quán, chill lắm.
* [🧾 "47 ly cà phê, một mình em. Làm việc gì em?"]
    ~ kt_hoa_don()
    con_ong_chau_cha: Dạ… làm… nhạc. À không, làm marketing.
    _Một giây lỡ miệng. Bạn ghi nhận._
    ~ phat_hien(bai_hat_long)
* [💬 "Thẻ phụ của em bị khóa rồi, chị biết. Em tự lo được không?"]
    con_ong_chau_cha: *(im lặng)* … Lần đầu có người hỏi em vậy. Em… đang thử. Em bán được một bài nhạc rồi chị.
    ~ qh("con_ong_chau_cha", 15)
* [🙅 "Không duyệt. Em làm ở công ty thì uống cà phê pantry, miễn phí."]
    con_ong_chau_cha: Máy pha cà phê pantry hỏng 30% số lần mà chị!
    ke_toan: Thì 70% còn lại.
    ~ kt_keo(5)
    ~ qh("con_ong_chau_cha", -5)
+ [👋 "Thôi, em đi làm đi."]
    con_ong_chau_cha: Để em gọi chú em… à thôi. Dạ, em đi.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_chua_te_deadline ===
# npc:chua_te_deadline
_{chua_te_deadline} gác chân lên ghế trong phòng kế toán, đưa hóa đơn quán bida Cơ Bản: "Họp dự án, 2h sáng, 6 bia, 1 bàn lỗ"._
chua_te_deadline: Chị duyệt nha. Họp thật mà. Chill.
* [🧾 "Họp dự án gì mà có bàn lỗ?"]
    ~ kt_hoa_don()
    chua_te_deadline: Dạ… dự án… đánh bi cho đẹp. Ok mom.
    ke_toan: Chị nhỏ hơn mẹ em nhiều đó.
    ~ qh("chua_te_deadline", -3)
* [💾 "{chua_te_deadline}. File gốc dự án tháng 6, hợp đồng 800 triệu. Đoàn thuế mà hỏi thì em đưa gì?"]
    chua_te_deadline: *(bỏ chân xuống, ngồi thẳng)* … ÉT O ÉT. Chị… biết hả?
    ke_toan: Chị biết khoản 800 triệu đó chưa có biên bản nghiệm thu.
    ~ phat_hien(usb_cua_vu)
    ~ qh("chua_te_deadline", 5)
* [🩷 "Gối ôm hồng của {sieu_nhan_hong} tặng em, có hóa đơn hông?"]
    chua_te_deadline: *(đỏ tai)* Chiêu PR mà chị…
    ke_toan: PR mà chỉ tặng một người thì hạch toán vào đâu em?
    chua_te_deadline: … Chị đừng hỏi khó em.
    ~ qh("chua_te_deadline", 5)
+ [👋 "Thôi, em làm việc đi. Còn sớm mà."]
    chua_te_deadline: Đúng rồi chị. Còn sớm mà.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
_{thuc_tap_sinh} mang lên một xấp phiếu chi đã điền sẵn, không sai một ô._
thuc_tap_sinh: Dạ chị, em điền giúp chị mấy phiếu này rồi ạ. Dạ em mới vô nên chưa biết, chị coi giúp em ạ.
* [🔍 Soi từng phiếu bằng kính lúp.]
    _Không sai một chữ. Chữ số viết kiểu ngân hàng: số 7 có gạch ngang, số 1 có mũ._
    ke_toan: {thuc_tap_sinh}. Trước đây em làm ngân hàng đúng không?
    thuc_tap_sinh: *(đứng hình)* … Dạ… chị đừng nói với ai được không ạ? Em sợ bị nhờ… vay tiền ạ.
    ~ phat_hien(duy_tung_lam_ngan_hang)
    ~ qh("thuc_tap_sinh", 10)
* [😇 "Cảm ơn em. Mà em ăn trưa chưa? Lại mì gói hả?"]
    thuc_tap_sinh: Dạ… mì gói là món em thích nhất ạ.
    _Bạn đưa {thuc_tap_sinh} hộp cơm có ghi tên "{ke_toan}". Lần đầu tiên bạn tự nguyện đưa hộp cơm cho ai._
    ~ qh("thuc_tap_sinh", 15)
    ~ an(-10)
* [💬 "{thuc_tap_sinh}. Mình bằng tuổi. Gọi tên được rồi."]
    thuc_tap_sinh: Dạ… dạ thôi chị. Ở đây em là thực tập. Dạ em quen rồi ạ.
    ~ qh("thuc_tap_sinh", 5)
+ [👋 "Thôi, em đi làm tiếp đi."]
    thuc_tap_sinh: Dạ em cảm ơn chị ạ!
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_hr ===
# npc:hr
_{hr} đứng ở cửa phòng kế toán, cười. Tay cầm hai ly trà._
hr: {ke_toan} rảnh không, uống trà xíu. Trà "Cân Bằng". Hợp với kế toán.
* [🍵 "Uống. Nhưng không bàn danh sách cắt giảm."]
    hr: Không bàn. *(ngồi xuống)* … {ke_toan} nè, nếu một ngày anh mở một quán trà nhỏ, kiểu… "Phòng Trà Nhân Sự", ai tới cũng được lắng nghe… anh cần một người giữ sổ.
    ke_toan: Quán trà mà cần kế toán trưởng hả anh?
    hr: Quán trà nào cũng cần người biết nói "hóa đơn đâu em". *(cười, lần này thật)*
    ~ qh("hr", 10)
* [🧾 "Anh {hr}, hóa đơn 40 loại trà trong phòng anh, ai trả?"]
    ~ kt_hoa_don()
    hr: Anh tự trả mà {ke_toan}. Không tin em lên căn hộ 604 xem, có cả sổ.
    ke_toan: Anh cũng có sổ hả?
    hr: Học em đó.
    ~ qh("hr", 5)
* [😶 "Lần khác anh."]
    hr: Dạ. Mình lắng nghe nhau lúc khác.
+ [👋 "Em đi làm việc đây."]
    hr: Dạ. Cửa phòng anh lúc nào cũng mở.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_it ===
# npc:it
_Phòng server. Lạnh. {it} đang ăn mì ly, cạnh chồng 9 ly mì rỗng._
it: Máy kế toán lỗi gì? Restart chưa?
* [🍱 "Không lỗi. Chị tới hỏi hộp cơm có ghi tên {ke_toan} hôm thứ 3."]
    it: *(dừng đũa)* … Lỗi người dùng. Em tưởng của chung.
    ke_toan: Chị ghi tên to vậy mà.
    it: … Em xin lỗi. *(đẩy sang một ly mì chưa mở)* Đền.
    ~ qh("it", 5)
* [💻 "Anh {it}, sao lưu dữ liệu kế toán mười năm, có không anh?"]
    it: Có. Ổ "KHÔNG ĐƯỢC MỞ". Từ 2016. Kế toán, file dự án, cả bản thu "Công Viên" chưa mix.
    ke_toan: Lỡ thuế hỏi thì anh mở giùm em nha.
    it: … Chị hỏi tử tế thì em mở.
    ~ qh("it", 10)
* [💸 "Anh {dan_dau_tu} nợ anh 3 triệu đúng không? Em có thể trừ lương ảnh trả anh."]
    it: *(lắc đầu)* Nợ người nào người đó trả. Mà… cảm ơn chị.
    ~ qh("it", 5)
+ [👋 "Thôi, anh ăn đi."]
    it: Đóng cửa giùm. Lạnh.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_idol_het_thoi ===
# npc:idol_het_thoi
_{idol_het_thoi} đeo kính đen, đặt lên bàn bạn một tờ đề nghị: "Phòng chờ riêng tại sự kiện đám cưới: 5 triệu"._
idol_het_thoi: Bà biết tui là ai không? Đi hát mà không có phòng chờ là mất giá.
* [🧾 "Tui biết ông là ai. Ông là người hát 'Công Viên'. Hóa đơn phòng chờ đâu ông?"]
    ~ kt_hoa_don()
    idol_het_thoi: *(tháo kính)* … Bà còn nhớ bài đó hả?
    ke_toan: Tui có mua đĩa năm 2015. Còn giữ hóa đơn.
    ~ qh("idol_het_thoi", 10)
* [💸 "Ông đang nợ tiền nhà đúng không?"]
    idol_het_thoi: *(im lặng)* … Ai nói?
    ke_toan: Không ai nói. Tui làm bảng lương. Ông xin ứng 4 tháng liên tiếp.
    idol_het_thoi: … Bà đừng nói với {quan_ly_idol} nha.
    ~ qh("idol_het_thoi", 5)
* [🙅 "Phòng chờ là cái ghế nhựa sau sân khấu. Miễn phí."]
    idol_het_thoi: Ghế nhựa… *(đeo kính lại)* Fan tui mà thấy là buồn lắm.
    ~ kt_keo(5)
    ~ qh("idol_het_thoi", -5)
+ [👋 "Thôi, ông đi luyện thanh đi."]
    idol_het_thoi: A a a a… Dạ!
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_quan_ly_idol ===
# npc:quan_ly_idol
_{quan_ly_idol} gọi tới bằng cả hai điện thoại cùng lúc. Bạn nghe hai giọng {quan_ly_idol} lệch nhau nửa giây._
quan_ly_idol: {ke_toan} ơi, duyệt giùm anh tiền xe cho {idol_het_thoi} đi hát đám cưới tối nay. Khoan, anh nghe máy chút…
* [🧾 "Anh {quan_ly_idol}, tháng 7 có ai trả giùm một tháng tiền nhà cho {idol_het_thoi}. Không qua công ty. Anh biết là ai hông?"]
    quan_ly_idol: *(im lặng ba giây, cả hai máy)* … Chuyện này để anh lo. Em đừng ghi vô sổ.
    ke_toan: Em không ghi. Tiền riêng thì sổ riêng.
    ~ phat_hien(thai_thuong_phat)
    ~ qh("quan_ly_idol", 5)
* [✅ Duyệt tiền xe ngay.]
    ~ kt_quy(-1)
    ~ qh("quan_ly_idol", 10)
    quan_ly_idol: Em là cứu tinh!
* [💼 "LL mời anh 36 triệu đúng hông anh?"]
    quan_ly_idol: … Sao em biết?
    ke_toan: Họ cũng mời em. Gấp đôi.
    quan_ly_idol: *(cười mệt)* Vậy là hai đứa mình đắt giá dữ ha.
    ~ qh("quan_ly_idol", 10)
+ [👋 "Anh nghe máy đi."]
    quan_ly_idol: Alo… alo!
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_bien_kich ===
# npc:bien_kich
_{bien_kich} đặt lên bàn bạn hóa đơn mua một cái máy đánh chữ cổ: "để lấy cảm hứng"._
bien_kich: Chị {ke_toan}. Một kịch bản hay cần nỗi đau. Còn một cái máy đánh chữ thì cần… chị duyệt.
* [🧾 "Nỗi đau thì miễn phí. Máy đánh chữ thì 3 triệu. Em chọn cái nào?"]
    ~ kt_hoa_don()
    bien_kich: *(trầm ngâm)* … Câu đó hay. Em mượn được không?
    ke_toan: Đây không phải đạo hả em?
    bien_kich: Đây là cảm hứng.
    ~ qh("bien_kich", 5)
* [📖 "Nghe nói em đang viết tiểu thuyết về công ty. Có chị trong đó hông?"]
    bien_kich: *(gấp cuốn sổ lại)* … Chị là nhân vật "người giữ chìa khóa". Rất có chiều sâu.
    ke_toan: Chị có tên thật trong đó hông?
    bien_kich: … Em sẽ đổi.
    ~ qh("bien_kich", -3)
* [🎬 "Phim ngắn của em, ý tưởng đẩy xe trong mưa… {thuc_tap_sinh} kể hôm 2/10, chị có ghi biên bản họp."]
    bien_kich: *(tái mặt)* … Chị ghi biên bản cả câu đó hả?
    ke_toan: Chị ghi mọi thứ.
    ~ phat_hien(nguoi_gac_ket)
    ~ qh("bien_kich", -10)
    ~ qh("thuc_tap_sinh", 5)
+ [👋 "Thôi, em đi tìm cảm hứng đi."]
    bien_kich: Cảm hứng không tìm được chị ạ. Nó tự tới. Như hóa đơn.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_editor ===
# npc:editor
_3 giờ sáng. Bạn quay lại công ty lấy cái kính lúp bỏ quên. Phòng dựng phim còn sáng đèn. {editor} đang ngồi, thanh render chạy 63%._
editor: *(ngáp)* … Chị {ke_toan}? Giờ này chị còn ở đây?
* [😶 "Chị không ngủ được. Em cũng vậy hả?"]
    editor: Em ngủ ban ngày chị. Ban đêm em mới tỉnh.
    _Hai người ngồi xem thanh render chạy. Không ai nói gì. 64%. 65%._
    ~ qh("editor", 10)
    ~ kt_ngu(-5)
* [🧾 "Bảng chấm công đêm của em: 47 đêm. Không ai tính tăng ca cho em hết."]
    editor: *(tỉnh hẳn)* … Có người đếm hả chị?
    ke_toan: Chị đếm. Tháng này chị tính đủ.
    ~ kt_quy(-5)
    ~ qh("editor", 20)
* [🦉 "Con cú nhỏ trong mấy video công ty, là em đúng hông?"]
    editor: *(ngáp, rồi cười)* … Render xong là xong chị.
    ~ qh("editor", 5)
+ [👋 "Chị về đây. Em ăn gì đi."]
    editor: Dạ… đợi render xong…
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_designer ===
# npc:designer
_{designer} đặt hóa đơn mua font chữ lên bàn bạn. Cùng lúc, laptop thứ hai trong balo cô ấy kêu "ting"._
designer: Chị duyệt giùm em tiền font. Font miễn phí xấu lắm chị.
* [🧾 "Font xấu thì không có hóa đơn. Font đẹp thì có. Em đưa đi."]
    ~ kt_hoa_don()
    designer: *(đưa)* Đây chị. Mà… chị không đòi em sửa gì hết hả?
    ke_toan: Chị chỉ sửa sổ. Không sửa poster.
    ~ kt_quy(-1)
    ~ qh("designer", 10)
* [💻 "Laptop thứ hai kêu kìa. Job bên ngoài hả em?"]
    designer: *(vội tắt)* Dạ… vẽ cho vui chị.
    _Màn hình kịp sáng một giây: một bộ hồ sơ màu xanh lá chuối, tên dự án "Hồng Ngoại"._
    ~ phat_hien(quynh_lam_cho_ll)
    ~ qh("designer", -5)
* [🤝 "Hôm hòa giải chị nói chuyện với {sales} rồi. Hai đứa em đừng giận chị nữa."]
    { qh_sales >= 10:
        designer: *(thở ra)* … {sales} kể rồi. Ok chị. Hòa.
        ~ qh("designer", 15)
    - else:
        designer: {sales} chưa nói gì với em hết chị.
    }
+ [👋 "Thôi, em làm tiếp đi."]
    designer: Dạ. Sửa nhẹ thôi là sửa cái gì ạ… à em nói quen miệng.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_sales ===
# npc:sales
_{sales} ngồi phịch xuống ghế đối diện, đặt lên bàn một tờ giấy ăn. Lần này viết bằng son._
sales: Chị {ke_toan}! Tạm ứng em 10 triệu thôi. Lần này chắc kèo thiệt!
* [🧾 "Thân chưa mà giỡn, {sales}. Hóa đơn đâu em?"]
    ~ kt_hoa_don()
    ~ kt_so_hoa_don_gia = kt_so_hoa_don_gia + 1
    sales: *(cười phá lên)* Chị bắt trend hả chị! Thôi được, em đi lấy hóa đơn!
    ~ qh("sales", 3)
* [💬 "{sales}, em 26 tuổi. Em mệt hông?"]
    sales: Mệt gì chị. Em là chị cả mà. *(rồi nhỏ giọng)* … Mệt chút chút.
    ke_toan: Không có hóa đơn thì không có tiền. Nhưng có mệt thì có trà. Ngồi đi.
    ~ qh("sales", 15)
* [😇 "Ứng 2 triệu. Mai đem hợp đồng lên."]
    ~ kt_quy(-2)
    ~ kt_keo(-3)
    sales: Chị số một!
    ~ qh("sales", 5)
+ [👋 "Thôi, em đi gặp đối tác đi."]
    sales: Dạ! Tin em đi chị!
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_chi_dai ===
# npc:chi_dai
_Kho sự kiện. {chi_dai} đang vác hai thùng loa. Thấy bạn, đặt xuống cái rầm._
chi_dai: Bà. Ăn cơm chưa? Mặt bà xanh như hóa đơn điện tử.
* [🍚 "Chưa. Bà có dư hộp nào hông?"]
    chi_dai: Có. Ngồi xuống đây.
    ~ an(50)
    ~ qh("chi_dai", 5)
    _Cơm sườn. Hai người ngồi trên thùng loa ăn. Không nói chuyện tiền._
* [🦪 "Tối nay đi ốc hông bà? Tui cần nói chuyện."]
    chi_dai: Đi. 8 giờ. Quán Ốc Đêm. Bà trả.
    ke_toan: Tui trả. Có hóa đơn.
    ~ kt_ngu(-20)
    ~ tien_cong(-150000)
    ~ an(40)
    ~ qh("chi_dai", 10)
    { RANDOM(1, 10) <= 2 && kt_huong_biet_quy_den:
        _Bàn bên cạnh có một người ngồi quay lưng, ăn rất chậm, rất lâu._
        ~ kt_them_dau_vet(1)
    }
* {kt_mo_nhanh_47b && kt_nhan_chung_47b == ""} [🔒 Đưa bìa nhựa có trang 47b: "Bà làm chứng giùm tui."]
    chi_dai: *(đọc, im lặng)* … Ông Siêu Nhân viết cái này hả? *(ký, to như ký hợp đồng mua nhà)* Rồi. Đứa nào nói tờ này giả, chỉ mặt tui.
    ~ kt_nhan_chung_47b = "chi_dai"
    ~ qh("chi_dai", 10)
    { kt_ky_thang_47b:
        ~ kt_47b_hieu_luc = true
        _Đủ ba chữ ký. Trang 47b có hiệu lực._
    }
+ [👋 "Thôi, bà làm tiếp đi."]
    chi_dai: Nhớ ăn trưa đó.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_dan_dau_tu ===
# npc:dan_dau_tu
_{dan_dau_tu} vào phòng kế toán bằng cửa sau. Phòng kế toán không có cửa sau. Anh ấy đi vòng qua phòng HR._
dan_dau_tu: {ke_toan}. Bảng lương tháng sau… em ứng anh trước được không? Lần này là lên thật.
* [🧾 "Anh {dan_dau_tu}, sổ nợ của anh: {con_ong_chau_cha} 10 triệu, {sales} 5, {it} 3, Bác {bac_bao_ve} 2, bốn người khác mỗi người 500 nghìn. Tổng 22 triệu."]
    dan_dau_tu: *(tái mặt)* … Em ghi hết hả?
    ke_toan: Em không ghi. Họ tới hỏi em có trừ lương anh được không. Từng người một.
    ~ qh("dan_dau_tu", -5)
* [📊 "Em ứng. Điều kiện: anh làm báo cáo số liệu fanpage thật cho chiến dịch, mỗi ngày một trang."]
    dan_dau_tu: *(lần đầu nghiêm túc)* … Deal. Anh làm thật.
    ~ kt_quy(-3)
    ~ follow(5000)
    ~ qh("dan_dau_tu", 10)
* [🙅 "Không. Anh cắt lỗ đi anh."]
    dan_dau_tu: Cắt lỗ là thua em ơi.
    ke_toan: Không cắt thì thua nhiều hơn anh.
    ~ kt_keo(3)
+ [👋 "Thôi, anh về bàn đi."]
    dan_dau_tu: Dạ. Đi đường vòng cho lành.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
_{thanh_xin_nghi} nộp đơn nghỉ phép thứ 9 trong năm. Lý do: "Bà ngoại em hơi mệt." Kèm giấy khám của Phòng khám Khỏe Re._
thanh_xin_nghi: Dạ chị… em xin nghỉ một ngày ạ. Giọng em yếu lắm. *(giọng khàn, như vừa hát cả đêm)*
* [🧾 "Giấy khám này của em. Đâu phải của bà ngoại em?"]
    ~ kt_hoa_don()
    thanh_xin_nghi: Dạ… bà ngoại em… khám ké ạ.
    ~ qh("thanh_xin_nghi", -3)
* [🔍 Soi giấy khám bằng kính lúp.]
    _Dưới con dấu phòng khám có một dòng in mờ của tờ giấy khác bị in chồng lên: "Thí sinh vòng bán kết – Giọng Ca Ước Mơ"._
    ke_toan: {thanh_xin_nghi}. Em đi thi hát hả?
    thanh_xin_nghi: *(đứng hình)* … Chị đừng nói với anh {hr} nha chị.
    ~ phat_hien(son_thi_hat)
    ~ qh("thanh_xin_nghi", 10)
* [✅ Duyệt. Nghỉ không lương.]
    thanh_xin_nghi: Dạ… không lương hả chị?
    ke_toan: Bà ngoại em mệt 9 lần trong năm. Phép năm của em hết từ tháng 4.
    ~ kt_keo(3)
+ [👋 "Thôi, em về đi. Giữ giọng."]
    thanh_xin_nghi: *(ngạc nhiên)* … Dạ.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_bac_bao_ve ===
# npc:bac_bao_ve
_Chòi bảo vệ. Ấm trà, cái radio, ghế bố. Bác {bac_bao_ve} rót sẵn một ly._
bac_bao_ve: Cháu {ke_toan}. Ngồi.
* [☕ Ngồi uống trà, không nói gì.]
    ~ kt_ngu(-10)
    ~ uong(20)
    ~ qh("bac_bao_ve", 5)
    _Radio báo mai mưa. Bác rót thêm trà hai lần. Bạn đếm: hai lần._
* [🧾 "Bác ơi, tiền trà đá tháng này, bác cho con xin hóa đơn."]
    bac_bao_ve: *(cười)* Mười năm, mỗi cháu hỏi bác câu đấy. *(đưa một tờ giấy viết tay)* Đây.
    _Tờ giấy ghi: "Trà tháng 10. 120 nghìn. {bac_bao_ve}." Kèm chữ ký ngay ngắn như chữ học trò._
    ~ kt_hoa_don()
    ~ qh("bac_bao_ve", 5)
* [💬 "Bác ơi, nếu một ngày con làm một việc mà người ta hiểu lầm… bác có tin con không?"]
    bac_bao_ve: Bác không thấy gì đâu. *(dừng lại)* Nhưng bác biết cháu là người thế nào.
    ~ qh("bac_bao_ve", 10)
    ~ kt_ngu(-5)
* {kt_mo_nhanh_47b && kt_nhan_chung_47b == ""} [🔒 Đưa bìa nhựa có trang 47b: "Bác làm chứng giùm con."]
    { qh_bac_bao_ve >= 10:
        bac_bao_ve: *(đeo kính, đọc chậm, rồi ký)* Bác làm chứng. Bác thấy hết.
        ~ kt_nhan_chung_47b = "bac_bao_ve"
        { kt_ky_thang_47b:
            ~ kt_47b_hieu_luc = true
            _Đủ ba chữ ký. Trang 47b có hiệu lực._
        }
    - else:
        bac_bao_ve: Giấy tờ người ta, bác không ký bừa đâu cháu.
    }
+ [👋 "Con lên làm việc đây bác."]
    bac_bao_ve: Ừ. Nhớ ngủ.
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
_Phòng chờ. {sieu_nhan_hong} vừa tạo dáng trước gương vừa ăn bánh chuối chiên. Dầu dính lên gương._
sieu_nhan_hong: {ke_toan}! Vì công lý và lượt view! Ăn bánh hông em?
* [🍌 Nhận một cái.]
    ~ nhan(chuoi_chien)
    ~ qh("sieu_nhan_hong", 5)
    sieu_nhan_hong: Cất làm chi, ăn liền đi em!
* [🧾 "Anh {sieu_nhan_hong}, phòng chờ tuần này hết 3 triệu bánh chuối chiên. Anh ăn một mình hả?"]
    ~ kt_hoa_don()
    sieu_nhan_hong: Hông! Anh chia cho bảo vệ, cho shipper, cho mấy đứa nhỏ ngoài cổng… Mà con chó hông chịu ăn bánh của anh!
    _Bạn ghi vào sổ: "Bánh chuối chiên: chi phí từ thiện." Hơi khó hạch toán. Nhưng thật._
    ~ qh("sieu_nhan_hong", 10)
* {kt_manh_moi_47b && not kt_mo_nhanh_47b && qh_sieu_nhan_hong >= 30} [🔒 "Anh {sieu_nhan_hong}, tờ viết tay sau trang 47… anh viết thật lòng hả?"]
    _{sieu_nhan_hong} nhìn quanh, rồi tháo mũ. Gương mặt bình thường, rụt rè._
    sieu_nhan_hong: Ờm… thật. Anh sợ mọi người cực vì anh. Mà anh quên kêu anh {giam_doc} ký.
    ~ kt_mo_nhanh_47b = true
    ~ phat_hien(trang_47b)
    ~ kt_ngu(-30)
    ~ qh("sieu_nhan_hong", 10)
* [💬 "Anh có sợ hông? Nếu tháng này không thành?"]
    sieu_nhan_hong: *(ngừng tạo dáng)* … Anh sợ mọi người mất việc vì anh. Còn anh thì… anh quen một mình rồi.
    ~ qh("sieu_nhan_hong", 10)
+ [👋 "Thôi, anh tập tiếp đi."]
    sieu_nhan_hong: Hồng không phải màu, Hồng là thái độ! *(tạo dáng tiễn)*
- -> END

// ------------------------------------------------------------
=== ke_toan_tudo_cho ===
# npc:cho
_{cho} nằm trước cửa phòng kế toán. Trên đầu nó, ai đó dán một tờ giấy "Bảo vệ hóa đơn"._
cho: Gâu.
* [🌭 Đưa xúc xích. Có hóa đơn cửa hàng tiện lợi.]
    { co(xuc_xich):
        ~ mat(xuc_xich)
    - else:
        ~ tien_cong(-15000)
    }
    ~ qh("cho", 15)
    cho: Gâu gâu! *(vẫy đuôi, nhai, nhìn bạn với ánh mắt biết ơn)*
    _Bạn ghi vào sổ riêng: "Xúc xích {cho}: 1/60."_
* [🐾 Xoa đầu.]
    ~ qh("cho", 5)
    cho: *(nhắm mắt, dụi đầu vào tay bạn)*
    ~ kt_ngu(-3)
* [📁 "{cho}, mày có thấy xấp hồ sơ năm 2017 của chị hông?"]
    cho: … *(đứng dậy, đi xuống gầm cầu thang, quay lại với một xấp giấy ướt nhẹp)*
    _Hồ sơ năm 2017. Có vết răng. Nhưng đủ trang._
    ~ qh("cho", 5)
+ [👋 Quay vào làm việc.]
    cho: Gâu. *(nằm xuống, tiếp tục "bảo vệ hóa đơn")*
- -> END
