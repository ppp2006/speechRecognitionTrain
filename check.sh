#!/bin/bash 

echo "Employee Names:"
echo "---------------"
IFS=' '
while read word1  word2 word3 word4 ;do
echo "word1=$word1;word2=$word2;word3=$word3;word4=$word4 "
     IFS='/'
     while read voice number fileid; do
     #if
     echo "voice=$voice;number=$number;fileid=$fileid "
     #fi 
     done < $1
#    echo "$word1 $IFS $word2 $IFS $word3 $IFS $word4 "
#    echo "$word1 :$word2 :$word3 :$word4 "
#    echo "$word1 $word2 $word3 $word4 "
IFS=' ' 
done < $2
