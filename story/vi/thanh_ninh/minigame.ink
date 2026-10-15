// ============================================================
// THÁNH NỊNH: NHI · THOẠI MINIGAME
// Mỗi minigame có 3 cảnh: mở đầu, thành công, thất bại.
// ============================================================

// ============================================================
// 🍵 PHA TRÀ THEO MOOD
// ============================================================
=== thanh_ninh_mg_pha_tra ===
# dieu_kien:minigame_pha_tra_mo_dau
_Cửa phòng mở. Sếp bước vào. Bạn có 10 giây để đọc mặt sếp: vui, lo, say, sợ chị {chi_dai}, vừa đọc group anti sếp, hay vừa gọi ngân hàng._
_Chọn trà, độ nóng, và một câu nói kèm theo. Trà sen cho ngày lo. Trà gừng cho ngày say. Trà đá cho ngày vừa gặp chị {chi_dai}._
giam_doc: *(ngồi xuống, thở ra một hơi rất dài)* …
-> END

=== thanh_ninh_mg_pha_tra_thanh_cong ===
# dieu_kien:minigame_pha_tra_thanh_cong
giam_doc: *(uống một ngụm, vai hạ xuống)* … Ừ. Đúng cái anh cần.
_Sếp dúi vào tay bạn 80.000đ "tiền trà". Lần nào cũng đúng 80.000đ, gấp làm tư._
~ tn_ninh(5)
~ tien_cong(80000)
~ tn_sep_goi("nhi")
_Ấm trà còn dư một ly. Trà sen. Bạn ngồi xuống ghế trợ lý, uống chậm._
~ uong(30)
~ cang_thang(-10)
-> END

=== thanh_ninh_mg_pha_tra_that_bai ===
# dieu_kien:minigame_pha_tra_that_bai
_Bạn đặt ly trà gừng nóng hổi xuống, kèm câu: "Hôm nay trông anh rạng rỡ quá anh ơi!"_
giam_doc: *(nhìn ly trà, nhìn bạn)* Anh vừa nói chuyện với ngân hàng xong, em ạ.
_Đoán sai mood. Nịnh lạc đề. Sếp đẩy ly trà sang một bên._
~ tn_ninh(-3)
~ cang_thang(5)
-> END

// ============================================================
// 📅 SẮP LỊCH SẾP
// ============================================================
=== thanh_ninh_mg_sap_lich ===
# dieu_kien:minigame_sap_lich_mo_dau
_Bảng lịch tuần của sếp. Các mảnh cần xếp: golf, gặp đối tác, họp "5 phút" của {truong_phong}, Ngân hàng Tín Dụng Đen Đủi, và "lịch trốn chị {chi_dai}"._
_Quy tắc vàng: lịch ngân hàng phải ghi tên giả "Gặp đối tác chiến lược". Không được để hai thứ trùng giờ. Không được để chị {chi_dai} thấy sếp rảnh._
-> END

=== thanh_ninh_mg_sap_lich_thanh_cong ===
# dieu_kien:minigame_sap_lich_thanh_cong
_Lịch kín mà không chồng chéo. Ngân hàng nằm gọn trong ô "Gặp đối tác chiến lược" sáng thứ 6, giữa golf và họp._
giam_doc: Gọn quá! Nhi xếp lịch như đánh cờ ấy.
~ tien_cong(150000)
~ tn_email(1)
~ tn_ninh(3)
_Cuối tuần, sếp đặt lên bàn bạn một hộp bánh pía: "Ăn lấy sức, tuần này em vất vả"._
~ tn_co_banh_pia = true
~ an(20)
-> END

=== thanh_ninh_mg_sap_lich_that_bai ===
# dieu_kien:minigame_sap_lich_that_bai
_Lịch bị trùng: 10 giờ thứ 6, sếp vừa có golf vừa có "đối tác chiến lược". Tệ hơn, bạn quên đổi tên: ô lịch chung ghi rõ "Ngân hàng Tín Dụng Đen Đủi – giãn nợ"._
truong_phong: *(nhìn lịch chung)* Ơ, giãn nợ là dự án gì thế em? Mình có cần họp không?
_Bạn sửa lịch trong 3 giây. {truong_phong} đã kịp chụp màn hình để "take note"._
~ tn_ninh(-4)
~ cang_thang(10)
-> END

// ============================================================
// ✍️ VIẾT BÀI PHÁT BIỂU
// ============================================================
=== thanh_ninh_mg_bai_phat_bieu ===
# dieu_kien:minigame_bai_phat_bieu_mo_dau
_Điền vào chỗ trống: một từ khóa "truyền lửa", một từ tiếng Anh, một câu kể chuyện khởi nghiệp. Mỗi bài có giới hạn thời gian đọc._
{ ngay == 13:
    _Hôm nay là bài đặc biệt: đúng 15 phút. Không hơn, không kém. {chi_dai} đứng cuối phòng, khoanh tay, cầm bút._
}
-> END

=== thanh_ninh_mg_bai_phat_bieu_thanh_cong ===
# dieu_kien:minigame_bai_phat_bieu_thanh_cong
~ tien_cong(200000)
~ tn_ninh(10)
{ ngay == 13:
    _14 phút 59 giây… 15 phút 00 giây. Bạn đọc chữ cuối cùng đúng khi kim giây chạm số 12._
    _Cả phòng vỗ tay. Sếp đứng dậy, mắt long lanh, ôm bó hoa hồng tự tặng mình rồi… đưa cho bạn._
    giam_doc: Em giữ đi. Anh có hoa rồi. Anh có… em đọc bài rồi.
    ~ tn_dung_15_phut = true
    ~ tn_co_hoa_sep = true
    ~ tn_sep_goi("nhi")
    _Ở cuối phòng, {chi_dai} đếm xong: 23 lần chữ "tâm"._
    ~ tn_gian(5)
- else:
    giam_doc: Hay! Có lửa! Có tiếng Anh! Có anh!
    ~ tn_sep_goi("nhi")
}
-> END

=== thanh_ninh_mg_bai_phat_bieu_that_bai ===
# dieu_kien:minigame_bai_phat_bieu_that_bai
{ ngay == 13:
    _Phút thứ 9, bạn lật nhầm hai trang. Phút thứ 11, bạn đọc nhầm câu "biển nợ" trong ghi chú cá nhân. Phút thứ 17, vẫn chưa hết._
    _Cả phòng ngáp. {thuc_tap_sinh} ngủ gật, đầu gõ xuống bàn "cốp"._
    chi_dai: *(cuối phòng, không cần nói to)* Hai mươi ba chữ "tâm". Mười bảy phút.
    ~ tn_gian(10)
- else:
    giam_doc: Ờ… hơi dài em ạ. Mà câu tiếng Anh "We are one family-ly" là gì thế?
}
~ tn_ninh(-3)
~ cang_thang(10)
-> END

// ============================================================
// ⛳ ĐẶT SÂN GOLF
// ============================================================
=== thanh_ninh_mg_dat_san_golf ===
# dieu_kien:minigame_dat_san_golf_mo_dau
_Ba cuộc gọi: sân golf, nhà hàng, và dự báo thời tiết. Phải mặc cả giá, chọn giờ không mưa, và nhớ: đối tác nào ăn chay._
nv_san_golf: Dạ sân Đồi Xanh xin nghe. Cuối tuần giá cuối tuần ạ, chị.
-> END

=== thanh_ninh_mg_dat_san_golf_thanh_cong ===
# dieu_kien:minigame_dat_san_golf_thanh_cong
_Sân đặt lúc 7 giờ, trước cơn mưa 10 giờ. Nhà hàng có món chay cho "đối tác chiến lược". Giá giảm 15% nhờ bạn khen giọng chị lễ tân "nghe như MC đài"._
~ tien_cong(100000)
~ tn_co_phieu_buffet = true
~ uong(30)
~ tn_ninh(3)
giam_doc: Chuẩn! Không mưa! Nhi gọi điện có tâm thật.
_Sân golf tặng bạn một phiếu ăn buffet trưa và một chai nước dừa. Nước dừa ngọt. Bạn uống hết trước khi sếp đổi ý._
-> END

=== thanh_ninh_mg_dat_san_golf_that_bai ===
# dieu_kien:minigame_dat_san_golf_that_bai
_Sân đặt lúc 10 giờ. 10 giờ 02, mưa như trút. Nhà hàng dọn ra đĩa bò lúc lắc cho vị đối tác ăn chay trường._
giam_doc: *(nhắn)* Nhi. Đối tác ăn chay mà em.
_Bạn nhìn ghi chú: "đối tác ăn chay" nằm ngay dưới dòng "sếp ghét hành"._
~ tn_ninh(-4)
~ cang_thang(8)
-> END

// ============================================================
// 📧 LỌC HỘP THƯ
// ============================================================
=== thanh_ninh_mg_loc_hop_thu ===
# dieu_kien:minigame_loc_hop_thu_mo_dau
_20 email bay vào. Kéo vào 4 ô: Quan trọng, Rác, Ngân hàng (ẩn khỏi màn hình chính), và "Để sếp tự đọc"._
_Thỉnh thoảng có email màu xanh lá chuối lẫn vào._
-> END

=== thanh_ninh_mg_loc_hop_thu_thanh_cong ===
# dieu_kien:minigame_loc_hop_thu_thanh_cong
_Hộp thư sạch bong. Màn hình chính của sếp chỉ còn 3 email: lời chúc của một đối tác, một bản báo cáo của {truong_phong}, và quảng cáo gậy golf._
_Thư mục "Ngân hàng" dày thêm._
~ tien_cong(120000)
~ tn_email(2)
_Giữa đống email có một email lạ: "LL-Entertainment: Gửi anh Thắng, chúng tôi rất ngưỡng mộ…"._
* [🗑️ Xóa luôn, không đọc.]
    ~ tn_xanh(-3)
* [🟢 Đọc hết, rồi mới xóa.]
    ~ tn_email(1)
    ~ tn_xanh(5)
    _Email kết thúc bằng câu: "Nếu G-Entertainment cần người đỡ bớt gánh nặng nhân sự, LL luôn rộng cửa." Bạn đọc chữ "nhân sự" thành chữ "Nhi"._
- -> END

=== thanh_ninh_mg_loc_hop_thu_that_bai ===
# dieu_kien:minigame_loc_hop_thu_that_bai
_Bạn kéo nhầm email "THÔNG BÁO QUÁ HẠN" vào ô "Quan trọng". Nó nằm trên cùng màn hình chính của sếp, chữ đỏ._
_9 giờ 30, sếp mở máy. Qua vách kính, bạn thấy sếp ngồi im 4 phút._
~ tn_ninh(-5)
~ tn_email(1)
~ cang_thang(10)
-> END

// ============================================================
// 🎁 MUA QUÀ THAY SẾP
// ============================================================
=== thanh_ninh_mg_mua_qua ===
# dieu_kien:minigame_mua_qua_mo_dau
{ ngay == 23:
    _Quà sinh nhật cho {sieu_nhan_hong}, thay mặt công ty. Phong bì: 500.000đ. Phải có màu hồng. Phải "xịn". Phải vừa túi tiền một ông giám đốc đã ba tháng không nhận lương._
- else:
    _Quà 20/10 cho 7 chị em: {ke_toan}, {chi_dai}, {hong_hot}, {bien_kich}, {designer}, {sales}… và chính bạn. Phong bì: 2.100.000đ._
    _Mua giống nhau thì bị chê. Mua khác nhau thì drama "ai được quà xịn hơn"._
}
-> END

=== thanh_ninh_mg_mua_qua_thanh_cong ===
# dieu_kien:minigame_mua_qua_thanh_cong
{ ngay == 23:
    _Một chiếc gối ôm hình chuối chiên màu hồng và một hộp bánh chuối chiên làm riêng. {sieu_nhan_hong} ôm cái gối, im lặng rất lâu dưới chiếc mũ._
    ~ qh("sieu_nhan_hong", 10)
- else:
    _Bảy món quà khác nhau, cùng một kiểu gói. Không ai được hơn ai. Riêng quà của bạn: một hũ trà sen. Rẻ nhất trong bảy._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
}
giam_doc: Khéo! Em mua khéo thật. Đây, anh thưởng.
~ tien_cong(200000)
~ tn_co_son_mau_thu = true
~ tn_ninh(4)
_Sếp đưa thêm một thỏi son mẫu thử đối tác biếu. Màu "Hồng Thái Độ"._
-> thanh_ninh_mg_mua_qua_tien_thoi

=== thanh_ninh_mg_mua_qua_that_bai ===
# dieu_kien:minigame_mua_qua_that_bai
{ ngay == 23:
    _Bạn mua một chiếc khăn lụa xanh lá chuối vì "đang giảm giá". {sieu_nhan_hong} cầm khăn, cười gượng. Điều khoản số 2: phải có màu hồng._
    ~ qh("sieu_nhan_hong", -5)
- else:
    _Quà của bạn là túi xách. Quà của {chi_dai} là móc khóa. {hong_hot} đăng ảnh so sánh lên group trong 4 phút._
    chi_dai: Nhi. Móc khóa hả. Ừ.
    ~ tn_gian(15)
}
~ tn_ninh(-3)
-> thanh_ninh_mg_mua_qua_tien_thoi

=== thanh_ninh_mg_mua_qua_tien_thoi ===
_Trong túi còn tiền thối. Hóa đơn ghi rõ con số._
* [💰 Giữ tiền thối. Sếp không hỏi đâu.]
    ~ tien_cong(150000)
    ~ tn_giu_tien_thoi = true
    { RANDOM(1, 10) <= 3:
        ke_toan: *(chìa hóa đơn)* Nhi. 150.000đ tiền thối đâu em?
        ~ qh("ke_toan", -15)
        ~ tn_ninh(-5)
        ~ tien_cong(-150000)
    }
* [😇 Trả lại sếp từng đồng, kẹp hóa đơn.]
    giam_doc: Ơ… em trả lại à? Ừ… cảm ơn em.
    ~ qh("giam_doc", 5)
    ~ qh("ke_toan", 5)
- -> END
