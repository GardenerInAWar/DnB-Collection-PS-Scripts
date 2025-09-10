# Launcher menu for scripts

# List of scripts
$scripts = @(
    "unique_artist_files.ps1"      # Option 1
    "list_all_filenames.ps1"       # Option 2
    "music_analysis.ps1"           # Option 3
    "top25_artists.ps1"            # Option 4
    "years_by_count.ps1"           # Option 5: Years sorted by most appearances
)

while ($true) {
    # Display numbered menu
    Write-Host "`nAvailable Scripts:"
    for ($i=0; $i -lt $scripts.Length; $i++) {
        Write-Host "$($i+1). $($scripts[$i])"
    }
    Write-Host "0. Exit"

    # Ask for choice
    $choice = Read-Host "Enter the number of the script to run"

    if ($choice -eq '0') { break }

    if ($choice -ge 1 -and $choice -le $scripts.Length) {
        Write-Host "`nRunning $($scripts[$choice-1])..."
        & ".\$($scripts[$choice-1])"
        Write-Host "`nFinished. Press Enter to return to menu."
        Read-Host
    } else {
        Write-Host "Invalid choice, try again.`n"
    }
}
