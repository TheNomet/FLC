#!/bin/bash

# YOU MUST HAVE in your working dir:
# scanner.jflex
# parser.cup
# Main.java
# a link to this script (or this script)

# pass the INPUT file to be elaborated as first parameter of this script

jflex scanner.jflex
java java_cup.Main -expect 4 parser.cup
javac *.java
java Main $1
