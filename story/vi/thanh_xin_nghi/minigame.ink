// ============================================================
// THÁNH XIN NGHỈ: SƠN · MINIGAME (mở đầu / thành công / thất bại)
// Game mở minigame sau cảnh *_mo, rồi nhảy vào *_dat hoặc *_truot.
// ============================================================

// ============ 📅 XẾP LỊCH XẾP HÌNH ============
=== thanh_xin_nghi_mg_xep_lich_mo ===
# noi:ban_dieu_phoi
_Bảng tuần hiện lên. Các khối rơi xuống: Nguyên đi quay, {idol_het_thoi} hát đám cưới, xe đoàn quay, phòng studio. Khối nào chồng nhau thì chớp đỏ._
_Thỉnh thoảng rơi xuống một khối "🆘 Nguyên bỏ đi giúp người", không báo trước._
quan_ly_idol: *(qua điện thoại)* {thanh_xin_nghi}, xếp sao cho {idol_het_thoi} với Nguyên đừng đụng mặt nhau ở cổng nha. Hai ông đó mà gặp nhau là {cho} sủa.
-> END

=== thanh_xin_nghi_mg_xep_lich_dat ===
_Khối cuối cùng rơi đúng chỗ. Cả bảng xanh mướt. Không một ô đỏ._
~ tien_cong(120000)
~ uy_tin = uy_tin + 3
~ son_tuan_khong_chong = son_tuan_khong_chong + 1
~ follow(5000)
{ son_tuan_khong_chong >= 2:
    ~ nhan(ca_phe)
    ~ uong(15)
    quan_ly_idol: Tuần này không chồng lịch nào. Anh mời em ly cà phê sữa đá. Đừng uống chung với {chua_te_deadline}, ổng uống hết.
    ~ qh("quan_ly_idol", 5)
}
{ ngay >= 23:
    ~ son_lich_chong_cheo_tuan_cuoi = false
}
-> END

=== thanh_xin_nghi_mg_xep_lich_truot ===
_Hai khối chồng lên nhau, chớp đỏ. Xe đoàn quay tới studio thì {sieu_nhan_hong} đang ở đám cưới… của người lạ, hát giùm vì ca sĩ đám cưới bị kẹt xe. Ca sĩ đám cưới đó là {idol_het_thoi}._
idol_het_thoi: *(gọi điện)* {thanh_xin_nghi}! Có một ông siêu nhân hồng đang hát đám cưới của anh!
~ follow(-8000)
~ uy_tin = uy_tin - 3
~ son_tuan_khong_chong = 0
{ ngay >= 23:
    ~ son_lich_chong_cheo_tuan_cuoi = true
}
~ cang_thang(10)
-> END

// ============ 📞 CUỘC GỌI XIN NGHỈ ============
=== thanh_xin_nghi_mg_cuoc_goi_mo ===
# gio:07:00 # noi:nha_ven_do
_7 giờ sáng. Chọn thẻ lý do. Canh nhịp ho. Bật âm thanh nền: gà gáy, mưa rơi, còi xe cấp cứu tải trên mạng._
_Thanh "nghi ngờ" của người nghe nhích theo từng câu._
{ son_the_ly_do_moi:
    _Trong tay bạn có thẻ "Lý Do Mới". Dùng một lần, không ai nghi._
}
-> END

=== thanh_xin_nghi_mg_cuoc_goi_dat ===
_Tiếng ho đúng nhịp. Tiếng gà gáy đúng lúc. Đầu dây bên kia thở dài, rồi "Ừ, nghỉ đi em, giữ sức khỏe."_
~ son_xin_nghi()
~ son_tin(5)
~ son_goi_hoan_hao = son_goi_hoan_hao + 1
{ co(giay_nghi_om):
    ~ mat(giay_nghi_om)
    _Kèm giấy phòng khám. Nghỉ có phép. Lương giữ nguyên._
- else:
    ~ tien_cong(-590000)
    _Không có giấy phòng khám. Nghỉ không phép. Trừ 590.000đ._
}
{ son_goi_hoan_hao >= 1 && not son_the_ly_do_moi:
    ~ son_the_ly_do_moi = true
    _Cuộc gọi hoàn hảo. Bạn nghĩ ra một lý do mới tinh, cất vào túi như cất một lá bài tẩy._
}
-> END

=== thanh_xin_nghi_mg_cuoc_goi_truot ===
_Bạn ho quá tay. Đầu dây bên kia hốt hoảng: "Em ho dữ vậy! Để anh gọi xe cấp cứu tới nhà em ở Ven Đô!"_
_Rồi trong file âm thanh nền, một giọng đọc vang lên: "Tải ngay app…"_
~ son_tin(-15)
~ son_soi(10)
~ son_goi_hoan_hao = 0
_Bạn cúp máy. Hôm nay bạn đi làm, với cổ họng rát vì ho thật._
~ son_di_lam()
-> END

// ============ 🏥 MẶC CẢ Ở KHỎE RE ============
=== thanh_xin_nghi_mg_khoe_re_mo ===
# noi:phong_kham_khoe_re
_Phòng khám Đa Khoa Khỏe Re. Cô lễ tân ngẩng lên, thấy bạn, cười như gặp người nhà._
phu_le_tan_khoe_re: Lại là anh {thanh_xin_nghi}! Giấy nghỉ ốm hả anh? Giá niêm yết 100.000đ nha. Ho hay thì em bớt.
-> END

=== thanh_xin_nghi_mg_khoe_re_dat ===
_Bạn ho một tràng trầm bổng, than đúng triệu chứng "viêm họng do… thời tiết chuyển mùa". Cô lễ tân gật gù._
phu_le_tan_khoe_re: Ho nghe có nghề quá anh. 80 ngàn thôi. Tặng anh vỉ kẹo ngậm bạc hà.
~ tien_cong(-80000)
~ nhan(giay_nghi_om)
~ uong(10)
~ son_so_giay_nghi_om = son_so_giay_nghi_om + 1
{ son_so_giay_nghi_om >= 5:
    phu_le_tan_khoe_re: Anh mua đủ 5 tờ rồi! Tặng anh thẻ tích điểm khách VIP nè. Tờ thứ 10 miễn phí!
}
-> END

=== thanh_xin_nghi_mg_khoe_re_truot ===
_Bạn ho. Cô lễ tân chưa kịp nói gì, bác sĩ bước ra._
phu_bac_si_khoe_re: Lại là em à? Vô đây khám thật coi. *(nghe phổi)* Khỏe re. Phổi như ca sĩ. Giấy thì vẫn bán, 100 ngàn, không bớt.
~ tien_cong(-100000)
~ nhan(giay_nghi_om)
~ uong(10)
~ son_so_giay_nghi_om = son_so_giay_nghi_om + 1
_"Phổi như ca sĩ." Bác sĩ nói vô tình. Bạn nghe mà giật mình._
-> END

// ============ ☕ ĐÊM NHẠC SỐNG ẢO ============
=== thanh_xin_nghi_mg_song_ao_mo ===
# gio:20:00 # noi:quan_song_ao
_Quán cà phê Sống Ảo. Ghế cao, cây đàn, đèn vàng. Canh đúng phách, chọn bài hợp khách._
_Cẩn thận: {sieu_nhan_hong} hay ngồi bàn trong góc._
-> END

=== thanh_xin_nghi_mg_song_ao_dat ===
_Bài cuối cùng. Cả quán đứng dậy vỗ tay. Hộp đàn đầy tiền lẻ._
~ tien_cong(RANDOM(200, 500) * 1000)
~ uong(20)
~ son_mo(5)
~ cang_thang(-10)
phu_chu_quan_song_ao: Trà đào của em nè. Tối nay khách đông nhờ em đó {thanh_xin_nghi}.
-> END

=== thanh_xin_nghi_mg_song_ao_truot ===
_Bạn lỡ nhịp ở điệp khúc. Dây đàn đứt ở bài thứ ba. Khách lục tục về. Hộp đàn có 3 tờ 10.000đ và một cái bật lửa._
~ tien_cong(30000)
~ uong(20)
~ son_mo(1)
phu_chu_quan_song_ao: Thôi, hôm nay xui. Trà đào vẫn free nha em.
-> END

// ============ 🎙️ TẬP HÁT LÉN ============
=== thanh_xin_nghi_mg_tap_hat_mo ===
# gio:12:15 # noi:studio_tang_2
_Studio tầng 2, giờ nghỉ trưa. Vừa tập vừa canh tiếng bước chân ngoài cửa. Có người tới thì giả vờ đang "test micro cho anh Phát"._
-> END

=== thanh_xin_nghi_mg_tap_hat_dat ===
_Một giờ tập. Ba lần nghe tiếng bước chân, ba lần bạn kịp nói "Alo alo, test, một hai ba, cho anh Phát". Không ai nghi._
~ son_mo(8)
~ an(40)
_Trên bàn mixer có hộp cơm ai bỏ quên. Bạn ăn. Coi như cát-xê._
-> END

=== thanh_xin_nghi_mg_tap_hat_truot ===
_Bạn hát say quá, không nghe tiếng bước chân. Cửa mở. {it} đứng đó, tay cầm cuộn dây cáp. Đèn đỏ trên bàn mixer đang sáng: "REC"._
it: …Tui test âm thanh. Máy tự ghi. Restart chưa? À, không cần.
~ son_mo(4)
~ son_bi_bao_ghi_am = true
_{it} gật đầu rồi đi. Trong ổ cứng phòng server giờ có thêm một file tên "test_mic_trua_08.wav". Dài 47 phút._
-> END

// ============ 🚐 ĐIỀU XE ĐOÀN QUAY ============
=== thanh_xin_nghi_mg_dieu_xe_mo ===
# noi:ban_dieu_phoi
_Bản đồ Quận Hóng giờ cao điểm. Đại Lộ Kẹt Xe thì hay ngập. Hẻm thì xe đoàn không lọt. Chọn đường cho xe đoàn quay tới chỗ {sieu_nhan_hong} trước khi ổng bỏ đi giúp người._
-> END

=== thanh_xin_nghi_mg_dieu_xe_dat ===
_Xe tới đúng giờ. {sieu_nhan_hong} đang chuẩn bị đi gỡ diều cho con nít, thì máy quay tới kịp. Quay luôn._
~ tien_cong(100000)
~ nhan(banh_mi)
~ uy_tin = uy_tin + 2
{ son_khung_gio_giup_nguoi:
    { RANDOM(1, 10) <= 3:
        ~ follow(40000)
        _Clip "Siêu Nhân Hồng gỡ diều" lên xu hướng. Anh em đoàn quay ném cho bạn ổ bánh mì thịt mua dư._
    - else:
        ~ follow(5000)
    }
- else:
    ~ follow(5000)
}
-> END

=== thanh_xin_nghi_mg_dieu_xe_truot ===
_Xe kẹt ở Đại Lộ Kẹt Xe, nước ngập tới bánh. Khi tới nơi, {sieu_nhan_hong} đã đi giúp một người khác, ở một quận khác, không ai quay._
~ follow(-5000)
~ uy_tin = uy_tin - 2
~ cang_thang(5)
-> END
