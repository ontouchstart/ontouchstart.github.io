from pathlib import Path
from docx import Document


def resume():
    path = Path(__file__).parent.joinpath("resume.docx")
    f = open(path, "rb")
    document = Document(f)
    f.close()
    return document.paragraphs


if __name__ == "__main__":
    for p in resume():
        print(p.text)
