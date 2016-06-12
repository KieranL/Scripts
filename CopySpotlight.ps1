#Copies all items from the location the Windows Spotlight images are found and changes their file extensions to .jpg
#Output defaults to Pictures folder
param ([string]$OutputPath = $env:USERPROFILE + "\Pictures\Spotlight")

if(!(Test-Path -Path $OutputPath )){
	Write-Host "Output folder does not exist, creating it"
    md $OutputPath
}

if(!$OutputPath.EndsWith("\")) {
	$OutputPath += "\"
}

Write-Host "Copying files to" $OutputPath

Get-ChildItem  -Path $env:LOCALAppData\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets | where {$_.Length -gt 50KB} | Copy-Item -dest {$OutputPath + $_.BaseName + ".jpg" }

Write-Host "File copy complete"
