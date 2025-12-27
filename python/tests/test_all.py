import pytest
import hello_maturin


def test_sum_as_string():
    assert hello_maturin.sum_as_string(1, 1) == "2"
