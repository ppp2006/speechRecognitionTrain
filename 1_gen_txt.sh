#!/bin/bash

if [ $# -lt 1 ];then
echo "Invalid param list"
echo "Usage: ./1_gen_txt.sh robot.ori"
exit
fi
name=$(echo $1 |sed 's/\.\w*\b//')
echo $name
rm $name.txt
line=0;
while read SEQ LINE;do
#	if [ $line -eq 0 ];then
#	let line+=1;
#	continue;
#	fi
	let line+=1;
#	echo $LINE;
	echo ""$SEQ" <s> "$LINE" </s>">> ./$name.txt; 
done <$name.ori
