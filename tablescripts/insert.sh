#!/bin/bash

#echo "Available tables in here will go the database name "
#ls here we will list the tables (files) in the database (directory)

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1
echo -e "${BLUE}Enter table Name: ${ENDC}"
read table_name
if [[ -f databases/$dbname/$table_name ]]; then
	typeset -i nf=`awk -F: '{if(NR==1){print NF}}' databases/$dbname/$table_name;`
	((nf=nf-1))
	
	typeset -i dtrn=`awk -F: '/'$table_name'/{print NR} ' databases/datatypes;`
	

	for (( i = 1; i <= $nf; i++ )); do
	 	colname=`awk -F: -v"i=$i" '{if(NR==1){print $i}}' databases/$dbname/$table_name;`
		
	 	coltype=`awk -F: -v"i=$i" '{if(NR=='$dtrn'){print $(i+1)}}' databases/datatypes;`
			echo -e "${BLUE}Enter $colname: ${ENDC}"
	 		read value;
			 flag2=0

			while [ $flag2 -eq 0 ]
			do

				if [[ $coltype = "int" && "$value" = +([0-9]) || $coltype = "string" && "$value" = +([a-zA-Z]) ]]; then
				flag1=0
				
				
					while [ $flag1 -eq 0 ]
					do
						if [ "$(awk -F: '{if($1=="'$value'"){print "found";exit}}' "databases/$dbname/$table_name")" = "found" ]; then
								echo -e "${RED}Invalid input, primary key already exists${ENDC}"
								echo -e "${BLUE}Enter $colname: ${ENDC}"
								read value
							else 
									flag1=1
						fi
					done
					if [[ $i != $nf ]]; then
							echo -n $value":" >> databases/$dbname/$table_name;
							flag2=1
						else
							echo $value >> databases/$dbname/$table_name;
							flag2=1
					fi

				else 
					echo -e "${RED}data type invalid${ENDC}"
					echo -e "${BLUE}Enter $colname: ${ENDC}"
					read  value			
				fi
			done
	done
 	
else
	echo -e "${RED}'databases/$dbname/$table_name' doesn't exist${ENDC}";
fi



