# Step 1: collect all artist counts
$artistCounts = @{}
$allFiles = Get-ChildItem -Recurse -File | Select-Object -ExpandProperty Name

foreach ($file in $allFiles) {
    if ($file -match '^\[\d{4}\] (.+?) -') {
        $artists = $matches[1] -split ',\s*'   # split multiple artists
        foreach ($a in $artists) {
            $akey = $a.ToLower()
            if (-not $artistCounts.ContainsKey($akey)) { $artistCounts[$akey] = 0 }
            $artistCounts[$akey]++
        }
    }
}

# Step 2: output only filenames where all artists appear exactly once
$result = @()
foreach ($file in $allFiles) {
    if ($file -match '^\[\d{4}\] (.+?) -') {
        $artists = $matches[1] -split ',\s*'
        $allUnique = $true
        foreach ($a in $artists) {
            if ($artistCounts[$a.ToLower()] -ne 1) { $allUnique = $false; break }
        }
        if ($allUnique) { $result += $file }
    }
}

# Step 3: write to text file
$result | Set-Content unique_artist_files.txt
