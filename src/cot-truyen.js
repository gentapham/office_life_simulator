// Bảng tóm tắt cốt truyện trước khi vào game: chuyện chung của G-Entertainment, nhiệm vụ riêng của vai đang chơi,
// cách một lượt chơi kết thúc. Viết tránh lộ bí mật của các vai (bí mật để người chơi tự khám phá).
const NHIEM_VU = {
  ran_doc: ["Nhận ra Siêu Nhân Hồng chính là đại ca bắt nạt mình hồi nhỏ, mà người ta còn không nhận ra mình.", "Cả công ty muốn Siêu Nhân Hồng nổi tiếng, còn Hiếu muốn phá cho bằng được, mà không để ai biết là mình."],
  giam_doc: ["Đưa Siêu Nhân Hồng lên 1 triệu người theo dõi trước 31/10 để công ty có thêm tiền.", "Giữ ghế sếp khi nhân viên đang chê sau lưng, và chọn một Phó Giám đốc vào ngày 30/10."],
  truong_phong: ["Giành ghế Phó Giám đốc được công bố ngày 30/10.", "Làm Siêu Nhân Hồng nổi tiếng bằng MV, gameshow, livestream để có thành tích mang vào cuộc họp đánh giá."],
  thanh_ninh: ["Giữ vị trí cánh tay phải của sếp trước một nhân viên mới ngọt như đường.", "Tính đường lui nếu con tàu công ty có dấu hiệu chìm, và không để Chị Đại bắt được lỗi nào."],
  hong_hot: ["Con số 1 triệu người theo dõi nằm ngay trên fanpage bạn quản lý: không đạt thì bạn bị hỏi đầu tiên.", "Hóng cho bằng hết tháng nhiều drama nhất lịch sử công ty, mà vẫn giữ kín bí mật của mình."],
  con_ong_chau_cha: ["Làm xong một bài hát cho Siêu Nhân Hồng.", "Chứng minh mình làm được gì đó mà không cần ô dù, dù chỉ một lần."],
  chua_te_deadline: ["Làm Producer chính cho cả chiến dịch: MV, gameshow, livestream và Đại Nhạc Hội Siêu Nhân.", "Qua được tháng này mà vẫn chill, không bị kéo đi họp, và không để chuyện cũ bị lộ."],
  thuc_tap_sinh: ["Được giữ lại làm nhân viên chính thức sau buổi đánh giá ngày 30/10.", "Đòi lại ý tưởng phim ngắn của mình, và giữ kín thân phận thật."],
  ke_toan: ["Giữ chặt từng đồng của công ty trong tháng 10 nhiều khoản chi nhất từ trước tới giờ.", "Một điều khoản trong hợp đồng với Siêu Nhân Hồng làm bạn mất ngủ: tìm hiểu cho ra lẽ trước 31/10."],
  hr: ["Tổ chức team building Vũng Tàu mà không đổ bể, và bắt bài Thánh Xin Nghỉ cho bằng được.", "Giữ cho danh sách cắt giảm có càng ít tên càng tốt, và làm mọi người bớt sợ mình."],
  it: ["Giữ cho mạng sống sót tới Đại Nhạc Hội Siêu Nhân: mạng rớt là chiến dịch rớt.", "Xin được cái router mới, và được ai đó nói một câu cảm ơn."],
  idol_het_thoi: ["Hợp đồng độc quyền hết hạn đúng ngày 31/10, trong khi Siêu Nhân Hồng đang chiếm hết hào quang.", "Giành lại ánh đèn sân khấu, hoặc học cách đứng chung sân khấu với người mới."],
  quan_ly_idol: ["Đưa Siêu Nhân Hồng lên 1 triệu người theo dõi mà không để Phát chìm hẳn.", "Giữ hợp đồng cho Phát, và quyết định đi hay ở khi công ty đối thủ chìa lời mời."],
  bien_kich: ["Viết kịch bản phim ngắn chiếu mở màn Đại Nhạc Hội Siêu Nhân 31/10.", "Viết xong cuốn tiểu thuyết đầu tay, từ chính những gì xảy ra trong công ty."],
  editor: ["Dựng cho xong mọi video của chiến dịch: MV 9/10, gameshow 16/10, livestream 23/10, Đại Nhạc Hội 31/10.", "Được ghi tên đúng một lần ở ô người thực hiện."],
  designer: ["Mọi thứ phải màu hồng, và tất cả đổ lên bàn bạn: poster, thumbnail, backdrop, standee.", "Làm cho Đại Nhạc Hội Siêu Nhân đẹp nhất có thể, giữ cái tôi nghệ thuật và đủ tiền sống."],
  sales: ["Bạn đã hứa trước cả công ty: 3 nhà tài trợ, tổng 2 tỷ, trước Đại Nhạc Hội Siêu Nhân.", "Biến lời phét thành thật, hoặc giấu cho tới khi không giấu được nữa."],
  chi_dai: ["Đại Nhạc Hội Siêu Nhân là show lớn nhất đời bạn: từ cái đinh tới cầu dao điện đều do bạn lo.", "Không để đứa nào trong team bị gạch tên khỏi công ty."],
  dan_dau_tu: ["Gỡ lại tiền đầu tư để trả hết nợ cho cả công ty, cả gốc lẫn lãi.", "Từ khi có đồng coin mang hình chiếc mũ hồng, tiền của bạn dính chặt vào số người theo dõi của Siêu Nhân Hồng."],
  thanh_xin_nghi: ["Xếp lịch 30 ngày cho Siêu Nhân Hồng, trong khi chính bạn có một sân khấu riêng cùng đêm 31/10.", "Giữ việc, giữ ước mơ, và không để HR bắt bài."],
  bac_bao_ve: ["Giữ cổng, giữ thư, giữ bí mật: ai ra vào công ty cũng đi qua bác.", "Tháng này bác phải quyết định viết gì trong lá thư gửi người bạn cũ."],
  sieu_nhan_hong: ["Đạt 1 triệu người theo dõi để công ty không phá sản.", "Giữ chiếc mũ hồng trên đầu, hoặc tìm được lý do để tháo nó ra."],
  cho: ["Ăn no, được gãi bụng, bảo vệ Bác Bình và cái cổng.", "Và tránh xa màu hồng. Rất xa."],
};

export function moCotTruyen(h, { vai, ten, tenVai, chuc, cau, xemLai = false, onDong }) {
  const nv = NHIEM_VU[vai] || [];
  const dong = () => { lop.remove(); removeEventListener("keydown", phim, true); onDong?.(); };
  const phim = e => { if (e.code === "Enter" || (xemLai && e.code === "Escape")) { e.preventDefault(); e.stopPropagation(); dong(); } };
  addEventListener("keydown", phim, true);
  const muc = (so, tieuDe, ...noiDung) => h("section", { class: "ct-muc" }, h("h3", {}, h("span", { class: "ct-so" }, so), tieuDe), ...noiDung);
  const lop = h("div", { class: "ct-lop" },
    h("article", { class: "ct-bang", role: "dialog", "aria-label": "Cốt truyện" },
      h("header", { class: "ct-dau" },
        h("small", {}, "G-ENTERTAINMENT · THÁNG 10/2026"),
        h("h2", {}, "Một tháng, một triệu người theo dõi"),
        h("p", {}, "Công ty giải trí G-Entertainment đang nợ nần. Ngày 1/10, công ty ký hợp đồng với một siêu sao mới nổi: Siêu Nhân Hồng. Giám Đốc chốt mục tiêu: đưa Siêu Nhân Hồng lên 1.000.000 người theo dõi trước Đại Nhạc Hội Siêu Nhân tối 31/10. Không đạt thì công ty có thể phải hoàn tiền và phá sản.")),
      h("div", { class: "ct-than" },
        muc("1", vai === "cho" ? `Bạn là ${ten}, ${tenVai}` : `Bạn là ${ten}, ${tenVai} · ${chuc}`,
          h("p", { class: "ct-cau" }, `"${cau}"`),
          h("ul", {}, nv.map(x => h("li", {}, x)))),
        muc("2", "Một ngày làm việc",
          h("ul", {},
            h("li", {}, "Đi tới vòng sáng màu cam để mở việc tiếp theo trong ngày. Mũi tên trên cùng màn hình chỉ hướng đi."),
            h("li", {}, "Nói chuyện với đồng nghiệp, chọn câu trả lời. Lựa chọn của bạn làm thay đổi uy tín, tiền, số người theo dõi và cả cái kết."),
            h("li", {}, "Ăn, uống, nghỉ ngơi cho đủ. Đói, khát hay kiệt sức quá là gục ngay giữa ca."),
            h("li", {}, "Hết việc trong ngày thì ra cổng về nhà ngủ. Game tự lưu."))),
        muc("3", "Cách kết thúc lượt chơi",
          h("ul", {},
            h("li", {}, h("b", {}, "Đi hết tháng 10: "), "chơi từ 1/10 tới đêm Đại Nhạc Hội Siêu Nhân 31/10. Mọi chuyện bạn đã làm trong 31 ngày quyết định cái kết."),
            h("li", {}, h("b", {}, "Cái kết: "), "mỗi vai có 6 cái kết riêng, có hậu lẫn buồn, tuỳ những gì bạn đã chọn. Số người theo dõi của Siêu Nhân Hồng có chạm mốc 1 triệu hay không cũng do cả công ty, và bạn, góp sức."),
            h("li", {}, h("b", {}, "Kết thúc sớm: "), "gục ngã vì bỏ bê ăn uống, sức khoẻ, hoặc băng qua đường không nhìn xe."),
            h("li", {}, "Mở được càng nhiều kết thúc, bộ sưu tập càng đầy. Mỗi vai có câu chuyện và bí mật riêng."))),
      ),
      h("footer", { class: "ct-chan" },
        h("button", { class: "btn primary", type: "button", onclick: dong }, xemLai ? "Đóng" : "Bắt đầu đi làm"))));
  document.body.append(lop);
  lop.querySelector("button")?.focus();
  return dong;
}
