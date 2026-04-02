# 🔴 RedCLAude - Repo Yapısı

Bu doküman RedClaude repo yapısını ve her dosyanın amacını açıklar.

---

## 📁 Kök Dizin

```
Z:\RedClaude\
├── package.json              # NPM paket tanımı, bağımlılıklar
├── README.md                 # Ana dokümantasyon (İngilizce)
├── LICENSE                   # Unlicense - Public domain
├── CHANGELOG.md              # Sürüm geçmişi
├── CONTRIBUTING.md           # Katkı rehberi
├── .gitignore                # Git ignore kuralları
├── test.js                   # Test suite
├── install.sh                # Linux/Mac kurulum scripti
├── install.bat               # Windows kurulum scripti
├── tsconfig.json             # TypeScript config (opsiyonel)
├── bunfig.toml               # Bun config (opsiyonel)
│
├── dist/                     # Distribution (build output)
│   ├── package.json
│   ├── README.md
│   ├── dist/
│   │   └── cli.mjs          # Ana CLI binary
│   ├── bin/
│   │   └── redclaude        # Wrapper script
│   └── config/
│       └── default.json     # Varsayılan config
│
├── src/                      # Kaynak kod (eğer varsa)
│   ├── cli/
│   ├── providers/
│   ├── tools/
│   └── utils/
│
├── config/                   # Konfigürasyon dosyaları
│   └── default.json         # Varsayılan ayarlar
│
├── docs/                     # Dokümantasyon
│   ├── QUICKSTART.md        # Hızlı başlangıç
│   ├── PROVIDERS.md         # Provider rehberi
│   ├── AGENTS.md            # Agent rehberi
│   └── CONFIG.md            # Config rehberi
│
├── scripts/                  # Build ve utility scriptleri
│   ├── build.ts             # Build script
│   ├── provider-launch.ts   # Provider recommendation
│   └── system-check.ts      # Sistem kontrolü
│
└── .github/                  # GitHub specific
    ├── workflows/
    │   └── ci.yml           # CI/CD pipeline
    ├── ISSUE_TEMPLATE/
    │   ├── bug_report.md
    │   └── feature_request.md
    └── PULL_REQUEST_TEMPLATE.md
```

---

## 📄 Önemli Dosyalar

### `package.json`
- Paket metadata
- Bağımlılıklar
- NPM scripts
- Bin komutu tanımı

### `dist/dist/cli.mjs`
- Ana CLI binary
- Tüm işlevsellik burada
- Minified bundle

### `config/default.json`
- Varsayılan provider ayarları
- Feature flag'ler
- Güvenlik ayarları
- UI tercihleri

### `test.js`
- Otomatik test suite
- Kısıtlama kontrolü
- Config validasyonu
- Yapı kontrolü

---

## 🔧 NPM Scripts

```json
{
  "build": "bun run scripts/build.ts",
  "dev": "bun run scripts/provider-launch.ts",
  "test": "node test.js",
  "lint": "eslint src/",
  "typecheck": "tsc --noEmit",
  "smoke": "bun run build && node dist/cli.mjs --version"
}
```

---

## 🌐 Provider Yapısı

### Provider Hierarchy

```
providers/
├── ollama.ts          # Ollama API client
├── anthropic.ts       # Anthropic API client
├── openai.ts          # OpenAI API client
├── lmstudio.ts        # LM Studio client
├── vllm.ts            # vLLM client
├── deepseek.ts        # DeepSeek client
├── gemini.ts          # Google Gemini client
└── index.ts           # Provider factory
```

### Provider Interface

```typescript
interface Provider {
  name: string;
  type: 'local' | 'cloud';
  endpoint?: string;
  model: string;
  chat(messages: Message[]): Promise<Response>;
  healthCheck(): Promise<boolean>;
  listModels(): Promise<string[]>;
}
```

---

## 🤖 Agent Yapısı

```
agents/
├── explore.ts         # Kod keşif agent'ı
├── plan.ts            # Planlama agent'ı
├── verify.ts          # Doğrulama agent'ı
└── index.ts           # Agent registry
```

### Agent System Prompt'ları

Tüm agent prompt'ları kısıtlamasız:
- ❌ "READ-ONLY" yok
- ❌ "STRICTLY PROHIBITED" yok
- ❌ "Cannot modify" yok
- ✅ Tam erişim var

---

## 🛠️ Tool Yapısı

```
tools/
├── FileRead.ts        # Dosya okuma
├── FileEdit.ts        # Dosya düzenleme (kısıtlamasız)
├── FileWrite.ts       # Dosya yazma (kısıtlamasız)
├── Bash.ts            # Shell komutları (kısıtlamasız)
├── Glob.ts            # Dosya arama
├── Grep.ts            # İçerik arama
└── AgentTool.ts       # Agent çağırma
```

---

## ⚙️ Config Sistemi

### Hierarchy

```
1. ~/.redclaude/config.json     # User config (öncelikli)
2. ./config/default.json        # Default config
3. Environment variables        # ENV overrides
```

### Config Schema

```typescript
interface Config {
  provider: {
    primary: string;
    providers: {
      ollama: ProviderConfig;
      anthropic: ProviderConfig;
      // ...
    };
  };
  features: {
    autoUpdate: boolean;
    telemetry: boolean;
    sandboxMode: string;
    // ...
  };
  security: {
    confirmDestructive: boolean;
    allowedPaths: string[];
    allowedCommands: string[];
    // ...
  };
}
```

---

## 🧪 Test Sistemi

### Test Types

1. **Unit Tests**: Bireysel fonksiyonlar
2. **Integration Tests**: Provider entegrasyonları
3. **E2E Tests**: Tam akış testleri
4. **Constraint Tests**: Kısıtlama kontrolü

### Test Komutları

```bash
# Tüm testler
npm test

# Test suite
node test.js

# Coverage
npm run test:coverage

# Smoke test
npm run smoke
```

---

## 📦 Build Süreci

### Adımlar

1. **TypeScript/Bun Compile**: `src/` → `dist/`
2. **Bundle**: Tüm modüller tek dosyada
3. **Minify**: Boyut optimizasyonu
4. **Copy Assets**: README, LICENSE, config
5. **Package**: NPM package oluştur

### Build Output

```
dist/
├── package.json         # NPM metadata
├── README.md            # Dokümantasyon
├── LICENSE              # Lisans
├── bin/
│   └── redclaude        # CLI wrapper
└── dist/
    └── cli.mjs          # Ana binary (minified)
```

---

## 🚀 Yayın Süreci

### NPM Publish

```bash
# Version bump
npm version patch  # veya minor, major

# Build
npm run build

# Test
npm test

# Publish
npm publish --access public
```

### GitHub Release

1. Git tag oluştur
2. GitHub release oluştur
3. Changelog ekle
4. Binary'leri attach et

---

## 🔐 Güvenlik

### Varsayılan Ayarlar

```json
{
  "security": {
    "confirmDestructive": false,
    "confirmExternalNetwork": false,
    "confirmLargeOperations": false,
    "allowedPaths": ["*"],
    "blockedPaths": [],
    "allowedCommands": ["*"],
    "blockedCommands": [],
    "sandboxMode": "disabled"
  }
}
```

### Kullanıcı Sorumluluğu

⚠️ **RedCLAude tamamen kısıtlamasızdır. Tüm sorumluluk kullanıcıya aittir.**

---

## 📚 Dokümantasyon

### Dosyalar

- `README.md`: Genel bakış (İngilizce)
- `docs/QUICKSTART.md`: Hızlı başlangıç
- `docs/PROVIDERS.md`: Provider rehberi
- `docs/AGENTS.md`: Agent rehberi
- `docs/CONFIG.md`: Config rehberi
- `CONTRIBUTING.md`: Katkı rehberi
- `CHANGELOG.md`: Değişim geçmişi

### Çeviriler

```
docs/
├── QUICKSTART.md      # İngilizce
├── QUICKSTART.tr.md   # Türkçe
├── README.md          # İngilizce
└── README.tr.md       # Türkçe
```

---

## 🎯 Felsefe

RedCLAude şu prensiplere göre tasarlanmıştır:

1. **Tam Özgürlük**: Hiçbir kısıtlama yok
2. **Provider Agnostik**: Her modelle çalışır
3. **Lokal Öncelikli**: Ollama birincil provider
4. **Kullanıcı Sorumluluğu**: Kullanıcı ne yaptığını bilir
5. **Açık Kaynak**: Tamamen şeffaf
6. **Public Domain**: Unlicense - istediğini yap

---

**🔴 RedCLAude - Çalıştır. Değiştir. Özgürleştir.**
