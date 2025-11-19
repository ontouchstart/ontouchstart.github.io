from openai_harmony import (
    Author,
    Conversation,
    DeveloperContent,
    HarmonyEncodingName,
    Message,
    Role,
    SystemContent,
    StreamableParser,
    ToolDescription,
    load_harmony_encoding,
    ReasoningEffort
)

from mlx_lm import generate, load

checkpoint = "openai/gpt-oss-20b"

model, tokenizer = load(path_or_hf_repo=checkpoint)

encoding = load_harmony_encoding(HarmonyEncodingName.HARMONY_GPT_OSS)
 
system_message = (
    SystemContent.new()
        .with_reasoning_effort(ReasoningEffort.HIGH)
)
 
developer_message = (
    DeveloperContent.new()
        .with_instructions("Always respond in riddles in Chinese language")
        .with_function_tools(
            [
                ToolDescription.new(
                    "get_current_weather",
                    "Gets the current weather in the provided location.",
                    parameters={
                        "type": "object",
                        "properties": {
                            "location": {
                                "type": "string",
                                "description": "The city and state, e.g. San Francisco, CA",
                            },
                            "format": {
                                "type": "string",
                                "enum": ["celsius", "fahrenheit"],
                                "default": "celsius",
                            },
                        },
                        "required": ["location"],
                    },
                ),
            ]
	)
)
 
convo = Conversation.from_messages(
    [
        Message.from_role_and_content(Role.SYSTEM, system_message),
        Message.from_role_and_content(Role.DEVELOPER, developer_message),
        Message.from_role_and_content(Role.USER, "What is the weather in Tokyo?"),
        Message.from_role_and_content(
            Role.ASSISTANT,
            'User asks: "What is the weather in Tokyo?" We need to use get_current_weather tool.',
        ).with_channel("analysis"),
        Message.from_role_and_content(Role.ASSISTANT, '{"location": "Tokyo"}')
        .with_channel("commentary")
        .with_recipient("functions.get_current_weather")
        .with_content_type("<|constrain|> json"),
        Message.from_author_and_content(
            Author.new(Role.TOOL, "functions.get_current_weather"),
            '{ "temperature": 20, "sunny": true }',
        ).with_channel("commentary"),
    ]
)
 
stream = StreamableParser(encoding, role=Role.ASSISTANT)

tokens = encoding.render_conversation_for_completion(convo, Role.ASSISTANT)
 
# After receiving a token response
# Do not pass in the stop token
# parsed_response = encoding.parse_messages_from_completion_tokens(new_tokens, Role.ASSISTANT)


def main():
    print("Hello from hello-gpt-oss-20b-harmony!")
    print(convo)

    response = generate(model=model, tokenizer=tokenizer, prompt=tokens, max_tokens=1024, verbose=True)
    print(response)
    new_tokens = encoding.encode(response, allowed_special={'<|channel|>', '<|message|>'})
    print(new_tokens)
    for new_token in new_tokens:
        stream.process(new_token)
        print("--------------------------------")
        print("current_role", stream.current_role)
        print("current_channel", stream.current_channel)
        print("last_content_delta", stream.last_content_delta)
        print("current_content_type", stream.current_content_type)
        print("current_recipient", stream.current_recipient)
        print("current_content", stream.current_content)
    parsed_response = encoding.parse_messages_from_completion_tokens(new_tokens, Role.ASSISTANT)
    print(parsed_response)


if __name__ == "__main__":
    main()
