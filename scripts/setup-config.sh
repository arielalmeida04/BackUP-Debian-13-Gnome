#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

ZSH_CONFIG="$PROJECT_DIR/config/zsh"
GIT_CONFIG="$PROJECT_DIR/config/git"

echo "==> Configurando Git..."

if [[ -f "$GIT_CONFIG/.gitconfig" ]]; then
    cp "$GIT_CONFIG/.gitconfig" "$HOME/.gitconfig"
    echo "✓ ~/.gitconfig instalado."
fi

echo
echo "==> Configurando Zsh..."

mkdir -p "$HOME/.config/zsh"

if [[ -f "$ZSH_CONFIG/.zshrc" ]]; then
    cp "$ZSH_CONFIG/.zshrc" "$HOME/.zshrc"
    echo "✓ ~/.zshrc instalado."
fi

if [[ -f "$ZSH_CONFIG/.p10k.zsh" ]]; then
    cp "$ZSH_CONFIG/.p10k.zsh" "$HOME/.p10k.zsh"
    echo "✓ ~/.p10k.zsh instalado."
fi

for file in aliases.zsh functions.zsh keybindings.zsh; do
    if [[ -f "$ZSH_CONFIG/$file" ]]; then
        cp "$ZSH_CONFIG/$file" "$HOME/.config/zsh/$file"
        echo "✓ $file instalado."
    fi
done

echo
echo "✓ Configuración instalada."
echo
echo "ℹ️  No se copiaron:"
echo "   - ~/.ssh"
echo "   - ~/.gnupg"
echo "   - .env"
echo "   - proyectos"
echo "   - documentos"
echo "   - caches"
echo "   - historial"
echo "   - credenciales"
