# What time is it now?
```
--------------------------------------------------------------------------------
Direct answer
2025-12-04 00:31:31.193535
```
# Over engineered answer via tool call
```
messages
--------------------------------------------------------------------------------
[{'role': 'user', 'content': 'What time is it now?'}]
Initial tool call
--------------------------------------------------------------------------------
==========
<tool_call>
{"name": "now", "arguments": {}}
</tool_call>
==========
Prompt: 153 tokens, 250.001 tokens-per-sec
Generation: 15 tokens, 33.986 tokens-per-sec
Peak memory: 4.584 GB
prompt
--------------------------------------------------------------------------------
(1, 151644, '<|im_start|>')
(2, 8948, 'system')
(3, 198, '\n')
(4, 2610, 'You')
(5, 525, ' are')
(6, 1207, ' Q')
(7, 16948, 'wen')
(8, 11, ',')
(9, 3465, ' created')
(10, 553, ' by')
(11, 54364, ' Alibaba')
(12, 14817, ' Cloud')
(13, 13, '.')
(14, 1446, ' You')
(15, 525, ' are')
(16, 264, ' a')
(17, 10950, ' helpful')
(18, 17847, ' assistant')
(19, 382, '.\n\n')
(20, 2, '#')
(21, 13852, ' Tools')
(22, 271, '\n\n')
(23, 2610, 'You')
(24, 1231, ' may')
(25, 1618, ' call')
(26, 825, ' one')
(27, 476, ' or')
(28, 803, ' more')
(29, 5746, ' functions')
(30, 311, ' to')
(31, 7789, ' assist')
(32, 448, ' with')
(33, 279, ' the')
(34, 1196, ' user')
(35, 3239, ' query')
(36, 382, '.\n\n')
(37, 2610, 'You')
(38, 525, ' are')
(39, 3897, ' provided')
(40, 448, ' with')
(41, 729, ' function')
(42, 32628, ' signatures')
(43, 2878, ' within')
(44, 366, ' <')
(45, 15918, 'tools')
(46, 1472, '></')
(47, 15918, 'tools')
(48, 29, '>')
(49, 11874, ' XML')
(50, 9492, ' tags')
(51, 510, ':\n')
(52, 27, '<')
(53, 15918, 'tools')
(54, 397, '>\n')
(55, 4913, '{"')
(56, 1313, 'type')
(57, 788, '":')
(58, 330, ' "')
(59, 1688, 'function')
(60, 497, '",')
(61, 330, ' "')
(62, 1688, 'function')
(63, 788, '":')
(64, 5212, ' {"')
(65, 606, 'name')
(66, 788, '":')
(67, 330, ' "')
(68, 3328, 'now')
(69, 497, '",')
(70, 330, ' "')
(71, 4684, 'description')
(72, 788, '":')
(73, 330, ' "')
(74, 32, 'A')
(75, 729, ' function')
(76, 429, ' that')
(77, 4675, ' returns')
(78, 1482, ' current')
(79, 882, ' time')
(80, 497, '",')
(81, 330, ' "')
(82, 13786, 'parameters')
(83, 788, '":')
(84, 5212, ' {"')
(85, 1313, 'type')
(86, 788, '":')
(87, 330, ' "')
(88, 1700, 'object')
(89, 497, '",')
(90, 330, ' "')
(91, 13193, 'properties')
(92, 788, '":')
(93, 314, ' {')
(94, 3417, '}}')
(95, 11248, '}}\n')
(96, 522, '</')
(97, 15918, 'tools')
(98, 1339, '>\n\n')
(99, 2461, 'For')
(100, 1817, ' each')
(101, 729, ' function')
(102, 1618, ' call')
(103, 11, ',')
(104, 470, ' return')
(105, 264, ' a')
(106, 2951, ' json')
(107, 1633, ' object')
(108, 448, ' with')
(109, 729, ' function')
(110, 829, ' name')
(111, 323, ' and')
(112, 5977, ' arguments')
(113, 2878, ' within')
(114, 220, ' ')
(115, 151657, '<tool_call>')
(116, 151658, '</tool_call>')
(117, 11874, ' XML')
(118, 9492, ' tags')
(119, 510, ':\n')
(120, 151657, '<tool_call>')
(121, 198, '\n')
(122, 4913, '{"')
(123, 606, 'name')
(124, 788, '":')
(125, 366, ' <')
(126, 1688, 'function')
(127, 11494, '-name')
(128, 8066, '>,')
(129, 330, ' "')
(130, 16370, 'arguments')
(131, 788, '":')
(132, 366, ' <')
(133, 2116, 'args')
(134, 56080, '-json')
(135, 40432, '-object')
(136, 31296, '>}\n')
(137, 151658, '</tool_call>')
(138, 151645, '<|im_end|>')
(139, 198, '\n')
(140, 151644, '<|im_start|>')
(141, 872, 'user')
(142, 198, '\n')
(143, 3838, 'What')
(144, 882, ' time')
(145, 374, ' is')
(146, 432, ' it')
(147, 1431, ' now')
(148, 30, '?')
(149, 151645, '<|im_end|>')
(150, 198, '\n')
(151, 151644, '<|im_start|>')
(152, 77091, 'assistant')
(153, 198, '\n')
tool_call
--------------------------------------------------------------------------------
{'name': 'now', 'arguments': {}}
tool_result
--------------------------------------------------------------------------------
2025-12-04 00:31:32.325811
messages
--------------------------------------------------------------------------------
[{'role': 'tool', 'name': 'now', 'content': '2025-12-04 00:31:32.325811'}]
==========
The current time is 2025-12-04 00:31:32.325811.
==========
Prompt: 64 tokens, 227.049 tokens-per-sec
Generation: 33 tokens, 32.254 tokens-per-sec
Peak memory: 4.584 GB
prompt
--------------------------------------------------------------------------------
(1, 151644, '<|im_start|>')
(2, 8948, 'system')
(3, 198, '\n')
(4, 2610, 'You')
(5, 525, ' are')
(6, 1207, ' Q')
(7, 16948, 'wen')
(8, 11, ',')
(9, 3465, ' created')
(10, 553, ' by')
(11, 54364, ' Alibaba')
(12, 14817, ' Cloud')
(13, 13, '.')
(14, 1446, ' You')
(15, 525, ' are')
(16, 264, ' a')
(17, 10950, ' helpful')
(18, 17847, ' assistant')
(19, 13, '.')
(20, 151645, '<|im_end|>')
(21, 198, '\n')
(22, 151644, '<|im_start|>')
(23, 872, 'user')
(24, 198, '\n')
(25, 27, '<')
(26, 14172, 'tool')
(27, 9655, '_response')
(28, 397, '>\n')
(29, 17, '2')
(30, 15, '0')
(31, 17, '2')
(32, 20, '5')
(33, 12, '-')
(34, 16, '1')
(35, 17, '2')
(36, 12, '-')
(37, 15, '0')
(38, 19, '4')
(39, 220, ' ')
(40, 15, '0')
(41, 15, '0')
(42, 25, ':')
(43, 18, '3')
(44, 16, '1')
(45, 25, ':')
(46, 18, '3')
(47, 17, '2')
(48, 13, '.')
(49, 18, '3')
(50, 17, '2')
(51, 20, '5')
(52, 23, '8')
(53, 16, '1')
(54, 16, '1')
(55, 198, '\n')
(56, 522, '</')
(57, 14172, 'tool')
(58, 9655, '_response')
(59, 29, '>')
(60, 151645, '<|im_end|>')
(61, 198, '\n')
(62, 151644, '<|im_start|>')
(63, 77091, 'assistant')
(64, 198, '\n')
```
==========
<tool_call>
{"name": "fetch", "arguments": {"url": "https://ontouchstart.github.io/2025/12/04/what-time-is-it-now/main.py"}}
</tool_call>
==========
Prompt: 202 tokens, 245.569 tokens-per-sec
Generation: 44 tokens, 32.418 tokens-per-sec
Peak memory: 4.596 GB
==========
The provided Python code fetches and processes the current time using a combination of a direct function call and an over-engineered approach that involves calling a tool function. Here's a breakdown of the code:

1. **Imports and Model Loading**:
   - The code imports necessary libraries and loads a pre-trained model and tokenizer from the `mlx-community/Qwen2.5-7b-Instruct-4bit` checkpoint.

2. **`now()` Function**:
   - This function returns the current datetime in the format `YYYY-MM-DD HH:MM:SS`.

3. **Direct Answer**:
   - The code prints the current time directly using the `now()` function.

4. **Over-Engineered Answer**:
   - The code constructs a message to be passed to a tool function.
   - It then generates a prompt using the `tokenizer` and `apply_chat_template` method.
   - The prompt is sent to the model for generation.
   - The tool function (`now()`) is called with the arguments from the generated response.
   - The result of the tool function is then included in the prompt and the process is repeated.

Here is the code with some comments for clarity:

```python
import datetime
import json
from mlx_lm import generate, load
from mlx_lm.models.cache import make_prompt_cache

checkpoint = "mlx-community/Qwen2.5-7b-Instruct-4bit"
model, tokenizer = load(path_or_hf_repo=checkpoint)

def now():
    """
    A function that returns current time 
    """
    return f"{datetime.datetime.now()}"

def print_prompt(prompt):
    print("prompt")
    print("-" * 80)
    i = 0
    for token in prompt:
        i += 1
        print((i, token, tokenizer.decode(token)))

tools = {"now": now}

content = "What time is it now?"

print(f"# {content}")
print('```')
print("-" * 80)
print("Direct answer")
print(now())
print('```')

print("# Over engineered answer via tool call")

print('```')
messages = [{"role": "user", "content": content}]
print("messages")
print("-" * 80)
print(messages)

prompt = tokenizer.apply_chat_template(
    messages, add_generation_prompt=True, tools=list(tools.values())
)
prompt_cache = make_prompt_cache(model)

print("Initial tool call")
print("-" * 80)
response = generate(
    model=model,
    tokenizer=tokenizer,
    prompt=prompt,
    verbose=True,
    prompt_cache=prompt_cache,
)
print_prompt(prompt)

tool_open = "<tool_call>"
tool_close = "</tool_call>"
start_tool = response.find(tool_open) + len(tool_open)
end_tool = response.find(tool_close)
tool_call = json.loads(response[start_tool:end_tool].strip())
tool_result = tools[tool_call["name"]](**tool_call["arguments"])

print("tool_call")
print("-" * 80)
print(tool_call)
print("tool_result")
print("-" * 80)
print(tool_result)

# Put the tool result in the prompt
messages = [{"role": "tool", "name": tool_call["name"], "content": tool_result}]
print("messages")
print("-" * 80)
print(messages)
prompt = tokenizer.apply_chat_template(
    messages,
    add_generation_prompt=True,
)

generate(
    model=model,
    tokenizer=tokenizer,
    prompt=prompt,
    verbose=True,
    prompt_cache=prompt_cache,
)
print_prompt(prompt)
print('```')
```

This code demonstrates a complex process for fetching the current time, which is ultimately simplified by directly calling the `now()` function. The over-engineered part involves using a tool function and a chat template, which might be useful in more complex scenarios where the model needs to interact with external tools or services.
==========
Prompt: 526 tokens, 274.333 tokens-per-sec
Generation: 799 tokens, 30.798 tokens-per-sec
Peak memory: 4.864 GB
