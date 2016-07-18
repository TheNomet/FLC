
all : parser.java

parser.java : scanner.jflex
	jflex scanner.jflex 
	java java_cup.Main -expect 4 parser.cup 
	javac *.java 



