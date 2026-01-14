all:	pyproject.toml
	env
	uv --version

pyproject.toml:
	uv init . --name ontouchstart_2026_01_14_py
