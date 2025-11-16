from llm_mlx import MlxModel
model = MlxModel("openai/gpt-oss-20b")
print(model.prompt("Hello world in Chinese").text())
