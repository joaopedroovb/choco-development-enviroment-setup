### Development Environment Setup with Chocolatey
    
1. Abra o **PowerShell como Administrator**
2. Cole esse bloco de comando único:

```    
Set-ExecutionPolicy Bypass -Scope Process -Force
iex "& { $(irm https://community.chocolatey.org/install.ps1) }"
choco install git -y
git clone https://github.com/joaopedroovb/choco-development-enviroment-setup.git $env:USERPROFILE\dotfiles
cd $env:USERPROFILE\dotfiles
powershell -ExecutionPolicy Bypass -File .\setup-windows.ps1
```
