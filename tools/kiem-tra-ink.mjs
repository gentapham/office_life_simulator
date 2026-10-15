// Kiểm tra cú pháp file truyện Ink.
// Cách dùng:
//   node tools/kiem-tra-ink.mjs story/vi/ran_doc.ink [file khác...]
//   node tools/kiem-tra-ink.mjs --all      (kiểm tra mọi file gốc trong story/vi/*.ink)
import fs from "node:fs";
import path from "node:path";
import { createRequire } from "node:module";

const require = createRequire(import.meta.url);
const { Compiler, CompilerOptions } = require("inkjs/dist/ink-full.js");

let files = process.argv.slice(2);
if (files.includes("--all")) {
  const dir = "story/vi";
  files = fs.readdirSync(dir).filter(f => f.endsWith(".ink")).map(f => path.join(dir, f));
}
if (!files.length) {
  console.log("Cách dùng: node tools/kiem-tra-ink.mjs <file.ink> | --all");
  process.exit(1);
}

let failed = 0;
for (const file of files) {
  const root = path.dirname(path.resolve(file));
  const fileHandler = {
    ResolveInkFilename: name => path.resolve(root, name),
    LoadInkFileContents: full => fs.readFileSync(full, "utf8"),
  };
  const errors = [], warnings = [];
  const options = new CompilerOptions(
    file, [], false,
    (msg, type) => (type === 2 ? errors : warnings).push(msg),
    fileHandler
  );
  let ok = true;
  try {
    const compiler = new Compiler(fs.readFileSync(file, "utf8"), options);
    const story = compiler.Compile();
    if (!story || errors.length) ok = false;
  } catch (e) {
    ok = false;
    errors.push(String(e && e.message || e));
  }
  if (ok) {
    console.log(`✅ ${file}` + (warnings.length ? ` (${warnings.length} cảnh báo)` : ""));
  } else {
    failed++;
    console.log(`❌ ${file}`);
    errors.slice(0, 40).forEach(m => console.log("   " + m));
  }
  warnings.slice(0, 10).forEach(m => console.log("   ⚠️ " + m));
}
process.exit(failed ? 1 : 0);
