// Lõi game 3D: camera góc nhìn thứ nhất / thứ ba, di chuyển, va chạm, tương tác, mục tiêu cảnh, ánh sáng theo giờ.
// Phần truyện (Ink) do main.js điều khiển; file này chỉ báo sự kiện qua các hàm onXxx.
import * as THREE from "three";
import { taoTheGioi, KHU, CAU_THANG, CHO_NGOI, CAO_TANG, DO_VAT } from "./the-gioi.js";
import { taoNguoi, taoBangTen, taoDoiTay, taoNguoiNgauNhien } from "./nhan-vat-3d.js";
import { BauTroi } from "./bau-troi.js";
import { GiaoThong } from "./giao-thong.js";
import { SanKhau, CHO_XEM } from "./san-khau.js";
import { DongVat } from "./dong-vat.js";
import { CapCuu } from "./cap-cuu.js";
import { caiDat, khiDoiCaiDat, cheDoNhe, tiLeDiemAnh } from "../cai-dat.js";
import { am } from "../am-thanh-game.js";
import { DoiSong } from "./doi-song.js";
import { cauBan as cauBanNV } from "../loi-noi-nho.js";
import { THANG_MAY, capNhatChiTiet } from "./chi-tiet-cong-ty.js";
import { dungNgoaiCanh, NOI_NGOAI, DIEM_PHO, diaDiemCuaNoi, trongNhaNgoai } from "./ngoai-canh.js";
import { caiToiUu } from "./toi-uu.js";
import { caiToMau, mucVe } from "./to-mau.js";
import { HauKy } from "./hau-ky.js";
import { BongNang } from "./bong-nang.js";
export { NOI_NGOAI, DIEM_PHO, diaDiemCuaNoi };

// âm thanh nền của từng địa điểm ngoài công ty
const AM_NGOAI = {
  quan_oc: { pho: 0.55, dongNguoi: 0.9, beMat: "da" }, dai_tivi: { trongNha: true, dongNguoi: 0.3, beMat: "gach" },
  karaoke: { trongNha: true, dongNguoi: 0.4, beMat: "tham" }, ca_phe: { trongNha: true, dongNguoi: 0.6, pho: 0.15, beMat: "go" },
  tiem: { trongNha: true, dongNguoi: 0.2, pho: 0.15, beMat: "gach" }, phong_tro: { pho: 0.3, dongNguoi: 0.3, beMat: "da" },
  ll_tower: { trongNha: true, dongNguoi: 0.35, beMat: "gach" }, xe_khach: { trongNha: true, pho: 0.6, beMat: "tham" },
  nha_vuon: { gio: 0.15, beMat: "da" }, sky_ao: { trongNha: true, beMat: "go" }, vung_tau: { bien: 1, gio: 0.3, dongNguoi: 0.3, beMat: "cat" },
};
export { CHO_XEM };

const MAT = 1.72;            // tầm mắt
const BAN_KINH = 0.32;       // bán kính người chơi khi va chạm
const TOC_DI = 3.2, TOC_CHAY = 5.6;
const TAM_NOI = 2.3;         // khoảng cách bấm nói chuyện
const DUNG_O_KHU = 1.6;      // tới gần tâm khu bao nhiêu thì mở cảnh

// Lịch sinh hoạt của đồng nghiệp: tới công ty, đi ăn trưa, tan làm (giờ dạng số thập phân)
// cuối tuần chỉ vài người đi làm; tuần cuối trước Đại Nhạc Hội (từ 24/10) thì cả công ty tăng ca
const LAM_CUOI_TUAN = new Set(["chua_te_deadline", "editor", "sieu_nhan_hong", "quan_ly_idol"]);
// số khách lạ ở từng địa điểm ngoài công ty (nơi riêng tư như căn hộ, phòng karaoke thì không có)
const KHACH_NGOAI = { quan_oc: 4, ca_phe: 4, tiem: 2, ll_tower: 3, xe_khach: 5, vung_tau: 4, dai_tivi: 3, phong_tro: 2 };
const VE_MUON = { chua_te_deadline: 21.5, editor: 22, truong_phong: 20, giam_doc: 19.5, sieu_nhan_hong: 20.5, idol_het_thoi: 19, quan_ly_idol: 19.2, it: 19 };
// chỗ đứng ăn ở các xe đồ ăn bên kia đường (bánh mì, chè Bà Bảy, hủ tiếu gõ), quay mặt vào xe
const CHO_AN_PHO = [[-6.9, 42.5], [-5.1, 42.5], [12.6, 42.5], [14.4, 42.5], [39.1, 42.5], [40.9, 42.5], [-14.8, 42.4], [-13.2, 42.4], [21.2, 42.4], [22.8, 42.4]];
// bác Bình tuần tra sân ban đêm: từ chòi ra cổng rồi dọc lối đi vào sảnh
const TUAN_TRA = [[-3.4, 25.6], [2, 25.6], [2, 16.6], [2, 25.6]];
const bam = (ma, muoi = 0) => { let s = 2166136261 + muoi; for (const c of ma) s = Math.imul(s ^ c.charCodeAt(0), 16777619); return ((s >>> 0) % 1000) / 1000; };

export class Game3D {
  constructor(khung, { vai, tenCua, tenVai }) {
    this.khung = khung;
    this.vai = vai;
    this.tenCua = tenCua;      // ma -> tên hiện tại
    this.tenVai = tenVai;      // ma -> tên vai (Rắn Độc...)
    this.dienThoai = matchMedia("(pointer: coarse)").matches;
    this.goc = "1";            // "1" góc nhìn thứ nhất, "3" góc nhìn thứ ba
    this.khoa = false;         // đang hội thoại: không đi lại
    this.mucTieu = null;
    this.phim = {};
    this.yaw = 0; this.pitch = 0;
    this.p = new THREE.Vector3(2, 0, 27); this.tang = 0;
    this.dangDi = false;
    this.t = 0;
    this.onNoiChuyen = null; this.onCauThang = null; this.onToiMucTieu = null; this.onGoiY = null;

    this.nhe = cheDoNhe(); // máy yếu: bớt người, xe, chi tiết
    // mức vẽ: 0 Thấp (như cũ), 1 Vừa (tô kiểu tranh, bóng rẻ), 2 Cao (thêm bóng đủ, hậu kỳ). Sửa shader chung trước khi dịch.
    this.mucVe = caiToMau(mucVe());
    this.renderer = new THREE.WebGLRenderer({ antialias: !this.nhe && caiDat().chatLuong !== "vua" && this.mucVe < 2, powerPreference: "high-performance" });
    this.renderer.setPixelRatio(tiLeDiemAnh());
    if (this.mucVe > 0) {
      // giữ màu phẳng, dịu: chỉ nén nhẹ vùng rất sáng (Neutral), không đổi tông màu thường
      this.renderer.toneMapping = THREE.NeutralToneMapping; this.renderer.toneMappingExposure = 1;
    }
    this.canvas = this.renderer.domElement; this.canvas.className = "g3d-canvas";
    khung.append(this.canvas);

    this.scene = new THREE.Scene();
    this.scene.fog = new THREE.Fog(0xbfd9ec, 40, 130);
    this.camera = new THREE.PerspectiveCamera(caiDat().tamNhin, 1, 0.05, 1000);
    this.scene.add(this.camera);
    this.hemi = new THREE.HemisphereLight(0xffffff, 0xb8ad96, 1.6);
    this.nen = new THREE.AmbientLight(0xffffff, 0.55); this.scene.add(this.nen);
    this.mat_troi = new THREE.DirectionalLight(0xfff1d6, 1.6); this.mat_troi.position.set(30, 50, 40);
    this.scene.add(this.hemi, this.mat_troi);
    // bóng nắng mềm đi theo người chơi (xem bong-nang.js)
    if (this.mucVe > 0) this.bong = new BongNang(this.renderer, this.scene, this.camera, this.mat_troi, this.mucVe);

    this.theGioi = taoTheGioi(this.scene, { dienThoai: this.nhe });
    this.bauTroi = new BauTroi(this.scene, { matUot: this.theGioi.pho.matUot, muc: this.mucVe });
    this.giaoThong = new GiaoThong(this.scene, this.theGioi.pho, { dienThoai: this.nhe });
    this.sanKhau = new SanKhau(this.scene, { dienThoai: this.nhe });
    this.THREE = THREE; // cho công cụ kiểm thử tự động
    this.dongVat = new DongVat(this.scene, this.theGioi.vat, CAO_TANG);
    this.ngoaiCanh = dungNgoaiCanh(this.scene, this.theGioi.vat, { dienThoai: this.nhe });
    // dịch sẵn shader của các địa điểm ngoài công ty để lần đầu tới không bị khựng
    this._henBien = setTimeout(() => {
      if (!this.renderer) return;
      const ds = this.ngoaiCanh.ds; for (const d of ds) d.nhom.visible = true;
      try { this.renderer.compile(this.scene, this.camera); } catch {}
      for (const d of ds) d.nhom.visible = false;
    }, 2500);
    this.dem = null; this.moTaTT = "";

    // Người chơi: thân (góc nhìn 3) + đôi tay (góc nhìn 1)
    this.than = taoNguoi(vai); this.scene.add(this.than.group);
    this.tay = taoDoiTay(vai); this.camera.add(this.tay.group);

    // Đồng nghiệp
    this.npc = [];
    for (const [ma, cho] of Object.entries(CHO_NGOI)) {
      if (ma === vai) continue;
      const nv = taoNguoi(ma);
      nv.group.position.set(cho.x, cho.tang * CAO_TANG, cho.z);
      nv.group.rotation.y = cho.huong ?? 0;
      const bang = taoBangTen(tenCua(ma), tenVai(ma)); bang.position.y = nv.chieuCao + 0.35; nv.group.add(bang);
      this.scene.add(nv.group);
      this.npc.push({ ma, nv, bang, tang: cho.tang, goc0: cho.huong ?? 0, cho });
    }
    for (const n of this.npc) this.veCho(n);
    // đời sống đồng nghiệp: bong bóng thoại, tán gẫu, cử chỉ, đi lại; danh sách ghế ngồi được
    this.doiSong = new DoiSong(this);
    this.ngoiGhe = null; this.lamViec = false; this._hNgoi = 0; this._tLV = 0;
    this.tgLich = 0; this._fr = new THREE.Frustum(); this._mt = new THREE.Matrix4(); this._v3 = new THREE.Vector3();

    // Điểm đánh dấu mục tiêu: vòng sáng + cột sáng
    const mk = new THREE.Group();
    const vong = new THREE.Mesh(new THREE.RingGeometry(0.7, 0.95, 24), new THREE.MeshBasicMaterial({ color: 0xe8702a, side: THREE.DoubleSide, transparent: true, opacity: 0.9 }));
    vong.rotation.x = -Math.PI / 2; vong.position.y = 0.03;
    const cot = new THREE.Mesh(new THREE.CylinderGeometry(0.5, 0.5, 3, 16, 1, true), new THREE.MeshBasicMaterial({ color: 0xe8702a, transparent: true, opacity: 0.18, side: THREE.DoubleSide, depthWrite: false }));
    cot.position.y = 1.5;
    mk.add(vong, cot); mk.visible = false; this.scene.add(mk); this.marker = mk;

    this.taoDieuKhien();
    this._boCaiDat = khiDoiCaiDat(c => {
      this.renderer.setPixelRatio(tiLeDiemAnh()); this.resize();
      if (this.camera.fov !== c.tamNhin) { this.camera.fov = c.tamNhin; this.camera.updateProjectionMatrix(); }
    });
    this.datGio(8, 0);
    this.capNhatGoc();
    if (this.mucVe === 2) this.hauKy = new HauKy(this.renderer, this.scene, this.camera);
    this._resize = () => this.resize(); addEventListener("resize", this._resize); this.resize();
    caiToiUu(this); // gộp nhân vật, đồ lặp (ô, áo mưa), tắt gương ở xa: bớt lượt vẽ
    this._loop = this.loop.bind(this); this.dongHo = new THREE.Clock(); this.renderer.setAnimationLoop(this._loop);
  }

  // ---------- Điều khiển ----------
  taoDieuKhien() {
    const c = this.canvas;
    this._keydown = e => {
      if (e.target.closest?.("input, textarea")) return;
      this.phim[e.code] = true;
      if (this.khoa || e.repeat) return; // giữ phím không lặp lại thao tác
      if (e.code === "KeyV") this.doiGoc();
      if (e.code === "KeyE" || e.code === "Enter") this.tuongTac();
    };
    this._keyup = e => { this.phim[e.code] = false; };
    addEventListener("keydown", this._keydown); addEventListener("keyup", this._keyup);
    this._blur = () => { this.phim = {}; };
    addEventListener("blur", this._blur);

    if (!this.dienThoai) {
      c.addEventListener("click", () => { if (!this.khoa && document.pointerLockElement !== c) c.requestPointerLock?.(); });
      this._mouse = e => { if (document.pointerLockElement !== c || this.khoa) return; this.xoay(e.movementX * 0.0022, e.movementY * 0.0022); };
      document.addEventListener("mousemove", this._mouse);
      this._plc = () => this.onKhoaChuot?.(document.pointerLockElement === c);
      document.addEventListener("pointerlockchange", this._plc);
    } else {
      // Cần gạt trái để đi, kéo nửa phải để nhìn
      const can = document.createElement("div"); can.className = "g3d-stick"; can.innerHTML = "<i></i>";
      this.khung.append(can);
      const num = can.firstChild;
      this.stick = { x: 0, y: 0 };
      let idStick = null, idNhin = null, nx = 0, ny = 0, cx = 0, cy = 0;
      c.addEventListener("touchstart", e => {
        for (const t of e.changedTouches) {
          if (t.clientX < innerWidth * 0.45 && idStick == null) {
            idStick = t.identifier; cx = t.clientX; cy = t.clientY;
            can.style.left = cx + "px"; can.style.top = cy + "px"; can.classList.add("on");
          } else if (idNhin == null) { idNhin = t.identifier; nx = t.clientX; ny = t.clientY; }
        }
      }, { passive: true });
      c.addEventListener("touchmove", e => {
        for (const t of e.changedTouches) {
          if (t.identifier === idStick) {
            let dx = t.clientX - cx, dy = t.clientY - cy; const d = Math.hypot(dx, dy), max = 46;
            if (d > max) { dx *= max / d; dy *= max / d; }
            num.style.transform = `translate(${dx}px, ${dy}px)`;
            this.stick.x = dx / max; this.stick.y = dy / max;
          } else if (t.identifier === idNhin && !this.khoa) {
            this.xoay((t.clientX - nx) * 0.005, (t.clientY - ny) * 0.005); nx = t.clientX; ny = t.clientY;
          }
        }
      }, { passive: true });
      const het = e => {
        for (const t of e.changedTouches) {
          if (t.identifier === idStick) { idStick = null; this.stick.x = this.stick.y = 0; num.style.transform = ""; can.classList.remove("on"); }
          if (t.identifier === idNhin) idNhin = null;
        }
      };
      c.addEventListener("touchend", het); c.addEventListener("touchcancel", het);
    }
  }
  xoay(dx, dy) {
    const c = caiDat(); dx *= c.doNhay; dy *= c.doNhay * (c.daoTrucY ? -1 : 1);
    this.yaw -= dx;
    this.pitch = Math.max(-1.25, Math.min(1.2, this.pitch - dy));
  }
  doiGoc() { this.goc = this.goc === "1" ? "3" : "1"; this.capNhatGoc(); }
  capNhatGoc() {
    this.tay.group.visible = this.goc === "1";
    this.than.group.visible = this.goc === "3";
    this.onDoiGoc?.(this.goc);
  }
  moKhoaChuot() { if (document.pointerLockElement) document.exitPointerLock?.(); }

  // ---------- Thế giới ----------
  resize() {
    const w = this.khung.clientWidth || innerWidth, h = this.khung.clientHeight || innerHeight;
    this.renderer.setSize(w, h, false);
    this.hauKy?.setSize(w, h);
    this.camera.aspect = w / h; this.camera.updateProjectionMatrix();
    // màn hình dọc: kéo đôi tay vào giữa để không lọt khỏi khung hình
    this.tay.group.scale.x = Math.min(1, (w / h) / 1.3);
  }
  datViTri({ tang, x, z, huong }) {
    if (this.ngoiGhe) this.boNgoi();
    this.tang = tang; this.p.set(x, tang * CAO_TANG, z);
    if (huong != null) { this.yaw = huong; this.pitch = 0; }
  }
  // Giờ trong ngày và thời tiết: bầu trời, ánh sáng, đèn đường do BauTroi tính mỗi khung hình
  datGio(gio, phut = 0) { this.bauTroi.gio = gio + phut / 60; this.sanKhau.datGio(gio); }
  datNgay(ngay) {
    this.sanKhau.datNgay(ngay); this.ngay = ngay;
    const thu = new Date(2026, 9, ngay).getDay();
    this.cuoiTuan = (thu === 0 || thu === 6) && ngay < 24;
  }
  datThoiTiet(loai) { this.bauTroi.datThoiTiet(loai); }
  trongNha() { return this.oNgoai() ? trongNhaNgoai(this.p.x, this.p.z) : this.tang < 2 && Math.abs(this.p.x) < 20 && this.p.z > -14 && this.p.z < 14; }
  // đang ở một địa điểm ngoài công ty (các khu dựng riêng ở xa thành phố)
  oNgoai() { return this.tang === 0 && this.p.z < -300; }
  viTriNgoai() { const id = this.oNgoai() && this.ngoaiCanh.dangO(); return id ? AM_NGOAI[id] || {} : null; }
  // đưa người chơi tới một địa điểm ngoài công ty, các nhân vật trong cảnh ngồi/đứng sẵn ở đó
  denNgoai(noi, ten, dsNguoi = []) {
    const d = this.ngoaiCanh.chuanBi(noi, ten); if (!d) return false;
    this.traNpcVeCho(); this.xoaMucTieu();
    this.datViTri({ tang: 0, ...d.vao });
    dsNguoi.slice(0, d.cho.length).forEach((ma, i) => {
      const n = this.npc.find(x => x.ma === ma); if (!n) return;
      const c = d.cho[i];
      n.diDao = null; n.ngu = false; n.tuanTra = null; n.nv.vietTay = 0; n.daDoi = true; n.tang = 0; n.nv.group.visible = true;
      n.nv.ngoi = !!c.ngoi; n.nv.group.position.set(c.x, c.ngoi ? -0.36 : 0, c.z); n.nv.group.rotation.y = c.huong;
    });
    // khách lạ ngồi ở các chỗ còn trống cho đông vui
    const id = Object.keys(NOI_NGOAI).find(k => NOI_NGOAI[k] === d);
    const trong = d.cho.slice(dsNguoi.length).slice(0, KHACH_NGOAI[id] || 0);
    if (!this.khach) {
      let seed = 4242; const rnd = () => (seed = (seed * 16807) % 2147483647) / 2147483647;
      this.khach = Array.from({ length: 6 }, () => { const nv = taoNguoiNgauNhien(rnd); nv.group.visible = false; this.scene.add(nv.group); return nv; });
    }
    this.khach.forEach((nv, i) => {
      const c = trong[i]; nv.group.visible = !!c; if (!c) return;
      nv.ngoi = !!c.ngoi; nv.group.position.set(c.x, c.ngoi ? -0.36 : 0, c.z); nv.group.rotation.y = c.huong;
    });
    return true;
  }
  capNhatTen() { for (const n of this.npc) n.bang.doiTen(this.tenCua(n.ma), this.tenVai(n.ma)); }

  // Mục tiêu: đi tới khu để mở cảnh tiếp theo
  datMucTieu(khu, onToi, { phaiRoiKhoi = false, nguoi = null } = {}) {
    let k = KHU[khu]; if (!k) return;
    this.traNpcVeCho();
    // người nói đầu tiên của cảnh ra đứng ở khu đó; người chơi phải tới sát người này mới mở thoại
    const n = nguoi && this.npc.find(x => x.ma === nguoi);
    if (n) {
      const lech = khu === "cong" || khu === "ra_ngoai" ? [1.4, -1.2] : [1.0, 0];
      const x = k.x + lech[0], z = k.z + lech[1];
      n.diDao = null; n.ngu = false; n.tuanTra = null; n.nv.group.visible = true; n.nv.ngoi = false; n.nv.vietTay = 0; n.nv.group.position.set(x, k.tang * CAO_TANG, z); n.tang = k.tang; n.daDoi = true;
      k = { ...k, x, z, nguoi: n };
    }
    this.mucTieu = { khu, k, onToi, daToi: false, choRoi: phaiRoiKhoi };
    this.marker.position.set(k.x, k.tang * CAO_TANG, k.z);
    this.marker.visible = true;
  }
  // gọi một đồng nghiệp tới đứng trước mặt người chơi (sự kiện bất ngờ): chọn chỗ trống không vướng đồ
  goiNguoiToi(ma) {
    const n = this.npc.find(x => x.ma === ma); if (!n) return false;
    const vat = this.theGioi.vat[this.tang];
    const trong = (x, z) => !vat.some(b => x > b.minX - 0.35 && x < b.maxX + 0.35 && z > b.minZ - 0.35 && z < b.maxZ + 0.35);
    for (const lech of [0, 0.7, -0.7, 1.4, -1.4, Math.PI]) {
      const a = this.yaw + lech, x = this.p.x - Math.sin(a) * 1.3, z = this.p.z - Math.cos(a) * 1.3;
      if (!trong(x, z) || !trong((x + this.p.x) / 2, (z + this.p.z) / 2)) continue;
      n.diDao = null; n.ngu = false; n.tuanTra = null; n.nv.ngoi = false; n.nv.vietTay = 0; n.daDoi = true; n.nv.group.visible = true;
      n.nv.group.position.set(x, this.tang * CAO_TANG, z); n.tang = this.tang;
      n.nv.group.rotation.y = Math.atan2(this.p.x - x, this.p.z - z);
      this.yaw = Math.atan2(this.p.x - x, this.p.z - z); this.pitch = -0.05;
      return true;
    }
    return false;
  }
  traNpcVeCho() {
    for (const n of this.npc) if (n.daDoi) { n.daDoi = false; this.veCho(n); }
  }
  // về chỗ của mình: có ghế thì ngồi xuống gõ máy
  veCho(n) {
    this.doiSong?.huyNpc(n);
    const c = n.cho; n.diDao = null; n.nv.vietTay = 0; n.ngu = false; n.tuanTra = null; n.tt = "ban"; n.nv.group.visible = true;
    n.nv.ngoi = c.ngoi ? (c.nghi ? "nghi" : true) : false; // ghế bàn máy: gõ phím; ghế bành, sofa, ghế nhựa: ngồi chơi
    n.nv.group.position.set(c.x, c.tang * CAO_TANG + (c.ngoi ? c.yNgoi ?? -0.36 : 0), c.z); n.tang = c.tang; n.nv.group.rotation.y = n.goc0;
  }
  dungDay(n) { n.nv.ngoi = false; n.nv.group.position.y = n.tang * CAO_TANG; }
  tang0(n) { return n.cho.tang; }
  // Đi lại, tán gẫu, cử chỉ, bong bóng thoại của đồng nghiệp: xem doi-song.js
  // trạng thái mong muốn của một đồng nghiệp theo giờ
  lichCua(n, gio) {
    const ma = n.ma;
    if (ma === "bac_bao_ve") return gio >= 19 || gio < 6 ? "tuan_tra" : "ban";
    if (ma === "cho") return gio >= 21 || gio < 6.5 ? "ngu" : "ban";
    if (this.cuoiTuan && !LAM_CUOI_TUAN.has(ma)) return "vang";
    const den = 7.55 + bam(ma, 1) * 0.75 + (this.cuoiTuan ? 1.5 : 0), ve = VE_MUON[ma] ?? 17.4 + bam(ma, 2) * 1.2;
    if (gio < den || gio >= ve) return "vang";
    const tr0 = 11.95 + bam(ma, 3) * 0.2, tr1 = 12.9 + bam(ma, 4) * 0.25;
    if (gio >= tr0 && gio < tr1 && bam(ma, 5) < 0.6) return "pho";
    return "ban";
  }
  // người chơi có đang nhìn thấy điểm này không (để người ra vào không hiện/biến mất ngay trước mắt)
  dangThay(tang, x, z) {
    if (tang !== this.tang) return false;
    if (Math.hypot(x - this.p.x, z - this.p.z) > 22) return false;
    return this._fr.containsPoint(this._v3.set(x, tang * CAO_TANG + 1, z));
  }
  capNhatLich(dt, ngay = false) {
    this.tgLich -= dt; if (this.tgLich > 0 && !ngay) return; this.tgLich = 0.5;
    this._mt.multiplyMatrices(this.camera.projectionMatrix, this.camera.matrixWorldInverse); this._fr.setFromProjectionMatrix(this._mt);
    const gio = this.bauTroi.gio;
    let iPho = 0;
    for (const n of this.npc) {
      const muon = this.lichCua(n, gio);
      if (muon === "pho") n.choPho = CHO_AN_PHO[iPho++ % CHO_AN_PHO.length];
      if (n.daDoi || n.diDao || muon === n.tt) continue;
      if (muon === "ban" && this.ngoiGhe?.chu === n.ma) continue; // người chơi đang ngồi ghế người này
      const g = n.nv.group.position;
      const toi = muon === "pho" ? { tang: 0, x: n.choPho[0], z: n.choPho[1] } : muon === "tuan_tra" ? { tang: 0, x: TUAN_TRA[0][0], z: TUAN_TRA[0][1] } : n.cho;
      if (!ngay && ((n.nv.group.visible && this.dangThay(n.tang, g.x, g.z)) || (muon !== "vang" && this.dangThay(toi.tang, toi.x, toi.z)))) continue;
      this.apLich(n, muon);
    }
  }
  apLich(n, tt) {
    this.veCho(n); n.tt = tt;
    const g = n.nv.group;
    if (tt === "vang") g.visible = false;
    else if (tt === "pho") { n.nv.ngoi = false; n.tang = 0; g.position.set(n.choPho[0], 0, n.choPho[1]); g.rotation.y = 0; n.nv.vietTay = 0.6; }
    else if (tt === "tuan_tra") { n.nv.ngoi = false; n.tang = 0; g.position.set(TUAN_TRA[0][0], 0, TUAN_TRA[0][1]); n.tuanTra = { i: 1 }; }
    else if (tt === "ngu") { n.ngu = true; g.position.y -= 0.12; }
  }
  // đổi ngày, nhảy giờ: xếp lại mọi người theo lịch ngay, không chờ khuất tầm nhìn
  xepLichNgay() {
    for (const n of this.npc) if (n.diDao && !n.daDoi) this.veCho(n); // bỏ dở chuyến đi lại khi nhảy giờ / sang ngày
    this.doiSong?.dungHet();
    this.capNhatLich(0, true);
  }
  capNhatTuanTra(dt) {
    for (const n of this.npc) {
      const tt = n.tuanTra; if (!tt || n.daDoi) continue;
      const g = n.nv.group.position, [tx, tz] = TUAN_TRA[tt.i];
      if (this.tang === 0 && Math.hypot(this.p.x - g.x, this.p.z - g.z) < 1) continue; // nhường đường
      const dx = tx - g.x, dz = tz - g.z, kc = Math.hypot(dx, dz);
      if (kc < 0.05) { tt.i = (tt.i + 1) % TUAN_TRA.length; continue; }
      const b = Math.min(kc, 0.9 * dt); g.x += dx / kc * b; g.z += dz / kc * b;
      n.nv.group.rotation.y = Math.atan2(dx, dz); n.dangDi = true;
    }
  }
  xoaMucTieu() { this.mucTieu = null; this.marker.visible = false; }
  // đi nhanh: đưa người chơi tới sát chỗ cảnh tiếp theo (chọn chỗ trống, quay mặt về phía mục tiêu)
  diNhanh() {
    const m = this.mucTieu; if (!m || m.daToi) return false;
    const k = m.k, vat = this.theGioi.vat[k.tang];
    const trong = (x, z) => !vat.some(b => x > b.minX - 0.35 && x < b.maxX + 0.35 && z > b.minZ - 0.35 && z < b.maxZ + 0.35)
      && !this.npc.some(n => n.nv.group.visible && n.tang === k.tang && Math.hypot(n.nv.group.position.x - x, n.nv.group.position.z - z) < 0.6);
    let toi = null;
    for (const [dx, dz] of [[0, 1.2], [1.2, 0], [-1.2, 0], [0, -1.2], [0.9, 0.9], [-0.9, 0.9], [0.9, -0.9], [-0.9, -0.9], [0, 0.7], [0.7, 0]]) {
      if (trong(k.x + dx, k.z + dz)) { toi = [k.x + dx, k.z + dz]; break; }
    }
    if (!toi) toi = [k.x, k.z];
    if (this.ngoiGhe) this.boNgoi(); // đang ngồi thì đứng dậy trước
    m.choRoi = false;
    this.datViTri({ tang: k.tang, x: toi[0], z: toi[1], huong: Math.atan2(-(k.x - toi[0]), -(k.z - toi[1])) });
    return true;
  }
  khoangCachMucTieu() {
    if (!this.mucTieu) return null;
    const k = this.mucTieu.k;
    return { tang: k.tang, d: Math.hypot(this.p.x - k.x, this.p.z - k.z), huong: Math.atan2(k.x - this.p.x, k.z - this.p.z) };
  }

  // ---------- Tương tác ----------
  timTuongTac() {
    // đang ngồi: chỉ có làm việc (ở bàn của mình) hoặc đứng dậy
    if (this.ngoiGhe) {
      const nhac = this.dienThoai ? "kéo cần để đứng dậy" : "W A S D để đứng dậy";
      if (this.ngoiGhe.chu === this.vai) return { loai: "lam_viec", nhan: this.lamViec ? `Nghỉ tay (${nhac})` : `Làm việc (${nhac})` };
      return { loai: "dung_day", nhan: "Đứng dậy" };
    }
    let gan = null, dMin = Infinity;
    for (const n of this.npc) {
      if (n.tang !== this.tang || !n.nv.group.visible) continue;
      const d = Math.hypot(n.nv.group.position.x - this.p.x, n.nv.group.position.z - this.p.z);
      if (d < TAM_NOI && d < dMin) { dMin = d; gan = { loai: "npc", ma: n.ma, nhan: `Nói chuyện với ${this.tenCua(n.ma)}` }; }
    }
    for (const c of [...CAU_THANG, ...THANG_MAY]) {
      if (c.tang !== this.tang) continue;
      const d = Math.hypot(c.x - this.p.x, c.z - this.p.z);
      if (d < 1.8 && d < dMin) { dMin = d; gan = { loai: "cau_thang", c, nhan: c.nhan }; }
    }
    for (const v of DO_VAT) {
      if (v.tang !== this.tang) continue;
      const d = Math.hypot(v.x - this.p.x, v.z - this.p.z);
      if (d < 1.3 && d < dMin) { dMin = d; gan = { loai: "do_vat", v, nhan: v.nhan }; }
    }
    // ghế trống gần đó: ngồi xuống
    // (ghế cà phê cóc nằm sau dãy bàn thấp có rào va chạm: với xa hơn một chút)
    if (this.vai !== "cho") for (const gh of this.doiSong.ghe) {
      const tam = gh.tam ?? 1.35;
      if (gh.tang !== this.tang || Math.abs(gh.x - this.p.x) > tam + 0.05 || Math.abs(gh.z - this.p.z) > tam + 0.05) continue;
      const d = Math.hypot(gh.x - this.p.x, gh.z - this.p.z) + 0.05; // cùng khoảng cách thì nhường người / đồ vật
      if (d < tam && d < dMin && this.gheTrongChoNguoiChoi(gh)) { dMin = d; gan = { loai: "ghe", ghe: gh, nhan: gh.chu === this.vai ? "Ngồi vào bàn của mình" : "Ngồi xuống" }; }
    }
    const dv = this.dongVat.timGan(this.p, this.tang);
    if (dv) { const d = dv.loai === "chim" ? 1.5 : 0; if (d < dMin) { dMin = d; gan = { loai: "do_vat", v: dv, nhan: dv.nhan }; } }
    if (this.tang === 0) {
      const d = Math.hypot(2 - this.p.x, 29 - this.p.z);
      if (d < 2.4 && d < dMin) { dMin = d; gan = { loai: "cong", nhan: "Ra khỏi công ty" }; }
    }
    return gan;
  }
  tuongTac() {
    const bayGio = performance.now();
    if (bayGio - (this._lanTT || 0) < 450) return; // chống bấm dồn dập
    this._lanTT = bayGio;
    const g = this.timTuongTac(); if (!g) return;
    this.tay.voiRa(1); setTimeout(() => !this.khoa && this.tay.voiRa(0), 400);
    if (g.loai === "npc") {
      const n = this.npc.find(x => x.ma === g.ma);
      if (!n.nv.ngoi) n.nv.group.rotation.y = Math.atan2(this.p.x - n.nv.group.position.x, this.p.z - n.nv.group.position.z);
      this.onNoiChuyen?.(g.ma);
    } else if (g.loai === "cau_thang") {
      if (g.c.thangMay) am.phat("thang_may", g.c.x, g.c.z); else am.cauThang();
      this.onCauThang?.(g.c, () => this.datViTri(g.c.toi));
    } else if (g.loai === "do_vat") {
      if (g.v.loai === "meo") this.dongVat.vuot(g.v.meo);
      if (g.v.loai === "chim") this.dongVat.rac(this.p);
      this.onDoVat?.(g.v);
    }
    else if (g.loai === "cong") this.onCong?.();
    else if (g.loai === "ghe") this.ngoiXuong(g.ghe);
    else if (g.loai === "dung_day") this.dungDay();
    else if (g.loai === "lam_viec") this.datLamViec(!this.lamViec);
  }
  // ---------- Ngồi ghế ----------
  gheTrongChoNguoiChoi(gh) {
    if (!this.doiSong.gheTrong(gh)) return false;
    // ghế ngoài phố (trà đá, cà phê cóc, ghế nhựa trong hẻm): khách qua đường đang ngồi thì thôi
    // (khách đang ẩn vì ở xa vẫn tính là có chỗ nếu tới giờ ngồi: _cho.an chỉ đổi khi người chơi đi khuất, không hiện chồng lên người chơi)
    if (gh.pho) for (const nv of this.giaoThong.dungYen || []) if ((nv._cho ? !nv._cho.an : nv.group.visible) && Math.hypot(nv.group.position.x - gh.x, nv.group.position.z - gh.z) < 0.35) return false;
    return true;
  }
  ngoiXuong(gh) {
    this.ngoiGhe = gh; this.lamViec = false; this._tLV = 0;
    this.p.set(gh.x, gh.tang * CAO_TANG, gh.z); this.tang = gh.tang;
    this.yaw = gh.huong + Math.PI; this.pitch = gh.chu === this.vai ? -0.2 : -0.06;
    this.than.ngoi = "nghi"; this.than.khongUong = true;
    this.than.group.rotation.y = gh.huong;
    this.dangDi = false;
    am.phat("ghe", gh.x, gh.z);
  }
  datLamViec(co) {
    if (!this.ngoiGhe) return;
    this.lamViec = co; this._tLV = 0;
    const goPhim = co && !this.ngoiGhe.nghi; // ghế không có bàn phím (ghế trực cổng, sofa, ghế bành): làm việc mà không gõ máy
    this.tay.datGo?.(goPhim);
    this.than.ngoi = goPhim ? true : "nghi";
    if (co) this.pitch = Math.min(this.pitch, -0.2);
  }
  // bỏ trạng thái ngồi (không tìm chỗ đứng: dùng khi dịch chuyển đi nơi khác)
  boNgoi() {
    this.ngoiGhe = null; this.lamViec = false;
    this.tay.datGo?.(false); this.than.ngoi = false; this.than.khongUong = false;
  }
  // đứng dậy: bước ra chỗ trống cạnh ghế (sau lưng, hai bên, phía trước)
  dungDay() {
    const gh = this.ngoiGhe; if (!gh) return;
    this.boNgoi();
    const vat = this.theGioi.vat[this.tang];
    const trong = (x, z) => !vat.some(b => x > b.minX - BAN_KINH && x < b.maxX + BAN_KINH && z > b.minZ - BAN_KINH && z < b.maxZ + BAN_KINH)
      && !this.npc.some(n => n.tang === this.tang && n.nv.group.visible && Math.hypot(n.nv.group.position.x - x, n.nv.group.position.z - z) < 0.6);
    for (const kc of [0.75, 1.05, 1.4, 1.9, 2.4]) for (const lech of [Math.PI, Math.PI / 2, -Math.PI / 2, 0.75 * Math.PI, -0.75 * Math.PI, 0]) {
      const a = gh.huong + lech, x = gh.x + Math.sin(a) * kc, z = gh.z + Math.cos(a) * kc;
      if (trong(x, z)) { this.p.x = x; this.p.z = z; am.phat("ghe", gh.x, gh.z); return; }
    }
    am.phat("ghe", gh.x, gh.z);
  }
  // câu đáp khi người chơi bắt chuyện mà nhân vật không có cảnh truyện: hiện bong bóng trên đầu và trả về câu
  cauBan(ma) {
    const chu = cauBanNV(ma, { gio: this.bauTroi.gio, ngay: this.ngay ?? 1, mua: (this.bauTroi.tt?.mua || 0) > 0, vai: this.vai, tenCua: this.tenCua });
    const n = this.npc.find(x => x.ma === ma);
    if (n && !this.khoa) { this.doiSong.ketThucHoiCua(n); this.doiSong.noi(n, chu, undefined, true); n.tBark = this.t + 20; }
    return chu;
  }
  datKhoa(k) {
    this.khoa = k; this.phim = {}; if (this.stick) this.stick.x = this.stick.y = 0;
    this.tay.voiRa(k ? 0.6 : 0);
    if (k) this.moKhoaChuot();
    if (k) this.doiSong?.dungHet();
    if (!k) for (const n of this.npc) if (!n.daDoi && !n.diDao && n.tt === "ban") n.nv.group.rotation.y = n.goc0;
  }

  // ---------- Vòng lặp ----------
  diChuyen(dt) {
    let f = 0, s = 0;
    // đang ngồi: bấm phím đi (hoặc kéo cần) thì đứng dậy, không thì ngồi yên
    if (this.ngoiGhe) {
      const di = !this.khoa && (this.phim.KeyW || this.phim.KeyA || this.phim.KeyS || this.phim.KeyD || this.phim.ArrowUp || this.phim.ArrowDown || this.phim.ArrowLeft || this.phim.ArrowRight || (this.stick && Math.hypot(this.stick.x, this.stick.y) > 0.35));
      if (di) this.dungDay();
      this.dangDi = false; this.dangChay = false; return;
    }
    if (!this.khoa) {
      if (this.phim.KeyW || this.phim.ArrowUp) f += 1;
      if (this.phim.KeyS || this.phim.ArrowDown) f -= 1;
      if (this.phim.KeyA || this.phim.ArrowLeft) s -= 1;
      if (this.phim.KeyD || this.phim.ArrowRight) s += 1;
      if (this.stick) { f -= this.stick.y; s += this.stick.x; }
    }
    const len = Math.hypot(f, s);
    this.dangDi = len > 0.15;
    if (!this.dangDi) { this.dangChay = false; return; }
    if (len > 1) { f /= len; s /= len; }
    // đói, khát, kiệt sức thì đi chậm và không chạy được
    this.dangChay = !this.camChay && (this.phim.ShiftLeft || this.phim.ShiftRight || (this.stick && len > 0.95));
    const toc = (this.dangChay ? TOC_CHAY : TOC_DI) * (this.hsToc ?? 1) * dt;
    const sy = Math.sin(this.yaw), cy = Math.cos(this.yaw);
    // hướng nhìn: (−sin yaw, −cos yaw)
    const dx = (-sy * f + cy * s) * toc, dz = (-cy * f - sy * s) * toc;
    const vat = this.theGioi.vat[this.tang];
    // đang bị xe ép sát (xe vừa chạy tới chỗ mình đứng) thì bỏ qua va chạm xe để bước ra được
    const keoXe = this.tang === 0 && this.p.z > 29 && this.giaoThong.chan(this.p.x, this.p.z);
    const dung = (x, z) => {
      for (const b of vat) if (x > b.minX - BAN_KINH && x < b.maxX + BAN_KINH && z > b.minZ - BAN_KINH && z < b.maxZ + BAN_KINH) return true;
      for (const n of this.npc) if (n.tang === this.tang && n.nv.group.visible && Math.hypot(n.nv.group.position.x - x, n.nv.group.position.z - z) < 0.55) return true;
      for (const nv of this.khach || []) if (nv.group.visible && Math.hypot(nv.group.position.x - x, nv.group.position.z - z) < 0.5) return true;
      if (!keoXe && this.tang === 0 && z > 29 && this.giaoThong.chan(x, z)) return true;
      return false;
    };
    if (!dung(this.p.x + dx, this.p.z)) this.p.x += dx;
    if (!dung(this.p.x, this.p.z + dz)) this.p.z += dz;
    this.huongThan = Math.atan2(dx, dz);
  }
  loop() {
    const dt = Math.min(0.1, this.dongHo.getDelta());
    this.t += dt;
    this.diChuyen(dt);
    const y = this.tang * CAO_TANG;
    // ngồi: hạ tầm mắt xuống ngang người ngồi ghế
    this._hNgoi += ((this.ngoiGhe ? 0.4 : 0) - this._hNgoi) * Math.min(1, dt * 7);
    // camera
    if (this.goc === "1") {
      const nhun = this.dangDi ? Math.sin(this.t * 9) * 0.035 : 0;
      this.camera.position.set(this.p.x, y + MAT + nhun - this._hNgoi, this.p.z);
      this.camera.rotation.set(this.pitch, this.yaw, 0, "YXZ");
    } else {
      const xa = 3.6, cao = 1.2;
      const huong = new THREE.Vector3(-Math.sin(this.yaw) * Math.cos(this.pitch), Math.sin(this.pitch), -Math.cos(this.yaw) * Math.cos(this.pitch));
      const dau = new THREE.Vector3(this.p.x, y + 1.55 - this._hNgoi, this.p.z);
      let k = xa;
      // kéo camera lại gần nếu vướng tường
      for (let d = 0.4; d <= xa; d += 0.2) {
        const px = dau.x - huong.x * d, pz = dau.z - huong.z * d;
        if (this.theGioi.vat[this.tang].some(b => b.tuong && px > b.minX - 0.15 && px < b.maxX + 0.15 && pz > b.minZ - 0.15 && pz < b.maxZ + 0.15)) { k = d - 0.2; break; }
      }
      this.camera.position.set(dau.x - huong.x * k, Math.min(dau.y - huong.y * k + cao * 0.3, y + 3.4), dau.z - huong.z * k);
      this.camera.lookAt(dau.x + huong.x * 2, dau.y + huong.y * 2, dau.z + huong.z * 2);
      this.than.group.position.set(this.p.x, y + (this.ngoiGhe ? this.ngoiGhe.y : 0), this.p.z);
      this.than.group.visible = k > 1.1;
      if (this.ngoiGhe) this.than.group.rotation.y = this.ngoiGhe.huong;
      else if (this.dangDi && this.huongThan != null) {
        const muc = this.huongThan; let d = muc - this.than.group.rotation.y;
        d = Math.atan2(Math.sin(d), Math.cos(d));
        this.than.group.rotation.y += d * Math.min(1, dt * 12);
      }
    }
    this.than.hoatDong(this.t, this.dangDi, this.phim.ShiftLeft ? 1.5 : 1);
    this.tay.hoatDong(this.t, this.dangDi, dt);
    // ngồi làm việc ở bàn mình: tiếng gõ phím, báo cho main.js mỗi giây
    if (this.lamViec && this.ngoiGhe && !this.khoa) {
      this._tLV += dt;
      if (!this.ngoiGhe.nghi && Math.random() < dt * 5) am.phat("go_phim", this.p.x, this.p.z);
      if (this._tLV >= 1) { const s = Math.floor(this._tLV); this._tLV -= s; this.onLamViec?.(s); }
    }
    if (!this.khoa) this.capNhatTuanTra(dt);
    this.doiSong.capNhat(dt);
    this.capNhatLich(dt);
    for (const n of this.npc) {
      if (!n.nv.group.visible) { n.bang.visible = false; n._kc = 99; continue; }
      if (!n.ngu) n.nv.hoatDong(this.t + n.goc0 * 3, !!(n.dangDi && !this.khoa)); n.dangDi = false;
      const kc = Math.hypot(n.nv.group.position.x - this.p.x, n.nv.group.position.z - this.p.z);
      n.bang.visible = n.tang === this.tang && kc < 9 && !(this.khoa && kc < 3); // đang nói chuyện sát mặt thì ẩn bảng tên
      n._kc = kc;
    }
    // hai bảng tên chồng lên nhau trên màn hình: chỉ giữ bảng của người gần hơn
    const giu = [], v = this._v3;
    for (const n of this.npc.filter(n => n.bang.visible).sort((a, b) => a._kc - b._kc)) {
      n.bang.getWorldPosition(v); v.project(this.camera);
      const rong = 0.5 / Math.max(1, n._kc); // bảng càng gần càng to
      if (giu.some(q => Math.abs(q.x - v.x) < rong + q.r && Math.abs(q.y - v.y) < rong * 0.7 + q.r * 0.7)) n.bang.visible = false;
      else giu.push({ x: v.x, y: v.y, r: rong });
    }
    for (const l of this.theGioi.nhapNhay) l.visible = Math.sin(this.t * 6 + l.position.x * 9) > -0.3;
    if (this.marker.visible) this.marker.children[0].scale.setScalar(1 + Math.sin(this.t * 4) * 0.08);
    // tới mục tiêu?
    if (this.mucTieu && !this.mucTieu.daToi && !this.khoa) {
      const m = this.khoangCachMucTieu();
      if (this.mucTieu.choRoi) { if (m.tang !== this.tang || m.d > DUNG_O_KHU + 0.8) this.mucTieu.choRoi = false; }
      else if (m.tang === this.tang && m.d < (this.mucTieu.k.nguoi ? TAM_NOI - 0.3 : DUNG_O_KHU)) {
        this.mucTieu.daToi = true; const cb = this.mucTieu.onToi, ng = this.mucTieu.k.nguoi; this.xoaMucTieu();
        if (ng) { const gp = ng.nv.group.position; ng.nv.group.rotation.y = Math.atan2(this.p.x - gp.x, this.p.z - gp.z); this.yaw = Math.atan2(this.p.x - gp.x, this.p.z - gp.z); this.pitch = -0.05; }
        cb?.();
      }
    }
    // bầu trời, thời tiết, đèn buổi tối
    const trong = this.trongNha();
    const kq = this.bauTroi.capNhat(dt, this.camera, { hemi: this.hemi, nen: this.nen, matTroi: this.mat_troi }, trong);
    this.giaoThong.datMoiTruong?.({ gio: this.bauTroi.gio, ngay: kq.ngay, mua: this.bauTroi.tt.mua, uot: this.bauTroi.uot, sang: this.bauTroi.tt.sang });
    if (kq.dem !== this.dem) {
      this.dem = kq.dem;
      for (const d of this.theGioi.denDem) d.material.color.set(kq.dem ? 0xffe2a0 : 0xf3efe6);
      const p = this.theGioi.pho;
      p.kinhDem.emissive.set(kq.dem ? 0x9a7a3a : 0x000000);
      p.trongQuan.emissive.set(kq.dem ? 0x8a6a3a : 0x000000);
    }
    this._tt = (this._tt || 0) + dt;
    if (this._tt > 1) { this._tt = 0; const m = this.bauTroi.moTa(); if (m !== this.moTaTT) { this.moTaTT = m; this.onThoiTiet?.(m); } }
    // giao thông: ẩn khi đang ở sâu trong tòa nhà cho nhẹ máy
    this.dongVat.capNhat(dt, this.t, this.p, this.tang);
    if (this.tang === 0) this.sanKhau.capNhat(dt, this.t, this.p); else this.sanKhau.nhom.visible = false;
    this.giaoThong.capNhat(dt, this.t, { x: this.p.x, z: this.p.z, tang: this.tang }, !this.oNgoai() && (!(trong && this.p.z < 8) && this.tang < 2 || this.tang === 2));
    this.capCuu?.capNhat(dt);
    capNhatChiTiet(dt, this.bauTroi.gio, this.p, this.tang, this.npc); // cửa tự mở, cửa sổ theo giờ, đồng hồ treo tường
    this.ngoaiCanh.capNhat(dt, this.t, this.tang === 0 ? this.p : null);
    const ngoai = this.oNgoai(); // ở địa điểm ngoài công ty: ẩn cả thành phố cho nhẹ máy
    if (this.theGioi.nhom.visible === ngoai) {
      this.theGioi.nhom.visible = !ngoai; this.dongVat.nhom.visible = !ngoai;
      if (!ngoai) for (const nv of this.khach || []) nv.group.visible = false;
    }
    for (const nv of this.khach || []) if (nv.group.visible) nv.hoatDong(this.t + nv.group.position.x, false);
    // đêm khuya văn phòng vắng người: tắt bớt đèn
    const gioNay = this.bauTroi.gio, khuya = !ngoai && trong && (gioNay >= 21 || gioNay < 6) && this.npc.filter(n => n.nv.group.visible && n.tang === this.tang && Math.abs(n.nv.group.position.x) < 21 && Math.abs(n.nv.group.position.z) < 14).length <= 2;
    this._den = (this._den ?? 1) + ((khuya ? 0.5 : 1) - (this._den ?? 1)) * Math.min(1, dt * 1.5);
    if (this._den < 0.999) { this.hemi.intensity *= this._den; this.nen.intensity *= this._den; }
    am.capNhatGame(this, dt);
    this.onGoiY?.(this.khoa || this.capCuu ? null : this.timTuongTac());
    this.bong?.capNhat(dt, this.camera.position, this.yaw, trong, this.bauTroi._nang ?? 1);
    this.onKhung?.();
    if (this.hauKy) { this.hauKy.datMoiTruong(kq.ngay); this.hauKy.render(dt); }
    else this.renderer.render(this.scene, this.camera);
  }
  // xỉu: khóa điều khiển, chạy cảnh cấp cứu
  xiu({ onPha, onXong }) {
    if (this.capCuu) return;
    this.datKhoa(true); this.xoaMucTieu();
    this.capCuu = new CapCuu(this, { onPha, onXong });
  }
  huy() {
    clearTimeout(this._henBien);
    am.huyGame();
    this.doiSong?.huy();
    this.ngoaiCanh?.huy();
    this._boCaiDat?.();
    this.sanKhau?.huy();
    this.renderer.setAnimationLoop(null);
    this.hauKy?.dispose();
    removeEventListener("resize", this._resize); removeEventListener("keydown", this._keydown); removeEventListener("keyup", this._keyup); removeEventListener("blur", this._blur);
    if (this._mouse) document.removeEventListener("mousemove", this._mouse);
    if (this._plc) document.removeEventListener("pointerlockchange", this._plc);
    this.moKhoaChuot();
    this.renderer.dispose();
    this.khung.replaceChildren();
  }
}
