all:
	flex calc.l
	bison -d calc.y
	gcc lex.yy.c calc.tab.c -o calc

clean:
	rm calc
	rm calc.tab.c calc.tab.h
	rm lex.yy.c lex.yy.o
