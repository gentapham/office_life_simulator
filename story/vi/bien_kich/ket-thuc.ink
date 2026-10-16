// ============================================================
// BIÊN KỊCH: OÁNH · ĐÁNH GIÁ & 6 KẾT THÚC
// Chạy sau Đại Nhạc Hội Siêu Nhân (31/10, 23:30), dùng mọi lựa chọn tới hết 31/10.
// Đọc ket_thuc_su_nghiep / chung_cong_ty_song khi nhắc tới Nguyên và công ty.
// Thứ tự: bí mật > 2 vui > 3 buồn > mặc định
//   1. 🔒 Công Ty Là Gia Đình (bí mật)
//   2. Đồng Tác Giả
//   3. Kịch Bản Không Cần Mượn
//   4. Tiểu Thuyết Bị Lộ (Độ Lộ từng chạm 100, hoặc đã bán sách cho LL)
//   5. Trang Giấy Trắng (kịch bản không xong trước 26/10, hoặc Cảm Hứng về 0)
//   6. Đạo Ý Tưởng Ngày Ra Mắt (Mượn ≥ 25, không ghi công cho Duy, có người biết)
//   Mặc định: Mượn > Thật mà không ghi công thì Đạo Ý Tưởng, còn lại Không Cần Mượn
// ============================================================

=== bien_kich_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau_dem_hong
~ temp lo_sach = bk_do_lo_tung_100 || bk_ban_cho_ll
{
- bk_trang_tieu_thuyet >= 90 && bk_chu_ky_dong_y >= 8 && bk_tu_choi_ll && not lo_sach:
    ~ chot_ket_thuc("cong_ty_la_gia_dinh")
    -> bien_kich_kt_cong_ty_la_gia_dinh
- bk_ghi_cong_duy && bk_credit == "ca_hai" && bk_phim_thanh_cong && not lo_sach:
    ~ chot_ket_thuc("dong_tac_gia")
    -> bien_kich_kt_dong_tac_gia
- bk_kich_ban_phim_xong && bk_y_tuong_that >= 70 && bk_y_tuong_that > bk_y_tuong_muon && not bk_tham_khao_sau_15 && bk_cam_hung >= 50 && not lo_sach:
    ~ chot_ket_thuc("khong_can_muon")
    -> bien_kich_kt_khong_can_muon
- lo_sach:
    ~ chot_ket_thuc("tieu_thuyet_bi_lo")
    -> bien_kich_kt_tieu_thuyet_bi_lo
- not bk_kich_ban_phim_xong || bk_cam_hung <= 0:
    ~ chot_ket_thuc("trang_giay_trang")
    -> bien_kich_kt_trang_giay_trang
- bk_y_tuong_muon >= 25 && not bk_ghi_cong_duy && bk_ai_biet_chuyen:
    ~ chot_ket_thuc("dao_y_tuong")
    -> bien_kich_kt_dao_y_tuong
- bk_y_tuong_muon > bk_y_tuong_that && not bk_ghi_cong_duy:
    ~ chot_ket_thuc("dao_y_tuong")
    -> bien_kich_kt_dao_y_tuong
- else:
    ~ chot_ket_thuc("khong_can_muon")
    -> bien_kich_kt_khong_can_muon
}

// ------------------------------------------------------------
// 😄 1. ĐỒNG TÁC GIẢ
=== bien_kich_kt_dong_tac_gia ===
# ket_thuc:dong_tac_gia # loai:co_hau # noi:hau_truong_dem_hong
_23 giờ 30. Hậu trường Sân khấu Đại Nhạc Hội Siêu Nhân. Màn hình lớn đã tắt, nhưng bạn vẫn thấy dòng chữ đó mỗi khi nhắm mắt:_
_"Ý tưởng: {thuc_tap_sinh}. Kịch bản: {bien_kich} & {thuc_tap_sinh}."_
_Lúc nó hiện lên, cả khán đài vỗ tay. Tiếng vỗ tay dội vào cánh gà như mưa trên mái tôn._
{ bk_hai_cay_so:
    _{thuc_tap_sinh} ngồi trên thùng loa, cầm cái bánh chuối chiên {sieu_nhan_hong} cho hồi chiều, chưa nỡ ăn._
    thuc_tap_sinh: Dạ chị… ngày em nghỉ ngân hàng, người mặc đồ hồng đẩy xe cho em hai cây số. Em không biết người đó là ai. Mà tối nay coi phim, em thấy như người đó đang ngồi đâu đây, coi chung.
    _Cách đó năm mét, {sieu_nhan_hong} đang tháo găng tay, ngồi ăn chè bằng ống hút. Không quay lại. Không nghe thấy._
    _Bạn không nói gì. Có những người hùng không cần ai biết tên. Bạn đã viết câu đó. Giờ bạn mới hiểu nó._
- else:
    _Ở hàng ghế nhân viên lúc đó, {thuc_tap_sinh} đứng dậy, cúi chào bốn phía, ba mươi tuổi, thực tập sinh, và khóc như con nít._
}
{ chung_cong_ty_song:
    _Ngoài kia người ta còn đang hò reo vì con số. {cong_ty} được cứu. Còn ở đây, hai người viết chỉ quan tâm một dòng chữ._
- else:
    _Ngoài kia, bộ đếm đã dừng, và không ai còn tâm trí đọc con số. Nhưng dòng chữ kia thì đã lên màn hình, và không ai lấy lại được._
}
chi_dai: *(đi ngang, vỗ vai {thuc_tap_sinh}, mạnh tới mức anh ấy ho)* Khóc đi. Hôm nay được khóc.
_{thuc_tap_sinh} quay sang tìm bạn, định nói gì đó. Nhưng bạn đang cúi đầu, cây bút máy mực hồng chạy trên một trang sổ mới tinh._
_Câu đầu tiên của một kịch bản mới. Lần này, từ chữ đầu tới chữ cuối, hoàn toàn là của bạn._
_Bạn viết: "Có những người hùng không cần ai biết tên. Nhưng có những cái tên, nhất định phải được viết ra."_
_Rồi bạn gạch đi. Viết lại. Gạch đi. Viết lại. Như mọi nhà văn thật._
thuc_tap_sinh: Dạ chị… phim sau… em có được viết chung nữa hông ạ?
bien_kich: Được. Nhưng lần này anh phải gọi tui là "bà".
thuc_tap_sinh: Dạ… dạ… *(lắp bắp)* Dạ… bà.
_Cả hai bật cười. Pháo giấy hồng còn dính trên tóc cả hai._
-> END

// ------------------------------------------------------------
// 😄 2. KỊCH BẢN KHÔNG CẦN MƯỢN
=== bien_kich_kt_khong_can_muon ===
# ket_thuc:khong_can_muon # loai:co_hau # noi:hau_truong_dem_hong
_23 giờ 30. Hậu trường. Phim của bạn đã chiếu xong từ bốn tiếng trước, mà tai bạn vẫn còn nghe tiếng mưa trong phim._
_{truong_phong} cầm tờ danh sách đề bạt từ cuộc họp chiều qua, đọc bằng giọng của người đã họp 400 cuộc trong một tháng._
truong_phong: Phòng Sản xuất. Trưởng nhóm Biên kịch: {bien_kich}. Sếp duyệt rồi, mình thông báo luôn ở đây cho nóng.
_Im lặng một giây. Rồi một tràng vỗ tay. Người vỗ đầu tiên, và to nhất, là {designer}._
designer: *(nghiêng sang, nói nhỏ)* Lần này của bà thiệt hả?
_Bạn gật. Không cần nói gì thêm. Lần đầu tiên trong năm năm, {designer} gật lại._
{ chung_cong_ty_song:
    giam_doc: Phim của em mở màn, công ty sống. Anh không ép, nhưng anh tự hào.
- else:
    giam_doc: Chiến dịch… không tới đích. Mai anh không biết công ty còn không. Nhưng phim của em là thứ duy nhất tháng này anh không phải sửa câu nào.
}
_{thuc_tap_sinh} ở cuối hậu trường giơ ngón cái. {chi_dai} gõ bộ đàm vào cột sân khấu. {hong_hot} đăng story "biên kịch nhà mình lên chức, ối dồi ôi"._
truong_phong: À… và {bien_kich} không cần note biên bản nữa nhé. Từ giờ có người note cho em.
_Đó là câu dễ thương nhất {truong_phong} từng nói. Bạn ghi nhớ, không cần sổ._
_Đêm đó, ở gác mái số 7, bạn cắt một tờ giấy A4, viết bằng bút máy mực hồng, nét to nhất đời:_
_"Đây không phải cảm hứng. Đây là của tui."_
_Bạn dán nó lên tường, ngay trên máy đánh chữ._
_Bí nhảy lên bàn, ngắm tờ giấy ba giây, rồi giơ chân cào rách một góc._
bien_kich: Bí! Đó là tuyên ngôn!
_Bí nhìn bạn, kiểu "tuyên ngôn thì phải chịu được phê bình chứ". Rồi nằm xuống, ngủ._
_Bạn để nguyên góc rách. Văn hay thì không cần tờ giấy phẳng._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: CÔNG TY LÀ GIA ĐÌNH
=== bien_kich_kt_cong_ty_la_gia_dinh ===
# ket_thuc:cong_ty_la_gia_dinh # loai:co_hau # bi_mat # noi:hieu_sach_pho_cu
_Đêm 31/10, 23 giờ 30. Bạn về gác mái, đặt bản thảo gần trăm trang lên bàn. Trang cuối là danh sách chữ ký của những người trong sách. Bạn đóng nó lại, lần đầu không sợ ai đọc._
_Ba tháng sau. Tháng 1, Phố Cũ lạnh. Trước hiệu sách đầu chợ, hàng người xếp dài tới tận quán cà phê muối._
_Trên kệ kính: "CÔNG TY LÀ GIA ĐÌNH", tiểu thuyết đầu tay của {bien_kich}. Đã bán hết đợt in đầu tiên. Đợt hai cũng sắp hết._
_Bạn ngồi sau cái bàn nhỏ, ký sách. Người xếp hàng xin chữ ký đầu tiên… là cả công ty._
hong_hot: Ký cho tui! Mà tui là nhân vật nào? Có phải cô "Ngọc Hóng" hông? Phải hông?!
bien_kich: Bà đọc đi rồi biết.
dan_dau_tu: Anh mua ba cuốn. Một cuốn đọc, một cuốn giữ, một cuốn… để giá lên thì bán.
chi_dai: *(lật tới một trang, đọc, gật gù)* Viết chị đúng. Không sai chữ nào. Tha cho em.
_{designer} cầm sách, lật tới trang bìa trong. Hình minh họa do chính {designer} vẽ, có tên in đàng hoàng._
designer: Lần đầu tui được ghi tên ở bìa trong. Bà nợ tui năm năm, trả một lần ha.
_{thuc_tap_sinh} ôm cuốn sách vào ngực, mở trang đề tặng: "Gửi anh {thuc_tap_sinh}, người kể cho tôi chuyện đẩy xe. Phần đó tôi không dám viết. Để anh tự kể."_
thuc_tap_sinh: Dạ… em… dạ. *(không nói được nữa)*
_Bác {bac_bao_ve} xếp hàng cuối cùng, xin chữ ký cho "một người bạn ở xa". Bạn không hỏi là ai. Bác cũng không nói._
_Rồi tới lượt {giam_doc}. {chung_cong_ty_song: Vẫn là giám đốc, vẫn mặc vest đi ký sách.|Không còn là giám đốc của ai, mặc áo thun, nhưng vẫn đứng xếp hàng như mọi người.} Anh đọc xong cuốn sách từ tuần trước. Anh đóng sách lại, đặt lên bàn, gõ hai cái lên bìa._
giam_doc: Em viết anh "ký mà không đọc". *(im một lúc)* Đúng thật.
giam_doc: Anh không ép, tùy em… nhưng tập 2 cho anh làm nhân vật chính nhé.
_Cả hàng người cười ồ. Bạn mở sổ bìa da, lật sang trang mới, viết: "Tập 2."_
_Bên dưới, bạn để trống. Lần này không phải vì bí. Mà vì còn cả một năm để sống cho đủ chuyện mà viết._
-> END

// ------------------------------------------------------------
// 😢 4. ĐẠO Ý TƯỞNG NGÀY RA MẮT
=== bien_kich_kt_dao_y_tuong ===
# ket_thuc:dao_y_tuong # loai:buon # noi:hau_truong_dem_hong
_23 giờ 30. Hậu trường. Màn hình lớn vừa tắt. Ba tiếng trước nó còn chạy dòng chữ trắng: "Kịch bản: {bien_kich}."_
_Điện thoại của cả hậu trường cùng rung một lúc. Trang Confession {cong_ty} vừa đăng một tấm ảnh._
{ bk_ghi_chu_y_tuong_duy:
    _Ảnh chụp một trang sổ bìa da, nét bút máy mực hồng của bạn: "Ý tưởng của {thuc_tap_sinh} (2/10)"._
- else:
    _Ảnh chụp một trang sổ ô ly, nét chữ nắn nót: "Người Gác Két. Kể chị {bien_kich} nghe, tháng 9."_
}
{ bk_nguoi_nhat_so == "hong_hot":
    _Ở góc hậu trường, {hong_hot} buông điện thoại, mặt tái mét: "Không phải tui… tui hông có gửi…"_
- else:
    { bk_nguoi_nhat_so == "ran_doc":
        _Ở cuối hậu trường, {ran_doc} khoanh tay, nói với người bên cạnh: "Tui chỉ nói sự thật thôi mà."_
    - else:
        _Không ai biết ảnh từ đâu ra. Chỉ có {ten(ran_thu_hai)} cúi đầu nhìn điện thoại, rất lâu._
    }
}
_Cả hậu trường quay lại. Mọi cái đầu cùng một hướng: chỗ {thuc_tap_sinh} đang cuộn dây điện._
_{thuc_tap_sinh} đứng dậy. Ba mươi tuổi. Thực tập sinh. Áo sơ mi trắng ủi phẳng._
_Anh ấy nhìn bạn. Rồi lắc đầu, nhẹ thôi, và nói to vừa đủ cho những người gần nghe thấy:_
thuc_tap_sinh: Dạ… không sao đâu ạ.
_Điều đó còn đau hơn bất kỳ lời mắng nào._
_{chi_dai} đặt bộ đàm xuống, không nói gì, đi thẳng ra cổng. Đi theo {thuc_tap_sinh}._
{ chung_cong_ty_song:
    _Sáng mai cả mạng sẽ nói về Siêu Nhân Hồng. Và về một chữ không ai muốn đứng cạnh tên mình, đứng ngay cạnh tên bạn._
- else:
    _Sáng mai công ty có lẽ không còn. Nhưng chữ không ai muốn đứng cạnh tên mình thì sẽ còn, đứng ngay cạnh tên bạn._
}
_Bạn ngồi xuống một thùng loa, cuốn sổ bìa da trong lòng. Bạn mở ra, định viết gì đó._
_Trang giấy nhìn lại bạn. Lần đầu tiên, bạn thấy nó giống một tấm gương._
-> END

// ------------------------------------------------------------
// 😢 5. TIỂU THUYẾT BỊ LỘ
=== bien_kich_kt_tieu_thuyet_bi_lo ===
# ket_thuc:tieu_thuyet_bi_lo # loai:buon # noi:gac_mai_so_7
_Đêm 31/10. Đại Nhạc Hội vừa xong, bạn còn chưa kịp tẩy lớp hóa trang._
{ bk_ban_cho_ll:
    _23 giờ 40, màn hình LED trên tòa LL bên kia đường đổi hình: bìa sách xanh lá chuối, "CÔNG TY LÀ GIA ĐÌNH. Phát hành 1/11. Sự thật về công ty đã làm Siêu Nhân Hồng thất vọng"._
- else:
    _23 giờ 40, bản chụp từng trang tiểu thuyết bắt đầu lan khắp group Zola của công ty. Không ai biết ai gửi đầu tiên. Chỉ biết là đến sáng 1/11, ai cũng đã đọc._
}
_Ai cũng đọc thấy mình trong đó. Với tên thật._
_{giam_doc}: "ký mà không đọc". {dan_dau_tu}: "lúc nào cũng sắp giàu". {truong_phong}: "họp để bàn về việc giảm họp"._
_{sieu_nhan_hong}: "người hùng hơi ngố, ăn chè bằng ống hút qua khe mũ"._
hong_hot: *(trong group)* Ủa tui là "cái loa có chân" hả???
dan_dau_tu: *(trong group)* Viết đúng mà sao đọc đau vậy.
truong_phong: *(trong group)* Mình họp khẩn 5 phút về việc này nhé.
_{sieu_nhan_hong} nhắn riêng cho bạn, một dòng: "Anh ngố thiệt hả em?" Lần đầu tiên tin nhắn của {sieu_nhan_hong} không có dấu chấm than nào._
_Sáng 1/11, tin nhắn của {hr}: "Em rảnh không, lên phòng anh uống trà xíu."_
_Trà hoa cúc. Phòng HR. {hr} cười. Bạn biết nụ cười đó. Bạn đã viết về nó, ở trang 61._
hr: Anh đọc rồi. Văn em hay. *(rót trà)* Mình cùng nhìn lại hành trình nha em.
_Chiều đó bạn về gác mái số 7. Cầu thang 47 bậc. Hôm nay bạn không đếm._
_Mèo Bí nằm ngủ trên máy đánh chữ, cuộn tròn như một dấu chấm hết._
_Bạn ngồi xuống. Không đuổi Bí đi. Không cầm bút._
_Lần đầu tiên trong đời, bạn không có gì để viết._
-> END

// ------------------------------------------------------------
// 😢 6. TRANG GIẤY TRẮNG
=== bien_kich_kt_trang_giay_trang ===
# ket_thuc:trang_giay_trang # loai:buon # noi:gac_mai_so_7
_Đêm 31/10, 23 giờ 30. Gác mái số 7. Bạn về trước khi màn hình lớn tắt._
{ bk_kich_ban_phim_xong:
    _Phim của bạn đã chiếu. Người ta vỗ tay. Nhưng suốt mười lăm phút, bạn chỉ nghe thấy một chỗ trống trong đầu, chỗ mà tháng này không còn câu nào là của mình._
- else:
    _Phim đã chiếu, với cảnh cuối {thuc_tap_sinh} viết. Người ta khóc đúng ở cảnh đó. Cảnh duy nhất trong phim không có chữ nào của bạn._
}
_Đèn bàn vàng. Một tờ giấy trắng trên máy đánh chữ._
_Điện thoại rung. {thuc_tap_sinh} nhắn: "Dạ chị ơi, chị về rồi hả? Mọi người đang ăn mừng. Em nhớ chị."_
_Thêm một tin, {designer}: "Bà đâu rồi? Không có bà, tui không có ai để cãi. Chán."_
_Bạn úp điện thoại xuống._
_Ngoài cửa sổ, pháo hoa hồng còn nổ lác đác trên nóc nhà Phố Cũ. Từng chùm, từng chùm, rồi tắt._
_Bạn đặt ngón tay lên phím. Gõ một chữ: "Người"._
_Rồi xóa. Máy đánh chữ không xóa được, nên bạn gõ "xxxxx" đè lên._
_Bí nhảy lên bàn, ngồi ngay cạnh tờ giấy, nhìn bạn._
_Bí nhìn rất lâu. Đôi mắt vàng như hai ngọn đèn nhỏ trong gác mái tối._
_Như muốn nói gì đó._
_Mèo thì không nói được._
_Bạn vuốt đầu Bí. Một lần. Hai lần. Pháo hoa ngoài kia nổ thêm một chùm cuối._
_Trên tờ giấy trắng, chỉ có năm chữ "x". Và khoảng trống dành cho một câu chuyện chưa ai dám kể._
-> END
