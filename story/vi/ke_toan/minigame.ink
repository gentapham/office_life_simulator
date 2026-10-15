// ============================================================
// KẾ TOÁN · MINIGAME
// Mỗi minigame có 3 cảnh: _mo_dau, _thanh_cong, _that_bai.
// Quỹ Công Ty / Quỹ Đen tính bằng triệu đồng.
// ============================================================

// ============ 🧾 SĂN HÓA ĐƠN ============
=== ke_toan_mg_san_hoa_don_mo_dau ===
# noi:phong_ke_toan # gio:08:15 # dieu_kien:sang_ngay_lam_viec
_Xấp đề nghị thanh toán sáng nay dày hai đốt ngón tay. Bạn xắn tay áo, đặt kính lúp lên bàn._
_Trên cùng: một tờ giấy ăn, viết bằng bút kẻ mắt: "Tạm ứng tiếp khách – Huyền". Bên dưới: "Tiền ốc 2 triệu, 1 người – Chương". Rồi: hóa đơn quán bida Cơ Bản, ghi "họp dự án" – Vũ._
* [🧾 Bắt đầu ghép từng khoản với hóa đơn.]
    ke_toan: Rồi. Hôm nay đứa nào gửi giấy ăn là chị trả lại giấy ăn.
* [☕ Pha một ly trà trước. Chiến lâu dài.]
    ~ uong(15)
- -> END

=== ke_toan_mg_san_hoa_don_thanh_cong ===
# noi:phong_ke_toan # dieu_kien:minigame_san_hoa_don_dat
_Mười bốn khoản, mười bốn lần đúng. Tờ giấy ăn của {sales} bị đóng dấu đỏ "KHÔNG HỢP LỆ". Tờ "tiền ốc 2 triệu một người" của {dan_dau_tu} bị trả về kèm câu "Một người ăn 2 triệu ốc thì em đi khám đi"._
~ tien_cong(300000)
~ kt_quy(5)
~ kt_keo(5)
~ kt_so_hoa_don_gia = kt_so_hoa_don_gia + 3
{ kt_so_hoa_don_gia >= 5:
    sales: *(đặt lên bàn một hộp bánh pía)* Chị Thương… em tặng chị làm lành. Có hóa đơn đàng hoàng nha chị!
    ~ an(30)
    ~ qh("sales", 5)
}
_Quỹ Công Ty giữ được thêm một ít. Không ai cảm ơn. Bạn tự gật đầu với mình._
-> END

=== ke_toan_mg_san_hoa_don_that_bai ===
# noi:phong_ke_toan # dieu_kien:minigame_san_hoa_don_truot
_Bạn duyệt nhầm hóa đơn quán bida "họp dự án" của {chua_te_deadline}. Hóa đơn ghi "2 giờ sáng, 6 bia, 1 bàn lỗ"._
~ kt_quy(-3)
~ kt_ngu(3)
chua_te_deadline: *(nhắn)* Cảm ơn chị nha. Họp hiệu quả lắm.
_Bạn nhìn tin nhắn rất lâu. Rồi viết vào sổ: "Học phí: 3 triệu."_
-> END

// ============ 💸 BẢNG LƯƠNG NGÀY 10 ============
=== ke_toan_mg_bang_luong_mo_dau ===
# noi:phong_ke_toan # gio:09:00 # dieu_kien:luong_ve_tre
_Bảng lương 21 người. Tiền đã về nhưng ngân hàng chỉ cho chuyển từng đợt. Ai trước, ai sau, ai được ứng?_
_Mỗi người có một thanh "độ bực" tăng dần theo giờ trên group Zalo-lô. {hong_hot} đã đỏ 80%._
* [📋 Xếp theo hoàn cảnh: người khó trước.]
    ke_toan: {thuc_tap_sinh}, Bác {bac_bao_ve}, {idol_het_thoi} trước. Rồi tới mấy đứa thuê nhà.
* [🔤 Xếp theo bảng chữ cái. Công bằng tuyệt đối.]
    ke_toan: Bảng chữ cái. Không ai cãi được bảng chữ cái.
- -> END

=== ke_toan_mg_bang_luong_thanh_cong ===
# noi:phong_ke_toan # dieu_kien:minigame_bang_luong_dat
_15:42. Người cuối cùng nhận lương. Không ai nổ. Thanh bực của {hong_hot} dừng ở 99%._
~ tien_cong(500000)
hong_hot: *(bưng lên một ly trà sữa)* Chị ơi, cả phòng mời chị "chuộc lỗi" vì hồi sáng lỡ gọi chị là nữ hoàng lương trễ.
~ uong(30)
~ cang_thang(-10)
~ qh("hong_hot", 10)
~ kt_ngu(-5)
-> END

=== ke_toan_mg_bang_luong_that_bai ===
# noi:phong_ke_toan # dieu_kien:minigame_bang_luong_truot
_14:10. {sales} nổ. Một tin nhắn 400 chữ trên group công ty, kết thúc bằng "SAO MÀ CĂNG VẬY"._
_Mười phút sau, trong group "Hội Anti Sếp", bạn có biệt danh mới: "Bà Chúa Chuyển Khoản Chậm"._
~ qh("sales", -10)
~ qh("hong_hot", -5)
~ kt_ngu(5)
~ cang_thang(10)
-> END

// ============ ✍️ BA CHỮ KÝ ============
=== ke_toan_mg_ba_chu_ky_mo_dau ===
# noi:tang_2 # gio:13:30 # dieu_kien:can_but_bi
_Đơn mua một hộp bút bi, 45.000đ. Cần đủ ba chữ ký trước 17:30: {giam_doc} (đang đánh golf trên sân thượng), {truong_phong} (đang họp), và người đề xuất {thuc_tap_sinh} (đang đi mua bánh chuối chiên)._
{ kt_chu_ky > 0:
    _Bạn đã có {kt_chu_ky} chữ ký. Còn lại đi săn._
}
* [🏃 Chạy lên sân thượng trước.]
    ke_toan: Sếp ơi, ký giùm em. Đứng yên. Đừng đánh.
* [📅 Gõ cửa phòng họp trước.]
    truong_phong: Vâng chị ơi, em sync nhanh 5 phút rồi ký ạ.
- -> END

=== ke_toan_mg_ba_chu_ky_thanh_cong ===
# noi:phong_ke_toan # dieu_kien:minigame_ba_chu_ky_dat
_17:12. Đủ ba chữ ký: một cái dính cỏ nhựa, một cái viết trên slide số 23, một cái dính dầu bánh chuối chiên._
~ kt_co_but_bi = true
~ kt_chu_ky = 3
~ tien_cong(150000)
~ kt_keo(5)
thuc_tap_sinh: Dạ chị ơi, em ký có đúng chỗ không ạ? Em ký ba lần cho chắc ạ.
_Hộp bút bi về tay. Mười cây. Bạn dán nhãn từng cây: "Bút kế toán – KHÔNG MƯỢN"._
-> END

=== ke_toan_mg_ba_chu_ky_that_bai ===
# noi:phong_ke_toan # dieu_kien:minigame_ba_chu_ky_truot
_17:31. Thiếu chữ ký của {truong_phong}. Cuộc họp "5 phút" vẫn chưa xong._
~ kt_ngu(3)
_Đơn mua bút bi chuyển sang ngày mai. Bạn viết bằng cây bút bi cuối cùng, sắp hết mực._
-> END

// ============ 🛒 CHỢ PHỐ CŨ MẶC CẢ ============
=== ke_toan_mg_cho_mac_ca_mo_dau ===
# noi:cho_pho_cu # gio:05:00 # dieu_kien:mua_do_lien_hoan
_5 giờ sáng. Chợ Phố Cũ vừa thắp đèn. Bạn cầm danh sách đồ liên hoan và một xấp tiền mặt có ghi chú từng khoản._
co_ban_hang: Ủa con nhỏ kế toán! Nay mua gì mà sớm dữ vậy con?
_Mỗi cô có một điểm yếu riêng: cô bán thịt thích được khen con gái học giỏi, cô bán rau sợ bị chê héo, cô bán trái cây thua khi người ta giả vờ bỏ đi…_
* [😇 Bắt đầu bằng lời khen.]
    ke_toan: Cô ơi, nghe nói bé nhà cô thi được giải nhất Toán hả cô?
* [🚶 Bắt đầu bằng chiêu giả vờ đi.]
    ke_toan: Dạ thôi để con coi sạp bên kia…
- -> END

=== ke_toan_mg_cho_mac_ca_thanh_cong ===
# noi:cho_pho_cu # dieu_kien:minigame_cho_mac_ca_dat
_Năm cô bán hàng, năm lần thắng. Tổng hóa đơn ít hơn dự toán gần một phần tư. Cô bán xôi dúi vào tay bạn một gói xôi đậu xanh và một bịch kẹo gừng._
co_ban_hang: Cho con nhỏ khéo mua nè. Lấy chồng thì nhớ mời cô nha.
~ an(35)
~ kt_keo(3)
~ cang_thang(-10)
_Tiết kiệm được 4 triệu so với dự toán. Hóa đơn tay, đủ chữ ký của năm cô. Năm chữ ký, nhiều hơn đơn mua bút bi._
* [🧾 Ghi đủ 4 triệu tiết kiệm vào Quỹ Công Ty.]
    ~ kt_quy(4)
* {not kt_quy_den_nop} [🗄️ Ghi dự toán cũ vào sổ công ty. Khoản dôi ra cất két.]
    ~ kt_cat_ket(4)
    _Bạn ghi khoản 4 triệu vào cuốn sổ tay riêng, kèm hóa đơn tay của năm cô. Không ai biết. Trừ cô bán xôi, người đang nhìn bạn đếm tiền._
    { RANDOM(1, 10) <= 2:
        ~ kt_them_dau_vet(1)
    }
- -> END

=== ke_toan_mg_cho_mac_ca_that_bai ===
# noi:cho_pho_cu # dieu_kien:minigame_cho_mac_ca_truot
_Bạn giả vờ đi. Cô bán trái cây để bạn đi thật. Bạn quay lại, giá tăng thêm 10 nghìn "phí quay lại"._
~ kt_quy(-1)
~ cang_thang(5)
co_ban_hang: Hôm nay con mệt hả? Mặt con xanh lè à.
-> END

// ============ 🗂️ THUẾ TỚI RỒI (22/10) ============
=== ke_toan_mg_thue_toi_roi_mo_dau ===
# ngay:22 # noi:phong_ke_toan # gio:08:35
_30 phút trước khi đoàn kiểm tra lên tầng 2. Mười năm hồ sơ, xếp trong 47 cái thùng giấy. Kéo từng xấp vào đúng năm, đúng loại._
thuc_tap_sinh: Dạ chị, em phụ chị một tay được không ạ?
_Chưa kịp trả lời, {thuc_tap_sinh} đã xếp xong năm 2019. Nhanh. Nhanh tới đáng ngờ. Như người từng làm ngân hàng._
cho: *(tha một xấp hồ sơ năm 2017 chạy ra cửa)*
* [🤝 "Duy, em làm năm 2016 tới 2020. Chị làm phần còn lại."]
    ~ qh("thuc_tap_sinh", 10)
    thuc_tap_sinh: Dạ em làm liền ạ!
* [🐕 "Tuất! Trả hồ sơ đây!" (Đuổi theo trước đã)]
    ~ nghi(-10)
- -> END

=== ke_toan_mg_thue_toi_roi_thanh_cong ===
# ngay:22 # noi:phong_ke_toan # dieu_kien:minigame_thue_toi_roi_dat
_8:59. Hồ sơ mười năm đứng thẳng tắp như hàng quân. Có nhãn, có màu, có số trang. Đúng lúc tiếng giày của đoàn kiểm tra vang ở cầu thang._
~ kt_qua_thue = true
~ tien_cong(2000000)
~ kt_ngu(-30)
~ cang_thang(-15)
chu_liem: *(đứng ở cửa, nhìn dãy hồ sơ)* … Ừm.
_Đó là tiếng "ừm" hài lòng nhất bạn từng nghe. {giam_doc} chuyển cho bạn 2 triệu thưởng nóng, kèm tin nhắn: "Có hóa đơn đây em."_
-> END

=== ke_toan_mg_thue_toi_roi_that_bai ===
# ngay:22 # noi:phong_ke_toan # dieu_kien:minigame_thue_toi_roi_truot
_Xấp hồ sơ năm 2017 vẫn nằm trong ổ của {cho}. Chú Liêm ghi biên bản: "Thiếu chứng từ năm 2017. Phạt hành chính."_
~ kt_bi_phat_thue = true
~ kt_quy(-200)
~ kt_ngu(15)
~ cang_thang(15)
_200 triệu. Bạn ký biên bản. Chữ ký run lần đầu tiên trong mười năm._
-> END

// ============ ☕ KIỂM KÊ PANTRY ============
=== ke_toan_mg_kiem_ke_pantry_mo_dau ===
# noi:pantry # gio:17:00 # dieu_kien:cuoi_tuan
_Chiều thứ 6. Đếm cà phê, đường, mì ly trong pantry. Đối chiếu sổ. Và điều tra một vụ án: hộp cơm ghi tên "Thương" trong tủ lạnh chung đã biến mất lúc 11:47._
* [🔍 Kiểm tra dấu vết: thìa, vỏ hộp, mùi.]
    ke_toan: Không có hóa đơn thì không có tiền. Không có hộp cơm thì phải có thủ phạm.
* [📋 Đếm hàng trước, điều tra sau.]
    ke_toan: Mì ly: sổ ghi 40, thực tế 31.
- -> END

=== ke_toan_mg_kiem_ke_pantry_thanh_cong ===
# noi:pantry # dieu_kien:minigame_kiem_ke_pantry_dat
_Sổ khớp tới từng gói đường. Và bạn tìm ra thủ phạm: vỏ hộp cơm trong thùng rác phòng server, cạnh 9 ly mì rỗng._
it: *(nhìn hộp cơm, nhìn bạn)* … Em tưởng của chung. Lỗi người dùng.
~ uong(20)
~ nghi(25)
~ qh("it", -3)
_Phần thưởng: một ly cà phê sữa đá {it} mua đền, và quyền dán thông báo lên bảng tin: "Ai lấy hộp cơm có ghi tên Thương, trả lại."_
-> END

=== ke_toan_mg_kiem_ke_pantry_that_bai ===
# noi:pantry # dieu_kien:minigame_kiem_ke_pantry_truot
_Sổ lệch 9 ly mì. Hộp cơm vẫn mất tích. Bạn ăn mì ly cho bữa tối._
~ an(25)
~ cang_thang(5)
_Lần đầu tiên trong mười năm, một khoản trong sổ bạn ghi: "Không rõ."_
-> END
