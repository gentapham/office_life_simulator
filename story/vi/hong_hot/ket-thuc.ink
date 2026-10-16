// ============================================================
// THÁNH HÓNG: NGÂN · SÁU KẾT THÚC
// Thứ tự ưu tiên: Lỡ Tay Bấm Live → Lộ Mặt Admin → bí mật → có hậu → Nhân Vật Chính → mặc định
// ============================================================

=== hong_hot_3010_danh_gia ===
# ngay:31 # gio:23:00 # bat_buoc # dieu_kien:sau_dem_hong
// Game gọi cảnh này sau chung_3110_dem_hong (đã chốt ket_thuc_su_nghiep, chung_cong_ty_song).
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
{ hh_kho_tin >= 20 && not hh_conf_ac_cuoi_thang && hh_bao_giu_kin && hh_mo_nhanh_hoa_huong_duong:
    ~ chot_ket_thuc("confession_cuoi_cung")
    -> hong_hot_kt_confession_cuoi_cung
}
// 1. 📈 Trưởng Nhóm Mạng Xã Hội: công ty sống, Ngân góp nhiều, chưa lộ
{ chung_cong_ty_song && hh_dong_gop >= 120000 && hh_lo_admin < 60:
    ~ chot_ket_thuc("truong_nhom_mxh")
    -> hong_hot_kt_truong_nhom_mxh
}
// 2. 🤐 Cái Miệng Vàng
{ hh_kin_mieng >= 70 && hh_so_tin_cap_cao_giu >= 2 && hh_tin_don_ve_ngan < 22:
    ~ chot_ket_thuc("cai_mieng_vang")
    -> hong_hot_kt_cai_mieng_vang
}
// 6. 🎭 Nhân Vật Chính: tin đồn về chính Ngân lan quá rộng
{ hh_tin_don_ve_ngan >= 22 || (hh_kin_mieng < 40 && hh_tin_don_ve_ngan >= 6):
    ~ chot_ket_thuc("nhan_vat_chinh")
    -> hong_hot_kt_nhan_vat_chinh
}
// Mặc định: lộ nhiều thì lộ mặt, miệng kín vừa thì vẫn là cái giếng, còn lại thành nhân vật chính
{ hh_lo_admin >= 70:
    ~ chot_ket_thuc("lo_mat_admin")
    -> hong_hot_kt_lo_mat_admin
}
{ hh_kin_mieng >= 45:
    ~ chot_ket_thuc("cai_mieng_vang")
    -> hong_hot_kt_cai_mieng_vang
}
~ chot_ket_thuc("nhan_vat_chinh")
-> hong_hot_kt_nhan_vat_chinh

// ------------------------------------------------------------
// 😄 📈 TRƯỞNG NHÓM MẠNG XÃ HỘI
// ------------------------------------------------------------
=== hong_hot_kt_truong_nhom_mxh ===
# dieu_kien:ket_thuc_truong_nhom_mxh
{ ket_thuc_su_nghiep:
- "sieu_sao_hang_a":
    _23 giờ 59 tối qua. Bạn đứng giữa khán đài, ba điện thoại trên tay. Một cái live. Một cái đếm. Một cái để đọc tin nhắn._
    _999.412… 999.870… 999.996… 1.000.000._
    _Khán đài nổ tung. Bạn không hét. Bạn chụp màn hình bộ đếm, tay run tới mức ảnh bị nhòe. Đó là tấm ảnh đẹp nhất trong máy bạn._
- "thao_mu":
    _Tối qua bộ đếm không chạm một triệu. Nhưng clip 41 giây {sieu_nhan_hong} tháo mũ là do máy bạn quay, góc đẹp nhất, đăng đầu tiên. Sáng nay nó có 9 triệu lượt xem._
- else:
    _Tối qua bộ đếm không chạm một triệu. Nhưng sáng nay, \#SiêuNhânGâu nằm trên mọi trang meme, và trang nào cũng ghi nguồn: fanpage {cong_ty}._
}
_Thứ hai, 2/11. Sếp đọc quyết định trong phòng họp: "{hong_hot}, Trưởng nhóm Mạng xã hội. Hai nhân viên mới dưới quyền."_
{ hh_nhan_vien_moi:
    _Sếp đã hứa từ hôm họp đánh giá, "nếu công ty còn đứng được". Công ty còn đứng. Sếp giữ lời. Lần này không cần ai quay clip làm bằng chứng._
- else:
    _Không ai báo trước. Sếp nói: "Anh xem lại cả tháng. Ngày nào fanpage cũng có bài. Ngày nào cũng có em."_
}
_Hai nhân viên mới là hai bạn sinh viên năm cuối, cầm điện thoại bằng hai tay, nhìn bạn như nhìn một tượng đài._
_Một bạn rụt rè hỏi: "Dạ chị ơi, tụi em bắt đầu từ đâu ạ?"_
hong_hot: Từ… cách cầm ba cái điện thoại một lúc. Rồi tới cách biết khi nào thì không cầm cái nào.
_{designer} vỗ tay to nhất. {it} gật đầu đúng một lần. Ở cuối phòng, {chi_dai} giơ ngón cái._
_Bạn mở fanpage. Đăng bài đầu tiên với chức danh mới. Không ảnh, không hashtag, không meme. Chỉ ba chữ:_
_"Nghe gì chưa?"_
_Bình luận đầu tiên, 0,3 giây sau: "Nghe rồi! Công ty còn sống!"_
_Bạn bật cười. Lần đầu tiên trong đời, tin nóng nhất bạn kể là tin ai cũng được phép biết._
_Và nó vẫn nóng như vậy._
-> END

// ------------------------------------------------------------
// 😄 🤐 CÁI MIỆNG VÀNG
// ------------------------------------------------------------
=== hong_hot_kt_cai_mieng_vang ===
# dieu_kien:ket_thuc_cai_mieng_vang
_23 giờ. Đại Nhạc Hội Siêu Nhân tan. Bạn không đếm con số. Bạn đếm những bí mật mình đã không kể:{ hh_giu_trang_47: trang 47,}{ hh_giu_no_sep: khoản nợ của sếp,}{ hh_giu_nhi_ll: chuyện {thanh_ninh} đi LL,}{ hh_giu_hieu_ech: một nhà kho có lỗ thông gió hình con cá,} và vài chuyện nhỏ hơn mà không ai biết bạn biết._
_Mỗi cái nặng như một hòn đá. Và bạn vẫn đứng được._
{ chung_cong_ty_song:
    _Những tuần sau, bàn mạng xã hội của bạn có thêm một chiếc ghế. Ghế nhựa đỏ, mượn từ pantry, không ai trả lại._
- else:
    _Công ty đóng cửa vào tuần thứ hai của tháng 11. Bạn ngồi ở Cà Phê Sống Ảo mỗi sáng, viết đơn xin việc. Bàn của bạn có thêm một chiếc ghế nhựa đỏ, quán cho mượn._
}
_Người đầu tiên ngồi xuống là {thuc_tap_sinh}. Anh ấy kể chuyện nhớ nhà. Bạn không quay._
_Người thứ hai là {thanh_xin_nghi}. Kể chuyện thi hát. Bạn không đăng._
_Người thứ ba là {ke_toan}. Chị không kể gì, chỉ ngồi đó mười phút, uống hết ly trà, rồi nói: "Cảm ơn em."_
_Rồi {editor}. Rồi {designer}. Rồi một buổi chiều, sếp. Sếp ngồi xuống chiếc ghế nhựa đỏ, nhìn quanh, rồi nói nhỏ: "Anh kể em nghe chuyện năm 2010 nhé…"_
_Người ta tới, ngồi, kể, khóc, cười. Bạn úp ba cái điện thoại xuống bàn. Chỉ nghe._
chi_dai: *(đi ngang, nói với {ke_toan})* Con nhỏ đó giờ thành cái giếng rồi. Ném gì xuống cũng không vang lên.
_Bạn nghe thấy câu đó. Bạn không kể lại cho ai._
_Trên màn hình khóa điện thoại của bạn có một dòng chữ mới:_
_"Hóng để hiểu, không phải để kể."_
-> END

// ------------------------------------------------------------
// 😄 🔒 CONFESSION CUỐI CÙNG (bí mật)
// ------------------------------------------------------------
=== hong_hot_kt_confession_cuoi_cung ===
# dieu_kien:ket_thuc_confession_cuoi_cung
_23 giờ 10. Khán đài đã vãn. Bạn ngồi bệt sau cánh gà, mở máy "NGAN-LAPTOP" lần cuối._
_Mười ngày nay bạn không đăng một bài cay nào. Bạn chỉ đọc. Và lưu lại những bài tốt nhất, những bài không ai thả haha._
_Bạn gõ. Ký tên thật._
_"Admin là {hong_hot}. Bốn năm nay, trang này nhận 3.112 bài. Đây là những điều tốt đẹp nhất mà các bạn từng gửi cho trang này:"_
_"Cảm ơn người đã để hộp cơm của tôi trong tủ lạnh mà không ăn."_
_"Bác bảo vệ sơn riêng một ô đỗ xe cho người mới tới, mà không nói với ai."_
_"Tôi ở lại tới 1 giờ sáng, và thấy sếp cũng chưa về."_
_"Hôm nay một thực tập sinh 30 tuổi photo cho tôi 200 trang mà không than câu nào."_
_Bấm đăng._
{ chung_cong_ty_song:
    _Mười phút. Bài được chia sẻ khắp nơi, kéo theo hashtag Siêu Nhân Hồng thêm một vòng. Đêm nay, công ty có lý do để vui thêm một lần._
- else:
    _Bài không cứu được con số nào. Đêm nay công ty vẫn trượt hợp đồng. Nhưng mười phút sau, bài có 2.000 lượt chia sẻ, và không bình luận nào là haha._
}
{ nguyen_theo_ll:
    _Bên kia đường, màn hình LED của LL vẫn chiếu bộ đồ hồng viền xanh lá chuối. Một tài khoản không ảnh đại diện vào thả tim cho bài của bạn. Tên tài khoản: "Dạ… ờm…"._
}
_Ở hàng ghế đầu, sếp mở điện thoại. Đọc từng dòng. Tới dòng "Tôi ở lại tới 1 giờ sáng, và thấy sếp cũng chưa về" thì dừng lại. Đỏ mắt._
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
_Bạn nhớ mãi buổi chiều đó, ở phòng họp tầng 2. Màn hình lớn chiếu ảnh chụp trang quản trị Confession {cong_ty}. Góc trên ghi tên tài khoản: "{hong_hot} Nghe Gì Chưa"._
_Bên dưới là danh sách bài đã đăng. Bài "Lương về trễ, sếp đi đánh golf". Bài về chuyến đi Vũng Tàu. Những bài có tên thật của từng người trong phòng._
_Không ai nói gì. Sếp nhìn màn hình. {hr} mỉm cười. {it} nhìn xuống bàn._
_Từ hôm đó, ở pantry, mọi người dịch ghế ra xa bạn một chút. Không ai nói gì. Không ai cần nói gì. Ai cũng biết, và đó là chuyện duy nhất tháng này bạn không phải người kể._
_Chỉ có {designer} vẫn ngồi cạnh. Bà ấy không nói gì. Bà ấy chia cho bạn nửa ly trà sữa, như mọi ngày. Rồi ăn tiếp._
_Đại Nhạc Hội Siêu Nhân tối nay, bạn đứng ở rìa khán đài. Không ai đưa bạn điện thoại nào để live. Fanpage đã giao cho {ran_doc}.{ not chung_cong_ty_song: Bộ đếm dừng dưới mốc. Bạn nghe có người sau lưng nói: "Tại cái trang Confession đó một phần."}_
_23 giờ. Về Hẻm 69. Phòng 5, dãy A. Đèn LED tắt. Ring light tắt._
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
_Ba phút. Chỉ có ba phút. Bạn vẫn nghe lại nó trong đầu, kể cả giữa tiếng nhạc Đại Nhạc Hội tối nay._
{ hh_live_nham_ngay:
- 20:
    _Karaoke Chú Sáu, tối 20/10. 3.200 người đang xem sếp đứng trên bàn, cầm micro, giọng nấc: "…công ty mình đang… nợ. Nợ nhiều lắm…"_
    _Trong một giờ, clip được cắt thành 40 phiên bản. Tiêu đề: "Công ty lăng xê Siêu Nhân Hồng đang nợ?", "Sếp say hứa tăng lương 20% giữa đống nợ"._
- 22:
    _Ngày đoàn thuế tới. 2.100 người xem cửa kính mờ phòng kế toán, nghe giọng {ke_toan}: "…trang 47. Thất bại thì hoàn gấp đôi…"_
    _Trong một giờ, clip được cắt thành 40 phiên bản. Tiêu đề: "Trang 47 là gì?", "Đoàn thuế ở công ty Siêu Nhân Hồng"._
- else:
    _Họp đánh giá chiều 30/10. 12.000 người xem sếp nói trong phòng họp, giọng run: "…nếu mai không đạt thì phải hoàn mười tỷ… trang 47… anh ký mà không đọc…"_
    _Trong một giờ, clip được cắt thành 40 phiên bản. Tiêu đề: "Công ty lăng xê Siêu Nhân Hồng sắp phá sản?", "Giám đốc ký hợp đồng mà không đọc"._
}
hong_hot: Ối dồi ôi.
_LL chia sẻ clip đầu tiên, kèm một trái tim xanh lá chuối._
{ chung_cong_ty_song:
    _Công ty qua được đêm nay. Nhưng không ai quên ai là người bấm nút đỏ._
- else:
    _Đêm nay công ty trượt hợp đồng. Không ai nói vì clip của bạn. Không ai cần nói._
}
_Sáng thứ hai, 7 giờ 59. Bạn tới sớm. Lần đầu tiên trong năm bạn không trễ 5 phút._
_{hr} đứng cạnh máy chấm công, mỉm cười._
hr: Em {hong_hot}. Em rảnh không, lên phòng anh uống trà xíu.
_Trà Ô Long. {hr} rót. Bạn nhìn ly trà. Trong ly có bóng của chính bạn, méo mó, đỏ hoe._
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
_Group "Hội Anti Sếp" có 15 thành viên. Tối nay còn 14. Bạn là người bị mời ra. Bởi chính group bạn lập._
_Đại Nhạc Hội Siêu Nhân còn chưa tan. Bạn về Hẻm 69 trước khi bộ đếm dừng. Tiếng nhạc vọng tới tận phòng trọ._
_23 giờ. Bạn ngồi một mình trong phòng trọ đầy đèn LED. Ba điện thoại. Không cái nào có tin nhắn mới._
_Qua bức tường mỏng như tờ lịch, bạn nghe giọng ai đó ở phòng bên, nói với ai đó qua điện thoại:_
ran_doc: *(vọng qua tường)* Nghe gì chưa?
_Bạn nín thở. Áp tai vào tường. Như mọi khi._
_Rồi lần đầu tiên, bạn nghe thấy tên mình._
-> END
