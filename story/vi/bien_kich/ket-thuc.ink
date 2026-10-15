// ============================================================
// BIÊN KỊCH: OÁNH · ĐÁNH GIÁ & 6 KẾT THÚC
// Thứ tự ưu tiên:
//   1. Tiểu Thuyết Bị Lộ (Độ Lộ từng chạm 100, hoặc đã bán sách cho LL)
//   2. Trang Giấy Trắng (phim không xong trước 26/10, hoặc Cảm Hứng = 0 tới 30/10)
//   3. 🔒 Công Ty Là Gia Đình (bí mật)
//   4. Đồng Tác Giả
//   5. Đạo Ý Tưởng Ngày Ra Mắt
//   6. Kịch Bản Không Cần Mượn
//   Dự phòng: Mượn > Thật thì Đạo Ý Tưởng (con rắn thứ hai luôn biết), còn lại Kịch Bản Không Cần Mượn
// ============================================================

=== bien_kich_3010_danh_gia ===
# ngay:30 # gio:17:30 # bat_buoc
~ bk_phim_thanh_cong = bk_kich_ban_phim_xong && (bk_y_tuong_that + bk_y_tuong_muon) >= 50
{
- bk_do_lo_tung_100 || bk_ban_cho_ll:
    ~ chot_ket_thuc("tieu_thuyet_bi_lo")
    -> bien_kich_kt_tieu_thuyet_bi_lo
- not bk_kich_ban_phim_xong || bk_cam_hung <= 0:
    ~ chot_ket_thuc("trang_giay_trang")
    -> bien_kich_kt_trang_giay_trang
- bk_trang_tieu_thuyet >= 200 && bk_chu_ky_dong_y >= 10 && bk_tu_choi_ll && not bk_do_lo_tung_100:
    ~ chot_ket_thuc("cong_ty_la_gia_dinh")
    -> bien_kich_kt_cong_ty_la_gia_dinh
- bk_ghi_cong_duy && bk_credit == "ca_hai" && bk_phim_thanh_cong:
    ~ chot_ket_thuc("dong_tac_gia")
    -> bien_kich_kt_dong_tac_gia
- bk_y_tuong_muon > bk_y_tuong_that && not bk_ghi_cong_duy && bk_ai_biet_chuyen:
    ~ chot_ket_thuc("dao_y_tuong")
    -> bien_kich_kt_dao_y_tuong
- bk_y_tuong_that >= 70 && not bk_tham_khao_sau_15 && bk_cam_hung >= 50 && nguoi_theo_doi >= 1000000:
    ~ chot_ket_thuc("khong_can_muon")
    -> bien_kich_kt_khong_can_muon
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
# ngay:31 # gio:19:46 # noi:san_khau_dem_hong
_Phim kết thúc. Người hùng quay lưng đi trong mưa. Màn hình đen một giây._
_Rồi dòng chữ trắng hiện lên, to, rõ, giữa màn hình lớn nhất Thành Phố Ước Mơ:_
_"Ý tưởng: {thuc_tap_sinh}. Kịch bản: {bien_kich} & {thuc_tap_sinh}."_
_Cả nghìn người vỗ tay. Tiếng vỗ tay dội vào cánh gà như mưa trên mái tôn._
{ bk_hai_cay_so:
    _MC mời "tác giả ý tưởng" lên sân khấu. {thuc_tap_sinh} bước ra, run tới mức micro rung theo._
    thuc_tap_sinh: Dạ… em kể chuyện thật ạ. Ngày em nghỉ ngân hàng, trời mưa, xe em chết máy. Có một người mặc đồ hồng đẩy xe cho em hai cây số.
    thuc_tap_sinh: Hôm nay em mới biết người đó là ai.
    _{sieu_nhan_hong} bước ra từ cánh gà. Không tạo dáng. Không hô "Biến hình". Chỉ đứng cạnh {thuc_tap_sinh}, và cúi đầu._
    _Khán đài đứng dậy. Tất cả._
    ~ follow(20000)
- else:
    _Ở hàng ghế nhân viên, {thuc_tap_sinh} đứng dậy, cúi chào bốn phía, ba mươi tuổi, thực tập sinh, và khóc như con nít._
}
chi_dai: *(vỗ vai {thuc_tap_sinh}, mạnh tới mức anh ấy ho)* Khóc đi. Hôm nay được khóc.
hong_hot: *(livestream, giọng nghẹn)* Mấy bà ơi… tui hóng cả đời mà chưa thấy cái gì đẹp vậy.
_{thuc_tap_sinh} quay sang tìm bạn trong đám đông, định nói gì đó._
_Nhưng bạn không vỗ tay. Bạn đang cúi đầu, cây bút máy mực hồng chạy trên một trang sổ mới tinh._
_Câu đầu tiên của một kịch bản mới. Lần này, từ chữ đầu tới chữ cuối, hoàn toàn là của bạn._
_Bạn viết: "Có những người hùng không cần ai biết tên. Nhưng có những cái tên, nhất định phải được viết ra."_
_Rồi bạn gạch đi. Viết lại. Gạch đi. Viết lại. Như mọi nhà văn thật._
_Pháo hoa hồng nổ trên đầu. {thuc_tap_sinh} ngồi xuống cạnh bạn, nói nhỏ:_
thuc_tap_sinh: Dạ chị… phim sau… em có được viết chung nữa hông ạ?
bien_kich: Được. Nhưng lần này anh phải gọi tui là "bà".
thuc_tap_sinh: Dạ… dạ… *(lắp bắp)* Dạ… bà.
_Cả hai bật cười. Ở trên sân khấu, Đêm Hồng mới chỉ bắt đầu._
-> END

// ------------------------------------------------------------
// 😄 2. KỊCH BẢN KHÔNG CẦN MƯỢN
=== bien_kich_kt_khong_can_muon ===
# ngay:30 # gio:17:45 # noi:phong_hop_tang_2
_Họp đánh giá. {truong_phong} cầm tờ danh sách, đọc bằng giọng của người đã họp 400 cuộc trong một tháng._
truong_phong: Đề bạt trong Phòng Sản xuất. Trưởng nhóm Biên kịch: {bien_kich}.
_Im lặng một giây. Rồi một tràng vỗ tay. Người vỗ đầu tiên, và to nhất, là {designer}._
designer: *(nghiêng sang, nói nhỏ)* Lần này của bà thiệt hả?
_Bạn gật. Không cần nói gì thêm. Lần đầu tiên trong năm năm, {designer} gật lại._
{ nguoi_theo_doi >= 1000000:
    giam_doc: Chiến dịch thành công, phim của em mở màn Đêm Hồng. Anh không ép, nhưng anh tự hào.
- else:
    giam_doc: Chiến dịch… chưa tới đích. Nhưng phim của em là thứ duy nhất tháng này anh không phải sửa câu nào.
}
_{thuc_tap_sinh} ở cuối phòng giơ ngón cái. {chi_dai} vỗ bàn. {hong_hot} đăng story "biên kịch nhà mình lên chức, ối dồi ôi"._
truong_phong: À… và {bien_kich} không cần note biên bản nữa nhé. Từ giờ có người note cho em.
_Đó là câu dễ thương nhất {truong_phong} từng nói. Bạn ghi nhớ, không cần sổ._
_Tối đó, ở gác mái số 7, bạn cắt một tờ giấy A4, viết bằng bút máy mực hồng, nét to nhất đời:_
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
# ngay:31 # gio:23:59 # noi:hieu_sach_pho_cu
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
_Rồi tới lượt {giam_doc}. Anh đọc xong cuốn sách từ tuần trước. Anh đóng sách lại, đặt lên bàn, gõ hai cái lên bìa._
giam_doc: Em viết anh "ký mà không đọc". *(im một lúc)* Đúng thật.
giam_doc: Anh không ép, tùy em… nhưng tập 2 cho anh làm nhân vật chính nhé.
_Cả hàng người cười ồ. Bạn mở sổ bìa da, lật sang trang mới, viết: "Tập 2."_
_Bên dưới, bạn để trống. Lần này không phải vì bí. Mà vì còn cả một năm để sống cho đủ chuyện mà viết._
-> END

// ------------------------------------------------------------
// 😢 4. ĐẠO Ý TƯỞNG NGÀY RA MẮT
=== bien_kich_kt_dao_y_tuong ===
# ngay:31 # gio:19:46 # noi:san_khau_dem_hong
~ scandal()
~ follow(-80000)
_Đêm Hồng. Phim vừa chiếu xong. Khán giả còn đang vỗ tay. Màn hình lớn hiện dòng chữ trắng:_
_"Kịch bản: {bien_kich}."_
_Rồi màn hình nháy một cái. Một tấm ảnh hiện lên, to bằng cả sân khấu._
{ bk_ghi_chu_y_tuong_duy:
    _Ảnh chụp một trang sổ bìa da, nét bút máy mực hồng của bạn: "Ý tưởng của {thuc_tap_sinh} (2/10)"._
- else:
    _Ảnh chụp một trang sổ ô ly, nét chữ nắn nót: "Người Gác Két. Kể chị {bien_kich} nghe, tháng 9."_
}
{ bk_nguoi_nhat_so == "hong_hot":
    _Ở bàn điều khiển livestream, {hong_hot} buông điện thoại, mặt tái mét: "Không phải tui… tui hông có gửi…"_
- else:
    { bk_nguoi_nhat_so == "ran_doc":
        _Ở cuối khán đài, {ran_doc} khoanh tay, nói với người bên cạnh: "Tui chỉ nói sự thật thôi mà."_
    - else:
        _Không ai biết ảnh từ đâu ra. Chỉ có {ten(ran_thu_hai)} cúi đầu nhìn điện thoại, rất lâu._
    }
}
_Cả khán đài quay lại. Một nghìn cái đầu, cùng một hướng: hàng ghế cuối._
_{thuc_tap_sinh} đứng dậy. Ba mươi tuổi. Thực tập sinh. Áo sơ mi trắng ủi phẳng._
_Anh ấy nhìn bạn. Rồi lắc đầu, nhẹ thôi, và nói to vừa đủ cho những hàng ghế gần nghe thấy:_
thuc_tap_sinh: Dạ… không sao đâu ạ.
_Điều đó còn đau hơn bất kỳ lời mắng nào._
_{chi_dai} đứng dậy khỏi ghế, không nói gì, đi thẳng ra khỏi khán đài. Đi theo {thuc_tap_sinh}._
hong_hot: *(đang livestream, không tắt kịp)* Ối… ối dồi ôi…
_Trên mạng, hashtag mới lên xu hướng. Không phải tên phim. Là tên bạn, kèm một chữ không ai muốn đứng cạnh tên mình._
_Bạn ngồi yên giữa ghế, cuốn sổ bìa da trong lòng. Bạn mở ra, định viết gì đó._
_Trang giấy nhìn lại bạn. Lần đầu tiên, bạn thấy nó giống một tấm gương._
-> END

// ------------------------------------------------------------
// 😢 5. TIỂU THUYẾT BỊ LỘ
=== bien_kich_kt_tieu_thuyet_bi_lo ===
# ngay:31 # gio:10:00 # noi:gac_mai_so_7
{ bk_ban_cho_ll:
    ~ follow(-30000)
    _Ngày 1/11. LL-Entertainment tung cuốn "Công Ty Là Gia Đình" lên mạng, bìa xanh lá chuối, khẩu hiệu: "Sự thật về công ty đã làm Siêu Nhân Hồng thất vọng"._
- else:
    ~ follow(30000)
    _Bản chụp từng trang tiểu thuyết lan khắp group Zalo-lô. Không ai biết ai gửi đầu tiên. Chỉ biết là đến trưa, ai cũng đã đọc._
}
_Ai cũng đọc thấy mình trong đó. Với tên thật._
_{giam_doc}: "ký mà không đọc". {dan_dau_tu}: "lúc nào cũng sắp giàu". {truong_phong}: "họp để bàn về việc giảm họp"._
_{sieu_nhan_hong}: "người hùng hơi ngố, ăn chè bằng ống hút qua khe mũ"._
hong_hot: *(trong group)* Ủa tui là "cái loa có chân" hả???
dan_dau_tu: *(trong group)* Viết đúng mà sao đọc đau vậy.
truong_phong: *(trong group)* Mình họp khẩn 5 phút về việc này nhé.
_{sieu_nhan_hong} nhắn riêng cho bạn, một dòng: "Anh ngố thiệt hả em?" Không có biểu tượng cảm xúc nào. Lần đầu tiên._
_Rồi tin nhắn của {hr}: "Em rảnh không, lên phòng anh uống trà xíu."_
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
# ngay:31 # gio:19:30 # noi:gac_mai_so_7
_Đêm 31/10. Đêm Hồng Halloween._
_Phim ngắn "Người Hùng Không Tên" bị hủy. Thay vào đó, mở màn Đêm Hồng là 15 phút {giam_doc} phát biểu trong bộ đồ Ông Kẹ Ngân Hàng._
_Cả công ty ở Sân khấu Đêm Hồng. Trừ bạn._
_Gác mái số 7. Đèn bàn vàng. Một tờ giấy trắng trên máy đánh chữ._
_Điện thoại rung. {thuc_tap_sinh} nhắn: "Dạ chị ơi, sếp phát biểu tới đoạn hồi khởi nghiệp lần ba rồi ạ. Em nhớ chị."_
_Thêm một tin, {designer}: "Bà đâu rồi? Không có bà, tui không có ai để cãi. Chán."_
_Bạn úp điện thoại xuống._
_Ngoài cửa sổ, pháo hoa hồng nổ trên nóc nhà Phố Cũ. Từng chùm, từng chùm, rồi tắt._
_Bạn đặt ngón tay lên phím. Gõ một chữ: "Người"._
_Rồi xóa. Máy đánh chữ không xóa được, nên bạn gõ "xxxxx" đè lên._
_Bí nhảy lên bàn, ngồi ngay cạnh tờ giấy, nhìn bạn._
_Bí nhìn rất lâu. Đôi mắt vàng như hai ngọn đèn nhỏ trong gác mái tối._
_Như muốn nói gì đó._
_Mèo thì không nói được._
_Bạn vuốt đầu Bí. Một lần. Hai lần. Pháo hoa ngoài kia nổ thêm một chùm cuối._
_Trên tờ giấy trắng, chỉ có năm chữ "x". Và khoảng trống dành cho một câu chuyện chưa ai dám kể._
-> END
