#!/bin/bash

>tmp_standard_output.txt
>tmp_error.txt
errorcode=0
run_number=0

while [ $errorcode -eq 0 ]
do
    run_number=$[$run_number + 1]
    echo "Run : $run_number" | tee tmp_standard_output.txt tmp_error.txt
    ./2_3_script_to_be_run.sh >> tmp_standard_output.txt 2>> tmp_error.txt
    errorcode=$?
    echo "$run_number run done and error code is $errorcode"
    
    echo "*************"
done

echo "Script failed in $run_number -th run"


