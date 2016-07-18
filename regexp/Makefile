
all : parser.java

parser.java : scanner.jflex parser.cup 
	jflex scanner.jflex 
	java java_cup.Main -expect 4 parser.cup 
	javac *.java 


draw : scanner.jflex parser.cup 
	jflex scanner.jflex 
	java java_cup.MainDrawTree -expect 4 parser.cup 
	javac *.java 


