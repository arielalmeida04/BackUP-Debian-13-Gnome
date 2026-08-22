#!/usr/bin/env bash

set -euo pipefail

PACKAGES_FILE="${1:-}"

if [[ -z "$PACKAGES_FILE" ]]; then
    echo "Uso: $0 <archivo-de-paquetes>"
    exit 1
fi

if [[ ! -f "$PACKAGES_FILE" ]]; then
    echo "Error: no existe el archivo '$PACKAGES_FILE'"
    exit 1
fi

echo "==> Actualizando repositorios..."
sudo apt update

echo "==> Instalando paquetes desde: $PACKAGES_FILE"

mapfile -t PACKAGES < <(
    grep -vE '^\s*(#|$)' "$PACKAGES_FILE"
)

if [[ ${#PACKAGES[@]} -eq 0 ]]; then
    echo "No hay paquetes para instalar."
    exit 0
fi

sudo apt install -y "${PACKAGES[@]}"

echo "==> Instalación completada."
