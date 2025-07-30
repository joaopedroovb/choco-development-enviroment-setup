# choco installation
# https://chocolatey.org/install

Write-Host "=== Creating your development environment! ==="

Write-Host "====> Installing Choco packages..."
choco --version
choco feature enable -name=exitOnRebootDetected
choco install ChocolateyGUI -y

# core components
Write-Host "====> Installing core components..."

choco install git -y
choco install curl -y
choco install wget -y
choco install nodejs-lts -y
choco install microsoft-openjdk17 -y
choco install dotnetfx --pre -y

# text editors
Write-Host "====> Installing text editors..."
choco install notesnook -y

# browsers
Write-Host "====> Installing web browsers..."
choco install firefox -y
choco install librewolf -y

# git gui softwares
Write-Host "====> Installing git gui softwares..."
choco install git-fork -y
choco install git-cola -y
choco install gitextensions -y

# ides
Write-Host "====> Installing IDEs..."
choco install vscode -y

# additional softwares
Write-Host "====> Installing additional softwares..."
choco install dbeaver -y
choco install insomnia-rest-api-client -y
choco install postgresql -y
choco install keepass -y
choco install keepassxc -y
choco install googledrive -y
choco install rustdesk -y
choco install scrcpy -y

Write-Host "=== Your development environment is ready to use! Enjoy! ==="