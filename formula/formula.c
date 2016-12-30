#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#include "nCr.h"

/*
*	This program calculates and displays the expanded form of (1 + x)^n
*	@params int n, must be positive or returns 0
*	
*	If during the calculation overflow condition is met, returns 0
*	12 is highest n that will not overflow
	Type -h for arg if 
*/

int main(int argc, char **argv){

	struct timeval tv1, tv2;
	gettimeofday(&tv1, NULL);
	
	if ((strcmp(argv[1], "-h") == 0)){
		printf("Usage: formula <positive integer>\n");
		return 0;
	}
	
	int n = atoi(argv[1]);
	if (n < 0 || argc != 2){
		return 0;
	}
	int coef[127];
	int i;
	for (i = 0;  i <= n; i++){
		coef[i] = nCr(n, i);
		if (coef[i] == 0){
			return 0;
		}
	}
	
	printf("(1 + x)^%d =  1", n);
	for (i = 1; i <= n; i++){
		printf(" + %d*x^%d", coef[i], i);
	}
	gettimeofday(&tv2, NULL);
	int t = tv2.tv_usec - tv1.tv_usec;
	printf("\nTime required: %d microseconds\n", t);
	
	return 0;
	
}
