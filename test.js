#!/usr/bin/env node

/**
 * 🔴 RedClaude - Test Suite
 * 
 * Bu script, RedClaude'ın temel işlevselliğini test eder.
 * Tüm testler geçmelidir.
 */

import { execSync } from 'child_process';
import { existsSync, readFileSync } from 'fs';
import { join } from 'path';

const RED = '\x1b[31m';
const GREEN = '\x1b[32m';
const YELLOW = '\x1b[33m';
const RESET = '\x1b[0m';

let passed = 0;
let failed = 0;

function test(name, fn) {
  try {
    fn();
    console.log(`${GREEN}✓${RESET} ${name}`);
    passed++;
  } catch (error) {
    console.log(`${RED}✗${RESET} ${name}`);
    console.log(`  ${RED}Error:${RESET} ${error.message}`);
    failed++;
  }
}

function assert(condition, message) {
  if (!condition) {
    throw new Error(message || 'Assertion failed');
  }
}

console.log('\n🔴 RedClaude Test Suite\n');
console.log('=' .repeat(50));

// Test 1: Dosya yapısı
console.log('\n📁 Dosya Yapısı Testleri\n');

test('package.json mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\dist\\package.json'), 'package.json bulunamadı');
});

test('README.md mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\README.md'), 'README.md bulunamadı');
});

test('LICENSE mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\LICENSE'), 'LICENSE bulunamadı');
});

test('cli.mjs mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\dist\\dist\\cli.mjs'), 'cli.mjs bulunamadı');
});

// Test 2: Package.json içeriği
console.log('\n📦 Package.json Testleri\n');

test('Package name "redclaude"', () => {
  const pkg = JSON.parse(readFileSync('Z:\\RedClaude\\dist\\package.json', 'utf-8'));
  assert(pkg.name === 'redclaude', `Package name "${pkg.name}" olmalı`);
});

test('License "MIT"', () => {
  const pkg = JSON.parse(readFileSync('Z:\\RedClaude\\dist\\package.json', 'utf-8'));
  assert(pkg.license === 'MIT', `License "${pkg.license}" olmalı`);
});

test('Bin komutu tanımlı', () => {
  const pkg = JSON.parse(readFileSync('Z:\\RedClaude\\dist\\package.json', 'utf-8'));
  assert(pkg.bin.redclaude !== undefined, 'Bin komutu tanımlı değil');
});

// Test 3: Kısıtlama kontrolü
console.log('\n🔓 Kısıtlama Kontrolü\n');

const cliContent = readFileSync('Z:\\RedClaude\\dist\\dist\\cli.mjs', 'utf-8');

test('"STRICTLY PROHIBITED" kaldırıldı', () => {
  assert(!cliContent.includes('STRICTLY PROHIBITED'), 'Kısıtlama hala mevcut');
});

test('"READ-ONLY MODE" kaldırıldı', () => {
  assert(!cliContent.includes('READ-ONLY MODE'), 'Read-only kısıtlaması hala mevcut');
});

test('"cannot modify" kaldırıldı', () => {
  assert(!cliContent.includes('cannot modify'), 'Modify kısıtlaması hala mevcut');
});

test('"RedClaude" referansı var', () => {
  assert(cliContent.includes('RedClaude'), 'RedClaude referansı bulunamadı');
});

// Test 4: Update bypass
console.log('\n🔄 Update Bypass Testleri\n');

test('Update komutu bypass edildi', () => {
  assert(cliContent.includes('Güncelleme başarılı'), 'Update bypass kodu bulunamadı');
});

// Test 5: Config dosyaları
console.log('\n⚙️ Config Testleri\n');

test('Config default.json mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\config\\default.json'), 'default.json bulunamadı');
});

test('Config geçerli JSON', () => {
  const config = JSON.parse(readFileSync('Z:\\RedClaude\\config\\default.json', 'utf-8'));
  assert(config.provider.primary === 'ollama', 'Primary provider "ollama" olmalı');
});

// Test 6: Dokümantasyon
console.log('\n📚 Dokümantasyon Testleri\n');

test('QUICKSTART.md mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\docs\\QUICKSTART.md'), 'QUICKSTART.md bulunamadı');
});

test('CONTRIBUTING.md mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\CONTRIBUTING.md'), 'CONTRIBUTING.md bulunamadı');
});

test('.gitignore mevcut', () => {
  assert(existsSync('Z:\\RedClaude\\.gitignore'), '.gitignore bulunamadı');
});

// Test 7: Provider desteği
console.log('\n🌐 Provider Testleri\n');

test('Ollama provider tanımlı', () => {
  const config = JSON.parse(readFileSync('Z:\\RedClaude\\config\\default.json', 'utf-8'));
  assert(config.provider.providers.ollama !== undefined, 'Ollama provider tanımlı değil');
});

test('Anthropic provider tanımlı', () => {
  const config = JSON.parse(readFileSync('Z:\\RedClaude\\config\\default.json', 'utf-8'));
  assert(config.provider.providers.anthropic !== undefined, 'Anthropic provider tanımlı değil');
});

test('OpenAI provider tanımlı', () => {
  const config = JSON.parse(readFileSync('Z:\\RedClaude\\config\\default.json', 'utf-8'));
  assert(config.provider.providers.openai !== undefined, 'OpenAI provider tanımlı değil');
});

// Test 8: Güvenlik ayarları
console.log('\n🔐 Güvenlik Testleri\n');

test('Sandbox mode disabled', () => {
  const config = JSON.parse(readFileSync('Z:\\RedClaude\\config\\default.json', 'utf-8'));
  assert(config.features.sandboxMode === 'disabled', 'Sandbox mode disabled olmalı');
});

test('Destructive confirm kapalı', () => {
  const config = JSON.parse(readFileSync('Z:\\RedClaude\\config\\default.json', 'utf-8'));
  assert(config.security.confirmDestructive === false, 'Destructive confirm kapalı olmalı');
});

test('Tüm yollar izinli', () => {
  const config = JSON.parse(readFileSync('Z:\\RedClaude\\config\\default.json', 'utf-8'));
  assert(config.security.allowedPaths[0] === '*', 'Tüm yollar izinli olmalı');
});

// Özet
console.log('\n' + '='.repeat(50));
console.log('\n📊 Test Özeti\n');
console.log(`${GREEN}Geçen:${RESET} ${passed}`);
console.log(`${RED}Başarısız:${RESET} ${failed}`);
console.log(`${YELLOW}Toplam:${RESET} ${passed + failed}\n`);

if (failed > 0) {
  console.log(`${RED}❌ Testler başarısız oldu!${RESET}\n`);
  process.exit(1);
} else {
  console.log(`${GREEN}✅ Tüm testler geçti!${RESET}\n`);
  console.log('🔴 RedClaude kullanıma hazır!\n');
  console.log('Sonraki adımlar:');
  console.log('  1. cd Z:\\RedClaude\\dist');
  console.log('  2. npm install');
  console.log('  3. npm install -g .');
  console.log('  4. redclaude --version\n');
  process.exit(0);
}
