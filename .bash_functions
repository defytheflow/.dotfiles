# Author: Artyom Danilov
# Last modification date: January 27, 2020.

# Hides a file
function hide() {
    for file in $@; do
        if [[ ${file::1} != . ]]; then
            mv $file .$file
        fi
    done
}
export -f hide

# Shows a hidden file
function show() {
    for file in $@; do
        if [[ ${file::1} == . ]]; then
            mv $file ${file/./}
        fi
    done
}
export -f show

# Prints to the 'stderr'
function echoerr() {
    printf "%s\n" "$*" 1>&2
}
export -f echoerr

# To check if input is an agreement
function isyes() {
    if [[ "$1" =~ ^[yY][eE]?[sS]?$ ]]; then
        return 0
    else
        return 1
    fi
}
export -f isyes

# To check if input is an unsigned integer
function isuint() {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}
export -f isuint

# To get number of files in directory
function filenum() {
    echo $(ls -1 $1 | wc -l)
}
export -f filenum

# To check if a directory is empty
function isempty() {
    if [[ $(ls -1 $1 | wc -l) -eq 0 ]]; then
        return 0
    else
        return 1
    fi
}
export -f isempty
