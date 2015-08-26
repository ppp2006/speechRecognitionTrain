#!/bin/sh
mysqldump -u root RJRecording wordinfo >tmp;
#temp=$1;
awk '$1 ~/^INSERT$/' tmp >tmp1;
awk '$3 ~/^`wordinfo`$/ {$1="";$2="";$3="";$4="";print $0}' tmp1 >tmp;
awk 'BEGIN { RS="\)\,"
 ORS="\n"} {print $0}' tmp >tmp1;
awk -F "," '{print $2}' tmp1 >tmp ;
sed "s/'//g" tmp >tmp1;
