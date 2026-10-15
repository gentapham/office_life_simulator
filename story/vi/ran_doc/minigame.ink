// ============================================================
// MINIGAME CỦA RẮN ĐỘC
// Mỗi minigame có 3 cảnh: mở đầu (_mg_<tên>), thắng (_thang), thua (_thua).
// Game chạy minigame sau cảnh mở đầu, rồi mở cảnh thắng hoặc thua.
// ============================================================

// ------------------------------------------------------------
// 📰 BẢN TIN THỨ 2
// ------------------------------------------------------------
=== ran_doc_mg_ban_tin ===
# minigame:ban_tin # noi:ban_lam_viec
_Bản Tin Thứ 2. Ghép các mẩu tin trong tuần thành một trang. Mỗi ô một tin. Ô to nhất ở giữa._
truong_phong: Nhớ nhé: một chút hồng, một câu chuyện cảm hứng, và không có gì làm sếp buồn.
_Trong sổ tay có tin an toàn ("Máy pha cà phê đã sửa") và tin cay ("Ai là người ăn vụng hộp cơm trong tủ lạnh?")._
* [😇 Chọn toàn tin an toàn.]
    ~ rd_mg_ban_tin_cay = false
    _Bản tin hiền như cái gối. Không ai bàn tán. Không ai bị tổn thương._
* [🌶️ Chèn một tin cay vào ô giữa.]
    ~ rd_mg_ban_tin_cay = true
    _Ô giữa: "Tủ lạnh tầng 1: hộp cơm dán nhãn mất tích lần thứ 6. Nghi phạm có đeo kính đen trong nhà."_
- -> END

=== ran_doc_mg_ban_tin_thang ===
# minigame:ban_tin # ket_qua:thang
~ rd_so_ban_tin = rd_so_ban_tin + 1
~ tien_cong(150000)
~ uy_tin = uy_tin + 5
{ rd_mg_ban_tin_cay:
    _Bản tin lên lúc 16:58. Tới 17:10, cả tầng 1 đã đọc xong. Ai cũng liếc về phía người đeo kính đen._
    idol_het_thoi: *(gỡ kính)* Ai viết cái này? Em biết anh là ai không?
    hong_hot: Ối dồi ôi, bản tin nội bộ mà cay hơn confession luôn!
    ~ rd_tung_tin(8, 5)
    ~ qh("idol_het_thoi", -5)
    ~ qh("hong_hot", 5)
- else:
    truong_phong: Gọn, sạch, đúng giờ. Cái này mình take note làm mẫu nhé.
    ~ qh("truong_phong", 5)
    ~ rd_tin(3)
    ~ rd_nghi(-5)
}
_150.000đ vào tài khoản. Ai cũng đọc bản tin. Không ai biết người viết đang nghĩ gì._
-> END

=== ran_doc_mg_ban_tin_thua ===
# minigame:ban_tin # ket_qua:thua
_Bạn ghép nhầm ảnh: ô "Gương mặt nhân viên tiêu biểu" là ảnh {cho} đang ngủ. Ô "Lời sếp" là ảnh {giam_doc} đang ngáp._
truong_phong: Ơ… ai duyệt cái này thế? Tớ duyệt à? Tớ không nhớ đã duyệt.
giam_doc: Anh không giận. Anh chỉ… nhớ.
~ uy_tin = uy_tin - 5
~ qh("giam_doc", -3)
~ cang_thang(8)
{ rd_mg_ban_tin_cay:
    _Còn tin cay ở ô giữa thì không ai để ý, vì ai cũng đang cười cái ảnh {giam_doc} ngáp. Ít ra cũng có cái lợi._
- else:
    _Ít ra {cho} được lên bản tin. {cho} không biết đọc nhưng chắc là vui._
    ~ qh("cho", 3)
}
-> END

// ------------------------------------------------------------
// 🎂 TỔ CHỨC SINH NHẬT
// ------------------------------------------------------------
=== ran_doc_mg_sinh_nhat ===
# minigame:sinh_nhat
_Tổ Chức Sinh {truong_phong}. Gom tiền cả phòng, chọn bánh, xếp lịch hát sao cho người được chúc không biết trước._
_Mỗi người góp 50.000đ. {dan_dau_tu} hứa góp "tuần sau". {con_ong_chau_cha} đưa một tờ 500.000đ, bảo khỏi thối._
sales: Bánh phải 3 tầng! Tin chị đi, ảnh đăng lên mới sang!
ke_toan: Bánh 1 tầng. Có hóa đơn. Hết.
* [💬 Nghe {ke_toan}: bánh 1 tầng.]
    ~ qh("ke_toan", 5)
    ~ qh("sales", -2)
* [💬 Nghe {sales}: bánh 3 tầng.]
    ~ qh("sales", 5)
    ~ qh("ke_toan", -3)
- -> END

=== ran_doc_mg_sinh_nhat_thang ===
# minigame:sinh_nhat # ket_qua:thang
_Đèn tắt. Bánh ra. Cả phòng hát. Người được chúc giật mình thật sự, tay che miệng, mắt đỏ hoe._
hong_hot: Ai tổ chức vậy? Đỉnh nóc! Tui không đoán được luôn!
chi_dai: Thằng nhỏ {ran_doc} đó. Được việc.
~ nhan(banh_kem)
~ an(20)
~ rd_tin(5)
~ qh("chi_dai", 5)
~ qh("hong_hot", 5)
~ rd_nghi(-5)
{ ngay == 20:
    giam_doc: Sinh nhật công ty mà vui thế này thì anh… anh không ép, nhưng năm sau em lại lo nhé.
    ~ qh("giam_doc", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
}
_Bạn cầm miếng bánh, đứng ở góc phòng. Người tổ chức sinh nhật cho tất cả thì sinh nhật mình là 14/2. Chưa ai tặng gì bao giờ._
-> END

=== ran_doc_mg_sinh_nhat_thua ===
# minigame:sinh_nhat # ket_qua:thua
_Người được chúc bước vào sớm 2 phút, đúng lúc cả phòng đang cắm nến và tập hát. Bất ngờ thành… bất ổn._
hong_hot: Ủa alo? Sao vô sớm vậy? Ra ngoài đi vô lại đi!
_Rồi {cho} chạy ngang, liếm sạch tầng kem trên cùng._
cho: Gâu! *(mũi dính đầy kem)*
~ an(5)
~ cang_thang(10)
~ qh("cho", 5)
~ rd_tin(-3)
_Vẫn hát. Vẫn cắt bánh. Phần bánh còn lại có dấu răng chó. Ai cũng ăn phần không có dấu răng._
-> END

// ------------------------------------------------------------
// 💬 QUẢN TRÒ GROUP ZALO-LÔ
// ------------------------------------------------------------
=== ran_doc_mg_zalo ===
# minigame:zalo # noi:ban_lam_viec
_Quản Trò Group Zalo-lô công ty. Xóa tin spam, ghim thông báo của sếp, giữ group sạch sẽ._
_Tin spam: "Vay nhanh 5 phút", "Bán đất nền Ven Đô", "{dan_dau_tu}: Hồng Coin x100 vào ngay". Thông báo cần ghim: "Họp giao ban 8:30 thứ 2"._
_Cạnh đó là một tấm ảnh {hong_hot} vừa gửi nhầm vào group công ty thay vì group Anti Sếp: ảnh chế sếp đội nón lá._
* [😇 Ghim đúng thông báo, xóa ảnh chế trước khi sếp thấy.]
    ~ rd_mg_ghim_nham = false
    ~ qh("hong_hot", 10)
    hong_hot: *(nhắn riêng)* Ông cứu tui một mạng. Mai tui bao cơm tấm.
* [🐍 "Lỡ tay" ghim cái ảnh chế lên đầu group.]
    ~ rd_mg_ghim_nham = true
- -> END

=== ran_doc_mg_zalo_thang ===
# minigame:zalo # ket_qua:thang
~ tien_cong(100000)
{ rd_mg_ghim_nham:
    _Ảnh sếp đội nón lá nằm chễm chệ trên đầu group trong 47 phút. 22 người xem. 12 người thả "haha"._
    giam_doc: *(22:00)* Ai ghim ảnh đấy? Anh không giận. Anh hỏi thôi.
    _Bạn gỡ ghim, nhắn: "Dạ em lỡ tay ạ. Em xin lỗi anh." Kèm sticker cúi đầu. Ngọt như đường._
    ~ rd_do_doc = gioi_han(rd_do_doc + 10)
    ~ rd_tung_tin(0, 5)
    ~ qh("hong_hot", -10)
- else:
    _Group sạch bong. Thông báo họp ghim đầu. Không ai đi lạc phòng họp. Một ngày hiếm hoi._
    ~ uy_tin = uy_tin + 3
    ~ rd_nghi(-3)
}
_100.000đ tiền quản trò. Người giữ chìa khóa group là người biết mọi thứ._
-> END

=== ran_doc_mg_zalo_thua ===
# minigame:zalo # ket_qua:thua
_Bạn xóa nhầm. Không phải tin spam. Là tin {giam_doc} vừa gửi: "Anh đã duyệt thưởng nóng cho team MV"._
giam_doc: Tin của anh đâu? Anh vừa gửi mà?
dan_dau_tu: Hồng Coin x100 vào ngay! *(vẫn còn nguyên trên group)*
~ uy_tin = uy_tin - 3
~ cang_thang(5)
~ qh("giam_doc", -3)
_Tin spam còn, tin sếp mất. Đúng là quản trò kiểu "thao túng tâm lý" ngược._
-> END

// ------------------------------------------------------------
// 🧋 TRÀ SỮA THỨ 6
// ------------------------------------------------------------
=== ran_doc_mg_tra_sua ===
# minigame:tra_sua # noi:pantry
_Trà Sữa Thứ 6. Ghi order cả phòng: ai uống gì, bao nhiêu đường, bao nhiêu đá, topping gì._
hong_hot: 50% đường, ít đá, trân châu trắng.
designer: Không đường. Đừng hỏi.
thuc_tap_sinh: Dạ em uống gì cũng được ạ… à mà em xin ít ngọt ạ, em 30 tuổi rồi.
chua_te_deadline: Nhiều đá. Để trưa tui ngủ cho mát.
sieu_nhan_hong: Trà sữa dâu! Topping hồng! Hồng nhiều nhiều!
_Ghi nhớ. Đừng ghi nhầm. Đặc biệt đừng ghi nhầm cho người giữ quỹ phạt._
-> END

=== ran_doc_mg_tra_sua_thang ===
# minigame:tra_sua # ket_qua:thang
_Hai mươi mốt ly. Hai mươi mốt người. Không ai phải đổi ly._
designer: Ủa? Lần đầu có người nhớ tui không đường.
thuc_tap_sinh: Dạ đúng ít ngọt luôn ạ! Anh {ran_doc} giỏi quá ạ!
~ nhan(tra_sua)
~ uong(30)
~ cang_thang(-10)
~ qh("designer", 5)
~ qh("thuc_tap_sinh", 5)
~ rd_tin(3)
~ rd_nghi(-3)
{ nguoi_theo_doi > 0:
    _{hong_hot} chụp ảnh 21 ly trà sữa xếp hình trái tim hồng, đăng lên trang Siêu Nhân Hồng: "Team hậu trường của Hồng!"_
    ~ follow(3000)
}
-> END

=== ran_doc_mg_tra_sua_thua ===
# minigame:tra_sua # ket_qua:thua
_{designer} cầm ly 100% đường. {chua_te_deadline} cầm ly không đá. {sieu_nhan_hong} cầm ly trà sữa… matcha. Màu xanh lá chuối._
sieu_nhan_hong: Ủa… xanh hả em? Hông sao! Hồng là thái độ, xanh… cũng là thái độ!
designer: Tui giảm cân lần thứ 8 thất bại vì ông đó.
~ qh("designer", -5)
~ cang_thang(5)
~ uong(20)
_Không ai giận lâu. Trà sữa thứ 6 mà. Nhưng {designer} ghi nhớ. Designer nào cũng ghi nhớ._
-> END

// ------------------------------------------------------------
// 🖨️ CHẠY GIẤY TỜ
// ------------------------------------------------------------
=== ran_doc_mg_chay_giay ===
# minigame:chay_giay
_Chạy Giấy Tờ. Mang tài liệu giữa các phòng ban. Tầng trệt, tầng 1, tầng 2, chòi bảo vệ. Đừng đưa nhầm. Đừng làm rơi._
bac_bao_ve: Tờ này lên phòng kế toán. Tờ này cho cái cậu {it}. Còn tờ này… cho giám đốc. Đừng đọc.
_Mỗi cánh cửa đi qua là một cuộc nói chuyện dở dang. Tai rắn thì không bao giờ đóng._
-> END

=== ran_doc_mg_chay_giay_thang ===
# minigame:chay_giay # ket_qua:thang
~ tien_cong(50000)
~ rd_tin_mat()
~ rd_nghi(-3)
~ qh("bac_bao_ve", 5)
_Giao đủ, đúng người, đúng giờ. Đi ngang phòng kế toán, bạn nghe được một câu. Đi ngang phòng HR, nghe thêm một câu._
{ RANDOM(1, 3):
- 1:
    _"…quỹ còn đúng 2 tỷ…" Giọng {ke_toan}._
- 2:
    _"…danh sách đó anh chưa nộp đâu…" Giọng {hr}._
- 3:
    _"…anh {quan_ly_idol} mà đi thì ai lo cho ảnh…" Giọng {thanh_xin_nghi}, qua điện thoại._
}
bac_bao_ve: Ừ. Được việc. Uống miếng trà.
~ uong(20)
-> END

=== ran_doc_mg_chay_giay_thua ===
# minigame:chay_giay # ket_qua:thua
_Bạn đưa nhầm. Tờ "đặt cơm trưa 12 hộp" lên phòng giám đốc. Tờ "duyệt chi 12 triệu" xuống căn tin._
giam_doc: 12 hộp cơm á? Anh không ăn nhiều thế.
co_nam_com_tam: Ủa ai duyệt cho cô 12 triệu vậy con?
~ cang_thang(8)
~ uy_tin = uy_tin - 2
~ qh("ke_toan", -5)
_{ke_toan} phải đi lấy lại tờ duyệt chi ở căn tin. Lần đầu tiên chị chạy thang bộ nhanh như vậy._
-> END
