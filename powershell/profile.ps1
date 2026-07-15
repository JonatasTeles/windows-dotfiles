# ================================
# Modules
# ================================

Import-Module Terminal-Icons
Import-Module PSReadLine
Import-Module PSFzf

# ================================
# Zoxide
# ================================

Invoke-Expression (& { (zoxide init powershell | Out-String) })

# ================================
# Custom configuration
# ================================

. "$PSScriptRoot\config\aliases.ps1"
. "$PSScriptRoot\config\functions.ps1"
. "$PSScriptRoot\config\psreadline.ps1"
. "$PSScriptRoot\config\modules.ps1"
