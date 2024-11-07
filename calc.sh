#!/bin/bash

# Initialize ANS to 0

if [ -f "ans.txt" ]
then
	ANS=$(cat "ans.txt")
else
	ANS=0
fi
# Prompt for user input
read num1 operator num2

if [ $num1 == "HIST" ]
then 
	tail -n 5 "history.txt"
	exit 0
fi


n1=$num1
n2=$num2

# Check if num1 is "ANS" and replace it with the value stored in ANS
if [ $n1 == "ANS" ] 
then
	n1=$ANS
fi

if [ $n2 == "ANS" ]
then
	n2=$ANS
fi

# Perform the calculation based on the operator
case $operator in
    "+") ANS=$(($n1 + $n2)) ;;
    "-") ANS=$(($n1 - $n2)) ;;
    "x") ANS=$(($n1 * $n2)) ;;
    "/") ANS=$(($n1 / $n2)) ;;
    "%") ANS=$(($n1 % $n2)) ;;
esac



#save to file
echo $num1 $operator $num2 "=" $ANS >> history.txt
echo $ANS > ans.txt
# Output the result
echo $ANS
