from docx import Document

resume = Document("resume.docx")

for p in resume.paragraphs:
    print(p.text)
