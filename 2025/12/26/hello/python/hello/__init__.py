from .hello import *  # noqa: F403

__doc__ = hello.__doc__  # noqa: F405
if hasattr(hello, "__all__"):  # noqa: F405
    __all__ = hello.__all__  # noqa: F405
