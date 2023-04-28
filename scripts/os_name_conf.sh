#!/bin/sh

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch 4 All"
DISTRIB_RELEASE="11.3-systemd"
DISTRIB_CODENAME="LFS4All"
DISTRIB_DESCRIPTION="Linux From Scratch 4 All"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch 4 All"
VERSION="11.3-systemd"
ID=lfs4all
PRETTY_NAME="Linux From Scratch 4 All 11.3-systemd"
VERSION_CODENAME="LFS4All"
EOF

export GRUB_DISTRIBUTOR='LFS4All Linux'
