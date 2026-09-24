{
  "targets": [
    {
      "target_name": "test_addon",
      "sources": [ "hello.cc" ],
      "libraries": [
        "-lsqlite3"
      ],
      "defines": [
        "NAPI_DISABLE_CPP_EXCEPTIONS"
      ]
    }
  ]
}
