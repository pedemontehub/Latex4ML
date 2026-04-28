"""
Minimal presentation template.
Usage: python presentations/my_talk.py
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent.parent / "templates" / "python"))
from helpers import (
    new_prs, slide_title, slide_agenda,
    slide_bullets, slide_thank_you,
)

OUT = Path(__file__).parent / "my_talk.pptx"
TOTAL = 6


def build():
    prs = new_prs()

    slide_title(prs,
        title="Presentation Title",
        subtitle="Optional subtitle",
        author="Author Name",
        institution="Institution",
        date="Month Year")

    slide_agenda(prs, [
        "Introduction",
        "Main Topic",
        "Conclusions",
    ])

    slide_bullets(prs, "Introduction",
        items=[
            ("First key point", 0),
            ("Supporting detail", 1),
            ("Second key point", 0),
        ],
        slide_num=3, total=TOTAL)

    slide_bullets(prs, "Main Topic",
        items=[
            ("Core idea", 0),
            ("Detail A", 1),
            ("Detail B", 1),
            ("Implication", 0),
        ],
        slide_num=4, total=TOTAL)

    slide_bullets(prs, "Conclusions",
        items=[
            ("Summary point 1", 0),
            ("Summary point 2", 0),
            ("Future work", 0),
        ],
        slide_num=5, total=TOTAL)

    slide_thank_you(prs, contact="author@institution.edu")

    prs.save(str(OUT))
    print(f"Saved: {OUT}")


if __name__ == "__main__":
    build()
