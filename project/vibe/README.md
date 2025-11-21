# vibe coding
```
uv run mlx_lm.generate --max-tokens 4096  --prompt "write a python script to investigate how the command 'mlx_lm.generate --prompt --max-tokens ' works,  use import mlx_lm " --model openai/gpt-oss-20b >introspect.log
```

manual fix

```
diff introspect.py mlx_generate_inspector.py 
20a21
>     model, tokenizer = mlx_lm.load("mistralai/Mistral-7B-Instruct-v0.3")
47c48
<         output = "".join(mlx_lm.generate(prompt=prompt, max_tokens=max_tokens))
---
>         output = "".join(mlx_lm.generate(model=model, tokenizer=tokenizer, prompt=prompt, max_tokens=max_tokens))
```

```
uv run mlx_generate_inspector.py --prompt "History of React" --max-tokens 2048
```
Fetching 11 files: 100%|███████████████████████████████████████████████████████████████████████████| 11/11 [00:00<00:00, 249391.05it/s]

=== mlx_lm.generate ===
Signature: (model: mlx.nn.layers.base.Module, tokenizer: transformers.tokenization_utils.PreTrainedTokenizer | mlx_lm.tokenizer_utils.TokenizerWrapper, prompt: str | List[int], verbose: bool = False, **kwargs) -> str

Docstring:
Generate a complete response from the model.

Args:
   model (nn.Module): The language model.
   tokenizer (PreTrainedTokenizer): The tokenizer.
   prompt (Union[str, List[int]]): The input prompt string or integer tokens.
   verbose (bool): If ``True``, print tokens and timing information.
       Default: ``False``.
   kwargs: The remaining options get passed to :func:`stream_generate`.
      See :func:`stream_generate` for more details.
========================

Generating text for prompt: 'History of React' (max_tokens=2048)

=== Generated Text ===


React is a JavaScript library for building user interfaces, developed by Facebook and open-sourced in 2013. It was created by Jordan Walke, a software engineer at Facebook, and was initially used internally for the development of the news feed.

The first public release of React was in May 2013, and it was initially called "FaxJS". The name was later changed to React, which is a term used in computer science to describe the process of updating or rendering a user interface in response to changes in the underlying data.

React gained popularity quickly due to its simplicity, efficiency, and flexibility. It allows developers to build complex user interfaces using a declarative approach, where the desired state of the UI is specified and the library takes care of updating the UI to match that state. This approach makes it easier to reason about the behavior of the UI and to build reusable components.

In 2015, Facebook open-sourced another project called React Native, which allows developers to build native mobile apps using React. This further increased the popularity of React and made it possible to use the same library for building both web and mobile apps.

Today, React is one of the most popular JavaScript libraries for building user interfaces, and it is used by many large companies, including Facebook, Airbnb, and Netflix. It has also inspired the creation of many other libraries and frameworks, such as Angular, Vue.js, and Preact.
======================

Time taken: 38.084 seconds
