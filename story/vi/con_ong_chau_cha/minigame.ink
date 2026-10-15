// ============================================================
// CON ÔNG CHÁU CHA: LONG · thoại minigame
// Mỗi minigame: cảnh mở đầu, cảnh thắng, cảnh thua.
// ============================================================

// ============ 📸 CHECK-IN CÓ CHỦ ĐÍCH ============
=== con_ong_chau_cha_mg_check_in ===
# noi:quan_ca_phe_song_ao # dieu_kien:minigame check in co chu dich
_Quán cà phê Sống Ảo. Bàn góc cửa sổ. Bạn có một ly nước, một ngọn đèn vàng, và một chiếc găng tay hồng (mượn của {sieu_nhan_hong}) cần nằm "tình cờ" trong khung hình._
_Ảnh càng tự nhiên, càng ít bị nói "phông bạt"._
{ long_so_lan_check_in >= 5:
    _Bạn đã check-in đủ nhiều để biết: ánh sáng đẹp nhất là 4 giờ chiều, và không ai tin một món đồ "tình cờ" nằm ngay giữa khung._
}
-> END

=== con_ong_chau_cha_mg_check_in_thang ===
# noi:quan_ca_phe_song_ao # dieu_kien:anh tu nhien
_Ảnh lên. Ly cà phê, nắng xiên, góc chiếc găng hồng thò ra khỏi túi áo khoác. Bình luận: "Găng của Siêu Nhân Hồng hả? Hai người quen nhau hả?"_
~ long_so_lan_check_in = long_so_lan_check_in + 1
~ tien_cong(150000)
~ nhan(ca_phe)
~ uong(15)
~ follow(6000)
~ long_od(1)
quan_ly_quan: Lượt khách hỏi bàn này tăng gấp đôi rồi em. Cà phê kem nay quán mời nha.
_Lần đầu tiên một tấm ảnh check-in của bạn được trả tiền. Bạn thấy nó đáng giá hơn mọi tấm trước._
-> END

=== con_ong_chau_cha_mg_check_in_thua ===
# noi:quan_ca_phe_song_ao # dieu_kien:anh bi che phong bat
_Ảnh lên. Chiếc găng hồng nằm chính giữa bàn, được chiếu đèn như vật chứng. Bình luận đầu tiên: "Phông bạt vừa thôi anh."_
~ long_so_lan_check_in = long_so_lan_check_in + 1
~ follow(1000)
~ cang_thang(5)
hong_hot: *(nhắn riêng)* Ông ơi, lần sau để găng trong túi thôi. Đừng cho nó ngồi ghế riêng.
-> END

// ============ 🤝 CHỐT NHÃN HÀNG TRONG QUẬN ============
=== con_ong_chau_cha_mg_chot_nhan_hang ===
# noi:pho_tan_drama # dieu_kien:minigame chot nhan hang
_Ba điểm trong danh sách: tiệm nail Lung Linh, Quán Ốc Đêm, phòng gym Cơ Bắp Ảo. Mỗi lượt, bạn chọn: câu "chú anh là giám đốc" (dễ thắng) hay câu chào hàng thật (khó hơn)._
_Bạn tập trong đầu câu mở đầu: "Dạ em bên {cong_ty}…" Không có chữ "chú". Nghe lạ tai thật._
-> END

=== con_ong_chau_cha_mg_chot_nhan_hang_thang ===
# noi:pho_tan_drama # dieu_kien:chot duoc hop dong
~ long_so_nhan_hang = long_so_nhan_hang + 1
~ tien_cong(200000)
~ long_tl(6)
{ long_so_nhan_hang:
- 1:
    ~ long_co_phieu_nail = true
    _Tiệm nail Lung Linh ký gói 20 triệu: "Móng Hồng Thái Độ". Chị chủ tiệm tặng thêm một phiếu làm móng._
- 2:
    ~ long_co_phieu_oc = true
    _Quán Ốc Đêm ký gói 50 triệu: "Ốc Hồng Đêm Halloween". Chủ quán tặng phiếu ăn ốc 2 người._
- else:
    ~ long_co_phieu_gym = true
    _Phòng gym Cơ Bắp Ảo ký gói 80 triệu: "Tập Như Siêu Nhân". Kèm phiếu tập 1 tuần._
}
{ long_so_nhan_hang == 3:
    ~ follow(25000)
    _Ba nhãn hàng trong quận cùng làm đồ hợp tác màu hồng. Cả Phường Tân Drama hồng rực. {ke_toan} gửi một tin nhắn: "Có hóa đơn. Tốt."_
    ~ qh("ke_toan", 6)
}
_Hoa hồng của bạn: 200.000đ. Bạn chụp lại tờ biên nhận. Không đăng lên đâu cả. Chỉ để giữ._
-> END

=== con_ong_chau_cha_mg_chot_nhan_hang_thua ===
# noi:pho_tan_drama # dieu_kien:bi tu choi
_Bà chủ tiệm lắc đầu: "Thôi em. Gói này chị thấy chưa tới. Mà… em là cháu ai hả?"_
_Bạn đứng ở cửa tiệm. Câu "chú anh là giám đốc" nằm ngay đầu lưỡi. Bạn nuốt nó xuống._
~ cang_thang(6)
~ long_tl(2)
_Bị từ chối mà không dùng ô. Thua, nhưng thua bằng tên mình._
-> END

// ============ 📊 DUYỆT KẾ HOẠCH MARKETING ============
=== con_ong_chau_cha_mg_duyet_ke_hoach ===
# noi:phong_pho_phong_marketing # dieu_kien:minigame duyet ke hoach marketing
_Bản kế hoạch quảng bá MV, 14 trang. Có đúng 3 lỗi: sai ngày, sai ngân sách, quên màu hồng. Nút "Ký luôn cho lẹ" sáng xanh ở góc màn hình, như mọi khi._
_Bạn rót một ly nước, tắt điện thoại, và bắt đầu đọc trang 1. Lần đầu tiên trong đời._
-> END

=== con_ong_chau_cha_mg_duyet_ke_hoach_thang ===
# noi:phong_pho_phong_marketing # dieu_kien:tim du 3 loi
_Trang 3: ngày ra MV ghi 19/10, không phải 9/10. Trang 7: ngân sách thừa một số 0. Trang 12: poster không có chút hồng nào._
~ long_duyet_ke_hoach = true
~ tien_cong(100000)
~ uy_tin = uy_tin + 10
~ long_tl(5)
~ nhan(banh_mi)
~ an(20)
thuc_tap_sinh: *(gõ cửa, cầm ổ bánh mì)* Dạ… mừng anh {con_ong_chau_cha} làm việc ạ!
truong_phong: *(đi ngang, liếc vào bản kế hoạch đầy chữ đỏ)* …Cậu đọc thật à?
con_ong_chau_cha: Ừ. Trang 7 thừa số 0 đó, phòng ông làm.
_{truong_phong} đứng im ba giây. Rồi gật đầu. Lần đầu tiên._
~ qh("truong_phong", 6)
~ qh("thuc_tap_sinh", 4)
-> END

=== con_ong_chau_cha_mg_duyet_ke_hoach_thua ===
# noi:phong_pho_phong_marketing # dieu_kien:ky luon cho le
_Bạn bấm "Ký luôn cho lẹ". Ba giây. Xong._
~ long_od(2)
truong_phong: *(đi ngang qua cửa kính, cười khẩy)*
~ qh("truong_phong", -4)
_Một tuần sau, MV suýt ra mắt vào ngày 19/10 vì một lỗi ở trang 3. Không ai biết bạn đã ký. Trừ {truong_phong}._
-> END

// ============ 🎹 PHÒNG THU TẦNG 30 ============
=== con_ong_chau_cha_mg_phong_thu ===
# gio:23:00 # noi:sky_ao_tang_30 # dieu_kien:minigame phong thu tang 30
_Phòng thu tầng 30. Đèn đỏ "ĐANG THU" bật sáng, dù không có ai ngoài bạn để thấy._
_Bạn ghép giai điệu từ các khối nhạc theo nhịp. Rồi chọn câu hát từ những gì nghe được trong ngày. Càng nhiều chuyện thật, càng nhiều câu hay._
{ long_bai_hat >= 80:
    _Bài hát gần xong rồi. Giờ là lúc gọt từng chữ._
- else:
    { long_bai_hat >= 40:
        _Bài hát đã có hình hài. Điệp khúc vững. Đoạn bridge còn trống._
    - else:
        _Bài hát mới là vài mảnh rời. "Hồng là thái độ." Và một giai điệu chưa biết đi đâu._
    }
}
-> END

=== con_ong_chau_cha_mg_phong_thu_thang ===
# noi:sky_ao_tang_30 # dieu_kien:ghep dung nhip
~ long_bh(12)
~ nghi(-20)
_Giai điệu khớp nhịp. Một câu hát mới hiện ra, từ chuyện bạn nghe được hôm nay. Bạn thu lại 3 lần, lần thứ 3 là lần đúng._
{ long_bai_hat >= 100:
    ~ phat_hien(bai_hat_long)
    _"Hồng Là Thái Độ" – bản cuối. 100%. Bạn ngồi im trong phòng thu rất lâu, nghe nó từ đầu tới cuối. Không sửa gì nữa._
    _Đây là thứ đầu tiên trong đời bạn làm xong mà không cần ai gọi điện cho ai._
}
_2 giờ sáng. Bạn xuống cửa hàng tiện lợi 24/7 dưới sảnh, mua một lon cà phê và một ly mì. Trả bằng tiền của mình._
~ nhan(ca_phe)
~ nhan(mi_ly)
~ tien_cong(-35000)
~ long_tl(2)
_Anh thu ngân ca đêm ngáp: "Có cần hâm nóng hông anh?". Bạn gật đầu. Lần đầu bạn biết ở đây có hâm nóng._
-> END

=== con_ong_chau_cha_mg_phong_thu_thua ===
# noi:sky_ao_tang_30 # dieu_kien:lech nhip
~ long_bh(3)
~ nghi(-20)
~ cang_thang(8)
_Giai điệu lệch nhịp. Câu hát nghe như đọc bản kế hoạch marketing. Bạn xóa. Thu lại. Xóa._
_3 giờ sáng. Bạn nằm trên sàn phòng thu, nhìn đèn đỏ "ĐANG THU". Không có gì đang thu cả._
-> END

// ============ 🛵 LÀM THÊM GIẤU MẶT ============
=== con_ong_chau_cha_mg_lam_them ===
# gio:19:00 # noi:quan_ca_phe_song_ao # dieu_kien:minigame lam them giau mat
_Khẩu trang. Mũ lưỡi trai. Bảng tên: "RỒNG". Ca tối ở quán Sống Ảo._
_Bưng khay, nhớ order, không làm đổ. Bàn 3: bạc xỉu ít đá. Bàn 5: trà đào thêm đào. Bàn 7: một cô gái đang livestream, cấm đi ngang khung hình._
quan_ly_quan: Rồng! Bàn 3 chờ nãy giờ!
-> END

=== con_ong_chau_cha_mg_lam_them_thang ===
# noi:quan_ca_phe_song_ao # dieu_kien:het ca khong lam do
~ long_so_ca_lam_them = long_so_ca_lam_them + 1
~ tien_cong(180000)
~ long_tl(8)
~ an(15)
_Hết ca. 180.000đ tiền mặt, đếm từng tờ. Và một phần bánh ngọt cuối ngày quán cho mang về._
quan_ly_quan: Rồng làm được đó. Tuần sau đi ca nữa hông?
{ long_so_ca_lam_them >= 5:
    _Ca thứ {long_so_ca_lam_them}. Không ai nhận ra "Rồng" là cháu giám đốc. Có lẽ vì "Rồng" chưa bao giờ là cháu ai._
}
_Bạn ăn bánh ngọt trên đường về, ngồi trên bậc thềm. Ngon hơn mọi bữa nhà hàng chú dẫn bạn đi._
-> END

=== con_ong_chau_cha_mg_lam_them_thua ===
# noi:quan_ca_phe_song_ao # dieu_kien:lam do khay
_Khay nghiêng. Ba ly trà đào bay lên, rơi xuống, đúng lên áo một vị khách. Cả quán im lặng._
~ long_so_ca_lam_them = long_so_ca_lam_them + 1
~ tien_cong(90000)
~ long_tl(4)
~ cang_thang(8)
quan_ly_quan: Rồng… thôi, ca này tính nửa tiền nha em. Mai làm lại.
_Bạn cúi đầu lau sàn. Không ai gọi chú. Không có chú nào để gọi. Lau xong thì sàn sạch._
-> END

// ============ 🎓 KHÓA QUẢN LÝ CỦA CHÚ ============
=== con_ong_chau_cha_mg_khoa_quan_ly ===
# noi:phong_pho_phong_marketing # dieu_kien:minigame khoa quan ly 5 den 9 thang 10
_Khóa "Quản Lý Có Tâm" của chú. Bài kiểm tra trắc nghiệm, 20 câu._
_Câu 1: "Nhân viên xin tăng lương, em nói gì?"_
_A. Đồng ý. B. Từ chối. C. Hẹn họp. D. "Anh không ép, tùy em."_
_Bạn biết đáp án đúng. Cả công ty biết đáp án đúng. Đó mới là vấn đề._
-> END

=== con_ong_chau_cha_mg_khoa_quan_ly_thang ===
# noi:phong_pho_phong_marketing # dieu_kien:qua bai kiem tra
_20/20 câu. Toàn bộ đáp án đúng là câu của chú. Bạn được cấp chứng chỉ "Quản Lý Có Tâm", in giấy cứng, có chữ ký chú._
~ long_co_chung_chi = true
~ long_od(5)
~ tien_cong(100000)
~ long_co_banh_pia = true
~ an(15)
thanh_ninh: *(gửi kèm hộp bánh pía)* Chúc mừng em nha {con_ong_chau_cha}! Anh {giam_doc} khen em quá trời!
_Bạn treo chứng chỉ lên bàn. Rồi nhìn nó. Rồi lật úp lại. Rồi lật lên. Bạn không biết mình tự hào hay ngại._
-> END

=== con_ong_chau_cha_mg_khoa_quan_ly_thua ===
# noi:phong_pho_phong_marketing # dieu_kien:truot bai kiem tra
_Bạn chọn đáp án A ở câu 1: "Đồng ý tăng lương". Sai. Câu 7: "Nhân viên khóc ở sân thượng, em làm gì?" Bạn chọn "Ngồi xuống nghe". Sai. Đáp án đúng: "Gửi email nhắc giờ làm"._
~ cang_thang(5)
~ long_tl(3)
giam_doc: *(đọc bài, nhíu mày)* {con_ong_chau_cha}. Cháu trả lời như… nhân viên ấy.
_Bạn trượt khóa quản lý của chú. Lạ là bạn thấy mình trả lời đúng._
-> END
