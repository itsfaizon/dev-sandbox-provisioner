#!/bin/bash

# 1. Variables: These take the info you type after the command
GUEST_NAME=$1
PORT=$2

# 2. Safety Check: If you forget to provide a name or port, it stops.
if [ -z "$GUEST_NAME" ] || [ -z "$PORT" ]; then
    echo "Usage: ./project-jail.sh [name] [port]"
    exit 1
fi

# 3. Provisioning: Create a folder on your VPS for this specific guest.
mkdir -p ~/guest_labs/$GUEST_NAME

# 4. The Jail: Start the Docker container
docker run -d \
  --name "$GUEST_NAME-container" \
  -p $PORT:8443 \
  -v /home/$USER/guest_labs/$GUEST_NAME:/home/coder/project \
  -e PASSWORD="password123" \
  codercom/code-server:latest

echo "Success! $GUEST_NAME is jailed on port $PORT."
