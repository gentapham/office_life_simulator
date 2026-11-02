// Chạy sau `vite build` (trong `npm run build`): tạo dist/sw.js từ tools/sw-mau.js.
// - DS_TAI_SAN: mọi file trong dist/assets (tên có mã băm) -> service worker tải trước, dùng mãi không đổi.
// - PHIEN_BAN: mã băm nội dung toàn bộ dist (trừ sw.js). Nội dung đổi -> sw.js đổi -> người chơi nhận bản mới.
import { createHash } from "node:crypto";
import { readFileSync, readdirSync, statSync, writeFileSync } from "node:fs";
import { join, relative, resolve, sep } from "node:path";
import { fileURLToPath } from "node:url";

const goc = fileURLToPath(new URL("..", import.meta.url));
const dist = process.argv[2] ? resolve(process.argv[2]) : join(goc, "dist"); // mặc định dist/ (tham số chỉ dùng khi kiểm thử)
const tatCa = [];
const duyet = thuMuc => {
  for (const ten of readdirSync(thuMuc).sort()) {
    const p = join(thuMuc, ten);
    if (statSync(p).isDirectory()) duyet(p); else tatCa.push(relative(dist, p).split(sep).join("/"));
  }
};
duyet(dist);

const bam = createHash("sha256");
for (const f of tatCa) {
  if (f === "sw.js" || f.startsWith(".vite/")) continue;
  bam.update(f + "\0"); bam.update(readFileSync(join(dist, f))); bam.update("\0");
}
const phienBan = bam.digest("hex").slice(0, 16);
const taiSan = tatCa.filter(f => f.startsWith("assets/")).map(f => "./" + f);
if (!taiSan.length) throw new Error("dist/assets trống: chạy vite build trước");

const mau = readFileSync(join(goc, "tools", "sw-mau.js"), "utf8");
const sw = mau.replace('"__PHIEN_BAN__"', JSON.stringify(phienBan)).replace("__DS_TAI_SAN__", JSON.stringify(taiSan));
if (sw.includes("__PHIEN_BAN__") || sw.includes("__DS_TAI_SAN__")) throw new Error("Mẫu sw-mau.js thiếu chỗ thay");
writeFileSync(join(dist, "sw.js"), sw);
console.log(`Xong: dist/sw.js, phiên bản ${phienBan}, ${taiSan.length} tài sản tải trước`);
