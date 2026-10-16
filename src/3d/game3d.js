// Lõi game 3D: camera góc nhìn thứ nhất / thứ ba, di chuyển, va chạm, tương tác, mục tiêu cảnh, ánh sáng theo giờ.
// Phần truyện (Ink) do main.js điều khiển; file này chỉ báo sự kiện qua các hàm onXxx.
import * as THREE from "three";
import { taoTheGioi, KHU, CAU_THANG, CHO_NGOI, CAO_TANG } from "./the-gioi.js";
import { taoNguoi, taoBangTen, taoDoiTay } from "./nhan-vat-3d.js";
import { BauTroi } from "./bau-troi.js";
import { GiaoThong } from "./giao-thong.js";

const MAT = 1.72;            // tầm mắt
const BAN_KINH = 0.32;       // bán kính người chơi khi va chạm
const TOC_DI = 3.2, TOC_CHAY = 5.6;
const TAM_NOI = 2.3;         // khoảng cách bấm nói chuyện
const DUNG_O_KHU = 1.6;      // tới gần tâm khu bao nhiêu thì mở cảnh

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

    this.renderer = new THREE.WebGLRenderer({ antialias: !this.dienThoai, powerPreference: "high-performance" });
    this.renderer.setPixelRatio(Math.min(devicePixelRatio, this.dienThoai ? 1.5 : 2));
    this.canvas = this.renderer.domElement; this.canvas.className = "g3d-canvas";
    khung.append(this.canvas);

    this.scene = new THREE.Scene();
    this.scene.fog = new THREE.Fog(0xbfd9ec, 40, 130);
    this.camera = new THREE.PerspectiveCamera(70, 1, 0.05, 1000);
    this.scene.add(this.camera);
    this.hemi = new THREE.HemisphereLight(0xffffff, 0xb8ad96, 1.6);
    this.nen = new THREE.AmbientLight(0xffffff, 0.55); this.scene.add(this.nen);
    this.mat_troi = new THREE.DirectionalLight(0xfff1d6, 1.6); this.mat_troi.position.set(30, 50, 40);
    this.scene.add(this.hemi, this.mat_troi);

    this.theGioi = taoTheGioi(this.scene, { dienThoai: this.dienThoai });
    this.bauTroi = new BauTroi(this.scene, { matUot: this.theGioi.pho.matUot });
    this.giaoThong = new GiaoThong(this.scene, this.theGioi.pho, { dienThoai: this.dienThoai });
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
      this.npc.push({ ma, nv, bang, tang: cho.tang, goc0: cho.huong ?? 0 });
    }

    // Điểm đánh dấu mục tiêu: vòng sáng + cột sáng
    const mk = new THREE.Group();
    const vong = new THREE.Mesh(new THREE.RingGeometry(0.7, 0.95, 24), new THREE.MeshBasicMaterial({ color: 0xe8702a, side: THREE.DoubleSide, transparent: true, opacity: 0.9 }));
    vong.rotation.x = -Math.PI / 2; vong.position.y = 0.03;
    const cot = new THREE.Mesh(new THREE.CylinderGeometry(0.5, 0.5, 3, 16, 1, true), new THREE.MeshBasicMaterial({ color: 0xe8702a, transparent: true, opacity: 0.18, side: THREE.DoubleSide, depthWrite: false }));
    cot.position.y = 1.5;
    mk.add(vong, cot); mk.visible = false; this.scene.add(mk); this.marker = mk;

    this.taoDieuKhien();
    this.datGio(8, 0);
    this.capNhatGoc();
    this._resize = () => this.resize(); addEventListener("resize", this._resize); this.resize();
    this._loop = this.loop.bind(this); this.dongHo = new THREE.Clock(); this.renderer.setAnimationLoop(this._loop);
  }

  // ---------- Điều khiển ----------
  taoDieuKhien() {
    const c = this.canvas;
    this._keydown = e => {
      if (e.target.closest?.("input, textarea")) return;
      this.phim[e.code] = true;
      if (this.khoa) return;
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
    this.camera.aspect = w / h; this.camera.updateProjectionMatrix();
    // màn hình dọc: kéo đôi tay vào giữa để không lọt khỏi khung hình
    this.tay.group.scale.x = Math.min(1, (w / h) / 1.3);
  }
  datViTri({ tang, x, z, huong }) {
    this.tang = tang; this.p.set(x, tang * CAO_TANG, z);
    if (huong != null) { this.yaw = huong; this.pitch = 0; }
  }
  // Giờ trong ngày và thời tiết: bầu trời, ánh sáng, đèn đường do BauTroi tính mỗi khung hình
  datGio(gio, phut = 0) { this.bauTroi.gio = gio + phut / 60; }
  datThoiTiet(loai) { this.bauTroi.datThoiTiet(loai); }
  trongNha() { return this.tang < 2 && Math.abs(this.p.x) < 20 && this.p.z > -14 && this.p.z < 14; }
  capNhatTen() { for (const n of this.npc) n.bang.doiTen(this.tenCua(n.ma), this.tenVai(n.ma)); }

  // Mục tiêu: đi tới khu để mở cảnh tiếp theo
  datMucTieu(khu, onToi, { phaiRoiKhoi = false } = {}) {
    const k = KHU[khu]; if (!k) return;
    this.mucTieu = { khu, k, onToi, daToi: false, choRoi: phaiRoiKhoi };
    this.marker.position.set(k.x, k.tang * CAO_TANG, k.z);
    this.marker.visible = true;
  }
  xoaMucTieu() { this.mucTieu = null; this.marker.visible = false; }
  khoangCachMucTieu() {
    if (!this.mucTieu) return null;
    const k = this.mucTieu.k;
    return { tang: k.tang, d: Math.hypot(this.p.x - k.x, this.p.z - k.z), huong: Math.atan2(k.x - this.p.x, k.z - this.p.z) };
  }

  // ---------- Tương tác ----------
  timTuongTac() {
    let gan = null, dMin = Infinity;
    for (const n of this.npc) {
      if (n.tang !== this.tang) continue;
      const d = Math.hypot(n.nv.group.position.x - this.p.x, n.nv.group.position.z - this.p.z);
      if (d < TAM_NOI && d < dMin) { dMin = d; gan = { loai: "npc", ma: n.ma, nhan: `Nói chuyện với ${this.tenCua(n.ma)}` }; }
    }
    for (const c of CAU_THANG) {
      if (c.tang !== this.tang) continue;
      const d = Math.hypot(c.x - this.p.x, c.z - this.p.z);
      if (d < 1.8 && d < dMin) { dMin = d; gan = { loai: "cau_thang", c, nhan: c.nhan }; }
    }
    if (this.tang === 0) {
      const d = Math.hypot(2 - this.p.x, 29 - this.p.z);
      if (d < 2.4 && d < dMin) { dMin = d; gan = { loai: "cong", nhan: "Ra khỏi công ty" }; }
    }
    return gan;
  }
  tuongTac() {
    const g = this.timTuongTac(); if (!g) return;
    this.tay.voiRa(1); setTimeout(() => !this.khoa && this.tay.voiRa(0), 400);
    if (g.loai === "npc") {
      const n = this.npc.find(x => x.ma === g.ma);
      n.nv.group.rotation.y = Math.atan2(this.p.x - n.nv.group.position.x, this.p.z - n.nv.group.position.z);
      this.onNoiChuyen?.(g.ma);
    } else if (g.loai === "cau_thang") {
      this.onCauThang?.(g.c, () => this.datViTri(g.c.toi));
    } else if (g.loai === "cong") this.onCong?.();
  }
  datKhoa(k) {
    this.khoa = k; this.phim = {}; if (this.stick) this.stick.x = this.stick.y = 0;
    this.tay.voiRa(k ? 0.6 : 0);
    if (k) this.moKhoaChuot();
    if (!k) for (const n of this.npc) n.nv.group.rotation.y = n.goc0;
  }

  // ---------- Vòng lặp ----------
  diChuyen(dt) {
    let f = 0, s = 0;
    if (!this.khoa) {
      if (this.phim.KeyW || this.phim.ArrowUp) f += 1;
      if (this.phim.KeyS || this.phim.ArrowDown) f -= 1;
      if (this.phim.KeyA || this.phim.ArrowLeft) s -= 1;
      if (this.phim.KeyD || this.phim.ArrowRight) s += 1;
      if (this.stick) { f -= this.stick.y; s += this.stick.x; }
    }
    const len = Math.hypot(f, s);
    this.dangDi = len > 0.15;
    if (!this.dangDi) return;
    if (len > 1) { f /= len; s /= len; }
    const toc = (this.phim.ShiftLeft || this.phim.ShiftRight || (this.stick && len > 0.95) ? TOC_CHAY : TOC_DI) * dt;
    const sy = Math.sin(this.yaw), cy = Math.cos(this.yaw);
    // hướng nhìn: (−sin yaw, −cos yaw)
    const dx = (-sy * f + cy * s) * toc, dz = (-cy * f - sy * s) * toc;
    const vat = this.theGioi.vat[this.tang];
    const dung = (x, z) => {
      for (const b of vat) if (x > b.minX - BAN_KINH && x < b.maxX + BAN_KINH && z > b.minZ - BAN_KINH && z < b.maxZ + BAN_KINH) return true;
      for (const n of this.npc) if (n.tang === this.tang && Math.hypot(n.nv.group.position.x - x, n.nv.group.position.z - z) < 0.55) return true;
      if (this.tang === 0 && z > 29 && this.giaoThong.chan(x, z)) return true;
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
    // camera
    if (this.goc === "1") {
      const nhun = this.dangDi ? Math.sin(this.t * 9) * 0.035 : 0;
      this.camera.position.set(this.p.x, y + MAT + nhun, this.p.z);
      this.camera.rotation.set(this.pitch, this.yaw, 0, "YXZ");
    } else {
      const xa = 3.6, cao = 1.2;
      const huong = new THREE.Vector3(-Math.sin(this.yaw) * Math.cos(this.pitch), Math.sin(this.pitch), -Math.cos(this.yaw) * Math.cos(this.pitch));
      const dau = new THREE.Vector3(this.p.x, y + 1.55, this.p.z);
      let k = xa;
      // kéo camera lại gần nếu vướng tường
      for (let d = 0.4; d <= xa; d += 0.2) {
        const px = dau.x - huong.x * d, pz = dau.z - huong.z * d;
        if (this.theGioi.vat[this.tang].some(b => b.tuong && px > b.minX - 0.15 && px < b.maxX + 0.15 && pz > b.minZ - 0.15 && pz < b.maxZ + 0.15)) { k = d - 0.2; break; }
      }
      this.camera.position.set(dau.x - huong.x * k, Math.min(dau.y - huong.y * k + cao * 0.3, y + 3.4), dau.z - huong.z * k);
      this.camera.lookAt(dau.x + huong.x * 2, dau.y + huong.y * 2, dau.z + huong.z * 2);
      this.than.group.position.set(this.p.x, y, this.p.z);
      this.than.group.visible = k > 1.1;
      if (this.dangDi && this.huongThan != null) {
        const muc = this.huongThan; let d = muc - this.than.group.rotation.y;
        d = Math.atan2(Math.sin(d), Math.cos(d));
        this.than.group.rotation.y += d * Math.min(1, dt * 12);
      }
    }
    this.than.hoatDong(this.t, this.dangDi, this.phim.ShiftLeft ? 1.5 : 1);
    this.tay.hoatDong(this.t, this.dangDi, dt);
    for (const n of this.npc) {
      n.nv.hoatDong(this.t + n.goc0 * 3, false);
      n.bang.visible = n.tang === this.tang && Math.hypot(n.nv.group.position.x - this.p.x, n.nv.group.position.z - this.p.z) < 9;
    }
    for (const l of this.theGioi.nhapNhay) l.visible = Math.sin(this.t * 6 + l.position.x * 9) > -0.3;
    if (this.marker.visible) this.marker.children[0].scale.setScalar(1 + Math.sin(this.t * 4) * 0.08);
    // tới mục tiêu?
    if (this.mucTieu && !this.mucTieu.daToi && !this.khoa) {
      const m = this.khoangCachMucTieu();
      if (this.mucTieu.choRoi) { if (m.tang !== this.tang || m.d > DUNG_O_KHU + 0.8) this.mucTieu.choRoi = false; }
      else if (m.tang === this.tang && m.d < DUNG_O_KHU) { this.mucTieu.daToi = true; const cb = this.mucTieu.onToi; this.xoaMucTieu(); cb?.(); }
    }
    // bầu trời, thời tiết, đèn buổi tối
    const trong = this.trongNha();
    const kq = this.bauTroi.capNhat(dt, this.camera, { hemi: this.hemi, nen: this.nen, matTroi: this.mat_troi }, trong);
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
    this.giaoThong.capNhat(dt, this.t, { x: this.p.x, z: this.p.z, tang: this.tang }, !(trong && this.p.z < 8) && this.tang < 2 || this.tang === 2);
    this.onGoiY?.(this.khoa ? null : this.timTuongTac());
    this.onKhung?.();
    this.renderer.render(this.scene, this.camera);
  }
  huy() {
    this.renderer.setAnimationLoop(null);
    removeEventListener("resize", this._resize); removeEventListener("keydown", this._keydown); removeEventListener("keyup", this._keyup); removeEventListener("blur", this._blur);
    if (this._mouse) document.removeEventListener("mousemove", this._mouse);
    if (this._plc) document.removeEventListener("pointerlockchange", this._plc);
    this.moKhoaChuot();
    this.renderer.dispose();
    this.khung.replaceChildren();
  }
}
