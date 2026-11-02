// Tin nhắn trong truyện (cảnh ở "điện thoại", sự kiện tin nhắn bất ngờ): chép lời thật trong khung thoại
// thành các dòng tin nhắn, để xem lại trong Zola (nhắn riêng / nhóm) hoặc Tin nhắn (SMS) với đúng ngày giờ.
// Mỗi mục trong L.tinDaDoc: { ten, ngay, p?, knot?, ma?, nhom?, kenh?, dong?: [{ ai: "ho" | "toi" | "ke", ma?, ten?, chu }] }.
// Bản lưu cũ chỉ có { ten, ngay }: điện thoại vẫn hiện như trước (câu cửa miệng của người gửi).
import "./tin-truyen.css";

export const NHOM_CONG_TY = "G-Ent Anh Em Một Nhà";
const TOI_DA_DONG = 16, TOI_DA_TIN = 80;
const BO_BIEU_TUONG = /^[\p{Extended_Pictographic}\p{Emoji_Modifier}️‍\s]+/u;

// các dòng đang có trong nhật ký hội thoại -> dòng tin nhắn
export function docDongTin(log, maTheoTen) {
  const dong = [];
  for (const n of log?.children || []) {
    let x = null;
    if (n.matches(".line")) {
      const ten = n.querySelector(".who")?.textContent.trim() || "";
      x = { ai: n.classList.contains("me") ? "toi" : "ho", ten, chu: n.querySelector(".say")?.textContent || "" };
      const ma = maTheoTen(ten); if (ma) x.ma = ma;
    } else if (n.matches("p.narr")) {
      const c = n.cloneNode(true); c.querySelector(".sub")?.remove();
      x = { ai: "ke", chu: c.textContent };
      const trich = /^["“]([^"“”]+)["”]\.?$/.exec(x.chu.trim()); // nguyên câu trong ngoặc kép: tin của ai đó trong nhóm
      if (trich) x = { ai: "ho", ten: "", chu: trich[1] };
      if (/^(ting!?\s*)+\.?$/i.test(x.chu.trim())) x = null; // tiếng "Ting!" không cần chép
    } else if (n.matches(".chosen")) {
      const c = n.textContent.replace(/^→\s*/, "").replace(BO_BIEU_TUONG, "").trim();
      const trich = /^["“](.+?)["”]\.?$/.exec(c) || /:\s*["“](.+?)["”]\.?$/.exec(c);
      x = trich ? { ai: "toi", chu: trich[1] } : { ai: "ke", chu: c };
    }
    if (x) { x.chu = x.chu.replace(/\s+/g, " ").trim().slice(0, 280); if (x.chu) dong.push(x); }
  }
  return dong.slice(0, TOI_DA_DONG);
}

// tin nhắn đi đâu: nhóm Zola, nhắn riêng Zola với ai, hay SMS
export function phanLoaiTin(dong, { noi = [], maToi, coNguoi }) {
  const chu = dong.map(x => x.chu).join("\n");
  const kq = {};
  if (/\b(SMS|tổng đài)\b|tin nhắn thường|Hóng Bank|Viết-teo/i.test(chu)) kq.kenh = "sms";
  else if (/\b(group|nhóm chat|nhóm Zola)\b/i.test(chu)) {
    const ten = /(?:group|nhóm)\s*"([^"]+)"/i.exec(chu)?.[1];
    kq.nhom = !ten || /toàn công ty|công ty/i.test(ten) ? NHOM_CONG_TY : ten;
  }
  // người nhắn: ai nói trong tin, không thì người có mặt trong cảnh
  const ma = dong.find(x => x.ai === "ho" && x.ma && x.ma !== maToi)?.ma || noi.find(m => m !== maToi && coNguoi(m));
  if (ma) kq.ma = ma;
  if (!kq.nhom && !kq.ma) kq.kenh = "sms";
  return kq;
}

// ghi lời thật vào mục tin nhắn (gọi lúc tin vừa hiện và lúc đọc xong)
export function ghiLoiTin(tin, log, ctx) {
  if (!tin) return;
  const dong = docDongTin(log, ctx.maTheoTen);
  if (!dong.length) return;
  for (const k of ["ma", "nhom", "kenh"]) delete tin[k];
  Object.assign(tin, { dong }, phanLoaiTin(dong, ctx));
}

export function themTin(ds, tin) {
  ds.push(tin);
  if (ds.length > TOI_DA_TIN) ds.splice(0, ds.length - TOI_DA_TIN);
  return tin;
}
