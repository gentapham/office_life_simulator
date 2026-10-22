// Hậu kỳ cho mức Cao (máy tính): vẽ cảnh vào khung đệm khử răng cưa (MSAA; màn hình mật độ điểm ảnh cao thì không cần), loang sáng nhẹ quanh đèn (bloom, chỉ phần
// rất sáng: đèn đường, cửa sổ ban đêm, mặt trời), đổi về sRGB rồi một lượt "chỉnh màu" kiểu tranh: bóng ngả xanh tím,
// vùng sáng ngả kem, giảm bão hoà một chút, tối nhẹ bốn góc, hạt giấy rất mịn (đứng yên như vân giấy, không nhấp nháy).
import * as THREE from "three";
import { EffectComposer } from "three/addons/postprocessing/EffectComposer.js";
import { RenderPass } from "three/addons/postprocessing/RenderPass.js";
import { UnrealBloomPass } from "three/addons/postprocessing/UnrealBloomPass.js";
import { OutputPass } from "three/addons/postprocessing/OutputPass.js";
import { ShaderPass } from "three/addons/postprocessing/ShaderPass.js";

const CHINH_MAU = {
  uniforms: { tDiffuse: { value: null }, doGiay: { value: 1 } },
  vertexShader: "varying vec2 vUv; void main(){ vUv = uv; gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0); }",
  fragmentShader: /* glsl */`uniform sampler2D tDiffuse; uniform float doGiay; varying vec2 vUv;
    float bam(vec2 p){ vec3 q = fract(vec3(p.xyx) * 0.1031); q += dot(q, q.yzx + 33.33); return fract((q.x + q.y) * q.z); }
    void main(){
      vec4 c = texture2D(tDiffuse, vUv);
      vec3 m = c.rgb;
      float l = dot(m, vec3(0.2126, 0.7152, 0.0722));
      // tách tông: vùng tối hơi xanh tím, vùng sáng hơi kem
      m += mix(vec3(-0.006, 0.0, 0.022), vec3(0.014, 0.006, -0.014), smoothstep(0.15, 0.75, l));
      // giảm bão hoà nhẹ, nâng đáy tối một chút (giống màu vẽ trên giấy, không đen kịt)
      m = mix(vec3(l), m, 0.93);
      m = m * 0.965 + 0.03;
      // tối nhẹ bốn góc
      vec2 q = (vUv - 0.5) * vec2(1.0, 0.8);
      m *= mix(0.87, 1.0, smoothstep(0.62, 0.18, length(q)));
      // vân giấy: hạt mịn + loang lớn rất nhạt
      float g = bam(floor(gl_FragCoord.xy)) - 0.5;
      float g2 = bam(floor(gl_FragCoord.xy / 3.0) + 17.0) - 0.5;
      m += (g * 0.018 + g2 * 0.012) * doGiay;
      gl_FragColor = vec4(m, c.a);
    }`,
};

export class HauKy {
  constructor(renderer, scene, camera) {
    this.renderer = renderer;
    const kt = renderer.getDrawingBufferSize(new THREE.Vector2());
    const rt = new THREE.WebGLRenderTarget(Math.max(1, kt.x), Math.max(1, kt.y), { type: THREE.HalfFloatType, samples: renderer.getPixelRatio() >= 1.75 ? 0 : 4 });
    this.composer = new EffectComposer(renderer, rt);
    this.composer.addPass(new RenderPass(scene, camera));
    this.bloom = new UnrealBloomPass(new THREE.Vector2(kt.x, kt.y), 0.32, 0.55, 0.92);
    this.composer.addPass(this.bloom);
    this.composer.addPass(new OutputPass());
    this.chinh = new ShaderPass(CHINH_MAU);
    this.composer.addPass(this.chinh);
  }
  // ngay: 0 đêm .. 1 ngày. Đêm hạ ngưỡng để đèn đường, cửa sổ sáng loang ra; ngày chỉ mặt trời, mảng rất sáng
  datMoiTruong(ngay) {
    this.bloom.threshold = 0.72 + 0.22 * ngay;
    this.bloom.strength = 0.3 - 0.08 * ngay;
  }
  setSize(w, h) {
    this.composer.setPixelRatio(this.renderer.getPixelRatio());
    this.composer.setSize(w, h);
  }
  render(dt) { this.composer.render(dt); }
  dispose() {
    this.composer.renderTarget1.dispose(); this.composer.renderTarget2.dispose();
    for (const p of this.composer.passes) p.dispose?.();
  }
}
