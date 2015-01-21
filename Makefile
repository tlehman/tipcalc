all: lex.yy.c y.tab.c
	cc lex.yy.c y.tab.c -o tipcalc

clean:
	rm *.c *.h tipcalc

tipcalc: lex.yy.c y.tab.c

y.tab.c:
	yacc -d parse.y

lex.yy.c:
	lex tokenizer.l
