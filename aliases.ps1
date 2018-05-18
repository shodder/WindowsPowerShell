
###########################
# Commands
###########################

# Set unix-like which
Set-Alias which Get-Command

# set unix-like ls functions (using functions from childitem-colors.ps1
Set-Alias ls Get-ChildItem-Color -option AllScope
Set-Alias l Get-ChildItem-Format-Wide -option AllScope

# set unix like pushd and popd
Set-Alias pushd Push-Location -option AllScope
Set-Alias popd Pop-Location -option AllScope


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

# unix like ag
function ag {
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

# unix like find
function find {
    param(
        [Parameter(Mandatory=$true)]
        [String] $Path,
        [Parameter(Mandatory=$true)]
        [String] $Pattern,
        [Switch] $Recurse
    )

    

    if ($Recurse) {
        Get-ChildItem $Path -Recurse | Where{$_.Name -Match [Regex]::Escape($Pattern)}
    } else {
        Get-ChildItem $Path | Where{$_.Name -Match [Regex]::Escape($Pattern)}
    }
}
