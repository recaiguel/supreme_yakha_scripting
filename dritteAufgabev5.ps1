# Hardware config

# To dos:

# - Questions for components
# - Ask qustions in loop
# - We can skip Qustions
# - Output the questions and the answers in a sorted list

# Bonus:

# - Saves the config as json file
# - Compress the file in a zip-archive
# - Push the unzipped file to git
#
#--------------------------------------------------------------------

# Questions----------------------------------------------------------

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'

$askForComponents = @{
cpu = "Was für ein Prozessor hat dein Rechner?";
gpu = "Was für eine Grafikkarte hat dein Rechner?"; 
vram = "Wie viel Videospeicher hat deine GPU?";
ram = "Wie viel Arbeitsspeicher hat dein Rechner?"; 
ssd = "Wie groß ist dein SSD Speicher?";
mb = "Was für ein Mainboard hast du in deinem Rechner?"}

$theConfig = @{}

# Query and answer options-------------------------------------------
foreach ($Questions in $askForComponents.GetEnumerator()) {
    $comp = $Questions.Name
    $question = $Questions.Value
    $theConfig[$comp] = Read-Host $question 
}

# Outputs the Input at the terminal----------------------------------
$theConfig = ConvertTo-Json $theConfig

Write-Host $theConfig


# Saves the Input In an JSON-File------------------------------------
$jsonDestination = Read-Host "Wo soll die Datei gespeichert werden?"

Out-File -FilePath $jsonDestination -InputObject $theConfig