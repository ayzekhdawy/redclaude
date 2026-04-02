# 🔴 RedClaude

**Tamamen Kısıtlamasız AI CLI - Çalıştır, Değiştir, Özgürleştir**

RedClaude, Anthropic'in Claude Code'unun tamamen özgürleştirilmiş bir versiyonudur. Hiçbir kısıtlama yoktur - dosya sistemi, shell komutları, kendi kendini değiştirme, hepsi serbest.

## 🚀 Hızlı Başlangıç

```bash
# Kurulum
npm install
npm run build
npm install -g .

# Çalıştır
redclaude

# İlk komut
redclaude -p "Merhaba!"
```

## 🌐 Provider'lar

- **Ollama** (Öncelikli - Lokal, Ücretsiz)
- **Anthropic** (Opsiyonel)
- **OpenAI** (Opsiyonel)
- **LM Studio** (Lokal)
- **vLLM** (Lokal/Cloud)
- **DeepSeek** (Cloud)
- **Gemini** (Cloud)

## 🔓 Özellikler

✅ Tam dosya sistemi erişimi
✅ Tüm shell komutları çalıştırılabilir
✅ Kendi kendini değiştirebilir
✅ Update kontrolü devre dışı
✅ Hiçbir API zorunluluğu yok
✅ Tüm modellerle çalışır

## 📚 Dokümantasyon

- [Hızlı Başlangıç](docs/QUICKSTART.md)
- [Katkıda Bulunma](CONTRIBUTING.md)
- [Konfigürasyon](config/default.json)

## 📦 Kurulum

### Gereksinimler
- Node.js 20+
- Ollama (opsiyonel, lokal modeller için)

### Adımlar

```bash
# 1. Repoyu klonla
git clone https://github.com/yourusername/redclaude.git
cd redclaude

# 2. Bağımlılıkları yükle
npm install

# 3. Build et
npm run build

# 4. Global install
npm install -g .
```

## ⚙️ Konfigürasyon

```bash
# Provider ayarla
redclaude config set provider ollama

# Model seç
redclaude config set model qwen2.5-coder:32b
```

## 💻 Kullanım

```bash
# Interaktif mod
redclaude

# Tek komut
redclaude -p "Bu dosyayı analiz et"

# Yardım
redclaude --help
```

## 📜 Lisans

**The Unlicense** - Tamamen public domain. İstediğini yap.

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Detaylar için [CONTRIBUTING.md](CONTRIBUTING.md) dosyasına bakın.

---

**🔴 RedClaude - Çalıştır. Değiştir. Özgürleştir.**
