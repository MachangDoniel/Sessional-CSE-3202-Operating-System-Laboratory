#!/bin/bash

folder_cnt=0
file_cnt=0

while IFS= read -r read_line; 
do
    if [[ $read_line == "fileName"* ]]; 
    then
        ((file_cnt++))
    elif [[ $read_line == "folderName"* ]]; 
    then
        ((folder_cnt++))
    fi
done < "p.txt"

echo "Folders: $folder_cnt"
echo "Files: $file_cnt"

for ((i=1; i<=folder_cnt; i++)); 
do
    mkdir "folder$i"
done

for ((i=1; i<=file_cnt; i++)); 
do
    touch "file$i.extension"
done

# Now, rename the files with the respective extensions
file_index=0
while IFS= read -r line; do
    if [[ $line == "fileName"* ]]; then
        extension=$(echo "$line" | cut -d ' ' -f 2 | cut -d '.' -f 2)
        mv "file$((++file_index)).extension" "file$file_index.$extension"
    fi
done < "p.txt"

