# install.ps1 - Bootstrap do ambiente Windows (windows-dotfiles)

Write-Host "🌑 Configurando ambiente Eclipse..." -ForegroundColor Cyan

# ================================
# 1. Ferramentas via winget
# ================================
$wingetPackages = @(
    "JanDeDobbeleer.OhMyPosh",
    "ajeetdsouza.zoxide",
    "eza-community.eza",
    "BurntSushi.ripgrep.MSVC",
    "sharkdp.fd",
    "sharkdp.bat",
    "Neovim.Neovim"
)

foreach ($pkg in $wingetPackages) {
    Write-Host "→ Instalando $pkg..." -ForegroundColor Yellow
    winget install --id $pkg -s winget --accept-package-agreements --accept-source-agreements
}

# ================================
# 2. Módulos do PowerShell
# ================================
$modules = @("Terminal-Icons", "PSReadLine", "PSFzf")

foreach ($mod in $modules) {
    if (-not (Get-Module -ListAvailable -Name $mod)) {
        Write-Host "→ Instalando módulo $mod..." -ForegroundColor Yellow
        Install-Module -Name $mod -Scope CurrentUser -Force -SkipPublisherCheck
    }
}

# PSFzf também precisa do binário fzf
winget install --id junegunn.fzf -s winget --accept-package-agreements --accept-source-agreements

# ================================
# 3. Conecta o $PROFILE ao repositório
# ================================
$profileDir = Split-Path $PROFILE
if (-not (Test-Path $profileDir)) {
    New-Item -Path $profileDir -ItemType Directory -Force | Out-Null
}

$repoRoot = $PSScriptRoot

$profileContent = @"
. "$repoRoot\powershell\profile.ps1"
oh-my-posh init pwsh --config "$repoRoot\oh-my-posh\eclipse.omp.json" | Invoke-Expression
"@

Set-Content -Path $PROFILE -Value $profileContent -Force

Write-Host "✅ Tudo pronto! Profile configurado em: $PROFILE" -ForegroundColor Green
Write-Host "Reinicie o terminal (ou rode '. `$PROFILE') para aplicar." -ForegroundColor Yellow
