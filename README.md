# ontouchstart_2026_01_15_rs_hello_tokio

## RTFM:

```
make rtfm
```
(This is so cool.)

## hello_tokio

<https://github.com/tokio-rs/website/blob/master/content/tokio/tutorial/hello-tokio.md>

[hello-tokio](hello-tokio)

1. Clone 
```
% git clone https://github.com/tokio-rs/mini-redis.git
```

2. In `mini-redi` repo 

```
mini-redis % cargo run --bin mini-redis-server
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.09s
     Running `target/debug/mini-redis-server`

```

3. In this repo from root

```
% cargo run -p hello-tokio
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.05s
     Running `target/debug/hello-tokio`
got value from the server; result=Some(b"world")
```


