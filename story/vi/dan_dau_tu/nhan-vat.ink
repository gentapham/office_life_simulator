// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · HỘI THOẠI TỰ DO VỚI 22 NHÂN VẬT
// ============================================================

// ------------------------------------------------------------
=== dan_dau_tu_tudo_ran_doc ===
# npc:ran_doc
ran_doc: Anh {dan_dau_tu} ơi, em mới vô nên tò mò. Nghe nói anh đọc số giỏi lắm. Anh có số liệu nào về… {sieu_nhan_hong} mà ít người biết không? Tui hỏi vậy thôi chứ không có ý gì đâu.
* [📊 "Số liệu chiến dịch là của công ty."]
    ran_doc: Dạ dạ, em hiểu mà. Anh nghiêm túc ghê.
    ~ qh("ran_doc", -3)
    ~ ddt_dc(2)
* [📈 "Muốn biết thì góp vốn với anh, anh kể."]
    ran_doc: *(cười)* Góp vốn hả anh? Nghe nói ai góp với anh cũng… thành chủ nợ hết đó.
    ~ ddt_noi_day()
    ~ qh("ran_doc", 3)
- ran_doc: Mà anh nè… nếu chiến dịch thất bại, anh nghĩ ai bị cắt đầu tiên?
* [😶 "Anh."]
    ran_doc: *(khựng lại)* Anh nói thật ghê. Tui… thôi tui đi.
    ~ qh("ran_doc", 5)
* [💬 "Sao em hỏi vậy?"]
    ran_doc: Hỏi cho biết thôi. Tui chỉ nói sự thật thôi mà.
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_giam_doc ===
# npc:giam_doc
giam_doc: {dan_dau_tu}! Vào đây. Anh hỏi em về số liệu. Mà… em có biết cái gì đầu tư nhanh không? Anh hỏi cho biết thôi.
_{giam_doc} nhìn bạn với ánh mắt của người đang cần tiền gấp. Bạn biết ánh mắt đó. Bạn thấy nó trong gương mỗi sáng._
* [😇 "Không có cái gì nhanh mà an toàn đâu anh. Em thử rồi."]
    giam_doc: *(im lặng)* Ừ… em nói thật đấy nhỉ. Anh hỏi cho biết thôi.
    ~ qh("giam_doc", 5)
    ~ ddt_nt(-5)
* [📈 "Hồng Coin, anh! Lên thật!"]
    { ngay < 18:
        giam_doc: Thế à? Thôi… để anh nghĩ. Mà em đừng nói với {ke_toan} anh hỏi nhé.
        ~ qh("giam_doc", 2)
    - else:
        giam_doc: Cái coin vừa sập tuần trước ấy à? Em ra ngoài đi.
        ~ qh("giam_doc", -10)
    }
- giam_doc: Còn gì nữa không? Anh đang có cuộc gọi với ngân hàng.
* [📊 "Anh, số liệu cho thấy livestream lúc 20:00 có người xem nhiều nhất."]
    giam_doc: 20:00 à? Ừ. Anh bảo {hong_hot}. Em giỏi đấy.
    ~ ddt_lam_that(2)
    ~ follow(3000)
* [😶 "Hết rồi anh."]
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_truong_phong ===
# npc:truong_phong
truong_phong: Anh {dan_dau_tu}, mình sync nhanh 5 phút nhé. Em cần số liệu "hiệu quả cuộc họp" để trình anh {giam_doc}. Số càng đẹp càng tốt.
* [📊 "Số thật: mỗi cuộc họp 5 phút kéo dài trung bình 117 phút."]
    truong_phong: *(nhìn tờ giấy rất lâu)* Một trăm… mười bảy. Ơ. Mình take note lại. Mình sẽ họp về con số này.
    ~ ddt_lam_that(3)
    ~ qh("truong_phong", -3)
* [📈 Vẽ một biểu đồ đi lên, tiêu đề "Năng suất họp".]
    truong_phong: Đẹp quá! Đúng ý em. Cảm ơn anh!
    ~ qh("truong_phong", 8)
    ~ ddt_dc(-3)
- truong_phong: À, anh nghĩ ai sẽ lên Phó Giám đốc? Em hay {con_ong_chau_cha}? Hỏi số liệu thôi.
* [📊 "Số liệu nói người làm việc thật. Mà video thật là của {editor} làm."]
    truong_phong: *(đỏ mặt)* Cái này… mình không bàn trong giờ làm.
    ~ qh("truong_phong", -5)
* [😶 "Số liệu chưa đủ."]
    truong_phong: Đúng. Mình cần thêm dữ liệu. Mình sẽ họp thêm.
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_thanh_ninh ===
# npc:thanh_ninh
thanh_ninh: Anh {dan_dau_tu} ơi, em cần một con số thật đẹp để đưa vào bài phát biểu khen anh {giam_doc}. Kiểu "dưới sự lãnh đạo của anh, công ty tăng trưởng…" mấy phần trăm vậy anh?
* [📊 "Âm 40% từ 2015 tới nay."]
    thanh_ninh: Dạ… âm thì… em không đọc được ạ. Anh nói chuẩn quá anh ơi, nhưng chuẩn quá thì… thôi ạ.
    ~ qh("thanh_ninh", -3)
    ~ ddt_dc(2)
* [📈 "Tháng 10 tăng 20.000% người theo dõi."]
    thanh_ninh: Ôi! Hai mươi nghìn phần trăm! Anh nói chuẩn quá anh ơi! Đúng chứ anh?
    dan_dau_tu: Từ 5.000 lên… à, ừ. Đúng.
    ~ qh("thanh_ninh", 8)
- thanh_ninh: *(nói nhỏ)* Mà anh… nếu một người muốn biết lương ở công ty khác bao nhiêu, thì nên hỏi ai ạ? Hỏi giùm bạn em.
* [💬 "Bạn em đang phỏng vấn ở tòa nhà xanh lá chuối hả?"]
    thanh_ninh: *(tái mặt)* Dạ… anh… sao anh…
    dan_dau_tu: Số liệu. Lịch hẹn của em trùng giờ tòa nhà đó mở cửa tuyển dụng.
    ~ qh("thanh_ninh", -5)
* [😶 "Hỏi HR."]
    thanh_ninh: Dạ thôi ạ. Em cảm ơn anh.
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_hong_hot ===
# npc:hong_hot
hong_hot: Anh {dan_dau_tu}! Nghe gì chưa? Anh {it} nói anh nợ ảnh 3 triệu từ tháng 3! Thiệt hả?
* [😢 "Thiệt."]
    hong_hot: Ối dồi ôi, anh nói thật kìa! Tui tưởng anh sẽ chối! Thôi tui không đăng group đâu, anh thật thà vậy mà.
    ~ qh("hong_hot", 5)
* [📈 "Không phải nợ. Là đầu tư vào… anh."]
    hong_hot: Ha ha! Câu này lên group được nè!
    ~ danh_tieng = danh_tieng - 3
    ~ qh("hong_hot", 3)
- hong_hot: Mà nè, giờ nào đăng bài thì nhiều người coi nhất vậy anh? Tui đăng hoài mà lúc được lúc không.
* [📊 "Tối 20:00. Trưa 12:15. Clip giúp người thì đăng sáng chủ nhật."]
    hong_hot: Sáng chủ nhật? Ủa sao? … Để tui thử! Nếu đúng tui bao anh trà sữa!
    ~ qh("hong_hot", 10)
    ~ ddt_lam_that(3)
    { qh_hong_hot >= 30:
        ~ follow(5000)
    }
* [📈 "Lúc nến xanh."]
    hong_hot: Anh nói tiếng chart hả? Tui hông hiểu!
    ~ ddt_soi_chart()
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha
con_ong_chau_cha: Anh {dan_dau_tu}, chill hông? Em đang nghĩ… nếu một bài hát đăng lên, làm sao biết người ta thích thật hay là thích vì… tên người hát?
* [📊 "Nhìn tỷ lệ nghe hết bài. Người ta nghe hết là thích thật."]
    con_ong_chau_cha: Nghe hết bài… Vậy… anh coi giùm em mấy bài này được hông? Không phải của em nha. Của "Rồng".
    ** [🤝 "Coi. Coi kỹ. Trừ vào cái vốn góp."]
        _Bạn phân tích 41 bản demo. Bản thứ 38 có tỷ lệ nghe hết cao nhất. Bạn đánh dấu sao._
        con_ong_chau_cha: Bản 38… là bản em thích nhất. Sao anh biết? … Trừ 2 triệu nha anh. Không, 3 triệu.
        ~ phat_hien(bai_hat_long)
        ~ ddt_xoa("con_ong_chau_cha", 3000000)
        ~ qh("con_ong_chau_cha", 15)
        ~ ddt_lam_that(5)
    ** [📈 "Bài hát thì sao bằng coin."]
        con_ong_chau_cha: Ờ… thôi. Chill.
        ~ qh("con_ong_chau_cha", -5)
* [📈 "Long, em có muốn góp thêm vốn không?"]
    { ngay < 18:
        con_ong_chau_cha: Ủa vốn cũ còn chưa thấy đâu mà anh. Mà… thôi, chill.
        ~ qh("con_ong_chau_cha", -3)
    - else:
        con_ong_chau_cha: Anh. Penthouse em đang bị rao bán. Em không còn tiền để chill nữa.
        ~ qh("con_ong_chau_cha", -8)
    }
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_chua_te_deadline ===
# npc:chua_te_deadline
chua_te_deadline: Anh {dan_dau_tu}, bida tối nay hông? Mà khỏi cá nha, anh nghèo quá tui ngại.
* [🎱 "Đánh. Không cá."]
    chua_te_deadline: Ok. Chill. Anh thấy hông, không cá mà vẫn vui đó.
    ~ qh("chua_te_deadline", 5)
    ~ cang_thang(-10)
* [📊 "Anh coi giùm em deadline: em còn mấy việc?"]
    chua_te_deadline: Ba mươi bảy việc. Nhưng còn sớm mà.
    dan_dau_tu: Theo số liệu, em hoàn thành 90% việc trong 10% thời gian cuối.
    chua_te_deadline: Đúng rồi! Nước tới chân mới nhảy, mà nhảy là phải đẹp!
    ~ qh("chua_te_deadline", 3)
- chua_te_deadline: Mà anh… anh nghĩ một người tặng mình toàn đồ màu hồng… là PR hả?
* [📊 "Đồ PR thì có logo. Đồ đó có logo không?"]
    chua_te_deadline: *(nghĩ)* …Không có. Có mỗi tờ giấy viết tay.
    _{chua_te_deadline} im lặng. Lần đầu tiên bạn thấy {chua_te_deadline} không lướt Tóp-tóp suốt 2 phút._
    ~ qh("chua_te_deadline", 8)
* [😶 Nhún vai.]
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh
thuc_tap_sinh: Dạ anh {dan_dau_tu}! Anh dạy em thêm Excel được không ạ? Em muốn làm báo cáo đẹp như anh ạ!
* [📊 Dạy {thuc_tap_sinh} hàm tra cứu.]
    _Bạn dạy. {thuc_tap_sinh} học nhanh tới đáng ngờ. Rồi tự viết một công thức lồng 4 lớp mà bạn chưa từng thấy._
    dan_dau_tu: Ủa? Em học ở đâu cái này?
    thuc_tap_sinh: Dạ… em tự học trên mạng ạ! *(giấu nhanh cái thẻ màu bạc vào túi)*
    ~ qh("thuc_tap_sinh", 8)
    ~ ddt_dc(2)
* [💬 "Em làm nghề gì trước đây?"]
    thuc_tap_sinh: Dạ… em làm… liên quan tới… tiền ạ. Mà em không muốn nhắc ạ. Người ta biết là người ta… mượn tiền ạ.
    _Bạn thấy hơi nhột._
    ~ qh("thuc_tap_sinh", 3)
- { ddt_no_duy > 0:
    thuc_tap_sinh: Dạ mà anh, 500 nghìn hôm trước anh mượn em… anh khỏi trả đâu ạ. Anh dạy em Excel là được rồi ạ.
    * [😇 "Không. Anh trả. Nhưng cảm ơn em."]
        { tien >= ddt_no_duy:
            ~ ddt_tra("thuc_tap_sinh", ddt_no_duy)
        }
        thuc_tap_sinh: Dạ… anh đúng là thần tượng thứ hai của em ạ! Sau anh {con_ong_chau_cha}!
        ~ qh("thuc_tap_sinh", 10)
        -> END
    * [🤝 "Vậy anh dạy em thêm 3 buổi. Coi như trả."]
        ~ ddt_xoa("thuc_tap_sinh", ddt_no_duy)
        ~ ddt_dc(3)
        ~ qh("thuc_tap_sinh", 8)
        -> END
}
-> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_ke_toan ===
# npc:ke_toan
ke_toan: Anh {dan_dau_tu}. Báo cáo doanh thu quảng cáo tháng này đâu? Không có báo cáo là không có tiền. À nhầm, không có hóa đơn là không có tiền. Mà báo cáo cũng vậy.
* [📊 Nộp báo cáo, đầy đủ, có cột đỏ.]
    ke_toan: Có cột đỏ. Thật. Tui thích báo cáo có cột đỏ. Báo cáo không có cột đỏ là báo cáo nói phét.
    ~ qh("ke_toan", 10)
    ~ ddt_lam_that(3)
* [📈 "Đang cập nhật. Thị trường biến động."]
    ke_toan: Thị trường nào? Công ty mình bán lượt xem chứ đâu bán coin.
    ~ qh("ke_toan", -5)
- ke_toan: *(nói nhỏ)* Anh {dan_dau_tu}. Anh đọc số giỏi. Anh nói thiệt: một triệu người theo dõi, có kịp không?
* {ddt_phan_tich_cao} [🔒 "Kịp. Nếu đổi hướng. Khán giả thích {sieu_nhan_hong} đi giúp người thật."]
    ke_toan: *(nhìn bạn rất lâu)* Lần đầu tui nghe anh nói "kịp" mà tui tin. Ông đi nói với sếp đi. Tui đứng sau.
    ~ qh("ke_toan", 15)
* [📈 "Lần này là lên thật."]
    ke_toan: *(thở dài)* Câu đó tui nghe 3 năm rồi.
    ~ qh("ke_toan", -3)
* [😶 "Chưa chắc."]
    ke_toan: Ừ. Chưa chắc là câu thật thà nhất tui nghe hôm nay.
    ~ qh("ke_toan", 3)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_hr ===
# npc:hr
hr: Anh {dan_dau_tu} rảnh không, lên phòng em uống trà xíu. Em chỉ muốn lắng nghe anh thôi.
hr: Em thấy… màn hình bên phải của anh lúc nào cũng sáng hơn màn hình bên trái. Anh nghĩ sao về điều đó?
* [😢 "Em nói đúng. Anh đang cố."]
    hr: Em ghi nhận. Thật lòng. Cố gắng là một hành trình, anh ha.
    ~ qh("hr", 8)
    ~ ddt_nt(-5)
* [📈 "Bên phải là… nghiên cứu thị trường."]
    hr: *(cười)* Thị trường của công ty mình là khán giả, anh {dan_dau_tu}. Em ghi nhận phản hồi của anh nha.
    ~ qh("hr", -5)
- hr: À, mà nếu… em nói nếu thôi… công ty cần một người đọc số cho phòng nhân sự, anh có làm không?
* [📊 "Làm. Nhưng không đọc số để cắt người."]
    hr: *(ly trà dừng lại)* …Em hiểu. Em cũng… không thích việc đó.
    ~ qh("hr", 10)
* [😶 "Để anh nghĩ."]
    hr: Dạ. Không gấp.
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_it ===
# npc:it
_Phòng server. Quạt công nghiệp quay vù vù. {it} ngồi ăn mì ly, không ngẩng lên._
it: Restart cái ví chưa anh?
* [😢 "Chưa. Ví anh không có nút nguồn."]
    it: *(gắp mì)* Ừ.
    _Im lặng. Rồi {it} đẩy sang cho bạn một ly mì ly còn nguyên._
    ~ an(25)
    ~ qh("it", 5)
* [💸 "Anh trả em 500 nghìn trước."]
    { tien >= 500000:
        ~ ddt_tra("it", 500000)
        it: *(ngẩng lên, lần đầu)* Ừ. Cảm ơn anh.
        ~ qh("it", 10)
    - else:
        it: Ví anh nói khác.
        ~ qh("it", -2)
    }
- it: Kho thiết bị. Chưa kiểm kê. 3 năm.
* [🤝 "Anh kiểm kê. Trừ nợ."]
    _Bạn ngồi kiểm kê 400 món thiết bị, từ cái micro năm 2015 tới cái router quấn băng keo. Bảng tính sạch đẹp._
    it: Trừ 1 triệu.
    ~ ddt_xoa("it", 1000000)
    ~ qh("it", 10)
    ~ ddt_lam_that(3)
    ~ nghi(-20)
* [😶 "Để tuần sau."]
    it: Ừ. Tuần sau.
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_idol_het_thoi ===
# npc:idol_het_thoi
idol_het_thoi: {dan_dau_tu}! Em biết anh là ai không? À anh biết, anh nợ em 500 nghìn mà. Ha ha. Đùa thôi. Mà… anh coi giùm em lượt nghe "Công Viên" tháng này được hông?
* [📊 Mở số liệu thật.]
    _Lượt nghe "Công Viên": tăng 300% sau đêm mất điện. Toàn tài khoản thật, bình luận thật: "Nghe mà nhớ tuổi thơ."_
    dan_dau_tu: Tăng gấp ba. Người thật. Không có bot.
    idol_het_thoi: *(kính đen trượt xuống)* Người… thật hả anh? Không phải… mấy cái tài khoản kia?
    dan_dau_tu: Không phải. Người thật nghe em hát trong bóng tối.
    idol_het_thoi: *(im lặng rất lâu)* …500 nghìn đó, anh khỏi trả. Con số này đáng hơn.
    ~ ddt_xoa("idol_het_thoi", 500000)
    ~ qh("idol_het_thoi", 15)
    ~ ddt_lam_that(3)
* [📈 "Lượt nghe thì không bằng Hồng Coin."]
    idol_het_thoi: Coin gì? Em không hiểu, mà nghe là thấy không ổn rồi.
    ~ qh("idol_het_thoi", -5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_quan_ly_idol ===
# npc:quan_ly_idol
quan_ly_idol: Ông {dan_dau_tu}. Khoan, tui nghe máy chút… Ừ. Ừ. Đừng ai đăng gì hết! … Rồi. Ông có số liệu gì cho tui không? Tui có 2 nghệ sĩ, 2 điện thoại, 0 thời gian.
* [📊 "{sieu_nhan_hong}: clip giúp người gấp 12 lần MV. {idol_het_thoi}: clip hát mộc gấp 5 lần clip có kính đen."]
    quan_ly_idol: *(đặt cả hai điện thoại xuống bàn, lần đầu tiên)* Ông nói lại tui nghe chậm chậm.
    _Bạn nói lại. {quan_ly_idol} ghi chép như học sinh._
    ~ qh("quan_ly_idol", 15)
    ~ ddt_lam_that(3)
* [📈 "Ông góp vốn với tui hông, cùng tuổi mà."]
    quan_ly_idol: Tui 37 tuổi, có 2 điện thoại, 0 đồng tiết kiệm. Ông kiếm người khác đi.
    ~ qh("quan_ly_idol", -3)
- quan_ly_idol: *(nói nhỏ)* Mà… ông có biết có ai đang lén trả tiền nhà cho ai đó, số liệu có lộ ra không?
* [😶 "Số liệu không đọc chuyện riêng."]
    quan_ly_idol: Ừ. Tốt. Cảm ơn ông.
    ~ qh("quan_ly_idol", 8)
* [💬 "Ông đang nói về ông hả?"]
    quan_ly_idol: *(cầm điện thoại lên)* Khoan, tui nghe máy chút.
    _Điện thoại không đổ chuông._
    ~ phat_hien(thai_thuong_phat)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_bien_kich ===
# npc:bien_kich
bien_kich: Anh {dan_dau_tu}… em cần số liệu: khán giả khóc ở phút thứ mấy thì không bấm tắt video? Kịch bản cần thêm nỗi đau, mà nỗi đau phải đúng giờ.
* [📊 "Phút thứ 2 tới 3. Sau đó thì người ta tắt."]
    bien_kich: Phút thứ hai… Em ghi lại. Anh là một nhà thơ của những con số.
    ~ qh("bien_kich", 8)
    { ddt_no_oanh > 0:
        bien_kich: Thôi, 500 nghìn hôm trước, coi như phí tư vấn. Đây không phải xóa nợ, đây là… nhuận bút.
        ~ ddt_xoa("bien_kich", ddt_no_oanh)
    }
* [💬 "Em viết về người thật hả?"]
    bien_kich: *(đóng sổ cái rụp)* Không! Đây là… cảm hứng. Đây không phải đạo, đây là cảm hứng.
    ~ qh("bien_kich", -3)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_editor ===
# npc:editor
editor: *(ngáp)* Anh {dan_dau_tu}… video nào của em được coi nhiều nhất… tháng này… anh biết không…
* [📊 "Clip hát trong bóng tối ngày mất điện. Và… cái kênh có con cú."]
    editor: *(tỉnh ngủ hẳn)* Anh… sao anh biết cái kênh đó…
    dan_dau_tu: Mỗi video có một con cú. Số liệu nhận ra mẫu lặp lại.
    editor: Anh đừng nói ai nha anh. Nhất là anh {truong_phong}.
    ~ phat_hien(kenh_cu_dem)
    ~ qh("editor", 5)
* [😶 "Ngủ đi em."]
    editor: Render xong… là ngủ…
    ~ qh("editor", 3)
- editor: Mà anh… kênh đó… nếu có người trả 200 triệu, có rẻ không anh?
* [📊 "980.000 người đăng ký. 200 triệu là rẻ. Rất rẻ."]
    editor: *(gật đầu chậm)* Em cũng nghĩ vậy. Cảm ơn anh.
    ~ qh("editor", 10)
* [📈 "Bán đi, rồi đầu tư!"]
    editor: … *(ngủ gục luôn trên bàn phím)*
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_designer ===
# npc:designer
designer: Anh {dan_dau_tu}, anh có số liệu nào chứng minh poster lần sửa đầu tiên tốt hơn lần sửa thứ 37 không? Em cần bằng chứng.
* [📊 "Có. Bản đầu có tỷ lệ bấm cao hơn 40%."]
    designer: *(nắm chặt tay)* BIẾT MÀ! Em in cái này ra dán lên bàn sếp! Cảm ơn anh!
    ~ qh("designer", 15)
    ~ ddt_lam_that(3)
* [😶 "Thẩm mỹ không đo được."]
    designer: Đo được chứ! Đo bằng số lần em muốn nghỉ việc!
    ~ qh("designer", 2)
- designer: *(nói nhỏ)* Mà anh… nếu một người làm thêm cho… công ty khác, số liệu có lộ ra không anh?
* [💬 "Nếu file còn logo xanh lá chuối thì lộ."]
    designer: *(đứng hình)* … Em đi kiểm tra file. Ngay.
    ~ phat_hien(quynh_lam_cho_ll)
    ~ qh("designer", 5)
* [😶 "Không biết."]
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_sales ===
# npc:sales
sales: Anh {dan_dau_tu}! Đứng lại! À không, hôm nay em không đòi. Hôm nay em cần anh. Tin em đi, chuyện nhỏ.
sales: Anh làm giùm em cái báo cáo KPI. Đẹp. Ba trăm phần trăm.
* [📊 "Anh làm báo cáo thật. Thật thì trừ nợ."]
    sales: Thật? *(cắn môi)* … Báo cáo thật thì… không đẹp đâu anh.
    dan_dau_tu: Không đẹp, nhưng không ai bắt được.
    sales: *(thở ra)* Ok. Làm thật. Trừ anh 1 triệu. Mà anh giữ kín giùm em nha.
    ~ ddt_xoa("sales", 1000000)
    ~ qh("sales", 10)
    ~ ddt_lam_that(5)
* [📈 Làm báo cáo đẹp, 300%.]
    sales: Đỉnh! Trừ anh 1 triệu luôn!
    ~ ddt_xoa("sales", 1000000)
    ~ ddt_dc(-10)
    ~ qh("sales", 10)
    _Bạn vừa trả nợ bằng một tờ báo cáo nói phét. Nó nhẹ hơn bạn tưởng. Đó là điều đáng sợ._
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_chi_dai ===
# npc:chi_dai
chi_dai: {dan_dau_tu}. Ăn cơm chưa?
* [😢 "Bánh mì, ăn lén."]
    chi_dai: Ăn lén cái gì, có ai giành đâu. Ngồi xuống. *(đặt hộp cơm lên bàn)* Ăn hết.
    ~ an(55)
    ~ qh("chi_dai", 8)
* [📈 "Anh đang đợi nến xanh rồi mới ăn."]
    chi_dai: *(nhìn bạn)* Anh ăn cơm đi rồi nói chuyện với nến sau.
    ~ an(55)
    ~ qh("chi_dai", 3)
- chi_dai: Nghe nè. Đứa nào trong công ty anh nợ, chị biết hết. Chị không bênh anh. Nhưng chị không để ai làm nhục anh. Hiểu chưa?
* [😢 "Dạ. Cảm ơn chị."]
    chi_dai: Cảm ơn thì trả nợ. Từ từ. Mỗi tháng một ít. Chị giám sát.
    ~ qh("chi_dai", 10)
    ~ ddt_nt(-5)
* [🗣️ "Hay chị góp vốn với em, mình…"]
    chi_dai: *(đặt đũa xuống)* Nói lại coi.
    dan_dau_tu: …Dạ không có gì.
    ~ qh("chi_dai", -10)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi
thanh_xin_nghi: *(gọi điện, giọng yếu ớt)* Anh {dan_dau_tu}… em hơi sốt… mà anh đọc số giỏi… anh coi giùm em… lượt bình chọn một cuộc thi hát… được hông?
* [📊 "Thí sinh số 14 hả? Đang đứng thứ ba. Bình chọn tăng mạnh mỗi lần có clip hậu trường."]
    thanh_xin_nghi: *(giọng khỏe hẳn)* Thứ ba! … À khụ khụ… em đang sốt.
    dan_dau_tu: Đăng clip hậu trường lúc 21:00. Người ta thích thấy thí sinh thật.
    thanh_xin_nghi: Anh… anh là ân nhân của em. 500 nghìn hồi tháng 3, coi như xong!
    ~ phat_hien(son_thi_hat)
    ~ ddt_xoa("thanh_xin_nghi", 500000)
    ~ qh("thanh_xin_nghi", 15)
* [😶 "Đi khám bệnh đi em."]
    thanh_xin_nghi: Dạ… em đi liền. Phòng khám Khỏe Re. Lần thứ 9.
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_bac_bao_ve ===
# npc:bac_bao_ve # noi:choi_bao_ve
_Chòi bảo vệ. Radio phát tin thời tiết. Bác {bac_bao_ve} rót hai ly trà, đẩy một ly sang._
bac_bao_ve: Cậu {dan_dau_tu}. Ngồi.
* [😶 Ngồi xuống, uống trà, không nói gì.]
    bac_bao_ve: Ừ. Thế là được. Không phải lúc nào cũng phải nói.
    ~ qh("bac_bao_ve", 5)
    ~ cang_thang(-10)
    ~ uong(25)
* [💸 "Bác ơi, con gửi bác một ít."]
    { ddt_no_binh > 0 and tien >= 500000:
        ~ ddt_tra("bac_bao_ve", 500000)
        bac_bao_ve: Bác không cần gấp mà. Thôi được. Cậu đã đưa thì bác cầm.
        ~ qh("bac_bao_ve", 10)
    - else:
        { ddt_no_binh == 0:
            bac_bao_ve: Cậu trả bác hết rồi còn gì. Ngồi uống trà đi.
            ~ qh("bac_bao_ve", 5)
        - else:
            bac_bao_ve: Cậu cứ giữ mà ăn cơm. Bác không vội.
            ~ qh("bac_bao_ve", 3)
        }
    }
- bac_bao_ve: Hồi 2010, cái công ty này chỉ có một cái máy tính. Có một người… ngồi tính sổ sách bằng tay cả đêm. Cậu làm bác nhớ người đó.
* {qh_bac_bao_ve >= 60} [💬 "Người đó giờ ở đâu bác?"]
    bac_bao_ve: *(nhìn ra cổng rất lâu)* Xa. Nhưng vẫn nhớ cái công ty này. Bác không thấy gì đâu. Cậu cũng không nghe gì nhé.
    ~ qh("bac_bao_ve", 5)
    ~ ddt_dc(2)
* [😇 "Con sẽ tính sổ cho đàng hoàng, bác."]
    bac_bao_ve: Ừ. Tính sổ của mình trước. Rồi mới tính được sổ của người khác.
    ~ qh("bac_bao_ve", 5)
    ~ ddt_nt(-5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong
sieu_nhan_hong: Biến hình! Anh {dan_dau_tu}! Anh là người làm số liệu hả? Số liệu của em đẹp hông anh?
* [📊 "Đẹp nhất khi em không diễn. Clip giúp người gấp 12 lần MV."]
    sieu_nhan_hong: *(khựng lại, giọng nhỏ hẳn)* Thiệt hả anh… Người ta thích… lúc em không diễn hả?
    dan_dau_tu: Ừ. Số liệu không nói dối.
    sieu_nhan_hong: *(tháo mũ ra một chút, gãi đầu)* Vậy… em đi giúp người tiếp nha. Đó là việc em thích nhất mà.
    ~ qh("sieu_nhan_hong", 15)
    ~ ddt_lam_that(3)
* {ngay >= 9 and ngay < 18 and ddt_mua_hong} [📈 "Em quay một clip nói 'Mua Hồng Coin đi' được hông? Coin mang tên em mà."]
    sieu_nhan_hong: Coin mang tên em hả? Vui ghê! Được nè! Hồng là thái độ, coin cũng hồng!
    ~ ddt_nguyen_quang_ba_coin = true
    ~ follow(30000)
    ~ ddt_nt(10)
    _Clip lên. $HONG tăng 15% trong 1 giờ. Bạn thấy vui. Một phần nhỏ trong bạn thấy rất, rất không ổn._
    { qh_chi_dai >= 0:
        chi_dai: *(nhắn bạn)* {dan_dau_tu}. Gỡ clip đó xuống. Ngay. Không hỏi lại lần hai.
        ~ qh("chi_dai", -15)
    }
- sieu_nhan_hong: Mà anh ơi, con chó ở cổng sao ghét em quá vậy? Em chỉ giỡn với nó thôi mà.
* [📊 "Mỗi lần em giả tiếng sủa, nó gầm gừ. 23 lần trong tháng. Số liệu nói: đừng giỡn nữa."]
    sieu_nhan_hong: Hai mươi ba lần… Ờ… vậy để em thử… không giỡn.
    ~ qh("sieu_nhan_hong", 5)
    ~ qh("cho", 5)
* [😶 Cười.]
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_tudo_cho ===
# npc:cho
_{cho} chặn bạn ở chân cầu thang, đánh hơi túi quần bạn, nơi cái điện thoại đang mở chart._
cho: Grừ… *(nhìn túi quần, rồi nhìn bạn)*
* [📱 Tắt chart, cất điện thoại.]
    cho: Gâu. *(vẫy đuôi một cái, rồi đi)*
    ~ qh("cho", 5)
    ~ ddt_so_lan_tat_app = ddt_so_lan_tat_app + 1
* {co(xuc_xich)} [🌭 Đưa {cho} cây xúc xích.]
    ~ mat(xuc_xich)
    cho: Gâu gâu! *(ăn trong 2 giây, rồi nằm ngửa ra cho gãi bụng)*
    ~ qh("cho", 15)
* [🐾 Ngồi xuống xoa đầu.]
    cho: *(nghiêng đầu, cho xoa, mắt lim dim)*
    ~ qh("cho", 8)
    ~ cang_thang(-10)
- { qh_bac_bao_ve <= -10:
    _{cho} bỗng gầm gừ, như nhớ ra điều gì đó. Có thể là câu "Bác có muốn đầu tư hông?"._
    ~ qh("cho", -3)
}
-> END
