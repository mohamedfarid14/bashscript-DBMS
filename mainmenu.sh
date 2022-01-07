#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

echo -e "${BLUE}------------------ welcome to BASH DBMS-----------------${ENDC}"
select  selection in createDB useDB renameDB  dropDB listDB
do
	case $selection in
		createDB )
			echo -e "${BLUE}Enter database name to create${ENDC}"
			read dbname1
			bash dbscripts/createdb.sh $dbname1
			;;
		useDB )
			echo -e "${BLUE}Enter database to connect to${ENDC}"
			read dbconnect
			bash dbscripts/usermenu.sh $dbconnect
			;;
		renameDB )
		        bash dbscripts/renamedb.sh
			;;
		dropDB )
			echo -e "${BLUE}Enter database name to drop${ENDC}"
			read dbname2
			bash dbscripts/dropdb.sh $dbname2
			;;
		listDB )
			if [[ -d databases ]];then
				ls databases
			else echo -e "${RED}No databases exists${ENDC}"
			fi
			;;
		* )
			echo -e "${RED}invalid option, pleasy try again${ENDC}"

			;;
	esac
done
