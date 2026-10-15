// ============================================================
// CHƯƠNG 1: "MA MỚI, THÙ CŨ" (1/10 – 4/10)
// ============================================================

// ------------------------------------------------------------
=== ran_doc_0110_cong_cong_ty ===
# ngay:1 # gio:07:58 # noi:cong_cong_ty
_7 giờ 58. Bạn phóng xe vào cổng, tim đập thình thịch. Ngày đầu đi làm mà trễ là toang._
cho: Gâu! Gâu gâu!
bac_bao_ve: Tuất, im nào. Cháu là nhân viên mới à? Gửi xe bên kia, còn 2 phút nữa là 8 giờ đấy.
* [😇 "Dạ con cảm ơn bác! Con là {ran_doc}, mới vô làm hôm nay ạ."]
    ~ qh("bac_bao_ve", 5)
    bac_bao_ve: Ừ. Đi nhanh lên. Máy chấm công hay đơ lắm.
* [🐾 Cúi xuống xoa đầu {cho} trước đã.]
    ~ qh("cho", 10)
    cho: Gâu! *(vẫy đuôi)*
    bac_bao_ve: Nó quý cháu đấy. Ít ai nó quý ngay đâu. Mà nhanh lên, 7 giờ 59 rồi!
    ~ cang_thang(5)
* [🏃 Chạy thẳng vào trong, không nói gì.]
    bac_bao_ve: …
    _Bác {bac_bao_ve} nhìn theo bạn, uống một ngụm trà đá._
- -> END

// ------------------------------------------------------------
=== ran_doc_0110_ky_hop_dong ===
# ngay:1 # gio:09:00 # noi:phong_hop_tang_2
_Phòng họp tầng 2 chật kín người. Trên bàn là một xấp hợp đồng dày cộp. Ở đầu bàn, một người mặc bộ đồ siêu nhân màu hồng đang tạo dáng chụp hình._
giam_doc: Các em! Hôm nay là một ngày lịch sử của {cong_ty}! Xin giới thiệu đối tác chiến lược của chúng ta: Siêu Nhân Hồng!
sieu_nhan_hong: Chào cả nhà! Hồng không phải màu, Hồng là thái độ!
_Cả phòng vỗ tay. {sieu_nhan_hong} tháo găng tay để ký. Trên mu bàn tay trái có một vết sẹo nhỏ._
_Bạn đứng hình. Vết sẹo đó, cái xóm Cây Me, cái nhà kho tối om… Là {sieu_nhan_hong}. Chắc chắn là {sieu_nhan_hong}._
~ phat_hien(hieu_ech)
ke_toan: *(thì thầm với {giam_doc})* Anh ơi, anh đọc giúp em trang 47 trước khi ký đã…
giam_doc: Thôi em, đối tác đang chờ. Anh không ép, tùy em… mà thôi ký luôn.
_{giam_doc} ký. 5 tỷ về tài khoản. Cả phòng reo hò._
~ follow(0)
-> ran_doc_0110_bat_tay

= ran_doc_0110_bat_tay
sieu_nhan_hong: *(đi vòng bàn bắt tay từng người, dừng lại trước bạn)* Chào em! Em là nhân viên mới hả? Anh là Siêu Nhân Hồng nè!
* [😇 "Dạ, em chào anh. Em là {ran_doc}, mới vô làm hôm nay."]
    sieu_nhan_hong: Tên đẹp ghê! Có gì cần giúp cứ kêu anh nha!
    _Không nhận ra. Không một chút nào._
* [🐍 "Anh có nhớ xóm Cây Me hông? Hồi đó có thằng nhóc tên {ran_doc} Ếch á."]
    _{sieu_nhan_hong} khựng lại 2 giây._
    sieu_nhan_hong: Hông nhớ… mà tên dễ thương ghê! {ran_doc} Ếch! Haha!
    ~ rd_moi_han = rd_moi_han + 20
    ~ rd_nghi_ngo = rd_nghi_ngo + 5
* [😶 Bắt tay thật mạnh, không nói gì.]
    sieu_nhan_hong: Úi! Tay em khỏe dữ!
    chi_dai: *(nhíu mày)* Thằng nhỏ này sao lạ vậy ta?
    ~ qh("chi_dai", -5)
- _{sieu_nhan_hong} đi tiếp sang người khác. Bạn nhìn theo bộ đồ hồng, bàn tay vẫn còn nắm chặt._
_Cả công ty muốn Siêu Nhân Hồng nổi tiếng. Còn bạn thì không._
-> END

// ------------------------------------------------------------
=== ran_doc_0110_trua_com_tam ===
# ngay:1 # gio:12:05 # noi:quan_com_tam
_Quán cơm tấm vỉa hè. Bàn nào cũng kín người của {cong_ty}. Có hai chỗ trống._
* [Ngồi với {hong_hot} và {designer}, bàn ồn nhất.]
    -> ran_doc_0110_ban_hong_hot
* [Ngồi với {thuc_tap_sinh}, đang ăn một mình.]
    -> ran_doc_0110_ban_duy

= ran_doc_0110_ban_hong_hot
hong_hot: Ủa, nhân viên mới hả? Ngồi đi ngồi đi! Ông thấy cái vụ 5 tỷ hông? Ối dồi ôi, công ty mình trúng số rồi!
designer: Trúng số mà poster tui vẫn phải sửa 3 lần trước 10 giờ sáng mai đó bà.
* [🐍 "Mà nghe nói hợp đồng có điều khoản gì đó ở trang 47, chị Thương lo lắm."]
    hong_hot: HẢ? Trang 47 gì? Kể nghe coi!
    ~ rd_do_doc = rd_do_doc + 10
    ~ rd_nghi_ngo = rd_nghi_ngo + 5
    ~ qh("hong_hot", 10)
    hong_hot: Trời đất, để chiều tui hỏi thử bả. Ông này được nha, mới vô mà hóng nhanh dữ!
* [😇 "Dạ em mới vô, em nghe mọi người kể là chính."]
    hong_hot: Ngoan ghê! Để tui kể cho nghe nè. Công ty này nhìn vậy chứ drama nhiều lắm…
    ~ rd_so_tin_mat = rd_so_tin_mat + 1
    ~ qh("hong_hot", 5)
    ~ qh("designer", 5)
- ~ an(55)
-> END

= ran_doc_0110_ban_duy
thuc_tap_sinh: Dạ anh ngồi đi ạ! Em là {thuc_tap_sinh}, thực tập sinh phòng sản xuất ạ.
_Người này nhìn lớn tuổi hơn bạn. Nhiều._
* [🤝 "Ông lớn hơn tui mà, gọi tên được rồi."]
    thuc_tap_sinh: Dạ… dạ thôi, em thực tập mà anh. Phải đúng phép ạ.
    ~ qh("thuc_tap_sinh", 15)
* [🐍 "Thực tập mà lớn tuổi vậy, chắc có chuyện gì hả?"]
    thuc_tap_sinh: *(cười gượng)* Dạ… em đổi nghề thôi ạ.
    _{thuc_tap_sinh} giấu cái thẻ ngân hàng màu bạc lấp lánh vào túi rất nhanh._
    ~ rd_so_tin_mat = rd_so_tin_mat + 1
    ~ qh("thuc_tap_sinh", -5)
- ~ an(55)
-> END

// ------------------------------------------------------------
=== ran_doc_0110_bi_bat_qua_tang ===
# ngay:1 # gio:15:10 # noi:pantry # ngau_nhien
_Bạn đang nói nhỏ với {designer} ở pantry về bộ đồ hồng "lố" của Siêu Nhân Hồng. Từ phía sau có tiếng ho nhẹ…_
ke_toan: Khụ khụ. Nói gì vui vậy mấy đứa? # hen_gio:5
* [😇 "Dạ tụi em đang khen chị tính lương nhanh quá trời luôn á!"]
    { RANDOM(1, 10) <= 6:
        ke_toan: Ờ… lương chưa về mà khen gì. Thôi làm việc đi.
    - else:
        ke_toan: Lương còn chưa phát mà khen nhanh. Tui nghe hết rồi nha.
        ~ rd_nghi_ngo = rd_nghi_ngo + 10
        ~ qh("ke_toan", -10)
    }
* [🐍 "Dạ là {designer} nói chứ không phải em."]
    designer: Ủa?!
    ~ qh("designer", -40)
    ~ qh("sales", -20)
    ~ rd_do_doc = rd_do_doc + 10
* [😶 Chạy ra nhà vệ sinh.]
    ~ rd_nghi_ngo = rd_nghi_ngo + 15
* [⏱️ (Không chọn kịp)]
    ke_toan: *(ghi vào cuốn sổ nhỏ)* Nhân viên mới. Ngày đầu tiên. Ghi nhận.
    ~ qh("ke_toan", -15)
    ~ rd_nghi_ngo = rd_nghi_ngo + 10
- -> END
