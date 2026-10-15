// ============================================================
// IT: BẢO · CHƯƠNG 6: "NGÀY INTERNET QUỐC TẾ" (28/10 – 31/10)
// ============================================================

// ------------------------------------------------------------
=== it_2810_video_nham ===
# ngay:28 # gio:03:10 # noi:phong_server # bat_buoc
_3 giờ 10 sáng. Bạn đang ngủ trên ghế xếp thì điện thoại báo: fanpage {cong_ty} vừa đăng một video mới._
_Video dài 2 phút, dựng rất đẹp: toàn cảnh {quan_ly_idol} cười, {quan_ly_idol} ngủ gục, {quan_ly_idol} cầm hai điện thoại. Cuối video có dòng chữ: "Anh có biết là có người luôn nhìn anh không?"_
_Một con cú nhỏ giấu ở góc khung hình. Bạn biết ngay video này của ai. Và biết ngay: nó bị xuất nhầm._
_Đã có 340 lượt xem. Bạn là admin kỹ thuật của trang._
* [🗑️ Gỡ video ngay lập tức.]
    _Bạn gỡ. 340 người đã xem, nhưng 3 giờ sáng thì ai cũng tưởng mình nằm mơ._
    _Năm phút sau, {editor} nhắn: "Anh… anh thấy rồi hả." Bạn trả lời: "Không thấy gì."_
    ~ qh("editor", 30)
    ~ it_lt(5)
    ~ it_cam_on()
* [💬 Nhắn {editor} trước, hỏi có muốn gỡ không.]
    editor: *(gõ rất lâu)* …Anh để đó đi. Em mệt giấu rồi.
    _Sáng hôm đó, video có 200.000 lượt xem. {quan_ly_idol} xem nó 4 lần trong phòng nghệ sĩ, cửa đóng._
    ~ qh("editor", 20)
    ~ follow(20000)
    ~ phat_hien(linh_thich_thai)
* [😴 Ngủ tiếp. Mai tính.]
    _Sáng mai, video có 500.000 lượt xem. {hong_hot} gào trong group: "ĐÁM CÁ TƯƠI!". {editor} không tới công ty._
    ~ follow(30000)
    ~ qh("editor", -15)
    ~ phat_hien(linh_thich_thai)
- { nguoi_theo_doi < 800000:
    _Ngày 28/10, mốc 4. Chưa tới 800.000. Trên mạng bắt đầu có tin: LL-Entertainment đang "rất quan tâm" tới {sieu_nhan_hong}._
    ~ cang_thang(10)
- else:
    _Ngày 28/10, mốc 4: qua 800.000. Bạn kiểm tra lại server 3 lần, như kiểm tra khóa cửa trước khi đi xa._
}
-> END

// ------------------------------------------------------------
=== it_2910_wifi_sap ===
# ngay:29 # gio:08:10 # noi:tang_1 # bat_buoc
_Ngày Internet Quốc tế. 8 giờ 10. Wifi sập. Cả tòa nhà. Không một vạch sóng._
_Bạn nghe tiếng bước chân dồn dập từ tầng 2 xuống: {truong_phong}, {hong_hot}, {sales}, {dan_dau_tu}, {chua_te_deadline}…_
hong_hot: ANH {it}! Chiến dịch đứng hình rồi! Fanpage không đăng được! Tóp-tóp không lên!
editor: *(mắt đỏ)* Video "16 năm"… kẹt ở 99%… anh {it} ơi…
* [📱 Phát 4G từ điện thoại cho máy của {hong_hot} trước.]
    hong_hot: Được rồi! Để tui phát tiếp cho cả phòng. Mật khẩu: "nghegichua"!
    _Mạng tạm bợ chạy được. Chiến dịch nhích từng bước như người bò trong sa mạc._
    ~ follow(5000)
    ~ qh("hong_hot", 10)
    ~ tien_cong(-100000)
* [🏃 "Đi tìm nguyên nhân." Chạy xuống tầng trệt.]
    _Bạn chạy. Cả đám chạy theo. Đây là lần đầu tiên trong 10 năm, cả công ty đi theo IT._
    ~ it_do_toi(5)
* [🔄 Khởi động lại router.]
    _Bạn khởi động lại. Đèn router vẫn đỏ. Khởi động lại lần nữa. Vẫn đỏ. Lần đầu tiên, tắt đi bật lại không cứu được._
    ~ it_do_toi(10)
    ~ cang_thang(10)
- _Ở chòi bảo vệ, Bác {bac_bao_ve} đã dựng một tấm bìa: "TỔNG ĐÀI NHẮN TIN BẰNG GIẤY". {chi_dai} đứng cạnh, cầm bộ đàm điều phối._
chi_dai: {it}. Em lo cái mạng. Chuyện nhắn tin để chị với bác lo.
-> END

// ------------------------------------------------------------
=== it_2910_tu_mang ===
# ngay:29 # gio:09:30 # noi:tu_mang_tang_tret # bat_buoc
{ it_lay_ga_cao_su:
    ~ it_thu_pham_29 = ran_thu_hai
- else:
    ~ it_thu_pham_29 = "cho"
}
_Bạn mở tủ mạng tầng trệt. 48 sợi dây xanh. Sợi dây chính, cái sợi nuôi cả tòa nhà, đứt làm đôi._
{ it_thu_pham_29 == "cho":
    _Chỗ đứt tua rua, ướt nhẹp, đầy dấu răng. Bên cạnh, con gà cao su màu vàng nằm nghiêng, như vừa được giải cứu._
- else:
    _Chỗ đứt phẳng lì, gọn gàng. Vết cắt bằng kéo. Không phải răng. Không phải chuột. Có người._
}
dan_dau_tu: Router cũ quá chứ gì! Anh nói rồi mà!
truong_phong: Cậu {it}, mình họp nhanh về nguyên nhân sự cố nhé.
* [📜 Mở log camera hành lang tầng trệt.]
    ~ it_tim_ra_thu_pham = true
    { it_thu_pham_29 == "cho":
        _Camera 3:12 sáng: {cho} chui vào khe tủ, cào cào, gặm gặm, rồi lôi ra con gà cao su, vẫy đuôi tự hào._
        _Cả đám đứng sau lưng bạn xem. Im lặng. Rồi {hong_hot} bật cười trước tiên._
        hong_hot: Thủ phạm có lông! Ối dồi ôi!
        bac_bao_ve: *(thở dài)* Tuất. Lại đây.
        cho: Ẳng… *(cúi đầu, đuôi vẫn hơi vẫy)*
        ~ qh("cho", -5)
        ~ tinh_than_cong_ty = tinh_than_cong_ty + 5
    - else:
        _Camera 23:40 tối qua: một bóng người đội mũ lưỡi trai, cầm kéo, đứng trước tủ mạng đúng 40 giây. Rồi quay mặt lại một chút, đủ để bạn nhận ra._
        _Là {ten(ran_thu_hai)}._
        ~ phat_hien(ran_thu_hai_lo_mat)
        ~ qh(ran_thu_hai, -40)
        ~ uy_tin = uy_tin + 10
        bac_bao_ve: *(nhìn màn hình rất lâu)* Thế à. Bác không thấy gì đâu. Nhưng camera thì thấy.
    }
    ~ it_do_toi(-30)
* [🔧 Kệ thủ phạm. Nối dây trước đã.]
    _Bạn tuốt vỏ, bấm đầu dây, nối lại trong 20 phút. Đèn router chuyển xanh. Cả tòa nhà reo lên._
    ~ it_on(10)
    ~ it_do_toi(-10)
    _Nhưng không ai biết vì sao dây đứt. Và tin đồn "tại router cũ" lan nhanh hơn wifi._
    ~ it_do_toi(10)
* [😶 "Router cũ. Đúng rồi."]
    _Bạn nhận lỗi để mọi chuyện qua nhanh. Mọi chuyện qua nhanh thật. Cùng với uy tín của bạn._
    ~ it_do_toi(20)
- _Bạn nối dây xong lúc 11 giờ. Video "16 năm" của {editor} nhích từ 99% lên 100%._
~ it_on(10)
~ follow(10000)
-> END

// ------------------------------------------------------------
=== it_2910_tong_dai_giay ===
# ngay:29 # gio:15:00 # noi:choi_bao_ve
_Chiều. Mạng đã về, nhưng chòi bảo vệ vẫn còn đầy giấy nhắn. Bác {bac_bao_ve} đang xếp từng tờ, như xếp thư._
bac_bao_ve: Cả buổi sáng các cháu nhắn nhau bằng giấy. Hay phết. Không ai nói xấu ai cả. Nói xấu bằng giấy thì ngại.
_Trong xấp giấy có một tờ ghi: "Cảm ơn anh {it}. Không có anh chắc tụi em chết." Không ký tên._
* [💬 "Bác, con giữ tờ này được không?"]
    bac_bao_ve: Của cháu mà. Cầm đi.
    _Bạn gấp tờ giấy, bỏ vào túi áo, cạnh cuộn băng keo đen._
    ~ it_cam_on()
    ~ cang_thang(-15)
* [🍵 Ngồi xuống uống trà với bác.]
    bac_bao_ve: Mười năm cháu ở đây. Hôm nay là lần đầu cả công ty chạy theo cháu nhỉ.
    it: Chạy để chửi.
    bac_bao_ve: Chửi là còn cần. Không ai chửi mới đáng lo.
    ~ qh("bac_bao_ve", 10)
    ~ uong(25)
- -> END

// ------------------------------------------------------------
=== it_3010_don_kho ===
# ngay:30 # gio:08:00 # noi:gam_cau_thang
_Trước họp đánh giá, {hr} cho dọn kho. Ai cũng phải dọn. {thuc_tap_sinh} được giao dọn gầm cầu thang._
thuc_tap_sinh: Dạ anh {it} ơi, ở đây có một đống đồ lạ ạ. Chìa khóa, son môi, điện thoại cũ, một cái găng tay hồng… Em bỏ hết vô bao rác ạ?
_Đó là kho báu của {cho}. Bạn nhìn cái bao rác đen. Rồi nhìn {cho} đang đứng ở chân cầu thang, mắt to tròn._
* [🛡️ "Để nguyên. Đây là… kho thiết bị IT."]
    thuc_tap_sinh: Dạ? Son môi là thiết bị IT ạ?
    it: Ừ. Để test màn hình.
    thuc_tap_sinh: Dạ em hiểu rồi ạ!
    ~ it_bao_ve_kho_tuat = true
    ~ qh("cho", 25)
    ~ qh("thuc_tap_sinh", 5)
    cho: Gâu! *(chạy tới, đặt lên chân bạn một cây xúc xích đã gặm một nửa)*
    ~ nhan(xuc_xich)
* [🧤 Chỉ lấy cái găng tay hồng ra, phần còn lại để yên.]
    _Bạn cất chiếc găng tay hồng vào túi. Biết đâu có ngày dùng tới._
    ~ nhan(gang_tay_hong)
    ~ it_bao_ve_kho_tuat = true
    ~ qh("cho", 10)
* [😶 "Ừ, dọn đi."]
    _Bao rác đen được buộc lại. {cho} nằm xuống chân cầu thang, không ăn sáng._
    ~ qh("cho", -20)
- -> END

// ------------------------------------------------------------
=== it_3010_tong_duyet ===
# ngay:30 # gio:19:00 # noi:san_khau_dem_hong # bat_buoc
_Tổng duyệt Đêm Hồng. Sân khấu ngoài trời. 64 cây đèn, 12 cái loa, 4 micro, 1 cầu dao tổng. Bạn đứng sau cánh gà, kiểm tra từng thứ._
chi_dai: {it}. Đêm mai là đêm cuối. Em cần gì, nói chị. Bây giờ.
_Bạn nhìn danh sách. Thiếu một cái khóa cho tủ cầu dao. Thiếu dây dự phòng. Thiếu người thứ hai đứng cạnh cầu dao._
* [🔒 "Khóa tủ cầu dao. Chìa em giữ."]
    chi_dai: Được. Chị mua liền.
    _Mười phút sau {chi_dai} mang về một ổ khóa to như nắm tay. Bạn khóa tủ, đeo chìa vào cổ._
    ~ it_on(10)
    ~ it_dem_hong_san_sang = true
* [🧶 "Dây dự phòng. Mọi thứ, hai bộ."]
    _Bạn với {chi_dai} lục kho tới 11 giờ đêm, đủ hai bộ dây cho mọi thiết bị. Tay ai cũng đen nhẻm._
    ~ it_on(15)
    ~ nghi(-20)
    { it_on_dinh >= 70:
        ~ it_dem_hong_san_sang = true
    }
* [👤 "Một người canh cầu dao với em."]
    chi_dai: Để chị kêu Bác {bac_bao_ve}. Bác không rời vị trí bao giờ.
    bac_bao_ve: Ừ. Bác đứng. Cháu bấm đèn, bác giữ cầu dao. Đứa nào đụng vào, có Tuất.
    cho: Grừ… *(gật gù rất nghiêm túc)*
    ~ it_dem_hong_san_sang = true
    ~ qh("bac_bao_ve", 10)
* [😴 "Đủ rồi chị. Em ngủ chút."]
    chi_dai: Ngủ đi. Mai có gì là chị réo.
    ~ nghi(30)
- { it_su_co_am_thanh:
    _Bạn nhớ những lần rớt mạng, rớt hình trong tháng. Đêm mai không được có lần nào nữa._
}
-> END

// ------------------------------------------------------------
=== it_3110_canh_ga ===
# ngay:31 # gio:18:00 # noi:san_khau_dem_hong # bat_buoc
_Đêm Hồng Halloween. Cả công ty hóa trang. {giam_doc} hóa trang "Ông Kẹ Ngân Hàng", tay cầm cuốn sổ nợ bằng bìa cứng. Không ai dám cười._
_Bạn đứng sau cánh gà, tai đeo bộ đàm, tay đặt trên bàn điều khiển đèn. Bên cạnh là tủ cầu dao tổng._
_Điện thoại bạn rung. {thanh_xin_nghi}: "Anh {it}, 20:00 em thi chung kết. Nếu em không ở đây, anh lo giùm em phần lịch trình đèn nha."_
* [💬 "Đi thi đi. Đèn anh lo."]
    _{thanh_xin_nghi} gửi lại một sticker con mèo cúi đầu. Rồi một tin: "Anh là người đầu tiên biết mà hông nói với ai. Cảm ơn anh."_
    ~ qh("thanh_xin_nghi", 15)
    ~ it_cam_on()
* [📺 Mở sẵn kênh Đài Tivi Hóng trên màn hình phụ.]
    _Bạn sẽ vừa đánh đèn, vừa liếc xem {thanh_xin_nghi} hát. Đa nhiệm là kỹ năng sống còn của IT._
    ~ qh("thanh_xin_nghi", 5)
- { it_thu_pham_29 != "cho" and not it_tim_ra_thu_pham:
    _18:40. Có ai đó đi ngang tủ cầu dao, dừng lại, nhìn ổ khóa, rồi đi tiếp. Bạn không thấy rõ mặt. Chỉ ngửi thấy mùi gì đó như… lá chuối._
    { not it_dem_hong_san_sang:
        ~ it_su_co_am_thanh = true
    }
}
-> END

// ------------------------------------------------------------
=== it_3110_dem_hong ===
# ngay:31 # gio:19:30 # noi:san_khau_dem_hong # bat_buoc
_19:30. Đèn tắt. Màn hình lớn chiếu phim ngắn "Người Hùng Không Tên". Rồi video "16 năm" của {editor}._
{ it_ban_thu_cho == "editor":
    _Nhạc nền của video là bản thu mộc "Công Viên" năm 2015. Cả khán đài im phăng phắc. Ở hàng ghế đầu, {idol_het_thoi} ôm mặt._
}
{ it_ban_thu_cho == "idol_het_thoi":
    _Giữa chương trình, {idol_het_thoi} xin lên hát một bài, giọng mộc, không nhạc nền. "Công Viên", y như bản năm 2015._
}
_Rồi tới lượt {sieu_nhan_hong}. Bạn bấm đèn theo nhạc. Hồng, hồng, trắng, hồng. Đúng phách. Khán giả hô theo._
{ it_su_co_am_thanh and not it_dem_hong_san_sang:
    _Giữa bài thứ hai, loa trái tắt phụt. Có ai đó đã đụng vào dây. Bạn chạy ra nối lại, mất 2 phút. 2 phút dài nhất đời bạn._
    ~ follow(-30000)
- else:
    _Không một tiếng hú. Không một cây đèn tắt. Mọi thứ chạy như một cái đồng hồ, như thể cả tháng qua chỉ để luyện cho đêm nay._
    ~ follow(100000)
}
_Bài cuối. {sieu_nhan_hong} đứng giữa sân khấu, đưa tay lên chiếc mũ hồng. Ngập ngừng. Trong bộ đàm, giọng {chi_dai}: "{it}, đèn."_
_Bạn có thể chiếu một vệt sáng trắng thật rõ vào giữa sân khấu. Hoặc hạ tất cả về hồng mờ, cho người đứng đó một chỗ để trốn._
* [💡 Đèn trắng. Rõ. Cho mọi người thấy.]
    _Một vệt sáng trắng. {sieu_nhan_hong} tháo mũ. Một khuôn mặt bình thường, mắt đỏ, đang cười. Khán đài im 3 giây, rồi vỡ òa._
    ~ nguyen_thao_mu_dem_hong = true
    ~ follow(50000)
    ~ qh("sieu_nhan_hong", 15)
* [🩷 Hồng mờ. Cho {sieu_nhan_hong} tự chọn trong bóng tối.]
    _Đèn hồng dịu xuống. {sieu_nhan_hong} đứng yên rất lâu, rồi bỏ tay xuống, cười sau lớp mũ. "Hồng là thái độ!" Khán đài hô theo._
    ~ qh("sieu_nhan_hong", 10)
    ~ follow(20000)
* [⚡ Bấm 8 lần đèn hồng liên tục theo nhạc. Luật công ty.]
    _Đèn hồng nhấp nháy như pháo hoa. Khán giả hét lên. Khoảnh khắc trôi qua. Chiếc mũ vẫn ở yên trên đầu._
    ~ follow(30000)
- { it_dem_hong_san_sang:
    _Bộ đàm rè rè. Giọng Bác {bac_bao_ve}, đứng cạnh tủ cầu dao suốt buổi: "Xong rồi đấy cháu. Không ai đụng vào cái gì cả."_
- else:
    _Show kết thúc. Bạn buông tay khỏi bàn điều khiển. Tay bạn run, như vừa giữ cả công ty trong 2 tiếng._
}
-> END
