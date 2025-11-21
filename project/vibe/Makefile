all:
	uv add mlx_lm sentencepiece
	uv run mlx_lm.generate --max-tokens 4096  --prompt "write a python script to investigate how the command 'mlx_lm.generate --prompt --max-tokens ' works,  use import mlx_lm " --model openai/gpt-oss-20b > introspect.log
	# Some manual work
	-diff introspect.py mlx_generate_inspector.py
	uv run mlx_generate_inspector.py --prompt "History of React" --max-tokens 2048
	
