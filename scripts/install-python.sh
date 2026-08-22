#!/usr/bin/env bash

set -euo pipefail

echo "==> Comprobando Python..."

PACKAGES=(
    python3
    python3-dev
    python3-full
    python3-pip
    python3-venv
    python3-pynvim
)

MISSING=()

for package in "${PACKAGES[@]}"; do
    if dpkg -s "$package" >/dev/null 2>&1; then
        echo "✓ $package"
    else
        echo "✗ $package"
        MISSING+=("$package")
    fi
done

if [[ ${#MISSING[@]} -gt 0 ]]; then
    echo
    echo "==> Instalando paquetes faltantes..."

    sudo apt update
    sudo apt install -y "${MISSING[@]}"
else
    echo
    echo "✓ Todos los paquetes de Python ya están instalados."
fi

echo
echo "✓ Python:"
python3 --version
