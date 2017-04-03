# Load posh-git example profile
# . 'C:\Users\mhr39349\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load posh-git module from current directory
#Import-Module .\Modules\posh-git

# If module is installed in a default location ($env:PSModulePath),
# use this instead (see about_Modules for more information):
Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($env:username) -nonewline -foregroundcolor 'magenta'
    Write-Host(' at ') -nonewline -foregroundcolor 'white'
    Write-Host($env:computername) -nonewline -foregroundcolor 'yellow'
    Write-Host(' in ') -nonewline -foregroundcolor 'white'
    Write-Host($pwd.ProviderPath) -nonewline -foregroundcolor 'green'

    Write-VcsStatus
    Write-Host("")

    $global:LASTEXITCODE = $realLASTEXITCODE
    return ">_ "
}

###########################
# Import my funcs
# File must be in same loc
###########################
Import-Module .\remote-funcs.ps1 -Force
Import-Module .\vim-funcs.ps1 -Force
Import-Module .\childitem-colors.ps1 -Force
Import-Module .\ps-readline-settings.ps1 -Force
Import-Module .\git-funcs.ps1 -Force

# Always import aliases last as they can rely
# on functions in custom .ps1 files
Import-Module .\aliases.ps1 -Force

Pop-Location

Start-SshAgent -Quiet


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
