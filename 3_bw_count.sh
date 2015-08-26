#########################################################################
# File Name: bw_count.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 2014年03月28日 星期五 15时01分42秒
#########################################################################
#!/bin/bash
if [ $# -lt 1 ];then
echo "Invalid param list"
echo "Usage: ./bw_count.sh robot.ori!! trim .ori"
exit
fi

name=$(echo $1 |sed 's/\.\w*\b//')
echo $name
./bw -hmmdir tdt_sc_8k -moddeffn tdt_sc_8k/mdef.txt -ts2cbfn .semi. -feat 1s_c_d_dd -svspec 0-12/13-25/26-38 -cmn current -agc none -dictfn $name.dic -ctlfn $name.fileids -lsnfn $name.transcription -accumdir .
