from complicated_math import complicated_math
from box_and_pointer_diagrams import box_and_pointer_diagrams
from commutative_diagram import commutative_diagram


def mathjax():
    return rf"""## MathJax

Here are some MathJax samples from Internet, see if they render on this page.

{complicated_math()}
{box_and_pointer_diagrams()}
{commutative_diagram()}

"""
