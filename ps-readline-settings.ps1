Import-Module PSReadLine

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000

# History sub-string search
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Tab Completion
Set-PSReadLineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

