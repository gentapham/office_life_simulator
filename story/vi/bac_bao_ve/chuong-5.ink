// ============================================================
// BÁC BẢO VỆ: BÌNH · CHƯƠNG 5: "TỦ GỖ Ở VEN ĐÔ" (21/10 – 27/10)
// ============================================================

// ------------------------------------------------------------
=== bac_bao_ve_2110_confession ===
# ngay:21 # gio:09:00 # noi:choi_bao_ve # bat_buoc
_Mốc 3. Sáng nay cả công ty dán mắt vào điện thoại. Trang "Confession G-Entertainment" đăng bài lúc 2 giờ sáng: "Sếp G-Ent thế chấp biệt thự ở Ngân hàng Tín Dụng Đen Đủi. Công ty sắp sập rồi đó mấy bà."_
{ nguoi_theo_doi < 500000:
    _Cộng thêm con số chưa tới mốc 3. Tin đồn "cắt giảm nhân sự" chạy khắp tòa nhà nhanh hơn wifi._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
_9 giờ, {hr} và {it} cùng xuống chòi. Một người cầm sổ tay, một người cầm laptop._
hr: Bác {bac_bao_ve}, cháu chỉ muốn hỏi bác một chút thôi. Đêm 20, sau liên hoan, có ai quay lại công ty không ạ?
it: Có người đăng nhập từ máy trong tòa nhà. 23 giờ 12.
_Bác ngủ lúc 21 giờ. Nhưng sổ trực thì không ngủ. 23 giờ 10, bác dậy đi vệ sinh, thấy đèn tầng 2 sáng, đúng góc bàn của {ten(ran_thu_hai)}. Bác đã ghi lại._
* [📒 Mở sổ trực, chỉ vào dòng "23:10. Đèn tầng 2, bàn {ten(ran_thu_hai)}."]
    hr: *(nhìn dòng chữ, rồi nhìn {it})* Bàn {ten(ran_thu_hai)}…
    it: Khớp giờ.
    _Hai người đi lên tầng 2, không nói thêm câu nào. Sổ trực vừa làm bằng chứng lần nữa._
    ~ bv_so_truc_dung = bv_so_truc_dung + 1
    ~ bv_bm(2)
    ~ qh("hr", 5)
    ~ qh(ran_thu_hai, -5)
    ~ bv_biet_ran_thu_hai = true
* [🙈 "Bác ngủ từ 9 giờ. Bác không thấy gì đâu."]
    hr: *(nhìn bác, cười nhẹ)* Cháu hiểu rồi ạ. Bác không thấy.
    _{it} liếc cuốn sổ trực trên bàn. Rồi liếc bác. Không nói gì._
    ~ bv_khong_thay_gi()
* [🍵 "Ngồi xuống uống trà đã. Tìm ra người viết thì sao? Chuyện thế chấp có thật không, đấy mới là chuyện."]
    hr: *(ngồi xuống, im lặng một lúc)* …Có thật, bác ạ.
    _{it} gập laptop lại. Ba người ngồi uống trà, không ai truy ai nữa._
    ~ bv_rot_tra("hr", 5)
    ~ bv_rot_tra("it", 3)
    ~ phat_hien(the_chap_biet_thu)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2210_doan_thue_cong ===
# ngay:22 # gio:07:58 # noi:cong_cong_ty # bat_buoc
_7 giờ 58. Ba người đứng trước cổng. Đồ công sở tối màu, cặp tài liệu. Không cười. Người đi đầu khoảng 55 tuổi, kính dày, cặp da sờn._
chu_liem: Chào anh. Đoàn kiểm tra. Cho chúng tôi lên gặp giám đốc.
_Giày đen, đánh xi bóng, đế mòn đều cả hai bên. Người đi bộ nhiều, làm việc thật. Đoàn thuế thật._
* [🚪 Mở Cổng Chậm: "Dạ, mời các anh ký sổ khách. Họ tên, cơ quan, giờ vào, số căn cước."]
    _Bác đưa cuốn sổ khách, cây bút bi gần hết mực. Chú Liêm viết. Bút tắc. Bác đi tìm bút khác. Ba phút._
    _Trong ba phút đó, bác bấm bộ đàm một tiếng "tách". Trên tầng 2, {chi_dai} biết._
    ~ bv_bm(1)
    ~ qh("ke_toan", 8)
    ~ qh("chi_dai", 3)
* [🐕 Để {cho} ra chào khách.]
    _{cho} vẫy đuôi đi ra, thân thiện như mọi khi. Chú Liêm lùi một bước, hai bước, rồi bám vào cột cổng._
    chu_liem: Anh… anh giữ con chó lại! Tôi sợ chó! Tôi dị ứng lông chó!
    _Bác giữ {cho}. Từ từ. Rất từ từ. Năm phút sau đoàn mới dám bước qua cổng._
    ~ qh("ke_toan", 10)
    ~ qh("cho", 3)
    ~ bv_lo_than(3)
* [🚪 Mở cổng ngay. "Mời các anh lên tầng 2."]
    chu_liem: *(gật đầu)* Cảm ơn anh. Anh làm việc nhanh.
    ~ qh("ke_toan", -5)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2210_giay_to_goc ===
# ngay:22 # gio:10:30 # noi:choi_bao_ve # bat_buoc
_10 giờ 30. {ke_toan} chạy xuống chòi, mặt trắng bệch, tay ôm một chồng hồ sơ._
ke_toan: Bác ơi… đoàn thuế đòi bản gốc giấy tờ thành lập năm 2010. Con lục cả phòng kế toán. Không có. Anh {giam_doc} cũng không biết để đâu. Hạn tới 4 giờ chiều.
_Bác biết. Chỉ bác biết. Tủ gỗ ở Ven Đô. Bọc ni lông. Đứng tên Genta. 30 phút xe máy, giờ cao điểm thì 1 tiếng._
_Mang tới thì ai cũng sẽ hỏi: tại sao giấy tờ gốc của công ty lại nằm trong tủ nhà ông bảo vệ?_
* [🛵 Lặng lẽ dắt xe ra. "Cháu trông cổng giúp bác một tiếng."]
    -> ve_ven_do
* [😶 "Bác không biết đâu cháu. Cháu hỏi anh {giam_doc} lần nữa xem."]
    ke_toan: *(nhìn bác, mắt đỏ hoe)* Dạ… con hỏi rồi bác.
    _{ke_toan} đi lên. Bác ngồi lại với ấm trà nguội. Đây không phải "không thấy gì". Đây là thấy mà quay đi._
    ~ bv_g(-10)
    ~ bv_tam(-15)
    ~ qh("ke_toan", -5)
    -> END
* [✉️ "Để bác… hỏi người ta trước đã."]
    _Bác viết vội mấy dòng cho G. Rồi nhìn đồng hồ. Thư đi năm ngày. Đoàn thuế đợi tới 4 giờ chiều._
    _Bác gấp tờ thư lại. Có những lúc phải tự quyết, kể cả với đồ gửi của người khác._
    ~ bv_tam(-5)
    -> ve_ven_do
* {bv_thang_biet} [🔑 Đưa chìa khóa tủ gỗ cho {giam_doc}: "Anh tự về lấy. Đồ của công ty, anh là giám đốc."]
    _{giam_doc} cầm chìa khóa đồng, nhìn bác rất lâu. Rồi chạy xuống bãi xe như một cậu sinh viên 21 tuổi._
    _3 giờ chiều anh về, ôm bọc ni lông trong lòng như ôm đứa con._
    ~ bv_mang_giay_to = true
    ~ qh("giam_doc", 15)
    ~ bv_g(5)
    -> END

= ve_ven_do
_Bác chạy xe về Ven Đô. Đường đất đỏ. Mở tủ gỗ. Bọc ni lông. Giấy chứng nhận năm 2010, đứng tên Genta, dấu đỏ còn tươi như mới đóng._
_Bác ôm nó trước ngực, chạy về. Kẹt xe ở Đại lộ Kẹt Xe 20 phút. Mưa lất phất. Bác cởi áo khoác bọc thêm một lớp._
_2 giờ 40 chiều. Bác bước vào phòng họp tầng 2, lần đầu tiên trong năm, đặt bọc ni lông lên bàn trước mặt Chú Liêm._
bac_bao_ve: Bản gốc đây ạ. Người ta gửi tôi giữ hộ từ năm 2016.
_Cả phòng im lặng. {ke_toan} nhìn bác như nhìn ông Bụt. {giam_doc} đứng bật dậy, mặt đổi màu ba lần._
~ bv_mang_giay_to = true
~ bv_lo_than(25)
~ bv_g(5)
~ qh("ke_toan", 15)
~ phat_hien(binh_tai_mat_g)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2210_chieu ===
# ngay:22 # gio:16:00 # noi:phong_hop_tang_2
_4 giờ chiều. Chú Liêm đọc tiếp danh sách: hợp đồng BTT Global (không tìm thấy mã số thuế), bằng chứng nghiệm thu dự án quảng cáo tháng 6 (file gốc mất), nguồn gốc 5 tỷ (Siêu Nhân Hồng chuyển khoản, hợp lệ)._
_{chua_te_deadline} ngồi góc phòng, mồ hôi đầm đìa: "File gốc… tháng 6… con… con làm mất ạ."_
_Bác đứng ở cửa, vì vẫn chưa ai bảo bác về. Bác nhớ một thứ: cái USB không nhãn, mùi cà phê sữa đá, trong kho của {cho} dưới gầm cầu thang._
* {bac_bao_ve_1810_sang_kiem_tra} [🔒 "Đợi tôi hai phút." Xuống gầm cầu thang, lấy cái USB.]
    _{cho} gầm gừ khi bác thò tay vào kho. Bác xoa đầu nó: "Cho bác mượn. Bác trả mày cây xúc xích."_
    _{it} cắm USB vào laptop. Thư mục "Du_an_thang_6_FINAL_final2". {chua_te_deadline} gục mặt xuống bàn, khóc như con nít._
    chu_liem: *(gật đầu)* Được. Bằng chứng nghiệm thu: có.
    ~ nhan(usb_khong_nhan)
    ~ phat_hien(usb_cua_vu)
    ~ qh("chua_te_deadline", 20)
    ~ qh("cho", -2)
    ~ bv_bm(3)
    ~ bv_lo_than(5)
* [😶 Đứng yên. Việc của các cháu, các cháu lo.]
    chu_liem: Tôi ghi nhận: thiếu bằng chứng nghiệm thu. Phạt hành chính.
    ~ qh("chua_te_deadline", -2)
- { bv_mang_giay_to:
    chu_liem: Giấy tờ thành lập: đầy đủ, hợp lệ. *(nhìn bác)* Anh giữ kỹ thật. Mười năm mà như mới.
    _Chú Liêm ra về. {giam_doc} đi tới cửa, đứng cạnh bác, không nhìn bác, nói nhỏ: "Tối nay em xuống chòi. Bác đừng ngủ sớm nhé."_
    ~ follow(0)
- else:
    chu_liem: Giấy tờ thành lập: không xuất trình được bản gốc. Hạn bổ sung 15 ngày. Phạt chậm nộp.
    _{ke_toan} ký biên bản. Tay run. {giam_doc} ngồi im._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2310_hoi_am_3 ===
# ngay:23 # gio:07:00 # noi:choi_bao_ve
{ bv_so_thu < 3:
    _Hộp thư trống. Hai lá thư trước còn có hồi âm. Lá này thì không. Vì tuần ấy bác không gửi._
    ~ bv_tam(-5)
    -> END
}
_Hồi âm thứ ba. Ngắn hơn hai lá trước. Chữ viết nghiêng hơn, như viết vội._
{ bv_ke_trang_47:
    _"{bac_bao_ve}. Mười tỷ. Tôi đọc dòng đó năm lần. Anh đừng nói gì với {giam_doc}. Tôi có cách của tôi. Anh giữ cái phong bì cho kỹ."_
    ~ bv_g(4)
}
{ bv_ke_dem_17:
    _"Người vào phòng ban đêm… anh làm đúng. Đừng đuổi ai. Cứ nhìn. Người ta tự đi."_
}
_"Còn một chuyện. Sắp tới sẽ có người mang phong bì tới cổng. Anh trả phong bì, giữ chén trà. G."_
~ bv_g_khuyen_tra = true
~ tien_cong(500000)
* [📒 Ghi vào sổ trực, trang đầu, dưới chữ "Nhìn giày": "Trả phong bì, giữ chén trà."]
    ~ bv_tam(5)
* [🍵 Đọc to cho {cho} nghe.]
    cho: *(nghiêng đầu)* Gâu?
    bac_bao_ve: Ừ. Ông ấy dặn thế.
    ~ bv_tam(5)
    ~ qh("cho", 2)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2310_kevin_tron ===
# ngay:23 # gio:14:00 # noi:choi_bao_ve # bat_buoc
_Sinh nhật 31 tuổi của {sieu_nhan_hong}, kiêm livestream lớn tối nay. 2 giờ chiều, {sales} xuống chòi, chắp tay._
sales: Bác ơi… tin chị… à không, tin con đi. Bác đóng vai Mr. Kevin Trộn giùm con đi bác. Chủ tịch Tập đoàn BTT Global. Lên chúc mừng có ba câu thôi bác.
sales: Bác nhìn là người ta tin liền. Bác có cái… cái uy ấy bác.
* [😐 "Bác đóng ông Tây à?"]
    sales: Dạ ông Tây gốc Bắc! Đại diện thị trường châu Á! Bác mặc vest con mượn rồi!
    _Bác nhìn bộ vest treo trên tay {sales}. Nhìn {cho}. {cho} nhìn lại, như nói "đừng"._
    -> quyet
* [🙈 "Bác không biết diễn. Bác chỉ biết đứng cổng."]
    sales: *(xị mặt)* Dạ… thôi con nhờ anh {dan_dau_tu} vậy.
    ~ qh("sales", -3)
    -> END

= quyet
* [🤵 "Ừ. Ba câu thôi đấy."]
    _Bác mặc vest. Rộng vai một chút. Thắt cà vạt kiểu năm 1998. {hong_hot} nhìn bác, há hốc: "Trời ơi bác đẹp lão quá trời!"_
    ~ bv_kevin_tron = true
    ~ qh("sales", 10)
    ~ bv_lo_than(10)
* [💬 "Cháu nói thật với bác: có cái tập đoàn BTT Global không?"]
    sales: *(cúi đầu, rất lâu)* …Không bác. Con bịa. Con xin lỗi.
    bac_bao_ve: Thế thì bác không đóng. Nhưng bác giữ cho cháu. Cháu tự nói với anh {giam_doc} trước 31.
    ~ phat_hien(btt_global_gia)
    ~ qh("sales", 5)
    ~ bv_bm(2)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2310_banh_kem ===
# ngay:23 # gio:20:00 # noi:studio_tang_2 # bat_buoc
_8 giờ tối. Livestream sinh nhật {sieu_nhan_hong} ở studio tầng 2. 10.000 người xem. Cả phòng rực đèn hồng. Bác được gọi lên, đứng cuối phòng._
{ bv_kevin_tron:
    _Bác bước ra trong bộ vest, giọng Bắc chậm rãi đọc đúng ba câu: "Chúc mừng sinh nhật. Làm việc tốt. Ngủ đúng giờ." Bình luận nổ tung: "Ông Kevin này thật quá!", "Kevin Trộn gốc Hà Nội hả?". Có người nhận ra: "Ủa ông bảo vệ trong clip {cho} mà?"._
    ~ follow(5000)
}
_{sieu_nhan_hong} cầm micro, quay về phía {chua_te_deadline}: "{chua_te_deadline} ơi. Anh thích em. Không phải PR đâu. Em trả lời anh đi!". Bình luận chạy như thác: "\#VũƠiTrảLờiĐi"._
_{chua_te_deadline} ngẩng lên khỏi điện thoại, cười rất tươi, giơ ngón cái: "Ý tưởng PR hay đó anh!". Cả phòng vỗ tay. Bác thấy tay cậu áo hồng hạ micro xuống chậm hơn mọi khi._
_Rồi bánh kem hồng 3 tầng được đẩy ra. Bác đứng cuối phòng, tay cầm dây xích của {cho}. {cho} hạ thấp người, mắt dán vào chiếc mũ hồng._
_Ở bên kia sảnh, {idol_het_thoi} đứng sát xe bánh. Quá sát. Chân anh nhích ra phía trước một chút._
* [🐕 Giữ chặt dây xích. Không thả. Không nhúc nhích.]
    _{cho} giật dây, nhưng không thoát. Rồi một tiếng "rầm". {idol_het_thoi} vấp chân vào bánh xe đẩy. Ba tầng kem hồng đổ ụp. {idol_het_thoi} chỉ tay: "Con chó! Con chó lao vào!"_
    _Nhưng {cho} vẫn ngồi cạnh bác, cách 8 mét, dây xích căng. 10.000 người xem thấy rõ._
    -> phat_vap
* [😶 Thả lỏng tay một chút. Cho nó đi.]
    _{cho} phóng như tên. Không nhắm vào bánh. Nhắm vào chiếc mũ. Nhưng đường bay đi qua đúng cái bánh. Ba tầng kem hồng đổ ụp. Clip "{cho} phá bánh" lan khắp Tóp-tóp._
    ~ follow(30000)
    ~ scandal()
    ~ qh("cho", 5)
    -> dat_tuat_ra
* [📢 Chỉ tay về phía {idol_het_thoi}: "Cháu {idol_het_thoi}! Đứng xa cái bánh ra!"]
    _{idol_het_thoi} giật mình, lùi lại. Bánh an toàn. {sieu_nhan_hong} thổi nến. 10.000 người hát chúc mừng. {idol_het_thoi} nhìn bác, mặt đỏ, rồi cúi đầu._
    ~ follow(20000)
    ~ qh("idol_het_thoi", -5)
    ~ qh("sieu_nhan_hong", 5)
    -> END

= phat_vap
* [🙈 Bác không thấy gì đâu. Dắt {cho} ra ngoài cho yên chuyện.]
    _Người ta vẫn đổ tội cho {cho}. Clip vẫn viral. Bác dắt {cho} ra cổng. {cho} quay đầu nhìn lại, rồi nhìn bác, như hỏi "sao bác không nói?"._
    ~ bv_khong_thay_gi()
    ~ follow(30000)
    ~ qh("cho", -5)
* [📒 Đi tới chỗ {quan_ly_idol}, nói nhỏ: "Con chó ngồi với bác. Cháu {idol_het_thoi} vấp."]
    quan_ly_idol: *(nhắm mắt, thở dài)* Con biết, bác. Chuyện này để con lo.
    _{quan_ly_idol} không nói với ai. Nhưng tối đó {idol_het_thoi} xuống chòi, đưa {cho} một cây xúc xích, không nói gì._
    ~ follow(30000)
    ~ qh("quan_ly_idol", 8)
    ~ qh("cho", 5)
    ~ bv_bm(2)
- -> END

= dat_tuat_ra
_Bác là người dắt {cho} ra khỏi studio, mặt nó dính đầy kem hồng, đuôi vẫn vẫy. Cả sảnh nhìn theo hai ông cháu._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2310_khan_lau ===
# ngay:23 # gio:21:30 # noi:sau_choi_bao_ve
_9 giờ 30 tối. Livestream tắt. Sau chòi, {sieu_nhan_hong} ngồi bệt, chiếc mũ để bên cạnh, dính kem. Mặt thật, mắt đỏ._
sieu_nhan_hong: Bác… {chua_te_deadline} không trả lời con. Nó tưởng là PR.
_Một tin nhắn trên điện thoại cậu, của người lạ: "Ủa Hồng Coin là của anh hả? Sao có coin tên anh?". Cậu tắt màn hình._
* [🍵 Đưa cái khăn mặt sạch và một ly trà đá.]
    _Cậu lau mặt. Uống trà. Ngồi yên rất lâu. Rồi nói: "Sinh nhật con chưa bao giờ đông người như hôm nay. Mà con thấy một mình nhất."_
    bac_bao_ve: Bác cũng thế. Sinh nhật 50 tuổi.
    sieu_nhan_hong: *(ngẩng lên)* Bác cũng mới sinh nhật hả bác?
    bac_bao_ve: Ừ. Ngày 10. Không ai biết. Cũng chẳng sao.
    ~ qh("sieu_nhan_hong", 15)
    ~ bv_rot_tra("sieu_nhan_hong", 3)
* [🐕 Dắt {cho} lại gần: "Nó muốn xin lỗi."]
    cho: *(ngửi chiếc mũ dính kem, liếm một cái)* …Gâu.
    sieu_nhan_hong: *(bật cười, cười tới chảy nước mắt)* Nó liếm kem chứ xin lỗi gì bác!
    _Nhưng cậu xoa đầu {cho}. Và {cho}, lần đầu tiên, không gầm gừ._
    ~ qh("sieu_nhan_hong", 10)
    ~ qh("cho", 3)
* [💬 "Cháu thích người ta thì nói riêng. Đừng nói trước mười nghìn người."]
    sieu_nhan_hong: Nói riêng con không dám, bác ạ. Đội mũ thì con dám.
    bac_bao_ve: Thế thì đội mũ mà nói riêng.
    ~ qh("sieu_nhan_hong", 8)
- _22 giờ 41. Có người quay lại công ty, đi bộ, không mũ bảo hiểm, ký vào sổ trực: {ten(ran_thu_hai)}. Lý do: "Quên sạc điện thoại". Mười phút sau thì về, tay không._
_Bác ghi giờ, ghi tên, ghi cả "tay không". Bác không thấy gì đâu. Nhưng sổ thì thấy._
~ bv_bm(1)
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2410_chu_toa ===
# ngay:24 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_Ngày Liên Hợp Quốc. {chi_dai} tổ chức "Hội nghị hòa giải". Phòng họp xếp thành từng cặp bàn đối mặt._
chi_dai: Bác {bac_bao_ve}, con mời bác ngồi ghế chủ tọa. Vì bác không theo phe nào.
_Bác ngồi xuống ghế chủ tọa. Lần thứ ba trong tháng bác lên tầng 2. Trước mặt: bốn cặp bàn. Và một bàn riêng ở góc, biển "BÀN CHỦ NỢ", nơi {dan_dau_tu} ngồi đối diện 7 cái ghế._
_Một trong 7 cái ghế đó ghi tên bác._
* [⚖️ Ngồi ghế chủ tọa. Bỏ trống ghế chủ nợ của mình.]
    _Bác không ngồi bàn chủ nợ. {dan_dau_tu} nhìn cái ghế trống, nhìn bác, rồi cúi đầu._
    ~ qh("dan_dau_tu", 8)
* [📒 Xin phép chủ tọa… sang ngồi bàn chủ nợ năm phút.]
    _Cả phòng cười. Bác ngồi xuống ghế chủ nợ, đặt cuốn sổ trực lên bàn, mở trang ghi nợ. Không nói gì. {dan_dau_tu} đổ mồ hôi._
    dan_dau_tu: Bác… sau Đại Nhạc Hội con trả bác trước tiên. Con hứa.
    { bv_chuong_cat_lo:
        dan_dau_tu: Con cắt lỗ rồi bác. Con còn đúng 500 nghìn. Con trả bác trước.
        ~ tien_cong(500000)
    }
    ~ bv_so_truc_dung = bv_so_truc_dung + 1
- _Cặp {truong_phong} – {con_ong_chau_cha} cãi nhau về ghế Phó Giám đốc. Cặp {designer} – {bien_kich} cãi nhau về slogan. Cả phòng quay sang nhìn chủ tọa._
* [🍵 Không nói gì. Rót trà cho từng bàn.]
    _Bác đi một vòng, rót trà cho từng người. Không nói câu nào. Khi bác ngồi xuống, phòng họp đã im lặng. Người ta không cãi nhau khi đang cầm chén trà của người lớn tuổi._
    ~ bv_so_ly_tra = bv_so_ly_tra + 10
    ~ bv_qh_ca_cong_ty(3)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [💬 "Cháu {con_ong_chau_cha}. Nói thật với cháu {truong_phong} đi. Cháu có muốn cái ghế ấy không?"]
    con_ong_chau_cha: *(im lặng)* …Không ạ. Cháu muốn làm nhạc.
    _{truong_phong} đứng hình. Anh ngồi xuống. Lần đầu tiên hai người bắt tay mà không có ai ép._
    ~ qh("con_ong_chau_cha", 8)
    ~ qh("truong_phong", 8)
    ~ phat_hien(bai_hat_long)
* [🙈 "Bác chủ tọa thôi. Các cháu tự hòa."]
    _Một tiếng sau, {designer} bỏ về. Rồi {dan_dau_tu}. {chi_dai} nhìn bác, thở dài._
    ~ bv_khong_thay_gi()
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2510_vuon_chu_nhat ===
# ngay:25 # gio:08:30 # noi:ven_do
_Chủ nhật. Ven Đô. Bác ra chợ sớm mua rau. Đi ngang tòa nhà kính 20 tầng màu xanh lá chuối của LL-Entertainment._
_8 giờ 55. Một người quen bước vào sảnh: {thanh_ninh}, áo trắng, tập hồ sơ kẹp nách. Một phút sau, người thứ hai: {designer}, ôm cái USB, mặt như đi lạc._
_Hai người chạm mặt ở sảnh. Cả hai cùng nhìn lên trần, cùng giả vờ đọc biển chỉ đường._
_9 giờ 55, lúc bác đạp xe từ chợ về, người thứ ba đi vào: {quan_ly_idol}, hai điện thoại trên tay, mặt như người đi thi._
* [🙈 Đi tiếp ra chợ. Bác không thấy gì đâu.]
    ~ bv_khong_thay_gi()
    ~ bv_bm(2)
* [📞 Gọi cho {quan_ly_idol}: "Cháu ở đâu đấy?"]
    quan_ly_idol: *(nghe máy ngay, giọng hốt hoảng)* Dạ… con… con đi công chuyện bác. Có gì không bác?
    bac_bao_ve: Không. Bác hỏi thế thôi. Đi đâu thì nhớ đường về.
    _Đầu dây bên kia im lặng rất lâu._
    ~ qh("quan_ly_idol", 5)
    ~ bv_bm(2)
    ~ phat_hien(ll_moi_thai)
* [📒 Ghi vào cuốn sổ nhỏ trong túi: "25/10. Sảnh LL. 8:55 {thanh_ninh}. 8:56 {designer}. 9:55 {quan_ly_idol}."]
    ~ bv_bm(3)
- _Chiều, nhà vườn Ven Đô. Nhà bên cạnh là nhà {thanh_xin_nghi}. Cửa đóng. Trên dây phơi có một bộ đồ kim tuyến bạc phơi khô, gió thổi lấp lánh._
_Tối nay là bán kết "Giọng Ca Ước Mơ". Bác mở radio. Dò đài._
* [📻 Nghe trực tiếp. Hết bài thì vỗ tay một mình trong vườn.]
    _Giọng hát quen. Vào chung kết. Bác vỗ tay. Ông Ba trà đá đạp xe ngang, hỏi: "Ai thi mà chú vui vậy?". "Cháu bác."_
    ~ bv_biet_son_hat = true
    ~ bv_tam(10)
* [🌱 Tưới rau. Nghe đài làm nền.]
    ~ bv_tam(8)
    ~ nghi(15)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2510_thu_g_4 ===
# ngay:25 # gio:20:00 # noi:nha_vuon_ven_do # bat_buoc
_Lá thư thứ tư. Lá cuối của tháng. Bác viết chậm hơn mọi lần, vì biết lá này G sẽ đọc vào đúng những ngày quan trọng nhất._
~ bv_dong_thu = 0
- (chon)
{ bv_dong_thu >= 3:
    -> gui
}
* {bv_mang_giay_to} [✉️ "Bác mang giấy tờ gốc tới cho đoàn thuế. Bây giờ cả công ty biết bác giữ đồ của ông."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_g(4)
    -> chon
* [✉️ "Mấy đứa nhỏ cãi nhau nhiều. Nhưng hôm 24 còn ngồi chung được một phòng, uống chung một ấm trà."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_g(4)
    ~ bv_tam(3)
    -> chon
* {bac_bao_ve_2510_vuon_chu_nhat} [✉️ "Sáng nay bác thấy hai đứa đi vào tòa nhà xanh lá chuối. Bên ấy đang câu người."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_g(5)
    -> chon
* {bv_biet_ran_thu_hai} [✉️ "Có một đứa trong công ty làm cho bên kia. Bác biết tên. Bác chưa nói với ai."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_g(5)
    -> chon
* [✉️ "Thằng {giam_doc} gầy đi. Nó đi làm từ 7 giờ, về lúc 11 giờ. Nó vẫn chưa bỏ ai."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_that = bv_thu_that + 1
    ~ bv_ke_tot_thang = true
    ~ bv_g(3)
    -> chon
* [🌸 "Đại Nhạc Hội sắp tới. Mọi thứ tốt đẹp. Ông yên tâm."]
    ~ bv_dong_thu = bv_dong_thu + 1
    ~ bv_thu_dep = bv_thu_dep + 1
    ~ bv_g(-5)
    -> chon
* {bv_dong_thu >= 1} [📮 Thế thôi. Gấp thư.]
    -> gui
* [😶 Không gửi. Tuần sau là xong cả rồi, gửi làm gì.]
    -> bo

= gui
~ bv_so_thu = bv_so_thu + 1
_Dưới chữ ký, bác viết thêm một dòng nhỏ, lần đầu tiên trong mười năm: "Ông giữ sức khỏe. {bac_bao_ve}."_
~ bv_g(2)
-> END

= bo
~ bv_bo_thu = bv_bo_thu + 1
~ bv_g(-15)
~ bv_tam(-5)
_Tờ giấy kẻ ô nằm trên bàn cả đêm. Gió thổi bay xuống vườn rau. Sáng ra ướt sương, chữ nhòe hết._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2610_tin_don ===
# ngay:26 # gio:17:40 # noi:choi_bao_ve
_Hạn chót danh sách cắt giảm của {giam_doc}. Tin đồn đã chạy khắp tòa nhà. 5 giờ 40 chiều, hai người ngồi ở ghế nhựa trước chòi: {thuc_tap_sinh} và {thanh_xin_nghi}._
thuc_tap_sinh: Dạ bác… con nghe nói tên con nằm dòng đầu tiên ạ.
thanh_xin_nghi: Con dòng thứ hai bác. Chắc tại con xin nghỉ nhiều.
* [🍵 Rót hai ly trà. "Uống đi. Danh sách chưa đọc thì chưa có."]
    _Hai người uống. Không nói gì. Đôi khi chỉ cần ngồi cạnh một người không hoảng._
    ~ bv_rot_tra("thuc_tap_sinh", 5)
    ~ bv_rot_tra("thanh_xin_nghi", 5)
* [💬 Nhìn {thanh_xin_nghi}: "Cháu vào chung kết rồi. Bác nghe đài. Hát cho tử tế, chuyện ở đây để sau."]
    thanh_xin_nghi: *(há hốc)* Bác… bác biết ạ?
    bac_bao_ve: Bác ở cạnh nhà cháu. Bộ đồ kim tuyến phơi ngoài sân, bác thấy.
    _{thanh_xin_nghi} bật cười, cười tới chảy nước mắt._
    ~ qh("thanh_xin_nghi", 15)
* [🤝 "Có chị {chi_dai} đấy. Chị ấy không để ai bị gạch tên đâu."]
    thuc_tap_sinh: Dạ… chị ấy nói vậy với con rồi ạ. Con tin chị ấy.
    ~ qh("thuc_tap_sinh", 5)
    ~ qh("chi_dai", 3)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2610_dem_thang ===
# ngay:26 # gio:22:30 # noi:choi_bao_ve
_10 giờ 30 tối. Bác đã ngủ. Tiếng gõ nhẹ vào cửa chòi. {giam_doc} đứng đó, không cà vạt, điện thoại trên tay sáng một email: "LL-Entertainment: Lời mời hợp tác. Giá gấp ba."_
giam_doc: Em xin lỗi bác. Em biết bác ngủ sớm. Em… em không biết đi đâu.
* [🍵 Dậy. Bật đèn. Pha trà. Không hỏi gì.]
    _Hai người ngồi. Ấm trà. Đèn đường. {cho} ngáy. {giam_doc} kể: Lưu Lực muốn mua cả Siêu Nhân Hồng, ngay trước Đại Nhạc Hội Siêu Nhân. Gấp ba 5 tỷ._
    giam_doc: Nếu cậu ấy đi… thì 10 tỷ, bác ạ. Thì hết.
    ~ bv_rot_tra("giam_doc", 10)
    -> sau
* [😐 "Anh về ngủ đi. Mai tính."]
    giam_doc: *(cười buồn)* Việc hôm nay cứ để ngày mai tính. Câu ấy… anh Genta nói. Em in lên tường.
    _Anh đi về. Bác không ngủ lại được._
    ~ qh("giam_doc", -2)
    ~ bv_tam(-5)
    -> END

= sau
{ bv_thang_biet:
    -> da_biet
}
* [🍵 "Cậu ấy chưa đi. Người chưa đi thì còn giữ được."]
    giam_doc: Em giữ bằng gì hả bác? Em đâu có gấp ba.
    bac_bao_ve: Bằng cái mà bên kia không có.
    ~ qh("giam_doc", 8)
* [🙈 Chỉ ngồi im, rót thêm trà.]
    ~ qh("giam_doc", 5)
    ~ bv_tam(3)
- -> END

= da_biet
giam_doc: Bác viết cho anh ấy chưa? Anh ấy… biết chưa?
* [✉️ "Bác viết rồi. Ông ấy bảo: 'Nó cứ làm cho tử tế.'"]
    giam_doc: *(gật, rất lâu)* …Vâng. Tử tế. Em làm được cái đó.
    ~ qh("giam_doc", 10)
* [🤫 "Chưa. Anh tự viết đi. Ông ấy chờ thư anh mười năm rồi."]
    giam_doc: *(ngẩng lên)* Em… viết cho anh ấy được à?
    bac_bao_ve: Bác gửi giúp. Giấy kẻ ô bác có.
    ~ qh("giam_doc", 12)
    ~ bv_g(3)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2710_vest_trang ===
# ngay:27 # gio:15:00 # noi:cong_cong_ty # bat_buoc
_15 giờ. Một chiếc xe xanh lá chuối đậu ngay cổng. Người bước xuống: vest trắng, tóc vuốt keo bóng như gương, cặp hồ sơ da. Lưu Lực. Bác đã thấy gương mặt này mười năm trước, ướt đẫm nước cốt dừa._
luu_luc: *(cười, đưa một phong bì dày)* Chào bác! Bác chuyển giùm em cái này cho anh {sieu_nhan_hong} nha. Còn phong bì nhỏ này là chút quà cho bác uống trà. Ở LL, bảo vệ lương 15 triệu lận đó bác.
_Phong bì nhỏ, căng phồng. Bác nhìn nó. Rồi nhìn giày hắn: giày da trắng, đế không một vết bẩn. Người không bao giờ phải đi bộ._
* [🚪 "Cậu {sieu_nhan_hong} chưa tới. Cháu để lại tên, bác báo."]
    luu_luc: *(nụ cười cứng lại)* Em đợi được không bác?
    bac_bao_ve: Cổng không có ghế cho khách. Ghế nhựa là của nhân viên.
    _Lưu Lực đứng 20 phút dưới nắng, vest trắng ướt mồ hôi, rồi để lại phong bì lớn và đi. Bác cất nó vào ngăn kéo. Sáng mai mới đưa._
    ~ bv_ll_tre = true
    ~ bv_tam(3)
* [💸 Nhận cả hai phong bì.]
    _Phong bì nhỏ nặng tay. 3 triệu. Lưu Lực cười, vỗ vai bác: "Bác thông minh lắm."_
    ~ tien_cong(3000000)
    ~ bv_nhan_tien_ll = true
    ~ bv_g(-30)
    ~ bv_tam(-20)
* [😐 Trả lại phong bì nhỏ: "Bác uống trà đá, 3 nghìn một cốc thôi, cháu ạ."]
    _Lưu Lực khựng lại. Bàn tay đang chìa phong bì nhỏ lơ lửng giữa không trung. Bác nhận phong bì lớn để chuyển, đặt lên bàn._
    ~ bv_g(10)
    ~ bv_tam(5)
* [🐕 Đặt ấm trà xuống, nhìn {cho}: "{cho}, khách."]
    _{cho} đi ra, ngửi bộ vest trắng từ dưới lên trên. Rồi đứng lên hai chân sau, để lại một vệt chân bùn ngay đầu gối trắng tinh._
    _Lưu Lực nhìn đầu gối mình. Nhìn {cho}. Bỏ về, quên luôn phong bì lớn trên bàn chòi._
    ~ bv_ll_tre = true
    ~ qh("cho", 5)
* {bv_g_khuyen_tra} [🔒 "Phong bì cháu cầm về. Còn chén trà thì cháu ngồi uống, bác mời."]
    _Lưu Lực sững người. Rồi, như bị thôi miên, ngồi xuống cái ghế nhựa. Bác rót trà. Hắn uống. Đắng. Chè Thái Nguyên._
    bac_bao_ve: Cháu ăn ốc len chưa? Quán Ốc Đêm ấy. Bác nhớ cháu.
    luu_luc: *(phun ngụm trà)* Bác… bác là…
    bac_bao_ve: Bác ngồi bàn bên. Mười năm trước.
    _Lưu Lực đứng dậy, cầm cả hai phong bì, đi thẳng ra xe. Phong bì lớn không tới tay ai hôm đó._
    ~ bv_ll_tre = true
    ~ bv_g(10)
    ~ bv_bm(3)
- -> END

// ------------------------------------------------------------
=== bac_bao_ve_2710_tui_ho_so_roi ===
# ngay:27 # gio:15:20 # noi:sanh_cong_ty
_15 giờ 20. Qua vách kính sảnh, bác thấy Lưu Lực quay lại, lần này đi thẳng vào sảnh để tìm {quan_ly_idol}._
_Rồi hắn thấy {chi_dai}, đang đứng ở quầy lễ tân, bộ đàm bên hông. Cặp hồ sơ tuột khỏi tay hắn. Giấy văng khắp sảnh._
_{chi_dai} nhíu mày, nhìn hắn như cố nhớ một khuôn mặt._
* [📻 Bấm bộ đàm cho {chi_dai}: "Cháu {chi_dai}. Quán Ốc Đêm. Mười năm trước. Thằng ấy đấy."]
    _Qua vách kính, bác thấy {chi_dai} đứng thẳng lưng lên. Từ từ. Như con hổ vừa nhớ ra mùi con mồi._
    _Lưu Lực nhặt vội giấy tờ, lùi ra cửa, suýt vấp chân bác. Hắn đi thẳng ra xe. Không quay lại._
    ~ qh("chi_dai", 15)
    ~ bv_ll_tre = true
    ~ bv_lo_than(5)
* [🙈 Bác không thấy gì đâu. Chuyện của người ta.]
    _{chi_dai} không nhớ ra. Lưu Lực nhặt giấy, đi lên tầng 2, run run. Lời mời gấp ba vẫn tới tay {sieu_nhan_hong}, chỉ trễ một chút._
    ~ bv_khong_thay_gi()
- _Tối, tầng 2 thì thầm: Lưu Lực mời {sieu_nhan_hong} gấp ba. Mời {quan_ly_idol} 36 triệu một tháng. Mời {ke_toan} làm kế toán trưởng. Ai cũng có một phong bì xanh lá chuối._
_Bác nhìn cổng. Hôm nay nhiều phong bì đi qua cổng hơn cả tháng cộng lại._
-> END

// ------------------------------------------------------------
=== bac_bao_ve_2710_dem_xe_hong ===
# ngay:27 # gio:22:00 # noi:cong_cong_ty
_10 giờ đêm. Bác chưa ngủ. Xe hồng của {sieu_nhan_hong} đỗ trong ô "HỒNG" từ 7 giờ tối, máy không nổ, đèn trong xe sáng._
_Bác gõ cửa kính. Cậu ngồi trong xe, không đội mũ, phong bì xanh lá chuối trên đùi, điện thoại sáng tin nhắn vừa gửi cho {chua_te_deadline}: "Em muốn anh ở lại không?". Chưa ai đọc._
sieu_nhan_hong: *(hạ kính)* Bác… con chưa về được. Con không biết về đâu.
* [🍵 "Xuống đây. Uống chén trà rồi hãy quyết."]
    _Cậu xuống. Ngồi ghế nhựa. Bác rót trà. {cho} nằm dưới chân, không gầm gừ. Ba sinh vật ngồi dưới đèn đường lúc 10 giờ đêm._
    sieu_nhan_hong: Bên kia trả gấp ba. Bên kia có tòa nhà 20 tầng. Bên này có… cái chòi.
    -> loi_khuyen
* [🙈 "Bác không thấy gì đâu. Cháu cứ ngồi đến khi nào quyết được."]
    _Bác về chòi. Tắt đèn. Nhưng không ngủ. Tới 11 giờ, xe hồng nổ máy, chạy đi. Bác không biết hướng nào._
    ~ bv_khong_thay_gi()
    -> chot_ll

= loi_khuyen
* [😊 "Bên này có người nhớ tên cháu. Bác nhớ. Nguyễn {sieu_nhan_hong}."]
    _Cậu ngẩng lên. Lần đầu có người ở đây gọi đủ họ tên. Cậu nhìn cái phong bì trên đùi rất lâu._
    { qh_sieu_nhan_hong >= 40 || bv_ll_tre:
        _Rồi xé đôi. Bỏ vào thùng rác cạnh chòi. "Con ở lại, bác."_
        ~ nguyen_theo_ll = false
        ~ qh("sieu_nhan_hong", 15)
    - else:
        _Rồi gấp nó lại, bỏ vào túi áo. "Con cảm ơn bác. Con… con nghĩ thêm đêm nay."_
        ~ qh("sieu_nhan_hong", 8)
    }
* [💬 "Cháu đi đâu thì đi. Nhưng đi vì cái gì thì phải biết."]
    sieu_nhan_hong: Con đi… vì muốn nhiều người biết con hơn. Mà biết con rồi, ai nhớ con?
    bac_bao_ve: Thế đấy. Cháu tự trả lời rồi.
    ~ qh("sieu_nhan_hong", 8)
* [😶 Không khuyên. Chỉ ngồi cùng.]
    _Hai người ngồi tới 11 giờ. Không ai nói gì. Lúc về, cậu cúi đầu chào bác như chào một người ông._
    ~ qh("sieu_nhan_hong", 5)
- -> chot_ll

// Nguyên có theo LL không: phong bì tới tay đúng giờ (bác nhận tiền, không giữ lại)
// mà Nguyên lại không đủ thân với ai ở cổng để ở lại
= chot_ll
{ bv_nhan_tien_ll && not bv_ll_tre && qh_sieu_nhan_hong < 40 && not nguyen_theo_ll:
    ~ nguyen_theo_ll = true
    _Sáng hôm sau, ô "HỒNG" trống. Trong ngăn kéo chòi, phong bì xanh lá chuối không còn. Bác biết nó đi đâu. Bác đã nhận tiền của người gửi nó._
    ~ bv_g(-10)
}
-> END
