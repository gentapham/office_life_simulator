// ============================================================
// DESIGNER · CHƯƠNG 3: "VẼ TRONG BÓNG TỐI" (15/10 – 16/10)
// ============================================================

// ------------------------------------------------------------
=== designer_1510_mat_dien ===
# ngay:15 # gio:08:10 # noi:ban_thiet_ke # bat_buoc
_8 giờ 5 phút. Phụt. Cả tòa nhà tối om. Từ thang máy vọng ra tiếng {giam_doc} và tiếng {chi_dai}, kẹt chung một buồng._
giam_doc: *(vọng ra)* {chi_dai} ơi, em bình tĩnh nhé, anh không ép em bình tĩnh đâu, tùy em…
chi_dai: *(vọng ra)* Anh im giùm em là em bình tĩnh liền!
_Laptop công ty của bạn tắt phụt, mất luôn 40 phút chưa lưu. Laptop thứ hai trong balo vẫn còn 20% pin._
{ ds_nhan_hong_ngoai:
    _Và trên đó, file Hồng Ngoại đang mở. Logo hồng xoắn trong lá chuối, sáng rực giữa văn phòng tối thui._
- else:
    _Trên đó là banner quán nướng của LL, màu xanh lá chuối, sáng rực giữa văn phòng tối thui._
}
_Cả công ty kéo ra pantry vì chỗ đó có cửa sổ. {hong_hot} ngồi sát bên bạn, mắt đảo như radar._
hong_hot: Ê bà, máy bà còn pin hả? Cho tui ké xem Tóp-tóp xíu đi! # hen_gio:5
* [😶 Gập máy lại. An toàn là trên hết.]
    designer: Hết pin rồi bà ơi, vừa sập luôn.
    hong_hot: Xui ghê! Thôi kể chuyện đi, mất điện là phải kể chuyện!
    ~ cang_thang(3)
* [🥬 Tranh thủ làm cho xong, xoay màn hình vào tường.]
    ~ nghi(-10)
    { RANDOM(1, 10) <= 5:
        hong_hot: Ủa sao màn hình bà xanh lè vậy? Logo gì lạ hoắc…
        ~ ds_lo(20)
        designer: File mẫu trên mạng thôi bà. Mẫu… rau má.
        hong_hot: *(nheo mắt)* Ờ… rau má.
    - else:
        _{hong_hot} mải hóng tiếng cãi nhau trong thang máy, không liếc qua. Bạn làm thêm được 15 phút._
        ~ ds_cam(-3)
    }
* [🤝 Mở Tóp-tóp cho {hong_hot} xem, giữ file kia ở tab ẩn.]
    ~ qh("hong_hot", 5)
    hong_hot: Bà là nhất! Coi clip chó nè, giống {cho} ghê!
    _Pin tụt từ 20% xuống 6% trong 10 phút. Ít nhất là không ai thấy màu xanh lá chuối._
* [⏱️ (Không chọn kịp)]
    _Bạn còn đang đơ thì laptop tự sập nguồn, đúng 0%. Lần đầu tiên bạn biết ơn cục pin chai._
- { ds_do_lo >= 100:
    -> designer_tudo_lat_tay
}
_{thuc_tap_sinh} xuất hiện với 5 cục sạc dự phòng trong tay, phân phát như ông già Noel._
thuc_tap_sinh: Dạ mọi người xài đi ạ! Em… em có dư ạ!
~ nhan(nuoc_suoi)
-> END

// ------------------------------------------------------------
=== designer_1510_trang_47 ===
# ngay:15 # gio:10:30 # noi:pantry # bat_buoc
_Pantry tối. Mọi người tản ra mỗi góc. Bạn ngồi bệt sau tủ lạnh, nơi mát nhất, và nghe tiếng thì thầm ngay phía bên kia._
ke_toan: {chi_dai}. Trang 47. Nếu không đủ 1 triệu người theo dõi, công ty hoàn lại 10 tỷ.
chi_dai: Mười… tỷ? Ổng ký mà không đọc hả?
ke_toan: Chị nói rồi. Ngay trước lúc ký. Ổng bảo đối tác đang chờ.
~ phat_hien(trang_47)
_Bạn ngồi im. Lần đầu tiên bạn hiểu: nếu chiến dịch thất bại, công ty sập. Không còn {cong_ty}. Không còn bàn thiết kế tầng 1._
_Và nơi duy nhất còn thuê designer trong quận này… là tòa nhà kính xanh lá chuối bên kia đường._
* [🧡 "Vậy thì phải làm cho nó thành công." Lặng lẽ đứng dậy, đi tìm giấy bút.]
    ~ ds_cam(15)
    ~ cang_thang(5)
    _Bạn không biết ai đã ký gì. Bạn chỉ biết mình còn tay, còn bút chì._
* [🥬 "LL thì vẫn còn đó." Bạn mở danh bạ, nhìn cái tên Anh Lá Chuối rất lâu.]
    ~ ds_cam(-10)
    _Một lối thoát luôn làm người ta yên tâm. Và cũng làm người ta bớt cố._
* [🤝 Nhắn {sales}: "Em biết vụ 10 tỷ chưa?"]
    sales: *(trả lời liền)* Em cũng đang ngồi pantry. Ngay bên kia tủ lạnh nè chị.
    _Hai đứa nhìn nhau qua khe tủ lạnh. Trong bóng tối, mặt {sales} lần đầu tiên không có chữ "chắc kèo"._
    ~ qh("sales", 8)
    ~ ds_cam(8)
- -> END

// ------------------------------------------------------------
=== designer_1510_hop_thap_nen ===
# ngay:15 # gio:13:30 # noi:phong_hop_sang_tao
_Phòng họp "Sáng Tạo". {truong_phong} thắp 6 cây nến thơm mùi vani. Cả phòng như đang làm lễ._
truong_phong: Mất điện không có nghĩa là mất họp. Mai gameshow rồi. Phông nền đâu {designer}?
designer: Dạ, phông nền nằm trong cái máy… đang không có điện ạ.
truong_phong: Thế thì em làm cách khác. Anh không cần biết cách nào. Anh cần kết quả.
* [🖍️ "Dạ em vẽ tay."]
    truong_phong: Vẽ… tay? Như thời tiền sử à?
    designer: Dạ, thời tiền sử người ta cũng vẽ lên tường, mà tới giờ vẫn chưa ai bắt sửa.
    ~ ds_toi(5)
    ~ qh("chua_te_deadline", 3)
* [💬 "Anh cho em mượn cục sạc của {thuc_tap_sinh} với laptop thứ hai…"]
    _Câu đó vừa ra khỏi miệng bạn đã thấy sai. Laptop thứ hai. Cái máy không bao giờ được nhắc tên._
    truong_phong: Laptop thứ hai? Em có hai máy à?
    designer: Dạ… máy cũ… của em… để xem phim.
    ~ ds_lo(5)
* [🔥 Thổi tắt một cây nến. "Dạ, phòng mình cháy hết ý tưởng rồi anh."]
    _Cả phòng nín thở. {chua_te_deadline} bật cười. {truong_phong} nhìn bạn rất lâu._
    truong_phong: …Câu này anh ghi lại để làm slogan họp tuần sau.
    ~ qh("truong_phong", -3)
    ~ cang_thang(-5)
- -> END

// ------------------------------------------------------------
=== designer_1510_ve_tay ===
# ngay:15 # gio:16:00 # noi:san_thuong # bat_buoc
_Sân thượng. Nắng chiều xiên xiên. Bạn ngồi trên ghế nhựa, kẹp 8 tờ giấy A4 lên tấm bìa carton, bút chì kẹp tai._
_Bạn vẽ. Không có Ctrl+Z. Không có layer. Mỗi nét là một quyết định không sửa được._
* [🖍️ Vẽ một sân khấu, ánh đèn xòe như cánh hoa, ở giữa là bóng người đội mũ.]
    ~ ds_toi(15)
    ~ ds_co_ban_ve_tay = true
* [🖍️ Vẽ cả công ty đứng dưới khán đài, mỗi người một nét, không ai rõ mặt.]
    ~ ds_toi(12)
    ~ ds_cam(5)
    ~ ds_co_ban_ve_tay = true
* [😮‍💨 Vẽ đại cho xong, mai tính.]
    ~ ds_toi(-3)
    ~ ds_sua(2)
- ~ nghi(-15)
_Tiếng ngáp phía sau. {editor} vừa ngủ dậy, tóc dựng như tổ chim, đứng nhìn bản vẽ của bạn._
{ ds_co_ban_ve_tay:
    editor: *(ngáp)* …Đẹp. Render khỏi cần luôn.
    _Câu dài nhất năm của {editor}. Bạn cảm thấy mình vừa thắng một giải thưởng không ai biết._
    ~ qh("editor", 10)
    ~ cang_thang(-15)
- else:
    editor: *(ngáp)* …Ờ. Mai có điện thì vẽ lại hen.
    ~ cang_thang(5)
}
-> END

// ------------------------------------------------------------
=== designer_1510_cong_vien_trong_bong_toi ===
# ngay:15 # gio:19:10 # noi:pantry
_19 giờ. Vẫn mất điện. Pantry chỉ còn ánh đèn pin điện thoại. Rồi từ góc tối, có tiếng hát rất khẽ._
idol_het_thoi: *(hát)* Ngày xưa có đôi bạn thân… bán cá viên chiên… tại công viên…
_Không kính đen. Không "em biết anh là ai không". Chỉ là giọng hát thật, run run. Ở góc kia, {editor} giơ điện thoại quay lại, không bật đèn._
_Ở cửa sổ cuối hành lang, bạn thấy hai cái bóng: một cái bóng đội mũ đang tháo mũ ra, và {chua_te_deadline} đứng cạnh._
* [😶 Quay mặt đi. Có những thứ không phải để mình nhìn.]
    ~ qh("sieu_nhan_hong", 5)
    _Bạn tắt đèn pin. Trong bóng tối, chỉ còn tiếng "Công Viên" và tiếng mưa bắt đầu rơi._
* [🎨 Ghi nhớ khung cảnh. Không chụp, chỉ nhớ.]
    ~ ds_toi(5)
    _Ánh đèn xanh lờ mờ, giọng hát cũ, hai cái bóng bên cửa sổ. Sau này bạn sẽ vẽ lại nó, cho riêng mình._
* [📸 Giơ điện thoại lên chụp hai cái bóng.]
    _Đèn flash tự bật. Lóe sáng. {chua_te_deadline} lập tức trùm áo khoác lên đầu người bên cạnh._
    chua_te_deadline: Ai chụp đó?! Tắt đi!
    ~ qh("chua_te_deadline", -10)
    ~ qh("sieu_nhan_hong", -10)
    ~ cang_thang(10)
    _Tấm ảnh chỉ thấy một cái áo khoác. Bạn xóa nó ngay, nhưng cảm giác tội lỗi thì không xóa được._
- -> END

// ------------------------------------------------------------
=== designer_1610_dai_tivi_hong ===
# ngay:16 # gio:07:30 # noi:dai_tivi_hong # bat_buoc
_Đài Tivi Hóng, trường quay gameshow "Hồng Hay Không Hồng". Có điện, có máy lạnh, có máy in khổ lớn. Bạn suýt khóc vì hạnh phúc._
{ ds_co_ban_ve_tay:
    _Bạn scan bản vẽ tay, in khổ lớn làm phông nền. Nét chì to gấp 40 lần, sần sùi, ấm áp, không giống bất kỳ phông gameshow nào._
    mc_tivi_hong: Xin chào quý vị… ơ, phông này ai vẽ vậy? Đẹp mà lạ ghê!
    ~ follow(15000)
    ~ ds_toi(5)
    ~ uy_tin = uy_tin + 5
- else:
    _Bạn có 2 tiếng để dựng lại phông nền trên máy của đài. Bạn làm được một bản tạm, hồng, sạch, không có hồn._
    ~ follow(3000)
    ~ nghi(-15)
}
truong_phong: Phông được đấy. Nhưng em cho cái logo công ty to lên tí nhé. Tivi mà.
* [🔁 "Dạ em sửa liền." Gửi lại bản cũ, đổi tên file.]
    { RANDOM(1, 10) <= 7:
        truong_phong: Đấy! Thấy chưa, to lên là khác hẳn!
        ~ ds_ban_1_thanh_cong = ds_ban_1_thanh_cong + 1
        ~ ds_sua(1)
    - else:
        truong_phong: Em ơi, nó vẫn bằng y như cũ mà?
        ~ uy_tin = uy_tin - 10
    }
* [🎨 "Anh ơi, logo to thì che mặt Siêu Nhân Hồng. Tivi mà, mặt mới là chính."]
    truong_phong: Mặt… mặt có thấy đâu, đội mũ mà.
    designer: Dạ thì càng phải chừa chỗ cho cái mũ.
    truong_phong: *(nghĩ 5 giây)* Logic đấy. Thôi giữ nguyên.
    ~ ds_toi(5)
- -> END

// ------------------------------------------------------------
=== designer_1610_len_song ===
# ngay:16 # gio:15:00 # noi:dai_tivi_hong # bat_buoc
_15 giờ. Lên sóng trực tiếp. Màn hình lớn sau lưng MC chiếu slide giới thiệu Siêu Nhân Hồng._
{ ds_bat_duoc_ke_doi_file:
    -> suon_se
- else:
    -> bi_doi
}

= bi_doi
_Slide bật lên. Tên khách mời: "SIÊU NHÂN HỒN". Font Comic. Màu tím than. Lần thứ hai._
mc_tivi_hong: …Xin giới thiệu, Siêu Nhân… Hồn? À, Hồng! Hồng ạ!
_Khán giả trường quay cười ồ. Bạn đứng ở bàn điều khiển, có đúng 5 giây trước khi camera lia lại màn hình._ # hen_gio:5
* [🔍 Lao vào máy, thay file đúng trong 4 giây.]
    { RANDOM(1, 10) <= 6:
        _Kịp. Slide đổi lại "SIÊU NHÂN HỒNG" đúng lúc camera quay lại. MC nhìn bạn, gật đầu cảm ơn._
        ~ follow(5000)
        ~ uy_tin = uy_tin + 5
    - else:
        _Chuột kẹt. Slide nhảy sang tấm kế tiếp: ảnh {cho} đang ngoạm găng tay hồng. Khán giả cười lăn._
        ~ follow(10000)
        ~ scandal()
    }
* [🤝 Ra hiệu cho {it} cắt màn hình.]
    it: *(giật dây HDMI, mặt không cảm xúc)* Lỗi thiết bị.
    _Màn hình đen. MC lấp liếm bằng một tràng cười truyền hình chuyên nghiệp._
    ~ qh("it", 5)
* [⏱️ (Không chọn kịp)]
    _"Siêu Nhân Hồn" lên sóng trọn 8 giây. Tối đó, nó thành meme._
    ~ follow(-20000)
    ~ scandal()
    ~ cang_thang(15)
- -> phan_hat

= suon_se
_Slide hiện ra đúng tên, đúng màu, đúng font. Nhờ khóa thư mục hôm 9/10, không ai động được vào file nữa._
_Bạn thở ra. Lần đầu tiên trong tháng, không có gì bị đổi._
~ follow(5000)
-> phan_hat

= phan_hat
_Tới phần "Hit Một Thời". {sieu_nhan_hong} cầm micro, hát "Công Viên"._
sieu_nhan_hong: *(hát)* Ngày xưa có đôi bạn thân… bán… khoai chiên… tại công viên…
_Sai lời. Cả trường quay ồ lên. Rồi từ cánh gà, một giọng hát bè vang lên, đúng lời, đúng nốt. Là {idol_het_thoi}._
_Bạn đứng ở hậu trường, ngay cạnh {quan_ly_idol}. Mắt {quan_ly_idol} đỏ hoe._
* [🤝 Đưa {quan_ly_idol} chai nước.]
    quan_ly_idol: *(nhận, không nhìn bạn)* Cảm ơn em. Bụi… bụi trường quay.
    ~ qh("quan_ly_idol", 8)
* [📱 Chụp một tấm hai người hát chung làm thumbnail.]
    ~ follow(8000)
    ~ ds_toi(3)
    _Thumbnail: hai cái micro, một hồng một đen, ánh đèn rọi chéo. Tên: "Hai Thế Hệ, Một Công Viên"._
- -> END

// ------------------------------------------------------------
=== designer_1610_buffet ===
# ngay:16 # gio:18:30 # noi:pantry
_Ngày Lương thực Thế giới. Công ty liên hoan buffet: gà rán, bánh mì, chè, và trà sữa thứ 6. Lương tuần cũng về._
_{sales} đang lặng lẽ gói gà rán vào hộp nhựa, bỏ vào túi xách "hàng hiệu"._
sales: *(thì thầm)* Tủ lạnh căn 1203 trống ba ngày rồi chị. Em gói ít thôi. Ít… 6 cái đùi.
* [🤝 Đứng chắn tầm nhìn của {ke_toan} cho {sales} gói tiếp.]
    ~ qh("sales", 8)
    ke_toan: *(vẫn thấy)* …Gói thêm hộp chè đi em. Để đó cũng đổ.
    _{ke_toan} quay đi. Bạn không chắc mình vừa thấy {ke_toan} cười._
    ~ qh("ke_toan", 3)
* [🍗 Gói luôn phần mình. Căn 203 cũng đâu có dư.]
    ~ nhan(com_tam)
    ~ an(20)
    sales: Chị {designer}, mình là đồng phạm rồi đó.
    ~ qh("sales", 5)
* [😇 Ăn tại chỗ, kể {sales} nghe vụ phông vẽ tay.]
    ~ an(40)
    sales: Tin chị đi, mai mốt chị nổi tiếng nhờ cây bút chì đó.
    { ds_co_ban_ve_tay:
        sales: Mà thật. Phông chị vẽ đẹp nhất gameshow luôn. Không phải em nói phét đâu.
        ~ ds_toi(3)
    }
- ~ nhan(tra_sua)
~ uong(20)
-> END
