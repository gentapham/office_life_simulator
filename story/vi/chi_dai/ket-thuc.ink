// ============================================================
// CHỊ ĐẠI: HƯƠNG · ĐÁNH GIÁ & 6 KẾT THÚC
// Game gọi cảnh đánh giá sau Đại Nhạc Hội Siêu Nhân (23:00 – 23:45 ngày 31/10),
// khi ket_thuc_su_nghiep và chung_cong_ty_song đã chốt.
// Thứ tự xét (docs/so-tay-su-that.md mục 12):
//   Bí mật: Tô Ốc Thứ Hai        (nhận ra Lưu Lực, ép LL rút lời mời, Tiến Độ ≥ 70)
//   Vui:    Nữ Hoàng Sự Kiện     (Tiến Độ ≥ 90, Uy Lực ≥ 80, Siêu Sao Hạng A)
//           Không Ai Bị Gạch Tên (không ai bị đuổi, công ty sống, Đàn Em ≥ 3)
//   Buồn:   Clip Chị Đại         (nổ Nộ Khí trước máy quay)
//           Show Toang           (Tiến Độ < 50)
//           Một Mình Gánh Team   (còn lại)
// Ba kết thúc vui đều đòi chưa nổ Nộ Khí trên sóng.
// ============================================================

=== chi_dai_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # dieu_kien:sau_dem_hong
{
- cd_nhan_ra_ll && cd_ep_ll_rut && cd_tien_do >= 70 && not cd_no_tren_song:
    ~ chot_ket_thuc("to_oc_thu_hai")
    -> chi_dai_kt_to_oc_thu_hai
- cd_tien_do >= 90 && cd_uy_luc >= 80 && ket_thuc_su_nghiep == "sieu_sao_hang_a" && not cd_no_tren_song:
    ~ chot_ket_thuc("nu_hoang_su_kien")
    -> chi_dai_kt_nu_hoang_su_kien
- cd_khong_ai_bi_duoi && chung_cong_ty_song && cd_dan_em >= 3 && cd_tien_do >= 50 && not cd_no_tren_song:
    ~ chot_ket_thuc("khong_ai_bi_gach_ten")
    -> chi_dai_kt_khong_ai_bi_gach_ten
- cd_no_tren_song:
    ~ chot_ket_thuc("clip_chi_dai")
    -> chi_dai_kt_clip_chi_dai
- cd_tien_do < 50:
    ~ chot_ket_thuc("show_toang")
    -> chi_dai_kt_show_toang
- else:
    ~ chot_ket_thuc("mot_minh_ganh_team")
    -> chi_dai_kt_mot_minh_ganh_team
}

// ------------------------------------------------------------
// 😄 🦁 NỮ HOÀNG SỰ KIỆN
// ------------------------------------------------------------
=== chi_dai_kt_nu_hoang_su_kien ===
# ket_thuc:nu_hoang_su_kien # loai:co_hau
_Đại Nhạc Hội Siêu Nhân hoàn hảo. Một triệu người theo dõi. Top 10 xu hướng. Không một bóng đèn chập, không một tiếng loa rè, không một vết kem trên mũ._
_{cho} ngồi đúng chỗ của {cho}. {sieu_nhan_hong} đi đúng lối của {sieu_nhan_hong}. Hai con đường không gặp nhau một lần nào._
_Sáng 1/11. Phòng giám đốc. {giam_doc} tự đứng dậy, tự kéo ghế, và lần này tự pha trà, không gọi ai._
giam_doc: {chi_dai}. Anh nghĩ suốt đêm qua. Ghế Phó Giám đốc. Anh muốn em ngồi.
_Ngoài vách kính, {truong_phong} đứng hình. {con_ong_chau_cha} thở phào._
chi_dai: Em không ngồi ghế đó.
giam_doc: Ơ… sao thế em?
chi_dai: Ngồi ghế đó thì em phải họp. Em mà họp thì ai đứng cánh gà?
chi_dai: Sếp tăng lương 20% cho cả team sự kiện đi. Đứa nào cũng chạy cả tháng. Thằng {thuc_tap_sinh} điều phối cả công ty bằng bộ đàm đó sếp.
_{giam_doc} nhìn bạn. Mở miệng định nói "anh không ép, tùy em". Rồi ngậm lại._
giam_doc: …Được. 20%. Anh ký ngay.
_Anh ký. Không dám cãi. Không dám "review lại"._
_Bạn đẩy cửa bước ra. Ngoài hành lang, cả team sự kiện đứng chờ: {it}, {thuc_tap_sinh}, mấy anh thợ đèn, hai cậu bốc vác. Ai cũng cầm bộ đàm._
_Bạn chưa kịp nói gì. Cả hàng bấm bộ đàm cùng lúc. Tiếng rè rè vang khắp tầng 2:_
thuc_tap_sinh: Rõ, chị Đại.
it: Rõ, chị Đại.
_Hành lang cười rộ. Bạn quay mặt đi, giả vờ chỉnh lại cái bộ đàm bên hông. Không ai thấy chị Đại khóc. Không ai dám thấy._
_Tối đó, tấm bằng "Doanh nhận của năm" sau ghế giám đốc được tháo xuống. Thay vào là tấm ảnh chụp sân khấu Đại Nhạc Hội Siêu Nhân, cái cột điện quấn đèn hồng sáng rực ở giữa._
_Dưới ảnh, ai đó lấy bút dạ ghi một dòng nhỏ: "Do chị đứng."_
-> END

// ------------------------------------------------------------
// 😄 🛡️ KHÔNG AI BỊ GẠCH TÊN
// ------------------------------------------------------------
=== chi_dai_kt_khong_ai_bi_gach_ten ===
# ket_thuc:khong_ai_bi_gach_ten # loai:co_hau
_Sáng 1/11. Bàn làm việc của bạn trong kho sự kiện. {hr} bước vào, tay cầm tập hồ sơ màu hồng. Tập hồ sơ cả tháng nay ai cũng sợ._
_{hr} đặt nó lên bàn trước mặt bạn. Không cười. Lần đầu tiên bạn thấy {hr} không cười._
hr: Anh không đọc nữa.
_Bạn mở ra. Bảy dòng. Dòng một: {thuc_tap_sinh}. Dòng hai: {thanh_xin_nghi}. Trang hai, chữ của sếp: "Người cuối cùng: {hr}."_
chi_dai: Ông giữ nó cả tháng để làm gì?
hr: Để có người xé. Anh không tự xé được. Nghề nhân sự nó vậy.
_Bạn xé đôi. Rồi xé tư. Rồi đưa cho {hr} một nửa, để ông xé nốt._
_{hr} xé. Tay hơi run. Rồi bật cười, cười thật, không phải nụ cười làm người ta sợ._
_Tối đó, Nhà số 45 chật kín. Không ai được mời. Ai cũng tự tới. Ai cũng mang một món._
_{thuc_tap_sinh} mang một thùng mì gói "để dự trữ cho chị". {ke_toan} mang hộp bánh pía, kèm hóa đơn. {thanh_xin_nghi} mang một con gà luộc, "gà nhà bà ngoại nuôi"._
_Bác {bac_bao_ve} mang ấm trà cũ sứt vòi. Và {hr} mang… 40 loại trà, sắp theo bảng chữ cái._
bac_bao_ve: Đông thế này thì bàn 8 ghế không đủ đâu cháu.
chi_dai: Thì ngồi đất. Nhà chị ngồi đất quen rồi.
_Cả đám ngồi bệt dưới sân, quanh cái bao cát. {thanh_xin_nghi} hát một bài, giọng hay tới mức hàng xóm mở cửa sổ ra nghe._
_Dưới gầm bàn, {cho} nằm ăn sạch xương gà, đuôi đập lộp độp xuống nền gạch._
thuc_tap_sinh: Chị ơi… em được ở lại thật hả chị?
chi_dai: Thật. Đứa nào làm em khóc, chỉ mặt chị. Mà đứa nào làm em mất việc, cũng chỉ mặt chị.
_Bạn nâng ly trà đá. Cả sân nâng theo. Không ai nói câu chúc nào. Không cần._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: TÔ ỐC THỨ HAI
// ------------------------------------------------------------
=== chi_dai_kt_to_oc_thu_hai ===
# ket_thuc:to_oc_thu_hai # loai:co_hau # bi_mat
_Đại Nhạc Hội Siêu Nhân chạy trọn vẹn. {sieu_nhan_hong} ở lại {cong_ty}. Không có phong bì xanh lá chuối nào tới tay cậu ấy cả. Chỉ bạn biết vì sao._
_Hôm sau. Quán Ốc Đêm. Bàn số 7, đúng cái bàn năm bạn 20 tuổi. Bạn đặt trước, ngồi trước, gọi trước một ấm trà đá._
_Bảy giờ tối. Một chiếc xe xanh lá chuối đậu xa quán đúng 50 mét. Lưu Lực đi bộ vào, vest trắng, tóc vuốt keo, mắt nhìn quanh như người đi qua bãi mìn._
luu_luc: Chị {chi_dai}. Chị hẹn tôi… nói chuyện làm ăn?
chi_dai: Ngồi đi.
_Lưu Lực kéo ghế ra. Ngồi cách bạn đúng 2 mét. Chủ quán nhìn cảnh này, lặng lẽ cất hết tô ốc vào trong bếp._
_Bạn đẩy qua một tờ giấy viết tay. "Cam kết: LL-Entertainment không câu người của {cong_ty} trong vòng 10 năm."_
luu_luc: Mười năm? Chị biết mười năm là bao lâu không?
chi_dai: Biết. Bằng từ lúc anh đội tô ốc tới giờ.
_Lưu Lực nhìn tờ giấy. Nhìn bạn. Nhìn bàn tay bạn đặt hờ trên mặt bàn. Rồi rút cây bút vàng trong túi vest ra. Ký._
luu_luc: *(thở ra, như vừa trả xong một món nợ)* Tám năm nay tôi đi đâu cũng nhìn quanh xem có chị không.
chi_dai: Giờ khỏi nhìn. Có giấy rồi.
_Bạn giơ tay gọi chủ quán: "Cho một tô ốc len xào dừa."_
_Lưu Lực tái mặt. Bàn tay theo phản xạ đưa lên che đầu._
_Tô ốc được mang ra, bốc khói, thơm nước cốt dừa. Bạn đẩy nó về phía hắn. Chậm rãi. Không làm đổ một giọt._
chi_dai: Ăn đi. Lần này để ăn thôi.
_Lưu Lực nhìn tô ốc rất lâu. Rồi cầm cây tăm. Rồi ăn con ốc đầu tiên. Rồi con thứ hai._
luu_luc: *(miệng đầy ốc)* …Ngon thật.
chi_dai: Quán này ngon từ 10 năm trước. Tại anh không chịu ăn.
_Hai người ngồi đó, cách nhau 2 mét, ăn hết một tô ốc. Cả Quận Hóng sẽ kể chuyện này thêm mười năm nữa._
-> END

// ------------------------------------------------------------
// 😢 🔥 CLIP CHỊ ĐẠI
// ------------------------------------------------------------
=== chi_dai_kt_clip_chi_dai ===
# ket_thuc:clip_chi_dai # loai:buon
_Clip dài 14 giây. Bạn lật bàn. Ly bay. Bánh bay. Giọng bạn vang lên, rõ từng chữ, trên sóng._
_Ba giờ sau, clip có 1 triệu lượt xem. Sáng hôm sau, 5 triệu. Nhiều hơn mọi video của {sieu_nhan_hong} cộng lại._
_Người ta ghép nhạc. Người ta làm meme. Người ta làm filter "Mặt Chị Đại Lật Bàn". Trẻ con ở Hẻm 69 chơi trò "chị Đại" bằng bàn nhựa._
_Nhà tài trợ gọi tới. Rồi gọi đi. Bình luận trên trang {cong_ty} toàn một câu: "Công ty gì mà nhân viên lật bàn?"_
_{giam_doc} không nói gì với bạn. Anh chỉ đứng ở cửa kho sự kiện một lúc, rồi quay đi._
_Ba ngày sau. 9 giờ sáng. Điện thoại bạn rung. Một tin nhắn của {hr}:_
hr: Em rảnh không, lên phòng anh uống trà xíu.
_Phòng HR. Kệ trà 40 loại. {hr} pha trà ô long, rót cho bạn, rót cho mình. Ngồi xuống._
hr: Anh chỉ muốn lắng nghe em thôi.
_Câu này bạn đã nghe {hr} nói với hàng chục người. Lần nào bạn cũng đứng ngoài cửa, chờ người đó đi ra, rồi đi vào nói: "Ông làm gì thằng nhỏ vậy?"_
_Lần này không có ai đứng ngoài cửa._
hr: Công ty chịu áp lực lớn quá em ạ. Anh… anh không muốn làm việc này đâu.
_Bạn mở miệng. Rồi ngậm lại. Lần đầu tiên trong đời, chị Đại ngồi nghe mà không nói được câu nào._
_Bạn nhìn xuống ly trà. Ly trà rung nhẹ. Không phải vì bạn đập bàn. Vì tay bạn đang run._
_Lúc bước ra, bạn đi ngang chòi bảo vệ. {cho} ngóc đầu dậy, đi theo bạn tới tận đầu hẻm, rồi ngồi xuống, nhìn theo._
_Trên điện thoại, clip vẫn đang chạy. Lượt xem: 5.214.006. Và vẫn đang tăng._
-> END

// ------------------------------------------------------------
// 😢 🎭 SHOW TOANG
// ------------------------------------------------------------
=== chi_dai_kt_show_toang ===
# ket_thuc:show_toang # loai:buon
_20:00. Sân khấu Đại Nhạc Hội Siêu Nhân. Cả nghìn khán giả. Truyền hình trực tiếp._
_Giàn đèn bên trái chập. Một tiếng "bụp", rồi khói. Nửa sân khấu tối om._
_Loa rè. Câu chào của MC biến thành tiếng ong vò vẽ. MC đi lạc ra phía bãi giữ xe, cầm micro hỏi đường bảo vệ._
_Rồi {cho} lên sân khấu. Trước {sieu_nhan_hong}. Đứng giữa ánh đèn duy nhất còn sáng, ngậm chiếc găng tay hồng, nhìn khán giả._
_Khán giả cười. Không phải kiểu cười bạn muốn._
_Bạn đứng sau cánh gà, gào vào bộ đàm: "Đèn phụ! Loa dự phòng! Ai giữ {cho}!"_
_Bên kia chỉ có tiếng rè. Rè. Rè. Như tiếng ếch ở bãi đất trống ngày 14/10._
_{sieu_nhan_hong} vẫn bước ra. Vẫn hát. Hát trong nửa bóng tối, trên cái loa rè, với {cho} đứng sủa ở góc. Cậu ấy hát tới hết bài. Bạn không biết nên khóc vì thương hay vì xấu hổ._
_23:00. Bãi đất vắng. Ai về nhà nấy. Không ai trách bạn. Không ai nói gì với bạn. Đó là điều tệ nhất._
_Bạn về Nhà số 45. Không bật đèn. Ra sân. Quấn băng tay._
_Bịch. Bịch. Bịch._
_Hàng xóm không nói "nghe đã quá con" như mọi khi. Hàng xóm đóng cửa sổ lại._
_Bịch. Bịch. Bịch. Hai giờ sáng._
_Rồi một tiếng "phựt". Dây treo bao cát đứt. Bao cát rơi xuống sân, nằm im._
_Bạn ngồi xuống cạnh nó. Hai thứ cũ kỹ, nằm cạnh nhau, dưới ánh trăng Phố Cũ._
_Bộ đàm bên hông vẫn rè rè, bắt nhầm sóng taxi: "…khách đi Sân khấu Đại Nhạc Hội Siêu Nhân… hủy chuyến… hết show rồi…"_
-> END

// ------------------------------------------------------------
// 😢 🥀 MỘT MÌNH GÁNH TEAM
// ------------------------------------------------------------
=== chi_dai_kt_mot_minh_ganh_team ===
# ket_thuc:mot_minh_ganh_team # loai:buon
{ chung_cong_ty_song:
    _Đại Nhạc Hội Siêu Nhân thành công. Pháo giấy hồng. Khán giả hát. {giam_doc} ôm {sieu_nhan_hong} trên sân khấu, khóc như đứa trẻ._
- else:
    _Đại Nhạc Hội Siêu Nhân chạy trọn vẹn tới bài cuối. Sân khấu không sập, đèn không tắt. Chỉ có con số là không đủ. {giam_doc} cảm ơn từng người, giọng khàn đặc, rồi nói: "Thôi, đi hát một bữa đã."_
}
_Sau show, cả công ty kéo nhau qua Karaoke Chú Sáu. Group Zalo-lô nổ tin nhắn: "Phòng VIP 2 nha mọi người!", "Ai chưa tới?"._
_Không ai nhắn cho bạn. Không ai quên bạn. Chỉ là ai cũng nghĩ: "Chị {chi_dai} chắc bận dọn sân khấu." "Chị {chi_dai} chắc mệt." "Chị {chi_dai} lúc nào chả có việc."_
_Họ nói đúng. Bạn bận. Bạn mệt. Bạn có việc. Ba lần trong tháng này, bạn kiệt sức tới mức ngồi bệt ở kho mà không đứng dậy nổi. Không ai biết._
_23:30. Bạn dọn xong cái loa cuối cùng. Về công ty cất bộ đàm. Leo lên sân thượng. Hai cái ghế nhựa. Một cây phơi đồ. Một cái ghế trống._
_Bên kia đường, karaoke vọng lên tiếng hát. "Công Viên". Cả phòng hát sai lời "khoai chiên", rồi cười rần rần._
_Bạn tháo bộ đàm khỏi thắt lưng. Đặt lên cái ghế trống bên cạnh. Lần đầu tiên trong tháng, bạn không đeo nó._
_Tay bạn trống trơn. Không quen._
_Có tiếng bước chân lên cầu thang. Chậm. Nặng. Tiếng dép lê._
_Bác {bac_bao_ve}. Tay cầm một ly trà đá, đá còn nguyên viên. Bác không hỏi gì. Bác đặt ly trà xuống cạnh bạn, ngay bên cái bộ đàm._
bac_bao_ve: Uống đi. Bác thấy hết rồi.
_Bác ngồi xuống cái ghế nhựa còn lại. Hai người nhìn sang bên kia đường. Nghe tiếng hát. Không ai nói gì._
_Ly trà đá đọng nước, chảy thành vệt dài trên mặt ghế. Bạn uống một ngụm. Đặc. Như mọi khi._
bac_bao_ve: Mai bác bảo chúng nó. Không phải ai cũng tự nhớ được đâu, cháu ạ. Có người phải được nhắc.
_Bạn gật đầu. Không nói được. Lần này, chị Đại để cho mình được im._
-> END
