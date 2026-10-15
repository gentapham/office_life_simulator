// ============================================================
// HÀM & BIẾN PHỤ DÙNG CHUNG (tiền tố chung_)
// Bổ sung cho bien-chung.ink, KHÔNG thay thế nó.
//
// 1. Xưng hô hai chiều theo tuổi, chức vụ, giọng Bắc/Nam:
//      chung_goi(npc)   : NPC gọi người chơi là gì   ("em", "ông", "cháu", "sếp"...)
//      chung_xung(npc)  : NPC tự xưng với người chơi ("anh", "tui", "tớ", "bác"...)
//      chung_ban(npc)   : người chơi gọi NPC là gì
//      chung_toi(npc)   : người chơi tự xưng với NPC
//    Mỗi hàm có bản viết hoa chữ đầu (thêm _hoa) để đứng đầu câu.
//    Quy tắc: chênh ≥ 2 tuổi thì anh/chị – em; ngang tuổi thì ông/bà – tui
//    (giọng Nam) hoặc cậu – tớ (giọng Bắc). Bác Bình gọi mọi người là "cháu",
//    gọi Thắng là "anh Thắng". Ai cũng gọi Thắng là "sếp". Thắng gọi mọi người
//    là "em". Duy "dạ anh dạ chị" với tất cả.
// 2. chung_ngoi_ba(ma) : "ổng" / "bả" / "nó" (Tuất), dùng khi buôn chuyện.
//    chung_ten_buon(ma): "ông Long", "bà Ngân", "bác Bình", "sếp Thắng", "con Tuất".
// 3. Biến chung cho Đêm Hồng & kết thúc sự nghiệp (game hoặc file nhân vật đặt).
// 4. Mã người nói cho NPC phụ (không có biến tên, game hiển thị tên cố định):
//      npc_teo (Anh shipper Tèo), npc_ba_tu (Bà Tư chủ trọ), npc_chu_sau (Chú Sáu
//      karaoke), npc_co_bay (Cô Bảy bánh mì), npc_ong_ba (Ông Ba trà đá),
//      npc_co_nam (Cô Năm cơm tấm), npc_khoa (Thu ngân ca đêm Khoa),
//      npc_chi_nail (Chị chủ tiệm nail Lung Linh), npc_bac_si (Bác sĩ Khỏe Re),
//      npc_grab (Tài xế Grab hay hủy chuyến), npc_paparazzi (Paparazzi Mắt Diều Hâu),
//      npc_fan_phat (Fan cuồng số 1 của Phát), npc_thu_ky_ll (Thư ký của Lưu Lực),
//      npc_cam_do (Chủ tiệm cầm đồ Cứu Nguy), npc_cong_an (Anh công an phường).
// ============================================================

// ---------- Biến cho Đêm Hồng & kết thúc sự nghiệp ----------
// Nguyên đã vào top 10 xu hướng (game đặt khi đạt, ví dụ Tiến Độ Đêm Hồng ≥ 80%)
VAR chung_top_10_xu_huong = false
// Có scandal lớn bị bóc sau ngày 28/10 (vụ fan ảo, email Nhi, Hồng Coin...)
VAR chung_scandal_lon_sau_2810 = false
// Số lần Siêu Nhân Hồng thành meme trong tháng (té khi nhảy, bị Tuất đuổi trên sóng...)
VAR chung_so_meme = 0
// Long công khai là tác giả, "Hồng Là Thái Độ" được hát ở Đêm Hồng
VAR chung_hat_hong_la_thai_do = false
// Phim "Người Hùng Không Tên" ghi đúng tên Duy ở dòng ý tưởng
VAR chung_phim_ghi_ten_duy = false
// Video "16 năm" của Lĩnh chiếu được (false nếu kẹt 99% mà không ai cứu)
VAR chung_video_16_nam = true
// Tiến độ Đêm Hồng của Hương, 0..100
VAR chung_tien_do_dem_hong = 70
// File nhân vật đã tự hỏi chuyện tháo mũ rồi thì đặt true để Đêm Hồng chung không hỏi lại
VAR chung_da_chon_thao_mu = false
// Công ty còn sống sau Đêm Hồng (do chung_3110_ket_thuc_su_nghiep tính)
VAR chung_cong_ty_song = false

// ---------- Tuổi ----------
=== function chung_tuoi(ma) ===
{ ma:
- "bac_bao_ve": ~ return 50
- "giam_doc": ~ return 37
- "quan_ly_idol": ~ return 37
- "dan_dau_tu": ~ return 37
- "it": ~ return 31
- "sieu_nhan_hong": ~ return 31
- "thuc_tap_sinh": ~ return 30
- "ke_toan": ~ return 30
- "hr": ~ return 30
- "idol_het_thoi": ~ return 30
- "chi_dai": ~ return 30
- "hong_hot": ~ return 29
- "bien_kich": ~ return 29
- "designer": ~ return 29
- "editor": ~ return 27
- "sales": ~ return 26
- "cho": ~ return 0
}
~ return 28

=== function chung_mien_bac(ma) ===
~ return ma == "giam_doc" || ma == "truong_phong" || ma == "bac_bao_ve"

// ---------- a gọi b là gì ----------
=== function chung_goi_ai(a, b) ===
{ b == "cho":
    ~ return cho
}
{ b == "bac_bao_ve":
    ~ return "bác"
}
{ a == "bac_bao_ve":
    { b == "giam_doc":
        ~ return "anh " + giam_doc
    }
    ~ return "cháu"
}
{ b == "giam_doc":
    ~ return "sếp"
}
{ a == "giam_doc":
    ~ return "em"
}
{ a == "thuc_tap_sinh":
    ~ return anh_chi_cua(b)
}
~ temp d = chung_tuoi(a) - chung_tuoi(b)
{ d >= 2:
    ~ return "em"
}
{ d <= -2:
    ~ return anh_chi_cua(b)
}
{ chung_mien_bac(a):
    ~ return "cậu"
}
~ return ong_ba_cua(b)

// ---------- a tự xưng thế nào khi nói với b ----------
=== function chung_xung_voi(a, b) ===
{ a == "bac_bao_ve":
    ~ return "bác"
}
{ b == "cho":
    ~ return anh_chi_cua(a)
}
{ b == "bac_bao_ve":
    { a == "giam_doc":
        ~ return "em"
    }
    ~ return "cháu"
}
{ a == "giam_doc":
    ~ return "anh"
}
{ b == "giam_doc":
    ~ return "em"
}
{ a == "thuc_tap_sinh":
    ~ return "em"
}
~ temp d = chung_tuoi(a) - chung_tuoi(b)
{ d >= 2:
    ~ return anh_chi_cua(a)
}
{ d <= -2:
    ~ return "em"
}
{ chung_mien_bac(a):
    ~ return "tớ"
}
~ return "tui"

// ---------- Viết hoa chữ đầu ----------
=== function chung_hoa(s) ===
{ s:
- "em": ~ return "Em"
- "anh": ~ return "Anh"
- "chị": ~ return "Chị"
- "ông": ~ return "Ông"
- "bà": ~ return "Bà"
- "tui": ~ return "Tui"
- "tớ": ~ return "Tớ"
- "cậu": ~ return "Cậu"
- "bác": ~ return "Bác"
- "cháu": ~ return "Cháu"
- "sếp": ~ return "Sếp"
}
{ s == "anh " + giam_doc:
    ~ return "Anh " + giam_doc
}
~ return s

// ---------- Rút gọn theo người chơi ----------
=== function chung_goi(npc) ===
~ return chung_goi_ai(npc, vai)

=== function chung_xung(npc) ===
~ return chung_xung_voi(npc, vai)

=== function chung_ban(npc) ===
~ return chung_goi_ai(vai, npc)

=== function chung_toi(npc) ===
~ return chung_xung_voi(vai, npc)

=== function chung_goi_hoa(npc) ===
~ return chung_hoa(chung_goi(npc))

=== function chung_xung_hoa(npc) ===
~ return chung_hoa(chung_xung(npc))

=== function chung_ban_hoa(npc) ===
~ return chung_hoa(chung_ban(npc))

=== function chung_toi_hoa(npc) ===
~ return chung_hoa(chung_toi(npc))

// ---------- Buôn chuyện ----------
=== function chung_ngoi_ba(ma) ===
{ ma == "cho":
    ~ return "nó"
}
~ return ong_ay_cua(ma)

=== function chung_ten_buon(ma) ===
{ ma:
- "cho": ~ return "con " + cho
- "bac_bao_ve": ~ return "bác " + bac_bao_ve
- "giam_doc": ~ return "sếp " + giam_doc
- "sieu_nhan_hong": ~ return "Siêu Nhân Hồng"
}
~ return ong_ba_cua(ma) + " " + ten(ma)

// Người chơi là ai (tên hiển thị)
=== function chung_ten_toi() ===
~ return ten(vai)

// Như chung_ten_buon nhưng viết hoa chữ đầu (đứng đầu câu)
=== function chung_ten_buon_hoa(ma) ===
{ ma:
- "cho": ~ return "Con " + cho
- "bac_bao_ve": ~ return "Bác " + bac_bao_ve
- "giam_doc": ~ return "Sếp " + giam_doc
- "sieu_nhan_hong": ~ return "Siêu Nhân Hồng"
}
~ return chung_hoa(ong_ba_cua(ma)) + " " + ten(ma)
