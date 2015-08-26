#########################################################################
# File Name: rec_wav.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 2014年03月24日 星期一 17时07分48秒
#########################################################################
#!/bin/bash
begin=$1
end=$2
file=$3
for i in $(seq 1 $end)
do
#	echo "Welcome $i times"
    if [ "$i" -l "$begin" ]
    then echo "ignored $i times !!";
         read sent;
    else
          fn=$(printf voice_%04d $i);
	  read sent; echo $sent;echo $fn;echo $i;
	  rec -r 16000 -e signed-integer -b 16 -c 1 $fn.wav 2>/dev/null;
    fi
done < $file
