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
#delete data
mysql -u $USER $DATABASE << EOF 2>/dev/null
DELETE FROM $TABLE;
EOF
