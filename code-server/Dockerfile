# Use a clean, long-term support Ubuntu image
FROM ubuntu:24.04

# Install basic development utilities
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Download and install code-server
# RUN curl -fsSL https://code-server.dev | sh

COPY code-server/install.sh .
RUN sh install.sh

# Create a non-root developer user for security
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER developer
WORKDIR /home/developer/workspace

# Expose the web editor port
EXPOSE 8080

# Start VS Code server (No password auth for local testing)
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]


