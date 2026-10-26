#!/bin/bash
set -euo pipefail

root="$(cd "$(dirname "$0")" && pwd)"
config="${XDG_CONFIG_HOME:-$HOME/.config}"

mkdir -p "$config"
ln -sfn "$root/nvim" "$config/nvim"
ln -sfn "$root/wezterm" "$config/wezterm"
ln -sfn "$root/starship.toml" "$config/starship.toml"
