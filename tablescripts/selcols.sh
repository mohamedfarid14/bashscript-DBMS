#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1
tbname=$2
choice=y
if [[ -f databases/$dbname/$tbname ]];then
echo -e "${BLUE}Enter record's primary key${ENDC}"
        read pk
flag=`awk -F: '$1=="'$pk'" {print 1}' databases/$dbname/$tbname`
        if [[ $flag -ne 1 ]];then
        echo -e "${RED}invalid primary key, please try again${ENDC}"
        else
                while [ "$choice" != "n"  ]
                do
                        echo -e "${BLUE}Choose attribute${ENDC}"
                        read att
                        var=`awk -F: 'NR==1 {for (i=1; i<=NF; i++){ if ($i=="'$att'") print i }}' databases/$dbname/$tbname`
                        awk -F: '$1=="'$pk'" {printf "%s ", $"'$var'"}' databases/$dbname/$tbname >> databases/$dbname/output
                        if [[ -z $var ]];then
                        echo -e "${RED}Invalid attribute, please try again${ENDC}"
                        fi
                        echo -e "${BLUE}Choose more columns? press y to choose, n to display results${ENDC}"
                        read choice
                        while [ "$choice" != "n" -a "$choice" != "y" ]
                        do
                        echo -e "${RED}Invalid choice, please try again${ENDC}"
                        read choice
                        done
                done
        fi
else echo -e "${RED}table databases/$dbname/$tbname doesn't exist${ENDC}"
fi
head -1 databases/$dbname/output
printf "\n"
rm databases/$dbname/output
