Param(
    [string]$Path = './Desktop/app',
    [string]$DestinationPath = './'
)

$date = Get-Date -format "dd-MM-yyyy"
Compress-Archive -Path './app' -CompressionLevel 'Fastest' -DestinationPath "./backup-$date"
Write-Host "Created backup at $('./backup-' + $date + '.zip')"