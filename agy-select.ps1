<#
.SYNOPSIS
    Launcher do agy-select para Windows PowerShell.
#>
[CmdletBinding()]
param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$ScriptArgs
)

$env:PYTHONUTF8 = "1"
$env:PYTHONIOENCODING = "utf-8"

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
    Write-Error "[ERRO] Python 3 funcional não foi encontrado no sistema ou no PATH. Instale o Python (v3.8+) ou desative os aliases do WindowsApps."
    exit 1
}

$scriptPath = Join-Path $PSScriptRoot "agy-select"
& $pythonExe $scriptPath @ScriptArgs
exit $LASTEXITCODE
