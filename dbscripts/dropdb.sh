#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[94m"
ENDC="\e[0m"

if [[ -d databases/$1 ]]; then
		rm -r databases/$1
		echo -e "${GREEN}Database $1 deleted succefully${ENDC}"
else
	echo -e "${RED}databse doesn't exist${ENDC}"
fi
