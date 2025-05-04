#!/bin/bash
set -e
REMOTE_USER="root"
REMOTE_HOST="159.65.158.178"
REMOTE_PASSWORD="yu2iu9s00XWaMnf"


echo "[+] Uploading build folder to remote server..."
sshpass -p "$REMOTE_PASSWORD" rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no" ./.next/ "$REMOTE_USER@$REMOTE_HOST:/root/Target-board_vlogs/.next/"

exit 0
