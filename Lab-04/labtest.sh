
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

while IFS= read -r read_line; 
do
    if [[ $read_line == "filename"* && $read_line == *".sh" ]]; 
    then
        mv ${read_line:10:${#read_line}-10} shFolder/
    elif [[ $read_line == "filename"* && $read_line == *".txt" ]]; 
    then
	mv ${read_line:10:${#read_line}-10} txtFolder/
    elif [[ $read_line == "filename"* ]]; 
    then
	mv ${read_line:10:${#read_line}-10} OthersFolder/
    fi
done < "input.txt"
