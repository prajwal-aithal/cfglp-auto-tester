#!/bin/bash

optionslen=0
inputlen=0

read -r standard_impl
read -r user_impl
read -r output_fold
read -r user_output
read -r standard_output
read -r line

while read -r line
do
	if [[ $line = "--" ]]; then
		break;
	else
		options[$optionslen]=$line
		optionslen=$(($optionslen+1))
	fi
done

while read -r line
do
	input_fold[$inputlen]=$line
	inputlen=$(($inputlen+1))
done

echo "\$\$ Running cfglp-auto-tester"
echo ""

echo "Options are... "
for (( j=0;j<$optionslen;j++ ))
do
	echo "  "${options[$j]}
done
echo ""
echo "Input folders are... "
for (( i=0;i<$inputlen;i++ ))
do
	echo "  "${input_fold[$i]}
done
echo ""

echo "###################"
for (( i=0;i<$inputlen;i++ ))
do
	curr_fold=${input_fold[$i]}
	for inputfile in $(ls "$curr_fold");
	do
		echo "Running cfglp on file -" $inputfile
		for (( j=0;j<$optionslen;j++ ))
		do
			echo ">> Executing option -" ${options[$j]}
			echo "==========================="
			`"${user_impl}" ${options[$j]} -d "${curr_fold}""${inputfile}" > "${output_fold}""${user_output}"`
			echo "---------------------------"
			`"${standard_impl}" ${options[$j]} -d "${curr_fold}""${inputfile}" > "${output_fold}""${standard_output}"`
			echo "==========================="
			`meld "${output_fold}""${user_output}" "${output_fold}""${standard_output}"`
		done
	done
done

echo "###################"
echo "Deleting the output files..."
`rm "${output_fold}""${user_output}"`
`rm "${output_fold}""${standard_output}"`
echo "Done...!!!"
