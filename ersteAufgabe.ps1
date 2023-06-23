Param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Benutzername,
    
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [PSCredential]$Passwort
)

$SecurePassword = ConvertTo-SecureString -String $Passwort -AsPlainText -Force

$NeuerBenutzer = New-LocalUser -Name $Benutzername -Password $SecurePassword -FullName $Benutzername -Description "Neuer Benutzer"

if ($NeuerBenutzer) {
    Write-Host "Benutzer $Benutzername wurde erfolgreich angelegt."
} else {
    Write-Host "Fehler beim Anlegen des Benutzers."
}