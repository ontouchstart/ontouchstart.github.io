from .hello import *

__doc__ = hello.__doc__
if hasattr(hello, "__all__"):
    __all__ = hello.__all__
