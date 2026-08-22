# ========== Custom Keybindings ==========

# Ctrl+F: fuzzy find files and open in editor
_fzf_edit_widget() {
  local file

  file=$(
    fd --type f \
      --hidden \
      --follow \
      --exclude .git \
      2>/dev/null |
      fzf \
        --height 40% \
        --reverse \
        --preview 'bat --color=always --line-range :50 {} 2>/dev/null || command cat {}'
  )

  if [[ -n "$file" ]]; then
    BUFFER="${EDITOR:-vim} $file"
    zle accept-line
  fi

  zle redisplay
}

zle -N _fzf_edit_widget
bindkey '^F' _fzf_edit_widget
