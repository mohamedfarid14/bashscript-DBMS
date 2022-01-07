#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

echo -e "${BLUE}Enter database name you want to change${ENDC}"
	read dboldname
if [[ -d databases/$dboldname ]];then
                                echo -e "${BLUE}Enter new name${ENDC}"
                                read dbnewname
                                mv databases/$dboldname databases/$dbnewname
                                echo -e  "${GREEN}Database $dboldname renamed succefully to $dbnewname${ENDC}"
                        else echo -e "${RED}databse $dboldname doesn't exist${ENDC}"
                        fi
