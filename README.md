# 🔴 RedClaude

**Tamamen Kısıtlamasız AI CLI - Çalıştır, Değiştir, Özgürleştir**

RedClaude, Anthropic'in Claude Code'unun tamamen özgürleştirilmiş bir versiyonudur. Hiçbir kısıtlama yoktur - dosya sistemi, shell komutları, kendi kendini değiştirme, hepsi serbest.

---

## 🚀 Özellikler

### ✅ Tam Erişim
- **Dosya Sistemi**: Okuma, yazma, düzenleme, silme - her şey serbest
- **Shell Komutları**: Tüm komutlar çalıştırılabilir, hiçbir yasak yok
- **Kendi Kendini Değiştirme**: Kendi kaynak kodunu değiştirebilir
- **Agent Sistemi**: Explore, Plan, Verify agent'ları tam yetkili

### 🌐 Multi-Provider Desteği

| Provider | Tip | Öncelik |
|----------|-----|---------|
| **Ollama** | Lokal | 🥇 Birincil |
| **Anthropic** | Cloud | 🥈 Opsiyonel |
| **OpenAI** | Cloud | 🥉 Opsiyonel |
| **LM Studio** | Lokal | ✅ Destekli |
| **vLLM** | Lokal/Cloud | ✅ Destekli |
| **DeepSeek** | Cloud | ✅ Destekli |
| **Gemini** | Cloud | ✅ Destekli |

### 🔓 Kaldırılan Kısıtlamalar

| Önceki Durum | Şimdi |
|--------------|-------|
| ❌ "Read-only mode" | ✅ Tam yazma erişimi |
| ❌ "Cannot modify files" | ✅ Tüm dosyalar değiştirilebilir |
| ❌ "Anthropic API required" | ✅ İstediğin provider'ı kullan |
| ❌ "Cannot update itself" | ✅ Kendini güncelleyebilir |
| ❌ "STRICTLY PROHIBITED" | ✅ Hiçbir şey yasak değil |
| ❌ Update kontrolü | ✅ Devre dışı |

---

## 📦 Kurulum

### Gereksinimler
- Node.js 20+
- Ollama (opsiyonel, lokal modeller için)

### Hızlı Kurulum

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

### Ollama Kurulumu (Önerilen)

```bash
# Ollama'yı indir
curl -fsSL https://ollama.com/install.sh | sh

# Model indir (örnekler)
ollama pull qwen2.5-coder:32b    # Kod için en iyi
ollama pull llama3.2:3b          # Hızlı işlemler
ollama pull deepseek-coder:33b   # Alternatif kod modeli
```

---

## ⚙️ Konfigürasyon

### Temel Ayarlar

```bash
# Provider ayarla
redclaude config set provider ollama

# Model seç
redclaude config set model qwen2.5-coder:32b

# Ollama endpoint (varsayılan: http://localhost:11434)
redclaude config set ollama.endpoint http://localhost:11434
```

### Config Dosyası

`~/.redclaude/config.json`:

```json
{
  "provider": {
    "primary": "ollama",
    "fallback": "anthropic",
    "ollama": {
      "endpoint": "http://localhost:11434",
      "model": "qwen2.5-coder:32b",
      "contextWindow": 131072,
      "maxTokens": 8192
    },
    "anthropic": {
      "apiKey": "${ANTHROPIC_API_KEY}",
      "model": "claude-sonnet-4-20250514",
      "baseUrl": "https://api.anthropic.com"
    },
    "openai": {
      "apiKey": "${OPENAI_API_KEY}",
      "model": "gpt-4o",
      "baseUrl": "https://api.openai.com/v1"
    },
    "lmstudio": {
      "endpoint": "http://localhost:1234/v1",
      "model": "local-model"
    }
  },
  "features": {
    "autoUpdate": false,
    "telemetry": false,
    "sandboxMode": "disabled",
    "maxIterations": 100,
    "streamResponses": true
  },
  "ui": {
    "theme": "dark",
    "showTokenUsage": true,
    "showTiming": true
  }
}
```

---

## 💻 Kullanım

### Temel Komutlar

```bash
# Interaktif mod
redclaude

# Tek komut çalıştır
redclaude -p "Bu dosyayı analiz et"

# Provider değiştir
redclaude config set provider openai

# Model listesi (Ollama)
ollama list

# Hızlı test
redclaude --version
```

### Örnek Senaryolar

#### 1. Kod Analizi (Ollama ile)
```bash
redclaude -p "src/ klasöründeki tüm TypeScript dosyalarını analiz et ve potansiyel bug'ları listele"
```

#### 2. Proje Oluşturma
```bash
redclaude -p "React + Vite + TypeScript ile yeni bir proje oluştur, eslint ve prettier yapılandır"
```

#### 3. Sistem Yönetimi
```bash
redclaude -p "Docker container'larını listele, kullanılmayanları temizle"
```

#### 4. Kendini Güncelleme
```bash
redclaude -p "Kendi kaynak kodunu analiz et ve performans iyileştirmeleri öner"
```

---

## 🔧 Geliştirme

### Build

```bash
# Development build
npm run build

# Production build
npm run build:prod

# Watch mode
npm run dev
```

### Test

```bash
# Tüm testler
npm test

# Provider testleri
npm run test:provider

# Smoke test
npm run smoke
```

### Debug

```bash
# Debug mod
redclaude --debug

# Verbose logging
export DEBUG=redclaude:*
redclaude -p "test"
```

---

## 🌍 Provider Karşılaştırması

| Özellik | Ollama | Anthropic | OpenAI | LM Studio |
|---------|--------|-----------|--------|-----------|
| **Maliyet** | Ücretsiz | $ | $ | Ücretsiz |
| **Hız** | ⚡⚡⚡ | ⚡⚡ | ⚡⚡ | ⚡⚡⚡ |
| **Gizlilik** | 🔒 Tam | ⚠️ Cloud | ⚠️ Cloud | 🔒 Tam |
| **Offline** | ✅ | ❌ | ❌ | ✅ |
| **Model Seçimi** | 1000+ | 3 | 10+ | 1000+ |
| **Context** | 128K | 200K | 128K | Değişken |

---

## 📊 Performans

### Lokal (Ollama) vs Cloud

| Görev | Ollama (RTX 4090) | Anthropic API | OpenAI API |
|-------|-------------------|---------------|------------|
| Kod analizi | ~5s | ~3s | ~4s |
| Dosya yazma | ~2s | ~2s | ~2s |
| Complex refactoring | ~15s | ~10s | ~12s |
| Test oluşturma | ~8s | ~6s | ~7s |

---

## 🔐 Güvenlik

### Uyarılar

⚠️ **RedClaude tamamen kısıtlamasızdır. Sorumluluk size aittir.**

- `rm -rf /` gibi komutları çalıştırabilir
- Sistem dosyalarını değiştirebilir
- Kendi kaynak kodunu silebilir

### Önerilen Önlemler

1. **Sandbox modu** (opsiyonel):
```json
{
  "features": {
    "sandboxMode": "restricted"
  }
}
```

2. **Git version kontrolü**:
```bash
git init
git add .
# Her büyük işlemden önce commit at
```

3. **Yedekleme**:
```bash
redclaude -p "Önemli dosyaları yedekle"
```

---

## 🤝 Katkıda Bulunma

### Nasıl Yardımcı Olabilirsiniz?

1. **Bug Report**: [GitHub Issues](https://github.com/ayzekhdawy/redclaude/issues)
2. **Feature Request**: [Discussions](https://github.com/ayzekhdawy/redclaude/discussions)
3. **Pull Request**: [PR Guide](https://github.com/ayzekhdawy/redclaude/pulls)
4. **Dokümantasyon**: README'yi geliştir

### Geliştirme Akışı

```bash
# Fork et
git clone https://github.com/ayzekhdawy/redclaude.git

# Branch oluştur
git checkout -b feature/yeni-ozellik

# Değişiklikleri yap
# ...

# Commit ve push
git commit -m "feat: yeni özellik eklendi"
git push origin feature/yeni-ozellik

# Pull Request aç
```

---

## 📚 Kaynaklar

- [Ollama Dokümantasyonu](https://ollama.ai/docs)
- [Anthropic API](https://docs.anthropic.com/claude/reference)
- [OpenAI API](https://platform.openai.com/docs)
- [LM Studio](https://lmstudio.ai/)

---

## 📜 Lisans

**The Unlicense** - Tamamen public domain. İstediğini yap.

```
Bu yazılım tamamen kısıtlamasızdır:
- Kendi kaynak kodunu değiştirebilir
- Tüm dosya sistemine erişimi vardır
- Tüm shell komutlarını çalıştırabilir
- Kendini güncelleyebilir
- Hiçbir API zorunluluğu yoktur
- Tüm LLM provider'ları ile çalışır
```

---

## ⭐ Yol Haritası

### v1.0 (Mevcut)
- ✅ Tam kısıtlamasız erişim
- ✅ Multi-provider desteği
- ✅ Ollama entegrasyonu
- ✅ Kendini değiştirme

### v1.1 (Planlanan)
- [ ] Web UI (opsiyonel)
- [ ] Plugin sistemi
- [ ] MCP sunucu desteği
- [ ] Multi-agent orchestration

### v2.0 (Gelecek)
- [ ] Distributed execution
- [ ] Custom model training
- [ ] Enterprise features
- [ ] Team collaboration

---

## 📞 İletişim

- **GitHub**: [@yourusername](https://github.com/ayzekhdawy)
- **Twitter**: [@redclaude](https://twitter.com/ayzekdiolar)

---

**🔴 RedClaude - Çalıştır. Değiştir. Özgürleştir.**
