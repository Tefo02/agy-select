<#
.SYNOPSIS
    Script de instalação automatizada do agy-select no Windows.
#>
[CmdletBinding()]
param(
    [string]$TargetDir = ""
)

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Instalador agy-select para Windows   " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

function Test-PythonExe($exePath) {
    if (-not $exePath) { return $false }
    try {
        $pinfo = New-Object System.Diagnostics.ProcessStartInfo
        $pinfo.FileName = $exePath
        $pinfo.Arguments = '-c "import sys"'
        $pinfo.RedirectStandardError = $true
        $pinfo.RedirectStandardOutput = $true
        $pinfo.UseShellExecute = $false
        $pinfo.CreateNoWindow = $true
        $p = [System.Diagnostics.Process]::Start($pinfo)
        $p.WaitForExit(3000) | Out-Null
        return ($p.ExitCode -eq 0)
    } catch {
        return $false
    }
}

# 1. Localizar Python funcional
$pythonExe = $null
$commandsToTest = @("python", "py", "python3")
foreach ($cmd in $commandsToTest) {
    if (Get-Command $cmd -ErrorAction SilentlyContinue) {
        if (Test-PythonExe $cmd) {
            $pythonExe = (Get-Command $cmd).Source
            if (-not $pythonExe) { $pythonExe = $cmd }
            break
        }
    }
}

if (-not $pythonExe) {
    $candidates = @(
        "$env:LOCALAPPDATA\Programs\Python\Python313\python.exe",
        "$env:LOCALAPPDATA\Programs\Python\Python312\python.exe",
        "$env:LOCALAPPDATA\Programs\Python\Python311\python.exe",
        "$env:LOCALAPPDATA\Programs\Python\Python310\python.exe",
        "$env:ProgramFiles\Python313\python.exe",
        "$env:ProgramFiles\Python312\python.exe",
        "$env:ProgramFiles\Python311\python.exe",
        "$env:ProgramFiles\Python310\python.exe"
    )
    foreach ($cand in $candidates) {
        if (Test-Path $cand) {
            if (Test-PythonExe $cand) {
                $pythonExe = $cand
                break
            }
        }
    }
}

if (-not $pythonExe) {
    Write-Error "[ERRO] Python 3 funcional não foi localizado. Por favor, instale o Python 3.8+ antes de continuar."
    exit 1
}

Write-Host "[1/3] Python encontrado: $pythonExe" -ForegroundColor Green

# 2. Instalar windows-curses
Write-Host "[2/3] Verificando dependência 'windows-curses'..." -ForegroundColor Yellow
try {
    & $pythonExe -m pip install --quiet windows-curses
    Write-Host "      'windows-curses' verificado com sucesso!" -ForegroundColor Green
} catch {
    Write-Warning "Não foi possível rodar pip automaticamente. Certifique-se de executar 'pip install windows-curses'."
}

# 3. Definir diretório de instalação
if (-not $TargetDir) {
    $agyDefaultBin = Join-Path $env:LOCALAPPDATA "agy\bin"
    if (Test-Path $agyDefaultBin) {
        $TargetDir = $agyDefaultBin
    } else {
        $TargetDir = Join-Path $env:USERPROFILE ".local\bin"
    }
}

Write-Host "[3/3] Instalando binários em: $TargetDir" -ForegroundColor Yellow
if (-not (Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

# Remove agy-select.ps1 legado se existir para evitar que o PowerShell
# dê prioridade ao .ps1 e bloqueie a execução por causa da ExecutionPolicy restrita do Windows
$legacyPs1 = Join-Path $TargetDir "agy-select.ps1"
if (Test-Path $legacyPs1) {
    Remove-Item -Path $legacyPs1 -Force -ErrorAction SilentlyContinue
}

$filesToCopy = @("agy-select", "agy-select.cmd")
foreach ($f in $filesToCopy) {
    $src = Join-Path $PSScriptRoot $f
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination (Join-Path $TargetDir $f) -Force
    }
}

# Verificar se TargetDir está no PATH
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$TargetDir*") {
    Write-Host ""
    Write-Host "DICA: Adicione '$TargetDir' ao seu PATH para executar 'agy-select' de qualquer lugar:" -ForegroundColor Magenta
    Write-Host "    [Environment]::SetEnvironmentVariable('Path', `$env:Path + ';$TargetDir', 'User')" -ForegroundColor Gray
}

Write-Host ""
Write-Host "Instalação concluída com sucesso! 🎉" -ForegroundColor Green
Write-Host "Agora você pode executar 'agy-select' no seu terminal." -ForegroundColor Cyan
