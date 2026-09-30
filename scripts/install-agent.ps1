# Installation silencieuse agent Action1 - a personnaliser
# 1. Dans console Action1 > Manage > Agents > Instructions, copiez votre URL MSI
# 2. Collez-la ci-dessous a la place de URL_AGENT
# Usage admin: powershell -ExecutionPolicy Bypass -File install-agent.ps1

$URL_AGENT = "https://votre-entreprise.action1.com/agent/Action1_agent.msi"
$Installer = "$env:TEMP\Action1_agent.msi"

Write-Host "Telechargement agent..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $URL_AGENT -OutFile $Installer -UseBasicParsing

Write-Host "Installation silencieuse..." -ForegroundColor Cyan
Start-Process msiexec.exe -ArgumentList "/i `"$Installer`" /qn /norestart" -Wait

Write-Host "OK - verifiez dans console Action1 > Endpoints sous 5 min" -ForegroundColor Green
Remove-Item $Installer -Force -ErrorAction SilentlyContinue
