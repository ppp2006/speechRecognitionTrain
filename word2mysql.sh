#!/bin/bash
##############################
# @file create_db_mysql.sh
# @brief create database and tables in mysql
# @author Mingxing LAI
# @version 0.1
# @date 2013-01-20
##############################
USER="root"
DATABASE="RJRecording"
TABLE="wordinfo"
######################
#crate database
mysql -u $USER << EOF 2>/dev/null
CREATE DATABASE $DATABASE
EOF
[ $? -eq 0 ] && echo "created DB" || echo DB already exists
######################
#create table
mysql -u $USER $DATABASE << EOF 2>/dev/null
CREATE TABLE $TABLE(
wordid bigint(20),
content varchar(250),
addtime datetime,
remark varchar(100)
);
EOF
#IFS=" "
#DATETIME=`date +%Y-%m-%d %H:%M:%S`;
DATETIME=`date "+%Y-%m-%d %H:%M:%S"`;
echo $DATETIME;
[ $? -eq 0 ] && echo "Created table $TABLE" || echo "Table $TABLE already exist" 
data=$1
loop=1;
while  read line;
do
    query=`echo $line | awk '{ printf("%d,\"%s\",\"%s\",\"%s\"", "'"$loop"'", $2, "'"$DATETIME"'", "remark")}'`
    let loop+=1;
    echo $query;
    statement=`echo "INSERT INTO $TABLE VALUES($query);"`

mysql -u $USER $DATABASE << EOF
    INSERT INTO $TABLE VALUES($query);
EOF
done < $data
