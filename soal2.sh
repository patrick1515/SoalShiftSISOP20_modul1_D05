#!/bin/bash

x=$(echo $1|grep -oP  '.*(?=\.txt)')
if [[ $x =~ ^[a-zA-Z]+$ ]]
then
        char=(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q$        for ((i = 1; i <= 28 ; i++)) do
                rand=$[$RANDOM%${#char[@]}]
                password="${password}${char[$rand]}"
        done
        echo $password>$1
else
        echo "Error"
fi
