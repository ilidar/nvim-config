#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR_PATH="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_DIR_PATH="$(dirname -- "$SCRIPT_DIR_PATH")"

DOTFILE_PATH="$REPO_DIR_PATH/config/nvim"
DOTFILE_LINK_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

mkdir -p -- "$(dirname -- "$DOTFILE_LINK_PATH")"

if [[ -L "$DOTFILE_LINK_PATH" ]]; then
    rm -- "$DOTFILE_LINK_PATH"
elif [[ -e "$DOTFILE_LINK_PATH" ]]; then
    printf 'Refusing to replace existing path: %s\n' "$DOTFILE_LINK_PATH" >&2
    exit 1
fi

ln -s -- "$DOTFILE_PATH" "$DOTFILE_LINK_PATH"
printf 'Linked %s -> %s\n' "$DOTFILE_LINK_PATH" "$DOTFILE_PATH"
