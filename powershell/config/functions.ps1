function ll {
        eza -lah --icons
}
function touch {
        param($name)

        New-Item $name -ItemType File
}
function mkcd {
        param($name)

        mkdir $name

        cd $name
}
function reload {
        . $PROFILE
        Write-Host "PowerShell recarregado!" -ForegroundColor Green
}
