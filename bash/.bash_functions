#!/bin/bash

echo 'Running .bash_functions'

# ---------------------------------------------------------------------------- 
#                  __                  _   _
#                 / _|_   _ _ __   ___| |_(_) ___  _ __  ___
#                | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
#                |  _| |_| | | | | (__| |_| | (_) | | | \__ \
#                |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#
# ---------------------------------------------------------------------------- 
#  File: .bash_functions
# ---------------------------------------------------------------------------- 
#  Modified: March 17, 2020
# ---------------------------------------------------------------------------- 
#  Author: Artyom Danilov
# ---------------------------------------------------------------------------- 

# Export following variables and functions.
set -a

# Print first passed argument to the center of the terminal.
function echoc() {
    local text=$1
    local width=$(stty size | cut -d ' ' -f2)
    local length=${#text}
    printf "%$(( length + (width - length) / 2 ))b\n" "${text}"
}

# Print all passed arguments to stderr.
function err() {
    echo "$*" >&2
}

# Return 0 if $1 (directory) is empty.
function isempty() {
    local dir=$1
    return $([[ "$(find "${dir}" -type f | wc -l)" -eq 0 ]])
}

# Create a $1 (directory) and cd into it.
function mkcd() {
    local dir=$1
    mkdir -p "${dir}" && cd "${dir}" || return
}

# Set all passed arguments as terminal title.
function termtitle() {
    echo -ne "\033]0;$*\007"
}

# Return number of files in $1 (directory).
function filenum()
{
    local dir=$1
    if [[ $# -gt 0 ]]; then
        find "${dir}" -maxdepth 1 -type f | wc -l
    else
        find "."      -maxdepth 1 -type f | wc -l
    fi
}

# Return number of directories in $1 (directory).
function dirnum()
{
    local dir=$1
    if [[ $# -gt 0 ]]; then
        find "${dir}" -maxdepth 1 -type d | wc -l
    else
        find "."      -maxdepth 1 -type d | wc -l
    fi
}

# Don't export following variables and functions.
set +a
