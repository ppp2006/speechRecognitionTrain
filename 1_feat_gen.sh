#########################################################################
# File Name: feat_gen.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 2014年03月28日 星期五 14时49分26秒
#########################################################################
#!/bin/bash
if [ $# -lt 1 ];then
echo "Invalid param list"
echo "Usage: ./1_feat_gen.sh *.fileids!!"
exit
fi

sphinx_fe -argfile tdt_sc_8k/feat.params -samprate 16000 -c $1 -di . -do . -ei wav -eo .mfc -mswav yes

