# Assignment-COMP2140

--------------------------------------------------------------

How the files are generated:


A5Scanner.java was generated by executing the command:

>java JLex.Main A5.lex

and then rename the file generated: "A5.lex.java" as "A5Scanner.java"


A5Sym.java was generated by executing the command: 

>java java_cup.Main -parser Parser -symbols A5Sym < A5.cup


(A5Parser.java, A5.java, A5.lex and A5.cup were written manually.)

--------------------------------------------------------------

How to run the program:


Execute the commands:

>javac A5.java A5Scanner.java A5Sym.java Symbol.java

>java A5


(input file: A5.tiny, output file: a5.output)

--------------------------------------------------------------

