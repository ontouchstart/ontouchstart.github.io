import pytest
import hello


def test_sum_as_string():
    assert hello.sum_as_string(1, 1) == "2"
