import boto3
import os
import time
import argparse
import sys
from botocore.exceptions import ClientError

# --- Configuration ---
# These match your docker-compose/emulator setup
ENDPOINT_URL = os.getenv("AWS_ENDPOINT_URL", "https://aws-emulator:9297")
CREDS_PATH = "/home/emulator/.aws/emulator/9297/emulator_credentials"
CA_PATH = "/home/emulator/.aws/emulator/9297/ca.pem"

def wait_for_emulator(path, timeout=30):
    """Wait for the emulator to generate credentials in the shared volume."""
    start_time = time.time()
    while not os.path.exists(path):
        time.sleep(1)
        if time.time() - start_time > timeout:
            print(f"Error: Timeout waiting for {path}")
            sys.exit(1)

def main():
    parser = argparse.ArgumentParser(description="Upload a file to the AWS Emulator S3.")
    parser.add_argument("file_path", help="Path to the local file you want to upload")
    parser.add_argument("--bucket", default="upload-bucket", help="Target S3 bucket name (default: upload-bucket)")
    parser.add_argument("--key", help="The name the file should have in S3 (defaults to local filename)")

    args = parser.parse_args()

    # 1. Validate local file
    if not os.path.isfile(args.file_path):
        print(f"Error: File '{args.file_path}' not found.")
        sys.exit(1)

    # 2. Ensure Emulator is ready
    wait_for_emulator(CREDS_PATH)

    # 3. Determine the S3 Key
    # If no key is provided, use the base name of the file (e.g., "image.png")
    s3_key = args.key if args.key else os.path.basename(args.file_path)

    # 4. Initialize S3 Client
    try:
        s3 = boto3.client(
            's3',
            endpoint_url=ENDPOINT_URL,
            region_name="us-east-1",
            verify=CA_PATH
        )

        # 5. Create bucket if it doesn't exist
        try:
            s3.create_bucket(Bucket=args.bucket)
            print(f"Created bucket: {args.bucket}")
        except ClientError as e:
            if e.response['Error']['Code'] != 'BucketAlreadyOwnedByYou':
                raise e

        # 6. Perform Upload
        print(f"Uploading {args.file_path} to s3://{args.bucket}/{s3_key}...")
        s3.upload_file(args.file_path, args.bucket, s3_key)
        print("Upload successful!")

    except Exception as e:
        print(f"Upload failed: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

