#!/usr/bin/bash

dbname=$1

if [ ! -d databases/$dbname ]
 then 
 echo There is No DataBase Exists by this Name 
 else
  
  select choice in Create_Table List_Table Drop_Table Insert_into_Table Select_from_Table Delete_from_Table Update_Table
  do
       case $choice in

        Create_Table)

                bash dbscripts/createtable.sh $dbname                            
                ;;
        List_Table) 
                bash tablescripts/listtable.sh $dbname 
                ;;
        Drop_Table) 
 
                bash tablescripts/droptable.sh $dbname 
                ;;
        Insert_into_Table) 
                bash tablescripts/insert.sh $dbname
                ;;
        Select_from_Table)
                bash tablescripts/select.sh $dbname
                ;;
        Delete_from_Table) 
                bash tablescripts/delrec.sh $dbname
                ;;
        Update_Table) 
                bash tablescripts/update.sh $dbname
                ;;
        *) echo invalid option try again!
                ;;

esac
done




fi
