// ============================================================
// IDOL HẾT THỜI · CHƯƠNG 2: "FAN ẢO, NỢ THẬT" (5/10 – 12/10)
// ============================================================

// ------------------------------------------------------------
=== idol_het_thoi_0510_hoa_cua_duy ===
# ngay:5 # gio:11:05 # noi:studio
_Thứ 2, Ngày Nhà giáo Thế giới. Bạn tới lúc 11 giờ 5 phút, như mọi ngày. Họp giao ban đã xong từ lâu, chỉ còn tiếng {truong_phong} vọng ra: "…take note lại nhé."_
_Trên cái ghế trong studio có một bông hồng, gói giấy kiếng, kèm tấm thiệp: "Kính tặng thầy Phát. Em là học trò âm nhạc của thầy qua đám cưới anh họ. Duy."_
thuc_tap_sinh: *(ló đầu vào)* Dạ anh! Hôm nay Ngày Nhà giáo Thế giới ạ. Em tặng hết các thầy cô trong phòng. Anh dạy em cách cầm micro mà anh không biết đó ạ.
* [😇 "Cảm ơn Duy. Lại đây, anh dạy cầm micro thiệt cho."]
    _Bạn chỉ cho {thuc_tap_sinh}: micro cách miệng một nắm tay, tay kia để thả lỏng, đừng nhìn xuống đất. {thuc_tap_sinh} ghi vào sổ, gạch chân ba lần._
    thuc_tap_sinh: Dạ em cảm ơn thầy! À, anh!
    ~ qh("thuc_tap_sinh", 12)
    ~ phat_tt(-3)
* [🕶️ Ký tặng lên tấm thiệp rồi đưa lại.]
    thuc_tap_sinh: Dạ… dạ em cảm ơn ạ. *(cất tấm thiệp vào ví, kế cái thẻ ngân hàng màu bạc lấp lánh)*
    _Cái thẻ đó nhìn sang hơn mọi thứ trong nhà bạn._
    ~ qh("thuc_tap_sinh", 3)
    ~ phat_tt(3)
* [💬 "Ủa, ông 30 tuổi rồi mà, gọi anh làm chi?"]
    thuc_tap_sinh: Dạ, em thực tập mà anh. Phải đúng phép ạ.
    _Hai người 30 tuổi đứng trong studio, một người gọi người kia là thầy. Thế giới giải trí thật kỳ lạ._
    ~ qh("thuc_tap_sinh", 6)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_0510_ba_quan_ly ===
# ngay:5 # gio:21:10 # noi:sanh_sky_ao
_Sảnh chung cư Sky Ảo. Bạn vừa đi khai trương về, áo còn dính pháo giấy. Bà quản lý tòa nhà đang đứng chờ cạnh thang máy, tay cầm một xấp giấy._
ba_quan_ly_sky_ao: Cậu Phát. Căn 1808. Ba tháng rồi đó. 36 triệu. Tôi nói nhẹ nhàng lần này là lần cuối nha.
* [🕶️ "Cô biết con là ai hông? Năm 2015 tòa này treo băng rôn chào con đó."]
    ba_quan_ly_sky_ao: Năm 2015 tòa này chưa xây xong cậu ơi.
    _Bà nói đúng. Năm 2015 chỗ này là bãi giữ xe._
    ~ phat_tt(3)
    ~ cang_thang(8)
* [😇 "Dạ con biết. Ngày 12 có lương, con đóng trước một phần nha cô."]
    ba_quan_ly_sky_ao: Một phần là bao nhiêu? Thôi được, ngày 12. Tôi ghi đây.
    ~ phat_tt(-3)
    ~ cang_thang(3)
* [💸 Đưa luôn tiền khai trương trong túi: "Con gửi trước cô 1 triệu."]
    { tien >= 1000000:
        ~ tien_cong(-1000000)
        ~ phat_tra_no(1000000)
        ba_quan_ly_sky_ao: *(đếm tiền)* Ừ. Còn 35. Cậu đỡ hơn tháng trước.
        ~ phat_tt(-2)
    - else:
        _Bạn móc túi. Được 180 nghìn và một tờ phiếu giảm giá trà sữa._
        ba_quan_ly_sky_ao: Thôi cất đi cậu.
        ~ cang_thang(10)
    }
- _Thang máy lên tầng 18. Trong gương thang máy, một người đeo kính đen lúc 9 giờ tối._
-> END

// ------------------------------------------------------------
=== idol_het_thoi_0610_chup_poster ===
# ngay:6 # gio:09:30 # noi:studio # bat_buoc
_Studio tầng 2. Buổi chụp poster đầu tiên của Siêu Nhân Hồng. Đèn, phông hồng, quạt gió. {designer} cầm bảng màu, {thuc_tap_sinh} cầm hắt sáng._
_Bạn "tình cờ" đi ngang khung hình. Lần thứ nhất: lấy nước. Lần thứ hai: tìm bật lửa dù không hút thuốc. Lần thứ mười bốn: không cần lý do nữa._
tho_chup_anh: Anh gì đeo kính ơi, anh đứng lệch qua giùm em chút được hông…
_Đúng lúc đó, {sieu_nhan_hong} nhìn ra cửa sổ, thấy một bà cụ đang loay hoay với giỏ đồ trên vỉa hè. Nguyên bỏ mic, bỏ đèn, chạy xuống thang bộ._
sieu_nhan_hong: Điều khoản số 3! Em đi chút về liền!
_Studio im phăng phắc. Thợ chụp nhìn đồng hồ, nhìn bạn, nhìn cái phông hồng trống trơn._
tho_chup_anh: Hay… anh chụp vài tấm hông anh? Đèn đang đẹp.
* [😤 "Vài tấm gì. Chụp hết đi em."]
    _Bạn chụp 200 tấm. Tạo dáng kiểu 2015: chống cằm, nhìn xa xăm, một tay vuốt tóc mullet. Thợ chụp hết thẻ nhớ._
    ~ phat_gianh()
    ~ phat_nt(3)
    ~ phat_tt(8)
    ~ follow(-10000)
    ~ qh("quan_ly_idol", -5)
    quan_ly_idol: *(vừa chạy lên, thở dốc)* Phát… đây là buổi chụp của Nguyên mà em…
* [🤝 Chạy xuống phụ {sieu_nhan_hong} xách giỏ cho bà cụ.]
    _Bà cụ đi chợ về, giỏ toàn bí đỏ. Bạn xách một bên, {sieu_nhan_hong} xách một bên. Bà cụ nhìn bạn mãi._
    ba_cu: Con… con giống thằng ca sĩ hát bài cá viên chiên ghê.
    _Ai đó trên vỉa hè đang quay. Trong clip, có một bóng người đeo kính đen xách bí đỏ, lọt khung nửa giây._
    ~ qh("sieu_nhan_hong", 15)
    ~ phat_tt(-8)
    ~ phat_nt(1)
    ~ follow(5000)
* [🎤 "Thôi, đèn đẹp thì chụp em {designer} đi. Bả cầm bảng màu cả sáng rồi."]
    designer: Ủa… em hả? Thôi anh, em có ra gì đâu.
    _Nhưng {designer} vẫn đứng vào. Ba tấm. Tấm thứ ba {designer} cười thật, lần đầu tiên trong tuần._
    ~ qh("designer", 12)
    ~ phat_tt(-5)
- _Nửa tiếng sau {sieu_nhan_hong} quay lại, mồ hôi ướt mũ, tay dính đất bí đỏ._
sieu_nhan_hong: Xin lỗi cả nhà! Mình chụp tiếp nha! Gét gô!
-> END

// ------------------------------------------------------------
=== idol_het_thoi_0610_clip_ba_cu ===
# ngay:6 # gio:21:00 # noi:can_1808
_Tối. Clip "Siêu Nhân Hồng bỏ buổi chụp đi giúp bà cụ" đang lên xu hướng. Lượt xem gấp mười hai lần cái MV còn chưa ra mắt._
{ phat_gianh_spotlight > 0:
    _200 tấm ảnh của bạn đăng lúc 6 giờ chiều: 41 lượt thích. 38 lượt là hoa sen._
- else:
    _Bạn tua lại clip. Có nửa giây thấy cái kính đen của bạn ở rìa khung hình. Có người bình luận: "Ông chú đeo kính là ai mà ngầu vậy?"_
    ~ phat_nt(2)
}
hong_hot: *(nhắn riêng)* Anh Phát ơi, em đăng clip bà cụ lên fanpage nha, anh có muốn em tag anh hông?
* [😇 "Đừng tag anh. Clip của Nguyên mà."]
    hong_hot: Ủa anh hiền vậy! Ok em hông tag. Mà em kể với mọi người là anh hiền nha!
    ~ qh("hong_hot", 5)
    ~ qh("sieu_nhan_hong", 5)
    ~ phat_tt(-3)
* [🐍 "Tag anh vô. Ghi là: đàn anh {idol_het_thoi} hỗ trợ đàn em."]
    hong_hot: Dạ… em ghi vậy nha. Nghe hơi kỳ mà thôi kệ!
    _Bình luận đầu tiên dưới bài: "Đàn anh hỗ trợ bằng cách nào vậy, đứng nhìn hả?"_
    ~ phat_tt(5)
    ~ phat_nt(-1)
    ~ follow(-3000)
* [🔥 Bình luận dạo dưới clip bằng nick phụ: "Diễn hơi lố."]
    _Ba phút sau, nick phụ của bạn bị 200 người trả lời. Một người soi ra nick phụ like toàn ảnh {idol_het_thoi}._
    ~ phat_pha_chien_dich = phat_pha_chien_dich + 1
    ~ follow(-5000)
    ~ phat_nt(-2)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_0710_moc_mot ===
# ngay:7 # gio:14:00 # noi:phong_hop_tang_2
{ nguoi_theo_doi < 50000:
    _Mốc 1: 50.000 người theo dõi. Không đạt. {giam_doc} triệu tập họp khẩn "truyền lửa". Ba tiếng._
    giam_doc: Các em! Mindset của chúng ta đang bị lock! Anh muốn mỗi em phải burning như hồi anh khởi nghiệp!
    _Bạn ngồi hàng cuối. Ba tiếng. {thanh_xin_nghi} xin ra ngoài "nghe điện thoại bà ngoại" bốn lần._
- else:
    _Mốc 1: 50.000 người theo dõi. Đạt. {giam_doc} vẫn họp, nhưng là họp khen. Hai tiếng rưỡi._
    giam_doc: Các em! Chúng ta đã win! Anh không ép, nhưng tối nay ai rảnh thì đi ăn ốc!
}
giam_doc: À, Phát. Ở lại anh nói cái này.
_Mọi người ra hết. {giam_doc} gỡ kính, xoa sống mũi. Lúc không phát biểu, nhìn anh {giam_doc} mệt như một người 37 tuổi thật._
giam_doc: Hợp đồng của em hết hạn 31/10 đấy. Anh chưa nghĩ xong. Em cứ làm tốt đi, rồi tính.
* [🕶️ "Anh yên tâm. Fan em vẫn đông lắm."]
    giam_doc: *(nhìn bạn một lúc)* Ừ. Thế thì tốt.
    _Anh {giam_doc} biết. Anh {giam_doc} luôn biết. Anh chỉ không nói._
    ~ phat_tt(3)
* [📖 "Anh còn nhớ cái quán cà phê đầu ngõ hông anh? Ly bạc xỉu của anh…"]
    giam_doc: *(bật cười)* Nhớ chứ. Em hát lệch tông câu thứ ba. Anh nghe xong về không ngủ được.
    giam_doc: Hồi đó anh nghĩ mình là thiên tài. Giờ thì… Thôi, em ra đi. Làm tốt vào.
    ~ qh("giam_doc", 10)
    ~ phat_tt(-10)
    ~ phat_mo_quan_ca_phe = true
* [💬 "Anh nói thẳng đi. Có Nguyên rồi, anh còn cần em hông?"]
    giam_doc: *(im ba giây)* Anh không ép, tùy em… À không. Câu này không phải tùy em. Anh cần em làm cho anh thấy.
    ~ qh("giam_doc", 3)
    ~ cang_thang(10)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_0810_luyen_thanh ===
# ngay:8 # gio:11:20 # noi:studio
_Ngày Thị giác Thế giới. {editor} bị bắt đi khám mắt, đi ngang studio như zombie, ngáp ba lần trong một câu chào._
editor: Dạ chào anh Phát… *(ngáp)* … em đi khám mắt…
_Bạn vào studio. Hôm nay tập nốt cao điệp khúc "Công Viên". Năm 2015 bạn lên nốt đó dễ như hắt hơi._
_Bạn hít sâu. Lên. Lên nữa. Giọng bạn kêu "éc" như cửa sắt._
it: *(từ phòng kỹ thuật, qua loa)* Restart chưa anh?
* [🎤 Gồng lại, lên lần nữa.]
    { RANDOM(1, 10) <= 4:
        _Lần này lên được. Không đẹp như 2015, nhưng lên được. {it} không nói gì, nhưng bật nút thu._
        ~ phat_nt(1)
        ~ phat_tt(3)
    - else:
        _"Éc" lần hai. To hơn. {editor} ở ngoài hành lang giật mình tỉnh ngủ._
        ~ phat_vo_giong = true
        ~ cang_thang(10)
    }
* [🤝 "{it}, chỉnh giùm anh xíu. Hạ tông nửa cung."]
    it: Ừ. *(gõ phím)* Xong.
    _Hạ nửa cung. Bạn hát trơn tru. Không ai biết, trừ bạn và {it}._
    ~ phat_tt(-5)
    ~ qh("it", 5)
* [😶 Thôi, hát đoạn đầu thôi. Đoạn đầu dễ.]
    _"Ngày xưa có đôi bạn thân…" Bạn hát đoạn đầu mười lần. Đoạn đầu lúc nào cũng hay._
    ~ cang_thang(-3)
- _Ra về, {it} chìa cho bạn một hộp kẹo ngậm thông cổ. "Của anh Thái gửi. Ảnh nói anh tập là sẽ cần."_
~ phat_co_keo_ngam = true
~ qh("quan_ly_idol", 3)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_0910_ngay_trung ===
# ngay:9 # gio:12:10 # noi:can_tin
_Ngày Trứng Thế giới. Căn tin chỉ bán trứng: trứng luộc, trứng chiên, trứng hấp, trứng vịt lộn, trứng cút xào me._
_Tối nay MV đầu tiên của Siêu Nhân Hồng ra mắt. Cả công ty ăn trứng mà không ai nói chuyện gì khác ngoài MV._
hong_hot: Nghe gì chưa? MV quay có cảnh Nguyên cưỡi xe đạp hồng qua cầu! {editor} dựng ba đêm đó!
* [🥚 "Hồi anh quay MV 'Công Viên', anh tự cưỡi xe đạp luôn, không đóng thế."]
    hong_hot: Ủa thiệt hả anh? Mà xe đạp gì?
    _Xe đạp của ông bán vé số đầu ngõ. Bạn cưỡi được 3 mét thì té. Bản dựng cuối cắt đi cảnh té._
    ~ phat_tt(3)
* [😇 "Tối nay mấy giờ ra mắt? Anh coi với."]
    hong_hot: 8 giờ tối nha anh! Ối dồi ôi, anh Phát coi MV của Nguyên luôn hả? Hòa bình rồi hả?
    ~ qh("hong_hot", 3)
    ~ phat_tt(-2)
- ~ an(35)
_Bạn ăn ba quả trứng luộc. Quả nào cũng nhạt. Hồi 2015, sau mỗi buổi diễn, anh {quan_ly_idol} hay mua cho bạn trứng vịt lộn ở đầu hẻm._
-> END

// ------------------------------------------------------------
=== idol_het_thoi_0910_mv_ra_mat ===
# ngay:9 # gio:20:00 # noi:can_1808 # bat_buoc
_8 giờ tối. MV "Hồng Hóa Việt Nam" ra mắt. Bạn mở máy. Sau 10 phút: 31.000 lượt xem. Bình luận chạy nhanh như thác._
_Kênh của bạn: MV "Công Viên" bản 2015, lượt xem hôm nay: 112._
_Tin nhắn từ "Like Thật 100%": "Ưu đãi đặc biệt tối nay: 50.000 view trong 20 phút chỉ 3 triệu. Đè bẹp đối thủ!"_
_Trên Phây-búc, {sieu_nhan_hong} vừa tag bạn: "Cảm ơn đàn anh {idol_het_thoi} đã truyền cảm hứng! Chuối chiên là thái độ!"_
* [🤖 Đăng lại MV "Công Viên" 2015, mua 50.000 view ảo.]
    ~ phat_mua_view_mv = true
    ~ phat_mua_fan(50000, 3000000)
    ~ phat_tt(10)
    ~ phat_gianh()
    _20 phút sau: "Công Viên" có 50.112 lượt xem. 500 bình luận giống hệt nhau: "Anh Phát đỉnh nóc kịch trần"._
    _Bạn chụp màn hình gửi group công ty. Không ai thả tim. Chỉ có {dan_dau_tu} nhắn riêng: "Ông mua ở đâu vậy, chỉ tui với."_
    ~ follow(-5000)
* [😇 Bấm "Chia sẻ" MV của Nguyên lên trang cá nhân.]
    _Bạn gõ: "Chúc mừng em. Lần sau nhớ là chuối chiên." Rồi bấm đăng._
    _Ba phút sau, {sieu_nhan_hong} thả tim, rồi trả lời: "Dạ CHUỐI chiên! Em nhớ rồi!" 4.000 người thích bình luận đó._
    ~ qh("sieu_nhan_hong", 15)
    ~ phat_tt(-10)
    ~ phat_nt(2)
    ~ follow(8000)
* [😶 Không làm gì. Tắt máy, nằm nhìn trần nhà.]
    _Tấm poster năm 2015 trên trần nhìn xuống bạn. Bạn nhìn lên nó. Không ai thắng._
    ~ cang_thang(8)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_0910_cuoc_goi_khuya ===
# ngay:9 # gio:23:40 # noi:can_1808
_23 giờ 40. Điện thoại rung. Anh {quan_ly_idol}._
{ phat_mua_view_mv:
    -> co_mua
- else:
    -> khong_mua
}

= co_mua
quan_ly_idol: Phát. Anh thấy kênh em rồi. 50 nghìn view trong 20 phút.
_Giọng anh {quan_ly_idol} rất bình tĩnh. Bình tĩnh kiểu người vừa uống ly cà phê thứ năm._
* [🕶️ "Anh thấy chưa? Fan em về rồi đó! Em nói rồi mà, em chưa hết thời!"]
    quan_ly_idol: *(im lặng)* Ừ. Anh thấy rồi. Ngủ sớm đi em.
    _Anh cúp máy. Lần đầu tiên anh {quan_ly_idol} không nói "có gì anh lo"._
    ~ phat_tt(5)
    ~ qh("quan_ly_idol", -5)
* [😶 "Em biết. Em biết là ảo, anh đừng nói nữa."]
    quan_ly_idol: Anh không nói. Mà Phát, hủy đi. Rồi mình tính cách khác. Anh tính với em.
    _"Mình tính". Không phải "em tự tính"._
    ~ qh("quan_ly_idol", 5)
    ~ phat_tt(-5)
* [🤖 "Ừ, em hủy. Mai em hủy."]
    quan_ly_idol: Thiệt hông?
    _Bạn mở app "Like Thật 100%". Ngón tay để trên nút "Hủy gói" rất lâu._
    ** [Bấm hủy.]
        ~ phat_huy_fan_ao = true
        ~ phat_fan_ao = 0
        ~ phat_tt(-15)
        ~ phat_nt(-3)
        quan_ly_idol: *(thở ra một hơi rất dài)* Ngủ ngon nha Phát.
        ~ qh("quan_ly_idol", 15)
    ** [Không bấm. "Mai em hủy."]
        quan_ly_idol: Ừ. Mai.
        ~ phat_tt(2)
- -> END

= khong_mua
quan_ly_idol: Phát, em ngủ chưa? Anh thấy em share MV của Nguyên. Anh… cảm ơn em nha.
* [😇 "Có gì đâu anh. Mà anh ăn gì chưa?"]
    quan_ly_idol: *(cười, nghe mệt mà vui)* Chưa. Hồi chiều ăn ổ bánh mì. Thôi để anh nấu gói mì.
    ~ qh("quan_ly_idol", 8)
* [🕶️ "Em share vì tình đàn anh thôi. Anh đừng nghĩ nhiều."]
    quan_ly_idol: Ừ, anh hông nghĩ gì. Ngủ đi em.
    ~ qh("quan_ly_idol", 2)
- _Ở đâu đó trên mạng, nhóm fan "Hội Cá Viên Chiên" vừa đăng: "Tối nay anh Phát share MV đàn em. Anh mình vẫn vậy, hiền khô. ChuoiChien89."_
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1010_thong_bao_no ===
# ngay:10 # gio:09:15 # noi:can_1808 # bat_buoc
_Thứ 7, ngày 10. Ngày nhận lương. Tài khoản: không có gì mới. Ngân hàng "kiểm tra giao dịch lớn"._
_Group công ty sôi sục. {giam_doc} kể chuyện Hà Nội ngày Giải phóng Thủ đô, không ai trả lời. {thanh_ninh} thả tim từng tin._
_Bạn mở cửa căn 1808. Trên cửa dán một tờ giấy A4 khổ to, chữ đỏ: "THÔNG BÁO NỢ TIỀN THUÊ 3 THÁNG. HẠN CHÓT 15/10."_
_Hàng xóm căn 1807 đi ngang, chụp hình._
* [😤 Gỡ tờ giấy xuống, vò lại, ném vào thùng rác.]
    _Năm phút sau bà quản lý dán tờ mới. To hơn. Có thêm chữ "LẦN 2"._
    ~ cang_thang(12)
    ~ phat_tt(3)
* [📞 Nhắn anh {quan_ly_idol}: "Anh ơi, bà quản lý dán giấy lên cửa nhà em."]
    _Ba chấm hiện lên. Tắt. Hiện lên. Tắt. Rồi:_
    quan_ly_idol: Em đừng lo. Thứ 2 lương về. Có gì anh lo.
    _Bạn không biết là ở Studio 0905, anh {quan_ly_idol} đang mở ví điện tử. Còn 9.000.000đ._
    ~ qh("quan_ly_idol", 5)
    ~ cang_thang(-3)
* [💍 Nhìn cái cúp "Ca khúc của năm 2015" trên kệ. Nhìn rất lâu.]
    _Cúp bám bụi. Bạn lấy tay áo lau. Mặt cúp phản chiếu một người đeo kính đen, tóc mullet, 30 tuổi._
    _Tiệm cầm đồ Cứu Nguy ở Phố Cũ, cách đây 20 phút đi xe._
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1010_sinh_nhat_bac_binh ===
# ngay:10 # gio:20:45 # noi:cong_cong_ty
_Tối thứ 7. Bạn ghé công ty lấy cây đàn để quên. Chòi bảo vệ sáng đèn vàng. Radio đang phát một bài hát cũ về Hà Nội._
_Bác {bac_bao_ve} ngồi một mình. Trên bàn có một cái bánh bông lan nhỏ cắm một cây nến. {cho} nằm dưới chân bác, nhìn cái bánh không chớp mắt._
bac_bao_ve: Ơ, Phát à. Muộn thế này còn đến.
_Ngọn nến cháy được nửa. Không ai hát. Không ai trong công ty biết hôm nay là sinh nhật bác._
* [🎤 Lấy đàn ra, hát "Chúc mừng sinh nhật" thật nhỏ.]
    _Bạn hát. Không kính đen, không micro. {cho} tru theo ở câu cuối._
    bac_bao_ve: *(cười, mắt hơi đỏ)* Năm mươi tuổi rồi. Lần đầu có ca sĩ hát cho đấy. Cảm ơn cháu.
    ~ qh("bac_bao_ve", 20)
    ~ qh("cho", 5)
    ~ phat_tt(-8)
    ~ cang_thang(-10)
* [💬 "Sinh nhật bác hả? Sao bác hông nói ai?"]
    bac_bao_ve: Nói làm gì. Có một người nhớ là đủ rồi.
    _Bác liếc cái phong bì trên bàn, góc phong bì có một chữ "G" viết tay. Bác lật úp nó xuống._
    ~ qh("bac_bao_ve", 10)
    ~ phat_tt(-3)
* [🕶️ "Bác ơi con lấy đàn rồi đi liền, con có show."]
    bac_bao_ve: Ừ, đi đi. Đường tối, đi cẩn thận.
    _Bạn không có show nào. Bạn về nhà nằm._
- bac_bao_ve: Cắn một miếng bánh không? Con Tuất nó nhìn mãi rồi đấy.
~ an(10)
~ qh("cho", 3)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1110_anh_hoi_nho ===
# ngay:11 # gio:10:00 # noi:can_1808
_Chủ nhật, Ngày Quốc tế Trẻ em gái. Cả công ty đăng ảnh hồi nhỏ. {hong_hot} đăng ảnh 5 tuổi cầm micro đồ chơi. {chi_dai} đăng ảnh 7 tuổi đang đè một thằng nhóc xuống cát._
_{sieu_nhan_hong} đăng một tấm ở một xóm nhỏ có cây me, cả đám con nít, có một đứa đang khóc. Cả công ty thả tim._
_Bạn lục điện thoại. Ảnh hồi nhỏ của bạn ở nhà ba má, không có ở đây. Chỉ có ảnh năm 2015._
* [🕶️ Đăng ảnh 2015 cầm cúp, ghi: "Hồi nhỏ."]
    _Bình luận: "Hoa sen 1: Anh Phát đỉnh nóc kịch trần." "Hoa sen 2: Anh Phát đỉnh nóc kịch trần." Rồi {chua_te_deadline}: "Hồi nhỏ mà có mullet rồi hả anh."_
    ~ phat_tt(5)
    ~ phat_nt(1)
* [😇 Đăng ảnh 2015, ghi thật: "Hồi này tui 19 tuổi. Với tui, đây là hồi nhỏ."]
    _{hong_hot}: "Ủa sao đọc thấy buồn buồn vậy anh." 63 người thích. Không có hoa sen nào, vì gói fan ảo chỉ comment câu có sẵn._
    ~ phat_tt(-5)
    ~ phat_nt(2)
    ~ follow(1000)
* [😶 Không đăng gì. Nhắn hỏi anh {quan_ly_idol}: "Anh còn giữ ảnh hồi em mới vô công ty hông?"]
    quan_ly_idol: *(trả lời sau 4 giây, nhanh bất thường)* Còn. Để anh coi lại… ờ, anh tìm thử.
    _Anh gửi một tấm: bạn 19 tuổi, ngủ gục trên cây đàn ở hậu trường hội chợ, trên người đắp cái áo khoác đen. Áo của ai thì bạn không nhớ._
    ~ qh("quan_ly_idol", 5)
    ~ phat_tt(-3)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1110_tiem_cam_do ===
# ngay:11 # gio:15:00 # noi:tiem_cam_do # bat_buoc
_Tiệm cầm đồ Cứu Nguy, Phố Cũ. Quạt trần quay chậm. Tủ kính toàn đồng hồ, nhẫn, điện thoại đời cũ. Bạn ôm cái cúp "Ca khúc của năm 2015" trong túi vải._
_Ở quầy, một người quen đang đẩy cái đồng hồ qua mặt kính._
dan_dau_tu: Ủa Phát? Ông cũng ra đây hả? Tui cầm cái đồng hồ, tuần sau coin lên là chuộc liền. Ông cầm gì vậy?
* [🕶️ "Đem đi đánh bóng thôi. Fan tặng nhiều quá, để nhà chật."]
    { RANDOM(1, 10) <= 5:
        dan_dau_tu: À… vậy hả. Ngầu ghê. Tiệm này đánh bóng đẹp lắm đó.
        ~ phat_tt(5)
    - else:
        dan_dau_tu: *(cười)* Thôi đi ông. Tui cũng y chang. Ngồi xuống đi, chủ tiệm đếm tiền chậm lắm.
        ~ qh("dan_dau_tu", 10)
    }
* [💸 Đặt cúp lên quầy. "Cầm cái này."]
    chu_tiem_cam_do: *(lật cúp, gõ gõ)* Mạ vàng. Đồ kỷ niệm. Cầm được 6 triệu thôi nha. Chuộc trước 30/10, quá hạn là tiệm bán.
    _Bạn ký tên. Chủ tiệm đặt cúp vào tủ kính, giữa một cái nồi cơm điện và một cây đàn organ._
    ~ phat_cam_cup = true
    ~ phat_co_cup = false
    ~ tien_cong(6000000)
    ~ phat_tra_no(6000000)
    ~ phat_nt(-2)
    ~ cang_thang(5)
* [🤝 "Anh Chương cho em vay 5 triệu đi, tháng sau em trả."]
    dan_dau_tu: Tui còn nợ nửa công ty nè ông. Mà nè, có kèo này: coin "Hồng Coin", mới ra đêm 9/10. Bỏ vô 2 triệu, tuần sau x10.
    ** [💸 "Ừ, cho em vô 2 triệu."]
        ~ phat_them_no(2000000)
        dan_dau_tu: Lần này là lên thật!
        _Bạn không có 2 triệu. Bạn mượn thẻ tín dụng. Tiền Nợ dày thêm._
    ** [😶 "Thôi anh. Em sợ coin hơn sợ nợ."]
        dan_dau_tu: Ông sẽ hối hận đó. Hoặc hông.
        ~ qh("dan_dau_tu", 3)
* {phat_mo_quan_ca_phe} [🔒 "Thôi, em đem về. Anh Thái từng nói cái cúp này là của cả hai anh em."]
    _Bạn ôm cúp ra khỏi tiệm. Ngoài trời nắng. Bạn nhớ lại đêm trao giải năm 2015: người vỗ tay to nhất dưới khán đài, vỗ tới đỏ cả tay, là anh {quan_ly_idol}._
    ~ phat_tt(-10)
    ~ cang_thang(-10)
    ~ qh("quan_ly_idol", 10)
- -> END

// ------------------------------------------------------------
=== idol_het_thoi_1210_luong_ve ===
# ngay:12 # gio:09:30 # noi:tang_1 # bat_buoc
_Thứ 2. Lương về trễ 2 ngày. 8.000.000đ. Group Zalo-lô nổ như chợ._
con_ong_chau_cha: *(ở quầy cà phê)* Ủa, thẻ phụ của anh bị từ chối? Chắc máy lỗi. Để anh gọi chú anh.
_Sau lưng {con_ong_chau_cha}, {thuc_tap_sinh} rút ví trả giùm. Một cái thẻ màu kim cương lóe lên. {thuc_tap_sinh} giấu vào ngay._
~ tien_cong(8000000)
_Bạn nhìn số dư. 8 triệu. Nợ: còn rất nhiều. Hạn chót của bà quản lý: 15/10._
* [💸 Chuyển luôn 8 triệu trả tiền nhà.]
    ~ tien_cong(-8000000)
    ~ phat_tra_no(8000000)
    ~ phat_tt(-3)
    _Còn 0 đồng. Tối nay ăn mì. Mà tối nay ngủ được._
    ~ cang_thang(-5)
* [💸 Trả 4 triệu, giữ 4 triệu sống qua tháng.]
    ~ tien_cong(-4000000)
    ~ phat_tra_no(4000000)
* {phat_cam_cup} [💍 Ra tiệm cầm đồ chuộc cúp.]
    { tien >= 6000000:
        ~ tien_cong(-6000000)
        ~ phat_them_no(6000000)
        ~ phat_chuoc_cup = true
        ~ phat_cam_cup = false
        ~ phat_co_cup = true
        _Bạn ôm cúp về. Nợ lại như cũ. Nhưng cái kệ ở nhà đỡ trống._
        ~ cang_thang(-5)
    - else:
        _Không đủ. Chủ tiệm lắc đầu, chỉ vào cái tủ kính: "Nó còn đó, chưa đi đâu."_
    }
* [🤖 Gia hạn thêm 1 tháng gói "Like Thật 100%".]
    ~ tien_cong(-1500000)
    ~ phat_tt(5)
    ~ phat_fan_ao = phat_fan_ao + 10000
- ke_toan: *(đi ngang, nói nhỏ)* Phát. Cát-xê đám cưới tháng này có hóa đơn hông em? Tháng sau có đoàn thuế đó.
_Bạn chưa từng thấy hóa đơn cát-xê đám cưới nào trong đời._
~ qh("ke_toan", 2)
-> END

// ------------------------------------------------------------
=== idol_het_thoi_1210_toi_thu_hai ===
# ngay:12 # gio:21:30 # noi:quan_oc_dem
_Quán Ốc Đêm. Lương về, cả hẻm đi ăn ốc. Bàn công ty kê ba cái nối nhau._
{ phat_co_phieu_oc:
    _Bạn đưa phiếu "1 dĩa ốc miễn phí" từ vụ khai trương. Cô chủ quán bưng ra dĩa ốc len xào dừa. Cả bàn vỗ tay._
    ~ phat_co_phieu_oc = false
    ~ an(30)
}
sales: Anh Phát! Ngồi đây! Tin chị đi, tháng sau chị book anh hát sự kiện của BTT Global, cát-xê 50 triệu!
_{sales} nhỏ hơn bạn 4 tuổi. {sales} tự xưng là chị. Bạn đã quen._
* [🕶️ "50 triệu là giá năm 2015. Bây giờ giá anh khác."]
    sales: Ối, vậy chị nói 80 nha! Chắc kèo!
    _Không ai tin, kể cả {sales}. Nhưng cả bàn cười._
    ~ phat_tt(5)
    ~ qh("sales", 5)
* [💬 "BTT Global là công ty gì vậy em? Anh tìm trên mạng hông thấy."]
    sales: *(uống một ngụm, nhìn đi chỗ khác)* Bên đó kín tiếng lắm anh. Tập đoàn lớn hay kín tiếng.
    designer: *(đá chân {sales} dưới gầm bàn)*
    ~ qh("sales", -3)
    ~ qh("designer", -2)
* [🎤 Đứng dậy hát "Công Viên" cho cả quán nghe.]
    { RANDOM(1, 10) <= 6:
        _Cả quán hát theo. Bàn bên cạnh là mấy chú xe ôm, hát to nhất. Cô chủ quán tặng thêm dĩa nghêu._
        ~ phat_nt(2)
        ~ an(10)
        ~ cang_thang(-10)
    - else:
        _Bạn hát hết bài. Cả quán im lặng ăn ốc. Một chú hỏi: "Bài gì vậy con?"_
        ~ phat_tt(-5)
        ~ cang_thang(8)
    }
- ~ an(30)
~ tien_cong(-150000)
-> END
