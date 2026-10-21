# clean-shell.zsh-theme
# Based on af-magic, with the dashed separator replaced by a blank line,
# git info removed, and the right-side user@host removed.

PS1="
${FG[032]}%~ ${FG[105]}%(!.#.»)%{$reset_color%} "
PS2="%{$fg[red]%}\ %{$reset_color%}"
