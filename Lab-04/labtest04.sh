
while IFS= read -r read_line; 
do
    if [[ $read_line == "filename"* ]]; 
    then
        touch ${read_line:10:${#read_line}-10}
    elif [[ $read_line == "foldername"* ]]; 
    then
	mkdir ${read_line:12:${#read_line}-12}
    fi
done < "input.txt"

mv *.sh shFolder/
mv *.txt txtFolder/
mv *.doc OthersFolder/
