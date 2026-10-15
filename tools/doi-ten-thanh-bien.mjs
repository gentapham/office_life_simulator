// Đổi tên nhân vật viết cứng trong thoại Ink thành biến tên ({ran_doc}, {giam_doc}...) để người chơi đặt lại tên được.
// Bỏ qua: dòng chú thích, khai báo, lệnh ~, phần tag sau #, chú thích cuối dòng, và các từ ghép thường gặp (Bình luận, Ngân hàng...).
// Tên Nguyên của Siêu Nhân Hồng cố định nên không đổi.
import fs from "fs"; import path from "path";
const TEN = { ran_doc: "Hiếu", giam_doc: "Thắng", truong_phong: "Nhật", thanh_ninh: "Nhi", hong_hot: "Ngân", con_ong_chau_cha: "Long",
  chua_te_deadline: "Vũ", thuc_tap_sinh: "Duy", ke_toan: "Thương", hr: "Tuấn", it: "Bảo", idol_het_thoi: "Phát", quan_ly_idol: "Thái",
  bien_kich: "Oánh", editor: "Lĩnh", designer: "Quỳnh", sales: "Huyền", chi_dai: "Hương", dan_dau_tu: "Chương", thanh_xin_nghi: "Sơn",
  bac_bao_ve: "Bình", cho: "Tuất" };
const TU_GHEP = {
  "Bình": "tâm|luận|tĩnh|chọn|yên|thường|minh|an|trà|dân|đẳng|phục|dương", "Ngân": "hàng|sách|nga|lượng|quỹ", "Bảo": "vệ|hiểm|mật|hành|đảm|quản|tàng|lãnh|bối",
  "Thái": "độ|Lan|Bình|Nguyên", "Vũ": "trụ|khí|điệu|đạo|trường", "Huyền": "thoại|bí", "Chương": "trình", "Hiếu": "thảo|kỳ|học|động|chiến", "Thắng": "lợi|cảnh|cuộc",
  "Phát": "lộc|biểu|trực|điện|thanh|hiện|sóng|quà|wifi|pin|bộ đàm|hết cả|hành|triển|âm|huy|tài|sinh|động|ngôn|minh|tán|lương|súng|thưởng|tờ|loa|nhạc",
  "Thương": "Sếp|hiệu|con|rồi|mà|mại|lượng|trường|tích|tâm|hại|xót|nhớ|mến|vụ|binh", "Sơn": "mới|trắng|màu|hồng|móng|tường|nước|dầu|đỏ|xanh|đen|lại|hà|ca|mài",
  "Nhật": "Bản|ký|trình|thực|nguyệt|báo|thường|dụng|lệnh", "Hương": "vị|thơm|liệu|hoa|lúa|khói|nước|trầm", "Long": "lanh|trọng|đong|nhong|não|An",
  "Nhi": "đồng|khoa", "Duy": "nhất|trì|tân|tâm|vật|mỹ", "Tuấn": "tú",
};
const walk = d => fs.readdirSync(d, { withFileTypes: true }).flatMap(e => e.isDirectory() ? walk(path.join(d, e.name)) : e.name.endsWith(".ink") ? [path.join(d, e.name)] : []);
let tong = 0;
for (const f of walk("story/vi")) {
  const goc = fs.readFileSync(f, "utf8");
  const moi = goc.split("\n").map(line => {
    if (/^\s*(\/\/|VAR|CONST|LIST|~|#|INCLUDE|=)/.test(line)) return line;
    // tách phần thoại khỏi tag (#) và chú thích cuối dòng (//)
    const m = line.match(/^(.*?)(\s(?:#|\/\/).*)?$/);
    let txt = m[1], duoi = m[2] || "";
    for (const [bien, ten] of Object.entries(TEN)) {
      // từ ghép: nhận cả dạng viết thường lẫn viết hoa chữ đầu (Thái độ / Thái Độ)
      const ds = TU_GHEP[ten] ? TU_GHEP[ten].split("|").flatMap(w => [w, w[0].toUpperCase() + w.slice(1)]).join("|") : "";
      const ghep = ds ? `(?!\\s(?:${ds})(?![\\p{L}]))` : "";
      const re = new RegExp(`(?<![\\p{L}\\d_{"])${ten}(?![\\p{L}\\d_}"])${ghep}`, "gu");
      txt = txt.replace(re, () => { tong++; return `{${bien}}`; });
    }
    return txt + duoi;
  }).join("\n");
  if (moi !== goc) fs.writeFileSync(f, moi);
}
console.log(`Đã đổi ${tong} chỗ`);
