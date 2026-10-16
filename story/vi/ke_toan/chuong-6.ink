// ============================================================
// KẾ TOÁN · CHƯƠNG 6: "SỔ CÁI CUỐI CÙNG" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== ke_toan_2810_moc_4 ===
# ngay:28 # gio:10:30 # noi:phong_ke_toan # bat_buoc
_Mốc 4: 800.000 người theo dõi. Hiện tại: {nguoi_theo_doi}._
{ nguoi_theo_doi < 800000:
    _Trượt. Lưu Lực đăng bài: "Có những đối tác xứng đáng với sân khấu lớn hơn." Bạn đọc, rồi kiểm tra lại số dư Quỹ Công Ty, như thể đọc số sẽ làm nó lớn lên._
    ~ kt_ngu(10)
- else:
    _Đạt. Bạn tự cho phép mình uống một ly trà sữa. Có hóa đơn._
    ~ uong(30)
    ~ kt_ngu(-5)
}
_Sáng nay cả công ty chỉ kể một chuyện: 2:10 đêm qua, fanpage tự đăng một video lạ tên "Thai_final_v12", toàn cảnh {quan_ly_idol} cười, ngủ gật, cầm hai điện thoại. Video nằm đó 6 phút, khoảng 2.000 lượt xem, rồi biến mất. Không ai dám hỏi {editor}._
_10:40. {dan_dau_tu} gõ cửa, ôm một tờ in._
dan_dau_tu: {ke_toan}. Bộ lọc của anh lần ra 80.000 tài khoản ảo theo dõi {idol_het_thoi}. Dịch vụ "Like Thật 100%". 18 triệu. Hóa đơn… gửi về công ty tháng 7, ghi "chi phí truyền thông nghệ sĩ".
_Bạn nhớ tờ hóa đơn đó. Bạn đã từ chối. Nên 18 triệu đó vẫn là nợ riêng của {idol_het_thoi}, cộng với ba tháng tiền nhà._
* [🧾 "Em từ chối từ tháng 7. Khoản đó ổng tự nợ."]
    _Cũng tháng 7, bạn thấy {quan_ly_idol} rút 12 triệu ở cây ATM tầng 1, ghi lên tờ giấy: "tiền nhà 1808". Một người có hai cái điện thoại và trả tiền nhà giùm người khác mà không nói._
    ~ phat_hien(fan_ao_phat)
    ~ phat_hien(thai_thuong_phat)
* [🤝 Gọi {idol_het_thoi} lên: "Ông nợ bao nhiêu? Mình lập kế hoạch trả, có sổ."]
    idol_het_thoi: *(không đeo kính)* … 54 triệu bà. Bà… giúp tui hả?
    ke_toan: Tui không cho tiền. Tui cho sổ. Mỗi tháng trả bao nhiêu, ghi vô, gạch đi. Gạch hết là hết nợ.
    ~ qh("idol_het_thoi", 20)
    ~ phat_hien(fan_ao_phat)
* [📢 "Anh {dan_dau_tu}, đăng số liệu đó lên. Sự thật thì không cần hóa đơn."]
    ~ scandal()
    ~ follow(20000)
    ~ qh("idol_het_thoi", -20)
    ~ qh("quan_ly_idol", -15)
    ~ qh("dan_dau_tu", 5)
- -> END

// ------------------------------------------------------------
=== ke_toan_2910_tien_san_khau ===
# ngay:29 # gio:13:00 # noi:phong_ke_toan # bat_buoc
_Ngày Internet Quốc tế. Wifi sập cả tòa nhà. Ngân hàng điện tử không vào được. Video của {editor} kẹt ở 99%. {it} đang bị cả công ty đuổi._
_Bên cho thuê Sân khấu Đại Nhạc Hội Siêu Nhân gọi: "Chị chuyển 80 triệu trước 17:00 nha chị. Không thì 17:30 tụi em tháo dàn."_
_4G một vạch. Ngân hàng chỉ còn cách đi tận nơi. Đại Lộ Kẹt Xe giờ này: một tiếng, nếu may._
* [🛵 Chạy xe ra Ngân hàng Tín Dụng Đen Đủi.]
    { RANDOM(1, 10) <= 6:
        _Kẹt xe 55 phút. Bạn tới quầy lúc 16:12. Chuyển khoản lúc 16:40. Sân khấu được giữ._
        ~ kt_quy(-80)
        ~ nghi(-30)
        ~ kt_ngu(10)
    - else:
        _Kẹt xe 1 tiếng 40 phút. Một cái xe tải chết máy giữa ngã tư. Bạn tới quầy lúc 17:08._
        _17:30, bên cho thuê tháo một nửa dàn đèn. {chi_dai} phải chạy vạy cả đêm để lắp lại._
        ~ kt_quy(-80)
        ~ follow(-30000)
        ~ kt_ngu(20)
        ~ qh("chi_dai", -5)
    }
* {not kt_quy_den_nop} [🗄️ Về nhà số 18, mở két quỹ đen, mang 80 triệu tiền mặt tới sân khấu.]
    ~ kt_cat_ket(-80)
    ~ kt_them_dau_vet(1)
    _Bạn đếm 80 triệu trước mặt anh quản lý sân khấu. Anh ta nhìn xấp tiền buộc dây thun, nhìn bạn._
    _Đại Nhạc Hội Siêu Nhân được cứu. Lúc ký biên nhận, bạn thấy {hong_hot} đứng sau lưng, điện thoại vẫn đang phát wifi "nghegichua"._
    ~ kt_ngu(10)
* [📞 Gọi {giam_doc}: "Anh, anh đi với em. Ngân hàng cần chữ ký chủ tài khoản."]
    giam_doc: Anh xuống ngay. Anh chở em.
    _{giam_doc} chở bạn bằng xe máy của Bác {bac_bao_ve}, len qua mọi con hẻm của Quận Hóng mà sếp thuộc từ năm 2010. 16:20, xong._
    ~ kt_quy(-80)
    ~ qh("giam_doc", 10)
    ~ qh("bac_bao_ve", 5)
* {kt_pha_chien_dich} [🐍 Không làm gì. Ngồi nhìn đồng hồ tới 17:30.]
    _17:30. Họ tháo dàn. Bạn nghe tin qua tờ giấy note Bác {bac_bao_ve} gửi lên. Bạn đọc, gấp lại, bỏ vào ngăn kéo._
    ~ follow(-80000)
    ~ kt_ngu(30)
- -> END

// ------------------------------------------------------------
=== ke_toan_2910_giay_nhan_tin ===
# ngay:29 # gio:15:30 # noi:choi_bao_ve
_Không wifi. Chòi bảo vệ thành tổng đài nhắn tin bằng giấy. Bác {bac_bao_ve} ngồi giữa núi giấy note. {cho} chạy đưa thư lên các tầng. {chi_dai} điều phối bằng bộ đàm._
bac_bao_ve: Cháu {ke_toan}. Có ba tờ cho cháu.
_Tờ 1, chữ của {thuc_tap_sinh}: "Dạ chị ơi, hóa đơn rào chắn sân khấu Đại Nhạc Hội em để trên bàn chị rồi ạ. 12 tấm rào, em đếm 3 lần ạ."_
_Tờ 2, không ký tên: "Chị {ke_toan} ơi, nghe nói chị có két sắt riêng hả?"_
_Tờ 3, chữ của {hr}: "{ke_toan} rảnh không, mai trước giờ họp lên phòng anh uống trà xíu. Chuyện công việc."_
* [✍️ Trả lời tờ 2: "Két sắt nào cũng có. Hóa đơn đâu em?"]
    ~ kt_hoa_don()
    _Bác {bac_bao_ve} đọc, khẽ cười, đưa cho {cho}._
* [🔥 Xé tờ 2. Không trả lời.]
    ~ kt_ngu(5)
    bac_bao_ve: Xé thì người ta biết là có đấy cháu.
* [☕ Ngồi lại uống với bác một ly trà.]
    ~ qh("bac_bao_ve", 5)
    ~ kt_ngu(-5)
    bac_bao_ve: Mười năm rồi. Cháu là người duy nhất trong công ty nộp đủ hóa đơn tiền trà cho bác.
- -> END

// ------------------------------------------------------------
=== ke_toan_2910_chu_ky_cuoi ===
# ngay:29 # gio:19:00 # noi:phong_ke_toan # dieu_kien:kt_mo_nhanh_47b
{ not kt_mo_nhanh_47b || kt_47b_hieu_luc:
    _Tối. Phòng kế toán. Bạn cộng sổ lần cuối trước họp đánh giá. Con số không đổi. Bạn đi về._
    -> END
}
_Tối 29/10. Trang 47b trong bìa nhựa, trên bàn. Còn thiếu chữ ký. Còn hai ngày._
* {not kt_ky_thang_47b} [📄 Lên phòng giám đốc. {giam_doc} vẫn đang ngồi, không có wifi, đọc giấy note.]
    giam_doc: {ke_toan}? … Em đưa anh xem.
    _Anh ấy đọc, rất chậm, không bỏ dòng nào._
    giam_doc: Lần này anh đọc rồi mới ký.
    ~ kt_ky_thang_47b = true
    ~ kt_thang_doc_47 = true
    ~ qh("giam_doc", 10)
* {kt_nhan_chung_47b == ""} [🛡️ Xuống chòi bảo vệ nhờ Bác {bac_bao_ve} làm chứng.]
    { qh_bac_bao_ve >= 10:
        bac_bao_ve: *(đeo kính, đọc, ký)* Bác làm chứng. Bác thấy hết.
        ~ kt_nhan_chung_47b = "bac_bao_ve"
    - else:
        bac_bao_ve: Bác không ký giấy người ta, cháu ạ.
    }
* {kt_nhan_chung_47b == ""} [🦁 Gọi bộ đàm cho {chi_dai}.]
    { qh_chi_dai >= 10:
        chi_dai: *(chạy lên, đọc, ký)* Rồi. Mai bà kể tui nghe hết.
        ~ kt_nhan_chung_47b = "chi_dai"
    - else:
        chi_dai: Tui đang lắp đèn sân khấu. Mai nha bà.
    }
* [😶 Để mai.]
    ~ kt_ngu(10)
- { kt_ky_thang_47b && kt_nhan_chung_47b != "":
    ~ kt_47b_hieu_luc = true
    _Đủ chữ ký. Trang 47b có hiệu lực. Bạn ngồi xuống sàn phòng kế toán, dựa lưng vào tủ hồ sơ, thở._
    ~ kt_ngu(-25)
}
-> END

// ------------------------------------------------------------
=== ke_toan_3010_truoc_gio_hop ===
# ngay:30 # gio:12:30 # noi:phong_giam_doc # bat_buoc
_12:30. Còn một tiếng rưỡi nữa là họp đánh giá. Trước giờ họp, {hr} cho dọn kho. {cho} đứng canh gầm cầu thang, gầm gừ._
{ kt_quy_den_lo && not kt_tu_khai:
    _Trên bàn {giam_doc} là một tấm ảnh in: két sắt sau bức tranh, nhà số 18. Ai chụp, ai gửi, không rõ._
    giam_doc: {ke_toan}. Đây là gì?
    -> ke_toan_3010_bi_lo
}
{ kt_tu_khai:
    _Bạn đã nói với {giam_doc} từ trước. Sáng nay anh ấy chỉ gật đầu với bạn. Không cần nói thêm._
    -> END
}
_Cuốn sổ ghi tay nằm trong túi xách. Quỹ đen: {kt_quy_den} triệu. Bạn đứng trước cửa phòng kính._
* [🗄️ Gõ cửa. Đặt cuốn sổ lên bàn: "Anh. Em có một khoản để dành. Từng đồng đều ghi ở đây."]
    ~ kt_tu_khai = true
    ~ kt_quy_den_lo = true
    _{giam_doc} đọc. Mười phút. Không nói gì. Rồi đứng dậy, đi ra cửa sổ, đứng quay lưng._
    giam_doc: *(giọng nghẹn)* Mười năm nay… có người lo cho các em hơn cả anh.
    ~ qh("giam_doc", 25)
    ~ kt_ngu(-20)
* [😶 Quay lưng đi về phòng.]
    ~ kt_ngu(10)
- -> END

=== ke_toan_3010_bi_lo ===
* [📒 Đặt cuốn sổ ghi tay lên bàn: "Anh đọc hết rồi hãy hỏi em."]
    _{giam_doc} đọc. Nhưng tấm ảnh đã được gửi vào group công ty từ 7 giờ sáng. Ba mươi người đã thấy két sắt. Không ai thấy cuốn sổ._
    ~ qh("giam_doc", 5)
* [😮‍💨 "Là tiền để trả lương nếu công ty sập. Em không lấy đồng nào."]
    giam_doc: Anh tin em. Nhưng anh không phải người duy nhất cần tin.
    ~ kt_ngu(15)
* [😶 Không nói gì.]
    ~ kt_ngu(20)
- -> END

// ------------------------------------------------------------
=== ke_toan_3010_hop_danh_gia ===
# ngay:30 # gio:14:00 # noi:phong_hop_tang_2 # bat_buoc
_14:00. Họp đánh giá cuối tháng. Cả công ty ngồi kín phòng họp tầng 2. Trên bàn: hợp đồng gia hạn của {idol_het_thoi} (hết hạn ngày mai), và bảng tổng kết tài chính bạn làm tới 3 giờ sáng._
{ kt_lan_ngat >= 1 && kt_mat_ngu >= 85:
    _Đèn phòng họp chói quá. Chữ trên bảng tổng kết nhảy múa. Bạn đứng lên trình bày, rồi thấy sàn nhà nghiêng dần…_
    ~ kt_ngu(30)
    -> ke_toan_tudo_ngat_xiu
}
_Việc đầu tiên, {giam_doc} nói nhanh như sợ đổi ý: ghế Phó Giám đốc chốt sau Đại Nhạc Hội. {truong_phong} gật đầu ba lần. {con_ong_chau_cha} nhìn ra cửa sổ, như không nghe._
{ kt_sep_hua_20:
    _Rồi {sales} giơ tay: "Còn vụ tăng lương 20% hôm karaoke sếp hứa?" Cả phòng nhìn bạn, vì ai cũng biết bạn bấm máy tính hôm đó. Bạn đọc to: 60 triệu một tháng. {giam_doc} nói: "Khi nào {ke_toan} nói được, thì được." Không ai cãi._
}
giam_doc: {ke_toan} trình bày tình hình tài chính trước nhé.
_Quỹ Công Ty: {kt_quy_cong_ty} triệu. Bạn đọc từng con số. Không làm tròn số nào._
* [📊 Đọc hết, kể cả trang 47. Cả công ty cần biết.]
    _Phòng họp im lặng khi bạn đọc tới "10 tỷ"._
    { kt_47b_hieu_luc:
        ke_toan: … Và trang 47b. Đã có hiệu lực. Nếu mình cố hết sức, không ai phải trả lại đồng nào.
        _Cả phòng thở ra cùng một lúc. {thuc_tap_sinh} khóc. {chi_dai} vỗ bàn cái rầm, rồi cười._
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 20
    - else:
        _Không ai nói gì. Rồi {chi_dai} đứng lên: "Ngày mai làm cho thật." Mọi người gật đầu._
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 10
    }
    ~ qh("chi_dai", 5)
* [🧾 Đọc số liệu. Không nhắc trang 47.]
    ~ kt_ngu(5)
- _Việc thứ hai: hợp đồng của {idol_het_thoi}. {giam_doc} nhìn bạn._
* [✅ "Gia hạn 1 năm. Kèm kế hoạch trả nợ có sổ."]
    ~ kt_quy(-96)
    ~ qh("idol_het_thoi", 15)
    ~ qh("quan_ly_idol", 15)
    idol_het_thoi: *(tháo kính)* Cảm ơn bà. Tui sẽ… hát cho đàng hoàng.
* [✂️ "Không đủ ngân sách. Không gia hạn."]
    ~ qh("idol_het_thoi", -20)
    ~ qh("quan_ly_idol", -20)
    ~ kt_keo(5)
- { kt_quy_den_lo:
    _Việc cuối: chuyện cái két sắt. Mọi ánh mắt quay về bạn._
    { kt_tu_khai:
        giam_doc: *(cầm cuốn sổ ghi tay giơ lên)* Chuyện này anh biết. {ke_toan} tự nói với anh. Mọi người đọc sổ xong rồi hãy bàn.
        ~ qh("giam_doc", 5)
    - else:
        hr: {ke_toan} ơi, sau buổi họp mình lên phòng anh uống trà xíu nha.
        _Nụ cười của {hr} hôm nay không làm bạn sợ. Nó làm bạn buồn._
    }
}
-> END

// ------------------------------------------------------------
=== ke_toan_3110_hang_ghe_cuoi ===
# ngay:31 # gio:18:30 # noi:san_khau_dem_hong # bat_buoc
{ kt_dang_nam_vien:
    _Bạn đang nằm ở Phòng khám Khỏe Re. Đại Nhạc Hội Siêu Nhân ở ngoài kia. Bạn xem qua điện thoại._
    -> END
}
_18:30. Quảng trường mới phía đông bắc. Một tiếng nữa là Đại Nhạc Hội Siêu Nhân. Sân khấu đã dựng xong, dàn đèn bạn trả 80 triệu đang thử màu. Trên nóc tòa LL bên kia đường, màn hình LED khổng lồ chiếu chữ "Hồng Ngoại"._
_Bạn đứng sau rào chắn, máy tính bỏ túi trong tay, đếm hóa đơn của đêm nay lần cuối._
{ nguyen_theo_ll:
    _Phòng chờ có đĩa bánh chuối chiên, đúng điều khoản số 4. Không ai ăn. Người cần ăn nó đang ở tòa nhà bên kia đường. Bạn vẫn ghi vào sổ: "Bánh chuối chiên: 1 đĩa. Đã chi."_
- else:
    _Sau cánh gà, {sieu_nhan_hong} vừa ăn bánh chuối chiên vừa khởi động. Thấy bạn, anh giơ ngón cái dính dầu._
}
{ kt_hong_0_dong:
    _{hong_hot} chạy tới: "Chị ơi, đoạn 'Hồng 0 Đồng' em chèn vào màn hình lớn rồi nha. Toàn clip thật!" Bạn gật. Đoạn rẻ nhất của đêm nay._
}
* [🧮 Cộng lại toàn bộ chi phí đêm nay một lần nữa.]
    _Sân khấu, đèn, rào, bánh, nước. Khớp tới từng nghìn. Bạn gập sổ lại, thấy tay mình không run._
    ~ kt_ngu(5)
* [📵 Cất điện thoại. Tối nay không đếm số người theo dõi.]
    _Lần đầu tiên trong tháng, bạn quyết định nhìn {sieu_nhan_hong} mà không nhìn con số._
    ~ kt_ngu(-15)
* [🦁 Đi tìm {chi_dai}, đứng cạnh bà ấy ở hàng đầu.]
    _{chi_dai} đang hét vào bộ đàm. Thấy bạn, bà ấy dúi cho bạn một cây đèn phát sáng màu hồng._
    ~ kt_ngu(-10)
    ~ qh("chi_dai", 5)
- _19:25. Đèn tắt dần. Bạn đứng ở chỗ khán giả đứng, sát sân khấu, cùng khoảng năm chục người. Bạn không cần đếm._
-> END

// ------------------------------------------------------------
=== ke_toan_3110_sang_cuoi_thang ===
# ngay:30 # gio:21:00 # noi:nha_so_18 # bat_buoc
_Tối thứ 6, 30/10. Họp xong. Nhà số 18. Tủ lạnh vẫn dán tờ trang 47 chữ cỡ 20, nếu bạn đã dán._
{ not kt_quy_den_nop:
    _Bạn mở két. {kt_quy_den} triệu. Mục tiêu 297._
}
* {not kt_quy_den_nop} [🗄️ Cất nốt lương tháng 10 của mình vào két.]
    ~ kt_cat_ket(12)
    ~ tien_cong(-12000000)
    _Ghi sổ: "30/10. +12. Không mua gì cho mình tháng này. Không sao."_
* [🐌 Đi ăn ốc khuya với {chi_dai}, không nghĩ gì.]
    ~ an(35)
    ~ kt_ngu(-10)
    ~ qh("chi_dai", 5)
* [😴 Đi ngủ sớm. Mai là ngày dài nhất tháng.]
    ~ kt_ngu(-15)
    ~ nghi(30)
- -> END
