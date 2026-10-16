// ============================================================
// IT: BẢO · 6 KẾT THÚC
// Chạy sau Đại Nhạc Hội Siêu Nhân (23:30 ngày 31/10), khi
// ket_thuc_su_nghiep và chung_cong_ty_song đã được chốt.
// Thứ tự:
//   1. 🔒 nguoi_giu_ky_uc (bí mật)
//   2. phu_song
//   3. tiem_tat_bat
//   4. ke_doc_trom      (Lương Tâm thấp + bị phát hiện đọc trộm)
//   5. den_tat          (đã gửi log cho LL + công ty không sống)
//   6. loi_nguoi_dung   (Bị Đổ Tội cao)
//   Mặc định: tiem_tat_bat.
// ============================================================

=== it_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau_dem_hong
{ ket_thuc_su_nghiep == "":
    ~ chung_chot_ket_thuc_su_nghiep()
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
- it_nhanh_nguoi_gui_thu and (it_nhanh_ban_thu_moc or it_biet_o_cung) and it_luong_tam >= 55 and (not it_doc_trom_sau_15) and (not it_gui_log_ll):
    ~ chot_ket_thuc("nguoi_giu_ky_uc")
- it_on_dinh >= 85 and it_bi_do_toi < 40 and it_tim_ra_thu_pham and it_dem_hong_san_sang and (not it_su_co_am_thanh) and (not it_gui_log_ll):
    ~ chot_ket_thuc("phu_song")
- it_so_nguoi_tu_restart >= 6 and it_tiet_kiem >= 6000000 and it_bi_do_toi < 60 and (not it_gui_log_ll):
    ~ chot_ket_thuc("tiem_tat_bat")
- it_luong_tam <= 40 and it_bi_phat_hien_doc_trom:
    ~ chot_ket_thuc("ke_doc_trom")
- it_gui_log_ll and (not it_chien_dich_on()):
    ~ chot_ket_thuc("den_tat")
- it_bi_do_toi >= 60:
    ~ chot_ket_thuc("loi_nguoi_dung")
- else:
    ~ chot_ket_thuc("tiem_tat_bat")
}

// ------------------------------------------------------------
// 😄 📶 PHỦ SÓNG TOÀN CÔNG TY
=== it_kt_phu_song ===
# ket_thuc:phu_song # loai:co_hau
_Đại Nhạc Hội Siêu Nhân kết thúc. Không một tiếng hú, không một cây đèn tắt. Bạn quay về phòng server lúc gần nửa đêm._
{ not chung_cong_ty_song:
    _Con số không đủ. Thứ Hai công ty sẽ nhận giấy đòi tiền. Nhưng đêm nay, đèn của bạn không tắt lần nào. Ai cũng thấy._
}
_Trên bàn có một cái hộp to, thắt nơ hồng. Trên nắp dán một tờ đề xuất mua router 12.000.000đ. Đủ ba chữ ký._
_Chữ ký của {giam_doc}. Chữ ký của {ke_toan}, ký luôn không hỏi hóa đơn. Và chữ ký thứ ba, nét run run: của {thanh_ninh}, kèm dòng "Em xin lỗi vì làm mất tờ cũ ạ"._
{ chung_cong_ty_song:
    giam_doc: *(đứng ở cửa, vẫn mặc đồ Ông Kẹ Ngân Hàng)* Từ thứ 2, em là Trưởng nhóm Công nghệ. Nhóm có một người. Nhưng là trưởng nhóm.
    giam_doc: Anh không ép. Mà anh cũng không cho em từ chối.
- else:
    giam_doc: *(đứng ở cửa, vẫn mặc đồ Ông Kẹ Ngân Hàng)* Công ty còn bao lâu thì anh không biết. Nhưng cái router này là của em. Mang theo đi đâu cũng được.
}
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
# ket_thuc:tiem_tat_bat # loai:co_hau
{ chung_cong_ty_song:
    _Một tuần sau Đại Nhạc Hội Siêu Nhân, công ty vẫn còn, và bạn nộp đơn nghỉ việc. {hr} đọc, gật gù, rót trà: "Em lắng nghe anh. Và em… hơi ganh tị."_
- else:
    _Một tuần sau Đại Nhạc Hội Siêu Nhân, công ty đóng cửa. Bạn ôm cái router quấn băng keo về nhà. Quỹ router của bạn giờ thành vốn mở tiệm._
}
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
# ket_thuc:nguoi_giu_ky_uc # loai:co_hau # bi_mat
_Đêm 31/10. Sân khấu đã tắt đèn. Bạn cuộn dây xong cuộn cuối cùng thì bộ đàm rè lên giọng Bác {bac_bao_ve}: "Cháu ra chòi bác một lát."_
_Chòi bảo vệ. Ấm trà nóng. Radio nhỏ. {cho} nằm cuộn tròn trên ghế bố._
bac_bao_ve: Thư hôm qua, 30/10. Bác để dành tới tối nay mới đưa. Có một đoạn… không phải cho bác.
_Bác đưa bạn lá thư tay, ký đúng một chữ "G". Bác chỉ vào đoạn cuối:_
_"Nhờ anh {bac_bao_ve} cảm ơn cậu IT đã giữ cho công ty mười năm ký ức. Từ nay, cậu ấy giữ chìa khóa phòng lưu trữ."_
_Kẹp trong thư là một chiếc chìa khóa đồng, cũ, nặng tay. {chung_cong_ty_song:Phòng lưu trữ vẫn còn đó.|Công ty có thể không còn. Nhưng ký ức của nó thì cần một người giữ.}_
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
# ket_thuc:loi_nguoi_dung # loai:buon
{ chung_cong_ty_song:
    _Đại Nhạc Hội qua rồi. Công ty còn. Nhưng cả tháng sự cố cần một cái tên để ghi vào biên bản._
- else:
    _Đại Nhạc Hội qua rồi. Công ty không qua được. Và người ta cần một cái tên để đổ lỗi trước khi giải tán._
}
_Thứ Hai, 2/11. {hr} mời bạn lên phòng uống trà. Trà ngon. Ly sứ trắng. Nụ cười quen thuộc._
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
_Điện thoại bạn rung. Group Zola công ty, tin nhắn mới nhất:_
hong_hot: "Ủa ai biết restart router hông?"
_Không ai trả lời._
_Bạn nhìn tin nhắn rất lâu. Ngón tay đặt trên bàn phím. Rồi bạn cất điện thoại vào túi, đi tiếp._
-> END

// ------------------------------------------------------------
// 😢 👁️ KẺ ĐỌC TRỘM
=== it_kt_ke_doc_trom ===
# ket_thuc:ke_doc_trom # loai:buon
_23:40. Đại Nhạc Hội vừa tan, đồng nghiệp còn đang chụp ảnh ở sân khấu thì điện thoại cả công ty cùng rung._
{ it_nguoi_to != "":
    _Người tố bạn là {ten(it_nguoi_to)}. Một ảnh chụp màn hình log, gửi thẳng vào group công ty. Tên tài khoản admin của bạn hiện rõ ở góc._
- else:
    _Không ai biết ai là người tố đầu tiên. Chỉ biết cả group công ty nhận được một ảnh chụp log: tài khoản admin của bạn, mở hộp thư riêng của 6 người._
}
_Cả công ty đổi mật khẩu trong cùng một ngày._
_Bạn biết vì bạn thấy log. Bạn thấy mật khẩu mới của từng người, vì hệ thống vẫn báo về cho admin. Và mật khẩu mới của ai cũng giống nhau:_
_"{it}DungDocNua"._
_Sáng thứ Hai, 9 giờ 15, {hr} gửi email: "Tạm thu hồi quyền quản trị hệ thống của anh {it} để rà soát." Từng tài khoản admin bị khóa. Một. Hai. Mười bốn._
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
# ket_thuc:den_tat # loai:buon
_23:30. Bạn tắt bàn đèn sân khấu Đại Nhạc Hội Siêu Nhân, từng ngọn một. Một. Hai. Mười. Lần cuối cùng._
{ nguyen_theo_ll:
    _Tối nay sân khấu không có {sieu_nhan_hong}. Lịch trình bốn ngày qua, cái log bạn gửi hôm 27, đã giúp người ta biết lúc nào nên gõ cửa anh ấy._
- else:
    _{sieu_nhan_hong} đã diễn hết sức. Nhưng con số đứng yên, và lịch trình bốn ngày qua đã nằm trong tay người khác từ hôm 27._
}
_Thứ Hai, 2/11. Công ty nhận giấy đòi tiền. Thứ Ba, bạn nhận email của Lưu Lực: "Lời mời vẫn còn."_
_Tháng 11. Tầng 14, tòa nhà kính LL-Entertainment. Phòng IT 20 người, 20 màn hình, router đời mới nhất. Màn hình nào cũng sáng màu xanh lá chuối._
_Bạn ngồi ở bàn "Trưởng phòng Công nghệ". Ghế xoay, đệm êm, không có thùng mì ly._
_Đồng nghiệp mới ở bàn bên cạnh, mặc áo xanh lá chuối, quay sang hỏi:_
dong_nghiep_ll: Anh ơi, wifi bên mình có tên là gì vậy anh?
_Bạn mở danh sách mạng. "LL-STAFF-5G". Không có băng keo. Không có ai chửi khi nó rớt, vì nó không bao giờ rớt._
_Bạn chợt nhận ra mình nhớ cái router quấn băng keo đen._
_Bạn nhớ cả tiếng "Anh {it} ơi" mỗi sáng. Mười bốn tin nhắn. Cái nào cũng phiền. Cái nào cũng là người cần mình._
_Điện thoại bạn im lặng cả đêm._
-> END
