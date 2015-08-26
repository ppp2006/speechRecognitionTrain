#!/usr/bin/env python
# -*- coding:utf-8 -*-
#Copyright (C) 2013-2015 Runji
#

import sys
import time
import os
import os.path
import subprocess
import sqlite3

TEMP_LOG_FILE = '/tmp/s.log'
REPORT_FILE = 'report.txt'
DB_FILE = 'speech.db'
TRANS_FILE = 'robot.transcription'
FILE_ID_FILE = 'robot.fileids'

#need 1 arg arg = wav file path
IFLY_IAT_FILE = '/usr/bin/iatdemo' #put libmsc.so to /usr/lib


db_conn = None
report_file = None

def log_report_file(wav_path):
    report_file.write(wav_path+'\n')

def initDB(base_dir):
    global db_conn
    db_path = os.path.join(base_dir, DB_FILE)
    db_conn = sqlite3.connect(db_path)
    c = db_conn.cursor()
    c.execute('SELECT name FROM sqlite_master WHERE type="table" AND name="speech";')
    if c.fetchall() == []:
        c.execute('create table speech(wav_name text primary key not null, user_id text, mod_time text, valid text, sentence text);')
        db_conn.commit()

def inDB(wav_name):
    global db_conn
    c = db_conn.cursor()
    c.execute('select * from speech where wav_name = ?;', [wav_name])
    return 1 == len(c.fetchall())

def addToDB(wav_name, user_id, mod_time, sentence):
    global db_conn
    db_conn.execute('insert into speech (wav_name, user_id, mod_time, valid, sentence) values(?, ?, ?, ?, ?);', [wav_name, user_id, mod_time, 'N', sentence])
    db_conn.commit()

def newerThanDB(wav_name, mod_time):
    global db_conn
    c = db_conn.cursor()
    c.execute('select mod_time from speech where wav_name = ?;', [wav_name])
    last_mod_time = c.fetchone()[0]
    return mod_time > last_mod_time

def validInDB(wav_name):
    global db_conn
    c = db_conn.cursor()
    c.execute('select valid from speech where wav_name = ?;', [wav_name])
    valid = c.fetchone()[0] #fetchone return a list; fetchall return a list of list
    return valid == 'Y'

def updateDB(wav_name, match, mod_time):
    global db_conn
    if match:
        valid = 'Y'
    else:
        valid = 'N'
    db_conn.execute('update speech set valid = ?, mod_time = ? where wav_name = ?;', [valid, mod_time, wav_name])
    db_conn.commit()


def init_all(base_dir):
    global report_file
    report_path = os.path.join(base_dir, REPORT_FILE)
    report_file = open(report_path, 'w')

    initDB(base_dir)

def parse_trans(trans):
    l = trans.split() #' <s> 西安 今天天气 怎么样 </s> (0000_0200)'
    sentence = ''.join(l[1:-2])
    wav_name = l[-1].lstrip('(').rstrip(')')
    return sentence.decode('utf-8'), wav_name.decode('utf-8')

def parse_file_id(file_id):
    user_id = file_id.split('/')[1]
    wav_part_path = file_id.rstrip('\n') + '.wav'
    return user_id, wav_part_path

def loop_all(base_dir):
    trans_path = os.path.join(base_dir, TRANS_FILE)
    trans_f = open(trans_path, 'r')
    file_id_path = os.path.join(base_dir, FILE_ID_FILE)
    file_id_f = open(file_id_path, 'r')
    for trans,file_id in zip(trans_f, file_id_f):
        new_file, modified_file = False, False #flag

        sentence, wav_name = parse_trans(trans)
        user_id, wav_part_path = parse_file_id(file_id)

        wav_path = os.path.join(base_dir, wav_part_path)
        mod_time = os.path.getmtime(wav_path)
        mod_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(mod_time))
        if not inDB(wav_name):
            addToDB(wav_name, user_id, mod_time, sentence)
            new_file = True
        elif newerThanDB(wav_name, mod_time):
            modified_file = True
        if new_file or modified_file:
            if sentence == call_cloud(wav_path):
                updateDB(wav_name, True, mod_time)
            else:
                updateDB(wav_name, False, mod_time)
                log_report_file(wav_path)
        else:
            if not validInDB(wav_name):
                log_report_file(wav_path)
                
def call_cloud(wav_path):
    left_margin = 'The result is: '
    result = ''
    logf = open(TEMP_LOG_FILE, 'w')
    subprocess.call([IFLY_IAT_FILE, wav_path], stdout=logf)
    logf = open(TEMP_LOG_FILE, 'r')
    for line in logf:
        if line.startswith(left_margin):
            result = line.lstrip(left_margin).rstrip()
            break
    logf.close()
    if result != '':
        return result.decode('utf-8')
    else:
        print 'call cloud fail'


if __name__ == '__main__':
    base_dir = sys.argv[1]
    init_all(base_dir)
    loop_all(base_dir)


