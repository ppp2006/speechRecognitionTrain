#########################################################################
# File Name: rec_wav.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 2014年03月24日 星期一 17时07分48秒
#########################################################################
#!/bin/bash
if [ $# -lt 3 ];then
echo "Invalid param list"
echo "Usage: rec.sh 1 12 robot.ori"
exit
fi
begin=$1
end=$2
file=$3
echo "begin=$1";echo "end=$2";echo "file=$3";
for i in $(seq 1 $end)
do
#	echo "Welcome $i times"
    read number sent;
    if [ "$number" -lt "$begin" ]
    then echo "ignored $i times !!";
    else
          if [ "$number" -gt "$end" ]
          then exit
          fi
	  fn=$(printf %04d $number);
          echo $i:$number:$sent: $fn;
	  rec -r 16000 -e signed-integer -b 16 -c 1 $fn.wav 2>/dev/null;
    fi
done < $file
