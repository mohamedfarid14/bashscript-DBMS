#!/usr/bin/bash 

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1

echo -e "${BLUE}enter the table name or hit enter again to list all tables${ENDC}"
read table_name
   

if [ -z "$table_name" ]
   then  #if user dosent input any char and pressed enter again will list all the tables in the database 
	ls databases/$dbname
elif [ -f databases/$dbname/$table_name ];
   then
       ls databases/$dbname  #if the file exist list it to the user 
    else 
     echo -e "${RED}there is no table exists by this name${ENDC}"  #if there is no table find by this name or user enterd wrong format ex.5,-,+,/,*,.,(,),
 
fi     
