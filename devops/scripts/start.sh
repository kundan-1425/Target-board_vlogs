#!/bin/bash

REMOTE_USER="root"
REMOTE_HOST="159.65.158.178"
REMOTE_PASSWORD="yu2iu9s00XWaMnf"

sshpass -p "$REMOTE_PASSWORD" ssh -tt -o StrictHostKeyChecking=no -o LogLevel=ERROR "$REMOTE_USER@$REMOTE_HOST" << EOF
  set -e
  echo "[+] Loading NVM environment..."
  export NVM_DIR="/root/.nvm"
  [ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"

  echo "[+] Navigating to project directory..."
  cd /root/Target-board_vlogs

  git pull
	
  npm install

  echo "[+] Restarting PM2 process 'frontend'..."
  pm2 restart frontend
  
  exit 0
EOF
