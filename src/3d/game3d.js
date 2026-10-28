// Lõi game 3D: camera góc nhìn thứ nhất / thứ ba, di chuyển, va chạm, tương tác, mục tiêu cảnh, ánh sáng theo giờ.
// Phần truyện (Ink) do main.js điều khiển; file này chỉ báo sự kiện qua các hàm onXxx.
import * as THREE from "three";
import { taoTheGioi, KHU, CAU_THANG, CHO_NGOI, CAO_TANG, DO_VAT } from "./the-gioi.js";
import { taoNguoi, taoBangTen, taoDoiTay, taoNguoiNgauNhien } from "./nhan-vat-3d.js";
import { BauTroi } from "./bau-troi.js";
import { GiaoThong, duoiDuong } from "./giao-thong.js";
import { XeRieng } from "./xe-rieng.js";
import { TroChuyenPho } from "./tro-chuyen-pho.js";
import { chiTay, thaTay } from "./nguoi-pho.js";
import { SanKhau, CHO_XEM } from "./san-khau.js";
import { DongVat } from "./dong-vat.js";
import { CapCuu } from "./cap-cuu.js";
import { caiDat, khiDoiCaiDat, cheDoNhe, tiLeDiemAnh } from "../cai-dat.js";
import { am } from "../am-thanh-game.js";
import { DoiSong } from "./doi-song.js";
import { cauBan as cauBanNV } from "../loi-noi-nho.js";
import { THANG_MAY, capNhatChiTiet, boChiTiet } from "./chi-tiet-cong-ty.js";
import { dungNgoaiCanh, NOI_NGOAI, DIEM_PHO, diaDiemCuaNoi, trongNhaNgoai } from "./ngoai-canh.js";
import { caiToiUu, capNhatMaTranNhanh, xuLyHangDoi, conChoGop } from "./toi-uu.js";
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
const VUONG_VAT = { vat: true };
const BAN_KINH = 0.32;       // bán kính người chơi khi va chạm
const TOC_DI = 3.2, TOC_CHAY = 5.6;
const TAM_NOI = 2.3;         // khoảng cách bấm nói chuyện
const DUNG_O_KHU = 1.6;      // tới gần tâm khu bao nhiêu thì mở cảnh
// nhảy: nhún 0,11 s, bay ~0,5 s cao ~0,45 m (trọng lực 14,4 m/s², vận tốc bật 3,6 m/s), tiếp đất chùng gối 0,2 s
const NHAY_NHUN = 0.11, NHAY_DAP = 0.2, NHAY_G = 14.4, NHAY_V = 3.6;
const MAT_NGOI_DAT = 0.8;    // tầm mắt khi ngồi bệt xuống đất
// dáng chân theo góc đùi a (ra trước) và gối k: hông hạ xuống bao nhiêu so với lúc đứng thẳng (đùi 0,44, cẳng chân + bàn chân 0,46)
const haHong = (a, k) => 0.9 - (0.44 * Math.cos(a) + 0.46 * Math.cos(a - k));
const muot = x => x * x * (3 - 2 * x);

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
  }

  // Dựng thế giới từng bước, nghỉ giữa các bước để trình duyệt kịp vẽ màn hình chờ;
  // tienDo(buoc, tiLe) báo bước đang làm và tỉ lệ đã xong (0..1)
  async khoiDong(tienDo = () => {}) {
    const { vai, tenCua, tenVai } = this, khung = this.khung;
    const nghi = () => new Promise(r => { let xong = false; const f = () => { if (!xong) { xong = true; r(); } }; requestAnimationFrame(() => setTimeout(f, 0)); setTimeout(f, 60); });
    const buoc = async (ten, tiLe) => { tienDo(ten, tiLe); await nghi(); if (this.daHuy) throw new Error("huy"); };
    await buoc("den", 0.22);

    this.nhe = cheDoNhe(); // máy yếu: bớt người, xe, chi tiết
    // mức vẽ: 0 Thấp (như cũ), 1 Vừa (tô kiểu tranh, bóng rẻ), 2 Cao (thêm bóng đủ, hậu kỳ). Sửa shader chung trước khi dịch.
    this.mucVe = caiToMau(mucVe());
    this.renderer = new THREE.WebGLRenderer({ antialias: !this.nhe && caiDat().chatLuong !== "vua" && this.mucVe < 2 && devicePixelRatio < 1.5, powerPreference: "high-performance" });
    this.renderer.setPixelRatio(tiLeDiemAnh());
    // bản phát hành: không đọc nhật ký dịch shader (gọi đồng bộ, bắt trình duyệt chờ dịch xong mới vẽ tiếp)
    this.renderer.debug.checkShaderErrors = !!import.meta.env.DEV;
    if (this.mucVe > 0) {
      // giữ màu phẳng, dịu: chỉ nén nhẹ vùng rất sáng (Neutral), không đổi tông màu thường
      this.renderer.toneMapping = THREE.NeutralToneMapping; this.renderer.toneMappingExposure = 1;
    }
    this.canvas = this.renderer.domElement; this.canvas.className = "g3d-canvas";
    khung.append(this.canvas);

    this.scene = new THREE.Scene();
    capNhatMaTranNhanh(this.scene); // không tính lại ma trận của nhánh đang ẩn
    this.scene.fog = new THREE.Fog(0xbfd9ec, 40, 130);
    this.camera = new THREE.PerspectiveCamera(caiDat().tamNhin, 1, 0.05, 1000);
    this.scene.add(this.camera);
    this.hemi = new THREE.HemisphereLight(0xffffff, 0xb8ad96, 1.6);
    this.nen = new THREE.AmbientLight(0xffffff, 0.55); this.scene.add(this.nen);
    this.mat_troi = new THREE.DirectionalLight(0xfff1d6, 1.6); this.mat_troi.position.set(30, 50, 40);
    this.scene.add(this.hemi, this.mat_troi);
    // bóng nắng mềm đi theo người chơi (xem bong-nang.js)
    if (this.mucVe > 0) this.bong = new BongNang(this.renderer, this.scene, this.camera, this.mat_troi, this.mucVe);

    await buoc("toa_nha", 0.28);
    this.theGioi = taoTheGioi(this.scene, { dienThoai: this.nhe });
    await buoc("duong_pho", 0.55);
    this.bauTroi = new BauTroi(this.scene, { matUot: this.theGioi.pho.matUot, muc: this.mucVe });
    this.giaoThong = new GiaoThong(this.scene, this.theGioi.pho, { dienThoai: this.nhe });
    await buoc("san_khau", 0.66);
    this.sanKhau = new SanKhau(this.scene, { dienThoai: this.nhe });
    this.THREE = { Vector2: THREE.Vector2, Vector3: THREE.Vector3, Matrix4: THREE.Matrix4, Frustum: THREE.Frustum, Sphere: THREE.Sphere, Raycaster: THREE.Raycaster, PerspectiveCamera: THREE.PerspectiveCamera, MeshStandardMaterial: THREE.MeshStandardMaterial }; // cho công cụ kiểm thử tự động
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

    await buoc("dong_nghiep", 0.74);
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
    await buoc("dong_nghiep", 0.765);
    for (const n of this.npc) this.veCho(n);
    // đời sống đồng nghiệp: bong bóng thoại, tán gẫu, cử chỉ, đi lại; danh sách ghế ngồi được
    await buoc("dong_nghiep", 0.775);
    this.doiSong = new DoiSong(this);
    this.troChuyenPho = new TroChuyenPho(this); // bắt chuyện người ngoài phố
    this.xeRieng = new XeRieng(this);           // xe máy riêng ở nhà xe nhân viên
    this.nhay = null; this.ngoiDat = null; this._anToan = 0; this._vx = 0; this._vz = 0; this._vuongXe = { xe: null }; this._vuongNg = { nguoi: null };
    await buoc("dong_nghiep", 0.785);
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
      this._dpg = null; this.renderer.setPixelRatio(tiLeDiemAnh()); this.resize();
      if (this.camera.fov !== c.tamNhin) { this.camera.fov = c.tamNhin; this.camera.updateProjectionMatrix(); }
    });
    this.datGio(8, 0);
    this.capNhatGoc();
    if (this.mucVe === 2) this.hauKy = new HauKy(this.renderer, this.scene, this.camera);
    this._resize = () => this.resize(); addEventListener("resize", this._resize); this.resize();
    await buoc("dong_nghiep", 0.8);
    caiToiUu(this); // gộp nhân vật, đồ lặp (ô, áo mưa), tắt gương ở xa: bớt lượt vẽ
    // gộp hết nhân vật ngay trong lúc chờ (không để dồn sang những giây đầu chơi, mỗi khung hình gộp một ít làm khựng);
    // dạng khối gộp (có xương) cũng nhờ đó được dịch shader sẵn ở bước sau
    for (let i = 0; conChoGop() && i < 400; i++) { xuLyHangDoi(50); await buoc("dong_nghiep", 0.8); }
    // dịch sẵn shader của cảnh đang có (song song nếu card đồ hoạ hỗ trợ) để lúc vào không khựng
    await buoc("shader", 0.82);
    this.giaoThong.capNhatLap(); // khối lặp (ô, áo mưa) có sẵn để dịch shader luôn
    try { await this.renderer.compileAsync(this.scene, this.camera); } catch {}
    // tải sẵn mọi ảnh (bảng hiệu, mặt tiền, cửa sổ...) lên card đồ hoạ: không thì mỗi lần đi tới khu mới, quay người
    // là vài ảnh lớn tải cùng lúc (kèm tạo mipmap), hình đứng khựng
    await buoc("vao_ca", 0.88);
    const anh = new Set();
    const lay = v => { if (v?.isTexture && !v.isVideoTexture && !v.isRenderTargetTexture && v.image) anh.add(v); };
    this.scene.traverse(o => {
      const ms = o.material ? (Array.isArray(o.material) ? o.material : [o.material]) : [];
      for (const m of ms) { for (const k in m) lay(m[k]); if (m.uniforms) for (const u of Object.values(m.uniforms)) lay(u.value); }
    });
    let t0 = performance.now(), i = 0;
    for (const t of anh) {
      try { this.renderer.initTexture(t); } catch {}
      if (performance.now() - t0 > 60) { await buoc("vao_ca", 0.88 + 0.06 * (++i / anh.size)); t0 = performance.now(); }
      else i++;
    }
    await buoc("vao_ca", 0.94);
    this._loop = this.loop.bind(this); this.dongHo = new THREE.Clock(); this.renderer.setAnimationLoop(this._loop);
    await nghi(); await nghi();
    tienDo("xong", 1);
  }

  // ---------- Điều khiển ----------
  taoDieuKhien() {
    const c = this.canvas;
    // gỡ hết khi thoát ván (canvas còn bị renderer cũ tham chiếu: không gỡ thì giữ lại cả ván trong bộ nhớ)
    this._ngat = new AbortController();
    this._keydown = e => {
      if (e.target.closest?.("input, textarea")) return;
      this.phim[e.code] = true;
      if (this.khoa || e.repeat) return; // giữ phím không lặp lại thao tác
      if (e.code === "KeyV") this.doiGoc();
      if (e.code === "KeyE" || e.code === "Enter") this.tuongTac();
      // Space: nhảy (chỉ khi không có hội thoại, bảng, điện thoại: lúc đó game đã khóa, Space để đọc thoại)
      if (e.code === "Space" && !e.target.closest?.("button, a, select") && this.onChoPhep?.() !== false) { e.preventDefault(); this.batNhay(); }
      // Ctrl / C: ngồi bệt xuống đất, bấm lại (hoặc đi) để đứng dậy
      if ((e.code === "ControlLeft" || e.code === "ControlRight" || (e.code === "KeyC" && !e.ctrlKey)) && !e.metaKey && !e.altKey && this.onChoPhep?.() !== false) this.batNgoiDat();
    };
    this._keyup = e => { this.phim[e.code] = false; };
    addEventListener("keydown", this._keydown); addEventListener("keyup", this._keyup);
    this._blur = () => { this.phim = {}; };
    addEventListener("blur", this._blur);

    if (!this.dienThoai) {
      c.addEventListener("click", () => { if (!this.khoa && document.pointerLockElement !== c) c.requestPointerLock?.(); }, { signal: this._ngat.signal });
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
      }, { passive: true, signal: this._ngat.signal });
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
      }, { passive: true, signal: this._ngat.signal });
      const het = e => {
        for (const t of e.changedTouches) {
          if (t.identifier === idStick) { idStick = null; this.stick.x = this.stick.y = 0; num.style.transform = ""; can.classList.remove("on"); }
          if (t.identifier === idNhin) idNhin = null;
        }
      };
      c.addEventListener("touchend", het, { signal: this._ngat.signal }); c.addEventListener("touchcancel", het, { signal: this._ngat.signal });
      // nút nhảy, ngồi bệt cho màn hình cảm ứng
      const nut = (lop, chu, f) => { const b = document.createElement("button"); b.className = "g3d-nut-tay " + lop; b.textContent = chu; b.addEventListener("click", e => { e.stopPropagation(); if (!this.khoa) f(); }); this.khung.append(b); };
      nut("nhay", "Nhảy", () => this.batNhay()); nut("ngoi", "Ngồi", () => this.batNgoiDat());
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
    // dịch chuyển (đi nhanh, xe buýt, xe ôm, cảnh truyện...): xuống xe máy (xe ở lại chỗ cũ), bỏ nhảy / ngồi bệt,
    // không xét tai nạn trong chốc lát (khỏi bị tính là bị tông khi vừa hiện ra)
    if (this.xeRieng?.dangLai) this.xeRieng.xuong();
    this.nhay = null; this.boNgoiDat(true); this._anToan = this.t + 2.5;
    this.troChuyenPho?.traHet();
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
  // Đang ở trong công ty thì không vẽ những gì chắc chắn không nhìn thấy (cửa sổ văn phòng là ảnh vẽ sẵn):
  // ở tầng trên: ẩn mọi ô thành phố ngoài khuôn viên công ty và khu phố xa; ở tầng trệt sâu bên trong: ẩn khu phố xa
  anNgoaiTroi(trong) {
    const muc = !trong || this.oNgoai() ? 0 : this.tang === 1 ? 2 : this.p.z < 6 ? 1 : 0;
    if (muc === this._mucAn) return;
    this._mucAn = muc;
    if (!this._dsO) {
      this._dsO = []; this._dsXa = [];
      this.theGioi.nhom.traverse(o => { if (o.userData.o) this._dsO.push(o); else if (o.isMesh && o.name.startsWith("kpx-")) this._dsXa.push(o); });
    }
    // ô giao với khuôn viên công ty (x -20..20, z -14..14, nới 2 m) luôn vẽ
    const ngoai = o => { const [x, z, c] = o.userData.o; return x + c < -22 || x > 22 || z + c < -16 || z > 16; };
    for (const o of this._dsO) o.visible = !(muc === 2 && ngoai(o));
    for (const o of this._dsXa) o.visible = muc === 0;
  }
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
    // đang lái xe máy: chỉ có xuống xe (chạy chậm lại đã)
    if (this.xeRieng?.dangLai) return Math.abs(this.xeRieng.v) < 1.5 ? { loai: "xuong_xe", nhan: "Xuống xe, dựng xe ở đây" } : null;
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
    // người ngoài phố (đồng nghiệp, đồ vật ở gần bằng nhau thì ưu tiên trước)
    if (this.tang === 0 && !this.oNgoai()) {
      const m = this.troChuyenPho.timGan(this.p.x, this.p.z, Math.min(2.1, dMin - 0.4));
      if (m) { dMin = m.d + 0.4; gan = { loai: "pho", muc: { ...m }, nhan: this.troChuyenPho.nhan(m) }; }
      if (this.xeRieng.coTheLen()) { const d = Math.hypot(this.xeRieng.x - this.p.x, this.xeRieng.z - this.p.z); if (d < dMin) { dMin = d; gan = { loai: "len_xe", nhan: "Lên xe máy" }; } }
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
    else if (g.loai === "pho") this.troChuyenPho.noi(g.muc);
    else if (g.loai === "len_xe") this.xeRieng.len();
    else if (g.loai === "xuong_xe") this.xeRieng.xuong();
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
    this.boNgoiDat(true); this.nhay = null;
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

  // ---------- Va chạm ----------
  // điểm (x, z) với bán kính r có vướng gì không: null, { vat }, { xe } (xe đang chạy ngoài phố), { nguoi } (người ngoài phố)
  // tu: chỗ đang đứng; người ngoài phố chỉ chặn khi bước tới gần họ hơn (đang sát nhau vẫn bước ra được)
  chanTai(x, z, r, { boXeRieng = false, tu = null, boXe = false } = {}) {
    const vat = this.theGioi.vat[this.tang];
    for (const b of vat) if (x > b.minX - r && x < b.maxX + r && z > b.minZ - r && z < b.maxZ + r) return VUONG_VAT;
    const rn = r + 0.23;
    for (const n of this.npc) if (n.tang === this.tang && n.nv.group.visible && Math.hypot(n.nv.group.position.x - x, n.nv.group.position.z - z) < rn) return VUONG_VAT;
    for (const nv of this.khach || []) if (nv.group.visible && Math.hypot(nv.group.position.x - x, nv.group.position.z - z) < r + 0.18) return VUONG_VAT;
    if (this.tang !== 0 || this.oNgoai()) return null;
    // xe trên mọi tuyến đường (cả đại lộ Kẹt Xe), trừ trong khuôn viên công ty
    if (!boXe && !(Math.abs(x) < 24 && z < 30)) { const xe = this.giaoThong.chan(x, z); if (xe) { this._vuongXe.xe = xe; return this._vuongXe; } }
    if (!boXeRieng && this.xeRieng.chan(x, z, r)) return VUONG_VAT;
    if (this.giaoThong.nhom.visible) {
      const m = this.troChuyenPho.timGan(x, z, r + 0.2);
      if (m && (!tu || Math.hypot(m.nv.group.position.x - x, m.nv.group.position.z - z) < Math.hypot(m.nv.group.position.x - tu[0], m.nv.group.position.z - tu[1]) - 1e-4)) { this._vuongNg.nguoi = m; return this._vuongNg; }
    }
    return null;
  }

  // ---------- Nhảy, ngồi bệt ----------
  batNhay() {
    if (this.khoa || this.capCuu || this.ngoiGhe || this.nhay || this.xeRieng?.dangLai) return;
    if (this.ngoiDat) { this.boNgoiDat(); return; } // đang ngồi bệt: Space là đứng dậy
    if (this.oNgoai() && this.ngoaiCanh.dangO?.() === "xe_khach") return; // trong xe: trần thấp
    this.nhay = { pha: "nhun", t: 0, y: 0, vy: 0, vx: this._vx, vz: this._vz };
  }
  batNgoiDat() {
    if (this.khoa || this.capCuu || this.ngoiGhe || this.nhay || this.xeRieng?.dangLai) return;
    if (this.ngoiDat?.muc === 1) { this.boNgoiDat(); return; }
    this.ngoiDat = { muc: 1, k: this.ngoiDat?.k ?? 0 };
    this.huongThan = this.than.group.rotation.y;
  }
  // đứng dậy (ngay: không có động tác, dùng khi dịch chuyển)
  boNgoiDat(ngay = false) {
    if (!this.ngoiDat) return;
    if (ngay) { this.ngoiDat = null; this.traTay(); return; }
    this.ngoiDat.muc = 0;
  }
  traTay() {
    if (this.than.tayT && this._tayNgoi) { thaTay(this.than.tayT); thaTay(this.than.tayP); this._tayNgoi = false; }
    if (this.than.chanT && !this.ngoiDat && !this.xeRieng?.dangLai) this.than.chanT.rotation.z = this.than.chanP.rotation.z = 0;
  }
  capNhatNhay(dt) {
    const n = this.nhay; if (!n) return;
    n.t += dt;
    if (n.pha === "nhun") { if (n.t >= NHAY_NHUN) { n.pha = "bay"; n.t = 0; n.vy = NHAY_V; n.vx = this._vx; n.vz = this._vz; am.phat("nhay"); } }
    else if (n.pha === "bay") {
      n.y += n.vy * dt - 0.5 * NHAY_G * dt * dt; n.vy -= NHAY_G * dt; // tích phân đúng parabol (máy chậm, bước dài vẫn cao ~0,45 m)
      if (n.y <= 0) { n.y = 0; n.pha = "dap"; n.t = 0; am.buocChan(am.beMat(this, this.viTriNgoai()), true); }
    } else if (n.t >= NHAY_DAP) this.nhay = null;
  }

  // ---------- Vòng lặp ----------
  diChuyen(dt) {
    let f = 0, s = 0;
    const coPhim = () => !this.khoa && (this.phim.KeyW || this.phim.KeyA || this.phim.KeyS || this.phim.KeyD || this.phim.ArrowUp || this.phim.ArrowDown || this.phim.ArrowLeft || this.phim.ArrowRight || (this.stick && Math.hypot(this.stick.x, this.stick.y) > 0.35));
    // đang ngồi: bấm phím đi (hoặc kéo cần) thì đứng dậy, không thì ngồi yên
    if (this.ngoiGhe) {
      if (coPhim()) this.dungDay();
      this.dangDi = false; this.dangChay = false; return;
    }
    if (!this.khoa) {
      if (this.phim.KeyW || this.phim.ArrowUp) f += 1;
      if (this.phim.KeyS || this.phim.ArrowDown) f -= 1;
      if (this.phim.KeyA || this.phim.ArrowLeft) s -= 1;
      if (this.phim.KeyD || this.phim.ArrowRight) s += 1;
      if (this.stick) { f -= this.stick.y; s += this.stick.x; }
    }
    // lái xe máy
    if (this.xeRieng.dangLai) {
      this.dangDi = false; this.dangChay = false; this._vx = this._vz = 0;
      if (this.khoa) { this.xeRieng.v = 0; return; }
      if (this.tang !== 0 || this.oNgoai()) { this.xeRieng.xuong(); return; }
      this.xeRieng.lai(dt, f, s, !!(this.phim.ShiftLeft || this.phim.ShiftRight || (this.stick && Math.hypot(this.stick.x, this.stick.y) > 0.95)));
      return;
    }
    // ngồi bệt: đi thì đứng dậy; đang ngồi / đang đứng lên thì chưa đi được
    if (this.ngoiDat) {
      if (this.ngoiDat.muc === 1 && coPhim()) this.boNgoiDat();
      if (this.ngoiDat.k > 0.15) { this.dangDi = false; this.dangChay = false; this._vx = this._vz = 0; return; }
    }
    const bay = this.nhay?.pha === "bay";
    const len = Math.hypot(f, s);
    this.dangDi = len > 0.15 && !bay;
    if (len <= 0.15 && !bay) { this.dangChay = false; this._vx = this._vz = 0; return; }
    if (len > 1) { f /= len; s /= len; }
    let dx, dz;
    if (bay) { // trên không: giữ đà lúc bật nhảy, điều khiển thêm được chút ít
      const sy = Math.sin(this.yaw), cy = Math.cos(this.yaw), toc = TOC_DI * (this.hsToc ?? 1) * 0.25;
      dx = (this.nhay.vx + (-sy * f + cy * s) * toc) * dt; dz = (this.nhay.vz + (-cy * f - sy * s) * toc) * dt;
    } else {
      // đói, khát, kiệt sức thì đi chậm và không chạy được
      this.dangChay = !this.camChay && (this.phim.ShiftLeft || this.phim.ShiftRight || (this.stick && len > 0.95));
      const toc = (this.dangChay ? TOC_CHAY : TOC_DI) * (this.hsToc ?? 1) * dt;
      const sy = Math.sin(this.yaw), cy = Math.cos(this.yaw);
      // hướng nhìn: (−sin yaw, −cos yaw)
      dx = (-sy * f + cy * s) * toc; dz = (-cy * f - sy * s) * toc;
    }
    // đang bị xe ép sát (xe vừa chạy tới chỗ mình đứng) thì bỏ qua va chạm xe để bước ra được
    const keoXe = this.tang === 0 && !this.oNgoai() && !(Math.abs(this.p.x) < 24 && this.p.z < 30) && this.giaoThong.chan(this.p.x, this.p.z);
    const tu = this._tu || (this._tu = [0, 0]); tu[0] = this.p.x; tu[1] = this.p.z;
    const x0 = this.p.x, z0 = this.p.z;
    if (!this.chanTai(this.p.x + dx, this.p.z, BAN_KINH, { tu, boXe: keoXe })) this.p.x += dx;
    if (!this.chanTai(this.p.x, this.p.z + dz, BAN_KINH, { tu, boXe: keoXe })) this.p.z += dz;
    if (dt > 0) { this._vx = (this.p.x - x0) / dt; this._vz = (this.p.z - z0) / dt; }
    if (Math.abs(dx) + Math.abs(dz) > 1e-6) this.huongThan = Math.atan2(dx, dz);
  }
  // bị ô tô / taxi / xe buýt đang chạy tông: dừng mọi điều khiển, báo main.js chạy cảnh tai nạn
  kiemTraTaiNan() {
    if (this.capCuu || this.khoa || this.tang !== 0 || this.oNgoai() || this.ngoiGhe || this.t < this._anToan || !this.giaoThong.nhom.visible) return;
    if (!duoiDuong(this.p.x, this.p.z)) return; // trên vỉa hè, trong sân công ty: không sao
    const gt = this.giaoThong, xr = this.xeRieng;
    let xe = gt.xeTong(this.p.x, this.p.z, xr.dangLai ? 0.45 : BAN_KINH);
    if (!xe && xr.dangLai) for (const k of [-1, 1]) { const [a, b] = xr.diem(xr.x, xr.z, xr.huong, k); xe = xe || gt.xeTong(a, b, 0.35); }
    if (xe) this.biTong(xe);
  }
  biTong(xe) {
    if (this.capCuu || this.dangTong) return;
    this.dangTong = true;
    xe.tong = true;
    am.phat("tong", xe.g.position.x, xe.g.position.z);
    const truc = xe.lan.truc, huong = xe.lan.huong, dir = truc === "x" ? [huong, 0] : [0, huong];
    const duong = this.p.z > 32.5 && this.p.z < 41.5 ? (this.p.x > 46 && this.p.x < 58 ? "ngã tư Hóng Chính – Kẹt Xe" : "đường Hóng Chính") : "đại lộ Kẹt Xe";
    const tn = { xe, x: this.p.x, z: this.p.z, dir, v: xe.v, duong, laiXe: this.xeRieng.dangLai };
    if (this.onTaiNan) this.onTaiNan(tn); else this.xiu({ taiNan: tn });
  }
  // Tự động: máy chạy chậm (dưới ~40 hình/giây) thì giảm dần độ phân giải vẽ, chạy dư sức thì tăng lại
  tuChinhDoPhanGiai(dt) {
    if (caiDat().chatLuong !== "tu_dong" || document.hidden) return;
    const d = this._dpg || (this._dpg = { tg: 0, khung: 0, tot: 0, pr: this.renderer.getPixelRatio() });
    d.tg += dt; d.khung++;
    if (d.tg < 2) return;
    const fps = d.khung / d.tg; d.tg = 0; d.khung = 0;
    const tran = tiLeDiemAnh();
    let pr = d.pr;
    if (fps < 40 && pr > 0.8) { pr = Math.max(0.8, pr - 0.1); d.tot = 0; }
    else if (fps > 56 && pr < tran) { if (++d.tot >= 4) { pr = Math.min(tran, pr + 0.1); d.tot = 0; } }
    else d.tot = 0;
    if (pr !== d.pr) { d.pr = pr; this.renderer.setPixelRatio(pr); this.resize(); }
  }
  loop() {
    const dt = Math.min(0.1, this.dongHo.getDelta());
    this.t += dt;
    this.tuChinhDoPhanGiai(dt);
    this.diChuyen(dt);
    this.capNhatNhay(dt);
    const y = this.tang * CAO_TANG;
    // ngồi: hạ tầm mắt xuống ngang người ngồi ghế
    this._hNgoi += ((this.ngoiGhe ? 0.4 : 0) - this._hNgoi) * Math.min(1, dt * 7);
    // ngồi bệt: k tiến dần 0 → 1 (ngồi xuống) hoặc về 0 (đứng dậy)
    const nd = this.ngoiDat;
    if (nd) { nd.k = Math.max(0, Math.min(1, nd.k + (nd.muc ? dt / 0.55 : -dt / 0.45))); if (!nd.muc && nd.k <= 0) { this.ngoiDat = null; this.traTay(); } }
    const kNgoi = this.ngoiDat ? muot(this.ngoiDat.k) : 0;
    // nhảy: độ cao, chùng gối lúc nhún và lúc tiếp đất (0..1)
    const nh = this.nhay, yNhay = nh?.y || 0;
    const chung = !nh ? 0 : nh.pha === "nhun" ? Math.sin(Math.min(1, nh.t / NHAY_NHUN) * Math.PI / 2) : nh.pha === "dap" ? Math.sin(Math.min(1, nh.t / NHAY_DAP) * Math.PI) : 0;
    const laiXe = this.xeRieng.dangLai;
    this.xeRieng.capNhat(dt, this.t);
    // camera
    if (this.goc === "1" && laiXe) this.xeRieng.datCamera(this.camera, this.t);
    else if (this.goc === "1") {
      const nhun = this.dangDi ? Math.sin(this.t * 9) * 0.035 : 0;
      const hMat = this.vai === "cho" ? 0.3 : MAT - MAT_NGOI_DAT;
      this.camera.position.set(this.p.x, y + MAT + nhun - this._hNgoi + yNhay - chung * (nh?.pha === "dap" ? 0.11 : 0.08) - kNgoi * hMat, this.p.z);
      this.camera.rotation.set(this.pitch, this.yaw, 0, "YXZ");
    } else {
      const xa = 3.6, cao = 1.2;
      const huong = (this._huong3 ||= new THREE.Vector3()).set(-Math.sin(this.yaw) * Math.cos(this.pitch), Math.sin(this.pitch), -Math.cos(this.yaw) * Math.cos(this.pitch));
      const dau = (this._dau3 ||= new THREE.Vector3()).set(this.p.x, y + 1.55 - this._hNgoi + yNhay * 0.6 - kNgoi * 0.7 - (laiXe ? 0.25 : 0), this.p.z);
      let k = xa;
      // kéo camera lại gần nếu vướng tường
      for (let d = 0.4; d <= xa; d += 0.2) {
        const px = dau.x - huong.x * d, pz = dau.z - huong.z * d;
        if (this.theGioi.vat[this.tang].some(b => b.tuong && px > b.minX - 0.15 && px < b.maxX + 0.15 && pz > b.minZ - 0.15 && pz < b.maxZ + 0.15)) { k = d - 0.2; break; }
      }
      this.camera.position.set(dau.x - huong.x * k, Math.min(dau.y - huong.y * k + cao * 0.3, y + 3.4), dau.z - huong.z * k);
      this.camera.lookAt(dau.x + huong.x * 2, dau.y + huong.y * 2, dau.z + huong.z * 2);
      // cảnh cấp cứu tự đặt thân người chơi (nằm đường, lên cáng, vào xe rồi ẩn): không ghi đè
      if (!this.capCuu) {
        if (!laiXe) this.than.group.position.set(this.p.x, y + (this.ngoiGhe ? this.ngoiGhe.y : 0), this.p.z);
        this.than.group.visible = k > 1.1;
      }
      if (laiXe) { /* thân nằm trong nhóm xe máy */ }
      else if (this.ngoiGhe) this.than.group.rotation.y = this.ngoiGhe.huong;
      else if ((this.dangDi || this.nhay) && this.huongThan != null) {
        const muc = this.huongThan; let d = muc - this.than.group.rotation.y;
        d = Math.atan2(Math.sin(d), Math.cos(d));
        this.than.group.rotation.y += d * Math.min(1, dt * 12);
      }
    }
    this.than.hoatDong(this.t, this.dangDi, this.phim.ShiftLeft ? 1.5 : 1);
    if (laiXe) this.xeRieng.tuThe();
    else if (this.goc === "3" && !this.ngoiGhe) this.tuTheNhayNgoi(nh, chung, kNgoi, y + yNhay);
    if (!laiXe) this.tay.hoatDong(this.t, this.dangDi || (nh?.pha === "bay"), dt);
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
    // (mảng dùng lại mỗi khung hình, không cấp phát)
    const ds = this._dsBang || (this._dsBang = []), giu = this._giuBang || (this._giuBang = []), v = this._v3;
    ds.length = 0; let nGiu = 0;
    for (const n of this.npc) if (n.bang.visible) ds.push(n);
    if (ds.length > 1) ds.sort((a, b) => a._kc - b._kc);
    for (const n of ds) {
      n.bang.getWorldPosition(v); v.project(this.camera);
      const rong = 0.5 / Math.max(1, n._kc); // bảng càng gần càng to
      let trung = false;
      for (let i = 0; i < nGiu; i++) { const q = giu[i]; if (Math.abs(q.x - v.x) < rong + q.r && Math.abs(q.y - v.y) < rong * 0.7 + q.r * 0.7) { trung = true; break; } }
      if (trung) { n.bang.visible = false; continue; }
      const q = giu[nGiu] || (giu[nGiu] = { x: 0, y: 0, r: 0 }); q.x = v.x; q.y = v.y; q.r = rong; nGiu++;
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
    this.anNgoaiTroi(trong);
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
    this.giaoThong.capNhat(dt, this.t, { x: this.p.x, z: this.p.z, tang: this.tang, an: !!this.capCuu }, !this.oNgoai() && (!(trong && this.p.z < 8) && this.tang < 2 || this.tang === 2));
    this.capCuu?.capNhat(dt);
    this.troChuyenPho.capNhat(dt);
    this.kiemTraTaiNan();
    capNhatChiTiet(dt, this.bauTroi.gio, this.p, this.tang, this.npc); // cửa tự mở, cửa sổ theo giờ, đồng hồ treo tường
    this.ngoaiCanh.capNhat(dt, this.t, this.tang === 0 ? this.p : null);
    const ngoai = this.oNgoai(); // ở địa điểm ngoài công ty: ẩn cả thành phố cho nhẹ máy
    if (this.theGioi.nhom.visible === ngoai) {
      this.theGioi.nhom.visible = !ngoai; this.dongVat.nhom.visible = !ngoai;
      if (!ngoai) for (const nv of this.khach || []) nv.group.visible = false;
    }
    for (const nv of this.khach || []) if (nv.group.visible) nv.hoatDong(this.t + nv.group.position.x, false);
    // đêm khuya văn phòng vắng người: tắt bớt đèn
    const gioNay = this.bauTroi.gio;
    let khuya = !ngoai && trong && (gioNay >= 21 || gioNay < 6);
    if (khuya) { let c = 0; for (const n of this.npc) if (n.nv.group.visible && n.tang === this.tang && Math.abs(n.nv.group.position.x) < 21 && Math.abs(n.nv.group.position.z) < 14) c++; khuya = c <= 2; }
    this._den = (this._den ?? 1) + ((khuya ? 0.5 : 1) - (this._den ?? 1)) * Math.min(1, dt * 1.5);
    if (this._den < 0.999) { this.hemi.intensity *= this._den; this.nen.intensity *= this._den; }
    am.capNhatGame(this, dt);
    this.onGoiY?.(this.khoa || this.capCuu ? null : this.timTuongTac());
    this.bong?.capNhat(dt, this.camera.position, this.yaw, trong, this.bauTroi._nang ?? 1);
    this.onKhung?.();
    if (this.hauKy) { this.hauKy.datMoiTruong(kq.ngay); this.hauKy.render(dt); }
    else this.renderer.render(this.scene, this.camera);
  }
  // dáng nhảy / ngồi bệt của thân người chơi (góc nhìn 3), gọi sau than.hoatDong; yGoc: độ cao gốc chân khi đứng thẳng
  tuTheNhayNgoi(nh, chung, kNgoi, yGoc) {
    const T = this.than; if (!T.chanT) return;
    let a = 0, kg = 0, tay = null;
    if (kNgoi > 0) { // ngồi bệt: đùi gập lên trước, gối co lên, hai tay đặt lên gối
      a = 2.3 * kNgoi; kg = 1.73 * kNgoi;
      const hong = 0.9 + (0.14 - 0.9) * kNgoi;
      if (!T.goiT) { a = 1.5 * kNgoi; kg = 0; }
      T.chanT.rotation.x = T.chanP.rotation.x = -a; T.chanT.rotation.z = 0.12 * kNgoi; T.chanP.rotation.z = -0.12 * kNgoi;
      if (T.goiT) T.goiT.rotation.x = T.goiP.rotation.x = kg;
      T.group.position.y = yGoc + hong - 0.9;
      if (T.tayT && kNgoi > 0.55) {
        const gx = 0.9 - 0.44 * Math.cos(a), gz = 0.44 * Math.sin(a);
        chiTay(T.tayT, -0.13, gx + 0.03, gz - 0.02); chiTay(T.tayP, 0.13, gx + 0.03, gz - 0.02); this._tayNgoi = true;
      } else this.traTay();
      return;
    }
    this.traTay();
    if (!nh) return;
    if (nh.pha === "nhun") { a = 0.42 * chung; tay = 0.55 * chung; }               // nhún: chùng gối, vung tay ra sau
    else if (nh.pha === "bay") { const len = Math.max(0, Math.min(1, nh.vy / NHAY_V)); a = 0.28; tay = -2.3 * (0.4 + 0.6 * len) - 0.3; } // bay: co gối, giơ tay lên
    else { a = 0.5 * chung; tay = -0.5 * chung; }                                  // tiếp đất: chùng gối, tay đưa ra trước giữ thăng bằng
    kg = T.goiT ? 2 * a : 0;
    T.chanT.rotation.x = T.chanP.rotation.x = -a;
    if (T.goiT) T.goiT.rotation.x = T.goiP.rotation.x = kg;
    if (T.tayT && tay != null && !T.tayT.userData.coDinh) { T.tayT.rotation.x = tay; T.tayP.rotation.x = tay; T.tayT.rotation.z = 0.15; T.tayP.rotation.z = -0.15; }
    T.group.position.y = yGoc - (T.goiT ? haHong(a, kg) : 0);
  }
  // xỉu: khóa điều khiển, chạy cảnh cấp cứu; taiNan: bị xe tông (xem cap-cuu.js)
  xiu({ onPha, onXong, taiNan = null }) {
    if (this.capCuu) return;
    if (this.xeRieng?.dangLai) this.xeRieng.xuong({ nga: true });
    this.nhay = null; this.boNgoiDat(true); this.troChuyenPho?.traHet();
    this.datKhoa(true); this.xoaMucTieu();
    this.capCuu = new CapCuu(this, { onPha, onXong, taiNan });
  }
  huy() {
    this.daHuy = true; // đang dựng dở (khoiDong) thì dừng ở bước kế tiếp
    clearTimeout(this._henBien);
    am.huyGame();
    this.doiSong?.huy();
    this.ngoaiCanh?.huy();
    this._boCaiDat?.();
    this.sanKhau?.huy();
    this.renderer?.setAnimationLoop(null);
    this.hauKy?.dispose();
    removeEventListener("resize", this._resize); removeEventListener("keydown", this._keydown); removeEventListener("keyup", this._keyup); removeEventListener("blur", this._blur);
    if (this._mouse) document.removeEventListener("mousemove", this._mouse);
    if (this._plc) document.removeEventListener("pointerlockchange", this._plc);
    this.moKhoaChuot();
    // trả ngay bộ nhớ card đồ hoạ (khối, ảnh của cả thành phố) thay vì chờ trình duyệt dọn: ra màn hình chính rồi vào lại
    // nhiều lần trên điện thoại không bị đầy bộ nhớ, mất ngữ cảnh WebGL
    boChiTiet();
    // giải phóng khối, vật liệu, ảnh trên card đồ hoạ. Quan trọng: vật liệu / khối dùng chung giữa các ván (lưu ở
    // biến cấp module) giữ hàm "dispose" của renderer cũ -> canvas cũ -> cả ván cũ; dispose() gỡ các tham chiếu đó
    if (this.scene && this.renderer) {
      const hinh = new Set(), vl = new Set(), anh = new Set();
      const lay = v => { if (v?.isTexture) anh.add(v); };
      this.scene.traverse(o => {
        if (o.geometry) hinh.add(o.geometry);
        if (o.skeleton) o.skeleton.dispose();
        const ms = o.material ? (Array.isArray(o.material) ? o.material : [o.material]) : [];
        for (const m of ms) { if (!m) continue; vl.add(m); for (const k in m) lay(m[k]); if (m.uniforms) for (const u of Object.values(m.uniforms)) lay(u?.value); }
      });
      for (const x of [...hinh, ...vl, ...anh]) { try { x.dispose(); } catch {} }
    }
    this._ngat?.abort();
    this.renderer?.dispose(); this.renderer?.forceContextLoss?.();
    this.khung.replaceChildren();
  }
}
