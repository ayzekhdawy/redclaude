@echo off
REM 🔴 RedClaude Windows Kurulum Scripti

echo ╔════════════════════════════════════╗
echo ║     🔴 RedClaude Kurulum            ║
echo ╚════════════════════════════════════╝
echo.

REM Sistem kontrolü
echo [Sistem kontrolu...]

REM Node.js kontrolu
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [X] Node.js bulunamadi!
    echo Node.js 20+ yukleyin: https://nodejs.org/
    exit /b 1
)

node -v
echo [OK] Node.js mevcut

REM npm kontrolu
where npm >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [X] npm bulunamadi!
    exit /b 1
)

npm -v
echo [OK] npm mevcut

echo.

REM Git kontrolu
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [!] Git bulunamadi (opsiyonel)
) else (
    git --version
    echo [OK] git mevcut
)

echo.

REM Ollama kontrolu (opsiyonel)
where ollama >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [!] Ollama bulunamadi (opsiyonel)
    echo   Lokal modeller icin: https://ollama.com/
) else (
    echo [OK] Ollama mevcut
    ollama list
)

echo.

REM Bagimliliklari yukle
echo [Bagimliliklar yukleniyor...]
call npm install --legacy-peer-deps
if %ERRORLEVEL% NEQ 0 (
    echo [X] Bagimlilik yukleme basarisiz!
    exit /b 1
)

echo [OK] Bagimliliklar yuklendi

echo.

REM Build
echo [Build ediliyor...]
call npm run build
if %ERRORLEVEL% NEQ 0 (
    echo [X] Build basarisiz!
    exit /b 1
)

echo [OK] Build tamamlandi

echo.

REM Global install
echo [Global kurulum?]
set /p GLOBAL="RedClaude'i global olarak kurmak ister misiniz? (e/h): "

if /i "%GLOBAL%"=="e" (
    echo [Global kurulum...]
    call npm install -g .
    if %ERRORLEVEL% NEQ 0 (
        echo [X] Global kurulum basarisiz!
        exit /b 1
    )
    echo [OK] Global kurulum tamamlandi
)

echo.

REM Config olustur
echo [Konfigurasyon...]
set CONFIG_DIR=%USERPROFILE%\.redclaude

if not exist "%CONFIG_DIR%" (
    mkdir "%CONFIG_DIR%"
    echo [OK] Config dizini olusturuldu: %CONFIG_DIR%
)

if not exist "%CONFIG_DIR%\config.json" (
    copy config\default.json "%CONFIG_DIR%\config.json"
    echo [OK] Varsayilan config olusturuldu
)

echo.

REM Test
echo [Test ediliyor...]
node test.js

echo.

REM Basari mesaji
echo ╔════════════════════════════════════╗
echo ║     OK Kurulum Basarili!            ║
echo ╚════════════════════════════════════╝
echo.
echo RedClaude kullanima hazir!
echo.
echo Sonraki adimlar:
echo.

if /i "%GLOBAL%"=="e" (
    echo   1. redclaude --version
    echo   2. redclaude config set provider ollama
    echo   3. redclaude config set model qwen2.5-coder:32b
    echo   4. redclaude
) else (
    echo   1. npm run dev
    echo   2. npm install -g . (opsiyonel)
    echo   3. redclaude
)

echo.
echo Daha fazla bilgi icin:
echo   - docs\QUICKSTART.md
echo   - README.md
echo   - https://github.com/yourusername/redclaude
echo.
echo 🔴 RedClaude - Calistir. Degistir. Ozgurlastir.
echo.

pause
