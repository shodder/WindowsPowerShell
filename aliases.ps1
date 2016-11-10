
###########################
# Commands
###########################

# Set unix-like which
Set-Alias which Get-Command

# set unix-like ls functions (using functions from childitem-colors.ps1
Set-Alias ls Get-ChildItem-Color -option AllScope
Set-Alias l Get-ChildItem-Format-Wide -option AllScope



###########################
# Shortcuts
###########################
$workspace = Join-Path -Path $HOME -ChildPath 'workspace'
$isis = Join-Path -Path $workspace -ChildPath 'isisbusapps'
$si = Join-Path -Path $isis -ChildPath 'sisites'

$psConfig = Join-Path -Path $HOME -ChildPath 'Documents/WindowsPowerShell'

$dotfiles = Join-Path -Path $HOME -ChildPath 'dotfiles'
