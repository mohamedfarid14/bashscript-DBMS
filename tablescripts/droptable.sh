#!/usr/bin/bash 
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1

echo -e "${BLUE}enter the table name: ${ENDC}"
read table_name

if [ -z "$table_name" ];
   then #chech on user input if empty or not 
	echo -e "${BLUE}please enter the Name of the Table${ENDC}"
   
elif [ -f databases/$dbname/$table_name ];
   then
       rm databases/$dbname/$table_name  # if table  exist will remove it 
       echo -e "${GREEN}table $table_name removed successfully${ENDC}"  
    else 
     echo -e "${RED}there is no table exists by this name${ENDC}" # if there is no table by this name 
     
fi     


      