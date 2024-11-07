#include <stdio.h>
#include "calc_logic.h"
#include <string.h>
#include <stdlib.h>

int main(){
	double num1, num2, result;
	char n1[3], n2[3];
	char op;
	scanf("%s %c %s", n1, &op, n2);

	if (strcmp(n1, "ANS") != 0) {
	    	char *end;
   		num1 = strtod(n1, &end);
	} else {
		FILE *file = fopen("history.txt", "r");
		fscanf(file, "%lf", &num1);
		fclose(file);
	}

	if (strcmp(n2, "ANS") != 0) {
    		char *end;
   		num2 = strtod(n2, &end);
	} else {
		FILE *file = fopen("history.txt", "r");
    		fscanf(file, "%lf", &num2);
		fclose(file);
	}

	switch (op) {
		case '+':
			result = add(num1, num2); 
			break;
		case '-':
			result = subtract(num1, num2);
			break;
		case 'x':
			result = multiply(num1, num2);
			break;
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

	FILE* file  = fopen("history.txt",  "w");

	if(file == NULL){
		perror("Error opening file");
		return 1;
	}
	fprintf(file, "%lf\n", result);
	fclose(file);
	printf("%lf\n", result);
}

