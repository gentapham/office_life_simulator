// ============================================================
// THÁNH HÓNG: NGÂN · THOẠI MINIGAME
// Mỗi minigame có 3 cảnh: mở đầu, thành công, thất bại.
// ============================================================

// ============================================================
// 📱 LÊN BÀI GIỜ VÀNG
// ============================================================
=== hong_hot_mg_gio_vang ===
# dieu_kien:minigame_gio_vang_mo_dau
_Ảnh {designer} gửi: 6 tấm. Mảnh ghép caption: "Hồng", "thái độ", "slay", "ai hiểu không", một cái meme đang lên. Hashtag. Giờ đăng._
_Giờ vàng: 19:30 – 21:00. Điều khoản số 2: mọi bài phải có ít nhất một chút màu hồng._
designer: *(nhắn)* Ảnh số 4 đẹp nhất nha bà. Đừng chọn ảnh số 2, ổng nhắm mắt.
-> END

=== hong_hot_mg_gio_vang_thanh_cong ===
# dieu_kien:minigame_gio_vang_thanh_cong
_20:04. Bài lên. 3 phút đầu: 1.000 lượt thích. Bình luận đầu tiên là của một tài khoản tên "Mẹ Của Fan Hồng": "Đẹp quá con ơi"._
~ tien_cong(150000)
~ nhan(tra_sua)
~ hh_chuoi_gio_vang = hh_chuoi_gio_vang + 1
~ hh_tt(5)
{ RANDOM(1, 10) <= 4:
    ~ hh_follow(12000)
- else:
    ~ hh_follow(5000)
}
{ hh_chuoi_gio_vang == 7:
    _Bảy ngày liên tiếp đúng giờ vàng. Thuật toán bắt đầu "thương" trang của bạn._
    ~ hh_follow(20000)
}
_Quán trà sữa đầu hẻm gửi một ly "cảm ơn ad đã tag quán"._
-> END

=== hong_hot_mg_gio_vang_that_bai ===
# dieu_kien:minigame_gio_vang_that_bai
_Bạn đăng ảnh số 2. {sieu_nhan_hong} nhắm mắt, miệng há. Caption "slay" nằm ngay dưới. Quên luôn màu hồng: ảnh chụp lúc ổng mặc áo khoác xám._
_Bình luận: "Slay chỗ nào ad?", "Ủa hồng đâu?"_
~ hh_chuoi_gio_vang = 0
~ hh_follow(2000)
~ hh_tt(-3)
~ cang_thang(5)
-> END

// ============================================================
// 🎵 ĐU TREND TÓP-TÓP
// ============================================================
=== hong_hot_mg_du_trend ===
# dieu_kien:minigame_du_trend_mo_dau
_Trend đang lên: "Nhảy ở chỗ làm khi sếp quay lưng". Bạn cầm máy, {sieu_nhan_hong} vào vị trí. Bấm đúng nhịp để giữ khung hình đẹp._
sieu_nhan_hong: Gét gô! Nhạc lên đi em!
_Ở góc sân, {cho} vừa ngẩng đầu khỏi bát cơm._
-> END

=== hong_hot_mg_du_trend_thanh_cong ===
# dieu_kien:minigame_du_trend_thanh_cong
_Khung hình đẹp. Nhịp chuẩn. Rồi {cho} lao vào khung hình, nhảy chồm lên ngoạm chóp mũ hồng._
* [🐕 Giữ nguyên cảnh {cho} cắn mũ.]
    ~ hh_follow(30000)
    ~ hh_tuat_noi_hon_nguyen = true
    sieu_nhan_hong: Mũ của anh! {cho} ơi… thả ra…
    _View gấp đôi. {sieu_nhan_hong} dỗi bạn nửa ngày, ngồi trong phòng chờ ăn bánh chuối chiên một mình._
    ~ qh("sieu_nhan_hong", -5)
* [✂️ Cắt trước khi {cho} vào khung.]
    ~ hh_follow(15000)
    ~ qh("sieu_nhan_hong", 3)
- ~ tien_cong(200000)
~ an(15)
~ hh_tt(5)
_Một nhãn khô gà trong quận gửi tặng một bịch "nhờ ad đăng giùm". Bạn ăn trong lúc dựng clip._
-> END

=== hong_hot_mg_du_trend_that_bai ===
# dieu_kien:minigame_du_trend_that_bai
_Trend đó đã lỗi thời từ… hôm qua. Bình luận: "Trend này hết hot rồi ad ơi", "Đu trend như ông chú tôi"._
_{sieu_nhan_hong} đứng giữa sân, tay vẫn giơ tạo dáng, không biết nên hạ xuống chưa._
~ hh_follow(-3000)
~ hh_tt(-5)
~ scandal()
-> END

// ============================================================
// 💬 TRỰC COMMENT
// ============================================================
=== hong_hot_mg_truc_comment ===
# dieu_kien:minigame_truc_comment_mo_dau
_Bình luận trôi lên liên tục. Avatar xanh lá chuối: xóa. "Hồng là thái độ" từ fan thật: trả lời bằng tim. Bấm nhầm xóa fan thật thì mất điểm._
_"Like Thật 100%"? Cũng là tài khoản ảo. Nhưng là ảo… của nhà mình. Xử lý sao?_
-> END

=== hong_hot_mg_truc_comment_thanh_cong ===
# dieu_kien:minigame_truc_comment_thanh_cong
_Năm mươi bình luận xanh lá chuối biến mất. Những bình luận còn lại toàn là người thật, hỏi thật: "Siêu Nhân Hồng ăn chuối chiên hay khoai chiên vậy?"_
~ tien_cong(100000)
~ nhan(nuoc_tang_luc)
~ hh_tt(10)
~ hh_follow(5000)
_Bạn mở lon nước tăng lực. 23 giờ. Mai còn trực tiếp._
-> END

=== hong_hot_mg_truc_comment_that_bai ===
# dieu_kien:minigame_truc_comment_that_bai
_Bạn xóa nhầm bình luận của "Fan cứng số 1 của Hồng", người đã bình luận dưới mọi bài từ ngày 1/10. Người đó chụp màn hình, đăng lên: "Ad xóa tui?"._
_Trong lúc đó, 2.000 tài khoản xanh lá chuối vẫn đang chê._
~ hh_tt(-5)
~ hh_follow(-5000)
~ cang_thang(10)
-> END

// ============================================================
// 🔴 LIVESTREAM
// ============================================================
=== hong_hot_mg_livestream ===
# dieu_kien:minigame_livestream_mo_dau
_Ba điện thoại: một quay chính, một quay phụ, một đọc bình luận cho {sieu_nhan_hong} trả lời._
_Cảnh giác những thứ không được lên hình: giấy tờ trên bàn, bảng trắng trong phòng họp, người đang khóc, và bất cứ ai đang nói chữ "nợ"._
{ ngay == 23:
    _Hôm nay: sinh nhật {sieu_nhan_hong}. {sales} đã chọn người đóng "Mr. Kevin Trộn": một người đeo kính râm, khoác vest, đang tập nói "Happy birthday" giọng rất kỳ._
}
-> END

=== hong_hot_mg_livestream_thanh_cong ===
# dieu_kien:minigame_livestream_thanh_cong
_Buổi live suôn sẻ. Góc máy sạch. Bình luận được đọc đúng lúc. "Mr. Kevin Trộn" chúc mừng qua video, không ai nhận ra giọng quen quen._
~ tien_cong(300000)
~ nhan(gau_bong)
~ hh_follow(20000)
~ hh_so_live_sach = hh_so_live_sach + 1
~ hh_tt(8)
_Fan gửi tới một hộp quà: một con gấu bông hồng, một cái bánh, và một tấm thiệp ghi "Cảm ơn ad đã cho tụi em thấy Hồng mỗi ngày"._
-> END

=== hong_hot_mg_livestream_that_bai ===
# dieu_kien:minigame_livestream_that_bai
_Bạn đọc nhầm bình luận: "Có phải anh tạo Hồng Coin để lừa fan không?"_
sieu_nhan_hong: Ờm… Hồng Coin là gì vậy mọi người? Sao có coin tên anh?
_Livestream rớt 3.000 người trong 1 phút. Rồi tăng lại 5.000 vì drama._
~ scandal()
~ hh_follow(10000)
~ hh_tt(-3)
-> END

// ============================================================
// 📮 DUYỆT CONFESSION
// ============================================================
=== hong_hot_mg_duyet_confession ===
# dieu_kien:minigame_duyet_confession_mo_dau
_23 giờ. Máy "NGAN-LAPTOP". 10 bài gửi tới trang Confession G-Entertainment. Đăng hay bỏ? Sửa tên cho đỡ lộ hay không?_
_Bài càng cay, càng nhiều người đọc. Bài càng cay, càng nhiều người đi tìm admin._
-> END

=== hong_hot_mg_duyet_confession_thanh_cong ===
# dieu_kien:minigame_duyet_confession_thanh_cong
_Bạn đăng ba bài vui, một bài tâm sự, bỏ sáu bài cay. Đổi hết tên thật thành "bạn A", "anh B". Trang vẫn đông, không ai bị tổn thương._
~ hh_tin(3)
~ tien_cong(50000)
~ hh_lo(-2)
_Một bạn đọc ẩn danh chuyển 50.000đ qua ví điện tử: "Mời ad ly cà phê. Đọc trang này mỗi tối cho đỡ buồn."_
-> END

=== hong_hot_mg_duyet_confession_that_bai ===
# dieu_kien:minigame_duyet_confession_that_bai
_Bạn đăng bài cay nhất, quên sửa tên. Quên luôn rằng bạn đăng lúc 23:04 bằng wifi công ty, từ cái laptop có sticker "NGAN-LAPTOP"._
~ hh_tin(3)
~ hh_lo(5)
~ hh_tt(5)
{ ngay >= 21:
    ~ hh_conf_ac_cuoi_thang = true
}
_Sáng hôm sau, người bị nhắc tên đi vòng quanh văn phòng, hỏi từng người: "Ai biết chuyện này?"_
~ hh_bi_don(1)
-> END

// ============================================================
// 📊 BÁO CÁO SỐ LIỆU
// ============================================================
=== hong_hot_mg_bao_cao ===
# dieu_kien:minigame_bao_cao_mo_dau
_Thứ 6. Bàn số liệu. {dan_dau_tu} xoay màn hình: một bảng số đẹp tới mức đáng ngờ._
dan_dau_tu: Anh làm tròn thôi. Làm tròn lên. Thị trường thích số đẹp. Tin anh.
_Tìm 3 chỗ "làm tròn": lượt xem cộng trùng, một cụm tài khoản ảo cùng ảnh đại diện hoa sen, và một con số 0 thừa._
-> END

=== hong_hot_mg_bao_cao_thanh_cong ===
# dieu_kien:minigame_bao_cao_thanh_cong
_Ba lỗi, bắt đủ ba. {dan_dau_tu} gãi đầu: "Em soi kỹ hơn cả đoàn thuế."_
~ tien_cong(100000)
~ nhan(banh_mi)
~ uy_tin = uy_tin + 5
~ qh("dan_dau_tu", 3)
dan_dau_tu: Ổ bánh mì này anh mời. Anh hứa trả tiền cô Bảy. Tuần sau.
-> END

=== hong_hot_mg_bao_cao_that_bai ===
# dieu_kien:minigame_bao_cao_that_bai
_Báo cáo gửi sếp ghi: "Lượt tiếp cận: 12.000.000". Thêm đúng một con số 0. Sếp đọc, gửi group 14 sticker pháo hoa._
_Một tuần sau, sếp hỏi vì sao 12 triệu người tiếp cận mà chỉ có {nguoi_theo_doi} người theo dõi._
~ uy_tin = uy_tin - 5
~ cang_thang(8)
-> END
