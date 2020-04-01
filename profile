#!/bin/sh

# File:      .profile
# Purpose:   Define environment variables, that will be used by other programs
#            and shell startup files.
# Use:       This file is sourced by your shell every time you login into system
#            (when you type your login and password at the lock screen).
# Created:   28.03.2020
# Modified:  30.03.2020
# Author:    Artyom Danilov


# XDG Base Directory
# ------------------------------------------------------------------------------
export XDG_CACHE_HOME="${HOME}"/.cache       # <-- user cache files
export XDG_CONFIG_HOME="${HOME}"/.config     # <-- user config files
export XDG_DATA_HOME="${HOME}"/.local/share  # <-- user data files

# To use gnome-control-senter in i3 session.
export XDG_CURRENT_DESKTOP=GNOME

# Dotfiles
# ------------------------------------------------------------------------------
export DOTFILES_HOME="${HOME}"/.dotfiles      # <-- dotfiles

# Default programs.
# ------------------------------------------------------------------------------
export EDITOR='nvim'
export BROWSER='google-chrome'

# Path extensions.
# ------------------------------------------------------------------------------
export PATH="${PATH}":"${HOME}"/.local/bin  # <-- Add '~/.local/bin'
export CPATH=''                             # <-- C headers
export LD_LIBRARY_PATH=''                   # <-- C libraries
export PYTHONPATH="${HOME}"/.lib            # <-- Python modules

# Options/Flags
# ------------------------------------------------------------------------------
export CFLAGS='-W -Wall -Wextra'    # <-- C
export SHELLCHECK_OPTS=''           # <-- shellcheck
export PYTHONSTARTUP="${PYTHONRC}"  # <-- python

# Config files
# ------------------------------------------------------------------------------
export BASHRC="${HOME}"/.bashrc                       # <-- bash
export ZSHRC="${HOME}"/.zshrc                         # <-- zsh
export VIMRC="${XDG_CONFIG_HOME}"/nvim/init.vim       # <-- nvim
export PYTHONRC="${XDG_CONFIG_HOME}"/python/pythonrc  # <-- python
export I3CONF="${XDG_CONFIG_HOME}"/i3/config          # <-- i3
export GITCONF="${XDG_CONFIG_HOME}"/git/config        # <-- git
export TASKRC="${XDG_CONFIG_HOME}"/task/taskrc        # <-- task
export ZPLUG_HOME="${XDG_CONFIG_HOME}"/zplug          # <-- zplug

# Cache/Data files
# ------------------------------------------------------------------------------
export LESSHISTFILE="${XDG_CACHE_HOME}"/less/history  # <-- less
export ICEAUTHORITY="${XDG_CACHE_HOME}"/ICEauthority  # <-- (?)
export TASKDATA="${XDG_DATA_HOME}"/task               # <-- task
export ZPLUG_CACHE_DIR="${XDG_CACHE_HOME}"/zplug      # <-- zplug
export PYLINTHOME="${XSD_CACHE_HOME}"/pylint          # <-- pylint

# User.
# ------------------------------------------------------------------------------
export MYGITHUB='https://github.com/defytheflow'      # <-- github

# WSL
# ------------------------------------------------------------------------------
if [ -n "${WSL_DISTRO_NAME}" ]; then
    # Windows user name.
    export WIN_USER="$(powershell.exe '$env:UserName' | sed -e 's/\r//g')"
    WIN_HOME="$(wslpath "$(cmd.exe /C 'echo | set /p _=%USERPROFILE%' 2>/dev/null)")"
    export WIN_HOME                       # <-- windows home directory
    export WIN_DESK="${WIN_HOME}"/Desktop  # <-- windows desktop directory
    export WIN_PROG_FILES="/mnt/c/Program Files"
    export WIN_PROG_FILES_86="/mnt/c/Program Files (x86)"
fi
