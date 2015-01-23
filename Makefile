all: lex.yy.c parse.tab.c
	cc lex.yy.c parse.tab.c -o tipcalc

test: all
	echo '$$6.10 - 5%' | ./tipcalc
	echo '$$6.10 + 5%' | ./tipcalc

clean:
	rm *.c *.h tipcalc

tipcalc: lex.yy.c y.tab.c

parse.tab.c:
	bison -d parse.y

lex.yy.c:
	lex tokenizer.l
