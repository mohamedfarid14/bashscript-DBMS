#!/usr/bin/bash

dbname=$1

echo "Enter the Table Name"
read  tname

if [ ! -f databases/$dbname/$tname ]
then 
echo There is no table exist by this name 
else
echo "---------------------"
cat databases/$dbname/$tname
echo "---------------------"
echo "Enter the old value in the record you want to change:"
read oldvalue
if grep -q "$oldvalue" databases/$dbname/$tname 
then
echo "Enter the new value you want to add:"
read newvalue
if [ -z "$newvalue" ]
then 
echo "Please Enter a real value cannot update with empty value "
else 
sed -e "s/$oldvalue/$newvalue/g" databases/$dbname/$tname > databases/$dbname/temp_file
mv databases/$dbname/temp_file databases/$dbname/$tname
echo "--------- $tname successfully updated ----------"
fi
else
    echo "Can Not Found $oldvalue in your table"
fi

fi



