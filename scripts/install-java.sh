#!/usr/bin/env bash

set -euo pipefail

echo "==> Comprobando Java..."

if command -v java >/dev/null 2>&1 && command -v javac >/dev/null 2>&1; then
    echo "✓ Java ya está instalado:"
    java -version
    echo
    echo "✓ Compilador:"
    javac -version
    exit 0
fi

echo "==> Java no encontrado."
echo "==> Instalando JDK de Debian..."

sudo apt update
sudo apt install -y default-jdk

echo
echo "✓ Java instalado:"
java -version

echo
echo "✓ Compilador:"
javac -version
