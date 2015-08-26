#for file in $(find . -name "*.wav" -type f);do mv "$file" "0000_$file";done
numberid=$(printf %04d $1);echo $numberid;
for file in $(find . -name "*.wav" -type f -ctime -1 |awk -F'/' '{print $2 }');
do mv "$file" voice/$1/"$numberid"_"$file";done

