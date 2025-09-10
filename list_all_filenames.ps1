# Script: list_all_filenames.ps1
# Purpose: List only .flac, .mp3, and .wav filenames (with extensions) in all subfolders, ready for Google Sheets

# Allowed music extensions
$musicExtensions = @(".flac", ".mp3", ".wav")

# Get all files recursively, filter by extensions
$allFiles = Get-ChildItem -Recurse -File | Where-Object { $musicExtensions -contains $_.Extension.ToLower() } | Select-Object -ExpandProperty Name

# Sort alphabetically
$allFiles = $allFiles | Sort-Object

# Output to text file
$outFile = "all_music_filenames.txt"
$allFiles | Set-Content $outFile

Write-Host "`nAll music filenames exported to $outFile"
