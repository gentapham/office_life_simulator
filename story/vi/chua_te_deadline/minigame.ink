// ============================================================
// CHÚA TỂ DEADLINE · MINIGAME
// Mỗi minigame: _mo_dau (thoại trước khi chơi), _thanh_cong, _that_bai.
// Game chạy minigame sau knot _mo_dau, rồi mở knot kết quả tương ứng.
// ============================================================

// ============ 📋 KÉO THẢ BẢNG TIẾN ĐỘ ============
=== chua_te_deadline_mg_bang_tien_do_mo_dau ===
# noi:ban_lam_viec
_Bảng tiến độ dạng xếp gạch. Thanh quay, thanh dựng, thanh thiết kế, thanh đăng bài. Mỗi người một màu. Không được để hai việc của cùng một người chồng lên nhau._
truong_phong: 14 giờ. Tớ chờ. Đừng để {editor} vừa dựng MV vừa dựng teaser trong cùng một ngày nhé.
_Ở góc bảng, một khối hồng tự rơi xuống: "Đi giúp người". Không ai biết nó sẽ chen vào ngày nào._
-> END

=== chua_te_deadline_mg_bang_tien_do_thanh_cong ===
# noi:ban_lam_viec
_Bảng sạch bong. Không một thanh nào chồng lên nhau. Khối hồng "Đi giúp người" nằm gọn trong ô trống bạn chừa sẵn._
truong_phong: *(nhìn rất lâu)* … Tớ không có gì để góp ý. Đây là lần đầu tiên tớ nói câu này trong năm.
~ tien_cong(200000)
~ nhan(ca_phe)
~ uy_tin = uy_tin + 5
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 10
~ qh("truong_phong", 5)
~ qh("editor", 3)
_Bạn tự thưởng một ly cà phê muối. Mặn mặn, ngọt ngọt, giống cảm giác làm xong việc sớm._
-> END

=== chua_te_deadline_mg_bang_tien_do_that_bai ===
# noi:ban_lam_viec
_Hai thanh màu tím chồng lên nhau. Thanh tím là của {editor}. Ngày 8/10, {editor} vừa phải dựng MV vừa phải dựng teaser vừa phải đi khám mắt._
~ tien_cong(50000)
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 5
~ qh("editor", -3)
_2 giờ sáng, điện thoại bạn sáng lên. Tin nhắn từ {editor}: "???"_
_Chỉ ba dấu hỏi. Mà nặng hơn ba trang kiểm điểm._
-> END

// ============ 📞 ĐI ĐÒI FILE ============
=== chua_te_deadline_mg_doi_file_mo_dau ===
# noi:tang_1 # ngau_nhien
_Hạn đăng bài: 17 giờ. Ba file còn nằm ở ba người. {editor} đang ngủ trên ghế sofa phòng dựng. {designer} đang sửa poster lần thứ 19. {bien_kich} đang "lấy cảm hứng" trên sân thượng._
_Mỗi người cần một kiểu dụ: cà phê, lời khen, hoặc… tên của {truong_phong}._
-> END

=== chua_te_deadline_mg_doi_file_thanh_cong ===
# noi:tang_1
editor: *(mở một mắt, ngửi ly cà phê)* … Đây. File. Ông đi đi.
designer: Ông là người đầu tiên khen font chữ chứ không khen "màu đẹp". Cầm file đi, trước khi tui đổi ý.
bien_kich: *(nghe tên {truong_phong}, giật mình)* Đây! Đây! Kịch bản đây! Đừng nói anh {truong_phong}!
_Ba file. 16 giờ 58. Bạn ghé phòng chờ của Siêu Nhân Hồng, lấy một đĩa bánh chuối chiên theo đúng điều khoản số 4._
~ tien_cong(300000)
~ nhan(chuoi_chien)
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 10
~ follow(5000)
-> END

=== chua_te_deadline_mg_doi_file_that_bai ===
# noi:tang_1
_Bạn dọa {designer} bằng tên {truong_phong}. Sai người. {designer} không sợ {truong_phong}. {designer} chỉ sợ bị sửa._
designer: Ông nói vậy thì tui sửa thêm một lần nữa cho chắc. Lần thứ 20.
_Bạn đòi được đúng một file, lúc 17 giờ 40. Bài đăng trễ._
~ tien_cong(100000)
~ qh("designer", -5)
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 5
-> END

// ============ 🌙 ĐÊM THẦN TỐC ============
=== chua_te_deadline_mg_dem_than_toc_mo_dau ===
# noi:phong_gac_quan_bida
_22 giờ. Nhạc lofi. Bấm theo nhịp để gõ kịch bản, cắt cảnh, xuất file. Thanh năng lượng tụt dần. Hai lon Trâu Cày đứng chờ như hai người lính._
{ vu_nuoc_toi_chan >= 80:
    _Chế độ Thần Tốc: tay nhanh gấp 3. Nhưng nhớ: nhanh quá thì có lúc trượt._
}
_7 giờ 59 phải bấm "Gửi". Không phải 8 giờ. 7 giờ 59._
-> END

=== chua_te_deadline_mg_dem_than_toc_thanh_cong ===
# noi:phong_gac_quan_bida
_7 giờ 59. Gửi._
_Bạn ngả ra sau. Ánh nắng đầu tiên chiếu qua cửa sổ phòng gác. Dưới nhà, chú chủ quán bida bắt đầu lau bàn._
~ vu_so_dem_than_toc++
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 50
~ nghi(-80)
~ tien_cong(500000)
~ nhan(mi_ly)
~ nhan(nuoc_tang_luc)
{ ngay >= 29:
    ~ vu_cue_sheet = 47
    ~ vu_dem_than_toc_2910 = true
    _Cue sheet Đại Nhạc Hội Siêu Nhân: 47 trên 47. Cue cuối: "Pháo giấy… Go!"_
}
giam_doc: *(Zalo-lô, 8 giờ 01)* Anh nhận rồi. Thưởng nóng 500 nghìn. Cả thùng mì ly nữa. Anh không ép, tùy em ngủ hay không.
_Nước tới chân mới nhảy, mà nhảy là phải đẹp._
-> END

=== chua_te_deadline_mg_dem_than_toc_that_bai ===
# noi:phong_gac_quan_bida
_8 giờ 01. Gửi._
_Hai phút. Chỉ hai phút. Nhưng hai phút là đủ để {truong_phong} gửi email trước: "Cậu {chua_te_deadline} trễ hạn."_
~ vu_so_dem_than_toc++
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 30
~ nghi(-80)
{ ngay >= 29:
    ~ vu_cue_sheet = vu_cue_sheet + 20
    { vu_cue_sheet > 46:
        ~ vu_cue_sheet = 46
    }
    _Cue sheet: {vu_cue_sheet} trên 47. Thiếu đúng cue cuối. Cue quan trọng nhất._
}
giam_doc: *(Zalo-lô)* Anh nhận rồi. Cũng được.
_"Cũng được". Hai chữ nhẹ nhất mà nặng nhất trong từ điển của {giam_doc}._
-> END

// ============ 🗓️ XẾP LỊCH QUAY ============
=== chua_te_deadline_mg_xep_lich_quay_mo_dau ===
# noi:ban_lam_viec
_Ghép lịch rảnh của {sieu_nhan_hong}, studio, {it} (âm thanh) và {thanh_xin_nghi} (nếu có đi làm)._
{ ngay == 14:
    _Hôm nay {thanh_xin_nghi} đang "gặt lúa". Ô của {thanh_xin_nghi} trên bảng là một bông lúa._
}
_Mỗi lượt có một sự cố: {thanh_xin_nghi} xin nghỉ, {cho} nằm chắn cửa studio, Siêu Nhân Hồng chạy đi đẩy xe giùm người ta._
-> END

=== chua_te_deadline_mg_xep_lich_quay_thanh_cong ===
# noi:studio_tang_2
_Lịch khít như ráp hình. Studio không trống phút nào, {it} không phải chạy hai nơi, và vẫn còn một khoảng 30 phút cho "đi giúp người"._
giam_doc: Đoàn quay hôm nay anh đãi cơm tấm! Sườn bì chả! Không ai được từ chối!
~ tien_cong(150000)
~ nhan(com_tam)
~ uy_tin = uy_tin + 3
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan - 10
~ follow(8000)
~ qh("it", 3)
-> END

=== chua_te_deadline_mg_xep_lich_quay_that_bai ===
# noi:studio_tang_2
_Lịch vỡ. Studio đặt trùng giờ với một buổi chụp ảnh cưới. Cô dâu chú rể bước vào đúng lúc Siêu Nhân Hồng đang tạo dáng._
sieu_nhan_hong: Chúc mừng hạnh phúc! Biến hình! *(chụp chung với cô dâu chú rể)*
_Ảnh cưới có Siêu Nhân Hồng lên mạng. Không ai biết đây là thảm họa hay là quảng cáo._
~ tien_cong(30000)
~ uy_tin = uy_tin - 3
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 5
~ follow(3000)
-> END

// ============ 📊 BÁO CÁO GIAO BAN THỨ 2 ============
=== chua_te_deadline_mg_bao_cao_giao_ban_mo_dau ===
# noi:phong_hop_sang_tao
_Bạn đứng trước màn chiếu. {truong_phong} ngồi đối diện, bút đỏ trên tay, như giám khảo cuộc thi hoa hậu của các con số._
truong_phong: Tớ sẽ hỏi 3 câu. Trả lời trúng thì qua. Sai thì mình sync nhanh 5 phút.
_Chọn số liệu: thật, "làm đẹp", hay "80%"._
-> END

=== chua_te_deadline_mg_bao_cao_giao_ban_thanh_cong ===
# noi:phong_hop_sang_tao
truong_phong: Câu cuối: MV xong chưa? … Ừ. Khớp với bảng. Khớp với file. Qua.
_{truong_phong} gạch một dấu tích. Bạn thấy rõ tay {truong_phong} hơi run, vì không quen gạch tích cho bạn._
~ tien_cong(100000)
~ uy_tin = uy_tin + 5
~ qh("truong_phong", 5)
-> END

=== chua_te_deadline_mg_bao_cao_giao_ban_that_bai ===
# noi:phong_hop_sang_tao
truong_phong: Con số ở slide 3 khác slide 7. Cậu ở lại nhé. Mình sync nhanh 5 phút.
_"5 phút" của {truong_phong}: 2 tiếng 10 phút. Bạn ra khỏi phòng lúc 11 giờ 40, đói, và biết thêm 4 định nghĩa của chữ "sync"._
~ uy_tin = uy_tin - 5
~ nghi(-20)
~ cang_thang(15)
~ an(-15)
-> END

// ============ 🎱 BIDA CƠ BẢN ============
=== chua_te_deadline_mg_bida_mo_dau ===
# noi:quan_bida_co_ban
dan_dau_tu: Một ván. Thua chai nước ngọt. Mà nói trước, anh đang trong chu kỳ tăng giá, đánh trúng hết á.
_Tiếng bi lách cách. Cái âm thanh ru bạn ngủ mỗi đêm, giờ là âm thanh chiến trường._
-> END

=== chua_te_deadline_mg_bida_thanh_cong ===
# noi:quan_bida_co_ban
_Băng ba băng. Bi số 8 vào lỗ. {dan_dau_tu} nhìn cái lỗ như nhìn chart đỏ._
dan_dau_tu: Đây là… điều chỉnh kỹ thuật. Ván sau anh lấy lại.
~ tien_cong(50000)
~ uong(20)
~ qh("dan_dau_tu", 3)
_Bạn uống luôn chai nước ngọt tại bàn. {giam_doc} một ván bida có vị ngọt như thắng một deadline._
-> END

=== chua_te_deadline_mg_bida_that_bai ===
# noi:quan_bida_co_ban
_Bạn thua. {dan_dau_tu} rút cuốn sổ nợ dày cộp ra, lật tới trang của… chính {dan_dau_tu}, ghi: "{chua_te_deadline} nợ 1 chai nước ngọt."_
dan_dau_tu: Anh ghi chung sổ cho tiện. Sổ này toàn anh nợ người ta, giờ có một dòng người ta nợ anh. Đẹp sổ.
~ vu_no_chuong = vu_no_chuong + 15000
~ vu_nuoc_toi_chan = vu_nuoc_toi_chan + 5
~ qh("dan_dau_tu", 5)
-> END
