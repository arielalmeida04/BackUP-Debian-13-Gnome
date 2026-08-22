#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================"
echo " Debian Bootstrap"
echo "========================================"
echo

echo "[1/7] Instalando paquetes base..."
"$SCRIPT_DIR/scripts/install-packages.sh" \
    "$SCRIPT_DIR/packages/base.txt"

echo
echo "[2/7] Instalando herramientas de desarrollo..."
"$SCRIPT_DIR/scripts/install-packages.sh" \
    "$SCRIPT_DIR/packages/development.txt"

echo
echo "[3/7] Instalando herramientas de terminal..."
"$SCRIPT_DIR/scripts/install-packages.sh" \
    "$SCRIPT_DIR/packages/tools.txt"

echo
echo "[4/7] Instalando Java..."
"$SCRIPT_DIR/scripts/install-java.sh"

echo
echo "[5/7] Instalando Python..."
"$SCRIPT_DIR/scripts/install-python.sh"

echo
echo "[6/7] Instalando Node/NVM..."
"$SCRIPT_DIR/scripts/install-node.sh"

echo
echo "[7/9] Configurando Zsh..."
"$SCRIPT_DIR/scripts/install-zsh.sh"

echo
echo "[8/9] Instalando lazydocker..."
"$SCRIPT_DIR/scripts/install-lazydocker.sh"

echo
echo "[9/9] Aplicando configuración..."
"$SCRIPT_DIR/scripts/setup-config.sh"
echo
echo "========================================"
echo " Aplicando configuración"
echo "========================================"

"$SCRIPT_DIR/scripts/setup-config.sh"

echo
echo "========================================"
echo " ✓ Debian Bootstrap completado"
echo "========================================"
echo
echo "Reiniciá la sesión de Zsh con:"
echo
echo "    exec zsh"
echo
