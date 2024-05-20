#!/bin/bash

# Ensure the .ssh directory exists with the appropriate permissions
mkdir -p /root/.ssh
chmod 0700 /root/.ssh

# Pull SSH key from environment variable
echo "${SSH_KEY}" > /root/.ssh/id_rsa
chmod 0600 /root/.ssh/id_rsa

# Run the original entrypoint command
exec gptscript --default-model gpt-4o /tool.gpt
