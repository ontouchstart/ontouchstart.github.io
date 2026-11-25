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
    parser = argparse.ArgumentParser(description="List all S3 buckets in the AWS Emulator.")
    # We don't need many arguments for this, but we keep the structure consistent
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

        # 3. List Buckets
        print(f"Fetching buckets from {ENDPOINT_URL}...")
        response = s3.list_buckets()

        buckets = [b['Name'] for b in response.get('Buckets', [])]

        if not buckets:
            print("No buckets found in the emulator.")
        else:
            print(f"Found {len(buckets)} bucket(s):")
            for bucket in buckets:
                print(f" - {bucket}")

    except ClientError as e:
        print(f"Client Error: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
