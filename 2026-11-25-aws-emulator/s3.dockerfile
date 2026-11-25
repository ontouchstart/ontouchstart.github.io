FROM python:3.11-slim
RUN pip install boto3
WORKDIR /app

# Copy only the necessary S3 tools into the container image
COPY s3_upload.py ./
COPY s3_download.py ./
COPY s3_list_buckets.py ./
COPY s3_list_bucket_keys.py ./

# No CMD needed; the Makefile will call specific scripts
