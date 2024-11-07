#!/bin/bash

#ANS 
if [ -f "ans.txt" ]
then
	ANS=$(cat "ans.txt")
else
	ANS=0
fi

#GET OPERATION
read num1 operator num2

#EXIT 
if [ $num 1 == "EXIT" ]
then
	exit 0
fi 

#HISTORY
if [ $num1 == "HIST" ]
then 
	tail -n 5 "history.txt"
	exit 0
fi


n1=$num1
n2=$num2
if [ $n1 == "ANS" ] 
then
	n1=$ANS
fi
if [ $n2 == "ANS" ]
then
	n2=$ANS
fi

#CALCULATE
case $operator in
    "+") ANS=$(($n1 + $n2)) ;;
    "-") ANS=$(($n1 - $n2)) ;;
    "x") ANS=$(($n1 * $n2)) ;;
    "%") ANS=$(($n1 % $n2)) ;;
    
    "/")
	#Math Error
	if [ $n2 -eq 0 ]
	then
		echo "MATH ERROR"
		exit 1
	fi
	#Math Non-error
	ANS=$(echo "scale=2; $num1 / $num2" | bc);;
    

    *)  #SYNTAX ERROR
	    	echo "SYNTAX ERROR"
	    	exit 1
esac



#save to file
echo $num1 $operator $num2 "=" $ANS >> history.txt
echo $ANS > ans.txt
# Output the result
echo $ANS
