#!/usr/bin/env bash

# 🔴 RedClaude Kurulum Scripti
# Bu script RedClaude'ı otomatik olarak kurar ve yapılandırır.

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${RED}╔════════════════════════════════════╗${NC}"
echo -e "${RED}║     🔴 RedClaude Kurulum            ║${NC}"
echo -e "${RED}╚════════════════════════════════════╝${NC}"
echo ""

# Sistem kontrolü
echo -e "${BLUE}📋 Sistem kontrolü...${NC}"

# Node.js kontrolü
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js bulunamadı!${NC}"
    echo "Node.js 20+ yükleyin: https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 20 ]; then
    echo -e "${RED}❌ Node.js 20+ gerekli! Mevcut: $NODE_VERSION${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Node.js $(node -v)"

# npm kontrolü
if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm bulunamadı!${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} npm $(npm -v)"

# Git kontrolü
if ! command -v git &> /dev/null; then
    echo -e "${YELLOW}⚠ Git bulunamadı (opsiyonel)${NC}"
else
    echo -e "${GREEN}✓${NC} git $(git --version | cut -d' ' -f3)"
fi

# Ollama kontrolü (opsiyonel)
if command -v ollama &> /dev/null; then
    echo -e "${GREEN}✓${NC} Ollama mevcut"
    OLLAMA_STATUS=$(ollama list 2>&1 || echo "")
    if [ -z "$OLLAMA_STATUS" ]; then
        echo -e "${YELLOW}⚠ Ollama'da model yok${NC}"
        echo -e "${YELLOW}  Önerilen: ollama pull qwen2.5-coder:32b${NC}"
    fi
else
    echo -e "${YELLOW}⚠ Ollama bulunamadı (opsiyonel)${NC}"
    echo -e "${YELLOW}  Lokal modeller için: https://ollama.com/${NC}"
fi

echo ""

# Bağımlılıkları yükle
echo -e "${BLUE}📦 Bağımlılıklar yükleniyor...${NC}"
npm install --legacy-peer-deps

echo ""

# Build
echo -e "${BLUE}🔨 Build ediliyor...${NC}"
npm run build

echo ""

# Global install (opsiyonel)
echo -e "${BLUE}🌍 Global kurulum?${NC}"
read -p "RedClaude'ı global olarak kurmak ister misiniz? (e/h): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Ee]$ ]]; then
    echo -e "${BLUE}📥 Global kurulum...${NC}"
    npm install -g .
    echo -e "${GREEN}✓${NC} Global kurulum tamamlandı"
fi

echo ""

# Config oluştur
echo -e "${BLUE}⚙️ Konfigürasyon...${NC}"
CONFIG_DIR="$HOME/.redclaude"

if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
    echo -e "${GREEN}✓${NC} Config dizini oluşturuldu: $CONFIG_DIR"
fi

# Varsayılan config'i kopyala
if [ ! -f "$CONFIG_DIR/config.json" ]; then
    cp config/default.json "$CONFIG_DIR/config.json"
    echo -e "${GREEN}✓${NC} Varsayılan config oluşturuldu"
fi

echo ""

# Test
echo -e "${BLUE}🧪 Test ediliyor...${NC}"
node test.js

echo ""

# Başarı mesajı
echo -e "${RED}╔════════════════════════════════════╗${NC}"
echo -e "${RED}║     ✅ Kurulum Başarılı!            ║${NC}"
echo -e "${RED}╚════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}RedClaude kullanıma hazır!${NC}"
echo ""
echo -e "${YELLOW}Sonraki adımlar:${NC}"
echo ""

if [[ $REPLY =~ ^[Ee]$ ]]; then
    echo "  1. ${BLUE}redclaude --version${NC}"
    echo "  2. ${BLUE}redclaude config set provider ollama${NC}"
    echo "  3. ${BLUE}redclaude config set model qwen2.5-coder:32b${NC}"
    echo "  4. ${BLUE}redclaude${NC}"
else
    echo "  1. ${BLUE}npm run dev${NC}"
    echo "  2. ${BLUE}npm install -g .${NC} (opsiyonel)"
    echo "  3. ${BLUE}redclaude${NC}"
fi

echo ""
echo -e "${YELLOW}Daha fazla bilgi için:${NC}"
echo "  - ${BLUE}docs/QUICKSTART.md${NC}"
echo "  - ${BLUE}README.md${NC}"
echo "  - ${BLUE}https://github.com/yourusername/redclaude${NC}"
echo ""
echo -e "${RED}🔴 RedClaude - Çalıştır. Değiştir. Özgürleştir.${NC}"
echo ""
