# 🤝 RedClaude'a Katkıda Bulunma

RedClaude'a katkıda bulunmak istediğin için teşekkürler! Bu rehber, projeye nasıl katkıda bulunabileceğini açıklıyor.

---

## 📋 İçindekiler

- [Katkı Türleri](#katkı-türleri)
- [İlk Adımlar](#ilk-adımlar)
- [Geliştirme Ortamı](#geliştirme-ortamı)
- [Pull Request Süreci](#pull-request-süreci)
- [Kod Standartları](#kod-standartları)
- [Test](#test)
- [Dokümantasyon](#dokümantasyon)

---

## 🎯 Katkı Türleri

### 1. Kod Katkıları
- 🐛 Bug fix'ler
- ✨ Yeni özellikler
- 🔧 Performans iyileştirmeleri
- 🧹 Kod temizliği (refactoring)

### 2. Dokümantasyon
- 📚 README iyileştirmeleri
- 📝 Örnek kullanım senaryoları
- 🌐 Çeviriler (Türkçe, İngilizce, vb.)

### 3. Test ve QA
- ✅ Test case'leri yazma
- 🧪 Manual testing
- 🐛 Bug report'ları

### 4. Community
- 💬 Sorulara cevap verme
- 🎓 Yeni kullanıcılara yardım
- 📢 Projeyi tanıtma

---

## 🚀 İlk Adımlar

### 1. Projeyi Fork Et

```bash
# GitHub'da "Fork" butonuna tıkla
# Veya CLI ile:
gh repo fork yourusername/redclaude
```

### 2. Local'e Klonla

```bash
git clone https://github.com/yourusername/redclaude.git
cd redclaude
```

### 3. Bağımlılıkları Yükle

```bash
npm install
```

### 4. Development Build

```bash
npm run build
```

---

## 💻 Geliştirme Ortamı

### Gereksinimler

- Node.js 20+
- npm veya bun
- Git
- (Opsiyonel) Ollama - lokal test için

### Development Komutları

```bash
# Build ve çalıştır
npm run dev

# Watch mode (otomatik rebuild)
npm run dev:watch

# Test çalıştır
npm test

# Lint
npm run lint

# Type check
npm run typecheck
```

### Debug Mod

```bash
# Debug logging ile çalıştır
DEBUG=redclaude:* npm run dev

# Veya
npm run dev -- --debug
```

---

## 🔄 Pull Request Süreci

### 1. Issue Oluştur (Önerilen)

Önemli değişiklikler için önce issue aç:
- Bug report: [Bug Template](.github/ISSUE_TEMPLATE/bug_report.md)
- Feature request: [Feature Template](.github/ISSUE_TEMPLATE/feature_request.md)

### 2. Branch Oluştur

```bash
# Feature branch
git checkout -b feat/yeni-ozellik

# Bug fix branch
git checkout -b fix/bug-aciklamasi

# Docs branch
git checkout -b docs/readme-guncelleme
```

### 3. Değişiklikleri Yap

- Kod standartlarına uy
- Test ekle (mümkünse)
- Commit mesajlarını açık yaz

### 4. Commit Mesajı Formatı

```bash
# Format: type(scope): description

# Örnekler:
git commit -m "feat(ollama): Qwen2.5-Coder desteği eklendi"
git commit -m "fix(provider): Anthropic timeout hatası düzeltildi"
git commit -m "docs(readme): Kurulum adımları güncellendi"
git commit -m "test(agents): Explore agent testleri eklendi"
```

**Commit Tipleri:**
- `feat`: Yeni özellik
- `fix`: Bug fix
- `docs`: Dokümantasyon
- `style`: Kod formatı (işlevsel değişiklik yok)
- `refactor`: Kod iyileştirme
- `test`: Test ekleme/düzenleme
- `chore`: Build/config değişiklikleri

### 5. Push ve PR Aç

```bash
# Branch'i push et
git push origin feat/yeni-ozellik

# GitHub'da Pull Request aç
# https://github.com/yourusername/redclaude/pulls
```

### 6. Code Review

- Review'lara cevap ver
- Gerekli değişiklikleri yap
- CI testlerini geç

---

## 📐 Kod Standartları

### TypeScript

```typescript
// ✅ İyi
async function getFileContent(filePath: string): Promise<string> {
  const content = await fs.readFile(filePath, 'utf-8');
  return content.trim();
}

// ❌ Kötü
async function getFileContent(filePath) {
  let content = await fs.readFile(filePath, 'utf-8');
  return content;
}
```

### Genel Kurallar

1. **TypeScript kullan** - Mümkün olduğunca type ekle
2. **Async/await** - Callback yerine async/await
3. **Error handling** - Hataları yakala ve logla
4. **Comments** - Karmaşık kodları yorumla
5. **Naming** - Açıklayıcı isimler kullan

### Lint Kuralları

```bash
# Lint çalıştır
npm run lint

# Auto-fix
npm run lint:fix
```

---

## 🧪 Test

### Test Türleri

```bash
# Unit testler
npm run test:unit

# Integration testler
npm run test:integration

# E2E testler
npm run test:e2e

# Tüm testler
npm test
```

### Test Yazma

```typescript
// src/__tests__/provider.test.ts
import { describe, it, expect } from 'vitest';
import { OllamaProvider } from '../providers/ollama';

describe('OllamaProvider', () => {
  it('should connect to local endpoint', async () => {
    const provider = new OllamaProvider('http://localhost:11434');
    const isConnected = await provider.healthCheck();
    expect(isConnected).toBe(true);
  });

  it('should generate response', async () => {
    const provider = new OllamaProvider();
    const response = await provider.chat('Merhaba');
    expect(response).toBeDefined();
    expect(response.length).toBeGreaterThan(0);
  });
});
```

### Test Coverage

```bash
# Coverage raporu
npm run test:coverage

# Coverage'ı aç
npm run test:coverage -- --open
```

---

## 📚 Dokümantasyon

### README Güncelleme

- Yeni özellikleri ekle
- Örnekleri güncelle
- Ekran görüntüleri ekle (gerekirse)

### Dokümantasyon Standartları

```markdown
# Başlık 1

## Başlık 2

### Başlık 3

- Liste item 1
- Liste item 2

**Kalın** metin
*İtalik* metin

\`\`\`bash
# Kod bloğu
komut çalıştır
\`\`\`
```

### Çeviriler

```bash
docs/
├── README.md          # Ana (İngilizce)
├── README.tr.md       # Türkçe
├── README.es.md       # İspanyolca
└── README.zh.md       # Çince
```

---

## 🎨 Özellik Önerileri

### Yeni Provider Ekleme

1. `src/providers/` altında yeni dosya oluştur
2. Provider interface'ini implement et
3. Testleri yaz
4. Dokümantasyonu ekle

### Yeni Agent Ekleme

1. `src/agents/` altında yeni dosya oluştur
2. System prompt'u yaz
3. Tools'u tanımla
4. Test et

### Yeni Tool Ekleme

1. `src/tools/` altında yeni dosya oluştur
2. Input/output schema tanımla
3. Implementation yaz
4. Permission rules ekle

---

## 🐛 Bug Fix

### Bug Report Template

```markdown
**Bug Açıklaması:**
Ne oldu?

**Tekrar Adımları:**
1. ...
2. ...
3. ...

**Beklenen Davranış:**
Ne olmalıydı?

**Ekran Görüntüleri:**
Varsa ekle

**Sistem Bilgisi:**
- OS: Windows 11
- Node: v20.0.0
- RedClaude: v1.0.0
```

### Debug İpuçları

```bash
# Debug mod
redclaude --debug -p "test"

# Logları incele
tail -f ~/.redclaude/logs/redclaude.log

# Verbose logging
export DEBUG=redclaude:*
```

---

## 📬 İletişim

### Soruların Mı Var?

- **GitHub Discussions**: [Soru sor](https://github.com/yourusername/redclaude/discussions)
- **Discord**: [Topluluk sunucusu](https://discord.gg/redclaude)
- **Twitter**: [@redclaude](https://twitter.com/redclaude)

### Kod İncelemesi

- **Pull Requests**: [PR'ları incele](https://github.com/yourusername/redclaude/pulls)
- **Issues**: [Bug'ları fix et](https://github.com/yourusername/redclaude/issues)

---

## 🏆 Katkıda Bulunanlar

Tüm katkıda bulunanlara teşekkürler! 🎉

<!-- Contributors list will be auto-generated -->

---

## 📜 Lisans

RedClaude [Unlicense](LICENSE) altında lisanslanmıştır.

---

**🔴 Katkılarını bekliyoruz!**
