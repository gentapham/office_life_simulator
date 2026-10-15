// ============================================================
// DESIGNER · MINIGAME
// Mỗi minigame có 3 cảnh: _mo_dau (game mở minigame sau cảnh này),
// _thanh_cong và _that_bai (game gọi theo kết quả).
// ============================================================

// ============================================================
// 🖼️ SỬA THEO FEEDBACK
// ============================================================
=== designer_mg_sua_feedback_mo_dau ===
# noi:ban_thiet_ke # dieu_kien:mo_minigame_sua_feedback
_Một tin nhắn mới. Kèm một poster đã khoanh đỏ 9 chỗ._
{ RANDOM(1, 4):
- 1: truong_phong: Em làm cho nó sang mà rẻ nhé. Kiểu… sang nhưng nhìn vẫn bình dân ấy.
- 2: giam_doc: Hồng mà đừng hồng quá. Anh không ép, tùy em.
- 3: con_ong_chau_cha: Chữ to mà nhỏ thôi. Kiểu chill chill á.
- else: sieu_nhan_hong: Chị ơi, cho em thêm thái độ được hông? Thái độ hồng á.
}
_Bạn có 3 lượt gửi trước khi sếp nổi cáu. Kéo thả chữ, màu, ảnh. Đoán đúng ý người không biết mình muốn gì._
-> END

=== designer_mg_sua_feedback_thanh_cong ===
# noi:ban_thiet_ke # dieu_kien:thang_minigame_sua_feedback
~ tien_cong(150000)
~ nhan(ca_phe)
~ uong(15)
~ ds_sua(1)
~ uy_tin = uy_tin + 3
~ follow(3000)
{ RANDOM(1, 3) == 1:
    _Duyệt ngay lượt đầu! Sếp gõ đúng một chữ: "Ok". Bạn chụp màn hình lại làm bằng chứng cho hậu thế._
    ~ tien_cong(100000)
    ~ ds_toi(5)
- else:
    _Lượt gửi thứ hai thì được duyệt. Kèm câu: "Thấy chưa, sửa là đẹp liền!"_
}
{ RANDOM(1, 4) == 1:
    _Rồi sếp nhắn thêm: "Mà thôi, anh thấy bản đầu vẫn hơn." Bạn nhận được Huy Hiệu Bản Đầu Tiên._
    ~ ds_co_huy_hieu_ban_1 = true
    ~ cang_thang(-20)
}
_Nhận 150.000đ và một ly cà phê sữa đá. Cà phê sữa đá là tình yêu duy nhất không đòi sửa._
-> END

=== designer_mg_sua_feedback_that_bai ===
# noi:ban_thiet_ke # dieu_kien:thua_minigame_sua_feedback
_Lượt thứ 3. Sếp gõ: "Em ơi, anh nói rõ thế rồi mà…". Rồi thêm 4 dấu chấm. Bốn dấu chấm là dấu hiệu của bão._
~ ds_sua(3)
~ ds_toi(-3)
~ cang_thang(10)
~ uy_tin = uy_tin - 3
* [😶 Nhắn "Dạ em sửa lại ạ" rồi gục mặt xuống bàn.]
    ~ nghi(-5)
* [🎧 Đeo tai nghe, mở nhạc buồn.]
    ~ cang_thang(-5)
    _Bài hát buồn nhất trong playlist của bạn tên là "Bản Cuối". Nó cũng không phải bản cuối._
- -> END

// ============================================================
// 📱 THUMBNAIL TÓP-TÓP
// ============================================================
=== designer_mg_thumbnail_mo_dau ===
# noi:ban_thiet_ke # dieu_kien:mo_minigame_thumbnail
hong_hot: Bà ơi, thumbnail đi! Mặt sốc, chữ to, mũi tên đỏ, vòng tròn khoanh. 30 giây nha!
_Bí quyết: đủ giật để người ta bấm, nhưng đừng giật tới mức người ta chửi._
-> END

=== designer_mg_thumbnail_thanh_cong ===
# noi:ban_thiet_ke # dieu_kien:thang_minigame_thumbnail
~ tien_cong(100000)
~ follow(2000)
_Tỉ lệ bấm xem 12%! {hong_hot} hét lên trong group. Từ phòng chờ của {sieu_nhan_hong}, một đĩa bánh chuối chiên được gửi tới bàn bạn. Điều khoản số 4, phát huy tác dụng._
~ nhan(chuoi_chien)
~ an(15)
~ ds_toi(2)
hong_hot: Ối dồi ôi, thumbnail bà đỉnh nóc! Mặt anh {sieu_nhan_hong} sốc mà vẫn sang!
~ qh("hong_hot", 3)
-> END

=== designer_mg_thumbnail_that_bai ===
# noi:ban_thiet_ke # dieu_kien:thua_minigame_thumbnail
_Chữ "SỐC!!! SIÊU NHÂN HỒNG LÀM ĐIỀU NÀY VỚI CHÚ CHÓ" quá đà. Bình luận: "câu view", "tưởng gì", "hủy theo dõi"._
~ ds_giat_tit = ds_giat_tit + 1
~ follow(-2000)
{ ds_giat_tit >= 3:
    _Lần giật tít thứ {ds_giat_tit}. Dân mạng lập hẳn một bài tổng hợp "Fanpage Siêu Nhân Hồng toàn câu view"._
    ~ follow(-10000)
    ~ ds_giat_tit = 0
    ~ ds_toi(-5)
}
~ tien_cong(50000)
hong_hot: Thôi không sao bà. Mai giật nhẹ thôi. Giật kiểu thơ á.
-> END

// ============================================================
// 🖨️ PHA MÀU MÁY IN
// ============================================================
=== designer_mg_pha_mau_mo_dau ===
# noi:may_in_tang_1 # dieu_kien:mo_minigame_pha_mau
_Máy in tầng 1. Nó in hồng ra cam, in cam ra nâu, in nâu ra… một tờ giấy kẹt._
truong_phong: {designer} ơi, cứu anh với. Anh in tờ "Hồng Thái Độ" mà ra màu cháo lòng.
_Ba núm màu. Một bản mẫu. Máy kẹt giấy sau khoảng 40 giây._
-> END

=== designer_mg_pha_mau_thanh_cong ===
# noi:may_in_tang_1 # dieu_kien:thang_minigame_pha_mau
_Tờ in ra hồng đúng mã Hồng Thái Độ. Máy in rên một tiếng như vừa sinh nở._
truong_phong: Đỉnh thế! Trưa nay anh bao em cơm sườn nhé. Anh cũng sợ cái máy này lắm.
~ tien_cong(200000)
~ nhan(com_tam)
~ ds_co_cuon_decal_hong = true
~ qh("truong_phong", 5)
_Bạn nhận 200.000đ, một hộp cơm sườn và một Cuộn Decal Hồng còn sót trong ngăn kéo máy in._
-> END

=== designer_mg_pha_mau_that_bai ===
# noi:may_in_tang_1 # dieu_kien:thua_minigame_pha_mau
_Rắc. Giấy kẹt. Bản in ra màu tôm luộc để qua đêm._
it: *(xuất hiện từ hư không)* Tắt đi bật lại chưa?
~ cang_thang(8)
~ nghi(-5)
~ ds_sua(1)
* [😇 "Dạ chưa. Anh {it} làm giùm em được hông?"]
    ~ qh("it", 5)
    it: Lỗi người dùng. *(tắt, bật, máy chạy)*
* [😤 Đá nhẹ vào chân máy in.]
    _Máy in nhả ra 30 tờ trắng liên tục như trả thù._
    ~ cang_thang(5)
- -> END

// ============================================================
// 👗 MAY ĐỒ SIÊU NHÂN
// ============================================================
=== designer_mg_may_do_mo_dau ===
# noi:studio # dieu_kien:mo_minigame_may_do
sieu_nhan_hong: Chị ơi, em muốn bộ đồ mới! Hồng hơn, ngầu hơn, nhưng… mũ phải kín nha chị. Điều khoản số 1.
_Chọn chất liệu, độ hồng, kiểu mũ. {sieu_nhan_hong} sẽ thử đồ và trả lời bằng tạo dáng._
-> END

=== designer_mg_may_do_thanh_cong ===
# noi:studio # dieu_kien:thang_minigame_may_do
sieu_nhan_hong: *(xoay ba vòng, tạo dáng 7 kiểu)* Biến hình! Trời ơi, mặc vô thấy mình bay được luôn á!
~ tien_cong(300000)
~ ds_co_cuon_vai_hong = true
~ qh("sieu_nhan_hong", 10)
~ follow(8000)
~ ds_toi(3)
_Bạn nhận 300.000đ và Cuộn Vải Hồng còn dư. Để dành, biết đâu đêm 31/10 cần hóa trang._
-> END

=== designer_mg_may_do_that_bai ===
# noi:studio # dieu_kien:thua_minigame_may_do
_Đường may ở nách bung ra đúng lúc {sieu_nhan_hong} giơ tay "Biến hình!". Tiếng "roẹt" vang khắp studio._
sieu_nhan_hong: Ờm… vậy là… thoáng mát hơn hả chị?
~ qh("sieu_nhan_hong", 2)
~ ds_sua(2)
~ cang_thang(5)
~ tien_cong(100000)
-> END

// ============================================================
// 🥬 ALT-TAB THẦN SẦU
// ============================================================
=== designer_mg_alt_tab_mo_dau ===
# dieu_kien:mo_minigame_alt_tab
_Laptop thứ hai mở lên. Màn hình xanh lá chuối. Trong tai bạn, mọi tiếng bước chân đều trở thành tiếng sếp._
{ ds_huyen_canh_cua:
    _{sales} ngồi canh cửa. Có ai tới, nó ho. Tuần này bạn yên tâm hơn một chút._
}
_Bước chân, bóng người, tiếng {cho}: bấm Alt-Tab về file công ty đúng lúc._
-> END

=== designer_mg_alt_tab_thanh_cong ===
# dieu_kien:thang_minigame_alt_tab
~ ds_job_ll(800000)
~ ds_cam(-5)
~ nghi(-25)
{ ds_huyen_canh_cua:
    ~ ds_lo(-5)
- else:
    ~ ds_lo(5)
}
la_chuoi: Nhận file rồi em. Chuyển khoản liền. Em đúng là báu vật.
_800.000đ về ví. Nếu đang ở quán Sống Ảo, bạn còn được tặng một ly bạc xỉu vì "khách quen ngồi lâu nhất quán"._
~ nhan(ca_phe)
-> END

=== designer_mg_alt_tab_that_bai ===
# dieu_kien:thua_minigame_alt_tab
_Chậm nửa giây. Màn hình xanh lá chuối hiện ra đúng lúc có người đi ngang._
{ RANDOM(1, 3):
- 1: hong_hot: Ủa bà làm gì mà xanh lè vậy? Poster rau má hả?
- 2: it: *(liếc màn hình, không nói gì, đi tiếp)*
- else: cho: Gâu? *(đánh hơi balo bạn rất lâu)*
}
~ ds_lo(15)
~ cang_thang(10)
~ ds_cam(-3)
{ ds_do_lo >= 100:
    -> designer_tudo_lat_tay
}
_Bạn cười gượng: "File mẫu trên mạng thôi." Câu đó bạn đã nói bao nhiêu lần rồi?_
-> END

// ============================================================
// 🗂️ HỒ SƠ DEAL MA (cùng Huyền)
// ============================================================
=== designer_mg_deal_ma_mo_dau ===
# dieu_kien:mo_minigame_deal_ma
sales: Logo, slogan, ảnh trụ sở! Càng thật càng tốt. Mà chị nhớ nha, đừng xài logo của ai có thật.
_Bạn mở một file mới. Tên file: "khong phai gia, chi la chua co"._
-> END

=== designer_mg_deal_ma_thanh_cong ===
# dieu_kien:thang_minigame_deal_ma
_Hồ sơ năng lực hoàn hảo: trụ sở 40 tầng (ghép từ ảnh một tòa nhà không ai nhận ra), logo bánh tráng xoắn ốc, chữ ký chủ tịch bay bổng._
sales: Trời đất ơi, nhìn còn thật hơn công ty mình! Đi, Quán Ốc Đêm, em bao!
~ tien_cong(200000)
~ an(50)
~ cang_thang(-15)
~ qh("sales", 8)
_Ốc hương, ốc len xào dừa, sò điệp nướng mỡ hành. Bạn ăn như chưa từng được ăn. {sales} trả tiền bằng… tiền tạm ứng. Bạn quyết định không hỏi._
-> END

=== designer_mg_deal_ma_that_bai ===
# dieu_kien:thua_minigame_deal_ma
_Ảnh trụ sở ghép xong thì phát hiện góc dưới vẫn còn bảng hiệu "Tiệm Nail Lung Linh"._
sales: Thôi không sao, em nói đó là… chi nhánh làm đẹp của tập đoàn. Tin chị đi.
~ qh("sales", 2)
~ cang_thang(5)
~ an(20)
_{sales} vẫn bao bạn một dĩa ốc. Một dĩa thôi._
-> END
