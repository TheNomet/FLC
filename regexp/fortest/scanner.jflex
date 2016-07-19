
%%

%standalone
%unicode

nl = \r|\n|\r\n
space = " "|\t

num = [0-9]|[1-9][0-9]|[1-4][0-9][0-9]|5(0[0-9]|[1-4][0-9]|5[0-5])

%%

^{num}$ {System.out.println("NUM"+yytext());}

//UTILS
{nl}  				{;}
{space} 			{;}
. 					{System.out.println("error:"+yytext()); System.out.print(" ");}
//UTILS
