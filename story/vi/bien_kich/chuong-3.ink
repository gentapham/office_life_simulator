// ============================================================
// BIÊN KỊCH: OÁNH · CHƯƠNG 3: "TRONG BÓNG TỐI, AI CŨNG LÀ NHÀ VĂN" (13/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== bien_kich_1310_bai_khen_cua_nhi ===
# ngay:13 # gio:09:45 # noi:sanh_tang_tret # bat_buoc
_Ngày Doanh nhân Việt Nam. {giam_doc} ôm một bó hoa to, tự tặng chính mình. Trong phòng giám đốc, tấm bằng "Doanh nhân của năm" của BTT Global vừa được treo lên, hơi lệch._
_{thanh_ninh} cầm micro, đọc bài khen sếp. Phút thứ 3. Phút thứ 7. Phút thứ 11._
thanh_ninh: "…một người đứng mũi chịu sào, như cây tre giữa bão, cong mà không gãy, gãy mà vẫn cười…"
_Bạn đứng hình. Câu "gãy mà vẫn cười" là của bạn. Bạn viết nó cho bài Tất niên năm ngoái, kèm ba đoạn sau nữa._
_Lần đầu tiên, có người "tham khảo" bạn. Và cảm giác đó… không giống cảm hứng chút nào._
giam_doc: *(lau nước mắt)* {thanh_ninh} ơi, em viết hay quá. Em là cây bút của gia đình mình.
thanh_ninh: Dạ, em thức cả đêm đó anh! Anh nói chuẩn quá anh ơi!
* [🐍 Giơ tay: "Đoạn cây tre đó em viết cho anh hồi Tết. Anh còn nhớ hông?"]
    ~ qh("thanh_ninh", -15)
    ~ qh("giam_doc", 3)
    giam_doc: À… ừ nhỉ. Hai em cùng một tư tưởng lớn. Gia đình mà!
    thanh_ninh: *(nụ cười cứng như tượng)* Dạ, em lấy cảm hứng từ chị {bien_kich} đó ạ. Cảm hứng thôi.
    _"Cảm hứng thôi." Nghe từ miệng người khác, câu đó kỳ cục ghê._
    ~ bk_cam(5)
* [😶 Im lặng, nhưng ghi vào sổ: "Hôm nay tôi bị tham khảo. Nó đau ở chỗ người ta vỗ tay."]
    ~ bk_that(5)
    ~ bk_cam(10)
    ~ bk_trang(2)
    _Bạn đọc lại câu vừa viết. Rồi lật ngược về trang "Ý tưởng của {thuc_tap_sinh}". Rồi đóng sổ lại._
    { bk_y_tuong_muon >= 20:
        _Có một cái gì đó nặng xuống, như cuốn sổ vừa dày thêm mấy trang mà không phải của mình._
        ~ cang_thang(10)
    }
* [😇 Vỗ tay thật to. Lát sau nhắn riêng {thanh_ninh}: "Bài hay. Lần sau cần thì cứ hỏi tui."]
    ~ qh("thanh_ninh", 10)
    thanh_ninh: *(nhắn lại)* Dạ… chị đừng nói ai nha. Em cảm ơn chị. Thật đó.
    _Lần đầu tiên bạn thấy {thanh_ninh} dùng chữ "thật đó"._
    ~ bk_that(3)
- -> END

// ------------------------------------------------------------
=== bien_kich_1410_cau_hoi_gameshow ===
# ngay:14 # gio:10:00 # noi:ban_bien_kich # bat_buoc
_Mốc 2: phải đạt 200.000 người theo dõi. Trên bàn {thanh_xin_nghi} có tờ giấy: "Em xin nghỉ về quê phụ gặt lúa ạ."_
{ nguoi_theo_doi < 200000:
    _Chưa đạt. {sieu_nhan_hong} buồn, bỏ đi giúp người cả ngày. Studio trống trơn, chỉ còn cái ghế hồng._
    ~ cang_thang(5)
}
truong_phong: {bien_kich}, mai 10 giờ nộp 10 câu hỏi cho gameshow "Hồng Hay Không Hồng" nhé. Phải có ít nhất một câu hồng.
_Bạn mở file mới. Gõ dòng đầu: "Câu 1."_
_Rồi đói. Rồi khát. Bạn định đi pantry lấy nước, để màn hình đó._
_Đúng lúc ấy, {ran_doc} đi ngang, tay cầm cuốn sổ nhỏ, cười rất thân thiện._
ran_doc: Chị {bien_kich} viết gì đó? Nhìn chăm chú ghê. Tui chỉ hỏi vậy thôi chứ không có ý gì đâu.
* [🔒 Khóa máy rồi mới đi. "Thói quen thôi em."]
    ~ bk_bi_trao_cau_hoi = false
    ran_doc: *(vẫn cười)* Chị cẩn thận ghê. Tốt mà.
* [😇 Để nguyên màn hình. "Câu hỏi gameshow. Em đọc thử coi có dễ quá hông?"]
    ran_doc: Để tui coi… Hay mà. Mấy câu này, chị để đó tui góp ý cho.
    { RANDOM(1, 10) <= 5:
        ~ bk_bi_trao_cau_hoi = true
    }
    ~ qh("ran_doc", 5)
* [💬 "Em là nhân viên mới hả? Ngồi đây chơi, kể chị nghe chuyện xóm cũ của em đi."]
    ran_doc: *(nụ cười khựng nửa giây)* Xóm cũ hả? Xóm tui có cây me… à mà thôi, chuyện cũ lắm.
    _Nửa giây đó, bạn ghi vào sổ. Nhà văn sống bằng những nửa giây._
    ~ bk_cam(10)
    ~ bk_lo(3)
- -> bien_kich_mg_cau_hoi_gameshow

// ------------------------------------------------------------
=== bien_kich_1510_hop_nen ===
# ngay:15 # gio:08:40 # noi:phong_hop_sang_tao # bat_buoc
_Mất điện cả tòa. Nghe nói 8 giờ 05, {giam_doc} và {chi_dai} kẹt chung thang máy. Không ai dám tưởng tượng trong đó đang có chuyện gì._
_Phòng "Sáng Tạo" tối om. {truong_phong} thắp ba cây nến thơm mùi "Bình Minh Năng Suất"._
truong_phong: Không có máy chiếu thì mình họp bằng miệng. 5 phút thôi.
_{thuc_tap_sinh} phát cho mỗi người một cục sạc dự phòng. Năm cục. Không ai hỏi vì sao một thực tập sinh có năm cục sạc._
_Không slide. Không màn hình. Ánh nến làm mặt ai cũng thật thà hơn bình thường._
chua_te_deadline: Nói thật nha… cái file gốc dự án tháng 6… à mà thôi. Thôi. Chill.
truong_phong: Cậu nói gì cơ?
chua_te_deadline: Không có gì anh. Nến thơm quá nên tui nói bậy.
truong_phong: {bien_kich}, kịch bản phim ngắn sao rồi?
* [🕯️ "Em bị bắt viết lại bốn lần rồi anh. Lần thứ năm chắc em viết bằng máu."]
    ~ bk_cam(5)
    ~ qh("truong_phong", -3)
    designer: *(trong bóng tối)* Bốn lần mà than. Logo tui 37 lần.
    bien_kich: Bà im.
    designer: Không im. Tối mà, ai thấy ai đâu.
* {not bk_ghi_cong_duy} [🙇 "Nói thật nha. Ý tưởng gốc của phim là của anh {thuc_tap_sinh}. Em chỉ viết."]
    ~ bk_ghi_cong("thuc_tap_sinh")
    ~ bk_ghi_cong_duy = true
    _Ngọn nến lay một cái. Không ai nói gì. Rồi từ góc phòng, giọng {thuc_tap_sinh} run run:_
    thuc_tap_sinh: Dạ… dạ chị đừng nói vậy… chị viết mới là khó ạ.
    truong_phong: Thế à? Thế… em làm gì?
    bien_kich: Em làm cho nó thành phim, anh.
    _Bạn không thấy mặt ai. Nhưng bạn nghe tiếng {chi_dai} gật đầu. Gật đầu cũng có tiếng, nếu đủ im._
    ~ qh("chi_dai", 5)
* [😶 Ngồi im, nghe hết, ghi hết bằng đèn điện thoại.]
    ~ bk_cam(10)
    ~ bk_trang(3)
    ~ bk_lo(5)
    _Trong vòng sáng nhỏ xíu của điện thoại, trang sổ đầy chữ. Không ai để ý. Người ta chỉ để ý ánh nến._
- truong_phong: Ừ. Thế mình take note lại, họp tiếp sau khi có điện nhé.
-> END

// ------------------------------------------------------------
=== bien_kich_1510_pantry_toi ===
# ngay:15 # gio:14:30 # noi:pantry # bat_buoc
_Chiều. Vẫn mất điện. Cả công ty dạt về pantry, ngồi bệt dưới sàn, kể chuyện cho nhau nghe như hồi cắm trại._
_Bạn viết bằng đèn điện thoại. Cảm hứng đầy tới mức tràn ra mép giấy._
~ bk_cam(20)
hong_hot: Tới lượt {thuc_tap_sinh}! Kể chuyện gì cũng được, miễn là thật!
thuc_tap_sinh: Dạ… em kể chuyện ngày em nghỉ việc cũ nha.
thuc_tap_sinh: Hôm đó trời mưa to lắm. Em vừa nộp đơn xong, ra tới đường thì xe chết máy. Em đứng giữa mưa, không biết đi đâu.
thuc_tap_sinh: Rồi có một người mặc đồ siêu nhân màu hồng chạy tới. Không nói gì hết, đẩy xe giùm em. Hai cây số.
thuc_tap_sinh: Tới cây xăng, em quay lại định cảm ơn, thì người đó đi mất rồi. Em không biết tên.
thuc_tap_sinh: Em nghĩ… nếu có người làm vậy được cho người lạ, thì em cũng bỏ ngân hàng làm cái mình thích được.
_Cây bút máy tuột khỏi tay bạn, lăn trên sàn, lăn tới tận chân tủ lạnh._
_"Người Gác Két." "Người Hùng Không Tên." Không phải ý tưởng. Là chuyện thật. Là đời của người ta._
* {bk_thay_nguyen_day_xe} [🔒 Nhớ lại: "Đẩy hoài! Xe máy chết giữa mưa nè…" Người đó là {sieu_nhan_hong}?]
    ~ bk_hai_cay_so = true
    ~ bk_that(10)
    _Bạn nhìn về phía cửa phòng chờ, nơi bộ đồ hồng đang ngồi im trong bóng tối._
    _{sieu_nhan_hong} đẩy xe cho cả phố, không nhớ ai. {thuc_tap_sinh} nhớ người đẩy xe cả đời, không biết là ai._
    _Bạn có một cái kết. Một cái kết mà không ai viết được, trừ cuộc đời._
* [📎 Nhặt bút, ghi lại từng chữ. Cảnh đẩy xe trong mưa: cao trào của phim.]
    ~ bk_muon(15)
    ~ bk_phim(15)
    ~ bk_trang(3)
    _Bạn viết nhanh, rất nhanh, trước khi lương tâm kịp bật đèn._
* [😇 Nói với {thuc_tap_sinh}: "Chuyện của anh hay hơn phim của chị nhiều."]
    ~ qh("thuc_tap_sinh", 10)
    ~ bk_that(5)
    thuc_tap_sinh: Dạ… thiệt hả chị? Vậy… phim của chị có cảnh đẩy xe hông ạ?
    _Bạn không trả lời được. Bạn chỉ gật._
    ~ cang_thang(10)
- hong_hot: *(hít mũi)* Ối dồi ôi, chuyện gì mà nghe muốn khóc vậy trời.
{ RANDOM(1, 10) <= 3:
    _{hong_hot} liếc qua trang sổ của bạn trong ánh đèn điện thoại. Hơi lâu._
    ~ bk_lo(5)
}
-> END

// ------------------------------------------------------------
=== bien_kich_1510_phat_hat ===
# ngay:15 # gio:19:10 # noi:pantry
_Tối. Điện chưa có. Không ai về, vì về nhà cũng mất điện. Ai đó nói: "Chán quá, có ai hát gì đi."_
_Một giọng cất lên trong bóng tối, không micro, không kính đen._
idol_het_thoi: "Ngày xưa có đôi bạn thân… bán cá viên chiên tại công viên…"
_Cả pantry im lặng. Rồi một người hát theo. Rồi hai người. Rồi cả công ty._
_Lần đầu tiên, bài "Công Viên" không bị ai cười._
_Bạn để ý ba thứ trong bóng tối: {editor} đang giơ điện thoại quay. {quan_ly_idol} ngồi góc xa nhất, mắt không rời người đang hát. Và ở phía phòng chờ, có ai đó vừa tháo mũ, đang ngồi rất gần {chua_te_deadline}._
* [🎤 Hát theo. Hát to. Không ghi gì hết.]
    ~ cang_thang(-20)
    ~ bk_cam(10)
    ~ qh("idol_het_thoi", 5)
    _Có những đêm nhà văn không cần viết. Chỉ cần có mặt._
* [✍️ Ghi lại ánh mắt của {quan_ly_idol}. Một câu thôi.]
    ~ bk_trang(2)
    ~ bk_lo(5)
    ~ bk_cam(15)
    ~ phat_hien(thai_thuong_phat)
    _"Có một người nhìn người đang hát lâu hơn người khác một giây. Một giây đó dài mười năm."_
    _Bạn gạch chân câu đó. Rồi nghĩ: câu này mà lọt ra ngoài thì có người không sống nổi._
* [😶 Nhìn về phía phòng chờ. Không ghi. Có những cảnh không nên viết.]
    ~ bk_that(5)
    _Bạn quay đi, để cho người tháo mũ được ở yên trong bóng tối của mình._
    ~ qh("sieu_nhan_hong", 5)
- -> END

// ------------------------------------------------------------
=== bien_kich_1610_buffet ===
# ngay:16 # gio:12:00 # noi:pantry
_Ngày Lương thực Thế giới. Buffet ở công ty: bánh cuốn, gỏi cuốn, chè, và một nồi lẩu không ai biết ai đặt._
_{hong_hot} kéo ghế ngồi sát bạn, mắt sáng như vừa được mạng có lại._
hong_hot: Bà ơi. Hôm qua mất điện tui lỡ thấy cuốn sổ ô ly của {thuc_tap_sinh}. Trang đầu ghi: "Người Gác Két, kể chị {bien_kich} nghe, tháng 9".
hong_hot: Mà phim của bà tên "Người Hùng Không Tên". Hai cái này có họ hàng hông?
* [🙇 "Có. Ý tưởng là của ảnh. Tui đang tính ghi tên ảnh vào phim."]
    ~ bk_ai_biet_chuyen = true
    ~ qh("hong_hot", 5)
    hong_hot: Ủa… bà nói thật luôn? Tui tưởng phải hóng ba ngày mới ra chứ.
    hong_hot: Được. Tui giữ. Mà bà mà không ghi tên ảnh thật thì tui hông giữ nữa đâu nha.
    ~ bk_that(3)
* [🎭 "Ý tưởng là không khí. Ai hít thì của người đó."]
    ~ bk_ai_biet_chuyen = true
    ~ qh("hong_hot", -10)
    hong_hot: Ờ. Không khí. *(gắp miếng bánh cuốn, nhai rất chậm)* Để tui hít thử coi sao.
    ~ cang_thang(10)
* [🍲 Gắp cho {hong_hot} miếng chả to nhất, đổi chủ đề sang chuyện {sieu_nhan_hong} tháo mũ hôm qua.]
    ~ qh("hong_hot", 5)
    hong_hot: TÁO MŨ?! Ai thấy? Thấy mặt chưa? Kể! Kể liền!
    _Cuốn sổ ô ly bị quên trong ba giây. Nhưng {hong_hot} chưa bao giờ quên cái gì quá ba ngày._
    { RANDOM(1, 10) <= 5:
        ~ bk_ai_biet_chuyen = true
    }
- ~ an(100)
-> END

// ------------------------------------------------------------
=== bien_kich_1610_gameshow ===
# ngay:16 # gio:19:30 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng. Gameshow "Hồng Hay Không Hồng", giải 10 triệu. Bạn ngồi trong phòng điều khiển, tay nắm chặt tập câu hỏi._
mc_tivi_hong: Xin chào quý vị và các bạn! Câu hỏi tiếp theo dành cho Siêu Nhân Hồng!
{ bk_bi_trao_cau_hoi:
    mc_tivi_hong: "Kể tên 5 loại chó ghét bạn nhất."
    _{sieu_nhan_hong} đứng hình. Cả trường quay đứng hình. Bạn chưa từng viết câu này._
    sieu_nhan_hong: Dạ… chó… {cho}… chó {cho}… chó {cho} lúc đói… chó {cho} lúc no… và… chó {cho} đội nơ ạ?
    _Khán giả cười rần. Không biết là cười với, hay cười vào._
- else:
    { bk_cau_hoi_gameshow == "vua":
        mc_tivi_hong: "Màu hồng có bao nhiêu sắc thái?"
        sieu_nhan_hong: Dạ hai ạ! Hồng vui và hồng hơi vui!
        _Khán giả cười, mà là kiểu cười thương. Bạn thở phào. Câu hỏi vừa sức. Câu trả lời ngố. Đúng y kịch bản._
        ~ follow(40000)
    - else:
        { bk_cau_hoi_gameshow == "kho":
            mc_tivi_hong: "Nêu ba nguyên nhân kinh tế vĩ mô dẫn tới sự sụp đổ của thị trường bánh tráng trộn năm 2019."
            _{sieu_nhan_hong} đứng im mười giây trên sóng trực tiếp. Mười giây trên truyền hình dài bằng một mùa mưa._
            ~ follow(-10000)
        - else:
            mc_tivi_hong: "Siêu Nhân Hồng mặc đồ màu gì?"
            sieu_nhan_hong: Hồng ạ!
            _Khán giả vỗ tay lấy lệ. Ai đó trên mạng bình luận: "Câu hỏi cho mẫu giáo hả?"_
            ~ follow(5000)
        }
    }
}
_Tới phần "Hit Một Thời". {sieu_nhan_hong} hát "Công Viên": "…thích ăn… khoai chiên…"_
_Sai lời. Từ cánh gà, một giọng hát bè cất lên, đúng từng chữ "chuối chiên". Là {idol_het_thoi}._
* [🎬 Bấm bộ đàm: "Máy 2 lia sang cánh gà! Lia liền!"]
    ~ qh("idol_het_thoi", 10)
    ~ qh("quan_ly_idol", 10)
    ~ follow(10000)
    _Trên sóng, khung hình chia đôi: siêu nhân hát sai, ca sĩ cũ hát đúng. Mạng xã hội gọi đó là "song ca vô tình đẹp nhất năm"._
* [📝 Viết vội lên tấm bảng cho MC đọc: "Chuối hay khoai đều chiên được, quan trọng là hát cùng nhau!"]
    ~ bk_that(5)
    ~ follow(8000)
    mc_tivi_hong: Chuối hay khoai đều chiên được, quan trọng là hát cùng nhau! *(nhìn bảng, gật gù)* Ai viết câu này hay vậy?
    ~ bk_cam(5)
* [✍️ Ghi vào sổ, không làm gì. Đây là cảnh hay nhất tháng.]
    ~ bk_cam(15)
    ~ bk_trang(3)
    ~ bk_lo(3)
- -> END

// ------------------------------------------------------------
=== bien_kich_1610_sau_show ===
# ngay:16 # gio:22:00 # noi:dai_tivi_hong
_Hậu trường sau gameshow. Đèn đã tắt một nửa. {sieu_nhan_hong} ngồi trên thùng đạo cụ, ăn bánh chuối chiên qua khe mũ._
{ bk_bi_trao_cau_hoi:
    sieu_nhan_hong: Em ơi… cái câu chó ghét… là em viết hả?
- else:
    sieu_nhan_hong: Câu hỏi hôm nay vui ghê! Em viết hả? Cảm ơn em nha!
}
* {bk_bi_trao_cau_hoi} [😇 "Không phải em. Có người tráo. Em xin lỗi anh."]
    ~ qh("sieu_nhan_hong", 5)
    sieu_nhan_hong: Hông sao! Mà công nhận câu đó hài. {cho} mà coi chắc nó gật đầu.
* {bk_bi_trao_cau_hoi} [🎭 "Đó là… câu hỏi mở rộng, để khán giả thấy anh dễ thương."]
    ~ qh("sieu_nhan_hong", -5)
    sieu_nhan_hong: *(im một lúc)* Ờ… dễ thương. Ờ.
    ~ cang_thang(5)
* [💬 "Anh ơi… hồi trước, có lần nào anh đẩy xe máy giùm ai giữa trời mưa, đi xa lắm hông?"]
    sieu_nhan_hong: Mưa hả? Nhiều lắm! Có lần đẩy tới cây xăng luôn, xa ơi là xa. Mà anh hông nhớ mặt ai hết.
    sieu_nhan_hong: Đội mũ thì đâu thấy đường mấy. Thấy bánh xe là đẩy.
    ~ bk_thay_nguyen_day_xe = true
    ~ bk_that(5)
    ~ bk_cam(10)
* {not bk_bi_trao_cau_hoi} [🍌 "Anh ăn bánh chuối chiên qua khe mũ hoài vậy hông mỏi hả?"]
    sieu_nhan_hong: Mỏi! Mà tháo mũ ra thì… *(nhỏ giọng)* thì anh hông biết nói chuyện nữa.
    ~ qh("sieu_nhan_hong", 5)
    ~ bk_that(3)
- -> END
