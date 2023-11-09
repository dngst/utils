#!/bin/bash

# loop through each season directory
for season_dir in "Season 1" "Season 2" "Season 3" "Season 4"; do
    # move subtitle files from episode folders to the subs folder
    find "$season_dir" -type f -name "*.srt" -exec mv -t "$season_dir/subs" {} +
done
