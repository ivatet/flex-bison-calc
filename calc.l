%{
	#include "calc.tab.h"
%}

%option noyywrap

%%

		/* variables */
[a-z][0-9a-z]*	{
			yylval.string = strdup(yytext);
			return VARIABLE;
		}

		/* integers */
[0-9]+		{
			yylval.number = atoi(yytext);
			return INTEGER;
		}

		/* operators */
[-+()*=/\n]	{
			return *yytext;
		}

		/* skip whitespace */
[ \t]		;

		/* anything else is an error */
.		{
			yyerror("invalid character");
		}
