// ============================================================
// CHƯƠNG 4: "LỬA TRẠI XÓM CÂY ME" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== sieu_nhan_hong_1710_xe_vung_tau ===
# ngay:17 # gio:06:30 # noi:xe_buyt # bat_buoc
_Team building Vũng Tàu. Bạn không phải nhân viên, nhưng {giam_doc} nói "để gắn kết tập thể". Bạn đã mặc đồ từ 5 giờ sáng._
dan_dau_tu: Ngày Quốc tế Xóa nghèo! Hồng Coin x10! Trưa nay em bao cả team ăn hải sản!
_Cả xe vỗ tay. Coin mang tên bạn vừa nuôi cả công ty một bữa. Bạn không biết nên vui hay sợ._
_Ghế trống duy nhất còn lại: cạnh {chua_te_deadline} (đang ngủ, miệng hơi há), hoặc cạnh {ran_doc} (đang nhìn ra cửa sổ)._
* [🙂 Ngồi cạnh {chua_te_deadline}.]
    _Giữa đường, cậu ta ngủ gục lên vai bạn. Bạn ngồi im 2 tiếng, vai tê rần, không dám thở mạnh._
    ~ snh_tim(5)
    chua_te_deadline: *(tỉnh dậy, lau miệng)* Ủa… tới chưa anh? Vai anh êm ghê. Em ngủ ngon nhất tuần.
* [🦸 Ngồi cạnh {ran_doc}: "Gét gô! Đi biển nè em!"]
    ran_doc: *(không quay lại)* Dạ.
    _Hai tiếng. Cậu ta không nói thêm chữ nào. Bạn kể chuyện, cậu ta nhìn biển. Có lúc bạn thấy cậu ta nhìn tay bạn. Chỗ vết sẹo._
    ~ snh_hieu(3)
* [🎤 Đứng giữa xe cầm micro: "Mình hát Công Viên nha cả nhà!"]
    idol_het_thoi: *(ngồi dậy)* Bài của anh. Đưa micro đây.
    _Cả xe hát. {idol_het_thoi} hát đúng lời, bạn hát sai lời. Không ai sửa ai._
    ~ qh("idol_het_thoi", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1710_chia_phong ===
# ngay:17 # gio:14:00 # noi:khach_san_vung_tau # bat_buoc
hr: Phòng 205: {ran_doc} và anh {sieu_nhan_hong}. Để gắn kết tập thể ạ.
_{ran_doc} đứng sững 2 giây, rồi cười. Một nụ cười rất đúng mực._
* [🦸 "Gét gô! Bạn cùng phòng ơi! Tối nay mình kể chuyện ma nha!"]
    ran_doc: Dạ anh. Mà anh đừng nhốt em trong tủ nha. Em sợ ma lắm.
    _Câu đùa. Chỉ là câu đùa. Sao ngực bạn thắt lại?_
    ~ snh_no(5)
* [🙂 "Em có ngại hông? Anh ngủ ngáy đó."]
    ran_doc: *(nhìn bạn lâu hơn bình thường)* Em ngủ giường gần cửa sổ.
    ~ snh_hieu(-3)
* [💬 "Em… em ở đâu hồi nhỏ vậy?"]
    ran_doc: *(im lặng 3 giây)* Ở một cái xóm. Giải tỏa rồi anh.
    ~ snh_no(3)
- _Trưa đó, {dan_dau_tu} bao hải sản thật. Tôm hùm, ghẹ, ốc. Bạn ăn mà không biết mùi vị._
~ an(60)
-> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1710_lua_trai ===
# ngay:17 # gio:21:00 # noi:bai_bien_vung_tau # bat_buoc
_Đêm lửa trại. Trò "nói thật". Tới lượt bạn. Bạn tháo mũ. Ngọn lửa làm mặt ai cũng đỏ. Đối diện là {ran_doc}._
~ snh_thao_mu(false)
chi_dai: Nói đi em. Chuyện gì mà nhìn mặt em như sắp khóc vậy?
* [🙂 "Hồi nhỏ… anh từng nhốt một thằng nhóc trong nhà kho. Tới giờ không biết nó ở đâu để xin lỗi."]
    ~ snh_no(-10)
    ~ snh_hieu(-15)
    _Cả bãi biển im lặng. {ran_doc} nhìn đống lửa rất lâu. Không nói gì._
    ~ phat_hien(hieu_ech)
* [🦸 Đội mũ lại: "Thôi, nói thật là… anh sợ gián!"]
    _Cả đám cười ồ. {hong_hot} hét "Siêu nhân sợ gián!". Không ai biết gì._
    ~ snh_no(5)
    ~ snh_mat(-10)
    ~ snh_meme(5000)
* {snh_nghe_ten_quen && snh_dang_anh_cay_me && snh_no_xom_cu >= 50} [🔒 Nhìn thẳng qua đống lửa: "{ran_doc}. Cái nhà kho có lỗ thông gió hình con cá. Là em, đúng hông?"]
    -> sieu_nhan_hong_1710_hieu_ech
- -> END

= sieu_nhan_hong_1710_hieu_ech
~ snh_mo_nhanh_hieu_ech = true
~ phat_hien(hieu_ech)
_Cả bãi biển im lặng. Chỉ có tiếng sóng và tiếng củi nổ._
{ snh_han_cua_hieu >= 80:
    ran_doc: *(đứng bật dậy)* Giờ anh mới nhớ hả? Hai mươi năm. Anh bắt tay em, anh chụp hình với em, anh hông nhớ.
    ran_doc: Em đứng trong cái kho đó tới tối mịt. Em đếm con cá trên lỗ thông gió cho đỡ sợ.
    _{ran_doc} bỏ đi về phía biển. {chi_dai} nắm tay bạn lại khi bạn định đứng dậy._
    chi_dai: Để nó đi. Có những chuyện không đuổi theo được.
    ~ snh_no(10)
- else:
    -> sieu_nhan_hong_1710_hieu_ech_khoc
}
-> END

= sieu_nhan_hong_1710_hieu_ech_khoc
ran_doc: *(rất lâu)* …Ừ. Là em.
_Bạn bật khóc. Đại ca xóm Cây Me khóc trước mặt cả công ty, mũi đỏ, tay run._
hong_hot: *(thì thầm)* Ối dồi ôi… cái gì đang xảy ra vậy?
chi_dai: Im. Để tụi nó nói.
* [🙂 "Anh xin lỗi. Anh sợ quá nên không dám quay lại mở cửa."]
    ~ snh_no(-15)
    ~ snh_hieu(-20)
    ran_doc: Em không cần anh khóc. Em cần anh nhớ.
    ran_doc: …Mà thôi. Anh nhớ rồi đó.
* [😶 Không nói được gì. Chỉ cúi đầu.]
    ~ snh_no(-5)
    ~ snh_hieu(-10)
    _Hai người ngồi đối diện nhau qua đống lửa tới khi lửa tàn. Không ai nói gì. Không ai bỏ đi._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1710_livestream_bat_ngo ===
# ngay:17 # gio:21:40 # noi:bai_bien_vung_tau # bat_buoc
_Bạn vẫn chưa đội mũ lại. Rồi bạn thấy một chấm đèn đỏ. {hong_hot} đang livestream đêm lửa trại. Máy quay đang lia về phía bạn._
hong_hot: *(nói vào điện thoại)* Cả nhà ơi, lửa trại công ty em nè! Đây là… # hen_gio:3
* [🦸 Úp mũ lên mặt, chạy vào bóng tối.]
    _Máy quay chỉ bắt được một vệt hồng chạy vụt qua. Bình luận: "Ma hồng!", "Siêu nhân chạy kìa"._
    ~ snh_meme(15000)
* [🙂 Lấy tay che mặt, quay lưng lại.]
    _Máy quay bắt được cái gáy và vết sẹo trên mu bàn tay. Người xem phóng to vết sẹo._
    ~ snh_mat(15)
    ~ follow(10000)
* [🙂 Nhìn thẳng vào máy. Thôi kệ.]
    ~ snh_mat(40)
    ~ follow(50000)
    hong_hot: *(giật mình, lật úp điện thoại xuống cát)* Thôi! Thôi! Cả nhà ơi mạng lag!
    _3 giây. Có 2.000 người đang xem. Ảnh chụp màn hình mờ mờ bắt đầu lan. {hong_hot} nhìn bạn, mặt tái mét: "Em xin lỗi anh…"_
    ~ qh("hong_hot", 10)
* [⏱️ (Không chọn kịp)]
    _{chi_dai} đứng dậy, chắn ngay trước ống kính. "Quay gì quay hoài. Tắt." {hong_hot} tắt._
    ~ qh("chi_dai", 10)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1710_dem_phong_205 ===
# ngay:17 # gio:23:40 # noi:khach_san_vung_tau
_Phòng 205. Ngoài hành lang, {giam_doc} say, hét "Anh tăng lương cho cả công ty!". {sales} hét theo: "Chị mời ca sĩ nổi tiếng nhất nước về hát Đêm Hồng!"_
_{ran_doc} nằm giường bên cửa sổ, quay mặt vào tường._
{ snh_mo_nhanh_hieu_ech:
    * [🙂 "{ran_doc}… em có muốn anh đổi phòng hông?"]
        ran_doc: *(không quay lại)* Không cần. Anh nằm đó đi.
        ran_doc: …Mà đừng tắt đèn ngủ. Em không thích tối.
        _Bạn để đèn ngủ sáng cả đêm. Không ai ngủ được. Không ai nói ra._
        ~ snh_hieu(-10)
        ~ snh_no(-5)
        -> END
    * [😶 Nằm im, nghe tiếng sóng.]
        _Giữa đêm, bạn nghe thấy tiếng cậu ta thở rất đều. Ngủ rồi. Bạn thì không._
        -> END
- else:
    * [🙂 "Em ngủ chưa? Mặc bộ này ngủ nóng ghê."]
        ran_doc: Sao anh không tháo ra mà ngủ?
        sieu_nhan_hong: Tháo ra thì… anh chỉ là anh thôi. Mà anh thì hông có gì hay.
        ran_doc: *(im lặng rất lâu)* …Ừ.
        ~ snh_hieu(-5)
        -> END
    * [🦸 Tháo mũ, ngủ luôn, kệ cậu ta thấy.]
        ~ snh_thao_mu(false)
        _Bạn ngủ ngon nhất tháng. Sáng ra, thấy {ran_doc} đã dậy từ lâu, ngồi ở mép giường nhìn bạn, tay cầm điện thoại._
        _Cậu ta không chụp. Hoặc đã chụp rồi xóa. Bạn không biết._
        ~ snh_hieu(-3)
        -> END
}

// ------------------------------------------------------------
=== sieu_nhan_hong_1810_coin_sap ===
# ngay:18 # gio:08:00 # noi:khach_san_vung_tau # bat_buoc
_Sáng. Hồng Coin sập. Người tạo coin ôm tiền biến mất. HONG về 0._
dan_dau_tu: *(ngồi bậc thềm, nhìn biển)* Còn cái nịt. Mà… đáy rồi. Đáy thật rồi.
_Trên mạng, người ta bắt đầu tag bạn. "Siêu Nhân Hồng lừa đảo coin?", "Trả tiền đây!"._
_Ở bàn ăn sáng, {con_ong_chau_cha} nhìn điện thoại, mặt trắng bệch: penthouse của cậu ta bị rao bán._
* [🦸 Livestream ngay trên bãi biển: "Hồng không tạo coin! Hồng không bao giờ bán coin!"]
    ~ follow(-10000)
    ~ snh_meme(20000)
    _Người xem tin một nửa. Nửa kia chụp màn hình làm meme "siêu nhân chối tội trên bãi biển"._
* [💸 Âm thầm đền tiền cho những fan bị mất nhiều nhất bằng Két Vé Số.]
    ~ snh_ket(20)
    ~ follow(20000)
    dan_dau_tu: Anh ơi… có người chuyển trả em đúng số em mất. Ghi "từ một người hâm mộ". Là anh hả?
    _Bạn lắc đầu. {dan_dau_tu} nhìn bạn, không tin. Người được giúp bắt đầu tò mò._
    ~ qh("dan_dau_tu", 15)
* [🙂 Ngồi xuống bậc thềm cạnh {dan_dau_tu}, đưa ly cà phê.]
    dan_dau_tu: Anh không giận em hả? Coin mang tên anh mà em… em còn hùa theo.
    _Bạn lắc đầu. Hai người nhìn biển. Sóng không tăng không giảm. Sóng chỉ là sóng._
    ~ qh("dan_dau_tu", 10)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1810_xe_ve ===
# ngay:18 # gio:16:00 # noi:xe_buyt
_Xe về thành phố. Ai cũng giận ai. {dan_dau_tu} giận coin. {con_ong_chau_cha} giận chú. Cả xe giận {giam_doc} vì sáng nay ổng nói "anh không nhớ đã hứa tăng lương"._
_Bạn ngồi giữa xe, ôm một bịch kẹo hồng._
* [🦸 Đi từng ghế phát kẹo: "Ăn kẹo hồng nè! Giận nhau thì kẹo hết ngọt!"]
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    _Người cầm, người không. {chi_dai} cầm hai cây. Tới ghế {ran_doc}…_
    { snh_mo_nhanh_hieu_ech:
        _Bạn dừng lại. Không tạo dáng. Đưa một cây, rồi rụt tay, rồi lại đưa. Cậu ta cầm lấy. Kẹo dâu. Vị y chang tiệm tạp hóa xóm Cây Me._
        ~ snh_hieu(-5)
    - else:
        _Cậu ta cầm kẹo, nói "cảm ơn anh". Rồi bỏ vào túi, không ăn._
    }
* [🙂 Ngồi cạnh {giam_doc}: "Anh ơi, anh nói một câu xin lỗi đi anh. Mọi người chỉ cần vậy thôi."]
    giam_doc: *(thở dài)* Em nói đúng. Anh… anh không giỏi mấy cái này.
    giam_doc: *(cầm micro xe)* Các em… hôm qua anh say. Anh xin lỗi. Anh không hứa được 20%. Nhưng anh sẽ cố.
    _Cả xe im lặng. Rồi {chi_dai} vỗ tay. Rồi vài người vỗ theo._
    ~ qh("giam_doc", 10)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 8
* [😶 Đeo tai nghe, nhìn ra cửa sổ.]
    _Bạn làm hòa cho tất cả mọi người, mọi ngày. Hôm nay, bạn muốn ai đó làm hòa cho mình._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_1910_chuan_bi ===
# ngay:19 # gio:16:00 # noi:tang_1
_Họp giao ban sáng nay không ai nhìn mặt ai. Mai là 20/10: sinh nhật công ty kiêm Ngày Phụ nữ Việt Nam._
_Bạn đứng ở tiệm hoa đầu phố. Trong công ty có 7 chị em. Và một người không phải chị em, nhưng bạn muốn tặng._
* [🌹 Mua 7 bó hoa hồng cho 7 chị em, và một hộp cơm hồng cho {chua_te_deadline}.]
    ~ snh_cat_xe(-500000)
    ~ nhan(hoa_hong)
    _Hộp cơm hồng: cơm, trứng cuộn hình trái tim, một tờ giấy nhỏ: "Vì hôm nay sinh nhật công ty." Không ký tên._
* [💸 Đặt 100 bó hoa, cắm kín sảnh công ty.]
    ~ snh_ket(10)
    ~ nhan(hoa_hong)
    ~ follow(5000)
    _Sáng mai sảnh công ty sẽ thành vườn hồng. Ai cũng sẽ hỏi: "Tiền đâu?"_
* [😶 Mua một bông. Để dành.]
    ~ nhan(hoa_hong)
    _Một bông. Chưa biết cho ai. Biết rồi, nhưng chưa dám._
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2010_thu_g ===
# ngay:20 # gio:16:00 # noi:sanh_tang_tret # bat_buoc
_Tiệc sinh nhật {cong_ty} 16 tuổi. {giam_doc} vừa chọn logo kỷ niệm: bản gốc năm 2010, lần sửa thứ 38. {designer} cười như người mất hết hy vọng._
dan_dau_tu: 8386! Chúc cả công ty phát tài phát lộc!
_Bạn đi tặng hoa cho từng chị em. {chi_dai} nhận, gật đầu. {ke_toan} hỏi "hóa đơn đâu". {thanh_ninh} chụp ảnh với hoa 12 kiểu._
{ biet(thu_g):
    _Bác {bac_bao_ve} đứng lên, đeo kính, đọc lá thư ký tên "G" bằng giọng Bắc chậm rãi._
}
{ not biet(thu_g):
    _Bác {bac_bao_ve} đứng ở góc, tay cầm một lá thư. Bác nhìn mọi người rất lâu, rồi lặng lẽ… đứng lên._
    ~ phat_hien(thu_g)
}
bac_bao_ve: "…Mười sáu năm rồi. Tôi không hỏi doanh thu. Tôi chỉ muốn hỏi một câu: mấy đứa nhỏ còn thương nhau không."
_Cả sảnh im lặng. {giam_doc} cúi đầu. Bạn tháo găng, lau mắt dưới mũ._
~ snh_no(-10)
~ tinh_than_cong_ty = tinh_than_cong_ty + 10
* {co(hoa_hong)} [🎁 Lén để hộp cơm hồng lên bàn {chua_te_deadline} khi không ai để ý.]
    ~ snh_tim(8)
    _Chiều, cậu ta mở hộp cơm, nhìn tờ giấy, nhìn quanh. Rồi ăn hết. Kể cả miếng trứng hình trái tim._
* {co(hoa_hong)} [📸 Đưa hoa cho {chua_te_deadline} ngay giữa tiệc, có {hong_hot} quay.]
    ~ snh_qua_truoc_camera = true
    ~ follow(10000)
    chua_te_deadline: *(nhận hoa, cười)* Ủa, em đâu phải chị em? Mà chiêu này hay. {hong_hot} ơi quay góc này nè.
    ~ snh_tim(-3)
* [🙂 Ngồi cạnh bác {bac_bao_ve}: "Bác ơi, người viết thư… chắc thương mọi người lắm bác ha."]
    bac_bao_ve: *(gấp lá thư)* Ừ. Thương thì mới hỏi.
    ~ qh("bac_bao_ve", 10)
- -> END

// ------------------------------------------------------------
=== sieu_nhan_hong_2010_karaoke ===
# ngay:20 # gio:22:00 # noi:karaoke
_Karaoke Hát Cho Nhau Nghe, sau quán ốc. {giam_doc} say, đứng trên sofa: "Tháng sau tăng lương 20%! Anh hứa!"_
_{ke_toan} ngồi góc phòng, mặt trắng bệch. {hong_hot} đang quay._
* [🦸 Giật micro: "Đến giờ của Siêu Nhân Hồng!" *(hát "Công Viên" sai lời)*]
    _Cả phòng cười. {giam_doc} quên mất mình đang hứa gì. {ke_toan} nhìn bạn, gật đầu rất khẽ._
    ~ qh("ke_toan", 10)
    ~ snh_meme(8000)
* [🙂 Ngồi cạnh {ke_toan}: "Chị đừng lo. Có anh."]
    ke_toan: Anh lo được 20% lương của 21 người cả năm hả? *(cười mệt)* Thôi. Cảm ơn anh.
    ~ qh("ke_toan", 5)
* [🎤 Chọn bài song ca, đưa micro cho {chua_te_deadline}.]
    chua_te_deadline: Em hát dở lắm anh. *(nhưng vẫn cầm micro)*
    _Hai người hát lệch tông cả bài. Lúc hết nhạc, cậu ta nói nhỏ: "Vui ghê." Không ai quay._
    ~ snh_tim(6)
- -> END
