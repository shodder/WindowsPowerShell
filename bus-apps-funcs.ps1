
function Start-Domain {
    param(
        [String]$DomainNumber="1",
        [String]$Debug=$false,
        [String]$LaunchAdminWindow=$true
    )
    Push-Location "C:\payara\installations\payara-4.1.2.172\payara41\bin"

    $debugSwitch = ""
    if ($debug) {
        $debugSwitch = "--debug"
    }

    .\asadmin.bat start-domain $debugSwitch --domaindir C:\payara\domains "domain$DomainNumber"
    if ($LaunchAdminWindow) {
        Open-PayaraAdmin -DomainNumber $DomainNumber
    }

    Pop-Location
}

function Stop-Domain {
    param(
        [String]$DomainNumber="1"
    )

    Push-Location "C:\payara\installations\payara-4.1.2.172\payara41\bin"
    .\asadmin.bat stop-domain --domaindir C:\payara\domains "domain$DomainNumber"
    Pop-Location
}

function Restart-Domain {
    param(
        [String]$DomainNumber="1",
        [String]$Debug=$false,
        [String]$LaunchAdminWindow=$true
    )
    Stop-Domain -DomainNumber $DomainNumber
    Start-Domain -DomainNumber $DomainNumber -Debug $Debug -LaunchAdminWindow $LaunchAdminWindow
}

function Open-PayaraAdmin {
    param(
        [String]$Url="http://localhost",
        [String]$DomainNumber="1"
    )
    if ($DomainNumber -eq "1") {
        $urlWithPort = $Url + ":4848"
    } else {
        $urlWithPort = $Url + ":15562"
    }

    & "C:\Program Files\Mozilla Firefox\firefox.exe" $urlWithPort
}

function Open-Repo {
    param(
        [String]$Repo="Users"
    )

    $url = "https://www.github.com/isisbusapps/" + $Repo
    & "C:\Program Files\Mozilla Firefox\firefox.exe" $url
}

New-Alias -Name github -Value Open-Repo -Force -Option AllScope

function Start-VisualStudioAsAdmin {
    param(
        [String]$Credential='clrc\mhr3934903'
    )

    $vsPath =  'C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\devenv.exe'
    $cmd = "-noprofile -command &{Start-Process '$vsPath' -verb runas}"
    Start-Process PowerShell -Credential $Credential -ArgumentList $cmd
}

New-Alias -Name vsadmin -Value Start-VisualStudioAsAdmin -Force -Option AllScope


function Start-InTheMorning {
    & "C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE"
    & "C:\Program Files\Mozilla Firefox\firefox.exe" 'https://www.gmail.com' 'https://trello.com/b/o1PxTdzd/init' 'https://github.com/orgs/isisbusapps/dashboard'
}

New-Alias -Name start -Value Start-InTheMorning -Force -Option AllScope

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
function releasenotes { Set-Location $releasenotes }

function onedrive {
    cd 'C:\Users\mhr39349\OneDrive - Science and Technology Facilities Council'
    explorer .
}

function Run-OracleDev {
    & 'C:\Users\mhr39349\programs\oracle-developer\sqldeveloper.exe'
}

New-Alias -Name oracledev -Value Run-OracleDev -Force -Option AllScope
