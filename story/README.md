# Thư mục truyện (Ink)

Toàn bộ thoại của game viết bằng [Ink](https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md). Game đọc các file này, chọn **cảnh** (knot) phù hợp theo ngày, giờ, địa điểm và điều kiện, rồi hiển thị thoại và lựa chọn.

## Cấu trúc

```
story/
├── README.md                 (file này: quy ước viết)
└── vi/                       (tiếng Việt; tiếng Anh sẽ ở story/en/ với cùng tên cảnh)
    ├── chung.ink             (file gốc nội dung chung)
    ├── chung/
    │   ├── bien-chung.ink    (biến & hàm dùng chung, KHÔNG sửa tùy tiện)
    │   └── ...               (sự kiện ngẫu nhiên, tin đồn, nói chuyện vặt, Đêm Hồng, kết thúc sự nghiệp)
    ├── ran_doc.ink           (file gốc của Rắn Độc)
    ├── ran_doc/
    │   ├── bien.ink          (biến riêng của nhân vật)
    │   ├── chuong-1.ink … chuong-6.ink
    │   ├── nhan-vat.ink      (hội thoại tự do với từng NPC)
    │   ├── minigame.ink      (thoại mở đầu / kết quả minigame)
    │   └── ket-thuc.ink      (6 cảnh kết thúc)
    └── <mã_nhân_vật>.ink + <mã_nhân_vật>/ …   (tương tự cho 22 nhân vật còn lại)
```

Mỗi **file gốc** (`story/vi/<mã>.ink`) có dạng:
```ink
INCLUDE chung/bien-chung.ink
INCLUDE <mã>/bien.ink
INCLUDE <mã>/chuong-1.ink
...
-> END
```

## Kiểm tra lỗi

```bash
npm install
node tools/kiem-tra-ink.mjs story/vi/ran_doc.ink   # một file
npm run kiem-tra-ink                                # tất cả file gốc
```

Mọi file phải qua kiểm tra (✅) trước khi commit.

## Quy ước viết

### 1. Cảnh (knot)
- Tên cảnh: `<mã>_<ngày tháng 4 số>_<chủ đề>`, viết thường không dấu. Ví dụ `ran_doc_0110_ky_hop_dong`, `ke_toan_1510_mat_dien`. Cảnh không gắn ngày: `<mã>_tudo_<chủ đề>`, `<mã>_mg_<minigame>`, `<mã>_kt_<kết thúc>`.
- Dòng đầu tiên của cảnh là **thẻ** (tag) cho game biết khi nào mở cảnh:
  ```ink
  === ke_toan_1510_mat_dien ===
  # ngay:15 # gio:08:05 # noi:pantry
  ```
  Thẻ có thể dùng: `ngay:<1-31>`, `gio:<hh:mm>`, `noi:<địa điểm>`, `ngau_nhien` (sự kiện có thể xảy ra), `dieu_kien:<mô tả>`, `bat_buoc` (cảnh chính, luôn xảy ra), `npc:<mã>` (cảnh nói chuyện với NPC này).
- Mỗi cảnh kết thúc bằng `-> END`.

### 2. Thoại
- **Người nói**: dòng bắt đầu bằng **mã nhân vật** rồi dấu hai chấm. Game tự đổi sang tên hiển thị.
  ```ink
  hong_hot: Ê ê, nghe gì chưa?
  ```
- **Người nói phụ** (không thuộc 23 nhân vật chính) dùng mã có trong [ten-nguoi-noi.json](ten-nguoi-noi.json). Mã mới phải được thêm vào file đó, kèm tên tiếng Việt và tiếng Anh.
- **Tên trong câu**: luôn dùng biến, **không bao giờ viết cứng tên**: `{hong_hot}`, `{giam_doc}`, `{cong_ty}`. Biệt danh cũng vậy: `{ran_doc} Ếch`.
- **Xưng hô**: `{anh_chi()}`, `{ong_ba()}` (cho người chơi), `{anh_chi_cua("ke_toan")}`, `{ong_ba_cua("hong_hot")}`, `{ong_ay_cua("truong_phong")}`.
- **Dẫn truyện / mô tả** (không ai nói): cả dòng bọc trong dấu gạch dưới: `_Bác {bac_bao_ve} uống một ngụm trà đá._`. **Không** bắt đầu dòng bằng `*` (Ink hiểu là lựa chọn).
- **Hành động trong câu thoại**: `*(...)*` ở giữa câu thì được: `cho: Gâu! *(vẫy đuôi)*`.

### 3. Lựa chọn
```ink
* [😇 "Dạ em chào anh."]
    ~ qh("sieu_nhan_hong", 5)
    sieu_nhan_hong: Chào em!
* [🐍 "Anh có nhớ xóm Cây Me hông?"]
    ~ rd_moi_han = rd_moi_han + 20
* {biet(clone_thang)} [🔒 "Tui biết ai là clone của sếp."]
    -> ...
- -> END
```
- Mỗi lựa chọn mở đầu bằng biểu tượng: 😇 hiền / thật lòng, 🐍 độc, 🧂 thêm mắm, 🔥 đổ dầu, 😶 im lặng / né, 🤝 giúp đỡ, 💬 hỏi thêm, 🔒 lựa chọn ẩn (có điều kiện), ⏱️ hết giờ.
- **Lựa chọn có giờ**: thêm thẻ `# hen_gio:<giây>` vào câu thoại ngay trước các lựa chọn, và để lựa chọn cuối là `* [⏱️ (Không chọn kịp)]`. Game tự chọn nó khi hết giờ.
- **Lựa chọn ẩn**: dùng điều kiện `{...}` trước dấu `[`.
- Dùng `*` (chọn 1 lần). Chỉ dùng `+` khi lựa chọn được phép lặp lại.

### 4. Biến & hàm chung (trong `chung/bien-chung.ink`)
| Dùng | Ý nghĩa |
|---|---|
| `~ qh("ma", n)` | Đổi quan hệ người chơi với nhân vật đó |
| `~ follow(n)` | Cộng / trừ người theo dõi Siêu Nhân Hồng (theo bảng điểm trong `docs/so-tay-su-that.md`) |
| `~ scandal()` | Đếm thêm một scandal |
| `~ tien_cong(n)` | Cộng / trừ tiền (đồng) |
| `~ an(n)`, `~ uong(n)`, `~ nghi(n)`, `~ cang_thang(n)` | Đổi No, Khát, Năng lượng, Stress |
| `~ nhan(xuc_xich)`, `co(xuc_xich)`, `~ mat(xuc_xich)` | Túi đồ (danh sách `tui_do`) |
| `~ phat_hien(trang_47)`, `biet(trang_47)` | Bí mật chung đã biết (danh sách `bi_mat`) |
| `~ chot_ket_thuc("ten_ket_thuc")` | Chốt kết thúc của nhân vật |
| `ngay`, `gio`, `vai`, `ran_thu_hai`, `uy_tin`, `nguoi_theo_doi`, `tinh_than_cong_ty` | Đọc trạng thái |

**Không sửa `bien-chung.ink`**. Biến riêng của nhân vật khai báo trong `<mã>/bien.ink`, với **tiền tố riêng** (ví dụ `rd_` cho Rắn Độc, `kt_` cho Kế Toán). Đồ vật hay bí mật mới chỉ dùng trong một nhân vật thì khai báo thành `VAR <tiền tố>_co_<đồ> = false` trong `bien.ink` của nhân vật đó.

### 5. Nội dung
- Theo đúng [docs/so-tay-su-that.md](../docs/so-tay-su-that.md) (nguồn sự thật duy nhất), file nhân vật trong `docs/roles/` và [docs/huong-dan-viet-truyen.md](../docs/huong-dan-viet-truyen.md).
- Giọng: Thắng, Nhật, Bình nói giọng Bắc. Còn lại giọng Nam.
- Câu thoại ngắn, tối đa khoảng 2 dòng trên màn hình.
- Không dùng tên người thật, tên thương hiệu thật. Không nội dung tình dục, không chửi thề nặng.

## Việc game (code) phải tự làm

Các file truyện **không** làm những việc sau. Phần code của game phải lo:

- **Trả lương** theo cách người chơi chọn (ngày, tuần, tháng). Lương tháng về ngày 12/10.
- **Cộng người theo dõi mặc định** cho các sự kiện cố định (MV 9/10, gameshow 16/10, livestream 23/10…) và mức tăng tự nhiên mỗi ngày, theo bảng điểm trong `docs/so-tay-su-that.md`. Các lệnh `follow()` trong truyện chỉ là phần đóng góp thêm của người chơi.
- **Giảm chỉ số theo thời gian**: No, Khát, Năng lượng, và Độ Nổi Tiếng của Phát (giảm 1 mỗi ngày).
- **Chạy minigame**: cảnh truyện chuyển tới cảnh mở đầu minigame (`..._mg_..._mo` / `minigame:<id>`) rồi dừng. Game chạy minigame, xong thì gọi cảnh thắng hoặc thua tương ứng.
- **Chọn cảnh**: dựa vào thẻ `ngay`, `gio`, `noi`, `npc`, `ngau_nhien`, `vai_khong`, `bat_buoc`, `dieu_kien`.
- **Lựa chọn có giờ**: đếm ngược theo thẻ `hen_gio`, hết giờ thì chọn lựa chọn ⏱️.
- **Tin đồn**: các mẫu trong `chung/tin-don.ink` in ra một câu không có người nói. Game thêm `<mã người kể>: ` vào đầu câu.
- **Cuối game**: tối 31/10 chạy `chung_3110_dem_hong`. Tới dòng có thẻ `hien_ket_thuc_nhan_vat`, game gọi `<mã>_3010_danh_gia` của nhân vật người chơi, rồi gọi `chung_3110_ket_thuc_su_nghiep` và `chung_3110_mot_thang_sau`.
- **Chế độ chó**: khi người chơi là Tuất, dòng có thẻ `phu_de:` chỉ hiện phần phụ đề nếu bật chế độ "dịch tiếng người".
