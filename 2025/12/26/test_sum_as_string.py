from hello_maturin import sum_as_string


def test_int_sum_as_string():
    assert sum_as_string(1, 2) == "3"


def test_float_sum_as_string():
    assert sum_as_string(1.5, 2.5) == "4"
    assert sum_as_string(1.5, 2.4) == "3.9"
