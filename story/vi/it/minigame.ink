// ============================================================
// IT: BẢO · MINIGAME (mở đầu / thắng / thua)
// Game mở cảnh _mg_<tên> trước khi chơi, rồi nhảy vào _thang hoặc _thua.
// ============================================================

// ================= 🎫 TICKET HỖ TRỢ =================
=== it_mg_ticket ===
_8 giờ sáng. Hộp thư hỗ trợ có 8 yêu cầu mới. Cái đầu tiên: "Máy em chậm." Cái thứ hai: "Máy em vẫn chậm." Cả hai từ cùng một người._
hong_hot: Anh {it} ơi, chuột em hư! *(con chuột đang bị úp ngược)*
_Đọc mô tả, chọn chẩn đoán: Restart, Lỗi người dùng, hay Lỗi thật. Chọn sai thì người ta quay lại, bực hơn._
-> END

=== it_mg_ticket_thang ===
_8 trên 8. Không ai quay lại lần hai. {ke_toan} còn nhắn: "Máy in chạy rồi, cảm ơn ông."_
~ tien_cong(160000)
~ it_so_ticket = it_so_ticket + 8
~ it_do_toi(-5)
~ it_cam_on()
~ nhan(ca_phe)
~ uong(20)
~ nghi(25)
thuc_tap_sinh: Dạ anh, chị {hong_hot} gửi anh ly cà phê sữa đá nè. Chị nói "IT xứng đáng".
{ it_so_ticket >= 24:
    _Có người tự khởi động lại máy trước khi gửi ticket. Lần đầu tiên. Bạn suýt rơi nước mắt._
    ~ it_so_nguoi_tu_restart = it_so_nguoi_tu_restart + 1
}
-> END

=== it_mg_ticket_thua ===
_Bạn chẩn đoán máy {dan_dau_tu} là "lỗi thật". Hóa ra là 6 cái chart mở cùng lúc. {dan_dau_tu} quay lại lần hai, bực gấp đôi._
dan_dau_tu: {it}, máy anh vẫn chậm! Chart đứng ngay đáy luôn rồi!
~ tien_cong(80000)
~ it_so_ticket = it_so_ticket + 4
~ it_do_toi(5)
~ cang_thang(10)
-> END

// ================= 🖨️ GIẢI CỨU MÁY IN =================
=== it_mg_may_in ===
_Máy in tầng 1 kêu "rẹt rẹt" rồi im. Đèn đỏ nhấp nháy. Bên trong là bản hợp đồng ai đó in gấp, kẹt ở đâu đó giữa 4 cái nắp._
ke_toan: Ông {it}! Hóa đơn của tui đang ở trong đó! Kéo nhẹ thôi, rách là phải in lại, tốn mực!
_Mở đúng 4 nắp theo thứ tự. Kéo tờ giấy ra thật đều tay. Giật là rách._
-> END

=== it_mg_may_in_thang ===
_Tờ giấy trượt ra, phẳng phiu, không một vết nhăn. Như rút kiếm khỏi đá._
~ tien_cong(50000)
~ it_so_lan_ket_giay = it_so_lan_ket_giay + 1
~ it_cam_on()
{ RANDOM(1, 2) == 1:
    ke_toan: Đẹp. Nè, gói bánh quy. Công ty mua có hóa đơn đàng hoàng đó.
    ~ it_co_banh_quy = it_co_banh_quy + 1
    ~ an(15)
- else:
    ke_toan: Nè, hộp sữa. Uống đi cho có sức mà gỡ tiếp.
    ~ an(10)
    ~ uong(15)
}
~ qh("ke_toan", 3)
-> END

=== it_mg_may_in_thua ===
_"Roạt." Tờ giấy rách làm đôi. Nửa trên trong tay bạn, nửa dưới vẫn ở trong máy, cười vào mặt bạn._
ke_toan: Trời đất. In lại. Tốn thêm một tờ, ba trang mực. Tui ghi sổ nha.
~ it_do_toi(3)
~ qh("ke_toan", -3)
~ cang_thang(5)
-> END

// ================= 🧶 DÒ DÂY MẠNG =================
=== it_mg_do_day ===
_Tủ mạng tầng trệt. 48 sợi dây cùng một màu xanh. Nhãn mờ hết, chỉ còn chữ "phòng…" và "…ếp". 90 giây để lần đúng từng sợi và cắm đúng cổng._
cho: Gâu? *(thò mũi vào tủ ngửi ngửi)*
-> END

=== it_mg_do_day_thang ===
_Sợi cuối cùng vào cổng. Đèn xanh sáng đều một hàng, như dàn đèn Giáng sinh của dân kỹ thuật._
~ tien_cong(150000)
~ it_on(10)
_Lúc đóng tủ, tay bạn chạm phải một thứ gì đó nằm ở đáy tủ._
{ RANDOM(1, 3):
- 1:
    _Một cái thẻ nhớ cũ. Bên trong là ảnh liên hoan năm 2012: Bác {bac_bao_ve} trẻ măng, đứng cạnh {giam_doc} 23 tuổi, và một người đàn ông bị cắt mất nửa khuôn mặt khỏi khung hình._
    ~ it_truy_cap(5)
- 2:
    _Một cây xúc xích còn nguyên vỏ. {cho} đã giấu nó ở đây. {cho} nhìn bạn đầy cảnh giác._
    ~ nhan(xuc_xich)
- 3:
    _Một đồng xu 5.000đ. Không biết của ai. Giờ là của IT._
    ~ tien_cong(5000)
}
-> END

=== it_mg_do_day_thua ===
_Hết 90 giây. Bạn cắm nhầm dây của phòng giám đốc vào cổng của máy chấm công. Máy chấm công giờ có wifi mạnh nhất công ty._
giam_doc: *(gọi điện)* {it} ơi, mạng phòng anh đâu mất rồi?
~ it_on(-5)
~ it_do_toi(5)
-> END

// ================= 🎚️ BÀN MIXER =================
=== it_mg_mixer ===
_Bàn mixer 8 kênh. Ca sĩ sắp lên nốt cao. Giữ các thanh âm lượng trong vùng xanh, kéo xuống kịp trước khi micro hú._
{ ngay == 16 or ngay == 31:
    _Đây là show lớn. Một tiếng hú là cả nước nghe thấy._
}
chi_dai: *(qua bộ đàm)* {it}. Hú một tiếng là chị biết đứa nào.
-> END

=== it_mg_mixer_thang ===
_Nốt cao vút lên rồi hạ xuống êm như chiếc lá. Không một tiếng hú. Ở dưới khán đài, có người khóc vì hay._
{ ngay == 16 or ngay == 31:
    ~ tien_cong(500000)
- else:
    ~ tien_cong(200000)
}
~ nhan(nuoc_suoi)
~ uong(30)
~ an(55)
_Đoàn phát cho bạn một suất cơm hộp. Cơm nguội, nhưng là cơm của người làm xong việc._
~ qh("chi_dai", 5)
~ follow(5000)
-> END

=== it_mg_mixer_thua ===
_HÚÚÚÚÚÚ! Micro hú đúng nốt cao nhất. Ca sĩ nhăn mặt. Khán giả bịt tai. {chi_dai} quay lại nhìn đúng chỗ bạn ngồi._
~ it_do_toi(10)
~ follow(-5000)
~ qh("chi_dai", -5)
{ ngay == 16 or ngay == 31:
    ~ it_su_co_am_thanh = true
}
-> END

// ================= 💡 ĐÁNH ĐÈN THEO NHẠC =================
=== it_mg_danh_den ===
_Bảng điều khiển đèn. Nhạc lên. Bấm đổi màu đúng phách. Luật công ty: mỗi bài phải có ít nhất 8 lần đèn hồng._
sieu_nhan_hong: Ông {it} ơi, cho tui hồng lúc điệp khúc nha! Hồng là thái độ!
-> END

=== it_mg_danh_den_thang ===
_Đèn đổi màu đúng từng phách. Điệp khúc: 8 lần hồng, không thiếu lần nào. Sân khấu đẹp như một cái bánh kem biết nhảy._
~ tien_cong(150000)
~ it_co_que_phat_sang = it_co_que_phat_sang + 1
sieu_nhan_hong: Đỉnh! Tặng ông que phát sáng nè, ai cũng thích hết á!
~ qh("sieu_nhan_hong", 5)
~ follow(5000)
-> END

=== it_mg_danh_den_thua ===
_Bạn bấm lệch phách. Đèn xanh lá chuối bật lên đúng lúc điệp khúc. Cả sân khấu trông như quảng cáo của LL-Entertainment._
chi_dai: {it}! Màu gì vậy em? Đèn đó ai cho vô kho?
~ qh("chi_dai", -5)
~ it_do_toi(5)
-> END

// ================= 💾 CỨU FILE LÚC 2 GIỜ SÁNG =================
=== it_mg_cuu_file ===
_2 giờ sáng. Ổ cứng hỏng hiện ra thành một lưới ô vuông như bãi mìn. Mở đúng ô để ghép lại file. Mở nhầm ô "bad sector" thì mất một đoạn._
{ ngay == 22:
    chua_te_deadline: *(ôm hộp mì)* Anh ơi… cố lên… em mua đủ mì cho tới sáng rồi…
- else:
    _Người nhờ ngồi bên cạnh, cắn móng tay._
}
-> END

=== it_mg_cuu_file_thang ===
_Ô cuối cùng mở ra. Thanh khôi phục chạy tới 100%. File mở được, nguyên vẹn, như chưa từng mất._
~ tien_cong(300000)
~ it_co_pizza = it_co_pizza + 1
~ an(40)
~ it_cam_on()
{ ngay == 22:
    ~ it_cuu_file_vu = true
    ~ phat_hien(usb_cua_vu)
    chua_te_deadline: ANH LÀ THẦN! Pizza của anh nè! Em nợ anh thêm 1 ân tình lớn, ghi sổ đi anh!
    ~ qh("chua_te_deadline", 30)
- else:
    _Người nhờ đưa cho bạn một hộp pizza và một cái ôm hơi lâu._
}
-> END

=== it_mg_cuu_file_thua ===
_Bạn mở nhầm ô "bad sector". Một đoạn file biến mất. Rồi một đoạn nữa._
{ ngay == 22:
    chua_te_deadline: *(ngồi bệt xuống sàn, khóc tại chỗ)* Không sao anh… nước tới cổ rồi… giờ tới mũi thôi…
    ~ qh("chua_te_deadline", 5)
- else:
    _Người nhờ khóc tại chỗ. Bạn đưa khăn giấy, rồi đưa mì._
}
~ cang_thang(15)
~ nghi(-10)
-> END

// ================= 🍜 MÌ LY PHÒNG SERVER =================
=== it_mg_mi_ly ===
_Server cần khởi động lại. Bụng cũng cần. Đổ nước sôi vào ly mì, bấm khởi động lại server, và chờ đúng 3 phút. Server lên trước là mì nhão._
-> END

=== it_mg_mi_ly_thang ===
_Đúng 3 phút. Server lên, mì chín tới, sợi dai, nước trong. Bạn ăn trong im lặng, nghe tiếng quạt server như nghe nhạc thiền._
~ tien_cong(-8000)
~ an(30)
~ nghi(15)
~ cang_thang(-10)
~ it_on(3)
-> END

=== it_mg_mi_ly_thua ===
_Server lên chậm. Mì nở thành một khối như bánh canh. Bạn vẫn ăn. IT không bỏ đồ ăn._
~ tien_cong(-8000)
~ an(20)
~ nghi(5)
-> END
