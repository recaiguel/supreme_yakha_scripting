Param(
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    [string]$Path
)
    New-Item $Path
    Write-Host "File created at path $Path"