// ============================================================
// CHỊ ĐẠI: HƯƠNG · MINIGAME (mở đầu / thành công / thất bại)
// Game chạy cảnh _mo_dau, rồi chơi minigame, rồi chạy
// _thanh_cong hoặc _that_bai theo kết quả.
// ============================================================

// ============================================================
// 📋 XẾP SƠ ĐỒ SỰ KIỆN
// ============================================================
=== chi_dai_mg_so_do_mo_dau ===
# noi:kho_su_kien
_Bản đồ sân khấu nhìn từ trên xuống. Sân khấu, loa, đèn, bàn ghế, lối thoát hiểm. Và một dòng chữ đỏ bạn tự viết lên đầu tờ giấy:_
_"LUẬT SỐ 1: LỐI ĐI CỦA SIÊU NHÂN HỒNG KHÔNG ĐƯỢC CẮT NGANG LỐI ĐI CỦA CON CHÓ."_
it: *(cắn mì ly)* Loa không đặt sát cột điện. Hú.
bac_bao_ve: Lối thoát hiểm để rộng ra, cháu. Người đông là chen nhau đấy.
_Kéo, thả, xoay. Nhớ: {sieu_nhan_hong} đi từ phòng chờ ra sân khấu. {cho} đi từ cổng tới chỗ xúc xích. Hai con đường không được gặp nhau._
-> END

=== chi_dai_mg_so_do_thanh_cong ===
_Sơ đồ hoàn hảo. Lối của {sieu_nhan_hong} vòng bên trái, lối của {cho} vòng bên phải, gặp nhau đúng một điểm: không có điểm nào._
it: Ổn. Không hú.
_{ke_toan} duyệt tiền thuê đồ không hỏi lại câu nào. {thuc_tap_sinh} mang tới một hộp cơm gà xối mỡ: "Dạ anh {it} gửi chị, ảnh nói chị vẽ đẹp ạ."_
~ tien_cong(200000)
~ cd_co_com_ga = true
~ an(40)
~ cd_td(5)
~ cd_uy(2)
-> END

=== chi_dai_mg_so_do_that_bai ===
_Lối đi của {sieu_nhan_hong} cắt ngang lối của {cho} đúng ngay chỗ bàn xúc xích. Trên giấy thì vô hại. Ngoài đời thì là chiến tranh._
it: *(chỉ vào giấy)* Chỗ này. Hú. Với cắn.
bac_bao_ve: Chỗ này thì bác cũng không giữ được nó đâu.
_Bạn xé tờ sơ đồ, vẽ lại từ đầu. Mất cả buổi chiều._
~ cd_td(-2)
~ cd_nk(5)
~ cd_met(5)
-> END

// ============================================================
// 📻 BỘ ĐÀM HỖN LOẠN
// ============================================================
=== chi_dai_mg_bo_dam_mo_dau ===
# noi:hien_truong
_Bộ đàm rè rè. Sáu giọng cùng lúc. Ba phút. Không ai đợi ai._
thuc_tap_sinh: *(bộ đàm)* Dạ chị ơi hết đá rồi ạ!
hong_hot: *(bộ đàm)* Chị ơi MC lạc! MC đang ở nhà vệ sinh tầng 2 hay sao á!
bac_bao_ve: *(bộ đàm)* {cho} vào rồi. Bác báo thế thôi.
it: *(bộ đàm)* Loa trái chập.
_Bộ đàm bên hông bạn nóng ran. Chọn đúng người, đúng việc. Đi!_
-> END

=== chi_dai_mg_bo_dam_thanh_cong ===
_Ba phút. Mười một sự cố. Mười một người xử lý. Không ai chạy nhầm chỗ._
_Bộ đàm im lặng lần đầu tiên trong buổi. Rồi một giọng vang lên, không biết của ai: "Rõ, chị Đại."_
_{thuc_tap_sinh} chạy tới, đưa bạn chai nước suối ướp lạnh, chai vẫn còn đọng hơi nước._
~ tien_cong(300000)
~ nhan(nuoc_suoi)
~ uong(20)
~ cd_uy(5)
~ cd_td(3)
-> END

=== chi_dai_mg_bo_dam_that_bai ===
_Bạn gửi {it} đi lấy đá, gửi {thuc_tap_sinh} đi sửa loa, gửi {hong_hot} đi tìm {cho}. Ba lần sai. Ba thảm họa nhỏ._
it: *(bộ đàm)* Bà. Tui ở tiệm đá. Loa vẫn chập.
thuc_tap_sinh: *(bộ đàm)* Dạ chị ơi em chạm vô loa thì nó… nó nổ bụp ạ. Em không sao ạ!
_Bạn ném bộ đàm xuống ghế. Rồi nhặt lên. Rồi lau nó. Bộ đàm không có lỗi._
~ cd_nk(15)
~ cd_td(-2)
-> END

// ============================================================
// 💸 ĐÒI NGÂN SÁCH
// ============================================================
=== chi_dai_mg_ngan_sach_mo_dau ===
# noi:phong_giam_doc
_Phòng giám đốc. Ba đối thủ. Ba vòng. Một mục tiêu: ngân sách Đêm Hồng._
ke_toan: Vòng một. Hóa đơn đâu?
giam_doc: Vòng hai. Anh không ép, tùy em.
thanh_ninh: Vòng ba. Dạ anh nói chuẩn quá anh ơi!
_Bạn có lý lẽ, có số liệu, có bộ đàm. Và có hai bàn tay, phòng khi lý lẽ hết tác dụng._
-> END

=== chi_dai_mg_ngan_sach_thanh_cong ===
_{giam_doc} ký. {ke_toan} đóng dấu. {thanh_ninh} mở miệng định nói "anh nói chuẩn quá", rồi im, vì không biết khen ai._
giam_doc: Duyệt. Em cứ làm. Hoành tráng nhé.
_Ra tới cầu thang, {ke_toan} đuổi theo, nhét vào tay bạn một hộp bánh pía, nói nhỏ: "Ăn lấy sức. Hóa đơn tui lo."_
~ cd_td(10)
~ cd_co_banh_pia = true
~ an(15)
~ cd_uy(5)
~ qh("ke_toan", 3)
-> END

=== chi_dai_mg_ngan_sach_that_bai ===
giam_doc: Em {chi_dai}, anh hiểu mà. Nhưng mình "optimize" thêm được không em? Cắt pháo hoa đi. Cắt bớt đèn.
thanh_ninh: Dạ anh nói chuẩn quá anh ơi! Tối giản là xu hướng ạ!
_Bạn bước ra khỏi phòng với một nửa con số. Tay nắm chặt tờ dự toán tới nhàu._
~ cd_nk(10)
~ cd_td(2)
~ qh("thanh_ninh", -5)
-> END

// ============================================================
// 🎂 LIÊN HOAN KHÔNG TOANG
// ============================================================
=== chi_dai_mg_lien_hoan_mo_dau ===
# noi:tiec
_Một bàn dài. Đồ ăn có hạn. 23 cái miệng. Và một bản đồ thù hằn chỉ bạn mới đọc được:_
_{truong_phong} không ngồi cạnh {con_ong_chau_cha}. {designer} không ngồi cạnh {bien_kich}. {ke_toan} không ngồi cạnh {sales}. {thanh_ninh}… không ngồi cạnh bạn._
_Và {cho}. Luôn cách bánh kem ít nhất 5 mét._
cho: *(nhìn bánh kem)* …Gâu.
-> END

=== chi_dai_mg_lien_hoan_thanh_cong ===
_Không ai cãi nhau. Không ai đói. {cho} ngồi đúng 5 mét, mắt rưng rưng nhìn bánh, nhưng không nhúc nhích._
_Cuối tiệc, {thuc_tap_sinh} mang tới cho bạn một đĩa đầy đủ mọi món, kèm một lon nước ngọt: "Dạ chị chưa ăn gì hết ạ. Em để dành cho chị."_
{ RANDOM(1, 10) <= 7:
    _Bánh kem còn nguyên. Bạn được miếng to nhất, có chữ "16"._
    ~ nhan(banh_kem)
}
~ tien_cong(150000)
~ an(60)
~ uong(15)
~ cd_uy(3)
~ cd_td(2)
~ tinh_than_cong_ty = tinh_than_cong_ty + 3
-> END

=== chi_dai_mg_lien_hoan_that_bai ===
_{truong_phong} và {con_ong_chau_cha} giành nhau ghế đầu bàn. {sales} hỏi {ke_toan} tạm ứng. {cho} cách bánh kem 4 mét 9._
_Rồi 0 mét._
cho: GÂU! *(mặt dính đầy kem)*
_Bữa tiệc vẫn vui. Theo kiểu người ta sẽ kể lại suốt 3 năm._
~ cd_nk(10)
~ an(30)
~ tinh_than_cong_ty = tinh_than_cong_ty - 2
-> END

// ============================================================
// 🥊 BAO CÁT SÂN NHÀ
// ============================================================
=== chi_dai_mg_bao_cat_mo_dau ===
# noi:nha_so_45
_Sân Nhà số 45. Bao cát treo trên xà, đã vá 4 lần. Bạn quấn băng tay, đứng tấn._
_Nhịp radio nhà hàng xóm: bolero. Đấm theo nhịp. Mỗi cú đúng nhịp là một cơn giận rơi xuống đất._
-> END

=== chi_dai_mg_bao_cat_thanh_cong ===
_Bịch. Bịch. Bịch-bịch. Bao cát đung đưa như con lắc đồng hồ. Đầu bạn trống trơn, nhẹ tênh._
_Bên kia tường có tiếng gõ cửa. Ông hàng xóm chìa qua một trái dừa tươi đã chặt sẵn: "Nghe con đấm đã quá. Uống đi."_
~ cd_nk(-30)
~ cd_met(-20)
~ cd_co_dua = true
~ uong(30)
~ cd_bao_cat_lan = cd_bao_cat_lan + 1
-> END

=== chi_dai_mg_bao_cat_that_bai ===
_Lệch nhịp. Lệch nhịp nữa. Cú thứ 40 trượt khỏi bao cát, đấm thẳng vào cột nhà. Đau tới tận vai._
_Bạn ngồi bệt xuống sân, ôm tay, cười. Chị Đại đánh nhau với cái cột._
~ cd_nk(-10)
~ nghi(-10)
~ cd_bao_cat_lan = cd_bao_cat_lan + 1
-> END

// ============================================================
// 🍲 CƠM NHÀ CHỊ HƯƠNG
// (đặt cd_khach_com = mã người được mời trước khi mở cảnh)
// ============================================================
=== chi_dai_mg_com_nha_mo_dau ===
# noi:cho_pho_cu
_Chợ Phố Cũ. Ngân sách trong túi. Một người khách tối nay: {ten(cd_khach_com)}._
_Người này thích ăn gì? Bạn đã để ý cả tháng nay: họ gọi món gì ở quán cơm tấm, họ bỏ lại món gì trong hộp cơm._
_Cô bán cá vẫy tay: "{chi_dai} ơi, cá lóc mới về nè con!"_
-> END

=== chi_dai_mg_com_nha_thanh_cong ===
_Nhà số 45. Mâm cơm nóng hổi. Đúng món {ten(cd_khach_com)} thích. {ten(cd_khach_com)} ăn tới chén thứ ba thì đặt đũa xuống, nhìn bạn._
~ qh(cd_khach_com, 15)
~ cd_moi_an_com(cd_khach_com, 0)
~ cd_co_hop_com = true
~ an(60)
{ cd_khach_com:
- "thanh_ninh":
    thanh_ninh: Chị… em đi phỏng vấn bên LL ba lần rồi. Chiều nay chính ông Lưu Lực phỏng vấn em. Thư ký bên đó hỏi em có giữ mật khẩu email anh {giam_doc} hông. Trợ lý gì mà hỏi vậy chị?
    ~ cd_hoa_voi_nhi = true
- "thuc_tap_sinh":
    thuc_tap_sinh: Dạ… em kể chị nghe. Trước em làm trưởng phòng tín dụng ngân hàng ạ. Em bỏ hết để đi làm cái em thích.
    ~ phat_hien(duy_tung_lam_ngan_hang)
- "ke_toan":
    ke_toan: Tui có một cái két ở nhà. Có 250 triệu. Để trả lương nếu công ty sập. Bà đừng nói ai.
    ~ phat_hien(quy_den_thuong)
- "hr":
    hr: Anh có soạn một cái email chưa gửi. Mở quán trà. "Phòng Trà Nhân Sự". Mời {ke_toan} làm chung. Chuyện làm ăn thôi nha em.
- "quan_ly_idol":
    quan_ly_idol: Tháng 7 anh lén trả tiền nhà giùm {idol_het_thoi}. Một tháng. Nó không biết. Đừng nói nó.
    ~ phat_hien(thai_thuong_phat)
- "editor":
    editor: Em có kênh Diu-túp. "Cú Đêm Cắt Ghép". Gần 1 triệu người đăng ký. Không ai ở công ty biết.
    ~ phat_hien(kenh_cu_dem)
- "thanh_xin_nghi":
    thanh_xin_nghi: Chị… em hông về quê gặt lúa. Em đi thi hát. "Giọng Ca Ước Mơ". Em vô tới bán kết rồi.
    ~ phat_hien(son_thi_hat)
- "sieu_nhan_hong":
    sieu_nhan_hong: *(tháo mũ, ăn rất chậm)* Nhà tui có cái bàn 12 ghế. Tui ngồi một mình. Lâu lắm rồi mới có người nấu cho tui ăn.
- else:
    _{ten(cd_khach_com)} kể bạn nghe một chuyện chưa từng kể với ai. Bạn gật đầu, ghi nhớ, và không bao giờ kể lại._
}
_Lúc về, bạn gói cho {ten(cd_khach_com)} một hộp cơm, gói cho mình một hộp: mai ăn trưa khỏi lo._
-> END

=== chi_dai_mg_com_nha_that_bai ===
_Bạn nấu canh chua. {ten(cd_khach_com)} không ăn được chua. Bạn kho cá. {ten(cd_khach_com)} dị ứng cá._
_{ten(cd_khach_com)} ăn cơm trắng với nước tương, cười nói "ngon lắm chị". Bạn biết là không ngon._
~ qh(cd_khach_com, 5)
~ cd_moi_an_com(cd_khach_com, 0)
~ an(30)
-> END
