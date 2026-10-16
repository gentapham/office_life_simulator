// ============================================================
// HR: TUẤN · SÁU KẾT THÚC
// Chạy sau Đại Nhạc Hội Siêu Nhân (23:30 ngày 31/10), khi
// ket_thuc_su_nghiep và chung_cong_ty_song đã được chốt.
// Thứ tự: 🔒 Phòng Trà Nhân Sự > Xé Danh Sách > Trà Ngon Người Hiền
//         > Rò Rỉ > Văn Phòng Trống > Người Tắt Đèn
// Mặc định: công ty sống thì Xé Danh Sách, không thì Người Tắt Đèn.
// ============================================================

=== hr_3010_danh_gia ===
# ngay:31 # gio:23:30 # bat_buoc # dieu_kien:sau_dem_hong
{ ket_thuc_su_nghiep == "":
    ~ chung_chot_ket_thuc_su_nghiep()
}
~ temp ro_ri = hr_tung_ro_ri_100 || hr_do_ro_ri >= 70 || (hr_noi_khong_co_danh_sach && hr_do_ro_ri >= 40)
{
- hr_da_gui_email && hr_tu_ghi_ten_minh && qh_ke_toan >= 30 && hr_do_lang_nghe >= 60:
    ~ chot_ket_thuc("phong_tra_nhan_su")
    -> hr_kt_phong_tra_nhan_su
- not ro_ri && hr_danh_sach_den <= 3 && (chung_cong_ty_song || hr_hanh_dong_3010 == "xe"):
    ~ chot_ket_thuc("xe_danh_sach")
    -> hr_kt_xe_danh_sach
- hr_do_dang_so <= 80 && hr_do_lang_nghe >= 70 && hr_so_nguoi_tu_len >= 4 && not ro_ri:
    ~ chot_ket_thuc("tra_ngon_nguoi_hien")
    -> hr_kt_tra_ngon_nguoi_hien
- ro_ri:
    ~ chot_ket_thuc("ro_ri")
    -> hr_kt_ro_ri
- hr_tung_so_100 && hr_do_dang_so >= 95:
    ~ chot_ket_thuc("van_phong_trong")
    -> hr_kt_van_phong_trong
- not chung_cong_ty_song:
    ~ chot_ket_thuc("nguoi_tat_den")
    -> hr_kt_nguoi_tat_den
- else:
    ~ chot_ket_thuc("xe_danh_sach")
    -> hr_kt_xe_danh_sach
}

// ------------------------------------------------------------
// 😄 🍵 TRÀ NGON NGƯỜI HIỀN
=== hr_kt_tra_ngon_nguoi_hien ===
# ket_thuc:tra_ngon_nguoi_hien # loai:co_hau
_23:30. Đại Nhạc Hội vừa tan. Bạn vẫn đứng ở cổng với bình trà 20 lít, giờ chỉ còn một phần ba. Ai đi về cũng dừng lại xin một ly._
_{chua_te_deadline} xin trà bạc hà. {editor} xin trà hoa cúc cho mắt. {bac_bao_ve} không xin, bạn rót trước._
_{cho} nằm dưới chân bình trà, gác cằm lên giày bạn._
thuc_tap_sinh: Dạ anh còn trà Zzz không ạ?
_Bạn cười._
_Lần đầu tiên trong 7 năm, không ai sợ cái cười đó. {thuc_tap_sinh} cười lại. Rồi cả hàng người cười theo, chẳng vì lý do gì._
_Trên tờ giấy dán ở bình trà, ai đó viết thêm bằng bút đỏ: "Trà của anh {hr}. Uống không bị đuổi."_
_{giam_doc} là người cuối cùng xin trà, vẫn mặc bộ "Ông Kẹ Ngân Hàng"._
{ chung_cong_ty_song:
    giam_doc: {hr}. Anh làm giám đốc 16 năm, chưa thấy ai xếp hàng trước phòng HR. Trừ hồi phát lương Tết. Từ tháng sau em là Trưởng phòng Nhân sự. Anh không ép. Em không được từ chối.
    hr: Dạ. Em nhận. Mà anh ơi, trưởng phòng có được mua thêm kệ trà không anh?
    giam_doc: Hỏi {ke_toan}.
- else:
    giam_doc: Công ty không qua được tháng này, {hr}. Nhưng anh hỏi thật: em có pha trà cho anh thêm một ấm nữa không, ở bất cứ đâu?
    hr: Ở đâu cũng được anh. Em mang theo ấm.
}
-> END

// ------------------------------------------------------------
// 😄 ✂️ XÉ DANH SÁCH
=== hr_kt_xe_danh_sach ===
# ket_thuc:xe_danh_sach # loai:co_hau
{ ket_thuc_su_nghiep == "sieu_sao_hang_a":
    _Đại Nhạc Hội Siêu Nhân. Con số trên màn hình lớn nhảy qua 1.000.000. Cả quảng trường nổ tung. Pháo giấy hồng rơi như mưa._
    _{sieu_nhan_hong} nhảy lên nhảy xuống. {dan_dau_tu} ôm {con_ong_chau_cha}, khóc. {sales} gào: "Chị nói rồi mà! Chắc kèo!"_
- else:
    { chung_cong_ty_song:
        _Đại Nhạc Hội Siêu Nhân tan. Con số không tới một triệu, nhưng {sieu_nhan_hong} ký phụ lục gia hạn tới Tết ngay sau cánh gà. Công ty còn. Pháo giấy hồng vẫn rơi._
    - else:
        _Đại Nhạc Hội Siêu Nhân tan. Con số dừng ở {nguoi_theo_doi}. Thứ Hai này, công ty sẽ nhận giấy đòi tiền. Nhưng từ hôm họp đánh giá, không có tờ giấy nào ghi tên ai phải đi trước._
    }
}
_Bạn đứng ở hàng cuối. Trong túi áo khoác là tập hồ sơ hồng, nhàu nát sau 31 ngày{hr_hanh_dong_3010 == "xe":, đã rách làm đôi từ hôm qua|}._
{ hr_danh_sach_den == 0:
    _Danh sách trắng. Không một cái tên. Bạn đã giữ nó trắng cả tháng._
- else:
    _{hr_danh_sach_den} cái tên. Giờ không còn ý nghĩa gì nữa._
}
_Bạn lấy tập hồ sơ ra. Xé làm đôi. Làm tư. Làm tám. Làm mười sáu, như 16 năm của công ty._
_Rồi tung lên trời. Mấy mảnh giấy hồng lẫn vào pháo giấy hồng còn sót trên sân khấu. Không ai biết đó là gì._
_Chỉ có {chi_dai} nhìn thấy. Bả nhìn bạn, gật đầu, giơ ngón cái._
_{giam_doc} đứng cạnh bạn từ lúc nào, trong bộ "Ông Kẹ Ngân Hàng", mũ lệch, mặt đỏ vì vui._
giam_doc: Trang 2 anh xé từ hôm qua rồi.
hr: Dạ? Trang 2 em giữ mà anh.
giam_doc: Bản trong máy tính. Sau cái họp đánh giá, anh xóa, rồi ngồi uống hết ấm trà sen em pha. Anh nhận ra người ta giữ công ty bằng người, không phải bằng danh sách.
_Bạn tìm trong đống giấy vụn trên tay một mảnh nhỏ xíu, chữ còn đọc được: "…cuối cùng: {hr}…". Bạn đưa cho ông ấy. Ông ấy thả nó bay theo gió._
giam_doc: Anh không ép. Nhưng năm sau em đừng nhận cái tập hồ sơ nào màu hồng nữa nhé.
hr: Dạ. Năm sau em chỉ nhận trà.
{ hr_danh_sach_den == 0:
    _Thành tựu mở khóa: 📓 Danh Sách Trắng._
}
-> END

// ------------------------------------------------------------
// 😄 🔒 KẾT THÚC BÍ MẬT: PHÒNG TRÀ NHÂN SỰ
=== hr_kt_phong_tra_nhan_su ===
# ket_thuc:phong_tra_nhan_su # loai:co_hau # bi_mat
_23:30. Đại Nhạc Hội vừa tan. {giam_doc} còn mặc bộ "Ông Kẹ Ngân Hàng", ngồi trên bậc sân khấu. Bạn đặt lên đùi ông ấy một lá đơn. Lý do nghỉ việc: "Để không ai khác phải bị cắt."_
giam_doc: *(đọc, rồi nhìn bạn)* Em… em đọc trang 2 từ bao giờ?
hr: Từ 17/10 anh, trên xe đi Vũng Tàu. Anh định cắt em cuối cùng. Em tự cắt em trước. Cho đỡ tốn một ấm trà.
_{giam_doc} im lặng rất lâu. Rồi ký. Tay ông ấy run như tay {thuc_tap_sinh} hôm đầu tháng trước máy chấm công._
giam_doc: Anh xin lỗi, {hr}.
_{chung_cong_ty_song:Công ty qua được tháng này. Bạn vẫn đi.|Công ty không qua được tháng này. Bạn đã có chỗ để đi, và chỗ cho người khác đi theo.}_
_Ba tháng sau._
_Phố Cũ. Một căn nhà nhỏ, cửa gỗ sơn cam (thói quen cũ khó bỏ). Biển hiệu viết tay: "PHÒNG TRÀ NHÂN SỰ"._
_Bên trong, kệ trà 40 loại, sắp theo bảng chữ cái, từ Atiso tới Zzz. Ở quầy, {ke_toan} ngồi ghi sổ, từng đồng, từng ly._
ke_toan: Hôm qua lời 312.000đ. Có hóa đơn hết.
hr: Bà ghi luôn khoản tui uống thử 6 ly hông?
ke_toan: Ghi rồi. Trừ lương ông.
_Trên tường có một tấm bảng gỗ: "Ở đây, mời uống trà nghĩa là mời uống trà."_
_Chuông cửa leng keng. Vị khách đầu tiên của ngày khai trương. Bộ đồ kim tuyến lấp lánh, tóc giả hơi lệch._
thanh_xin_nghi: Dạ… anh {hr}. Hôm nay em xin nghỉ… để tới uống trà ạ.
hr: Lý do lần này anh tin. Ngồi đi em. Trà hoa cúc nha.
_{cho} chạy vào theo, ngồi đúng chỗ dưới chân quầy, như đã biết đường từ trước._
_Bạn rót ly đầu tiên. Không có danh sách nào trong ngăn kéo. Chỉ có sổ ghi món._
-> END

// ------------------------------------------------------------
// 😢 💡 NGƯỜI TẮT ĐÈN
=== hr_kt_nguoi_tat_den ===
# ket_thuc:nguoi_tat_den # loai:buon
{ nguyen_theo_ll:
    _Đại Nhạc Hội Siêu Nhân không có {sieu_nhan_hong}. Bên kia đường, tòa LL chiếu chữ "Hồng Ngoại". Chiến dịch không về đích._
- else:
    _Đại Nhạc Hội Siêu Nhân dừng ở con số {nguoi_theo_doi}. Chiến dịch không về đích._
}
_Thứ Hai, 2/11. Giấy đòi tiền đã tới. Tập hồ sơ hồng có {hr_danh_sach_den} tên. Giờ thì không cần chọn nữa: ai cũng phải đi. Chỉ cần một người nói lời cảm ơn._
_Bạn mời từng người lên phòng HR. Mỗi người một ấm trà._
_{thuc_tap_sinh} uống trà sen, cúi đầu cảm ơn 3 lần. {thanh_xin_nghi} uống trà gừng, không ho. {dan_dau_tu} uống trà atiso, nói "đây là đáy"._
_Hai mươi người, hai mươi ấm trà, hai mươi lần bạn nói "Cảm ơn em đã đồng hành"._
_Câu đó bạn đã nói 11 lần trong 7 năm. Giờ là 31. Không lần nào dễ hơn._
_Người cuối cùng lên phòng HR là {giam_doc}. Ông ấy không cầm ly. Bạn đặt lên bàn trang 2, tờ giấy bạn giữ từ hôm đi Vũng Tàu: "Người cuối cùng: {hr} (sau khi HR cắt xong hết)."_
giam_doc: Anh… anh không ép.
hr: Dạ. Em biết. Em pha cho anh ấm cuối nha.
_Tối đó, bạn là người cuối cùng trong tòa nhà._
_Tầng 2: tắt đèn phòng họp. Tắt đèn studio. Tắt đèn phòng kế toán, nơi {ke_toan} để quên cây bút._
_Tầng 1: tắt đèn pantry. Mấy cái ly còn úp trên giá._
_Tầng trệt: máy chấm công vẫn nhấp nháy. Bạn chấm công ra. 21:14. Lần cuối._
_Ở cổng, {bac_bao_ve} chưa ngủ. Bác đưa cho bạn một ly trà đá._
bac_bao_ve: Uống đi cháu. Bác pha đấy.
_Bạn cầm ly trà. 7 năm, bạn pha trà cho cả công ty. Đây là lần đầu tiên có người pha trà cho bạn._
_{cho} đi theo bạn ra tới đầu hẻm, rồi ngồi lại, nhìn theo._
-> END

// ------------------------------------------------------------
// 😢 📂 RÒ RỈ
=== hr_kt_ro_ri ===
# ket_thuc:ro_ri # loai:buon
{ hr_tung_ro_ri_100:
    _Từ đêm {hr_ngay_ro_ri}/10, ảnh chụp tập hồ sơ hồng đã nằm trên trang Confession. Mờ, nhưng đủ đọc từng cái tên. Đêm nay, giữa Đại Nhạc Hội, ai đó ghim nó lên đầu trang._
- else:
    _23:00, giữa lúc Đại Nhạc Hội tan, trang Confession đăng ảnh chụp tập hồ sơ hồng. Mờ, nhưng đủ đọc từng cái tên. Ai chụp, lúc nào, không ai biết. Tủ hồ sơ của bạn đã bị lục quá nhiều lần._
}
_Bình luận đầu tiên: {hr_noi_khong_co_danh_sach:"Ổng nói không có danh sách nào hết mà?"|"Vậy là có thật."}_
{ chung_cong_ty_song:
    _Công ty qua được tháng này. Nhưng không ai còn muốn ở lại với cái danh sách đó._
}
_Sáng thứ Hai, 2/11. Cả công ty đứng chờ ở cửa phòng HR. Lần đầu tiên có hàng người trước phòng HR._
_Không ai cầm ly. Không ai cầm hồ sơ xin việc. Ai cũng cầm đơn xin nghỉ._
chi_dai: Tui nói rồi. Đứa nào bị đuổi mà khóc, tui chỉ mặt ông. Giờ không ai bị đuổi. Tụi nó tự đi.
_{chi_dai} đặt lá đơn của mình lên trên cùng. Bên dưới là {thuc_tap_sinh}, {hong_hot}, {chua_te_deadline}… Có tờ đơn đã có sẵn logo xanh lá chuối._
_Điện thoại bàn reo. Phòng giám đốc._
_Bạn đi lên phòng kính. {giam_doc} ngồi đó, trên bàn có một ấm trà. Ông ấy tự pha. Trà gừng, pha quá đặc._
giam_doc: Em rảnh không, ngồi xuống uống trà xíu.
_Bạn ngồi xuống. Tay bạn lạnh. Bụng bạn thắt lại. Ly trà nóng mà tay vẫn lạnh._
_Lần đầu tiên bạn hiểu cảm giác của 19 người kia._
giam_doc: Mình cùng nhìn lại hành trình của em nhé.
_Câu của bạn. Giọng của sếp. Bạn uống một ngụm. Trà gừng, cho người đang nóng giận. Sai bài._
-> END

// ------------------------------------------------------------
// 😢 🪑 VĂN PHÒNG TRỐNG
=== hr_kt_van_phong_trong ===
# ket_thuc:van_phong_trong # loai:buon
_Đại Nhạc Hội tan. Không ai đứng lại xin trà ở cổng. Bình trà 20 lít còn nguyên._
_Không cần danh sách nữa. Ai cũng sợ bạn tới mức tự nghỉ trước. {chung_cong_ty_song:Công ty còn sống, nhưng sáng|Sáng} thứ Hai, dưới cửa phòng HR có mười một tờ đơn. Không ai dám đưa tận tay._
_Tới thứ Sáu, phòng làm việc tầng 1 chỉ còn ghế trống và máy tính tắt._
_Ghế {thuc_tap_sinh} còn bông hồng nhung khô từ Ngày Nhà giáo. Bàn {hong_hot} còn cái ring light, không ai bật._
_Bạn ngồi một mình ở pantry. Trước mặt là 40 cái ly. Bạn rót đủ 40 loại trà, từ Atiso tới Zzz._
_40 ly. Không ai uống._
_Bạn cười. Không có ai để sợ cái cười đó. Hóa ra không có ai để sợ thì cười cũng chẳng để làm gì._
_Tiếng móng chân lách cách trên sàn. {cho} chạy vào._
cho: Gâu.
_Nó ngửi từng ly. Ly trà sen. Ly trà gừng. Ly trà Zzz, ngửi hơi lâu. Rồi nó nằm xuống cạnh chân bạn, thở dài một tiếng rất người._
_Nó không sợ bạn. Nó chỉ không biết uống trà._
_Bạn rót cho nó một chén nước lọc. Đặt cạnh ly thứ 40._
-> END
