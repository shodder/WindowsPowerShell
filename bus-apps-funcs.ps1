
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

