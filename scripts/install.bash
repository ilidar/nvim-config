#!/usr/bin/env bash

set -e

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR_PATH=$(dirname "$SCRIPT_PATH")
REPO_DIR_PATH=$(realpath "$SCRIPT_DIR_PATH/..")

delete_existing_link()
{
    if [ -L ${1} ] ; then
        if [ -e ${1} ] ; then
            rm $1
        fi
    fi
}

DOTFILE_PATH="$REPO_DIR_PATH/config/nvim"
DOTFILE_LINK_PATH="$HOME/.config/nvim"

echo "Linking dir $DOTFILE_PATH to $DOTFILE_LINK_PATH"

mkdir -p $DOTFILE_LINK_PATH
delete_existing_link $DOTFILE_LINK_PATH

ln -s -f "$DOTFILE_PATH" "$DOTFILE_LINK_PATH"
