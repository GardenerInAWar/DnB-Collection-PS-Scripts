# Script: top25_artists.ps1
# Purpose: List top 25 artists by number of appearances (including collaborations)

# Get all music files
$musicExtensions = @(".flac", ".mp3", ".wav")
$allFiles = Get-ChildItem -Recurse -File | Where-Object { $musicExtensions -contains $_.Extension.ToLower() } | Select-Object -ExpandProperty Name

# Dictionary to hold counts
$artistCounts = @{}

foreach ($file in $allFiles) {
    # Extract artist part (after year bracket and space, before first ' - ')
    if ($file -match "\[\d{4}\]\s(.+?)\s-\s") {
        $artistsStr = $matches[1]
        # Split multiple artists by comma
        $artists = $artistsStr -split ",\s*"
        foreach ($artist in $artists) {
            $artistLower = $artist.ToLower()
            if ($artistCounts.ContainsKey($artistLower)) {
                $artistCounts[$artistLower] += 1
            } else {
                $artistCounts[$artistLower] = 1
            }
        }
    }
}

# Sort descending and take top 25
$top25 = $artistCounts.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 25

# Display nicely
Write-Host "`nTop 25 Artists by Appearances:`n"
$i = 1
foreach ($entry in $top25) {
    Write-Host "$i. $($entry.Key) ($($entry.Value))"
    $i++
}

Write-Host "`nDone."
