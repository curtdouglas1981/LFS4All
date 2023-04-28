#!/bin/sh

cat > /etc/adjtime << "EOF"
0.0.0.0.0
0
LOCAL
EOF

timedatectl set_local-rtc 1

timedatectl list-timezones

echo 'run the command timedatectl set-timezone <your time zone>'
timedatectl set-timezone America/New_York
