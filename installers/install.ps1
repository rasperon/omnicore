# Admin yetkisi kontrolü
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "Bu script'in yönetici olarak çalıştırılması gerekiyor. Yönetici olarak yeniden başlatılıyor..."
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

Write-Host "OmniCore Installer" -ForegroundColor Blue
Write-Host "==============================`n"

# Go'nun yüklü olup olmadığını kontrol et
if (!(Get-Command go -ErrorAction SilentlyContinue)) {
    Write-Host "Go yüklü değil. Lütfen önce Go'yu yükleyin: https://golang.org/doc/install"
    Exit 1
}

# Gerekli dizinleri oluştur
$omnicoreDir = "$env:USERPROFILE\.omnicore"
New-Item -ItemType Directory -Force -Path $omnicoreDir | Out-Null

# Binary'yi indir
Write-Host "OmniCore indiriliyor..."
$url = "https://github.com/rasperon/omnicore/releases/latest/download/omnicore-windows-amd64.exe"
$output = "$omnicoreDir\omnicore.exe"
Invoke-WebRequest -Uri $url -OutFile $output

# PATH'e ekle
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$omnicoreDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$omnicoreDir", "User")
}

Write-Host "`nKurulum tamamlandı!" -ForegroundColor Green
Write-Host "OmniCore'u kullanmaya başlamak için yeni bir PowerShell penceresi açın."
Write-Host "`nKullanım: omnicore [komut]"

Read-Host -Prompt "Çıkmak için Enter'a basın" 