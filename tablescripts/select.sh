#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

dbname=$1

echo -e "${BLUE}------------------ SELECT-----------------${ENDC}"
select  selection in all record cell columns
do
        case $selection in
                all )
                        echo -e "${BLUE}Enter table name${ENDC}"
                        read tbname
                        bash tablescripts/selall.sh $dbname $tbname
                        ;;
                record )
                        echo -e "${BLUE}Enter table name${ENDC}"
                        read tbname
                        bash tablescripts/selrec.sh $dbname $tbname
                        ;;
                cell )
                        echo -e "${BLUE}Enter table name${ENDC}"
                        read tbname
                        bash tablescripts/selcell.sh $dbname $tbname
                        ;;
                columns )
                        echo -e "${BLUE}Enter table name${ENDC}"
                        read tbname
                        bash tablescripts/selcols.sh $dbname $tbname
                        ;;

                * )
                        echo -e "${RED}invalid option, pleasy try again${ENDC}"

                        ;;
        esac
done
