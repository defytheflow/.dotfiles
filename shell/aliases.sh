#!/usr/bin/sh

# ------------------------------------------------------------------------------
# | File:      aliases.sh
# ------------------------------------------------------------------------------
# | Modified:  March 23, 2020
# ------------------------------------------------------------------------------
# | Author:    Artyom Danilov
# ------------------------------------------------------------------------------

echo "Running ${0}"

# ------------------------------------------------------------------------------
#                                    Colors
# ------------------------------------------------------------------------------

alias \
    ls='ls --color=never'      \
    dir='dir --color=auto'     \
    diff='diff --color=auto'   \
    vdir='vdir --color=auto'   \
    grep='grep --color=auto'   \
    fgrep='fgrep --color=auto' \
    egrep='egrep --color=auto'

# ------------------------------------------------------------------------------
#                                   Improved
# ------------------------------------------------------------------------------

alias \
    cp='cp --interactive --verbose'                      \
    du='du --human-readable'                             \
    ls='ls -vh --classify --group-directories-first'     \
    mv='mv --interactive --verbose'                      \
    rm='rm --interactive=once --preserve-root --verbose' \
    mkdir='mkdir --parents --verbose'                    \
    rmdir='rmdir --parents --verbose'                    \
    diff='diff --side-by-side --suppress-common-lines'   \
    tree='tree -I .git'

# ------------------------------------------------------------------------------
#                                   Mistakes
# ------------------------------------------------------------------------------

alias \
    cd..='cd ..' \
    cd-=' cd -'  \
    cd~=' cd ~'  \
    CD='  cd'    \
    LS=ls

# ------------------------------------------------------------------------------
#                                   Options
# ------------------------------------------------------------------------------

alias l='  ls -1'               # list vertically
alias la=' ls --almost-all'     # list all
alias lh=' ls --directory .*'   # list hidden
alias ll=' ls -l'               # list long
alias lr=' ls --recursive'      # list recursively
alias lal='ls -l --almost-all'  # list all long

alias \
    ccat='highlight --out-format=ansi' \
    lcat='lolcat'                      \
    ncat='cat --number'                \
    tcat="cat --show-tabs"

# ------------------------------------------------------------------------------
#                                Right Version
# ------------------------------------------------------------------------------

alias \
    pip='pip3'       \
    pylint='pylint3' \
    python='python3'

# ------------------------------------------------------------------------------
#                                  Shortcuts
# ------------------------------------------------------------------------------

# One-letter.
alias \
    c='cat'     \
    f='file'    \
    g='git'     \
    h='history' \
    p='pwd'     \
    s='source'  \
    t='tree'    \
    v='vim'

# Two-letter.
alias \
    gh='history | grep' \
    py='python3'        \
    sc='shellcheck'     \
    tc='touch'          \
    vi='vim'            \
    ..='cd ..'


# Three-letter.
alias \
    clr='clear'   \
    mkd='mkdir'   \
    rmd='rmdir'   \
    shu='shunit2' \
    ...='cd ../../'

# Other.
alias \
    ....=' cd ../../../'    \
    .....='cd ../../../../' \
    chrome='google-chrome'

# ------------------------------------------------------------------------------
#                                     sudo
# ------------------------------------------------------------------------------

alias \
    scp='sudo cp'       \
    smv='sudo mv'       \
    srm='sudo rm'       \
    svim='sudo vim'     \
    smkdir='sudo mkdir' \
    srmdir='sudo rmdir' \
    reboot='sudo reboot'     \
    shutdown='sudo shutdown'

# ------------------------------------------------------------------------------
#                                 New Commands
# ------------------------------------------------------------------------------

# Print the current time.
alias now='date +\"%T\"'
# List every dir in the PATH on a separate line. (TODO malfunctions on WSL)
alias path='echo ${PATH} | sed -e "s/:/\n/g"'
# Watch starwars in terminal.
alias starwars='telnet towel.blinkenlights.nl'
# Fast way to update packages.
alias update='sudo apt-get update;sudo apt-get upgrade;sudo apt-get autoremove'
# Get weather report.
alias weather='curl http://wttr.in/'
# Open application store.
alias store='ubuntu-software'

# ------------------------------------------------------------------------------
#                             Windows Command Line
# ------------------------------------------------------------------------------

alias \
    edit='vim'  \
    del='rm'    \
    cls='clear' \
    copy='cp'   \
    move='mv'   \
    rename='mv'
