// ============================================================
// BIÊN KỊCH: OÁNH · CHƯƠNG 1: "TRANG ĐẦU TIÊN" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== bien_kich_0110_gac_mai_sang ===
# ngay:1 # gio:07:30 # noi:gac_mai_so_7 # bat_buoc
_Gác mái số 7, Phố Cũ. Nắng xiên qua khung cửa sổ tròn, rơi đúng lên cái máy đánh chữ._
_Con mèo Bí nằm chễm chệ trên chồng bản thảo, nhìn bạn như nhìn một người chưa nộp bài._
bien_kich: Hôm nay công ty ký hợp đồng 5 tỷ. Một ngày lịch sử, Bí à. Lịch sử thì cần người chép.
_Bí ngáp. Bí không quan tâm lịch sử._
_Trên bàn là cuốn sổ bìa da, trang đầu còn trắng tinh. Bạn cầm lên, đặt xuống, rồi lại cầm lên._
* [✍️ Bỏ sổ vào túi. "Nhà văn không bao giờ ra đường tay không."]
    ~ nhan(so_tay_oanh)
    ~ bk_lo(5)
    ~ bk_cam(5)
    _Cuốn sổ nằm gọn trong túi vải. Nặng hơn bình thường một chút, như biết mình sắp chứa chuyện lớn._
* [🏠 Để sổ ở nhà. Hôm nay chỉ quan sát, tối về mới viết.]
    ~ bk_cam(-5)
    _Bạn cài cây bút máy mực hồng lên túi áo. Sổ thì ở nhà, nhưng tật ghi chép thì đi theo._
* [🐈 Vuốt mèo Bí ba cái cho may mắn.]
    ~ bk_vuot_meo = bk_vuot_meo + 1
    ~ bk_cam(10)
    ~ cang_thang(-5)
    _Bí kêu "meo" một tiếng, đúng kiểu nhà phê bình khó tính vừa gật đầu._
    _Bạn tiện tay bỏ luôn cuốn sổ vào túi. Thói quen mà._
    ~ nhan(so_tay_oanh)
    ~ bk_lo(5)
- _Bạn khóa cửa gác mái. Cầu thang gỗ kêu cót két 47 bậc. Hôm nay bạn đếm, cho có cảm hứng._
-> END

// ------------------------------------------------------------
=== bien_kich_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2 chật kín người. Trên bàn, xấp hợp đồng dày như cuốn tiểu thuyết bạn chưa viết xong._
giam_doc: Các em! Hôm nay là ngày lịch sử của {cong_ty}. Xin giới thiệu đối tác chiến lược: Siêu Nhân Hồng!
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
_Cửa phòng họp bật mở. Một người đeo kính đen bước vào, dù trong phòng không có nắng._
idol_het_thoi: Khoan! *(chỉ thẳng vào bộ đồ hồng)* Em biết anh là ai không?
sieu_nhan_hong: Dạ biết! Anh {idol_het_thoi} "Công Viên"! Em thuộc lòng luôn: "thích ăn chuối chiên"!
idol_het_thoi: …Ờ. Vậy thì tốt.
_{idol_het_thoi} đứng thêm ba giây, không biết làm gì tiếp, rồi ngồi xuống ghế cuối._
quan_ly_idol: *(nói nhỏ vào điện thoại)* Không, không có gì đâu, ảnh chỉ… chào hỏi thôi.
_Ở đầu bàn, {ke_toan} cúi sát tai {giam_doc}, thì thầm gì đó về "trang 47". {giam_doc} xua tay, cầm bút ký luôn._
_Tay bạn tự mò vào túi. Chương 1 của tiểu thuyết vừa tự viết ra trước mắt._
* {co(so_tay_oanh)} [✍️ Mở sổ bìa da, ghi lại hết. Tên thật, câu thoại thật.]
    ~ bk_lo(10)
    ~ bk_cam(15)
    ~ bk_trang(3)
    _"Chương 1. Người đàn ông đeo kính đen hỏi: Em biết anh là ai không? Và cả phòng im lặng, vì ai cũng biết, chỉ là không ai còn quan tâm."_
    _Bạn đọc lại câu đó. Hay. Hay tới mức hơi ác._
* {co(so_tay_oanh)} [🖋️ Ghi lại, nhưng đổi tên hết: "Ca sĩ P.", "Giám đốc T."]
    ~ bk_lo(3)
    ~ bk_cam(5)
    ~ bk_trang(2)
    _Đổi tên thì mất hồn một chút. Nhưng hồn còn thì người còn đi làm được._
* [🤝 Đứng dậy kéo ghế cho {idol_het_thoi}: "Anh {idol_het_thoi} ngồi đây nè, gần sếp cho dễ nghe."]
    ~ qh("idol_het_thoi", 10)
    ~ qh("quan_ly_idol", 5)
    idol_het_thoi: *(chỉnh kính)* Em biết điều đó. Ghế này mới xứng.
    quan_ly_idol: *(nhìn bạn, gật nhẹ)* Cảm ơn em.
    _Bạn không viết gì cả. Nhưng câu "ghế này mới xứng" thì bạn nhớ tới chết._
    ~ bk_cam(5)
* [💬 Nghiêng người hỏi {ke_toan}: "Trang 47 là sao chị?"]
    ke_toan: *(nhìn bạn rất lâu)* Không có hóa đơn thì không có câu trả lời, em.
    _Câu đó chẳng hợp ngữ cảnh gì cả. Chính vì vậy mà bạn thấy sợ._
    ~ bk_cam(5)
    ~ qh("ke_toan", -3)
- _{giam_doc} giơ cao bản hợp đồng đã ký. 5 tỷ về tài khoản. Cả phòng vỗ tay như giải phóng._
giam_doc: Từ hôm nay, mỗi người phải sống như một giọt mực hồng trong bức tranh lớn nhé!
_Câu này không phải của bạn viết. Nhưng nghe quen. Rất quen. Hình như bạn viết cho sếp hồi Tết năm ngoái._
-> END

// ------------------------------------------------------------
=== bien_kich_0110_mung_bac_binh ===
# ngay:1 # gio:15:00 # noi:pantry
_Pantry tầng 1. Cả công ty ăn mừng bằng trà sữa. Máy pha cà phê treo tờ giấy: "HỎNG. ĐỪNG ĐẬP."_
_Hôm nay là Ngày Quốc tế Người cao tuổi. {chi_dai} đẩy bác {bac_bao_ve} vào giữa phòng. Bác đỏ mặt như trái gấc._
chi_dai: {bien_kich}! Em là nhà văn, viết giùm chị câu chúc lên thiệp cho bác. Ngắn thôi, mà phải làm bác khóc.
bac_bao_ve: Thôi… bác già rồi, các cháu bày vẽ làm gì.
_Bạn cầm cây bút máy mực hồng. Tờ thiệp trắng nhìn bạn, chờ đợi._
* [💡 Viết thật lòng, từ những gì mình tự thấy mỗi sáng ở cổng.]
    ~ bk_that(5)
    ~ qh("bac_bao_ve", 10)
    ~ qh("chi_dai", 5)
    _"Gửi bác {bac_bao_ve}: sáng nào bác cũng mở cổng trước khi tụi con kịp nhớ là mình đi trễ. Cảm ơn bác đã giữ cửa cho cả nhà."_
    chi_dai: Ờ… *(sụt sịt)* Chị nói làm bác khóc chứ có kêu làm chị khóc đâu.
    bac_bao_ve: *(đọc xong, gấp thiệp bỏ túi áo)* Ừ. Bác cảm ơn cháu.
* [📎 "Tham khảo" một câu trên tờ lịch treo tường của pantry.]
    ~ bk_muon(5)
    _"Tuổi già như ánh hoàng hôn, càng về chiều càng rực rỡ." (Lịch Vạn Sự, trang ngày 1/10.)_
    hong_hot: Ủa câu này tui đọc ở đâu rồi á… À, cái lịch sau lưng bà kìa!
    _Cả pantry cười. Bác {bac_bao_ve} cũng cười, nhưng chỉ để mọi người đỡ ngại._
    ~ qh("hong_hot", 3)
    ~ cang_thang(5)
* [💬 Hỏi bác trước: "Bác nhớ ngày đầu tiên của công ty hông bác?"]
    bac_bao_ve: Nhớ chứ. Năm ấy công ty có một phòng 20 mét vuông. Bác ngồi gác cái cửa, chẳng có gì để trộm.
    bac_bao_ve: Thế mà người ta vẫn bảo bác gác cho cẩn thận. bảo là "cái quý nhất ở trong ấy là con người".
    _Bạn định hỏi "người ta" là ai. Bác {bac_bao_ve} đã quay sang uống trà sữa, như chưa nói gì._
    ~ bk_that(5)
    ~ bk_cam(10)
    ~ qh("bac_bao_ve", 5)
- thuc_tap_sinh: *(chạy vào, thở hồng hộc, tay ôm 6 ly cà phê)* Dạ máy hỏng nên em chạy ra quán mua cho cả phòng ạ! Chị {bien_kich}, ly của chị nè!
* [😇 "Anh {thuc_tap_sinh} ơi, em gửi tiền nha. Đừng bao hoài vậy."]
    ~ tien_cong(-35000)
    ~ qh("thuc_tap_sinh", 5)
    thuc_tap_sinh: Dạ thôi chị! Em… em mời mà. Chị đừng gọi em bằng anh, em ngại lắm ạ.
* [☕ Nhận ly cà phê, cười cảm ơn.]
    ~ qh("thuc_tap_sinh", 2)
- ~ uong(20)
~ nghi(25)
-> END

// ------------------------------------------------------------
=== bien_kich_0110_dem_go_may ===
# ngay:1 # gio:22:00 # noi:gac_mai_so_7
_22 giờ. Gác mái. Cái máy đánh chữ chờ bạn như chờ người yêu đi làm về._
_Điện thoại rung: {giam_doc} nhắn group: "Hôm nay các em làm anh tự hào. Mai 8h đúng nhé. Anh không ép."_
_Bạn úp điện thoại xuống. Lạch cạch. Lạch cạch._
* [⌨️ Gõ thẳng tay: "Chương 1: Ngày Năm Tỷ". Tên thật hết.]
    ~ bk_trang(8)
    ~ bk_cam(5)
    ~ bk_lo(5)
    _Tám trang. Câu nào cũng sống. Vì nhân vật nào cũng là người thật, ngồi cách bạn có hai cái bàn._
* [🖋️ Gõ, nhưng đặt tên giả từ đầu: "Công ty X, giám đốc Th."]
    ~ bk_trang(5)
    ~ bk_cam(-5)
    _Năm trang. Giám đốc Th. nghe như một con robot. Nhưng mà an toàn._
* [🐈 Bí nhảy lên bàn phím. Bạn để yên cho nó nằm.]
    ~ bk_vuot_meo = bk_vuot_meo + 1
    ~ cang_thang(-10)
    ~ bk_cam(5)
    _Trang giấy hiện ra dòng chữ "jjjjjjjjjjkkkk". Bạn giữ lại. Biết đâu đó là chủ nghĩa hiện đại._
    ~ bk_trang(2)
- _Bí cuộn tròn trên đống giấy. Ngoài cửa sổ, Phố Cũ đã tắt đèn. Bạn ghi vào lề trang: "Để đó, sửa sau."_
~ nghi(-10)
-> END

// ------------------------------------------------------------
=== bien_kich_0210_hop_chien_dich ===
# ngay:2 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Phòng họp "Sáng Tạo". Trên bảng trắng: "HỒNG HÓA VIỆT NAM: 1.000.000 NGƯỜI THEO DÕI TRƯỚC 31/10"._
truong_phong: Mình sync nhanh 5 phút thôi nhé. Mỗi người một ý tưởng cho Siêu Nhân Hồng.
sales: Chị có tin nóng! Tập đoàn Bánh Tráng Trộn Toàn Cầu, BTT Global, chủ tịch Mr. Kevin Trộn, hứa ba nhà tài trợ, tổng 2 tỷ. Tin chị đi, chắc kèo!
ke_toan: Hợp đồng đâu em?
sales: Đang trên đường tới ạ.
_Năm phút thành bốn mươi phút. Rồi tới lượt người ngồi cuối bàn, tay vẫn cầm cây bút bi của công ty._
thuc_tap_sinh: Dạ… em mới vô nên chưa biết ạ. Mà em có ý tưởng: một người hùng mặc đồ hồng, giúp người ta xong rồi đi mất, không ai biết tên ạ.
_Cả phòng im một giây. Một giây rất đẹp. Bạn nghe tim mình đập đúng nhịp của một câu mở đầu hay._
truong_phong: Ừ, cái này mình take note lại nhé. Giờ mình sang mục tiếp theo, 5 phút thôi.
* [📎 Ghi lại từng chữ vào sổ, không nói gì.]
    ~ bk_muon(20)
    ~ bk_mo_nhanh_nguoi_hung = true
    ~ bk_ghi_chu_y_tuong_duy = true
    _Theo thói quen, bạn ghi đầu trang: "Ý tưởng của {thuc_tap_sinh} (2/10)". Rồi bên dưới, chép đủ từng chữ._
    _Bạn gạch chân chữ "không ai biết tên". Ba lần._
* [🙇 "Anh {truong_phong}, em thấy ý của anh {thuc_tap_sinh} hay đó. Cho em với ảnh viết chung nha."]
    ~ bk_that(5)
    ~ qh("thuc_tap_sinh", 20)
    ~ bk_mo_nhanh_nguoi_hung = true
    ~ bk_dong_tac_gia_som = true
    ~ bk_ghi_chu_y_tuong_duy = true
    thuc_tap_sinh: Dạ chị… chị gọi em bằng anh làm em ngại quá ạ.
    truong_phong: Ừ, thế cũng được. Hai người tự sync với nhau nhé, đừng chiếm phòng họp.
    chi_dai: *(gật đầu với bạn từ cuối phòng)* Được đó.
    ~ qh("chi_dai", 5)
* [😏 "Ý tưởng này hơi cũ. Siêu nhân nào chẳng giúp người."]
    ~ bk_cam(-5)
    ~ bk_noi_cau_cu = true
    ~ qh("thuc_tap_sinh", -10)
    _{thuc_tap_sinh} cúi đầu, ghi chép tiếp vào cuốn sổ nhỏ. Không ai thấy, trừ bạn._
    _Nhưng mấy chữ "không ai biết tên" cứ lơ lửng trong đầu bạn suốt buổi họp._
* [💬 Họp xong, kéo {thuc_tap_sinh} ra hành lang: "Anh kể thêm em nghe được hông?"]
    ~ bk_mo_nhanh_nguoi_hung = true
    ~ bk_ghi_chu_y_tuong_duy = true
    ~ bk_muon(10)
    ~ qh("thuc_tap_sinh", 10)
    thuc_tap_sinh: Dạ! Dạ là… em có kể chị hồi tháng 9 rồi á, cái "Người Gác Két". Một anh nhân viên ngân hàng bỏ việc, đi làm siêu nhân.
    thuc_tap_sinh: Ảnh không cần ai nhớ tên. Ảnh chỉ cần… lúc người ta kẹt, có người tới.
    _Bạn ghi lại. Kín hai trang. Đầu trang ghi: "Ý tưởng của {thuc_tap_sinh} (2/10)"._
- ~ phat_hien(nguoi_gac_ket)
truong_phong: À, {bien_kich} note lại biên bản cuộc họp giúp anh nhé.
~ cang_thang(10)
_Bạn nhìn cuốn sổ. Trang này giờ có hai thứ: biên bản họp của {truong_phong}, và một ý tưởng không phải của bạn._
-> END

// ------------------------------------------------------------
=== bien_kich_0210_tra_sua_thu_6 ===
# ngay:2 # gio:15:00 # noi:pantry
_Trà sữa thứ 6 từ quỹ phạt đi trễ. Hôm nay là Ngày Nụ cười Thế giới, sáng nay {hr} bắt mọi người cười vào máy chấm công._
hr: *(đi ngang, cười)* {bien_kich} cười đẹp lắm. Hơi giống đang nghĩ ra cách hại ai đó, nhưng đẹp.
_{thuc_tap_sinh} đặt ly trà sữa trân châu đường đen trước mặt bạn, ngồi xuống ghế đối diện, hai tay đặt lên đùi như đi phỏng vấn._
thuc_tap_sinh: Chị {bien_kich}… chị còn nhớ cái ý tưởng em kể chị hồi tháng 9 hông ạ? Cái "Người Gác Két" á.
_Ở góc pantry, {hong_hot} đang hút trà sữa rất chậm. Rất, rất chậm._
* [😇 "Nhớ chứ. Hay lắm. Để chị tính cách nào cho anh có tên trong đó."]
    ~ qh("thuc_tap_sinh", 10)
    ~ bk_that(3)
    thuc_tap_sinh: Dạ… dạ thiệt hả chị? Em… em cảm ơn chị ạ!
    _Anh ấy cười như thằng nhỏ được phát kẹo. Bạn uống một ngụm trà sữa. Đường đen hơi đắng._
* [📎 "Tháng 9 hả? Nhiều người kể chị nghe ý tưởng lắm, chị hông nhớ hết."]
    ~ bk_muon(5)
    ~ qh("thuc_tap_sinh", -10)
    thuc_tap_sinh: Dạ… dạ cũng phải ạ. Chị bận mà.
    hong_hot: *(hút rột một tiếng)* Ối dồi ôi, trà sữa hôm nay ngọt ghê.
    ~ cang_thang(5)
* [💬 "Mà anh làm ngân hàng hả? Sao biết rõ vậy?"]
    thuc_tap_sinh: Dạ… em… em đọc sách thôi ạ! Em mới vô nên chưa biết ạ!
    _Anh ấy đứng dậy đi rửa ly. Ly còn đầy trà sữa._
    ~ bk_cam(5)
    ~ bk_that(2)
- _Bạn mở sổ ra, rồi lại đóng vào. Có những trang viết lúc người ta đang nhìn thì không viết được._
~ uong(30)
~ cang_thang(-10)
-> END

// ------------------------------------------------------------
=== bien_kich_0310_ca_phe_pho_cu ===
# ngay:3 # gio:09:30 # noi:cho_pho_cu
_Thứ 7. Chợ Phố Cũ. Bạn ngồi ở quán cà phê muối đầu chợ, cái bàn nhựa nhỏ xíu, ly cà phê mặn mặn ngọt ngọt._
_Ở sạp rau bên kia, {ke_toan} và {chi_dai} đang trả giá bó rau muống như đàm phán hợp đồng 5 tỷ._
ke_toan: Hai chục một bó thì có hóa đơn không cô?
chi_dai: Thôi bà ơi. *(quay sang cô bán rau)* Cô lấy con mười tám, con lấy năm bó. Hồi trẻ con đổ cả tô ốc lên đầu người ta, cô cũng biết đó.
_Cô bán rau run tay, đưa luôn năm bó rau giá mười tám._
* [👂 Nghe Để Viết: rút sổ ghi lại "chị đổ tô ốc lên đầu người ta".]
    ~ bk_cam(10)
    { RANDOM(1, 10) <= 4:
        chi_dai: *(quay phắt lại)* {bien_kich}! Em ngồi đó ghi cái gì vậy?
        bien_kich: Dạ… em ghi giá rau! Để… để biết chợ nào rẻ!
        chi_dai: Ờ. Mười tám một bó. Ghi cho đúng.
        ~ bk_lo(10)
        ~ qh("chi_dai", -5)
    - else:
        _Không ai thấy. Câu "đổ tô ốc lên đầu người ta" nằm gọn trong sổ, kèm ba dấu chấm than._
        ~ bk_trang(2)
    }
* [😇 Bưng ly cà phê qua chào: "Hai chị đi chợ sớm vậy!"]
    ~ qh("chi_dai", 5)
    ~ qh("ke_toan", 5)
    chi_dai: Ờ, {bien_kich}. Ăn sáng chưa? Lát qua nhà chị ăn cơm.
    ke_toan: Cà phê muối ba chục một ly đó em. Uống từ từ.
    ke_toan: *(nhỏ giọng)* Mà quỹ phạt đi trễ tháng này dư dữ lắm. {chua_te_deadline} góp một mình nửa quỹ.
    ~ bk_biet_quy_tra_sua = true
    ~ bk_that(3)
    ~ an(20)
* [🛕 Đi bộ lên Chùa Phố Cũ ngồi một lúc cho yên.]
    ~ cang_thang(-20)
    ~ bk_cam(5)
    ~ bk_that(5)
    _Tiếng chuông chùa. Tiếng chim. Không có tiếng {truong_phong} nói "5 phút thôi"._
    _Bạn nghĩ ra một câu cho phim: "Người hùng thật thì không cần ai nhớ tên. Chỉ cần nhớ là đã có người tới." Câu này là của bạn. Bạn chắc vậy._
- ~ uong(20)
~ tien_cong(-30000)
-> END

// ------------------------------------------------------------
=== bien_kich_0410_bi_gap_tuat ===
# ngay:4 # gio:10:00 # noi:cong_cong_ty
_Chủ nhật, Ngày Động vật Thế giới. Bạn ôm lồng mèo tới công ty "cho Bí gặp {cho}". Cổng mở, có tiếng nước xối._
_{chi_dai} đang tắm cho {cho}. {cho} đứng im, nhưng ánh mắt nói rõ là đang lên kế hoạch trả thù cả thế giới._
chi_dai: Đứng yên! Mai đội nơ hồng là đẹp trai nhất quận!
_Bạn đặt lồng xuống. Bí và {cho} nhìn nhau. Mười giây. Hai mươi giây. Ba mươi giây._
_{cho} lùi lại một bước._
cho: …Ẳng.
bac_bao_ve: Thế à. Đời nó chưa lùi ai bao giờ đâu đấy.
_Đúng lúc đó, chiếc xe hồng đỗ xịch trước cổng. {sieu_nhan_hong} nhảy xuống, giả tiếng sủa._
sieu_nhan_hong: Gâu gâu! {cho} ơi, anh tới chơi nè! Gét gô!
_{cho} lao tới, ngoạm một chiếc găng tay hồng rồi chạy thẳng vào gầm cầu thang._
sieu_nhan_hong: Ê ê! Găng tay của anh! Cái đó đặt riêng đó {cho} ơi!
* {co(so_tay_oanh)} [✍️ Ghi lại: "Chương 2. Con chó lùi trước con mèo, rồi tiến trước siêu nhân."]
    ~ bk_cam(15)
    ~ bk_trang(4)
    ~ bk_lo(5)
    ~ bk_that(5)
    _Câu này hay. Và là của bạn, từ đầu tới cuối. Bạn chụp ảnh trang giấy, gửi cho chính mình, để nhớ cảm giác này._
* [🌭 Đi mua xúc xích dỗ {cho} cho đỡ quê.]
    ~ tien_cong(-15000)
    ~ qh("cho", 15)
    ~ qh("bac_bao_ve", 5)
    cho: Gâu! *(vẫy đuôi, nhưng vẫn ngồi chắn cửa gầm cầu thang)*
    bac_bao_ve: Cháu tốt bụng đấy. Nhưng cái găng ấy thì bác chịu, nó giấu rồi là thôi.
* [🤝 Bò vào gầm cầu thang giúp {sieu_nhan_hong} lấy lại găng tay.]
    cho: Grừ…
    ~ qh("cho", -10)
    ~ qh("sieu_nhan_hong", 5)
    sieu_nhan_hong: Thôi thôi em ơi, để nó giữ. Coi như anh tặng. *(nhỏ giọng)* Mà em nhớ đừng nói ai nha, cái con gà cao su của nó… anh giấu sau tủ mạng.
    _Một siêu nhân vừa thú nhận giấu đồ chơi của chó. Bạn thấy đây là chất liệu tốt nhất tuần._
    ~ bk_cam(10)
- _Bí trong lồng liếm chân, mắt lim dim, như vừa thắng một trận không cần đánh._
~ bk_vuot_meo = bk_vuot_meo + 1
-> END
