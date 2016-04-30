#!/bin/bash

# Characters for yes/no marks
CHAR_YES="\\033[1;32m✔\\033[m"
CHAR_NO="\\033[1;31m✘\\033[m"

# Current step
STEP=1

# Print a message detailing the step being taken
function step() {
  printf "\\033[1;32m [%d] \\033[;1m" "$STEP"
  if [ $# -gt 0 ]; then
    printf "$@"
  fi
  printf "\\033[m\n"
  let STEP++
}

# Print a message indicating current actions
function msg() {
  printf "\\033[1;34m   --> \\033[;1m"
  printf "$@"
  printf "\\033[m\n"
}

# Prints the input packages that are not installed (as reported by pacman)
function uninst-pkgs() {
  for pkg in "$@"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
      echo "$pkg"
    fi
  done
}


# === MAIN SCRIPT === #
cd "$(dirname "$(readlink -f "$0")")"
unalias cp 2>/dev/null

SESSIONDIR="$(pwd)/.session"
mkdir -p "$SESSIONDIR"

printf "\n\\033[;1m  Welcome to \\033[;1;36mJokandre's\\033[;1;33m Arch Post Install\\033[;1m Script\\033[m\n\n"
printf " This script is designed for a clean installation of \\033[1;32mManjaro \\033[33mXFCE \\033[35m0.8.9\\033[m.\n"
printf " We'll run a few tests to check compatibility.\n\n"

# Check for pacman
printf "  Check if \\033[1mpacman\\033[m is installed ... "
type pacman &>/dev/null \
  && printf "$CHAR_YES\n" \
  || { printf "$CHAR_NO\n"; exit 1; }

# Check for sudo
printf "  Check if \\033[1msudo\\033[m is installed ..... "
type sudo &>/dev/null \
  && printf "$CHAR_YES\n" \
  || { printf "$CHAR_NO\n"; exit 1; }

if [ -t 0 ]; then
  printf "\n Next, you will select which customization steps to run.\n"
  printf " Use \\033[1;32my\\033[m or \\033[1;31mn\\033[m to make the decision.\n"
else
  printf "\n \\033[1;33mWarning: \\033[mScript running without terminal-attached STDIN.\n"
  printf "\n All options will be selected according to the defaults.\n"
fi

STEPSFILE="$SESSIONDIR/steps"
rm -f "$STEPSFILE"
touch "$STEPSFILE"

for step in steps/*; do
  # Default configuration function
  configure () { true; }

  # Get the step
  source "$step"

  # Print its name and description
  printf "\n\n\\033[;1m $name\\033[m\n $description\n"

  REPLY=
  while [ -z "$REPLY" ]; do
    printf " \\033[1m>\\033[m "
    [ -t 0 ] && read -n 1 -s REPLY || REPLY=y
    case "$REPLY" in
      y) printf "\b\b$CHAR_YES \\033[1;32myes\\033[m\\033[K\n"
         echo "$step" >>"$STEPSFILE"
         configure
      ;;

      n) printf "\b\b$CHAR_NO \\033[1;31mno\\033[m\\033[K\n" ;;

      *) printf "   press \\033[1my\\033[m or \\033[1mn\\033[m\r"
         REPLY=
      ;;
    esac
  done
done

for step in $(cat "$STEPSFILE"); do
  source "$step"
  echo "$name"
  execute
done
