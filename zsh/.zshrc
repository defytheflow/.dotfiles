#!/bin/zsh

# File:     .zshrc
# Created:  22.03.2020
# Author:   Artyom Danilov (@defytheflow)

ZSH_CACHE="${XDG_CACHE_HOME}/zsh"

# Plugins {{{
# ------------------------------------------------------------------------------
[ -d "${ZPLUG_HOME}" ] || git clone https://github.com/zplug/zplug "${ZPLUG_HOME}"
source "${ZPLUG_HOME}/init.zsh"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'plugins/command-not-found', from:oh-my-zsh

zplug check || zplug install
zplug load
#}}}

# History {{{
# ------------------------------------------------------------------------------
export HISTFILE="${ZSH_CACHE}/history"
export HISTSIZE=10000
export SAVEHIST=10000
#}}}

# Options {{{
# ------------------------------------------------------------------------------
setopt autocd autopushd # don't type cd.
setopt interactive_comments # allow comments in interactive shells.
setopt menu_complete # auto-insert first possible completion.
setopt share_history # share history across shells.

# ls directory after cd.
chpwd() {
  emulate -L zsh
  ls -vh --color=auto --group-directories-first
}
#}}}

# Completion {{{
# ------------------------------------------------------------------------------
autoload -U compinit
compinit -d "${ZSH_CACHE}/zcompdump-${ZSH_VERSION}"

# Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors ''

# Enable keyboard navigation of completions in menu.
zstyle ':completion:*' menu select

# Accept case-insensitivity, abbreviations after . or _ or -, substrings.
zstyle ':completion:*' matcher-list '' \
  'm:{a-zA-Z}={A-Za-z}' '+m:{_-}={-_}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Categorize completion suggestions with headings.
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %F{default}%B%--- %d ---%b%f
#}}}

# Cursor {{{
# ------------------------------------------------------------------------------
# Change cursor shape in different modes.
zle-keymap-select() {
  if [ $KEYMAP = vicmd ] || [ $1 = 'block' ]; then
    echo -ne '\e[1 q'
  elif [ $KEYMAP = main ] || [ $KEYMAP = viins ] || [ $KEYMAP = '' ] || [ $1 = 'beam' ]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
  zle -K viins
  echo -ne '\e[5 q'
}
zle -N zle-line-init
#}}}

# Binds {{{
# ------------------------------------------------------------------------------
# vi mode.
bindkey -v
bindkey -v '^?' backward-delete-char # use backspace after vi-mode.
export KEYTIMEOUT=1 # faster enter normal mode.

# Menu completion navigaton with hjkl.
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# ci", ci', ci`, di", etc.
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc.
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

# History editing with <Ctrl-r>.
bindkey '^R' history-incremental-pattern-search-backward

# Line editing in vim with <Ctrl-v>.
autoload edit-command-line && zle -N edit-command-line && bindkey '^v' edit-command-line
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Background things and unbackground them with <Ctrl-z>.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg
#}}}

# Other {{{
# ------------------------------------------------------------------------------
for file in "${DOTFILES_HOME}"/shell/*; do . "${file}"; done
eval "$(starship init zsh)"
#}}}
