// ============================================================
// KẾ TOÁN · CHƯƠNG 2: "NGÀY 10 KHÔNG CÓ LƯƠNG" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== ke_toan_0510_ho_so_huyen ===
# ngay:5 # gio:08:10 # noi:phong_ke_toan
_Thứ Hai. Trên bàn bạn có một bộ hồ sơ "Đối tác chiến lược BTT Global", thiết kế rất xịn, bìa cứng, ép kim. Người nộp: {sales}._
_Đẹp tới mức đáng ngờ. Hồ sơ thật thì thường xấu hơn._
* [🔍 "Đọc Chữ Cỡ 6": soi từng dòng bằng kính lúp.]
    ~ kt_bat_bai_huyen = true
    ~ nghi(-20)
    _Trang cuối, số điện thoại "Văn phòng đại diện BTT Global". Bạn gọi thử._
    co_ban_hang: Alo, tiệm Nail & Tóc Lung Linh xin nghe! Chị muốn làm móng hay gội đầu?
    _Bạn cúp máy. Ghi vào sổ. Không ngạc nhiên lắm._
    ~ phat_hien(btt_global_gia)
    ~ kt_ngu(5)
* [🎨 Lật xem ai thiết kế bộ hồ sơ.]
    _Font chữ, cách căn lề, màu cam pha hồng… Bạn đã thấy phong cách này trên poster công ty. Là tay {designer}._
    ~ kt_keo(3)
* [📥 Để vào khay "Chờ duyệt". Chờ người nộp tự lên.]
    _Khay "Chờ duyệt" đã có 14 hồ sơ của {sales}. Cái này là thứ 15._
- -> END

// ------------------------------------------------------------
=== ke_toan_0510_to_giay_an ===
# ngay:5 # gio:10:30 # noi:phong_ke_toan # bat_buoc
sales: Chị {ke_toan}, tạm ứng em 50 triệu nha. Nhà tài trợ lớn nhất năm, tối nay chốt ở Quán Ốc Đêm. Tin chị đi, deal này chắc kèo!
_Trên bàn là một tờ giấy ăn, ghi bằng bút kẻ mắt: "Tạm ứng 50tr – {sales}"._
ke_toan: Em nhỏ hơn chị bốn tuổi đó {sales}.
sales: Thì… tin em đi chị!
* [🧾 "Hóa đơn đâu em? Hợp đồng đâu em? Tên nhà tài trợ đâu em?"]
    ~ kt_hoa_don()
    ~ kt_tam_ung_huyen = 0
    ~ qh("sales", -15)
    ~ qh("designer", -10)
    sales: Sao mà căng vậy chị…
    _Ba ngày sau đó, {designer} gặp bạn ở pantry là quay đi. {sales} và {designer} cùng phe._
* [💸 "Chị ứng em 5 triệu tiền ốc. Chốt được thật thì đem hợp đồng lên lấy 45 triệu còn lại."]
    ~ kt_tam_ung_huyen = 5
    ~ kt_quy(-5)
    sales: *(cười gượng)* Sao mà căng vậy chị… Dạ, 5 triệu cũng được.
    ~ qh("sales", -3)
* [😇 "Thôi được, chị tin em lần này."]
    ~ kt_tam_ung_huyen = 50
    ~ kt_quy(-50)
    ~ kt_keo(-15)
    ~ qh("sales", 15)
    sales: Chị số một! No cap!
    _Năm mươi triệu đi ra khỏi tài khoản. Bạn biết nó sẽ không quay lại. Bạn vẫn ký. Có lẽ hôm nay bạn quá mệt._
    ~ kt_ngu(5)
* {kt_bat_bai_huyen} [🔒 "{sales}, chị gọi số điện thoại nhà tài trợ trên hồ sơ rồi. Đó là số tiệm nail Lung Linh."]
    _{sales} tái mặt. Lần đầu tiên bạn thấy {sales} không nói được câu nào._
    sales: Chị… chị đừng nói với ai nha chị.
    ke_toan: Chị không nói. Nhưng từ giờ, không có giấy thì đừng lên đây.
    ~ kt_tam_ung_huyen = 0
    ~ qh("sales", -10)
    ~ kt_keo(5)
    _Từ hôm đó {sales} không dám xin tạm ứng ma nữa. Bạn nắm một bí mật của {sales}. Và {designer} biết bạn nắm._
- -> END

// ------------------------------------------------------------
=== ke_toan_0510_hoa_thay_co ===
# ngay:5 # gio:14:00 # noi:phong_ke_toan
_Ngày Nhà giáo Thế giới. {thuc_tap_sinh} gõ cửa, ôm một bông hồng và một tấm thiệp._
thuc_tap_sinh: Dạ, em tặng chị {ke_toan} ạ. Chị dạy em cách điền phiếu chi ạ!
_Thiệp ghi: "Kính tặng cô {ke_toan}, người thầy của những tờ hóa đơn."_
* [😊 "Cảm ơn em. Mà {thuc_tap_sinh}, mình bằng tuổi đó. Gọi tên thôi."]
    thuc_tap_sinh: Dạ… dạ thôi chị, em thực tập mà. Phải đúng phép ạ.
    ~ qh("thuc_tap_sinh", 10)
* [🧾 "Bông hồng này mua bao nhiêu? Có hóa đơn hông?"]
    ~ kt_hoa_don()
    thuc_tap_sinh: Dạ… em mua bằng tiền em ạ. Dạ em không cần hoàn đâu ạ.
    _Bạn cười. Lần đầu tiên trong tuần._
    ~ qh("thuc_tap_sinh", 5)
    ~ cang_thang(-5)
* [💬 "Em điền phiếu chi nhanh hơn cả chị. Trước đây em làm gì?"]
    thuc_tap_sinh: *(khựng lại rất nhẹ)* Dạ… em làm… văn phòng ạ. Dạ em mới vô nên chưa biết ạ.
    _Câu trả lời không khớp với tốc độ điền phiếu. Bạn ghi nhận, nhưng không ghi vào sổ._
- -> END

// ------------------------------------------------------------
=== ke_toan_0610_ba_cu ===
# ngay:6 # gio:11:00 # noi:phong_ke_toan # bat_buoc
_Buổi chụp poster đầu tiên. Tiền thuê studio 12 triệu, đã chuyển khoản từ hôm qua._
_10:15, {sieu_nhan_hong} bỏ ngang buổi chụp, chạy ra ngã tư giúp một bà cụ. Điều khoản số 3: công ty không được trừ tiền._
quan_ly_idol: *(gọi tới, hụt hơi)* {ke_toan} ơi, studio đòi tính thêm 6 triệu vì chụp lố giờ. Khoan, anh nghe máy chút… Em duyệt giùm anh nha!
_Cùng lúc, {hong_hot} đăng clip {sieu_nhan_hong} dắt bà cụ qua đường. Ba mươi nghìn lượt xem trong một giờ. Clip quay bằng điện thoại. Chi phí: 0 đồng._
* [🧾 "Studio tính lố giờ thì đưa biên bản giờ vào ra. Không có thì không trả."]
    ~ kt_hoa_don()
    ~ kt_quy(6)
    ~ qh("quan_ly_idol", -5)
    quan_ly_idol: Chuyện này để anh lo… à, em lo luôn rồi. Ok.
* [💸 Duyệt 6 triệu. Đừng làm khó người đang chạy show.]
    ~ kt_quy(-6)
    ~ kt_keo(-5)
    ~ qh("quan_ly_idol", 10)
* [📝 Ghi vào sổ: "Clip thật, 0 đồng: 30.000 view. Poster, 12 triệu: chưa có."]
    ~ kt_keo(2)
    _Bạn tô vàng dòng này. Một ý tưởng nhỏ bắt đầu nhú lên: chiến dịch rẻ nhất có khi lại là chiến dịch thật nhất._
    ~ qh("sieu_nhan_hong", 5)
- ~ follow(30000)
-> END

// ------------------------------------------------------------
=== ke_toan_0710_moc_1 ===
# ngay:7 # gio:16:00 # noi:phong_ke_toan # bat_buoc
_Mốc 1: 50.000 người theo dõi. Bạn không cần mở điện thoại. Cả tầng 1 đang hò hét hay đang im lặng là biết._
{ nguoi_theo_doi >= 50000:
    -> ke_toan_0710_dat_moc
- else:
    -> ke_toan_0710_truot_moc
}

=== ke_toan_0710_dat_moc ===
_Đạt. {giam_doc} mời cả công ty bánh mì. Hóa đơn cô Bảy gửi lên phòng bạn trước cả bánh mì._
* [🧾 Duyệt. Có hóa đơn, có chữ ký.]
    ~ kt_quy(-1)
    ~ an(30)
    ~ qh("giam_doc", 3)
    _Bánh mì thịt đặc biệt. Bạn ăn ở bàn, vừa ăn vừa dán nhãn hóa đơn._
* [😇 Tự trả tiền bánh mì của mình, để quỹ khỏi tốn một ổ.]
    ~ tien_cong(-25000)
    ~ an(30)
    _Không ai biết. Bạn biết._
- -> END

=== ke_toan_0710_truot_moc ===
_Trượt. {giam_doc} gom cả công ty vào phòng "Sáng Tạo" để "truyền lửa" 3 tiếng._
* [🧮 Ngồi tính: 3 tiếng × 22 người × lương giờ = bao nhiêu tiền.]
    _Hơn 4 triệu đồng tiền lương để nghe một bài phát biểu. Bạn chép con số lên giấy, gấp lại, kẹp vào sổ._
    ~ kt_ngu(3)
    ~ kt_keo(2)
* [💬 Nhắn {giam_doc}: "Anh, 3 tiếng là 4 triệu tiền lương. Nói 15 phút thôi anh."]
    giam_doc: *(đọc tin, nhìn quanh phòng, dừng lại sau 20 phút)* … Thôi, các em về làm việc.
    ~ qh("giam_doc", 5)
    ~ qh("hong_hot", 10)
    ~ qh("chua_te_deadline", 10)
    ~ follow(5000)
- -> END

// ------------------------------------------------------------
=== ke_toan_0810_kham_mat ===
# ngay:8 # gio:14:30 # noi:phong_ke_toan
_Ngày Thị giác Thế giới. {chi_dai} lôi {editor} vào phòng bạn. Mắt {editor} đỏ như mắt thỏ._
chi_dai: Bà duyệt tiền khám mắt cho nó đi. Nó dựng phim tới 4 giờ sáng ba tuần nay rồi.
editor: *(ngáp)* … Em ổn mà chị. Đợi render xong…
_Bạn nhìn {editor}, rồi nhìn cái kính lúp trong tay mình. Mắt bạn cũng đỏ. Mười năm đọc chữ cỡ 6._
* [✅ Duyệt khám mắt cho {editor}, kèm hóa đơn phòng khám.]
    ~ kt_quy(-1)
    ~ qh("editor", 10)
    ~ qh("chi_dai", 5)
    editor: Dạ… em cảm ơn chị. Lần đầu có người duyệt cho em đi khám.
* [👓 "Duyệt hai suất. Một cho em. Một cho chị."]
    ~ kt_quy(-2)
    ~ qh("editor", 10)
    ~ qh("chi_dai", 10)
    chi_dai: Ủa bà cũng đi hả? Tốt! Hai người đi chung!
    _Bác sĩ nói mắt bạn cần nghỉ. "Tránh nhìn chữ nhỏ." Bạn gật đầu, rồi đọc kỹ hóa đơn khám bằng kính lúp._
    ~ kt_ngu(-5)
* [🧾 "Bảo hiểm trả 80%. Em tự trả 20% nha."]
    ~ kt_hoa_don()
    editor: *(ngáp)* Dạ… 20% là bao nhiêu ạ?
    ke_toan: Ba mươi hai nghìn.
    editor: … Dạ, em trả được.
    ~ qh("editor", -3)
- -> END

// ------------------------------------------------------------
=== ke_toan_0910_duyet_quang_cao ===
# ngay:9 # gio:09:00 # noi:phong_ke_toan # bat_buoc
_Ngày ra mắt MV. {hong_hot} đứng trước bàn bạn, ôm laptop như ôm con. Bên cạnh là tờ đề nghị đã có chữ ký {giam_doc}._
hong_hot: Chị ơi! Duyệt 200 triệu quảng cáo Phây-búc với Tóp-tóp cho MV đi chị! Không chạy là MV chìm như đá liền!
_Quỹ Công Ty: {kt_quy_cong_ty} triệu. Trang 47 vẫn dán trên tủ lạnh nhà bạn._
* [✅ Duyệt đủ 200 triệu.]
    ~ kt_duyet_qc = true
    ~ kt_quy(-200)
    ~ follow(100000)
    ~ kt_ngu(10)
    ~ kt_keo(-5)
    ~ qh("hong_hot", 15)
    hong_hot: Chị đỉnh! Em chạy liền! Từ nay em hông gọi chị là… thôi em hông nói.
* [✂️ "100 triệu. Chạy thử 3 ngày, có số liệu thì chị duyệt tiếp."]
    ~ kt_quy(-100)
    ~ follow(45000)
    ~ kt_ngu(5)
    hong_hot: Dạ… 3 ngày là MV nguội rồi chị ơi.
    ~ qh("hong_hot", -3)
* [🧾 "Kế hoạch chạy đâu em? Đối tượng, ngân sách từng ngày, chỉ số đo?"]
    ~ kt_hoa_don()
    _{hong_hot} đứng hình. Rồi chạy về bàn. 40 phút sau, mang lên một bảng kế hoạch 3 trang, có biểu đồ._
    ** [✅ "Rồi. Có kế hoạch là có tiền."]
        ~ kt_duyet_qc = true
        ~ kt_quy(-200)
        ~ follow(110000)
        ~ kt_ngu(8)
        ~ qh("hong_hot", 10)
    ** [✂️ "Vẫn 100 thôi em."]
        ~ kt_quy(-100)
        ~ follow(45000)
        ~ qh("hong_hot", -5)
- -> END

// ------------------------------------------------------------
=== ke_toan_0910_tra_sua_lan_hai ===
# ngay:9 # gio:15:00 # noi:tang_1 # bat_buoc
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng. Tiệc ra mắt MV: trứng luộc, trứng chiên, trứng ốp la hình trái tim hồng._
_Và trà sữa. Lần thứ hai trong 9 ngày. Kèm "lương tuần" của mấy người chọn nhận theo tuần._
giam_doc: {ke_toan} ơi, trà sữa mừng MV, quỹ công ty nhé!
* [🧮 Ngồi tính: 9 ngày, 2 lần trà sữa, nhân với 22 tuần còn lại của năm…]
    _Gần 20 triệu một năm tiền trà sữa, nếu cứ "mừng" kiểu này. Bạn viết con số lên ly trà sữa của {giam_doc} bằng bút dạ._
    giam_doc: *(đọc ly)* … Ờ. Tuần sau anh tự trả.
    ~ kt_keo(5)
    ~ qh("giam_doc", -2)
* [😇 Duyệt. Mọi người cần vui.]
    ~ kt_quy(-1)
    ~ kt_keo(-5)
    ~ uong(30)
    ~ qh("hong_hot", 3)
    ~ qh("thuc_tap_sinh", 3)
* [🥚 Ăn trứng luộc, không uống trà sữa. Giữ đúng lời "tiết kiệm từ mình trước".]
    ~ an(15)
    _{chi_dai} bỏ vào tay bạn thêm hai quả trứng. "Ăn đi. Gầy như que tăm."_
    ~ qh("chi_dai", 3)
- ~ follow(40000)
-> END

// ------------------------------------------------------------
=== ke_toan_0910_hong_coin ===
# ngay:9 # gio:22:30 # noi:nha_so_18
_Gần nửa đêm. Điện thoại rung. {dan_dau_tu}._
dan_dau_tu: {ke_toan} ơi, ứng anh 10 triệu lương tháng sau được không? Có đồng coin mới tên Hồng Coin, vừa ra, đáy thật rồi! Lần này là lên thật!
* [🧾 "Ứng lương để mua coin thì không có trong quy chế anh. Hóa đơn coin đâu anh?"]
    ~ kt_hoa_don()
    dan_dau_tu: Coin làm gì có hóa đơn em…
    ke_toan: Thì đó.
    ~ qh("dan_dau_tu", -5)
* [💸 "Em ứng 2 triệu. Mất thì anh tự chịu."]
    ~ kt_quy(-2)
    ~ qh("dan_dau_tu", 5)
    dan_dau_tu: Em là người tốt nhất công ty! x10 về anh trả em gấp đôi!
* [💬 "Anh {dan_dau_tu}, anh đang nợ bao nhiêu người trong công ty?"]
    dan_dau_tu: *(im lặng 5 giây)* … Em hỏi chi vậy?
    ke_toan: Em giữ sổ lương. Em thấy ai cũng cho anh vay.
    dan_dau_tu: … Hai mươi hai triệu. Mà sắp trả hết rồi.
    ~ qh("dan_dau_tu", 3)
    ~ kt_ngu(2)
- -> END

// ------------------------------------------------------------
=== ke_toan_1010_lenh_bi_giu ===
# ngay:10 # gio:08:30 # noi:nha_so_18 # bat_buoc
_Thứ 7, ngày 10. Ngày nhận lương. Bạn bấm lệnh chuyển lương từ tối thứ 6._
_Tin nhắn ngân hàng lúc 8:30: "Lệnh chuyển tiền của Quý khách đang được tạm giữ để kiểm tra giao dịch lớn."_
_Mười năm chưa từng bị giữ. Bạn biết vì sao. Khoản vay thế chấp biệt thự đang quá hạn, nên mọi giao dịch của công ty bị soi._
_Group Zalo-lô bắt đầu: "Ủa lương đâu mọi người?" — "Ét o ét." — "Chị {ke_toan} ơi???"_
~ kt_ngu(10)
* [📞 Gọi {giam_doc}: "Anh. Ngân hàng giữ lệnh. Anh biết vì sao mà."]
    giam_doc: *(im lặng)* … Thứ Hai anh nói với em.
    ke_toan: Em làm sổ cho anh từ 2024, em cũng đoán ra rồi anh. Mình nói cho rõ là được.
    ~ qh("giam_doc", 5)
* [📲 Nhắn group: "Lương bị ngân hàng giữ để kiểm tra. Thứ Hai về. Ai kẹt tiền nhắn riêng chị."]
    ~ qh("hong_hot", 5)
    ~ qh("thuc_tap_sinh", 10)
    _Mười phút sau, ba tin nhắn riêng: {thuc_tap_sinh}, Bác {bac_bao_ve}, {idol_het_thoi}._
* [😶 Tắt thông báo group. Ngồi nhìn trần nhà.]
    ~ kt_ngu(5)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== ke_toan_1010_phong_bi ===
# ngay:10 # gio:15:00 # noi:choi_bao_ve # bat_buoc
_Chiều thứ 7. Bạn đứng trước két sắt sau bức tranh. Ba người khó nhất: {thuc_tap_sinh} (lương 4 triệu, phòng ghép 4 người), Bác {bac_bao_ve}, {idol_het_thoi} (nợ tiền nhà)._
_Rút từ quỹ đen, bỏ phong bì, trả đúng ngày. Hay để mọi người chờ tới thứ Hai._
* [🗄️ Rút 20 triệu, bỏ ba phong bì, đi phát tận tay.]
    ~ kt_phong_bi_1010 = true
    ~ kt_cat_ket(-20)
    _Chòi bảo vệ. Bác {bac_bao_ve} đang nghe radio. Bạn đặt phong bì lên bàn._
    bac_bao_ve: Lương về rồi à cháu?
    ke_toan: Dạ… ứng trước thôi bác. Thứ Hai có lương chính thức.
    _Bác nhìn phong bì. Tiền mặt, không phải chuyển khoản. Bác nhìn bạn. Bác không hỏi._
    { RANDOM(1, 10) <= 5:
        ~ kt_them_dau_vet(1)
        _Ở cửa chòi, {ran_doc} đi ngang, cầm ly trà đá. Liếc vào cái phong bì dày._
    }
    ~ qh("bac_bao_ve", 10)
    ~ qh("thuc_tap_sinh", 15)
    ~ qh("idol_het_thoi", 10)
    -> ke_toan_1010_sinh_nhat_bac
* [😶 Để mọi người chờ tới thứ Hai. Quỹ đen là cho ngày công ty sập.]
    ~ kt_ngu(5)
    _Bạn đóng két. Tối đó {thuc_tap_sinh} ăn mì gói, bạn đoán vậy. Bạn cũng ăn mì gói._
    ~ an(20)
    -> ke_toan_1010_sinh_nhat_bac
* [💸 Ứng tiền túi của chính mình cho ba người, mỗi người 2 triệu.]
    ~ tien_cong(-6000000)
    ~ qh("bac_bao_ve", 5)
    ~ qh("thuc_tap_sinh", 10)
    ~ qh("idol_het_thoi", 5)
    _Không động tới két. Không ai thấy gì lạ. Ví bạn thì thấy._
    -> ke_toan_1010_sinh_nhat_bac

=== ke_toan_1010_sinh_nhat_bac ===
_Trong hồ sơ nhân sự bạn giữ, ngày sinh của Bác {bac_bao_ve}: 10/10/1976. Hôm nay. Tròn 50 tuổi. Cả công ty không ai biết._
* [🎂 Ghé chòi bảo vệ, đặt lên bàn một hộp bánh bông lan nhỏ: "Chúc mừng sinh nhật bác."]
    ~ tien_cong(-60000)
    bac_bao_ve: *(nhìn hộp bánh rất lâu)* … Sao cháu biết?
    ke_toan: Con giữ hồ sơ mà bác.
    bac_bao_ve: Năm mươi tuổi. Cả công ty có hai người nhớ. Cháu, với một người nữa.
    _Bác không nói người kia là ai. {cho} ăn mất nửa hộp bánh._
    ~ qh("bac_bao_ve", 20)
    ~ qh("cho", 5)
* [😶 Không nói. Bác không thích ai biết.]
    _Bạn ghi vào sổ riêng: "10/10. Sinh nhật bác. Năm sau nhớ."_
- -> END

// ------------------------------------------------------------
=== ke_toan_1110_anh_hoi_nho ===
# ngay:11 # gio:20:00 # noi:nha_so_18
_Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {sieu_nhan_hong} đăng ảnh xóm Cây Me: một đám nhóc, một đứa đang khóc._
_Bạn lục album. Một tấm ảnh năm 7 tuổi: bạn ngồi bên bàn tính của bà ngoại, tay cầm bàn tính gảy, mặt rất nghiêm._
* [📸 Đăng ảnh, ghi: "Từ nhỏ đã biết hóa đơn quan trọng."]
    ~ qh("hong_hot", 5)
    ~ qh("chi_dai", 5)
    hong_hot: Ối dồi ôi chị {ke_toan} hồi nhỏ y chang bây giờ! Đáng yêu dữ!
    ~ cang_thang(-5)
    ~ follow(2000)
* [🩷 Bình luận dưới ảnh {sieu_nhan_hong}: "Dễ thương. Đứa nhỏ đang khóc là ai vậy anh?"]
    sieu_nhan_hong: *(trả lời sau 20 phút)* Ờm… anh hông nhớ nữa. Chắc là bị anh chọc. Hồi đó anh hư lắm.
    _Câu trả lời thật thà một cách lạ lùng, cho một siêu sao._
    ~ qh("sieu_nhan_hong", 5)
* [😶 Không đăng gì. Cất ảnh lại.]
    _Bạn để tấm ảnh trên bàn, cạnh cuốn sổ. Đứa bé 7 tuổi nhìn bạn. Nó chưa biết trang 47 là gì._
- -> END

// ------------------------------------------------------------
=== ke_toan_1210_bang_luong ===
# ngay:12 # gio:08:30 # noi:phong_ke_toan # bat_buoc
_Thứ Hai. 8:30 ngân hàng mở lệnh, nhưng chỉ cho chuyển từng đợt. 21 người. Group Zalo-lô đã bực từ thứ 7._
hong_hot: *(nhắn group)* Chị {ke_toan} ơi lương về chưa chị, em sắp ăn mì gói lần thứ 6 rồi.
sales: *(nhắn group)* Lương trễ mà sếp vẫn đi golf. Sao mà căng.
thuc_tap_sinh: *(nhắn group)* Dạ em không sao ạ. Em còn 4 gói mì ạ.
_Bạn nhìn cái tin của {thuc_tap_sinh}. Bốn gói mì. Bạn ghi con số đó vào lề bảng lương._
{ kt_phong_bi_1010:
    _Ba người khó nhất đã nhận phong bì từ thứ 7. Hôm nay bạn trừ lại phần đã ứng, ghi rõ từng dòng._
}
* [💸 Bắt đầu xếp lịch chuyển lương.]
    -> ke_toan_mg_bang_luong_mo_dau
* [📢 Nhắn trước group: "Lương về trong hôm nay. Ai kẹt nhất được trước. Chị xin lỗi mọi người."]
    ~ qh("hong_hot", 3)
    ~ qh("thuc_tap_sinh", 5)
    _Group im lặng một phút. Rồi {chi_dai} gửi một sticker cái ôm. Rồi {thuc_tap_sinh} gửi "Dạ"._
    -> ke_toan_mg_bang_luong_mo_dau
* [🧾 Nhắn riêng {giam_doc}: "Anh. Lương trễ là chuyện của anh. Anh tự nói với mọi người đi."]
    giam_doc: *(trả lời sau 5 phút)* … Ừ. Anh nói.
    _Mười phút sau, group công ty: "Lương về trễ là lỗi của anh, không phải của {ke_toan}. Anh xin lỗi." Lần đầu tiên sếp xin lỗi trên group._
    ~ qh("giam_doc", 5)
    ~ qh("hong_hot", 5)
    -> ke_toan_mg_bang_luong_mo_dau

// ------------------------------------------------------------
=== ke_toan_1210_noi_chuyen_voi_sep ===
# ngay:12 # gio:11:00 # noi:phong_giam_doc # bat_buoc
_Bạn đóng cửa phòng kính sau lưng, đặt xấp bảng lương lên bàn {giam_doc}._
ke_toan: Anh. Ngân hàng giữ lệnh hai ngày nay, nói là "kiểm tra giao dịch lớn". Mấy năm nay họ chưa soi bao giờ. Anh có chuyện gì với ngân hàng mà em không biết không?
giam_doc: *(nhìn ra cửa sổ rất lâu)* … Khoản thế chấp quá hạn rồi {ke_toan} ạ. Hạn cuối 15/11.
* [😮‍💨 "Em biết. Em làm sổ cho anh. Em chỉ muốn anh tự nói."]
    giam_doc: … Cảm ơn em. Mười năm rồi nhỉ.
    ~ qh("giam_doc", 10)
    ~ kt_ngu(-5)
* [🧾 "Vậy từ giờ tới 31/10, khoản chi nào trên 10 triệu, anh phải đưa em xem trước."]
    giam_doc: Anh không ép… À. Ừ. Anh đồng ý.
    ~ kt_keo(10)
    ~ qh("giam_doc", 3)
* [🗄️ "Anh… nếu công ty sập, em có để dành một khoản. Đủ trả mọi người một tháng."]
    { kt_quy_den >= 250:
        giam_doc: *(quay lại, nhìn bạn)* … Em nói gì?
        ke_toan: Em nói một lần thôi. Có sổ ghi tay từng đồng. Không phải bây giờ. Khi nào cần, em mở.
        _{giam_doc} ngồi xuống. Lần đầu tiên bạn thấy sếp không nói được tiếng Anh nào._
        giam_doc: Mười năm nay… có người lo cho mọi người hơn cả anh.
        ~ kt_tu_khai = true
        ~ kt_quy_den_lo = true
        ~ qh("giam_doc", 25)
        ~ kt_ngu(-15)
    - else:
        _Bạn định nói, rồi nhớ ra két chỉ còn {kt_quy_den} triệu. Chưa đủ để hứa với ai. Bạn im._
        ~ kt_ngu(5)
    }
- -> END

// ------------------------------------------------------------
=== ke_toan_1210_nu_hoang_luong_tre ===
# ngay:12 # gio:21:00 # noi:nha_so_18
_Tối. Lương đã về hết lúc 17:00. Trễ đúng 2 ngày. Group "Hội Anti Sếp" mà bạn không ở trong đó, nhưng ai cũng chụp màn hình gửi bạn._
_Ảnh 1: {hong_hot}: "Từ nay gọi chị {ke_toan} là Nữ Hoàng Lương Trễ nha mấy bà." 47 lượt thích._
_Ảnh 2: {con_ong_chau_cha} đăng story ở Sống Ảo: "Thẻ bị từ chối. Quê muốn độn thổ." Thẻ phụ đó gắn với tài khoản riêng của {giam_doc}. Bạn biết tài khoản đó đang 0 đồng._
_Ảnh 3: ai đó chụp lén {thuc_tap_sinh} ở quán cơm: một chiếc thẻ ngân hàng màu bạc, hạng kim cương, rơi ra bàn._
* [😶 Đọc hết. Không trả lời ai.]
    ~ kt_ngu(5)
    ~ cang_thang(10)
* [💬 Nhắn riêng {hong_hot}: "Chị nghe rồi nha. Lương trễ không phải lỗi chị, nhưng chị xin lỗi mọi người."]
    hong_hot: *(trả lời ngay)* Dạ… chị ơi em xin lỗi. Em giỡn quá trớn. Em xóa liền.
    ~ qh("hong_hot", 10)
* [🔍 Nhìn kỹ ảnh 3. Thẻ kim cương. Thực tập sinh lương 4 triệu.]
    ~ phat_hien(duy_tung_lam_ngan_hang)
    _Người có thẻ kim cương mà đi thực tập 4 triệu. Hoặc là đi lạc. Hoặc là đi tìm thứ gì đó tiền không mua được._
- -> END

// ------------------------------------------------------------
// Cảnh tự do: tối cuối tuần ở nhà số 18, cất thêm vào két.
=== ke_toan_tudo_cat_ket ===
# noi:nha_so_18 # gio:21:00 # ngau_nhien # dieu_kien:cuoi_tuan_va_chua_nop_quy_den
{ kt_quy_den_nop:
    _Két sau bức tranh trống trơn từ hôm nộp quỹ vào sổ chung. Bạn treo lại bức tranh. Thấy nhẹ._
    -> END
}
_Tối cuối tuần. Nhà số 18 yên ắng. Bức tranh phong cảnh trên tường hơi lệch, vì bạn vừa mở két hôm trước._
_Quỹ đen: {kt_quy_den} triệu. Mục tiêu: 297._
* [🗄️ Cất 5 triệu lương tuần này.]
    ~ kt_cat_ket(5)
    ~ tien_cong(-5000000)
    _Sổ ghi tay: "+5. Không đi cà phê Sống Ảo với {chi_dai} tuần này."_
    ~ kt_ngu(2)
* [🧾 Cất 3 triệu "tiết kiệm được" từ những khoản đã từ chối chi trong tuần.]
    ~ kt_cat_ket(3)
    _Tiền công ty để ngoài sổ. Bạn ghi từng khoản, từng ngày, từng lý do từ chối. Nếu ai thấy dòng này mà không đọc hết, bạn là kẻ biển thủ._
    { kt_huong_biet_quy_den && RANDOM(1, 10) <= 2:
        ~ kt_them_dau_vet(1)
        _Điện thoại rung. {chi_dai}: "Bà ở nhà hả? Tui ghé đưa ít trái cây." Chuông cửa reo ngay lúc két còn mở._
    }
* [😶 Không cất. Tuần này mua cho mình một đôi dép mới.]
    ~ tien_cong(-150000)
    ~ cang_thang(-10)
    _Dép mới êm. Bạn đi qua đi lại trong nhà ba vòng. Rồi dán nhãn vào đế dép._
- -> END
