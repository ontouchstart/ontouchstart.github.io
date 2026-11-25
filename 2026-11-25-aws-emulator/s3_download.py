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
    parser = argparse.ArgumentParser(description="Download a file from the AWS Emulator S3.")
    parser.add_argument("--bucket", required=True, help="The name of the S3 bucket")
    parser.add_argument("--key", required=True, help="The name of the file in S3 (the key)")
    parser.add_argument("--dest", required=True, help="The local path to save the file (e.g., ./downloads/file.txt)")

    args = parser.parse_args()

    # 1. Ensure local directory exists
    # If the user provides a path like "./downloads/file.txt", 
    # we make sure "./downloads/" actually exists first.
    local_dir = os.path.dirname(os.path.abspath(args.dest))
    if local_dir and not os.path.exists(local_dir):
        os.makedirs(local_dir)
        print(f"Created directory: {local_dir}")

    # 2. Ensure Emulator is ready
    wait_for_emulator(CREDS_PATH)

    # 3. Initialize S3 Client
    try:
        s3 = boto3.client(
            's3',
            endpoint_url=ENDPOINT_URL,
            region_name="us-east-1",
            verify=CA_PATH
        )

        # 4. Perform Download
        print(f"Downloading s3://{args.bucket}/{args.key} to {args.dest}...")
        s3.download_file(args.bucket, args.key, args.dest)
        print("Download successful!")

    except ClientError as e:
        if e.response['Error']['Code'] == "404":
            print(f"Error: The object '{args.key}' was not found in bucket '{args.bucket}'.")
        else:
            print(f"Client Error: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
