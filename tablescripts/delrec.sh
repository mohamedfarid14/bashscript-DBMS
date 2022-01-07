#!/bin/bash
#this is DeleteRecord script to delete a record from a table

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1
echo -e "${BLUE}enter table name to delete from: ${ENDC}"
read table_name

if [[ -f databases/$dbname/$table_name ]]; then

    table1=`cat databases/$dbname/$table_name`

    echo -e "${BLUE}Enter the pk of Record to be deleted: ${ENDC}"
    read pk

    awk -F: "{ if ( \$1 != \"$pk\" ) print \$0 }" databases/$dbname/$table_name > temp && mv temp databases/$dbname/$table_name 

    table2=`cat databases/$dbname/$table_name`

    if  [[ $table1 != $table2 ]];
    then 
    echo -e "${GREEN}record is deleted successfully${ENDC}"
    else
    echo -e "${RED}this record cannot be found${ENDC}"
    fi

else
	echo -e "${RED}'databases/$dbname/$table_name' doesn't exist${ENDC}";
fi



