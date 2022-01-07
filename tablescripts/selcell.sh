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
        flag=`awk -F: '$1=="'$pk'" {print 1}' databases/$dbname/$tbname `
        if [[ $flag -ne 1 ]];then
        echo -e "${RED}invalid primary key, please try again${ENDC}"
        else
                echo -e "${BLUE}Choose attribute${ENDC}"
                read att
                var=`awk -F: 'NR==1 {for (i=1; i<=NF; i++){ if ($i=="'$att'") print i }}' databases/$dbname/$tbname `
                if [[ -z $var ]];then
                echo -e "${RED}Invalid attribute, please try again${ENDC}"
                fi
                if [[ $flag -eq 1 && -n $var ]];then
                awk -F: '$1=="'$pk'" {print $"'$var'"}' databases/$dbname/$tbname 
                fi  
        fi
        
else echo -e "${RED}table databases/$dbname/$tbname doesn't exist${ENDC}"
fi
