all:
	flex calc.l
	bison -d calc.y
	gcc -c lex.yy.c calc.tab.c
	g++ -c calc.cpp
	gcc lex.yy.o calc.tab.o calc.o -lstdc++ -o calc

clean:
	rm -f calc
	rm -f calc.tab.c calc.tab.h
	rm -f lex.yy.c lex.yy.o calc.o
