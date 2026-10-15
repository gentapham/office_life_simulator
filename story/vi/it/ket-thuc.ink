// ============================================================
// IT: BẢO · ĐÁNH GIÁ 30/10 & 6 KẾT THÚC
// Thứ tự ưu tiên:
//   1. loi_nguoi_dung   (Bị Đổ Tội 100, xảy ra bất cứ lúc nào)
//   2. den_tat          (gửi log cho LL + chiến dịch thất bại / Nguyên bị cướp)
//   3. ke_doc_trom      (Lương Tâm ≤ 20 + bị phát hiện đọc trộm)
//   4. nguoi_giu_ky_uc  (bí mật)
//   5. phu_song
//   6. tiem_tat_bat
//   Không khớp điều kiện nào: chọn kết thúc gần nhất theo chỉ số.
// ============================================================

=== it_3010_danh_gia ===
# ngay:30 # gio:16:00 # noi:phong_hop_tang_2 # bat_buoc
_Họp đánh giá cuối tháng. {hr} cầm tập hồ sơ. {giam_doc} ngồi giữa. {dan_dau_tu} chiếu bảng số liệu cả tháng lên màn hình, bằng cái máy chiếu bạn đã tắt đi bật lại 3 lần từ sáng._
giam_doc: Tiếp theo là bộ phận kỹ thuật. {it}.
_Trên màn hình hiện ra: số sự cố trong tháng, số lần rớt mạng, số ticket đã giải. Và một dòng {hr} tự thêm vào: "Số lần được cảm ơn: {it_so_cam_on}"._
{ it_bi_do_toi >= 70:
    hr: Anh {it} ơi, em chỉ muốn cùng anh nhìn lại hành trình. Tháng này… hơi nhiều sự cố, anh ha.
- else:
    hr: Tháng này mạng sống sót qua mất điện, qua Vũng Tàu, qua cả Ngày Internet Quốc tế. Em ghi nhận.
}
{ it_tim_ra_thu_pham:
    { it_thu_pham_29 == "cho":
        _{dan_dau_tu} chiếu đoạn camera {cho} gặm dây. Cả phòng họp cười. Lần đầu tiên, sự cố mạng không phải lỗi của IT._
    - else:
        _{dan_dau_tu} chiếu đoạn camera có cây kéo. Cả phòng họp im lặng. Mọi người nhìn bạn khác đi._
    }
}
{ it_ghi_am_ll:
    giam_doc: Và anh cảm ơn em vì đoạn ghi âm hôm 27. Nếu không, anh không biết người ta đang câu cả nhà mình.
}
~ it_danh_gia_chon()
{ ket_thuc_nhan_vat:
- "loi_nguoi_dung": -> it_kt_loi_nguoi_dung
- "den_tat": -> it_kt_den_tat
- "ke_doc_trom": -> it_kt_ke_doc_trom
- "nguoi_giu_ky_uc": -> it_kt_nguoi_giu_ky_uc
- "phu_song": -> it_kt_phu_song
- else: -> it_kt_tiem_tat_bat
}

// Chọn kết thúc theo thứ tự ưu tiên
=== function it_danh_gia_chon() ===
{
- it_bi_do_toi >= 100:
    ~ chot_ket_thuc("loi_nguoi_dung")
- it_gui_log_ll and (not it_chien_dich_on()):
    ~ chot_ket_thuc("den_tat")
- it_luong_tam <= 20 and it_bi_phat_hien_doc_trom:
    ~ chot_ket_thuc("ke_doc_trom")
- it_nhanh_nguoi_gui_thu and it_nhanh_ban_thu_moc and it_luong_tam >= 80 and (not it_doc_trom_sau_15) and qh_bac_bao_ve >= 80:
    ~ chot_ket_thuc("nguoi_giu_ky_uc")
- it_on_dinh >= 80 and it_bi_do_toi < 30 and it_tim_ra_thu_pham and it_dem_hong_san_sang and (not it_su_co_am_thanh):
    ~ chot_ket_thuc("phu_song")
- it_so_ticket >= 40 and it_so_nguoi_tu_restart >= 5 and (tien + it_tiet_kiem) >= 20000000 and (not it_gui_log_ll):
    ~ chot_ket_thuc("tiem_tat_bat")
// --- Không khớp hẳn: chọn gần nhất ---
- it_gui_log_ll:
    ~ chot_ket_thuc("den_tat")
- it_luong_tam <= 20:
    ~ chot_ket_thuc("ke_doc_trom")
- it_bi_do_toi >= 60:
    ~ chot_ket_thuc("loi_nguoi_dung")
- it_on_dinh >= 70 and it_tim_ra_thu_pham:
    ~ chot_ket_thuc("phu_song")
- else:
    ~ chot_ket_thuc("tiem_tat_bat")
}

// ------------------------------------------------------------
// 😄 📶 PHỦ SÓNG TOÀN CÔNG TY
=== it_kt_phu_song ===
# ngay:31 # gio:23:30 # noi:phong_server
_Đêm Hồng kết thúc. Không một tiếng hú, không một cây đèn tắt. Bạn quay về phòng server lúc gần nửa đêm._
_Trên bàn có một cái hộp to, thắt nơ hồng. Trên nắp dán một tờ đề xuất mua router 12.000.000đ. Đủ ba chữ ký._
_Chữ ký của {giam_doc}. Chữ ký của {ke_toan}, ký luôn không hỏi hóa đơn. Và chữ ký thứ ba, nét run run: của {thanh_ninh}, kèm dòng "Em xin lỗi vì làm mất tờ cũ ạ"._
giam_doc: *(đứng ở cửa, vẫn mặc đồ Ông Kẹ Ngân Hàng)* Từ thứ 2, em là Trưởng nhóm Công nghệ. Nhóm có một người. Nhưng là trưởng nhóm.
giam_doc: Anh không ép. Mà anh cũng không cho em từ chối.
_Bạn mở hộp. Router mới, tám ăng-ten, có 5G thật. Bạn lắp nó vào chỗ cũ. Cái router quấn băng keo được đặt lên kệ, cạnh thùng mì ly, như một tấm huy chương._
_Bạn đặt tên wifi mới._
_"Cam on anh {it}"._
_Một phút sau, điện thoại bạn rung. Rồi rung nữa. Rồi rung liên tục._
hong_hot: "Cam on anh {it}" là tên wifi hả? Trời ơi tui khóc!
chua_te_deadline: Wifi nhanh tới mức tui coi Tóp-tóp không kịp lướt!
editor: Upload 40GB trong 9 phút. Anh ơi. Chín. Phút.
ke_toan: Nhớ giữ hộp với hóa đơn nha ông.
bac_bao_ve: Bác bắt được wifi ở chòi rồi. {cho} cũng bắt được. Nó đang xem video chó.
_21 tin nhắn. Không tin nào nhờ sửa gì. Tất cả chỉ nói một câu, theo 21 cách khác nhau._
_Bạn gõ trả lời vào group, câu dài nhất bạn từng viết trong 10 năm:_
it: Không có gì. Có gì cứ tắt đi bật lại. Không được thì gọi anh.
_Quạt server quay đều. Đèn router xanh. Lần đầu tiên, phòng server có cảm giác như một căn nhà._
-> END

// ------------------------------------------------------------
// 😄 🛠️ TIỆM TẮT ĐI BẬT LẠI
=== it_kt_tiem_tat_bat ===
# ngay:31 # gio:22:00 # noi:hem_69
_Một tuần sau Đêm Hồng, bạn nộp đơn nghỉ việc. {hr} đọc, gật gù, rót trà: "Em lắng nghe anh. Và em… hơi ganh tị."_
_Đầu Hẻm 69, cạnh quán trà đá của Ông Ba, có một tiệm sửa máy mới, rộng đúng 6m². Biển hiệu bạn tự viết bằng sơn trắng:_
_"TẮT ĐI BẬT LẠI. Không được thì vô đây."_
_Ngày khai trương, Bà Tư chủ trọ là người cắt băng. Chú Sáu karaoke mang tới cái loa kẹo kéo bị hư từ năm ngoái. Ông Ba trà đá mang tới cái radio của… Bác {bac_bao_ve}._
ong_ba_tra_da: Ông {bac_bao_ve} nhờ tui mang qua. Ổng nói "Thằng nhỏ sửa cái gì cũng được, trừ cái tật ít nói."
_Khách hàng đầu tiên đẩy cửa bước vào lúc 8 giờ 10, đi cửa sau, ôm cái laptop vỡ màn hình._
dan_dau_tu: {it}! Sửa giùm anh. Anh trả bằng coin… à không. Anh hết chơi coin rồi. Anh trả bằng… lời hứa?
_Bạn nhìn cái laptop. Rồi nhìn {dan_dau_tu}._
_Rồi lần đầu tiên trong đời, bạn nói một câu dài hơn 4 chữ:_
it: Thôi, sửa free. Anh trả nợ cũ cho em là được, từ từ cũng được, miễn là đừng mua coin nữa.
dan_dau_tu: *(đứng hình)* Em… em nói được câu dài vậy hả?
it: Ừ. Tiệm của em mà.
_Trên tường tiệm có dán 5 tờ giấy, chữ viết tay của 5 đồng nghiệp cũ: "Rút ra. Đếm 10. Cắm vô." Họ tự sửa được rồi. Họ vẫn tới, chỉ để uống trà._
_{cho} ghé tiệm mỗi chiều, nằm ngủ dưới bàn, trên đống dây điện, như nằm trong ổ._
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: NGƯỜI GIỮ KÝ ỨC
=== it_kt_nguoi_giu_ky_uc ===
# ngay:31 # gio:23:40 # noi:choi_bao_ve
_Đêm 31/10. Sân khấu đã tắt đèn. Bạn cuộn dây xong cuộn cuối cùng thì bộ đàm rè lên giọng Bác {bac_bao_ve}: "Cháu ra chòi bác một lát."_
_Chòi bảo vệ. Ấm trà nóng. Radio nhỏ. {cho} nằm cuộn tròn trên ghế bố._
bac_bao_ve: Thư mới. Tới chiều nay. Có một đoạn… không phải cho bác.
_Bác đưa bạn lá thư tay, ký đúng một chữ "G". Bác chỉ vào đoạn cuối:_
_"Nhờ anh {bac_bao_ve} cảm ơn cậu IT đã giữ cho công ty mười năm ký ức. Từ nay, cậu ấy giữ chìa khóa phòng lưu trữ."_
_Kẹp trong thư là một chiếc chìa khóa đồng, cũ, nặng tay._
it: Sao… ông ấy biết con?
bac_bao_ve: Bác không thấy gì đâu. Bác chỉ… có kể vài chuyện. Chuyện cái ổ cứng. Chuyện bài hát năm 2015. Chuyện cháu không đọc trộm của ai.
bac_bao_ve: Người giữ được miệng thì ông ấy quý. Bác cũng quý.
_Bạn cầm chìa khóa rất lâu. Ở nhà, cái ổ cứng vẫn nằm trên kệ, dán băng keo đỏ._
_Hôm sau, bạn bóc nhãn cũ, dán một nhãn mới:_
_"ĐƯỢC MỞ. Khi cần."_
{ it_ban_thu_cho == "idol_het_thoi":
    _Trong thư mục "CongVien_2015_moc" giờ có thêm một file: bản thu năm 2026, {idol_het_thoi} hát lại, giọng già hơn, nhưng thật hơn._
}
_Đêm đó bạn ngủ lại chòi. {cho} bò sang, nằm đè lên chân bạn, ngáy khò khò._
bac_bao_ve: Nó chọn người đấy. Ngủ đi cháu.
-> END

// ------------------------------------------------------------
// 😢 🎯 LỖI NGƯỜI DÙNG
=== it_kt_loi_nguoi_dung ===
# ngay:31 # gio:10:00 # noi:phong_hr
_{hr} mời bạn lên phòng uống trà. Trà ngon. Ly sứ trắng. Nụ cười quen thuộc._
hr: Anh {it} ơi, em chỉ muốn cùng anh nhìn lại hành trình thôi.
_Trên bàn có một tờ biên bản. Mục "Nguyên nhân các sự cố trong tháng 10" chỉ có đúng một chữ:_
_"IT."_
* [💬 "Dây đứt ở tủ mạng. Có camera."]
    hr: Em biết. Nhưng biên bản thì cần một cái tên. Mà tên anh thì… ngắn nhất.
* [😶 Uống hết ly trà.]
    hr: *(nhìn ly trà cạn)* Anh lúc nào cũng ít nói. Em sẽ nhớ cái đó.
- _Chiều đó, bạn ôm ba cái máy tính tự ráp ra cổng. Dây điện thòng lòng như đuôi diều._
_{cho} chạy theo bạn từ sân tới tận chòi bảo vệ. Bác {bac_bao_ve} đứng dậy, không nói gì, chỉ mở cổng rộng hơn một chút cho bạn dễ đi._
bac_bao_ve: Cháu đi cẩn thận. Có gì… nhớ ghé uống trà.
_Bạn vừa bước qua khỏi cổng, đèn router trong tòa nhà phía sau chuyển sang màu đỏ._
_Cả tòa nhà mất wifi._
_Điện thoại bạn rung. Group Zalo-lô công ty, tin nhắn mới nhất:_
hong_hot: "Ủa ai biết restart router hông?"
_Không ai trả lời._
_Bạn nhìn tin nhắn rất lâu. Ngón tay đặt trên bàn phím. Rồi bạn cất điện thoại vào túi, đi tiếp._
-> END

// ------------------------------------------------------------
// 😢 👁️ KẺ ĐỌC TRỘM
=== it_kt_ke_doc_trom ===
# ngay:31 # gio:09:00 # noi:phong_server
{ it_nguoi_to != "":
    _Người tố bạn là {ten(it_nguoi_to)}. Một ảnh chụp màn hình log, gửi thẳng vào group công ty. Tên tài khoản admin của bạn hiện rõ ở góc._
- else:
    _Không ai biết ai là người tố đầu tiên. Chỉ biết sáng nay, cả group công ty nhận được một ảnh chụp log: tài khoản admin của bạn, mở hộp thư riêng của 6 người._
}
_Cả công ty đổi mật khẩu trong cùng một ngày._
_Bạn biết vì bạn thấy log. Bạn thấy mật khẩu mới của từng người, vì hệ thống vẫn báo về cho admin. Và mật khẩu mới của ai cũng giống nhau:_
_"{it}DungDocNua"._
_9 giờ 15, {hr} gửi email: "Tạm thu hồi quyền quản trị hệ thống của anh {it} để rà soát." Từng tài khoản admin bị khóa. Một. Hai. Mười bốn._
_Bạn ngồi trong phòng server. Cái quạt công nghiệp vẫn quay. Ly mì trên bàn đã nguội từ lúc nào._
_Không ai gõ cửa. Không ai nhắn "Anh {it} ơi"._
_Hôm đó máy in kẹt giấy hai lần. {ke_toan} tự gỡ, rách cả hai tờ, nhưng không gọi bạn._
_Chiều, có tiếng động ngoài cửa. Bạn đứng dậy, tim đập nhanh._
cho: Gâu.
_Chỉ có {cho}. Đánh hơi khe cửa, nằm xuống một lúc, rồi bỏ đi._
_Bạn mở lại một hộp thư riêng cũ, theo thói quen. Rồi bạn tắt nó đi. Lần này là bạn tự tắt. Nhưng đã muộn._
-> END

// ------------------------------------------------------------
// 😢 🌑 ĐÈN TẮT
=== it_kt_den_tat ===
# ngay:31 # gio:21:30 # noi:toa_nha_ll
_Đêm 31/10. Tầng 14, tòa nhà kính LL-Entertainment. Phòng IT 20 người, 20 màn hình, router đời mới nhất. Màn hình nào cũng sáng màu xanh lá chuối._
_Bạn ngồi ở bàn "Trưởng phòng Công nghệ". Ghế xoay, đệm êm, không có thùng mì ly._
_Trên màn hình lớn, ai đó mở livestream Đêm Hồng phía bên kia đường._
{ nguyen_theo_ll:
    _Sân khấu Đêm Hồng không có {sieu_nhan_hong}. Chỉ có {chi_dai} đứng giữa sân khấu, xin lỗi khán giả bằng giọng không run. Khán đài vãn dần._
- else:
    _{sieu_nhan_hong} vẫn diễn. Nhưng con số người theo dõi đứng yên, cách một triệu rất xa. Lịch trình bốn ngày qua đã nằm trong tay người khác._
}
_Rồi sân khấu bên kia đường tắt từng ngọn đèn. Một. Hai. Mười. Không có ai đứng sau cánh gà giữ cầu dao. Không ai bấm 8 lần đèn hồng._
_Đồng nghiệp mới ở bàn bên cạnh, mặc áo xanh lá chuối, quay sang hỏi:_
dong_nghiep_ll: Anh ơi, wifi bên mình có tên là gì vậy anh?
_Bạn mở danh sách mạng. "LL-STAFF-5G". Không có băng keo. Không có ai chửi khi nó rớt, vì nó không bao giờ rớt._
_Bạn chợt nhận ra mình nhớ cái router quấn băng keo đen._
_Bạn nhớ cả tiếng "Anh {it} ơi" mỗi sáng. Mười bốn tin nhắn. Cái nào cũng phiền. Cái nào cũng là người cần mình._
_Điện thoại bạn im lặng cả đêm._
-> END
