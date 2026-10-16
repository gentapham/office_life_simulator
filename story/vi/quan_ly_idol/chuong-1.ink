// ============================================================
// QUẢN LÝ IDOL · CHƯƠNG 1: "HAI ĐIỆN THOẠI, HAI NGHỆ SĨ" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== quan_ly_idol_0110_ba_dien_thoai ===
# ngay:1 # gio:07:15 # noi:studio_0905 # bat_buoc
~ thai_ly_ca_phe = 0
_Studio 0905, chung cư Sky Ảo. Năm cục sạc dự phòng xếp hàng trên kệ như lính gác. Ba cái điện thoại: máy trái, máy phải, và máy thứ ba để ở nhà._
_Hôm nay ký hợp đồng 5 tỷ. Từ hôm nay máy phải sẽ có chủ: Siêu Nhân Hồng._
_Máy thứ ba rung. "{thanh_xin_nghi}"._
thanh_xin_nghi: *(giọng yếu ớt)* Anh {quan_ly_idol}… hôm nay Quốc tế Người cao tuổi… bà ngoại em cũng là người cao tuổi… em xin phép…
* [📞 "{thanh_xin_nghi}. Hôm nay ký 5 tỷ. Em vắng là anh chết. 8 giờ có mặt."]
    thanh_xin_nghi: *(thở dài, giọng khỏe hẳn)* Dạ… em tới.
    ~ qh("thanh_xin_nghi", -3)
    ~ uy_tin = uy_tin + 3
* [🤝 "Ừ. Mà 10 giờ có mặt, anh chỉ cần em cầm cuốn lịch."]
    thanh_xin_nghi: Dạ! Anh {quan_ly_idol} là nhất! 10 giờ em có mặt!
    _10 giờ 40 {thanh_xin_nghi} có mặt. Vẫn tính là có mặt._
    ~ qh("thanh_xin_nghi", 8)
* [☕ Im lặng, uống một ngụm cà phê, để {thanh_xin_nghi} tự nghe tiếng mình thở.]
    thanh_xin_nghi: …Anh {quan_ly_idol}? Thôi em tới. Em tới liền.
    ~ qh("thanh_xin_nghi", 2)
- ~ thai_ca_phe()
_Bạn nhét máy trái vào túi trái, máy phải vào túi phải. Ngăn kéo tủ đầu giường đóng kín, như mọi ngày. Bạn kiểm tra lại một lần nữa rồi mới ra cửa._
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0110_ky_hop_dong ===
# ngay:1 # gio:09:05 # noi:phong_hop_tang_2 # bat_buoc
_Phòng họp tầng 2. {giam_doc} ký trang cuối. 5 tỷ về tài khoản. Cả phòng vỗ tay. {ke_toan} cúi đầu nhìn trang 47 như nhìn một quả bom hẹn giờ._
giam_doc: {quan_ly_idol}. *(đặt tay lên vai bạn)* Cậu lo cho {sieu_nhan_hong} nhé.
_Đúng câu đó. Năm 2015, cũng bàn tay đó, cũng câu đó, chỉ khác cái tên: "{quan_ly_idol}, cậu lo cho thằng bé này nhé."_
sieu_nhan_hong: *(tạo dáng)* Dạ em nhờ anh {quan_ly_idol} nha! Hồng không phải màu, Hồng là thái độ!
_Máy trái rung. Tin nhắn của {idol_het_thoi}: "Em tới rồi." Cùng lúc, cửa phòng họp bật mở._
idol_het_thoi: *(đeo kính đen, thở hồng hộc)* Em biết anh là ai không?
sieu_nhan_hong: Dạ… anh là ai ạ?
_Cả phòng nín thở. Nhà đầu tư ngừng nhai bánh. Bạn có đúng một nhịp thở._ # hen_gio:5
* [📞 Bước tới khoác vai {idol_het_thoi}: "Giới thiệu với {sieu_nhan_hong}, đây là anh {idol_het_thoi}, đàn anh của em, ca sĩ hát 'Công Viên' đó!"]
    sieu_nhan_hong: Trời ơi bài đó em thuộc! "Ngày xưa có đôi bạn thân…"
    _{idol_het_thoi} hạ kính xuống một chút. Chỉ một chút. Nhưng bạn thấy._
    ~ qh("idol_het_thoi", 10)
    ~ qh("sieu_nhan_hong", 10)
    ~ thai_gk(-3)
* [🛡️ Kéo {idol_het_thoi} ra ngoài hành lang.]
    _Êm. Cửa đóng lại sau lưng. Ngoài hành lang, {idol_het_thoi} giằng tay ra._
    idol_het_thoi: Anh cũng theo phe nó rồi hả?
    _Câu đó đau hơn bạn tưởng._
    ~ qh("idol_het_thoi", -10)
    ~ thai_gk(5)
* [📱 Giả vờ nghe điện thoại.]
    giam_doc: *(thở dài)* {idol_het_thoi}. Ngồi xuống đi em.
    _{giam_doc} phải tự xử. Lúc đi ngang, anh liếc bạn một cái._
    ~ uy_tin = uy_tin - 5
    ~ qh("giam_doc", -3)
* [⏱️ (Không chọn kịp)]
    _{idol_het_thoi} kể chuyện năm 2015 trong 12 phút. Nhà đầu tư ngủ gật. {sieu_nhan_hong} nghe chăm chú như học bài. Bạn đứng ở góc, nhìn {idol_het_thoi} kể. Nhìn hơi lâu._
    ~ thai_kh(1)
    ~ thai_gk(-5)
- giam_doc: Thôi! Trà sữa chiều nay anh bao!
~ thai_p(-10)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0110_phong_cho ===
# ngay:1 # gio:11:40 # noi:phong_cho
_Phòng chờ cuối hành lang tầng 2. Từ hôm nay biển ghi "PHÒNG CHỜ SIÊU NHÂN HỒNG". Mười một năm trước đây là phòng chờ của {idol_het_thoi}. Bạn là người đã treo tấm ảnh {idol_het_thoi} cầm cúp lên cái đinh kia._
_Điều khoản số 4: phòng chờ phải có bánh chuối chiên. Cái đĩa trên bàn trống trơn._
{ RANDOM(1, 2) == 1:
    _Ngoài hành lang, {idol_het_thoi} đi ngang, bưng nguyên đĩa bánh, không nhìn ai._
- else:
    _Trong phòng, {sieu_nhan_hong} ngồi ôm cái đĩa trống, mặt hối lỗi. "Em ăn hết rồi anh ơi… em đói…"_
}
* [🏃 Chạy ra xe đẩy đầu đường mua bịch mới.]
    _Hai tay hai điện thoại, nách kẹp bịch chuối chiên, bạn chạy lên ba tầng thang bộ. Ly cà phê thứ hai đổ một nửa lên áo._
    ~ tien_cong(-40000)
    ~ thai_p(-10)
    ~ qh("sieu_nhan_hong", 5)
    ~ nhan(chuoi_chien)
* [📞 Gọi xe đẩy giao tận nơi, nhờ Bác {bac_bao_ve} nhận giùm.]
    bac_bao_ve: *(qua điện thoại)* Ừ, bác nhận cho. Mà chuối chiên mà cũng giao tận nơi à? Thời buổi gì thế.
    ~ tien_cong(-55000)
    ~ qh("bac_bao_ve", 3)
* [🥖 Đặt ổ bánh mì của mình vào đĩa: "Tạm vậy nha {sieu_nhan_hong}."]
    sieu_nhan_hong: Dạ… bánh mì cũng được anh! Bánh mì là thái độ!
    _Bạn nhịn trưa. Lần thứ ba trong tuần._
    ~ an(-15)
    ~ qh("sieu_nhan_hong", 8)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_0110_tra_sua ===
# ngay:1 # gio:15:10 # noi:tang_1
_Trà sữa ăn mừng. Hôm nay còn là Ngày Cà phê Quốc tế, và máy pha cà phê tầng 1 hỏng. Bạn nhìn nó như nhìn người yêu cũ. Cả công ty mừng Bác {bac_bao_ve} Ngày Người cao tuổi, bác đỏ mặt._
_Ở góc tầng 1, {editor} ngủ gục trên bàn, mặt áp vào bàn phím. Vừa thức trắng dựng quảng cáo tiệm ốc. Không ai phần ly trà sữa cho {editor}._
* [🥤 Để một ly lên bàn {editor}, kèm tờ giấy: "Ly của em nè. Lát dựng anh cái teaser nha."]
    _Bạn viết vội, nét chữ xiêu vẹo vì tay còn cầm điện thoại. Rồi đi._
    _Mười phút sau {editor} tỉnh dậy. Đọc tờ giấy. Gấp nó lại làm tư, bỏ vào túi áo. Bạn không thấy._
    ~ qh("editor", 10)
* [🥤 Đưa ly của mình cho Bác {bac_bao_ve}.]
    bac_bao_ve: Ơ, {quan_ly_idol} à. Cháu uống đi, cháu mệt hơn bác.
    _Bác vẫn nhận. Rồi bác lén đổ một nửa sang cốc trà đá, trả lại cho bạn._
    ~ qh("bac_bao_ve", 8)
* [☕ Lấy tua vít mở máy pha cà phê ra, tự sửa.]
    it: *(xuất hiện sau lưng)* Anh tắt đi bật lại thử chưa?
    _Bạn chưa. {it} tắt đi bật lại. Máy chạy. Bạn uống ly cà phê thứ ba._
    ~ qh("it", 5)
    ~ thai_ca_phe()
- { RANDOM(1, 3) == 1:
    _Ai đó đặt một ly đen đá ít đường lên bàn bạn. Không có giấy nhắn. Bạn tưởng là {idol_het_thoi}._
    ~ thai_p(10)
}
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0210_hop_chien_dich ===
# ngay:2 # gio:09:00 # noi:phong_hop_tang_2 # bat_buoc
~ thai_ly_ca_phe = 0
_Ngày Nụ cười Thế giới: {hr} bắt cả công ty cười khi chấm công. Bạn cười một bên miệng, vì miệng kia đang kẹp điện thoại._
_Họp chiến dịch "Hồng Hóa Việt Nam". {truong_phong} phát cho bạn bản lịch 30 ngày của Siêu Nhân Hồng. Bạn lật tới phụ lục hợp đồng._
_Điều khoản số 3: "Siêu Nhân Hồng được bỏ ngang buổi quay bất cứ lúc nào để đi giúp người, và công ty không được trừ tiền."_
~ thai_ca_phe()
~ thai_ca_phe()
~ thai_ca_phe()
~ thai_ca_phe()
_Bạn uống ly cà phê thứ tư. Lúc 9 giờ 20 sáng._
sales: Tin chị đi, BTT Global tài trợ 2 tỷ. Chủ tịch Mr. Kevin Trộn quý chị lắm.
truong_phong: Anh {quan_ly_idol}, lịch của {sieu_nhan_hong} với lịch của anh {idol_het_thoi} có đụng nhau không?
* [🗓️ "Có. 14 chỗ. Anh với {thanh_xin_nghi} xếp lại trong tuần."]
    truong_phong: Tốt quá. Mình take note.
    ~ uy_tin = uy_tin + 5
    ~ thai_p(-10)
* [📞 "Đụng thì ưu tiên {sieu_nhan_hong}. {idol_het_thoi} đi đám cưới, dời được."]
    _Bạn nói câu đó bằng giọng công việc. Nói xong thì thấy nghẹn, uống thêm ngụm cà phê._
    ~ uy_tin = uy_tin + 3
    ~ thai_gk(5)
    ~ qh("idol_het_thoi", -5)
* [🛡️ "Không đụng. Anh lo rồi."]
    _Có đụng. Mười bốn chỗ. Bạn lo. Một mình._
    ~ thai_p(-20)
    ~ thai_gk(3)
- { thai_ly_ca_phe > 3:
    _Tay bạn bắt đầu run nhẹ. Bạn kẹp điện thoại chặt hơn._
}
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0210_toi_phat_goi ===
# ngay:2 # gio:21:40 # noi:studio_0905
_Máy trái reo. {idol_het_thoi}._
idol_het_thoi: Anh. Cái biển "Phòng chờ Siêu Nhân Hồng". Anh có biết trước hông?
_Bạn biết. Bạn ký duyệt biển đó. Bằng tay phải. Tay trái thì cầm điện thoại nghe {idol_het_thoi} hát thử ở studio hôm đó._
* [😇 "Anh biết. Anh xin lỗi. Anh sẽ xin {giam_doc} một phòng khác cho em."]
    idol_het_thoi: *(im lặng)* …Thôi. Phòng nào cũng được. Anh đừng xin.
    ~ qh("idol_het_thoi", 5)
    ~ thai_gk(-3)
* [📞 "Chuyện hợp đồng. Không phải chuyện em."]
    idol_het_thoi: Ừ. Không phải chuyện em. Chuyện gì giờ cũng không phải chuyện em.
    _{idol_het_thoi} cúp máy trước. Lần đầu tiên trong năm._
    ~ qh("idol_het_thoi", -8)
    ~ thai_gk(5)
* [💬 "{idol_het_thoi}, mai đi ăn trứng vịt lộn đầu hẻm hông? Như hồi xưa."]
    idol_het_thoi: *(một lúc)* …Anh còn nhớ chỗ đó hả?
    _Bạn nhớ hết. Đó là vấn đề._
    ~ qh("idol_het_thoi", 10)
    ~ thai_gk(-5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_0310_dam_cuoi ===
# ngay:3 # gio:17:30 # noi:nha_hang_tiec_cuoi # bat_buoc
_Thứ 7. Nhà hàng Hạnh Phúc Trăm Năm. Đám cưới đầu tiên của tháng. {idol_het_thoi} đang thay đồ trong cánh gà. Bạn đứng ở góc sảnh với mẹ cô dâu._
me_co_dau: Ca sĩ một bài mà lấy 2 triệu hả con? Cô trả 1 triệu thôi. Hồi đó cô nghe bài đó ở đám cưới đứa cháu cô cũng 1 triệu.
_Máy phải reo. {sieu_nhan_hong}: "Anh {quan_ly_idol} ơi, em đang ở đường Ngập Nước, có ông chú bị chết máy, em đẩy giùm chút nha! Chiều mai quay em tới trễ xíu!"_
* [💰 Ép giá: "Cô ơi, 'Công Viên' là hit quốc dân năm 2015. Một triệu rưỡi, tặng thêm bài thứ hai."]
    me_co_dau: *(nhìn bạn rất lâu)* Thôi được. Mà hát đúng tên con gái cô nha.
    ~ tien_cong(150000)
    ~ uy_tin = uy_tin + 3
* [😇 "Dạ một triệu cũng được cô. Ảnh hát cho vui."]
    me_co_dau: Vậy mới phải chứ.
    _Bạn bù 500 nghìn cho {idol_het_thoi} từ tiền túi. {idol_het_thoi} không biết._
    ~ tien_cong(-500000)
    ~ thai_gk(-5)
* [📞 Nghe máy phải trước: "{sieu_nhan_hong}, đẩy xong nhớ chụp tấm hình nha. Đừng đi luôn."]
    sieu_nhan_hong: Dạ! Em chụp! *(tút tút)*
    me_co_dau: Ủa con nói chuyện với ai mà bỏ cô đứng đây?
    _Mẹ cô dâu trả 1 triệu, mặt khó chịu. Nhưng tấm hình {sieu_nhan_hong} đẩy xe trong mưa có 30.000 lượt thích._
    ~ follow(8000)
    ~ uy_tin = uy_tin - 2
- _Tối đó {idol_het_thoi} hát. Có người xin hát bài của Siêu Nhân Hồng. {idol_het_thoi} ứng biến, chèn "Hồng là thái độ" vào điệp khúc. Cả sảnh hét._
_Bạn đứng cuối sảnh, nhìn. Quên cả nghe máy._
~ thai_gk(-3)
~ an(30)
-> END

// ------------------------------------------------------------
=== quan_ly_idol_0410_gang_tay ===
# ngay:4 # gio:09:45 # noi:cong_cong_ty
_Chủ nhật, Ngày Động vật. {cho} được tắm, mặc áo, đội nơ, rất không vui. Bạn tới chỉ để đưa {sieu_nhan_hong} đi quay một clip ngắn "Siêu Nhân Hồng yêu động vật"._
_{sieu_nhan_hong} cúi xuống, giả tiếng sủa. {cho} lao tới, ngoạm mất chiếc găng tay hồng, chạy tọt vào gầm cầu thang._
sieu_nhan_hong: Ủa… găng tay em! Chiều nay quay rồi anh {quan_ly_idol} ơi!
_Clip "yêu động vật" giờ thành clip "bị động vật cướp đồ". Máy trái rung: {idol_het_thoi} hỏi chiều nay có show không. Máy phải rung: {hong_hot} hỏi có được đăng clip con chó không._
* [🐕 Bò vào gầm cầu thang đòi lại.]
    cho: GRỪ…
    _Gầm cầu thang tối om, đầy chìa khóa, son môi, điện thoại cũ. Một kho báu. Và một con chó đang bảo vệ nó bằng cả mạng sống._
    bac_bao_ve: *(từ chòi)* Thôi {quan_ly_idol} à. Nó lấy cái gì thì nó không trả đâu. Bác nuôi nó sáu năm rồi.
    ~ qh("cho", -5)
    ~ thai_p(-10)
* [📞 "{hong_hot}, đừng đăng! Chuyện này để anh lo, đừng ai đăng gì hết!"]
    hong_hot: Ủa nhưng clip dễ thương mà anh! Thôi được, em… để nháp.
    _Để nháp. Với {hong_hot}, "để nháp" nghĩa là đăng sau 3 tiếng._
    ~ thai_kh(1)
* [💬 Ngồi xuống cạnh {sieu_nhan_hong}: "{sieu_nhan_hong}, đừng chọc nó nữa nha. Nó ghét thiệt đó."]
    sieu_nhan_hong: *(gãi mũ)* Dạ… em chọc vui thôi mà. Mà dạ, em xin lỗi {cho}.
    _Rồi {sieu_nhan_hong} móc trong túi ra một con gà cao su. Bạn thở dài. Chuyện này còn dài._
    ~ qh("sieu_nhan_hong", 5)
- -> END

// ------------------------------------------------------------
=== quan_ly_idol_0410_tim_gang_tay ===
# ngay:4 # gio:14:00 # noi:cho_pho_cu
_Chợ Phố Cũ, buổi chiều. Bạn đi hết bảy sạp găng tay. Không ai bán găng tay hồng size L. Găng tay hồng toàn size trẻ em._
_Máy trái: {idol_het_thoi} hỏi lần hai về show. Máy phải: {sieu_nhan_hong} gửi hình vẽ một bàn tay, ghi "size em nè anh"._
* [🧤 Mua găng tay trắng, nhờ {designer} nhuộm hồng.]
    designer: *(qua điện thoại)* Anh nhờ em nhuộm găng tay hả? Em là designer mà anh… thôi gửi đây. Màu hồng nào? Có 47 loại hồng đó.
    _Tối đó {designer} gửi lại găng tay màu "Hồng Thái Độ", kèm bảng phối màu PDF._
    ~ thai_co_gang_tay_moi = true
    ~ thai_gang_quynh_nhuom = true
    ~ qh("designer", 5)
    ~ tien_cong(-60000)
* [🧤 Ghé nhà Bác {bac_bao_ve} ở Ven Đô hỏi "kho" của {cho}.]
    bac_bao_ve: Kho nó ở gầm cầu thang công ty cơ. Mà nó không trả đâu. Cháu đi tìm cái mới đi.
    bac_bao_ve: Ngồi uống chén trà đã. Chủ nhật mà cháu cũng chạy à.
    ~ qh("bac_bao_ve", 8)
    ~ nghi(10)
    ~ uong(10)
* [🧤 Mua găng tay hồng size trẻ em, cắt đầu ngón.]
    sieu_nhan_hong: *(đeo vào, đầu ngón lòi ra)* Anh {quan_ly_idol}… cái này… cũng thái độ ha anh!
    _Clip chiều đó: Siêu Nhân Hồng đeo găng tay hở ngón chơi với mèo. Không ai thấy lạ._
    ~ thai_co_gang_tay_moi = true
    ~ follow(3000)
- _Cả buổi chủ nhật. Bạn chưa trả lời {idol_het_thoi}. Lúc về tới nhà, {idol_het_thoi} nhắn: "Thôi khỏi show. Anh nghỉ đi."_
~ thai_p(-15)
-> END
