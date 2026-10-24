@echo off
setlocal
set PYTHONUTF8=1
set PYTHONIOENCODING=utf-8

:: 1. Tenta python padrão testando execução real (ignora alias quebrado da WindowsApps)
python -c "import sys" >nul 2>nul
if %ERRORLEVEL% equ 0 (
    python "%~dp0agy-select" %*
    exit /b %ERRORLEVEL%
)

:: 2. Tenta Python Launcher (py)
py -c "import sys" >nul 2>nul
if %ERRORLEVEL% equ 0 (
    py "%~dp0agy-select" %*
    exit /b %ERRORLEVEL%
)

:: 3. Tenta python3
python3 -c "import sys" >nul 2>nul
if %ERRORLEVEL% equ 0 (
    python3 "%~dp0agy-select" %*
    exit /b %ERRORLEVEL%
)

:: 4. Tenta caminhos padrões de instalação do Python no Windows
for %%P in (
    "%LOCALAPPDATA%\Programs\Python\Python313\python.exe"
    "%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
    "%LOCALAPPDATA%\Programs\Python\Python311\python.exe"
    "%LOCALAPPDATA%\Programs\Python\Python310\python.exe"
    "%ProgramFiles%\Python313\python.exe"
    "%ProgramFiles%\Python312\python.exe"
    "%ProgramFiles%\Python311\python.exe"
    "%ProgramFiles%\Python310\python.exe"
) do (
    if exist %%P (
        %%P "%~dp0agy-select" %*
        exit /b %ERRORLEVEL%
    )
)

echo [ERRO] Python 3 funcional nao foi encontrado no sistema ou no PATH do Windows. >&2
echo Por favor, instale o Python (v3.8+) ou desative o atalho do WindowsApps em: >&2
echo 'Configuracoes > Aplicativos > Configuracoes avancadas de aplicativos > Aliases de execucao de aplicativos'. >&2
exit /b 1
