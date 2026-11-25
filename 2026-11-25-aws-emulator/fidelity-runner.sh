#!/bin/bash
set -e

# $1 is the test script path (e.g., behavioral/dynamodb/...)
TEST_SCRIPT=$1

if [ -z "$TEST_SCRIPT" ]; then
  echo "Error: No test script provided."
  exit 1
fi

# Construct the command using environment variables from fidelity-runner.yml
exec uv run fidelity-tests-runner run "$TEST_SCRIPT" \
    --endpoint "$AWS_ENDPOINT_URL" \
    --emulator-home "$HOME/.aws/emulator" \
    --credentials-file "$AWS_SHARED_CREDENTIALS_FILE" \
    --ca-bundle "$HOME/.aws/emulator/9297/ca.pem" \
    --report -

