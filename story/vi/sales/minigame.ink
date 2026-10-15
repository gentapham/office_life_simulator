// ============================================================
// SALES · MINIGAME
// Mỗi minigame có 3 cảnh: _mo_dau (game mở minigame sau cảnh này),
// _thanh_cong và _that_bai (game gọi theo kết quả).
// ============================================================

// ============================================================
// 📞 GỌI ĐIỆN CHÀO HÀNG
// ============================================================
=== sales_mg_goi_dien_mo_dau ===
# noi:ban_sales # dieu_kien:mo_minigame_goi_dien
_Danh sách 15 số điện thoại: tiệm nail, quán ốc, phòng gym, tiệm cầm đồ, một tiệm bán áo mưa. Mỗi cuộc gọi, chọn 3 câu._
_Nói quá thì khách cúp máy. Nói nhạt thì khách ngủ gật. Nói thật thì… chưa thử bao giờ._
-> END

=== sales_mg_goi_dien_thanh_cong ===
# noi:ban_sales # dieu_kien:thang_minigame_goi_dien
~ tien_cong(100000)
~ sl_that(2)
~ follow(2000)
{ RANDOM(1, 4) == 1:
    _Một cuộc gọi trúng Tiệm Nail & Tóc Lung Linh. Chị chủ tiệm cười khanh khách: "Em dễ thương ghê, chị tặng em cái voucher làm móng nè."_
    ~ sl_co_voucher_nail = true
- else:
    _Ông chủ phòng gym Cơ Bắp Ảo đồng ý đặt một gói nhỏ: logo phòng gym trong clip Siêu Nhân Hồng chống đẩy._
}
_Nhận 100.000đ hoa hồng. KPI Thật nhích lên một chút. Một chút thật._
-> END

=== sales_mg_goi_dien_that_bai ===
# noi:ban_sales # dieu_kien:thua_minigame_goi_dien
{ RANDOM(1, 3):
- 1: _"Tút tút tút." Ông chủ tiệm cầm đồ cúp máy giữa câu "tập đoàn đa quốc gia"._
- 2: _Chị bán áo mưa ngủ gật ở phút thứ 4. Bạn nghe tiếng ngáy qua điện thoại._
- else: _Điện thoại reo ngược lại. Màn hình: "Anh {dan_dau_tu} (nợ 5tr)". Bạn cúp máy theo phản xạ._
}
~ cang_thang(8)
~ sl_phet(2)
-> END

// ============================================================
// 🍻 TIẾP KHÁCH QUÁN ỐC
// ============================================================
=== sales_mg_quan_oc_mo_dau ===
# noi:quan_oc_dem # dieu_kien:mo_minigame_quan_oc
_Quán Ốc Đêm. Chọn món, rót bia, giữ thanh "Tỉnh Táo" không tụt quá nửa. Khách hỏi khó thì chọn câu đỡ._
_Luật số 1 của nghề: tuyệt đối không hứa thứ không có. Luật số 2: bạn luôn quên luật số 1._
-> END

=== sales_mg_quan_oc_thanh_cong ===
# noi:quan_oc_dem # dieu_kien:thang_minigame_quan_oc
_Khách ký. Không hứa bừa câu nào. Bạn tỉnh táo tới mức tự hào._
~ an(60)
~ cang_thang(-10)
~ tien_cong(300000)
~ sl_that(5)
~ sl_so_dia_oc = sl_so_dia_oc + 3
~ follow(5000)
chu_quan_oc: Con nhỏ này được! Uống không say, nói không xạo. Hiếm à nghen!
-> END

=== sales_mg_quan_oc_that_bai ===
# noi:quan_oc_dem # dieu_kien:thua_minigame_quan_oc
_Lon thứ 6. Thanh "Tỉnh Táo" chạm đáy. Bạn nghe chính mình nói: "Tin chị đi, chị đưa Siêu Nhân Hồng tới ăn mỗi tuần, miễn phí trọn đời!"_
~ an(50)
~ sl_phet(20)
~ nghi(-30)
~ cang_thang(10)
_Sáng hôm sau, bạn tỉnh dậy với một tin nhắn: "Chú chờ Siêu Nhân Hồng thứ 7 này nha con." Bạn không nhớ đã hứa gì._
{ sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
-> END

// ============================================================
// 📊 BÁO CÁO THỨ 6
// ============================================================
=== sales_mg_bao_cao_mo_dau ===
# noi:ban_sales # dieu_kien:mo_minigame_bao_cao
_Thứ 6. Báo cáo KPI. Chọn trục tung, màu, chữ to. Biến {sl_kpi_that} triệu thật thành một cột cam đi lên như tên lửa._
{ sl_chuong_lam_ngo:
    _{dan_dau_tu} đi ngang, che một bên mắt bằng tay, giữ đúng lời hứa._
- else:
    _{dan_dau_tu} đi ngang, liếc màn hình bạn. Ông ấy là người duy nhất trong công ty đọc được biểu đồ._
}
-> END

=== sales_mg_bao_cao_thanh_cong ===
# noi:ban_sales # dieu_kien:thang_minigame_bao_cao
~ tien_cong(150000)
~ nhan(tra_sua)
~ uong(20)
~ sl_giay(30)
~ sl_phet(5)
giam_doc: {sales} lại 300%! Phòng Kinh doanh của mình là số một!
_Bạn nhận 150.000đ thưởng nóng và một ly trà sữa full topping. Ly trà sữa ngọt. Lương tâm hơi đắng._
-> END

=== sales_mg_bao_cao_that_bai ===
# noi:ban_sales # dieu_kien:thua_minigame_bao_cao
dan_dau_tu: *(dừng lại, chỉ vào màn hình)* Ủa em, trục tung bắt đầu từ 280 hả? Vậy là cột này… cao có 2 phân thôi mà.
~ sl_phet(10)
~ cang_thang(10)
~ qh("dan_dau_tu", -3)
_Mất thưởng. {dan_dau_tu} nhún vai: "Anh vẽ chart cả đời, em lừa ai chứ không lừa được anh."_
{ sl_bong_bong >= 100:
    -> sales_tudo_bong_bong_be
}
-> END

// ============================================================
// 🩷 GÓI TÀI TRỢ HỒNG
// ============================================================
=== sales_mg_goi_tai_tro_mo_dau ===
# noi:pho_tan_drama # dieu_kien:mo_minigame_goi_tai_tro
_Ghép gói quảng cáo nhỏ cho chủ quán trong quận: logo trên áo Siêu Nhân Hồng, quán xuất hiện trong clip, Nguyên ăn thử món._
_Giá vừa túi tiền thì bán được. Giá "tập đoàn" thì khách cười._
-> END

=== sales_mg_goi_tai_tro_thanh_cong ===
# noi:pho_tan_drama # dieu_kien:thang_minigame_goi_tai_tro
~ tien_cong(500000)
~ sl_that(5)
~ follow(5000)
{ RANDOM(1, 3):
- 1:
    _Quán Ốc Đêm trả thêm 10 voucher ốc._
    ~ sl_so_voucher_oc = sl_so_voucher_oc + 10
    ~ sl_so_dia_oc = sl_so_dia_oc + 10
- 2:
    _Tiệm tạp hóa đầu phố trả một thùng nước ngọt._
    ~ sl_co_thung_nuoc_ngot = true
    ~ uong(30)
- else:
    _Cô Năm cơm tấm trả 5 hộp cơm tấm sườn bì chả._
    ~ nhan(com_tam)
    ~ an(30)
}
_Kèm 500.000đ tiền mặt. KPI Thật tăng thật. Bạn nhìn con số và thấy nó… nhỏ, nhưng đẹp._
-> END

=== sales_mg_goi_tai_tro_that_bai ===
# noi:pho_tan_drama # dieu_kien:thua_minigame_goi_tai_tro
_Chủ quán cà phê nghe giá xong thì đứng dậy đi rót nước. Và không quay lại._
~ cang_thang(5)
~ nghi(-10)
-> END

// ============================================================
// 🧾 ĐẤU TRÍ TẠM ỨNG
// ============================================================
=== sales_mg_tam_ung_mo_dau ===
# noi:phong_ke_toan # dieu_kien:mo_minigame_tam_ung
ke_toan: Lại tạm ứng hả em? Lần trước đi tiếp khách, hóa đơn đâu em?
~ sl_hoi_hoa_don = sl_hoi_hoa_don + 1
_{ke_toan} sẽ hỏi "Hóa đơn đâu em?" 3 lần. Mỗi lần phải đỡ được._
-> END

=== sales_mg_tam_ung_thanh_cong ===
# noi:phong_ke_toan # dieu_kien:thang_minigame_tam_ung
~ sl_hoi_hoa_don = sl_hoi_hoa_don + 2
~ sl_ung(1000000)
ke_toan: *(thở dài, ký)* 1 triệu. Có hóa đơn thì mang về. Không có thì trừ lương.
_Bạn cầm 1 triệu ra khỏi phòng kế toán như cầm cúp vô địch. Rồi nhớ ra đây là tiền phải trả lại._
-> END

=== sales_mg_tam_ung_that_bai ===
# noi:phong_ke_toan # dieu_kien:thua_minigame_tam_ung
~ sl_hoi_hoa_don = sl_hoi_hoa_don + 2
_{ke_toan} mở ngăn kéo, lấy ra một gói bánh quy, đặt lên bàn._
ke_toan: Ăn đi rồi đi làm.
~ an(15)
~ qh("ke_toan", 2)
_Thân chưa mà giỡn. Nhưng bánh quy ngon. Bạn ăn hết, không chừa miếng nào._
-> END

// ============================================================
// 📸 SỐNG ẢO SKY ẢO
// ============================================================
=== sales_mg_song_ao_mo_dau ===
# noi:can_1203 # dieu_kien:mo_minigame_song_ao
_Căn 1203. Một gói mì, hai cọng hành, ánh nến, bát sứ mượn từ tủ trưng bày. Góc chụp: hướng ra view thành phố._
_Mục tiêu: một tấm story khiến khách hàng nghĩ bạn vừa ăn tối với chủ tịch tập đoàn._
-> END

=== sales_mg_song_ao_thanh_cong ===
# noi:can_1203 # dieu_kien:thang_minigame_song_ao
~ danh_tieng = danh_tieng + 5
~ sl_co_mi_cao_cap = true
~ an(25)
_Story "Bữa tối cùng đối tác chiến lược 🍷" được 120 lượt thả tim. 22 phút sau, một chủ tiệm bánh nhắn hỏi: "Em ơi, gói tài trợ bên em bao nhiêu?"_
~ sl_that(1)
_Bạn nhận vật phẩm Gói Mì "Cao Cấp": vẫn là mì gói, nhưng đựng trong bát sứ._
-> END

=== sales_mg_song_ao_that_bai ===
# noi:can_1203 # dieu_kien:thua_minigame_song_ao
_Story đăng lên. 4 giây sau, {hong_hot} bình luận: "Ủa bà, cái gói mì lộ logo kìa."_
~ danh_tieng = danh_tieng - 3
~ an(20)
~ cang_thang(5)
_Bạn xóa story. Ăn mì. Mì nguội rồi._
-> END
