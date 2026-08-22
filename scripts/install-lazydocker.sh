#!/usr/bin/env bash

set -euo pipefail

INSTALL_DIR="$HOME/.local/bin"

echo "==> Comprobando lazydocker..."

if command -v lazydocker >/dev/null 2>&1; then
    echo "✓ lazydocker ya está instalado:"
    lazydocker --version || true
    exit 0
fi

echo "==> Creando directorio de binarios locales..."

mkdir -p "$INSTALL_DIR"

echo "==> Instalando lazydocker..."

curl -fsSL \
    https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh \
    | DIR="$INSTALL_DIR" bash

echo "==> Comprobando instalación..."

if [[ -x "$INSTALL_DIR/lazydocker" ]]; then
    echo "✓ lazydocker instalado correctamente."
else
    echo "✗ No se pudo encontrar lazydocker en $INSTALL_DIR"
    exit 1
fi

echo
echo "ℹ️  Asegurate de tener ~/.local/bin en tu PATH."
