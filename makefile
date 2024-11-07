calc: 	
	g++ calc.c calc_logic.c -o calc
all:
	./calc
clean:
	rm -f calc
