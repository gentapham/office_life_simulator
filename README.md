# Giả Lập Một Ngày Làm Nhân Viên Văn Phòng

Game giả lập đi làm ở **G-Entertainment**, một công ty giải trí đầy drama. Nhập vai một trong 22 nhân viên hoặc chính Siêu Nhân Hồng, đi làm, nói chuyện, hóng hớt, nói xấu, yêu đương, đánh ghen… Mỗi câu trả lời của bạn quyết định ai lên chức, ai bị đuổi việc, và câu chuyện kết thúc ra sao.

Đi làm 8 tiếng chưa đủ? Tối về đi làm tiếp trong game :v

> 🚧 Dự án đang ở giai đoạn **thiết kế**, chưa có code.

## Điểm chính

- **Chơi trên web**, không cần cài đặt. Ưu tiên máy tính, tối ưu thêm cho điện thoại.
- **3D low-poly** dựng bằng Three.js. Đổi được giữa góc nhìn thứ 1 và thứ 3, có bản đồ isometric.
- **Nhiệm vụ chung:** cả công ty phải đưa siêu sao mới nổi **Siêu Nhân Hồng** nổi tiếng trong showbiz Việt.
- **23 nhân vật để nhập vai**: 22 nhân viên (21 người và chó Tuất) và Siêu Nhân Hồng. Mặc định là **Rắn Độc**.
- **Đặt tên** cho mọi nhân vật, hoặc dùng tên mặc định.
- **Hội thoại nhiều lựa chọn**, tin đồn lan và biến dạng giữa các nhân vật.
- **2 cái kết mỗi lượt chơi**: kết thúc của nhân vật bạn chọn (6 kết thúc cho mỗi nhân vật: 3 có hậu, 3 buồn) và kết thúc sự nghiệp của Siêu Nhân Hồng (6 kết thúc). Tổng 144 kết thúc.
- **Thế giới rộng**: công ty, nhà trọ, siêu thị, quán cơm, quán cà phê, rạp phim, quán nhậu, công viên…
- **Sinh tồn đời văn phòng**: đói, khát, năng lượng, stress, làm thêm freelancer. Lương nhận theo ngày, theo tuần hoặc theo tháng, tùy người chơi chọn.
- **Song ngữ** Tiếng Việt / English, có âm thanh.
- **Lưu game ngay trên trình duyệt**, không cần máy chủ.

## Tài liệu thiết kế

| Tài liệu | Nội dung |
|---|---|
| [docs/GDD.md](docs/GDD.md) | Tài liệu thiết kế game: hệ thống, vòng lặp, kỹ thuật, lộ trình |
| [docs/world/the-gioi.md](docs/world/the-gioi.md) | Thế giới, bản đồ, địa điểm |
| [docs/roles/README.md](docs/roles/README.md) | 23 nhân vật: công việc, tính cách, bí mật, ý tưởng truyện |
| [docs/roles/ran-doc.md](docs/roles/ran-doc.md) | Role Rắn Độc chi tiết: tuyến truyện, hội thoại mẫu, 6 kết thúc |
| [docs/huong-dan-viet-truyen.md](docs/huong-dan-viet-truyen.md) | Hướng dẫn viết thoại và câu chuyện |
| [docs/can-bo-sung.md](docs/can-bo-sung.md) | Danh sách những thứ còn thiếu, cần bổ sung |

## Công nghệ dự kiến

- [Three.js](https://threejs.org/): đồ họa 3D
- [Vite](https://vitejs.dev/): build và chạy thử
- [Ink](https://www.inklestudios.com/ink/): viết truyện nhiều lựa chọn
- GitHub Pages + GitHub Actions: host và tự động deploy

Khi phát hành, game sẽ chạy tại: **https://gentapham.github.io/office_life_simulator/**

## Lộ trình

- [x] Chốt ý tưởng, nền tảng, phong cách
- [ ] Hoàn thiện tài liệu thiết kế và truyện của các role
- [ ] Bản chạy thử: văn phòng, nhà trọ, đi lại, hội thoại, 1 ngày làm việc, lưu game
- [ ] Rắn Độc chơi được trọn 30 ngày với 6 kết thúc
- [ ] Mở rộng thế giới và thêm role
- [ ] Âm thanh, tiếng Anh, tối ưu điện thoại

## Đóng góp

1. Tạo branch mới từ branch chính.
2. Commit với message rõ ràng.
3. Mở Pull Request mô tả thay đổi.

Muốn viết thêm truyện? Đọc [hướng dẫn viết truyện](docs/huong-dan-viet-truyen.md) trước nhé.
