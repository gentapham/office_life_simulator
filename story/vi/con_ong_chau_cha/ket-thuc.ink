// ============================================================
// CON ÔNG CHÁU CHA: LONG · 6 kết thúc
// 😄 nhac_si_khong_can_o · tu_thue_tro · ban_pho_hai_nguoi (bí mật)
// 😢 mai_la_chau · bai_hat_bi_cuop · chu_oi_cuu_chau
// ============================================================

// ------------------------------------------------------------
// Đánh giá kết thúc. Chốt sau họp đánh giá 30/10, chiếu sau Đêm Hồng.
=== con_ong_chau_cha_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau Dem Hong, chot ket thuc cua Long
// 1. Bí mật: hai người đề cử nhau
{ qh_truong_phong >= 60 && long_mo_phong_thu_nhat && long_de_cu_nhat && long_nhat_de_cu_long:
    ~ chot_ket_thuc("ban_pho_hai_nguoi")
    -> con_ong_chau_cha_kt_ban_pho_hai_nguoi
}
// 2. Bài hát bị cướp: bán cho LL, hoặc để Phát hát mà không ghi tên
{ long_ban_cho_ll || (long_nguoi_hat == "phat" && not long_ghi_ten && long_bai_phat_hanh):
    ~ chot_ket_thuc("bai_hat_bi_cuop")
    -> con_ong_chau_cha_kt_bai_hat_bi_cuop
}
// 3. Mãi là cháu
{ long_nhan_ghe && long_o_du >= 70:
    ~ chot_ket_thuc("mai_la_chau")
    -> con_ong_chau_cha_kt_mai_la_chau
}
// 4. Nhạc sĩ không cần ô
{ long_bai_hat >= 100 && long_tang_bai_nguyen && not long_ban_cho_ll && long_ghi_ten && (long_nguoi_hat == "nguyen" || long_nguoi_hat == "song_ca"):
    ~ chot_ket_thuc("nhac_si_khong_can_o")
    -> con_ong_chau_cha_kt_nhac_si_khong_can_o
}
// 5. Tự thuê trọ
{ long_tu_lap >= 80 && long_o_du <= 20 && long_tu_choi_ghe && long_so_ca_lam_them >= 5:
    ~ chot_ket_thuc("tu_thue_tro")
    -> con_ong_chau_cha_kt_tu_thue_tro
}
// 6. Chú ơi cứu cháu: chiến dịch thất bại, chưa tự đứng được
{ nguoi_theo_doi < 1000000 && long_tu_lap < 30:
    ~ chot_ket_thuc("chu_oi_cuu_chau")
    -> con_ong_chau_cha_kt_chu_oi_cuu_chau
}
// Còn lại: chọn kết gần nhất với con đường đã đi
{ long_nhan_ghe:
    ~ chot_ket_thuc("mai_la_chau")
    -> con_ong_chau_cha_kt_mai_la_chau
}
{ long_tu_lap >= 40:
    ~ chot_ket_thuc("tu_thue_tro")
    -> con_ong_chau_cha_kt_tu_thue_tro
}
~ chot_ket_thuc("chu_oi_cuu_chau")
-> con_ong_chau_cha_kt_chu_oi_cuu_chau

// ------------------------------------------------------------
// 😄 🎵 NHẠC SĨ KHÔNG CẦN Ô
=== con_ong_chau_cha_kt_nhac_si_khong_can_o ===
# noi:san_khau_dem_hong
_Đêm Hồng. 20 giờ 30. Sân khấu tối om. Một vệt đèn hồng rọi xuống giữa sân khấu._
{ long_nguoi_hat == "song_ca":
    _{sieu_nhan_hong} và {idol_het_thoi} đứng chung một vệt sáng. Một người từng là siêu sao, một người đang muốn thành siêu sao._
- else:
    _{sieu_nhan_hong} đứng một mình, tay cầm micro, tay kia cầm chiếc USB nhỏ bạn tặng hôm sinh nhật, như cầm bùa hộ mệnh._
}
_Nhạc dạo "Hồng Là Thái Độ". Tiếng đàn ghi-ta mộc, đúng hợp âm bạn đã gảy 100 lần ở phòng thu tầng 30._
sieu_nhan_hong: Hồng không phải màu… Hồng là thái độ…
_Điệp khúc lần đầu: khán đài im phăng phắc. Mười nghìn người nín thở._
_Điệp khúc lần thứ hai: cả khán đài hát theo. Mười nghìn người hát câu bạn viết lúc 3 giờ sáng._
_Đoạn bridge: "Sau chiếc mũ là một người bình thường. Người bình thường cũng cần ai đó gọi tên." {sieu_nhan_hong} hát câu đó, nghẹn một nhịp, rồi hát tiếp._
_Bài hát kết thúc. Màn hình lớn chạy chữ, chậm rãi:_
_"Nhạc & lời: {con_ong_chau_cha}."_
_Không có chữ "cháu" nào phía trước._
_Bạn đứng trong cánh gà, tay nắm chặt rèm. Chú bạn ngồi hàng ghế đầu, mặc đồ "Ông Kẹ Ngân Hàng", vỗ tay không ngừng, không nhìn sân khấu. Chú nhìn cánh gà._
_Trong đám đông, {thuc_tap_sinh} đứng bật dậy, quay sang người bên cạnh, chỉ lên màn hình:_
thuc_tap_sinh: Thần tượng của tui đó! Người viết bài đó! Thần tượng của tui đó!
_Người bên cạnh không biết {con_ong_chau_cha} là ai. Không biết chú của {con_ong_chau_cha} là ai. Họ chỉ biết bài hát hay._
_Lần đầu tiên trong đời, như vậy là đủ._
-> END

// ------------------------------------------------------------
// 😄 🏠 TỰ THUÊ TRỌ
=== con_ong_chau_cha_kt_tu_thue_tro ===
# noi:hem_69
_Tháng 11. Căn penthouse tầng 30 đã có chủ mới. Bể cá to hơn phòng trọ đã được chuyển đi đâu đó._
_Hẻm 69. Hẻm sâu, hai xe máy tránh nhau phải nín thở. Bạn xách một cây đàn và một cái vali. Hết._
_Phòng 15m². Cửa sổ nhìn thẳng vào tường nhà bên. Quạt trần kêu cót két. Bạn giang tay ra, chạm được hai bức tường._
ba_tu: Nay mùng mấy rồi con? Mùng 5 là đóng tiền đó nghe. Đặt cọc một tháng.
_Bạn mở ví. Lương tháng 10, tiền 5 ca làm "Rồng", tiền hoa hồng 3 nhãn hàng. Bạn đếm từng tờ. Từng tờ một. Không có thẻ nào._
ba_tu: Đủ rồi con. *(nhìn bạn từ đầu tới chân)* Nhìn con hông giống người ở trọ.
con_ong_chau_cha: Dạ. Giờ thì giống rồi bà.
_Tối đó, bạn dựng cây đàn vào góc tường. Trải chiếu. Nằm nhìn trần nhà có một vệt ố hình con cá._
_10 giờ đêm. Nhà bên, ông chú bắt đầu hát karaoke. Lạc tông. To. Bài "Công Viên"._
_"Ngày xưa có đôi bạn thân bán cá viên chiên tại công viên…"_
_Ở penthouse, bạn sẽ đóng cửa kính, bật máy lọc không khí. Ở đây, bạn mở cửa sổ ra._
_Bạn bấm ghi âm. Tiếng ông chú hát. Tiếng xe máy. Tiếng bà Tư la ai đó quên tắt đèn. Tiếng một con chó sủa cuối hẻm._
_Bạn mỉm cười. Bài thứ hai sẽ bắt đầu từ đây._
{ qh_thuc_tap_sinh >= 40:
    _Điện thoại rung. {thuc_tap_sinh} nhắn: "Dạ anh {con_ong_chau_cha}, em ở phòng 12 dãy B, cách anh 3 cửa ạ. Mai mình đi làm chung nha anh ạ."_
}
-> END

// ------------------------------------------------------------
// 😄 🔒 BAN PHÓ HAI NGƯỜI (kết thúc bí mật, chung với Nhật)
=== con_ong_chau_cha_kt_ban_pho_hai_nguoi ===
# noi:phong_hop_tang_2
_Họp đánh giá 30/10. Trên bàn chú có hai lá đơn đề cử. Lá của bạn ghi tên {truong_phong}. Lá của {truong_phong} ghi tên bạn._
_Chú nhìn lá này. Nhìn lá kia. Đeo kính vào nhìn lại. Tháo kính ra. Gãi đầu._
giam_doc: Thế thì… hai đứa cùng làm. Anh không ép, tùy các em.
_Cả phòng im lặng ba giây. Rồi {thuc_tap_sinh} vỗ tay một mình. Rồi {chi_dai} vỗ theo. Rồi cả phòng._
con_ong_chau_cha: *(nói nhỏ)* Ủa, vậy là tui với ông chung ghế hả?
truong_phong: Chung bàn. Ghế thì mỗi người một cái.
_Một tháng sau._
_Phòng Phó Giám đốc có một cái bàn dài. Một đầu bàn có một tấm bảng trắng nhỏ, kín sơ đồ sản xuất. Đầu kia có một cây đàn ghi-ta dựng nghiêng và một cái bàn phím nhỏ._
_{truong_phong} lo sản xuất. Bạn lo âm nhạc. "Hồng Là Thái Độ" đã có bản 43, lần này có đoạn bè do chính {truong_phong} góp ý: "chỗ này nghe như mũi tên đi lên"._
_Bạn vẫn đi trễ, nhưng giờ trễ có lý do: đêm qua thu âm. {truong_phong} vẫn vẽ sơ đồ, nhưng giờ sơ đồ có nốt nhạc._
_Trên lịch chung của hai người chỉ có đúng một cuộc họp mỗi ngày. Lặp lại, không bao giờ hủy:_
_"Họp nhanh 5 phút: trưa nay ăn gì?"_
con_ong_chau_cha: Cơm tấm hông?
truong_phong: Hôm qua cơm tấm rồi. Phở đi.
con_ong_chau_cha: Phở là món Bắc, ông thiên vị.
truong_phong: Thế thì biểu quyết.
_Biểu quyết 1–1. Cuộc họp kéo dài 40 phút. Hai người đói meo, cuối cùng gọi {thuc_tap_sinh} vào làm phiếu quyết định._
thuc_tap_sinh: Dạ… em chọn bánh mì ạ. Em mới vô nên chưa biết ạ.
_Ba người ăn bánh mì trên bậc thềm sân thượng. Không ai nhắc tới cái ghế nữa._
-> END

// ------------------------------------------------------------
// 😢 👑 MÃI LÀ CHÁU
=== con_ong_chau_cha_kt_mai_la_chau ===
# noi:phong_pho_giam_doc
_Tháng 11. Phòng Phó Giám đốc. Vách kính. Ghế da. Bảng tên mạ vàng: "Phó Giám đốc: {con_ong_chau_cha}"._
_Trên bàn có chứng chỉ "Quản Lý Có Tâm", đóng khung. Có một ly cà phê kem. Có một chồng giấy chờ ký, nút "Ký luôn cho lẹ" giờ là một cây bút thật._
_Dưới gầm bàn là hộp đàn. Phủ một lớp bụi mỏng. Bạn không nhớ lần cuối mở nó là khi nào._
_Cửa gõ nhẹ. {thuc_tap_sinh} bước vào, mặc y chang bộ vest bạn mặc hôm qua, hai tay bưng ly cà phê._
thuc_tap_sinh: Dạ anh {con_ong_chau_cha} đỉnh quá ạ! Dạ… sếp {con_ong_chau_cha} đỉnh quá ạ!
_Bạn cười. Bạn nhận ly cà phê. Bạn nói "Chill đi anh Duy". Mọi thứ đều đúng như mọi khi._
_Ngoài kia, ai đi qua cũng gật đầu: "Chào sếp."_
_Trong đầu bạn, bạn vẫn nghe rõ, rất rõ, mọi người đang nói: "Cháu sếp."_
{ long_bai_hat >= 50:
    _Tối đó, bạn về căn hộ mới chú thuê cho. Không có phòng nào khóa. Bản demo cuối cùng nằm trong một thư mục tên "Để sau"._
- else:
    _Tối đó, bạn về căn hộ mới chú thuê cho. Bạn bật ti vi. Đài Tivi Hóng đang phát một bài hát mới của ai đó. Hay. Bạn tắt ti vi._
}
_Điện thoại rung. Chú nhắn: "Mai họp đối tác 9 giờ. Đừng đi muộn. Anh không ép, tùy cháu."_
_Bạn trả lời: "Dạ." Trong 4 giây._
-> END

// ------------------------------------------------------------
// 😢 🎤 BÀI HÁT BỊ CƯỚP
=== con_ong_chau_cha_kt_bai_hat_bi_cuop ===
# noi:chot_bao_ve
_Một buổi trưa tháng 11. Chòi bảo vệ. Ấm trà, cái radio cũ, {cho} ngủ dưới ghế bố._
_Bạn ghé qua, không vì lý do gì. Bác {bac_bao_ve} rót trà, không hỏi gì._
_Radio đang phát một bài hát mới. Tiếng đàn mở đầu. Bạn khựng lại._
_Hợp âm đó. Bạn đã gảy nó 100 lần ở phòng thu tầng 30._
{ long_ban_cho_ll:
    _Giọng hát của một ca sĩ bên LL-Entertainment. Trẻ, đẹp, đúng nhịp. Điệp khúc đã bị đổi một chữ: "Xanh là thái độ"._
- else:
    _Giọng hát của {idol_het_thoi}. Khàn hơn hồi 2015. Hay hơn hồi 2015. Lời đã bị đổi gần hết, chỉ giữ lại giai điệu._
}
_Giai điệu của bạn. Giọng của người khác._
_Bài hát kết thúc. Phát thanh viên đọc bằng giọng vui vẻ: "Vừa rồi là ca khúc đang đứng top xu hướng tuần này. Sáng tác: …"_
_Một cái tên. Không phải tên bạn._
_Bạn ngồi im. Tay cầm chén trà, không uống._
_Bác {bac_bao_ve} với tay vặn nhỏ radio. Rót thêm cho bạn một ly trà đá. Đẩy sang._
bac_bao_ve: Bác không thấy gì đâu.
_Bác ngừng một chút. Nhìn ra cổng._
bac_bao_ve: Nhưng bác nghe thấy.
_Bạn uống hết ly trà đá. Lạnh tới tận óc._
{ long_ban_cho_ll:
    _Trong tài khoản của bạn có một con số rất lớn. Bạn có thể mua một căn hộ nhỏ. Bạn có thể mua một phòng thu mới. Bạn không mua được 41 đêm đó lại._
}
_{cho} thức dậy, dụi đầu vào chân bạn. Ít nhất có một người, à không, một con chó, không nghe radio._
-> END

// ------------------------------------------------------------
// 😢 💸 CHÚ ƠI CỨU CHÁU
=== con_ong_chau_cha_kt_chu_oi_cuu_chau ===
# noi:atm
_Tháng 11. Siêu Nhân Hồng không đạt mục tiêu. {cong_ty} phải hoàn 10 tỷ. Biển hiệu chữ G bảy màu đã được tháo xuống._
_11 giờ đêm. Một cây ATM ở góc Đại lộ Kẹt Xe. Bạn đứng trước màn hình, đút thẻ vào._
_Màn hình nhấp nháy: "Thẻ của quý khách đã bị thu giữ. Vui lòng liên hệ ngân hàng."_
_Máy nuốt thẻ. Không trả lại._
_Bạn đứng đó, tay vẫn đưa ra như chờ cái thẻ chui ra. Không có gì chui ra._
_Bạn rút điện thoại. Bấm số. Như mọi lần. Như mười lăm lần trong tháng này. Như cả đời._
_Chuông đổ. Một hồi. Hai hồi._
_Lần này chú bắt máy._
_Im lặng. Rất lâu. Bạn nghe tiếng gió đầu dây bên kia. Có lẽ chú cũng đang đứng ngoài đường._
con_ong_chau_cha: Chú ơi… thẻ cháu bị nuốt.
_Im lặng tiếp. Rồi giọng chú, khàn đặc, giọng Bắc chưa bao giờ nghe mệt như vậy:_
giam_doc: Chú cũng đang không biết gọi ai, {con_ong_chau_cha} ạ.
_Hai chú cháu cùng im lặng. Mỗi người một đầu dây._
_Không ai cúp máy._
_Cây ATM tắt màn hình, chuyển sang chế độ chờ. Ánh sáng xanh hắt lên mặt bạn. Trên kính, bạn thấy mình: một người 28 tuổi, chưa từng tự đứng một lần nào._
{ long_bai_hat >= 50:
    _Trong túi áo, chiếc USB có bản demo vẫn còn đó. Thứ duy nhất trong tháng này là của bạn. Bạn nắm chặt nó._
}
-> END
