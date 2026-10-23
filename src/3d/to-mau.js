// Tô màu kiểu tranh vẽ (painterly / toon mềm) cho cả thế giới: sửa thẳng các đoạn shader dùng chung của three.js
// (ShaderChunk) nên MỌI vật liệu Lambert / Standard / Physical — nhà cửa, đồ đạc, cây, xe, nhân vật, kể cả khối tạo sau
// này ở file khác — đều tự có kiểu tô này, không cần gọi gì thêm:
// - ánh nắng trực tiếp đi qua một "dốc màu" 3 nấc chuyển mềm (tối / giữa / sáng) thay cho dot(N, L) liên tục;
// - phía khuất nắng chỉ còn ánh trời (HemisphereLight) + ánh nền: bau-troi.js chỉnh màu trời xanh tím nên bóng ngả lạnh,
//   không bao giờ đen hay xám (bóng đổ của mặt trời cũng chỉ chặn ánh nắng nên cùng màu lạnh đó);
// - màu bề mặt giảm bão hoà nhẹ cho dịu (bảng màu pastel), phản xạ gương của vật liệu Standard gần như tắt,
//   kim loại không còn tối thui khi không có ảnh môi trường.
// Mức Thấp (máy yếu): trả lại nguyên các đoạn shader gốc (hình như cũ). Mức áp dụng khi tạo renderer (vào game).
import * as THREE from "three";
import { caiDat, cheDoNhe } from "../cai-dat.js";

// 0: Thấp (như cũ), 1: Vừa và Tự động trên máy tính (tô tranh + trời + sương, bóng rẻ, không hậu kỳ), 2: Cao (đủ cả, chỉ khi chọn)
export function mucVe() {
  if (cheDoNhe()) return 0;
  return caiDat().chatLuong === "cao" ? 2 : 1;
}

const C = THREE.ShaderChunk;
const GOC = {}; // đoạn shader gốc để trả lại khi về mức Thấp
const SUA = ["lights_lambert_pars_fragment", "lights_lambert_fragment", "lights_physical_pars_fragment", "lights_physical_fragment", "fog_fragment"];
for (const k of SUA) GOC[k] = C[k];

// dốc màu 3 nấc mềm: x = dot(N, L). Mặt quay khỏi nắng: 0; mặt xiên: ~0,55; mặt đón nắng: 1.
const DOC = /* glsl */`
float toMauDoc( const in float x ) {
	return 0.55 * smoothstep( -0.04, 0.16, x ) + 0.45 * smoothstep( 0.30, 0.56, x );
}
// giảm bão hoà nhẹ + kéo về tông kem ấm: bảng màu dịu kiểu tranh
vec3 toMauBeMat( const in vec3 c ) {
	float l = dot( c, vec3( 0.2126, 0.7152, 0.0722 ) );
	return mix( vec3( l ), c, 0.84 ) * vec3( 1.0, 0.985, 0.955 );
}
`;

function vaChunk() {
  C.lights_lambert_pars_fragment = GOC.lights_lambert_pars_fragment
    .replace("struct LambertMaterial", DOC + "\nstruct LambertMaterial")
    .replace("float dotNL = saturate( dot( geometryNormal, directLight.direction ) );\n\tvec3 irradiance = dotNL * directLight.color;",
      "vec3 irradiance = toMauDoc( dot( geometryNormal, directLight.direction ) ) * directLight.color;");
  C.lights_lambert_fragment = GOC.lights_lambert_fragment
    .replace("material.diffuseColor = diffuseColor.rgb;", "material.diffuseColor = toMauBeMat( diffuseColor.rgb );");
  C.lights_physical_pars_fragment = GOC.lights_physical_pars_fragment
    .replace("struct PhysicalMaterial", DOC + "\nstruct PhysicalMaterial")
    .replace(/void RE_Direct_Physical\(([^)]*)\) \{\n\n\tfloat dotNL = saturate\( dot\( geometryNormal, directLight.direction \) \);\n\n\tvec3 irradiance = dotNL \* directLight.color;/,
      (m, a) => `void RE_Direct_Physical(${a}) {\n\n\tfloat dotNL = saturate( dot( geometryNormal, directLight.direction ) );\n\n\tvec3 irradiance = toMauDoc( dot( geometryNormal, directLight.direction ) ) * directLight.color;`)
    .replace("reflectedLight.directSpecular += irradiance * BRDF_GGX( directLight.direction, geometryViewDir, geometryNormal, material );",
      "reflectedLight.directSpecular += 0.18 * dotNL * directLight.color * BRDF_GGX( directLight.direction, geometryViewDir, geometryNormal, material );");
  C.lights_physical_fragment = GOC.lights_physical_fragment
    .replace("material.diffuseColor = diffuseColor.rgb * ( 1.0 - metalnessFactor );",
      "material.diffuseColor = toMauBeMat( diffuseColor.rgb ) * ( 1.0 - 0.45 * metalnessFactor );");
  // sương: tầm gần trong, tầm trung phơn phớt mù, chân trời mờ hẳn (đường cong t^1,4 thay cho smoothstep)
  C.fog_fragment = GOC.fog_fragment
    .replace("float fogFactor = smoothstep( fogNear, fogFar, vFogDepth );",
      "float fogFactor = pow( clamp( ( vFogDepth - fogNear ) / ( fogFar - fogNear ), 0.0, 1.0 ), 1.4 );");
  for (const k of SUA) if (C[k] === GOC[k]) console.warn("to-mau: không sửa được đoạn shader", k);
}

let dangBat = null;
// bật / tắt kiểu tô tranh. Gọi trước khi dịch shader (lúc tạo renderer mới); trả về mức vẽ đang dùng.
export function caiToMau(muc = mucVe()) {
  const bat = muc > 0;
  if (dangBat === bat) return muc;
  dangBat = bat;
  if (bat) vaChunk(); else for (const k of SUA) C[k] = GOC[k];
  return muc;
}
