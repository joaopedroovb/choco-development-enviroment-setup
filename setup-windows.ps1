if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey não encontrado. Instalando..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey já está instalado."
}

choco install ChocolateyGUI -y
choco install git -y
choco install gnupg -y
choco install nodejs-lts -y
choco install microsoft-openjdk17 -y
choco install dotnetfx --pre -y
choco install notesnook -y
choco install librewolf -y
choco install vscode -y
choco install dbeaver -y
choco install insomnia-rest-api-client -y
choco install postgresql -y
choco install googledrive -y
choco install rustdesk -y
choco install scrcpy -y
choco install tutanota -y
choco install telegram -y
choco install teamviewer -y
choco install localsend -y
choco install jetbrainsmono -y
choco install python --pre -y
choco install onlyoffice -y

$dotfilesRepo = "https://github.com/joaopedroovb/choco-development-enviroment-setup.git"
$dotfilesPath = "$env:USERPROFILE\dotfiles"

if (-not (Test-Path $dotfilesPath)) {
    git clone $dotfilesRepo $dotfilesPath
} else {
    Write-Host "`nDotfiles já estão clonados em $dotfilesPath"
}

$gitconfigSource = Join-Path $dotfilesPath ".gitconfig"
$gitconfigTarget = Join-Path $env:USERPROFILE ".gitconfig"

if (Test-Path $gitconfigTarget) {
    Remove-Item $gitconfigTarget -Force
}

if (Test-Path $gitconfigSource) {
    New-Item -ItemType SymbolicLink -Path $gitconfigTarget -Target $gitconfigSource
    Write-Host "Link criado: $gitconfigTarget → $gitconfigSource"
}
