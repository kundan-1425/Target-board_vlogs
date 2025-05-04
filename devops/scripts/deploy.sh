#!/bin/bash

# SSH details
REMOTE_USER="root"
REMOTE_HOST="159.65.158.178"
REMOTE_PASSWORD="yu2iu9s00XWaMnf"
CODE_LOCATION="/root/Target-board_vlogs"

# SSH into the remote machine and execute commands
sshpass -p "$REMOTE_PASSWORD" ssh -tt -o StrictHostKeyChecking=no -o LogLevel=ERROR "$REMOTE_USER@$REMOTE_HOST" << 'EOF'
  set -e  # Exit on any error

  # Load NVM environment for the root user
  export NVM_DIR="/root/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

  # Change to the code directory
  cd /root/Target-board_vlogs

  # Pull the latest code
  git pull

  # Install dependencies
  npm install

  # build the project
  npm run build

  # Restart the backend using pm2
  pm2 restart backend
EOF

