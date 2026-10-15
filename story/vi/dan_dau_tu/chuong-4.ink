// ============================================================
// DÂN ĐẦU TƯ: CHƯƠNG · CHƯƠNG 4: "THOÁT NGHÈO Ở VŨNG TÀU" (17/10 – 20/10)
// ============================================================

// ------------------------------------------------------------
=== dan_dau_tu_1710_xe_di_vung_tau ===
# ngay:17 # gio:07:30 # noi:xe_di_vung_tau # bat_buoc
_Ngày Quốc tế Xóa nghèo. Xe 29 chỗ đi Vũng Tàu. {hr} cầm danh sách phòng. {hong_hot} cầm micro karaoke trên xe._
hong_hot: Rồi! Mỗi người phát biểu một câu cho Ngày Xóa nghèo nha! Anh {dan_dau_tu} trước!
_Cả xe quay lại nhìn bạn. 8 người trong số đó là chủ nợ của bạn._
* [📈 Đứng dậy: "Từ hôm nay tui thoát nghèo!"]
    _Cả xe vỗ tay, nửa thật nửa đùa. {sales} hô "Đỉnh nóc!". Bác {bac_bao_ve} không đi, nhưng nếu đi chắc bác sẽ nói "Thế à"._
    ~ ddt_nt(10)
    ~ ddt_noi_day()
* [😢 "Từ hôm nay tui… cố gắng nghèo ít lại."]
    _Xe im một giây. Rồi {it} ngồi cuối xe nói đúng một chữ: "Được." Cả xe cười. Lần này là cười thật._
    ~ ddt_qh_chu_no(3)
    ~ ddt_dc(2)
* [📊 "Xóa nghèo theo số liệu: công ty đạt một triệu, thưởng 5 tỷ. Mình lo cái đó trước."]
    hong_hot: Ủa nay anh {dan_dau_tu} nói chuyện như sếp vậy!
    giam_doc: *(ở ghế đầu, quay lại)* Nói hay. Anh thích.
    ~ qh("giam_doc", 5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1710_x10 ===
# ngay:17 # gio:15:00 # noi:vung_tau_resort # bat_buoc
_15 giờ. Clip gameshow hôm qua viral. Điện thoại bạn rung liên tục. $HONG đang tăng. 2 lần. 5 lần. 10 lần. Trong 4 tiếng._
{ ddt_mua_hong:
    ~ ddt_tai_khoan = ddt_tai_khoan + ddt_hong * 9
    ~ ddt_hong = ddt_hong * 10
    _Màn hình tài khoản của bạn hiện một con số bạn chưa từng thấy trong đời. Bạn chụp màn hình 14 lần._
    ~ ddt_nt(30)
    hong_hot: *(nhìn qua vai bạn)* TRỜI ƠI ANH {dan_dau_tu}! X10! Anh giàu rồi! Ối dồi ôi!
    _Tin lan khắp resort trong 3 phút. 21 người nhìn bạn như nhìn một tỷ phú vừa rơi từ trên trời xuống._
- else:
    _Bạn không có đồng $HONG nào. Bạn nhìn con số x10 với cảm giác của người đứng ngoài cửa sổ nhà hàng._
    hong_hot: Anh {dan_dau_tu}! Coin lên x10 rồi! Anh có hông? Ủa, anh không có hả? Trời ơi!
    _Ngón tay bạn đặt trên nút "Mua". Ở đỉnh x10._
    * [✋ Không bấm. Tắt app.]
        ~ ddt_so_lan_tat_app = ddt_so_lan_tat_app + 1
        ~ ddt_dc(5)
        _Bạn tắt app. Tay run. Bạn đi ra biển đứng một mình 10 phút, như người vừa thoát một vụ tai nạn mà không ai thấy._
        -> END
    * [💸 Bấm. "Chưa muộn. Còn lên x20."]
        ~ ddt_mua_hong = true
        { tien >= 2000000:
            ~ tien_cong(-2000000)
            ~ ddt_tai_khoan = ddt_tai_khoan + 2000000
            ~ ddt_hong = ddt_hong + 2000000
        - else:
            ~ ddt_hong = ddt_tai_khoan
        }
        _Bạn mua đúng đỉnh. Chart vẽ một cây nến đỏ dài như cây cột điện, ngay sau lệnh của bạn._
        ~ ddt_noi_day()
        ~ ddt_nt(10)
        -> END
}
-> END

// ------------------------------------------------------------
=== dan_dau_tu_1710_hai_san ===
# ngay:17 # gio:19:00 # noi:vung_tau_nha_hang # bat_buoc
_Nhà hàng hải sản Sóng Vỗ. Cả đoàn ngồi kín ba bàn. Không ai nói ra, nhưng ai cũng nhìn về phía bạn._
hong_hot: Anh {dan_dau_tu} ơi, ngày Xóa nghèo mà! Anh tuyên bố thoát nghèo rồi mà!
sales: Tin em đi, bao một bữa là lấy lại uy tín cả năm!
_Không biết bằng cách nào, bạn đã đứng dậy, giơ tay gọi phục vụ._
* [🦞 "Cua! Ghẹ! Tôm hùm! Hôm nay tui bao hết! Lần này là lên thật!"]
    _Cả đoàn hô "Anh {dan_dau_tu} đỉnh nóc!". Cua, ghẹ, tôm hùm, mực một nắng. Bạn ăn ngon nhất đời._
    ~ ddt_no_nha_hang = 6800000
    ~ an(100)
    ~ ddt_qh_chu_no(5)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
* [🍲 "Lẩu hải sản cho cả đoàn! Tui bao!"]
    _Ba nồi lẩu to, đầy tôm mực. Không sang bằng tôm hùm, nhưng ai cũng no. Cả đoàn vẫn hô "Đỉnh nóc!", hơi nhỏ hơn._
    ~ ddt_no_nha_hang = 3200000
    ~ an(90)
    ~ ddt_qh_chu_no(3)
- ~ ddt_tinh_tong()
_Tới lúc tính tiền. Bạn bấm "Rút tiền" trên sàn. Màn hình hiện: "Hệ thống rút tiền đang bảo trì. Vui lòng thử lại sau 72 giờ."_
_Bạn ký nợ nhà hàng. Chủ quán nhìn chữ ký của bạn như nhìn một tờ vé số đã xổ._
_Bạn đứng trước mặt cả đoàn, nói to:_
dan_dau_tu: Mai về thành phố, tui trả nợ hết! Cả gốc lẫn lãi!
_Cả đoàn vỗ tay. Trong túi áo, hóa đơn nhà hàng nặng như một cục gạch._
{ ddt_mua_hong:
    _Đêm đó, ngồi một mình ở ban công resort, bạn mở app. Nút "Bán" sáng. Nút "Rút" bảo trì. Ví người tạo coin vẫn đang giữ 70%._
    * [📉 Bán ngay đêm nay. Bao nhiêu cũng được.]
        ~ ddt_ban_hong_17 = true
        _Bạn bấm "Bán". Lệnh khớp được… một phần nhỏ. Không ai mua nổi số coin trên màn hình với giá trên màn hình. Con số x10 chỉ là con số._
        ~ temp thu_ve = ddt_hong / 10
        ~ ddt_tai_khoan = ddt_tai_khoan - ddt_hong + thu_ve
        ~ ddt_hong = 0
        _Bạn thu về {thu_ve} đồng. Bằng đúng số tiền bạn bỏ vào lúc đầu. Gấp 10 lần trên màn hình. Gấp 1 lần ngoài đời._
        ~ ddt_nt(-20)
        ~ ddt_mo_cat_lo = true
        _Lần đầu tiên, bạn hiểu nghĩa của chữ "cắt"._
        -> END
    * [📈 "Để thêm chút nữa cho x20."]
        _Bạn tắt màn hình, nằm xuống, mơ thấy x20. Trong mơ, tôm hùm biết nói: "Lần này là lên thật"._
        ~ ddt_nt(10)
        -> END
}
-> END

// ------------------------------------------------------------
=== dan_dau_tu_1710_lua_trai ===
# ngay:17 # gio:21:30 # noi:vung_tau_bai_bien
_Đêm lửa trại. {idol_het_thoi} hát. {sieu_nhan_hong} kể chuyện hồi nhỏ từng nhốt một đứa trẻ trong nhà kho, giọng nhỏ, không giống giọng siêu nhân._
_{giam_doc} say, đứng lên ghế: "Anh hứa! Tăng lương cả công ty!" Ai đó đang quay clip._
_Bạn ngồi xa đống lửa một chút. Trên điện thoại, livestream của {hong_hot} đang có 1.200 người xem. Đường lượt xem dựng lên mỗi khi {sieu_nhan_hong} nói chuyện thật lòng._
* [📊 Ghi nhận: "Lúc nói thật, người xem ở lại."]
    _Bạn ghi vào điện thoại, ngay dưới ghi chú "ĐỔI HƯỚNG". Bằng chứng thứ hai._
    ~ ddt_lam_that(5)
* [🧮 Tính nhanh: tăng lương cả công ty 20% thì mất bao nhiêu một tháng.]
    _Hơn 60 triệu một tháng. Bạn nhìn {giam_doc} trên ghế, rồi nhìn {ke_toan} đang ôm đầu. Bạn thấy thương cả hai._
    ke_toan: *(nói nhỏ)* Anh tính ra bao nhiêu?
    dan_dau_tu: Đủ để bà mất ngủ thêm 1 tháng.
    ~ qh("ke_toan", 8)
* [🔥 Ngồi cạnh {it} trả nợ bằng… kể chuyện.]
    it: Ba triệu.
    dan_dau_tu: Ừ, anh nhớ. Em biết không, hồi tháng 3 anh mượn em là vì…
    _Bạn kể. {it} nghe. Không cắt ngang lần nào. Khi bạn kể xong, {it} chỉ nói: "Ừ. Từ từ."_
    ~ qh("it", 10)
- _Gần nửa đêm, {idol_het_thoi} ngủ gục trên vai {quan_ly_idol}. {editor} đắp chăn cho cả hai. Bạn thấy hết, nhưng con số này bạn không ghi._
-> END

// ------------------------------------------------------------
=== dan_dau_tu_1810_coin_sap ===
# ngay:18 # gio:10:30 # noi:xe_ve_thanh_pho # bat_buoc
{ ddt_nguyen_quang_ba_coin:
    _Trước cả tin coin sập, clip {sieu_nhan_hong} nói "Mua Hồng Coin đi" đã bị cắt ra, lan khắp mạng với tiêu đề: "Siêu Nhân Hồng lùa gà?"._
    _{quan_ly_idol} gọi cho bạn 6 cuộc. Bạn không dám nghe cuộc nào._
    ~ scandal()
    ~ follow(-120000)
    ~ qh("quan_ly_idol", -20)
    ~ qh("sieu_nhan_hong", -15)
}
{ not ddt_mua_hong:
    _10:15. Người tạo Hồng Coin ôm tiền biến mất. $HONG về 0 trong 15 phút. Trên xe về, {hong_hot} đọc tin to: "Ai mua coin là còn cái nịt!"_
    _Bạn không có đồng nào. Bạn nhìn ra cửa sổ, thở ra một hơi rất dài. Như người đứng nhìn cây cầu sập ngay sau khi mình đi qua._
    { ddt_canh_bao_coin:
        quan_ly_idol: *(quay xuống)* {dan_dau_tu}. Hồi đó ông nhắn group, may mà không ai trong công ty mua. Cảm ơn ông.
        ~ qh("quan_ly_idol", 10)
        ~ uy_tin = uy_tin + 5
    }
    -> END
}
{ ddt_ban_hong_17:
    _10:15. $HONG về 0 trong 15 phút. Người tạo coin ôm tiền biến mất. Bạn đã bán đêm qua. Không lời, không lỗ. Chỉ còn tờ hóa đơn nhà hàng._
    ~ ddt_nt(-10)
    -> END
}
_10:15. Trên xe về. Điện thoại bạn rung một lần, rồi im._
_$HONG: −99%. Người tạo coin ôm tiền biến mất. Còn cái nịt._
~ ddt_tai_khoan = ddt_tai_khoan - ddt_hong
~ ddt_hong = 0
{ ddt_tai_khoan < 0:
    ~ ddt_tai_khoan = 0
}
~ ddt_nt(-40)
~ cang_thang(30)
_Cả xe im lặng. Không ai hát. Hóa đơn hải sản vẫn trong túi áo bạn. Ai cũng giận ai, nhưng ai cũng giận bạn nhất._
* [😢 Đứng dậy giữa xe: "Tui xin lỗi. Tui hứa mà tui không trả được."]
    _Xe im lặng thêm 1 phút. Rồi {chi_dai} nói từ hàng ghế đầu:_
    chi_dai: Ngồi xuống. Xin lỗi được là còn cứu được. Về rồi tính.
    ~ ddt_qh_chu_no(5)
    ~ qh("chi_dai", 10)
    ~ ddt_mo_cat_lo = true
* [📈 "Đáy rồi! Đáy thật rồi! Nó sẽ hồi!"]
    _Không ai trả lời. {sales} đeo tai nghe. {it} nhìn bạn, lắc đầu rất nhẹ._
    ~ ddt_noi_day()
    ~ ddt_qh_chu_no(-10)
* [😶 Úp mặt vào cửa kính.]
    _Biển lùi lại phía sau. Bạn nghĩ tới tờ giấy nhắc nợ thứ 7 trên cửa gác lửng._
    ~ ddt_qh_chu_no(-3)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_1810_penthouse ===
# ngay:18 # gio:19:00 # noi:phong_gac_lung
_Tối 18. Về tới gác lửng. Điện thoại rung: {con_ong_chau_cha}._
con_ong_chau_cha: Anh {dan_dau_tu}… penthouse em đang ở bị rao bán. Chính chủ. Anh rành số. Anh nói em nghe chuyện gì đang xảy ra với chú em đi.
_Bạn ghép các mảnh: thẻ phụ bị chặn ngày 12. Lương trễ vì ngân hàng giữ lệnh. Giờ là penthouse. Dòng tiền của {giam_doc} đang chảy ngược._
* [📊 "Chú em đang cần tiền gấp. Rất gấp. Em hỏi thẳng chú đi."]
    con_ong_chau_cha: *(im lặng rất lâu)* Em… em chưa bao giờ hỏi chú cái gì thẳng hết.
    dan_dau_tu: Thì lần này hỏi.
    ~ qh("con_ong_chau_cha", 15)
    ~ ddt_dc(5)
* [😶 "Anh không biết."]
    con_ong_chau_cha: Ừ. Không ai biết. Thôi, em cảm ơn anh.
    ~ qh("con_ong_chau_cha", 2)
- { ddt_no_long > 0:
    _Bạn nhớ ra mình còn nợ {con_ong_chau_cha} {ddt_no_long} đồng. Lần đầu tiên, con số đó có khuôn mặt._
    ~ ddt_nt(-5)
}
-> END

// ------------------------------------------------------------
=== dan_dau_tu_1910_giao_ban ===
# ngay:19 # gio:08:30 # noi:phong_hop_tang_2 # bat_buoc
_Giao ban thứ 2. Không ai nhìn mặt ai. {truong_phong} chiếu slide "Chúng ta là một gia đình". Không ai cười._
_Điện thoại bạn rung: số lạ từ Vũng Tàu. Nhà hàng Sóng Vỗ._
* [📞 Nghe máy, hẹn trả theo tuần.]
    _"Dạ, mỗi tuần con gửi một phần ạ." Chủ quán đồng ý, giọng mệt mỏi. Đây là cuộc điện thoại thật lòng nhất của bạn trong tháng._
    ~ ddt_dc(2)
    { tien >= 1000000:
        ~ ddt_tra("nha_hang", 1000000)
    }
* [🔕 Tắt máy.]
    _Máy rung tiếp. Bạn úp nó xuống bàn. {truong_phong} nhìn bạn: "Anh {dan_dau_tu}, mình đang họp."_
    ~ cang_thang(10)
- truong_phong: Mai 20/10, sinh nhật công ty kiêm ngày Phụ nữ. Anh {dan_dau_tu} chuẩn bị số liệu "16 năm {cong_ty}" để chiếu nhé.
* [📊 Làm thật: 16 năm, có lên có xuống, có cả năm 2015 đỉnh cao.]
    ~ ddt_lam_that(5)
    _Bạn làm tới 10 giờ đêm. Biểu đồ 16 năm có một ngọn núi ở năm 2015, rồi đi xuống. Thật. Không đẹp. Nhưng thật._
* [📈 Làm cho đẹp: đi lên đều 16 năm.]
    ~ ddt_dc(-3)
    _Xong trong 15 phút. Đẹp như tờ biểu đồ treo trong phòng giám đốc._
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2010_qua_chi_em ===
# ngay:20 # gio:08:30 # noi:tang_1 # bat_buoc
_Ngày Phụ nữ Việt Nam. Bàn nào cũng có hoa. Bạn không còn tiền mua quà cho chị em. Ví bạn mỏng như cái chart lúc 3 giờ sáng._
* [🎨 Vẽ tay thiệp biểu đồ đi lên cho từng chị em.]
    _Bạn vẽ 8 tấm thiệp. Mỗi tấm một biểu đồ đi lên, kèm một câu: "{hong_hot}: lượt hóng tăng 300%", "{ke_toan}: tiết kiệm tăng 8386%"._
    ke_toan: *(cười, lần đầu cười với bạn trong năm)* Tám ba tám sáu. Phát lộc. Thôi được, tui nhận.
    hong_hot: Trời ơi dễ thương! Đăng group liền!
    ~ qh("ke_toan", 10)
    ~ qh("hong_hot", 8)
    ~ qh("sales", 5)
    ~ qh("chi_dai", 5)
    ~ qh("designer", 5)
    ~ qh("bien_kich", 5)
* [💐 Mượn {thuc_tap_sinh} 500 nghìn mua hoa.]
    thuc_tap_sinh: Dạ anh cầm đi ạ! Em… em không cần gấp đâu ạ!
    ~ ddt_vay("thuc_tap_sinh", 500000)
    _Bạn mua 8 bông hồng. Đẹp. Mỗi bông là 62.500đ nợ._
    ~ qh("hong_hot", 5)
    ~ qh("ke_toan", 3)
    ~ qh("sales", 3)
* [🏃 Trốn lên sân thượng tới trưa.]
    _Bạn ngồi trên sân thượng, nhìn xuống sảnh đầy bong bóng. Không ai tìm bạn. Điều đó vừa nhẹ nhõm, vừa buồn._
    ~ cang_thang(10)
    ~ qh("chi_dai", -3)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2010_thu_g ===
# ngay:20 # gio:10:00 # noi:sanh_tang_tret # bat_buoc
_Lễ sinh nhật 16 tuổi của {cong_ty}. Bạn chiếu biểu đồ "16 năm" lên màn hình lớn._
{ ddt_man_hinh_trai > ddt_man_hinh_phai:
    _Biểu đồ thật: núi năm 2015, rồi dốc xuống, rồi một cột nhỏ nhô lên tháng 10/2026. Cả sảnh im lặng nhìn. {idol_het_thoi} đứng nhìn cái núi năm 2015 rất lâu._
    ~ qh("idol_het_thoi", 5)
- else:
    _Biểu đồ đi lên đều 16 năm. Cả sảnh vỗ tay. {ke_toan} không vỗ._
}
_Rồi Bác {bac_bao_ve} bước lên bục, cầm một lá thư tay ký chữ "G" vừa tới sáng nay. Bác nhìn micro, rồi đọc._
bac_bao_ve: "Gửi anh {bac_bao_ve} và các cháu. Mười sáu năm rồi. Cố lên."
_Ngắn vậy thôi. {giam_doc} cúi mặt. Bạn nghĩ tới 2.000.000đ, và người đàn ông 50 tuổi chưa bao giờ nhắc tới nó._
* { ddt_no_binh > 0 } [💸 Sau buổi lễ, đi thẳng ra chòi.]
    { tien >= ddt_no_binh:
        ~ ddt_tra("bac_bao_ve", ddt_no_binh)
        _Bạn đặt phong bì lên bàn trà. Bác nhìn phong bì, rồi nhìn bạn._
        bac_bao_ve: Cậu trả hết rồi à? … Ừ. Hôm nay là ngày đẹp để trả.
        ~ qh("bac_bao_ve", 20)
    - else:
        _Bạn chỉ có đủ để trả bác một phần. Bác nhận, gật đầu._
        ~ ddt_tra("bac_bao_ve", tien / 2)
        bac_bao_ve: Từ từ. Không vội.
        ~ qh("bac_bao_ve", 10)
    }
* [😶 Đứng nghe, rồi quay về bàn.]
    ~ cang_thang(5)
- -> END

// ------------------------------------------------------------
=== dan_dau_tu_2010_karaoke ===
# ngay:20 # gio:21:30 # noi:karaoke_hat_cho_nhau_nghe
_Quán ốc xong, cả công ty kéo qua Karaoke Hát Cho Nhau Nghe. {giam_doc} say, đứng lên ghế, cầm micro._
giam_doc: Anh tuyên bố! Nếu Siêu Nhân Hồng đạt một triệu, cả công ty tăng lương 20%! Anh không ép, tùy… tùy anh!
_Cả phòng gào lên. {ke_toan} ôm đầu. Bạn là người duy nhất trong phòng tính nhẩm nhanh hơn tiếng nhạc._
* [🧮 Ghé tai {ke_toan}: "20% lương, mỗi tháng thêm hơn 60 triệu. Thưởng 5 tỷ gánh được 6 năm."]
    ke_toan: *(ngẩng lên)* Thiệt hả? … Vậy là… chỉ cần đạt một triệu. Ông tính kỹ giùm tui nha.
    ~ qh("ke_toan", 10)
    ~ ddt_lam_that(3)
* [🎤 Giành micro hát "Công Viên" để đổi chủ đề.]
    _Bạn hát sai lời y như {sieu_nhan_hong}: "bán khoai chiên". Cả phòng cười bò. Lời hứa 20% chìm trong tiếng cười._
    ~ cang_thang(-15)
    ~ tinh_than_cong_ty = tinh_than_cong_ty + 3
* [📈 "Sếp! Tăng lương xong em đầu tư giùm cả công ty!"]
    _Cả phòng im lặng 3 giây. {chi_dai} đặt ly bia xuống bàn. Rất nhẹ. Đáng sợ._
    ~ qh("chi_dai", -10)
    ~ ddt_noi_day()
- ~ uong(20)
-> END
