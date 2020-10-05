#!/bin/sh

# File:     utils.sh
# Created:  12.09.2020
# Author:   Artyom Danilov (@defytheflow)

log() {
  echo "install: ${*}"
}

color() {
  echo "$(tput setaf 26)${1}$(tput setaf 15)"
}

symlink() {
  ln -sfvn "${DOTFILES_HOME}/${1}" "${2}"
}

makedir() {
  mkdir -vp "${1}"
}
