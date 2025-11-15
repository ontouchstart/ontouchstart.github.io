# mlx-lm-gpt-oss-20b 

```
make
uv add mlx_lm
Resolved 26 packages in 4ms
Audited 24 packages in 0.56ms
uv run hello-world.py
Fetching 12 files: 100%|█████████████████████████████████████████████████████████████████████████████████████████| 12/12 [00:00<00:00, 299593.14it/s]
==========
<|channel|>analysis<|message|>The user says: "Hello world in Chinese". They likely want the phrase "Hello world" translated into Chinese. The standard translation is "你好，世界" (nǐ hǎo, shì jiè). Could also be "你好世界" without comma. So answer: 你好，世界. Also maybe mention pinyin. So respond with that.<|end|><|start|>assistant<|channel|>final<|message|>你好，世界  
(Pronunciation: *nǐ hǎo, shì jiè*)
==========
Prompt: 71 tokens, 194.970 tokens-per-sec
Generation: 105 tokens, 32.612 tokens-per-sec
Peak memory: 14.611 GB
```
