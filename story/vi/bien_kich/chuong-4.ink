// ============================================================
// BIÊN KỊCH: OÁNH · CHƯƠNG 4: "CUỐN SỔ TRÊN XE BUÝT" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== bien_kich_1710_xe_buyt_so ===
# ngay:17 # gio:10:40 # noi:vung_tau_bai_xe # bat_buoc
~ nhan(so_tay_oanh)
_Vũng Tàu. Gió biển mặn chát. Đoàn {cong_ty} lục tục xuống xe, {chi_dai} cầm loa hô điểm danh như chỉ huy hành quân._
_Bạn sờ vào túi vải. Bút máy có. Kính râm có. Cuốn sổ bìa da… không có._
_Quay lại: tài xế đang kéo cửa xe. Động cơ đã nổ._
_Trong cuốn sổ có tiểu thuyết với tên thật của cả công ty. Và một trang ghi "Ý tưởng của {thuc_tap_sinh} (2/10)", nếu bạn từng viết nó._ # hen_gio:5
* [🏃 Chạy lại đập cửa xe: "Khoan chú ơi!"]
    { RANDOM(1, 10) <= 7:
        _Bạn leo lên xe, cúi xuống gầm ghế số 14. Cuốn sổ nằm đó, úp mặt xuống, như đang ngủ. Không ai thấy._
        ~ bk_nguoi_nhat_so = ""
        ~ cang_thang(5)
    - else:
        _Ghế số 14. {hong_hot} đang ngồi đó, cầm cuốn sổ, mắt sáng rỡ như vừa trúng số._
        hong_hot: Ủa sổ của bà hả? Tui mới đọc trang đầu à. Trang đầu thôi. Thề.
        _Trang đầu là cảnh ký hợp đồng. Với tên thật của tất cả mọi người._
        ~ bk_nguoi_nhat_so = "hong_hot"
        ~ bk_lo(15)
        ~ qh("hong_hot", 3)
    }
* [😌 Giả vờ bình tĩnh. Tối quay lại bãi xe tìm.]
    ~ mat(so_tay_oanh)
    ~ bk_lo(30)
    ~ temp ai = RANDOM(1, 3)
    { ai:
    - 1: ~ bk_nguoi_nhat_so = "thuc_tap_sinh"
    - 2: ~ bk_nguoi_nhat_so = "hong_hot"
    - else: ~ bk_nguoi_nhat_so = "ran_doc"
    }
    _Bạn đi theo đoàn, cười nói như không có gì. Bên trong thì đang viết sẵn cáo phó cho sự nghiệp văn chương._
    ~ cang_thang(15)
* [⏱️ (Không chọn kịp)]
    ~ mat(so_tay_oanh)
    ~ bk_lo(40)
    ~ bk_nguoi_nhat_so = "ran_doc"
    _Xe chạy mất. Cuốn sổ đi theo xe về tới bến. Bạn đứng giữa bãi xe, gió biển thổi bay cả cảm hứng._
    ~ bk_cam(-10)
    ~ cang_thang(20)
- { bk_nguoi_nhat_so == "hong_hot" || bk_nguoi_nhat_so == "ran_doc":
    { bk_ghi_chu_y_tuong_duy:
        ~ bk_ai_biet_chuyen = true
    }
}
-> END

// ------------------------------------------------------------
=== bien_kich_1710_tro_choi ===
# ngay:17 # gio:15:00 # noi:vung_tau_bai_bien # bat_buoc
_Trò chơi tập thể trên bãi biển. Kịch bản trò chơi do bạn viết: "Truy Tìm Kho Báu Hồng", có lời dẫn như phim phiêu lưu._
chi_dai: Đội Cam bên này, đội Hồng bên kia! Đứa nào ngồi nghỉ là chị bế ra biển thả!
designer: *(đọc tờ hướng dẫn)* "Hỡi những chiến binh của biển cả, hãy tìm chiếc vỏ sò đã khóc…" Bà ơi, cái này là trò chơi hay là thơ?
_Ở xa, {dan_dau_tu} đứng phắt dậy khỏi ghế bố, giơ điện thoại lên trời._
dan_dau_tu: Hồng Coin X10! Lên thật rồi! Tối nay anh bao cả đoàn hải sản!
{ bk_hong_coin:
    _Bạn mở ví điện tử. 500 nghìn tiền nợ, giờ thành 5 triệu. Trên màn hình. Chưa phải trong túi._
}
* {bk_hong_coin} [💸 Bán hết Hồng Coin ngay lập tức.]
    ~ tien_cong(5000000)
    ~ bk_hong_coin = false
    dan_dau_tu: Bán?! Em bán ở đây là bán đáy đó! Mai nó x100!
    _Bạn không trả lời. Nhà văn đọc đủ truyện để biết chương sau của mấy câu chuyện kiểu này._
* [💡 Trả lời {designer}: "Thơ thì sao? Trò chơi mà không có chút buồn thì chơi làm chi."]
    ~ bk_that(3)
    designer: Chơi để vui chứ chơi để buồn hả bà? Nhạt như nước ốc.
    ~ qh("designer", -5)
    ~ bk_cam(5)
* [🤝 Cầm loa đọc lời dẫn bằng giọng phim hành động cho cả đoàn cười.]
    ~ qh("chi_dai", 5)
    ~ qh("designer", 5)
    ~ cang_thang(-10)
    designer: Ờ… đọc kiểu này thì được. Vẫn nhạt, mà nhạt có muối.
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 2
- _Tối đó cả đoàn ăn hải sản. {dan_dau_tu} gọi thêm tôm hùm. Bạn để ý anh ấy không xem giá._
~ an(70)
-> END

// ------------------------------------------------------------
=== bien_kich_1710_lua_trai ===
# ngay:17 # gio:21:30 # noi:vung_tau_bai_bien # bat_buoc
_Lửa trại. Trò "nói thật". Chai nước suối quay giữa vòng tròn, dừng lại trước ai thì người đó phải nói một điều thật._
_Lượt trước, {sieu_nhan_hong} kể hồi nhỏ từng nhốt một đứa nhỏ trong nhà kho, rồi quên mất. Cả vòng im lặng. Ở bên kia đống lửa, {ran_doc} siết chặt lon nước._
_{idol_het_thoi} say, ngủ gục trên vai {quan_ly_idol}. {editor} lặng lẽ mang chăn ra đắp cho cả hai, rồi về phòng trước._
_Chai nước quay. Quay. Dừng trước mặt bạn._
hong_hot: Tới bà! Nói thật đi! Hôm nay biển chứng giám!
_{thuc_tap_sinh} ngồi đối diện bạn, ánh lửa nhảy trên mặt anh ấy._
* {not bk_ghi_cong_duy} [🙇 "Phim ngắn của tui… ý tưởng là của anh {thuc_tap_sinh}. Tui lấy. Tui xin lỗi."]
    ~ bk_ghi_cong("thuc_tap_sinh")
    ~ bk_ghi_cong_duy = true
    ~ bk_ke_that_lua_trai = true
    ~ bk_ai_biet_chuyen = true
    _Lửa nổ lách tách. Không ai nói gì trong năm giây. Rồi {chi_dai} vỗ vai bạn một cái, mạnh tới mức bạn ho._
    chi_dai: Được. Nói ra được là được.
    thuc_tap_sinh: *(lau mắt bằng tay áo)* Dạ… khói lửa trại cay quá ạ.
    ~ qh("chi_dai", 10)
* [📖 "Tui đang viết một cuốn tiểu thuyết về công ty mình. Ai cho phép tui để tên thật thì giơ tay."]
    ~ bk_lo(10)
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 4
    hong_hot: TUI! Tui giơ hai tay! Viết tui đẹp nha!
    dan_dau_tu: Anh nữa. Viết anh giàu.
    chi_dai: Viết chị thì viết cho đúng. Sai một chữ chị tìm tới nhà.
    thuc_tap_sinh: Dạ… dạ em cũng được ạ.
    _Bốn cánh tay. Bạn ghi vào sổ, kèm chữ ký nguệch ngoạc trên giấy ăn lửa trại._
* [🎭 "Sự thật là… biển hôm nay không xanh. Nó chỉ phản chiếu bầu trời thôi."]
    hong_hot: Ủa?! Gian lận! Vậy là né!
    ~ qh("hong_hot", -5)
    ~ bk_cam(5)
    ~ cang_thang(5)
- _Lửa tàn dần. Bạn nhìn {thuc_tap_sinh} đang gom ly nhựa giùm mọi người. Ba mươi tuổi, thực tập sinh, vẫn là người dọn sau cùng._
-> END

// ------------------------------------------------------------
=== bien_kich_1710_ai_nhat_so ===
# ngay:17 # gio:23:30 # noi:vung_tau_khach_san
{ bk_nguoi_nhat_so == "":
    _Khách sạn. Bạn ngồi ngoài ban công, cuốn sổ trên đùi, nghe sóng. Hôm nay suýt mất nó. Bạn ôm nó chặt hơn bình thường._
    ~ bk_cam(5)
    -> END
}
{ bk_nguoi_nhat_so == "thuc_tap_sinh":
    _Có tiếng gõ cửa phòng. {thuc_tap_sinh} đứng đó, hai tay đưa cuốn sổ bìa da như đưa giấy khen._
    thuc_tap_sinh: Dạ chị ơi, em lượm được dưới ghế xe. Em không mở ra đâu ạ. Em thề. Sổ của người ta là chuyện riêng.
    ~ nhan(so_tay_oanh)
    ~ bk_lo(-20)
    ~ qh("thuc_tap_sinh", 5)
    _Anh ấy không mở. Trong đó có trang ghi tên anh ấy. Và anh ấy không mở._
}
{ bk_nguoi_nhat_so == "hong_hot":
    _Tin nhắn Zalo-lô, 23:31, {hong_hot}: "Sổ của bà tui giữ nè. Tui đọc hết rồi. Hay dữ. Chưa kể ai… chưa."_
    _Chữ "chưa" thứ hai được viết riêng một dòng._
}
{ bk_nguoi_nhat_so == "ran_doc":
    _Không có tin nhắn nào. Không có tiếng gõ cửa. Cuốn sổ đang ở đâu đó trên đời, trong tay ai đó._
}
* {bk_nguoi_nhat_so == "thuc_tap_sinh"} [😇 "Anh ơi… trong đó có trang về anh. Mai chị kể anh nghe."]
    thuc_tap_sinh: Dạ? Dạ… dạ em chờ chị ạ.
    ~ bk_that(3)
* {bk_nguoi_nhat_so == "thuc_tap_sinh"} [😶 "Cảm ơn anh." Đóng cửa, ôm sổ, thở ra.]
    ~ cang_thang(-10)
* {bk_nguoi_nhat_so == "hong_hot"} [🤝 Nhắn lại: "Bà giữ giùm tui. Đổi lại, bà muốn tui viết bà thành nhân vật chính hông?"]
    ~ qh("hong_hot", 10)
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 1
    _"MUỐN!!! Mai trả sổ. Mà nhân vật chính phải xinh nha."_
* {bk_nguoi_nhat_so == "hong_hot"} [🐍 Nhắn lại: "Bà kể ai là tui kể vụ trang Confession."]
    { biet(admin_confession):
        _Ba chấm hiện lên. Biến mất. Hiện lên. Biến mất. Rồi: "Ok. Hòa. Mai trả sổ."_
        ~ qh("hong_hot", -10)
    - else:
        _"Confession gì? Bà nói gì tui hông hiểu. 😇" Bạn không có bằng chứng. {hong_hot} biết bạn không có._
        ~ qh("hong_hot", -15)
        ~ bk_lo(10)
    }
* {bk_nguoi_nhat_so == "ran_doc"} [😶 Nằm nhìn trần nhà tới sáng.]
    ~ nghi(-20)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== bien_kich_1810_sang_bien ===
# ngay:18 # gio:08:00 # noi:vung_tau_bai_bien # bat_buoc
_Sáng ngày 2. Mặt trời lên, đoàn {cong_ty} thì chưa ai lên nổi. Điện thoại cả đoàn rung liên tục._
dan_dau_tu: *(ngồi trên cát, mặt trắng bệch)* Hồng Coin… về 0. Người tạo coin ôm tiền biến mất rồi. Còn cái nịt.
{ bk_hong_coin:
    _500 nghìn tiền nợ. Thành 5 triệu. Rồi thành 0. Một hành trình cảm xúc trọn vẹn trong 9 ngày._
    ~ cang_thang(10)
}
_{designer} đi ngang, tay cầm ly cà phê, nói không cần ai hỏi:_
designer: Kịch bản trò chơi hôm qua á, nhạt như nước ốc. Nói thật. Biển chứng giám.
* [🎭 "Nước ốc mà bà còn húp hết hai tô tối qua."]
    designer: Tại đói! Đói thì nước ốc cũng ngon!
    ~ qh("designer", -10)
    ~ bk_cam(10)
    _Hai người quay lưng đi hai hướng. Về tới thành phố vẫn chưa nhìn mặt nhau._
* [😇 "Ờ, nhạt thiệt. Lần sau bà nêm giùm tui."]
    designer: *(khựng lại)* Bà… bà nhận là nhạt hả? Bà bị gì vậy? Say nắng hả?
    ~ qh("designer", 10)
    ~ bk_that(3)
* [🤝 Đưa {dan_dau_tu} ổ bánh mì: "Ăn đi anh. Đáy thật rồi đó."]
    dan_dau_tu: *(cầm bánh mì, nhìn rất lâu)* Em nói đáy… là an ủi hay chọc anh?
    ~ qh("dan_dau_tu", 10)
    ~ tien_cong(-25000)
- -> END

// ------------------------------------------------------------
=== bien_kich_1810_xe_ve ===
# ngay:18 # gio:16:30 # noi:xe_buyt_doan
_Xe buýt về thành phố. Không ai nói chuyện. {con_ong_chau_cha} nhìn điện thoại, mặt thất thần: căn penthouse của anh ấy đang được rao bán trên mạng._
con_ong_chau_cha: Ủa… "Penthouse Sky Ảo, view hồ, chủ cần bán gấp"… Nhà tui mà?
{ bk_nguoi_nhat_so == "ran_doc":
    _Điện thoại bạn rung. {ran_doc} nhắn: "Bà làm rơi cái này nè. Tui chưa đọc đâu." Kèm ảnh cuốn sổ bìa da, chụp ở góc rất nghệ thuật._
    _"Chưa đọc đâu." Không có chữ "thề"._
    ~ nhan(so_tay_oanh)
}
{ bk_nguoi_nhat_so == "hong_hot":
    _{hong_hot} chuyền cuốn sổ qua ba hàng ghế về tay bạn. Mỗi hàng ghế, có người liếc vào._
    ~ nhan(so_tay_oanh)
    ~ bk_lo(5)
}
* [🖋️ Ngồi đổi tên nhân vật ngay trên xe, trang nào cũng gạch.]
    ~ bk_lo(-20)
    ~ bk_cam(-10)
    ~ bk_chu_ky_dong_y = bk_chu_ky_dong_y + 2
    _"{giam_doc}" thành "Giám đốc Thịnh". "{thuc_tap_sinh}" thành "Dũng". Đổi tên là mất hồn. Nhưng hồn mất còn hơn người mất._
* [💬 Quay sang {con_ong_chau_cha}: "Ông có muốn kể hông? Tui nghe thôi, hông ghi."]
    ~ qh("con_ong_chau_cha", 10)
    ~ bk_that(5)
    con_ong_chau_cha: *(cười buồn)* Chill… mà hông chill nổi. Lần đầu tui thấy mình giống người thường.
    _Bạn giữ lời, không ghi. Nhưng câu "giống người thường" thì bạn nhớ._
* [✍️ Ghi: "Chương 6: Chuyến xe về, ai cũng giận ai."]
    ~ bk_trang(5)
    ~ bk_lo(5)
    ~ bk_cam(10)
- -> END

// ------------------------------------------------------------
=== bien_kich_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_sang_tao # bat_buoc
_Họp giao ban. Không ai nhìn mặt ai. {designer} ngồi xa bạn nhất có thể, tức là cách ba cái ghế và một chậu cây._
giam_doc: *(ghé vào phòng họp)* {bien_kich}, mai sinh nhật công ty 16 tuổi. Em viết cho anh bài phát biểu nhé. Có chút hoài niệm, chút tương lai. Anh không ép.
truong_phong: Và kịch bản phim ngắn, hạn 25/10. Còn 6 ngày.
_Tối nay bạn chỉ còn sức cho một việc._
* [🎬 Tối nay viết phim. Bài phát biểu để sáng mai tính.]
    ~ bk_phim(20)
    ~ bk_that(5)
    ~ nghi(-15)
* [🎤 Tối nay viết bài phát biểu cho kỹ. Sếp vui thì đời dễ thở.]
    ~ qh("giam_doc", 5)
    ~ bk_cam(-5)
* [⌨️ Tối nay về gác mái gõ tiểu thuyết. Chuyện Vũng Tàu còn nóng.]
    ~ bk_trang(10)
    ~ bk_cam(10)
    ~ bk_lo(5)
- _Cuối bàn, {thuc_tap_sinh} giơ tay rụt rè._
thuc_tap_sinh: Dạ… em có cần làm gì cho phim hông ạ?
* [🤝 "Có. Tối nay anh qua gác mái, chị đọc phim cho anh nghe."]
    ~ qh("thuc_tap_sinh", 10)
    ~ bk_phim(10)
    ~ bk_that(5)
    thuc_tap_sinh: Dạ! Em mang mì gói theo ạ!
* [😶 "Chưa đâu anh. Khi nào cần chị kêu."]
    thuc_tap_sinh: Dạ. Em chờ ạ.
- -> END

// ------------------------------------------------------------
=== bien_kich_2010_bai_phat_bieu ===
# ngay:20 # gio:09:00 # noi:sanh_tang_tret # bat_buoc
_Sinh nhật {cong_ty} 16 tuổi, kiêm Ngày Phụ nữ Việt Nam. Sảnh treo bong bóng cam và hồng, đụng nhau chan chát._
_Sáng nay, ở chòi bảo vệ, bác {bac_bao_ve} nhận một lá thư tay ký "G". Bác cất vào túi áo, chưa mở._
_Bạn cầm bản nháp bài phát biểu. Có một câu bạn viết lúc 2 giờ sáng, chưa biết nên giữ hay bỏ:_
_"Và hôm nay, chúng ta cảm ơn người sáng lập ở phương xa, người đã tin rằng thứ quý nhất trong căn phòng 20 mét vuông là con người."_
* [💡 Giữ câu đó. Đó là câu bác {bac_bao_ve} kể cho mình ngày 1/10.]
    ~ bk_that(5)
    ~ qh("bac_bao_ve", 10)
    _{giam_doc} đọc tới câu đó. Đọc chậm lại, như vấp phải một bậc thềm cũ._
    _Ở cuối sảnh, bác {bac_bao_ve} cúi đầu. Tay đặt lên túi áo, chỗ lá thư._
    ~ bk_cam(10)
* [🎤 Bỏ câu đó. Thêm năm từ khóa sếp thích cho chắc ăn.]
    _"Gia đình, mindset, hồi khởi nghiệp, văn hóa, cùng nhau." Đủ năm từ, đúng năm từ._
    ~ qh("giam_doc", 5)
* [📎 Lấy lại đoạn "cây tre gãy mà vẫn cười" từ bài của {thanh_ninh}.]
    ~ bk_muon(5)
    thanh_ninh: *(nghe tới đoạn cây tre, quay ngoắt lại nhìn bạn)* …
    _Hai người nhìn nhau. Hòa. Cây tre đã gãy hai lần trong một tuần._
    ~ qh("thanh_ninh", -5)
- -> bien_kich_mg_phat_bieu

// ------------------------------------------------------------
=== bien_kich_2010_qua_20_10 ===
# ngay:20 # gio:15:00 # noi:pantry # bat_buoc
_Phát quà 20/10. {giam_doc} mua quà cho bảy chị em bằng tiền túi. Bảy hộp giống hệt nhau. Bảy cái khăn choàng màu cam._
_{truong_phong} tặng bạn và {designer} mỗi người một cuốn sổ kẻ ô, bìa ghi "Kế hoạch tuần"._
designer: *(nhìn cuốn sổ, nhìn bạn)* Ổng tặng bà sổ để bà ghi biên bản họp hả?
_Lần đầu từ Vũng Tàu, hai người suýt cười chung._
{ co(hoa_hong):
    _Trong túi bạn còn bó hoa nhận hồi sáng. Hoa của người được tặng, giờ có thể thành hoa của người tặng._
}
* {co(hoa_hong)} [💐 Tặng bó hoa cho bác {bac_bao_ve}. "Hôm nay cũng là sinh nhật của người gác cửa."]
    ~ mat(hoa_hong)
    ~ qh("bac_bao_ve", 15)
    bac_bao_ve: Bác… đàn ông mà cháu tặng hoa à? *(cầm bó hoa, cầm rất cẩn thận)* Ừ. Bác cắm ở chòi.
    _Chiều đó, chòi bảo vệ có hoa. {cho} ngửi bó hoa, hắt xì ba cái, rồi nằm canh nó tới tối._
* {co(hoa_hong)} [💐 Tặng {designer}. "Không phải xin lỗi. Tặng thôi."]
    ~ mat(hoa_hong)
    ~ qh("designer", 15)
    designer: Bà… bà ốm hả? *(nhận hoa)* Ờ. Cảm ơn. Không có nghĩa là hết giận đâu nha.
    { qh_designer >= 50:
        ~ bk_quynh_hoa_binh = true
    }
* [😇 Cảm ơn {truong_phong}: "Sổ kẻ ô đẹp lắm anh. Em sẽ viết thứ không phải biên bản."]
    ~ qh("truong_phong", 10)
    truong_phong: Thế à? Thế tốt. Mà… viết biên bản trước nhé.
* [✍️ Ghi lại cảnh bảy cái khăn choàng màu cam.]
    ~ bk_trang(3)
    ~ bk_cam(10)
    ~ bk_lo(5)
    _"Bảy người phụ nữ. Bảy cái khăn. Một màu. Sếp nói: anh không phân biệt ai cả. Đúng thật."_
- -> END

// ------------------------------------------------------------
=== bien_kich_2010_karaoke ===
# ngay:20 # gio:22:15 # noi:karaoke_hat_cho_nhau_nghe
_Karaoke Hát Cho Nhau Nghe, tăng hai sau quán ốc. {giam_doc} cầm micro, mặt đỏ như đèn phòng hát._
giam_doc: Các em! Anh tuyên bố! Nếu Đại Nhạc Hội thành công, cả công ty tăng lương… hai mươi phần trăm!
_Cả phòng gào lên. {hong_hot} quay clip. {ke_toan} đứng dậy, ngồi xuống, rồi đứng dậy lần nữa._
ke_toan: Anh ơi… lời nói không phải là hóa đơn đâu anh.
* [📝 Viết ngay lên tờ giấy ăn: "Biên bản: Sếp hứa tăng lương 20%." Đưa sếp ký.]
    giam_doc: *(ký luôn, nét chữ xiêu vẹo)* Ký! Anh không ép! Anh tự nguyện!
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    ~ qh("ke_toan", 5)
    ~ qh("chi_dai", 5)
    ~ qh("giam_doc", -3)
    ke_toan: *(cất tờ giấy ăn vào bìa nhựa)* Có chữ ký rồi. Tạm tính là chứng từ.
* [🎤 Giật micro hát "Công Viên" cho không khí khỏi căng.]
    ~ cang_thang(-15)
    idol_het_thoi: *(bật dậy)* Bài của anh! Để anh hát bè!
    ~ qh("idol_het_thoi", 5)
* [✍️ Ngồi góc phòng ghi lại hết. {dan_dau_tu} 8 đây rồi.]
    ~ bk_trang(5)
    ~ bk_lo(5)
    ~ bk_cam(15)
    hong_hot: *(nghiêng qua)* Bà ghi gì đó? Ghi tui hát hay hông?
    ~ bk_lo(3)
- ~ uong(20)
-> END
