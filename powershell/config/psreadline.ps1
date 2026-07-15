# Histórico
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -MaximumHistoryCount 10000

# Editar como no Bash
Set-PSReadLineOption -EditMode Windows

# Ctrl+D apaga o caractere
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteChar

# Ctrl+Backspace apaga a palavra
Set-PSReadLineKeyHandler -Chord Ctrl+Backspace -Function BackwardKillWord

# Ctrl+R abre o FZF
Set-PsFzfOption -PSReadlineChordProvider Ctrl+t
Set-PsFzfOption -PSReadlineChordReverseHistory Ctrl+r
