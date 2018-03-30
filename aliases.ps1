
###########################
# Commands
###########################

# Set unix-like which
Set-Alias which Get-Command

# set unix-like ls functions (using functions from childitem-colors.ps1
Set-Alias ls Get-ChildItem-Color -option AllScope
Set-Alias l Get-ChildItem-Format-Wide -option AllScope


# set unix-like tail
Function tail {
    param(
      [String]$File
    )

    Get-Content -Tail 10 -Wait -Path $File
}

if (Test-Path alias:touch) {
    Remove-Item alias:touch
}

# set unix-like touch
function touch {
    param(
      [String]$Path
    )

    New-Item -Type File -Path $Path
}


# unix like find
function find {
    param(
        [String]$Pattern,
        [Switch]$PathOnly
    )

    if ($PathOnly ) {
        Get-ChildItem -Recurse | Select-String -Pattern $Pattern | Select-Object {"$($_.Path)::$($_.LineNumber)"} | Format-Table -AutoSize
    } else {
        Get-ChildItem -Recurse | Select-String -Pattern $Pattern | Select-Object {"File::$($_.Path)`r`nLine-No::$($_.LineNumber)`r`n$($_.Line)`r`n" }  | Format-Table -Wrap 
    }
}

###########################
# Shortcuts
###########################
$workspace = Join-Path -Path $HOME -ChildPath 'workspace'
$scratch = Join-Path -Path $workspace -ChildPath 'scratch'
$bus = Join-Path -Path $workspace -ChildPath 'isisbusapps'
$si = Join-Path -Path $bus -ChildPath 'sisites'
$users = Join-Path -Path $bus -ChildPath 'Users'

$ps = Join-Path -Path $HOME -ChildPath 'Documents/WindowsPowerShell'
$dots = Join-Path -Path $HOME -ChildPath 'dotfiles'

# Shortcut functions
function ws { Set-Location $workspace }
function scratch { Set-Location $scratch }
function bus { Set-Location $bus }
function sites { Set-Location $si }
function users { Set-Location $users }
function dots { Set-Location $dots }
function pshome { Set-Location $ps }
function gogo { Set-Location $env:GOPATH }


