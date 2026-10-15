// ============================================================
// EDITOR CÚ ĐÊM: LĨNH · MINIGAME (mở đầu / thắng / thua)
// Game chạy minigame sau knot mở đầu, rồi gọi knot _thang hoặc _thua.
// ============================================================

// ============================================================
// ✂️ DỰNG MV
// ============================================================
=== editor_mg_dung_mv ===
# noi:phong_dung_phim
_Timeline trống. Nhạc nền 3 phút 40. Những vạch phách nhạc đứng thành hàng như hàng rào. Mỗi lần đổi cảnh phải rơi đúng một vạch._
truong_phong: *(nhắn Zalo-lô)* Em cho cảnh anh đứng chỉ tay nhé. Chỗ nào đẹp nhất ấy.
_Bạn bẻ khớp ngón tay. Kéo clip đầu tiên lên. Đêm bắt đầu._
-> END

=== editor_mg_dung_mv_thang ===
_Đổi cảnh trúng phách 95%. Cảnh {truong_phong} chỉ tay rơi đúng tiếng trống, như thể anh ấy ra lệnh cho cả bài hát._
~ tien_cong(300000)
~ nhan(tra_sua)
~ uy_tin = uy_tin + 5
{ ngay <= 9:
    ~ ed_mv_dung_phach = true
    ~ ed_mv_kip = true
- else:
    ~ follow(10000)
}
_Phần thưởng: 300.000đ và một ly trà sữa. {chua_te_deadline} tỉnh dậy trên sofa, xem bản dựng, rồi nói: "Ông là thánh." Rồi ngủ tiếp._
-> END

=== editor_mg_dung_mv_thua ===
_Lệch phách ở điệp khúc. Cảnh {truong_phong} chỉ tay rơi giữa hai nhịp, như người đang vẫy taxi._
~ tien_cong(150000)
~ cang_thang(10)
{ ngay <= 9:
    ~ ed_mv_dung_phach = false
    ~ ed_mv_kip = RANDOM(1, 10) <= 5
}
_Bạn biết nó lệch. Không ai khác biết. Đó là thứ khó chịu nhất của nghề này._
-> END

// ============================================================
// ⏳ ĐUA RENDER
// ============================================================
=== editor_mg_dua_render ===
# noi:phong_dung_phim
_Thanh render: 0%. Mí mắt bạn: 60% mở. Ai thua trước?_
_Trong lúc chờ: máy có thể treo, {truong_phong} có thể gọi họp, {chua_te_deadline} có thể gửi thêm "mấy clip nhỏ xíu thôi"._
-> END

=== editor_mg_dua_render_thang ===
_100%. Không treo. Không họp. {chua_te_deadline} gửi thêm clip lúc 98%, bạn bỏ vào bản sau. Lần đầu tiên bạn thắng cái thanh tiến trình._
~ tien_cong(200000)
~ nhan(nuoc_tang_luc)
~ uy_tin = uy_tin + 2
_Phần thưởng: 200.000đ và một lon nước tăng lực "Trâu Cụng". Uống vào tỉnh như sáo, nhưng đêm trắng thì vẫn là đêm trắng._
-> END

=== editor_mg_dua_render_thua ===
_99%. "Lỗi xuất file." Bạn nhìn con số 99 rất lâu, như nhìn một người quen._
~ ed_loi_99 = ed_loi_99 + 1
~ nghi(-15)
~ cang_thang(10)
{ ed_loi_99 >= 5:
    _Lần thứ năm. Bạn không còn giận nữa. Bạn và con số 99 đã thành bạn bè._
}
-> END

// ============================================================
// 🎨 CỨU MÀU
// ============================================================
=== editor_mg_cuu_mau ===
# noi:phong_dung_phim
_Ba thanh trượt: SÁNG, TƯƠNG PHẢN, MÀU. Bên cạnh là ảnh mẫu: bộ đồ hồng chuẩn "hồng {sieu_nhan_hong}"._
_Kéo lệch một chút: hồng chả lụa. Kéo quá tay: {sieu_nhan_hong} thành búp bê nhựa._
-> END

=== editor_mg_cuu_mau_thang ===
_Hồng sang. Không chả lụa, không búp bê. {sieu_nhan_hong} xem bản chỉnh màu, ôm ngực: "Trời ơi, anh hồng đẹp vậy hả?"_
~ tien_cong(150000)
~ uy_tin = uy_tin + 5
~ qh("sieu_nhan_hong", 5)
-> END

=== editor_mg_cuu_mau_thua ===
_Hồng chả lụa. Rõ ràng là chả lụa. {hong_hot} đăng lên, bình luận đầu tiên: "Siêu Nhân Giò Lụa"._
~ follow(-3000)
~ cang_thang(5)
hong_hot: Ủa… tui thấy cũng… ngon mắt mà.
-> END

// ============================================================
// 💬 PHỤ ĐỀ ĐÊM KHUYA
// ============================================================
=== editor_mg_phu_de ===
# noi:pantry
_{thuc_tap_sinh} gõ phụ đề. Bạn soát. Video chạy, lỗi bay qua màn hình như ruồi: "Siêu Nhân Hông", "Hồng không phải mầu", "Thích ăn chuối chiêng"._
thuc_tap_sinh: Dạ… em gõ nhanh quá nên hơi sai ạ. Anh bắt giúp em nha.
-> END

=== editor_mg_phu_de_thang ===
_Bắt đủ. Không sót lỗi nào. {thuc_tap_sinh} nhìn bạn như nhìn thầy giáo._
~ tien_cong(100000)
~ nhan(mi_ly)
~ an(25)
~ ed_loi_phu_de = ed_loi_phu_de + 5
~ qh("thuc_tap_sinh", 5)
thuc_tap_sinh: Dạ em pha mì cho anh nè! Mì ly, em chế thêm trứng!
-> END

=== editor_mg_phu_de_thua ===
_Sót một lỗi. Video lên sóng với dòng "Siêu Nhân Hông". Ba tiếng sau, nó thành meme._
~ follow(2000)
~ cang_thang(5)
~ ed_loi_phu_de = ed_loi_phu_de + 3
thuc_tap_sinh: Dạ… em xin lỗi anh. Mà… mọi người cười nhiều ghê ạ.
-> END

// ============================================================
// 🧩 CỨU FOOTAGE
// ============================================================
=== editor_mg_cuu_footage ===
# noi:phong_server
_Phòng server. {it} ngồi một bên, bạn ngồi một bên, {chua_te_deadline} đứng giữa như bị cáo. Mấy chục clip hỏng, xước, cụt._
it: Cái nào còn cứu được thì kéo sang trái. Cái nào hết cứu thì bỏ. Đừng tiếc.
-> END

=== editor_mg_cuu_footage_thang ===
_Ghép lại được đủ một bản nghiệm thu: logo khách hàng, cảnh quay, ngày giờ trên metadata. Đủ để đoàn kiểm tra gật đầu._
~ uy_tin = uy_tin + 5
~ qh("chua_te_deadline", 10)
~ qh("it", 5)
~ ed_phieu_com = ed_phieu_com + 5
chua_te_deadline: Một tuần cơm trưa. Năm phiếu cơm tấm. Tui giữ lời. Thiệt.
_Phần thưởng: năm phiếu cơm tấm của cô Năm. Cô Năm hỏi "Thêm chả hông con?" năm lần._
-> END

=== editor_mg_cuu_footage_thua ===
_Một nửa cứu được, một nửa thành khung hình đen. Không đủ làm bằng chứng nghiệm thu._
~ tien_cong(400000)
~ cang_thang(10)
~ qh("chua_te_deadline", 3)
chua_te_deadline: *(đưa phong bì)* Bốn trăm nghìn. Tiền công. Còn chuyện kia… tui tự lo. Lần này tui tự lo.
-> END

// ============================================================
// 📺 ĐÊM CỦA CÚ
// ============================================================
=== editor_mg_dem_cua_cu ===
# noi:can_701
_Căn 701. Cuối tuần. Kênh "Cú Đêm Cắt Ghép" chờ video mới. Chọn chủ đề:_
* [😂 Meme: cắt ghép cảnh đời thường thành phim hành động.]
    ~ ed_lo(2)
* [🎓 Hướng dẫn dựng phim: "Cắt đúng nhịp trong 5 phút".]
    _Ở đâu đó trong Phố Mới, một người tên {truong_phong} đang xem video này mỗi đêm. Bạn không biết. Anh ấy cũng không biết bạn._
* [🏢 "Đời văn phòng": dễ viral, nhưng dễ lộ danh tính.]
    ~ ed_lo(15)
- ~ ed_thuc_dem()
-> END

=== editor_mg_dem_cua_cu_thang ===
_Video lên lúc 3 giờ sáng. Tới trưa: nửa triệu lượt xem. Con cú đeo tai nghe được người ta vẽ lại làm fan art._
~ tien_cong(2000000)
~ ed_sub_cong(20000)
_Phần thưởng: 2.000.000đ tiền quảng cáo và hai mươi nghìn người đăng ký mới. Không ai biết con cú đang ngáp ở căn 701._
-> END

=== editor_mg_dem_cua_cu_thua ===
_Video lên. Thuật toán không thương. Mười nghìn lượt xem, ba bình luận, một bình luận là "Cú ơi ngủ đi"._
~ tien_cong(500000)
~ ed_sub_cong(2000)
-> END
