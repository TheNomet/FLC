#!/bin/bash



if [ $# -eq 3 ]; then
	final="$(./do.sh $1 $2 num $3)"
elif [ $# -eq 2 ]; then
	final="$(./do.sh $1 $2 num)"
else 
	echo "Syntax: ./from.sh <from> <to> [<1 -from odd numbers> <0 -for even numbers>]? "
	exit
fi

cd ./fortest

touch test.txt 1> /dev/null 2> /dev/null
touch scanner.jflex 1> /dev/null 2> /dev/null

var="$(echo $final | sed "s/ =[^\n]*//g")"
cat partial.jflex | sed "s/|--|/$final/g" | sed "s/-||-/^{$var}$ {System.out.println(\"NUM\"+yytext());}/g" > scanner.jflex


seq $1 $2 > test.txt

jflex scanner.jflex 1>/dev/null 
javac Yylex.java 1>/dev/null 2>/dev/null
errors="$(java Yylex test.txt | grep error | wc -l)"
if [ $errors -gt 0 ]; then
	echo "ERRORS found -> the regular expression wasn't correct"
else 
	echo "Everything is OK!"
fi
 cd ..
