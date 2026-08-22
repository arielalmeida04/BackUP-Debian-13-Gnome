#!/usr/bin/env bash

set -euo pipefail

NVM_DIR="$HOME/.nvm"

echo "==> Comprobando NVM..."

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    echo "✓ NVM ya está instalado."
else
    echo "==> NVM no encontrado."
    echo "==> Instalando NVM..."

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    source "$NVM_DIR/nvm.sh"
fi

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

echo
echo "==> Comprobando Node..."

if command -v node >/dev/null 2>&1; then
    echo "✓ Node ya está instalado:"
    node --version
    echo
    echo "✓ npm:"
    npm --version
else
    echo "==> Node no encontrado."
    echo "==> Instalando Node LTS mediante NVM..."

    nvm install --lts
    nvm alias default 'lts/*'
fi

echo
echo "✓ Node preparado:"
node --version
echo "✓ npm:"
npm --version
