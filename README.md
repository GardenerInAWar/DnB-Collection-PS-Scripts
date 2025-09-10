# DnB-Collection-PS-Scripts
Menu that scrapes folders in Terminal/Powershell for artist and filetype data

These menu commands are based on a specific filename structure. 
If your songs are in a different format, you'll have to modify either your file names or the code to suit - only works as written when all files follow a single naming convention.
All my song filenames are written as such, and interpreted so in the code:
 
[YEAR] Artist - Title [timestamp].extension

[YEAR] Artist, Artist - Title RX (Original Artist) [timestamp].extension

i.e.

[1999] Moving Fusion - Atlantis [128].flac

[2000] Bad Company - Atlantis RX (Moving Fusion) [106].wav

[2001] Andy C, Shimon - Firewire [44].mp3

The scripts only recognize FLAC, MP3, and WAV extensions to prevent counting non-music.
If you have AAC or AIFF etc, you'll have to add those. 

Place all files into top level music folder. 
Right click in same folder, open Terminal/Powershell from context menu to auto-load the filepath.
type .\menu.ps1 and hit enter
type desired menu number and hit enter to see results

Menu Option explanation:
1. unique_artist_files.ps1 - this option finds all artist names that appear only once and creates a text file in the same folder, such that a "one-hit-wonder" list is produced. It is optimized for a google sheets import.

2. list_all_filenames.ps1 - this makes an alphabetized list of all files (flac, mp3, wav) and produces a text file, such that it can be imported into google sheets.

3. music_analysis.ps1 - this shows a total count of all music files (flac, wav, mp3) plus a breakdown of how many of each extension and what percentage of the total, i.e. 4300 files, 2106 Flac (43%), etc etc

4. top25_artists.ps1 - this counts the number of occurrences for each artist name, ranks them by most to least, and lists the top 25 by filename appearance, such that a list of who has the most music in your collection is produced in terminal.

5. years_by_count.ps1 - Following my format where every file begins with [YEAR], i.e. [2014], this counts all years present and lists them by appearance, ranking them by most to least, along with a percentage of the total i.e. 7. [1998] (3% of total)

6. Exit menu

