# Hướng dẫn viết truyện

Tài liệu này dành cho bất kỳ ai viết thoại và câu chuyện cho game, kể cả viết thêm sau này. Mục tiêu là mọi câu chuyện đọc lên cùng một giọng, đúng nghề của từng role, và game hiển thị đúng tên người chơi đặt.

---

## 1. Giọng điệu

- **Bựa, châm biếm, nhưng không ác ý với người thật.** Cười cái tình huống văn phòng, không cười vào ngoại hình, vùng miền, giới tính hay khuyết tật của ai.
- **Đúng nghề.** Kế Toán nói chuyện hóa đơn, IT nói chuyện restart, Designer khổ vì bị sửa. Trước khi viết, đọc lại mục "Công việc" và "Cách nói" của role trong [roles/README.md](roles/README.md).
- **Ngắn.** Mỗi câu thoại tối đa khoảng 2 dòng trên màn hình. Không ai muốn đọc bài văn trong game.
- **Có một chút thật lòng.** Thỉnh thoảng cho một câu làm người chơi khựng lại: đồng nghiệp khóc ở sân thượng, thực tập sinh nhớ nhà. Hài sẽ đọng lại lâu hơn nhờ những lúc như vậy.

### Những điều tránh
- Không dùng **tên người thật** (ca sĩ, diễn viên, chính trị gia, người nổi tiếng mạng) hay **tên thương hiệu thật**. Dùng tên nhại: Zalo-lô, Phây-búc, Tóp-tóp.
- Không nội dung tình dục lộ liễu. Yêu đương, tán tỉnh, đánh ghen thì thoải mái, nhưng giữ ở mức phim hài truyền hình.
- Không chửi thề nặng. Dùng kiểu "Trời đất ơi", "Má ơi", "Ối dồi ôi".

---

## 2. Tên nhân vật trong thoại

Tên **không bao giờ viết cứng**. Luôn dùng biến trong ngoặc nhọn, game sẽ thay bằng tên người chơi đặt hoặc tên mặc định:

| Biến | Thay bằng |
|---|---|
| `{ran_doc}`, `{giam_doc}`, `{ke_toan}`… | Tên của role đó (xem mã role trong [roles/README.md](roles/README.md)) |
| `{player}` | Tên nhân vật người chơi đang điều khiển |
| `{cong_ty}` | G-Entertainment |

### Xưng hô theo giới tính
Tiếng Việt xưng hô theo giới tính và tuổi, nên mỗi nhân vật (kể cả người chơi) có giới tính. Dùng biến xưng hô thay vì viết cứng:

| Biến | Ví dụ kết quả |
|---|---|
| `{anh_chi}` | anh / chị (người chơi) |
| `{ong_ba}` | ông / bà (người chơi, cách bạn bè gọi nhau thân mật) |
| `{anh_chi_cua(ke_toan)}` | anh / chị (theo giới tính của Kế Toán) |
| `{ong_ba_cua(hong_hot)}` | ông / bà (cách bạn bè gọi nhau thân mật) |
| `{ong_ay_cua(truong_phong)}` | ổng / bả (ngôi thứ ba) |

> Giới tính của từng role đã chốt trong [roles/README.md](roles/README.md) và không đổi được. Người chơi chỉ đổi tên. Dù vậy vẫn nên dùng biến xưng hô, để thoại dùng lại được ở nhiều chỗ.

---

### Giọng vùng miền
Phần lớn nhân vật nói **giọng miền Nam**. Ba người nói **giọng miền Bắc**: **Thắng**, **Nhật**, **Bình**. Viết thoại phải đúng giọng từng người:

| | Miền Nam | Miền Bắc |
|---|---|---|
| Tôi / bạn (thân) | tui / ông, bà, mày | tớ / cậu, mày |
| Không | hông, hem, khum | không |
| Anh ấy / chị ấy | ổng / bả | anh ấy / chị ấy |
| Cuối câu | nha, nè, hen, á, đó | nhé, nhỉ, đấy, thế, cơ |
| Ví dụ | "Ủa, ổng nói gì kỳ vậy?" | "Ơ, anh ấy nói gì lạ thế nhỉ?" |
| Ví dụ | "Đi ăn hông bà?" | "Đi ăn không cậu?" |

Hai giọng nói chuyện với nhau cũng là chất liệu gây cười, ví dụ Nhật nói "cái bát", Hiếu hỏi lại "cái chén hả anh?".

Tuổi và thứ bậc xưng hô của từng nhân vật nằm trong [roles/README.md](roles/README.md), mục "Thứ bậc tuổi & xưng hô".

## 3. Định dạng file truyện

Truyện được viết bằng **Ink**, một ngôn ngữ chuyên cho truyện nhiều lựa chọn. File có đuôi `.ink`, đọc gần như văn bản thường.

```ink
=== pantry_noi_xau_sep ===
{hong_hot}: Ê ê, đọc group chưa? Sếp lại nhắn lúc 11 giờ đêm kìa.

* [🐍 Nghe nói sếp định cắt thưởng Tết để mua xe mới đó.]
    ~ do_doc += 15
    ~ nghi_ngo += 10
    ~ lan_tin("sep_cat_thuong", hong_hot)
    {hong_hot}: Trời đất! Để tui kể mấy đứa bên kia nghe!
* [😇 Thôi, chắc sếp cũng áp lực.]
    ~ tin_tuong += 5
    {hong_hot}: Ờ… {ong_ba} hiền quá à.
* {biet("clone_cua_sep")} [🔒 Có người trong group là clone của sếp đó.]
    -> truy_tim_clone
- -> END
```

### Quy ước
- **Tên đoạn truyện:** `<địa điểm>_<chủ đề>`, viết thường, không dấu. Ví dụ `pantry_noi_xau_sep`, `quan_oc_danh_ghen`.
- **Thư mục:** mỗi role một thư mục, sự kiện chung để riêng:
  ```
  story/
  ├── vi/
  │   ├── ran_doc/
  │   ├── ke_toan/
  │   ├── ...
  │   └── chung/          (sự kiện cả công ty)
  └── en/
  ```
- Mỗi lựa chọn nên có biểu tượng đầu dòng cho biết kiểu: 🐍 độc, 😇 hiền, 🧂 thêm mắm, 🔒 ẩn, ⏱️ có giờ.

---

## 4. Kho meme & tiếng lóng

Dùng **vừa phải**, tối đa 1 meme mỗi đoạn hội thoại, và hợp tính cách nhân vật: Thánh Hóng dùng nhiều, Bác Bảo Vệ gần như không.

> ⚠️ Meme lỗi thời rất nhanh. Danh sách cập nhật tháng 10/2026, chia 2 nhóm: **mới** (2025 – 2026) và **kinh điển** (vẫn dùng được). Không dùng meme gắn với tên người thật.

### Meme mới (2025 – 2026)

| Meme / tiếng lóng | Nghĩa | Hợp với |
|---|---|---|
| To6 | "Toxic", độc hại | Mọi người nói về Rắn Độc |
| Bốc trúng sít rịt | Gặp chuyện trớ trêu, xui hiếm có (từ trend bóc hộp mù "secret") | Bị xếp ngủ chung phòng với người mình ghét ở Vũng Tàu |
| Hướng nội hết phần đời còn lại | Quê tới mức chỉ muốn trốn, không gặp ai nữa | Bị bắt quả tang nói xấu, livestream lỗi |
| Thân chưa mà giỡn | Mình chưa thân tới mức đùa vậy đâu | Tuất nói với Nguyên (bằng tiếng chó), Thương nói với Huyền khi bị xin tạm ứng |
| Mời đoàn mình di chuyển lên núi | Xấu hổ quá, rút lui thôi | Cả phòng họp khi Thắng phát biểu sai |
| Ok mom | Dạ dạ cho qua, khi bị nhắc nhở | Vũ trả lời Nhật |
| Chưa đủ wow | Chưa ấn tượng | Thắng duyệt poster của Quỳnh |
| 6-7 | Câu nói vô nghĩa, nói cho vui | Duy cố bắt trend của giới trẻ |
| 8386 | Lời chúc phát lộc (nổi từ một video chúc 20/10) | Ngày 20/10, Chương chúc cả công ty |
| No cap | Nói thật, không xạo | Huyền (dù đang xạo) |
| Slay | Quá đỉnh, quá chất | Siêu Nhân Hồng tạo dáng |
| Đám cá tươi | Nói lái của "đám cưới ta" | Ngân trêu cặp đôi bị đồn |

### Meme kinh điển (vẫn dùng được)

| Meme / tiếng lóng | Nghĩa | Hợp với |
|---|---|---|
| Ét o ét | SOS, cứu với | Chúa Tể Deadline, Thực Tập Sinh |
| Ối dồi ôi | Than trời | Thánh Hóng, Chị Đại |
| Gét gô | Let's go, xuất phát | Siêu Nhân Hồng, Con Ông Cháu Cha |
| Khum | Không (nói dễ thương) | Thực Tập Sinh, Designer |
| Ủa alo? | Ngạc nhiên, khó hiểu | Thánh Hóng |
| Còn cái nịt | Mất hết | Dân Đầu Tư |
| Sao mà căng | Căng thẳng quá vậy | Sales |
| Đỉnh nóc, kịch trần | Đỉnh cao nhất | Thánh Nịnh khen sếp |
| Báo thủ | Người toàn làm hại người khác | Mọi người gọi Rắn Độc |
| Tinh tướng | Tỏ ra mình giỏi | Mọi người nói về Idol Hết Thời |
| Phông bạt | Khoe khoang, làm màu | Idol Hết Thời, Sales |
| Thao túng tâm lý | Dụ người khác nghĩ theo ý mình | Rắn Độc, HR |
| Red flag / green flag | Dấu hiệu xấu / tốt (khi yêu) | Chuyện tình công sở |
| Toang | Hỏng hết rồi | Mọi người |
| Xu cà na | Xui xẻo | Thánh Xin Nghỉ |
| Hết cứu | Vô phương cứu chữa | Designer nói về feedback của sếp |
| Chill guy | Người lúc nào cũng thản nhiên | Chúa Tể Deadline |

### Chất liệu đời văn phòng Việt Nam
- Group Zalo công ty nhắn lúc 11 giờ đêm, "đã xem" mà không trả lời.
- "Anh không ép, tùy em."
- Ngày 10 có lương, ngày 15 hết tiền.
- Hỏi lương, hỏi bao giờ lấy vợ lấy chồng.
- Hội ăn trưa, đặt trà sữa chung, chia tiền lẻ.
- Họp "5 phút" kéo dài 2 tiếng.
- Team building Vũng Tàu, trò chơi tập thể bắt buộc.
- Sinh nhật đồng nghiệp: góp tiền mua bánh kem, hát chúc mừng, rồi ai về chỗ nấy.
- Phong bì đám cưới đồng nghiệp: bao nhiêu là vừa?
- Thử việc 2 tháng, lương 85%.
- Kẹt xe giờ cao điểm, mưa ngập đường.

---

## 5. Kết thúc

Mỗi nhân viên có **đúng 6 kết thúc**: **3 kết thúc có hậu** và **3 kết thúc buồn**.

| Loại | Số lượng | Ví dụ |
|---|---|---|
| 😄 Có hậu | 3 | Lên chức, lên lương, tìm được tình yêu, nghỉ việc làm điều mình thích |
| 😢 Buồn | 3 | Bị đuổi việc, bị lật tẩy, phá sản, mất hết bạn bè |

Nên có ít nhất một kết thúc **bí mật** (điều kiện khó, phải chơi nhiều lần mới mở được), nằm trong 6 kết thúc trên. Kết thúc có thể bựa, miễn vẫn rõ là có hậu hay buồn.

Mỗi kết thúc cần ghi rõ: **tên**, **loại** (có hậu / buồn), **điều kiện** (theo chỉ số và sự kiện đã xảy ra), và **cảnh cuối** (1 đoạn ngắn mô tả hình ảnh cuối cùng người chơi thấy).

Ngoài kết thúc của nhân vật, mỗi lượt chơi còn có **kết thúc của Siêu Nhân Hồng** (xem [GDD.md](GDD.md), mục 7.3). Khi viết truyện cho một role, nhớ cho role đó **cách góp sức hoặc phá** việc lăng xê Siêu Nhân Hồng theo đúng nghề của họ.

---

## 6. Song ngữ

- Viết **tiếng Việt trước**. Tiếng Anh dịch sau.
- Tiếng Anh là **phỏng dịch**: giữ ý và độ hài, không dịch từng chữ. Meme Việt đổi sang câu đùa tương đương trong tiếng Anh.
- Mỗi đoạn truyện tiếng Anh dùng **cùng tên đoạn** với bản tiếng Việt để game ghép đúng.
