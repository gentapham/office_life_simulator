// ============================================================
// THÁNH HÓNG: NGÂN · SÁU KẾT THÚC
// Thứ tự ưu tiên: Lỡ Tay Bấm Live → Lộ Mặt Admin → bí mật → có hậu → Nhân Vật Chính → mặc định
// ============================================================

=== hong_hot_3010_danh_gia ===
# ngay:31 # gio:21:30 # bat_buoc # dieu_kien:sau_dem_hong
// 5. 🔴 Lỡ Tay Bấm Live
{ hh_live_nham_hop:
    ~ chot_ket_thuc("lo_tay_bam_live")
    -> hong_hot_kt_lo_tay_bam_live
}
// 4. 🕶️ Lộ Mặt Admin
{ hh_lo_admin >= 100:
    ~ chot_ket_thuc("lo_mat_admin")
    -> hong_hot_kt_lo_mat_admin
}
// 3. 🔒 Kết thúc bí mật: Confession Cuối Cùng
{ hh_kho_tin >= 25 && not hh_conf_ac_cuoi_thang && qh_it >= 50 && hh_mo_nhanh_hoa_huong_duong:
    ~ chot_ket_thuc("confession_cuoi_cung")
    -> hong_hot_kt_confession_cuoi_cung
}
// 1. 📈 Trưởng Nhóm Mạng Xã Hội
{ nguoi_theo_doi >= 1000000 && hh_dong_gop >= 300000 && hh_lo_admin < 60:
    ~ chot_ket_thuc("truong_nhom_mxh")
    -> hong_hot_kt_truong_nhom_mxh
}
// 2. 🤐 Cái Miệng Vàng
{ hh_kin_mieng >= 80 && hh_so_tin_cap_cao_giu >= 3:
    ~ chot_ket_thuc("cai_mieng_vang")
    -> hong_hot_kt_cai_mieng_vang
}
// 6. 🎭 Nhân Vật Chính
{ hh_kin_mieng < 20 && hh_tin_don_ve_ngan >= 15:
    ~ chot_ket_thuc("nhan_vat_chinh")
    -> hong_hot_kt_nhan_vat_chinh
}
// Không khớp điều kiện nào: miệng chưa kín thì thành nhân vật chính, lộ nhiều thì lộ mặt
{ hh_lo_admin >= 60:
    ~ chot_ket_thuc("lo_mat_admin")
    -> hong_hot_kt_lo_mat_admin
}
~ chot_ket_thuc("nhan_vat_chinh")
-> hong_hot_kt_nhan_vat_chinh

// ------------------------------------------------------------
// 😄 📈 TRƯỞNG NHÓM MẠNG XÃ HỘI
// ------------------------------------------------------------
=== hong_hot_kt_truong_nhom_mxh ===
# dieu_kien:ket_thuc_truong_nhom_mxh
_Ngày 30/10. Sếp đọc quyết định trong phòng họp: "{hong_hot}, Trưởng nhóm Mạng xã hội. Hai nhân viên mới dưới quyền."_
_Hai nhân viên mới là hai bạn sinh viên năm cuối, cầm điện thoại bằng hai tay, nhìn bạn như nhìn một tượng đài._
_Một bạn rụt rè hỏi: "Dạ chị ơi, tụi em bắt đầu từ đâu ạ?"_
hong_hot: Từ… cách cầm ba cái điện thoại một lúc. Rồi tới cách biết khi nào thì không cầm cái nào.
_{designer} vỗ tay to nhất. {it} gật đầu đúng một lần. Ở cuối phòng, {chi_dai} giơ ngón cái._
_Đêm 31/10. Đại Nhạc Hội Siêu Nhân. Bạn đứng giữa khán đài, ba điện thoại trên tay. Một cái live. Một cái đếm. Một cái để đọc tin nhắn._
_999.412… 999.870… 999.996…_
_Cả khán đài đếm ngược theo con số trên màn hình lớn. Sếp trong bộ "Ông Kẹ Ngân Hàng" nắm tay {ke_toan}, tay kia nắm tay {thanh_ninh}._
_1.000.000._
_Khán đài nổ tung. {sieu_nhan_hong} nhảy lên tạo dáng, té, đứng dậy, tạo dáng tiếp. Hashtag lên top 3 xu hướng._
_Bạn mở fanpage. Đăng bài đầu tiên với chức danh mới. Không ảnh, không hashtag, không meme. Chỉ ba chữ:_
_"Nghe gì chưa?"_
_Bình luận đầu tiên, 0,3 giây sau: "Nghe rồi! Một triệu!"_
_Bạn bật cười. Lần đầu tiên trong đời, tin nóng nhất bạn kể là tin ai cũng được phép biết._
_Và nó vẫn nóng như vậy._
-> END

// ------------------------------------------------------------
// 😄 🤐 CÁI MIỆNG VÀNG
// ------------------------------------------------------------
=== hong_hot_kt_cai_mieng_vang ===
# dieu_kien:ket_thuc_cai_mieng_vang
_Đại Nhạc Hội Siêu Nhân qua đi. Bạn không đếm con số. Bạn đếm những bí mật mình đã không kể: trang 47, khoản nợ của sếp, chuyện {thanh_ninh} đi LL, một nhà kho có lỗ thông gió hình con cá._
_Mỗi cái nặng như một hòn đá. Và bạn vẫn đứng được._
_Một tháng sau._
_Bàn mạng xã hội của bạn có thêm một chiếc ghế. Ghế nhựa đỏ, mượn từ pantry, không ai trả lại._
_Người đầu tiên ngồi xuống là {thuc_tap_sinh}. Anh ấy kể chuyện nhớ nhà. Bạn không quay._
_Người thứ hai là {thanh_xin_nghi}. Kể chuyện thi hát. Bạn không đăng._
_Người thứ ba là {ke_toan}. Chị không kể gì, chỉ ngồi đó mười phút, uống hết ly trà, rồi nói: "Cảm ơn em."_
_Rồi {editor}. Rồi {designer}. Rồi một buổi chiều, sếp. Sếp ngồi xuống chiếc ghế nhựa đỏ, nhìn quanh, rồi nói nhỏ: "Anh kể em nghe chuyện năm 2010 nhé…"_
_Người ta tới, ngồi, kể, khóc, cười. Bạn úp ba cái điện thoại xuống bàn. Chỉ nghe._
chi_dai: *(đi ngang, nói với {ke_toan})* Con nhỏ đó giờ thành cái giếng rồi. Ném gì xuống cũng không vang lên.
_Bạn nghe thấy câu đó. Bạn không kể lại cho ai._
_Trên màn hình khóa điện thoại của bạn có một dòng chữ, đổi từ tháng trước:_
_"Hóng để hiểu, không phải để kể."_
-> END

// ------------------------------------------------------------
// 😄 🔒 CONFESSION CUỐI CÙNG (bí mật)
// ------------------------------------------------------------
=== hong_hot_kt_confession_cuoi_cung ===
# dieu_kien:ket_thuc_confession_cuoi_cung
_Đại Nhạc Hội Siêu Nhân. 21 giờ. Giữa lúc {sieu_nhan_hong} chuẩn bị bài hát cuối, bạn mở máy "NGAN-LAPTOP" lần cuối._
_Ba tuần nay bạn không đăng một bài cay nào. Bạn chỉ đọc. Và lưu lại những bài tốt nhất, những bài không ai thả haha._
_Bạn gõ. Ký tên thật._
_"Admin là {hong_hot}. Bốn năm nay, trang này nhận 3.112 bài. Đây là những điều tốt đẹp nhất mà các bạn từng gửi cho trang này:"_
_"Cảm ơn người đã để hộp cơm của tôi trong tủ lạnh mà không ăn."_
_"Bác bảo vệ đã đẩy xe giùm tôi lúc trời mưa, mà không nhận tiền."_
_"Tôi ở lại tới 1 giờ sáng, và thấy sếp cũng chưa về."_
_"Hôm nay một thực tập sinh 30 tuổi photo cho tôi 200 trang mà không than câu nào."_
_Bấm đăng._
_Mười phút. Bài viết lên top 1 xu hướng, kéo theo hashtag Siêu Nhân Hồng. Màn hình lớn trên sân khấu tự chiếu dòng xu hướng._
_Dưới khán đài, sếp mở điện thoại. Đọc từng dòng. Tới dòng "Tôi ở lại tới 1 giờ sáng, và thấy sếp cũng chưa về" thì dừng lại. Đỏ mắt._
_Trong group "Hội Anti Sếp", một tài khoản tên "Hoa Hướng Dương 1989" thả một trái tim. Không phải haha. Lần đầu tiên._
_{it} đứng cạnh bạn, tay cầm ly mì. Gật đầu đúng một lần._
it: Đổi tên máy được rồi.
_Bạn cười. Tên máy mới: "Nghe-Gi-Chua". Lần này không ai cần đoán ai là admin nữa._
-> END

// ------------------------------------------------------------
// 😢 🕶️ LỘ MẶT ADMIN
// ------------------------------------------------------------
=== hong_hot_kt_lo_mat_admin ===
# dieu_kien:ket_thuc_lo_mat_admin
_Phòng họp "Sáng Tạo". Màn hình lớn chiếu ảnh chụp trang quản trị Confession G-Entertainment. Góc trên ghi tên tài khoản: "{hong_hot} Nghe Gì Chưa"._
_Bên dưới là danh sách bài đã đăng. Bài "Lương về trễ, sếp đi đánh golf". Bài về chuyến đi Vũng Tàu. Những bài có tên thật của từng người trong phòng._
_Không ai nói gì. Sếp nhìn màn hình. {hr} mỉm cười. {it} nhìn xuống bàn._
_Trưa đó ở pantry, mọi người dịch ghế ra xa bạn một chút. Không ai nói gì. Không ai cần nói gì. Ai cũng biết, và đó là chuyện duy nhất tuần này bạn không phải người kể._
_Chỉ có {designer} vẫn ngồi cạnh. Bà ấy không nói gì. Bà ấy chia cho bạn nửa ly trà sữa, như mọi ngày. Rồi ăn tiếp._
_Đại Nhạc Hội Siêu Nhân, bạn đứng ở rìa khán đài. Không ai đưa bạn điện thoại nào để live. Fanpage đã giao cho {ran_doc}._
_Về Hẻm 69. Phòng 5, dãy A. Đèn LED tắt. Ring light tắt._
_Bạn áp tai vào tường, theo thói quen._
_Phòng bên im lặng._
_Không tiếng bút bi. Không tiếng điện thoại. Không ai gõ ba cái "có chuyện"._
_Lần đầu tiên, không có gì để hóng. Và lần đầu tiên, bạn thấy cái im lặng đó to tới vậy._
-> END

// ------------------------------------------------------------
// 😢 🔴 LỠ TAY BẤM LIVE
// ------------------------------------------------------------
=== hong_hot_kt_lo_tay_bam_live ===
# dieu_kien:ket_thuc_lo_tay_bam_live
_Ba phút. Chỉ có ba phút._
_12.000 người đang xem sếp nói trong phòng họp, giọng run: "…nếu thất bại thì mình nợ mười tỷ… trang 47… anh ký mà không đọc…"_
_Bạn nhìn thấy chấm đỏ 🔴 ở góc màn hình. Bấm dừng. Đã muộn 3 phút._
hong_hot: Ối dồi ôi.
_Không ai trong phòng nghe thấy. Nhưng 12.000 người thì nghe thấy hết._
_Trong một giờ, clip được cắt thành 40 phiên bản. Tiêu đề: "Công ty lăng xê Siêu Nhân Hồng sắp phá sản?", "Trang 47 là gì?", "Giám đốc ký hợp đồng mà không đọc"._
_LL chia sẻ clip đầu tiên, kèm một trái tim xanh lá chuối._
_Sáng hôm sau, 7 giờ 59. Bạn tới sớm. Lần đầu tiên trong năm bạn không trễ 5 phút._
_{hr} đứng cạnh máy chấm công, mỉm cười._
hr: Em {hong_hot}. Em rảnh không, lên phòng anh uống trà xíu.
_Trà Ô {con_ong_chau_cha}. {hr} rót. Bạn nhìn ly trà. Trong ly có bóng của chính bạn, méo mó, đỏ hoe._
hr: Anh chỉ muốn lắng nghe em thôi.
_Lần này, bạn là người không có gì để kể._
_Ở bàn mạng xã hội tầng 1, ba cái điện thoại của bạn nằm úp. Không cái nào sáng._
-> END

// ------------------------------------------------------------
// 😢 🎭 NHÂN VẬT CHÍNH
// ------------------------------------------------------------
=== hong_hot_kt_nhan_vat_chinh ===
# dieu_kien:ket_thuc_nhan_vat_chinh
_Tuần cuối tháng 10, lần đầu tiên, tin nóng nhất công ty là tin về bạn._
_Không ai chắc nó bắt đầu từ đâu. Từ chuyện đổi pin lấy bí mật. Từ ảnh chụp màn hình email. Từ một câu bạn lỡ kể với một người, người đó kể với hai người._
_Ai cũng biết. Ai cũng kể. Không ai kể với bạn._
_Ở pantry, câu chuyện ngừng lại khi bạn bước vào. Rồi tiếp tục khi bạn bước ra. Bạn biết vì bạn từng là người ngừng lại, rồi tiếp tục._
_Group "Hội Anti Sếp" có 15 thành viên. Sáng nay còn 14. Bạn là người bị mời ra. Bởi chính group bạn lập._
_Đêm 31/10. Đại Nhạc Hội Siêu Nhân đang diễn ở Phường Tân Drama. Tiếng nhạc vọng tới tận Hẻm 69._
_Bạn ngồi một mình trong phòng trọ đầy đèn LED. Ba điện thoại. Không cái nào có tin nhắn mới._
_Qua bức tường mỏng như tờ lịch, bạn nghe giọng ai đó ở phòng bên, nói với ai đó qua điện thoại:_
ran_doc: *(vọng qua tường)* Nghe gì chưa?
_Bạn nín thở. Áp tai vào tường. Như mọi khi._
_Rồi lần đầu tiên, bạn nghe thấy tên mình._
-> END
