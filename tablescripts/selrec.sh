#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1
tbname=$2

if [[ -f databases/$dbname/$tbname ]];then
	echo -e "${BLUE}Enter record's primary key${ENDC}"
	read pk
	head -1 databases/$dbname/$tbname
		if [[ "$(awk -F: '{if($1=="'$pk'"){print "found";exit}}' "databases/$dbname/$tbname")" = "found" ]];then
			awk -F: '{ if ( $1 == '$pk' ) {print $0;exit}; }' databases/$dbname/$tbname
			else
			echo $pk "not found"
		fi

else echo -e "${RED}table databases/$dbname/$tbname doesn't exist${ENDC}"
fi





