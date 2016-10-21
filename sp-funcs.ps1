
###########################
# SHAREPOINT
###########################

$servers = @{
    'devfe' = 'fitnlabsspdev1.isis.cclrc.ac.uk';
    'dev2' = 'fitnlabsspdev2.isis.cclrc.ac.uk';
    'devapp' = 'fitnlabsspdev3.isis.cclrc.ac.uk';
    'devsql' = 'fitnlabsqldev1.isis.cclrc.ac.uk';
    'prodsql' = 'fitnlabsqldev1.isis.cclrc.ac.uk'
}

Function Enter-SP {
    param(
      [String]$ServerName='dev2'
    )

    $server=$servers.Get_Item($ServerName)
    Write-Host "Server: $server"
    Enter-PSSession -computername $server
}

Function Start-SPRemote {
    param(
      [String]$ServerName='dev2',
      [String]$UserName='clrc\mhr39349'
    )

    $server=$servers.Get_Item($ServerName)

    Start-Process "$env:windir\system32\mstsc.exe" -ArgumentList "/v:$server"

}

