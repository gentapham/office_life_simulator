# Giả Lập Một Ngày Làm Nhân Viên Văn Phòng: Tài liệu thiết kế game (GDD)

> **Tên game:** Giả Lập Một Ngày Làm Nhân Viên Văn Phòng
> **Tên tiếng Anh:** Office Worker For A Day

> Phiên bản: 0.1 (bản nháp đầu tiên)
> Trạng thái: đang thảo luận, chưa code

Tài liệu này là "kim chỉ nam" cho cả dự án. Mọi quyết định về gameplay, thế giới, nhân vật và kỹ thuật được ghi lại ở đây trước khi code.

Các tài liệu liên quan:
- [Thế giới & bản đồ](world/the-gioi.md)
- [Danh sách nhân vật](roles/README.md)
- [Role Rắn Độc (chi tiết)](roles/ran-doc.md)
- [Hướng dẫn viết truyện](huong-dan-viet-truyen.md)

---

## 1. Tầm nhìn

**Một câu:** game giả lập đi làm ở một công ty giải trí đầy drama, nơi mỗi câu nói của bạn có thể khiến người khác lên chức, bị đuổi việc, hoặc bị đánh ghen.

**Cốt truyện chung:** công ty **G-Entertainment** được **Genta** thành lập ngày **20/10/2010**. Genta là **chủ đầu tư ở nước ngoài**, không có mặt ở công ty. Mọi việc ở Việt Nam do Giám Đốc Thắng điều hành. Công ty có **22 nhân viên** và một siêu sao mới nổi là **Siêu Nhân Hồng**. Nhiệm vụ chung của cả công ty là **đưa Siêu Nhân Hồng nổi tiếng trong giới showbiz Việt Nam**. Người chơi nhập vai một trong 22 nhân viên, hoặc chính Siêu Nhân Hồng, vừa góp sức (hoặc phá đám) nhiệm vụ chung, vừa khám phá bí ẩn và drama trong công ty.

**Đối tượng:** dân văn phòng Việt Nam, 20 đến 35 tuổi. Đi làm 8 tiếng xong, tối về chơi game "đi làm" tiếp cho vui.

**Giọng điệu:** bựa, troll, châm biếm đời văn phòng Việt Nam. Dùng meme và tiếng lóng mấy năm gần đây. Cười là chính, nhưng thỉnh thoảng có một chút thật lòng để người chơi thấy mình trong đó.

### Bốn trụ cột

1. **Chuyện nhiều không đếm xuể.** Mỗi lần chơi ra một chuyện khác. Câu chuyện vừa viết tay, vừa tự sinh ra từ việc 23 nhân vật (22 nhân viên và Siêu Nhân Hồng) tương tác với nhau.
2. **Lời nói có hậu quả.** Mọi lựa chọn trong hội thoại đều được ghi nhớ. Tin đồn lan, biến dạng, rồi quay lại cắn người tung ra nó.
3. **Ai cũng có câu chuyện riêng.** Mỗi role có công việc thật, cách nói chuyện riêng, bí mật riêng và 6 kết thúc riêng.
4. **Đời thường mà hài.** Đói, khát, hết tiền, kẹt xe, deadline, sếp gọi lúc 11 giờ đêm.

---

## 2. Nền tảng & kỹ thuật

| Hạng mục | Quyết định |
|---|---|
| Nền tảng | Web, chạy trên trình duyệt |
| Ưu tiên | Máy tính (bàn phím + chuột), tối ưu thêm cho điện thoại |
| Đồ họa | Three.js, 3D low-poly |
| Hosting | GitHub Pages (miễn phí), tự động deploy bằng GitHub Actions |
| Ngôn ngữ | Tiếng Việt (chính) và tiếng Anh. Người chơi chọn trước khi vào game |
| Âm thanh | Có: nhạc nền theo địa điểm, hiệu ứng, "giọng" nhân vật kiểu Animal Crossing |
| Lưu game | Lưu trên trình duyệt, xuất/nhập file save. Xem mục 9 |

### Góc nhìn camera
- **Góc nhìn thứ 3** (mặc định): camera sau lưng nhân vật.
- **Góc nhìn thứ 1**: nhìn qua mắt nhân vật. Hợp để nghe lén, núp, hóng chuyện.
  - **Thấy 2 tay** của nhân vật ở góc dưới màn hình. Đi thì tay đung đưa theo bước chân, đứng yên thì tay thả lỏng.
  - **Tay tương tác với đồ vật**: cầm ly cà phê, gõ bàn phím, bấm điện thoại, mở cửa, đưa quà, xoa đầu chó Tuất (hoặc rụt tay lại khi Tuất gầm gừ).
  - Mỗi nhân vật có **tay riêng**: tay áo đúng trang phục, phụ kiện riêng (đồng hồ của Thắng, găng tay hồng của Siêu Nhân Hồng, chân trước của Tuất khi chơi role chó).
- **Bản đồ isometric**: nhìn chéo từ trên xuống toàn khu vực, dùng làm bản đồ lớn.
- Đổi góc nhìn bằng phím `V`. Trên điện thoại có nút riêng.
- **Hội thoại hiển thị giống nhau ở cả 2 góc nhìn**: khung thoại, tên người nói, các lựa chọn trả lời và bong bóng chữ trên đầu NPC đều đầy đủ như nhau. Đổi góc nhìn giữa chừng cuộc hội thoại cũng được.

### Điều khiển
| Hành động | Máy tính | Điện thoại |
|---|---|---|
| Di chuyển | `W A S D` | Joystick ảo bên trái |
| Xoay camera | Chuột | Vuốt nửa màn hình bên phải |
| Nói chuyện / tương tác | `E` | Nút "Nói chuyện" |
| Chạy | `Shift` | Đẩy joystick hết cỡ |
| Điện thoại trong game | `Tab` | Nút điện thoại |
| Đổi góc nhìn | `V` | Nút camera |
| Bản đồ | `M` | Nút bản đồ |

### Hiệu năng
- Bản đồ chia thành **khu vực**, chỉ tải khu vực đang đứng và khu bên cạnh.
- Đồ vật lặp lại (bàn, ghế, cây, đèn đường) vẽ bằng instancing để nhẹ máy.
- Có mức đồ họa Thấp / Vừa / Cao. Điện thoại mặc định là Thấp.

---

## 3. Vòng lặp chính

### Một ngày trong game

| Giờ trong game | Hoạt động |
|---|---|
| 06:30 | Thức dậy ở nhà trọ. Kiểm tra điện thoại: tin nhắn Zola, group công ty |
| 07:00 – 08:00 | Ăn sáng, đi làm. Sự kiện trên đường: kẹt xe, mưa ngập, gặp đồng nghiệp ở quán bánh mì |
| 08:00 | Chấm công. Trễ 1 phút là bị ghi tên |
| 08:00 – 12:00 | Ca sáng: nhiệm vụ công việc, họp, hội thoại |
| 12:00 – 13:30 | Nghỉ trưa: ăn cơm, buôn chuyện, ngủ trưa, hẹn hò lén |
| 13:30 – 17:30 | Ca chiều. Sếp hay giao việc lúc 17:25 |
| 17:30 – 23:00 | Tự do: siêu thị, rạp phim, quán nhậu, gym, hẹn hò, làm freelancer, hoặc **tăng ca** |
| 23:00 | Đi ngủ. Thức khuya thì hôm sau mệt |

**Tốc độ thời gian:** 1 phút trong game = 1 giây ngoài đời. Một ngày đầy đủ khoảng 18 đến 20 phút chơi. Có thể ngủ để tua qua đêm, và tua nhanh khi đang làm việc nhàm chán.

**Cuối tuần:** thứ 7, chủ nhật không đi làm (trừ khi bị gọi tăng ca). Dành cho hẹn hò, giải trí, sự kiện đặc biệt.

### Một lượt chơi = một "mùa" 30 ngày
- Ngày 1: nhận việc, chọn role, làm quen.
- **Nhận lương** theo cách người chơi đã chọn: mỗi ngày, mỗi cuối tuần, hoặc ngày 10.
- Giữa mùa: các tuyến truyện chính lên cao trào. Có sự kiện lớn như team building, ra mắt phim, họp toàn công ty.
- Ngày 30: **đánh giá cuối mùa**, game quyết định kết thúc dựa trên mọi thứ đã xảy ra.
- Một số kết thúc có thể xảy ra **sớm**, ví dụ bị đuổi việc giữa chừng.

---

## 4. Chọn role & đặt tên

1. Màn hình đầu tiên: **chọn ngôn ngữ** (Tiếng Việt / English).
2. **Chọn role** trong **23 nhân vật**: 22 nhân viên (21 người và chó Tuất) hoặc **Siêu Nhân Hồng**. Mặc định gợi ý **Rắn Độc**.
3. **Đặt tên** cho nhân vật của mình và cho các NPC (không bắt buộc):
   - Mỗi tên tối đa **16 ký tự**, có dấu tiếng Việt.
   - Mỗi role có **tên mặc định** (danh sách bạn sẽ gửi) và **danh sách tên gợi ý** để chọn nhanh.
   - Có nút "Để tên mặc định hết" cho người lười.
4. Trong mọi câu thoại và tin nhắn, tên hiển thị **tự lấy theo tên người chơi đã đặt**, hoặc tên mặc định nếu không đặt.
5. Role người chơi chọn sẽ do người chơi điều khiển, **22 role còn lại là NPC**. Ví dụ chơi Kế Toán thì Rắn Độc trở thành NPC và đi gây chuyện với bạn.

---

## 5. Hệ thống nhân vật

### 5.1. Chỉ số sinh tồn

| Chỉ số | Giảm khi | Hết thì sao |
|---|---|---|
| **No** | Theo thời gian | Hoa mắt, đi chậm, nói chuyện cục cằn |
| **Khát** | Theo thời gian, nhanh hơn khi trời nóng | Giống khi đói, nặng hơn |
| **Năng lượng** | Làm việc, thức khuya | Ngủ gật tại bàn, dễ bị sếp bắt |
| **Stress** | Bị mắng, deadline, drama | Stress đầy thì "toang": khóc ở toilet, nghỉ ốm, hoặc nổ tung trong cuộc họp |

### 5.2. Chỉ số xã hội
- **Quan hệ** với từng NPC, từ -100 (kẻ thù) tới +100 (bạn thân / người yêu).
- **Uy tín công việc**: sếp và đồng nghiệp đánh giá bạn làm việc thế nào.
- **Danh tiếng**: mọi người nói gì về bạn sau lưng.
- **Chỉ số riêng của role**: ví dụ Rắn Độc có *Độ Độc* và *Độ Nghi Ngờ*, Thánh Nịnh có *Điểm Nịnh*, Siêu Nhân Hồng có *Độ Nổi Tiếng*.

### 5.3. Tiền
| Nguồn thu | Ghi chú |
|---|---|
| Lương cứng | Khác nhau theo role. Người chơi chọn cách nhận lương (xem bên dưới) |
| Thưởng nhiệm vụ | Tiền nhỏ hoặc vật phẩm |
| Freelancer | Làm buổi tối ở nhà hoặc quán cà phê. Có tiền nhưng mất giờ ngủ |
| Nhậu với sếp | Không có tiền, nhưng có khi được tăng lương |

**Cách nhận lương** (chọn lúc bắt đầu game, đổi được ở phòng Kế Toán, mỗi tuần đổi tối đa 1 lần):

| Cách nhận | Khi nào nhận | Phù hợp với | Ưu / nhược (bản nháp) |
|---|---|---|---|
| **Theo ngày** | Cuối mỗi ca làm | Người mới chơi, muốn dễ thở | Không lo hết tiền. Không có thưởng thêm |
| **Theo tuần** | Chiều thứ 6 | Người chơi bình thường | Cân bằng. Thưởng chuyên cần nhỏ nếu cả tuần không đi trễ |
| **Theo tháng** | Ngày 10 (đúng chất văn phòng) | Người thích thử thách | Phải biết chi tiêu cả tháng. Thưởng thêm 10% và được tham gia drama "lương về trễ" ngày 10 |

| Khoản chi | Ghi chú |
|---|---|
| Ăn uống | Bánh mì, cơm tấm, trà sữa, đồ siêu thị |
| Tiền trọ | Đóng đầu tháng cho bà chủ trọ |
| Giải trí | Xem phim, nhậu, gym |
| Quà cáp | Sinh nhật đồng nghiệp, đám cưới (phong bì) |
| Đi lại | Xăng, Grab |

**Hết tiền** thì có thể: vay đồng nghiệp (ảnh hưởng quan hệ), ứng lương ở Kế Toán (bị nói móc), ăn mì gói, hoặc nhận thêm job freelancer.

---

## 6. Hệ thống hội thoại

### 6.1. Cách hoạt động
- Lại gần NPC, bấm `E` để nói chuyện.
- NPC nói, rồi người chơi **chọn 2 đến 4 câu trả lời**.
- Mỗi lựa chọn thay đổi **chỉ số ẩn** (quan hệ, độ độc, độ nghi ngờ…) và có thể **đánh dấu sự kiện** (ví dụ "đã tung tin về Kế Toán").
- Kết thúc không do một câu quyết định, mà do **tổng mọi thứ đã xảy ra** trong 30 ngày.

### 6.2. Các loại lựa chọn đặc biệt
- 🔒 **Lựa chọn ẩn**: chỉ hiện khi bạn biết một bí mật, có một vật phẩm, hoặc có quan hệ đủ thân.
- ⏱️ **Lựa chọn có giờ**: phải chọn trong vài giây, ví dụ sếp đang đi tới.
- 🐍 **Lựa chọn của role**: mỗi role có kiểu câu riêng. Rắn Độc có câu "nhả độc", Thánh Nịnh có câu "nịnh".
- 🎲 **Lựa chọn rủi ro**: kết quả có may rủi, ví dụ nói dối có thể bị phát hiện.

### 6.3. Tin đồn
- Tin đồn là một "vật" trong game: có **nội dung**, **người bị nói**, **người tung ra** và **độ cay**.
- NPC nhiều chuyện sẽ kể lại cho người khác. Mỗi lần kể, tin có thể bị **thêm mắm dặm muối** ("A đi trễ" lan thành "A sắp nghỉ việc").
- Khi tin tới tai người bị nói, họ sẽ **truy ngược** xem ai tung ra. Nếu ra bạn thì toang.

### 6.4. Trí nhớ NPC
Mỗi NPC nhớ: ai từng giúp mình, ai nói xấu mình, ai nợ tiền mình, ai từng hẹn hò với ai. NPC dùng trí nhớ này khi nói chuyện. Ví dụ: "Ủa, hôm bữa ông nói xấu tui với Ngân đúng hông?"

---

## 7. Câu chuyện

### 7.1. Ba lớp câu chuyện
1. **Tuyến truyện chính của role** (viết tay): mỗi role có một chuỗi sự kiện xuyên suốt 30 ngày, dẫn tới 6 kết thúc.
2. **Sự kiện chung của công ty** (viết tay): team building, sinh nhật, ra mắt phim, cắt giảm nhân sự, mất điện, kiểm tra thuế… Ai chơi role nào cũng gặp, nhưng thấy ở góc nhìn khác.
3. **Chuyện tự sinh** (hệ thống): tin đồn, cãi nhau, yêu đương, đánh ghen nảy sinh từ quan hệ giữa các NPC. Không lần chơi nào giống lần nào.

### 7.2. Các chủ đề lớn
Yêu đương, đánh ghen, nói xấu (cả nói xấu sếp), tranh ghế, lên chức, lên lương, bị đuổi việc, đi trễ, tăng ca, team building, phốt mạng xã hội, showbiz, nợ nần, đầu tư thua lỗ.

### 7.3. Kết thúc
**Mỗi lượt chơi kết thúc bằng 2 cái kết:**
1. **Kết thúc của nhân vật người chơi chọn**: 6 kết thúc cho mỗi nhân vật, gồm **3 kết thúc có hậu và 3 kết thúc buồn**.
2. **Kết thúc của Siêu Nhân Hồng**: Siêu Nhân Hồng có nổi tiếng hay không, tùy vào việc cả công ty (và người chơi) đã làm gì trong 30 ngày. Có 6 kết thúc, cũng gồm 3 có hậu và 3 buồn.

Hai cái kết độc lập với nhau, nên có những tổ hợp trớ trêu: bạn lên chức nhưng Siêu Nhân Hồng thất bại, hoặc bạn bị đuổi việc nhưng Siêu Nhân Hồng thành siêu sao.

**Khi người chơi chọn Siêu Nhân Hồng**, hai cái kết vẫn tách riêng:
- Kết thúc **đời tư** của Nguyên (6 kết thúc riêng): tình cảm với Vũ, mối thù với Tuất, bí mật mặt thật sau chiếc mũ.
- Kết thúc **sự nghiệp** (6 kết thúc ở bảng bên dưới): có nổi tiếng hay không.

**Tổng: 23 nhân vật × 6 + 6 kết thúc sự nghiệp của Siêu Nhân Hồng = 144 kết thúc.**

#### Thanh "Độ Nổi Tiếng" của Siêu Nhân Hồng
- Là chỉ số chung của cả lượt chơi, hiện trên điện thoại trong game (lượt follow, lượt view, top trending).
- Mỗi role đóng góp theo nghề của mình: Designer làm poster, Editor dựng MV, Ngân đăng bài, Huyền tìm nhà tài trợ, Hương tổ chức show…
- Drama trong công ty cũng ảnh hưởng: có drama làm Siêu Nhân Hồng nổi hơn (scandal cũng là PR), có drama làm mọi thứ đổ bể.
- Các NPC cũng tự góp sức (hoặc phá) theo tính cách và quan hệ của họ.

#### Sáu kết thúc của Siêu Nhân Hồng (bản nháp)
| Loại | Tên | Tóm tắt |
|---|---|---|
| 😄 Có hậu | 🌟 **Siêu Sao Hạng A** | Siêu Nhân Hồng thống trị mọi bảng xếp hạng, G-Entertainment trả hết nợ |
| 😄 Có hậu | 🤡 **Meme Quốc Dân** | Không ai nhớ bài hát, nhưng cả nước dùng ảnh Siêu Nhân Hồng làm meme. Vẫn nổi, theo kiểu khác |
| 😄 Có hậu | 💗 **Tháo Mũ** | Siêu Nhân Hồng lộ mặt thật trên sóng truyền hình, và khán giả còn yêu hơn |
| 😢 Buồn | 📉 **Chìm Nghỉm** | Không ai biết Siêu Nhân Hồng là ai. Bộ đồ hồng được treo trong kho công ty |
| 😢 Buồn | 🔥 **Bị Tẩy Chay** | Một scandal quá đà, cả mạng xã hội quay lưng |
| 😢 Buồn | 🏃 **Bị Cướp Mất** | Công ty đối thủ ký hợp đồng với Siêu Nhân Hồng, ngay trước buổi diễn lớn nhất |
- Mỗi role có kết thúc tốt, xấu, bựa, và ít nhất một **kết thúc bí mật** khó mở.
- Có **bộ sưu tập kết thúc**: những kết thúc đã mở hiện đầy đủ, chưa mở thì chỉ hiện gợi ý mờ.

### 7.4. Con rắn giấu mặt
Mỗi lần chơi, game chọn ngẫu nhiên **một NPC làm "rắn thứ hai"** đang ngầm gây chuyện. Người đã chơi rồi cũng không biết trước là ai.

---

## 8. Âm thanh

- **Nhạc nền theo địa điểm**: văn phòng (lofi nhẹ), siêu thị (nhạc siêu thị sến), quán nhậu (nhạc remix), rạp phim, nhà trọ ban đêm.
- **"Giọng" nhân vật**: không lồng tiếng thật, mà phát âm thanh lí nhí theo từng chữ kiểu Animal Crossing. Mỗi role có cao độ và tốc độ riêng. Con chó thì phát tiếng "gâu".
- **Hiệu ứng**: gõ phím, máy in kẹt, máy chấm công "tít", thông báo Zola, tiếng còi xe, mưa.
- **Nguồn âm thanh**: chỉ dùng âm thanh được phép dùng miễn phí (CC0) hoặc tự tạo bằng code. Không lấy nhạc có bản quyền.

---

## 9. Lưu game

**Không cần thuê VPS.** GitHub Pages chỉ chứa file tĩnh, nhưng game vẫn lưu được ngay trên trình duyệt của người chơi:

| Cách | Mô tả | Cần máy chủ? |
|---|---|---|
| **Lưu tự động** | Lưu vào bộ nhớ trình duyệt (IndexedDB) mỗi khi qua ngày mới và khi thoát | Không |
| **Nhiều ô save** | 3 ô save, mỗi ô một lượt chơi | Không |
| **Xuất / nhập file save** | Tải file save về máy, mang sang máy khác để chơi tiếp | Không |
| **Lưu đám mây** (sau này) | Đăng nhập để chơi tiếp trên mọi thiết bị. Dùng gói miễn phí của Supabase hoặc Firebase | Có, nhưng miễn phí |

Lưu ý: xóa dữ liệu trình duyệt là mất save, nên game sẽ nhắc người chơi xuất file save định kỳ.

---

## 10. Chống hack

Nói thật: game chạy hoàn toàn trên trình duyệt thì **không chặn được 100%** người cố tình sửa. Mọi thứ gửi tới trình duyệt đều đọc được nếu đủ kiên nhẫn. Cách làm thực tế là **làm khó đủ để người bình thường không mò được**:

- **Truyện được mã hóa khi build**: file truyện không nằm dạng chữ đọc được trong game đã đăng lên web, nên khó lén đọc trước kết thúc.
- **Code được nén và làm rối** khi build.
- **File save có chữ ký kiểm tra**: sửa tay file save (ví dụ tự cộng tiền) thì game phát hiện và báo "file save bị lỗi".
- **Đây là game một người chơi**: ai hack thì chỉ tự làm mất vui của họ. Nếu sau này có **bảng xếp hạng** thì mới cần máy chủ để kiểm tra.

**Đã chốt: repo để công khai.** Ai vào repo cũng đọc được truyện gốc, kể cả toàn bộ các kết thúc. Chấp nhận điều này, coi như game mã nguồn mở. Mã hóa truyện khi build chỉ để người chơi bình thường không lỡ đọc trước kết thúc trong lúc chơi.

---

## 11. Song ngữ

- Toàn bộ chữ trong game (menu, thoại, tin nhắn) đều nằm trong file ngôn ngữ, không viết cứng trong code.
- **Tiếng Việt viết trước.** Tiếng Anh là bản **phỏng dịch**, không dịch từng chữ: meme Việt được đổi sang câu đùa tương đương, hoặc giữ nguyên và chú thích.
- Tên NPC người chơi đặt giữ nguyên ở cả hai ngôn ngữ.

---

## 12. Lộ trình

| Giai đoạn | Nội dung |
|---|---|
| **0. Thiết kế** (đang làm) | GDD, thế giới, 23 nhân vật, hướng dẫn viết truyện |
| **1. Bản chạy thử** | Văn phòng + nhà trọ, đi lại góc nhìn thứ 3, hội thoại có lựa chọn, 1 ngày làm việc, lưu game |
| **2. Rắn Độc chơi được** | Tuyến truyện Rắn Độc đầy đủ 30 ngày, hệ thống tin đồn, 6 kết thúc |
| **3. Thế giới mở rộng** | Siêu thị, quán ăn, rạp phim, quán nhậu, công viên, góc nhìn thứ 1, điện thoại trong game |
| **4. Thêm role** | Lần lượt mở các role còn lại, mỗi bản cập nhật vài role |
| **5. Hoàn thiện** | Âm thanh đầy đủ, tiếng Anh, tối ưu điện thoại, bộ sưu tập kết thúc |
