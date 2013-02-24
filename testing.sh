#!/bin/bash

optionslen=0
inputlen=0

read standard_impl
read user_impl
read output_fold
read user_output
read standard_output
read line

while read line
do
	if [ $line != "--" ]; then
		options[$optionslen]=$line
		optionslen=$(($optionslen+1))
	else
		break;
	fi
done

while read line
do
	input_fold[$inputlen]=$line
	inputlen=$(($inputlen+1))
done

echo "Options are... " ${options[@]}
echo "Input folders are... " ${input_fold[@]}
for (( i=0;i<$inputlen;i++ ))
do
	curr_fold=${input_fold[$i]}
	for inputfile in $(ls $curr_fold);
	do
		echo "###################"
		echo $inputfile
		for (( j=0;j<$optionslen;j++ ))
		do
			echo "==========================="
			`"${user_impl}" "${options[$j]}" -d "${curr_fold}""${inputfile}" > "${output_fold}""${user_output}"`
			echo "---------------------------"
			`"${standard_impl}" "${options[$j]}" -d "${curr_fold}""${inputfile}" > "${output_fold}""${standard_output}"`
			`meld "${output_fold}""${user_output}" "${output_fold}""${standard_output}"`
		done
	done
done
