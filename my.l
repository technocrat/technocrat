/* section 1 of three; other two divided by %%; can't have internal comments */
/* #define SUBHEAD "& ('%') & ('%') & ('%') & ('%')" */
/* NB: cannot link to -lfl, use -ll */
%{
#define STUBHEAD "Causes of death & "
#define SUBHEAD "& ('%') & ('%') & ('%') & ('%')"
%}


%%
^%.*$		{ printf("")    ; }
^" &"		{ printf("Cause of death & ", yytext);}
^"Cause".*$     { printf("FOO");}
"{r"  		{ printf("{l"  ); }
"& 0.00"	{ printf("& . "); }  
"\\label{2}"	{ printf("")    ; }
%%

int main()
{
  yylex();
}
