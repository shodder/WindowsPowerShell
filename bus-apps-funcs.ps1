
function Start-Domain {
    param(
        [String]$DomainNumber="1",
        [String]$Debug=$false,
        [String]$LaunchAdminWindow=$true
    )
    Set-Location "C:\payara\installations\payara-4.1.2.172\payara41\bin"

    $debugSwitch = ""
    if ($debug) {
        $debugSwitch = "--debug"
    }

    .\asadmin.bat start-domain $debugSwitch --domaindir C:\payara\domains "domain$DomainNumber"
    if ($LaunchAdminWindow) {
        Open-PayaraAdmin
    }
}

function Stop-Domain {
    param(
        [String]$DomainNumber="1"
    )
    Set-Location "C:\payara\installations\payara-4.1.2.172\payara41\bin"
    .\asadmin.bat stop-domain --domaindir C:\payara\domains "domain$DomainNumber"
}

function Restart-Domain {
    param(
        [String]$DomainNumber="1",
        [String]$Debug=$false,
        [String]$LaunchAdminWindow=$true
    )
    Stop-Domain
    Start-Domain `
        -DomainNumber $DomainNumber `
        -Debug $Debug `
        -LaunchAdminWindow $LaunchAdminWindow
}

function Open-PayaraAdmin {
    param(
        [String]$Url="http://localhost:4848"
    )
    & "C:\Program Files\Mozilla Firefox\firefox.exe" $Url
}


###########################
# Shortcuts
###########################
$workspace = Join-Path -Path $HOME -ChildPath 'workspace'
$scratch = Join-Path -Path $workspace -ChildPath 'scratch'
$bus = Join-Path -Path $workspace -ChildPath 'isisbusapps'
$si = Join-Path -Path $bus -ChildPath 'sisites'
$users = Join-Path -Path $bus -ChildPath 'Users'
$userofficetools = Join-Path -Path $bus -ChildPath 'UserOfficeTools'
$messages = Join-Path -Path $bus -ChildPath 'Messages'

$ps = Join-Path -Path $HOME -ChildPath 'Documents/WindowsPowerShell'
$dots = Join-Path -Path $HOME -ChildPath 'dotfiles'

$gopath = $env:GOPATH
$releasenotes = Join-Path -Path $env:GOPATH -ChildPath 'src\github.com\isisbusapps\releasenotesgenerator'

$fbs = 'C:\fbs\apps'
$bissettings = $fbs

# Shortcut functions
function ws { Set-Location $workspace }
function scratch { Set-Location $scratch }
function bus { Set-Location $bus }
function sites { Set-Location $si }
function users { Set-Location $users }
function userofficetools { Set-Location $userofficetools }
function messages { Set-Location $messages }
function dots { Set-Location $dots }
function profile { Set-Location $ps }
function gogo { Set-Location $env:GOPATH }
function releasenotes { Set-Location $releasenotes }
function fbs { Set-Location $fbs }
function bissettings { Set-Location $bissettings }

function onedrive {
    cd 'C:\Users\mhr39349\OneDrive - Science and Technology Facilities Council'
    explorer .
}

function Run-OracleDev {
    & 'C:\Users\mhr39349\programs\oracle-developer\sqldeveloper.exe'
}

New-Alias -Name oracledev -Value Run-OracleDev -Force -Option AllScope
