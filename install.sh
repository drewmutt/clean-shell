#!/usr/bin/env bash
# Installs the af-magic-simple oh-my-zsh theme and sets it as ZSH_THEME in ~/.zshrc.
set -euo pipefail

ZSH_DIR="${ZSH:-$HOME/.oh-my-zsh}"
if [[ ! -d "$ZSH_DIR" ]]; then
  echo "oh-my-zsh not found. Install it first: https://ohmyz.sh" >&2
  exit 1
fi

THEMES="${ZSH_CUSTOM:-$ZSH_DIR/custom}/themes"
mkdir -p "$THEMES"
curl -fsSL https://raw.githubusercontent.com/drewmutt/af-magic-simple/main/af-magic-simple.zsh-theme \
  -o "$THEMES/af-magic-simple.zsh-theme"
echo "Installed theme to $THEMES/af-magic-simple.zsh-theme"

RC="$HOME/.zshrc"
if grep -q '^ZSH_THEME=' "$RC" 2>/dev/null; then
  cp "$RC" "$RC.bak"
  sed -i.tmp 's/^ZSH_THEME=.*/ZSH_THEME="af-magic-simple"/' "$RC" && rm -f "$RC.tmp"
  echo "Set ZSH_THEME=\"af-magic-simple\" in $RC (backup: $RC.bak)"
else
  echo "Add ZSH_THEME=\"af-magic-simple\" to $RC before the 'source \$ZSH/oh-my-zsh.sh' line."
fi
echo "Open a new terminal (or run: exec zsh) to see it."
