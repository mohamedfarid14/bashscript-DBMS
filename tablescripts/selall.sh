#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1
tbname=$2

if [[ -f databases/$dbname/$tbname ]];then
            cat databases/$dbname/$tbname;
else echo -e "${RED}table '$tbname' doesn't exist${ENDC}"
fi

