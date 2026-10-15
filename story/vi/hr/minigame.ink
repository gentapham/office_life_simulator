// ============================================================
// HR: TUẤN · MINIGAME (mở đầu / thành công / thất bại)
// Game mở minigame sau cảnh *_mo, rồi nhảy vào *_dat hoặc *_truot.
// ============================================================

// ============ 🍵 PHA TRÀ ĐÚNG NGƯỜI ============
=== hr_mg_pha_tra_mo ===
# noi:phong_hr
_Kệ trà 40 loại. Người ngồi trước mặt bạn đang… lo lắng? tức giận? buồn? hay "đang giấu gì đó"?_
_Đọc nét mặt. Chọn đúng trà. Trà đúng thì người ta bình tĩnh và nói thật. Trà sai thì… trà gừng cho người đang nóng._
{ hr_co_tra_o_long:
    _Trong túi bạn có hộp trà ô long. Lần này tay bạn tự biết phải pha gì._
}
-> END

=== hr_mg_pha_tra_dat ===
_Hơi trà bốc lên. Vai người đối diện hạ xuống. Họ cầm ly bằng hai tay, như cầm một thứ gì quý._
_"Ngon quá anh. Mà… thật ra em muốn kể anh nghe chuyện này…"_
~ tien_cong(200000)
~ hr_nghe(5)
~ hr_so(-2)
~ hr_tra()
~ hr_pha_dung_lien_tiep = hr_pha_dung_lien_tiep + 1
{ hr_pha_dung_lien_tiep >= 3 && not hr_co_tra_o_long:
    ~ hr_co_tra_o_long = true
    _Ba lần đúng liên tiếp. Sáng hôm sau, trên bàn bạn có một hộp trà ô long, không đề tên người tặng. Chỉ có tờ giấy: "Cảm ơn anh đã nghe."_
}
-> END

=== hr_mg_pha_tra_truot ===
_Bạn đưa trà gừng cho người đang nóng giận. Người đó uống một ngụm. Mặt đỏ lên. Rồi đỏ hơn._
_"Anh cố tình hả? Anh mời em lên đây để làm em nóng thêm hả?"_
~ hr_pha_dung_lien_tiep = 0
~ hr_so(5)
~ hr_tra()
~ cang_thang(5)
-> END

// ============ ⏰ CANH MÁY CHẤM CÔNG ============
=== hr_mg_cham_cong_mo ===
# gio:07:55 # noi:tang_tret
_7 giờ 55 tới 8 giờ 05. Tầng trệt. Bạn đứng cạnh máy chấm công, {bac_bao_ve} ngồi trong chòi, {cho} nằm ngáp._
_Bắt người đi trễ, người chấm công giùm bạn, và người leo cửa sau (đặc biệt là {chua_te_deadline}). Trễ quá 5 phút: 50.000đ vào quỹ trà sữa thứ 6._
bac_bao_ve: Cháu đứng gác thế thì bác nghỉ nhé. *(vẫn ngồi nguyên)*
-> END

=== hr_mg_cham_cong_dat ===
_8 giờ 05. Bạn bắt được 2 người trễ, 1 người chấm giùm, và {chua_te_deadline} đang treo lơ lửng một chân trên bờ tường sau._
chua_te_deadline: Anh Tuấn… em tập thể dục buổi sáng thôi mà… chill…
~ hr_quy_tra_sua = hr_quy_tra_sua + 150000
~ tien_cong(100000)
~ nhan(banh_mi)
~ hr_so(3)
bac_bao_ve: Cháu bắt người giỏi đấy. Ăn bánh mì đi. Bác mua dư một ổ.
_Thứ 6 này, quỹ trà sữa thêm 150.000đ. Cả công ty uống, kể cả người bị bắt._
~ qh("bac_bao_ve", 3)
-> END

=== hr_mg_cham_cong_truot ===
_8 giờ 10. Bảng chấm công ghi "đủ người". Bạn không bắt được ai. Nhưng sao văn phòng còn trống 5 bàn?_
_Hóa ra {thuc_tap_sinh} đã chấm giùm 5 người, vì "dạ mọi người nhờ em ạ"._
thuc_tap_sinh: Dạ em xin lỗi anh… em tưởng giúp đỡ đồng nghiệp là tốt ạ…
~ cang_thang(5)
bac_bao_ve: Bác thấy hết. Nhưng bác không nói đâu.
-> END

// ============ 🤒 THÁM TỬ ĐƠN NGHỈ PHÉP ============
=== hr_mg_tham_tu_mo ===
# noi:phong_hr
_Trên bàn: lá đơn xin nghỉ của {thanh_xin_nghi}, mở story Phây-búc, sổ ra vào của {bac_bao_ve}, và số điện thoại Phòng khám Khỏe Re._
_Tìm điểm mâu thuẫn. "Bà ngoại ốm" mà story đăng ảnh đi hát? Giấy phòng khám ký ngày chủ nhật? Gặt lúa tháng 10 ở… nhà vườn trồng rau?_
-> END

=== hr_mg_tham_tu_dat ===
_Bạn khoanh tròn ba chỗ bằng bút đỏ. Giấy phòng khám ký ngày chủ nhật, Khỏe Re đóng cửa chủ nhật. Lúa tháng 10 ở Ven Đô là lúa… rau muống._
~ hr_so_lan_bat_son = hr_so_lan_bat_son + 1
~ tien_cong(150000)
~ qh("thanh_xin_nghi", -5)
{ hr_so_lan_bat_son >= 3 && not hr_co_hop_banh_que:
    ~ hr_co_hop_banh_que = true
    _Sáng hôm sau, trên bàn bạn có một hộp bánh "quà quê" của {thanh_xin_nghi}. Còn dán tem giá siêu thị mini: 45.000đ. Kèm tờ giấy: "Quà quê em, anh ăn cho vui ạ."_
    ~ an(10)
}
* [📓 Ghi tên {thanh_xin_nghi} vào danh sách đen.]
    { not hr_them_ten_son:
        ~ hr_ds(1)
        ~ hr_them_ten_son = true
    }
    ~ hr_so(3)
    _Bạn ghi. Lý do: "Không trung thực." Bạn nhìn chữ mình viết, thấy nó cứng như đá._
* [😶 Bắt được là đủ. Không ghi.]
    ~ hr_nghe(2)
    _Bạn cất lá đơn vào ngăn kéo. Có những lời nói dối, người ta nói vì đang giữ một thứ gì đó rất quý._
- -> END

=== hr_mg_tham_tu_truot ===
_Bạn gọi Phòng khám Khỏe Re. Bác sĩ nghe máy._
phu_bac_si_khoe_re: Anh hỏi bệnh nhân hả? Bí mật bệnh nhân nha anh. Mà anh là ai mà soi đời tư người ta kỹ vậy?
~ hr_nghe(-10)
~ hr_so(3)
_Chiều đó, cả pantry xì xào: "HR gọi tới phòng khám soi bệnh án của Sơn". Bạn chưa kịp đọc bệnh án nào._
-> END

// ============ 🎤 PHỎNG VẤN "NHÂN VIÊN CHĂM SÓC SIÊU NHÂN HỒNG" ============
=== hr_mg_phong_van_mo ===
# noi:phong_hr
_5 ứng viên, mỗi người 3 câu hỏi. Tiêu chí: giữ lịch cho {sieu_nhan_hong}, chịu được màu hồng, không bị {cho} cắn. Có ứng viên nói dối._
_Câu hỏi 1: "Em làm gì khi Siêu Nhân Hồng bỏ ngang buổi quay để đi giúp người?"_
-> END

=== hr_mg_phong_van_dat ===
_Chị Hạnh đi làm từ thứ 2. Ngày đầu, chị dán lên lưng {sieu_nhan_hong} một tờ lịch in màu hồng. Ngày thứ hai, chị chạy theo {sieu_nhan_hong} 3 km đi giúp người, tay vẫn cầm máy quay._
chua_te_deadline: Anh Tuấn… ổng tới đúng giờ. Đúng giờ! Em chưa thấy cảnh này bao giờ!
~ tien_cong(300000)
~ follow(20000)
~ nhan(chuoi_chien)
~ an(10)
~ qh("chua_te_deadline", 10)
~ qh("sieu_nhan_hong", 5)
~ uy_tin = uy_tin + 5
cho: Grừ… *(ngửi chị Hạnh)* …Gâu. *(nằm xuống)*
_{cho} không cắn chị Hạnh. Đây là thành tựu lớn nhất của phòng nhân sự năm nay. Ứng viên thử việc còn mang lên phòng HR một đĩa bánh chuối chiên từ phòng chờ._
-> END

=== hr_mg_phong_van_truot ===
_Tuần đầu tiên, người mới làm mất lịch quay 2 lần, ngủ quên 1 lần, và bị {cho} rượt chạy vòng quanh bãi xe 1 lần._
chua_te_deadline: ANH TUẤN! Ổng trễ nữa rồi! Ét o ét! Em sắp điên rồi!
~ follow(-15000)
~ qh("chua_te_deadline", -10)
~ qh("giam_doc", -5)
~ hr_so(2)
{ hr_nhan_gian_diep:
    _Còn người mặc đồ xanh lá chuối thì không bao giờ trễ. Ngược lại, lúc nào cũng tới sớm. Sớm tới mức paparazzi lúc nào cũng tới cùng lúc._
    ~ follow(-20000)
}
-> END

// ============ 🏖️ XẾP PHÒNG VŨNG TÀU ============
=== hr_mg_xep_phong_mo ===
# ngay:17 # noi:xe_khach
_22 người và 1 con chó. 10 phòng hướng bãi xe. Luật: {chi_dai} không ở với {thanh_ninh}. {truong_phong} không ở với {con_ong_chau_cha}. {cho} không ở chung tầng với {sieu_nhan_hong}. {editor} ngủ ngày nên ở phòng tối nhất. {dan_dau_tu} không ở với chủ nợ nào (gần như không thể)._
sieu_nhan_hong: Cho anh ở chung với nhân viên mới nha! Để gắn kết tập thể!
-> END

=== hr_mg_xep_phong_dat ===
_Bạn dán bảng xếp phòng lên cửa xe khách. Mọi người đọc. Không ai la. Không ai đổi. {dan_dau_tu} được xếp với {editor}, người duy nhất không cho {dan_dau_tu} vay tiền vì… không ai từng thấy {editor} thức lúc có người hỏi vay._
~ hr_vi_pham_phong = 0
~ tien_cong(500000)
~ hr_hai_san = true
~ hr_so(-3)
~ uy_tin = uy_tin + 5
chi_dai: Được đó Tuấn. Lần đầu tui thấy ông xếp cái gì mà hông ai cãi.
~ qh("chi_dai", 5)
-> END

=== hr_mg_xep_phong_truot ===
_Bạn dán bảng xếp phòng. 5 giây sau, 3 người cùng lúc hét lên._
chi_dai: TUẤN! Ông xếp tui với ai đây?!
dan_dau_tu: Ủa sao anh ở chung với… 3 chủ nợ vậy em?
truong_phong: Mình họp nhanh 5 phút về việc đổi phòng nhé.
~ hr_vi_pham_phong = 3
~ hr_so(5)
~ cang_thang(10)
_Mỗi vi phạm là một vụ cãi nhau lúc nửa đêm. Tối nay sẽ có ít nhất ba vụ._
-> END

// ============ 📋 HỒ SƠ NHÂN VIÊN MỚI ============
=== hr_mg_ho_so_mo ===
# ngay:1 # noi:phong_hr
_Hồ sơ của {ran_doc}: giấy khám sức khỏe, sơ yếu lý lịch, ảnh 3x4. Kiểm tra từng dòng. Thiếu gì, sai gì, khai gì lạ._
-> END

=== hr_mg_ho_so_dat ===
_Hồ sơ hoàn chỉnh. Ảnh 3x4 đúng nền xanh, giấy khám có dấu đỏ. Mục địa chỉ cũ: "Xóm Cây Me". Bạn ghi nhớ cái tên đó._
~ hr_biet_xom_cay_me = true
~ tien_cong(100000)
~ nhan(tra_sua)
~ uong(15)
ran_doc: Em mời anh ly trà sữa nha. Cảm ơn anh làm hồ sơ nhanh quá.
~ qh("ran_doc", 5)
-> END

=== hr_mg_ho_so_truot ===
_Bạn đóng ghim ngược cả tập. Ảnh 3x4 dán vào ô "chữ ký". Giấy khám sức khỏe lẫn vào xấp đơn nghỉ của {thanh_xin_nghi}._
ran_doc: Dạ… để em làm lại giúp anh nha. *(cười rất ngọt)*
~ qh("ran_doc", 2)
~ uy_tin = uy_tin - 2
_{ran_doc} tự làm lại hồ sơ của mình. Lúc đưa lại, mục "địa chỉ cũ" đã được tẩy trắng._
-> END
