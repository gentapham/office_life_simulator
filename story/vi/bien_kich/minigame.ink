// ============================================================
// BIÊN KỊCH: OÁNH · MINIGAME (mở đầu / thắng / thua)
// Game chạy minigame sau knot mở đầu, rồi gọi knot _thang hoặc _thua.
// ============================================================

// ============================================================
// 🎬 KỊCH BẢN BA HỒI
// ============================================================
=== bien_kich_mg_kich_ban_ba_hoi ===
# noi:ban_bien_kich
_Ba ô trống trên bàn: MỞ ĐẦU · CAO TRÀO · KẾT. Bên cạnh là chồng thẻ cảnh, thẻ nào cũng đóng dấu "THẬT" hoặc "MƯỢN"._
truong_phong: *(nhắn Zalo-lô)* Em ơi, góp ý nhanh: thêm cảnh Siêu Nhân Hồng cưỡi ngựa nhé. Và một cảnh anh đứng chỉ tay vào bản đồ.
_Hai tấm thẻ mới rơi xuống bàn: "CƯỠI NGỰA" và "ANH NHẬT CHỈ TAY". Phải xếp sao cho phim vẫn còn là phim._
bien_kich: Kịch bản này cần thêm nỗi đau. Và anh vừa cho nó thêm rồi đó.
-> END

=== bien_kich_mg_kich_ban_ba_hoi_thang ===
_Ba hồi khít như ba bậc cầu thang gác mái. Con ngựa thành ngựa gỗ trong công viên. {truong_phong} chỉ tay vào bản đồ… chỉ đường cho người hùng._
~ tien_cong(300000)
~ bk_co_ca_phe_muoi = true
~ bk_cam(10)
~ bk_phim(10)
{ bk_cam_hung >= 50:
    ~ uy_tin = uy_tin + 10
    { ngay <= 9:
        ~ bk_kich_ban_mv_sao = 3
    }
    truong_phong: Ba sao! Cái cảnh anh chỉ tay ấy, đắt lắm. Em có con mắt đấy.
- else:
    { ngay <= 9:
        ~ bk_kich_ban_mv_sao = 2
    }
    truong_phong: Ổn. Hai sao. Lần sau thêm cảm xúc nhé.
}
_Phần thưởng: 300.000đ và một phiếu cà phê muối ở Phố Cũ. Uống vào là thấy đời mặn mà trở lại._
-> END

=== bien_kich_mg_kich_ban_ba_hoi_thua ===
_Cao trào nằm ở hồi một. Kết nằm ở giữa. Con ngựa phi thẳng vào cảnh tang lễ._
{ ngay <= 9:
    ~ bk_kich_ban_mv_sao = 1
}
~ bk_cam(-10)
~ cang_thang(10)
truong_phong: Thế… cuối cùng là ai cưỡi ngựa? Mình take note lại, họp tiếp nhé.
_Bạn nhìn ba ô trên bàn. Mở đầu, cao trào, kết. Ba cái hộp, và bạn không biết nhét đời mình vào hộp nào._
-> END

// ============================================================
// ❓ CÂU HỎI GAMESHOW
// ============================================================
=== bien_kich_mg_cau_hoi_gameshow ===
# noi:ban_bien_kich
_Mười dòng trống. Gameshow "Hồng Hay Không Hồng" lên sóng trực tiếp. Dễ quá thì khán giả ngáp, khó quá thì {sieu_nhan_hong} đứng hình trên truyền hình quốc gia._
_Và phải có ít nhất một câu "hồng"._
* [😴 Viết dễ: "Siêu Nhân Hồng mặc đồ màu gì?"]
    ~ bk_cau_hoi_gameshow = "de"
* [🎯 Viết vừa: câu hỏi ngố mà để {sieu_nhan_hong} trả lời ngố một cách dễ thương.]
    ~ bk_cau_hoi_gameshow = "vua"
* [🧠 Viết khó: kinh tế vĩ mô của ngành bánh tráng trộn.]
    ~ bk_cau_hoi_gameshow = "kho"
- -> END

=== bien_kich_mg_cau_hoi_gameshow_thang ===
_Mười câu, câu nào cũng có chỗ cho khán giả cười. Câu số 7: "Màu hồng có bao nhiêu sắc thái?". Câu hồng. Câu mồi. Câu đinh._
~ tien_cong(250000)
~ bk_co_ve_gameshow = true
~ bk_that(5)
~ bk_cam(5)
{ bk_cau_hoi_gameshow == "":
    ~ bk_cau_hoi_gameshow = "vua"
}
truong_phong: Duyệt. Câu số 7 tớ… à anh thích nhất.
_Phần thưởng: 250.000đ và một vé xem gameshow, tặng ai cũng được. Tặng đúng người thì thân thêm một bậc._
-> END

=== bien_kich_mg_cau_hoi_gameshow_thua ===
_Câu hỏi thì có. Mà đọc lên nghe như đề thi tốt nghiệp. Câu "hồng" duy nhất là "Hồng là gì?"._
~ bk_cau_hoi_gameshow = "de"
~ bk_cam(-5)
~ cang_thang(5)
truong_phong: Ổn. Hơi… an toàn. Thôi duyệt, gần giờ rồi.
-> END

// ============================================================
// 🎤 BÀI PHÁT BIỂU CHO SẾP
// ============================================================
=== bien_kich_mg_phat_bieu ===
# noi:phong_giam_doc
_Năm từ khóa {giam_doc} thích: "gia đình", "mindset", "hồi khởi nghiệp", "văn hóa", "cùng nhau". Không được dài quá 15 phút._
_Bên dưới khán giả có một thanh "ngáp". Đầy thanh là cả công ty ngủ._
giam_doc: Em viết sao cho anh đọc mà mọi người rưng rưng nhé. Không cần khóc đâu, rưng rưng thôi. Anh không ép.
-> END

=== bien_kich_mg_phat_bieu_thang ===
_{giam_doc} đọc đúng mười hai phút. Đủ năm từ khóa. Thanh ngáp dừng ở một phần ba. {chi_dai} không ngủ. Đó là kỷ lục._
~ tien_cong(500000)
~ nhan(hoa_hong)
~ bk_bai_phat_bieu_tot = bk_bai_phat_bieu_tot + 1
~ qh("giam_doc", 10)
~ uy_tin = uy_tin + 15
giam_doc: Các em, bài này của {bien_kich} viết. Một cây bút của gia đình mình!
thanh_ninh: *(vỗ tay, hơi chậm nửa nhịp)* Anh nói chuẩn quá anh ơi.
_Phần thưởng: phong bì 500.000đ và một bó hoa. Hoa thì có thể tặng lại, phong bì thì giữ._
-> END

=== bien_kich_mg_phat_bieu_thua ===
_Phút thứ 19. {giam_doc} vẫn đang ở đoạn "hồi khởi nghiệp lần hai". Thanh ngáp đầy. {chua_te_deadline} ngủ thật, có tiếng._
~ tien_cong(200000)
~ cang_thang(10)
~ qh("giam_doc", -3)
giam_doc: *(gấp bài lại)* Bài hơi dài nhỉ. Mà anh thêm có ba đoạn thôi đấy.
-> END

// ============================================================
// ✏️ CAPTION BA GIÂY
// ============================================================
=== bien_kich_mg_caption ===
# noi:ban_mang_xa_hoi
hong_hot: Bà ơi! Năm tấm ảnh Siêu Nhân Hồng, mỗi tấm ba giây chọn caption! Bắt trend nha! Gét gô!
_Tấm đầu tiên: {sieu_nhan_hong} tạo dáng trên nóc xe hồng, mặt trời lặn phía sau._
-> END

=== bien_kich_mg_caption_thang ===
_"Slay giữa giờ cao điểm." "Hồng không phải màu, hồng là kẹt xe." Năm caption, năm lần {hong_hot} hét lên._
~ tien_cong(250000)
~ follow(10000)
~ qh("hong_hot", 5)
~ bk_that(3)
hong_hot: Ối dồi ôi, tương tác x3! Bà mà làm admin chắc tui thất nghiệp!
-> END

=== bien_kich_mg_caption_thua ===
_Tấm thứ ba hết giờ. Caption tự động: "Ảnh 3". Tấm thứ năm, bạn chọn nhầm "Chia buồn cùng gia đình"._
~ tien_cong(50000)
~ follow(-3000)
~ cang_thang(5)
hong_hot: Ủa… "chia buồn" là sao bà? Bà buồn ai?
-> END

// ============================================================
// 🗂️ SỐNG SÓT BUỔI BRAINSTORM
// ============================================================
=== bien_kich_mg_brainstorm ===
# noi:phong_hop_sang_tao
_Cuộc họp "5 phút" của {truong_phong}. Mục tiêu: chen ý kiến đúng lúc, không ngủ gật, không bị giao thêm việc._
_Và né bằng mọi giá câu thần chú: "{bien_kich} note lại giúp anh nhé."_
truong_phong: Mình bắt đầu nhé. 5 phút thôi.
-> END

=== bien_kich_mg_brainstorm_thang ===
_Hai tiếng sau. Bạn chen đúng ba câu, gật đúng bảy lần, và mỗi khi {truong_phong} sắp nói chữ "note", bạn đúng lúc ho._
~ bk_so_hop_song_sot = bk_so_hop_song_sot + 1
~ an(25)
~ bk_cam(5)
truong_phong: Ừ… thế {thuc_tap_sinh} note lại giúp anh nhé.
thuc_tap_sinh: Dạ em note liền ạ!
_Phần thưởng: đĩa bánh ngọt dư sau buổi họp. Bánh bông lan hơi khô, nhưng là bánh của người sống sót._
-> END

=== bien_kich_mg_brainstorm_thua ===
_Phút thứ 87, mí mắt bạn sụp. Đầu gục xuống. Tỉnh dậy, {truong_phong} đang nhìn bạn, mỉm cười._
~ cang_thang(15)
~ bk_cam(-5)
truong_phong: {bien_kich} note lại giúp anh nhé. Và soạn luôn cái kế hoạch truyền thông cho tuần sau.
_Bạn nhận thêm hai việc. Vì đã ngủ năm phút trong một cuộc họp năm phút._
-> END

// ============================================================
// ⌨️ ĐÊM GÕ MÁY CHỮ
// ============================================================
=== bien_kich_mg_dem_go_may ===
# noi:gac_mai_so_7
_Gác mái. Đèn bàn. Máy đánh chữ. Những chuyện trong ngày đang xếp hàng chờ thành chữ._
_Viết tên thật thì câu văn sống hơn. Nhưng mỗi cái tên thật là một quả mìn nhỏ trong bản thảo._
_Bí đang nằm cạnh bàn phím, giả vờ ngủ. Bí chưa bao giờ ngủ thật khi bạn đang viết._
-> END

=== bien_kich_mg_dem_go_may_thang ===
_Lạch cạch tới 2 giờ sáng. Mười trang. Có một câu hay tới mức bạn đọc to lên, và Bí vẫy đuôi._
~ bk_trang(10)
~ bk_cam(5)
~ uong(25)
~ cang_thang(-10)
{ not bk_da_doi_ten:
    ~ bk_lo(2)
}
_Phần thưởng: một ấm trà nóng. Mười trang là một ấm trà, luật của gác mái số 7._
{ bk_trang_tieu_thuyet >= 90:
    _Bạn lật trang cuối. Gần trăm trang. Một cuốn sách thật. Bạn ngồi im, không dám thở mạnh, sợ nó bay mất._
}
-> END

=== bien_kich_mg_dem_go_may_thua ===
_Bí nhảy lên bàn phím đúng lúc bạn viết câu hay nhất đêm nay. Câu đó thành "ggggggggg"._
~ bk_trang(3)
~ bk_cam(-5)
~ bk_vuot_meo = bk_vuot_meo + 1
_Ba trang. Và một con mèo không hề hối hận._
-> END

// ============================================================
// 🎭 ĐẠO DIỄN GIẢ VỜ LÀM VIỆC (đặc biệt, 22/10)
// ============================================================
=== bien_kich_mg_gia_vo_lam_viec ===
# ngay:22 # noi:khu_lam_viec_chung
_Bạn đứng giữa tầng 1, cầm tờ kịch bản cuộn tròn như đạo diễn. Mỗi bàn là một vai diễn._
_{dan_dau_tu}: tắt chart coin, mở bảng tính. {chua_te_deadline}: mắt mở, tay gõ. {sales}: không được nói chữ "chắc kèo"._
_Đoàn kiểm tra sẽ đi ngang ba lần. Mỗi lần, cả tầng phải "làm việc chăm chỉ" đúng nhịp._
ke_toan: Diễn cho thật nha em. Nhưng đừng diễn quá. Thanh tra thấy chăm quá là nghi.
-> END

=== bien_kich_mg_gia_vo_lam_viec_thang ===
_Ba lần đi ngang. Ba lần cả tầng 1 như một bức tranh "văn phòng mẫu mực". {chua_te_deadline} lần đầu tiên làm việc thật, vì quên là đang diễn._
~ bk_kich_ban_thanh_tra = true
~ tien_cong(300000)
~ qh("ke_toan", 15)
~ uy_tin = uy_tin + 10
~ bk_that(5)
ke_toan: *(thì thầm)* Em cứu chị rồi đó. Cái này chị ghi sổ, không phải sổ tiền, sổ ơn.
-> END

=== bien_kich_mg_gia_vo_lam_viec_thua ===
_Lần đi ngang thứ hai, màn hình {dan_dau_tu} hiện nguyên chart nến đỏ lòm. Thanh tra dừng lại._
~ cang_thang(15)
~ qh("ke_toan", -5)
chu_liem: Đây là… số liệu gì?
dan_dau_tu: Dạ… dạ… số liệu… cảm xúc khán giả ạ. Đỏ là… là đang yêu.
_{ke_toan} nhắm mắt lại. Rất lâu._
-> END
