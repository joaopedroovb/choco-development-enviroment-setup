if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey não encontrado. Instalando..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
    Write-Host "Chocolatey já está instalado."
}

Write-Host "====> Instalando ChocolateyGUI..."
choco install ChocolateyGUI -y

Write-Host "`n====> Instalando componentes principais..."
choco install git -y
choco install gnupg -y
choco install curl -y
choco install wget -y
choco install nodejs-lts -y
choco install microsoft-openjdk17 -y
choco install dotnetfx --pre -y

Write-Host "`n====> Instalando editores de texto..."
choco install notesnook -y

Write-Host "`n====> Instalando navegadores web..."
choco install firefox -y
choco install librewolf -y

Write-Host "`n====> Instalando ferramentas Git GUI..."
choco install git-fork -y
choco install git-cola -y
choco install gitextensions -y

Write-Host "`n====> Instalando IDEs..."
choco install vscode -y

Write-Host "`n====> Instalando softwares adicionais..."
choco install dbeaver -y
choco install insomnia-rest-api-client -y
choco install postgresql -y
choco install keepass -y
choco install keepassxc -y
choco install googledrive -y
choco install rustdesk -y
choco install scrcpy -y
choco install tutanota -y
choco install telegram -y
choco install teamviewer -y
choco install dropbox --pre -y
choco install localsend -y

Write-Host "`n====> Instalando fontes..."
choco install jetbrainsmono -y

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
