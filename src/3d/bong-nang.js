// Bóng nắng kiểu tranh (mức Vừa / Cao): một bóng mặt trời mềm đi theo người chơi, màu bóng là màu trời xanh tím
// (bóng chỉ chặn ánh nắng, phần còn lại là ánh trời, xem to-mau.js) nên không bao giờ đen.
// - Khối nào nhận / đổ bóng do quét cảnh định kỳ quyết định, nên khối của mọi file (kể cả tạo sau) tự có bóng:
//   khối có vật liệu chịu sáng thì nhận bóng; đổ bóng thì trừ khối trong suốt, đồ gắn vào camera (đôi tay) và khối gắn
//   userData.khongBong. userData.khongNhanBong: không nhận bóng.
// - Khối gộp cả khu phố (nhà, cây, cột điện... gộp theo vật liệu, trải khắp bản đồ) không thể loại theo khung nhìn của
//   bóng: vẽ nguyên khối thì bản đồ bóng tốn gấp đôi cả cảnh. Mức Cao thay chúng bằng "khối bóng": chép toạ độ đỉnh
//   chia theo ô lưới 64 m, chỉ dùng khi vẽ bóng (lớp 1, chỉ bật cho camera trong lúc vẽ bản đồ bóng), nên lượt vẽ bóng chỉ
//   còn mấy ô quanh người chơi. Mức Vừa: chỉ người, xe, đồ đạc nhỏ đổ bóng; nhà cửa chỉ nhận bóng.
// - Trong nhà: bóng tắt dần và thôi vẽ lại bản đồ bóng (sàn trên che hết nắng, trong phòng vẫn sáng như cũ).
import * as THREE from "three";

const O = 64;      // cạnh ô lưới của khối bóng (m)
const LOP = 1;     // lớp chỉ dùng khi vẽ bóng
const XA = 34;     // đồ nhỏ xa tâm bóng hơn chừng này (m) thì không đổ bóng

export class BongNang {
  constructor(renderer, scene, camera, den, muc) {
    this.renderer = renderer; this.scene = scene; this.camera = camera; this.den = den; this.muc = muc;
    const cao = muc === 2, s = den.shadow, k = cao ? 30 : 20;
    renderer.shadowMap.enabled = true; renderer.shadowMap.type = THREE.PCFShadowMap;
    den.castShadow = true;
    s.mapSize.set(cao ? 2048 : 1024, cao ? 2048 : 1024);
    Object.assign(s.camera, { left: -k, right: k, top: k, bottom: -k, near: 2, far: 170 }); s.camera.updateProjectionMatrix();
    s.bias = -0.0005; s.normalBias = cao ? 0.035 : 0.05; s.radius = cao ? 3 : 2;
    scene.add(den.target);
    this.lon = cao ? 30 : 14;        // bán kính (m) từ đó trở lên là "khối lớn"
    this.khoiBong = cao;             // mức Cao: khối lớn đổ bóng qua khối bóng chia ô
    this.daChia = new WeakSet();
    this.t = 0; this.cuong = 1;
    this.lonTheoCha = new Map(); // nhóm cha -> các khối lớn trong nhóm
    this.cho = new Set();        // nhóm cha có khối lớn mới, chờ chia ô lại (mỗi khung hình một nhóm cho khỏi khựng)
    this._tam = new THREE.Vector3(); this._r = new THREE.Vector3(); this._u = new THREE.Vector3(); this._d = new THREE.Vector3();
    this._vlBong = [new THREE.MeshBasicMaterial(), new THREE.MeshBasicMaterial({ side: THREE.DoubleSide })];
    // bật lớp khối bóng cho camera đúng lúc vẽ bản đồ bóng (sau khi đã lập danh sách vẽ cảnh chính), tắt lại trước lượt sau
    const goc = s.updateMatrices.bind(s);
    s.updateMatrices = l => { goc(l); camera.layers.enable(LOP); };
    const truoc = scene.onBeforeRender;
    scene.onBeforeRender = function (r, sc, cam, rt) { camera.layers.disable(LOP); truoc?.call(this, r, sc, cam, rt); };
    this._duyet = o => {
      if (o === camera) return;
      if (o.isMesh && !o.userData.khoiBong) this.xet(o);
      const ch = o.children; for (let i = 0; i < ch.length; i++) this._duyet(ch[i]);
    };
  }
  xet(o) {
    const ms = o.material, m = Array.isArray(ms) ? ms[0] : ms;
    const chiuSang = !!m && (m.isMeshLambertMaterial || m.isMeshStandardMaterial || m.isMeshPhongMaterial || m.isMeshToonMaterial);
    o.receiveShadow = chiuSang && !o.userData.khongNhanBong;
    let doBong = chiuSang && !o.userData.khongBong && !(m.transparent && m.opacity < 0.6) && m.colorWrite !== false;
    if (doBong && !o.isSkinnedMesh) {
      const g = o.geometry; if (g && !g.boundingSphere) g.computeBoundingSphere();
      const r = g?.boundingSphere ? g.boundingSphere.radius * o.matrixWorld.getMaxScaleOnAxis() : Infinity;
      // đồ nhỏ (người, xe, đồ đạc) ở xa tâm bóng: bóng của nó rơi ngoài vùng có bóng, khỏi vẽ
      const e = o.matrixWorld.elements, dx = e[12] - this._tam.x, dz = e[14] - this._tam.z;
      if (r < 4 && dx * dx + dz * dz > XA * XA) doBong = false;
      else if (r >= this.lon || o.isInstancedMesh && !this.khoiBong) {
        doBong = false;
        if (this.khoiBong && !this.daChia.has(o) && o.parent) { this.daChia.add(o); const l = this.lonTheoCha.get(o.parent) || []; l.push(o); this.lonTheoCha.set(o.parent, l); this.cho.add(o.parent); }
      }
    }
    o.castShadow = doBong;
  }
  // khối bóng: toạ độ đỉnh của mọi khối lớn cùng một nhóm cha, đổi về hệ của nhóm cha, chia theo ô lưới (mỗi ô một khối
  // cho mặt một phía, một khối cho mặt hai phía), gắn làm con của nhóm cha (ẩn / hiện theo nhóm: phố, địa điểm ngoài...)
  chiaNhom(cha, ds) {
    for (const k of [...cha.children]) if (k.userData.khoiBong) { cha.remove(k); k.geometry.dispose(); }
    const dem = new Map(), cac = [];
    const _v = new THREE.Vector3();
    for (const o of ds) {
      const g = o.geometry, p = g?.attributes.position;
      if (!p || o.parent !== cha || o.isInstancedMesh || o.morphTargetInfluences) continue;
      o.updateMatrix();
      const ms = Array.isArray(o.material) ? o.material : null, idx = g.index;
      const nTam = Math.floor((idx ? idx.count : p.count) / 3);
      const loai = new Int8Array(nTam); // 0 một phía, 1 hai phía, -1 bỏ (trong suốt)
      if (ms) { loai.fill(-1); for (const gr of g.groups) {
        const v = ms[gr.materialIndex], l = !v || v.transparent && v.opacity < 0.6 ? -1 : v.side === THREE.DoubleSide ? 1 : 0;
        for (let t = Math.floor(gr.start / 3), het = Math.min(nTam, Math.floor((gr.start + gr.count) / 3)); t < het; t++) loai[t] = l;
      } } else loai.fill(o.material.side === THREE.DoubleSide ? 1 : 0);
      // toạ độ đỉnh trong hệ nhóm cha
      const n = p.count, w = new Float32Array(n * 3), M = o.matrix;
      for (let v = 0; v < n; v++) { _v.fromBufferAttribute(p, v).applyMatrix4(M); w[v * 3] = _v.x; w[v * 3 + 1] = _v.y; w[v * 3 + 2] = _v.z; }
      const nhan = new Int32Array(nTam);
      for (let t = 0; t < nTam; t++) {
        if (loai[t] < 0) { nhan[t] = -1; continue; }
        const a = idx ? idx.getX(t * 3) : t * 3, b = idx ? idx.getX(t * 3 + 1) : t * 3 + 1, c = idx ? idx.getX(t * 3 + 2) : t * 3 + 2;
        const ix = Math.floor((w[a * 3] + w[b * 3] + w[c * 3]) / 3 / O) + 1024, iz = Math.floor((w[a * 3 + 2] + w[b * 3 + 2] + w[c * 3 + 2]) / 3 / O) + 1024;
        const k = (ix * 2048 + iz) * 2 + loai[t];
        nhan[t] = k; dem.set(k, (dem.get(k) || 0) + 1);
      }
      cac.push({ w, nhan, idx, nTam });
    }
    const mang = new Map();
    for (const [k, n] of dem) mang.set(k, { a: new Float32Array(n * 9), i: 0 });
    for (const { w, nhan, idx, nTam } of cac) for (let t = 0; t < nTam; t++) {
      const k = nhan[t]; if (k < 0) continue;
      const m = mang.get(k);
      for (let q = 0; q < 3; q++) { const v = idx ? idx.getX(t * 3 + q) : t * 3 + q; m.a[m.i++] = w[v * 3]; m.a[m.i++] = w[v * 3 + 1]; m.a[m.i++] = w[v * 3 + 2]; }
    }
    for (const [k, m] of mang) {
      const bg = new THREE.BufferGeometry(); bg.setAttribute("position", new THREE.BufferAttribute(m.a, 3)); bg.computeBoundingSphere();
      const kb = new THREE.Mesh(bg, this._vlBong[k % 2]);
      kb.layers.set(LOP); kb.castShadow = true; kb.receiveShadow = false; kb.matrixAutoUpdate = false;
      kb.userData.khoiBong = true; kb.userData.rieng = true; kb.name = "khoi-bong";
      cha.add(kb); kb.updateMatrixWorld(true);
    }
  }
  // gọi mỗi khung hình trước khi vẽ. p: vị trí người chơi, yaw: hướng nhìn, trong: đang trong nhà, nang: 0..1 có nắng
  capNhat(dt, p, yaw, trong, nang) {
    const L = this.den, s = L.shadow;
    this.t -= dt; if (this.t <= 0) { this.t = 0.5; this._duyet(this.scene); }
    if (this.cho.size) { const cha = this.cho.values().next().value; this.cho.delete(cha); this.chiaNhom(cha, this.lonTheoCha.get(cha).filter(o => o.parent === cha)); }
    const muon = trong ? 0 : nang > 0.05 ? 1 : 0.45;
    this.cuong += (muon - this.cuong) * Math.min(1, dt * 3);
    s.intensity = this.cuong;
    // vẽ lại bản đồ bóng cách một khung hình (bóng người, xe đi vẫn mượt ở 30 lần / giây): lượt vẽ bóng tốn một nửa
    const ve = this.cuong > 0.02;
    this.le = !this.le; this.renderer.shadowMap.autoUpdate = false;
    // khung không vẽ lại bóng: giữ nguyên vị trí nguồn sáng của lần vẽ trước, nếu không bản đồ bóng cũ bị chiếu lệch
    // theo người chơi đang di chuyển và bóng giật qua lại thành vệt mờ (rõ nhất khi giữ Shift chạy)
    if (!(ve && this.le) && this._daVe) {
      L.position.copy(this._viTriVe); L.target.position.copy(this._dichVe); L.target.updateMatrixWorld();
      return;
    }
    if (ve && this.le) this.renderer.shadowMap.needsUpdate = true;
    // tâm bóng: trước mặt người chơi một chút, khớp theo ô điểm ảnh của bản đồ bóng để mép bóng không rung khi đi
    const d = this._d.copy(L.position).normalize(), r = this._r, u = this._u;
    r.set(0, 1, 0).cross(d); if (r.lengthSq() < 1e-6) r.set(1, 0, 0); r.normalize();
    u.crossVectors(d, r);
    const tam = this._tam.set(p.x - Math.sin(yaw) * 6, p.y, p.z - Math.cos(yaw) * 6);
    const o = (s.camera.right - s.camera.left) / s.mapSize.x;
    const x = Math.round(tam.dot(r) / o) * o, y = Math.round(tam.dot(u) / o) * o, z = tam.dot(d);
    tam.copy(r).multiplyScalar(x).addScaledVector(u, y).addScaledVector(d, z);
    L.target.position.copy(tam); L.target.updateMatrixWorld();
    L.position.copy(tam).addScaledVector(d, 85);
    (this._viTriVe ||= new THREE.Vector3()).copy(L.position); (this._dichVe ||= new THREE.Vector3()).copy(tam); this._daVe = true;
  }
}
