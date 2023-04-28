#!/bin/bash
#
while read -r line
do
pacman --noconfirm -S $line
done < packages.txt
