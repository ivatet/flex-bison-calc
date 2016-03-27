%{
	#include "calc.h"
%}

%union
{
	int number;
	char *string;
}

%token <number> INTEGER
%token <string> VARIABLE

%type <number> expr

%left '+' '-'
%left '*' '/'

%start program

%%

program
	: program statement '\n'
	| program error '\n'
	| program '\n'
	| statement '\n'
	| error '\n'
	| '\n'
	;

statement
	: expr			{ calc_expr($1); }
	| VARIABLE '=' expr	{
					calc_set_var($1, $3);
					free($1);
				}
	;

expr
	: INTEGER
	| VARIABLE		{
					int val;
					int rc;

					rc = calc_get_var($1, &val);

					free($1);

					if (!rc) {
						$$ = val;
					} else {
						$$ = 0;
					}
				}
	| expr '+' expr		{ $$ = $1 + $3; }
	| expr '-' expr		{ $$ = $1 - $3; }
	| expr '*' expr		{ $$ = $1 * $3; }
	| expr '/' expr		{ $$ = $1 / $3; }
	| '(' expr ')'		{ $$ = $2; }
	;

%%

void yyerror(char *s)
{
	calc_error(s);
}
