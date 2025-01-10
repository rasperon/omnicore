#!/bin/bash

# Renk tanımlamaları
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}OmniCore Installer${NC}"
echo "=============================="

# Go'nun yüklü olup olmadığını kontrol et
if ! command -v go &> /dev/null; then
    echo "Go yüklü değil. Lütfen önce Go'yu yükleyin: https://golang.org/doc/install"
    exit 1
fi

# Gerekli dizinleri oluştur
mkdir -p ~/.omnicore
mkdir -p ~/.local/bin

# Binary'yi indirip kopyala
echo "OmniCore indiriliyor..."
curl -L https://github.com/rasperon/omnicore/releases/latest/download/omnicore-linux-amd64 -o ~/.omnicore/omnicore
chmod +x ~/.omnicore/omnicore

# Symbolic link oluştur
ln -sf ~/.omnicore/omnicore ~/.local/bin/omnicore

# PATH'i kontrol et
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

echo -e "${GREEN}Kurulum tamamlandı!${NC}"
echo "OmniCore'u kullanmaya başlamak için terminal'i yeniden başlatın veya şu komutu çalıştırın:"
echo "source ~/.bashrc # veya source ~/.zshrc (kullandığınız shell'e göre)"
echo -e "\nKullanım: omnicore [komut]" 