Param(
    [Parameter(Mandatory=$true, HelpMessage="Geben Sie den Pfad zur Eingabedatei an.")]
    [ValidateNotNullOrEmpty()]
    [string]$EingabeDatei,

    [Parameter(Mandatory=$true, HelpMessage="Geben Sie den Pfad zum Ausgabeordner an.")]
    [ValidateNotNullOrEmpty()]
    [string]$AusgabeOrdner,

    [Parameter(Mandatory=$true, HelpMessage="Geben Sie die Anzahl der Duplikate an.")]
    [ValidateRange(1, [int]::MaxValue)]
    [int]$AnzahlDuplikate
)

# Überprüfen, ob die Eingabedatei vorhanden ist
if (-not (Test-Path -Path $EingabeDatei -PathType Leaf)) {
    Write-Host "Die Eingabedatei existiert nicht. Bitte geben Sie einen gültigen Pfad an."
    return
}

# Überprüfen, ob der Ausgabeordner vorhanden ist. Wenn nicht, erstellen Sie ihn.
if (-not (Test-Path -Path $AusgabeOrdner -PathType Container)) {
    New-Item -ItemType Directory -Path $AusgabeOrdner | Out-Null
}

# Vervielfältigen der Datei
for ($i = 1; $i -le $AnzahlDuplikate; $i++) {
    $KopierteDatei = Join-Path -Path $AusgabeOrdner -ChildPath "Kopie$i-$((Get-Item $EingabeDatei).Name)"
    Copy-Item -Path $EingabeDatei -Destination $KopierteDatei -Force
    Write-Host "Datei $KopierteDatei wurde erstellt."
}