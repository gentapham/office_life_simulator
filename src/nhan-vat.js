// Thông tin hiển thị của 23 nhân vật (theo docs/roles/README.md và docs/world/cong-ty.md)
export const NHAN_VAT = [
  { ma: "ran_doc", ten: "Hiếu", vai: "Rắn Độc", icon: "🐍", chuc: "Truyền thông nội bộ", luong: 13000000 , mau: "#2f6b3a", cau: "Thân thiện bề ngoài, tung tin bên trong." },
  { ma: "giam_doc", ten: "Thắng", vai: "Giám Đốc", icon: "👔", chuc: "Giám đốc điều hành", luong: 60000000 , mau: "#22305a", cau: "Anh không ép ai. Tùy các em." },
  { ma: "truong_phong", ten: "Nhật", vai: "Trưởng Phòng Họp", icon: "📅", chuc: "Trưởng phòng Sản xuất", luong: 25000000 , mau: "#b39d72", cau: "Họp để chuẩn bị cho cuộc họp." },
  { ma: "thanh_ninh", ten: "Nhi", vai: "Thánh Nịnh", icon: "🙇", chuc: "Trợ lý Giám đốc", luong: 18000000 , mau: "#e98fb2", cau: "Sếp nói gì cũng đúng, kể cả khi sai." },
  { ma: "hong_hot", ten: "Ngân", vai: "Thánh Hóng", icon: "👀", chuc: "Mạng xã hội", luong: 13000000 , mau: "#d8c93a", cau: "Biết tin trước khi tin xảy ra." },
  { ma: "con_ong_chau_cha", ten: "Long", vai: "Con Ông Cháu Cha", icon: "👑", chuc: "Phó phòng Marketing", luong: 25000000 , mau: "#3a3a3f", cau: "Đi trễ có lý do: chú anh." },
  { ma: "chua_te_deadline", ten: "Vũ", vai: "Chúa Tể Deadline", icon: "⏰", chuc: "Điều phối dự án", luong: 13000000 , mau: "#7d8086", cau: "Deadline là mai. Mai là bao giờ?" },
  { ma: "thuc_tap_sinh", ten: "Duy", vai: "Thực Tập Sinh", icon: "🐣", chuc: "Thực tập sinh 30 tuổi", luong: 4000000 , mau: "#6f9fd0", cau: "Ba mươi tuổi, thẻ kim cương, vẫn thực tập." },
  { ma: "ke_toan", ten: "Thương", vai: "Kế Toán", icon: "💰", chuc: "Kế toán trưởng", luong: 25000000 , mau: "#8a5a3c", cau: "Từng đồng đều phải có hóa đơn." },
  { ma: "hr", ten: "Tuấn", vai: "HR", icon: "☕", chuc: "Nhân sự", luong: 18000000 , mau: "#5fbf9a", cau: "Công ty là gia đình. Của sếp." },
  { ma: "it", ten: "Bảo", vai: "IT", icon: "🔌", chuc: "IT, âm thanh ánh sáng", luong: 13000000 , mau: "#2a2c31", cau: "Đã thử tắt đi bật lại chưa?" },
  { ma: "idol_het_thoi", ten: "Phát", vai: "Idol Hết Thời", icon: "🎤", chuc: "Ca sĩ độc quyền", luong: 8000000 , mau: "#7b4bb3", cau: "Bản hit duy nhất: Công Viên, 2015." },
  { ma: "quan_ly_idol", ten: "Thái", vai: "Quản Lý Idol", icon: "📞", chuc: "Quản lý nghệ sĩ", luong: 18000000 , mau: "#4a4a52", cau: "Hai điện thoại, một nghệ sĩ hết thời." },
  { ma: "bien_kich", ten: "Oánh", vai: "Biên Kịch", icon: "✍️", chuc: "Biên kịch", luong: 13000000 , mau: "#2f6b3a", cau: "Kịch bản hay lắm. Nhưng của ai?" },
  { ma: "editor", ten: "Lĩnh", vai: "Editor Cú Đêm", icon: "🦉", chuc: "Dựng phim", luong: 13000000 , mau: "#1f2a3d", cau: "Render xong thì trời cũng sáng." },
  { ma: "designer", ten: "Quỳnh", vai: "Designer", icon: "🎨", chuc: "Thiết kế", luong: 13000000 , mau: "#1fb3a5", cau: "Logo to hơn nhưng nhỏ lại giùm." },
  { ma: "sales", ten: "Huyền", vai: "Sales Nói Phét", icon: "📈", chuc: "Kinh doanh", luong: 13000000 , mau: "#d8262f", cau: "KPI 300%. Trên giấy." },
  { ma: "chi_dai", ten: "Hương", vai: "Chị Đại", icon: "🦁", chuc: "Tổ chức sự kiện", luong: 18000000 , mau: "#7d1424", cau: "Sự kiện nào cũng có chị." },
  { ma: "dan_dau_tu", ten: "Chương", vai: "Dân Đầu Tư", icon: "📉", chuc: "Phân tích số liệu", luong: 13000000 , mau: "#3f8a4f", cau: "Chart xanh thì khao, đỏ thì vay." },
  { ma: "thanh_xin_nghi", ten: "Sơn", vai: "Thánh Xin Nghỉ", icon: "🤒", chuc: "Điều phối lịch trình", luong: 13000000 , mau: "#6fb0d8", cau: "Bà ngoại ốm lần thứ mười bốn." },
  { ma: "bac_bao_ve", ten: "Bình", vai: "Bác Bảo Vệ", icon: "🛡️", chuc: "Bảo vệ", luong: 8000000 , mau: "#2a5aa8", cau: "Giữ cổng, giữ thư, giữ bí mật." },
  { ma: "sieu_nhan_hong", ten: "Nguyên", vai: "Siêu Nhân Hồng", icon: "🩷", chuc: "Đối tác chiến lược", luong: 0 , mau: "#e2558f", cau: "Mục tiêu: một triệu người theo dõi." },
  { ma: "cho", ten: "Tuất", vai: "Chó Công Ty", icon: "🐕", chuc: "Chó (ở chòi bảo vệ)", luong: 0 , mau: "#d9a24a", cau: "Ghét màu hồng. Rất ghét." },
];

export const THEO_MA = Object.fromEntries(NHAN_VAT.map(n => [n.ma, n]));

export const THU = ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"];
export function thuCuaNgay(ngay) {
  return THU[new Date(2026, 9, ngay).getDay()];
}
// Ngày đầy đủ trong game: "Thứ 5 - 01/10/2026"
export function ngayDayDu(ngay) {
  return `${thuCuaNgay(ngay)} - ${String(ngay).padStart(2, "0")}/10/2026`;
}

// Sự kiện lớn trong tháng (hiện ở thanh ngày)
export const SU_KIEN_NGAY = {
  1: "Ký hợp đồng Siêu Nhân Hồng", 4: "Ngày Động vật", 9: "Ra mắt MV", 10: "Ngày lương (rơi vào thứ 7)",
  12: "Lương về trễ", 13: "Ngày Doanh nhân", 15: "Mất điện", 16: "Gameshow", 17: "Team building Vũng Tàu",
  18: "Vũng Tàu ngày 2", 20: "20/10 + sinh nhật công ty", 22: "Kiểm tra thuế", 23: "Sinh nhật Siêu Nhân Hồng",
  24: "Hội nghị hòa giải", 27: "LL-Entertainment ra tay", 29: "Wifi sập", 30: "Họp đánh giá", 31: "Đêm Hồng Halloween",
};
