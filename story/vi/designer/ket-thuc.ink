// ============================================================
// DESIGNER · KẾT THÚC
// Thứ tự ưu tiên khi đánh giá (30/10):
//   1. Lộ Logo Lá Chuối   (Độ Lộ = 100, có thể xảy ra bất cứ lúc nào)
//   2. Đổi Màu Áo          (Máu Cam ≤ 20 + đã nhận full-time LL)
//   3. Bản Sửa Thứ 100     (Số Lần Bị Sửa ≥ 100 + Cái Tôi ≤ 10)
//   4. Hai Mang Chính Nghĩa (bí mật)
//   5. Bản Đầu Tiên Muôn Năm
//   6. Song Kiếm Hợp Bích
//   Không khớp kết thúc nào: Cái Tôi + Máu Cam ≥ 110 thì "Bản Đầu Tiên Muôn Năm",
//   còn lại "Bản Sửa Thứ 100".
// ============================================================

// ------------------------------------------------------------
=== designer_3010_danh_gia ===
# ngay:30 # gio:17:30 # noi:ban_thiet_ke # bat_buoc
_17 giờ 30. Buổi đánh giá đã xong. Bạn ngồi một mình ở bàn thiết kế, nhìn màn hình tắt. Mọi thứ đã được quyết định._
{
- ds_do_lo >= 100:
    ~ chot_ket_thuc("lo_logo_la_chuoi")
    -> designer_kt_lo_logo_la_chuoi
- ds_mau_cam <= 20 && ds_nhan_fulltime_ll:
    ~ chot_ket_thuc("doi_mau_ao")
    -> designer_kt_doi_mau_ao
- ds_so_lan_bi_sua >= 100 && ds_cai_toi <= 10:
    ~ chot_ket_thuc("ban_sua_thu_100")
    -> designer_kt_ban_sua_thu_100
- ds_nhan_hong_ngoai && ds_giau_chu_g && ds_mau_cam >= 80 && ds_do_lo < 50 && not nguyen_theo_ll:
    ~ chot_ket_thuc("hai_mang_chinh_nghia")
    -> designer_kt_hai_mang_chinh_nghia
- ds_cai_toi >= 70 && ds_mau_cam >= 60 && nguoi_theo_doi >= 1000000 && ds_gianh_lai_cong:
    ~ chot_ket_thuc("ban_dau_tien_muon_nam")
    -> designer_kt_ban_dau_tien_muon_nam
- qh_sales >= 80 && ds_cat_dut_ll && ds_tien_freelance >= 8000000 && ds_huyen_deal_that:
    ~ chot_ket_thuc("song_kiem_hop_bich")
    -> designer_kt_song_kiem_hop_bich
- ds_cai_toi + ds_mau_cam >= 110:
    ~ chot_ket_thuc("ban_dau_tien_muon_nam")
    -> designer_kt_ban_dau_tien_muon_nam
- else:
    ~ chot_ket_thuc("ban_sua_thu_100")
    -> designer_kt_ban_sua_thu_100
}

// ------------------------------------------------------------
// Sự kiện tức thời: Độ Lộ Lá Chuối chạm 100
=== designer_tudo_lat_tay ===
# ngau_nhien # bat_buoc # dieu_kien:ds_do_lo>=100
_Điện thoại rung liên tục. Group công ty. Rồi tin nhắn riêng của {hr}: "Em rảnh không, lên phòng họp tầng 2 xíu."_
_Không phải "uống trà". Là "phòng họp". Bạn biết rồi._
~ chot_ket_thuc("lo_logo_la_chuoi")
-> designer_kt_lo_logo_la_chuoi

// ------------------------------------------------------------
// Sự kiện: Số Lần Bị Sửa chạm 100
=== designer_tudo_het_cuu ===
# ngau_nhien # dieu_kien:ds_so_lan_bi_sua>=100
{ ds_het_cuu:
    -> END
}
~ ds_het_cuu = true
_Lần sửa thứ 100. Bạn mở file. Bạn nhìn nó. Bạn không làm gì cả._
_Cả ngày hôm đó, bạn ngồi im trước màn hình. Con trỏ chuột nhấp nháy. Không ai dám tới gần._
hong_hot: *(nói nhỏ với {sales})* Bả… hết cứu rồi hả?
sales: Không. Bả đang… nghỉ. Ai bắt bả sửa nữa là chị chỉ mặt.
~ nghi(-30)
~ cang_thang(20)
~ ds_toi(-5)
* [🎨 Cuối ngày, mở một tờ giấy trắng. Vẽ một con cá voi hồng. Cho mình.]
    ~ ds_toi(10)
    ~ cang_thang(-15)
    _Con cá voi không cần ai duyệt. Bạn dán nó lên màn hình. Mai bạn đi làm tiếp._
* [😶 Về nhà. Không vẽ gì.]
    _Bàn vẽ ở căn 203 bám thêm một lớp bụi mỏng._
- -> END

// ============================================================
// 😄 1. BẢN ĐẦU TIÊN MUÔN NĂM
// ============================================================
=== designer_kt_ban_dau_tien_muon_nam ===
# dieu_kien:ket_thuc_ban_dau_tien_muon_nam
_Một tuần sau Đêm Hồng._
{ nguoi_theo_doi >= 1000000:
    _Siêu Nhân Hồng vượt một triệu người theo dõi. Tấm backdrop của bạn được báo chí gọi là "bầu trời hồng có học"._
- else:
    _Siêu Nhân Hồng chưa tới một triệu. Nhưng tấm backdrop của bạn thì ai cũng chụp lại, và người ta nhớ nó lâu hơn con số._
}
_Phòng giám đốc. {giam_doc} ngồi sau bàn, trên tường vẫn là logo chữ G bản năm 2010._
giam_doc: {designer}. Anh đọc lại hết rồi. Poster dắt bà cụ, phông vẽ tay, backdrop. Không phải ý tưởng của {truong_phong}.
giam_doc: Từ tháng 11, em là Trưởng nhóm Thiết kế. Lương tăng 20%. Lần này anh hứa có giấy.
_Ông đưa bạn tờ quyết định. Giấy trắng, mộc đỏ, chữ ký nguệch ngoạc._
giam_doc: À mà… em sửa nhẹ cái quyết định này giúp anh nhé? Font nhìn hơi… chưa đủ wow.
_Bạn nhìn tờ giấy. Rồi nhìn {giam_doc}. Rồi bạn cười, lần đầu tiên trong tháng, cười thật to._
designer: Dạ không anh. Cái này là bản 1. Bản 1 là bản đẹp nhất.
giam_doc: *(ngớ người, rồi cười theo)* Ừ. Ừ, đúng. Anh không ép, tùy em.
_Tối đó, bạn đóng khung tờ quyết định, treo trên bàn vẽ căn 203. Cạnh Huy Hiệu Bản Đầu Tiên._
_Bạn scan nó, lưu vào máy, gõ tên file thật chậm._
designer: *(gõ)* ban_1_khong_sua.pdf
_Lần đầu tiên sau bảy năm, bạn đặt tên file mà không có chữ "final". Vì không cần nữa._
{ qh_editor >= 30:
    _Sáng hôm sau, trên bàn bạn có một ly bạc xỉu ít đá và một mẩu giấy vẽ con cú: "Chúc mừng sếp mới. Render xong là xong. L."_
}
_Ngoài cửa sổ, cây lưỡi hổ trên ban công vừa đâm thêm một lá mới. Không ai bắt nó sửa._
-> END

// ============================================================
// 😄 2. SONG KIẾM HỢP BÍCH
// ============================================================
=== designer_kt_song_kiem_hop_bich ===
# dieu_kien:ket_thuc_song_kiem_hop_bich
_Tháng 12. Tầng trệt chung cư mini Phố Mới. Một mặt bằng 20 mét vuông, tường sơn trắng, cửa kính._
_Biển hiệu treo trên cửa: "QUỲNH VẼ, HUYỀN BÁN". Do bạn thiết kế. Bên dưới là dòng chữ nhỏ: "Khách hàng không được sửa biển hiệu."_
sales: Chị {designer}! Khách đầu tiên tới rồi! Tin… à không. Mọi người tin em nha!
_Cửa mở. Một bộ đồ hồng bước vào, tay ôm đĩa bánh chuối chiên._
sieu_nhan_hong: Biến hình! Em đặt bộ nhận diện cho… mùa hai của em! Có hồng, có cam, có chút xanh lá… à không, thôi bỏ xanh lá!
_Ba người cùng cười. {sales} lôi hợp đồng ra. Hợp đồng thật. Có mộc. Có mã số thuế. Không có Kevin Trộn._
sales: Giá này là giá thật. Hạn này là hạn thật. Em nói thật hết đó, anh {sieu_nhan_hong}.
sieu_nhan_hong: Em tin. *(ký)*
_Tối đó, hai đứa ngồi sàn studio ăn cơm tấm, chưa có bàn. {sales} chụp story, rồi xóa, rồi chụp lại, rồi đăng không cần filter._
sales: Chị {designer}. Tủ lạnh nhà em… có đồ ăn rồi. Thật luôn.
designer: Chị biết. Chị mua.
_Laptop thứ hai giờ nằm trên kệ, nắp dán tờ giấy: "Laptop để xem phim". Nó xem phim thật._
{ qh_hong_hot >= 30:
    _Ngày khai trương, {hong_hot} livestream từ cửa studio. Tiêu đề: "Biến mới: hai bà này ra riêng rồi mấy bà ơi!". 3.000 người xem. Ba khách hàng mới._
}
_Trên tường studio, bạn treo một khung ảnh: bản phác thảo BTT Global năm xưa, gạch một đường chéo, ghi "Bài học số 1"._
-> END

// ============================================================
// 😄 3. HAI MANG CHÍNH NGHĨA (bí mật)
// ============================================================
=== designer_kt_hai_mang_chinh_nghia ===
# dieu_kien:ket_thuc_hai_mang_chinh_nghia
_Đêm 31/10. 21 giờ 07. Đêm Hồng đang ở đoạn cao trào._
_Bên kia đường, màn hình LED trên tòa nhà kính 20 tầng của LL-Entertainment bật lên, phóng to thiết kế Hồng Ngoại, đúng như kế hoạch của Lưu Lực._
_Lá chuối. Vệt hồng. Rồi máy quay của đài truyền hình zoom vào. Và giữa họa tiết lá chuối, to bằng cả một tầng lầu…_
_…hiện ra chữ G 7 màu. Bên dưới là dòng chữ: "Hồng là của G"._
hong_hot: *(hét vào micro livestream)* MẤY BÀ ƠI! NHÌN BÊN KIA ĐƯỜNG KÌA! ÉT O ÉT!
_Cả quảng trường quay đầu. Ngàn chiếc điện thoại giơ lên. Trong 4 phút, ảnh màn hình LED đứng top 1 xu hướng._
_Trên tầng 20, ai đó chạy loạn. Màn hình chớp chớp, rồi tắt. Muộn 3 phút. Ba phút là cả một đời trên mạng xã hội._
~ follow(100000)
sieu_nhan_hong: *(trên sân khấu, chỉ tay về phía tòa nhà kính)* Hồng là của G! Hồng là thái độ! Và em ở lại!
_Bạn đứng giữa đám đông, cầm cuộn vải hồng, run tới mức không cầm nổi ly nước._
_Điện thoại rung. Tin nhắn cuối cùng từ Anh Lá Chuối._
la_chuoi: Em giỏi lắm. Mai anh xin nghỉ.
la_chuoi: À… nếu bên em còn tuyển, cho anh gửi CV nha.
_Bạn bật cười, giữa tiếng hò reo._
_Sáng hôm sau, {giam_doc} gọi bạn lên phòng. Trên bàn ông là ảnh chụp màn hình LED, in khổ lớn._
giam_doc: Anh không hỏi em làm sao làm được. Anh chỉ hỏi: em có muốn vẽ cái này lên tường sảnh không?
designer: Dạ… y nguyên, không sửa ạ?
giam_doc: Y nguyên. Anh hứa.
_Từ đó, ở sảnh {cong_ty} có một bức tường vẽ chữ G 7 màu nằm giữa lá chuối. Người ta hỏi ai vẽ. Bác {bac_bao_ve} chỉ cười: "Bác không thấy gì đâu."_
-> END

// ============================================================
// 😢 4. LỘ LOGO LÁ CHUỐI
// ============================================================
=== designer_kt_lo_logo_la_chuoi ===
# dieu_kien:ket_thuc_lo_logo_la_chuoi
_Phòng họp tầng 2. Rèm kéo kín. Màn hình lớn sáng lên._
it: *(giọng đều, không cảm xúc)* Log tải file. Wifi công ty. Thư mục "LL_HongNgoai_final". Máy của {designer}.
_Danh sách hiện ra, dòng này nối dòng kia. Giờ, ngày, tên file. Toàn những đêm bạn tưởng không ai thấy._
_Cả phòng im lặng. {truong_phong} nhìn xuống bàn. {hong_hot} che miệng. {giam_doc} không nói gì, chỉ nhìn chữ "LL" rất lâu._
hr: {designer}. Em rảnh không, mình uống trà xíu. *(rót trà, tay không run)* Lần cuối nha em.
_{sales} đứng bật dậy._
sales: Khoan! Mọi người nghe chị nói, chị… à không, em…
_Bạn nắm tay {sales}, lắc đầu. Không cần. Một người là đủ rồi._
designer: Dạ. Em làm. Em không có gì để cãi.
_Bạn ôm thùng carton xuống cầu thang. Trong thùng: chậu sen đá, cây bút cảm ứng, cuốn sổ phác thảo đầy cá voi hồng._
{ ds_co_huy_hieu_ban_1:
    _Và Huy Hiệu Bản Đầu Tiên. Nhìn nó, lần này bạn không thấy nhẹ lòng._
}
_Ở cổng, {cho} chạy ra, cọ đầu vào chân bạn. Nó không sủa._
_Bác {bac_bao_ve} ngồi trong chòi, rót một cốc trà đá, đặt lên bàn, đẩy về phía bạn._
bac_bao_ve: *(nói khẽ)* Bác không thấy gì đâu.
_Bạn uống cốc trà. Nó lạnh và ngọt. Rồi bạn bước ra Đại lộ Kẹt Xe, quay lại nhìn tòa nhà 3 tầng màu tím lần cuối._
_Chữ G 7 màu vẫn sáng. Lần đầu tiên bạn thấy nó đẹp. Đúng lúc không còn là của mình nữa._
-> END

// ============================================================
// 😢 5. BẢN SỬA THỨ 100
// ============================================================
=== designer_kt_ban_sua_thu_100 ===
# dieu_kien:ket_thuc_ban_sua_thu_100
_Bạn không còn cãi ai nữa._
_"Chữ to lên." Dạ. "Logo to lên." Dạ. "Thêm hồng." Dạ. "Thêm cầu vồng." Dạ. "Thêm pháo hoa." Dạ._
_Số Lần Bị Sửa: {ds_so_lan_bi_sua}. Bạn không đếm nữa. Con số tự nhảy._
truong_phong: Poster Đêm Hồng đẹp lắm em. Đúng ý anh. Đúng ý sếp. Đúng ý anh {con_ong_chau_cha}. Đúng ý tất cả.
_Tấm poster cuối cùng là một mảng hồng chói lóa, chữ chồng lên chữ, logo chồng lên mặt, pháo hoa chồng lên pháo hoa._
_Không đọc được chữ nào. Nhưng ai cũng nói "đẹp"._
hong_hot: *(nhìn bạn, nói nhỏ)* Bà ơi… bà ổn hông?
designer: Ổn. Sửa xong rồi mà.
_Đêm 31/10, bạn không ở lại Đêm Hồng. Bạn về căn 203._
_Bàn vẽ phủ một lớp bụi mỏng. Hộp bút chì còn nguyên, chưa gọt từ tháng 9. Cây lưỡi hổ trên ban công đã héo một lá._
_Bạn ngồi xuống, cầm bút chì lên. Đặt bút xuống tờ giấy trắng. Chờ._
_Chờ ai đó nói phải vẽ gì._
_Không ai nói. Và bạn nhận ra: bạn đã quên mất cảm giác vẽ cho vui là thế nào._
{ ds_cai_toi > 10:
    _Bạn ngồi đó rất lâu. Rồi, gần 2 giờ sáng, bạn vẽ được một nét. Một đường cong nhỏ, như đuôi cá voi. Chưa phải là hết. Nhưng gần hết._
- else:
    _Tờ giấy vẫn trắng tới sáng._
}
-> END

// ============================================================
// 😢 6. ĐỔI MÀU ÁO
// ============================================================
=== designer_kt_doi_mau_ao ===
# dieu_kien:ket_thuc_doi_mau_ao
_Thứ 2, ngày 2 tháng 11. Tầng 18, tòa nhà kính LL-Entertainment. Máy lạnh 18 độ. Bàn làm việc trắng tinh, màn hình 32 inch, ghế công thái học._
_Lương gấp đôi. Không ai hỏi "hóa đơn đâu em". Không ai họp 5 phút kéo dài 2 tiếng._
_9 giờ đúng. Một người mặc vest trắng đi ngang, đặt một xấp brief lên bàn bạn. Lưu Lực._
luu_luc: Chào em. Việc này phải xong từ hôm qua nhé em.
_Ông đi tiếp, không đợi bạn trả lời. Ở đây không ai đợi ai trả lời._
_Bạn mở brief. Yêu cầu: "Poster idol mới. Tông xanh lá chuối. Không hồng."_
_Bạn đứng dậy, ra cửa kính rót nước. Từ tầng 18 nhìn xuống, bên kia đường là tòa nhà 3 tầng màu tím._
{ nguoi_theo_doi >= 1000000:
    _Tòa nhà vẫn sáng đèn. Họ đã làm được, không cần bạn. Trên cửa sổ tầng 1, bạn thấy ai đó đang dán poster mới. Không phải nét của bạn._
- else:
    _Tòa nhà tắt đèn. Hai người đàn ông đang dùng thang gỡ chữ G 7 màu xuống khỏi tường. Từng màu một. Đỏ, cam, vàng…_
}
_Ở góc chòi bảo vệ, một con chó nhỏ ngồi nhìn lên tòa nhà kính. Bạn không biết nó có thấy bạn không._
_Điện thoại rung. Tin nhắn cuối cùng của {sales}, đã đọc mà chưa trả lời từ tuần trước: "Chị {designer}. Em vẫn ở đây nha."_
_Bạn quay lại bàn. Mở file mới. Đặt tên: "final"._
_Lần này, nó là final thật._
-> END
