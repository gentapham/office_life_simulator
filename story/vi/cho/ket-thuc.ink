// ============================================================
// SÁU KẾT THÚC CỦA TUẤT
// 😄 linh_vat_chinh_thuc · 😄🔒 kho_bau_cong_ly · 😄 hoa_binh_hong
// 😢 lac_o_vung_tau · 😢 kho_bau_bi_don · 😢 gui_ve_vuon
// Các kết thúc buồn đều nhẹ nhàng: không ai làm hại Tuất,
// chỉ là Tuất mất đi thứ mình thương.
// ============================================================

// ------------------------------------------------------------
// Chốt kết thúc. Cảnh này chạy sau Đại Nhạc Hội Siêu Nhân (23:00),
// khi ket_thuc_su_nghiep và chung_cong_ty_song đã được chốt.
// Thứ tự: Lạc Ở Vũng Tàu (Tuất không có mặt) → bí mật Kho Báu Công Lý
// → Hòa Bình Hồng → Linh Vật Chính Thức → Gửi Về Vườn → Kho Báu Bị Dọn.
// Không khớp điều kiện nào: Gửi Về Vườn (bản nhẹ nhất).
=== cho_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # danh_gia
{
- ch_lac_vung_tau:
    ~ chot_ket_thuc("lac_o_vung_tau")
    -> cho_kt_lac_o_vung_tau
- ch_so_mon_kho >= 6 && ch_tha_vao_phong_hop && not ch_kho_bi_don && ((ch_co_giay_dem_17 && ch_nguoi_la_dem_17 == ran_thu_hai) || ch_chi_ra_ran_thu_hai):
    ~ chot_ket_thuc("kho_bau_cong_ly")
    -> cho_kt_kho_bau_cong_ly
- ch_ghet_hong <= 35 && ch_xuc_xich_tu_nguyen >= 3 && not nguyen_theo_ll && (ch_tang_gang_tay || ch_nam_ngua_dem_hong || ch_nguyen_cong_ve):
    ~ chot_ket_thuc("hoa_binh_hong")
    -> cho_kt_hoa_binh_hong
- ch_duoc_cung >= 75 && ch_qua_10_ngay_cuoi == 0 && ch_qua_phong_gd < 2 && not ch_kho_bi_don:
    ~ chot_ket_thuc("linh_vat_chinh_thuc")
    -> cho_kt_linh_vat_chinh_thuc
- ch_kho_bi_don:
    ~ chot_ket_thuc("kho_bau_bi_don")
    -> cho_kt_kho_bau_bi_don
- ch_duoc_cung < 40 || ch_qua_phong_gd >= 2:
    ~ chot_ket_thuc("gui_ve_vuon")
    -> cho_kt_gui_ve_vuon
- else:
    ~ chot_ket_thuc("gui_ve_vuon")
    -> cho_kt_gui_ve_vuon
}

// ------------------------------------------------------------
// 😄 🏅 1. LINH VẬT CHÍNH THỨC
=== cho_kt_linh_vat_chinh_thuc ===
# ket_thuc:linh_vat_chinh_thuc # loai:co_hau
_23 giờ, đêm 31/10. Đại Nhạc Hội vừa tan. Trên sân khấu còn pháo giấy, năm mươi người ở hàng rào chưa chịu về. {chung_cong_ty_song:Công ty còn sống. Ai cũng biết rồi.|Ai cũng biết công ty khó giữ. Có khi phải bắt đầu lại từ một căn phòng 20 mét vuông, như năm 2010.}_
_{giam_doc} cầm micro lần cuối trong đêm, tay kia cầm một thứ nhỏ màu cam._
giam_doc: Bla bla… bla bla bla… TUẤT. Bla bla bla bla. # phu_de:Còn một quyết định nữa. Anh không ép, tùy các em… nhưng anh quyết rồi. {cho}, lên đây.
_Bạn không hiểu. Nhưng bác ở cửa gật đầu. Nên bạn đi lên._
_{giam_doc} cúi xuống, đeo lên cổ bạn một tấm thẻ nhân viên màu cam. Có ảnh bạn. Ảnh hôm 4/10, mặt rất khó chịu._
giam_doc: Bla bla… TUẤT… bla bla… XÚC XÍCH… bla bla! # phu_de:"{cho}. Linh vật. Lương: 3 cây xúc xích một ngày." Tăng 50%. Người duy nhất trong công ty được tăng hơn 20%!
_Cả quảng trường im một giây. Rồi vỡ òa._
_{chi_dai} vỗ tay đầu tiên. {thuc_tap_sinh} vỗ tay to nhất. {ke_toan} vừa vỗ tay vừa ghi sổ: "Phúc lợi chó: +1 cây/ngày, có hóa đơn."_
_{hong_hot} đã livestream từ lúc nào không biết. Bình luận chạy kín màn hình: "Chó lên lương trước tui!", "{cho} xứng đáng!"._
_Bạn ngồi giữa sân khấu, dưới màn hình LED, nghiêm trang, như một nhân viên chính thức._
_Rồi bạn gặm góc tấm thẻ._
_Vị nhựa. Không ngon. Nhưng là của bạn._
{ not chung_cong_ty_song:
    giam_doc: Bla bla… bla bla… TUẤT. # phu_de:Công ty có về phòng 20 mét vuông thì linh vật vẫn đi theo. Cửa phòng nào cũng cần có người canh.
}
_Tối đó, ở chòi bảo vệ, bác treo tấm thẻ lên cái đinh cạnh cái radio, chỗ trước đây chỉ để cái mũ bảo vệ của bác._
bac_bao_ve: Bla bla… TUẤT… bla bla. # phu_de:Mười sáu năm, bác chưa được cái thẻ nào. Mày được trước bác, {cho} ạ.
_Bác nói vậy, nhưng bác cười. Bác bẻ đôi cây xúc xích thứ ba. Không, khoan. Bác đưa nguyên cây. Lương mới mà._
_Bạn ăn, rồi nằm xuống, gác cằm lên dép bác. Ngoài cổng, đèn đường vàng. Trong chòi, radio phát một bài hát cũ._
_Một linh vật. Một chòi bảo vệ. Một ông bác. Ba cây xúc xích mỗi ngày._
_Đời chó, như vậy là đủ wow rồi._
-> END

// ------------------------------------------------------------
// 😄 🔒 2. KẾT THÚC BÍ MẬT: KHO BÁU CÔNG LÝ
=== cho_kt_kho_bau_cong_ly ===
# ket_thuc:kho_bau_cong_ly # loai:co_hau # bi_mat
_23 giờ, đêm 31/10. Đại Nhạc Hội tan. Về tới chòi, ai cũng còn kể về buổi họp hôm qua._
_Phòng họp đánh giá, 30/10. Trên mặt bàn dài: chìa khóa, son môi, điện thoại cũ, chiếc tất lẻ{ch_co_bien_lai_cam_do:, tờ biên lai cầm đồ}{ch_co_giay_dem_17:, chiếc giày}{ch_co_trang_ho_so_ll:, tờ giấy xanh lá chuối}. Và một con chó vàng đang ngồi cuối bàn, thở hồng hộc._
_Mỗi món làm một người tái mặt. Món cuối cùng làm một người đứng bật dậy._
_Người đó là {ten(ran_thu_hai)}._
{ ch_co_giay_dem_17 && ch_nguoi_la_dem_17 == ran_thu_hai:
    it: Bla bla. Bla bla bla bla. # phu_de:Log đêm 17. Máy giám đốc. 1 giờ 04 phút. Đăng nhập bằng tài khoản không phải của anh {giam_doc}.
    bac_bao_ve: *(mở sổ trực)* Bla bla… bla bla bla. # phu_de:1 giờ sáng ngày 18, đèn tầng 2 sáng. Bác ghi rồi. Bác không thấy gì đâu, nhưng sổ thì thấy.
- else:
    it: Bla bla. Bla bla bla bla. # phu_de:Log máy của người này. Ba tuần nay gửi file ra ngoài, toàn về một địa chỉ đuôi LL.
    bac_bao_ve: *(mở sổ trực)* Bla bla… bla bla bla. # phu_de:Hôm 27, con chó ngồi trước bàn người này sủa đúng một tiếng. Bác ghi rồi.
}
{ ch_co_trang_ho_so_ll:
    chi_dai: Bla bla… bla… bla bla. # phu_de:Và tờ giấy xanh lá chuối này có tên mấy đứa, có con số. Chữ của LL.
- else:
    chi_dai: Bla bla… bla… bla bla. # phu_de:Mùi nước hoa xanh lá chuối. Cả công ty chỉ một người xài. Con chó nhớ, chị cũng nhớ.
}
_Mọi thứ khớp. Như những mảnh của một khúc xương gãy được ghép lại._
_{ten(ran_thu_hai)} nhìn bạn. Bạn nhìn lại. Bạn không ghét người đó. Bạn chỉ nhớ mùi. Và một con chó không bao giờ quên một cái mùi._
_{giam_doc} ngồi phịch xuống ghế, nhìn đống đồ trên bàn, rồi nhìn bạn rất lâu._
giam_doc: Bla bla… bla… bla bla bla. # phu_de:Cả tháng nay anh họp bao nhiêu cuộc… mà người giữ công ty lại là con chó.
_Không ai cười. Rồi {truong_phong} cười. Rồi cả phòng._
{ chung_cong_ty_song:
    _Đêm nay công ty còn đứng. Một phần nhờ một con chó không biết đọc._
- else:
    _Đêm nay không ai chắc công ty còn đứng được bao lâu. Nhưng ít ra, không ai trong công ty bán nó đi sau lưng nữa._
}
_Tối hôm đó, gầm cầu thang có một tấm biển gỗ mới. {thuc_tap_sinh} viết chữ, {designer} vẽ thêm một cục xương ở góc, sửa đúng một lần._
_Tấm biển ghi: "KHO BÁU CỦA {cho}". Bạn không biết đọc. Nhưng bạn biết nó là của bạn._
_Và bác mang tới một thứ bạn chưa từng thấy: một cây giò lụa. Nguyên cây. Gói lá chuối. Không phải xanh lá chuối kiểu LL. Xanh lá chuối kiểu chợ Phố Cũ._
bac_bao_ve: Bla bla… TUẤT… bla bla. # phu_de:Cả công ty góp tiền mua đấy. {ke_toan} còn xuất hóa đơn.
_Bạn ăn từ từ. Rất từ từ. Dưới gầm cầu thang, giữa kho báu, dưới tấm biển có tên mình._
_Mỗi món trong kho là một câu chuyện. Giờ thì mọi người đã biết đọc chúng. Còn bạn, bạn vẫn chỉ biết ngửi._
_Như vậy là đủ._
-> END

// ------------------------------------------------------------
// 😄 🌸 3. HÒA BÌNH HỒNG
=== cho_kt_hoa_binh_hong ===
# ket_thuc:hoa_binh_hong # loai:co_hau
_23 giờ, đêm 31/10. Cổng công ty vắng sau Đại Nhạc Hội Siêu Nhân. Đèn đường vàng. Bóng bay hồng xẹp lăn theo gió. {chung_cong_ty_song:Công ty còn. Ai cũng về ngủ sớm cho mai đi làm.|Không ai biết công ty còn mở cửa được bao lâu. Ai cũng về rất chậm.}_
_Trên bậc thềm cổng, một người ngồi. Đồ hồng, áo choàng rách một góc. Không đội mũ. Cái mũ để bên cạnh, úp xuống._
_Bác đã vào chòi. Bác luôn biết lúc nào nên đi vào._
_Bạn đi ra. Chậm. Không sủa. Không gầm gừ._
{
- ch_tang_gang_tay:
    _Chiếc găng tay hồng bạn trả hôm 23/10 giờ đeo trên tay người đó. Bẩn, rách một ngón. Người đó không thay đôi khác._
- co(gang_tay_hong):
    _Trong miệng bạn là chiếc găng tay hồng. Món đầu tiên trong bộ sưu tập Hồng. Bạn đặt nó lên đùi người đó._
    sieu_nhan_hong: Bla… bla bla… TUẤT? # phu_de:Cái này… em giữ suốt hả… {cho}?
    ~ mat(gang_tay_hong)
}
_Bạn nằm xuống. Gác đầu lên giày của người đó._
_Người đó nhìn xuống. Một lúc rất lâu. Rồi bàn tay có vết sẹo nhỏ đặt lên đầu bạn._
sieu_nhan_hong: Bla bla… TUẤT… bla bla bla… NGOAN… # phu_de:{cho} ơi. Một tháng anh chọc em. Xin lỗi nha. Em ngoan. Ngoan hơn anh nhiều.
_Người đó không giả tiếng sủa. Không giấu bóng. Không làm mặt xấu. Chỉ ngồi đó, gãi tai bạn, đúng chỗ sau tai mà chỉ bác biết._
_Không, giờ thì có hai người biết._
_Bạn hít một hơi. Bánh chuối chiên. Nước hoa hồng. Mồ hôi của một đêm diễn dài._
_Lần đầu tiên, mùi nước hoa hồng không còn khó chịu nữa._
_Nó chỉ là mùi của một người. Một người hay ăn cơm một mình. Một người giờ có thêm một con chó nằm gác đầu lên giày._
sieu_nhan_hong: Bla bla… XÚC XÍCH… bla? # phu_de:Mai anh ghé nữa nha. Mang xúc xích. Không chọc đâu. Hứa.
_Bạn vẫy đuôi. Một cái. Thua hả? Ừ, thua. Nhưng hôm nay thua cũng được._
_Ở trong chòi, bác nhìn ra qua khe cửa, uống một ngụm trà, rồi tắt đèn._
-> END

// ------------------------------------------------------------
// 😢 🌊 4. LẠC Ở VŨNG TÀU
=== cho_kt_lac_o_vung_tau ===
# ket_thuc:lac_o_vung_tau # loai:buon
_Chiều 18/10. Xe buýt cam đậu ở bãi xe khách sạn. Mọi người lên xe. {hr} đếm người._
hr: Bla bla… bla bla… bla. # phu_de:...20, 21, 22. Đủ rồi! Về thôi!
_Đếm người đủ. Không ai đếm chó._
_Mãi tới khi xe chạy qua cầu, {thuc_tap_sinh} mới cúi xuống gầm ghế. Trống. Người đó hét lên. Xe dừng. Mọi người chạy đi tìm, gọi tên bạn khắp bãi biển, tới tối._
_Bạn không nghe thấy. Bạn đang ở một khu chợ đêm cách đó rất xa, nằm dưới một sạp hải sản._
_Cô bán hải sản ở bến cho bạn ở tạm. Ngày nào cũng cho cơm trộn cá. Cô đặt tên mới cho bạn: "Vàng". Bạn không phản đối. Bạn chỉ không quay đầu khi nghe tên đó._
co_hai_san: Bla bla… bla… ĂN… bla. # phu_de:Vàng ơi, ăn cơm. Ngồi trông hoài vậy, chủ mày không về đâu con.
_Mỗi chiều, bạn ra ngồi ở bến xe. Mỗi khi một chiếc xe buýt cam chạy qua, bạn đứng dậy. Đuôi vẫy. Mũi hít thật sâu._
_Không có mùi trà mạn. Không có mùi dầu gió. Xe chạy qua. Bạn nằm xuống. Chờ chiếc tiếp theo._
_Ở Thành Phố Ước Mơ, bác dán một tờ giấy ở cổng công ty: "TÌM CHÓ. Lông vàng, tai vểnh, đuôi cong, vòng cổ đỏ có chuông. Tên: {cho}. Ghét màu hồng."_
_Mỗi ngày, bác dán một tờ mới. Tờ cũ bị mưa làm nhòe, bác không gỡ, cứ dán chồng lên._
_Ổ của bạn bên cạnh chòi vẫn còn đó. Bác không dọn. Mỗi sáng bác vẫn để hai cây xúc xích cạnh ổ, rồi chiều thì cất đi._
_Một buổi tối, bộ đồ hồng đứng trước tờ giấy rất lâu. Rồi lấy điện thoại ra chụp, đăng lên trang của mình, với một dòng chữ. Hàng trăm nghìn người chia sẻ._
_Ở một bến xe xa, có một cô bán hải sản lướt điện thoại, dừng lại ở một tấm ảnh con chó vàng ướt sũng ngồi trong cái ca nước._
_Cô nhìn tấm ảnh. Rồi nhìn con "Vàng" đang nằm ở bến xe, mũi hướng về phía thành phố._
_Đêm 31/10, cô cho bạn xem Đại Nhạc Hội trên điện thoại. {chung_cong_ty_song:Cái công ty có con chó vàng trên tờ giấy tìm chó vẫn còn. Người ta nói vậy trong bình luận.|Bình luận nói cái công ty có con chó vàng sắp đóng cửa. Cô bán hải sản tắt điện thoại, xoa đầu bạn.}_
_Câu chuyện dừng ở đó. Không ai biết sáng mai sẽ có một chiếc xe buýt cam chạy tới, hay không._
-> END

// ------------------------------------------------------------
// 😢 📦 5. KHO BÁU BỊ DỌN
=== cho_kt_kho_bau_bi_don ===
# ket_thuc:kho_bau_bi_don # loai:buon
_Sáng 30/10. Đội dọn dẹp tới lúc 9 giờ. Ba người, một cái chổi, rất nhiều túi rác đen._
_Họ tìm thấy gầm cầu thang. Họ tìm thấy chìa khóa, son môi, điện thoại cũ, chiếc tất lẻ. {ch_co_giay_dem_17:Chiếc giày. }{ch_co_trang_ho_so_ll:Tờ giấy xanh lá chuối. }{co(gang_tay_hong):Chiếc găng tay hồng. }Tất cả._
_Không ai đọc. Không ai hỏi. Mọi thứ vào túi đen. Túi đen ra xe rác._
_Mỗi món là một câu chuyện. Giờ chúng nằm cùng nhau trong một cái túi, không ai kể._
_Chiều đó, gầm cầu thang được quét sạch, sơn trắng. Một cái biển nhựa xanh được dán lên tường: "Kho chứa đồ vệ sinh"._
_Bạn đứng ở chân cầu thang, ngửi. Sơn mới. Nước tẩy. Không còn mùi gì của bạn._
_Rồi mũi bạn bắt được một thứ, rất nhỏ, kẹt trong khe gạch giữa bức tường mới sơn và sàn nhà. Chiếc nắp bút hồng._
_Món đầu tiên bạn từng tha về. Món duy nhất còn sót lại._
_Bạn cạy nó ra bằng răng. Nằm xuống ở góc trống. Gặm._
_{hr} đi ngang qua, dừng lại. Nhìn bạn. Không cười._
hr: Bla bla… TUẤT… bla bla. # phu_de:Anh không biết đó là đồ của em, {cho}. Anh xin lỗi.
_Người đó ngồi xổm, đặt xuống cạnh bạn một ly trà ô long, như mọi lần mời ai đó "uống trà". Lần này không có chuyện gì sau đó cả. Chỉ là ngồi._
_Tối, bác ra tìm bạn. Bác thấy bạn ở góc trống, cái nắp bút hồng giữa hai chân trước._
bac_bao_ve: Bla bla… bla. # phu_de:Thôi. Về chòi, {cho}. Đồ mất thì kiếm lại.
_Bạn đi theo bác về chòi. Cái nắp bút hồng trong miệng. Ngày mai bạn sẽ bắt đầu lại. Một cái kho mới, ở một chỗ mới._
_Đêm 31/10, sau Đại Nhạc Hội, bạn nằm ở góc trống dưới gầm cầu thang. {chung_cong_ty_song:Công ty còn. Nhưng kho của bạn thì không.|Công ty có lẽ cũng sắp bị dọn như cái kho của bạn.}_
_Nhưng những câu chuyện cũ thì không ai kể lại được nữa._
-> END

// ------------------------------------------------------------
// 😢 🏡 6. GỬI VỀ VƯỜN
=== cho_kt_gui_ve_vuon ===
# ket_thuc:gui_ve_vuon # loai:buon
_Sáng thứ hai, 2/11. {giam_doc} xuống chòi, tay cầm một tờ giấy, giọng Bắc đều đều, không nhìn ai._
{
- not chung_cong_ty_song:
    giam_doc: Bla bla… bla bla bla… TUẤT. # phu_de:Công ty tạm đóng cửa, bác ạ. Tòa nhà giao lại cho chủ mới. Chủ mới không nhận chó. Anh xin lỗi bác {bac_bao_ve}.
- ch_qua_phong_gd >= 2:
    giam_doc: Bla bla… bla bla bla… TUẤT. # phu_de:Mấy lần trong phòng giám đốc rồi. Nội quy số 8, số 11, số 12. Anh xin lỗi bác {bac_bao_ve}.
- else:
    giam_doc: Bla bla… bla bla bla… TUẤT. # phu_de:Tháng này công ty nhiều chuyện quá. Anh xin lỗi bác {bac_bao_ve}.
}
giam_doc: Bla bla… KHÔNG… bla bla. # phu_de:Quyết định: chó không được ở công ty nữa.
_Bác đứng ở cửa chòi. Bác không nói gì. Bác gật đầu. Bác chỉ là bảo vệ._
_Thứ 7, bác chở bạn về nhà vườn ở Ven Đô. Bạn ngồi phía trước xe máy, tai bay phần phật như mọi tuần. Nhưng lần này bác chở theo cả cái ổ._
_Nhà vườn có rau. Có bể cá. Có cái sân đất bạn được đào thoải mái. Có bát xúc xích đầy, bác mua sẵn cả tuần._
_Ông Ba trà đá hứa ngày nào cũng ghé cho bạn ăn._
_Chủ nhật, bác ở với bạn cả ngày. Hai ông cháu tưới rau, nhìn cá, đánh cờ với ông Ba._
_Chiều chủ nhật, bác lên xe máy. Đi về phía thành phố. Về chòi bảo vệ. Ngày thường, bác vẫn phải trực cổng._
_Từ thứ 2 tới thứ 6, bạn nằm ở cổng vườn. Mũi hướng về phía thành phố._
_Gió từ phía đó mang tới khói xe, mùi đồng, mùi rau. Thỉnh thoảng, rất xa, có một chút mùi trà mạn, hay bạn tưởng tượng ra vậy._
_Bạn không ăn hết bát xúc xích. Bạn để dành một cây. Mỗi ngày một cây, xếp ở cổng vườn._
_Chiều thứ 7, có tiếng xe máy ở đầu đường đất đỏ. Bạn đứng dậy trước khi kịp nghe rõ. Đuôi vẫy tới mức cả người lắc theo._
_Bác dừng xe. Nhìn năm cây xúc xích xếp hàng ở cổng._
bac_bao_ve: Bla bla… TUẤT… bla bla. # phu_de:Để dành cho bác đấy à, {cho}. Ngốc thế.
_Bác ngồi xuống bậc cửa, bẻ đôi một cây. Một nửa cho bác, một nửa cho bạn. Như mọi lần._
_Rồi chủ nhật lại tới. Rồi chiều chủ nhật. Rồi tiếng xe máy đi xa dần._
_Bạn nằm xuống ở cổng vườn, mũi hướng về phía thành phố. Chờ thứ 7._
-> END
