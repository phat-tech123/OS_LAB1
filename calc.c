#include <stdio.h>
#include "calc_logic.h"

int main(){
	double num1, num2, result;
	char op;

	scanf("%lf %c %lf", &num1, &op, &num2);

	switch (op) {
		case '+':
			result = add(num1, num2); 
			break;
		case '-':
			result = subtract(num1, num2);
			break;
		case 'x':
			result = mutiply(num1, num2);
		case '/':
			result = divide(num1, num2);
			break;
		case '%': 
			result = modulo(num1, num2);
			break;
		default:
			syntax_error();
			break;
	}


	printf("%lf\n", result);
}

