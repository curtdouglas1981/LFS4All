#!/bin/sh

cat > /etc/locale.conf << "EOF"
LONG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
EOF
