
###########################
# SHAREPOINT
###########################
$DevServer2 = 'fitnlabsspdev2.isis.cclrc.ac.uk'

Function Enter-SP([String]$server=$DevServer2)
{
    Enter-PSSession -computername $server
}

Function Add-SP
{
    Add-PSSnappin microsoft.sharepoint.powershell
}


