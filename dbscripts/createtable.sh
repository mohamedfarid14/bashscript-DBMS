#!/bin/bash

dbname=$1


while [ true ]
do
	printf "Enter the name of Table: " 
	read Table_Name  #read table name 
	if [ -z "$Table_Name" ]; #check if the enter any string or not 
                 then
		echo please enter the Name of the Table.
	elif [[ $Table_Name == *" "* ]] || [[ $Table_Name == [0-9]* ]] || [[ $Table_Name == *['!'';''.'@\$%^\&*()+-='\'?'/''`'~:,'<''>''['']']* ]] ;
              #check on the format of table name  by using or operator and patterns 
                 then
		echo please enter a valid table name
	elif [[ -f $Table_Name ]]; #check on table existance 
               then
	        echo the Table Name already exists
	else
	 break #exit from the loop Which was her mission is to check on integrity of table name 

       fi
done

while [ true ]
       do 

         read -p "Enter the number of columns:" ColNum #ask user about number of table coulmns 

                if ! [[ "$ColNum" =~ ^[0-9]+$ ]]; #check if the user entred a right format for coulmn number 
                       then
                         echo Column number must be positive integer number 
              elif [[ $ColNum -eq 0 ]] #check if user input 0 coulmn 
                      then 
                     echo Wrong! Please Enter at least 1 column 
              else
                     break
               fi
done


i=1;
seperator=":"
tableinfo=""
tabledt=""
PK="true"
declare -A ColumnsNames

let temp=1

while [ $i -le $ColNum ]
do
	read -p "Enter the name col no:$i " col_name  #read col name 
        
if [[ " ${ColumnsNames[*]} " =~ " ${col_name} " ]];
 then 
   echo Coulmn Name Already Exists 
   temp=0
   break
else

      if [ -z "$col_name" ]; #check if the user enter any string 
                 then
                 temp=0
		echo please enter the Name of the column.
            break
            
	elif [[ $col_name == *" "* ]] || [[ $col_name == [0-9]* ]] || [[ $col_name == *['!'';''.'@\$%^\&*()+-='\'?'/''`'~:,'<''>''['']']* ]] ;
              #check on the format of col name  by using or operator and patterns 
                 then
                 temp=0
		echo please enter a valid column name
            break
      
	else

      echo " enter datatype of cloumn $col_name -->  (1)int,(2)string" 
      select type in int string
       do
       case $type in
                 int )
                      typecol="int"
                      echo okay
                      break ;;
               string )
                       typecol="string"
                       echo okay
                       break ;;
                 * )
                        echo "invalid input "   ;;
       esac

        
      done
   
      fi

 if [ $temp -eq 1 ]
      then
        echo " do you want to make it primaryKey"
         select choice in Yes No
         do
         case $choice in
                    [Yy]* )
                     PK="Pk"
                     tableinfo+=$col_name$seperator
                     tabledt+=$typecol$seperator
                     break
                          ;;
                     [Nn]* ) 
                               tableinfo+=$col_name$seperator
                               tabledt+=$typecol$seperator
                               break
                               ;;
                              
                        * )
                            echo "invalid choice"
                            ;;
          esac
       done
fi

fi

length=${#ColumnsNames[@]}

for ((j=0; j<=${length}; j++ )) 
do  
ColumnsNames[$j]=$col_name
done


          ((i=i+1))  

done
  

if [ $? -eq 0 ] && [ $temp -eq 1 ]
      then 
           if [ -f databases/$dbname/$Table_Name ]
                then 
                 echo Can not create the table, $Table_Name already exists  
               else 
          touch databases/$dbname/$Table_Name  
          touch databases/datatypes
          echo $tableinfo >>databases/$dbname/$Table_Name
          echo $Table_Name$seperator$tabledt >> databases/datatypes
       echo "Table Created Successfuly"
           fi   
    
     else
       echo "  Can Not Create $Table_Name"
fi




   
  
        





