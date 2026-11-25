# 2026-11-25-aws-emulator
# --- Variables (Defaults) ---
bucket ?= upload-bucket
file ?=
key ?=
dest ?=
prefix ?=

# Internal container path
DATA_PATH = /data

.PHONY: help build up down s3-list s3-upload s3-download s3-keys

# Default task
help:
	@echo "AWS Emulator Toolbox"
	@echo "---------------------"
	@echo "Usage:"
	@echo "  make build                 Build all Docker images"
	@echo "  make up                    Start the emulator in the background"
	@echo "  make down                  Stop and remove containers"
	@echo ""
	@echo "S3 Commands (Files must be in the ./data folder):"
	@echo "  make s3-list"
	@echo "  make s3-upload file=AI.md bucket=my-bucket key=AI.md"
	@echo "  make s3-upload file=AI.md bucket=my-bucket key=AI/README.md"
	@echo "  make s3-download bucket=my-bucket key=/AI.md dest=downloaded/AI.md"
	@echo "  make s3-download bucket=my-bucket key=/AI/README.md dest=downloaded/AI/README.md"
	@echo "  make s3-keys bucket=my-bucket"
	@echo "  make s3-keys bucket=my-bucket prefix=/AI"
	@echo ""
	@echo "Note: Use 'make [command] [var]=[val]' to override defaults."

build:
	docker compose build

up:
	docker compose up -d aws-emulator

down:
	docker compose down

# --- S3 One-Liners ---

s3-list:
	docker compose run --rm s3-client python s3_list_buckets.py

s3-upload:
	@if [ -z "$(file)" ]; then echo "Error: 'file' is required. Usage: make s3-upload file=filename"; exit 1; fi
	docker compose run --rm s3-client python s3_upload.py $(DATA_PATH)/$(file) --bucket $(bucket) --key $(key)

s3-download:
	@if [ -z "$(bucket)" ] || [ -z "$(key)" ] || [ -z "$(dest)" ]; then echo "Error: bucket, key, and dest are required."; exit 1; fi
	docker compose run --rm s3-client python s3_download.py --bucket $(bucket) --key $(key) --dest $(DATA_PATH)/$(dest)

s3-keys:
	docker compose run --rm s3-client python s3_list_bucket_keys.py --bucket $(bucket) $(if $(prefix),--prefix $(prefix),)

s3-test:
	make up
	rm -rf data
	mkdir -p data
	cp README.md data/AI.md
	make s3-list
	make s3-upload file=AI.md bucket=my-bucket key=/AI.md
	make s3-upload file=AI.md bucket=my-bucket key=/AI/README.md
	make s3-keys bucket=my-bucket
	make s3-keys bucket=my-bucket prefix=/AI	
	make s3-download bucket=my-bucket key=/AI.md dest=downloaded/AI.md
	make s3-download bucket=my-bucket key=/AI/README.md dest=downloaded/AI/README.md
	make down
	ls -lR data
	rm -rf data
