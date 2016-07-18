#!/bin/bash

# YOU MUST HAVE in your working dir:
# scanner.jflex
# parser.cup
# Main.java
# regexp.c
# Makefile
# a link to this script (or this script)

# pass the INPUT file to be elaborated as first parameter of this script
rm input.txt
touch input.txt
if [ $# -lt 3 ]; then
	echo "Syntax: ./do.sh <from> <to> <varname> [<1 -from odd numbers> <0 -for even numbers>]? "
	exit
elif [ $# -eq 3 ]; then #all the numbers
	NUM=2
	echo ALL > input.txt
elif [ $# -eq 4 ]; then #only odd or even
	if [ $4 -eq 0 ]; then #odd
		NUM=0;
		echo EVEN > input.txt
	else #even
		NUM=1;
		echo ODD > input.txt
	fi
fi

gcc -o regexp regexp.c
./regexp $1 $2 1 >> input.txt
echo END >> input.txt

#cat input.txt
make 1> /dev/null 2>/dev/null
final="$(java Main input.txt)" 

IFS='='
flag=0
for word in $final 
	do if [ $flag -eq 0 ]; then
			flag=1;
			echo -n "$3 = "
		else
			echo -n "$word"
		fi
done
echo ""
