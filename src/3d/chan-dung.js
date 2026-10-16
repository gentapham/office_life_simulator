// Chụp chân dung 3D của từng nhân vật (đầu và vai) để dùng trên thẻ chọn vai. Trả về ảnh dạng data URL.
import * as THREE from "three";
import { taoNguoi } from "./nhan-vat-3d.js";

export function chupChanDung(dsMa, co = 256) {
  const r = new THREE.WebGLRenderer({ antialias: true, alpha: true, preserveDrawingBuffer: true });
  r.setPixelRatio(1); r.setSize(co, co, false);
  const scene = new THREE.Scene();
  scene.add(new THREE.HemisphereLight(0xffffff, 0xb8ad96, 1.7), new THREE.AmbientLight(0xffffff, 0.5));
  const den = new THREE.DirectionalLight(0xfff1d6, 1.5); den.position.set(1.5, 2.5, 3); scene.add(den);
  const cam = new THREE.PerspectiveCamera(28, 1, 0.1, 20);
  const kq = {};
  for (const ma of dsMa) {
    const nv = taoNguoi(ma);
    nv.group.rotation.y = -0.32;
    scene.add(nv.group);
    nv.hoatDong(0, false);
    if (ma === "cho") { cam.position.set(1.15, 0.85, 1.55); cam.lookAt(0, 0.55, 0.15); }
    else { const y = nv.chieuCao - 0.34; cam.position.set(0.2, y + 0.08, 2.05); cam.lookAt(0, y - 0.12, 0); } // đầu và vai
    r.render(scene, cam);
    kq[ma] = r.domElement.toDataURL("image/png");
    scene.remove(nv.group);
  }
  r.dispose(); r.forceContextLoss?.();
  return kq;
}
