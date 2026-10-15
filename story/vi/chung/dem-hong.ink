// ============================================================
// ĐÊM HỒNG HALLOWEEN 31/10 · KẾT THÚC SỰ NGHIỆP · MỘT THÁNG SAU
//
// Thứ tự:
//   chung_3110_dem_hong              (19:30, cảnh chung, có 1–2 lựa chọn)
//     -> dòng có thẻ # hien_ket_thuc_nhan_vat : game chèn kết thúc của nhân vật
//        người chơi ở đây (đã chốt từ họp 30/10), rồi chạy tiếp
//   chung_3110_ket_thuc_su_nghiep    (tính & chốt ket_thuc_su_nghiep)
//     -> chung_kt_<id>                (1 trong 6 cảnh kết thúc sự nghiệp)
//       -> chung_3110_mot_thang_sau   (phần kết "Một tháng sau…")
//
// Biến đọc: nguoi_theo_doi, nguyen_theo_ll, so_scandal, nguyen_thao_mu_dem_hong,
//   tinh_than_cong_ty, các biến chung_* trong ham-chung.ink.
// Quy đổi kết thúc theo docs/so-tay-su-that.md mục 8, theo thứ tự ưu tiên:
//   1. 🏃 bi_cuop_mat     : nguyen_theo_ll (bất kể con số)
//   2. 🌟 sieu_sao_hang_a : ≥ 1.000.000 và top 10 xu hướng
//   3. 💗 thao_mu         : ≥ 800.000 và nguyen_thao_mu_dem_hong
//   4. 🤡 meme_quoc_dan   : ≥ 600.000 và (so_scandal + chung_so_meme) ≥ 3
//   5. 🔥 bi_tay_chay     : chung_scandal_lon_sau_2810 và < 800.000
//   6. 📉 chim_nghim      : còn lại
// "Top 10 xu hướng" = chung_top_10_xu_huong, HOẶC vượt 1.000.000 ngay trong
// Đêm Hồng mà không có scandal lớn sau 28/10 (vượt mốc triệu trong đêm diễn
// trực tiếp thì tự lên xu hướng).
// ============================================================

// ---------- Tiện ích ----------
=== function chung_3so(n) ===
{ n < 10:
    ~ return "00" + n
}
{ n < 100:
    ~ return "0" + n
}
~ return "" + n

// In số kiểu 1.023.500
=== function chung_so(n) ===
~ temp tr = n / 1000000
~ temp ng = (n mod 1000000) / 1000
~ temp dv = n mod 1000
{ tr > 0:
    ~ return tr + "." + chung_3so(ng) + "." + chung_3so(dv)
}
{ ng > 0:
    ~ return ng + "." + chung_3so(dv)
}
~ return "" + dv

// Số người theo dõi Đêm Hồng mang lại (100.000 – 300.000)
=== function chung_diem_dem_hong() ===
~ temp d = 100000
{ chung_tien_do_dem_hong >= 80:
    ~ d = d + 50000
}
{ chung_tien_do_dem_hong < 50:
    ~ d = d - 50000
}
{ tinh_than_cong_ty >= 70:
    ~ d = d + 40000
}
{ chung_hat_hong_la_thai_do:
    ~ d = d + 50000
}
{ nguyen_thao_mu_dem_hong:
    ~ d = d + 60000
}
{ chung_phim_ghi_ten_duy:
    ~ d = d + 20000
}
{ not chung_video_16_nam:
    ~ d = d - 20000
}
{ so_scandal >= 3 && not chung_scandal_lon_sau_2810:
    ~ d = d + 20000
}
{ chung_scandal_lon_sau_2810:
    ~ d = d - 60000
}
{ d < 100000:
    ~ d = 100000
}
{ d > 300000:
    ~ d = 300000
}
~ return d

// Game có thể gọi để biết trước kết thúc sẽ là gì
=== function chung_tinh_ket_thuc_su_nghiep() ===
~ temp top10 = chung_top_10_xu_huong || (nguoi_theo_doi >= 1000000 && not chung_scandal_lon_sau_2810)
{ nguyen_theo_ll:
    ~ return "bi_cuop_mat"
}
{ nguoi_theo_doi >= 1000000 && top10:
    ~ return "sieu_sao_hang_a"
}
{ nguoi_theo_doi >= 800000 && nguyen_thao_mu_dem_hong:
    ~ return "thao_mu"
}
{ nguoi_theo_doi >= 600000 && so_scandal + chung_so_meme >= 3:
    ~ return "meme_quoc_dan"
}
{ chung_scandal_lon_sau_2810 && nguoi_theo_doi < 800000:
    ~ return "bi_tay_chay"
}
~ return "chim_nghim"

// ============================================================
=== chung_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
{ vai == "sieu_nhan_hong" && nguyen_theo_ll: -> ben_kia_duong }
_Thứ bảy, 31/10/2026. 19 giờ 30._
_Sân khấu Đêm Hồng, Phường Tân Drama. Ba tuần trước, chỗ này là một bãi đất trống, một cột điện và rất nhiều ếch. Tối nay, nó hồng rực như ai đó lật ngược một ly trà sữa dâu lên cả quận._
{
- nguoi_theo_doi >= 800000:
    _Khán đài kín người. Có người đội mũ bảo hiểm sơn hồng, có người mặc áo choàng làm từ khăn tắm, có một bà cụ cầm bảng "SIÊU NHÂN ĐẨY XE GIÙM TUI HÔM MƯA"._
- nguoi_theo_doi >= 500000:
    _Khán đài đông vừa phải. Phía trước chen chúc, phía sau còn chỗ cho mấy chiếc xe đẩy cá viên chiên tranh thủ bán._
- else:
    _Khán đài lưa thưa. Hàng ghế đầu là người của {cong_ty}. Hàng ghế sau là người nhà của người của {cong_ty}. Hàng ghế cuối là mấy chiếc xe đẩy cá viên chiên._
}
_Cả công ty hóa trang. Sếp {giam_doc} mặc bộ "Ông Kẹ Ngân Hàng" mà {designer} chọn, tay cầm cuốn sổ nợ bằng giấy bìa, không ai dám nói với sếp đó là một trò đùa._
_Sau cánh gà, {chi_dai} đeo bộ đàm, một tay giữ cầu dao, một tay giữ dây xích của {cho}. {chua_te_deadline} đeo tai nghe, cầm cue sheet. {it} ngồi ở bàn ánh sáng, mì ly để sẵn bên cạnh._
_Bác {bac_bao_ve} đứng ở cổng sân khấu như mọi ngày, trên ngực đeo tấm thẻ "Khách mời đặc biệt" mà bác không quen đeo, cứ chốc chốc lại sờ vào túi áo._
_{quan_ly_idol} liếc điện thoại liên tục. 20 giờ tối nay, Đài Tivi Hóng phát trực tiếp chung kết "Giọng Ca Ước Mơ"._
{ vai != "giam_doc":
    giam_doc: *(cầm micro, giọng Bắc vang khắp khán đài)* Kính thưa quý vị! Mười sáu năm trước, {cong_ty} bắt đầu trong một căn phòng 20 mét vuông. Tối nay… tối nay, anh không ép, nhưng mời quý vị cùng xem!
- else:
    _Bạn cầm micro. Tay hơi run. Bạn định kể chuyện căn phòng 20 mét vuông năm 2010, nhưng chỉ nói được: "Mời quý vị cùng xem." Lần đầu tiên trong đời, bạn phát biểu dưới một phút._
}
-> phim_ngan

= phim_ngan
_Đèn tắt. Màn hình lớn sáng lên. Dòng chữ trắng trên nền đen: "NGƯỜI HÙNG KHÔNG TÊN"._
_Mười lăm phút. Một người đàn ông bỏ việc ở ngân hàng, đứng giữa cơn mưa, chiếc xe chết máy. Rồi một bóng áo hồng đi tới, không nói gì, đẩy xe cho anh suốt hai cây số. Không camera. Không khẩu hiệu. Chỉ có tiếng mưa và tiếng bánh xe._
_Cả khán đài im phăng phắc. Có người sụt sịt. Ở hàng ghế thứ ba, {thuc_tap_sinh} ngồi thẳng lưng, hai tay đặt trên đầu gối như đang phỏng vấn xin việc, mắt đỏ hoe._
{ vai != "thuc_tap_sinh":
    thuc_tap_sinh: *(thì thầm, không với ai cả)* Dạ… giống quá ạ. Giống hồi đó quá ạ.
}
{ chung_phim_ghi_ten_duy:
    _Màn hình chạy chữ: "Ý tưởng: {thuc_tap_sinh}. Kịch bản: {bien_kich} & {thuc_tap_sinh}."_
    _Có ai đó vỗ tay trước. Rồi cả khán đài. {thuc_tap_sinh} đứng dậy, cúi chào 90 độ về bốn phía, khóc như con nít._
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
- else:
    _Màn hình chạy chữ: "Kịch bản: {bien_kich}."_
    _Khán đài vỗ tay rất lâu. Ở hàng ghế thứ ba, {thuc_tap_sinh} cũng vỗ tay, rất lâu, và không hiểu sao thấy trong lòng thiếu mất một chữ._
}
-> video_16_nam

= video_16_nam
_Màn hình chuyển sang dòng chữ: "16 NĂM. {cong_ty}." Video của {editor}._
{ chung_video_16_nam:
    _Một căn phòng 20 mét vuông năm 2010. Một cậu sinh viên đeo cà vạt mượn. Một ông bảo vệ 34 tuổi đứng ở cửa, tay cầm ấm trà._
    _Năm 2015, cả nước hát "Ngày xưa có đôi bạn thân bán cá viên chiên tại công viên". Khán đài tự hát theo, không ai bảo._
    _Rồi những năm vắng show, những buổi quay quảng cáo cho tiệm nail và quán ốc, những bữa trưa mì gói. Rồi tháng 10 này: áo cam, đồ hồng, những người đi làm muộn, về muộn, cãi nhau, làm lành._
    _Ở khung hình thứ 1.031, trong góc tấm ảnh chụp sân thượng, có một con cú nhỏ đội mũ len hồng. Chỉ vài người tinh mắt thấy._
    _Dòng chữ cuối: "Còn tiếp…"_
- else:
    _Video kẹt lại từ hôm wifi sập. Thay vào đó là một chuỗi ảnh chụp điện thoại của sếp {giam_doc}: mờ, nghiêng, có ngón tay che một góc._
    _Nhưng ảnh nào cũng có người. Ảnh nào cũng có người cười. Lạ thay, nhìn mấy tấm ảnh mờ đó, khán đài vẫn im lặng rất lâu._
}
{ vai != "bac_bao_ve":
    _Ở cổng, bác {bac_bao_ve} đưa tay lau mắt, rồi bảo với không ai cả: "Bụi."_
}
-> tiet_muc

= tiet_muc
{ nguyen_theo_ll: -> san_khau_trong }
_20 giờ. Đèn sân khấu tắt hết. Một luồng sáng hồng duy nhất chiếu xuống giữa sân khấu._
{ chung_hat_hong_la_thai_do:
    _Nhạc dạo vang lên: "Hồng Là Thái Độ". Màn hình lớn chạy chữ: "Nhạc & lời: {con_ong_chau_cha}". Ở hàng ghế giữa, có một người đeo kính râm trong đêm, cúi đầu thật thấp, và cười._
- else:
    _Nhạc nền chủ đề vang lên. Không lời. Trống dồn như tim đập._
}
{ vai == "sieu_nhan_hong":
    _Bạn bước ra giữa luồng sáng. Áo choàng hồng. Mũ kín đầu. Tim đập to hơn tiếng trống._
- else:
    _Siêu Nhân Hồng bước ra giữa luồng sáng, tạo dáng chữ V._
    sieu_nhan_hong: Hồng không phải màu… Hồng là thái độ!
}
{
- nguoi_theo_doi >= 800000:
    _Khán đài gào lên. Có người hô tên. Có người khóc. Cái bảng "SIÊU NHÂN ĐẨY XE GIÙM TUI HÔM MƯA" được giơ cao nhất._
- nguoi_theo_doi >= 500000:
    _Khán đài vỗ tay, hô theo khẩu hiệu. Mấy đứa nhỏ ở hàng đầu tạo dáng chữ V theo._
- else:
    _Tiếng vỗ tay lẻ tẻ. Nhưng hàng ghế đầu, cả {cong_ty} đứng dậy vỗ tay to như cả nghìn người._
}
{ so_scandal + chung_so_meme >= 3:
    _Đâu đó trên khán đài có người hét: "Siêu Nhân Gâu!". Cả khán đài cười ồ, rồi hô theo. Một nửa khán giả ở đây vì meme._
}
{ vai == "cho": -> lua_chon_cho }
{ vai == "sieu_nhan_hong": -> lua_chon_nguyen }
-> lua_chon_chung

= lua_chon_chung
_Bạn đứng giữa khán đài. Điện thoại trong tay. Con số người theo dõi đang nhảy._
* [📱 Livestream từ khán đài cho bạn bè xem.]
    _Livestream của bạn có 600 người xem. Một người trong đó chia sẻ lại. Rồi một người nữa._
    ~ follow(10000)
* [🩷 Hô khẩu hiệu cùng cả khán đài.]
    _"Hồng không phải màu! Hồng là thái độ!" Bạn hô to tới khản giọng. Người bên cạnh, không quen, quay sang đập tay với bạn._
    ~ follow(5000)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [🐕 Chạy ra cánh gà giữ {cho} giúp {chi_dai}.]
    _{cho} đang giằng dây xích về phía luồng sáng hồng. Bạn ngồi xuống, ôm nó. Nó gầm gừ, rồi thôi, gác đầu lên tay bạn. Tiết mục trót lọt._
    ~ qh("cho", 10)
    ~ qh("chi_dai", 5)
* [😶 Đứng im, nhìn con số.]
    _Bạn không làm gì cả. Bạn chỉ nhìn. Cả tháng chạy theo con số, giờ mới thấy nó nhảy đẹp như pháo hoa._
- -> man_cuoi

= lua_chon_cho
_Mùi hồng. Rất nhiều mùi hồng. Bộ đồ hồng ở ngay đó, giữa ánh đèn. Dây xích trong tay {chi_dai} lỏng ra một chút._
* [🏃 Lao lên sân khấu.]
    cho: GÂU GÂU GÂU! # phu_de: Lần này tao không tha!
    _Bạn chạy một vòng quanh Siêu Nhân Hồng. Siêu Nhân Hồng chạy theo bạn. Khán đài tưởng là tiết mục, cười như điên. Clip lên Tóp-tóp trước khi bạn kịp về cánh gà._
    ~ chung_so_meme = chung_so_meme + 1
    ~ follow(20000)
* [🐾 Ngồi yên ở cánh gà, nhìn.]
    cho: … # phu_de: Hôm nay thôi. Hôm nay cho mày diễn.
    _{chi_dai} xoa đầu bạn. Bác {bac_bao_ve} ở cổng nhìn vào, gật đầu._
    ~ qh("chi_dai", 5)
    ~ qh("bac_bao_ve", 5)
* [🎵 Hú theo nhạc.]
    cho: Hú… hú uuuu… # phu_de: Bài này hay. Hay hơn người hát.
    _{it} ở bàn âm thanh thấy vậy, đẩy micro về phía bạn. Tiếng hú vang khắp khán đài. Mọi người vỗ tay theo nhịp._
    ~ follow(8000)
- -> man_cuoi

= lua_chon_nguyen
{ chung_da_chon_thao_mu: -> man_cuoi }
_Giữa bài, bạn đứng giữa sân khấu, thở dốc. Tay đưa lên mũ. Khán đài nín thở. Không ai ép. Điều khoản số 1 nói vậy._ # hen_gio:6
* [🙂 Tháo mũ.]
    ~ nguyen_thao_mu_dem_hong = true
* [🦸 Tạo dáng: "Thái độ của anh là… để dành!"]
    _Khán đài cười ồ, vỗ tay. Chiếc mũ vẫn ở trên đầu. Bên trong, mặt bạn đỏ như bộ đồ._
* [⏱️ (Không chọn kịp)]
    _Tay bạn hạ xuống. Nhạc chuyển đoạn. Khoảnh khắc trôi qua như một chiếc xe chạy qua vũng nước._
- ~ chung_da_chon_thao_mu = true
-> man_cuoi

= man_cuoi
{ nguyen_thao_mu_dem_hong:
    _Rồi Siêu Nhân Hồng làm một việc không có trong cue sheet. Hai tay đưa lên, tháo chiếc mũ ra._
    _Bên dưới là một gương mặt bình thường. Tóc bết mồ hôi, lông mày rậm, mắt không dám nhìn ai quá hai giây._
    { vai == "sieu_nhan_hong":
        _Bạn mở miệng. Giọng bạn nhỏ hẳn, không còn vang như trong mũ: "Dạ… ờm… em tên là Nguyễn {sieu_nhan_hong}."_
    - else:
        sieu_nhan_hong: *(giọng nhỏ hẳn)* Dạ… ờm… em tên là Nguyễn {sieu_nhan_hong}.
    }
    _Ba giây im lặng. Rồi khán đài nổ tung._
- else:
    _Bài hát kết thúc. Siêu Nhân Hồng tạo dáng cuối cùng giữa mưa pháo giấy hồng. Chiếc mũ vẫn kín, phản chiếu cả nghìn ánh đèn điện thoại._
}
{ vai != "chua_te_deadline":
    _Sau cánh gà, {chua_te_deadline} hô "Pháo giấy… Go!" vào bộ đàm, rồi đứng im nhìn sân khấu lâu hơn cần thiết._
}
~ temp d = chung_diem_dem_hong()
~ follow(d)
_Màn hình lớn hiện bộ đếm người theo dõi. Con số nhảy liên tục suốt một tiếng sau đó._
-> dem_so

= san_khau_trong
_20 giờ. Đèn sân khấu tắt hết. Một luồng sáng hồng chiếu xuống giữa sân khấu. Không có ai bước ra._
_Một phút. Hai phút. Khán đài bắt đầu xì xào._
_Bên kia đường, trên tòa nhà kính 20 tầng của LL-Entertainment, màn hình LED khổng lồ bật sáng: Siêu Nhân Hồng, trong bộ đồ hồng viền xanh lá chuối, đang tạo dáng. Dòng chữ chạy: "LL PRESENTS: SIÊU NHÂN HỒNG – ĐÊM ĐẦU TIÊN"._
{ vai != "chi_dai":
    chi_dai: *(bộ đàm, giọng khàn)* Không ai được bỏ về. Show vẫn chạy. Ai lên được thì lên.
}
{ vai == "idol_het_thoi":
    _Bạn đứng dậy. Không ai bảo. Bạn đi lên sân khấu, cầm lấy micro, tháo kính râm ra._
- else:
    _Một người đứng dậy từ hàng ghế giữa. Tháo kính râm. Đi lên sân khấu. {idol_het_thoi}._
}
_"Ngày xưa có đôi bạn thân bán cá viên chiên tại công viên…"_
_Không ai bảo. Khán đài hát theo. Lần này không phải vì meme._
{ vai == "cho":
    cho: Hú… # phu_de: Tao vẫn ghét bộ đồ hồng. Nhưng chỗ này trống trơn thì buồn quá.
}
-> dem_so

= dem_so
_23 giờ 59._
{
- nguoi_theo_doi >= 1000000:
    _Bộ đếm dừng ở {chung_so(nguoi_theo_doi)}. Có người hét lên. Có người ôm nhau. Có người ngồi bệt xuống đất._
- nguoi_theo_doi >= 800000:
    _Bộ đếm dừng ở {chung_so(nguoi_theo_doi)}. Gần lắm. Gần tới mức đau._
- else:
    _Bộ đếm dừng ở {chung_so(nguoi_theo_doi)}. Khán đài đã về gần hết. Trên sân khấu chỉ còn pháo giấy và mấy cái ghế nhựa._
}
_Màn hình tắt._ # hien_ket_thuc_nhan_vat
-> chung_3110_ket_thuc_su_nghiep

= ben_kia_duong
_Thứ bảy, 31/10/2026. 19 giờ 30. Tầng thượng tòa nhà kính LL-Entertainment._
_Bộ đồ của bạn có viền xanh lá chuối mới may. Nó vừa, nhưng không quen. Lưu Lực vỗ vai bạn, nói gì đó về "đêm đầu tiên của một kỷ nguyên". Bạn không nghe rõ._
_Bên kia đường, Sân khấu Đêm Hồng sáng hồng rực. Bạn thấy một bóng người đứng ở cổng, lưng hơi còng, tay sờ túi áo. Bạn thấy một con chó vàng ngồi cạnh, nhìn thẳng về phía tòa nhà này._
_20 giờ. Màn hình LED bật tên bạn. Cùng lúc, bên kia đường, có ai đó cầm micro hát "Công Viên". Cả khán đài bên đó hát theo._
* [🦸 Tạo dáng cho màn hình LED.]
    _Bạn tạo dáng chữ V. Màn hình phóng to bạn lên 20 tầng. Bạn chưa bao giờ to như vậy. Cũng chưa bao giờ thấy mình nhỏ như vậy._
* [🙂 Quay lưng lại với màn hình, nhìn sang bên kia đường.]
    _Bạn đứng nhìn rất lâu. Lưu Lực hỏi bạn có ổn không. Bạn nói: "Dạ… ờm… ổn."_
- -> dem_so

// ============================================================
=== chung_3110_ket_thuc_su_nghiep ===
# ngay:31 # gio:23:59 # ket_thuc_su_nghiep
~ ket_thuc_su_nghiep = chung_tinh_ket_thuc_su_nghiep()
~ chung_cong_ty_song = ket_thuc_su_nghiep == "sieu_sao_hang_a" || ket_thuc_su_nghiep == "thao_mu" || ket_thuc_su_nghiep == "meme_quoc_dan"
{ ket_thuc_su_nghiep:
- "bi_cuop_mat": -> chung_kt_bi_cuop_mat
- "sieu_sao_hang_a": -> chung_kt_sieu_sao_hang_a
- "thao_mu": -> chung_kt_thao_mu
- "meme_quoc_dan": -> chung_kt_meme_quoc_dan
- "bi_tay_chay": -> chung_kt_bi_tay_chay
}
-> chung_kt_chim_nghim

// ============================================================
// 🌟 SIÊU SAO HẠNG A (có hậu)
=== chung_kt_sieu_sao_hang_a ===
# ket_thuc_su_nghiep:sieu_sao_hang_a # loai:co_hau
_🌟 SIÊU SAO HẠNG A_
_0 giờ 00, ngày 1/11. Bảng xếp hạng xu hướng làm mới. Ở vị trí số 3: \#ĐêmHồng. Số 5: \#HồngLàTháiĐộ. Số 8: \#SiêuNhânHồng._
_Ba trên mười. Hợp đồng chỉ cần một._
giam_doc: *(vẫn mặc bộ Ông Kẹ Ngân Hàng, ôm điện thoại)* Một triệu… Một triệu thật à? Các em ơi, một triệu thật à?!
{ vai != "ke_toan":
    ke_toan: *(nhìn màn hình, gỡ kính xuống, lau, đeo lại)* Thật. Tui đếm ba lần rồi.
}
{ vai != "dan_dau_tu":
    dan_dau_tu: Đồ thị này… đây là đồ thị đầu tiên trong đời anh lên mà không sập.
}
_Sáng thứ hai, 5 tỷ tiền thưởng về tài khoản công ty, kèm bản hợp đồng hợp tác 3 năm dày 60 trang. Lần này, {ke_toan} đọc cả 60 trang. Rồi bắt sếp đọc lại trang nào có chữ cỡ nhỏ hơn 10._
_Sếp {giam_doc} đi một mình tới Ngân hàng Tín Dụng Đen Đủi, trả hết khoản vay trước ngày 15/11. Ra về, sếp đứng trước cổng ngân hàng hít một hơi thật dài, như người vừa được thả khỏi thang máy kẹt._
_Đài Tivi Hóng mời Siêu Nhân Hồng làm giám khảo khách mời. Ba nhãn hàng gọi điện. Một trong số đó có thật._
{ vai != "sales":
    sales: Tin chị đi, lần này chắc kèo! Thiệt! …Sao mọi người nhìn chị vậy?
}
_Fanpage {cong_ty} lần đầu tiên trong 6 năm có nút tích xanh. {hong_hot} chụp màn hình 14 lần._
{ vai == "sieu_nhan_hong":
    _Bạn ngồi trong phòng chờ, cởi găng tay, ăn miếng bánh chuối chiên cuối cùng của tháng 10. Điện thoại rung không ngừng. Một triệu người biết Siêu Nhân Hồng._
    _Bạn nhìn đĩa bánh. Vẫn chỉ có một cái nĩa._
- else:
    _Siêu Nhân Hồng ngồi trong phòng chờ, cởi găng tay, ăn miếng bánh chuối chiên cuối cùng của tháng 10. Điện thoại rung không ngừng._
}
_Rồi cửa phòng chờ mở. Ai đó đặt thêm một cái nĩa lên đĩa. Rồi thêm một cái nữa. Rồi cả công ty kéo vào, giành nhau đĩa bánh chuối chiên, cãi nhau xem ai đóng góp nhiều nhất._
{ vai != "cho":
    cho: GÂU! *(lách qua chân mọi người, ngoạm miếng bánh to nhất)*
- else:
    _Bạn lách qua chân mọi người, ngoạm miếng bánh to nhất. Không ai cản._
}
_Trên tường sảnh, câu slogan "Việc hôm nay cứ để ngày mai tính" vẫn ở đó. Bên dưới, ai đó dán thêm một tờ giấy viết tay: "Ngày mai tới rồi nè."_
{ vai != "chi_dai":
    chi_dai: *(tháo bộ đàm, ngồi bệt xuống sân khấu)* Show xong. Không sập. Không cháy. Không ai khóc. …Thôi, có chị khóc. Không tính.
}
{ vai != "it":
    it: *(ăn ly mì cuối)* Cầu dao không ai đụng. Lần đầu tiên.
}
{ vai != "chua_te_deadline":
    chua_te_deadline: Bốn mươi bảy cue. Đủ bốn mươi bảy. *(nhìn tờ cue sheet)* …Tui làm xong từ hôm qua đó. Đừng ai tin.
}
_Thứ hai tuần sau, sếp {giam_doc} triệu tập họp toàn công ty. Ai cũng sợ một bài phát biểu 2 tiếng._
{ vai != "giam_doc":
    giam_doc: Anh chỉ nói một câu thôi. *(im lặng rất lâu)* …Cảm ơn các em. Thế thôi. Về làm việc đi.
- else:
    _Bạn đứng trước cả công ty, cầm tờ giấy phát biểu dài bốn trang. Bạn gấp nó lại, nói: "Cảm ơn các em." Rồi đi về phòng, đóng cửa, ngồi im rất lâu._
}
_Đó là bài phát biểu ngắn nhất lịch sử {cong_ty}. Không ai quay lại được. Ai cũng nhớ._
{ vai != "hr":
    _Chiều đó, {hr} mời từng người lên phòng uống trà. Lần này, không ai sợ. Trên bàn chỉ có trà lài và một tờ giấy ghi "Tăng lương: đang tính"._
}
_Bên kia đường, màn hình LED của LL-Entertainment chạy quảng cáo một ban nhạc mới. Không ai bên này để ý._
{ vai != "bac_bao_ve":
    _Ở chòi bảo vệ, bác {bac_bao_ve} viết một lá thư rất ngắn gửi ra nước ngoài, rồi dán tem. Bác cười một mình, lần đầu tiên sau nhiều năm._
}
_{cong_ty} sống. Siêu Nhân Hồng là siêu sao hạng A._
-> chung_3110_mot_thang_sau

// ============================================================
// 💗 THÁO MŨ (có hậu)
=== chung_kt_thao_mu ===
# ket_thuc_su_nghiep:thao_mu # loai:co_hau
_💗 THÁO MŨ_
_Clip dài 41 giây. Một người mặc đồ siêu nhân màu hồng đứng giữa sân khấu, tháo mũ ra, nói nhỏ: "Dạ… ờm… em tên là Nguyễn {sieu_nhan_hong}."_
_Đến sáng 1/11, clip có 9 triệu lượt xem. Bình luận nhiều nhất: "Ủa, anh bình thường vậy hả? Thích ghê."_
_Bình luận thứ hai: "Đây là người đẩy xe cho tui hôm mưa! Tui nhận ra cái lông mày!"_
_Bình luận thứ ba, của một tài khoản không có ảnh đại diện: "Đẩy xe cho tui hai cây số, năm đó, lúc tui bỏ ngân hàng. Giờ mới biết tên anh."_
{ vai == "thuc_tap_sinh":
    _Tài khoản đó là của bạn. Bạn gõ, xóa, gõ lại bảy lần mới dám bấm gửi._
}
_Con số người theo dõi không kịp chạm một triệu trước nửa đêm 31/10. Trên giấy, hợp đồng đã trượt._
{ vai != "ke_toan":
    ke_toan: *(đặt bản hợp đồng lên bàn, lật tới trang 47)* {sieu_nhan_hong}. Điều khoản này. Em có biết nó viết gì không?
- else:
    _Bạn đặt bản hợp đồng lên bàn, lật tới trang 47, đẩy về phía {sieu_nhan_hong}._
}
{ vai == "sieu_nhan_hong":
    _Bạn nhìn trang giấy chữ cỡ 6 rất lâu. Rồi bạn hỏi: "Dạ… trang 47 là trang nào ạ? Em chưa đọc tới."_
    _Rồi bạn rút cây bút hồng trong túi ra, ký vào một tờ phụ lục: gia hạn mục tiêu tới Tết. "Em còn muốn làm với mọi người mà."_
- else:
    sieu_nhan_hong: *(không mũ, gãi đầu)* Dạ… trang 47 là trang nào ạ? Em chưa đọc tới.
    _Rồi {sieu_nhan_hong} rút cây bút hồng, ký vào một tờ phụ lục: gia hạn mục tiêu tới Tết._
    sieu_nhan_hong: Em còn muốn làm với mọi người mà. Không có mũ thì… mọi người vẫn cho em làm chứ?
}
_Ba nhãn hàng gọi điện trong tuần đó. Không ai đòi Siêu Nhân Hồng đội mũ trong quảng cáo. Họ muốn "anh chàng có lông mày rậm"._
{ vai != "quan_ly_idol":
    quan_ly_idol: Chuyện này để anh lo. *(cúp máy, quay sang)* …Mà lần này anh không cần dập gì hết. Lạ ghê.
}
{ vai != "chua_te_deadline":
    _{chua_te_deadline} lưu clip 41 giây vào điện thoại, đặt tên file là "khong_phai_PR.mp4"._
}
_Chiếc mũ hồng được treo trong phòng chờ, cạnh đĩa bánh chuối chiên. Thỉnh thoảng {sieu_nhan_hong} vẫn đội nó đi giúp người. Nhưng giờ người ta gọi tên thật._
{ vai != "cho":
    _Lần đầu tiên, {cho} không sủa khi thấy một người mặc đồ hồng mà không đội mũ. Nó chỉ ngửi, rồi bỏ đi. Đó là lời khen cao nhất của {cho}._
}
{ vai != "hong_hot":
    hong_hot: Ối dồi ôi! Có người lập fanpage "Hội Những Người Có Lông Mày Rậm". Ba trăm nghìn thành viên trong một đêm!
}
{ vai != "giam_doc":
    giam_doc: *(đọc trang 47 lần đầu tiên, rồi đọc tờ phụ lục)* Gia hạn tới Tết… Anh… anh không biết nói gì. Anh không ép ai cả. Cảm ơn em.
}
{ vai != "ran_doc":
    _Ở góc phòng, {ran_doc} nhìn gương mặt không mũ rất lâu. Rồi cúi xuống cuốn sổ tay bìa xanh, viết một dòng, gạch đi, viết lại._
}
_Đài Tivi Hóng mời {sieu_nhan_hong} lên chương trình buổi sáng. Không mũ. MC hỏi: "Anh có sợ khán giả hết thích anh không?"_
{ vai == "sieu_nhan_hong":
    _Bạn gãi đầu: "Dạ… có. Mà hôm qua có người cảm ơn em bằng tên thật. Lần đầu tiên. Em nghĩ… vậy là đủ."_
- else:
    sieu_nhan_hong: *(gãi đầu)* Dạ… có. Mà hôm qua có người cảm ơn em bằng tên thật. Lần đầu tiên. Em nghĩ… vậy là đủ.
}
_Đoạn đó được cắt ra, đăng lại, lên xu hướng thêm hai ngày._
{ vai != "dan_dau_tu":
    dan_dau_tu: Số liệu nói, người ta theo dõi cái mặt nhiều hơn cái mũ 34%. Lần đầu tiên số liệu làm anh muốn khóc.
}
_Tờ phụ lục gia hạn được {ke_toan} kẹp vào bìa hồ sơ, ngay sau trang 47. Lần này chị đọc nó ba lần, rồi gật đầu._
_{cong_ty} sống thêm một mùa. Nguyễn {sieu_nhan_hong} được yêu thương bằng chính gương mặt của mình._
-> chung_3110_mot_thang_sau

// ============================================================
// 🤡 MEME QUỐC DÂN (có hậu)
=== chung_kt_meme_quoc_dan ===
# ket_thuc_su_nghiep:meme_quoc_dan # loai:co_hau
_🤡 MEME QUỐC DÂN_
_Sáng 1/11, không ai nhớ Siêu Nhân Hồng hát bài gì ở Đêm Hồng._
_Nhưng cả nước nhớ Siêu Nhân Hồng._
_Ảnh Siêu Nhân Hồng tạo dáng chữ V giữa mưa hóa đơn được ghép chữ "Khi sếp hỏi chứng từ". Clip bị chó đuổi quanh sân khấu được ghép nhạc phim hành động. Ảnh kẹt áo choàng trong thang máy thành sticker Zalo-lô với dòng "Ét o ét"._
_Cụm "Siêu Nhân Gâu" vào từ điển tiếng lóng của giới trẻ. Nghĩa: người cố gắng hết sức mà vẫn hơi… hài._
{ vai != "hong_hot":
    hong_hot: Ối dồi ôi! Có trường học dùng meme ảnh trong bài giảng "đừng bỏ cuộc"! Tui khóc nha!
}
{ vai != "dan_dau_tu":
    dan_dau_tu: *(cầm bảng số liệu)* Bảy mươi phần trăm người theo dõi đến từ clip hài. Ba mươi phần trăm còn lại… cũng đến từ clip hài, nhưng không chịu nhận.
}
_Hợp đồng trên giấy trượt mục tiêu. Nhưng một hãng mì gói, một hãng nước tăng lực và "Sữa Chua Hồng Hào" cùng mua bản quyền dùng meme cho quảng cáo._
{ vai != "sales":
    sales: Sữa Chua Hồng Hào ký thật đó! Chị nói từ hôm 27 rồi mà không ai tin!
}
{ vai == "sieu_nhan_hong":
    _Bạn đọc bình luận cả đêm. Không ai khen bạn hát hay. Ai cũng nói: "Ảnh làm tui cười trong tuần tệ nhất năm."_
    _Bạn nghĩ một lúc, rồi ký phụ lục gia hạn hợp đồng tới Tết. Cười cũng là một kiểu giúp người mà._
- else:
    sieu_nhan_hong: *(đọc bình luận, gãi mũ)* Không ai khen em hát hay. Mà ai cũng nói em làm họ cười trong tuần tệ nhất năm. *(ngừng)* …Vậy cũng là giúp người ha?
    _Rồi {sieu_nhan_hong} ký phụ lục gia hạn hợp đồng tới Tết, bằng cây bút hồng, và tạo dáng chữ V khi ký. Có người chụp lại. Lại thành meme._
}
{ vai != "giam_doc":
    giam_doc: Anh đã bảo rồi! Scandal cũng là PR! Anh không ép… mà anh đúng.
}
{ vai != "designer":
    _{designer} nhận đơn làm 40 mẫu sticker mới. Lần đầu tiên trong đời, khách hàng không đòi sửa. Vì sticker càng xấu càng bán chạy._
}
_Trên cổng {cong_ty}, ai đó dán một tấm ảnh in khổ to: Siêu Nhân Hồng và {cho} đang sủa nhau. Bên dưới ghi: "Linh vật kép."_
{ vai != "cho":
    _{cho} nhìn tấm ảnh, sủa nó một tiếng, rồi nằm xuống ngay bên dưới, như canh giữ._
}
{ vai != "thuc_tap_sinh":
    thuc_tap_sinh: Dạ em mới học được "Siêu Nhân Gâu" nghĩa là gì ạ! Em dùng nó với mẹ em, mẹ em cười ạ!
}
{ vai != "idol_het_thoi":
    idol_het_thoi: Meme mà nổi vậy hả? Hồi 2015 người ta cũng chế "Công Viên" thành meme đó. Anh… anh hiểu cảm giác này. *(cười)* Tận hưởng đi.
}
_Một tháng sau, người ta vẫn gửi sticker Siêu Nhân Hồng kẹt áo choàng mỗi khi kẹt xe. Kẹt xe thì ngày nào cũng có. Nên ngày nào Siêu Nhân Hồng cũng có mặt trong điện thoại của cả nước._
{ vai != "hr":
    hr: *(dán tấm sticker "Ét o ét" lên tách trà hồng)* {chung_xung_hoa("hr")} giữ cái này làm kỷ niệm. Đừng nói ai.
}
_Có một trường mẫu giáo ở Ven Đô mời Siêu Nhân Hồng tới "tạo dáng cho các bé xem". Hai mươi đứa nhỏ tạo dáng chữ V theo. Một đứa té. Cả lớp cười._
{ vai == "sieu_nhan_hong":
    _Bạn đỡ đứa nhỏ dậy. Nó nói: "Chú cũng té hoài mà!" Bạn cười to tới mức kính mũ bị mờ._
- else:
    _Siêu Nhân Hồng đỡ đứa nhỏ dậy. Nó nói: "Chú cũng té hoài mà!" Trong mũ có tiếng cười, to tới mức kính mũ bị mờ._
}
_Tờ phụ lục gia hạn tới Tết được {ke_toan} kẹp ngay sau trang 47, kèm ghi chú bút chì: "Lần này đọc rồi."_
_{cong_ty} sống. Siêu Nhân Hồng không phải siêu sao. Siêu Nhân Hồng là meme quốc dân._
-> chung_3110_mot_thang_sau

// ============================================================
// 📉 CHÌM NGHỈM (buồn)
=== chung_kt_chim_nghim ===
# ket_thuc_su_nghiep:chim_nghim # loai:buon
_📉 CHÌM NGHỈM_
_Sáng 1/11, bảng xếp hạng xu hướng không có chữ "hồng" nào. Vị trí số 1 là một con mèo biết mở tủ lạnh._
_Bộ đếm người theo dõi dừng ở {chung_so(nguoi_theo_doi)}. Không tăng. Không giảm. Đứng yên như một chiếc xe hết xăng giữa Đại Lộ Kẹt Xe._
_Sáng thứ hai, {ke_toan} lật hợp đồng tới trang 47 lần cuối. Hoàn trả gấp đôi: 10 tỷ. Không ai trong phòng họp nói gì. Chỉ có tiếng điều hòa._
{ vai != "giam_doc":
    giam_doc: *(giọng nhỏ, không có chữ tiếng Anh nào)* Anh xin lỗi các em. Anh… anh đã không đọc.
- else:
    _Bạn mở miệng định nói về mindset. Không có chữ nào ra. Cuối cùng bạn chỉ nói được: "Anh xin lỗi. Anh đã không đọc."_
}
{ vai == "sieu_nhan_hong":
    _Bạn ngồi trong phòng chờ, nhìn đĩa bánh chuối chiên nguội. Bạn không hiểu trang 47 viết gì. Bạn chỉ hiểu là mọi người đã cố hết sức, còn bạn thì không đủ để người ta nhớ._
- else:
    _{sieu_nhan_hong} ngồi trong phòng chờ, nhìn đĩa bánh chuối chiên nguội. Không tạo dáng. Không khẩu hiệu._
    sieu_nhan_hong: *(rất nhỏ)* Dạ… ờm… em xin lỗi. Chắc người ta không thích em lắm.
}
_Chiều hôm đó, bộ đồ siêu nhân màu hồng được treo vào kho công ty, giữa đống đèn sân khấu cũ và tấm phông "Công Viên Tour 2015"._
_Ai đó dán lên móc treo một mẩu giấy: "Đồ dự phòng số 1. Đừng mặc thử."_
{ vai != "bac_bao_ve":
    _Tối đó, bác {bac_bao_ve} ngồi trong chòi rất lâu. Trên bàn là một phong bì dán kín, ngoài ghi: "Chỉ mở khi công ty sắp sập."_
    _Bác pha một ấm trà. Uống hết. Rồi bác mở phong bì. Bác đọc, gấp lại, bỏ vào túi áo ngực, không nói với ai bên trong viết gì._
- else:
    _Tối đó, bạn ngồi trong chòi rất lâu. Trên bàn là phong bì dán kín: "Chỉ mở khi công ty sắp sập." Bạn pha một ấm trà, uống hết, rồi mở ra._
    _Bạn đọc. Bạn gấp lại, bỏ vào túi áo ngực. Chuyện này bạn sẽ chỉ nói một lần, với đúng một người._
}
{ vai != "cho":
    _{cho} nằm trước cửa kho cả đêm. Không ai hiểu vì sao. Có lẽ nó cũng không hiểu. Nó chỉ thấy thiếu một thứ để ghét._
- else:
    _Bạn nằm trước cửa kho cả đêm. Bên trong có mùi hồng. Bạn vẫn ghét mùi đó. Nhưng hôm nay nó buồn quá, nên bạn nằm canh._
}
_Sáng hôm sau, 6 giờ 30, cổng {cong_ty} vẫn mở. Như mười sáu năm nay._
{ vai != "hong_hot":
    _{hong_hot} lướt fanpage. Bài cuối cùng có 41 lượt thích. Bình luận duy nhất: "Ủa ảnh là ai vậy?". Không ai trả lời._
}
{ vai != "ke_toan":
    _{ke_toan} về nhà số 18, đứng trước bức tranh treo tường rất lâu. Sau bức tranh có cái két. Chị không mở. Chưa._
}
{ vai != "chua_te_deadline":
    _{chua_te_deadline} lật cái đồng hồ cát trên bàn. Lần đầu tiên. Cát chảy. {chua_te_deadline} ngồi nhìn tới hạt cuối cùng._
}
{ vai != "thuc_tap_sinh":
    thuc_tap_sinh: *(thu dọn bàn thực tập)* Dạ… em hết thực tập rồi ạ. Em… em cảm ơn mọi người ạ. *(cúi chào 90 độ, lâu hơn mọi khi)*
}
_Ở góc kho, chiếc găng tay hồng từ ngày 4/10 vẫn nằm trong đống báu vật dưới gầm cầu thang. Không ai còn đi tìm nó._
_Một tuần sau, nội quy "mỗi ngày một món đồ hồng" bị gỡ khỏi bảng thông báo. Không ai gỡ cái nơ hồng trên cổng. Nó bạc màu dần dưới nắng._
_Trên mạng, cái tên "Siêu Nhân Hồng" được nhắc đúng một lần trong tháng 11, trong một bài tổng hợp "Những chiến dịch quảng bá thất bại năm 2026". Ở vị trí số 7. Không có ảnh._
_Có một buổi chiều mưa, ở Đại Lộ Kẹt Xe, có người thấy một chiếc xe chết máy được ai đó đẩy giùm lên lề. Người đẩy không mặc đồ hồng. Chỉ mặc áo mưa. Không ai quay._
_Người được giúp hỏi tên. Người kia chỉ cười, gãi đầu, rồi đi._
_Siêu Nhân Hồng chìm nghỉm. Không ai biết người trong bộ đồ hồng tên gì._
-> chung_3110_mot_thang_sau

// ============================================================
// 🔥 BỊ TẨY CHAY (buồn)
=== chung_kt_bi_tay_chay ===
# ket_thuc_su_nghiep:bi_tay_chay # loai:buon
_🔥 BỊ TẨY CHAY_
_23 giờ 40 đêm Đêm Hồng, khi pháo giấy còn chưa quét xong, một bài đăng lan khắp mạng: bóc lại vụ việc nổ ra sau ngày 28/10, kèm ảnh chụp màn hình, ghi âm, và một bảng so sánh "trước và sau"._
_Tới 0 giờ 30, hashtag \#TẩyChayHồng đứng thứ 2 xu hướng. Lần đầu tiên Siêu Nhân Hồng vào top 10. Theo cách không ai muốn._
{ vai != "hong_hot":
    hong_hot: *(điện thoại rung liên tục)* Fanpage nhận 4.000 bình luận một giờ. Tui… tui hông dám mở cái nào hết.
}
{ vai != "quan_ly_idol":
    quan_ly_idol: Đừng ai đăng gì hết! *(giọng vỡ ra)* …Đừng ai đăng gì hết. Lần này anh không biết lo sao nữa.
}
_Sáng 1/11, ba nhãn hàng rút tên. Một cửa hàng in áo hồng tuyên bố đổi tên sản phẩm thành "Áo Màu Thịt Bò Tái"._
_Người theo dõi giảm từng phút. Những người từng bình luận "Ảnh đẩy xe cho tui hôm mưa" im lặng. Không phải vì họ ghét. Mà vì không ai muốn bị réo tên bênh vực._
{ vai == "sieu_nhan_hong":
    _Bạn ngồi trong căn nhà 12 ghế, đọc từng bình luận. Đọc tới cái thứ 300 thì bạn úp điện thoại xuống bàn. Chiếc mũ hồng nằm trên ghế bên cạnh, cái ghế chưa ai từng ngồi._
- else:
    _Không ai thấy Siêu Nhân Hồng suốt một tuần. Chiếc xe hồng không đỗ chéo trước cổng nữa._
}
{ vai != "ke_toan":
    _{ke_toan} lật hợp đồng tới trang 47. Không cần đọc lại. Chị đã thuộc nó từ ngày 1/10._
}
{ vai != "giam_doc":
    giam_doc: *(trong phòng giám đốc, cửa kính đóng, nói một mình)* Scandal cũng là PR… Anh đã nói thế. Anh nói sai rồi.
}
_Một chiều mưa cuối tháng 11, có người thấy một bóng áo hồng không đội mũ đẩy xe chết máy cho ai đó ở Đại Lộ Kẹt Xe. Người được giúp không nhận ra. Chỉ nói "cảm ơn anh". Bóng áo hồng gật đầu, đi tiếp._
{ vai != "cho":
    _Ở cổng {cong_ty}, {cho} vẫn ngồi nhìn ra đường mỗi sáng, lúc 9 giờ, đúng giờ chiếc xe hồng từng tới. Nó không sủa. Không có gì để sủa._
}
{ vai != "chi_dai":
    chi_dai: *(ném điện thoại lên ghế)* Đứa nào bịa thêm một chữ trên mạng, chỉ mặt chị. …Mà chỉ mặt kiểu gì khi tụi nó toàn tài khoản ảo.
}
{ vai != "sales":
    sales: *(cúp máy lần thứ sáu)* Răng Hồng rút. Hồng Hào rút. Sữa Chua Hồng Hào… vẫn chưa rút. Chị không hiểu nổi họ. Chị thương họ.
}
{ vai != "ran_doc":
    _{ran_doc} đọc bài bóc phốt ba lần. Lần thứ ba, {ran_doc} gập máy lại, không chia sẻ. Hóa ra nhìn người khác ngã cũng không vui như mình tưởng._
}
_Thứ hai, {ke_toan} gửi email toàn công ty: "Họp về trang 47. 9 giờ. Không ai được vắng." Lần đầu tiên, cả công ty biết trang 47 viết gì._
{ vai != "thanh_xin_nghi":
    _Hôm đó không ai xin nghỉ. Kể cả {thanh_xin_nghi}._
}
_Cả phòng họp im lặng. Rồi {chi_dai} đứng dậy, rót trà cho từng người. Không ai uống. Nhưng ai cũng cầm._
{ vai != "bac_bao_ve":
    _Tối đó, bác {bac_bao_ve} đặt lên bàn chòi một phong bì dán kín. Bác nhìn nó cả đêm. Chưa mở._
}
_Một tuần sau, hashtag rơi khỏi top xu hướng. Không phải vì người ta tha thứ. Mà vì người ta đã tìm được người khác để ghét._
_Lượt theo dõi dừng lại ở một con số không ai muốn chụp màn hình._
_Fanpage {cong_ty} khóa bình luận. Bài đăng cuối cùng là tấm ảnh Siêu Nhân Hồng tạo dáng chữ V ở cổng ngày 1/10, chưa ai bình luận gì xấu. Hồi đó chưa ai biết Siêu Nhân Hồng là ai._
_Siêu Nhân Hồng bị tẩy chay. Mạng xã hội quay lưng. Chỉ có những người được giúp, ngoài đời thật, là chưa bao giờ quay lưng. Nhưng họ không ở trên mạng._
-> chung_3110_mot_thang_sau

// ============================================================
// 🏃 BỊ CƯỚP MẤT (buồn)
=== chung_kt_bi_cuop_mat ===
# ket_thuc_su_nghiep:bi_cuop_mat # loai:buon
_🏃 BỊ CƯỚP MẤT_
_Sáng 1/11, báo mạng chạy tít: "LL-Entertainment chính thức ra mắt Siêu Nhân Hồng: kỷ nguyên mới của sự hồng chuyên nghiệp."_
_Ảnh bìa: Lưu Lực, vest trắng, bắt tay một người mặc đồ hồng viền xanh lá chuối, trước tòa nhà kính 20 tầng._
{ vai == "sieu_nhan_hong":
    _Bạn nhìn tấm ảnh bìa trên điện thoại. Người trong ảnh tạo dáng đúng chuẩn. Bạn không nhớ lúc chụp mình đã nghĩ gì. Hình như là nghĩ về một đĩa bánh chuối chiên ở bên kia đường._
- else:
    _Trong ảnh, Siêu Nhân Hồng vẫn tạo dáng chữ V. Nhưng ai từng đứng gần đủ lâu sẽ thấy hai ngón tay hơi cong, như đang cố tạo dáng mà quên mất vì sao._
}
_Bên kia đường, {cong_ty} nhận thư của luật sư về hợp đồng 52 trang. {ke_toan} mở ra, đọc, rồi đặt nó cạnh tờ trang 47 đã quăn mép._
{ vai != "giam_doc":
    giam_doc: *(nhìn sang tòa nhà kính)* Họ có 20 tầng. Mình có 3 tầng với một con chó. *(im lặng)* …Mà anh vẫn thích bên mình hơn.
}
{ vai != "quan_ly_idol":
    quan_ly_idol: *(cầm hai điện thoại, không cái nào rung)* Lần đầu tiên từ 2014, điện thoại anh im như vậy.
}
{ vai != "idol_het_thoi":
    _Ở phòng chờ trống, {idol_het_thoi} ngồi ăn nốt đĩa bánh chuối chiên không ai dọn. Ăn một miếng, rồi đeo kính râm vào, dù trời đã tối._
    idol_het_thoi: Hồi anh còn nổi… *(dừng lại)* …Thôi. Hồi đó cũng có người bỏ đi. Rồi cũng quen.
}
_Màn hình LED trên tòa nhà LL chiếu Siêu Nhân Hồng mỗi tối. Nhìn từ sân thượng {cong_ty}, nó sáng tới mức không cần bật đèn._
{ vai != "cho":
    _Mỗi tối, {cho} ngồi ở cổng nhìn sang cái màn hình đó. Nó không sủa. Lần đầu tiên trong đời, {cho} thấy nhớ một thứ mình ghét._
- else:
    _Mỗi tối bạn ngồi ở cổng nhìn sang cái màn hình sáng rực bên kia đường. Bạn không sủa. Mùi hồng không bay tới tận đây. Bạn thấy thiếu nó._
}
{ vai != "bac_bao_ve":
    _Bác {bac_bao_ve} pha ấm trà, đặt hai cái chén. Một chén để trước ghế trống, nơi ai đó từng ngồi uống trà đá sau mỗi buổi quay._
}
{ vai != "hong_hot":
    hong_hot: Nghe gì chưa? …Thôi. Hông có gì để nghe nữa hết. *(úp điện thoại xuống bàn, lần đầu tiên)*
}
{ vai != "chua_te_deadline":
    _{chua_te_deadline} nhận một tin nhắn lúc 2 giờ sáng: "Em ăn chưa?". Không có tên người gửi. Số lạ. {chua_te_deadline} đọc rất lâu, rồi gõ "Ăn rồi", rồi xóa, rồi gõ lại._
}
{ vai != "designer":
    _{designer} nhìn màn hình LED bên kia đường. Họa tiết xanh lá chuối trên bộ đồ mới, {designer} nhận ra từng nét. Có những bản thiết kế, người vẽ ước mình chưa từng vẽ._
}
{ vai != "ke_toan":
    ke_toan: *(gấp thư luật sư lại)* Mười tỷ. *(im lặng)* Tui đã nói từ ngày đầu tiên. Mà không ai nghe. Tui cũng không nói to.
}
_Trong kho dưới gầm cầu thang, chiếc găng tay hồng vẫn nằm đó, giữa chìa khóa, son môi và điện thoại cũ. Nó là thứ duy nhất của Siêu Nhân Hồng còn ở lại {cong_ty}._
{ vai != "thuc_tap_sinh":
    thuc_tap_sinh: Dạ… em vẫn thấy người trong phim của chị {bien_kich} giống một người lắm ạ. Mà chắc em nhớ nhầm ạ.
}
_Phòng chờ ở tầng 2 được dọn sạch. Đĩa bánh chuối chiên cuối cùng được cất vào tủ lạnh, dán nhãn "CỦA N. - ĐỪNG ĐỤNG". Một tháng sau vẫn không ai đụng._
_Điều khoản số 4 của hợp đồng không còn hiệu lực. Nhưng sáng nào cô Năm cơm tấm cũng hỏi: "Cậu đồ hồng hôm nay không ghé hả con?"_
_Trên fanpage LL-Entertainment, mỗi bài đăng về Siêu Nhân Hồng đều có hàng nghìn lượt thích. Và luôn có một bình luận, từ một tài khoản tên "Hội Chó Cổng G": một tấm ảnh chụp chó vàng ngồi trước cổng, không chú thích._
_Siêu Nhân Hồng bị cướp mất, ngay trước buổi diễn lớn nhất. Người theo dõi đi theo. Chiếc mũ thì không bao giờ quay lại._
-> chung_3110_mot_thang_sau

// ============================================================
// MỘT THÁNG SAU…
=== chung_3110_mot_thang_sau ===
# mot_thang_sau
_MỘT THÁNG SAU…_
_Thành Phố Ước Mơ, 30/11/2026. Trời bắt đầu có gió lạnh. Đại Lộ Kẹt Xe vẫn kẹt._
{ chung_cong_ty_song:
    _Tòa nhà ba tầng sơn tím của {cong_ty} vẫn mở cửa lúc 6 giờ 30. Trên bảng thông báo, nội quy "mỗi ngày một món đồ hồng" đã được gỡ. Không ai chịu gỡ cái nơ hồng trên cổng._
- else:
    _Trên cổng {cong_ty} dán tờ thông báo: "Tạm ngừng hoạt động để… tính tiếp." Bên dưới có ai đó viết thêm bằng bút bi: "Việc hôm nay cứ để ngày mai tính."_
}
{ vai != "giam_doc":
    { chung_cong_ty_song:
        _Sếp {giam_doc} đã chuộc lại biệt thự trước ngày 15/11. Giờ sếp nhắn group lúc 21 giờ thay vì 22 giờ. Ai cũng coi đó là một bước tiến lớn._
    - else:
        _Sếp {giam_doc} dọn khỏi biệt thự trên Đồi Ngân Hàng. Cây gậy golf mini giờ dựng ở góc một căn phòng thuê 20 mét vuông. Sếp nói: "Anh từng bắt đầu ở đây mà."_
    }
}
{ vai != "truong_phong":
    _{truong_phong} tổ chức "cuộc họp tổng kết tháng 10". Cuộc họp kéo dài 3 tiếng. {chung_cong_ty_song: Kết luận: "Tháng 11 mình họp ít lại." Đã có 4 cuộc họp để bàn chuyện họp ít lại.|Không ai đến, vì không còn phòng họp. {truong_phong} họp với cái bảng trắng ở nhà.}_
}
{ vai != "thanh_ninh":
    _{thanh_ninh} {biet(ran_thu_hai_lo_mat) && ran_thu_hai == "thanh_ninh": đã chuyển sang ngồi bàn trợ lý ở tòa nhà kính bên Ven Đô. Không ai còn nghe câu "Anh nói chuẩn quá" vang ở tầng 2.|vẫn pha trà 72 độ mỗi sáng. Có hôm pha nhầm thành 70 độ, không ai phát hiện, kể cả sếp.}_
}
{ vai != "hong_hot":
    _{hong_hot} {chung_cong_ty_song: có thêm 200 nghìn người theo dõi tài khoản cá nhân, nhờ "người quay mọi clip của Siêu Nhân Hồng". Trang Confession tạm nghỉ đăng bài. Chỉ tạm thôi.|livestream mỗi tối từ phòng trọ Hẻm 69, chủ đề "Hóng chuyện thất nghiệp". Lượt xem cao hơn hồi còn đi làm.}_
}
{ vai != "con_ong_chau_cha":
    _{con_ong_chau_cha} {chung_hat_hong_la_thai_do: được mời viết nhạc cho hai nghệ sĩ khác. Lần đầu tiên, người ta gọi {con_ong_chau_cha} bằng nghệ danh "Rồng" chứ không phải "cháu sếp".|vẫn khóa cửa căn phòng trong penthouse. Có đêm hàng xóm nghe tiếng đàn rất hay vọng ra. Rồi im.}_
}
{ vai != "chua_te_deadline":
    _{chua_te_deadline} {ket_thuc_su_nghiep == "bi_cuop_mat": lật chiếc đồng hồ cát trên bàn lần đầu tiên. Nhìn cát chảy hết. Rồi lật lại.|vẫn ôm chiếc gối hồng ngủ trưa. Vẫn đi trễ. Nhưng tuần này có hai buổi trưa, người ta thấy {chua_te_deadline} đi ăn cơm tấm với một người không đội mũ.}_
}
{ vai != "thuc_tap_sinh":
    _{thuc_tap_sinh} hết thực tập ngày 31/10. {chung_cong_ty_song: Sáng 2/11, {thuc_tap_sinh} vẫn đến công ty lúc 7 giờ, cúi chào bác {bac_bao_ve} 90 độ, và không ai bảo về. Thẻ thực tập sinh được đổi sang thẻ nhân viên. Dây đeo vẫn màu hồng.|{thuc_tap_sinh} nhận được ba lời mời quay lại ngân hàng. Từ chối cả ba. Giờ đang viết kịch bản đầu tay ở quán net Gõ Phím.}_
}
{ vai != "ke_toan":
    _{ke_toan} {chung_cong_ty_song: vẫn hỏi "Hóa đơn đâu em?" mỗi ngày. Nhưng tuần trước, lần đầu tiên, chị duyệt chi một ly trà sữa mà không cần hóa đơn.|trả đủ một tháng lương cho mọi người từ một nguồn không ai biết. Khi được hỏi, chị chỉ nói: "Tiền tiết kiệm của công ty." Không ai dám hỏi công ty nào tiết kiệm.}_
}
{ vai != "hr":
    _{hr} {chung_cong_ty_song: xé tập hồ sơ hồng làm đôi trước mặt cả phòng. Rồi xếp nó vào kệ trà, ở chữ X: "Xé rồi".|mở một quán trà nhỏ. Thực đơn có 40 loại trà, sắp theo bảng chữ cái. Khách quen nhất là đồng nghiệp cũ, ai đến cũng được mời "uống trà xíu", và lần này không ai sợ.}_
}
{ vai != "it":
    _{it} vẫn ngủ ở phòng server. Ổ cứng "KHÔNG ĐƯỢC MỞ" vẫn chưa được mở. Mì ly vẫn vị tôm. Có những thứ không cần restart._
}
{ vai != "idol_het_thoi":
    _{idol_het_thoi} {ket_thuc_su_nghiep == "bi_cuop_mat": hát "Công Viên" ở Đêm Hồng thay cho người vắng mặt. Clip được 3 triệu lượt xem. Lần này không có bình luận nào giống nhau.|vẫn hát đám cưới, sảnh B. Fan cuồng số 1 vẫn đến đúng giờ. Tuần trước có thêm một fan thứ hai. Là thật, không phải bot.}_
}
{ vai != "quan_ly_idol":
    _{quan_ly_idol} vẫn cầm hai điện thoại. Một cái rung ít hơn trước. Cái còn lại, danh bạ vẫn lưu một cái tên kèm ghi chú "(đừng bắt máy lúc đang họp, mà bắt cũng được)"._
}
{ vai != "bien_kich":
    _{bien_kich} {chung_phim_ghi_ten_duy: bắt đầu viết kịch bản thứ hai. Trang đầu ghi: "Đồng tác giả: (để trống, chờ người kể chuyện tiếp theo)."|ngồi ở gác mái số 7 với con mèo Bí. Cuốn tiểu thuyết "Công Ty Là Gia Đình" đã tới chương 31. {dan_dau_tu} nào cũng có người thật. {dan_dau_tu} 31 có cả chính {bien_kich}.}_
}
{ vai != "editor":
    _{editor} vẫn làm đêm. Kênh "Cú Đêm Cắt Ghép" có thêm một video mới, không quảng cáo, không tiêu đề, chỉ có một con cú đội mũ len hồng ngồi cạnh hai cái ly cà phê._
}
{ vai != "designer":
    _{designer} treo bản poster đầu tiên của chiến dịch, bản chưa sửa lần nào, lên tường căn hộ 203. Bên dưới ghi: "Bản đầu tiên muôn năm."_
}
{ vai != "sales":
    _{sales} {ket_thuc_su_nghiep == "meme_quoc_dan" || ket_thuc_su_nghiep == "sieu_sao_hang_a": ký hợp đồng tài trợ thật đầu tiên trong đời. Chị in nó ra, đóng khung, treo cạnh cái túi hàng nhái loại 1.|vẫn gọi 14 cuộc mỗi sáng. Nhưng giờ có một cuộc chị gọi cho mẹ, trước, không phải để luyện tập.}_
}
{ vai != "chi_dai":
    _{chi_dai} {chung_tien_do_dem_hong >= 80: được mời tổ chức ba show cuối năm. Chị nhận hai, từ chối một. Lý do: "Show đó không cho nhân viên ăn tối."|đấm bao cát ở nhà số 45 mỗi tối. Cuối tuần vẫn nấu canh chua, vẫn rủ đồng nghiệp cũ về ăn. Bàn ăn chưa bao giờ thiếu ghế.}_
}
{ vai != "dan_dau_tu":
    _{dan_dau_tu} {nguoi_theo_doi >= 800000: xóa app chart. Trả được 4 trên 22 triệu nợ. Bắt đầu từ bác {bac_bao_ve}.|vẫn mở chart mỗi sáng. Nhưng giờ, mở chart xong, {dan_dau_tu} mở thêm bảng số liệu người theo dõi cũ, ngồi nhìn cái đồ thị duy nhất từng đi lên.}_
}
{ vai != "thanh_xin_nghi":
    _{thanh_xin_nghi} {biet(son_thi_hat): xin nghỉ một ngày. Lý do ghi trong đơn, lần đầu tiên là thật: "Đi thu âm bài hát đầu tay." {hr} ký duyệt, kèm một ly trà.|lại xin nghỉ. Bà ngoại lại ốm. Bà ngoại gọi điện lên công ty, giọng khỏe re: "Nó nói dối đó. Mà thôi, cho nó nghỉ đi, nó hát hay lắm."}_
}
{ vai != "bac_bao_ve":
    _Bác {bac_bao_ve} vẫn ngồi ở chòi bảo vệ, vẫn nghe radio, vẫn đi ngủ lúc 9 giờ. Tháng này, bác gửi một lá thư đi nước ngoài. Chỉ có một dòng: "Mấy đứa nhỏ vẫn thương nhau."_
}
{ vai != "ran_doc":
    _{ran_doc} vẫn viết bản tin nội bộ mỗi thứ sáu. Số mới nhất có một mục tên "Chuyện xóm cũ". Mục đó để trống._
}
{ vai != "sieu_nhan_hong":
    { ket_thuc_su_nghiep:
    - "bi_cuop_mat":
        _Siêu Nhân Hồng sống trên màn hình LED bên kia đường. Không ai ở {cong_ty} biết {sieu_nhan_hong} ăn tối chưa._
    - "chim_nghim":
        _Không ai biết {sieu_nhan_hong} giờ ở đâu. Chỉ biết dạo này, ở Đại Lộ Kẹt Xe, xe chết máy ngày mưa hay được ai đó đẩy giùm._
    - "thao_mu":
        _{sieu_nhan_hong} vẫn hay đội mũ đi giúp người. Nhưng giờ, ai được giúp cũng gọi đúng tên._
    - else:
        _Siêu Nhân Hồng vẫn tạo dáng chữ V mỗi sáng ở cổng. Chiếc xe hồng vẫn đỗ hơi chéo._
    }
}
{ vai != "cho":
    _Còn {cho}? {cho} vẫn ghét shipper Tèo. Vẫn ghét màu hồng. Vẫn ngủ dưới gầm cầu thang, trên một đống đồ mà không ai dám dọn._
}
{ biet(ran_thu_hai_lo_mat) && ran_thu_hai != "thanh_ninh" && ran_thu_hai != vai:
    _Riêng {ten(ran_thu_hai)}, từ sau khi bị lộ, đã chuyển sang tòa nhà kính bên Ven Đô. Mỗi sáng đi ngang cổng {cong_ty}, vẫn có một con chó vàng sủa đúng một tiếng._
}
_Còn bạn? Bạn đã biết rồi._
_HẾT._
-> END
