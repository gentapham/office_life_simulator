// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · ĐÁNH GIÁ & 6 KẾT THÚC
// Game gọi dan_dau_tu_3010_danh_gia sau Đại Nhạc Hội Siêu Nhân (23:00 – 23:45 ngày 31/10),
// khi ket_thuc_su_nghiep và chung_cong_ty_song đã chốt.
// Thứ tự xét (docs/so-tay-su-that.md mục 12):
//   Bí mật: Thư Tay Của G      (thân Bác Bình ≥ 60, trả hoặc hứa trả Bác Bình trước, Độ Chuẩn ≥ 80, nhánh trang 47)
//   Vui:    Nhà Phân Tích       (Độ Chuẩn ≥ 80, thuyết phục sếp 21/10; văn bản đổi theo số phận công ty)
//           Sổ Nợ Về 0          (có lộ trình trả nợ 24/10 hoặc đã hết nợ, nợ ≤ 20 triệu,
//                                không tiền LL, không mua coin sau 18/10)
//   Buồn:   Đu Đỉnh Bên Kia     (bán số liệu thật cho LL)
//           Chủ Nợ Vây Thành    (nhiều chủ nợ ghét, hoặc bỏ bàn chủ nợ 24/10)
//           Còn Cái Nịt         (còn lại: nợ chưa trả xong, không ai giữ)
// ============================================================

=== dan_dau_tu_3010_danh_gia ===
# ngay:31 # gio:23:00 # noi:san_khau_dem_hong # dieu_kien:sau_dem_hong # danh_gia
_23 giờ. Khán đài vắng dần. Bạn ngồi trên bậc thấp nhất, điện thoại úp trên đùi. Con số cuối cùng đã đứng yên._
{ chung_cong_ty_song:
    _{cong_ty} còn sống. Bạn biết trước cả khi màn hình lớn tắt: bạn đọc số giỏi, và lần này số đi đúng chiều._
- else:
    _Con số dừng lại dưới mức cần. Bạn biết từ 22 giờ, khi đường tăng bắt đầu nằm ngang. Đọc số giỏi, đôi khi là biết tin xấu sớm hơn người khác một tiếng._
}
{
- qh_bac_bao_ve >= 60 && (ddt_tra_binh_dau_tien || ddt_hua_binh) && ddt_do_chuan >= 80 && ddt_nhanh_trang_47 && not ddt_ban_so_lieu_ll:
    ~ chot_ket_thuc("thu_tay_g")
    -> dan_dau_tu_kt_thu_tay_g
- ddt_do_chuan >= 80 && ddt_thuyet_phuc_21 && not ddt_ban_so_lieu_ll:
    ~ chot_ket_thuc("nha_phan_tich")
    -> dan_dau_tu_kt_nha_phan_tich
- (ddt_so_no == 0 || ddt_ban_chu_no_ok) && ddt_so_no <= 20000000 && not ddt_dung_tien_ll && not ddt_mua_sau_18:
    ~ chot_ket_thuc("so_no_ve_0")
    -> dan_dau_tu_kt_so_no_ve_0
- ddt_ban_so_lieu_ll:
    ~ chot_ket_thuc("du_dinh_ben_kia")
    -> dan_dau_tu_kt_du_dinh_ben_kia
- ddt_dem_chu_no_ghet() >= 3 || ddt_bo_ban_chu_no:
    ~ chot_ket_thuc("chu_no_vay_thanh")
    -> dan_dau_tu_kt_chu_no_vay_thanh
- else:
    ~ chot_ket_thuc("con_cai_nit")
    -> dan_dau_tu_kt_con_cai_nit
}

// ------------------------------------------------------------
// 😄 📊 NHÀ PHÂN TÍCH THẬT SỰ
=== dan_dau_tu_kt_nha_phan_tich ===
# ngay:31 # gio:23:30 # noi:phong_gac_lung
_Buổi đánh giá. {giam_doc} gọi tên bạn, đứng dậy, bắt tay._
giam_doc: Từ tháng 11, {dan_dau_tu} là Trưởng nhóm Dữ liệu. Lương tăng 20%. Anh không ép, nhưng anh cũng không cho em từ chối.
_{quan_ly_idol} vỗ tay đầu tiên. Rồi {hong_hot}. Rồi cả phòng. {ke_toan} vỗ tay mà không hỏi hóa đơn._
_Đêm 31/10, Đại Nhạc Hội Siêu Nhân đã qua. Con số trên điện thoại bạn vượt một triệu, lúc 21 giờ 47 phút. Bạn chụp màn hình đúng một lần._
_Tối đó, ở gác lửng Hẻm 69, bạn ngồi trước laptop. Hai cửa sổ. Bên trái là bảng số liệu tháng 11, chưa có số. Bên phải là app chart, biểu tượng nhỏ, đỏ, quen thuộc._
_Bạn mở điện thoại. Giữ ngón tay trên biểu tượng app chart. Một giây. Hai giây._
_"Cắt lỗ là thua." Ba giây._
_"Đây là đáy." Bốn giây._
_"Lần này là lên thật." Năm giây._
_Bạn bấm "Gỡ cài đặt"._
_Màn hình phải tắt._
_Màn hình trái vẫn sáng. Trên đó, ở ô đầu tiên của bảng tháng 11, bạn gõ một dòng ghi chú:_
_"Khán giả thích người thật. Mình cũng vậy."_
_Bên kia vách, chú Sáu karaoke hát "Công Viên". Sai lời. Bạn hát theo, cũng sai lời._
-> END

// ------------------------------------------------------------
// 😄 🧾 SỔ NỢ VỀ 0
=== dan_dau_tu_kt_so_no_ve_0 ===
# ngay:31 # gio:16:00 # noi:tang_1
_Chiều 31/10, trước Đại Nhạc Hội Siêu Nhân. Bạn đi một vòng công ty với cuốn sổ nợ, cuốn sổ đã theo bạn ba năm. Trang nào cũng gạch xóa._
_Người đầu tiên: Bác {bac_bao_ve}. Bạn đã trả bác từ trước. Hôm nay bạn chỉ ghé chòi để đóng lại trang đầu tiên của cuốn sổ._
bac_bao_ve: Xong rồi à? … Ừ. Ngồi uống ngụm trà đã rồi đi tiếp.
_{it} đang ngồi trong phòng server. Bạn gõ cửa, đưa phong bì cuối._
it: Restart cái ví thành công.
_{con_ong_chau_cha} nhận lại khoản "vốn góp" bằng một bảng số liệu nhạc dày 40 trang._
con_ong_chau_cha: Anh biết hông, cái này còn đáng hơn tiền. Chill.
_{thanh_xin_nghi}, {thuc_tap_sinh}, {bien_kich}, {idol_het_thoi}. Mỗi người một cái gật đầu. {thuc_tap_sinh} còn cúi chào 90 độ._
_Người cuối cùng là {sales}. {sales} cầm phong bì, rồi lục túi, đưa lại cho bạn một tờ giấy gấp tư: tờ nhắc nợ thứ 7, cái tờ từng dán trên cửa gác lửng._
sales: Giữ làm kỷ niệm nha anh. Tin em đi, sau này anh sẽ muốn nhớ.
_Tối đó, cả công ty ăn mừng bằng trà sữa. Lần này bạn trả tiền._
_Có hóa đơn hẳn hoi. Bạn đưa hóa đơn cho {ke_toan}._
ke_toan: *(nhìn tờ hóa đơn rất lâu)* Có hóa đơn. Có dấu đỏ. Ông {dan_dau_tu}… tui muốn đóng khung cái này.
_Bạn mở cuốn sổ nợ, trang cuối, viết một chữ "0". Rồi gấp sổ lại. Lần đầu tiên, con số nhỏ nhất lại là con số đẹp nhất._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: THƯ TAY CỦA G
=== dan_dau_tu_kt_thu_tay_g ===
# ngay:31 # gio:23:45 # noi:choi_bao_ve
_Đêm 31/10. Đại Nhạc Hội Siêu Nhân đã tắt đèn. Bộ đàm rè lên giọng Bác {bac_bao_ve}: "Cậu {dan_dau_tu} ra chòi bác một lát."_
_Chòi bảo vệ. Ấm trà nóng. {cho} nằm trên ghế bố, đuôi vẫy nhẹ khi thấy bạn, lần đầu tiên trong tháng._
bac_bao_ve: Thư mới. Tới chiều nay. Có một đoạn cho cậu.
_Bác đưa lá thư tay, ký đúng một chữ "G". Bác chỉ vào đoạn cuối:_
_"Anh {bac_bao_ve} kể với tôi có một cậu đọc số rất giỏi. Nhờ cậu giúp {giam_doc} xem lại sổ sách, và giúp cậu ấy nói thật với tôi."_
dan_dau_tu: Sao… người này biết con?
bac_bao_ve: Bác không thấy gì đâu. Bác chỉ kể… chuyện có cậu nhân viên trả nợ bác đầu tiên, trước cả những người đòi to hơn.
bac_bao_ve: Người trả nợ người nhỏ trước, là người đọc được lòng người. Ông ấy cần người như thế.
_Sáng 1/11. Phòng giám đốc. Bạn và {giam_doc} ngồi đối diện nhau, giữa bàn là một tờ giấy trắng._
giam_doc: Anh chưa bao giờ viết thư cho ông ấy mà nói thật. Mười năm rồi.
dan_dau_tu: Thì lần này viết. Em lo phần số.
_Hai người viết tới trưa. Cuối thư, bạn kẹp thêm một biểu đồ: dòng tiền thật của {cong_ty} 16 năm. Có núi năm 2015. Có dốc. Có cái biệt thự. Có tháng 10 nhô lên một chút._
_Lần đầu tiên, biểu đồ bạn vẽ không đi lên._
_Mà vẫn đẹp._
-> END

// ------------------------------------------------------------
// 😢 💀 CÒN CÁI NỊT
=== dan_dau_tu_kt_con_cai_nit ===
# ngay:31 # gio:07:30 # noi:ben_xe_ven_do
_Sáng 31/10. Bến xe Ven Đô. Bạn ngồi trên băng ghế nhựa, ba lô dưới chân. Trong ba lô: hai bộ đồ, cái sạc điện thoại, và cuốn sổ nợ không còn trang trống._
_Tài khoản đầu tư: 0 đồng. Sổ nợ: {ddt_so_no} đồng. Còn cái nịt. Mà cái nịt bạn cũng đem cầm rồi._
_Xe về quê lăn bánh lúc 8 giờ. Bạn ngồi cạnh cửa sổ. Thành Phố Ước Mơ lùi dần, rồi nhỏ dần, như một cây nến đỏ._
_Tối đó, trên xe, điện thoại báo:_
{ ddt_chien_dich_on():
    _"Siêu Nhân Hồng đạt 1.000.000 người theo dõi!"_
    _Bạn mở group công ty. Mọi người đang ăn mừng: ảnh Đại Nhạc Hội Siêu Nhân, ảnh pháo giấy, ảnh {giam_doc} trong bộ đồ Ông Kẹ Ngân Hàng ôm {ke_toan} khóc._
- else:
    _"Đại Nhạc Hội Siêu Nhân đã kết thúc."_
    _Bạn mở group công ty. Mọi người đang gửi ảnh Đại Nhạc Hội Siêu Nhân, ảnh pháo giấy, ảnh {giam_doc} trong bộ đồ Ông Kẹ Ngân Hàng ngồi lặng trên bậc sân khấu. Ai cũng buồn, nhưng ai cũng ở đó với nhau._
}
_Không ai nhắc tới bạn. Bạn tưởng vậy._
_Rồi một tin nhắn hiện lên. Từ Bác {bac_bao_ve}. Người không bao giờ nhắn group._
bac_bao_ve: "Về đi. Không ai đòi đâu."
_Bạn đọc tin nhắn ba lần. Ngón tay đặt trên nút "Trả lời"._
_Xe đã lăn bánh được 200 cây số._
-> END

// ------------------------------------------------------------
// 😢 🪤 CHỦ NỢ VÂY THÀNH
=== dan_dau_tu_kt_chu_no_vay_thanh ===
# ngay:31 # gio:10:00 # noi:phong_hop_tang_2
_Buổi đánh giá. {hr} mở tập hồ sơ màu hồng. Danh sách cắt giảm._
hr: Em chỉ muốn cùng mọi người nhìn lại hành trình. Người đầu tiên trong danh sách… anh {dan_dau_tu}.
_Phòng họp im lặng. Bạn nhìn quanh. Tám người từng cho bạn mượn tiền đang ngồi trong phòng._
_{sales} nhìn xuống điện thoại. {it} nhìn trần nhà. {con_ong_chau_cha} nhìn ra cửa sổ. {thuc_tap_sinh} định giơ tay, rồi rụt lại._
_Không ai đứng lên nói đỡ. Bạn nhớ cái ghế trống ở bàn tròn ngày 24. Tám ly trà nguội dần._
_Chiều đó, bạn ôm thùng carton ra cổng. Trong thùng: hai cái màn hình, một cuốn sổ nợ, một tờ biểu đồ vẽ tay đi lên._
_Bạn đi ngang qua 8 người từng cho bạn mượn tiền. Không ai nhìn._
_Chỉ có {cho} chạy theo. Nó đánh hơi cái thùng carton một lúc, rồi đánh hơi tay bạn, rồi quay về chòi._
_Bác {bac_bao_ve} đứng trong chòi, không nói gì. Bác mở cổng rộng hơn một chút cho bạn dễ đi. Như mở cổng cho người ra, chứ không phải cho người vào._
-> END

// ------------------------------------------------------------
// 😢 📉 ĐU ĐỈNH BÊN KIA
=== dan_dau_tu_kt_du_dinh_ben_kia ===
# ngay:31 # gio:08:00 # noi:cong_cong_ty
_Bạn đã trả được hết nợ. Bằng 15 triệu của LL. Từng người nhận phong bì, cảm ơn, không ai hỏi tiền ở đâu ra._
{ nguyen_theo_ll:
    _Đêm 31/10, {sieu_nhan_hong} không xuất hiện trên Sân khấu Đại Nhạc Hội Siêu Nhân. Ở tòa nhà kính bên kia đường, một sân khấu khác sáng đèn xanh lá chuối._
- else:
    _Đêm 31/10, {sieu_nhan_hong} diễn hết mình. Nhưng LL đã đi trước một bước ở mọi khung giờ, mọi tệp khán giả. Con số dừng lại cách một triệu rất xa._
}
_Ngày 1/11. G-Entertainment đóng cửa._
_Bạn đứng trước cổng, tay cầm ly cà phê. Không ai còn đòi nợ bạn. Cũng không còn ai để đòi._
_Bác {bac_bao_ve} đang đứng trên thang, tháo chữ G sặc sỡ xuống. Từng màu một. Đỏ. Cam. Vàng. Lục…_
_{cho} ngồi dưới chân thang, nhìn lên, không sủa._
_Bác bước xuống, ôm chữ G vào lòng như ôm một đứa trẻ. Đi ngang qua bạn. Không hỏi gì._
bac_bao_ve: Bác không thấy gì đâu.
_Bạn biết. Bác thấy hết._
_Ly cà phê nguội. Lần này là xuống thật._
-> END
