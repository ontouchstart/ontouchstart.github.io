from llm_mlx import MlxModel
model = MlxModel("openai/gpt-oss-20b")
print(model.prompt("Write a c program to print Hello world in Chinese"))
