#!/bin/sh
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" >robot.xml
awk 'BEGIN{print "<wordlist>"} {print "<wordname>"$2"</wordname>"} END{print "</wordlist>"}' robot.txt >>robot.xml
