// Điện thoại trong game: tin nhắn Zalo-lô, thống kê Tóp-tóp của Siêu Nhân Hồng, Phây-búc, bản đồ Quận Hóng,
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
  { id: "tin_nhan", ten: "Online 24/7", mo: "Đọc 10 tin nhắn Zalo-lô", dem: "tin_nhan", can: 10 },
  { id: "xe_om", ten: "Khách quen xe ôm", mo: "Đi xe ôm 5 lần", dem: "xe_om", can: 5 },
  { id: "xiu", ten: "Deadline không đáng", mo: "Xỉu vì bỏ bê bản thân", dem: "xiu", can: 1 },
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
function veBanDo(cv, { g, diem = [], mucTieu, oNgoai }) {
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
  // mục tiêu
  if (mucTieu) { c.strokeStyle = "#e8702a"; c.lineWidth = 4; c.beginPath(); c.arc(px(mucTieu.x), pz(mucTieu.z), 12, 0, 6.3); c.stroke(); }
  // người chơi (mũi tên theo hướng nhìn)
  if (!oNgoai && g) {
    const x = px(g.p.x), z = pz(g.p.z), a = g.yaw;
    c.save(); c.translate(x, z); c.rotate(-a + Math.PI); c.fillStyle = "#e8702a"; c.strokeStyle = "#fff"; c.lineWidth = 2;
    c.beginPath(); c.moveTo(0, -24); c.lineTo(16, 18); c.lineTo(0, 8); c.lineTo(-16, 18); c.closePath(); c.stroke(); c.fill(); c.restore();
  }
}

// ---------- Điện thoại ----------
// dep: { h, L, g, META, NHAN_VAT, THEO_MA, tenCua, MUC_TIEU, so, vnd, ngayDayDu, SU_KIEN_NGAY, tinCho(), moTin(), diemXeOm(), diXeOm(diem), moCaiDat(), dangThoai() }
export function taoDienThoai(dep) {
  const { h, L } = dep;
  let lop = null, ungDung = "chinh", henBD = null;
  const dong = () => {
    if (!lop) return; clearInterval(henBD); lop.remove(); lop = null;
    removeEventListener("keydown", phim, true);
    if (!dep.dangThoai()) dep.g.datKhoa(false);
  };
  const phim = e => {
    if (e.code === "Escape" || e.code === "KeyP" || (e.code === "KeyM" && ungDung === "ban_do")) { e.preventDefault(); e.stopPropagation(); if (ungDung !== "chinh" && e.code === "Escape") mo("chinh"); else dong(); return; }
    e.stopPropagation();
  };
  const dau = (tieuDe) => h("header", { class: "dt-dau" },
    ungDung === "chinh" ? h("span", {}) : h("button", { class: "dt-lui", onclick: () => mo("chinh") }, "Quay lại"),
    h("b", {}, tieuDe), h("button", { class: "dt-lui", onclick: dong }, "Đóng"));
  const UNG = [
    ["tin", "Zalo-lô", "#2b7de9", "Z"], ["tt", "Tóp-tóp", "#111", "T"], ["pb", "Phây-búc", "#3b5998", "P"],
    ["ban_do", "Bản đồ", "#3fa66b", "B"], ["xe_om", "Xe Ôm Hóng", "#f0a020", "X"], ["bst", "Bộ sưu tập", "#9b5de5", "S"], ["cai_dat", "Cài đặt", "#6b6f78", "C"],
  ];
  const veChinh = () => {
    const gio = String(L.v("gio") ?? 8).padStart(2, "0") + ":" + String(L.v("phut") ?? 0).padStart(2, "0");
    const coTin = !!dep.tinCho();
    return [h("div", { class: "dt-khoa" }, h("b", {}, gio), h("small", {}, dep.ngayDayDu(L.ngay))),
      h("div", { class: "dt-luoi" }, UNG.map(([id, ten, mau, chu]) => h("button", { class: "dt-app", onclick: () => id === "cai_dat" ? (dong(), dep.moCaiDat()) : mo(id) },
        h("i", { style: `background:${mau}` }, chu, id === "tin" && coTin ? h("em", {}, "1") : null), h("span", {}, ten))))];
  };
  const veTin = () => {
    const cho = dep.tinCho();
    const nhom = chonTheoNgay(NHOM_CHAT, L.ngay, 4).filter(([ma]) => ma !== L.ma);
    return [dau("Zalo-lô"),
      h("div", { class: "dt-than" },
        cho ? h("button", { class: "dt-tin moi", onclick: () => { dong(); dep.moTin(); } }, h("b", {}, cho), h("small", {}, "Tin nhắn mới · Bấm để đọc")) : null,
        h("div", { class: "dt-nhom" }, h("small", {}, "Nhóm: G-Ent Anh Em Một Nhà"),
          nhom.map(([ma, chu]) => h("div", { class: "dt-bong" }, h("b", {}, dep.tenCua(ma)), h("span", {}, chu)))),
        (L.tinDaDoc || []).slice().reverse().map(t => h("div", { class: "dt-tin" }, h("b", {}, t.ten), h("small", {}, `Ngày ${t.ngay}/10 · Đã đọc`))))];
  };
  const veTT = () => {
    const ls = L.lichSuTheoDoi || {}, ds = Array.from({ length: L.ngay }, (_, i) => ls[i + 1] ?? null);
    const hienTai = Number(L.v("nguoi_theo_doi")) || 0; ds[L.ngay - 1] = hienTai;
    const W = 300, H = 140, max = Math.max(dep.MUC_TIEU, ...ds.filter(Boolean));
    const diem = ds.map((v, i) => v == null ? null : [8 + (i / 30) * (W - 16), H - 6 - (v / max) * (H - 12)]).filter(Boolean);
    const svg = `<svg viewBox="0 0 ${W} ${H}" preserveAspectRatio="none" class="dt-bieu"><line x1="0" x2="${W}" y1="${H - dep.MUC_TIEU / max * H}" y2="${H - dep.MUC_TIEU / max * H}" stroke="#e8702a" stroke-dasharray="4 4"/><polyline fill="none" stroke="#ff6fae" stroke-width="2.5" points="${diem.map(p => p.join(",")).join(" ")}"/>${diem.map(([x, y]) => `<circle cx="${x}" cy="${y}" r="3.5" fill="#ff6fae"/>`).join("")}</svg>`;
    return [dau("Tóp-tóp Studio"),
      h("div", { class: "dt-than" },
        h("div", { class: "dt-so" }, h("small", {}, "@sieunhanhong · Người theo dõi"), h("b", {}, dep.so(hienTai)), h("span", {}, `Mục tiêu ${dep.so(dep.MUC_TIEU)} trước 31/10`)),
        h("div", { html: svg }),
        h("div", { class: "dt-chu-thich" }, h("span", {}, "1/10"), h("span", {}, "Đường cam: mục tiêu"), h("span", {}, "31/10")),
        chonTheoNgay(BAI_HONG, L.ngay, 2).map(t => h("div", { class: "dt-bai" }, h("b", {}, "Siêu Nhân Hồng"), h("p", {}, t))))];
  };
  const vePB = () => {
    const ds = dep.NHAN_VAT.filter(n => n.ma !== L.ma && n.ma !== "cho");
    const bai = chonTheoNgay(BAI_PB, L.ngay, 4, 3).map((f, i) => f(ds[(L.ngay * 3 + i * 7) % ds.length].ma));
    const su = dep.SU_KIEN_NGAY[L.ngay];
    return [dau("Phây-búc"),
      h("div", { class: "dt-than" },
        su ? h("div", { class: "dt-bai noi" }, h("b", {}, "G-Entertainment"), h("p", {}, `Hôm nay: ${su}.`)) : null,
        bai.map(([ma, chu]) => h("div", { class: "dt-bai" }, h("b", {}, dep.tenCua(ma)), h("p", {}, chu), h("small", {}, `${12 + (chu.length % 40)} lượt thích · ${chu.length % 9} bình luận`))))];
  };
  const veBD = () => {
    const cv = h("canvas", { class: "dt-bando", width: 700, height: 700 });
    const ve = () => veBanDo(cv, { g: dep.g, diem: dep.diemXeOm().filter(d => d.x != null), mucTieu: dep.g.mucTieu?.k, oNgoai: dep.g.oNgoai?.() });
    henBD = setInterval(ve, 400); setTimeout(ve, 0);
    return [dau("Bản đồ Quận Hóng"), h("div", { class: "dt-than" }, cv,
      dep.g.oNgoai?.() ? h("p", { class: "dt-ghi" }, "Bạn đang ở ngoài khu phố này.") : null,
      h("div", { class: "dt-chu-thich" }, h("span", { class: "c1" }, "Bạn"), h("span", { class: "c2" }, "Việc tiếp theo"), h("span", { class: "c3" }, "Điểm xe ôm")))];
  };
  const veXO = () => {
    const tien = Number(L.v("tien")) || 0;
    return [dau("Xe Ôm Hóng"), h("div", { class: "dt-than" },
      h("p", { class: "dt-ghi" }, `Ví: ${dep.vnd(tien)}`),
      dep.diemXeOm().map(d => h("button", { class: "dt-tin", disabled: d.gia > tien || d.oDay, onclick: () => { dong(); dep.diXeOm(d); } },
        h("b", {}, d.ten), h("small", {}, d.oDay ? "Bạn đang ở đây" : d.gia > tien ? `${dep.vnd(d.gia)} · Không đủ tiền` : `${dep.vnd(d.gia)} · Khoảng ${d.phut} phút`))))];
  };
  const veBST = () => [dau("Bộ sưu tập"), h("div", { class: "dt-than" }, veBoSuuTap(h, { META: dep.META, NHAN_VAT: dep.NHAN_VAT }))];
  const mo = (id = "chinh") => {
    clearInterval(henBD);
    ungDung = id;
    if (!lop) {
      lop = h("div", { class: "dt-lop", onclick: e => { if (e.target === lop) dong(); } });
      dep.khung().append(lop); addEventListener("keydown", phim, true);
      dep.g.datKhoa(true); dep.g.moKhoaChuot(); am.phat("click");
    }
    const VE = { chinh: veChinh, tin: veTin, tt: veTT, pb: vePB, ban_do: veBD, xe_om: veXO, bst: veBST };
    lop.replaceChildren(h("div", { class: "dt" }, ...(VE[id] || veChinh)()));
  };
  return { mo, dong, dangMo: () => !!lop };
}
