# notebook_2026_01_07

{{#include intro.md}}

## test
 {{#include test.md}}

## make
 {{#include make.md}}

## cargo
 {{#include Cargo.md}}

## mlx_lm.server

```
sam@Sams-MacBook-Pro % make server
uv run mlx_lm.server
/Users/sam/github/ontouchstart.github.io/rust-notebook/.venv/lib/python3.14/site-packages/mlx_lm/server.py:1468: UserWarning: mlx_lm.server is not recommended for production as it only implements basic security checks.
  warnings.warn(
2026-01-07 21:02:09,446 - INFO - Starting httpd at 127.0.0.1 on port 8080...
127.0.0.1 - - [07/Jan/2026 21:02:30] "GET /v1/models HTTP/1.1" 200 -
Fetching 6 files: 100%|████████████████████████████████████████████████████████████████████| 6/6 [00:00<00:00, 54947.21it/s]
127.0.0.1 - - [07/Jan/2026 21:03:01] "POST /v1/chat/completions HTTP/1.1" 200 -
2026-01-07 21:03:01,887 - INFO - Prompt processing progress: 42/43


```

```
sam@Sams-MacBook-Pro % cargo run --bin models &> models.txt
{{#include models.txt}}
sam@Sams-MacBook-Pro % tail -1 models.txt| jq . > models.md
{{#include models.md}}
sam@Sams-MacBook-Pro % cargo run --bin brown_mm &> brown_mm.txt
{{#include brown_mm.txt}}
sam@Sams-MacBook-Pro % tail -1 brown_mm.txt| jq . > brown_mm.md  
{{#include brown_mm.md}}
```

