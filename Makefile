all: lex.yy.c parse.tab.c
	cc lex.yy.c parse.tab.c -o tipcalc

test: all
	echo '$$7.75 + 20%' | ./tipcalc

clean:
	rm *.c *.h tipcalc

tipcalc: lex.yy.c y.tab.c

parse.tab.c:
	bison -d parse.y

lex.yy.c:
	lex tokenizer.l
