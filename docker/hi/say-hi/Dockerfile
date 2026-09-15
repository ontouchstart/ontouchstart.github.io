FROM nixos/nix:latest AS builder
WORKDIR /app
COPY main.go default.nix ./
RUN nix-build default.nix

FROM scratch
COPY --from=builder /app/result/bin/hi /hi
ENTRYPOINT ["/hi"]

