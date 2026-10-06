# 2026-10-06/cargo

https://ontouchstart.github.io/home/2026-10-06/cargo

https://ontouchstart.github.io/home/2026-10-06/cargo/2026-10-06T20-40-23-252Z_01a112f2-2bd4-705c-b9b0-c75dea37c8d3

```
bash-5.3# nix develop --command cargo test -- --no-capture
warning: Git tree '/home/2026-10-06/cargo' is dirty
    Finished `test` profile [unoptimized + debuginfo] target(s) in 0.24s
     Running unittests src/main.rs (/tmp/cargo-target/debug/deps/cargo-1a9c76f5bef854aa)

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s

     Running tests/test_chat.rs (/tmp/cargo-target/debug/deps/test_chat-41c23b52e855e621)

running 1 test
Checking chat completions at http://host.docker.internal:8080/v1
Response Status: 200 OK
Response Data: {
  "choices": [
    {
      "finish_reason": "length",
      "index": 0,
      "message": {
        "content": "",
        "reasoning_content": "The user said \"Hello!\".\n",
        "role": "assistant"
      }
    }
  ],
  "created": 1791322972,
  "id": "chatcmpl-uwd8aqxdM0eD53Qchk1M7J4IHlsKCpSj",
  "model": "models/gemma-4-12B-it-Q8_0.gguf",
  "object": "chat.completion",
  "system_fingerprint": "b11429-d81235049",
  "timings": {
    "cache_n": 13,
    "predicted_ms": 1209.132,
    "predicted_n": 10,
    "predicted_per_second": 7.443356060380505,
    "predicted_per_token_ms": 134.348,
    "prompt_ms": 363.071,
    "prompt_n": 5,
    "prompt_per_second": 13.771411101409916,
    "prompt_per_token_ms": 72.61420000000001
  },
  "usage": {
    "completion_tokens": 10,
    "prompt_tokens": 18,
    "prompt_tokens_details": {
      "cached_tokens": 13
    },
    "total_tokens": 28
  }
}
test test_check_llama_cpp_server_chat_completions ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 21.03s

     Running tests/test_chat_complex.rs (/tmp/cargo-target/debug/deps/test_chat_complex-089cfd9947364d86)

running 1 test
Checking complex chat at http://host.docker.internal:8080/v1
Response Status: 200 OK
Response Data: {
  "choices": [
    {
      "finish_reason": "stop",
      "index": 0,
      "message": {
        "content": "The capital of France is Paris.",
        "reasoning_content": "The user is asking for the capital of France.\nParis.\nProvide a direct and accurate answer.",
        "role": "assistant"
      }
    }
  ],
  "created": 1791322978,
  "id": "chatcmpl-Wzv3kV8GPiuBDYk4aVJB2ZNSKFEVrvOi",
  "model": "models/gemma-4-12B-it-Q8_0.gguf",
  "object": "chat.completion",
  "system_fingerprint": "b11429-d81235049",
  "timings": {
    "cache_n": 7,
    "predicted_ms": 4346.652,
    "predicted_n": 33,
    "predicted_per_second": 7.361988031247958,
    "predicted_per_token_ms": 135.832875,
    "prompt_ms": 554.544,
    "prompt_n": 16,
    "prompt_per_second": 28.85253469517297,
    "prompt_per_token_ms": 34.659
  },
  "usage": {
    "completion_tokens": 33,
    "prompt_tokens": 23,
    "prompt_tokens_details": {
      "cached_tokens": 7
    },
    "total_tokens": 56
  }
}
Success: Received content: The capital of France is Paris.
test test_check_llama_cpp_server_chat_complex ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 5.11s

     Running tests/test_models.rs (/tmp/cargo-target/debug/deps/test_models-6aaa47a4bd7c8c18)

running 1 test
Checking models at http://host.docker.internal:8080/v1
Response Status: 200 OK
Response Data: {
  "data": [
    {
      "aliases": [
        "models/gemma-4-12B-it-Q8_0.gguf"
      ],
      "architecture": {
        "input_modalities": [
          "text"
        ],
        "output_modalities": [
          "text"
        ]
      },
      "created": 1791322978,
      "id": "models/gemma-4-12B-it-Q8_0.gguf",
      "meta": {
        "ftype": "Q8_0",
        "n_ctx": 193024,
        "n_ctx_train": 262144,
        "n_embd": 3840,
        "n_params": 11907350576,
        "n_vocab": 262144,
        "size": 12653822144,
        "vocab_type": 2
      },
      "object": "model",
      "owned_by": "llamacpp",
      "tags": []
    }
  ],
  "models": [
    {
      "capabilities": [
        "completion"
      ],
      "description": "",
      "details": {
        "families": [
          ""
        ],
        "family": "",
        "format": "gguf",
        "parameter_size": "",
        "parent_model": "",
        "quantization_level": ""
      },
      "digest": "",
      "model": "models/gemma-4-12B-it-Q8_0.gguf",
      "modified_at": "",
      "name": "models/gemma-4-12B-it-Q8_0.gguf",
      "parameters": "",
      "size": "",
      "tags": [
        ""
      ],
      "type": "model"
    }
  ],
  "object": "list"
}
test test_check_llama_cpp_server_models ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.05s

bash-5.3# 
```
