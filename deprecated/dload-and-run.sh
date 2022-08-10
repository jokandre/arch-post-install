#!/bin/bash
set -e
printf "\n\\033[1;36mJokadre's\\033[33m Arch Post Install\\033[;1m Download Script\\033[m\n"
export DLPI_DIR=/var/tmp/jokandre-linux-post-install

printf "\n\\033[1m Clearing...\\033[m\n"
rm -vrf "$DLPI_DIR"

printf "\n\\033[1m Downloading...\\033[m\n"
mkdir -pv "$DLPI_DIR"
cd "$DLPI_DIR"
curl -L https://github.com/jokandre/arch-post-install/archive/master.zip -o master.zip

printf "\n\\033[1m Uncompressing...\\033[m\n"
unzip master.zip

printf "\n\\033[1m Relocating...\\033[m\n"
mv -v arch-post-install-master/* .
rm -vrf arch-post-install-master

printf "\n\\033[1m Running...\\033[m\n"
bash main.sh
