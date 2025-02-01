#!/bin/bash
MOTD_FILE=~/.motd.txt
INDEX_FILE=~/.motd.index
[ ! -f "$INDEX_FILE" ] && echo 0 > "$INDEX_FILE"
current_index=$(cat "$INDEX_FILE")
total_lines=$(grep -c '^.*$' "$MOTD_FILE" 2>/dev/null)
if (( total_lines == 0 )); then
    echo ".motd.txt was empty (see bashrc) :(" > "$MOTD_FILE"
    total_lines=0
fi
motd=$(sed -n "$((current_index + 1))p" "$MOTD_FILE" | sed 's/NEWLINE/\n/g')
printf "%s\n\n\n\n" "$motd"
next_index=$(( (current_index + 1) % total_lines ))
echo $next_index > "$INDEX_FILE"
# put me in your .bashrc!
# cat motd.sh >> ~/.bashrc
# or reference me in your bashrc!
# echo ~/motd.sh >> ~/.bashrc