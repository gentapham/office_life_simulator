// Điện thoại trong game: tin nhắn Zola, thống kê Tóp-tóp của Siêu Nhân Hồng, Phây-búc, bản đồ Quận Hóng,
// gọi xe ôm, bộ sưu tập kết thúc và thành tựu. Bộ sưu tập, thành tựu lưu chung cho mọi lượt chơi.
import { am } from "./am-thanh-game.js";
import { NHOM_CONG_TY } from "./tin-truyen.js";
import { videoCoTieng, ganTiengVideo, doiTieng, datNguonPhu, phat as phatVideo } from "./video-am.js";

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
// nhin: { x, z, nua } khung nhìn tự chọn (kéo, phóng to); tl: số điểm ảnh canvas cho 1 px CSS. Trả về hàm đổi tọa độ để bấm chọn điểm.
export function veBanDo(cv, { g, diem = [], mucTieu, viec, oNgoai, nhin, tl = cv.width / 350 }) {
  const c = cv.getContext("2d"), W = cv.width, H = cv.height;
  // khung nhìn quanh người chơi (rộng 110 m) để chữ đủ to; ở ngoài khu phố thì xem toàn quận
  let tamX = !oNgoai && g ? Math.max(-70, Math.min(70, g.p.x)) : 0, tamZ = !oNgoai && g ? Math.max(-20, Math.min(50, g.p.z)) : 15;
  let nua = oNgoai || !g ? 150 : 55;
  if (nhin) { tamX = nhin.x; tamZ = nhin.z; nua = nhin.nua; }
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
  const CHU = '"Be Vietnam Pro", system-ui, sans-serif';
  c.font = `800 ${Math.round(15 * tl)}px ${CHU}`; c.textAlign = "center"; c.fillStyle = "#fff";
  c.fillText("G-ENT", px(0), pz(0)); c.fillText("SÂN KHẤU", px(110), pz(4));
  // điểm đến
  const coChu = Math.round(12.5 * tl), r = 6 * tl, daDat = [];
  c.font = `600 ${coChu}px ${CHU}`;
  // tên điểm: đặt phía trên chấm; trùng chữ đã đặt thì thử phía dưới, bên phải, bên trái (chữ không chồng lên nhau)
  const trung = (x0, y0, x1, y1) => daDat.some(r => x0 < r[2] && x1 > r[0] && y0 < r[3] && y1 > r[1]);
  for (const d of diem) { c.fillStyle = d.mau || "#2b6cb0"; c.strokeStyle = "#fff"; c.lineWidth = 2 * tl; c.beginPath(); c.arc(px(d.x), pz(d.z), r, 0, 6.3); c.fill(); c.stroke(); }
  c.lineJoin = "round";
  for (const d of diem) {
    const w = c.measureText(d.ten).width, x = Math.max(w / 2 + 4, Math.min(W - w / 2 - 4, px(d.x))), z = pz(d.z); // chữ không lọt ra ngoài mép
    const cho = [[x, z - r - 6 * tl], [x, z + r + 4 * tl + coChu * 0.8], [x + r + 5 * tl + w / 2, z + coChu * 0.35], [x - r - 5 * tl - w / 2, z + coChu * 0.35]];
    let [cx, cy] = cho[0];
    for (const [a, b] of cho) if (!trung(a - w / 2, b - coChu * 0.85, a + w / 2, b + coChu * 0.2)) { cx = a; cy = b; break; }
    daDat.push([cx - w / 2, cy - coChu * 0.85, cx + w / 2, cy + coChu * 0.2]);
    c.strokeStyle = "rgba(233, 227, 214, .9)"; c.lineWidth = 3 * tl; c.strokeText(d.ten, cx, cy);
    c.fillStyle = "#2a2622"; c.fillText(d.ten, cx, cy);
  }
  // việc vặt: chỗ mua hoặc người nhờ
  if (viec && viec.tang !== 2) {
    // ngoài khung bản đồ thì ghim ở mép, chỉ đúng hướng
    const q = 9 * tl, x = Math.max(q + 4, Math.min(W - q - 4, px(viec.x))), z = Math.max(q + 4, Math.min(H - q - 4, pz(viec.z)));
    c.fillStyle = "#3fa66b"; c.strokeStyle = "#fff"; c.lineWidth = 2 * tl;
    c.beginPath(); c.moveTo(x, z - q); c.lineTo(x + q, z); c.lineTo(x, z + q); c.lineTo(x - q, z); c.closePath(); c.fill(); c.stroke();
    const w = c.measureText("Việc vặt").width, lx = Math.max(w / 2 + 4, Math.min(W - w / 2 - 4, x));
    let ly = z - q - 5 * tl; if (ly < coChu || trung(lx - w / 2, ly - coChu * 0.85, lx + w / 2, ly + coChu * 0.2)) ly = z + q + 4 * tl + coChu * 0.8;
    c.strokeStyle = "rgba(233, 227, 214, .9)"; c.lineWidth = 3 * tl; c.strokeText("Việc vặt", lx, ly);
    c.fillStyle = "#1f5f3a"; c.fillText("Việc vặt", lx, ly);
  }
  // mục tiêu
  if (mucTieu) { c.strokeStyle = "#e8702a"; c.lineWidth = 3 * tl; c.beginPath(); c.arc(px(mucTieu.x), pz(mucTieu.z), 9 * tl, 0, 6.3); c.stroke(); }
  // người chơi (mũi tên theo hướng nhìn)
  if (!oNgoai && g) {
    const x = px(g.p.x), z = pz(g.p.z), a = g.yaw;
    c.save(); c.translate(x, z); c.rotate(-a + Math.PI); c.scale(tl * 0.62, tl * 0.62); c.fillStyle = "#e8702a"; c.strokeStyle = "#fff"; c.lineWidth = 3;
    c.beginPath(); c.moveTo(0, -24); c.lineTo(16, 18); c.lineTo(0, 8); c.lineTo(-16, 18); c.closePath(); c.stroke(); c.fill(); c.restore();
  }
  return { px, pz, tamX, tamZ, nua };
}

// ---------- Biểu tượng ứng dụng (SVG vẽ tay, tên nhại theo ứng dụng ngoài đời) ----------
let soNen = 0; // mỗi biểu tượng một mã chuyển màu riêng (trùng mã thì mọi biểu tượng lấy chung một màu)
const nen = (a, b = a) => { const id = "dtg" + soNen++; return `<defs><linearGradient id="${id}" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="${a}"/><stop offset="1" stop-color="${b}"/></linearGradient></defs><rect width="60" height="60" rx="14" fill="url(#${id})"/>`; };
const svg = noiDung => `<svg viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg">${noiDung}</svg>`;
const ICON = {
  zola: svg(nen("#3a8bff", "#0a62e8") + `<path d="M14 20c0-4 3-7 7-7h18c4 0 7 3 7 7v13c0 4-3 7-7 7H27l-8 6v-6h-0c-3 0-5-3-5-6z" fill="#fff"/><text x="30" y="32" text-anchor="middle" font-family="Be Vietnam Pro, Arial, sans-serif" font-weight="900" font-size="11" fill="#0a62e8">Zola</text>`),
  toptop: svg(nen("#111", "#000") + `<g transform="translate(-1 0)">${[["#25f4ee", -1.6, -1.2], ["#fe2c55", 1.6, 1.2], ["#fff", 0, 0]].map(([m, x, y]) => `<path transform="translate(${x} ${y})" fill="${m}" d="M29 13h6c.5 4 3.5 7 7.5 7.3v5.6c-2.8 0-5.3-.9-7.5-2.4V37a9 9 0 1 1-9-9h.5v5.8a3.4 3.4 0 1 0 2.5 3.3z"/>`).join("")}</g>`),
  phayBuc: svg(nen("#2d6cdf", "#1b4fb5") + `<text x="31" y="50" text-anchor="middle" font-family="Be Vietnam Pro, Arial, sans-serif" font-weight="900" font-size="44" fill="#fff">p</text>`),
  diuTup: svg(nen("#fff", "#f1f1f1") + `<rect x="9" y="17" width="42" height="27" rx="8" fill="#f2161c"/><path d="M26 23l12 7.5-12 7.5z" fill="#fff"/>`),
  sopPi: svg(nen("#ff6a3a", "#ee4d2d") + `<path d="M17 24h26l-2 22H19z" fill="#fff"/><path d="M24 24c0-6 2.5-9 6-9s6 3 6 9" fill="none" stroke="#fff" stroke-width="3"/><text x="30" y="42" text-anchor="middle" font-family="Be Vietnam Pro, Arial, sans-serif" font-weight="900" font-size="13" fill="#ee4d2d">S</text>`),
  moMo: svg(nen("#c2257a", "#a50064") + `<rect x="13" y="16" width="34" height="28" rx="7" fill="none" stroke="#fff" stroke-width="3"/><text x="30" y="35" text-anchor="middle" font-family="Be Vietnam Pro, Arial, sans-serif" font-weight="900" font-size="12" fill="#fff">mô</text>`),
  xeOm: svg(nen("#1fbf5a", "#00a046") + `<circle cx="19" cy="40" r="6" fill="none" stroke="#fff" stroke-width="3"/><circle cx="42" cy="40" r="6" fill="none" stroke="#fff" stroke-width="3"/><path d="M19 40l8-12h10l5 12M27 28l-3-6h-5M35 28l4-7h5" fill="none" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>`),
  banDo: svg(nen("#fff", "#eef3f0") + `<path d="M8 40l14-20 12 14 18-18v36H8z" fill="#cde8d4"/><path d="M8 52L52 14" stroke="#ffc928" stroke-width="5"/><path d="M30 8c-7 0-12 5-12 12 0 9 12 22 12 22s12-13 12-22c0-7-5-12-12-12z" fill="#ea4335"/><circle cx="30" cy="20" r="4.5" fill="#fff"/>`),
  camera: svg(nen("#9aa0a6", "#6b7076") + `<rect x="10" y="20" width="40" height="27" rx="5" fill="#1e1f22"/><rect x="22" y="15" width="16" height="7" rx="2" fill="#1e1f22"/><circle cx="30" cy="33" r="9" fill="#3a3d43" stroke="#cfd3d7" stroke-width="2.5"/><circle cx="30" cy="33" r="4" fill="#6d8fd6"/>`),
  anh: svg(nen("#fff", "#f4f4f4") + `<g transform="translate(30 30)">${["#ea4335", "#fbbc05", "#34a853", "#4285f4"].map((m, i) => `<path d="M0 0V-17a8.5 8.5 0 0 1 0 17z" fill="${m}" transform="rotate(${i * 90})"/>`).join("")}</g>`),
  dongHo: svg(nen("#1c1c1e", "#000") + `<circle cx="30" cy="30" r="20" fill="#fff"/><path d="M30 30V16M30 30l9 6" stroke="#111" stroke-width="3" stroke-linecap="round"/><circle cx="30" cy="30" r="2.5" fill="#ff9500"/>`),
  lich: n => svg(nen("#fff", "#f6f6f6") + `<text x="30" y="20" text-anchor="middle" font-family="Be Vietnam Pro, Arial, sans-serif" font-weight="700" font-size="10" fill="#ff3b30">TH 10</text><text x="30" y="47" text-anchor="middle" font-family="Be Vietnam Pro, Arial, sans-serif" font-weight="300" font-size="28" fill="#111">${n}</text>`),
  thoiTiet: svg(nen("#4aa3ff", "#1f6fd1") + `<circle cx="24" cy="24" r="9" fill="#ffd43b"/><path d="M20 44h22a8 8 0 0 0 0-16 11 11 0 0 0-21 3 6.5 6.5 0 0 0-1 13z" fill="#fff"/>`),
  ghiChu: svg(nen("#fff", "#f5f5f5") + `<rect x="0" y="0" width="60" height="16" rx="14" fill="#ffd60a"/><rect x="0" y="8" width="60" height="8" fill="#ffd60a"/><path d="M12 26h36M12 34h36M12 42h24" stroke="#c7c7cc" stroke-width="2.5"/>`),
  danhBa: svg(nen("#a8a8ad", "#8e8e93") + `<circle cx="30" cy="24" r="9" fill="#fff"/><path d="M14 48c2-9 9-13 16-13s14 4 16 13z" fill="#fff"/>`),
  dienThoai: svg(nen("#5fe16d", "#2cc23e") + `<path d="M21 14c2-1 4 0 5 2l3 6c1 2 0 4-1 5l-3 2c2 5 6 9 11 11l2-3c1-1 3-2 5-1l6 3c2 1 3 3 2 5l-2 4c-1 2-3 3-5 3-15-1-27-13-28-28 0-2 1-4 3-5z" fill="#fff"/>`),
  tinNhan: svg(nen("#5fe16d", "#2cc23e") + `<ellipse cx="30" cy="28" rx="18" ry="14" fill="#fff"/><path d="M17 36l-3 10 10-6z" fill="#fff"/>`),
  caiDat: svg(nen("#8e8e93", "#636366") + `<g transform="translate(30 30)" fill="#d1d1d6">${Array.from({ length: 8 }, (_, i) => `<rect x="-3.5" y="-20" width="7" height="9" rx="2" transform="rotate(${i * 45})"/>`).join("")}<circle r="13"/></g><circle cx="30" cy="30" r="6" fill="#636366"/>`),
  thanhTuu: svg(nen("#ffb020", "#f08c00") + `<path d="M20 14h20v10c0 7-4 12-10 12s-10-5-10-12z" fill="#fff"/><path d="M20 18h-6c0 6 3 9 7 9M40 18h6c0 6-3 9-7 9" fill="none" stroke="#fff" stroke-width="3"/><rect x="27" y="36" width="6" height="6" fill="#fff"/><rect x="20" y="42" width="20" height="5" rx="2" fill="#fff"/>`),
  mayTinh: svg(nen("#333", "#1c1c1e") + Array.from({ length: 9 }, (_, i) => `<circle cx="${18 + (i % 3) * 12}" cy="${18 + Math.floor(i / 3) * 12}" r="4.5" fill="${i % 3 === 2 ? "#ff9f0a" : "#a5a5a5"}"/>`).join("")),
};

// ---------- Biểu tượng giao diện (nét vẽ 24x24, không dùng ký tự đặc biệt để khỏi lệch phông) ----------
const IC = {
  lui: '<path d="M15 4.5 7.5 12l7.5 7.5"/>',
  phai: '<path d="m9 5 7 7-7 7"/>',
  len: '<path d="m5 15 7-7 7 7"/>',
  xuong: '<path d="m5 9 7 7 7-7"/>',
  tim: '<circle cx="11" cy="11" r="6.5"/><path d="m16 16 4.5 4.5"/>',
  cong: '<path d="M12 5v14M5 12h14"/>',
  x: '<path d="M6 6l12 12M18 6 6 18"/>',
  check: '<path d="m5 12.5 4.5 4.5L19 7.5"/>',
  tim_yeu: '<path d="M12 20s-7.5-4.6-7.5-10.2A4.3 4.3 0 0 1 12 7a4.3 4.3 0 0 1 7.5 2.8C19.5 15.4 12 20 12 20z"/>',
  binh_luan: '<path d="M4.5 18.5 6 15a7.5 7.5 0 1 1 3 2.6z"/>',
  chia_se: '<path d="M14 5l6 6-6 6M20 11h-8a7 7 0 0 0-7 7v1"/>',
  thich: '<path d="M7.5 10.5V20H4.5v-9.5zM7.5 10.5 11 3.8c1.6 0 2.6 1.2 2.3 2.8l-.6 3.4h5a2 2 0 0 1 2 2.4l-1.3 5.9a2 2 0 0 1-2 1.7H7.5"/>',
  khong_thich: '<path d="M16.5 13.5V4h3v9.5zM16.5 13.5 13 20.2c-1.6 0-2.6-1.2-2.3-2.8l.6-3.4h-5a2 2 0 0 1-2-2.4l1.3-5.9A2 2 0 0 1 7.6 4h8.9"/>',
  play: '<path d="M8 5.5v13l10.5-6.5z" fill="currentColor"/>',
  pause: '<path d="M7.5 5.5h3v13h-3zM13.5 5.5h3v13h-3z" fill="currentColor"/>',
  loa: '<path d="M4.5 9.5h3l4.5-4v13l-4.5-4h-3zM15.5 9a4.5 4.5 0 0 1 0 6M18 6.5a8 8 0 0 1 0 11"/>',
  tat_loa: '<path d="M4.5 9.5h3l4.5-4v13l-4.5-4h-3zM16 9.5l5 5M21 9.5l-5 5"/>',
  gui: '<path d="M4 11.5 20 4l-6.5 16-2.5-6.5z"/><path d="m11 13.5 4-4"/>',
  goi: '<path d="M6.5 3.5h3l1.5 4.5-2.2 1.4a11 11 0 0 0 5.8 5.8l1.4-2.2 4.5 1.5v3a2 2 0 0 1-2 2A16.5 16.5 0 0 1 4.5 5.5a2 2 0 0 1 2-2z"/>',
  nha: '<path d="M4 11 12 4.5l8 6.5V20h-5.5v-5.5h-5V20H4z"/>',
  chuong: '<path d="M6 16.5V11a6 6 0 0 1 12 0v5.5l1.5 1.5h-15zM10 20.5a2 2 0 0 0 4 0"/>',
  nguoi: '<circle cx="12" cy="8.5" r="3.8"/><path d="M4.5 20c.8-4 3.8-6 7.5-6s6.7 2 7.5 6"/>',
  nhom: '<circle cx="9" cy="9" r="3.3"/><path d="M3 19c.6-3.4 3-5.2 6-5.2s5.4 1.8 6 5.2"/><circle cx="16.5" cy="8" r="2.7"/><path d="M16.5 12.8c2.6 0 4.4 1.5 4.9 4.4"/>',
  dong_ho: '<circle cx="12" cy="12" r="8.5"/><path d="M12 7v5l3.5 2"/>',
  bao_thuc: '<circle cx="12" cy="13" r="7"/><path d="M12 9.5V13l2.5 1.5M4 5.5 7 3M20 5.5 17 3"/>',
  bam_gio: '<circle cx="12" cy="13.5" r="7"/><path d="M12 13.5V10M10 3h4M18 7l1.5-1.5"/>',
  the_gioi: '<circle cx="12" cy="12" r="8.5"/><path d="M3.5 12h17M12 3.5c2.5 2.5 3.5 5.5 3.5 8.5s-1 6-3.5 8.5c-2.5-2.5-3.5-5.5-3.5-8.5s1-6 3.5-8.5z"/>',
  gio_hang: '<path d="M3.5 4.5h2.5l2 11h10l2-8H7"/><circle cx="9.5" cy="19" r="1.4"/><circle cx="16.5" cy="19" r="1.4"/>',
  sao: '<path d="m12 3.8 2.5 5.1 5.6.8-4 4 .9 5.6-5-2.7-5 2.7.9-5.6-4-4 5.6-.8z" fill="currentColor"/>',
  vi: '<rect x="3.5" y="6" width="17" height="13" rx="2.5"/><path d="M16 12.5h4.5M6 6l9-2.5 1 2.5"/>',
  xe: '<circle cx="6" cy="16.5" r="3"/><circle cx="18" cy="16.5" r="3"/><path d="M6 16.5 10 9h5l3 7.5M10 9 8.5 6H6M15 9l2-3.5h2.5"/>',
  ghim: '<path d="M12 21s-6.5-6.2-6.5-11a6.5 6.5 0 0 1 13 0c0 4.8-6.5 11-6.5 11z"/><circle cx="12" cy="10" r="2.3"/>',
  dinh_vi: '<path d="M20 4 4 11l7 2 2 7z"/>',
  but: '<path d="M4 20h4L19 9l-4-4L4 16zM13.5 6.5l4 4"/>',
  thung_rac: '<path d="M4.5 7h15M9.5 7V4.5h5V7M6.5 7l1 13h9l1-13M10 11v5.5M14 11v5.5"/>',
  mat: '<path d="M2.5 12S6 5.5 12 5.5 21.5 12 21.5 12 18 18.5 12 18.5 2.5 12 2.5 12z"/><circle cx="12" cy="12" r="3"/>',
  mat_tat: '<path d="M2.5 12S6 5.5 12 5.5c2 0 3.6.6 5 1.6M21.5 12s-3.5 6.5-9.5 6.5c-2 0-3.6-.6-5-1.6M4 20 20 4"/>',
  anh: '<rect x="3.5" y="4.5" width="17" height="15" rx="2.5"/><circle cx="9" cy="10" r="1.8"/><path d="m4 18 5-5 4 4 3-3 4.5 4.5"/>',
  may_anh: '<path d="M4 8h3l1.5-2.5h7L17 8h3v11H4z"/><circle cx="12" cy="13" r="3.6"/>',
  tin: '<path d="M4 5.5h16v11H9l-5 4z"/>',
  ban_phim: [4, 12, 20].flatMap(y => [6, 12, 18].map(x => `<circle cx="${x}" cy="${y - 0.5}" r="1.6" fill="currentColor" stroke="none"/>`)).join(""),
  lich_su: '<path d="M4 12a8 8 0 1 0 2.4-5.7M4 4.5v4h4"/><path d="M12 8v4.5l3 1.8"/>',
  thong_ke: '<path d="M5 20V12M10 20V5M15 20v-9M20 20v-5"/>',
  nap: '<path d="M12 4v11M7 10l5 5 5-5M5 20h14"/>',
  dang_ky: '<path d="M5 9.5h14M5 14.5h14"/>',
  ba_cham: '<circle cx="5.5" cy="12" r="1.5" fill="currentColor"/><circle cx="12" cy="12" r="1.5" fill="currentColor"/><circle cx="18.5" cy="12" r="1.5" fill="currentColor"/>',
  xoa_lui: '<path d="M9 5.5h11v13H9L3.5 12z"/><path d="m12 9.5 5 5M17 9.5l-5 5"/>',
  cap_nhat: '<path d="M19.5 12a7.5 7.5 0 1 1-2.2-5.3M19.5 4.5v4h-4"/>',
};
const ic = (ten, cls = "") => `<svg class="ic ${cls}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">${IC[ten] || ""}</svg>`;
// biểu tượng thời tiết có màu
const ICON_TT = {
  nang: '<circle cx="16" cy="16" r="6.5" fill="#ffcc33"/><g stroke="#ffcc33" stroke-width="2.4" stroke-linecap="round">' + Array.from({ length: 8 }, (_, i) => `<path d="M16 3.5v3" transform="rotate(${i * 45} 16 16)"/>`).join("") + "</g>",
  dem: '<path d="M20.5 5.5A11 11 0 1 0 26.5 21 9 9 0 0 1 20.5 5.5z" fill="#ffe08a"/>',
  may: '<path d="M9 25h15a5.5 5.5 0 0 0 .5-11A8 8 0 0 0 9.3 16.2 4.5 4.5 0 0 0 9 25z" fill="#fff"/>',
  may_toi: '<path d="M9 22h15a5.5 5.5 0 0 0 .5-11A8 8 0 0 0 9.3 13.2 4.5 4.5 0 0 0 9 22z" fill="#c9d2dc"/>',
};
const veTT = (loai, dem) => {
  const nho = s => `<g transform="translate(8 9) scale(.55)">${s}</g>`;
  const mua = n => `<g stroke="#5ac8fa" stroke-width="2" stroke-linecap="round">${Array.from({ length: n }, (_, i) => `<path d="M${11 + i * 5} 25l-1.6 4"/>`).join("")}</g>`;
  const ve = {
    nang: dem ? ICON_TT.dem : ICON_TT.nang,
    nang_gat: dem ? ICON_TT.dem : ICON_TT.nang.replaceAll("#ffcc33", "#ffaa1a"),
    nhieu_may: (dem ? `<g transform="translate(-3 -4) scale(.75)">${ICON_TT.dem}</g>` : `<g transform="translate(-4 -5) scale(.8)">${ICON_TT.nang}</g>`) + ICON_TT.may,
    am_u: ICON_TT.may.replace("#fff", "#dfe5ec") + nho(ICON_TT.may_toi),
    mua_phun: ICON_TT.may_toi + mua(3),
    mua_rao: ICON_TT.may_toi + mua(4).replaceAll("l-1.6 4", "l-2.4 6"),
    giong: ICON_TT.may_toi + '<path d="M17 21l-4 6h4l-2 5 6-8h-4l2-3z" fill="#ffd60a"/>',
    suong_mu: '<g stroke="#e5e5ea" stroke-width="2.4" stroke-linecap="round"><path d="M6 12h20M4 17h24M7 22h18M10 27h12"/></g>',
  }[loai] || ICON_TT.may;
  return `<svg class="ic-tt" viewBox="0 0 32 32" aria-hidden="true">${ve}</svg>`;
};

// ---------- Điện thoại ----------
// dep: { h, L, g, META, NHAN_VAT, THEO_MA, tenCua, MUC_TIEU, so, vnd, ngayDayDu, SU_KIEN_NGAY, tinCho(), moTin(), diemXeOm(), diXeOm(diem),
//        viecVat(), moCaiDat(), dangThoai(), khung(), thoiTietGio(ngay, gio) -> {loai, ten, nhiet},
//        thongBao(chu), muaHang(ten, gia) -> bool, ghiChu() -> [[tiêu đề, chữ]], luu() }
// clip trên kênh của Siêu Nhân Hồng (video trong public/video), ra dần theo ngày; hs: độ viral so với số theo dõi
const CLIP_SNH = [
  { so: 1, ngay: 1, hs: 0.9, ten: "Ngày đầu ký hợp đồng với G-Entertainment. Hồng không phải màu, Hồng là thái độ #sieunhanhong", yt: "Ngày đầu ký hợp đồng với G-Entertainment | Vlog Siêu Nhân Hồng #1" },
  { so: 2, ngay: 2, hs: 0.6, ten: "Hậu trường tập luyện, mũ hơi bí nhưng tinh thần thì không #hautruong", yt: "Hậu trường tập luyện: đội mũ siêu nhân 8 tiếng một ngày" },
  { so: 3, ngay: 4, hs: 1.1, ten: "Đi một vòng Quận Hóng, ai cũng hỏi có phải Siêu Nhân Đỏ không. KHÔNG.", yt: "Đi dạo Quận Hóng và câu hỏi muôn thuở: Đỏ hay Hồng?" },
  { so: 4, ngay: 6, hs: 0.8, ten: "Thử thách 30 ngày lên 1 triệu follow, ngày thứ 6 #thuthach", yt: "Thử thách 30 ngày chạm 1 triệu người theo dõi (ngày 6)" },
  { so: 5, ngay: 9, hs: 1.6, ten: "Hậu trường MV đầu tay, quay 47 lần mới xong một cảnh #mv", yt: "Hậu trường MV đầu tay: 47 lần quay cho một cảnh" },
  { so: 6, ngay: 12, hs: 1.3, ten: "Lương về trễ 2 ngày nhưng Siêu Nhân vẫn cười #vanphong", yt: "Một ngày đi làm văn phòng của Siêu Nhân Hồng" },
  { so: 7, ngay: 16, hs: 1.9, ten: "Gameshow hôm nay: thua nhưng vui. Vote cho Hồng nha cả nhà #gameshow", yt: "Gameshow G-Ent: Siêu Nhân Hồng thua nhưng vẫn tạo dáng" },
  { so: 8, ngay: 20, hs: 1.4, ten: "Sinh nhật công ty 20/10, tặng hoa cả phòng #2010", yt: "20/10 và sinh nhật công ty: Hồng tặng hoa cả văn phòng" },
  { so: 9, ngay: 23, hs: 2.2, ten: "Livestream sinh nhật Siêu Nhân Hồng, cảm ơn mọi người đã thương #sinhnhat", yt: "Livestream sinh nhật Siêu Nhân Hồng (bản đầy đủ)" },
  { so: 10, ngay: 28, hs: 2.6, ten: "Còn 3 ngày nữa là Đại Nhạc Hội Siêu Nhân 31/10. Hẹn cả nhà ở Quảng trường Hồng!", yt: "Đếm ngược Đại Nhạc Hội Siêu Nhân 31/10 tại Quảng trường Hồng" },
];
// tin nhắn nhóm Zola (giờ gửi trong ngày theo thứ tự)
const GIO_NHOM = [7 * 60 + 42, 8 * 60 + 16, 9 * 60 + 4, 10 * 60 + 27, 11 * 60 + 48, 13 * 60 + 22, 14 * 60 + 41, 16 * 60 + 9, 17 * 60 + 6];
const NHOM_THEM = [
  ["designer", "Ai mượn bút cảm ứng của em thì trả giùm. Em vẽ bằng ngón tay mỏi lắm."],
  ["editor", "Render xong rồi nha. Đừng ai hỏi bản cuối nữa, bản cuối là bản này."],
  ["thanh_ninh", "Sếp vừa khen cả phòng mình làm tốt. Em nghe tận tai luôn ạ."],
  ["dan_dau_tu", "Hôm nay chart xanh, chiều trà sữa anh bao."],
  ["chi_dai", "Ai đăng ký đi Đại Nhạc Hội thì báo chị trước thứ Sáu."],
  ["idol_het_thoi", "Tối nay ai rảnh đi karaoke, anh hát Công Viên cho nghe."],
  ["quan_ly_idol", "Lịch quay tuần sau có thay đổi, mọi người xem file chung giùm."],
  ["bien_kich", "Kịch bản clip mới xong rồi. Ai góp ý thì góp nhẹ thôi."],
];
const TEN_TT = ["Hôm nay", "Ngày mai"];
const gon = n => { n = Math.round(Number(n) || 0); const f = (x, d) => (Math.round(x * 10) / 10).toLocaleString("vi-VN") + d; return n >= 1e6 ? f(n / 1e6, " Tr") : n >= 1e3 ? f(n / 1e3, " N") : String(n); };
const hhmm = p => `${String(Math.floor(p / 60) % 24).padStart(2, "0")}:${String(Math.round(p) % 60).padStart(2, "0")}`;
const bamSo = s => { let x = 0; for (const c of String(s)) x = (x * 31 + c.charCodeAt(0)) >>> 0; return x; };
const chuDau = s => [...String(s || "?").trim()][0]?.toUpperCase() || "?";
// sản phẩm Sốp-pi: tên, giá, giá gốc, nhóm, hình vẽ
const HANG = [
  { ma: "tai_nghe", ten: "Tai nghe chống ồn văn phòng", gia: 189000, goc: 290000, nhom: "Văn phòng", ban: 2300, mo: "Chặn tiếng máy in và tiếng họp phòng bên. Pin 30 giờ." },
  { ma: "ly", ten: "Ly giữ nhiệt in chữ \"Deadline là bạn\"", gia: 79000, goc: 120000, nhom: "Văn phòng", ban: 5100, mo: "Giữ nóng cà phê tới khi họp xong. Inox hai lớp, 500 ml." },
  { ma: "goi", ten: "Gối tựa lưng công thái học", gia: 159000, goc: 250000, nhom: "Văn phòng", ban: 1800, mo: "Đỡ lưng những ngày ngồi 10 tiếng. Mút hoạt tính." },
  { ma: "mu", ten: "Mũ bảo hiểm màu hồng", gia: 120000, goc: 180000, nhom: "Đi đường", ban: 940, mo: "Màu hồng đúng chuẩn Siêu Nhân. Có kính chắn gió." },
  { ma: "den", ten: "Đèn bàn kẹp màn hình", gia: 99000, goc: 159000, nhom: "Văn phòng", ban: 3200, mo: "Ánh sáng dịu, không chói màn hình. Cắm cổng USB." },
  { ma: "ao_mua", ten: "Áo mưa bộ hai lớp", gia: 65000, goc: 99000, nhom: "Đi đường", ban: 7600, mo: "Mưa Quận Hóng không báo trước, áo mưa thì có." },
  { ma: "mi", ten: "Combo 10 gói mì ly", gia: 59000, goc: 75000, nhom: "Ăn uống", ban: 12000, mo: "Bữa tối của những ngày tăng ca. Vị tôm chua cay." },
  { ma: "sac", ten: "Sạc dự phòng 20.000 mAh", gia: 249000, goc: 390000, nhom: "Đi đường", ban: 4100, mo: "Sạc điện thoại 4 lần. Có đèn báo dung lượng." },
];
const HINH_HANG = {
  tai_nghe: '<path d="M14 34v-6a16 16 0 0 1 32 0v6" fill="none" stroke="#333" stroke-width="4"/><rect x="10" y="32" width="10" height="16" rx="4" fill="#ee4d2d"/><rect x="40" y="32" width="10" height="16" rx="4" fill="#ee4d2d"/>',
  ly: '<path d="M19 16h22l-2 32a3 3 0 0 1-3 3H24a3 3 0 0 1-3-3z" fill="#2d6cdf"/><rect x="17" y="12" width="26" height="6" rx="2" fill="#1b4fb5"/><rect x="22" y="28" width="16" height="9" rx="1.5" fill="#fff"/>',
  goi: '<rect x="12" y="16" width="36" height="30" rx="12" fill="#8e8e93"/><path d="M18 31c6-5 18-5 24 0" stroke="#c7c7cc" stroke-width="3" fill="none"/>',
  mu: '<path d="M10 38a20 20 0 0 1 40 0z" fill="#f26fa6"/><path d="M30 18v20" stroke="#ffd1e4" stroke-width="3"/><rect x="8" y="38" width="44" height="6" rx="3" fill="#c2185b"/>',
  den: '<path d="M20 50h20M30 50V28M30 28l12-10" stroke="#555" stroke-width="3.5" stroke-linecap="round" fill="none"/><path d="M36 12l14 8-6 8-14-8z" fill="#ffcc33"/>',
  ao_mua: '<path d="M22 12h16l10 12-6 4v22H18V28l-6-4z" fill="#34c759"/><path d="M26 12a4 4 0 0 0 8 0" fill="#248a3d"/>',
  mi: '<path d="M16 22h28l-4 28H20z" fill="#fff" stroke="#ee4d2d" stroke-width="2.5"/><rect x="14" y="17" width="32" height="6" rx="2" fill="#ee4d2d"/><path d="M22 32c3 2 5-2 8 0s5-2 8 0" stroke="#f4b400" stroke-width="2.5" fill="none"/>',
  sac: '<rect x="18" y="10" width="24" height="40" rx="5" fill="#333"/><rect x="22" y="16" width="16" height="24" rx="2" fill="#4cd964"/><circle cx="30" cy="45" r="2" fill="#fff"/>',
};
const hinhHang = ma => `<svg viewBox="0 0 60 60" aria-hidden="true">${HINH_HANG[ma] || ""}</svg>`;
const BINH_LUAN = ["Đúng quá trời luôn", "Chuẩn không cần chỉnh", "Cười xỉu", "Tag người cần đọc cái này", "Hôm qua tui cũng vậy", "Thương ghê", "Ai rồi cũng vậy thôi", "Hóng phần 2"];
const DS_BAO_THUC = [{ gio: "07:00", ten: "Dậy đi làm", bat: true }, { gio: "07:15", ten: "Dậy đi làm (thật)", bat: true }, { gio: "12:00", ten: "Ăn trưa", bat: false }, { gio: "17:30", ten: "Tan làm", bat: true }];

// thay con của một phần tử: bỏ qua null/false, trải mảng lồng nhau
const thay = (el, ...con) => el.replaceChildren(...con.flat(Infinity).filter(x => x != null && x !== false));

export function taoDienThoai(dep) {
  const { h, L } = dep;
  datNguonPhu(() => dep.g?.sanKhau?.amThanh?.ctx); // nhạc sân khấu tạm ngưng khi clip trong máy đang kêu
  let lop = null, khung = null, ungDung = "chinh", khoaTruoc = false, phimUng = null, luiLai = null, henMo = null;
  const don = []; // việc dọn khi đổi ứng dụng / đóng máy: hẹn giờ, video
  const donSach = () => { while (don.length) { try { don.pop()(); } catch {} } phimUng = null; luiLai = null; };
  const henLap = (f, ms) => { const id = setInterval(f, ms); don.push(() => clearInterval(id)); };
  const henMot = (f, ms) => { const id = setTimeout(f, ms); don.push(() => clearTimeout(id)); };
  // dữ liệu riêng của điện thoại, lưu chung với file lưu của vai
  const D = () => {
    const d = (L.dienThoai ||= {});
    d.ghiChu ||= []; d.daXem ||= {}; d.chat ||= {}; d.don ||= []; d.cuocGoi ||= []; d.baiDang ||= []; d.thich ||= {};
    d.baoThuc ||= DS_BAO_THUC.map(x => ({ ...x }));
    return d;
  };
  let henLuu = null;
  const luu = () => { clearTimeout(henLuu); henLuu = setTimeout(() => { try { dep.luu?.(); } catch {} }, 400); };
  // ảnh chụp: lưu trên trình duyệt theo vai (ảnh nhỏ, tối đa 18 tấm)
  const KHOA_ANH = () => "owfad_anh_" + L.ma;
  let anh = (() => { try { return JSON.parse(localStorage.getItem(KHOA_ANH()) || "[]"); } catch { return []; } })();
  const luuAnh = () => { for (;;) { try { localStorage.setItem(KHOA_ANH(), JSON.stringify(anh)); return; } catch { if (anh.length <= 1) return; anh.shift(); } } };
  const ten = ma => dep.tenCua(ma);
  const toi = () => ten(L.ma);
  const tien = () => Number(L.v("tien")) || 0;
  const phut = () => Number(L.phutGame ?? 480);
  const gioNay = () => hhmm(phut());
  const laDem = (gio = phut() / 60) => gio >= 18.5 || gio < 5.5;
  const pin = () => Math.max(5, Math.round(100 - Math.max(0, phut() - 480) / 11));
  const gocURL = import.meta.env.BASE_URL || "./";
  const avatarSNH = `${gocURL}anh/sieu-nhan-hong-avatar.jpg`;
  const icEl = (t, cls = "") => h("i", { class: "dt-i " + cls, html: ic(t) });
  const av = (ma, cls = "") => ma === "sieu_nhan_hong"
    ? h("img", { class: "dt-av anh " + cls, src: avatarSNH, alt: "" })
    : h("span", { class: "dt-av " + cls, style: `--av:${dep.THEO_MA[ma]?.mau || "#8e8e93"}` }, chuDau(ten(ma)));
  const nut = (attrs, ...kids) => h("button", { type: "button", ...attrs }, ...kids);
  // thông báo nhỏ trong máy
  const bao = chu => {
    if (!khung) return;
    khung.querySelector(".dt-toast")?.remove();
    const t = h("div", { class: "dt-toast", role: "status" }, chu); khung.append(t);
    const id = setTimeout(() => t.remove(), 1900); don.push(() => clearTimeout(id));
  };
  const dangBan = () => khoaTruoc || dep.dangThoai() || !!dep.g.capCuu;

  const dong = (huy = false) => {
    if (!lop) return; donSach(); clearInterval(henMo); lop.remove(); lop = null; khung = null;
    removeEventListener("keydown", phim, true);
    if (!huy && !khoaTruoc && !dep.dangThoai()) dep.g.datKhoa(false);
  };
  const phim = e => {
    const oNhap = e.target.closest?.("input, textarea");
    if (e.code === "Escape") {
      e.preventDefault(); e.stopPropagation();
      if (oNhap) { e.target.blur(); return; }
      if (luiLai) luiLai(); else if (ungDung !== "chinh") mo("chinh"); else dong();
      return;
    }
    if (oNhap && khung?.contains(e.target)) return; // đang gõ trong máy: phím tới ô nhập (game tự bỏ qua phím gõ trong ô nhập)
    e.stopPropagation(); // phím bấm khi mở điện thoại không tới game (không đi, không nhảy, không mở bảng)
    if (phimUng?.(e)) { e.preventDefault(); return; }
    if (e.code === "KeyP" || (e.code === "KeyM" && ungDung === "ban_do")) { e.preventDefault(); dong(); }
  };
  const thanhTrangThai = () => {
    const p = pin();
    return h("div", { class: "dt-tt" }, h("b", {}, gioNay()), h("span", { class: "dt-tt-phai", html:
      `<svg viewBox="0 0 18 12" width="17" aria-hidden="true"><rect x="0" y="8" width="3" height="4" rx="1"/><rect x="5" y="5.5" width="3" height="6.5" rx="1"/><rect x="10" y="3" width="3" height="9" rx="1"/><rect x="15" y="0" width="3" height="12" rx="1" opacity=".4"/></svg>
       <small>4G</small>
       <span class="dt-pin${p <= 20 ? " yeu" : ""}"><i style="width:${p}%"></i></span><small>${p}%</small>` }));
  };
  // thanh đầu ứng dụng: nút lùi, tiêu đề, nút phải (tùy chọn)
  const dau = (tieuDe, { lui, phai, cls = "" } = {}) => h("header", { class: "dt-dau " + cls },
    nut({ class: "dt-lui", onclick: () => (lui || luiLai || (() => mo("chinh")))(), "aria-label": "Quay lại" }, icEl("lui")),
    h("b", {}, tieuDe), phai || h("span", { class: "dt-dau-trong" }));
  const thanhTab = (ds, chon, f) => h("nav", { class: "dt-tab" }, ds.map(([id, chu, icon]) =>
    nut({ class: id === chon ? "on" : "", onclick: () => f(id) }, icEl(icon), h("small", {}, chu))));
  const bieuTuong = (id, n) => h("i", { class: "dt-icon", html: typeof ICON[id] === "function" ? ICON[id](n) : ICON[id] });

  // ----- dữ liệu chung theo ngày -----
  const clipDaRa = () => CLIP_SNH.filter(c => L.ngay >= c.ngay).reverse();
  const luotXem = c => Math.round((Number(L.v("nguoi_theo_doi")) || 0) * c.hs * (1 + Math.min(6, L.ngay - c.ngay) / 10));
  const nhomHomNay = () => {
    const ds = [...NHOM_CHAT, ...NHOM_THEM];
    const kq = [];
    const su = dep.SU_KIEN_NGAY[L.ngay];
    if (su) kq.push({ ma: "hr", chu: `Lịch hôm nay: ${su}. Cả nhà nắm giùm nha.`, p: 7 * 60 + 30 });
    for (let i = 0; i < 7; i++) { const [ma, chu] = ds[(L.ngay * 7 + i * 5) % ds.length]; if (!kq.some(x => x.chu === chu)) kq.push({ ma, chu, p: GIO_NHOM[i] }); }
    return kq.filter(x => x.p <= phut());
  };
  // người nhắn riêng: nhắn cốt truyện đã đọc, người nhờ mua đồ, người mình đã nhắn
  const maTheoTen = t => dep.NHAN_VAT.find(n => ten(n.ma) === t || n.ten === t)?.ma;
  const chatRieng = () => {
    const d = D(), m = new Map();
    const them = (ma, x) => { if (!ma || ma === L.ma || !dep.THEO_MA[ma]) return; if (!m.has(ma)) m.set(ma, []); m.get(ma).push(x); };
    for (const t of L.tinDaDoc || []) {
      if (t.dong?.length) { if (t.ma && !t.nhom && t.kenh !== "sms") for (const x of dongTin(t)) them(t.ma, x); continue; }
      // bản lưu cũ chỉ có tên người gửi: hiện câu cửa miệng như trước
      const ma = maTheoTen(String(t.ten).replace("Tin nhắn từ ", ""));
      them(ma, { ho: true, chu: dep.THEO_MA[ma]?.cau || "Rảnh không, nói chuyện chút.", ngay: t.ngay, p: t.p ?? 9 * 60 + bamSo(t.ten + t.ngay) % 400 });
    }
    const vv = dep.viecVat?.();
    if (vv?.ma) {
      them(vv.ma, { ho: true, chu: `Tiện đường mua giùm ${vv.mon} nha, mình gửi lại tiền.`, ngay: L.ngay, p: 8 * 60 + 3 });
      if (vv.xong) them(vv.ma, { ho: true, chu: "Cảm ơn nha! Gửi lại tiền rồi đó.", ngay: L.ngay, p: Math.min(phut(), 23 * 60) });
    }
    for (const [ma, ds] of Object.entries(d.chat)) for (const x of ds) them(ma, x);
    for (const ds of m.values()) ds.sort((a, b) => a.ngay - b.ngay || a.p - b.p);
    return [...m.entries()].sort((a, b) => { const x = a[1].at(-1), y = b[1].at(-1); return y.ngay - x.ngay || y.p - x.p; });
  };
  // lời thật của tin nhắn trong truyện -> dòng chat { ho, ke, ai (mã người nói), tenAi, chu, ngay, p }
  const dongTin = t => t.dong.map(x => ({ ho: x.ai !== "toi", ke: x.ai === "ke", ai: x.ai === "ho" ? x.ma || null : null, tenAi: x.ai === "ho" ? x.ten : null, chu: x.chu, ngay: t.ngay, p: t.p ?? 20 * 60 }));
  const xepGio = ds => ds.sort((a, b) => a.ngay - b.ngay || a.p - b.p);
  // các nhóm Zola: nhóm công ty (tin hằng ngày + tin trong truyện), các nhóm khác có trong truyện
  const dsNhom = () => {
    const m = new Map([[NHOM_CONG_TY, nhomHomNay().map(x => ({ ho: x.ma !== L.ma, ai: x.ma, chu: x.chu, ngay: L.ngay, p: x.p }))]]);
    for (const t of L.tinDaDoc || []) if (t.dong?.length && t.nhom) { if (!m.has(t.nhom)) m.set(t.nhom, []); m.get(t.nhom).push(...dongTin(t)); }
    for (const ds of m.values()) xepGio(ds);
    return [...m.entries()];
  };
  const khoaNhom = k => k === NHOM_CONG_TY ? "nhom" : "zn-" + k;
  const khoaCuoi = ds => { const x = ds.at(-1); return x ? `${x.ngay}-${x.p}-${x.chu.length}` : ""; };
  const tinSMS = () => {
    const ds = [];
    const n = dep.THEO_MA[L.ma];
    ds.push({ id: "mang", ai: "Viết-teo", tin: [{ ngay: 1, p: 8 * 60 + 2, chu: "Quý khách được tặng 1GB data khi gia hạn gói HÓNG90. Soạn HONG gửi 999." }, ...(L.ngay >= 15 ? [{ ngay: 15, p: 9 * 60, chu: "Viết-teo xin lỗi vì sóng yếu khu vực Quận Hóng trong ngày mất điện. Tặng quý khách 500MB." }] : [])] });
    const bank = [];
    if (L.ngay >= 12 && n?.luong) bank.push({ ngay: 12, p: 9 * 60 + 12, chu: `TK 0901xxxx: +${dep.vnd(n.luong)} lúc 09:12 ngày 12/10. ND: LUONG T10 G-ENTERTAINMENT.` });
    if (bank.length) ds.push({ id: "bank", ai: "Hóng Bank", tin: bank });
    const xeOm = (L.giaoDich || []).filter(g => g.ten.startsWith("Xe Ôm Hóng")).map(g => ({ ngay: g.ngay, p: gioSoChu(g.gio), chu: `Cảm ơn bạn đã đi Xe Ôm Hóng tới ${g.ten.replace("Xe Ôm Hóng: ", "")}. Cước: ${dep.vnd(-g.so)}, trừ vào ví MôMô.` }));
    ds.push({ id: "xeom", ai: "Xe Ôm Hóng", tin: [{ ngay: 1, p: 7 * 60 + 50, chu: "Nhập mã HONGDI để giảm 10% cho một chuyến. Hạn dùng 31/10." }, ...xeOm] });
    const don = D().don.flatMap(o => [{ ngay: o.ngay, p: o.p, chu: `Đơn hàng "${o.ten}" đã được đặt. Dự kiến giao ngày ${o.giao}/10.` }, ...(L.ngay >= o.giao ? [{ ngay: o.giao, p: 10 * 60, chu: `Đơn hàng "${o.ten}" đã giao tới quầy bảo vệ G-Entertainment.` }] : [])]);
    if (don.length) ds.push({ id: "soppi", ai: "Sốp-pi", tin: don });
    // tin nhắn thường trong truyện (không qua Zola)
    for (const t of L.tinDaDoc || []) {
      if (!t.dong?.length || t.kenh !== "sms") continue;
      const ai = t.ma ? ten(t.ma) : "Số lạ", id = "tt-" + (t.ma || "la");
      let c = ds.find(x => x.id === id); if (!c) ds.push(c = { id, ai, tin: [] });
      c.tin.push(...t.dong.map(x => ({ ngay: t.ngay, p: t.p ?? 20 * 60, chu: x.chu, toi: x.ai === "toi", ke: x.ai === "ke" })));
    }
    if (L.ngay >= 20) ds.push({ id: "dnh", ai: "BTC Đại Nhạc Hội", tin: [{ ngay: 20, p: 15 * 60, chu: "Vé khán đài khu A của bạn đã được xác nhận. Hẹn gặp 19:30 ngày 31/10 tại Quảng trường Hồng." }] });
    for (const t of ds) { t.tin = t.tin.filter(x => x.ngay < L.ngay || (x.ngay === L.ngay && x.p <= phut())).sort((a, b) => a.ngay - b.ngay || a.p - b.p); }
    return ds.filter(t => t.tin.length).sort((a, b) => { const x = a.tin.at(-1), y = b.tin.at(-1); return y.ngay - x.ngay || y.p - x.p; });
  };
  const gioSoChu = s => { const m = /(\d+):(\d+)/.exec(s || ""); return m ? +m[1] * 60 + +m[2] : 0; };
  const thoiGian = (ngay, p) => ngay === L.ngay ? hhmm(p) : ngay === L.ngay - 1 ? "Hôm qua" : `${ngay}/10`;
  // số trên biểu tượng
  const soBao = id => {
    const d = D();
    if (id === "zola") return (dep.tinCho() ? 1 : 0)
      + chatRieng().filter(([ma, ds]) => ds.at(-1).ho && d.daXem["z-" + ma] !== khoaCuoi(ds)).length
      + dsNhom().filter(([k, ds]) => ds.length && d.daXem[khoaNhom(k)] !== khoaCuoi(ds)).length;
    if (id === "phaybuc") return d.daXem.pb === L.ngay ? 0 : 3 + (L.ngay % 4);
    if (id === "sms") return tinSMS().filter(t => d.daXem["s-" + t.id] !== khoaCuoi(t.tin)).length;
    if (id === "toptop" || id === "diutup") return clipDaRa()[0]?.ngay === L.ngay && d.daXem[id] !== L.ngay ? 1 : 0;
    if (id === "soppi") return d.don.filter(o => L.ngay >= o.giao && !o.xem).length;
    return 0;
  };

  // danh sách ứng dụng trên màn hình chính và thanh dưới
  const APP = [
    { id: "toptop", ten: "Tóp-tóp", icon: "toptop" }, { id: "phaybuc", ten: "Phây-búc", icon: "phayBuc" }, { id: "diutup", ten: "Diu-túp", icon: "diuTup" }, { id: "xeom", ten: "Xe Ôm Hóng", icon: "xeOm" },
    { id: "bando", ten: "Bản đồ", icon: "banDo" }, { id: "momo", ten: "MôMô", icon: "moMo" }, { id: "soppi", ten: "Sốp-pi", icon: "sopPi" }, { id: "lich", ten: "Lịch", icon: "lich" },
    { id: "thoitiet", ten: "Thời tiết", icon: "thoiTiet" }, { id: "ghichu", ten: "Ghi chú", icon: "ghiChu" }, { id: "anh", ten: "Ảnh", icon: "anh" }, { id: "thanhtuu", ten: "Thành tựu", icon: "thanhTuu" },
    { id: "dongho", ten: "Đồng hồ", icon: "dongHo" }, { id: "maytinh", ten: "Máy tính", icon: "mayTinh" }, { id: "caidat", ten: "Cài đặt", icon: "caiDat" },
  ];
  const DOCK = [{ id: "danhba", ten: "Điện thoại", icon: "dienThoai" }, { id: "sms", ten: "Tin nhắn", icon: "tinNhan" }, { id: "zola", ten: "Zola", icon: "zola" }, { id: "camera", ten: "Camera", icon: "camera" }];
  const nutApp = a => { const s = soBao(a.id); return nut({ class: "dt-app", "data-app": a.ten, "aria-label": a.ten, onclick: () => a.id === "caidat" ? (dong(), dep.moCaiDat()) : mo(a.id) },
    bieuTuong(a.icon, L.ngay), s ? h("em", {}, String(s)) : null, h("span", {}, a.ten)); };

  const veChinh = () => {
    const t = dep.thoiTietGio(L.ngay, Math.floor(phut() / 60));
    const td = Number(L.v("nguoi_theo_doi")) || 0;
    return [h("div", { class: "dt-widget" },
        h("div", { class: "dt-w-gio" }, h("b", {}, gioNay()), h("small", {}, dep.ngayDayDu(L.ngay))),
        h("div", { class: "dt-w-phai" },
          nut({ class: "dt-w-tt", onclick: () => mo("thoitiet") }, h("small", {}, "Quận Hóng"), h("span", { class: "dt-w-tt-dong" }, h("b", {}, `${t.nhiet}°`), h("i", { html: veTT(t.loai, laDem()) })), h("span", {}, t.ten)),
          nut({ class: "dt-w-td", onclick: () => mo("toptop") }, h("small", {}, "Siêu Nhân Hồng"), h("b", {}, dep.so(td)), h("i", {}, h("u", { style: `width:${Math.min(100, td / dep.MUC_TIEU * 100)}%` }))))),
      h("div", { class: "dt-luoi" }, APP.map(nutApp)),
      h("div", { class: "dt-dock" }, DOCK.map(nutApp))];
  };

  // ======================= ZOLA =======================
  const zola = (() => {
    let tab = "tin";
    const veDS = than => {
      const d = D(), cho = dep.tinCho(), rieng = chatRieng();
      const loc = h("input", { class: "dt-z-tim", type: "search", placeholder: "Tìm kiếm", "aria-label": "Tìm kiếm" });
      const dsEl = h("div", { class: "dt-z-ds" });
      const hang = ({ avEl, tieuDe, xemTruoc, gio, moi, onclick }) => nut({ class: "dt-z-hang" + (moi ? " moi" : ""), onclick, "data-ten": tieuDe },
        avEl, h("div", {}, h("b", {}, tieuDe), h("small", {}, xemTruoc)), h("span", { class: "dt-z-phai" }, h("small", {}, gio), moi ? h("em", {}, "1") : null));
      const ds = [
        cho ? hang({ avEl: h("span", { class: "dt-av", style: "--av:#0068ff" }, chuDau(cho.replace("Tin nhắn từ ", ""))), tieuDe: cho.replace("Tin nhắn từ ", ""), xemTruoc: "Đã gửi cho bạn một tin nhắn", gio: gioNay(), moi: true, onclick: () => { dong(); dep.moTin(); } }) : null,
        ...dsNhom().map(([k, ds]) => { const c = ds.at(-1); return hang({ avEl: h("span", { class: "dt-av nhom" }, k === NHOM_CONG_TY ? "G" : chuDau(k)), tieuDe: k, xemTruoc: c ? (c.ke ? c.chu : c.ho ? `${c.ai ? ten(c.ai) : c.tenAi || "Ai đó"}: ${c.chu}` : `Bạn: ${c.chu}`) : "Chưa có tin nhắn hôm nay", gio: c ? thoiGian(c.ngay, c.p) : "", moi: !!c && d.daXem[khoaNhom(k)] !== khoaCuoi(ds), onclick: () => veNhom(than, k) }); }),
        ...rieng.map(([ma, ds]) => { const c = ds.at(-1); return hang({ avEl: av(ma), tieuDe: ten(ma), xemTruoc: (c.ho ? "" : "Bạn: ") + c.chu, gio: thoiGian(c.ngay, c.p), moi: c.ho && d.daXem["z-" + ma] !== khoaCuoi(ds), onclick: () => veChat(than, ma) }); }),
      ].filter(Boolean);
      thay(dsEl, ...ds);
      loc.oninput = () => { const q = loc.value.trim().toLowerCase(); for (const x of dsEl.children) x.hidden = q && !x.dataset.ten.toLowerCase().includes(q); };
      thay(than, h("div", { class: "dt-z-dau" }, icEl("tim"), loc), dsEl);
    };
    const veDanhBa = than => {
      const ds = dep.NHAN_VAT.filter(n => n.ma !== L.ma && n.ma !== "cho").sort((a, b) => ten(a.ma).localeCompare(ten(b.ma), "vi"));
      thay(than, h("div", { class: "dt-z-ds" }, h("small", { class: "dt-z-nhan" }, `Bạn bè (${ds.length})`), ds.map(n => nut({ class: "dt-z-hang", onclick: () => veChat(than, n.ma) }, av(n.ma), h("div", {}, h("b", {}, ten(n.ma)), h("small", {}, n.chuc))))));
    };
    const veCaNhan = than => {
      const n = dep.THEO_MA[L.ma];
      thay(than, h("div", { class: "dt-z-cn" }, h("div", { class: "dt-z-bia" }), av(L.ma, "to"), h("b", {}, toi()), h("small", {}, `${n?.vai || ""} · ${n?.chuc || ""}`)),
        h("div", { class: "dt-nhom-hang" },
          nut({ class: "dt-dong", onclick: () => mo("momo") }, icEl("vi", "mau-hong"), h("span", {}, "Ví MôMô"), h("small", {}, dep.vnd(tien())), icEl("phai", "nhat")),
          nut({ class: "dt-dong", onclick: () => mo("anh") }, icEl("anh", "mau-xanh"), h("span", {}, "Ảnh của tôi"), h("small", {}, `${anh.length} ảnh`), icEl("phai", "nhat")),
          nut({ class: "dt-dong", onclick: () => { dong(); dep.moCaiDat(); } }, icEl("ba_cham", "mau-xam"), h("span", {}, "Cài đặt"), h("small", {}), icEl("phai", "nhat"))));
    };
    const nhanNgay = n => n === L.ngay ? `Hôm nay, ${n}/10` : `${dep.ngayDayDu(n).split(" - ")[0]}, ${n}/10`;
    const veNhom = (than, k = NHOM_CONG_TY) => {
      const ds = dsNhom().find(([x]) => x === k)?.[1] || [];
      D().daXem[khoaNhom(k)] = khoaCuoi(ds); luu();
      luiLai = () => ve();
      khung.querySelector(".dt-dau").replaceWith(dau(k, { lui: () => ve(), cls: "z" }));
      let ngay0 = 0; const kq = [];
      for (const x of ds) {
        if (x.ngay !== ngay0) { ngay0 = x.ngay; kq.push(h("small", { class: "dt-z-ngay" }, nhanNgay(x.ngay))); }
        kq.push(x.ke ? h("p", { class: "dt-z-ke" }, x.chu)
          : !x.ho ? h("div", { class: "dt-z-b toi" }, h("p", {}, x.chu), h("small", {}, hhmm(x.p)))
          : h("div", { class: "dt-z-b" }, x.ai ? av(x.ai, "nho") : h("span", { class: "dt-av nho nhom" }, chuDau(x.tenAi || k)), h("div", {}, h("b", {}, x.ai ? ten(x.ai) : x.tenAi || "Thành viên nhóm"), h("p", {}, x.chu), h("small", {}, hhmm(x.p)))));
      }
      const tin = h("div", { class: "dt-z-chat" }, ds.length ? kq : [h("small", { class: "dt-z-ngay" }, nhanNgay(L.ngay)), h("p", { class: "dt-trong" }, "Nhóm chưa có tin nhắn nào hôm nay.")]);
      thay(than, tin);
      khung.querySelector(".dt-tab")?.remove();
      requestAnimationFrame(() => { tin.scrollTop = tin.scrollHeight; });
    };
    const veChat = (than, ma) => {
      const d = D();
      luiLai = () => ve();
      khung.querySelector(".dt-dau").replaceWith(dau(ten(ma), { lui: () => ve(), cls: "z", phai: nut({ class: "dt-dau-nut", "aria-label": "Gọi", onclick: () => mo("danhba", { goi: ma }) }, icEl("goi")) }));
      khung.querySelector(".dt-tab")?.remove();
      const tin = h("div", { class: "dt-z-chat" });
      const veTin = (dangSoan = false) => {
        const ds = chatRieng().find(([m]) => m === ma)?.[1] || [];
        d.daXem["z-" + ma] = khoaCuoi(ds);
        let ngay0 = 0; const kq = [];
        for (const x of ds) {
          if (x.ngay !== ngay0) { ngay0 = x.ngay; kq.push(h("small", { class: "dt-z-ngay" }, x.ngay === L.ngay ? `Hôm nay, ${x.ngay}/10` : `${dep.ngayDayDu(x.ngay).split(" - ")[0]}, ${x.ngay}/10`)); }
          kq.push(x.ke ? h("p", { class: "dt-z-ke" }, x.chu)
            : x.ho ? h("div", { class: "dt-z-b" }, av(x.ai || ma, "nho"), h("div", {}, x.ai && x.ai !== ma ? h("b", {}, ten(x.ai)) : null, h("p", {}, x.chu), h("small", {}, hhmm(x.p))))
            : h("div", { class: "dt-z-b toi" }, h("p", {}, x.chu), h("small", {}, `${hhmm(x.p)} · Đã nhận`)));
        }
        if (!ds.length) kq.push(h("p", { class: "dt-trong" }, `Hãy gửi lời chào tới ${ten(ma)}.`));
        if (dangSoan) kq.push(h("div", { class: "dt-z-b" }, av(ma, "nho"), h("div", { class: "dt-z-soan" }, h("i"), h("i"), h("i"))));
        thay(tin, ...kq); tin.scrollTop = tin.scrollHeight;
      };
      const o = h("input", { class: "dt-z-o", type: "text", placeholder: "Tin nhắn", maxlength: "200", enterkeyhint: "send", "aria-label": "Nhập tin nhắn" });
      const gui = () => {
        const chu = o.value.trim(); if (!chu) return;
        o.value = "";
        (d.chat[ma] ||= []).push({ ho: false, chu, ngay: L.ngay, p: phut() });
        const tl = dep.g.cauBan?.(ma) || "Ok nha."; // câu đáp theo giờ, thời tiết, tính cách
        if (d.chat[ma].length > 40) d.chat[ma].splice(0, d.chat[ma].length - 40);
        am.phat("click"); veTin(true); luu();
        henMot(() => { d.chat[ma].push({ ho: true, chu: tl, ngay: L.ngay, p: phut() }); am.phat("ting"); veTin(); luu(); }, 1400);
      };
      o.addEventListener("keydown", e => { if (e.key === "Enter") { e.preventDefault(); gui(); } });
      thay(than, tin, h("div", { class: "dt-z-nhap" }, o, nut({ class: "dt-z-gui", "aria-label": "Gửi", onclick: gui }, icEl("gui"))));
      than.classList.add("chat");
      veTin(); luu();
    };
    const ve = () => {
      luiLai = null;
      const than = h("div", { class: "dt-than z" });
      const tabs = thanhTab([["tin", "Tin nhắn", "tin"], ["ban", "Danh bạ", "nhom"], ["cn", "Cá nhân", "nguoi"]], tab, id => { tab = id; ve(); });
      const noi = [dau("Zola", { cls: "z" }), than, tabs];
      if (khung.querySelector(".dt-dau")) khung.querySelectorAll(".dt-dau, .dt-than, .dt-tab").forEach(x => x.remove());
      khung.querySelector(".dt-vach").before(...noi);
      (tab === "tin" ? veDS : tab === "ban" ? veDanhBa : veCaNhan)(than);
      return noi;
    };
    return { ve: (moi) => { if (moi?.chat) { tab = "tin"; ve(); const than = khung.querySelector(".dt-than"); veChat(than, moi.chat); return; } tab = "tin"; ve(); } };
  })();

  // ======================= PHÂY-BÚC =======================
  const phayBuc = () => {
    D().daXem.pb = L.ngay; luu();
    let tab = "tin";
    const than = h("div", { class: "dt-than pb" });
    const dsNguoi = dep.NHAN_VAT.filter(n => n.ma !== L.ma && n.ma !== "cho" && n.ma !== "sieu_nhan_hong");
    const bai = () => {
      const d = D(), kq = [];
      for (const b of d.baiDang.filter(b => b.ngay > L.ngay - 4).slice().reverse()) kq.push({ key: "toi-" + b.ngay + "-" + b.p, ma: L.ma, chu: b.chu, hinh: b.hinh, ngay: b.ngay, p: b.p, thich: Math.min(60, Math.floor(((L.ngay - b.ngay) * 900 + phut() - b.p) / 9) + 1) });
      const su = dep.SU_KIEN_NGAY[L.ngay];
      if (su) kq.push({ key: "gent-" + L.ngay, trang: "G-Entertainment", chu: `${su}. Cả nhà G-Ent cùng nhau làm thật tốt nhé!`, ngay: L.ngay, p: 7 * 60, thich: 120 + L.ngay * 7 });
      kq.push({ key: "snh-" + L.ngay, ma: "sieu_nhan_hong", trang: "Siêu Nhân Hồng", chu: BAI_HONG[L.ngay % BAI_HONG.length], hinh: avatarSNH, ngay: L.ngay, p: 8 * 60 + 30, thich: Math.round((Number(L.v("nguoi_theo_doi")) || 0) * 0.02) + 40 });
      chonTheoNgay(BAI_PB, L.ngay, 5, 3).forEach((f, i) => { const ma = dsNguoi[(L.ngay * 3 + i * 7) % dsNguoi.length].ma; const [, chu] = f(ma); kq.push({ key: `pb-${L.ngay}-${i}`, ma, chu, ngay: i > 2 ? L.ngay - 1 : L.ngay, p: 8 * 60 + 40 + i * 70, thich: 12 + (chu.length % 40) + i * 3 }); });
      return kq.filter(b => b.ngay < L.ngay || b.p <= phut() + 30);
    };
    const theBai = b => {
      const d = D(); let mo_ = false;
      const ai = b.trang || ten(b.ma);
      const soThich = () => b.thich + (d.thich[b.key] ? 1 : 0);
      const dem = h("span", { class: "dt-pb-dem" }, h("i", { class: "dt-pb-like" , html: ic("thich") }), h("span", {}, String(soThich())));
      const bl = h("div", { class: "dt-pb-bl", hidden: true });
      const nutThich = nut({ class: "dt-pb-nut" + (d.thich[b.key] ? " on" : ""), onclick: e => { d.thich[b.key] = !d.thich[b.key]; if (!d.thich[b.key]) delete d.thich[b.key]; e.currentTarget.classList.toggle("on", !!d.thich[b.key]); dem.lastChild.textContent = String(soThich()); am.phat("click"); luu(); } }, icEl("thich"), "Thích");
      const soBL = 2 + bamSo(b.key) % 3;
      const nutBL = nut({ class: "dt-pb-nut", onclick: () => { mo_ = !mo_; bl.hidden = !mo_; if (mo_ && !bl.childElementCount) bl.append(...Array.from({ length: soBL }, (_, i) => { const n = dsNguoi[(bamSo(b.key) + i * 5) % dsNguoi.length]; return h("div", { class: "dt-pb-bl-dong" }, av(n.ma, "nho"), h("div", {}, h("b", {}, ten(n.ma)), h("p", {}, BINH_LUAN[(bamSo(b.key) + i) % BINH_LUAN.length]))); })); } }, icEl("binh_luan"), "Bình luận");
      const nutCS = nut({ class: "dt-pb-nut", onclick: () => bao("Đã chia sẻ lên trang cá nhân") }, icEl("chia_se"), "Chia sẻ");
      return h("article", { class: "dt-pb-bai" },
        h("div", { class: "dt-pb-dau" }, b.ma ? av(b.ma) : h("span", { class: "dt-av", style: "--av:#e8702a" }, "G"), h("div", {}, h("b", {}, ai), h("small", {}, `${thoiGian(b.ngay, b.p)} · Công khai`))),
        h("p", { class: "dt-pb-chu" }, b.chu),
        b.hinh ? h("img", { class: "dt-pb-hinh", src: b.hinh, alt: "" }) : null,
        h("div", { class: "dt-pb-so" }, dem, h("span", {}, `${soBL} bình luận`)),
        h("div", { class: "dt-pb-hd" }, nutThich, nutBL, nutCS), bl);
    };
    const veTin = () => {
      const o = h("textarea", { class: "dt-pb-o", rows: "3", maxlength: "300", placeholder: `${toi()} ơi, bạn đang nghĩ gì?` });
      let kemAnh = false;
      const nutAnh = anh.length ? nut({ class: "dt-pb-kem", onclick: e => { kemAnh = !kemAnh; e.currentTarget.classList.toggle("on", kemAnh); } }, icEl("anh"), "Ảnh mới nhất") : null;
      const soan = h("div", { class: "dt-pb-soan", hidden: true }, o, h("div", { class: "dt-pb-soan-chan" }, nutAnh || h("span"), nut({ class: "dt-pb-dang", onclick: () => {
        const chu = o.value.trim(); if (!chu && !kemAnh) return;
        D().baiDang.push({ chu, ngay: L.ngay, p: phut(), hinh: kemAnh ? anh.at(-1) : null }); if (D().baiDang.length > 12) D().baiDang.shift();
        luu(); am.phat("ting"); veTin(); bao("Đã đăng");
      } }, "Đăng")));
      thay(than, 
        h("div", { class: "dt-pb-the dt-pb-hop" }, av(L.ma), nut({ class: "dt-pb-hoi", onclick: () => { soan.hidden = false; o.focus(); } }, "Bạn đang nghĩ gì?"), anh.length ? nut({ class: "dt-pb-hop-anh", "aria-label": "Đăng ảnh", onclick: () => { soan.hidden = false; if (!kemAnh) nutAnh?.click(); o.focus(); } }, icEl("anh")) : null),
        soan, ...bai().map(theBai));
    };
    const veThongBao = () => {
      const d = D(), kq = [];
      for (const b of d.baiDang.slice().reverse()) kq.push([dsNguoi[bamSo(b.chu) % dsNguoi.length].ma, `và ${Math.max(1, Math.floor(((L.ngay - b.ngay) * 900 + phut() - b.p) / 9))} người khác đã thích bài viết của bạn.`, b.ngay, b.p]);
      if (dep.SU_KIEN_NGAY[L.ngay]) kq.push([null, `G-Entertainment có sự kiện hôm nay: ${dep.SU_KIEN_NGAY[L.ngay]}.`, L.ngay, 7 * 60]);
      kq.push(["sieu_nhan_hong", "vừa đăng một bài viết mới.", L.ngay, 8 * 60 + 30]);
      const sn = dsNguoi[(L.ngay * 5) % dsNguoi.length];
      kq.push([sn.ma, "có sinh nhật hôm nay. Gửi lời chúc nhé!", L.ngay, 6 * 60]);
      thay(than, h("div", { class: "dt-pb-the dt-pb-tb" }, h("b", { class: "dt-pb-tb-tieu" }, "Thông báo"), kq.map(([ma, chu, ngay, p]) => h("div", { class: "dt-pb-tb-dong" }, ma ? av(ma) : h("span", { class: "dt-av", style: "--av:#e8702a" }, "G"), h("div", {}, h("p", {}, ma ? h("b", {}, ten(ma) + " ") : null, chu), h("small", {}, thoiGian(ngay, p)))))));
    };
    const ve = () => { (tab === "tin" ? veTin : veThongBao)(); khung.querySelectorAll(".dt-pb-tab button").forEach(b => b.classList.toggle("on", b.dataset.tab === tab)); than.scrollTop = 0; };
    henMot(ve, 0);
    return [h("header", { class: "dt-dau pb" }, nut({ class: "dt-lui", "aria-label": "Quay lại", onclick: () => mo("chinh") }, icEl("lui")), h("b", { class: "dt-pb-logo" }, "phây-búc"), nut({ class: "dt-dau-nut tron", "aria-label": "Zola", onclick: () => mo("zola") }, icEl("tin"))),
      h("nav", { class: "dt-pb-tab" }, [["tin", "nha", "Bảng tin"], ["tb", "chuong", "Thông báo"]].map(([id, icon, chu]) => nut({ "data-tab": id, "aria-label": chu, onclick: () => { tab = id; ve(); } }, icEl(icon), h("small", {}, chu)))),
      than];
  };

  // ======================= DIU-TÚP =======================
  const diuTup = () => {
    D().daXem.diutup = L.ngay; luu();
    const d = D();
    let sapXep = "moi";
    const than = h("div", { class: "dt-than yt" });
    const td = () => Number(L.v("nguoi_theo_doi")) || 0;
    const dangKy = () => Math.round(td() * 0.42) + (d.dkYT ? 1 : 0);
    const thoiLuong = {};
    const dsClip = () => { const ds = clipDaRa(); return sapXep === "pho_bien" ? ds.slice().sort((a, b) => luotXem(b) - luotXem(a)) : ds; };
    const anhNho = c => {
      const v = h("video", { src: `${gocURL}video/sieu-nhan-hong-${c.so}.mp4#t=1.5`, preload: "metadata", muted: true, playsinline: true, "aria-hidden": "true" });
      v.muted = true;
      const tg = h("small", { class: "dt-yt-tg" }, thoiLuong[c.so] || "");
      v.addEventListener("loadedmetadata", () => { if (isFinite(v.duration)) { thoiLuong[c.so] = phutGiay(v.duration); tg.textContent = thoiLuong[c.so]; } });
      don.push(() => { v.removeAttribute("src"); v.load(); });
      return h("div", { class: "dt-yt-anh" }, h("div", { class: "dt-yt-nen", style: `background-image:url(${avatarSNH})` }), v, tg);
    };
    const phutGiay = s => `${Math.floor(s / 60)}:${String(Math.floor(s % 60)).padStart(2, "0")}`;
    const moTa = c => `${gon(luotXem(c))} lượt xem · ${c.ngay === L.ngay ? "hôm nay" : `${L.ngay - c.ngay} ngày trước`}`;
    const veDS = () => {
      donSachVideo();
      luiLai = null;
      const ds = dsClip();
      thay(than, 
        h("div", { class: "dt-yt-chip" }, [["moi", "Mới tải lên"], ["pho_bien", "Phổ biến"]].map(([id, chu]) => nut({ class: id === sapXep ? "on" : "", onclick: () => { sapXep = id; veDS(); } }, chu))),
        ds.map(c => nut({ class: "dt-yt-the", onclick: () => xem(c) }, anhNho(c),
          h("div", { class: "dt-yt-tt" }, h("img", { class: "dt-av anh", src: avatarSNH, alt: "" }), h("div", {}, h("b", {}, c.yt), h("small", {}, `Siêu Nhân Hồng Official · ${moTa(c)}`))))));
      than.scrollTop = 0;
    };
    const veKenh = () => {
      donSachVideo(); luiLai = () => veDS();
      const ds = clipDaRa();
      const nutDK = nut({ class: "dt-yt-dk" + (d.dkYT ? " da" : ""), onclick: e => { d.dkYT = !d.dkYT; luu(); e.currentTarget.classList.toggle("da", !!d.dkYT); e.currentTarget.textContent = d.dkYT ? "Đã đăng ký" : "Đăng ký"; khung.querySelector(".dt-yt-kenh small").textContent = `@sieunhanhong · ${gon(dangKy())} người đăng ký · ${ds.length} video`; am.phat("click"); } }, d.dkYT ? "Đã đăng ký" : "Đăng ký");
      thay(than, h("div", { class: "dt-yt-bia" }),
        h("div", { class: "dt-yt-kenh" }, h("img", { class: "dt-av anh to", src: avatarSNH, alt: "" }), h("b", {}, "Siêu Nhân Hồng Official"), h("small", {}, `@sieunhanhong · ${gon(dangKy())} người đăng ký · ${ds.length} video`), h("p", {}, "Hồng không phải màu, Hồng là thái độ. Hẹn cả nhà ở Đại Nhạc Hội Siêu Nhân 31/10."), nutDK),
        h("small", { class: "dt-yt-nhan" }, "Video"),
        ds.map(c => nut({ class: "dt-yt-dong", onclick: () => xem(c) }, anhNho(c), h("div", {}, h("b", {}, c.yt), h("small", {}, moTa(c))))));
      than.scrollTop = 0;
    };
    let tatV = null;
    const donSachVideo = () => { tatV?.(); tatV = null; };
    don.push(donSachVideo);
    const xem = c => {
      donSachVideo();
      luiLai = () => veDS();
      const v = h("video", { class: "dt-yt-v", src: videoCoTieng(c.so), playsinline: true, preload: "none" });
      v.playsInline = true;
      const nutPlay = nut({ class: "dt-yt-play", "aria-label": "Phát / dừng" }, icEl("pause"));
      const thanh = h("input", { class: "dt-yt-thanh", type: "range", min: "0", max: "1000", value: "0", "aria-label": "Tua video" });
      const tg = h("small", { class: "dt-yt-gio" }, "0:00");
      const nutLoa = nut({ class: "dt-yt-loa", "aria-label": "Tắt / bật tiếng" }, icEl("loa"));
      const lop_ = h("div", { class: "dt-yt-dk-lop" }, nutPlay, h("div", { class: "dt-yt-duoi" }, tg, thanh, nutLoa));
      const capNhat = () => { thay(nutPlay, icEl(v.paused ? "play" : "pause")); thay(nutLoa, icEl(v.muted ? "tat_loa" : "loa")); nutLoa.setAttribute("aria-pressed", String(!v.muted)); lop_.classList.toggle("dung", v.paused); };
      const choi = () => phatVideo(v, capNhat);
      nutPlay.onclick = e => { e.stopPropagation(); v.paused ? choi() : v.pause(); };
      nutLoa.onclick = e => { e.stopPropagation(); if (!doiTieng(v)) bao("Âm thanh đang tắt trong Cài đặt"); else if (v.paused) choi(); capNhat(); };
      const boTieng = ganTiengVideo(v, capNhat);
      v.addEventListener("play", capNhat); v.addEventListener("pause", capNhat); v.addEventListener("volumechange", capNhat);
      v.addEventListener("timeupdate", () => { if (isFinite(v.duration) && v.duration) { thanh.value = String(Math.round(v.currentTime / v.duration * 1000)); tg.textContent = `${phutGiay(v.currentTime)} / ${phutGiay(v.duration)}`; } });
      v.addEventListener("ended", () => { const ds = clipDaRa(), i = ds.indexOf(c); if (ds[i + 1]) xem(ds[i + 1]); });
      thanh.addEventListener("input", () => { if (isFinite(v.duration)) v.currentTime = Number(thanh.value) / 1000 * v.duration; });
      tatV = () => { boTieng(); v.pause(); v.removeAttribute("src"); v.load(); phimUng = null; };
      phimUng = e => e.code === "Space" || e.code === "KeyK" ? (v.paused ? choi() : v.pause(), true) : e.code === "KeyM" ? (doiTieng(v), capNhat(), true) : e.code === "ArrowRight" ? (v.currentTime += 5, true) : e.code === "ArrowLeft" ? (v.currentTime = Math.max(0, v.currentTime - 5), true) : false;
      const khung_ = h("div", { class: "dt-yt-khung", onclick: () => lop_.classList.toggle("an") }, v, lop_);
      const soThich = Math.round(luotXem(c) * 0.06);
      const nThich = nut({ class: "dt-yt-vien" + (d["yt" + c.so] === 1 ? " on" : ""), onclick: () => { d["yt" + c.so] = d["yt" + c.so] === 1 ? 0 : 1; luu(); xemLai(); } }, icEl("thich"), gon(soThich + (d["yt" + c.so] === 1 ? 1 : 0)));
      const nKhong = nut({ class: "dt-yt-vien" + (d["yt" + c.so] === -1 ? " on" : ""), "aria-label": "Không thích", onclick: () => { d["yt" + c.so] = d["yt" + c.so] === -1 ? 0 : -1; luu(); xemLai(); } }, icEl("khong_thich"));
      const xemLai = () => { nThich.className = "dt-yt-vien" + (d["yt" + c.so] === 1 ? " on" : ""); nThich.lastChild.textContent = gon(soThich + (d["yt" + c.so] === 1 ? 1 : 0)); nKhong.className = "dt-yt-vien" + (d["yt" + c.so] === -1 ? " on" : ""); };
      const nutDK = nut({ class: "dt-yt-dk" + (d.dkYT ? " da" : ""), onclick: e => { d.dkYT = !d.dkYT; luu(); e.currentTarget.classList.toggle("da", !!d.dkYT); e.currentTarget.textContent = d.dkYT ? "Đã đăng ký" : "Đăng ký"; khung.querySelector(".dt-yt-kenh-dong small").textContent = `${gon(dangKy())} người đăng ký`; am.phat("click"); } }, d.dkYT ? "Đã đăng ký" : "Đăng ký");
      const n = dep.NHAN_VAT.filter(x => x.ma !== L.ma && x.ma !== "cho" && x.ma !== "sieu_nhan_hong");
      const bl = n[(c.so * 3 + L.ngay) % n.length];
      const tiep = clipDaRa().filter(x => x !== c);
      thay(than, khung_,
        h("div", { class: "dt-yt-ct" }, h("b", { class: "dt-yt-tieu" }, c.yt), h("small", {}, moTa(c)),
          h("div", { class: "dt-yt-kenh-dong" }, h("img", { class: "dt-av anh", src: avatarSNH, alt: "" }), nut({ class: "dt-yt-ten-kenh", onclick: () => veKenh() }, h("b", {}, "Siêu Nhân Hồng Official"), h("small", {}, `${gon(dangKy())} người đăng ký`)), nutDK),
          h("div", { class: "dt-yt-hd" }, h("div", { class: "dt-yt-cap" }, nThich, nKhong), nut({ class: "dt-yt-vien", onclick: () => bao("Đã sao chép đường liên kết") }, icEl("chia_se"), "Chia sẻ"), nut({ class: "dt-yt-vien", onclick: () => bao("Đã lưu vào danh sách Xem sau") }, icEl("dang_ky"), "Lưu")),
          h("div", { class: "dt-yt-bl" }, h("b", {}, `Bình luận ${gon(Math.round(luotXem(c) * 0.004))}`), h("div", {}, av(bl.ma, "nho"), h("p", {}, `${BINH_LUAN[(c.so + L.ngay) % BINH_LUAN.length]}. Hồng ơi cố lên!`)))),
        tiep.length ? h("small", { class: "dt-yt-nhan" }, "Tiếp theo") : null,
        tiep.map(x => nut({ class: "dt-yt-dong", onclick: () => xem(x) }, anhNho(x), h("div", {}, h("b", {}, x.yt), h("small", {}, `Siêu Nhân Hồng Official · ${moTa(x)}`)))));
      than.scrollTop = 0;
      capNhat(); choi(); am.phat("click");
    };
    henMot(veDS, 0);
    const tabs = h("nav", { class: "dt-tab yt" },
      nut({ class: "on", onclick: () => veDS() }, icEl("nha"), h("small", {}, "Trang chủ")),
      nut({ onclick: () => mo("toptop") }, icEl("play"), h("small", {}, "Shorts")),
      nut({ onclick: () => veKenh() }, h("img", { class: "dt-av anh mini", src: avatarSNH, alt: "" }), h("small", {}, "Kênh")));
    return [h("header", { class: "dt-dau yt" }, nut({ class: "dt-lui", "aria-label": "Quay lại", onclick: () => (luiLai || (() => mo("chinh")))() }, icEl("lui")), h("b", { class: "dt-yt-logo", html: `<svg viewBox="0 0 28 20" aria-hidden="true"><rect width="28" height="20" rx="6" fill="#ff0033"/><path d="M11 6v8l7-4z" fill="#fff"/></svg><span>Diu-túp</span>` }), h("span", { class: "dt-dau-trong" })), than, tabs];
  };

  // ======================= TÓP-TÓP (giữ thiết kế, nút vẽ bằng SVG) =======================
  const topTop = () => {
    D().daXem.toptop = L.ngay; luu();
    const hienTai = Number(L.v("nguoi_theo_doi")) || 0;
    const ds = clipDaRa();
    const xem = luotXem;
    const d = D();
    const than = h("div", { class: "dt-than toi tt-than" });
    const tab = (chu, on, f) => nut({ class: "tt-tab" + (on ? " on" : ""), onclick: f }, chu);
    let tatV = null, vuaVuot = false; don.push(() => tatV?.());
    const veFeed = (i = 0) => {
      tatV?.(); tatV = null; luiLai = null;
      const c = ds[i];
      const v = h("video", { class: "tt-vid", src: videoCoTieng(c.so), playsinline: true, loop: true, preload: "none" });
      v.playsInline = true;
      const veTieng = () => { if (tieng) { thay(tieng, icEl(v.muted ? "tat_loa" : "loa"), h("small", {}, v.muted ? "Tắt tiếng" : "Có tiếng")); tieng.setAttribute("aria-pressed", String(!v.muted)); } };
      let tieng = null;
      const boTieng = ganTiengVideo(v, veTieng);
      const choi = () => phatVideo(v, veTieng);
      tatV = () => { boTieng(); v.pause(); v.removeAttribute("src"); v.load(); };
      const k = "tt" + c.so;
      const soTim = () => dep.so(Math.round(xem(c) * 0.12) + (d[k] ? 1 : 0));
      const tim = nut({ class: "tt-nut" + (d[k] ? " on" : ""), "aria-label": "Thích", onclick: e => { d[k] = !d[k]; luu(); e.currentTarget.classList.toggle("on", !!d[k]); e.currentTarget.querySelector("small").textContent = soTim(); am.phat("click"); } }, icEl("tim_yeu", "tim"), h("small", {}, soTim()));
      tieng = nut({ class: "tt-nut tt-tieng", "aria-label": "Bật / tắt tiếng", onclick: () => { if (!doiTieng(v)) bao("Âm thanh đang tắt trong Cài đặt"); else if (v.paused) choi(); veTieng(); } });
      const doi = dd => { const j = (i + dd + ds.length) % ds.length; if (j !== i) { am.phat("click"); veFeed(j); } };
      const sheet = h("div", { class: "tt-bl", hidden: true });
      const nguoi = dep.NHAN_VAT.filter(x => x.ma !== "sieu_nhan_hong" && x.ma !== "cho");
      const moBL = () => {
        sheet.hidden = false;
        thay(sheet, h("div", { class: "tt-bl-dau" }, h("b", {}, `${dep.so(Math.round(xem(c) * 0.008))} bình luận`), nut({ class: "tt-bl-dong", "aria-label": "Đóng", onclick: () => { sheet.hidden = true; } }, icEl("x"))),
          h("div", { class: "tt-bl-ds" }, Array.from({ length: 5 }, (_, j) => { const n = nguoi[(c.so * 5 + j * 3 + L.ngay) % nguoi.length]; return h("div", { class: "tt-bl-dong-chu" }, av(n.ma, "nho"), h("div", {}, h("small", {}, ten(n.ma)), h("p", {}, BINH_LUAN[(c.so + j * 3) % BINH_LUAN.length]))); })));
      };
      phimUng = e => e.code === "ArrowDown" ? (doi(1), true) : e.code === "ArrowUp" ? (doi(-1), true) : e.code === "Space" ? (v.paused ? choi() : v.pause(), true) : e.code === "KeyM" ? (doiTieng(v), veTieng(), true) : false;
      let y0 = null;
      thay(than, 
        h("div", { class: "tt-feed", onpointerdown: e => { if (!e.target.closest("button, .tt-bl")) y0 = e.clientY; }, onpointerup: e => { vuaVuot = y0 != null && Math.abs(e.clientY - y0) > 40; if (vuaVuot) doi(e.clientY < y0 ? 1 : -1); y0 = null; }, onwheel: e => { if (!e.target.closest(".tt-bl") && Math.abs(e.deltaY) > 20) doi(e.deltaY > 0 ? 1 : -1); } },
          v,
          h("div", { class: "tt-tren" }, tab("Đang theo dõi", false, () => veFeed(0)), tab("Dành cho bạn", true, () => {}), tab("Hồ sơ", false, () => veHoSo())),
          h("div", { class: "tt-phai" },
            nut({ class: "tt-av-nut", "aria-label": "Hồ sơ @sieunhanhong", onclick: () => veHoSo() }, h("img", { class: "tt-av tt-anh", src: avatarSNH, alt: "Siêu Nhân Hồng" })),
            tim,
            nut({ class: "tt-nut", "aria-label": "Bình luận", onclick: moBL }, icEl("binh_luan"), h("small", {}, dep.so(Math.round(xem(c) * 0.008)))),
            nut({ class: "tt-nut", "aria-label": "Chia sẻ", onclick: () => bao("Đã sao chép đường liên kết") }, icEl("chia_se"), h("small", {}, dep.so(Math.round(xem(c) * 0.004)))),
            tieng),
          h("div", { class: "tt-duoi" }, h("b", {}, "@sieunhanhong"), h("p", {}, c.ten), h("small", {}, `${dep.so(xem(c))} lượt xem · ${c.ngay === L.ngay ? "hôm nay" : `${L.ngay - c.ngay} ngày trước`}`)),
          h("div", { class: "tt-chuyen" },
            nut({ "aria-label": "Clip trước", onclick: () => doi(-1) }, icEl("len")),
            h("small", {}, `${i + 1}/${ds.length}`),
            nut({ "aria-label": "Clip sau", onclick: () => doi(1) }, icEl("xuong"))),
          sheet));
      // chạm vào clip: dừng / phát tiếp (vuốt lên xuống thì đổi clip)
      v.addEventListener("click", () => { if (vuaVuot) return; v.paused ? choi() : v.pause(); });
      v.addEventListener("pause", () => than.classList.toggle("tt-dung", v.paused)); v.addEventListener("play", () => than.classList.remove("tt-dung"));
      veTieng(); choi();
    };
    const veHoSo = () => {
      tatV?.(); tatV = null; luiLai = () => veFeed(0);
      const ls = L.lichSuTheoDoi || {}, dsTd = Array.from({ length: L.ngay }, (_, i) => ls[i + 1] ?? null); dsTd[L.ngay - 1] = hienTai;
      const W = 300, H = 140, max = Math.max(dep.MUC_TIEU, ...dsTd.filter(Boolean));
      const diem = dsTd.map((v, i) => v == null ? null : [8 + (i / 30) * (W - 16), H - 6 - (v / max) * (H - 12)]).filter(Boolean);
      const yMuc = H - 6 - dep.MUC_TIEU / max * (H - 12);
      const bieu = `<svg viewBox="0 0 ${W} ${H}" preserveAspectRatio="none" class="dt-bieu"><line x1="0" x2="${W}" y1="${yMuc}" y2="${yMuc}" stroke="#fe2c55" stroke-dasharray="4 4"/><polyline fill="none" stroke="#25f4ee" stroke-width="3" points="${diem.map(p => p.join(",")).join(" ")}"/></svg>`;
      const luoi = ds.map((c, i) => { const vv = h("video", { src: `${gocURL}video/sieu-nhan-hong-${c.so}.mp4#t=1`, preload: "metadata", muted: true, playsinline: true }); vv.muted = true; return [vv, nut({ class: "dt-clip tt-o", onclick: () => veFeed(i) }, vv, h("small", {}, h("i", { html: ic("play") }), dep.so(xem(c))))]; });
      tatV = () => { for (const [vv] of luoi) { vv.removeAttribute("src"); vv.load(); } };
      thay(than, 
        h("div", { class: "tt-tren tinh" }, tab("Dành cho bạn", false, () => veFeed(0)), tab("Hồ sơ", true, () => {})),
        h("div", { class: "dt-hoso" }, h("img", { class: "tt-anh to", src: avatarSNH, alt: "Siêu Nhân Hồng" }), h("b", {}, "@sieunhanhong"), h("small", {}, "Siêu Nhân Hồng · Hồng không phải màu, Hồng là thái độ"),
          h("div", { class: "dt-3so" }, h("div", {}, h("b", {}, dep.so(hienTai)), h("small", {}, "Follower")), h("div", {}, h("b", {}, dep.so(Math.round(hienTai * 6.3))), h("small", {}, "Lượt thích")), h("div", {}, h("b", {}, String(ds.length)), h("small", {}, "Video"))),
          h("small", { class: "tt-muc" }, hienTai >= dep.MUC_TIEU ? "Đã cán mốc 1 triệu người theo dõi!" : `Còn ${dep.so(dep.MUC_TIEU - hienTai)} người nữa là chạm mốc 1 triệu · Đại Nhạc Hội 31/10`)),
        h("div", { class: "tt-bieu", html: bieu }), h("div", { class: "dt-chu-thich" }, h("span", {}, "1/10"), h("span", {}, `Mục tiêu ${dep.so(dep.MUC_TIEU)}`), h("span", {}, "31/10")),
        h("div", { class: "dt-luoi-clip" }, luoi.map(x => x[1])));
      than.scrollTop = 0;
    };
    veFeed(0);
    return [dau("Tóp-tóp", { cls: "toi" }), than];
  };

  // ======================= XE ÔM HÓNG =======================
  const xeOm = () => {
    const d = D();
    let chon = null, dungMa = false;
    const than = h("div", { class: "dt-than xo" });
    const cv = h("canvas", { class: "dt-xo-bd", width: 700, height: 360 });
    const veBD = () => { try { const r = cv.getBoundingClientRect(), tl = devicePixelRatio || 1; if (r.width) { cv.width = Math.round(r.width * tl); cv.height = Math.round(r.height * tl); } veBanDo(cv, { g: dep.g, diem: dep.diemXeOm().filter(x => x.x != null), mucTieu: chon ? { x: chon.x, z: chon.z } : null, oNgoai: dep.g.oNgoai?.(), tl: cv.width / Math.max(1, r.width || 350) * 1, nhin: dep.g.oNgoai?.() ? null : { x: dep.g.p.x, z: dep.g.p.z + 6, nua: 42 } }); } catch {} };
    const ve = () => {
      const ds = dep.diemXeOm(), ban = dangBan(), tienCo = tien();
      const gan = ds.find(x => x.oDay);
      const giaThat = x => dungMa ? Math.round(x.gia * 0.9 / 1000) * 1000 : x.gia;
      const lyDo = x => ban ? "Đang bận, chưa đi được" : x.oDay ? "Bạn đang ở đây" : giaThat(x) > tienCo ? "Số dư MôMô không đủ" : null;
      const dsEl = ds.map(x => nut({ class: "dt-xo-dong" + (chon?.ten === x.ten ? " chon" : ""), disabled: !!x.oDay, onclick: () => { chon = x; ve(); } },
        h("span", { class: "dt-xo-ghim" + (x.oDay ? " day" : "") }, icEl("ghim")), h("div", {}, h("b", {}, x.ten), h("small", {}, x.oDay ? "Bạn đang ở đây" : `${(Math.round((dep.g.oNgoai?.() ? 12 : Math.max(0.3, (x.phut - 4) * 0.6)) * 10) / 10).toLocaleString("vi-VN")} km · ${x.phut} phút`)),
        x.oDay ? null : h("span", { class: "dt-xo-gia" }, dep.vnd(giaThat(x)))));
      const conMa = !d.daDungMa;
      const sheet = chon ? (() => { const x = ds.find(y => y.ten === chon.ten) || chon, ly = lyDo(x); return h("div", { class: "dt-xo-sheet" },
        h("div", { class: "dt-xo-dv" }, h("span", { class: "dt-xo-xe" }, icEl("xe")), h("div", {}, h("b", {}, "Xe Ôm Hóng Bike"), h("small", {}, `Tới ${x.ten} · ${x.phut} phút`)), h("b", {}, dep.vnd(giaThat(x)))),
        h("div", { class: "dt-xo-tt" }, h("span", {}, icEl("vi", "mau-hong"), `Ví MôMô · ${dep.vnd(tienCo)}`),
          conMa ? nut({ class: "dt-xo-ma" + (dungMa ? " on" : ""), onclick: () => { dungMa = !dungMa; ve(); } }, dungMa ? "HONGDI −10%" : "Dùng mã HONGDI") : h("small", {}, "Đã dùng mã HONGDI")),
        nut({ class: "dt-xo-dat", disabled: !!ly, onclick: () => { if (lyDo(x)) return; if (dungMa) d.daDungMa = true; luu(); const gia = giaThat(x); dong(); dep.diXeOm({ ...x, gia }); } }, ly || `Đặt xe · ${dep.vnd(giaThat(x))}`)); })() : null;
      thay(than, h("div", { class: "dt-xo-mapw" }, cv, h("div", { class: "dt-xo-vitri" }, icEl("dinh_vi"), h("span", {}, dep.g.oNgoai?.() ? "Bạn đang ở ngoài Quận Hóng" : gan ? `Bạn đang ở ${gan.ten}` : "Vị trí hiện tại của bạn"))),
        h("div", { class: "dt-xo-hop" }, h("b", {}, "Bạn muốn đi đâu?"), h("div", { class: "dt-xo-ds" }, dsEl)), sheet);
      requestAnimationFrame(veBD);
    };
    henMot(ve, 0); henLap(veBD, 1000);
    return [dau("Xe Ôm Hóng", { cls: "xo" }), than];
  };

  // ======================= BẢN ĐỒ =======================
  const banDo = () => {
    const cv = h("canvas", { class: "dt-bando", width: 700, height: 700 });
    let nhin = null, kq = null, chon = null;
    const coDinh = () => dep.g.oNgoai?.() ? { x: 0, z: 15, nua: 150 } : { x: Math.max(-70, Math.min(70, dep.g.p.x)), z: Math.max(-20, Math.min(50, dep.g.p.z)), nua: 55 };
    const the = h("div", { class: "dt-bd-the", hidden: true });
    const ve = () => {
      try {
        const r = cv.getBoundingClientRect(), tl = devicePixelRatio || 1;
        if (r.width) { const w = Math.round(r.width * tl), hh = Math.round(r.height * tl); if (cv.width !== w || cv.height !== hh) { cv.width = w; cv.height = hh; } }
        kq = veBanDo(cv, { g: dep.g, diem: dep.diemXeOm().filter(d => d.x != null), mucTieu: dep.g.mucTieu?.k, viec: dep.viecVat?.(), oNgoai: dep.g.oNgoai?.(), nhin: nhin || coDinh(), tl: tl * 1.1 });
      } catch {}
    };
    // kéo để di chuyển, chụm hai ngón / lăn chuột để phóng to, bấm vào điểm để xem
    const ngon = new Map(); let keo = null, chum = null, diChuyen = 0;
    const dangNhin = () => (nhin ||= { ...coDinh() });
    const thu = (k) => { const n = dangNhin(); n.nua = Math.max(22, Math.min(170, n.nua * k)); ve(); };
    cv.addEventListener("pointerdown", e => { cv.setPointerCapture?.(e.pointerId); ngon.set(e.pointerId, [e.clientX, e.clientY]); diChuyen = 0; if (ngon.size === 1) keo = [e.clientX, e.clientY]; else { const [a, b] = [...ngon.values()]; chum = Math.hypot(a[0] - b[0], a[1] - b[1]); keo = null; } });
    cv.addEventListener("pointermove", e => {
      if (!ngon.has(e.pointerId)) return; ngon.set(e.pointerId, [e.clientX, e.clientY]);
      const r = cv.getBoundingClientRect(), n = dangNhin(), mPx = (2 * n.nua) / Math.min(r.width, r.height);
      if (ngon.size >= 2 && chum) { const [a, b] = [...ngon.values()], d = Math.hypot(a[0] - b[0], a[1] - b[1]); if (d > 0) { n.nua = Math.max(22, Math.min(170, n.nua * chum / d)); chum = d; diChuyen += 10; ve(); } return; }
      if (keo) { const dx = e.clientX - keo[0], dy = e.clientY - keo[1]; diChuyen += Math.abs(dx) + Math.abs(dy); n.x = Math.max(-150, Math.min(170, n.x - dx * mPx)); n.z = Math.max(-150, Math.min(170, n.z - dy * mPx)); keo = [e.clientX, e.clientY]; ve(); }
    });
    const tha = e => {
      ngon.delete(e.pointerId); if (ngon.size < 2) chum = null;
      if (!ngon.size && keo && diChuyen < 6 && kq) {
        const r = cv.getBoundingClientRect(), tl = cv.width / r.width, x = (e.clientX - r.left) * tl, y = (e.clientY - r.top) * tl;
        const ds = dep.diemXeOm().filter(d => d.x != null).map(d => [d, Math.hypot(kq.px(d.x) - x, kq.pz(d.z) - y)]).sort((a, b) => a[1] - b[1]);
        chon = ds[0] && ds[0][1] < 26 * tl ? ds[0][0] : null; veThe();
      }
      if (!ngon.size) keo = null;
    };
    cv.addEventListener("pointerup", tha); cv.addEventListener("pointercancel", tha);
    cv.addEventListener("wheel", e => { e.preventDefault(); thu(e.deltaY > 0 ? 1.15 : 0.87); }, { passive: false });
    const veThe = () => {
      the.hidden = !chon; if (!chon) return;
      thay(the, h("div", {}, h("b", {}, chon.ten), h("small", {}, chon.oDay ? "Bạn đang ở đây" : `Khoảng ${chon.phut} phút đi xe · ${dep.vnd(chon.gia)}`)),
        chon.oDay ? null : nut({ class: "dt-bd-di", onclick: () => mo("xeom") }, icEl("xe"), "Gọi xe"), nut({ class: "dt-bd-x", "aria-label": "Đóng", onclick: () => { chon = null; veThe(); } }, icEl("x")));
    };
    henMot(ve, 0); henLap(ve, 500);
    return [h("div", { class: "dt-than bd" }, cv,
      h("div", { class: "dt-bd-tren" }, nut({ class: "dt-bd-lui", "aria-label": "Quay lại", onclick: () => mo("chinh") }, icEl("lui")), h("div", { class: "dt-bd-tim" }, icEl("ghim", "mau-do"), h("span", {}, dep.g.oNgoai?.() ? "Bạn đang ở ngoài khu phố này" : "Quận Hóng, Thành Phố Ước Mơ"))),
      h("div", { class: "dt-bd-nut" }, nut({ "aria-label": "Phóng to", onclick: () => thu(0.75) }, icEl("cong")), nut({ "aria-label": "Thu nhỏ", onclick: () => thu(1.33) }, h("i", { class: "dt-i", html: `<svg class="ic" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.9" stroke-linecap="round"><path d="M5 12h14"/></svg>` }))),
      nut({ class: "dt-bd-ve", "aria-label": "Về vị trí của bạn", onclick: () => { nhin = null; ve(); } }, icEl("dinh_vi")),
      the,
      h("div", { class: "dt-chu-thich" }, h("span", { class: "c1" }, "Bạn"), h("span", { class: "c2" }, "Việc tiếp theo"), h("span", { class: "c3" }, "Điểm xe ôm"), h("span", { class: "c4" }, "Việc vặt")))];
  };

  // ======================= MÔMÔ =======================
  const moMo = () => {
    const d = D();
    const than = h("div", { class: "dt-than mm" });
    const loai = t => /^Xe Ôm|xe buýt/i.test(t) ? ["xe", "#00a046"] : /^Sốp-pi/.test(t) ? ["gio_hang", "#ee4d2d"] : /Lương|gửi lại|Hoàn|thưởng/i.test(t) ? ["nap", "#34c759"] : ["vi", "#a50064"];
    const ve = (thongKe = false) => {
      const gd = (L.giaoDich || []).slice().reverse();
      const chi = gd.filter(g => g.so < 0).reduce((s, g) => s - g.so, 0), thu = gd.filter(g => g.so > 0).reduce((s, g) => s + g.so, 0);
      const an = !!d.anSoDu;
      const nhom = new Map(); for (const g of gd) { const k = g.ngay === L.ngay ? "Hôm nay" : g.ngay === L.ngay - 1 ? "Hôm qua" : `Ngày ${g.ngay}/10`; if (!nhom.has(k)) nhom.set(k, []); nhom.get(k).push(g); }
      const theoLoai = {}; for (const g of gd) if (g.so < 0) { const k = /^Xe Ôm|xe buýt/i.test(g.ten) ? "Đi lại" : /^Sốp-pi/.test(g.ten) ? "Mua sắm" : "Ăn uống, khác"; theoLoai[k] = (theoLoai[k] || 0) - g.so; }
      thay(than, 
        h("div", { class: "dt-mm-the" }, h("div", { class: "dt-mm-the-dau" }, h("small", {}, "Số dư ví"), nut({ class: "dt-mm-mat", "aria-label": an ? "Hiện số dư" : "Ẩn số dư", onclick: () => { d.anSoDu = !an; luu(); ve(thongKe); } }, icEl(an ? "mat_tat" : "mat"))),
          h("b", {}, an ? "******đ" : dep.vnd(tien())), h("span", {}, L.ngay < 12 ? "Lương về ngày 12/10 (trễ 2 ngày)" : "Lương tháng 10 đã về")),
        h("div", { class: "dt-mm-luoi" },
          nut({ onclick: () => mo("xeom") }, h("span", { style: "--m:#00a046" }, icEl("xe")), "Xe Ôm"),
          nut({ onclick: () => mo("soppi") }, h("span", { style: "--m:#ee4d2d" }, icEl("gio_hang")), "Sốp-pi"),
          nut({ class: thongKe ? "on" : "", onclick: () => ve(!thongKe) }, h("span", { style: "--m:#1f6fd1" }, icEl("thong_ke")), "Thống kê"),
          nut({ class: !thongKe ? "on" : "", onclick: () => ve(false) }, h("span", { style: "--m:#a50064" }, icEl("lich_su")), "Lịch sử")),
        thongKe ? h("div", { class: "dt-mm-tk" }, h("b", {}, "Tháng 10/2026"),
          h("div", { class: "dt-mm-tk-2" }, h("div", {}, h("small", {}, "Tổng chi"), h("b", { class: "am" }, dep.vnd(chi))), h("div", {}, h("small", {}, "Tổng nhận"), h("b", { class: "duong" }, dep.vnd(thu)))),
          Object.entries(theoLoai).sort((a, b) => b[1] - a[1]).map(([k, v]) => h("div", { class: "dt-mm-cot" }, h("span", {}, k), h("i", {}, h("u", { style: `width:${Math.round(v / Math.max(1, chi) * 100)}%` })), h("small", {}, dep.vnd(v)))),
          chi ? null : h("p", { class: "dt-trong" }, "Chưa chi tiêu gì trong tháng.")) : null,
        h("div", { class: "dt-mm-ls" }, h("b", {}, "Lịch sử giao dịch"),
          gd.length ? [...nhom.entries()].flatMap(([k, ds]) => [h("small", { class: "dt-mm-ngay" }, k), ...ds.map(g => { const [icon, mau] = loai(g.ten); return h("div", { class: "dt-mm-gd" }, h("span", { class: "dt-mm-ic", style: `--m:${mau}` }, icEl(icon)), h("div", {}, h("b", {}, g.ten), h("small", {}, `${g.gio} · ${g.so < 0 ? "Thanh toán" : "Nhận tiền"} · Thành công`)), h("b", { class: g.so < 0 ? "am" : "duong" }, (g.so < 0 ? "−" : "+") + dep.vnd(Math.abs(g.so)))); })])
            : h("p", { class: "dt-trong" }, "Chưa có giao dịch nào.")));
    };
    henMot(() => ve(), 0);
    return [dau("MôMô", { cls: "mm" }), than];
  };

  // ======================= SỐP-PI =======================
  const sopPi = () => {
    const d = D();
    for (const o of d.don) if (L.ngay >= o.giao) o.xem = true;
    luu();
    let nhom = "Tất cả", q = "";
    const than = h("div", { class: "dt-than sp" });
    const nutGio = h("span", { class: "dt-sp-gio-so" });
    const capGio = () => { const n = d.don.filter(o => L.ngay < o.giao).length; nutGio.textContent = n ? String(n) : ""; nutGio.hidden = !n; };
    const banner = () => L.ngay <= 10 ? ["SIÊU SALE 10.10", "Giảm tới 50% · Miễn phí vận chuyển"] : L.ngay <= 15 ? ["SALE GIỮA THÁNG 15.10", "Voucher 30k cho đơn từ 99k"] : L.ngay <= 25 ? ["SALE 25.10", "Hoàn xu 15% · Freeship toàn Quận Hóng"] : ["SALE CUỐI THÁNG", "Mua sắm trước Đại Nhạc Hội 31/10"];
    const ban = x => x.ban + (d.don.filter(o => o.ma === x.ma).length);
    const sao = n => h("span", { class: "dt-sp-sao", html: ic("sao").repeat(n) });
    const veDS = () => {
      luiLai = null;
      const ds = HANG.filter(x => (nhom === "Tất cả" || x.nhom === nhom) && (!q || x.ten.toLowerCase().includes(q)));
      const [bt, bp] = banner();
      thay(than, 
        q ? null : h("div", { class: "dt-sp-banner" }, h("b", {}, bt), h("small", {}, bp)),
        h("div", { class: "dt-sp-nhom" }, ["Tất cả", "Văn phòng", "Đi đường", "Ăn uống"].map(x => nut({ class: x === nhom ? "on" : "", onclick: () => { nhom = x; veDS(); } }, x))),
        ds.length ? h("div", { class: "dt-sp-luoi" }, ds.map(x => nut({ class: "dt-sp-sp", onclick: () => veSP(x) },
          h("div", { class: "dt-sp-hinh", html: hinhHang(x.ma) }, h("em", {}, `−${Math.round((1 - x.gia / x.goc) * 100)}%`)),
          h("span", { class: "dt-sp-ten" }, x.ten), h("div", { class: "dt-sp-gia" }, h("b", {}, dep.vnd(x.gia)), h("small", {}, `Đã bán ${gon(ban(x))}`)))))
          : h("p", { class: "dt-trong" }, "Không tìm thấy sản phẩm."));
      than.scrollTop = 0;
    };
    const veSP = x => {
      luiLai = () => veDS();
      const du = x.gia <= tien(), daDat = d.don.filter(o => o.ma === x.ma && L.ngay < o.giao).length;
      thay(than, h("div", { class: "dt-sp-ct" },
        nut({ class: "dt-sp-ve", "aria-label": "Quay lại", onclick: () => veDS() }, icEl("lui")),
        h("div", { class: "dt-sp-hinh to", html: hinhHang(x.ma) }),
        h("div", { class: "dt-sp-khoi" }, h("div", { class: "dt-sp-gia to" }, h("b", {}, dep.vnd(x.gia)), h("s", {}, dep.vnd(x.goc)), h("em", {}, `−${Math.round((1 - x.gia / x.goc) * 100)}%`)),
          h("p", { class: "dt-sp-ten to" }, x.ten), h("div", { class: "dt-sp-dg" }, sao(5), h("small", {}, `4,9 · Đã bán ${gon(ban(x))}`))),
        h("div", { class: "dt-sp-khoi" }, h("div", { class: "dt-sp-shop" }, h("span", { class: "dt-av", style: "--av:#ee4d2d" }, "S"), h("div", {}, h("b", {}, "Sốp-pi Mall Quận Hóng"), h("small", {}, "Giao trong 3 ngày · Miễn phí vận chuyển")))),
        h("div", { class: "dt-sp-khoi" }, h("b", {}, "Mô tả sản phẩm"), h("p", {}, x.mo)),
        daDat ? h("p", { class: "dt-sp-da" }, `Bạn có ${daDat} đơn đang giao cho sản phẩm này.`) : null),
        h("div", { class: "dt-sp-mua" }, h("div", {}, h("small", {}, "Ví MôMô"), h("b", {}, dep.vnd(tien()))),
          nut({ class: "dt-sp-nut", disabled: !du, onclick: () => {
            if (!dep.muaHang(x.ten, x.gia)) { bao("Số dư không đủ"); return; }
            const giao = Math.min(31, L.ngay + 3);
            d.don.push({ ma: x.ma, ten: x.ten, gia: x.gia, ngay: L.ngay, p: phut(), giao }); if (d.don.length > 20) d.don.shift();
            luu(); capGio(); bao(`Đặt hàng thành công · Giao ngày ${giao}/10`); veSP(x);
          } }, du ? "Mua ngay" : "Không đủ tiền")));
      than.scrollTop = 0;
    };
    const veDon = () => {
      luiLai = () => veDS();
      const ds = d.don.slice().reverse();
      thay(than, h("div", { class: "dt-sp-don-dau" }, nut({ class: "dt-sp-ve phang", "aria-label": "Quay lại", onclick: () => veDS() }, icEl("lui")), h("b", {}, "Đơn mua")),
        ds.length ? ds.map(o => { const xong = L.ngay >= o.giao; return h("div", { class: "dt-sp-don" }, h("div", { class: "dt-sp-hinh nho", html: hinhHang(o.ma) }), h("div", {}, h("b", {}, o.ten), h("small", {}, `Đặt ngày ${o.ngay}/10 · ${dep.vnd(o.gia)}`), h("span", { class: "dt-sp-tt " + (xong ? "xong" : "") }, xong ? `Đã giao ngày ${o.giao}/10` : `Đang giao · Dự kiến ${o.giao}/10`))); })
          : h("p", { class: "dt-trong" }, "Bạn chưa có đơn hàng nào."));
    };
    const tim = h("input", { class: "dt-sp-tim", type: "search", placeholder: "Tìm trên Sốp-pi", "aria-label": "Tìm sản phẩm" });
    tim.oninput = () => { q = tim.value.trim().toLowerCase(); veDS(); };
    capGio(); henMot(veDS, 0);
    return [h("header", { class: "dt-dau sp" }, nut({ class: "dt-lui", "aria-label": "Quay lại", onclick: () => (luiLai || (() => mo("chinh")))() }, icEl("lui")), h("label", { class: "dt-sp-o" }, icEl("tim"), tim), nut({ class: "dt-dau-nut", "aria-label": "Đơn mua", onclick: veDon }, icEl("gio_hang"), nutGio)), than];
  };

  // ======================= LỊCH =======================
  const lich = () => {
    const dau1 = new Date(2026, 9, 1).getDay(), lech = (dau1 + 6) % 7;
    let chon = L.ngay;
    const ct = h("div", { class: "dt-lc-ct" });
    const suKien = n => {
      const kq = [];
      if (dep.SU_KIEN_NGAY[n]) kq.push(["Cả ngày", dep.SU_KIEN_NGAY[n], "#ff3b30"]);
      if (n === 12) kq.push(["09:12", "Lương tháng 10 về tài khoản", "#34c759"]);
      if (n === 17 || n === 18) kq.push(["07:00", "Team building ở Vũng Tàu", "#ff9500"]);
      else kq.push(["08:00", "Làm việc ở G-Entertainment", "#007aff"]);
      if (n === 31) kq.push(["19:30", "Đại Nhạc Hội Siêu Nhân · Quảng trường Hồng", "#af52de"]);
      return kq;
    };
    const luoi = h("div", { class: "dt-lc-luoi" });
    const veLuoi = () => thay(luoi, ...["T2", "T3", "T4", "T5", "T6", "T7", "CN"].map(t => h("small", {}, t)),
      ...Array.from({ length: lech }, () => h("span")),
      ...Array.from({ length: 31 }, (_, i) => i + 1).map(n => nut({ class: [n === L.ngay ? "nay" : "", n === chon ? "chon" : "", dep.SU_KIEN_NGAY[n] ? "co" : "", n < L.ngay ? "qua" : ""].join(" "), "aria-label": `Ngày ${n}`, onclick: () => { chon = n; veLuoi(); veCT(); } }, String(n))));
    const veCT = () => {
      const con = 31 - chon;
      thay(ct, h("b", { class: "dt-lc-ngay" }, dep.ngayDayDu(chon).replace(" - ", ", ")),
        ...suKien(chon).map(([g, t, m]) => h("div", { class: "dt-lc-sk", style: `--m:${m}` }, h("small", {}, g), h("span", {}, t))),
        h("small", { class: "dt-lc-con" }, chon < 31 ? `Còn ${con} ngày tới Đại Nhạc Hội Siêu Nhân` : "Đêm diễn Đại Nhạc Hội Siêu Nhân"));
    };
    veLuoi(); veCT();
    return [dau("Lịch", { cls: "sang", phai: nut({ class: "dt-dau-chu do", onclick: () => { chon = L.ngay; veLuoi(); veCT(); } }, "Hôm nay") }), h("div", { class: "dt-than lc" }, h("b", { class: "dt-lc-thang" }, "Tháng 10 ", h("span", {}, "2026")), luoi, ct)];
  };

  // ======================= THỜI TIẾT =======================
  const thoiTiet = () => {
    const gio = Math.floor(phut() / 60), nay = dep.thoiTietGio(L.ngay, gio), dem = laDem();
    const ngay = n => { const ds = Array.from({ length: 17 }, (_, i) => dep.thoiTietGio(n, 6 + i)); return { cao: Math.max(...ds.map(x => x.nhiet)), thap: Math.min(...ds.map(x => x.nhiet)), chinh: dep.thoiTietGio(n, 13), mua: ds.some(x => /mua|giong/.test(x.loai)) }; };
    const hn = ngay(L.ngay);
    const gioDs = [];
    for (let i = 0; i < 12; i++) { const gg = gio + i, n = gg >= 24 ? Math.min(31, L.ngay + 1) : L.ngay, hh = gg % 24; if (gg >= 24 && L.ngay >= 31) break; gioDs.push([i === 0 ? "Bây giờ" : `${String(hh).padStart(2, "0")} giờ`, dep.thoiTietGio(n, hh), laDem(hh)]); }
    const cacNgay = Array.from({ length: Math.min(7, 32 - L.ngay) }, (_, i) => L.ngay + i);
    const mua = /mua|giong/.test(nay.loai), nen = dem ? "dem" : mua || nay.loai === "am_u" || nay.loai === "suong_mu" ? "mua" : "nang";
    const thapMin = Math.min(...cacNgay.map(n => ngay(n).thap)), caoMax = Math.max(...cacNgay.map(n => ngay(n).cao));
    return [dau("Thời tiết", { cls: "trong" }), h("div", { class: "dt-than tt2 " + nen },
      h("div", { class: "dt-tt2-to" }, h("small", {}, "Quận Hóng"), h("b", {}, `${nay.nhiet}°`), h("span", {}, nay.ten), h("small", {}, `C:${hn.cao}°  T:${hn.thap}°`)),
      h("div", { class: "dt-tt2-the" }, h("small", { class: "dt-tt2-nhan" }, hn.mua ? "Có mưa trong ngày, nhớ mang áo mưa." : "Trời khô ráo cả ngày."),
        h("div", { class: "dt-tt2-gio" }, gioDs.map(([t, x, d]) => h("div", {}, h("small", {}, t), h("i", { html: veTT(x.loai, d) }), h("b", {}, `${x.nhiet}°`))))),
      h("div", { class: "dt-tt2-the" }, h("small", { class: "dt-tt2-nhan" }, cacNgay.length > 1 ? `Dự báo ${cacNgay.length} ngày` : "Dự báo hôm nay"),
        cacNgay.map((n, i) => { const x = ngay(n), l = (x.thap - thapMin) / Math.max(1, caoMax - thapMin) * 100, r = (x.cao - thapMin) / Math.max(1, caoMax - thapMin) * 100; return h("div", { class: "dt-tt2-ngay" }, h("b", {}, i < 2 ? TEN_TT[i] : dep.ngayDayDu(n).split(" - ")[0]), h("i", { html: veTT(x.chinh.loai, false) }), h("small", {}, `${x.thap}°`), h("span", { class: "dt-tt2-thanh" }, h("u", { style: `left:${l}%;right:${100 - r}%` })), h("b", {}, `${x.cao}°`)); })),
      h("div", { class: "dt-tt2-o" },
        h("div", { class: "dt-tt2-the" }, h("small", { class: "dt-tt2-nhan" }, "Độ ẩm"), h("b", {}, `${mua ? 92 : nay.loai === "suong_mu" ? 96 : 68 + (L.ngay % 9)}%`), h("small", {}, mua ? "Không khí rất ẩm" : "Dễ chịu")),
        h("div", { class: "dt-tt2-the" }, h("small", { class: "dt-tt2-nhan" }, "Chỉ số UV"), h("b", {}, String(dem ? 0 : /nang/.test(nay.loai) ? 9 : mua ? 2 : 5)), h("small", {}, dem ? "Thấp" : /nang/.test(nay.loai) ? "Rất cao" : mua ? "Thấp" : "Trung bình"))))];
  };

  // ======================= GHI CHÚ =======================
  const ghiChu = () => {
    const d = D();
    const than = h("div", { class: "dt-than gc" });
    const tieuDe = c => (c.chu.split("\n").find(x => x.trim()) || "Ghi chú mới").trim();
    const veDS = () => {
      luiLai = null;
      khung.querySelector(".dt-dau").replaceWith(dau("Ghi chú", { cls: "sang gc" }));
      const ds = d.ghiChu.slice().sort((a, b) => b.ngay - a.ngay || b.p - a.p);
      thay(than, h("b", { class: "dt-gc-to" }, "Ghi chú"),
        h("small", { class: "dt-gc-nhan" }, "Đã ghim"),
        h("div", { class: "dt-gc-nhom" }, nut({ class: "dt-gc-dong", onclick: veHomNay }, h("b", {}, "Việc hôm nay"), h("small", {}, h("span", {}, gioNay()), " " + (dep.ghiChu()[0]?.[1] || "")))),
        h("small", { class: "dt-gc-nhan" }, "Ghi chú của tôi"),
        ds.length ? h("div", { class: "dt-gc-nhom" }, ds.map(c => nut({ class: "dt-gc-dong", onclick: () => veSua(c) }, h("b", {}, tieuDe(c)), h("small", {}, h("span", {}, thoiGian(c.ngay, c.p)), " " + (c.chu.split("\n").filter(x => x.trim()).slice(1).join(" ") || "Không có nội dung thêm")))))
          : h("p", { class: "dt-trong" }, "Chưa có ghi chú. Bấm nút bút để viết."),
        h("div", { class: "dt-gc-chan" }, h("small", {}, `${ds.length + 1} ghi chú`), nut({ class: "dt-gc-moi", "aria-label": "Ghi chú mới", onclick: () => veSua(null) }, icEl("but"))));
    };
    const veHomNay = () => {
      luiLai = () => veDS();
      khung.querySelector(".dt-dau").replaceWith(dau("Việc hôm nay", { lui: veDS, cls: "sang gc" }));
      thay(than, h("div", { class: "dt-gc-doc" }, h("small", {}, dep.ngayDayDu(L.ngay)), ...dep.ghiChu().map(([t, c]) => h("section", {}, h("b", {}, t), h("p", {}, c)))));
    };
    const veSua = c => {
      const o = h("textarea", { class: "dt-gc-o", placeholder: "Viết ghi chú…", maxlength: "2000", "aria-label": "Nội dung ghi chú" });
      o.value = c?.chu || "";
      const xong = () => {
        const chu = o.value.replace(/\s+$/, "");
        if (c) { if (chu.trim()) { c.chu = chu; c.ngay = L.ngay; c.p = phut(); } else d.ghiChu.splice(d.ghiChu.indexOf(c), 1); }
        else if (chu.trim()) { d.ghiChu.push({ id: Date.now(), chu, ngay: L.ngay, p: phut() }); if (d.ghiChu.length > 50) d.ghiChu.shift(); }
        luu(); veDS();
      };
      luiLai = xong;
      khung.querySelector(".dt-dau").replaceWith(dau("Ghi chú", { lui: xong, cls: "sang gc", phai: nut({ class: "dt-dau-chu vang", onclick: xong }, "Xong") }));
      thay(than, h("small", { class: "dt-gc-ngay" }, `${dep.ngayDayDu(L.ngay).replace(" - ", ", ")} lúc ${gioNay()}`), o,
        c ? nut({ class: "dt-gc-xoa", onclick: () => { d.ghiChu.splice(d.ghiChu.indexOf(c), 1); luu(); bao("Đã xóa ghi chú"); veDS(); } }, icEl("thung_rac"), "Xóa ghi chú") : null);
      henMot(() => o.focus(), 50);
    };
    henMot(veDS, 0);
    return [dau("Ghi chú", { cls: "sang gc" }), than];
  };

  // ======================= ẢNH =======================
  const thuVien = () => {
    const than = h("div", { class: "dt-than an" });
    const veLuoi = () => {
      luiLai = null; phimUng = null; than.classList.remove("xem");
      thay(than, h("b", { class: "dt-an-to" }, "Thư viện"), h("small", { class: "dt-an-so" }, anh.length ? `${anh.length} ảnh` : ""),
        anh.length ? h("div", { class: "dt-an-luoi" }, anh.map((u, i) => [u, i]).reverse().map(([u, i]) => nut({ class: "dt-an-o", "aria-label": `Ảnh ${i + 1}`, onclick: () => xem(i) }, h("img", { src: u, alt: "" }))))
          : h("div", { class: "dt-an-trong" }, h("i", { html: ic("anh") }), h("b", {}, "Chưa có ảnh"), h("small", {}, "Ảnh chụp bằng Camera sẽ hiện ở đây."), nut({ class: "dt-an-mo", onclick: () => mo("camera") }, "Mở Camera")));
    };
    const xem = i => {
      luiLai = veLuoi; than.classList.add("xem");
      const doi = dd => { const j = i + dd; if (j >= 0 && j < anh.length) xem(j); };
      let x0 = null;
      phimUng = e => e.code === "ArrowLeft" ? (doi(1), true) : e.code === "ArrowRight" ? (doi(-1), true) : false;
      thay(than, h("div", { class: "dt-an-xem", onpointerdown: e => { x0 = e.clientX; }, onpointerup: e => { if (x0 != null && Math.abs(e.clientX - x0) > 40) doi(e.clientX < x0 ? -1 : 1); x0 = null; } }, h("img", { src: anh[i], alt: "Ảnh đã chụp" })),
        h("div", { class: "dt-an-thanh" },
          nut({ "aria-label": "Ảnh trước", disabled: i >= anh.length - 1, onclick: () => doi(1) }, icEl("lui")),
          nut({ "aria-label": "Đăng lên Phây-búc", onclick: () => { D().baiDang.push({ chu: "", hinh: anh[i], ngay: L.ngay, p: phut() }); if (D().baiDang.length > 12) D().baiDang.shift(); luu(); bao("Đã đăng lên Phây-búc"); } }, icEl("chia_se")),
          h("small", {}, `${anh.length - i}/${anh.length}`),
          nut({ "aria-label": "Xóa ảnh", onclick: () => { anh.splice(i, 1); luuAnh(); bao("Đã xóa ảnh"); anh.length ? xem(Math.min(i, anh.length - 1)) : veLuoi(); } }, icEl("thung_rac")),
          nut({ "aria-label": "Ảnh sau", disabled: i <= 0, onclick: () => doi(-1) }, icEl("phai"))));
    };
    henMot(veLuoi, 0);
    return [dau("Ảnh", { cls: "sang an", lui: () => (luiLai || (() => mo("chinh")))() }), than];
  };

  // ======================= CAMERA =======================
  // vẽ một khung hình ngay trước khi lấy ảnh (canvas WebGL không giữ bộ đệm sau khi hiện lên màn hình)
  const veKhung = () => { const g = dep.g; if (g.hauKy) g.hauKy.render(0); else g.renderer.render(g.scene, g.camera); return g.canvas; };
  const camera = () => {
    const xem = h("canvas", { class: "dt-cam-xem", width: 360, height: 480 });
    const nho = nut({ class: "dt-cam-nho", "aria-label": "Mở thư viện ảnh", onclick: () => mo("anh") }, anh.length ? h("img", { src: anh.at(-1), alt: "" }) : null);
    const flash = h("div", { class: "dt-cam-flash" });
    const veXem = () => {
      try {
        const nguon = veKhung(), c = xem.getContext("2d"), W = xem.width, H = xem.height;
        const k = Math.max(W / nguon.width, H / nguon.height), w = nguon.width * k, hh = nguon.height * k;
        c.drawImage(nguon, (W - w) / 2, (H - hh) / 2, w, hh);
      } catch {}
    };
    const chup = () => {
      try {
        const nguon = veKhung();
        const c = document.createElement("canvas"), k = Math.min(1, 540 / nguon.width); c.width = Math.round(nguon.width * k); c.height = Math.round(nguon.height * k);
        c.getContext("2d").drawImage(nguon, 0, 0, c.width, c.height);
        const u = c.toDataURL("image/jpeg", 0.8);
        anh.push(u); if (anh.length > 18) anh.shift(); luuAnh();
        thay(nho, h("img", { src: u, alt: "" }));
        flash.classList.remove("on"); void flash.offsetWidth; flash.classList.add("on");
        am.phat("chup"); am.phat("click");
      } catch { bao("Không chụp được ảnh"); }
    };
    phimUng = e => (e.code === "Space" || e.code === "Enter") ? (chup(), true) : false;
    henMot(veXem, 0); henLap(veXem, 250);
    return [dau("Camera", { cls: "toi cam" }), h("div", { class: "dt-than cam" },
      h("div", { class: "dt-cam-khung" }, xem, flash, h("span", { class: "dt-cam-zoom" }, "1x")),
      h("small", { class: "dt-cam-che" }, "ẢNH"),
      h("div", { class: "dt-cam-nut" }, nho, nut({ class: "dt-chup", onclick: chup, "aria-label": "Chụp ảnh" }), h("span", { class: "dt-cam-giu" })))];
  };

  // ======================= THÀNH TỰU =======================
  const thanhTuu = () => {
    const bst = veBoSuuTap(h, { META: dep.META, NHAN_VAT: dep.NHAN_VAT, tenVai: n => n.vai });
    const b = docBST(), co = Object.keys(b.thanhTuu).length;
    return [dau("Thành tựu", { cls: "sang" }), h("div", { class: "dt-than th" },
      h("div", { class: "dt-th-dau" }, h("div", { class: "dt-th-vong", style: `--p:${Math.round(co / THANH_TUU.length * 100)}` }, h("b", {}, String(co)), h("small", {}, `/${THANH_TUU.length}`)), h("div", {}, h("b", {}, "Thành tựu đã mở"), h("small", {}, `Vai ${dep.THEO_MA[L.ma]?.vai || ""} · Ngày ${L.ngay}/31`))), bst)];
  };

  // ======================= ĐỒNG HỒ =======================
  let bamGio = { chay: false, bd: 0, tich: 0, vong: [] }; // bấm giờ chạy theo giờ thật
  const dongHo = () => {
    const d = D();
    let tab = "bt";
    const than = h("div", { class: "dt-than dh" });
    const tabs = h("nav", { class: "dt-tab toi" });
    const veTab = () => thay(tabs, ...[["tg", "Giờ thế giới", "the_gioi"], ["bt", "Báo thức", "bao_thuc"], ["bg", "Bấm giờ", "bam_gio"]].map(([id, chu, icon]) => nut({ class: id === tab ? "on" : "", onclick: () => { tab = id; donSach(); ve(); } }, icEl(icon), h("small", {}, chu))));
    const kim = (gio, phut_) => `<svg viewBox="0 0 120 120" aria-hidden="true"><circle cx="60" cy="60" r="56" fill="#fff"/>${Array.from({ length: 12 }, (_, i) => `<rect x="58.5" y="8" width="3" height="9" fill="#111" transform="rotate(${i * 30} 60 60)"/>`).join("")}<line x1="60" y1="60" x2="60" y2="30" stroke="#111" stroke-width="5" stroke-linecap="round" transform="rotate(${(gio % 12) * 30 + phut_ / 2} 60 60)"/><line x1="60" y1="60" x2="60" y2="16" stroke="#111" stroke-width="3" stroke-linecap="round" transform="rotate(${phut_ * 6} 60 60)"/><circle cx="60" cy="60" r="4" fill="#ff9500"/></svg>`;
    const tg = s => { const ms = Math.floor(s % 1000 / 10), gs = Math.floor(s / 1000); return `${String(Math.floor(gs / 60)).padStart(2, "0")}:${String(gs % 60).padStart(2, "0")},${String(ms).padStart(2, "0")}`; };
    const ve = () => {
      veTab();
      const p = phut();
      if (tab === "tg") {
        const tp = [["Quận Hóng", 0, "Hôm nay"], ["Tokyo", 2, "+2 giờ"], ["Paris", -5, "−5 giờ"], ["New York", -11, "−11 giờ"]];
        thay(than, h("b", { class: "dt-dh-to" }, "Giờ thế giới"), h("div", { class: "dt-dh-kim", html: kim(Math.floor(p / 60), p % 60) }),
          tp.map(([t, l, m]) => { const q = p + l * 60, khac = q < 0 ? "Hôm qua" : q >= 1440 ? "Ngày mai" : m; return h("div", { class: "dt-dh-dong" }, h("div", {}, h("small", {}, khac), h("b", {}, t)), h("b", { class: "to" }, hhmm((q + 1440) % 1440))); }));
      } else if (tab === "bt") {
        const ds = d.baoThuc;
        const them = h("div", { class: "dt-dh-them", hidden: true },
          h("input", { type: "time", value: "12:00", "aria-label": "Giờ báo thức" }), h("input", { type: "text", placeholder: "Nhãn", maxlength: "40", "aria-label": "Nhãn báo thức" }),
          nut({ class: "dt-dh-luu", onclick: () => { const [o1, o2] = them.querySelectorAll("input"); if (!/^\d\d:\d\d$/.test(o1.value)) return; ds.push({ gio: o1.value, ten: o2.value.trim() || "Báo thức", bat: true, moi: true }); ds.sort((a, b) => a.gio.localeCompare(b.gio)); luu(); ve(); } }, "Lưu"));
        thay(than, h("div", { class: "dt-dh-tieu" }, h("b", { class: "dt-dh-to" }, "Báo thức"), nut({ class: "dt-dh-cong", "aria-label": "Thêm báo thức", onclick: () => { them.hidden = !them.hidden; } }, icEl("cong"))), them,
          ds.map(a => h("div", { class: "dt-dh-dong" + (a.bat ? "" : " tat") }, h("div", {}, h("b", { class: "to" }, a.gio), h("small", {}, a.ten)),
            a.moi ? nut({ class: "dt-dh-xoa", "aria-label": "Xóa báo thức", onclick: () => { ds.splice(ds.indexOf(a), 1); luu(); ve(); } }, icEl("thung_rac")) : null,
            nut({ class: "dt-cong" + (a.bat ? " bat" : ""), role: "switch", "aria-checked": String(!!a.bat), "aria-label": `Báo thức ${a.gio}`, onclick: () => { a.bat = !a.bat; luu(); ve(); } }))));
      } else {
        const man = h("b", { class: "dt-dh-bg" }, "00:00,00");
        const tinh = () => bamGio.tich + (bamGio.chay ? performance.now() - bamGio.bd : 0);
        const dsVong = h("div", { class: "dt-dh-vong" });
        const veVong = () => thay(dsVong, ...bamGio.vong.map((v, i) => h("div", { class: "dt-dh-dong nho" }, h("span", {}, `Vòng ${bamGio.vong.length - i}`), h("span", {}, tg(v)))));
        const n1 = nut({ class: "dt-dh-tron xam" }), n2 = nut({ class: "dt-dh-tron" });
        const capNut = () => {
          n1.textContent = bamGio.chay ? "Vòng" : "Đặt lại"; n1.disabled = !bamGio.chay && !tinh();
          n2.textContent = bamGio.chay ? "Dừng" : "Bắt đầu"; n2.className = "dt-dh-tron " + (bamGio.chay ? "do" : "xanh");
        };
        n1.onclick = () => { if (bamGio.chay) bamGio.vong.unshift(tinh()); else bamGio = { chay: false, bd: 0, tich: 0, vong: [] }; veVong(); capNut(); man.textContent = tg(tinh()); };
        n2.onclick = () => { if (bamGio.chay) { bamGio.tich = tinh(); bamGio.chay = false; } else { bamGio.bd = performance.now(); bamGio.chay = true; } capNut(); };
        phimUng = e => e.code === "Space" ? (n2.click(), true) : false;
        thay(than, man, h("div", { class: "dt-dh-hai" }, n1, n2), dsVong);
        veVong(); capNut(); man.textContent = tg(tinh());
        henLap(() => { man.textContent = tg(tinh()); }, 47);
      }
    };
    henMot(ve, 0);
    return [dau("Đồng hồ", { cls: "toi" }), than, tabs];
  };

  // ======================= MÁY TÍNH =======================
  const mayTinh = () => {
    let a = null, phep = null, nhap = "0", moiXong = false, loi = false;
    const man = h("div", { class: "dt-mt-man" }, "0");
    const dinhDang = s => {
      if (loi) return "Lỗi";
      const [nguyen, thap] = s.replace("-", "").split(".");
      return (s.startsWith("-") ? "−" : "") + Number(nguyen || 0).toLocaleString("vi-VN") + (thap != null ? "," + thap : "");
    };
    const raChu = x => {
      if (!isFinite(x)) return null;
      if (Math.abs(x) >= 1e15) return null;
      return String(Math.round(x * 1e8) / 1e8);
    };
    const tinh = (x, y, op) => op === "+" ? x + y : op === "-" ? x - y : op === "*" ? x * y : op === "/" ? (y === 0 ? NaN : x / y) : y;
    const capNhat = () => {
      const s = dinhDang(nhap);
      man.textContent = s; man.style.fontSize = s.length > 12 ? "30px" : s.length > 9 ? "38px" : "";
      for (const b of khoiPhim.querySelectorAll("[data-op]")) b.classList.toggle("chon", b.dataset.op === phep && moiXong && !loi);
      khoiPhim.querySelector("[data-k='C']").textContent = nhap !== "0" && !moiXong ? "C" : "AC";
    };
    const bam = k => {
      if (loi && k !== "C") { loi = false; a = null; phep = null; nhap = "0"; }
      if (/^\d$/.test(k)) { if (moiXong) { nhap = "0"; moiXong = false; } if (nhap.replace(/[-.]/g, "").length >= 9) return; nhap = nhap === "0" ? k : nhap === "-0" ? "-" + k : nhap + k; }
      else if (k === ".") { if (moiXong) { nhap = "0"; moiXong = false; } if (!nhap.includes(".")) nhap += "."; }
      else if (k === "C") { if (nhap !== "0" && !moiXong) nhap = "0"; else { a = null; phep = null; nhap = "0"; loi = false; } moiXong = false; }
      else if (k === "±") { nhap = nhap.startsWith("-") ? nhap.slice(1) : "-" + nhap; }
      else if (k === "%") { const r = raChu(Number(nhap) / 100); if (r == null) loi = true; else nhap = r; }
      else if (k === "⌫") { if (!moiXong) nhap = nhap.length > 1 && nhap !== "-0" ? nhap.slice(0, -1).replace(/^-$/, "0") : "0"; }
      else if ("+-*/".includes(k)) {
        if (phep && !moiXong && a != null) { const r = raChu(tinh(a, Number(nhap), phep)); if (r == null) { loi = true; capNhat(); return; } nhap = r; }
        a = Number(nhap); phep = k; moiXong = true;
      } else if (k === "=") {
        if (phep != null && a != null) { const r = raChu(tinh(a, Number(nhap), phep)); if (r == null) loi = true; else nhap = r; a = null; phep = null; moiXong = true; }
      }
      capNhat();
    };
    const PHIM = [["C", "fn"], ["±", "fn"], ["%", "fn"], ["/", "op"], ["7"], ["8"], ["9"], ["*", "op"], ["4"], ["5"], ["6"], ["-", "op"], ["1"], ["2"], ["3"], ["+", "op"], ["0", "rong"], ["."], ["=", "op"]];
    const hien = { "/": "÷", "*": "×", "-": "−", "+": "+", "=": "=", ".": "," };
    const khoiPhim = h("div", { class: "dt-mt" }, PHIM.map(([k, c = ""]) => nut({ class: c, "data-k": k, ...("+-*/".includes(k) ? { "data-op": k } : {}), onclick: () => { am.phat("click"); bam(k); } }, hien[k] || k)));
    phimUng = e => {
      const k = /^Digit(\d)$/.exec(e.code)?.[1] ?? /^Numpad(\d)$/.exec(e.code)?.[1] ?? { NumpadAdd: "+", NumpadSubtract: "-", NumpadMultiply: "*", NumpadDivide: "/", NumpadDecimal: ".", Period: ".", Comma: ".", Enter: "=", NumpadEnter: "=", Equal: e.shiftKey ? "+" : "=", Minus: "-", Slash: "/", Backspace: "⌫", Delete: "C", KeyC: "C" }[e.code];
      const k2 = e.key === "*" ? "*" : e.key === "+" ? "+" : e.key === "%" ? "%" : k;
      if (k2 == null) return false; bam(k2); return true;
    };
    henMot(capNhat, 0);
    return [dau("Máy tính", { cls: "toi" }), h("div", { class: "dt-than mt" }, man, khoiPhim)];
  };

  // ======================= ĐIỆN THOẠI (DANH BẠ, GẦN ĐÂY, BÀN PHÍM) =======================
  const dienThoai = (tuyChon = {}) => {
    const d = D();
    let tab = "ban";
    const than = h("div", { class: "dt-than goi" });
    const tabs = h("nav", { class: "dt-tab" });
    const dsNguoi = () => dep.NHAN_VAT.filter(n => n.ma !== L.ma && n.ma !== "cho").sort((a, b) => ten(a.ma).localeCompare(ten(b.ma), "vi"));
    const veTab = () => thay(tabs, ...[["gan", "Gần đây", "lich_su"], ["ban", "Danh bạ", "nguoi"], ["so", "Bàn phím", "ban_phim"]].map(([id, chu, icon]) => nut({ class: id === tab ? "on" : "", onclick: () => { tab = id; ve(); } }, icEl(icon), h("small", {}, chu))));
    const goi = (ma, so) => {
      donSach(); tabs.hidden = true;
      const tenGoi = ma ? ten(ma) : so;
      const cau = ma ? (dep.g.cauBan?.(ma) || "Alo, nghe nè.") : "Thuê bao quý khách vừa gọi tạm thời không liên lạc được. Xin quý khách vui lòng gọi lại sau.";
      d.cuocGoi.unshift({ ma, so, ngay: L.ngay, p: phut() }); if (d.cuocGoi.length > 30) d.cuocGoi.pop(); luu();
      const tt = h("small", { class: "dt-g-tt" }, "Đang gọi…"), loi_ = h("p", { class: "dt-g-loi", hidden: true });
      let t0 = 0;
      const ket = () => { donSach(); am.phat("click"); tabs.hidden = false; ve(); };
      luiLai = ket;
      khung.querySelector(".dt-dau").hidden = true;
      than.classList.add("dang-goi");
      thay(than, h("div", { class: "dt-g-man" }, ma ? av(ma, "to") : h("span", { class: "dt-av to", style: "--av:#8e8e93" }, icEl("nguoi")), h("b", {}, tenGoi), tt, loi_,
        h("div", { class: "dt-g-nut" }, h("span", { class: "dt-g-phu" }, icEl("tat_loa"), h("small", {}, "Tắt tiếng")), nut({ class: "dt-g-ket", "aria-label": "Kết thúc cuộc gọi", onclick: ket }, icEl("goi")), h("span", { class: "dt-g-phu" }, icEl("loa"), h("small", {}, "Loa ngoài")))));
      am.phat("chuong_dt");
      henMot(() => { t0 = performance.now(); loi_.textContent = ma ? `"${cau}"` : cau; loi_.hidden = false; tt.textContent = ma ? "00:00" : "Không liên lạc được"; am.phat("bam_dt"); }, 1800);
      henLap(() => { if (t0 && ma) { const s = Math.floor((performance.now() - t0) / 1000); tt.textContent = `${String(Math.floor(s / 60)).padStart(2, "0")}:${String(s % 60).padStart(2, "0")}`; } }, 500);
      if (!ma) henMot(ket, 5200);
    };
    const theNguoi = ma => {
      const n = dep.THEO_MA[ma], qh = Number(L.v("qh_" + ma)) || 0;
      luiLai = () => { luiLai = null; ve(); };
      thay(than, h("div", { class: "dt-g-the" }, nut({ class: "dt-g-ve", onclick: () => luiLai?.() }, icEl("lui"), "Danh bạ"), av(ma, "to"), h("b", {}, ten(ma)), h("small", {}, `${n.vai} · ${n.chuc}`),
        h("div", { class: "dt-g-hd" }, nut({ onclick: () => mo("zola", { chat: ma }) }, icEl("tin"), h("small", {}, "Nhắn tin")), nut({ onclick: () => goi(ma) }, icEl("goi"), h("small", {}, "Gọi"))),
        h("div", { class: "dt-nhom-hang" }, h("div", { class: "dt-dong" }, h("span", {}, "Di động"), h("small", {}, `09${String(bamSo(ma) % 100000000).padStart(8, "0").replace(/(\d{2})(\d{3})(\d{3})/, "$1 $2 $3")}`)),
          h("div", { class: "dt-dong" }, h("span", {}, "Quan hệ"), h("small", {}, qh > 0 ? `Thân thiết (+${qh})` : qh < 0 ? `Căng thẳng (${qh})` : "Bình thường")),
          h("div", { class: "dt-dong" }, h("span", {}, "Ghi chú"), h("small", {}, `"${n.cau}"`)))));
    };
    const ve = () => {
      donSach(); veTab(); than.classList.remove("dang-goi"); khung.querySelector(".dt-dau").hidden = false;
      if (tab === "ban") {
        const ds = dsNguoi(); let chu0 = "";
        const loc = h("input", { class: "dt-g-tim", type: "search", placeholder: "Tìm kiếm", "aria-label": "Tìm trong danh bạ" });
        const dsEl = h("div", { class: "dt-g-ds" }, ds.flatMap(n => { const c = chuDau(ten(n.ma)), kq = []; if (c !== chu0) { chu0 = c; kq.push(h("small", { class: "dt-g-chu" }, c)); } kq.push(nut({ class: "dt-g-dong", "data-ten": ten(n.ma), onclick: () => theNguoi(n.ma) }, av(n.ma, "nho"), h("span", {}, ten(n.ma)), h("small", {}, n.vai))); return kq; }));
        loc.oninput = () => { const q = loc.value.trim().toLowerCase(); for (const x of dsEl.children) x.hidden = !!q && (!x.dataset.ten || !x.dataset.ten.toLowerCase().includes(q)); };
        thay(than, h("b", { class: "dt-g-to" }, "Danh bạ"), h("label", { class: "dt-g-o" }, icEl("tim"), loc), h("div", { class: "dt-g-toi" }, av(L.ma), h("div", {}, h("b", {}, toi()), h("small", {}, "Thẻ của tôi"))), dsEl);
      } else if (tab === "gan") {
        thay(than, h("b", { class: "dt-g-to" }, "Gần đây"), d.cuocGoi.length ? h("div", { class: "dt-nhom-hang" }, d.cuocGoi.map(c => h("div", { class: "dt-dong" }, h("div", {}, h("b", {}, c.ma ? ten(c.ma) : c.so), h("small", {}, icEl("goi", "nho"), "Cuộc gọi đi")), h("small", {}, thoiGian(c.ngay, c.p)), nut({ class: "dt-g-goi-lai", "aria-label": "Gọi lại", onclick: () => goi(c.ma, c.so) }, icEl("goi")))))
          : h("p", { class: "dt-trong" }, "Chưa có cuộc gọi nào."));
      } else {
        let so = "";
        const man = h("b", { class: "dt-g-so" }, "");
        const capNhat = () => { man.textContent = so.replace(/(\d{4})(\d{3})(\d{0,4})/, "$1 $2 $3").trim(); xoa.hidden = !so; };
        const xoa = nut({ class: "dt-g-xoa", "aria-label": "Xóa", hidden: true, onclick: () => { so = so.slice(0, -1); capNhat(); } }, icEl("xoa_lui"));
        const bam = k => { if (so.length < 11) { so += k; am.phat("bam_dt"); capNhat(); } };
        phimUng = e => { const k = /^(?:Digit|Numpad)(\d)$/.exec(e.code)?.[1]; if (k) { bam(k); return true; } if (e.code === "Backspace") { so = so.slice(0, -1); capNhat(); return true; } if (e.code === "Enter" && so) { goi(null, so); return true; } return false; };
        const CHU = { 2: "ABC", 3: "DEF", 4: "GHI", 5: "JKL", 6: "MNO", 7: "PQRS", 8: "TUV", 9: "WXYZ", 0: "+" };
        thay(than, h("div", { class: "dt-g-ban" }, man, h("div", { class: "dt-g-phim" }, ["1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"].map(k => nut({ onclick: () => bam(k) }, h("b", {}, k), h("small", {}, CHU[k] || "")))),
          h("div", { class: "dt-g-ban-chan" }, h("span"), nut({ class: "dt-g-ket goi", "aria-label": "Gọi", onclick: () => { if (so) goi(null, so); } }, icEl("goi")), xoa)));
      }
    };
    henMot(() => { if (tuyChon.goi) goi(tuyChon.goi); else ve(); }, 0);
    return [dau("Điện thoại", { cls: "sang" }), than, tabs];
  };

  // ======================= TIN NHẮN (SMS) =======================
  const tinNhan = () => {
    const d = D();
    const than = h("div", { class: "dt-than sms" });
    const veDS = () => {
      luiLai = null;
      khung.querySelector(".dt-dau").replaceWith(dau("Tin nhắn", { cls: "sang" }));
      const ds = tinSMS();
      thay(than, h("b", { class: "dt-g-to" }, "Tin nhắn"), ds.length ? h("div", { class: "dt-sms-ds" }, ds.map(t => { const c = t.tin.at(-1), moi = d.daXem["s-" + t.id] !== khoaCuoi(t.tin); return nut({ class: "dt-sms-dong" + (moi ? " moi" : ""), onclick: () => veTin(t) }, h("i", { class: "dt-sms-cham" }), h("span", { class: "dt-av", style: "--av:#8e8e93" }, chuDau(t.ai)), h("div", {}, h("span", { class: "dt-sms-dau" }, h("b", {}, t.ai), h("small", {}, thoiGian(c.ngay, c.p))), h("small", {}, c.chu))); }))
        : h("p", { class: "dt-trong" }, "Không có tin nhắn."));
    };
    const veTin = t => {
      d.daXem["s-" + t.id] = khoaCuoi(t.tin); luu();
      luiLai = veDS;
      khung.querySelector(".dt-dau").replaceWith(h("header", { class: "dt-dau sang sms" }, nut({ class: "dt-lui", "aria-label": "Quay lại", onclick: veDS }, icEl("lui")), h("div", { class: "dt-sms-ai" }, h("span", { class: "dt-av nho", style: "--av:#8e8e93" }, chuDau(t.ai)), h("b", {}, t.ai)), h("span", { class: "dt-dau-trong" })));
      let ngay0 = 0;
      const tin = h("div", { class: "dt-sms-chat" }, t.tin.flatMap(x => { const kq = []; if (x.ngay !== ngay0) { ngay0 = x.ngay; kq.push(h("small", { class: "dt-z-ngay" }, `${dep.ngayDayDu(x.ngay).split(" - ")[0]}, ${x.ngay}/10 lúc ${hhmm(x.p)}`)); } kq.push(h("p", { class: x.ke ? "dt-sms-ke" : "dt-sms-b" + (x.toi ? " toi" : "") }, x.chu)); return kq; }));
      thay(than, tin);
      requestAnimationFrame(() => { tin.scrollTop = tin.scrollHeight; });
    };
    henMot(veDS, 0);
    return [dau("Tin nhắn", { cls: "sang" }), than];
  };

  const UNG = { zola: null, toptop: topTop, phaybuc: phayBuc, diutup: diuTup, xeom: xeOm, bando: banDo, momo: moMo, soppi: sopPi, lich, thoitiet: thoiTiet, ghichu: ghiChu, anh: thuVien, camera, thanhtuu: thanhTuu, dongho: dongHo, maytinh: mayTinh, danhba: dienThoai, sms: tinNhan };
  // giao diện sáng / tối của thanh trạng thái theo ứng dụng
  const KIEU = { chinh: "toi nen", toptop: "toi", camera: "toi", dongho: "toi", maytinh: "toi", bando: "sang trong", thoitiet: "toi trong", zola: "mau z", momo: "mau mm", soppi: "mau sp", xeom: "mau xo" };
  const mo = (id = "chinh", tuyChon) => {
    // đang chơi minigame hay đang cấp cứu thì không rút điện thoại ra
    if (!lop && (dep.g.capCuu || dep.khung()?.querySelector(".mg"))) return;
    donSach();
    if (id === "ban_do") id = "bando";
    if (id !== "chinh" && id !== "zola" && !UNG[id]) id = "chinh";
    ungDung = id === "bando" ? "ban_do" : id;
    if (!lop) {
      khoaTruoc = !!dep.g.khoa && !dep.dangThoai(); // khóa vì lý do khác hội thoại: đóng máy vẫn giữ khóa
      // cảnh cấp cứu bắt đầu (xỉu, tai nạn) khi đang cầm máy: cất điện thoại
      henMo = setInterval(() => { if (dep.g.capCuu && lop) dong(true); }, 500);
      lop = h("div", { class: "dt-lop", onclick: e => { if (e.target === lop) dong(); } });
      dep.khung().append(lop); addEventListener("keydown", phim, true);
      dep.g.datKhoa(true); dep.g.moKhoaChuot(); am.phat("click");
      document.activeElement?.blur?.();
    }
    khung = h("div", { class: `dt ${id === "chinh" ? "chinh" : "ung-" + id} ${KIEU[id] || "sang"}` }, thanhTrangThai(), h("div", { class: "dt-vach", role: "button", tabindex: "0", "aria-label": "Về màn hình chính", onclick: () => id === "chinh" ? dong() : mo("chinh") }));
    thay(lop, khung);
    if (id === "zola") { zola.ve(tuyChon); return; }
    const noiDung = id === "chinh" ? veChinh() : UNG[id](tuyChon);
    khung.querySelector(".dt-vach").before(...noiDung);
  };
  // mỗi phút trong game: báo thức, đơn hàng giao tới
  let phutTruoc = null;
  const nhip = () => {
    const p = phut();
    if (phutTruoc == null || p < phutTruoc || p - phutTruoc > 180) { phutTruoc = p; return; }
    const d = D();
    for (const a of d.baoThuc) { if (!a.bat) continue; const [hh, mm] = a.gio.split(":").map(Number), t = hh * 60 + mm; if (t > phutTruoc && t <= p) { dep.thongBao(`Báo thức ${a.gio}: ${a.ten}`); am.phat("rung"); } }
    for (const o of d.don) if (L.ngay >= o.giao && !o.bao && p >= 10 * 60) {
      o.bao = true; dep.thongBao(`Sốp-pi: đơn "${o.ten}" đã giao tới quầy bảo vệ. Stress −3`);
      L.set("stress", Math.max(0, (Number(L.v("stress")) || 0) - 3)); am.phat("ting"); luu();
    }
    phutTruoc = p;
  };
  return { mo, dong, nhip, dangMo: () => !!lop };
}
