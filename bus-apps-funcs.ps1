
function Start-Domain {
    param(
        [String]$DomainNumber="1"
    )
    Set-Location "C:\payara\installations\payara-4.1.2.172\payara41\bin"
    .\asadmin.bat start-domain --domaindir C:\payara\domains "domain$DomainNumber"
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
        [String]$DomainNumber="1"
    )
    Set-Location "C:\payara\installations\payara-4.1.2.172\payara41\bin"
    .\asadmin.bat stop-domain --domaindir C:\payara\domains "domain$DomainNumber"
    .\asadmin.bat start-domain --domaindir C:\payara\domains "domain$DomainNumber"
}
