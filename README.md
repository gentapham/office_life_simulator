# Giả Lập Một Ngày Làm Nhân Viên Văn Phòng

**Office Worker For A Day**

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
- **Thế giới rộng**: Quận Hóng, Thành Phố Ước Mơ, gồm 6 khu. Nhân vật nào cũng có nhà riêng, cùng hơn 30 địa điểm: công ty, siêu thị, quán ăn, rạp phim, karaoke, công viên…
- **Sinh tồn đời văn phòng**: đói, khát, năng lượng, stress, làm thêm freelancer. Lương nhận theo ngày, theo tuần hoặc theo tháng, tùy người chơi chọn.
- **Song ngữ** Tiếng Việt / English, có âm thanh.
- **Lưu game ngay trên trình duyệt**, không cần máy chủ.

## Tài liệu thiết kế

| Tài liệu | Nội dung |
|---|---|
| [docs/GDD.md](docs/GDD.md) | Tài liệu thiết kế game: hệ thống, vòng lặp, kỹ thuật, lộ trình |
| [docs/world/the-gioi.md](docs/world/the-gioi.md) | Thế giới, bản đồ, địa điểm |
| [docs/roles/README.md](docs/roles/README.md) | 23 nhân vật: công việc, tính cách, bí mật, ý tưởng truyện |
| [docs/roles/](docs/roles/) | Truyện chi tiết của từng nhân vật (23 file): lý lịch, minigame, tuyến truyện tháng 10, hội thoại mẫu, 6 kết thúc |
| [docs/roles/ngoai-hinh.md](docs/roles/ngoai-hinh.md) | Ngoại hình nhân vật để dựng model 3D |
| [docs/world/cong-ty.md](docs/world/cong-ty.md) | Công ty G-Entertainment: lịch sử, đối thủ LL-Entertainment, hợp đồng với Siêu Nhân Hồng, lương, nội quy |
| [docs/world/lich-thang-10.md](docs/world/lich-thang-10.md) | Lịch từng ngày tháng 10/2026 và các ngày lễ |
| [docs/world/npc-phu.md](docs/world/npc-phu.md) | NPC phụ |
| [docs/world/lich-trinh-nhan-vat.md](docs/world/lich-trinh-nhan-vat.md) | Sinh nhật và lịch trình hằng ngày của từng nhân vật |
| [docs/gameplay/mo-dau-va-am-thanh.md](docs/gameplay/mo-dau-va-am-thanh.md) | Mở đầu game, ngày đầu hướng dẫn chơi, màn kết, âm thanh và bài hát |
| [docs/gameplay/vat-pham-va-cong-viec.md](docs/gameplay/vat-pham-va-cong-viec.md) | Đồ ăn uống, vật phẩm, giá cả, việc chung, job freelancer |
| [docs/huong-dan-viet-truyen.md](docs/huong-dan-viet-truyen.md) | Hướng dẫn viết thoại và câu chuyện |
| [docs/so-tay-su-that.md](docs/so-tay-su-that.md) | Sổ tay sự thật: nguồn chuẩn cho mọi chi tiết, bảng điểm chiến dịch |
| [story/](story/) | **Toàn bộ thoại trong game** (Ink): 23 nhân vật + sự kiện chung, Đêm Hồng, kết thúc |
| [docs/can-bo-sung.md](docs/can-bo-sung.md) | Tình trạng tài liệu: đã xong và còn lại |

## Công nghệ dự kiến

- [Three.js](https://threejs.org/): đồ họa 3D
- [Vite](https://vitejs.dev/): build và chạy thử
- [Ink](https://www.inklestudios.com/ink/): viết truyện nhiều lựa chọn
- GitHub Pages + GitHub Actions: host và tự động deploy

Khi phát hành, game sẽ chạy tại: **https://gentapham.github.io/office_life_simulator/**

## Lộ trình

- [x] Chốt ý tưởng, nền tảng, phong cách
- [x] Hoàn thiện tài liệu thế giới và truyện của 23 nhân vật (bản nháp, chờ duyệt)
- [x] Viết đủ thoại cho 23 nhân vật và nội dung chung (Ink)
- [ ] Bản chạy thử: văn phòng, nhà trọ, đi lại, hội thoại, 1 ngày làm việc, lưu game
- [ ] Rắn Độc chơi được trọn 30 ngày với 6 kết thúc
- [ ] Mở rộng thế giới và thêm role
- [ ] Âm thanh, tiếng Anh, tối ưu điện thoại

## Đóng góp

1. Tạo branch mới từ branch chính.
2. Commit với message rõ ràng.
3. Mở Pull Request mô tả thay đổi.

Muốn viết thêm truyện? Đọc [hướng dẫn viết truyện](docs/huong-dan-viet-truyen.md) trước nhé.
