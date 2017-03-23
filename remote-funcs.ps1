
###########################
# SHAREPOINT
###########################

$servers = @{
    'devapp' = 'fitnlabsspdev1.isis.cclrc.ac.uk';
    'dev2' = 'fitnlabsspdev2.isis.cclrc.ac.uk';
    'devfe' = 'fitnlabsspdev3.isis.cclrc.ac.uk';
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

Function Enter-Session {
    param(
      [String]$ServerName='dev2',
      [String]$UserName='clrc\mhr39349'
    )

    $server=$servers.Get_Item($ServerName)

    Start-Process "$env:windir\system32\mstsc.exe" -ArgumentList "/v:$server"
    $session = New-PSSession $ServerName -Authentication Credssp -Credential clrc\mhr39349
    Enter-PSSession -SessionOption (New-PSSession "fitnlabsspdev3.isis.cclrc.ac.uk" -Authentication Credssp -Credential clrc\mhr39349)
}

