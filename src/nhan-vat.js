// Thông tin hiển thị của 23 nhân vật (theo docs/roles/README.md và docs/world/cong-ty.md)
export const NHAN_VAT = [
  { ma: "ran_doc", ten: "Hiếu", vai: "Rắn Độc", icon: "🐍", chuc: "Truyền thông nội bộ", luong: 13000000 },
  { ma: "giam_doc", ten: "Thắng", vai: "Giám Đốc", icon: "👔", chuc: "Giám đốc điều hành", luong: 60000000 },
  { ma: "truong_phong", ten: "Nhật", vai: "Trưởng Phòng Họp", icon: "📅", chuc: "Trưởng phòng Sản xuất", luong: 25000000 },
  { ma: "thanh_ninh", ten: "Nhi", vai: "Thánh Nịnh", icon: "🙇", chuc: "Trợ lý Giám đốc", luong: 18000000 },
  { ma: "hong_hot", ten: "Ngân", vai: "Thánh Hóng", icon: "👀", chuc: "Mạng xã hội", luong: 13000000 },
  { ma: "con_ong_chau_cha", ten: "Long", vai: "Con Ông Cháu Cha", icon: "👑", chuc: "Phó phòng Marketing", luong: 25000000 },
  { ma: "chua_te_deadline", ten: "Vũ", vai: "Chúa Tể Deadline", icon: "⏰", chuc: "Điều phối dự án", luong: 13000000 },
  { ma: "thuc_tap_sinh", ten: "Duy", vai: "Thực Tập Sinh", icon: "🐣", chuc: "Thực tập sinh 30 tuổi", luong: 4000000 },
  { ma: "ke_toan", ten: "Thương", vai: "Kế Toán", icon: "💰", chuc: "Kế toán trưởng", luong: 25000000 },
  { ma: "hr", ten: "Tuấn", vai: "HR", icon: "☕", chuc: "Nhân sự", luong: 18000000 },
  { ma: "it", ten: "Bảo", vai: "IT", icon: "🔌", chuc: "IT, âm thanh ánh sáng", luong: 13000000 },
  { ma: "idol_het_thoi", ten: "Phát", vai: "Idol Hết Thời", icon: "🎤", chuc: "Ca sĩ độc quyền", luong: 8000000 },
  { ma: "quan_ly_idol", ten: "Thái", vai: "Quản Lý Idol", icon: "📞", chuc: "Quản lý nghệ sĩ", luong: 18000000 },
  { ma: "bien_kich", ten: "Oánh", vai: "Biên Kịch", icon: "✍️", chuc: "Biên kịch", luong: 13000000 },
  { ma: "editor", ten: "Lĩnh", vai: "Editor Cú Đêm", icon: "🦉", chuc: "Dựng phim", luong: 13000000 },
  { ma: "designer", ten: "Quỳnh", vai: "Designer", icon: "🎨", chuc: "Thiết kế", luong: 13000000 },
  { ma: "sales", ten: "Huyền", vai: "Sales Nói Phét", icon: "📈", chuc: "Kinh doanh", luong: 13000000 },
  { ma: "chi_dai", ten: "Hương", vai: "Chị Đại", icon: "🦁", chuc: "Tổ chức sự kiện", luong: 18000000 },
  { ma: "dan_dau_tu", ten: "Chương", vai: "Dân Đầu Tư", icon: "📉", chuc: "Phân tích số liệu", luong: 13000000 },
  { ma: "thanh_xin_nghi", ten: "Sơn", vai: "Thánh Xin Nghỉ", icon: "🤒", chuc: "Điều phối lịch trình", luong: 13000000 },
  { ma: "bac_bao_ve", ten: "Bình", vai: "Bác Bảo Vệ", icon: "🛡️", chuc: "Bảo vệ", luong: 8000000 },
  { ma: "sieu_nhan_hong", ten: "Nguyên", vai: "Siêu Nhân Hồng", icon: "🩷", chuc: "Đối tác chiến lược", luong: 0 },
  { ma: "cho", ten: "Tuất", vai: "Chó Công Ty", icon: "🐕", chuc: "Chó (ở chòi bảo vệ)", luong: 0 },
];

export const THEO_MA = Object.fromEntries(NHAN_VAT.map(n => [n.ma, n]));

export const THU = ["CN", "T2", "T3", "T4", "T5", "T6", "T7"];
export function thuCuaNgay(ngay) {
  return THU[new Date(2026, 9, ngay).getDay()];
}

// Sự kiện lớn trong tháng (hiện ở thanh ngày)
export const SU_KIEN_NGAY = {
  1: "Ký hợp đồng Siêu Nhân Hồng", 4: "Ngày Động vật", 9: "Ra mắt MV", 10: "Ngày lương (rơi vào thứ 7)",
  12: "Lương về trễ", 13: "Ngày Doanh nhân", 15: "Mất điện", 16: "Gameshow", 17: "Team building Vũng Tàu",
  18: "Vũng Tàu ngày 2", 20: "20/10 + sinh nhật công ty", 22: "Kiểm tra thuế", 23: "Sinh nhật Siêu Nhân Hồng",
  24: "Hội nghị hòa giải", 27: "LL-Entertainment ra tay", 29: "Wifi sập", 30: "Họp đánh giá", 31: "Đêm Hồng Halloween",
};
