file_cnt=0
folder_cnt=0

while IFS= read -r line; 
do
    if [[ $line == "fileName"* ]]; then
        ((file_cnt++))
    elif [[ $line == "folderName"* ]]; then
        ((folder_cnt++))
    fi
done < "p.txt"

echo "Number of files: $file_cnt"
echo "Number of folders: $folder_cnt"





for ((i=1; i<=folder_cnt; i++)); do
    mkdir "folder$i"
done


for ((i=1; i<=file_cnt; i++)); do
    mkdir "file$i"
done
