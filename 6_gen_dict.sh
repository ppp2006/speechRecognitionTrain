#!/bin/bash
#if [ $# -lt 1 ];then
#echo "Invalid param list"
#echo "Usage: ./1_gen_txt.sh arctic20.ori"
#exit
#fi
#cat robot.ori |python gen_tone.py >robot.dic
#awk '{$1="";print}' robot.ori |python gen_tone.py >robot.dic
awk '{for(i=2;i<=NF;i++)
{
if(i<NF){print "%s",$i}
else {print $i}
}
}' robot.ori |python gen_tone.py >robot.dic
