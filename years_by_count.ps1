# Script: years_by_count.ps1
# Purpose: List all years present in filenames, sorted by most appearances, with percentages

# Allowed music extensions
$musicExtensions = @(".flac", ".mp3", ".wav")

# Get all music files
$allFiles = Get-ChildItem -Recurse -File | Where-Object { $musicExtensions -contains $_.Extension.ToLower() } | Select-Object -ExpandProperty Name

# Dictionary for year counts
$yearCounts = @{}

foreach ($file in $allFiles) {
    if ($file -match "^\[(\d{4})\]") {
        $year = $matches[1]
        if ($yearCounts.ContainsKey($year)) {
            $yearCounts[$year] += 1
        } else {
            $yearCounts[$year] = 1
        }
    }
}

# Total files
$total = $allFiles.Count

# Sort descending by count
$sortedYears = $yearCounts.GetEnumerator() | Sort-Object Value -Descending

# Display numbered list with percentages
Write-Host "`nYears by number of appearances:`n"
$i = 1
foreach ($entry in $sortedYears) {
    $percent = if ($total -ne 0) { [math]::Round(($entry.Value / $total) * 100, 2) } else { 0 }
    Write-Host "$i. $($entry.Key): $($entry.Value) files ($percent`%)"
    $i++
}

Write-Host "`nDone."
