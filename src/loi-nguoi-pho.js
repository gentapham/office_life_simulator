// Lời người đi đường ở Quận Hóng khi người chơi bắt chuyện (bấm E cạnh người đi bộ, người ngồi quán, người bán hàng...).
// Ai ngoài phố cũng nói giọng Sài Gòn. Chửi thì chỉ cằn nhằn nhẹ; tên mạng xã hội, ví điện tử, sàn mua sắm đều là tên nhại.
// Mỗi nhóm câu gắn một "tâm trạng" để nhân vật làm cử chỉ, phát tiếng cho hợp (xem 3d/tro-chuyen-pho.js).

// ---------- Theo tâm trạng ----------
const VUI = [
  "Chào nha! Hôm nay trời đẹp ghê, đi đâu mà vui dzậy?",
  "Ủa, quen hông ta? Thôi kệ, chào cái cho vui!",
  "Hehe, tui mới trúng tờ vé số an ủi, vui quá trời!",
  "Bữa nay tui được tăng lương nè, mừng muốn xỉu!",
  "Gặp người lạ mà cười tươi dzậy là ngày đẹp rồi đó.",
  "Ăn cơm chưa? Chưa thì đi ăn đi, đói mất đẹp trai đẹp gái à nha.",
  "Trời ơi, nhìn mặt hiền khô hà. Chúc một ngày dzui dẻ nha!",
  "Tui đang nghe nhạc trên Diu-túp, bài này hay dữ thần, nghe hông?",
  "Má tui mới gọi nói nấu canh chua cá lóc, về sớm thôi!",
  "Hello hello! Đẹp trời dzầy mà không đi dạo thì uổng lắm.",
  "Nay cuối tháng, ví mỏng mà lòng vẫn dày nha bồ.",
  "Tui mới tập thể dục xong, thấy mình trẻ ra mười tuổi luôn!",
  "Ê, cái áo đẹp dữ đa. Mua ở đâu dzậy, chỉ tui với?",
  "Gặp nhau là cái duyên, mua giùm tui hông được thì cười giùm tui cái.",
  "Đời ngắn lắm, cười lên đi, cười miễn phí mà!",
  "Hôm qua con tui được giấy khen, tui khoe với cả xóm rồi, giờ khoe với bạn luôn!",
  "Trời đất, gặp người chịu nói chuyện với tui, vui ghê á!",
  "Tui mới săn được cái nồi chiên không dầu trên Sốp-pi, giá rẻ bất ngờ!",
  "Nay tui được nghỉ phép, đi lang thang cho đã cái nư.",
  "Chào nghen! Đi đường nhớ cẩn thận, Quận Hóng đông vui lắm.",
  "Ui, bạn cười giống ca sĩ nào trên Tóp-tóp quá trời luôn!",
  "Tui mới bỏ ống heo được một trăm ngàn, giàu rồi nha!",
  "Hôm nay ai cũng dễ thương hết trơn, kể cả bạn đó.",
  "Có cái quán chè mới mở đầu hẻm, ngon bá cháy, ghé thử đi!",
];
const BUON = [
  "Haizz, người yêu tui mới chặn Zola tui rồi...",
  "Lương về hôm qua, hôm nay hết sạch. Buồn ghê.",
  "Tui mới bị sếp la, giờ đi bộ cho hạ hỏa nè.",
  "Con mèo nhà tui bỏ nhà đi ba bữa rồi, có thấy con mèo mướp nào hông?",
  "Thôi, đừng hỏi, hôm nay tui hổng có ổn.",
  "Đi phỏng vấn lần thứ mười hai, rớt tiếp rồi bạn ơi.",
  "Ngồi một mình ở đây cho gió nó thổi bay nỗi buồn đi...",
  "Nhà trọ lên giá nữa rồi, chắc tui về quê trồng rau quá.",
  "Tui đăng bài lên Phây-búc mà không ai thả tim hết trơn.",
  "Hồi đó tui cũng có ước mơ lớn lắm, giờ ước mơ là được ngủ đủ tám tiếng.",
  "Điện thoại tui rớt xuống cống rồi, mất hết hình con tui...",
  "Bạn thân tui đi nước ngoài rồi, giờ đi cà phê một mình buồn hiu.",
  "Cuối tuần nào cũng tăng ca, tui quên mặt ba má luôn rồi.",
  "Đầu tư cái coin gì đó mất trắng, chắc tui đi bán vé số quá.",
  "Hôm nay sinh nhật tui mà hổng ai nhớ hết. Mà thôi, kệ...",
  "Mưa thì buồn, nắng cũng buồn, chắc tại tui buồn sẵn.",
  "Tui nhớ quê quá. Ở dưới quê giờ này đang nướng khô cá lóc...",
  "Ủa có ai cần người tâm sự hông, tui cần nè.",
  "Lỡ chuyến xe buýt, lỡ luôn buổi hẹn. Đời tui toàn chữ lỡ.",
  "Ví MôMô còn đúng ba ngàn hai, sống sao tới cuối tháng đây trời.",
];
const BUC = [
  "Gì? Đang bực nè, đừng có kiếm chuyện nha!",
  "Mắc gì cứ nhìn tui dzậy? Mặt tui dính gì hả?",
  "Đi đứng kiểu gì dzậy? Suýt nữa đụng tui rồi đó!",
  "Trời đất ơi, đang gấp mà cứ bị chặn đường hoài!",
  "Hỏi gì hỏi lẹ đi, tui trễ giờ rồi nè cha nội!",
  "Thôi đi ông nội, tui hổng mua gì hết, hổng đăng ký gì hết!",
  "Mắc dịch, sáng giờ xui gì đâu á, đừng có làm tui xui thêm.",
  "Tránh ra giùm cái, đứng giữa đường chi dzậy?",
  "Bộ rảnh lắm hả? Tui đi làm chứ đâu có đi chơi!",
  "Bực mình ghê! Mới rửa xe xong là mưa, mưa xong là ngập!",
  "Đừng nói chuyện với tui, tui đang giận cả thế giới.",
  "Ủa rồi sao? Quen biết gì đâu mà bắt chuyện ngang xương dzậy?",
  "Shipper giao trễ hai tiếng, giờ ai hỏi gì tui cũng quạu à nha.",
  "Trời ơi cái thằng cha chạy xe hồi nãy, quẹo hổng xi nhan gì hết trơn!",
  "Khùng hả, giữa trưa nắng chang chang kêu tui đứng lại chi?",
  "Coi chừng tui nha, tui đang đói, mà đói là tui dữ lắm.",
  "Hỏi nữa tui méc chú công an đứng đầu ngã tư bây giờ!",
  "Đi chỗ khác chơi giùm, tui đang canh giật deal trên Sốp-pi!",
  "Cái đồ quỷ sứ, giẫm lên dép mới của tui rồi kìa!",
  "Ai cho phép lại gần? Giữ khoảng cách hai mét giùm cái!",
];
const NGAI = [
  "Ơ... dạ... tui hông có quen bạn đâu á...",
  "Dạ, dạ... tui hổng biết gì đâu, hỏi người khác nha.",
  "Ủa... tui hả? Chắc bạn nhầm người rồi...",
  "Thôi tui đi trước nha, có việc gấp lắm... hehe...",
  "Tui... tui đang nghe điện thoại... à hông, tui đi đây.",
  "Ờ... ờ, ừa, ừa... chào nha... bye...",
  "Xin lỗi nha, tui hướng nội lắm, nói chuyện với người lạ là run.",
  "Dạ hông, tui hổng có tiền lẻ đâu, thiệt đó.",
  "Ủa sao nhìn tui dữ dzậy... tui có làm gì đâu...",
  "Ờm... thôi, tui trốn sếp ra đây, đừng nói ai thấy tui nha.",
  "Hì... tui ngại quá, tui hổng biết nói gì luôn.",
  "Tui... tui đang tìm nhà vệ sinh, gấp lắm, xin phép nha!",
  "Thôi khỏi, tui có bạn trai rồi... à mà hỏi gì dzậy?",
  "Bạn hỏi đường hả? Tui cũng đang lạc nè, hihi.",
  "Ờ... mặt bạn quen quen... mà thôi, chắc hông phải.",
  "Đừng nhìn tui, hôm nay tui chưa gội đầu...",
];
const TAM = [
  "Nghe gì chưa? Bà Sáu đầu hẻm mới mua chiếc xe tay ga màu hồng chóe!",
  "Nói nhỏ nghe nè, cái quán ốc ngoài đầu đường hồi hôm có ông kia say xỉn hát karaoke tới sáng.",
  "Ê biết hông, cái công ty G-gì-đó đầu đường có ông Siêu Nhân Hồng làm việc á!",
  "Tui nghe đồn ông chủ quán cà phê cóc là đại gia ngầm đó nha.",
  "Nhà kế bên tui cãi lộn ba bữa nay rồi, tui nghe hết trơn luôn.",
  "Hồi sáng có người livestream trên Tóp-tóp ngay ngã tư, đông nghẹt người coi.",
  "Nghe nói cuối tháng có Đại Nhạc Hội Siêu Nhân, cả quận đi coi đó!",
  "Con nhỏ bán nước mía mới có bồ, bồ nó là anh xe ôm công nghệ đó.",
  "Bà Tư nói giá vàng lên nữa rồi, mà bả nói gì cũng đúng hết á.",
  "Bên Phố Tán Drama hôm qua có vụ hai bà giành chỗ đậu xe, coi vui lắm.",
  "Nghe đồn công ty đầu đường sắp có ông giám đốc mới, hổng biết thiệt hông.",
  "Ông bảo vệ công ty đầu đường nuôi một con chó ghét màu hồng, kỳ ghê.",
  "Tui mới thấy ông idol gì hồi xưa nổi lắm, giờ đi mua bánh mì như người thường.",
  "Đồn ầm lên trên nhóm Phây-búc Quận Hóng là sắp đào đường nữa đó.",
  "Ông Ba bán vé số trúng độc đắc hồi nào hông ai biết, mà tự nhiên đi xe hơi.",
  "Bà chủ nhà trọ tui đăng ký học nhảy hiện đại, tối nào cũng mở nhạc ầm ầm.",
  "Chuyện này đừng nói ai nha: ổng với bả quen nhau qua Zola nhắn nhầm số đó.",
  "Tui nghe tụi nhỏ nói cái tượng người bạc ngoài kia là người thiệt á!",
  "Nghe đâu cây xăng đầu đường sắp có chương trình đổ xăng tặng ly, đi lẹ hông hết.",
  "Ở xóm tui ai cũng biết hết chuyện nhà nhau, còn rành hơn chủ nhà nữa.",
];
const HOI = [
  "Ê bạn ơi, chợ Phố Cũ đi hướng nào dzậy?",
  "Cho tui hỏi trạm xe buýt số 69 ở đâu vậy bạn?",
  "Bạn ơi, có biết chỗ nào sửa xe gần đây hông? Xe tui xẹp bánh rồi.",
  "Ủa đây là đường Hóng Chính hả? Tui coi bản đồ mà nó quay mòng mòng.",
  "Bạn có sạc dự phòng hông, cho tui mượn năm phút thôi!",
  "Cho tui xin chút nước được hông, khát khô cổ rồi.",
  "Bạn ơi, có tiền lẻ đổi giùm tui tờ năm trăm ngàn hông?",
  "Cho hỏi cái ATM gần nhất ở đâu dzậy, tui cần rút tiền gấp.",
  "Ủa công viên Quận Hóng còn xa hông bạn? Tui đi bộ mỏi giò quá rồi.",
  "Bạn chụp giùm tui tấm hình được hông? Chụp sao cho chân dài dài nha!",
  "Có biết quán hủ tiếu gõ hay đậu chỗ nào hông? Tui thèm quá.",
  "Bạn ơi, mấy giờ rồi dzậy? Điện thoại tui hết pin rồi.",
  "Cho tui hỏi, đi tới Đại lộ Kẹt Xe thì quẹo trái hay quẹo phải?",
  "Bạn có biết số điện thoại xe ôm công nghệ hông? Tui hổng biết xài app.",
  "Ê, bạn có thấy cái chìa khóa xe màu đỏ rớt đâu đây hông?",
  "Cho tui ké dù một khúc được hông? Tui đi tới đầu hẻm thôi à.",
];
const DUONG_SA = [
  "Kẹt xe kinh khủng khiếp, tui đi có ba cây số mà mất một tiếng.",
  "Hồi chiều mưa có mười lăm phút mà nước ngập tới đầu gối, lội muốn xỉu.",
  "Giá xăng tăng nữa rồi, đổ đầy bình mà đau cả tim.",
  "Đường Hóng Chính đào lên lấp xuống quài, năm nào cũng đào.",
  "Trời Sài Gòn này hai mùa: nắng muốn cháy da với mưa muốn trôi nhà.",
  "Giờ cao điểm đó đừng có ra đường, ra là bị kẹt cứng như cá mòi trong hộp.",
  "Hôm qua tui bị phạt vì quên đội nón bảo hiểm, đau ví ghê.",
  "Mấy cái đèn đỏ ở ngã tư đếm ngược chín mươi giây, tui ngồi ngủ được một giấc.",
  "Nóng quá trời, ra đường năm phút mà mồ hôi ướt hết cái áo.",
  "Tháng này nước ngập, tháng sau chắc tui sắm ghe đi làm luôn.",
  "Xe buýt số 69 lúc nào cũng tới trễ, mà lúc mình trễ thì nó tới sớm.",
  "Kẹt xe dài tới chân cầu, mấy anh xe ôm leo lên vỉa hè chạy hết trơn.",
  "Bữa nay gió mát dễ chịu ghê, chắc sắp mưa đó.",
  "Có cái ổ gà ngay giữa đường, tối qua tui sập xuống muốn rớt cái răng.",
  "Đi xe máy ở đây phải có kỹ năng né như chơi game đó bạn.",
  "Giá gửi xe tăng lên năm ngàn rồi, sống ở đây cái gì cũng tăng trừ lương.",
  "Ngã tư này mà không có đèn chắc thành bãi đấu vật luôn quá.",
  "Mấy bữa nay trời hầm hầm, tối ngủ phải mở quạt số năm.",
];
const MOI_MUA = [
  "Mua {mon} hông con? Nóng hổi nè, ăn một lần là ghiền!",
  "{mon} đây, ngon bổ rẻ, mua ủng hộ cô một phần nha!",
  "Lại đây lại đây, {mon} hôm nay đặc biệt, cô thêm nhiều cho nè!",
  "Ăn {mon} hông cưng? Cô bán chỗ này hai chục năm rồi đó.",
  "Mua giùm cô một phần {mon} đi, cô bán từ sáng tới giờ chưa có mối nào.",
  "Ê, {mon} có chuyển khoản MôMô luôn nha, khỏi lo tiền lẻ!",
  "Người đẹp ơi, ghé ăn {mon} đi, ăn xong là đẹp thêm à nha.",
  "Mua {mon} hông, lấy hai tặng... tặng nụ cười của cô!",
  "Nay cô bán rẻ cho người đẹp, mua lẹ kẻo hết nghen!",
  "Con đi làm mệt hông? Ghé đây ăn {mon} lấy sức nè!",
];
const GHEO = [
  "Ủa, nhìn bạn quen quen, hình như mình gặp nhau trong mơ rồi đó.",
  "Bạn có phải wifi hông? Tại sao tui thấy mình có kết nối dzậy ta...",
  "Đi đâu mà đẹp quá dzậy, cho xin cái Zola làm quen được hông?",
  "Trời nắng mà gặp bạn tự nhiên thấy mát hẳn luôn.",
  "Bạn ơi bạn có làm rớt gì hông? À, rớt mất tim tui rồi đó.",
  "Ê, nụ cười đó mà đem đi bán chắc giàu to luôn á.",
  "Bạn có phải cục pin hông? Thấy bạn là tui đầy năng lượng liền.",
  "Hỏi nhỏ nè, bạn có người yêu chưa? Hỏi dzậy thôi chứ tui cũng ế.",
  "Bạn đi ngang mà mùi thơm quá, xài nước hoa gì dzậy, chỉ tui mua cho bồ với.",
  "Gặp bạn chắc là định mệnh rồi, hông thì cũng là... tình cờ.",
  "Tui hổng giỏi văn, chỉ biết nói: bạn dễ thương quá trời!",
  "Để tui đoán nha: bạn là người làm văn phòng, đẹp nhưng thiếu ngủ.",
];
const TRIET_LY = [
  "Đời người như ly trà đá, lúc đầu mát lạnh, cuối cùng chỉ còn đá.",
  "Tiền thì kiếm được, chứ thời gian trôi rồi là hết đó bạn.",
  "Sống ở đời, cứ chạy chậm lại một chút, đèn đỏ còn biết dừng mà.",
  "Làm gì thì làm, đừng quên ăn sáng. Sáng mà đói là cả ngày quạu.",
  "Đường nào cũng tới La Mã, mà đường nào cũng kẹt xe.",
  "Người khôn ngồi trà đá, người dại chạy deadline.",
  "Hạnh phúc là có người chờ mình về ăn cơm, đơn giản dzậy thôi.",
  "Đừng so mình với người ta, người ta có lỗ của người ta.",
  "Cái gì qua rồi thì cho qua, giống như xe qua ngã tư dzậy đó.",
  "Ngồi vỉa hè mới thấy, ai cũng vội mà chẳng biết vội đi đâu.",
  "Trên đời có hai thứ hổng nên tin: dự báo thời tiết với lời hứa tăng lương.",
  "Nghèo thì nghèo, chứ ly cà phê sáng là phải có, đó là tự trọng.",
  "Mạng xã hội là nơi ai cũng hạnh phúc, chỉ có ngoài đời là hổng.",
  "Sống chậm lại, thở sâu vô, rồi... mua ly trà đá.",
  "Cuộc đời là chuỗi ngày chờ lương, nhận lương, rồi chờ lương tiếp.",
  "Làm người tốt hông có lỗ đâu, có lỗ thì cũng lỗ có chút xíu.",
];

// ---------- Theo kiểu người ----------
const THEO_KIEU = {
  sieu_anh_hung: [
    "Đứng lại! Ta là siêu anh hùng bảo vệ Quận Hóng. Có ai ăn hiếp bạn hông?",
    "Đừng sợ, có ta ở đây, kẹt xe cũng phải nhường đường!",
    "Siêu năng lực của ta hả? Ăn ba tô hủ tiếu không thấy no.",
    "Bí mật nha: ban ngày ta là nhân viên ngân hàng.",
    "Áo choàng này mua trên Sốp-pi, có ba chục ngàn mà bay phấp phới.",
    "Hôm nay ta đã giúp bà cụ qua đường, cứu một con mèo kẹt trên cây. Còn bạn?",
    "Muốn chụp hình với siêu anh hùng thì đứng gần vô, cười tươi lên!",
    "Kẻ thù lớn nhất của ta là... cái đồng hồ báo thức sáng thứ hai.",
    "Quần sịp mặc ngoài là phong cách đó nha, đừng có cười!",
  ],
  quy_do: [
    "GLORY GLORY QUỶ ĐỎ! Bạn có coi trận tối qua hông?",
    "Năm nay Quỷ Đỏ vô địch chắc luôn! Năm sau cũng dzậy!",
    "Thua thì đã sao, fan Quỷ Đỏ không bao giờ đi một mình!",
    "Tối nay đá lúc hai giờ sáng, tui thức coi rồi sáng đi làm luôn.",
    "Bạn ủng hộ đội nào? Nói đội khác là nghỉ chơi nha.",
    "Tui có cái áo số 7 này mặc từ hồi đội còn mạnh tới giờ, chưa giặt lần nào.",
    "Huấn luyện viên mới mà hổng đá hay là tui lên Phây-búc chửi liền!",
    "Ê, đi nhậu coi bóng đá hông? Quán ốc đầu đường có màn hình bự!",
  ],
  long_chim: [
    "Con chim này hót hay nhứt xóm đó, sáng nào tui cũng dắt nó đi dạo.",
    "Muốn nghe nó hót hông? Đợi chút... nó đang ngại người lạ.",
    "Ở trần cho mát, đi dạo cho khỏe, nuôi chim cho vui. Sống vậy là sướng rồi.",
    "Hồi trẻ tui cũng đi làm văn phòng, giờ nghỉ hưu đi xách lồng chim thôi.",
  ],
  khung_long: [
    "Gàoooo! Tui là khủng long nè! Mà nóng quá, bên trong toàn mồ hôi...",
    "Ủa, mặc đồ khủng long là sở thích, hổng phạm pháp nha!",
    "Tui đang quay clip cho Tóp-tóp, bạn đứng làm người bị khủng long rượt giùm nha!",
    "Đừng lại gần quá, cái đuôi tui hay quét trúng người ta lắm.",
  ],
  the_duc: [
    "Một hai ba bốn, hai hai ba bốn! Tập chung hông, miễn phí nè!",
    "Ngày nào cũng phải tập, ba mươi phút thôi mà khỏe re!",
    "Cái loa này mở nhạc remix tập thể dục, nghe là chân tự nhún liền.",
    "Bạn ngồi văn phòng nhiều phải không? Nhìn cái lưng là biết liền.",
  ],
  shipper: [
    "Tránh ra tránh ra, hàng dễ vỡ nha! Đơn này giao trễ là bị đánh giá một sao đó!",
    "Ủa bạn có phải anh Tuấn hẻm 69 hông? Hông hả, thôi chết...",
    "Bảy thùng này mà rớt một thùng là mất trắng tiền công một ngày.",
    "Sốp-pi khuyến mãi mười tháng mười, tui chạy từ sáng chưa kịp ăn cơm.",
    "Gọi khách năm cuộc hổng nghe máy, chắc tui đứng đây làm cột đèn luôn.",
  ],
  ngo_khong: [
    "Ta là Tề Thiên Đại Thánh đây! Cân đẩu vân bị kẹt xe nên đi bộ.",
    "Muốn coi ta múa gậy hông? Cho xin năm ngàn ủng hộ đoàn.",
    "Sư phụ ta đi lạc đâu mất tiêu rồi, có thấy ông sư nào đi ngang hông?",
    "Bảy mươi hai phép biến hóa mà hổng biến ra được tiền thuê nhà.",
  ],
  noel: [
    "Ho ho ho! Mới tháng Mười mà tui tập dượt sớm cho kịp Giáng Sinh.",
    "Quà hả? Năm nay ngoan thì tháng Mười Hai quay lại tui cho.",
    "Mặc đồ này giữa trời Sài Gòn nóng muốn bốc khói luôn á.",
    "Tuần lộc của tui gửi ở bãi giữ xe, mất năm ngàn một đêm.",
  ],
  cam_bang: [
    "Đọc tấm bảng chưa? Đọc rồi thì cười một cái là tui vui rồi.",
    "Tui cầm bảng này từ sáng, có ba người chụp hình, hai người đòi ôm.",
    "Đừng hỏi tui là ai, tui là người cầm bảng.",
    "Mai tui đổi bảng mới, bạn có ý tưởng gì hông?",
  ],
  bong_bay: [
    "Bong bóng của con đó, hổng cho ai hết!",
    "Má con đang mua chè, con đứng đây giữ bong bóng.",
    "Anh chị có biết bong bóng bay lên tới đâu hông? Tới mặt trăng hông?",
    "Con muốn làm siêu nhân khi lớn lên!",
  ],
  chay: [
    "Hộc... hộc... chào buổi sáng... tui chạy được ba cây rồi!",
    "Chạy chung hông? Một vòng công viên thôi mà!",
    "Đừng làm tui dừng lâu, tim tui đang ở vùng đốt mỡ!",
    "Sáng chạy bộ, trưa ăn cơm tấm sườn bì chả, cân bằng lắm.",
    "Đồng hồ thông minh của tui báo bước chân, mới có hai ngàn bước à.",
  ],
  cho: [
    "Bé Lu nhà tui hiền lắm, nó chỉ sủa người mặc đồ hồng thôi.",
    "Nó hổng cắn đâu, nó chỉ ngửi ngửi rồi liếm thôi à.",
    "Sáng nào tui cũng dắt nó đi dạo, nó dắt tui thì đúng hơn.",
    "Muốn vuốt hông? Vuốt nhẹ nhẹ nha, nó nhột.",
    "Con này ăn còn sang hơn tui, hạt nhập khẩu hẳn hoi.",
  ],
  hs: [
    "Dạ con chào cô chú! Con mới tan học nè!",
    "Hôm nay con được mười điểm Toán đó!",
    "Mẹ con nói hổng được nói chuyện với người lạ đâu...",
    "Cô chú có kẹo hông? Hông hả... dạ thôi.",
    "Bài tập về nhà nhiều quá trời, con muốn làm siêu nhân cho khỏi học!",
    "Con đi học về mua bánh tráng trộn, ngon cực!",
  ],
  quet: [
    "Đi đứng nhẹ nhẹ giùm cô, cô mới quét xong khúc này đó con.",
    "Bỏ rác đúng chỗ nha con, thùng rác ở đầu đường kìa.",
    "Tối nào cô cũng quét tới khuya, sáng ra thấy đường sạch là vui.",
    "Lá me rụng quá trời, quét hoài hổng hết.",
    "Con đi làm về khuya dzậy? Đi đường nhớ cẩn thận nghen.",
  ],
  ban_hang: [], // dùng MOI_MUA theo món
  xe_om: [
    "Xe ôm hông em? Đi đâu anh chở, giá cả thương lượng!",
    "Chạy xe ôm ở đây hai chục năm, đường nào anh cũng rành hơn bản đồ.",
    "Mấy cái app xe ôm công nghệ làm anh mất mối quá trời, mà thôi kệ.",
    "Đi đâu? Lên đây chú chở, nón bảo hiểm có sẵn nè!",
    "Ngồi đây đợi khách từ sáng, ngó bá tánh qua lại cũng vui.",
  ],
  xe_om_cn: [
    "Em đặt xe qua app hả? Anh đang đợi khách tên Tuấn nè.",
    "Chạy app cả ngày mà sao điểm thưởng hoài hổng lên.",
    "Muốn đi thì đặt qua điện thoại nha, anh hổng nhận khách ngoài.",
    "Trời mưa giá cao gấp đôi đó em, hổng phải anh đâu, app nó tính.",
  ],
  tra_da: [
    "Ngồi xuống làm ly trà đá đi, năm ngàn mà mát tới óc!",
    "Chỗ này là trung tâm thông tin của cả quận đó, chuyện gì cũng biết.",
    "Trà đá với hạt hướng dương, bàn chuyện thế giới, sướng hơn tiên.",
    "Ngồi đây coi người ta kẹt xe mà thấy mình may mắn ghê.",
    "Ê, ngồi chung bàn đi, tụi tui đang bàn chuyện giá vàng.",
  ],
  ca_phe: [
    "Cà phê sữa đá vỉa hè là nhất, quán sang chảnh hổng có cái hồn này.",
    "Sáng nào tui cũng ngồi đây, ngó xe chạy là tỉnh ngủ liền.",
    "Ngồi ghế nhựa thấp vậy mà êm ru, bạn ngồi thử đi.",
    "Ly bạc xỉu ở đây ngon hơn mấy quán trên Phây-búc quảng cáo nhiều.",
  ],
  hem: [
    "Con đi đâu dzô hẻm này dzậy? Kiếm nhà ai, chú chỉ cho.",
    "Hẻm này chú ở bốn chục năm rồi, nhà ai chú cũng biết hết.",
    "Chiều chiều ra ngồi hóng mát, coi tụi nhỏ đá banh, vui lắm.",
    "Ăn cơm chưa con? Chưa thì vô nhà cô ăn chung nè.",
  ],
  cho_buyt: [
    "Xe buýt 69 trễ hai chục phút rồi, chắc tài xế đi uống cà phê.",
    "Bạn cũng đợi xe hả? Ngồi xuống đi, đợi chung cho đỡ buồn.",
    "Đi xe buýt rẻ mà khỏi lo kẹt xe... à hông, vẫn kẹt.",
    "Hồi nãy có chiếc chạy ngang mà hổng chịu dừng, tức muốn xỉu!",
  ],
  tuong_bac: [
    "(Bức tượng bạc đứng im. Hình như nó vừa nháy mắt.)",
    "...(Tượng không nói gì. Hộp xin tiền dưới chân rung nhẹ.)",
    "Suỵt... đang làm tượng... bỏ tiền vô hộp rồi đi giùm...",
    "(Tượng bạc chậm rãi đổi tư thế, rồi đứng im như cũ.)",
  ],
  goi: [
    "Alo, alo, đợi chút... Gì dzậy bạn? Tui đang nghe điện thoại nè.",
    "Ừa ừa, để em gọi lại sau nha, có người hỏi chuyện em nè.",
    "Suỵt, sếp tui gọi đó, nói nhỏ thôi!",
  ],
  chup: [
    "Khoan khoan, đợi tui chụp xong tấm này đã, ánh sáng đang đẹp!",
    "Bạn chụp giùm tui tấm hình được hông? Lấy cả cái tòa nhà phía sau nha!",
    "Tấm này đăng Tóp-tóp chắc được triệu view luôn.",
  ],
  tam: [
    "Ê, đang kể chuyện hay, ngồi nghe chung hông?",
    "Tụi tui đang bàn chuyện cái ông Siêu Nhân Hồng đó, nghe nói sắp có một triệu người theo dõi.",
    "Lại đây lại đây, chuyện này mới nghe nè!",
    "Bọn tui đứng đây từ chiều, chuyện gì trong quận cũng biết hết.",
  ],
};

// ---------- Theo giờ, thời tiết ----------
const SANG = [
  "Sáng sớm mà gặp người lạ chào hỏi, vui cả ngày luôn.",
  "Ăn sáng chưa? Đầu hẻm có xôi gà ngon lắm đó.",
  "Sáng nào cũng kẹt xe, tui ra sớm mười lăm phút mà vẫn trễ.",
  "Mới sáng ra mà nắng chói chang, chắc trưa nay nóng dữ lắm.",
];
const TRUA = [
  "Trưa nắng dzầy mà còn đi lang thang, coi chừng say nắng nha.",
  "Giờ này phải ăn cơm tấm rồi ngủ trưa mới đúng chuẩn.",
  "Trưa rồi, đói muốn xỉu, quán cơm nào cũng đông nghẹt.",
];
const CHIEU = [
  "Chiều rồi, sắp tan tầm, chuẩn bị tinh thần kẹt xe đi là vừa.",
  "Chiều chiều ra đường hóng gió mát, sướng hơn ngồi trong phòng máy lạnh.",
  "Mấy giờ rồi ta? Tui phải đi đón con nữa.",
];
const TOI = [
  "Tối rồi mà còn đi đâu đó? Về nhà ăn cơm với gia đình đi.",
  "Tối nay có ai rủ đi ăn ốc hông, tui đang thèm quá.",
  "Đèn đường lên đẹp ghê, đi dạo buổi tối là nhất.",
];
const KHUYA = [
  "Khuya lơ khuya lắc rồi mà còn lang thang ngoài đường dzậy?",
  "Giờ này tui mới tan ca, mệt muốn đứt hơi.",
  "Khuya rồi, đi về đi, ngoài đường giờ này chỉ có tui với mấy con mèo.",
  "Bạn cũng thức khuya hả? Chắc lại deadline đúng hông?",
];
const MUA = [
  "Mưa quá trời mà hổng có áo mưa, ướt như chuột lột luôn nè.",
  "Mưa dzầy là lát nữa ngập cho coi, về lẹ đi bạn ơi.",
  "Đứng nép vô đây cho đỡ ướt nè, mưa Sài Gòn lát là tạnh.",
  "Mưa gì mà như trút nước, tui mới ủi cái áo xong...",
  "Mưa là phải ăn cái gì nóng nóng, như hủ tiếu gõ đó.",
];

// ---------- Theo vai người chơi ----------
const THEO_VAI = {
  sieu_nhan_hong: [
    "Trời ơi Siêu Nhân Hồng kìa! Chụp chung tấm hình được hông?",
    "Siêu Nhân Hồng ngoài đời nhìn tròn tròn dễ thương ghê!",
    "Cho xin chữ ký đi, tui theo dõi anh trên Tóp-tóp từ hồi mới có mười follow!",
    "Một triệu người theo dõi hả? Để tui bấm theo dõi liền nè!",
    "Con tui mê Siêu Nhân Hồng lắm, quay video chào nó một câu đi!",
    "Ủa thiệt là Siêu Nhân Hồng hả? Selfie một tấm nha, cười cái coi!",
    "Hồng ơi đi đâu dzậy? Bữa Đại Nhạc Hội tui đi coi đó nha!",
  ],
  cho: [
    "Ủa con chó ai mà dễ thương dzậy nè! Lại đây cưng!",
    "Ê, con chó này đi một mình hả? Chủ đâu rồi ta?",
    "Gâu gâu cái gì, tui hổng có đồ ăn đâu nha!",
    "Ngoan nha, đừng có sủa tui à. Thôi cho miếng bánh mì nè.",
  ],
  idol_het_thoi: [
    "Ủa anh là ca sĩ hát bài Công Viên hồi 2015 đúng hông? Nhìn quen quen!",
    "Hồi đó tui mê anh lắm, giờ anh còn đi hát hông?",
  ],
  giam_doc: [
    "Ủa sếp lớn mà cũng đi bộ ngoài đường hả? Bình dân ghê!",
  ],
};

// ---------- Bị bắt chuyện nhiều lần liền ----------
const LAN_2 = [
  "Ủa, nói chuyện hồi nãy rồi mà, còn gì nữa hông?",
  "Lại là bạn hả? Có chuyện gì thì nói lẹ đi.",
  "Ơ, quay lại chi nữa dzậy? Quên đồ hả?",
  "Hỏi gì nữa đó? Tui nói hết rồi mà.",
  "Bạn thích tui hả? Sao cứ lại kiếm chuyện hoài dzậy?",
];
const LAN_3 = [
  "Trời đất ơi, ba lần rồi đó nha! Rảnh quá hông có gì làm hả?",
  "Thôi đi bạn ơi, đừng có làm phiền tui nữa!",
  "Kêu hoài, tui méc má tui bây giờ!",
  "Bộ hết chuyện làm rồi hả? Đi chỗ khác chơi giùm cái!",
  "Ê, tui hổng phải tổng đài chăm sóc khách hàng đâu nha!",
];
const LAN_NHIEU = [
  "...(Người này giả bộ không nghe thấy.)",
  "Hông nói nữa! Hông nói nữa! Đi đi!",
  "Mắc mệt quá, tui đi chỗ khác cho rồi.",
  "(Thở dài thườn thượt, quay mặt đi chỗ khác.)",
];

// ---------- Người chơi đang chạy xe máy / suýt tông người ----------
const LAI_XE = [
  "Chạy xe từ từ thôi nha, ở đây con nít đông lắm.",
  "Xe đẹp ghê, mua trả góp hả?",
  "Đậu xe đâu đó đi rồi nói chuyện, đứng giữa đường kỳ lắm.",
];
const SUYT_TONG = [
  "Ê ê ê! Chạy kiểu gì dzậy? Suýt tông tui rồi!",
  "Trời đất ơi! Leo lên lề chi dzậy cha nội!",
  "Bộ mù hả? Lề đường để đi bộ chứ đâu phải để chạy xe!",
  "Má ơi hết hồn! Chạy chậm lại giùm cái!",
  "Đi đứng kiểu gì dzậy? Tui méc công an bây giờ!",
  "Coi chừng! Bánh xe cán dép tui rồi kìa!",
  "Mắc dịch, chạy ẩu quá trời, đền tui cái tim nè!",
  "Ê! Xe máy mà chạy lên vỉa hè hả? Hết chỗ chạy rồi sao?",
];

// tâm trạng của từng nhóm (cử chỉ, âm thanh)
const NHOM = [
  [VUI, "vui"], [BUON, "buon"], [BUC, "buc"], [NGAI, "ngai"], [TAM, "tam"], [HOI, "hoi"],
  [DUONG_SA, "tam"], [GHEO, "vui"], [TRIET_LY, "triet_ly"],
];
const TRONG_SO = [16, 10, 10, 10, 12, 10, 12, 6, 10];
const TAM_TRANG_KIEU = { sieu_anh_hung: "vui", quy_do: "vui", long_chim: "vui", khung_long: "vui", the_duc: "vui", shipper: "buc", ngo_khong: "vui", noel: "vui",
  cam_bang: "vui", bong_bay: "vui", chay: "vui", cho: "vui", hs: "vui", quet: "triet_ly", xe_om: "moi", xe_om_cn: "tam", tra_da: "moi", ca_phe: "tam", hem: "vui",
  cho_buyt: "buc", tuong_bac: "tuong", goi: "ngai", chup: "vui", tam: "tam" };

const chon = a => a[Math.floor(Math.random() * a.length)];
const ganDay = []; // vài câu vừa nói (đỡ lặp lại liền)
function chonMoi(ds) {
  for (let i = 0; i < 6; i++) { const c = chon(ds); if (!ganDay.includes(c)) return c; }
  return chon(ds);
}

// kieu: loại người (THEO_KIEU), ctx: { gio, mua, vai, lan (lần bắt chuyện liền với người này), laiXe, mon }
// trả về { chu, tamTrang } — tamTrang: vui | buon | buc | ngai | tam | hoi | moi | triet_ly | tuong
export function cauNguoiPho(kieu, { gio = 12, mua = false, vai = "", lan = 1, laiXe = false, mon = "" } = {}) {
  let ds = null, tt = "vui";
  const r = Math.random();
  if (kieu === "tuong_bac") { ds = THEO_KIEU.tuong_bac; tt = "tuong"; }
  else if (lan >= 5) { ds = LAN_NHIEU; tt = "ngai"; }
  else if (lan >= 3) { ds = LAN_3; tt = "buc"; }
  else if (lan === 2) { ds = LAN_2; tt = "buc"; }
  else if (kieu === "ban_hang") {
    if (r < 0.7) { ds = MOI_MUA; tt = "moi"; }
  } else if (THEO_VAI[vai] && r < (vai === "sieu_nhan_hong" ? 0.4 : 0.25)) { ds = THEO_VAI[vai]; tt = "vui"; }
  else if (laiXe && r < 0.2) { ds = LAI_XE; tt = "tam"; }
  else if (THEO_KIEU[kieu]?.length && r < 0.55) { ds = THEO_KIEU[kieu]; tt = TAM_TRANG_KIEU[kieu] || "vui"; }
  if (!ds) {
    const r2 = Math.random();
    if (mua && r2 < 0.3) { ds = MUA; tt = "buon"; }
    else if (r2 < 0.45) {
      ds = gio < 5 || gio >= 22 ? KHUYA : gio < 10.5 ? SANG : gio < 13.5 ? TRUA : gio < 17.5 ? CHIEU : TOI;
      tt = gio < 5 || gio >= 22 ? "ngai" : "tam";
    } else {
      let w = Math.random() * TRONG_SO.reduce((a, b) => a + b, 0), i = 0;
      while ((w -= TRONG_SO[i]) > 0 && i < NHOM.length - 1) i++;
      [ds, tt] = NHOM[i];
    }
  }
  let chu = chonMoi(ds);
  ganDay.push(chu); if (ganDay.length > 40) ganDay.shift();
  if (chu.includes("{mon}")) chu = chu.replaceAll("{mon}", (mon || "đồ ăn").toLowerCase());
  return { chu, tamTrang: tt };
}
// câu cằn nhằn khi bị xe người chơi suýt tông trên vỉa hè
export function cauSuytTong() { return chonMoi(SUYT_TONG); }

// số câu theo từng nhóm (để báo cáo, kiểm thử)
export function demLoi() {
  const kieu = Object.values(THEO_KIEU).reduce((a, d) => a + d.length, 0), vai = Object.values(THEO_VAI).reduce((a, d) => a + d.length, 0);
  const r = { vui: VUI.length, buon: BUON.length, buc: BUC.length, ngai: NGAI.length, tam: TAM.length, hoi: HOI.length, duong_sa: DUONG_SA.length, moi_mua: MOI_MUA.length,
    gheo: GHEO.length, triet_ly: TRIET_LY.length, theo_kieu: kieu, theo_gio: SANG.length + TRUA.length + CHIEU.length + TOI.length + KHUYA.length, mua: MUA.length,
    theo_vai: vai, lap_lai: LAN_2.length + LAN_3.length + LAN_NHIEU.length, lai_xe: LAI_XE.length, suyt_tong: SUYT_TONG.length };
  r.tong = Object.values(r).reduce((a, b) => a + b, 0);
  return r;
}
