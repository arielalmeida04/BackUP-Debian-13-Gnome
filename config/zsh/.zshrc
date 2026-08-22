# ============================================================
# Zsh configuration
# Debian Bootstrap
# ============================================================

# ---------- Oh My Zsh ----------

# ---------- Dotfiles ----------
# ---------- Dotfiles ----------

export DOTFILES_DIR="$HOME/debian-bootstrap"

DOTFILES_ZSH="$DOTFILES_DIR/config/zsh"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  sudo
  extract
  copypath
  copyfile
  docker
  docker-compose
  aliases
  web-search
)

source "$ZSH/oh-my-zsh.sh"


# ---------- PATH ----------

export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"


# ---------- Editor ----------

export EDITOR="zed --wait"
export VISUAL="zed --wait"


# ---------- Git ----------

export GIT_PAGER="delta"


# ---------- Dotfiles ----------

export DOTFILES_DIR="$HOME/debian-bootstrap"

DOTFILES_ZSH="$DOTFILES_DIR/config/zsh"

[[ -f "$DOTFILES_ZSH/aliases.zsh" ]] &&
  source "$DOTFILES_ZSH/aliases.zsh"

[[ -f "$DOTFILES_ZSH/functions.zsh" ]] &&
  source "$DOTFILES_ZSH/functions.zsh"

[[ -f "$DOTFILES_ZSH/keybindings.zsh" ]] &&
  source "$DOTFILES_ZSH/keybindings.zsh"


# ---------- Zoxide ----------

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi


# ---------- The Fuck ----------

if command -v thefuck &>/dev/null; then
  eval "$(thefuck --alias)"
fi


# ---------- FZF ----------

if command -v fzf &>/dev/null; then

  export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --info=inline"

  export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

  export FZF_CTRL_T_COMMAND="fd . / \
    --type f \
    --hidden \
    --follow \
    --exclude .git \
    --exclude node_modules \
    --exclude .cache \
    --exclude /proc \
    --exclude /sys \
    --exclude /dev \
    2>/dev/null"

fi


# ---------- Powerlevel10k ----------

[[ -f "$DOTFILES_ZSH/.p10k.zsh" ]] &&
  source "$DOTFILES_ZSH/.p10k.zsh"
