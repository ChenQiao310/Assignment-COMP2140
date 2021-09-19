import java_cup.runtime.Symbol;
import java_cup.runtime.Scanner;
%%
%implements java_cup.runtime.Scanner 
%type Symbol
%function yylex 
%class A5Scanner
%state COMMENT 
%eofval{ return null; 
%eofval}

IDENTIFIER = [a-zA-Z][a-zA-Z0-9]*
NUMBER = [0-9]+(\.[0-9]+)?
%%
<YYINITIAL>"/**" {yybegin(COMMENT);}
<COMMENT>"**/" {yybegin(YYINITIAL);}
<COMMENT>\r|\n|. {}
<YYINITIAL>\"[^\"]*\" { return new Symbol(A5Sym.Qstring, yytext());}

<YYINITIAL>"BEGIN" { return new Symbol(A5Sym.BEGIN); }
<YYINITIAL>"END" { return new Symbol(A5Sym.END); }
<YYINITIAL>"INT" { return new Symbol(A5Sym.INT); }
<YYINITIAL>"REAL" { return new Symbol(A5Sym.REAL); }
<YYINITIAL>"STRING" { return new Symbol(A5Sym.STRING); }
<YYINITIAL>"RETURN" { return new Symbol(A5Sym.RETURN); }
<YYINITIAL>"IF" { return new Symbol(A5Sym.IF); }
<YYINITIAL>"ELSE" { return new Symbol(A5Sym.ELSE); }
<YYINITIAL>"WRITE" { return new Symbol(A5Sym.WRITE); }
<YYINITIAL>"READ" { return new Symbol(A5Sym.READ); }
<YYINITIAL>"MAIN" { return new Symbol(A5Sym.MAIN); }
<YYINITIAL>"TRUE" { return new Symbol(A5Sym.TRUE); }
<YYINITIAL>"FALSE" { return new Symbol(A5Sym.FALSE); }

<YYINITIAL>"+" { return new Symbol(A5Sym.PLUS); }
<YYINITIAL>"-" { return new Symbol(A5Sym.MINUS); }
<YYINITIAL>"*" { return new Symbol(A5Sym.TIMES); }
<YYINITIAL>"/" { return new Symbol(A5Sym.DIVIDE); }
<YYINITIAL>"(" { return new Symbol(A5Sym.LPAREN); }
<YYINITIAL>")" { return new Symbol(A5Sym.RPAREN); }
<YYINITIAL>"," { return new Symbol(A5Sym.COMMA); }
<YYINITIAL>";" { return new Symbol(A5Sym.SEMI); }
<YYINITIAL>"==" { return new Symbol(A5Sym.EQ); }
<YYINITIAL>"!=" { return new Symbol(A5Sym.NOTEQ); }
<YYINITIAL>":=" { return new Symbol(A5Sym.ASSIGN); }

<YYINITIAL>{NUMBER} { return new Symbol(A5Sym.NUMBER, yytext());} 
<YYINITIAL>{IDENTIFIER} { return new Symbol(A5Sym.ID, yytext());}
<YYINITIAL>\r|\n|\t|" " {}
<YYINITIAL>. { return new Symbol(A5Sym.error); }