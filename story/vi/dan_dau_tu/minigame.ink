// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · MINIGAME (mở đầu / thắng / thua)
// Game mở cảnh _mg_<tên> trước khi chơi, rồi nhảy vào _thang hoặc _thua.
// LƯU Ý: "Cửa Sổ Chart" được thiết kế để mọi lệnh mua đều thua.
// Nước đi đúng duy nhất là tắt app.
// ============================================================

// ================= 📊 BÁO CÁO LƯỢT XEM =================
=== dan_dau_tu_mg_bao_cao ===
_Bảng số liệu hôm nay bẩn như bàn pantry chiều thứ 6: dòng trùng, ô trống, và một nghìn tài khoản tên "user123…" cùng xem một video lúc 3 giờ sáng._
_Lọc dòng trùng. Khoanh lượt xem ảo. Rồi chọn khung giờ đăng bài tốt nhất cho {hong_hot}._
{ ddt_ban_chu_no_ok and ngay >= 24:
    _Hôm nay bạn làm thêm một bản báo cáo thuê, để trừ nợ cho một chủ nợ._
}
-> END

=== dan_dau_tu_mg_bao_cao_thang ===
_Bảng sạch bong. Khung giờ đề xuất: 20:00. {hong_hot} đăng đúng giờ, lượt tương tác nhảy vọt._
~ tien_cong(150000)
~ nhan(ca_phe)
~ uong(15)
~ nghi(15)
~ ddt_lam_that(5)
{ qh_hong_hot >= 30:
    ~ follow(5000)
    hong_hot: Anh {dan_dau_tu}! Đăng 20:00 nổ thiệt! Anh là thầy bói số liệu hả?
- else:
    _{hong_hot} đăng lúc 21:40 vì mải hóng chuyện. Vẫn tốt, nhưng không tốt bằng._
    ~ follow(2000)
}
{ ddt_ban_chu_no_ok and ngay >= 24:
    { ddt_no_huyen > 0:
        ~ ddt_xoa("sales", 1000000)
        sales: Báo cáo thật nè! Trừ anh 1 triệu. Tin em đi, lần này em giữ lời.
    - else:
        { ddt_no_bao > 0:
            ~ ddt_xoa("it", 1000000)
            it: Trừ một triệu.
        - else:
            { ddt_no_oanh > 0:
                ~ ddt_xoa("bien_kich", 500000)
                bien_kich: Số liệu khán giả cho phim em. Đây không phải nợ, đây là… hợp tác. Xóa nha anh.
            - else:
                { ddt_no_duy > 0:
                    ~ ddt_xoa("thuc_tap_sinh", 500000)
                    thuc_tap_sinh: Dạ anh khỏi trả em nữa ạ! Báo cáo anh làm em học được nhiều lắm ạ!
                }
            }
        }
    }
}
-> END

=== dan_dau_tu_mg_bao_cao_thua ===
_Bạn chọn khung giờ 15:00, đúng lúc cả nước đang ngủ trưa muộn. Lý do thật: lúc đó chart có nến xanh, bạn hơi xao nhãng._
{ ddt_niem_tin >= 70:
    _{giam_doc} tin số liệu của bạn hơn của {sales}. Nên cả chiến dịch đăng theo giờ sai._
}
~ follow(-10000)
~ ddt_dc(-3)
~ cang_thang(5)
-> END

// ================= 🔮 DỰ ĐOÁN MỐC =================
=== dan_dau_tu_mg_du_doan ===
_Bạn nhìn bảng tăng trưởng, nhìn lịch sự kiện, nhìn tâm trạng của {sieu_nhan_hong} hôm nay. Rồi ghi một con số lên giấy._
{ ngay == 7:
    _Mốc 1: 50.000 người theo dõi._
}
{ ngay == 14:
    _Mốc 2: 200.000 người theo dõi._
}
{ ngay == 21:
    _Mốc 3: 500.000 người theo dõi._
}
{ ngay == 28:
    _Mốc 4: 800.000 người theo dõi._
}
_Sai số dưới 5% thì {giam_doc} thưởng. Sai quá 30% thì bị "truyền lửa"._
-> END

=== dan_dau_tu_mg_du_doan_thang ===
_Cuối ngày. Con số thật cách con số bạn ghi chưa tới 5%. {giam_doc} cầm tờ giấy, nhìn bạn như nhìn một nhà tiên tri._
giam_doc: Em đoán kiểu gì mà sát thế? Anh không ép, nhưng từ giờ có số gì anh hỏi em trước.
~ tien_cong(300000)
~ ddt_co_banh_chuoi = ddt_co_banh_chuoi + 1
~ an(20)
~ ddt_du_doan_dung = ddt_du_doan_dung + 1
~ ddt_lam_that(5)
~ qh("giam_doc", 5)
_{sieu_nhan_hong} gửi xuống từ phòng chờ một đĩa bánh chuối chiên, kèm tờ giấy: "Cho anh đoán số giỏi. Hồng là thái độ!"_
{ ddt_du_doan_dung >= 4:
    _Bốn mốc, bốn lần đúng. Trong phòng, có người bắt đầu gọi bạn là "Người Đọc Số"._
}
-> END

=== dan_dau_tu_mg_du_doan_thua ===
_Con số thật cách con số bạn ghi hơn 30%. Bạn đã ghi theo cảm giác "lần này là lên thật"._
giam_doc: {dan_dau_tu}. Ngồi xuống. Anh "truyền lửa" cho em một tiếng.
_Một tiếng về "mindset", "hành trình", "khát vọng". Bạn cảm thấy mình như cây nến bị hơ lửa._
{ ngay == 7 and nguoi_theo_doi < 50000:
    _Mà không chỉ bạn. Vì trượt mốc 1, chiều nay cả công ty bị họp khẩn "truyền lửa" 3 tiếng._
    ~ tinh_than_cong_ty = tinh_than_cong_ty - 5
}
~ cang_thang(15)
~ nghi(-15)
~ qh("giam_doc", -3)
-> END

// ================= 🏃 NÉ CHỦ NỢ =================
=== dan_dau_tu_mg_ne_chu_no ===
_Từ cổng tới bàn làm việc: 64 bước, 2 cầu thang, 8 chủ nợ._
_{sales} nhìn xa như đại bàng. {it} ngồi im trong phòng server, nhưng cửa luôn hé. Bác {bac_bao_ve} thì luôn ở cổng. Luôn luôn._
-> END

=== dan_dau_tu_mg_ne_chu_no_thang ===
_Bạn tới bàn mà không chạm mặt ai. Trên bậc cầu thang có một gói snack ai bỏ quên. Bạn nhặt. Chiến lợi phẩm._
~ an(10)
~ ddt_ne_trong_ngay = ddt_ne_trong_ngay + 1
{ ddt_ne_trong_ngay >= 3:
    _Ba chủ nợ trong một ngày, không ai thấy bạn. Bạn là ninja cầu thang. Bạn cũng thấy mình hơi giống con chuột._
}
~ ddt_nt(3)
-> END

=== dan_dau_tu_mg_ne_chu_no_thua ===
_Chiếu nghỉ tầng 1. {sales} ở trên. {it} ở dưới. Không đường lui._
sales: Bắt được rồi nha anh! 500 nghìn!
{ tien >= 500000:
    ~ ddt_tra("sales", 500000)
    _Bạn trả. Đau, nhưng nhẹ. {sales} bất ngờ tới mức quên mắng._
    ~ qh("sales", 5)
- else:
    _Ví trống. {sales} nhìn vào ví, thở dài, dán lên lưng áo bạn tờ giấy nhắc nợ mini._
    ~ qh("sales", -5)
}
~ cang_thang(10)
-> END

// ================= 📱 CỬA SỔ CHART =================
=== dan_dau_tu_mg_cua_so_chart ===
_Màn hình phải sáng lên. Chart. Nến. Nút "MUA" xanh lè, to như cái nút thang máy._
_Bất kỳ nút "mua" nào bạn bấm, giá cũng sẽ quay đầu đi xuống. Bạn biết. Bạn biết từ 3 năm nay._
_Có một cái nút nhỏ xíu ở góc: "Thoát"._
-> END

=== dan_dau_tu_mg_cua_so_chart_thang ===
_Bạn bấm "Thoát". Màn hình phải tối đi. Không có gì xảy ra. Không mất gì cả._
_Bạn ra đầu hẻm, gọi một ly trà đá. Ông Ba trà đá gật gù: "Ngồi chơi, uống miếng nước."_
~ tien_cong(200000)
~ cang_thang(-10)
~ uong(25)
~ ddt_so_lan_tat_app = ddt_so_lan_tat_app + 1
~ ddt_nt(-5)
{ ddt_so_lan_tat_app >= 3 and not ddt_mo_cat_lo:
    ~ ddt_mo_cat_lo = true
    _Lần thứ ba tắt app. Trong đầu bạn, câu "cắt lỗ là thua" lần đầu tiên nghe… sai sai._
}
-> END

=== dan_dau_tu_mg_cua_so_chart_thua ===
_Bạn bấm "MUA". Giá quay đầu đi xuống ngay lập tức, như thể nó chỉ chờ bạn._
~ ddt_tai_khoan = ddt_tai_khoan - 500000
{ ddt_tai_khoan < 0:
    ~ ddt_tai_khoan = 0
}
~ ddt_nt(10)
~ ddt_noi_day()
~ ddt_soi_chart()
{ ngay > 18:
    ~ ddt_mua_sau_18 = true
}
_"Đây là đáy," bạn nói. "Đáy thật rồi." Lần thứ {ddt_so_lan_day}._
-> END

// ================= 🍜 ĂN CHỰC VĂN PHÒNG =================
=== dan_dau_tu_mg_an_chuc ===
_Cháy túi. Bụng réo. Công ty đang có tiệc. Tìm đồ ăn mà không bị ai bắt gặp. Nội quy số 6: không lấy đồ có tên trong tủ lạnh._
-> END

=== dan_dau_tu_mg_an_chuc_thang ===
~ ddt_so_lan_an_chuc = ddt_so_lan_an_chuc + 1
{ RANDOM(1, 3):
- 1:
    _Một hộp cơm thừa từ buffet, nguyên vẹn, nắp còn đóng. Bạn ôm nó như ôm một khoản lợi nhuận._
    ~ an(60)
- 2:
    _Một miếng bánh kem, góc có chữ "Happy". Chữ "Birthday" đã có người ăn._
    ~ an(20)
    ~ cang_thang(-5)
- 3:
    _Một ly trà sữa chưa ai nhận, không ghi tên. Bạn kiểm tra kỹ. Không có tên thật._
    ~ uong(30)
    ~ cang_thang(-10)
}
{ ddt_so_lan_an_chuc >= 5:
    _Năm sự kiện, không ai bắt được. Ăn chực chuyên nghiệp. Bạn không biết nên tự hào hay nên buồn._
}
-> END

=== dan_dau_tu_mg_an_chuc_thua ===
_Bạn vừa mở nắp hộp cơm thì đèn flash lóe lên._
hong_hot: Anh {dan_dau_tu}! Ăn chực bị bắt quả tang nha! Lên group liền!
_Group Zola: ảnh bạn cầm hộp cơm, mặt như con mèo bị bắt quả tang trên bàn ăn. 18 lượt thả "haha"._
~ danh_tieng = danh_tieng - 10
~ an(30)
~ cang_thang(10)
-> END

// ================= 💍 MẶC CẢ CẦM ĐỒ =================
=== dan_dau_tu_mg_cam_do ===
_Tiệm cầm đồ Cứu Nguy. Chủ tiệm lật món đồ của bạn qua lại, mặt chán như nhìn chart đi ngang._
chu_cam_do: Đồ này cầm được nhiêu đây thôi nha.
_Chủ tiệm chê. Bạn khen. Ai giỏi nói hơn thì thắng. Bạn là người từng thuyết phục {con_ong_chau_cha} "góp vốn". Bạn có kinh nghiệm._
-> END

=== dan_dau_tu_mg_cam_do_thang ===
{ ddt_co_dong_ho:
    ~ ddt_co_dong_ho = false
    ~ tien_cong(1500000)
    _Chiếc đồng hồ nằm lại trong tủ kính. Bạn cầm 1.500.000đ. Chuộc lại thì mắc gấp rưỡi. Bạn biết. Bạn vẫn ký._
- else:
    { ddt_co_laptop_cu:
        ~ ddt_co_laptop_cu = false
        ~ tien_cong(3000000)
        _Laptop cũ, cái từng mở chart 3 năm liền, nằm lại tiệm. Bạn cầm 3.000.000đ. Màn hình phải của đời bạn vừa tắt, theo cách không ai ngờ._
    - else:
        _Bạn không còn gì để cầm. Chủ tiệm nhìn chiếc điện thoại công ty trong túi bạn. Bạn nhìn chủ tiệm. Bạn quay về._
    }
}
chu_cam_do: Mặc cả giỏi đó. Lần sau đừng có lần sau nha.
-> END

=== dan_dau_tu_mg_cam_do_thua ===
_Chủ tiệm chê tới mức bạn bắt đầu tin món đồ của mình vô giá trị. Bạn cầm được 500.000đ._
{ ddt_co_dong_ho:
    ~ ddt_co_dong_ho = false
- else:
    ~ ddt_co_laptop_cu = false
}
~ tien_cong(500000)
~ cang_thang(10)
_Ra khỏi tiệm, bạn nhìn cổ tay trống. Bạn vẫn quen giơ tay xem giờ._
-> END
