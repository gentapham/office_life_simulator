// Lời nói nhỏ của đồng nghiệp: câu lẩm bẩm hiện thành bong bóng trên đầu (theo giờ, thời tiết, ngày),
// câu đáp khi người chơi bắt chuyện mà không có cảnh truyện, và các đoạn tán gẫu giữa hai đồng nghiệp.
// Quy tắc: Thắng, Nhật, Bình nói giọng Bắc; mọi người khác giọng Nam. Tên không viết cứng mà dùng {ten:ma}
// ({ten:player} là người chơi). {goi}/{Goi}: cách người nói gọi người nghe, {xung}/{Xung}: người nói tự xưng,
// {con}: số ngày còn lại tới Đại Nhạc Hội 31/10. "câu|cử chỉ" cho người nói làm cử chỉ kèm theo.

// Tuổi, giới tính, giọng (để tự chọn xưng hô)
const TUOI = {
  ran_doc: 28, giam_doc: 37, truong_phong: 28, thanh_ninh: 28, hong_hot: 29, con_ong_chau_cha: 28, chua_te_deadline: 28,
  thuc_tap_sinh: 30, ke_toan: 30, hr: 30, it: 31, idol_het_thoi: 30, quan_ly_idol: 37, bien_kich: 29, editor: 27,
  designer: 29, sales: 26, chi_dai: 30, dan_dau_tu: 37, thanh_xin_nghi: 28, bac_bao_ve: 50, sieu_nhan_hong: 31, cho: 6,
};
const NU = new Set(["thanh_ninh", "hong_hot", "ke_toan", "bien_kich", "designer", "sales", "chi_dai"]);
export const GIONG_BAC = new Set(["giam_doc", "truong_phong", "bac_bao_ve"]);

// Cách người nói (s) gọi người nghe (p) và tự xưng
export function xungHo(s, p, tenCua = x => x) {
  const bac = GIONG_BAC.has(s), ac = x => (NU.has(x) ? "chị" : "anh");
  if (p === "cho") return { goi: tenCua("cho"), xung: s === "bac_bao_ve" ? "bác" : s === "giam_doc" ? "anh" : bac ? "tớ" : "tui" };
  if (s === "bac_bao_ve") return { goi: "cháu", xung: "bác" };
  if (p === "bac_bao_ve") return { goi: "bác", xung: bac ? "cháu" : "con" };
  if (p === "giam_doc") return { goi: "sếp", xung: "em" };
  if (s === "giam_doc") return { goi: "em", xung: "anh" };
  if (s === "thuc_tap_sinh") return { goi: ac(p), xung: "em" }; // ba mươi tuổi vẫn "dạ anh, dạ chị" với tất cả
  if (s === "sales") return { goi: "em", xung: "chị" };        // nhỏ nhất công ty mà nói chuyện như sếp lớn
  const d = (TUOI[p] ?? 28) - (TUOI[s] ?? 28);
  if (d >= 2) return { goi: ac(p), xung: "em" };
  if (d <= -2) return { goi: "em", xung: ac(s) };
  return bac ? { goi: "cậu", xung: "tớ" } : { goi: NU.has(p) ? "bà" : "ông", xung: "tui" };
}

// ---------- Câu lẩm bẩm theo ngữ cảnh ----------
// sang: mới tới, lam: đang làm, trua: giờ trưa, chieu: chiều uể oải, toi: tối / tăng ca, mua: trời mưa,
// gan: người chơi đứng sát, han: tuần cuối trước 31/10, noi: câu đáp khi được bắt chuyện, ngay: câu riêng từng ngày
export const LOI = {
  ran_doc: {
    sang: ["Sáng nay ai tới trễ, tui ghi lại hết rồi nha.", "Cà phê sáng, tin nóng sáng. Đủ bộ.", "Bản tin nội bộ số mới ra lò rồi. Ai đọc chưa?"],
    lam: ["Tui chỉ nói sự thật thôi mà.", "Viết bản tin nội bộ mà như viết truyện trinh thám.", "Hôm nay chưa có drama, tui hơi lo.", "Bình tĩnh, tui hông có ghi âm đâu.|cuoi"],
    trua: ["Giờ ăn trưa là giờ tin đồn ngon nhất.", "Bàn bên kia nói gì đó, im lặng giùm xíu."],
    chieu: ["Hai giờ chiều, mí mắt nặng hơn bản tin.|ngap", "Ai ngủ gật thì nói, tui chụp hình làm kỷ niệm."],
    toi: ["Giờ này còn ở lại là có chuyện để viết rồi.", "Về trễ hông phải vì chăm, vì hóng."],
    mua: ["Mưa vầy ai đưa ai về, tui để ý hết.", "Mưa to quá, tin đồn cũng ướt nhẹp."],
    gan: ["{Goi} nè, {xung} có chuyện này hay lắm. Mà thôi, để sau.", "Đừng nhìn {xung} vậy, {xung} vô hại mà.", "Ủa, {goi} đi đâu đó? {Xung} hỏi thăm thôi."],
    han: ["Còn {con} ngày nữa là Đại Nhạc Hội. Hồng thì sao chứ.", "Ai cũng lo cho {ten:sieu_nhan_hong}. Trừ tui."],
    noi: ["Tui chỉ nói sự thật thôi mà.", "Có tin gì mới hông? Tui đổi tin lấy tin nè.", "Đang viết bản tin, lát nói nha.", "Hỏi gì thì hỏi, đừng hỏi tui nghe ở đâu."],
  },
  giam_doc: {
    sang: ["Các em đến đủ chưa? Anh hỏi thế thôi.", "Sáng nay anh gặp đối tác, các em cứ làm việc nhé.", "Chào buổi sáng. Năng lượng lên nào!"],
    lam: ["Anh không ép, tùy em.", "Một triệu người theo dõi. Anh tin các em.", "Ngân sách à? Để anh xem lại đã.", "Công ty là nhà, nhà mình phải gọn gàng chứ."],
    trua: ["Trưa nay anh mời. Mời cơm hộp thôi nhé.", "Ăn xong nghỉ mười lăm phút thôi đấy."],
    chieu: ["Chiều rồi mà sao im ắng thế nhỉ?", "Ai buồn ngủ thì đứng dậy vươn vai, anh không cấm.|vuon"],
    toi: ["Các em về đi. Ai muốn ở lại thì anh không ép.", "Tối nay ai tăng ca, anh ghi nhận hết."],
    mua: ["Mưa thế này đường ngập, các em về cẩn thận nhé.", "Trời mưa, ngồi văn phòng là sướng nhất rồi."],
    gan: ["{Goi} đấy à? Việc đến đâu rồi?", "{Goi} cố lên nhé. Anh nhìn thấy hết đấy.", "Anh đi ngang thôi, {goi} cứ làm đi."],
    han: ["Còn {con} ngày. Không ai được ốm đâu nhé.", "Đại Nhạc Hội mà hỏng thì anh không biết ăn nói thế nào."],
    noi: ["Anh đang bận, có gì gửi qua {ten:thanh_ninh} nhé.", "Anh không ép, tùy em.", "Việc đến đâu rồi? Báo cáo ngắn thôi.", "Cứ làm đi, anh tin em."],
  },
  truong_phong: {
    sang: ["Chín giờ họp giao ban nhé, họp nhanh thôi.", "Sáng ra tớ đã lên lịch ba cuộc họp rồi.", "Mọi người xem lịch họp chưa nhỉ?"],
    lam: ["Họp nhanh 5 phút thôi.", "Cuộc họp này để chuẩn bị cho cuộc họp chiều.", "Biên bản họp hôm qua ai giữ thế?", "Tớ đặt phòng họp đến hết tuần rồi."],
    trua: ["Ăn trưa cũng họp nhanh được mà.", "Bát cơm nguội mất rồi. Tại họp."],
    chieu: ["Chiều nay họp tổng kết buổi sáng nhé.", "Họp xong mới biết là chưa cần họp.|gai_dau"],
    toi: ["Họp tối nay chỉ mười lăm phút thôi.", "Mai họp lúc tám rưỡi. Đừng ai đến muộn nhé."],
    mua: ["Mưa thế này họp trực tuyến thôi nhỉ?", "Trời mưa, ai đến muộn thì họp bù."],
    gan: ["{Goi} có rảnh không? Họp nhanh 5 phút.", "Tớ gửi lịch họp cho {goi} rồi đấy.", "Có việc gì thì đặt lịch với tớ nhé."],
    han: ["Còn {con} ngày. Từ giờ ngày nào cũng họp hai lần.", "Ghế phó giám đốc vẫn trống đấy nhỉ."],
    noi: ["Họp nhanh 5 phút thôi.", "Việc này phải đưa ra họp đã.", "Tớ ghi vào biên bản rồi nhé.", "Để tớ xem lịch, chắc thứ Sáu tuần sau."],
  },
  thanh_ninh: {
    sang: ["Sáng nay anh {ten:giam_doc} mặc vest đẹp quá trời luôn.", "Em pha trà cho sếp rồi, nước tám mươi độ.", "Sếp tới chưa? Để em ra đón."],
    lam: ["Anh nói chuẩn quá anh ơi!", "Lịch sếp kín mít, mà sếp vẫn phong độ.", "Sếp ho một cái là em biết sếp cần gì.", "Ghi chú: sếp hông uống trà đá."],
    trua: ["Cơm trưa của sếp em đặt rồi, hông hành.", "Ăn lẹ còn lên trực sếp."],
    chieu: ["Chiều nay sếp hơi mệt, mọi người nói nhỏ nha.", "Buồn ngủ cũng phải cười, sếp đi ngang đó.|ngap"],
    toi: ["Sếp chưa về thì em chưa về.", "Tối rồi mà sếp vẫn sáng suốt ghê."],
    mua: ["Mưa vầy em lo sếp ướt vest.", "Em có dù cho sếp nè, dù hồng."],
    gan: ["Ủa {goi}, hôm nay nhìn sáng sủa ghê.", "Có gì cần gặp sếp thì qua {xung} trước nha.", "{Goi} nói chuẩn quá. Mà {goi} nói gì vậy?"],
    han: ["Còn {con} ngày, sếp cần năng lượng. Em cũng vậy.", "Đại Nhạc Hội thành công là nhờ tầm nhìn của sếp."],
    noi: ["Dạ, sếp đang bận, {goi} để lại lời nhắn nha.", "Chuẩn luôn {goi} ơi!", "Đỉnh nóc, kịch trần luôn.", "Sếp có hỏi thì {xung} nói tốt cho {goi}."],
  },
  hong_hot: {
    sang: ["Nghe gì chưa? Sáng nay có biến.", "Group Zalo-lô nổ tin nhắn từ năm giờ sáng.", "Ai đi chung xe với ai sáng nay, tui biết hết."],
    lam: ["Nghe gì chưa?", "Ối dồi ôi, bình luận này căng nha.|xem_dt", "Fanpage tăng có mười người theo dõi, buồn ghê.", "Ủa alo? Ai mới đăng story vậy?"],
    trua: ["Trưa nay ăn gì? Kể tui nghe chuyện gì đi.", "Bàn bên kia nói nhỏ quá, tui nghe hông kịp."],
    chieu: ["Chiều buồn ngủ mà có tin là tỉnh liền.", "Lướt Tóp-tóp xíu cho tỉnh nè.|xem_dt"],
    toi: ["Giờ này còn ở lại, chắc có chuyện.", "Tối rồi mà tin vẫn nóng hổi."],
    mua: ["Mưa vầy ai đưa ai về, tui để ý đó nha.", "Mưa là mùa của drama."],
    gan: ["{Goi}! Nghe gì chưa?", "Có tin gì hông? Kể {xung} nghe với.", "Tui hông có hóng, tui chỉ quan tâm thôi."],
    han: ["Còn {con} ngày, coi bộ sắp toang rồi.", "Một triệu người theo dõi mà giờ mới được bao nhiêu đâu."],
    ngay: { 23: ["Hôm nay sinh nhật {ten:sieu_nhan_hong} đó, ai góp tiền bánh kem chưa?"] },
    noi: ["Nghe gì chưa? Mà thôi, để tối kể.", "Tin này độc quyền nha, đừng nói ai.", "Ủa alo? Có chuyện gì hông?", "Đang lướt bình luận, chờ xíu."],
  },
  con_ong_chau_cha: {
    sang: ["Đi trễ có lý do: kẹt xe từ nhà chú.", "Sáng nay chú anh gọi hỏi thăm công ty đó.", "Cà phê muối, size lớn. Ai mua giùm cái."],
    lam: ["Để anh gọi chú anh.|goi_dt", "Làm marketing là phải có tầm. Có tầm là có chú.", "Ghế phó giám đốc nhìn hợp với anh ghê.", "Báo cáo hả? Gửi qua trợ lý giùm."],
    trua: ["Trưa nay anh đặt nhà hàng, ai đi hông?", "Anh hông ăn cơm hộp, dị ứng."],
    chieu: ["Chiều nay anh ra ngoài gặp đối tác. Đối tác tên là cà phê.", "Gét gô! Mà thôi, nghỉ xíu đã.|vuon"],
    toi: ["Về sớm là quyền lợi của phó phòng.", "Tối nay chú anh rủ đi ăn, tiếc ghê."],
    mua: ["Mưa vầy anh gọi xe riêng.", "Trời mưa là trời giúp anh nghỉ họp."],
    gan: ["Chào {goi}. Biết {xung} là ai rồi chứ?", "Có gì cần thì nói, {xung} gọi chú {xung}.", "Gét gô! Làm việc thôi. {Goi} làm trước đi."],
    han: ["Còn {con} ngày. Không sao, có chú anh.", "Đại Nhạc Hội thành công là anh lên phó giám đốc."],
    noi: ["Để anh gọi chú anh.", "Bận. Bận gì thì bí mật.", "Có chuyện gì thì gửi mail, anh đọc sau.", "Ừ, ừ. Gét gô."],
  },
  chua_te_deadline: {
    sang: ["Sáng là để khởi động. Làm thì để chiều.", "Deadline là mai. Mai là bao giờ?", "Cà phê ly thứ nhất, chưa tính.|uong"],
    lam: ["Nước tới chân mới nhảy, mà nhảy là phải đẹp.", "Tui đang làm nè. Trong đầu.", "Chill thôi, còn sớm mà.", "File này tên là bản cuối cuối thật sự."],
    trua: ["Ăn trưa trước, deadline tính sau.", "Ngủ trưa mười phút thôi. Mười phút của tui."],
    chieu: ["Ba giờ chiều, giờ vàng để... ngáp.|ngap", "Còn mấy tiếng nữa ta? Chill."],
    toi: ["Giờ mới là lúc tui làm việc thiệt nè.", "Tối rồi, não tui mới chịu chạy."],
    mua: ["Mưa là lý do hợp pháp để làm chậm.", "Mưa vầy ngồi chạy deadline cũng thơ."],
    gan: ["{Goi} hối hả gì đó? Chill đi.", "Hông sao, còn kịp mà. Chắc vậy.", "Nếu {ten:sieu_nhan_hong} hỏi thì nói tui hông có ở đây nha."],
    han: ["Còn {con} ngày. Nước tới đầu gối rồi.", "Ét o ét. Mà thôi, vẫn chill."],
    noi: ["Đang bận... suy nghĩ.", "Để mai đi, mai tui làm luôn.", "Chill, kịp hết.", "Deadline là bạn, hông phải thù."],
  },
  thuc_tap_sinh: {
    sang: ["Dạ em chào anh chị buổi sáng ạ.", "Em tới sớm pha cà phê cho cả phòng rồi ạ.", "Thẻ thực tập của em hôm nay lại kẹt cổng."],
    lam: ["Dạ em mới vô nên chưa biết ạ.", "Ba mươi tuổi, vẫn đang học việc. Cố lên.", "Cái file này lưu ở đâu vậy ta?|gai_dau", "6-7! Em nói đúng trend chưa ạ?"],
    trua: ["Trưa nay em ăn cơm nhà mang theo.", "Dạ có ai cần em mua giùm gì hông ạ?"],
    chieu: ["Em hơi buồn ngủ, mà em hông dám ngủ.|ngap", "Chiều nay em được giao photo ba trăm trang."],
    toi: ["Mọi người chưa về thì em chưa dám về.", "Em ghi lại hôm nay học được gì rồi ạ."],
    mua: ["Mưa vầy em đi xe buýt, hông sao đâu ạ.", "Em có áo mưa dư, ai cần hông ạ?"],
    gan: ["Dạ {goi} cần em làm gì hông ạ?", "Dạ em chào {goi} ạ.", "Dạ {goi} chỉ em cái này với được hông ạ?"],
    han: ["Còn {con} ngày, em sẽ cố hết sức ạ.", "Ét o ét, deadline đuổi tới thực tập sinh luôn rồi."],
    noi: ["Dạ em mới vô nên chưa biết ạ.", "Dạ {goi} cần em làm gì cứ nói ạ.", "Dạ em đang photo, lát em qua liền.", "Dạ, em ghi lại rồi ạ."],
  },
  ke_toan: {
    sang: ["Ai tạm ứng tuần trước nộp hóa đơn giùm nha.", "Sáng nay đối chiếu sổ quỹ, lệch đúng năm ngàn.", "Cà phê sáng tự trả nha, hông có công tác phí."],
    lam: ["Không có hóa đơn là không có tiền.", "Từng đồng đều phải có chứng từ.", "Đề xuất mua bút màu hồng? Hông duyệt.", "Máy tính tiền kêu tạch tạch nghe đã ghê."],
    trua: ["Ăn trưa chia tiền lẻ, ai thiếu tui nhớ hết.", "Cơm hộp ba mươi lăm ngàn, có hóa đơn đỏ hông?"],
    chieu: ["Chiều nào cũng có người hỏi bao giờ có lương.", "Sổ sách hông biết buồn ngủ, chỉ có tui.|ngap"],
    toi: ["Tăng ca thì ghi giờ cho đúng nha.", "Khóa sổ xong mới về được."],
    mua: ["Mưa vầy xin công tác phí là hông có đâu.", "Tiền taxi ngày mưa cũng phải có hóa đơn."],
    gan: ["{Goi} còn nợ tui một tờ hóa đơn đó nha.", "Có gì thì nói lẹ, tui đang cộng sổ.", "Đừng hỏi lương. Hỏi gì cũng được, trừ lương."],
    han: ["Còn {con} ngày, ngân sách còn đúng... thôi khỏi nói.", "Đại Nhạc Hội tốn tiền như nước, tui đau tim."],
    ngay: { 12: ["Lương về trễ hông phải lỗi của tui nha."], 22: ["Hôm nay kiểm tra thuế. Ai có hóa đơn lạ thì khai lẹ."] },
    noi: ["Không có hóa đơn là không có tiền.", "Tạm ứng hả? Điền phiếu, ký ba chỗ.", "Đang cộng sổ, đừng làm tui quên số.", "Có chứng từ chưa? Chưa thì thôi."],
  },
  hr: {
    sang: ["Chào buổi sáng, đi làm vui vẻ nha mọi người.", "Máy chấm công ghi nhận hết đó nha.", "Trà sáng nay là ô long, ai uống hông?|uong"],
    lam: ["Rảnh hông, lên phòng anh uống trà xíu.", "Công ty là gia đình mà.", "Đánh giá cuối tháng sắp tới rồi đó.", "Danh sách khen thưởng hả? Đang soạn. Danh sách kia cũng đang soạn."],
    trua: ["Ăn trưa chung cho gắn kết nha.", "Trà sau bữa trưa tốt cho tinh thần đồng đội."],
    chieu: ["Chiều nay có buổi chia sẻ văn hóa công ty, tự nguyện bắt buộc.", "Ai ngáp là anh thấy đó nha.|ngap"],
    toi: ["Tăng ca là tinh thần cống hiến, anh ghi nhận.", "Về nhà nhớ nghỉ ngơi, mai đi làm sớm."],
    mua: ["Mưa vầy ai đi trễ, có lý do hợp lệ.", "Trời mưa uống trà nóng là hết ý."],
    gan: ["{Goi} rảnh hông, lên phòng {xung} uống trà xíu.", "Dạo này {goi} ổn hông? Hỏi thăm thôi.", "{Xung} thấy {goi} làm việc chăm ghê, nhớ đó."],
    han: ["Còn {con} ngày, ai nghỉ phép là anh buồn lắm.", "Sau Đại Nhạc Hội có đánh giá lại nhân sự. Chuyện bình thường."],
    noi: ["Lên phòng anh uống trà xíu hông?", "Công ty là gia đình, có gì cứ nói.", "Anh ghi nhận ý kiến của em.", "Hồ sơ của em anh đang giữ nha."],
  },
  it: {
    sang: ["Sáng ra đã ba người kêu mất mạng.", "Máy chủ ổn định. Nói vậy cho vui.", "Ai cắm sạc điện thoại vô ổ máy chủ đó?"],
    lam: ["Anh tắt đi bật lại thử chưa?", "Em là IT chứ đâu phải thợ sửa máy pha cà phê.", "Mật khẩu wifi hông phải là mật khẩu Phây-búc nha.", "Đèn xanh là ổn. Đèn đỏ là tui đi ăn."],
    trua: ["Trưa nay mì ly trong phòng máy chủ.", "Đừng ai đụng vô cái dây màu vàng."],
    chieu: ["Chiều nay cập nhật hệ thống, ai mất dữ liệu ráng chịu.", "Máy chủ chạy ổn, tui chạy hết nổi.|ngap"],
    toi: ["Tối rồi mới sửa được, ban ngày ai cũng cần mạng.", "Âm thanh ánh sáng cho Đại Nhạc Hội cũng là tui."],
    mua: ["Mưa vầy sét đánh là cúp mạng nha.", "Mưa lớn, nhớ rút dây máy tính giùm."],
    gan: ["{Goi} tắt đi bật lại thử chưa?", "Máy {goi} lại bị gì nữa hả?", "Đừng nói là quên mật khẩu nữa nha."],
    han: ["Còn {con} ngày, dây cáp sân khấu còn chưa đủ.", "Ngày đó mà cúp điện là tui đi luôn."],
    ngay: { 15: ["Cúp điện rồi, tắt đi bật lại cũng hông được."], 29: ["Wifi sập rồi. Đừng ai hỏi tui nữa."] },
    noi: ["Anh tắt đi bật lại thử chưa?", "Gửi ticket đi, tui làm theo thứ tự.", "Mạng chậm là tại mạng, hông phải tại tui.", "Để tui coi... à, chưa cắm điện."],
  },
  idol_het_thoi: {
    sang: ["Sáng nay có ai nhận ra anh trên đường hông ta.", "Kính đen là để che nắng. Với che fan.", "Giọng sáng nay hơi khàn, đừng ai xin hát."],
    lam: ["Em biết anh là ai hông?", "Công Viên, 2015. Nhớ hông?", "Hit thì một bài, mà một bài là đủ.", "Hôm nay có ai xin chữ ký hông ta?|xem_dt"],
    trua: ["Trưa nay ăn nhẹ, giữ dáng lên sân khấu.", "Hồi xưa anh ăn trưa toàn có người chụp hình."],
    chieu: ["Chiều chiều nhớ sân khấu ghê.", "La la la... công viên chiều nay..."],
    toi: ["Tối là giờ của nghệ sĩ.", "Có show hông ta? Hông có hả."],
    mua: ["Mưa vầy nhớ cái MV quay dưới mưa năm đó.", "Mưa rơi trên công viên... bài đó của anh đó."],
    gan: ["{Goi} biết {xung} là ai hông?", "Muốn chụp hình hông? Hông hả. Ừ.", "Nghe giọng {xung} có quen hông?"],
    han: ["Còn {con} ngày. Đại Nhạc Hội của Siêu Nhân. Hông phải của anh.", "Sân khấu lớn vậy mà anh đứng cánh gà."],
    noi: ["Em biết anh là ai hông?", "Công Viên, 2015. Nghe chưa?", "Anh đang tập giọng, đừng làm phiền.", "Chữ ký hả? Ký đâu? Ký liền."],
  },
  quan_ly_idol: {
    sang: ["Chuyện này để anh lo, đừng ai đăng gì hết!", "Hai cái điện thoại, một nghệ sĩ. Bắt đầu ngày mới.", "Lịch của {ten:idol_het_thoi} hôm nay trống. Như hôm qua."],
    lam: ["Alo? Dạ, show nào cũng nhận, giá mềm.|goi_dt", "Đừng ai đăng gì hết!", "Khủng hoảng nhỏ thôi, anh lo được.", "Ai chụp hình {ten:idol_het_thoi} mà hông đẹp là xóa liền."],
    trua: ["Trưa nay anh ăn vội, điện thoại reo hoài.|goi_dt", "Mua giùm anh hộp cơm, hông cay."],
    chieu: ["Chiều nay gọi hai mươi cuộc, được một show đám cưới.", "Mệt mà hông được than.|lac_dau"],
    toi: ["Tối rồi mà điện thoại vẫn chưa ngưng.", "{ten:idol_het_thoi} về chưa? Về rồi thì anh mới về."],
    mua: ["Mưa vầy show ngoài trời là hủy chắc rồi.", "Mưa thì {ten:idol_het_thoi} hát dở. Đừng nói ai."],
    gan: ["{Goi} có thấy ai chụp hình {ten:idol_het_thoi} hông?", "Chuyện này để {xung} lo, {goi} đừng đăng gì hết nha.", "Có ai hỏi thì nói {ten:idol_het_thoi} đang bận lịch diễn."],
    han: ["Còn {con} ngày. Phải xin cho {ten:idol_het_thoi} một tiết mục.", "Đại Nhạc Hội mà {ten:idol_het_thoi} hông lên sân khấu, anh buồn lắm."],
    noi: ["Chuyện này để anh lo, đừng ai đăng gì hết!", "Anh đang nghe điện thoại, chờ chút.", "{ten:idol_het_thoi} hả? {ten:idol_het_thoi} đang... nghỉ ngơi.", "Có show thì báo anh liền nha."],
  },
  bien_kich: {
    sang: ["Sáng nay có ý tưởng mới. Hơi giống phim tối qua.", "Cà phê vô là chữ ra.|uong", "Kịch bản hôm nay đổi kết lần thứ bảy."],
    lam: ["Đây hông phải đạo, đây là cảm hứng.", "Nhân vật này cần thêm nội tâm.", "Viết một câu, xóa ba câu.", "Twist này hay quá, ai nghĩ ra vậy ta. À, tui."],
    trua: ["Ăn trưa mà đầu vẫn nghĩ cảnh ba.", "Nghe lén bàn bên cũng là nghiên cứu chất liệu."],
    chieu: ["Chiều là giờ bí ý tưởng.|gai_dau", "Bí quá, lướt Diu-túp tìm cảm hứng.|xem_dt"],
    toi: ["Tối mới viết được cảnh buồn.", "Kịch bản xong rồi, mai sửa lại từ đầu."],
    mua: ["Mưa là phải có cảnh chia tay.", "Mưa ngoài cửa sổ, chữ trong đầu."],
    gan: ["{Goi} đứng yên đó, tui đang quan sát để viết nhân vật.", "Câu {goi} vừa nói, cho tui mượn nha.", "Đừng lo, tui đổi tên rồi mới viết."],
    han: ["Còn {con} ngày, kịch bản Đại Nhạc Hội còn thiếu cái kết.", "Kết thúc có hậu hay bỏ ngỏ đây ta."],
    noi: ["Đây hông phải đạo, đây là cảm hứng.", "Đang viết, đừng nói gì hay quá, tui chép đó.", "Cho tui mượn câu đó nha.", "Kịch bản sắp xong. Lần thứ bảy."],
  },
  editor: {
    sang: ["Sáng rồi hả? Tui tưởng còn tối.|ngap", "Render xong là xong.", "Ly cà phê thứ tư của đêm qua."],
    lam: ["Render xong là xong.", "Thanh tiến trình đứng ở chín mươi chín phần trăm.", "Cắt thêm hai khung hình là đẹp.", "Đừng ai rút điện phòng dựng nha."],
    trua: ["Trưa là giờ tui ngủ bù.|ngap", "Ăn gì cũng được, miễn ăn tại bàn."],
    chieu: ["Mắt tui là mắt cú, ban ngày hơi mờ.", "Chiều nay xuất bản thô, tối xuất bản tinh."],
    toi: ["Giờ này mới là giờ làm việc.", "Đêm nay chắc thức nữa rồi."],
    mua: ["Mưa vầy ngồi dựng phim là hết sẩy.", "Mưa to quá, âm thanh thu bị rè."],
    gan: ["{Goi} đi nhẹ thôi, tui đang canh âm thanh.", "Đừng đụng vô bàn, máy đang render.", "{Goi} có thấy anh {ten:quan_ly_idol} đâu hông?"],
    han: ["Còn {con} ngày, teaser Đại Nhạc Hội còn chưa xuất.", "Đêm nào cũng thức, tuần này coi như khỏi ngủ."],
    noi: ["Render xong là xong.", "Đang xuất phim, nói lẹ giùm.", "Đêm qua tui ngủ được hai tiếng.", "Cái đó dựng mất ba đêm đó."],
  },
  designer: {
    sang: ["Sáng nay mở mail, mười hai góp ý mới.", "Sửa nhẹ thôi là sửa cái gì ạ?", "Cà phê đen, giống màu tâm trạng."],
    lam: ["Sửa nhẹ thôi là sửa cái gì ạ?", "Logo to hơn nhưng nhỏ lại. Ok.|gai_dau", "Màu hồng này hồng hơn được hông? Hết cứu.", "Bản cuối, bản cuối cuối, bản dùng cái này."],
    trua: ["Trưa nay ăn lẹ, chiều nộp bản thứ chín.", "Đừng gửi góp ý giờ ăn trưa, xin đó."],
    chieu: ["Chiều nào sếp cũng có ý tưởng mới.|ngap", "Chưa đủ wow. Wow là cái gì?"],
    toi: ["Tối rồi mà feedback vẫn tới.", "Xuất file xong rồi, chắc chắn sẽ sửa tiếp."],
    mua: ["Mưa vầy màu nào nhìn cũng xám.", "Mưa là lúc vẽ đẹp nhất. Nếu hông ai sửa."],
    gan: ["{Goi} thấy poster này đủ wow chưa?", "Đừng góp ý gì nha, tui xin đó.", "Logo to hay nhỏ? Thôi khỏi trả lời."],
    han: ["Còn {con} ngày, poster Đại Nhạc Hội sửa lần thứ hai mươi.", "Hông ai được đổi font nữa hết."],
    noi: ["Sửa nhẹ thôi là sửa cái gì ạ?", "Đang xuất file, lát nha.", "Góp ý thì gửi một lần thôi nha.", "Hết cứu. Mà thôi, để tui sửa."],
  },
  sales: {
    sang: ["Tin chị đi, hôm nay chốt được ba deal!", "Sáng nay chị gọi mười khách, bảy người bắt máy.|goi_dt", "KPI tháng này: ba trăm phần trăm. Trên giấy."],
    lam: ["Tin chị đi, deal này chắc kèo!", "Alo anh ơi, gói tài trợ kim cương còn đúng một suất.|goi_dt", "No cap, khách này sắp ký rồi.", "Sao mà căng? Bình tĩnh, chị lo."],
    trua: ["Trưa nay chị ăn với khách. Khách là bạn chị.", "Ăn trưa cũng là cơ hội bán hàng."],
    chieu: ["Chiều nay chị chốt thêm hai deal. Trong đầu.", "Chị hông buồn ngủ, chị đang suy nghĩ chiến lược.|ngap"],
    toi: ["Tối nay chị đi gặp nhà tài trợ. Chắc vậy.", "Deal lớn hay ký vào buổi tối."],
    mua: ["Mưa vầy khách hủy hẹn, hông sao, mai chốt.", "Trời mưa, khách dễ mềm lòng."],
    gan: ["{Goi} có quen nhà tài trợ nào hông? Giới thiệu chị.", "Tin chị đi, {goi} sẽ thấy.", "Chị bận chốt deal, có gì nói lẹ nha {goi}."],
    han: ["Còn {con} ngày, nhà tài trợ còn thiếu... một chút xíu.", "Tin chị đi, ngày 31 sân khấu đầy logo."],
    noi: ["Tin chị đi, deal này chắc kèo!", "Chị đang chốt khách, chờ xíu.", "No cap, tháng này chị vượt KPI.", "Có khách nào giới thiệu chị nha."],
  },
  chi_dai: {
    sang: ["Đứa nào tới trễ, chị thấy hết.", "Sáng nay kiểm kê kho sự kiện, thiếu ba cái bóng bay.", "Ăn sáng chưa mấy đứa? Chưa thì đi ăn."],
    lam: ["Đứa nào làm em khóc, chỉ mặt chị.", "Bộ đàm đâu? Bộ đàm của chị đâu?", "Sự kiện nào cũng có chị.", "Ai mượn loa hông trả, chị tới tận nhà."],
    trua: ["Ăn trưa đi mấy đứa, đói là hông làm được gì.", "Ai hông có tiền ăn trưa thì nói chị."],
    chieu: ["Chiều nay khiêng đồ ra sân khấu, ai rảnh phụ chị.|vuon", "Ối dồi ôi, mỏi lưng quá."],
    toi: ["Tối rồi, mấy đứa nhỏ về đi, để chị.", "Sự kiện mà, về trễ là chuyện thường."],
    mua: ["Mưa vầy sân khấu ngoài trời phải che bạt.", "Ai về hông có áo mưa thì lấy của chị."],
    gan: ["Có ai ăn hiếp {goi} hông? Nói chị.", "Đi đâu đó? Ăn gì chưa?", "Đứa nào làm {goi} khóc, chỉ mặt chị."],
    han: ["Còn {con} ngày, chị ngủ ở kho luôn cũng được.", "Đại Nhạc Hội mà hỏng, đừng ai nhìn mặt chị."],
    noi: ["Đứa nào làm em khóc, chỉ mặt chị.", "Ăn gì chưa? Chưa thì đi ăn đi.", "Chị đang kiểm đồ, nói lẹ nha.", "Có gì cứ nói chị."],
  },
  dan_dau_tu: {
    sang: ["Thị trường mở cửa xanh. Lần này là lên thật.|xem_dt", "Sáng nay tài khoản đỏ nhẹ. Nhẹ thôi.", "Cà phê sáng, nến xanh. Ngày đẹp."],
    lam: ["Lần này là lên thật.", "Đây là đáy, đáy thật rồi.|xem_dt", "Báo cáo số liệu xong rồi, giờ coi bảng giá.", "Chart xanh thì khao, đỏ thì... thôi."],
    trua: ["Trưa nay ăn cơm bình dân, chờ chart xanh.", "Ai cho mượn năm trăm, chiều trả."],
    chieu: ["Chiều rồi mà vẫn đỏ.|gai_dau", "Còn cái nịt. Mà thôi, còn cái áo."],
    toi: ["Tối nay coi thị trường Mỹ.", "Mai về bờ, chắc chắn."],
    mua: ["Mưa vầy thị trường cũng ướt.", "Trời mưa, bảng giá xanh. Điềm lành."],
    gan: ["{Goi} có muốn nghe mã này hông? Lần này là lên thật.", "Đừng hỏi tài khoản tui nha.", "Cho mượn chút xíu, cuối tháng trả."],
    han: ["Còn {con} ngày. Chắc chắn trước ngày đó tui về bờ.", "Số liệu Đại Nhạc Hội đẹp lắm. Trên biểu đồ."],
    ngay: { 10: ["Có lương rồi, xuống tiền thôi."], 20: ["8386, chúc chị em cả công ty phát lộc!"] },
    noi: ["Lần này là lên thật.", "Đang coi bảng giá, chờ chút.", "Số liệu xong rồi, gửi qua mail.", "Đây là đáy, đáy thật rồi."],
  },
  thanh_xin_nghi: {
    sang: ["Sáng nay em hơi mệt. Chắc chiều xin về.", "Bà ngoại em lại ốm. Lần này thật.", "Đi làm mà cứ như đi khám."],
    lam: ["Hôm nay em xin phép nghỉ ạ, bà ngoại em...", "Lịch trình nghệ sĩ xong rồi, giờ làm đơn nghỉ phép.", "Xu cà na quá.", "Ngày phép của em âm rồi. Âm sâu."],
    trua: ["Ăn trưa xong chắc em xin về sớm.", "Hông khỏe nên phải ăn nhiều."],
    chieu: ["Chiều là lúc bệnh hay tái phát.|ngap", "Hình như em sốt. Chút xíu."],
    toi: ["Tối rồi, em về được chưa?", "Mai em xin nghỉ nửa buổi nha."],
    mua: ["Mưa vầy chắc mai em cảm.", "Mưa là trời cho phép nghỉ."],
    gan: ["{Goi} thấy {xung} có xanh xao hông?", "Mai {xung} nghỉ, có gì nhắn giùm nha.", "Đừng nói với HR là thấy {xung} khỏe nha."],
    han: ["Còn {con} ngày. Chắc ngày 30 em ốm.", "Đại Nhạc Hội mà nghỉ thì chắc bị đuổi."],
    noi: ["Hôm nay em xin phép nghỉ ạ, bà ngoại em...", "Em hơi mệt, lát nói nha.", "Đơn nghỉ phép ký giùm em được hông?", "Xu cà na quá trời."],
  },
  bac_bao_ve: {
    sang: ["Chào các cháu, vào chấm công kẻo muộn.", "Sáng nay có thư cho ai thì bác để ở chòi.", "Trà mới pha đấy, ai uống thì vào.|uong"],
    lam: ["Bác không thấy gì đâu.", "Xe dựng cho thẳng hàng vào, các cháu ơi.", "Radio bảo chiều nay có mưa đấy.", "Tuất, nằm im nào."],
    trua: ["Trưa rồi, các cháu đi ăn đi.", "Bác ăn cơm nắm với cà pháo, thế là đủ."],
    chieu: ["Chiều nắng, các cháu uống nước vào.", "Ấm trà thứ hai trong ngày rồi.|uong"],
    toi: ["Muộn rồi, về đi các cháu, bác khóa cổng.", "Đèn tầng hai ai chưa tắt thế nhỉ?"],
    mua: ["Mưa to đấy, dắt xe vào trong kẻo ướt.", "Đường ngập rồi, đợi tạnh hẵng về."],
    gan: ["Cháu đi đâu đấy?", "Uống ly trà không cháu?", "Bác không thấy gì đâu, cháu cứ đi."],
    han: ["Còn {con} ngày nữa thôi. Các cháu giữ sức khỏe.", "Hôm đó đông người, bác phải trông xe từ sáng."],
    noi: ["Bác không thấy gì đâu.", "Uống ly trà đã rồi hẵng nói.", "Thư từ gì thì bác giữ cho.", "Cẩn thận xe cộ nhé cháu."],
  },
  sieu_nhan_hong: {
    sang: ["Chào buổi sáng! Hồng không phải màu, Hồng là thái độ!", "Sáng nay tập ba trăm cái hít đất. Úi, tay khỏe dữ!", "Gét gô! Một triệu người theo dõi đang chờ."],
    lam: ["Hồng không phải màu, Hồng là thái độ!", "Không ai được ép Siêu Nhân Hồng tháo mũ.", "Slay! Tạo dáng mới nè.", "Hôm nay {ten:chua_te_deadline} ngồi đâu ta?"],
    trua: ["Trưa nay ăn chè hồng. Có chè hồng hông ta?", "Ăn trưa cũng phải đội mũ. Nguyên tắc."],
    chieu: ["Chiều nay quay clip mới, ai muốn lên hình hông?", "Chill, kịp hết."],
    toi: ["Tối rồi mà năng lượng vẫn đầy.", "Mai quay sớm, mà Siêu Nhân hông cần ngủ."],
    mua: ["Mưa hả? Siêu Nhân hông sợ mưa. Chỉ sợ ướt mũ.", "Mưa rơi trên công viên... ủa bài này của ai ta."],
    gan: ["Ê {goi}! Chụp hình chung hông?", "{Goi} có thấy {ten:chua_te_deadline} đâu hông?", "Gét gô! Một triệu người theo dõi!"],
    han: ["Còn {con} ngày nữa là lên sân khấu!", "Đại Nhạc Hội Siêu Nhân. Nghe là thấy hồng rồi."],
    noi: ["Hồng không phải màu, Hồng là thái độ!", "Slay! Có gì hông?", "Chill, kịp hết.", "Muốn chụp hình hả? Đứng bên trái nha."],
  },
  cho: {
    sang: ["Gâu!", "Gâu gâu! (vẫy đuôi)", "(ngửi giày từng người đi vào)"],
    lam: ["Gâu.", "(gãi tai)", "(nằm phơi bụng)", "Gừ... (nhìn thấy màu hồng ở xa)"],
    trua: ["Gâu? (nhìn hộp cơm)", "(nhìn chằm chằm cái xúc xích)"],
    chieu: ["(ngáp một cái thật dài)", "Gâu... (lim dim)"],
    toi: ["Gâu! (canh cổng)", "(nằm cạnh bác {ten:bac_bao_ve})"],
    mua: ["(chui vào chòi trú mưa)", "Gâu! (sợ sấm)"],
    gan: ["Gâu? (ngửi ngửi)", "Gâu gâu! (vẫy đuôi)", "(dụi đầu vào chân)"],
    han: ["Gâu. (cảm thấy có chuyện lớn sắp xảy ra)"],
    noi: ["Gâu!", "Gâu gâu! (vẫy đuôi)", "(liếm tay)", "(nằm lăn ra đòi gãi bụng)"],
  },
};

// Người chơi là chó Tuất: đồng nghiệp nói với nó kiểu khác
const NOI_VOI_CHO = {
  nam: ["Ê {ten:cho}, lại đây coi!", "{ten:cho} ngoan, đừng cắn dây điện nha.", "Hông có xúc xích đâu {ten:cho} ơi.", "Ai cho chó vô văn phòng vậy? Thôi, dễ thương mà."],
  bac: ["{ten:cho} đấy à? Ra ngoài chơi đi.", "{ten:cho} ngoan, đừng cắn dây điện nhé.", "Không có xúc xích đâu {ten:cho} ơi."],
};

// Câu khi nhấc máy gọi điện
const ALO = { nam: ["Alo, nghe nè.", "Dạ alo, em nghe.", "Alo? Nói lớn lên chút coi."], bac: ["A lô, nghe đây.", "A lô, ai đấy?"] };
// Khi bị người chơi ngồi mất ghế
const GHE_CUA_TUI = { nam: ["Ủa, ghế của tui mà?", "Ngồi êm hông? Ghế tui đó.", "Thôi được, tui đứng xíu cũng được."], bac: ["Ơ, ghế của tớ đấy.", "Ngồi thoải mái nhé. Ghế tớ đấy."] };

// ---------- Tán gẫu giữa hai đồng nghiệp ----------
// Mỗi dòng: [người nói (0 = người thứ nhất trong khóa, 1 = người thứ hai), câu, cử chỉ người nói?, cử chỉ người nghe?]
export const CAP = {
  "designer|sales": [
    [[1, "{ten:designer}, chị mới chốt deal. Poster sửa xíu nha."], [0, "Sửa xíu là sửa cái gì? Nói rõ giùm."], [1, "Logo to hơn, mà nhỏ lại."], [0, "Hết cứu.", "lac_dau", "cuoi"]],
    [[0, "{ten:sales} hứa với khách cái gì nữa vậy?"], [1, "Tin chị đi, deal này chắc kèo!"], [0, "Lần trước cũng nói vậy."], [1, "Lần trước là luyện tập.", null, "cuoi"]],
  ],
  "hong_hot|ran_doc": [
    [[0, "Nghe gì chưa?"], [1, "Nghe rồi. Mà bà nghe bản nào?"], [0, "Có nhiều bản hả?"], [1, "Tui viết ba bản.", null, "cuoi"]],
    [[1, "Bà biết vụ trên tầng hai hông?"], [0, "Biết. Mà ông biết vụ tầng một hông?"], [1, "Tầng một là tầng mình mà."], [0, "Đúng rồi đó.", null, "gat_dau"]],
  ],
  "chua_te_deadline|thuc_tap_sinh": [
    [[1, "Dạ anh {ten:chua_te_deadline}, file này hạn khi nào ạ?"], [0, "Hôm qua."], [1, "Dạ?", "gai_dau"], [0, "Chill. Mai làm.", null, "gat_dau"]],
    [[0, "Anh {ten:thuc_tap_sinh}... à em {ten:thuc_tap_sinh}... thôi, {ten:thuc_tap_sinh}."], [1, "Dạ em đây ạ."], [0, "Gọi sao cho đúng ta?", "gai_dau"], [1, "Dạ gọi sao cũng được ạ.", null, "cuoi"]],
  ],
  "chua_te_deadline|hong_hot": [
    [[1, "Nghe gì chưa? {ten:sieu_nhan_hong} hỏi ông ngồi đâu đó."], [0, "Nói tui đi công tác."], [1, "Công tác ở đâu?"], [0, "Ở dưới gầm bàn.", null, "cuoi"]],
  ],
  "dan_dau_tu|sales": [
    [[0, "{ten:sales}, mã này lần này là lên thật."], [1, "Chị tin anh. Nhưng chị hông xuống tiền."], [0, "Sao em xưng chị với anh?"], [1, "Thói quen nghề nghiệp anh ơi.", null, "cuoi"]],
  ],
  "dan_dau_tu|thanh_xin_nghi": [
    [[1, "Anh {ten:dan_dau_tu}, mai em xin nghỉ, bà ngoại em..."], [0, "Bà ngoại em ốm lần thứ mấy rồi?"], [1, "Dạ lần mười lăm."], [0, "Kỷ lục. Tài khoản anh còn chưa đỏ được vậy.", null, "cuoi"]],
  ],
  "con_ong_chau_cha|thanh_xin_nghi": [
    [[0, "Ông xin nghỉ hoài vậy?"], [1, "Còn ông đi trễ hoài vậy?"], [0, "Tui có chú."], [1, "Tui có bà ngoại.", null, "cuoi"]],
  ],
  "bien_kich|thuc_tap_sinh": [
    [[1, "Dạ chị {ten:bien_kich}, kịch bản này hay quá ạ."], [0, "Cảm ơn em. Ý tưởng của chị đó."], [1, "Dạ em thấy giống phim tối qua ạ."], [0, "Đây hông phải đạo, đây là cảm hứng.", "lac_dau"]],
  ],
  "bien_kich|designer": [
    [[0, "Bà vẽ giùm tui cái poster cho kịch bản mới."], [1, "Kịch bản nào? Cái giống phim Hàn hả?"], [0, "Cảm hứng thôi mà."], [1, "Vậy tui cũng cảm hứng cái poster cũ nha.", null, "cuoi"]],
  ],
  "giam_doc|thanh_ninh": [
    [[1, "Anh ơi, hôm nay anh nói câu nào cũng chuẩn."], [0, "Anh đã nói gì đâu."], [1, "Im lặng cũng chuẩn luôn anh!"], [0, "Thôi được rồi, em ra pha trà đi.", "lac_dau"]],
    [[0, "Lịch chiều nay của anh thế nào?"], [1, "Dạ trống ạ, để anh nghỉ ngơi."], [0, "Thế thì xếp cho anh một cuộc họp."], [1, "Dạ quyết định sáng suốt quá anh!", null, "gat_dau"]],
  ],
  "editor|quan_ly_idol": [
    [[0, "Anh {ten:quan_ly_idol}, em dựng xong clip của anh {ten:idol_het_thoi} rồi."], [1, "Cảm ơn em. Đừng đăng gì hết nha."], [0, "Dạ. Anh ăn gì chưa? Em mua dư một hộp."], [1, "Anh ăn rồi. Để dành cho {ten:idol_het_thoi} đi."], [0, "...Dạ.", "gat_dau"]],
  ],
  "idol_het_thoi|quan_ly_idol": [
    [[0, "Anh {ten:quan_ly_idol}, hôm nay có ai xin chữ ký em hông?"], [1, "Có. Một người."], [0, "Ai vậy anh?"], [1, "Anh.", null, "cuoi"]],
    [[1, "Chiều nay có show đám cưới, hát ba bài."], [0, "Công Viên có trong đó hông?"], [1, "Có. Hát hai lần."], [0, "Vậy em đi.", null, "gat_dau"]],
  ],
  "con_ong_chau_cha|truong_phong": [
    [[1, "{ten:con_ong_chau_cha}, ba giờ họp nhé. Họp nhanh thôi."], [0, "Ông họp một mình đi, tui bận."], [1, "Cậu bận gì thế?"], [0, "Bận ngồi thử ghế phó giám đốc.", null, "lac_dau"]],
  ],
  "giam_doc|truong_phong": [
    [[1, "Anh ơi, em đặt lịch họp với anh lúc bốn giờ nhé."], [0, "Họp về việc gì thế?"], [1, "Họp để lên lịch họp ạ."], [0, "Anh không ép, tùy em.", "gai_dau"]],
  ],
  "bac_bao_ve|cho": [
    [[0, "{ten:cho}, nằm im nào."], [1, "Gâu."], [0, "Ừ, bác biết rồi. Bác không thấy gì đâu.", "gat_dau"]],
    [[1, "Gâu gâu!"], [0, "Đói à? Chiều bác mua xúc xích cho."], [1, "(vẫy đuôi lia lịa)"]],
  ],
  "chi_dai|thanh_ninh": [
    [[1, "Chị {ten:chi_dai} ơi, sếp khen sự kiện của chị đó."], [0, "Sếp khen hay em nói thêm vô?"], [1, "Dạ... em thêm chút xíu."], [0, "Chị biết mà.", "lac_dau"]],
  ],
  "chua_te_deadline|sieu_nhan_hong": [
    [[1, "{ten:chua_te_deadline} ơi, anh mua trà sữa cho em nè. Màu hồng!"], [0, "Em hông uống đồ hồng."], [1, "Hồng không phải màu, Hồng là thái độ!"], [0, "Thái độ này em xin kiếu.", "lac_dau"]],
  ],
  "cho|sieu_nhan_hong": [
    [[0, "Gừ..."], [1, "{ten:cho} à, mình làm hòa nha?"], [0, "GÂU GÂU!"], [1, "Thôi, để bữa khác.", "gai_dau"]],
  ],
  "idol_het_thoi|sieu_nhan_hong": [
    [[1, "Anh {ten:idol_het_thoi}, em mới hát lại bài Công Viên nè."], [0, "Bài đó của anh."], [1, "Giờ là của khán giả rồi anh."], [0, "Em biết anh là ai hông?", "lac_dau"]],
  ],
  "ran_doc|sieu_nhan_hong": [
    [[1, "Ê {ten:ran_doc} Ếch, nhớ hồi lớp ba hông?"], [0, "Nhớ. Nhớ kỹ lắm."], [1, "Hồi đó vui ghê ha."], [0, "Ừ. Vui cho anh."]],
  ],
  "hong_hot|it": [
    [[0, "Anh {ten:it}, wifi lại chậm nữa."], [1, "Tắt đi bật lại thử chưa?"], [0, "Tắt cái gì?"], [1, "Điện thoại. Rồi làm việc.", null, "cuoi"]],
  ],
  "it|truong_phong": [
    [[1, "{ten:it} ơi, máy chiếu phòng họp lại hỏng rồi."], [0, "Anh tắt đi bật lại thử chưa?"], [1, "Tớ thử ba lần rồi."], [0, "Vậy là nó hông muốn họp nữa.", null, "lac_dau"]],
  ],
  "ke_toan|sales": [
    [[1, "{ten:ke_toan} ơi, tạm ứng cho chị xíu nha."], [0, "Ủa, ai là chị ai?"], [1, "Tin chị đi, deal này chắc kèo!"], [0, "Không có hóa đơn là không có tiền.", "lac_dau"]],
  ],
  "hr|ke_toan": [
    [[0, "Bà rảnh hông, qua uống trà xíu."], [1, "Trà có hóa đơn hông?"], [0, "Trà nhà tui mang theo."], [1, "Vậy thì được.", "gat_dau"]],
  ],
  "hr|thanh_xin_nghi": [
    [[0, "{ten:thanh_xin_nghi}, em còn âm năm ngày phép đó."], [1, "Dạ, bà ngoại em hông biết chuyện đó ạ."], [0, "Lên phòng anh uống trà xíu."], [1, "Dạ... em hơi mệt.", "gai_dau"]],
  ],
  "chi_dai|thuc_tap_sinh": [
    [[0, "{ten:thuc_tap_sinh}, có ai ăn hiếp em hông?"], [1, "Dạ hông có ạ."], [0, "Đứa nào làm em khóc, chỉ mặt chị."], [1, "Dạ... chị bằng tuổi em mà.", null, "cuoi"]],
  ],
  "chua_te_deadline|truong_phong": [
    [[1, "{ten:chua_te_deadline}, tiến độ thế nào rồi?"], [0, "Đang chạy."], [1, "Chạy đến đâu rồi?"], [0, "Chạy trốn.", null, "lac_dau"]],
  ],
  "editor|idol_het_thoi": [
    [[1, "{ten:editor}, cảnh anh hát em giữ hết chưa?"], [0, "Dạ giữ. Mà anh nhép lệch nửa nhịp."], [1, "Đó là phong cách."], [0, "Dạ. Render xong là xong.", "gat_dau"]],
  ],
};

// Chuyện văn phòng chung: mỗi dòng có bản giọng Nam (nam) và giọng Bắc (bac); dk: điều kiện ngữ cảnh
const g = (nam, bac) => ({ nam, bac: bac ?? nam });
export const CHUNG = [
  { dk: c => c.gio < 12.2, ds: [[0, g("Trưa nay ăn gì {goi}?", "Trưa nay ăn gì {goi}?")], [1, g("Cơm tấm hông?", "Bún chả không?")], [0, g("Hôm qua ăn rồi.", "Hôm qua ăn rồi.")], [1, g("Vậy ăn tiếp.", "Thế thì ăn tiếp."), null, "cuoi"]] },
  { ds: [[0, g("Có ai đặt trà sữa hông?", "Có ai đặt trà sữa không?")], [1, g("Cho {xung} một ly, ít đường.", "Cho {xung} một cốc, ít đường.")], [0, g("Ít đường mà thêm trân châu hả?", "Ít đường mà thêm trân châu à?")], [1, g("Ừ, cân bằng.", "Ừ, cân bằng."), null, "cuoi"]] },
  { dk: c => c.ngay >= 10 && c.ngay <= 16, ds: [[0, g("Lương về chưa {goi}?", "Lương về chưa {goi}?")], [1, g("Về rồi. Đi luôn rồi.", "Về rồi. Đi luôn rồi."), null, "cuoi"]] },
  { dk: c => c.ngay >= 24, ds: [[0, g("Còn {con} ngày nữa thôi đó.", "Còn {con} ngày nữa thôi đấy.")], [1, g("Đừng nhắc, {xung} đang cố quên.", "Đừng nhắc, {xung} đang cố quên."), "lac_dau"]] },
  { dk: c => c.mua, ds: [[0, g("Mưa vầy chắc đường ngập rồi.", "Mưa thế này chắc đường ngập rồi.")], [1, g("Ngập tới yên xe luôn đó.", "Ngập đến yên xe rồi đấy.")], [0, g("Thôi ở lại làm thêm.", "Thôi ở lại làm thêm vậy.")], [1, g("Ai nói vậy là sếp nghe đó nha.", "Nói thế sếp nghe thấy đấy."), null, "cuoi"]] },
  { dk: c => c.gio >= 17.3, ds: [[0, g("{Goi} về chưa?", "{Goi} về chưa?")], [1, g("Sếp chưa về, sao dám về.", "Sếp chưa về, sao dám về.")], [0, g("Sếp về rồi đó.", "Sếp về rồi đấy.")], [1, g("Thiệt hả? Vậy đi liền.", "Thật à? Thế thì đi luôn."), null, "cuoi"]] },
  { ds: [[0, g("Group Zalo-lô công ty nhắn gì mà nhiều vậy?", "Nhóm Zalo-lô công ty nhắn gì mà nhiều thế?")], [1, g("Sếp gửi bài mười thói quen của người thành công.", "Sếp gửi bài mười thói quen của người thành công.")], [0, g("Ai thả tim chưa?", "Ai thả tim chưa?")], [1, g("Mới có {ten:thanh_ninh}.", "Mới có {ten:thanh_ninh}."), null, "cuoi"]] },
  { ds: [[0, g("Máy lạnh lạnh quá trời.", "Điều hòa lạnh quá.")], [1, g("Ai chỉnh xuống mười sáu độ vậy?", "Ai chỉnh xuống mười sáu độ thế?")], [0, g("Hông biết. Mà đừng ai chỉnh lại.", "Không biết. Mà đừng ai chỉnh lại."), null, "gat_dau"]] },
  { dk: c => c.ngay < 17, ds: [[0, g("Đi Vũng Tàu có bắt chơi trò tập thể hông?", "Đi Vũng Tàu có bắt chơi trò tập thể không?")], [1, g("Có. Bắt buộc luôn.", "Có. Bắt buộc đấy.")], [0, g("Trời ơi.", "Trời ơi."), "lac_dau"]] },
  { ds: [[0, g("Cuối tuần {goi} làm gì?", "Cuối tuần {goi} làm gì?")], [1, g("Ngủ.", "Ngủ.")], [0, g("Rồi sao nữa?", "Rồi sao nữa?")], [1, g("Ngủ tiếp.", "Ngủ tiếp."), null, "cuoi"]] },
  { ds: [[0, g("Suỵt, sếp đi ngang.", "Suỵt, sếp đi qua.")], [1, g("Đâu?", "Đâu?")], [0, g("Giỡn thôi.", "Đùa thôi.")], [1, g("Hết hồn.", "Hết cả hồn."), null, "cuoi"]] },
  { dk: c => c.gio < 16, ds: [[0, g("Ly cà phê thứ mấy rồi {goi}?", "Cốc cà phê thứ mấy rồi {goi}?")], [1, g("Ly thứ ba. Mà vẫn buồn ngủ.", "Cốc thứ ba. Mà vẫn buồn ngủ."), "ngap"]] },
  { ds: [[0, g("Fanpage được bao nhiêu người theo dõi rồi?", "Fanpage được bao nhiêu người theo dõi rồi?")], [1, g("Chưa tới một triệu.", "Chưa đến một triệu.")], [0, g("Còn xa hông?", "Còn xa không?")], [1, g("Xa lắm.", "Xa lắm."), "lac_dau"]] },
  { dk: c => c.gio >= 13 && c.gio < 16, ds: [[0, g("Buồn ngủ quá {goi} ơi.", "Buồn ngủ quá {goi} ơi."), "ngap"], [1, g("Đi pha cà phê hông?", "Đi pha cà phê không?")], [0, g("Đi. Mà đứng dậy hông nổi.", "Đi. Mà không đứng dậy nổi.")]] },
];

// ---------- Ghép câu ----------
const chon = a => a[Math.floor(Math.random() * a.length)];
const hoa = s => s.charAt(0).toUpperCase() + s.slice(1);
// thay biến trong câu; s: người nói, p: người nghe
export function thayBien(cau, { s, p, tenCua, vai, ngay = 1 }) {
  const xh = p ? xungHo(s, p, tenCua) : { goi: "bạn", xung: "tui" };
  return cau
    .replace(/\{ten:(\w+)\}/g, (_, m) => tenCua(m === "player" ? vai : m))
    .replace(/\{goi\}/g, xh.goi).replace(/\{Goi\}/g, hoa(xh.goi))
    .replace(/\{xung\}/g, xh.xung).replace(/\{Xung\}/g, hoa(xh.xung))
    .replace(/\{con\}/g, String(Math.max(0, 31 - ngay)));
}
// tách "câu|cử chỉ"
export function tachCu(cau) { const i = cau.lastIndexOf("|"); return i < 0 ? [cau, null] : [cau.slice(0, i), cau.slice(i + 1)]; }

// Chọn một câu lẩm bẩm. c = { gio, ngay, mua, gan, vai, tenCua, ngu (đang ngủ) }
export function chonLoi(ma, c) {
  const L = LOI[ma]; if (!L) return null;
  const gio = c.gio, ds = [];
  const them = (k, w = 1) => { for (const x of L[k] || []) ds.push([x, w]); };
  if (c.vai === "cho" && c.gan && ma !== "cho") return [thayBien(chon(GIONG_BAC.has(ma) ? NOI_VOI_CHO.bac : NOI_VOI_CHO.nam), { s: ma, p: "cho", ...c, vai: c.vai }), null];
  if (gio < 9.3) them("sang", 3);
  else if (gio >= 11.8 && gio < 13.2) them("trua", 3);
  else if (gio >= 13.2 && gio < 15.8) them("chieu", 3);
  else if (gio >= 17.3) them("toi", 3);
  them("lam", 1.4);
  if (c.mua) them("mua", 3);
  if (c.gan) them("gan", 4);
  if (c.ngay >= 24) them("han", 2);
  for (const x of L.ngay?.[c.ngay] || []) ds.push([x, 6]);
  let tong = ds.reduce((s, x) => s + x[1], 0), r = Math.random() * tong, cau = ds[0][0];
  for (const [x, w] of ds) { if ((r -= w) <= 0) { cau = x; break; } }
  const [chu, cu] = tachCu(cau);
  return [thayBien(chu, { s: ma, p: c.vai, ...c }), cu];
}

// Câu đáp khi người chơi bắt chuyện mà nhân vật không có cảnh truyện (thay cho danh sách chung CAU_BAN)
// c = { gio, ngay, mua, vai, tenCua }
export function cauBan(ma, c) {
  const L = LOI[ma];
  if (!L) return "Đang bận, lát nói nha.";
  if (c.vai === "cho" && ma !== "cho") return thayBien(chon(GIONG_BAC.has(ma) ? NOI_VOI_CHO.bac : NOI_VOI_CHO.nam), { s: ma, p: "cho", ...c });
  const ds = [...(L.noi || []), ...(L.noi || []), ...(L.gan || [])];
  const gio = c.gio;
  const k = gio < 9.3 ? "sang" : gio >= 11.8 && gio < 13.2 ? "trua" : gio >= 13.2 && gio < 15.8 ? "chieu" : gio >= 17.3 ? "toi" : "lam";
  ds.push(...(L[k] || []));
  if (c.mua) ds.push(...(L.mua || []));
  if (c.ngay >= 24) ds.push(...(L.han || []));
  ds.push(...(L.ngay?.[c.ngay] || []), ...(L.ngay?.[c.ngay] || []));
  return thayBien(tachCu(chon(ds))[0], { s: ma, p: c.vai, ...c });
}

// câu nhấc máy / câu khi bị chiếm ghế
export function cauAlo(ma) { return ma === "quan_ly_idol" ? "Chuyện này để anh lo, đừng ai đăng gì hết!" : chon(GIONG_BAC.has(ma) ? ALO.bac : ALO.nam); }
export function cauGheCuaTui(ma) { return chon(GIONG_BAC.has(ma) ? GHE_CUA_TUI.bac : GHE_CUA_TUI.nam); }

// Chọn một đoạn tán gẫu cho hai người a, b (đã có mặt). Trả về [{ai: ma, chu, cu, nghe}] hoặc null
export function chonHoiThoai(a, b, c) {
  const k1 = `${a}|${b}`, k2 = `${b}|${a}`;
  const rieng = CAP[k1] ? [CAP[k1], [a, b]] : CAP[k2] ? [CAP[k2], [b, a]] : null;
  if (rieng && Math.random() < 0.75) {
    const [ds, ai] = rieng, d = chon(ds);
    return d.map(([i, cau, cu, nghe]) => ({ ai: ai[i], nghe: ai[1 - i], chu: thayBien(cau, { s: ai[i], p: ai[1 - i], ...c }), cu: cu || null, cuNghe: nghe || null }));
  }
  if (a === "cho" || b === "cho") return null;
  const hop = CHUNG.filter(x => !x.dk || x.dk(c));
  if (!hop.length) return null;
  const d = chon(hop), ai = Math.random() < 0.5 ? [a, b] : [b, a];
  return d.ds.map(([i, cau, cu, nghe]) => {
    const s = ai[i], p = ai[1 - i];
    return { ai: s, nghe: p, chu: thayBien(GIONG_BAC.has(s) ? cau.bac : cau.nam, { s, p, ...c }), cu: cu || null, cuNghe: nghe || null };
  });
}
