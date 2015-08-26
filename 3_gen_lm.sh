#########################################################################
# File Name: lm.sh
# Author: ma6174
# mail: ma6174@163.com
# Created Time: 2014年03月27日 星期四 10时14分30秒
#########################################################################
#!/bin/bash
if [ $# -lt 1 ];then
echo "Invalid param list"
echo "Usage: ./3_gen_lm.sh robot.txt"
exit
fi
name=$(echo $1 |sed 's/\.txt//')
echo $name
awk '{print $2,$3,$4}' robot.txt |text2wfreq |wfreq2vocab > $name.vocab
#text2wfreq < $1 |wfreq2vocab > $name.vocab
#text2idngram -vocab $name.vocab -idngram $name.idngram <$1
awk '{print $2,$3,$4}' robot.txt |text2idngram -vocab $name.vocab -idngram $name.idngram
idngram2lm -vocab_type 0 -idngram $name.idngram -vocab $name.vocab -arpa $name.arpa
sphinx_lm_convert -i $name.arpa -o $name.lm.DMP
#rm $name.vocab $name.idngram $name.arpa
