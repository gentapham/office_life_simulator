# Đổi tên đêm diễn 31/10: "Đêm Hồng (Halloween)" -> "Đại Nhạc Hội Siêu Nhân".
# Lời thoại và lựa chọn dùng dạng nói gọn "Đại Nhạc Hội"; lời dẫn, tài liệu, giao diện dùng tên đầy đủ.
import re, pathlib
DAY, GON = "Đại Nhạc Hội Siêu Nhân", "Đại Nhạc Hội"
def doi(dong, laThoai):
    dong = dong.replace("ĐÊM HỒNG HALLOWEEN", DAY.upper()).replace("ĐÊM HỒNG", DAY.upper())
    dong = dong.replace("Đêm Hồng Halloween", GON if laThoai else DAY)
    dong = dong.replace("Đêm Hồng", GON if laThoai else DAY)
    return dong
tong = 0
for p in list(pathlib.Path("story/vi").rglob("*.ink")) + list(pathlib.Path("docs").rglob("*.md")) + list(pathlib.Path("src").rglob("*.js")) + [pathlib.Path("README.md"), pathlib.Path("story/README.md")]:
    goc = p.read_text()
    moi = []
    for d in goc.split("\n"):
        t = d.lstrip()
        laThoai = p.suffix == ".ink" and (re.match(r"^[a-z][a-z0-9_]*:\s", t) or re.match(r"^[*+-]\s*(\{[^}]*\}\s*)?\[", t) or re.match(r"^-\s+[a-z][a-z0-9_]*:", t))
        moi.append(doi(d, bool(laThoai)))
    moi = "\n".join(moi)
    if moi != goc:
        tong += sum(goc.count(x) for x in ["Đêm Hồng", "ĐÊM HỒNG"])
        p.write_text(moi)
print("đã đổi", tong, "chỗ")
