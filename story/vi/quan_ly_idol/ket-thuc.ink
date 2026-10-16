// ============================================================
// QUẢN LÝ IDOL · ĐÁNH GIÁ & 6 KẾT THÚC
// Chạy sau Đại Nhạc Hội Siêu Nhân (31/10, 23:30). Đọc ket_thuc_su_nghiep và
// chung_cong_ty_song (đã chốt cuối đêm diễn) để nói về Nguyên và công ty.
// Thứ tự: bí mật > 2 vui > 3 buồn > mặc định
// ============================================================

=== quan_ly_idol_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau_dem_hong
// 3. 🔒 Chuối Chiên Cho Hai Người (bí mật)
{ thai_mo_doi_ban_than and thai_dat_cuoc and not thai_ky_ll and thai_phat_huy_fan_ao and qh_idol_het_thoi >= 80 and thai_khung_hoang <= 3 and thai_pin_ve_0 < 5:
    ~ chot_ket_thuc("chuoi_chien_hai_nguoi")
    -> quan_ly_idol_kt_chuoi_chien_hai_nguoi
}
// 1. 🏆 Quản Lý Của Năm: Phát được gia hạn, khủng hoảng gọn, ở lại tới cùng
{ not thai_dat_nguyen_di and thai_phat_gia_han and thai_khung_hoang <= 2 and thai_ganh_ho <= 1 and thai_trung_thanh >= 60:
    ~ chot_ket_thuc("quan_ly_cua_nam")
    -> quan_ly_idol_kt_quan_ly_cua_nam
}
// 2. 🎙️ Người Phát Hiện Giọng Hát
{ not thai_dat_nguyen_di and not thai_to_son and thai_doi_lich_son >= 3 and qh_thanh_xin_nghi >= 60:
    ~ chot_ket_thuc("nguoi_phat_hien_giong_hat")
    -> quan_ly_idol_kt_nguoi_phat_hien_giong_hat
}
// 4. 💚 Sang Bên Kia Đường
{ thai_ky_ll and thai_dat_nguyen_di:
    ~ chot_ket_thuc("sang_ben_kia_duong")
    -> quan_ly_idol_kt_sang_ben_kia_duong
}
// 5. 🔥 Cháy Máy
{ thai_khung_hoang >= 4 or thai_pin_ve_0 >= 5:
    ~ chot_ket_thuc("chay_may")
    -> quan_ly_idol_kt_chay_may
}
// 6. 🛡️ Gánh Hộ Tới Cùng
{ thai_ganh_ho >= 2:
    ~ chot_ket_thuc("ganh_ho_toi_cung")
    -> quan_ly_idol_kt_ganh_ho_toi_cung
}
// Mặc định
{ thai_phat_gia_han and not thai_dat_nguyen_di and thai_ganh_ho == 0:
    ~ chot_ket_thuc("quan_ly_cua_nam")
    -> quan_ly_idol_kt_quan_ly_cua_nam
}
~ chot_ket_thuc("ganh_ho_toi_cung")
-> quan_ly_idol_kt_ganh_ho_toi_cung

// ------------------------------------------------------------
// 😄 1. QUẢN LÝ CỦA NĂM
// ------------------------------------------------------------
=== quan_ly_idol_kt_quan_ly_cua_nam ===
# ket_thuc:quan_ly_cua_nam # loai:co_hau # noi:hau_truong_dem_hong
{ ket_thuc_su_nghiep:
- "sieu_sao_hang_a":
    _Đại Nhạc Hội Siêu Nhân kết thúc lúc 23 giờ. Một triệu người theo dõi. Top xu hướng. Khán giả vẫn chưa chịu về, đứng hát "thích ăn chuối chiên" ở bãi xe._
- "thao_mu":
    _Đại Nhạc Hội Siêu Nhân kết thúc lúc 23 giờ. Con số không kịp chạm một triệu. Nhưng {sieu_nhan_hong} đã tự tháo mũ trên sân khấu, và bạn biết sáng mai sẽ có một tờ phụ lục gia hạn tới Tết. Lần này bạn không cần dập gì hết._
- else:
    _Đại Nhạc Hội Siêu Nhân kết thúc lúc 23 giờ. Con số không kịp chạm một triệu. Nhưng cả mạng đang gọi "Siêu Nhân Gâu", và {sieu_nhan_hong} đã gật đầu ký phụ lục gia hạn tới Tết. Công ty còn sống. Bạn biết chuyện đó khó cỡ nào._
}
_{giam_doc}, vẫn mặc bộ "Ông Kẹ Ngân Hàng", kéo bạn ra giữa hậu trường, trước mặt cả công ty._
giam_doc: Các em. Từ thứ 2, {quan_ly_idol} là Trưởng phòng Nghệ sĩ. Lương cộng 20%. Kèm một trợ lý.
giam_doc: *(quay sang bạn)* Trợ lý cầm điện thoại thứ hai. Cậu chỉ được cầm một cái thôi. Anh không ép. Đây là lệnh.
_Cả hậu trường vỗ tay. {thanh_xin_nghi} huýt sáo. {chi_dai} gõ bộ đàm vào cột sân khấu theo nhịp. {editor} đứng ở góc, vỗ tay chậm nhất, lâu nhất._
sieu_nhan_hong: *(ôm chầm lấy bạn, mũ lệch qua một bên)* Anh {quan_ly_idol}! Anh là siêu nhân của em!
_{idol_het_thoi} đứng phía sau {sieu_nhan_hong}. Không nói gì. Chỉ giơ ngón cái. Không đeo kính._
_Nửa đêm. Mọi người về hết. Bạn ngồi một mình ở bậc thang sân khấu. Gió thổi giấy kim tuyến hồng bay qua chân._
_Bạn lấy điện thoại bên phải ra. Máy của {sieu_nhan_hong}, của công việc, của 5 tỷ, của một triệu người. Bạn nhìn nó một lúc._
_Rồi bấm tắt nguồn._
_Màn hình tối. Lần đầu tiên trong một tháng, tay phải của bạn trống._
_Bạn lấy điện thoại bên trái ra. Máy của {idol_het_thoi}. Màn hình nứt một đường từ hôm Ngày Doanh nhân. Hình nền là một tấm ảnh chụp năm 2015, mờ, rung, một cậu sinh viên ôm đàn._
_Bạn nhìn nó rất lâu._
_Và để nó sáng._
-> END

// ------------------------------------------------------------
// 😄 2. NGƯỜI PHÁT HIỆN GIỌNG HÁT
// ------------------------------------------------------------
=== quan_ly_idol_kt_nguoi_phat_hien_giong_hat ===
# ket_thuc:nguoi_phat_hien_giong_hat # loai:co_hau # noi:dai_tivi_hong
_Đêm 31/10, 23 giờ 30. Đài Tivi Hóng gửi bạn một đoạn video quay sau cánh gà chung kết: {thanh_xin_nghi} ôm cúp hạng ba, mặt tèm lem kim tuyến, gọi tên bạn. Bạn coi nó trên máy thứ ba, ngồi ở bậc thang sân khấu Đại Nhạc Hội._
_Ba tháng sau._
_Một căn phòng 12 mét vuông ở tầng 2 một chung cư mini Phố Mới. Biển hiệu nhỏ, chữ viết tay: "Công ty Quản lý Nghệ sĩ Hai Máy Một Lúc". Bên trong có một cái bàn, một cái ghế, và một cái điện thoại._
_Chỉ một._
{ chung_cong_ty_song:
    _Bạn đã nghỉ {cong_ty} sau Tết. {giam_doc} không giữ, chỉ nói: "Cậu đi thì đi, nhưng năm nào cũng phải về ăn tất niên." {idol_het_thoi} tới tiễn, mang theo hai bịch chuối chiên._
- else:
    _{cong_ty} đóng cửa trước Tết. Hôm dọn đồ, {giam_doc} đứng ở cổng bắt tay từng người: "Cậu đi đâu thì đi, nhưng năm nào cũng phải gọi anh một cuộc." {idol_het_thoi} tới phụ bạn khiêng thùng, mang theo hai bịch chuối chiên._
}
_Nghệ sĩ đầu tiên của bạn: {thanh_xin_nghi}. Người duy nhất trong lịch sử từng xin nghỉ để đi làm nghệ sĩ, rồi nghỉ việc luôn để làm nghệ sĩ thật._
_Đêm chung kết mùa sau của "Giọng Ca Ước Mơ", Đài Tivi Hóng. {thanh_xin_nghi} trong bộ vest kim tuyến tím, mượn của {idol_het_thoi}, hát xong nốt cuối._
_Cả trường quay đứng dậy. {thanh_xin_nghi} nhìn xuống hàng ghế đầu._
_Bạn giơ ngón cái._
thanh_xin_nghi: *(cầm micro, thở dốc)* Con cảm ơn bà ngoại… à không. *(cả trường quay cười)* Em cảm ơn anh {quan_ly_idol}. Người duy nhất chưa bao giờ đòi em giấy phòng khám.
_Cả trường quay cười. Bạn cũng cười. Ở hàng ghế thứ ba, {hr} đang vỗ tay to nhất, rồi giật mình, ngồi xuống, giả vờ ghi sổ._
_Sau buổi diễn, ở bãi xe đài truyền hình, {thanh_xin_nghi} ôm bạn một cái thật mạnh, kim tuyến dính đầy áo blazer đen của bạn._
thanh_xin_nghi: Anh {quan_ly_idol}. Mười năm em giấu cái này. Anh là người đầu tiên em dám cho coi.
quan_ly_idol: Ừ. Anh biết cảm giác giấu mười năm.
_Suốt buổi tối, cái điện thoại duy nhất của bạn im lặng._
_Bạn không kiểm tra nó lần nào._
-> END

// ------------------------------------------------------------
// 😄 3. 🔒 KẾT THÚC BÍ MẬT: CHUỐI CHIÊN CHO HAI NGƯỜI
// ------------------------------------------------------------
=== quan_ly_idol_kt_chuoi_chien_hai_nguoi ===
# ket_thuc:chuoi_chien_hai_nguoi # loai:co_hau # bi_mat # noi:san_khau_dem_hong
_Đại Nhạc Hội Siêu Nhân tan. Bãi đất trước sân khấu đầy giấy kim tuyến hồng. Công nhân cuộn dây điện. Bạn ngồi trên bậc thang sân khấu, hai cái điện thoại trên đùi, một cái 3% pin, một cái 1%._
_Ở cổng, xe chuối chiên cuối cùng của đêm đang dọn hàng. {idol_het_thoi} đứng đó. Mua hai bịch._
_{idol_het_thoi} đi tới. Đưa bạn một bịch. Ngồi xuống cạnh bạn. Gần hơn mọi lần._
idol_het_thoi: Anh {quan_ly_idol}.
quan_ly_idol: Ừ.
idol_het_thoi: Mười một năm nay em hát về đôi bạn thân bán cá viên chiên. Mà giờ em mới để ý người đứng cạnh em suốt là ai.
_Bạn không nói gì được. Bịch chuối chiên ấm trong tay. Tay hơi run. Chắc tại gió đêm._
idol_het_thoi: Anh đừng đi đâu hết nha. Em… chưa biết nói sao. Em còn nợ tiền nhà, em còn đeo kính trong nhà, em còn nhiều thứ phải học lắm.
idol_het_thoi: Mà anh đừng đi.
{ chung_cong_ty_song:
    _Hai cái điện thoại trong lòng bạn cùng reo. Máy phải: đài truyền hình, muốn mời {sieu_nhan_hong} đi show Tết. Máy trái: số lạ, đầu số đẹp, chắc là Lưu Lực._
- else:
    _Hai cái điện thoại trong lòng bạn cùng reo. Máy phải: {ke_toan}, chắc là chuyện hợp đồng 10 tỷ, chuyện công ty, chuyện sáng thứ 2. Máy trái: số lạ, đầu số đẹp, chắc là Lưu Lực._
}
_Mười hai năm. Mười hai năm, chưa cuộc gọi nào bạn để lỡ._
_Bạn úp cả hai máy xuống bậc thang. Để chúng reo._
_Bạn cắn một miếng chuối chiên._
quan_ly_idol: Chiên giòn ghê.
idol_het_thoi: *(cười)* Mà hông bằng chỗ công viên hồi xưa.
quan_ly_idol: Ừ. Hông bằng.
_Phía xa, ở hàng ghế khán giả trống, {editor} đang cuộn dây máy quay. Nhìn thấy hai người. Cúi đầu một chút, rồi mỉm cười, lặng lẽ tắt đèn sân khấu cuối cùng cho hai người khỏi bị ai nhìn._
_Hai cái điện thoại reo thêm một lúc, rồi thôi._
_Lần đầu tiên trong mười hai năm, bạn để mọi chuyện tự lo._
-> END

// ------------------------------------------------------------
// 😢 4. SANG BÊN KIA ĐƯỜNG
// ------------------------------------------------------------
=== quan_ly_idol_kt_sang_ben_kia_duong ===
# ket_thuc:sang_ben_kia_duong # loai:buon # noi:toa_ll
_Một tháng sau. Tòa nhà kính xanh lá chuối, Ven Đô. Tầng 18. Văn phòng riêng của bạn: Giám đốc Nghệ sĩ, LL-Entertainment._
_Bàn kính. Ghế da. Hai trợ lý ngồi ngoài cửa. Lương 36 triệu, về đúng ngày 10, chưa trễ ngày nào._
_Trên bàn chỉ có một cái điện thoại._
_{sieu_nhan_hong} đã nổi. Rất nổi. Nhưng nổi ở bên này đường. {sieu_nhan_hong} ít đi giúp người hơn, vì lịch LL kín tới mức không chừa ô trống nào. {sieu_nhan_hong} không còn tạo dáng sau mỗi câu nói._
_Qua cửa kính, bạn nhìn thấy tòa nhà tím của {cong_ty} bên kia đường. Nhỏ như hộp diêm. Đèn tầng 2 tắt. Đèn chòi bảo vệ vẫn sáng._
_Ở bậc thềm tòa nhà tím, có một người đeo kính đen ngồi ôm đàn. Không ai đi ngang. Người đó vẫn hát._
_Bạn không nghe được. Nhưng bạn biết bài gì. Bạn biết câu thứ ba sẽ lệch tông._
_Cái điện thoại bên trái của bạn, cái máy cũ, nằm trong ngăn kéo. Nó không còn ai gọi._
_Bạn mở điện thoại duy nhất. Vào nhóm "Hội Cá Viên Chiên". 300 thành viên. Bài cuối cùng của admin ChuoiChien89 đăng từ hôm 26/10._
_Bạn gõ: "Anh {idol_het_thoi} hôm nay vẫn hát."_
_Ngón tay dừng trên nút gửi._
_Bạn xóa._
_Ngoài cửa kính, người đeo kính đen đứng dậy, cất đàn, đi về. Bậc thềm trống._
-> END

// ------------------------------------------------------------
// 😢 5. CHÁY MÁY
// ------------------------------------------------------------
=== quan_ly_idol_kt_chay_may ===
# ket_thuc:chay_may # loai:buon # noi:phong_kham_khoe_re
_23 giờ, 31/10. Hậu trường Sân khấu Đại Nhạc Hội Siêu Nhân. Màn hình lớn vừa tắt. Bạn đứng dậy khỏi thùng loa, tay trái cầm máy {idol_het_thoi}, tay phải cầm máy {sieu_nhan_hong}, tai đeo tai nghe nối máy thứ ba._
_Ly cà phê thứ tám trong ngày. Pin: 1%. Của điện thoại. Và của bạn._
_Hậu trường nghiêng đi. Sàn sân khấu tiến lại gần. Âm thanh cuối cùng bạn nghe là ba tiếng chuông điện thoại cùng lúc, ba bài nhạc chuông khác nhau, như một bản hòa âm tệ._
_Gần nửa đêm. Phòng khám Đa Khoa Khỏe Re. Bác sĩ đẩy kính lên trán, nhìn bạn._
bac_si_khoe_re: Kiệt sức, thiếu ngủ, tim đập nhanh, caffeine trong máu đủ để nuôi một con voi. Anh cấm dùng điện thoại hai tuần.
bac_si_khoe_re: *(nhìn bàn đầu giường)* Ba cái hả? Thôi, cấm cả ba.
_Trên bàn đầu giường, ba cái điện thoại rung liên tục. Màn hình sáng rồi tắt, sáng rồi tắt, như ba con đom đóm hết hơi._
_Cái TV nhỏ trên tường đang chiếu lại Đại Nhạc Hội Siêu Nhân. {chung_cong_ty_song: Dòng chữ chạy dưới màn hình báo {cong_ty} được cứu. Bạn không có mặt lúc người ta ăn mừng.|Dòng chữ chạy dưới màn hình nói tới "khoản hoàn tiền 10 tỷ". Lần đầu tiên trong mười hai năm, bạn không phải người viết thông cáo.}_
_Bạn với lấy cái điều khiển. Tắt tiếng._
_Trên màn hình không tiếng, {idol_het_thoi} đang hát. Bạn biết bài gì. Bạn biết lúc nào tới câu thứ ba._
_Cửa phòng khám hé mở. {editor} đứng đó, tay cầm một ly cà phê sữa, loại bạn chuyển sang uống từ ly thứ năm. Thấy bạn tỉnh, {editor} đặt ly lên bàn, ngồi xuống ghế nhựa ở góc phòng, không nói gì._
{ thai_giu_usb_linh:
    _Áo khoác của bạn vắt trên thành giường. Chiếc USB con cú lòi ra một nửa khỏi túi áo trong. {editor} nhìn thấy, rồi nhìn đi chỗ khác, khóe miệng cong lên một chút._
}
_Đêm đó, lần đầu tiên, có người thức canh bạn thay vì bạn thức canh người khác._
_Ba cái điện thoại vẫn rung. Không ai nghe._
-> END

// ------------------------------------------------------------
// 😢 6. GÁNH HỘ TỚI CÙNG
// ------------------------------------------------------------
=== quan_ly_idol_kt_ganh_ho_toi_cung ===
# ket_thuc:ganh_ho_toi_cung # loai:buon # noi:phong_hr
_Thứ 2 sau Đại Nhạc Hội Siêu Nhân. Phòng HR. Ấm trà ô long. {hr} không cười._
{ chung_cong_ty_song:
    hr: Anh {quan_ly_idol}. Mình cùng nhìn lại hành trình nha anh. Tháng này cái gì cũng có một dòng "do quản lý". Thuế, fan ảo, gameshow, bánh kem. Nhà tài trợ mới đòi công ty "làm sạch hình ảnh" trước khi ký.
- else:
    hr: Anh {quan_ly_idol}. Công ty phải hoàn 10 tỷ. Danh sách cắt giảm phải dài thêm. Em có tên {thanh_xin_nghi} ở dòng cuối. Anh xin em gạch tên nó, ghi tên anh vô, phải hông?
    _Bạn gật đầu. Bạn đã xin đúng chuyện đó từ hôm 26._
}
hr: *(đẩy tờ giấy qua)* Em xin lỗi anh. Tên anh nằm trong danh sách.
_Bạn ký. Tay không run. Bạn đã ký nhận lỗi giùm người khác nhiều lần tới mức chữ ký này quen tay._
{ thai_phat_gia_han:
    _{idol_het_thoi} được giữ lại. Hợp đồng gia hạn một năm. "Vì lỗi toàn là do quản lý."_
- else:
    _Hợp đồng của {idol_het_thoi} đã hết hạn đêm 31/10. Trong thùng carton của bạn có một tờ đề nghị gia hạn soạn sẵn, chữ ký người đề nghị là bạn. Bạn đặt nó lên bàn {hr} trước khi đi. Có hay không, không còn là việc của bạn._
}
_Bạn ôm thùng carton đi xuống cầu thang bộ. Trong thùng: năm cục sạc dự phòng, một cái ly cà phê có chữ "{quan_ly_idol}", một cuốn sổ lịch mười hai năm._
_Ngăn kéo tủ đầu giường ở nhà thì không có trong thùng. Nó vẫn ở nhà. Vẫn đóng kín._
_Ở chiếu nghỉ tầng 1, {idol_het_thoi} đi lên. Kính đen. Sơ mi lụa. Ngân nga "Công Viên"._
idol_het_thoi: Ủa anh {quan_ly_idol} đi đâu vậy? Ôm thùng chi vậy?
_Bạn cười._
quan_ly_idol: Anh đi công chuyện xíu.
idol_het_thoi: Dạ. Chiều nay em có đám cưới quận 3 đó nha. Anh nhớ chở em.
quan_ly_idol: Ừ. Có người chở em.
_{idol_het_thoi} gật đầu, đi tiếp lên lầu, vẫn ngân nga. Lệch tông ở câu thứ ba._
_Bạn đi xuống. Bác {bac_bao_ve} mở cổng, nhìn cái thùng carton, rồi nhìn bạn._
bac_bao_ve: Bác không thấy gì đâu.
_{idol_het_thoi} không bao giờ biết._
-> END
