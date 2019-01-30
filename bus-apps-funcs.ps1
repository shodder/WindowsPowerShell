
function Get-PayaraDir {
    param(
        [string]$PayaraVersion="4"
    )

    if ($PayaraVersion -eq "4") {
        return $PAYARA_BIN_DIR="$($env:PAYARA_HOME)\payara41\bin"
    } else {
        return $PAYARA_BIN_DIR="$($env:PAYARA_HOME)\payara-5.183\payara5\bin"
    }
}

function Start-Domain {
    param(
        [String]$DomainNumber="1",
        [String]$Debug=$false,
        [String]$LaunchAdminWindow=$true,
        [string]$PayaraVersion="4"
    )
    Push-Location (Get-PayaraDir $PayaraVersion)

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
        [String]$DomainNumber="1",
        [string]$PayaraVersion="4"
    )

    Push-Location (Get-PayaraDir $PayaraVersion)
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

function Launch-Firefox {
    & 'C:\Program Files\Mozilla Firefox\firefox.exe' `
        'https://mail.protonmail.com/inbox' `
        'https://www.gmail.com' `
        'https://github.com/orgs/isisbusapps/dashboard' `
        'https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+org%3Aisisbusapps+label%3A%22review:+please%22+sort%3Aupdated-asc+-repo%3Aisisbusapps%2Fsandbox' `
        'https://github.com/orgs/isisbusapps/projects/7' `
        'https://github.com/orgs/isisbusapps/projects/9?card_filter_query=author%3Ashodder'
 
}

function Launch-Outlook {
    & 'C:\Program Files (x86)\Microsoft Office\Office16\OUTLOOK.EXE'
}

function Launch-Chrome {
   & 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' `
        'https://trello.com/b/o1PxTdzd/init' `
        'https://tasks.office.com/stfc365.onmicrosoft.com/en-US/Home/Planner' `
        'https://trello.com/b/Mdz1UwRy/busapps-projects' `
        'https://trello.com/b/x07EBJGu/sw-dev'
}

function Launch-CommonApps {
    Launch-Firefox
    Launch-Chrome
    Launch-Outlook
    exit
}

New-Alias -Name launch -Value Launch-CommonApps -Force -Option AllScope

###########################
# Shortcuts
###########################
$workspace = Join-Path -Path $HOME -ChildPath 'workspace'
$scratch = Join-Path -Path $workspace -ChildPath 'scratch'
$busapps = Join-Path -Path $workspace -ChildPath 'isisbusapps'
$si = Join-Path -Path $busapps -ChildPath 'sisites'
$users = Join-Path -Path $busapps -ChildPath 'Users'
$userofficetools = Join-Path -Path $busapps -ChildPath 'UserOfficeTools'
$messages = Join-Path -Path $busapps -ChildPath 'Messages'
$facilitiesSharePoint = Join-Path -Path $busapps -ChildPath 'facilities-sharepoint'

$ps = Join-Path -Path $HOME -ChildPath 'Documents/WindowsPowerShell'
$dots = Join-Path -Path $HOME -ChildPath 'dotfiles'

$gopath = $env:GOPATH
$releasenotes = Join-Path -Path $env:GOPATH -ChildPath 'src\github.com\isisbusapps\releasenotesgenerator'

$fbs = 'C:\fbs\apps'
$bissettings = $fbs

# Shortcut functions
function ws { Set-Location $workspace }
function scratch { Set-Location $scratch }
function busapps { Set-Location $busapps }
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
function facsp { Set-Location $facilitiesSharePoint }

function onedrive {
    cd 'C:\Users\mhr39349\OneDrive - Science and Technology Facilities Council'
    explorer .
}

function Run-OracleDev {
    & 'C:\Users\mhr39349\programs\oracle-developer\sqldeveloper.exe'
}

New-Alias -Name oracledev -Value Run-OracleDev -Force -Option AllScope
