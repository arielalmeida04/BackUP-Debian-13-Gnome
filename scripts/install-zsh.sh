#!/usr/bin/env bash

set -euo pipefail

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "==> Comprobando Zsh..."

if ! command -v zsh >/dev/null 2>&1; then
    echo "==> Zsh no está instalado. Instalándolo..."
    sudo apt-get update
    sudo apt-get install -y zsh
else
    echo "✓ Zsh ya está instalado."
fi

echo "==> Comprobando Oh My Zsh..."

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "==> Instalando Oh My Zsh..."

    RUNZSH=no
    CHSH=no
    KEEP_ZSHRC=yes

    export RUNZSH CHSH KEEP_ZSHRC

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "✓ Oh My Zsh ya está instalado."
fi

echo "==> Comprobando zsh-autosuggestions..."

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    git clone \
        https://github.com/zsh-users/zsh-autosuggestions.git \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "✓ zsh-autosuggestions ya está instalado."
fi

echo "==> Comprobando zsh-syntax-highlighting..."

if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "✓ zsh-syntax-highlighting ya está instalado."
fi

echo "==> Comprobando Powerlevel10k..."

if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
    git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "✓ Powerlevel10k ya está instalado."
fi

echo "==> Configuración de Zsh preparada."
