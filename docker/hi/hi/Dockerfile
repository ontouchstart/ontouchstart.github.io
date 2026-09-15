FROM nixos/nix:latest AS builder
RUN mkdir /hi

FROM hi-scratch
COPY --from=builder /hi /hi
WORKDIR /hi
