#! bin/bash

search () {

    
    files=$(find . -type f)
    firstfile=$(find . -type f|head -n 1)
    for file in "$files"; do
	if [[ $firstfile -ot $file ]]; then
	    file="$firstfile"
	fi
    done
    echo "the most recent file is $firstfile"
   

}
