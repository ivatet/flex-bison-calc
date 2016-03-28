%{
	#include "calc.tab.h"
%}

%option noyywrap

%x c_comment
%x cxx_comment

%%

		/* C-style comments */
"/*"		BEGIN(c_comment);
<c_comment>"*/"	BEGIN(INITIAL);
<c_comment>.	;
<c_comment>\n	;

		/* C++ comments */
"//"		BEGIN(cxx_comment);
<cxx_comment>.	;
<cxx_comment>\n	BEGIN(INITIAL);

		/* variables */
[a-z][0-9a-z]*	{
			yylval.string = strdup(yytext);
			return VARIABLE;
		}

		/* integers */
-?[0-9]++	{
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
