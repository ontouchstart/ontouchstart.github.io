from docx import Document


def resume():
    return Document("resume.docx").paragraphs


if __name__ == "__main__":
    for p in resume():
        print(p.text)
