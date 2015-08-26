#!/bin/bash
#usage: ./3_gen_fileid.sh voice robot.fileid
if [ $# -lt 2 ];then
echo "Invalid param list"
echo "Usage:./3_gen_fileid.sh voice robot.fileids"
exit
fi
allFiles() {
for file in $1/*
do
if [ -d $file ]; then
allFiles $file
else
#if [$file]
filename=$file;
#echo $filename
extension=${filename##*.};
#echo $extension;

#seqnumber=${filename#*_};
#echo $seqnumber
#let y=10#$seqnumber;

if [ "$extension" == "wav" ]; then
    fileids=${filename%.*};
    seqnumber1=${filename#*_};
    seqnumber=${seqnumber1%.wav};
    #echo $seqnumber
    let y=10#$seqnumber;
    #echo $y
   awk -v content=${fileids} ' $1 =='$y' { print content } ' robot.ori
##echo "$basename($file .wav)";
##echo $file;
## echo ${filename%.*}
fi

fi
done
}

allFiles $1 > $2;
#basename($1).fileid;
#while  ;do
#done
