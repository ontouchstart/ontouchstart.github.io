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
sam@Sams-MacBook-Pro ontouchstart_2026_01_15 % cargo run -p hello-tokio --bin hello-tokio
   Compiling hello-tokio v0.1.0 (/Users/sam/github/ontouchstart_2026_01_15/hello-tokio)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.28s
     Running `target/debug/hello-tokio`
got value from the server; result=Some(b"world")
```

4.

```
sam@Sams-MacBook-Pro ontouchstart_2026_01_15 % cargo run -p hello-tokio --bin set_value key 
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.05s
     Running `target/debug/set_value key`
Usage: set_value key value
sam@Sams-MacBook-Pro ontouchstart_2026_01_15 % cargo run -p hello-tokio --bin set_value key value
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.04s
     Running `target/debug/set_value key value`
set: key=key, value=value
sam@Sams-MacBook-Pro ontouchstart_2026_01_15 % cargo run -p hello-tokio --bin get_value          
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.05s
     Running `target/debug/get_value`
Usage: get_value key
sam@Sams-MacBook-Pro ontouchstart_2026_01_15 % cargo run -p hello-tokio --bin get_value key
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.04s
     Running `target/debug/get_value key`
key=key, value=Some(
    b"value",
)

```
