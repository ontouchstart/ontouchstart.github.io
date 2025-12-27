import pytest  # noqa: F401
import hello_maturin


def test_integer_sum_as_string():
    assert hello_maturin.sum_as_string(1, 1) == "2"


def test_float_sum_as_string():
    assert hello_maturin.sum_as_string(1.5, 2.5) == "4"
    assert hello_maturin.sum_as_string(1.5, 2.4) == "3.9"
