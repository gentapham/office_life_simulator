// Điện thoại trong game: tin nhắn Zola, thống kê Tóp-tóp của Siêu Nhân Hồng, Phây-búc, bản đồ Quận Hóng,
// gọi xe ôm, bộ sưu tập kết thúc và thành tựu. Bộ sưu tập, thành tựu lưu chung cho mọi lượt chơi.
import { am } from "./am-thanh-game.js";

// ---------- Bộ sưu tập & thành tựu (lưu trên trình duyệt) ----------
const KHOA_BST = "owfad_bo_suu_tap_v1";
const docBST = () => { try { return { ketThuc: {}, thanhTuu: {}, dem: {}, ...JSON.parse(localStorage.getItem(KHOA_BST) || "{}") }; } catch { return { ketThuc: {}, thanhTuu: {}, dem: {} }; } };
const ghiBST = b => { try { localStorage.setItem(KHOA_BST, JSON.stringify(b)); } catch {} };

export const THANH_TUU = [
  { id: "vuot_meo", ten: "Sen chính hiệu", mo: "Vuốt mèo 20 lần", dem: "meo", can: 20 },
  { id: "bo_cau", ten: "Bạn của bồ câu", mo: "Cho bồ câu ăn 10 lần", dem: "chim", can: 10 },
  { id: "ca_phe", ten: "Sống bằng cà phê", mo: "Uống 30 ly cà phê", dem: "ca_phe", can: 30 },
  { id: "wc", ten: "Thánh trốn việc", mo: "Đi vệ sinh 30 lần", dem: "wc", can: 30 },
  { id: "an_pho", ten: "Thổ địa Quận Hóng", mo: "Ăn uống đủ 5 món ngoài phố: bánh mì, hủ tiếu, nước mía, chè, trà đá", dem: "mon_pho", can: 5 },
  { id: "mg_thang", ten: "Vua minigame", mo: "Thắng 20 minigame", dem: "mg_thang", can: 20 },
  { id: "mg_xuat_sac", ten: "Không tì vết", mo: "Thắng xuất sắc 5 minigame", dem: "mg_xuat_sac", can: 5 },
  { id: "su_kien", ten: "Hóng biến", mo: "Gặp 15 chuyện bất ngờ trong công ty", dem: "su_kien", can: 15 },
  { id: "tin_nhan", ten: "Online 24/7", mo: "Đọc 10 tin nhắn Zola", dem: "tin_nhan", can: 10 },
  { id: "xe_om", ten: "Khách quen xe ôm", mo: "Đi xe ôm 5 lần", dem: "xe_om", can: 5 },
  { id: "xiu", ten: "Deadline không đáng", mo: "Xỉu vì bỏ bê bản thân", dem: "xiu", can: 1 },
  { id: "tai_nan", ten: "Nhìn trước nhìn sau", mo: "Bị ô tô tông khi băng qua đường", dem: "tai_nan", can: 1 },
  { id: "het_thang", ten: "Sống sót tháng 10", mo: "Chơi hết 31 ngày với một vai", dem: "het_thang", can: 1 },
  { id: "mot_trieu", ten: "Một triệu", mo: "Siêu Nhân Hồng đạt 1.000.000 người theo dõi", dem: "mot_trieu", can: 1 },
  { id: "bi_mat", ten: "Người giữ bí mật", mo: "Mở một kết thúc bí mật", dem: "bi_mat", can: 1 },
  { id: "da_vu_tru", ten: "Đa vũ trụ", mo: "Mở đủ 6 kết thúc của một vai", dem: "du_6", can: 1 },
  { id: "nam_vai", ten: "Đa nhân cách", mo: "Đi hết tháng 10 với 5 vai khác nhau", dem: "so_vai_xong", can: 5 },
];

// tăng bộ đếm; trả về các thành tựu vừa mở
export function ghiNhan(dem, n = 1, { dat = false } = {}) {
  const b = docBST();
  b.dem[dem] = dat ? Math.max(b.dem[dem] || 0, n) : (b.dem[dem] || 0) + n;
  const moi = [];
  for (const t of THANH_TUU) if (!b.thanhTuu[t.id] && (b.dem[t.dem] || 0) >= t.can) { b.thanhTuu[t.id] = Date.now(); moi.push(t); }
  ghiBST(b);
  return moi;
}
// món ăn ngoài phố đã thử (đếm số món khác nhau)
export function ghiMonPho(loai) {
  const b = docBST(); const ds = new Set(b.dem.ds_mon_pho || []); ds.add(loai); b.dem.ds_mon_pho = [...ds]; ghiBST(b);
  return ghiNhan("mon_pho", ds.size, { dat: true });
}
// ghi một kết thúc đã mở của vai
export function ghiKetThuc(ma, id, META) {
  if (!id) return [];
  id = String(id).replace(/^ket_thuc_/, "");
  const b = docBST(); const ds = new Set(b.ketThuc[ma] || []); ds.add(id); b.ketThuc[ma] = [...ds];
  const xong = new Set(b.dem.ds_vai_xong || []); xong.add(ma); b.dem.ds_vai_xong = [...xong];
  ghiBST(b);
  const moi = [...ghiNhan("het_thang", 1, { dat: true }), ...ghiNhan("so_vai_xong", xong.size, { dat: true })];
  const kt = (META.roles[ma]?.knots || []).find(k => k.name === `${ma}_kt_${id}`);
  if (kt?.tags.includes("bi_mat")) moi.push(...ghiNhan("bi_mat", 1, { dat: true }));
  if (ds.size >= 6) moi.push(...ghiNhan("du_6", 1, { dat: true }));
  return moi;
}
// danh sách 6 kết thúc của mỗi vai, lấy từ các cảnh <vai>_kt_<mã>
function ketThucCuaVai(ma, META) {
  return (META.roles[ma]?.knots || []).filter(k => k.name.startsWith(ma + "_kt_")).map(k => {
    const id = k.name.slice(ma.length + 4), loai = (k.tags.find(t => t.startsWith("loai:")) || "").slice(5);
    return { id, ten: META.tenKetThuc?.[id] || id.replace(/_/g, " "), loai, biMat: k.tags.includes("bi_mat") };
  });
}

// Bảng bộ sưu tập (dùng ở màn hình chính và trong điện thoại)
export function veBoSuuTap(h, { META, NHAN_VAT, tenVai = n => n.vai }) {
  const b = docBST();
  const tong = NHAN_VAT.reduce((s, n) => s + ketThucCuaVai(n.ma, META).length, 0);
  const daMo = NHAN_VAT.reduce((s, n) => s + (b.ketThuc[n.ma] || []).length, 0);
  const LOAI = { co_hau: "Có hậu", buon: "Buồn" };
  return h("div", { class: "bst" },
    h("section", {}, h("h3", {}, `Kết thúc đã mở: ${daMo}/${tong}`),
      h("div", { class: "bst-vai" }, NHAN_VAT.map(n => {
        const ds = ketThucCuaVai(n.ma, META), mo = new Set(b.ketThuc[n.ma] || []);
        return h("div", { class: "bst-the", style: `--mau:${n.mau}` },
          h("div", { class: "bst-dau" }, h("b", {}, tenVai(n)), h("small", {}, `${ds.filter(k => mo.has(k.id)).length}/${ds.length}`)),
          h("ul", {}, ds.map(k => mo.has(k.id)
            ? h("li", { class: "mo " + k.loai }, h("span", {}, k.ten), h("em", {}, (k.biMat ? "Bí mật · " : "") + (LOAI[k.loai] || "")))
            : h("li", { class: "khoa" }, h("span", {}, k.biMat ? "Kết thúc bí mật" : "Chưa mở"), h("em", {}, LOAI[k.loai] || "")))));
      }))),
    h("section", {}, h("h3", {}, `Thành tựu: ${Object.keys(b.thanhTuu).length}/${THANH_TUU.length}`),
      h("ul", { class: "bst-tt" }, THANH_TUU.map(t => {
        const co = !!b.thanhTuu[t.id], gt = Math.min(t.can, b.dem[t.dem] || 0);
        return h("li", { class: co ? "mo" : "" }, h("div", {}, h("b", {}, t.ten), h("small", {}, t.mo)),
          h("span", { class: "bst-tien" }, co ? "Đã đạt" : `${gt}/${t.can}`));
      }))));
}

// ---------- Nội dung mạng xã hội giả ----------
const BAI_PB = [
  ma => [ma, "Ai lấy cái sạc điện thoại để trên bàn tui thì trả giùm nha. Không truy cứu. Chỉ nhớ mặt."],
  ma => [ma, "Hôm nay deadline dí tới mức tui quên mình là ai. Ai biết thì nhắn giùm."],
  ma => [ma, "Check-in pantry công ty. Mì ly vẫn ngon như ngày đầu đi làm."],
  ma => [ma, "Sếp nói \"làm nhanh gọn thôi em\". Ba tiếng sau vẫn đang họp."],
  ma => [ma, "Mưa Quận Hóng là kiểu mưa không báo trước, giống feedback của khách hàng."],
  ma => [ma, "Ly trà đá năm nghìn của chú đầu hẻm là thứ duy nhất không tăng giá năm nay."],
  ma => [ma, "Ai biết chỗ sửa xe uy tín gần công ty chỉ giùm. Xe tui kêu như máy in tầng 1."],
  ma => [ma, "Thương hiệu cá nhân là gì mà ai cũng nói vậy mọi người."],
  ma => [ma, "Thứ Hai đầu tuần, tâm trạng như con cá trong bể sảnh: bơi một vòng rồi quên luôn."],
  ma => [ma, "Mua bánh mì Bựa ăn thử. Bựa thật."],
  ma => [ma, "Hôm nay được bác bảo vệ rót cho ly trà. Thấy đời còn thương mình."],
  ma => [ma, "Đi làm muộn 2 phút, máy chấm công ghi nhận như tội ác thế kỷ."],
];
const BAI_HONG = [
  "Đếm ngược tới Đại Nhạc Hội Siêu Nhân. Hồng không biết sợ, chỉ biết tạo dáng.",
  "Cảm ơn mọi người đã theo dõi Siêu Nhân Hồng. Mục tiêu 1 triệu, mình làm được không?",
  "Hậu trường buổi quay hôm nay: bộ đồ hồng hơi chật, nhưng tinh thần thì rộng mênh mông.",
  "Nếu một ngày bạn thấy mệt, hãy nhớ: có một siêu nhân màu hồng đang cố gắng cùng bạn.",
];
const NHOM_CHAT = [
  ["giam_doc", "Cả nhà nhớ hôm nay nộp báo cáo trước 5 giờ chiều nhé. Không có ngoại lệ."],
  ["hr", "Nhắc nhẹ: tuần này ai chưa nộp giấy khám sức khỏe thì nộp giùm em nha."],
  ["hong_hot", "Có ai biết vụ trên tầng 2 sáng nay không, kể nghe với."],
  ["ke_toan", "Lương về trễ 2 ngày, mọi người thông cảm. Không hỏi nữa nha."],
  ["it", "Wifi chậm là do mọi người xem Tóp-tóp, không phải do em."],
  ["chua_te_deadline", "Ai còn file chưa gửi thì gửi ngay. Không có ngày mai."],
  ["thuc_tap_sinh", "Dạ em gửi file rồi ạ. Em gửi lại lần nữa cho chắc ạ."],
  ["bac_bao_ve", "Các cháu để xe gọn vào, đừng để chắn lối ra vào nhé."],
  ["sieu_nhan_hong", "Cảm ơn cả nhà đã ủng hộ Hồng. Hôm nay Hồng tập thêm một tiếng."],
  ["sales", "Hợp đồng mới chốt rồi nha cả nhà. Tối nay ai rảnh đi ăn mừng."],
  ["thanh_xin_nghi", "Mai em xin nghỉ nửa buổi, bà ngoại em có việc ạ."],
  ["truong_phong", "Họp nhanh 15 phút lúc 2 giờ chiều. Mang theo tinh thần."],
];
const chonTheoNgay = (ds, ngay, n, muoi = 0) => { const kq = []; for (let i = 0; i < n; i++) kq.push(ds[(ngay * 7 + i * 5 + muoi) % ds.length]); return kq; };

// ---------- Bản đồ Quận Hóng (vẽ 2D từ tọa độ thật trong game) ----------
function veBanDo(cv, { g, diem = [], mucTieu, viec, oNgoai }) {
  const c = cv.getContext("2d"), W = cv.width, H = cv.height;
  // khung nhìn quanh người chơi (rộng 160 m) để chữ đủ to; ở ngoài khu phố thì xem toàn quận
  const tamX = !oNgoai && g ? Math.max(-70, Math.min(70, g.p.x)) : 0, tamZ = !oNgoai && g ? Math.max(-20, Math.min(50, g.p.z)) : 15;
  const nua = oNgoai || !g ? 150 : 55;
  const X0 = tamX - nua, X1 = tamX + nua, Z0 = tamZ - nua, Z1 = tamZ + nua, k = Math.min(W / (X1 - X0), H / (Z1 - Z0));
  const px = x => (x - X0) * k + (W - (X1 - X0) * k) / 2, pz = z => (z - Z0) * k + (H - (Z1 - Z0) * k) / 2;
  c.fillStyle = "#e9e3d6"; c.fillRect(0, 0, W, H);
  // khối nhà hai bên đường
  c.fillStyle = "#d6cdbb";
  for (let x = X0; x < X1; x += 9) { c.fillRect(px(x), pz(20), 7.5 * k, 11.5 * k); c.fillRect(px(x), pz(44), 7.5 * k, 12 * k); }
  // đường chính và đại lộ
  c.fillStyle = "#5b5e66"; c.fillRect(px(X0), pz(32.2), (X1 - X0) * k, 9.6 * k); c.fillRect(px(46.6), pz(Z0), 10.8 * k, (Z1 - Z0) * k);
  c.strokeStyle = "#f2efe6"; c.setLineDash([4, 4]); c.lineWidth = 1;
  c.beginPath(); c.moveTo(px(X0), pz(37)); c.lineTo(px(X1), pz(37)); c.moveTo(px(52), pz(Z0)); c.lineTo(px(52), pz(Z1)); c.stroke(); c.setLineDash([]);
  // công ty, sân khấu
  c.fillStyle = "#e8702a"; c.fillRect(px(-20), pz(-14), 40 * k, 28 * k);
  c.fillStyle = "#f3c79f"; c.fillRect(px(-20), pz(14), 40 * k, 15 * k);
  c.fillStyle = "#f26fa6"; c.fillRect(px(90.5), pz(-22), 39 * k, 52 * k);
  c.font = `800 ${Math.round(W / 18)}px sans-serif`; c.textAlign = "center"; c.fillStyle = "#fff";
  c.fillText("G-ENT", px(0), pz(0)); c.fillText("SÂN KHẤU", px(110), pz(4));
  // điểm đến
  c.font = `600 ${Math.round(W / 22)}px sans-serif`;
  for (const d of diem) { c.fillStyle = d.mau || "#2b6cb0"; c.beginPath(); c.arc(px(d.x), pz(d.z), 9, 0, 6.3); c.fill(); c.fillStyle = "#2a2622"; c.fillText(d.ten, px(d.x), pz(d.z) - 16); }
  // việc vặt: chỗ mua hoặc người nhờ
  if (viec && viec.tang !== 2) {
    // ngoài khung bản đồ thì ghim ở mép, chỉ đúng hướng
    const x = Math.max(18, Math.min(W - 18, px(viec.x))), z = Math.max(34, Math.min(H - 18, pz(viec.z)));
    c.fillStyle = "#3fa66b"; c.strokeStyle = "#fff"; c.lineWidth = 3;
    c.beginPath(); c.moveTo(x, z - 13); c.lineTo(x + 13, z); c.lineTo(x, z + 13); c.lineTo(x - 13, z); c.closePath(); c.fill(); c.stroke();
    c.fillStyle = "#1f5f3a"; c.fillText("Việc vặt", x, z - 20);
  }
  // mục tiêu
  if (mucTieu) { c.strokeStyle = "#e8702a"; c.lineWidth = 4; c.beginPath(); c.arc(px(mucTieu.x), pz(mucTieu.z), 12, 0, 6.3); c.stroke(); }
  // người chơi (mũi tên theo hướng nhìn)
  if (!oNgoai && g) {
    const x = px(g.p.x), z = pz(g.p.z), a = g.yaw;
    c.save(); c.translate(x, z); c.rotate(-a + Math.PI); c.fillStyle = "#e8702a"; c.strokeStyle = "#fff"; c.lineWidth = 2;
    c.beginPath(); c.moveTo(0, -24); c.lineTo(16, 18); c.lineTo(0, 8); c.lineTo(-16, 18); c.closePath(); c.stroke(); c.fill(); c.restore();
  }
}

// ---------- Biểu tượng ứng dụng (SVG vẽ tay, tên nhại theo ứng dụng ngoài đời) ----------
let soNen = 0; // mỗi biểu tượng một mã chuyển màu riêng (trùng mã thì mọi biểu tượng lấy chung một màu)
const nen = (a, b = a) => { const id = "dtg" + soNen++; return `<defs><linearGradient id="${id}" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="${a}"/><stop offset="1" stop-color="${b}"/></linearGradient></defs><rect width="60" height="60" rx="14" fill="url(#${id})"/>`; };
const svg = noiDung => `<svg viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg">${noiDung}</svg>`;
const ICON = {
  zola: svg(nen("#3a8bff", "#0a62e8") + `<path d="M14 20c0-4 3-7 7-7h18c4 0 7 3 7 7v13c0 4-3 7-7 7H27l-8 6v-6h-0c-3 0-5-3-5-6z" fill="#fff"/><text x="30" y="32" text-anchor="middle" font-family="Arial" font-weight="900" font-size="11" fill="#0a62e8">Zola</text>`),
  toptop: svg(nen("#111", "#000") + `<g font-family="Arial" font-weight="900" font-size="34" text-anchor="middle"><text x="28" y="43" fill="#25f4ee">♪</text><text x="32" y="45" fill="#fe2c55">♪</text><text x="30" y="44" fill="#fff">♪</text></g>`),
  phayBuc: svg(nen("#2d6cdf", "#1b4fb5") + `<text x="31" y="50" text-anchor="middle" font-family="Arial" font-weight="900" font-size="44" fill="#fff">p</text>`),
  diuTup: svg(nen("#fff", "#f1f1f1") + `<rect x="9" y="17" width="42" height="27" rx="8" fill="#f2161c"/><path d="M26 23l12 7.5-12 7.5z" fill="#fff"/>`),
  sopPi: svg(nen("#ff6a3a", "#ee4d2d") + `<path d="M17 24h26l-2 22H19z" fill="#fff"/><path d="M24 24c0-6 2.5-9 6-9s6 3 6 9" fill="none" stroke="#fff" stroke-width="3"/><text x="30" y="42" text-anchor="middle" font-family="Arial" font-weight="900" font-size="13" fill="#ee4d2d">S</text>`),
  moMo: svg(nen("#c2257a", "#a50064") + `<rect x="13" y="16" width="34" height="28" rx="7" fill="none" stroke="#fff" stroke-width="3"/><text x="30" y="35" text-anchor="middle" font-family="Arial" font-weight="900" font-size="12" fill="#fff">mô</text>`),
  xeOm: svg(nen("#1fbf5a", "#00a046") + `<circle cx="19" cy="40" r="6" fill="none" stroke="#fff" stroke-width="3"/><circle cx="42" cy="40" r="6" fill="none" stroke="#fff" stroke-width="3"/><path d="M19 40l8-12h10l5 12M27 28l-3-6h-5M35 28l4-7h5" fill="none" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>`),
  banDo: svg(nen("#fff", "#eef3f0") + `<path d="M8 40l14-20 12 14 18-18v36H8z" fill="#cde8d4"/><path d="M8 52L52 14" stroke="#ffc928" stroke-width="5"/><path d="M30 8c-7 0-12 5-12 12 0 9 12 22 12 22s12-13 12-22c0-7-5-12-12-12z" fill="#ea4335"/><circle cx="30" cy="20" r="4.5" fill="#fff"/>`),
  camera: svg(nen("#9aa0a6", "#6b7076") + `<rect x="10" y="20" width="40" height="27" rx="5" fill="#1e1f22"/><rect x="22" y="15" width="16" height="7" rx="2" fill="#1e1f22"/><circle cx="30" cy="33" r="9" fill="#3a3d43" stroke="#cfd3d7" stroke-width="2.5"/><circle cx="30" cy="33" r="4" fill="#6d8fd6"/>`),
  anh: svg(nen("#fff", "#f4f4f4") + `<g transform="translate(30 30)">${["#ea4335", "#fbbc05", "#34a853", "#4285f4"].map((m, i) => `<path d="M0 0V-17a8.5 8.5 0 0 1 0 17z" fill="${m}" transform="rotate(${i * 90})"/>`).join("")}</g>`),
  dongHo: svg(nen("#1c1c1e", "#000") + `<circle cx="30" cy="30" r="20" fill="#fff"/><path d="M30 30V16M30 30l9 6" stroke="#111" stroke-width="3" stroke-linecap="round"/><circle cx="30" cy="30" r="2.5" fill="#ff9500"/>`),
  lich: n => svg(nen("#fff", "#f6f6f6") + `<text x="30" y="20" text-anchor="middle" font-family="Arial" font-weight="700" font-size="10" fill="#ff3b30">TH 10</text><text x="30" y="47" text-anchor="middle" font-family="Arial" font-weight="300" font-size="28" fill="#111">${n}</text>`),
  thoiTiet: svg(nen("#4aa3ff", "#1f6fd1") + `<circle cx="24" cy="24" r="9" fill="#ffd43b"/><path d="M20 44h22a8 8 0 0 0 0-16 11 11 0 0 0-21 3 6.5 6.5 0 0 0-1 13z" fill="#fff"/>`),
  ghiChu: svg(nen("#fff", "#f5f5f5") + `<rect x="0" y="0" width="60" height="16" rx="14" fill="#ffd60a"/><rect x="0" y="8" width="60" height="8" fill="#ffd60a"/><path d="M12 26h36M12 34h36M12 42h24" stroke="#c7c7cc" stroke-width="2.5"/>`),
  danhBa: svg(nen("#a8a8ad", "#8e8e93") + `<circle cx="30" cy="24" r="9" fill="#fff"/><path d="M14 48c2-9 9-13 16-13s14 4 16 13z" fill="#fff"/>`),
  dienThoai: svg(nen("#5fe16d", "#2cc23e") + `<path d="M21 14c2-1 4 0 5 2l3 6c1 2 0 4-1 5l-3 2c2 5 6 9 11 11l2-3c1-1 3-2 5-1l6 3c2 1 3 3 2 5l-2 4c-1 2-3 3-5 3-15-1-27-13-28-28 0-2 1-4 3-5z" fill="#fff"/>`),
  tinNhan: svg(nen("#5fe16d", "#2cc23e") + `<ellipse cx="30" cy="28" rx="18" ry="14" fill="#fff"/><path d="M17 36l-3 10 10-6z" fill="#fff"/>`),
  caiDat: svg(nen("#8e8e93", "#636366") + `<g transform="translate(30 30)" fill="#d1d1d6">${Array.from({ length: 8 }, (_, i) => `<rect x="-3.5" y="-20" width="7" height="9" rx="2" transform="rotate(${i * 45})"/>`).join("")}<circle r="13"/></g><circle cx="30" cy="30" r="6" fill="#636366"/>`),
  thanhTuu: svg(nen("#ffb020", "#f08c00") + `<path d="M20 14h20v10c0 7-4 12-10 12s-10-5-10-12z" fill="#fff"/><path d="M20 18h-6c0 6 3 9 7 9M40 18h6c0 6-3 9-7 9" fill="none" stroke="#fff" stroke-width="3"/><rect x="27" y="36" width="6" height="6" fill="#fff"/><rect x="20" y="42" width="20" height="5" rx="2" fill="#fff"/>`),
  mayTinh: svg(nen("#333", "#1c1c1e") + Array.from({ length: 9 }, (_, i) => `<circle cx="${18 + (i % 3) * 12}" cy="${18 + Math.floor(i / 3) * 12}" r="4.5" fill="${i % 3 === 2 ? "#ff9f0a" : "#a5a5a5"}"/>`).join("")),
};

// ---------- Điện thoại ----------
// dep: { h, L, g, META, NHAN_VAT, THEO_MA, tenCua, MUC_TIEU, so, vnd, ngayDayDu, thuCuaNgay, SU_KIEN_NGAY, tinCho(), moTin(), diemXeOm(), diXeOm(diem),
//        viecVat(), moCaiDat(), dangThoai(), khung(), thoiTiet(ngay) -> [{buoi, ten, nhiet}], thongBao(chu), muaHang(ten, gia) -> bool, ghiChu() -> [chu] }
export function taoDienThoai(dep) {
  const { h, L } = dep;
  let lop = null, ungDung = "chinh", hen = null, anh = [];
  const gioNay = () => String(L.v("gio") ?? 8).padStart(2, "0") + ":" + String(L.v("phut") ?? 0).padStart(2, "0");
  // pin điện thoại: sáng sạc đầy, dùng cả ngày tụt dần
  const pin = () => Math.max(5, Math.round(100 - Math.max(0, (L.phutGame ?? 480) - 480) / 11));
  const dong = () => {
    if (!lop) return; clearInterval(hen); lop.remove(); lop = null;
    removeEventListener("keydown", phim, true);
    if (!dep.dangThoai()) dep.g.datKhoa(false);
  };
  const phim = e => {
    if (e.code === "Escape" || e.code === "KeyP" || (e.code === "KeyM" && ungDung === "ban_do")) {
      e.preventDefault(); e.stopPropagation();
      if (ungDung !== "chinh" && e.code === "Escape") mo("chinh"); else dong(); return;
    }
    e.stopPropagation();
  };
  const thanhTrangThai = () => {
    const p = pin();
    return h("div", { class: "dt-tt" }, h("b", {}, gioNay()), h("span", { class: "dt-tt-phai", html:
      `<svg viewBox="0 0 18 12" width="17"><rect x="0" y="8" width="3" height="4" rx="1"/><rect x="5" y="5.5" width="3" height="6.5" rx="1"/><rect x="10" y="3" width="3" height="9" rx="1"/><rect x="15" y="0" width="3" height="12" rx="1" opacity=".4"/></svg>
       <small>4G</small>
       <svg viewBox="0 0 16 12" width="15"><path d="M8 11l2.2-2.6a3.2 3.2 0 0 0-4.4 0zM3.4 6.2a6.8 6.8 0 0 1 9.2 0l1.5-1.7a9.2 9.2 0 0 0-12.2 0zM.4 2.8a11.4 11.4 0 0 1 15.2 0L16 2.3" fill="currentColor"/></svg>
       <span class="dt-pin${p <= 20 ? " yeu" : ""}"><i style="width:${p}%"></i></span><small>${p}%</small>` }));
  };
  const dau = (tieuDe, mau) => h("header", { class: "dt-dau", style: mau ? `--mau:${mau}` : "" },
    h("button", { class: "dt-lui", onclick: () => mo("chinh"), "aria-label": "Quay lại" }, "‹"),
    h("b", {}, tieuDe), h("span", {}));
  const bieuTuong = (id, so) => h("i", { class: "dt-icon", html: typeof ICON[id] === "function" ? ICON[id](so) : ICON[id] });

  // danh sách ứng dụng trên màn hình chính và thanh dưới
  const APP = [
    { id: "zola", ten: "Zola", icon: "zola" }, { id: "toptop", ten: "Tóp-tóp", icon: "toptop" }, { id: "phaybuc", ten: "Phây-búc", icon: "phayBuc" }, { id: "diutup", ten: "Diu-túp", icon: "diuTup" },
    { id: "xeom", ten: "Xe Ôm Hóng", icon: "xeOm" }, { id: "bando", ten: "Bản đồ", icon: "banDo" }, { id: "momo", ten: "MôMô", icon: "moMo" }, { id: "soppi", ten: "Sốp-pi", icon: "sopPi" },
    { id: "lich", ten: "Lịch", icon: "lich" }, { id: "thoitiet", ten: "Thời tiết", icon: "thoiTiet" }, { id: "ghichu", ten: "Ghi chú", icon: "ghiChu" }, { id: "anh", ten: "Ảnh", icon: "anh" },
    { id: "thanhtuu", ten: "Thành tựu", icon: "thanhTuu" }, { id: "dongho", ten: "Đồng hồ", icon: "dongHo" }, { id: "maytinh", ten: "Máy tính", icon: "mayTinh" }, { id: "caidat", ten: "Cài đặt", icon: "caiDat" },
  ];
  const DOCK = [{ id: "danhba", ten: "Điện thoại", icon: "dienThoai" }, { id: "sms", ten: "Tin nhắn", icon: "tinNhan" }, { id: "camera", ten: "Camera", icon: "camera" }, { id: "zola2", ten: "Zola", icon: "zola" }];
  const soBao = id => id === "zola" || id === "zola2" ? (dep.tinCho() ? 1 : 0) + (L.ngay % 3 === 0 ? 2 : 1) : id === "phaybuc" ? (L.ngay * 3) % 7 + 1 : id === "sms" && L.ngay === 12 ? 1 : 0;
  const nutApp = a => h("button", { class: "dt-app", onclick: () => a.id === "caidat" ? (dong(), dep.moCaiDat()) : mo(a.id.replace(/2$/, "")) },
    bieuTuong(a.icon, L.ngay), soBao(a.id) ? h("em", {}, String(soBao(a.id))) : null, h("span", {}, a.ten));

  const veChinh = () => {
    const tt = dep.thoiTiet(L.ngay)[L.phutGame < 12 * 60 ? 0 : L.phutGame < 18 * 60 ? 1 : 2];
    const td = Number(L.v("nguoi_theo_doi")) || 0;
    return [h("div", { class: "dt-widget" },
        h("div", { class: "dt-w-gio" }, h("b", {}, gioNay()), h("small", {}, dep.ngayDayDu(L.ngay))),
        h("div", { class: "dt-w-phai" },
          h("div", { class: "dt-w-tt" }, h("small", {}, "Quận Hóng"), h("b", {}, `${tt.nhiet}°`), h("span", {}, tt.ten)),
          h("div", { class: "dt-w-td" }, h("small", {}, "Siêu Nhân Hồng"), h("b", {}, dep.so(td)), h("i", {}, h("u", { style: `width:${Math.min(100, td / dep.MUC_TIEU * 100)}%` }))))),
      h("div", { class: "dt-luoi" }, APP.map(nutApp)),
      h("div", { class: "dt-cham" }, h("i", { class: "on" }), h("i", {})),
      h("div", { class: "dt-dock" }, DOCK.map(nutApp))];
  };

  // ----- từng ứng dụng -----
  const UNG = {
    zola() {
      const cho = dep.tinCho();
      const nhom = chonTheoNgay(NHOM_CHAT, L.ngay, 5).filter(([ma]) => ma !== L.ma);
      return [dau("Zola", "#0a62e8"), h("div", { class: "dt-than" },
        cho ? h("button", { class: "dt-hang moi", onclick: () => { dong(); dep.moTin(); } }, h("span", { class: "dt-av" }, "!"), h("div", {}, h("b", {}, cho), h("small", {}, "Bấm để đọc"))) : null,
        h("div", { class: "dt-hang" }, h("span", { class: "dt-av cam" }, "G"), h("div", {}, h("b", {}, "G-Ent Anh Em Một Nhà"), h("small", {}, `${nhom.length} tin mới hôm nay`))),
        h("div", { class: "dt-chat" }, nhom.map(([ma, chu]) => h("div", { class: "dt-bong" }, h("b", {}, dep.tenCua(ma)), h("span", {}, chu)))),
        (L.tinDaDoc || []).slice().reverse().map(t => h("div", { class: "dt-hang" }, h("span", { class: "dt-av" }, t.ten.replace("Tin nhắn từ ", "").slice(0, 1)), h("div", {}, h("b", {}, t.ten.replace("Tin nhắn từ ", "")), h("small", {}, `Ngày ${t.ngay}/10 · Đã xem`)))))];
    },
    toptop() {
      const ls = L.lichSuTheoDoi || {}, ds = Array.from({ length: L.ngay }, (_, i) => ls[i + 1] ?? null);
      const hienTai = Number(L.v("nguoi_theo_doi")) || 0; ds[L.ngay - 1] = hienTai;
      const W = 300, H = 140, max = Math.max(dep.MUC_TIEU, ...ds.filter(Boolean));
      const diem = ds.map((v, i) => v == null ? null : [8 + (i / 30) * (W - 16), H - 6 - (v / max) * (H - 12)]).filter(Boolean);
      const bieu = `<svg viewBox="0 0 ${W} ${H}" preserveAspectRatio="none" class="dt-bieu"><line x1="0" x2="${W}" y1="${H - 6 - dep.MUC_TIEU / max * (H - 12)}" y2="${H - 6 - dep.MUC_TIEU / max * (H - 12)}" stroke="#fe2c55" stroke-dasharray="4 4"/><polyline fill="none" stroke="#25f4ee" stroke-width="2.5" points="${diem.map(p => p.join(",")).join(" ")}"/>${diem.map(([x, y]) => `<circle cx="${x}" cy="${y}" r="3.5" fill="#25f4ee"/>`).join("")}</svg>`;
      return [dau("Tóp-tóp", "#000"), h("div", { class: "dt-than toi" },
        h("div", { class: "dt-hoso" }, h("span", { class: "dt-av hong" }, "H"), h("b", {}, "@sieunhanhong"), h("small", {}, "Siêu Nhân Hồng · Hồng không phải màu, Hồng là thái độ"),
          h("div", { class: "dt-3so" }, h("div", {}, h("b", {}, dep.so(hienTai)), h("small", {}, "Follower")), h("div", {}, h("b", {}, dep.so(Math.round(hienTai * 6.3))), h("small", {}, "Lượt thích")), h("div", {}, h("b", {}, String(12 + L.ngay * 2)), h("small", {}, "Video")))),
        h("div", { html: bieu }), h("div", { class: "dt-chu-thich" }, h("span", {}, "1/10"), h("span", {}, `Mục tiêu ${dep.so(dep.MUC_TIEU)}`), h("span", {}, "31/10")),
        h("div", { class: "dt-luoi-clip" }, Array.from({ length: 6 }, (_, i) => h("div", { class: "dt-clip", style: `--h:${(L.ngay * 37 + i * 61) % 360}` }, h("small", {}, `${dep.so(Math.round(hienTai * (0.4 + ((i * 7 + L.ngay) % 9) / 10)))} lượt xem`)))))];
    },
    phaybuc() {
      const ds = dep.NHAN_VAT.filter(n => n.ma !== L.ma && n.ma !== "cho");
      const bai = chonTheoNgay(BAI_PB, L.ngay, 5, 3).map((f, i) => f(ds[(L.ngay * 3 + i * 7) % ds.length].ma));
      const su = dep.SU_KIEN_NGAY[L.ngay];
      return [dau("Phây-búc", "#1b4fb5"), h("div", { class: "dt-than xam" },
        su ? h("div", { class: "dt-bai noi" }, h("div", { class: "dt-bai-dau" }, h("span", { class: "dt-av cam" }, "G"), h("b", {}, "G-Entertainment")), h("p", {}, `Hôm nay: ${su}.`)) : null,
        bai.map(([ma, chu], i) => h("div", { class: "dt-bai" }, h("div", { class: "dt-bai-dau" }, h("span", { class: "dt-av" }, dep.tenCua(ma).slice(0, 1)), h("div", {}, h("b", {}, dep.tenCua(ma)), h("small", {}, `${1 + i * 2} giờ trước`))),
          h("p", {}, chu), h("div", { class: "dt-bai-chan" }, h("span", {}, `${12 + (chu.length % 40)} lượt thích`), h("span", {}, `${chu.length % 9} bình luận`)))))];
    },
    diutup() {
      const td = Number(L.v("nguoi_theo_doi")) || 0;
      const TEN = ["Siêu Nhân Hồng tập võ ở sân thượng", "Hậu trường quay MV: 47 lần NG", "Một ngày làm Siêu Nhân ở Quận Hóng", "Thử ăn chè Bà Bảy, chấm điểm 10/10", "Phản ứng khi bị gọi là Siêu Nhân Đỏ", "Tập nhảy cho Đại Nhạc Hội (bản nháp)", "Hỏi nhân viên G-Ent: Hồng là gì?"];
      return [dau("Diu-túp", "#f2161c"), h("div", { class: "dt-than" },
        chonTheoNgay(TEN, L.ngay, 5).map((t, i) => h("div", { class: "dt-video" }, h("div", { class: "dt-thumb", style: `--h:${(i * 53 + L.ngay * 11) % 360}` }, h("i", {}), h("small", {}, `${3 + i}:${String(10 + i * 7).slice(0, 2)}`)),
          h("b", {}, t), h("small", {}, `G-Entertainment · ${dep.so(Math.round(td * (0.2 + i * 0.13)))} lượt xem · ${i + 1} ngày trước`))))];
    },
    xeom() {
      const tien = Number(L.v("tien")) || 0;
      return [dau("Xe Ôm Hóng", "#00a046"), h("div", { class: "dt-than" },
        h("div", { class: "dt-the xanh" }, h("small", {}, "Ví MôMô"), h("b", {}, dep.vnd(tien))),
        h("small", { class: "dt-nhan" }, "Bạn muốn đi đâu?"),
        dep.diemXeOm().map(d => h("button", { class: "dt-hang", disabled: d.gia > tien || d.oDay, onclick: () => { dong(); dep.diXeOm(d); } },
          h("span", { class: "dt-av xanh" }, "X"), h("div", {}, h("b", {}, d.ten), h("small", {}, d.oDay ? "Bạn đang ở đây" : d.gia > tien ? `${dep.vnd(d.gia)} · Không đủ tiền` : `${dep.vnd(d.gia)} · Khoảng ${d.phut} phút`)))))];
    },
    bando() {
      const cv = h("canvas", { class: "dt-bando", width: 700, height: 700 });
      const ve = () => veBanDo(cv, { g: dep.g, diem: dep.diemXeOm().filter(d => d.x != null), mucTieu: dep.g.mucTieu?.k, viec: dep.viecVat?.(), oNgoai: dep.g.oNgoai?.() });
      hen = setInterval(ve, 400); setTimeout(ve, 0);
      return [dau("Bản đồ", "#34a853"), h("div", { class: "dt-than" }, cv,
        dep.g.oNgoai?.() ? h("p", { class: "dt-ghi" }, "Bạn đang ở ngoài khu phố này.") : null,
        h("div", { class: "dt-chu-thich" }, h("span", { class: "c1" }, "Bạn"), h("span", { class: "c2" }, "Việc tiếp theo"), h("span", { class: "c3" }, "Điểm xe ôm"), h("span", { class: "c4" }, "Việc vặt")))];
    },
    momo() {
      const tien = Number(L.v("tien")) || 0;
      return [dau("MôMô", "#a50064"), h("div", { class: "dt-than" },
        h("div", { class: "dt-the hong" }, h("small", {}, "Số dư ví"), h("b", {}, dep.vnd(tien)), h("span", {}, L.ngay < 12 ? "Lương về ngày 12/10 (trễ 2 ngày)" : "Lương tháng 10 đã về")),
        h("small", { class: "dt-nhan" }, "Giao dịch gần đây"),
        (L.giaoDich || []).length ? (L.giaoDich || []).slice().reverse().map(g => h("div", { class: "dt-hang" }, h("div", {}, h("b", {}, g.ten), h("small", {}, `Ngày ${g.ngay}/10 · ${g.gio}`)), h("b", { class: g.so < 0 ? "am" : "duong" }, (g.so < 0 ? "−" : "+") + dep.vnd(Math.abs(g.so)))))
          : h("p", { class: "dt-ghi" }, "Chưa có giao dịch nào."))];
    },
    soppi() {
      const tien = Number(L.v("tien")) || 0;
      const HANG = [["Tai nghe chống ồn văn phòng", 189000], ["Ly giữ nhiệt in chữ \"Deadline là bạn\"", 79000], ["Gối tựa lưng công thái học", 159000], ["Mũ bảo hiểm màu hồng", 120000], ["Đèn bàn kẹp màn hình", 99000], ["Áo mưa bộ hai lớp", 65000], ["Combo 10 gói mì ly", 59000], ["Sạc dự phòng 20.000 mAh", 249000]];
      return [dau("Sốp-pi", "#ee4d2d"), h("div", { class: "dt-than" },
        h("div", { class: "dt-banner" }, h("b", {}, "SIÊU SALE 10.10"), h("small", {}, "Giảm tới 50% · Miễn phí vận chuyển")),
        h("div", { class: "dt-luoi-hang" }, chonTheoNgay(HANG, L.ngay, 6).map(([ten, gia]) => h("div", { class: "dt-sp" },
          h("div", { class: "dt-sp-anh", style: `--h:${(ten.length * 23) % 360}` }), h("span", {}, ten), h("b", {}, dep.vnd(gia)),
          h("button", { disabled: gia > tien, onclick: e => { if (dep.muaHang(ten, gia)) { e.currentTarget.textContent = "Đã đặt"; e.currentTarget.disabled = true; } } }, gia > tien ? "Không đủ tiền" : "Mua ngay")))))];
    },
    lich() {
      const dau1 = new Date(2026, 9, 1).getDay(), lech = (dau1 + 6) % 7;
      const o = [...Array(lech).fill(null), ...Array.from({ length: 31 }, (_, i) => i + 1)];
      let chon_ = L.ngay;
      const chiTiet = h("div", { class: "dt-lich-ct" });
      const veCT = () => chiTiet.replaceChildren(h("b", {}, dep.ngayDayDu(chon_)), h("span", {}, dep.SU_KIEN_NGAY[chon_] || "Không có sự kiện."));
      const luoi = h("div", { class: "dt-lich" }, ["T2", "T3", "T4", "T5", "T6", "T7", "CN"].map(t => h("small", {}, t)),
        o.map(n => n == null ? h("span", {}) : h("button", { class: (n === L.ngay ? "nay " : "") + (dep.SU_KIEN_NGAY[n] ? "co " : "") + (n < L.ngay ? "qua" : ""), onclick: () => { chon_ = n; veCT(); } }, String(n))));
      veCT();
      return [dau("Tháng 10, 2026", "#ff3b30"), h("div", { class: "dt-than" }, luoi, chiTiet)];
    },
    thoitiet() {
      const ds = dep.thoiTiet(L.ngay), mai = dep.thoiTiet(Math.min(31, L.ngay + 1));
      const nay = ds[L.phutGame < 12 * 60 ? 0 : L.phutGame < 18 * 60 ? 1 : 2];
      return [dau("Thời tiết", "#1f6fd1"), h("div", { class: "dt-than troi" },
        h("div", { class: "dt-tt-to" }, h("small", {}, "Quận Hóng"), h("b", {}, `${nay.nhiet}°`), h("span", {}, nay.ten)),
        h("div", { class: "dt-tt-dong" }, ds.map(x => h("div", {}, h("small", {}, x.buoi), h("b", {}, `${x.nhiet}°`), h("span", {}, x.ten)))),
        h("small", { class: "dt-nhan" }, "Ngày mai"),
        h("div", { class: "dt-tt-dong" }, mai.map(x => h("div", {}, h("small", {}, x.buoi), h("b", {}, `${x.nhiet}°`), h("span", {}, x.ten)))))];
    },
    ghichu() {
      return [dau("Ghi chú", "#c9a400"), h("div", { class: "dt-than vang" }, dep.ghiChu().map(([t, c]) => h("div", { class: "dt-note" }, h("b", {}, t), h("p", {}, c))))];
    },
    anh() {
      return [dau("Ảnh", "#4285f4"), h("div", { class: "dt-than" },
        anh.length ? h("div", { class: "dt-luoi-anh" }, anh.slice().reverse().map(u => h("img", { src: u, alt: "Ảnh đã chụp" }))) : h("p", { class: "dt-ghi" }, "Chưa có ảnh nào. Mở Camera để chụp."))];
    },
    camera() {
      const xem = h("img", { class: "dt-cam-xem", alt: "" });
      const chup = () => {
        const g = dep.g; try { g.renderer.render(g.scene, g.camera); const u = g.canvas.toDataURL("image/jpeg", 0.7); anh.push(u); if (anh.length > 12) anh.shift(); xem.src = u; am.phat("click"); am.phat("chuyen_canh"); } catch {}
      };
      setTimeout(() => { try { const g = dep.g; g.renderer.render(g.scene, g.camera); xem.src = g.canvas.toDataURL("image/jpeg", 0.6); } catch {} }, 0);
      return [dau("Camera", "#111"), h("div", { class: "dt-than toi" }, xem, h("div", { class: "dt-cam-nut" }, h("button", { class: "dt-chup", onclick: chup, "aria-label": "Chụp" })),
        h("p", { class: "dt-ghi" }, "Ảnh chụp lưu trong ứng dụng Ảnh."))];
    },
    thanhtuu() { return [dau("Thành tựu", "#f08c00"), h("div", { class: "dt-than" }, veBoSuuTap(h, { META: dep.META, NHAN_VAT: dep.NHAN_VAT }))]; },
    dongho() {
      const gio = Number(L.v("gio") ?? 8), phut = Number(L.v("phut") ?? 0);
      return [dau("Đồng hồ", "#111"), h("div", { class: "dt-than toi" },
        h("div", { class: "dt-dh", html: `<svg viewBox="0 0 120 120"><circle cx="60" cy="60" r="56" fill="#fff"/>${Array.from({ length: 12 }, (_, i) => `<rect x="58.5" y="8" width="3" height="9" fill="#111" transform="rotate(${i * 30} 60 60)"/>`).join("")}<line x1="60" y1="60" x2="60" y2="30" stroke="#111" stroke-width="5" stroke-linecap="round" transform="rotate(${(gio % 12) * 30 + phut / 2} 60 60)"/><line x1="60" y1="60" x2="60" y2="16" stroke="#111" stroke-width="3" stroke-linecap="round" transform="rotate(${phut * 6} 60 60)"/><circle cx="60" cy="60" r="4" fill="#ff9500"/></svg>` }),
        h("small", { class: "dt-nhan" }, "Báo thức"),
        [["07:00", "Dậy đi làm", true], ["07:15", "Dậy đi làm (thật)", true], ["12:00", "Ăn trưa", false], ["19:30", "Đại Nhạc Hội 31/10", L.ngay >= 25]].map(([g, t, bat]) => h("div", { class: "dt-hang" }, h("div", {}, h("b", { class: "to" }, g), h("small", {}, t)), h("span", { class: "dt-cong" + (bat ? " bat" : "") }))))];
    },
    maytinh() {
      let bt = "";
      const man = h("div", { class: "dt-mt-man" }, "0");
      const bam = k => {
        if (k === "C") bt = ""; else if (k === "=") { try { bt = /^[\d+\-*/.() ]+$/.test(bt) ? String(Math.round(Function(`return (${bt})`)() * 1000) / 1000) : ""; } catch { bt = ""; } }
        else bt += k;
        man.textContent = (bt || "0").replace(/\*/g, "×").replace(/\//g, "÷");
      };
      return [dau("Máy tính", "#1c1c1e"), h("div", { class: "dt-than toi" }, man, h("div", { class: "dt-mt" },
        ["C", "(", ")", "/", "7", "8", "9", "*", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "000", "="].map(k => h("button", { class: /[\d.]/.test(k) ? "" : "op", onclick: () => bam(k) }, k.replace("*", "×").replace("/", "÷")))))];
    },
    danhba() {
      const ds = dep.NHAN_VAT.filter(n => n.ma !== L.ma);
      return [dau("Danh bạ", "#2cc23e"), h("div", { class: "dt-than" }, ds.map(n => {
        const qh = Number(L.v("qh_" + n.ma)) || 0;
        return h("div", { class: "dt-hang" }, h("span", { class: "dt-av", style: `background:${n.mau}` }, dep.tenCua(n.ma).slice(0, 1)),
          h("div", {}, h("b", {}, dep.tenCua(n.ma)), h("small", {}, `${n.vai} · ${n.chuc}${qh ? ` · Quan hệ ${qh > 0 ? "+" : ""}${qh}` : ""}`)),
          h("button", { class: "dt-goi", "aria-label": `Gọi ${dep.tenCua(n.ma)}`, onclick: () => { am.phat("chuong_dt"); setTimeout(() => dep.thongBao(`${dep.tenCua(n.ma)} (qua điện thoại): "${dep.g.cauBan?.(n.ma) || "Alo, nghe nè."}"`), 1600); } }, "Gọi"));
      }))];
    },
    sms() {
      const TIN = [
        ["Nhà mạng Viết-teo", "Quý khách được tặng 1GB data khi gia hạn gói HÓNG90. Soạn HONG gửi 999."],
        ...(L.ngay >= 12 ? [["Ngân hàng Hóng Bank", `TK 0901xxxx: +${dep.vnd(dep.THEO_MA[L.ma]?.luong || 0)} lúc 09:12 ngày 12/10. ND: LUONG T10 G-ENTERTAINMENT.`]] : []),
        ["Xe Ôm Hóng", "Mã giảm 10% cho chuyến tiếp theo: HONGDI. Hạn dùng 31/10."],
        ...(L.ngay >= 20 ? [["Ban tổ chức Đại Nhạc Hội", "Vé khán đài khu A của bạn đã được xác nhận. Hẹn gặp 19:30 ngày 31/10."]] : []),
      ];
      return [dau("Tin nhắn", "#2cc23e"), h("div", { class: "dt-than" }, TIN.reverse().map(([ai, chu]) => h("div", { class: "dt-hang" }, h("span", { class: "dt-av xam" }, ai.slice(0, 1)), h("div", {}, h("b", {}, ai), h("small", {}, chu)))))];
    },
  };
  const mo = (id = "chinh") => {
    clearInterval(hen);
    if (id === "ban_do") id = "bando";
    ungDung = id === "bando" ? "ban_do" : id;
    if (!lop) {
      lop = h("div", { class: "dt-lop", onclick: e => { if (e.target === lop) dong(); } });
      dep.khung().append(lop); addEventListener("keydown", phim, true);
      dep.g.datKhoa(true); dep.g.moKhoaChuot(); am.phat("click");
    }
    const noiDung = id === "chinh" ? veChinh() : (UNG[id] || veChinh)();
    lop.replaceChildren(h("div", { class: "dt" + (id === "chinh" ? " chinh" : "") }, thanhTrangThai(), ...noiDung, h("div", { class: "dt-vach", onclick: () => id === "chinh" ? dong() : mo("chinh") })));
  };
  return { mo, dong, dangMo: () => !!lop };
}
