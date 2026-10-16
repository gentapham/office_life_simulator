// ============================================================
// HỘI THOẠI TỰ DO CỦA RẮN ĐỘC VỚI 22 NHÂN VẬT
// Mỗi cảnh mở khi người chơi bắt chuyện với NPC đó (thẻ npc:<mã>).
// ============================================================

// ------------------------------------------------------------
=== ran_doc_tudo_giam_doc ===
# npc:giam_doc # noi:phong_giam_doc
giam_doc: {ran_doc} à. Vào đây. Em làm truyền thông nội bộ, em thấy tinh thần anh em thế nào?
* [😇 "Dạ mọi người tin anh lắm anh."]
    giam_doc: Tốt. Anh biết mà. Công ty là gia đình.
    ~ qh("giam_doc", 5)
    giam_doc: Mà em có nghe ai nói gì về… biệt thự, ngân hàng gì không?
    * * [😶 "Dạ em không nghe gì hết anh."]
        giam_doc: Ừ. Tốt. Không nghe gì là tốt nhất.
    * * [🐍 "Dạ có nghe loáng thoáng, mà em dập rồi anh."]
        giam_doc: *(nuốt nước bọt)* Em… dập được à? Em giỏi đấy. Anh không ép, nhưng có gì báo anh trước nhé.
        ~ qh("giam_doc", 5)
        ~ rd_tin_mat()
    + + -> ran_doc_tudo_het_chuyen
* [🧂 "Dạ có vài người than lương trễ, mà em nghĩ chắc tại ngân hàng."]
    giam_doc: Đúng! Tại ngân hàng! Em hiểu vấn đề. Em check lại cái mindset cho mọi người giúp anh.
    ~ qh("giam_doc", 3)
    ~ rd_them_mam(3, 0)
* {biet(clone_thang)} [🔒 "Anh ơi, hoa hướng dương nở vào mùa nào vậy anh?"]
    giam_doc: *(cứng người)* …Em hỏi thế là có ý gì?
    giam_doc: Thôi được. Em muốn gì, em cứ nói. Anh không ép.
    ~ rd_do_doc = gioi_han(rd_do_doc + 10)
    ~ rd_nghi(5)
    ~ qh("giam_doc", -10)
    ~ uy_tin = uy_tin + 10
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_truong_phong ===
# npc:truong_phong # noi:phong_hop_sang_tao
truong_phong: {ran_doc}! Đúng lúc. Mình sync nhanh 5 phút về bản tin nhé.
* [😇 "Dạ 5 phút thôi nha anh, em còn chạy giấy."]
    truong_phong: Ừ, 5 phút thôi. *(mở slide số 1 trên 34)*
    ~ cang_thang(5)
    ~ qh("truong_phong", 5)
* [🐍 "Anh ơi, nghe nói anh {con_ong_chau_cha} sắp được chú đề bạt Phó Giám đốc rồi."]
    truong_phong: Cái gì? Ai nói? Tớ… à anh có đơn xin đề bạt sửa 14 lần rồi đấy!
    ~ rd_tung_tin(8, 5)
    ~ rd_tin_mat()
    truong_phong: Em nghe ở đâu? Thôi, mình họp riêng về việc này. Họp khẩn.
* [💬 "Anh ơi, cái bát ở quê anh là cái tô hả?"]
    truong_phong: Không, cái bát là cái bát. Cái tô là cái tô to hơn. Ở đây các cậu gọi lẫn lộn hết.
    truong_phong: Mà sao em hỏi? Thôi, cái này mình take note, họp sau nhé.
    ~ qh("truong_phong", 3)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_thanh_ninh ===
# npc:thanh_ninh # noi:ban_tro_ly
thanh_ninh: Ủa {ran_doc}. Chị nói em nghe nè, muốn gặp sếp thì phải qua chị trước nha.
* [💬 "Bà bằng tuổi tui mà, xưng chị chi vậy?"]
    thanh_ninh: Ở đây chức vụ thắng tuổi tác nha em. Trợ lý giám đốc là cánh tay phải.
    ~ qh("thanh_ninh", -2)
* [🙇 "Dạ chị nói chuẩn quá chị ơi."]
    thanh_ninh: *(nheo mắt)* Ủa… câu đó của chị mà. Em đang nịnh chị hả? Được. Chị thích.
    ~ qh("thanh_ninh", 8)
+ -> ran_doc_tudo_het_chuyen
- thanh_ninh: Mà em làm truyền thông nội bộ, đừng có viết gì làm sếp buồn nha. Sếp buồn là chị buồn.
* [🐍 "Dạ. Mà chị ơi, sảnh LL-Entertainment có máy lạnh mát hông chị?"]
    thanh_ninh: *(mặt trắng bệch)* Em… em nói gì chị không hiểu.
    ~ rd_tin_mat()
    ~ rd_nghi(5)
    ~ qh("thanh_ninh", -10)
* [😇 "Dạ em biết rồi. Có gì chị chỉ em thêm."]
    thanh_ninh: Ngoan. Có gì hay thì kể chị trước nha.
    ~ qh("thanh_ninh", 5)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_hong_hot ===
# npc:hong_hot # noi:ban_mang_xa_hoi
hong_hot: Ê ê, nghe gì chưa? Ối dồi ôi hôm nay có chuyện này hay lắm!
* [💬 "Kể nghe coi bà."]
    hong_hot: Nghe nói chị {ke_toan} với anh {hr} hay uống trà chung lắm nha. Trà hai người á.
    hong_hot: Mà ông đừng kể ai nha. Tui chỉ kể ông thôi. Với 6 người nữa.
    ~ rd_tin_mat()
    ~ qh("hong_hot", 3)
* [🧂 "Tui cũng có chuyện nè: hình như {chua_te_deadline} được Siêu Nhân Hồng tặng gối ôm hồng."]
    hong_hot: TRỜI ĐẤT ƠI! Đám cá tươi! Để tui đăng… à không, để tui kể.
    ~ rd_them_mam(5, 3)
    ~ qh("hong_hot", 8)
* [😇 "Thôi tui không hóng nữa, mệt."]
    hong_hot: Ủa alo? Ông bị gì vậy? Ông bệnh hả? Uống thuốc chưa?
    ~ rd_tin(3)
+ -> ran_doc_tudo_het_chuyen
- hong_hot: Mà phòng mình sát vách đó, tối nay đừng có hát karaoke như chú Sáu nha.
* [🤝 "Bà livestream nhỏ nhỏ thôi là được."]
    hong_hot: Hông hứa. Mà dễ thương ha. Hàng xóm tốt.
    ~ qh("hong_hot", 5)
* [🐍 "Tui nghe hết bà nói chuyện đêm qua đó."]
    hong_hot: *(đứng hình)* …Nghe tới đoạn nào?
    ~ rd_tin_mat()
    ~ qh("hong_hot", -5)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_con_ong_chau_cha ===
# npc:con_ong_chau_cha # noi:ca_phe_song_ao
con_ong_chau_cha: Ê {ran_doc}. Ngồi đi. Ly này 85 nghìn, để tui bao. Chill đi.
* [😇 "Cảm ơn ông. Mà ông hay ngồi đây làm việc hả?"]
    con_ong_chau_cha: Làm việc… ờ, gọi là làm việc. Thật ra tui ngồi nghe nhạc, viết linh tinh.
    ~ an(5)
    ~ qh("con_ong_chau_cha", 5)
* [🐍 "Ông sướng ha. Có chú làm giám đốc, khỏi lo gì."]
    con_ong_chau_cha: *(cười mà không vui)* Ai cũng nói vậy. Để anh gọi chú anh… à mà thôi, gọi làm gì.
    ~ qh("con_ong_chau_cha", -5)
    ~ rd_tin_mat()
+ -> ran_doc_tudo_het_chuyen
- con_ong_chau_cha: Ông thấy cái điệp khúc này sao? *(ngân nga)* "Hồng là thái độ… không phải là màu…"
* [🤝 "Hay đó. Ông tự viết hả? Sao không đưa cho Siêu Nhân Hồng hát?"]
    con_ong_chau_cha: Suỵt! Đừng nói ai. Tui… tui chưa dám. Ông là người đầu tiên nghe đó.
    ~ phat_hien(bai_hat_long)
    ~ qh("con_ong_chau_cha", 15)
* [🐍 "Nghe giống bài quảng cáo bột giặt."]
    con_ong_chau_cha: *(im lặng, cất điện thoại)* Ờ. Chắc vậy.
    ~ qh("con_ong_chau_cha", -10)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_chua_te_deadline ===
# npc:chua_te_deadline # noi:ban_lam_viec
_{chua_te_deadline} đang lướt Tóp-tóp, chân gác lên bàn._
chua_te_deadline: Gì đó ông? Còn sớm mà. Chill, kịp hết.
* [💬 "Deadline MV là ngày mai đó."]
    chua_te_deadline: Ngày mai là ngày mai. Nước tới chân mới nhảy, mà nhảy là phải đẹp.
    ~ qh("chua_te_deadline", 3)
* [🐍 "Ông có làm mất file gì hông? Thấy ông lục bãi xe hoài."]
    chua_te_deadline: *(ngừng lướt)* …Ai nói ông vậy?
    ~ rd_tin_mat()
    ~ qh("chua_te_deadline", -5)
+ -> ran_doc_tudo_het_chuyen
- chua_te_deadline: Mà nè, cái ông Siêu Nhân Hồng cứ tặng tui đồ hồng hoài. Chiêu PR ha? Mà PR với tui làm chi, tui có phải KOL đâu.
* [🐍 "Chắc là PR đó. Ổng tặng ai cũng vậy hết."]
    chua_te_deadline: Ờ. Biết mà. *(lướt tiếp, mà lướt chậm hơn)*
    ~ rd_do_doc = gioi_han(rd_do_doc + 5)
    ~ rd_han(3)
* [😇 "Tui thấy ổng chỉ tặng mình ông đó."]
    chua_te_deadline: *(ngẩng lên)* …Thiệt hả?
    ~ rd_han(-3)
    ~ qh("chua_te_deadline", 5)
* [😶 Nhún vai.]
    chua_te_deadline: Ờ. Kệ. Còn sớm mà.
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_thuc_tap_sinh ===
# npc:thuc_tap_sinh # noi:pantry
thuc_tap_sinh: Dạ anh {ran_doc} ơi, em mới vô nên chưa biết. Anh {truong_phong} có khó tính không ạ?
* [🐍 "Ổng hả? Đứa thực tập trước bị ổng đuổi vì pha cà phê ngọt quá đó."]
    thuc_tap_sinh: *(run tay)* Dạ… dạ em pha lại liền ạ!
    ~ rd_tung_tin(5, 3)
    ~ qh("thuc_tap_sinh", -3)
* [🤝 "Ảnh hơi nhiều họp thôi, chứ cũng dễ. Mà ông lớn hơn tui, gọi tui bằng tên được rồi."]
    thuc_tap_sinh: *(rưng rưng)* Dạ… anh… à {ran_doc}… cảm ơn anh. Em cảm động quá ạ.
    ~ qh("thuc_tap_sinh", 15)
    ~ rd_tin(3)
* [📸 "Ông giúp tui một việc nhỏ, tui kể ông nghe hết bí mật phòng này."]
    thuc_tap_sinh: Dạ việc gì em cũng làm ạ!
    ~ rd_tai_mat_duy = true
    ~ rd_tin_mat()
    _Nếu chuyện này lộ ra, {chi_dai} sẽ không tha cho bạn._
+ -> ran_doc_tudo_het_chuyen
- thuc_tap_sinh: Dạ mà anh ơi, 6-7 nghĩa là gì vậy ạ? Mấy bạn trẻ nói hoài mà em không hiểu.
* [😇 "Không nghĩa gì hết. Nói cho vui thôi."]
    thuc_tap_sinh: Dạ… 6-7! *(cười rất tự hào)*
* [🐍 "Nghĩa là 'anh đẹp trai quá'. Ông nói với anh {hr} thử coi."]
    thuc_tap_sinh: Dạ em đi liền ạ!
    ~ rd_tung_tin(3, 2)
    _5 phút sau, {hr} được một thực tập sinh 30 tuổi nhìn vào mắt nói "6-7". Nụ cười của {hr} lần đầu tiên bị lệch._
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_ke_toan ===
# npc:ke_toan # noi:phong_ke_toan
ke_toan: Gì đó em? Hóa đơn đâu em?
* [😇 "Dạ em không xin tiền, em hỏi thăm chị thôi."]
    ke_toan: *(nhìn bạn như nhìn hóa đơn giả)* Hiếm. Ngồi đi.
    ~ qh("ke_toan", 5)
* [💬 "Chị ơi, cho em ứng trước ít lương."]
    ke_toan: Không có hóa đơn là không có tiền. Mà lương thì không có hóa đơn. Em hiểu ý chị không?
    ~ cang_thang(3)
+ -> ran_doc_tudo_het_chuyen
- ke_toan: Em làm truyền thông thì nhắc mọi người giùm chị: bảo hiểm có theo luật, đừng hỏi chị nữa.
* {biet(trang_47)} [🔒 "Chị ơi, trang 47… chị định làm gì?"]
    ke_toan: *(đặt bút xuống)* Em biết bao nhiêu?
    ke_toan: Thôi. Biết rồi thì giữ. Tôi đang cố. Mọi người cũng phải cố. Siêu Nhân Hồng phải tới một triệu.
    ~ qh("ke_toan", 10)
    ~ rd_tin(5)
    ~ rd_han(-3)
* [🧂 "Dạ. Mà nghe nói chị {sales} lại xin tạm ứng không hóa đơn hả chị?"]
    ke_toan: Lần thứ 9 trong tháng. Thân chưa mà giỡn.
    ~ rd_them_mam(3, 0)
    ~ qh("ke_toan", 3)
    ~ qh("sales", -3)
* [😇 "Dạ em nhắc liền."]
    ~ qh("ke_toan", 3)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_hr ===
# npc:hr # noi:phong_hr
hr: Em rảnh không, lên phòng anh uống trà xíu. Không có gì đâu, anh chỉ muốn lắng nghe em thôi.
_Phòng HR. Kệ trà 40 loại, xếp theo bảng chữ cái. {hr} rót trà, cười._
* [😇 "Dạ trà này thơm quá anh."]
    hr: Trà ô long số 23. Anh pha cho người anh quý thôi.
    ~ qh("hr", 5)
    ~ uong(15)
* [💬 "Anh ơi, em có làm gì sai hông anh?"]
    hr: Không. Chưa. Mình cùng nhìn lại hành trình của em nha. Ba tuần, nhiều câu chuyện.
    { rd_nghi_ngo >= 50:
        hr: Có vài câu chuyện… tên em xuất hiện hơi nhiều.
        ~ cang_thang(10)
    }
+ -> ran_doc_tudo_het_chuyen
- hr: Mà nè. Nếu em nghe ai nói về một "danh sách", em báo anh trước nha.
* [🐍 "Danh sách gì anh? Có tên em hông?"]
    hr: *(cười rộng hơn)* Em hỏi khéo đó. Uống trà đi em.
    ~ rd_nghi(3)
    ~ rd_tin_mat()
* [😇 "Dạ em báo anh."]
    hr: Anh tin em. Em là người tích cực.
    ~ qh("hr", 5)
* [💬 "Anh làm cái danh sách đó có vui hông anh?"]
    hr: *(im lặng rất lâu)* …Không. Không vui chút nào.
    ~ qh("hr", 10)
    ~ rd_tin_mat()
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_it ===
# npc:it # noi:phong_server
it: Chuyện gì.
* [💬 "Máy em chậm quá anh."]
    it: Tắt đi bật lại thử chưa?
    * * [😇 "Dạ rồi."]
        it: Thì bật lại lần nữa. *(cắn mì ly)*
    * * [😶 "Dạ… chưa."]
        it: Lỗi người dùng.
        ~ cang_thang(3)
    + + -> ran_doc_tudo_het_chuyen
* [🍜 Đưa một ly mì ly.]
    it: …Cảm ơn.
    ~ qh("it", 8)
+ -> ran_doc_tudo_het_chuyen
- it: Mà. Log máy anh có vài cái lạ. Giờ lạ, chỗ lạ.
* [😇 "Anh thấy gì cứ nói em, em sửa."]
    it: Không sửa được. Chỉ đừng làm thêm. *(quay lại màn hình)*
    ~ rd_nghi(-3)
    ~ qh("it", 3)
* [🐍 "Anh đọc log mọi người hả? Vậy anh biết admin confession là ai hông?"]
    it: Biết. Không nói. Như anh vậy. Tôi cũng không nói về anh.
    ~ rd_tin_mat()
    ~ rd_nghi(5)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_idol_het_thoi ===
# npc:idol_het_thoi # noi:phong_cho
_{idol_het_thoi} đeo kính đen trong phòng chờ không có cửa sổ._
idol_het_thoi: Em là ai? À, nhân viên mới. Em biết anh là ai không?
* [😇 "Dạ anh hát 'Công Viên'. Hồi đó em thuộc hết."]
    idol_het_thoi: *(tháo kính)* Em thuộc thật hả? Hát thử anh nghe đoạn điệp khúc coi.
    ~ qh("idol_het_thoi", 10)
* [🐍 "Dạ biết. Anh là người sắp bị Siêu Nhân Hồng thay thế."]
    idol_het_thoi: *(đứng bật dậy)* Cái gì? Ai nói? {quan_ly_idol} nói hả?!
    ~ rd_tung_tin(12, 8)
    ~ qh("idol_het_thoi", -5)
    _{idol_het_thoi} và {sieu_nhan_hong} đối đầu. Nhưng {quan_ly_idol} sẽ truy ra ai là nguồn tin._
+ -> ran_doc_tudo_het_chuyen
- idol_het_thoi: Hồi anh còn nổi, fan anh đông lắm. Giờ… cũng còn đông. 80.000 người theo dõi lận.
* {biet(fan_ao_phat)} [🔒 "80.000 nick đó comment giống nhau quá anh."]
    idol_het_thoi: *(mặt tái)* Em… em muốn gì?
    ~ rd_tin_mat()
    ~ rd_do_doc = gioi_han(rd_do_doc + 5)
* [😇 "Một fan thật bằng mấy chục nghìn fan ảo đó anh."]
    idol_het_thoi: …Em nói gì vậy. *(đeo kính lại, mà tay hơi run)*
    ~ qh("idol_het_thoi", 5)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_quan_ly_idol ===
# npc:quan_ly_idol # noi:phong_nghe_si
quan_ly_idol: Khoan, anh nghe máy chút. *(điện thoại 1)* Alo? Ừ, để anh lo. *(điện thoại 2)* Alo? Đừng ai đăng gì hết!
quan_ly_idol: Rồi. Em cần gì?
* [💬 "Anh ơi, lịch quay tuần sau của anh Siêu Nhân Hồng là sao anh?"]
    quan_ly_idol: Sao em hỏi? Lịch nghệ sĩ là bí mật. Chuyện này để anh lo.
    ~ qh("quan_ly_idol", -2)
    ~ rd_nghi(3)
* [🤝 "Anh uống cà phê không, em mua giùm."]
    quan_ly_idol: Em là thiên thần. Đen đá, không đường. Ly thứ năm.
    ~ qh("quan_ly_idol", 8)
+ -> ran_doc_tudo_het_chuyen
- quan_ly_idol: Mà nè. Gần đây có tin đồn lạ về {idol_het_thoi}. Em làm truyền thông nội bộ, em có nghe gì không?
* [😇 "Dạ em không nghe gì. Có gì em báo anh liền."]
    quan_ly_idol: Cảm ơn em. Nó… nó dễ tổn thương lắm. Đừng để ai làm nó buồn.
    ~ qh("quan_ly_idol", 5)
    ~ phat_hien(thai_thuong_phat)
* [🐍 "Dạ nghe nói ảnh nợ nhiều lắm anh."]
    quan_ly_idol: *(hai điện thoại cùng reo, anh không bắt máy)* Ai nói em?
    ~ rd_tung_tin(8, 8)
    ~ qh("quan_ly_idol", -10)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_bien_kich ===
# npc:bien_kich # noi:san_thuong
bien_kich: Suỵt. Tôi đang tìm cảm hứng. Gió hôm nay có vị của sự phản bội.
* [💬 "Bà viết gì vậy?"]
    bien_kich: Một câu chuyện về một gia đình. Rất nhiều nỗi đau. Rất nhiều người thật… à không, nhân vật hư cấu.
    ~ rd_tin_mat()
* [🧂 "Bà biết hông, tui có chuyện cay cho bà viết nè."]
    bien_kich: *(mắt sáng lên)* Kể. Kể đi. Tôi trả bằng một chương có tên em.
    ~ rd_them_mam(3, 2)
    ~ qh("bien_kich", 8)
+ -> ran_doc_tudo_het_chuyen
- bien_kich: Em có thấy cuốn sổ bìa da của tôi không? Tôi làm rơi đâu đó.
* {co(so_tay_oanh)} [🔒 "Tui có. Chương 12 viết về tui hả?"]
    bien_kich: *(trắng bệch)* Em đọc rồi?
    bien_kich: Đây không phải đạo, đây là… quan sát. Trả tôi đi. Tôi đổi tên nhân vật.
    * * [😇 Trả lại.]
        ~ mat(so_tay_oanh)
        ~ qh("bien_kich", 20)
        bien_kich: Cảm ơn. Chương 12 tôi sẽ viết lại. Tử tế hơn.
    * * [🐍 Giữ lại: "Đổi cái khác đi bà."]
        bien_kich: Em… muốn gì?
        ~ rd_do_doc = gioi_han(rd_do_doc + 10)
        ~ qh("bien_kich", -15)
    + + -> ran_doc_tudo_het_chuyen
* [😶 "Không thấy."]
    bien_kich: Ừ. Nếu thấy… đừng đọc.
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_editor ===
# npc:editor # noi:phong_dung_phim
editor: *(ngáp)* Đợi render xong… À, {ran_doc}. Gì đó ông?
* [🤝 "Tui mua cà phê cho ông nè."]
    editor: Ông là người thứ hai trong năm nay mua cà phê cho tui. Người thứ nhất là… thôi.
    ~ qh("editor", 10)
* [🐍 "Ông dựng giỏi vậy mà sao clip nào cũng đề tên anh {truong_phong}?"]
    editor: *(im lặng)* Render xong là xong. Tên ai đâu quan trọng.
    ~ rd_tin_mat()
    ~ qh("editor", -3)
+ -> ran_doc_tudo_het_chuyen
- editor: Mà… ông thấy anh {quan_ly_idol} dạo này có mệt không?
* [😇 "Mệt. Ổng uống 5 ly cà phê một ngày."]
    editor: 6 ly. Hôm qua 6. *(nói xong mới thấy mình lỡ lời)*
    ~ phat_hien(linh_thich_thai)
    ~ qh("editor", 5)
* [🐍 "Sao ông quan tâm ổng dữ vậy?"]
    editor: Ờ… thì… đồng nghiệp. Tui đi render tiếp đây.
    ~ rd_tin_mat()
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_designer ===
# npc:designer # noi:ban_thiet_ke
designer: Đừng nói gì. Tui đang sửa lần thứ 23. Sửa nhẹ thôi là sửa cái gì ạ?
* [😇 "Bà cần tui mua trà sữa không đường hông?"]
    designer: …Ông nhớ tui không đường hả? Ông được.
    ~ qh("designer", 8)
* [🐍 "Laptop thứ hai của bà đang mở file gì mà xanh lá chuối vậy?"]
    designer: *(đóng laptop cái rầm)* Không có gì. File cá nhân.
    ~ rd_tin_mat()
    ~ qh("designer", -8)
    ~ qh("sales", -3)
+ -> ran_doc_tudo_het_chuyen
- designer: Ông thấy logo này sao? Đủ wow chưa?
* [😇 "Bản đầu tiên đẹp nhất. Nói thật."]
    designer: Ai cũng nói vậy. Rồi sếp cũng chọn bản đầu. Hết cứu.
    ~ qh("designer", 5)
* [🧂 "Đẹp. Mà hình như sếp nói hôm qua là 'chưa đủ wow' với 'màu như cái nồi'."]
    designer: Cái NỒI?! Ổng nói vậy hả?!
    ~ rd_them_mam(5, 3)
    ~ qh("giam_doc", -2)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_sales ===
# npc:sales # noi:sanh_tang_tret
sales: Em trai! Tin chị đi, tháng này chị chốt deal 2 tỷ. BTT Global. Chắc kèo.
* [💬 "Chị ơi, em lớn hơn chị mà?"]
    sales: Tuổi là con số, deal mới là thật. Gọi chị.
    ~ qh("sales", 3)
* [🐍 "Mr. Kevin Trộn có số điện thoại hông chị? Em muốn phỏng vấn ổng cho bản tin."]
    sales: *(cười rất tươi)* Ổng bận lắm em. Ổng ở… nước ngoài. Ổng chỉ nhắn tin qua chị thôi.
    ~ rd_tin_mat()
    ~ phat_hien(btt_global_gia)
+ -> ran_doc_tudo_het_chuyen
- sales: Mà em làm truyền thông, đăng giùm chị bài khoe deal mới nha. No cap.
* [😇 "Dạ em đăng. Mà chị gửi em hợp đồng để em chụp hình."]
    sales: Hợp đồng… bảo mật. Chụp tay chị ký là được.
    ~ qh("sales", 5)
* [🐍 "Dạ. Em ghi luôn là 'chưa có hợp đồng' cho minh bạch nha chị."]
    sales: *(nụ cười cứng lại)* Em dễ thương ghê ha. Mà thôi để chị tự đăng.
    ~ qh("sales", -10)
    ~ qh("designer", -5)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_chi_dai ===
# npc:chi_dai # noi:kho_su_kien
chi_dai: {ran_doc}. Ăn cơm chưa? Ngồi xuống chị kể cho nghe.
* [😇 "Dạ chưa chị."]
    chi_dai: Biết ngay. Cầm hộp này. Chị nấu dư.
    ~ an(40)
    ~ qh("chi_dai", 8)
* [🐍 "Dạ rồi chị. Mà chị nghe gì về chị {thanh_ninh} chưa?"]
    chi_dai: Nghe rồi. Không cần em kể. Chị không thích nghe chuyện sau lưng ai.
    ~ qh("chi_dai", -5)
    ~ rd_nghi(5)
+ -> ran_doc_tudo_het_chuyen
- chi_dai: Chị nói thật. Em mới vô mà chị thấy em đi khắp nơi. Đi nhiều thì nghe nhiều. Nghe nhiều thì phải biết giữ.
{ rd_nghi_ngo >= 60:
    chi_dai: Mà dạo này chị nghe tên em hơi nhiều. Đứa nào làm em khóc thì chỉ mặt chị. Còn em làm đứa khác khóc thì… chị chỉ mặt em.
}
* [😇 "Dạ em hiểu. Em giữ."]
    chi_dai: Ừ. Vậy mới là người nhà.
    ~ rd_tin(5)
    ~ qh("chi_dai", 5)
* [😶 Cúi đầu ăn cơm.]
    chi_dai: Ăn đi. Ăn no rồi tính.
    ~ an(10)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_dan_dau_tu ===
# npc:dan_dau_tu # noi:ban_so_lieu
dan_dau_tu: Em ơi! Nhìn chart nè. Đây là đáy. Đáy thật rồi. Lần này là lên thật.
* [💬 "Anh nợ bao nhiêu người rồi anh?"]
    dan_dau_tu: Nợ đâu! Góp vốn! {con_ong_chau_cha} 10 triệu, {sales} 5 triệu, {it} 3 triệu, bác {bac_bao_ve} 2 triệu… Tổng có 22 triệu thôi!
    ~ rd_tin_mat()
* [🤝 "Anh xem giúp em số liệu Siêu Nhân Hồng với. Anh giỏi số mà."]
    dan_dau_tu: Ơ… có người nhờ anh làm việc thật à? Để anh xem! *(mắt sáng rỡ)*
    ~ qh("dan_dau_tu", 10)
+ -> ran_doc_tudo_het_chuyen
- dan_dau_tu: Em có muốn góp vốn không? Một ít thôi. Anh trả lãi bằng… niềm tin.
* [😇 "Em còn trả tiền trọ anh ơi."]
    dan_dau_tu: Ừ. Phải. Tiền trọ quan trọng. *(gật gù, buồn buồn)*
* [🐍 Đưa 50.000đ: "Anh cầm đi. Đổi lại anh kể em nghe vụ Hồng Coin là ai tạo."]
    ~ tien_cong(-50000)
    dan_dau_tu: Anh không biết! Thề! Nhưng ví tạo coin có giao dịch đầu tiên… lúc 23:02 đêm ra MV. Ai thức khuya nhất công ty?
    ~ rd_tin_mat()
    ~ qh("dan_dau_tu", 5)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_thanh_xin_nghi ===
# npc:thanh_xin_nghi # noi:ban_dieu_phoi
_Kỳ lạ: {thanh_xin_nghi} có mặt ở công ty._
thanh_xin_nghi: *(giọng yếu ớt)* Ông ơi… tui hơi sốt… chắc chiều tui xin về.
* [🐍 "Sốt mà giọng vẫn lên nốt cao được hả ông?"]
    thanh_xin_nghi: *(ho sặc)* Nốt… nốt gì? Ông nói gì tui hông hiểu.
    ~ rd_tin_mat()
    ~ qh("thanh_xin_nghi", -5)
* [😇 "Ông về nghỉ đi, tui báo anh {hr} giùm."]
    thanh_xin_nghi: Ông là người tốt nhất cái công ty này. Tui ghi nhớ.
    ~ qh("thanh_xin_nghi", 10)
    ~ qh("hr", -3)
+ -> ran_doc_tudo_het_chuyen
- thanh_xin_nghi: Mà nè, ông có quen ai ở Đài Tivi Hóng hông? Hỏi… hỏi chơi thôi.
* {biet(son_thi_hat)} [🔒 "Tui bình chọn cho ông rồi. Đừng lo."]
    thanh_xin_nghi: *(mắt đỏ hoe)* Ông… ông biết hả? Đừng nói ai nha. Bà ngoại tui… à không, tui… tui cảm ơn ông.
    ~ qh("thanh_xin_nghi", 20)
* [😶 "Hông quen."]
    thanh_xin_nghi: Ờ. Thôi. Xu cà na.
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_bac_bao_ve ===
# npc:bac_bao_ve # noi:chot_bao_ve
bac_bao_ve: Cháu đấy à. Ngồi đi. Uống trà.
~ uong(25)
* [😇 "Dạ con cảm ơn bác. Bác khỏe hông bác?"]
    bac_bao_ve: Khỏe. Già rồi, khỏe là được.
    ~ qh("bac_bao_ve", 5)
* [💬 "Bác ơi, bác làm ở đây từ hồi nào vậy bác?"]
    bac_bao_ve: Từ ngày đầu. 2010. Cái phòng 20 mét vuông. Lúc đấy cậu {giam_doc} còn là sinh viên.
    ~ rd_tin_mat()
+ -> ran_doc_tudo_het_chuyen
- bac_bao_ve: Bác nói một câu thôi. Ai làm gì ở công ty này, bác đều thấy. Bác không nói. Nhưng bác thấy.
{ rd_nghi_ngo >= 50:
    bac_bao_ve: Cháu ấy à. Đi lại nhiều quá. Cẩn thận.
}
* [😇 "Dạ con nhớ."]
    bac_bao_ve: Ừ. Thế là được.
    ~ rd_nghi(-3)
* [🐍 "Bác thấy gì thì kể con nghe với."]
    bac_bao_ve: Bác không thấy gì đâu. *(uống trà)*
    ~ qh("bac_bao_ve", -3)
* [🐾 Hỏi về {cho}: "Bác nhặt {cho} hồi nào vậy bác?"]
    bac_bao_ve: Ngày 4/10, mấy năm trước. Nó nằm co ở cổng, ướt sũng. Thế là bác tính đấy là sinh nhật nó.
    ~ qh("bac_bao_ve", 5)
    ~ qh("cho", 5)
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_sieu_nhan_hong ===
# npc:sieu_nhan_hong # noi:phong_cho
sieu_nhan_hong: Ê em! Vô đây ăn bánh chuối chiên nè! Điều khoản số 4! *(tạo dáng)*
{ rd_mo_nhanh_hieu_ech:
    _Hắn thấy bạn thì ngừng tạo dáng. Bỏ tay xuống. Đẩy đĩa bánh về phía bạn._
    sieu_nhan_hong: *(nhỏ giọng)* {ran_doc}… em ăn đi. Anh… hông giật của em nữa đâu.
}
* [😇 Ăn một miếng.]
    sieu_nhan_hong: Ngon hông? Anh mê món này từ nhỏ. Hồi nhỏ xóm anh có bà bán chuối chiên đầu ngõ.
    ~ an(15)
    ~ rd_han(-3)
* [🐍 "Bánh này mua bằng tiền công ty, anh ăn có thấy ngại hông?"]
    sieu_nhan_hong: *(khựng lại)* Ờ… anh trả tiền công ty mà… mà thôi, anh hiểu ý em. *(đặt miếng bánh xuống)*
    ~ rd_han(3)
    ~ qh("sieu_nhan_hong", -5)
* [💬 "Anh mặc bộ đồ này cả ngày hông nóng hả?"]
    sieu_nhan_hong: Nóng chứ. Mà mặc vô thì anh là Siêu Nhân Hồng. Cởi ra thì… anh hông biết mình là ai.
    ~ rd_tin_mat()
    ~ rd_han(-3)
+ -> ran_doc_tudo_het_chuyen
- sieu_nhan_hong: Mà em có muốn chụp chung một tấm hông? Làm kỷ niệm!
* [😇 Chụp.]
    _Tấm ảnh: một bộ đồ hồng tạo dáng, và bạn cười gượng. Bạn phóng to bàn tay hắn. Vết sẹo vẫn ở đó._
    ~ follow(2000)
* [😶 "Thôi anh, em xấu lắm."]
    sieu_nhan_hong: Ai nói! Mà thôi, hông ép. Điều khoản số 1 của anh cũng là hông ai ép ai.
+ -> ran_doc_tudo_het_chuyen
- -> END

// ------------------------------------------------------------
=== ran_doc_tudo_cho ===
# npc:cho # noi:chot_bao_ve
cho: Gâu? *(ngẩng đầu khỏi ổ, nhìn túi áo bạn)*
* {co(xuc_xich)} [🦴 Cho {cho} miếng xúc xích.]
    ~ mat(xuc_xich)
    ~ qh("cho", 15)
    cho: Gâu gâu! *(vẫy đuôi tít mù)*
    _{cho} ăn xong, liếm tay bạn, rồi nằm ngửa đòi gãi bụng._
* [🐾 Xoa đầu {cho}: "Tao hiểu mà."]
    ~ qh("cho", 10)
    cho: …Gâu. *(gác cằm lên chân bạn)*
* [😶 Đi ngang qua.]
    cho: Gâu! *(đi theo bạn 3 bước, rồi quay về ổ)*
+ -> ran_doc_tudo_het_chuyen
- _Ở góc chòi, một chiếc mũ hồng để quên trên ghế trong phòng chờ hiện ra trong đầu bạn. {cho} cũng đang nhìn về phía tầng 2._
cho: Grừ… *(nhìn về phía phòng chờ của Siêu Nhân Hồng)*
* {co(xuc_xich)} [🦴 Cho thêm miếng nữa, rồi chỉ tay về phía phòng chờ.]
    ~ mat(xuc_xich)
    ~ rd_so_lan_dung_tuat = rd_so_lan_dung_tuat + 1
    ~ rd_pha(10000)
    ~ rd_nghi(5)
    _{cho} phóng đi. 5 phút sau, cả tầng 2 la hét. Chiếc mũ hồng bị tha đi mất. Buổi quay chiều nay bị hoãn._
* [😇 Lên phòng chờ, cất chiếc mũ vào tủ cho an toàn.]
    ~ rd_han(-5)
    sieu_nhan_hong: *(sau đó)* Ai cất mũ cho anh vậy? Cảm ơn nha! Cảm ơn nhiều nhiều!
    ~ qh("sieu_nhan_hong", 10)
* [🐾 Ngồi chơi thêm với {cho}.]
    ~ qh("cho", 5)
    ~ cang_thang(-5)
+ -> ran_doc_tudo_het_chuyen
- -> END


// ------------------------------------------------------------
// Khi đã nói hết chuyện (mọi lựa chọn một-lần đã dùng)
// ------------------------------------------------------------
=== ran_doc_tudo_het_chuyen ===
_Hai người nói thêm vài câu chuyện phiếm: thời tiết, kẹt xe, giá trà sữa. Hôm nay vậy là đủ._
-> END