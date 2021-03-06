@{ 
    Path = "WorkdayApi.psd1"
    OutputDirectory = "..\Output\"
    VersionedOutputDirectory = $True
    CopyDirectories = @('en-US')
    Prefix = @'
    $WorkdayConfiguration = @{
        Endpoints = @{
            Human_Resources = $null
            Integrations    = $null
            Staffing        = $null
        }
        Credential = $null
    }
    
    $WorkdayConfigurationFile = Join-Path $env:LOCALAPPDATA WorkdayConfiguration.clixml
    if (Test-Path $WorkdayConfigurationFile) {
        $WorkdayConfiguration = Import-Clixml $WorkdayConfigurationFile
    } Else {
        $WorkdayConfigurationFile = 'D:\SCRIPTS\SUE\WORKDAY\WORKDAYCONFIGURATION.clixml'
        If (Test-Path $WorkdayConfigurationFile) {
            $WorkdayConfiguration = Import-Clixml $WorkdayConfigurationFile
        }
    }
    
    # Get-ChildItem "$PSScriptRoot/scripts/*.ps1" | foreach { . $_ }
    
    $NM = New-Object System.Xml.XmlNamespaceManager -ArgumentList (New-Object System.Xml.NameTable)
    $NM.AddNamespace('wd','urn:com.workday/bsvc')
    $NM.AddNamespace('bsvc','urn:com.workday/bsvc')
    
    Enable-TLS -Tls12 -Confirm:$false
'@
}