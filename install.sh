#!/bin/bash
set -euo pipefail

root="$(cd "$(dirname "$0")" && pwd)"
config="${XDG_CONFIG_HOME:-$HOME/.config}"

link() {
  local target="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "$dest.bak"
    echo "backed up $dest to $dest.bak"
  fi
  ln -sfn "$target" "$dest"
}

link "$root/nvim" "$config/nvim"
link "$root/wezterm" "$config/wezterm"
link "$root/starship.toml" "$config/starship.toml"
