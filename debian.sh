#!/bin/sh

# File:         debian.sh
# Created:      26.03.2020
# Author:       Artyom Danilov (@defytheflow)
# Description:  Installation functions for debian-based distros.

update_system() {
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
}

install_packages() {
  log 'Installing debian packages.'

  install_debian_package() {
    log "Checking that $(color "${1}") exists."

    if ! sudo dpkg -l "${1}" >/dev/null 2>&1 &&
      sudo dpkg -S "${1}" >/dev/null 2>&1; then
      sudo apt-get install -y "${1}"
    fi
  }

  install_alacritty() {
    log "Checking that $(color 'alacritty') exists."

    if ! command -v alacritty >/dev/null; then
      link='https://github.com/alacritty/alacritty/releases/download/v0.4.3'
      deb='Alacritty-v0.4.3-ubuntu_18_04_amd64.deb'
      wget "${link}/${deb}" && sudo dpkg -i "${deb}" && rm "${deb}"
      sudo update-alternatives \
        --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 50
    fi
  }

  install_bat() {
    log "Checking that $(color 'bat') exists."

    if ! command -v bat >/dev/null; then
      log 'Installing bat.'
      link='https://github.com/sharkdp/bat/releases/download/v0.15.4'
      deb='bat_0.15.4_amd64.deb'
      wget "${link}/${deb}" && sudo dpkg -i "${deb}" && rm "${deb}"
    fi
  }

  install_neovim() {
    log "Checking that $(color 'neovim') exists."

    if ! command -v nvim >/dev/null; then
      sudo add-apt-repository -y ppa:neovim-ppa/stable
      sudo apt-get update
      sudo apt-get install -y neovim python3-neovim
      sudo pip3 install pynvim
    fi
  }

  install_zsh() {
    log "Checking that $(color 'zsh') exists."

    if ! command -v zsh >/dev/null; then
      sudo apt-get install -y zsh fonts-powerline
      sudo chsh -s "$(command -v zsh)"
      compaudit | xargs chown -R "$(whoami)" # insecure directories bug.
      compaudit | xargs chmod go-w
    fi
  }

  [ -z "${WSL_DISTRO_NAME}" ] && install_alacritty
  install_bat
  install_neovim
  install_zsh

  for package in \
    'clang' \
    'gdb' \
    'jq' \
    'mlocate' \
    'nitrogen' \
    'npm' \
    'python3-pip' \
    'shellcheck' \
    'tmux' \
    'tree' \
    'valgrind' \
    'xclip'; do
    install_debian_package "${package}"
  done
}