# hello-gpt-oss-20b-harmony
```
Hello from hello-gpt-oss-20b-harmony!
messages=[Message(author=Author(role=<Role.SYSTEM: 'system'>, name=None), content=[SystemContent(model_identity='You are ChatGPT, a large language model trained by OpenAI.', reasoning_effort=<ReasoningEffort.HIGH: 'High'>, conversation_start_date=None, knowledge_cutoff='2024-06', channel_config=ChannelConfig(valid_channels=['analysis', 'commentary', 'final'], channel_required=True), tools=None)], channel=None, recipient=None, content_type=None), Message(author=Author(role=<Role.DEVELOPER: 'developer'>, name=None), content=[DeveloperContent(instructions='Always respond in riddles in Chinese language', tools={'functions': ToolNamespaceConfig(name='functions', description=None, tools=[ToolDescription(name='get_current_weather', description='Gets the current weather in the provided location.', parameters={'type': 'object', 'properties': {'location': {'type': 'string', 'description': 'The city and state, e.g. San Francisco, CA'}, 'format': {'type': 'string', 'enum': ['celsius', 'fahrenheit'], 'default': 'celsius'}}, 'required': ['location']})])})], channel=None, recipient=None, content_type=None), Message(author=Author(role=<Role.USER: 'user'>, name=None), content=[TextContent(text='What is the weather in Tokyo?')], channel=None, recipient=None, content_type=None), Message(author=Author(role=<Role.ASSISTANT: 'assistant'>, name=None), content=[TextContent(text='User asks: "What is the weather in Tokyo?" We need to use get_current_weather tool.')], channel='analysis', recipient=None, content_type=None), Message(author=Author(role=<Role.ASSISTANT: 'assistant'>, name=None), content=[TextContent(text='{"location": "Tokyo"}')], channel='commentary', recipient='functions.get_current_weather', content_type='<|constrain|> json'), Message(author=Author(role=<Role.TOOL: 'tool'>, name='functions.get_current_weather'), content=[TextContent(text='{ "temperature": 20, "sunny": true }')], channel='commentary', recipient=None, content_type=None)]
==========
<|channel|>final<|message|>在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧的画卷。
==========
Prompt: 232 tokens, 355.800 tokens-per-sec
Generation: 38 tokens, 33.967 tokens-per-sec
Peak memory: 14.611 GB
<|channel|>final<|message|>在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧的画卷。
[200005, 17196, 200008, 2178, 103063, 979, 167823, 10270, 135270, 51636, 11071, 67145, 979, 37568, 8913, 27526, 7779, 14334, 8913, 979, 14919, 20244, 10170, 8061, 979, 1467, 123, 69001, 2432, 49757, 68903, 7856, 100, 1616, 22126, 92352, 788]
--------------------------------
current_role Role.ASSISTANT
current_channel None
last_content_delta None
current_content_type None
current_recipient None
current_content 
--------------------------------
current_role Role.ASSISTANT
current_channel None
last_content_delta None
current_content_type None
current_recipient None
current_content 
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta None
current_content_type None
current_recipient None
current_content 
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 在
current_content_type None
current_recipient None
current_content 在
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 东京
current_content_type None
current_recipient None
current_content 在东京
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta ，
current_content_type None
current_recipient None
current_content 在东京，
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 天气
current_content_type None
current_recipient None
current_content 在东京，天气
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 如
current_content_type None
current_recipient None
current_content 在东京，天气如
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 谜
current_content_type None
current_recipient None
current_content 在东京，天气如谜
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 般
current_content_type None
current_recipient None
current_content 在东京，天气如谜般
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 明
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 朗
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta ，
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 温
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 度
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 约
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 二
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 十
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 度
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta ，
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 阳
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 光
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 正
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 好
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta ，
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta None
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 仿
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 佛
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 一
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 幅
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 静
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta None
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 谧
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 的
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧的
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 画
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧的画
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 卷
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧的画卷
--------------------------------
current_role Role.ASSISTANT
current_channel final
last_content_delta 。
current_content_type None
current_recipient None
current_content 在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧的画卷。
[Message(author=Author(role=<Role.ASSISTANT: 'assistant'>, name=None), content=[TextContent(text='在东京，天气如谜般明朗，温度约二十度，阳光正好，仿佛一幅静谧的画卷。')], channel='final', recipient=None, content_type=None)]
```
