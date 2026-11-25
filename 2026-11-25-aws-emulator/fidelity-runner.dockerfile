FROM ghcr.io/astral-sh/uv:python3.15-trixie

# Clone the repository into the /app directory
RUN git clone https://github.com/aws/aws-emulator-evaluation-suite.git /app

WORKDIR /app
RUN git log -1

# Install the runner and all dependencies
RUN uv sync --frozen --extra checks

# Copy and prepare the entrypoint script
COPY fidelity-runner.sh /app/fidelity-runner.sh
RUN chmod +x /app/fidelity-runner.sh

# Use the script as the entrypoint
ENTRYPOINT ["/app/fidelity-runner.sh"]
