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
    parser = argparse.ArgumentParser(description="List all keys (files) in a specific S3 bucket.")
    parser.add_argument("--bucket", required=True, help="The name of the S3 bucket")
    parser.add_argument("--prefix", default="", help="Optional prefix to filter results (e.g., 'images/')")

    args = parser.parse_args()

    # 1. Ensure Emulator is ready
    wait_for_emulator(CREDS_PATH)

    # 2. Initialize S3 Client
    try:
        s3 = boto3.client(
            's3',
            endpoint_url=ENDPOINT_URL,
            region_name="us-east-1",
            verify=CA_PATH
        )

        # 3. List Objects
        print(f"Listing objects in s3://{args.bucket} (Prefix: '{args.prefix}')...")
        
        # Using a paginator is best practice in case there are more than 1000 files
        paginator = s3.get_paginator('list_objects_v2')
        pages = paginator.paginate(Bucket=args.bucket, Prefix=args.prefix)

        count = 0
        for page in pages:
            if 'Contents' in page:
                for obj in page['Contents']:
                    print(f" - {obj['Key']} ({obj['Size']} bytes)")
                    count += 1
            else:
                print("No objects found.")
                break
        
        if count == 0:
            print("Bucket is empty.")
        else:
            print(f"\nTotal objects found: {count}")

    except ClientError as e:
        if e.response['Error']['Code'] == "404":
            print(f"Error: Bucket '{args.bucket}' not found.")
        else:
            print(f"Client Error: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
