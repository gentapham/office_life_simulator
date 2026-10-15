// ============================================================
// CHÓ CÔNG TY: TUẤT · biến riêng (tiền tố ch_)
// Xem thiết kế: docs/roles/cho.md
// ============================================================

// ---------- Chỉ số riêng (0..100) ----------
VAR ch_duoc_cung = 60      // 🥰 Độ Được Cưng
VAR ch_mui_thinh = 30      // 👃 Mũi Thính
VAR ch_do_no = 70          // 🍖 Độ No (thay cho No và Khát)
VAR ch_ghet_hong = 90      // 😤 Độ Ghét Hồng (ngày 1/10 bị chọc lần đầu là lên 90)

// ---------- Từ khóa tiếng người Tuất hiểu ----------
// Có ngoặc tròn = đã biết từ đầu. HỒNG học sau 4/10, MŨ học sau 16/10.
LIST ch_tu_vung = (ch_tv_tuat), (ch_tv_an), (ch_tv_di_dao), (ch_tv_xuc_xich), (ch_tv_xuong), (ch_tv_ngoan), (ch_tv_khong), (ch_tv_ngoi), (ch_tv_bat_tay), (ch_tv_tam), (ch_tv_bac), (ch_tv_ve), ch_tv_hong, ch_tv_mu

// ---------- Kho báu dưới gầm cầu thang ----------
// Đầu tháng kho đã có 6 món: chìa khóa, son môi, điện thoại cũ, tất lẻ, nắp bút hồng, USB không nhãn.
VAR ch_so_mon_kho = 6
VAR ch_co_chia_khoa = true        // chìa khóa rơi ở sân thượng lúc 22:00 (của ai thì chưa ai biết)
VAR ch_co_son_moi = true          // son môi nhặt trong bãi xe
VAR ch_co_dien_thoai_cu = true    // điện thoại cũ, hết pin từ 2023
VAR ch_co_tat_le = true           // một chiếc tất lẻ, sọc cam
VAR ch_co_nap_but_hong = true     // nắp bút hồng, món Tuất thích gặm nhất
VAR ch_co_bong_cao_su = true      // bóng cao su (đồ chơi, không tính vào kho)
VAR ch_co_ga_cao_su = true        // con gà cao su. 4/10 bị Nguyên giấu sau tủ mạng
VAR ch_co_hoa_bac = false         // bông hoa cắm vào bát nước ngày 1/10
VAR ch_co_manh_ao_hong = false    // mảnh vải áo choàng hồng
VAR ch_co_bien_lai_cam_do = false // biên lai tiệm cầm đồ Cứu Nguy (mùi Chương)
VAR ch_co_vit_cao_su = false      // con vịt cao su (quà minigame Người Mẫu Tóp-tóp)
VAR ch_co_dep_to_ong = false      // dép tổ ong cũ của bác (quà minigame)
VAR ch_co_giay_dem_17 = false     // chiếc giày của người lạ đêm 17/10
VAR ch_co_la_thu_g = false        // lá thư "G" ngày 20/10 (nếu Tuất tha về kho)
VAR ch_co_trang_ho_so_ll = false  // một trang hồ sơ Lưu Lực làm rơi ngày 27/10
VAR ch_co_vo_hop_pate = false     // vỏ hộp pate (Tuất coi là kỷ vật)
VAR ch_co_vo_coc_tra_sua = false  // cốc trà sữa thứ 6 còn sót trân châu

// ---------- Tiền rơi mang về cho Bác Bình ----------
VAR ch_tien_ong_bo = 0       // tiền không chủ trong ống bơ (đủ 10.000đ = 1 cây xúc xích)
VAR ch_tong_tien_nhat = 0    // tổng tiền rơi đã mang về (thành tựu "Chó Thật Thà": 200.000đ)
VAR ch_nhat_tien_hom_nay = false

// ---------- Siêu Nhân Hồng ----------
VAR ch_xuc_xich_tu_nguyen = 0   // số lần nhận xúc xích từ tay Nguyên (kết thúc Hòa Bình Hồng cần ≥ 15)
VAR ch_lan_bi_choc = 0
VAR ch_lan_sua_hong = 0
VAR ch_lo_mat_nguyen = 0        // phần Độ Lộ Mặt của Nguyên do Tuất gây ra
VAR ch_nguyen_cong_ve = false   // Nguyên cõng Tuất về khi Tuất lạc (6/10)
VAR ch_tang_gang_tay = false    // 23/10: đặt găng tay hồng cạnh bánh kem
VAR ch_pha_banh = false         // 23/10: phá bánh kem
VAR ch_giat_mu = false          // 31/10: giật mũ
VAR ch_nam_ngua_dem_hong = false // 31/10: nằm ngửa trước Nguyên
VAR ch_chup_anh_hoa_binh = false

// ---------- Người & sự kiện ----------
VAR ch_tra_usb_cho_vu = false
VAR ch_qua_van_phong = 0        // số lần "để lại quà" trong văn phòng
VAR ch_qua_10_ngay_cuoi = 0     // số lần "để lại quà" từ 21/10 trở đi
VAR ch_qua_phong_gd = 0         // số lần "để lại quà" trong phòng giám đốc
VAR ch_vao_phong_gd = 0         // thành tựu "Tuất Không Biết Đọc"
VAR ch_khong_sua_shipper = 0    // chuỗi không sủa shipper Tèo liên tiếp
VAR ch_tuat_noi_hon_nguyen = false

// ---------- Vũng Tàu & đêm 17/10 ----------
VAR ch_len_xe_vung_tau = false
VAR ch_chay_theo_cua = false
VAR ch_lac_vung_tau = false
VAR ch_nguoi_la_dem_17 = ""     // mã người lạ trong phòng giám đốc đêm 17/10 (game có thể ghi đè)

// ---------- Thư G, con rắn thứ hai, kho ----------
VAR ch_thu_g_den_tay_bac = false
VAR ch_chi_ra_ran_thu_hai = false
VAR ch_dong_minh_kho = ""        // ai biết chỗ kho: bac_bao_ve / it / thuc_tap_sinh
VAR ch_kho_bi_lo = false         // Hiếu hoặc người ngoài đã nhòm thấy kho
VAR ch_kho_bi_don = false
VAR ch_tha_vao_phong_hop = false
VAR ch_nguy_co_ll = 0            // phần nguy cơ "Bị Cướp Mất" do Tuất góp vào (âm là giảm)

// ============================================================
// HÀM RIÊNG
// ============================================================

=== function ch_cung(n) ===
~ ch_duoc_cung = gioi_han(ch_duoc_cung + n)

=== function ch_mui(n) ===
~ ch_mui_thinh = gioi_han(ch_mui_thinh + n)

=== function ch_an(n) ===
~ ch_do_no = gioi_han(ch_do_no + n)
~ an(n)
~ uong(n / 2)

=== function ch_hong_doi(n) ===
~ ch_ghet_hong = gioi_han(ch_ghet_hong + n)

// Tha một món mới về kho dưới gầm cầu thang
=== function ch_tha_ve_kho() ===
~ ch_so_mon_kho = ch_so_mon_kho + 1

// Ngậm tiền rơi về chòi, bỏ vào ống bơ của bác
=== function ch_nhat_tien(n) ===
~ ch_tien_ong_bo = ch_tien_ong_bo + n
~ ch_tong_tien_nhat = ch_tong_tien_nhat + n
~ ch_nhat_tien_hom_nay = true

// Bác đổi tiền trong ống bơ ra xúc xích: cứ 10.000đ một cây. Trả về số cây.
=== function ch_doi_xuc_xich() ===
~ temp so_cay = ch_tien_ong_bo / 10000
~ ch_tien_ong_bo = ch_tien_ong_bo - so_cay * 10000
~ ch_an(so_cay * 20)
~ return so_cay

// "Để lại quà". noi: "van_phong", "phong_gd", "ngoai_san"
=== function ch_de_qua(noi) ===
{ noi != "ngoai_san":
    ~ ch_qua_van_phong = ch_qua_van_phong + 1
    ~ ch_cung(-20)
    { ngay >= 21:
        ~ ch_qua_10_ngay_cuoi = ch_qua_10_ngay_cuoi + 1
    }
}
{ noi == "phong_gd":
    ~ ch_qua_phong_gd = ch_qua_phong_gd + 1
}

// Nhận xúc xích từ tay Nguyên
=== function ch_an_cua_nguyen() ===
~ ch_xuc_xich_tu_nguyen = ch_xuc_xich_tu_nguyen + 1
~ ch_an(15)
~ qh("sieu_nhan_hong", 3)

// Từ khóa Tuất đã học: hiện chữ in hoa, chưa học thì chỉ là "bla"
=== function ch_hong() ===
{ ch_tu_vung ? ch_tv_hong:
    ~ return "HỒNG"
}
~ return "bla"

=== function ch_mu() ===
{ ch_tu_vung ? ch_tv_mu:
    ~ return "MŨ"
}
~ return "bla"

=== function ch_hoc_tu(tu) ===
~ ch_tu_vung += tu
