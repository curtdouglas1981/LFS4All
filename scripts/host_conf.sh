#!/bin/sh

echo "lfs_linux" > /etc/hostname

cat > /etc/hosts << "EOF"
127.0.0.1 localhost
::1 localhost
127.0.1.1 lfs_linux.localdomain lfs_linux
EOF
