#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

function create(){
	if [[ -d databases/$1 ]]; then
                echo -e "${RED}Database $1 already exists${ENDC}";
        else
            	mkdir databases/$1
				echo -e "${GREEN}Database $1 created succefuly${ENDC}";
		
        fi
}

if [[ -d databases ]];
then
	create $1
else
	mkdir databases
	create $1
fi
