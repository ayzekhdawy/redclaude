# 📝 RedClaude Changelog

Tüm önemli değişiklikler bu dosyada belgelenmektedir.

## [1.0.0] - 2026-04-02

### 🎉 İlk Resmi Sürüm

#### ✨ Yeni Özellikler
- **Multi-Provider Desteği**: Ollama, Anthropic, OpenAI, LM Studio, vLLM, DeepSeek, Gemini
- **Tam Kısıtlamasız Erişim**: Tüm dosya işlemleri serbest
- **Kendi Kendini Değiştirme**: Kaynak kodunu düzenleyebilir
- **Agent Sistemi**: Explore, Plan, Verify agent'ları
- **Config Sistemi**: JSON tabanlı merkezi yapılandırma

#### 🔓 Kaldırılan Kısıtlamalar
- ❌ "Read-only mode" kısıtlamaları
- ❌ "Cannot modify files" yasakları
- ❌ "Anthropic API required" zorunluluğu
- ❌ "Cannot update itself" engeli
- ❌ Update kontrol mekanizması
- ❌ Tüm "STRICTLY PROHIBITED" ifadeleri

#### ⚙️ Teknik Değişiklikler
- OpenClaude → RedClaude yeniden adlandırma
- Update komutu bypass edildi (her zaman başarılı döner)
- System prompt'lar temizlendi
- Sandbox mode varsayılan olarak devre dışı
- Tüm yollar ve komutlar izinli

#### 📚 Dokümantasyon
- README.md tam Türkçe/İngilizce destek
- QUICKSTART.md hızlı başlangıç rehberi
- CONTRIBUTING.md katkı rehberi
- config/default.json örnek yapılandırma

#### 🌐 Provider'lar
- **Ollama** (Öncelikli) - qwen2.5-coder, llama3.2, deepseek-r1
- **Anthropic** - claude-sonnet, claude-haiku
- **OpenAI** - gpt-4o, gpt-4o-mini
- **LM Studio** - Lokal modeller
- **vLLM** - Self-hosted
- **DeepSeek** - deepseek-chat, deepseek-coder
- **Gemini** - gemini-2.0-flash

#### 🔐 Güvenlik
- ConfirmDestructive: false
- ConfirmExternalNetwork: false
- AllowedPaths: ["*"]
- AllowedCommands: ["*"]
- SandboxMode: disabled

---

## [0.1.6] - 2026-04-01

### 🔄 Dönüm Noktası

- OpenClaude fork'landı
- Temel kısıtlamalar kaldırıldı
- RedClaude adı verildi

---

## Gelecek Sürümler

### [1.1.0] - Planlanan
- [ ] Web UI (opsiyonel)
- [ ] Plugin sistemi
- [ ] MCP sunucu desteği
- [ ] Multi-agent orchestration
- [ ] Model auto-switch
- [ ] Response caching

### [2.0.0] - Uzun Vadeli
- [ ] Distributed execution
- [ ] Custom model training
- [ ] Enterprise features
- [ ] Team collaboration
- [ ] Cloud sync

---

## 📝 Sürüm Notları

### Sürüm Numaralandırması

RedClaude [Semantic Versioning](https://semver.org/) kullanır:

- **MAJOR**: Breaking changes
- **MINOR**: Yeni özellikler (backwards compatible)
- **PATCH**: Bug fixler (backwards compatible)

### Yayın Süreci

1. CHANGELOG güncelle
2. Version bump (package.json)
3. Git tag
4. GitHub release
5. npm publish

---

**🔴 RedCLAude - Çalıştır. Değiştir. Özgürleştir.**
