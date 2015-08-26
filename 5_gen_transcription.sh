#!/bin/bash
if [ $# -lt 1 ];then
echo "Usage: ./4_gen_transcription.sh robot.ori"
exit
fi
name=$(echo $1 |sed 's/\.\w*\b//')
echo $name

IFS='/'
loop=0;
rm $name.transcription
while read voice number fileid; do
#let loop+=1;
((loop++));
seqnumber=${fileid#*_};
let y=10#$seqnumber;
#echo "$loop $y";
awk ' $1 =='$y' {$1="";print $0 " (" "'"$fileid"'" ")" }' $name.txt >>$name.transcription;
done < $name.fileids

