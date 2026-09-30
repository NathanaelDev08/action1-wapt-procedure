# Audit rapide parc - sans agent, à lancer en admin sur chaque PC
# Usage: powershell -ExecutionPolicy Bypass -File inventaire-rapide.ps1
# Résultat: C:\Temp\audit-$env:COMPUTERNAME.csv

New-Item -ItemType Directory -Force -Path C:\Temp | Out-Null
$os = Get-CimInstance Win32_OperatingSystem
$cs = Get-CimInstance Win32_ComputerSystem
$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$softs = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
  Where-Object { $_.DisplayName } | Select-Object -ExpandProperty DisplayName

[PSCustomObject]@{
  Nom_PC = $env:COMPUTERNAME
  Utilisateur = $cs.UserName
  Fabricant = $cs.Manufacturer
  Modele = $cs.Model
  Numero_Serie = (Get-CimInstance Win32_BIOS).SerialNumber
  OS = "$($os.Caption) $($os.Version)"
  RAM_Go = [math]::Round($cs.TotalPhysicalMemory/1GB)
  DisqueLibre_Go = [math]::Round($disk.FreeSpace/1GB)
  DisqueTotal_Go = [math]::Round($disk.Size/1GB)
  Nb_Logiciels = $softs.Count
  Logiciels = ($softs -join ' | ')
  Date_Audit = Get-Date -Format 'yyyy-MM-dd HH:mm'
} | Export-Csv "C:\Temp\audit-$env:COMPUTERNAME.csv" -NoTypeInformation -Encoding UTF8

Write-Host "OK - fichier genere : C:\Temp\audit-$env:COMPUTERNAME.csv" -ForegroundColor Green
