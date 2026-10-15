// ============================================================
// TIN ĐỒN (chung_td_<chủ đề>)
//
// Cách dùng:  -> chung_td_di_tre("ke_toan", 2)
//   nguoi : mã nhân vật bị nói (vd "ke_toan", "cho")
//   muc   : độ méo của tin, 1..3
//           1 = gần đúng sự thật
//           2 = thêm mắm dặm muối
//           3 = tam sao thất bản, bay xa khỏi sự thật
//
// Mỗi cảnh in ra MỘT câu tin đồn bằng giọng buôn chuyện miền Nam,
// KHÔNG có mã người nói ở đầu dòng: game tự gắn "<mã người kể>: " vào trước,
// vì tin đồn được bất kỳ NPC nhiều chuyện nào kể lại.
// (Người kể giọng Bắc hiếm khi lan tin; Bác Bình không bao giờ lan tin.)
// Dòng cuối có thẻ # tin_don:<chủ đề> # muc:<n> để game ghi nhận.
// Mỗi cảnh kết thúc bằng -> END.
//
// Hàm dùng: chung_ten_buon(ma) -> "bà Ngân", "ông Long", "bác Bình", "sếp Thắng", "con Tuất"
//           chung_ngoi_ba(ma)  -> "ổng" / "bả" / "nó"
// ============================================================

=== chung_td_di_tre(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Nghe nói sáng nay {a} đi trễ mười phút đó.|Hôm nay {a} chấm công lúc 8 giờ 7 phút, tui thấy tận mắt.}
- 2: {~{A} tuần này đi trễ ba lần rồi, HR ghi sổ hết rồi đó!|Nghe gì chưa? {a} đi trễ hoài, sắp bị mời lên uống trà rồi.}
- else: {~Trời ơi, {a} đi trễ nhiều tới mức HR làm riêng cho {o} một cái máy chấm công!|Nghe nói {a} sắp nghỉ việc luôn rồi, tại sáng nào cũng đi trễ, chắc bên kia nhận rồi á!}
}
# tin_don:di_tre # muc:{muc}
-> END

=== chung_td_ngu_gat(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Hồi chiều {a} ngủ gật trên bàn chút xíu.|{A} ngủ gật trong cuộc họp giao ban, ngáy nhỏ nhỏ à.}
- 2: {~{A} ngủ gật mà ngáy to tới mức anh {truong_phong} phải dừng họp đó bà!|{A} ngủ trưa lố giờ, tỉnh dậy tưởng sáng hôm sau luôn.}
- else: {~Nghe nói {a} ngủ quên ở công ty cả đêm, sáng ra bác {bac_bao_ve} tưởng trộm!|{A} ngủ trong phòng họp ba ngày rồi, giờ {o} sống luôn ở công ty.}
}
# tin_don:ngu_gat # muc:{muc}
-> END

=== chung_td_an_vung(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Hình như {a} lỡ ăn nhầm hộp sữa chua trong tủ lạnh.|Tui thấy {a} đứng trước tủ lạnh hơi lâu.}
- 2: {~Kẻ trộm tủ lạnh chính là {a} đó! Có người thấy {o} cầm muỗng!|{A} ăn vụng hộp cơm cá kho của bà {ke_toan} đó, chắc luôn.}
- else: {~Nghe nói {a} ăn sạch tủ lạnh cả tầng, tới đá viên cũng hông chừa!|{A} có nguyên cái tủ lạnh riêng giấu đồ ăn trộm, dưới gầm cầu thang á!}
}
# tin_don:an_vung # muc:{muc}
-> END

=== chung_td_nghi_viec(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Dạo này {a} có vẻ chán việc lắm.|{A} mới hỏi tui công ty khác lương sao.}
- 2: {~{A} đang viết đơn nghỉ việc đó, tui thấy file "don_nghi_FINAL" trên máy {o}.|Nghe nói {a} sắp nghỉ, chờ lấy lương tháng này thôi.}
- else: {~{A} nghỉ việc rồi! Hôm nay là ngày cuối, {o} không nói ai hết!|Trời đất, {a} được công ty nước ngoài mời, lương gấp mười, tuần sau bay!}
}
# tin_don:nghi_viec # muc:{muc}
-> END

=== chung_td_uong_tra(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Hồi sáng anh {hr} rủ {a} lên phòng uống trà.|{A} vừa ở phòng HR ra, mặt hơi căng.}
- 2: {~{A} bị HR mời uống trà rồi! Ai được mời uống trà là biết rồi đó.|{A} uống trà với HR tới ly thứ ba, chắc có chuyện lớn.}
- else: {~{A} bị đuổi rồi! Uống trà xong là dọn đồ luôn!|Nghe nói {a} uống trà với HR lâu tới mức hết nguyên kệ trà 40 loại!}
}
# tin_don:uong_tra # muc:{muc}
-> END

=== chung_td_tang_luong(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Hình như {a} được sếp khen trong cuộc họp.|{A} được giao thêm việc quan trọng đó.}
- 2: {~{A} sắp được tăng lương rồi, sếp nói riêng với {o}!|Nghe nói {a} được tăng lương 20%, mà lương mình còn chưa về.}
- else: {~{A} được tăng lương gấp đôi, còn được sếp tặng xe nữa!|{A} sắp lên Phó Giám đốc, sếp chọn rồi, chỉ chờ công bố!}
}
# tin_don:tang_luong # muc:{muc}
-> END

=== chung_td_cat_giam(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Nghe nói công ty có danh sách cắt giảm, mà hông biết có ai.|Anh {hr} hay ôm tập hồ sơ hồng đi qua bàn {a}.}
- 2: {~Tên {a} có trong danh sách cắt giảm đó, chắc mười phần tám chín.|{A} nằm trong danh sách cắt giảm nếu Siêu Nhân Hồng thất bại.}
- else: {~{A} bị cắt giảm rồi, mai hông cần đi làm nữa luôn!|Danh sách cắt giảm có mỗi một tên thôi: {a}! Sếp viết bằng mực hồng!}
}
# tin_don:cat_giam # muc:{muc}
-> END

=== chung_td_lam_cho_ll(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Có người thấy {a} đi ngang tòa nhà kính bên Ven Đô.|{A} hay nghe điện thoại ngoài hành lang, nói nhỏ lắm.}
- 2: {~{A} đi phỏng vấn bên LL-Entertainment đó! Tui thấy {o} ở sảnh!|{A} xài nước hoa mùi lá chuối, y chang mùi bên LL.}
- else: {~{A} là gián điệp của LL! Lưu Lực cài {o} vô từ năm ngoái!|Nghe nói {a} chính là em họ của Lưu Lực, ngày nào cũng báo cáo về bên đó!}
}
# tin_don:lam_cho_ll # muc:{muc}
-> END

=== chung_td_co_nguoi_thuong(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Dạo này {a} hay cười một mình với điện thoại.|{A} mới mua thêm nước hoa đó.}
- 2: {~{A} có người thương rồi! Trưa nào cũng nhắn tin tủm tỉm!|{A} đang thả thính ai đó trong công ty, tui chưa biết ai thôi.}
- else: {~{A} sắp cưới rồi! Đám cá tươi! Thiệp in màu hồng luôn!|Nghe nói {a} có người yêu bí mật, hai người hẹn nhau trên sân thượng mỗi tối!}
}
# tin_don:co_nguoi_thuong # muc:{muc}
-> END

=== chung_td_no_nan(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} mới hỏi mượn tiền một người trong công ty.|Hình như {a} đang kẹt tiền chút.}
- 2: {~{A} nợ nửa công ty rồi đó, có sổ nợ đàng hoàng!|Chủ nợ tới tận cổng tìm {a}, bác {bac_bao_ve} phải chặn.}
- else: {~{A} nợ ngân hàng cả tỷ! Đang tính bỏ trốn về Ven Đô!|Nghe nói {a} cầm luôn cái xe, cái điện thoại, giờ đi làm bằng xe buýt!}
}
# tin_don:no_nan # muc:{muc}
-> END

=== chung_td_giau_ngam(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} mới mua cái túi xịn lắm.|Tui thấy {a} có cái thẻ ngân hàng lấp lánh ghê.}
- 2: {~{A} giàu ngầm đó, đi làm cho vui thôi!|{A} có cả căn nhà ở Sky Ảo mà giấu hông nói ai.}
- else: {~{A} trúng số độc đắc! Đi làm chỉ để có chỗ ngồi máy lạnh!|Nghe nói {a} mua luôn tòa nhà công ty mình, mà giả bộ làm nhân viên để thử lòng!}
}
# tin_don:giau_ngam # muc:{muc}
-> END

=== chung_td_bi_sep_mang(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Hồi chiều sếp nói chuyện với {a} hơi lâu.|{A} vừa ra khỏi phòng giám đốc, cửa đóng hơi mạnh.}
- 2: {~{A} bị sếp mắng một trận! Cả tầng 2 nghe thấy!|Sếp nói với {a} câu "anh không ép, tùy em" ba lần liền đó!}
- else: {~{A} bị sếp mắng tới mức khóc ở sân thượng hết một hộp khăn giấy!|{A} cãi tay đôi với sếp, ném luôn cái cà vạt hồng của ổng ra cửa sổ!}
}
# tin_don:bi_sep_mang # muc:{muc}
-> END

=== chung_td_noi_xau_sep(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} có than chuyện họp nhiều trong group.|{A} thả haha vô một cái meme về sếp.}
- 2: {~{A} nói xấu sếp trong group "Hội Anti Sếp" đó, chụp màn hình được luôn!|{A} gọi sếp là "Ông Kẹ Họp Hành" sau lưng.}
- else: {~{A} chính là người lập ra group anti sếp! Có 14 người, {o} là trùm!|{A} viết hẳn một cuốn sách nói xấu sếp, sắp xuất bản!}
}
# tin_don:noi_xau_sep # muc:{muc}
-> END

=== chung_td_xin_nghi_gia(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} xin nghỉ ốm hôm qua mà hôm nay nhìn khỏe re.|{A} xin nghỉ nhưng story vẫn đăng ảnh đi cà phê.}
- 2: {~{A} nghỉ ốm giả đó, có người thấy {o} ở rạp phim!|{A} mua giấy nghỉ ốm ở phòng khám Khỏe Re, lần thứ mấy rồi hông biết.}
- else: {~{A} nghỉ ốm để đi du lịch Vũng Tàu một mình, còn chụp ảnh đăng lên mạng!|{A} có hẳn cuốn lịch ghi "ngày nào nên ốm" cho cả năm!}
}
# tin_don:xin_nghi_gia # muc:{muc}
-> END

=== chung_td_thi_hat(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Tui nghe {a} ngân nga trong toilet, hay ghê.|{A} hay đeo tai nghe tập hát giờ trưa.}
- 2: {~{A} đi thi hát truyền hình đó, có người thấy {o} ở Đài Tivi Hóng!|{A} vô vòng trong một cuộc thi hát mà giấu cả công ty.}
- else: {~{A} sắp thành ca sĩ nổi tiếng, LL ký hợp đồng 10 năm rồi!|Nghe nói {a} hát hay hơn cả Siêu Nhân Hồng, công ty định cho {o} thay luôn!}
}
# tin_don:thi_hat # muc:{muc}
-> END

=== chung_td_dau_tu(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} có mua thử chút Hồng Coin.|{A} hay mở app chart giờ làm.}
- 2: {~{A} bỏ hết lương vô coin rồi đó!|{A} được {dan_dau_tu} rủ đầu tư, giờ ngày nào cũng nhìn nến xanh nến đỏ.}
- else: {~{A} cầm nhà đi mua coin, giờ còn cái nịt!|{A} lời tỷ đô từ coin, mai mua công ty LL luôn!}
}
# tin_don:dau_tu # muc:{muc}
-> END

=== chung_td_khoc_toilet(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Hình như {a} vừa khóc, mắt đỏ đỏ.|{A} vô toilet lâu, ra mặt buồn hiu.}
- 2: {~{A} khóc ở toilet một tiếng đồng hồ đó bà!|{A} bị ai đó làm tổn thương, khóc tới hết giấy vệ sinh.}
- else: {~{A} khóc to tới mức cả tầng tưởng mất nước!|Nghe nói {a} khóc ở toilet rồi xin nghỉ một tháng để chữa lành!}
}
# tin_don:khoc_toilet # muc:{muc}
-> END

=== chung_td_phong_bat(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} đăng story check-in nhà hàng sang.|{A} mới khoe đồng hồ mới.}
- 2: {~{A} phông bạt thôi, đồng hồ đó hàng nhái loại 1!|Story sang chảnh vậy mà {a} về nhà ăn mì gói đó.}
- else: {~{A} thuê nguyên nhà hàng chỉ để chụp một tấm ảnh, chụp xong đi về!|{A} mượn đồ hiệu của nửa công ty đi chụp hình, chưa trả ai!}
}
# tin_don:phong_bat # muc:{muc}
-> END

=== chung_td_fan_ao(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Bình luận dưới bài của {a} toàn giống nhau.|Mấy tài khoản like bài {a} hông có ảnh đại diện.}
- 2: {~{A} thuê fan ảo đó! Dịch vụ "Like Thật 100%"!|{A} có cả ngàn fan mà fan nào cũng tên giống nhau.}
- else: {~Một trăm phần trăm fan của {a} là bot! Bot còn đi xem concert của {o} nữa!|{A} thuê cả một đội fan ảo đi đám cưới {o} hát, vỗ tay theo lịch!}
}
# tin_don:fan_ao # muc:{muc}
-> END

=== chung_td_dao_y_tuong(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Ý tưởng mới của {a} nghe quen quen.|{A} hay hỏi ý kiến người khác rồi ghi chép.}
- 2: {~{A} lấy ý tưởng của người khác rồi đứng tên mình đó!|Kịch bản của {a} giống y chang một câu chuyện có người kể hồi tháng 9.}
- else: {~{A} đạo nguyên bộ phim, đổi mỗi cái tên!|Nghe nói {a} đạo luôn slogan của công ty! "Việc hôm nay cứ để ngày mai tính" là của người khác!}
}
# tin_don:dao_y_tuong # muc:{muc}
-> END

=== chung_td_la_admin(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Hình như {a} biết ai là admin trang Confession.|{A} đọc trang Confession nhanh lắm, bài nào cũng thấy đầu tiên.}
- 2: {~{A} chính là admin trang Confession G-Entertainment đó!|Bài confession hôm qua văn y chang cách {a} nhắn tin.}
- else: {~{A} là admin của MỌI trang confession trong quận!|Nghe nói {a} quản lý luôn trang confession của LL, hai mang luôn!}
}
# tin_don:la_admin # muc:{muc}
-> END

=== chung_td_hua_say(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Tối qua ở quán ốc {a} uống hơi nhiều.|{A} say rồi nói nhiều hơn mọi khi.}
- 2: {~{A} say rồi hứa bao cả công ty đi Vũng Tàu!|Có clip {a} say hứa tăng lương cho cả phòng!}
- else: {~{A} say rồi hứa tặng mỗi người một căn nhà, có ghi âm làm bằng!|{A} say rồi lên sân khấu karaoke tuyên bố từ nay là chủ tịch công ty!}
}
# tin_don:hua_say # muc:{muc}
-> END

=== chung_td_tam_ung(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} xin bà {ke_toan} tạm ứng chút tiền.|{A} đứng trước phòng kế toán khá lâu.}
- 2: {~{A} tạm ứng hoài mà hông có hóa đơn, bà {ke_toan} ghi sổ đen rồi!|{A} tạm ứng trước lương tới tháng 12 luôn đó.}
- else: {~{A} tạm ứng trước lương tới năm 2030!|Nghe nói {a} tạm ứng xong ôm tiền mua nguyên một xe trà sữa!}
}
# tin_don:tam_ung # muc:{muc}
-> END

=== chung_td_ghet_hong(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} hay quên đeo đồ hồng.|{A} nhìn bộ đồ Siêu Nhân Hồng với ánh mắt hơi khó chịu.}
- 2: {~{A} ghét Siêu Nhân Hồng ra mặt đó!|{A} nói màu hồng là màu của sự phá sản.}
- else: {~{A} đang âm mưu phá chiến dịch Siêu Nhân Hồng! Có kế hoạch viết tay luôn!|{A} sơn đen hết đồ hồng trong nhà rồi, còn lập hội "Ghét Màu Hồng"!}
}
# tin_don:ghet_hong # muc:{muc}
-> END

=== chung_td_ninh_sep(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} mới pha trà cho sếp.|{A} khen bài phát biểu của sếp hơi nhiều.}
- 2: {~{A} nịnh sếp quá trời, sếp hắt hơi cũng vỗ tay!|{A} đang đua với {thanh_ninh} xem ai được sếp tin hơn.}
- else: {~{A} xin làm con nuôi sếp! Đã nộp đơn!|{A} học thuộc lòng tiểu sử sếp, đọc ngược cũng được!}
}
# tin_don:ninh_sep # muc:{muc}
-> END

=== chung_td_bi_tuat_can(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Con {cho} sủa {a} hồi sáng.|{cho} cứ gầm gừ mỗi lần {a} đi ngang.}
- 2: {~{cho} ngoạm ống quần {a}, rách một lỗ to!|{cho} giấu đồ của {a} vô kho dưới gầm cầu thang rồi.}
- else: {~{cho} cắn {a} rồi! Phải đi chích ngừa bảy mũi!|Nghe nói {cho} đánh hơi ra {a} là người xấu, chó biết hết đó!}
}
# tin_don:bi_tuat_can # muc:{muc}
-> END

=== chung_td_lam_mat_do(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} làm thất lạc một cái USB.|{A} tìm đồ khắp văn phòng từ sáng tới giờ.}
- 2: {~{A} làm mất file gốc dự án đó, đang giấu!|{A} làm mất đồ của công ty, đang lo sốt vó.}
- else: {~{A} làm mất hợp đồng 5 tỷ của Siêu Nhân Hồng!|Nghe nói {a} làm mất luôn chìa khóa két sắt công ty, giờ tiền nằm trong đó hông ai lấy ra được!}
}
# tin_don:lam_mat_do # muc:{muc}
-> END

=== chung_td_thich_sieu_nhan_hong(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} được Siêu Nhân Hồng tặng quà.|{A} nói chuyện với Siêu Nhân Hồng lâu nhất công ty.}
- 2: {~Siêu Nhân Hồng để ý {a} đó, quà toàn màu hồng!|{A} là người duy nhất từng thấy Siêu Nhân Hồng không đội mũ!}
- else: {~{A} chính là người đứng sau bộ đồ Siêu Nhân Hồng mấy hôm Siêu Nhân bận!|Nghe nói {a} với Siêu Nhân Hồng là anh em thất lạc, sắp nhận nhau trên sóng truyền hình!}
}
# tin_don:thich_sieu_nhan_hong # muc:{muc}
-> END

=== chung_td_ngu_cong_ty(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Tối qua {a} ở lại công ty khuya lắm.|{A} về sau cả bác {bac_bao_ve} đi ngủ.}
- 2: {~{A} ngủ lại công ty luôn, có gối với mền dưới bàn!|{A} tắm ở toilet công ty, có người thấy khăn tắm phơi trên sân thượng.}
- else: {~{A} bỏ nhà, dọn vô sống ở phòng server!|Nghe nói {a} xin đổi địa chỉ hộ khẩu về công ty!}
}
# tin_don:ngu_cong_ty # muc:{muc}
-> END

=== chung_td_len_chuc(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} có tên trong danh sách được đánh giá cao.|Sếp nhắc tên {a} trong cuộc họp ban giám đốc.}
- 2: {~{A} sắp ngồi ghế Phó Giám đốc đó, chắc kèo!|{A} được sếp gọi lên nói chuyện riêng về "lộ trình phát triển".}
- else: {~{A} lên Giám đốc luôn! Sếp {giam_doc} xuống làm phó!|Nghe nói {a} được Genta gọi điện trực tiếp từ nước ngoài phong chức!}
}
# tin_don:len_chuc # muc:{muc}
-> END

=== chung_td_doi_mau_toc(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} mới cắt tóc nè.|Hình như {a} đổi kiểu tóc.}
- 2: {~{A} nhuộm tóc hồng để lấy lòng sếp đó!|{A} làm tóc ở tiệm Lung Linh hết nửa tháng lương.}
- else: {~{A} cạo trọc để phản đối nội quy đồ hồng!|{A} nhuộm tóc bảy màu y chang logo công ty, để xin tăng lương!}
}
# tin_don:doi_mau_toc # muc:{muc}
-> END

=== chung_td_tron_hop(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} vắng cuộc họp sáng nay.|{A} xin ra ngoài giữa cuộc họp.}
- 2: {~{A} trốn họp ra sân thượng lướt Tóp-tóp!|{A} có kịch bản giả bệnh riêng cho mỗi cuộc họp.}
- else: {~{A} hông dự cuộc họp nào cả tháng rồi, gửi con gấu bông ngồi thay!|Nghe nói {a} xây hẳn đường hầm từ phòng họp ra quán cà phê!}
}
# tin_don:tron_hop # muc:{muc}
-> END

=== chung_td_xem_boi(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} mới đi chùa Phố Cũ.|{A} hay coi tử vi buổi sáng.}
- 2: {~{A} đi xem bói, thầy nói tháng này có quý nhân màu hồng!|{A} chọn giờ chấm công theo phong thủy.}
- else: {~Thầy bói nói {a} sẽ giàu nhất công ty vào ngày 31/10!|{A} đặt bàn thờ nhỏ dưới gầm bàn làm việc, cúng mỗi sáng!}
}
# tin_don:xem_boi # muc:{muc}
-> END

=== chung_td_gap_luu_luc(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} nhận được một tấm danh thiếp màu xanh lá chuối.|Có người áo xanh lá chuối hỏi thăm {a} ở cổng.}
- 2: {~{A} uống cà phê với Lưu Lực ở Sống Ảo đó!|Lưu Lực mời {a} về làm, lương gấp đôi.}
- else: {~{A} được Lưu Lực tặng nguyên bộ vest trắng!|{A} ký hợp đồng với LL rồi, mai qua bên đó ngồi ghế giám đốc!}
}
# tin_don:gap_luu_luc # muc:{muc}
-> END

=== chung_td_sap_bi_phat(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} lỡ làm sai một chút trong báo cáo.|{A} gửi email nhầm người.}
- 2: {~{A} sắp bị kỷ luật vì gửi email nhầm vô group toàn công ty!|{A} sắp bị trừ thưởng chuyên cần.}
- else: {~{A} bị phạt phải mặc đồ Siêu Nhân Hồng đi làm một tuần!|{A} bị phạt rửa chén pantry tới hết năm!}
}
# tin_don:sap_bi_phat # muc:{muc}
-> END

=== chung_td_doc_trom(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} đứng sau lưng người khác nhìn màn hình hơi lâu.|{A} biết nhiều chuyện hơn người khác.}
- 2: {~{A} đọc trộm email của người khác đó!|{A} có mật khẩu của mấy người trong công ty.}
- else: {~{A} cài camera trong pantry để nghe lén cả công ty!|{A} biết mật khẩu của tất cả mọi người, kể cả của con {cho}!}
}
# tin_don:doc_trom # muc:{muc}
-> END

=== chung_td_viet_tieu_thuyet(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} hay ghi chép gì đó trong cuốn sổ riêng.|{A} có viết lách chút đỉnh ngoài giờ.}
- 2: {~{A} đang viết tiểu thuyết về công ty mình, dùng tên thật luôn!|Trong sổ của {a} có tên cả công ty, mỗi người một chương.}
- else: {~Tiểu thuyết của {a} sắp được dựng phim, ai cũng có vai, trừ sếp!|{A} viết về chuyện công ty rồi bán cho LL làm phim, đặt cọc rồi!}
}
# tin_don:viet_tieu_thuyet # muc:{muc}
-> END

=== chung_td_khong_tra_loi_group(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} "đã xem" tin nhắn sếp mà hông trả lời.|{A} tắt thông báo group công ty.}
- 2: {~{A} rời group công ty rồi vô lại, tưởng hông ai thấy!|{A} chặn luôn tin nhắn của sếp sau 22 giờ.}
- else: {~{A} block cả công ty trên Zalo-lô, chỉ chừa lại con {cho}!|{A} lập group công ty giả, mời cả công ty vô, rồi hông nói gì cả tháng!}
}
# tin_don:khong_tra_loi_group # muc:{muc}
-> END

=== chung_td_mua_xe(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} mới thay vỏ xe máy.|{A} đang coi giá xe mới trên mạng.}
- 2: {~{A} mua xe mới rồi, mà lương chưa về, tiền đâu ra?|{A} trả góp chiếc xe tay ga, tới năm 2029 mới hết.}
- else: {~{A} mua siêu xe màu hồng y chang xe Siêu Nhân Hồng!|{A} mua luôn cả bãi giữ xe, giờ thu tiền giữ xe của cả công ty!}
}
# tin_don:mua_xe # muc:{muc}
-> END

=== chung_td_giup_nguoi_la(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~Tui thấy {a} dắt bà cụ qua đường.|{A} đẩy xe chết máy giùm người ta hồi mưa.}
- 2: {~{A} đi giúp người khắp quận, ai cũng biết mặt!|{A} bỏ ngang giờ làm để đi giúp người lạ đó.}
- else: {~{A} chính là Siêu Nhân Hồng thứ hai, đêm nào cũng đi tuần!|Nghe nói {a} được phường tặng bằng khen, treo ở chòi bảo vệ!}
}
# tin_don:giup_nguoi_la # muc:{muc}
-> END

=== chung_td_nuoi_thu_cung(nguoi, muc) ===
~ temp a = chung_ten_buon(nguoi)
~ temp A = chung_ten_buon_hoa(nguoi)
~ temp o = chung_ngoi_ba(nguoi)
{ muc:
- 1: {~{A} hay mua xúc xích cho {cho}.|{A} thích chó lắm.}
- 2: {~{A} định xin {cho} về nuôi đó, bác {bac_bao_ve} chưa chịu!|{A} lập fanpage riêng cho {cho} mà giấu hông nói.}
- else: {~{A} hiểu được tiếng chó! Nói chuyện với {cho} cả tiếng đồng hồ!|Nghe nói {a} với {cho} lập hội kín, bàn chuyện chiếm công ty!}
}
# tin_don:nuoi_thu_cung # muc:{muc}
-> END
