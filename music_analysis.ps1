# Script: music_analysis.ps1
# Purpose: Total music files, counts by type, and percentage of total

# Allowed extensions
$extensions = @(".flac", ".mp3", ".wav")
$counts = @{}

# Count each type
foreach ($ext in $extensions) {
    $files = Get-ChildItem -Recurse -File | Where-Object { $_.Extension.ToLower() -eq $ext }
    $counts[$ext] = $files.Count
}

# Total music files
$total = ($counts.Values | Measure-Object -Sum).Sum
Write-Host "`nTotal music files: $total`n"

# Display counts and percentages
foreach ($ext in $extensions) {
    $name = $ext.ToUpper().TrimStart(".")
    $count = $counts[$ext]
    $percent = if ($total -ne 0) { [math]::Round(($count / $total) * 100, 2) } else { 0 }
    Write-Host "${name}: $count files ($percent%)"
}

Write-Host "`nAnalysis complete."
