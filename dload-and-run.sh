#!/bin/bash
set -e
printf "\n\\033[1;36mDarkhogg's\\033[33m Linux Post Install\\033[;1m Download Script\\033[m\n"
export DLPI_DIR=/var/tmp/darkhogg-linux-post-install

printf "\n\\033[1m Clearing...\\033[m\n"
rm -vrf "$DLPI_DIR"

printf "\n\\033[1m Downloading...\\033[m\n"
mkdir -pv "$DLPI_DIR"
cd "$DLPI_DIR"
curl -L https://github.com/Darkhogg/linux-post-install/archive/master.zip -o master.zip

printf "\n\\033[1m Uncompressing...\\033[m\n"
unzip master.zip

printf "\n\\033[1m Relocating...\\033[m\n"
mv -v linux-post-install-master/* .
rm -vrf linux-post-install-master

printf "\n\\033[1m Running...\\033[m\n"
bash main.sh