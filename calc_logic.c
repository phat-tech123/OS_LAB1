#include "calc_logic.h"

double add(double a, double b){
	return a+b;
}

double subtract(double a, double b){
	return a-b;
}

double multiply(double a, double b){
	return a*b;
}

double divide(double a, double b){
	if(b == 0){
		printf("MATH ERROR\n");		
		exit(1);
	}
	return a/b;
}

double modulo(double a, double b){
	return (int)a % (int)b;
}

void syntax_error(){
	printf("SYNTAX ERROR\n");
	exit(1);
}
